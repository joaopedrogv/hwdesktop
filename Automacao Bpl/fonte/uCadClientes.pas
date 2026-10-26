unit uCadClientes;

interface

uses
  Windows, UClassesClientes, uCadPadraoModal, QRCtrls, QuickRpt, ExtCtrls, ComCtrls,
  StdCtrls, DBCtrls, Menus, Buttons, Grids, DBGrids, Controls, Mask, Forms,
  Classes, Messages, AppEvnts, uCadPadrao, Dialogs, ExtDlgs, jpeg, Graphics,
  uEditHw, DB, Spin, CheckLst, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP,
  IdBaseComponent, IdMessage, ImgList, DBClient, IBDatabase, ButtonGroup,
  uDataSet_OOP;{, IdSASLAnonymous, IdSASLExternal, IdSASLSKey,
  IdSASLPlain, IdSASLLogin, IdSASL, IdSASLUserPass, IdSASL_CRAM_MD5,
  IdUserPassProvider;}

type
  THackWinControl = class(TWinControl);
  TFrmCadClientes = class(TfrmCadPadraoM)
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    ScrollBox4: TScrollBox;
    ScrollBox5: TScrollBox;
    Panel4: TPanel;
    GroupBox8: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label59: TLabel;
    DBEdit18: TDBEdit;
    DBEdit15: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox8: TDBLookupComboBox;
    DBLookupComboBox9: TDBLookupComboBox;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    GroupBox9: TGroupBox;
    Label58: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label75: TLabel;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    GroupBox10: TGroupBox;
    Panel5: TPanel;
    Panel6: TPanel;
    GroupBox11: TGroupBox;
    GroupBox13: TGroupBox;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    GroupBox12: TGroupBox;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label78: TLabel;
    Label77: TLabel;
    CheckBox2: TCheckBox;
    ComboBox4: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    BitBtn7: TBitBtn;
    Panel7: TPanel;
    ProgressBar1: TProgressBar;
    BitBtn8: TBitBtn;
    TabSheet6: TTabSheet;
    PageControl2: TPageControl;
    TabSheet7: TTabSheet;
    GroupBox4: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox14: TGroupBox;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    TabSheet8: TTabSheet;
    GroupBox15: TGroupBox;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    DBEdit3: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit65: TDBEdit;
    DBEdit66: TDBEdit;
    DBEdit70: TDBEdit;
    DBEdit71: TDBEdit;
    DBEdit72: TDBEdit;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    DBEdit75: TDBEdit;
    DBMemo2: TDBMemo;
    DBEdit76: TDBEdit;
    DBEdit77: TDBEdit;
    BitBtn13: TBitBtn;
    GroupBox17: TGroupBox;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    DBLookupComboBox11: TDBLookupComboBox;
    DBLookupComboBox12: TDBLookupComboBox;
    DBLookupComboBox13: TDBLookupComboBox;
    DBEdit67: TDBEdit;
    GroupBox18: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBComboBox8: TDBComboBox;
    Label100: TLabel;
    GroupBox19: TGroupBox;
    Label20: TLabel;
    Label24: TLabel;
    Label69: TLabel;
    DBComboBox4: TDBComboBox;
    DBEdit20: TDBEdit;
    DBEdit24: TDBEdit;
    DBComboBox5: TDBComboBox;
    Label71: TLabel;
    DBEdit27: TDBEdit;
    Label27: TLabel;
    DBEdit25: TDBEdit;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    Label16: TLabel;
    DBEdit8: TDBEdit;
    GroupBox24: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    GroupBox25: TGroupBox;
    RadioGroup1: TRadioGroup;
    tsRelCliFornec: TTabSheet;
    tsProdutosFornec: TTabSheet;
    GroupBox26: TGroupBox;
    tsFichaFin: TTabSheet;
    GroupBox27: TGroupBox;
    DBGrid5: TDBGrid;
    GroupBox28: TGroupBox;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    GroupBox29: TGroupBox;
    DBGrid6: TDBGrid;
    GroupBox30: TGroupBox;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    GroupBox31: TGroupBox;
    DBGrid7: TDBGrid;
    GroupBox32: TGroupBox;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    GroupBox34: TGroupBox;
    GroupBox21: TGroupBox;
    Label17: TLabel;
    Label184: TLabel;
    DBEdit13: TDBEdit;
    DBComboBox41: TDBComboBox;
    GroupBox22: TGroupBox;
    GroupBox35: TGroupBox;
    Label23: TLabel;
    Label60: TLabel;
    Label106: TLabel;
    DBEdit23: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit80: TDBEdit;
    Label102: TLabel;
    DBEdit69: TDBEdit;
    GroupBox20: TGroupBox;
    Label70: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label65: TLabel;
    Label68: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label103: TLabel;
    Label72: TLabel;
    Label114: TLabel;
    DBComboBox7: TDBComboBox;
    DBEdit62: TDBEdit;
    DBEdit59: TDBEdit;
    DBComboBox3: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBEdit60: TDBEdit;
    DBEdit78: TDBEdit;
    DBComboBox6: TDBComboBox;
    DBEdit84: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    GroupBox33: TGroupBox;
    Label9: TLabel;
    Label101: TLabel;
    Label113: TLabel;
    Label13: TLabel;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    DBEdit68: TDBEdit;
    DBEdit83: TDBEdit;
    DBEdit11: TDBEdit;
    DBLookupComboBox6: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    GroupBox23: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    Label107: TLabel;
    DBEdit81: TDBEdit;
    GroupBox36: TGroupBox;
    Label108: TLabel;
    DBEdit82: TDBEdit;
    Edit3: TEdit;
    Label15: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label105: TLabel;
    DBEdit79: TDBEdit;
    Label104: TLabel;
    DBComboBox9: TDBComboBox;
    DBLookupComboBox10: TDBLookupComboBox;
    DBEdit63: TDBEdit;
    Label12: TLabel;
    Label124: TLabel;
    DBEdit86: TDBEdit;
    Label125: TLabel;
    DBEdit87: TDBEdit;
    Label126: TLabel;
    DBLookupComboBox14: TDBLookupComboBox;
    GroupBox7: TGroupBox;
    BitBtn22: TBitBtn;
    GroupBox37: TGroupBox;
    GroupBox38: TGroupBox;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    Label127: TLabel;
    DBEdit88: TDBEdit;
    DBLookupComboBox7: TDBLookupComboBox;
    Label10: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit10: TDBEdit;
    tsCodigoFornecedor: TTabSheet;
    pnCodigoFornecedor: TPanel;
    GroupBox39: TGroupBox;
    DBGrid8: TDBGrid;
    Panel9: TPanel;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton13: TSpeedButton;
    GroupBox40: TGroupBox;
    Label128: TLabel;
    Label129: TLabel;
    Edit4: TEdit;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    Label130: TLabel;
    DBEdit89: TDBEdit;
    tsIdetificacoFotografica: TTabSheet;
    OpenPictureDialog1: TOpenPictureDialog;
    ScrollBox6: TScrollBox;
    tsContratos: TTabSheet;
    pnContratos: TPanel;
    GroupBox41: TGroupBox;
    DBGrid9: TDBGrid;
    Panel10: TPanel;
    SpeedButton21: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButton35: TSpeedButton;
    pnContratoCadastro: TPanel;
    Label131: TLabel;
    EditHw1: TEditHw;
    DBLookupComboBox15: TDBLookupComboBox;
    Label132: TLabel;
    EditHw2: TEditHw;
    DBLookupComboBox16: TDBLookupComboBox;
    Label133: TLabel;
    EditHw3: TEditHw;
    Label134: TLabel;
    EditHw4: TEditHw;
    Bevel1: TBevel;
    Label135: TLabel;
    MaskEdit10: TMaskEdit;
    Label136: TLabel;
    MaskEdit11: TMaskEdit;
    Bevel2: TBevel;
    Label137: TLabel;
    Label138: TLabel;
    ComboBox9: TComboBox;
    Panel12: TPanel;
    BitBtn23: TBitBtn;
    BitBtn21: TBitBtn;
    pnContratoHistorico: TPanel;
    GroupBox42: TGroupBox;
    Panel13: TPanel;
    BitBtn25: TBitBtn;
    BitBtn24: TBitBtn;
    DBGrid10: TDBGrid;
    pnContratoRelatorios: TPanel;
    SpeedButton36: TSpeedButton;
    Panel14: TPanel;
    ScrollBox7: TScrollBox;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    QRSysData4: TQRSysData;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRSysData5: TQRSysData;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    DetailBand3: TQRBand;
    QRDBText14: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRBand2: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel25: TQRLabel;
    QRLabel28: TQRLabel;
    Label140: TLabel;
    DBLookupComboBox17: TDBLookupComboBox;
    DBEdit90: TDBEdit;
    QRBand4: TQRBand;
    QRLabel29: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel30: TQRLabel;
    QRDBText19: TQRDBText;
    QRLabel31: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel16: TQRLabel;
    QRLabel32: TQRLabel;
    ComboBox13: TComboBox;
    Label141: TLabel;
    QRLabel33: TQRLabel;
    QRDBText20: TQRDBText;
    DBCheckBox1: TDBCheckBox;
    SpeedButton37: TSpeedButton;
    SpeedButton38: TSpeedButton;
    Label142: TLabel;
    DBEdit91: TDBEdit;
    DBLookupComboBox18: TDBLookupComboBox;
    pnEquip: TPanel;
    GroupBox43: TGroupBox;
    Panel15: TPanel;
    DBGrid11: TDBGrid;
    BitBtn19: TBitBtn;
    BitBtn30: TBitBtn;
    Label143: TLabel;
    Label144: TLabel;
    SpeedButton39: TSpeedButton;
    Label156: TLabel;
    CheckBox5: TCheckBox;
    MaskEdit16: TMaskEdit;
    Label157: TLabel;
    EditHw5: TEditHw;
    DBLookupComboBox19: TDBLookupComboBox;
    Label158: TLabel;
    PageControl6: TPageControl;
    TabSheet9: TTabSheet;
    BitBtn29: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    TabSheet10: TTabSheet;
    ComboBox10: TComboBox;
    Label139: TLabel;
    CheckBox4: TCheckBox;
    RadioGroup2: TRadioGroup;
    Label159: TLabel;
    MaskEdit17: TMaskEdit;
    BitBtn38: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    CheckBox6: TCheckBox;
    BitBtn41: TBitBtn;
    DetailBandCliFornec: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel10: TQRLabel;
    QRBand3: TQRBand;
    QRLabel15: TQRLabel;
    QRShape3: TQRShape;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel3: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel12: TQRLabel;
    qrpClienteFornec: TQuickRep;
    qrpClienteFornecDataNasc: TQuickRep;
    QRBand5: TQRBand;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRLabel34: TQRLabel;
    QRBand6: TQRBand;
    QRLabel35: TQRLabel;
    QRShape7: TQRShape;
    QRBand7: TQRBand;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRSysData6: TQRSysData;
    QRLabel38: TQRLabel;
    QRSysData7: TQRSysData;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
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
    QRDBText29: TQRDBText;
    GroupBox44: TGroupBox;
    Label145: TLabel;
    DBComboBox10: TDBComboBox;
    Label146: TLabel;
    DBEdit92: TDBEdit;
    Label147: TLabel;
    DBEdit93: TDBEdit;
    CheckBox7: TCheckBox;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    tsEmailCliente: TTabSheet;
    pnEnviarCartaViaEmail: TPanel;
    Panel51: TPanel;
    BitBtn31: TBitBtn;
    BitBtn42: TBitBtn;
    Panel56: TPanel;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    LabelRemetente: TLabel;
    EditPara: TEdit;
    EditCC: TEdit;
    EditCCO: TEdit;
    EditAssunto: TEdit;
    MemoAnexos: TMemo;
    BitBtn32: TBitBtn;
    ComboBoxPrioridade: TComboBox;
    odAnexos: TOpenDialog;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    SpeedButton40: TSpeedButton;
    BitBtn33: TBitBtn;
    EditFonteHtml: TEdit;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    SaveDialog1: TSaveDialog;
    CheckBoxEmail: TCheckBox;
    pnCodigoFornecedorCad: TPanel;
    DBEdit94: TDBEdit;
    Label153: TLabel;
    Label154: TLabel;
    DBEdit95: TDBEdit;
    Label155: TLabel;
    DBEdit97: TDBEdit;
    Label160: TLabel;
    DBEdit96: TDBEdit;
    Label162: TLabel;
    DBEdit99: TDBEdit;
    Panel16: TPanel;
    BitBtn34: TBitBtn;
    BitBtn35: TBitBtn;
    SpeedButton41: TSpeedButton;
    DBEdit98: TDBEdit;
    Label161: TLabel;
    PageControl4: TPageControl;
    tsMsgEmail1: TTabSheet;
    tsMsgEmail2: TTabSheet;
    RichEditMsg: TRichEdit;
    RichEditMsg2: TRichEdit;
    BitBtn36: TBitBtn;
    EditArquivoTexto: TEdit;
    tsMsgModeloCarta: TTabSheet;
    RichEditMsg3: TRichEdit;
    CheckModeloCarta: TCheckBox;
    ComboBoxModeloCarta: TComboBox;
    SpeedButton42: TSpeedButton;
    SpeedButton43: TSpeedButton;
    Label163: TLabel;
    SpeedButton44: TSpeedButton;
    tsCarteiras: TTabSheet;
    pnCarteiras: TPanel;
    GroupBox45: TGroupBox;
    Panel17: TPanel;
    GroupBox46: TGroupBox;
    Panel18: TPanel;
    DBLookupComboBox20: TDBLookupComboBox;
    DBGrid12: TDBGrid;
    GroupBox47: TGroupBox;
    Panel19: TPanel;
    Edit5: TEdit;
    Panel20: TPanel;
    Edit6: TEdit;
    Panel21: TPanel;
    Edit7: TEdit;
    Panel22: TPanel;
    Edit8: TEdit;
    Panel23: TPanel;
    Edit9: TEdit;
    Panel24: TPanel;
    Edit10: TEdit;
    GroupBox48: TGroupBox;
    DBLookupComboBox21: TDBLookupComboBox;
    Panel26: TPanel;
    SpeedButton46: TSpeedButton;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    PopupMenu3: TPopupMenu;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    BitBtn37: TBitBtn;
    Panel25: TPanel;
    Label170: TLabel;
    Label171: TLabel;
    Label172: TLabel;
    Label173: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    imgCarteiras: TImage;
    btUnSelectTodos: TSpeedButton;
    btSelectTodos: TSpeedButton;
    tsFormaPag: TTabSheet;
    Panel27: TPanel;
    Label174: TLabel;
    gridCondPag: TDBGrid;
    Panel28: TPanel;
    Label175: TLabel;
    tsModeloCartas: TTabSheet;
    pnModeloCartas: TPanel;
    Panel29: TPanel;
    DBGrid14: TDBGrid;
    SpeedButton45: TSpeedButton;
    Panel30: TPanel;
    Panel31: TPanel;
    BitBtn43: TBitBtn;
    Label177: TLabel;
    DBEdit100: TDBEdit;
    DBLookupComboBox22: TDBLookupComboBox;
    Label178: TLabel;
    DBEdit101: TDBEdit;
    Label179: TLabel;
    DBEdit102: TDBEdit;
    tsAtributos: TTabSheet;
    GroupBox49: TGroupBox;
    Panel32: TPanel;
    Label199: TLabel;
    EditFiscal1: TEditFiscal;
    Panel33: TPanel;
    Panel34: TPanel;
    DBGrid15: TDBGrid;
    Label181: TLabel;
    DBEdit103: TDBEdit;
    Label180: TLabel;
    DBComboBox11: TDBComboBox;
    Label164: TLabel;
    pnFoto: TPanel;
    DtFotosCli: TDataSource;
    Panel8: TPanel;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton47: TSpeedButton;
    Panel37: TPanel;
    Panel11: TPanel;
    Panel35: TPanel;
    BitBtn20: TBitBtn;
    ImageCli: TImage;
    ImageCliSemFoto: TImage;
    SpeedButton48: TSpeedButton;
    SpeedButton49: TSpeedButton;
    SpeedButton50: TSpeedButton;
    SpeedButton51: TSpeedButton;
    SpeedButton52: TSpeedButton;
    DBGrid16: TDBGrid;
    SpeedButton53: TSpeedButton;
    SaveDialog2: TSaveDialog;
    GroupBox50: TGroupBox;
    Label165: TLabel;
    ComboBox14: TComboBox;
    Label166: TLabel;
    DBComboBox12: TDBComboBox;
    SpeedButton54: TSpeedButton;
    lbEmailDependentes: TLabel;
    dbEditEmailDep: TDBEdit;
    spBtConsWSCEPDep: TSpeedButton;
    Label168: TLabel;
    DBComboBox13: TDBComboBox;
    Label18: TLabel;
    Label169: TLabel;
    DBComboBox14: TDBComboBox;
    DBEdit104: TDBEdit;
    Label182: TLabel;
    Label183: TLabel;
    DBComboBox15: TDBComboBox;
    Label185: TLabel;
    DBEdit105: TDBEdit;
    Label186: TLabel;
    DBEdit106: TDBEdit;
    Label187: TLabel;
    DBEdit107: TDBEdit;
    tsDadosFiscais: TTabSheet;
    GroupBox51: TGroupBox;
    lbCPFCNPJ: TLabel;
    dbTextCPFCNPJ: TDBText;
    lbInscEst: TLabel;
    dbTextInscEst: TDBText;
    dbCheckConsumidorFinal: TDBCheckBox;
    dbgroupSTSaida_DadosFiscais: TDBRadioGroup;
    dbgroupIndInscricao: TDBRadioGroup;
    lbIdentEstrang: TLabel;
    dbIDEntrang: TDBEdit;
    groupAutXML: TGroupBox;
    lbxAutXML: TListBox;
    spBtAutXMLAdicionar: TSpeedButton;
    spBtAutXMLRemover: TSpeedButton;
    QRLabel52: TQRLabel;
    tsCadastroSimples: TTabSheet;
    Panel36: TPanel;
    pageCadSimples: TPageControl;
    tsSDadosPessoais: TTabSheet;
    ScrollBox9: TScrollBox;
    tsSDadosAdicionais: TTabSheet;
    tsSReferenciasSPC: TTabSheet;
    tsSImagens: TTabSheet;
    tsSAtributosSimples: TTabSheet;
    tsSFormasDePagamento: TTabSheet;
    Label193: TLabel;
    Label194: TLabel;
    DBEdit110: TDBEdit;
    Label230: TLabel;
    DBEdit111: TDBEdit;
    Label195: TLabel;
    DBEdit112: TDBEdit;
    Label196: TLabel;
    DBEdit113: TDBEdit;
    Label197: TLabel;
    Label198: TLabel;
    DBEdit114: TDBEdit;
    Label200: TLabel;
    DBEdit115: TDBEdit;
    Label201: TLabel;
    DBEdit116: TDBEdit;
    Label202: TLabel;
    DBEdit117: TDBEdit;
    Label203: TLabel;
    DBEdit118: TDBEdit;
    Label204: TLabel;
    DBEdit119: TDBEdit;
    Label205: TLabel;
    DBLookupComboBox28: TDBLookupComboBox;
    Label206: TLabel;
    DBLookupComboBox29: TDBLookupComboBox;
    Label207: TLabel;
    Label208: TLabel;
    DBEdit121: TDBEdit;
    Label209: TLabel;
    DBEdit122: TDBEdit;
    DBEdit124: TDBEdit;
    Label211: TLabel;
    DBEdit125: TDBEdit;
    Label212: TLabel;
    DBEdit126: TDBEdit;
    Label213: TLabel;
    Label214: TLabel;
    DBEdit127: TDBEdit;
    Label215: TLabel;
    DBEdit128: TDBEdit;
    Label216: TLabel;
    DBEdit129: TDBEdit;
    btnDadosPessoaisAd: TSpeedButton;
    tsModais: TTabSheet;
    ScrollBox150: TScrollBox;
    pnDadosPessoais_DadosPessoais: TPanel;
    GroupBox52: TGroupBox;
    Panel39: TPanel;
    BitBtn44: TBitBtn;
    btnEdendecoAd: TSpeedButton;
    btnDocumentosAd: TSpeedButton;
    pnDadosPessoais_ContatosTelefone: TPanel;
    GroupBoxContato: TGroupBox;
    Panel40: TPanel;
    BitBtn45: TBitBtn;
    Label223: TLabel;
    Label224: TLabel;
    Label231: TLabel;
    DBEdit134: TDBEdit;
    Label232: TLabel;
    DBLookupComboBox30: TDBLookupComboBox;
    SpeedButton59: TSpeedButton;
    LabelSeq_: TLabel;
    CheckCadSeq_: TCheckBox;
    BitBtn_4: TBitBtn;
    BitBtn_5: TBitBtn;
    BitBtn_6: TBitBtn;
    listImgTela: TImageList;
    popMenuTela: TPopupMenu;
    CadastroNormal1: TMenuItem;
    N1: TMenuItem;
    CadastroSimplificado1: TMenuItem;
    DadosPessoais1: TMenuItem;
    DadosComplementares1: TMenuItem;
    Label234: TLabel;
    DBEdit135: TDBEdit;
    Label235: TLabel;
    Label236: TLabel;
    DBEdit136: TDBEdit;
    Label237: TLabel;
    DBEdit137: TDBEdit;
    Label238: TLabel;
    DBEdit144: TDBEdit;
    DBLookupComboBox32: TDBLookupComboBox;
    DBLookupComboBox33: TDBLookupComboBox;
    DBLookupComboBox34: TDBLookupComboBox;
    btnContatoTelefoneAd: TSpeedButton;
    SpeedButton61: TSpeedButton;
    pnDadosPessoais_Endereco: TPanel;
    Panel41: TPanel;
    BitBtn46: TBitBtn;
    dbgridLookUp: TDBGrid;
    pnDadosPessoais_Documentos: TPanel;
    GroupBox57: TGroupBox;
    Panel43: TPanel;
    BitBtn47: TBitBtn;
    Label254: TLabel;
    DBEdit157: TDBEdit;
    pnDadosPessoais_Outros: TPanel;
    GroupBox55: TGroupBox;
    Panel44: TPanel;
    BitBtn48: TBitBtn;
    Label266: TLabel;
    DBEdit163: TDBEdit;
    Label267: TLabel;
    DBEdit164: TDBEdit;
    Label268: TLabel;
    DBEdit165: TDBEdit;
    Label269: TLabel;
    DBEdit166: TDBEdit;
    Label255: TLabel;
    DBLookupComboBox36: TDBLookupComboBox;
    btnObsOutrosAd: TSpeedButton;
    Label210: TLabel;
    DBLookupComboBox26: TDBLookupComboBox;
    Label218: TLabel;
    DBLookupComboBox31: TDBLookupComboBox;
    Label219: TLabel;
    DBEdit120: TDBEdit;
    Label220: TLabel;
    DBEdit123: TDBEdit;
    Label276: TLabel;
    Label253: TLabel;
    DBMemo4: TDBMemo;
    Label282: TLabel;
    DBLookupComboBox53: TDBLookupComboBox;
    btnSDadosAdicionais: TSpeedButton;
    btnSRferenciasSPC: TSpeedButton;
    btnSImagens: TSpeedButton;
    btnsAtributos: TSpeedButton;
    btnsFormasPagamento: TSpeedButton;
    pnSDadosAdicionais: TPanel;
    ScrollBox10: TScrollBox;
    Panel42: TPanel;
    Label221: TLabel;
    Label222: TLabel;
    Label225: TLabel;
    Label227: TLabel;
    Label228: TLabel;
    Label229: TLabel;
    Label239: TLabel;
    Label240: TLabel;
    Label241: TLabel;
    Label242: TLabel;
    Label243: TLabel;
    Label244: TLabel;
    Label245: TLabel;
    Label251: TLabel;
    Label252: TLabel;
    Label258: TLabel;
    Label264: TLabel;
    Label265: TLabel;
    Label270: TLabel;
    Label271: TLabel;
    Label272: TLabel;
    Label273: TLabel;
    Label274: TLabel;
    Label275: TLabel;
    Label280: TLabel;
    Label217: TLabel;
    Label256: TLabel;
    Label281: TLabel;
    Label283: TLabel;
    Label284: TLabel;
    SpeedButton62: TSpeedButton;
    SpeedButton65: TSpeedButton;
    Label310: TLabel;
    Label313: TLabel;
    Label314: TLabel;
    DBEdit130: TDBEdit;
    DBEdit131: TDBEdit;
    DBEdit132: TDBEdit;
    DBEdit133: TDBEdit;
    DBEdit138: TDBEdit;
    Edit12: TEdit;
    DBLookupComboBox40: TDBLookupComboBox;
    DBLookupComboBox41: TDBLookupComboBox;
    DBEdit140: TDBEdit;
    DBEdit141: TDBEdit;
    DBEdit142: TDBEdit;
    DBLookupComboBox42: TDBLookupComboBox;
    DBLookupComboBox43: TDBLookupComboBox;
    DBLookupComboBox44: TDBLookupComboBox;
    DBLookupComboBox45: TDBLookupComboBox;
    DBLookupComboBox46: TDBLookupComboBox;
    DBEdit143: TDBEdit;
    DBLookupComboBox47: TDBLookupComboBox;
    DBLookupComboBox48: TDBLookupComboBox;
    DBLookupComboBox49: TDBLookupComboBox;
    DBLookupComboBox50: TDBLookupComboBox;
    DBLookupComboBox37: TDBLookupComboBox;
    DBLookupComboBox52: TDBLookupComboBox;
    DBEdit147: TDBEdit;
    DBEdit148: TDBEdit;
    DBEdit183: TDBEdit;
    DBLookupComboBox54: TDBLookupComboBox;
    pnSReferenciasSPC: TPanel;
    ScrollBox11: TScrollBox;
    Label285: TLabel;
    Label286: TLabel;
    Label287: TLabel;
    Label288: TLabel;
    Label289: TLabel;
    Label290: TLabel;
    Label291: TLabel;
    Label292: TLabel;
    Label293: TLabel;
    Label294: TLabel;
    Label295: TLabel;
    Label296: TLabel;
    Label297: TLabel;
    Label298: TLabel;
    Label299: TLabel;
    Label300: TLabel;
    Label301: TLabel;
    Label302: TLabel;
    Label303: TLabel;
    Label304: TLabel;
    Label305: TLabel;
    Label306: TLabel;
    Label307: TLabel;
    Label308: TLabel;
    Label309: TLabel;
    Label311: TLabel;
    Label312: TLabel;
    SpeedButton66: TSpeedButton;
    DBEdit149: TDBEdit;
    DBEdit154: TDBEdit;
    DBEdit155: TDBEdit;
    DBEdit156: TDBEdit;
    DBEdit160: TDBEdit;
    DBEdit161: TDBEdit;
    DBEdit162: TDBEdit;
    DBEdit167: TDBEdit;
    DBEdit168: TDBEdit;
    DBEdit169: TDBEdit;
    DBEdit170: TDBEdit;
    DBEdit171: TDBEdit;
    DBEdit172: TDBEdit;
    DBEdit173: TDBEdit;
    DBEdit174: TDBEdit;
    DBEdit175: TDBEdit;
    DBEdit176: TDBEdit;
    DBEdit177: TDBEdit;
    DBEdit178: TDBEdit;
    DBEdit179: TDBEdit;
    DBEdit180: TDBEdit;
    DBEdit181: TDBEdit;
    DBEdit182: TDBEdit;
    DBLookupComboBox55: TDBLookupComboBox;
    pnSImagens: TPanel;
    pnSAtributos: TPanel;
    pnSFormasPagamento: TPanel;
    DBMemo5: TDBMemo;
    Label188: TLabel;
    Label189: TLabel;
    DBLookupComboBox24: TDBLookupComboBox;
    Label190: TLabel;
    DBLookupComboBox25: TDBLookupComboBox;
    Panel45: TPanel;
    Panel46: TPanel;
    lbSAutXML: TListBox;
    tsSCRM: TTabSheet;
    pnSCRM: TPanel;
    ScrollBox8: TScrollBox;
    Label277: TLabel;
    Label278: TLabel;
    Label279: TLabel;
    DBLookupComboBox51: TDBLookupComboBox;
    DBEdit146: TDBEdit;
    Label191: TLabel;
    Label192: TLabel;
    DBEdit108: TDBEdit;
    Label315: TLabel;
    DBEdit109: TDBEdit;
    DBEdit184: TDBEdit;
    Label316: TLabel;
    DBEdit185: TDBEdit;
    Label317: TLabel;
    DBEdit186: TDBEdit;
    Label318: TLabel;
    DBLookupComboBox56: TDBLookupComboBox;
    Label319: TLabel;
    DBEdit187: TDBEdit;
    Label320: TLabel;
    DBEdit188: TDBEdit;
    Label321: TLabel;
    DBEdit189: TDBEdit;
    btnSCRM: TSpeedButton;
    Label322: TLabel;
    DBText6: TDBText;
    Label323: TLabel;
    DBText7: TDBText;
    Label324: TLabel;
    DBText8: TDBText;
    Label325: TLabel;
    lbUsuarioCadastrou: TLabel;
    tsEscolherPossivelCliente: TTabSheet;
    pnEscolherPossivelCliente: TPanel;
    Panel47: TPanel;
    Label326: TLabel;
    DBGrid17: TDBGrid;
    Panel48: TPanel;
    BitBtn49: TBitBtn;
    BitBtn50: TBitBtn;
    Edit11: TEdit;
    Label327: TLabel;
    Label328: TLabel;
    DBEdit190: TDBEdit;
    tsVeiculos: TTabSheet;
    Panel49: TPanel;
    Label329: TLabel;
    Label330: TLabel;
    Label331: TLabel;
    Label332: TLabel;
    Label333: TLabel;
    Label334: TLabel;
    Label335: TLabel;
    DBEdit191: TDBEdit;
    DBEdit192: TDBEdit;
    DBEdit193: TDBEdit;
    DBEdit194: TDBEdit;
    DBLookupComboBox57: TDBLookupComboBox;
    DBEdit195: TDBEdit;
    DBEdit196: TDBEdit;
    DBEdit197: TDBEdit;
    Label336: TLabel;
    DBEdit198: TDBEdit;
    SpeedButton56: TSpeedButton;
    pnObsMaxmized: TPanel;
    Panel50: TPanel;
    BitBtn51: TBitBtn;
    Label337: TLabel;
    DBMemo6: TDBMemo;
    SpeedButton58: TSpeedButton;
    SpeedButton57: TSpeedButton;
    Label338: TLabel;
    DBEdit199: TDBEdit;
    Label339: TLabel;
    DBEdit200: TDBEdit;
    BitBtn52: TBitBtn;
    BitBtn53: TBitBtn;
    BitBtn54: TBitBtn;
    BitBtn55: TBitBtn;
    pnCondPags: TPanel;
    Label176: TLabel;
    gridCondPagVND: TDBGrid;
    Label342: TLabel;
    Panel52: TPanel;
    Label343: TLabel;
    gridCondPagPRE: TDBGrid;
    Label344: TLabel;
    Panel53: TPanel;
    SpeedButton60: TSpeedButton;
    tsContaCorrente: TTabSheet;
    pnContaCorrente: TPanel;
    GroupBox63: TGroupBox;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText25: TDBText;
    Label340: TLabel;
    Label341: TLabel;
    DBText11: TDBText;
    PageControl5: TPageControl;
    tsConsContaCorrente: TTabSheet;
    tsIncluirContaCorrente: TTabSheet;
    Panel54: TPanel;
    BitBtnIncluirExtratoContaCorrente: TBitBtn;
    BitBtnExcluirExtratoContaCorrente: TBitBtn;
    Panel57: TPanel;
    BitBtnOKExtratoContaCorrente: TBitBtn;
    BitBtnCancelarExtratoContaCorrente: TBitBtn;
    GroupBox56: TGroupBox;
    Panel58: TPanel;
    Label345: TLabel;
    Label346: TLabel;
    Label347: TLabel;
    DBEdit201: TDBEdit;
    DBEdit202: TDBEdit;
    BitBtnAtualizarExtratoContaCorrente: TBitBtn;
    PopupMenu4: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    BitBtnSairExtratoContaCorrente: TBitBtn;
    Label349: TLabel;
    Label350: TLabel;
    Panel55: TPanel;
    Label351: TLabel;
    Panel59: TPanel;
    Label352: TLabel;
    BitBtnGerarValeExtratoContaCorrente: TBitBtn;
    BitBtnVisualizarVencidosExtratoContaCorrente: TBitBtn;
    BitBtnVoltarExtratoContaCorrente: TBitBtn;
    Panel60: TPanel;
    BitBtnPrimeiroExtratoContaCorrente: TSpeedButton;
    BitBtnAnteriorExtratoContaCorrente: TSpeedButton;
    BitBtnProximoExtratoContaCorrente: TSpeedButton;
    BitBtnUltimoExtratoContaCorrente: TSpeedButton;
    tsValeTroca: TTabSheet;
    pnValeTroca: TPanel;
    PageControl7: TPageControl;
    tsOpcaoValeCompra: TTabSheet;
    tsOpcaoValeTroca: TTabSheet;
    DBGridValeCompraProgFid: TDBGrid;
    Panel62: TPanel;
    Label353: TLabel;
    Label354: TLabel;
    pnInfValorVale: TPanel;
    Label358: TLabel;
    EditHwPontosVale: TEditHw;
    Label356: TLabel;
    Label355: TLabel;
    EditHwValorVale: TEditHw;
    Panel61: TPanel;
    BitBtn62: TBitBtn;
    BitBtn63: TBitBtn;
    Panel63: TPanel;
    lbInfVale: TLabel;
    lbValorVale: TLabel;
    Label357: TLabel;
    Label359: TLabel;
    Panel64: TPanel;
    Label360: TLabel;
    Panel65: TPanel;
    Label361: TLabel;
    ComboBoxFiltro: TComboBox;
    EditFiltro: TEdit;
    GroupBox59: TGroupBox;
    DBGrid19: TDBGrid;
    DBGridTempValeTroca: TDBGrid;
    Panel66: TPanel;
    BitBtn107: TBitBtn;
    Panel67: TPanel;
    BitBtn106: TBitBtn;
    PopupMenu5: TPopupMenu;
    EditarQtdeValeTroca: TMenuItem;
    LabelPontosValeTroca: TLabel;
    LabelValorValeTroca: TLabel;
    lbValorValeLanc: TLabel;
    Panel68: TPanel;
    PanelTreeView: TPanel;
    Splitter6: TSplitter;
    Panel69: TPanel;
    GroupBox58: TGroupBox;
    ScrollBox12: TScrollBox;
    DBGrid18: TDBGrid;
    BitBtnTransferirSaldoExtratoContaCorrente: TBitBtn;
    tsTransSaldo: TTabSheet;
    pnTranfSaldo: TPanel;
    GroupBox60: TGroupBox;
    DBGrid20: TDBGrid;
    Panel70: TPanel;
    BitBtn65: TBitBtn;
    BitBtn67: TBitBtn;
    DBComboBox16: TDBComboBox;
    GroupBoxEmpresaProgFid: TGroupBox;
    Label363: TLabel;
    Label362: TLabel;
    BitBtnVisualizarTransferenciaExtratoContaCorrente: TBitBtn;
    pnTransferenciasSaldo: TPanel;
    GroupBox61: TGroupBox;
    DBGrid21: TDBGrid;
    Panel72: TPanel;
    BitBtn68: TBitBtn;
    BitBtn69: TBitBtn;
    labelIdentificacaoLanc: TLabel;
    labelCPFCNPJLanc: TLabel;
    PopupMenu6: TPopupMenu;
    MarcaTransferenciacomoUtilizada: TMenuItem;
    imgInformation2: TImage;
    pgDadosAd: TPageControl;
    tsDadosAdOutros: TTabSheet;
    tsEndDocAdicionais: TTabSheet;
    pnAdicionaisEndDoc: TPanel;
    groupEndDocAd: TGroupBox;
    gridEndDocAdd: TDBGrid;
    Panel71: TPanel;
    SpeedButton70: TSpeedButton;
    SpeedButton71: TSpeedButton;
    group_enddocad_cad: TGroupBox;
    Label364: TLabel;
    Label616: TLabel;
    Label634: TLabel;
    Label635: TLabel;
    Label636: TLabel;
    Label638: TLabel;
    Label639: TLabel;
    Label640: TLabel;
    Label641: TLabel;
    Label642: TLabel;
    Label643: TLabel;
    Label645: TLabel;
    Label644: TLabel;
    Label365: TLabel;
    SpeedButton72: TSpeedButton;
    DBEdit203: TDBEdit;
    DBEdit328: TDBEdit;
    DBEdit329: TDBEdit;
    DBEdit330: TDBEdit;
    DBEdit331: TDBEdit;
    DBLookupComboBox58: TDBLookupComboBox;
    Panel73: TPanel;
    btSalvarEndDoc: TBitBtn;
    btCancelEndDoc: TBitBtn;
    DBEdit332: TDBEdit;
    DBEdit333: TDBEdit;
    DBEdit334: TDBEdit;
    DBEdit335: TDBEdit;
    DBEdit336: TDBEdit;
    DBEdit337: TDBEdit;
    DBEdit338: TDBEdit;
    DBEdit339: TDBEdit;
    DBEdit340: TDBEdit;
    pgDadosAdSimples: TPageControl;
    tsEndCombrancaSimples: TTabSheet;
    tsEndDocAdicionaisSimples: TTabSheet;
    GroupBox54: TGroupBox;
    Panel38: TPanel;
    Label259: TLabel;
    Label246: TLabel;
    Label247: TLabel;
    SpeedButton63: TSpeedButton;
    Label248: TLabel;
    Label249: TLabel;
    Label250: TLabel;
    Label260: TLabel;
    Label257: TLabel;
    DBEdit150: TDBEdit;
    DBEdit151: TDBEdit;
    DBEdit152: TDBEdit;
    DBEdit153: TDBEdit;
    DBLookupComboBox35: TDBLookupComboBox;
    DBLookupComboBox38: TDBLookupComboBox;
    tsDocProgFid: TTabSheet;
    pnDocProgFid: TPanel;
    GroupBox64: TGroupBox;
    DBGrid22: TDBGrid;
    Panel75: TPanel;
    BitBtn71: TBitBtn;
    BitBtn70: TBitBtn;
    Panel74: TPanel;
    GroupBox65: TGroupBox;
    MaskEditDataIni: TMaskEdit;
    Label590: TLabel;
    Label366: TLabel;
    MaskEditDataFim: TMaskEdit;
    ckReq: TCheckBox;
    ckOS: TCheckBox;
    ckComFat: TCheckBox;
    BitBtn72: TBitBtn;
    Panel76: TPanel;
    Label367: TLabel;
    tsDadosAdReferencias: TTabSheet;
    GroupBox16: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit4: TDBEdit;
    Edit1: TEdit;
    DBComboBox1: TDBComboBox;
    GroupBox5: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    GroupBox6: TGroupBox;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label167: TLabel;
    SpeedButton55: TSpeedButton;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit19: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox23: TDBLookupComboBox;
    TabSheet11: TTabSheet;
    Label368: TLabel;
    //**** RELEASE ICMS DESONERADO ****
    ed_finalidade: TDBLookupComboBox;
    lb_finalidade: TLabel;
    lb_finalidade_sim: TLabel;
    ed_finalidade_sim: TDBLookupComboBox;
    //**** RELEASE ICMS DESONERADO ****
    btgoup_rotaent_compl: TButtonGroup;
    Label369: TLabel;
    btgoup_rotaent_simpl: TButtonGroup;
    btgoup_rotaent_add: TButtonGroup;
    btEditEndDocAd: TSpeedButton;
    Label370: TLabel;
    ed_enddoc_localidade: TDBLookupComboBox;
    ImprimirReciboProgFid: TMenuItem;
    group_trib_pref: TGroupBox;
    btgoup_trib_pref_com: TButtonGroup;
    btgoup_trib_pref_add: TButtonGroup;
    Label371: TLabel;
    Label372: TLabel;
    btgoup_trib_pref_sim: TButtonGroup;
    bt_trib_pref_new: TSpeedButton;
    bt_trib_pref_new_simp: TSpeedButton;
    SpeedButton74: TSpeedButton;
    tsResgatarVale: TTabSheet;
    pnResgatarVale: TPanel;
    GroupBoxResgatarVale: TGroupBox;
    DBGridResgatarVale: TDBGrid;
    PanelButtonResgatarVale: TPanel;
    Label373: TLabel;
    BitBtnVoltarResgatarVale: TBitBtn;
    Panel79: TPanel;
    BitBtnResgatarValeExtratoContaCorrente: TBitBtn;
    RadioGroupVales: TRadioGroup;
    Label374: TLabel;
    DBEdit204: TDBEdit;
    DBEdit205: TDBEdit;
    Label375: TLabel;
    BitBtnEstornarResgatarVale: TBitBtn;
    LbFoneCelular: TLabel;
    DBTextFoneCelular: TDBText;
    GroupBoxSaldosEmpresas: TGroupBox;
    DBGridSaldosEmpresas: TDBGrid;
    GroupBox62: TGroupBox;
    TreeView1: TTreeView;
    Splitter3: TSplitter;
    GroupBoxGerarPontos: TGroupBox;
    LabelGerarPontos: TLabel;
    DBComboBoxGerarPontos: TDBComboBox;
    LabelGerarPontos2: TLabel;
    DBEdit61: TDBComboBox;
    DBEdit145: TDBComboBox;
    BitBtn73: TBitBtn;
    Panel77: TPanel;
    pn_contatos_view: TPanel;
    pn_contatos_cad: TPanel;
    Panel81: TPanel;
    Panel82: TPanel;
    grid_contatos: TDBGrid;
    Panel83: TPanel;
    Label376: TLabel;
    ed_contato_tipo: TDBLookupComboBox;
    Label377: TLabel;
    ed_contato_contato: TDBEdit;
    Label380: TLabel;
    ed_contato_telefone: TDBEdit;
    Label379: TLabel;
    ed_contato_email: TDBEdit;
    bt_contatos_add: TSpeedButton;
    bt_contatos_del: TSpeedButton;
    bt_contatos_edit: TSpeedButton;
    bt_contatos_save: TSpeedButton;
    bt_contatos_cancel: TSpeedButton;
    bt_contato_tipo: TSpeedButton;   
    ed_isuf2: TDBEdit;
    ls_isuf2: TLabel;
    lb_isuf: TLabel;
    ed_isuf: TDBEdit;
    lb_isuf3: TLabel;
    ed_isuf3: TDBEdit;
    SpeedButton75: TSpeedButton;
    BitBtnGerarValeTroca: TBitBtn;
    lnInfEnvAPI: TLabel;
    lbGerarPontos: TLabel;
    DBTextGerarPontos: TDBText;
    gr_dadosf_nfse: TGroupBox;
    ed_issretido: TDBLookupComboBox;
    lb_issretido: TLabel;
    ed_tipoobranfse: TDBLookupComboBox;
    lb_tipoobra: TLabel;
    eds_issretido: TDBLookupComboBox;
    lbs_issretido: TLabel;
    eds_tipoobranfse: TDBLookupComboBox;
    lbs_tipoobranfse: TLabel;
    Label378: TLabel;
    DBComboBoxEnviarNot: TDBComboBox;
    lbEnviarNot: TLabel;
    LabelEnviarNotFinanc: TLabel;
    DBLookupComboBoxEnviarNot: TDBLookupComboBox;
    DBLookupComboBoxGerarPontos: TDBLookupComboBox;
    DBLookupComboBox27: TDBLookupComboBox;
    ckLixeira: TCheckBox;
    Panel78: TPanel;
    Label76: TLabel;
    Label21: TLabel;
    Label123: TLabel;
    DBEdit58: TDBEdit;
    Edit2: TEdit;
    DBEdit21: TDBEdit;
    DBEdit85: TDBEdit;
    tsECommerce: TTabSheet;
    ScrollBox13: TScrollBox;
    pnEC1: TPanel;
    GroupBoxEC: TGroupBox;
    DBTextNomeEC: TDBText;
    DBTextRazaoEC: TDBText;
    lbCPFCNPJEC: TLabel;
    DBTextCPFCNPJEC: TDBText;
    GroupBoxCupomEC: TGroupBox;
    tsECommerce2: TTabSheet;
    pnEC2: TPanel;
    GroupBoxEC2: TGroupBox;
    DBTextNomeEC2: TDBText;
    DBTextRazaoEC2: TDBText;
    lbCPFCNPJEC2: TLabel;
    DBTextCPFCNPJEC2: TDBText;
    btnSECommerce: TSpeedButton;
    pnSalvarCupomEC: TPanel;
    Label382: TLabel;
    Label383: TLabel;
    lbDescTipoDesc: TLabel;
    Label381: TLabel;
    Label384: TLabel;
    DBEditCodigoCupomEC: TDBEdit;
    DBComboBoxDescontoEmCupomEC: TDBComboBox;
    DBEditDescontoValorCupomEC: TDBEdit;
    pnAlButtomCupomEC2: TPanel;
    btOKCupomEC: TBitBtn;
    btCancelarCupomEC: TBitBtn;
    DBEditDataIniValidade: TDBEdit;
    DBEditDataFimValidade: TDBEdit;
    pnGridCupomEC: TPanel;
    pnAlButtomCupomEC1: TPanel;
    btNovoCupomEC: TBitBtn;
    btExcluirCupomEC: TBitBtn;
    btAlterarCupomEC: TBitBtn;
    DBGridCupomEC: TDBGrid;
    CheckBoxUtilizarPeriodoValidade: TCheckBox;
    btSairCupomEC: TBitBtn;
    Label385: TLabel;
    Panel80: TPanel;
    Label386: TLabel;
    Panel84: TPanel;
    Label387: TLabel;
    Panel85: TPanel;
    Label388: TLabel;
    Label389: TLabel;
    Panel86: TPanel;
    Panel87: TPanel;
    DBMemo3: TDBMemo;
    Label390: TLabel;
    DBComboBox17: TDBComboBox;
    Label391: TLabel;
    DBLookupComboBox59: TDBLookupComboBox;
    Panel88: TPanel;
    SelecionarTodosCliente: TMenuItem;
    DesmarcarTodosClientes: TMenuItem;
    Label797: TLabel;
    ed_retfed: TDBLookupComboBox;
    Label392: TLabel;
    eds_retfed: TDBLookupComboBox;
    Label393: TLabel;
    edCodCliFat: TDBEdit;
    lbClienteFaturamento: TLabel;
    Label394: TLabel;
    edCodCliFatS: TDBEdit;
    lbSClienteFaturamento: TLabel;
    SpeedButton73: TSpeedButton;
    SpeedButton76: TSpeedButton;
    GroupBox66: TGroupBox;
    Label395: TLabel;
    DBMemo8: TDBMemo;
    SpeedButton77: TSpeedButton;
    pnObsMaxmized2: TPanel;
    Label396: TLabel;
    Panel90: TPanel;
    BitBtn74: TBitBtn;
    DBMemo9: TDBMemo;
    eds_retfed_nfs: TDBLookupComboBox;
    Label397: TLabel;
    Label398: TLabel;
    ed_retfed_nfs: TDBLookupComboBox;
    Panel89: TPanel;
    Panel91: TPanel;
    DBMemo1: TDBMemo;
    SpeedButton78: TSpeedButton;
    Panel92: TPanel;
    DBMemo7: TDBMemo;
    SpeedButton79: TSpeedButton;
    Label399: TLabel;
    DBComboBox18: TDBComboBox;
    Label400: TLabel;
    DBLookupComboBox60: TDBLookupComboBox;
    pnOpcaoDireitaClientes: TPanel;
    SplitterObservacaoBottomCl: TSplitter;
    SplitterObservacaoSpcBottomCl: TSplitter;
    pnObservacaoCl: TGroupBox;
    DBMemoObsCl: TDBMemo;
    pnObservacaoSpcCl: TGroupBox;
    DBMemoObsSpcCli: TDBMemo;
    pnObservacaoReqOsCl: TGroupBox;
    DBMemoObsReqOSCli: TDBMemo;
    ckMenuLateral: TCheckBox;
    pmOutros: TPopupMenu;
    MenuLateralExibirObservacaoCl: TMenuItem;
    MenuLateralExibirObservacaoSpcCl: TMenuItem;
    MenuLateralExibirObservacaoReqOSCl: TMenuItem;
    bt_outros_prod: TSpeedButton;
    Label401: TLabel;
    Label348: TLabel;
    ComboBox15: TComboBox;
    Label402: TLabel;
    SpeedButtonAlternarCadastro: TSpeedButton;
    SpeedButtonAlternarCadastro2: TSpeedButton;
    SpeedButtonFicha: TSpeedButton;
    SpeedButtonFicha2: TSpeedButton;
    Panel93: TPanel;
    Label226: TLabel;
    Label261: TLabel;
    Label262: TLabel;
    Label263: TLabel;
    DBEdit139: TDBEdit;
    DBEdit158: TDBEdit;
    DBLookupComboBox39: TDBLookupComboBox;
    DBEdit159: TDBEdit;
    pnDadosPessoais_ContatosPlataforma: TPanel;
    Panel97: TPanel;
    BitBtn9: TBitBtn;
    GroupBoxContatoPlataforma: TGroupBox;
    pn_contatos_pla_cad: TPanel;
    lb_contato_pla_contato: TLabel;
    lb_contato_pla_aplicativo: TLabel;
    lb_contato_pla_identificacao: TLabel;
    lb_contrato_pla_tipos_contato: TLabel;
    bt_contato_pla_tipo: TSpeedButton;
    Panel95: TPanel;
    bt_contatos_pla_save: TSpeedButton;
    bt_contatos_pla_cancel: TSpeedButton;
    ed_contato_pla_contato: TDBEdit;
    ed_contato_pla_aplicativo: TDBLookupComboBox;
    ed_contato_pla_identificacao: TDBEdit;
    ck_contrato_pla_tipos_contato: TCheckListBox;
    Panel96: TPanel;
    bt_contatos_pla_add: TSpeedButton;
    bt_contatos_pla_del: TSpeedButton;
    bt_contatos_pla_edit: TSpeedButton;
    pn_contatos_pla_view: TPanel;
    grid_contatos_pla: TDBGrid;
    SpeedButton64: TSpeedButton;
    procedure ComboBox12Exit(Sender: TObject);
    procedure SpeedButton64Click(Sender: TObject);
    procedure pnDadosPessoais_ContatosPlataformaEnter(Sender: TObject);
    procedure bt_contato_pla_tipoClick(Sender: TObject);
    procedure bt_contatos_pla_editClick(Sender: TObject);
    procedure ed_contato_pla_aplicativoExit(Sender: TObject);
    procedure bt_contatos_pla_cancelClick(Sender: TObject);
    procedure bt_contatos_pla_saveClick(Sender: TObject);
    procedure bt_contatos_pla_delClick(Sender: TObject);
    procedure bt_contatos_pla_addClick(Sender: TObject);
    procedure pn_contatos_pla_viewEnter(Sender: TObject);
    procedure pn_contatos_pla_cadEnter(Sender: TObject);
    procedure CheckCadSeq_Click(Sender: TObject);
    procedure LabelSeq_Click(Sender: TObject);
    procedure SpeedButtonAlternarCadastro2Click(Sender: TObject);
    procedure SpeedButtonFicha2Click(Sender: TObject);
    procedure SpeedButtonFichaClick(Sender: TObject);
    procedure SpeedButtonAlternarCadastroClick(Sender: TObject);
    procedure ComboBox15Click(Sender: TObject);
    procedure SplitterObservacaoSpcBottomClMoved(Sender: TObject);
    procedure SplitterObservacaoBottomClMoved(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure bt_outros_prodClick(Sender: TObject);
    procedure ckMenuLateralClick(Sender: TObject);
    procedure MenuLateralExibirObservacaoReqOSClClick(Sender: TObject);
    procedure MenuLateralExibirObservacaoSpcClClick(Sender: TObject);
    procedure MenuLateralExibirObservacaoClClick(Sender: TObject);
    procedure SpeedButton77Click(Sender: TObject);
    procedure SpeedButton76Click(Sender: TObject);
    procedure edCodCliFatExit(Sender: TObject);
    procedure edCodCliFatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DesmarcarTodosClientesClick(Sender: TObject);
    procedure SelecionarTodosClienteClick(Sender: TObject);
    procedure DBLookupComboBox33KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox33Exit(Sender: TObject);
    procedure DBLookupComboBox35Exit(Sender: TObject);
    procedure DBLookupComboBox29Exit(Sender: TObject);
    procedure pageCadSimplesChange(Sender: TObject);
    procedure gridCondPagPREDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btSairCupomECClick(Sender: TObject);
    procedure btnSECommerceClick(Sender: TObject);
    procedure CheckBoxUtilizarPeriodoValidadeClick(Sender: TObject);
    procedure btExcluirCupomECClick(Sender: TObject);
    procedure pnSalvarCupomECEnter(Sender: TObject);
    procedure btCancelarCupomECClick(Sender: TObject);
    procedure btOKCupomECClick(Sender: TObject);
    procedure btAlterarCupomECClick(Sender: TObject);
    procedure btNovoCupomECClick(Sender: TObject);
    procedure DBComboBoxDescontoEmCupomECExit(Sender: TObject);
    procedure ckLixeiraClick(Sender: TObject);
    procedure BitBtnGerarValeTrocaClick(Sender: TObject);
    procedure pn_contatos_viewEnter(Sender: TObject);
    procedure pn_contatos_cadEnter(Sender: TObject);
    procedure bt_contato_tipoClick(Sender: TObject);
    procedure bt_contatos_cancelClick(Sender: TObject);
    procedure bt_contatos_saveClick(Sender: TObject);
    procedure bt_contatos_delClick(Sender: TObject);
    procedure bt_contatos_editClick(Sender: TObject);
    procedure bt_contatos_addClick(Sender: TObject);
    procedure DBGridResgatarValeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridResgatarValeCellClick(Column: TColumn);
    procedure Splitter3Moved(Sender: TObject);
    procedure Splitter6Moved(Sender: TObject);
    procedure BitBtnEstornarResgatarValeClick(Sender: TObject);
    procedure DBEdit205Exit(Sender: TObject);
    procedure DBEdit204Exit(Sender: TObject);
    procedure RadioGroupValesClick(Sender: TObject);
    procedure DBGridResgatarValeDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BitBtnVoltarResgatarValeClick(Sender: TObject);
    procedure BitBtnResgatarValeExtratoContaCorrenteClick(Sender: TObject);
    procedure SpeedButton74Click(Sender: TObject);
    procedure bt_trib_pref_newClick(Sender: TObject);
    procedure btgoup_trib_pref_addButtonClicked(Sender: TObject; Index: Integer);
    procedure btgoup_trib_pref_comButtonClicked(Sender: TObject; Index: Integer);
    procedure ImprimirReciboProgFidClick(Sender: TObject);
    procedure pnAdicionaisEndDocEnter(Sender: TObject);
    procedure btgoup_rotaent_addItems0Click(Sender: TObject);
    procedure btgoup_rotaent_addButtonClicked(Sender: TObject; Index: Integer);
    procedure btgoup_rotaentItems0Click(Sender: TObject);
    procedure btgoup_rotaent_complButtonClicked(Sender: TObject; Index: Integer);
    procedure DBGrid19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnValeTrocaEnter(Sender: TObject);
    procedure DBGrid22KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid22DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn72Click(Sender: TObject);
    procedure BitBtn71Click(Sender: TObject);
    procedure BitBtn70Click(Sender: TObject);
    procedure pgDadosAdEnter(Sender: TObject);
    procedure SpeedButton72Click(Sender: TObject);
    procedure SpeedButton71Click(Sender: TObject);
    procedure SpeedButton70Click(Sender: TObject);
    procedure btEditEndDocAdClick(Sender: TObject);
    procedure btCancelEndDocClick(Sender: TObject);
    procedure pnAdicionaisEndDocExit(Sender: TObject);
    procedure gridEndDocAddDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBEdit332Exit(Sender: TObject);
    procedure btSalvarEndDocClick(Sender: TObject);
    procedure MarcaTransferenciacomoUtilizadaClick(Sender: TObject);
    procedure DBGrid21KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn68Click(Sender: TObject);
    procedure BitBtn69Click(Sender: TObject);
    procedure BitBtnVisualizarTransferenciaExtratoContaCorrenteClick(Sender: TObject);
    procedure DBGrid20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn65Click(Sender: TObject);
    procedure BitBtn67Click(Sender: TObject);
    procedure BitBtnTransferirSaldoExtratoContaCorrenteClick(Sender: TObject);
    procedure TreeView2CustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure TreeView1CustomDrawItem(Sender: TCustomTreeView; Node: TTreeNode;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure DBEdit202Exit(Sender: TObject);
    procedure EditarQtdeValeTrocaClick(Sender: TObject);
    procedure DBGridTempValeTrocaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGridTempValeTrocaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridTempValeTrocaDblClick(Sender: TObject);
    procedure BitBtn106Click(Sender: TObject);
    procedure BitBtn107Click(Sender: TObject);
    procedure DBGrid19DblClick(Sender: TObject);
    procedure EditFiltroChange(Sender: TObject);
    procedure DBGrid19DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EditHwValorValeExit(Sender: TObject);
    procedure EditHwPontosValeExit(Sender: TObject);
    procedure DBGridValeCompraProgFidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn62Click(Sender: TObject);
    procedure BitBtn63Click(Sender: TObject);
    procedure BitBtnVoltarExtratoContaCorrenteClick(Sender: TObject);
    procedure BitBtnVisualizarVencidosExtratoContaCorrenteClick(Sender: TObject);
    procedure BitBtnGerarValeExtratoContaCorrenteClick(Sender: TObject);
    procedure DBGrid18DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtnUltimoExtratoContaCorrenteClick(Sender: TObject);
    procedure BitBtnPrimeiroExtratoContaCorrenteClick(Sender: TObject);
    procedure BitBtnAnteriorExtratoContaCorrenteClick(Sender: TObject);
    procedure BitBtnProximoExtratoContaCorrenteClick(Sender: TObject);
    procedure BitBtnExcluirExtratoContaCorrenteClick(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure DBGrid18ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure BitBtnAtualizarExtratoContaCorrenteClick(Sender: TObject);
    procedure BitBtnSairExtratoContaCorrenteClick(Sender: TObject);
    procedure BitBtnCancelarExtratoContaCorrenteClick(Sender: TObject);
    procedure BitBtnOKExtratoContaCorrenteClick(Sender: TObject);
    procedure BitBtnIncluirExtratoContaCorrenteClick(Sender: TObject);
    procedure SpeedButton60Click(Sender: TObject);
    procedure gridCondPagVNDDblClick(Sender: TObject);
    procedure gridCondPagPREDblClick(Sender: TObject);
    procedure gridCondPagVNDDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn55Click(Sender: TObject);
    procedure BitBtn54Click(Sender: TObject);
    procedure BitBtn52Click(Sender: TObject);
    procedure BitBtn53Click(Sender: TObject);
    procedure SpeedButton56Click(Sender: TObject);
    procedure Panel50Resize(Sender: TObject);
    procedure SpeedButton58Click(Sender: TObject);
    procedure pnDadosPessoais_ContatosTelefoneEnter(Sender: TObject);
    procedure pnDadosPessoais_OutrosEnter(Sender: TObject);
    procedure pnDadosPessoais_DocumentosEnter(Sender: TObject);
    procedure GroupBox54Enter(Sender: TObject);
    procedure pnDadosPessoais_DadosPessoaisEnter(Sender: TObject);
    procedure DBGrid17TitleClick(Column: TColumn);
    procedure Edit11Change(Sender: TObject);
    procedure DBEdit150Exit(Sender: TObject);
    procedure ScrollBox9Enter(Sender: TObject);
    procedure Panel38Enter(Sender: TObject);
    procedure DBEdit111Exit(Sender: TObject);
    procedure DBEdit114Exit(Sender: TObject);
    procedure DBEdit112Exit(Sender: TObject);
    procedure btnSCRMClick(Sender: TObject);
    procedure pnSReferenciasSPCEnter(Sender: TObject);
    procedure btnsFormasPagamentoClick(Sender: TObject);
    procedure btnsAtributosClick(Sender: TObject);
    procedure btnSImagensClick(Sender: TObject);
    procedure btnSRferenciasSPCClick(Sender: TObject);
    procedure btnSDadosAdicionaisClick(Sender: TObject);
    procedure lbSAutXMLKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton65Click(Sender: TObject);
    procedure SpeedButton62Click(Sender: TObject);
    procedure btnObsOutrosAdClick(Sender: TObject);
    procedure btnDocumentosAdClick(Sender: TObject);
    procedure btnContatoTelefoneAdClick(Sender: TObject);
    procedure DBEdit118KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit119KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnEdendecoAdClick(Sender: TObject);
    procedure SpeedButton63Click(Sender: TObject);
    procedure SpeedButton61Click(Sender: TObject);
    procedure btnDadosPessoaisAdClick(Sender: TObject);
    procedure DadosComplementares1Click(Sender: TObject);
    procedure CadastroSimplificado1Click(Sender: TObject);
    procedure CadastroNormal1Click(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure BitBtn_6Click(Sender: TObject);
    procedure BitBtn_9Click(Sender: TObject);
    procedure BitBtn_5Click(Sender: TObject);
    procedure DetailBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure GroupBox51Enter(Sender: TObject);
    procedure spBtAutXMLRemoverClick(Sender: TObject);
    procedure spBtAutXMLAdicionarClick(Sender: TObject);
    procedure DBComboBox15Exit(Sender: TObject);
    procedure DBComboBox14Exit(Sender: TObject);
    procedure spBtConsWSCEPDepClick(Sender: TObject);
    procedure SpeedButton55Click(Sender: TObject);
    procedure SpeedButton54Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure ComboBox14Exit(Sender: TObject);
    procedure SpeedButton53Click(Sender: TObject);
    procedure SpeedButton52Click(Sender: TObject);
    procedure PageControl3Change(Sender: TObject);
    procedure SpeedButton48Click(Sender: TObject);
    procedure SpeedButton49Click(Sender: TObject);
    procedure SpeedButton50Click(Sender: TObject);
    procedure SpeedButton51Click(Sender: TObject);
    procedure DtFotosCliDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton47Click(Sender: TObject);
    procedure DBEdit100KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid12TitleClick(Column: TColumn);
    procedure DBGrid15DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EditFiscal1Change(Sender: TObject);
    procedure DBGrid15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid15Exit(Sender: TObject);
    procedure DBGrid15KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid15CellClick(Column: TColumn);
    procedure BitBtn43Click(Sender: TObject);
    procedure SpeedButton45Click(Sender: TObject);
    procedure DBGrid14DblClick(Sender: TObject);
    procedure DBGrid14KeyPress(Sender: TObject; var Key: Char);
    procedure gridCondPagDblClick(Sender: TObject);
    procedure gridCondPagDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btUnSelectTodosClick(Sender: TObject);
    procedure btSelectTodosClick(Sender: TObject);
    procedure CheckBox8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn37Click(Sender: TObject);
    procedure pnCarteirasResize(Sender: TObject);
    procedure DBGrid12MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid12DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton44Click(Sender: TObject);
    procedure SpeedButton46Click(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure pnCarteirasEnter(Sender: TObject);
    procedure SpeedButton43Click(Sender: TObject);
    procedure SpeedButton42Click(Sender: TObject);
    procedure CheckModeloCartaClick(Sender: TObject);
    procedure ComboBoxModeloCartaExit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBEdit99KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure SpeedButton41Click(Sender: TObject);
    procedure CheckBoxEmailClick(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btSelectAllClick(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure EditHw5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHw5Exit(Sender: TObject);
    procedure DBLookupComboBox19Exit(Sender: TObject);
    procedure MaskEdit10Exit(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure pnEquipEnter(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure DBEdit91KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton38Click(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure DBEdit18Enter(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure EditHw1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioGroup2Exit(Sender: TObject);
    procedure pnContratoRelatoriosEnter(Sender: TObject);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn28KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QuickRep1Preview(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure DBGrid10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnContratoCadastroEnter(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure DBLookupComboBox16Exit(Sender: TObject);
    procedure EditHw2Exit(Sender: TObject);
    procedure DBLookupComboBox15Exit(Sender: TObject);
    procedure EditHw1Exit(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure ScrollBox6Enter(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure pnFotoEnter(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid8TitleClick(Column: TColumn);
    procedure DBGrid8Enter(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure DBGrid8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton13Click(Sender: TObject);
    procedure BitBtnSpeedBClick(Sender: TObject);
    procedure DBEdit15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit88KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn22Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure DBComboBox8KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit16Enter(Sender: TObject);
    procedure DBEdit17Enter(Sender: TObject);
    procedure DBEdit68Exit(Sender: TObject);
    procedure DBComboBox9Exit(Sender: TObject);
    procedure DBEdit35Exit(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure DBEdit66Exit(Sender: TObject);
    procedure DBEdit65Exit(Sender: TObject);
    procedure DBLookupComboBox12Exit(Sender: TObject);
    procedure DBLookupComboBox11Exit(Sender: TObject);
    procedure DBEdit84Exit(Sender: TObject);
    procedure DBEdit84KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrpClienteFornecPreview(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBComboBox8Exit(Sender: TObject);
    procedure DBLookupComboBox4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox13Exit(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit77Exit(Sender: TObject);
    procedure DBEdit76Exit(Sender: TObject);
    procedure DBEdit77KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit76KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure TabSheet8Show(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn6Exit(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure DBLookupComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBLookupComboBox10Exit(Sender: TObject);
    procedure DBEdit63Exit(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure DBEdit19Exit(Sender: TObject);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit18Exit(Sender: TObject);
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure DBLookupComboBox9Exit(Sender: TObject);
    procedure DBEdit17Exit(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure DBLookupComboBox8Exit(Sender: TObject);
    procedure DBEdit32Exit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBEdit26Exit(Sender: TObject);
    procedure DBEdit25Exit(Sender: TObject);
    procedure DBComboBox6Exit(Sender: TObject);
    procedure DBComboBox4Exit(Sender: TObject);
    procedure DBEdit20Exit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox6Exit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBLookupComboBox7Exit(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBComboBox3Exit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn_4Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ConfiguraVizualPorTipo;
    procedure verificacampos;
    procedure AjustarBarraLateral(pAjustar: Boolean = True);
    procedure HabilitarCamposInclusao;
    procedure HabilitarCamposEdicao;
    procedure ExecutarFormResize;
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;
  private
    //    status: string; //variável para indicar Insert ou Edit para fins de msg para o usuário
        { Private declarations }
    vCriou: Smallint;
    vCodCliente: Integer;
    vValorTemp, vValorTemp1: Currency;
    vInc: Integer;
    lk_enddoc_localidade: TDadosLookUp_OOP;
    lk_finalidade: TDadosLookUp_OOP;
    lk_tipo_contato: TDadosLookUp_OOP;
    lk_tipo_contato_pla: TDadosLookUp_OOP;
    lk_aplicativo_contato_pla: TDadosLookUp_OOP;
    pop_menu_tipo_contato: TPopupMenu;
    pop_menu_tipo_contato_pla: TPopupMenu;
    lk_issretido: TDadosLookUp_OOP;
    lk_tipoobranfse: TDadosLookUp_OOP;
    lkRetFed: TDadosLookUp_OOP;
    lkRetFedNFS: TDadosLookUp_OOP;

    procedure handleFocusCampoErro(var pNomeCampoErro: string);

    procedure montarComponentes;
    procedure montarComponentes2;
    procedure cliente_enddoc_scroll_rotas;

    procedure contato_tipo_add(Sender: TObject);
    procedure contato_tipo_edit(Sender: TObject);
    procedure contato_tipo_del(Sender: TObject);

    procedure contato_tipo_pla_add(Sender: TObject);
    procedure contato_tipo_pla_edit(Sender: TObject);
    procedure contato_tipo_pla_del(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FrmCadClientes: TFrmCadClientes;
  Cliente: TCadClientes;
  vNomeFantasia: boolean;
  vhabEmp: boolean;
  //  BairroC: TBairrosC;
  //  CidadeC: TCidadesC;
  //  EstadoC: TEstadosC;
  //  Convenio: TConvenioCliente;
  //  Contador: TContadorCli;
    //  AdCliente: TAdicionalCliente;
  PrimeiraPesquisa2: Boolean;
  vConfigColuna2 : boolean;
  campoPesquisa2: string;
  cdsColunas2: TClientDataSet;

  cdsGrid2: TClientDataSet;
  GridCfg2: TDBGrid;
  ListGridsAndDataSets2: TStrings;
  ListPositions2: TStrings;

  trans2: TIBTransaction;
  vTabela2, vCampoPadrao: string;
  fReset2, vCtrlClick2, vShiftClick2: Boolean;
  // Variavel usada na criacao dos checks para mostrar as configuracoes das colunas
  nomeDTSEt2, vAlterarNomeDtSet2, usuario2: string;
  vCamposPadraoRegistro2: Boolean;

  vHabObservacaoCl: boolean;
  vHabObservacaoSpcCl: boolean;
  vHabObservacaoReqOsCl: boolean;

	vComboBox15ItemIndex: Integer;
  vCodPlataforma: Integer;
  vDtDiaFinanc: TDate;
  
implementation

uses
  UClassesCadastrosBasicos, UDtmClientes, uDtmAtivo,
  SysUtils, Variants, Clipbrd, uDadosIni, uClassesCRM, StrUtils,
  rotas_entr_class, produtos_trib_pf_class, hw_utils, Query_OOP;

{$R *.dfm}

//function ConsisteInscricaoEstadual(const Insc, UF: string): Integer; stdcall; external 'DllInscE32.dll';

procedure TFrmCadClientes.AjustarBarraLateral(pAjustar: Boolean = True);
var
	vQtdeMenu: Integer;
begin
	if (pnOpcaoDireitaClientes.Visible) then
  begin
    if (pnObservacaoCl.Visible) then
      if pnObservacaoCl.Height < 60 then
        pnObservacaoCl.Height := 60;

    if (pnObservacaoSpcCl.Visible) then
      if pnObservacaoSpcCl.Height < 60 then
        pnObservacaoSpcCl.Height := 60;

    if (pnObservacaoReqOsCl.Visible) then
      if pnObservacaoReqOsCl.Height < 60 then
        pnObservacaoReqOsCl.Height := 60;

    if (vDadosIni.IfThen(pnObservacaoCl.Visible, pnObservacaoCl.Height, 0) +
      	vDadosIni.IfThen(SplitterObservacaoBottomCl.Visible, SplitterObservacaoBottomCl.Height, 0) +
    		vDadosIni.IfThen(pnObservacaoSpcCl.Visible, pnObservacaoSpcCl.Height, 0) +
        vDadosIni.IfThen(SplitterObservacaoSpcBottomCl.Visible, SplitterObservacaoSpcBottomCl.Height, 0) +
        vDadosIni.IfThen(pnObservacaoReqOsCl.Visible, pnObservacaoReqOsCl.Height, 0) > pnOpcaoDireitaClientes.Height) then
    begin
      pnObservacaoCl.Height := 60;
      pnObservacaoSpcCl.Height := 60;
      pnObservacaoReqOsCl.Height := 60;
    end;

    pnObservacaoCl.Align := alNone;
    pnObservacaoSpcCl.Align := alNone;
    pnObservacaoReqOsCl.Align := alNone;

    SplitterObservacaoBottomCl.Align := alNone;
    SplitterObservacaoSpcBottomCl.Align := alNone;

    vQtdeMenu := 0;
    if MenuLateralExibirObservacaoCl.Checked then
      Inc(vQtdeMenu);
    if MenuLateralExibirObservacaoSpcCl.Checked then
      Inc(vQtdeMenu);
    if MenuLateralExibirObservacaoReqOSCl.Checked then
      Inc(vQtdeMenu);

    if pAjustar then
    begin
      pnObservacaoCl.Height := Trunc((pnOpcaoDireitaClientes.Height / vQtdeMenu));
      pnObservacaoSpcCl.Height := Trunc((pnOpcaoDireitaClientes.Height / vQtdeMenu));
      pnObservacaoReqOsCl.Height := Trunc((pnOpcaoDireitaClientes.Height / vQtdeMenu));
    end;

    if MenuLateralExibirObservacaoCl.Checked then
    begin
      if (not MenuLateralExibirObservacaoSpcCl.Checked)
      	and (not MenuLateralExibirObservacaoReqOSCl.Checked) then
        	pnObservacaoCl.Align := alClient
      else
      begin
      		pnObservacaoCl.Align := alTop;
          SplitterObservacaoBottomCl.Align := alTop;
      end;

      DBMemoObsCl.Align := alClient;
    end
    else
    begin
    	pnObservacaoCl.Align := alNone;
    	SplitterObservacaoBottomCl.Align := alNone;
    end;

    if MenuLateralExibirObservacaoSpcCl.Checked then
    begin
      if (not MenuLateralExibirObservacaoReqOSCl.Checked) then
        	pnObservacaoSpcCl.Align := alClient
      else
      begin
      		pnObservacaoSpcCl.Align := alTop;
          SplitterObservacaoSpcBottomCl.Align := alTop;
      end;

      DBMemoObsSpcCli.Align := alClient;
    end
    else
    begin
    	pnObservacaoSpcCl.Align := alNone;
    	SplitterObservacaoSpcBottomCl.Align := alNone;
    end;

    if MenuLateralExibirObservacaoReqOSCl.Checked then
    begin
      pnObservacaoReqOsCl.Align := alClient;

      DBMemoObsReqOSCli.Align := alClient;
    end
    else
    	pnObservacaoReqOsCl.Align := alNone;
    
    if MenuLateralExibirObservacaoCl.Checked then
    begin
      pnObservacaoCl.Top := 0;

      if SplitterObservacaoBottomCl.Visible then
      	SplitterObservacaoBottomCl.Top := pnObservacaoCl.Top + pnObservacaoCl.Height;
    end;

    if MenuLateralExibirObservacaoSpcCl.Checked then
    begin
      pnObservacaoSpcCl.Top := SplitterObservacaoBottomCl.Top + SplitterObservacaoBottomCl.Height;

      if SplitterObservacaoSpcBottomCl.Visible then
      	SplitterObservacaoSpcBottomCl.Top := pnObservacaoSpcCl.Top + pnObservacaoSpcCl.Height;
    end;

    if MenuLateralExibirObservacaoReqOSCl.Checked then
      pnObservacaoReqOsCl.Top := SplitterObservacaoSpcBottomCl.Top + SplitterObservacaoBottomCl.Height;

    Splitter1.Align := alLeft;
    Splitter1.Align := alRight;
  end;
end;

procedure TFrmCadClientes.BitBtn106Click(Sender: TObject);
begin
  if not Cliente.vContaCorrenteCli.vRegrasValeTrocaProgFid.excluirMercadoriasTroca(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger,
  	LabelPontosValeTroca, LabelValorValeTroca) then
   exit;
end;

procedure TFrmCadClientes.BitBtn107Click(Sender: TObject);
begin
  if not Cliente.vContaCorrenteCli.vRegrasValeTrocaProgFid.incluirMercadoriasTroca(Cliente.dataSet.FieldByName('cod_cliente').AsInteger,
  	LabelPontosValeTroca, LabelValorValeTroca) then
    exit;
end;

procedure TFrmCadClientes.BitBtnVoltarExtratoContaCorrenteClick(Sender: TObject);
begin
	Cliente.vContaCorrenteCli.vPagGrid := 0;
  if not Cliente.vContaCorrenteCli.abreContaCorrente(
  	Cliente.dataSet.FieldByName('cod_cliente').AsInteger,
  	Cliente.dataSet.FieldByName('cpfcgc').AsString,
    DBGrid18,
    Label348) then
      Exit;

  Label402.Caption := 'Exibindo ' +
    IntToStr(vDadosIni.IfThen(Cliente.vContaCorrenteCli.vRecordCount > 0,
               (Cliente.vContaCorrenteCli.vQtdeGrid * Cliente.vContaCorrenteCli.vPagGrid) + 1,
               0)) +
    ' até ' +
    IntToStr(vDadosIni.IfThen(Cliente.vContaCorrenteCli.vRecordCount > 0,
               (Cliente.vContaCorrenteCli.vQtdeGrid * Cliente.vContaCorrenteCli.vPagGrid) + Cliente.vContaCorrenteCli.vRecordPagGrid,
               0)) +
    ' de ' +
    IntToStr(Cliente.vContaCorrenteCli.vRecordCount) +
    ' linhas';
    
  BitBtnSairExtratoContaCorrente.Visible                    := true;
  BitBtnVoltarExtratoContaCorrente.Visible                  := false;

  BitBtnIncluirExtratoContaCorrente.Enabled                 := vDadosIni.vProgFid.vHabilitarProgFid;
  BitBtnExcluirExtratoContaCorrente.Enabled                 := vDadosIni.vProgFid.vHabilitarProgFid;
  BitBtnGerarValeExtratoContaCorrente.Enabled               := true;
  BitBtnResgatarValeExtratoContaCorrente.Enabled            := true;
  BitBtnVisualizarVencidosExtratoContaCorrente.Enabled      := true;
  BitBtnTransferirSaldoExtratoContaCorrente.Enabled         := vDadosIni.vProgFid.vHabilitarProgFid;
  BitBtnVisualizarTransferenciaExtratoContaCorrente.Enabled := vDadosIni.vProgFid.vHabilitarProgFid;
end;

procedure TFrmCadClientes.BitBtn10Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('CLI151', 'INSERINDO NOVO REGISTRO', '', 'END_PCLIENTES', '',
    Cliente.buscas, true) then
  begin
    inherited;
    if Cliente.AdCliente.Insert then
    begin
      TabSheet8.TabVisible := true;
      TabSheet8.Show;
      TabSheet8.Caption := 'Incluindo Dependente';
      if (Self.Enabled) and (Self.Visible) and (DBEdit22.CanFocus) then
      	DBEdit22.SetFocus;
      DBEdit67.Visible := false;
      Cliente.AdCliente.Preenchecampos(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger);
      DBEdit107.Enabled := False;
    end;
  end;
end;

procedure TFrmCadClientes.BitBtn11Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('CLI152', 'EDITANDO REGISTRO', '', 'END_PCLIENTES',
    Cliente.AdCliente.dataSet.FieldByName('SEQCAD').AsString, Cliente.AdCliente.buscas, true) then
  begin
    inherited;
    if not Cliente.AdCliente.dataSet.IsEmpty then
    begin
      if Cliente.AdCliente.Edit then
      begin
        TabSheet8.TabVisible := true;
        TabSheet8.Show;
        if (Self.Enabled) and (Self.Visible) and (DBEdit22.CanFocus) then
        	DBEdit22.SetFocus;
        TabSheet8.Caption := 'Alterando Cliente adicional';
        DBEdit67.Visible := true;
        DBEdit107.Enabled := trim(Cliente.AdCliente.dataSet.FieldByName('REC_MAIL_MARK').AsString) = 'S';
      end;
    end
    else
      Application.MessageBox('Não há nenhum registro para ser alterado.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

procedure TFrmCadClientes.BitBtn12Click(Sender: TObject);
begin
  inherited;
  Cliente.AdCliente.Delete;
end;

procedure TFrmCadClientes.BitBtn13Click(Sender: TObject);
begin
  inherited;
  TabSheet6.TabVisible := false;
  Cliente.AdCliente.Cancel;
  Cliente.AdCliente.RollBackTransacao;
  TabSheet2.Show;
end;

procedure TFrmCadClientes.BitBtn14Click(Sender: TObject);
begin
  inherited;
  if Cliente.AdCliente.Post then
  begin
    TabSheet8.TabVisible := false;
    TabSheet7.Show;
  end
  else
    setFocusCampoErro(Cliente.AdCliente.vNomeCampoErro, Cliente.AdCliente.vMensagemErro);
end;

procedure TFrmCadClientes.BitBtn15Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('CLI155', 'CANCELAR', '', 'END_PCLIENTES',
    Cliente.AdCliente.dataSet.FieldByName('SEQCAD').Asstring, Cliente.buscas, true) then
  begin
    inherited;
    TabSheet8.TabVisible := false;
    TabSheet7.Show;
    Cliente.AdCliente.dataSet.Cancel;
    Cliente.AdCliente.RollBackTransacao;
  end;
end;

procedure TFrmCadClientes.BitBtn17Click(Sender: TObject);
begin
  inherited;
  if TelaCadastro <> 4 then
  begin
    Cliente.Recibos.buscas.close;
    Cliente.Creditos.buscas.close;
    Cliente.Cheques.buscas.Close;
    tsFichaFin.TabVisible := false;
    TabSheet6.TabVisible := false;
    TabSheet2.Show
  end
  else
    close;
end;

procedure TFrmCadClientes.BitBtn18Click(Sender: TObject);
begin
  inherited;
  Cliente.DetalhesRecebimentoPrestacao;
end;

procedure TFrmCadClientes.BitBtn19Click(Sender: TObject);
begin
  inherited;
  TForm(pnEquip.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadClientes.BitBtnSpeedBClick(Sender: TObject);
var
  CEPs: TCEP;
  ListaCep: TStringList;
  Bairros: TListaBairros1;
  Cidades: TListaCidades1;
  Estado: TListaEtados1;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
  	DBEdit9.SetFocus;
  ListaCep := CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(
    cliente.dataSet.FieldByName('CEP').AsString);
  //  if(CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(
  //  cliente.dataSet.FieldByName('CEP').AsString)[0] = '') then
  if (ListaCep[0] = '') then
  begin
    if (CEPs._ConsultarWebService(cliente.dataSet.FieldByName('CEP').AsString)) then
    begin
      ListaCep :=
        CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(cliente.dataSet.FieldByName('CEP').AsString);
      if (ListaCep[0] <> '') then
      begin
        Bairros := TListaBairros1.create;
        Bairros.buscas.Close;
        Bairros.buscas.Open;
        Cidades := TListaCidades1.create;
        Cidades.buscas.Close;
        Cidades.buscas.Open;
        Estado := TListaEtados1.create;
        Estado.buscas.Close;
        Estado.buscas.Open;

        Cliente.abreBairros;
        Cliente.abreBairrosC;
        Cliente.abreCidades;
        Cliente.abreCidadesC;

        cliente.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
        cliente.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
        cliente.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
        cliente.dataSet.FieldByName('ENDERECO').asstring := ListaCep[3];

        if cliente.dataSet.FieldByName('COD_BAIRRO').AsInteger > 0 then
        begin
          Cliente.SqlOpen('select br.cod_bairro, br.nome_bairro from bairros br ' +
         	  ' where br.cod_bairro = ' + IntToStr(cliente.dataSet.FieldByName('COD_BAIRRO').AsInteger), Cliente.buscas);
          if Cliente.buscas.FieldByName('COD_BAIRRO').AsInteger > 0 then
            Cliente.dataSet.FieldByName('BAIRRO').AsString := Cliente.buscas.FieldByName('NOME_BAIRRO').AsString;
        end;

        if cliente.dataSet.FieldByName('COD_CIDADE').AsInteger > 0 then
        begin
          Cliente.SqlOpen('select cd.cod_cidade, cd.nome_cidade from cidades cd ' +
         	  ' where cd.cod_cidade = ' + IntToStr(cliente.dataSet.FieldByName('COD_CIDADE').AsInteger), Cliente.buscas);
          if Cliente.buscas.FieldByName('COD_CIDADE').AsInteger > 0 then
            Cliente.dataSet.FieldByName('CIDADE').AsString := Cliente.buscas.FieldByName('NOME_CIDADE').AsString;
        end;

        if cliente.dataSet.FieldByName('CODIGO_UF').AsInteger > 0 then
        begin
          Cliente.SqlOpen('select es.codigo_uf, es.sigla_uf from estados es ' +
         	  ' where es.codigo_uf = ' + IntToStr(cliente.dataSet.FieldByName('CODIGO_UF').AsInteger), Cliente.buscas);
          if Cliente.buscas.FieldByName('CODIGO_UF').AsInteger > 0 then
            Cliente.dataSet.FieldByName('ESTADOS_UF').AsString := Cliente.buscas.FieldByName('SIGLA_UF').AsString;
        end;

        Bairros.Free;
        Bairros := nil;
        Cidades.Free;
        Cidades := nil;
        Estado.Free;
        Estado := nil;
      end;
    end;
  end
  else if ListaCep[0] <> '' then
  begin
    cliente.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
    cliente.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
    cliente.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
    cliente.dataSet.FieldByName('ENDERECO').asstring := ListaCep[3];

    if cliente.dataSet.FieldByName('COD_BAIRRO').AsInteger > 0 then
    begin
      Cliente.SqlOpen('select br.cod_bairro, br.nome_bairro from bairros br ' +
        ' where br.cod_bairro = ' + IntToStr(cliente.dataSet.FieldByName('COD_BAIRRO').AsInteger), Cliente.buscas);
      if Cliente.buscas.FieldByName('COD_BAIRRO').AsInteger > 0 then
        Cliente.dataSet.FieldByName('BAIRRO').AsString := Cliente.buscas.FieldByName('NOME_BAIRRO').AsString;
    end;

    if cliente.dataSet.FieldByName('COD_CIDADE').AsInteger > 0 then
    begin
      Cliente.SqlOpen('select cd.cod_cidade, cd.nome_cidade from cidades cd ' +
        ' where cd.cod_cidade = ' + IntToStr(cliente.dataSet.FieldByName('COD_CIDADE').AsInteger), Cliente.buscas);
      if Cliente.buscas.FieldByName('COD_CIDADE').AsInteger > 0 then
        Cliente.dataSet.FieldByName('CIDADE').AsString := Cliente.buscas.FieldByName('NOME_CIDADE').AsString;
    end;

    if cliente.dataSet.FieldByName('CODIGO_UF').AsInteger > 0 then
    begin
      Cliente.SqlOpen('select es.codigo_uf, es.sigla_uf from estados es ' +
        ' where es.codigo_uf = ' + IntToStr(cliente.dataSet.FieldByName('CODIGO_UF').AsInteger), Cliente.buscas);
      if Cliente.buscas.FieldByName('CODIGO_UF').AsInteger > 0 then
        Cliente.dataSet.FieldByName('ESTADOS_UF').AsString := Cliente.buscas.FieldByName('SIGLA_UF').AsString;
    end;
  end;
  if (Self.Enabled) and (Self.Visible) and (DBEdit12.CanFocus) then
  	DBEdit12.SetFocus;
end;

procedure TFrmCadClientes.BitBtnVoltarResgatarValeClick(Sender: TObject);
begin
  TForm(pnResgatarVale.Parent).ModalResult := IDOK;
end;

procedure TFrmCadClientes.btnsAtributosClick(Sender: TObject);
begin
  inherited;
  vDadosIni.abreForm('Atributos', pnSAtributos, [ofAutoSize, ofEscapeExit]);
end;

procedure TFrmCadClientes.btnSCRMClick(Sender: TObject);
begin
  inherited;
  vDadosIni.abreForm('Dados para CRM', pnSCRM, [ofAutoSize, ofEscapeExit]);
end;

procedure TFrmCadClientes.btnSDadosAdicionaisClick(Sender: TObject);
begin
  inherited;
  vDadosIni.abreForm('Dados Adicionais', pnSDadosAdicionais, [ofAutoSize, ofEscapeExit]);
end;

procedure TFrmCadClientes.btnSECommerceClick(Sender: TObject);
begin
  inherited;
  btSairCupomEC.Visible := true;
  vDadosIni.abreForm('E-Commerce', pnGridCupomEC, [ofAutoSize, ofEscapeExit]);
end;

procedure TFrmCadClientes.btnsFormasPagamentoClick(Sender: TObject);
begin
  inherited;
  Cliente._abreControlesFormaPagamento;
  vDadosIni.abreForm('Formas de Pagamento', pnSFormasPagamento, [ofAutoSize, ofEscapeExit]);
end;

procedure TFrmCadClientes.btnSImagensClick(Sender: TObject);
begin
  inherited;
  Cliente.Foto.abreFotoCliente;
  Cliente._recuperarFotoCliente;
  vDadosIni.abreForm('Imagens', pnSImagens, [ofAutoSize, ofEscapeExit]);
end;

procedure TFrmCadClientes.btnSRferenciasSPCClick(Sender: TObject);
begin
  inherited;
  vDadosIni.abreForm('Referencias / SPC', pnSReferenciasSPC, [ofAutoSize, ofEscapeExit]);
end;

procedure TFrmCadClientes.btOKCupomECClick(Sender: TObject);
begin
  inherited;
  if not Cliente.CupomDescontoCliente.Post(Cliente) then
  begin
  	setFocusCampoErro(Cliente.CupomDescontoCliente.vNomeCampoErro, Cliente.CupomDescontoCliente.vMensagemErro);
  	exit;
  end;

	TForm(pnSalvarCupomEC.Parent).ModalResult := IDOK;
end;

procedure TFrmCadClientes.btSairCupomECClick(Sender: TObject);
begin
  inherited;
	TForm(pnGridCupomEC.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadClientes.btSalvarEndDocClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CLI281', 'SALVAR', '', 'CLIENTES_END_DOC_ADD',
    Cliente.dataSet.FieldByName('COD_CLIENTE').asstring, Cliente.buscas, true) then
    Exit;
  if Cliente.EndDocAd.Post then
    btCancelEndDoc.Click;
end;

procedure TFrmCadClientes.btSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Cliente._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadClientes.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Cliente._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadClientes.BitBtn1Click(Sender: TObject);
begin
	SpeedButton2.Hint := 'Enviar para Lixeira -  [CLI033]';

  if not vDadosIni.PesqPros('CLI001', 'PESQUISAR', '', 'CLIENTES', '', Cliente.buscas, true) then
    Exit;


  Cliente.vCons.ordem := ComboBox2.Text;
  Cliente.vCons.condicao := ComboBox3.Text;
  Cliente.vCons.campo := ComboBox1.Text;
  Cliente.vCons.valor := MaskEdit3.Text;
  Cliente.vCons.porData := MaskEdit1.Visible;
  Cliente.vCons.dataIni := MaskEdit1.Text;
  Cliente.vCons.dataFim := MaskEdit2.Text;

  // avancado
  Cliente.vCons.avancado := CheckBox3.Checked;
  Cliente.vCons.veiculos := CheckBox2.Checked;
  Cliente.vCons.qtdeCompras := ComboBox4.Text;
  Cliente.vCons.somaCompras := ComboBox5.Text;
  Cliente.vCons.clientesAssiduos := ComboBox6.Text;
  Cliente.vCons.atrasoCompras := ComboBox7.Text;
  Cliente.vCons.lucroClientes := ComboBox8.Text;

  // adicional
  Cliente.vCons.adicional := CheckBox1.Checked;
  Cliente.vCons.condicaoAd := ComboBox12.Text;
  Cliente.vCons.campoAd := ComboBox11.Text;
  Cliente.vCons.valorAd := MaskEdit7.Text;
  Cliente.vCons.porDataAd := MaskEdit9.Visible;
  Cliente.vCons.dataIniAd := MaskEdit9.Text;
  Cliente.vCons.dataFimAd := MaskEdit8.Text;

  if RadioGroup1.ItemIndex = 0 then
    Cliente.vCons.tipoCl := 'A'
  else if RadioGroup1.ItemIndex = 1 then
    Cliente.vCons.tipoCl := 'C'
  else if RadioGroup1.ItemIndex = 2 then
    Cliente.vCons.tipoCl := 'F'
  else
    Cliente.vCons.tipoCl := '';

  Cliente.vCons.diaIniAniv := MaskEdit4.Text;
  Cliente.vCons.diaFimAniv := MaskEdit5.Text;
  Cliente.vCons.mesAniv := MaskEdit6.Text;

  // contrato	  
  Cliente.vCons.comCtr := CheckBox7.Checked;
  Cliente.vCons.statusCtr := ComboBox14.Text;

  Cliente._defineSqlAdicional;

  try
    Screen.Cursor := crHourGlass;
    inherited;

    if (not CheckBox1.Checked) and (not CheckBox3.Checked) and (CheckBox7.Checked) then
      GroupBox3.Height := 108
    else if (CheckBox1.Checked) or (CheckBox3.Checked) or (CheckBox7.Checked) then
      GroupBox3.Height := 201
    else
      GroupBox3.Height := 73;

    if (ckMenuLateral.Checked) and (not pnOpcaoDireitaClientes.Visible) then
    begin
      try
        ckMenuLateral.Tag := 99;
        ckMenuLateralClick(Sender);
      finally
       ckMenuLateral.Tag := 0;
      end;
    end;

    if CheckBox1.Checked then
    begin
      if ((trim(MaskEdit4.Text) = '') and (trim(MaskEdit5.Text) = '') and (trim(MaskEdit6.Text) = ''))
        or ((trim(MaskEdit4.Text) <> '') and (trim(MaskEdit5.Text) <> '') and (trim(MaskEdit6.Text) <> '')) then
      begin

      end
      else if (trim(MaskEdit4.Text) <> '') or (trim(MaskEdit5.Text) <> '') or (trim(MaskEdit6.Text) <> '') then
      begin
        Application.MessageBox('Para pesquisar os aniversariantes é exigido informar:' + chr(13) +
          'Dia inicial, Dia final e o Mês.', 'Informação', MB_OK + MB_ICONINFORMATION +
          MB_DEFBUTTON1);
        if (trim(MaskEdit4.Text) = '') then
        begin
          if (Self.Enabled) and (Self.Visible) and (MaskEdit4.CanFocus) then
             MaskEdit4.SetFocus;
        end
        else if (trim(MaskEdit5.Text) = '') then
        begin
          if (Self.Enabled) and (Self.Visible) and (MaskEdit5.CanFocus) then
             MaskEdit5.SetFocus;
        end
        else
        begin
          if (Self.Enabled) and (Self.Visible) and (MaskEdit6.CanFocus) then
             MaskEdit6.SetFocus;
        end;
        exit;
      end;
    end;

    vDadosIni.vInibeMensPesqPros := 'S';
    if vDadosIni.vEmp.vUsarTelevenda = 'S' then
      if pos('VENDEDOR', vDadosIni.vFuncao) > 0 then
        if not vDadosIni.PesqPros('CRM020', 'CONSULTA', 'COLAB COD: ' + IntToStr(vDadosIni.vCodUsuario), 'CLIENTES', '', Cliente.buscas, False) then
          Cliente.vCons.sqladicional := Cliente.vCons.sqladicional + IfThen(trim(Cliente.vCons.sqladicional) <> '', ' and ', ' ') + ' ((CLIENTES.COD_VENDEDOR = ' + IntToStr(vDadosIni.vCodUsuario) + ') OR (COALESCE(CLIENTES.COD_VENDEDOR, 0) = 0))';

    ComboBox2.Text := Cliente.dataSet.FieldByName('cod_cliente').DisplayLabel;
    if MaskEdit2.Visible then
    begin
      if (ckLixeira.Checked) and (ckLixeira.Visible) then
      begin
        if not Cliente.ConsultaCamposLixeira('CLIENTES', Cliente.vCons.campo,
          Cliente.vCons.ordem, Cliente.vCons.dataIni, Cliente.vCons.dataFim, vDadosIni.codEmpresa, 0,
          vDadosIni.IfThen(Cliente.vCons.comCtr, ' DISTINCT ', '') + Cliente.Fsql_campos,
          vDadosIni.IfThen(Cliente.vCons.comCtr, ' INNER JOIN CLIENTES_COM_CONTRATO ON CLIENTES_COM_CONTRATO.COD_CLIENTE = CLIENTES.COD_CLIENTE AND CLIENTES_COM_CONTRATO.COD_EMPRESA = CLIENTES.COD_EMPRESA ', '') +
          Cliente.Fsql_inner,
          Cliente.vCons.sqladicional) then
        begin
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
            combobox1.setfocus
        end
        else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
          DBGrid1.SetFocus;
      end
      else
      begin
        if not Cliente.ConsultaCampos('CLIENTES', Cliente.vCons.campo,
          Cliente.vCons.ordem, Cliente.vCons.dataIni, Cliente.vCons.dataFim, vDadosIni.codEmpresa, 0,
          vDadosIni.IfThen(Cliente.vCons.comCtr, 'DISTINCT', '') + Cliente.Fsql_campos,
          vDadosIni.IfThen(Cliente.vCons.comCtr, ' INNER JOIN CLIENTES_COM_CONTRATO ON CLIENTES_COM_CONTRATO.COD_CLIENTE = CLIENTES.COD_CLIENTE AND CLIENTES_COM_CONTRATO.COD_EMPRESA = CLIENTES.COD_EMPRESA ', '') +
          Cliente.Fsql_inner,
          Cliente.vCons.sqladicional) then
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
        if not Cliente.ConsultaCamposLixeira('CLIENTES', Cliente.vCons.valor, Cliente.vCons.campo,
          Cliente.vCons.condicao, Cliente.vCons.ordem, true, vDadosIni.codEmpresa,
          vDadosIni.IfThen(Cliente.vCons.comCtr, 'DISTINCT', '') + Cliente.Fsql_campos,
          vDadosIni.IfThen(Cliente.vCons.comCtr, ' INNER JOIN CLIENTES_COM_CONTRATO ON CLIENTES_COM_CONTRATO.COD_CLIENTE = CLIENTES.COD_CLIENTE AND CLIENTES_COM_CONTRATO.COD_EMPRESA = CLIENTES.COD_EMPRESA ', '') +
          Cliente.Fsql_inner,
          Cliente.vCons.sqladicional) then
        begin
          if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
            ComboBox1.SetFocus;
        end
        else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
          DBGrid1.SetFocus;
      end
      else
      begin
        if not Cliente.ConsultaCampos('CLIENTES', Cliente.vCons.valor, Cliente.vCons.campo,
          Cliente.vCons.condicao, Cliente.vCons.ordem, true, vDadosIni.codEmpresa,
          vDadosIni.IfThen(Cliente.vCons.comCtr, 'DISTINCT', '') + Cliente.Fsql_campos,
          vDadosIni.IfThen(Cliente.vCons.comCtr, ' INNER JOIN CLIENTES_COM_CONTRATO ON CLIENTES_COM_CONTRATO.COD_CLIENTE = CLIENTES.COD_CLIENTE AND CLIENTES_COM_CONTRATO.COD_EMPRESA = CLIENTES.COD_EMPRESA ', '') +
          Cliente.Fsql_inner,
          Cliente.vCons.sqladicional) then
        begin
          if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
            ComboBox1.SetFocus;
        end
        else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
          DBGrid1.SetFocus;
      end;
    end;
    
    if ckLixeira.Checked then
    begin
      BitBtn3.Visible := false;
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
//        CheckBox7.Checked := false;
      if Cliente.StatusLixeira then
        SpeedButton25.Visible := true
      else
        SpeedButton25.Visible := false;
    end
    else
    begin
       BitBtn3.Visible := true;
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
//        CheckBox7.Checked := false;
      if Cliente.StatusLixeira then
        SpeedButton25.Visible := true
      else
        SpeedButton25.Visible := false;
    end;
    Cliente.ultimasql := Cliente.dataSet.CommandText;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
       DBGrid1.SetFocus;

  finally
    gravaConfiguracoesFormRegistro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadClientes.BitBtn20Click(Sender: TObject);
begin
  inherited;
  TForm(pnFoto.Parent).ModalResult := IDOK;
end;

procedure TFrmCadClientes.BitBtn21Click(Sender: TObject);
begin
  inherited;
  Cliente.Contratos._cancelar;
  TForm(pnContratoCadastro.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadClientes.BitBtn22Click(Sender: TObject);
begin
  inherited;
  tsProdutosFornec.TabVisible := false;
  Cliente.PesquisaINFFornec.Free;
  Cliente.PesquisaINFFornec := nil;
  Cliente.PesquisaNFFornec.Free;
  Cliente.PesquisaNFFornec := nil;
  DBGrid3.DataSource := nil;
  TabSheet2.Show;
end;

procedure TFrmCadClientes.BitBtn23Click(Sender: TObject);
begin
  inherited;
  Cliente.Contratos.vCOD_SERVICO := EditHw1.AsInteger;
  Cliente.Contratos.vCOD_CONTROLE := EditHw2.AsInteger;
  Cliente.Contratos.vCOD_COLABORADOR := EditHw5.AsInteger;
  Cliente.Contratos.vDIA_VENCIMENTO := EditHw3.AsInteger;
  Cliente.Contratos.vVALOR_CONTRATO := EditHw4.AsValue;
  Cliente.Contratos.vCOD_CLIENTE := Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger;
 
  try
    Cliente.Contratos.vDATA_INICIAL_VIGENCIA := StrToDate(MaskEdit10.Text);
  except
    on EConvertError do
    begin
      ShowMessage('Data Inválida!');
      if (Self.Enabled) and (Self.Visible) and (MaskEdit10.CanFocus) then
        MaskEdit10.SetFocus;
      exit;
    end;
  end;

  try
    Cliente.Contratos.vDATA_FINAL_VIGENCIA := StrToDate(MaskEdit11.Text);
  except
    on EConvertError do
    begin
      ShowMessage('Data Inválida!');
      if (Self.Enabled) and (Self.Visible) and (MaskEdit11.CanFocus) then
        MaskEdit11.SetFocus;
      exit;
    end;
  end;

  try
    if CheckBox5.Checked = false then
      Cliente.Contratos.vDATA_IMPRESSAOBOL_INICIAL := 0
    else
      Cliente.Contratos.vDATA_IMPRESSAOBOL_INICIAL := StrToDate(MaskEdit16.Text);
  except
    on EConvertError do
    begin
      ShowMessage('Data Inválida!');
      if (Self.Enabled) and (Self.Visible) and (MaskEdit16.CanFocus) then
        MaskEdit16.SetFocus;
      exit;
    end;
  end;

  Cliente.Contratos.vSTATUS := ComboBox9.Text;
  Cliente.Contratos.vTIPO_OS := ComboBox13.Text;

  if Cliente.Contratos._salvarDadosContrato then
    TForm(pnContratoCadastro.Parent).ModalResult := IDOK
  else
    setFocusCampoErro(Cliente.Contratos.vNomeCampoErro, Cliente.Contratos.vMensagemErro);
end;

procedure TFrmCadClientes.BitBtn24Click(Sender: TObject);
begin
  inherited;
  TForm(pnContratoHistorico.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadClientes.BitBtn25Click(Sender: TObject);
begin
  inherited;
  Cliente.Contratos._detalhesFormaDePagamento;
end;

procedure TFrmCadClientes.BitBtn26Click(Sender: TObject);
begin
  inherited;
  QuickRep1.ReportTitle := 'Contratos vencidos - ' + ComboBox10.Text;
  vValorTemp := 0;
  vValorTemp1 := 0;
  vInc := 0;
  if CheckBox4.Checked then
  begin
    QRLabel22.Visible := True;
    QRLabel23.Visible := True;
    QRLabel24.Visible := True;
    QRLabel33.Visible := True;
    QRDBText15.Visible := True;
    QRDBText16.Visible := True;
    QRDBText17.Visible := True;
    QRDBText20.Visible := True;
    QRDBText15.DataField := 'DATA_INICIAL_VIGENCIA';
    QRDBText16.DataField := 'DATA_FINAL_VIGENCIA';
    QRDBText17.DataField := 'STATUS';
    QRDBText20.DataField := 'TIPO_OS';
    PageHeaderBand1.Height := 104;
    QRSubDetail1.Height := 23;
    QRShape5.Top := 101;
  end
  else
  begin
    QRLabel22.Visible := False;
    QRLabel23.Visible := False;
    QRLabel24.Visible := False;
    QRLabel33.Visible := False;
    QRDBText15.Visible := False;
    QRDBText16.Visible := False;
    QRDBText17.Visible := False;
    QRDBText20.Visible := False;
    QRDBText15.DataField := '';
    QRDBText16.DataField := '';
    QRDBText17.DataField := '';
    QRDBText20.DataField := '';
    PageHeaderBand1.Height := 104 - 19;
    QRSubDetail1.Height := 13;
    QRShape5.Top := 101 - 18;
  end;

  Cliente.Contratos.vSTATUS := ComboBox10.Text;
  Cliente.Contratos.vOrdemRelatorio := RadioGroup2.ItemIndex;

  Cliente.Contratos._getDadosRelatorio(2);

  QuickRep1.Preview;
end;

procedure TFrmCadClientes.BitBtn27Click(Sender: TObject);
begin
  inherited;
  QuickRep1.ReportTitle := 'Contratos vencendo no próximo mês - ' + ComboBox10.Text;
  vValorTemp := 0;
  vValorTemp1 := 0;
  vInc := 0;
  if CheckBox4.Checked then
  begin
    QRLabel22.Visible := True;
    QRLabel23.Visible := True;
    QRLabel24.Visible := True;
    QRLabel33.Visible := True;
    QRDBText15.Visible := True;
    QRDBText16.Visible := True;
    QRDBText17.Visible := True;
    QRDBText20.Visible := True;
    QRDBText15.DataField := 'DATA_INICIAL_VIGENCIA';
    QRDBText16.DataField := 'DATA_FINAL_VIGENCIA';
    QRDBText17.DataField := 'STATUS';
    QRDBText20.DataField := 'TIPO_OS';
    PageHeaderBand1.Height := 104;
    QRSubDetail1.Height := 23;
    QRShape5.Top := 101;
  end
  else
  begin
    QRLabel22.Visible := False;
    QRLabel23.Visible := False;
    QRLabel24.Visible := False;
    QRLabel33.Visible := False;
    QRDBText15.Visible := False;
    QRDBText16.Visible := False;
    QRDBText17.Visible := False;
    QRDBText20.Visible := False;
    QRDBText15.DataField := '';
    QRDBText16.DataField := '';
    QRDBText17.DataField := '';
    QRDBText20.DataField := '';
    PageHeaderBand1.Height := 104 - 19;
    QRSubDetail1.Height := 13;
    QRShape5.Top := 101 - 18;
  end;

  Cliente.Contratos.vSTATUS := ComboBox10.Text;
  Cliente.Contratos.vOrdemRelatorio := RadioGroup2.ItemIndex;

  Cliente.Contratos._getDadosRelatorio(3);

  QuickRep1.Preview;
end;

procedure TFrmCadClientes.BitBtn28Click(Sender: TObject);
begin
  inherited;
  TForm(pnContratoRelatorios.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadClientes.BitBtn28KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn28.Click;
end;

procedure TFrmCadClientes.BitBtn29Click(Sender: TObject);
begin
  inherited;
  QuickRep1.ReportTitle := 'Posição dos Contratos - ' + ComboBox10.Text;
  vValorTemp := 0;
  vValorTemp1 := 0;
  vInc := 0;
  if CheckBox4.Checked then
  begin
    QRLabel22.Visible := True;
    QRLabel23.Visible := True;
    QRLabel24.Visible := True;
    QRLabel33.Visible := True;
    QRDBText15.Visible := True;
    QRDBText16.Visible := True;
    QRDBText17.Visible := True;
    QRDBText20.Visible := True;
    QRDBText15.DataField := 'DATA_INICIAL_VIGENCIA';
    QRDBText16.DataField := 'DATA_FINAL_VIGENCIA';
    QRDBText17.DataField := 'STATUS';
    QRDBText20.DataField := 'TIPO_OS';
    PageHeaderBand1.Height := 104;
    QRSubDetail1.Height := 23;
    QRShape5.Top := 101;
  end
  else
  begin
    QRLabel22.Visible := False;
    QRLabel23.Visible := False;
    QRLabel24.Visible := False;
    QRLabel33.Visible := False;
    QRDBText15.Visible := False;
    QRDBText16.Visible := False;
    QRDBText17.Visible := False;
    QRDBText20.Visible := False;
    QRDBText15.DataField := '';
    QRDBText16.DataField := '';
    QRDBText17.DataField := '';
    QRDBText20.DataField := '';
    PageHeaderBand1.Height := 104 - 19;
    QRSubDetail1.Height := 13;
    QRShape5.Top := 101 - 18;
  end;

  Cliente.Contratos.vSTATUS := ComboBox10.Text;
  Cliente.Contratos.vOrdemRelatorio := RadioGroup2.ItemIndex;

  Cliente.Contratos._getDadosRelatorio(1);

  QuickRep1.Preview;
end;

procedure TFrmCadClientes.BitBtn30Click(Sender: TObject);
begin
  inherited;

  Cliente.Contratos.vSoma := 0;

  Cliente.Contratos.buscas.First;
  while not Cliente.Contratos.buscas.Eof do
  begin
    if DBGrid11.SelectedRows.CurrentRowSelected then
      Cliente.Contratos.vSoma := Cliente.Contratos.vSoma +
        Cliente.Contratos.buscas.FieldByName('valor').AsFloat;
    Cliente.Contratos.buscas.Next;
  end;

  Label144.Caption := Format('%0.2f', [Cliente.Contratos.vSoma]);
end;

procedure TFrmCadClientes.BitBtn31Click(Sender: TObject);
begin
  inherited;
  TForm(pnEnviarCartaViaEmail.Parent).ModalResult := IDOK;
end;

procedure TFrmCadClientes.BitBtn32Click(Sender: TObject);
var
  TextoAnsi: string;
begin
  inherited;
  if TBitBtn(sender) = BitBtn32 then
  begin
    if odAnexos.Execute then
      MemoAnexos.Lines.Add(odAnexos.FileName);
  end else if TBitBtn(sender) = BitBtn36 then
  begin
    if odAnexos.Execute then
    begin
      EditArquivoTexto.Text := odAnexos.FileName;
      RichEditMsg.Lines.LoadFromFile(odAnexos.FileName);
      tsMsgEmail1.Show;
    end;
  end else
    if TBitBtn(sender) = BitBtn33 then
    begin
      if odAnexos.Execute then
      begin
        EditFonteHtml.Text := odAnexos.FileName;
        RichEditMsg2.Lines.LoadFromFile(odAnexos.FileName);
        TextoAnsi := Utf8ToAnsi(RichEditMsg2.Lines.Text);
        RichEditMsg2.Lines.Text := TextoAnsi;
        tsMsgEmail2.Show;
      end;
    end;
end;

procedure TFrmCadClientes.BitBtn34Click(Sender: TObject);
begin
  inherited;
  if not Cliente.vCodigoForn.BuscarGrade(Cliente.vCodigoForn.dataSet.FieldByName('COD_GRADE').AsInteger) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit99.CanFocus) then
      DBEdit99.SetFocus;
    exit;
  end;
  Cliente.vCodigoForn.Post;
  Cliente.vCodigoForn.Apply;
  Cliente.vCodigoForn.CommitaTransacao;
  TForm(pnCodigoFornecedorCad.Parent).ModalResult := IDOK;
end;

procedure TFrmCadClientes.BitBtn35Click(Sender: TObject);
begin
  inherited;
  Cliente.vCodigoForn.Cancel;
  TForm(pnCodigoFornecedorCad.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadClientes.BitBtn37Click(Sender: TObject);
begin
  inherited;
  Cliente.vReds.Close;
  Cliente.vReds.vColabOr.Close;
  Cliente.vReds.vColabDest.Close;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TFrmCadClientes.BitBtn38Click(Sender: TObject);
begin
  inherited;
  QuickRep1.ReportTitle := 'Contratos a serem gerados - ' + 'Ativo';
  vValorTemp := 0;
  vValorTemp1 := 0;
  vInc := 0;
  if CheckBox4.Checked then
  begin
    QRLabel22.Visible := True;
    QRLabel23.Visible := True;
    QRLabel24.Visible := True;
    QRLabel33.Visible := True;
    QRDBText15.Visible := True;
    QRDBText16.Visible := True;
    QRDBText17.Visible := True;
    QRDBText20.Visible := True;
    QRDBText15.DataField := 'DATA_INICIAL_VIGENCIA';
    QRDBText16.DataField := 'DATA_FINAL_VIGENCIA';
    QRDBText17.DataField := 'STATUS';
    QRDBText20.DataField := 'TIPO_OS';
    PageHeaderBand1.Height := 104;
    QRSubDetail1.Height := 23;
    QRShape5.Top := 101;
  end
  else
  begin
    QRLabel22.Visible := False;
    QRLabel23.Visible := False;
    QRLabel24.Visible := False;
    QRLabel33.Visible := False;
    QRDBText15.Visible := False;
    QRDBText16.Visible := False;
    QRDBText17.Visible := False;
    QRDBText20.Visible := False;
    QRDBText15.DataField := '';
    QRDBText16.DataField := '';
    QRDBText17.DataField := '';
    QRDBText20.DataField := '';
    PageHeaderBand1.Height := 104 - 19;
    QRSubDetail1.Height := 13;
    QRShape5.Top := 101 - 18;
  end;

  Cliente.Contratos.vDataBasePrGeradorOs := StrToDate(MaskEdit17.Text);
  Cliente.Contratos.vSTATUS := 'Ativo';
  Cliente.Contratos.vOrdemRelatorio := RadioGroup2.ItemIndex;
  if CheckBox6.Checked = false then
    Cliente.Contratos._getDadosRelatorio(4)
  else
    Cliente.Contratos._getDadosRelatorio(6);

  QuickRep1.Preview;
end;

procedure TFrmCadClientes.BitBtn39Click(Sender: TObject);
begin
  inherited;
  QuickRep1.ReportTitle := 'Contratos não gerados';
  vValorTemp := 0;
  vValorTemp1 := 0;
  vInc := 0;
  if CheckBox4.Checked then
  begin
    QRLabel22.Visible := True;
    QRLabel23.Visible := True;
    QRLabel24.Visible := True;
    QRLabel33.Visible := True;
    QRDBText15.Visible := True;
    QRDBText16.Visible := True;
    QRDBText17.Visible := True;
    QRDBText20.Visible := True;
    QRDBText15.DataField := 'DATA_INICIAL_VIGENCIA';
    QRDBText16.DataField := 'DATA_FINAL_VIGENCIA';
    QRDBText17.DataField := 'STATUS';
    QRDBText20.DataField := 'TIPO_OS';
    PageHeaderBand1.Height := 104;
    QRSubDetail1.Height := 23;
    QRShape5.Top := 101;
  end
  else
  begin
    QRLabel22.Visible := False;
    QRLabel23.Visible := False;
    QRLabel24.Visible := False;
    QRLabel33.Visible := False;
    QRDBText15.Visible := False;
    QRDBText16.Visible := False;
    QRDBText17.Visible := False;
    QRDBText20.Visible := False;
    QRDBText15.DataField := '';
    QRDBText16.DataField := '';
    QRDBText17.DataField := '';
    QRDBText20.DataField := '';
    PageHeaderBand1.Height := 104 - 19;
    QRSubDetail1.Height := 13;
    QRShape5.Top := 101 - 18;
  end;

  Cliente.Contratos.vDataBasePrGeradorOs := StrToDate(MaskEdit17.Text);
  Cliente.Contratos.vSTATUS := 'Ativo';
  Cliente.Contratos.vOrdemRelatorio := RadioGroup2.ItemIndex;
  if CheckBox6.Checked = false then
    Cliente.Contratos._getDadosRelatorio(5)
  else
    Cliente.Contratos._getDadosRelatorio(8);

  QuickRep1.Preview;
end;

procedure TFrmCadClientes.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
	if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    ShowAtencao('NFCe modo Offline, não permite inclusão de registros. Por favor acesso o sistema remoto');
    Exit;
  end;
  if cliente.sugerirPossivelCliente(pnEscolherPossivelCliente, DBGrid17) then
  begin
    Cliente.strTmp := 'usarpossivecliente';
    try
      SpeedButton1.Click;
    finally
      Cliente.strTmp := '';
    end;
    Exit;
  end;

  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES', 'I', Cliente.buscas) then
    Exit;

  if not Cliente.testarTipoVenda then
    exit;

  if not vDadosIni.PesqPros('CLI002', 'INSERINDO NOVO REGISTRO', '', 'CLIENTES', '', Cliente.buscas, true) then
  	Exit;

  Cliente.cadastroSimplificado := vDadosIni.getConfSisBool('cl_cad_simpl_habilitado', Cliente.buscas);

  vDadosIni.vInibeMensPesqPros := 'S';
 	SpeedButtonAlternarCadastro.Visible := vDadosIni.PesqPros('CLI292', 'HABILITAR', '', 'CLIENTES', '', Cliente.buscas, true);
  SpeedButtonAlternarCadastro2.Visible := SpeedButtonAlternarCadastro.Visible;

  if cliente.cadastroSimplificado then
  begin
    if not Cliente.Insert then
    	Exit;

    HabilitarCamposInclusao;
  end
  else
  begin
    if not Cliente.Insert then
    	Exit;

  	inherited;
  	HabilitarCamposInclusao;
  end;
end;

procedure TFrmCadClientes.BitBtn41Click(Sender: TObject);
begin
  inherited;
  QuickRep1.ReportTitle := 'Contratos entrando em vigência - ' + ComboBox10.Text;
  vValorTemp := 0;
  vValorTemp1 := 0;
  vInc := 0;
  if CheckBox4.Checked then
  begin
    QRLabel22.Visible := True;
    QRLabel23.Visible := True;
    QRLabel24.Visible := True;
    QRLabel33.Visible := True;
    QRDBText15.Visible := True;
    QRDBText16.Visible := True;
    QRDBText17.Visible := True;
    QRDBText20.Visible := True;
    QRDBText15.DataField := 'DATA_INICIAL_VIGENCIA';
    QRDBText16.DataField := 'DATA_FINAL_VIGENCIA';
    QRDBText17.DataField := 'STATUS';
    QRDBText20.DataField := 'TIPO_OS';
    PageHeaderBand1.Height := 104;
    QRSubDetail1.Height := 23;
    QRShape5.Top := 101;
  end
  else
  begin
    QRLabel22.Visible := False;
    QRLabel23.Visible := False;
    QRLabel24.Visible := False;
    QRLabel33.Visible := False;
    QRDBText15.Visible := False;
    QRDBText16.Visible := False;
    QRDBText17.Visible := False;
    QRDBText20.Visible := False;
    QRDBText15.DataField := '';
    QRDBText16.DataField := '';
    QRDBText17.DataField := '';
    QRDBText20.DataField := '';
    PageHeaderBand1.Height := 104 - 19;
    QRSubDetail1.Height := 13;
    QRShape5.Top := 101 - 18;
  end;

  Cliente.Contratos.vSTATUS := ComboBox10.Text;
  Cliente.Contratos.vDataBasePrGeradorOs := StrToDate(MaskEdit17.Text);
  Cliente.Contratos.vOrdemRelatorio := RadioGroup2.ItemIndex;
  Cliente.Contratos._getDadosRelatorio(7);

  QuickRep1.Preview;
end;

procedure TFrmCadClientes.BitBtn42Click(Sender: TObject);
begin
  inherited;
  TForm(pnEnviarCartaViaEmail.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadClientes.BitBtn43Click(Sender: TObject);
begin
  inherited;
  TForm(pnModeloCartas.Parent).ModalResult := IDCLOSE;
end;

procedure TFrmCadClientes.BitBtn_6Click(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn_6.CanFocus) then
  	BitBtn_6.SetFocus;
  BitBtn2Click(Sender);
end;

procedure TFrmCadClientes.BitBtn_9Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('CLI026', 'IMPRIMIR', '', 'CLIENTES',
    Cliente.dataSet.FieldByName('COD_CLIENTE').asstring, Cliente.buscas, true) then
  begin
    try
      Cliente.RelFichaCadastralCli;
    finally
      if Cliente.dataSet.State = dsInsert then
        if (Self.Enabled) and (Self.Visible) and (dbedit6.CanFocus) then
        	dbedit6.SetFocus;
    end;
  end;
end;

procedure TFrmCadClientes.BitBtn_4Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn_4.CanFocus) then
  	BitBtn_4.SetFocus;
  if not Cliente.validarCadastrosSimplificado then
  begin
    setFocusCampoErro(Cliente.vNomeCampoErro, Cliente.vMensagemErro);
    exit;
  end;

  if tsSFormasDePagamento.TabVisible or btnsFormasPagamento.Visible then
    if vDadosIni.vEmp.vUsarControlesCliente = 'S' then
      if (Trim(Cliente.dataSet.FieldByName('controles_fp').AsString) = '') and (Trim(Cliente.dataSet.FieldByName('TIPO').AsString) <> 'F') then
      begin
        Application.MessageBox('Cliente sem nenhuma forma de pagamento', 'Atenção', 0 + 64);
        if not vDadosIni.PesqPros('CLI189', 'VALIDAR', '', 'CLIENTES',
          Cliente.dataSet.FieldByName('COD_ClIENTE').AsString, Cliente.buscas, true, True) then
        begin
          if tsSFormasDePagamento.TabVisible then
            pageCadSimples.ActivePage := tsSFormasDePagamento
          else if btnsFormasPagamento.Visible then
            btnsFormasPagamento.Click;
          exit;
        end;
      end;

  if Cliente.verificarCpfCnpjJaExite then//JaExisteCPFCNPJ then
  begin
    pageCadSimples.ActivePage := tsSDadosPessoais;
    if (Self.Enabled) and (Self.Visible) and (DBEdit112.CanFocus) then
    	DBEdit112.SetFocus;
    exit;
  end;

  if not Cliente.validarCamposPersonalizados then
  begin
    handleFocusCampoErro(Cliente.vNomeCampoErro);
    if Cliente.strTmp = 'P' then
      btnDadosPessoaisAd.Click
    else if Cliente.strTmp = 'E' then
      btnEdendecoAd.Click
    else if Cliente.strTmp = 'C' then
      btnContatoTelefoneAd.Click
    else if Cliente.strTmp = 'D' then
      btnDocumentosAd.Click
    else if Cliente.strTmp = 'O' then
      btnObsOutrosAd.Click
    else if not setFocusCampoErro(Cliente.vNomeCampoErro, Cliente.vMensagemErro, True) then
      if (Self.Enabled) and (Self.Visible) and (DBEdit111.CanFocus) then
        DBEdit111.SetFocus;
    exit;
  end;

  if not Cliente.validarEnderecoDeCobranca then
  begin
    btnEdendecoAd.Tag := 1;
    btnEdendecoAd.Click;
    btnEdendecoAd.Tag := 0;
    Exit;
  end;

  if not Cliente.verificarTelefoneCelular(true,
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger,
    trim(Cliente.dataSet.FieldByName('CPFCGC').AsString),
    trim(Cliente.dataSet.FieldByName('EMAIL').AsString),
  	trim(Cliente.dataSet.FieldByName('FONE_CELULAR').AsString)) then
  begin
  	if Cliente.cadastroSimplificado then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBEdit205.CanFocus) then
	    	DBEdit205.SetFocus
    end
    else if (Self.Enabled) and (Self.Visible) and (DBEdit204.CanFocus) then
    	DBEdit204.SetFocus;
    exit;
  end;
    
  if not Cliente.Post then
  begin
    pageCadSimples.ActivePage := tsCadastroSimples;
    if (Self.Enabled) and (Self.Visible) and (DBEdit111.CanFocus) then
      DBEdit111.SetFocus;
  end
  else
  begin
    Cliente.dataSet.FieldByName('CPFCGC').EditMask := '';
    if CheckCadSeq_.Checked then
    begin
      if Cliente.Insert then
      begin
        pageCadSimples.ActivePage := tsCadastroSimples;
        Cliente.PreencheCampos;
        Cliente.AbreQuerysDePesquisa;
        Cliente.atualizarCampos;
      end;
    end
    else
    begin
      Cliente.Refresh;
      Cliente.FechaQuerys;
      inherited BitBtn4Click(BitBtn4);
    end;
  end;
end;

procedure TFrmCadClientes.BitBtn_5Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn_5.CanFocus) then
  	BitBtn_5.SetFocus;
//  if vDadosIni.PesqPros('CLI025', 'CANCELAR', '', 'CLIENTES',
//    Cliente.dataSet.FieldByName('COD_ClIENTE').AsString, Cliente.buscas, true) then
//  begin
    Cliente.Cancel;
    Cliente.FechaQuerys;
    Cliente.RollBackTransacao;
    inherited BitBtn5Click(BitBtn5);
    TabSheet2.Show;
//  end;
end;

procedure TFrmCadClientes.BitBtn4Click(Sender: TObject);
var
  vListaTmp: TStringList;
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not Cliente.DadosPessoaisObrigatorios then
  begin
    PageControl3.ActivePage := TabSheet3;
    setFocusCampoErro(Cliente.vNomeCampoErro, Cliente.vMensagemErro);
    exit;
  end;
  if not Cliente.DadosAdicionaisObrigatorios then
  begin
    PageControl3.ActivePage := TabSheet4;
    setFocusCampoErro(Cliente.vNomeCampoErro, Cliente.vMensagemErro);
    exit;
  end;
  //  if Cliente.dataSet.FieldByName('TIPO').AsString <> 'F' then
  if not Cliente.DadosComplementaresObrigatorios then
  begin
    PageControl3.ActivePage := TabSheet5;
    setFocusCampoErro(Cliente.vNomeCampoErro, Cliente.vMensagemErro);
    exit;
  end;
  if not Cliente.validarCamposPersonalizados then
  begin
    handleFocusCampoErro(Cliente.vNomeCampoErro);
    if not setFocusCampoErro(Cliente.vNomeCampoErro, Cliente.vMensagemErro, True) then
      if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
        DBEdit6.SetFocus;
    exit;
  end;

  if vDadosIni.vEmp.vUsarControlesCliente = 'S' then
    if (Trim(Cliente.dataSet.FieldByName('controles_fp').AsString) = '') and (Trim(Cliente.dataSet.FieldByName('TIPO').AsString) <> 'F') then
    begin
      Application.MessageBox('Cliente sem nenhuma forma de pagamento', 'Atenção', 0 + 64);
      if not vDadosIni.PesqPros('CLI189', 'VALIDAR', '', 'CLIENTES',
        Cliente.dataSet.FieldByName('COD_ClIENTE').AsString, Cliente.buscas, true) then
      begin
        PageControl3.ActivePage := tsFormaPag;
        if (Self.Enabled) and (Self.Visible) and (gridCondPag.CanFocus) then
          gridCondPag.SetFocus;
        exit;
      end
      else if Application.MessageBox('Deseja continuar mesmo assim?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      begin
        PageControl3.ActivePage := tsFormaPag;
        if (Self.Enabled) and (Self.Visible) and (gridCondPag.CanFocus) then
          gridCondPag.SetFocus;
        exit;
      end;
    end;

  if Cliente.verificarCpfCnpjJaExite then
  begin
    PageControl3.ActivePage := TabSheet3;
    if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then    
    	DBEdit6.SetFocus;
    exit;
  end;

  vListaTmp := TStringList.Create;
  vListaTmp.Text := lbxAutXML.Items.Text;

  if (Cliente.dataSet.State in [dsInsert, dsEdit]) then
    Cliente.dataSet.FieldByName('NFE_AUTXML').AsString := vDadosIni.Join(vListaTmp);

  if not Cliente.verificarTelefoneCelular(true,
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger,
    trim(Cliente.dataSet.FieldByName('CPFCGC').AsString),
    trim(Cliente.dataSet.FieldByName('EMAIL').AsString),
  	trim(Cliente.dataSet.FieldByName('FONE_CELULAR').AsString)) then
  begin
  	if Cliente.cadastroSimplificado then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBEdit205.CanFocus) then
	    	DBEdit205.SetFocus
    end
    else if (Self.Enabled) and (Self.Visible) and (DBEdit204.CanFocus) then
    	DBEdit204.SetFocus;
    exit;
  end;
      
  if not Cliente.Post then
  begin
    TabSheet3.TabVisible := true;
    PageControl3.ActivePage := TabSheet3;
    if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then    
   	  DBEdit6.SetFocus;
  end
  else
  begin
    Cliente.dataSet.FieldByName('CPFCGC').EditMask := '';
    if CheckCadSeq.Checked then
    begin
      if Cliente.Insert then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then    
   				DBEdit6.SetFocus;
        Cliente.PreencheCampos;
        Cliente.AbreQuerysDePesquisa;
        Cliente.atualizarCampos;
      end;
      MudaCor;
    end
    else
    begin
      Cliente.Refresh;
      Cliente.FechaQuerys;
      inherited;
    end;
  end;
end;

procedure TFrmCadClientes.BitBtn52Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CLI202', 'EDITAR', '', 'CLIENTES',
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, Cliente.buscas, true) then
    Exit;

  DBEdit7.Enabled := true;
  DBEdit8.Enabled := true;
  if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
  	DBEdit7.SetFocus;
end;

procedure TFrmCadClientes.BitBtn53Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CLI203', 'EDITAR', '', 'CLIENTES',
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, Cliente.buscas, true) then
    Exit;

  DBEdit6.Enabled := true;
  if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
  	DBEdit6.SetFocus;
end;

procedure TFrmCadClientes.BitBtn54Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CLI203', 'EDITAR', '', 'CLIENTES',
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, Cliente.buscas, true) then
    Exit;
    
  DBEdit112.Enabled := true;
  if (Self.Enabled) and (Self.Visible) and (DBEdit112.CanFocus) then
  	DBEdit112.SetFocus;
end;

procedure TFrmCadClientes.BitBtn55Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CLI202', 'EDITAR', '', 'CLIENTES',
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, Cliente.buscas, true) then
    Exit;
    
  DBEdit111.Enabled := true;
  DBEdit113.Enabled := true;
  if (Self.Enabled) and (Self.Visible) and (DBEdit111.CanFocus) then
  	DBEdit111.SetFocus;
end;

procedure TFrmCadClientes.BitBtnSairExtratoContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if TelaCadastro = 8 then
  	Close
  else
  begin
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
  end;
end;

procedure TFrmCadClientes.BitBtnOKExtratoContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtnOKExtratoContaCorrente.CanFocus) then
 	  BitBtnOKExtratoContaCorrente.SetFocus;
  if not Cliente.vContaCorrenteCli.Post(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger,
    Cliente.dataSet.FieldByName('CPFCGC').AsString,
    Cliente.vContaCorrenteCli.vCodEmpTransf,
    Cliente.vContaCorrenteCli.vCodTransf) then
  begin
    setFocusCampoErro(Cliente.vContaCorrenteCli.vNomeCampoErro, Cliente.vContaCorrenteCli.vMensagemErro);
    exit;
  end;

  BitBtnAtualizarExtratoContaCorrenteClick(Sender);

  PageControl5.ActivePage := tsConsContaCorrente;
  tsConsContaCorrente.Show;
end;

procedure TFrmCadClientes.BitBtnCancelarExtratoContaCorrenteClick(Sender: TObject);
begin
  inherited;
  Cliente.vContaCorrenteCli.Cancel;
  Cliente.vContaCorrenteCli.RollBackTransacao;

  BitBtnAtualizarExtratoContaCorrenteClick(Sender);
  PageControl5.ActivePage := tsConsContaCorrente;
  tsConsContaCorrente.Show;
end;

procedure TFrmCadClientes.BitBtnAtualizarExtratoContaCorrenteClick(Sender: TObject);
begin
  try
    Cursor := crHourGlass;

    if vDadosIni.vProgFid.vHabilitarProgFid then
      //
    else if vDadosIni.vCashback.vHabilitarCashback then
      Label359.Caption := 'R$ ' + FormatFloat('#,##0.00', Cliente.nummus_consultar_saldo);
    
    if not Cliente.vContaCorrenteCli.abreContaCorrente(
     	Cliente.dataSet.FieldByName('cod_cliente').AsInteger,
      Cliente.dataSet.FieldByName('cpfcgc').AsString,
      DBGrid18,
      Label348,
      BitBtnVoltarExtratoContaCorrente.Visible) then
        Exit;

   	Label402.Caption := 'Exibindo ' +
    	IntToStr(vDadosIni.IfThen(Cliente.vContaCorrenteCli.vRecordCount > 0,
      					 (Cliente.vContaCorrenteCli.vQtdeGrid * Cliente.vContaCorrenteCli.vPagGrid) + 1,
                 0)) +
      ' até ' +
      IntToStr(vDadosIni.IfThen(Cliente.vContaCorrenteCli.vRecordCount > 0,
      					 (Cliente.vContaCorrenteCli.vQtdeGrid * Cliente.vContaCorrenteCli.vPagGrid) + Cliente.vContaCorrenteCli.vRecordPagGrid,
                 0)) +
      ' de ' +
      IntToStr(Cliente.vContaCorrenteCli.vRecordCount) +
      ' linhas';

  finally
    Cursor := crDefault;
  end;
end;

procedure TFrmCadClientes.BitBtn5Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn5.CanFocus) then
  	BitBtn5.SetFocus;
//  if vDadosIni.PesqPros('CLI025', 'CANCELAR', '', 'CLIENTES',
//    Cliente.dataSet.FieldByName('COD_ClIENTE').AsString, Cliente.buscas, true) then
//  begin
  Cliente.Cancel;
  Cliente.FechaQuerys;
  Cliente.RollBackTransacao;
  inherited;
  TabSheet2.Show;
//  end;
end;

procedure TFrmCadClientes.BitBtnGerarValeExtratoContaCorrenteClick(Sender: TObject);
var
	vnummus_consultar_saldo: Double;
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtnGerarValeExtratoContaCorrente.CanFocus) then
  	BitBtnGerarValeExtratoContaCorrente.SetFocus;

  if vDadosIni.vProgFid.vHabilitarProgFid then
  	//
  else if vDadosIni.vCashback.vHabilitarCashback then
  begin
  	vnummus_consultar_saldo := Cliente.nummus_consultar_saldo;

  	Label359.Caption := 'R$ ' + FormatFloat('#,##0.00', vnummus_consultar_saldo);

    if vnummus_consultar_saldo <= 0 then
    begin
    	Application.MessageBox('Cliente sem saldo acumulado (R$)', 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    	Exit;
    end;
  end;
    
  if not Cliente.vContaCorrenteCli.gerarValeCompra(
  	Cliente.dataSet.FieldByName('cod_cliente').AsInteger,
  	Cliente.dataSet.FieldByName('cpfcgc').AsString,
    False,
    Label348,
    Cliente,
    True,
    Sender) then
    	exit;

	BitBtnAtualizarExtratoContaCorrenteClick(Sender);
end;

procedure TFrmCadClientes.BitBtnVisualizarVencidosExtratoContaCorrenteClick(Sender: TObject);
begin
  try
  	Cliente.vContaCorrenteCli.vPagGrid := 0;
    if not Cliente.vContaCorrenteCli.abreContaCorrente(
    	Cliente.dataSet.FieldByName('cod_cliente').AsInteger,
      Cliente.dataSet.FieldByName('cpfcgc').AsString,
      DBGrid18,
      Label348,
      True) then
      	Exit;

    Label402.Caption := 'Exibindo ' +
    	IntToStr(vDadosIni.IfThen(Cliente.vContaCorrenteCli.vRecordCount > 0,
      					 (Cliente.vContaCorrenteCli.vQtdeGrid * Cliente.vContaCorrenteCli.vPagGrid) + 1,
                 0)) +
      ' até ' +
      IntToStr(vDadosIni.IfThen(Cliente.vContaCorrenteCli.vRecordCount > 0,
      					 (Cliente.vContaCorrenteCli.vQtdeGrid * Cliente.vContaCorrenteCli.vPagGrid) + Cliente.vContaCorrenteCli.vRecordPagGrid,
                 0)) +
      ' de ' +
      IntToStr(Cliente.vContaCorrenteCli.vRecordCount) +
      ' linhas';

    BitBtnSairExtratoContaCorrente.Visible                    := false;
    BitBtnVoltarExtratoContaCorrente.Visible                  := true;

    BitBtnIncluirExtratoContaCorrente.Enabled                 := false;
    BitBtnExcluirExtratoContaCorrente.Enabled                 := false;
    BitBtnGerarValeExtratoContaCorrente.Enabled               := false;
    BitBtnResgatarValeExtratoContaCorrente.Enabled            := false;
    BitBtnVisualizarVencidosExtratoContaCorrente.Enabled      := false;
    BitBtnTransferirSaldoExtratoContaCorrente.Enabled         := false;
    BitBtnVisualizarTransferenciaExtratoContaCorrente.Enabled := false;
  finally
    Cursor := crDefault;
  end;
end;

procedure TFrmCadClientes.BitBtn62Click(Sender: TObject);
begin
  // Atualizar saldo conta corrente
  if (Self.Enabled) and (Self.Visible) and (BitBtn62.CanFocus) then  
  	BitBtn62.SetFocus;

  if PageControl7.ActivePage = tsOpcaoValeCompra then
  begin
    if Application.MessageBox('Deseja gerar vale resgate/troca?',
      'Atenção' ,MB_ICONINFORMATION + MB_YESNO) <> IDYES then
        exit;
  end
  else
  begin
    if Application.MessageBox('Deseja selecionar mercadorias para realizar troca?',
      'Atenção' ,MB_ICONINFORMATION + MB_YESNO) <> IDYES then
        exit;
  end;

  vDadosIni.atualizarSaldoCC(
  	Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger,
    Cliente.dataSet.FieldByName('CPFCGC').AsString,
  	Label348,
    False,
    Cliente.vContaCorrenteCli.vQtdeGrid,
    Cliente.buscas,
    Cliente.vContaCorrenteCli.vSaldoCC,
    Cliente.vContaCorrenteCli.vValorCC,
    Cliente.vContaCorrenteCli.vPagGrid,
    Cliente.vContaCorrenteCli.vRecordPagGrid,
    Cliente.vContaCorrenteCli.vMaxPagGrid,
    Cliente.vContaCorrenteCli.vRecordCount);

  if vDadosIni.vProgFid.vHabilitarProgFid then
  	Label354.Caption := FormatFloat('0', Cliente.vContaCorrenteCli.vSaldoCC);

  if PageControl7.ActivePage = tsOpcaoValeCompra then
  begin
    // Vale Compra
    if Cliente.vContaCorrenteCli.vRegrasValeCompraProgFid.dataSet.IsEmpty then
    begin
      if EditHwPontosVale.AsValue <= 0 then
      begin
        Application.MessageBox(PChar('Pontos não foi informado!'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
         if (Self.Enabled) and (Self.Visible) and (EditHwPontosVale.CanFocus) then
           EditHwPontosVale.SetFocus;
         exit;
      end;
      if EditHwValorVale.AsValue <= 0 then
      begin
        Application.MessageBox(PChar('Valor do vale não foi informado!'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
         if (Self.Enabled) and (Self.Visible) and (EditHwValorVale.CanFocus) then
           EditHwValorVale.SetFocus;
         exit;  
      end;
    end
    else
    begin
      if Cliente.vContaCorrenteCli.vRegrasValeCompraProgFid.dataSet.FieldByName('PONTOS').AsFloat > Cliente.vContaCorrenteCli.vSaldoCC then
      begin
        Application.MessageBox(PChar('Saldo disponível é menor que o valor de pontos selecionado: ' + #13 + #13 +
          'Saldo disponível (Pontos): ' + FormatFloat('#,##0', Cliente.vContaCorrenteCli.vSaldoCC) + #13 +
          'Valor selecionado..............: ' + FormatFloat('#,##0', Cliente.vContaCorrenteCli.vRegrasValeCompraProgFid.dataSet.FieldByName('PONTOS').AsFloat)),
          'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
        exit;
      end;
    end;
  end
  else
  begin
     if Cliente.vContaCorrenteCli.vRegrasValeTrocaProgFid.fTempDtValeTroca.DataSet.IsEmpty then
     begin
       Application.MessageBox(PChar('Nenhuma mercadoria adicionada!'), 'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
       exit;
     end;
     if vDadosIni.vTempPontosResgateTroca > Cliente.vContaCorrenteCli.vSaldoCC then
     begin
       Application.MessageBox(PChar('Saldo disponível é menor que o valor dos pontos do vale troca: ' + #13 + #13 +
         'Saldo disponível (Pontos): ' + FormatFloat('#,##0', Cliente.vContaCorrenteCli.vSaldoCC) + #13 +
         'Pontos das mercadorias...: ' + FormatFloat('#,##0', vDadosIni.vTempPontosResgateTroca)),
         'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
       exit;
     end;
  end;

  TForm(pnValeTroca.Parent).ModalResult := IDOK;
end;

procedure TFrmCadClientes.BitBtn63Click(Sender: TObject);
begin
  TForm(pnValeTroca.Parent).ModalResult := IDCLOSE;
end;

procedure TFrmCadClientes.BitBtnTransferirSaldoExtratoContaCorrenteClick(Sender: TObject);
begin
  if not Cliente.vContaCorrenteCli.tranfSaldo(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
    exit;

  BitBtnAtualizarExtratoContaCorrenteClick(Sender);
end;

procedure TFrmCadClientes.BitBtn65Click(Sender: TObject);
begin
  if Cliente.vContaCorrenteCli.vEmpresaProgFid.IsEmpty then
  begin
    Application.MessageBox(pchar('Nenhum empresa encontrada para transferir saldo!'),
    	'Atenção', MB_ICONERROR + MB_OK);
    TForm(pnTranfSaldo.Parent).ModalResult := IDCANCEL;
    exit;
  end;

  if not Cliente.vContaCorrenteCli.testarEmpresa(
  	Cliente.vContaCorrenteCli.vEmpresaProgFid.dataSet.FieldByName('COD_EMPRESA').AsInteger) then
  begin
    TForm(pnTranfSaldo.Parent).ModalResult := IDCANCEL;
    exit;
  end;  

  if not Cliente.vContaCorrenteCli.testarCliente(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger,
    Cliente.vContaCorrenteCli.vEmpresaProgFid.dataSet.FieldByName('COD_EMPRESA').AsInteger) then
  begin
    TForm(pnTranfSaldo.Parent).ModalResult := IDCANCEL;
    exit;
  end;

  if not Cliente.vContaCorrenteCli.insert(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger,
    Cliente.vContaCorrenteCli.vEmpresaProgFid.dataSet.FieldByName('COD_EMPRESA').AsInteger, 0) then
    exit;

  TForm(pnTranfSaldo.Parent).ModalResult := IDOK;

  PageControl5.ActivePage := tsIncluirContaCorrente;
  tsIncluirContaCorrente.Show;
  lbValorValeLanc.Caption := '0';
end;

procedure TFrmCadClientes.BitBtnVisualizarTransferenciaExtratoContaCorrenteClick(Sender: TObject);
begin
  if not Cliente.vContaCorrenteCli.visualizarTransProgFid(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
    exit;

  BitBtnAtualizarExtratoContaCorrenteClick(Sender);
end;

procedure TFrmCadClientes.BitBtn67Click(Sender: TObject);
begin
  TForm(pnTranfSaldo.Parent).ModalResult := IDCLOSE;
end;

procedure TFrmCadClientes.BitBtn68Click(Sender: TObject);
begin
  if Cliente.vContaCorrenteCli.vTransSaldoProgFid.IsEmpty then
  begin
    Application.MessageBox(pchar('Nenhum transferência de encontrada!'),
   		'Atenção', MB_ICONERROR + MB_OK);
    TForm(pnTransferenciasSaldo.Parent).ModalResult := IDCANCEL;
    exit;
  end;

  if not Cliente.vContaCorrenteCli.vTransSaldoProgFid.verificarRegistro then
  begin
    TForm(pnTransferenciasSaldo.Parent).ModalResult := IDCANCEL;
    exit;
  end;

  if not Cliente.vContaCorrenteCli.insert(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger,
    Cliente.vContaCorrenteCli.vTransSaldoProgFid.dataSet.FieldByName('COD_EMPRESA').AsInteger,
    Cliente.vContaCorrenteCli.vTransSaldoProgFid.dataSet.FieldByName('CODIGO').AsInteger) then
    exit;

  TForm(pnTransferenciasSaldo.Parent).ModalResult := IDOK;
    
  PageControl5.ActivePage := tsIncluirContaCorrente;
  tsIncluirContaCorrente.Show;
  lbValorValeLanc.Caption := '0';
  DBEdit202Exit(Sender);
end;

procedure TFrmCadClientes.BitBtn69Click(Sender: TObject);
begin
  TForm(pnTransferenciasSaldo.Parent).ModalResult := IDCLOSE;
end;

procedure TFrmCadClientes.BitBtn6Exit(Sender: TObject);
begin
  inherited;
  //  if (Self.Enabled) and (Self.Visible) and (CheckCadSeq.CanFocus) then
  //    CheckCadSeq.SetFocus
  //  else if (Self.Enabled) and (Self.Visible) and (BitBtn9.CanFocus)
  //    BitBtn9.SetFocus;
end;

procedure TFrmCadClientes.BitBtn70Click(Sender: TObject);
begin                                            
  if not Cliente.vContaCorrenteCli.vDocProgFid.existePendencia(Cliente.vContaCorrenteCli.vRegrasValeCompraProgFid) then
    exit;
  
  TForm(pnDocProgFid.Parent).ModalResult := IDOK;
end;

procedure TFrmCadClientes.BitBtn71Click(Sender: TObject);
begin
  TForm(pnDocProgFid.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadClientes.BitBtn72Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not Cliente.vContaCorrenteCli.vDocProgFid.abreDocProgFid(
    	FrmCadClientes.MaskEditDataIni.Text, FrmCadClientes.MaskEditDataFim.Text,
      FrmCadClientes.ckReq.Checked, FrmCadClientes.ckOS.Checked, FrmCadClientes.ckComFat.Checked,
      Cliente.dataSet.FieldByName('cod_cliente').AsInteger) then
       exit;
  finally
     Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadClientes.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja definir as curvas ABC do cliente?' + chr(13) +
    'Obs.: É importante que não se esteja fazendo' + chr(13) +
    'alterações no cadastro de clientes.', 'Confirmação', MB_YESNO + MB_ICONQUESTION +
    MB_DEFBUTTON1) = mrYES then
  begin
    if vDadosIni.PesqPros('CLI003', 'DEFINIR', '', 'CLIENTES', '', Cliente.buscas, true) then
    begin
      Screen.Cursor := crHourGlass;
      BorderIcons := [];
      GroupBox3.Visible := false;
      Panel1.Visible := false;
      Panel1.Enabled := false;
      Panel7.Top := GroupBox3.Height;
      Panel7.Left := TRUNC((GroupBox3.Width - Panel7.Width) / 2);
      Panel7.Visible := true;
      Cliente.Parar := 0;
      Cliente.CurvaABCVariaveis;
      if (not Cliente.CurvaABCQuantidadePedido(ProgressBar1, Panel7)) and (Cliente.Parar = 1) then
      begin
        BorderIcons := [biSystemMenu, biMinimize, biMaximize];
        panel7.Visible := false;
        Panel1.Visible := true;
        Panel1.Enabled := true;
        GroupBox3.Visible := true;
        Cliente.abreClientes(-1);
        Screen.Cursor := crDefault;
        exit;
      end;
      if (not Cliente.CurvaABCSomaValoresCompraCliente(ProgressBar1, Panel7)) and (Cliente.Parar = 1)
        then
      begin
        BorderIcons := [biSystemMenu, biMinimize, biMaximize];
        panel7.Visible := false;
        Panel1.Visible := true;
        Panel1.Enabled := true;
        GroupBox3.Visible := true;
        Cliente.abreClientes(-1);
        Screen.Cursor := crDefault;
        exit;
      end;
      if (not Cliente.CurvaABCUltimaCompra(ProgressBar1, Panel7)) and (Cliente.Parar = 1) then
      begin
        BorderIcons := [biSystemMenu, biMinimize, biMaximize];
        panel7.Visible := false;
        Panel1.Visible := true;
        Panel1.Enabled := true;
        GroupBox3.Visible := true;
        Cliente.abreClientes(-1);
        Screen.Cursor := crDefault;
        exit;
      end;
      if (not Cliente.CurvaABCAtrasoPagamento(ProgressBar1, Panel7)) and (Cliente.Parar = 1) then
      begin
        BorderIcons := [biSystemMenu, biMinimize, biMaximize];
        panel7.Visible := false;
        Panel1.Visible := true;
        Panel1.Enabled := true;
        GroupBox3.Visible := true;
        Cliente.abreClientes(-1);
        Screen.Cursor := crDefault;
        exit;
      end;
      if (not Cliente.CurvaABCLucroCliente(ProgressBar1, Panel7)) and (Cliente.Parar = 1) then
      begin
        BorderIcons := [biSystemMenu, biMinimize, biMaximize];
        panel7.Visible := false;
        Panel1.Visible := true;
        Panel1.Enabled := true;
        GroupBox3.Visible := true;
        Cliente.abreClientes(-1);
        Screen.Cursor := crDefault;
        exit;
      end;
      if (not Cliente.CurvaABCFrequenciaCompra(ProgressBar1, Panel7)) and (Cliente.Parar = 1) then
      begin
        BorderIcons := [biSystemMenu, biMinimize, biMaximize];
        panel7.Visible := false;
        Panel1.Visible := true;
        Panel1.Enabled := true;
        GroupBox3.Visible := true;
        Cliente.abreClientes(-1);
        Screen.Cursor := crDefault;
        exit;
      end;
      if CheckBox2.Checked then
      begin
        if (not Cliente.CurvaABCQuantidadeCompraVeiculos(ProgressBar1, Panel7)) and (Cliente.Parar = 1) then
        begin
          BorderIcons := [biSystemMenu, biMinimize, biMaximize];
          panel7.Visible := false;
          Panel1.Visible := true;
          Panel1.Enabled := true;
          GroupBox3.Visible := true;
          Cliente.abreClientes(-1);
          Screen.Cursor := crDefault;
          exit;
        end;
        if (not Cliente.CurvaABCSomaValoresVeiculos(ProgressBar1, Panel7)) and (Cliente.Parar = 1) then
        begin
          BorderIcons := [biSystemMenu, biMinimize, biMaximize];
          panel7.Visible := false;
          Panel1.Visible := true;
          Panel1.Enabled := true;
          GroupBox3.Visible := true;
          Cliente.abreClientes(-1);
          Screen.Cursor := crDefault;
          exit;
        end;
        if (not Cliente.CurvaABCUltimoVeiculo(ProgressBar1, Panel7)) and (Cliente.Parar = 1) then
        begin
          BorderIcons := [biSystemMenu, biMinimize, biMaximize];
          panel7.Visible := false;
          Panel1.Visible := true;
          Panel1.Enabled := true;
          GroupBox3.Visible := true;
          Cliente.abreClientes(-1);
          Screen.Cursor := crDefault;
          exit;
        end;
        if (not Cliente.CurvaABCLucroClienteVeiculo(ProgressBar1, Panel7)) and (Cliente.Parar = 1) then
        begin
          BorderIcons := [biSystemMenu, biMinimize, biMaximize];
          panel7.Visible := false;
          Panel1.Visible := true;
          Panel1.Enabled := true;
          GroupBox3.Visible := true;
          Cliente.abreClientes(-1);
          Screen.Cursor := crDefault;
          exit;
        end;
        if (not Cliente.CurvaABCFrequenciaCompraVeiculo(ProgressBar1, Panel7)) and (Cliente.Parar = 1) then
        begin
          BorderIcons := [biSystemMenu, biMinimize, biMaximize];
          panel7.Visible := false;
          Panel1.Visible := true;
          Panel1.Enabled := true;
          GroupBox3.Visible := true;
          Cliente.abreClientes(-1);
          Screen.Cursor := crDefault;
          exit;
        end;
      end;
      if Cliente.Parar = 0 then
      begin
        if not Cliente.atualizarDataDefinicaoClasse then
          Application.MessageBox('Curva ABC de clientes realizada com Erros!', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)
        else
          Application.MessageBox('Curva ABC de clientes realizada com Sucesso!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      end;
    end;
  end;
  BorderIcons := [biSystemMenu, biMinimize, biMaximize];
  GroupBox3.Visible := true;
  Panel1.Visible := true;
  Panel1.Enabled := true;
  Panel7.Visible := false;
  Screen.Cursor := crDefault;
end;

procedure TFrmCadClientes.BitBtnIncluirExtratoContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if not Cliente.vContaCorrenteCli.insert(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger, 0, 0) then
    exit;
  
  PageControl5.ActivePage := tsIncluirContaCorrente;
  tsIncluirContaCorrente.Show;
  lbValorValeLanc.Caption := '0';
end;

procedure TFrmCadClientes.BitBtn8Click(Sender: TObject);
begin
  inherited;
  Cliente.Parar := 1;
end;

procedure TFrmCadClientes.BitBtnExcluirExtratoContaCorrenteClick(Sender: TObject);
begin
  if not Cliente.vContaCorrenteCli.Delete(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
    exit;

  BitBtnAtualizarExtratoContaCorrenteClick(Sender);  
end;

procedure TFrmCadClientes.BitBtnEstornarResgatarValeClick(Sender: TObject);
begin
  inherited;
  if not Cliente.vContaCorrenteCli.estornarValeCompra then
   exit;

  RadioGroupValesClick(Sender);
end;

procedure TFrmCadClientes.BitBtnGerarValeTrocaClick(Sender: TObject);
begin
 if (Self.Enabled) and (Self.Visible) and (BitBtnGerarValeTroca.CanFocus) then
   BitBtnGerarValeTroca.SetFocus;
 if not Cliente.vContaCorrenteCli.gerarValeCompra(Cliente.dataSet.FieldByName('cod_cliente').AsInteger,
  Cliente.dataSet.FieldByName('cpfcgc').AsString, true, Label348, Cliente, true, Sender) then
    exit;

  RadioGroupValesClick(Sender);
end;

procedure TFrmCadClientes.BitBtnResgatarValeExtratoContaCorrenteClick(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtnResgatarValeExtratoContaCorrente.CanFocus) then
    BitBtnResgatarValeExtratoContaCorrente.SetFocus;

  if not Cliente.vContaCorrenteCli.visualizarValeCompra(
  	Cliente.dataSet.FieldByName('CPFCGC').AsString,
    RadioGroupVales.ItemIndex = 1) then
      Exit;

  BitBtnAtualizarExtratoContaCorrenteClick(Sender);
end;

procedure TFrmCadClientes.CadastroNormal1Click(Sender: TObject);
begin
  inherited;
  if CadastroNormal1.ImageIndex = 1 then
  begin
    CadastroNormal1.ImageIndex := 0;
    CadastroSimplificado1.ImageIndex := 1;
  end
  else
  begin
    CadastroNormal1.ImageIndex := 1;
    CadastroSimplificado1.ImageIndex := 0;
  end;
end;

procedure TFrmCadClientes.CadastroSimplificado1Click(Sender: TObject);
begin
  inherited;
  if CadastroSimplificado1.ImageIndex = 1 then
  begin
    CadastroSimplificado1.ImageIndex := 0;
    CadastroNormal1.ImageIndex := 1;
  end
  else
  begin
    CadastroSimplificado1.ImageIndex := 1;
    CadastroNormal1.ImageIndex := 0;
  end;
end;

procedure TFrmCadClientes.CheckBox1Click(Sender: TObject);
begin
	if (not CheckBox1.Checked) and (not CheckBox3.Checked) and (CheckBox7.Checked) then
  	GroupBox3.Height := 108
  else if (CheckBox1.Checked) or (CheckBox3.Checked) or (CheckBox7.Checked) then
    GroupBox3.Height := 201
  else
    GroupBox3.Height := 73;

  if CheckBox7.Checked then
  	GroupBox24.Top := GroupBox50.Top + GroupBox50.Height
  else
  	GroupBox24.Top := GroupBox50.Top;

  RadioGroup1.ItemIndex := -1;
  if CheckBox1.Checked then
  begin
    GroupBox13.visible := true;
    GroupBox24.visible := true;
    GroupBox25.visible := true;
    if ComboBox11.Items.Count = 0 then
    begin
      ComboBox11.Items := ComboBox1.Items;
      ComboBox11.ItemIndex := 0;
    end;
    if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    	ComboBox11.SetFocus;
  end
  else
  begin
    GroupBox13.visible := false;
    GroupBox24.visible := false;
    GroupBox25.visible := false;
    if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
      MaskEdit1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
      MaskEdit3.SetFocus;
  end;

  GroupBox24.Height := GroupBox12.Height - vDadosIni.IfThen(GroupBox50.Visible, GroupBox50.Height, 0);
end;

procedure TFrmCadClientes.CheckBox3Click(Sender: TObject);
begin
  if (not CheckBox1.Checked) and (not CheckBox3.Checked) and (CheckBox7.Checked) then
  	GroupBox3.Height := 108
  else if (CheckBox1.Checked) or (CheckBox3.Checked) or (CheckBox7.Checked) then
    GroupBox3.Height := 201
  else
    GroupBox3.Height := 73;

  if CheckBox7.Checked then
  	GroupBox24.Top := GroupBox50.Top + GroupBox50.Height
  else
  	GroupBox24.Top := GroupBox50.Top;

  if CheckBox3.Checked then
  begin
    GroupBox12.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (CheckBox2.CanFocus) then
      CheckBox2.SetFocus;
    if CheckBox2.Checked then
    begin
      ComboBox7.Text := '';
      ComboBox7.ItemIndex := -1;
      ComboBox7.enabled := False;
    end
    else
    begin
      ComboBox7.enabled := true;
    end;
  end
  else
  begin
    GroupBox12.Visible := false;
    if MaskEdit1.Visible then
    begin
      if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
        MaskEdit1.SetFocus
    end
    else
    begin
      if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
        MaskEdit3.SetFocus;
    end;
    //    CheckBox3.SetFocus;
  end;

  GroupBox24.Height := GroupBox12.Height - vDadosIni.IfThen(GroupBox50.Visible, GroupBox50.Height, 0);
end;

procedure TFrmCadClientes.CheckBox7Click(Sender: TObject);
var
 I: Integer;
begin
  if (not CheckBox1.Checked) and (not CheckBox3.Checked) and (CheckBox7.Checked) then
  	 GroupBox3.Height := 108
  else if (CheckBox1.Checked) or (CheckBox3.Checked) or (CheckBox7.Checked) then
    GroupBox3.Height := 201
  else
    GroupBox3.Height := 73;

  if CheckBox7.Checked then
  	 GroupBox24.Top := GroupBox50.Top + GroupBox50.Height
  else
  	 GroupBox24.Top := GroupBox50.Top;

  if CheckBox7.Checked then
  begin
    GroupBox50.visible := true;
    if (Self.Enabled) and (Self.Visible) and (ComboBox14.CanFocus) then
      ComboBox14.SetFocus;
  end
  else
   GroupBox50.visible := False;

  GroupBox24.Height := GroupBox12.Height - vDadosIni.IfThen(GroupBox50.Visible, GroupBox50.Height, 0);
end;

procedure TFrmCadClientes.CheckBox8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    btSelectTodos.Click
  else if Key = VK_F4 then
    btUnSelectTodos.Click;
end;

procedure TFrmCadClientes.CheckBoxEmailClick(Sender: TObject);
begin
  inherited;
  if CheckBoxEmail.Checked then
  begin
    EditPara.Visible := false;
    EditCC.Visible := false;
    EditCCO.Visible := false;
  end else begin
    EditPara.Visible := true;
    EditCC.Visible := true;
    EditCCO.Visible := true;
  end;
end;

procedure TFrmCadClientes.CheckBoxUtilizarPeriodoValidadeClick(Sender: TObject);
begin
  inherited;
	DBEditDataIniValidade.Enabled := CheckBoxUtilizarPeriodoValidade.Checked;
  DBEditDataFimValidade.Enabled := CheckBoxUtilizarPeriodoValidade.Checked;

	if not CheckBoxUtilizarPeriodoValidade.Checked then
  begin
  	if (Cliente.CupomDescontoCliente.dataSet.State in [dsInsert, dsEdit]) then
    begin
  		Cliente.CupomDescontoCliente.dataSet.FieldByName('DATA_INI_VL').Value := Null;
	    Cliente.CupomDescontoCliente.dataSet.FieldByName('DATA_FIM_VL').Value := Null;
      Cliente.CupomDescontoCliente.dataSet.FieldByName('UTIL_PER_VAL').AsString := 'N';
    end;
  end
  else
  begin
    if (Cliente.CupomDescontoCliente.dataSet.State in [dsInsert, dsEdit]) then
    	Cliente.CupomDescontoCliente.dataSet.FieldByName('UTIL_PER_VAL').AsString := 'S';
  end;

  if (Self.Enabled) and (Self.Visible) and (DBEditDataIniValidade.CanFocus) then
  	DBEditDataIniValidade.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEditDataFimValidade.CanFocus) then
  	DBEditDataFimValidade.SetFocus;
end;

procedure TFrmCadClientes.CheckCadSeq_Click(Sender: TObject);
begin
  if CheckCadSeq_.Checked then
  begin
    LabelSeq_.Font.Color := clRed;
    CheckCadSeq_.Font.Color := clRed;
  end
  else
  begin
    LabelSeq_.Font.Color := clTeal;
    CheckCadSeq_.Font.Color := clTeal;
  end;
end;

procedure TFrmCadClientes.CheckModeloCartaClick(Sender: TObject);
begin
  inherited;
  if CheckModeloCarta.Checked then
  begin
    ComboBoxModeloCarta.Enabled := true;
    if ComboBoxModeloCarta.ItemIndex = -1 then
      ComboBoxModeloCarta.ItemIndex := 0;
    if (Self.Enabled) and (Self.Visible) and (ComboBoxModeloCarta.CanFocus) then    
      ComboBoxModeloCarta.SetFocus;
  end
  else
  begin
    ComboBoxModeloCarta.Enabled := false;
    ComboBoxModeloCarta.ItemIndex := -1;
    ComboBoxModeloCartaExit(sender);
  end;
end;

procedure TFrmCadClientes.ckLixeiraClick(Sender: TObject);
begin
  inherited;
  if not ckLixeira.Enabled then
  	exit;

  if Self.Tag = 789 then
  begin
  	if ckLixeira.Checked then
      FrmCadClientes.Caption := 'Aniversariantes do dia (Lixeira)'
    else
      FrmCadClientes.Caption := 'Aniversariantes do dia';
  end
  else
  begin
    if ckLixeira.Checked then
      FrmCadClientes.Caption := 'Manutenção de Clientes e Fornecedores (Lixeira)'
    else
      FrmCadClientes.Caption := 'Manutenção de Clientes e Fornecedores';
  end;
  BitBtn1Click(Sender);
end;

procedure TFrmCadClientes.ckMenuLateralClick(Sender: TObject);
begin
  if (not MenuLateralExibirObservacaoCl.Checked)
  	and (not MenuLateralExibirObservacaoSpcCl.Checked)
    and (not MenuLateralExibirObservacaoReqOSCl.Checked) then
    	MenuLateralExibirObservacaoCl.Checked := True;

  try
    if (PageControl1.ActivePage <> TabSheet2) then
    begin
      pnObservacaoCl.Visible := false;
      pnObservacaoSpcCl.Visible := false;
      pnObservacaoReqOsCl.Visible := false;
      pnOpcaoDireitaClientes.Visible := false;

      exit;
    end;

    vHabObservacaoCl := MenuLateralExibirObservacaoCl.Checked;
    vHabObservacaoSpcCl := MenuLateralExibirObservacaoSpcCl.Checked;
    vHabObservacaoReqOsCl := MenuLateralExibirObservacaoReqOSCl.Checked;

    pnObservacaoCl.Visible := vHabObservacaoCl;

    SplitterObservacaoBottomCl.Visible := (vHabObservacaoCl) and ((vHabObservacaoSpcCl) or (vHabObservacaoReqOsCl));

    pnObservacaoSpcCl.Visible := vHabObservacaoSpcCl;

    SplitterObservacaoSpcBottomCl.Visible := (vHabObservacaoSpcCl) and (vHabObservacaoReqOsCl);

    pnObservacaoReqOsCl.Visible := vHabObservacaoReqOsCl;

    pnOpcaoDireitaClientes.Visible := ckMenuLateral.Checked;

    if ckMenuLateral.Tag = 99 then
    	AjustarBarraLateral(True)
    else
			AjustarBarraLateral(False);
  finally
    if (PageControl1.ActivePage = TabSheet2) then
    begin
      if pnOpcaoDireitaClientes.Width < 180 then
        pnOpcaoDireitaClientes.Width := 180;

      if pnObservacaoCl.Height < 60 then
        pnObservacaoCl.Height := 60;

      if pnObservacaoSpcCl.Height < 60 then
        pnObservacaoSpcCl.Height := 60;

      if pnObservacaoReqOsCl.Height < 60 then
        pnObservacaoReqOsCl.Height := 60;

      _GravaConfiguracoesBoolean(ckMenuLateral.Name + 'Cl', ckMenuLateral.Checked);
    end;
  end;
end;

procedure TFrmCadClientes.cliente_enddoc_scroll_rotas;
var
  I: Integer;
begin
  {$REGION 'rotas'}
  while btgoup_rotaent_add.Items.Count > 1 do
    btgoup_rotaent_add.Items.Delete(btgoup_rotaent_add.Items.Count - 1);

  if not Assigned(Cliente.EndDocAd.rotas) then
    btgoup_rotaent_add.Visible := False
  else
  begin
    btgoup_rotaent_add.Visible := True;

    for I := 0 to Cliente.EndDocAd.rotas.Count - 1 do with Cliente.EndDocAd.rotas.Items[I] do
      with btgoup_rotaent_add.Items.Add do
      begin
        Caption := rota;
        Hint    := Format('%s - Rota %s - %s', [vDadosIni.StrZero(cod_rota, 3), rota, descricao]);
      end;
  end;
  {$ENDREGION}

  {$REGION 'tributacao adicional'}
  while btgoup_trib_pref_add.Items.Count > 0 do
    btgoup_trib_pref_add.Items.Delete(btgoup_trib_pref_add.Items.Count - 1);

  if not Assigned(Cliente.EndDocAd.tribAd) then
    btgoup_trib_pref_add.Visible := False
  else
  begin
    btgoup_trib_pref_add.Visible := True;

    for I := 0 to Cliente.EndDocAd.tribAd.Count - 1 do with Cliente.EndDocAd.tribAd.Items[I] do
      with btgoup_trib_pref_add.Items.Add do
      begin
        Caption := Format('[ID:%d][%s-%d][%s]', [cod_trib_pf, cst_icms, Trunc(codigo_nop), descricao_pf]);
        Hint    := Format('[CST:%s][CFOP:%d][%%ICMS Intra:%f][%%ICMS Inter:%f][%%Redução:%f][MVA:%f]',
                          [cst_icms, Trunc(codigo_nop), aliq_intra, aliq_inter, perc_red_prod, mva]);
      end;
  end;
  {$ENDREGION}
end;

procedure TFrmCadClientes.ComboBox11Exit(Sender: TObject);
var
  i: integer;
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
    for I := 0 to Cliente.dataSet.Fields.Count - 1 do
    begin
      if Cliente.dataSet.Fields.Fields[i].DisplayLabel = ComboBox11.Text then
      begin
        if Cliente.dataSet.Fields.Fields[i] is TDateTimeField then
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

procedure TFrmCadClientes.ComboBox12Exit(Sender: TObject);
begin
  inherited;
  TComboBox(Sender).Text := TComboBox(Sender).Items[TComboBox(Sender).ItemIndex];

  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TFrmCadClientes.ComboBox14Exit(Sender: TObject);
begin
  inherited;
  ComboBox14.Text := ComboBox14.Items[ComboBox14.ItemIndex];
  if ComboBox14.Text = '' then
  begin
    if (Self.Enabled) and (Self.Visible) and (ComboBox14.CanFocus) then
      ComboBox14.SetFocus;
    exit;
  end;
  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
   BitBtn1.SetFocus;
end;

procedure TFrmCadClientes.ComboBox15Click(Sender: TObject);
begin
	try
  	if vComboBox15ItemIndex <> ComboBox15.ItemIndex then
    	Cliente.vContaCorrenteCli.vPagGrid := 0;
      
    Cliente.vContaCorrenteCli.vQtdeGrid := StrToInt(ComboBox15.Items[ComboBox15.ItemIndex]);
    BitBtnAtualizarExtratoContaCorrenteClick(Sender);
  finally
	  vComboBox15ItemIndex := ComboBox15.ItemIndex;
    _GravaConfiguracoesInteger(ComboBox15.Name, ComboBox15.ItemIndex);
  end;
end;

procedure TFrmCadClientes.ComboBoxModeloCartaExit(Sender: TObject);
begin
  inherited;
  if CheckModeloCarta.Checked then
  begin
    if ComboBoxModeloCarta.Text <> '' then
    begin
      if vDadosIni.isnumeroint(trim(copy(ComboBoxModeloCarta.Text, 1, pos('|', ComboBoxModeloCarta.Text) - 1))) then
      begin
        tsMsgModeloCarta.Show;
        Cliente._carregarCartaParaRichEdit(RichEditMsg3,
          strtoint(trim(copy(ComboBoxModeloCarta.Text, 1, pos('|', ComboBoxModeloCarta.Text) - 1))));
      end
      else begin
        tsMsgModeloCarta.Show;
        RichEditMsg3.Lines.Clear;
        Application.MessageBox('Modelo informado não foi encontrado.', 'Informação', MB_OK);
      end;
    end;
  end else RichEditMsg3.Lines.Clear;
end;

procedure TFrmCadClientes.MenuItem1Click(Sender: TObject);
begin
  inherited;
  vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas2, DBGrid18, GridCfg2, cdsGrid2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TFrmCadClientes.ConfiguraVizualPorTipo;
begin
	if vNomeFantasia then
	  DBEdit8.Enabled := true;
  Label16.Enabled := true;
  tsAtributos.TabVisible := false;


    if Cliente.dataSet.State = dsEdit then
     if ((Cliente.dataSet.FieldByName('TIPO').AsString = 'F') or (Cliente.dataSet.FieldByName('TIPO').AsString = 'A')) then
      if Cliente._abreAtributos(Cliente.dataSet.FieldByName('cod_cliente').AsInteger) then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
        if vDadosIni.PesqPros('CLI188', 'HABILITAR', '', 'CLIENTES', '', Cliente.buscas, False) then
          tsAtributos.TabVisible := true;
      end;

  if Cliente.dataSet.FieldByName('TIPO').AsString = 'C' then
  begin
    //G11(G18,G19) - G33 - G34(G35,G21,G22,G23)Ambos
    //G11(G18,G19) - G33 - G34(G35,G21,G23)Clientes
    //G11(G18) - G33 -   G34(G35,G21,G22)Fornecedor
    if (Cliente.dataSet.FieldByName('CPFCGC').EditMask = '999.999.999-99;0;') then
    begin
      DBEdit8.Enabled := false;
      Label16.Enabled := false;
      GroupBox22.Visible := false;
      GroupBox19.Visible := true;
      GroupBox11.Height := 168;
      GroupBox23.Visible := true;
      GroupBox34.Height := 258 - GroupBox22.Height;
     // GroupBox34.Height := 205 - GroupBox22.Height;
    end
    else
    begin
      GroupBox22.Visible := true;
      GroupBox19.Visible := false;
      GroupBox11.Height := 168 - GroupBox19.Height;
      GroupBox23.Visible := false;
      GroupBox34.Height := 258 - GroupBox23.Height;
      //GroupBox34.Height := 205 - GroupBox23.Height;
      //      GroupBox34.Height := 197 - GroupBox22.Height - GroupBox23.Height;
    end;
    GroupBox36.Visible := false;
    if vDadosIni.vRegistro.vSisAutomacao then
    begin
      TabSheet4.TabVisible := true;
      TabSheet5.TabVisible := true;
    end;
    TabSheet3.Caption := 'Dados Pessoais';
  end
  else if Cliente.dataSet.FieldByName('TIPO').AsString = 'F' then
  begin
    GroupBox23.Visible := false;
    GroupBox19.Visible := false;
    GroupBox22.Visible := true;
    GroupBox11.Height := 168 - GroupBox19.Height;
    GroupBox34.Height := 258 - GroupBox23.Height;
    //GroupBox34.Height := 205 - GroupBox23.Height;
    GroupBox36.Visible := true;
    TabSheet4.TabVisible := false;
    TabSheet5.TabVisible := true;
    TabSheet3.Caption := 'Dados do Fornecedor';
  end
  else
  begin
    if (Cliente.dataSet.FieldByName('CPFCGC').EditMask = '999.999.999-99;0;') then
    begin
      GroupBox19.Visible := true;
      GroupBox11.Height := 168;
      GroupBox23.Visible := true;
      GroupBox22.Visible := false;
      GroupBox34.Height := 258 - GroupBox22.Height;
//      GroupBox34.Height := 205 - GroupBox22.Height;
    end
    else
    begin
      GroupBox19.Visible := false;
      GroupBox11.Height := 168 - GroupBox19.Height;
      GroupBox22.Visible := true;
      GroupBox23.Visible := false;
      GroupBox34.Height := 258 - GroupBox23.Height;
//      GroupBox34.Height := 205 - GroupBox23.Height;
    end;
    GroupBox36.Visible := false;
    GroupBox23.Align := alTop;
    if vDadosIni.vRegistro.vSisAutomacao then
    begin
      TabSheet4.TabVisible := true;
      TabSheet5.TabVisible := true;
    end;
    TabSheet3.Caption := 'Dados do Cliente/Fornecedor';
  end;
end;

procedure TFrmCadClientes.contato_tipo_add(Sender: TObject);
var
  Tipo: string;
begin
  if not Cliente.Contato.Auditor.Processo('CLI257').Inserir.Permitido then
    Exit;
  //form_modal_configure([bt_modal_assume, bt_mo);
  if not InputQuery('Novo tipo de contato', 'Informe o tipo de contato', Tipo) then
    Exit;

  Tipo := Trim(UpperCase(Tipo));

  Cliente.Contato.Tipo.Insert;
  Cliente.Contato.Tipo.fdata('tipo').Put(Tipo);
  if (Cliente.Contato.Tipo.Post) then
  begin
    lk_tipo_contato.setDadosDataSet('ID', 'TIPO', Cliente.Contato.Tipo.dataSet, ed_contato_tipo);

    if (Cliente.Contato.AcceptChanges) then
      if Cliente.Contato.Tipo.dataSet.Locate('TIPO', Tipo, []) then
        Cliente.Contato.fdata('tipo_id').Put(Cliente.Contato.Tipo.fint('id'));
  end;
end;

procedure TFrmCadClientes.contato_tipo_del(Sender: TObject);
begin
  bt_modal_assume.Caption := 'Excluir';
  form_modal_configure([bt_modal_assume, bt_modal_voltar]);
  grid_modal.DataSource := Cliente.Contato.Tipo._dataSourceOOP;

  Cliente.Contato.Tipo.First;
  if not vDadosIni.abreForm('Excluir tipo de contato', pn_modal, opFormsDefCad) then
    Exit;

  with Cliente.Contato.Tipo do
    if not Auditor.Processo('CLI259', fstr('tipo'), fstr('id')).Excluir.Permitido then
      Exit;

  if (Cliente.Contato.Tipo.Delete) then
  begin
    lk_tipo_contato.setDadosDataSet('ID', 'TIPO', Cliente.Contato.Tipo.dataSet, ed_contato_tipo);
    Cliente.Contato.fdata('tipo_id').Put(Cliente.Contato.Tipo.fint('id'));
  end;
end;

procedure TFrmCadClientes.contato_tipo_edit(Sender: TObject);
var
  Tipo: string;
begin
  bt_modal_assume.Caption := 'Selecionar';
  form_modal_configure([bt_modal_assume, bt_modal_voltar]);
  grid_modal.DataSource := Cliente.Contato.Tipo._dataSourceOOP;

  Cliente.Contato.Tipo.First;
  if not vDadosIni.abreForm('Alteração de tipo de contato', pn_modal, opFormsDefCad) then
    Exit;

  Tipo := Cliente.Contato.Tipo.fstr('tipo');
  
  with Cliente.Contato.Tipo do
    if not Auditor.Processo('CLI258', fstr('tipo'), fstr('id')).Alterar.Permitido then
      Exit;

  if not InputQuery('Alteração do tipo de contato', 'Informe o tipo de contato', Tipo) then
    Exit;

  if not Cliente.Contato.Tipo.Edit then
    Exit;

  Tipo := Trim(UpperCase(Tipo));

  Cliente.Contato.Tipo.fdata('tipo').Put(Tipo);

  if (Cliente.Contato.Tipo.Post) then
  begin
  	lk_tipo_contato.setDadosDataSet('ID', 'TIPO', Cliente.Contato.Tipo.dataSet, ed_contato_tipo);
    if (Cliente.Contato.AcceptChanges) then
      if Cliente.Contato.Tipo.dataSet.Locate('TIPO', Tipo, []) then
        Cliente.Contato.fdata('tipo_id').Put(Cliente.Contato.Tipo.fint('id'));
    Cliente.ContatoMsg.EditarTipoContato(ck_contrato_pla_tipos_contato);
  end;
end;

procedure TFrmCadClientes.contato_tipo_pla_add(Sender: TObject);
var
  Tipo: string;
begin
  if not Cliente.ContatoMsg.Auditor.Processo('CLI257').Inserir.Permitido then
    Exit;
  //form_modal_configure([bt_modal_assume, bt_mo);
  if not InputQuery('Novo tipo de contato', 'Informe o tipo de contato', Tipo) then
    Exit;

  Tipo := Trim(UpperCase(Tipo));

  Cliente.ContatoMsg.Tipo.Insert;
  Cliente.ContatoMsg.Tipo.fdata('tipo').Put(Tipo);
  if (Cliente.ContatoMsg.Tipo.Post) then
    Cliente.ContatoMsg.EditarTipoContato(ck_contrato_pla_tipos_contato);
end;

procedure TFrmCadClientes.contato_tipo_pla_del(Sender: TObject);
begin
  bt_modal_assume.Caption := 'Excluir';
  form_modal_configure([bt_modal_assume, bt_modal_voltar]);
  grid_modal.DataSource := Cliente.ContatoMsg.Tipo._dataSourceOOP;

  Cliente.ContatoMsg.Tipo.First;
  if not vDadosIni.abreForm('Excluir tipo de contato', pn_modal, opFormsDefCad) then
    Exit;

  with Cliente.ContatoMsg.Tipo do
    if not Auditor.Processo('CLI259', fstr('tipo'), fstr('id')).Excluir.Permitido then
      Exit;

  if (Cliente.ContatoMsg.Tipo.Delete) then
    Cliente.ContatoMsg.EditarTipoContato(ck_contrato_pla_tipos_contato);
end;

procedure TFrmCadClientes.contato_tipo_pla_edit(Sender: TObject);
var
  Tipo: string;
begin
  bt_modal_assume.Caption := 'Selecionar';
  form_modal_configure([bt_modal_assume, bt_modal_voltar]);
  grid_modal.DataSource := Cliente.ContatoMsg.Tipo._dataSourceOOP;

  Cliente.ContatoMsg.Tipo.First;
  if not vDadosIni.abreForm('Alteração de tipo de contato', pn_modal, opFormsDefCad) then
    Exit;

  Tipo := Cliente.ContatoMsg.Tipo.fstr('tipo');
  
  with Cliente.ContatoMsg.Tipo do
    if not Auditor.Processo('CLI258', fstr('tipo'), fstr('id')).Alterar.Permitido then
      Exit;

  if not InputQuery('Alteração do tipo de contato', 'Informe o tipo de contato', Tipo) then
    Exit;

  if not Cliente.ContatoMsg.Tipo.Edit then
    Exit;

  Tipo := Trim(UpperCase(Tipo));

  Cliente.ContatoMsg.Tipo.fdata('tipo').Put(Tipo);

  if (Cliente.ContatoMsg.Tipo.Post) then
  	Cliente.ContatoMsg.EditarTipoContato(ck_contrato_pla_tipos_contato);
end;

procedure TFrmCadClientes.MenuItem5Click(Sender: TObject);
begin
  inherited;
  Clipboard.AsText := DBGrid18.DataSource.DataSet.FieldByName(DBGrid18.Columns[DBGrid18.SelectedIndex].FieldName).AsString;
end;

procedure TFrmCadClientes.DadosComplementares1Click(Sender: TObject);
begin
  inherited;
  if CadastroSimplificado1.ImageIndex = 1 then
  begin
    if DadosComplementares1.ImageIndex = 1 then
      DadosComplementares1.ImageIndex := 0
    else
      DadosComplementares1.ImageIndex := 1;
  end;
end;

procedure TFrmCadClientes.DBComboBox14Exit(Sender: TObject);
begin
  inherited;
  DBEdit106.Enabled := trim(Cliente.dataSet.FieldByName('REC_MAIL_MARK').AsString) = 'S';
  if (Self.Enabled) and (Self.Visible) and (DBEdit106.CanFocus) then
    DBEdit106.SetFocus;
end;

procedure TFrmCadClientes.DBComboBox15Exit(Sender: TObject);
begin
  inherited;
  DBEdit107.Enabled := trim(Cliente.AdCliente.dataSet.FieldByName('REC_MAIL_MARK').AsString) = 'S';
end;

procedure TFrmCadClientes.DBComboBoxDescontoEmCupomECExit(Sender: TObject);
begin
  inherited;
	if DBComboBoxDescontoEmCupomEC.ItemIndex = 1 then
  	lbDescTipoDesc.Caption := 'Desconto (R$):'
  else
  	lbDescTipoDesc.Caption := 'Desconto (%):';
end;

procedure TFrmCadClientes.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
  if Trim(Cliente.dataSet.FieldByName('CONVENIADO').AsString) <> '' then
  if not ((pos(Cliente.dataSet.FieldByName('CONVENIADO').AsString, 'S') = 1) or
    (pos(Cliente.dataSet.FieldByName('CONVENIADO').AsString, 'N') = 1)) then
  begin
    Application.MessageBox('Selecione ''Sim'' ou ''Não''', 'Aviso', MB_OK + MB_ICONWARNING +
      MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
    	DBComboBox1.SetFocus;
  end;
end;

procedure TFrmCadClientes.DBComboBox3Exit(Sender: TObject);
begin
  inherited;
  if trim(Cliente.dataSet.FieldByName('CATEGORIA').AsString) <> '' then
  begin
    if not ((pos('CCJ', trim(Cliente.dataSet.FieldByName('CATEGORIA').AsString)) = 1) or
      (pos('CCF', trim(Cliente.dataSet.FieldByName('CATEGORIA').AsString)) = 1) or
      (pos('CNJ', trim(Cliente.dataSet.FieldByName('CATEGORIA').AsString)) = 1) or
      (pos('CNF', trim(Cliente.dataSet.FieldByName('CATEGORIA').AsString)) = 1)) then
    begin
      Application.MessageBox('Selecione ''CCJ'', ''CCF'', ''CNJ'' ou ''CNF''', 'Aviso', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then      
      	DBComboBox3.SetFocus;
      exit;
    end;
  end
  else
    Cliente.dataSet.FieldByName('CATEGORIA').AsVariant := null;
  //  if Cliente.dataSet.FieldByName('TIPO').AsString <> 'F' then
  //  begin
  //    PageControl3.ActivePage := TabSheet4;
  //    if Cliente.dataSet.FieldByName('CPFCGC').EditMask = '999.999.999-99;0;' then
  //    begin
  //      if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
  //        DBEdit4.SetFocus
  //    end
  //    else if (Self.Enabled) and (Self.Visible) and (Dbcombobox1.CanFocus) then
  //      dbcombobox1.SetFocus;
  //  end;
end;

procedure TFrmCadClientes.DBComboBox4Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if (Cliente.dataSet.FieldByName('SEXO').AsString = '') and
      (Cliente.dataSet.FieldByName('CPFCGC').EditMask = '999.999.999-99;0;') then
    begin
      Application.MessageBox('Sexo do Cliente não informado.' + chr(13) + 'Campo Requerido.',
        'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox4.CanFocus) then      
      	DBComboBox4.SetFocus;
    end
end;

procedure TFrmCadClientes.DBComboBox6Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if not Cliente.ChecaTipVendaCliExiste then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBComboBox6.CanFocus) then      
      	DBComboBox6.SetFocus;
      exit;
    end;
end;

procedure TFrmCadClientes.DBComboBox8Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
  begin
    if Cliente.dataSet.FieldByName('TIPO').AsString = '' then
    begin
    	Application.MessageBox('Tipo não informado.' + chr(13) + 'Campo Requerido.', 'Informação',
    	  MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    	if (Self.Enabled) and (Self.Visible) and (DBComboBox8.CanFocus) then      
      	DBComboBox8.SetFocus;
      exit;
    end;
    ConfiguraVizualPorTipo;
    FormResize(Sender);
    Cliente.vCondPag.selecionaCondPag(Cliente.dataSet.FieldByName('tipo').AsString);

    Edit2.Text := Cliente.UsuarioQCadastrou;
    Edit3.Text := Edit2.Text;
  end;
end;

procedure TFrmCadClientes.DBComboBox8KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  TDBComboBox(sender).SelectAll;
  if (UpperCase(key) <> 'C') and (UpperCase(key) <> 'F') and (UpperCase(key) <> 'A') then
    key := #0;
end;

procedure TFrmCadClientes.DBComboBox9Exit(Sender: TObject);
begin
  inherited;
  //  if (not vDadosIni.vRegistro.vSisAutomacao) and (vDadosIni.vRegistro.vSisSupervisor) then
  if Cliente.dataSet.FieldByName('TIPO').AsString <> 'F' then
  begin
    if (Cliente.dataSet.FieldByName('CPFCGC').EditMask <> '999.999.999-99;0;')
      and (vDadosIni.vRegistro.vSisAutomacao) then
    begin
      PageControl3.ActivePage := TabSheet4;
      if (Self.Enabled) and (Self.Visible) and (DBEdit59.CanFocus) then
      	DBEdit59.SetFocus;
    end;
  end
  else
  begin
    PageControl3.ActivePage := TabSheet5;
    if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then    
    	DBEdit18.SetFocus;
  end;
end;

procedure TFrmCadClientes.DBEdit100KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if Key = VK_F3 then
   begin
     vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PROMOCAO', ' and ((data_ini is null) or (data_fim is null)) and cod_promocao > 0 ', 'Tabela de Preço');
     if trim(vDadosIni.vPesquisa) <> '' then
       DBEdit100.Field.AsString := vDadosIni.vPesquisa;
   end;
end;

procedure TFrmCadClientes.DBEdit10Exit(Sender: TObject);
begin
  inherited;
  if trim(TDBedit(Sender).text) = '' then
  begin
    if vDadosIni.PesqPros('CLI010', 'PESQUISAR', '', 'BAIRROS', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Cliente.abreBairros;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('BAIRROS');
        if vDadosIni.vPesquisa <> '' then
          Cliente.dataSet.FieldByName('COD_BAIRRO').asinteger := strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then        
        	DBLookupComboBox7.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then  
  	DBLookupComboBox7.SetFocus;
end;

procedure TFrmCadClientes.DBEdit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vBairro: TBairros;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI010', 'PESQUISAR', '', 'BAIRROS', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Cliente.abreBairros;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('BAIRROS');
        if vDadosIni.vPesquisa <> '' then
        begin
          Cliente.dataSet.FieldByName('COD_BAIRRO').asinteger := strtoint(vDadosIni.vPesquisa);
          if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then          
          	DBLookupComboBox7.SetFocus;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('CLI011', 'CADASTRAR', '', 'BAIRROS', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vBairro.CadBairro(1);
        Cliente.abreBairros;
        if vDadosIni.vPesquisa <> '' then
        begin
          Cliente.dataSet.FieldByName('COD_BAIRRO').asinteger := strtoint(vDadosIni.vPesquisa);
          if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then          
          	DBLookupComboBox7.SetFocus;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;

end;

procedure TFrmCadClientes.DBEdit119KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vCidades: TCidades;
begin
  inherited;
  if Key = VK_F4 then
  begin
    if not vDadosIni.PesqPros('CLI013', 'CADASTRAR', '', 'CIDADES', '', Cliente.buscas, true) then
      Exit;

    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := 'CADCIDADE|0|' + TDBEdit(Sender).Text + '|';
      vCidades.CadCidade(1);
      if (Pos('CADCIDADE|', vDadosIni.vPesquisa) > 0) and (Pos('CADCIDADE|0|', vDadosIni.vPesquisa) = 0) then
      begin
        if TDBEdit(Sender).Name = 'DBEdit153' then
        begin
          if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox35.CanFocus) then
            DBLookupComboBox35.SetFocus;
        end
        else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox29.CanFocus) then
          DBLookupComboBox29.SetFocus;
        Cliente.vLKCidade.dataSet.Refresh;
        if Cliente.vLKCidCob.dataSet <> nil then
          Cliente.vLKCidCob.dataSet.Refresh;

        if TDBEdit(Sender).Name = 'DBEdit153' then
        begin
          Cliente.dataSet.FieldByName('COD_CIDADE_COBRANCA').AsInteger := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,2));
          Cliente.dataSet.FieldByName('CIDA_COBRANCA').AsString := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
          Cliente.SqlOpen('select es.codigo_uf, es.sigla_uf from cidades c' +
            ' inner join cidades_ibge ci on ci.codigo_mun_ibge = c.ibge_cod_cidade' +
            ' inner join estados es on es.ibge_codigo_uf = ci.codigo_uf_ibge' +
            ' where c.ativo = 1 and c.cod_cidade = ' + IntToStr(Cliente.dataSet.FieldByName('COD_CIDADE_COBRANCA').AsInteger), Cliente.buscas);

          if Cliente.buscas.FieldByName('CODIGO_UF').AsInteger > 0 then
          begin
            Cliente.dataSet.FieldByName('EST_CODIGO_UF').AsInteger := Cliente.buscas.FieldByName('CODIGO_UF').AsInteger;
            Cliente.dataSet.FieldByName('ESTADOS_UF_COBRANCA').AsString := Cliente.buscas.FieldByName('SIGLA_UF').AsString;
          end;
        end
        else
        begin
          Cliente.dataSet.FieldByName('COD_CIDADE').AsInteger := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,2));
          Cliente.dataSet.FieldByName('CIDADE').AsString := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
          Cliente.SqlOpen('select es.codigo_uf, es.sigla_uf from cidades c' +
            ' inner join cidades_ibge ci on ci.codigo_mun_ibge = c.ibge_cod_cidade' +
            ' inner join estados es on es.ibge_codigo_uf = ci.codigo_uf_ibge' +
            ' where c.ativo = 1 and c.cod_cidade = ' + IntToStr(Cliente.dataSet.FieldByName('COD_CIDADE').AsInteger), Cliente.buscas);

          if Cliente.buscas.FieldByName('CODIGO_UF').AsInteger > 0 then
          begin
            Cliente.dataSet.FieldByName('CODIGO_UF').AsInteger := Cliente.buscas.FieldByName('CODIGO_UF').AsInteger;
            Cliente.dataSet.FieldByName('ESTADOS_UF').AsString := Cliente.buscas.FieldByName('SIGLA_UF').AsString;
          end;
        end;
      end;
    finally
      vDadosIni.vPesquisa := '';
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadClientes.DBEdit111Exit(Sender: TObject);
begin
  inherited;
  if Trim(Cliente.dataSet.FieldByName('RAZAO').AsString) = '' then
    Cliente.dataSet.FieldByName('RAZAO').AsString := Cliente.dataSet.FieldByName('NOME_CLIENTE').AsString;
end;

procedure TFrmCadClientes.DBEdit112Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = BitBtn_4) or (activecontrol = BitBtn_5) or (activecontrol = BitBtn_6) or (clicouNoX) then
    Exit;
  Cliente.verificarCpfCnpjJaExite;
  Cliente._importarClienteOutraEmpresa;
end;

procedure TFrmCadClientes.DBEdit114Exit(Sender: TObject);
var
  CEPs: TCEP;
  vExisteCEP: Boolean;
begin
  inherited;
  if (activecontrol = BitBtn5) or (activecontrol = BitBtn6) or (clicouNoX) then
    Exit;
  if vDadosIni.strIn(vDadosIni.apenasNumeros(cliente.dataSet.FieldByName('CEP').AsString), ['', '00000000']) then
    Exit;

  CEPS := TCEP.create;
  if not CEPs.getEndereco(cliente.dataSet.FieldByName('CEP').AsString) then
    CEPs._ConsultarWebService(cliente.dataSet.FieldByName('CEP').AsString)
  else
    vExisteCEP := True;

  if not vExisteCEP then
    vExisteCEP := CEPs.getEndereco(cliente.dataSet.FieldByName('CEP').AsString);

  if vExisteCEP then
  begin
    if (Trim(cliente.dataSet.FieldByName('BAIRRO').asstring) = '') or
      (Trim(cliente.dataSet.FieldByName('CIDADE').asstring) = '') or
      (cliente.dataSet.FieldByName('CODIGO_UF').AsInteger = 0) or
      (Trim(cliente.dataSet.FieldByName('ENDERECO').asstring) = '') then
    begin
    	cliente.dataSet.FieldByName('ENDERECO').asstring := ceps.logradouro;
      cliente.dataSet.FieldByName('COD_BAIRRO').AsInteger := ceps.codigo_bairro;
      cliente.dataSet.FieldByName('BAIRRO').asstring := ceps.nome_bairro;
      cliente.dataSet.FieldByName('COD_CIDADE').AsInteger := ceps.codigo_cidade;
      cliente.dataSet.FieldByName('CIDADE').asstring := ceps.nome_cidade;
      cliente.dataSet.FieldByName('CODIGO_UF').AsInteger := ceps.codigo_uf;

      if cliente.dataSet.FieldByName('CODIGO_UF').AsInteger > 0 then
      begin
        Cliente.SqlOpen('select es.codigo_uf, es.sigla_uf from estados es ' +
          ' where es.codigo_uf = ' + IntToStr(cliente.dataSet.FieldByName('CODIGO_UF').AsInteger), Cliente.buscas);
        if Cliente.buscas.FieldByName('CODIGO_UF').AsInteger > 0 then
          Cliente.dataSet.FieldByName('ESTADOS_UF').AsString := Cliente.buscas.FieldByName('SIGLA_UF').AsString;
      end;
    end;
  end;
end;

procedure TFrmCadClientes.DBEdit118KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vBairro: TBairros;
begin
  inherited;
  if Key = VK_F4 then
  begin
    if not vDadosIni.PesqPros('CLI011', 'CADASTRAR', '', 'BAIRROS', '', Cliente.buscas, true) then
      Exit;

    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := 'CADBAIRRO|0|' + TDBEdit(Sender).Text + '|';
      vBairro.CadBairro(1);
      if (Pos('CADBAIRRO|', vDadosIni.vPesquisa) > 0) and (Pos('CADBAIRRO|0|', vDadosIni.vPesquisa) = 0) then
      begin
        if TDBEdit(Sender).Name = 'DBEdit152' then
        begin
          if (Self.Enabled) and (Self.Visible) and (DBEdit153.CanFocus) then
            DBEdit153.SetFocus;
        end
        else if (Self.Enabled) and (Self.Visible) and (DBEdit119.CanFocus) then
          DBEdit119.SetFocus;
        Cliente.vLKBairro.dataSet.Refresh;
        if Cliente.vLKBaiCob.dataSet <> nil then
          Cliente.vLKBaiCob.dataSet.Refresh;

        if TDBEdit(Sender).Name = 'DBEdit152' then
        begin
          Cliente.dataSet.FieldByName('COD_BAIRRO_COBRANCA').AsInteger := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,2));
          Cliente.dataSet.FieldByName('BAIRRO_COBRANCA').AsString := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
        end
        else
        begin
          Cliente.dataSet.FieldByName('COD_BAIRRO').AsInteger := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,2));
          Cliente.dataSet.FieldByName('BAIRRO').AsString := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
        end;
      end;
    finally
      vDadosIni.vPesquisa := '';
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadClientes.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  if trim(TDBedit(Sender).text) = '' then
  begin
    if vDadosIni.PesqPros('CLI012', 'PESQUISAR', '', 'CIDADES', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Cliente.abreCidades;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
        if vDadosIni.vPesquisa <> '' then
          Cliente.dataSet.FieldByName('COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
        	DBLookupComboBox6.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then  
  	DBLookupComboBox6.SetFocus;
end;

procedure TFrmCadClientes.DBEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCidade: TCidades;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI012', 'PESQUISAR', '', 'CIDADES', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Cliente.abreCidades;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
        if vDadosIni.vPesquisa <> '' then
        begin
          Cliente.dataSet.FieldByName('COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);
          if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
          	DBLookupComboBox6.SetFocus;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('CLI013', 'CADASTRAR', '', 'CIDADES', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vCidade.CadCidade(1);
        Cliente.abreCidades;
        if vDadosIni.vPesquisa <> '' then
        begin
          Cliente.dataSet.FieldByName('COD_CIDADE').asinteger := strtoint(vDadosIni.vPesquisa);
          if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
          	DBLookupComboBox6.SetFocus;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadClientes.DBEdit12Exit(Sender: TObject);
var
  CEPs: TCEP;
  ListaCep: TStringList;
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if cliente.dataSet.FieldByName('CEP').IsNull then
    begin

      //Application.MessageBox('CEP não informado' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK +
        //MB_ICONWARNING + MB_DEFBUTTON1);
      cliente.dataSet.FieldByName('CEP').AsString := '00000000';
    end
    else
    begin
      if cliente.dataSet.FieldByName('CEP').AsString <> '00000000' then
      begin

        if (cliente.dataSet.FieldByName('COD_BAIRRO').IsNull
          or cliente.dataSet.FieldByName('COD_CIDADE').IsNull
          or cliente.dataSet.FieldByName('CODIGO_UF').IsNull
          or cliente.dataSet.FieldByName('ENDERECO').IsNull) then
        begin

          ListaCep :=
            CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(cliente.dataSet.FieldByName('CEP').AsString);

          if ListaCep[0] <> '' then
          begin
            if cliente.dataSet.FieldByName('COD_BAIRRO').IsNull then
            begin
              cliente.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);

              if cliente.dataSet.FieldByName('COD_BAIRRO').AsInteger > 0 then
              begin
                Cliente.SqlOpen('select br.cod_bairro, br.nome_bairro from bairros br ' +
                  ' where br.cod_bairro = ' + IntToStr(cliente.dataSet.FieldByName('COD_BAIRRO').AsInteger), Cliente.buscas);
                if Cliente.buscas.FieldByName('COD_BAIRRO').AsInteger > 0 then
                  Cliente.dataSet.FieldByName('BAIRRO').AsString := Cliente.buscas.FieldByName('NOME_BAIRRO').AsString;
              end;
            end;

            if cliente.dataSet.FieldByName('COD_CIDADE').IsNull then
            begin
              cliente.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);

              if cliente.dataSet.FieldByName('COD_CIDADE').AsInteger > 0 then
              begin
                Cliente.SqlOpen('select cd.cod_cidade, cd.nome_cidade from cidades cd ' +
                  ' where cd.cod_cidade = ' + IntToStr(cliente.dataSet.FieldByName('COD_CIDADE').AsInteger), Cliente.buscas);
                if Cliente.buscas.FieldByName('COD_CIDADE').AsInteger > 0 then
                  Cliente.dataSet.FieldByName('CIDADE').AsString := Cliente.buscas.FieldByName('NOME_CIDADE').AsString;
              end;
            end;

            if cliente.dataSet.FieldByName('CODIGO_UF').IsNull then
            begin
              cliente.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);

              if cliente.dataSet.FieldByName('CODIGO_UF').AsInteger > 0 then
              begin
                Cliente.SqlOpen('select es.codigo_uf, es.sigla_uf from estados es ' +
                  ' where es.codigo_uf = ' + IntToStr(cliente.dataSet.FieldByName('CODIGO_UF').AsInteger), Cliente.buscas);
                if Cliente.buscas.FieldByName('CODIGO_UF').AsInteger > 0 then
                  Cliente.dataSet.FieldByName('ESTADOS_UF').AsString := Cliente.buscas.FieldByName('SIGLA_UF').AsString;
              end;
            end;

            if cliente.dataSet.FieldByName('ENDERECO').IsNull then
              cliente.dataSet.FieldByName('ENDERECO').asstring := ListaCep[3];
          end;
        end;
      end;
    end;
end;

procedure TFrmCadClientes.DBEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  CEPs: TCEP;
  ListaCep: TStringList;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      CEPs := TCEP.create;
      Screen.Cursor := crHourGlass;
      CEPs._AbreCEP;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CEP');
      if vDadosIni.vPesquisa <> '' then
      begin
        Cliente.dataSet.FieldByName('CEP').AsString := vDadosIni.vPesquisa;

        ListaCep :=
          CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(cliente.dataSet.FieldByName('CEP').AsString);
        if (ListaCep[0] <> '') then
        begin
          cliente.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
          cliente.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
          cliente.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
          cliente.dataSet.FieldByName('ENDERECO').asstring := ListaCep[3];
        end;
      end;
      DBEdit12Exit(Sender);
    finally
      CEPs.Cancel;
      CEPs.Free;
      Screen.Cursor := crDefault;
    end;
  end;
  if Key = VK_F4 then
  begin
    try
      CEPs := TCEP.create;
      Screen.Cursor := crHourGlass;
      CEPs._CadCEP(1);
      if vDadosIni.vPesquisa <> '' then
      begin
        Cliente.dataSet.FieldByName('CEP').AsString := vDadosIni.vPesquisa;
        ListaCep :=
          CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(cliente.dataSet.FieldByName('CEP').AsString);
        if (ListaCep[0] <> '') then
        begin
          cliente.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
          cliente.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
          cliente.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
          cliente.dataSet.FieldByName('ENDERECO').asstring := ListaCep[3];
        end;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadClientes.DBEdit13Exit(Sender: TObject);
//var
//  HandleIE: THandle;
//  InscricaoEstadual: TInscricaoEstadual;
//  resultadoIE: integer;
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
  begin
    if not Cliente.TestaInscEstadual then
      exit
    else if not Cliente.ValidaInscEstadual then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit13.CanFocus) then      
      	DBEdit13.SetFocus;
      exit;
    end;
    if (Cliente.dataSet.State in [dsInsert, dsEdit]) then
      if (vDadosIni.strEstaContidoEm(Trim(Cliente.dataSet.FieldByName('INSC_EST').AsString),
        ['', 'ISENTO'])) or (Cliente.dataSet.FieldByName('cod_pais').AsInteger <> 1058) then
//        Cliente.dataSet.FieldByName('NFE_INDIEDEST').AsInteger := 9
      else if Cliente.dataSet.FieldByName('NFE_INDIEDEST').AsInteger = 2 then
//          Cliente.dataSet.FieldByName('NFE_INDIEDEST').AsInteger := 1;
  end;
end;

procedure TFrmCadClientes.DBEdit150Exit(Sender: TObject);
var
  CEPS: TCEP;
  vExisteCEP: Boolean;
begin
  inherited;
 if vDadosIni.strIn(vDadosIni.apenasNumeros(cliente.dataSet.FieldByName('CEP_COBRANCA').AsString), ['', '00000000']) then
    Exit;

  CEPS := TCEP.create;
  if not CEPs.getEndereco(cliente.dataSet.FieldByName('CEP_COBRANCA').AsString) then
    CEPs._ConsultarWebService(cliente.dataSet.FieldByName('CEP_COBRANCA').AsString)
  else
    vExisteCEP := True;

  if not vExisteCEP then
    vExisteCEP := CEPs.getEndereco(cliente.dataSet.FieldByName('CEP_COBRANCA').AsString);

  if vExisteCEP then
  begin
    if (Trim(cliente.dataSet.FieldByName('BAIRRO_COBRANCA').asstring) = '') or
      (Trim(cliente.dataSet.FieldByName('CIDA_COBRANCA').asstring) = '') or
      (Trim(cliente.dataSet.FieldByName('END_COBRANCA').asstring) = '') or
      (cliente.dataSet.FieldByName('EST_CODIGO_UF').AsInteger = 0)then
    begin
      cliente.dataSet.FieldByName('COD_BAIRRO_COBRANCA').AsInteger := ceps.codigo_bairro;
      cliente.dataSet.FieldByName('COD_CIDADE_COBRANCA').AsInteger := ceps.codigo_cidade;
      cliente.dataSet.FieldByName('EST_CODIGO_UF').AsInteger := ceps.codigo_uf;
      cliente.dataSet.FieldByName('CIDA_COBRANCA').asstring := ceps.nome_cidade;
      cliente.dataSet.FieldByName('BAIRRO_COBRANCA').asstring := ceps.nome_bairro;

      if cliente.dataSet.FieldByName('EST_CODIGO_UF').AsInteger > 0 then
      begin
        Cliente.SqlOpen('select es.codigo_uf, es.sigla_uf from estados es ' +
          ' where es.codigo_uf = ' + IntToStr(cliente.dataSet.FieldByName('EST_CODIGO_UF').AsInteger), Cliente.buscas);
        if Cliente.buscas.FieldByName('CODIGO_UF').AsInteger > 0 then
          Cliente.dataSet.FieldByName('ESTADOS_UF_COBRANCA').AsString := Cliente.buscas.FieldByName('SIGLA_UF').AsString;
      end;
    end;
    if (Trim(cliente.dataSet.FieldByName('END_COBRANCA').asstring) = '') then
      cliente.dataSet.FieldByName('END_COBRANCA').asstring := ceps.logradouro;
  end;
end;

procedure TFrmCadClientes.DBEdit15Exit(Sender: TObject);
var
  CEPs: TCEP;
  ListaCep: TStringList;
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if (trim(Cliente.dataSet.FieldByName('END_COBRANCA').AsString) = '')
      and (cliente.dataSet.FieldByName('CEP_COBRANCA').AsString = '00000000') then
    begin
      Application.MessageBox('Endereço de cobrança não informado.' + chr(13) +
        'Campo Requerido.',
        'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit15.CanFocus) then      
      	DBEdit15.SetFocus;
    end
    else
    begin
      if (cliente.dataSet.FieldByName('COD_BAIRRO_COBRANCA').IsNull
        or cliente.dataSet.FieldByName('COD_CIDADE_COBRANCA').IsNull
        or cliente.dataSet.FieldByName('EST_CODIGO_UF').IsNull
        or cliente.dataSet.FieldByName('END_COBRANCA').IsNull) then
      begin

        ListaCep :=
          CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(cliente.dataSet.FieldByName('CEP_COBRANCA').AsString);

        if ListaCep[0] <> '' then
        begin
          if cliente.dataSet.FieldByName('COD_BAIRRO_COBRANCA').IsNull then
            cliente.dataSet.FieldByName('COD_BAIRRO_COBRANCA').AsInteger := strtoint(ListaCep[2]);
          if cliente.dataSet.FieldByName('COD_CIDADE_COBRANCA').IsNull then
            cliente.dataSet.FieldByName('COD_CIDADE_COBRANCA').AsInteger := strtoint(ListaCep[1]);
          if cliente.dataSet.FieldByName('EST_CODIGO_UF').IsNull then
            cliente.dataSet.FieldByName('EST_CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
          if cliente.dataSet.FieldByName('END_COBRANCA').IsNull then
            cliente.dataSet.FieldByName('END_COBRANCA').asstring := ListaCep[3];
        end;
      end;

    end;
end;

procedure TFrmCadClientes.DBEdit15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  CEPs: TCEP;
  ListaCep: TStringList;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      CEPs := TCEP.create;
      Screen.Cursor := crHourGlass;
      CEPs._AbreCEP;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CEP');
      if vDadosIni.vPesquisa <> '' then
      begin
        if vDadosIni.vPesquisa <> null then
          ListaCep :=
            CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(vDadosIni.vPesquisa);
        cliente.dataSet.FieldByName('END_COBRANCA').asstring := ListaCep[3];
        if ((Cliente.dataSet.FieldByName('CEP_COBRANCA').IsNull) and (ListaCep[0] <> '')) then
          Cliente.dataSet.FieldByName('CEP_COBRANCA').AsString := vDadosIni.vPesquisa;
      end;
      if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then      
      	DBEdit18.SetFocus;
    finally
      CEPs.Cancel;
      CEPs.Free;
      Screen.Cursor := crDefault;
    end;
  end;
  if Key = VK_F4 then
  begin
    try
      CEPs := TCEP.create;
      Screen.Cursor := crHourGlass;
      CEPs._CadCEP(1);
      if vDadosIni.vPesquisa <> '' then
      begin
        if vDadosIni.vPesquisa <> null then
          ListaCep :=
            CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(vDadosIni.vPesquisa);
        cliente.dataSet.FieldByName('END_COBRANCA').asstring := ListaCep[3];
        if ((Cliente.dataSet.FieldByName('CEP_COBRANCA').IsNull) and (ListaCep[0] <> '')) then
          Cliente.dataSet.FieldByName('CEP_COBRANCA').AsString := vDadosIni.vPesquisa;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadClientes.DBEdit16Enter(Sender: TObject);
begin
  inherited;
  Cliente.abreCidadesC;
end;

procedure TFrmCadClientes.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  if trim(TDBedit(Sender).text) = '' then
  begin
    if vDadosIni.PesqPros('CLI020', 'PESQUISAR', '', 'CIDADES', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Cliente.abreCidadesC;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
        if vDadosIni.vPesquisa <> '' then
          Cliente.dataSet.FieldByName('COD_CIDADE_COBRANCA').asinteger :=
            strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox9.CanFocus) then
        	DBLookupComboBox9.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox9.CanFocus) then
  	DBLookupComboBox9.SetFocus;
end;

procedure TFrmCadClientes.DBEdit16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCidade: TCidades;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI020', 'PESQUISAR', '', 'CIDADES', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Cliente.abreCidadesC;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
        if vDadosIni.vPesquisa <> '' then
          Cliente.dataSet.FieldByName('COD_CIDADE_COBRANCA').asinteger :=
            strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox9.CanFocus) then
        	DBLookupComboBox9.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('CLI021', 'CADASTRAR', '', 'CIDADES', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vCidade.CadCidade(1);
        if vDadosIni.vPesquisa <> '' then
          Cliente.dataSet.FieldByName('COD_CIDADE_COBRANCA').asinteger :=
            strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadClientes.DBEdit17Enter(Sender: TObject);
begin
  inherited;
  Cliente.abreBairrosC;
end;

procedure TFrmCadClientes.DBEdit17Exit(Sender: TObject);
begin
  inherited;
  if trim(TDBedit(Sender).text) = '' then
  begin
    if vDadosIni.PesqPros('CLI018', 'PESQUISAR', '', 'BAIRROS', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Cliente.abreBairrosC;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('BAIRROS');
        if vDadosIni.vPesquisa <> '' then
          Cliente.dataSet.FieldByName('COD_BAIRRO_COBRANCA').asinteger :=
            strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox8.CanFocus) then
        	DBLookupComboBox8.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox8.CanFocus) then
  	DBLookupComboBox8.SetFocus;
end;

procedure TFrmCadClientes.DBEdit17KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vBairro: TBairros;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI018', 'PESQUISAR', '', 'BAIRROS', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Cliente.abreBairrosC;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('BAIRROS');
        if vDadosIni.vPesquisa <> '' then
          Cliente.dataSet.FieldByName('COD_BAIRRO_COBRANCA').asinteger :=
            strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox8.CanFocus) then
        	DBLookupComboBox8.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('CLI019', 'CADASTRAR', '', 'BAIRROS', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vBairro.CadBairro(1);
        if vDadosIni.vPesquisa <> '' then
          Cliente.dataSet.FieldByName('COD_BAIRRO_COBRANCA').asinteger :=
            strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadClientes.DBEdit18Enter(Sender: TObject);
begin
  inherited;
  if (Cliente.dataSet.FieldByName('CEP_COBRANCA').IsNull) then
    cliente.dataSet.FieldByName('CEP_COBRANCA').AsString := '00000000';
end;

procedure TFrmCadClientes.DBEdit18Exit(Sender: TObject);
var
  ListaCep: TStringList;
  CEPs: TCEP;
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if (Cliente.dataSet.FieldByName('CEP_COBRANCA').IsNull) or
      (cliente.dataSet.FieldByName('CEP_COBRANCA').AsString = '00000000') then
    begin
      cliente.dataSet.FieldByName('CEP_COBRANCA').AsString := '00000000';
      if not Cliente.DadosPessoaisObrigatorios then
      begin
        PageControl3.ActivePage := TabSheet3;
        setFocusCampoErro(Cliente.vNomeCampoErro, Cliente.vMensagemErro);
        exit;
      end;
      if Cliente.MesmoEndCobranca then
        ActiveControl := DBEdit36;
    end
    else if cliente.dataSet.FieldByName('CEP_COBRANCA').AsString <> '00000000' then
    begin
      if (cliente.dataSet.FieldByName('COD_BAIRRO_COBRANCA').IsNull
        or cliente.dataSet.FieldByName('COD_CIDADE_COBRANCA').IsNull
        or cliente.dataSet.FieldByName('EST_CODIGO_UF').IsNull
        or cliente.dataSet.FieldByName('END_COBRANCA').IsNull) then
      begin

        ListaCep :=
          CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(cliente.dataSet.FieldByName('CEP').AsString);

        if ListaCep[0] <> '' then
        begin
          if cliente.dataSet.FieldByName('COD_BAIRRO_COBRANCA').IsNull then
            cliente.dataSet.FieldByName('COD_BAIRRO_COBRANCA').AsInteger := strtoint(ListaCep[2]);
          if cliente.dataSet.FieldByName('COD_CIDADE_COBRANCA').IsNull then
            cliente.dataSet.FieldByName('COD_CIDADE_COBRANCA').AsInteger := strtoint(ListaCep[1]);
          if cliente.dataSet.FieldByName('EST_CODIGO_UF').IsNull then
            cliente.dataSet.FieldByName('EST_CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
          if cliente.dataSet.FieldByName('END_COBRANCA').IsNull then
            cliente.dataSet.FieldByName('END_COBRANCA').asstring := ListaCep[3];
        end;
      end;

    end;
end;

procedure TFrmCadClientes.DBEdit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  CEPs: TCEP;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      CEPs := TCEP.create;
      Screen.Cursor := crHourGlass;
      CEPs._AbreCEP;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CEP');
      if vDadosIni.vPesquisa <> '' then
        Cliente.dataSet.FieldByName('CEP_COBRANCA').AsString := vDadosIni.vPesquisa;
      if (Self.Enabled) and (Self.Visible) and (DBEdit17.CanFocus) then
      	DBEdit17.SetFocus;
    finally
      CEPs.Cancel;
      CEPs.Free;
      Screen.Cursor := crDefault;
    end;
  end;
  if Key = VK_F4 then
  begin
    try
      CEPs := TCEP.create;
      Screen.Cursor := crHourGlass;
      CEPs._CadCEP(1);
      if vDadosIni.vPesquisa <> '' then
        Cliente.dataSet.FieldByName('CEP_COBRANCA').AsString := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadClientes.DBEdit19Exit(Sender: TObject);
begin
  inherited;
  //  if (Self.Enabled) and (Self.Visible) and (DBEdit63.CanFocus) then
  //    DBEdit63.SetFocus
  //  else
  //  begin
  if GroupBox44.Visible then
    Exit;
  PageControl3.ActivePage := TabSheet5;
  if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
 	  DBEdit18.SetFocus;
  //  end;
end;

procedure TFrmCadClientes.DBEdit202Exit(Sender: TObject);
begin
  inherited;
   // Buscas dados taxa conversão
  vDadosIni.buscasdadostaxaConv(Cliente.vContaCorrenteCli.buscas);
  lbValorValeLanc.Caption := 'R$ ' + FormatFloat('#,##0.00',
    (DBEdit202.Field.AsFloat * Cliente.vContaCorrenteCli.buscas.FieldByName('PERC_PROG_FID').AsFloat));
end;

procedure TFrmCadClientes.DBEdit204Exit(Sender: TObject);
begin
  Cliente.verificarTelefoneCelular(false,
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger,
    trim(Cliente.dataSet.FieldByName('CPFCGC').AsString),
    '',
  	trim(Cliente.dataSet.FieldByName('FONE_CELULAR').AsString));
end;

procedure TFrmCadClientes.DBEdit205Exit(Sender: TObject);
begin
  Cliente.verificarTelefoneCelular(false,
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger,
    trim(Cliente.dataSet.FieldByName('CPFCGC').AsString),
    '',
  	trim(Cliente.dataSet.FieldByName('FONE_CELULAR').AsString));
end;

procedure TFrmCadClientes.edCodCliFatExit(Sender: TObject);
begin
  inherited;

  lbClienteFaturamento.Caption := Cliente.ChangeClienteFaturamento(Cliente.fint('cod_cli_fat'));
  lbSClienteFaturamento.Caption := lbClienteFaturamento.Caption;

  if edCodCliFat.Tag <> Cliente.fint('cod_cli_fat') then
    vDadosIni.GravaAuditoria('CLI271', 'EDITAR',
      Format('Emissão NFe: %d para %d', [edCodCliFat.Tag, Cliente.fint('cod_cli_fat')]),
      'CLIENTES', Cliente.fstr('cod_cliente'), Cliente.buscas);

  edCodCliFat.Tag := Cliente.fint('cod_cli_fat');
end;

procedure TFrmCadClientes.edCodCliFatKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  iCod: Integer;
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');

    if TryStrToInt(vDadosIni.vPesquisa, iCod) then
    begin
      lbClienteFaturamento.Caption := Cliente.ChangeClienteFaturamento(iCod);
      lbSClienteFaturamento.Caption := lbClienteFaturamento.Caption;

      if edCodCliFat.Tag <> Cliente.fint('cod_cli_fat') then
      vDadosIni.GravaAuditoria('CLI271', 'EDITAR',
        Format('Emissão NFe: %d para %d', [edCodCliFat.Tag, Cliente.fint('cod_cli_fat')]),
        'CLIENTES', Cliente.fstr('cod_cliente'), Cliente.buscas);

    edCodCliFat.Tag := Cliente.fint('cod_cli_fat');
    end;
  end;
end;

procedure TFrmCadClientes.DBEdit20Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if Cliente.dataSet.FieldByName('DATA_NASC').AsDateTime > date then
    begin
      Application.MessageBox('Data de Nascimento maior que data atual.' + chr(13) +
        'Favor verificar.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit20.CanFocus) then
      	DBEdit20.SetFocus;
    end
    else if (Cliente.dataSet.FieldByName('CPFCGC').EditMask = '999.999.999-99;0;') and
      (Cliente.dataSet.FieldByName('DATA_NASC').IsNull) then
    begin
      Application.MessageBox('Data de nascimento não informada.' + chr(13) + 'Campo Requerido.',
        'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit20.CanFocus) then
      	DBEdit20.SetFocus;
    end;
end;

procedure TFrmCadClientes.DBEdit25Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if (Cliente.dataSet.FieldByName('CPFCGC').EditMask = '999.999.999-99;0;') and
      (trim(Cliente.dataSet.FieldByName('PAI').asstring) = '') then
    begin
      Application.MessageBox('Filiação não informada.' + chr(13) + 'Campo Requerido.', 'Aviso',
        MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit25.CanFocus) then
      	DBEdit25.SetFocus;
    end
end;

procedure TFrmCadClientes.DBEdit26Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if (Cliente.dataSet.FieldByName('CPFCGC').EditMask = '999.999.999-99;0;') and
      (trim(Cliente.dataSet.FieldByName('MAE').asstring) = '') then
    begin
      Application.MessageBox('Filiação não informada.' + chr(13) + 'Campo Requerido.', 'Aviso',
        MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
      	DBEdit26.SetFocus;
    end
end;

procedure TFrmCadClientes.DBEdit32Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if (Cliente.dataSet.FieldByName('CPFCGC').EditMask = '999.999.999-99;0;') and
      (trim(Cliente.dataSet.FieldByName('RG').asstring) = '') then
    begin
      Application.MessageBox('RG não informado.' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit32.CanFocus) then
      	DBEdit32.SetFocus;
    end
end;

procedure TFrmCadClientes.DBEdit332Exit(Sender: TObject);
begin
  inherited;
  Cliente.EndDocAd.ConsultaCEP(False);
end;

procedure TFrmCadClientes.DBEdit35Exit(Sender: TObject);
begin
  inherited;
  if (Cliente.dataSet.FieldByName('TIPO').AsString <> 'F')
    and (vDadosIni.vRegistro.vSisAutomacao) then
  begin
    PageControl3.ActivePage := TabSheet4;
    if (Self.Enabled) and (Self.Visible) and (DBEdit59.CanFocus) then
  		DBEdit59.SetFocus;
  end;
end;

procedure TFrmCadClientes.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  Edit1.Text := Cliente.LocCliConveniado(Cliente.dataSet.FieldByName('COD_CONVENIO').asinteger);
  Edit12.Text := Cliente.LocCliConveniado(Cliente.dataSet.FieldByName('COD_CONVENIO').asinteger);
  //  if trim(Edit1.Text) = '' then
  //    Cliente.dataSet.FieldByName('COD_CONVENIO').AsVariant := null;
end;

procedure TFrmCadClientes.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI027', 'PESQUISAR', '', 'CLIENTES', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES',
          ' and CLIENTES.CONVENIADO=''S'' ', 'Consulta de Clientes Conveniados');
        if vDadosIni.vPesquisa <> '' then
        begin
          Cliente.dataSet.FieldByName('COD_CONVENIO').asinteger := strtoint(vDadosIni.vPesquisa);
          Edit1.Text := Cliente.LocCliConveniado(strtoint(vDadosIni.vPesquisa));
          Edit12.Text := Cliente.LocCliConveniado(strtoint(vDadosIni.vPesquisa));
          if Edit1.Text = '' then
            Cliente.dataSet.FieldByName('COD_CONVENIO').AsVariant := null;
        end;
        if (Self.Enabled) and (Self.Visible) and (DBEdit28.CanFocus) then
      		DBEdit28.SetFocus;
        // else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
        //        DBLookupComboBox4.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadClientes.DBEdit63Exit(Sender: TObject);
begin
  inherited;
  // if (Self.Enabled) and (Self.Visible) and (DBLookupComBox10.CanFocus) then
  //   DBLookupComboBox10.SetFocus;
end;

procedure TFrmCadClientes.DBEdit65Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
  begin
    if trim(Cliente.AdCliente.dataSet.FieldByName('NOME').AsString) = '' then
    begin
      Application.MessageBox('Nome do Cliente adicional não informado.' + chr(13) +
        'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit65.CanFocus) then
      	DBEdit65.SetFocus;
      exit;
    end
  end;
end;

procedure TFrmCadClientes.DBEdit66Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
  begin
    if trim(Cliente.AdCliente.dataSet.FieldByName('ENDERECO').AsString) = '' then
    begin
      Application.MessageBox('Endereço do Cliente adicional não informado.' + chr(13) +
        'Campo Requerido.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit66.CanFocus) then
      	DBEdit66.SetFocus;
      exit;
    end
  end;
end;

procedure TFrmCadClientes.DBEdit68Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if Cliente.dataSet.FieldByName('NUM_END_CLIENTE').IsNull then
    begin
      Application.MessageBox('Número do Logradouro não informado.' + chr(13) + 'Campo Requerido.',
        'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit68.CanFocus) then
      	DBEdit68.SetFocus;
    end;
end;

procedure TFrmCadClientes.DBEdit6Enter(Sender: TObject);
begin
  inherited;
  Cliente.dataSet.FieldByName('CPFCGC').EditMask := '';
end;

procedure TFrmCadClientes.DBEdit6Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and
    (not clicouNoX) then
  begin
    if trim(Cliente.dataSet.FieldByName('CPFCGC').AsString) = '' then
    begin
      Cliente.dataSet.FieldByName('CPFCGC').AsVariant := null;
      Cliente.dataSet.FieldByName('CPFCGC').EditMask := '999.999.999-99;0;';
      if not vDadosIni.vCliente.vConfCPF then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBComboBox8.CanFocus) then
        	DBComboBox8.SetFocus;
        exit;
      end;
    end;

    if not Cliente.TestaCPFCNPJ then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
      	DBEdit6.SetFocus;
    end
    else
    begin
      if Cliente.verificarCpfCnpjJaExite then
      begin
        PageControl3.ActivePage := TabSheet3;
        if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
        	DBEdit6.SetFocus;
        exit;
      end;
      Cliente._importarClienteOutraEmpresa;
      if Cliente.dataSet.FieldByName('CPFCGC').EditMask = '999.999.999-99;0;' then
      begin
        Cliente.dataSet.FieldByName('CONVENIADO').AsVariant := null;
        dbcombobox1.Enabled := false;
        dbedit4.Enabled := true;
        Edit1.Text := '';
        Cliente.dataSet.FieldByName('RAMO_ATIVIDADE').AsVariant := null;
        dbedit20.enabled := true;
        dbedit24.enabled := true;
        dbcombobox5.enabled := true;
        DBComboBox4.enabled := true;
        DBComboBox5.enabled := true;
        dbedit25.enabled := true;
        dbedit26.enabled := true;
        dbedit27.enabled := true;
        dbedit32.enabled := true;
        dbedit33.enabled := true;
        dbedit34.enabled := true;
      end
      else
      begin
        dbcombobox1.Enabled := true;
        dbedit4.Enabled := false;
        dbcombobox5.enabled := false;
        dbedit20.enabled := false;
        dbedit24.enabled := false;
        DBComboBox4.enabled := false;
        DBComboBox5.enabled := false;
        dbedit25.enabled := false;
        dbedit26.enabled := false;
        dbedit27.enabled := false;
        dbedit32.enabled := false;
        dbedit33.enabled := false;
        dbedit34.enabled := false;
      end;
      if (Self.Enabled) and (Self.Visible) and (DBComboBox8.CanFocus) then
      	DBComboBox8.SetFocus;
    end;
  end;
end;

procedure TFrmCadClientes.DBEdit76Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if Cliente.AdCliente.dataSet.FieldByName('COD_BAIRRO').IsNull then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('BAIRROS');
        if vDadosIni.vPesquisa <> '' then
          Cliente.AdCliente.dataSet.FieldByName('COD_BAIRRO').asinteger :=
            strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox11.CanFocus) then        
        	DBLookupComboBox11.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
end;

procedure TFrmCadClientes.DBEdit76KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vBairro: TBairros;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI010', 'PESQUISAR', '', 'BAIRROS', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('BAIRROS');
        if vDadosIni.vPesquisa <> '' then
          Cliente.AdCliente.dataSet.FieldByName('COD_BAIRRO').asinteger :=
            strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox11.CanFocus) then        
        	DBLookupComboBox11.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('CLI011', 'CADASTRAR', '', 'BAIRROS', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vBairro.CadBairro(1);
        if vDadosIni.vPesquisa <> '' then
          Cliente.AdCliente.dataSet.FieldByName('COD_BAIRRO').asinteger :=
            strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadClientes.DBEdit77Exit(Sender: TObject);
begin
  inherited;
  if Cliente.AdCliente.dataSet.FieldByName('COD_CIDADE').IsNull then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
      if vDadosIni.vPesquisa <> '' then
        Cliente.AdCliente.dataSet.FieldByName('COD_CIDADE').asinteger :=
          strtoint(vDadosIni.vPesquisa);
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox12.CanFocus) then      
      	DBLookupComboBox12.SetFocus;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadClientes.DBEdit77KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCidade: TCidades;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI020', 'PESQUISAR', '', 'CIDADES', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
        if vDadosIni.vPesquisa <> '' then
          Cliente.AdCliente.dataSet.FieldByName('COD_CIDADE').asinteger :=
            strtoint(vDadosIni.vPesquisa);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox12.CanFocus) then        
        	DBLookupComboBox12.SetFocus;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('CLI021', 'CADASTRAR', '', 'CIDADES', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vCidade.CadCidade(1);
        if vDadosIni.vPesquisa <> '' then
          Cliente.AdCliente.dataSet.FieldByName('COD_CIDADE').asinteger :=
            strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadClientes.DBEdit7Exit(Sender: TObject);
begin
  inherited;
  if (Cliente.dataSet.state in [dsEdit, dsInsert]) and (activecontrol <> BitBtn5) and (activecontrol
    <> BitBtn6) and (not clicouNoX) then
  begin
    if trim(Cliente.dataSet.FieldByName('NOME_CLIENTE').AsString) = '' then
    begin
      Application.MessageBox('Nome do Cliente não informado.' + chr(13) + 'Campo Requerido.',
        'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then      
      	DBEdit7.SetFocus;
      exit;
    end;
    if (trim(Cliente.dataSet.FieldByName('RAZAO').AsString) = '') and
      (trim(Cliente.dataSet.FieldByName('NOME_CLIENTE').AsString) <> '') then
      Cliente.dataSet.FieldByName('RAZAO').AsString :=
        trim(Cliente.dataSet.FieldByName('NOME_CLIENTE').AsString)
    else if (Cliente.dataSet.FieldByName('TIPO').AsString = 'C') and
      (Cliente.dataSet.FieldByName('CPFCGC').EditMask = '999.999.999-99;0;') then
      Cliente.dataSet.FieldByName('RAZAO').AsString :=
        trim(Cliente.dataSet.FieldByName('NOME_CLIENTE').AsString);
  end;
end;

procedure TFrmCadClientes.DBEdit84Exit(Sender: TObject);
begin
  inherited;
  if not Cliente.LocalizaVendedor then
  	if (Self.Enabled) and (Self.Visible) and (DBEdit84.CanFocus) then
    	DBEdit84.SetFocus;
end;

procedure TFrmCadClientes.DBEdit84KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI012', 'PESQUISAR', '', 'COLABORADOR', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COLABORADOR');
        if vDadosIni.vPesquisa <> '' then
          Cliente.dataSet.FieldByName('COD_VENDEDOR').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  //  if Key = VK_F4 then
  //  begin
  //    if vDadosIni.PesqPros('CLI013', '', Cliente.buscas, true) then
  //    begin
  //      try
  //        Colaborador := TColaborador.create;
  //        Screen.Cursor := crHourGlass;
  //        Colaborador.CadColab(1);
  //      finally
  //        Screen.Cursor := crDefault;
  //      end;
  //    end;
  //  end;

  //  if Key = VK_F4 then
  //  begin
  //    if vDadosIni.PesqPros('CLI013', '', Cliente.buscas, true) then
  //    begin
  //      try
  //        Screen.Cursor := crHourGlass;
  //        Cliente.CadColaborador(1);
  //      finally
  //        Screen.Cursor := crDefault;
  //      end;
  //    end;
  //  end;
end;

procedure TFrmCadClientes.DBEdit88KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (UpperCase(key) = '-') or (UpperCase(key) = '.') or (UpperCase(key) = ' ') or (UpperCase(key) =
    ',') then
    key := #0;
end;

procedure TFrmCadClientes.DBEdit8Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if (trim(Cliente.dataSet.FieldByName('RAZAO').AsString) = '') and
      (trim(Cliente.dataSet.FieldByName('NOME_CLIENTE').AsString) <> '') then
      Cliente.dataSet.FieldByName('RAZAO').AsString :=
        trim(Cliente.dataSet.FieldByName('NOME_CLIENTE').AsString)
    else if (trim(Cliente.dataSet.FieldByName('RAZAO').AsString) = '') then
    begin
      Application.MessageBox('Razao Social não Informada' + chr(13) + 'Campo Requerido.', 'Aviso',
        MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then      
      	DBEdit8.SetFocus;
    end
end;

procedure TFrmCadClientes.DBEdit91KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('LOCALIDADE'));
    if vDadosIni.vPesquisa <> '' then
      if Cliente.dataSet.State in [dsInsert, dsEdit] then
        Cliente.dataSet.FieldByName('cod_localidade').AsString := vDadosIni.vPesquisa;
  end
  else if Key = VK_F4 then
  begin
    vDadosIni.vPesquisa := '';
    vDadosIni.abreFormCadastro('pkOrdemCarregamento', 'TfrmCadLocalidade');
    if vDadosIni.vPesquisa <> '' then
      if Cliente.dataSet.State in [dsInsert, dsEdit] then
      begin
        Cliente.vLocal._abreLocalidades;
        Cliente.dataSet.FieldByName('cod_localidade').AsString := vDadosIni.vPesquisa;
      end;
  end;
end;

procedure TFrmCadClientes.DBEdit99KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('GRADE');
    if trim(vDadosIni.vPesquisa) <> '' then
    begin
      //DBEdit98.Field.AsInteger := StrToInt(vDadosIni.vPesquisa);
      Cliente.vCodigoForn.Edit;
      Cliente.vCodigoForn.dataSet.FieldByName('COD_GRADE').AsInteger := StrToInt(vDadosIni.vPesquisa);
    end;
  end;
end;

procedure TFrmCadClientes.DBEdit9Exit(Sender: TObject);
var
  CEPs: TCEP;
  ListaCep: TStringList;
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if ((trim(Cliente.dataSet.FieldByName('ENDERECO').AsString) = '')
      and ((cliente.dataSet.FieldByName('CEP').IsNull) or
      (cliente.dataSet.FieldByName('CEP').AsString = '00000000'))) then
    begin
      Application.MessageBox('Endereço do Cliente não informado.' + chr(13) + 'Campo Requerido.',
        'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then      
      	DBEdit9.SetFocus;
    end
    else
    begin

      if (cliente.dataSet.FieldByName('COD_BAIRRO').IsNull
        or cliente.dataSet.FieldByName('COD_CIDADE').IsNull
        or cliente.dataSet.FieldByName('CODIGO_UF').IsNull
        or cliente.dataSet.FieldByName('ENDERECO').IsNull) then
      begin

        ListaCep :=
          CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(cliente.dataSet.FieldByName('CEP').AsString);

        if ListaCep[0] <> '' then
        begin
          if cliente.dataSet.FieldByName('COD_BAIRRO').IsNull then
            cliente.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
          if cliente.dataSet.FieldByName('COD_CIDADE').IsNull then
            cliente.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
          if cliente.dataSet.FieldByName('CODIGO_UF').IsNull then
            cliente.dataSet.FieldByName('CODIGO_UF').AsInteger := strtoint(ListaCep[0]);
          if cliente.dataSet.FieldByName('ENDERECO').IsNull then
            cliente.dataSet.FieldByName('ENDERECO').asstring := ListaCep[3];
        end;
      end;

    end;

end;

procedure TFrmCadClientes.DBGrid10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_TAB) or (Key = VK_RETURN) then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TFrmCadClientes.DBGrid12DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if Cliente.vReds.dataSet.FieldByName('sel').AsString = 'S' then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clMoneyGreen;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
//    if (gdFocused in State) then
//    begin
//      TDBGrid(sender).canvas.brush.color := clWindow;
//      TDBGrid(sender).canvas.Font.color := clWindowText;
//    end
//    else
//    begin
//      TDBGrid(sender).canvas.brush.color := clHighlight;
//      TDBGrid(sender).canvas.Font.color := clWhite;
//    end;
//  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
//
//  if Column.FieldName = 'SEL' then
//  begin
//    if Column.Index <> 0 then
//      Column.Index := 0;
//    if Column.Width <> 18 then
//      Column.Field.DisplayWidth := 1;
//
//    DBGrid1.Canvas.FillRect(Rect);
//    Check := 0;
//    if Column.Field.AsString = 'S' then
//      Check := DFCS_CHECKED
//    else
//      Check := 0;
//    R := Rect;
//    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
//    DrawFrameControl(DBGrid1.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
//  end;
end;

procedure TFrmCadClientes.DBGrid12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    Cliente.vReds._marcaDesmarcaLinha
  else if Key = VK_F2 then
    btSelectTodos.Click
  else if Key = VK_F3 then
    btUnSelectTodos.Click;

end;

procedure TFrmCadClientes.DBGrid12MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    Cliente.vReds._marcaDesmarcaLinha;
end;

procedure TFrmCadClientes.DBGrid12TitleClick(Column: TColumn);
begin
  inherited;
  vDadosini.DBGridOnTitleClick(DBGrid12, Column);
end;

procedure TFrmCadClientes.gravaConfiguracoesFormRegistro;
begin
	if (TelaCadastro <= 0) then
  begin
    _GravaConfiguracoesBoolean(CheckBox7.Name, CheckBox7.Checked);

    _GravaConfiguracoesString(ComboBox14.Name, ComboBox14.Text);
  end;

  if (not SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
    CheckBox3.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
  begin
    _GravaConfiguracoesInteger(ComboBox4.Name, ComboBox4.ItemIndex);
    _GravaConfiguracoesInteger(ComboBox5.Name, ComboBox5.ItemIndex);
    _GravaConfiguracoesInteger(ComboBox6.Name, ComboBox6.ItemIndex);
    _GravaConfiguracoesInteger(ComboBox7.Name, ComboBox7.ItemIndex);
    _GravaConfiguracoesInteger(ComboBox8.Name, ComboBox8.ItemIndex);
  end;

  if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
    _GravaConfiguracoesString(ComboBox11.Name, ComboBox11.Text);
    _GravaConfiguracoesString(ComboBox12.Name, ComboBox12.Text);

    _GravaConfiguracoesString(MaskEdit7.Name, MaskEdit7.Text);
    _GravaConfiguracoesString(MaskEdit9.Name, MaskEdit9.Text);
    _GravaConfiguracoesString(MaskEdit8.Name, MaskEdit8.Text);

    _GravaConfiguracoesInteger(RadioGroup1.Name, RadioGroup1.ItemIndex);

    _GravaConfiguracoesInteger(ComboBox14.Name, ComboBox14.ItemIndex);

    _GravaConfiguracoesString(MaskEdit4.Name, MaskEdit4.Text);
    _GravaConfiguracoesString(MaskEdit5.Name, MaskEdit5.Text);
    _GravaConfiguracoesString(MaskEdit6.Name, MaskEdit6.Text);
  end;
end;

procedure TFrmCadClientes.gridCondPagDblClick(Sender: TObject);
begin
  inherited;
  Cliente._addControlesFormaPagamento;
end;

procedure TFrmCadClientes.gridCondPagDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if not Assigned(TDBGrid(Sender).DataSource) then
    Exit;
    
  if Cliente.vControles.fstr('sel') = 'T' then
  begin
    TDBGrid(sender).Canvas.Brush.Color := TColor($00AEFFFF);
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if Cliente.vControles.fstr('sel') = 'S' then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clMoneyGreen;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TFrmCadClientes.DBGrid14DblClick(Sender: TObject);
begin
  inherited;
  TForm(pnModeloCartas.Parent).ModalResult := IDOK;

  if Cliente.LModCarta.buscas.IsEmpty then
  begin
    Application.MessageBox(Pchar('Nenhum modelo carta encontrado.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  try
  	vDadosIni.abreStatusProcessamento('', 'Montando documento');
	  Cliente._carregarCartaemWord(Cliente.LModCarta.buscas.FieldByName('COD_CARTA').AsInteger);
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadClientes.DBGrid14KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
 if Key = #13 then
  begin
    DBGrid14DblClick(Sender); // executa duploClick no grid
    Key := #0;
  end;
end;

procedure TFrmCadClientes.DBGrid15CellClick(Column: TColumn);
begin
  inherited;
 if Column.FieldName = 'VALOR_ATRIBUTO' then
    DBGrid15.Options := DBGrid15.Options + [dgEditing]
  else
    DBGrid15.Options := DBGrid15.Options - [dgEditing];

 if ((Cliente.fTempAtributos.FieldByName('VALOR_ATRIBUTO').AsFloat < 0) or (Cliente.fTempAtributos.FieldByName('VALOR_ATRIBUTO').AsFloat > 10))  then
 begin
   Application.MessageBox(PChar('Valor do Atributo = '+ QuotedStr(Trim(Cliente.fTempAtributos.FieldByName('DESCRICAO_ATRIBUTO').AsString))+
       ' deve ser informado entre 0 a 10.'), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
   DBGrid15.SelectedIndex := 2;
   exit;
 end;
end;

procedure TFrmCadClientes.DBGrid15DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (EditFiscal1.Text <> '') then
  begin
    if gdSelected in State then
    begin
       TDBGrid(sender).canvas.brush.color := clGradientActiveCaption;
       TDBGrid(sender).canvas.Font.color := clBlack;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;
end;

procedure TFrmCadClientes.DBGrid15Exit(Sender: TObject);
var
 vCodAtr, vInc, vIntTmp, I: Integer;
 vNotas: double;
begin
  inherited;
  if not ((activecontrol <> BitBtn5) and (activecontrol <> BitBtn6)) then
   exit;

   if DBGrid15.DataSource.DataSet.State = dsEdit then
    DBGrid15.DataSource.DataSet.Post;

  vNotas := 0;
  Cliente.fTempAtributos.First;
  while not Cliente.fTempAtributos.Eof do
  begin
    if ((Cliente.fTempAtributos.FieldByName('VALOR_ATRIBUTO').AsFloat < 0)
     or (Cliente.fTempAtributos.FieldByName('VALOR_ATRIBUTO').AsFloat > 10))  then
    begin
        Application.MessageBox(PChar('Valor do Atributo = '+ QuotedStr(Trim(Cliente.fTempAtributos.FieldByName('DESCRICAO_ATRIBUTO').AsString))+
         ' deve ser informado entre 0 a 10.'), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
         if (Self.Enabled) and (Self.Visible) and (DBGrid15.CanFocus) then         
           DBGrid15.SetFocus;
        exit;
    end;
    vNotas := vNotas + Cliente.fTempAtributos.FieldByName('VALOR_ATRIBUTO').AsFloat;
    Cliente.fTempAtributosDtSource.DataSet.Next;
  end;
  Cliente.dataSet.FieldByName('VALOR_ATRIBUTOS').AsFloat := vNotas;
  DBGrid15.DataSource.DataSet.Last;
  if DBGrid15.DataSource.DataSet.FieldByName('COD_ATRIBUTO').IsNull then
    DBGrid15.DataSource.DataSet.Cancel;
  DBGrid15.Options := DBGrid15.Options - [dgEditing];  
end;

procedure TFrmCadClientes.DBGrid15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_TAB then
    DBGrid15Exit(Sender)
  else if Key = VK_RETURN then
  begin
    Cliente.fTempAtributos.Next;
    DBGrid15.SelectedIndex := 2;
  end;
end;

procedure TFrmCadClientes.DBGrid15KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_DOWN then
    if DBGrid15.DataSource.DataSet.FieldByName('COD_ATRIBUTO').IsNull then
      DBGrid15.DataSource.DataSet.Cancel;
end;

procedure TFrmCadClientes.DBGrid17TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid17, Column);
end;

procedure TFrmCadClientes.DBGrid18ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
   vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid18, GridCfg2, cdsGrid2,
    cdsColunas2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TFrmCadClientes.DBGrid18DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (Column.Field.Dataset.FieldbyName('CODIGO').AsInteger > 0) then
//    and (Column.FieldName = 'TIPO') then
    if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('TIPO').AsString)) = 'CRÉDITO') then
    begin
      if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := Panel55.Color;
//        TDBGrid(sender).Canvas.FillRect(Rect);
        TDBGrid(sender).canvas.Font.color := clBlack;
      end;
    end
    else
    begin
      if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := Panel59.Color;
//        TDBGrid(sender).Canvas.FillRect(Rect);
        TDBGrid(sender).canvas.Font.color := clBlack;
      end;
    end;

	if (Column.FieldName = 'DATA_VENC_PROG') and (Column.Field.dataSet.FieldByName('DATA_VENC_PROG').AsDateTime < vDtDiaFinanc) then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;


  if Column.FieldName = 'COD_EMP_RESP' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadClientes.DBGrid19DblClick(Sender: TObject);
begin
  Cliente.vContaCorrenteCli.vRegrasValeTrocaProgFid.checkUnCheckRow('SEL'); 
end;

procedure TFrmCadClientes.DBGrid19DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(Sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

  if TDBGrid(Sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadClientes.DBGrid19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Perform(WM_NEXTDLGCTL, 0, 0)
  else if Key = VK_SPACE then
    Cliente.vContaCorrenteCli.vRegrasValeTrocaProgFid.checkUnCheckRow('SEL');  
end;

procedure TFrmCadClientes.DBGridValeCompraProgFidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    BitBtn62Click(Sender);
end;

procedure TFrmCadClientes.gridCondPagVNDDblClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CLI207', 'ALTERAR', '', 'CLIENTES',
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, Cliente.buscas, True) then
    Exit;

  Cliente.vCondPagVND.marcaDesmarcaCondPag('VND');
end;

procedure TFrmCadClientes.gridCondPagVNDDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if not Assigned(TDBGrid(Sender).DataSource) then
    Exit;

  if TDBGrid(Sender).DataSource.DataSet.FieldByName('sel').AsString = 'T' then
  begin
    TDBGrid(sender).Canvas.Brush.Color := TColor($00AEFFFF);
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if TDBGrid(Sender).DataSource.DataSet.FieldByName('sel').AsString <> 'Z' then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clMoneyGreen;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TFrmCadClientes.gridEndDocAddDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if (Column.Field.Dataset.FieldbyName('ativo').Asinteger = 0) and (not Column.Field.Dataset.IsEmpty) then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);

    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;
end;

procedure TFrmCadClientes.gridCondPagPREDblClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CLI208', 'ALTERAR', '', 'CLIENTES',
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, Cliente.buscas, True) then
    Exit;

  Cliente.vCondPagPre.marcaDesmarcaCondPag('PRE');
end;

procedure TFrmCadClientes.gridCondPagPREDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
	if not Assigned(TDBGrid(Sender).DataSource) then
    Exit;

  if TDBGrid(Sender).DataSource.DataSet.FieldByName('sel').AsString = 'T' then
  begin
    TDBGrid(sender).Canvas.Brush.Color := TColor($00AEFFFF);
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if TDBGrid(Sender).DataSource.DataSet.FieldByName('sel').AsString <> 'Z' then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clMoneyGreen;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TFrmCadClientes.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    Cliente._marcaDesmarcaLinha;
end;

procedure TFrmCadClientes.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if (Column.Field.Dataset.FieldbyName('CODIGO_FATURAMENTO').Asinteger = vDadosIni.vEmp.vCodigoBarrado)
    and (vDadosIni.vEmp.vCodigoBarrado <> 0)
    and (TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString <> 'S') then 
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
  end;

  if (TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S')
  	and (Column.Field.Dataset.FieldbyName('CODIGO_FATURAMENTO').Asinteger = vDadosIni.vEmp.vCodigoBarrado)
    and (vDadosIni.vEmp.vCodigoBarrado <> 0)
    and ((Column.FieldName = 'SEL')
    	or (Column.FieldName = 'COD_CLIENTE')
      or (Column.FieldName = 'CPFCGC')) then
  begin
  	TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if (TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00DAD5D3); //clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
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

procedure TFrmCadClientes.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  //  if TelaCadastro <> 0 then
  //    close;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if Key = VK_SPACE then
    if not Cliente.dataSet.IsEmpty then
      Cliente._marcaDesmarcaLinha;

end;

procedure TFrmCadClientes.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    Cliente._marcaDesmarcaLinha;
end;

procedure TFrmCadClientes.DBGrid20KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    BitBtn65Click(Sender);
end;

procedure TFrmCadClientes.DBGrid21KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
    BitBtn68Click(Sender);
end;

procedure TFrmCadClientes.DBGrid22DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (TDBGrid(sender).DataSource.DataSet.FieldByName('FORMAS').AsInteger > 0) then
    begin
       if (gdFocused in State) then
       begin
         TDBGrid(sender).canvas.brush.color := clWindow;
         TDBGrid(sender).canvas.Font.color := clWindowText;
       end
       else
       begin
         TDBGrid(sender).canvas.brush.color := TColor($00A4A4FF);
         TDBGrid(sender).canvas.Font.color := clBlack;
       end;
    end;
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadClientes.DBGrid22KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_TAB) or (Key = VK_RETURN) then
    BitBtn70Click(Sender);
end;

procedure TFrmCadClientes.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    BitBtn11Click(Sender);
  if key = VK_DELETE then
    BitBtn12Click(Sender);
end;

procedure TFrmCadClientes.DBGrid8Enter(Sender: TObject);
begin
  inherited;
  DBGrid8.Columns[0].Showing;
end;

procedure TFrmCadClientes.DBGrid8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
    SpeedButton10.Click
  else if Key = VK_ESCAPE then
    SpeedButton13.Click
  else if key = VK_TAB then
  	if (Self.Enabled) and (Self.Visible) and (Edit4.CanFocus) then
    	Edit4.SetFocus;
end;

procedure TFrmCadClientes.DBGrid8TitleClick(Column: TColumn);
begin
  inherited;
  Cliente.vCodigoForn.vNomeDoCampoPesquisa := Column.FieldName;
  Label28.Caption := Column.Title.Caption;
  Edit4.Text := Cliente.vCodigoForn.dataSet.FieldByName(Column.FieldName).AsString;
  DBGrid8.Columns.RestoreDefaults;
  Column.Title.Font.Style := [fsBold];
end;

procedure TFrmCadClientes.DBGridResgatarValeCellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    Cliente.vContaCorrenteCli._marcaDesmarcaLinha(Cliente.vContaCorrenteCli.vResgateValeCupom.dataSet);
end;

procedure TFrmCadClientes.DBGridResgatarValeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if (Trim(Column.Field.Dataset.FieldbyName('VALIDADO').AsString) <> '') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clBlue
    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    DBGridResgatarVale.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(DBGridResgatarVale.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmCadClientes.DBGridResgatarValeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = VK_SPACE) then
  	Cliente.vContaCorrenteCli._marcaDesmarcaLinha(Cliente.vContaCorrenteCli.vResgateValeCupom.dataSet);
end;

procedure TFrmCadClientes.DBGridTempValeTrocaDblClick(Sender: TObject);
begin
  Cliente.vContaCorrenteCli.marcarDesmarcaLinha(Cliente.vContaCorrenteCli.vRegrasValeTrocaProgFid.fTempValeTroca);
end;

procedure TFrmCadClientes.DBGridTempValeTrocaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(Sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(Sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

  if TDBGrid(Sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadClientes.DBGridTempValeTrocaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    BitBtn62Click(Sender)
  else if Key = VK_SPACE then
    Cliente.vContaCorrenteCli.marcarDesmarcaLinha(Cliente.vContaCorrenteCli.vRegrasValeTrocaProgFid.fTempValeTroca);
end;

procedure TFrmCadClientes.DBLookupComboBox10Exit(Sender: TObject);
begin
  inherited;
  //  PageControl3.ActivePage := TabSheet5;
  //  if (Self.Enabled) and (Self.Visible) and (DBEdit15.CanFocus) then
  //    DBEdit15.SetFocus;
end;

procedure TFrmCadClientes.DBLookupComboBox11Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if not Cliente.AdCliente.SetNomeBairro then
    	if (Self.Enabled) and (Self.Visible) and (DBEdit76.CanFocus) then
      	DBEdit76.SetFocus;
end;

procedure TFrmCadClientes.DBLookupComboBox12Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if not Cliente.AdCliente.SetNomeCidade then
    	if (Self.Enabled) and (Self.Visible) and (DBEdit77.CanFocus) then
      	DBEdit77.SetFocus;
end;

procedure TFrmCadClientes.DBLookupComboBox13Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if Cliente.AdCliente.dataSet.FieldByName('ESTADO').IsNull then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('ESTADOS');
        if vDadosIni.vPesquisa <> '' then
          Cliente.AdCliente.dataSet.FieldByName('ESTADO').asstring :=
            Cliente.AdCliente.LocalizaUF(strtoint(vDadosIni.vPesquisa));
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox13.CanFocus) then        
        	DBLookupComboBox13.SetFocus;
        exit;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  //  if not Cliente.AdCliente.dataSet.FieldByName('ESTADO').IsNull then
  DBEdit67.Visible := true;
end;

procedure TFrmCadClientes.DBLookupComboBox13KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vEstado: TEstados;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI014', 'PESQUISAR', '', 'ESTADOS', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('ESTADOS');
        if vDadosIni.vPesquisa <> '' then
        begin
          Cliente.AdCliente.dataSet.FieldByName('ESTADO').asstring :=
            Cliente.AdCliente.LocalizaUF(strtoint(vDadosIni.vPesquisa));
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('CLI015', 'CADASTRAR', '', 'ESTADOS', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vEstado.CadEstado(1);
        if vDadosIni.vPesquisa <> '' then
        begin
          Cliente.AdCliente.dataSet.FieldByName('ESTADO').asstring :=
            Cliente.AdCliente.LocalizaUF(strtoint(vDadosIni.vPesquisa));
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadClientes.DBLookupComboBox15Exit(Sender: TObject);
begin
  inherited;
  EditHw1.AsValue := DBLookupComboBox15.KeyValue;
end;

procedure TFrmCadClientes.DBLookupComboBox16Exit(Sender: TObject);
begin
  inherited;
  EditHw2.AsValue := DBLookupComboBox16.KeyValue;

  Cliente.Contratos._habilitarBoleto;

  if Cliente.Contratos.vBOLETO = 'S' then
  begin
    MaskEdit16.Enabled := true;
    CheckBox5.Checked := true;
    CheckBox5.Enabled := false;
  end
  else
  begin
    MaskEdit16.Enabled := false;
    CheckBox5.Enabled := false;
    CheckBox5.Checked := false;
  end;
end;

procedure TFrmCadClientes.DBLookupComboBox19Exit(Sender: TObject);
begin
  inherited;
  EditHw5.AsValue := DBLookupComboBox19.KeyValue;
end;

procedure TFrmCadClientes.DBLookupComboBox4KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  obFaturamento: TFaturamento;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI016', 'PESQUISAR', '', 'TIPO_FATURAMENTO', '', Cliente.buscas, true)
      then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('TIPO_FATURAMENTO');
        if vDadosIni.vPesquisa <> '' then
          Cliente.dataSet.FieldByName('CODIGO_FATURAMENTO').asinteger :=
            strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('CLI017', 'CADASTRAR', '', 'TIPO_FATURAMENTO', '', Cliente.buscas, true)
      then
    begin
      try
        Screen.Cursor := crHourGlass;
        obFaturamento.CadTipoFaturamento(1);
        Cliente.abreTipoFaturamento;
        if vDadosIni.vPesquisa <> '' then
          Cliente.dataSet.FieldByName('CODIGO_FATURAMENTO').asinteger :=
            strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadClientes.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
  	if not Cliente.SetNomeEstado then
    	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then      
      	DBLookupComboBox1.SetFocus;
//    if Cliente.dataSet.FieldByName('CODIGO_UF').IsNull then
//    begin
//      Application.MessageBox('UF não informado.' + chr(13) + 'Campo Requerido.', 'Aviso', MB_OK +
//        MB_ICONWARNING + MB_DEFBUTTON1);
//      if (Self.Enabled) and (Self.Visible) and (DBLookupComBox1.CanFocus) then
//        DBLookupComboBox1.SetFocus;
//    end
end;

procedure TFrmCadClientes.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vEstado: TEstados;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI014', 'PESQUISAR', '', 'ESTADOS', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Cliente.abreEstados;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('ESTADOS');
        if vDadosIni.vPesquisa <> '' then
          Cliente.dataSet.FieldByName('CODIGO_UF').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('CLI015', 'CADASTRAR', '', 'ESTADOS', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vEstado.CadEstado(1);
        Cliente.abreEstados;
        if vDadosIni.vPesquisa <> '' then
          Cliente.dataSet.FieldByName('CODIGO_UF').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadClientes.DBLookupComboBox29Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn_5) and (activecontrol <> BitBtn_6) and (not clicouNoX) then
  	if not Cliente.SetNomeEstado then
    	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox29.CanFocus) then      
      	DBLookupComboBox29.SetFocus;
end;

procedure TFrmCadClientes.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if not Cliente.SetNomeTipoCliente then
    	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then      
      	DBLookupComboBox2.SetFocus;
end;

procedure TFrmCadClientes.DBLookupComboBox2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('CLI150', 'PESQUISAR', '', '', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Cliente.CadTipoCliente(1);
        
        cliente.abreTipoCliente;
        if vDadosIni.vPesquisa <> '' then
        begin
          Cliente.dataSet.FieldByName('CODIGO_TIPO').AsInteger := strtoint(vDadosIni.vPesquisa);

          if Cliente.dataSet.FieldByName('CODIGO_TIPO').AsInteger > 0 then
          begin
            Cliente.SqlOpen(' select codigo_tipo, descricao_tipo from tipos_clientes ' +
              ' where codigo_tipo = ' + IntToStr(Cliente.dataSet.FieldByName('CODIGO_TIPO').AsInteger), Cliente.buscas);

            if Cliente.buscas.FieldByName('CODIGO_TIPO').AsInteger > 0 then
              Cliente.dataSet.FieldByName('DESC_TP_CLIENTE').AsString := trim(Cliente.buscas.FieldByName('DESCRICAO_TIPO').AsString);
          end;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadClientes.DBLookupComboBox33Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn_5) and (activecontrol <> BitBtn_6) and (not clicouNoX) then
    if not Cliente.SetNomeTipoCliente then
    	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox33.CanFocus) then      
      	DBLookupComboBox33.SetFocus;
end;

procedure TFrmCadClientes.DBLookupComboBox33KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('CLI150', 'PESQUISAR', '', '', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Cliente.CadTipoCliente(1);

        Cliente.ExecutaComandosSql('select codigo_tipo, descricao_tipo from tipos_clientes where ativo = 1', False);
			  Cliente.vLKTemp2.setDadosDataSet('CODIGO_TIPO', 'DESCRICAO_TIPO', Cliente.buscas,  DBLookupComboBox33);
        if vDadosIni.vPesquisa <> '' then
        begin
          Cliente.dataSet.FieldByName('CODIGO_TIPO').AsInteger := strtoint(vDadosIni.vPesquisa);

          if Cliente.dataSet.FieldByName('CODIGO_TIPO').AsInteger > 0 then
          begin
            Cliente.SqlOpen(' select codigo_tipo, descricao_tipo from tipos_clientes ' +
              ' where codigo_tipo = ' + IntToStr(Cliente.dataSet.FieldByName('CODIGO_TIPO').AsInteger), Cliente.buscas);

            if Cliente.buscas.FieldByName('CODIGO_TIPO').AsInteger > 0 then
              Cliente.dataSet.FieldByName('DESC_TP_CLIENTE').AsString := trim(Cliente.buscas.FieldByName('DESCRICAO_TIPO').AsString);
          end;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadClientes.DBLookupComboBox35Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn_5) and (activecontrol <> BitBtn_6) and (not clicouNoX) then
  	if not Cliente.SetNomeEstadoCobranca then
    	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox35.CanFocus) then      
      	DBLookupComboBox35.SetFocus;
end;

procedure TFrmCadClientes.DBLookupComboBox3Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
  	if not Cliente.SetNomeEstadoCobranca then
    	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then      
      	DBLookupComboBox3.SetFocus;
//    if Cliente.dataSet.FieldByName('EST_CODIGO_UF').IsNull then
//    begin
//      Application.MessageBox('UF de cobrança não informado.' + chr(13) + 'Campo Requerido.',
//        'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
//			if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
//        DBLookupComboBox3.SetFocus;
//    end
end;

procedure TFrmCadClientes.DBLookupComboBox3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vEstado: TEstados;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('CLI022', 'PESQUISAR', '', 'ESTADOS', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        Cliente.abreEstadosC;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('ESTADOS');
        if vDadosIni.vPesquisa <> '' then
          Cliente.dataSet.FieldByName('EST_CODIGO_UF').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('CLI023', 'CADASTRAR', '', 'ESTADOS', '', Cliente.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vEstado.CadEstado(1);
        Cliente.abreEstadosC;
        if vDadosIni.vPesquisa <> '' then
          Cliente.dataSet.FieldByName('EST_CODIGO_UF').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadClientes.DBLookupComboBox6Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if not Cliente.SetNomeCidade then
    	if (Self.Enabled) and (Self.Visible) and (DBEdit11.CanFocus) then      
      	DBEdit11.SetFocus;
end;

procedure TFrmCadClientes.DBLookupComboBox7Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if not Cliente.SetNomeBairro then
    	if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then      
      	DBEdit10.SetFocus;
end;

procedure TFrmCadClientes.DBLookupComboBox8Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if not Cliente.SetNomeBairroCobranca then
    	if (Self.Enabled) and (Self.Visible) and (DBEdit17.CanFocus) then      
      	DBEdit17.SetFocus;
end;

procedure TFrmCadClientes.DBLookupComboBox9Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (not clicouNoX) then
    if not Cliente.SetNomeCidadeCobranca then
      if trim(Cliente.dataSet.FieldByName('CIDA_COBRANCA').AsString) = '' then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
        	DBEdit16.SetFocus;
end;

procedure TFrmCadClientes.DesmarcarTodosClientesClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Cliente._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadClientes.DetailBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  vInc := 0;
end;

procedure TFrmCadClientes.DtFotosCliDataChange(Sender: TObject; Field: TField);
begin
  inherited;
 Cliente._recuperarFotoCliente;
end;

procedure TFrmCadClientes.Edit10Exit(Sender: TObject);
begin
  inherited;
  Cliente.vReds._aplicarFiltro(Edit10.Text, Edit5.Text, Edit6.Text, Edit7.Text, Edit8.Text, Edit9.Text, CheckBox8.Checked, CheckBox9.Checked );
end;

procedure TFrmCadClientes.Edit11Change(Sender: TObject);
begin
  inherited;
  TClientDataSet(DBGrid17.DataSource.DataSet).Filter := 'filter like ' + QuotedStr('%' + Trim(Edit11.Text) + '%');
  TClientDataSet(DBGrid17.DataSource.DataSet).Filtered := Trim(Edit11.Text) <> '';
end;

procedure TFrmCadClientes.EditFiltroChange(Sender: TObject);
begin
  if (trim(EditFiltro.Text) <> '') then
  begin
    Cliente.vContaCorrenteCli.vRegrasValeTrocaProgFid.IndexFieldNames :=
      vDadosIni.IfThen(ComboBoxFiltro.ItemIndex = 0, 'NUM_FAB_PROD', 'DESCR_PROD');
    Cliente.vContaCorrenteCli.vRegrasValeTrocaProgFid.FindNearest([trim(EditFiltro.Text)]);
  end
  else
  begin
    Cliente.vContaCorrenteCli.vRegrasValeTrocaProgFid.IndexFieldNames := 'CODIGO';
    Cliente.vContaCorrenteCli.vRegrasValeTrocaProgFid.FindNearest([1]);
  end;
end;

procedure TFrmCadClientes.Edit4Enter(Sender: TObject);
begin
  inherited;
  DBGrid8.Columns[0].Showing;
end;

procedure TFrmCadClientes.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    Cliente.vCodigoForn.buscarPalavraOuFrase(Edit4.Text)
      //  else if Key = VK_DELETE then
//    SpeedButton10.Click
  else if Key = VK_ESCAPE then
    SpeedButton13.Click
  else if key = VK_TAB then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid8.CanFocus) then
    	DBGrid8.SetFocus;
  end
  else if key = VK_UP then
    Cliente.vCodigoForn.dataSet.Prior
  else if key = VK_DOWN then
    Cliente.vCodigoForn.dataSet.Next;
end;

procedure TFrmCadClientes.EditarQtdeValeTrocaClick(Sender: TObject);
begin
  if not Cliente.vContaCorrenteCli.vRegrasValeTrocaProgFid.editarQtdeMercadoriasTroca(Cliente.dataSet.FieldByName('cod_cliente').AsInteger, LabelPontosValeTroca, LabelValorValeTroca) then
    exit;
end;

procedure TFrmCadClientes.EditFiscal1Change(Sender: TObject);
begin
  inherited;
  if (EditFiscal1.Text <> '') then
   Cliente.fTempAtributos.Locate('DESCRICAO_ATRIBUTO', trim(EditFiscal1.Text), [loCaseInsensitive, loPartialKey]);
end;

procedure TFrmCadClientes.EditHw1Exit(Sender: TObject);
begin
  inherited;
  DBLookupComboBox15.KeyValue := EditHw1.AsInteger;
end;

procedure TFrmCadClientes.EditHw1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SERVICOS_EMP', ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa, 'Tipo de Serviço');
    if trim(vDadosIni.vPesquisa) <> '' then
      EditHw1.AsValue := StrToFloat(vDadosIni.vPesquisa);
  end;
end;

procedure TFrmCadClientes.EditHw2Exit(Sender: TObject);
begin
  inherited;
  DBLookupComboBox16.KeyValue := EditHw2.AsInteger;

  Cliente.Contratos._habilitarBoleto;

  if Cliente.Contratos.vBOLETO = 'S' then
  begin
    MaskEdit16.Enabled := true;
    CheckBox5.Checked := true;
    CheckBox5.Enabled := false;
  end
  else
  begin
    MaskEdit16.Enabled := false;
    CheckBox5.Checked := false;
    CheckBox5.Enabled := false;
  end;
end;

procedure TFrmCadClientes.EditHw5Exit(Sender: TObject);
begin
  inherited;
  DBLookupComboBox19.KeyValue := EditHw5.AsInteger;
end;

procedure TFrmCadClientes.EditHw5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    Cliente.Contratos._consultar_vendedor;
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COLABORADOR', ' AND COD_VENDEDOR IN (' +
      Cliente.Contratos.vSqlAdcional + '', 'Consulta de Vendedor');
    if trim(vDadosIni.vPesquisa) <> '' then
      EditHw5.AsValue := StrToFloat(vDadosIni.vPesquisa);
  end;
end;

procedure TFrmCadClientes.EditHwPontosValeExit(Sender: TObject);
begin
  // Buscas dados taxa conversão
  vDadosIni.buscasdadostaxaConv(Cliente.vContaCorrenteCli.buscas);
  EditHwValorVale.AsValue :=
  	 (EditHwPontosVale.AsValue * Cliente.vContaCorrenteCli.buscas.FieldByName('PERC_PROG_FID').AsFloat);
  lbValorVale.Caption := 'R$ ' + FormatFloat('#,##0.00',
    (EditHwPontosVale.AsValue * Cliente.vContaCorrenteCli.buscas.FieldByName('PERC_PROG_FID').AsFloat));

  if EditHwValorVale.AsValue > 0 then
    if (Self.Enabled) and (Self.Visible) and (BitBtn62.CanFocus) then
      BitBtn62.SetFocus;
end;

procedure TFrmCadClientes.EditHwValorValeExit(Sender: TObject);
begin
  // Buscas dados taxa conversão
  vDadosIni.buscasdadostaxaConv(Cliente.vContaCorrenteCli.buscas);
  EditHwPontosVale.AsValue :=
  	 (EditHwValorVale.AsValue / Cliente.vContaCorrenteCli.buscas.FieldByName('PERC_PROG_FID').AsFloat);
end;

procedure TFrmCadClientes.ed_contato_pla_aplicativoExit(Sender: TObject);
begin
  inherited;
  if not (Cliente.ContatoMsg.dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  if vCodPlataforma = vDadosIni.IfThen(ed_contato_pla_aplicativo.KeyValue = Null, 0, ed_contato_pla_aplicativo.KeyValue) then
  	Exit;

  ed_contato_pla_identificacao.Field.AsString := '';

  if vDadosIni.IfThen(ed_contato_pla_aplicativo.KeyValue = Null, 0, ed_contato_pla_aplicativo.KeyValue) <= 0 then
  	lb_contato_pla_identificacao.Caption := 'Identificação'
  else 
  	lb_contato_pla_identificacao.Caption :=
    	Copy(trim(ed_contato_pla_aplicativo.Text), 1, 1) +
      LowerCase(Copy(trim(ed_contato_pla_aplicativo.Text), 2, Length(trim(ed_contato_pla_aplicativo.Text)) - 1));

  if vDadosIni.retornaNomeAplicativo(vDadosIni.IfThen(ed_contato_pla_aplicativo.KeyValue = Null, 0, ed_contato_pla_aplicativo.KeyValue)) = 'WHATSAPP' then
  	Cliente.ContatoMsg.dataSet.FieldByName('IDENTIFICADOR').EditMask := '(99) 99999-9999;0;_'
  else
  	Cliente.ContatoMsg.dataSet.FieldByName('IDENTIFICADOR').EditMask := '';

  vCodPlataforma := vDadosIni.IfThen(ed_contato_pla_aplicativo.KeyValue = Null, 0, ed_contato_pla_aplicativo.KeyValue);
end;

procedure TFrmCadClientes.ExecutarFormResize;
begin
	if (ScrollBox3.Height >= alturaDefault) and (ScrollBox3.Width >= larguraDefault) then
  begin
  	panel6.Align := alClient;
  end
  else
  begin
    if ScrollBox3.Height <= alturaDefault then
    begin
      panel6.Align := alTop;
      panel6.Height :=
      	vDadosIni.IfThen(GroupBox11.Visible, GroupBox11.Height, 0) +
	  		vDadosIni.IfThen(GroupBox33.Visible, GroupBox33.Height, 0) +
	  	  vDadosIni.IfThen(GroupBox34.Visible, GroupBox34.Height, 0) +
  		  vDadosIni.IfThen(GroupBox36.Visible, GroupBox36.Height, 0);
    end;
//    if ScrollBox3.Width <= larguraDefault then
//    begin
//    	panel6.Align := alTop;
//      panel6.Width :=
//        vDadosIni.IfThen(GroupBox11.Visible, GroupBox11.Height, 0) +
//        vDadosIni.IfThen(GroupBox33.Visible, GroupBox33.Height, 0) +
//        vDadosIni.IfThen(GroupBox34.Visible, GroupBox34.Height, 0) +
//        vDadosIni.IfThen(GroupBox36.Visible, GroupBox36.Height, 0);
//    end;
  end;

  if (ScrollBox3.Height >= alturaForm) and (ScrollBox3.Width >= larguraForm) then
  begin
    panel4.Align := alClient;
//    panel6.Align := alClient;
  end
  else
  begin
    if ScrollBox3.Height <= alturaForm then
    begin
      panel4.Align := alNone;
      panel5.Align := alNone;
//      panel6.Align := alNone;
      panel4.Height := alturaDefault;
      panel5.Height := alturaDefault;
//      panel6.Height :=
//      	vDadosIni.IfThen(GroupBox11.Visible, GroupBox11.Height, 0) +
//	  		vDadosIni.IfThen(GroupBox33.Visible, GroupBox33.Height, 0) +
//	  	  vDadosIni.IfThen(GroupBox34.Visible, GroupBox34.Height, 0) +
//  		  vDadosIni.IfThen(GroupBox36.Visible, GroupBox36.Height, 0);
    end;
//    if ScrollBox3.Width <= larguraForm then
//    begin
//      panel4.Align := alNone;
//      panel5.Align := alNone;
////      panel6.Align := alNone;
//      panel4.Width := larguraDefault;
//      panel5.Width := larguraDefault;
////      panel6.Width :=
////        vDadosIni.IfThen(GroupBox11.Visible, GroupBox11.Height, 0) +
////        vDadosIni.IfThen(GroupBox33.Visible, GroupBox33.Height, 0) +
////        vDadosIni.IfThen(GroupBox34.Visible, GroupBox34.Height, 0) +
////        vDadosIni.IfThen(GroupBox36.Visible, GroupBox36.Height, 0);
//    end;
  end;

  if (pnOpcaoDireitaClientes.Visible) then
  begin
  	if (vDadosIni.IfThen(pnObservacaoCl.Visible, pnObservacaoCl.Height, 0) +
        vDadosIni.IfThen(SplitterObservacaoBottomCl.Visible, SplitterObservacaoBottomCl.Height, 0) +
        vDadosIni.IfThen(pnObservacaoSpcCl.Visible, pnObservacaoSpcCl.Height, 0) +
        vDadosIni.IfThen(SplitterObservacaoSpcBottomCl.Visible, SplitterObservacaoSpcBottomCl.Height, 0) +
        vDadosIni.IfThen(pnObservacaoReqOsCl.Visible, pnObservacaoReqOsCl.Height, 0) > pnOpcaoDireitaClientes.Height) then
    begin
      AjustarBarraLateral(False);

      Splitter1.Align := alLeft;
      Splitter1.Align := alRight;
    end;
  end;
end;

procedure TFrmCadClientes.FormActivate(Sender: TObject);
begin
  inherited;
  if (vDadosIni.vTipoForm = 1) then
  begin
    if (Cliente.dataSet.State in [dsEdit]) then
    	BitBtn5Click(Sender);

    if not (Cliente.dataSet.State in [dsInsert, dsEdit]) then
    begin
      if fsModal in Self.FormState then
      begin
        Self.Height := 665;
        Self.Width  := 860;
        if Self.Position <> poMainFormCenter then
          Self.Position := poMainFormCenter;
      end;

      Cliente.abreClientes(0);
      BitBtn3Click(Sender);

      TelaCadastro := vDadosIni.vTipoForm;
      vDadosIni.vPesquisa := '';
      vDadosIni.vTipoForm := 0;
    end;
  end
  else if (vDadosIni.vTipoForm = 3)
  	and (vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'EDITAR_CLIENTE') then
  begin
  	if not (Cliente.dataSet.State in [dsInsert, dsEdit]) then
    begin
    	if fsModal in Self.FormState then
      begin
      	Self.Height := 665;
        Self.Width  := 860;
        if Self.Position <> poMainFormCenter then
        	Self.Position := poMainFormCenter;
      end;

      try
        vCodCliente := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
      except
        vCodCliente := 0;
      end;
      if vCodCliente > 0 then
      begin
      	try
        	Cliente.strTmp := 'usarpossivecliente';
          Cliente.abreClientes(vCodCliente, False);
          SpeedButton1Click(SpeedButton1);
          if (Cliente.dataSet.State in [dsInsert, dsEdit]) then
            Cliente.dataSet.FieldByName('ATIVO').AsInteger := 1;
        finally
        	Cliente.strTmp := '';
        end;
      end;
    end;

    TelaCadastro := vDadosIni.vTipoForm;
    vDadosIni.vPesquisa := '';
    vDadosIni.vTipoForm := 0;
  end
end;

procedure TFrmCadClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  gravaConfiguracoesFormRegistro;
  
  if not Assigned(DBGrid18.DataSource) then
    Exit;
  if not Assigned(DBGrid18.DataSource.DataSet) then
    Exit;

  if not PrimeiraPesquisa2 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid18, GridCfg2, cdsGrid2,
    cdsColunas2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
  vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid18, GridCfg2, true, ListPositions2, cdsGrid2);

  //  ActiveControl := BitBtn2;
  Cliente.Cancel;
  Cliente.RollBackTransacao;

  if Cliente.AdCliente <> nil then
  begin
    Cliente.AdCliente.Free;
    Cliente.AdCliente := nil;
  end;
  if TelaCadastro <> 2 then
  begin
    Cliente.Free;
    Cliente := nil;
  end;

  if Assigned(lk_tipo_contato) then
    lk_tipo_contato.Free;

  if Assigned(lk_tipo_contato_pla) then
    lk_tipo_contato_pla.Free;
  if Assigned(lk_aplicativo_contato_pla) then
    lk_aplicativo_contato_pla.Free;

  if Assigned(lk_enddoc_localidade) then
    FreeAndNil(lk_enddoc_localidade);

  if Assigned(lk_finalidade) then
    FreeAndNil(lk_finalidade);

  if Assigned(lk_issretido) then
    lk_issretido.Free;

  if Assigned(lk_tipoobranfse) then
    lk_tipoobranfse.Free;

  if Assigned(lkRetFed) then
    lkRetFed.Free;

  if Assigned(lkRetFedNFS) then
    lkRetFedNFS.Free;

  Action := caFree;
  FrmCadClientes := nil;
  {if Cliente.dataSet.State = dsInsert then
  begin
    if Application.MessageBox('Você estava cadastrando um novo cliente.' + chr(13) + 'Deseja cancelar o cadastro e sair?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYes then
    begin
      Cliente.Cancel;
      Cliente.RollBackTransacao;
    end
    else
    begin
      TabSheet3.Show;
      if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
        DBEdit6.SetFocus;
      abort;
    end
  end
  else
  begin
    Cliente.Post;
    if not Cliente.confirmaAlteracao then
    begin
      TabSheet3.Show;
      Cliente.dataSet.Edit;
      if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
        DBEdit6.SetFocus;
      abort;
    end
    else if Cliente.emTransacao then
    begin
      Cliente.Cancel;
      Cliente.RollBackTransacao;
    end;
  end;}

end;

procedure TFrmCadClientes.FormCreate(Sender: TObject);
var
  i: integer;
begin
	vCriou := 0;
  
  inherited;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'CADASTRAR_CLIENTE' then
  begin
  	if DtmClientes = nil then
      DtmClientes := TDtmClientes.Create(DtmClientes);
    vDadosIni.vTipoForm := 1;
    vDadosIni.vModalOuChild := 'M';
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'EDITAR_CLIENTE' then
  begin
    if DtmClientes = nil then
      DtmClientes := TDtmClientes.Create(DtmClientes);
    vDadosIni.vTipoForm := 2;
    vDadosIni.vModalOuChild := 'M';
    try
      vCodCliente := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
    except
      vCodCliente := 0;
    end;
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'CLIENTE' then
  begin
    if DtmClientes = nil then
      DtmClientes := TDtmClientes.Create(DtmClientes);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'ENVIAR_EMAIL' then
  begin
    if DtmClientes = nil then
      DtmClientes := TDtmClientes.Create(DtmClientes);
    vDadosIni.vTipoForm := 7;
    vDadosIni.vModalOuChild := 'M';
    try
    	vCodCliente := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
    except
    	vCodCliente := 0;
    end;
    FrmCadClientes := TFrmCadClientes(self);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'EXTRATO_CLIENTE' then
  begin
    if DtmClientes = nil then
      DtmClientes := TDtmClientes.Create(DtmClientes);
    vDadosIni.vTipoForm := 8;
    vDadosIni.vModalOuChild := 'M';
    try
    	vCodCliente := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
    except
    	vCodCliente := 0;
    end;
    FrmCadClientes := TFrmCadClientes(self);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'ANIVERSARIANTE_CLIENTE' then
  begin
    if DtmClientes = nil then
      DtmClientes := TDtmClientes.Create(DtmClientes);
    vDadosIni.vTipoForm := 9;
    vDadosIni.vModalOuChild := 'M';
    FrmCadClientes := TFrmCadClientes(self);
  end;
  TelaCadastro := vDadosIni.vTipoForm;

  vHabObservacaoCl := False;
  vHabObservacaoSpcCl := False;
  vHabObservacaoReqOsCl := False;

  setNomeTabela('CLIENTES', vDadosIni.vEmp.vCampoPadraoCli);
  Cliente := TCadClientes.create;

  //  TipoCliente := TTipoCliente.Create;
    //  Bairro := TBairros.Create;
    //  Cidade := TCidades.Create;
    //  Estado := TEstados.Create;
//  BairroC := TBairrosC.Create;
//  CidadeC := TCidadesC.Create;
//  EstadoC := TEstadosC.Create;
//  Convenio := TConvenioCliente.Create;
  //  Faturamento := TFaturamento.create;
//  Contador := TContadorCli.create;
  Cliente.abreClientes(-1);
  alturaForm := TabSheet3.ClientHeight;
  larguraForm := TabSheet3.ClientWidth;
  alturaDefault := panel6.Height;
  larguraDefault := panel6.Width;
  tsRelCliFornec.TabVisible := false;
  tsProdutosFornec.TabVisible := false;
  tsFichaFin.TabVisible := false;
  for I := 0 to PageControl3.PageCount - 1 do
    PageControl3.Pages[i].TabVisible := false;
  for I := 0 to PageControl1.PageCount - 1 do
    PageControl1.Pages[i].TabVisible := false;
//  for I := 0 to PageControl4.PageCount - 1 do
//    PageControl4.Pages[i].TabVisible := false;

  tsCodigoFornecedor.TabVisible := false;
  tsContratos.TabVisible := false;
  tsDadosFiscais.TabVisible := True;
  tsContaCorrente.TabVisible := false;
  tsValeTroca.TabVisible := false;
  tsDocProgFid.TabVisible := false;
  tsResgatarVale.TabVisible := false;
  tsConsContaCorrente.TabVisible := false;
  tsIncluirContaCorrente.TabVisible := false;

  MenuLateralExibirObservacaoCl.Checked := _LerConfiguracoesRegistroBoolean(MenuLateralExibirObservacaoCl.Name, True);
  MenuLateralExibirObservacaoSpcCl.Checked := _LerConfiguracoesRegistroBoolean(MenuLateralExibirObservacaoSpcCl.Name);
  MenuLateralExibirObservacaoReqOSCl.Checked := _LerConfiguracoesRegistroBoolean(MenuLateralExibirObservacaoReqOSCl.Name);

  ckMenuLateral.Checked := _LerConfiguracoesRegistroBoolean(ckMenuLateral.Name + 'Cl', True);

  pnObservacaoCl.Height := _LerConfiguracoesRegistroInteger(pnObservacaoCl.Name, vDadosIni.IfThen(pnObservacaoCl.Height < 120, 120, pnObservacaoCl.Height));
  pnObservacaoSpcCl.Height := _LerConfiguracoesRegistroInteger(pnObservacaoSpcCl.Name, vDadosIni.IfThen(pnObservacaoSpcCl.Height < 60, 60, pnObservacaoSpcCl.Height));
  pnObservacaoReqOsCl.Height := _LerConfiguracoesRegistroInteger(pnObservacaoReqOsCl.Name, vDadosIni.IfThen(pnObservacaoReqOsCl.Height < 60, 60, pnObservacaoReqOsCl.Height));

  pnOpcaoDireitaClientes.Width := _LerConfiguracoesRegistroInteger(pnOpcaoDireitaClientes.Name, vDadosIni.IfThen(pnOpcaoDireitaClientes.Width < 180, 180, pnOpcaoDireitaClientes.Width));

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_INSERT) and (TabSheet2.Visible) then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if (key = VK_INSERT) and (TabSheet7.Visible) then
  begin
    ActiveControl := BitBtn10;
    BitBtn10Click(Sender);
  end
  else if (key = VK_F11) then
  begin
    if (CheckBox7.visible) and (PageControl1.ActivePage = TabSheet2) then
      CheckBox7.Checked := not CheckBox7.Checked;
  end
  else if (key = VK_F6) then
  begin
  	if (ckLixeira.visible) and (PageControl1.ActivePage = TabSheet2) then
      ckLixeira.Checked := not ckLixeira.Checked;
  end
  else if key = VK_ESCAPE then
  begin
    if (Cliente.dataSet.State in [dsEdit, dsInsert]) and (TabSheet1.Visible) then
    begin
      if ActiveControl is Tdbedit then
      begin
        if
          TdataSet(TdbEdit(ActiveControl).DataSource.DataSet).FindField(TdbEdit(ActiveControl).DataField).EditMask = '' then
          if Application.MessageBox('Deseja sair desta tela de cadastro?.', 'Confirmação', MB_YESNO
            + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
          begin
            ActiveControl := BitBtn5;
            BitBtn5Click(Sender);
          end;
      end
      else
      begin
        ActiveControl := BitBtn5;
        BitBtn5Click(Sender);
      end;
    end
    else if (Cliente.AdCliente <> nil) and (Cliente.AdCliente.dataSet.State in [dsEdit, dsInsert])
      and (TabSheet8.Visible) then
    begin
      if ActiveControl is Tdbedit then
      begin
        if
          TdataSet(TdbEdit(ActiveControl).DataSource.DataSet).FindField(TdbEdit(ActiveControl).DataField).EditMask = '' then
          if Application.MessageBox('Deseja sair desta tela de cadastro?.', 'Confirmação', MB_YESNO
            + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
          begin
            ActiveControl := BitBtn15;
            BitBtn15Click(Sender);
          end;
      end
      else
      begin
        ActiveControl := BitBtn15;
        BitBtn15Click(Sender);
      end;
    end;
  end
  else if (Key = VK_F5) and (tsConsContaCorrente.Visible) then
    BitBtnAtualizarExtratoContaCorrenteClick(Sender);   
end;

procedure TFrmCadClientes.FormResize(Sender: TObject);
begin
  inherited;
  ExecutarFormResize;
end;

procedure TFrmCadClientes.FormShow(Sender: TObject);
var
	vLista, vLista2: TStrings;
	vDataBanco: TDateTime;
  I, J: Integer;
begin
	if not Self.Enabled then
    Exit;

  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'CADASTRAR_CLIENTE' then
  begin
    if DtmClientes = nil then
      DtmClientes := TDtmClientes.Create(DtmClientes);
    vDadosIni.vTipoForm := 1;
    vDadosIni.vModalOuChild := 'M';
  end
	else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'EDITAR_CLIENTE' then
  begin
    if DtmClientes = nil then
      DtmClientes := TDtmClientes.Create(DtmClientes);
    vDadosIni.vTipoForm := 2;
    vDadosIni.vModalOuChild := 'M';
    try
      vCodCliente := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
    except
      vCodCliente := 0;
    end;
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'CLIENTE' then
  begin
    if DtmClientes = nil then
      DtmClientes := TDtmClientes.Create(DtmClientes);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'ENVIAR_EMAIL' then
  begin
    if DtmClientes = nil then
      DtmClientes := TDtmClientes.Create(DtmClientes);
    vDadosIni.vTipoForm := 7;
    vDadosIni.vModalOuChild := 'M';
    try
    	vCodCliente := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
    except
    	vCodCliente := 0;
    end;
    FrmCadClientes := TFrmCadClientes(self);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'EXTRATO_CLIENTE' then
  begin
    if DtmClientes = nil then
      DtmClientes := TDtmClientes.Create(DtmClientes);
    vDadosIni.vTipoForm := 8;
    vDadosIni.vModalOuChild := 'M';
    try
    	vCodCliente := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
    except
      vCodCliente := 0;
    end;
    FrmCadClientes := TFrmCadClientes(self);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'ANIVERSARIANTE_CLIENTE' then
  begin
    if DtmClientes = nil then
      DtmClientes := TDtmClientes.Create(DtmClientes);
    vDadosIni.vTipoForm := 9;
    vDadosIni.vModalOuChild := 'M';
    FrmCadClientes := TFrmCadClientes(self);
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  vDadosIni.vPesquisa := '';
  vDadosIni.vTipoForm := 0;

  SpeedButton37.Caption := 'v';
  SpeedButton37.Tag := 0;
  Panel2.Height := 57;
  TabSheet3.TabVisible := false;
  tsCadastroSimples.TabVisible := false;
  tsCarteiras.TabVisible := false;
  tsValeTroca.TabVisible := false;
  tsDocProgFid.TabVisible := false;
  tsTransSaldo.TabVisible := false;
  tsECommerce.TabVisible := false;
  tsECommerce2.TabVisible := false;

  pgDadosAd.Align := alClient;
  pgDadosAd.ActivePage := tsDadosAdOutros;
  ScrollBox4.Parent := tsDadosAdOutros;

  if (not vDadosIni.vRegistro.vSisAutomacao) and (vDadosIni.vRegistro.vSisSupervisor) then
  begin
    TabSheet4.TabVisible := false;
    TabSheet5.TabVisible := false;
    tsIdetificacoFotografica.TabVisible := false;
  end;
  TabSheet6.TabVisible := false;
  if (vCriou = 0) and (vShow <> 1) then
  begin
    DBGrid1.DataSource := DtmClientes.dsClientes;

    DBMemoObsCl.DataSource := DtmClientes.dsClientes;
    DBMemoObsSpcCli.DataSource := DtmClientes.dsClientes;
    DBMemoObsReqOSCli.DataSource := DtmClientes.dsClientes;

    inherited;
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
      vAlterarNomeDtSet2, GridCfg2, DBGrid18, cdsGrid2, cdsColunas2, trans2, ListGridsAndDataSets2,
      ListPositions2, nomeDTSEt2, PrimeiraPesquisa2, vCamposPadraoRegistro2, usuario2);
  end;

  try
    vLista := TStringList.Create;
    vLista2 := TStringList.Create;

    vLista := vDadosIni.getConfSisBlob('contratos_clientes_status_contratos', Cliente.buscas);
    if vLista.Count > 0 then
    begin
      ComboBox14.Items.Clear;

      ComboBox14.Items.Add('Todos');
      for I := 0 to vLista.Count - 1 do
      begin
        vLista2 := vDadosIni.SplitS(vLista[i]);
        for J := 0 to vLista2.Count - 1 do
        begin
          if trim(vLista2[j]) <> '' then
          begin
            if ComboBox14.Items.IndexOf(trim(vLista2[j])) = -1 then
              ComboBox14.Items.Add(trim(vLista2[j]));
          end;
        end;
      end;

      if ComboBox14.Items.IndexOf('Ativo') = -1 then
        ComboBox14.Items.Add('Ativo');
    end;
  finally
    if Assigned(vLista) then
      FreeAndNil(vLista);
    if Assigned(vLista2) then
      FreeAndNil(vLista2);
  end;

  leConfiguracoesFormRegistro;;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else if (TelaCadastro = 2) and (vCodCliente > 0) then
  begin
  	try
    	Cliente.strTmp := 'usarpossivecliente';
      Cliente.abreClientes(vCodCliente, False);
      SpeedButton1Click(SpeedButton1);
      if (Cliente.dataSet.State in [dsInsert, dsEdit]) then
        Cliente.dataSet.FieldByName('ATIVO').AsInteger := 1;
    finally
      Cliente.strTmp := '';
    end;
  end
  else if (TelaCadastro = 6) then
    BitBtn3Click(Sender)
  else if (TelaCadastro = 7) and (vCodCliente > 0) then
  begin
    if not Cliente.abreClientes(vCodCliente) then
    	exit;

    Cliente.dataSet.Edit;
    Cliente.dataset.FieldByName('SEL').AsString := 'S';
  	Cliente.dataset.Post;

    vDadosIni.fechaStatusProcessamento;

  	SpeedButton40Click(Sender);
    FrmCadClientes.fechar := True;
    PostMessage(FrmCadClientes.Handle, WM_CLOSE, 0, 0);
  end
  else if (TelaCadastro = 8) and (vCodCliente > 0) then
  begin
  	if not Cliente.clienteNaLixeira(vCodCliente) then
    begin
    	vDadosIni.fechaStatusProcessamento;
      FrmCadClientes.fechar := True;
    	PostMessage(FrmCadClientes.Handle, WM_CLOSE, 0, 0);
    	exit;
    end;

    if not Cliente.abreClientes(vCodCliente) then
    begin
    	vDadosIni.fechaStatusProcessamento;
      FrmCadClientes.fechar := True;
    	PostMessage(FrmCadClientes.Handle, WM_CLOSE, 0, 0);
    	exit;
    end;

    vDadosIni.fechaStatusProcessamento;

  	SpeedButton60Click(Sender);
//    FrmCadClientes.fechar := True;
//    PostMessage(FrmCadClientes.Handle, WM_CLOSE, 0, 0);
  end
  else if (TelaCadastro = 9) then
  begin
  	Self.Tag := 789;
  	vDadosIni.vTipoForm := 0;
    TelaCadastro := vDadosIni.vTipoForm;
  	vDataBanco := vDadosIni.getDataBanco(Cliente.buscas);

    FrmCadClientes.Caption := 'Aniversariantes do dia';
    CheckBox1.Checked := True;
    ComboBox1.Text := trim(Cliente.dataSet.FieldByName('DATA_CADASTRO').DisplayLabel);
    ComboBox1Exit(Sender);
    MaskEdit1.Text := '01/01/2000';
    MaskEdit2.Text := FormatDateTime('dd/mm/yyyy', vDataBanco);

    MaskEdit4.Text := FormatDateTime('dd', vDataBanco);
    MaskEdit5.Text := FormatDateTime('dd', vDataBanco);
    MaskEdit6.Text := FormatDateTime('mm', vDataBanco);

    BitBtn1Click(Sender);

    if Cliente.dataSet.IsEmpty then
    begin
    	FrmCadClientes.fechar := True;
    	PostMessage(FrmCadClientes.Handle, WM_CLOSE, 0, 0);
    end;
  end;

  if vDadosIni.vEmp.vCNPJ = '03530705000109' then
  begin
    Label130.Visible := true;
    DBEdit89.Visible := true;
    Label338.Visible := true;
    DBEdit199.Visible := true;
    Label339.Visible := true;
    DBEdit200.Visible := true;
  end
  else
  begin
    Label130.Visible := False;
    DBEdit89.Visible := False;
    Label338.Visible := False;
    DBEdit199.Visible := False;
    Label339.Visible := False;
    DBEdit200.Visible := False;
  end;

  SpeedButton64.Visible := vDadosIni.vHwCloudIA.vUsarServMensageria = 'S';

//  Por ser usado na tabela de preços removemos o teste da ordem de carregamento
//  Label142.Visible := (vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'S') or
//    (vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D');
//  DBEdit91.Visible := (vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'S') or
//    (vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D');
//  DBLookupComboBox18.Visible := (vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'S') or
//    (vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D');
  SpeedButton38.Visible := vDadosIni.vEmp.vUsarTelevenda = 'S';
  GroupBox44.Visible := vDadosIni.vEmp.vUsarTelevenda = 'S';
  PageControl4.ActivePage := tsMsgEmail1;

  SpeedButton60.Visible := (vDadosIni.vProgFid.vHabilitarProgFid) or (vDadosIni.vCashback.vHabilitarCashback);

  BitBtn73.Visible := False;//nao serve pra nada esse botao

  ComboBox4.Items.Add('');
  ComboBox5.Items.Add('');
  ComboBox6.Items.Add('');
  ComboBox7.Items.Add('');
  ComboBox8.Items.Add('');

  if (vCriou = 0) and (PrimeiraPesquisa2) then
  begin
    PrimeiraPesquisa2 := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid18, GridCfg2, cdsGrid2, cdsColunas2, usuario2, ListGridsAndDataSets2, vDadosIni.transacaoCol);
  end;

  //if vDadosIni.vEmp.vUsarTelevenda = 'S' then
    imgInformation.Hint := imgInformation.Hint + #13 + #13 +
      'Processo "CLI163" HABILITAR CAMPO FATURAMENTO'+ #13 +
      'Processo "CLI164" HABILITAR CAMPO TIPO CLIENTE VENDA'+ #13 +
      'Processo "CLI165" HABILITAR CAMPOS (TIPO PREÃ‡O VENDA, PERC. DESC).'+ #13 +
      'Processo "CLI188" HABILITAR ATRIBUTOS NO CADASTRO DO CLIENTE'+ #13 +
      'Processo "CLI189" SAIR DO CADASTRO SEM INFORMAR FORMAS PAGAMENTO'+ #13 +
      'Processo "CLI200" HABILITAR CAMPO RAZAO/FANTASIA AO EDITAR'+ #13 +
      'Processo "CLI201" HABILITAR CAMPO CPF/CNPJ AO EDITAR'+ #13 +
      'Processo "CLI250" PERMTIR SALVAR CLIENTE SEM INFORMAR O CELULAR' + #13 +
      'Processo "CLI251" TELEFONE CELULAR SENDO UTILIZADO EM OUTRO CLIENTE' + #13 +
      'Processo "CLI252" GERAR VALE POIS O CLIENTE NAO ACESSA APLICATIVO/SITE' + #13 +
      'Processo "CRM020" HABILITAR A PESQUISA DE CLIENTES DA CARTEIRA DE OUTROS VENDEDORES';

  imgInformation2.Hint := imgInformation2.Hint +
    'Tipo Doc: ' + #13 + #13 +
    'REQ - Requisição ' + #13 +
    'OS  - Ordem de Serviço ' + #13 +
    'MOT - Comando de Faturamento' + #13 +
    'DEV - Devolução' + #13 +
    'TRF - Transferência de saldo entre empresas';{ + #13 +
    'REC - Vale Compra';}

  if vCriou = 0 then
  	vDadosIni.configuraItensTipovenda(DBComboBox6,'REQ',Cliente.buscas,false);

  if vCriou = 0 then
  	vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmCadClientes.GroupBox51Enter(Sender: TObject);
begin
  inherited;
  if (Cliente.dataSet.State in [dsInsert, dsEdit]) then
    if (vDadosIni.strEstaContidoEm(Trim(Cliente.dataSet.FieldByName('INSC_EST').AsString),
      ['', 'ISENTO'])) or (Cliente.dataSet.FieldByName('cod_pais').AsInteger <> 1058) then
    begin
      //Cliente.dataSet.FieldByName('NFE_INDIEDEST').AsInteger := 9;
      //dbgroupIndInscricao.Enabled := False;
    end
    else
    begin
      //dbgroupIndInscricao.Enabled := True;
      //if Cliente.dataSet.FieldByName('NFE_INDIEDEST').AsInteger = 2 then
      //  Cliente.dataSet.FieldByName('NFE_INDIEDEST').AsInteger := 1;
    end;

end;

procedure TFrmCadClientes.GroupBox54Enter(Sender: TObject);
begin
  inherited;
  if Trim(Cliente.strTmp) <> '' then
    setFocusCampoErro(Cliente.vNomeCampoErro, True);
end;

procedure TFrmCadClientes.HabilitarCamposEdicao;
var
	I: Integer;
  vListaTmp: TStringList;
begin
	if Cliente.cadastroSimplificado then
  begin
  	CheckCadSeq_.Checked := false;
    CheckCadSeq_.Enabled := false;
    CheckCadSeq_.visible := false;
    LabelSeq_.Visible := false;

    PageControl1.ActivePage := tsCadastroSimples;
    tsCadastroSimples.Show;
    pageCadSimples.ActivePage := tsSDadosPessoais;
    tsSDadosPessoais.Show;

    montarComponentes;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    Cliente.atualizarCampos;

    vDadosIni.vInibeMensPesqPros := 'S';
    vNomeFantasia := vDadosIni.PesqPros('CLI200', 'HABILITAR', '', 'CLIENTES',
      Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, Cliente.buscas, False);
    DBEdit111.Enabled := vNomeFantasia;
    DBEdit113.Enabled := vNomeFantasia;
    vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit112.Enabled := vDadosIni.PesqPros('CLI201', 'HABILITAR', '', 'CLIENTES',
      Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, Cliente.buscas, False);
    BitBtn55.Visible := not DBEdit111.Enabled;
    BitBtn54.Visible := not DBEdit112.Enabled;

    if Cliente.dataSet.FieldByName('CL_GERAR_PONTOS').AsString = 'S' then
      DBComboBoxGerarPontos.ItemIndex := 0
    else
      DBComboBoxGerarPontos.ItemIndex := 1;

    if (Self.Enabled) and (Self.Visible) and (DBEdit111.CanFocus) then
      DBEdit111.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit113.CanFocus) then
      DBEdit113.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit112.CanFocus) then
      DBEdit112.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox30.CanFocus) then
      DBLookupComboBox30.SetFocus;
  end
  else
  begin
  	CheckCadSeq.Checked := false;
    CheckCadSeq.Enabled := false;
    CheckCadSeq.visible := false;
    LabelSeq.Visible := false;

  	PageControl1.ActivePage := TabSheet1;
    TabSheet1.Show;
    PageControl3.ActivePage := TabSheet3;
    TabSheet3.TabVisible := true;
    TabSheet3.Show;

    montarComponentes2;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    ScrollBox6.Parent := tsIdetificacoFotografica;
    GroupBox49.Parent := tsAtributos;
    Panel27.Parent := tsFormaPag;
    pnCondPags.Parent := tsFormaPag;

    tsIdetificacoFotografica.TabVisible := true;
    if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
      DBEdit6.SetFocus;
    //tsFormaPag.TabVisible := vDadosIni.vEmp.vUsarControlesCliente = 'S';
    tsFormaPag.TabVisible := (vDadosIni.vEmp.vUsarControlesCliente = 'S') or (vDadosIni.vCliente.vCondPagPorCliente);
    Panel27.Visible := vDadosIni.vEmp.vUsarControlesCliente = 'S';
    pnCondPags.Visible := vDadosIni.vCliente.vCondPagPorCliente;
    tsFormaPag.Caption := IfThen(Panel27.Visible   , 'Forma de Pagamento') + IfThen(Panel27.Visible and pnCondPags.Visible, ' e ') +
                          IfThen(pnCondPags.Visible, 'Cond Pag');

    tsVeiculos.TabVisible := vDadosIni.getConfSisBool('cl_cad_normal_aba_veiculos_hab', Cliente.buscas);
    if tsVeiculos.TabVisible then
    begin
      Cliente.vLKModeloVeiculo.Sql :=
        'select descricao, codigo, 1 tp from tipmodelo where cod_empresa = ' + vDadosIni.codEmpresa +
        ' union ' +
        'select  ''OUTRO'' descricao, 99999 codigo, 2 tp from rdb$database order by 3,1';
      Cliente.vLKModeloVeiculo.setDadosDataSet(['MODELO_POTVEIC', 'CODMODELO_POTVEIC'], ['DESCRICAO', 'CODIGO'], ['Modelo', 'Codigo'],
        Cliente.buscas,  DBEdit191, dbgridLookUp);
      if Cliente.vLKTpPropaganda.dataSet = nil then
        Cliente.vLKTpPropaganda.setDadosDataSet(
          ['', 'REVISTA', 'JORNAL', 'OUTDOOR', 'TV', 'RADIO', 'PANFLETO', 'OUTROS'],
          ['', 'Revista', 'Jornal', 'OutDoor', 'TV', 'Radio', 'Panfleto', 'Outros'], DBLookupComboBox57)
      else
        Cliente.vLKTpPropaganda.setDBLookupComboBox(DBLookupComboBox57);
    end;

    Cliente.PreencheCampos;
    Cliente.AbreQuerysDePesquisa;
    Cliente.atualizarCampos;
    verificacampos;
    ConfiguraVizualPorTipo;
    montarComponentes;
    ExecutarFormResize;//FormResize(Sender);
    DBEdit106.Enabled := trim(Cliente.dataSet.FieldByName('REC_MAIL_MARK').AsString) = 'S';
    vListaTmp := TStringList.Create;
    vListaTmp := vDadosIni.Split(
      vDadosIni.retornoPorCondicao(Copy(Cliente.dataSet.FieldByName('NFE_AUTXML').AsString,1,1) = '|',
      Copy(Cliente.dataSet.FieldByName('NFE_AUTXML').AsString,2,Length(Cliente.dataSet.FieldByName('NFE_AUTXML').AsString)),
      Cliente.dataSet.FieldByName('NFE_AUTXML').AsString));
    lbxAutXML.Items.Text := vListaTmp.Text;

    vDadosIni.vInibeMensPesqPros := 'S';
    vNomeFantasia := vDadosIni.PesqPros('CLI200', 'HABILITAR', '', 'CLIENTES',
      Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, Cliente.buscas, true);;
    DBEdit7.Enabled := vNomeFantasia;
    DBEdit8.Enabled := vNomeFantasia;
    vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit6.Enabled := vDadosIni.PesqPros('CLI201', 'HABILITAR', '', 'CLIENTES',
      Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, Cliente.buscas, true);
    BitBtn53.Visible := not DBEdit6.Enabled;
    BitBtn52.Visible := not DBEdit7.Enabled;

    if Cliente.dataSet.FieldByName('CL_GERAR_PONTOS').AsString = 'S' then
      DBComboBoxGerarPontos.ItemIndex := 0
    else
      DBComboBoxGerarPontos.ItemIndex := 1;
  end;
end;

procedure TFrmCadClientes.HabilitarCamposInclusao;
var
	I: Integer;
begin
	if cliente.cadastroSimplificado then
  begin
  	if (Self.TelaCadastro = 0) and (Self.CheckCadSeq.Tag = 0) then
    begin
      CheckCadSeq_.Enabled := true;
      CheckCadSeq_.Visible := true;
      LabelSeq_.Enabled := true;
      LabelSeq_.Visible := true;
    end;

  	PageControl1.ActivePage := tsCadastroSimples;
    tsCadastroSimples.Show;
    pageCadSimples.ActivePage := tsSDadosPessoais;
    tsSDadosPessoais.Show;

    vNomeFantasia := true;
    DBEdit111.Enabled := True;
    DBEdit113.Enabled := True;
    DBEdit112.Enabled := True;
    BitBtn54.Visible := False;
    BitBtn55.Visible := False;
    montarComponentes;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    Cliente.atualizarCampos;
    if Cliente.dataSet.FieldByName('CL_GERAR_PONTOS').AsString = 'S' then
      DBComboBoxGerarPontos.ItemIndex := 0
    else
      DBComboBoxGerarPontos.ItemIndex := 1;
    PageControl1.ActivePage := tsCadastroSimples;
    if (Self.Enabled) and (Self.Visible) and (DBEdit111.CanFocus) then
      DBEdit111.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit113.CanFocus) then
      DBEdit113.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit112.CanFocus) then
      DBEdit112.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox30.CanFocus) then
      DBLookupComboBox30.SetFocus;
  end
  else
  begin
  	if (Self.TelaCadastro = 0) and (Self.CheckCadSeq.Tag = 0) then
    begin
      CheckCadSeq.Enabled := true;
      CheckCadSeq.Visible := true;
      LabelSeq.Enabled := true;
      LabelSeq.Visible := true;
    end;

  	PageControl1.ActivePage := TabSheet1;
    TabSheet1.Show;
    PageControl3.ActivePage := TabSheet3;
    TabSheet3.TabVisible := true;
    TabSheet3.Show;

    montarComponentes;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    ScrollBox6.Parent := tsIdetificacoFotografica;
    GroupBox49.Parent := tsAtributos;
    Panel27.Parent := tsFormaPag;
    pnCondPags.Parent := tsFormaPag;
    lbxAutXML.Clear;
    tsIdetificacoFotografica.TabVisible := true;

    tsVeiculos.TabVisible := vDadosIni.getConfSisBool('cl_cad_normal_aba_veiculos_hab', Cliente.buscas);
    if (Self.Enabled) and (Self.Visible) and (DBEdit6.CanFocus) then
      DBEdit6.SetFocus;

    vNomeFantasia := true;
    DBEdit6.Enabled := True;
    DBEdit7.Enabled := True;
    DBEdit8.Enabled := True;
    BitBtn52.Visible := False;
    BitBtn53.Visible := False;
    Cliente.PreencheCampos;
    verificacampos;
    montarComponentes;
    Cliente.AbreQuerysDePesquisa;
    Cliente.atualizarCampos;
    DBEdit106.Enabled := False;
    if Cliente.dataSet.FieldByName('CL_GERAR_PONTOS').AsString = 'S' then
      DBComboBoxGerarPontos.ItemIndex := 0
    else
      DBComboBoxGerarPontos.ItemIndex := 1;

    tsFormaPag.TabVisible := (vDadosIni.vEmp.vUsarControlesCliente = 'S') or (vDadosIni.vCliente.vCondPagPorCliente);
    Panel27.Visible := vDadosIni.vEmp.vUsarControlesCliente = 'S';
    pnCondPags.Visible := vDadosIni.vCliente.vCondPagPorCliente;
    DBLookupComboBox14.Visible := not pnCondPags.Visible;
    Label126.Visible := not pnCondPags.Visible;
    tsFormaPag.Caption := IfThen(Panel27.Visible   , 'Forma de Pagamento') + IfThen(Panel27.Visible and pnCondPags.Visible, ' e ') +
                          IfThen(pnCondPags.Visible, 'Cond Pag');
  end;
end;

procedure TFrmCadClientes.handleFocusCampoErro(var pNomeCampoErro: string);
var
  dbComponent: TWinControl;
  vComponenteW : TWinControl;
  strComponent: string;
  list: TStrings;
begin

  if Trim(pNomeCampoErro) = '' then
    Exit;

  list := NewStringList(pNomeCampoErro, ';');
  for strComponent in list do
  begin
    dbComponent := TWinControl(FindComponent(strComponent));

    if (dbComponent <> nil) then
      if TWinControl(dbComponent).CanFocus then
        Exit
      else
      begin
        vComponenteW := TWinControl(dbComponent);
        while vComponenteW.Parent <> nil do
        begin
          if vComponenteW.Parent is TTabSheet then
            if (     Cliente.cadastroSimplificado  and ((vComponenteW.Parent as TTabSheet).Name = tsCadastroSimples.Name)) or
                    ((not Cliente.cadastroSimplificado) and ((vComponenteW.Parent as TTabSheet).Name = TabSheet1.Name)) then
            begin
              pNomeCampoErro := strComponent;
              Exit;
            end;

          vComponenteW := vComponenteW.Parent;
        end;
      end;
  end;
end;

procedure TFrmCadClientes.ImprimirReciboProgFidClick(Sender: TObject);
begin
   if not Cliente.vContaCorrenteCli.dataSet.IsEmpty then
     if not vDadosIni.PesqPros('CLI232', 'IMPRIMIR RECIBO', 'CLIENTE: ' + IntToStr(Cliente.vContaCorrenteCli.dataSet.FieldByName('cod_cliente').AsInteger),
      'CONTA_CORRENTE_PROG_FIDELIDADE',
      Cliente.vContaCorrenteCli.dataSet.FieldByName('CODIGO').AsString, Cliente.buscas, true) then
      Exit;

  if not Cliente.vContaCorrenteCli.dataSet.IsEmpty then
    vDadosIni.ImprimirRecProgFid(Cliente.vContaCorrenteCli.buscas, Cliente.vContaCorrenteCli.dataSet.FieldByName('NDOC').AsInteger,
      Cliente.vContaCorrenteCli.dataSet.FieldByName('TIPODOC').AsString,
      Cliente.vContaCorrenteCli.dataSet.FieldByName('TIPO').AsString,
      Cliente.vContaCorrenteCli.dataSet.FieldByName('CODIGO').AsInteger, true); //Imprimir recibo programa de fidelidade
end;

procedure TFrmCadClientes.LabelSeq_Click(Sender: TObject);
begin
  if CheckCadSeq_.Tag = 0 then
  begin
    CheckCadSeq_.Checked := not CheckCadSeq_.Checked;
    if CheckCadSeq_.Checked then
    begin
      CheckCadSeq_.Font.Color := clRed;
      LabelSeq_.Font.Color := clRed
    end
    else
    begin
      LabelSeq_.Font.Color := clTeal;
      CheckCadSeq_.Font.Color := clTeal;
    end;
  end;
end;

procedure TFrmCadClientes.lbSAutXMLKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
    if lbSAutXML.Items.Count > 0 then
      lbSAutXML.DeleteSelected;
end;

procedure TFrmCadClientes.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (TelaCadastro <= 0) then
  begin
  	CheckBox7.Checked := _LerConfiguracoesRegistroBoolean(CheckBox7.Name);
    if Trim(_LerConfiguracoesRegistroString(ComboBox14.Name)) <> '' then
      ComboBox14.Text := _LerConfiguracoesRegistroString(ComboBox14.Name)
    else
      ComboBox14.Text := 'Todos';

    if trim(ComboBox14.Text) = '' then
    	ComboBox14.Text := 'Todos';
    for I := 0 to ComboBox14.Items.Count - 1 do
    begin
    	if trim(ComboBox14.Items[I]) = trim(ComboBox14.Text) then
      begin
      	ComboBox14.ItemIndex := I;
        Break;
      end;
    end;
  end;

  if (TelaCadastro <= 0) and (CheckBox3.Checked) then
  begin
  	CheckBox2.Checked   := _LerConfiguracoesRegistroBoolean(CheckBox2.Name);

    ComboBox4.ItemIndex := _LerConfiguracoesRegistroInteger(ComboBox4.Name);
    ComboBox5.ItemIndex := _LerConfiguracoesRegistroInteger(ComboBox5.Name);
    ComboBox6.ItemIndex := _LerConfiguracoesRegistroInteger(ComboBox6.Name);
    ComboBox7.ItemIndex := _LerConfiguracoesRegistroInteger(ComboBox7.Name);
    ComboBox8.ItemIndex := _LerConfiguracoesRegistroInteger(ComboBox8.Name);
  end;

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
    	ComboBox12.Text        := _LerConfiguracoesRegistroString(ComboBox12.Name);

    if Trim(_LerConfiguracoesRegistroString(MaskEdit7.Name)) <> '' then
    	MaskEdit7.Text         := _LerConfiguracoesRegistroString(MaskEdit7.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name)) <> '' then
    	MaskEdit9.Text         := _LerConfiguracoesRegistroString(MaskEdit9.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name)) <> '' then
    	MaskEdit8.Text         := _LerConfiguracoesRegistroString(MaskEdit8.Name);

    RadioGroup1.ItemIndex  := _LerConfiguracoesRegistroInteger(RadioGroup1.Name);

    ComboBox14.ItemIndex   := _LerConfiguracoesRegistroInteger(ComboBox14.Name);

    if Trim(_LerConfiguracoesRegistroString(MaskEdit4.Name)) <> '' then
    	MaskEdit4.Text         := _LerConfiguracoesRegistroString(MaskEdit4.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit5.Name)) <> '' then
    	MaskEdit5.Text         := _LerConfiguracoesRegistroString(MaskEdit5.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit6.Name)) <> '' then
    	MaskEdit6.Text         := _LerConfiguracoesRegistroString(MaskEdit6.Name);
  end;
end;

procedure TFrmCadClientes.MarcaTransferenciacomoUtilizadaClick(Sender: TObject);
begin
  if not Cliente.vContaCorrenteCli.marcaComoConcluida(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
   exit;

  Cliente.vContaCorrenteCli.vTransSaldoProgFid.abreTransSaldoProgFid(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger);
end;

procedure TFrmCadClientes.MaskEdit10Exit(Sender: TObject);
begin
  inherited;
  if ((Cliente.Contratos.vMODO = 'INSERIR') and (CheckBox5.Checked)) then
    MaskEdit16.Text := MaskEdit10.Text;
end;

procedure TFrmCadClientes.montarComponentes;
var
  vAtributoaVisivel, vFormaPagVisivel, vBtnVisivel, vAbaVisivel: Boolean;
  vLista: TStrings;
  I: Integer;
  Abts_rotas, Abts_trib: TButtonGroup;
  Alk: TDBLookupComboBox;
begin
  LabelGerarPontos.Visible := vDadosIni.vProgFid.vHabilitarProgFid;
  DBComboBoxGerarPontos.Visible := vDadosIni.vProgFid.vHabilitarProgFid;
  GroupBoxGerarPontos.Visible := vDadosIni.vProgFid.vHabilitarProgFid;
  LabelGerarPontos2.Visible := vDadosIni.vProgFid.vHabilitarProgFid;
  DBLookupComboBoxGerarPontos.Visible := vDadosIni.vProgFid.vHabilitarProgFid;
  edCodCliFat.Enabled := False;
  edCodCliFatS.Enabled := False;

  if not Assigned(lk_issretido) then
  begin
    lk_issretido := TDadosLookUp_OOP.create;
    lk_issretido.setDadosDataSet(['0', '1', '2'], ['N/A - Não se aplica', 'Sim', 'Nao'], nil);
  end;
  if not Assigned(lk_tipoobranfse) then
  begin
    lk_tipoobranfse := TDadosLookUp_OOP.create;
    lk_tipoobranfse.setDadosDataSet(
      ['0', '1', '2', '3'],
      ['', 'Minha Casa Minha Vida', 'Regime Presumido', 'Regime Ordinário'], nil);
  end;

  if not Assigned(lkRetFed) then
    lkRetFed := TDadosLookUp_OOP.create;
  lkRetFed.setDadosDataSet(['0', '1', '2'], ['Sem retenção', 'Com Retenção(mín R$10)', 'Com Retenção'], nil);
  ed_retfed.Hint := 'Retenção dos tributos federais: IR, CSLL, PIS e COFINS para NFe. Algumas retenções são aplicadas apenas quando o valor chega a R$10,00.' +
                    ' Outras podem reter mesmo se o valor for menor que R$10,00';

  if not Assigned(lkRetFedNFS) then
    lkRetFedNFS := TDadosLookUp_OOP.create;
  lkRetFedNFS.setDadosDataSet(['0', '1', '2', '3'], ['Sem retenção', 'Com Retenção do IR', 'Com Retenção PIS, COFINS e CSLL', 'Com Retenção do IR, PIS, COFINS e CSLL'], nil);

  with Cliente.SqlOpen('select descricao from ramo_atividade where cod_empresa = %d', [vDadosIni.cod_empresa]) do
  begin
    DBEdit61.Items.Clear;
    while not Eof do
    begin
      DBEdit61.Items.Add(FieldByName('descricao').AsString);
      Next;
    end;
    DBEdit145.Items.Text := DBEdit61.Items.Text;
    Close;
  end;

  if Cliente.vLKSimNao.dataSet = nil then
    Cliente.vLKSimNao.setDadosDataSet(['S', 'N'], ['Sim', 'Nao'], nil);

  if cliente.cadastroSimplificado then
  begin
    dbgridLookUp.Visible := False;
    tsModais.TabVisible := False;
    pageCadSimples.ActivePage := tsSDadosPessoais;
    if vDadosIni.PesqPros('CLI193', 'HABILITAR', '', '', '', Cliente.buscas, False, False, True) then
      tsSDadosAdicionais.Tag := 1
    else
      tsSDadosAdicionais.Tag := 0;
    if vDadosIni.PesqPros('CLI194', 'HABILITAR', '', '', '', Cliente.buscas, False, False, True) then
      tsSReferenciasSPC.Tag := 1
    else
      tsSReferenciasSPC.Tag := 0;
    if Cliente.dataSet.State = dsInsert then
      tsSImagens.Tag := 0
    else if vDadosIni.PesqPros('CLI195', 'HABILITAR', '', '', '', Cliente.buscas, False, False, True) then
      tsSImagens.Tag := 1
    else
      tsSImagens.Tag := 0;
    if vDadosIni.PesqPros('CLI188', 'HABILITAR', '', '', '', Cliente.buscas, False, False, True) then
      tsSAtributosSimples.Tag := 1
    else
      tsSAtributosSimples.Tag := 0;
    if vDadosIni.PesqPros('CLI196', 'HABILITAR', '', '', '', Cliente.buscas, False, False, True) then
      tsSFormasDePagamento.Tag := 1
    else
      tsSFormasDePagamento.Tag := 0;
    if vDadosIni.PesqPros('CLI197', 'HABILITAR', '', '', '', Cliente.buscas, False, False, True) then
      tsSCRM.Tag := 1
    else
      tsSCRM.Tag := 0;

    if Cliente.dataSet.State = dsInsert then
	    tsECommerce2.Tag := 0
    else
    begin
    	if not vDadosIni.vEcommerce.vHabilitarEcommerce then
      	tsECommerce2.Tag := 0
      else if vDadosIni.PesqPros('CLI264', 'HABILITAR', '', '', '', Cliente.buscas, False, False, True) then
      begin
      	if (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY') then
	        tsECommerce2.Tag := 1
        else
        	tsECommerce2.Tag := 0;
      end
      else
        tsECommerce2.Tag := 0;
    end;

    btSairCupomEC.Visible := false;
    GroupBoxCupomEC.Parent := pnEC2;

    DBMemo4.Enabled := vDadosIni.getConfSisBool('cl_cad_simpl_obs_aba_pricipal_hab', Cliente.buscas);
    if DBMemo4.Enabled then DBMemo4.Color := clWindow else DBMemo4.Color := clBtnFace;

    DBMemo8.Enabled := vDadosIni.getConfSisBool('cl_cad_simpl_obs_aba_pricipal_hab', Cliente.buscas);
    if DBMemo8.Enabled then DBMemo8.Color := clWindow else DBMemo8.Color := clBtnFace;

    vAtributoaVisivel := False;
    if (tsSAtributosSimples.Tag = 1) and (Cliente.dataSet.State = dsEdit) then
      if (vDadosIni.strIn(Cliente.dataSet.FieldByName('TIPO').AsString, ['F', 'A'])) and
        (Cliente._abreAtributos(Cliente.dataSet.FieldByName('cod_cliente').AsInteger)) then
        vAtributoaVisivel := vDadosIni.PesqPros('CLI188', 'HABILITAR', '', 'CLIENTES', '', Cliente.buscas, False, False, True);

    vFormaPagVisivel := False;
    if tsSFormasDePagamento.Tag = 1 then
      vFormaPagVisivel := (vDadosIni.vEmp.vUsarControlesCliente = 'S') or (vDadosIni.vCliente.vCondPagPorCliente);

    vBtnVisivel := vDadosIni.getConfSisBool('cl_cad_simpl_usar_botoes_n_abas', Cliente.buscas);
    vAbaVisivel := not vBtnVisivel;

    tsSDadosAdicionais.TabVisible   := (vAbaVisivel) and (tsSDadosAdicionais.Tag = 1);
    tsSReferenciasSPC.TabVisible    := (vAbaVisivel) and (tsSReferenciasSPC.Tag = 1);
    tsSImagens.TabVisible           := (vAbaVisivel) and (tsSImagens.Tag = 1);
    tsSAtributosSimples.TabVisible  := (vAbaVisivel) and (vAtributoaVisivel);
    tsSFormasDePagamento.TabVisible := (vAbaVisivel) and (vFormaPagVisivel);
    tsSCRM.TabVisible               := (vAbaVisivel) and (tsSCRM.Tag = 1);
    tsECommerce2.TabVisible 				:= (vAbaVisivel) and (tsECommerce2.Tag = 1);

    btnSDadosAdicionais.Visible     := (vBtnVisivel) and (tsSDadosAdicionais.Tag = 1);
    btnSRferenciasSPC.Visible       := (vBtnVisivel) and (tsSReferenciasSPC.Tag = 1);
    btnSImagens.Visible             := (vBtnVisivel) and (tsSImagens.Tag = 1);
    btnsAtributos.Visible           := (vBtnVisivel) and (vAtributoaVisivel);
    btnsFormasPagamento.Visible     := (vBtnVisivel) and (vFormaPagVisivel);
    btnSCRM.Visible                 := (vBtnVisivel) and (tsSCRM.Tag = 1);
    btnSECommerce.Visible           := (vBtnVisivel) and (tsECommerce2.Tag = 1);

    // Genero
    Cliente.vLKGenero.setDadosDataSet(['', 'M','F'], ['', 'M - Masculino', 'F - Feminino'], DBLookupComboBox30);

    // Endereco
    //Bairro
    Cliente.vLKBairro.Sql := 'select cod_bairro, nome_bairro from bairros where ativo = 1 order by nome_bairro';
    Cliente.vLKBairro.setDadosDataSet(['COD_BAIRRO', 'BAIRRO'], ['COD_BAIRRO', '%NOME_BAIRRO'], [] , Cliente.buscas, DBEdit118, dbgridLookUp, False, 0, 0, 0, 300);

    //Cidade
    Cliente.vLKCidade.Sql := 'select c.cod_cidade, c.nome_cidade, ci.nome_municipio, ci.codigo_mun_ibge, ci.nome_uf, es.codigo_uf from cidades c' +
      ' left join cidades_ibge ci on ci.codigo_mun_ibge = c.ibge_cod_cidade' +
      ' left join estados es on es.ibge_codigo_uf = ci.codigo_uf_ibge' +
      ' where c.ativo = 1 order by c.nome_cidade';
    Cliente.vLKCidade.setDadosDataSet(['COD_CIDADE', 'CIDADE', 'CODIGO_UF'], ['COD_CIDADE', '%NOME_CIDADE', 'CODIGO_UF'],
      ['Cod', 'Cidade', 'Cidade IBGE', 'Cod IBGE', 'Estado', 'Cod UF'],
      Cliente.buscas, DBEdit119, dbgridLookUp, True);

    //Estado
    Cliente.ExecutaComandosSql('select codigo_uf, (coalesce(sigla_uf, '''')||'' - ''||coalesce(nome_uf, '''')) estado from estados', False);
    Cliente.vLKEstado.setDadosDataSet('CODIGO_UF', 'ESTADO', Cliente.buscas,  DBLookupComboBox29);

    //Pais
    Cliente.ExecutaComandosSql('select COD_PAIS, NOME_PAIS from PAISES', False);
    Cliente.vLKPais.setDadosDataSet('COD_PAIS', 'NOME_PAIS', Cliente.buscas,  DBLookupComboBox28);

    // Dados Adicionais
    if tsSDadosAdicionais.TabVisible or btnSDadosAdicionais.Visible then
    begin
      // Convenio
      Cliente.vLKSimNao.setDBLookupComboBox(DBLookupComboBox40);
      // Vender acima do limite de credito
      Cliente.vLKSimNao.setDBLookupComboBox(DBLookupComboBox42);
      // Informacao desconto no boleto
      Cliente.vLKSimNao.SetDBLookupComboBox(DBLookupComboBox59);
      // Enviar notificação financeiro
      Cliente.vLKSimNao.setDBLookupComboBox(DBLookupComboBoxEnviarNot);
      // Gerar pontos
      Cliente.vLKSimNao.setDBLookupComboBox(DBLookupComboBoxGerarPontos);
      // Financeiro dever autorizar vendas
      Cliente.vLKSimNao.setDBLookupComboBox(DBLookupComboBox43);
      // Desnegativar cliente ao quitar todas contas
      Cliente.vLKSimNao.setDBLookupComboBox(DBLookupComboBox44);
      // Barramento automatico apos vencimento cliente
      Cliente.vLKSimNao.setDBLookupComboBox(DBLookupComboBox60);
      // Tipo de preço padrao
      Cliente.vLKPrecoVendaPad.setDadosDataSet(['', 'PREC_TAB_PROD', 'PREC_PUBLICO', 'PREC_30_PROD', 'PREC_60_PROD', 'PREC_90_PRODS'],
        ['', 'A Vista no Varejo', 'Atacado', '30 Dias', '60 Dias', '90 Dias'], DBLookupComboBox46);
      // Aceita contato pelo televendas
      Cliente.vLKSimNao.setDBLookupComboBox(DBLookupComboBox54);
      // Sugerir servicos
      Cliente.vLKSimNao.setDBLookupComboBox(DBLookupComboBox51);
      // Calcular ST na saida
      Cliente.vLKSimNao.setDBLookupComboBox(DBLookupComboBox37);
      // Indicador de Inscricao Estadual do Destinatario
      Cliente.vLKIndIEDest.setDadosDataSet(['1', '2', '9'],
        ['1 - Contribuinte de ICMS',
         '2 - Contribuinte isento de Inscrição no cadastro de Contribuintes do ICMS',
         '9 - Não Contribuinte, que pode ou não possuir Inscrição Estadual no Cadastro de Contribuintes do ICMS'], DBLookupComboBox52);
      // Tipo de venda padrao
      Cliente.ExecutaComandosSql('select sigla, descricao from tipo_vendas where tipo = ''REQ'' order by 1', False);
      cliente.vLKTipoVendaPad.setDadosDataSet('SIGLA', 'DESCRICAO', Cliente.buscas,  DBLookupComboBox45);
      // ISSQN Retido
      if Cliente.vLKISSQNRetido.dataSet = nil then
        Cliente.vLKISSQNRetido.setDadosDataSet(['0', '1', '2'], ['Nao se Aplica', 'Sim', 'Nao'], DBLookupComboBox24);

      Cliente.abreTipoFaturamento;
      Cliente.vCondPag.selecionaCondPag(Cliente.dataSet.FieldByName('tipo').AsString);
      DBLookupComboBox27.ListSource := DtmClientes.dsCondPag;
      DBLookupComboBox27.ListField := 'DESC_COND_PAG';
      DBLookupComboBox27.KeyField := 'COD_COND_PAG';
      DBLookupComboBox27.DataField := 'COD_COND_PAG';
      Cliente.abreTabPrecCli;
      Cliente.abreContador;
      Cliente.abreVendedor;
    end;
    if (tsSImagens.TabVisible) or (btnSImagens.Visible) then
      ScrollBox6.Parent := pnSImagens;
    if tsSAtributosSimples.TabVisible or btnsAtributos.Visible then
      GroupBox49.Parent := pnSAtributos;
    if (tsSFormasDePagamento.TabVisible) or (btnsFormasPagamento.Visible) then
    begin
      Panel27.Visible              := vDadosIni.vEmp.vUsarControlesCliente = 'S';
      pnCondPags.Visible           := vDadosIni.vCliente.vCondPagPorCliente;

      DBLookupComboBox27.Visible   := not pnCondPags.Visible;
      Label217.Visible             := not pnCondPags.Visible;

      Panel27.Parent               := pnSFormasPagamento;
      pnCondPags.Parent            := pnSFormasPagamento;
      tsSFormasDePagamento.Caption := IfThen(Panel27.Visible   , 'Forma de Pagamento') + IfThen(Panel27.Visible and pnCondPags.Visible, ' e ') +
                                      IfThen(pnCondPags.Visible, 'Cond Pag');
      btnsFormasPagamento.Hint     := tsSFormasDePagamento.Caption;
    end;
    if (tsSCRM.TabVisible) or (btnSCRM.Visible) then
    begin
      // Modelo de veiculo - CODMODELO_POTVEIC e MODELO_POTVEIC
      Cliente.vLKModeloVeiculo.Sql :=
        'select descricao, codigo, 1 tp from tipmodelo where cod_empresa = ' + vDadosIni.codEmpresa +
        ' union ' +
        'select  ''OUTRO'' descricao, 99999 codigo, 2 tp from rdb$database order by 3,1';
      Cliente.vLKModeloVeiculo.setDadosDataSet(['MODELO_POTVEIC', 'CODMODELO_POTVEIC'], ['DESCRICAO', 'CODIGO'], ['Modelo', 'Codigo'],
        Cliente.buscas,  DBEdit108, dbgridLookUp);
      // Tipo de propaganda - TIPO_PROP
      if Cliente.vLKTpPropaganda.dataSet = nil then
        Cliente.vLKTpPropaganda.setDadosDataSet(
          ['', 'REVISTA', 'JORNAL', 'OUTDOOR', 'TV', 'RADIO', 'PANFLETO', 'OUTROS'],
          ['', 'Revista', 'Jornal', 'OutDoor', 'TV', 'Radio', 'Panfleto', 'Outros'], DBLookupComboBox56)
      else
        Cliente.vLKTpPropaganda.setDBLookupComboBox(DBLookupComboBox56);
    end;
    pnAdicionaisEndDoc.Parent   := tsEndDocAdicionaisSimples;
    pgDadosAdSimples.ActivePage := tsEndCombrancaSimples;
    Abts_rotas := btgoup_rotaent_simpl;
    Abts_trib  := btgoup_trib_pref_sim;
    lk_issretido.setDBLookupComboBox(eds_issretido);
    lk_tipoobranfse.setDBLookupComboBox(eds_tipoobranfse);
    lkRetFed.setDBLookupComboBox(eds_retfed);
    lkRetFedNFS.setDBLookupComboBox(eds_retfed_nfs);
  end
  else
  begin
  	btSairCupomEC.Visible := false;
  	GroupBoxCupomEC.Parent := pnEC1;

    if Cliente.dataSet.State = dsInsert then
      tsIdetificacoFotografica.TabVisible := False
    else
      tsIdetificacoFotografica.TabVisible := True;

    if Cliente.dataSet.State = dsInsert then
    	tsECommerce.TabVisible := False
    else if vDadosIni.vEcommerce.vHabilitarEcommerce then
    	tsECommerce.TabVisible := (trim(vDadosIni.vEcommerce.vEcommerceIntegrado) = 'TRAY')
    else
    	tsECommerce.TabVisible := False;

    pnAdicionaisEndDoc.Parent := tsEndDocAdicionais;
    pgDadosAd.ActivePage      := tsDadosAdOutros;
    Abts_rotas := btgoup_rotaent_compl;
    Abts_trib  := btgoup_trib_pref_com;
    lk_issretido.setDBLookupComboBox(ed_issretido);
    lk_tipoobranfse.setDBLookupComboBox(ed_tipoobranfse);
    lkRetFed.setDBLookupComboBox(ed_retfed);
    lkRetFedNFS.setDBLookupComboBox(ed_retfed_nfs);
  end;
  while Abts_rotas.Items.Count > 1 do
    Abts_rotas.Items.Delete(Abts_rotas.Items.Count - 1);
  for I := 0 to Cliente.rotas.Count - 1 do with Cliente.rotas.Items[I] do
    with Abts_rotas.Items.Add do
    begin
      Caption := rota;
      Hint    := Format('%s - Rota %s - %s', [vDadosIni.StrZero(cod_rota, 3), rota, descricao]);
    end;

  cliente_enddoc_scroll_rotas;
  while Abts_trib.Items.Count > 0 do
    Abts_trib.Items.Delete(Abts_trib.Items.Count - 1);
  for I := 0 to Cliente.tribAd.Count - 1 do with Cliente.tribAd.Items[I] do
    with Abts_trib.Items.Add do
    begin
      Caption := Format('[ID:%d][%s-%d][%s]', [cod_trib_pf, cst_icms, Trunc(codigo_nop), descricao_pf]);
      Hint    := Format('[CST:%s][CFOP:%d][%%ICMS Intra:%f][%%ICMS Inter:%f][%%Redução:%f][MVA:%f]',
                        [cst_icms, Trunc(codigo_nop), aliq_intra, aliq_inter, perc_red_prod, mva]);
    end;

  // Enderecos adicionas
  //Bairro
  Cliente.EndDocAd.lkBairro.Sql := 'select nome_bairro, cod_bairro from bairros where ativo = 1 order by nome_bairro';
  Cliente.EndDocAd.lkBairro.setDadosDataSet(
    ['XBAIRRO'],
    ['%NOME_BAIRRO'], [] ,
    Cliente.EndDocAd.buscas, DBEdit336, dbgridLookUp, False, 15, 338, 88, 357);

  //Cidade
  Cliente.EndDocAd.lkCidade.Sql := 'select c.nome_cidade, ci.nome_municipio, ci.codigo_mun_ibge, ci.nome_uf, es.codigo_uf, es.sigla_uf, c.cod_cidade from cidades c' +
    ' left join cidades_ibge ci on ci.codigo_mun_ibge = c.ibge_cod_cidade' +
    ' left join estados es on es.ibge_codigo_uf = ci.codigo_uf_ibge' +
    ' where c.ativo = 1 order by c.nome_cidade';
  Cliente.EndDocAd.lkCidade.setDadosDataSet(
    ['XMUN'      , 'CMUN'           , 'UF'        , 'COD_CIDADE'],
    ['%NOME_CIDADE', 'CODIGO_MUN_IBGE', 'SIGLA_UF', 'COD_CIDADE'],
    ['Cidade'     , 'Cidade IBGE'    , 'Cod IBGE', 'Estado', 'Cod UF', 'UF'],
    Cliente.EndDocAd.buscas, DBEdit337, dbgridLookUp, True, 15, 61, 115, 634);

  //Pais
  Cliente.EndDocAd.lkPais.Sql := 'select COD_PAIS, NOME_PAIS from PAISES order by NOME_PAIS';
  Cliente.EndDocAd.lkPais.setDadosDataSet(
    ['CPAIS'   , 'XPAIS'    ],
    ['COD_PAIS', 'NOME_PAIS'], [],
    Cliente.EndDocAd.buscas,  DBEdit338, dbgridLookUp, False, 15, 257, 115, 438);

  if Cliente.EndDocAd.lkIndIEDest.dataSet = nil then
    Cliente.EndDocAd.lkIndIEDest.setDadosDataSet( ['1', '2', '9'],
    ['1 - Contribuinte ICMS',
     '2 - Contribuinte isento de Inscrição no cadastro de Contribuintes do ICMS',
     '9 - Não Contribuinte, que pode ou não possuir Inscrição Estadual no Cadastro de Contribuintes do ICMS'],
     DBLookupComboBox58);

  if not Assigned(lk_enddoc_localidade) then
  begin
    lk_enddoc_localidade := TDadosLookUp_OOP.create;
    lk_enddoc_localidade.setDadosDataSet('COD_LOCALIDADE', 'LOCALIDADE',
                                         Cliente.SqlOpen('select l.cod_localidade, l.localidade||'' - ''||s.setor as localidade' +
                                                         ' from localidade l' +
                                                         ' inner join setor s on s.cod_setor = l.cod_setor and s.cod_empresa = l.cod_empresa' +
                                                         ' where l.cod_empresa = %s' +
                                                         ' union' +
                                                         ' select null cod_localidade, '' *** SEM LOCALIDADE ***  '' localidade from rdb$database' +
                                                         ' order by 2', [vDadosIni.codEmpresa]),  ed_enddoc_localidade);
  end;

  if Cliente.cadastroSimplificado then
    Alk := ed_finalidade_sim
  else
    Alk := ed_finalidade;

  if not Assigned(lk_finalidade) then
    lk_finalidade := TDadosLookUp_OOP.create;

  lk_finalidade.setDadosDataSet('ID', 'DESCRICAO', Cliente.SqlOpen('select ID, DESCRICAO from finalidade' +
                                                                   ' where cod_empresa = ' + vDadosIni.codEmpresa +
                                                                   ' union ' +
                                                                   ' select null id, '' Nenhuma finalidade específica'' descricao from rdb$database' +
                                                                   ' order by 2'), Alk);

  btSalvarEndDoc.Enabled := False;
  btCancelEndDoc.Enabled := False;
  btEditEndDocAd.Enabled := not Cliente.EndDocAd.dataSet.IsEmpty;
  groupEndDocAd.Enabled := True;

  gridCondPagVND.DataSource := Cliente.vCondPagVND.DSCondPag;
  gridCondPagPRE.DataSource := Cliente.vCondPagPre.DSCondPag;
  gridCondPag.DataSource := Cliente.vControles._dataSourceOOP;

  lbClienteFaturamento.Caption := Cliente.ChangeClienteFaturamento(Cliente.fint('cod_cli_fat'));
  lbSClienteFaturamento.Caption := lbClienteFaturamento.Caption;

  vLista := TStringList.Create;
  if Cliente.cadastroSimplificado then
	  vLista := vDadosIni.getConfSisBlob('cl_cad_simpl_campos_desabilitados', Cliente.buscas)
  else
  	vLista := vDadosIni.getConfSisBlob('cl_cad_campos_desabilitados', Cliente.buscas);

  for I := 0 to vLista.Count - 1 do
    if FindComponent(vDadosIni.getValue(vLista[i], 2)) <> nil then
    begin
      TWinControl(FindComponent(vDadosIni.getValue(vLista[i], 2))).Enabled := True;
      if Cliente.dataSet.State = dsInsert then
        if vDadosIni.strIn(LowerCase(vDadosIni.getValue(vLista[i], 3)), ['i', 'insercao', 'inclusao', 'incluir', 'inserir', 'a', 'ambos']) then
          if StrToIntDef(vDadosIni.getValue(vLista[i], 4), 0) >= vDadosIni.vNivel then
            TWinControl(FindComponent(vDadosIni.getValue(vLista[i], 2))).Enabled := False;
      if Cliente.dataSet.State = dsEdit then
        if vDadosIni.strIn(LowerCase(vDadosIni.getValue(vLista[i], 3)), ['e', 'edicao', 'alteracao', 'editar', 'alterar', 'a', 'ambos']) then
          if StrToIntDef(vDadosIni.getValue(vLista[i], 4), 0) >= vDadosIni.vNivel then
            TWinControl(FindComponent(vDadosIni.getValue(vLista[i], 2))).Enabled := False;
    end;
end;

procedure TFrmCadClientes.montarComponentes2;
var
  vLista: TStrings;
  I: Integer;
begin
	vLista := TStringList.Create;
  if Cliente.cadastroSimplificado then
	  vLista := vDadosIni.getConfSisBlob('cl_cad_simpl_campos_desabilitados', Cliente.buscas)
  else
  	vLista := vDadosIni.getConfSisBlob('cl_cad_campos_desabilitados', Cliente.buscas);

  for I := 0 to vLista.Count - 1 do
    if FindComponent(vDadosIni.getValue(vLista[i], 2)) <> nil then
    begin
      TWinControl(FindComponent(vDadosIni.getValue(vLista[i], 2))).Enabled := True;
      if Cliente.dataSet.State = dsInsert then
        if vDadosIni.strIn(LowerCase(vDadosIni.getValue(vLista[i], 3)), ['i', 'insercao', 'inclusao', 'incluir', 'inserir', 'a', 'ambos']) then
          if StrToIntDef(vDadosIni.getValue(vLista[i], 4), 0) >= vDadosIni.vNivel then
            TWinControl(FindComponent(vDadosIni.getValue(vLista[i], 2))).Enabled := False;
      if Cliente.dataSet.State = dsEdit then
        if vDadosIni.strIn(LowerCase(vDadosIni.getValue(vLista[i], 3)), ['e', 'edicao', 'alteracao', 'editar', 'alterar', 'a', 'ambos']) then
          if StrToIntDef(vDadosIni.getValue(vLista[i], 4), 0) >= vDadosIni.vNivel then
            TWinControl(FindComponent(vDadosIni.getValue(vLista[i], 2))).Enabled := False;
    end;
end;

procedure TFrmCadClientes.pageCadSimplesChange(Sender: TObject);
var
	I: Integer;
begin
  inherited;
  if pageCadSimples.ActivePage = tsSImagens then
  begin
    Cliente.Foto.abreFotoCliente;
	  Cliente._recuperarFotoCliente;
  end
	else if pageCadSimples.ActivePage = tsSFormasDePagamento then
   	Cliente._abreControlesFormaPagamento;

  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;
end;

procedure TFrmCadClientes.PageControl3Change(Sender: TObject);
var
	I: Integer;
begin
  inherited;
  if PageControl3.ActivePage = tsIdetificacoFotografica then
  begin
    pnFoto.Visible := true;
    Panel8.Visible := true;
    Cliente.Foto.abreFotoCliente;
    Cliente._recuperarFotoCliente;
  end
  else if PageControl3.ActivePage = tsFormaPag then
  	Cliente._abreControlesFormaPagamento;

  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;
end;

procedure TFrmCadClientes.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLabel16.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TFrmCadClientes.Panel38Enter(Sender: TObject);
begin
  inherited;
  if btnEdendecoAd.Tag = 1 then
    if Trim(Cliente.vNomeCampoErro) <> '' then
      setFocusCampoErro(Cliente.vNomeCampoErro);
end;

procedure TFrmCadClientes.Panel50Resize(Sender: TObject);
begin
  inherited;
  BitBtn51.Left := Trunc( (Panel50.Width - BitBtn51.Width) / 2 );
end;

procedure TFrmCadClientes.pgDadosAdEnter(Sender: TObject);
begin
  inherited;
  THackWinControl(pgDadosAd.ActivePage).SelectFirst;
end;

procedure TFrmCadClientes.pnAdicionaisEndDocEnter(Sender: TObject);
begin
  inherited;
  Cliente.EndDocAd.onEndScroll := cliente_enddoc_scroll_rotas;
  cliente_enddoc_scroll_rotas;
end;

procedure TFrmCadClientes.pnAdicionaisEndDocExit(Sender: TObject);
begin
  inherited;
  Cliente.EndDocAd.onEndScroll := nil;
  Cliente.EndDocAd.Cancel;
  btSalvarEndDoc.Enabled := False;
  btCancelEndDoc.Enabled := False;
  btEditEndDocAd.Enabled := not Cliente.EndDocAd.dataSet.IsEmpty;
  groupEndDocAd.Enabled := True;
end;

procedure TFrmCadClientes.pnCarteirasEnter(Sender: TObject);
begin
  inherited;
  Edit5.Text := '';
  Edit6.Text := '';
  Edit7.Text := '';
  Edit8.Text := '';
  Edit9.Text := '';
  Edit10.Text := '';
  DataSource1.DataSet := Cliente.vReds.vColabOr.dataSet;
  DataSource2.DataSet := Cliente.vReds.vColabDest.dataSet;
  DBLookupComboBox20.KeyValue := Cliente.vReds.vColabOr.dataSet.FieldByName('cod_vendedor').AsInteger;
  DBLookupComboBox21.KeyValue := Cliente.vReds.vColabDest.dataSet.FieldByName('cod_vendedor').AsInteger;
  DBGrid12.Columns[0].Width := Edit10.Width;
  DBGrid12.Columns[1].Width := Edit5.Width;
  DBGrid12.Columns[2].Width := Edit6.Width - 1;
  DBGrid12.Columns[3].Width := Edit7.Width - 2;
  DBGrid12.Columns[4].Width := Edit8.Width - 2;
  imgCarteiras.Hint := 'Para selecionar os registros basta pressionar e segurar a tecla Ctrl' + #13 +
                       'e depois com o Mouse clicar com o botão esquerdo, pode selecionar' + #13 +
                       'tambem pressionando a tecla de Espaco no registro' + #13 + #13 +
                       'Os registro selecionados ficam com a cor diferente dos demais não selecionados' + #13 + #13 +
                       'Para selecionar todos os clientes a mostra pressionar a tecla "F2",' + #13 +
                       '"F4" remove a seleção de todos"';
  imgCarteiras.ShowHint := True;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox20.CanFocus) then
  	DBLookupComboBox20.SetFocus;
  Edit10Exit(Edit10);
end;

procedure TFrmCadClientes.pnCarteirasResize(Sender: TObject);
begin
  inherited;
  DBGrid12.Columns[0].Width := Edit10.Width;
  DBGrid12.Columns[1].Width := Edit5.Width;
  DBGrid12.Columns[2].Width := Edit6.Width - 1;
  DBGrid12.Columns[3].Width := Edit7.Width - 2;
  DBGrid12.Columns[4].Width := Edit8.Width - 2;
end;

procedure TFrmCadClientes.pnContratoCadastroEnter(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  EditHw1.AsValue := Cliente.Contratos.vCOD_SERVICO;
  EditHw2.AsValue := Cliente.Contratos.vCOD_CONTROLE;
  EditHw3.AsValue := Cliente.Contratos.vDIA_VENCIMENTO;
  EditHw4.AsValue := Cliente.Contratos.vVALOR_CONTRATO;
  EditHw5.AsValue := Cliente.Contratos.vCOD_COLABORADOR;
  DBLookupComboBox15.KeyValue := EditHw1.AsInteger;
  DBLookupComboBox16.KeyValue := EditHw2.AsInteger;
  DBLookupComboBox19.KeyValue := EditHw5.AsInteger;

  if Cliente.Contratos.vDATA_INICIAL_VIGENCIA > 0 then
    MaskEdit10.Text := DateToStr(Cliente.Contratos.vDATA_INICIAL_VIGENCIA)
  else
    MaskEdit10.Clear;

  if Cliente.Contratos.vDATA_FINAL_VIGENCIA > 0 then
    MaskEdit11.Text := DateToStr(Cliente.Contratos.vDATA_FINAL_VIGENCIA)
  else
    MaskEdit11.Clear;

  if Cliente.Contratos.vDATA_IMPRESSAOBOL_INICIAL > 0 then
    MaskEdit16.Text := DateToStr(Cliente.Contratos.vDATA_IMPRESSAOBOL_INICIAL)
  else
    MaskEdit16.Clear;

  if Cliente.Contratos.vSTATUS <> '' then
  begin

    for I := 0 to ComboBox9.Items.Count - 1 do
      if ComboBox9.Items[I] = Cliente.Contratos.vSTATUS then
      begin
        ComboBox9.ItemIndex := I;
        Break;
      end;

  end
  else
    ComboBox9.ItemIndex := 0;

  if Cliente.Contratos.vTIPO_OS <> '' then
  begin

    for I := 0 to ComboBox13.Items.Count - 1 do
      if ComboBox13.Items[I] = Cliente.Contratos.vTIPO_OS then
      begin
        ComboBox13.ItemIndex := I;
        Break;
      end;

  end
  else
    ComboBox13.ItemIndex := 0;
end;

procedure TFrmCadClientes.pnContratoRelatoriosEnter(Sender: TObject);
begin
  inherited;
  RadioGroup2.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup2.Name);
end;

procedure TFrmCadClientes.pnDadosPessoais_ContatosPlataformaEnter(
  Sender: TObject);
begin
  inherited;
  grid_contatos_pla.DataSource := Cliente.ContatoMsg._dataSourceOOP;
	ed_contato_pla_aplicativo.DataSource := Cliente.ContatoMsg._dataSourceOOP;
  ed_contato_pla_contato.DataSource := Cliente.ContatoMsg._dataSourceOOP;
  ed_contato_pla_identificacao.DataSource := Cliente.ContatoMsg._dataSourceOOP;

  if Trim(Cliente.strTmp) <> '' then
    setFocusCampoErro(Cliente.vNomeCampoErro, True);
  if not Assigned(lk_tipo_contato) then
    lk_tipo_contato := TDadosLookUp_OOP.Create;

  if not Assigned(lk_tipo_contato_pla) then
    lk_tipo_contato_pla := TDadosLookUp_OOP.create;
  if not Assigned(lk_aplicativo_contato_pla) then
    lk_aplicativo_contato_pla := TDadosLookUp_OOP.create;

  lk_aplicativo_contato_pla.setDadosDataSet('ID', 'APLICATIVO', Cliente.ContatoMsg.Aplicativo.dataSet, ed_contato_pla_aplicativo);

  pn_contatos_pla_view.Enabled := True;
  pn_contatos_pla_cad.Enabled := False;
  pn_contatos_pla_cad.Visible := False;
  Cliente.ContatoMsg.dataSet.Cancel;
end;

procedure TFrmCadClientes.pnDadosPessoais_ContatosTelefoneEnter(Sender: TObject);
begin
  inherited;
  grid_contatos.DataSource := Cliente.Contato._dataSourceOOP;
  ed_contato_tipo.DataSource := Cliente.Contato._dataSourceOOP;
  ed_contato_contato.DataSource := Cliente.Contato._dataSourceOOP;
  ed_contato_telefone.DataSource := Cliente.Contato._dataSourceOOP;
  ed_contato_email.DataSource := Cliente.Contato._dataSourceOOP;

  if Trim(Cliente.strTmp) <> '' then
    setFocusCampoErro(Cliente.vNomeCampoErro, True);
  if not Assigned(lk_tipo_contato) then
    lk_tipo_contato := TDadosLookUp_OOP.Create;

  if not Assigned(lk_tipo_contato_pla) then
    lk_tipo_contato_pla := TDadosLookUp_OOP.create;
  if not Assigned(lk_aplicativo_contato_pla) then
    lk_aplicativo_contato_pla := TDadosLookUp_OOP.create;

  lk_tipo_contato.setDadosDataSet('ID', 'TIPO', Cliente.Contato.Tipo.dataSet, ed_contato_tipo);

  pn_contatos_view.Enabled := True;
  pn_contatos_cad.Enabled := False;
  pn_contatos_cad.Visible := False;
  Cliente.Contato.dataSet.Cancel;
end;

procedure TFrmCadClientes.pnDadosPessoais_DadosPessoaisEnter(Sender: TObject);
begin
  inherited;
  if Trim(Cliente.strTmp) <> '' then
    setFocusCampoErro(Cliente.vNomeCampoErro, True);
end;

procedure TFrmCadClientes.pnDadosPessoais_DocumentosEnter(Sender: TObject);
begin
  inherited;
  if Trim(Cliente.strTmp) <> '' then
    setFocusCampoErro(Cliente.vNomeCampoErro, True);
end;

procedure TFrmCadClientes.pnDadosPessoais_OutrosEnter(Sender: TObject);
begin
  inherited;
  if Trim(Cliente.strTmp) <> '' then
    setFocusCampoErro(Cliente.vNomeCampoErro, True);
end;

procedure TFrmCadClientes.pnEquipEnter(Sender: TObject);
begin
  inherited;
  Label144.Caption := Format('%0.2f', [Cliente.Contratos.vSoma]);
end;

procedure TFrmCadClientes.pnFotoEnter(Sender: TObject);
begin
  inherited;
  Cliente._recuperarFotoCliente;
end;

procedure TFrmCadClientes.pnSalvarCupomECEnter(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (DBComboBoxDescontoEmCupomEC.CanFocus) then
  	DBComboBoxDescontoEmCupomEC.SetFocus;
end;

procedure TFrmCadClientes.pnSReferenciasSPCEnter(Sender: TObject);
begin
  inherited;
  Cliente.vTipoConsultaCheckCheck.abreTipoConsultaCheckCheck;
end;

procedure TFrmCadClientes.pnValeTrocaEnter(Sender: TObject);
begin
  inherited;
  THackWinControl(PageControl7.ActivePage).SelectFirst;
end;

procedure TFrmCadClientes.pn_contatos_cadEnter(Sender: TObject);
begin
  inherited;
  pn_contatos_view.Enabled := False;
  bt_contatos_add.Enabled := pn_contatos_view.Enabled;
  bt_contatos_del.Enabled := pn_contatos_view.Enabled;
  bt_contatos_edit.Enabled := pn_contatos_view.Enabled;
  bt_contatos_save.Enabled := pn_contatos_cad.Enabled;
  bt_contatos_cancel.Enabled := pn_contatos_cad.Enabled;
end;

procedure TFrmCadClientes.pn_contatos_viewEnter(Sender: TObject);
begin
  inherited;
  pn_contatos_cad.Enabled := False;
  pn_contatos_cad.Visible := False;
  bt_contatos_add.Enabled := pn_contatos_view.Enabled;
  bt_contatos_del.Enabled := pn_contatos_view.Enabled;
  bt_contatos_edit.Enabled := pn_contatos_view.Enabled;
  bt_contatos_save.Enabled := pn_contatos_cad.Enabled;
  bt_contatos_cancel.Enabled := pn_contatos_cad.Enabled;
end;

procedure TFrmCadClientes.pn_contatos_pla_cadEnter(Sender: TObject);
begin
  inherited;
  pn_contatos_pla_view.Enabled := False;
  pn_contatos_pla_view.Visible := False; 
  bt_contatos_pla_add.Enabled := pn_contatos_pla_view.Enabled;
  bt_contatos_pla_del.Enabled := pn_contatos_pla_view.Enabled;
  bt_contatos_pla_save.Enabled := pn_contatos_pla_cad.Enabled;
  bt_contatos_pla_cancel.Enabled := pn_contatos_pla_cad.Enabled;
end;

procedure TFrmCadClientes.pn_contatos_pla_viewEnter(Sender: TObject);
begin
  inherited;
	pn_contatos_pla_cad.Enabled := False;
  pn_contatos_pla_cad.Visible := False;
  bt_contatos_pla_add.Enabled := pn_contatos_pla_view.Enabled;
  bt_contatos_pla_del.Enabled := pn_contatos_pla_view.Enabled;
  bt_contatos_pla_save.Enabled := pn_contatos_pla_cad.Enabled;
  bt_contatos_pla_cancel.Enabled := pn_contatos_pla_cad.Enabled;
end;

procedure TFrmCadClientes.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLabel29.Caption := Format('%0.2n', [vValorTemp]);
  QRLabel51.Caption := Format('%0.2n', [vValorTemp1]);
  vValorTemp := 0;
  vValorTemp1 := 0;
end;

procedure TFrmCadClientes.qrpClienteFornecPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório de Clientes / Fornecedores');
end;

procedure TFrmCadClientes.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  vValorTemp := vValorTemp + QRDBText13.DataSet.FieldByName(QRDBText13.DataField).AsFloat;
  if vValorTemp > 0 then
    vValorTemp1 := vValorTemp1 + 1;
  if Cliente.Contratos.fRelCab.FieldByName('COD_SERVICO').AsInteger > 0 then
    vInc := vInc + 1;
  QRLabel52.Caption := IntToStr(vInc);
end;

procedure TFrmCadClientes.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, QuickRep1.ReportTitle);
end;

procedure TFrmCadClientes.RadioGroup2Exit(Sender: TObject);
begin
  inherited;
  _GravaConfiguracoesInteger(RadioGroup2.Name, RadioGroup2.ItemIndex);
end;

procedure TFrmCadClientes.RadioGroupValesClick(Sender: TObject);
begin
  inherited;
  Cliente.vContaCorrenteCli.vResgateValeCupom.abreResgateVale(
  	Cliente.dataSet.FieldByName('CPFCGC').AsString, RadioGroupVales.ItemIndex = 1);
  BitBtnEstornarResgatarVale.Enabled := RadioGroupVales.ItemIndex = 0;
  BitBtnGerarValeTroca.Enabled := RadioGroupVales.ItemIndex = 0;
end;

procedure TFrmCadClientes.MenuItem4Click(Sender: TObject);
begin
  inherited;
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid18);
end;

procedure TFrmCadClientes.MenuItem2Click(Sender: TObject);
begin
  inherited;
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid18, GridCfg2, cdsColunas2, cdsGrid2, usuario2,
     vDadosIni.transacaoCol, fReset2, ListGridsAndDataSets2, false, ListPositions2);
end;

procedure TFrmCadClientes.MenuItem3Click(Sender: TObject);
begin
  inherited;
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid18, usuario2, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmCadClientes.ScrollBox6Enter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (pnFoto.CanFocus) then
    pnFoto.SetFocus;
end;

procedure TFrmCadClientes.ScrollBox9Enter(Sender: TObject);
begin
  inherited;
  lbUsuarioCadastrou.Caption := Cliente.dataSet.FieldByName('US_CAD_CLI').AsString + ' - ' + Cliente.UsuarioQCadastrou;
end;

procedure TFrmCadClientes.SelecionarTodosClienteClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Cliente._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadClientes.MenuItem6Click(Sender: TObject);
begin
  inherited;
  vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid18, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmCadClientes.MenuLateralExibirObservacaoClClick(Sender: TObject);
begin
  try
    MenuLateralExibirObservacaoCl.Checked := not MenuLateralExibirObservacaoCl.Checked;

    if (not MenuLateralExibirObservacaoCl.Checked)
    	and (not MenuLateralExibirObservacaoSpcCl.Checked)
      and (not MenuLateralExibirObservacaoReqOSCl.Checked) then
        MenuLateralExibirObservacaoCl.Checked := True;

    try
    	ckMenuLateral.Tag := 99;
    	ckMenuLateralClick(Sender);
    finally
    	ckMenuLateral.Tag := 0;
    end;
  finally
    _GravaConfiguracoesBoolean(MenuLateralExibirObservacaoCl.Name, MenuLateralExibirObservacaoCl.Checked);
    _GravaConfiguracoesInteger(pnObservacaoCl.Name, vDadosIni.IfThen(pnObservacaoCl.Height < 60, 60, pnObservacaoCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoSpcCl.Name, vDadosIni.IfThen(pnObservacaoSpcCl.Height < 60, 60, pnObservacaoSpcCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoReqOsCl.Name, vDadosIni.IfThen(pnObservacaoReqOsCl.Height < 60, 60, pnObservacaoReqOsCl.Height));
  end;
end;

procedure TFrmCadClientes.MenuLateralExibirObservacaoReqOSClClick(
  Sender: TObject);
begin
  try
    MenuLateralExibirObservacaoReqOSCl.Checked := not MenuLateralExibirObservacaoReqOSCl.Checked;

    if (not MenuLateralExibirObservacaoCl.Checked)
    	and (not MenuLateralExibirObservacaoSpcCl.Checked)
      and (not MenuLateralExibirObservacaoReqOSCl.Checked) then
        MenuLateralExibirObservacaoCl.Checked := True;

    try
    	ckMenuLateral.Tag := 99;
    	ckMenuLateralClick(Sender);
    finally
    	ckMenuLateral.Tag := 0;
    end;
  finally
    _GravaConfiguracoesBoolean(MenuLateralExibirObservacaoReqOSCl.Name, MenuLateralExibirObservacaoReqOSCl.Checked);
    _GravaConfiguracoesInteger(pnObservacaoCl.Name, vDadosIni.IfThen(pnObservacaoCl.Height < 60, 60, pnObservacaoCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoSpcCl.Name, vDadosIni.IfThen(pnObservacaoSpcCl.Height < 60, 60, pnObservacaoSpcCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoReqOsCl.Name, vDadosIni.IfThen(pnObservacaoReqOsCl.Height < 60, 60, pnObservacaoReqOsCl.Height));
  end;
end;

procedure TFrmCadClientes.MenuLateralExibirObservacaoSpcClClick(
  Sender: TObject);
begin
  try
    MenuLateralExibirObservacaoSpcCl.Checked := not MenuLateralExibirObservacaoSpcCl.Checked;

    if (not MenuLateralExibirObservacaoCl.Checked)
    	and (not MenuLateralExibirObservacaoSpcCl.Checked)
      and (not MenuLateralExibirObservacaoReqOSCl.Checked) then
        MenuLateralExibirObservacaoCl.Checked := True;

    try
    	ckMenuLateral.Tag := 99;
    	ckMenuLateralClick(Sender);
    finally
    	ckMenuLateral.Tag := 0;
    end;
  finally
  	_GravaConfiguracoesBoolean(MenuLateralExibirObservacaoSpcCl.Name, MenuLateralExibirObservacaoSpcCl.Checked);
    _GravaConfiguracoesInteger(pnObservacaoCl.Name, vDadosIni.IfThen(pnObservacaoCl.Height < 60, 60, pnObservacaoCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoSpcCl.Name, vDadosIni.IfThen(pnObservacaoSpcCl.Height < 60, 60, pnObservacaoSpcCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoReqOsCl.Name, vDadosIni.IfThen(pnObservacaoReqOsCl.Height < 60, 60, pnObservacaoReqOsCl.Height));
  end;
end;

procedure TFrmCadClientes.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if not Cliente.vCodigoForn.dataSet.IsEmpty then
    Cliente.vCodigoForn.Delete;
end;

procedure TFrmCadClientes.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES', 'A', Cliente.buscas) then
    Exit;
  if vDadosIni.PesqPros('CLI031', 'VISUALIZAR DEPENDENTES', '', 'CLIENTES',
    Cliente.dataSet.FieldByName('COD_CLIENTE').asString, Cliente.buscas, true) then
  begin
    if Cliente.AdCliente = nil then
      Cliente.AdCliente := TAdicionalCliente.create;
    TabSheet6.Show;
    TabSheet6.TabVisible := true;
    TabSheet7.Show;
    Cliente.AdCliente.abreAdicionalCliente(Cliente.dataSet.FieldByName('COD_CLIENTE').asinteger);
    Cliente.abreBairros;
    Cliente.abreCidades;
    Cliente.abreEstados;
  end;
end;

procedure TFrmCadClientes.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES', 'A', Cliente.buscas) then
    Exit;
  if vDadosIni.PesqPros('CLI032', 'VISUALIZAR CST PARA CLIENTE', '', 'CLIENTES',
    Cliente.dataSet.FieldByName('COD_CLIENTE').asString, Cliente.buscas, true) then
  begin
    if not Cliente.dataSet.IsEmpty then
      Cliente.CadCstMudCliente(0, Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger);
  end;
end;

procedure TFrmCadClientes.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  TForm(pnCodigoFornecedor.Parent).ModalResult := IDOK;
end;

procedure TFrmCadClientes.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  Cliente._abreFormCapturaWecam;
end;

procedure TFrmCadClientes.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  Cliente._buscaFotoNoDiscoRigido(OpenPictureDialog1);
end;

procedure TFrmCadClientes.SpeedButton18Click(Sender: TObject);
begin
  inherited;
  if Cliente._buscaFotoNoDiscoRigido(OpenPictureDialog1) then
   Cliente._gravarFotoCliente(1);

  Cliente.Foto.abreFotoCliente;
end;

procedure TFrmCadClientes.SpeedButton19Click(Sender: TObject);
begin
  inherited;
  Cliente._recuperarFotoCliente;
end;

procedure TFrmCadClientes.SpeedButton1Click(Sender: TObject);
var
  I: integer;
  vOK: Boolean;
begin
	if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES', 'A', Cliente.buscas) then
    Exit;
  if (not Cliente.dataSet.IsEmpty) and (Cliente.dataSet.FieldByName('ATIVO').AsInteger = 1) then
    vOK := True
  else if (not Cliente.dataSet.IsEmpty) and (Cliente.dataSet.FieldByName('ATIVO').AsInteger = 2) and (Cliente.strTmp = 'usarpossivecliente') then
    vOK := True
  else
    vOK := False;
  if not vOK then
    Exit;

  if not vDadosIni.PesqPros('CLI004', 'EDITANDO REGISTRO', '', 'CLIENTES',
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, Cliente.buscas, true) then
    Exit;

  Cliente.cadastroSimplificado := vDadosIni.getConfSisBool('cl_cad_simpl_habilitado', Cliente.buscas);

  vDadosIni.vInibeMensPesqPros := 'S';
 	SpeedButtonAlternarCadastro.Visible := vDadosIni.PesqPros('CLI292', 'HABILITAR', '', 'CLIENTES', '', Cliente.buscas, true);
  SpeedButtonAlternarCadastro2.Visible := SpeedButtonAlternarCadastro.Visible;

  if not vDadosIni.sincronizarDadosContatoClienteAplicativo(
  	Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
    	Exit;

  if cliente.cadastroSimplificado then
  begin
    if not Cliente.Edit then
    	Exit;

    HabilitarCamposEdicao;
  end
  else
  begin
    if not Cliente.Edit then
    	Exit;

    inherited;

    HabilitarCamposEdicao;
  end;
end;

procedure TFrmCadClientes.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  Cliente._deletarFoto;
end;

procedure TFrmCadClientes.SpeedButton21Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES_CONTRATOS', 'I', Cliente.buscas) then
    Exit;
  if not vDadosIni.PesqPros('CLI174', 'INCLUIR', '', 'CLIENTES_COM_CONTRATO ',
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, Cliente.buscas, true) then
    Exit;
  Cliente.Contratos._cancelar;
  MaskEdit16.Enabled := false;
  CheckBox5.Enabled := false;
  CheckBox5.Checked := false;
  Cliente.Contratos.vMODO := 'INSERIR';
  Cliente.Contratos._abreFormContratosCadastro;

end;

procedure TFrmCadClientes.SpeedButton22Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES_CONTRATOS', 'A', Cliente.buscas) then
    Exit;
  if not vDadosIni.PesqPros('CLI175', 'ALTERAR', '', 'CLIENTES_COM_CONTRATO ',
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsString + '/' +
    Cliente.Contratos.dataSet.FieldByName('COD_SERVICO').AsString, Cliente.buscas, true) then
    Exit;

  Cliente.Contratos._cancelar;

  if Cliente.Contratos._getDadosContrato then
  begin
    if Cliente.Contratos.vBOLETO = 'S' then
    begin
      MaskEdit16.Enabled := true;
      CheckBox5.Checked := true;
      CheckBox5.Enabled := false;
      Cliente.Contratos.vMODO := 'ALTERAR';
    end
    else
    begin
      MaskEdit16.Enabled := false;
      CheckBox5.Enabled := false;
      CheckBox5.Checked := false;
      Cliente.Contratos.vMODO := 'ALTERAR';
    end;
    Cliente.Contratos.vCOD_CONTRATO := Cliente.Contratos.dataSet.FieldByName('COD_CONTRATO').AsInteger;
    Cliente.Contratos._abreFormContratosCadastro;
  end;
end;

procedure TFrmCadClientes.SpeedButton23Click(Sender: TObject);
begin
  inherited;

  if Cliente.dataSet.FieldByName('TIPO').asString = 'C' then
    exit;
  if vDadosIni.PesqPros('CLI156', 'VISUALIZAR PRODUTOS DO FORNECEDOR', '', 'CLIENTES',
    Cliente.dataSet.FieldByName('COD_CLIENTE').asString, Cliente.buscas, true) then
  begin
    tsProdutosFornec.Show;
    tsProdutosFornec.TabVisible := true;
    tsProdutosFornec.Caption := 'Produtos do fornecedor ' +
      Cliente.dataSet.FieldByName('NOME_CLIENTE').asstring;
    DBGrid3.DataSource := DtmClientes.dsNFMestre;
    DBGrid4.DataSource := DtmClientes.dsINFDetalhe;
    Cliente.NFsFornecedor;
  end;
end;

procedure TFrmCadClientes.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES', 'A', Cliente.buscas) then
    Exit;
  if vDadosIni.vEmp.vBuscaCodNoProduto <> 'S' then
    SpeedButton41.Visible := false;

  Cliente.abreFormCodigoFornecedor;
end;

procedure TFrmCadClientes.SpeedButton25Click(Sender: TObject);
begin
	try
    if vDadosIni.PesqPros('CLI007', 'ABRIR A LIXEIRA', '', 'CLIENTES', '', Cliente.buscas, true) then
    begin
      inherited;
      if not Cliente.AbrirLixeira then
      begin
        SpeedButton2.Hint := 'Enviar para Lixeira -  [CLI033]';
        BitBtn3.Visible := true;
        SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
        ckLixeira.Enabled := false;
        ckLixeira.Checked := false;
        ckLixeira.Enabled := true;
      end
      else
      begin
        SpeedButton2.Hint := 'Excluir registro permanentemente -  [CLI005]';
        BitBtn3.Visible := false;
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
        ckLixeira.Enabled := false;
        ckLixeira.Checked := true;
        ckLixeira.Enabled := true;
      end;

      if Self.Tag = 789 then
      begin
        if ckLixeira.Checked then
          FrmCadClientes.Caption := 'Aniversariantes do dia (Lixeira)'
        else
          FrmCadClientes.Caption := 'Aniversariantes do dia';
      end
      else
      begin
        if ckLixeira.Checked then
          FrmCadClientes.Caption := 'Manutenção de Clientes e Fornecedores (Lixeira)'
        else
          FrmCadClientes.Caption := 'Manutenção de Clientes e Fornecedores';
      end;

    end;
  finally
    Cliente.ultimasql := Cliente.dataSet.CommandText;
  end;
end;

procedure TFrmCadClientes.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  Cliente._abreFormVizualisarFoto;
end;

procedure TFrmCadClientes.SpeedButton27Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES_CONTRATOS', 'E', Cliente.buscas) then
    Exit;
  if not vDadosIni.PesqPros('CLI176', 'EXCLUIR', '', 'CLIENTES_COM_CONTRATO ',
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsString + '/' +
    Cliente.Contratos.dataSet.FieldByName('COD_SERVICO').AsString, Cliente.buscas, true) then
    Exit;
  Cliente.Contratos._excluirDadosContrato;
end;

procedure TFrmCadClientes.SpeedButton28Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CLI177', 'RELATORIO', '', 'CLIENTES_COM_CONTRATO ',
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, Cliente.buscas, true) then
    Exit;
  Cliente.Contratos._abreFormContratosRelatorio;
end;

procedure TFrmCadClientes.SpeedButton29Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CLI178', 'VISUALIZAR', '', 'CLIENTES_COM_CONTRATO ',
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsString + '/' +
    Cliente.Contratos.dataSet.FieldByName('COD_SERVICO').AsString, Cliente.buscas, true) then
    Exit;
  Cliente.Contratos._getDetalhesVendas;
  Cliente.Contratos._abreFormContratosHistorico;
end;

procedure TFrmCadClientes.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES', 'E', Cliente.buscas) then
    Exit;
  Cliente.Delete;
  if Cliente.StatusLixeira then
    SpeedButton25.Visible := true
  else
    SpeedButton25.Visible := false;
end;

procedure TFrmCadClientes.SpeedButton30Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CLI179', 'VISUALIZAR', '', 'CLIENTES_COM_CONTRATO ',
    Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, Cliente.buscas, true) then
    Exit;

  try
    DBGrid11.DataSource.DataSet := Cliente.Contratos.buscas;
    Cliente.Contratos._abreFormContratosEquipamentos;
  finally
    DBGrid11.DataSource.DataSet := nil;
  end;
end;

procedure TFrmCadClientes.SpeedButton35Click(Sender: TObject);
begin
  inherited;
  TForm(pnContratos.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadClientes.SpeedButton36Click(Sender: TObject);
begin
  inherited;
  if Cliente.Contratos._selecionaContratos(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
	 Cliente._abreFormContratos(0, Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger);
//	if Cliente.Contratos._selecionaContratos(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
//     Cliente._abreFormContratos;

end;

procedure TFrmCadClientes.SpeedButton37Click(Sender: TObject);
var
  i: integer;
begin
  if SpeedButton37.Tag = 1 then
  begin
    SpeedButton37.Caption := 'v';
    SpeedButton37.Tag := 0;
    Panel2.Height := 57;
  end
  else if SpeedButton17.Tag = 0 then
  begin
    SpeedButton37.Caption := '^';
    SpeedButton37.Tag := 1;
    Panel2.Height := 110;
  end;
end;

procedure TFrmCadClientes.SpeedButton38Click(Sender: TObject);
var
  agenda: TAgenda;
begin
  inherited;
  agenda.cadAgenda(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger);
//  Cliente._abreFormAgendamentos(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger);
end;

procedure TFrmCadClientes.SpeedButton39Click(Sender: TObject);
begin
  inherited;
  Cliente._abreCRM;
end;

procedure TFrmCadClientes.SpeedButton3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('CLI006', 'IMPRIMIR', '', 'CLIENTES', '', Cliente.buscas, true) then
  begin
    inherited;
    if ((Trim(MaskEdit4.Text) <> '') and (Trim(MaskEdit5.Text) <> '') and (Trim(MaskEdit6.Text) <> '')) then
      Cliente.vNasc := 1
    else
      Cliente.vNasc := 0;

    Cliente.abreEstados;
    Cliente.RelClientesFornec;
  end;
end;

procedure TFrmCadClientes.SpeedButton40Click(Sender: TObject);
begin
  inherited;
  if TelaCadastro = 7 then
	  Cliente._enviarEmailCliente(false, false, 0, 7)
  else
  	Cliente._enviarEmailCliente;
//  if Application.MessageBox('Deseja enviar e-mails em lote para os clientes selecionados?','Confirmação',MB_YESNO+MB_ICONINFORMATION+MB_DEFBUTTON2)=IDYES then
//    Cliente._enviarEmailCliente(true)
//  else Cliente._enviarEmailCliente(false);
end;

procedure TFrmCadClientes.SpeedButton41Click(Sender: TObject);
begin
  inherited;
  if Cliente.vCodigoForn.dataSet.IsEmpty then
    exit;

  Cliente.vCodigoForn.Edit;
  Cliente.abreFormCadCodigoFornecedor;

  if (Self.Enabled) and (Self.Visible) and (DBEdit98.CanFocus) then
    DBEdit98.SetFocus; 
end;

procedure TFrmCadClientes.SpeedButton42Click(Sender: TObject);
begin
  inherited;
  if PageControl4.ActivePage.PageIndex < 2 then
    PageControl4.ActivePage.PageIndex := PageControl4.ActivePage.PageIndex + 1
  else PageControl4.ActivePage.PageIndex := 0;
end;

procedure TFrmCadClientes.SpeedButton43Click(Sender: TObject);
begin
  inherited;
  if PageControl4.ActivePage.PageIndex > 0 then
    PageControl4.ActivePage.PageIndex := PageControl4.ActivePage.PageIndex - 1
  else PageControl4.ActivePage.PageIndex := 2;
end;

procedure TFrmCadClientes.SpeedButton44Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES', 'A', Cliente.buscas) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CLI184', 'VISUALIZAR', '', 'CLIENTES', '', Cliente.buscas, True) then
      Exit;

    Cliente.vReds._abreClientes;
    Cliente.vReds.vColabOr._abreColaborador;
    Cliente.vReds.vColabDest._abreColaborador;
    PageControl1.ActivePage := tsCarteiras;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadClientes.SpeedButton45Click(Sender: TObject);
begin
 inherited;
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CLI187', 'EXPORTAR', '', 'CLIENTES', '', Cliente.buscas, True) then
      Exit;

     Cliente.abreFormModContrato;
  finally
    Screen.Cursor := crDefault;
  end;
end;


procedure TFrmCadClientes.btUnSelectTodosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    Cliente.vReds._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadClientes.Button1Click(Sender: TObject);
begin
  vDadosIni.getPontosProgFidelidade(Cliente.vContaCorrenteCli.dataSet.FieldByName('JSONCLASSES').AsString, TreeView1);
end;

procedure TFrmCadClientes.SpeedButton46Click(Sender: TObject);
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros('CLI185', 'ALTERAR', '', 'CLIENTES', '', Cliente.buscas, True) then
      Exit;

    if Application.MessageBox(pchar('Deseja mesmo mover clientes selecionados para o colaborador ' +
      Trim(Cliente.vReds.vColabDest.dataSet.FieldByName('nome_vendedor').AsString) + '?'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

    Cliente.vReds._moverClientesParaColaboradorSelecionado;
    Cliente.vReds._abreClientes;
    Edit10Exit(Edit10);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadClientes.SpeedButton47Click(Sender: TObject);
begin
  inherited;
  if Cliente._buscaFotoNoDiscoRigido(OpenPictureDialog1) then
    Cliente._gravarFotoCliente(2);

  Cliente.Foto.abreFotoCliente;
end;

procedure TFrmCadClientes.SpeedButton48Click(Sender: TObject);
begin
  inherited;
  Cliente.Foto.First;
  Cliente._recuperarFotoCliente;
end;

procedure TFrmCadClientes.SpeedButton49Click(Sender: TObject);
begin
  inherited;
  Cliente.Foto.Prior;
  Cliente._recuperarFotoCliente;
end;

procedure TFrmCadClientes.btSelectTodosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    Cliente.vReds._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadClientes.SpeedButton50Click(Sender: TObject);
begin
  inherited;
  Cliente.Foto.Next;
  Cliente._recuperarFotoCliente;
end;

procedure TFrmCadClientes.SpeedButton51Click(Sender: TObject);
begin
  inherited;
  Cliente.Foto.Last;
  Cliente._recuperarFotoCliente;
end;

procedure TFrmCadClientes.SpeedButton52Click(Sender: TObject);
begin
  inherited;
 if Cliente.Foto.IsEmpty then
  exit;

 if Cliente.Foto.dataSet.FieldByName('TIPO').AsInteger <> 2 then
  exit;
  
 if Cliente._gravarFotoCliente(2, true) then
    Cliente.Foto.abreFotoCliente;
end;

procedure TFrmCadClientes.SpeedButton53Click(Sender: TObject);
var
  FName, Ext: string;
begin
  inherited;
  if Cliente.Foto.IsEmpty then
   exit;

 if SaveDialog2.Execute then
  if SaveDialog2.FileName <> '' then
    ImageCli.Picture.SaveToFile(SaveDialog2.FileName);
end;

procedure TFrmCadClientes.SpeedButton54Click(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;
    vCheckCheck := TCheckCheck.create;
    vDadosIni.vPesquisaCliente := Cliente.dataSet.FieldByName('COD_CLIENTE').AsString;
    if Trim(vDadosIni.vPesquisaCliente) = '' then
    	Exit;
    vCheckCheck.cadCheckCheck;
    Cliente.Refresh;
  finally
    vDadosIni.vPesquisaCliente := '';
  	Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadClientes.SpeedButton55Click(Sender: TObject);
begin
  inherited;
  if (Cliente.dataSet.State in [dsInsert, dsEdit]) then
    Cliente.dataSet.FieldByName('CNSCHECKCHECK').Value := Null;
end;

procedure TFrmCadClientes.SpeedButton56Click(Sender: TObject);
begin
  inherited;
  if Cliente.cadastroSimplificado then
    if not ((DBEdit150.Enabled) and (DBEdit151.Enabled) and (DBEdit152.Enabled) and
      (DBEdit153.Enabled) and (DBLookupComboBox35.Enabled)) then
    begin
      Application.MessageBox(PChar('Algum campo do endereço de cobrança não é permitido alteração.' + #13 +
        'Por favor altere manualmente o endereço'), 'Atenção', 0 + 64);
      Exit;
    end;
  Perform(WM_NEXTDLGCTL, 0, 0);
  Cliente.setMesmoEnderecoCobIgualPrincipal;
end;

procedure TFrmCadClientes.SpeedButton58Click(Sender: TObject);
begin
  inherited;
  if (ActiveControl = DBMemo4) and (BitBtn_4.CanFocus) then
    ActiveControl := BitBtn_4//apenas para sair do campo de obs caso tenha sido digitado algum dado
  else if (ActiveControl = DBMemo1) and (BitBtn4.CanFocus) then
  	ActiveControl := BitBtn4;//apenas para sair do campo de obs caso tenha sido digitado algum dado

  vDadosIni.abreForm('Observações', pnObsMaxmized, [ofAlignAllClientWinCtrl, ofMaximized]);
end;

procedure TFrmCadClientes.btnDadosPessoaisAdClick(Sender: TObject);
begin
  inherited;

  //Tipo Participante
  Cliente.vLKTemp1.setDadosDataSet(['C','F', 'A'], ['C - Cliente', 'F - Forncedor', 'A - Ambos'], DBLookupComboBox32);

  //Tipo Cliente Fornecedor
  Cliente.ExecutaComandosSql('select codigo_tipo, descricao_tipo from tipos_clientes where ativo = 1', False);
  Cliente.vLKTemp2.setDadosDataSet('CODIGO_TIPO', 'DESCRICAO_TIPO', Cliente.buscas,  DBLookupComboBox33);

  //Estado Civil
  Cliente.vLKTemp3.setDadosDataSet(['S','C'], ['Solteiro', 'Casado'], DBLookupComboBox34);

  vDadosIni.abreForm('Mais dados - Dados Pessoais', pnDadosPessoais_DadosPessoais, [ofAutoSize, ofEscapeExit]);

  if not tsSAtributosSimples.TabVisible then
    if (tsSAtributosSimples.Tag = 1) and (Cliente.dataSet.State = dsEdit) then
    begin
      if (vDadosIni.strIn(Cliente.dataSet.FieldByName('TIPO').AsString, ['F', 'A'])) and
        (Cliente._abreAtributos(Cliente.dataSet.FieldByName('cod_cliente').AsInteger)) then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
        if vDadosIni.PesqPros('CLI188', 'HABILITAR', '', 'CLIENTES', '', Cliente.buscas, true) then
        begin
          tsSAtributosSimples.TabVisible := tsSAtributosSimples.Tag = 1;
          btnsAtributos.Visible := btnsAtributos.Tag = 1;
        end;
      end
      else
      begin
        tsSAtributosSimples.TabVisible := False;
        btnsAtributos.Visible := False;
      end;
    end;
end;

procedure TFrmCadClientes.btnEdendecoAdClick(Sender: TObject);
begin
  inherited;
  try

    //Bairro de Cobranca
    if Cliente.vLKBaiCob.dataSet = nil then
    begin
      Cliente.vLKBaiCob.Sql := Cliente.vLKBairro.Sql;
      Cliente.vLKBaiCob.setDadosDataSet(['COD_BAIRRO_COBRANCA', 'BAIRRO_COBRANCA'], ['COD_BAIRRO', '%NOME_BAIRRO'], [] ,
        Cliente.buscas, DBEdit152, dbgridLookUp, false, DBEdit152.Top + 21, 0, 126);
    end;

    //Cidade de Cobranca
    if Cliente.vLKCidCob.dataSet = nil then
    begin
      Cliente.vLKCidCob.Sql := Cliente.vLKCidade.Sql;
      Cliente.vLKCidCob.setDadosDataSet(['COD_CIDADE_COBRANCA', 'CIDA_COBRANCA', 'EST_CODIGO_UF'], ['COD_CIDADE', '%NOME_CIDADE', 'CODIGO_UF'],
        ['Cod', 'Cidade', 'Cidade IBGE', 'Cod IBGE', 'Estado', 'Cod UF'],
      Cliente.buscas, DBEdit153, dbgridLookUp, True, DBEdit153.Top + 21, 0, 99);
    end;

    //Estado de cobrança
    Cliente.vLKEstado.setDBLookupComboBox(DBLookupComboBox35);

    //Localidade
    if Cliente.vLKLocalidade.dataSet = nil then
    begin
      Cliente.SqlOpen('select l.cod_localidade, l.localidade||'' - ''||s.setor as localidade' +
        ' from localidade l' +
        ' inner join setor s on s.cod_setor = l.cod_setor and s.cod_empresa = l.cod_empresa' +
        ' where l.cod_empresa = %s' +
        ' union' +
        ' select null cod_localidade, '' *** SEM LOCALIDADE ***  '' localidade from rdb$database' +
        ' order by 2', [vDadosIni.codEmpresa]);
      Cliente.vLKLocalidade.setDadosDataSet('COD_LOCALIDADE', 'LOCALIDADE', Cliente.buscas,  DBLookupComboBox38);
    end;

    vDadosIni.abreForm('Mais dados - Endereços', pnDadosPessoais_Endereco, [ofAutoSize]);

  finally
    //Bairro
    Cliente.vLKBairro.setDBEditDBGrid(DBEdit118, dbgridLookUp, 0, 0,0, 300);
    //Cidade
    Cliente.vLKCidade.setDBEditDBGrid(DBEdit119, dbgridLookUp);
  end;
end;

procedure TFrmCadClientes.btnDocumentosAdClick(Sender: TObject);
begin
  inherited;
  vDadosIni.abreForm('Mais dados - Documentos', pnDadosPessoais_Documentos, [ofAutoSize, ofEscapeExit]);
end;

procedure TFrmCadClientes.SpeedButton59Click(Sender: TObject);
var
  vPointer: TPoint;
begin
  inherited;
  vDadosIni.configurarSistema('cl_%', Cliente.buscas);

//  GetCursorPos(vPointer);
//  popMenuTela.Popup(vPointer.X, vPointer.Y);

end;

procedure TFrmCadClientes.spBtAutXMLAdicionarClick(Sender: TObject);
var
  vTemp: string;
begin
  inherited;

  if not (Cliente.dataSet.State in [dsInsert, dsEdit]) then
    exit;

  if not InputQuery('Autorizar CPF ou CNPJ', 'Informe o CPF ou CNPJ de que você deseja autorizar acesso ao XML', vTemp) then
    Exit;

  try
    if Trim(vTemp) = '' then
      raise exception.Create('CFP ou CNPJ não informado');

    if (Length(Trim(vTemp)) <> 11) and (Length(Trim(vTemp)) <> 14) then
      raise exception.Create('CFP ou CNPJ inválido. O campo deve conter 11 dígitos para CPF ou 14 para CNPJ');

    if (Length(Trim(vTemp)) = 11) then
      if not Cliente.CPF(Trim(vTemp)) then
        raise exception.Create('CFP inválido');

    if (Length(Trim(vTemp)) = 14) then
      if not Cliente.cgc(Trim(vTemp)) then
        raise exception.Create('CNPJ inválido');

    if pos(Trim(vTemp), lbxAutXML.Items.Text) > 0 then
      if (Length(Trim(vTemp)) = 14) then
        raise exception.Create('CNPJ já incluído')
      else if (Length(Trim(vTemp)) = 11) then
        raise exception.Create('CPF já incluído');

    lbxAutXML.Items.Add(Trim(vTemp));

  except on E: Exception do
    begin
      Application.MessageBox(Pchar(e.Message), 'Erro', 0 + 64);
    end;
  end;
end;

procedure TFrmCadClientes.spBtAutXMLRemoverClick(Sender: TObject);
begin
  inherited;
  if lbxAutXML.ItemIndex <> - 1 then
    lbxAutXML.DeleteSelected;
end;

procedure TFrmCadClientes.spBtConsWSCEPDepClick(Sender: TObject);
var
  CEPs: TCEP;
  ListaCep: TStringList;
  Bairros: TListaBairros1;
  Cidades: TListaCidades1;
  Estado: TListaEtados1;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit66.CanFocus) then
  	DBEdit66.SetFocus;
  ListaCep := CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(
    Cliente.AdCliente.dataSet.FieldByName('CEP').AsString);
  if (ListaCep[0] = '') then
  begin
    if (CEPs._ConsultarWebService(Cliente.AdCliente.dataSet.FieldByName('CEP').AsString)) then
    begin
      ListaCep :=
        CEPs._TrazerCodigosEst0Cid1Bai2NomesEnd3SiglaEst4Est5Cid6Bai7(Cliente.AdCliente.dataSet.FieldByName('CEP').AsString);
      if (ListaCep[0] <> '') then
      begin
        if DBLookupComboBox11.ListSource.DataSet.Active then
        begin
          DBLookupComboBox11.ListSource.DataSet.Close;
          DBLookupComboBox11.ListSource.DataSet.Open;
        end;
        if DBLookupComboBox12.ListSource.DataSet.Active then
        begin
          DBLookupComboBox12.ListSource.DataSet.Close;
          DBLookupComboBox12.ListSource.DataSet.Open;
        end;
        if DBLookupComboBox13.ListSource.DataSet.Active then
        begin
          DBLookupComboBox13.ListSource.DataSet.Close;
          DBLookupComboBox13.ListSource.DataSet.Open;
        end;
        Cliente.AdCliente.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
        Cliente.AdCliente.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
        Cliente.AdCliente.dataSet.FieldByName('ESTADO').AsString := ListaCep[4];
        Cliente.AdCliente.dataSet.FieldByName('ENDERECO').asstring := ListaCep[3];
      end;
    end;
  end
  else if ListaCep[0] <> '' then
  begin
    Cliente.AdCliente.dataSet.FieldByName('COD_BAIRRO').AsInteger := strtoint(ListaCep[2]);
    Cliente.AdCliente.dataSet.FieldByName('COD_CIDADE').AsInteger := strtoint(ListaCep[1]);
    Cliente.AdCliente.dataSet.FieldByName('ESTADO').AsString := ListaCep[4];
    Cliente.AdCliente.dataSet.FieldByName('ENDERECO').asstring := ListaCep[3];
  end;
  if (Self.Enabled) and (Self.Visible) and (DBEdit70.CanFocus) then
  	DBEdit70.SetFocus;
end;

procedure TFrmCadClientes.SpeedButton5Click(Sender: TObject);
begin
	inherited;  
  if not vDadosIni.validarAcessoCadastrosEmpresas('CLIENTES', 'A', Cliente.buscas) then
    Exit;
    
//  if not vDadosIni.PesqPros('CLI008', '', '', 'CLIENTES', '', Cliente.buscas, false) then
//  	exit;
  if Cliente.restaurarLixeira then
	  lixeiraVazia(not Cliente.StatusLixeira);
end;

procedure TFrmCadClientes.btAlterarCupomECClick(Sender: TObject);
begin
  inherited;
  // Nao é para alterar cupom
  exit;
  if Cliente.CupomDescontoCliente.dataSet.IsEmpty then
  	exit;

  if not Cliente.CupomDescontoCliente.Edit(Cliente) then
  	exit;

  if trim(Cliente.CupomDescontoCliente.dataSet.FieldByName('desconto_em').AsString) = 'PERCENTUAL' then
  	DBComboBoxDescontoEmCupomEC.ItemIndex := 0
  else
  	DBComboBoxDescontoEmCupomEC.ItemIndex := 1;

  if DBComboBoxDescontoEmCupomEC.ItemIndex = 0 then
  	lbDescTipoDesc.Caption := 'Desconto (%):'
  else
  	lbDescTipoDesc.Caption := 'Desconto (R$):';

  CheckBoxUtilizarPeriodoValidade.Checked := Cliente.CupomDescontoCliente.dataSet.FieldByName('util_per_val').AsString = 'S';
  DBEditDataIniValidade.Enabled := Cliente.CupomDescontoCliente.dataSet.FieldByName('util_per_val').AsString = 'S';
  DBEditDataFimValidade.Enabled := Cliente.CupomDescontoCliente.dataSet.FieldByName('util_per_val').AsString = 'S';

  pnSalvarCupomEC.Visible := true;
	vDadosIni.abreForm('Cupom de desconto E-Commerce', pnSalvarCupomEC, [ofEscapeExit, ofAlignAllClientWinCtrl]);
  pnSalvarCupomEC.Visible := false;
end;

procedure TFrmCadClientes.btCancelarCupomECClick(Sender: TObject);
begin
  inherited;
  Cliente.CupomDescontoCliente.Cancel;
  Cliente.CupomDescontoCliente.CancelUpdates;

	TForm(pnSalvarCupomEC.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadClientes.btCancelEndDocClick(Sender: TObject);
begin
  inherited;
  Cliente.EndDocAd.Cancel;
  btSalvarEndDoc.Enabled := False;
  btCancelEndDoc.Enabled := False;
  btEditEndDocAd.Enabled := not Cliente.EndDocAd.dataSet.IsEmpty;
  groupEndDocAd.Enabled := True;
  gridEndDocAdd.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (gridEndDocAdd.CanFocus) then
    gridEndDocAdd.SetFocus;
end;

procedure TFrmCadClientes.btEditEndDocAdClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CLI279', 'ALTERAR', '', 'CLIENTES_END_DOC_ADD',
    Cliente.dataSet.FieldByName('COD_CLIENTE').asstring, Cliente.buscas, true) then
    Exit;
  if Cliente.EndDocAd.Edit then
  begin
    btEditEndDocAd.Enabled := False;
    btSalvarEndDoc.Enabled := True;
    btCancelEndDoc.Enabled := btSalvarEndDoc.Enabled;
    if (Self.Enabled) and (Self.Visible) and (DBEdit203.CanFocus) then
    	DBEdit203.SetFocus;
  end;
end;

procedure TFrmCadClientes.btExcluirCupomECClick(Sender: TObject);
begin
  inherited;
	if Cliente.CupomDescontoCliente.dataSet.IsEmpty then
  	exit;

  if not Cliente.CupomDescontoCliente.Delete(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
  	exit;
end;

procedure TFrmCadClientes.btgoup_rotaent_addButtonClicked(Sender: TObject;
  Index: Integer);
var
  I: Integer;
begin
  inherited;
  if Assigned(Cliente.EndDocAd.rotas) then

  if vDadosIni.ShowConfirmacao('Excluir rota do cliente?') = IDYES then
  begin
    if Cliente.EndDocAd.rotas.Remover(TButtonGroup(Sender).Items[Index].Hint) then
      TButtonGroup(Sender).Items.Delete(Index);
  end;
end;

procedure TFrmCadClientes.btgoup_rotaent_addItems0Click(Sender: TObject);
var
  Abts: TButtonGroup;
  Arotas: TRotas_entr_classList;
  I: Integer;
begin
  inherited;
  if not Assigned(Cliente.EndDocAd.rotas) then
    Exit;

  if Cliente.EndDocAd.dataSet.IsEmpty then
    Exit;
    
  if Cliente.EndDocAd.f_int('ativo') = 0 then
    Exit;

  Arotas := Cliente.EndDocAd.rotas.GetRotasAtivas;
  try
    listGrid.Clear;
    for I := 0 to Arotas.Count - 1 do with Arotas.Items[I] do
      listGrid.Items.Add(Format('%s - Rota %s - %s', [vDadosIni.StrZero(cod_rota, 3), rota, descricao]));

    pn_pnmemo_botoes.Visible := True;
    spSairGrid.Visible       := False;

    Abts := btgoup_rotaent_add;

    if vDadosIni.abreForm('Selecione a rota para incluir', pnMemo, opFormsDefCadEsc) then
      if listGrid.ItemIndex >= 0 then
        if Cliente.EndDocAd.rotas.Adicionar(Arotas.Items[listGrid.ItemIndex]) then
          with Arotas.Items[listGrid.ItemIndex] do
            with Abts.Items.Add do
            begin
              Caption := rota;
              Hint    := Format('%s - Rota %s - %s', [vDadosIni.StrZero(cod_rota, 3), rota, descricao]);
            end;
  finally
    FreeAndNil(Arotas);
    pn_pnmemo_botoes.Visible := False;
    spSairGrid.Visible       := True;
  end;
end;

procedure TFrmCadClientes.btgoup_rotaent_complButtonClicked(Sender: TObject;
  Index: Integer);
var
  I: Integer;
begin
  inherited;
  if vDadosIni.ShowConfirmacao('Excluir rota do cliente?') = IDYES then
  begin
    if Cliente.rotas.Remover(TButtonGroup(Sender).Items[Index].Hint) then
      TButtonGroup(Sender).Items.Delete(Index);
  end;
end;

procedure TFrmCadClientes.btgoup_trib_pref_addButtonClicked(Sender: TObject;
  Index: Integer);
var
  I: Integer;
begin
  inherited;
  if Assigned(Cliente.EndDocAd.tribAd) then
    if vDadosIni.ShowConfirmacao('Excluir perfil de tributação do cliente?') = IDYES then
    begin
      if Cliente.EndDocAd.tribAd.Remover(TButtonGroup(Sender).Items[Index].Caption) then
        TButtonGroup(Sender).Items.Delete(Index);
    end;
end;

procedure TFrmCadClientes.btgoup_trib_pref_comButtonClicked(Sender: TObject;
  Index: Integer);
var
  I: Integer;
begin
  inherited;
  if vDadosIni.ShowConfirmacao('Excluir perfil de tributação do cliente?') = IDYES then
  begin
    if Cliente.tribAd.Remover(TButtonGroup(Sender).Items[Index].Caption) then
      TButtonGroup(Sender).Items.Delete(Index);
  end;
end;

procedure TFrmCadClientes.btgoup_rotaentItems0Click(Sender: TObject);
var
  Abts: TButtonGroup;
  Arotas: TRotas_entr_classList;
  I: Integer;
begin
  inherited;
  Arotas := Cliente.rotas.GetRotasAtivas;
  try
    listGrid.Clear;
    for I := 0 to Arotas.Count - 1 do with Arotas.Items[I] do
      listGrid.Items.Add(Format('%s - Rota %s - %s', [vDadosIni.StrZero(cod_rota, 3), rota, descricao]));

    pn_pnmemo_botoes.Visible := True;
    spSairGrid.Visible       := False;

    if cliente.cadastroSimplificado then
      Abts := btgoup_rotaent_simpl
    else
      Abts := btgoup_rotaent_compl;

    if vDadosIni.abreForm('Selecione a rota para incluir', pnMemo, opFormsDefCadEsc) then
      if listGrid.ItemIndex >= 0 then
        if Cliente.rotas.Adicionar(Arotas.Items[listGrid.ItemIndex]) then
          with Arotas.Items[listGrid.ItemIndex] do
            with Abts.Items.Add do
            begin
              Caption := rota;
              Hint    := Format('%s - Rota %s - %s', [vDadosIni.StrZero(cod_rota, 3), rota, descricao]);
            end;
  finally
    FreeAndNil(Arotas);
    pn_pnmemo_botoes.Visible := False;
    spSairGrid.Visible       := True;
  end;
end;

procedure TFrmCadClientes.btnContatoTelefoneAdClick(Sender: TObject);
begin
  inherited;

  Cliente.vLKSimNao.setDBLookupComboBox(DBLookupComboBox39);

  if (Cliente.Contato.dataSet.State in [dsInsert, dsEdit]) then
  	Cliente.Contato.dataSet.Cancel;

  if (Cliente.ContatoMsg.dataSet.State in [dsInsert, dsEdit]) then
  	Cliente.ContatoMsg.dataSet.Cancel;

  pn_contatos_cad.Enabled        := False;
  pn_contatos_cad.Visible        := False;

  pn_contatos_view.Enabled       := True;
  pn_contatos_view.Visible       := True;

  bt_contatos_add.Enabled        := True;
  bt_contatos_edit.Enabled       := True;
  bt_contatos_del.Enabled        := True;

  bt_contatos_save.Enabled       := False;
  bt_contatos_cancel.Enabled     := False;

  pn_contatos_pla_cad.Enabled    := False;
  pn_contatos_pla_cad.Visible    := False;

  pn_contatos_pla_view.Enabled   := True;
  pn_contatos_pla_view.Visible   := True;

  bt_contatos_pla_add.Enabled    := True;
  bt_contatos_pla_del.Enabled    := True;

  bt_contatos_pla_save.Enabled   := False;
  bt_contatos_pla_cancel.Enabled := False;

  lb_contato_pla_identificacao.Caption := 'Identificação';
  Cliente.ContatoMsg.dataSet.FieldByName('IDENTIFICADOR').EditMask := '';
  vCodPlataforma := 0;

  if vDadosIni.vHwCloudIA.vUsarServMensageria = 'S' then
  	vDadosIni.abreForm('Mais dados - Contato / Telefones', pnDadosPessoais_ContatosPlataforma, [ofAutoSize, ofEscapeExit])
  else
  	vDadosIni.abreForm('Mais dados - Contato / Telefones', pnDadosPessoais_ContatosTelefone, [ofAutoSize, ofEscapeExit]);
end;

procedure TFrmCadClientes.SpeedButton60Click(Sender: TObject);
var
  I: Integer;
begin
  vhabEmp := false;

  if (not vDadosIni.vProgFid.vHabilitarProgFid) and (not vDadosIni.vCashback.vHabilitarCashback) then
  begin
  	if TelaCadastro = 8 then
    begin
      vDadosIni.fechaStatusProcessamento;
      FrmCadClientes.fechar := True;
      PostMessage(FrmCadClientes.Handle, WM_CLOSE, 0, 0);
    end;
    exit;
  end;

  if Cliente.dataSet.IsEmpty then
  begin
  	if TelaCadastro = 8 then
    begin
      vDadosIni.fechaStatusProcessamento;
      FrmCadClientes.fechar := True;
      PostMessage(FrmCadClientes.Handle, WM_CLOSE, 0, 0);
    end;
    exit;
  end;

  if not vDadosIni.PesqPros('CLI217', 'VISUALIZAR', 'CLIENTE: ' + IntToStr(Cliente.dataSet.FieldByName('COD_CLIENTE').AsInteger),
     'CONTA_CORRENTE_PROG_FIDELIDADE', '', Cliente.buscas, true) then
  begin
  	if TelaCadastro = 8 then
    begin
      vDadosIni.fechaStatusProcessamento;
      FrmCadClientes.fechar := True;
      PostMessage(FrmCadClientes.Handle, WM_CLOSE, 0, 0);
    end;
    Exit;
  end;

  BitBtnSairExtratoContaCorrente.Visible               := true;
  BitBtnVoltarExtratoContaCorrente.Visible             := false;
  BitBtnVisualizarVencidosExtratoContaCorrente.Enabled := true;

  BitBtnVoltarExtratoContaCorrente.Top := BitBtnSairExtratoContaCorrente.Top;
  BitBtnVoltarExtratoContaCorrente.Left := BitBtnSairExtratoContaCorrente.Left;

  lnInfEnvAPI.Visible := false;
  if (trim(Cliente.dataSet.FieldByName('CPFCGC').AsString) = '')
  	and (trim(Cliente.dataSet.FieldByName('FONE_CELULAR').AsString) = '') then
  begin
    lnInfEnvAPI.Visible := true;
    lnInfEnvAPI.Caption := 'Cliente sem cpf/cnpj e celular informado, os dados não serão sincronizadas com API';
  end
	else if (trim(Cliente.dataSet.FieldByName('CPFCGC').AsString) = '') then
  begin
	  lnInfEnvAPI.Visible := true;
    lnInfEnvAPI.Caption := 'Cliente sem cpf/cnpj informado, os dados não serão sincronizadas com API';
  end
  else if (trim(Cliente.dataSet.FieldByName('FONE_CELULAR').AsString) = '') then
  begin
    lnInfEnvAPI.Visible := true;
    lnInfEnvAPI.Caption := 'Cliente sem celular informado, os dados não serão sincronizadas com API';
  end;

  ComboBox15.ItemIndex := _LerConfiguracoesRegistroInteger(ComboBox15.Name, ComboBox15.ItemIndex);

  vComboBox15ItemIndex := ComboBox15.ItemIndex;

  vDtDiaFinanc := vDadosIni.getDataBanco(Cliente.buscas);

  Label357.Visible := Cliente.vContaCorrenteCli.dataSet.FieldByName('VALOR').Visible;
  Label359.Visible := Cliente.vContaCorrenteCli.dataSet.FieldByName('VALOR').Visible;
  Cliente.vContaCorrenteCli.vPagGrid  := 0;
  Cliente.vContaCorrenteCli.vQtdeGrid := StrToInt(ComboBox15.Items[ComboBox15.ItemIndex]);
  if not Cliente.vContaCorrenteCli.abreContaCorrente(
  	Cliente.dataSet.FieldByName('cod_cliente').AsInteger,
  	Cliente.dataSet.FieldByName('cpfcgc').AsString,
    DBGrid18,
    Label348) then
      Exit;

  Label402.Caption := 'Exibindo ' +
    	IntToStr(vDadosIni.IfThen(Cliente.vContaCorrenteCli.vRecordCount > 0,
      					 (Cliente.vContaCorrenteCli.vQtdeGrid * Cliente.vContaCorrenteCli.vPagGrid) + 1,
                 0)) +
      ' até ' +
      IntToStr(vDadosIni.IfThen(Cliente.vContaCorrenteCli.vRecordCount > 0,
      					 (Cliente.vContaCorrenteCli.vQtdeGrid * Cliente.vContaCorrenteCli.vPagGrid) + Cliente.vContaCorrenteCli.vRecordPagGrid,
                 0)) +
      ' de ' +
      IntToStr(Cliente.vContaCorrenteCli.vRecordCount) +
      ' linhas';

  vhabEmp := Cliente.vContaCorrenteCli.habilitarEmpresa;
  for I := 0 to DBGrid18.FieldCount - 1 do
  begin
    if not vhabEmp then
    begin
      if (DBGrid18.Columns[I].FieldName = 'COD_EMP_RESP') then
      begin
        DBGrid18.Columns[I].Visible := false;
        Cliente.vContaCorrenteCli.dataSet.FieldByName('COD_EMP_RESP').Visible := false;
      end;
    end
    else
    begin
      if (DBGrid18.Columns[I].FieldName = 'COD_EMP_RESP') then
      begin
        DBGrid18.Columns[I].Visible := True;
        Cliente.vContaCorrenteCli.dataSet.FieldByName('COD_EMP_RESP').Visible := True;
      end;
    end;
  end;

  BitBtnIncluirExtratoContaCorrente.Enabled                 := vDadosIni.vProgFid.vHabilitarProgFid;
  BitBtnExcluirExtratoContaCorrente.Enabled                 := vDadosIni.vProgFid.vHabilitarProgFid;
  BitBtnGerarValeExtratoContaCorrente.Enabled               := true;
  BitBtnResgatarValeExtratoContaCorrente.Enabled            := true;
  BitBtnTransferirSaldoExtratoContaCorrente.Enabled         := vDadosIni.vProgFid.vHabilitarProgFid;
  BitBtnVisualizarTransferenciaExtratoContaCorrente.Enabled := vDadosIni.vProgFid.vHabilitarProgFid;
  BitBtnVisualizarVencidosExtratoContaCorrente.Enabled      := true;

  Label349.Visible                                          := vDadosIni.vProgFid.vHabilitarProgFid;
  Label350.Visible                                          := vDadosIni.vProgFid.vHabilitarProgFid;

  if vDadosIni.vProgFid.vHabilitarProgFid then
  	//
  else if vDadosIni.vCashback.vHabilitarCashback then
  	Label359.Caption := 'R$ ' + FormatFloat('#,##0.00', Cliente.nummus_consultar_saldo);

  Label357.Caption := vDadosIni.IfThen(vDadosIni.vProgFid.vHabilitarProgFid, 'Valor aproximado:', 'Saldo acumulado (R$): ');

  Cliente.vContaCorrenteCli.dataSet.FieldByName('PONTOS').Visible :=
  	vDadosIni.IfThen(vDadosIni.vProgFid.vHabilitarProgFid, True, False);
  Cliente.vContaCorrenteCli.dataSet.FieldByName('PONTOS').Tag     :=
  	vDadosIni.IfThen(vDadosIni.vProgFid.vHabilitarProgFid, 0, 1);

  for I := 0 to DBGrid18.Columns.Count - 1 do
  	if DBGrid18.Columns[I].FieldName = 'PONTOS' then
    begin
      DBGrid18.Columns[I].Visible :=
       	vDadosIni.IfThen(vDadosIni.vProgFid.vHabilitarProgFid, True, False);
      Break;
    end;      

  PageControl1.ActivePage := tsContaCorrente;
  tsContaCorrente.Show;

  PageControl5.ActivePage := tsConsContaCorrente;
  tsConsContaCorrente.Show;
end;

procedure TFrmCadClientes.SpeedButton61Click(Sender: TObject);
var
  CEPs: TCEP;
  vExisteCEP: Boolean;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn_4.CanFocus) then
    BitBtn_4.SetFocus;
  CEPS := TCEP.create;
  if not CEPs.getEndereco(cliente.dataSet.FieldByName('CEP').AsString) then
    CEPs._ConsultarWebService(cliente.dataSet.FieldByName('CEP').AsString)
  else
    vExisteCEP := True;

  if not vExisteCEP then
    vExisteCEP := CEPs.getEndereco(cliente.dataSet.FieldByName('CEP').AsString);

  if vExisteCEP then
  begin
  	Cliente.vLKBairro.dataSet.Refresh;
    if Cliente.vLKBaiCob.dataSet <> nil then
      Cliente.vLKBaiCob.dataSet.Refresh;
    Cliente.vLKCidade.dataSet.Refresh;
    if Cliente.vLKCidCob.dataSet <> nil then
      Cliente.vLKCidCob.dataSet.Refresh;

    cliente.dataSet.FieldByName('ENDERECO').asstring := ceps.logradouro;
    cliente.dataSet.FieldByName('COD_BAIRRO').AsInteger := ceps.codigo_bairro;
    cliente.dataSet.FieldByName('COD_CIDADE').AsInteger := ceps.codigo_cidade;
    cliente.dataSet.FieldByName('CODIGO_UF').AsInteger := ceps.codigo_uf;
    cliente.dataSet.FieldByName('CIDADE').asstring := ceps.nome_cidade;
    cliente.dataSet.FieldByName('BAIRRO').asstring := ceps.nome_bairro;

    if cliente.dataSet.FieldByName('CODIGO_UF').AsInteger > 0 then
    begin
      Cliente.SqlOpen('select es.codigo_uf, es.sigla_uf from estados es ' +
        ' where es.codigo_uf = ' + IntToStr(cliente.dataSet.FieldByName('CODIGO_UF').AsInteger), Cliente.buscas);
      if Cliente.buscas.FieldByName('CODIGO_UF').AsInteger > 0 then
        Cliente.dataSet.FieldByName('ESTADOS_UF').AsString := Cliente.buscas.FieldByName('SIGLA_UF').AsString;
    end;
  end;
  if (Self.Enabled) and (Self.Visible) and (DBEdit115.CanFocus) then
    DBEdit115.SetFocus;
end;

procedure TFrmCadClientes.SpeedButton62Click(Sender: TObject);
var
  vTemp: string;
begin
  inherited;
  if not (Cliente.dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  if not InputQuery('Autorizacao XML', 'Informe o CPF/CNPJ', vTemp) then
    Exit;
  vTemp := Trim(vTemp);

  if (Length(vTemp) <> 11) and (Length(vTemp) <> 14) then
    raise exception.create('CPF ou CNPJ inválido');

  if Length(vTemp) = 11 then
    if not Cliente.CPF(vTemp) then
      raise exception.create('CPF inválido');
  if Length(vTemp) = 14 then
    if not Cliente.CNPJ(vTemp) then
      raise exception.create('CNPJ inválido');

  vTemp := vTemp + '|';
  if Pos(vTemp, Cliente.dataSet.FieldByName('NFE_AUTXML').AsString) > 0 then
    raise exception.create('CPF/CNPJ já autorizado');

  if Trim(Cliente.dataSet.FieldByName('NFE_AUTXML').AsString) = '' then
    vTemp := '|' + vTemp;
  Cliente.dataSet.FieldByName('NFE_AUTXML').AsString :=
    Cliente.dataSet.FieldByName('NFE_AUTXML').AsString + vTemp;
end;

procedure TFrmCadClientes.SpeedButton63Click(Sender: TObject);
var
  CEPs: TCEP;
  vExisteCEP: Boolean;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit151.CanFocus) then
  	DBEdit151.SetFocus;
  CEPS := TCEP.create;
  if not CEPs.getEndereco(cliente.dataSet.FieldByName('CEP_COBRANCA').AsString) then
    CEPs._ConsultarWebService(cliente.dataSet.FieldByName('CEP_COBRANCA').AsString)
  else
    vExisteCEP := True;

  if not vExisteCEP then
    vExisteCEP := CEPs.getEndereco(cliente.dataSet.FieldByName('CEP_COBRANCA').AsString);

  if vExisteCEP then
  begin
    cliente.dataSet.FieldByName('COD_BAIRRO_COBRANCA').AsInteger := ceps.codigo_bairro;
    cliente.dataSet.FieldByName('COD_CIDADE_COBRANCA').AsInteger := ceps.codigo_cidade;
    cliente.dataSet.FieldByName('EST_CODIGO_UF').AsInteger := ceps.codigo_uf;
    cliente.dataSet.FieldByName('END_COBRANCA').asstring := ceps.logradouro;
    cliente.dataSet.FieldByName('CIDA_COBRANCA').asstring := ceps.nome_cidade;
    cliente.dataSet.FieldByName('BAIRRO_COBRANCA').asstring := ceps.nome_bairro;

    if cliente.dataSet.FieldByName('EST_CODIGO_UF').AsInteger > 0 then
    begin
      Cliente.SqlOpen('select es.codigo_uf, es.sigla_uf from estados es ' +
        ' where es.codigo_uf = ' + IntToStr(cliente.dataSet.FieldByName('EST_CODIGO_UF').AsInteger), Cliente.buscas);
      if Cliente.buscas.FieldByName('CODIGO_UF').AsInteger > 0 then
        Cliente.dataSet.FieldByName('ESTADOS_UF_COBRANCA').AsString := Cliente.buscas.FieldByName('SIGLA_UF').AsString;
    end;
  end;
  if (Self.Enabled) and (Self.Visible) and (DBEdit151.CanFocus) then
    DBEdit151.SetFocus;
end;

procedure TFrmCadClientes.SpeedButton64Click(Sender: TObject);
begin
  inherited;
  if not Cliente.redefinirSenhaUsuarioHwCloud then
    Exit;
end;

procedure TFrmCadClientes.SpeedButtonFicha2Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('CLI026', 'IMPRIMIR', '', 'CLIENTES',
    Cliente.dataSet.FieldByName('COD_CLIENTE').asstring, Cliente.buscas, true) then
  begin
    try
      Cliente.RelFichaCadastralCli;
    finally
      if Cliente.dataSet.State = dsInsert then
        if (Self.Enabled) and (Self.Visible) and (dbedit6.CanFocus) then
        	dbedit6.SetFocus;
    end;
  end;
end;

procedure TFrmCadClientes.BitBtnUltimoExtratoContaCorrenteClick(Sender: TObject);
begin
  try
  	Cursor := crHourGlass;
    Cliente.vContaCorrenteCli.vPagGrid := Cliente.vContaCorrenteCli.vMaxPagGrid - 1;
    if not Cliente.vContaCorrenteCli.abreContaCorrente(
      Cliente.dataSet.FieldByName('cod_cliente').AsInteger,
      Cliente.dataSet.FieldByName('cpfcgc').AsString,
      DBGrid18,
      Label348,
      BitBtnVoltarExtratoContaCorrente.Visible) then
        Exit;

    Label402.Caption := 'Exibindo ' +
    	IntToStr(vDadosIni.IfThen(Cliente.vContaCorrenteCli.vRecordCount > 0,
      					 (Cliente.vContaCorrenteCli.vQtdeGrid * Cliente.vContaCorrenteCli.vPagGrid) + 1,
                 0)) +
      ' até ' +
      IntToStr(vDadosIni.IfThen(Cliente.vContaCorrenteCli.vRecordCount > 0,
      					 (Cliente.vContaCorrenteCli.vQtdeGrid * Cliente.vContaCorrenteCli.vPagGrid) + Cliente.vContaCorrenteCli.vRecordPagGrid,
                 0)) +
      ' de ' +
      IntToStr(Cliente.vContaCorrenteCli.vRecordCount) +
      ' linhas';

  finally
    Cursor := crDefault;
  end;
end;

procedure TFrmCadClientes.btnObsOutrosAdClick(Sender: TObject);
begin
  inherited;
  // Consumidor final, calcular st na saida nf
  Cliente.vLKSimNao.setDBLookupComboBox(DBLookupComboBox36);
  // Indicador de Inscricao Estadual do Destinatario
  if Cliente.vLKIndIEDest.dataSet = nil then
    Cliente.vLKIndIEDest.setDadosDataSet(['1', '2', '9'],
      ['1 - Contribuinte de ICMS',
       '2 - Contribuinte isento de Inscrição no cadastro de Contribuintes do ICMS',
       '9 - Não Contribuinte, que pode ou não possuir Inscrição Estadual no Cadastro de Contribuintes do ICMS'], DBLookupComboBox53)
  else
    Cliente.vLKIndIEDest.setDBLookupComboBox(DBLookupComboBox53);
  // Regime Federal
  Cliente.vLKTemp1.setDadosDataSet(['SIMPLES', 'LUCRO REAL', 'LUCRO PRESUMIDOSIMPLES'],
    ['Simples', 'Lucro Real', 'Lucro Presumido'], DBLookupComboBox26);
  // Regime Federal
  Cliente.vLKTemp2.setDadosDataSet(['0', '1', '2'],
    ['0 - Operações Internas', '1 - Inter.ME/EPP', '2 - Inter.Não ME/EPP'], DBLookupComboBox31);
  // Categoria
  Cliente.vLKTemp3.setDadosDataSet(['CCJ', 'CCF', 'CNJ', 'CNF'], [
    'CCJ - Cliente Conferido Pessoa Juridica',
    'CCF - Cliente Conferido Pessoa Fisica',
    'CNJ - Cliente nao conferido Pessoa Juridica',
    'CNF - Cliente nao conferido Pessoa Fisica'], DBLookupComboBox25);

  vDadosIni.abreForm('Mais dados - Outros', pnDadosPessoais_Outros, [ofAutoSize, ofEscapeExit]);
end;

procedure TFrmCadClientes.btNovoCupomECClick(Sender: TObject);
begin
  inherited;
  if not Cliente.CupomDescontoCliente.dataSet.IsEmpty then
  begin
  	Application.MessageBox('Já existe um cupom de desconto para este cliente.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  	exit;
  end;

  if not Cliente.CupomDescontoCliente.Insert(Cliente) then
  	exit;

  DBComboBoxDescontoEmCupomEC.ItemIndex := 0;
  lbDescTipoDesc.Caption := 'Desconto (%):';
  CheckBoxUtilizarPeriodoValidade.Checked := Cliente.CupomDescontoCliente.dataSet.FieldByName('util_per_val').AsString = 'S';
  DBEditDataIniValidade.Enabled := Cliente.CupomDescontoCliente.dataSet.FieldByName('util_per_val').AsString = 'S';
  DBEditDataFimValidade.Enabled := Cliente.CupomDescontoCliente.dataSet.FieldByName('util_per_val').AsString = 'S';

  pnSalvarCupomEC.Visible := true;
	vDadosIni.abreForm('Cupom de desconto E-Commerce', pnSalvarCupomEC, [ofEscapeExit, ofAlignAllClientWinCtrl]);
  pnSalvarCupomEC.Visible := false;
end;

procedure TFrmCadClientes.SpeedButton65Click(Sender: TObject);
begin
  inherited;
  if not (Cliente.dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  lbSAutXML.Items := vDadosIni.Split(Cliente.dataSet.FieldByName('nfe_autxml').AsString);

  vDadosIni.abreForm('Excluir CPF/CNPJ Autorizado', Panel45, [ofEscapeExit, ofAutoSize]);

  Cliente.dataSet.FieldByName('nfe_autxml').AsString := vDadosIni.Join(TStringList(lbSAutXML.Items));

end;

procedure TFrmCadClientes.BitBtnProximoExtratoContaCorrenteClick(Sender: TObject);
begin
  try
    Cursor := crHourGlass;
    Cliente.vContaCorrenteCli.vPagGrid := Cliente.vContaCorrenteCli.vPagGrid + 1;
    if not Cliente.vContaCorrenteCli.abreContaCorrente(
      Cliente.dataSet.FieldByName('cod_cliente').AsInteger,
      Cliente.dataSet.FieldByName('cpfcgc').AsString,
      DBGrid18,
      Label348,
      BitBtnVoltarExtratoContaCorrente.Visible) then
        Exit;

    Label402.Caption := 'Exibindo ' +
    	IntToStr(vDadosIni.IfThen(Cliente.vContaCorrenteCli.vRecordCount > 0,
      					 (Cliente.vContaCorrenteCli.vQtdeGrid * Cliente.vContaCorrenteCli.vPagGrid) + 1,
                 0)) +
      ' até ' +
      IntToStr(vDadosIni.IfThen(Cliente.vContaCorrenteCli.vRecordCount > 0,
      					 (Cliente.vContaCorrenteCli.vQtdeGrid * Cliente.vContaCorrenteCli.vPagGrid) + Cliente.vContaCorrenteCli.vRecordPagGrid,
                 0)) +
      ' de ' +
      IntToStr(Cliente.vContaCorrenteCli.vRecordCount) +
      ' linhas';

  finally
  	Cursor := crDefault;
  end;
end;

procedure TFrmCadClientes.BitBtnAnteriorExtratoContaCorrenteClick(Sender: TObject);
begin
  try
    Cursor := crHourGlass;
    Cliente.vContaCorrenteCli.vPagGrid := Cliente.vContaCorrenteCli.vPagGrid - 1;
    if not Cliente.vContaCorrenteCli.abreContaCorrente(
      Cliente.dataSet.FieldByName('cod_cliente').AsInteger,
      Cliente.dataSet.FieldByName('cpfcgc').AsString,
      DBGrid18,
      Label348,
      BitBtnVoltarExtratoContaCorrente.Visible) then
        Exit;

    Label402.Caption := 'Exibindo ' +
    	IntToStr(vDadosIni.IfThen(Cliente.vContaCorrenteCli.vRecordCount > 0,
      					 (Cliente.vContaCorrenteCli.vQtdeGrid * Cliente.vContaCorrenteCli.vPagGrid) + 1,
                 0)) +
      ' até ' +
      IntToStr(vDadosIni.IfThen(Cliente.vContaCorrenteCli.vRecordCount > 0,
      					 (Cliente.vContaCorrenteCli.vQtdeGrid * Cliente.vContaCorrenteCli.vPagGrid) + Cliente.vContaCorrenteCli.vRecordPagGrid,
                 0)) +
      ' de ' +
      IntToStr(Cliente.vContaCorrenteCli.vRecordCount) +
      ' linhas';

  finally
  	Cursor := crDefault;
  end;
end;

procedure TFrmCadClientes.BitBtnPrimeiroExtratoContaCorrenteClick(Sender: TObject);
begin
	try
    Cursor := crHourGlass;
    Cliente.vContaCorrenteCli.vPagGrid := 0;
    if not Cliente.vContaCorrenteCli.abreContaCorrente(
      Cliente.dataSet.FieldByName('cod_cliente').AsInteger,
      Cliente.dataSet.FieldByName('cpfcgc').AsString,
      DBGrid18,
      Label348,
      BitBtnVoltarExtratoContaCorrente.Visible) then
        Exit;

    Label402.Caption := 'Exibindo ' +
    	IntToStr(vDadosIni.IfThen(Cliente.vContaCorrenteCli.vRecordCount > 0,
      					 (Cliente.vContaCorrenteCli.vQtdeGrid * Cliente.vContaCorrenteCli.vPagGrid) + 1,
                 0)) +
      ' até ' +
      IntToStr(vDadosIni.IfThen(Cliente.vContaCorrenteCli.vRecordCount > 0,
      					 (Cliente.vContaCorrenteCli.vQtdeGrid * Cliente.vContaCorrenteCli.vPagGrid) + Cliente.vContaCorrenteCli.vRecordPagGrid,
                 0)) +
      ' de ' +
      IntToStr(Cliente.vContaCorrenteCli.vRecordCount) +
      ' linhas';

  finally
    Cursor := crDefault;
  end;
end;

procedure TFrmCadClientes.SpeedButton6Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('CLI009', 'VISUALIZAR', '', 'CLIENTES', '', Cliente.buscas, true) then
  begin
    inherited;
    Cliente.FichaFinanceiraCli;
  end;
end;

procedure TFrmCadClientes.SpeedButton70Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CLI278', 'NOVO', '', 'CLIENTES_END_DOC_ADD',
    Cliente.dataSet.FieldByName('COD_CLIENTE').asstring, Cliente.buscas, true) then
    Exit;
  if (Self.Enabled) and (Self.Visible) and (gridEndDocAdd.CanFocus) then
    gridEndDocAdd.SetFocus;
  if Cliente.EndDocAd.Insert then
  begin
    btSalvarEndDoc.Enabled := True;
    btCancelEndDoc.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBEdit203.CanFocus) then
   	  DBEdit203.SetFocus;
    btEditEndDocAd.Enabled := False;
    gridEndDocAdd.Enabled  := False;
  end;
end;

procedure TFrmCadClientes.SpeedButton71Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CLI280', 'EXCLUIR', '', 'CLIENTES_END_DOC_ADD',
    Cliente.dataSet.FieldByName('COD_CLIENTE').asstring, Cliente.buscas, true) then
    Exit;
  Cliente.EndDocAd.Delete;
end;

procedure TFrmCadClientes.SpeedButton72Click(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit333.CanFocus) then
    DBEdit333.SetFocus;
  Cliente.EndDocAd.ConsultaCEP(True);
end;

procedure TFrmCadClientes.SpeedButton74Click(Sender: TObject);
var
  Abts: TButtonGroup;
  AtribAd: TProdutos_trib_pf_classList;
  I: Integer;
begin
  inherited;     
  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    ShowAtencao('NFCe modo Offline, não permite inclusão de registros. Por favor acesso o sistema remoto');
    Exit;
  end;

  if not Assigned(Cliente.EndDocAd.tribAd) then
    Exit;

  if Cliente.EndDocAd.dataSet.IsEmpty then
    Exit;
    
  if Cliente.EndDocAd.f_int('ativo') = 0 then
    Exit;

  try
    pn_modal_top.Caption    := 'Selecione o perfil de tributação';
    pn_modal_top.Visible    := True;
    bt_modal_assume.Visible := True;
    bt_modal_cancel.Visible := True;
    grid_modal.DataSource   := Cliente.EndDocAd.tribAd.consPerfis._dataSourceOOP;

    with Cliente.EndDocAd.tribAd do
    begin
      consPerfis.Open;
      if vDadosIni.abreForm('Perfis de tributação adicional', pn_modal, [ofAlignAllClientWinCtrl, ofBIMinimizeOff, ofStoreMaximized]) then
        if Adicionar(consPerfis.f_int('id')) then
          for I := 0 to Pred(Count) do with Items[I] do if cod_trib_pf = consPerfis.f_int('id') then
          begin
            Abts := btgoup_trib_pref_add;
            with Abts.Items.Add do
            begin
              Caption := Format('[ID:%d][%s-%d][%s]', [cod_trib_pf, cst_icms, Trunc(codigo_nop), descricao_pf]);
              Hint    := Format('[CST:%s][CFOP:%d][%%ICMS Intra:%f][%%ICMS Inter:%f][%%Redução:%f][MVA:%f]',
                                [cst_icms, Trunc(codigo_nop), aliq_intra, aliq_inter, perc_red_prod, mva]);
            end;
          end;
    end;
  finally
    Cliente.EndDocAd.tribAd.consPerfis.Close;
    grid_modal.DataSource   := nil;
    pn_modal_top.Visible    := False;
    bt_modal_assume.Visible := False;
    bt_modal_cancel.Visible := False;
  end;
end;

procedure TFrmCadClientes.SpeedButton76Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CLI271', 'HABILITAR', 'Cliente Emissao NFe ' + Cliente.fstr('cod_cli_fat'), 'CLIENTES', Cliente.fstr('cod_cliente'), Cliente.buscas, true) then
    Exit;

  edCodCliFat.Tag := Cliente.fint('cod_cli_fat');

  edCodCliFat.Enabled := True;
  edCodCliFatS.Enabled := True;
end;

procedure TFrmCadClientes.SpeedButton77Click(Sender: TObject);
begin
  inherited;
	if (ActiveControl = DBMemo8) and (BitBtn_4.CanFocus) then
    ActiveControl := BitBtn_4//apenas para sair do campo de obs caso tenha sido digitado algum dado
  else if (ActiveControl = DBMemo7) and (BitBtn4.CanFocus) then
  	ActiveControl := BitBtn4;//apenas para sair do campo de obs caso tenha sido digitado algum dado

  vDadosIni.abreForm('Observações', pnObsMaxmized2, [ofAlignAllClientWinCtrl, ofMaximized]);
end;

procedure TFrmCadClientes.bt_contatos_addClick(Sender: TObject);
begin
  inherited;
  if not Cliente.Contato.Auditor.Processo('CLI260').Inserir.Permitido then
    Exit;

  if (Self.Enabled) and (Self.Visible) and (DBEdit139.CanFocus) then
    DBEdit139.SetFocus;
  if Cliente.Contato.Insert then
  begin
    pn_contatos_view.Enabled := False;
    pn_contatos_view.Visible := False;

    pn_contatos_cad.Enabled := True;
    pn_contatos_cad.Visible := True;

    if (Self.Enabled) and (Self.Visible) and (ed_contato_tipo.CanFocus) then
      ed_contato_tipo.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ed_contato_contato.CanFocus) then
      ed_contato_contato.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ed_contato_telefone.CanFocus) then
      ed_contato_telefone.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ed_contato_email.CanFocus) then
      ed_contato_email.SetFocus
  end;
end;

procedure TFrmCadClientes.bt_contatos_delClick(Sender: TObject);
begin
  inherited;

  Cliente.Contato.Delete;
end;

procedure TFrmCadClientes.bt_contatos_editClick(Sender: TObject);
begin
  inherited;

  if Cliente.Contato.dataSet.IsEmpty then
  	Exit;

  with Cliente.Contato do
    if not Auditor.Processo('CLI254', DataAudit, KeyAudit).Alterar.Permitido then
      Exit;

  if (Self.Enabled) and (Self.Visible) and (DBEdit139.CanFocus) then
    DBEdit139.SetFocus;
  if Cliente.Contato.Edit then
  begin
  	pn_contatos_view.Enabled := False;
    pn_contatos_view.Visible := False;

  	pn_contatos_cad.Enabled := True;
  	pn_contatos_cad.Visible := True;
    
    if (Self.Enabled) and (Self.Visible) and (ed_contato_tipo.CanFocus) then
      ed_contato_tipo.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ed_contato_contato.CanFocus) then
      ed_contato_contato.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ed_contato_telefone.CanFocus) then
      ed_contato_telefone.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ed_contato_email.CanFocus) then
      ed_contato_email.SetFocus
  end;
end;

procedure TFrmCadClientes.bt_contatos_saveClick(Sender: TObject);
begin
  inherited;
  with Cliente.Contato do
    if not Auditor.Processo('CLI255', StrAuditoria, StrAuditoriaCod).Salvar.Permitido then
      Exit;

  if (Self.Enabled) and (Self.Visible) and (ed_contato_telefone.CanFocus) then
    ed_contato_telefone.SetFocus;
  if (Self.Enabled) and (Self.Visible) and (ed_contato_email.CanFocus) then
    ed_contato_email.SetFocus;

  if not Cliente.Contato.Post then
  begin
  	setFocusCampoErro(Cliente.Contato.vNomeCampoErro, Cliente.Contato.vMensagemErro);
  	Exit;
  end;

  bt_contatos_cancel.Click;

  pn_contatos_cad.Enabled := False;
  pn_contatos_cad.Visible := False;

  pn_contatos_view.Enabled := True;
  pn_contatos_view.Visible := True;
end;

procedure TFrmCadClientes.bt_contato_pla_tipoClick(Sender: TObject);
var
  MenuItem: TMenuItem;
begin
  inherited;

  if not Assigned(pop_menu_tipo_contato_pla) then
  begin
    pop_menu_tipo_contato_pla := TPopupMenu.Create(Self);

    MenuItem := TMenuItem.Create(pop_menu_tipo_contato_pla);
    MenuItem.Caption := 'Novo Tipo de Contato - [CLI257]';
    MenuItem.OnClick := contato_tipo_pla_add;
    pop_menu_tipo_contato_pla.Items.Add(MenuItem);

    MenuItem := TMenuItem.Create(pop_menu_tipo_contato_pla);
    MenuItem.Caption := 'Alterar Tipo de Contato - [CLI258]';
    MenuItem.OnClick := contato_tipo_pla_edit;
    pop_menu_tipo_contato_pla.Items.Add(MenuItem);

    MenuItem := TMenuItem.Create(pop_menu_tipo_contato_pla);
    MenuItem.Caption := 'Excluir Tipo de Contato - [CLI259]';
    MenuItem.OnClick := contato_tipo_pla_del;
    pop_menu_tipo_contato_pla.Items.Add(MenuItem);
  end;

  pop_menu_tipo_contato_pla.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFrmCadClientes.bt_contato_tipoClick(Sender: TObject);
var
  MenuItem: TMenuItem;
begin
  inherited;

  if not Assigned(pop_menu_tipo_contato) then
  begin
    pop_menu_tipo_contato := TPopupMenu.Create(Self);

    MenuItem := TMenuItem.Create(pop_menu_tipo_contato);
    MenuItem.Caption := 'Novo Tipo de Contato - [CLI257]';
    MenuItem.OnClick := contato_tipo_add;
    pop_menu_tipo_contato.Items.Add(MenuItem);

    MenuItem := TMenuItem.Create(pop_menu_tipo_contato);
    MenuItem.Caption := 'Alterar Tipo de Contato - [CLI258]';
    MenuItem.OnClick := contato_tipo_edit;
    pop_menu_tipo_contato.Items.Add(MenuItem);

    MenuItem := TMenuItem.Create(pop_menu_tipo_contato);
    MenuItem.Caption := 'Excluir Tipo de Contato - [CLI259]';
    MenuItem.OnClick := contato_tipo_del;
    pop_menu_tipo_contato.Items.Add(MenuItem);
  end;

  pop_menu_tipo_contato.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFrmCadClientes.bt_outros_prodClick(Sender: TObject);
begin
  inherited;
	pmOutros.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFrmCadClientes.bt_contatos_pla_addClick(Sender: TObject);
begin
  inherited;
	if not Cliente.ContatoMsg.Auditor.Processo('CLI294').Inserir.Permitido then
    Exit;

  if (Self.Enabled) and (Self.Visible) and (GroupBoxContatoPlataforma.CanFocus) then
    GroupBoxContatoPlataforma.SetFocus;
  if Cliente.ContatoMsg.Insert then
  begin
	  pn_contatos_pla_view.Enabled := False;
  	pn_contatos_pla_view.Visible := False;

    pn_contatos_pla_cad.Enabled := True;
    pn_contatos_pla_cad.Visible := True;

    lb_contato_pla_identificacao.Caption := 'Identificação';
    Cliente.ContatoMsg.dataSet.FieldByName('IDENTIFICADOR').EditMask := '';
    ed_contato_pla_identificacao.CharCase := ecLowerCase;

    vCodPlataforma := 0;
    Cliente.ContatoMsg.InserirTipoContato(ck_contrato_pla_tipos_contato);

    ed_contato_pla_aplicativo.Enabled := True;
    ed_contato_pla_contato.Enabled := True;
    ed_contato_pla_identificacao.Enabled := True;

    if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_aplicativo.CanFocus) then
      ed_contato_pla_aplicativo.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_contato.CanFocus) then
      ed_contato_pla_contato.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_identificacao.CanFocus) then
      ed_contato_pla_identificacao.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ck_contrato_pla_tipos_contato.CanFocus) then
      ck_contrato_pla_tipos_contato.SetFocus;
  end;
end;

procedure TFrmCadClientes.bt_contatos_pla_delClick(Sender: TObject);
begin
  inherited;
	Cliente.ContatoMsg.Delete;
end;

procedure TFrmCadClientes.bt_contatos_pla_editClick(Sender: TObject);
begin
  if not Cliente.ContatoMsg.Auditor.Processo('CLI295').Inserir.Permitido then
    Exit;

  if (Self.Enabled) and (Self.Visible) and (GroupBoxContatoPlataforma.CanFocus) then
    GroupBoxContatoPlataforma.SetFocus;
  if Cliente.ContatoMsg.Edit then
  begin
	  pn_contatos_pla_view.Enabled := False;
  	pn_contatos_pla_view.Visible := False;

    pn_contatos_pla_cad.Enabled := True;
    pn_contatos_pla_cad.Visible := True;

    lb_contato_pla_identificacao.Caption := 'Identificação';
    Cliente.ContatoMsg.dataSet.FieldByName('IDENTIFICADOR').EditMask := '';
    ed_contato_pla_identificacao.CharCase := ecLowerCase;
    
    vCodPlataforma := 0;
    Cliente.ContatoMsg.EditarTipoContato(ck_contrato_pla_tipos_contato);

    ed_contato_pla_aplicativo.Enabled := False;
    ed_contato_pla_contato.Enabled := False;
    ed_contato_pla_identificacao.Enabled := False;

    if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_aplicativo.CanFocus) then
      ed_contato_pla_aplicativo.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_contato.CanFocus) then
      ed_contato_pla_contato.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_identificacao.CanFocus) then
      ed_contato_pla_identificacao.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (ck_contrato_pla_tipos_contato.CanFocus) then
      ck_contrato_pla_tipos_contato.SetFocus;
  end;
end;

procedure TFrmCadClientes.bt_contatos_pla_saveClick(Sender: TObject);
begin
  inherited;
  with Cliente.ContatoMsg do
    if not Auditor.Processo('CLI297', StrAuditoria, StrAuditoriaCod).Salvar.Permitido then
      Exit;

  if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_contato.CanFocus) then
    ed_contato_pla_contato.SetFocus;
  if (Self.Enabled) and (Self.Visible) and (ed_contato_pla_identificacao.CanFocus) then
    ed_contato_pla_identificacao.SetFocus;

  if not Cliente.ContatoMsg.Post(ck_contrato_pla_tipos_contato) then
  begin
  	setFocusCampoErro(Cliente.ContatoMsg.vNomeCampoErro, Cliente.ContatoMsg.vMensagemErro);
  	Exit;
  end;

  lb_contato_pla_identificacao.Caption := 'Identificação';
  Cliente.ContatoMsg.dataSet.FieldByName('IDENTIFICADOR').EditMask := '';
  vCodPlataforma := 0;

  bt_contatos_pla_cancel.Click;

  pn_contatos_pla_cad.Enabled := False;
  pn_contatos_pla_cad.Visible := False;

  pn_contatos_pla_view.Enabled := True;
  pn_contatos_pla_view.Visible := True;
end;

procedure TFrmCadClientes.bt_contatos_cancelClick(Sender: TObject);
begin
  inherited;
  Cliente.Contato.dataSet.Cancel;
  
  pn_contatos_cad.Enabled := False;
  pn_contatos_cad.Visible := False;

  pn_contatos_view.Enabled := True;
  pn_contatos_view.Visible := True;

  if (Self.Enabled) and (Self.Visible) and (grid_contatos.CanFocus) then
    grid_contatos.SetFocus;
end;

procedure TFrmCadClientes.bt_contatos_pla_cancelClick(Sender: TObject);
begin
  inherited;
  lb_contato_pla_identificacao.Caption := 'Identificação';
  Cliente.ContatoMsg.dataSet.FieldByName('IDENTIFICADOR').EditMask := '';
  vCodPlataforma := 0;

  Cliente.ContatoMsg.dataSet.Cancel;
  
  pn_contatos_pla_cad.Enabled := False;
  pn_contatos_pla_cad.Visible := False;

  pn_contatos_pla_view.Enabled := True;
  pn_contatos_pla_view.Visible := True;

  if (Self.Enabled) and (Self.Visible) and (grid_contatos_pla.CanFocus) then
    grid_contatos_pla.SetFocus;
end;

procedure TFrmCadClientes.bt_trib_pref_newClick(Sender: TObject);
var
  Abts: TButtonGroup;
  AtribAd: TProdutos_trib_pf_classList;
  I: Integer;
begin
  inherited;
  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    ShowAtencao('NFCe modo Offline, não permite inclusão de registros. Por favor acesso o sistema remoto');
    Exit;
  end;

  if not Assigned(Cliente.tribAd) then
    Exit;

  try
    pn_modal_top.Caption    := 'Selecione o perfil de tributação';
    pn_modal_top.Visible    := True;
    bt_modal_assume.Visible := True;
    bt_modal_cancel.Visible := True;
    grid_modal.DataSource   := Cliente.tribAd.consPerfis._dataSourceOOP;

    with Cliente.tribAd do
    begin
      consPerfis.Open;
      if vDadosIni.abreForm('Perfis de tributação adicional', pn_modal, [ofAlignAllClientWinCtrl, ofBIMinimizeOff, ofStoreMaximized]) then
        if Adicionar(consPerfis.f_int('id')) then
          for I := 0 to Pred(Count) do with Items[I] do if cod_trib_pf = consPerfis.f_int('id') then
          begin
            if cliente.cadastroSimplificado then
              Abts := btgoup_trib_pref_sim
            else
              Abts := btgoup_trib_pref_com;
            with Abts.Items.Add do
            begin
              Caption := Format('[ID:%d][%s-%d][%s]', [cod_trib_pf, cst_icms, Trunc(codigo_nop), descricao_pf]);
              Hint    := Format('[CST:%s][CFOP:%d][%%ICMS Intra:%f][%%ICMS Inter:%f][%%Redução:%f][MVA:%f]',
                                [cst_icms, Trunc(codigo_nop), aliq_intra, aliq_inter, perc_red_prod, mva]);
            end;
          end;
    end;
  finally
    Cliente.tribAd.consPerfis.Close;
    grid_modal.DataSource   := nil;
    pn_modal_top.Visible    := False;
    bt_modal_assume.Visible := False;
    bt_modal_cancel.Visible := False;
  end;
end;

procedure TFrmCadClientes.SpeedButton7Click(Sender: TObject);
begin
  inherited;                                       
  if vDadosIni.PesqPros('CLI030', 'EXIBIR SITUAÃ‡ÃƒO DE CAIXA', '', 'CLIENTES',
    Cliente.dataSet.FieldByName('COD_CLIENTE').asstring, Cliente.buscas, true) then
    Cliente.SituacaoDeCaixa(true);
end;

procedure TFrmCadClientes.SpeedButton8Click(Sender: TObject);
var
	ARescueOptions: TDBGridOptions;
begin
  inherited;
  try
    DBGrid1.DataSource.dataSet.DisableControls;
    Cliente.storeRecNo;
    ARescueOptions := DBGrid1.Options;
    DBGrid1.Options := DBGrid1.Options + [dgMultiSelect];
    Cliente.dataSet.First;
    while not Cliente.dataSet.Eof do
    begin
    	if (DBGrid1.SelectedRows.CurrentRowSelected) and (Cliente.dataSet.FieldByName('sel').AsString <> 'S') then
      begin
      	Cliente.dataSet.Edit;
      	Cliente.dataSet.FieldByName('sel').AsString := 'S';
        Cliente.dataSet.Post;
      end
      else if Cliente.dataSet.FieldByName('sel').AsString = 'S' then
	      DBGrid1.SelectedRows.CurrentRowSelected := Cliente.dataSet.FieldByName('sel').AsString = 'S';
      Cliente.dataSet.Next;
    end;

    if vDadosIni.PesqPros('CLI029', 'IMPRIMIR ETIQUETAS', '', 'CLIENTES', '', Cliente.buscas, true) then
      Cliente.ImprimirEtiquetasQRP('CLIENTES', 'Etiquetas de Clientes', DBGrid1, false, false);
  finally
    DBGrid1.Options := ARescueOptions;
    Cliente.restoreRecNo;
    DBGrid1.DataSource.dataSet.EnableControls;
  end;
end;

procedure TFrmCadClientes.SpeedButtonAlternarCadastro2Click(Sender: TObject);
begin
  SpeedButtonAlternarCadastroClick(Sender);
end;

procedure TFrmCadClientes.SpeedButtonAlternarCadastroClick(Sender: TObject);
begin
  if not vDadosIni.PesqPros('CLI293', 'ALTERNAR',
  	vDadosIni.IfThen(not Cliente.cadastroSimplificado, 'SIMPLIFICADO', 'COMPLETO'),
    'CLIENTES',
    vDadosIni.IfThen(Cliente.dataSet.State = dsEdit,
      Cliente.dataSet.FieldByName('COD_CLIENTE').AsString, ''),
    Cliente.buscas, true) then
    exit;

  Cliente.cadastroSimplificado := not Cliente.cadastroSimplificado;

  if Cliente.cadastroSimplificado then
  	CheckCadSeq_.Checked := CheckCadSeq.Checked
  else
  	CheckCadSeq.Checked  := CheckCadSeq_.Checked;

  if Cliente.dataSet.State = dsEdit then
  	HabilitarCamposEdicao
  else
  	HabilitarCamposInclusao;
end;

procedure TFrmCadClientes.SpeedButtonFichaClick(Sender: TObject);
begin
  if vDadosIni.PesqPros('CLI026', 'IMPRIMIR', '', 'CLIENTES',
    Cliente.dataSet.FieldByName('COD_CLIENTE').asstring, Cliente.buscas, true) then
  begin
    try
      Cliente.RelFichaCadastralCli;
    finally
      if Cliente.dataSet.State = dsInsert then
        if (Self.Enabled) and (Self.Visible) and (dbedit6.CanFocus) then
        	dbedit6.SetFocus;
    end;
  end;
end;

procedure TFrmCadClientes.Splitter1Moved(Sender: TObject);
begin
  _GravaConfiguracoesInteger(pnOpcaoDireitaClientes.Name, vDadosIni.IfThen(pnOpcaoDireitaClientes.Width < 180, 180, pnOpcaoDireitaClientes.Width));
end;

procedure TFrmCadClientes.Splitter3Moved(Sender: TObject);
begin
  inherited;
  Cliente.vContaCorrenteCli.salvarPosicao;
end;

procedure TFrmCadClientes.Splitter6Moved(Sender: TObject);
begin
  inherited;
  Cliente.vContaCorrenteCli.salvarPosicao;
end;

procedure TFrmCadClientes.SplitterObservacaoBottomClMoved(Sender: TObject);
begin
  try
  	AjustarBarraLateral(False);
  finally
  	_GravaConfiguracoesInteger(pnObservacaoCl.Name, vDadosIni.IfThen(pnObservacaoCl.Height < 60, 60, pnObservacaoCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoSpcCl.Name, vDadosIni.IfThen(pnObservacaoSpcCl.Height < 60, 60, pnObservacaoSpcCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoReqOsCl.Name, vDadosIni.IfThen(pnObservacaoReqOsCl.Height < 60, 60, pnObservacaoReqOsCl.Height));
  end;
end;

procedure TFrmCadClientes.SplitterObservacaoSpcBottomClMoved(Sender: TObject);
begin
  try
  	AjustarBarraLateral(False);
  finally
  	_GravaConfiguracoesInteger(pnObservacaoCl.Name, vDadosIni.IfThen(pnObservacaoCl.Height < 60, 60, pnObservacaoCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoSpcCl.Name, vDadosIni.IfThen(pnObservacaoSpcCl.Height < 60, 60, pnObservacaoSpcCl.Height));
    _GravaConfiguracoesInteger(pnObservacaoReqOsCl.Name, vDadosIni.IfThen(pnObservacaoReqOsCl.Height < 60, 60, pnObservacaoReqOsCl.Height));
  end;
end;

procedure TFrmCadClientes.TabSheet1Show(Sender: TObject);
begin
  inherited;
  //  if Cliente.dataset.State = dsinsert then
  //    GroupBox7.Visible := false;
    //  else if Cliente.dataset.State in [dsEdit, dsBrowse] then
    //  begin
    //    GroupBox7.Visible := true;
    //    Contador.abreContador;
    //  end;
end;

procedure TFrmCadClientes.TabSheet2Show(Sender: TObject);
begin
  inherited;
  SpeedButton25.Visible := Cliente.StatusLixeira;
end;

procedure TFrmCadClientes.TabSheet6Show(Sender: TObject);
begin
  inherited;
  TabSheet6.Caption := 'Dependentes do cliente ' +
    Cliente.dataSet.FieldByName('NOME_CLIENTE').AsString;
  TabSheet7.TabVisible := false;
  TabSheet8.TabVisible := false;
  TabSheet7.Show;
end;

procedure TFrmCadClientes.TabSheet8Show(Sender: TObject);
begin
  inherited;
  if Cliente.AdCliente <> nil then
  begin
    if Cliente.AdCliente.dataSet.State = dsEdit then
      TabSheet8.Caption := 'Alterando dados do cliente adicional'
    else
      TabSheet8.Caption := 'Incluindo novo cliente adicional';
  end;
end;

procedure TFrmCadClientes.TreeView1CustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if (Pos('DOCUMENTO', Node.Text) > 0) or (trim(Node.Text) = 'CLIENTE')
    or (trim(Node.Text) = 'ITENS') or (trim(Node.Text) = 'FORMAS PAG') then
  begin
    Sender.Canvas.Font.Color := clBlack;  // cor preta
    Sender.Canvas.Font.Style := [FSBOLD];  //  negrito
  end
  else if (trim(Node.Text) = 'DEVOLUCOES') then
  begin
    Sender.Canvas.Font.Color := clRed;  // cor vermelha
    Sender.Canvas.Font.Style := [FSBOLD];  //  negrito
  end
  else if (trim(Node.Text) = 'VALES') then
  begin
    Sender.Canvas.Font.Color := clRed;  // cor vermelha
    Sender.Canvas.Font.Style := [FSBOLD];  //  negrito
  end
  else if Node.Level = 0 then
  begin
    Sender.Canvas.Font.Color := clBlue;  // cor azul
    Sender.Canvas.Font.Style := [FSBOLD];  //  negrito
  end
  else
  begin
    Sender.Canvas.Font.Color := clBlack;  // cor breta
    Sender.Canvas.Font.Style := [];  //  sem negrito
  end;

  if cdsFocused in State then
    Sender.Canvas.Font.Color := clWhite;
end;

procedure TFrmCadClientes.TreeView2CustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Node.Level = 0 then
  begin
    Sender.Canvas.Font.Color := clBlue;  // cor azul
    Sender.Canvas.Font.Style := [FSBOLD];  //  negrito
  end
  else
  begin
    Sender.Canvas.Font.Color := clBlack;  // cor breta
    Sender.Canvas.Font.Style := [];  //  sem negrito
  end;

  if cdsFocused in State then
    Sender.Canvas.Font.Color := clWhite;
end;

procedure TFrmCadClientes.verificacampos;
begin
  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('CLI163', 'LIBERAR CAMPO', '', 'CLIENTES', '', Cliente.buscas, False)
    then
    DBLookupComboBox4.Enabled := false
  else
    DBLookupComboBox4.Enabled := true;

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('CLI164', 'EDITAR TIPOVENDA', '', 'CLIENTES', '', Cliente.buscas, False)
    then
    DBComboBox6.Enabled := false
  else
    DBComboBox6.Enabled := true;

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('CLI165', 'EDITAR TP PRECVENDA', '', 'CLIENTES', '', Cliente.buscas,
    False) then
  begin
    DBComboBox7.Enabled := false;
    DBEdit62.Enabled := false;
  end
  else
  begin
    DBComboBox7.Enabled := true;
    DBEdit62.Enabled := true;
  end;
end;

initialization
  RegisterClass(TFrmCadClientes);
finalization
  UnRegisterClass(TFrmCadClientes);

end.

