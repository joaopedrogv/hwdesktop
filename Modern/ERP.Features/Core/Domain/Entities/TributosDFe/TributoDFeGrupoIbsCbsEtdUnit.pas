unit TributoDFeGrupoIbsCbsEtdUnit;

interface

uses
  SysUtils,
  DoubleNullableUnit,
  TributoDFeIbsCbsTribRegEtdUnit,
  TributoDFeIbsCbsCompraGovEtdUnit;

type
  TributoDFeGrupoIbsCbsEtd = class
  private
    FId: string;
    FvBc: Double;
    FPIbsUf: Double;
    FIbsUfPdif: DoubleNullable;
    FIbsUfVdif: DoubleNullable;
    FIbsUfVdevtrib: DoubleNullable;
    FIbsUfPredaliq: DoubleNullable;
    FIbsUfAliqefet: DoubleNullable;
    FVibsUf: Double;
    FPibsMun: Double;
    FIbsMunPdif: DoubleNullable;
    FIbsMunVdif: DoubleNullable;
    FIbsMunVdevtrib: DoubleNullable;
    FIbsMunPredaliq: DoubleNullable;
    FIbsMunAliqefet: DoubleNullable;
    FVIbsMun: Double;
    FVIbs: Double;
    FPCbs: Double;
    FCbsPdif: DoubleNullable;
    FCbsVdif: DoubleNullable;
    FCbsVdevTrib: DoubleNullable;
    FCbsPredAliq: DoubleNullable;
    FCbsAliqEfet: DoubleNullable;
    FVCbs: Double;
    FTribRegular: TributoDFeIbsCbsTribRegEtd;
    FCompraGov: TributoDFeIbsCbsCompraGovEtd;
    procedure SetCompraGov(const Value: TributoDFeIbsCbsCompraGovEtd);
    procedure SetTribRegular(const Value: TributoDFeIbsCbsTribRegEtd);
  public
    constructor Create; overload;
    constructor Create(
      const AId: string;
      AvBc: Double;
      APIbsUf: Double;
      const AIbsUfPdif: DoubleNullable;
      const AIbsUfVdif: DoubleNullable;
      const AIbsUfVdevtrib: DoubleNullable;
      const AIbsUfPredaliq: DoubleNullable;
      const AIbsUfAliqefet: DoubleNullable;
      AVibsUf: Double;
      APibsMun: Double;
      const AIbsMunPdif: DoubleNullable;
      const AIbsMunVdif: DoubleNullable;
      const AIbsMunVdevtrib: DoubleNullable;
      const AIbsMunPredaliq: DoubleNullable;
      const AIbsMunAliqefet: DoubleNullable;
      AVIbsMun: Double;
      AVIbs: Double;
      APCbs: Double;
      const ACbsPdif: DoubleNullable;
      const ACbsVdif: DoubleNullable;
      const ACbsVdevTrib: DoubleNullable;
      const ACbsPredAliq: DoubleNullable;
      const ACbsAliqEfet: DoubleNullable;
      AVCbs: Double;
      ATribRegular: TributoDFeIbsCbsTribRegEtd;
      ACompraGov: TributoDFeIbsCbsCompraGovEtd
    ); overload;     
    destructor Destroy; override;

    function Clone(): TributoDFeGrupoIbsCbsEtd;
    function IsEqualTo(const Other: TributoDFeGrupoIbsCbsEtd): Boolean;

    property Id: string read FId write FId;
    property VBc: Double read FvBc write FvBc;
    property PIbsUf: Double read FPIbsUf write FPIbsUf;
    property IbsUfPdif: DoubleNullable read FIbsUfPdif write FIbsUfPdif;
    property IbsUfVdif: DoubleNullable read FIbsUfVdif write FIbsUfVdif;
    property IbsUfVDevTrib: DoubleNullable read FIbsUfVdevtrib write FIbsUfVdevtrib;
    property IbsUfPredAliq: DoubleNullable read FIbsUfPredaliq write FIbsUfPredaliq;
    property IbsUfAliqEfet: DoubleNullable read FIbsUfAliqefet write FIbsUfAliqefet;
    property VIbsUf: Double read FVibsUf write FVibsUf;
    property Pibsmun: Double read FPibsMun write FPibsMun;
    property IbsMunPdif: DoubleNullable read FIbsMunPdif write FIbsMunPdif;
    property IbsMunVdif: DoubleNullable read FIbsMunVdif write FIbsMunVdif;
    property IbsMunVDevTrib: DoubleNullable read FIbsMunVdevtrib write FIbsMunVdevtrib;
    property IbsMunPredAliq: DoubleNullable read FIbsMunPredaliq write FIbsMunPredaliq;
    property IbsMunAliqEfet: DoubleNullable read FIbsMunAliqefet write FIbsMunAliqefet;
    property VIbsmun: Double read FVIbsMun write FVIbsMun;
    property VIbs: Double read FVIbs write FVIbs;
    property PCbs: Double read FPCbs write FPCbs;
    property CbsPdif: DoubleNullable read FCbsPdif write FCbsPdif;
    property CbsVdif: DoubleNullable read FCbsVdif write FCbsVdif;
    property CbsVDevTrib: DoubleNullable read FCbsVdevTrib write FCbsVdevTrib;
    property CbsPredAliq: DoubleNullable read FCbsPredAliq write FCbsPredAliq;
    property CbsAliqEfet: DoubleNullable read FCbsAliqEfet write FCbsAliqEfet;
    property VCbs: Double read FVCbs write FVCbs;
    property TribRegular: TributoDFeIbsCbsTribRegEtd read FTribRegular write SetTribRegular;
    property CompraGov: TributoDFeIbsCbsCompraGovEtd read FCompraGov write SetCompraGov;
  end;

implementation

constructor TributoDFeGrupoIbsCbsEtd.Create;
begin
  // Construtor vazio
end;

function TributoDFeGrupoIbsCbsEtd.Clone: TributoDFeGrupoIbsCbsEtd;
begin
  if Self = nil then
    Result := nil
  else
    Result := TributoDFeGrupoIbsCbsEtd.Create(
      FId,
      FvBc,
      FPIbsUf,
      FIbsUfPdif,
      FIbsUfVdif,
      FIbsUfVdevtrib,
      FIbsUfPredaliq,
      FIbsUfAliqefet,
      FVibsUf,
      FPibsMun,
      FIbsMunPdif,
      FIbsMunVdif,
      FIbsMunVdevtrib,
      FIbsMunPredaliq,
      FIbsMunAliqefet,
      FVIbsMun,
      FVIbs,
      FPCbs,
      FCbsPdif,
      FCbsVdif,
      FCbsVdevTrib,
      FCbsPredAliq,
      FCbsAliqEfet,
      FVCbs,
      FTribRegular.Clone(),
      FCompraGov.Clone()
    );
end;

constructor TributoDFeGrupoIbsCbsEtd.Create(
  const AId: string;
  AvBc: Double;
  APIbsUf: Double;
  const AIbsUfPdif: DoubleNullable;
  const AIbsUfVdif: DoubleNullable;
  const AIbsUfVdevtrib: DoubleNullable;
  const AIbsUfPredaliq: DoubleNullable;
  const AIbsUfAliqefet: DoubleNullable;
  AVibsUf: Double;
  APibsMun: Double;
  const AIbsMunPdif: DoubleNullable;
  const AIbsMunVdif: DoubleNullable;
  const AIbsMunVdevtrib: DoubleNullable;
  const AIbsMunPredaliq: DoubleNullable;
  const AIbsMunAliqefet: DoubleNullable;
  AVIbsMun: Double;
  AVIbs: Double;
  APCbs: Double;
  const ACbsPdif: DoubleNullable;
  const ACbsVdif: DoubleNullable;
  const ACbsVdevTrib: DoubleNullable;
  const ACbsPredAliq: DoubleNullable;
  const ACbsAliqEfet: DoubleNullable;
  AVCbs: Double;
  ATribRegular: TributoDFeIbsCbsTribRegEtd;
  ACompraGov: TributoDFeIbsCbsCompraGovEtd
);
begin
  FId := AId;
  FvBc := AVbc;
  FPIbsUf := APibsuf;
  FIbsUfPdif := AIbsufPdif;
  FIbsUfVdif := AIbsufVdif;
  FIbsUfVdevtrib := AIbsufVdevtrib;
  FIbsUfPredaliq := AIbsufPredaliq;
  FIbsUfAliqefet := AIbsufAliqefet;
  FVibsUf := AVibsuf;
  FPibsMun := APibsmun;
  FIbsMunPdif := AIbsmunPdif;
  FIbsMunVdif := AIbsmunVdif;
  FIbsMunVdevtrib := AIbsmunVdevtrib;
  FIbsMunPredaliq := AIbsmunPredaliq;
  FIbsMunAliqefet := AIbsmunAliqefet;
  FVIbsMun := AVibsmun;
  FVIbs := AVibs;
  FPCbs := APcbs;
  FCbsPdif := ACbsPdif;
  FCbsVdif := ACbsVdif;
  FCbsVdevTrib := ACbsVdevtrib;
  FCbsPredAliq := ACbsPredaliq;
  FCbsAliqEfet := ACbsAliqefet;
  FVCbs := AVcbs;

  FTribRegular := ATribRegular;
  FCompraGov := ACompraGov;
end;

destructor TributoDFeGrupoIbsCbsEtd.Destroy;
begin
  FTribRegular.Free();
  FCompraGov.Free();

  inherited;
end;

procedure TributoDFeGrupoIbsCbsEtd.SetCompraGov(const Value: TributoDFeIbsCbsCompraGovEtd);
begin
  if FCompraGov <> Value then
  begin
    FCompraGov.Free();
    FCompraGov := Value;
  end;
end;

procedure TributoDFeGrupoIbsCbsEtd.SetTribRegular(const Value: TributoDFeIbsCbsTribRegEtd);
begin
  if FTribRegular <> Value then
  begin
    FTribRegular.Free();
    FTribRegular := Value;
  end;
end;

function TributoDFeGrupoIbsCbsEtd.IsEqualTo(const Other: TributoDFeGrupoIbsCbsEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.Id = Other.Id)
      and (Self.VBc = Other.VBc)
      and (Self.PIbsUf = Other.PIbsUf)
      and Self.IbsUfPdif.IsEqualTo(Other.IbsUfPdif)
      and Self.IbsUfVdif.IsEqualTo(Other.IbsUfVdif)
      and Self.IbsUfVDevTrib.IsEqualTo(Other.IbsUfVDevTrib)
      and Self.IbsUfPredAliq.IsEqualTo(Other.IbsUfPredAliq)
      and Self.IbsUfAliqEfet.IsEqualTo(Other.IbsUfAliqEfet)
      and (Self.VIbsUf = Other.VIbsUf)
      and (Self.Pibsmun = Other.Pibsmun)
      and Self.IbsMunPdif.IsEqualTo(Other.IbsMunPdif)
      and Self.IbsMunVdif.IsEqualTo(Other.IbsMunVdif)
      and Self.IbsMunVDevTrib.IsEqualTo(Other.IbsMunVDevTrib)
      and Self.IbsMunPredAliq.IsEqualTo(Other.IbsMunPredAliq)
      and Self.IbsMunAliqEfet.IsEqualTo(Other.IbsMunAliqEfet)
      and (Self.VIbsmun = Other.VIbsmun)
      and (Self.VIbs = Other.VIbs)
      and (Self.PCbs = Other.PCbs)
      and Self.CbsPdif.IsEqualTo(Other.CbsPdif)
      and Self.CbsVdif.IsEqualTo(Other.CbsVdif)
      and Self.CbsVDevTrib.IsEqualTo(Other.CbsVDevTrib)
      and Self.CbsPredAliq.IsEqualTo(Other.CbsPredAliq)
      and Self.CbsAliqEfet.IsEqualTo(Other.CbsAliqEfet)
      and (Self.VCbs = Other.VCbs)
      and Self.TribRegular.IsEqualTo(Other.TribRegular)
      and Self.CompraGov.IsEqualTo(Other.CompraGov);
end;

end.
