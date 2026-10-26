unit uCadConfigAPI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, uClassesConfigWS, DBCtrls, uEditHw, ExtDlgs;

type
  TfrmCadConfigAPI = class(TfrmCadPadraoM)
    tsCadastro: TTabSheet;
    PageControl2: TPageControl;
    TabSheetTrayEC: TTabSheet;
    TabSheetSmartbis: TTabSheet;
    tsOpcoes: TTabSheet;
    spAPItrayCommerce: TSpeedButton;
    pnOpcoesAPI: TPanel;
    Panel5: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    RadioGroupOpcoes: TRadioGroup;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Panel4: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEditUrlTray: TDBEdit;
    DBEditConsumerKeyTray: TDBEdit;
    DBEditConsumerSecretTray: TDBEdit;
    DBEditCodeAutorizationTray: TDBEdit;
    EditHwTabelaPrecoTray: TEditHw;
    DBLookupComboBoxTabelaPrecoTray: TDBLookupComboBox;
    EditHwTipoClienteTray: TEditHw;
    DBLookupComboBoxTipoClienteTray: TDBLookupComboBox;
    EditHwVendedorTray: TEditHw;
    DBLookupComboBoxVendedorTray: TDBLookupComboBox;
    GroupBox6: TGroupBox;
    Panel97: TPanel;
    Panel102: TPanel;
    TreeViewPromocaoTray: TTreeView;
    Panel104: TPanel;
    Panel105: TPanel;
    TreeViewPromocaoTray_DB: TTreeView;
    Panel106: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Splitter3: TSplitter;
    Label12: TLabel;
    DBEditUrlSmartbis: TDBEdit;
    Label15: TLabel;
    DBEditTokenSmartbis: TDBEdit;
    Label16: TLabel;
    DBEditSenhaSmartbis: TDBEdit;
    TabSheetCA: TTabSheet;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    Panel9: TPanel;
    Splitter4: TSplitter;
    Panel10: TPanel;
    TreeViewPromocaoCA: TTreeView;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    TreeViewPromocaoCA_DB: TTreeView;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Label17: TLabel;
    EditHwTabelaPrecoCA: TEditHw;
    DBLookupComboBoxTabelaPrecoCA: TDBLookupComboBox;
    Label18: TLabel;
    DBEditIdentificacaoCA: TDBEdit;
    Label19: TLabel;
    DBEditTelefoneCA: TDBEdit;
    Label20: TLabel;
    DBEditWhatsppCA: TDBEdit;
    Label22: TLabel;
    DBEdit_ImagemLogotipoCA: TDBEdit;
    SpeedButton14: TSpeedButton;
    SpeedButton13: TSpeedButton;
    Label23: TLabel;
    DBEditWebSiteCA: TDBEdit;
    Label24: TLabel;
    DBEditEmailCA: TDBEdit;
    Label25: TLabel;
    DBEditSenhaCA: TDBEdit;
    TabSheetConcCartao: TTabSheet;
    GroupBox9: TGroupBox;
    Label21: TLabel;
    DBEditUrlConfere: TDBEdit;
    Label26: TLabel;
    DBEditCodIntegradorConfere: TDBEdit;
    Label27: TLabel;
    DBMemoTokenIntegradorConfere: TDBMemo;
    Label28: TLabel;
    DBEditCodClienteConfere: TDBEdit;
    Label29: TLabel;
    DBEditCodEstabConfere: TDBEdit;
    TabSheetKentro: TTabSheet;
    GroupBox10: TGroupBox;
    Label32: TLabel;
    EditPasswordKentro: TEdit;
    Label35: TLabel;
    EditQueuedIdKentro: TEdit;
    TabSheetNuvemshopEC: TTabSheet;
    GroupBox11: TGroupBox;
    Panel18: TPanel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label43: TLabel;
    DBEditUrlNuvemshop: TDBEdit;
    DBEditIdLojaNuvemshop: TDBEdit;
    DBEditAcessTokenNuvemshop: TDBEdit;
    EditHwTipoClienteNuvemshop: TEditHw;
    DBLookupComboBoxTipoClienteNuvemshop: TDBLookupComboBox;
    EditHwVendedorNuvemshop: TEditHw;
    DBLookupComboBoxVendedorNuvemshop: TDBLookupComboBox;
    Label39: TLabel;
    EditHwTabelaPrecoNuvemshop: TEditHw;
    DBLookupComboBoxTabelaPrecoNuvemshop: TDBLookupComboBox;
    GroupBox12: TGroupBox;
    Panel19: TPanel;
    Splitter5: TSplitter;
    Panel20: TPanel;
    TreeViewPromocaoNuvemshop: TTreeView;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    TreeViewPromocaoNuvemshop_DB: TTreeView;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    TabSheetPlugBoleto: TTabSheet;
    GroupBox13: TGroupBox;
    Panel27: TPanel;
    Label44: TLabel;
    DBEditTokenPlug: TDBEdit;
    DBEditChaveAssignPlug: TDBEdit;
    Label45: TLabel;
    Label46: TLabel;
    ComboBoxAmbientePlug: TComboBox;
    Label30: TLabel;
    EditUrlKentro: TEdit;
    TabSheetNummus: TTabSheet;
    GroupBox14: TGroupBox;
    Label31: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    EditUrlNummus: TEdit;
    EditApiKeyNummus: TEdit;
    EditClientIdNummus: TEdit;
    TabSheetSuzuki: TTabSheet;
    GroupBoxSuzuki: TGroupBox;
    PanelTopSuzuki: TPanel;
    LabelUrlSuzuki: TLabel;
    DBEditUsuarioSuzuki: TDBEdit;
    LabelApiKeySuzuki: TLabel;
    DBEditSenhaSuzuki: TDBEdit;
    Label42: TLabel;
    ComboBoxAmbienteSuzuki: TComboBox;
    pmConfiguracoes: TPopupMenu;
    ConfiguraesAPITrayECommerce1: TMenuItem;
    ConfiguraesAPINuvemshopECommerce1: TMenuItem;
    ConfiguraesAPIComrcioAberto1: TMenuItem;
    ConfiguraesAPISmartbisFidelizao1: TMenuItem;
    ConfiguraesAPINummusCashback1: TMenuItem;
    ConfiguraesAPIConfereConciliaodeCarto1: TMenuItem;
    ConfiguraesAPIPlugBoletosBoletosBancrios1: TMenuItem;
    ConfiguraesEnvioNotificaesdoFinanceiro1: TMenuItem;
    ConfiguraesPagOnline1: TMenuItem;
    ConfiguraesHwCloudIA1: TMenuItem;
    TabSheetHwCloudIA: TTabSheet;
    GroupBox15: TGroupBox;
    Panel28: TPanel;
    Label47: TLabel;
    Label48: TLabel;
    Label63: TLabel;
    DBEditUrlHwCloudIA: TDBEdit;
    DBEditAuthorizationHwCloudIA: TDBEdit;
    DBMemoInfoContatoHwCloudIA: TDBMemo;
    PageControl4: TPageControl;
    TabSheet5: TTabSheet;
    GroupBox17: TGroupBox;
    DBGrid2: TDBGrid;
    TabSheet6: TTabSheet;
    GroupBox16: TGroupBox;
    Bevel1: TBevel;
    Label137: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label52: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Bevel2: TBevel;
    Label61: TLabel;
    Label62: TLabel;
    Label64: TLabel;
    DBEditPesoPopularidadeHwCloudIA: TDBEdit;
    DBEditPesoNivelGiroMedioHwCloudIA: TDBEdit;
    DBEditPesoDemandaHwCloudIA: TDBEdit;
    DBEditGiroBaixaIniHwCloudIA: TDBEdit;
    DBEditGiroBaixoFimHwCloudIA: TDBEdit;
    DBEditGiroMedioIniHwCloudIA: TDBEdit;
    DBEditGiroMedioFimHwCloudIA: TDBEdit;
    DBEditPesoFrequenciaHwCloudIA: TDBEdit;
    DBEditPesoPrecoHwCloudIA: TDBEdit;
    DBEditGiroAltoIniHwCloudIA: TDBEdit;
    DBEditGiroAltoFimHwCloudIA: TDBEdit;
    DBComboBoxUtilRecomendacaoHwCloudIA: TDBComboBox;
    DBEditIntervTreinoRecomendaHwCloudIA: TDBEdit;
    DBEditDiasVndRecomendaHwCloudIA: TDBEdit;
    ConfiguraesSuzuki1: TMenuItem;
    Label65: TLabel;
    DBEditSemanaIniHwCloudIA: TDBEdit;
    Label66: TLabel;
    Label67: TLabel;
    DBEditSemanaFimHwCloudIA: TDBEdit;
    Label68: TLabel;
    Label69: TLabel;
    DBEditSabadoIniHwCloudIA: TDBEdit;
    DBEditSabadoFimHwCloudIA: TDBEdit;
    Label70: TLabel;
    DBEditNomeBotHwCloudIA: TDBEdit;
    Label71: TLabel;
    Label72: TLabel;
    DBComboBoxUsarAPICogHwCloudIA: TDBComboBox;
    Label74: TLabel;
    DBComboBoxAmbienteHwCloudIA: TDBComboBox;
    DBComboBoxTipoVendaPadraoREQTray: TDBComboBox;
    DBComboBoxTipoVendaPadraoREQNuvemshop: TDBComboBox;
    TabSheet4: TTabSheet;
    GroupBox18: TGroupBox;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    btCorPrimary: TSpeedButton;
    ColorDialog1: TColorDialog;
    btCorPrimaryContainer: TSpeedButton;
    btCorPrimaryFixed: TSpeedButton;
    btCorOnPrimary: TSpeedButton;
    Label81: TLabel;
    btCorSecondary: TSpeedButton;
    Label82: TLabel;
    btCorSecondaryContainer: TSpeedButton;
    Label83: TLabel;
    btCorTertiary: TSpeedButton;
    Label84: TLabel;
    btCorError: TSpeedButton;
    Label85: TLabel;
    btCorBackGround: TSpeedButton;
    Label86: TLabel;
    btCorSurfaceLowest: TSpeedButton;
    Label87: TLabel;
    ctCorSurfaceLow: TSpeedButton;
    TabSheet7: TTabSheet;
    GroupBox19: TGroupBox;
    Label88: TLabel;
    Label89: TLabel;
    DBEditLogoEmpHwCloudIA: TDBEdit;
    DBEditFaviconEmpresaHwCloudIA: TDBEdit;
    btCaminhoLogoEmpresa: TSpeedButton;
    btCaminhoFaviconEmpresa: TSpeedButton;
    OpenDialog1: TOpenDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    pnCorPrimaryHwCloudIA: TPanel;
    pnCorPrimaryContainerHwCloudIA: TPanel;
    pnCorPrimaryFixedHwCloudIA: TPanel;
    pnCorOnPrimaryHwCloudIA: TPanel;
    pnCorSecondaryHwCloudIA: TPanel;
    pnCorSecondaryContainerHwCloudIA: TPanel;
    pnCorTertiaryHwCloudIA: TPanel;
    pnCorErrorHwCloudIA: TPanel;
    pnCorBackGroundHwCloudIA: TPanel;
    pnCorSurfaceLowestHwCloudIA: TPanel;
    pnCorSurfaceLowHwCloudIA: TPanel;
    Label90: TLabel;
    DBEditModeloPadraoHwCloudIA: TDBEdit;
    Label91: TLabel;
    DBEditDiaMesFatMetaHwCloudIA: TDBEdit;
    Label92: TLabel;
    DBEditLimiteGastosMetaHwCloudIA: TDBEdit;
    TabSheet8: TTabSheet;
    GroupBox20: TGroupBox;
    Label73: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label93: TLabel;
    EditHwVendedorHwCloudIA: TEditHw;
    DBLookupComboBoxVendedorHwCloudIA: TDBLookupComboBox;
    DBComboBoxTipoVendaPadraoOSHwCloudIA: TDBComboBox;
    DBComboBoxTipoVendaPadraoREQHwCloudIA: TDBComboBox;
    EditHwTipoClienteHwCloudIA: TEditHw;
    DBLookupComboBoxTipoClienteHwCLoudIA: TDBLookupComboBox;
    Label94: TLabel;
    EditHwCondPagHwCloudIA: TEditHw;
    DBLookupComboBoxCondPagHwCloudIA: TDBLookupComboBox;
    TabSheet9: TTabSheet;
    GroupBox21: TGroupBox;
    TabSheet10: TTabSheet;
    GroupBox22: TGroupBox;
    Panel29: TPanel;
    Splitter6: TSplitter;
    Panel30: TPanel;
    TreeViewPromocaoHwCloudIA: TTreeView;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    TreeViewPromocaoHwCloudIA_DB: TTreeView;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    TabSheet11: TTabSheet;
    GroupBox23: TGroupBox;
    PageControl5: TPageControl;
    TabSheet12: TTabSheet;
    TabSheet13: TTabSheet;
    Panel38: TPanel;
    DBGridCollectionRagHwCloudIA: TDBGrid;
    BitBtn_Novo_Collection_Rag: TBitBtn;
    BitBtn_Excluir_Collection_Rag: TBitBtn;
    Label101: TLabel;
    Panel37: TPanel;
    BitBtn35: TBitBtn;
    BitBtn19: TBitBtn;
    DBEditCollectionRag: TDBEdit;
    Panel39: TPanel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    DBComboBoxDriveTypeHwCloudIA: TDBComboBox;
    DBComboBoxDriveCheckModif: TDBComboBox;
    DBComboBoxUtlAgenticRagHwCloudIA: TDBComboBox;
    DBEditPastaPadraoDriveHwCloudIA: TDBEdit;
    Panel40: TPanel;
    Label99: TLabel;
    DBMemoDriveCredentials: TDBMemo;
    PopupMenu3: TPopupMenu;
    tab_ce: TMenuItem;
    tab_ci: TMenuItem;
    procedure tab_ciClick(Sender: TObject);
    procedure tab_ceClick(Sender: TObject);
    procedure BitBtn_Excluir_Collection_RagClick(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn_Novo_Collection_RagClick(Sender: TObject);
    procedure TreeViewPromocaoHwCloudIA_DBDblClick(Sender: TObject);
    procedure TreeViewPromocaoHwCloudIADblClick(Sender: TObject);
    procedure DBLookupComboBoxCondPagHwCloudIAExit(Sender: TObject);
    procedure EditHwCondPagHwCloudIAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwCondPagHwCloudIAExit(Sender: TObject);
    procedure DBLookupComboBoxTipoClienteHwCLoudIAExit(Sender: TObject);
    procedure EditHwTipoClienteHwCloudIAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwTipoClienteHwCloudIAExit(Sender: TObject);
    procedure btCaminhoFaviconEmpresaClick(Sender: TObject);
    procedure btCaminhoLogoEmpresaClick(Sender: TObject);
    procedure ctCorSurfaceLowClick(Sender: TObject);
    procedure btCorSurfaceLowestClick(Sender: TObject);
    procedure btCorBackGroundClick(Sender: TObject);
    procedure btCorErrorClick(Sender: TObject);
    procedure btCorTertiaryClick(Sender: TObject);
    procedure btCorSecondaryContainerClick(Sender: TObject);
    procedure btCorSecondaryClick(Sender: TObject);
    procedure btCorOnPrimaryClick(Sender: TObject);
    procedure btCorPrimaryFixedClick(Sender: TObject);
    procedure btCorPrimaryContainerClick(Sender: TObject);
    procedure btCorPrimaryClick(Sender: TObject);
    procedure DBLookupComboBoxVendedorHwCloudIAExit(Sender: TObject);
    procedure EditHwVendedorHwCloudIAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwVendedorHwCloudIAExit(Sender: TObject);
    procedure DBEditSabadoFimHwCloudIAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditSabadoIniHwCloudIAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditSemanaFimHwCloudIAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditSemanaIniHwCloudIAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditSabadoFimHwCloudIAEnter(Sender: TObject);
    procedure DBEditSabadoIniHwCloudIAEnter(Sender: TObject);
    procedure DBEditSemanaFimHwCloudIAEnter(Sender: TObject);
    procedure DBEditSemanaIniHwCloudIAEnter(Sender: TObject);
    procedure DBComboBoxUsarAPICogHwCloudIAExit(Sender: TObject);
    procedure ConfiguraesSuzuki1Click(Sender: TObject);
    procedure ConfiguraesHwCloudIA1Click(Sender: TObject);
    procedure ConfiguraesPagOnline1Click(Sender: TObject);
    procedure ConfiguraesEnvioNotificaesdoFinanceiro1Click(Sender: TObject);
    procedure ConfiguraesAPIPlugBoletosBoletosBancrios1Click(Sender: TObject);
    procedure ConfiguraesAPIConfereConciliaodeCarto1Click(Sender: TObject);
    procedure ConfiguraesAPINummusCashback1Click(Sender: TObject);
    procedure ConfiguraesAPISmartbisFidelizao1Click(Sender: TObject);
    procedure ConfiguraesAPIComrcioAberto1Click(Sender: TObject);
    procedure ConfiguraesAPINuvemshopECommerce1Click(Sender: TObject);
    procedure ConfiguraesAPITrayECommerce1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure ComboBoxAmbienteSuzukiKeyPress(Sender: TObject; var Key: Char);
    procedure spPagOnlineClick(Sender: TObject);
    procedure spEnvioNotificacaoFinanceiroClick(Sender: TObject);
    procedure spAPInummusCashbackClick(Sender: TObject);
    procedure ComboBoxAmbientePlugKeyPress(Sender: TObject; var Key: Char);
    procedure spAPIplugBoletoClick(Sender: TObject);
    procedure TreeViewPromocaoNuvemshop_DBDblClick(Sender: TObject);
    procedure TreeViewPromocaoNuvemshopDblClick(Sender: TObject);
    procedure DBLookupComboBoxTabelaPrecoNuvemshopExit(Sender: TObject);
    procedure EditHwTabelaPrecoNuvemshopKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwTabelaPrecoNuvemshopExit(Sender: TObject);
    procedure spAPInuvemshopCommerceClick(Sender: TObject);
    procedure DBLookupComboBoxVendedorNuvemshopExit(Sender: TObject);
    procedure EditHwVendedorNuvemshopKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwVendedorNuvemshopExit(Sender: TObject);
    procedure DBLookupComboBoxTipoClienteNuvemshopExit(Sender: TObject);
    procedure EditHwTipoClienteNuvemshopKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwTipoClienteNuvemshopExit(Sender: TObject);
    procedure EditPortKentroKeyPress(Sender: TObject; var Key: Char);
    procedure EditQueuedIdKentroKeyPress(Sender: TObject; var Key: Char);
    procedure spAPIconfereConciliacaCartaoClick(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure DBEditWhatsppCAKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton14Click(Sender: TObject);
    procedure EditHwTabelaPrecoCAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBoxTabelaPrecoCAExit(Sender: TObject);
    procedure EditHwTabelaPrecoCAExit(Sender: TObject);
    procedure TreeViewPromocaoCADblClick(Sender: TObject);
    procedure TreeViewPromocaoCA_DBDblClick(Sender: TObject);
    procedure spAPIcomercioabertoClick(Sender: TObject);
    procedure spAPIsmartbisClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TreeViewPromocaoTray_DBDblClick(Sender: TObject);
    procedure TreeViewPromocaoTrayDblClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBLookupComboBoxVendedorTrayExit(Sender: TObject);
    procedure EditHwVendedorTrayKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwVendedorTrayExit(Sender: TObject);
    procedure EditHwTabelaPrecoTrayKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHwTipoClienteTrayKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBoxTipoClienteTrayExit(Sender: TObject);
    procedure EditHwTipoClienteTrayExit(Sender: TObject);
    procedure DBLookupComboBoxTabelaPrecoTrayExit(Sender: TObject);
    procedure EditHwTabelaPrecoTrayExit(Sender: TObject);
    procedure spAPItrayCommerceClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ColorToHtmlHex(AColor: TColor): string;
    function HexToTColor(sColor: string): TColor;
  end;

var
  frmCadConfigAPI: TfrmCadConfigAPI;
  vConfigAPI: TConfigAPI;

implementation

uses UDtmConfig, uDtmAtivo, DB, uDataSet_OOP, hw_win_utils, ShellAPI, uDadosIni, 
  funcoes;

{$R *.dfm}

procedure TfrmCadConfigAPI.BitBtn19Click(Sender: TObject);
begin
  inherited;
  if not vConfigAPI.vConfigAPIcollectionsRag.Post then
  begin
    setFocusCampoErro(vConfigAPI.vConfigAPIcollectionsRag.vNomeCampoErro, vConfigAPI.vConfigAPIcollectionsRag.vMensagemErro);
    Exit;
  end;

  PageControl5.ActivePage := TabSheet12;
  TabSheet12.Show;
end;

procedure TfrmCadConfigAPI.BitBtn1Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('API002', 'CONSULTA', '', 'CONFIG_API', '', vConfigAPI.buscas, true) then
    Exit;

  inherited;
  if MaskEdit2.Visible then
  begin
    if not vConfigAPI.ConsultaCampos(
    	'CONFIG_API',
    	ComboBox1.Text,
      ' CONFIG_API.API ',
      maskedit1.text,
      maskedit2.text,
      vDadosIni.codEmpresa,
      1,
      ' CONFIG_API.*, ' +
      ' CASE WHEN (CONFIG_API.API = ''TRAYCOMMERCE'') THEN ' +
      '        ''TRAY (E-COMMERCE)'' ' +
      '      WHEN (CONFIG_API.API = ''NUVEMSHOP'') THEN ' +
      '        ''NUVEMSHOP (E-COMMERCE)'' ' +
      '      WHEN (CONFIG_API.API = ''COMERCIOABERTO'') THEN ' +
      '        ''COMERCIO ABERTO (VENDAS INTERNET)'' ' +
      '      WHEN (CONFIG_API.API = ''PROGRAMAFIDELIDADE'') THEN ' +
      '        ''SMARTBIS (PROGRAMA DE FIDELIDADE)'' ' +
      '      WHEN (CONFIG_API.API = ''NUMMUSCASHBACK'') THEN ' +
      '         ''NUMMUS (CASCHBACK)'' ' +
      '      WHEN (CONFIG_API.API = ''CONFERE'') THEN ' +
      '        ''CONFERE (CONCILIACAO DE CARTOES)'' ' +
      '      WHEN (CONFIG_API.API = ''KENTRO'') THEN ' +
      '         ''KENTRO (GESTAO VIA MENSAGENS WHATSAPP)'' ' +
      '      WHEN (CONFIG_API.API = ''BOLETO_API'') THEN ' +
      '        ''TECNOSPEED PLUG BOLETO (EMISSAO DE BOLETOS)'' ' +
      '			 WHEN (CONFIG_API.API = ''HWCLOUD_IA'') THEN ' +
      '				 ''HW CLOUD IA (INTEGRADOR)'' ' +
      '			 WHEN (CONFIG_API.API = ''SUZUKI'') THEN ' +
      '				 ''SUZUKI (CONEXÃO SUZUKI)'' ' +
      '      ELSE ' +
      '        CONFIG_API.API ' +
      ' END API_DESCR ',
      '',
      '') then
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          combobox1.setfocus;
  end
  else if not vConfigAPI.ConsultaCampos(
  	'CONFIG_API',
    MaskEdit3.text,
    ComboBox1.Text,
    combobox3.Text,
    ' CONFIG_API.API ',
    true,
    vDadosIni.codEmpresa,
    ' CONFIG_API.*, ' +
    ' CASE WHEN (CONFIG_API.API = ''TRAYCOMMERCE'') THEN ' +
    '        ''TRAY (E-COMMERCE)'' ' +
    '      WHEN (CONFIG_API.API = ''NUVEMSHOP'') THEN ' +
    '        ''NUVEMSHOP (E-COMMERCE)'' ' +
    '      WHEN (CONFIG_API.API = ''COMERCIOABERTO'') THEN ' +
    '        ''COMERCIO ABERTO (VENDAS INTERNET)'' ' +
    '      WHEN (CONFIG_API.API = ''PROGRAMAFIDELIDADE'') THEN ' +
    '        ''SMARTBIS (PROGRAMA DE FIDELIDADE)'' ' +
    '      WHEN (CONFIG_API.API = ''NUMMUSCASHBACK'') THEN ' +
    '         ''NUMMUS (CASCHBACK)'' ' +
    '      WHEN (CONFIG_API.API = ''CONFERE'') THEN ' +
    '        ''CONFERE (CONCILIACAO DE CARTOES)'' ' +
    '      WHEN (CONFIG_API.API = ''KENTRO'') THEN ' +
    '         ''KENTRO (GESTAO VIA MENSAGENS WHATSAPP)'' ' +
    '      WHEN (CONFIG_API.API = ''BOLETO_API'') THEN ' +
    '        ''TECNOSPEED PLUG BOLETO (EMISSAO DE BOLETOS)'' ' +
    '			 WHEN (CONFIG_API.API = ''HWCLOUD_IA'') THEN ' +
    '				 ''HW CLOUD IA (INTEGRADOR)'' ' +
    '			 WHEN (CONFIG_API.API = ''SUZUKI'') THEN ' +
    '				 ''SUZUKI (CONEXÃO SUZUKI)'' ' +
  	'      ELSE ' +
    '        CONFIG_API.API ' +
    ' END API_DESCR ',
    '',
    '') then
      if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        ComboBox1.SetFocus;

  SpeedButton1.Visible := true;
  SpeedButton2.Visible := true;
  SpeedButton6.Visible := vDadosIni.retornaDadosHwCloudIA(vConfigAPI.buscas) <> '';
  SpeedButton8.Visible := vDadosIni.retornaDadosHwCloudIA(vConfigAPI.buscas) <> '';
  SpeedButton7.Visible := vDadosIni.retornaDadosHwCloudIA(vConfigAPI.buscas) <> '';

  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
  	DBGrid1.SetFocus;
end;

procedure TfrmCadConfigAPI.BitBtn35Click(Sender: TObject);
begin
  inherited;
  vConfigAPI.vConfigAPIcollectionsRag.Cancel;

  PageControl5.ActivePage := TabSheet12;
  TabSheet12.Show;
end;

procedure TfrmCadConfigAPI.BitBtn3Click(Sender: TObject);
var
  I: Integer;
begin
  Screen.Cursor := crHourGlass;
	try
    if not vConfigAPI.Insert then
    begin
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      Exit;
    end;

    inherited;
    LabelSeq.Visible := false;
    CheckCadSeq.Visible := false;
    CheckCadSeq.Checked := false;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;

    EditHwTabelaPrecoTray.AsValue := 0;
    EditHwTipoClienteTray.AsValue := 0;
    EditHwVendedorTray.AsValue := 0;
    EditHwTabelaPrecoCA.AsValue := 0;
    EditHwTabelaPrecoNuvemshop.AsValue := 0;
    EditHwTipoClienteNuvemshop.AsValue := 0;
    EditHwVendedorNuvemshop.AsValue := 0;
    EditHwCondPagHwCloudIA.AsValue := 0;
    EditHwTipoClienteHwCloudIA.AsValue := 0;
    EditHwVendedorHwCloudIA.AsValue := 0;

    DBLookupComboBoxTabelaPrecoTray.KeyValue := 0;
    DBLookupComboBoxTipoClienteTray.KeyValue := 0;
    DBLookupComboBoxVendedorTray.KeyValue := 0;
    DBLookupComboBoxTabelaPrecoCA.KeyValue := 0;
    DBLookupComboBoxTipoClienteNuvemshop.KeyValue := 0;
    DBLookupComboBoxVendedorNuvemshop.KeyValue := 0;
    DBLookupComboBoxCondPagHwCloudIA.KeyValue := 0;
    DBLookupComboBoxTipoClienteHwCLoudIA.KeyValue := 0;
    DBLookupComboBoxVendedorHwCloudIA.KeyValue := 0;
    
    EditUrlKentro.Text      := '';
    EditPasswordKentro.Text := '';
    EditQueuedIdKentro.Text := '';

    if (vConfigAPI.dataSet.State = dsInsert) then
    begin
      if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'TRAYCOMMERCE' then
      begin
        vConfigAPI.montarTreeViewPromocaoDB('E', TreeViewPromocaoTray, TreeViewPromocaoTray_DB);
        vConfigAPI.montarTipoREQ(DBComboBoxTipoVendaPadraoREQTray);

        PageControl2.ActivePage := TabSheetTrayEC;
        TabSheetTrayEC.Show;

        if trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxTipoVendaPadraoREQTray.Items.Count - 1 do
            if Copy(trim(DBComboBoxTipoVendaPadraoREQTray.Items[I]), 1, 1) = trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) then
            begin
              DBComboBoxTipoVendaPadraoREQTray.ItemIndex := I;
              Break;
            end;
        end;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'NUVEMSHOP' then
      begin
		  vConfigAPI.montarTreeViewPromocaoDB('E', TreeViewPromocaoNuvemshop, TreeViewPromocaoNuvemshop_DB);
        vConfigAPI.montarTipoREQ(DBComboBoxTipoVendaPadraoREQNuvemshop);

        PageControl2.ActivePage := TabSheetNuvemshopEC;
        TabSheetNuvemshopEC.Show;

        if trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxTipoVendaPadraoREQNuvemshop.Items.Count - 1 do
            if Copy(trim(DBComboBoxTipoVendaPadraoREQNuvemshop.Items[I]), 1, 1) = trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) then
            begin
              DBComboBoxTipoVendaPadraoREQNuvemshop.ItemIndex := I;
              Break;
            end;
        end;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'COMERCIOABERTO' then
      begin
        vConfigAPI.montarTreeViewPromocaoDB('C', TreeViewPromocaoCA, TreeViewPromocaoCA_DB);

        PageControl2.ActivePage := TabSheetCA;
        TabSheetCA.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'PROGRAMAFIDELIDADE' then
      begin
        PageControl2.ActivePage := TabSheetSmartbis;
        TabSheetSmartbis.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'NUMMUSCASHBACK' then
      begin
        EditUrlNummus.Text      := vDadosIni.IfThen(trim(vConfigAPI.dataSet.FieldByName('URL_API').AsString) <> '',
        	vDadosIni.getCampoPipe(vConfigAPI.dataSet.FieldByName('URL_API').AsString, 1), '');
        EditApiKeyNummus.Text := vDadosIni.IfThen(trim(vConfigAPI.dataSet.FieldByName('URL_API').AsString) <> '',
        	vDadosIni.getCampoPipe(vConfigAPI.dataSet.FieldByName('URL_API').AsString, 2), '');
        EditClientIdNummus.Text := vDadosIni.IfThen(trim(vConfigAPI.dataSet.FieldByName('URL_API').AsString) <> '',
        	vDadosIni.getCampoPipe(vConfigAPI.dataSet.FieldByName('URL_API').AsString, 3), '');

        PageControl2.ActivePage := TabSheetNummus;
        TabSheetNummus.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'CONFERE' then
      begin
      	PageControl2.ActivePage := TabSheetConcCartao;
        TabSheetConcCartao.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'KENTRO' then
      begin
        PageControl2.ActivePage := TabSheetKentro;
        TabSheetKentro.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'BOLETO_API' then
      begin
        ComboBoxAmbientePlug.ItemIndex := 1;
        ComboBoxAmbientePlug.Text := ComboBoxAmbientePlug.Items[ComboBoxAmbientePlug.ItemIndex];

        PageControl2.ActivePage := TabSheetPlugBoleto;
        TabSheetPlugBoleto.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'SUZUKI' then
      begin
        ComboBoxAmbienteSuzuki.ItemIndex := 1;
        ComboBoxAmbienteSuzuki.Text := ComboBoxAmbienteSuzuki.Items[ComboBoxAmbienteSuzuki.ItemIndex];

        PageControl2.ActivePage := TabSheetSuzuki;
        TabSheetSuzuki.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'HWCLOUD_IA' then
      begin
        vConfigAPI.montarTreeViewPromocaoDB('H', TreeViewPromocaoHwCloudIA, TreeViewPromocaoHwCloudIA_DB);
        vConfigAPI.montarAmbiente(DBComboBoxAmbienteHwCloudIA, '');
        vConfigAPI.montarTipoREQ(DBComboBoxTipoVendaPadraoREQHwCloudIA);
		  vConfigAPI.montarTipoOS(DBComboBoxTipoVendaPadraoOSHwCloudIA);

        Label71.Visible := vConfigAPI.dataSet.FieldByName('USAR_API_COG').AsString = 'S';
        DBEditNomeBotHwCloudIA.Visible := vConfigAPI.dataSet.FieldByName('USAR_API_COG').AsString = 'S';

        if vConfigAPI.dataSet.FieldByName('USAR_API_COG').AsString = 'N' then
        	 DBComboBoxUsarAPICogHwCloudIA.ItemIndex := 1
        else
        	 DBComboBoxUsarAPICogHwCloudIA.ItemIndex := 0;

        if vConfigAPI.dataSet.FieldByName('UTIL_RECOMENDACAO').AsString = 'N' then
        	 DBComboBoxUtilRecomendacaoHwCloudIA.ItemIndex := 1
        else
        	 DBComboBoxUtilRecomendacaoHwCloudIA.ItemIndex := 0;

        if trim(vConfigAPI.dataSet.FieldByName('AMBIENTE_API').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxAmbienteHwCloudIA.Items.Count - 1 do
            if trim(DBComboBoxAmbienteHwCloudIA.Items[I]) = trim(vConfigAPI.dataSet.FieldByName('AMBIENTE_API').AsString) then
            begin
              DBComboBoxAmbienteHwCloudIA.ItemIndex := I;
              Break;
            end;
        end;

        if trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxTipoVendaPadraoREQHwCloudIA.Items.Count - 1 do
            if Copy(trim(DBComboBoxTipoVendaPadraoREQHwCloudIA.Items[I]), 1, 1) = trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) then
            begin
              DBComboBoxTipoVendaPadraoREQHwCloudIA.ItemIndex := I;
              Break;
            end;
        end;

        if trim(vConfigAPI.dataSet.FieldByName('TIPO_OS').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxTipoVendaPadraoOSHwCloudIA.Items.Count - 1 do
            if trim(DBComboBoxTipoVendaPadraoOSHwCloudIA.Items[I]) = trim(vConfigAPI.dataSet.FieldByName('TIPO_OS').AsString) then
            begin
              DBComboBoxTipoVendaPadraoOSHwCloudIA.ItemIndex := I;
              Break;
            end;
        end;

        if trim(vConfigAPI.dataSet.FieldByName('DRIVE_TYPE').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxDriveTypeHwCloudIA.Items.Count - 1 do
            if trim(DBComboBoxDriveTypeHwCloudIA.Items[I]) = trim(vConfigAPI.dataSet.FieldByName('DRIVE_TYPE').AsString) then
            begin
              DBComboBoxDriveTypeHwCloudIA.ItemIndex := I;
              Break;
            end;
        end;

        if trim(vConfigAPI.dataSet.FieldByName('DRIVE_CHECK_MODIF').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxDriveCheckModif.Items.Count - 1 do
            if Copy(trim(DBComboBoxDriveCheckModif.Items[I]), 1, 1) = trim(vConfigAPI.dataSet.FieldByName('DRIVE_CHECK_MODIF').AsString) then
            begin
              DBComboBoxDriveCheckModif.ItemIndex := I;
              Break;
            end;
        end;

        if trim(vConfigAPI.dataSet.FieldByName('UTIL_AGENTIC_RAG').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxUtlAgenticRagHwCloudIA.Items.Count - 1 do
            if Copy(trim(DBComboBoxUtlAgenticRagHwCloudIA.Items[I]), 1, 1) = trim(vConfigAPI.dataSet.FieldByName('UTIL_AGENTIC_RAG').AsString) then
            begin
              DBComboBoxUtlAgenticRagHwCloudIA.ItemIndex := I;
              Break;
            end;
        end;

        pnCorPrimaryHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_PRIMARY').AsString);
        pnCorPrimaryContainerHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_PRIMARY_CONTAINER').AsString);
        pnCorPrimaryFixedHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_PRIMARY_FIXED').AsString);
        pnCorOnPrimaryHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_ON_PRIMARY').AsString);
        pnCorSecondaryHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_SECONDARY').AsString);
        pnCorSecondaryContainerHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_SECONDARY_CONTAINER').AsString);
        pnCorTertiaryHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_TERTIARY').AsString);
        pnCorErrorHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_ERROR').AsString);
        pnCorBackGroundHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_BACKGROUND').AsString);
        pnCorSurfaceLowestHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_SURFACE_LOWEST').AsString);
        pnCorSurfaceLowHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_SURFACE_LOW').AsString);

        PageControl5.ActivePage := TabSheet12;
        TabSheet12.Show;

        PageControl4.ActivePage := TabSheet5;
        TabSheet5.Show;

        PageControl2.ActivePage := TabSheetHwCloudIA;
        TabSheetHwCloudIA.Show;
      end;
    end
    else if (vConfigAPI.dataSet.State = dsEdit) then
    begin
    	if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'TRAYCOMMERCE' then
      begin
        vConfigAPI.montarTreeViewPromocaoDB('E', TreeViewPromocaoTray, TreeViewPromocaoTray_DB);
        vConfigAPI.montarTipoREQ(DBComboBoxTipoVendaPadraoREQTray);

        EditHwTabelaPrecoTray.AsValue            := vConfigAPI.dataSet.FieldByName('COD_TAB_PRECO').AsInteger;
        EditHwTipoClienteTray.AsValue            := vConfigAPI.dataSet.FieldByName('COD_TIP_CLIENTE').AsInteger;
        EditHwVendedorTray.AsValue               := vConfigAPI.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
        DBLookupComboBoxTabelaPrecoTray.KeyValue := EditHwTabelaPrecoTray.AsInteger;
        DBLookupComboBoxTipoClienteTray.KeyValue := EditHwTipoClienteTray.AsInteger;
        DBLookupComboBoxVendedorTray.KeyValue    := EditHwVendedorTray.AsInteger;

        PageControl2.ActivePage := TabSheetTrayEC;
        TabSheetTrayEC.Show;

        if trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxTipoVendaPadraoREQTray.Items.Count - 1 do
            if Copy(trim(DBComboBoxTipoVendaPadraoREQTray.Items[I]), 1, 1) = trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) then
            begin
              DBComboBoxTipoVendaPadraoREQTray.ItemIndex := I;
              Break;
            end;
        end;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'NUVEMSHOP' then
      begin
        vConfigAPI.montarTreeViewPromocaoDB('E', TreeViewPromocaoNuvemshop, TreeViewPromocaoNuvemshop_DB);
        vConfigAPI.montarTipoREQ(DBComboBoxTipoVendaPadraoREQNuvemshop);

        EditHwTabelaPrecoNuvemshop.AsValue := vConfigAPI.dataSet.FieldByName('COD_TAB_PRECO').AsInteger;
        EditHwTipoClienteNuvemshop.AsValue := vConfigAPI.dataSet.FieldByName('COD_TIP_CLIENTE').AsInteger;
        EditHwVendedorNuvemshop.AsValue := vConfigAPI.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
        DBLookupComboBoxTabelaPrecoNuvemshop.KeyValue := EditHwTabelaPrecoNuvemshop.AsInteger;
        DBLookupComboBoxTipoClienteNuvemshop.KeyValue := EditHwTipoClienteNuvemshop.AsInteger;
        DBLookupComboBoxVendedorNuvemshop.KeyValue := EditHwVendedorNuvemshop.AsInteger;

        PageControl2.ActivePage := TabSheetNuvemshopEC;
        TabSheetNuvemshopEC.Show;

        if trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxTipoVendaPadraoREQNuvemshop.Items.Count - 1 do
            if Copy(trim(DBComboBoxTipoVendaPadraoREQNuvemshop.Items[I]), 1, 1) = trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) then
            begin
              DBComboBoxTipoVendaPadraoREQNuvemshop.ItemIndex := I;
              Break;
            end;
        end;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'COMERCIOABERTO' then
      begin
        vConfigAPI.montarTreeViewPromocaoDB('C', TreeViewPromocaoCA, TreeViewPromocaoCA_DB);

        PageControl2.ActivePage := TabSheetCA;
        TabSheetCA.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'PROGRAMAFIDELIDADE' then
      begin
        PageControl2.ActivePage := TabSheetSmartbis;
        TabSheetSmartbis.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'NUMMUSCASHBACK' then
      begin
        EditUrlNummus.Text      := vDadosIni.IfThen(trim(vConfigAPI.dataSet.FieldByName('URL_API').AsString) <> '',
        	vDadosIni.getCampoPipe(vConfigAPI.dataSet.FieldByName('URL_API').AsString, 1), '');
        EditApiKeyNummus.Text := vDadosIni.IfThen(trim(vConfigAPI.dataSet.FieldByName('URL_API').AsString) <> '',
        	vDadosIni.getCampoPipe(vConfigAPI.dataSet.FieldByName('URL_API').AsString, 2), '');
        EditClientIdNummus.Text := vDadosIni.IfThen(trim(vConfigAPI.dataSet.FieldByName('URL_API').AsString) <> '',
        	vDadosIni.getCampoPipe(vConfigAPI.dataSet.FieldByName('URL_API').AsString, 3), '');

        PageControl2.ActivePage := TabSheetNummus;
        TabSheetNummus.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'CONFERE' then
      begin
      	PageControl2.ActivePage := TabSheetConcCartao;
        TabSheetConcCartao.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'KENTRO' then
      begin
        EditUrlKentro.Text      := vDadosIni.IfThen(trim(vConfigAPI.dataSet.FieldByName('URL_API').AsString) <> '',
        	vDadosIni.getCampoPipe(vConfigAPI.dataSet.FieldByName('URL_API').AsString, 1), '');
        EditPasswordKentro.Text := vDadosIni.IfThen(trim(vConfigAPI.dataSet.FieldByName('URL_API').AsString) <> '',
        	vDadosIni.getCampoPipe(vConfigAPI.dataSet.FieldByName('URL_API').AsString, 2), '');
        EditQueuedIdKentro.Text := vDadosIni.IfThen(trim(vConfigAPI.dataSet.FieldByName('URL_API').AsString) <> '',
        	vDadosIni.getCampoPipe(vConfigAPI.dataSet.FieldByName('URL_API').AsString, 3), '');

        PageControl2.ActivePage := TabSheetKentro;
        TabSheetKentro.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'BOLETO_API' then
      begin
      	if vConfigAPI.vUserIdOld = '' then
        	ComboBoxAmbientePlug.ItemIndex := 1
      	else if vConfigAPI.vUserIdOld <> vConfigAPI.vUserId then
        	ComboBoxAmbientePlug.ItemIndex := 1
        else
        	ComboBoxAmbientePlug.ItemIndex := 0;
        ComboBoxAmbientePlug.Text := ComboBoxAmbientePlug.Items[ComboBoxAmbientePlug.ItemIndex];

        PageControl2.ActivePage := TabSheetPlugBoleto;
        TabSheetPlugBoleto.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'SUZUKI' then
      begin
        if vConfigAPI.vUserIdOld = '' then
        	ComboBoxAmbienteSuzuki.ItemIndex := 1
      	else if vConfigAPI.vUserIdOld <> vConfigAPI.vUserId then
        	ComboBoxAmbienteSuzuki.ItemIndex := 1
        else
        	ComboBoxAmbienteSuzuki.ItemIndex := 0;
        ComboBoxAmbienteSuzuki.Text := ComboBoxAmbienteSuzuki.Items[ComboBoxAmbienteSuzuki.ItemIndex];

      	PageControl2.ActivePage := TabSheetSuzuki;
        TabSheetSuzuki.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'HWCLOUD_IA' then
      begin
        vConfigAPI.montarTreeViewPromocaoDB('H', TreeViewPromocaoHwCloudIA, TreeViewPromocaoHwCloudIA_DB);		
        vConfigAPI.montarAmbiente(DBComboBoxAmbienteHwCloudIA, vConfigAPI.dataSet.FieldByName('AMBIENTE_API').AsString);
        vConfigAPI.montarTipoREQ(DBComboBoxTipoVendaPadraoREQHwCloudIA);
        vConfigAPI.montarTipoOS(DBComboBoxTipoVendaPadraoOSHwCloudIA);

        Label71.Visible := vConfigAPI.dataSet.FieldByName('USAR_API_COG').AsString = 'S';
        DBEditNomeBotHwCloudIA.Visible := vConfigAPI.dataSet.FieldByName('USAR_API_COG').AsString = 'S';

        EditHwCondPagHwCloudIA.AsValue := vConfigAPI.dataSet.FieldByName('COD_COND_PAG').AsInteger;
        EditHwTipoClienteHwCloudIA.AsValue := vConfigAPI.dataSet.FieldByName('COD_TIP_CLIENTE').AsInteger;
        EditHwVendedorHwCloudIA.AsValue := vConfigAPI.dataSet.FieldByName('COD_VENDEDOR').AsInteger;

        DBLookupComboBoxCondPagHwCloudIA.KeyValue := EditHwCondPagHwCloudIA.AsInteger;
        DBLookupComboBoxTipoClienteHwCLoudIA.KeyValue := EditHwTipoClienteHwCloudIA.AsInteger;
		  DBLookupComboBoxVendedorHwCloudIA.KeyValue := EditHwVendedorHwCloudIA.AsInteger;

        if vConfigAPI.dataSet.FieldByName('USAR_API_COG').AsString = 'N' then
        	 DBComboBoxUsarAPICogHwCloudIA.ItemIndex := 1
        else
        	 DBComboBoxUsarAPICogHwCloudIA.ItemIndex := 0;

        if vConfigAPI.dataSet.FieldByName('UTIL_RECOMENDACAO').AsString = 'N' then
        	 DBComboBoxUtilRecomendacaoHwCloudIA.ItemIndex := 1
        else
        	 DBComboBoxUtilRecomendacaoHwCloudIA.ItemIndex := 0;

        if trim(vConfigAPI.dataSet.FieldByName('AMBIENTE_API').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxAmbienteHwCloudIA.Items.Count - 1 do
            if trim(DBComboBoxAmbienteHwCloudIA.Items[I]) = trim(vConfigAPI.dataSet.FieldByName('AMBIENTE_API').AsString) then
            begin
              DBComboBoxAmbienteHwCloudIA.ItemIndex := I;
              Break;
            end;
        end;

        if trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxTipoVendaPadraoREQHwCloudIA.Items.Count - 1 do
            if Copy(trim(DBComboBoxTipoVendaPadraoREQHwCloudIA.Items[I]), 1, 1) = trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) then
            begin
              DBComboBoxTipoVendaPadraoREQHwCloudIA.ItemIndex := I;
              Break;
            end;
        end;

        if trim(vConfigAPI.dataSet.FieldByName('TIPO_OS').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxTipoVendaPadraoOSHwCloudIA.Items.Count - 1 do
            if trim(DBComboBoxTipoVendaPadraoOSHwCloudIA.Items[I]) = trim(vConfigAPI.dataSet.FieldByName('TIPO_OS').AsString) then
            begin
              DBComboBoxTipoVendaPadraoOSHwCloudIA.ItemIndex := I;
              Break;
            end;
        end;

        if trim(vConfigAPI.dataSet.FieldByName('DRIVE_TYPE').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxDriveTypeHwCloudIA.Items.Count - 1 do
            if trim(DBComboBoxDriveTypeHwCloudIA.Items[I]) = trim(vConfigAPI.dataSet.FieldByName('DRIVE_TYPE').AsString) then
            begin
              DBComboBoxDriveTypeHwCloudIA.ItemIndex := I;
              Break;
            end;
        end;

        if trim(vConfigAPI.dataSet.FieldByName('DRIVE_CHECK_MODIF').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxDriveCheckModif.Items.Count - 1 do
            if Copy(trim(DBComboBoxDriveCheckModif.Items[I]), 1, 1) = trim(vConfigAPI.dataSet.FieldByName('DRIVE_CHECK_MODIF').AsString) then
            begin
              DBComboBoxDriveCheckModif.ItemIndex := I;
              Break;
            end;
        end;

        if trim(vConfigAPI.dataSet.FieldByName('UTIL_AGENTIC_RAG').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxUtlAgenticRagHwCloudIA.Items.Count - 1 do
            if Copy(trim(DBComboBoxUtlAgenticRagHwCloudIA.Items[I]), 1, 1) = trim(vConfigAPI.dataSet.FieldByName('UTIL_AGENTIC_RAG').AsString) then
            begin
              DBComboBoxUtlAgenticRagHwCloudIA.ItemIndex := I;
              Break;
            end;
        end;

        pnCorPrimaryHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_PRIMARY').AsString);
        pnCorPrimaryContainerHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_PRIMARY_CONTAINER').AsString);
        pnCorPrimaryFixedHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_PRIMARY_FIXED').AsString);
        pnCorOnPrimaryHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_ON_PRIMARY').AsString);
        pnCorSecondaryHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_SECONDARY').AsString);
        pnCorSecondaryContainerHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_SECONDARY_CONTAINER').AsString);
        pnCorTertiaryHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_TERTIARY').AsString);
        pnCorErrorHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_ERROR').AsString);
        pnCorBackGroundHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_BACKGROUND').AsString);
        pnCorSurfaceLowestHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_SURFACE_LOWEST').AsString);
        pnCorSurfaceLowHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_SURFACE_LOW').AsString);

        PageControl5.ActivePage := TabSheet12;
        TabSheet12.Show;

        PageControl4.ActivePage := TabSheet5;
        TabSheet5.Show;

        PageControl2.ActivePage := TabSheetHwCloudIA;
        TabSheetHwCloudIA.Show;
      end;
    end;

    if (Self.Enabled) and (Self.Visible) and (DBEditUrlTray.CanFocus) then
      DBEditUrlTray.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEditUrlNuvemshop.CanFocus) then
    	DBEditUrlNuvemshop.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEditIdentificacaoCA.CanFocus) then
    	DBEditIdentificacaoCA.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEditUrlSmartbis.CanFocus) then
      DBEditUrlSmartbis.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (EditUrlNummus.CanFocus) then
    	EditUrlNummus.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEditUrlConfere.CanFocus) then
    	DBEditUrlConfere.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (EditUrlKentro.CanFocus) then
    	EditUrlKentro.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEditTokenPlug.CanFocus) then
    	DBEditTokenPlug.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEditUsuarioSuzuki.CanFocus) then
      DBEditUsuarioSuzuki.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEditUrlHwCloudIA.CanFocus) then
    	DBEditUrlHwCloudIA.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigAPI.BitBtn4Click(Sender: TObject);
begin
  vConfigAPI.vcodcondpag     := 0;
  vConfigAPI.vcodvendedor    := 0;
  vConfigAPI.vcodtipocliente := 0;
  vConfigAPI.vcodtabela      := 0;
  vConfigAPI.vUrlNummus      := '';
  vConfigAPI.vApiKeyNummus   := '';
  vConfigAPI.vClientIdNummus := '';
  vConfigAPI.vUrlKentro      := '';
  vConfigAPI.vPasswordKentro := '';
  vConfigAPI.vQueuedIdKentro := '';
  if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'TRAYCOMMERCE' then
  begin
  	 vConfigAPI.vcodtabela      := Trunc(EditHwTabelaPrecoTray.AsValue);
    vConfigAPI.vcodtipocliente := Trunc(EditHwTipoClienteTray.AsValue);
    vConfigAPI.vcodvendedor    := Trunc(EditHwVendedorTray.AsValue);
  end
  else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'NUVEMSHOP' then
  begin
  	 vConfigAPI.vcodvendedor := Trunc(EditHwVendedorNuvemshop.AsValue);
  	 vConfigAPI.vcodtipocliente := Trunc(EditHwTipoClienteNuvemshop.AsValue);
    vConfigAPI.vcodtabela := Trunc(EditHwTabelaPrecoNuvemshop.AsValue)
  end
  else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'COMERCIOABERTO' then
  	 vConfigAPI.vcodtabela := Trunc(EditHwTabelaPrecoCA.AsValue)
  else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'NUMMUSCASHBACK' then
  begin
    vConfigAPI.vUrlNummus      := trim(EditUrlNummus.Text);
    vConfigAPI.vApiKeyNummus   := trim(EditApiKeyNummus.Text);
    vConfigAPI.vClientIdNummus := trim(EditClientIdNummus.Text);
  end
  else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'KENTRO' then
  begin
  	 vConfigAPI.vUrlKentro      := trim(EditUrlKentro.Text);
  	 vConfigAPI.vPasswordKentro := trim(EditPasswordKentro.Text);
    vConfigAPI.vQueuedIdKentro := trim(EditQueuedIdKentro.Text);
  end
  else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'BOLETO_API' then
  begin
  	if ComboBoxAmbientePlug.ItemIndex = 0 then
	  	vConfigAPI.vAmbiente := 'Produção'
    else
    	vConfigAPI.vAmbiente := 'Homologação';
  end
  else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'SUZUKI' then
  begin
    if ComboBoxAmbienteSuzuki.ItemIndex = 0 then
	  	vConfigAPI.vAmbiente := 'Produção'
    else
    	vConfigAPI.vAmbiente := 'Homologação';
  end
  else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'HWCLOUD_IA' then
  begin
    vConfigAPI.vcodcondpag := Trunc(EditHwCondPagHwCloudIA.AsValue);
    vConfigAPI.vcodtipocliente := Trunc(EditHwTipoClienteHwCloudIA.AsValue);
    vConfigAPI.vcodvendedor := Trunc(EditHwVendedorHwCloudIA.AsValue);
  end;

  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;

  if not vConfigAPI.post then
  begin
    PageControl3.ActivePage := tsCadastro;
    setFocusCampoErro(vConfigAPI.vNomeCampoErro, vConfigAPI.vMensagemErro);
  end
  else
  begin
    if TelaCadastro = 1 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    inherited;
  end;
end;

procedure TfrmCadConfigAPI.BitBtn5Click(Sender: TObject);
begin
  inherited;
  vConfigAPI.Cancel;
  vConfigAPI.RollBackTransacao;
end;

procedure TfrmCadConfigAPI.BitBtn7Click(Sender: TObject);
begin
  TForm(pnOpcoesAPI.Parent).ModalResult := IDOK;
end;

procedure TfrmCadConfigAPI.BitBtn8Click(Sender: TObject);
begin
  TForm(pnOpcoesAPI.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadConfigAPI.BitBtn_Excluir_Collection_RagClick(Sender: TObject);
begin
  inherited;
  if not vConfigAPI.vConfigAPIcollectionsRag.Delete then
    Exit;
end;

procedure TfrmCadConfigAPI.BitBtn_Novo_Collection_RagClick(Sender: TObject);
begin
  inherited;
  PageControl5.ActivePage := TabSheet13;
  TabSheet13.Show;

  vConfigAPI.vConfigAPIcollectionsRag.Insert;

  if (Self.Enabled) and (Self.Visible) and (DBEditCollectionRag.CanFocus) then
    DBEditCollectionRag.SetFocus;
end;

procedure TfrmCadConfigAPI.btCaminhoFaviconEmpresaClick(Sender: TObject);
begin
  inherited;
  OpenDialog1.Filter := 'Icon Files (*.ico)|*.ico|All Files (*.*)|*.*';
  OpenDialog1.FilterIndex := 1; // Select Icon filter by default
  OpenDialog1.DefaultExt := 'ico';

  if (vConfigAPI.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (OpenDialog1.Execute) then
    	vConfigAPI.dataSet.FieldByName('CAMINHO_FAVICON_EMP').AsString := OpenDialog1.FileName
    else
    	vConfigAPI.dataSet.FieldByName('CAMINHO_FAVICON_EMP').Value := Null;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBEditFaviconEmpresaHwCloudIA.CanFocus) then
	  DBEditFaviconEmpresaHwCloudIA.SetFocus;
end;

procedure TfrmCadConfigAPI.btCaminhoLogoEmpresaClick(Sender: TObject);
begin
  inherited;
  OpenDialog1.Filter := 'PNG Images (*.png)|*.png|All Files (*.*)|*.*';
  OpenDialog1.FilterIndex := 1; // Default to PNG filter
  OpenDialog1.DefaultExt := 'png';

  if (vConfigAPI.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (OpenDialog1.Execute) then
      vConfigAPI.dataSet.FieldByName('CAMINHO_LOGO_EMP').AsString := OpenDialog1.FileName
    else
    	vConfigAPI.dataSet.FieldByName('CAMINHO_LOGO_EMP').Value := Null;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBEditLogoEmpHwCloudIA.CanFocus) then
	  DBEditLogoEmpHwCloudIA.SetFocus;
end;

procedure TfrmCadConfigAPI.btCorBackGroundClick(Sender: TObject);
begin
  ColorDialog1.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_BACKGROUND').AsString);
  if ColorDialog1.Execute then
  begin
    vConfigAPI.dataSet.FieldByName('COR_BACKGROUND').AsString := ColorToHtmlHex(ColorDialog1.Color);
    pnCorBackGroundHwCloudIA.Color := ColorDialog1.Color;
  end;
end;

procedure TfrmCadConfigAPI.btCorPrimaryFixedClick(Sender: TObject);
begin
  ColorDialog1.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_PRIMARY_FIXED').AsString);
  if ColorDialog1.Execute then
  begin
    vConfigAPI.dataSet.FieldByName('COR_PRIMARY_FIXED').AsString := ColorToHtmlHex(ColorDialog1.Color);
  	 pnCorPrimaryFixedHwCloudIA.Color := ColorDialog1.Color;
  end;
end;

procedure TfrmCadConfigAPI.btCorErrorClick(Sender: TObject);
begin
  ColorDialog1.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_ERROR').AsString);
  if ColorDialog1.Execute then
  begin
    vConfigAPI.dataSet.FieldByName('COR_ERROR').AsString := ColorToHtmlHex(ColorDialog1.Color);
    pnCorErrorHwCloudIA.Color := ColorDialog1.Color;
  end;
end;

procedure TfrmCadConfigAPI.btCorOnPrimaryClick(Sender: TObject);
begin
  ColorDialog1.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_ON_PRIMARY').AsString);
  if ColorDialog1.Execute then
  begin
    vConfigAPI.dataSet.FieldByName('COR_ON_PRIMARY').AsString := ColorToHtmlHex(ColorDialog1.Color);
  	 pnCorOnPrimaryHwCloudIA.Color := ColorDialog1.Color;
  end;
end;

procedure TfrmCadConfigAPI.btCorPrimaryClick(Sender: TObject);
begin
  ColorDialog1.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_PRIMARY').AsString);
  if ColorDialog1.Execute then
  begin
    vConfigAPI.dataSet.FieldByName('COR_PRIMARY').AsString := ColorToHtmlHex(ColorDialog1.Color);
    pnCorPrimaryHwCloudIA.Color := ColorDialog1.Color;
  end;
end;

procedure TfrmCadConfigAPI.btCorPrimaryContainerClick(Sender: TObject);
begin
  ColorDialog1.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_PRIMARY_CONTAINER').AsString);
  if ColorDialog1.Execute then
  begin
    vConfigAPI.dataSet.FieldByName('COR_PRIMARY_CONTAINER').AsString := ColorToHtmlHex(ColorDialog1.Color);
    pnCorPrimaryContainerHwCloudIA.Color := ColorDialog1.Color;
  end;
end;

procedure TfrmCadConfigAPI.btCorSecondaryClick(Sender: TObject);
begin
  ColorDialog1.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_SECONDARY').AsString);
  if ColorDialog1.Execute then
  begin
    vConfigAPI.dataSet.FieldByName('COR_SECONDARY').AsString := ColorToHtmlHex(ColorDialog1.Color);
  	 pnCorSecondaryHwCloudIA.Color := ColorDialog1.Color;
  end;
end;

procedure TfrmCadConfigAPI.btCorSecondaryContainerClick(Sender: TObject);
begin
  ColorDialog1.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_SECONDARY_CONTAINER').AsString);
  if ColorDialog1.Execute then
  begin
    vConfigAPI.dataSet.FieldByName('COR_SECONDARY_CONTAINER').AsString := ColorToHtmlHex(ColorDialog1.Color);
    pnCorSecondaryContainerHwCloudIA.Color := ColorDialog1.Color;
  end;
end;

procedure TfrmCadConfigAPI.btCorSurfaceLowestClick(Sender: TObject);
begin
  ColorDialog1.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_SURFACE_LOWEST').AsString);
  if ColorDialog1.Execute then
  begin
    vConfigAPI.dataSet.FieldByName('COR_SURFACE_LOWEST').AsString := ColorToHtmlHex(ColorDialog1.Color);
    pnCorSurfaceLowestHwCloudIA.Color := ColorDialog1.Color;
  end;
end;

procedure TfrmCadConfigAPI.btCorTertiaryClick(Sender: TObject);
begin
  ColorDialog1.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_TERTIARY').AsString);
  if ColorDialog1.Execute then
  begin
    vConfigAPI.dataSet.FieldByName('COR_TERTIARY').AsString := ColorToHtmlHex(ColorDialog1.Color);
    pnCorTertiaryHwCloudIA.Color := ColorDialog1.Color;
  end;
end;

function TfrmCadConfigAPI.ColorToHtmlHex(AColor: TColor): string;
var
  RGBVal: LongInt;
  R, G, B: Byte;
begin
  RGBVal := ColorToRGB(AColor);
  R := GetRValue(RGBVal);
  G := GetGValue(RGBVal);
  B := GetBValue(RGBVal);
  
  Result := Format('#%.2X%.2X%.2X', [R, G, B]);
end;

procedure TfrmCadConfigAPI.ComboBoxAmbientePlugKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TfrmCadConfigAPI.ComboBoxAmbienteSuzukiKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TfrmCadConfigAPI.ConfiguraesAPIComrcioAberto1Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('comercio_aberto%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.ConfiguraesAPIConfereConciliaodeCarto1Click(
  Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('conc_cartao_api%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.ConfiguraesAPINummusCashback1Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('cashback%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.ConfiguraesAPINuvemshopECommerce1Click(
  Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('e-commerce%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.ConfiguraesAPIPlugBoletosBoletosBancrios1Click(
  Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('plug_boletos_api%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.ConfiguraesAPISmartbisFidelizao1Click(
  Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('prog_fid%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.ConfiguraesAPITrayECommerce1Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('e-commerce%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.ConfiguraesEnvioNotificaesdoFinanceiro1Click(
  Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('env_not_financ%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.ConfiguraesHwCloudIA1Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('hw_cloud_ia%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.ConfiguraesPagOnline1Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('pag_online%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.ConfiguraesSuzuki1Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('vei_codmarca', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.ctCorSurfaceLowClick(Sender: TObject);
begin
  ColorDialog1.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_SURFACE_LOW').AsString);
  if ColorDialog1.Execute then
  begin
    vConfigAPI.dataSet.FieldByName('COR_SURFACE_LOW').AsString := ColorToHtmlHex(ColorDialog1.Color);
    pnCorSurfaceLowHwCloudIA.Color := ColorDialog1.Color;
  end;
end;

procedure TfrmCadConfigAPI.DBEditWhatsppCAKeyPress(Sender: TObject; var Key: Char);
begin
	if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TfrmCadConfigAPI.DBComboBoxUsarAPICogHwCloudIAExit(Sender: TObject);
begin
  inherited;
  Label71.Visible := DBComboBoxUsarAPICogHwCloudIA.ItemIndex = 0;
  DBEditNomeBotHwCloudIA.Visible := DBComboBoxUsarAPICogHwCloudIA.ItemIndex = 0;
end;

procedure TfrmCadConfigAPI.DBEditSabadoFimHwCloudIAEnter(Sender: TObject);
begin
  inherited;
  mostrarHintEmBalao(DBEditSabadoFimHwCloudIA.Handle, PChar('Hora final do sábado' + #13 +
    'Pressione "ESC" para limpar o conteúdo'), 'Atenção', TTI_INFO);
end;

procedure TfrmCadConfigAPI.DBEditSabadoFimHwCloudIAKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    vConfigAPI.dataSet.FieldByName('HORARIO_SABADO_FIM').AsString := '';
  inherited;
end;

procedure TfrmCadConfigAPI.DBEditSabadoIniHwCloudIAEnter(Sender: TObject);
begin
  inherited;
  mostrarHintEmBalao(DBEditSabadoIniHwCloudIA.Handle, PChar('Hora inicial do sábado' + #13 +
    'Pressione "ESC" para limpar o conteúdo'), 'Atenção', TTI_INFO);
end;

procedure TfrmCadConfigAPI.DBEditSabadoIniHwCloudIAKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    vConfigAPI.dataSet.FieldByName('HORARIO_SABADO_INI').AsString := '';
  inherited;
end;

procedure TfrmCadConfigAPI.DBEditSemanaFimHwCloudIAEnter(Sender: TObject);
begin
  inherited;
  mostrarHintEmBalao(DBEditSemanaFimHwCloudIA.Handle, PChar('Hora final da semana' + #13 +
    'Pressione "ESC" para limpar o conteúdo'), 'Atenção', TTI_INFO);
end;

procedure TfrmCadConfigAPI.DBEditSemanaFimHwCloudIAKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    vConfigAPI.dataSet.FieldByName('HORARIO_SEMANA_FIM').AsString := '';
  inherited;
end;

procedure TfrmCadConfigAPI.DBEditSemanaIniHwCloudIAEnter(Sender: TObject);
begin
  inherited;
  mostrarHintEmBalao(DBEditSemanaIniHwCloudIA.Handle, PChar('Hora inicial da semana' + #13 +
    'Pressione "ESC" para limpar o conteúdo'), 'Atenção', TTI_INFO);
end;

procedure TfrmCadConfigAPI.DBEditSemanaIniHwCloudIAKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    vConfigAPI.dataSet.FieldByName('HORARIO_SEMANA_INI').AsString := '';
  inherited;
end;

procedure TfrmCadConfigAPI.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadConfigAPI.DBLookupComboBoxTabelaPrecoTrayExit(Sender: TObject);
begin
  if (DBLookupComboBoxTabelaPrecoTray.KeyValue = null) then
  else
	 EditHwTabelaPrecoTray.AsValue := DBLookupComboBoxTabelaPrecoTray.KeyValue;
end;

procedure TfrmCadConfigAPI.DBLookupComboBoxTipoClienteTrayExit(Sender: TObject);
begin
  if (DBLookupComboBoxTipoClienteTray.KeyValue = null) then
  else
	 EditHwTipoClienteTray.AsValue := DBLookupComboBoxTipoClienteTray.KeyValue;
end;

procedure TfrmCadConfigAPI.DBLookupComboBoxVendedorTrayExit(Sender: TObject);
begin
  if (DBLookupComboBoxVendedorTray.KeyValue = null) then
  else
	 EditHwVendedorTray.AsValue := DBLookupComboBoxVendedorTray.KeyValue;
end;

procedure TfrmCadConfigAPI.DBLookupComboBoxCondPagHwCloudIAExit(
  Sender: TObject);
begin
  if (DBLookupComboBoxCondPagHwCloudIA.KeyValue = null) then
  else
	 EditHwTipoClienteHwCloudIA.AsValue := DBLookupComboBoxCondPagHwCloudIA.KeyValue;
end;

procedure TfrmCadConfigAPI.DBLookupComboBoxTabelaPrecoCAExit(Sender: TObject);
begin
  if (DBLookupComboBoxTabelaPrecoCA.KeyValue = null) then
  else
	 EditHwTabelaPrecoCA.AsValue := DBLookupComboBoxTabelaPrecoCA.KeyValue;
end;

procedure TfrmCadConfigAPI.DBLookupComboBoxTabelaPrecoNuvemshopExit(Sender: TObject);
begin
  if (DBLookupComboBoxTabelaPrecoNuvemshop.KeyValue = null) then
  else
	 EditHwTabelaPrecoNuvemshop.AsValue := DBLookupComboBoxTabelaPrecoNuvemshop.KeyValue;
end;

procedure TfrmCadConfigAPI.DBLookupComboBoxTipoClienteHwCLoudIAExit(
  Sender: TObject);
begin
  if (DBLookupComboBoxTipoClienteHwCLoudIA.KeyValue = null) then
  else
	 EditHwTipoClienteHwCloudIA.AsValue := DBLookupComboBoxTipoClienteHwCLoudIA.KeyValue;
end;

procedure TfrmCadConfigAPI.DBLookupComboBoxTipoClienteNuvemshopExit(Sender: TObject);
begin
  if (DBLookupComboBoxTipoClienteNuvemshop.KeyValue = null) then
  else
	 EditHwTipoClienteNuvemshop.AsValue := DBLookupComboBoxTipoClienteNuvemshop.KeyValue;
end;

procedure TfrmCadConfigAPI.DBLookupComboBoxVendedorHwCloudIAExit(
  Sender: TObject);
begin
  if (DBLookupComboBoxVendedorHwCloudIA.KeyValue = null) then
  else
	 EditHwVendedorHwCloudIA.AsValue := DBLookupComboBoxVendedorHwCloudIA.KeyValue;
end;

procedure TfrmCadConfigAPI.DBLookupComboBoxVendedorNuvemshopExit(Sender: TObject);
begin
  if (DBLookupComboBoxVendedorNuvemshop.KeyValue = null) then
  else
	 EditHwVendedorNuvemshop.AsValue := DBLookupComboBoxVendedorNuvemshop.KeyValue;
end;

procedure TfrmCadConfigAPI.EditHwTabelaPrecoTrayExit(Sender: TObject);
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  DBLookupComboBoxTabelaPrecoTray.KeyValue := EditHwTabelaPrecoTray.AsInteger;

  if EditHwTabelaPrecoTray.AsInteger <= 0 then
  	exit;

  if not vConfigAPI.buscarTabela(EditHwTabelaPrecoTray.AsInteger) then
  begin
    Application.MessageBox('Tabela de preço/Promoção não encontrada', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHwTabelaPrecoTray.CanFocus) then
    	EditHwTabelaPrecoTray.SetFocus;
    exit;
  end;
end;

procedure TfrmCadConfigAPI.EditHwTabelaPrecoTrayKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EditHwTabelaPrecoTray.AsValue := StrToFloatDef(vDadosIni.pesquisaRapida('CADTABELAPROMOCAO'), 0);
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmCadConfigAPI.EditHwTipoClienteTrayExit(Sender: TObject);
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  DBLookupComboBoxTipoClienteTray.KeyValue := EditHwTipoClienteTray.AsInteger;

  if EditHwTipoClienteTray.AsInteger <= 0 then
  	exit;

  if not vConfigAPI.buscarTipoCliente(EditHwTipoClienteTray.AsInteger) then
  begin
    Application.MessageBox('Tipo de cliente não existe', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHwTipoClienteTray.CanFocus) then
    	EditHwTipoClienteTray.SetFocus;
    exit;
  end;
end;

procedure TfrmCadConfigAPI.EditHwTipoClienteTrayKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EditHwTipoClienteTray.AsValue := StrToFloatDef(vDadosIni.pesquisaRapida('TIPOS_CLIENTES'), 0);
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmCadConfigAPI.EditHwVendedorTrayExit(Sender: TObject);
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  DBLookupComboBoxVendedorTray.KeyValue := EditHwVendedorTray.AsInteger;

  if EditHwVendedorTray.AsInteger <= 0 then
  	exit;

  if not vConfigAPI.buscarVendedor(EditHwVendedorTray.AsInteger) then
  begin
    Application.MessageBox('Vendedor não encontrada', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHwVendedorTray.CanFocus) then
    	EditHwVendedorTray.SetFocus;
    exit;
  end;

  if not vConfigAPI.buscarColaboradorVendedor(EditHwVendedorTray.AsInteger) then
  begin
    Application.MessageBox('Colaborador não está definido como "VENDEDOR".', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHwVendedorTray.CanFocus) then
      EditHwVendedorTray.SetFocus;
    exit;
  end;
end;

procedure TfrmCadConfigAPI.EditHwVendedorTrayKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EditHwVendedorTray.AsValue := StrToFloatDef(vDadosIni.pesquisaRapida('COLABORADOR'), 0);
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmCadConfigAPI.EditHwCondPagHwCloudIAExit(Sender: TObject);
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  DBLookupComboBoxCondPagHwCloudIA.KeyValue := EditHwCondPagHwCloudIA.AsInteger;

  if EditHwCondPagHwCloudIA.AsInteger <= 0 then
  	exit;

  if not vConfigAPI.buscarCondPag(EditHwCondPagHwCloudIA.AsInteger) then
  begin
    Application.MessageBox('Condição de pagamento não existe', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHwCondPagHwCloudIA.CanFocus) then
    	EditHwCondPagHwCloudIA.SetFocus;
    exit;
  end;
end;

procedure TfrmCadConfigAPI.EditHwCondPagHwCloudIAKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EditHwCondPagHwCloudIA.AsValue := StrToFloatDef(vDadosIni.pesquisaRapida('COND_PAG'), 0);
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmCadConfigAPI.EditHwTabelaPrecoCAExit(Sender: TObject);
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  DBLookupComboBoxTabelaPrecoCA.KeyValue := EditHwTabelaPrecoCA.AsInteger;

  if EditHwTabelaPrecoCA.AsInteger <= 0 then
  	exit;

  if not vConfigAPI.buscarTabela(EditHwTabelaPrecoCA.AsInteger) then
  begin
    Application.MessageBox('Tabela de preço/Promoção não encontrada', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHwTabelaPrecoCA.CanFocus) then
    	EditHwTabelaPrecoCA.SetFocus;
    exit;
  end;
end;

procedure TfrmCadConfigAPI.EditHwTabelaPrecoCAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EditHwTabelaPrecoCA.AsValue := StrToFloatDef(vDadosIni.pesquisaRapida('CADTABELAPROMOCAO'), 0);
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmCadConfigAPI.EditHwTabelaPrecoNuvemshopExit(Sender: TObject);
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  DBLookupComboBoxTabelaPrecoNuvemshop.KeyValue := EditHwTabelaPrecoNuvemshop.AsInteger;

  if EditHwTabelaPrecoNuvemshop.AsInteger <= 0 then
  	exit;

  if not vConfigAPI.buscarTabela(EditHwTabelaPrecoNuvemshop.AsInteger) then
  begin
    Application.MessageBox('Tabela de preço/Promoção não encontrada', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHwTabelaPrecoNuvemshop.CanFocus) then
    	EditHwTabelaPrecoNuvemshop.SetFocus;
    exit;
  end;
end;

procedure TfrmCadConfigAPI.EditHwTabelaPrecoNuvemshopKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EditHwTabelaPrecoNuvemshop.AsValue := StrToFloatDef(vDadosIni.pesquisaRapida('CADTABELAPROMOCAO'), 0);
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmCadConfigAPI.EditHwTipoClienteHwCloudIAExit(Sender: TObject);
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  DBLookupComboBoxTipoClienteHwCLoudIA.KeyValue := EditHwTipoClienteHwCloudIA.AsInteger;

  if EditHwTipoClienteHwCloudIA.AsInteger <= 0 then
  	exit;

  if not vConfigAPI.buscarTipoCliente(EditHwTipoClienteHwCloudIA.AsInteger) then
  begin
    Application.MessageBox('Tipo de cliente não existe', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHwTipoClienteHwCloudIA.CanFocus) then
    	EditHwTipoClienteHwCloudIA.SetFocus;
    exit;
  end;
end;

procedure TfrmCadConfigAPI.EditHwTipoClienteHwCloudIAKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EditHwTipoClienteHwCloudIA.AsValue := StrToFloatDef(vDadosIni.pesquisaRapida('TIPOS_CLIENTES'), 0);
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmCadConfigAPI.EditHwTipoClienteNuvemshopExit(Sender: TObject);
begin
	if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  DBLookupComboBoxTipoClienteNuvemshop.KeyValue := EditHwTipoClienteNuvemshop.AsInteger;

  if EditHwTipoClienteNuvemshop.AsInteger <= 0 then
  	exit;

  if not vConfigAPI.buscarTipoCliente(EditHwTipoClienteNuvemshop.AsInteger) then
  begin
    Application.MessageBox('Tipo de cliente não existe', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHwTipoClienteNuvemshop.CanFocus) then
    	EditHwTipoClienteNuvemshop.SetFocus;
    exit;
  end;
end;

procedure TfrmCadConfigAPI.EditHwTipoClienteNuvemshopKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EditHwTipoClienteNuvemshop.AsValue := StrToFloatDef(vDadosIni.pesquisaRapida('TIPOS_CLIENTES'), 0);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmCadConfigAPI.EditPortKentroKeyPress(Sender: TObject;
  var Key: Char);
begin
	if not (key in ['1','2','3','4','5','6','7','8','9','0']) then
		key :=#0;
end;

procedure TfrmCadConfigAPI.EditQueuedIdKentroKeyPress(Sender: TObject; var Key: Char);
begin
	if not (key in ['1','2','3','4','5','6','7','8','9','0']) then
		key :=#0;
end;

procedure TfrmCadConfigAPI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if (vConfigAPI <> nil) then
    vConfigAPI.Cancel;

  vConfigAPI.free;
  vConfigAPI := nil;

  Action := caFree;
  if (frmCadConfigAPI <> nil) then
    frmCadConfigAPI := nil;
end;

procedure TfrmCadConfigAPI.FormCreate(Sender: TObject);
begin
 	TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  vConfigAPI := TConfigAPI.create;
  PageControl1.ActivePage := TabSheet2;
  tsCadastro.TabVisible := False;
  tsOpcoes.TabVisible := False;
  TabSheetTrayEC.TabVisible := False;
  TabSheetNuvemshopEC.TabVisible := False;
  TabSheetSmartbis.TabVisible := False;
  TabSheetNummus.TabVisible := False;
  TabSheetCA.TabVisible := False;
  TabSheetConcCartao.TabVisible := False;
  TabSheetKentro.TabVisible := False;
  TabSheetPlugBoleto.TabVisible := False;
  TabSheetSuzuki.TabVisible := False;
  TabSheetHwCloudIA.TabVisible := False;
  TabSheet12.TabVisible := False;
  TabSheet13.TabVisible := False;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadConfigAPI.FormShow(Sender: TObject);
begin
  if vShow <> 1 then
  begin
    DBGrid1.DataSource := dtmConfig.dsConfigAPI;
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    CheckBox1.Visible := False;
    CheckBox3.Visible := False;
  end;
  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  vDadosIni.fechaStatusProcessamento;
end;

function TfrmCadConfigAPI.HexToTColor(sColor: string): TColor;
begin
  // Remove '#' if present
  if (sColor <> '') and (sColor[1] = '#') then
    Delete(sColor, 1, 1);
    
  Result := RGB(
    StrToInt('$' + Copy(sColor, 1, 2)), // Red
    StrToInt('$' + Copy(sColor, 3, 2)), // Green
    StrToInt('$' + Copy(sColor, 5, 2))  // Blue
  );
end;

procedure TfrmCadConfigAPI.spAPIcomercioabertoClick(Sender: TObject);
begin
  vDadosIni.configurarSistema('comercio_aberto%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  if (not vConfigAPI.fempty('arquivologo')) and FileExists(vConfigAPI.fstr('arquivologo')) then
    ShellExecute(Application.HANDLE, 'open', PChar(vConfigAPI.fstr('arquivologo')), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmCadConfigAPI.SpeedButton14Click(Sender: TObject);
begin
  OpenPictureDialog1.InitialDir :=
    ExtractFilePath(vConfigAPI.dataSet.FieldByName('arquivologo').asString);
  OpenPictureDialog1.Filter := 'Imagens (*.jpg; *.jpeg; *.giff)|*.jpg;*.jpeg;*.giff';
  OpenPictureDialog1.Title := 'Selecione a Imagem do Logotipo';
  OpenPictureDialog1.FileName := '';
  if (OpenPictureDialog1.Execute) and (vConfigAPI.dataSet.State in [dsEdit, dsInsert]) then
    vConfigAPI.dataSet.FieldByName('arquivologo').asString := OpenPictureDialog1.FileName;

  if (Self.Enabled) and (Self.Visible) and (DBEdit_ImagemLogotipoCA.CanFocus) then
  	DBEdit_ImagemLogotipoCA.SetFocus;
end;

procedure TfrmCadConfigAPI.spAPIconfereConciliacaCartaoClick(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('conc_cartao_api%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.spAPInuvemshopCommerceClick(Sender: TObject);
begin
  vDadosIni.configurarSistema('e-commerce%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.spAPIplugBoletoClick(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('plug_boletos_api%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.spAPInummusCashbackClick(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('cashback%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.spEnvioNotificacaoFinanceiroClick(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('env_not_financ%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.spPagOnlineClick(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('pag_online%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.tab_ceClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('','Alterando tabela de preço - CE');

    if TreeViewPromocaoHwCloudIA_DB.Items.Count <= 0 then
      exit;

    if TreeViewPromocaoHwCloudIA_DB.Selected.Level <> 0 then
      exit;

    if not vConfigAPI.setarTab('H', 'CE', TreeViewPromocaoHwCloudIA, TreeViewPromocaoHwCloudIA_DB, TreeViewPromocaoHwCloudIA_DB.Selected.Text) then
      exit;

  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigAPI.tab_ciClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('','Alterando tabela de preço - CI');

    if TreeViewPromocaoHwCloudIA_DB.Items.Count <= 0 then
      exit;

    if TreeViewPromocaoHwCloudIA_DB.Selected.Level <> 0 then
      exit;

    if not vConfigAPI.setarTab('H', 'CI', TreeViewPromocaoHwCloudIA, TreeViewPromocaoHwCloudIA_DB, TreeViewPromocaoHwCloudIA_DB.Selected.Text) then
      exit;

  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigAPI.SpeedButton1Click(Sender: TObject);
var
  I: Integer;
begin
  try
    if vConfigAPI.dataSet.IsEmpty then
      Exit;
    if not vConfigAPI.Edit then
      Exit;
      
    inherited;
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsCadastro;
    LabelSeq.Visible := false;
    CheckCadSeq.Visible := false;
    CheckCadSeq.Checked := false;

    EditHwTabelaPrecoTray.AsValue := 0;
    EditHwTipoClienteTray.AsValue := 0;
    EditHwVendedorTray.AsValue    := 0;
    EditHwTabelaPrecoCA.AsValue := 0;
    EditHwTabelaPrecoNuvemshop.AsValue := 0;
    EditHwTipoClienteNuvemshop.AsValue := 0;
    EditHwVendedorNuvemshop.AsValue := 0;
    EditHwCondPagHwCloudIA.AsValue := 0;
    EditHwTipoClienteHwCloudIA.AsValue := 0;
    EditHwVendedorHwCloudIA.AsValue := 0;

    DBLookupComboBoxTabelaPrecoTray.KeyValue := 0;
    DBLookupComboBoxTipoClienteTray.KeyValue := 0;
    DBLookupComboBoxVendedorTray.KeyValue := 0;
    DBLookupComboBoxTabelaPrecoCA.KeyValue := 0;
    DBLookupComboBoxTipoClienteNuvemshop.KeyValue := 0;
    DBLookupComboBoxVendedorNuvemshop.KeyValue := 0;
    DBLookupComboBoxCondPagHwCloudIA.KeyValue := 0;
    DBLookupComboBoxTipoClienteHwCLoudIA.KeyValue := 0;
    DBLookupComboBoxVendedorHwCloudIA.KeyValue := 0;
    
    EditUrlKentro.Text      := '';
    EditPasswordKentro.Text := '';
    EditQueuedIdKentro.Text := '';

    if (vConfigAPI.dataSet.State = dsEdit) then
    begin
      if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'TRAYCOMMERCE' then
      begin
        vConfigAPI.montarTreeViewPromocaoDB('E', TreeViewPromocaoTray, TreeViewPromocaoTray_DB);
        vConfigAPI.montarTipoREQ(DBComboBoxTipoVendaPadraoREQTray);

        EditHwTabelaPrecoTray.AsValue            := vConfigAPI.dataSet.FieldByName('COD_TAB_PRECO').AsInteger;
        EditHwTipoClienteTray.AsValue            := vConfigAPI.dataSet.FieldByName('COD_TIP_CLIENTE').AsInteger;
        EditHwVendedorTray.AsValue               := vConfigAPI.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
        DBLookupComboBoxTabelaPrecoTray.KeyValue := EditHwTabelaPrecoTray.AsInteger;
        DBLookupComboBoxTipoClienteTray.KeyValue := EditHwTipoClienteTray.AsInteger;
        DBLookupComboBoxVendedorTray.KeyValue    := EditHwVendedorTray.AsInteger;

        PageControl2.ActivePage := TabSheetTrayEC;
        TabSheetTrayEC.Show;

        if trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxTipoVendaPadraoREQTray.Items.Count - 1 do
            if Copy(trim(DBComboBoxTipoVendaPadraoREQTray.Items[I]), 1, 1) = trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) then
            begin
              DBComboBoxTipoVendaPadraoREQTray.ItemIndex := I;
              Break;
            end;
        end;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'NUVEMSHOP' then
      begin
        vConfigAPI.montarTreeViewPromocaoDB('E', TreeViewPromocaoNuvemshop, TreeViewPromocaoNuvemshop_DB);	
        vConfigAPI.montarTipoREQ(DBComboBoxTipoVendaPadraoREQNuvemshop);

        EditHwTabelaPrecoNuvemshop.AsValue := vConfigAPI.dataSet.FieldByName('COD_TAB_PRECO').AsInteger;
        EditHwTipoClienteNuvemshop.AsValue := vConfigAPI.dataSet.FieldByName('COD_TIP_CLIENTE').AsInteger;
        EditHwVendedorNuvemshop.AsValue := vConfigAPI.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
        DBLookupComboBoxTabelaPrecoNuvemshop.KeyValue := EditHwTabelaPrecoNuvemshop.AsInteger;
        DBLookupComboBoxTipoClienteNuvemshop.KeyValue := EditHwTipoClienteNuvemshop.AsInteger;
        DBLookupComboBoxVendedorNuvemshop.KeyValue := EditHwVendedorNuvemshop.AsInteger;

        PageControl2.ActivePage := TabSheetNuvemshopEC;
        TabSheetNuvemshopEC.Show;

        if trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxTipoVendaPadraoREQNuvemshop.Items.Count - 1 do
            if Copy(trim(DBComboBoxTipoVendaPadraoREQNuvemshop.Items[I]), 1, 1) = trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) then
            begin
              DBComboBoxTipoVendaPadraoREQNuvemshop.ItemIndex := I;
              Break;
            end;
        end;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'COMERCIOABERTO' then
      begin
        vConfigAPI.montarTreeViewPromocaoDB('C', TreeViewPromocaoCA, TreeViewPromocaoCA_DB);

        EditHwTabelaPrecoCA.AsValue := vConfigAPI.dataSet.FieldByName('COD_TAB_PRECO').AsInteger;
        DBLookupComboBoxTabelaPrecoCA.KeyValue := EditHwTabelaPrecoCA.AsInteger;

        PageControl2.ActivePage := TabSheetCA;
        TabSheetCA.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'PROGRAMAFIDELIDADE' then
      begin
        PageControl2.ActivePage := TabSheetSmartbis;
        TabSheetSmartbis.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'NUMMUSCASHBACK' then
      begin
        EditUrlNummus.Text      := vDadosIni.IfThen(trim(vConfigAPI.dataSet.FieldByName('URL_API').AsString) <> '',
        	vDadosIni.getCampoPipe(vConfigAPI.dataSet.FieldByName('URL_API').AsString, 1), '');
        EditApiKeyNummus.Text := vDadosIni.IfThen(trim(vConfigAPI.dataSet.FieldByName('URL_API').AsString) <> '',
        	vDadosIni.getCampoPipe(vConfigAPI.dataSet.FieldByName('URL_API').AsString, 2), '');
        EditClientIdNummus.Text := vDadosIni.IfThen(trim(vConfigAPI.dataSet.FieldByName('URL_API').AsString) <> '',
        	vDadosIni.getCampoPipe(vConfigAPI.dataSet.FieldByName('URL_API').AsString, 3), '');

        PageControl2.ActivePage := TabSheetNummus;
        TabSheetNummus.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'CONFERE' then
      begin
        PageControl2.ActivePage := TabSheetConcCartao;
        TabSheetConcCartao.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'KENTRO' then
      begin
        EditUrlKentro.Text      := vDadosIni.IfThen(trim(vConfigAPI.dataSet.FieldByName('URL_API').AsString) <> '',
        	vDadosIni.getCampoPipe(vConfigAPI.dataSet.FieldByName('URL_API').AsString, 1), '');
        EditPasswordKentro.Text := vDadosIni.IfThen(trim(vConfigAPI.dataSet.FieldByName('URL_API').AsString) <> '',
        	vDadosIni.getCampoPipe(vConfigAPI.dataSet.FieldByName('URL_API').AsString, 2), '');
        EditQueuedIdKentro.Text := vDadosIni.IfThen(trim(vConfigAPI.dataSet.FieldByName('URL_API').AsString) <> '',
        	vDadosIni.getCampoPipe(vConfigAPI.dataSet.FieldByName('URL_API').AsString, 3), '');

        PageControl2.ActivePage := TabSheetKentro;
        TabSheetKentro.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'BOLETO_API' then
      begin
        if vConfigAPI.vUserIdOld = '' then
        	 ComboBoxAmbientePlug.ItemIndex := 1
        else if vConfigAPI.vUserIdOld <> vConfigAPI.vUserId then
        	 ComboBoxAmbientePlug.ItemIndex := 1
        else
        	 ComboBoxAmbientePlug.ItemIndex := 0;
        ComboBoxAmbientePlug.Text := ComboBoxAmbientePlug.Items[ComboBoxAmbientePlug.ItemIndex];

        PageControl2.ActivePage := TabSheetPlugBoleto;
        TabSheetPlugBoleto.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'SUZUKI' then
      begin
        if vConfigAPI.vUserIdOld = '' then
        	 ComboBoxAmbienteSuzuki.ItemIndex := 1
        else if vConfigAPI.vUserIdOld <> vConfigAPI.vUserId then
        	 ComboBoxAmbienteSuzuki.ItemIndex := 1
        else
        	 ComboBoxAmbienteSuzuki.ItemIndex := 0;
        ComboBoxAmbienteSuzuki.Text := ComboBoxAmbienteSuzuki.Items[ComboBoxAmbienteSuzuki.ItemIndex];

        PageControl2.ActivePage := TabSheetSuzuki;
        TabSheetSuzuki.Show;
      end
      else if trim(vConfigAPI.dataSet.FieldByName('API').AsString) = 'HWCLOUD_IA' then
      begin
        if vDadosIni.GetIni('MD', 'MHTT', 'N') <> 'S' then
          vDadosIni.buscarConfigHwCloud;

        vConfigAPI.montarTreeViewPromocaoDB('H', TreeViewPromocaoHwCloudIA, TreeViewPromocaoHwCloudIA_DB);	
        vConfigAPI.montarAmbiente(DBComboBoxAmbienteHwCloudIA, vConfigAPI.dataSet.FieldByName('AMBIENTE_API').AsString);
        vConfigAPI.montarTipoREQ(DBComboBoxTipoVendaPadraoREQHwCloudIA);
        vConfigAPI.montarTipoOS(DBComboBoxTipoVendaPadraoOSHwCloudIA);

        Label71.Visible := vConfigAPI.dataSet.FieldByName('USAR_API_COG').AsString = 'S';
        DBEditNomeBotHwCloudIA.Visible := vConfigAPI.dataSet.FieldByName('USAR_API_COG').AsString = 'S';

        EditHwCondPagHwCloudIA.AsValue := vConfigAPI.dataSet.FieldByName('COD_COND_PAG').AsInteger;
        EditHwTipoClienteHwCloudIA.AsValue := vConfigAPI.dataSet.FieldByName('COD_TIP_CLIENTE').AsInteger;
        EditHwVendedorHwCloudIA.AsValue := vConfigAPI.dataSet.FieldByName('COD_VENDEDOR').AsInteger;

        DBLookupComboBoxCondPagHwCloudIA.KeyValue := EditHwCondPagHwCloudIA.AsInteger;
        DBLookupComboBoxTipoClienteHwCLoudIA.KeyValue := EditHwTipoClienteHwCloudIA.AsInteger;
        DBLookupComboBoxVendedorHwCloudIA.KeyValue := EditHwVendedorHwCloudIA.AsInteger;

        if vConfigAPI.dataSet.FieldByName('USAR_API_COG').AsString = 'N' then
        	 DBComboBoxUsarAPICogHwCloudIA.ItemIndex := 1
        else
        	 DBComboBoxUsarAPICogHwCloudIA.ItemIndex := 0;

        if vConfigAPI.dataSet.FieldByName('UTIL_RECOMENDACAO').AsString = 'N' then
        	 DBComboBoxUtilRecomendacaoHwCloudIA.ItemIndex := 1
        else
        	 DBComboBoxUtilRecomendacaoHwCloudIA.ItemIndex := 0;

        if trim(vConfigAPI.dataSet.FieldByName('AMBIENTE_API').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxAmbienteHwCloudIA.Items.Count - 1 do
            if trim(DBComboBoxAmbienteHwCloudIA.Items[I]) = trim(vConfigAPI.dataSet.FieldByName('AMBIENTE_API').AsString) then
            begin
              DBComboBoxAmbienteHwCloudIA.ItemIndex := I;
              Break;
            end;
        end;

        if trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxTipoVendaPadraoREQHwCloudIA.Items.Count - 1 do
            if Copy(trim(DBComboBoxTipoVendaPadraoREQHwCloudIA.Items[I]), 1, 1) = trim(vConfigAPI.dataSet.FieldByName('TIPO_VENDA').AsString) then
            begin
              DBComboBoxTipoVendaPadraoREQHwCloudIA.ItemIndex := I;
              Break;
            end;
        end;

        if trim(vConfigAPI.dataSet.FieldByName('TIPO_OS').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxTipoVendaPadraoOSHwCloudIA.Items.Count - 1 do
            if trim(DBComboBoxTipoVendaPadraoOSHwCloudIA.Items[I]) = trim(vConfigAPI.dataSet.FieldByName('TIPO_OS').AsString) then
            begin
              DBComboBoxTipoVendaPadraoOSHwCloudIA.ItemIndex := I;
              Break;
            end;
        end;

        if trim(vConfigAPI.dataSet.FieldByName('DRIVE_TYPE').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxDriveTypeHwCloudIA.Items.Count - 1 do
            if trim(DBComboBoxDriveTypeHwCloudIA.Items[I]) = trim(vConfigAPI.dataSet.FieldByName('DRIVE_TYPE').AsString) then
            begin
              DBComboBoxDriveTypeHwCloudIA.ItemIndex := I;
              Break;
            end;
        end;

        if trim(vConfigAPI.dataSet.FieldByName('DRIVE_CHECK_MODIF').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxDriveCheckModif.Items.Count - 1 do
            if Copy(trim(DBComboBoxDriveCheckModif.Items[I]), 1, 1) = trim(vConfigAPI.dataSet.FieldByName('DRIVE_CHECK_MODIF').AsString) then
            begin
              DBComboBoxDriveCheckModif.ItemIndex := I;
              Break;
            end;
        end;

        if trim(vConfigAPI.dataSet.FieldByName('UTIL_AGENTIC_RAG').AsString) <> '' then
        begin
          for I := 0 to DBComboBoxUtlAgenticRagHwCloudIA.Items.Count - 1 do
            if Copy(trim(DBComboBoxUtlAgenticRagHwCloudIA.Items[I]), 1, 1) = trim(vConfigAPI.dataSet.FieldByName('UTIL_AGENTIC_RAG').AsString) then
            begin
              DBComboBoxUtlAgenticRagHwCloudIA.ItemIndex := I;
              Break;
            end;
        end;

        pnCorPrimaryHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_PRIMARY').AsString);
        pnCorPrimaryContainerHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_PRIMARY_CONTAINER').AsString);
        pnCorPrimaryFixedHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_PRIMARY_FIXED').AsString);
        pnCorOnPrimaryHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_ON_PRIMARY').AsString);
        pnCorSecondaryHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_SECONDARY').AsString);
        pnCorSecondaryContainerHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_SECONDARY_CONTAINER').AsString);
        pnCorTertiaryHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_TERTIARY').AsString);
        pnCorErrorHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_ERROR').AsString);
        pnCorBackGroundHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_BACKGROUND').AsString);
        pnCorSurfaceLowestHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_SURFACE_LOWEST').AsString);
        pnCorSurfaceLowHwCloudIA.Color := HexToTColor(vConfigAPI.dataSet.FieldByName('COR_SURFACE_LOW').AsString);

        PageControl5.ActivePage := TabSheet12;
        TabSheet12.Show;

        PageControl4.ActivePage := TabSheet5;
        TabSheet5.Show;

        PageControl2.ActivePage := TabSheetHwCloudIA;
        TabSheetHwCloudIA.Show;
      end;
    end;

    if (Self.Enabled) and (Self.Visible) and (DBEditUrlTray.CanFocus) then
      DBEditUrlTray.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEditUrlNuvemshop.CanFocus) then
    	DBEditUrlNuvemshop.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEditIdentificacaoCA.CanFocus) then
    	DBEditIdentificacaoCA.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEditUrlSmartbis.CanFocus) then
      DBEditUrlSmartbis.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (EditUrlNummus.CanFocus) then
    	EditUrlNummus.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEditUrlConfere.CanFocus) then
    	DBEditUrlConfere.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (EditUrlKentro.CanFocus) then
    	EditUrlKentro.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEditTokenPlug.CanFocus) then
    	DBEditTokenPlug.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEditUsuarioSuzuki.CanFocus) then
      DBEditUsuarioSuzuki.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEditUrlHwCloudIA.CanFocus) then
    	DBEditUrlHwCloudIA.SetFocus;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      PageControl1.ActivePage := TabSheet2;
      TabSheet2.Show;
      vConfigAPI.Cancel;
      vConfigAPI.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadConfigAPI.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  try
    vConfigAPI.Delete;
  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      vConfigAPI.Cancel;
      vConfigAPI.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadConfigAPI.SpeedButton6Click(Sender: TObject);
var
  vMsgTipoContatoOrigemPlataforma: TMsgTipoContatoOrigemPlataforma;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vConfig.AHandle = 0 then
      carregaPacote('pkConfig', vDadosIni.vConfig.AHandle);
    vMsgTipoContatoOrigemPlataforma.cadMsgTipoContatoOrigemPlataforma(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigAPI.SpeedButton7Click(Sender: TObject);
var
  vMsgOrigemModCartas: TMsgOrigemModCartas;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vConfig.AHandle = 0 then
      carregaPacote('pkConfig', vDadosIni.vConfig.AHandle);
    vMsgOrigemModCartas.cadMsgOrigemModCartas(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigAPI.SpeedButton8Click(Sender: TObject);
var
  vMsgTipoContatoOrigem: TMsgTipoContatoOrigem;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vConfig.AHandle = 0 then
      carregaPacote('pkConfig', vDadosIni.vConfig.AHandle);
    vMsgTipoContatoOrigem.cadMsgTipoContatoOrigem(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigAPI.spAPItrayCommerceClick(Sender: TObject);
begin
  pmConfiguracoes.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmCadConfigAPI.spAPIsmartbisClick(Sender: TObject);
begin
  vDadosIni.configurarSistema('prog_fid%', vConfigAPI.buscas);
end;

procedure TfrmCadConfigAPI.TreeViewPromocaoTrayDblClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('','Adicionado tabela de preço');

	 if TreeViewPromocaoTray.Items.Count <= 0 then
      exit;

    if TreeViewPromocaoTray.Selected.Level <> 0 then
      exit;

    if not vConfigAPI.addItemTreeViewPromocaoDB('E', TreeViewPromocaoTray, TreeViewPromocaoTray_DB, TreeViewPromocaoTray.Selected.Text) then
      exit;
  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigAPI.TreeViewPromocaoTray_DBDblClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('','Removendo tabela de preço');

    if TreeViewPromocaoTray_DB.Items.Count <= 0 then
      exit;

    if TreeViewPromocaoTray_DB.Selected.Level <> 0 then
      exit;

    if not vConfigAPI.deleteItemTreeViewPromocaoDB('E', TreeViewPromocaoTray_DB, TreeViewPromocaoTray_DB.Selected.Text) then
      exit;
  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigAPI.TreeViewPromocaoNuvemshopDblClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('','Adicionado tabela de preço');
    
    if TreeViewPromocaoNuvemshop.Items.Count <= 0 then
      exit;

    if TreeViewPromocaoNuvemshop.Selected.Level <> 0 then
      exit;

    if not vConfigAPI.addItemTreeViewPromocaoDB('E', TreeViewPromocaoNuvemshop, TreeViewPromocaoNuvemshop_DB, TreeViewPromocaoNuvemshop.Selected.Text) then
      exit;
  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigAPI.TreeViewPromocaoNuvemshop_DBDblClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('','Removendo tabela de preço');

    if TreeViewPromocaoNuvemshop_DB.Items.Count <= 0 then
      exit;

    if TreeViewPromocaoNuvemshop_DB.Selected.Level <> 0 then
      exit;

    if not vConfigAPI.deleteItemTreeViewPromocaoDB('E', TreeViewPromocaoNuvemshop_DB, TreeViewPromocaoNuvemshop_DB.Selected.Text) then
      exit;
  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigAPI.TreeViewPromocaoCADblClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('','Adicionado tabela de preço');
    
    if TreeViewPromocaoCA.Items.Count <= 0 then
      exit;

    if TreeViewPromocaoCA.Selected.Level <> 0 then
      exit;

    if not vConfigAPI.addItemTreeViewPromocaoDB('C', TreeViewPromocaoCA, TreeViewPromocaoCA_DB, TreeViewPromocaoCA.Selected.Text) then
      exit;
  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigAPI.TreeViewPromocaoCA_DBDblClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('','Removendo tabela de preço');
    
    if TreeViewPromocaoCA_DB.Items.Count <= 0 then
      exit;

    if TreeViewPromocaoCA_DB.Selected.Level <> 0 then
      exit;

    if not vConfigAPI.deleteItemTreeViewPromocaoDB('C', TreeViewPromocaoCA_DB, TreeViewPromocaoCA_DB.Selected.Text) then
      exit;
  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigAPI.TreeViewPromocaoHwCloudIADblClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('','Adicionado tabela de preço');

    if TreeViewPromocaoHwCloudIA.Items.Count <= 0 then
      exit;

    if TreeViewPromocaoHwCloudIA.Selected.Level <> 0 then
      exit;

    if not vConfigAPI.addItemTreeViewPromocaoDB('H', TreeViewPromocaoHwCloudIA, TreeViewPromocaoHwCloudIA_DB, TreeViewPromocaoHwCloudIA.Selected.Text) then
      exit;

  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadConfigAPI.TreeViewPromocaoHwCloudIA_DBDblClick(
  Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('','Removendo tabela de preço');

    if TreeViewPromocaoHwCloudIA_DB.Items.Count <= 0 then
      exit;

    if TreeViewPromocaoHwCloudIA_DB.Selected.Level <> 0 then
      exit;

    if not vConfigAPI.deleteItemTreeViewPromocaoDB('H', TreeViewPromocaoHwCloudIA_DB, TreeViewPromocaoHwCloudIA_DB.Selected.Text) then
      exit;

  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;


procedure TfrmCadConfigAPI.EditHwVendedorHwCloudIAExit(Sender: TObject);
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  DBLookupComboBoxVendedorHwCloudIA.KeyValue := EditHwVendedorHwCloudIA.AsInteger;

  if EditHwVendedorHwCloudIA.AsInteger <= 0 then
  	exit;

  if not vConfigAPI.buscarVendedor(EditHwVendedorHwCloudIA.AsInteger) then
  begin
    Application.MessageBox('Vendedor não encontrada', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHwVendedorHwCloudIA.CanFocus) then
    	EditHwVendedorHwCloudIA.SetFocus;
    exit;
  end;

  if not vConfigAPI.buscarColaboradorVendedor(EditHwVendedorHwCloudIA.AsInteger) then
  begin
    Application.MessageBox('Colaborador não está definido como "VENDEDOR".', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHwVendedorHwCloudIA.CanFocus) then
      EditHwVendedorHwCloudIA.SetFocus;
    exit;
  end;
end;

procedure TfrmCadConfigAPI.EditHwVendedorHwCloudIAKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EditHwVendedorHwCloudIA.AsValue := StrToFloatDef(vDadosIni.pesquisaRapida('COLABORADOR'), 0);
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TfrmCadConfigAPI.EditHwVendedorNuvemshopExit(Sender: TObject);
begin
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  DBLookupComboBoxVendedorNuvemshop.KeyValue := EditHwVendedorNuvemshop.AsInteger;

  if EditHwVendedorNuvemshop.AsInteger <= 0 then
  	exit;

  if not vConfigAPI.buscarVendedor(EditHwVendedorNuvemshop.AsInteger) then
  begin
    Application.MessageBox('Vendedor não encontrada', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHwVendedorNuvemshop.CanFocus) then
    	EditHwVendedorNuvemshop.SetFocus;
    exit;
  end;

  if not vConfigAPI.buscarColaboradorVendedor(EditHwVendedorNuvemshop.AsInteger) then
  begin
    Application.MessageBox('Colaborador não está definido como "VENDEDOR".', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditHwVendedorNuvemshop.CanFocus) then
      EditHwVendedorNuvemshop.SetFocus;
    exit;
  end;
end;

procedure TfrmCadConfigAPI.EditHwVendedorNuvemshopKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EditHwVendedorNuvemshop.AsValue := StrToFloatDef(vDadosIni.pesquisaRapida('COLABORADOR'), 0);
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

end.
