unit ArredondamentoCalculoUnit;

// Java: source/src/main/java/br/gov/serpro/rtc/shared/util/ArredondamentoUtils.java

interface

uses
  DecimalCalculoUnit;

type
  TResultadoRateio = record
    Itens: array of DecimalCalculo;
  end;

  ArredondamentoCalculo = class
  public
    class function ValorFiscal(const A: DecimalCalculo): DecimalCalculo; static;
    class function AliquotaPublicada(const A: DecimalCalculo): DecimalCalculo; static;
    class function Aliquota(const A: DecimalCalculo;
      ACasas: Integer): DecimalCalculo; static;
    class function PercentualParaFracao(const A: DecimalCalculo): DecimalCalculo; static;
    class function FracaoParaPercentual(const A: DecimalCalculo): DecimalCalculo; static;
    class function Totalizar(const AValores: array of DecimalCalculo): DecimalCalculo; static;
    class function TotalizarValorFiscal(
      const AValores: array of DecimalCalculo): DecimalCalculo; static;
    // Pre-condicao: pesos nao negativos e com soma positiva. Valores negativos sao
    // rateados pelo modulo e negados, fechando a soma; nao negativos seguem o oficial.
    // Trunca cada parcela no centavo e distribui os centavos que faltam aos maiores restos.
    // Empate permanece com a parcela de menor indice.
    class procedure RatearValorFiscal(const AValor: DecimalCalculo;
      const APesos: array of DecimalCalculo;
      out AResultado: TResultadoRateio); static;
    class function FormatarMoedaPtBr(const A: DecimalCalculo): string; static;
    class function FormatarPercentualPtBr(const A: DecimalCalculo): string; static;
  end;

implementation

uses
  SysUtils;

const
  MSG_PESOS_VAZIOS = 'Rateio sem pesos';
  MSG_PESO_NEGATIVO = 'Rateio com peso negativo';
  MSG_SOMA_PESOS_ZERO = 'Rateio com soma de pesos zero';

class function ArredondamentoCalculo.ValorFiscal(
  const A: DecimalCalculo): DecimalCalculo;
begin
  Result := A.Arredondar(2, marHalfEven);
end;

class function ArredondamentoCalculo.AliquotaPublicada(
  const A: DecimalCalculo): DecimalCalculo;
begin
  Result := A.Arredondar(4, marHalfEven);
end;

class function ArredondamentoCalculo.Aliquota(const A: DecimalCalculo;
  ACasas: Integer): DecimalCalculo;
begin
  Result := A.Arredondar(ACasas, marHalfEven);
end;

class function ArredondamentoCalculo.PercentualParaFracao(
  const A: DecimalCalculo): DecimalCalculo;
begin
  Result := A.DeslocarPonto(-2);
end;

class function ArredondamentoCalculo.FracaoParaPercentual(
  const A: DecimalCalculo): DecimalCalculo;
begin
  Result := A.DeslocarPonto(2);
end;

class function ArredondamentoCalculo.Totalizar(
  const AValores: array of DecimalCalculo): DecimalCalculo;
var
  I: Integer;
begin
  Result := DecimalCalculo.Zero;
  for I := 0 to High(AValores) do
    Result := Result.Somar(AValores[I]);
end;

class function ArredondamentoCalculo.TotalizarValorFiscal(
  const AValores: array of DecimalCalculo): DecimalCalculo;
begin
  Result := ValorFiscal(Totalizar(AValores));
end;

class procedure ArredondamentoCalculo.RatearValorFiscal(
  const AValor: DecimalCalculo;
  const APesos: array of DecimalCalculo;
  out AResultado: TResultadoRateio);
var
  N, I, J, Posicao, Chave: Integer;
  K, Contador: Int64;
  SomaPesos, Total, Distribuido, Exata, Truncada, Valor: DecimalCalculo;
  Restos: array of DecimalCalculo;
  Ordem: array of Integer;
  Centavo, Falta: DecimalCalculo;
begin
  AResultado.Itens := nil;
  N := Length(APesos);
  if N = 0 then
    raise EDecimalCalculo.Create(MSG_PESOS_VAZIOS);
  for I := 0 to N - 1 do
    if APesos[I].Negativo then
      raise EDecimalCalculo.Create(MSG_PESO_NEGATIVO);
  SomaPesos := Totalizar(APesos);
  if SomaPesos.EhZero then
    raise EDecimalCalculo.Create(MSG_SOMA_PESOS_ZERO);
  if AValor.Negativo then
    Valor := AValor.Absoluto
  else
    Valor := AValor;
  Total := Valor.Arredondar(2, marHalfEven);
  Distribuido := DecimalCalculo.Zero;
  SetLength(AResultado.Itens, N);
  SetLength(Restos, N);
  SetLength(Ordem, N);
  for I := 0 to N - 1 do
  begin
    Exata := Valor.Multiplicar(APesos[I]);
    Exata := Exata.Dividir(SomaPesos);
    Truncada := Exata.Arredondar(2, marDown);
    AResultado.Itens[I] := Truncada;
    Restos[I] := Exata.Subtrair(Truncada);
    Distribuido := Distribuido.Somar(Truncada);
    Ordem[I] := I;
  end;
  for I := 1 to N - 1 do
  begin
    Chave := Ordem[I];
    J := I;
    while (J > 0) and (Restos[Ordem[J - 1]].Comparar(Restos[Chave]) < 0) do
    begin
      Ordem[J] := Ordem[J - 1];
      Dec(J);
    end;
    Ordem[J] := Chave;
  end;
  Centavo := DecimalCalculo.DeTexto('0.01');
  Falta := Total.Subtrair(Distribuido);
  Falta := Falta.DeslocarPonto(2);
  Falta := Falta.Arredondar(0, marDown);
  K := StrToInt64(Falta.ParaTexto(0));
  Contador := 0;
  while Contador < K do
  begin
    Posicao := Ordem[Integer(Contador mod N)];
    Truncada := AResultado.Itens[Posicao];
    AResultado.Itens[Posicao] := Truncada.Somar(Centavo);
    Inc(Contador);
  end;
  if AValor.Negativo then
    for I := 0 to N - 1 do
      AResultado.Itens[I] := AResultado.Itens[I].Negado;
end;

function AgruparMilhar(const ADigitos: string): string;
var
  I, Contador: Integer;
begin
  Result := '';
  Contador := 0;
  for I := Length(ADigitos) downto 1 do
  begin
    Result := ADigitos[I] + Result;
    Inc(Contador);
    if (Contador mod 3 = 0) and (I > 1) then
      Result := '.' + Result;
  end;
end;

class function ArredondamentoCalculo.FormatarMoedaPtBr(
  const A: DecimalCalculo): string;
var
  S, Inteiro, Fracao: string;
  P: Integer;
begin
  S := A.ParaTexto(2);
  P := Pos('.', S);
  if P > 0 then
  begin
    Inteiro := Copy(S, 1, P - 1);
    Fracao := Copy(S, P + 1, Length(S) - P);
  end
  else
  begin
    Inteiro := S;
    Fracao := '00';
  end;
  Result := AgruparMilhar(Inteiro) + ',' + Fracao;
end;

class function ArredondamentoCalculo.FormatarPercentualPtBr(
  const A: DecimalCalculo): string;
var
  R: DecimalCalculo;
  S, Inteiro, Fracao: string;
  P: Integer;
begin
  R := AliquotaPublicada(A);
  S := R.ParaTexto(4);
  P := Pos('.', S);
  if P > 0 then
  begin
    Inteiro := Copy(S, 1, P - 1);
    Fracao := Copy(S, P + 1, Length(S) - P);
    while (Length(Fracao) > 2) and (Fracao[Length(Fracao)] = '0') do
      Delete(Fracao, Length(Fracao), 1);
    if Length(Fracao) < 2 then
      while Length(Fracao) < 2 do
        Fracao := Fracao + '0';
    Result := Inteiro + ',' + Fracao;
  end
  else
    Result := S + ',00';
end;

end.
