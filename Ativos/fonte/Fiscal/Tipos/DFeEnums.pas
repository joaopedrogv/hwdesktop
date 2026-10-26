unit DFeEnums;

interface

uses
  Types,
  FormatoImpressaoDANFeEnumUnit;

// ja tem o enum na unit acima
//type
  //FormatoImpressaoDANFeEnum = FormatoImpressaoDANFeEnumUnit.FormatoImpressaoDANFeEnum;

const
  FormatoImpressaoDANFeEnumStr: array[FormatoImpressaoDANFeEnum] of string = (
    '', 'Sem DANFe', 'Retrato', 'Paisagem', 'Simplificado', 'Simplificado Tipo 2'
  );

type
  ArrayOfString = TStringDynArray;

  DFeEnumUtils = class
  public
    class function FormatoImpressaoDANFeNFeValues(): ArrayOfString;
  end;

implementation

uses
  TypInfo, hw_enum_utils;

{ DFeEnumUtils }

class function DFeEnumUtils.FormatoImpressaoDANFeNFeValues(): ArrayOfString;
begin
  Result := EnumToArrayString(TypeInfo(FormatoImpressaoDANFeEnum));
end;

end.
