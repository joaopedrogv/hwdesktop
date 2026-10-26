unit NFSeEtdUnit;

interface

uses
  Classes,
  SysUtils,
  Contnrs,
  EntityBaseUnit,
  StringNullableUnit,
  IntegerNullableUnit,
  CurrencyNullableUnit,
  DateAndTimeNullableUnit,
  TipoComunsUnit, 
  TipoServicoEtdUnit,
  NFSeTypesUnit,
  NFSeParticipanteEtdUnit,
  NFSeSubstEtdUnit,
  DFeTypesUnit;

type
  NFSeEtd = class(EntityBase)
  private
    FId: string;
    FSeqId: Integer;
    FCodEmpresa: Integer;
    FCodCliente: IntegerNullable;
    FIntermediarioId: IntegerNullable;
    FDestIbsCbsId: IntegerNullable;
    FOpInternaId: StringNullable;
    FLayoutNFSe: LayoutNFSeEnum;
    FSituacao: SituacaoNFSeEnum;
    FNaturezaEmissao: NaturezaEmissaoNFSeEnum;
    FTpamb: TipoAmbienteEnum;
    FDhemi: DateTimeNullable;
    FVeraplic: StringNullable;
    FSerie: StringNullable;
    FNDps: IntegerNullable;
    FDcompet: DateNullable;
    FClocprestacao: IntegerNullable;
    FFinNFSe: Integer;
    FCIndOp: StringNullable;
    FTpOper: TipoOperEnteGovEnum;
    FTpEnteGov: TipoEnteGovEnum;
    FIndDest: Integer;
    FCCNAE: StringNullable;
    FCLC116: StringNullable;
    FCTribNac: StringNullable;
    FCTribMun: StringNullable;
    FXDescServ: StringNullable;
    FCnbs: StringNullable;
    FCodServico: IntegerNullable;
    FVserv: CurrencyNullable;
    FVdescincond: CurrencyNullable;
    FTribIssQn: TributacaoISSQNEnum;
    FTpretissqn: TipoRetencaoISSQNEnum;
    FIssPAliq: CurrencyNullable;
    FIssVBC: CurrencyNullable;
    FVIss: CurrencyNullable;
    FPcCst: StringNullable;
    FPcVbcpiscofins: CurrencyNullable;
    FPcPaliqPis: CurrencyNullable;
    FPcPaliqCofins: CurrencyNullable;
    FPcVpis: CurrencyNullable;
    FPcVcofins: CurrencyNullable;
    FTpretPiscofins: TipoRetencaoPisCofinsEnum;
    FVRetIrrf: CurrencyNullable;
    FVRetCsll: CurrencyNullable;
    FVRetCP: CurrencyNullable;
    FVRetPis: CurrencyNullable;
    FVRetCofins: CurrencyNullable;
    FPTotTribFed: CurrencyNullable;
    FPTotTribEst: CurrencyNullable;
    FPTotTribMun: CurrencyNullable;
    FIndtottrib: YesNoEnum;
    FPTotTribSN: CurrencyNullable;
    FNLote: StringNullable;
    FNProtocolo: StringNullable;
    FChaveNFSe: StringNullable;
    FDhProc: DateTimeNullable;
    FCCtat: StringNullable;
    FNNFSe: Int64Nullable;
    FNDFSe: Int64Nullable;
    FVLiq: CurrencyNullable;
    FVTotNf: CurrencyNullable;
    FPRedutor: CurrencyNullable;
    FVTotalRet: CurrencyNullable;
    FCVerificacao: StringNullable;
    FCancOrigem: OrigemCancelamentoNFSeEnum;
    FDhCanc: DateTimeNullable;
    FRefNFSe: TArrayString;
    FTomador: NFSeParticipanteEtd;
    FPrestador: NFSeParticipanteEtd;
    FIntermediario: NFSeParticipanteEtd;
    FDestIbsCbs: NFSeParticipanteEtd;
    FServico: TipoServicoEtd;
    FSubstituida: NFSeSubstEtd;

    procedure SetTomador(const Value: NFSeParticipanteEtd);
    procedure SetPrestador(const Value: NFSeParticipanteEtd);
    procedure SetIntermediario(const Value: NFSeParticipanteEtd);
    procedure SetDestIbsCbs(const Value: NFSeParticipanteEtd);
    procedure SetServico(const Value: TipoServicoEtd);
    procedure SetSubstituida(const Value: NFSeSubstEtd);
    procedure SetParticipantePrincipal(const Value: NFSeParticipanteEtd);
    function GetParticipantePrincipal: NFSeParticipanteEtd;
  public
    constructor Create(); overload;
    constructor Create(
      const AId: string;
      ASeqId: Integer;
      ACodEmpresa: Integer;
      const ACodCliente: IntegerNullable;
      const AIntermediarioId: IntegerNullable;
      const ADestIbsCbsId: IntegerNullable;
      const AOpInternaId: StringNullable;
      ALayoutNFSe: LayoutNFSeEnum;
      ASituacao: SituacaoNFSeEnum;
      ANaturezaEmissao: NaturezaEmissaoNFSeEnum;
      ATpamb: TipoAmbienteEnum;
      const ADhemi: DateTimeNullable;
      const AVeraplic: StringNullable;
      const ASerie: StringNullable;
      const ANdps: IntegerNullable;
      const ADcompet: DateNullable;
      const AClocprestacao: IntegerNullable;
      AFinNfse: Integer;
      const ACindop: StringNullable;
      ATpoper: TipoOperEnteGovEnum;
      ATpentegov: TipoEnteGovEnum;
      AInddest: Integer;
      const ACCNAE: StringNullable;
      const ACLC116: StringNullable;
      const ACTribNac: StringNullable;
      const ACTribMun: StringNullable;
      const AXDescServ: StringNullable;
      const ACnbs: StringNullable;
      const ACodServico: IntegerNullable;
      const AVserv: CurrencyNullable;
      const AVdescincond: CurrencyNullable;
      ATribissqn: TributacaoISSQNEnum;
      ATpretissqn: TipoRetencaoISSQNEnum;
      const AIssPAliq: CurrencyNullable;
      const AIssVBC: CurrencyNullable;
      const AVIss: CurrencyNullable;
      const APcCst: StringNullable;
      const APcVbcpiscofins: CurrencyNullable;
      const APcPaliquispis: CurrencyNullable;
      const APcPaliquiscofins: CurrencyNullable;
      const APcVpis: CurrencyNullable;
      const APcVcofins: CurrencyNullable;
      ATpretPiscofins: TipoRetencaoPisCofinsEnum;
      const AVRetIrrf: CurrencyNullable;
      const AVRetCsll: CurrencyNullable;
      const AVRetCP: CurrencyNullable;
      const AVRetPis: CurrencyNullable;
      const AVRetCofins: CurrencyNullable;
      const APTotTribFed: CurrencyNullable;
      const APTotTribEst: CurrencyNullable;
      const APTotTribMun: CurrencyNullable;
      AIndtottrib: YesNoEnum;
      const APTotTribSN: CurrencyNullable;
      const ANLote: StringNullable;
      const ANProtocolo: StringNullable;
      const AChaveNFSe: StringNullable;
      const ADhProc: DateTimeNullable;
      const ACStat: StringNullable;
      const ANNFSe: Int64Nullable;
      const ANDFSe: Int64Nullable;
      const AVLiq: CurrencyNullable;
      const AVTotNf: CurrencyNullable;
      const APRedutor: CurrencyNullable;
      const AVTotalRet: CurrencyNullable;
      const ACVerificacao: StringNullable;
      const ACancOrigem: OrigemCancelamentoNFSeEnum;
      const ADhCanc: DateTimeNullable;
      const ARefNFSe: TArrayString;
      ATomador: NFSeParticipanteEtd;
      APrestador: NFSeParticipanteEtd;
      AIntermediario: NFSeParticipanteEtd;
      ADestIbsCbs: NFSeParticipanteEtd;
      AServico: TipoServicoEtd;
      ASubstituida: NFSeSubstEtd
    ); overload;
    destructor Destroy; override;

    function Clone(): EntityBase; override;
    function IsEqualTo(const Other: NFSeEtd): Boolean;

    function IsPadraoNacional(): Boolean;
    function LayoutNFSeComIbsCbs(): Boolean;
    function EstaEmDigitacao(): Boolean;
    function EstaFinalizada(): Boolean;
    function IsEmissaoPropria(): Boolean;
    function IsEmissaoSistema(): Boolean;
    function IsPisRetido(): Boolean;
    function IsCofinsRetido(): Boolean;
    function GetAuditLabel(const Additional: string = ''): string; override;
    function GetAuditKey(): string; override;
    function GetDhFatoGerador(): TDateTime;
    function GetAnoFatoGerador(): SmallInt;

    procedure CalcularTpRetPisCofins();
    procedure AplicarAtribuirServico(const AServico: TipoServicoEtd);

    property Id: string read FId write FId;
    property SeqId: Integer read FSeqId;
    property CodEmpresa: Integer read FCodEmpresa write FCodEmpresa;
    property CodCliente: IntegerNullable read FCodCliente write FCodCliente;
    property IntermediarioId: IntegerNullable read FIntermediarioId write FIntermediarioId;
    property DestIbsCbsId: IntegerNullable read FDestIbsCbsId write FDestIbsCbsId;
    property OpInternaId: StringNullable read FOpInternaId write FOpInternaId;
    property LayoutNFSe: LayoutNFSeEnum read FLayoutNFSe write FLayoutNFSe;
    property Situacao: SituacaoNFSeEnum read FSituacao write FSituacao;
    property NaturezaEmissao: NaturezaEmissaoNFSeEnum read FNaturezaEmissao write FNaturezaEmissao;
    property TpAmb: TipoAmbienteEnum read FTpAmb write FTpAmb;
    property DhEmi: DateTimeNullable read FDhEmi write FDhEmi;
    property VerAplic: StringNullable read FVerAplic write FVerAplic;
    property Serie: StringNullable read FSerie write FSerie;
    property NDps: IntegerNullable read FNDps write FNDps;
    property DCompet: DateNullable read FDcompet write FDcompet;
    property CLocPrestacao: IntegerNullable read FClocprestacao write FClocprestacao;
    property FinNFSe: Integer read FFinNFSe write FFinNFSe;
    property CIndOp: StringNullable read FCIndOp write FCIndOp;
    property TpOper: TipoOperEnteGovEnum read FTpOper write FTpOper;
    property TpEnteGov: TipoEnteGovEnum read FTpEnteGov write FTpEnteGov;
    property IndDest: Integer read FIndDest write FIndDest;
    property CCNAE: StringNullable read FCCNAE write FCCNAE;
    property CLC116: StringNullable read FCLC116 write FCLC116;
    property CTribNac: StringNullable read FCTribNac write FCTribNac;
    property CTribMun: StringNullable read FCTribMun write FCTribMun;
    property XDescServ: StringNullable read FXDescServ write FXDescServ;
    property CNBS: StringNullable read FCnbs write FCnbs;
    property CodServico: IntegerNullable read FCodServico write FCodServico;
    property VServ: CurrencyNullable read FVserv write FVserv;
    property VDescIncond: CurrencyNullable read FVdescincond write FVdescincond;
    property TribIssQn: TributacaoISSQNEnum read FTribIssQn write FTribIssQn;
    property TpRetIssQn: TipoRetencaoISSQNEnum read FTpretissqn write FTpretissqn;
    property IssPAliq: CurrencyNullable read FIssPAliq write FIssPAliq;
    property IssVBC: CurrencyNullable read FIssVBC write FIssVBC;
    property VIss: CurrencyNullable read FVIss write FVIss;
    property PCCst: StringNullable read FPcCst write FPcCst;
    property PCVBcPisCofins: CurrencyNullable read FPcVbcpiscofins write FPcVbcpiscofins;
    property PCPAliqPis: CurrencyNullable read FPcPaliqPis write FPcPaliqPis;
    property PCPAliqCofins: CurrencyNullable read FPcPaliqCofins write FPcPaliqCofins;
    property PCVPis: CurrencyNullable read FPcVpis write FPcVpis;
    property PCVCofins: CurrencyNullable read FPcVcofins write FPcVcofins;
    property TpRetPisCofins: TipoRetencaoPisCofinsEnum read FTpretPiscofins write FTpretPiscofins;
    property VRetIrrf: CurrencyNullable read FVRetIrrf write FVRetIrrf;
    property VRetCsll: CurrencyNullable read FVRetCsll write FVRetCsll;
    property VRetCP: CurrencyNullable read FVRetCP write FVRetCP;
    property VRetPis: CurrencyNullable read FVRetPis write FVRetPis;
    property VRetCofins: CurrencyNullable read FVRetCofins write FVRetCofins;
    property PTotTribFed: CurrencyNullable read FPTotTribFed write FPTotTribFed;
    property PTotTribEst: CurrencyNullable read FPTotTribEst write FPTotTribEst;
    property PTotTribMun: CurrencyNullable read FPTotTribMun write FPTotTribMun;
    property IndTotTrib: YesNoEnum read FIndtottrib write FIndtottrib;
    property PTotTribSN: CurrencyNullable read FPTotTribSN write FPTotTribSN;
    property NLote: StringNullable read FNLote write FNLote;
    property NProtocolo: StringNullable read FNProtocolo write FNProtocolo;
    property ChaveNFSe: StringNullable read FChaveNFSe write FChaveNFSe;
    property DhProc: DateTimeNullable read FDhProc write FDhProc;
    property CCtat: StringNullable read FCCtat write FCCtat;
    property NNFSe: Int64Nullable read FNNFSe write FNNFSe;
    property NDFSe: Int64Nullable read FNDFSe write FNDFSe;
    property VLiq: CurrencyNullable read FVLiq write FVLiq;
    property VTotNf: CurrencyNullable read FVTotNf write FVTotNf;
    property PRedutor: CurrencyNullable read FPRedutor write FPRedutor;
    property VTotalRet: CurrencyNullable read FVTotalRet write FVTotalRet;
    property CVerificacao: StringNullable read FCVerificacao write FCVerificacao;
    property CancOrigem: OrigemCancelamentoNFSeEnum read FCancOrigem write FCancOrigem;
    property DhCanc: DateTimeNullable read FDhCanc write FDhCanc;
    property RefNFSe: TArrayString read FRefNFSe write FRefNFSe;
    property Tomador: NFSeParticipanteEtd read FTomador;// write SetTomador;
    property Prestador: NFSeParticipanteEtd read FPrestador write SetPrestador;
    property Intermediario: NFSeParticipanteEtd read FIntermediario write SetIntermediario;
    property DestIbsCbs: NFSeParticipanteEtd read FDestIbsCbs write SetDestIbsCbs;
    property Servico: TipoServicoEtd read FServico write SetServico;
    property Substituida: NFSeSubstEtd read FSubstituida write SetSubstituida;
    property ParticipantePrincipal: NFSeParticipanteEtd read GetParticipantePrincipal write SetParticipantePrincipal;
  end;

  NFSeEtdList = class(TObjectList);

implementation

uses
  StrUtils, DateUtils;

{ NFSeEtd }

constructor NFSeEtd.Create();
begin
  inherited Create;
end;

constructor NFSeEtd.Create(
  const AId: string;
  ASeqId: Integer;
  ACodEmpresa: Integer;
  const ACodCliente: IntegerNullable;
  const AIntermediarioId: IntegerNullable;
  const ADestIbsCbsId: IntegerNullable;
  const AOpInternaId: StringNullable;
  ALayoutNFSe: LayoutNFSeEnum;
  ASituacao: SituacaoNFSeEnum;
  ANaturezaEmissao: NaturezaEmissaoNFSeEnum;
  ATpamb: TipoAmbienteEnum;
  const ADhemi: DateTimeNullable;
  const AVeraplic: StringNullable;
  const ASerie: StringNullable;
  const ANdps: IntegerNullable;
  const ADcompet: DateNullable;
  const AClocprestacao: IntegerNullable;
  AFinNfse: Integer;
  const ACindop: StringNullable;
  ATpoper: TipoOperEnteGovEnum;
  ATpentegov: TipoEnteGovEnum;
  AInddest: Integer;
  const ACCNAE: StringNullable;
  const ACLC116: StringNullable;
  const ACTribNac: StringNullable;
  const ACTribMun: StringNullable;
  const AXDescServ: StringNullable;
  const ACnbs: StringNullable;
  const ACodServico: IntegerNullable;
  const AVserv: CurrencyNullable;
  const AVdescincond: CurrencyNullable;
  ATribissqn: TributacaoISSQNEnum;
  ATpretissqn: TipoRetencaoISSQNEnum;
  const AIssPAliq: CurrencyNullable;
  const AIssVBC: CurrencyNullable;
  const AVIss: CurrencyNullable;
  const APcCst: StringNullable;
  const APcVbcpiscofins: CurrencyNullable;
  const APcPaliquispis: CurrencyNullable;
  const APcPaliquiscofins: CurrencyNullable;
  const APcVpis: CurrencyNullable;
  const APcVcofins: CurrencyNullable;
  ATpretPiscofins: TipoRetencaoPisCofinsEnum;
  const AVRetIrrf: CurrencyNullable;
  const AVRetCsll: CurrencyNullable;
  const AVRetCP: CurrencyNullable;
  const AVRetPis: CurrencyNullable;
  const AVRetCofins: CurrencyNullable;
  const APTotTribFed: CurrencyNullable;
  const APTotTribEst: CurrencyNullable;
  const APTotTribMun: CurrencyNullable;
  AIndtottrib: YesNoEnum;
  const APTotTribSN: CurrencyNullable;
  const ANLote: StringNullable;
  const ANProtocolo: StringNullable;
  const AChaveNFSe: StringNullable;
  const ADhProc: DateTimeNullable;
  const ACStat: StringNullable;
  const ANNFSe: Int64Nullable;
  const ANDFSe: Int64Nullable;
  const AVLiq: CurrencyNullable;
  const AVTotNf: CurrencyNullable;
  const APRedutor: CurrencyNullable;
  const AVTotalRet: CurrencyNullable;
  const ACVerificacao: StringNullable;
  const ACancOrigem: OrigemCancelamentoNFSeEnum;
  const ADhCanc: DateTimeNullable;
  const ARefNFSe: TArrayString;
  ATomador: NFSeParticipanteEtd;
  APrestador: NFSeParticipanteEtd;
  AIntermediario: NFSeParticipanteEtd;
  ADestIbsCbs: NFSeParticipanteEtd;
  AServico: TipoServicoEtd;
  ASubstituida: NFSeSubstEtd
);
begin
  Create();
  FId := AId;
  FSeqId := ASeqId;
  FCodEmpresa := ACodEmpresa;
  FCodCliente := ACodCliente;
  FIntermediarioId := AIntermediarioId;
  FDestIbsCbsId := ADestIbsCbsId;
  FOpInternaId := AOpInternaId;
  FLayoutNFSe := ALayoutNFSe;
  FSituacao := ASituacao;
  FNaturezaEmissao := ANaturezaEmissao;
  FTpAmb := ATpamb;
  FDhEmi := ADhemi;
  FVerAplic := AVeraplic;
  FSerie := ASerie;
  FNDps := ANdps;
  FDcompet := ADcompet;
  FClocprestacao := AClocprestacao;
  FFinNFSe := AFinNfse;
  FCIndOp := ACindop;
  FTpOper := ATpoper;
  FTpEnteGov := ATpentegov;
  FIndDest := AInddest;
  FCCNAE := ACCNAE;
  FCLC116 := ACLC116;
  FCTribNac := ACTribNac;
  FCTribMun := ACTribMun;
  FXDescServ := AXDescServ;
  FCnbs := ACnbs;
  FCodServico := ACodServico;
  FVserv := AVserv;
  FVdescincond := AVdescincond;
  FTribIssQn := ATribissqn;
  FTpretissqn := ATpretissqn;
  FIssPAliq := AIssPAliq;
  FIssVBC := AIssVBC;
  FVIss := AVIss;
  FPcCst := APcCst;
  FPcVbcpiscofins := APcVbcpiscofins;
  FPcPaliqPis := APcPaliquispis;
  FPcPaliqCofins := APcPaliquiscofins;
  FPcVpis := APcVpis;
  FPcVcofins := APcVcofins;
  FTpretPiscofins := ATpretPiscofins;
  FVRetIrrf := AVRetIrrf;
  FVRetCsll := AVRetCsll;
  FVRetCP := AVRetCP;
  FVRetPis := AVRetPis;
  FVRetCofins := AVRetCofins;
  FPTotTribFed := APTotTribFed;
  FPTotTribEst := APTotTribEst;
  FPTotTribMun := APTotTribMun;
  FIndtottrib := AIndtottrib;
  FPTotTribSN := APTotTribSN;
  FNLote := ANLote;
  FNProtocolo := ANProtocolo;
  FChaveNFSe := AChaveNFSe;
  FDhProc := ADhProc;
  FCCtat := ACStat;
  FNNFSe := ANNFSe;
  FNDFSe := ANDFSe;
  FVLiq := AVLiq;
  FVTotNf := AVTotNf;
  FPRedutor := APRedutor;
  FVTotalRet := AVTotalRet;
  FCVerificacao := ACVerificacao;
  FCancOrigem := ACancOrigem;
  FDhCanc := ADhCanc;
  FRefNFSe := ARefNFSe;
  FTomador := ATomador;
  FPrestador := APrestador;
  FIntermediario := AIntermediario;
  FDestIbsCbs := ADestIbsCbs;
  FServico := AServico;
  FSubstituida := ASubstituida;
end;

destructor NFSeEtd.Destroy;
begin
  if Assigned(FTomador) then
    FreeAndNil(FTomador);
  if Assigned(FPrestador) then
    FreeAndNil(FPrestador);
  if Assigned(FIntermediario) then
    FreeAndNil(FIntermediario);
  if Assigned(FDestIbsCbs) then
    FreeAndNil(FDestIbsCbs);
  if Assigned(FServico) then
    FreeAndNil(FServico);
  if Assigned(FSubstituida) then
    FreeAndNil(FSubstituida);

  inherited;
end;

function NFSeEtd.EstaEmDigitacao: Boolean;
begin
  Result := FSituacao in [ sdpsRascunho, sdpsRejeicao ];
end;

function NFSeEtd.EstaFinalizada: Boolean;
begin
  Result := FSituacao in [ sdpsAutorizada, sdpsCancelada, sdpsSubstituida ];
end;

function NFSeEtd.GetAnoFatoGerador: SmallInt;
begin
  Result := YearOf(GetDhFatoGerador());
end;

function NFSeEtd.GetAuditKey: string;
begin
  Result := IntToStr(FSeqId);
end;

function NFSeEtd.GetAuditLabel(const Additional: string): string;
begin
  Result := Format('Seq %d - Dps %s/%s - NF %s', [
    FSeqId, IfThen(FNDps.HasValue, IntToStr(FNDps.Value)), FSerie.Value, IfThen(FNNFSe.HasValue, IntToStr(FNNFSe.Value))
  ])
  + IfThen(Additional <> '', ' - ' + Additional);
end;

function NFSeEtd.GetDhFatoGerador: TDateTime;
begin
  if FDcompet.HasValue then
    Result := FDcompet.Value

  else if FDhemi.HasValue then
    Result := FDhemi.Value

  else
    Result := Now();
end;

function NFSeEtd.GetParticipantePrincipal: NFSeParticipanteEtd;
begin
  if IsEmissaoPropria then
    Result := FTomador
  else
    Result := FPrestador;
end;

function NFSeEtd.IsCofinsRetido: Boolean;
begin
  Result := FTpretPiscofins in [
    trpcRetido, trpiscofinscsllRetido, trpiscofinsRetidocsllNaoRetido, trCofinsRetidoPisCsllNaoRetido,
    trCofinsCsllRetidoPisNaoRetido
  ];
end;

function NFSeEtd.IsEmissaoPropria: Boolean;
begin
  Result := FNaturezaEmissao in [ nemtPrestadorWS, nemtPrestadorPortal ];
end;

function NFSeEtd.IsEmissaoSistema: Boolean;
begin
  Result := FNaturezaEmissao in [ nemtPrestadorWS ];
end;

function NFSeEtd.IsPadraoNacional: Boolean;
begin
  Result := FLayoutNFSe in [ lytNacionalSemIbsCbs, lytNacionalComIbsCbs ];
end;

function NFSeEtd.IsPisRetido: Boolean;
begin
  Result := FTpretPiscofins in [
    trpcRetido, trpiscofinscsllRetido, trpiscofinsRetidocsllNaoRetido, trPisRetidoCofinsCsllNaoRetido,
    trPisCsllRetidoCofinsNaoRetido
  ];
end;

function NFSeEtd.LayoutNFSeComIbsCbs: Boolean;
begin
  Result := FLayoutNFSe in [ lytNacionalComIbsCbs ];
end;

procedure NFSeEtd.SetDestIbsCbs(const Value: NFSeParticipanteEtd);
begin
  if FDestIbsCbs <> Value then
  begin
    FDestIbsCbs.Free;
    FDestIbsCbs := Value;
  end;
end;

procedure NFSeEtd.SetIntermediario(const Value: NFSeParticipanteEtd);
begin
  if FIntermediario <> Value then
  begin
    FIntermediario.Free;
    FIntermediario := Value;
  end;
end;

procedure NFSeEtd.SetParticipantePrincipal(const Value: NFSeParticipanteEtd);
begin
  if IsEmissaoPropria then
    SetTomador( Value )
  else
    SetPrestador( Value );
end;

procedure NFSeEtd.SetPrestador(const Value: NFSeParticipanteEtd);
begin
  if FPrestador <> Value then
  begin
    FPrestador.Free;
    FPrestador := Value;
  end;
end;

procedure NFSeEtd.SetServico(const Value: TipoServicoEtd);
begin
  if FServico <> Value then
  begin
    FServico.Free;
    FServico := Value;

    if FServico = nil then
      CodServico := IntegerNullable.NullInstance()
    else
      CodServico := IntegerNullable.Create(FServico.CodServico);
  end;
end;

procedure NFSeEtd.SetSubstituida(const Value: NFSeSubstEtd);
begin
  if FSubstituida <> Value then
  begin
    FSubstituida.Free;
    FSubstituida := Value;
  end;
end;

procedure NFSeEtd.SetTomador(const Value: NFSeParticipanteEtd);
begin
  if FTomador <> Value then
  begin
    FTomador.Free;
    FTomador := Value;
  end;
end;

procedure NFSeEtd.AplicarAtribuirServico(const AServico: TipoServicoEtd);
begin
  SetServico(AServico);

  if FServico = nil then
  begin
    FCodServico.SetNull();
    FCIndOp.SetNull();
    FCCNAE.SetNull();
    FCLC116.SetNull();
    FCTribNac.SetNull();
    FCTribMun.SetNull();
    FCNBS.SetNull();

    Exit;
  end;

  FCodServico := IntegerNullable.Create( FServico.CodServico );
  FCIndOp     := FServico.CIndOp;
  FCCNAE      := FServico.CNAE;
  FCLC116     := FServico.CodLC116;
  FCTribNac   := FServico.CTribNac;
  FCTribMun   := FServico.CTribMun;
  FCNBS       := FServico.CNBS;

  if FXDescServ.IsNullOrWhiteSpace() then
    FXDescServ := StringNullable.CreateOrNull( FServico.Descricao );
end;

procedure NFSeEtd.CalcularTpRetPisCofins;
begin
  if (Self.VRetPis.Value = 0) and (Self.VRetCofins.Value = 0) and (Self.VRetCsll.Value = 0) then
    FTpretPiscofins := trpiscofinscsllNaoRetido

  else if (Self.VRetPis.Value > 0) and (Self.VRetCofins.Value > 0) and (Self.VRetCsll.Value > 0) then
    FTpretPiscofins := trpiscofinscsllRetido

  else if (Self.VRetPis.Value > 0) and (Self.VRetCofins.Value > 0) and (Self.VRetCsll.Value <= 0) then
    FTpretPiscofins := trpiscofinsRetidocsllNaoRetido

  else if (Self.VRetPis.Value > 0) and (Self.VRetCofins.Value <= 0) and (Self.VRetCsll.Value <= 0) then
    FTpretPiscofins := trPisRetidoCofinsCsllNaoRetido

  else if (Self.VRetPis.Value <= 0) and (Self.VRetCofins.Value > 0) and (Self.VRetCsll.Value <= 0) then
    FTpretPiscofins := trCofinsRetidoPisCsllNaoRetido

  else if (Self.VRetPis.Value <= 0) and (Self.VRetCofins.Value > 0) and (Self.VRetCsll.Value > 0) then
    FTpretPiscofins := trCofinsCsllRetidoPisNaoRetido

  else if (Self.VRetPis.Value <= 0) and (Self.VRetCofins.Value <= 0) and (Self.VRetCsll.Value > 0) then
    FTpretPiscofins := trCsllRetidoPisCofinsNaoRetido

  else if (Self.VRetPis.Value > 0) and (Self.VRetCofins.Value <= 0) and (Self.VRetCsll.Value > 0) then
    FTpretPiscofins := trPisCsllRetidoCofinsNaoRetido

  else
    FTpretPiscofins := trpiscofinscsllNaoRetido;
end;

function NFSeEtd.Clone(): EntityBase;
var
  _Tomador, _Prestador, _Intermediario, _DestIbsCbs: NFSeParticipanteEtd;
  _Servico: TipoServicoEtd;
  _Substituida: NFSeSubstEtd;
begin
  if Self = nil then
    Result := nil
  else
  begin
    if FTomador = nil then
      _Tomador := nil
    else
      _Tomador := NFSeParticipanteEtd(FTomador.Clone());

    if FPrestador = nil then
      _Prestador := nil
    else
      _Prestador := NFSeParticipanteEtd(FPrestador.Clone());

    if FIntermediario = nil then
      _Intermediario := nil
    else
      _Intermediario := NFSeParticipanteEtd(FIntermediario.Clone());

    if FDestIbsCbs = nil then
      _DestIbsCbs := nil
    else
      _DestIbsCbs := NFSeParticipanteEtd(FDestIbsCbs.Clone());

    if FServico = nil then
      _Servico := nil
    else
      _Servico := TipoServicoEtd(FServico.Clone());

    if FSubstituida = nil then
      _Substituida := nil
    else
      _Substituida := NFSeSubstEtd(FSubstituida.Clone());

    Result := NFSeEtd.Create(
      FId,
      FSeqId,
      FCodEmpresa,
      FCodCliente,
      FIntermediarioId,
      FDestIbsCbsId,
      FOpInternaId,
      FLayoutNFSe,
      FSituacao,
      FNaturezaEmissao,
      FTpAmb,
      FDhEmi,
      FVerAplic,
      FSerie,
      FNDps,
      FDcompet,
      FClocprestacao,
      FFinNFSe,
      FCIndOp,
      FTpOper,
      FTpEnteGov,
      FIndDest,
      FCCNAE,
      FCLC116,
      FCTribNac,
      FCTribMun,
      FXDescServ,
      FCnbs,
      FCodServico,
      FVserv,
      FVdescincond,
      FTribIssQn,
      FTpretissqn,
      FIssPAliq,
      FIssVBC,
      FVIss,
      FPcCst,
      FPcVbcpiscofins,
      FPcPaliqPis,
      FPcPaliqCofins,
      FPcVpis,
      FPcVcofins,
      FTpretPiscofins,
      FVRetIrrf,
      FVRetCsll,
      FVRetCP,
      FVRetPis,
      FVRetCofins,
      FPTotTribFed,
      FPTotTribEst,
      FPTotTribMun,
      FIndtottrib,
      FPTotTribSN,
      FNLote,
      FNProtocolo,
      FChaveNFSe,
      FDhProc,
      FCCtat,
      FNNFSe,
      FNDFSe,
      FVLiq,
      FVTotNf,
      FPRedutor,
      FVTotalRet,
      FCVerificacao,
      FCancOrigem,
      FDhCanc,
      FRefNFSe,
      _Tomador,
      _Prestador,
      _Intermediario,
      _DestIbsCbs,
      _Servico,
      _Substituida
    );
  end;
end;

function NFSeEtd.IsEqualTo(const Other: NFSeEtd): Boolean;
begin
  if (Self = nil) or (Other = nil) then
    Result := (Self = nil) and (Other = nil)
  else
    Result := (Self.Id = Other.Id)
      and (Self.SeqId = Other.SeqId)
      and (Self.CodEmpresa = Other.CodEmpresa)
      and Self.CodCliente.IsEqualTo(Other.CodCliente)
      and Self.IntermediarioId.IsEqualTo(Other.IntermediarioId)
      and Self.DestIbsCbsId.IsEqualTo(Other.DestIbsCbsId)
      and Self.OpInternaId.IsEqualTo(Other.OpInternaId)
      and (Self.LayoutNFSe = Other.LayoutNFSe)
      and (Self.Situacao = Other.Situacao)
      and (Self.NaturezaEmissao = Other.NaturezaEmissao)
      and (Self.TpAmb = Other.TpAmb)
      and Self.DhEmi.IsEqualTo(Other.DhEmi)
      and Self.VerAplic.IsEqualTo(Other.VerAplic)
      and Self.Serie.IsEqualTo(Other.Serie)
      and Self.NDps.IsEqualTo(Other.NDps)
      and Self.DCompet.IsEqualTo(Other.DCompet)
      and Self.CLocPrestacao.IsEqualTo(Other.CLocPrestacao)
      and (Self.FinNFSe = Other.FinNFSe)
      and Self.CIndOp.IsEqualTo(Other.CIndOp)
      and (Self.TpOper = Other.TpOper)
      and (Self.TpEnteGov = Other.TpEnteGov)
      and (Self.IndDest = Other.IndDest)
      and Self.CCNAE.IsEqualTo(Other.CCNAE)
      and Self.CLC116.IsEqualTo(Other.CLC116)
      and Self.CTribNac.IsEqualTo(Other.CTribNac)
      and Self.CTribMun.IsEqualTo(Other.CTribMun)
      and Self.XDescServ.IsEqualTo(Other.XDescServ)
      and Self.CNBS.IsEqualTo(Other.CNBS)
      and Self.CodServico.IsEqualTo(Other.CodServico)
      and Self.VServ.IsEqualTo(Other.VServ)
      and Self.VDescIncond.IsEqualTo(Other.VDescIncond)
      and (Self.TribIssQn = Other.TribIssQn)
      and (Self.TpRetIssQn = Other.TpRetIssQn)
      and Self.IssPAliq.IsEqualTo(Other.IssPAliq)
      and Self.IssVBC.IsEqualTo(Other.IssVBC)
      and Self.VIss.IsEqualTo(Other.VIss)
      and Self.PCCst.IsEqualTo(Other.PCCst)
      and Self.PCVBcPisCofins.IsEqualTo(Other.PCVBcPisCofins)
      and Self.PCPAliqPis.IsEqualTo(Other.PCPAliqPis)
      and Self.PCPAliqCofins.IsEqualTo(Other.PCPAliqCofins)
      and Self.PCVPis.IsEqualTo(Other.PCVPis)
      and Self.PCVCofins.IsEqualTo(Other.PCVCofins)
      and (Self.TpRetPisCofins = Other.TpRetPisCofins)
      and Self.VRetIrrf.IsEqualTo(Other.VRetIrrf)
      and Self.VRetCsll.IsEqualTo(Other.VRetCsll)
      and Self.VRetCP.IsEqualTo(Other.VRetCP)
      and Self.VRetPis.IsEqualTo(Other.VRetPis)
      and Self.VRetCofins.IsEqualTo(Other.VRetCofins)
      and Self.PTotTribFed.IsEqualTo(Other.PTotTribFed)
      and Self.PTotTribEst.IsEqualTo(Other.PTotTribEst)
      and Self.PTotTribMun.IsEqualTo(Other.PTotTribMun)
      and (Self.IndTotTrib = Other.IndTotTrib)
      and Self.PTotTribSN.IsEqualTo(Other.PTotTribSN)
      and Self.NLote.IsEqualTo(Other.NLote)
      and Self.NProtocolo.IsEqualTo(Other.NProtocolo)
      and Self.ChaveNFSe.IsEqualTo(Other.ChaveNFSe)
      and Self.DhProc.IsEqualTo(Other.DhProc)
      and Self.CCtat.IsEqualTo(Other.CCtat)
      and Self.NNFSe.IsEqualTo(Other.NNFSe)
      and Self.NDFSe.IsEqualTo(Other.NDFSe)
      and Self.VLiq.IsEqualTo(Other.VLiq)
      and Self.VTotNf.IsEqualTo(Other.VTotNf)
      and Self.PRedutor.IsEqualTo(Other.PRedutor)
      and Self.VTotalRet.IsEqualTo(Other.VTotalRet)
      and Self.CVerificacao.IsEqualTo(Other.CVerificacao)
      and (Self.CancOrigem = Other.CancOrigem)
      and Self.DhCanc.IsEqualTo(Other.DhCanc)
      and Self.Tomador.IsEqualTo(Other.Tomador)
      and Self.Prestador.IsEqualTo(Other.Prestador)
      and Self.Intermediario.IsEqualTo(Other.Intermediario)
      and Self.DestIbsCbs.IsEqualTo(Other.DestIbsCbs)
      and Self.Servico.IsEqualTo(Other.Servico)
      and Self.Substituida.IsEqualTo(Other.Substituida)
      and Self.ParticipantePrincipal.IsEqualTo(Other.ParticipantePrincipal);
end;

end.
