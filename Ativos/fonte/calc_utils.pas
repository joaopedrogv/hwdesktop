unit calc_utils;

interface

uses
  Math;

type
  CalcUtils = class                     // talvez deixar o valor nos produtos sem arredondar e formatar apenas o visual
  public
    class function Markup(preco, custo: Double; const ADigit: TRoundToRange): Double; overload;
    class function Markup(margem: Double; const ADigit: TRoundToRange): Double; overload;
    class function MargemLucro(preco, custo: Double; const ADigit: TRoundToRange): Double; overload;
    class function MargemLucro(markup: Double; const ADigit: TRoundToRange): Double; overload;
    class function Preco(custo, markup: Double; const ADigit: TRoundToRange): Double; overload;
  end;

implementation

{ CalcUtils }

class function CalcUtils.MargemLucro(preco, custo: Double;
  const ADigit: TRoundToRange): Double;
begin
  if (preco <= 0) or (custo <= 0) then
    Result := 0
  else
    Result := RoundTo(((preco - custo) / preco) * 100, ADigit);
end;

class function CalcUtils.MargemLucro(markup: Double;
  const ADigit: TRoundToRange): Double;
begin
  if (markup <= 0) then
    Result := 0
  else
    Result := RoundTo(markup / ( 1 + (markup / 100)), ADigit);
end;

class function CalcUtils.Markup(margem: Double;
  const ADigit: TRoundToRange): Double;
begin
  if (margem <= 0) then
    Result := 0
  else
  begin
    margem := 1 - (margem / 100);
    Result := RoundTo(((1 / margem) - 1 ) * 100, ADigit);
  end;
end;

class function CalcUtils.Preco(custo, markup: Double;
  const ADigit: TRoundToRange): Double;
begin
  if (custo <= 0) or (markup <= 0) then
    Result := 0
  else
    Result := RoundTo(custo * (1 + (markup / 100)), ADigit);
end;

class function CalcUtils.Markup(preco, custo: Double;
  const ADigit: TRoundToRange): Double;
begin
  if (preco <= 0) or (custo <= 0) then
    Result := 0
  else
    Result := RoundTo(((preco / custo) - 1) * 100, ADigit);
end;

end.
