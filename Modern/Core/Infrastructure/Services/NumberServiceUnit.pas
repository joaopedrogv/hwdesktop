unit NumberServiceUnit;

interface

type
  RangeMovePoint = 1..20;
  DecimalRange = 0..20;

  CurrencyService = class
  public
    class function Parse(Value: Currency): string; static;
  end;

  NumberService = class
  public
    class function Parse(Value: Double): string; static;
    class function MovePointRight(Value: Double; RangeMVP: RangeMovePoint): Double;
    class function MovePointRightCurr(Value: Currency; RangeMVP: RangeMovePoint): Currency;
    class function RoundHalfUp(const Value: Double; DecimalPlaces: DecimalRange): Double;
    class function RoundHalfUpTo2(const Value: Double): Currency; overload;
    class function RoundHalfUpTo4(const Value: Double): Currency;
    class function RoundHalfEven(const Value: Double; DecimalPlaces: DecimalRange): Double;
    class function RoundHalfEvenTo8(const Value: Double): Double;
    class function FromRomano(const SRomano: string): Integer;
    class function ParseRomano(const SRomano: string): string;
    class function RangeOrDefault(Amin, AMax, AValue, ADefault: Integer): Integer;
    class function SameMonetaryDouble(const A, B: Double): Boolean;
    class function Default(const Value, Default: Currency): Currency;
    class function IfThenCurr(AValue: Boolean; const ATrue: Currency; const AFalse: Currency = 0.0): Currency;
  end;

implementation

uses
  Math,
  SysUtils;

{ CurrencyService }

class function CurrencyService.Parse(Value: Currency): string;
begin
  Result := Format('%0.2n', [ Value ]);
end;

{ NumberService }

class function NumberService.MovePointRight(Value: Double; RangeMVP: RangeMovePoint): Double;
begin
  Result := Value * IntPower(10, RangeMVP);
end;

class function NumberService.Parse(Value: Double): string;
begin
  Result := Format('%n', [ Value ]);
end;

class function NumberService.ParseRomano(const SRomano: string): string;
begin
  Result := IntToStr( NumberService.FromRomano(SRomano));
end;

class function NumberService.Default(const Value, Default: Currency): Currency;
begin
	if Value > 0 then
		Result := Value
	else
    Result := Default;
end;

class function NumberService.FromRomano(const SRomano: string): Integer;
var
  I, Atual, Proximo: Integer;
  S: string;

  function ValorRomano(C: Char): Integer;
  begin
    case UpCase(C) of
      'I': Result := 1;
      'V': Result := 5;
      'X': Result := 10;
      'L': Result := 50;
      'C': Result := 100;
      'D': Result := 500;
      'M': Result := 1000;
    else
      Result := 0;
    end;
  end;

begin
  Result := 0;
  S := Trim(SRomano);
  
  for I := 1 to Length(S) do
  begin
    Atual := ValorRomano(S[I]);
    
    // Verifica se existe um próximo caractere para comparar
    if I < Length(S) then
    begin
      Proximo := ValorRomano(S[I + 1]);
      
      // Regra da subtração: se o atual é menor que o próximo (ex: IV, XC)
      if Atual < Proximo then
        Result := Result - Atual
      else
        Result := Result + Atual;
    end
    else
    begin
      // Último caractere sempre soma
      Result := Result + Atual;
    end;
  end;
end;

class function NumberService.IfThenCurr(AValue: Boolean; const ATrue, AFalse: Currency): Currency;
begin
  if AValue then
    Result := ATrue
  else
    Result := AFalse;
end;

class function NumberService.MovePointRightCurr(Value: Currency; RangeMVP: RangeMovePoint): Currency;
begin
  Result := Value * IntPower(10, RangeMVP);
end;

class function NumberService.RangeOrDefault(Amin, AMax, AValue,
  ADefault: Integer): Integer;
begin
  if (AValue < Amin)
    or (AValue > AMax)
  then
    Result := ADefault
  else
    Result := AValue;
end;

class function NumberService.RoundHalfUp(const Value: Double; DecimalPlaces: DecimalRange): Double;
var
  Factor: Double;
begin
  Factor := IntPower(10.0, DecimalPlaces);
  if Value < 0 then
    Result := Int(Value * Factor - 0.5) / Factor
  else
    Result := Int(Value * Factor + 0.5) / Factor;
end;

class function NumberService.RoundHalfEven(const Value: Double; DecimalPlaces: DecimalRange): Double;
var
  Factor: Extended;
  Scaled: Extended;
  Truncated: Extended;
  Rest: Extended;
  Negative: Boolean;
begin
  Factor := IntPower(10.0, DecimalPlaces);
  Scaled := Value * Factor;
  Negative := Scaled < 0;
  if Negative then
    Scaled := -Scaled;

  Truncated := Int(Scaled);
  Rest := Scaled - Truncated;

  // HALF_EVEN: arredonda para cima quando o resto excede 0,5 ou quando ha empate
  // exato (resto = 0,5) e o digito anterior e impar.
  if (Rest > 0.5) or ((Rest = 0.5) and (Frac(Truncated / 2) <> 0)) then
    Truncated := Truncated + 1;

  Result := Truncated / Factor;
  if Negative then
    Result := -Result;
end;

class function NumberService.RoundHalfEvenTo8(const Value: Double): Double;
begin
  Result := RoundHalfEven(Value, 8);
end;

class function NumberService.RoundHalfUpTo2(const Value: Double): Currency;
begin
  if Value < 0 then
    Result := Trunc(Value * 100 - 0.5) / 100
  else
    Result := Trunc(Value * 100 + 0.5) / 100;
end;

class function NumberService.RoundHalfUpTo4(const Value: Double): Currency;
begin
  if Value < 0 then
    Result := Trunc(Value * 10000 - 0.5) / 10000
  else
    Result := Trunc(Value * 10000 + 0.5) / 10000;
end;

class function NumberService.SameMonetaryDouble(const A, B: Double): Boolean;
begin
  Result := SameValue(A, B, 0.0001);
end;

end.
