unit TributoDFeIbsCbsEtdUnit;

interface

uses
  SysUtils,
  DoubleNullableUnit,
  StringNullableUnit,
  TributoDFeGrupoIbsCbsEtdUnit,
  TributoDFeMonofasiaIbsCbsEtdUnit,
  TributoDFeTransfCredIbsCbsEtdUnit,
  TributoDFeAjusteCompetIbsCbsEtdUnit,
  TributoDFeCredPresOpIbsCbsEtdUnit,
  TributoDFeCredPresZfmIbsCbsEtdUnit,
  TipoRegraTributoDFeEnumUnit;

type
  TributoDFeIbsCbsEtd = class
  private
    FId: string;
    FRegraFiscalId: StringNullable;
    FTipoRegra: TipoRegraTributoDFeEnum;
    FCst: string;
    FcClasstrib: string;
    FIndDoacao: Boolean;
    FVIbsEstCred: DoubleNullable;
    FVCbsEstCred: DoubleNullable;
    FGIbsCbs: TributoDFeGrupoIbsCbsEtd;
    FMonofasia: TributoDFeMonofasiaIbsCbsEtd;
    FTransfCred: TributoDFeTransfCredIbsCbsEtd;
    FAjusteCompet: TributoDFeAjusteCompetIbsCbsEtd;
    FCredPresOp: TributoDFeCredPresOpIbsCbsEtd;
    FCredPresZFM: TributoDFeCredPresZfmIbsCbsEtd;

    constructor Create; overload;
  public
    constructor Create(
      const AId: string;
      const ARegraFiscalId: StringNullable;
      ATipoRegra: TipoRegraTributoDFeEnum;
      const ACst: string; const ACclasstrib: string; AInddoacao: Boolean;
      const AVIbsestcred: DoubleNullable;
      const AVCbsestcred: DoubleNullable;
      AIbsCbs: TributoDFeGrupoIbsCbsEtd;
      AMonofasia: TributoDFeMonofasiaIbsCbsEtd;
      ATransfCred: TributoDFeTransfCredIbsCbsEtd;
      AAjusteCompet: TributoDFeAjusteCompetIbsCbsEtd;
      ACredPresOp: TributoDFeCredPresOpIbsCbsEtd;
      ACredPresZFM: TributoDFeCredPresZfmIbsCbsEtd); overload;

    function Clone(): TributoDFeIbsCbsEtd;
    function IsEqualTo(const Other: TributoDFeIbsCbsEtd): Boolean;

    property Id: string read FId write FId;
    property RegraFiscalId: StringNullable read FRegraFiscalId write FRegraFiscalId;
    property TipoRegra: TipoRegraTributoDFeEnum read FTipoRegra write FTipoRegra;
    property Cst: string read FCst write FCst;
    property CClasstrib: string read FcClasstrib write FcClasstrib;
    property Inddoacao: Boolean read FIndDoacao write FIndDoacao;
    property VIbsEstCred: DoubleNullable read FVIbsEstCred write FVIbsEstCred;
    property VCbsEstCred: DoubleNullable read FVCbsEstCred write FVCbsEstCred;
    property GIbsCbs: TributoDFeGrupoIbsCbsEtd read FGIbsCbs write FGIbsCbs;
    property Monofasia: TributoDFeMonofasiaIbsCbsEtd read FMonofasia write FMonofasia;
    property TransfCred: TributoDFeTransfCredIbsCbsEtd read FTransfCred write FTransfCred;
    property AjusteCompet: TributoDFeAjusteCompetIbsCbsEtd read FAjusteCompet write FAjusteCompet;
    property CredPresOp: TributoDFeCredPresOpIbsCbsEtd read FCredPresOp write FCredPresOp;
    property CredPresZFM: TributoDFeCredPresZfmIbsCbsEtd read FCredPresZFM write FCredPresZFM;
  end;

implementation

constructor TributoDFeIbsCbsEtd.Create;
begin
  // Construtor vazio
end;

function TributoDFeIbsCbsEtd.Clone: TributoDFeIbsCbsEtd;
begin
  if Self = nil then
    Result := nil
  else
    Result := TributoDFeIbsCbsEtd.Create(
      FId,
      FRegraFiscalId,
      FTipoRegra,
      FCst,
      FcClasstrib,
      FIndDoacao,
      FVIbsEstCred,
      FVCbsEstCred,
      FGIbsCbs.Clone(),
      FMonofasia.Clone(),
      FTransfCred.Clone(),
      FAjusteCompet.Clone(),
      FCredPresOp.Clone(),
      FCredPresZFM.Clone()
    );
end;

constructor TributoDFeIbsCbsEtd.Create(
  const AId: string;
  const ARegraFiscalId: StringNullable;
  ATipoRegra: TipoRegraTributoDFeEnum;
  const ACst: string; const ACclasstrib: string;
  AInddoacao: Boolean;
  const AVIbsestcred: DoubleNullable;
  const AVCbsestcred: DoubleNullable;
  AIbsCbs: TributoDFeGrupoIbsCbsEtd;
  AMonofasia: TributoDFeMonofasiaIbsCbsEtd;
  ATransfCred: TributoDFeTransfCredIbsCbsEtd;
  AAjusteCompet: TributoDFeAjusteCompetIbsCbsEtd;
  ACredPresOp: TributoDFeCredPresOpIbsCbsEtd;
  ACredPresZFM: TributoDFeCredPresZfmIbsCbsEtd);
begin
  FId := AId;
  FRegraFiscalId := ARegraFiscalId;
  FTipoRegra := ATipoRegra;
  FCst := ACst;
  FcClasstrib := ACclasstrib;
  FIndDoacao := AInddoacao;
  FVIbsEstCred := AVIbsestcred;
  FVCbsEstCred := AVCbsestcred;
  FGIbsCbs := AIbsCbs;
  FMonofasia := AMonofasia;
  FTransfCred := ATransfCred;
  FAjusteCompet := AAjusteCompet;
  FCredPresOp := ACredPresOp;
  FCredPresZFM := ACredPresZFM;
end;

function TributoDFeIbsCbsEtd.IsEqualTo(const Other: TributoDFeIbsCbsEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.Id = Other.Id)
      and Self.RegraFiscalId.IsEqualTo(Other.RegraFiscalId)
      and (Self.TipoRegra = Other.TipoRegra)
      and (Self.Cst = Other.Cst)
      and (Self.CClasstrib = Other.CClasstrib)
      and (Self.Inddoacao = Other.Inddoacao)
      and Self.VIbsEstCred.IsEqualTo(Other.VIbsEstCred)
      and Self.VCbsEstCred.IsEqualTo(Other.VCbsEstCred)
      and Self.GIbsCbs.IsEqualTo(Other.GIbsCbs)
      and Self.Monofasia.IsEqualTo(Other.Monofasia)
      and Self.TransfCred.IsEqualTo(Other.TransfCred)
      and Self.AjusteCompet.IsEqualTo(Other.AjusteCompet)
      and Self.CredPresOp.IsEqualTo(Other.CredPresOp)
      and Self.CredPresZFM.IsEqualTo(Other.CredPresZFM);
end;

end.
