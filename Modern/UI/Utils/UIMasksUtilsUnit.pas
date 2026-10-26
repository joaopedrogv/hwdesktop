unit UIMasksUtilsUnit;

interface

type
  UIMasksUtils = class
  public
    class function CPFCNPJ(const Value: string): string;
    class function Fone(const Value: string): string;
    class function CNAE(const Value: string): string;
  end;

implementation

uses
  MaskUtils,
  StrUtils;

{ UIMasksUtils }

class function UIMasksUtils.CNAE(const Value: string): string;
begin 
  case Length(Value) of
    7: Result := FormatMaskText('0000-0/00;0;_', Value);
  else
    Result := Value;
  end;
end;

class function UIMasksUtils.CPFCNPJ(const Value: string): string;
begin
  case Length(Value) of
    11: Result := FormatMaskText('000.000.000-00;0;_', Value);
    14: Result := FormatMaskText('00.000.000/0000-00;0;_', Value);
  else
    Result := Value;
  end;
end;

class function UIMasksUtils.Fone(const Value: string): string;
begin
  if ContainsText(Value, '(') or ContainsText(Value, ')') or ContainsText(Value, '-') or ContainsText(Value, '.') then
    Result := Value

  else
    case Length(Value) of
      10: Result := FormatMaskText('(00)0000-0000;0;_', Value);
      11: Result := FormatMaskText('(00)00000-0000;0;_', Value);
    else
      Result := Value;
    end;
end;

end.
