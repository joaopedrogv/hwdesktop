unit CriarGruposFiscaisDeAnexosTypes;

interface

uses
  TipoTributoFiscalEnumUnit,
  TipoComunsUnit;

type
  CriarGruposFiscaisDeAnexosInput = record
  private
    FAnexos: TArrayString;
    FTipoTributo: TipoTributoFiscalEnum;
    FData: TDate;
  public
    class function Create(
      const Anexos: TArrayString;
      TipoTributo: TipoTributoFiscalEnum;
      Data: TDate
    ): CriarGruposFiscaisDeAnexosInput; static;

    property Anexos: TArrayString read FAnexos;
    property TipoTributo: TipoTributoFiscalEnum read FTipoTributo;
    property Data: TDate read FData;
  end;

implementation

{ CriarGruposFiscaisDeAnexosInput }

class function CriarGruposFiscaisDeAnexosInput.Create(
  const Anexos: TArrayString;
  TipoTributo: TipoTributoFiscalEnum;
  Data: TDate
): CriarGruposFiscaisDeAnexosInput;
begin
  Result.FAnexos := Anexos;
  Result.FTipoTributo := TipoTributo;
  Result.FData := Data;
end;

end.
