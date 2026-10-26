unit TratamentoOperacaoModelUnit;

interface

uses
  TratamentoClassificacaoModelUnit,
  AliquotaImpostoSeletivoModelUnit, TipoComunsUnit, TratamentoClassificacaoEtdUnit;
                                                                 
type
  TratamentoOperacaoModel = record
  private
    FInstance: RecordInstance;
    FTratamentoClassificacaoCbsIbs: TratamentoClassificacaoModel;
    FTratamentoClassificacaoImpostoSeletivo: TratamentoClassificacaoModel;
    FTratamentoClassificacaoCbsIbsDesoneracao: TratamentoClassificacaoModel;
    FAliquotaImpostoSeletivo: AliquotaImpostoSeletivoModel;
    FTemDesoneracao: Boolean;
  public
    class function NullInstance(): TratamentoOperacaoModel; static;
    class function Create(
      const TratamentoClassificacaoCbsIbs: TratamentoClassificacaoModel;
      const TratamentoClassificacaoImpostoSeletivo: TratamentoClassificacaoModel;
      const TratamentoClassificacaoCbsIbsDesoneracao: TratamentoClassificacaoModel;
      const AliquotaImpostoSeletivoModel: AliquotaImpostoSeletivoModel;
      TemDesoneracao: Boolean
    ): TratamentoOperacaoModel; static;

    function IsNull(): Boolean;

    property TratamentoClassificacaoCbsIbs: TratamentoClassificacaoModel read FTratamentoClassificacaoCbsIbs;
    property TratamentoClassificacaoImpostoSeletivo: TratamentoClassificacaoModel read FTratamentoClassificacaoImpostoSeletivo;
    property TratamentoClassificacaoCbsIbsDesoneracao: TratamentoClassificacaoModel read FTratamentoClassificacaoCbsIbsDesoneracao;
    property AliquotaImpostoSeletivo: AliquotaImpostoSeletivoModel read FAliquotaImpostoSeletivo;
    property TemDesoneracao: Boolean read FTemDesoneracao;
  end;

implementation

{ TratamentoOperacaoModel }

class function TratamentoOperacaoModel.Create(
  const TratamentoClassificacaoCbsIbs,
  TratamentoClassificacaoImpostoSeletivo, TratamentoClassificacaoCbsIbsDesoneracao: TratamentoClassificacaoModel;
  const AliquotaImpostoSeletivoModel: AliquotaImpostoSeletivoModel;
  TemDesoneracao: Boolean
): TratamentoOperacaoModel;
begin
  Result.FInstance := riNotNull;;
  Result.FTratamentoClassificacaoCbsIbs := TratamentoClassificacaoCbsIbs;
  Result.FTratamentoClassificacaoImpostoSeletivo := TratamentoClassificacaoImpostoSeletivo;
  Result.FTratamentoClassificacaoCbsIbsDesoneracao := TratamentoClassificacaoCbsIbsDesoneracao;
  Result.FAliquotaImpostoSeletivo := AliquotaImpostoSeletivoModel;
  Result.FTemDesoneracao := TemDesoneracao;
end;

function TratamentoOperacaoModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

class function TratamentoOperacaoModel.NullInstance: TratamentoOperacaoModel;
var
  nullTratClass: TratamentoClassificacaoModel;
begin
  nullTratClass := TratamentoClassificacaoModel.NullInstance();

  Result := TratamentoOperacaoModel.Create(
    nullTratClass, nullTratClass, nullTratClass, AliquotaImpostoSeletivoModel.NullInstance(), False
  );
  Result.FInstance := riNull;;
end;

end.
