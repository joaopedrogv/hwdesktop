unit NFSeFrameUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Mask, StdCtrls, ExtCtrls, ComboBoxMunicipiosFrameUnit, Buttons, hw_audit_utils,
  uEditHw, ComCtrls, NFSeEtdUnit, ComboBoxRegrasFiscaisFrameUnit, NFSeModelUnit, TributoDFeContextEtdUnit,
  ComboBoxOpInternasFrameUnit, OperacaoInternaEtdUnit, NFSeParticipanteFrameUnit, NFSeTributosDFeFrameUnit,
  UCorrelFiscalNFSe, TipoComunsUnit;

type
  TNFSeFrame = class(TFrame)
    pnContent: TPanel;
    PanelResumo4: TPanel;
    Label5: TLabel;
    lbNumDpsRps1: TLabel;
    edSerie: TMaskEdit;
    PanelServicos1: TPanel;
    PanelServicos3: TPanel;
    Label14: TLabel;
    edDiscriminacao: TMemo;
    Label13: TLabel;
    edCodServico2: TMaskEdit;
    btPesquisarServico: TSpeedButton;
    PanelValores1: TPanel;
    Label15: TLabel;
    Label16: TLabel;
    edVServ2: TEditHw;
    edVDesc2: TEditHw;
    pageValores: TPageControl;
    tabISS: TTabSheet;
    tabPISCOFINS: TTabSheet;
    tabTotTrib: TTabSheet;
    Panel10: TPanel;
    Label25: TLabel;
    Label26: TLabel;
    edIssPAliq: TEditHw;
    edTribISSQN: TComboBox;
    Panel9: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    edpc_CST: TMaskEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edpc_vbc: TEditHw;
    edpc_ppis: TEditHw;
    edpc_pcofins: TEditHw;
    edpc_vpis: TEditHw;
    edpc_vcofins: TEditHw;
    Label24: TLabel;
    Label27: TLabel;
    edIssVBCISS: TEditHw;
    Label28: TLabel;
    edVISS: TEditHw;
    tabRetencoes: TTabSheet;
    Panel11: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    edret_virrf: TEditHw;
    edret_vcsll: TEditHw;
    Panel12: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    edvtrib_pfed: TEditHw;
    edvtrib_pest: TEditHw;
    Label31: TLabel;
    edvtrib_pmun: TEditHw;
    edvtrib_indtot: TCheckBox;
    edvtrib_ptot: TEditHw;
    Label32: TLabel;
    PanelIbsCbsNac1: TPanel;
    Label33: TLabel;
    PanelIbsCbsNac2: TPanel;
    Label36: TLabel;
    edTpFornecimento: TComboBox;
    Label35: TLabel;
    edTipoEnteGov: TComboBox;
    PanelIbsCbsNac3: TPanel;
    lbRegraIbsCbsNacCaption: TLabel;
    ComboBoxRegrasFiscaisFrame1: TComboBoxRegrasFiscaisFrame;
    Label38: TLabel;
    edCST: TMaskEdit;
    edCClassTrib: TMaskEdit;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    edCSTReg: TMaskEdit;
    edCClassTribReg: TMaskEdit;
    PanelIbsCbsNac5: TPanel;
    Label44: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    pnRegraIbsCbsNac: TPanel;
    pageDPS: TPageControl;
    tabResumo: TTabSheet;
    tabPart: TTabSheet;
    tabServ: TTabSheet;
    tabValores: TTabSheet;
    pnTopResumo: TPanel;
    Label45: TLabel;
    lbNumDpsRps: TLabel;
    lbSerieDps: TLabel;
    lbDhemi: TLabel;
    lbSituacao: TLabel;
    Label51: TLabel;
    ComboBoxOpInternasFrame1: TComboBoxOpInternasFrame;
    PanelResumo1: TPanel;
    Label53: TLabel;
    PanelIbsCbsNac4: TPanel;
    Label54: TLabel;
    edTipoRegra: TComboBox;
    pageParticipantes: TPageControl;
    tabPartPrincipal: TTabSheet;
    tabIntermediario: TTabSheet;
    DPSPartPrincipalFrame1: TNFSeParticipanteFrame;
    pnLinksTomador: TPanel;
    linkPesquisarPartPrincipal: TLabel;
    linkRemoverPartPrincipal: TLabel;
    Panel2: TPanel;
    linkPesquisarIntermediario: TLabel;
    linkRemoverIntermediario: TLabel;
    DPSIntermediarioFrame1: TNFSeParticipanteFrame;
    tabDestIbsCbs: TTabSheet;
    Panel16: TPanel;
    linkPesquisarDestIbsCbs: TLabel;
    linkRemoverDestIbcCbs: TLabel;
    DPSDestIbsCbsFrame1: TNFSeParticipanteFrame;
    PanelServicos2: TPanel;
    Label39: TLabel;
    Label52: TLabel;
    edCcnae: TMaskEdit;
    edClc116: TMaskEdit;
    Label10: TLabel;
    edCTribNac: TMaskEdit;
    Label11: TLabel;
    edCTribMun: TMaskEdit;
    Label12: TLabel;
    edCNBS: TMaskEdit;
    Panel23: TPanel;
    pnRetencoesComboNacional: TPanel;
    Label55: TLabel;
    edRetPISCOFINS: TComboBox;
    Label7: TLabel;
    edRetIss: TComboBox;
    edPDifIbsUF: TEditHw;
    edPDifIbsMun: TEditHw;
    edPDifCbs: TEditHw;
    Label40: TLabel;
    edret_vcp: TEditHw;
    tabSubst: TTabSheet;
    edNumeroDps: TEditHw;
    PanelResumo6: TPanel;
    Label6: TLabel;
    Label2: TLabel;
    edDataPrestacao: TMaskEdit;
    edChave: TMaskEdit;
    Label49: TLabel;
    edNumeroNFSe: TEditHw;
    Label1: TLabel;
    edDhemi: TMaskEdit;
    PanelNFSeSubst1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    edSubChave: TMaskEdit;
    edSubCMotivo: TComboBox;
    PanelNFSeSubst2: TPanel;
    Label8: TLabel;
    edSubXMotivo: TMaskEdit;
    PanelNFSeSubst3: TPanel;
    Label56: TLabel;
    Label59: TLabel;
    Label61: TLabel;
    edSubSerie: TMaskEdit;
    edSubNDps: TEditHw;
    edSubNNFSe: TEditHw;
    edSubNLote: TMaskEdit;
    Label64: TLabel;
    edSubCVerificacao: TMaskEdit;
    Label65: TLabel;
    PanelParticipantes1: TPanel;
    Label9: TLabel;
    ckIndDest: TCheckBox;
    PanelResumo2: TPanel;
    lbPartPrincipal: TLabel;
    btPesquisarPartPrincipal: TSpeedButton;
    edCodCliente: TMaskEdit;
    PanelResumo3: TPanel;
    Label68: TLabel;
    btPesquisarServico2: TSpeedButton;
    edCodServico: TMaskEdit;
    ComboBoxMunicipiosFrame1: TComboBoxMunicipiosFrame;
    btAtualizarDataEmissao: TSpeedButton;
    PanelResumo5: TPanel;
    Label66: TLabel;
    Label69: TLabel;
    edVServ: TEditHw;
    edVDesc: TEditHw;
    Label48: TLabel;
    lbLayout: TLabel;
    Label57: TLabel;
    lbNaturezaEmissao: TLabel;
    Label60: TLabel;
    Label50: TLabel;
    edTotNF: TEditHw;
    edTotRet: TEditHw;
    tabIbsCbsNac
    : TTabSheet;
    NFSeTributosDFeFrame1: TNFSeTributosDFeFrame;
    tabIbsCbsValores: TTabSheet;
    Panel18: TPanel;
    ckRetIss: TCheckBox;
    Label58: TLabel;
    edret_vpis: TEditHw;
    edret_vcofins: TEditHw;
    Label62: TLabel;
    linkInformarTribManual: TLabel;
    edcIndOp: TMaskEdit;
    linkCorrelacao2: TLabel;
    linkCorrelacao1: TLabel;
    Label70: TLabel;
    edVLIQ: TEditHw;
    Label63: TLabel;
    edDhProcessamento: TMaskEdit;
    btAtualizarDataProcessamento: TSpeedButton;
    Label34: TLabel;
    edFinNFS: TComboBox;
    pnOS: TPanel;
    procedure btAtualizarDataProcessamentoClick(Sender: TObject);
    procedure linkCorrelacao1Click(Sender: TObject);
    procedure edvtrib_indtotClick(Sender: TObject);
    procedure edRetPISCOFINSExit(Sender: TObject);
    procedure edRetIssExit(Sender: TObject);
    procedure ckRetIssClick(Sender: TObject);
    procedure edret_virrfExit(Sender: TObject);
    procedure edpc_vcofinsExit(Sender: TObject);
    procedure edpc_vpisExit(Sender: TObject);
    procedure edpc_pcofinsExit(Sender: TObject);
    procedure edpc_ppisExit(Sender: TObject);
    procedure edpc_vbcExit(Sender: TObject);
    procedure edVISSExit(Sender: TObject);
    procedure edIssVBCISSExit(Sender: TObject);
    procedure edIssPAliqExit(Sender: TObject);
    procedure linkInformarTribManualClick(Sender: TObject);
    procedure btAtualizarDataEmissaoClick(Sender: TObject);
    procedure edVDesc2Exit(Sender: TObject);
		procedure edTribISSQNExit(Sender: TObject);
		procedure edVServ2Exit(Sender: TObject);
    procedure ckIndDestClick(Sender: TObject);
    procedure edDhemiExit(Sender: TObject);
    procedure btPesquisarServicoClick(Sender: TObject);
    procedure linkRemoverPartPrincipalClick(Sender: TObject);
    procedure linkPesquisarPartPrincipalClick(Sender: TObject);
  private
    FState, FSnapShot: NFSeModel;
    FAuditor: TAudit_OOP;
    FOSList: TArrayInteger;
    function GetTribRtc: TributoDFeContextEtd;
    function GetNFSe: NFSeEtd;
    function GetNFSeId: string;
		procedure SetupParticipantePrincipal();
		procedure SetupServico();
    procedure SetupVisualValorAproxTributos();
		procedure SetupIbsCbsNacional();
		procedure HandleRegraFiscal();
		procedure HandleCalculosFiscais();
		procedure HandleCalculosFiscaisSomenteRtc();
    procedure AtualizarTotaisCalculados();
		procedure OpInternasFrameChange(Sender: TObject; OpInterna: OperacaoInternaEtd);
    procedure NFSeTributosDFeFrameCalculoCallBack(Sender: TObject);
    procedure MapFormToState;
    procedure SelecionadoCampoFiscalNFSe(Campo: TFormCorrelFiscalCampo; const Value: string);

    property FNFSe: NFSeEtd read GetNFSe;
    property TribRtc: TributoDFeContextEtd read GetTribRtc;
	public
		constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
		procedure Setup(const Input: NFSeModel; const Auditor: TAudit_OOP);
    procedure Reset();
    function GetDPS(): NFSeModel;
    function HasChanges(): Boolean;

    property NFSeId: string read GetNFSeId;
  end;

implementation

uses
  Math, StrUtils, uDtmAtivo,
  DateTimeServiceUnit, StringNullableUnit, UIUtilsUnit, NFSeTypesUnit, NFSeTypesDisplayUnit, DFeTypesUnit,
  TipoRegraTributoDFeEnumUnit, IntegerNullableUnit, CurrencyNullableUnit, ContainerUnit, ClienteEtdUnit,
  EValidacaoNegocioUnit, NFSeParticipanteFactoryUnit, TipoServicoEtdUnit, UIMasksUtilsUnit,
  ResolverRegraFiscalIbsCbsTypesUnit, DateAndTimeNullableUnit, RegraFiscalIbsCbsEtdUnit, NFSeIbsCbsFactoryUnit,
  NumberServiceUnit, CalculoTributosNFSeInputUnit, CalculoTributosNFSeOutputUnit, TributoNFSeRetenFederalOutputUnit,
  TributoNFSePisCofinsOutputUnit, StringServiceUnit, NFSeSubstEtdUnit, DpsEmitirIbsCbsNacionalModelUnit,
  TributoDFeIbsCbsEtdUnit, TributoDFeImpostoSeletivoEtdUnit, ValidacaoOutputUnit, NFSeOSEtdUnit, ArrayServiceUnit,
  NFSeResumoModelUnit;

{$R *.dfm}   

{ TDPSFrame }

procedure TNFSeFrame.ckIndDestClick(Sender: TObject);
begin
  if FNFSe.LayoutNFSeComIbsCbs() then
  begin
    if not ckIndDest.Checked and (FNFSe.DestIbsCbs <> nil) then
      if UIUtils.ShowQuestion('Destinatário para o IBSCBS preenchido. O destinatário será removido. Continuar?', True
      ) = mrYes then
      begin
        FNFSe.DestIbsCbs := nil;
        FNFSe.DestIbsCbsId := IntegerNullable.NullInstance();
        DPSDestIbsCbsFrame1.Setup( FNFSe.DestIbsCbs );
      end
      else
      begin
        ckIndDest.Checked := True;
        Exit;
      end;

    FNFSe.IndDest := Ord(ckIndDest.Checked);
    tabDestIbsCbs.TabVisible := (YesNoEnum(FNFSe.IndDest) = ynYes); // IndDest > Destinatario diferente do Tomador

    if ckIndDest.Checked then
      pageParticipantes.ActivePage := tabDestIbsCbs;
  end;
end;

procedure TNFSeFrame.ckRetIssClick(Sender: TObject);
begin
  if ckRetIss.Checked then
    FNFSe.TpRetIssQn := trRetidoPeloTomador
  else
    FNFSe.TpRetIssQn := trNaoRetido;

  HandleCalculosFiscaisSomenteRtc();
end;

constructor TNFSeFrame.Create(AOwner: TComponent);
begin
  inherited;

  UIUtils.Populate( edTribISSQN.Items, TributacaoISSQNEnumStr );
	UIUtils.Populate( edRetIss.Items, TipoRetencaoISSQNEnumStr );
	UIUtils.Populate( edRetPISCOFINS.Items, TipoRetencaoPisCofinsEnumStr );
	UIUtils.Populate( edFinNFS.Items, ['0-Regular'] );
	UIUtils.Populate( edTpFornecimento.Items, TipoOperEnteGovEnumStr );
	UIUtils.Populate( edTipoEnteGov.Items, TipoEnteGovEnumStr );
	UIUtils.Populate( edTipoRegra.Items, TipoRegraTributoDFeEnumStr );

  ComboBoxOpInternasFrame1.OnOpInternaChange := OpInternasFrameChange;
  NFSeTributosDFeFrame1.CalculoCallBack := NFSeTributosDFeFrameCalculoCallBack;

  FState := nil;
  FSnapShot := nil; 

end;

destructor TNFSeFrame.Destroy;
begin
  FState.Free();
  FSnapShot.Free();
  inherited;
end;

procedure TNFSeFrame.edDhemiExit(Sender: TObject);
var
  dh: TDateTime;
begin
  if TryStrToDateTime(edDhemi.Text, dh) then
  begin
    FNFSe.DhEmi := DateTimeNullable.Create(dh);
    lbDhemi.Caption := edDhemi.Text;
    HandleRegraFiscal();
  end;  
end;

procedure TNFSeFrame.edIssPAliqExit(Sender: TObject);
begin
  if NumberService.SameMonetaryDouble(edIssPAliq.AsCurrency, FNFSe.IssPAliq.Value) then
    Exit;

  if edIssPAliq.IsNull then
    FNFSe.IssPAliq.SetNull
  else
    FNFSe.IssPAliq.SetValue(edIssPAliq.AsCurrency);

  if FNFSe.IssPAliq.IsNull and FNFSe.IssVBC.IsNull then
    FNFSe.VIss.SetNull
  else
    FNFSe.VIss.SetValue( FNFSe.IssPAliq.Value * FNFSe.IssVBC.Value / 100 );

  edVISS.UpdateValue(FNFSe.VIss.Value, FNFSe.VIss.IsNull);

  HandleCalculosFiscaisSomenteRtc();
end;

procedure TNFSeFrame.edIssVBCISSExit(Sender: TObject);
begin
  if NumberService.SameMonetaryDouble(edIssVBCISS.AsCurrency, FNFSe.IssVBC.Value) then
    Exit;

  if edIssVBCISS.IsNull then
    FNFSe.IssVBC.SetNull
  else
    FNFSe.IssVBC.SetValue(edIssVBCISS.AsCurrency);

  if FNFSe.IssPAliq.IsNull and FNFSe.IssVBC.IsNull then
    FNFSe.VIss.SetNull
  else
    FNFSe.VIss.SetValue( FNFSe.IssPAliq.Value * FNFSe.IssVBC.Value / 100 );

  edVISS.UpdateValue(FNFSe.VIss.Value, FNFSe.VIss.IsNull);

  HandleCalculosFiscaisSomenteRtc();
end;

procedure TNFSeFrame.edpc_pcofinsExit(Sender: TObject);
begin
  if NumberService.SameMonetaryDouble(edpc_pcofins.AsCurrency, FNFSe.PCPAliqCofins.Value) then
    Exit;

  if edpc_pcofins.IsNull then
    FNFSe.PCPAliqCofins.SetNull
  else
    FNFSe.PCPAliqCofins.SetValue(edpc_pcofins.AsCurrency);

  if FNFSe.PCPAliqCofins.IsNull and FNFSe.IssVBC.IsNull then
    FNFSe.PCVCofins.SetNull
  else
    FNFSe.PCVCofins.SetValue( FNFSe.PCPAliqCofins.Value * FNFSe.IssVBC.Value / 100 );

  edpc_vcofins.UpdateValue(FNFSe.PCVCofins.Value, FNFSe.PCVCofins.IsNull);

  HandleCalculosFiscaisSomenteRtc();
end;

procedure TNFSeFrame.edpc_ppisExit(Sender: TObject);
begin
  if NumberService.SameMonetaryDouble(edpc_ppis.AsCurrency, FNFSe.PCPAliqPis.Value) then
    Exit;

  if edpc_ppis.IsNull then
    FNFSe.PCPAliqPis.SetNull
  else
    FNFSe.PCPAliqPis.SetValue(edpc_ppis.AsCurrency);

  if FNFSe.PCPAliqPis.IsNull and FNFSe.IssVBC.IsNull then
    FNFSe.PCVPis.SetNull
  else
    FNFSe.PCVPis.SetValue( FNFSe.PCPAliqPis.Value * FNFSe.IssVBC.Value / 100 );

  edpc_vpis.UpdateValue(FNFSe.PCVPis.Value, FNFSe.PCVPis.IsNull);

  HandleCalculosFiscaisSomenteRtc();
end;

procedure TNFSeFrame.edpc_vbcExit(Sender: TObject);
begin
  if NumberService.SameMonetaryDouble(edpc_vbc.AsCurrency, FNFSe.PCVBcPisCofins.Value) then
    Exit;

  if edpc_vbc.IsNull then
    FNFSe.PCVBcPisCofins.SetNull
  else
    FNFSe.PCVBcPisCofins.SetValue(edpc_vbc.AsCurrency);

  if FNFSe.PCPAliqPis.IsNull and FNFSe.PCVBcPisCofins.IsNull then
    FNFSe.PCVPis.SetNull
  else
    FNFSe.PCVPis.SetValue( FNFSe.PCPAliqPis.Value * FNFSe.PCVBcPisCofins.Value / 100 );
  edpc_vpis.UpdateValue(FNFSe.PCVPis.Value, FNFSe.PCVPis.IsNull);

  if FNFSe.PCPAliqCofins.IsNull and FNFSe.PCVBcPisCofins.IsNull then
    FNFSe.PCVCofins.SetNull
  else
    FNFSe.PCVCofins.SetValue( FNFSe.PCPAliqCofins.Value * FNFSe.PCVBcPisCofins.Value / 100 );
  edpc_vcofins.UpdateValue(FNFSe.PCVCofins.Value, FNFSe.PCVCofins.IsNull);

  HandleCalculosFiscaisSomenteRtc();
end;

procedure TNFSeFrame.edpc_vcofinsExit(Sender: TObject);
begin
  if NumberService.SameMonetaryDouble(edpc_vcofins.AsCurrency, FNFSe.PCVCofins.Value) then
    Exit;

  if edpc_vcofins.IsNull then
    FNFSe.PCVCofins.SetNull
  else
    FNFSe.PCVCofins.SetValue(edpc_vcofins.AsCurrency);

  if FNFSe.PCVCofins.IsNull and FNFSe.PCVBcPisCofins.IsNull then
    FNFSe.PCPAliqCofins.SetNull
  else
    FNFSe.PCPAliqCofins.SetValue( FNFSe.PCVCofins.Value / FNFSe.PCVBcPisCofins.Value * 100 );

  edpc_pcofins.UpdateValue(FNFSe.PCPAliqCofins.Value, FNFSe.PCPAliqCofins.IsNull);

  HandleCalculosFiscaisSomenteRtc();
end;

procedure TNFSeFrame.edpc_vpisExit(Sender: TObject);
begin
  if NumberService.SameMonetaryDouble(edpc_vpis.AsCurrency, FNFSe.PCVPis.Value) then
    Exit;

  if edpc_vpis.IsNull then
    FNFSe.PCVPis.SetNull
  else
    FNFSe.PCVPis.SetValue(edpc_vpis.AsCurrency);

  if FNFSe.PCVPis.IsNull and FNFSe.PCVBcPisCofins.IsNull then
    FNFSe.PCPAliqPis.SetNull
  else
    FNFSe.PCPAliqPis.SetValue( FNFSe.PCVPis.Value / FNFSe.PCVBcPisCofins.Value * 100 );

  edpc_ppis.UpdateValue(FNFSe.PCPAliqPis.Value, FNFSe.PCPAliqPis.IsNull);

  HandleCalculosFiscaisSomenteRtc();
end;

procedure TNFSeFrame.edRetIssExit(Sender: TObject);
begin
  FNFSe.TpRetIssQn := TipoRetencaoISSQNEnum(edRetIss.ItemIndex);

  HandleCalculosFiscaisSomenteRtc();
end;

procedure TNFSeFrame.edRetPISCOFINSExit(Sender: TObject);
begin
  FNFSe.TpRetPisCofins := TipoRetencaoPisCofinsEnum(edRetPISCOFINS.ItemIndex);

  HandleCalculosFiscaisSomenteRtc();
end;

procedure TNFSeFrame.edret_virrfExit(Sender: TObject);
begin
  if (Sender = edret_virrf) and not NumberService.SameMonetaryDouble(edret_virrf.AsCurrency, FNFSe.VRetIrrf.Value) then
    FNFSe.VRetIrrf := CurrencyNullable.Create(edret_virrf.AsCurrency, edret_virrf.IsNull )

  else if (Sender = edret_vcsll) and not NumberService.SameMonetaryDouble(edret_vcsll.AsCurrency, FNFSe.VRetCsll.Value) then
    FNFSe.VRetCsll := CurrencyNullable.Create(edret_vcsll.AsCurrency, edret_vcsll.IsNull )

  else if (Sender = edret_vcp) and not NumberService.SameMonetaryDouble(edret_vcp.AsCurrency, FNFSe.VRetCP.Value) then
    FNFSe.VRetCP := CurrencyNullable.Create(edret_vcp.AsCurrency, edret_vcp.IsNull )

  else if (Sender = edret_vpis) and not NumberService.SameMonetaryDouble(edret_vpis.AsCurrency, FNFSe.VRetPis.Value) then
    FNFSe.VRetPis := CurrencyNullable.Create(edret_vpis.AsCurrency, edret_vpis.IsNull )

  else if (Sender = edret_vcofins) and not NumberService.SameMonetaryDouble(edret_vcofins.AsCurrency, FNFSe.VRetCofins.Value) then
    FNFSe.VRetCofins := CurrencyNullable.Create(edret_vcofins.AsCurrency, edret_vcofins.IsNull )

  else
    Exit;

  AtualizarTotaisCalculados();
end;

procedure TNFSeFrame.edTribISSQNExit(Sender: TObject);
begin
//  if (edTribISSQN.ItemIndex <> -1)
//    and (edTribISSQN.ItemIndex <> Ord(FState.TribIssQn)
//  then
//  begin
//    case FState.TribIssQn of
//      tiOperacaoTributavel,
//      tiExportacao:
//        begin
//          FState.IssPAliq : affff fritou a cuca aqui
//
//          osso, resolve ai
//        end
//
//    else
//      tiNaoIncidencia: ;
//    end;
//    FState := TributacaoISSQNEnum(edTribISSQN.ItemIndex);
//    HandleCalculoISS();
//  end;
end;

procedure TNFSeFrame.edVDesc2Exit(Sender: TObject);
var
  cValue: Currency;
begin
  if Sender = edVDesc2 then
  begin
    cValue := edVDesc2.AsCurrency;
    edVDesc.UpdateValue(edVDesc2.AsCurrency, edVDesc2.IsNull);
  end
  else if Sender = edVDesc then
  begin
    cValue := edVDesc.AsCurrency;
    edVDesc2.UpdateValue(edVDesc.AsCurrency, edVDesc.IsNull);
  end
  else
    Exit;

  if not NumberService.SameMonetaryDouble(FNFSe.VDescIncond.Value, cValue ) then
  begin
    FNFSe.VDescIncond.SetValue( edVDesc.AsValue );
    HandleCalculosFiscais();
  end;
end;

procedure TNFSeFrame.edVISSExit(Sender: TObject);
begin
  if NumberService.SameMonetaryDouble(edVISS.AsCurrency, FNFSe.VIss.Value) then
    Exit;

  if edVISS.IsNull then
    FNFSe.VIss.SetNull
  else
    FNFSe.VIss.SetValue(edVISS.AsCurrency);

  if FNFSe.VIss.IsNull and FNFSe.IssVBC.IsNull then
    FNFSe.IssPAliq.SetNull
  else
    FNFSe.IssPAliq.SetValue( FNFSe.VIss.Value / FNFSe.IssVBC.Value * 100 );

  edIssPAliq.UpdateValue(FNFSe.IssPAliq.Value, FNFSe.IssPAliq.IsNull);

  HandleCalculosFiscaisSomenteRtc();
end;

procedure TNFSeFrame.edVServ2Exit(Sender: TObject);
var
  edCampo: TEditHw;
begin
  if (Sender = edVServ) then
    edCampo := edVServ
  else if (Sender = edVServ2) then
    edCampo := edVServ2
  else
    Exit;

  if not NumberService.SameMonetaryDouble(edCampo.AsCurrency, FNFSe.VServ.Value) then
    FNFSe.VServ := CurrencyNullable.Create(edCampo.AsCurrency, edCampo.IsNull )

  else
    Exit;

  edVServ.UpdateValue(edCampo.AsCurrency, edCampo.IsNull);
  edVServ2.UpdateValue(edCampo.AsCurrency, edCampo.IsNull);

  HandleCalculosFiscais();
end;

procedure TNFSeFrame.edvtrib_indtotClick(Sender: TObject);
begin
  FNFSe.IndTotTrib := YesNoEnum(edvtrib_indtot.Checked);
  SetupVisualValorAproxTributos();
end;

function TNFSeFrame.GetDPS: NFSeModel;
begin
  MapFormToState();

  Result := FState.Clone();
end;

function TNFSeFrame.GetNFSe: NFSeEtd;
begin
  if FState = nil then
    Result := nil
  else
    Result := FState.NFSe;
end;

function TNFSeFrame.GetNFSeId: string;
begin
  Result := FNFSe.Id;
end;

function TNFSeFrame.GetTribRtc: TributoDFeContextEtd;
begin
  if FState = nil then
    Result := nil

  else
    Result := FState.Tributo;
end;

procedure TNFSeFrame.HandleCalculosFiscais();
var
  validCalc: ValidacaoOutput;
begin
  tabISS.Enabled := False;
  tabPISCOFINS.Enabled := False;
  tabRetencoes.Enabled := False;
  tabTotTrib.Enabled := False;
  linkInformarTribManual.Visible := FNFSe.EstaEmDigitacao;

  if (FNFSe.CodServico.Value <= 0)
    or (FNFSe.CodCliente.Value <= 0)
    or (FNFSe.VServ.Value <= 0)
    or ((FNFSe.VServ.Value - FNFSe.VDescIncond.Value) <= 0)
  then
    Exit;

	try
    MapFormToState();

		validCalc := Container.GetInstance().ErpFeaturesFactory.CreateCalcularTributosNFSeUseCase()
			.Executar( CalculoTributosNFSeInput.Create( FState, True, True ));
    try
      validCalc.RaiseIfNotIsValid();
    except on E: Exception do
      UIUtils.HandleError(E);
    end;

    if TribRtc <> nil then
      NFSeTributosDFeFrame1.Setup( TribRtc.IbsCbs );

		// Map formulario
    edVLIQ.UpdateValue( FNFSe.VLiq.Value, FNFSe.VLiq.IsNull );
    edTotNF.UpdateValue( FNFSe.VTotNf.Value, FNFSe.VTotNf.IsNull );
    edTotRet.UpdateValue( FNFSe.VTotalRet.Value, FNFSe.VTotalRet.IsNull );

		edTribISSQN.ItemIndex := Ord(FNFSe.TribIssQn);
		edRetIss.ItemIndex := Ord(FNFSe.TpRetIssQn);
    edIssPAliq.UpdateValue( FNFSe.IssPAliq.Value );
    edIssVBCISS.UpdateValue( FNFSe.IssVBC.Value );
    edVISS.UpdateValue( FNFSe.VIss.Value );
    ckRetIss.Checked := FNFSe.TpRetIssQn in [trRetidoPeloTomador, trRetidoPeloIntermediario];

    edpc_CST.Text := FNFSe.PCCst.Value;
    edpc_vbc.UpdateValue(FNFSe.PCVBcPisCofins.Value, FNFSe.PCVBcPisCofins.IsNull);
    edpc_ppis.UpdateValue(FNFSe.PCPAliqPis.Value, FNFSe.PCPAliqPis.IsNull);
    edpc_pcofins.UpdateValue(FNFSe.PCPAliqCofins.Value, FNFSe.PCPAliqCofins.IsNull);
    edpc_vpis.UpdateValue(FNFSe.PCVPis.Value, FNFSe.PCVPis.IsNull);
    edpc_vcofins.UpdateValue(FNFSe.PCVCofins.Value, FNFSe.PCVCofins.IsNull);
    edRetPISCOFINS.ItemIndex := Ord(FNFSe.TpRetPisCofins);

    edret_virrf.UpdateValue(FNFSe.VRetIrrf.Value, FNFSe.VRetIrrf.IsNull);
    edret_vcsll.UpdateValue(FNFSe.VRetCsll.Value, FNFSe.VRetCsll.IsNull);
    edret_vcp.UpdateValue(FNFSe.VRetCP.Value, FNFSe.VRetCP.IsNull);
    edret_vpis.UpdateValue(FNFSe.VRetPis.Value, FNFSe.VRetPis.IsNull);
    edret_vcofins.UpdateValue(FNFSe.VRetCofins.Value, FNFSe.VRetCofins.IsNull);
    
    edvtrib_indtot.Checked := FNFSe.IndTotTrib = ynYes;
    edvtrib_pfed.UpdateValue( FNFSe.PTotTribFed.Value, FNFSe.PTotTribFed.IsNull );
    edvtrib_pest.UpdateValue( FNFSe.PTotTribEst.Value, FNFSe.PTotTribEst.IsNull );
    edvtrib_pmun.UpdateValue( FNFSe.PTotTribMun.Value, FNFSe.PTotTribMun.IsNull );
    edvtrib_ptot.UpdateValue( FNFSe.PTotTribSN.Value, FNFSe.PTotTribSN.IsNull );
    SetupVisualValorAproxTributos();

	except on E: Exception do
		UIUtils.HandleError(E);
	end;
end;

procedure TNFSeFrame.HandleCalculosFiscaisSomenteRtc;
var
	validCalc: ValidacaoOutput;
begin
  try
		validCalc := Container.GetInstance().ErpFeaturesFactory.CreateCalcularTributosNFSeUseCase()
			.Executar( CalculoTributosNFSeInput.Create( FState, True, False ));
    try
      validCalc.RaiseIfNotIsValid();
    except on E: Exception do
      UIUtils.HandleError(E);
    end;

    if TribRtc <> nil then
      NFSeTributosDFeFrame1.Setup( TribRtc.IbsCbs );

  except on E: Exception do
		UIUtils.HandleError(E);
	end;
end;

procedure TNFSeFrame.HandleRegraFiscal;
var
  RegraFiscal: RegraFiscalIbsCbsEtd;
  TipoRegra: TipoRegraTributoDFeEnum;
  CCredPres: StringNullable;
  GFId: string;
  Data: TDate;
begin
  if FNFSe.LayoutNFSeComIbsCbs() and not FNFSe.EstaFinalizada and (FNFSe.NaturezaEmissao = nemtPrestadorWS) then
  begin
    TipoRegra := TipoRegraTributoDFeEnum(edTipoRegra.ItemIndex);

    if TipoRegra <> tctAutomatica then
      Exit;

    if FNFSe.Servico = nil then
      GFId := ''
    else
      GFId := FNFSe.Servico.GrupoFiscalIbsCbsId.Value;

    CCredPres := FState.IbsCbsNacional.CCredPres;

    if FNFSe.DhEmi.HasValue then
      Data := FNFSe.DhEmi.Value
    else
      Data := FNFSe.DCompet.Value;

    RegraFiscal := Container.GetInstance().ErpFeaturesFactory.CreateResolverRegraFiscalIbsCbsUseCase()
      .Executar(ResolverRegraFiscalIbsCbsInput.Create(
        FNFSe.OpInternaId.Value, GFId, FNFSe.CodEmpresa, Data
      ));
    try
      FState.IbsCbsNacional := NFSeIbsCbsFactory.Create(
        FNFSe.Id,
        TipoRegra,
        CCredPres,
        RegraFiscal
      );
    finally
      RegraFiscal.Free();
    end;

    SetupIbsCbsNacional();
  end

  else if FNFSe.LayoutNFSeComIbsCbs() then
  begin
    // Calcular?
    //SetupIbsCbsTribDfe();
  end;
end;

function TNFSeFrame.HasChanges: Boolean;
var
  DPSForm: NFSeModel;
begin
  if not FNFSe.EstaEmDigitacao() then
  begin
    Result := False;
    Exit;
  end;
  
  DPSForm := Self.GetDPS();
  try
    Result :=  not DPSForm.IsEqualTo(FSnapShot);
  finally
    DPSForm.Free();
  end;
end;

procedure TNFSeFrame.linkCorrelacao1Click(Sender: TObject);
  var
  form: TFormCorrelFiscalNFSe;
begin
  inherited;
  form := TFormCorrelFiscalNFSe.Create(nil);
  try
    form.Setup(
      edClc116.Text, edCTribNac.Text, edCNBS.Text, edCIndOp.Text
    );
    form.OnSelectCampo := SelecionadoCampoFiscalNFSe;

    form.ShowModal();

  finally
    FreeAndNil(form);
  end;
end;

procedure TNFSeFrame.linkInformarTribManualClick(Sender: TObject);
begin   
  if (Length(FOSList) > 0)
    and not FAuditor.Processo('NFS044', FSnapShot.NFSe.GetAuditLabel(), FSnapShot.NFSe.GetAuditKey())
      .Alterar.Permitido() then
    Exit;

  tabISS.Enabled := FNFSe.EstaEmDigitacao;
  tabPISCOFINS.Enabled := FNFSe.EstaEmDigitacao;
  tabRetencoes.Enabled := FNFSe.EstaEmDigitacao;
  tabTotTrib.Enabled := FNFSe.EstaEmDigitacao;
  linkInformarTribManual.Visible := False;
end;

procedure TNFSeFrame.linkPesquisarPartPrincipalClick(Sender: TObject);
var
  S, Capt: string;
  I, codClienteOld: Integer;
  CL: ClienteEtd;
  Tipo: TipoPartDpesEnum;
  tab: TTabSheet;
begin
  if (Sender = linkPesquisarPartPrincipal) or (Sender = btPesquisarPartPrincipal) then
  begin
    if FNFSe.IsEmissaoPropria then
    begin
      if (Length(FOSList) > 0)
        and not FAuditor.Processo('NFS042', FSnapShot.NFSe.GetAuditLabel(), FSnapShot.NFSe.GetAuditKey())
          .Alterar.Permitido() then
        Exit;

      Tipo := tprtTomador;
    end
    else
      Tipo := tprtPrestador;
    tab := tabPartPrincipal;
  end
  else if Sender = linkPesquisarIntermediario then
  begin
    Tipo := tprtIntermediario;
    tab := tabIntermediario;
  end
  else if Sender = linkPesquisarDestIbsCbs then
  begin
    Tipo := tprtDestIbsCbs;
    tab := tabDestIbsCbs;
  end
  else
    Exit;
  try
    S := vDadosIni.pesquisaRapida('CLIENTES', '', 'Consulta de ' + TipoPartDpesEnumStr[Tipo]);

    if TryStrToInt(S, I) then
    begin
      CL := Container.GetInstance().ErpFeaturesFactory.CreateObterClientePorIdUseCase()
        .Executar(I, FNFSe.CodEmpresa);

      if CL = nil then
        EValidacaoNegocio.Create('Cliente não encontrado');
      try

        if CL.Municipio = nil then
          EValidacaoNegocio.Create('Muniípio IBGE do Cliente não encontrado. Veja o cadastro do cliente e da cidade');

        //if CL.Cpfcgc.IsNullOrWhiteSpace then
          //EValidacaoNegocio.Create('CPF/CNPJ do Cliente não informado. Veja o cadastro do cliente e da cidade');

        case Tipo of
          tprtTomador, tprtPrestador:
            begin
              codClienteOld := FNFSe.CodCliente.Value;

              FNFSe.ParticipantePrincipal := NFSeParticipanteFactory.Executar( FNFSe.Id, Tipo, CL );
              FNFSe.CodCliente := IntegerNullable.Create(CL.CodCliente);
              FNFSe.TpEnteGov := CL.TipoEnteGov;
              if CL.TipoEnteGov = tgvNenhum then
                FNFSe.TpOper := togNaoDefinido;

              edTipoEnteGov.ItemIndex := Ord(FNFSe.TpEnteGov);
              edTpFornecimento.ItemIndex := Ord(FNFSe.TpOper);
              
              SetupParticipantePrincipal();
                                       
              if not FNFSe.CodCliente.IsNull and (FNFSe.CodCliente.Value <> codClienteOld)  then
                HandleCalculosFiscais();
            end;

          tprtIntermediario:
            begin
              codClienteOld := FNFSe.IntermediarioId.Value;

              FNFSe.Intermediario := NFSeParticipanteFactory.Executar( FNFSe.Id, Tipo, CL );
              FNFSe.IntermediarioId := IntegerNullable.Create(CL.CodCliente);
              linkRemoverIntermediario.Visible := FNFSe.Intermediario <> nil;
              DPSIntermediarioFrame1.Setup( FNFSe.Intermediario );

              if not FNFSe.IntermediarioId.IsNull and (FNFSe.IntermediarioId.Value <> codClienteOld)  then
                HandleCalculosFiscais();
            end;

          tprtDestIbsCbs: 
            begin
              FNFSe.DestIbsCbs := NFSeParticipanteFactory.Executar( FNFSe.Id, Tipo, CL );
              FNFSe.DestIbsCbsId := IntegerNullable.Create(CL.CodCliente);
              linkRemoverDestIbcCbs.Visible := FNFSe.DestIbsCbs <> nil;
              DPSDestIbsCbsFrame1.Setup( FNFSe.DestIbsCbs );
            end;
        end;

        tab.Caption := Format('  %s [%d]  ', [ TipoPartDpesEnumStr[Tipo], CL.CodCliente ]);

      finally
        CL.Free();
      end;
    end;

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
end;

procedure TNFSeFrame.linkRemoverPartPrincipalClick(Sender: TObject);
begin
  if Sender = linkRemoverPartPrincipal then
  begin
    if FNFSe.IsEmissaoPropria and (Length(FOSList) > 0)
      and not FAuditor.Processo('NFS042', FSnapShot.NFSe.GetAuditLabel(), FSnapShot.NFSe.GetAuditKey())
        .Alterar.Permitido() then
      Exit;

    FNFSe.ParticipantePrincipal := nil;
    FNFSe.CodCliente := IntegerNullable.NullInstance();
    DPSPartPrincipalFrame1.Setup( FNFSe.ParticipantePrincipal );
    tabPartPrincipal.Caption := Format('  %s  ', [TipoPartDpesEnumStr[tprtTomador]]);
    linkRemoverPartPrincipal.Visible := False;
  end
  else if Sender = linkRemoverIntermediario then
  begin
    FNFSe.Intermediario := nil;
    FNFSe.IntermediarioId := IntegerNullable.NullInstance();
    DPSIntermediarioFrame1.Setup( FNFSe.Intermediario );
    tabIntermediario.Caption := Format('  %s  ', [TipoPartDpesEnumStr[tprtIntermediario]]);
    linkRemoverIntermediario.Visible := False;

    // O intermediario pode influenciar na retencao, recalcula por conta disso 
    HandleCalculosFiscais();
  end
  else if Sender = linkRemoverDestIbcCbs then
  begin
    FNFSe.DestIbsCbs := nil;
    FNFSe.DestIbsCbsId := IntegerNullable.NullInstance();
    DPSDestIbsCbsFrame1.Setup( FNFSe.DestIbsCbs );
    tabDestIbsCbs.Caption := Format('  %s  ', [TipoPartDpesEnumStr[tprtDestIbsCbs]]);
    linkRemoverDestIbcCbs.Visible := False;
  end;
end;

procedure TNFSeFrame.MapFormToState;
var
  IbsCbs: TributoDFeIbsCbsEtd;
  ImpSel: TributoDFeImpostoSeletivoEtd;
begin
  FNFSe.OpInternaId := StringNullable.CreateOrNull(ComboBoxOpInternasFrame1.GetOperacaoInternaId);
  FNFSe.DhEmi := DateTimeNullable.CreateOrNull( StrToDateTimeDef(edDhemi.Text, 0 ));
  FNFSe.DCompet := DateNullable.CreateOrNull(  StrToDateDef(edDataPrestacao.Text, 0 ));
  FNFSe.CLocPrestacao := IntegerNullable.CreateOrNull( ComboBoxMunicipiosFrame1.GetCodigoIBGE );

  //Servico
  FNFSe.CCNAE := StringNullable.CreateOrNull( StringService.OnlyNumber( edCcnae.Text ));
  FNFSe.CLC116 := StringNullable.Create( edClc116.Text, StringService.OnlyNumber(edClc116.Text) = '' );
  FNFSe.CTribNac := StringNullable.CreateOrNull( StringService.OnlyNumber( edCTribNac.Text ));
  FNFSe.CTribMun := StringNullable.CreateOrNull( StringService.OnlyNumber( edCTribMun.Text ));
  FNFSe.CNBS := StringNullable.CreateOrNull( StringService.OnlyNumber( edCNBS.Text ));
  FNFSe.XDescServ := StringNullable.CreateOrNull( Trim( StringService.TrimChars( edDiscriminacao.Text, sLineBreak )));

  //Valores
  FNFSe.VServ := CurrencyNullable.Create( edVServ.AsCurrency, edVServ.IsNull );
  FNFSe.VDescIncond := CurrencyNullable.Create( edVDesc.AsCurrency, edVDesc.IsNull );

  //ISS
  FNFSe.TribIssQn := TributacaoISSQNEnum(edTribISSQN.ItemIndex);
  FNFSe.IssPAliq := CurrencyNullable.Create( edIssPAliq.AsCurrency, edIssPAliq.IsNull );
  FNFSe.IssVBC := CurrencyNullable.Create( edIssVBCISS.AsCurrency, edIssVBCISS.IsNull );
  FNFSe.VIss := CurrencyNullable.Create( edVISS.AsCurrency, edVISS.IsNull );

  //PISCOFINS
  FNFSe.PCCst := StringNullable.CreateOrNull( StringService.OnlyNumber( edpc_CST.Text ));
  FNFSe.PCVBcPisCofins := CurrencyNullable.Create( edpc_vbc.AsCurrency, edpc_vbc.IsNull );
  FNFSe.PCPAliqPis := CurrencyNullable.Create( edpc_ppis.AsCurrency, edpc_ppis.IsNull );
  FNFSe.PCPAliqCofins := CurrencyNullable.Create( edpc_pcofins.AsCurrency, edpc_pcofins.IsNull );
  FNFSe.PCVPis := CurrencyNullable.Create( edpc_vpis.AsCurrency, edpc_vpis.IsNull );
  FNFSe.PCVCofins := CurrencyNullable.Create( edpc_vcofins.AsCurrency, edpc_vcofins.IsNull );

  //Retencoes
  FNFSe.VRetIrrf := CurrencyNullable.Create( edret_virrf.AsCurrency, edret_virrf.IsNull );
  FNFSe.VRetCsll := CurrencyNullable.Create( edret_vcsll.AsCurrency, edret_vcsll.IsNull );
  FNFSe.VRetCP := CurrencyNullable.Create( edret_vcp.AsCurrency, edret_vcp.IsNull );
  FNFSe.VRetPis := CurrencyNullable.Create( edret_vpis.AsCurrency, edret_vpis.IsNull );
  FNFSe.VRetCofins := CurrencyNullable.Create( edret_vcofins.AsCurrency, edret_vcofins.IsNull );

  if FNFSe.IsPadraoNacional() then
  begin
    FNFSe.TpRetIssQn := TipoRetencaoISSQNEnum(edRetIss.ItemIndex);
    FNFSe.TpRetPisCofins := TipoRetencaoPisCofinsEnum(edRetPISCOFINS.ItemIndex);
  end
  else
  begin
    FNFSe.TpRetIssQn := TipoRetencaoISSQNEnum(
      IfThen(ckRetIss.Checked, Ord( trRetidoPeloTomador  ), Ord( trNaoRetido ))
    ); //0 ou 1
    FNFSe.CalcularTpRetPisCofins();
  end;

  //Tributos aproximados
  FNFSe.IndTotTrib := YesNoEnum(edvtrib_indtot.Checked);
  FNFSe.PTotTribFed := CurrencyNullable.Create( edvtrib_pfed.AsCurrency, edvtrib_pfed.IsNull );
  FNFSe.PTotTribEst := CurrencyNullable.Create( edvtrib_pest.AsCurrency, edvtrib_pest.IsNull );
  FNFSe.PTotTribMun := CurrencyNullable.Create( edvtrib_pmun.AsCurrency, edvtrib_pmun.IsNull );
  FNFSe.PTotTribSN := CurrencyNullable.Create( edvtrib_ptot.AsCurrency, edvtrib_ptot.IsNull );

  // Participantes
  if FNFSe.CodCliente.IsNull then
    FNFSe.ParticipantePrincipal := nil
  else
    FNFSe.ParticipantePrincipal := DPSPartPrincipalFrame1.GetParticipante();

  if FNFSe.IntermediarioId.IsNull then
    FNFSe.Intermediario := nil
  else
    FNFSe.Intermediario := DPSIntermediarioFrame1.GetParticipante();

  if FNFSe.DestIbsCbsId.IsNull then
    FNFSe.DestIbsCbs := nil
  else
    FNFSe.DestIbsCbs := DPSDestIbsCbsFrame1.GetParticipante();

  //IBSCBS
  FNFSe.IndDest := Ord(ckIndDest.Checked);
  FNFSe.FinNFSe := edFinNFS.ItemIndex;
  FNFSe.CIndOp := StringNullable.CreateOrNull(Trim(edcIndOp.Text));
  FNFSe.TpOper := TipoOperEnteGovEnum(edTpFornecimento.ItemIndex);
  FNFSe.TpEnteGov := TipoEnteGovEnum(edTipoEnteGov.ItemIndex);

  if FNFSe.LayoutNFSeComIbsCbs() then
  begin
    if FState.IbsCbsNacional <> nil then
    begin
      FState.IbsCbsNacional.TipoRegra := TipoRegraTributoDFeEnum(edTipoRegra.ItemIndex);
      FState.IbsCbsNacional.RegraFiscalId := StringNullable.CreateOrNull( ComboBoxRegrasFiscaisFrame1.GetRegraFiscalId );
      FState.IbsCbsNacional.CST := StringService.OnlyNumber( edCST.Text );
      FState.IbsCbsNacional.CClassTrib := StringService.OnlyNumber( edCClassTrib.Text );
      FState.IbsCbsNacional.CSTReg := StringNullable.CreateOrNull( StringService.OnlyNumber( edCSTReg.Text ));
      FState.IbsCbsNacional.CClassRribReg := StringNullable.CreateOrNull( StringService.OnlyNumber( edCClassTribReg.Text ));
      FState.IbsCbsNacional.PDifUF := CurrencyNullable.Create( edPDifIbsUF.AsCurrency, edPDifIbsUF.IsNull );
      FState.IbsCbsNacional.PDifMun := CurrencyNullable.Create( edPDifIbsMun.AsCurrency, edPDifIbsMun.IsNull );
      FState.IbsCbsNacional.PDifCBS := CurrencyNullable.Create( edPDifCbs.AsCurrency, edPDifCbs.IsNull );
    end;
    FState.Tributo := TributoDFeContextEtd.Create(
      FNFSe.Id, TribRtc.Origem, nil, NFSeTributosDFeFrame1.GetIbsCbs()
    );
  end;

  // Substituição
  if FNFSe.Substituida <> nil then
  begin
    FNFSe.Substituida.Chave := StringNullable.CreateOrNull( edSubChave.Text );
    if FNFSe.IsPadraoNacional() then
      FNFSe.Substituida.CMotivo := StringNullable.CreateOrNull(
        IntToStr( Ord( MotivoSubstituicaoEnum( edSubCMotivo.ItemIndex ))), '0'
      )
    else
      FNFSe.Substituida.CMotivo := StringNullable.CreateOrNull( Trim( edSubCMotivo.Text ));
    FNFSe.Substituida.XMotivo := StringNullable.CreateOrNull( Trim(edSubXMotivo.Text) );
    FNFSe.Substituida.Serie := StringNullable.CreateOrNull( Trim(edSubSerie.Text) );
    FNFSe.Substituida.Ndps := IntegerNullable.Create( edSubNDps.AsInteger, edSubNDps.IsNull );
    FNFSe.Substituida.NNFSe := Int64Nullable.Create( edSubNNFSe.AsInt64, edSubNNFSe.IsNull );
    FNFSe.Substituida.NLote := StringNullable.CreateOrNull( Trim(edSubNLote.Text) );
    FNFSe.Substituida.CVerificacao := StringNullable.CreateOrNull( Trim(edSubCVerificacao.Text) );
  end;

  if not FNFSe.IsEmissaoPropria then
    FNFSe.NDps := IntegerNullable.Create( edNumeroDps.AsInteger, edNumeroDps.IsNull );

  if not FNFSe.IsEmissaoSistema then
  begin
    FNFSe.Serie := StringNullable.CreateOrNull( edSerie.Text );
    FNFSe.NNFSe := Int64Nullable.Create( edNumeroNFSe.AsInt64, edNumeroNFSe.IsNull );
    FNFSe.ChaveNFSe := StringNullable.CreateOrNull( edChave.Text );
    FNFSe.DhProc := DateTimeNullable.CreateOrNull( StrToDateTimeDef(edDhProcessamento.Text, 0 ))
  end;
end;

procedure TNFSeFrame.NFSeTributosDFeFrameCalculoCallBack(Sender: TObject);
begin
  HandleCalculosFiscais();
end;

procedure TNFSeFrame.OpInternasFrameChange(Sender: TObject;
  OpInterna: OperacaoInternaEtd);
var
  OId: string;
begin
  OId := FNFSe.OpInternaId.Value;
  if OpInterna = nil then
    FNFSe.OpInternaId := StringNullable.NullInstance()

  else
    FNFSe.OpInternaId := StringNullable.Create(OpInterna.Id);

  if OId <> FNFSe.OpInternaId.Value then
    HandleRegraFiscal();
end;

procedure TNFSeFrame.Reset;
begin
  pageDPS.ActivePage := tabResumo;
  pageValores.ActivePage := tabISS;
  pageParticipantes.ActivePage := tabPartPrincipal;
end;

procedure TNFSeFrame.SelecionadoCampoFiscalNFSe(Campo: TFormCorrelFiscalCampo; const Value: string);
begin
  if not FNFSe.EstaEmDigitacao() then
    Exit;

  if (Length(FOSList) > 0) and (Campo in [ cfLC116, cfCTribNac, cfNBS ])
    and not FAuditor.Processo('NFS043', FSnapShot.NFSe.GetAuditLabel(), FSnapShot.NFSe.GetAuditKey())
      .Alterar.Permitido() then
    Exit;

  case Campo of
    cfLC116:
      begin
        FNFSe.CLC116.SetValue(Value);
        edClc116.Text := Value;
      end;

    cfCTribNac:
      begin
        FNFSe.CTribNac.SetValue(Value);
        edCTribNac.Text := Value;
      end;

    cfNBS:
      begin
        FNFSe.CNBS.SetValue(Value);
        edCNBS.Text := Value;
      end;

    cfCIndOp:  
      begin
        FNFSe.CIndOp.SetValue(Value);
        edcIndOp.Text := Value;
      end;
  end;
end;

procedure TNFSeFrame.Setup(const Input: NFSeModel; const Auditor: TAudit_OOP);
var
  I: Integer;
  isReadOnlyOrDisable, situacaoFinalizada: Boolean;
  nfOSs: NFSeOSEtdList;
  nfSub: NFSeResumoModel;
begin
  SetLength(FOSList, 0);
  FState.Free();
  FSnapShot.Free();

  FState := Input.Clone();
  FSnapShot := Input.Clone();
  FAuditor := Auditor;

  isReadOnlyOrDisable := FNFSe.Situacao in [ sdpsEmissao, sdpsEmProcessamento, sdpsAutorizada, sdpsCancelada, sdpsSubstituida ];
  situacaoFinalizada  := FNFSe.Situacao in [ sdpsAutorizada, sdpsCancelada, sdpsSubstituida ];

  {$REGION 'Readonly ou Disable nos componentes'}
  PanelResumo1.Enabled := not isReadOnlyOrDisable;
  PanelResumo2.Enabled := not isReadOnlyOrDisable;
  PanelResumo3.Enabled := not isReadOnlyOrDisable;
  PanelResumo4.Enabled := not isReadOnlyOrDisable;
  PanelResumo5.Enabled := not isReadOnlyOrDisable;

  PanelParticipantes1.Enabled := not isReadOnlyOrDisable;
  tabPartPrincipal.Enabled := not isReadOnlyOrDisable;
  tabIntermediario.Enabled := not isReadOnlyOrDisable;
  tabDestIbsCbs.Enabled := not isReadOnlyOrDisable;

  PanelServicos1.Enabled := not isReadOnlyOrDisable;
  PanelServicos2.Enabled := not isReadOnlyOrDisable;
  edDiscriminacao.ReadOnly := isReadOnlyOrDisable;

  PanelValores1.Enabled := not isReadOnlyOrDisable;
  tabISS.Enabled := False;
  tabPISCOFINS.Enabled := False;
  tabRetencoes.Enabled := False;
  tabTotTrib.Enabled := False;
  linkInformarTribManual.Visible := FNFSe.EstaEmDigitacao;

  edSubChave.ReadOnly := isReadOnlyOrDisable;
  edSubCMotivo.Enabled := not isReadOnlyOrDisable;
  PanelNFSeSubst2.Enabled := not isReadOnlyOrDisable;
  PanelNFSeSubst3.Enabled := not isReadOnlyOrDisable;

  PanelIbsCbsNac1.Enabled := not isReadOnlyOrDisable;
  PanelIbsCbsNac2.Enabled := not isReadOnlyOrDisable;
  PanelIbsCbsNac3.Enabled := not isReadOnlyOrDisable;
  PanelIbsCbsNac4.Enabled := not isReadOnlyOrDisable;
  PanelIbsCbsNac5.Enabled := not isReadOnlyOrDisable;
  {$ENDREGION}

  if FNFSe.IsPadraoNacional then
  begin
    lbNumDpsRps.Caption := 'Numero DPS';
    lbNumDpsRps1.Caption := lbNumDpsRps.Caption;
  end
  else
  begin
    lbNumDpsRps.Caption := 'Numero RPS';
    lbNumDpsRps1.Caption := lbNumDpsRps.Caption;
  end;

  ComboBoxOpInternasFrame1.Setup(TSetupComboBoxOpInternasFrame.Create(
    FNFSe.OpInternaId.Value, False, False
  ));

  //Resumo no topo
  lbSerieDps.Caption := Format('%s/%d', [FNFSe.Serie.Value, FNFSe.NDps.Value]);
  //lbDhemi
  lbLayout.Caption := LayoutNFSeEnumStr[FNFSe.LayoutNFSe];
  lbNaturezaEmissao.Caption := NaturezaEmissaoNFSeEnumStr[FNFSe.NaturezaEmissao];

  // Identificacao
  lbSituacao.Caption := SituacaoNFSeEnumStr[FNFSe.Situacao];
  edSerie.Text := FNFSe.Serie.Value;
  edNumeroDps.UpdateValue( FNFSe.NDps.Value, FNFSe.NDps.IsNull );
  edNumeroNFSe.UpdateValue( FNFSe.NNFSe.Value, FNFSe.NNFSe.IsNull );
  if FNFSe.DhProc.HasValue then
    edDhProcessamento.Text := DateTimeService.ParseLocal( FNFSe.DhProc.Value ) //FormatDateTime('dd/MM/yyyy hh:mm', FNFSe.DhProc.Value )
  else
    edDhProcessamento.Text := '';

  edSerie.Enabled := FNFSe.NaturezaEmissao <> nemtPrestadorWS;
  edNumeroDps.Enabled := not FNFSe.IsEmissaoPropria;
  if FNFSe.Dhemi.HasValue then
    edDhemi.Text := DateTimeService.ParseLocal( FNFSe.Dhemi.Value ) //FormatDateTime('dd/MM/yyyy hh:mm', FNFSe.Dhemi.Value )
  else
    edDhemi.Text := '';
  lbDhemi.Caption := edDhemi.Text;
  if FNFSe.DCompet.HasValue then
    edDataPrestacao.Text := DateService.ParseLocal( FNFSe.Dcompet.Value )
  else
    edDataPrestacao.Text := '';

  // Aqui tem de melhorar, setar o panel visivel, mesma do tabNacional
  if FState.IbsCbsNacional <> nil then
  begin
    edFinNFS.ItemIndex := FNFSe.FinNFSe;
    edcIndOp.Text := FNFSe.CIndOp.Value;
    edTpFornecimento.ItemIndex := Ord(FNFSe.TpOper);
    edTipoEnteGov.ItemIndex := Ord(FNFSe.TpEnteGov);
    ckIndDest.Checked := FNFSe.IndDest = Ord(ynYes);
  end;  

  //Tomador
  tabPartPrincipal.Caption := IfThen( FNFSe.IsEmissaoPropria(), 'Tomador', 'Prestador');
  linkPesquisarPartPrincipal.Caption := 'Pesquisar ' + tabPartPrincipal.Caption;
  linkRemoverPartPrincipal.Caption := 'Remover ' + tabPartPrincipal.Caption;
  lbPartPrincipal.Caption := tabPartPrincipal.Caption + ' do Serviço';
  SetupParticipantePrincipal();

  //Intermediario
  if FNFSe.Intermediario <> nil then
    tabIntermediario.Caption := Format('  %s [%d]  ', [ TipoPartDpesEnumStr[tprtIntermediario], FNFSe.IntermediarioId.Value])
  else
    tabIntermediario.Caption := Format('  %s  ', [ TipoPartDpesEnumStr[tprtIntermediario] ]) ;
  DPSIntermediarioFrame1.Setup( FNFSe.Intermediario );
  linkRemoverIntermediario.Visible := FNFSe.Intermediario <> nil;

  //Dest IBSCBS
  if FNFSe.DestIbsCbs <> nil then
    tabDestIbsCbs.Caption := Format('  %s [%d]  ', [ TipoPartDpesEnumStr[tprtDestIbsCbs], FNFSe.DestIbsCbsId.Value])
  else
    tabDestIbsCbs.Caption := Format('  %s  ', [ TipoPartDpesEnumStr[tprtDestIbsCbs] ]) ;

  tabDestIbsCbs.TabVisible := (FState.IbsCbsNacional <> nil)
    and (YesNoEnum(FNFSe.IndDest) = ynYes); // IndDest > Destinatario diferente do Tomador
  ckIndDest.Visible := FNFSe.LayoutNFSeComIbsCbs();

  DPSDestIbsCbsFrame1.Setup( FNFSe.DestIbsCbs );
  linkRemoverDestIbcCbs.Visible := FNFSe.DestIbsCbs <> nil;

  //Local prestacao do servico
  ComboBoxMunicipiosFrame1.Setup(TSetupComboBoxMunicipiosFrame.Create(
    FNFSe.CLocPrestacao.Value, False, False
  ));
  // Servico
  SetupServico();
     
  // Valores
  edVServ.UpdateValue( FNFSe.VServ.Value, FNFSe.VServ.IsNull );
  edVServ2.UpdateValue( FNFSe.VServ.Value, FNFSe.VServ.IsNull );
  edVDesc.UpdateValue( FNFSe.VDescIncond.Value, FNFSe.VDescIncond.IsNull );
  edVDesc2.UpdateValue( FNFSe.VDescIncond.Value, FNFSe.VDescIncond.IsNull );
  edVLIQ.UpdateValue( FNFSe.VLiq.Value, FNFSe.VLiq.IsNull );
  edTotNF.UpdateValue( FNFSe.VTotNf.Value, FNFSe.VTotNf.IsNull );
  edTotRet.UpdateValue( FNFSe.VTotalRet.Value, FNFSe.VTotalRet.IsNull );

  // Valores ISS
  edTribISSQN.ItemIndex := Ord(FNFSe.TribIssQn);
  edIssPAliq.UpdateValue( FNFSe.IssPAliq.Value, FNFSe.IssPAliq.IsNull );
  edIssVBCISS.UpdateValue( FNFSe.IssVBC.Value, FNFSe.IssVBC.IsNull );
  edVISS.UpdateValue( FNFSe.VIss.Value, FNFSe.VIss.IsNull );

  // Valores PISCOFINS
  edpc_CST.Text := FNFSe.PCCst.Value;
  edpc_vbc.UpdateValue(FNFSe.PCVBcPisCofins.Value, FNFSe.PCVBcPisCofins.IsNull);
  edpc_ppis.UpdateValue(FNFSe.PCPAliqPis.Value, FNFSe.PCPAliqPis.IsNull);
  edpc_pcofins.UpdateValue(FNFSe.PCPAliqCofins.Value, FNFSe.PCPAliqCofins.IsNull);
  edpc_vpis.UpdateValue(FNFSe.PCVPis.Value, FNFSe.PCVPis.IsNull);
  edpc_vcofins.UpdateValue(FNFSe.PCVCofins.Value, FNFSe.PCVCofins.IsNull);

  // Valores Retencoes
  pnRetencoesComboNacional.Visible := FNFSe.IsPadraoNacional();
  ckRetIss.Visible := not FNFSe.IsPadraoNacional();

  edRetPISCOFINS.ItemIndex := Ord(FNFSe.TpRetPisCofins);

  edRetIss.ItemIndex := Ord(FNFSe.TpRetIssQn);
  ckRetIss.Checked := FNFSe.TpRetIssQn in [trRetidoPeloTomador, trRetidoPeloIntermediario];
  ckRetIss.Visible := not FNFSe.IsPadraoNacional();

  edret_virrf.UpdateValue(FNFSe.VRetIrrf.Value, FNFSe.VRetIrrf.IsNull);
  edret_vcsll.UpdateValue(FNFSe.VRetCsll.Value, FNFSe.VRetCsll.IsNull);
  edret_vcp.UpdateValue(FNFSe.VRetCP.Value, FNFSe.VRetCP.IsNull);
  edret_vpis.UpdateValue(FNFSe.VRetPis.Value, FNFSe.VRetPis.IsNull);
  edret_vcofins.UpdateValue(FNFSe.VRetCofins.Value, FNFSe.VRetCofins.IsNull);

  // Val aprox triutos
  edvtrib_indtot.Checked := FNFSe.IndTotTrib = ynYes;
  edvtrib_pfed.UpdateValue( FNFSe.PTotTribFed.Value, FNFSe.PTotTribFed.IsNull );
  edvtrib_pest.UpdateValue( FNFSe.PTotTribEst.Value, FNFSe.PTotTribEst.IsNull );
  edvtrib_pmun.UpdateValue( FNFSe.PTotTribMun.Value, FNFSe.PTotTribMun.IsNull );
  edvtrib_ptot.UpdateValue( FNFSe.PTotTribSN.Value, FNFSe.PTotTribSN.IsNull );
  SetupVisualValorAproxTributos();

  // IBSCBS
  SetupIbsCbsNacional();
  tabIbsCbsNac.TabVisible := FNFSe.LayoutNFSeComIbsCbs() and
    not FNFSe.EstaFinalizada() and (FNFSe.NaturezaEmissao = nemtPrestadorWS); // Melhorar isso, quem define é o layou, ver onde seta para criar se nao tiver

  if (FNFSe.NaturezaEmissao = nemtPrestadorWS) and FNFSe.LayoutNFSeComIbsCbs() and situacaoFinalizada then
    tabIbsCbsValores.TabVisible := True
  else if (FNFSe.NaturezaEmissao <> nemtPrestadorWS) and FNFSe.LayoutNFSeComIbsCbs() then
    tabIbsCbsValores.TabVisible := True
  else
    tabIbsCbsValores.TabVisible := False;

  if tabIbsCbsValores.TabVisible then
    if TribRtc <> nil then
      NFSeTributosDFeFrame1.Setup( TribRtc.IbsCbs )
    else
      NFSeTributosDFeFrame1.Setup( nil );

  NFSeTributosDFeFrame1.Setup( isReadOnlyOrDisable );

  // Substituição
  tabSubst.TabVisible := FNFSe.Substituida <> nil;
  if FNFSe.Substituida <> nil then
  begin
    if FNFSe.IsPadraoNacional() then
    begin                                  
      UIUtils.Populate( edSubCMotivo.Items, MotivoSubstituicaoEnumStr );

      edSubCMotivo.Style := csDropDownList;
      edSubCMotivo.ItemIndex := Ord( MotivoSubstituicaoEnum( StrToIntDef( FNFSe.Substituida.CMotivo.Value, 0 )));
    end
    else
    begin
      edSubCMotivo.Style := csSimple;
      edSubCMotivo.Items.Clear();
      edSubCMotivo.Text := FNFSe.Substituida.CMotivo.Value;
    end;
    edSubXMotivo.Text := FNFSe.Substituida.XMotivo.Value;
    edSubChave.Text := FNFSe.Substituida.Chave.Value;
    edSubSerie.Text := FNFSe.Substituida.Serie.Value;
    edSubNDps.UpdateValue( FNFSe.Substituida.Ndps.Value, FNFSe.Substituida.Ndps.IsNull );
    edSubNNFSe.UpdateValue( FNFSe.Substituida.NNFSe.Value, FNFSe.Substituida.NNFSe.IsNull );
    edSubNLote.Text := FNFSe.Substituida.NLote.Value;
    edSubCVerificacao.Text := FNFSe.Substituida.CVerificacao.Value;

    if not FNFSe.Substituida.SubstituidaId.IsNullOrWhiteSpace then
    begin
      nfSub := Container.GetInstance().ErpFeaturesFactory.CreateObterNFSeResumoUseCase()
        .Executar(FNFSe.Substituida.SubstituidaId.Value);

      edSubChave.Enabled := FNFSe.Substituida.Chave.IsNullOrWhiteSpace() and (nfSub.NaturezaEmissao <> nemtPrestadorWS);
      edSubSerie.Enabled := FNFSe.Substituida.Serie.IsNullOrWhiteSpace() and (nfSub.NaturezaEmissao <> nemtPrestadorWS);
      edSubNDps.Enabled := FNFSe.Substituida.Ndps.IsNull and (nfSub.NaturezaEmissao <> nemtPrestadorWS);
      edSubNNFSe.Enabled := FNFSe.Substituida.NNFSe.IsNull and (nfSub.NaturezaEmissao <> nemtPrestadorWS);
      edSubNLote.Enabled := FNFSe.Substituida.NLote.IsNull and (nfSub.NaturezaEmissao <> nemtPrestadorWS);
      edSubCVerificacao.Enabled := FNFSe.Substituida.CVerificacao.IsNullOrWhiteSpace()
        and (nfSub.NaturezaEmissao <> nemtPrestadorWS);
    end;

    edSubChave.Enabled := Assigned(FNFSe.Substituida) and FNFSe.Substituida.Chave.IsNullOrWhiteSpace();
  edSubChave.Enabled := Assigned(FNFSe.Substituida) and FNFSe.Substituida.Chave.IsNullOrWhiteSpace();

  end;

  // Continuar aqui com o resto dos campos
  edChave.Text := FNFSe.ChaveNFSe.Value;

  case FNFSe.NaturezaEmissao of
    nemtPrestadorWS:
      begin
        edNumeroDps.Color := clWindow;

        edNumeroNFSe.ReadOnly := True;
        edNumeroNFSe.Color := clBtnFace;
        edNumeroNFSe.TabStop := False;

        edDhProcessamento.ReadOnly := True;
        edDhProcessamento.Color := clBtnFace;
        edDhProcessamento.TabStop := False;
        btAtualizarDataProcessamento.Enabled := False;

        edChave.ReadOnly := True;
        edChave.Color := clBtnFace;

        PanelIbsCbsNac1.Visible := FNFSe.LayoutNFSeComIbsCbs();
        PanelIbsCbsNac2.Visible := FNFSe.LayoutNFSeComIbsCbs();
        PanelIbsCbsNac3.Visible := FNFSe.LayoutNFSeComIbsCbs() and not situacaoFinalizada;
        PanelIbsCbsNac4.Visible := FNFSe.LayoutNFSeComIbsCbs() and not situacaoFinalizada;
        PanelIbsCbsNac5.Visible := FNFSe.LayoutNFSeComIbsCbs() and not situacaoFinalizada;

        PanelIbsCbsNac2.Top := 9999;
        PanelIbsCbsNac3.Top := 9999;
        PanelIbsCbsNac4.Top := 9999;
        PanelIbsCbsNac5.Top := 9999;
      end;

    nemtPrestadorPortal,
    nemtTomadorTerceiros:
      begin
        edNumeroDps.Color := clBtnFace;

        edNumeroNFSe.ReadOnly := False;
        edNumeroNFSe.Color := clWindow;
        edNumeroNFSe.TabStop := True;

        edDhProcessamento.ReadOnly := False;
        edDhProcessamento.Color := clWindow;
        edDhProcessamento.TabStop := True;
        btAtualizarDataProcessamento.Enabled := True;

        edChave.ReadOnly := isReadOnlyOrDisable;
        edChave.Color := clWindow;

        PanelIbsCbsNac1.Visible := FNFSe.LayoutNFSeComIbsCbs();
        PanelIbsCbsNac2.Visible := FNFSe.LayoutNFSeComIbsCbs();
        PanelIbsCbsNac3.Visible := False;
        PanelIbsCbsNac4.Visible := False;
        PanelIbsCbsNac5.Visible := False;
      end;
    else
      raise Exception.Create('TNFSeFrame.Setup Case NaturezaEmissao')
  end;

  pnOS.Visible := False;
  if FNFSe.Id <> '' then
  begin
    nfOSs := Container.GetInstance().ErpFeaturesFactory.CreateObterNFSeOSsUseCase().Executar(FNFSe.Id);
    try
      if nfOSs.Count > 0 then
      begin
        SetLength(FOSList, nfOSs.Count);
        for I := 0 to nfOSs.Count - 1 do
          FOSList[I] := nfOSs.Items[I].NumPed;

        if Length(FOSList) = 1 then
          pnOS.Caption := Format('Ordem de Serviço: %d', [ FOSList[0] ])
        else
          pnOS.Caption := Format('Ordens de Serviço: %s', [
            StringService.Join(', ', ArrayService.IntArrayToStringArray(FOSList))
          ]);
        pnOS.Visible := True;
        pnOS.Top := 9999;
      end;
    finally
      nfOSs.Free();
    end;
  end;

  edVServ.Enabled := not pnOS.Visible;
  edVDesc.Enabled := not pnOS.Visible;
  edVServ2.Enabled := not pnOS.Visible;
  edVDesc2.Enabled := not pnOS.Visible;

  if FNFSe.Id = '' then
    Reset();
end;

procedure TNFSeFrame.SetupIbsCbsNacional;
var
  IC: DpsEmitirIbsCbsNacionalModel;
begin
  if FState.IbsCbsNacional = nil then
    IC := DpsEmitirIbsCbsNacionalModel.Create
  else
    IC := FState.IbsCbsNacional;
  try   
    
    edTipoRegra.ItemIndex := Ord(IC.TipoRegra);

    ComboBoxRegrasFiscaisFrame1.Setup( IC.RegraFiscalId.Value );
    edCST.Text := IC.CST;
    edCClassTrib.Text := IC.CClassTrib;
    edCSTReg.Text := IC.CSTReg.Value;
    edCClassTribReg.Text := IC.CClassRribReg.Value;
    edPDifIbsUF.UpdateValue(IC.PDifUF.Value, IC.PDifUF.IsNull);
    edPDifIbsMun.UpdateValue(IC.PDifMun.Value, IC.PDifMun.IsNull);
    edPDifCbs.UpdateValue(IC.PDifCBS.Value, IC.PDifCBS.IsNull);
  finally
    if FState.IbsCbsNacional = nil then
      IC.Free();
  end;
end;

procedure TNFSeFrame.SetupServico;
begin
  if FNFSe.Servico = nil then
  begin
    edCodServico.Text := '';
    edCodServico2.Text := '';
    edCcnae.Text := '';
    edClc116.Text := '';
    edCTribNac.Text := '';
    edCTribMun.Text := '';
    edCNBS.Text := '';
    edDiscriminacao.Lines.Clear;
  end
  else
  begin
    edCodServico.Text := Format('%d - %s', [ FNFSe.CodServico.Value, FNFSe.Servico.Descricao]);
    edCodServico2.Text := Format('%d - %s', [ FNFSe.CodServico.Value, FNFSe.Servico.Descricao]);
    edCcnae.Text := FNFSe.CCNAE.Value;
    edClc116.Text := FNFSe.CLC116.Value;
    edCTribNac.Text := FNFSe.CTribNac.Value;
    edCTribMun.Text := FNFSe.CTribMun.Value;
    edCNBS.Text := FNFSe.CNBS.Value;
    edDiscriminacao.Lines.Text := FNFSe.XDescServ.Value;    
  end;
end;

procedure TNFSeFrame.SetupVisualValorAproxTributos;
begin
  {
  edvtrib_pfed.ReadOnly := FNFSe.IndTotTrib = ynYes;
  edvtrib_pest.ReadOnly := FNFSe.IndTotTrib = ynYes;
  edvtrib_pmun.ReadOnly := FNFSe.IndTotTrib = ynYes;
  edvtrib_ptot.ReadOnly := FNFSe.IndTotTrib = ynNo;

  edvtrib_pfed.Color := IfThen(edvtrib_pfed.ReadOnly, clBtnFace, clWhite);
  edvtrib_pest.Color := IfThen(edvtrib_pest.ReadOnly, clBtnFace, clWhite);
  edvtrib_pmun.Color := IfThen(edvtrib_pmun.ReadOnly, clBtnFace, clWhite);
  edvtrib_ptot.Color := IfThen(edvtrib_ptot.ReadOnly, clBtnFace, clWhite);
  }
end;

procedure TNFSeFrame.SetupParticipantePrincipal;
begin
  if FNFSe.ParticipantePrincipal <> nil then
  begin
    linkRemoverPartPrincipal.Visible := True;
    edCodCliente.Text := Format('%d - %s / %s', [
      FNFSe.CodCliente.Value, FNFSe.ParticipantePrincipal.Cpfcnpj.Value, FNFSe.ParticipantePrincipal.Xnome
    ]);
  end
  else
  begin
    edCodCliente.Text := '';
    linkRemoverPartPrincipal.Visible := False;
  end;
  DPSPartPrincipalFrame1.Setup( FNFSe.ParticipantePrincipal );
end;

procedure TNFSeFrame.AtualizarTotaisCalculados;
begin
  with Container.GetInstance().ErpFeaturesFactory.CreateCalcularTotaisNFSeUseCase()
    .Executar(FState) do
  begin
    FNFSe.VTotalRet.SetValue( TotalRetencoes );
    FNFSe.VLiq.SetValue( ValorLiquido );
    FNFSe.VTotNf.SetValue( ValorTotalNF );

    edVLIQ.UpdateValue( FNFSe.VLiq.Value, FNFSe.VLiq.IsNull );
    edTotNF.UpdateValue( FNFSe.VTotNf.Value, FNFSe.VTotNf.IsNull );
    edTotRet.UpdateValue( FNFSe.VTotalRet.Value, FNFSe.VTotalRet.IsNull );
  end;
end;

procedure TNFSeFrame.btAtualizarDataEmissaoClick(Sender: TObject);
begin
  edDhemi.Text := DateTimeService.ParseLocal(Now());
  lbDhemi.Caption := edDhemi.Text;
end;

procedure TNFSeFrame.btAtualizarDataProcessamentoClick(Sender: TObject);
begin
  edDhProcessamento.Text := DateTimeService.ParseLocal(Now());
end;

procedure TNFSeFrame.btPesquisarServicoClick(Sender: TObject);
var
  L: TStrings;
  S, GFId: string;
  I, codServicoOld: Integer;
  TS: TipoServicoEtd;
begin
  if (Length(FOSList) > 0)
    and not FAuditor.Processo('NFS043', FSnapShot.NFSe.GetAuditLabel(), FSnapShot.NFSe.GetAuditKey())
      .Alterar.Permitido() then
    Exit;

  L := TStringList.Create();
  try
    S := vDadosIni.pesquisaRapida('TIPO_SERVICO', '', 'Consulta de Serviços');

    if TryStrToInt(S, I) then
    begin
      TS := Container.GetInstance().ErpFeaturesFactory.CreateObterTipoServicoPorIdUseCase()
        .Executar(I);

      if TS = nil then
        EValidacaoNegocio.Create('Tipo de Serviço não encontrado');

      if FNFSe.Servico = nil then
        GFId := '-'
      else
        GFId := FNFSe.Servico.GrupoFiscalIbsCbsId.Value;

      codServicoOld := FNFSe.CodServico.Value;

      FNFSe.Servico := TS;

      FNFSe.CCNAE := TS.CNAE;
      FNFSe.CLC116 := TS.CodLC116;
      FNFSe.CTribNac := TS.CTribNac;
      FNFSe.CTribMun := TS.CTribMun;     
      FNFSe.CNBS := TS.CNBS;
      FNFSe.IssPAliq := TS.AliqISS;
      if TS.CIndOp.HasValue then
      begin
        FNFSe.CIndOp := TS.CIndOp;
        edcIndOp.Text := FNFSe.CIndOp.Value;
      end;

      if FNFSe.XDescServ.Value <> TS.Descricao then
        if FNFSe.XDescServ.IsNullOrWhiteSpace
          or (UIUtils.ShowQuestion('Sobreescrever Discriminação dos Serviços?') = IDYES)
        then
          FNFSe.XDescServ.SetValue( TS.Descricao );

      SetupServico();

      if GFId <> FNFSe.Servico.GrupoFiscalIbsCbsId.Value then
        HandleRegraFiscal();

      if not FNFSe.CodServico.IsNull and (FNFSe.CodServico.Value <> codServicoOld)  then
        HandleCalculosFiscais();
    end;

  finally
    L.Free();
  end;
end;

end.

** Definir se será o checkbox somente ou o combox da retencao

Trocar o componente pDiferimenti pelo EditHW Nullabhle

tem de coloca o controle no formulario para o cusuario escolher digitar
