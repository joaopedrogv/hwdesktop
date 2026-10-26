unit TipoNfEnumUnit;

interface

type
  TipoNfEnum = (
    tnfNaoDefinido,
    tnfProdutos,    // P
    tnfVeiculos,    // V
    tnfOutras,      // O
    tnfDespesas,    // D
    tnfServicos     // S
  );

const
  TipoNfEnumValues: array[TipoNfEnum] of string = ('', 'P', 'V', 'O', 'D', 'S');

function TipoNfToEnum(const Value: string): TipoNfEnum;

implementation

uses
  SysUtils, StrUtils;

function TipoNfToEnum(const Value: string): TipoNfEnum;
var
  eVal: SmallInt;
begin
  eVal := IndexText(Value, TipoNfEnumValues);
  case eVal of
    0..5:
      Result := TipoNfEnum(eVal);
    else
      Result := tnfNaoDefinido;
  end;

  if Length(TipoNfEnumValues) <> 6 then
    raise Exception.Create('TipoNfToEnum Check Size error');
end;

end.
