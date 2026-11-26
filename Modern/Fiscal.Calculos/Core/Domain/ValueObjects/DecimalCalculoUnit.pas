unit DecimalCalculoUnit;

// Java: source/src/main/java/br/gov/serpro/rtc/shared/util/ArredondamentoUtils.java

interface

uses
  SysUtils;

const
  // 48 casas cobrem as formulas monofasicas com pBio/(1-pBio) (34 digitos, ate 44 casas);
  // inteiros + escala continuam limitados a 64 digitos, com falha explicita acima disso.
  DECIMAL_ESCALA_MAXIMA = 48;
  DECIMAL_DIGITOS_MAXIMOS = 64;

type
  TModoArredondamento = (marHalfEven, marHalfUp, marDown);

  EDecimalCalculo = class(Exception);

  DecimalCalculoLimbos = array[0..15] of Cardinal;

  // Valor decimal com aritmetica exata: base 10000, 16 limbs (64 digitos), escala 0..48.
  // Somar, Subtrair e Multiplicar sao exatas dentro da capacidade; exceder o limite levanta
  // EDecimalCalculo em vez de truncar. Normalizar remove zeros a direita, portanto valores
  // iguais podem ter escalas diferentes; use Comparar para igualdade.
  DecimalCalculo = record
  private
    FLimbs: DecimalCalculoLimbos;
    FNegativo: Boolean;
    FEscala: Byte;
  public
    class function Zero: DecimalCalculo; static;
    class function DeInteiro(AValor: Int64): DecimalCalculo; static;
    class function DeTexto(const ATexto: string): DecimalCalculo; static;
    class function DeCurrency(const AValor: Currency): DecimalCalculo; static;
    // Fronteira legada: usa 15 digitos significativos (representacao decimal curta).
    class function DeDouble(const AValor: Double): DecimalCalculo; static;

    function ParaCurrency: Currency;
    function ParaDouble: Double;
    function ParaTexto(const ACasas: Integer): string;
    function Escala: Byte;
    function Negativo: Boolean;
    function EhZero: Boolean;
    function Absoluto: DecimalCalculo;
    function Negado: DecimalCalculo;

    function Somar(const A: DecimalCalculo): DecimalCalculo;
    function Subtrair(const A: DecimalCalculo): DecimalCalculo;
    function Multiplicar(const A: DecimalCalculo): DecimalCalculo;
    // Divisao longa com 34 digitos significativos e HALF_EVEN.
    function Dividir(const A: DecimalCalculo): DecimalCalculo;
    function Arredondar(ACasas: Integer;
      AModo: TModoArredondamento = marHalfEven): DecimalCalculo;
    function Comparar(const A: DecimalCalculo): Integer;

    // movePointLeft/Right exato: ACasas > 0 multiplica por 10^ACasas,
    // ACasas < 0 divide por 10^(-ACasas), sem arredondar.
    function DeslocarPonto(ACasas: Integer): DecimalCalculo;

    function Igual(const A: DecimalCalculo): Boolean;
    function MaiorQue(const A: DecimalCalculo): Boolean;
    function MenorQue(const A: DecimalCalculo): Boolean;
    function MaiorOuIgual(const A: DecimalCalculo): Boolean;
    function MenorOuIgual(const A: DecimalCalculo): Boolean;
  end;

implementation

uses
  Math;

const
  MSG_OVERFLOW = 'Overflow de capacidade em DecimalCalculo';
  MSG_ESCALA = 'Escala acima de 48 em DecimalCalculo';
  MSG_DIV_ZERO = 'Divisao por zero em DecimalCalculo';
  MSG_TEXTO = 'Texto decimal invalido em DecimalCalculo';

type
  TDigitos = array[0..511] of Byte;

  TDigitosGrandes = record
    D: TDigitos;
    Len: Integer;
  end;

{ ---------- operacoes sobre limbs ---------- }

procedure ZerarLimbs(var L: DecimalCalculoLimbos);
begin
  FillChar(L, SizeOf(L), 0);
end;

function LimbsZero(const L: DecimalCalculoLimbos): Boolean;
var
  I: Integer;
begin
  for I := 0 to 15 do
    if L[I] <> 0 then
    begin
      Result := False;
      Exit;
    end;
  Result := True;
end;

function CompararLimbs(const A, B: DecimalCalculoLimbos): Integer;
var
  I: Integer;
begin
  for I := 15 downto 0 do
    if A[I] <> B[I] then
    begin
      if A[I] > B[I] then
        Result := 1
      else
        Result := -1;
      Exit;
    end;
  Result := 0;
end;

procedure SubtrairLimbs(const A, B: DecimalCalculoLimbos;
  var R: DecimalCalculoLimbos);
var
  I: Integer;
  Cur: Int64;
  Borrow: Int64;
begin
  Borrow := 0;
  for I := 0 to 15 do
  begin
    Cur := Int64(A[I]) - Int64(B[I]) - Borrow;
    if Cur < 0 then
    begin
      Inc(Cur, 10000);
      Borrow := 1;
    end
    else
      Borrow := 0;
    R[I] := Cardinal(Cur);
  end;
end;

function Pot10(APotencia: Integer): Int64;
var
  I: Integer;
begin
  Result := 1;
  for I := 1 to APotencia do
    Result := Result * 10;
end;

// Multiplica a magnitude por 10^APotencia mantendo a escala atual (muda o valor).
function MultiplicarLimbsPor10Potencia(const V: DecimalCalculo;
  APotencia: Integer): DecimalCalculo;
var
  Q, R, I: Integer;
  Temp, Temp2: DecimalCalculoLimbos;
  Cur, Carry: Int64;
begin
  Result := V;
  if APotencia <= 0 then
    Exit;
  Q := APotencia div 4;
  R := APotencia mod 4;
  if R > 0 then
  begin
    Carry := 0;
    for I := 0 to 15 do
    begin
      Cur := Int64(V.FLimbs[I]) * Pot10(R) + Carry;
      Temp[I] := Cardinal(Cur mod 10000);
      Carry := Cur div 10000;
    end;
    if Carry <> 0 then
      raise EDecimalCalculo.Create(MSG_OVERFLOW);
  end
  else
    Temp := V.FLimbs;
  if Q > 0 then
  begin
    ZerarLimbs(Temp2);
    for I := 0 to 15 do
    begin
      if I + Q <= 15 then
        Temp2[I + Q] := Temp[I]
      else if Temp[I] <> 0 then
        raise EDecimalCalculo.Create(MSG_OVERFLOW);
    end;
  end
  else
    Temp2 := Temp;
  Result.FLimbs := Temp2;
end;

// Devolve o mesmo valor com escala ANovaEscala (>= escala atual).
function EscalarPara(const V: DecimalCalculo;
  ANovaEscala: Integer): DecimalCalculo;
begin
  Result := V;
  if ANovaEscala <= V.FEscala then
    Exit;
  Result := MultiplicarLimbsPor10Potencia(V, ANovaEscala - V.FEscala);
  Result.FEscala := Byte(ANovaEscala);
end;

function DividirPorDezSeExato(var V: DecimalCalculo): Boolean;
var
  I: Integer;
  Cur, Rem: Int64;
  Temp: DecimalCalculoLimbos;
begin
  Result := False;
  Rem := 0;
  for I := 15 downto 0 do
  begin
    Cur := Rem * 10000 + Int64(V.FLimbs[I]);
    Temp[I] := Cardinal(Cur div 10);
    Rem := Cur mod 10;
  end;
  if Rem = 0 then
  begin
    V.FLimbs := Temp;
    Result := True;
  end;
end;

procedure Normalizar(var V: DecimalCalculo);
begin
  if LimbsZero(V.FLimbs) then
  begin
    V.FNegativo := False;
    V.FEscala := 0;
    Exit;
  end;
  while (V.FEscala > 0) and DividirPorDezSeExato(V) do
    Dec(V.FEscala);
end;

{ ---------- conversao limbs <-> texto ---------- }

function LimbsParaString(const L: DecimalCalculoLimbos): string;
var
  I: Integer;
  Parte: string;
begin
  if LimbsZero(L) then
  begin
    Result := '0';
    Exit;
  end;
  I := 15;
  while (I > 0) and (L[I] = 0) do
    Dec(I);
  Result := IntToStr(L[I]);
  while I > 0 do
  begin
    Dec(I);
    Parte := IntToStr(L[I]);
    while Length(Parte) < 4 do
      Parte := '0' + Parte;
    Result := Result + Parte;
  end;
end;

function StringParaLimbs(const ADigitos: string): DecimalCalculoLimbos;
var
  I, Inicio, Fim, Indice: Integer;
  Grupo: string;
begin
  ZerarLimbs(Result);
  I := Length(ADigitos);
  Indice := 0;
  while I > 0 do
  begin
    Inicio := I - 3;
    if Inicio < 1 then
      Inicio := 1;
    Fim := I;
    Grupo := Copy(ADigitos, Inicio, Fim - Inicio + 1);
    if Indice > 15 then
      raise EDecimalCalculo.Create(MSG_OVERFLOW);
    Result[Indice] := Cardinal(StrToInt(Grupo));
    Inc(Indice);
    I := Inicio - 1;
  end;
end;

function ConstruirDeStringEscala(const ADigitos: string; AEscala: Integer;
  ANegativo: Boolean): DecimalCalculo;
var
  S: string;
begin
  if AEscala < 0 then
    raise EDecimalCalculo.Create(MSG_ESCALA);
  if AEscala > DECIMAL_ESCALA_MAXIMA then
    raise EDecimalCalculo.Create(MSG_ESCALA);
  S := ADigitos;
  while (Length(S) > 1) and (S[1] = '0') do
    Delete(S, 1, 1);
  if S = '' then
    S := '0';
  if Length(S) > DECIMAL_DIGITOS_MAXIMOS then
    raise EDecimalCalculo.Create(MSG_OVERFLOW);
  Result.FLimbs := StringParaLimbs(S);
  Result.FEscala := Byte(AEscala);
  Result.FNegativo := ANegativo and not LimbsZero(Result.FLimbs);
  Normalizar(Result);
end;

procedure ValorParaPartes(const V: DecimalCalculo; out AInteiro,
  AFracao: string);
var
  Mag: string;
begin
  Mag := LimbsParaString(V.FLimbs);
  while Length(Mag) <= V.FEscala do
    Mag := '0' + Mag;
  if V.FEscala = 0 then
  begin
    AInteiro := Mag;
    AFracao := '';
  end
  else
  begin
    AInteiro := Copy(Mag, 1, Length(Mag) - V.FEscala);
    AFracao := Copy(Mag, Length(Mag) - V.FEscala + 1, V.FEscala);
  end;
end;

procedure IncrementarString(var S: string);
var
  I: Integer;
  Carry: Boolean;
begin
  I := Length(S);
  Carry := True;
  while (I >= 1) and Carry do
  begin
    if S[I] = '9' then
      S[I] := '0'
    else
    begin
      S[I] := Chr(Ord(S[I]) + 1);
      Carry := False;
    end;
    Dec(I);
  end;
  if Carry then
    S := '1' + S;
end;

{ ---------- divisao em digitos decimais ---------- }

procedure DigZerar(var A: TDigitosGrandes);
begin
  A.Len := 0;
end;

procedure DigRemoverZeros(var A: TDigitosGrandes);
begin
  while (A.Len > 0) and (A.D[A.Len - 1] = 0) do
    Dec(A.Len);
end;

procedure DigDeString(const S: string; var A: TDigitosGrandes);
var
  I, N: Integer;
begin
  A.Len := 0;
  N := Length(S);
  for I := N downto 1 do
  begin
    if (S[I] < '0') or (S[I] > '9') then
      raise EDecimalCalculo.Create(MSG_TEXTO);
    A.D[A.Len] := Ord(S[I]) - Ord('0');
    Inc(A.Len);
  end;
  DigRemoverZeros(A);
end;

procedure DigMultiplicar10Adicionar(var A: TDigitosGrandes; ADigito: Byte);
var
  I, Cur, Carry: Integer;
begin
  Carry := ADigito;
  for I := 0 to A.Len - 1 do
  begin
    Cur := A.D[I] * 10 + Carry;
    A.D[I] := Cur mod 10;
    Carry := Cur div 10;
  end;
  while Carry > 0 do
  begin
    A.D[A.Len] := Carry mod 10;
    Carry := Carry div 10;
    Inc(A.Len);
  end;
  DigRemoverZeros(A);
end;

function DigComparar(const A, B: TDigitosGrandes): Integer;
var
  I: Integer;
begin
  if A.Len <> B.Len then
  begin
    if A.Len > B.Len then
      Result := 1
    else
      Result := -1;
    Exit;
  end;
  for I := A.Len - 1 downto 0 do
    if A.D[I] <> B.D[I] then
    begin
      if A.D[I] > B.D[I] then
        Result := 1
      else
        Result := -1;
      Exit;
    end;
  Result := 0;
end;

procedure DigSubtrair(var A: TDigitosGrandes; const B: TDigitosGrandes);
var
  I, Cur, Borrow: Integer;
begin
  Borrow := 0;
  for I := 0 to A.Len - 1 do
  begin
    Cur := A.D[I] - Borrow;
    if I < B.Len then
      Dec(Cur, B.D[I]);
    if Cur < 0 then
    begin
      Inc(Cur, 10);
      Borrow := 1;
    end
    else
      Borrow := 0;
    A.D[I] := Cur;
  end;
  DigRemoverZeros(A);
end;

procedure DividirDigitos(const ANumerador, ADenominador: TDigitosGrandes;
  var AQuociente, AResto: TDigitosGrandes);
var
  I, Q: Integer;
begin
  DigZerar(AQuociente);
  DigZerar(AResto);
  if ADenominador.Len = 0 then
    raise EDecimalCalculo.Create(MSG_DIV_ZERO);
  if ANumerador.Len = 0 then
    Exit;
  AQuociente.Len := ANumerador.Len;
  for I := 0 to ANumerador.Len - 1 do
    AQuociente.D[I] := 0;
  for I := ANumerador.Len - 1 downto 0 do
  begin
    DigMultiplicar10Adicionar(AResto, ANumerador.D[I]);
    Q := 0;
    while DigComparar(AResto, ADenominador) >= 0 do
    begin
      DigSubtrair(AResto, ADenominador);
      Inc(Q);
    end;
    AQuociente.D[I] := Q;
  end;
  DigRemoverZeros(AQuociente);
end;

{ ---------- DecimalCalculo ---------- }

class function DecimalCalculo.Zero: DecimalCalculo;
begin
  FillChar(Result, SizeOf(Result), 0);
end;

class function DecimalCalculo.DeInteiro(AValor: Int64): DecimalCalculo;
var
  S: string;
begin
  if AValor = 0 then
  begin
    Result := Zero;
    Exit;
  end;
  S := IntToStr(AValor);
  if S[1] = '-' then
    Result := ConstruirDeStringEscala(Copy(S, 2, Length(S) - 1), 0, True)
  else
    Result := ConstruirDeStringEscala(S, 0, False);
end;

class function DecimalCalculo.DeTexto(const ATexto: string): DecimalCalculo;
var
  S, Mantissa, ExpoenteStr, Inteiro, Fracao, Digitos: string;
  P, Expo, Escala, PosSeparador: Integer;
  Negativo, NegExp: Boolean;
  I: Integer;
  C: Char;
begin
  S := Trim(ATexto);
  if S = '' then
    raise EDecimalCalculo.Create(MSG_TEXTO);
  Negativo := False;
  if S[1] = '+' then
    Delete(S, 1, 1)
  else if S[1] = '-' then
  begin
    Negativo := True;
    Delete(S, 1, 1);
  end;
  if S = '' then
    raise EDecimalCalculo.Create(MSG_TEXTO);
  Mantissa := S;
  Expo := 0;
  P := Pos('E', UpperCase(Mantissa));
  if P > 0 then
  begin
    ExpoenteStr := Copy(Mantissa, P + 1, Length(Mantissa) - P);
    if ExpoenteStr = '' then
      raise EDecimalCalculo.Create(MSG_TEXTO);
    NegExp := ExpoenteStr[1] = '-';
    if (ExpoenteStr[1] = '-') or (ExpoenteStr[1] = '+') then
      Delete(ExpoenteStr, 1, 1);
    try
      Expo := StrToInt(ExpoenteStr);
    except
      raise EDecimalCalculo.Create(MSG_TEXTO);
    end;
    if NegExp then
      Expo := -Expo;
    Mantissa := Copy(Mantissa, 1, P - 1);
  end;
  PosSeparador := Pos('.', Mantissa);
  if PosSeparador > 0 then
  begin
    Inteiro := Copy(Mantissa, 1, PosSeparador - 1);
    Fracao := Copy(Mantissa, PosSeparador + 1,
      Length(Mantissa) - PosSeparador);
    if Pos('.', Fracao) > 0 then
      raise EDecimalCalculo.Create(MSG_TEXTO);
  end
  else
  begin
    Inteiro := Mantissa;
    Fracao := '';
  end;
  if (Inteiro = '') and (Fracao = '') then
    raise EDecimalCalculo.Create(MSG_TEXTO);
  if Inteiro = '' then
    Inteiro := '0';
  Digitos := Inteiro + Fracao;
  for I := 1 to Length(Digitos) do
  begin
    C := Digitos[I];
    if (C < '0') or (C > '9') then
      raise EDecimalCalculo.Create(MSG_TEXTO);
  end;
  Escala := Length(Fracao) - Expo;
  if Escala < -DECIMAL_DIGITOS_MAXIMOS then
    raise EDecimalCalculo.Create(MSG_OVERFLOW);
  if Escala > DECIMAL_ESCALA_MAXIMA then
    raise EDecimalCalculo.Create(MSG_ESCALA);
  if Escala < 0 then
  begin
    for I := 1 to -Escala do
      Digitos := Digitos + '0';
    Escala := 0;
  end;
  Result := ConstruirDeStringEscala(Digitos, Escala, Negativo);
end;

class function DecimalCalculo.DeCurrency(const AValor: Currency): DecimalCalculo;
var
  Bruto, Absoluto, ParteInteira, Resto: Int64;
  Negativo: Boolean;
  S, Fracao: string;
begin
  Move(AValor, Bruto, SizeOf(Bruto));
  if Bruto = 0 then
  begin
    Result := Zero;
    Exit;
  end;
  Negativo := Bruto < 0;
  if Negativo then
    Absoluto := -Bruto
  else
    Absoluto := Bruto;
  ParteInteira := Absoluto div 10000;
  Resto := Absoluto mod 10000;
  S := IntToStr(ParteInteira);
  if Resto > 0 then
  begin
    Fracao := IntToStr(Resto);
    while Length(Fracao) < 4 do
      Fracao := '0' + Fracao;
    S := S + '.' + Fracao;
  end;
  Result := DeTexto(S);
  if Negativo then
    Result := Result.Negado;
end;

class function DecimalCalculo.DeDouble(const AValor: Double): DecimalCalculo;
var
  S: string;
  Formato: TFormatSettings;
begin
  if AValor <> AValor then
    raise EDecimalCalculo.Create(MSG_TEXTO);
  GetLocaleFormatSettings(SysLocale.DefaultLCID, Formato);
  Formato.DecimalSeparator := '.';
  S := FloatToStrF(AValor, ffGeneral, 15, 0, Formato);
  Result := DeTexto(S);
end;

function DecimalCalculo.Escala: Byte;
begin
  Result := FEscala;
end;

function DecimalCalculo.Negativo: Boolean;
begin
  Result := FNegativo;
end;

function DecimalCalculo.EhZero: Boolean;
begin
  Result := LimbsZero(FLimbs);
end;

function DecimalCalculo.Absoluto: DecimalCalculo;
begin
  Result := Self;
  Result.FNegativo := False;
end;

function DecimalCalculo.Negado: DecimalCalculo;
begin
  Result := Self;
  if not LimbsZero(Result.FLimbs) then
    Result.FNegativo := not Result.FNegativo;
end;

function DecimalCalculo.Somar(const A: DecimalCalculo): DecimalCalculo;
var
  X, Y, R: DecimalCalculo;
  MaxEscala, I: Integer;
  Cur, Carry: Int64;
begin
  if A.EhZero then
  begin
    Result := Self;
    Exit;
  end;
  if EhZero then
  begin
    Result := A;
    Exit;
  end;
  MaxEscala := FEscala;
  if A.FEscala > MaxEscala then
    MaxEscala := A.FEscala;
  X := EscalarPara(Self, MaxEscala);
  Y := EscalarPara(A, MaxEscala);
  R := Zero;
  R.FEscala := Byte(MaxEscala);
  if X.FNegativo = Y.FNegativo then
  begin
    Carry := 0;
    for I := 0 to 15 do
    begin
      Cur := Int64(X.FLimbs[I]) + Int64(Y.FLimbs[I]) + Carry;
      R.FLimbs[I] := Cardinal(Cur mod 10000);
      Carry := Cur div 10000;
    end;
    if Carry <> 0 then
      raise EDecimalCalculo.Create(MSG_OVERFLOW);
    R.FNegativo := X.FNegativo;
  end
  else if CompararLimbs(X.FLimbs, Y.FLimbs) >= 0 then
  begin
    SubtrairLimbs(X.FLimbs, Y.FLimbs, R.FLimbs);
    R.FNegativo := X.FNegativo;
  end
  else
  begin
    SubtrairLimbs(Y.FLimbs, X.FLimbs, R.FLimbs);
    R.FNegativo := Y.FNegativo;
  end;
  Normalizar(R);
  Result := R;
end;

function DecimalCalculo.Subtrair(const A: DecimalCalculo): DecimalCalculo;
begin
  Result := Somar(A.Negado);
end;

function DecimalCalculo.Multiplicar(const A: DecimalCalculo): DecimalCalculo;
var
  Acumulado: array[0..31] of Int64;
  I, J, Escala: Integer;
  Cur, Carry: Int64;
  R: DecimalCalculo;
begin
  if EhZero or A.EhZero then
  begin
    Result := Zero;
    Exit;
  end;
  Escala := Integer(FEscala) + Integer(A.FEscala);
  if Escala > DECIMAL_ESCALA_MAXIMA then
    raise EDecimalCalculo.Create(MSG_ESCALA);
  for I := 0 to 31 do
    Acumulado[I] := 0;
  for I := 0 to 15 do
    for J := 0 to 15 do
      Acumulado[I + J] := Acumulado[I + J] +
        Int64(FLimbs[I]) * Int64(A.FLimbs[J]);
  R := Zero;
  Carry := 0;
  for I := 0 to 31 do
  begin
    Cur := Acumulado[I] + Carry;
    if I <= 15 then
      R.FLimbs[I] := Cardinal(Cur mod 10000)
    else if (Cur mod 10000) <> 0 then
      raise EDecimalCalculo.Create(MSG_OVERFLOW);
    Carry := Cur div 10000;
  end;
  if Carry <> 0 then
    raise EDecimalCalculo.Create(MSG_OVERFLOW);
  R.FEscala := Byte(Escala);
  R.FNegativo := FNegativo xor A.FNegativo;
  Normalizar(R);
  Result := R;
end;

function DecimalCalculo.Dividir(const A: DecimalCalculo): DecimalCalculo;
var
  Num, Den, Quociente, Resto: TDigitosGrandes;
  SNum, SDen, SKept: string;
  La, Lb, T, Shift, Nq, E, I, Nk, Escala: Integer;
  PrimeiroDescartado: Byte;
  Sticky, Subir: Boolean;
  Ultimo: Byte;
  Negativo: Boolean;
begin
  if A.EhZero then
    raise EDecimalCalculo.Create(MSG_DIV_ZERO);
  if EhZero then
  begin
    Result := Zero;
    Exit;
  end;
  SNum := LimbsParaString(FLimbs);
  SDen := LimbsParaString(A.FLimbs);
  La := Length(SNum);
  Lb := Length(SDen);
  Shift := Integer(A.FEscala) - Integer(FEscala);
  T := 44 - (La - Lb);
  if T < 0 then
    T := 0;
  DigDeString(SNum, Num);
  if T > 0 then
  begin
    for I := Num.Len - 1 downto 0 do
      Num.D[I + T] := Num.D[I];
    for I := 0 to T - 1 do
      Num.D[I] := 0;
    Inc(Num.Len, T);
  end;
  DigDeString(SDen, Den);
  DividirDigitos(Num, Den, Quociente, Resto);
  Nq := Quociente.Len;
  if Nq = 0 then
  begin
    Result := Zero;
    Exit;
  end;
  E := (Nq - 1) + (Shift - T);
  if Nq <= 34 then
  begin
    if Resto.Len <> 0 then
      raise EDecimalCalculo.Create(MSG_ESCALA);
    SKept := '';
    for I := Nq - 1 downto 0 do
      SKept := SKept + Chr(Ord('0') + Quociente.D[I]);
  end
  else
  begin
    SKept := '';
    for I := Nq - 1 downto Nq - 34 do
      SKept := SKept + Chr(Ord('0') + Quociente.D[I]);
    PrimeiroDescartado := Quociente.D[Nq - 35];
    Sticky := Resto.Len <> 0;
    for I := 0 to Nq - 36 do
      if Quociente.D[I] <> 0 then
        Sticky := True;
    Subir := False;
    if PrimeiroDescartado > 5 then
      Subir := True
    else if PrimeiroDescartado = 5 then
    begin
      if Sticky then
        Subir := True
      else
      begin
        Ultimo := Ord(SKept[34]) - Ord('0');
        Subir := (Ultimo mod 2) = 1;
      end;
    end;
    if Subir then
    begin
      IncrementarString(SKept);
      if Length(SKept) > 34 then
      begin
        Inc(E);
        SetLength(SKept, 34);
      end;
    end;
  end;
  Nk := Length(SKept);
  Escala := (Nk - 1) - E;
  if Escala < 0 then
  begin
    for I := 1 to -Escala do
      SKept := SKept + '0';
    Escala := 0;
  end;
  if Escala > DECIMAL_ESCALA_MAXIMA then
    raise EDecimalCalculo.Create(MSG_ESCALA);
  Negativo := FNegativo xor A.FNegativo;
  Result := ConstruirDeStringEscala(SKept, Escala, Negativo);
end;

function DecimalCalculo.Arredondar(ACasas: Integer;
  AModo: TModoArredondamento): DecimalCalculo;
var
  Inteiro, Fracao, Mantida, Descartada, Mag: string;
  I, Descartar: Integer;
  Subir, RestoNaoZero: Boolean;
  Ultimo: Char;
begin
  if ACasas < 0 then
    raise EDecimalCalculo.Create(MSG_ESCALA);
  if EhZero then
  begin
    Result := Zero;
    Exit;
  end;
  if ACasas >= FEscala then
  begin
    Result := Self;
    Exit;
  end;
  Descartar := FEscala - ACasas;
  ValorParaPartes(Self, Inteiro, Fracao);
  Mantida := Copy(Fracao, 1, ACasas);
  Descartada := Copy(Fracao, ACasas + 1, Descartar);
  Subir := False;
  if AModo = marDown then
    Subir := False
  else if AModo = marHalfUp then
  begin
    if (Length(Descartada) > 0) and (Descartada[1] >= '5') then
      Subir := True;
  end
  else
  begin
    if Length(Descartada) > 0 then
    begin
      if Descartada[1] > '5' then
        Subir := True
      else if Descartada[1] = '5' then
      begin
        RestoNaoZero := False;
        for I := 2 to Length(Descartada) do
          if Descartada[I] <> '0' then
            RestoNaoZero := True;
        if RestoNaoZero then
          Subir := True
        else
        begin
          if ACasas > 0 then
            Ultimo := Mantida[ACasas]
          else
            Ultimo := Inteiro[Length(Inteiro)];
          Subir := ((Ord(Ultimo) - Ord('0')) mod 2) = 1;
        end;
      end;
    end;
  end;
  Mag := Inteiro + Mantida;
  if Subir then
    IncrementarString(Mag);
  Result := ConstruirDeStringEscala(Mag, ACasas, FNegativo);
end;

function DecimalCalculo.Comparar(const A: DecimalCalculo): Integer;
var
  X, Y: DecimalCalculo;
  MaxEscala, C: Integer;
begin
  if EhZero and A.EhZero then
  begin
    Result := 0;
    Exit;
  end;
  if EhZero then
  begin
    if A.FNegativo then
      Result := 1
    else
      Result := -1;
    Exit;
  end;
  if A.EhZero then
  begin
    if FNegativo then
      Result := -1
    else
      Result := 1;
    Exit;
  end;
  if FNegativo <> A.FNegativo then
  begin
    if FNegativo then
      Result := -1
    else
      Result := 1;
    Exit;
  end;
  MaxEscala := FEscala;
  if A.FEscala > MaxEscala then
    MaxEscala := A.FEscala;
  X := EscalarPara(Self, MaxEscala);
  Y := EscalarPara(A, MaxEscala);
  C := CompararLimbs(X.FLimbs, Y.FLimbs);
  if FNegativo then
    C := -C;
  Result := C;
end;

function DecimalCalculo.DeslocarPonto(ACasas: Integer): DecimalCalculo;
var
  NovaEscala: Integer;
begin
  if EhZero then
  begin
    Result := Zero;
    Exit;
  end;
  if ACasas = 0 then
  begin
    Result := Self;
    Exit;
  end;
  NovaEscala := Integer(FEscala) - ACasas;
  if NovaEscala > DECIMAL_ESCALA_MAXIMA then
    raise EDecimalCalculo.Create(MSG_ESCALA);
  if NovaEscala >= 0 then
  begin
    Result := Self;
    Result.FEscala := Byte(NovaEscala);
  end
  else
  begin
    Result := MultiplicarLimbsPor10Potencia(Self, -NovaEscala);
    Result.FEscala := 0;
  end;
  Normalizar(Result);
end;

function DecimalCalculo.ParaCurrency: Currency;
var
  R: DecimalCalculo;
  S: string;
  P: Integer;
  Negativo: Boolean;
  V: Int64;
begin
  R := Arredondar(4, marHalfEven);
  S := R.ParaTexto(4);
  Negativo := (Length(S) > 0) and (S[1] = '-');
  if Negativo then
    Delete(S, 1, 1);
  P := Pos('.', S);
  if P > 0 then
    Delete(S, P, 1);
  while (Length(S) > 1) and (S[1] = '0') do
    Delete(S, 1, 1);
  V := StrToInt64(S);
  if Negativo then
    V := -V;
  Move(V, Result, SizeOf(Result));
end;

function DecimalCalculo.ParaDouble: Double;
var
  Formato: TFormatSettings;
begin
  GetLocaleFormatSettings(SysLocale.DefaultLCID, Formato);
  Formato.DecimalSeparator := '.';
  Result := StrToFloat(ParaTexto(FEscala), Formato);
end;

function DecimalCalculo.ParaTexto(const ACasas: Integer): string;
var
  R: DecimalCalculo;
  Inteiro, Fracao: string;
begin
  if ACasas < 0 then
    raise EDecimalCalculo.Create(MSG_ESCALA);
  R := Arredondar(ACasas, marHalfEven);
  if R.EhZero then
  begin
    Inteiro := '0';
    Fracao := '';
    while Length(Fracao) < ACasas do
      Fracao := Fracao + '0';
  end
  else
  begin
    ValorParaPartes(R, Inteiro, Fracao);
    while Length(Fracao) < ACasas do
      Fracao := Fracao + '0';
  end;
  if ACasas = 0 then
    Result := Inteiro
  else
    Result := Inteiro + '.' + Fracao;
  if R.FNegativo and not R.EhZero then
    Result := '-' + Result;
end;

function DecimalCalculo.Igual(const A: DecimalCalculo): Boolean;
begin
  Result := Comparar(A) = 0;
end;

function DecimalCalculo.MaiorQue(const A: DecimalCalculo): Boolean;
begin
  Result := Comparar(A) > 0;
end;

function DecimalCalculo.MenorQue(const A: DecimalCalculo): Boolean;
begin
  Result := Comparar(A) < 0;
end;

function DecimalCalculo.MaiorOuIgual(const A: DecimalCalculo): Boolean;
begin
  Result := Comparar(A) >= 0;
end;

function DecimalCalculo.MenorOuIgual(const A: DecimalCalculo): Boolean;
begin
  Result := Comparar(A) <= 0;
end;

end.
