unit ObterResumoDadosFiscaisInputUnit;

interface

uses
  TipoComunsUnit,
  TipoTributoFiscalEnumUnit;

type
  ObterResumoDadosFiscaisInput = record
  private
    FData: TDate;
    FEmpresaId: Integer;
    FTipoTributo: TipoTributoFiscalEnum;
  public
    class function Create(
      TipoTributo: TipoTributoFiscalEnum;
      EmpresaId: Integer;
      Data: TDate
    ): ObterResumoDadosFiscaisInput; static;

    property TipoTributo: TipoTributoFiscalEnum read FTipoTributo;
    property EmpresaId: Integer read FEmpresaId;
    property Data: TDate read FData;
  end;

implementation


{ ObterResumoDadosFiscaisInput }

class function ObterResumoDadosFiscaisInput.Create(
  TipoTributo: TipoTributoFiscalEnum;
  EmpresaId: Integer;
  Data: TDate): ObterResumoDadosFiscaisInput;
begin
  Result.FTipoTributo := TipoTributo;
  Result.FEmpresaId := EmpresaId;
  Result.FData := Data;
end;

end.
