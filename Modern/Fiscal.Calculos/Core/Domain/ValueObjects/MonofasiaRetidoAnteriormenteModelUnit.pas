unit MonofasiaRetidoAnteriormenteModelUnit;

interface

uses
  TipoComunsUnit, ResultadoCbsIbsUnit;

type
  MonofasiaRetidoAnteriormenteModel = record
  private
    FInstance: RecordInstance;
    FQBCMonoRet: Currency;
    FAdRemIBSRet: Currency;
    FVIBSMonoRet: Currency;
    FAdRemCBSRet: Currency;
    FVCBSMonoRet: Currency;

    class function CreateEtd(
      Instance: RecordInstance;
      QBCMonoRet, AdRemIBSRet, VIBSMonoRet, AdRemCBSRet, VCBSMonoRet: Currency
    ): MonofasiaRetidoAnteriormenteModel; static;
  public
    class function Create(
      const Cbs, IbsEstadual, IbsMunicipal: ResultadoCbsIbs
    ): MonofasiaRetidoAnteriormenteModel; static;

    function IsNull(): Boolean;

    property QBCMonoRet: Currency read FQBCMonoRet;
    property AdRemIBSRet: Currency read FAdRemIBSRet;
    property VIBSMonoRet: Currency read FVIBSMonoRet;
    property AdRemCBSRet: Currency read FAdRemCBSRet;
    property VCBSMonoRet: Currency read FVCBSMonoRet;
  end;

implementation

uses
  ResultadoGrupoMonofasiaUnit, ResultadoGrupoEtapaMonofasiaUnit, NumberServiceUnit;

{ MonofasiaRetidoAnteriormenteModel }

class function MonofasiaRetidoAnteriormenteModel.Create(const Cbs, IbsEstadual,
  IbsMunicipal: ResultadoCbsIbs): MonofasiaRetidoAnteriormenteModel;
var
  monoUF, monoMun: ResultadoGrupoMonofasia;
  tributoMonofasico, tributoMonofasicoCbs: ResultadoGrupoEtapaMonofasia;
  qBCMonoRet, adRemIBSRet, vIBSMonoRet: Currency;
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
    Result := MonofasiaRetidoAnteriormenteModel.CreateEtd(riNull, 0, 0, 0, 0, 0);
    Exit;
  end;

  tributoMonofasico := ResultadoGrupoEtapaMonofasia.Merge( monoUF.TributoMonofasico, monoMun.TributoMonofasico );
  if not tributoMonofasico.IsNull() then
  begin
    qBCMonoRet := tributoMonofasico.Quantidade;
    adRemIBSRet := tributoMonofasico.AliquotaAdRem;
    vIBSMonoRet := tributoMonofasico.Valor;
  end;

  if not Cbs.IsNull() then
    tributoMonofasicoCbs := Cbs.GrupoMonofasia.TributoMonofasico
  else
    tributoMonofasicoCbs := ResultadoGrupoEtapaMonofasia.NullInstance();

  Result := MonofasiaRetidoAnteriormenteModel.CreateEtd(
    riNotNull,
    NumberService.RoundHalfUpTo4(qBCMonoRet),
    NumberService.RoundHalfUpTo4(adRemIBSRet),
    NumberService.RoundHalfUpTo2(vIBSMonoRet),
    NumberService.RoundHalfUpTo4(tributoMonofasicoCbs.AliquotaAdRem),
    NumberService.RoundHalfUpTo2(tributoMonofasicoCbs.Valor)
  );
end;

class function MonofasiaRetidoAnteriormenteModel.CreateEtd(
  Instance: RecordInstance;
  QBCMonoRet, AdRemIBSRet, VIBSMonoRet, AdRemCBSRet, VCBSMonoRet: Currency
): MonofasiaRetidoAnteriormenteModel;
begin
  Result.FInstance := Instance;
  Result.FQBCMonoRet := QBCMonoRet;
  Result.FAdRemIBSRet := AdRemIBSRet;
  Result.FVIBSMonoRet := VIBSMonoRet;
  Result.FAdRemCBSRet := AdRemCBSRet;
  Result.FVCBSMonoRet := VCBSMonoRet;
end;

function MonofasiaRetidoAnteriormenteModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

end.
