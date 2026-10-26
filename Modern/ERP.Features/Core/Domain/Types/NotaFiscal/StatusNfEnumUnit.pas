unit StatusNfEnumUnit;

interface

type
  StatusNfEnum = (
    stnfNaoDefinido,
    stnfAberta,
    stnfFechada,
    stnfCancelada,
    stnfPreNota,
    stnfImportaXML,
    stnfPreNotaXML
  );

const
  StatusNfEnumValues: array[StatusNfEnum] of string = ('', 'Aberta', 'Fechada', 'Cancelada', 'Pre Nota', 'ImportaXML', 'PreNotaXML');

function StatusNfToEnum(const Value: string): StatusNfEnum;

implementation

uses
  SysUtils, StrUtils;

function StatusNfToEnum(const Value: string): StatusNfEnum;
var
  eVal: SmallInt;
begin
  eVal := IndexText(Value, StatusNfEnumValues);
  case eVal of
    0..6:
      Result := StatusNfEnum(eVal);
    else
      Result := stnfNaoDefinido;
  end;

  if Length(StatusNfEnumValues) <> 7 then
    raise Exception.Create('StatusNfToEnum Check Size error');
end;

end.
