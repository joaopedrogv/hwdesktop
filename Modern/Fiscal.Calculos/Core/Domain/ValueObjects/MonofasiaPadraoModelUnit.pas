unit MonofasiaPadraoModelUnit;

interface

uses
  TipoComunsUnit, ResultadoCbsIbsUnit;

type
  MonofasiaPadraoModel = record
  private
    FInstance: RecordInstance;
    FQBCMono: Currency;
    FAdRemIBS: Currency;
    FAdRemCBS: Currency;
    FVIBSMono: Currency;
    FVCBSMono: Currency;

    class function CreateEtd(
      Instance: RecordInstance;
      QBCMono, AdRemIBS, VIBSMono, AdRemCBS, VCBSMono: Currency
    ): MonofasiaPadraoModel; static;
  public
    class function Create(
      const Cbs, IbsEstadual, IbsMunicipal: ResultadoCbsIbs
    ): MonofasiaPadraoModel; static;

    function IsNull(): Boolean;

    property QBCMono: Currency read FQBCMono;
    property AdRemIBS: Currency read FAdRemIBS;
    property VIBSMono: Currency read FVIBSMono;
    property AdRemCBS: Currency read FAdRemCBS;
    property VCBSMono: Currency read FVCBSMono;
  end;

implementation

uses
  ResultadoGrupoMonofasiaUnit, ResultadoGrupoEtapaMonofasiaUnit, NumberServiceUnit;

{ MonofasiaPadraoModel }

class function MonofasiaPadraoModel.CreateEtd(
  Instance: RecordInstance;
  QBCMono, AdRemIBS, VIBSMono, AdRemCBS, VCBSMono: Currency
): MonofasiaPadraoModel;
begin
  Result.FInstance := Instance;
  Result.FQBCMono := QBCMono;
  Result.FAdRemIBS := AdRemIBS;
  Result.FAdRemCBS := AdRemCBS;
  Result.FVIBSMono := VIBSMono;
  Result.FVCBSMono := VCBSMono;
end;

class function MonofasiaPadraoModel.Create(
  const Cbs: ResultadoCbsIbs;
  const IbsEstadual: ResultadoCbsIbs;
  const IbsMunicipal: ResultadoCbsIbs
): MonofasiaPadraoModel;
var
  monoUF, monoMun: ResultadoGrupoMonofasia;
  tributoMonofasico, tributoMonofasicoCbs: ResultadoGrupoEtapaMonofasia;
  qBCMono, adRemIBS, vIBSMono: Currency;
begin

  if not IbsEstadual.IsNull() then
    monoUF := IbsEstadual.GrupoMonofasia
  else
    monoUF := ResultadoGrupoMonofasia.NullInstance();
  {
  // desconsiderar monofasia municipal por enquanto
  if not IbsMunicipal.IsNull() then
    monoMun := IbsMunicipal.GrupoMonofasia
  else }
    monoMun := ResultadoGrupoMonofasia.NullInstance();

  if {Cbs.IsNull() and }monoUF.IsNull() and monoMun.IsNull() then // Na calculadora se nao tem IBS nao considera CBS
  begin
    Result := MonofasiaPadraoModel.CreateEtd(riNull, 0, 0, 0, 0, 0);
    Exit;
  end;

  tributoMonofasico := ResultadoGrupoEtapaMonofasia.Merge( monoUF.TributoMonofasico, monoMun.TributoMonofasico );
  if not tributoMonofasico.IsNull() then
  begin
    qBCMono := tributoMonofasico.Quantidade;
    adRemIBS := tributoMonofasico.AliquotaAdRem;
    vIBSMono := tributoMonofasico.Valor;
  end;

  if not Cbs.IsNull() then
    tributoMonofasicoCbs := Cbs.GrupoMonofasia.TributoMonofasico
  else
    tributoMonofasicoCbs := ResultadoGrupoEtapaMonofasia.NullInstance();

  Result := MonofasiaPadraoModel.CreateEtd(
    riNotNull,
    NumberService.RoundHalfUpTo4(qBCMono),
    NumberService.RoundHalfUpTo4(adRemIBS),
    NumberService.RoundHalfUpTo2(vIBSMono),
    NumberService.RoundHalfUpTo4(tributoMonofasicoCbs.AliquotaAdRem),
    NumberService.RoundHalfUpTo2(tributoMonofasicoCbs.Valor)
  );
end;

function MonofasiaPadraoModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

end.
