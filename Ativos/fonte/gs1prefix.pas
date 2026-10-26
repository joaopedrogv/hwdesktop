unit gs1prefix;

interface

type
  TGS1Prefix = class
  public
    class function GetEanValido(value, prefixosInvalidosConfs: string): string;
  end;

implementation

uses
  Classes,
  SysUtils,
  StrUtils,
  uDtmAtivo,
  hw_utils;

{ TGS1Prefix }

class function TGS1Prefix.GetEanValido(value, prefixosInvalidosConfs: string): string;
var
  prefix: string;
begin
  prefix := OnlyNumber(value);
  prefix := PadL(IfThen(Length(prefix) = 14, Copy(prefix, 2, 13), prefix), 14, '0');
  prefix := IfThen(Copy(prefix, 1, 6) = '000000', Copy(prefix, 7, 3), Copy(prefix, 2, 3));

  if NewStringList(False, prefixosInvalidosConfs, ',').IndexOf(prefix) >= 0 then
    Result := ''
  else if vDadosIni.SqlOpen('select count(inicio) contador from gs1prefix' +
                            ' where %s >= inicio and %s <= fim',
                            [QuotedStr(prefix), QuotedStr(prefix)]).FieldByName('contador').AsInteger > 0 then
    Result := Trim(value)
  else
    Result := '';

  vDadosIni.queryHwAuto.Close;
end;

end.
