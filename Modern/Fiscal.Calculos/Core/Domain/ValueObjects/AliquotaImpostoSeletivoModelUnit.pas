unit AliquotaImpostoSeletivoModelUnit;

interface

uses
  TipoComunsUnit, CurrencyNullableUnit;

type
  AliquotaImpostoSeletivoModel = record
  private
    FInstance: RecordInstance;
    FAliquotaAdValorem: CurrencyNullable;
    FAliquotaAdRem: CurrencyNullable;
    FUnidadeMedida: string;
  public
    class function NullInstance(): AliquotaImpostoSeletivoModel; static;
    class function Create(
      const AliquotaAdValorem, AliquotaAdRem: CurrencyNullable;
      const UnidadeMedida: string
    ): AliquotaImpostoSeletivoModel; static;

    function IsNull(): Boolean;

    property AliquotaAdValorem: CurrencyNullable read FAliquotaAdValorem;
    property AliquotaAdRem: CurrencyNullable read FAliquotaAdRem;
    property UnidadeMedida: string read FUnidadeMedida;
  end;

implementation

{ AliquotaImpostoSeletivoModel }

class function AliquotaImpostoSeletivoModel.Create(
  const AliquotaAdValorem, AliquotaAdRem: CurrencyNullable;
  const UnidadeMedida: string
): AliquotaImpostoSeletivoModel;
begin
  Result.FInstance := riNotNull;
  Result.FAliquotaAdValorem := AliquotaAdValorem;
  Result.FAliquotaAdRem := AliquotaAdRem;
  Result.FUnidadeMedida := UnidadeMedida;
end;

function AliquotaImpostoSeletivoModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function AliquotaImpostoSeletivoModel.NullInstance: AliquotaImpostoSeletivoModel;
begin
  Result.FInstance := riNull;
end;

end.
