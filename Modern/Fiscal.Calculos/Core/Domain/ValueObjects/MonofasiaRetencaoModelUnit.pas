unit MonofasiaRetencaoModelUnit;

interface

uses
  TipoComunsUnit,
  ResultadoCbsIbsUnit;

type
  MonofasiaRetencaoModel = record
  private
    FInstance: RecordInstance;
    FQBCMonoReten: Currency;
    FAdRemIBSReten: Currency;
    FVIBSMonoReten: Currency;
    FAdRemCBSReten: Currency;
    FVCBSMonoReten: Currency;

    class function CreateEtd(
      Instance: RecordInstance;
      QBCMonoReten, AdRemIBSReten, VIBSMonoReten, AdRemCBSReten, VCBSMonoReten: Currency
    ): MonofasiaRetencaoModel; static;

  public
    class function Create(
      const Cbs, IbsEstadual, IbsMunicipal: ResultadoCbsIbs
    ): MonofasiaRetencaoModel; static;

    function IsNull(): Boolean;

    property QBCMonoReten: Currency read FQBCMonoReten;
    property AdRemIBSReten: Currency read FAdRemIBSReten;
    property VIBSMonoReten: Currency read FVIBSMonoReten;
    property AdRemCBSReten: Currency read FAdRemCBSReten;
    property VCBSMonoReten: Currency read FVCBSMonoReten;
  end;

implementation

uses
  ResultadoGrupoMonofasiaUnit, ResultadoGrupoEtapaMonofasiaUnit, NumberServiceUnit;

{ MonofasiaRetencaoModel }

class function MonofasiaRetencaoModel.Create(const Cbs, IbsEstadual,
  IbsMunicipal: ResultadoCbsIbs): MonofasiaRetencaoModel;
var
  monoUF, monoMun: ResultadoGrupoMonofasia;
  tributoMonofasico, tributoMonofasicoCbs: ResultadoGrupoEtapaMonofasia;
  qBCMonoReten, adRemIBSRetem, vIBSMonoReten: Currency;
begin

  if not IbsEstadual.IsNull() then
    monoUF := IbsEstadual.GrupoMonofasia
  else
    monoUF := ResultadoGrupoMonofasia.NullInstance();
  {
  // desconsiderar retenção municipal por enquanto
  if not IbsMunicipal.IsNull() then
    monoMun := IbsMunicipal.GrupoMonofasia
  else }
    monoMun := ResultadoGrupoMonofasia.NullInstance();

  if {Cbs.IsNull() and }monoUF.IsNull() and monoMun.IsNull() then // Na calculadora se nao tem IBS nao considera CBS
  begin
    Result := MonofasiaRetencaoModel.CreateEtd(riNull, 0, 0, 0, 0, 0);
    Exit;
  end;

  tributoMonofasico := ResultadoGrupoEtapaMonofasia.Merge( monoUF.TributoMonofasico, monoMun.TributoMonofasico );
  if not tributoMonofasico.IsNull() then
  begin
    qBCMonoReten := tributoMonofasico.Quantidade;
    adRemIBSRetem := tributoMonofasico.AliquotaAdRem;
    vIBSMonoReten := tributoMonofasico.Valor;
  end;

  if not Cbs.IsNull() then
    tributoMonofasicoCbs := Cbs.GrupoMonofasia.TributoMonofasico
  else
    tributoMonofasicoCbs := ResultadoGrupoEtapaMonofasia.NullInstance();

  Result := MonofasiaRetencaoModel.CreateEtd(
    riNotNull,
    NumberService.RoundHalfUpTo4(qBCMonoReten),
    NumberService.RoundHalfUpTo4(adRemIBSRetem),
    NumberService.RoundHalfUpTo2(vIBSMonoReten),
    NumberService.RoundHalfUpTo4(tributoMonofasicoCbs.AliquotaAdRem),
    NumberService.RoundHalfUpTo2(tributoMonofasicoCbs.Valor)
  );
end;

class function MonofasiaRetencaoModel.CreateEtd(
  Instance: RecordInstance;
  QBCMonoReten, AdRemIBSReten, VIBSMonoReten, AdRemCBSReten, VCBSMonoReten: Currency
): MonofasiaRetencaoModel;
begin
  Result.FInstance := Instance;
  Result.FQBCMonoReten := QBCMonoReten;
  Result.FAdRemIBSReten := AdRemIBSReten;
  Result.FVIBSMonoReten := VIBSMonoReten;
  Result.FAdRemCBSReten := AdRemCBSReten;
  Result.FVCBSMonoReten := VCBSMonoReten;
end;

function MonofasiaRetencaoModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

end.
