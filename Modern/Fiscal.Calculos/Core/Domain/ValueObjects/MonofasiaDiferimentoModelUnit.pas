unit MonofasiaDiferimentoModelUnit;

interface

uses
  TipoComunsUnit, ResultadoCbsIbsUnit;

type
  MonofasiaDiferimentoModel = record
  private
    FInstance: RecordInstance;
    FPDifIBS: Currency;
    FVIBSMonoDif: Currency;
    FPDifCBS: Currency;
    FVCBSMonoDif: Currency;

    class function CreateEtd(
      Instance: RecordInstance;
      PDifIBS, VIBSMonoDif, PDifCBS, VCBSMonoDif: Currency
    ): MonofasiaDiferimentoModel; static;
  public
    class function Create(
      const Cbs, IbsEstadual, IbsMunicipal: ResultadoCbsIbs
    ): MonofasiaDiferimentoModel; static;

    function IsNull(): Boolean;

    property PDifIBS: Currency read FPDifIBS;
    property VIBSMonoDif: Currency read FVIBSMonoDif;
    property PDifCBS: Currency read FPDifCBS;
    property VCBSMonoDif: Currency read FVCBSMonoDif;
  end;

implementation

uses
  ResultadoGrupoMonofasiaUnit, ResultadoGrupoDiferimentoMonofasiaUnit, NumberServiceUnit;

{ MonofasiaDiferimentoModel }

class function MonofasiaDiferimentoModel.Create(const Cbs, IbsEstadual,
  IbsMunicipal: ResultadoCbsIbs): MonofasiaDiferimentoModel;
var
  monoUF, monoMun: ResultadoGrupoMonofasia;
  tributoMonofasico, tributoMonofasicoCbs: ResultadoGrupoDiferimentoMonofasia;
  pDifIBS, vIBSMonoDif: Currency;
begin
  if not IbsEstadual.IsNull() then
    monoUF := IbsEstadual.GrupoMonofasia
  else
    monoUF := ResultadoGrupoMonofasia.NullInstance();
  {
  // desconsiderar diferimento municipal por enquanto
  if not IbsMunicipal.IsNull() then
    monoMun := IbsMunicipal.GrupoMonofasia
  else }
    monoMun := ResultadoGrupoMonofasia.NullInstance();

  if {Cbs.IsNull() and }monoUF.IsNull() and monoMun.IsNull() then // Na calculadora se nao tem IBS nao considera CBS
  begin
    Result := MonofasiaDiferimentoModel.CreateEtd(riNull, 0, 0, 0, 0);
    Exit;
  end;

  tributoMonofasico := ResultadoGrupoDiferimentoMonofasia.Merge( monoUF.TributoDiferido, monoMun.TributoDiferido );
  if not tributoMonofasico.IsNull() then
  begin
    pDifIBS := tributoMonofasico.PercentualDiferimento;
    vIBSMonoDif := tributoMonofasico.ValorDiferimento;
  end;

  if not Cbs.IsNull() then
    tributoMonofasicoCbs := Cbs.GrupoMonofasia.TributoDiferido
  else
    tributoMonofasicoCbs := ResultadoGrupoDiferimentoMonofasia.NullInstance();

  Result := MonofasiaDiferimentoModel.CreateEtd(
    riNotNull,
    NumberService.RoundHalfUpTo4(pDifIBS),
    NumberService.RoundHalfUpTo2(vIBSMonoDif),
    NumberService.RoundHalfUpTo4(tributoMonofasicoCbs.PercentualDiferimento),
    NumberService.RoundHalfUpTo2(tributoMonofasicoCbs.ValorDiferimento)
  );
end;

class function MonofasiaDiferimentoModel.CreateEtd(
  Instance: RecordInstance;
  PDifIBS, VIBSMonoDif, PDifCBS, VCBSMonoDif: Currency
): MonofasiaDiferimentoModel;
begin
  Result.FInstance := Instance;
  Result.FPDifIBS := PDifIBS;
  Result.FVIBSMonoDif := VIBSMonoDif;
  Result.FPDifCBS := PDifCBS;
  Result.FVCBSMonoDif := VCBSMonoDif;
end;

function MonofasiaDiferimentoModel.IsNull: Boolean;
begin
  Result := FInstance <> riNotNull;
end;

end.
