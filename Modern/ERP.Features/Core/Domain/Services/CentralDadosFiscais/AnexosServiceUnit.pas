unit AnexosServiceUnit;

interface

uses
  TipoComunsUnit,
  AnexoEtdUnit;

type
  AnexosSerice = class
  public
    class function Agrupar(const Input: AnexosEtd): TArrayString;
    class procedure OrdenarPorNumeroRomano(var A: AnexosEtd);
  end;

implementation

uses
  SysUtils,
  NumberServiceUnit;

{ AnexosSerice }

class function AnexosSerice.Agrupar(
  const Input: AnexosEtd): TArrayString;
var
  A, I, Count: Integer;
  Existe: Boolean;
begin
  SetLength(Result, Length(Input) );
  Count := 0;
  for I := Low(Input) to High(Input) do
  begin

    Existe := False;
    for A := 0 to Count do
      if Result[A] = Input[I].Numero then
      begin
        Existe := True;
        Break;
      end;

    if not Existe then
    begin
      Inc(Count);
      Result[Count - 1] := Input[I].Numero;
    end;
  end;

  SetLength(Result, Count);
end;

class procedure AnexosSerice.OrdenarPorNumeroRomano(
  var A: AnexosEtd);// Função auxiliar para comparar dois registros
  // Retorna < 0 se Esquerda < Direita
  // Retorna > 0 se Esquerda > Direita
  // Retorna 0 se forem iguais
  function CompararRegistros(const Esquerda, Direita: AnexoEtd): Integer;
  var
    ValE, ValD: Integer;
    ItemE, ItemD: Integer;
  begin
    // 1º Critério: Numero (Romano)
    ValE := NumberService.FromRomano(Esquerda.Numero);
    ValD := NumberService.FromRomano(Direita.Numero);
    
    Result := ValE - ValD;
    
    // 2º Critério: NumeroItem (em caso de empate no 1º)
    if (Result = 0) then
    begin// Tenta converter para inteiro. Se falhar, usa 0 como padrão.
      ItemE := StrToIntDef(Esquerda.NumeroItem, -1);
      ItemD := StrToIntDef(Direita.NumeroItem, -1);// Se ambos forem números válidos (>= 0), compara numericamente

      if (ItemE <> -1) and (ItemD <> -1) then
        Result := ItemE - ItemD
      else
        // Se um deles não for número, volta para a comparação de string padrão
        Result := CompareStr(Esquerda.NumeroItem, Direita.NumeroItem);
    end;

  end;

  procedure QuickSort(var Arr: AnexosEtd; L, R: Integer);
  var
    I, J: Integer;
    Pivot: AnexoEtd;
    Temp: AnexoEtd;
  begin
    I := L;
    J := R;
    Pivot := Arr[(L + R) div 2];
    
    repeat
      while CompararRegistros(Arr[I], Pivot) < 0 do Inc(I);
      while CompararRegistros(Arr[J], Pivot) > 0 do Dec(J);
      
      if I <= J then
      begin
        Temp := Arr[I];
        Arr[I] := Arr[J];
        Arr[J] := Temp;
        Inc(I);
        Dec(J);
      end;
    until I > J;
    
    if L < J then QuickSort(Arr, L, J);
    if I < R then QuickSort(Arr, I, R);
  end;

begin
  if Length(A) > 1 then
    QuickSort(A, Low(A), High(A));
end;

end.
