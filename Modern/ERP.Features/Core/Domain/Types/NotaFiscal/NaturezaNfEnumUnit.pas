unit NaturezaNfEnumUnit;

interface

type
  NaturezaNfEnum = (
    natNaoDefinido,
    natEntrada,      // > 'E'
    natSaida         // > 'S'
  );

const
  NaturezaNfEnumValues: array[NaturezaNfEnum] of string = ('', 'E', 'S');

function NaturezaNfToEnum(const Value: string): NaturezaNfEnum;

implementation

uses
  SysUtils, StrUtils;

function NaturezaNfToEnum(const Value: string): NaturezaNfEnum;
var
  eVal: SmallInt;
begin
  eVal := IndexText(Value, NaturezaNfEnumValues);
  case eVal of
    0..2:
      Result := NaturezaNfEnum(eVal);
    else
      Result := natNaoDefinido;
  end;

  if Length(NaturezaNfEnumValues) <> 3 then
    raise Exception.Create('NaturezaNfToEnum Check Size error');
end;

end.
