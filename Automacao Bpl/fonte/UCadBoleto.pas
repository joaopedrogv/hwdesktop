unit UCadBoleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
{$IFDEF USAVARIANTS}Variants, {$ENDIF}
  ComObj, Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DB, DBCtrls, UClassesBoleto, RDprint, AppEvnts, grimgctrl,
  QRCtrls, qrpctrls, QuickRpt, Types, DBClient, uEditHw, IBDatabase, CheckLst, uFrameCheckListaContato;

type
  TfrmCadBoletos = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit_NumeroDocumento: TDBEdit;
    Label10: TLabel;
    DBEdit_ValorTotal: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBEdit_MoraDiaria: TDBEdit;
    Label13: TLabel;
    DBEdit_Multa: TDBEdit;
    Label14: TLabel;
    DBEdit9: TDBEdit;
    Label15: TLabel;
    DBEdit10: TDBEdit;
    Label16: TLabel;
    DBEdit11: TDBEdit;
    RDprint1: TRDprint;
    DBEdit_Codigo: TDBEdit;
    Label_Codigo: TLabel;
    TabSheet4: TTabSheet;
    TabSheet_Cobrebem: TTabSheet;
    GroupBox6: TGroupBox;
    Label19: TLabel;
    Edit1: TEdit;
    CheckBox2: TCheckBox;
    BitBtn_DadosBoleto_OK: TBitBtn;
    Panel4: TPanel;
    tabsheet6: TTabSheet;
    GroupBox7: TGroupBox;
    BitBtn10: TBitBtn;
    CheckBox_NossoNumero: TCheckBox;
    CheckBox_RemessaEnviada: TCheckBox;
    BitBtn11: TBitBtn;
    TabSheet_Relatorio: TTabSheet;
    Label20: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    ScrollBox_Relatorio: TScrollBox;
    QuickRep_Remessa: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRPLabel1: TQRPLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    lbEmpresa: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText12: TQRDBText;
    GroupBox_NossoNumeroRepetido: TGroupBox;
    Label18: TLabel;
    DBGrid2: TDBGrid;
    BitBtn_InativarBoleto: TBitBtn;
    BitBtn_ProximoNumero: TBitBtn;
    SelecionarTodos: TMenuItem;
    TabSheet_Promissorias: TTabSheet;
    ScrollBox4: TScrollBox;
    QuickRep_Promissoria: TQuickRep;
    TitleBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel15: TQRLabel;
    QRShape4: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    SpeedButton17: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    TabSheet_Controles: TTabSheet;
    DBGrid3: TDBGrid;
    Panel5: TPanel;
    BitBtn8: TBitBtn;
    BitBtn7: TBitBtn;
    CheckBox_RetirarCredito: TCheckBox;
    tsRemessa: TTabSheet;
    pnRemessa: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    BitBtn9: TBitBtn;
    BitBtn12: TBitBtn;
    Label21: TLabel;
    Edit2: TEdit;
    Label22: TLabel;
    Label24: TLabel;
    DBText1: TDBText;
    Label25: TLabel;
    SpeedButton21: TSpeedButton;
    ckCarne: TCheckBox;
    RadioGroup1: TRadioGroup;
    Marcarboletoparaserimpressopelobanco1: TMenuItem;
    Desmarcarboletoparaserimpressopelobanco1: TMenuItem;
    Label23: TLabel;
    DBEdit2: TDBEdit;
    groupAdicional: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    TabSheet_Recibos: TTabSheet;
    ScrollBox5: TScrollBox;
    QuickRep_Recibos: TQuickRep;
    TitleBand2: TQRBand;
    QRShape8: TQRShape;
    QRShape26: TQRShape;
    QRShape9: TQRShape;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel68: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRShape17: TQRShape;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRShape18: TQRShape;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRShape20: TQRShape;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRShape21: TQRShape;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRImage1: TQRImage;
    QRShape23: TQRShape;
    QRShape19: TQRShape;
    SpeedButton13: TSpeedButton;
    GroupBox5: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    SpeedButton104: TSpeedButton;
    EditHw1: TEditHw;
    CheckBox_OutrosDados: TCheckBox;
    Label26: TLabel;
    DBMemo1: TDBMemo;
    Label27: TLabel;
    DBEdit4: TDBEdit;
    Label28: TLabel;
    DBEdit5: TDBEdit;
    SpeedButton14: TSpeedButton;
    PageFooterBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRHRule3: TQRHRule;
    QRHRule4: TQRHRule;
    QRLabel116: TQRLabel;
    QRLabel117: TQRLabel;
    DesmarcaTodos1: TMenuItem;
    GroupBox9: TGroupBox;
    Label29: TLabel;
    DBEdit7: TDBEdit;
    Label30: TLabel;
    DBEdit8: TDBEdit;
    Label31: TLabel;
    DBEdit12: TDBEdit;
    SpeedButton15: TSpeedButton;
    Label32: TLabel;
    DBMemo2: TDBMemo;
    SpeedButton16: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    DBEdit13: TDBEdit;
    Label33: TLabel;
    BitBtn14: TBitBtn;
    SpeedButton20: TSpeedButton;
    SpeedButton55: TSpeedButton;
    TabSheet_EnvBol: TTabSheet;
    pnEnvEmail: TPanel;
    Panel9: TPanel;
    BitBtn13: TBitBtn;
    BitBtn15: TBitBtn;
    ckConfEmailAssunto: TCheckBox;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    ts_outros: TTabSheet;
    PageControl2: TPageControl;
    ts_dados_comuns: TTabSheet;
    pn_alt_demaisboletos: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    GroupBox10: TGroupBox;
    Panel12: TPanel;
    grid_demaisboletos: TDBGrid;
    Panel13: TPanel;
    Panel14: TPanel;
    Label35: TLabel;
    DBEdit14: TDBEdit;
    Label36: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBMemo3: TDBMemo;
    DBEdit22: TDBEdit;
    ck_alt_data_emissao: TCheckBox;
    ck_alt_cliente: TCheckBox;
    ck_alt_local_pag: TCheckBox;
    ck_alt_mora: TCheckBox;
    ck_alt_obs1: TCheckBox;
    ck_alt_obs2: TCheckBox;
    ck_alt_mensagem_ad: TCheckBox;
    ck_alt_multa: TCheckBox;
    ck_alt_dias: TCheckBox;
    bt_alt_aplicar: TBitBtn;
    bt_alt_nao_aplicar: TBitBtn;
    bt_alt_voltar: TBitBtn;
    GroupBoxConfCol: TGroupBox;
    ScrollBoxConfCol: TScrollBox;
    PopupMenuConfCol: TPopupMenu;
    Configurarcolunas2: TMenuItem;
    ResetarConfiguraesdecolunas2: TMenuItem;
    SalvardadosnoExcel2: TMenuItem;
    ReajustarLarguradascolunas2: TMenuItem;
    Copiarparareadetransferncia2: TMenuItem;
    SpeedButton22: TSpeedButton;
    pnPreImpresso: TPanel;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    DBLookupComboBox_BancoPreImpresso: TDBLookupComboBox;
    DBEdit_CodigoBAnco: TDBEdit;
    BitBtn_ImprimirPreImpresso: TBitBtn;
    BitBtn_VoltarPreImpresso: TBitBtn;
    pnSelecionarConvenio: TPanel;
    GroupBox_SelecionaContaBoleto: TGroupBox;
    Panel6: TPanel;
    BitBtn_OKCobrebem: TBitBtn;
    BitBtn_VoltarCobrebem: TBitBtn;
    Label17: TLabel;
    DBEdit_ValorDesconto: TDBEdit;
    DBMemo4: TDBMemo;
    Label44: TLabel;
    DBText2: TDBText;
    pnTelefoneAvulso: TPanel;
    Label34: TLabel;
    MaskEdit4: TMaskEdit;
    Panel16: TPanel;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    Panel15: TPanel;
    GroupBoxOpcoes: TGroupBox;
    GroupBoxEmail: TGroupBox;
    lbAssuntoEmail: TLabel;
    lbMensagemEmail: TLabel;
    lbContatoEmail: TLabel;
    EditAssuntoEmail: TEdit;
    MemoMensagemEmail: TMemo;
    EditContatoEmail: TEdit;
    GroupBoxWhatsApp: TGroupBox;
    lbContatoWhatsApp: TLabel;
    lbMensagemWhatsApp: TLabel;
    SpeedButtonAdcWhatsApp: TSpeedButton;
    SpeedButtonRemWhatsApp: TSpeedButton;
    CheckListContatoWhatsApp: TCheckListBox;
    MemoMensagemWhatsApp: TMemo;
    ckLixeira: TCheckBox;
    QRLabel118: TQRLabel;
    MarcarTodosBoletosClick: TMenuItem;
    DesmarcarTodosBoletosClick: TMenuItem;
    ckConfEmailWhatsAppAssunto: TCheckBox;
    Panel18: TPanel;
    GroupBoxConvenio: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBoxAcoes: TGroupBox;
    Panel17: TPanel;
    ckImprimirBoleto: TCheckBox;
    ckEnviarBoleto: TCheckBox;
    Panel19: TPanel;
    ckUnicoEmailWhatsApp: TCheckBox;
    ckEnviarEmail: TCheckBox;
    ckEnviarWhatsApp: TCheckBox;
    lbAssuntoWhatsApp: TLabel;
    EditAssuntoWhatsApp: TEdit;
    FrameCheckListaContato: TFrameCheckListaContato;
    procedure ckConfEmailWhatsAppAssuntoClick(Sender: TObject);
    procedure ckEnviarWhatsAppClick(Sender: TObject);
    procedure ckEnviarEmailClick(Sender: TObject);
    procedure ckUnicoEmailWhatsAppClick(Sender: TObject);
    procedure ckEnviarBoletoClick(Sender: TObject);
    procedure ckImprimirBoletoClick(Sender: TObject);
    procedure DesmarcarTodosBoletosClickClick(Sender: TObject);
    procedure MarcarTodosBoletosClickClick(Sender: TObject);
    procedure ckLixeiraClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pnSelecionarConvenioEnter(Sender: TObject);
    procedure SpeedButtonRemWhatsAppClick(Sender: TObject);
    procedure SpeedButtonAdcWhatsAppClick(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure ckConfEmailAssuntoClick(Sender: TObject);
    procedure DBEdit_ValorTotalExit(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas2Click(Sender: TObject);
    procedure Configurarcolunas2Click(Sender: TObject);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure DBGrid3ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure ScrollBoxConfColExit(Sender: TObject);
    procedure ScrollBoxConfColEnter(Sender: TObject);
    procedure Copiarparareadetransferncia2Click(Sender: TObject);
    procedure ReajustarLarguradascolunas2Click(Sender: TObject);
    procedure SalvardadosnoExcel2Click(Sender: TObject);
    procedure Panel14Exit(Sender: TObject);
    procedure pn_alt_demaisboletosEnter(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure SpeedButton55Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton15Click(Sender: TObject);
    procedure DesmarcaTodos1Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure CheckBox_NossoNumeroClick(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure EditHw1Exit(Sender: TObject);
    procedure SpeedButton104Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure TitleBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep_RecibosPreview(Sender: TObject);
    procedure groupAdicionalExit(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure GroupBox1Enter(Sender: TObject);
    procedure GroupBox1Exit(Sender: TObject);
    procedure Desmarcarboletoparaserimpressopelobanco1Click(Sender: TObject);
    procedure Marcarboletoparaserimpressopelobanco1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton21Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtn_AbordarCobrebemClick(Sender: TObject);
    procedure CheckBox_RetirarCreditoClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure TitleBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep_PromissoriaPreview(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SelecionarTodosClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_MultaEnter(Sender: TObject);
    procedure DBEdit_MoraDiariaEnter(Sender: TObject);
    procedure DBEdit_ValorTotalEnter(Sender: TObject);
    procedure DBEdit_MultaKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_CodigoBAncoExit(Sender: TObject);
    procedure DBLookupComboBox_BancoPreImpressoDropDown(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure BitBtn_ProximoNumeroClick(Sender: TObject);
    procedure BitBtn_InativarBoletoClick(Sender: TObject);
    procedure BitBtn_VoltarCobrebemClick(Sender: TObject);
    procedure DBEdit_ValorTotalKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_MoraDiariaKeyPress(Sender: TObject; var Key: Char);
    procedure QuickRep_RemessaPreview(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn_DadosBoleto_OKClick(Sender: TObject);
    procedure DBEdit_NomeClienteEnter(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn_ImprimirPreImpressoClick(Sender: TObject);
    procedure BitBtn_OKCobrebemClick(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBLookupComboBox_BancoPreImpressoExit(Sender: TObject);
    procedure DBEdit_CodigoBAncoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit9Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure formImprimirBoletoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;
    procedure ImprimirEnviar(pProcesso: string; pMensagem: string);
  private
    { Private declarations }
    vCriou: Smallint;
    PrimeiraPesquisa2: Boolean;
    cdsColunas2: TClientDataSet;
    trans2: TIBTransaction;
    vTabela2, vCampoPadrao2: string;
    fReset2: boolean;

    cdsGrid2: TClientDataSet;
  	GridCfg2: TDBGrid;
  	ListGridsAndDataSets2: TStrings;
	  ListPositions2: TStrings;

    nomeDTSEt2, vAlterarNomeDtSet2, usuario2: string;
    vCamposPadraoRegistro2: Boolean;

    Fid_demaisBoletos: string;
    {
    FpopupMenu: TPopupMenu;
    function NewMenuItem(AOwner: TComponent; ACaption: string; AEvent: TNotifyEvent): TMenuItem;
    function TfrmCadBoletos.NewMenuItem(AOwner: TComponent; ACaption: string;
      AEvent: TNotifyEvent): TMenuItem;
    begin
      Result         := TMenuItem.Create(AOwner);
      Result.Caption := ACaption;
      Result.OnClick := AEvent;
    end;
    }
    procedure localizar_demais_boletos(Sender: TObject);
  public
    { Public declarations }
    procedure DesabilitarHabilitarCampos(VerdadeiroFalso: Boolean);
  end;

var
  frmCadBoletos: TfrmCadBoletos;
  ObBoleto: TBoleto;
  vCampoAdcional: string;
  vCondAdcional: string;
  vSqlAdcional: string;
  vCodClienteTmp: Integer;
  
implementation

uses
  uDtmAtivo, udtmBoleto, uDataSet_OOP, uDadosIni, StrUtils, hw_utils;

{$R *.dfm}

procedure TfrmCadBoletos.BitBtn10Click(Sender: TObject);
begin
  inherited;

   if (not CheckBox_NossoNumero.Checked)
  	and (not CheckBox_OutrosDados.Checked)
  	and (not CheckBox_RemessaEnviada.Checked)
    and (not ckCarne.Checked)
  	and (not CheckBox_RetirarCredito.Checked) then
  begin
  	Application.MessageBox('Nenhuma opção selecionada.',
       'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
    exit;
  end;
  
  try
    vDadosIni.abreStatusProcessamento('Retirar dados da impressão',
      'Processando informações...');
    try
      if not vDadosIni.PesqPros('BOL014', 'EDITAR', '', 'BOLETAS', '', ObBoleto.buscas, true) then
      	Exit;

      BitBtn10.Enabled := false;
      BitBtn11.Enabled := false;
      if ObBoleto.LimparCamposImpressaoBoleto(
        CheckBox_NossoNumero.Checked,
        CheckBox_RemessaEnviada.Checked,
        CheckBox_RetirarCredito.Checked,
        ckCarne.Checked,
        CheckBox_OutrosDados.Checked) then
      begin
        ObBoleto._CommitTransaction('BOL015', 'BOLETAS', '', 'INSERIR');

        Application.MessageBox('Dados de impressão do boleto apagados com sucesso.',
          'Confirmação',
          MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        ObBoleto.dataSet.Refresh;
      end
      else
      begin
        ObBoleto.Cancel;
      end;
    except
      Application.MessageBox('Erro ao gravar registro. Se o erro persistir contacte o administrador da rede.', 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    end;

  finally
    BitBtn10.Enabled := True;
    BitBtn11.Enabled := True;
    PageControl1.ActivePage := TabSheet2;
    vDadosIni.fechaStatusProcessamento;
    if (Self.Enabled) and (Self.Visible) and (BitBtn3.CanFocus) then
    	BitBtn3.SetFocus;
    DBGrid1.SelectedIndex := 2;
  end;
end;

procedure TfrmCadBoletos.BitBtn11Click(Sender: TObject);
begin
  inherited;
  BitBtn10.Enabled := True;
  PageControl1.ActivePage := TabSheet2;
  ObBoleto.Cancel;
  if (Self.Enabled) and (Self.Visible) and (BitBtn3.CanFocus) then
    BitBtn3.SetFocus;
end;

procedure TfrmCadBoletos.BitBtn12Click(Sender: TObject);
begin
  inherited;
  ObBoleto.vTipoImpressao := Trim(Edit2.Text);
  ObBoleto.vIndicadorImpressao := RadioGroup1.ItemIndex;
  TForm(pnRemessa.Parent).ModalResult := IDOK;
end;

procedure TfrmCadBoletos.BitBtn13Click(Sender: TObject);
var
  I, J: Integer;
  vExisteContatoWhatsApp: boolean;
  vIdentificacao: string;
  vEmail: string;
  vArrayAplicativo: arrayaplicativo;
  vArrayContato: arraycontato;
  vAssuntoEmail, vMensagemEmail: string;
  vAssuntoWhatsApp, vMensagemWhatsApp: string;
begin
	try
  	J := 0;

    vAssuntoEmail := vDadosIni.vBoletos.vAssunto_bol;
    vMensagemEmail := vDadosIni.vBoletos.vMsg_bol.Text;
    vAssuntoWhatsApp := vDadosIni.vBoletos.vAssuntoWhatsApp_bol;
    vMensagemWhatsApp := vDadosIni.vBoletos.vMsgWhatsApp_bol.Text;

    if (not ckEnviarEmail.Checked) and (not ckEnviarWhatsApp.Checked) then
    begin
    	Application.MessageBox('Opção (Enviar E-mail / Enviar WhatsApp) não informada.', 'Atenção', MB_ICONINFORMATION + MB_DEFBUTTON1);
    	exit;
    end;

    if (not ckConfEmailAssunto.Checked)
    	and (ckEnviarEmail.Checked) then
    begin
      if trim(EditContatoEmail.Text) = '' then
      begin
        Application.MessageBox('E-mail não informado.', 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (EditContatoEmail.CanFocus) then
          EditContatoEmail.SetFocus;
        exit;
      end;

      if trim(EditAssuntoEmail.Text) = '' then
      begin
        Application.MessageBox('Assunto (E-mail) não informado.', 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (EditAssuntoEmail.CanFocus) then
          EditAssuntoEmail.SetFocus;
        exit;
      end;

      if trim(MemoMensagemEmail.Text) = '' then
      begin
        Application.MessageBox('Mensagem (E-mail) não informado.', 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (MemoMensagemEmail.CanFocus) then
          MemoMensagemEmail.SetFocus;
        exit;
      end;

      vIdentificacao := trim(EditContatoEmail.Text);
      vEmail := '';

      for I := 1 to Length(vIdentificacao) do
      begin
        if (vIdentificacao[I] = ';') or (vIdentificacao[I] = ',') or (vIdentificacao[I] = '|') then
        begin
          if not vDadosIni._ValidarEMail(trim(vEmail)) then
          begin
            Application.MessageBox(PChar('E-mail inválido: ' + trim(vEmail) + '.'), 'Atenção', MB_ICONWARNING + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (EditContatoEmail.CanFocus) then
              EditContatoEmail.SetFocus;
            exit;
          end
          else
            Inc(J);
          vemail := '';
        end
        else
           vemail := vemail + vIdentificacao[I];
      end;
      if not vDadosIni._ValidarEMail(trim(vEmail)) then
      begin
        Application.MessageBox(PChar('E-mail inválido: ' + trim(vEmail) + '.'), 'Atenção', MB_ICONWARNING + MB_OK);
        if (Self.Enabled) and (Self.Visible) and (EditContatoEmail.CanFocus) then
          EditContatoEmail.SetFocus;
        exit;
      end
      else
        Inc(J);
    end;

    if (not ckConfEmailAssunto.Checked)
      and (ckEnviarWhatsApp.Checked) then
    begin
      for I := 0 to CheckListContatoWhatsApp.Items.Count - 1 do
        if CheckListContatoWhatsApp.Checked[I] then
        begin
        	vIdentificacao := vDadosIni.getCampoPipe(trim(CheckListContatoWhatsApp.Items[I]), 1);

          if trim(vIdentificacao) <> '' then
            if not vDadosIni._ValidarCelular(trim(vIdentificacao)) then
            begin
              Application.MessageBox(PChar('Fone WhatsApp selecionado inválido: ' + trim(vIdentificacao)), 'Atenção', MB_ICONWARNING + MB_OK);
              if (Self.Enabled) and (Self.Visible) and (CheckListContatoWhatsApp.CanFocus) then
                CheckListContatoWhatsApp.SetFocus;
              exit;
            end
            else
            	Inc(J);

          vExisteContatoWhatsApp := True;
          Break;
        end;

      if (not vExisteContatoWhatsApp) then
      begin
        Application.MessageBox('Fone WhatsApp não informado.', 'Atenção', MB_ICONWARNING + MB_OK + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (CheckListContatoWhatsApp.CanFocus) then
          CheckListContatoWhatsApp.SetFocus;
        exit;
      end;

      if trim(MemoMensagemWhatsApp.Text) = ''  then
      begin
        Application.MessageBox('Mensagem (WhatsApp) não informado.', 'Atenção', MB_ICONWARNING + MB_OK + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (MemoMensagemWhatsApp.CanFocus) then
          MemoMensagemWhatsApp.SetFocus;
        exit;
      end;
    end;

    vDadosIni.vNaoExibirTelaConfEmailWhatsAppTemp := false;
    vDadosIni.vProcessoEnviar := 'BOL038';

    SetLength(vArrayContato, J);

    if (J > 0) then
    begin
      J := -1;
      if (not ckConfEmailAssunto.Checked)
        and (ckEnviarEmail.Checked) then
      begin
        vIdentificacao := trim(EditContatoEmail.Text);
        vEmail := '';
        for I := 1 to Length(vIdentificacao) do
          if (vIdentificacao[I] = ';') or (vIdentificacao[I] = ',') or (vIdentificacao[I] = '|') then
          begin
            if vDadosIni._ValidarEMail(trim(vEmail)) then
            begin
              Inc(J);
              vArrayContato[J].Aplicativo := cEmail;
              vArrayContato[J].Contato := '';
              vArrayContato[J].Identificacao := trim(vEmail);
              vArrayContato[J].Sel := 'S';
            end;
            vemail := '';
          end
          else
            vemail := vemail + vIdentificacao[I];
        if vDadosIni._ValidarEMail(trim(vEmail)) then
        begin
          Inc(J);
          vArrayContato[J].Aplicativo := cEmail;
          vArrayContato[J].Contato := '';
          vArrayContato[J].Identificacao := trim(vEmail);
          vArrayContato[J].Sel := 'S';
        end;
      end;
    end;

    if (not ckConfEmailAssunto.Checked)
      and (ckEnviarWhatsApp.Checked) then
    begin
      for I := 0 to CheckListContatoWhatsApp.Items.Count - 1 do
        if CheckListContatoWhatsApp.Checked[I] then
        begin
        	vIdentificacao := vDadosIni.getCampoPipe(trim(CheckListContatoWhatsApp.Items[I]), 1);

          if vDadosIni._ValidarCelular(trim(vIdentificacao)) then
          begin
            Inc(J);
            vArrayContato[J].Aplicativo := cWhatsApp;
            vArrayContato[J].Contato := '';
            vArrayContato[J].Identificacao := trim(vIdentificacao);
          end;
        end;
    end;

    vDadosIni.vBoletos.vAssunto_bol := trim(EditAssuntoEmail.Text);
    vDadosIni.vBoletos.vMsg_bol.Text := trim(MemoMensagemEmail.Text);
    vDadosIni.vBoletos.vAssuntoWhatsApp_bol := trim(EditAssuntoWhatsApp.Text);
    vDadosIni.vBoletos.vMsgWhatsApp_bol.Text := trim(MemoMensagemWhatsApp.Text);

    vArrayAplicativo := [];
    if ckEnviarEmail.Checked then
    	vArrayAplicativo := vArrayAplicativo + [cEmail];
    if ckEnviarWhatsApp.Checked then
      vArrayAplicativo := vArrayAplicativo + [cWhatsApp];

    TForm(pnEnvEmail.Parent).ModalResult := IDOK;
    if not ObBoleto._enviarMensagem(
    	true,
    	vArrayAplicativo,
      vArrayContato,
      cBoleto,
      ckConfEmailAssunto.Checked) then
      	exit;
  finally
  	vDadosIni.vBoletos.vAssunto_bol := vAssuntoEmail;
    vDadosIni.vBoletos.vMsg_bol.Text := vMensagemEmail;
    vDadosIni.vBoletos.vAssuntoWhatsApp_bol := vAssuntoWhatsApp;
    vDadosIni.vBoletos.vMsgWhatsApp_bol.Text := vMensagemWhatsApp;

  	vDadosIni.vProcessoEnviar := '';
  end;
end;

procedure TfrmCadBoletos.BitBtn14Click(Sender: TObject);
begin
   if vDadosIni.PesqPros('BOL009', 'CANCELAR', '', 'BOLETAS',
    ObBoleto.dataSet.FieldByName('N_SEQ_BOL').AsString, ObBoleto.buscas, true) then
  begin
    inherited;
    GroupBox_NossoNumeroRepetido.Enabled := false;
    GroupBox_NossoNumeroRepetido.Visible := false;
    ObBoleto.vAbortar := true;
    ObBoleto.Cancel;
    ObBoleto.RollBackTransacao;
  end;
end;

procedure TfrmCadBoletos.BitBtn15Click(Sender: TObject);
begin
  inherited;
  TForm(pnEnvEmail.Parent).ModalResult := IDCANCEL; 
end;

procedure TfrmCadBoletos.BitBtn16Click(Sender: TObject);
begin
  inherited;
  if (trim(MaskEdit4.Text) = '')
  	or (vDadosIni.apenasNumeros(trim(MaskEdit4.Text)) = '')
  	or (trim(MaskEdit4.Text) = '(  )     -    ') then
  begin
  	Application.MessageBox('Telefone não informado.', 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit4.CanFocus) then
    	MaskEdit4.SetFocus;
    exit;
  end;

  CheckListContatoWhatsApp.Items.Add(trim(MaskEdit4.Text) + ' | AVULSO ');
  CheckListContatoWhatsApp.Checked[CheckListContatoWhatsApp.Items.Count - 1] := True;

  TForm(pnTelefoneAvulso.Parent).ModalResult := IDOK;
end;

procedure TfrmCadBoletos.BitBtn17Click(Sender: TObject);
begin
  inherited;
	TForm(pnTelefoneAvulso.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadBoletos.BitBtn1Click(Sender: TObject);
var
  i: integer;
  vsqlAdicional: string;
  vCondAdcional: string;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.PesqPros('BOL001', 'PESQUISAR', '', 'BOLETAS', '',
      ObBoleto.buscas, true) then
    begin
      inherited;

      ObBoleto.rBOL.vCampo := ComboBox1.Text;
      ObBoleto.rBOL.vCondicao := ComboBox3.Text;
      ObBoleto.rBOL.vValor := trim(MaskEdit3.Text);
      ObBoleto.rBOL.vDataIni := vDadosIni.IfThen(MaskEdit1.Visible, MaskEdit1.Text, '');
      ObBoleto.rBOL.vDataFim := vDadosIni.IfThen(MaskEdit1.Visible, MaskEdit2.Text, '');

      ObBoleto.rBOL.vCampoAd := ComboBox11.Text;
      ObBoleto.rBOL.vValorAd := trim(MaskEdit7.Text);
      ObBoleto.rBOL.vDataIniAd := MaskEdit9.Text;
      ObBoleto.rBOL.vDataFimAd := MaskEdit8.Text;
      ObBoleto.rBOL.vCondicaoAd := ComboBox12.Text;
      ObBoleto.rBOL.vPorDataAd := MaskEdit9.Visible;
      ObBoleto.rBOL.vAdicional := CheckBox1.Checked;
      ObBoleto._defineSqlAdicional;


      if (MaskEdit2.Visible)
      	and (trim(ObBoleto.rBOL.vDataIni) <> '')
        and (trim(ObBoleto.rBOL.vDataFim) <> '') then
      begin
      	if (ckLixeira.Checked) and (ckLixeira.Visible) then
        begin
          if not ObBoleto.ConsultaCamposLixeira('Boletas', ComboBox1.Text,
            'N_SEQ_BOL', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 0,
            ObBoleto.Fsql_campos,
            ObBoleto.Fsql_inner,
            ObBoleto.rBOL.vSqlAdicional) then
          begin
            if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
              combobox1.setfocus
          end
          else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
          	DBGrid1.SetFocus;
        end
        else
        begin
          if not ObBoleto.ConsultaCampos('Boletas', ComboBox1.Text,
            'N_SEQ_BOL', maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
            ObBoleto.Fsql_campos,
            ObBoleto.Fsql_inner,
            ObBoleto.rBOL.vSqlAdicional) then
          begin
            if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
              combobox1.setfocus
          end
          else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
          	DBGrid1.SetFocus;
        end;
      end
      else
      begin
      	if (ckLixeira.Checked) and (ckLixeira.Visible) then
        begin
          if not ObBoleto.ConsultaCamposLixeira('Boletas', ObBoleto.rBOL.vValor, ComboBox1.Text,
            combobox3.Text, 'N_SEQ_BOL', true, vDadosIni.codEmpresa,
            ObBoleto.Fsql_campos,
            ObBoleto.Fsql_inner,
            ObBoleto.rBOL.vSqlAdicional) then
          begin
            if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
              combobox1.setfocus
          end
          else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
            DBGrid1.SetFocus;
        end
        else
        begin
          if not ObBoleto.ConsultaCampos('Boletas', ObBoleto.rBOL.vValor, ComboBox1.Text,
            combobox3.Text, 'N_SEQ_BOL', true, vDadosIni.codEmpresa,
            ObBoleto.Fsql_campos,
            ObBoleto.Fsql_inner,
            ObBoleto.rBOL.vSqlAdicional) then
          begin
            if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
              combobox1.setfocus
          end
          else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
            DBGrid1.SetFocus;
        end;
      end;

      if ckLixeira.Checked then
      begin
//        BitBtn3.Visible := false;
        SpeedButton1.Visible := false;
        SpeedButton3.Visible := false;
        SpeedButton5.Visible := true;

        SpeedButton6.Visible := false;
        SpeedButton8.Visible := false;
        SpeedButton11.Visible := false;
        SpeedButton7.Visible := false;
        SpeedButton26.Visible := false;
        SpeedButton24.Visible := false;
        SpeedButton20.Visible := false;
        SpeedButton9.Visible := false;
        SpeedButton10.Visible := false;
        SpeedButton21.Visible := false;
        SpeedButton13.Visible := false;
        SpeedButton14.Visible := false;
        SpeedButton16.Visible := false;
        SpeedButton18.Visible := false;
        SpeedButton19.Visible := false;
        SpeedButton22.Visible := false;
        SpeedButton12.Visible := false;

        if ObBoleto.StatusLixeira then
          SpeedButton25.Visible := true
        else
          SpeedButton25.Visible := false;
      end
      else
      begin
//      	BitBtn3.Visible := true;
        SpeedButton1.Visible := true;
        SpeedButton3.Visible := true;
        SpeedButton5.Visible := false;

        SpeedButton6.Visible := true;
        SpeedButton8.Visible := true;
        SpeedButton11.Visible := true;
        SpeedButton7.Visible := true;
        SpeedButton26.Visible := true;
        SpeedButton24.Visible := true;
        SpeedButton20.Visible := true;
        SpeedButton9.Visible := true;
        SpeedButton10.Visible := true;
        SpeedButton21.Visible := true;
        SpeedButton13.Visible := true;
        SpeedButton14.Visible := true;
        SpeedButton16.Visible := true;
        SpeedButton18.Visible := true;
        SpeedButton19.Visible := true;
        SpeedButton22.Visible := true;
        SpeedButton12.Visible := true;

        if ObBoleto.StatusLixeira then
          SpeedButton25.Visible := true
        else
          SpeedButton25.Visible := false;
      end;
      ObBoleto.ultimasql := ObBoleto.dataSet.CommandText;

//      SpeedButton1.Visible := true;
//      SpeedButton5.Visible := false;

      if ObBoleto.dataSet.Active then
        for I := 0 to DBGrid1.Columns.Count - 1 do
          if (DBGrid1.Columns[i].FieldName = 'OCORRENCIABANCARIA') then
            DBGrid1.Columns[i].ButtonStyle := cbsEllipsis
          else if (DBGrid1.Columns[i].FieldName = 'HTMLBOLETO') then
            DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

      if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      	DBGrid1.SetFocus;
    end;

  finally
    ObBoleto.ultimasql := ObBoleto.dataSet.CommandText;
    gravaConfiguracoesFormRegistro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadBoletos.BitBtn2Click(Sender: TObject);
begin
  inherited;
  ObBoleto.Cancel;
end;

procedure TfrmCadBoletos.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
//  if not vDadosIni.validarAcessoEmpresasUnificadas(ObBoleto.buscas) then
//  begin
//    vDadosIni.fechaStatusProcessamento;
//    Exit;
//  end;

  if not vDadosIni.validarAcessoCadastrosEmpresas('BOLETOS', 'I', ObBoleto.buscas) then
    Exit;
  if vDadosIni.PesqPros('BOL002', 'INSERIR', '', 'BOLETAS',
    '', ObBoleto.buscas, true) then
  begin
    if not ObBoleto.Insert then
      exit;
    ActiveControl := BitBtn3;
    inherited;
    GroupBox5.Caption := 'Convênio para gerar o boleto';
    ObBoleto.dataSet.FieldByName('VL_DOC_BRUTO').AsFloat := 0;
    Label_Codigo.Visible := False;
    DBEdit_Codigo.Visible := False;
    EditHw1.AsValue := 0;
    DBLookupComboBox2.KeyValue := 0;
    EditHw1.Enabled := False;
    SpeedButton104.Enabled := true;
    DBLookupComboBox2.Enabled := False;
    DBEdit1.Enabled := true;
    DBEdit_NumeroDocumento.Enabled := true;
    DBEdit_ValorTotal.Enabled := true;
    DBEdit9.Enabled := true;
    DBLookupComboBox3.Enabled := true;
    DBLookupComboBox4.Enabled := true;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := TabSheet3;
    CheckCadSeq.Checked := false;
    Label29.Enabled := false;
    Label30.Enabled := false;
    Label31.Enabled := false;
    DBEdit7.Enabled := false;
    DBEdit8.Enabled := false;
    DBEdit12.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    	DBEdit1.SetFocus;
  end;
end;

procedure TfrmCadBoletos.BitBtn4Click(Sender: TObject);
var
  vCobrebem, vn_seq_bol, AoperacaoDemaisBoletos: Integer;
  AdemaisBoletos: TDataSet_OOP;
  selecionados: RBoletosSelecionados;
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;

  Fid_demaisBoletos := '';
  ObBoleto.OnLocDemaisBoletos := localizar_demais_boletos;
  try
    if not ObBoleto.Post then
    begin
      setFocusCampoErro(ObBoleto.vNomeCampoErro, ObBoleto.vMensagemErro)
    end
    else
    begin
    // Imprimir Boleto
      if ((EditHw1.AsValue > 0) and (DBLookupComboBox2.KeyValue > 0)) then
      begin
        try
          if not ObBoleto.vCobreBem.abreCobreBem(ObBoleto.vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsString) then
          begin
            Application.MessageBox('Nenhuma configuração encontrada, favor verificar o cadastro.', 'Confirmação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
            exit;
          end;

          vDadosIni.abreStatusProcessamento('Impressão de boletos', 'Processando informações...');

          vCobrebem := ObBoleto.vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger;
          Fid_demaisBoletos := Fid_demaisBoletos + IfThen(Fid_demaisBoletos <> '', ',') + IntToStr(ObBoleto.vCodSeqBoleto);
          ObBoleto.montaselect('select ' + ObBoleto.Fsql_campos + ' from BOLETAS ' +
                               ObBoleto.Fsql_inner +
                               ' WHERE BOLETAS.N_SEQ_BOL IN (' + Fid_demaisBoletos + ') ' +
                               ' AND BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
                               ' AND COALESCE(BOLETAS.STATUS, '''') <> ''QUITADO'' ' +
                               ' ORDER BY BOLETAS.DATA_VEN_BOL');
          ObBoleto.prepare_loop();
          try
            ObBoleto.checkUnCheckAllRows(True, 'SelecionaBoleto');
            if ObBoleto.vCobreBem.dataSet.FieldByName('TIPO_API').AsString = 'S' then
            begin
            	selecionados := ObBoleto.HandleBoletos;

              if selecionados.Erros <> '' then
              begin
                ShowAtencao(selecionados.Erros);
                Exit;
              end;

              if Length(selecionados.lista) > 0 then
                ObBoleto._GerarBoletosPlugBoletos(
                	selecionados.lista);
            end
            else
            begin
	            ObBoleto._GerarBoletosDLLCobrebem;
            end;
          finally
            ObBoleto.montaSelect(ObBoleto.ultimasql);
            ObBoleto.prepare_loop_done;
            vDadosIni.fechaStatusProcessamento;
          end;

          {
          vDadosIni.abreStatusProcessamento('Impressão de boletos', 'Processando informações...');
          ObBoleto._marcaImprimirBoleto(ObBoleto.vCodSeqBoleto);
          ObBoleto._GerarBoletosDLLCobrebem;

          //ObBoleto.montaSelect(ObBoleto.ultimasql);
          ObBoleto.dataSet.Filtered := false;
          ObBoleto.Refresh;
          vDadosIni.fechaStatusProcessamento;
          }
        except
          on E: Exception do
          begin
            Application.MessageBox(pchar('Erro ao gravar registro, verifique as configurações. Se o erro persistir contacte o administrador da rede.' + E.message), 'Erro',
              MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
          end;
        end;
      end;

      if CheckCadSeq.Checked then
      begin
        EditHw1.Enabled := False;
        DBLookupComboBox2.Enabled := False;
        EditHw1.AsValue := 0;
        ObBoleto.vCobreBem.abreCobreBem(vCobrebem);

        if ObBoleto.Insert then
        	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
          	DBEdit1.SetFocus;
        MudaCor;
      end
      else begin
        inherited;
      end;
    end;
  finally
    ObBoleto.OnLocDemaisBoletos := nil;
  end;
end;

procedure TfrmCadBoletos.BitBtn5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BOL009', 'CANCELAR', '', 'BOLETAS',
    ObBoleto.dataSet.FieldByName('N_SEQ_BOL').AsString, ObBoleto.buscas, true) then
  begin
    inherited;
    ObBoleto.Cancel;
    ObBoleto.RollBackTransacao;
  end;

end;

procedure TfrmCadBoletos.BitBtn7Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BOL024', 'CANCELAR VINCULAR CREDITO', '', 'BOLETAS',
    ObBoleto.dataSet.FieldByName('N_SEQ_BOL').AsString, ObBoleto.buscas, true) then
  begin
    inherited;
    ObBoleto.Cancel;
    ObBoleto.vControleCreditos.Cancel;
//    if (cdsColunas <> nil) and (DBGrid3.DataSource <> nil) then
//	    vDadosIni.configuraChecks(TClientDataSet(DBGrid3.DataSource.DataSet), self);
//    vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid3, GridCfg, true, ListPositions, cdsGrid);
  	if Assigned(DBGrid3.DataSource) and Assigned(DBGrid3.DataSource.DataSet) then
    begin
//      if not PrimeiraPesquisa then
        vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid3, GridCfg2, cdsGrid2,
        	cdsColunas2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
//      vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid3, GridCfg, true, ListPositions, cdsGrid);
    end;

    PageControl1.ActivePage := TabSheet2;
    DBGrid1.SelectedIndex := 2;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadBoletos.BitBtn8Click(Sender: TObject);
var
  vCtrlBol, vCtrlDoc: string;
begin
  inherited;
  try
    try
      if not (vDadosIni.PesqPros('BOL023', 'INCLUIR NOSSO NUMERO CREDITO', '', 'BOLETAS',
        ObBoleto.dataSet.FieldByName('N_SEQ_BOL').AsString, ObBoleto.buscas, true)) then
      begin
        exit;
      end;
      ObBoleto.vCobreBem.abreCobreBem(IntToStr(ObBoleto.dataSet.FieldByName('cod_cobrebem').AsInteger));
      if (ObBoleto.vCobreBem.dataSet.FieldByName('codigo_ctrl').AsInteger <>
        ObBoleto.vControleCreditos.dataSet.FieldByName('codigo_ctrl').AsInteger) then
      begin
        vCtrlBol := ObBoleto.retornaValor('select nome_ctrl as valor from controles' +
          ' where codigo_ctrl = ' +
          IntToStr(ObBoleto.vCobreBem.dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
          ' and codigo_emp = ' + vDadosIni.codEmpresa);
        vCtrlDoc := ObBoleto.retornaValor('select nome_ctrl as valor from controles' +
          ' where codigo_ctrl = ' +
          IntToStr(ObBoleto.vControleCreditos.dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
          ' and codigo_emp = ' + vDadosIni.codEmpresa);
        Application.MessageBox(pchar('O controle do boleto não corresponde ao controle do Documento do Financeiro!' + #13 +
          'Controle do Boleto: ' + ObBoleto.vCobreBem.dataSet.FieldByName('CODIGO_CTRL').AsString +
          ' ' + vCtrlBol + #13 +
          'Controle do Documento: ' +
          ObBoleto.vControleCreditos.dataSet.FieldByName('CODIGO_CTRL').AsString + ' ' + vCtrlDoc +
          #13 +
          'Código do Documento: ' +
          Trim(ObBoleto.vControleCreditos.dataSet.FieldByName('COD_CRED').AsString) + #13 +
          'Numero do Documento: ' +
          Trim(ObBoleto.vControleCreditos.dataSet.FieldByName('N_DOC_C').AsString) + #13 +
          'Vencimento do Documento: ' +
          Trim(ObBoleto.vControleCreditos.dataSet.FieldByName('DATA_VENC_C').AsString) + #13 +
          'Valor do Documento: ' + Format('%0.2m',
          [ObBoleto.vControleCreditos.dataSet.FieldByName('VALOR_C').AsFloat]) + #13 +
          'Nome do Cliente: ' +
          Trim(ObBoleto.vControleCreditos.dataSet.FieldByName('NOME_C').AsString)),
          'Atenção', 0 + 64);
        Exit;
      end;

      if (trim(ObBoleto.vControleCreditos.dataSet.FieldByName('nosso_numero_banco').AsString) <> '')
        then
      begin
        if not
          (Application.MessageBox('Este crédito já possuí um Nosso Numero, tem certeza que alterar o registro?',
          'Alterar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes) then
        begin
          exit;
        end;
      end;

      if (vDadosIni.StrToFloatFormat(ObBoleto.dataSet.FieldByName('VL_DOC_BOL').AsFloat, 2) <>
        vDadosIni.StrToFloatFormat(ObBoleto.vControleCreditos.dataSet.FieldByName('VALOR_C').AsFloat, 2)) then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';

        if not vDadosIni.PesqPros('BOL027', 'LIBERAR', '',
          'BOLETAS', ObBoleto.dataSet.FieldByName('N_SEQ_BOL').AsString, ObBoleto.buscas, true) then
        begin
          Application.MessageBox(pchar('Valor do boleto difere do crédito selecionado' + #13 +
            'Processo [BOL027]'), 'Atenção', 0 + 64);
          Exit;
        end
        else
        begin
          if
            Application.MessageBox('Valor do boleto difere do crédito selecionado. Deseja continuar mesmo assim?',
            'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
            exit;
          vDadosIni.GravaAuditoria('BOL027', 'LIBERADO',
            'VAL BOL: ' + ObBoleto.dataSet.FieldByName('VL_DOC_BOL').AsString +
            'VAL CRED: ' + ObBoleto.vControleCreditos.dataSet.FieldByName('VALOR_C').AsString,
            'BOLETAS',
            ObBoleto.dataSet.FieldByName('N_SEQ_BOL').AsString, ObBoleto.buscas);
        end;
      end;

      if (ObBoleto.dataSet.FieldByName('DATA_VEN_BOL').AsDateTime <>
      	ObBoleto.vControleCreditos.dataSet.FieldByName('DATA_VENC_C').AsDateTime) then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';

        if not vDadosIni.PesqPros('BOL039', 'LIBERAR', '',
          'BOLETAS', ObBoleto.dataSet.FieldByName('N_SEQ_BOL').AsString, ObBoleto.buscas, true) then
        begin
          Application.MessageBox(pchar('Data de vencimento do boleto difere do crédito selecionado' + #13 +
            'Processo [BOL039]'), 'Atenção', 0 + 64);
          Exit;
        end
        else
        begin
          if
            Application.MessageBox('Data de vencimento do boleto difere do crédito selecionado. Deseja continuar mesmo assim?',
            'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
            exit;
          vDadosIni.GravaAuditoria('BOL039', 'LIBERADO',
            'DATA VENC BOL: ' + FormatDateTime('dd/mm/yyyy', ObBoleto.dataSet.FieldByName('DATA_VEN_BOL').AsDateTime) +
            'DATA VENC CRED: ' + FormatDateTime('dd/mm/yyyy', ObBoleto.vControleCreditos.dataSet.FieldByName('DATA_VENC_C').AsDateTime),
            'BOLETAS',
            ObBoleto.dataSet.FieldByName('N_SEQ_BOL').AsString, ObBoleto.buscas);
        end;
      end;

      if (ObBoleto.vControleCreditos._VincularCreditoBoleto(
        ObBoleto.dataSet.FieldByName('nosso_numero_banco').AsString,
        ObBoleto.dataSet.FieldByName('cod_cobrebem').AsInteger)) then
      begin
        Application.MessageBox(pchar(
          'O Boleto foi vinculado ao crédito com sucesso'), 'Atenção', 0 + 64);
      end;

    except
      on E: Exception do begin
        MessageDlg('Ocorreu um erro na tentativa de atualizar os créditos: ' + E.Message, mtError,
          [mbOK], 0);
      end;
    end;
  finally
    ObBoleto.Cancel;
    ObBoleto.vControleCreditos.Cancel;
//    if (cdsColunas <> nil) and (DBGrid3.DataSource <> nil) then
//	    vDadosIni.configuraChecks(TClientDataSet(DBGrid3.DataSource.DataSet), self);
//    vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid3, GridCfg, true, ListPositions, cdsGrid);
    if Assigned(DBGrid3.DataSource) and Assigned(DBGrid3.DataSource.DataSet) then
    begin
//      if not PrimeiraPesquisa then
        vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid3, GridCfg2, cdsGrid2,
        	cdsColunas2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
//      vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid3, GridCfg, true, ListPositions, cdsGrid);
    end;

    PageControl1.ActivePage := TabSheet2;
  end;
end;

procedure TfrmCadBoletos.BitBtn9Click(Sender: TObject);
begin
  inherited;
  TForm(pnRemessa.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadBoletos.BitBtn_OKCobrebemClick(Sender: TObject);
var
	vSel: Boolean;
	I: Integer;
begin
  vSel := False;

  if FrameCheckListaContato.CheckListBoxAplicativo.Visible then
  begin
  	 for I := 0 to FrameCheckListaContato.CheckListBoxAplicativo.Items.Count - 1 do
      if FrameCheckListaContato.CheckListBoxAplicativo.Checked[I] then
      begin
        vSel := True;
        Break;
      end;
  end
  else
  begin
    for I := 0 to FrameCheckListaContato.CheckListBoxContato.Items.Count - 1 do
      if FrameCheckListaContato.CheckListBoxContato.Checked[I] then
      begin
        vSel := True;
        Break;
      end;
  end;

  if (not ckImprimirBoleto.Checked) and (not ckEnviarBoleto.Checked) then
  begin
    Application.MessageBox('Ação (IMPRIMIR/ENVIAR) não informada.',
    	'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (ckImprimirBoleto.CanFocus) then
       ckImprimirBoleto.SetFocus;
    Exit;
  end;

  if (ckEnviarBoleto.Visible) and (ckEnviarBoleto.Checked) then
  begin
    if FrameCheckListaContato.CheckListBoxAplicativo.Visible then
    begin
     if (not vSel) then
      begin
        Application.MessageBox(PChar('Forma de envio (' + vDadosIni.retornaNomesAplicativo(FrameCheckListaContato.CheckListBoxAplicativo) + ') não informada.'),
          'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (FrameCheckListaContato.CheckListBoxAplicativo.CanFocus) then
           FrameCheckListaContato.CheckListBoxAplicativo.SetFocus;
        exit;
      end;
    end
    else
    begin
      if (not vSel) then
      begin
        Application.MessageBox('Contato não informado.',
          'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (FrameCheckListaContato.CheckListBoxContato.CanFocus) then
           FrameCheckListaContato.CheckListBoxContato.SetFocus;
        exit;
      end;
    end;
  end;

  if vDadosIni.IfThen(DBLookupComboBox1.KeyValue = Null, 0, DBLookupComboBox1.KeyValue) <= 0 then
  begin
  	Application.MessageBox('Convênio não informado.',
    	'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

  TForm(pnSelecionarConvenio.Parent).ModalResult := IDOK;
end;

procedure TfrmCadBoletos.BitBtn_ProximoNumeroClick(Sender: TObject);
begin
  inherited;
  ObBoleto.vAbortar := true;
  GroupBox_NossoNumeroRepetido.Enabled := false;
  GroupBox_NossoNumeroRepetido.Visible := false;

  vDadosIni.GravaAuditoria('BOL017', 'INSERIR', 'SUCESSO', 'BOLETAS',
    ObBoleto.dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString,
    ObBoleto.buscas);
end;

procedure TfrmCadBoletos.BitBtn_VoltarCobrebemClick(Sender: TObject);
begin
  inherited;
  BitBtn_OKCobrebem.Enabled := True;
  GroupBox_SelecionaContaBoleto.Enabled := True;
  TForm(pnSelecionarConvenio.Parent).ModalResult := IDCANCEL;
//  PageControl1.ActivePage := TabSheet2;
  ObBoleto.vVoltarImpressaoBoleto := true;
  BorderIcons := [biMinimize, biMaximize, biSystemMenu];
  ObBoleto.vAbortar := false;
  GroupBox6.Visible := False;
  Panel4.Visible := False;
  ObBoleto.vVoltarImpressaoBoleto := false;
  ObBoleto.Cancel;
  if (Self.Enabled) and (Self.Visible) and (BitBtn3.CanFocus) then
    BitBtn3.SetFocus;
end;

procedure TfrmCadBoletos.btSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
  	ObBoleto._SelecionaTodosBoletos;

  finally
  	Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadBoletos.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
  	ObBoleto._DesmarcaTodosBoletos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadBoletos.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
    groupAdicional.Visible := CheckBox1.Checked
  else
    groupAdicional.Visible := not CheckBox1.Checked;

  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;
  if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
  	ComboBox11.SetFocus;
end;


procedure TfrmCadBoletos.CheckBox_NossoNumeroClick(Sender: TObject);
begin
  inherited;
  if CheckBox_NossoNumero.Checked then
  begin
    CheckBox_OutrosDados.Visible := true;
    CheckBox_OutrosDados.Checked := true;
  end
  else
  begin
    CheckBox_OutrosDados.Visible := false;
    CheckBox_OutrosDados.Checked := false;
  end;
end;

procedure TfrmCadBoletos.CheckBox_RetirarCreditoClick(Sender: TObject);
begin
  inherited;
  if not (vDadosIni.PesqPros('BOL022', 'RETIRAR NOSSO NUMERO CREDITO', '', 'BOLETAS',
    ObBoleto.dataSet.FieldByName('N_SEQ_BOL').AsString, ObBoleto.buscas, true)) then
  begin
    CheckBox_RetirarCredito.Checked := false;
  end;
end;

procedure TfrmCadBoletos.ckConfEmailAssuntoClick(Sender: TObject);
begin
	lbContatoEmail.Enabled := (ckEnviarEmail.Checked) and (not ckConfEmailAssunto.Checked);
  EditContatoEmail.Enabled := (ckEnviarEmail.Checked) and (not ckConfEmailAssunto.Checked);
  lbAssuntoEmail.Enabled := (ckEnviarEmail.Checked) and (not ckConfEmailAssunto.Checked);
  EditAssuntoEmail.Enabled := (ckEnviarEmail.Checked) and (not ckConfEmailAssunto.Checked);
  lbMensagemEmail.Enabled := (ckEnviarEmail.Checked) and (not ckConfEmailAssunto.Checked);
  MemoMensagemEmail.Enabled := (ckEnviarEmail.Checked) and (not ckConfEmailAssunto.Checked);

  lbContatoWhatsApp.Enabled := (ckEnviarWhatsApp.Checked) and (not ckConfEmailAssunto.Checked);
  CheckListContatoWhatsApp.Enabled := (ckEnviarWhatsApp.Checked) and (not ckConfEmailAssunto.Checked);
  lbAssuntoWhatsApp.Enabled := (ckEnviarWhatsApp.Checked) and (not ckConfEmailAssunto.Checked);
  EditAssuntoWhatsApp.Enabled := (ckEnviarWhatsApp.Checked) and (not ckConfEmailAssunto.Checked);
  lbMensagemWhatsApp.Enabled := (ckEnviarWhatsApp.Checked) and (not ckConfEmailAssunto.Checked);
  MemoMensagemWhatsApp.Enabled := (ckEnviarWhatsApp.Checked) and (not ckConfEmailAssunto.Checked);
  SpeedButtonAdcWhatsApp.Enabled := (ckEnviarWhatsApp.Checked) and (not ckConfEmailAssunto.Checked);
  SpeedButtonRemWhatsApp.Enabled := (ckEnviarWhatsApp.Checked) and (not ckConfEmailAssunto.Checked);
end;

procedure TfrmCadBoletos.ckConfEmailWhatsAppAssuntoClick(Sender: TObject);
begin
  inherited;
	ckUnicoEmailWhatsApp.Enabled := not ckConfEmailWhatsAppAssunto.Checked;
end;

procedure TfrmCadBoletos.ckImprimirBoletoClick(Sender: TObject);
begin
  inherited;
  if (ckImprimirBoleto.Visible) and (ckEnviarBoleto.Visible) then
    if (not ckImprimirBoleto.Checked) then
      ckEnviarBoleto.Checked := true;
end;

procedure TfrmCadBoletos.ckEnviarBoletoClick(Sender: TObject);
begin
  inherited;
  if (ckImprimirBoleto.Visible) and (ckEnviarBoleto.Visible) then
    if (not ckEnviarBoleto.Checked) then
      ckImprimirBoleto.Checked := true;

  FrameCheckListaContato.GroupBoxContato.Visible := (ckEnviarBoleto.Visible) and (ckEnviarBoleto.Checked);

  FrameCheckListaContato.CheckListBoxContato.Visible := FrameCheckListaContato.GroupBoxContato.Visible;

  pnSelecionarConvenio.Height := vDadosIni.IfThen(FrameCheckListaContato.GroupBoxContato.Visible, 241, 146);

  ckConfEmailWhatsAppAssunto.Enabled := (ckEnviarBoleto.Visible) and (ckEnviarBoleto.Checked);

  ckUnicoEmailWhatsApp.Enabled := (ckEnviarBoleto.Visible) and (ckEnviarBoleto.Checked);

  if not ckConfEmailWhatsAppAssunto.Enabled then
    ckConfEmailWhatsAppAssunto.Checked := False;
  if not ckUnicoEmailWhatsApp.Enabled then
  	 ckUnicoEmailWhatsApp.Checked := False;
end;

procedure TfrmCadBoletos.ckEnviarEmailClick(Sender: TObject);
begin
  inherited;
	if not ckEnviarEmail.Enabled then
  	Exit;

  lbContatoEmail.Enabled := (ckEnviarEmail.Checked) and (not ckConfEmailAssunto.Checked);
  EditContatoEmail.Enabled := (ckEnviarEmail.Checked) and (not ckConfEmailAssunto.Checked);
  lbAssuntoEmail.Enabled := (ckEnviarEmail.Checked) and (not ckConfEmailAssunto.Checked);
  EditAssuntoEmail.Enabled := (ckEnviarEmail.Checked) and (not ckConfEmailAssunto.Checked);
  lbMensagemEmail.Enabled := (ckEnviarEmail.Checked) and (not ckConfEmailAssunto.Checked);
  MemoMensagemEmail.Enabled := (ckEnviarEmail.Checked) and (not ckConfEmailAssunto.Checked);
end;

procedure TfrmCadBoletos.ckEnviarWhatsAppClick(Sender: TObject);
begin
  inherited;
  if not ckEnviarWhatsApp.Enabled then
  	Exit;

  lbContatoWhatsApp.Enabled := (ckEnviarWhatsApp.Checked) and (not ckConfEmailAssunto.Checked);
  CheckListContatoWhatsApp.Enabled := (ckEnviarWhatsApp.Checked) and (not ckConfEmailAssunto.Checked);
  SpeedButtonAdcWhatsApp.Enabled := (ckEnviarWhatsApp.Checked) and (not ckConfEmailAssunto.Checked);
  SpeedButtonRemWhatsApp.Enabled := (ckEnviarWhatsApp.Checked) and (not ckConfEmailAssunto.Checked);
  lbAssuntoWhatsApp.Enabled := (ckEnviarWhatsApp.Checked) and (not ckConfEmailAssunto.Checked);
  EditAssuntoWhatsApp.Enabled := (ckEnviarWhatsApp.Checked) and (not ckConfEmailAssunto.Checked);
  lbMensagemWhatsApp.Enabled := (ckEnviarWhatsApp.Checked) and (not ckConfEmailAssunto.Checked);
  MemoMensagemWhatsApp.Enabled := (ckEnviarWhatsApp.Checked) and (not ckConfEmailAssunto.Checked);
end;

procedure TfrmCadBoletos.ckLixeiraClick(Sender: TObject);
begin
  if not ckLixeira.Enabled then
  	exit;

  if ckLixeira.Checked then
    frmCadBoletos.Caption := 'Boletos (Lixeira)'
  else
    frmCadBoletos.Caption := 'Boletos';
  BitBtn1Click(Sender);
end;

procedure TfrmCadBoletos.ckUnicoEmailWhatsAppClick(Sender: TObject);
begin
  FrameCheckListaContato.UnicoMens := (ckUnicoEmailWhatsApp.Enabled) and (ckUnicoEmailWhatsApp.Visible) and (ckUnicoEmailWhatsApp.Checked);

  FrameCheckListaContato.carregarContatoAplicativo;

  ckConfEmailWhatsAppAssunto.Enabled := not ckUnicoEmailWhatsApp.Checked;
end;

procedure TfrmCadBoletos.ComboBox11Exit(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  ComboBox11.Text := ComboBox11.Items[ComboBox11.ItemIndex];
  if ComboBox11.Text = '' then
  begin
  	if ComboBox11.ItemIndex<0 then
      ComboBox11.ItemIndex := ComboBox11.Items.Count - 1;
  	if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    	ComboBox11.SetFocus;
    exit;
  end;

  if DBGrid1.DataSource <> nil then
    for I := 0 to DBGrid1.DataSource.dataSet.Fields.Count - 1 do
    begin
      if DBGrid1.DataSource.dataSet.Fields.Fields[i].DisplayLabel = ComboBox11.Text then
      begin
        vCampoAdcional := DBGrid1.DataSource.dataSet.Fields.Fields[i].FieldName;

        if DBGrid1.DataSource.dataSet.Fields.Fields[i] is TDateTimeField then
        begin
          MaskEdit7.Visible := false;
          MaskEdit9.Visible := true;
          MaskEdit8.Visible := true;
          if MaskEdit9.Text = '  /  /    ' then
            MaskEdit9.Text := DateToStr(Date);
          if MaskEdit8.Text = '  /  /    ' then
            MaskEdit8.Text := DateToStr(Date);
        end
        else
        begin
          MaskEdit7.Visible := true;
          MaskEdit9.Visible := false;
          MaskEdit8.Visible := false;
        end;
      end;
    end;
end;

procedure TfrmCadBoletos.BitBtn_ImprimirPreImpressoClick(Sender: TObject);
var
  BoletoSelectionado: Integer;
begin
  try
    try
      inherited;
      BitBtn_VoltarPreImpresso.Enabled := false;

      if ((DBEdit_CodigoBAnco.Text = '') or (DBLookupComboBox_BancoPreImpresso.Text = '')) then
      begin
        ShowMessage('Selecione um banco');
        DBEdit_CodigoBAnco.Text := '';
        BitBtn_VoltarPreImpresso.Enabled := true;
        Exit;
      end;

      BoletoSelectionado := 0;

      ObBoleto.dataSet.First;
      while not ObBoleto.dataSet.Eof do
      begin
        if ObBoleto.dataSet.FieldByName('SelecionaBoleto').Value = 'S' then
        begin
          BoletoSelectionado := 1;
        end;
        ObBoleto.dataSet.Next;
      end;

      if (BoletoSelectionado = 0) then
      begin
        Application.MessageBox('Selecione o(s) boleto(s) que deseja imprimir.',
          'Atenção', 0 + 64);
        BitBtn_VoltarPreImpresso.Enabled := true;
        exit;
      end;

      vDadosIni.abreStatusProcessamento('Impressão de boletos', 'Processando informações...');

      ObBoleto.ImprimeBoletoPreImpresso;
      PageControl1.ActivePage := TabSheet2;
    except
      Application.MessageBox(pchar('Verifique a configuração, se o erro persistir contacte o administrador da rede'), 'Atenção ... ERRO INESPERADO', MB_ICONERROR +
        MB_OK);
      ObBoleto.Cancel;
      vDadosIni.GravaAuditoria('BOL010', 'PRE IMPRESSO', 'FALHA', 'BOLETAS',
        '', ObBoleto.buscas);
      PageControl1.ActivePage := TabSheet2;
      BitBtn_VoltarPreImpresso.Enabled := true;
    end;
    BitBtn_VoltarPreImpresso.Enabled := true;
    DBGrid1.SelectedIndex := 2;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmCadBoletos.BitBtn_AbordarCobrebemClick(Sender: TObject);
begin
  inherited;
  ObBoleto.vAbortar := true;
  vDadosIni.GravaAuditoria('BOL019', 'ABORDAR', 'SUCESSO', 'BOLETAS',
    '', ObBoleto.buscas);
  ObBoleto.Cancel;
  BitBtn_OKCobrebem.Enabled := True;
  BitBtn_VoltarCobrebem.Enabled := true;
  GroupBox_SelecionaContaBoleto.Enabled := True;
  PageControl1.ActivePage := TabSheet2;
  Screen.Cursor := crDefault;
end;

procedure TfrmCadBoletos.BitBtn_DadosBoleto_OKClick(Sender: TObject);
begin
  inherited;
  if ObBoleto.vCobreBem.dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString <> 'S' then
    if ObBoleto.setNossoNumeroBoleto(Edit1.Text) then
      ObBoleto.vAbortar := true;

end;

procedure TfrmCadBoletos.BitBtn_InativarBoletoClick(Sender: TObject);
begin
  inherited;
  try
    ObBoleto.vBoletoNossoNumeroRepetido.ExecutaComandosSql(
      ' UPDATE BOLETAS SET STATUS = ''INATIVO'' WHERE NOSSO_NUMERO_BANCO = ' +
      QuotedStr(ObBoleto.vBoletoNossoNumeroRepetido.dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString) +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa);

    obboleto.vVoltarImpressaoBoleto := true;

    vDadosIni.GravaAuditoria('BOL016', 'INSERIR', 'SUCESSO', 'BOLETAS',
      ObBoleto.dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString,
      ObBoleto.buscas);

  except
    on e: exception do
    begin
      Application.MessageBox(pchar(e.Message), 'Atenção ... ERRO INESPERADO', MB_ICONERROR +
        MB_OK);
      ObBoleto.Cancel;
      vDadosIni.GravaAuditoria('BOL016', 'INSERIR', 'FALHA', 'BOLETAS',
        ObBoleto.dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString,
        ObBoleto.buscas);
      raise Exception.Create('Erro ao inativar Nosso Número.');
      ObBoleto.RollBackTransacao;
      ObBoleto.vVerificarErro := true;
      BitBtn_VoltarCobrebemClick(Sender);
    end;
  end;
  GroupBox_NossoNumeroRepetido.Enabled := false;
  GroupBox_NossoNumeroRepetido.Visible := false;
  ObBoleto.vAbortar := true;
end;

procedure TfrmCadBoletos.DBEdit_NomeClienteEnter(Sender: TObject);
begin
  inherited;
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadBoletos.DBEdit_CodigoBAncoExit(Sender: TObject);
begin
  inherited;
  if TDbedit(sender).text <> '' then
  begin
    if DtmBoletos.dsPesqBanco.DataSet.RecordCount > 0 then
      ObBoleto.vPesqBanco._PesquisaBanco(ObBoleto.vBanco.dataSet.FieldByName('COD_BANCO').Asstring);
  end;
end;

procedure TfrmCadBoletos.DBEdit_CodigoBAncoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
  begin
    ObBoleto.vBanco.dataSet.FieldByName('COD_BANCO').asString :=
      vDadosIni.pesquisaRapida('CODIGO_BANCO');
  end;

end;

procedure TfrmCadBoletos.DBEdit_ValorTotalEnter(Sender: TObject);
begin
  inherited;
  {Tratar a edição com ponto da erro}
  if (pos('.', TDBEdit(Sender).EditText) > 0) then
    TDBEdit(Sender).EditText := StringReplace(TDBEdit(Sender).EditText, '.', '', [rfReplaceAll]);
end;

procedure TfrmCadBoletos.DBEdit_ValorTotalExit(Sender: TObject);
begin
  inherited;
  if not (ObBoleto.dataSet.State in [dsInsert, dsEdit]) then
  	exit;
    
  if ObBoleto.dataSet.FieldByName('VL_DESC_BOL').AsFloat > 0 then
  begin
  	ObBoleto.dataSet.FieldByName('VL_DOC_BOL').AsFloat :=
    	ObBoleto.dataSet.FieldByName('VL_DOC_BRUTO').AsFloat -
      	ObBoleto.dataSet.FieldByName('VL_DESC_BOL').AsFloat;
  end
  else
  begin
  	ObBoleto.dataSet.FieldByName('VL_DOC_BOL').AsFloat :=
    	ObBoleto.dataSet.FieldByName('VL_DOC_BRUTO').AsFloat;
    ObBoleto.dataSet.FieldByName('VL_DESC_BOL').AsFloat := 0;
  end;
end;

procedure TfrmCadBoletos.DBEdit_ValorTotalKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (pos(',', TDBEdit(Sender).EditText) > 0) and (key = ',') then
    key := #0;
end;

procedure TfrmCadBoletos.DBEdit_MoraDiariaEnter(Sender: TObject);
begin
  inherited;
  {Tratar a edição com ponto da erro}
  if (pos('.', TDBEdit(Sender).EditText) > 0) then
    TDBEdit(Sender).EditText := StringReplace(TDBEdit(Sender).EditText, '.', '', [rfReplaceAll]);
end;

procedure TfrmCadBoletos.DBEdit_MoraDiariaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (pos(',', TDBEdit(Sender).EditText) > 0) and (key = ',') then
    key := #0;
end;

procedure TfrmCadBoletos.DBEdit_MultaEnter(Sender: TObject);
begin
  inherited;
  {Tratar a edição com ponto da erro}
  if (pos('.', TDBEdit(Sender).EditText) > 0) then
    TDBEdit(Sender).EditText := StringReplace(TDBEdit(Sender).EditText, '.', '', [rfReplaceAll]);
end;

procedure TfrmCadBoletos.DBEdit_MultaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (pos(',', TDBEdit(Sender).EditText) > 0) and (key = ',') then
    key := #0;
end;

procedure TfrmCadBoletos.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
  begin
    ObBoleto.dataSet.FieldByName('COD_NF').asString := vDadosIni.pesquisaRapida('NOTAFISCAL',
      ' and notafiscal.natureza_nf = ''S''', 'Consulta de Notas Fiscais de Saída');

    if ObBoleto.dataSet.FieldByName('COD_NF').AsInteger <= 0 then
    exit;

    ObBoleto.buscas.Close;
    ObBoleto.buscas.SQL.Text := 'select cod_nf, num_nf, serie, situacao_nfe, modelo_nf from notafiscal ' +
        ' where cod_nf = ' + IntToStr(ObBoleto.dataSet.FieldByName('COD_NF').AsInteger) +
        ' and natureza_nf = ''S'' and cod_empresa = ' + vDadosIni.codEmpresa;
    ObBoleto.buscas.Prepare;
    ObBoleto.buscas.Open;

     if not ObBoleto.buscas.IsEmpty then
     begin
        if ((ObBoleto.buscas.FieldByName('SITUACAO_NFE').AsString = 'Autorizada')
        and (trim(ObBoleto.buscas.FieldByName('MODELO_NF').AsString) = '55'))
        or  (trim(ObBoleto.buscas.FieldByName('MODELO_NF').AsString) <> '55')  then
           ObBoleto.dataSet.FieldByName('NF_AUT').AsString := 'S'
        else if (trim(ObBoleto.buscas.FieldByName('MODELO_NF').AsString) = '55') then
           ObBoleto.dataSet.FieldByName('NF_AUT').Value := Null;

       ObBoleto.dataSet.FieldByName('COD_NF').AsInteger := ObBoleto.buscas.FieldByName('COD_NF').AsInteger;
       ObBoleto.dataSet.FieldByName('NUM_NF_VND').AsInteger := ObBoleto.buscas.FieldByName('NUM_NF').AsInteger;
       ObBoleto.dataSet.FieldByName('SUB_SERIE').AsString := ObBoleto.buscas.FieldByName('SERIE').AsString;
       ObBoleto.dataSet.FieldByName('TIPO_EMISSAO').AsString := 'NF';
     end;
  end;
end;

procedure TfrmCadBoletos.DBEdit9Exit(Sender: TObject);
begin
  inherited;
  if ObBoleto.dataSet.FieldByName('COD_CLIENTE').AsString <> '' then
  begin
    ObBoleto.vCliente.selecionaCliente(ObBoleto.dataSet.FieldByName('COD_CLIENTE').AsString);
  end;

end;

procedure TfrmCadBoletos.DBEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
  begin
    ObBoleto.dataSet.FieldByName('Cod_Cliente').asString := vDadosIni.pesquisaRapida('Clientes');
    Edit1.Text := '';
  end;

end;

procedure TfrmCadBoletos.DBGrid1CellClick(Column: TColumn);
//var
//int : integer;
begin

  inherited;
  //int := 1;
  if Column.FieldName = 'SelecionaBoleto' then
    ObBoleto._marcaDesmarcaLinha;
end;

procedure TfrmCadBoletos.DBGrid1ColEnter(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedField.FieldName = 'OCORRENCIABANCARIA' then
    DBGrid1.Options := DBGrid1.Options + [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'HTMLBOLETO' then
    DBGrid1.Options := DBGrid1.Options + [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'SelecionaBoleto' then
    DBGrid1.Options := DBGrid1.Options - [dgEditing];
end;

procedure TfrmCadBoletos.DBGrid1ColExit(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedField.FieldName = 'OCORRENCIABANCARIA' then
    DBGrid1.Options := DBGrid1.Options - [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'HTMLBOLETO' then
    DBGrid1.Options := DBGrid1.Options - [dgEditing];

  //if DBGrid1.SelectedField.FieldName = DBCheckBox_SelecionaBoleto.DataField then
//    DBCheckBox_SelecionaBoleto.Visible := False
end;

procedure TfrmCadBoletos.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  ObBoleto._marcaDesmarcaLinha;
end;

procedure TfrmCadBoletos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  //  if (conta.Docs = 'S1') and
  //    ((Column.FieldName = 'DATA_VENC') and
  //    ((conta.dataSet.FieldByName('DATA_VENC').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros) < vDtDia) and
  //    (Trim(conta.dataSet.FieldByName('STATUS_CH').AsString) <> 'QUITADO')) then
  //  begin
  //    TDBGrid(sender).Canvas.Brush.Color := clRed;
  //    TDBGrid(sender).Canvas.FillRect(Rect);
  //    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  //  end
  //  else if (conta.Docs = 'S2') and
  //    ((Column.FieldName = 'DATA_VENC_C') and
  //    ((conta.dataSet.FieldByName('DATA_VENC_C').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros) < vDtDia) and
  //    (Trim(conta.dataSet.FieldByName('STATUS_C').AsString) <> 'QUITADO')) then
  //  begin
  //    TDBGrid(sender).Canvas.Brush.Color := clRed;
  //    TDBGrid(sender).Canvas.FillRect(Rect);
  //    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  //  end;

  if ObBoleto.dataSet.FieldByName('SelecionaBoleto').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SelecionaBoleto' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

    DBGrid1.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(DBGrid1.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmCadBoletos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if Key = VK_SPACE then
    if not ObBoleto.dataSet.IsEmpty then
      ObBoleto._marcaDesmarcaLinha;

end;

procedure TfrmCadBoletos.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  //inherited;
  //if (DBGrid1.SelectedField.FieldName = DBCheckBox_SelecionaBoleto.DataField) then
  //begin
  //  if (Self.Enabled) and (Self.Visible) and (DBCheckBox_SelecionaBoleto.CanFocus) then
  //    DBCheckBox_SelecionaBoleto.SetFocus;
  //  SendMessage(DBCheckBox_SelecionaBoleto.Handle, WM_Char, word(Key), 0);
  //end;
end;

procedure TfrmCadBoletos.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    ObBoleto._marcaDesmarcaLinha;
end;

procedure TfrmCadBoletos.DBGrid3ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
//var
//  i:integer;
begin
//  for I := 0 to DBGrid3.Columns.Count - 1 do
//    DBGrid3.Columns[i].Title.Font.Style := [];
//  DBGrid3.Columns[ToIndex].Title.Font.Style := [fsBold];
//  vDadosIni.gravaConfiguracaoUsuario(cdsColunas, DBGrid3, vDadosIni.vNomeUsuario, 'cdsControleCreditos', self, ScrollBoxConfCol, trans);
	vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid3, GridCfg2, cdsGrid2,
		cdsColunas2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TfrmCadBoletos.DBGrid3DblClick(Sender: TObject);
begin
  inherited;
  BitBtn8Click(Sender);

end;

procedure TfrmCadBoletos.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    BitBtn8Click(Sender);
end;

procedure TfrmCadBoletos.DBGrid3TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid3, Column);
end;

procedure TfrmCadBoletos.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  if trim(DBLookupComboBox2.Text) = '' then
  begin
    Application.MessageBox('O campo Configuração a ser impressa não pode ser vazio.', 'Atenção',
      MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    exit;
  end;

  EditHw1.AsValue := DBLookupComboBox2.KeyValue;

  if ObBoleto.vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsFloat > 0 then
  begin
    DBEdit10.Field.AsString := ObBoleto.vCobreBem.dataSet.FieldByName('LOCAL_PAG').AsString;
    DBEdit_MoraDiaria.Field.AsFloat := ObBoleto.vCobreBem.dataSet.FieldByName('TX_JUROS').AsFloat / 30;
    DBEdit_Multa.Field.AsFloat := ObBoleto.vCobreBem.dataSet.FieldByName('MULTAS').AsFloat;
    DBEdit6.Field.AsString := ObBoleto.vCobreBem.dataSet.FieldByName('OBS_BOL').AsString;
    DBMemo1.Field.AsString := ObBoleto.vCobreBem.dataSet.FieldByName('MENSAGEM_BOL').AsString;
  end;
end;

procedure TfrmCadBoletos.DBLookupComboBox_BancoPreImpressoDropDown(Sender: TObject);
begin
  inherited;
  DtmBoletos.qrPesqBanco.Active := false;
  DtmBoletos.qrPesqBanco.Active := true;
end;

procedure TfrmCadBoletos.DBLookupComboBox_BancoPreImpressoExit(Sender: TObject);
begin
  inherited;
  if DBLookupComboBox_BancoPreImpresso.Text = '' then
  begin
    Application.MessageBox('Campo Banco não pode ser vazio.', 'Atenção',
      MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    exit;
  end;

end;

procedure TfrmCadBoletos.DesabilitarHabilitarCampos(VerdadeiroFalso: Boolean);
begin
  BitBtn1.Enabled := VerdadeiroFalso;
  BitBtn3.Enabled := VerdadeiroFalso;
  SpeedButton1.Enabled := VerdadeiroFalso;
  SpeedButton2.Enabled := VerdadeiroFalso;
  SpeedButton3.Enabled := VerdadeiroFalso;
  SpeedButton25.Enabled := VerdadeiroFalso;
  SpeedButton5.Enabled := VerdadeiroFalso;
  SpeedButton11.Enabled := VerdadeiroFalso;
  SpeedButton7.Enabled := VerdadeiroFalso;
  SpeedButton8.Enabled := VerdadeiroFalso;
  SpeedButton4.Enabled := VerdadeiroFalso;
  SpeedButton12.Enabled := VerdadeiroFalso;
  SpeedButton24.Enabled := VerdadeiroFalso;
  SpeedButton26.Visible := VerdadeiroFalso;

  BitBtn1.visible := VerdadeiroFalso;
  BitBtn3.visible := VerdadeiroFalso;
  SpeedButton1.visible := VerdadeiroFalso;
  SpeedButton2.visible := VerdadeiroFalso;
  SpeedButton3.visible := VerdadeiroFalso;
  SpeedButton25.visible := VerdadeiroFalso;
  SpeedButton5.visible := VerdadeiroFalso;
  SpeedButton11.visible := VerdadeiroFalso;
  SpeedButton7.visible := VerdadeiroFalso;
  SpeedButton8.visible := VerdadeiroFalso;
  SpeedButton4.visible := VerdadeiroFalso;
  SpeedButton12.Visible := VerdadeiroFalso;
  SpeedButton24.Visible := VerdadeiroFalso;
  SpeedButton26.Visible := VerdadeiroFalso;

  SpeedButton23.Enabled := not VerdadeiroFalso;
  SpeedButton23.Visible := not VerdadeiroFalso;
  SpeedButton12.Visible := not VerdadeiroFalso;
  SpeedButton9.Visible := not VerdadeiroFalso;

  SpeedButton7.Enabled := vDadosIni.vBoletos.ExisteConvenio;
  SpeedButton8.Enabled := vDadosIni.vBoletos.ExisteConvenio;
end;

procedure TfrmCadBoletos.Desmarcarboletoparaserimpressopelobanco1Click(
  Sender: TObject);
begin
  inherited;
  ObBoleto.marcarImpressaoPeloBanco(False);
end;

procedure TfrmCadBoletos.DesmarcarTodosBoletosClickClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
  	ObBoleto._DesmarcaTodosBoletos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadBoletos.DesmarcaTodos1Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
  	ObBoleto._DesmarcaTodosBoletos;

  finally
  	Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadBoletos.EditHw1Exit(Sender: TObject);
begin
  inherited;
  DBLookupComboBox2.KeyValue := EditHw1.AsInteger;
end;

procedure TfrmCadBoletos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  gravaConfiguracoesFormRegistro;
  
  ObBoleto.vAbortar := true;
  if (ObBoleto <> nil) then
    ObBoleto.Cancel;
  ObBoleto.free;

  Action := caFree;
  if (frmCadBoletos <> nil) then
    frmCadBoletos := nil;
end;

procedure TfrmCadBoletos.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  inherited;
//  if Pos('BOLETA_VISUALIZAR|', vDadosIni.vPesquisa) > 0 then // TelaCadastro = 11;
//  begin
//    if frmCadBoletos = nil then
//	    frmCadBoletos := TfrmCadBoletos(Self);
//  end;

  ObBoleto := TBoleto.create;
  ObBoleto.criaBoletoCobreBemX;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmCadBoletos.formImprimirBoletoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if Key = VK_F2 then
    ckImprimirBoleto.Checked := not ckImprimirBoleto.Checked
  else if Key = VK_F3 then
  	ckEnviarBoleto.Checked := not ckEnviarBoleto.Checked;
end;

procedure TfrmCadBoletos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if (key = VK_F6) then
  begin
  	if (ckLixeira.visible) and (PageControl1.ActivePage = TabSheet2) then
      ckLixeira.Checked := not ckLixeira.Checked;
  end
end;

procedure TfrmCadBoletos.FormShow(Sender: TObject);
var
  I: Integer;
begin
	if not Self.Enabled then
    Exit;

  Panel2.Height := 57;
  SpeedButton6.Visible := false;
  SpeedButton23.Visible := false;
  DBGrid1.DataSource := DtmBoletos.dsBoletos;
  TabSheet4.TabVisible := false;
  TabSheet_Cobrebem.TabVisible := false;
  TabSheet6.TabVisible := false;
  TabSheet_Relatorio.TabVisible := false;
  TabSheet_Promissorias.TabVisible := false;
  TabSheet_Controles.TabVisible := false;
  TabSheet_Recibos.TabVisible := false;
  tsRemessa.TabVisible := false;
  TabSheet_EnvBol.TabVisible := false;
  ts_outros.TabVisible := False;
  
  if (vCriou = 0) then
  begin
    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if Pos('BOLETA_VISUALIZAR|', vDadosIni.vPesquisa) > 0 then // TelaCadastro = 11;
  begin
    TelaCadastro := 11;

    MaskEdit3.Visible := true;
    MaskEdit1.Visible := false;
    MaskEdit2.Visible := false;

    MaskEdit7.Visible := true;
    MaskEdit9.Visible := false;
    MaskEdit8.Visible := false;

    ComboBox1.Text := trim(ObBoleto.dataSet.FieldByName('NUM_NF_VND').DisplayLabel);
    for I := 0 to ComboBox1.Items.Count - 1 do
    	if trim(ComboBox1.Items[I]) = trim(ObBoleto.dataSet.FieldByName('NUM_NF_VND').DisplayLabel) then
      begin
        ComboBox1.ItemIndex := I;
        Break;
      end;

    ComboBox1Exit(Sender);
    MaskEdit3.Text := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
    ComboBox3.Text := 'Igual';
    CheckBox1.Checked := True;
    ComboBox11.Text := trim(ObBoleto.dataSet.FieldByName('TIPO_EMISSAO').DisplayLabel);
    for I := 0 to ComboBox11.Items.Count - 1 do
    	if trim(ComboBox11.Items[I]) = trim(ObBoleto.dataSet.FieldByName('TIPO_EMISSAO').DisplayLabel) then
      begin
      	ComboBox11.ItemIndex := I;
        Break;
      end;

    MaskEdit7.Text := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
    ComboBox12.Text := 'Igual';

    BitBtn1Click(Sender);
    ComboBox1.Text := ObBoleto.dataSet.FieldByName('NUM_NF_VND').DisplayLabel;
    ComboBox11.Text := ObBoleto.dataSet.FieldByName('TIPO_EMISSAO').DisplayLabel;
    CheckBox1.Checked := True;

//    ObBoleto.abreBoletos(StrToIntDef(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3), 0), vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
//    if ObBoleto.dataSet.IsEmpty then
//    begin
//      Application.MessageBox('Registro não encontrado', 'Atenção', 0 + 64);
//      PostMessage(Self.Handle, WM_CLOSE, 0, 0);
//    end;
//    SpeedButton1Click(Sender);
  end;

  leConfiguracoesFormRegistro;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);
  for I := 0 to self.ComponentCount - 1 do
  begin
    if Components[i] is TDBEdit then
      TDBEdit(Components[i]).CharCase := ecUpperCase;

    if Components[I] is TDBComboBox then
      TDBComboBox(Components[I]).CharCase := ecUpperCase;
  end;
  SpeedButton7.Enabled := vDadosIni.vBoletos.ExisteConvenio;
  SpeedButton8.Enabled := vDadosIni.vBoletos.ExisteConvenio;
  lixeiraVazia(ObBoleto.StatusLixeira);
  
  SpeedButton20.Hint := 'Enviar mensagem - [BOL038]';

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "BOL027" VINCULAR CREDITO A BOLETA COM VALOR DIFERENTE' + #13 +
    'Processo "BOL030" TRAVAR CAMPO (NUMDOC/CLIENTE/VALOR) DE BOLETOS COM REMESSA' + #13 +
    'Processo "BOL031" ENVIAR REMESSA COM CARGA EM ABERTO NO CXL' + #13 +
    'Processo "BOL033" HABILITAR CAMPOS NOTAFISCAL NO BOLETO' + #13 +
    'Processo "BOL035" VINCULAR NOTAFISCAL COM VALOR MENOR QUE O BOLETO' + #13 +
    'Processo "BOL039" VINCULAR CREDITO A BOLETA COM DATA VENCIMENTO DIFERENTE';

  if (vCriou = 0) and (TelaCadastro <> 11) then
  begin
    if vCadBoletosProtesto = nil then
      vCadBoletosProtesto := TBoletosProtesto.create;

    vCadBoletosProtesto.cadBoletosProtesto;
  end;

  FrameCheckListaContato.bt_contatos_pla_add.Hint := 'Incluir contato - [' + vDadosIni.IfThen(vDadosIni.vHwCloudIA.vUsarServMensageria = 'S', 'CLI294', 'CLI260') + ']';
  FrameCheckListaContato.bt_contatos_pla_edit.Hint := 'Alterar contato - [' + vDadosIni.IfThen(vDadosIni.vHwCloudIA.vUsarServMensageria = 'S', 'CLI295', 'CLI254') + ']';
  FrameCheckListaContato.bt_contatos_pla_del.Hint := 'Excluir contato - [' + vDadosIni.IfThen(vDadosIni.vHwCloudIA.vUsarServMensageria = 'S', 'CLI296', 'CLI256') + ']';

  if vCriou = 0 then
  	vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadBoletos.gravaConfiguracoesFormRegistro;
begin
	if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
    _GravaConfiguracoesString(ComboBox11.Name, ComboBox11.Text);
    _GravaConfiguracoesString(ComboBox12.Name, ComboBox12.Text);

    _GravaConfiguracoesString(MaskEdit7.Name, MaskEdit7.Text);
    _GravaConfiguracoesString(MaskEdit9.Name, MaskEdit9.Text);
    _GravaConfiguracoesString(MaskEdit8.Name, MaskEdit8.Text);
 end;
end;

procedure TfrmCadBoletos.groupAdicionalExit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TfrmCadBoletos.GroupBox1Enter(Sender: TObject);
begin
  inherited;

  if ObBoleto.dataSet.FieldByName('cod_cobrebem').AsInteger = 0 then
    Exit;

  ObBoleto.vCobreBem.abreCobreBem(IntToStr(ObBoleto.dataSet.FieldByName('cod_cobrebem').AsInteger));
  if ObBoleto.vCobreBem.dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString = 'S' then
  begin
    Label23.Visible := True;
    DBEdit2.Visible := True;
    DBEdit2.Enabled := true;
  end
  else
  begin
    Label23.Visible := True;
    DBEdit2.Visible := True;
    DBEdit2.Enabled := false;
  end;
  if ObBoleto.dataSet.FieldByName('remessa_enviada').AsString = 'S' then
  begin
    Label27.Visible := True;
    Label28.Visible := True;
    DBEdit4.Visible := True;
    DBEdit5.Visible := True;
  end
  else
  begin
    Label27.Visible := false;
    Label28.Visible := false;
    DBEdit4.Visible := false;
    DBEdit5.Visible := false;
  end;
end;

procedure TfrmCadBoletos.GroupBox1Exit(Sender: TObject);
begin
  inherited;
  Label23.Visible := False;
  Label27.Visible := False;
  Label28.Visible := False;
  DBEdit2.Visible := False;
  DBEdit4.Visible := False;
  DBEdit5.Visible := False;
end;

procedure TfrmCadBoletos.ImprimirEnviar(pProcesso: string; pMensagem: string);
var
	codigoCobrebem: string;
  vHabKentro: Boolean;
  selecionados: RBoletosSelecionados;
  vsql: string;
  vArrayClientes: ArrayInts;
  I: Integer;
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('BOLETOS', 'A', ObBoleto.buscas) then
    Exit;

  if not vDadosIni.PesqPros(pProcesso, pMensagem, '', 'BOLETAS', '', ObBoleto.buscas, true) then
    Exit;

	vCodClienteTmp := 0;

  ObBoleto.prepare_loop('SelecionaBoleto = ''S''');
  try
    codigoCobrebem := ObBoleto.dataSet.FieldByName('COD_COBREBEM').AsString;

    //inherited;

    if Obboleto.dataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum boleto selecionado', 'Atenção', 0 + 64);
      Exit;
    end;

    if vDadosIni.vHwCloudIA.vUsarServMensageria = 'S' then
    begin
      ObBoleto.dataSet.First;
      while not ObBoleto.dataSet.Eof do
      begin
        if ObBoleto.dataSet.FieldByName('SelecionaBoleto').AsString = 'S' then
        begin
          if not vDadosIni.sincronizarDadosContatoClienteAplicativo(
            ObBoleto.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
              Exit;
        end;

        ObBoleto.dataSet.Next;
      end;
    end;

  finally
    ObBoleto.filterClear;
    ObBoleto.prepare_loop_done();
  end;

  try
    vArrayClientes := ObBoleto.GetArrayDistinctInts('cod_cliente', True, True, ' SelecionaBoleto');
    vCodClienteTmp := vDadosIni.IfThen(Length(vArrayClientes) > 1, 0, vArrayClientes[0]);
  finally
    SetLength(vArrayClientes, 0);
  end;

  vHabKentro := False;
  if trim(vDadosIni.vHwCloudIA.vUsarServMensageria) <> 'S' then
    vHabKentro := trim(vDadosIni.retornaDadosKentro(ObBoleto.buscas, false)) <> '';

  ObBoleto.vCobreBem.abreCobreBem(0);
  vsql := ObBoleto.dataSet.CommandText;
  ObBoleto.storeRecNo;

  try
    ObBoleto.prepare_loop('SelecionaBoleto = ''S''');
    try
      ckConfEmailWhatsAppAssunto.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria <> 'S';
      ckUnicoEmailWhatsApp.Visible := True;

      if (ckImprimirBoleto.Visible) and (ckEnviarBoleto.Visible) then
      	ckImprimirBoleto.Checked := _LerConfiguracoesRegistroBoolean(ckImprimirBoleto.Name, True)
      else if (ckImprimirBoleto.Visible) then
      	ckImprimirBoleto.Checked := True
      else
      	ckImprimirBoleto.Checked := False;

      if (ckImprimirBoleto.Visible) and (ckEnviarBoleto.Visible) then
      	ckEnviarBoleto.Checked := _LerConfiguracoesRegistroBoolean(ckEnviarBoleto.Name, False)
      else if (ckEnviarBoleto.Visible) then
      	ckEnviarBoleto.Checked := True
      else
      	ckEnviarBoleto.Checked := False;

      ckUnicoEmailWhatsApp.Checked := False;
      if (ckUnicoEmailWhatsApp.Enabled) and (ckUnicoEmailWhatsApp.Visible) then
        ckUnicoEmailWhatsApp.Checked := _LerConfiguracoesRegistroBoolean(ckUnicoEmailWhatsApp.Name, False);

      ckConfEmailWhatsAppAssunto.Checked := False;
      if (not ckUnicoEmailWhatsApp.Checked) and (ckConfEmailWhatsAppAssunto.Enabled) and (ckConfEmailWhatsAppAssunto.Visible) then
        ckConfEmailWhatsAppAssunto.Checked := _LerConfiguracoesRegistroBoolean(ckConfEmailWhatsAppAssunto.Name, False);

      ckUnicoEmailWhatsApp.Enabled := not ckConfEmailWhatsAppAssunto.Checked;
      ckConfEmailWhatsAppAssunto.Enabled := not ckUnicoEmailWhatsApp.Checked;

      DBLookupComboBox1.KeyValue := 0;
      if ObBoleto.dataSet.FieldByName('COD_COBREBEM').AsInteger > 0 then
        DBLookupComboBox1.KeyValue := ObBoleto.dataSet.FieldByName('COD_COBREBEM').AsInteger
      else if ObBoleto.vCobreBem.dataSet.RecordCount = 1 then
        DBLookupComboBox1.KeyValue := ObBoleto.vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger;

      try
        FrameCheckListaContato.GroupBoxContato.Visible := (ckEnviarBoleto.Visible) and (ckEnviarBoleto.Checked);

        pnSelecionarConvenio.Height := vDadosIni.IfThen(FrameCheckListaContato.GroupBoxContato.Visible, 241, 146);

        FrameCheckListaContato.CodCliente := vCodClienteTmp;
        FrameCheckListaContato.Origem := cBoleto;
        FrameCheckListaContato.UnicoMens := ckUnicoEmailWhatsApp.Checked;

        FrameCheckListaContato.carregarContatoAplicativo;

        pnSelecionarConvenio.Align := alNone;
        pnSelecionarConvenio.Height := vDadosIni.IfThen(FrameCheckListaContato.GroupBoxContato.Visible, 241, 146);
        pnSelecionarConvenio.Width := 780;
        if not vDadosIni.abreForm('Seleção do convênio', pnSelecionarConvenio, TabSheet_Cobrebem) then
          exit;
      finally
        pnSelecionarConvenio.Align := alClient;
      end;
    finally
    	if (ckImprimirBoleto.Visible) and (ckEnviarBoleto.Visible) then
      begin
      	_GravaConfiguracoesBoolean(ckImprimirBoleto.Name, ckImprimirBoleto.Checked);
      	_GravaConfiguracoesBoolean(ckEnviarBoleto.Name, ckEnviarBoleto.Checked);
      end;

      if (ckUnicoEmailWhatsApp.Enabled) and (ckUnicoEmailWhatsApp.Visible) then
        _GravaConfiguracoesBoolean(ckUnicoEmailWhatsApp.Name, ckUnicoEmailWhatsApp.Checked);

      if (ckConfEmailWhatsAppAssunto.Enabled) and (ckConfEmailWhatsAppAssunto.Visible) then
        _GravaConfiguracoesBoolean(ckConfEmailWhatsAppAssunto.Name, ckConfEmailWhatsAppAssunto.Checked);

      FrameCheckListaContato._GravaConfiguracoesRegistro;
    end;

    if (not (ObBoleto._ValidaDadosCredito)) then
      exit;

    if not ObBoleto.vCobreBem.abreCobreBemImpressao(ObBoleto._CreditoSelecionado) then
    begin
      ShowAtencao('Não existe convênio ativo para essa configuração de conta');
      Exit;
    end;
  finally
    ObBoleto.filterClear;
    ObBoleto.prepare_loop_done();
  end;

  ObBoleto.vAbortar := false;
  ObBoleto.vImpressaoNF := false;
  if not ObBoleto._validadados then
    exit;

  if ObBoleto.vCobreBem.dataSet.FieldByName('TIPO_API').AsString = 'S' then
  begin
    try
      vDadosIni.abreStatusProcessamento('Impressão de boletos', 'Processando informações...');
      selecionados := ObBoleto.HandleBoletos;

      if selecionados.Erros <> '' then
      begin
        ShowAtencao(selecionados.Erros);
        Exit;
      end;

      if Length(selecionados.lista) > 0 then
        ObBoleto._GerarBoletosPlugBoletos(
          selecionados.lista,
          0,
          0,
          '',
          ckImprimirBoleto.Checked,
          ckEnviarBoleto.Checked,
          vDadosIni.retornaArrayAplicativo(FrameCheckListaContato.CheckListBoxAplicativo, True),
          vDadosIni.retornaArrayContato(FrameCheckListaContato.CheckListBoxContato, True),
          cBoleto,
          (ckConfEmailWhatsAppAssunto.Enabled) and (ckConfEmailWhatsAppAssunto.Visible) and (ckConfEmailWhatsAppAssunto.Checked),
          (ckUnicoEmailWhatsApp.Enabled) and (ckUnicoEmailWhatsApp.Visible) and (ckUnicoEmailWhatsApp.Checked),
          'BOL010',
          'IMPRIMIR'
        );
    finally
      vDadosIni.fechaStatusProcessamento;
      Screen.Cursor := crDefault;
    end;
  end
  else
  begin
    try
      vDadosIni.abreStatusProcessamento('Impressão de boletos', 'Processando informações...');
      Screen.Cursor := crHourGlass;

      ObBoleto._GerarBoletosDLLCobrebem(
      	0,
        0,
        '',
        ckImprimirBoleto.Checked,
        ckEnviarBoleto.Checked,
        vDadosIni.retornaArrayAplicativo(FrameCheckListaContato.CheckListBoxAplicativo, True),
        vDadosIni.retornaArrayContato(FrameCheckListaContato.CheckListBoxContato, True),
        cBoleto,
        (ckConfEmailWhatsAppAssunto.Enabled) and (ckConfEmailWhatsAppAssunto.Visible) and (ckConfEmailWhatsAppAssunto.Checked),
        (ckUnicoEmailWhatsApp.Enabled) and (ckUnicoEmailWhatsApp.Visible) and (ckUnicoEmailWhatsApp.Checked)
      );
    finally
      vDadosIni.fechaStatusProcessamento;
      Screen.Cursor := crDefault;
    end;
  end;

	vDadosIni.GravaAuditoria(pProcesso, pMensagem, 'SUCESSO', 'BOLETAS', '', ObBoleto.buscas);

  ObBoleto.dataSet.Close;
  ObBoleto.dataSet.CommandText := vsql;
  ObBoleto.dataSet.Open;
  ObBoleto.restoreRecNo;

  ObBoleto.dataSet.Refresh;
end;

procedure TfrmCadBoletos.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (TelaCadastro <= 0) and (CheckBox1.Checked) then
  begin
 	  CheckBox1Click(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox11.Name)) <> '' then
    	ComboBox11.Text   := _LerConfiguracoesRegistroString(ComboBox11.Name);
    for I := 0 to ComboBox11.Items.Count - 1 do
    begin
 			if trim(ComboBox11.Items[I]) = trim(ComboBox11.Text) then
      begin
      	ComboBox11.ItemIndex := I;
        Break;
      end;
    end;

    ComboBox11Exit(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox12.Name)) <> '' then
    	ComboBox12.Text   := _LerConfiguracoesRegistroString(ComboBox12.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit7.Name)) <> '' then
    	MaskEdit7.Text    := _LerConfiguracoesRegistroString(MaskEdit7.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name)) <> '' then
    	MaskEdit9.Text    := _LerConfiguracoesRegistroString(MaskEdit9.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name)) <> '' then
    	MaskEdit8.Text    := _LerConfiguracoesRegistroString(MaskEdit8.Name);
  end;
end;

procedure TfrmCadBoletos.localizar_demais_boletos(Sender: TObject);
var
  AoperacaoDemaisBoletos: Integer;
  AdemaisBoletos: TDataSet_OOP;
  AfieldsChange: TStrings;
begin
  AdemaisBoletos := ObBoleto.GetBoletosMesmoDocumento;
  try
    if AdemaisBoletos.dataSet.Active then
      if AdemaisBoletos.dataSet.RecordCount > 0 then
      begin
        grid_demaisboletos.DataSource := AdemaisBoletos._dataSourceOOP;

        AoperacaoDemaisBoletos := vDadosIni.abreFormI('Demais boletos do mesmo documento ' + ObBoleto.fstr('tipo_emissao') + ' ' +
                                                                                             ObBoleto.fstr('num_nf_vnd') + '/' +
                                                                                             ObBoleto.fstr('sub_serie'),
                                                                                             pn_alt_demaisboletos,
                                                                                             opFormsDefCad);
        if AoperacaoDemaisBoletos = ID_ABORT then
          raise Exception.Create('Alteração de demais boletos cancelada pelo usuário');

        if AoperacaoDemaisBoletos = ID_OK then
        begin
          Fid_demaisBoletos := '';
          AdemaisBoletos.prepare_loop();
          try
            while not AdemaisBoletos.dataSet.Eof do
            begin
              Fid_demaisBoletos := Fid_demaisBoletos + IfThen(AdemaisBoletos.dataSet.RecNo > 1, ',') + AdemaisBoletos.fstr('id');
              AdemaisBoletos.dataSet.Next;
            end;
          finally
            AdemaisBoletos.prepare_loop_done();
          end;

          AfieldsChange := vDadosIni.NewStringList(True, '', ',');
          try
            if ck_alt_data_emissao.Checked then AfieldsChange.Add('data_em_bol');
            if ck_alt_cliente.Checked      then AfieldsChange.Add('cod_cliente');
            if ck_alt_local_pag.Checked    then AfieldsChange.Add('localpag');
            if ck_alt_mora.Checked         then AfieldsChange.Add('m_dia_bol');
            if ck_alt_multa.Checked        then AfieldsChange.Add('mult_atr_bol');
            if ck_alt_dias.Checked         then AfieldsChange.Add('dias_protesto');
            if ck_alt_obs1.Checked         then AfieldsChange.Add('obs_bol');
            if ck_alt_obs2.Checked         then AfieldsChange.Add('obs_bol1');
            if ck_alt_mensagem_ad.Checked  then AfieldsChange.Add('mensagem_adc');

            ObBoleto.SetBoletosMesmoDocumento(AdemaisBoletos, AfieldsChange);

          finally
            FreeAndNil(AfieldsChange);
          end;
        end;

      end;
  finally
    FreeAndNil(AdemaisBoletos);
  end;
end;

procedure TfrmCadBoletos.Marcarboletoparaserimpressopelobanco1Click(
  Sender: TObject);
begin
  inherited;
  ObBoleto.marcarImpressaoPeloBanco;
end;

procedure TfrmCadBoletos.MarcarTodosBoletosClickClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
  	ObBoleto._SelecionaTodosBoletos;

  finally
  	Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadBoletos.Configurarcolunas2Click(Sender: TObject);
begin
//  vDadosIni.Configurarcolunas(cdsColunas, DBGrid3, GroupBoxConfCol, ScrollBoxConfCol, Self);
	vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas2, DBGrid3, GridCfg2, cdsGrid2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TfrmCadBoletos.ResetarConfiguraesdecolunas2Click(Sender: TObject);
begin
//  vDadosIni.resetarConfiguracoesDeColunas(cdsColunas, 'cdsControleCreditos', trans, vDadosIni.vNomeUsuario, true);
	vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid3, GridCfg2, cdsColunas2, cdsGrid2, usuario2,
     vDadosIni.transacaoCol, fReset2, ListGridsAndDataSets2, false, ListPositions2);
end;

procedure TfrmCadBoletos.SalvardadosnoExcel2Click(Sender: TObject);
begin
//  vDadosIni.montarExcel(DBGrid3, 'Créditos');
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid3, usuario2, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TfrmCadBoletos.ReajustarLarguradascolunas2Click(Sender: TObject);
begin
//  vDadosIni.AjustaLaguraColunas(DBGrid3);
	vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid3);
end;

procedure TfrmCadBoletos.Copiarparareadetransferncia2Click(Sender: TObject);
begin
  vDadosIni.Copiarparareadetransferncia(DBGrid3);
end;

procedure TfrmCadBoletos.Panel14Exit(Sender: TObject);
begin
  inherited;
  _GravaConfiguracoesBoolean(ck_alt_data_emissao.Name, ck_alt_data_emissao.Checked);
  _GravaConfiguracoesBoolean(ck_alt_cliente.Name, ck_alt_cliente.Checked);
  _GravaConfiguracoesBoolean(ck_alt_local_pag.Name, ck_alt_local_pag.Checked);
  _GravaConfiguracoesBoolean(ck_alt_mora.Name, ck_alt_mora.Checked);
  _GravaConfiguracoesBoolean(ck_alt_multa.Name, ck_alt_multa.Checked);
  _GravaConfiguracoesBoolean(ck_alt_dias.Name, ck_alt_dias.Checked);
  _GravaConfiguracoesBoolean(ck_alt_obs1.Name, ck_alt_obs1.Checked);
  _GravaConfiguracoesBoolean(ck_alt_obs2.Name, ck_alt_obs2.Checked);
  _GravaConfiguracoesBoolean(ck_alt_mensagem_ad.Name, ck_alt_mensagem_ad.Checked);
end;

procedure TfrmCadBoletos.pnSelecionarConvenioEnter(Sender: TObject);
begin
  inherited;
	TForm(pnSelecionarConvenio.Parent).OnKeyDown := formImprimirBoletoKeyDown;
end;

procedure TfrmCadBoletos.pn_alt_demaisboletosEnter(Sender: TObject);
begin
  inherited;
  ck_alt_data_emissao.Checked := _LerConfiguracoesRegistroBoolean(ck_alt_data_emissao.Name, True);
  ck_alt_cliente.Checked      := _LerConfiguracoesRegistroBoolean(ck_alt_cliente.Name, True);
  ck_alt_local_pag.Checked    := _LerConfiguracoesRegistroBoolean(ck_alt_local_pag.Name, True);
  ck_alt_mora.Checked         := _LerConfiguracoesRegistroBoolean(ck_alt_mora.Name, True);
  ck_alt_multa.Checked        := _LerConfiguracoesRegistroBoolean(ck_alt_multa.Name, True);
  ck_alt_dias.Checked         := _LerConfiguracoesRegistroBoolean(ck_alt_dias.Name, True);
  ck_alt_obs1.Checked         := _LerConfiguracoesRegistroBoolean(ck_alt_obs1.Name, True);
  ck_alt_obs2.Checked         := _LerConfiguracoesRegistroBoolean(ck_alt_obs2.Name, True);
  ck_alt_mensagem_ad.Checked  := _LerConfiguracoesRegistroBoolean(ck_alt_mensagem_ad.Name, True);
end;

procedure TfrmCadBoletos.QuickRep_PromissoriaPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Promissória');
end;

procedure TfrmCadBoletos.QuickRep_RecibosPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Recibos');
end;

procedure TfrmCadBoletos.QuickRep_RemessaPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Boletos');
end;

procedure TfrmCadBoletos.ScrollBoxConfColEnter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TfrmCadBoletos.ScrollBoxConfColExit(Sender: TObject);
begin
  inherited;
  if (cdsColunas2 = nil) or (not cdsColunas2.Active) or (not vConfigColuna) then
    exit;
  vDadosIni.gravaConfiguracaoUsuario(cdsColunas2, DBGrid3, vDadosIni.vNomeUsuario, 'cdsControleCreditos', self, ScrollBoxConfCol, trans2);
  GroupBoxConfCol.Visible := false;
  vDadosIni.mostraColunas(cdsColunas2, DBGrid3, vDadosIni.vNomeUsuario, 'cdsControleCreditos', vTabela2, vCampoPadrao2);
end;

procedure TfrmCadBoletos.SelecionarTodosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    ObBoleto._SelecionaTodosBoletos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TfrmCadBoletos.SpeedButton10Click(Sender: TObject);
begin
//  if not vDadosIni.validarAcessoEmpresasUnificadas(ObBoleto.buscas) then
//  begin
//    vDadosIni.fechaStatusProcessamento;
//    Exit;
//  end;
  
  if not vDadosIni.validarAcessoCadastrosEmpresas('BOLETOS', 'A', ObBoleto.buscas) then
    Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', ObBoleto.buscas) then
    Exit;
   if not ObBoleto.dataSet.IsEmpty then
  begin
   if vDadosIni.PesqPros('BOL021', 'VINCULAR CREDITO', '', 'BOLETAS',
      ObBoleto.dataSet.FieldByName('N_SEQ_BOL').AsString, ObBoleto.buscas, true) then
    begin
      {3}if (ObBoleto.dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString = '') then
      begin
        Application.MessageBox('Este boleto não tem Nosso Numero, realize a impressão para vincular.', '',
          MB_OK + MB_ICONQUESTION + MB_DEFBUTTON1);
        exit;
      end; {3}
      if ObBoleto.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
        exit;

      try
        ObBoleto.vControleCreditos._PreencherVinculoCreditoBoleto(
          ObBoleto.dataSet.FieldByName('COD_CLIENTE').AsInteger,
          ObBoleto.dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString);
      except
        on E: Exception do
        begin
          MessageDlg('Ocorreu um erro na tentativa de acessar os créditos: ' + E.Message,
            mtError, [mbOK], 0);
          exit;
        end;
      end;

      {3}if not ObBoleto.Edit and (not (ObBoleto.dataSet.State = dsEdit)) then
      begin
        Application.MessageBox('Erro ao editar registro. Se o erro persistir contacte o administrador da rede.', 'Erro',
          MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
        Exit;
      end; {3}
      inherited;

      vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
  	    vAlterarNomeDtSet2, GridCfg2, DBGrid3, cdsGrid2, cdsColunas2, trans2, ListGridsAndDataSets2,
	      ListPositions2, nomeDTSEt2, PrimeiraPesquisa2, vCamposPadraoRegistro2, usuario2);

//      if PrimeiraPesquisa2 then
//      begin
        PrimeiraPesquisa2 := False;
        vDadosIni.configurarGridPeloConfigColunas(DBGrid3, GridCfg2, cdsGrid2, cdsColunas2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
//      end;

      Label_Codigo.Visible := true;
      DBEdit_Codigo.Visible := true;
      PageControl1.ActivePage := TabSheet_Controles;
      if (Self.Enabled) and (Self.Visible) and (DBGrid3.CanFocus) then
        DBGrid3.SetFocus;
    end;
  end;  
end;

procedure TfrmCadBoletos.SpeedButton11Click(Sender: TObject);
var
  vBoolTemp: Boolean;
begin
  if vDadosIni.PesqPros('BOL011', 'IMPRIMIR RELATORIO', '', 'BOLETAS', '', ObBoleto.buscas, true)
    then
  begin
    inherited;

    vBoolTemp := Application.MessageBox('Imprime somente selecionados?', 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = IDYES;

    if vBoolTemp then
    begin
      ObBoleto.dataSet.Filter := 'SelecionaBoleto = ''S''';
      ObBoleto.dataSet.Filtered := True;
    end;

    lbEmpresa.Caption := vDadosIni.vEmp.vnomeEmpresa;
    QuickRep_Remessa.Preview;

    ObBoleto.dataSet.Filter := '';
    ObBoleto.dataSet.Filtered := False;
  end;
end;

procedure TfrmCadBoletos.SpeedButton12Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('BOLETOS', 'A', ObBoleto.buscas) then
    Exit;
  try
    vDadosIni.abreStatusProcessamento('Reativando boletos', 'Processando informações...');
    if vDadosIni.PesqPros('BOL018', 'RETIRAR INATIVO OU CANCELADO', '', 'BOLETAS', '',
      ObBoleto.buscas, true)
      then
    begin
      try
        inherited;

        ObBoleto.vAbortar := false;

        DesabilitarHabilitarCampos(false);

        if ObBoleto._RetirarInativo then
        begin

          if not ObBoleto._CommitTransaction('BOL018', 'BOLETAS',
            ObBoleto.DataSet.FieldByName('N_SEQ_BOL').AsString, 'INSERIR') then
          begin
            if (ObBoleto <> nil) then
              ObBoleto.Cancel;
            Application.MessageBox('Erro ao gravar registro. Se o erro persistir contacte o administrador da rede.', 'Erro',
              MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
          end
          else
          begin
            ShowMessage('Boleto(s) reativado(s).');
            ObBoleto.dataSet.Refresh;
          end;
        end
        else
        begin
          ObBoleto.Cancel;
        end;
      except
        Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
          MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
        ObBoleto.Cancel;
        DesabilitarHabilitarCampos(true);
      end;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
    DesabilitarHabilitarCampos(true);
    DBGrid1.SelectedIndex := 2;
  end;

end;

procedure TfrmCadBoletos.SpeedButton13Click(Sender: TObject);
var
 vCodCBX: Integer;
begin
  if not vDadosIni.PesqPros('BOL028', '', '', 'BOLETAS', '', ObBoleto.buscas, false) then
  begin
    exit;
  end;
  inherited;
  try
    Obboleto.dataSet.DisableControls;
    Obboleto.dataSet.Filter := 'SelecionaBoleto = ''S''';
    Obboleto.dataSet.Filtered := True;
    
    vDadosIni.abreStatusProcessamento('Emitir Recibos', 'Processando informações...');

    if Obboleto.dataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum boleto selecionado', 'Atenção', 0 + 64);
      Exit;
    end;

    vCodCBX := 0;
    
    Obboleto.dataSet.First;
    while not ObBoleto.dataSet.Eof do
    begin
      if vCodCBX <= 0 then
        vCodCBX := ObBoleto.dataSet.FieldByName('COD_COBREBEM').AsInteger;

      if (vCodCBX > 0) and (vCodCBX <> ObBoleto.dataSet.FieldByName('COD_COBREBEM').AsInteger) then
      begin
        Application.MessageBox(pchar('Existem boletos que foram impressos em configurações de contas diferentes.' + #13 +
          'Favor verificar'), 'Atenção', 0 + 64);
        exit;
      end;

      ObBoleto.dataSet.Next;
    end;

    try
      DesabilitarHabilitarCampos(false);
      SpeedButton23.Visible := false;

      QRImage1.Picture.LoadFromFile('');
      ObBoleto.vCobreBem.abreCobreBem(IntToStr(vCodCBX));
      if ObBoleto.vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger > 0 then
      begin
        if (trim(ObBoleto.vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').AsString) <> '') then
        begin
          if FileExists(ObBoleto.vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').AsString) then
            QRImage1.Picture.LoadFromFile(ObBoleto.vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').AsString)
          else
            Application.MessageBox('Imagem Logotipo no Cadastro do Cobrebem não encontrada!', 'Atenção',
              MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        end
        else if (trim(vDadosIni.vEmp.vNfe.pathLogo) <> '') then
        begin
          if FileExists(vDadosIni.vEmp.vNfe.pathLogo) then
            QRImage1.Picture.LoadFromFile(vDadosIni.vEmp.vNfe.pathLogo)
          else
            Application.MessageBox('Imagem Logotipo no Cadastro de Empresa não encontrada!', 'Atenção',
              MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        end;
      end
      else
      begin
        if (trim(vDadosIni.vEmp.vNfe.pathLogo) <> '') then
        begin
          if FileExists(vDadosIni.vEmp.vNfe.pathLogo) then
            QRImage1.Picture.LoadFromFile(vDadosIni.vEmp.vNfe.pathLogo)
          else
            Application.MessageBox('Imagem Logotipo no Cadastro de Empresa não encontrada!', 'Atenção',
              MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        end;
      end;
      QuickRep_Recibos.Preview;
      DesabilitarHabilitarCampos(true);
      SpeedButton23.Visible := true;
    except
      DesabilitarHabilitarCampos(true);
      SpeedButton23.Visible := true;
    end;
  finally
    ObBoleto.dataSet.EnableControls;
    ObBoleto.dataSet.Filter := '';
    ObBoleto.dataSet.Filtered := False;
    
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmCadBoletos.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    ObBoleto._efetuarSoma;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadBoletos.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BOL034', 'HABILITAR', '', 'BOLETAS',
    '', ObBoleto.buscas, true) then
    exit;

  Label29.Enabled := true;
  Label30.Enabled := true;
  Label31.Enabled := true;
  DBEdit7.Enabled := true;
  DBEdit8.Enabled := true;
  DBEdit12.Enabled := false;

  ObBoleto.dataSet.FieldByName('TIPO_EMISSAO').AsString := 'NF';

  if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
    DBEdit7.SetFocus;
end;

procedure TfrmCadBoletos.SpeedButton16Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
  	if vCadBoletosProtesto = nil then
  		vCadBoletosProtesto := TBoletosProtesto.create;

    vCadBoletosProtesto.cadBoletosProtesto(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadBoletos.SpeedButton104Click(Sender: TObject);
begin
  inherited;
  if not ObBoleto.vCobreBem.abreCobreBemImpressao(0) then
    Application.MessageBox('Nenhuma configuração encontrada, favor verificar o cadastro.', 'Confirmação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);

  if not vDadosIni.PesqPros('BOL029', 'HABILITAR', '', 'BOLETAS',
    '', ObBoleto.buscas, true) then
    exit;

  EditHw1.Enabled := True;
  DBLookupComboBox2.Enabled := True;

  if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
    EditHw1.SetFocus;
end;

procedure TfrmCadBoletos.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  if SpeedButton17.Tag = 1 then
  begin
    SpeedButton17.Caption := 'v';
    SpeedButton17.Tag := 0;
    Panel2.Height := 57;
  end
  else if SpeedButton17.Tag = 0 then
  begin
    SpeedButton17.Caption := '^';
    SpeedButton17.Tag := 1;
    Panel2.Height := 114;
  end;
end;

procedure TfrmCadBoletos.SpeedButton18Click(Sender: TObject);
begin
	ObBoleto.devolverBoleto;
end;

procedure TfrmCadBoletos.SpeedButton19Click(Sender: TObject);
begin
	ObBoleto.removerStatusDevolvido;
end;

procedure TfrmCadBoletos.SpeedButton1Click(Sender: TObject);
var
	I: Integer;
begin
//  if not vDadosIni.validarAcessoEmpresasUnificadas(ObBoleto.buscas) then
//  begin
//    vDadosIni.fechaStatusProcessamento;
//    Exit;
//  end;

  if not vDadosIni.validarAcessoCadastrosEmpresas('BOLETOS', 'A', ObBoleto.buscas) then
    Exit;
  if not ObBoleto.dataSet.IsEmpty then
    if vDadosIni.PesqPros('BOL003', 'EDITAR', '', 'BOLETAS',
      ObBoleto.dataSet.FieldByName('N_SEQ_BOL').AsString, ObBoleto.buscas, true) then
    begin

      if ObBoleto.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
        exit;

      if ObBoleto.dataSet.FieldByName('REMESSA_ENVIADA').AsString = 'S' then
      begin
      	Application.MessageBox('Boleto com remessa enviada.' + #13 + #13 +
        	'Para alterar é necessário limpar/remover os dados da remessa.', 'Erro',
          MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
        exit;
      end;

      if not ObBoleto.Edit and (not (ObBoleto.dataSet.State = dsEdit)) then
      begin
        Application.MessageBox('Erro ao editar registro. Se o erro persistir contacte o administrador da rede.', 'Erro',
          MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
        Exit;
      end;
      inherited;
      if ObBoleto.dataSet.FieldByName('VL_DESC_BOL').AsFloat > 0 then
      begin
      	ObBoleto.dataSet.FieldByName('VL_DOC_BRUTO').AsFloat :=
        	ObBoleto.dataSet.FieldByName('VL_DOC_BOL').AsFloat +
          	ObBoleto.dataSet.FieldByName('VL_DESC_BOL').AsFloat;
      end
      else
      begin
      	ObBoleto.dataSet.FieldByName('VL_DOC_BRUTO').AsFloat :=
        	ObBoleto.dataSet.FieldByName('VL_DOC_BOL').AsFloat;
      end;
      CheckCadSeq.Checked := false;
      Label_Codigo.Visible := true;
      DBEdit_Codigo.Visible := true;
      EditHw1.Enabled := False;
      DBLookupComboBox2.Enabled := False;

      DBEdit1.Enabled := true;
      DBEdit_NumeroDocumento.Enabled := true;
      DBEdit_ValorTotal.Enabled := true;
      DBEdit9.Enabled := true;
      DBLookupComboBox3.Enabled := true;
      DBLookupComboBox4.Enabled := true;
      Label29.Enabled := false;
      Label30.Enabled := false;
      Label31.Enabled := false;
      DBEdit7.Enabled := false;
      DBEdit8.Enabled := false;
      DBEdit12.Enabled := false;

      vDadosIni.vInibeMensPesqPros := 'S';
      if not vDadosIni.PesqPros('BOL033', 'HABILITAR', '', 'BOLETAS', '', ObBoleto.buscas, false) then
        GroupBox9.Visible := False
      else
        GroupBox9.Visible := True;


      if ObBoleto.dataSet.FieldByName('REMESSA_ENVIADA').AsString = 'S' then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
        if not vDadosIni.PesqPros('BOL030', 'TRAVAR CAMPO (NUMDOC/CLIENTE/VALOR) DE BOLETOS COM REMESSA', '', 'BOLETAS', '', ObBoleto.buscas, false) then
        begin
          DBEdit1.Enabled := false;
          DBEdit_NumeroDocumento.Enabled := false;
          DBEdit_ValorTotal.Enabled := false;
          DBEdit9.Enabled := false;
          DBLookupComboBox3.Enabled := false;
          DBLookupComboBox4.Enabled := false;
        end
      end;

      for I := 0 to ComponentCount - 1 do
        if (Components[I] is TScrollBox) then
          TScrollBox(Components[I]).VertScrollBar.Position := 0;

      PageControl1.ActivePage := TabSheet1;
      PageControl3.ActivePage := TabSheet3;
      if Length(Trim(ObBoleto.dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString)) > 0 then
      begin
        GroupBox5.Caption := 'Convênio do boleto';
        SpeedButton104.Enabled := false;
        EditHw1.AsValue := ObBoleto.dataSet.FieldByName('COD_COBREBEM').AsInteger;
        DBLookupComboBox2.KeyValue := ObBoleto.dataSet.FieldByName('COD_COBREBEM').AsInteger;
      end
      else
      begin
        GroupBox5.Caption := 'Convênio para gerar o boleto';
        SpeedButton104.Enabled := true;
        EditHw1.AsValue := 0;
        DBLookupComboBox2.KeyValue := 0;
      end;
      if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        DBEdit1.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
        DBEdit3.SetFocus;
    end;
end;

procedure TfrmCadBoletos.SpeedButton20Click(Sender: TObject);
begin
  try
    if vDadosIni.vHwCloudIA.vUsarServMensageria = 'S' then
    begin
      try
        ckImprimirBoleto.Visible := False;
        ckEnviarBoleto.Visible := True;
        GroupBoxAcoes.Visible := False;

        ImprimirEnviar('BOL038', 'ENVIAR MENSAGEM');
      finally
        ckImprimirBoleto.Visible := True;
        ckEnviarBoleto.Visible := True;
        GroupBoxAcoes.Visible := True;
      end;
    end
    else
    begin
      if not vDadosIni.validarAcessoCadastrosEmpresas('BOLETOS', 'A', ObBoleto.buscas) then
        Exit;

      if not vDadosIni.PesqPros('BOL038', 'ENVIAR EMAIL', '', 'BOLETAS',
          '', ObBoleto.buscas, true) then
        exit;

      if not ObBoleto._abreformEnvMensagem then
        exit;
    end;

	except on E: Exception do
    begin
    	vDadosIni.GravaAuditoria('BOL038', 'ENVIAR MENSAGEM', 'FALHA', 'BOLETAS', '', ObBoleto.buscas);
      Application.MessageBox(PChar(pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
      vDadosIni.registraErro(e.Message);
    end;
  end;
end;

procedure TfrmCadBoletos.SpeedButton21Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('BOLETOS', 'A', ObBoleto.buscas) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    ObBoleto._gerarCarne;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadBoletos.SpeedButton22Click(Sender: TObject);
var
  arquivoretorno: TArqBoleto;
  hdBoletos: THandle;
begin
  try
    Screen.Cursor := crHourGlass;
    if hdBoletos = 0 then
      arquivoretorno.carregaPacote('pkBoletos', hdboletos);
    arquivoretorno.cadArqBoleto(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadBoletos.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  ObBoleto.vAbortar := true;
  vDadosIni.GravaAuditoria('BOL019', 'ABORDAR', 'SUCESSO', 'BOLETAS',
    '', ObBoleto.buscas);
end;

procedure TfrmCadBoletos.SpeedButton24Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BOL026', '', '', 'BOLETAS', '', ObBoleto.buscas, false) then
  begin
    exit;
  end;
  inherited;
  try
    vDadosIni.abreStatusProcessamento('Emitir promisssórias', 'Processando informações...');
    try

      DesabilitarHabilitarCampos(false);
      SpeedButton23.Visible := false;
      QuickRep_Promissoria.Preview;
      DesabilitarHabilitarCampos(true);
      SpeedButton23.Visible := true;
    except
      DesabilitarHabilitarCampos(true);
      SpeedButton23.Visible := true;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmCadBoletos.SpeedButton25Click(Sender: TObject);
begin
	try
    if vDadosIni.PesqPros('BOL007', 'ABRIR A LIXEIRA', '', 'BOLETAS',
      '', ObBoleto.buscas, true) then
      inherited;
    if ObBoleto.abrelixeira then
    begin
//    	BitBtn3.Visible := false;
      SpeedButton1.Visible := false;
      SpeedButton3.Visible := false;
      SpeedButton5.Visible := true;

      SpeedButton6.Visible := false;
      SpeedButton8.Visible := false;
      SpeedButton11.Visible := false;
      SpeedButton7.Visible := false;
      SpeedButton26.Visible := false;
      SpeedButton24.Visible := false;
      SpeedButton20.Visible := false;
      SpeedButton9.Visible := false;
      SpeedButton10.Visible := false;
      SpeedButton21.Visible := false;
      SpeedButton13.Visible := false;
      SpeedButton14.Visible := false;
      SpeedButton16.Visible := false;
      SpeedButton18.Visible := false;
      SpeedButton19.Visible := false;
      SpeedButton22.Visible := false;
      SpeedButton12.Visible := false;

      ckLixeira.Enabled := false;
      ckLixeira.Checked := true;
      ckLixeira.Enabled := true;
    end
    else
    begin
//    	BitBtn3.Visible := true;
      SpeedButton1.Visible := true;
      SpeedButton3.Visible := true;
      SpeedButton5.Visible := false;

      SpeedButton6.Visible := true;
      SpeedButton8.Visible := true;
      SpeedButton11.Visible := true;
      SpeedButton7.Visible := true;
      SpeedButton26.Visible := true;
      SpeedButton24.Visible := true;
      SpeedButton20.Visible := true;
      SpeedButton9.Visible := true;
      SpeedButton10.Visible := true;
      SpeedButton21.Visible := true;
      SpeedButton13.Visible := true;
      SpeedButton14.Visible := true;
      SpeedButton16.Visible := true;
      SpeedButton18.Visible := true;
      SpeedButton19.Visible := true;
      SpeedButton22.Visible := true;
      SpeedButton12.Visible := true;

      ckLixeira.Enabled := false;
      ckLixeira.Checked := false;
      ckLixeira.Enabled := true;
    end;

    if ckLixeira.Checked then
      frmCadBoletos.Caption := 'Boletos (Lixeira)'
    else
      frmCadBoletos.Caption := 'Boletos';
  finally
    ObBoleto.ultimasql := ObBoleto.dataSet.CommandText;
  end;
end;

procedure TfrmCadBoletos.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('BOL025', '', '', 'BOLETAS', '', ObBoleto.buscas, false) then
  begin
    exit;
  end;
  ObBoleto._ImprimeFaturaNF(RDprint1);

end;

procedure TfrmCadBoletos.SpeedButtonAdcWhatsAppClick(Sender: TObject);
begin
  inherited;
	MaskEdit4.Text := '';
  if not vDadosIni.abreForm('Informe o telefone', pnTelefoneAvulso, TabSheet_EnvBol) then
  	exit;
end;

procedure TfrmCadBoletos.SpeedButtonRemWhatsAppClick(Sender: TObject);
begin
  inherited;
  CheckListContatoWhatsApp.DeleteSelected;
end;

procedure TfrmCadBoletos.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('BOLETOS', 'E', ObBoleto.buscas) then
    Exit;

  try
		if not ObBoleto.Delete then
    	Exit;

    vStatusLixeira := ObBoleto.StatusLixeira;
    lixeiraVazia(not vStatusLixeira);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      ObBoleto.Cancel;
      ObBoleto.RollBackTransacao;
    end;
  end;
end;

procedure TfrmCadBoletos.SpeedButton3Click(Sender: TObject);
begin
	try
  	try
      ckImprimirBoleto.Visible := True;
      ckEnviarBoleto.Visible := True;
      GroupBoxAcoes.Visible := True;

    	ImprimirEnviar('BOL010', 'IMPRIMIR');
    finally
    	ckImprimirBoleto.Visible := True;
      ckEnviarBoleto.Visible := True;
      GroupBoxAcoes.Visible := True;
    end;
  except on E: Exception do
    begin
    	vDadosIni.GravaAuditoria('BOL010', 'IMPRIMIR', 'FALHA', 'BOLETAS', '', ObBoleto.buscas);
      Application.MessageBox(PChar(pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
      vDadosIni.registraErro(e.Message);
    end;
  end;
end;

procedure TfrmCadBoletos.SpeedButton55Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('boletos_%', ObBoleto.buscas);
end;

procedure TfrmCadBoletos.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('BOLETOS', 'A', ObBoleto.buscas) then
    Exit;

  if not ObBoleto.restauraLixeira then
  	Exit;

  if ObBoleto.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);
end;

procedure TfrmCadBoletos.SpeedButton6Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('BOLETOS', 'A', ObBoleto.buscas) then
    Exit;
  if vDadosIni.PesqPros('BOL012', 'EMAIL', '', 'BOLETAS', '', ObBoleto.buscas, true) then
  begin
    inherited;
    ObBoleto.vAbortar := false;

    DesabilitarHabilitarCampos(false);

    if ObBoleto.EnviarBoletoEmail and obboleto.vVerificarComitar then
    begin

      if not ObBoleto._CommitTransaction('BOL012', 'BOLETAS',
        ObBoleto.DataSet.FieldByName('N_SEQ_BOL').AsString, 'INSERIR') then
      begin
        if (ObBoleto <> nil) then
          ObBoleto.Cancel;
        Application.MessageBox('Erro ao gravar registro, verifique as configurações. Se o erro persistir contacte o administrador da rede.', 'Erro',
          MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      end;
    end
    else
    begin
      ObBoleto.Cancel;
    end;

  end;
  DesabilitarHabilitarCampos(true);
end;

procedure TfrmCadBoletos.SpeedButton7Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('BOLETOS', 'A', ObBoleto.buscas) then
    Exit;
  if vDadosIni.PesqPros('BOL014', 'LIMPAR', '', 'BOLETAS', '', ObBoleto.buscas, true) then
  begin
    if not Obboleto.dataSet.IsEmpty then
      PageControl1.ActivePage := TabSheet6
    else
      Application.MessageBox('Nenhum boleto selecionado', 'Atenção', 0 + 64);
  end;
end;

procedure TfrmCadBoletos.SpeedButton8Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('BOLETOS', 'A', ObBoleto.buscas) then
    Exit;
  try
    vDadosIni.abreStatusProcessamento('Gerar arquivo de remessa', 'Processando informações...');

    if not vDadosIni.PesqPros('BOL013', 'REMESSA', '', 'BOLETAS', '', ObBoleto.buscas, true) then
    	exit;

    inherited;
    try
      ObBoleto.vAbortar := false;

      DesabilitarHabilitarCampos(false);

      if ObBoleto.DataSet.FieldByName('COD_COBREBEM').AsInteger > 0 then
        ObBoleto.vCobreBem.montaSelect('select * from cobrebem where cod_cobrebem =' + ObBoleto.DataSet.FieldByName('COD_COBREBEM').AsString + ' and cod_empresa =' + vDadosIni.codEmpresa);

      if ObBoleto.GerarArquivoRemessa and obboleto.vVerificarComitar then
      begin

        if not ObBoleto._CommitTransaction('BOL013', 'BOLETAS', '', 'INSERIR') then
        begin
          if (ObBoleto <> nil) then
            ObBoleto.Cancel;
          Application.MessageBox('Erro ao gravar registro, verifique as configurações. Se o erro persistir contacte o administrador da rede.', 'Erro',
            MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
        end
        else
        begin
          Application.MessageBox(pchar('Arquivo de remessa criado. Na pasta: ' + #13 +
            ObBoleto.vTemPath + 'REMESSA\'), 'Atenção', 0 + 64);
        end;
      end
      else
      begin
        ObBoleto.Cancel;
      end;

    except
      Application.MessageBox('Erro insesperado verifique as configurações. Se o erro persistir contacte o administrador da rede.', 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      DesabilitarHabilitarCampos(true);
      ObBoleto.Cancel;
      ObBoleto.dataSet.Refresh;
    end;
  finally
    DesabilitarHabilitarCampos(true);
    ObBoleto.dataSet.Refresh;
    vDadosIni.fechaStatusProcessamento;
    DBGrid1.SelectedIndex := 2;
  end;

end;

procedure TfrmCadBoletos.SpeedButton9Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('BOLETOS', 'A', ObBoleto.buscas) then
    Exit;
  try
    vDadosIni.abreStatusProcessamento('Cancelando boeltos', 'Processando informações...');

    if vDadosIni.PesqPros('BOL020', 'CANCELAR BOLETO', '', 'BOLETAS', '', ObBoleto.buscas, true)
      then
    begin
      try
        inherited;

        ObBoleto.vAbortar := false;

        DesabilitarHabilitarCampos(false);

        if ObBoleto._CancelarBoleto then
        begin

          if not ObBoleto._CommitTransaction('BOL020', 'BOLETAS',
            ObBoleto.DataSet.FieldByName('N_SEQ_BOL').AsString, 'INSERIR') then
          begin
            if (ObBoleto <> nil) then
              ObBoleto.Cancel;
            Application.MessageBox('Erro ao gravar registro. Se o erro persistir contacte o administrador da rede.', 'Erro',
              MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
          end
          else
          begin
            ShowMessage('Boleto(s) cancelado(s).');
            ObBoleto.dataSet.Refresh;
          end;
        end
        else
        begin
          ObBoleto.Cancel;
        end;
      except
        Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
          MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
        ObBoleto.Cancel;
        DesabilitarHabilitarCampos(true);
      end;
    end;
  finally
    DesabilitarHabilitarCampos(true);
    DBGrid1.SelectedIndex := 2;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmCadBoletos.TitleBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  NumeroDocExtenso: string;
begin
  inherited;
  PrintBand := ObBoleto.dataSet.FieldByName('SelecionaBoleto').Value = 'S';
  // DBGrid1.SelectedRows.CurrentRowSelected;
  if not PrintBand then
    exit;
  //  if dtm02.QRYempresa.State = dsinactive then
   //dtm02.QRYempresa.open;
  Qrlabel53.caption := obboleto.dataset.fieldbyname('N_DOC_BOL').Value;
  QRLabel54.caption := format('%n', [ObBoleto.dataSet.FieldByName('VL_DOC_BOL').AsFloat]);
  QRLabel55.caption := vDadosIni.vEmp.vnomeEmpresa;
  if length(trim(vDadosIni.vEmp.vCNPJ)) = 11 then
    QRLabel56.caption := copy(vDadosIni.vEmp.vCNPJ, 1, 3) + '.' +
      copy(vDadosIni.vEmp.vCNPJ, 4, 3) + '.' +
      copy(vDadosIni.vEmp.vCNPJ, 7, 3) + '-' +
      copy(vDadosIni.vEmp.vCNPJ, 10, 2)
  else
    QRLabel56.caption := copy(vDadosIni.vEmp.vCNPJ, 1, 2) + '.' +
      copy(vDadosIni.vEmp.vCNPJ, 3, 3) + '.' +
      copy(vDadosIni.vEmp.vCNPJ, 6, 3) + '/' +
      copy(vDadosIni.vEmp.vCNPJ, 9, 4) + '-' +
      copy(vDadosIni.vEmp.vCNPJ, 13, 2);
  //QrProcCl.close;
  //QrProcCl.params[0].value:=DTM03.QrBoletasCOD_CLIENTE.value;
  //QrProcCl.ParamByName('COD_EMPRESA').Text := FRMPrincipal.COdEmpresa;
  //QrProcCl.open;
  ObBoleto.vCliente.selecionaCliente(ObBoleto.dataSet.FieldByName('COD_CLIENTE').AsString);
  QRLabel57.caption := ObBoleto.vCliente.dataSet.FieldByName('RAZAO').value;
  if length(trim(ObBoleto.vCliente.dataSet.FieldByName('CPFCGC').AsString)) = 11 then
    QRLabel58.caption := copy(ObBoleto.vCliente.dataSet.FieldByName('CPFCGC').value, 1, 3) + '.' +
      copy(ObBoleto.vCliente.dataSet.FieldByName('CPFCGC').value, 4, 3) + '.' +
      copy(ObBoleto.vCliente.dataSet.FieldByName('CPFCGC').value, 7, 3) + '-' +
      copy(ObBoleto.vCliente.dataSet.FieldByName('CPFCGC').value, 10, 2)
  else
    QRLabel58.caption := copy(ObBoleto.vCliente.dataSet.FieldByName('CPFCGC').value, 1, 2) + '.' +
      copy(ObBoleto.vCliente.dataSet.FieldByName('CPFCGC').value, 3, 3) + '.' +
      copy(ObBoleto.vCliente.dataSet.FieldByName('CPFCGC').value, 6, 3) + '/' +
      copy(ObBoleto.vCliente.dataSet.FieldByName('CPFCGC').value, 9, 4) + '-' +
      copy(ObBoleto.vCliente.dataSet.FieldByName('CPFCGC').value, 13, 2);

  QRLabel59.caption := ObBoleto.vCliente.dataSet.FieldByName('ENDERECO').value;
  NumeroDocExtenso := vDadosIni.Extenso(ObBoleto.dataSet.FieldByName('VL_DOC_BOL').value);
  if length(NumeroDocExtenso) < 46 then
  begin
    QRLabel51.caption := NumeroDocExtenso +
      vDadosIni.Replicate('*', 46 - length(NumeroDocExtenso));
    QRLabel52.caption := vDadosIni.Replicate('*', 70);
  end
  else
  begin
    QRLabel51.caption := copy(NumeroDocExtenso, 1, 46);
    QRLabel52.caption := copy(NumeroDocExtenso, 47,
      length(NumeroDocExtenso) - 46) +
      vDadosIni.Replicate('*', 70 - (length(NumeroDocExtenso) - 46));
  end;
  QRLabel60.Caption := vDadosIni.DataPorExtenso(ObBoleto.dataSet.FieldByName('DATA_VEN_BOL').value);
end;

procedure TfrmCadBoletos.TitleBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
	vValorExtenso: string;
  vTemp1, vTemp2: string;
  vQuebreLinha: Boolean;
  I: Integer;
begin
  inherited;
  PrintBand := ObBoleto.dataSet.FieldByName('SelecionaBoleto').Value = 'S';
  // DBGrid1.SelectedRows.CurrentRowSelected;
  if not PrintBand then
    exit;

  Qrlabel61.caption := vDadosIni.vEmp.vnomeEmpresa;
  Qrlabel62.caption := vDadosIni.vEmp.vEndereco + ',' + vDadosIni.vEmp.vNumeroEnd + ' - ' + vDadosIni.vEmp.vBairro;
  Qrlabel63.caption := vDadosIni.vEmp.vCEP + ' - ' + vDadosIni.vEmp.vCidade + ' - ' + vDadosIni.vEmp.vSiglaUF;
  Qrlabel65.caption := vDadosIni.vEmp.vTelefone;
  Qrlabel69.caption := vDadosIni.vEmp.vCNPJ;
  Qrlabel68.caption := 'DATA DA EMISSÃO: ' + DateToStr(Now);
  Qrlabel70.caption := vDadosIni.vEmp.vIE;

  Qrlabel111.caption := format('%n', [ObBoleto.dataSet.FieldByName('VL_DOC_BOL').AsFloat]);
  if not obboleto.dataset.fieldbyname('NUM_NF_VND').IsNull then
    Qrlabel112.caption := obboleto.dataset.fieldbyname('NUM_NF_VND').AsString
  else
    Qrlabel112.caption := obboleto.dataset.fieldbyname('N_DOC_BOL').AsString;

  Qrlabel113.caption := format('%n', [ObBoleto.dataSet.FieldByName('VL_DOC_BOL').AsFloat]);
  Qrlabel114.caption := obboleto.dataset.fieldbyname('N_DOC_BOL').AsString;
  Qrlabel115.Caption := obboleto.dataset.fieldbyname('DATA_VEN_BOL').AsString;

  if ObBoleto.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
  begin
    ObBoleto.vCliente.selecionaCliente(ObBoleto.dataSet.FieldByName('COD_CLIENTE').AsString);
    QRLabel102.caption := ObBoleto.vCliente.dataSet.FieldByName('RAZAO').AsString;
    QRLabel103.caption := ObBoleto.vCliente.dataSet.FieldByName('ENDERECO').AsString + ', ' + ObBoleto.vCliente.dataSet.FieldByName('NUM_END_CLIENTE').AsString + ' - ' + ObBoleto.vCliente.dataSet.FieldByName('BAIRRO').AsString;
    QRLabel104.caption := ObBoleto.vCliente.dataSet.FieldByName('CIDADE').AsString;
    QRLabel108.caption := ObBoleto.vCliente.dataSet.FieldByName('SIGLA_UF').AsString;
    QRLabel109.caption := ObBoleto.vCliente.dataSet.FieldByName('CEP').AsString;
    QRLabel106.caption := ObBoleto.vCliente.dataSet.FieldByName('CPFCGC').AsString;
    QRLabel107.caption := ObBoleto.vCliente.dataSet.FieldByName('INSC_EST').AsString;
  end;

  if ObBoleto.dataSet.FieldByName('VL_DOC_BOL').AsFloat <> 0 then
  begin
    vValorExtenso := vDadosIni.Extenso(ObBoleto.dataSet.FieldByName('VL_DOC_BOL').AsFloat);

    vQuebreLinha := False;
    vTemp1 := '';
    vTemp2 := '';
    for I := 1 to Length(vValorExtenso) do
    begin
    	if not vQuebreLinha then
        if ((vValorExtenso[I] = ' ') or (vValorExtenso[I] = ',')) and (Length(vTemp1 + vValorExtenso[I]) >= 50) then
          vQuebreLinha := True;

      if not vQuebreLinha then
      	vTemp1 := vTemp1 + vValorExtenso[I]
      else
      	vTemp2 := vTemp2 + vValorExtenso[I];
    end;

    QRLabel110.Caption := trim(vTemp1);
    QRLabel118.Caption := trim(vTemp2);
  end;

  Qrlabel95.caption := Copy(vDadosIni.vEmp.vnomeEmpresa, 1, 43);
end;

initialization
  RegisterClass(TfrmCadBoletos);
finalization
  UnRegisterClass(TfrmCadBoletos);

end.

