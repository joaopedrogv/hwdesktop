unit UCadProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, Menus, Buttons, Grids, DBGrids, ExtCtrls, StdCtrls, Mask,
  ComCtrls, UDtmProdutos, UClassesProdutos, uDadosIni, uDtmAtivo, DBCtrls, DB,
  QuickRpt, QRCtrls, grimgctrl, QRExport, uEditMoeda, AppEvnts, Spin, pQRBarCode,
  uEditHw, uClassesIndiceTecnico, qrpctrls, ButtonGroup, ExtDlgs, OleCtrls,
  ComboboxEntityPickerFrameUnit,
  SHDocVw, MSHTML, ActiveX, config_sistema_class, uDataSet_OOP, DBClient, 
  IBDatabase, IBQuery;

const
  IDM_MARCADOR = 2184;
  IDM_MARCADOR_LISTA = 2185;
  IDM_OUTDENT = 2187;
  IDM_INDENT = 2186;
  IDM_ALINHARESQ = 59;
  IDM_CENTRALIZAR = 57;
  IDM_JUSTIFICAR = 50;
  IDM_ALINHADIR = 60;
  IDM_IMAGEM = 2168;
  IDM_LINHAHORIZ = 2150;
  IDM_RECORTAR = 16;
  IDM_COPIAR = 15;
  IDM_COLAR = 26;
  IDM_HYPERLINK = 2124;
  IDM_DESFAZER = 43;

type
  THackWinControl = class(TWinControl);
  THackDBGrid     = class(TCustomDBGrid);

  Tcadastrosbasicos_abrePanelImagemDoc = function(
  	pBuscas: TIBQuery;
  	var pPanel: TPanel;
  	pGrupoProd: Integer;
    pCodProd: string;
    pCodEmpresa: Integer): boolean;

  Tcadastrosbasicos_fecharPanelImagemDoc = procedure();

  TFrmCadProdutos = class(TfrmCadPadraoM)
    Panel4: TPanel;
    TabSheet4: TTabSheet;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label41: TLabel;
    Label28: TLabel;
    Label14: TLabel;
    Label10: TLabel;
    Label26: TLabel;
    Label48: TLabel;
    Label42: TLabel;
    Label46: TLabel;
    Label43: TLabel;
    Label17: TLabel;
    Label27: TLabel;
    Label38: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label34: TLabel;
    Label66: TLabel;
    Label72: TLabel;
    SpeedButton10: TSpeedButton;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label13: TLabel;
    Label19: TLabel;
    Label81: TLabel;
    Label86: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit28: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit14: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit43: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBComboBox2: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    DBComboBox7: TDBComboBox;
    DBEdit24: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit67: TDBEdit;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit71: TDBEdit;
    DBEdit73: TDBEdit;
    DBEdit77: TDBEdit;
    GroupBox5: TGroupBox;
    Label22: TLabel;
    Label44: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label40: TLabel;
    Label35: TLabel;
    Label31: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label77: TLabel;
    DBEdit8: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit60: TDBEdit;
    DBEdit61: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit55: TDBEdit;
    ScrollBox4: TScrollBox;
    Panel6: TPanel;
    GroupBox6: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label24: TLabel;
    Label33: TLabel;
    Label45: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label73: TLabel;
    Label76: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit12: TDBEdit;
    edValorCompraUltNF: TDBEdit;
    edCustoReposicao: TDBEdit;
    edCustoUltimo: TDBEdit;
    DBEdit45: TDBEdit;
    edCustoReal: TDBEdit;
    edCustoMedio: TDBEdit;
    edCustoRealMedio: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    DBEdit58: TDBEdit;
    DBComboBox8: TDBComboBox;
    DBEdit62: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit72: TDBEdit;
    edCustoMNF: TDBEdit;
    GroupBox7: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox8: TGroupBox;
    Label74: TLabel;
    DBEdit64: TDBEdit;
    Label75: TLabel;
    DBEdit65: TDBEdit;
    Label85: TLabel;
    DBEdit66: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    GroupBox9: TGroupBox;
    Label87: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBEdit76: TDBEdit;
    BitBtn11: TBitBtn;
    Label88: TLabel;
    DBEdit49: TDBEdit;
    Label89: TLabel;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    Label90: TLabel;
    GroupBox10: TGroupBox;
    BitBtn7: TBitBtn;
    BitBtn9: TBitBtn;
    Label91: TLabel;
    DBEdit78: TDBEdit;
    BitBtn12: TBitBtn;
    DBRadioGroup2: TDBRadioGroup;
    GroupBox11: TGroupBox;
    ComboBox4: TComboBox;
    Label92: TLabel;
    ComboBox7: TComboBox;
    Label93: TLabel;
    ComboBox8: TComboBox;
    Label94: TLabel;
    Label95: TLabel;
    ComboBox5: TComboBox;
    ComboBox9: TComboBox;
    Label96: TLabel;
    ComboBox6: TComboBox;
    Label97: TLabel;
    Label98: TLabel;
    ComboBox10: TComboBox;
    SpeedButton13: TSpeedButton;
    GroupBox12: TGroupBox;
    CheckBox2: TCheckBox;
    ComboBox11: TComboBox;
    Label99: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    ComboBox12: TComboBox;
    Panel7: TPanel;
    ProgressBar1: TProgressBar;
    BitBtn13: TBitBtn;
    Label103: TLabel;
    Panel8: TPanel;
    Label104: TLabel;
    MaskEdit7: TMaskEdit;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    pnOpcaoDireitaProdutos: TPanel;
    DBComboBox10: TDBComboBox;
    DBComboBox3: TDBComboBox;
    Label106: TLabel;
    tsFichas: TTabSheet;
    PageControl2: TPageControl;
    tsFichaComprasVendas: TTabSheet;
    tsUltComp: TTabSheet;
    ScrollBox5: TScrollBox;
    Panel5: TPanel;
    Label16: TLabel;
    Label18: TLabel;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    GroupBox16: TGroupBox;
    tsPrecos: TTabSheet;
    PageControl4: TPageControl;
    tsEscolha: TTabSheet;
    BitBtn17: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn23: TBitBtn;
    tsTabPrecos: TTabSheet;
    tsMedia: TTabSheet;
    ScrollBox6: TScrollBox;
    qrpMedia: TQuickRep;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    detailMedia: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    tsRelProd: TTabSheet;
    QuickRep2: TQuickRep;
    DetailBand2: TQRBand;
    ColumnHeaderBand2: TQRBand;
    TitleBand2: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRSysData3: TQRSysData;
    QRShape1: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape2: TQRShape;
    PageFooterBand2: TQRBand;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel22: TQRLabel;
    qrLabelEmpresa: TQRLabel;
    GroupBox19: TGroupBox;
    BitBtn21: TBitBtn;
    ckPrecoTab2: TCheckBox;
    qrLabelQtde: TQRLabel;
    qrLabelMedia: TQRLabel;
    qrLabelAtributos: TQRLabel;
    tsCatalogo: TTabSheet;
    GroupBox23: TGroupBox;
    BitBtn22: TBitBtn;
    BitBtn27: TBitBtn;
    qrpCatalogo: TQuickRep;
    ColumnHeaderBand4: TQRBand;
    DetailCatalogo: TQRBand;
    PageHeaderBand1: TQRBand;
    PageFooterBand3: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel21: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel23: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel31: TQRLabel;
    QRShape11: TQRShape;
    QRShape6: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRShape12: TQRShape;
    QRShape7: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel30: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText25: TQRDBText;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    tsReceitaAss: TTabSheet;
    GroupBox24: TGroupBox;
    DBGrid9: TDBGrid;
    BitBtn30: TBitBtn;
    BitBtn31: TBitBtn;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    SpeedButton9: TSpeedButton;
    tsGrade: TTabSheet;
    tsAltEstCusto: TTabSheet;
    pgAltEstCust: TPageControl;
    tsAltEstoque: TTabSheet;
    tsAltCusto: TTabSheet;
    GroupBox27: TGroupBox;
    DBText5: TDBText;
    Label115: TLabel;
    DBText6: TDBText;
    Label117: TLabel;
    DBText7: TDBText;
    Label118: TLabel;
    DBText8: TDBText;
    Label119: TLabel;
    Panel11: TPanel;
    BitBtn44: TBitBtn;
    BitBtn45: TBitBtn;
    BitBtn46: TBitBtn;
    BitBtn47: TBitBtn;
    EditMoeda1: TEditMoeda;
    Label120: TLabel;
    GroupBox28: TGroupBox;
    DBText10: TDBText;
    Label122: TLabel;
    DBText11: TDBText;
    Label123: TLabel;
    DBText12: TDBText;
    Label124: TLabel;
    DBText13: TDBText;
    Label125: TLabel;
    DBText14: TDBText;
    Panel12: TPanel;
    BitBtn42: TBitBtn;
    BitBtn43: TBitBtn;
    BitBtn48: TBitBtn;
    BitBtn49: TBitBtn;
    panelEditCusto: TPanel;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    DBText15: TDBText;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText18: TDBText;
    DBText19: TDBText;
    DBText20: TDBText;
    DBText21: TDBText;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    DBEdit23: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit79: TDBEdit;
    DBEdit80: TDBEdit;
    DBEdit81: TDBEdit;
    DBEdit82: TDBEdit;
    DBEdit83: TDBEdit;
    DBEdit84: TDBEdit;
    tsReducao: TTabSheet;
    GroupBox13: TGroupBox;
    Label54: TLabel;
    DBEdit27: TDBEdit;
    Label55: TLabel;
    DBEdit31: TDBEdit;
    Label56: TLabel;
    DBEdit36: TDBEdit;
    Label127: TLabel;
    DBEdit86: TDBEdit;
    Label135: TLabel;
    DBEdit87: TDBEdit;
    dbrgOperacao: TDBRadioGroup;
    dbrgDestinatario: TDBRadioGroup;
    Panel13: TPanel;
    BitBtn50: TBitBtn;
    BitBtn51: TBitBtn;
    BitBtn52: TBitBtn;
    BitBtn53: TBitBtn;
    GroupBox29: TGroupBox;
    DBGrid10: TDBGrid;
    BitBtn54: TBitBtn;
    BitBtn56: TBitBtn;
    SpeedButton14: TSpeedButton;
    mkCodProd: TMaskEdit;
    mkSubGrupo: TMaskEdit;
    mkGrupo: TMaskEdit;
    lbGrupo: TLabel;
    lbSubGrupo: TLabel;
    lbCodProd: TLabel;
    BitBtn55: TBitBtn;
    tsFichaProds: TTabSheet;
    GroupBox30: TGroupBox;
    Label57: TLabel;
    MaskEdit10: TMaskEdit;
    CheckBox4: TCheckBox;
    BitBtn57: TBitBtn;
    BitBtn58: TBitBtn;
    DBGrid11: TDBGrid;
    tsGE: TTabSheet;
    GroupBox31: TGroupBox;
    GroupBox32: TGroupBox;
    BitBtn59: TBitBtn;
    BitBtn60: TBitBtn;
    BitBtn61: TBitBtn;
    ApplicationEvents1: TApplicationEvents;
    GroupBox33: TGroupBox;
    Label126: TLabel;
    Label136: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    ComboBox13: TComboBox;
    Label149: TLabel;
    ProgressBar2: TProgressBar;
    Label150: TLabel;
    MaskEdit12: TMaskEdit;
    MaskEdit14: TMaskEdit;
    MaskEdit15: TMaskEdit;
    MaskEdit16: TMaskEdit;
    MaskEdit17: TMaskEdit;
    MaskEdit18: TMaskEdit;
    GroupBox34: TGroupBox;
    Label151: TLabel;
    Label152: TLabel;
    ComboBox14: TComboBox;
    ComboBox15: TComboBox;
    Label153: TLabel;
    Label156: TLabel;
    CheckBox6: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox5: TCheckBox;
    RadioGroup1: TRadioGroup;
    EditMoeda3: TEditMoeda;
    SpinEdit1: TSpinEdit;
    Label154: TLabel;
    SpeedButton15: TSpeedButton;
    GroupBox35: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label60: TLabel;
    DBEdit2: TDBEdit;
    DBEdit59: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit16: TDBEdit;
    Edit1: TEdit;
    SpeedButton16: TSpeedButton;
    Edit2: TEdit;
    tsPendenciaPedido: TTabSheet;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    GroupBox36: TGroupBox;
    GroupBox37: TGroupBox;
    BitBtn8: TBitBtn;
    DBGrid12: TDBGrid;
    SpeedButton19: TSpeedButton;
    Panel14: TPanel;
    Label112: TLabel;
    DBMemo1: TDBMemo;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn10: TBitBtn;
    DBEdit18: TDBEdit;
    Label47: TLabel;
    Label63: TLabel;
    DBEdit37: TDBEdit;
    Label84: TLabel;
    DBEdit47: TDBEdit;
    tsPecasUltimaCompra: TTabSheet;
    qrpPecaUltimaCompra: TQuickRep;
    QRBandCabecalho: TQRBand;
    qrlbNomeEmp: TQRLabel;
    QRLabel33: TQRLabel;
    QRSysData6: TQRSysData;
    QRBand2: TQRBand;
    QRHRule3: TQRHRule;
    QRHRule4: TQRHRule;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    qrlabel47: TQRLabel;
    QRLabel38: TQRLabel;
    detailPecaUltCompra: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qrlbQtdEst: TQRLabel;
    qrlbData: TQRLabel;
    qrlbAtributosProd: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRBand4: TQRBand;
    QRLabel42: TQRLabel;
    BitBtn62: TBitBtn;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    qrlbQtdcompra: TQRLabel;
    BitBtn63: TBitBtn;
    Label155: TLabel;
    SpeedButton21: TSpeedButton;
    tbsEtiqueta: TTabSheet;
    PageControl5: TPageControl;
    tbsEti: TTabSheet;
    tbsEtiMarcadas: TTabSheet;
    GroupBox38: TGroupBox;
    GroupBox39: TGroupBox;
    BitBtn65: TBitBtn;
    GroupBox40: TGroupBox;
    BitBtn64: TBitBtn;
    CheckBox9: TCheckBox;
    GroupBox41: TGroupBox;
    BitBtn66: TBitBtn;
    CheckBox10: TCheckBox;
    GroupBox42: TGroupBox;
    GroupBox43: TGroupBox;
    BitBtn68: TBitBtn;
    GroupBox44: TGroupBox;
    BitBtn69: TBitBtn;
    CheckBox12: TCheckBox;
    BitBtn70: TBitBtn;
    GroupBox45: TGroupBox;
    BitBtn71: TBitBtn;
    GroupBox46: TGroupBox;
    BitBtn72: TBitBtn;
    CheckBox14: TCheckBox;
    tsSped: TTabSheet;
    GroupBox48: TGroupBox;
    QRBandSomatorio: TQRBand;
    qrLabelCustoC: TQRLabel;
    qrLbCustoR: TQRLabel;
    qrLabelValorVND: TQRLabel;
    QRHRule5: TQRHRule;
    QRSysData7: TQRSysData;
    BitBtn34: TBitBtn;
    tbsEtiCodBarra: TTabSheet;
    qrpEtiCodBarras: TQuickRep;
    DetailBandEtiCodBarras: TQRBand;
    QRDBText23: TQRDBText;
    QRBarcode1: TQRBarcode;
    GroupBox49: TGroupBox;
    BitBtn73: TBitBtn;
    DBEdit68: TDBEdit;
    Label157: TLabel;
    Label159: TLabel;
    DBEdit75: TDBEdit;
    pnGrades: TPanel;
    Panel17: TPanel;
    DBGrid13: TDBGrid;
    Panel18: TPanel;
    BitBtn76: TBitBtn;
    BitBtn78: TBitBtn;
    pnGradesEst: TPanel;
    GroupBox50: TGroupBox;
    GroupBox51: TGroupBox;
    DBGrid14: TDBGrid;
    Panel15: TPanel;
    BitBtn67: TBitBtn;
    BitBtn77: TBitBtn;
    Label171: TLabel;
    Label172: TLabel;
    DBComboBox16: TDBComboBox;
    Label173: TLabel;
    DBGrid15: TDBGrid;
    Marcarprodutoparaetiqueta1: TMenuItem;
    BitBtn35: TBitBtn;
    GroupBox25: TGroupBox;
    BitBtn36: TBitBtn;
    BitBtn37: TBitBtn;
    GroupBox26: TGroupBox;
    BitBtn38: TBitBtn;
    GroupBox52: TGroupBox;
    BitBtn39: TBitBtn;
    GroupBox53: TGroupBox;
    BitBtn40: TBitBtn;
    SpeedButton22: TSpeedButton;
    GroupBox54: TGroupBox;
    BitBtn41: TBitBtn;
    GroupBox55: TGroupBox;
    BitBtn80: TBitBtn;
    CheckBox15: TCheckBox;
    ComboBox44: TComboBox;
    ComboBox16: TComboBox;
    Label174: TLabel;
    DBEdit25: TDBEdit;
    DBEdit90: TDBEdit;
    Label175: TLabel;
    Label176: TLabel;
    tsEster: TTabSheet;
    pnEtiquetasEs: TPanel;
    GroupBox56: TGroupBox;
    GroupBox57: TGroupBox;
    DBGrid17: TDBGrid;
    SpeedButton30: TSpeedButton;
    Label179: TLabel;
    DBEdit91: TDBEdit;
    QRDBText20: TQRDBText;
    Label180: TLabel;
    DBText1: TDBText;
    CheckBox13: TCheckBox;
    //    tsModEtiTermica: TTabSheet;
    //    pnModEtiTermica: TPanel;
    //    Label183: TLabel;
    //    Label185: TLabel;
    //    BitBtn83: TBitBtn;
    //    BitBtn84: TBitBtn;
    //    DBEditModImp: TDBEdit;
    //    DBEditScript: TDBEdit;
    //    DBEditCodModEti: TDBEdit;
    //    Label182: TLabel;
    //    DBLookupComboBoxModEtiT: TDBLookupComboBox;
    //    pnEtiquetasTer1: TPanel;
    //    GroupBox58: TGroupBox;
    //    Label184: TLabel;
    //    Label186: TLabel;
    //    SpeedButton20: TSpeedButton;
    //    SpeedButton31: TSpeedButton;
    //    SpeedButton32: TSpeedButton;
    //    DBGrid18: TDBGrid;
    //    EditFiscal2: TEditFiscal;
    //    GroupBox59: TGroupBox;
    //    DBGrid19: TDBGrid;
    //    BitBtn85: TBitBtn;
    tsModEtiTermica: TTabSheet;
    tsEtiTerRapida: TTabSheet;
    pnModEtiTermica: TPanel;
    Label183: TLabel;
    Label185: TLabel;
    Label182: TLabel;
    BitBtn83: TBitBtn;
    BitBtn84: TBitBtn;
    DBEditModImp: TDBEdit;
    DBEditScript: TDBEdit;
    DBEditCodModEti: TDBEdit;
    DBLookupComboBoxModEtiT: TDBLookupComboBox;
    pnEtiquetasTer: TPanel;
    GroupBox58: TGroupBox;
    GroupBox59: TGroupBox;
    DBGrid19: TDBGrid;
    BitBtn85: TBitBtn;
    GroupBox60: TGroupBox;
    BitBtn86: TBitBtn;
    CheckBox16: TCheckBox;
    GroupBox61: TGroupBox;
    BitBtn82: TBitBtn;
    CheckBox17: TCheckBox;
    BitBtn81: TBitBtn;
    SpeedButton33: TSpeedButton;
    TabSheet_IndTecprod: TTabSheet;
    BitBtn_IndiceTecnico: TBitBtn;
    QuickRep_FichaProd: TQuickRep;
    QRBand1: TQRBand;
    QRSysData8: TQRSysData;
    QRLabel32: TQRLabel;
    QRLabel37: TQRLabel;
    QRSysData9: TQRSysData;
    QRShape3: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape15: TQRShape;
    lbEmpresa: TQRLabel;
    DetailBand_Indice: TQRBand;
    QRDBText21: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape16: TQRShape;
    QRLabel55: TQRLabel;
    QRSubDetail_Itens: TQRSubDetail;
    QRDBText24: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText33: TQRDBText;
    QRBand_Itens: TQRBand;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRBand5: TQRBand;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRPLabel1: TQRPLabel;
    QRLabel48: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    TabSheet_IndTecEst: TTabSheet;
    QuickRep_IndiceEst: TQuickRep;
    QRBand3: TQRBand;
    QRSysData10: TQRSysData;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRSysData11: TQRSysData;
    QRShape17: TQRShape;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRShape18: TQRShape;
    lblEmpresa2: TQRLabel;
    QRPLabel2: TQRPLabel;
    QRLabel58: TQRLabel;
    DetailBand_Indice2: TQRBand;
    QRDBText30: TQRDBText;
    QRDBText_estf: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText34: TQRDBText;
    QRBand7: TQRBand;
    QRShape19: TQRShape;
    QRLabel59: TQRLabel;
    QRSubDetail_Itens2: TQRSubDetail;
    QRDBText37: TQRDBText;
    QRDBText_quant: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRBand_Itens2: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel60: TQRLabel;
    QRBand9: TQRBand;
    QRLabel61: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel62: TQRLabel;
    QRDBText38: TQRDBText;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRDBText41: TQRDBText;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRShape20: TQRShape;
    QRExpr8: TQRExpr;
    QRLabel_SomaPend: TQRLabel;
    QRExpr4: TQRExpr;
    BitBtn87: TBitBtn;
    QRDBText26: TQRDBText;
    GroupBox62: TGroupBox;
    Label188: TLabel;
    Label189: TLabel;
    Label190: TLabel;
    CheckBox18: TCheckBox;
    ComboBox17: TComboBox;
    ComboBox18: TComboBox;
    ComboBox19: TComboBox;
    TabSheet_Validade: TTabSheet;
    QuickRep_Validade: TQuickRep;
    QRBand6: TQRBand;
    QRSysData12: TQRSysData;
    QRLabel54: TQRLabel;
    QRLabel68: TQRLabel;
    QRSysData13: TQRSysData;
    QRShape21: TQRShape;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRShape22: TQRShape;
    lblEmpresa3: TQRLabel;
    QRPLabel3: TQRPLabel;
    QRLabel73: TQRLabel;
    QRBand10: TQRBand;
    QRShape23: TQRShape;
    QRLabel74: TQRLabel;
    QRBand_Itens3: TQRBand;
    QRBand12: TQRBand;
    QRLabel83: TQRLabel;
    QRExpr7: TQRExpr;
    BitBtn88: TBitBtn;
    QRBand_Indice3: TQRBand;
    QRDBText42: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRShape24: TQRShape;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRShape25: TQRShape;
    QRLabel72: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel79: TQRLabel;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRSubDetail_itens3: TQRSubDetail;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRLabel81: TQRLabel;
    QRLabel75: TQRLabel;
    QRDBText57: TQRDBText;
    QRDBText58: TQRDBText;
    QRDBText59: TQRDBText;
    QRDBText60: TQRDBText;
    QRLabel80: TQRLabel;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRExpr1: TQRExpr;
    Label191: TLabel;
    DBText2: TDBText;
    Label192: TLabel;
    DBEdit93: TDBEdit;
    QRLabel82: TQRLabel;
    QRLabel84: TQRLabel;
    Splitter5: TSplitter;
    tsComposicao: TTabSheet;
    tsDefinirPreco: TTabSheet;
    tsDefinirPromocoes: TTabSheet;
    SpeedButton34: TSpeedButton;
    Panel16: TPanel;
    BitBtn91: TBitBtn;
    Panel19: TPanel;
    PageControl7: TPageControl;
    TabSheet8: TTabSheet;
    Panel20: TPanel;
    BitBtn97: TBitBtn;
    Panel21: TPanel;
    TabSheet9: TTabSheet;
    Panel24: TPanel;
    BitBtn98: TBitBtn;
    BitBtn93: TBitBtn;
    GroupBox72: TGroupBox;
    Label198: TLabel;
    Label199: TLabel;
    Label200: TLabel;
    Label210: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    EditHw2: TEditHw;
    EditHw3: TEditHw;
    DBLookupComboBox6: TDBLookupComboBox;
    DBEdit96: TDBEdit;
    DBEdit97: TDBEdit;
    BitBtn99: TBitBtn;
    PopupMenu3: TPopupMenu;
    ApagarTodasPromocoes: TMenuItem;
    Selecionartodosprodutos: TMenuItem;
    Desmarcatodosprodutos1: TMenuItem;
    PopupMenu4: TPopupMenu;
    ApagartodasPrecos: TMenuItem;
    PopupMenu5: TPopupMenu;
    Desfazerselecao: TMenuItem;
    SelecionarTodos1: TMenuItem;
    Label215: TLabel;
    DBText31: TDBText;
    CheckBox19: TCheckBox;
    BitBtn100: TBitBtn;
    Label220: TLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    CheckBox20: TCheckBox;
    Label221: TLabel;
    QRShape26: TQRShape;
    QRLabel85: TQRLabel;
    QRDBText43: TQRDBText;
    QRShape27: TQRShape;
    QRDBText22: TQRDBText;
    DBGrid25: TDBGrid;
    BitBtn101: TBitBtn;
    tsConversao: TTabSheet;
    GroupBox68: TGroupBox;
    DBText27: TDBText;
    DBText28: TDBText;
    DBText29: TDBText;
    Label201: TLabel;
    Label202: TLabel;
    DBText30: TDBText;
    Label203: TLabel;
    Label216: TLabel;
    DBText32: TDBText;
    DBText33: TDBText;
    Label218: TLabel;
    QRExpr3: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRSysData2: TQRSysData;
    QRSysData16: TQRSysData;
    Label231: TLabel;
    DBEdit109: TDBEdit;
    tsDefinirPrecoDiferenciado: TTabSheet;
    Panel32: TPanel;
    BitBtn109: TBitBtn;
    Panel33: TPanel;
    PageControl9: TPageControl;
    TabSheet13: TTabSheet;
    Panel34: TPanel;
    BitBtn110: TBitBtn;
    BitBtn111: TBitBtn;
    BitBtn112: TBitBtn;
    BitBtn113: TBitBtn;
    Panel35: TPanel;
    DBGrid28: TDBGrid;
    TabSheet14: TTabSheet;
    Panel36: TPanel;
    Label234: TLabel;
    BitBtn114: TBitBtn;
    BitBtn115: TBitBtn;
    CheckBox21: TCheckBox;
    GroupBox71: TGroupBox;
    Label236: TLabel;
    Label237: TLabel;
    EditHw4: TEditHw;
    EditHw5: TEditHw;
    SpeedButton35: TSpeedButton;
    Label235: TLabel;
    DBLookupComboBox8: TDBLookupComboBox;
    Label238: TLabel;
    DBLookupComboBox9: TDBLookupComboBox;
    EditHw6: TEditHw;
    PopupMenu6: TPopupMenu;
    MenuItem1: TMenuItem;
    Label239: TLabel;
    Label241: TLabel;
    EditHw8: TEditHw;
    ckPrecoDif2: TCheckBox;
    ckPromocao2: TCheckBox;
    QuickRep5: TQuickRep;
    DetailBand5: TQRBand;
    QRBand16: TQRBand;
    QRShape31: TQRShape;
    QRLabel97: TQRLabel;
    QRLabel98: TQRLabel;
    QRLabel99: TQRLabel;
    QRLabel100: TQRLabel;
    QRLabel101: TQRLabel;
    QRLabel102: TQRLabel;
    QRLabel103: TQRLabel;
    QRLabel104: TQRLabel;
    QRShape32: TQRShape;
    TitleBand5: TQRBand;
    QRLabel105: TQRLabel;
    QRLabel106: TQRLabel;
    QRSysData17: TQRSysData;
    qrLabelEmpresa5: TQRLabel;
    QRSysData18: TQRSysData;
    PageFooterBand5: TQRBand;
    QRLabel108: TQRLabel;
    QRGroup1: TQRGroup;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRLabel107: TQRLabel;
    QRLabel113: TQRLabel;
    qrpCatalogo2: TQuickRep;
    DetailCatalogo2: TQRBand;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
    QRBand17: TQRBand;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape45: TQRShape;
    QRLabel117: TQRLabel;
    PageHeaderBand2: TQRBand;
    QRLabel118: TQRLabel;
    QRLabel119: TQRLabel;
    QRSysData19: TQRSysData;
    QRLabel120: TQRLabel;
    QRSysData20: TQRSysData;
    QRLabel121: TQRLabel;
    PageFooterBand4: TQRBand;
    QRLabel122: TQRLabel;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr28: TQRExpr;
    QRLabel123: TQRLabel;
    QRExpr32: TQRExpr;
    QRLabel124: TQRLabel;
    QRExpr13: TQRExpr;
    QRGroup2: TQRGroup;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRShape41: TQRShape;
    QRLabel111: TQRLabel;
    QRShape50: TQRShape;
    QRLabel112: TQRLabel;
    QRShape49: TQRShape;
    QRShape51: TQRShape;
    QRDBText71: TQRDBText;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRShape52: TQRShape;
    QRExpr17: TQRExpr;
    QRExpr26: TQRExpr;
    QRExpr27: TQRExpr;
    QRExpr29: TQRExpr;
    QRShape48: TQRShape;
    QRShape37: TQRShape;
    QRShape44: TQRShape;
    QRExpr30: TQRExpr;
    QRExpr31: TQRExpr;
    QRExpr33: TQRExpr;
    ScrollBox7: TScrollBox;
    GroupBox17: TGroupBox;
    GroupBox18: TGroupBox;
    Label25: TLabel;
    Label53: TLabel;
    cbxComEst: TCheckBox;
    cbxSemEst: TCheckBox;
    cbxGrupo: TCheckBox;
    cbxSubGrupo: TCheckBox;
    cbxLoc: TCheckBox;
    cbxDescGr: TCheckBox;
    cbxValGr: TCheckBox;
    cbOrdem: TComboBox;
    cbGrupoOrdem: TComboBox;
    ckPrecoTab: TCheckBox;
    ckPrecoDif: TCheckBox;
    ckPromocao: TCheckBox;
    GroupBox22: TGroupBox;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    GroupBox20: TGroupBox;
    Label107: TLabel;
    Label109: TLabel;
    mkDescGr: TMaskEdit;
    DBGrid7: TDBGrid;
    MaskEdit11: TMaskEdit;
    GroupBox21: TGroupBox;
    Label108: TLabel;
    Label110: TLabel;
    mkDescSubGr: TMaskEdit;
    DBGrid8: TDBGrid;
    MaskEdit13: TMaskEdit;
    GroupBox73: TGroupBox;
    Label244: TLabel;
    Label245: TLabel;
    mkTipo: TMaskEdit;
    DBGrid29: TDBGrid;
    MaskEdit20: TMaskEdit;
    GroupBox74: TGroupBox;
    Label246: TLabel;
    Label247: TLabel;
    mkPromocao: TMaskEdit;
    DBGrid30: TDBGrid;
    MaskEdit22: TMaskEdit;
    DBLookupComboBox10: TDBLookupComboBox;
    QRLabel116: TQRLabel;
    QRLabel125: TQRLabel;
    tsTribAdicional: TTabSheet;
    GroupBox77: TGroupBox;
    Label257: TLabel;
    Label258: TLabel;
    Label259: TLabel;
    MaskEdit19: TMaskEdit;
    MaskEdit21: TMaskEdit;
    BitBtn121: TBitBtn;
    EditHw9: TEditHw;
    tsControleProducaoEstoque: TTabSheet;
    qkRProducaoEstoque: TQuickRep;
    TitleBand3: TQRBand;
    QRLabel126: TQRLabel;
    QRLabel127: TQRLabel;
    QRLabel128: TQRLabel;
    QRLabel129: TQRLabel;
    QRLabel130: TQRLabel;
    QRDBText72: TQRDBText;
    QRLabel131: TQRLabel;
    QRLabel132: TQRLabel;
    QRLabel133: TQRLabel;
    QRLabel134: TQRLabel;
    QRLabel135: TQRLabel;
    QRLabel136: TQRLabel;
    QRLabel137: TQRLabel;
    QRLabel138: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText70: TQRDBText;
    QRLabel139: TQRLabel;
    QRShape47: TQRShape;
    QRLabel140: TQRLabel;
    QRLabel141: TQRLabel;
    QRLabel142: TQRLabel;
    QRLabel143: TQRLabel;
    QRShape53: TQRShape;
    QRShape46: TQRShape;
    QRLabel144: TQRLabel;
    QRLabel145: TQRLabel;
    QRLabel146: TQRLabel;
    QRLabel147: TQRLabel;
    QRLabel148: TQRLabel;
    QRLabel149: TQRLabel;
    QRShape55: TQRShape;
    QRLabel150: TQRLabel;
    QRLabel151: TQRLabel;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRLabel152: TQRLabel;
    QRLabel153: TQRLabel;
    QRShape58: TQRShape;
    QRShape54: TQRShape;
    QRShape59: TQRShape;
    QRLabel154: TQRLabel;
    QRShape60: TQRShape;
    QRLabel155: TQRLabel;
    QRLabel156: TQRLabel;
    QRLabel158: TQRLabel;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRLabel157: TQRLabel;
    QRLabel159: TQRLabel;
    QRLabel160: TQRLabel;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRLabel161: TQRLabel;
    QRShape66: TQRShape;
    QRLabel162: TQRLabel;
    QRLabel163: TQRLabel;
    QRShape67: TQRShape;
    QRLabel164: TQRLabel;
    QRLabel165: TQRLabel;
    QRShape68: TQRShape;
    DetailBand1: TQRBand;
    QRDBText73: TQRDBText;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText76: TQRDBText;
    QRDBText77: TQRDBText;
    QRDBText78: TQRDBText;
    QRDBText79: TQRDBText;
    QRDBText80: TQRDBText;
    QRDBText81: TQRDBText;
    QRDBText82: TQRDBText;
    QRDBText83: TQRDBText;
    QRDBText84: TQRDBText;
    QRLabel166: TQRLabel;
    PageFooterBand6: TQRBand;
    QRLabel168: TQRLabel;
    QRLabel172: TQRLabel;
    QRLabel170: TQRLabel;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRLabel167: TQRLabel;
    QRShape88: TQRShape;
    QRLabel169: TQRLabel;
    QRLabel171: TQRLabel;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    cbxsomenteDifPro: TCheckBox;
    Label251: TLabel;
    Label253: TLabel;
    Label254: TLabel;
    Label255: TLabel;
    MaskEdit23: TMaskEdit;
    MaskEdit24: TMaskEdit;
    MaskEdit25: TMaskEdit;
    MaskEdit26: TMaskEdit;
    Label204: TLabel;
    BitBtn119: TBitBtn;
    Label121: TLabel;
    Label209: TLabel;
    Label260: TLabel;
    Label261: TLabel;
    Label262: TLabel;
    tsBuscaPreco: TTabSheet;
    Panel40: TPanel;
    cbDelimitador: TComboBox;
    edSalvarComo: TEdit;
    SpeedButton36: TSpeedButton;
    lbArqBuscaPreco: TListBox;
    Label263: TLabel;
    Label265: TLabel;
    Label266: TLabel;
    cbApenasEAN: TComboBox;
    edMaxCaract: TSpinEdit;
    Label267: TLabel;
    SpeedButton37: TSpeedButton;
    Panel42: TPanel;
    Panel44: TPanel;
    Voltar: TBitBtn;
    BitBtn122: TBitBtn;
    Label264: TLabel;
    cbApenasEst: TComboBox;
    spAltSPED0205: TSpeedButton;
    tsSped0205: TTabSheet;
    pnSped0205: TPanel;
    pnBotoesSped0205: TPanel;
    lbSpacoSped0205: TLabel;
    grCadastroSped0205: TGroupBox;
    gridSped0205: TDBGrid;
    lbGrupoSped0205: TLabel;
    lbCodigoSped0205: TLabel;
    lbDescrSped0205: TLabel;
    lbDtIniSped0205: TLabel;
    lbDtFimSped0205: TLabel;
    edGrupoSped0205: TEdit;
    edCodigoSped0205: TEdit;
    edDescricaoSped0205: TEdit;
    edDataIniSped0205: TMaskEdit;
    edDataFimSped0205: TMaskEdit;
    btSalvarSped0205: TBitBtn;
    btCancelarSped0205: TBitBtn;
    btVoltarSped0205: TBitBtn;
    btNovoSped0205: TBitBtn;
    btAlterarSped0205: TBitBtn;
    btExcluirSped0205: TBitBtn;
    lbTipoAltSped0205: TLabel;
    lbMesSped0205: TLabel;
    edMesMovSped0205: TMaskEdit;
    cbTipoAltSped0205: TComboBox;
    dsProdAltSped0205: TDataSource;
    spLimparMesSpedReg0205: TSpeedButton;
    SpeedButton38: TSpeedButton;
    SpeedButton39: TSpeedButton;
    SaveDialog1: TSaveDialog;
    BitBtn120: TBitBtn;
    ckEstoqueDiario: TCheckBox;
    TabSheet15: TTabSheet;
    GroupBox14: TGroupBox;
    Splitter3: TSplitter;
    DBGrid4: TDBGrid;
    DBGrid20: TDBGrid;
    DBGrid32: TDBGrid;
    GroupBox15: TGroupBox;
    Splitter4: TSplitter;
    DBGrid5: TDBGrid;
    DBGrid21: TDBGrid;
    imgInformationTipo: TImage;
    DBGrid6: TDBGrid;
    Panel46: TPanel;
    Panel47: TPanel;
    Label113: TLabel;
    Label116: TLabel;
    Panel48: TPanel;
    Panel49: TPanel;
    Panel45: TPanel;
    DBGrid34: TDBGrid;
    Panel50: TPanel;
    DBGrid35: TDBGrid;
    DBEdit100: TDBEdit;
    Label111: TLabel;
    Panel51: TPanel;
    Label114: TLabel;
    DBText9: TDBText;
    Splitter6: TSplitter;
    SpeedButton40: TSpeedButton;
    tsCadastroSimples: TTabSheet;
    pageCadSimples: TPageControl;
    tsS_Cadastro: TTabSheet;
    tsS_Fiscal: TTabSheet;
    tsS_Composicao: TTabSheet;
    tsS_Conversao: TTabSheet;
    tsS_Precos: TTabSheet;
    Panel53: TPanel;
    LabelSeq_: TLabel;
    BitBtn_4: TBitBtn;
    BitBtn_5: TBitBtn;
    BitBtn_6: TBitBtn;
    CheckCadSeq_: TCheckBox;
    scrollS_Cadastro: TScrollBox;
    dbgridLookUp: TDBGrid;
    Label274: TLabel;
    DBEdit117: TDBEdit;
    Label275: TLabel;
    Label276: TLabel;
    Label277: TLabel;
    DBEdit119: TDBEdit;
    SpeedButton41: TSpeedButton;
    DBEdit120: TDBEdit;
    Label278: TLabel;
    DBEdit121: TDBEdit;
    tsS_Outros: TTabSheet;
    Label279: TLabel;
    Label280: TLabel;
    SpeedButton42: TSpeedButton;
    Label281: TLabel;
    DBEdit123: TDBEdit;
    DBEdit124: TDBEdit;
    Label283: TLabel;
    DBEdit125: TDBEdit;
    Label286: TLabel;
    Label302: TLabel;
    DBEdit126: TDBEdit;
    Label304: TLabel;
    Label305: TLabel;
    DBEdit129: TDBEdit;
    DBLookupComboBox11: TDBLookupComboBox;
    SpeedButton45: TSpeedButton;
    SpeedButton46: TSpeedButton;
    Label307: TLabel;
    DBEdit130: TDBEdit;
    DBEdit131: TDBEdit;
    Label310: TLabel;
    Label311: TLabel;
    Label312: TLabel;
    Label313: TLabel;
    Label314: TLabel;
    Label315: TLabel;
    Label316: TLabel;
    Label317: TLabel;
    lbMarkUpTb: TLabel;
    lbMarkUp30: TLabel;
    Label320: TLabel;
    lbMarkUpAt: TLabel;
    lbMarkUp60: TLabel;
    lbMarkUp90: TLabel;
    Label324: TLabel;
    Label325: TLabel;
    DBLookupComboBox12: TDBLookupComboBox;
    DBLookupComboBox13: TDBLookupComboBox;
    DBEdit132: TDBEdit;
    DBEdit136: TDBEdit;
    edMarkUpTb: TDBEdit;
    edPercAj30: TDBEdit;
    DBEdit145: TDBEdit;
    DBEdit146: TDBEdit;
    edMarkUp90: TDBEdit;
    DBEdit140: TDBEdit;
    DBEdit141: TDBEdit;
    DBEdit138: TDBEdit;
    edMarkUpAt: TDBEdit;
    DBEdit142: TDBEdit;
    edMarkUp30: TDBEdit;
    Label326: TLabel;
    DBLookupComboBox14: TDBLookupComboBox;
    lbPercAj30: TLabel;
    edMarkUp60: TDBEdit;
    lbPercAj60: TLabel;
    edPercAj60: TDBEdit;
    lbPercAj90: TLabel;
    edPercAj90: TDBEdit;
    DBGrid36: TDBGrid;
    lbMargMinVa: TLabel;
    lbMargMinAt: TLabel;
    edMargMinVa: TDBEdit;
    edMargMinAt: TDBEdit;
    Label337: TLabel;
    DBEdit150: TDBEdit;
    Label338: TLabel;
    Label340: TLabel;
    Label341: TLabel;
    Label342: TLabel;
    Label343: TLabel;
    DBLookupComboBox16: TDBLookupComboBox;
    SpeedButton59: TSpeedButton;
    DBLookupComboBox17: TDBLookupComboBox;
    edEstPend: TEdit;
    edEstDisp: TEdit;
    Label318: TLabel;
    DBEdit118: TDBEdit;
    DBEdit133: TDBEdit;
    SpeedButton44: TSpeedButton;
    SpeedButton47: TSpeedButton;
    scrollS_Fiscal: TScrollBox;
    scrollS_Outros: TScrollBox;
    Label282: TLabel;
    DBLookupComboBox18: TDBLookupComboBox;
    Label358: TLabel;
    Label299: TLabel;
    DBEdit169: TDBEdit;
    Label300: TLabel;
    Label301: TLabel;
    DBLookupComboBox19: TDBLookupComboBox;
    DBLookupComboBox20: TDBLookupComboBox;
    Label284: TLabel;
    Label288: TLabel;
    Label289: TLabel;
    Label303: TLabel;
    Label306: TLabel;
    Label334: TLabel;
    Label335: TLabel;
    Label336: TLabel;
    DBLookupComboBox21: TDBLookupComboBox;
    DBEdit170: TDBEdit;
    DBEdit171: TDBEdit;
    DBEdit172: TDBEdit;
    Label359: TLabel;
    DBEdit173: TDBEdit;
    DBEdit174: TDBEdit;
    DBEdit175: TDBEdit;
    Label360: TLabel;
    DBEdit176: TDBEdit;
    Label361: TLabel;
    DBEdit177: TDBEdit;
    Label362: TLabel;
    edsValorCompraUltNF: TDBEdit;
    Label363: TLabel;
    edsCustoUltimo: TDBEdit;
    Label364: TLabel;
    edsCustoMedio: TDBEdit;
    Label365: TLabel;
    edsCustoReposicao: TDBEdit;
    Label366: TLabel;
    edsCustoMNF: TDBEdit;
    Label367: TLabel;
    DBEdit183: TDBEdit;
    Label368: TLabel;
    Label369: TLabel;
    Label370: TLabel;
    Label371: TLabel;
    DBComboBox19: TDBComboBox;
    DBEdit184: TDBEdit;
    DBEdit185: TDBEdit;
    DBEdit186: TDBEdit;
    Label287: TLabel;
    DBMemo2: TDBMemo;
    pnImagemProduto: TPanel;
    OpenPictureDialog1: TOpenPictureDialog;
    pnOpcaoImg: TPanel;
    SpeedButton48: TSpeedButton;
    SpeedButton49: TSpeedButton;
    SpeedButton50: TSpeedButton;
    SpeedButton51: TSpeedButton;
    SpeedButton52: TSpeedButton;
    Panel55: TPanel;
    Label372: TLabel;
    DBMemo3: TDBMemo;
    lbS_qtdeImgProd: TLabel;
    pnReducao: TPanel;
    scrollS_Conversao: TScrollBox;
    scrollS_Precos: TScrollBox;
    Panel58: TPanel;
    Label374: TLabel;
    SpeedButton53: TSpeedButton;
    DBCheckBox2: TDBCheckBox;
    Label373: TLabel;
    DBEdit187: TDBEdit;
    Label375: TLabel;
    Label376: TLabel;
    DBText46: TDBText;
    Label377: TLabel;
    DBText47: TDBText;
    btnSOutros: TSpeedButton;
    btnSFiscal: TSpeedButton;
    btnSComposicao: TSpeedButton;
    btnSConversao: TSpeedButton;
    btnSPrecos: TSpeedButton;
    scrollConversao: TScrollBox;
    scrollS_Composicao: TScrollBox;
    scrollComposicao: TScrollBox;
    GroupBox65: TGroupBox;
    DBText34: TDBText;
    DBText35: TDBText;
    DBText36: TDBText;
    Label222: TLabel;
    Label223: TLabel;
    DBText37: TDBText;
    Label224: TLabel;
    GroupBox75: TGroupBox;
    DBText42: TDBText;
    DBText43: TDBText;
    DBText44: TDBText;
    Label248: TLabel;
    Label249: TLabel;
    DBText45: TDBText;
    Label250: TLabel;
    Label228: TLabel;
    DBEdit189: TDBEdit;
    tsOutros: TTabSheet;
    scrollOutros: TScrollBox;
    Label229: TLabel;
    DBMemo4: TDBMemo;
    Label230: TLabel;
    DBMemo5: TDBMemo;
    lbqtdeImgProd: TLabel;
    pnS_Outros: TPanel;
    pnS_Fiscal: TPanel;
    pnS_Composicao: TPanel;
    pnS_Conversao: TPanel;
    pnS_Precos: TPanel;
    RegistrarVendaPerdida1: TMenuItem;
    DBLookupComboBox15: TDBLookupComboBox;
    tsPrecosQtde: TTabSheet;
    GroupBox64: TGroupBox;
    DBText38: TDBText;
    DBText39: TDBText;
    DBText40: TDBText;
    Label69: TLabel;
    Label327: TLabel;
    DBText41: TDBText;
    Label333: TLabel;
    Label378: TLabel;
    DBText48: TDBText;
    DBText49: TDBText;
    Label379: TLabel;
    tsS_PrecosPorQtde: TTabSheet;
    pnS_PrecosPorQtde: TPanel;
    scrollS_PrecoPorQtde: TScrollBox;
    btnSPrecoPorQtde: TSpeedButton;
    PopupMenu7: TPopupMenu;
    ApagartodasPrecosPorQtde: TMenuItem;
    ckPrecoQtde2: TCheckBox;
    ckPrecoQtde: TCheckBox;
    Panel62: TPanel;
    Label385: TLabel;
    edLocalizar: TEdit;
    Label386: TLabel;
    DBText50: TDBText;
    Label387: TLabel;
    DBEdit192: TDBEdit;
    Label388: TLabel;
    DBEdit193: TDBEdit;
    Label389: TLabel;
    DBEdit194: TDBEdit;
    tsFichaComprasVendasC: TTabSheet;
    ScrollBox8: TScrollBox;
    Splitter7: TSplitter;
    Panel64: TPanel;
    Label391: TLabel;
    Label392: TLabel;
    imgInformationTipoC: TImage;
    MaskEdit27: TMaskEdit;
    MaskEdit28: TMaskEdit;
    BitBtn125: TBitBtn;
    BitBtn126: TBitBtn;
    BitBtn127: TBitBtn;
    ckEstoqueDiarioC: TCheckBox;
    Panel65: TPanel;
    Splitter8: TSplitter;
    Panel66: TPanel;
    Label393: TLabel;
    Label394: TLabel;
    Panel67: TPanel;
    Panel68: TPanel;
    Panel69: TPanel;
    DBGrid38: TDBGrid;
    Panel70: TPanel;
    Label395: TLabel;
    DBText51: TDBText;
    Panel71: TPanel;
    SpeedButton54: TSpeedButton;
    DBGrid39: TDBGrid;
    GroupBox67: TGroupBox;
    Panel73: TPanel;
    Panel74: TPanel;
    Label396: TLabel;
    Panel75: TPanel;
    Label397: TLabel;
    Panel72: TPanel;
    ckAlterouEst: TCheckBox;
    ckNAlterouEst: TCheckBox;
    pnFiltros: TPanel;
    ckRequisicao: TCheckBox;
    ckBalG: TCheckBox;
    ckOrdemServ: TCheckBox;
    ckBalD: TCheckBox;
    ckOrcamento: TCheckBox;
    ckExcCancReab: TCheckBox;
    ckNotas: TCheckBox;
    ckDevolucao: TCheckBox;
    ckProducao: TCheckBox;
    ckCorrecao: TCheckBox;
    ckCupom: TCheckBox;
    ckNotaD: TCheckBox;
    ckNotasS: TCheckBox;
    ckNotasC: TCheckBox;
    Panel76: TPanel;
    Label398: TLabel;
    ckConfirmados: TCheckBox;
    ckPendentes: TCheckBox;
    RadioGroupOpcaoLinha: TRadioGroup;
    tbsEtiCodBarra2: TTabSheet;
    qrpEtiCodBarras2: TQuickRep;
    DetailBandEtiCodBarras2: TQRBand;
    QRDBText96: TQRDBText;
    QRBarcode2: TQRBarcode;
    QRDBText97: TQRDBText;
    PopupMenu8: TPopupMenu;
    SelecionartodosprodutosTemp: TMenuItem;
    DesmarcatodosprodutosTemp: TMenuItem;
    tsECommerce: TTabSheet;
    GroupBox76: TGroupBox;
    DBText52: TDBText;
    DBText54: TDBText;
    Label409: TLabel;
    Label410: TLabel;
    DBText55: TDBText;
    Label411: TLabel;
    DBText53: TDBText;
    cdColor: TColorDialog;
    tsS_ECommerce: TTabSheet;
    pnS_ECommerce: TPanel;
    scrollS_ECommerce: TScrollBox;
    btnSECommerce: TSpeedButton;
    Label436: TLabel;
    DBEdit212: TDBEdit;
    Label437: TLabel;
    DBEdit213: TDBEdit;
    Label438: TLabel;
    DBEdit214: TDBEdit;
    Label439: TLabel;
    Label440: TLabel;
    Label441: TLabel;
    Label424: TLabel;
    DBEdit215: TDBEdit;
    DBEdit216: TDBEdit;
    DBEdit217: TDBEdit;
    Label429: TLabel;
    Label431: TLabel;
    Label432: TLabel;
    Label442: TLabel;
    Label443: TLabel;
    tsGradesImagens: TTabSheet;
    pnGradesImagens: TPanel;
    Panel109: TPanel;
    BitBtn132: TBitBtn;
    BitBtn133: TBitBtn;
    DBGrid40: TDBGrid;
    Panel110: TPanel;
    Image1: TImage;
    pnEscolherGradeImage: TPanel;
    Label433: TLabel;
    Label434: TLabel;
    Label444: TLabel;
    Label445: TLabel;
    pnDescImagemProduto: TPanel;
    pnLabelImagemProduto: TLabel;
    pmOutros: TPopupMenu;
    bt_outros_prod: TSpeedButton;
    Verificarreplicaointernapendente1: TMenuItem;
    sp_dados_nfe_dados_ult_entrada: TSpeedButton;
    bt_alt_est_min: TSpeedButton;
    bt_alt_est_max: TSpeedButton;
    SpeedButton66: TSpeedButton;
    SpeedButton67: TSpeedButton;
    Label447: TLabel;
    Label449: TLabel;
    DBEdit218: TDBEdit;
    SpeedButtonAlterarEst: TSpeedButton;
    SpeedButtonAlterarEst2: TSpeedButton;
    lbDescrGradeImg: TLabel;
    tsAlterDadosProd: TTabSheet;
    SpeedButtonAlterDados: TSpeedButton;
    GroupBox79: TGroupBox;
    DBText56: TDBText;
    DBText57: TDBText;
    DBText58: TDBText;
    Label450: TLabel;
    Label451: TLabel;
    DBText59: TDBText;
    Label453: TLabel;
    Label456: TLabel;
    DBText60: TDBText;
    DBText61: TDBText;
    Label457: TLabel;
    tsAlterDadosLote: TTabSheet;
    Panel119: TPanel;
    btSalvarProdLote: TBitBtn;
    btnCancProdLote: TBitBtn;
    btSairProdLote: TBitBtn;
    ScrollBoxAlterDadosLote: TScrollBox;
    GbAlterarProdLote: TGroupBox;
    Label473: TLabel;
    Label474: TLabel;
    Label478: TLabel;
    Label463: TLabel;
    Label464: TLabel;
    Label489: TLabel;
    pnGrupo: TPanel;
    ckGrupo: TCheckBox;
    EdCodGrupoProd: TEditHw;
    DBLGrupoProd: TDBLookupComboBox;
    lbGrupoProd: TLabel;
    pnPerfil: TPanel;
    lbPerfilProd: TLabel;
    SpeedBPerfil: TSpeedButton;
    EdCodPerfilProd: TEditHw;
    EdPerfilProd: TEdit;
    ckPerfil: TCheckBox;
    pnSubGrupo: TPanel;
    lbSubGrupoProd: TLabel;
    DBLSubGrupo: TDBLookupComboBox;
    EdCodSubGrupo: TEditHw;
    ckSubGrupo: TCheckBox;
    pnMarca: TPanel;
    lbMarcaProd: TLabel;
    EdCodMarca: TEditHw;
    DBLMarca: TDBLookupComboBox;
    ckMarca: TCheckBox;
    pnNatOP: TPanel;
    lbCFOPIntra: TLabel;
    lbCFOPInter: TLabel;
    EdCodCFOP: TEditHw;
    EdCodCFOPInter: TEditHw;
    ckNatOP: TCheckBox;
    pnNCM: TPanel;
    lbCodNCM: TLabel;
    ckNCM: TCheckBox;
    pnCEST: TPanel;
    lbCEST: TLabel;
    SpeedBCEST: TSpeedButton;
    ckCEST: TCheckBox;
    pnCST: TPanel;
    lbCodCST: TLabel;
    EdCodCST: TEdit;
    ckCST: TCheckBox;
    pnCSON: TPanel;
    lbCodCSOSN: TLabel;
    EdCodCSOSN: TEdit;
    ckCSON: TCheckBox;
    pnAliqICMS: TPanel;
    lbAliqICMS: TLabel;
    EdAliqICMS: TEditHw;
    ckAliqICMS: TCheckBox;
    pnCSTPisCofinsS: TPanel;
    lbCSTPisCofinsS: TLabel;
    EdCSTPisCofinsSaida: TEdit;
    ckCSTPisCofinsS: TCheckBox;
    pnNatRec: TPanel;
    lbNatReceita: TLabel;
    EdNatReceita: TEdit;
    ckNatRec: TCheckBox;
    pnAliqPisCofinsDif: TPanel;
    lbAliqPisDif: TLabel;
    EdAliqPisDif: TEditHw;
    lbAliqCofinsDif: TLabel;
    EdAliqCofinsDif: TEditHw;
    ckAliqPisCofinsDif: TCheckBox;
    pnAliqCredPisCofins: TPanel;
    lbAliqCredPis: TLabel;
    EdAliqCredPis: TEditHw;
    lbAliqCredCofins: TLabel;
    EdAliqCredCofins: TEditHw;
    ckAliqCredPisCofins: TCheckBox;
    pnIsento: TPanel;
    lbIsento: TLabel;
    ckIsento: TCheckBox;
    pnIPICst: TPanel;
    lbCSTIPI: TLabel;
    EdCSTIPI: TEdit;
    ckCstIPI: TCheckBox;
    pnIPIAliq: TPanel;
    lbAliqIPI: TLabel;
    EdAliqIPI: TEditHw;
    ckAliqIPI: TCheckBox;
    pnIPICodEnq: TPanel;
    lbCodEnqIPI: TLabel;
    EdCodEnqIPI: TEdit;
    ckCodEnqIPI: TCheckBox;
    pnPercTab: TPanel;
    lbPercTab: TLabel;
    EdPercTab: TEditHw;
    ckPercTab: TCheckBox;
    pnPercAtac: TPanel;
    lbPercAtac: TLabel;
    EdPercAtac: TEditHw;
    ckPercAtac: TCheckBox;
    pnPerc30: TPanel;
    lbPerc30: TLabel;
    EdPerc30: TEditHw;
    ckPerc30: TCheckBox;
    pnPerc60: TPanel;
    lbPerc60: TLabel;
    EdPerc60: TEditHw;
    ckPerc60: TCheckBox;
    pnPerc90: TPanel;
    lbPerc90: TLabel;
    EdPerc90: TEditHw;
    ckPerc90: TCheckBox;
    pnDescMax: TPanel;
    lbDescMax: TLabel;
    EdDescMax: TEditHw;
    ckDescMax: TCheckBox;
    CbIsento: TComboBox;
    EdCodNCM: TEdit;
    pnPercMargemMinVarejo: TPanel;
    lbPercMargemMinVarejo: TLabel;
    EdPercMargemMinVarejo: TEditHw;
    ckPercMargemMinVarejo: TCheckBox;
    pnPercMargemMinAtacado: TPanel;
    lbPercMargemMinAtacado: TLabel;
    EdPercMargemMinAtacado: TEditHw;
    ckPercMargemMinAtacado: TCheckBox;
    Label458: TLabel;
    pnPercAjustePrec30: TPanel;
    lbPercAjustePrec30: TLabel;
    EdPercAjustePrec30: TEditHw;
    CheckBox11: TCheckBox;
    pnPercAjustePrec60: TPanel;
    lbPercAjustePrec60: TLabel;
    EdPercAjustePrec60: TEditHw;
    ckPercAjustePrec60: TCheckBox;
    pnPercAjustePrec90: TPanel;
    lbPercAjustePrec90: TLabel;
    EdPercAjustePrec90: TEditHw;
    ckPercAjustePrec90: TCheckBox;
    ckPercAjustePrec30: TCheckBox;
    Label459: TLabel;
    pnConsumo: TPanel;
    lbConsumo: TLabel;
    CheckBox22: TCheckBox;
    ckConsumo: TCheckBox;
    cbConsumo: TComboBox;
    pnPermDesc: TPanel;
    lbPermDesc: TLabel;
    CheckBox24: TCheckBox;
    ckPermDesc: TCheckBox;
    cbPermDesc: TComboBox;
    pnTipoProduto: TPanel;
    lbTipoProduto: TLabel;
    CheckBox23: TCheckBox;
    ckTipoProduto: TCheckBox;
    DbLTipo: TDBLookupComboBox;
    pnClasse: TPanel;
    lbClasse: TLabel;
    ckClasse: TCheckBox;
    cbClasse: TComboBox;
    pnAlterarDescrCupom: TPanel;
    lbAlterarDescrCupom: TLabel;
    ckAlterarDescrCupom: TCheckBox;
    cbAlterarDescrCupom: TComboBox;
    pnAlterarVlCupom: TPanel;
    lbAlterarVlCupom: TLabel;
    ckAlterarVlCupom: TCheckBox;
    cbAlterarVlCupom: TComboBox;
    pnComissaoProduto: TPanel;
    lbComissaoProduto: TLabel;
    EdComissaoProduto: TEditHw;
    ckComissaoProduto: TCheckBox;
    pnComissaoGerente: TPanel;
    lbComissaoGerente: TLabel;
    EdComissaoGerente: TEditHw;
    ckComissaoGerente: TCheckBox;
    EdCEST: TMaskEdit;
    pnAplicacaoRef: TPanel;
    lbAplicacaoRef: TLabel;
    EdAplicacaoRef: TEdit;
    ckAplicacaoRef: TCheckBox;
    pnAloc1: TPanel;
    lbAloc1: TLabel;
    ckAloc1: TCheckBox;
    pnAloc2: TPanel;
    lbAloc2: TLabel;
    ckAloc2: TCheckBox;
    MkAloc1: TMaskEdit;
    MkAloc2: TMaskEdit;
    pnTipoItemProduto: TPanel;
    lbTipoItemProduto: TLabel;
    ckTipoItemProduto: TCheckBox;
    DbLTipoItem: TDBLookupComboBox;
    btnSComercioAberto: TSpeedButton;
    tsS_ComercioAberto: TTabSheet;
    pnS_ComercioAberto: TPanel;
    scrollS_ComercioAberto: TScrollBox;
    tsComercioAberto: TTabSheet;
    GroupBox80: TGroupBox;
    DBText62: TDBText;
    DBText63: TDBText;
    Label421: TLabel;
    Label460: TLabel;
    DBText64: TDBText;
    Label461: TLabel;
    DBText65: TDBText;
    SpeedButtonEnvComercioAberto: TSpeedButton;
    tsDadosComercioAberto: TTabSheet;
    pnDadosComercioAberto: TPanel;
    pnButtonComercioAberto: TPanel;
    pnOKDadosComercioAberto: TBitBtn;
    pnCancDadosComercioAberto: TBitBtn;
    RadioGroupOpcoesComercioAberto: TRadioGroup;
    lbIdECommerce: TLabel;
    DBTextIdEcommerce: TDBText;
    lbIdComercioAberto: TLabel;
    DBTextIdComercioAberto: TDBText;
    tsOpcoesAlterarGrupo: TTabSheet;
    pnOpcoesAlterarGrupo: TPanel;
    pnButtonOpcoesAlterarGrupo: TPanel;
    BitBtnOpcoesAlterarGrupoOK: TBitBtn;
    BitBtnOpcoesAlterarGrupoCancel: TBitBtn;
    RadioGroupOpcoesAlterarGrupo: TRadioGroup;
    ckLixeira: TCheckBox;
    SpeedButtonSelTodosGrupo: TSpeedButton;
    SpeedButtonDescTodosGrupo: TSpeedButton;
    SpeedButtonSelTodosSubGrupo: TSpeedButton;
    SpeedButtonDescTodosSubGrupo: TSpeedButton;
    SpeedButtonSelTodosPromocao: TSpeedButton;
    SpeedButtonDescTodosPromocao: TSpeedButton;
    SpeedButtonSelTodosTabPreco: TSpeedButton;
    SpeedButtonDescTodosTabPreco: TSpeedButton;
    ScrollBox14: TScrollBox;
    Panel87: TPanel;
    GroupBox47: TGroupBox;
    lbTipoItem: TLabel;
    edPickerGrupoFiscal: TComboboxEntityPickerFrame;
    lbGrupoFiscal: TLabel;
    lbGrupoFiscal2: TLabel;
    Label160: TLabel;
    Label162: TLabel;
    Label164: TLabel;
    Label165: TLabel;
    Label181: TLabel;
    Label187: TLabel;
    Label193: TLabel;
    Label194: TLabel;
    Label269: TLabel;
    Label270: TLabel;
    Label271: TLabel;
    Label272: TLabel;
    Label390: TLabel;
    Label406: TLabel;
    Label161: TLabel;
    Label163: TLabel;
    lbnfe_utrib: TLabel;
    lbnfe_qtrib: TLabel;
    bt_consulta_cest1: TSpeedButton;
    DBComboBox11: TDBComboBox;
    DBEdit85: TDBEdit;
    DBEdit88: TDBEdit;
    DBEdit92: TDBEdit;
    Memo2: TMemo;
    DBEdit94: TDBEdit;
    DBEdit95: TDBEdit;
    dbFCI: TDBEdit;
    DBEdit102: TDBEdit;
    DBEdit103: TDBEdit;
    DBEdit116: TDBEdit;
    DBEdit195: TDBEdit;
    DBEdit205: TDBEdit;
    DBEdit206: TDBEdit;
    DBEdit207: TDBEdit;
    DBEdit208: TDBEdit;
    DBComboBox9: TDBComboBox;
    DBEdit209: TDBEdit;
    ednfe_utrib: TDBEdit;
    ednfe_qtrib: TDBEdit;
    GroupBox70: TGroupBox;
    Label232: TLabel;
    Label233: TLabel;
    Label268: TLabel;
    Label399: TLabel;
    Label400: TLabel;
    Label401: TLabel;
    DBEdit110: TDBEdit;
    DBEdit111: TDBEdit;
    DBEdit101: TDBEdit;
    DBEdit196: TDBEdit;
    DBEdit197: TDBEdit;
    DBEdit198: TDBEdit;
    DBEdit199: TDBEdit;
    GroupBox63: TGroupBox;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText25: TDBText;
    Label195: TLabel;
    Label196: TLabel;
    DBText26: TDBText;
    Label197: TLabel;
    Panel10: TPanel;
    groupComposicao: TGroupBox;
    DBGrid22: TDBGrid;
    Panel28: TPanel;
    groupDesmembramento: TGroupBox;
    DBGrid27: TDBGrid;
    Panel31: TPanel;
    BitBtn105: TBitBtn;
    BitBtn108: TBitBtn;
    groupConversao: TGroupBox;
    pageEAN_Conversao: TPageControl;
    TabSheet11: TTabSheet;
    Panel29: TPanel;
    BitBtn106: TBitBtn;
    BitBtn107: TBitBtn;
    Panel30: TPanel;
    DBGrid26: TDBGrid;
    TabSheet12: TTabSheet;
    Panel56: TPanel;
    Label225: TLabel;
    Label227: TLabel;
    Label243: TLabel;
    DBEditCodigoEAN: TDBEdit;
    Panel113: TPanel;
    BitBtn103: TBitBtn;
    BitBtn104: TBitBtn;
    ScrollBox9: TScrollBox;
    Panel77: TPanel;
    GroupBoxDadosEC: TGroupBox;
    pnDadosEC: TPanel;
    pnOpcoesDadosEC: TPanel;
    btnOKAlterarDadosEC: TBitBtn;
    btnCancAlterarDadosEC: TBitBtn;
    Panel114: TPanel;
    LbPagEC: TLabel;
    Panel115: TPanel;
    sbVoltarEC: TSpeedButton;
    sbAvancarEC: TSpeedButton;
    PageControlEC: TPageControl;
    TabSheetEC1: TTabSheet;
    ScrollBox10: TScrollBox;
    pnDescricaoHTMLEC: TPanel;
    Panel99: TPanel;
    lbDescrCompletaEC: TLabel;
    Panel78: TPanel;
    pnOpcoesHtml: TPanel;
    SpeedButtonAlterarHtmlEC: TSpeedButton;
    pnDescricaoProdEC: TPanel;
    lbDescrEC: TLabel;
    lbPromoEC: TLabel;
    lbFreteGratisEC: TLabel;
    lbLancEC: TLabel;
    lbTermAceiteEC: TLabel;
    lbCompreJuntoEC: TLabel;
    lbVirtualEC: TLabel;
    lbSincEC: TLabel;
    lbCategoria: TLabel;
    lbDestaqueEC: TLabel;
    lbDispEC: TLabel;
    DBComboBoxPromoEC: TDBComboBox;
    DBComboBoxFreteGratisEC: TDBComboBox;
    DBComboBoxLancEC: TDBComboBox;
    DBComboBoxTermAceiteEC: TDBComboBox;
    DBComboBoxCompreJuntoEC: TDBComboBox;
    DBComboBoxVirtualEC: TDBComboBox;
    DBComboBoxSincEC: TDBComboBox;
    DBLookupComboBoxCategoria: TDBLookupComboBox;
    DBComboBoxDestaqueEC: TDBComboBox;
    DBComboBoxDispEC: TDBComboBox;
    TabSheetEC2: TTabSheet;
    ScrollBox16: TScrollBox;
    Panel93: TPanel;
    pnCategoriasEC: TPanel;
    Splitter9: TSplitter;
    Panel94: TPanel;
    TreeViewCat: TTreeView;
    Panel95: TPanel;
    Panel96: TPanel;
    Panel97: TPanel;
    TreeViewCatDB: TTreeView;
    Panel100: TPanel;
    Panel117: TPanel;
    Panel103: TPanel;
    Label430: TLabel;
    pnImagemEC: TPanel;
    Panel98: TPanel;
    Label426: TLabel;
    lbS_qtdeImgProdEC: TLabel;
    Panel112: TPanel;
    pnImagemProdutoEC: TPanel;
    TabSheetEC4: TTabSheet;
    pnGradeVaricaoEC: TPanel;
    Panel101: TPanel;
    Label428: TLabel;
    Panel102: TPanel;
    TreeViewGradeEC: TTreeView;
    Panel104: TPanel;
    Panel107: TPanel;
    Panel105: TPanel;
    TreeViewGradeEC_DB: TTreeView;
    Panel106: TPanel;
    Panel116: TPanel;
    pnAlterEstEC: TPanel;
    pnAlterEstProdEC: TPanel;
    lbEstMinEC: TLabel;
    lbEstEC: TLabel;
    Panel111: TPanel;
    Label446: TLabel;
    DBEditEstMinEC: TDBEdit;
    DBEditEstEC: TDBEdit;
    Panel123: TPanel;
    btAlterEstEC: TBitBtn;
    btOKAlterEstEC: TBitBtn;
    btCancAlterEstEC: TBitBtn;
    pnAlterEstGradeEC: TPanel;
    DBGridAlterEstECGrade: TDBGrid;
    Panel124: TPanel;
    btAlterEstECGrade: TBitBtn;
    btOKAlterEstECGrade: TBitBtn;
    btCancAlterEstECGrade: TBitBtn;
    Panel118: TPanel;
    Label448: TLabel;
    DBText67: TDBText;
    pnButtomAlterEstECGrade: TPanel;
    lbEstGradeEC: TLabel;
    DBEditEstECGrade: TDBEdit;
    pnButtonAlterDadosEC: TPanel;
    btnAlterarDadosEC: TBitBtn;
    ScrollBox11: TScrollBox;
    Panel79: TPanel;
    GroupBoxDadosCA: TGroupBox;
    pnDadosCA: TPanel;
    PageControlCA: TPageControl;
    TabSheetCA1: TTabSheet;
    ScrollBox12: TScrollBox;
    Panel80: TPanel;
    pnDescricaoProdCA: TPanel;
    lbDescrCA: TLabel;
    lbPrecoCombinarCA: TLabel;
    lbEnvCA: TLabel;
    DBEditDescrCA: TDBEdit;
    DBComboBoxEnvCA: TDBComboBox;
    DBComboBoxPrecoCombinarCA: TDBComboBox;
    pnDescricaoHTMLCA: TPanel;
    Panel81: TPanel;
    lbDescrCompletaCA: TLabel;
    Panel82: TPanel;
    Panel84: TPanel;
    SpeedButtonAlterarHtmlCA: TSpeedButton;
    WebBrowserCA: TWebBrowser;
    TabSheetCA2: TTabSheet;
    ScrollBox13: TScrollBox;
    pnImagensGradeCA: TPanel;
    pnGradesCA: TPanel;
    Panel83: TPanel;
    Label422: TLabel;
    Panel85: TPanel;
    TreeViewGradeCA: TTreeView;
    Panel86: TPanel;
    Panel89: TPanel;
    Panel90: TPanel;
    TreeViewGradeCA_DB: TTreeView;
    Panel121: TPanel;
    Panel122: TPanel;
    pnImagensCA: TPanel;
    Panel125: TPanel;
    Label465: TLabel;
    lbS_qtdeImgProdCA: TLabel;
    Panel127: TPanel;
    pnImagemProdutoCA: TPanel;
    TabSheetCA3: TTabSheet;
    ScrollBox17: TScrollBox;
    pnAlterEstCA: TPanel;
    pnAlterEstGradeCA: TPanel;
    DBGridAlterEstCAGrade: TDBGrid;
    Panel132: TPanel;
    btAlterEstCAGrade: TBitBtn;
    btOKAlterEstCAGrade: TBitBtn;
    btCancAlterEstCAGrade: TBitBtn;
    Panel133: TPanel;
    Label470: TLabel;
    DBText66: TDBText;
    pnButtomAlterEstCAGrade: TPanel;
    lbEstGradeCA: TLabel;
    DBEditEstCAGrade: TDBEdit;
    pnAlterEstProdCA: TPanel;
    lbEstCA: TLabel;
    Panel130: TPanel;
    Label469: TLabel;
    DBEditEstCA: TDBEdit;
    Panel135: TPanel;
    btAlterEstCA: TBitBtn;
    btOKAlterEstCA: TBitBtn;
    btCancAlterEstCA: TBitBtn;
    pnOpcoesDadosCA: TPanel;
    btnOKAlterarDadosCA: TBitBtn;
    btnCancAlterarDadosCA: TBitBtn;
    Panel137: TPanel;
    LbPagCA: TLabel;
    Panel138: TPanel;
    sbVoltarCA: TSpeedButton;
    sbAvancarCA: TSpeedButton;
    pnButtonAlterDadosCA: TPanel;
    btnAlterarDadosCA: TBitBtn;
    GroupBox66: TGroupBox;
    scrollPrecosPorQtde: TScrollBox;
    Panel54: TPanel;
    pagePrecoQtde: TPageControl;
    tsPrecosQtde_Visualizar: TTabSheet;
    Panel59: TPanel;
    DBGrid37: TDBGrid;
    Panel60: TPanel;
    BitBtn_Imprimir_PrecoPorQuant: TBitBtn;
    BitBtn_Excluir_PrecoPorQuant: TBitBtn;
    BitBtn_Alterar_PrecoPorQuant: TBitBtn;
    BitBtn_Novo_PrecoPorQuant: TBitBtn;
    TabSheet6: TTabSheet;
    Panel61: TPanel;
    GroupBox81: TGroupBox;
    Panel63: TPanel;
    Label380: TLabel;
    Label381: TLabel;
    Label382: TLabel;
    DBLookupComboBox22: TDBLookupComboBox;
    DBEdit54: TDBEdit;
    DBEdit148: TDBEdit;
    Panel108: TPanel;
    BitBtn128: TBitBtn;
    BitBtn129: TBitBtn;
    TabSheet16: TTabSheet;
    QuickRepProdutosPrecoQtde: TQuickRep;
    QRBand15: TQRBand;
    QRLabel173: TQRLabel;
    QRLabel174: TQRLabel;
    QRSysData21: TQRSysData;
    QRLabel175: TQRLabel;
    QRSysData22: TQRSysData;
    QRLabel176: TQRLabel;
    QRDBText85: TQRDBText;
    QRDBText86: TQRDBText;
    QRDBText87: TQRDBText;
    QRDBText88: TQRDBText;
    QRLabel177: TQRLabel;
    QRLabel178: TQRLabel;
    QRLabel179: TQRLabel;
    QRBand18: TQRBand;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRLabel180: TQRLabel;
    QRLabel181: TQRLabel;
    QRLabel182: TQRLabel;
    QRBand19: TQRBand;
    QRDBText89: TQRDBText;
    QRDBText90: TQRDBText;
    QRDBText91: TQRDBText;
    QRBand20: TQRBand;
    QRLabel183: TQRLabel;
    QRShape71: TQRShape;
    GroupBox69: TGroupBox;
    scrollPrecos: TScrollBox;
    Panel22: TPanel;
    pagePrecos: TPageControl;
    tsDefinirPreco_Visualizar: TTabSheet;
    Panel26: TPanel;
    DBGrid23: TDBGrid;
    Panel27: TPanel;
    BitBtn92: TBitBtn;
    BitBtn94: TBitBtn;
    BitBtn102: TBitBtn;
    TabSheet7: TTabSheet;
    Panel41: TPanel;
    GroupBox82: TGroupBox;
    Panel23: TPanel;
    Label206: TLabel;
    Label205: TLabel;
    Label211: TLabel;
    Label212: TLabel;
    Label242: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    EditHw1: TEditHw;
    Edit3: TEdit;
    EditHw7: TEditHw;
    Panel25: TPanel;
    DbGrid24: TDBGrid;
    Panel92: TPanel;
    BitBtn95: TBitBtn;
    BitBtn96: TBitBtn;
    TabSheet10: TTabSheet;
    qrpPromocaoProduto: TQuickRep;
    QRBand8: TQRBand;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRSysData14: TQRSysData;
    QRLabel88: TQRLabel;
    QRSysData15: TQRSysData;
    QRLabel89: TQRLabel;
    QRDBText63: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText67: TQRDBText;
    QRDBText68: TQRDBText;
    QRLabel93: TQRLabel;
    QRLabel94: TQRLabel;
    QRLabel96: TQRLabel;
    QRBand11: TQRBand;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel90: TQRLabel;
    QRLabel91: TQRLabel;
    QRLabel92: TQRLabel;
    QRBand13: TQRBand;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRBand14: TQRBand;
    QRLabel95: TQRLabel;
    QRShape30: TQRShape;
    ScrollBox15: TScrollBox;
    pnTribAdicional: TPanel;
    groupTribAdicional: TGroupBox;
    Panel38: TPanel;
    Panel37: TPanel;
    BitBtn116: TBitBtn;
    BitBtn117: TBitBtn;
    Panel39: TPanel;
    DBGrid31: TDBGrid;
    pnEscolhaPerfil: TPanel;
    Panel43: TPanel;
    BitBtn123: TBitBtn;
    BitBtn124: TBitBtn;
    GroupBox78: TGroupBox;
    DBGrid33: TDBGrid;
    pnFiscal: TPanel;
    Label330: TLabel;
    Label344: TLabel;
    Label350: TLabel;
    Label356: TLabel;
    bt_consulta_cest2: TSpeedButton;
    Label295: TLabel;
    SpeedButton43: TSpeedButton;
    Label297: TLabel;
    Label319: TLabel;
    Label321: TLabel;
    Label322: TLabel;
    Label323: TLabel;
    Label328: TLabel;
    Label329: TLabel;
    Label331: TLabel;
    Label332: TLabel;
    Label339: TLabel;
    Label345: TLabel;
    Label346: TLabel;
    Label347: TLabel;
    Label348: TLabel;
    Label349: TLabel;
    Label351: TLabel;
    Label352: TLabel;
    Label353: TLabel;
    Label285: TLabel;
    Label290: TLabel;
    Label291: TLabel;
    Label293: TLabel;
    Label354: TLabel;
    Label355: TLabel;
    Label294: TLabel;
    Label296: TLabel;
    Label298: TLabel;
    Label357: TLabel;
    Label402: TLabel;
    Label403: TLabel;
    Label404: TLabel;
    Label405: TLabel;
    Label292: TLabel;
    Label407: TLabel;
    Label408: TLabel;
    lb2nfe_utrib: TLabel;
    lb2nfe_qtrib: TLabel;
    DBEdit165: TDBEdit;
    DBEdit134: TDBEdit;
    DBEdit135: TDBEdit;
    DBEdit137: TDBEdit;
    DBEdit139: TDBEdit;
    DBEdit143: TDBEdit;
    DBEdit144: TDBEdit;
    DBEdit147: TDBEdit;
    DBEdit149: TDBEdit;
    DBEdit151: TDBEdit;
    DBEdit152: TDBEdit;
    DBEdit153: TDBEdit;
    DBEdit154: TDBEdit;
    DBEdit155: TDBEdit;
    DBEdit156: TDBEdit;
    DBEdit157: TDBEdit;
    DBEdit158: TDBEdit;
    DBEdit159: TDBEdit;
    DBEdit160: TDBEdit;
    DBEdit161: TDBEdit;
    DBEdit162: TDBEdit;
    DBEdit163: TDBEdit;
    DBEdit164: TDBEdit;
    DBEdit166: TDBEdit;
    DBEdit167: TDBEdit;
    DBEdit168: TDBEdit;
    Memo1: TMemo;
    DBEdit188: TDBEdit;
    DBEdit200: TDBEdit;
    DBEdit201: TDBEdit;
    DBEdit202: TDBEdit;
    DBEdit203: TDBEdit;
    DBEdit204: TDBEdit;
    DBComboBox12: TDBComboBox;
    DBEdit210: TDBEdit;
    ed2nfe_utrib: TDBEdit;
    ed2nfe_qtrib: TDBEdit;
    Panel52: TPanel;
    Panel128: TPanel;
    btVoltarDadosProd: TBitBtn;
    btVoltarDadosProd2: TBitBtn;
    ckMenuLateral: TCheckBox;
    PopupMenuEstoquePorEmpresa: TPopupMenu;
    ConfigurarcolunasEstoquePorEmpresa: TMenuItem;
    ResetarConfiguraesdecolunasEstoquePorEmpresa: TMenuItem;
    SalvardadosnoExcelEstoquePorEmpresa: TMenuItem;
    ReajustarLarguradascolunasEstoquePorEmpresa: TMenuItem;
    CopiarparareadetransfernciaEstoquePorEmpresa: TMenuItem;
    SomarvaloresdacolunaEstoquePorEmpresa: TMenuItem;
    PopupMenuPrecosVndPorEmpresa: TPopupMenu;
    ConfigurarcolunasPrecosVndPorEmpresa: TMenuItem;
    ResetarConfiguraesdecolunasPrecosVndPorEmpresa: TMenuItem;
    SalvardadosnoExcelPrecosVndPorEmpresa: TMenuItem;
    ReajustarLarguradascolunasPrecosVndPorEmpresa: TMenuItem;
    CopiarparareadetransfernciaPrecosVndPorEmpresa: TMenuItem;
    SomarvaloresdacolunaPrecosVndPorEmpresa: TMenuItem;
    Label105: TLabel;
    DBLookupComboBox23: TDBLookupComboBox;
    pnComissaoFaixaDesconto: TPanel;
    ckComissaoFaixaDesconto: TCheckBox;
    Label454: TLabel;
    EdComissaoFaixaDesc: TEditHw;
    DBLComissaoFaixaDesc: TDBLookupComboBox;
    pnCorDif: TPanel;
    lbCorDif: TLabel;
    pnCorPromocao: TPanel;
    lbCorPromocao: TLabel;
    Label455: TLabel;
    DBEdit211: TDBEdit;
    Label466: TLabel;
    DBLookupComboBox24: TDBLookupComboBox;
    Label467: TLabel;
    Label468: TLabel;
    DBComboBox13: TDBComboBox;
    DBEditDescrEC: TDBEdit;
    WebBrowserEC: TWebBrowser;
    TabSheetEC3: TTabSheet;
    ScrollBox18: TScrollBox;
    pnSEO_EC: TPanel;
    lbTituloPag: TLabel;
    lbPalavrasChaves: TLabel;
    lbPalavrasChavesExplic: TLabel;
    lbURLAcesso: TLabel;
    DBEditTituloPag: TDBEdit;
    DBEditPalavrasChaves: TDBEdit;
    DBEditURLAcesso: TDBEdit;
    Panel91: TPanel;
    lbPrecoCombinarEC: TLabel;
    DBComboBoxPrecoCombinarEC: TDBComboBox;
    Label480: TLabel;
    DBComboBox14: TDBComboBox;
    Label481: TLabel;
    DBLookupComboBox25: TDBLookupComboBox;
    pnForaLinhaCor: TPanel;
    pnConsumoCor: TPanel;
    tsFretePeso: TTabSheet;
    GroupBox83: TGroupBox;
    DBText68: TDBText;
    DBText69: TDBText;
    DBText70: TDBText;
    Label482: TLabel;
    Label483: TLabel;
    DBText71: TDBText;
    Label484: TLabel;
    DBText73: TDBText;
    Label486: TLabel;
    pageFretePeso: TPageControl;
    tsFretePesoGrid: TTabSheet;
    tsFretePesoCadastro: TTabSheet;
    Panel131: TPanel;
    Panel134: TPanel;
    gridFretePeso: TDBGrid;
    Panel136: TPanel;
    BitBtn131: TBitBtn;
    BitBtn134: TBitBtn;
    BitBtn135: TBitBtn;
    ScrollBox19: TScrollBox;
    Panel141: TPanel;
    btFretePesoOK: TBitBtn;
    btFretePesoCancel: TBitBtn;
    Panel140: TPanel;
    edFreteCodCliente: TDBLookupComboBox;
    Label485: TLabel;
    Label487: TLabel;
    edFreteUnidade: TDBEdit;
    Label488: TLabel;
    edFretePeso: TDBEdit;
    Label490: TLabel;
    edFreteValor: TDBEdit;
    tsS_FretePeso: TTabSheet;
    btFretePesoProcuraCliente: TSpeedButton;
    btnSFretePeso: TSpeedButton;
    pnS_FretePeso: TPanel;
    scrollS_FretePeso: TScrollBox;
    Label492: TLabel;
    Label493: TLabel;
    Panel139: TPanel;
    DBText22: TDBText;
    DBText23: TDBText;
    DBText24: TDBText;
    Label166: TLabel;
    Label167: TLabel;
    Label168: TLabel;
    Label170: TLabel;
    Label207: TLabel;
    Label208: TLabel;
    Label494: TLabel;
    Label495: TLabel;
    Panel142: TPanel;
    Label169: TLabel;
    DBEdit89: TDBEdit;
    BitBtn74: TBitBtn;
    BitBtn79: TBitBtn;
    BitBtn75: TBitBtn;
    BitBtn118: TBitBtn;
    tsGradeProducao: TTabSheet;
    MainMenu1: TMainMenu;
    pnCadastroMateriasPrimas: TPanel;
    Panel144: TPanel;
    btCadastroMateriasPrimasOK: TBitBtn;
    CadastroMateriasPrimasCancel: TBitBtn;
    pnCadastroResultadoFinal: TPanel;
    Label496: TLabel;
    Label497: TLabel;
    Label498: TLabel;
    Label499: TLabel;
    Label501: TLabel;
    db_cod_prod_it: TDBEdit;
    db_grupo_prod_it: TDBEdit;
    db_descr_prod_it: TDBEdit;
    lk_grade_it: TDBLookupComboBox;
    Panel145: TPanel;
    btCadastroResultadoFinalOK: TBitBtn;
    btCadastroResultadoFinalCanc: TBitBtn;
    ed_num_fab_it: TEdit;
    GroupBox84: TGroupBox;
    DBText72: TDBText;
    DBText74: TDBText;
    DBText75: TDBText;
    Label500: TLabel;
    Label502: TLabel;
    Label503: TLabel;
    Label508: TLabel;
    DBText77: TDBText;
    Label509: TLabel;
    GroupBox85: TGroupBox;
    Label504: TLabel;
    Label505: TLabel;
    Label506: TLabel;
    Label507: TLabel;
    lb_grade_mp: TLabel;
    db_cod_prod_mp: TDBEdit;
    db_grupo_prod_mp: TDBEdit;
    db_descr_prod_mp: TDBEdit;
    lk_grade_mp: TDBLookupComboBox;
    ed_num_fab_mp: TEdit;
    btSelectAllGrade: TSpeedButton;
    btUnSelectAllGrade: TSpeedButton;
    SpeedButtonAlterarProduto: TSpeedButton;
    SpeedBSelTodos: TSpeedButton;
    SpeedBDesmarcarTodos: TSpeedButton;
    SpeedButtonAlterarProduto2: TSpeedButton;
    SpeedButtonGradesEstoqueProduto: TSpeedButton;
    SpeedButtonAlterarGrupoCodProduto: TSpeedButton;
    lbCorLote: TLabel;
    lbExplProdSemGrupo: TLabel;
    btExcluirRegistro: TSpeedButton;
    btLixeiraVazia: TSpeedButton;
    btRestaurarRegistro: TSpeedButton;
    btLixeiraCheia: TSpeedButton;
    pnCorLote: TPanel;
    ckLixeira2: TCheckBox;
    pnCenterAlterDadosProd: TPanel;
    pnPercReducao: TPanel;
    lbPercReducao: TLabel;
    ckPercReducao: TCheckBox;
    EdPercReducao: TEditHw;
    BitBtn136: TBitBtn;
    ckImprimirQtdeEstoqueMarcadas: TCheckBox;
    ckImprimirEtiQtdeEstoque: TCheckBox;
    btSelectAllEtiqEster: TSpeedButton;
    btUnSelectAllEtiqEster: TSpeedButton;
    btSelectAllEtiqterRapida: TSpeedButton;
    btUnSelectAllEtiqTerRapida: TSpeedButton;
    btSelectAllEtiqMarcadas: TSpeedButton;
    btUnSelectAllEtiqMarcadas: TSpeedButton;
    PopupMenuEtiqEster: TPopupMenu;
    SelecionartodosprodutosEtiqEster: TMenuItem;
    DesmarcatodosprodutosEtiqEster: TMenuItem;
    PopupMenuEtiqTerRapida: TPopupMenu;
    SelecionartodosprodutosEtiTerRapida: TMenuItem;
    DesmarcatodosprodutosEtiTerRapida: TMenuItem;
    btSelectAllEtiq: TSpeedButton;
    btUnSelectAllEtiq: TSpeedButton;
    SpeedButtonECommerce: TSpeedButton;
    SpeedButtonComercioAberto: TSpeedButton;
    ckPermOpcaoMarcadas: TCheckBox;
    SpeedButtonECommerce2: TSpeedButton;
    SpeedButtonComercioAberto2: TSpeedButton;    
    btHistPreco: TSpeedButton;
    tsPrecosModal: TTabSheet;
    btn_historicoPrecos: TSpeedButton;
    btn_alterarPrecos: TSpeedButton;
    pnPrecosUnificados: TPanel;
    Label518: TLabel;
    lbPrecoMarkupProporcional: TLabel;
    Label529: TLabel;
    lbDescontoPreco30noVarejo: TLabel;
    Label531: TLabel;
    lbAdicionalPreco3060e90: TLabel;
    GridPanel2: TGridPanel;
    Label510: TLabel;
    Label511: TLabel;
    Label512: TLabel;
    Label513: TLabel;
    Label514: TLabel;
    Label515: TLabel;
    Label516: TLabel;
    Label517: TLabel;
    Label519: TLabel;
    Label521: TLabel;
    Label522: TLabel;
    Label523: TLabel;
    Label525: TLabel;
    Label526: TLabel;
    Label527: TLabel;
    DBEdit219: TDBEdit;
    DBEdit220: TDBEdit;
    GridPanel1: TGridPanel;
    DBEdit238: TDBEdit;
    DBEdit239: TDBEdit;
    DBEdit240: TDBEdit;
    DBEdit241: TDBEdit;
    DBEdit242: TDBEdit;
    DBEdit243: TDBEdit;
    GridPanel3: TGridPanel;
    DBEdit244: TDBEdit;
    DBEdit245: TDBEdit;
    DBEdit246: TDBEdit;
    DBEdit247: TDBEdit;
    DBEdit248: TDBEdit;
    DBEdit249: TDBEdit;
    DBEdit221: TDBEdit;
    DBEdit222: TDBEdit;
    DBEdit223: TDBEdit;
    DBEdit224: TDBEdit;
    DBEdit225: TDBEdit;
    DBEdit226: TDBEdit;
    DBEdit227: TDBEdit;
    DBEdit228: TDBEdit;
    DBEdit229: TDBEdit;
    DBEdit230: TDBEdit;
    DBEdit231: TDBEdit;
    DBEdit232: TDBEdit;
    DBEdit233: TDBEdit;
    DBEdit234: TDBEdit;
    DBEdit235: TDBEdit;
    DBEdit236: TDBEdit;
    DBEdit237: TDBEdit;
    Panel120: TPanel;
    Label524: TLabel;
    SpeedButton57: TSpeedButton;
    Label528: TLabel;
    DBEdit250: TDBEdit;
    DBEdit251: TDBEdit;
    Label520: TLabel;
    DBEdit252: TDBEdit;
    Panel126: TPanel;
    btPrecosUnificadosUndo: TBitBtn;
    SpeedButton60: TSpeedButton;
    Label530: TLabel;
    DBText76: TDBText;
    DBEdit178888: TEdit;
    btns_alterarPrecos: TSpeedButton;
    btns_historicoPrecos: TSpeedButton;
    edMarukpMargem: TDBEdit;
    lbMakupMargem: TLabel;
    lbMarkupMargemPromo: TLabel;
    edMarukpMargemPromo: TDBEdit;
    Label532: TLabel;
    DBEdit7: TDBEdit;
    Label533: TLabel;
    lbDescontoMaxProdQtde: TLabel;
    DbeditDescontoMaxProdQtde: TDBEdit;
    Label412: TLabel;
    DBEdit13: TDBEdit;
    btHabPercentProdQtde: TSpeedButton;
    btHabMarkupProdQtde: TSpeedButton;
    Label413: TLabel;
    Label414: TLabel;
    btHabPercentProdTabPreco: TSpeedButton;
    btHabMarkupProdTabPreco: TSpeedButton;
    Label415: TLabel;
    Label416: TLabel;
    Label417: TLabel;
    DBEdit22: TDBEdit;
    Label418: TLabel;
    DBEdit34: TDBEdit;
    pnEstDiarioGrade: TPanel;
    DBGrid3: TDBGrid;
    SplitterGradeEstDiario: TSplitter;
    Panel143: TPanel;
    Label177: TLabel;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    EditFiscal1: TEditFiscal;
    Panel146: TPanel;
    Panel147: TPanel;
    DBGrid16: TDBGrid;
    Label178: TLabel;
    Panel148: TPanel;
    Label184: TLabel;
    SpeedButton20: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    EditFiscal2: TEditFiscal;
    Panel149: TPanel;
    DBGrid18: TDBGrid;
    Panel150: TPanel;
    Label186: TLabel;
    ckUmEtiqCadaProd: TCheckBox;
    TabSheet5: TTabSheet;
    pnDelPromocaoProd: TPanel;
    pnBottomDelPromocaoProd: TPanel;
    btCancelarDelPromocaoProd: TBitBtn;
    btOKDelPromocaoProd: TBitBtn;
    TabSheet17: TTabSheet;
    RadioButtonDelPromocaoProdOp1: TRadioButton;
    lbDelPromocaoProd1Op1: TLabel;
    Label419: TLabel;
    lbDelPromocaoProd1Op2: TLabel;
    lbDelPromocaoProd1Op4: TLabel;
    RadioButtonDelPromocaoProdOp2: TRadioButton;
    lbDelPromocaoProd2Op1: TLabel;
    lbDelPromocaoProd2Op2: TLabel;
    lbDelPromocaoProd2Op3: TLabel;
    lbDelPromocaoProd2Op4: TLabel;
    lbDelPromocaoProd2Op5: TLabel;
    lbDelPromocaoProd2Op8: TLabel;
    pnDelTabelaProd: TPanel;
    lbDelTabelaProd1Op1: TLabel;
    Label423: TLabel;
    lbDelTabelaProd1Op2: TLabel;
    lbDelTabelaProd1Op4: TLabel;
    lbDelTabelaProd2Op1: TLabel;
    lbDelTabelaProd2Op2: TLabel;
    lbDelTabelaProd2Op3: TLabel;
    lbDelTabelaProd2Op4: TLabel;
    lbDelTabelaProd2Op5: TLabel;
    lbDelTabelaProd2Op8: TLabel;
    pnBottomDelTabelaProd: TPanel;
    btCancelarDelTabelaProd: TBitBtn;
    btOKDelTabelaProd: TBitBtn;
    RadioButtonDelTabelaProdOp1: TRadioButton;
    RadioButtonDelTabelaProdOp2: TRadioButton;
    lbDelTabelaProd2Op6: TLabel;
    lbDelPromocaoProd2Op6: TLabel;
    ckEcommerce: TCheckBox;
    SpeedButtonSincronizarOutrasEmpECommerce: TSpeedButton;
    PopupMenu9: TPopupMenu;
    AlterarQtdeNFProd: TMenuItem;
    VerProdutosAcabados: TMenuItem;
    tsProdutosAcabados: TTabSheet;
    Panel151: TPanel;
    BitBtn14: TBitBtn;
    pnProdutosAcabados: TPanel;
    Panel152: TPanel;
    BitBtnProdutosAcabadosOK: TBitBtn;
    BitBtnProdutosAcabadosCancelar: TBitBtn;
    DBGrid42: TDBGrid;
    DBGrid41: TDBGrid;
    Splitter10: TSplitter;
    BitBtnProdutosAcabadosSair: TBitBtn;
    GroupBox86: TGroupBox;
    DBText78: TDBText;
    DBText79: TDBText;
    DBText80: TDBText;
    Label420: TLabel;
    Label425: TLabel;
    DBText81: TDBText;
    Label427: TLabel;
    GroupBox87: TGroupBox;
    DBText82: TDBText;
    Label435: TLabel;
    Label452: TLabel;
    Label462: TLabel;
    tsProdutosMatInsumos: TTabSheet;
    VerProdutosMatInsumos: TMenuItem;
    pnProdutosMatInsumos: TPanel;
    Splitter12: TSplitter;
    Panel154: TPanel;
    BitBtnProdutosMatInsumosOK: TBitBtn;
    BitBtnProdutosMatInsumosCancelar: TBitBtn;
    BitBtnProdutosMatInsumosSair: TBitBtn;
    DBGrid43: TDBGrid;
    DBGrid44: TDBGrid;
    GroupBox88: TGroupBox;
    DBText86: TDBText;
    DBText87: TDBText;
    DBText88: TDBText;
    Label471: TLabel;
    Label472: TLabel;
    DBText89: TDBText;
    Label475: TLabel;
    GroupBox89: TGroupBox;
    DBText90: TDBText;
    Label476: TLabel;
    Label477: TLabel;
    Label479: TLabel;
    GroupBox90: TGroupBox;
    GroupBox91: TGroupBox;
    DBGrid45: TDBGrid;
    SpeedButton56: TSpeedButton;
    DBGrid46: TDBGrid;
    SpeedButton58: TSpeedButton;
    VerProdutosAcabadosProducao: TMenuItem;
    VerProdutosMatInsumosProducao: TMenuItem;
    RecalcularCustoAcabado: TMenuItem;
    Panel153: TPanel;
    SpeedButton61: TSpeedButton;
    RecalcularEstoqueEstDiario: TMenuItem;
    lbAcabGrupo: TLabel;
    lbAcabCod: TLabel;
    lbAcabNum: TLabel;
    lbInsGrupo: TLabel;
    lbInsCod: TLabel;
    lbInsNum: TLabel;
    Label534: TLabel;
    GroupBox92: TGroupBox;
    Label535: TLabel;
    lbTextoObsEtiqSimples: TLabel;
    lbTextoObsEtiq: TLabel;
    MemoObsEtiqSimples: TMemo;
    MemoObsEtiq: TMemo;
    pnObsEtiq: TPanel;
    CheckBox25: TCheckBox;
    ckObsEtiq: TCheckBox;
    lbObsEtiq: TLabel;
    EdObsEtiq: TEdit;
    lbInfObsEtiq: TLabel;
    TabSheet18: TTabSheet;
    Panel155: TPanel;
    Label536: TLabel;
    DBComboBoxUnidadeConvSaida: TDBComboBox;
    Label539: TLabel;
    DBComboBoxDisVendaSaida: TDBComboBox;
    Label540: TLabel;
    DBComboBoxPadraoVndSaida: TDBComboBox;
    Panel156: TPanel;
    BitBtn137: TBitBtn;
    BitBtn138: TBitBtn;
    TabSheet19: TTabSheet;
    Panel157: TPanel;
    RadioGroup2: TRadioGroup;
    Panel158: TPanel;
    BitBtn139: TBitBtn;
    BitBtn140: TBitBtn;
    DBComboBoxUnidadeConv: TDBComboBox;
    DBComboBox23: TDBComboBox;
    DBComboBox24: TDBComboBox;
    btUnidade: TSpeedButton;
    tsUnidade: TTabSheet;
    pnUnidade: TPanel;
    Label541: TLabel;
    Label542: TLabel;
    Label543: TLabel;
    EdSiglaUnidade: TEdit;
    EdDescricaoUnidade: TEdit;
    RadioGroupFracionadoUnidade: TRadioGroup;
    Panel159: TPanel;
    BitBtn141: TBitBtn;
    BitBtn142: TBitBtn;
    btUnidadeSimpl: TSpeedButton;
    LabelInfConversaoSaida: TLabel;
    BitBtn143: TBitBtn;
    btUnidadeConversaoVenda: TSpeedButton;
    btUnidadeConversao: TSpeedButton;
    Label544: TLabel;
    ComboBoxUnidadePrincSaida: TComboBox;
    EditMoedaFatorPrincSaida: TEditMoeda;
    EditMoedaFatorConvSaida: TEditMoeda;
    Label537: TLabel;
    Label226: TLabel;
    EditMoedaFatorPrinc: TEditMoeda;
    ComboBoxUnidadePrinc: TComboBox;
    Label538: TLabel;
    EditMoedaFatorConv: TEditMoeda;
    LabelInfConversao: TLabel;
    Label545: TLabel;
    DBEditCodigoEanSaida: TDBEdit;
    tabOpfiscal: TTabControl;
    pnOpfiscalBtns: TPanel;
    opfiscalViewBtn: TSpeedButton;
    opfiscalEditBtn: TSpeedButton;
    pnOpfiscal: TPanel;
    gridOpFiscal: TDBGrid;
    tsKitsProd: TTabSheet;
    GroupBox93: TGroupBox;
    DBText83: TDBText;
    DBText84: TDBText;
    DBText85: TDBText;
    Label39: TLabel;
    Label52: TLabel;
    DBText91: TDBText;
    Label308: TLabel;
    ScrollBoxKitsProd: TScrollBox;
    tsS_KitsProd: TTabSheet;
    pnS_KitsProd: TPanel;
    scrollS_KitsProd: TScrollBox;
    btnSKitsProd: TSpeedButton;
    groupKitsProd: TGroupBox;
    DBGridKitsProd: TDBGrid;
    Panel57: TPanel;
    BitBtn144: TBitBtn;
    BitBtn145: TBitBtn;
    BitBtn146: TBitBtn;
    BitBtn147: TBitBtn;
    BitBtn148: TBitBtn;
    Panel160: TPanel;
    btMarcaSelecaoEt: TSpeedButton;
    ck1EtiqCadProd: TCheckBox;
    SpeedButtonSelTodosRapida: TSpeedButton;
    SpeedButtonDesmarcarTodosRapida: TSpeedButton;
    SpeedButtonSelTodosEster: TSpeedButton;
    SpeedButtonDesmarcarTodosEster: TSpeedButton;
    ckEstoqueDisponivel: TCheckBox;
    AlterarQtdeCustoNFProd: TMenuItem;
    Splitter13: TSplitter;
    Splitter14: TSplitter;
    SpeedButton62: TSpeedButton;
    SpeedButton63: TSpeedButton;
    tsObsMaxmized: TTabSheet;
    ScrollBox20: TScrollBox;
    pnObsMaxmized2: TPanel;
    Label546: TLabel;
    Panel162: TPanel;
    BitBtn150: TBitBtn;
    DBMemo9: TDBMemo;
    pnObsMaxmized: TPanel;
    Label309: TLabel;
    Panel161: TPanel;
    BitBtn149: TBitBtn;
    DBMemo6: TDBMemo;
    SpeedButton64: TSpeedButton;
    SpeedButton65: TSpeedButton;
    btHabPercentProdPromocao: TSpeedButton;
    btHabMarkupProdPromocao: TSpeedButton;
    btHabMarkupProdLocSetorCid: TSpeedButton;
    Label547: TLabel;
    EditHw10: TEditHw;
    Label548: TLabel;
    btHabPercentProdLocSetCid: TSpeedButton;
    Label214: TLabel;
    Label217: TLabel;
    GroupBox94: TGroupBox;
    DBText92: TDBText;
    DBText93: TDBText;
    DBText94: TDBText;
    Label213: TLabel;
    Label219: TLabel;
    DBText95: TDBText;
    Label383: TLabel;
    Label384: TLabel;
    DBText96: TDBText;
    DBText97: TDBText;
    Label549: TLabel;
    GroupBox95: TGroupBox;
    DBText98: TDBText;
    DBText99: TDBText;
    DBText100: TDBText;
    Label550: TLabel;
    Label551: TLabel;
    DBText101: TDBText;
    Label552: TLabel;
    Label553: TLabel;
    DBText102: TDBText;
    DBText103: TDBText;
    Label554: TLabel;
    Panel88: TPanel;
    Label491: TLabel;
    SpeedButton55: TSpeedButton;
    BitBtn89: TBitBtn;
    BitBtn90: TBitBtn;
    BitBtn130: TBitBtn;
    DBComboBox15: TDBComboBox;
    MenuLateralExibirObservacao: TMenuItem;
    MenuLateralExibirDetalhesCaractersticas: TMenuItem;
    MenuLateralExibirCodigos: TMenuItem;
    MenuLateralExibirEstoquePorEmpresa: TMenuItem;
    MenuLateralExibirPrecosVendaPorEmpresa: TMenuItem;
    N1: TMenuItem;
    pnObservacao: TGroupBox;
    DBMemoObs: TDBMemo;
    SplitterObservacaoBottom: TSplitter;
    pnCaracteristica: TGroupBox;
    DBMemoDetCarac: TDBMemo;
    SplitterCaracteristicaBottom: TSplitter;
    pnEstoqueEmpresas: TGroupBox;
    pnEstoqueEmpresasClient: TPanel;
    DBGridEstoqueEmpresas: TDBGrid;
    pnTotEstEmp: TPanel;
    lbQtdeEstEmpresas: TLabel;
    pnEstoqueEmpresasTop: TPanel;
    ckFiltrarEmpresa: TCheckBox;
    GroupBoxEstoqueEmpresas: TGroupBox;
    ScrollBoxEstoqueEmpresas: TScrollBox;
    SplitterEstoqueEmpresasBottom: TSplitter;
    pnPrecosVndPorEmpresa: TGroupBox;
    GroupBoxPrecosVndPorEmpresa: TGroupBox;
    ScrollBoxPrecosVndPorEmpresa: TScrollBox;
    DBGridPrecosVndPorEmpresa: TDBGrid;
    SplitterPrecosVndPorEmpresaBottom: TSplitter;
    pnQtdeVndMes: TGroupBox;
    DBGridQtdeVndMes: TDBGrid;
    tsImagemProd: TTabSheet;
    pnImagemProd: TPanel;
    Panel164: TPanel;
    btImagemProdFechar: TBitBtn;
    Label555: TLabel;
    Label556: TLabel;
    MemoEndereco: TMemo;
    MemoUrl: TMemo;
    Label557: TLabel;
    MemoErro: TMemo;
    Label558: TLabel;
    EditDataCadImg: TEdit;
    Label559: TLabel;
    EditDataErroImg: TEdit;
    tsCashback: TTabSheet;
    tsS_Cashback: TTabSheet;
    pnS_Cashback: TPanel;
    scrollS_Cashback: TScrollBox;
    btnSCashback: TSpeedButton;
    SpeedButtonCashback: TSpeedButton;
    ScrollBox21: TScrollBox;
    pn_Cashback: TPanel;
    GroupBoxCashback: TGroupBox;
    Label564: TLabel;
    Label565: TLabel;
    DBEdit17: TDBEdit;
    DBEdit19: TDBEdit;
    GroupBox96: TGroupBox;
    DBText104: TDBText;
    DBText105: TDBText;
    Label560: TLabel;
    Label561: TLabel;
    DBText106: TDBText;
    Label562: TLabel;
    DBText107: TDBText;
    pn_CashbackButtom: TPanel;
    BitBtn151: TBitBtn;
    BitBtn152: TBitBtn;
    Panel165: TPanel;
    Panel166: TPanel;
    Label563: TLabel;
    pnCashback: TPanel;
    Label566: TLabel;
    Label567: TLabel;
    EdPercComissaoCashback: TEditHw;
    EdDiasVencCashback: TEditHw;
    ckCashback: TCheckBox;
    SpeedButtonAlternarCadastro: TSpeedButton;
    SpeedButtonAlternarCadastro2: TSpeedButton;
    lbDelPromocaoProd1Op3: TLabel;
    lbDelPromocaoProd2Op7: TLabel;
    lbDelTabelaProd1Op3: TLabel;
    lbDelTabelaProd2Op7: TLabel;
    MarcarTodasPecosClick: TMenuItem;
    DesmarcarTodosPrecosClick: TMenuItem;
    SpeedButton68: TSpeedButton;
    QRLabel184: TQRLabel;
    QRLabel185: TQRLabel;
    QRDBText92: TQRDBText;
    QRDBText93: TQRDBText;
    QRDBText94: TQRDBText;
    QRDBText95: TQRDBText;
    Label273: TLabel;
    DBComboBox17: TDBComboBox;
    btHabDebCredTab: TSpeedButton;
    DBText108: TDBText;
    DBText109: TDBText;
    Label568: TLabel;
    DBComboBox18: TDBComboBox;
    DBText110: TDBText;
    Label569: TLabel;
    DBText111: TDBText;
    btHabDebCredProm: TSpeedButton;
    Label240: TLabel;
    btHabDebCredTabPreco: TSpeedButton;
    ComboBox20: TComboBox;
    Label570: TLabel;
    DBComboBox20: TDBComboBox;
    btHabDebCredPrecoQtde: TSpeedButton;
    PopupMenu10: TPopupMenu;
    MarcarTodasPecosQtde: TMenuItem;
    DesmarcarTodosPrecosQtde: TMenuItem;
    ApagartodasPrecosQtde: TMenuItem;
    Label252: TLabel;
    DBLookupComboBox26: TDBLookupComboBox;
    pnLancDebCred: TPanel;
    lbLancDebCred: TLabel;
    ckLancDebCred: TCheckBox;
    cbLancDebCred: TComboBox;
    Label256: TLabel;
    DBComboBox21: TDBComboBox;
    pnPercDebCredDev: TPanel;
    ckPercDebCredDev: TCheckBox;
    lbPercDebCredDev: TLabel;
    EdPercDebCredDev: TEditHw;
    pnCodigo: TGroupBox;
    GroupBoxCodigo: TGroupBox;
    ScrollBoxCodigo: TScrollBox;
    SplitterCodigoEmpresasBottom: TSplitter;
    DBGridCodigo: TDBGrid;
    PopupMenuCodigoPorEmpresa: TPopupMenu;
    ConfigurarcolunasCodigoPorEmpresa: TMenuItem;
    ResetarConfiguraesdecolunasCodigoPorEmpresa: TMenuItem;
    SalvardadosnoExcelCodigoPorEmpresa: TMenuItem;
    ReajustarLarguradascolunasCodigoPorEmpresa: TMenuItem;
    CopiarparareadetransfernciaCodigoPorEmpresa: TMenuItem;
    SomarvaloresdacolunaCodigoPorEmpresa: TMenuItem;
    pnEstoqueMinimoCor: TPanel;
    BitBtnAprovInsumoOutroProd: TBitBtn;
    tsInsumosOutrosProd: TTabSheet;
    pnInsumosOutrosProd: TPanel;
    DBGridInsumosOutrosProd: TDBGrid;
    pnInsumosOutrosProdBottom: TPanel;
    BitBtnInsumosOutrosProdOK: TBitBtn;
    BitBtnInsumosOutrosProdCancel: TBitBtn;
    BitBtn_Alterar_Despesa: TBitBtn;
    btSelectAllInsumo: TSpeedButton;
    btUnSelectAllInsumo: TSpeedButton;
    pnCSTPisCofinsE: TPanel;
    lbCSTPisCofinsE: TLabel;
    EdCSTPisCofinsEntrada: TEdit;
    ckCSTPisCofinsE: TCheckBox;
    Label158: TLabel;
    DBComboBox22: TDBComboBox;
    Label571: TLabel;
    DBLookupComboBox27: TDBLookupComboBox;
    pnVendaOnline: TPanel;
    lbVendaOnline: TLabel;
    ckVendaOnline: TCheckBox;
    cbVendaOnline: TComboBox;
    procedure ckVendaOnlineClick(Sender: TObject);
    procedure EdCSTPisCofinsEntradaExit(Sender: TObject);
    procedure ckCSTPisCofinsEClick(Sender: TObject);
    procedure btUnSelectAllInsumoClick(Sender: TObject);
    procedure btSelectAllInsumoClick(Sender: TObject);
    procedure DBGrid22CellClick(Column: TColumn);
    procedure DBGrid22DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn_Alterar_DespesaClick(Sender: TObject);
    procedure DBGridInsumosOutrosProdDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BitBtnInsumosOutrosProdCancelClick(Sender: TObject);
    procedure BitBtnInsumosOutrosProdOKClick(Sender: TObject);
    procedure BitBtnAprovInsumoOutroProdClick(Sender: TObject);
    procedure ScrollBoxCodigoEnter(Sender: TObject);
    procedure SomarvaloresdacolunaCodigoPorEmpresaClick(Sender: TObject);
    procedure CopiarparareadetransfernciaCodigoPorEmpresaClick(Sender: TObject);
    procedure ReajustarLarguradascolunasCodigoPorEmpresaClick(Sender: TObject);
    procedure SalvardadosnoExcelCodigoPorEmpresaClick(Sender: TObject);
    procedure ResetarConfiguraesdecolunasCodigoPorEmpresaClick(Sender: TObject);
    procedure ConfigurarcolunasCodigoPorEmpresaClick(Sender: TObject);
    procedure DBGridCodigoTitleClick(Column: TColumn);
    procedure DBGridCodigoColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure ckPercDebCredDevClick(Sender: TObject);
    procedure ckLancDebCredClick(Sender: TObject);
    procedure DBComboBox21Exit(Sender: TObject);
    procedure ApagartodasPrecosQtdeClick(Sender: TObject);
    procedure DesmarcarTodosPrecosQtdeClick(Sender: TObject);
    procedure MarcarTodasPecosQtdeClick(Sender: TObject);
    procedure DBGrid37CellClick(Column: TColumn);
    procedure DBGrid37DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btHabDebCredPrecoQtdeClick(Sender: TObject);
    procedure btHabDebCredTabPrecoClick(Sender: TObject);
    procedure btHabDebCredTabClick(Sender: TObject);
    procedure btHabDebCredPromClick(Sender: TObject);
    procedure SpeedButton68Click(Sender: TObject);
    procedure MarcarTodasPecosClickClick(Sender: TObject);
    procedure DesmarcarTodosPrecosClickClick(Sender: TObject);
    procedure DBGrid23CellClick(Column: TColumn);
    procedure DBGrid23DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure LabelSeq_Click(Sender: TObject);
    procedure CheckCadSeq_Click(Sender: TObject);
    procedure SpeedButtonAlternarCadastro2Click(Sender: TObject);
    procedure SpeedButtonAlternarCadastroClick(Sender: TObject);
    procedure EdDiasVencCashbackExit(Sender: TObject);
    procedure ckCashbackClick(Sender: TObject);
    procedure BitBtn151Click(Sender: TObject);
    procedure BitBtn152Click(Sender: TObject);
    procedure pn_CashbackEnter(Sender: TObject);
    procedure SpeedButtonCashbackClick(Sender: TObject);
    procedure btnSCashbackClick(Sender: TObject);
    procedure btImagemProdFecharClick(Sender: TObject);
    procedure pnImagemProdEnter(Sender: TObject);
    procedure MenuLateralExibirCodigosClick(Sender: TObject);
    procedure MenuLateralExibirPrecosVendaPorEmpresaClick(Sender: TObject);
    procedure MenuLateralExibirEstoquePorEmpresaClick(Sender: TObject);
    procedure MenuLateralExibirDetalhesCaractersticasClick(Sender: TObject);
    procedure MenuLateralExibirObservacaoClick(Sender: TObject);
    procedure SplitterObservacaoBottomMoved(Sender: TObject);
    procedure EditHw10Exit(Sender: TObject);
    procedure btHabPercentProdLocSetCidClick(Sender: TObject);
    procedure btHabMarkupProdLocSetorCidClick(Sender: TObject);
    procedure btHabMarkupProdPromocaoClick(Sender: TObject);
    procedure btHabPercentProdPromocaoClick(Sender: TObject);
    procedure DBGrid31KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridFretePesoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid27KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid26KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridKitsProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid22KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton63Click(Sender: TObject);
    procedure SpeedButton62Click(Sender: TObject);
    procedure AlterarQtdeCustoNFProdClick(Sender: TObject);
    procedure ckEstoqueDisponivelClick(Sender: TObject);
    procedure SpeedButtonDesmarcarTodosEsterClick(Sender: TObject);
    procedure SpeedButtonSelTodosEsterClick(Sender: TObject);
    procedure SpeedButtonDesmarcarTodosRapidaClick(Sender: TObject);
    procedure SpeedButtonSelTodosRapidaClick(Sender: TObject);
    procedure btMarcaSelecaoEtClick(Sender: TObject);
    procedure btHistPrecoClick(Sender: TObject);
    procedure DBGridKitsProdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnSKitsProdClick(Sender: TObject);
    procedure BitBtn148Click(Sender: TObject);
    procedure BitBtn147Click(Sender: TObject);
    procedure BitBtn145Click(Sender: TObject);
    procedure BitBtn146Click(Sender: TObject);
    procedure BitBtn144Click(Sender: TObject);
    procedure opfiscalViewBtnClick(Sender: TObject);
    procedure opfiscalEditBtnClick(Sender: TObject);
    procedure tabOpfiscalChange(Sender: TObject);
    procedure DBComboBoxUnidadeConvExit(Sender: TObject);
    procedure ComboBoxUnidadePrincExit(Sender: TObject);
    procedure EditMoedaFatorConvExit(Sender: TObject);
    procedure EditMoedaFatorPrincExit(Sender: TObject);
    procedure ComboBoxUnidadePrincSaidaExit(Sender: TObject);
    procedure EditMoedaFatorConvSaidaExit(Sender: TObject);
    procedure EditMoedaFatorPrincSaidaExit(Sender: TObject);
    procedure btUnidadeConversaoClick(Sender: TObject);
    procedure DBEdit39Change(Sender: TObject);
    procedure DBComboBox18Change(Sender: TObject);
    procedure DBComboBoxUnidadeConvSaidaChange(Sender: TObject);
    procedure DBEdit39Exit(Sender: TObject);
    procedure DBComboBox18Exit(Sender: TObject);
    procedure DBComboBoxUnidadeConvSaidaExit(Sender: TObject);
    procedure Panel56Enter(Sender: TObject);
    procedure Panel155Enter(Sender: TObject);
    procedure BitBtn143Click(Sender: TObject);
    procedure BitBtn141Click(Sender: TObject);
    procedure BitBtn142Click(Sender: TObject);
    procedure btUnidadeClick(Sender: TObject);
    procedure BitBtn138Click(Sender: TObject);
    procedure BitBtn137Click(Sender: TObject);
    procedure BitBtn140Click(Sender: TObject);
    procedure BitBtn139Click(Sender: TObject);
    procedure EdObsEtiqChange(Sender: TObject);
    procedure ckObsEtiqClick(Sender: TObject);
    procedure MemoObsEtiqChange(Sender: TObject);
    procedure MemoObsEtiqSimplesChange(Sender: TObject);
    procedure RecalcularEstoqueEstDiarioClick(Sender: TObject);
    procedure SpeedButton61Click(Sender: TObject);
    procedure RecalcularCustoAcabadoClick(Sender: TObject);
    procedure VerProdutosMatInsumosProducaoClick(Sender: TObject);
    procedure VerProdutosAcabadosProducaoClick(Sender: TObject);
    procedure SpeedButton58Click(Sender: TObject);
    procedure DBGrid46DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid45DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton56Click(Sender: TObject);
    procedure BitBtnProdutosMatInsumosSairClick(Sender: TObject);
    procedure BitBtnProdutosMatInsumosCancelarClick(Sender: TObject);
    procedure BitBtnProdutosMatInsumosOKClick(Sender: TObject);
    procedure VerProdutosMatInsumosClick(Sender: TObject);
    procedure BitBtnProdutosAcabadosSairClick(Sender: TObject);
    procedure BitBtnProdutosAcabadosCancelarClick(Sender: TObject);
    procedure BitBtnProdutosAcabadosOKClick(Sender: TObject);
    procedure VerProdutosAcabadosClick(Sender: TObject);
    procedure AlterarQtdeNFProdClick(Sender: TObject);
    procedure SpeedButtonSincronizarOutrasEmpECommerceClick(Sender: TObject);
    procedure ckEcommerceClick(Sender: TObject);
    procedure btCancelarDelTabelaProdClick(Sender: TObject);
    procedure btOKDelTabelaProdClick(Sender: TObject);
    procedure btCancelarDelPromocaoProdClick(Sender: TObject);
    procedure btOKDelPromocaoProdClick(Sender: TObject);
    procedure ckUmEtiqCadaProdClick(Sender: TObject);
    procedure btHabMarkupProdTabPrecoClick(Sender: TObject);
    procedure btHabPercentProdTabPrecoClick(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure btHabMarkupProdQtdeClick(Sender: TObject);
    procedure btHabPercentProdQtdeClick(Sender: TObject);
    procedure SpeedButtonComercioAbertoClick(Sender: TObject);
    procedure SpeedButtonECommerceClick(Sender: TObject);
    procedure btUnSelectAllEtiqClick(Sender: TObject);
    procedure btSelectAllEtiqClick(Sender: TObject);
    procedure DesmarcatodosprodutosEtiTerRapidaClick(Sender: TObject);
    procedure SelecionartodosprodutosEtiTerRapidaClick(Sender: TObject);
    procedure DesmarcatodosprodutosEtiqEsterClick(Sender: TObject);
    procedure SelecionartodosprodutosEtiqEsterClick(Sender: TObject);
    procedure btUnSelectAllEtiqMarcadasClick(Sender: TObject);
    procedure btSelectAllEtiqMarcadasClick(Sender: TObject);
    procedure btUnSelectAllEtiqEsterClick(Sender: TObject);
    procedure btSelectAllEtiqEsterClick(Sender: TObject);
    procedure DBGrid17CellClick(Column: TColumn);
    procedure DBGrid17DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid19DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btUnSelectAllEtiqTerRapidaClick(Sender: TObject);
    procedure btSelectAllEtiqterRapidaClick(Sender: TObject);
    procedure DBGrid19CellClick(Column: TColumn);
    procedure DBGrid15CellClick(Column: TColumn);
    procedure BitBtn136Click(Sender: TObject);
    procedure ckPercReducaoClick(Sender: TObject);
    procedure btPrecosUnificadosUndoClick(Sender: TObject);
    procedure DBEdit33Exit(Sender: TObject);
    procedure EditHw1Exit(Sender: TObject);
    procedure edMarukpMargemExit(Sender: TObject);
    procedure btn_historicoPrecosClick(Sender: TObject);
    procedure btn_alterarPrecosClick(Sender: TObject);
    procedure DBEdit219Exit(Sender: TObject);
    procedure cbOrdemKeyPress(Sender: TObject; var Key: Char);
    procedure cbGrupoOrdemKeyPress(Sender: TObject; var Key: Char);
    procedure ckPermOpcaoMarcadasClick(Sender: TObject);
    procedure SpeedButton55Click(Sender: TObject);
    procedure DBGrid13CellClick(Column: TColumn);
    procedure btUnSelectAllGradeClick(Sender: TObject);
    procedure btSelectAllGradeClick(Sender: TObject);
    procedure DBGrid13DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure CadastroMateriasPrimasCancelClick(Sender: TObject);
    procedure btCadastroMateriasPrimasOKClick(Sender: TObject);
    procedure btCadastroResultadoFinalCancClick(Sender: TObject);
    procedure pnCadastroMateriasPrimasEnter(Sender: TObject);
    procedure pnCadastroResultadoFinalEnter(Sender: TObject);
    procedure btCadastroResultadoFinalOKClick(Sender: TObject);
    procedure DBComboBox15Exit(Sender: TObject);
    procedure btnSFretePesoClick(Sender: TObject);
    procedure btFretePesoOKClick(Sender: TObject);
    procedure btFretePesoCancelClick(Sender: TObject);
    procedure btFretePesoProcuraClienteClick(Sender: TObject);
    procedure BitBtn131Click(Sender: TObject);
    procedure BitBtn135Click(Sender: TObject);
    procedure BitBtn134Click(Sender: TObject);
    procedure DBLookupComboBox25Exit(Sender: TObject);
    procedure DBComboBox14Exit(Sender: TObject);
    procedure DBEditTituloPagExit(Sender: TObject);
    procedure DBEditURLAcessoExit(Sender: TObject);
    procedure DBEditDescrECExit(Sender: TObject);
    procedure DBLookupComboBox23Exit(Sender: TObject);
    procedure BitBtn130Click(Sender: TObject);
    procedure DBEdit148Exit(Sender: TObject);
    procedure DBEdit211Exit(Sender: TObject);
    procedure DBGrid25DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid28DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ckComissaoFaixaDescontoClick(Sender: TObject);
    procedure DBLComissaoFaixaDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLComissaoFaixaDescExit(Sender: TObject);
    procedure EdComissaoFaixaDescKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdComissaoFaixaDescExit(Sender: TObject);
    procedure SomarvaloresdacolunaPrecosVndPorEmpresaClick(Sender: TObject);
    procedure SomarvaloresdacolunaEstoquePorEmpresaClick(Sender: TObject);
    procedure CopiarparareadetransfernciaPrecosVndPorEmpresaClick(
      Sender: TObject);
    procedure CopiarparareadetransfernciaEstoquePorEmpresaClick(
      Sender: TObject);
    procedure ReajustarLarguradascolunasPrecosVndPorEmpresaClick(
      Sender: TObject);
    procedure ReajustarLarguradascolunas1Click(Sender: TObject);
    procedure SalvardadosnoExcelPrecosVndPorEmpresaClick(Sender: TObject);
    procedure SalvardadosnoExcelEstoquePorEmpresaClick(Sender: TObject);
    procedure ResetarConfiguraesdecolunasPrecosVndPorEmpresaClick(
      Sender: TObject);
    procedure ResetarConfiguraesdecolunasEstoquePorEmpresaClick(
      Sender: TObject);
    procedure ConfigurarcolunasPrecosVndPorEmpresaClick(Sender: TObject);
    procedure ConfigurarcolunasEstoquePorEmpresaClick(Sender: TObject);
    procedure DBGridPrecosVndPorEmpresaTitleClick(Column: TColumn);
    procedure DBGridEstoqueEmpresasTitleClick(Column: TColumn);
    procedure DBGridPrecosVndPorEmpresaColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure DBGridEstoqueEmpresasColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure ScrollBoxPrecosVndPorEmpresaEnter(Sender: TObject);
    procedure ScrollBoxEstoqueEmpresasEnter(Sender: TObject);
    procedure Somarvaloresdacoluna1Click(Sender: TObject);
    procedure DBGridPrecosVndPorEmpresaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure ckFiltrarEmpresaClick(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure ckMenuLateralClick(Sender: TObject);
    procedure ckLixeira2Click(Sender: TObject);
    procedure btSairEtiTermicaClick(Sender: TObject);
    procedure SpeedButtonSelTodosTabPrecoClick(Sender: TObject);
    procedure SpeedButtonDescTodosTabPrecoClick(Sender: TObject);
    procedure SpeedButtonSelTodosPromocaoClick(Sender: TObject);
    procedure SpeedButtonDescTodosPromocaoClick(Sender: TObject);
    procedure SpeedButtonSelTodosSubGrupoClick(Sender: TObject);
    procedure SpeedButtonDescTodosSubGrupoClick(Sender: TObject);
    procedure SpeedButtonDescTodosGrupoClick(Sender: TObject);
    procedure SpeedButtonSelTodosGrupoClick(Sender: TObject);
    procedure ckLixeiraClick(Sender: TObject);
    procedure GroupBox12Exit(Sender: TObject);
    procedure BitBtnOpcoesAlterarGrupoCancelClick(Sender: TObject);
    procedure BitBtnOpcoesAlterarGrupoOKClick(Sender: TObject);
    procedure pageCadSimplesChange(Sender: TObject);
    procedure PageControl3Change(Sender: TObject);
    procedure SpeedButtonAlterarHtmlCAClick(Sender: TObject);
    procedure pnOKDadosComercioAbertoClick(Sender: TObject);
    procedure pnCancDadosComercioAbertoClick(Sender: TObject);
    procedure SpeedButtonEnvComercioAbertoClick(Sender: TObject);
    procedure pnAlterEstGradeCAEnter(Sender: TObject);
    procedure pnAlterEstProdCAEnter(Sender: TObject);
    procedure btCancAlterEstCAGradeClick(Sender: TObject);
    procedure btOKAlterEstCAGradeClick(Sender: TObject);
    procedure btCancAlterEstCAClick(Sender: TObject);
    procedure btOKAlterEstCAClick(Sender: TObject);
    procedure sbAvancarCAClick(Sender: TObject);
    procedure sbVoltarCAClick(Sender: TObject);
    procedure TreeViewGradeCA_DBDblClick(Sender: TObject);
    procedure TreeViewGradeCADblClick(Sender: TObject);
    procedure pnDadosCAEnter(Sender: TObject);
    procedure btAlterEstCAGradeClick(Sender: TObject);
    procedure btAlterEstCAClick(Sender: TObject);
    procedure btnAlterarDadosCAClick(Sender: TObject);
    procedure btnCancAlterarDadosCAClick(Sender: TObject);
    procedure btnOKAlterarDadosCAClick(Sender: TObject);
    procedure btnSComercioAbertoClick(Sender: TObject);
    procedure ckTipoItemProdutoClick(Sender: TObject);
    procedure ckAloc2Click(Sender: TObject);
    procedure ckAloc1Click(Sender: TObject);
    procedure ckAplicacaoRefClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EdCESTExit(Sender: TObject);
    procedure SpeedButtonAlterarProduto2Click(Sender: TObject);
    procedure ckComissaoGerenteClick(Sender: TObject);
    procedure ckComissaoProdutoClick(Sender: TObject);
    procedure ckAlterarVlCupomClick(Sender: TObject);
    procedure ckAlterarDescrCupomClick(Sender: TObject);
    procedure ckClasseClick(Sender: TObject);
    procedure ckTipoProdutoClick(Sender: TObject);
    procedure ckPermDescClick(Sender: TObject);
    procedure ckConsumoClick(Sender: TObject);
    procedure ckPercAjustePrec90Click(Sender: TObject);
    procedure ckPercAjustePrec60Click(Sender: TObject);
    procedure ckPercAjustePrec30Click(Sender: TObject);
    procedure EdPercMargemMinAtacadoExit(Sender: TObject);
    procedure EdPercMargemMinVarejoExit(Sender: TObject);
    procedure ckPercMargemMinAtacadoClick(Sender: TObject);
    procedure ckPercMargemMinVarejoClick(Sender: TObject);
    procedure EdPerc90Exit(Sender: TObject);
    procedure EdPerc60Exit(Sender: TObject);
    procedure EdPercAtacExit(Sender: TObject);
    procedure EdPerc30Exit(Sender: TObject);
    procedure EdPercTabExit(Sender: TObject);
    procedure EdCodCFOPInterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCodCFOPKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedBDesmarcarTodosClick(Sender: TObject);
    procedure SpeedBSelTodosClick(Sender: TObject);
    procedure EdCEST1Change(Sender: TObject);
    procedure EdCodNCMChange(Sender: TObject);
    procedure EdCodNCMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCodNCMExit(Sender: TObject);
    procedure EdCodCSOSNChange(Sender: TObject);
    procedure EdCodEnqIPIChange(Sender: TObject);
    procedure EdNatReceitaChange(Sender: TObject);
    procedure EdCSTEntradaChange(Sender: TObject);
    procedure EdCSTPisCofinsSaidaChange(Sender: TObject);
    procedure EdCSTIPIChange(Sender: TObject);
    procedure EdCodCSTChange(Sender: TObject);
    procedure ckDescMaxClick(Sender: TObject);
    procedure ckPerc90Click(Sender: TObject);
    procedure ckPerc60Click(Sender: TObject);
    procedure ckPerc30Click(Sender: TObject);
    procedure ckPercAtacClick(Sender: TObject);
    procedure ckPercTabClick(Sender: TObject);
    procedure ckCodEnqIPIClick(Sender: TObject);
    procedure ckAliqIPIClick(Sender: TObject);
    procedure ckCstIPIClick(Sender: TObject);
    procedure ckAliqPisCofinsDifClick(Sender: TObject);
    procedure ckIsentoClick(Sender: TObject);
    procedure ckAliqCredPisCofinsClick(Sender: TObject);
    procedure ckNatRecClick(Sender: TObject);
    procedure ckCSTPisCofinsSClick(Sender: TObject);
    procedure ckAliqICMSClick(Sender: TObject);
    procedure ckCSONClick(Sender: TObject);
    procedure ckCSTClick(Sender: TObject);
    procedure ckCESTClick(Sender: TObject);
    procedure ckNCMClick(Sender: TObject);
    procedure ckNatOPClick(Sender: TObject);
    procedure ckPerfilClick(Sender: TObject);
    procedure ckMarcaClick(Sender: TObject);
    procedure ckSubGrupoClick(Sender: TObject);
    procedure ckGrupoClick(Sender: TObject);
    procedure SpeedBPerfilClick(Sender: TObject);
    procedure SpeedBCESTClick(Sender: TObject);
    procedure EdCSTPisCofinsSaidaExit(Sender: TObject);
    procedure EdPerfilProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCodPerfilProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLMarcaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCodMarcaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLSubGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCodSubGrupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLGrupoProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCodGrupoProdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCodPerfilProdExit(Sender: TObject);
    procedure DBLMarcaExit(Sender: TObject);
    procedure EdCodMarcaExit(Sender: TObject);
    procedure DBLSubGrupoExit(Sender: TObject);
    procedure EdCodSubGrupoExit(Sender: TObject);
    procedure DBLGrupoProdExit(Sender: TObject);
    procedure EdCodGrupoProdExit(Sender: TObject);
    procedure btSalvarProdLoteClick(Sender: TObject);
    procedure btnCancProdLoteClick(Sender: TObject);
    procedure SpeedButtonAlterarProdutoClick(Sender: TObject);
    procedure btVoltarDadosProdClick(Sender: TObject);
    procedure SpeedButtonAlterDadosClick(Sender: TObject);
    procedure DBEdit133Exit(Sender: TObject);
    procedure DBGrid40DblClick(Sender: TObject);
    procedure DBGrid40KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure QuickRepProdutosPrecoQtdePreview(Sender: TObject);
    procedure SpeedButtonAlterarEst2Click(Sender: TObject);
    procedure SpeedButtonAlterarEstClick(Sender: TObject);
    procedure bt_alt_est_maxClick(Sender: TObject);
    procedure bt_consulta_cest2Click(Sender: TObject);
    procedure DBEdit21Exit(Sender: TObject);
    procedure DBEdit20Exit(Sender: TObject);
    procedure bt_alt_est_minClick(Sender: TObject);
    procedure btCancAlterEstECGradeClick(Sender: TObject);
    procedure btCancAlterEstECClick(Sender: TObject);
    procedure sp_dados_nfe_dados_ult_entradaClick(Sender: TObject);
    procedure Verificarreplicaointernapendente1Click(Sender: TObject);
    procedure bt_outros_prodClick(Sender: TObject);
    procedure pnAlterEstProdECEnter(Sender: TObject);
    procedure pnAlterEstGradeECEnter(Sender: TObject);
    procedure btOKAlterEstECGradeClick(Sender: TObject);
    procedure btAlterEstECGradeClick(Sender: TObject);
    procedure btOKAlterEstECClick(Sender: TObject);
    procedure TreeViewGradeEC_DBDblClick(Sender: TObject);
    procedure TreeViewGradeECDblClick(Sender: TObject);
    procedure DBEdit212KeyPress(Sender: TObject; var Key: Char);
    procedure pnDadosECEnter(Sender: TObject);
    procedure btAlterEstECClick(Sender: TObject);
    procedure BitBtn133Click(Sender: TObject);
    procedure BitBtn132Click(Sender: TObject);
    procedure btnSECommerceClick(Sender: TObject);
    procedure TreeViewCatDBDblClick(Sender: TObject);
    procedure TreeViewCatDblClick(Sender: TObject);
    procedure sbVoltarECClick(Sender: TObject);
    procedure sbAvancarECClick(Sender: TObject);
    procedure SpeedButtonAlterarHtmlECClick(Sender: TObject);
    procedure btnCancAlterarDadosECClick(Sender: TObject);
    procedure btnOKAlterarDadosECClick(Sender: TObject);
    procedure btnAlterarDadosECClick(Sender: TObject);
    procedure DesmarcatodosprodutosTempClick(Sender: TObject);
    procedure SelecionartodosprodutosTempClick(Sender: TObject);
    procedure DBGrid15DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit188Exit(Sender: TObject);
    procedure ckNAlterouEstClick(Sender: TObject);
    procedure ckAlterouEstClick(Sender: TObject);
    procedure ckRequisicaoClick(Sender: TObject);
    procedure DBGrid39DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid39TitleClick(Column: TColumn);
    procedure SpeedButton54Click(Sender: TObject);
    procedure BitBtn127Click(Sender: TObject);
    procedure BitBtn126Click(Sender: TObject);
    procedure ckEstoqueDiarioCClick(Sender: TObject);
    procedure BitBtn125Click(Sender: TObject);
    procedure DBEdit195Exit(Sender: TObject);
    procedure DBEdit195KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid37TitleClick(Column: TColumn);
    procedure DBGrid37KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnGradesEnter(Sender: TObject);
    procedure edLocalizarChange(Sender: TObject);
    procedure DBEdit54Exit(Sender: TObject);
    procedure ApagartodasPrecosPorQtdeClick(Sender: TObject);
    procedure btnSPrecoPorQtdeClick(Sender: TObject);

    procedure BitBtn_Excluir_PrecoPorQuantClick(Sender: TObject);
    procedure BitBtn_Imprimir_PrecoPorQuantClick(Sender: TObject);
    procedure BitBtn_Alterar_PrecoPorQuantClick(Sender: TObject);
    procedure BitBtn129Click(Sender: TObject);
    procedure BitBtn128Click(Sender: TObject);
    procedure BitBtn_Novo_PrecoPorQuantClick(Sender: TObject);
    procedure RegistrarVendaPerdida1Click(Sender: TObject);
    procedure btnSPrecosClick(Sender: TObject);
    procedure btnSConversaoClick(Sender: TObject);
    procedure btnSComposicaoClick(Sender: TObject);
    procedure btnSFiscalClick(Sender: TObject);
    procedure btnSOutrosClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBEdit149Exit(Sender: TObject);
    procedure Panel58Exit(Sender: TObject);
    procedure SpeedButton53Click(Sender: TObject);
    procedure SpeedButton50Click(Sender: TObject);
    procedure SpeedButton51Click(Sender: TObject);
    procedure SpeedButton49Click(Sender: TObject);
    procedure SpeedButton52Click(Sender: TObject);
    procedure SpeedButton48Click(Sender: TObject);
    procedure DBEdit118KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn_4Click(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure DBGrid35TitleClick(Column: TColumn);
    procedure DBGrid35DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ckEstoqueDiarioClick(Sender: TObject);
    procedure DBEdit89KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn120Click(Sender: TObject);
    procedure spLimparMesSpedReg0205Click(Sender: TObject);
    procedure btAlterarSped0205Click(Sender: TObject);
    procedure btExcluirSped0205Click(Sender: TObject);
    procedure btNovoSped0205Click(Sender: TObject);
    procedure btSalvarSped0205Click(Sender: TObject);
    procedure btCancelarSped0205Click(Sender: TObject);
    procedure spAltSPED0205Click(Sender: TObject);
    procedure pnSped0205Enter(Sender: TObject);
    procedure DBGrid21TitleClick(Column: TColumn);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure DBGrid32TitleClick(Column: TColumn);
    procedure DBGrid20TitleClick(Column: TColumn);
    procedure DBGrid4TitleClick(Column: TColumn);
    procedure SpeedButton37Click(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure VoltarClick(Sender: TObject);
    procedure SpeedButton38Click(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure BitBtn122Click(Sender: TObject);
    procedure BitBtn118Click(Sender: TObject);
    procedure DBGrid13ColExit(Sender: TObject);
    procedure DBGrid13ColEnter(Sender: TObject);
    procedure BitBtn119Click(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit96Exit(Sender: TObject);
    procedure DBGrid28KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid28TitleClick(Column: TColumn);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);    procedure DBGrid31DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGrid33KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn123Click(Sender: TObject);
    procedure BitBtn124Click(Sender: TObject);
    procedure PageFooterBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel172Print(sender: TObject; var Value: string);
    procedure QRLabel168Print(sender: TObject; var Value: string);
    procedure QRLabel167Print(sender: TObject; var Value: string);
    procedure QRLabel166Print(sender: TObject; var Value: string);
    procedure QRLabel130Print(sender: TObject; var Value: string);
    procedure qkRProducaoEstoquePreview(Sender: TObject);
    procedure qkRProducaoEstoqueBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BitBtn121Click(Sender: TObject);
    procedure BitBtn117Click(Sender: TObject);
    procedure BitBtn116Click(Sender: TObject);
    procedure pnTribAdicionalEnter(Sender: TObject);
    procedure DBEdit96KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxSemEstClick(Sender: TObject);
    procedure cbxComEstClick(Sender: TObject);
    procedure QuickRep5Preview(Sender: TObject);
    procedure MaskEdit22Change(Sender: TObject);
    procedure MaskEdit22Enter(Sender: TObject);
    procedure MaskEdit20Enter(Sender: TObject);
    procedure MaskEdit20Change(Sender: TObject);
    procedure DBGrid30KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid30DblClick(Sender: TObject);
    procedure DBGrid29KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid29DblClick(Sender: TObject);
    procedure DBLookupComboBox10Click(Sender: TObject);
    procedure mkPromocaoChange(Sender: TObject);
    procedure mkTipoChange(Sender: TObject);
    procedure DBLookupComboBox10Exit(Sender: TObject);
    procedure ckPromocaoClick(Sender: TObject);
    procedure ckPrecoDifClick(Sender: TObject);
    procedure QRExpr33Print(sender: TObject; var Value: string);
    procedure QRExpr30Print(sender: TObject; var Value: string);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRExpr29Print(sender: TObject; var Value: string);
    procedure QRExpr27Print(sender: TObject; var Value: string);
    procedure QRExpr16Print(sender: TObject; var Value: string);
    procedure QRExpr15Print(sender: TObject; var Value: string);
    procedure QRExpr14Print(sender: TObject; var Value: string);
    procedure QRExpr13Print(sender: TObject; var Value: string);
    procedure QRExpr32Print(sender: TObject; var Value: string);
    procedure QRExpr31Print(sender: TObject; var Value: string);
    procedure QRExpr28Print(sender: TObject; var Value: string);
    procedure QRExpr12Print(sender: TObject; var Value: string);
    procedure QRDBText72Print(sender: TObject; var Value: string);
    procedure QRExpr22Print(sender: TObject; var Value: string);
    procedure PageHeaderBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure TitleBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DBLookupComboBox9Exit(Sender: TObject);
    procedure Panel33Exit(Sender: TObject);
    procedure Panel33Enter(Sender: TObject);
    procedure BitBtn111Click(Sender: TObject);
    procedure BitBtn99Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure BitBtn112Click(Sender: TObject);
    procedure BitBtn115Click(Sender: TObject);
    procedure EditHw6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox8Exit(Sender: TObject);
    procedure EditHw6Exit(Sender: TObject);
    procedure EditHw5Exit(Sender: TObject);
    procedure EditHw4Exit(Sender: TObject);
    procedure BitBtn113Click(Sender: TObject);
    procedure BitBtn114Click(Sender: TObject);
    procedure BitBtn110Click(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure BitBtn109Click(Sender: TObject);
    procedure DBEdit109KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit78Exit(Sender: TObject);
    procedure DBEdit109Exit(Sender: TObject);
    procedure DBEdit55Exit(Sender: TObject);
    procedure DBEdit18Exit(Sender: TObject);
    procedure DBEdit35Exit(Sender: TObject);
    procedure BitBtn108Click(Sender: TObject);
    procedure BitBtn105Click(Sender: TObject);
    procedure BitBtn104Click(Sender: TObject);
    procedure BitBtn103Click(Sender: TObject);
    procedure BitBtn106Click(Sender: TObject);
    procedure BitBtn107Click(Sender: TObject);
    procedure QRLabel89Print(sender: TObject; var Value: string);
    procedure BitBtn102Click(Sender: TObject);
    procedure DBLookupComboBox6Exit(Sender: TObject);
    procedure DbGrid24TitleClick(Column: TColumn);
    procedure DBLookupComboBox7Exit(Sender: TObject);
    procedure DBGrid23KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid25KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DbGrid24DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Edit3Exit(Sender: TObject);
    procedure ApagartodasPrecosClick(Sender: TObject);
    procedure BitBtn101Click(Sender: TObject);
    procedure BitBtn100Click(Sender: TObject);
    procedure DBGrid25TitleClick(Column: TColumn);
    procedure CheckBox19Click(Sender: TObject);
    procedure SelecionarTodos1Click(Sender: TObject);
    procedure DesfazerselecaoClick(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Panel19Exit(Sender: TObject);
    procedure Panel19Enter(Sender: TObject);
    procedure MaskEdit22Exit(Sender: TObject);
    procedure MaskEdit20Exit(Sender: TObject);
    procedure EditHw3Exit(Sender: TObject);
    procedure EditHw2Exit(Sender: TObject);
    procedure Desmarcatodosprodutos1Click(Sender: TObject);
    procedure SelecionartodosprodutosClick(Sender: TObject);
    procedure ApagarTodasPromocoesClick(Sender: TObject);
    procedure GroupBox69Enter(Sender: TObject);
    procedure GroupBox72Enter(Sender: TObject);
    procedure BitBtn98Click(Sender: TObject);
    procedure BitBtn93Click(Sender: TObject);
    procedure DBLookupComboBox4Click(Sender: TObject);
    procedure BitBtn97Click(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn91Click(Sender: TObject);
    procedure DBGrid23TitleClick(Column: TColumn);
    procedure BitBtn94Click(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure DBLookupComboBox5Click(Sender: TObject);
    procedure DbGrid24MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DbGrid24KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbGrid24ColEnter(Sender: TObject);
    procedure DbGrid24CellClick(Column: TColumn);
    procedure BitBtn95Click(Sender: TObject);
    procedure BitBtn92Click(Sender: TObject);
    procedure BitBtn90Click(Sender: TObject);
    procedure BitBtn89Click(Sender: TObject);
    procedure tsFichaComprasVendasExit(Sender: TObject);
    procedure tsFichaComprasVendasEnter(Sender: TObject);
    procedure tsEtiTerRapidaEnter(Sender: TObject);
    procedure QRLabel84Print(sender: TObject; var Value: string);
    procedure QRLabel82Print(sender: TObject; var Value: string);
    procedure BitBtn88Click(Sender: TObject);
    procedure CheckBox18Click(Sender: TObject);
    procedure BitBtn87Click(Sender: TObject);
    procedure QuickRep_FichaProdPreview(Sender: TObject);
    procedure BitBtn_IndiceTecnicoClick(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure BitBtn82Click(Sender: TObject);
    procedure BitBtn86Click(Sender: TObject);
    procedure DBEdit92KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit92Exit(Sender: TObject);
    procedure BitBtn85Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure DBGrid19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditFiscal2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditFiscal2Exit(Sender: TObject);
    procedure BitBtn84Click(Sender: TObject);
    procedure BitBtn83Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas1Click(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure DBEdit63Exit(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton27Click(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure DBGrid17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn81Click(Sender: TObject);
    procedure EditFiscal1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditFiscal1Exit(Sender: TObject);
    procedure DBEdit60Exit(Sender: TObject);
    procedure DBEdit25Exit(Sender: TObject);
    procedure DBEdit25KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn80Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BitBtn39Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure Marcarprodutoparaetiqueta1Click(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit56Exit(Sender: TObject);
    procedure BitBtn77Click(Sender: TObject);
    procedure BitBtn67Click(Sender: TObject);
    procedure DBEdit89Exit(Sender: TObject);
    procedure DBGrid14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid14DblClick(Sender: TObject);
    procedure BitBtn75Click(Sender: TObject);
    procedure BitBtn79Click(Sender: TObject);
    procedure BitBtn74Click(Sender: TObject);
    procedure DBGrid13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn76Click(Sender: TObject);
    procedure BitBtn78Click(Sender: TObject);
    procedure BitBtn73Click(Sender: TObject);
    procedure qrpEtiCodBarrasPreview(Sender: TObject);
    procedure BitBtn72Click(Sender: TObject);
    procedure BitBtn69Click(Sender: TObject);
    procedure BitBtn71Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn68Click(Sender: TObject);
    procedure BitBtn70Click(Sender: TObject);
    procedure BitBtn66Click(Sender: TObject);
    procedure BitBtn65Click(Sender: TObject);
    procedure BitBtn64Click(Sender: TObject);
    procedure ComboBox14Exit(Sender: TObject);
    procedure BitBtn63Click(Sender: TObject);
    procedure qrpPecaUltimaCompraPreview(Sender: TObject);
    procedure BitBtn62Click(Sender: TObject);
    procedure DBGrid8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid7DblClick(Sender: TObject);
    procedure DBGrid7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mkDescSubGrChange(Sender: TObject);
    procedure mkDescGrChange(Sender: TObject);
    procedure DBEdit48Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure MaskEdit18Exit(Sender: TObject);
    procedure qrpCatalogoPreview(Sender: TObject);
    procedure BitBtn60Click(Sender: TObject);
    procedure BitBtn59Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure BitBtn61Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure QuickRep2Preview(Sender: TObject);
    procedure qrpMediaPreview(Sender: TObject);
    procedure BitBtn57Click(Sender: TObject);
    procedure BitBtn58Click(Sender: TObject);
    procedure BitBtn55Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure ComboBox1Exit(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure DBEdit86Enter(Sender: TObject);
    procedure BitBtn56Click(Sender: TObject);
    procedure BitBtn54Click(Sender: TObject);
    procedure BitBtn50Click(Sender: TObject);
    procedure BitBtn51Click(Sender: TObject);
    procedure BitBtn52Click(Sender: TObject);
    procedure BitBtn53Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure BitBtn43Click(Sender: TObject);
    procedure BitBtn48Click(Sender: TObject);
    procedure BitBtn46Click(Sender: TObject);
    procedure BitBtn45Click(Sender: TObject);
    procedure BitBtn44Click(Sender: TObject);
    procedure BitBtn47Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure DBGrid8DblClick(Sender: TObject);
    procedure MaskEdit11Exit(Sender: TObject);
    procedure MaskEdit13Exit(Sender: TObject);
    procedure MaskEdit13Change(Sender: TObject);
    procedure MaskEdit13Enter(Sender: TObject);
    procedure MaskEdit11Change(Sender: TObject);
    procedure MaskEdit11Enter(Sender: TObject);
    procedure PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure TitleBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure qrpMediaBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BitBtn23Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure PageControl2Changing(Sender: TObject; var AllowChange: Boolean);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure DBRadioGroup2Exit(Sender: TObject);
    procedure BitBtn6Exit(Sender: TObject);
    procedure DBEdit57Exit(Sender: TObject);
    procedure DBEdit73Exit(Sender: TObject);
    procedure DBEdit73KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit28Enter(Sender: TObject);
    procedure DBEdit23KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBComboBox3Exit(Sender: TObject);
    procedure DBEdit32Exit(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBComboBox10Exit(Sender: TObject);
    procedure DBGridQtdeVndMesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnOpcaoDireitaProdutosExit(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure ComboBox9Exit(Sender: TObject);
    procedure ComboBox8Exit(Sender: TObject);
    procedure ComboBox7Exit(Sender: TObject);
    procedure ComboBox10Exit(Sender: TObject);
    procedure ComboBox6Exit(Sender: TObject);
    procedure ComboBox5Exit(Sender: TObject);
    procedure ComboBox4Exit(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure GroupBox9Exit(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure DBEdit28Exit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit63KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBComboBox8Exit(Sender: TObject);
    procedure DBComboBox5Exit(Sender: TObject);
    procedure DBComboBox4Exit(Sender: TObject);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure DBComboBox6Exit(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure DBComboBox7Exit(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBLookupComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit59Exit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure verificacampos;
    procedure obterRegiao; //Obter localidade/setor/cidade
    function aplicarFiltros: boolean;
    procedure RemoveAcentosEspacos;
    procedure setarTipoFormEtiq;
    procedure CarregarGruposFiscais();
    procedure HabilitarCamposInclusao;
    procedure HabilitarCamposEdicao;
  private
    { Private declarations }
    vCriou: Smallint;
    dataSetOpf: TDataSet_OOP;
    vLKTipoItemProduto: TDadosLookUp_OOP;
    vPeriodo, vPeriodoC: string;
    vEnter, vCtrlLocalClick: Boolean;
    vrTmp: Currency;
    Fconf_cest: tconfig_sistema_class;
    procedure configuraCamposCodProd(Habilitar: boolean);
    procedure QuickRep_ValidadeBeforePrint(Sender: TCustomQuickRep; var PrintReport: Boolean);
    procedure QRExpr7Print(sender: TObject; var Value: string);
    procedure montarComponentes(pAlterarGrupo: boolean = false);
    procedure tabSheetCadastroSimplesExit(Sender: TObject);
    procedure verificarBotaoLixeira;

    // eventos selects
    procedure EventAddEntitiesSelects(Sender: TObject; Entity: TObject; out Display: string; out SetSelected: Boolean);
    procedure EventChangeEntitiesSelects(Sender: TObject; Entity: TObject; out Info: string);

    procedure GridTitleClick(Column: TColumn);
    procedure PercAdicional30DiasExit(Sender: TObject);
    procedure PercAdicional60DiasExit(Sender: TObject);
    procedure PercAdicional90DiasExit(Sender: TObject);
    function testarDiretorioImagemProduto: boolean;
    procedure abrirDiretorioDestinoImagem;
    procedure habilitarImagensProduto;
    procedure habilitarCamposECommerce(pFormulario: boolean = False);
    procedure habilitarCamposComercioAberto(pFormulario: boolean = False);
    procedure DocumentoEmBranco(pWebBrowser: TWebBrowser);
    procedure carregarwebbrownser(pWebBrowser: TWebBrowser; pHtml: string);
    function GetBrowserHtml(const webBrowser: TWebBrowser): String;
    procedure DesativarAtivarCamposHtml(pTipo: string; pHablitar: boolean = true);
    procedure CestChangecompativel(Sender: TObject);
    procedure atribuirDadosPerfil;

    procedure MargemLucro_Varejo_Exit(Sender: TObject);
    procedure MargemLucro_Atacado_Exit(Sender: TObject);
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;

  public
    { Public declarations }
    procedure produto_edit_unidade(Sender: TObject);
    procedure unidade_add(Sender: TObject);
    procedure unidade_edit(Sender: TObject);
    procedure unidade_del(Sender: TObject);

    procedure unidade_add_conversao(Sender: TObject);
    procedure unidade_edit_conversao(Sender: TObject);
    procedure unidade_del_conversao(Sender: TObject);

    procedure AtualizarListaUnidade(
    	pFocar: boolean = true;
      pUnidade: string = '');
    procedure verificarAbaEcommerceComercioAberto(pTipo: string);
    procedure exibirInfConversao;
  	procedure exibirInfConversaoSaida;
    procedure AjustarBarraLateral(pAjustar: Boolean = True);
//    procedure btRemoverVinculoGradeProdutosAcabadoMateriaPrimaClick(Sender: TObject);
  end;

  Texp_ExisteContaContabil = function (ACodContaContabil: string; AShowErro: Boolean): Boolean;
  Tcest_search             = function (Ncm: string): string;

var
  FrmCadProdutos: TFrmCadProdutos;
  HTMLDocumento:IHTMLDocument2;
  //  SubGrupo: TSubGrupos;
  //  Grupo: TGrupos;
  //  CodBarra: TCodBarras;
  //  PerfilProd: TPerfilProduto;
  Produto: TProdutos;
  promocao_prod: string;
  vGrupoProdTemp, vCodPromocaoTemp: Integer;
  vCodProdTemp: string;
  vDiretorioDestino: string;
  vMensagemTmp: string;
  vHabQtdeVndPorMes: boolean;
  vHabEstoquePorEmpresas: boolean;
  vHabPrecosVndPorEmpresa: boolean;
  vHabObservacaoProd: boolean;
  vHabCaracteristicaProd: boolean;
  vHabCodigoProd: boolean;

  vConfigColuna1, vConfigColuna2, vConfigColuna3: boolean;
  campoPesquisa1, campoPesquisa2, campoPesquisa3: string;
  cdsColunas1, cdsColunas2, cdsColunas3: TClientDataSet;

  trans: TIBTransaction;
  fReset, vCtrlClick, vShiftClick: Boolean;
  cdsGrid1, cdsGrid2, cdsGrid3: TClientDataSet;
  GridCfg1, GridCfg2, GridCfg3: TDBGrid;
  ListGridsAndDataSets1, ListGridsAndDataSets2, ListGridsAndDataSets3: TStrings;
  ListPositions1, ListPositions2, ListPositions3: TStrings;
  nomeDTSEt1, nomeDTSEt2, nomeDTSEt3: string;
  vAlterarNomeDtSet1, vAlterarNomeDtSet2, vAlterarNomeDtSet3: string;
  vCamposPadraoRegistro1, vCamposPadraoRegistro2, vCamposPadraoRegistro3: Boolean;
  PrimeiraPesquisa1, PrimeiraPesquisa2, PrimeiraPesquisa3: Boolean;
  usuario: string;
  vSincronizarEcommerce, vDisponivelEcomerce: string;
  pop_menu_unidade, pop_menu_unidade2: TPopupMenu;

implementation

uses
  UClassesCadastrosBasicos, UMontaArqBalanca,
  GrupoFiscalEtdUnit, ContainerUnit,
  uCadProdutos_HistoricoPreco, uCadProdutos_PrecosUnificados, calc_utils,
  UClassesRelProdutos, DateUtils, funcoes, StrUtils, ComObj, uRelIndTecGrade,
  CestVarianteMvaNcmUf_Model, Math, Clipbrd, hw_utils,
  UVisualizarAcabadoMateriasPrimas;

function montarArquivosBuscaPreco(pBanco: PChar; pCodEmpresa: PChar; pProgressMessage: LongBool): LongBool; stdcall; external 'CompativelHW.dll';
//procedure viewImage(Source: PChar); stdcall; external 'graphicHw.dll';

procedure hw_image_view(Source: WideString); stdcall; external 'hw.utils.dx.dll';

{$R *.dfm}

function GetIEHandle(WebBrowser: TWebbrowser; ClassName: string): HWND;
var
  hwndChild, hwndTmp: HWND;
  oleCtrl: TOleControl;
  szClass: array [0..255] of char;
begin
  oleCtrl :=WebBrowser;
  hwndTmp := oleCtrl.Handle;
  while (true) do
  begin
    hwndChild := GetWindow(hwndTmp, GW_CHILD);
    GetClassName(hwndChild, szClass, SizeOf(szClass));
    if (string(szClass)=ClassName) then
    begin
      Result :=hwndChild;
      Exit;
    end;
    hwndTmp := hwndChild;
  end;
  Result := 0;
end;

procedure TFrmCadProdutos.abrirDiretorioDestinoImagem;
begin
 vDiretorioDestino := vDadosIni.getConfSisStr('prod_cad_diretorio_padrao_imagens', Produto.buscas);
 if (trim(vDiretorioDestino) <> '') then
   if Pos('\', vDiretorioDestino) > 0 then
     if Copy(vDiretorioDestino, Length(vDiretorioDestino), 1) <> '\' then
       vDiretorioDestino := vDiretorioDestino + '\';
end;

procedure TFrmCadProdutos.EventAddEntitiesSelects(Sender: TObject; Entity: TObject; out Display: string; out SetSelected: Boolean);
begin
  SetSelected := False;
  if Sender = edPickerGrupoFiscal then
  begin
    if Entity = nil then
      Display := '[ Vazio ]'
    else
    begin
      Display := GrupoFiscalEtd(Entity).Descricao;
      SetSelected := GrupoFiscalEtd(Entity).Id = Produto.fstr('GRUPO_FISCAL_IBSCBS');
    end;
  end;
end;

procedure TFrmCadProdutos.EventChangeEntitiesSelects(Sender: TObject; Entity: TObject; out Info: string);
begin
  if (Produto.dataSet.State in [dsInsert, dsEdit])
    and (Sender = edPickerGrupoFiscal)
    and edPickerGrupoFiscal.Enabled
  then
  begin
    if Entity = nil then
      Produto.dataSet.FieldByName('GRUPO_FISCAL_IBSCBS').Clear
    else
      Produto.dataSet.FieldByName('GRUPO_FISCAL_IBSCBS').AsString := GrupoFiscalEtd(Entity).Id;
  end;
end;

procedure TFrmCadProdutos.CarregarGruposFiscais();
var
  grupos: GruposFiscaisEtd;
begin
  with Container.GetInstance().ErpFeaturesFactory.CreateListarAtualeTodosGruposFiscaisUseCase() do
  try
    grupos := Executar( Produto.fstr('GRUPO_FISCAL_IBSCBS'));
  finally
    FreeSafe();
  end;

  try
    grupos.Insert(0, nil);
    edPickerGrupoFiscal.LoadEntities( grupos, True );
  finally
    grupos.Free();
  end;
end;

procedure TFrmCadProdutos.ckPercAjustePrec60Click(Sender: TObject);
begin
  inherited;
  EdPercAjustePrec60.Enabled := ckPercAjustePrec60.Checked;
  if ckPercAjustePrec60.Checked then
  begin
  	pnPercAjustePrec60.ParentBackground := False;
		pnPercAjustePrec60.Color := clYellow;
  end
  else
  begin
  	pnPercAjustePrec60.ParentBackground := True;
  	pnPercAjustePrec60.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdPercAjustePrec60.CanFocus) then
  	EdPercAjustePrec60.SetFocus;
end;

procedure TFrmCadProdutos.AjustarBarraLateral(pAjustar: Boolean = True);
var
	vQtdeMenu: Integer;
begin
	if (pnOpcaoDireitaProdutos.Visible) then
  begin
    if (pnObservacao.Visible) then
      if pnObservacao.Height < 48 then
        pnObservacao.Height := 48;

    if (pnCaracteristica.Visible) then
      if pnCaracteristica.Height < 48 then
        pnCaracteristica.Height := 48;

    if (pnCodigo.Visible) then
      if pnCodigo.Height < 48 then
        pnCodigo.Height := 48;

    if (pnEstoqueEmpresas.Visible) then
      if pnEstoqueEmpresas.Height < 48 then
        pnEstoqueEmpresas.Height := 48;

    if (pnPrecosVndPorEmpresa.Visible) then
      if pnPrecosVndPorEmpresa.Height < 48 then
        pnPrecosVndPorEmpresa.Height := 48;

    if (vDadosIni.IfThen(pnObservacao.Visible, pnObservacao.Height, 0) +
      	vDadosIni.IfThen(SplitterObservacaoBottom.Visible, SplitterObservacaoBottom.Height, 0) +
    		vDadosIni.IfThen(pnCaracteristica.Visible, pnCaracteristica.Height, 0) +
        vDadosIni.IfThen(SplitterCaracteristicaBottom.Visible, SplitterCaracteristicaBottom.Height, 0) +
        vDadosIni.IfThen(pnCodigo.Visible, pnCodigo.Height, 0) +
        vDadosIni.IfThen(SplitterCodigoEmpresasBottom.Visible, SplitterCodigoEmpresasBottom.Height, 0) +
        vDadosIni.IfThen(pnEstoqueEmpresas.Visible, pnEstoqueEmpresas.Height, 0) +
        vDadosIni.IfThen(SplitterEstoqueEmpresasBottom.Visible, SplitterEstoqueEmpresasBottom.Height, 0) +
        vDadosIni.IfThen(pnPrecosVndPorEmpresa.Visible, pnPrecosVndPorEmpresa.Height, 0) +
        vDadosIni.IfThen(SplitterPrecosVndPorEmpresaBottom.Visible, SplitterPrecosVndPorEmpresaBottom.Height, 0) +
        vDadosIni.IfThen(pnQtdeVndMes.Visible, pnQtdeVndMes.Height, 0) > pnOpcaoDireitaProdutos.Height) then
    begin
      pnObservacao.Height := 48;
      pnCaracteristica.Height := 48;
      pnCodigo.Height := 48;
      pnEstoqueEmpresas.Height := 48;
      pnPrecosVndPorEmpresa.Height := 48;
      pnQtdeVndMes.Height := 48;
    end;

    pnObservacao.Align := alNone;
    pnCaracteristica.Align := alNone;
    pnCodigo.Align := alNone;
    pnEstoqueEmpresas.Align := alNone;
    pnPrecosVndPorEmpresa.Align := alNone;
    pnQtdeVndMes.Align := alNone;

    SplitterObservacaoBottom.Align := alNone;
    SplitterCaracteristicaBottom.Align := alNone;
    SplitterCodigoEmpresasBottom.Align := alNone;
    SplitterEstoqueEmpresasBottom.Align := alNone;
    SplitterPrecosVndPorEmpresaBottom.Align := alNone;

    vQtdeMenu := 0;
    if MenuLateralExibirObservacao.Checked then
      Inc(vQtdeMenu);
    if MenuLateralExibirDetalhesCaractersticas.Checked then
      Inc(vQtdeMenu);
    if MenuLateralExibirCodigos.Checked then
      Inc(vQtdeMenu);
    if MenuLateralExibirEstoquePorEmpresa.Checked then
      Inc(vQtdeMenu);
    if MenuLateralExibirPrecosVendaPorEmpresa.Checked then
      Inc(vQtdeMenu);

    if pAjustar then
    begin
      pnObservacao.Height := Trunc((pnOpcaoDireitaProdutos.Height / vQtdeMenu));
      pnCaracteristica.Height := Trunc((pnOpcaoDireitaProdutos.Height / vQtdeMenu));
      pnCodigo.Height := Trunc((pnOpcaoDireitaProdutos.Height / vQtdeMenu));
      pnEstoqueEmpresas.Height := Trunc((pnOpcaoDireitaProdutos.Height / vQtdeMenu));
      pnPrecosVndPorEmpresa.Height := Trunc((pnOpcaoDireitaProdutos.Height / vQtdeMenu));
    end;

    if MenuLateralExibirObservacao.Checked then
    begin
      if (not MenuLateralExibirDetalhesCaractersticas.Checked)
      	and (not MenuLateralExibirCodigos.Checked)
        and (not MenuLateralExibirEstoquePorEmpresa.Checked)
        and (not MenuLateralExibirPrecosVendaPorEmpresa.Checked) then
        	pnObservacao.Align := alClient
      else
      begin
      		pnObservacao.Align := alTop;
          SplitterObservacaoBottom.Align := alTop;
      end;

      DBMemoObs.Align := alClient;
    end
    else
    begin
    	pnObservacao.Align := alNone;
      SplitterObservacaoBottom.Align := alNone;
    end;

    if MenuLateralExibirDetalhesCaractersticas.Checked then
    begin
      if (not MenuLateralExibirCodigos.Checked)
      	and (not MenuLateralExibirEstoquePorEmpresa.Checked)
      	and (not MenuLateralExibirPrecosVendaPorEmpresa.Checked) then
        	pnCaracteristica.Align := alClient
      else
      begin
      		pnCaracteristica.Align := alTop;
          SplitterCaracteristicaBottom.Align := AlTop;
      end;

      DBMemoDetCarac.Align := alClient;
    end
    else
    begin
    	DBMemoDetCarac.Align := alNone;
      SplitterCaracteristicaBottom.Align := alNone;
    end;

    if MenuLateralExibirCodigos.Checked then
    begin
      if (not MenuLateralExibirEstoquePorEmpresa.Checked)
      	and (not MenuLateralExibirPrecosVendaPorEmpresa.Checked) then
          pnCodigo.Align := alClient
      else
      begin
      		pnCodigo.Align := alTop;
          SplitterCodigoEmpresasBottom.Align := alTop;
      end;

      GroupBoxCodigo.Align := alLeft;
      DBGridCodigo.Align := alClient;
    end
    else
    begin
      pnCodigo.Align := alNone;
      SplitterCodigoEmpresasBottom.Align := alNone;
    end;

    if MenuLateralExibirEstoquePorEmpresa.Checked then
    begin
    	if (not MenuLateralExibirPrecosVendaPorEmpresa.Checked) then
          pnEstoqueEmpresas.Align := alClient
      else
      begin
      		pnEstoqueEmpresas.Align := alTop;
          SplitterEstoqueEmpresasBottom.Align := alTop;
      end;

      GroupBoxEstoqueEmpresas.Align := alLeft;
      ckFiltrarEmpresa.Align := alTop;
      DBGridEstoqueEmpresas.Align := alClient;
      pnEstoqueEmpresasClient.Align := alClient;
    end
    else
    begin
    	pnEstoqueEmpresas.Align := alNone;
      SplitterEstoqueEmpresasBottom.Align := alNone;
    end;

    if MenuLateralExibirPrecosVendaPorEmpresa.Checked then
    begin
      pnPrecosVndPorEmpresa.Align := alClient;
      GroupBoxPrecosVndPorEmpresa.Align := alLeft;
      DBGridPrecosVndPorEmpresa.Align := alClient;
    end
    else
    	pnPrecosVndPorEmpresa.Align := alNone;

    if MenuLateralExibirObservacao.Checked then
    begin
      pnObservacao.Top := 0;

      if SplitterObservacaoBottom.Visible then
      	SplitterObservacaoBottom.Top := pnObservacao.Top + pnObservacao.Height;
    end;

    if MenuLateralExibirDetalhesCaractersticas.Checked then
    begin
      pnCaracteristica.Top := SplitterObservacaoBottom.Top + SplitterObservacaoBottom.Height;

      if SplitterCaracteristicaBottom.Visible then
      	SplitterCaracteristicaBottom.Top := pnCaracteristica.Top + pnCaracteristica.Height;
    end;

    if MenuLateralExibirCodigos.Checked then
    begin
      pnCodigo.Top := SplitterCaracteristicaBottom.Top + SplitterCaracteristicaBottom.Height;

      if SplitterCodigoEmpresasBottom.Visible then
      	SplitterCodigoEmpresasBottom.Top := pnCodigo.Top + pnCodigo.Height;
    end;

    if MenuLateralExibirEstoquePorEmpresa.Checked then
    begin
      pnEstoqueEmpresas.Top := SplitterCodigoEmpresasBottom.Top + SplitterCodigoEmpresasBottom.Height;

      if SplitterEstoqueEmpresasBottom.Visible then
      	SplitterEstoqueEmpresasBottom.Top := pnEstoqueEmpresas.Top + pnEstoqueEmpresas.Height;
    end;

    if MenuLateralExibirPrecosVendaPorEmpresa.Checked then
    	pnPrecosVndPorEmpresa.Top := SplitterEstoqueEmpresasBottom.Top + SplitterEstoqueEmpresasBottom.Height;

    Splitter1.Align := alLeft;
    Splitter1.Align := alRight;
  end;
end;

procedure TFrmCadProdutos.AlterarQtdeCustoNFProdClick(Sender: TObject);
var
	vCodNF: Integer;
  vNumNF: Integer;
	vTipo: string;
  vNitem: Integer;
  vData: TDateTime;
  vGrupoProd: Integer;
  vCodProd: string;
  vCodGrade: Integer;
  vCodCFOP: Double;
  vCodCliente: Integer;
  vQuantidade: string;
  vCustoMed: string;
  vValorIcm: Double;
  vValorIcmSt: Double;
  vValorIPI: Double;
  vValorTotal: Double;

  vQuantidadeTmp: Double;
  vCustoMedTmp: Double;
begin
	inherited;
  try
  	Screen.Cursor := crHourGlass;
    if DBGrid35.DataSource.DataSet.IsEmpty then
      exit;

    if (trim(DBGrid35.DataSource.DataSet.FieldByName('tipo').AsString) <> 'NF')
    	and (trim(DBGrid35.DataSource.DataSet.FieldByName('tipo').AsString) <> 'NFX') then
      	exit;

    if (trim(DBGrid35.DataSource.DataSet.FieldByName('natureza').AsString) <> 'E') then
      	exit;

  	if not vDadosIni.PesqPros('PRO443', 'CORRIGIR',
      'NF ' + IntToStr(DBGrid35.DataSource.DataSet.FieldByName('numero').AsInteger) + ' ' +
      'ITEM ' + IntToStr(DBGrid35.DataSource.DataSet.FieldByName('N Item/Id').AsInteger) + ' ' +
      'GRADE ' + IntToStr(DBGrid35.DataSource.DataSet.FieldByName('cod grade').AsInteger),
      'PRODUTOS',
      Produto.dataSet.FieldByName('GRUPO_PROD').AsString + ' - ' +
      Produto.dataSet.FieldByName('COD_PROD').AsString,
      Produto.buscas, true) then
        exit;

    vCodNF      := DBGrid35.DataSource.DataSet.FieldByName('cod nf').AsInteger;
    vNumNF      := DBGrid35.DataSource.DataSet.FieldByName('numero').AsInteger;
    vTipo       := DBGrid35.DataSource.DataSet.FieldByName('tipo').AsString;
    vNitem      := DBGrid35.DataSource.DataSet.FieldByName('N Item/Id').AsInteger;
    vData       := DBGrid35.DataSource.DataSet.FieldByName('data_estoque').AsDateTime;
    vGrupoProd  := DBGrid35.DataSource.DataSet.FieldByName('grupo').AsInteger;
    vCodProd    := DBGrid35.DataSource.DataSet.FieldByName('cod prod').AsString;
    vCodGrade   := DBGrid35.DataSource.DataSet.FieldByName('cod grade').AsInteger;
    vCodCFOP    := DBGrid35.DataSource.DataSet.FieldByName('Cod CFOP').AsFloat;
    vCodCliente := DBGrid35.DataSource.DataSet.FieldByName('Cod Cliente').AsInteger;
    vQuantidade := FloatToStr(DBGrid35.DataSource.DataSet.FieldByName('Qtde/Dif. Bal').AsFloat);
    vCustoMed   := FloatToStr(DBGrid35.DataSource.DataSet.FieldByName('Custo Med').AsFloat);
    vValorIcm   := DBGrid35.DataSource.DataSet.FieldByName('Valor ICM').AsFloat;
    vValorIcmSt := DBGrid35.DataSource.DataSet.FieldByName('Valor ST').AsFloat;
    vValorIPI   := DBGrid35.DataSource.DataSet.FieldByName('Valor IPI').AsFloat;
    vValorTotal := DBGrid35.DataSource.DataSet.FieldByName('Valor Total').AsFloat;

    vQuantidadeTmp := StrToFloat(vQuantidade);
    vCustoMedTmp   := StrToFloat(vCustoMed);

    if (trim(DBGrid35.DataSource.DataSet.FieldByName('tipo').AsString) = 'NF') then
    begin
    	Produto.retornaQtdeCustoDataAnt(
      	vData,
        vGrupoProd,
        vCodProd,
        vQuantidadeTmp,
        vCustoMedTmp);

    	vQuantidade := FloatToStr(vQuantidadeTmp);
      vCustoMed   := FloatToStr(vCustoMedTmp);
    end
    else if (trim(DBGrid35.DataSource.DataSet.FieldByName('tipo').AsString) = 'NFX') then
    begin
    	Produto.retornaQtdeCustoMedNF(
        vData,
        vCodNF,
        vNumNF,
        vGrupoProd,
        vCodProd,
        vCodGrade,
        vCodCFOP,
        vCodCliente,
        vValorIcm,
        vValorIcmSt,
        vValorIPI,
        vValorTotal,
        vQuantidadeTmp,
        vCustoMedTmp);

    	vQuantidade := FloatToStr(vQuantidadeTmp);
      vCustoMed   := FloatToStr(vCustoMedTmp);
    end;

    if not InputQuery('Informe a quantidade', 'Informe a quantidade deste item', vQuantidade) then
      exit;

    if (trim(vQuantidade) = '') or (trim(vQuantidade) = '0') then
    begin
      Application.MessageBox('Quantidade não informada', 'Atenção', 0 + 64);
      exit;
    end;

    try
      StrToFloat(vQuantidade)
    except
      Application.MessageBox('Quantidade inválida', 'Atenção', 0 + 64);
    end;

    if not InputQuery('Informe o custo médio', 'Informe o custo médio deste item', vCustoMed) then
      exit;

    if (trim(vCustoMed) = '') or (trim(vCustoMed) = '0') then
    begin
      Application.MessageBox('Custo Médio não informada', 'Atenção', 0 + 64);
      exit;
    end;

    try
      StrToFloat(vCustoMed)
    except
      Application.MessageBox('Custo Médio inválida', 'Atenção', 0 + 64);
    end;

    if not Produto.AlterarQtdeCustoNfProd(
      vCodNF,
      vTipo,
      vNitem,
      vData,
      vGrupoProd,
      vCodProd,
      vCodGrade,
      StrToFloat(vQuantidade),
      StrToFloat(vCustoMed)) then
        exit;

    DBGrid34.DataSource.DataSet.Refresh;
    DBGrid35.DataSource.DataSet.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.AlterarQtdeNFProdClick(Sender: TObject);
var
	vCodNF: Integer;
  vNumNF: Integer;
	vTipo: string;
  vNitem: Integer;
  vData: TDateTime;
  vGrupoProd: Integer;
  vCodProd: string;
  vCodGrade: Integer;
  vQuantidade: string;
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;
    if DBGrid35.DataSource.DataSet.IsEmpty then
      exit;

    if (trim(DBGrid35.DataSource.DataSet.FieldByName('tipo').AsString) <> 'NF') then
      	exit;

    if (trim(DBGrid35.DataSource.DataSet.FieldByName('natureza').AsString) <> 'E') then
      	exit;

  	if not vDadosIni.PesqPros('PRO443', 'CORRIGIR',
      'NF ' + IntToStr(DBGrid35.DataSource.DataSet.FieldByName('numero').AsInteger) + ' ' +
      'ITEM ' + IntToStr(DBGrid35.DataSource.DataSet.FieldByName('N Item/Id').AsInteger) + ' ' +
      'GRADE ' + IntToStr(DBGrid35.DataSource.DataSet.FieldByName('cod grade').AsInteger),
      'PRODUTOS',
      Produto.dataSet.FieldByName('GRUPO_PROD').AsString + ' - ' +
      Produto.dataSet.FieldByName('COD_PROD').AsString,
      Produto.buscas, true) then
        exit;

    vCodNF      := DBGrid35.DataSource.DataSet.FieldByName('cod nf').AsInteger;
    vNumNF      := DBGrid35.DataSource.DataSet.FieldByName('numero').AsInteger;
    vTipo       := DBGrid35.DataSource.DataSet.FieldByName('tipo').AsString;
    vNitem      := DBGrid35.DataSource.DataSet.FieldByName('N Item/Id').AsInteger;
    vData       := DBGrid35.DataSource.DataSet.FieldByName('data_estoque').AsDateTime;
    vGrupoProd  := DBGrid35.DataSource.DataSet.FieldByName('grupo').AsInteger;
    vCodProd    := DBGrid35.DataSource.DataSet.FieldByName('cod prod').AsString;
    vCodGrade   := DBGrid35.DataSource.DataSet.FieldByName('cod grade').AsInteger;
    vQuantidade := FloatToStr(DBGrid35.DataSource.DataSet.FieldByName('Qtde/Dif. Bal').AsFloat);

    if not InputQuery('Informe a quantidade', 'Informe a quantidade deste item', vQuantidade) then
      exit;

    if (trim(vQuantidade) = '') or (trim(vQuantidade) = '0') then
    begin
      Application.MessageBox('Quantidade não informada', 'Atenção', 0 + 64);
      exit;
    end;

    try
      StrToFloat(vQuantidade)
    except
      Application.MessageBox('Quantidade inválida', 'Atenção', 0 + 64);
    end;

    if not Produto.AlterarQtdeNfProd(
      vCodNF,
      vTipo,
      vNitem,
      vData,
      vGrupoProd,
      vCodProd,
      vCodGrade,
      StrToFloat(vQuantidade)) then
        exit;

    DBGrid34.DataSource.DataSet.Refresh;
    DBGrid35.DataSource.DataSet.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.ApagartodasPrecosClick(Sender: TObject);
begin
  inherited;
  if not (Produto.vPromocaoProduto.DeleteTodosPrecoProduto) then
    exit;
end;

procedure TFrmCadProdutos.ApagartodasPrecosPorQtdeClick(Sender: TObject);
begin
  inherited;
  if not Produto.vProdutosPrecoQtde.DeleteTodosPrecoPorQtde then
  	exit;
end;

procedure TFrmCadProdutos.ApagartodasPrecosQtdeClick(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRECO_PRODUTOS_QTDE', 'E', Produto.buscas) then
    Exit;

  MarcarTodasPecosQtdeClick(Sender);  
  if not Produto.vProdutosPrecoQtde.Delete(Produto.dataSet) then
    exit;
end;

procedure TFrmCadProdutos.ApagarTodasPromocoesClick(Sender: TObject);
begin
  inherited;
  if not (Produto.vPromocaoProduto.DeleteTodasPromocaoProduto) then
    exit;

end;

function TFrmCadProdutos.aplicarFiltros: boolean;
begin
  try
     Result := false;


    if not Produto.filtrarFichaProdutos(ckRequisicao.Checked, ckOrdemServ.Checked, ckOrcamento.Checked,
      ckNotas.Checked, ckDevolucao.Checked, ckProducao.Checked, ckCorrecao.Checked,
      ckBalD.Checked, ckBalG.Checked, ckExcCancReab.Checked, {ckAlterouEst.Checked} false, {ckNAlterouEst.Checked} false,
      ckEstoqueDiarioC.Checked, ckCupom.Checked, ckNotaD.Checked, ckNotasS.Checked, ckNotasC.Checked,
      ckConfirmados.Checked, ckPendentes.Checked) then
       exit;
  finally
     _GravaConfiguracoesBoolean('ckRequisicao', ckRequisicao.Checked);
     _GravaConfiguracoesBoolean('ckOrdemServ', ckOrdemServ.Checked);
     _GravaConfiguracoesBoolean('ckOrcamento', ckOrcamento.Checked);
     _GravaConfiguracoesBoolean('ckNotas', ckNotas.Checked);
     _GravaConfiguracoesBoolean('ckDevolucao', ckDevolucao.Checked);
     _GravaConfiguracoesBoolean('ckProducao', ckProducao.Checked);
     _GravaConfiguracoesBoolean('ckCorrecao', ckCorrecao.Checked);
     _GravaConfiguracoesBoolean('ckBalD', ckBalD.Checked);
     _GravaConfiguracoesBoolean('ckBalG', ckBalG.Checked);
     _GravaConfiguracoesBoolean('ckExcCancReab', ckExcCancReab.Checked);
     _GravaConfiguracoesBoolean('ckAlterouEst', ckAlterouEst.Checked);
     _GravaConfiguracoesBoolean('ckNAlterouEst', ckNAlterouEst.Checked);
     _GravaConfiguracoesBoolean('ckCupom', ckCupom.Checked);
     _GravaConfiguracoesBoolean('ckNotaD', ckNotaD.Checked);
     _GravaConfiguracoesBoolean('ckNotasS', ckNotasS.Checked);
     _GravaConfiguracoesBoolean('ckNotasC', ckNotasC.Checked);
     _GravaConfiguracoesBoolean('ckConfirmados', ckConfirmados.Checked);
     _GravaConfiguracoesBoolean('ckPendentes', ckPendentes.Checked);
  end;
     
  Result := true;
end;

procedure TFrmCadProdutos.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  inherited;
  if pos(uppercase('Invalid input value.  Use escape key to abandon changes'), uppercase(E.Message))
    > 0 then
    Application.MessageBox(PChar('Valor de entrada para o campo está incorreto.' + chr(13) +
      'Precione a tecla ESC para abandonar as alterações no campo.'), 'Erro', MB_OK + MB_ICONERROR +
      MB_DEFBUTTON1)
  else
    Application.MessageBox(Pchar(E.Message), 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
end;

procedure TFrmCadProdutos.atribuirDadosPerfil;
begin
	EdCodPerfilProd.AsValue := Produto.buscas.FieldByName('COD_PERFIL').AsInteger;
  EdPerfilProd.Text := Produto.buscas.FieldByName('DESCR_PERFIL').AsString;

  EdCodSubGrupo.AsValue := Produto.buscas.FieldByName('SUB_G_PROD').AsInteger;
  DBLSubGrupo.KeyValue := Produto.buscas.FieldByName('SUB_G_PROD').AsInteger;

  EdCodMarca.AsValue := Produto.buscas.FieldByName('COD_MARCA').AsInteger;
  DBLMarca.KeyValue := Produto.buscas.FieldByName('COD_MARCA').AsInteger;

  EdCodCFOP.AsValue := Produto.buscas.FieldByName('CODIGO_NOP').AsInteger;
  EdCodCFOPInter.AsValue := Produto.buscas.FieldByName('CFOP_INTER_N_CONT').AsInteger;
  EdCodNCM.Text := Produto.buscas.FieldByName('NBM').AsString;
  EdCEST.Text := '';
end;

procedure TFrmCadProdutos.AtualizarListaUnidade(
	pFocar: boolean = true;
  pUnidade: string = '');
var
  I: Integer;
begin
  vDadosIni.montarDbComboboxUnidade(Produto.buscas, DBComboBox24);
  vDadosIni.montarDbComboboxUnidade(Produto.buscas, DBComboBox23);
  vDadosIni.montarDbComboboxUnidade(Produto.buscas, DBComboBoxUnidadeConv);
  vDadosIni.montarDbComboboxUnidade(Produto.buscas, DBComboBoxUnidadeConvSaida);

  if pFocar then
  begin
    for i := 0 to DBComboBox24.Items.Count - 1 do
    begin
      if pUnidade = trim(DBComboBox24.Items[i]) then
      begin
         DBComboBox24.ItemIndex := i;
         DBComboBox23.ItemIndex := i;
         DBComboBoxUnidadeConv.ItemIndex := i;
         DBComboBoxUnidadeConvSaida.ItemIndex := i;
         break;
      end;
    end;
  end;
end;

procedure TFrmCadProdutos.VerProdutosAcabadosClick(Sender: TObject);
var
  vGrupoProd: Integer;
  vCodProd: string;
  vNatureza: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    vGrupoProd := DBGrid35.DataSource.DataSet.FieldByName('grupo').AsInteger;
    vCodProd   := DBGrid35.DataSource.DataSet.FieldByName('cod prod').AsString;
    vNatureza  := DBGrid35.DataSource.DataSet.FieldByName('natureza').AsString;

    if not Produto.verProdutosAcabadosProducao(
      vNatureza,
      vGrupoProd,
      vCodProd) then
        exit;

    DBGrid34.DataSource.DataSet.Refresh;
    DBGrid35.DataSource.DataSet.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.VerProdutosAcabadosProducaoClick(Sender: TObject);
var
  vGrupoProd: Integer;
  vCodProd: string;
  vNumero: Integer;
  vNitem: Integer;
  vNatureza: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if (trim(DBGrid35.DataSource.DataSet.FieldByName('tipo').AsString) <> 'PDC') then
      	exit;

    vGrupoProd := DBGrid35.DataSource.DataSet.FieldByName('grupo').AsInteger;
    vCodProd   := DBGrid35.DataSource.DataSet.FieldByName('cod prod').AsString;
    vNumero    := DBGrid35.DataSource.DataSet.FieldByName('numero').AsInteger;
    vNitem     := DBGrid35.DataSource.DataSet.FieldByName('N Item/Id').AsInteger;
    vNatureza  := DBGrid35.DataSource.DataSet.FieldByName('natureza').AsString;

    if not Produto.verProdutosAcabadosProducao(
      vNatureza,
      vGrupoProd,
      vCodProd,
      vNumero,
      vNitem) then
        exit;

    DBGrid34.DataSource.DataSet.Refresh;
    DBGrid35.DataSource.DataSet.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.VerProdutosMatInsumosClick(Sender: TObject);
var
  vGrupoProd: Integer;
  vCodProd: string;
  vNatureza: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    vGrupoProd := DBGrid35.DataSource.DataSet.FieldByName('grupo').AsInteger;
    vCodProd   := DBGrid35.DataSource.DataSet.FieldByName('cod prod').AsString;
    vNatureza  := DBGrid35.DataSource.DataSet.FieldByName('natureza').AsString;

    if not Produto.verMatInsumosProducao(
    	vNatureza,
      vGrupoProd,
      vCodProd) then
        exit;

    DBGrid34.DataSource.DataSet.Refresh;
    DBGrid35.DataSource.DataSet.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.VerProdutosMatInsumosProducaoClick(Sender: TObject);
var
  vGrupoProd: Integer;
  vCodProd: string;
  vNumero: Integer;
  vNitem: Integer;
  vNatureza: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if (trim(DBGrid35.DataSource.DataSet.FieldByName('tipo').AsString) <> 'PDC') then
      	exit;

    vGrupoProd := DBGrid35.DataSource.DataSet.FieldByName('grupo').AsInteger;
    vCodProd   := DBGrid35.DataSource.DataSet.FieldByName('cod prod').AsString;
    vNumero    := DBGrid35.DataSource.DataSet.FieldByName('numero').AsInteger;
    vNitem     := DBGrid35.DataSource.DataSet.FieldByName('N Item/Id').AsInteger;
    vNatureza  := DBGrid35.DataSource.DataSet.FieldByName('natureza').AsString;

    if not Produto.verMatInsumosProducao(
      vNatureza,
      vGrupoProd,
      vCodProd,
      vNumero,
      vNitem) then
        exit;

    DBGrid34.DataSource.DataSet.Refresh;
    DBGrid35.DataSource.DataSet.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn100Click(Sender: TObject);
begin
  inherited;
  vDadosIni.vtpPreco := Produto.vPromocaoProduto.dataSet.FieldByName('TIPO').AsString;

  if Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').IsNull then
    exit;

  if not
    (Produto.vPromocaoProduto._abrePromocaoProdutos(Produto.vPromocaoProduto.dataSet.FieldByName('GRUPO_PROD').AsString,
    Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROD').AsString,
    Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsString,
    Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsString,
    Produto.vPromocaoProduto.dataSet.FieldByName('SIGLA').AsString)) then
    exit;

  vDadosIni.vtpPreco := 'P';
  if not Produto.vPromocaoProduto.Edit then
    exit;

  MaskEdit23.Enabled := false;
  MaskEdit24.Enabled := false;
  MaskEdit25.Enabled := false;
  MaskEdit26.Enabled := false;  
  EditHw2.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('VALOR_PROMOCAO').AsFloat;
  EditHw3.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('PORCENTAGEM').AsFloat;
  DBLookupComboBox7.Field.AsString := Produto.vPromocaoProduto.dataSet.FieldByName('SIGLA').AsString;
  MaskEdit23.Text := FormatDateTime('dd/mm/yyyy', Produto.vPromocaoProduto.dataSet.FieldByName('DATA_INI').AsDateTime);
  MaskEdit25.Text := FormatDateTime('dd/mm/yyyy', Produto.vPromocaoProduto.dataSet.FieldByName('DATA_FIM').AsDateTime);
  MaskEdit24.Text := Produto.vPromocaoProduto.dataSet.FieldByName('HORA_INI').AsString;
  MaskEdit26.Text := Produto.vPromocaoProduto.dataSet.FieldByName('HORA_FIM').AsString;

  BitBtn93.Enabled := false;
  DBEdit96.Enabled := false;
  DBLookupComboBox6.Enabled := false;
  DBLookupComboBox7.Enabled := false;
  EditHw2.Enabled := false;
  EditHw3.Enabled := false;
  CheckBox19.Enabled := false;

  PageControl7.ActivePage := TabSheet9;

  if (Self.Enabled) and (Self.Visible) and (BitBtn98.CanFocus) then
    BitBtn98.SetFocus;
end;

procedure TFrmCadProdutos.BitBtn101Click(Sender: TObject);
var
	I: Integer;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_PRECOS_DIFERENCIADOS', 'A', Produto.buscas) then
    Exit;

  vDadosIni.vtpPreco := 'P';
  if not (Produto.vPromocaoProduto.Edit) then
    exit;

  promocao_prod := 'EDITAR';

  MaskEdit23.Enabled := false;
  MaskEdit24.Enabled := false;
  MaskEdit25.Enabled := false;
  MaskEdit26.Enabled := false;

  DBLookupComboBox6.Field.AsInteger :=
    Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger;
  DBEdit96.Field.AsInteger := Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger;
  Produto.vTipoPreco._abreTipoPrecoPromocao;
  DBLookupComboBox4.Field.AsInteger :=
    Produto.vTipoPreco.dataSet.FieldByName('COD_TPPRECO').AsInteger;
  DBEdit97.Field.AsInteger := Produto.vTipoPreco.dataSet.FieldByName('COD_TPPRECO').AsInteger;
  EditHw2.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('VALOR_PROMOCAO').AsFloat;
  EditHw3.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('PORCENTAGEM').AsFloat;
  Produto.vPromocaoProduto.vTipoVenda._abreTipoVenda('0', '1', '99', '99999');
  DBLookupComboBox7.Field.AsString := Produto.vPromocaoProduto.dataSet.FieldByName('SIGLA').AsString;
  MaskEdit23.Text := FormatDateTime('dd/mm/yyyy', Produto.vPromocaoProduto.dataSet.FieldByName('DATA_INI').AsDateTime);
  MaskEdit25.Text := FormatDateTime('dd/mm/yyyy', Produto.vPromocaoProduto.dataSet.FieldByName('DATA_FIM').AsDateTime);
  MaskEdit24.Text := Produto.vPromocaoProduto.dataSet.FieldByName('HORA_INI').AsString;
  MaskEdit26.Text := Produto.vPromocaoProduto.dataSet.FieldByName('HORA_FIM').AsString;

  DBEdit96.Enabled := false;
  DBEdit97.Enabled := false;
  DBLookupComboBox6.Enabled := false;
  DBLookupComboBox4.Enabled := false;
  DBLookupComboBox7.Enabled := false;
  GroupBox3.Enabled := false;
  CheckBox20.Enabled := false;
  Label221.Enabled := false;
  CheckBox20.Checked := false;
  CheckBox19.Checked := false;

  EditHw2.Enabled := true;

  edMarukpMargemPromo.DataField := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'MARGEM', 'MARKUP');
  lbMarkupMargemPromo.Caption := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'Margem', 'Markup');

  if Produto.vPromocaoProduto.dataSet.FieldByName('MARKUP').AsFloat = 0 then
  begin
  	EditHw3.Enabled := false;
    btHabPercentProdPromocao.Visible := True;
  	edMarukpMargemPromo.Enabled := True;
  	btHabMarkupProdPromocao.Visible := False;
  end
  else
  begin
    EditHw3.Enabled := true;
    btHabPercentProdPromocao.Visible := False;
  	edMarukpMargemPromo.Enabled := False;
  	btHabMarkupProdPromocao.Visible := True;
  end;

	btHabDebCredProm.Visible := True;
  DBComboBox18.Enabled := not btHabDebCredProm.Visible;

  if trim(Produto.vPromocaoProduto.dataSet.FieldByName('USAR_DEBCRED').AsString) <> '' then
  begin
    for I := 0 to DBComboBox18.Items.Count - 1 do
      if Copy(DBComboBox18.Items[I], 1, 1) = Produto.vPromocaoProduto.dataSet.FieldByName('USAR_DEBCRED').AsString then
      begin
        DBComboBox18.ItemIndex := I;
        Break;
      end;
  end
  else
    DBComboBox18.ItemIndex := -1;

  PageControl7.ActivePage := TabSheet9;

  if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
    EditHw2.SetFocus
end;

procedure TFrmCadProdutos.BitBtn102Click(Sender: TObject);
begin
  inherited;
  vDadosIni.vtpPreco := Produto.vPromocaoProduto.dataSet.FieldByName('TIPO').AsString;

  if not vDadosIni.PesqPros('PRO247', 'IMPRIMIR', '', 'PROMOCAO',
    Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsString,
    Produto.vPromocaoProduto.buscas, true) then
    exit;

  qrpPromocaoProduto.Preview;
end;

procedure TFrmCadProdutos.BitBtn103Click(Sender: TObject);
begin
  inherited;
  Produto.vProdutosConversao.vFatorPrinc := EditMoedaFatorPrinc.Valor;
  Produto.vProdutosConversao.vFatorConv  := EditMoedaFatorConv.Valor;

  if (Self.Enabled) and (Self.Visible) and (BitBtn103.CanFocus) then
  	BitBtn103.SetFocus;
  if not (Produto.vProdutosConversao.Post) then
  begin
    setFocusCampoErro(Produto.vProdutosConversao.vNomeCampoErro, Produto.vProdutosConversao.vMensagemErro);
    exit;
  end
  else
  begin
    TForm(Panel56.Parent).ModalResult := IDOK;
    Produto.vConsProdutosConversao._abreProdutosConversao(
    	Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
      Produto.dataSet.FieldByName('COD_PROD').AsString);
  end;
end;

procedure TFrmCadProdutos.BitBtn104Click(Sender: TObject);
begin
  inherited;
  pageEAN_Conversao.ActivePage := TabSheet11;

  Produto.vProdutosConversao.Cancel;
  Produto.vProdutosConversao.RollBackTransacao;
  TForm(Panel56.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtn105Click(Sender: TObject);
var
  vTemp: string;

begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_DESMEMBRAMENTO', 'I', Produto.buscas) then
    Exit;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');

  if Trim(vDadosIni.vPesquisa) <> '' then
  begin
    if InputQuery('Informe um Percentual', 'Informe o percentual deste item. Ex: 5,6', vTemp) then
    begin
      try
        StrToFloat(vTemp);
      except
        Application.MessageBox('Percentual inválido', 'Atenção', 0 + 64);
        Exit;
      end;

      Produto.vProdutosDesmembramento.buscas.Close;
      Produto.vProdutosDesmembramento.buscas.SQL.Text :=
        'select cod_prod, grupo_prod, descr_prod, unidade, cod_recprod from produtos   ' +
        ' where cod_prod = ' + QuotedStr(vDadosIni.vPesquisaCod_prod) +
        ' and grupo_prod = ' + vDadosIni.vPesquisaGrupo_prod +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      Produto.vProdutosDesmembramento.buscas.Open;

      Produto.vProdutosDesmembramento.vcod_prod_acabado := Produto.dataSet.FieldByName('cod_prod').AsString;
      Produto.vProdutosDesmembramento.vgrupo_prod_acabado := Produto.dataSet.FieldByName('grupo_prod').AsString;
      Produto.vProdutosDesmembramento.vcod_prod_mp := vDadosIni.vPesquisaCod_prod;
      Produto.vProdutosDesmembramento.vgrupo_prod_mp := vDadosIni.vPesquisaGrupo_prod;
      Produto.vProdutosDesmembramento.vquant := StrToFloat(vTemp);
      Produto.vProdutosDesmembramento.vdescr_prod_mp := Produto.vProdutosDesmembramento.buscas.FieldByName('DESCR_PROD').AsString;
      Produto.vProdutosDesmembramento.InsertItem;
    end;
  end;
end;

procedure TFrmCadProdutos.BitBtn106Click(Sender: TObject);
begin
  inherited;
  if Produto.vConsProdutosConversao.dataSet.IsEmpty then
   	Exit;
    
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_CONVERSAO', 'E', Produto.buscas) then
    Exit;

  if trim(Produto.vConsProdutosConversao.dataSet.FieldByName('TIPO').AsString) = 'EAN' then
  begin
  	if not (Produto.vProdutosConversao.Delete(
    	Produto.vConsProdutosConversao.dataSet.FieldByName('GRUPO_PROD').AsInteger,
      Produto.vConsProdutosConversao.dataSet.FieldByName('COD_PROD').AsString,
      Produto.vConsProdutosConversao.dataSet.FieldByName('CODIGO_EAN').AsString)) then
    exit;
  end
  else
  begin
  	if not (Produto.vProdutosConversaoSaida.Delete(
    	Produto.vConsProdutosConversao.dataSet.FieldByName('GRUPO_PROD').AsInteger,
      Produto.vConsProdutosConversao.dataSet.FieldByName('COD_PROD').AsString,
      UpperCase(trim(Produto.dataSet.FieldByName('UNIDADE').AsString)),
      UpperCase(trim(Produto.vConsProdutosConversao.dataSet.FieldByName('UNIDADE').AsString)))) then
    		exit;
  end;

  Produto.vConsProdutosConversao._abreProdutosConversao(
    Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
    Produto.dataSet.FieldByName('COD_PROD').AsString);
end;

procedure TFrmCadProdutos.BitBtn107Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_CONVERSAO', 'I', Produto.buscas) then
    Exit;
  try
//    RadioGroup2.ItemIndex := 0;
//    if not vDadosIni.abreForm('Tipo de Conversão', Panel157, [ofAutoSize, ofEscapeExit]) then
//      exit;

//    if RadioGroup2.ItemIndex = 0 then
//    begin
//    	vDadosIni.carregarUnidades(
//      	Produto.buscas,
//        DBComboBoxUnidadeConv,
//        True,
//        '');
//
//    	if not Produto.vProdutosConversao.Insert(
//      	Produto.dataSet.FieldByName('GRUPO_PROD').AsInteger,
//        Produto.dataSet.FieldByName('COD_PROD').AsString) then
//        	exit;
//
//      ComboBoxUnidadePrinc.Items.Clear;
//      ComboBoxUnidadePrinc.Items.Add(UpperCase(trim(Produto.dataSet.FieldByName('UNIDADE').AsString)));
//      ComboBoxUnidadePrinc.ItemIndex := 0;
//
//      EditMoedaFatorPrinc.Valor := 0;
//      EditMoedaFatorConv.Valor  := 0;
//
//      DBComboBoxUnidadeConv.ItemIndex := -1;
//
//      DBEditCodigoEAN.Enabled := true;
//      DBComboBoxUnidadeConv.Enabled := true;
//
//      exibirInfConversao;
//
//      vDadosIni.abreForm('Conversão por Código EAN', Panel56, [ofAutoSize, ofEscapeExit]);
//    end
//    else
//    begin
    	if trim(Produto.dataSet.FieldByName('INF_UNIDADE').AsString) <> 'S' then
      begin
      	if Application.MessageBox(PChar('Para incluir uma unidade de conversão para venda é necessário definir a unidade principal do produto.' + #13 + #13 +
        	'Deseja definir a unidade ' + QuotedStr(UpperCase(trim(Produto.dataSet.FieldByName('UNIDADE').AsString))) + ' como unidade principal deste produto?' + #13 + #13 +
          'A unidade do produto poderá ser alterado somente até o estoque ser movimentado, ' +
    			'caso o produto tenha movimentado o estoque em algum período a unidade não poderá ser alterada novamente.'),
    			'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;

    		if not Produto.gravarUnidadeComoPadrao then
          exit;
      end;

    	vDadosIni.carregarUnidades(
      	Produto.buscas,
        DBComboBoxUnidadeConvSaida,
        True,
        '');

    	if not Produto.vProdutosConversaoSaida.Insert(
      	Produto.dataSet.FieldByName('GRUPO_PROD').AsInteger,
      Produto.dataSet.FieldByName('COD_PROD').AsString) then
      exit;

  		ComboBoxUnidadePrincSaida.Items.Clear;
      ComboBoxUnidadePrincSaida.Items.Add(UpperCase(trim(Produto.dataSet.FieldByName('UNIDADE').AsString)));
      ComboBoxUnidadePrincSaida.ItemIndex := 0;

      EditMoedaFatorPrincSaida.Valor := 0;
      EditMoedaFatorConvSaida.Valor  := 0;

      DBComboBoxUnidadeConvSaida.ItemIndex := -1;
      DBComboBoxDisVendaSaida.ItemIndex := -1;
      DBComboBoxPadraoVndSaida.ItemIndex := -1;

      EditMoedaFatorPrincSaida.Enabled   := true;
      EditMoedaFatorConvSaida.Enabled    := true;
      DBComboBoxUnidadeConvSaida.Enabled := true;
      btUnidadeConversaoVenda.Enabled    := true;
      DBEditCodigoEanSaida.Enabled       := true;

      exibirInfConversaoSaida;

    	vDadosIni.abreForm('Conversão', Panel155, [ofAutoSize, ofEscapeExit]);
//    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn108Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_DESMEMBRAMENTO', 'E', Produto.buscas) then
    Exit;
  if not Produto.vProdutosDesmembramento.Delete then
    exit;

end;

procedure TFrmCadProdutos.BitBtn109Click(Sender: TObject);
begin
  inherited;
  GroupBox3.Parent := TabSheet2;

  BitBtn109.Parent := Panel16;
  BitBtn2.Visible := True;
  BitBtn3.Visible := True;
  Panel1.Parent := TabSheet2;
  ckLixeira.Visible := True;
  ckEcommerce.Visible := True;
  PageControl1.ActivePage := TabSheet2;
  if ckLixeira.Checked then
  	FrmCadProdutos.Caption := 'Produtos (Lixeira)'
  else if ckEcommerce.Checked then
  	FrmCadProdutos.Caption := 'Produtos (E-Commerce)'
  else
		FrmCadProdutos.Caption := 'Produtos';
  Panel2.Visible := True;

  ckMenuLateral.Visible := True;
  ckMenuLateralClick(Sender);

//  DBGrid1.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,
//    dgConfirmDelete, dgCancelOnExit{, dgMultiSelect}];
end;

procedure TFrmCadProdutos.BitBtn10Click(Sender: TObject);
begin
  inherited;
  GroupBox24.Visible := True;
  GroupBox24.Enabled := True;
  BitBtn10.Enabled := false;
end;

procedure TFrmCadProdutos.BitBtn110Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_PRECOS_DIFERENCIADOS', 'I', Produto.buscas) then
    Exit;
  try
    vDadosIni.vtpPreco := 'T';
    if not (Produto.vPromocaoProduto.Insert) then
      exit;

    Produto.vRegiao._abreRegiao(DBLookupComboBox9.Text);

    if Trim(DBLookupComboBox9.Text) = 'LOCALIDADE' then
    begin
      DBLookupComboBox8.DataField := 'COD_LOCALIDADE';
      Label235.Caption := 'Localidade:';
    end
    else if Trim(DBLookupComboBox9.Text) = 'SETOR' then
    begin
      DBLookupComboBox8.DataField := 'COD_SETOR';
      Label235.Caption := 'Setor:';
    end
    else if Trim(DBLookupComboBox9.Text) = 'CIDADE' then
    begin
      DBLookupComboBox8.DataField := 'COD_CIDADE';
      Label235.Caption := 'Cidade:';
    end
    else if Trim(DBLookupComboBox9.Text) = 'AVULSO' then
    begin
    	DBLookupComboBox8.DataField := 'COD_PROMOCAO';
      Label235.Caption := 'Tabela:';
    end;

    EditHw4.AsValue := 0;
    EditHw5.AsValue := 0;
    EditHw6.AsValue := 0;
    EditHw8.AsValue := 0;
    DBLookupComboBox8.KeyValue := 0;
    DBLookupComboBox9.KeyValue := 0;
    DBLookupComboBox8.Enabled := true;
    DBLookupComboBox9.Enabled := true;
    CheckBox21.Checked := false;
    EditHw4.Enabled := true;
    EditHw5.Enabled := true;
    EditHw6.Enabled := true;
    EditHw8.Enabled := true;
    BitBtn115.Enabled := true;
    edMarukpMargem.DataField := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'MARGEM', 'MARKUP');
    lbMakupMargem.Caption := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'Margem:', 'Markup:');

  	EditHw5.Enabled := true;
		btHabPercentProdTabPreco.Visible := false;
  	edMarukpMargem.Enabled := false;
  	btHabMarkupProdTabPreco.Visible := true;

    btHabDebCredTab.Visible := True;
    DBComboBox17.Enabled := not btHabDebCredTab.Visible;
    DBComboBox17.ItemIndex := -1;

    PageControl9.ActivePage := TabSheet14;

    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox9.CanFocus) then
      DBLookupComboBox9.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn111Click(Sender: TObject);
var
	vTemp: string;
  vTemp2: string;
begin
  try
    inherited;
    DBGrid1.Visible   := False;
    DBGrid28.Visible  := False;

    if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_PRECOS_DIFERENCIADOS', 'E', Produto.buscas) then
      Exit;
    vDadosIni.vtpPreco := Produto.vPromocaoProduto.dataSet.FieldByName('TIPO').AsString;

    if Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsInteger = 1 then
    begin
      lbDelTabelaProd1Op1.Caption :=
        'Cod Promoção: ' + IntToStr(Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsInteger);
      lbDelTabelaProd1Op2.Caption :=
        'Promoção: ' + trim(Produto.vPromocaoProduto.dataSet.FieldByName('DESCRICAO').AsString);
    end
    else if Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsInteger = 2 then
    begin
      lbDelTabelaProd1Op1.Caption :=
        'Cod Localidade: ' + IntToStr(Produto.vPromocaoProduto.dataSet.FieldByName('COD_LOCALIDADE').AsInteger);
      lbDelTabelaProd1Op2.Caption :=
        'Localidade: ' + trim(Produto.vPromocaoProduto.dataSet.FieldByName('DESCRICAO').AsString);
    end
    else if Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsInteger = 3 then
    begin
      lbDelTabelaProd1Op1.Caption :=
        'Cod Setor: ' + IntToStr(Produto.vPromocaoProduto.dataSet.FieldByName('COD_SETOR').AsInteger);
      lbDelTabelaProd1Op2.Caption :=
        'Setor: ' + trim(Produto.vPromocaoProduto.dataSet.FieldByName('DESCRICAO').AsString);
    end
    else if Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsInteger = 4 then
    begin
      lbDelTabelaProd1Op1.Caption :=
        'Cod Cidade: ' + IntToStr(Produto.vPromocaoProduto.dataSet.FieldByName('COD_CIDADE').AsInteger);
      lbDelTabelaProd1Op2.Caption :=
        'Cidade: ' + trim(Produto.vPromocaoProduto.dataSet.FieldByName('DESCRICAO').AsString);
    end
    else
    begin
      lbDelTabelaProd1Op1.Caption :=
        'Cod Tabela: ' + IntToStr(Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsInteger);
      lbDelTabelaProd1Op2.Caption :=
        'Tabela: ' + trim(Produto.vPromocaoProduto.dataSet.FieldByName('DESCRICAO').AsString);
    end;

    lbDelTabelaProd1Op3.Caption :=
      'Sigla: ' + Produto.vPromocaoProduto.retornaSigla(trim(Produto.vPromocaoProduto.dataSet.FieldByName('SIGLA').AsString));

    lbDelTabelaProd1Op4.Caption :=
      Copy('Para todos produtos selecionados?', 1, 50);

    if Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsInteger = 1 then
    begin
      lbDelTabelaProd2Op1.Caption :=
        'Cod Promoção: ' + IntToStr(Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsInteger);
      lbDelTabelaProd2Op2.Caption :=
        'Promoção: ' + trim(Produto.vPromocaoProduto.dataSet.FieldByName('DESCRICAO').AsString);
    end
    else if Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsInteger = 2 then
    begin
      lbDelTabelaProd2Op1.Caption :=
        'Cod Localidade: ' + IntToStr(Produto.vPromocaoProduto.dataSet.FieldByName('COD_LOCALIDADE').AsInteger);
      lbDelTabelaProd2Op2.Caption :=
        'Localidade: ' + trim(Produto.vPromocaoProduto.dataSet.FieldByName('DESCRICAO').AsString);
    end
    else if Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsInteger = 3 then
    begin
      lbDelTabelaProd2Op1.Caption :=
        'Cod Setor: ' + IntToStr(Produto.vPromocaoProduto.dataSet.FieldByName('COD_SETOR').AsInteger);
      lbDelTabelaProd2Op2.Caption :=
        'Setor: ' + trim(Produto.vPromocaoProduto.dataSet.FieldByName('DESCRICAO').AsString);
    end
    else if Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsInteger = 4 then
    begin
      lbDelTabelaProd2Op1.Caption :=
        'Cod Cidade: ' + IntToStr(Produto.vPromocaoProduto.dataSet.FieldByName('COD_CIDADE').AsInteger);
      lbDelTabelaProd2Op2.Caption :=
        'Cidade: ' + trim(Produto.vPromocaoProduto.dataSet.FieldByName('DESCRICAO').AsString);
    end
    else
    begin
      lbDelTabelaProd2Op1.Caption :=
        'Cod Tabela: ' + IntToStr(Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsInteger);
      lbDelTabelaProd2Op2.Caption :=
        'Tabela: ' + trim(Produto.vPromocaoProduto.dataSet.FieldByName('DESCRICAO').AsString);
    end;

    lbDelTabelaProd2Op3.Caption :=
      'Sigla: ' + Produto.vPromocaoProduto.retornaSigla(trim(Produto.vPromocaoProduto.dataSet.FieldByName('SIGLA').AsString));
    lbDelTabelaProd2Op4.Caption :=
      'Grupo Prod: ' + IntToStr(Produto.vPromocaoProduto.dataSet.FieldByName('GRUPO_PROD').AsInteger);
    lbDelTabelaProd2Op5.Caption :=
      'Cod Prod: ' + trim(Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROD').AsString);
    lbDelTabelaProd2Op6.Caption :=
      'Num Fab Prod: ' + trim(Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString);
    lbDelTabelaProd2Op7.Caption :=
      Copy('Descr Prod: ' + trim(Produto.dataSet.FieldByName('DESCR_PROD').AsString), 1, 50);
    lbDelTabelaProd2Op8.Caption :=
      Copy('Para este produto?', 1, 50);

    RadioButtonDelTabelaProdOp1.Checked := true;
    if not vDadosIni.abreForm('Deseja remover preço diferenciado?', pnDelTabelaProd, [ofAutoSize, ofEscapeExit]) then
      exit;

    if RadioButtonDelTabelaProdOp1.Checked then
    begin
      if not (Produto.vPromocaoProduto.DeletePrecoProduto(Produto.dataSet)) then
        exit;
    end
    else
    begin
      if not (Produto.vPromocaoProduto.DeletePrecoProduto(False)) then
        exit;
    end;

    if Produto.dataSet.IsEmpty then
      Produto.vPromocaoProduto._abrePrecoProdutos('0', '0', '0')
    else
      Produto.vPromocaoProduto._abrePrecoProdutos(
        Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
        Produto.dataSet.FieldByName('COD_PROD').AsString, '');
  finally
  	DBGrid1.Visible   := True;
    DBGrid28.Visible  := True;
  end;
end;

procedure TFrmCadProdutos.BitBtn112Click(Sender: TObject);
begin
  vDadosIni.vtpPreco := 'T';
  if not (Produto.vPromocaoProduto.Edit) then
    exit;

  if Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsInteger = 2 then
  begin
    DBLookupComboBox9.KeyValue := 2;
    EditHw6.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('COD_LOCALIDADE').AsInteger;
    Produto.vRegiao._abreRegiao(DBLookupComboBox9.Text);
    DBLookupComboBox8.KeyValue := Produto.vPromocaoProduto.dataSet.FieldByName('COD_LOCALIDADE').AsInteger;
    Label235.Caption := 'Localidade:';
  end
  else if Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsInteger = 3 then
  begin
    DBLookupComboBox9.KeyValue := 3;
    EditHw6.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('COD_SETOR').AsInteger;
    Produto.vRegiao._abreRegiao(DBLookupComboBox9.Text);
    DBLookupComboBox8.KeyValue := Produto.vPromocaoProduto.dataSet.FieldByName('COD_SETOR').AsInteger;
    Label235.Caption := 'Setor:';
  end
  else if Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsInteger = 4 then
  begin
    DBLookupComboBox9.KeyValue := 4;
    EditHw6.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('COD_CIDADE').AsInteger;
    Produto.vRegiao._abreRegiao(DBLookupComboBox9.Text);
    DBLookupComboBox8.KeyValue := Produto.vPromocaoProduto.dataSet.FieldByName('COD_CIDADE').AsInteger;
    Label235.Caption := 'Cidade:';
  end
  else if Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsInteger > 0 then
  begin
    DBLookupComboBox9.KeyValue := 5;
    EditHw6.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsInteger;
    Produto.vRegiao._abreRegiao(DBLookupComboBox9.Text);
    DBLookupComboBox8.KeyValue := Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsInteger;
    Label235.Caption := 'Tabela:';
  end;

  EditHw4.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('VALOR_PROMOCAO').AsFloat;
  EditHw5.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('PORCENTAGEM').AsFloat;
  EditHw8.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('MAX_DESC').AsFloat;
  DBLookupComboBox8.Enabled := false;
  DBLookupComboBox9.Enabled := false;
  CheckBox21.Checked := false;
  EditHw8.Enabled := false;
  EditHw6.Enabled := false;
  EditHw4.Enabled := false;
  EditHw5.Enabled := false;
  BitBtn115.Enabled := false;
  PageControl9.ActivePage := TabSheet14;
end;

procedure TFrmCadProdutos.BitBtn113Click(Sender: TObject);
var
	I: Integer;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_PRECOS_DIFERENCIADOS', 'A', Produto.buscas) then
    Exit;
  vDadosIni.vtpPreco := 'T';   
  if not (Produto.vPromocaoProduto.Edit) then
    exit;

  if Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsInteger = 2 then
  begin
    DBLookupComboBox9.KeyValue := 2;
    EditHw6.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('COD_LOCALIDADE').AsInteger;
    Produto.vRegiao._abreRegiao(DBLookupComboBox9.Text);
    DBLookupComboBox8.KeyValue := Produto.vPromocaoProduto.dataSet.FieldByName('COD_LOCALIDADE').AsInteger;
    Label235.Caption := 'Localidade:';
  end
  else if Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsInteger = 3 then
  begin
    DBLookupComboBox9.KeyValue := 3;
    EditHw6.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('COD_SETOR').AsInteger;
    Produto.vRegiao._abreRegiao(DBLookupComboBox9.Text);
    DBLookupComboBox8.KeyValue := Produto.vPromocaoProduto.dataSet.FieldByName('COD_SETOR').AsInteger;
    Label235.Caption := 'Setor:';
  end
  else if Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsInteger = 4 then
  begin
    DBLookupComboBox9.KeyValue := 4;
    EditHw6.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('COD_CIDADE').AsInteger;
    Produto.vRegiao._abreRegiao(DBLookupComboBox9.Text);
    DBLookupComboBox8.KeyValue := Produto.vPromocaoProduto.dataSet.FieldByName('COD_CIDADE').AsInteger;
    Label235.Caption := 'Cidade:';
  end
  else if Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsInteger > 0 then
  begin
    DBLookupComboBox9.KeyValue := 5;
    EditHw6.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsInteger;
    Produto.vRegiao._abreRegiao(DBLookupComboBox9.Text);
    DBLookupComboBox8.KeyValue := Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsInteger;
    Label235.Caption := 'Tabela:';
  end;

  EditHw4.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('VALOR_PROMOCAO').AsFloat;
  EditHw5.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('PORCENTAGEM').AsFloat;
  EditHw8.AsValue := Produto.vPromocaoProduto.dataSet.FieldByName('MAX_DESC').AsFloat;
  DBLookupComboBox8.Enabled := false;
  DBLookupComboBox9.Enabled := false;
  CheckBox21.Checked := false;
  EditHw6.Enabled := false;
  EditHw4.Enabled := true;
  EditHw5.Enabled := true;
  EditHw8.Enabled := true;
  BitBtn115.Enabled := true;
  edMarukpMargem.DataField := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'MARGEM', 'MARKUP');
  lbMakupMargem.Caption := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'Margem:', 'Markup:');

  if Produto.vPromocaoProduto.dataSet.FieldByName('MARKUP').AsFloat = 0 then
  begin
  	EditHw5.Enabled := false;
		btHabPercentProdTabPreco.Visible := true;
  	edMarukpMargem.Enabled := true;
  	btHabMarkupProdTabPreco.Visible := false;
  end
  else
  begin
  	EditHw5.Enabled := true;
		btHabPercentProdTabPreco.Visible := false;
  	edMarukpMargem.Enabled := false;
  	btHabMarkupProdTabPreco.Visible := true;
  end;

  btHabDebCredTab.Visible := True;
  DBComboBox17.Enabled := not btHabDebCredTab.Visible;

  if trim(Produto.vPromocaoProduto.dataSet.FieldByName('USAR_DEBCRED').AsString) <> '' then
  begin
    for I := 0 to DBComboBox17.Items.Count - 1 do
      if Copy(DBComboBox17.Items[I], 1, 1) = Produto.vPromocaoProduto.dataSet.FieldByName('USAR_DEBCRED').AsString then
      begin
        DBComboBox17.ItemIndex := I;
        Break;
      end;
  end
  else
    DBComboBox17.ItemIndex := -1;

  PageControl9.ActivePage := TabSheet14;

  if (Self.Enabled) and (Self.Visible) and (EditHw4.CanFocus) then
    EditHw4.SetFocus
end;

procedure TFrmCadProdutos.BitBtn114Click(Sender: TObject);
var
	grupo_prod, cod_prod, num_fab_prod: string;
begin
  inherited;
  grupo_prod := Produto.dataSet.FieldByName('GRUPO_PROD').AsString;
  cod_prod := Produto.dataSet.FieldByName('COD_PROD').AsString;
  num_fab_prod := Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString;
  
  Produto.pIndex := TClientDataSet(DBGrid1.DataSource.DataSet).IndexName;
  BitBtn93.Enabled := true;
  Produto.vPromocaoProduto.Cancel;
  Produto.vPromocaoProduto.RollBackTransacao;

  EditHw4.Enabled := true;
  EditHw5.Enabled := true;

  Produto.montaSelect(Produto.ultimasql);
  Produto._retornarIndice;

  Produto.vPromocaoProduto._abrePrecoProdutos(Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
    Produto.dataSet.FieldByName('COD_PROD').AsString);

  Produto.IndexFieldNames := 'GRUPO_PROD;COD_PROD';
  Produto.FindNearest([grupo_prod, cod_prod]);

  PageControl9.ActivePage := TabSheet13;
end;

procedure TFrmCadProdutos.BitBtn115Click(Sender: TObject);
var
  grupo_prod, cod_prod, num_fab_prod, cod_promocao, sigla, debcred: string;
  cod_tipo, tipo : Integer;
  vtipo, tabela: string;
  valor, percentual, markup, max_desc: Double;
begin
	try
  	if (Self.Enabled) and (Self.Visible) and (BitBtn115.CanFocus) then
      BitBtn115.SetFocus;

    DBGrid1.Visible   := False;
    DBGrid28.Visible  := False;
    BitBtn115.Enabled := False;
    BitBtn114.Enabled := False;

    vDadosIni.vtpPreco := 'T';
    if Trim(DBLookupComboBox9.Text) = 'AVULSO' then
      cod_promocao := EditHw6.AsString
    else
      cod_promocao := '0';
    vTipo := Trim(DBLookupComboBox9.Text);
    grupo_prod := Produto.dataSet.FieldByName('GRUPO_PROD').AsString;
    cod_prod := Produto.dataSet.FieldByName('COD_PROD').AsString;
    num_fab_prod := Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString;
    tipo := DBLookupComboBox9.KeyValue;
    if DBLookupComboBox8.Text <> '' then
     cod_tipo := DBLookupComboBox8.KeyValue;
    sigla := '0';
    valor := EditHw4.AsValue;
    percentual := EditHw5.AsValue;
    max_desc := EditHw8.AsValue;
    markup := Produto.vPromocaoProduto.ffloat('markup');
    tabela := Trim(DBLookupComboBox9.Text);
    debcred := vDadosIni.IfThen(not DBComboBox17.Enabled, '', vDadosIni.IfThen(DBComboBox17.ItemIndex <= 0, 'Z', Copy(DBComboBox17.Text, 1, 1)));

    if not CheckBox21.Checked then
    begin
      if promocao_prod = '' then
      begin
        if not Produto.vPromocaoProduto.postPrecoDif(
          StrToInt(cod_promocao),
          cod_tipo,
          tipo,
          valor,
          percentual,
          max_desc,
          markup,
          debcred,
          sigla,
          Produto,
          cod_promocao,
          tabela) then
        begin
          vDadosIni.fechaStatusProcessamento;
          setFocusCampoErro(Produto.vPromocaoProduto.vNomeCampoErro);
          exit;
        end;
      end
      else
      begin
        if not Produto.vPromocaoProduto.postPrecoDif(
          StrToInt(cod_promocao),
          cod_tipo,
          tipo,
          valor,
          percentual,
          max_desc,
          markup,
          debcred,
          sigla,
          Produto,
          cod_promocao,
          tabela) then
        begin
          vDadosIni.fechaStatusProcessamento;
          setFocusCampoErro(Produto.vPromocaoProduto.vNomeCampoErro);
          exit;
        end;
      end;
      BitBtn114.Enabled := true;
      GroupBox3.Enabled := true;
      EditHw6.Enabled := true;
      DBLookupComboBox8.Enabled := true;
      CheckBox21.Checked := false;
      CheckBox21.Enabled := true;
      Label234.Enabled := true;

      Produto.montaSelect(Produto.ultimasql);
      Produto._retornarIndice;

      Produto.vPromocaoProduto._abrePrecoProdutos(
        grupo_prod,
        cod_prod,
        cod_promocao);

      Produto.IndexFieldNames := 'GRUPO_PROD;COD_PROD';
      Produto.FindNearest([grupo_prod, cod_prod]);

      PageControl9.ActivePage := TabSheet13;

    end
    else
    begin // Cadastro sequencial
      if (Produto.dataSet.FieldByName('SEL').AsString = 'S') then
      begin
        Produto.dataSet.Edit;
        Produto.dataSet.FieldByName('SEL').AsString := '';
        Produto.dataSet.Post;
      end;

      if (Produto.dataSet.FieldByName('SEL').AsString = '') then
      begin
        Produto.vPromocaoProduto._abrePrecoProdutos(grupo_prod, cod_prod);

        if not (Produto.vPromocaoProduto.Insert) then
          exit;

        //Marcar Linha
        Produto._marcaLinha;

        if not Produto.vPromocaoProduto.postPrecoDifS(
          StrToInt(cod_promocao),
          cod_tipo,
          tipo,
          valor,
          percentual,
          max_desc,
          markup,
          debcred,
          sigla,
          grupo_prod,
          cod_prod,
          Produto,
          cod_promocao,
          tabela) then
        begin
          vDadosIni.fechaStatusProcessamento;
          setFocusCampoErro(Produto.vPromocaoProduto.vNomeCampoErro);
          BitBtn93.Enabled := true;
          Produto.vPromocaoProduto.Cancel;
          Produto.vPromocaoProduto.RollBackTransacao;

          GroupBox3.Enabled := true;
          EditHw6.Enabled := true;
          DBLookupComboBox8.Enabled := true;
          DBLookupComboBox9.Enabled := true;
          EditHw4.Enabled := true;
          EditHw5.Enabled := true;

          Produto.montaSelect(Produto.ultimasql);
          Produto._retornarIndice;

          Produto.vPromocaoProduto._abrePrecoProdutos(
            Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
            Produto.dataSet.FieldByName('COD_PROD').AsString,
            Produto.dataSet.FieldByName('COD_PROMOCAO').AsString);

          PageControl9.ActivePage := TabSheet13;

          exit;
        end;

        Produto.Next;

        // Se chegar no fim cancela a inserção
        if (Produto.dataSet.FieldByName('SEL').AsString <> '') then
        begin
          BitBtn93.Enabled := true;
          Produto.vPromocaoProduto.Cancel;
          Produto.vPromocaoProduto.RollBackTransacao;

          GroupBox3.Enabled := true;
          EditHw6.Enabled := true;
          DBLookupComboBox8.Enabled := true;
          DBLookupComboBox9.Enabled := true;
          EditHw4.Enabled := true;
          EditHw5.Enabled := true;

          Produto.montaSelect(Produto.ultimasql);
          Produto._retornarIndice;

          Produto.vPromocaoProduto._abrePrecoProdutos(
            Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
            Produto.dataSet.FieldByName('COD_PROD').AsString);

          PageControl9.ActivePage := TabSheet13;

          promocao_prod := '';
          exit;
        end;
        EditHw4.AsValue := 0;
        EditHw5.AsValue := 0;

        Produto.vPromocaoProduto.Insert;
        Produto.vTipoPreco._abreTipoPrecoTabela;
        Produto.vRegiao._abreRegiao(vTipo);

        if Trim(vTipo) = 'LOCALIDADE' then
        begin
          DBLookupComboBox8.DataField := 'COD_LOCALIDADE';
          Label235.Caption := 'Localidade';
        end
        else if Trim(vTipo) = 'SETOR' then
        begin
          DBLookupComboBox8.DataField := 'COD_SETOR';
          Label235.Caption := 'Setor';
        end
        else if Trim(vTipo) = 'CIDADE' then
        begin
          DBLookupComboBox8.DataField := 'COD_CIDADE';
          Label235.Caption := 'Cidade';
        end
        else if Trim(DBLookupComboBox9.Text) = 'AVULSO' then
        begin
          DBLookupComboBox8.DataField := 'COD_PROMOCAO';
          Label235.Caption := 'Tabela:';
        end;;

        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox9.CanFocus) then
          DBLookupComboBox9.SetFocus;
      end;
    end;
  finally
  	DBGrid1.Visible  := True;
    DBGrid28.Visible  := True;
    BitBtn115.Enabled := True;
    BitBtn114.Enabled := True;
  end;
end;

procedure TFrmCadProdutos.BitBtn116Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_TRIBUTACAO_ADICIONAL', 'I', Produto.buscas) then
    Exit;

  if not vDadosIni.PesqPros('PRO266', 'INCLUIR', '', 'PRODUTOS_TRIB_AD',
    Produto.dataSet.FieldByName('GRUPO_PROD').AsString + ' - ' +
    Produto.dataSet.FieldByName('COD_PROD').AsString,
    Produto.buscas, true) then
    exit;

  try
    Screen.Cursor := crHourGlass;
//    if not Produto.vProdutosTribAd.Insert then
//      Exit;

    if not Produto.vProdutosTribAd.vPerfAd._abreFormPerfisAtivos then
      Exit;

    if not Produto.vProdutosTribAd.inserirDoPerfilSelecionado then
      Exit;

  finally
    Produto.vProdutosTribAd.dataSet.Cancel;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn117Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_TRIBUTACAO_ADICIONAL', 'E', Produto.buscas) then
    Exit;
  if not vDadosIni.PesqPros('PRO268', 'EXCLUIR', '', 'PRODUTOS_TRIB_AD',
    Produto.dataSet.FieldByName('GRUPO_PROD').AsString + ' - ' +
    Produto.dataSet.FieldByName('COD_PROD').AsString,
    Produto.buscas, true) then
    exit;
  Produto.vProdutosTribAd.Delete;
end;

procedure TFrmCadProdutos.BitBtn118Click(Sender: TObject);
var
  vRecNo: Integer;
begin
  inherited;

//  if Application.MessageBox(PChar('A alteração de estoque somente é permitda 1 vez no dia por mercadoria.' + #13 +
//    'Esta operação não poderá ser desfeita' + #13 +
//    'Deseja continuar mesmo assim?'), 'Atenção', MB_ICONWARNING + MB_YESNO) <> IDYES then
//    Exit;

  Produto.vGradeEst._alterarEstoque(produto);

  BitBtn74.Enabled := True;
  BitBtn75.Enabled := True;
  BitBtn79.Enabled := True;
  DBGrid14.Enabled := True;
  BitBtn74.Enabled := True;
  BitBtn74.Enabled := True;
  BitBtn118.Enabled := False;

  vRecNo := Produto.dataSet.RecNo;

  Produto.dataSet.Refresh;

  Produto.dataSet.RecNo := vRecNo;

  Label170.Caption := Format('%0.2f', [
    Produto.dataSet.FieldByName('est_f').AsFloat]);

  Label208.Caption := Format('%0.2f', [
    vDadosIni.getEstoqueDisponivel(Produto.buscas,
    	Produto.dataSet.FieldByName('grupo_prod').AsInteger,
      	Produto.dataSet.FieldByName('cod_prod').AsString)]);

  Label495.Caption := Format('%0.2f', [
  	vDadosIni.getEstoquePrima(Produto.buscas,
  		Produto.dataSet.FieldByName('grupo_prod').AsInteger,
	    	Produto.dataSet.FieldByName('cod_prod').AsString)]);

  Label494.Visible := (Produto.dataSet.FieldByName('criar_producao_aut').AsString = 'S')
  	and (vDadosIni.vEmp.vUsarProducao = 'S');

	Label495.Visible := (Produto.dataSet.FieldByName('criar_producao_aut').AsString = 'S')
  	and (vDadosIni.vEmp.vUsarProducao = 'S');

  vRecNo := Produto.vGradeEst.dataSet.RecNo;
  Produto.vGradeEst.abreGradeEstoque(Produto.dataSet.FieldByName('grupo_prod').AsString,
    Produto.dataSet.FieldByName('cod_prod').AsString);
  Produto.vGradeEst.vGrade.dataSet.Filtered := false;
  Produto.vGradeEst.vGrade.dataSet.Filter := ' cod_grade<>0 ';
  Produto.vGradeEst.vGrade.dataSet.Filtered := true;
  Produto.vGradeEst.dataSet.RecNo := vRecNo;
end;

procedure TFrmCadProdutos.BitBtn119Click(Sender: TObject);
begin
  inherited;
  TForm(pnGradesEst.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.BitBtn11Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO020', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
  begin
    DBEdit76.Enabled := false;
    DBCheckBox1.Enabled := false;
  end
  else
  begin
    DBEdit76.Enabled := true;
    DBCheckBox1.Enabled := true;
  end;
end;

procedure TFrmCadProdutos.BitBtn120Click(Sender: TObject);
var
  vAcaoExcel: string;
begin
  inherited;
  vDadosIni.montarExcel(DBGrid35, 'Ficha do Produto/Entradas/Saída' + vPeriodo);
//  vDadosIni.montarExcel(DBGrid4, 'Ficha do Produto/Entradas/Compras' + vPeriodo, 'A');
//  if DBGrid20.Visible then
//    vDadosIni.montarExcel(DBGrid20, 'Ficha do Produto/Entradas/Produção' + vPeriodo, 'N');
//  vDadosIni.montarExcel(DBGrid32, 'Ficha do Produto/Entradas/Devoluções' + vPeriodo, 'N');
//  if DBGrid21.Visible then
//    vAcaoExcel := 'N'
//  else
//    vAcaoExcel := 'F';
//  vDadosIni.montarExcel(DBGrid5, 'Ficha do Produto/Saídas/Vendas' + vPeriodo, vAcaoExcel);
//  if DBGrid21.Visible then
//    vDadosIni.montarExcel(DBGrid21, 'Ficha do Produto/Saídas/Produção' + vPeriodo, 'F');
end;

procedure TFrmCadProdutos.BitBtn121Click(Sender: TObject);
begin
  inherited;
  try
    vRelProducaoEst := TRelControleProducaoEstoque.Create;

    if vRelProducaoEst._iniciarRelatorio(
      Produto.dataSet.FieldByName('grupo_prod').AsInteger,
      Produto.dataSet.FieldByName('cod_prod').AsString,
      MaskEdit19.Text,
      MaskEdit21.Text) then
    begin
      TFloatField(vRelProducaoEst.Buscas.FieldByName('QUANTIDADE')).DisplayFormat := '#0.000';
      TFloatField(vRelProducaoEst.Buscas.FieldByName('VALOR')).DisplayFormat := '#0.00';
      TFloatField(vRelProducaoEst.Buscas.FieldByName('IPI')).DisplayFormat := '#0.00';
      qkRProducaoEstoque.DataSet := vRelProducaoEst.Buscas;
      QRDBText72.DataSet := Produto.dataSet;
      QRDBText11.DataSet := Produto.dataSet;
      QRDBText70.DataSet := Produto.dataSet;
      QRDBText73.DataSet := vRelProducaoEst.Buscas;
      QRDBText74.DataSet := vRelProducaoEst.Buscas;
      QRDBText75.DataSet := vRelProducaoEst.Buscas;
      QRDBText76.DataSet := vRelProducaoEst.Buscas;
      QRDBText77.DataSet := vRelProducaoEst.Buscas;
      QRDBText78.DataSet := vRelProducaoEst.Buscas;
      QRDBText79.DataSet := vRelProducaoEst.Buscas;
      QRDBText80.DataSet := vRelProducaoEst.Buscas;
      QRDBText81.DataSet := vRelProducaoEst.Buscas;
      QRDBText82.DataSet := vRelProducaoEst.Buscas;
      QRDBText83.DataSet := vRelProducaoEst.Buscas;
      QRDBText84.DataSet := vRelProducaoEst.Buscas;

      QRDBText72.DataField := 'DESCR_PROD';
      QRDBText11.DataField := 'UNIDADE';
      QRDBText70.DataField := 'NBM';
      QRDBText73.DataField := 'ESPECIE';
      QRDBText74.DataField := 'SERIE';
      QRDBText75.DataField := 'NUM_NF';
      QRDBText76.DataField := 'DATA';
      QRDBText77.DataField := 'DIA';
      QRDBText78.DataField := 'CONTABIL';
      QRDBText79.DataField := 'FISCAL';
      QRDBText80.DataField := 'E_S';
      QRDBText81.DataField := 'COD';
      QRDBText82.DataField := 'QUANTIDADE';
      QRDBText83.DataField := 'VALOR';
      QRDBText84.DataField := 'IPI';


      QRLabel171.Tag := 0;
      qkRProducaoEstoque.Prepare;
      QRLabel171.Tag := 1;
      qkRProducaoEstoque.Preview;
    end;
  finally
    QRDBText72.DataSet := nil;
    QRDBText11.DataSet := nil;
    QRDBText70.DataSet := nil;
    QRDBText73.DataSet := nil;
    QRDBText74.DataSet := nil;
    QRDBText75.DataSet := nil;
    QRDBText76.DataSet := nil;
    QRDBText77.DataSet := nil;
    QRDBText78.DataSet := nil;
    QRDBText79.DataSet := nil;
    QRDBText80.DataSet := nil;
    QRDBText81.DataSet := nil;
    QRDBText82.DataSet := nil;
    QRDBText83.DataSet := nil;
    QRDBText84.DataSet := nil;
    qkRProducaoEstoque.DataSet := nil;

    vRelProducaoEst.free;
    vRelProducaoEst:= nil;
  end;
end;

procedure TFrmCadProdutos.BitBtn122Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO281', 'PERMISSAO', '', 'PRODUTOS', '', Produto.buscas, True) then
    Exit;
  montarArquivosBuscaPreco(pchar(vDadosIni.vBancoHW), pchar(vDadosIni.codEmpresa), True);
end;

procedure TFrmCadProdutos.BitBtn123Click(Sender: TObject);
begin
  inherited;
  TForm(pnEscolhaPerfil.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.BitBtn124Click(Sender: TObject);
begin
  inherited;
  TForm(pnEscolhaPerfil.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtn125Click(Sender: TObject);
var
 vOK: boolean;
begin
  try
    vOK := false;
    BitBtn127.Enabled := False;
    label393.Caption := format('%0.4f', [0.0000]);
    label394.Caption := format('%0.4f', [0.0000]);
    Label396.Caption := format('%0.4f', [0.0000]);
    Label397.Caption := format('%0.4f', [0.0000]);
    Label398.Caption := format('%0.4f', [0.0000]);
    Screen.Cursor := crHourGlass;
    vPeriodoC := ' de ' + MaskEdit27.Text + ' a ' + MaskEdit28.Text;
    if not Produto.abrirComprasEVendasC(MaskEdit27.Text, MaskEdit28.Text) then
    begin
      if (Self.Enabled) and (Self.Visible) and (MaskEdit27.CanFocus) then
        MaskEdit27.SetFocus;
    end
    else
    begin
      vOK := true;
      BitBtn127.Enabled := True;
      Label393.Caption := format('%0.4f', [Produto.qtdentradaC]);
      Label394.Caption := format('%0.4f', [Produto.qtdsaidaC]);
 //      Label396.Caption := format('%0.4f', [Produto.qtdentradaCEst]);
//      Label397.Caption := format('%0.4f', [Produto.qtdsaidaCEst]);
      Label396.Caption := format('%0.4f', [Produto.qtdentradaConf]);
      Label397.Caption := format('%0.4f', [Produto.qtdSaidaConf]);
      Label398.Caption := format('%0.4f', [Produto.qtdOrcC]);
      if (Self.Enabled) and (Self.Visible) and (DBGrid39.CanFocus) then
        DBGrid39.SetFocus;
    end;
    ckEstoqueDiarioCClick(Sender);
    if vOK then
      if not aplicarFiltros then
        exit;
  finally
    MudaCor;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn126Click(Sender: TObject);
begin
  inherited;
  Produto.cdsEstoqueDiarioC.AfterScroll := nil;
  Produto.fecharUltimasCompras;
  Produto.fecharComprasEVendas;
  PageControl1.ActivePage := TabSheet2;
  if DBGrid1.Visible then
  	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	    DBGrid1.SetFocus;
end;

procedure TFrmCadProdutos.BitBtn127Click(Sender: TObject);
var
  vAcaoExcel: string;
begin
  inherited;
  vDadosIni.montarExcel(DBGrid39, tsFichaComprasVendasC.Caption + vPeriodoC);
end;

procedure TFrmCadProdutos.BitBtn128Click(Sender: TObject);
begin
  try
    if (Self.Enabled) and (Self.Visible) and (BitBtn128.CanFocus) then
  	  BitBtn128.SetFocus;
    if not Produto.vProdutosPrecoQtde.Post(Produto.dataset) then
    begin
      setFocusCampoErro(Produto.vProdutosPrecoQtde.vNomeCampoErro, Produto.vProdutosPrecoQtde.vMensagemErro);
      exit;
    end;
    TForm(Panel61.Parent).ModalResult := IDOK;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadProdutos.BitBtn129Click(Sender: TObject);
begin
  Produto.vProdutosPrecoQtde.Cancel;
  Produto.vProdutosPrecoQtde.RollBackTransacao;
  TForm(Panel61.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtn12Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO016', 'DELETAR', '', 'PRODUTOS',
    Produto.CodBarra.dataSet.FieldByName('COD_BARRA').AsString, Produto.buscas, true) then
    Exit;

  if (trim(Produto.CodBarra.dataSet.FieldByName('COD_BARRA').AsString) =
    trim(Produto.dataSet.FieldByName('NUM_FAB_PROD').NewValue)) then
    Application.MessageBox('Código de barras igual ao número de fabricação do produto.' +
      chr(13) + 'Este código de barras não pode ser deletado.', 'Informação', MB_OK +
      MB_ICONINFORMATION + MB_DEFBUTTON1)
  else if Application.MessageBox('Tem certeza que deseja excluir este registro?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
  begin
    vDadosIni.GravaAuditoria('PRO016', 'EXCLUINDO', 'SUCESSO', 'PRODUTOS',
      Produto.CodBarra.dataSet.FieldByName('COD_BARRA').AsString, produto.buscas);
    Produto.CodBarra.Delete;
  end;
end;

procedure TFrmCadProdutos.btnOKAlterarDadosCAClick(Sender: TObject);
var
  HTMLDocument: IHTMLDocument2;
begin
  if not vDadosIni.PesqPros('PRO377', 'SALVAR', '', 'PRODUTOS_EC',
     Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
     Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true) then
    Exit;

  if (Self.Enabled) and (Self.Visible) and (btnOKAlterarDadosCA.CanFocus) then
	  btnOKAlterarDadosCA.SetFocus;
  HTMLDocument := WebBrowserCA.Document as IHTMLDocument2;
  Produto.vProdutosEC.dataSet.FieldByName('DESCR_PROD_COMPL').AsString := HTMLDocument.body.innerHTML;
  if not Produto.vProdutosEC.Post('C', pnDadosCA.Tag = 99) then 
  begin
    setFocusCampoErro(Produto.vProdutosEC.vNomeCampoErro, Produto.vProdutosEC.vMensagemErro);
    exit;
  end;
  TForm(pnDadosCA.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.btnOKAlterarDadosECClick(Sender: TObject);
var
  HTMLDocument: IHTMLDocument2;
  I: Integer;
begin
  if not vDadosIni.PesqPros('PRO312', 'SALVAR', '', 'PRODUTOS_EC',
     Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
     Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true) then
    Exit;

  if not Produto.vProdutosEC.verificarTipoGradesEC then
    Exit;

  if (trim(Produto.dataSet.FieldByName('TIPO_ITEM').AsString) <> '04') // Produto não é acabado
    and (vDadosIni.vEcommerce.vHabilitarEcommerce) // E-Commerce configurado
	  and (not vDadosIni.vEcommerce.vControleEstManualECommerce) // Estoque manual E-Commerce
  	and (not Produto.vIndTec.dataSet.IsEmpty) // Existe materias primas
    and (not Produto.vProdutosEC.dataSet.IsEmpty) // Existe dados do E-Commerce
    and (Produto.vProdutosEC.dataSet.FieldByName('sinc_ecommerce').AsString = 'S') // Produto definido para E-Commerce
    and (Produto.vProdutosEC.dataSet.FieldByName('disponivel').AsString = 'S') // Produto disponivel E-Commerce
    and ((trim(vSincronizarEcommerce) <> trim(Produto.vProdutosEC.dataSet.FieldByName('SINC_ECOMMERCE').AsString))
      or (trim(vDisponivelEcomerce) <> trim(Produto.vProdutosEC.dataSet.FieldByName('DISPONIVEL').AsString))) then
  begin
    if Application.MessageBox('Produto definido para sincronizar no E-Commerce, ' +
     'deseja mudar o tipo de item do produto para acabado?' + #13 + #13 +
     'Caso informe sim os estoques das matérias primas/insumo/embalagens será adicionado ao estoque do produto acabado no E-Commerce.',
     'Atenção', MB_YESNO + MB_ICONQUESTION +
      MB_DEFBUTTON2) = mrYES then
    begin
      if not (Produto.dataSet.State in [dsInsert, dsEdit]) then
        Produto.dataSet.Edit;
      Produto.dataSet.FieldByName('TIPO_ITEM').AsString := '04';

      for I := 0 to DBComboBox11.Items.Count - 1 do
        if (trim(DBComboBox11.Items[i]) = '04') then
          DBComboBox11.ItemIndex := i;
    end;
  end;

  if (Self.Enabled) and (Self.Visible) and (btnOKAlterarDadosEC.CanFocus) then
    btnOKAlterarDadosEC.SetFocus;
  HTMLDocument := WebBrowserEC.Document as IHTMLDocument2;
  Produto.vProdutosEC.dataSet.FieldByName('DESCR_PROD_COMPL').AsString := HTMLDocument.body.innerHTML;
  if not Produto.vProdutosEC.Post('E', pnDadosEC.Tag = 99) then
  begin
    setFocusCampoErro(Produto.vProdutosEC.vNomeCampoErro, Produto.vProdutosEC.vMensagemErro);
    exit;
  end;

  if (Produto.dataSet.FieldByName('ID_COMMERCE').AsInteger > 0)
    and (Produto.vProdutosEC.dataSet.FieldByName('SINC_ECOMMERCE').AsString = 'N') then
  begin
  	if not (Produto.dataSet.State in [dsInsert, dsEdit]) then
    	Produto.dataSet.Edit;
    Produto.dataSet.FieldByName('ID_COMMERCE').Value := Null;
  end;
  
  TForm(pnDadosEC.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.btnCancAlterarDadosCAClick(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (btnCancAlterarDadosCA.CanFocus) then
	  btnCancAlterarDadosCA.SetFocus;
  Produto.vProdutosEC.Cancel;
  Produto.vProdutosEC.RollBackTransacao;
  TForm(pnDadosCA.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.btnCancAlterarDadosECClick(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (btnCancAlterarDadosEC.CanFocus) then
		btnCancAlterarDadosEC.SetFocus;
  Produto.vProdutosEC.Cancel;
  Produto.vProdutosEC.RollBackTransacao;
  TForm(pnDadosEC.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtn130Click(Sender: TObject);
var
	vTemp: string;
begin
  inherited;
	if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_INSUMOS', 'E', Produto.buscas) then
    Exit;

  if Produto.vIndTec.dataSet.IsEmpty then
  	exit;

  if not vDadosIni.PesqPros('ITEC005', 'EDITAR', '', 'INDICE_TECNICO', '', Produto.buscas, true) then
   	Exit;

  if Produto.vIndTec.dataSet.FieldByName('quant').AsFloat > 0 then
		vTemp := FloatToStr(Produto.vIndTec.dataSet.FieldByName('quant').AsFloat)
  else
  	vTemp := '0';

  if not InputQuery('Informe um Valor', 'Informe a quantidade deste item. Ex: 5,6', vTemp) then
  	exit;

  try
    StrToFloat(vTemp);
  except
    Application.MessageBox('Quantidade inválida', 'Atenção', 0 + 64);
    Exit;
  end;

  if (StrToFloat(vTemp) <= 0) then
  begin
    Application.MessageBox('Quantidade não informada', 'Atenção', 0 + 64);
    Exit;
  end;

	if not Produto.AlterarInsumoOutroProd(StrToFloat(vTemp)) then
  	Exit;
end;

procedure TFrmCadProdutos.BitBtn131Click(Sender: TObject);
begin
  inherited;

  if not Produto.FretePorPeso.Insert then
  	exit;

  pageFretePeso.ActivePage := tsFretePesoCadastro;
  if (Self.Enabled) and (Self.Visible) and (edFreteCodCliente.CanFocus) then
    edFreteCodCliente.SetFocus;
end;

procedure TFrmCadProdutos.BitBtn132Click(Sender: TObject);
begin
  TForm(pnGradesImagens.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.BitBtn133Click(Sender: TObject);
begin
  TForm(pnGradesImagens.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtn134Click(Sender: TObject);
begin
  inherited;
  Produto.FretePorPeso.Delete;
end;

procedure TFrmCadProdutos.BitBtn135Click(Sender: TObject);
begin
  inherited;
  if not Produto.FretePorPeso.Edit then
  	exit;
  pageFretePeso.ActivePage := tsFretePesoCadastro;
  if (Self.Enabled) and (Self.Visible) and (edFreteCodCliente.CanFocus) then
    edFreteCodCliente.SetFocus;
end;

procedure TFrmCadProdutos.BitBtn136Click(Sender: TObject);
begin
  inherited;
	Screen.Cursor := crHourGlass;
  try
		Produto._abreFormEtiquetasComum;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn137Click(Sender: TObject);
begin
  inherited;
  Produto.vProdutosConversaoSaida.vFatorPrinc := EditMoedaFatorPrincSaida.Valor;
  Produto.vProdutosConversaoSaida.vFatorConv  := EditMoedaFatorConvSaida.Valor;

  if (Self.Enabled) and (Self.Visible) and (BitBtn137.CanFocus) then
  	BitBtn137.SetFocus;
	if not (Produto.vProdutosConversaoSaida.Post) then
  begin
    setFocusCampoErro(Produto.vProdutosConversaoSaida.vNomeCampoErro, Produto.vProdutosConversaoSaida.vMensagemErro);
    exit;
  end
  else
  begin
    TForm(Panel155.Parent).ModalResult := IDOK;
    Produto.vConsProdutosConversao._abreProdutosConversao(
    	Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
      Produto.dataSet.FieldByName('COD_PROD').AsString);
  end;
end;

procedure TFrmCadProdutos.BitBtn138Click(Sender: TObject);
begin
  inherited;
	pageEAN_Conversao.ActivePage := TabSheet11;

  Produto.vProdutosConversaoSaida.Cancel;
  Produto.vProdutosConversaoSaida.RollBackTransacao;
  TForm(Panel155.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtn139Click(Sender: TObject);
begin
  inherited;
	TForm(Panel157.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.btCadastroMateriasPrimasOKClick(Sender: TObject);
begin
	if lk_grade_mp.Enabled then
  	if lk_grade_mp.KeyValue <= 0 then
    begin
    	Application.MessageBox('Grade deve ser informada!', 'Atenção', 0 + 64);
      if (Self.Enabled) and (Self.Visible) and (lk_grade_mp.CanFocus) then
      	lk_grade_mp.SetFocus;
      exit;
    end;

	TForm(pnCadastroMateriasPrimas.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.btCadastroResultadoFinalCancClick(Sender: TObject);
begin
	if Application.MessageBox(PChar('Deseja encerrar os vínculos das grades do Produto Acabado e Matérias Primas/Insumos/Embalagens?' + #13 + #13 +
  	'Caso informe sim a produção automática pode não ser gerada para as grades do Produto Acabado e Matérias Primas/Insumos/Embalagens.'),
    'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> mrYES then
    	exit;

  TForm(pnCadastroResultadoFinal.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.btCadastroResultadoFinalOKClick(Sender: TObject);
begin
	if lk_grade_it.Enabled then
  	if lk_grade_it.KeyValue <= 0 then
    begin
    	Application.MessageBox('Grade deve ser informada!', 'Atenção', 0 + 64);
      if (Self.Enabled) and (Self.Visible) and (lk_grade_it.CanFocus) then
      	lk_grade_it.SetFocus;
      exit;
    end;

	TForm(pnCadastroResultadoFinal.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.btAlterEstECClick(Sender: TObject);
begin
   if not vDadosIni.PesqPros('PRO314', 'ALTERAR', '', 'PRODUTOS_EC',
     'Grupo: ' + Produto.vProdutosEC.dataSet.FieldByName('GRUPO_PROD').AsString +
     ' Codigo: ' + Produto.vProdutosEC.dataSet.FieldByName('COD_PROD').AsString,
     Produto.buscas, true) then
    Exit;

	lbEstMinEC.Enabled := true;
  DBEditEstMinEC.Enabled := true;

  lbEstEC.Enabled := Produto.vProdutosEC.vProdutosECgrade.dataSet.IsEmpty;
  DBEditEstEC.Enabled := Produto.vProdutosEC.vProdutosECgrade.dataSet.IsEmpty;

  btAlterEstEC.Enabled := false;
  btOKAlterEstEC.Enabled := true;
  btCancAlterEstEC.Enabled := true;

  Produto.vProdutosEC.vOldEst := Produto.vProdutosEC.dataSet.FieldByName('ESTOQUE_EC').AsFloat;
  Produto.vProdutosEC.vOldEstMin := Produto.vProdutosEC.dataSet.FieldByName('ESTOQUE_MIN_EC').AsFloat;
  Produto.vProdutosEC.vEstMinimo := Produto.vProdutosEC.dataSet.FieldByName('ESTOQUE_MIN_EC').AsFloat;
  vDadosIni.abreForm('Dados E-Commerce', pnAlterEstProdEC, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]);
end;

procedure TFrmCadProdutos.btOKAlterEstCAClick(Sender: TObject);
begin
  if not Produto.vProdutosEC.testarEst('C') then
    exit;

  lbEstCA.Enabled := false;
  DBEditEstCA.Enabled := false;
  
  btAlterEstCA.Enabled := true;
  btOKAlterEstCA.Enabled := false;
  btCancAlterEstCA.Enabled := false;

  TForm(pnAlterEstProdCA.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.btOKAlterEstCAGradeClick(Sender: TObject);
begin
  if not Produto.vProdutosEC.vProdutosECgrade.salvarAltEst('C', Produto, Produto.vProdutosEC) then
  begin
    setFocusCampoErro(Produto.vProdutosEC.vProdutosECgrade.vNomeCampoErro, Produto.vProdutosEC.vProdutosECgrade.vMensagemErro);
    exit;
  end;

  lbEstGradeCA.Visible := false;
  DBEditEstCAGrade.Visible := false;
  
  btAlterEstCAGrade.Enabled := true;
  btOKAlterEstCAGrade.Enabled := false;
  btCancAlterEstCAGrade.Enabled := false;
  DBGridAlterEstCAGrade.Enabled := true;
  pnButtomAlterEstCAGrade.Visible := false;

  TForm(pnAlterEstGradeCA.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.btOKAlterEstECClick(Sender: TObject);
begin
  if not Produto.vProdutosEC.testarEst('E') then
    exit;

  lbEstMinEC.Enabled := false;  
  DBEditEstMinEC.Enabled := false;

  lbEstEC.Enabled := false;
  DBEditEstEC.Enabled := false;

  btAlterEstEC.Enabled := true;
  btOKAlterEstEC.Enabled := false;
  btCancAlterEstEC.Enabled := false;

  TForm(pnAlterEstProdEC.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.btAlterEstECGradeClick(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO315', 'ALTERAR', '', 'PRODUTOS_EC_GRADE',
     'Grupo: ' + Produto.vProdutosEC.vProdutosECgrade.dataSet.FieldByName('GRUPO_PROD').AsString +
     ' Codigo: ' + Produto.vProdutosEC.vProdutosECgrade.dataSet.FieldByName('COD_PROD').AsString +
     ' Grade: ' + Produto.vProdutosEC.vProdutosECgrade.dataSet.FieldByName('COD_GRADE').AsString,
     Produto.buscas, true) then
    Exit;

  if Produto.vProdutosEC.vProdutosECgrade.dataSet.IsEmpty then
    exit;
    
  if not Produto.vProdutosEC.vProdutosECgrade.editarAltEst then
    exit;

  lbEstGradeEC.Visible := true;
  DBEditEstECGrade.Visible := true;
  
  btAlterEstECGrade.Enabled := false;
  btOKAlterEstECGrade.Enabled := true;
  btCancAlterEstECGrade.Enabled := true;
  DBGridAlterEstECGrade.Enabled := false;
  pnButtomAlterEstECGrade.Visible := true;

  Produto.vProdutosEC.vProdutosECgrade.vOldEst := Produto.vProdutosEC.vProdutosECgrade.dataSet.FieldByName('ESTOQUE_EC').AsFloat;
  if not vDadosIni.abreForm('Dados E-Commerce', pnAlterEstGradeEC,
  	[ofBISystemMenuOff, ofEscapeExit, ofAlignAllClientWinCtrl]) then
   exit;

  if not Produto.vProdutosEC.vProdutosECgrade.Eof then
    Produto.vProdutosEC.vProdutosECgrade.dataSet.Next;
    
  if (Self.Enabled) and (Self.Visible) and (btAlterEstECGrade.CanFocus) then
    btAlterEstECGrade.SetFocus;
end;

procedure TFrmCadProdutos.btOKAlterEstECGradeClick(Sender: TObject);
begin
  if not Produto.vProdutosEC.vProdutosECgrade.salvarAltEst('E', Produto, Produto.vProdutosEC) then
  begin
    setFocusCampoErro(Produto.vProdutosEC.vProdutosECgrade.vNomeCampoErro, Produto.vProdutosEC.vProdutosECgrade.vMensagemErro);
    exit;
  end;

  lbEstGradeEC.Visible := false;
  DBEditEstECGrade.Visible := false;
  
  btAlterEstECGrade.Enabled := true;
  btOKAlterEstECGrade.Enabled := false;
  btCancAlterEstECGrade.Enabled := false;
  DBGridAlterEstECGrade.Enabled := true;
  pnButtomAlterEstECGrade.Visible := false;

  TForm(pnAlterEstGradeEC.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.btOKDelPromocaoProdClick(Sender: TObject);
begin
  inherited;
	TForm(pnDelPromocaoProd.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.btOKDelTabelaProdClick(Sender: TObject);
begin
  inherited;
  TForm(pnDelTabelaProd.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.btPrecosUnificadosUndoClick(Sender: TObject);
begin
  inherited;
  (pnPrecosUnificados.Parent as TForm).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.btCancAlterEstCAClick(Sender: TObject);
begin
	lbEstCA.Enabled := false;
  DBEditEstCA.Enabled := false;

  btAlterEstCA.Enabled := true;
  btOKAlterEstCA.Enabled := false;
  btCancAlterEstCA.Enabled := false;

  TForm(pnAlterEstProdCA.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.btCancAlterEstCAGradeClick(Sender: TObject);
begin
  Produto.vProdutosEC.vProdutosECgrade.dataSet.Cancel;

  lbEstGradeCA.Visible := false;
  DBEditEstCAGrade.Visible := false;
  
  btAlterEstCAGrade.Enabled := true;
  btOKAlterEstCAGrade.Enabled := false;
  btCancAlterEstCAGrade.Enabled := false;
  DBGridAlterEstCAGrade.Enabled := true;
  pnButtomAlterEstCAGrade.Visible := false;

  TForm(pnAlterEstGradeCA.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.btCancAlterEstECClick(Sender: TObject);
begin
	lbEstMinEC.Enabled := false;
  DBEditEstMinEC.Enabled := false;

  lbEstEC.Enabled := false;
  DBEditEstEC.Enabled := false;
  
  btAlterEstEC.Enabled := true;
  btOKAlterEstEC.Enabled := false;
  btCancAlterEstEC.Enabled := false;

  Produto.vProdutosEC.dataSet.FieldByName('ESTOQUE_MIN_EC').AsFloat := Produto.vProdutosEC.vEstMinimo;

  TForm(pnAlterEstProdEC.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.btCancAlterEstECGradeClick(Sender: TObject);
begin
  Produto.vProdutosEC.vProdutosECgrade.dataSet.Cancel;

  lbEstGradeEC.Visible := false;
  DBEditEstECGrade.Visible := false;
  
  btAlterEstECGrade.Enabled := true;
  btOKAlterEstECGrade.Enabled := false;
  btCancAlterEstECGrade.Enabled := false;
  DBGridAlterEstECGrade.Enabled := true;
  pnButtomAlterEstECGrade.Visible := false;

  TForm(pnAlterEstGradeEC.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtn13Click(Sender: TObject);
begin
  inherited;
  Produto.Parar := 1;
end;

procedure TFrmCadProdutos.btAlterEstCAClick(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO378', 'ALTERAR', '', 'PRODUTOS_EC',
     'Grupo: ' + Produto.vProdutosEC.dataSet.FieldByName('GRUPO_PROD').AsString +
     ' Codigo: ' + Produto.vProdutosEC.dataSet.FieldByName('COD_PROD').AsString,
     Produto.buscas, true) then
    Exit;

  lbEstCA.Enabled := Produto.vProdutosEC.vProdutosECgrade.dataSet.IsEmpty;
  DBEditEstCA.Enabled := Produto.vProdutosEC.vProdutosECgrade.dataSet.IsEmpty;
  
  btAlterEstCA.Enabled := false;
  btOKAlterEstCA.Enabled := true;
  btCancAlterEstCA.Enabled := true;

  Produto.vProdutosEC.vOldEst := Produto.vProdutosEC.dataSet.FieldByName('ESTOQUE_EC').AsFloat;
  vDadosIni.abreForm('Dados Comércio Aberto', pnAlterEstProdCA, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]);
end;

procedure TFrmCadProdutos.btAlterEstCAGradeClick(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO379', 'ALTERAR', '', 'PRODUTOS_EC_GRADE',
     'Grupo: ' + Produto.vProdutosEC.vProdutosECgrade.dataSet.FieldByName('GRUPO_PROD').AsString +
     ' Codigo: ' + Produto.vProdutosEC.vProdutosECgrade.dataSet.FieldByName('COD_PROD').AsString +
     ' Grade: ' + Produto.vProdutosEC.vProdutosECgrade.dataSet.FieldByName('COD_GRADE').AsString,
     Produto.buscas, true) then
    Exit;

  if Produto.vProdutosEC.vProdutosECgrade.dataSet.IsEmpty then
    exit;

  if not Produto.vProdutosEC.vProdutosECgrade.editarAltEst then
    exit;

  lbEstGradeCA.Visible := true;
  DBEditEstCAGrade.Visible := true;

  btAlterEstCAGrade.Enabled := false;
  btOKAlterEstCAGrade.Enabled := true;
  btCancAlterEstCAGrade.Enabled := true;
  DBGridAlterEstCAGrade.Enabled := false;
  pnButtomAlterEstCAGrade.Visible := true;

  Produto.vProdutosEC.vProdutosECgrade.vOldEst := Produto.vProdutosEC.vProdutosECgrade.dataSet.FieldByName('ESTOQUE_EC').AsFloat;
  if not vDadosIni.abreForm('Dados E-Commerce', pnAlterEstGradeCA,
  	[ofBISystemMenuOff, ofEscapeExit, ofAlignAllClientWinCtrl]) then
   exit;

  if not Produto.vProdutosEC.vProdutosECgrade.Eof then
    Produto.vProdutosEC.vProdutosECgrade.dataSet.Next;

  if (Self.Enabled) and (Self.Visible) and (btAlterEstCAGrade.CanFocus) then
    btAlterEstCAGrade.SetFocus;
end;

procedure TFrmCadProdutos.BitBtn140Click(Sender: TObject);
begin
  inherited;
	TForm(Panel157.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtn141Click(Sender: TObject);
begin
  inherited;
  if trim(EdSiglaUnidade.Text) = '' then
  begin
  	Application.MessageBox('Sigla não informada', 'Atenção', 0 + 64);
  	if (Self.Enabled) and (Self.Visible) and (EdSiglaUnidade.CanFocus) then
      EdSiglaUnidade.SetFocus;
    exit;
  end;

  if trim(EdDescricaoUnidade.Text) = '' then
  begin
  	Application.MessageBox('Descrição não informada', 'Atenção', 0 + 64);
  	if (Self.Enabled) and (Self.Visible) and (EdDescricaoUnidade.CanFocus) then
      EdDescricaoUnidade.SetFocus;
    exit;
  end;

	TForm(pnUnidade.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.BitBtn142Click(Sender: TObject);
begin
  inherited;
	TForm(pnUnidade.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtn143Click(Sender: TObject);
begin
  inherited;
  if Produto.vConsProdutosConversao.dataSet.IsEmpty then
   	Exit;

	if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_CONVERSAO', 'E', Produto.buscas) then
    Exit;
  try
//    RadioGroup2.ItemIndex := 0;
//    if trim(Produto.vConsProdutosConversao.dataSet.FieldByName('TIPO').AsString) = 'EAN' then
//    begin
//    	vDadosIni.carregarUnidades(
//      	Produto.buscas,
//        DBComboBoxUnidadeConv,
//        False,
//        '');
//
//    	if not Produto.vProdutosConversao.Edit(
//      	Produto.vConsProdutosConversao.dataSet.FieldByName('GRUPO_PROD').AsInteger,
//        Produto.vConsProdutosConversao.dataSet.FieldByName('COD_PROD').AsString,
//        Produto.vConsProdutosConversao.dataSet.FieldByName('CODIGO_EAN').AsString) then
//        	exit;
//
//      ComboBoxUnidadePrinc.Items.Clear;
//      ComboBoxUnidadePrinc.Items.Add(UpperCase(trim(Produto.dataSet.FieldByName('UNIDADE').AsString)));
//      ComboBoxUnidadePrinc.ItemIndex := 0;
//
//      if Copy(trim(Produto.vConsProdutosConversao.dataSet.FieldByName('OPERACAO').AsString), 1, 1) = 'D' then
//      begin
//      	EditMoedaFatorPrinc.Valor := Produto.vConsProdutosConversao.dataSet.FieldByName('QUANTIDADE').AsFloat;
//      	EditMoedaFatorConv.Valor  := 1;
//      end
//      else
//      begin
//      	EditMoedaFatorConv.Valor  := Produto.vConsProdutosConversao.dataSet.FieldByName('QUANTIDADE').AsFloat;
//        EditMoedaFatorPrinc.Valor := 1;
//      end;
//
//      DBEditCodigoEAN.Enabled := false;
//      DBComboBoxUnidadeConv.Enabled := false;
//
//      exibirInfConversao;
//      
//      vDadosIni.abreForm('Conversão por Código EAN', Panel56, [ofAutoSize, ofEscapeExit]);
//    end
//    else
//    begin
    	if trim(Produto.dataSet.FieldByName('INF_UNIDADE').AsString) <> 'S' then
      begin
      	if Application.MessageBox(PChar('Para alterar uma unidade de conversão para venda é necessário definir a unidade principal do produto.' + #13 + #13 +
        	'Deseja definir a unidade ' + QuotedStr(UpperCase(trim(Produto.dataSet.FieldByName('UNIDADE').AsString))) + ' como unidade principal deste produto?' + #13 + #13 +
          'A unidade do produto poderá ser alterado somente até o estoque ser movimentado, ' +
    			'caso o produto tenha movimentado o estoque em algum período a unidade não poderá ser alterada novamente.'),
    			'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
          exit;

    		if not Produto.gravarUnidadeComoPadrao then
          exit;
      end;

    	vDadosIni.carregarUnidades(
      	Produto.buscas,
        DBComboBoxUnidadeConvSaida,
        False,
        '');

    	if not Produto.vProdutosConversaoSaida.Edit(
      	Produto.vConsProdutosConversao.dataSet.FieldByName('GRUPO_PROD').AsInteger,
        Produto.vConsProdutosConversao.dataSet.FieldByName('COD_PROD').AsString,
        UpperCase(trim(Produto.vConsProdutosConversao.dataSet.FieldByName('UNIDADE').AsString))) then
        	exit;

      ComboBoxUnidadePrincSaida.Items.Clear;
      ComboBoxUnidadePrincSaida.Items.Add(UpperCase(trim(Produto.dataSet.FieldByName('UNIDADE').AsString)));
      ComboBoxUnidadePrincSaida.ItemIndex := 0;

      if Copy(trim(Produto.vConsProdutosConversao.dataSet.FieldByName('OPERACAO').AsString), 1, 1) = 'D' then
      begin
      	EditMoedaFatorPrincSaida.Valor := Produto.vConsProdutosConversao.dataSet.FieldByName('QUANTIDADE').AsFloat;
      	EditMoedaFatorConvSaida.Valor  := 1;
      end
      else
      begin
      	EditMoedaFatorConvSaida.Valor  := Produto.vConsProdutosConversao.dataSet.FieldByName('QUANTIDADE').AsFloat;
        EditMoedaFatorPrincSaida.Valor := 1;
      end;

      if Produto.vConsProdutosConversao.dataSet.FieldByName('DISPONIVEL_VENDA').AsString = 'S' then
        DBComboBoxDisVendaSaida.ItemIndex := 0
      else if Produto.vConsProdutosConversao.dataSet.FieldByName('DISPONIVEL_VENDA').AsString <> '' then
        DBComboBoxDisVendaSaida.ItemIndex := 1
      else
      	DBComboBoxDisVendaSaida.ItemIndex := -1;

      if Produto.vConsProdutosConversao.dataSet.FieldByName('PADRAO_VENDA').AsString = 'S' then
        DBComboBoxPadraoVndSaida.ItemIndex := 0
      else if Produto.vConsProdutosConversao.dataSet.FieldByName('PADRAO_VENDA').AsString <> '' then
        DBComboBoxPadraoVndSaida.ItemIndex := 1
      else
      	DBComboBoxPadraoVndSaida.ItemIndex := -1;

      EditMoedaFatorPrincSaida.Enabled   := false;
      EditMoedaFatorConvSaida.Enabled    := false;
      DBComboBoxUnidadeConvSaida.Enabled := false;
      btUnidadeConversaoVenda.Enabled    := false;
      DBEditCodigoEanSaida.Enabled       := true;

      exibirInfConversaoSaida;

      vDadosIni.abreForm('Conversão', Panel155, [ofAutoSize, ofEscapeExit]);
//    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn144Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('KITS_PROD_KITS', 'I', Produto.buscas) then
    Exit;

  if DBGridKitsProd.DataSource.DataSet.IsEmpty then
    exit;

  if (Produto.vKitsProduto.dataSet.FieldByName('quant_prod').AsFloat <= 0) then
  begin
    if not Produto.vKitsProduto.Insert(
      Produto.dataSet,
      DBGridKitsProd.DataSource.DataSet.FieldByName('CODIGO_KIT').AsInteger) then
        exit;
  end
  else
  begin
    if not Produto.vKitsProduto.Edit(
      Produto.dataSet) then
        exit;
  end;

  if not Produto.vKitsProduto.Post(Produto.dataSet) then
  begin
    setFocusCampoErro(Produto.vKitsProduto.vNomeCampoErro, Produto.vKitsProduto.vMensagemErro);
    exit;
  end;
end;

procedure TFrmCadProdutos.BitBtn145Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('KITS_PROD_KITS', 'E', Produto.buscas) then
    Exit;

  if DBGridKitsProd.DataSource.DataSet.IsEmpty then
    exit;

  if (Produto.vKitsProduto.dataSet.FieldByName('quant_prod').AsFloat <= 0) then
  begin
  	Application.MessageBox(PChar('Produto não existe no kit selecionado: ' + #13 + #13 +
    	'KIT' + #13 +
      'Codigo: ' + IntToStr(Produto.vKitsProduto.dataSet.FieldByName('codigo_kit').AsInteger) + #13 +
      'Descrição: ' + trim(Produto.vKitsProduto.dataSet.FieldByName('descricao_kit').AsString) +  #13 + #13 +
      'Favor verificar antes de continuar.'), 'Atenção', 0 + 64);
    exit;
  end;

  if not Produto.vKitsProduto.Delete(
  	Produto.dataSet) then
  		exit;
end;

procedure TFrmCadProdutos.BitBtn146Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('KITS_PROD_KITS', 'A', Produto.buscas) then
    Exit;

  if DBGridKitsProd.DataSource.DataSet.IsEmpty then
    exit;

  if (Produto.vKitsProduto.dataSet.FieldByName('quant_prod').AsFloat <= 0) then
  begin
    if not Produto.vKitsProduto.Insert(
      Produto.dataSet,
      DBGridKitsProd.DataSource.DataSet.FieldByName('CODIGO_KIT').AsInteger) then
        exit;
  end
  else
  begin
    if not Produto.vKitsProduto.Edit(
      Produto.dataSet) then
        exit;
  end;

  if not Produto.vKitsProduto.Post(
  	Produto.dataSet) then
  begin
    setFocusCampoErro(Produto.vKitsProduto.vNomeCampoErro, Produto.vKitsProduto.vMensagemErro);
    exit;
  end;
end;

procedure TFrmCadProdutos.BitBtn147Click(Sender: TObject);
begin
	if DBGridKitsProd.DataSource.DataSet.IsEmpty then
    exit;

  if not Produto.vKitsProduto._imprimirKit(
  	Produto.dataSet,
    false) then
    	exit;
end;

procedure TFrmCadProdutos.BitBtn148Click(Sender: TObject);
begin
  if DBGridKitsProd.DataSource.DataSet.IsEmpty then
    exit;

  if not Produto.vKitsProduto._imprimirKit(
  	Produto.dataSet,
    true) then
    	exit;
end;

procedure TFrmCadProdutos.BitBtn14Click(Sender: TObject);
begin
  inherited;
  Produto.cdsEstoqueDiario.AfterScroll := nil;
  Produto.fecharUltimasCompras;
  Produto.fecharComprasEVendas;
  PageControl1.ActivePage := TabSheet2;
  if DBGrid1.Visible then
  	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	    DBGrid1.SetFocus;
end;

procedure TFrmCadProdutos.BitBtn151Click(Sender: TObject);
begin
  inherited;
  TForm(pn_Cashback.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.BitBtn152Click(Sender: TObject);
begin
  inherited;
	TForm(pn_Cashback.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtn15Click(Sender: TObject);
begin
  inherited;
  if Produto.VendasMes(MaskEdit7.Text) then
  begin
    vHabQtdeVndPorMes := true;

    Panel8.Top := GroupBox3.Height;
    Panel8.Visible := false;
    GroupBox3.Visible := true;
    Panel1.Visible := true;

    pnQtdeVndMes.Visible := vHabQtdeVndPorMes;
		pnCodigo.Visible := false;
		pnEstoqueEmpresas.Visible := false;
    pnPrecosVndPorEmpresa.Visible := false;
    pnObservacao.Visible := false;
    pnCaracteristica.Visible := false;
    
    SplitterObservacaoBottom.Visible := false;
    SplitterCaracteristicaBottom.Visible := false;
    SplitterCodigoEmpresasBottom.Visible := false;
    SplitterEstoqueEmpresasBottom.Visible := false;
    SplitterPrecosVndPorEmpresaBottom.Visible := false;

    pnOpcaoDireitaProdutos.Visible := (vHabQtdeVndPorMes) or (vHabEstoquePorEmpresas) or (vHabPrecosVndPorEmpresa) or (vHabObservacaoProd) or (vHabCaracteristicaProd);

    if pnOpcaoDireitaProdutos.Visible then
    begin
			if pnOpcaoDireitaProdutos.Width < 250 then
      	pnOpcaoDireitaProdutos.Width := 250;

			pnQtdeVndMes.Align := alClient;
      Splitter1.Align := alLeft;
      Splitter1.Align := alRight;
    end;

    if (Self.Enabled) and (Self.Visible) and (pnQtdeVndMes.CanFocus) then
	    pnQtdeVndMes.SetFocus;
  end;
end;

procedure TFrmCadProdutos.BitBtn16Click(Sender: TObject);
begin
  inherited;
  vHabQtdeVndPorMes := false;

  Panel8.Top := GroupBox3.Height;
  Panel8.Visible := false;

  pnQtdeVndMes.Visible := vHabQtdeVndPorMes;
  pnCodigo.Visible := vHabCodigoProd;
  pnEstoqueEmpresas.Visible := vHabEstoquePorEmpresas;
  pnPrecosVndPorEmpresa.Visible := vHabPrecosVndPorEmpresa;
  pnObservacao.Visible := vHabObservacaoProd;
  pnCaracteristica.Visible := vHabCaracteristicaProd;

  pnOpcaoDireitaProdutos.Visible := (vHabObservacaoProd) or (vHabCaracteristicaProd) or (vHabEstoquePorEmpresas) or (vHabPrecosVndPorEmpresa) or (vHabQtdeVndPorMes);

  if pnOpcaoDireitaProdutos.Visible then
  	if pnQtdeVndMes.Visible then
    	pnQtdeVndMes.Height := pnOpcaoDireitaProdutos.Height;

  GroupBox3.Visible := true;
  Panel1.Visible := true;
end;

procedure TFrmCadProdutos.BitBtn17Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO076', 'EMITIR TABELA DE PRECOS', '', 'PRODUTOS', '', Produto.buscas,
    true) then
    //  if not vDadosIni.PesqPros('PRO076', '', Produto.buscas, true) then
    Exit;
  PageControl4.ActivePage := tsTabPrecos;
  Produto.vGrupo.dataSet := tclientdataset(dtmProdutos.cdsGrTab);
  Produto.vSubGrupo.dataSet := tclientdataset(dtmProdutos.cdsSubTab);
  Produto.vPromocao.dataSet := TClientDataSet(dtmProdutos.cdsPromocaoP1);
  vDadosIni.vtpPreco := 'P';
  Produto.vPromocao._abrePromocao;
  vDadosIni.vtpPreco := 'T';
  Produto.vTipoPreco._abreTipoPrecoTabela;
  Produto.vRegiao._abreRegiao('');
  if GroupBox73.Caption = 'Localidade' then
    DBLookupComboBox10.KeyValue := 2
  else if GroupBox73.Caption = 'Setor' then
    DBLookupComboBox10.KeyValue := 3
  else if GroupBox73.Caption = 'Cidade' then
    DBLookupComboBox10.KeyValue := 4;

  Produto.vRegiao._abreRegiao(UpperCase(GroupBox73.Caption));

  if not Produto.vGrupo.dataSet.Active then
    Produto.vGrupo.abreGrupos;
  if not Produto.vSubGrupo.dataSet.Active then
    Produto.vSubGrupo.abreSubGrupos;
end;

procedure TFrmCadProdutos.BitBtn18Click(Sender: TObject);
begin
  inherited;
  try
    BitBtn120.Enabled := False;
    label113.Caption := format('%0.4f', [0.0000]);
    label116.Caption := format('%0.4f', [0.0000]);
    Screen.Cursor := crHourGlass;
    vPeriodo := ' de ' + MaskEdit8.Text + ' a ' + MaskEdit9.Text;
    if not Produto.abrirComprasEVendas(MaskEdit8.Text, MaskEdit9.Text) then
    begin
      if (Self.Enabled) and (Self.Visible) and (MaskEdit8.CanFocus) then
        MaskEdit8.SetFocus
    end
    else
    begin
      BitBtn120.Enabled := True;
      label113.Caption := format('%0.4f', [Produto.qtdentrada]);
      label116.Caption := format('%0.4f', [Produto.qtdsaida]);
      if (Self.Enabled) and (Self.Visible) and (DBGrid35.CanFocus) then      
        DBGrid35.SetFocus;
    end;
//    DBGrid20.Visible := not DBGrid20.DataSource.DataSet.IsEmpty;
//    DBGrid21.Visible := not DBGrid21.DataSource.DataSet.IsEmpty;
//    if DBGrid20.Visible then
//    begin
//      DBGrid20.Height := Trunc(GroupBox14.Height / 3)-5;
//      DBGrid32.Height := Trunc(GroupBox14.Height / 3)-5;
//    end
//    else
//      DBGrid32.Height := Trunc(GroupBox14.Height / 2)-4;
//    if DBGrid21.Visible then
//      DBGrid21.Height := Trunc(GroupBox15.Height / 2)-4;
    ckEstoqueDiarioClick(Sender);
  finally
    MudaCor;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn1Click(Sender: TObject);
var
  vSqlAdicional, vCampoConteudo, vCampo, vOrdem, vCondicao, vValor, vCampoTmp: string;
  ASqlMult: string;
  AList: TStrings;
  I: Integer;
  tim: TTime;
  vEstoqueDisp: Boolean;
begin
	SpeedButton2.Hint := 'Enviar para Lixeira - [PRO006]';
  btExcluirRegistro.Hint := 'Enviar para Lixeira - [PRO006]';

  vEstoqueDisp := False;
  if not vEstoqueDisp then
  	vEstoqueDisp := ckEstoqueDisponivel.Checked;
  if not vEstoqueDisp then
    vEstoqueDisp := (trim(Produto.dataSet.FieldByName('ESTOQUE').DisplayLabel) = trim(ComboBox1.Text));
  if not vEstoqueDisp then
    vEstoqueDisp := (trim(Produto.dataSet.FieldByName('EST_PRIMA').DisplayLabel) = trim(ComboBox1.Text));
  if not vEstoqueDisp then
    vEstoqueDisp := (CheckBox1.Checked) and (trim(Produto.dataSet.FieldByName('ESTOQUE').DisplayLabel) = trim(ComboBox11.Text));
  if not vEstoqueDisp then
    vEstoqueDisp := (CheckBox1.Checked) and (trim(Produto.dataSet.FieldByName('EST_PRIMA').DisplayLabel) = trim(ComboBox11.Text));

  if vDadosIni.PesqPros('PRO001', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
    //  if vDadosIni.PesqPros('PRO001', '', produto.buscas, true) then
  begin
    inherited;

    if (ckMenuLateral.Checked) and (not pnOpcaoDireitaProdutos.Visible) then
      ckMenuLateralClick(Sender);
    
    try
      if UpperCase(ComboBox1.Text) = 'TODOS' then
      begin
        mkGrupo.Visible := False;
        mkSubGrupo.Visible := False;
        mkCodProd.Visible := False;
        MaskEdit1.Visible := False;
        MaskEdit2.Visible := False;
        MaskEdit3.Visible := True;
      end;

      Screen.Cursor := crHourGlass;
      vSqlAdicional := '';
      vCampoConteudo := '';
      if CheckBox18.Checked and CheckBox3.Checked and CheckBox1.Checked then
        vSqlAdicional := Produto.PesquisaAdicional(CheckBox2.Checked, MaskEdit5.Text,
          ComboBox11.Text, ComboBox12.Text, ComboBox4.Text, ComboBox5.Text, ComboBox6.Text,
          ComboBox10.Text, ComboBox7.Text, ComboBox8.Text, ComboBox9.Text, ComboBox17.Text,
          ComboBox18.Text, ComboBox19.Text)
      else if CheckBox3.Checked and CheckBox1.Checked then
        vSqlAdicional := Produto.PesquisaAdicional(CheckBox2.Checked, MaskEdit5.Text,
          ComboBox11.Text, ComboBox12.Text, ComboBox4.Text, ComboBox5.Text, ComboBox6.Text,
          ComboBox10.Text, ComboBox7.Text, ComboBox8.Text, ComboBox9.Text)
      else if CheckBox3.Checked and CheckBox18.Checked then
        vSqlAdicional := Produto.PesquisaAdicional(false, '', '', ComboBox12.Text,
          ComboBox4.Text, ComboBox5.Text, ComboBox6.Text, ComboBox10.Text, ComboBox7.Text,
          ComboBox8.Text, ComboBox9.Text, ComboBox17.Text, ComboBox18.Text, ComboBox19.Text)
      else if CheckBox1.Checked and CheckBox18.Checked then
        vSqlAdicional := Produto.PesquisaAdicional(CheckBox2.Checked, MaskEdit5.Text,
          ComboBox11.Text, ComboBox12.Text, '', '', '', '', '', '', '', ComboBox17.Text,
          ComboBox18.Text, ComboBox19.Text)
      else if CheckBox3.Checked then
        vSqlAdicional := Produto.PesquisaAdicional(false, '', '', ComboBox12.Text,
          ComboBox4.Text, ComboBox5.Text, ComboBox6.Text, ComboBox10.Text, ComboBox7.Text,
          ComboBox8.Text, ComboBox9.Text)
      else if (CheckBox1.Checked) and (MaskEdit4.Visible) and (CheckBox18.Checked) then
        vSqlAdicional := Produto.PesquisaAdicional(false, MaskEdit4.Text, MaskEdit6.Text, ComboBox12.Text,
          ComboBox4.Text, ComboBox5.Text, ComboBox6.Text, ComboBox10.Text, ComboBox7.Text,
          ComboBox8.Text, ComboBox9.Text, ComboBox17.Text, ComboBox18.Text, ComboBox19.Text)
      else if (CheckBox1.Checked) and (MaskEdit4.Visible) then
      	vSqlAdicional := Produto.PesquisaAdicional(CheckBox2.Checked, MaskEdit4.Text, MaskEdit6.Text,
          ComboBox11.Text, ComboBox12.Text, '', '', '', '', '', '', '')
      else if (CheckBox1.Checked) then
        vSqlAdicional := Produto.PesquisaAdicional(CheckBox2.Checked, MaskEdit5.Text,
          ComboBox11.Text, ComboBox12.Text, '', '', '', '', '', '', '')
      else if CheckBox18.Checked then
        vSqlAdicional := Produto.PesquisaAdicional(false, '', '', ComboBox12.Text, '', '', '', '',
          '', '', '', ComboBox17.Text, ComboBox18.Text, ComboBox19.Text);

      if ckEcommerce.Checked then
        vSqlAdicional := vSqlAdicional +
        	' and (SELECT COUNT(*) FROM PRODUTOS_EC ' +
          '			 WHERE PRODUTOS_EC.GRUPO_PROD = PRODUTOS.GRUPO_PROD ' +
          '      AND PRODUTOS_EC.COD_PROD = PRODUTOS.COD_PROD ' +
          '      AND PRODUTOS_EC.COD_EMPRESA = PRODUTOS.COD_EMPRESA ' +
          '			 AND ((PRODUTOS_EC.ID_COMMERCE > 0) OR (PRODUTOS_EC.SINC_ECOMMERCE = ''S'')) ) > 0 ';

//      vCampoConteudo := MaskEdit3.Text;
//      if (not MaskEdit2.Visible) and (not mkGrupo.Visible) and (Copy(vCampoConteudo, 1, 2) = 'G-') then
//      begin
//        if (pos(';', vCampoConteudo) > 0) then //compatibilidade com etiquetas antigas
//        begin
//          mkGrupo.Text := Copy(vCampoConteudo, 5, (pos(';', vCampoConteudo) - 5 -
//            strtoint(vDadosIni.vProduto.vDigitosProd)));
//          mkCodProd.Text := Copy(vCampoConteudo, (pos(';', vCampoConteudo) -
//            strtoint(vDadosIni.vProduto.vDigitosProd)), strtoint(vDadosIni.vProduto.vDigitosProd));
//        end
//        else if (pos('/', vCampoConteudo) > 0) then //compatibilidade com etiquetas antigas
//        begin
//          mkGrupo.Text := Copy(vCampoConteudo, 5, (pos('/', vCampoConteudo) - 5 -
//            strtoint(vDadosIni.vProduto.vDigitosProd)));
//          mkCodProd.Text := Copy(vCampoConteudo, (pos('/', vCampoConteudo) -
//            strtoint(vDadosIni.vProduto.vDigitosProd)), strtoint(vDadosIni.vProduto.vDigitosProd));
//        end
//        else
//        begin
//          mkGrupo.Text := Copy(vCampoConteudo, 3 + vDadosIni.vEmp.vDigitosEmp,
//            vDadosIni.vEmp.vDidgitosGrup);
//          mkCodProd.Text := Copy(vCampoConteudo, 3 + vDadosIni.vEmp.vDigitosEmp +
//            vDadosIni.vEmp.vDidgitosGrup, strtoint(vDadosIni.vProduto.vDigitosProd));
//        end;
//        if (Trim(mkGrupo.text) <> '') and (Trim(mkCodProd.text) <> '') then
//          vSqlAdicional := vSqlAdicional + ' AND PRODUTOS.grupo_prod = ' + mkGrupo.text +
//            ' and PRODUTOS.cod_prod = ' + QuotedStr(mkCodProd.text);
//
//        if (ckLixeira.Checked) and (ckLixeira.Visible) then
//        begin
//          if not Produto.ConsultaCamposLixeira('PRODUTOS', '', 'Todos', combobox3.Text, ComboBox2.text,
//            vSqlAdicional, true, vDadosIni.codEmpresa) then
//          begin
//            if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
//              ComboBox1.SetFocus;
//          end
//          else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
//            DBGrid1.SetFocus
//        end
//        else
//        begin
//          if not Produto.ConsultaCampos('PRODUTOS', '', 'Todos', combobox3.Text, ComboBox2.text,
//            vSqlAdicional, true, vDadosIni.codEmpresa) then
//          begin
//            if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
//              ComboBox1.SetFocus;
//          end
//          else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
//            DBGrid1.SetFocus
//        end;
//      end
      vDadosIni.vEtiqProd.CodProd := '';
      if (not MaskEdit2.Visible) and (not mkGrupo.Visible) then
        vDadosIni.vEtiqProd := vDadosIni.retornaDadosEtiqueta(
          Produto.buscas,
          MaskEdit3.Text);

    	if (not MaskEdit2.Visible) and (not mkGrupo.Visible)
      	//and ((Copy(MaskEdit3.Text, 1, 2) = 'A-') or (Copy(MaskEdit3.Text, 1, 2) = 'G-')) then
        and (vDadosIni.vEtiqProd.CodProd <> '') then
      begin
//        vDadosIni.vEtiqProd := vDadosIni.retornaDadosEtiqueta(
//          Produto.buscas,
//          MaskEdit3.Text);

        if trim(vDadosIni.vEtiqProd.CodProd) <> '' then
        begin
        	mkGrupo.Text := IntToStr(vDadosIni.vEtiqProd.GrupoProd);
        	mkCodProd.Text := vDadosIni.vEtiqProd.CodProd;
        end
        else
        begin
          mkGrupo.Text := '99999';
          mkCodProd.Text := '99999';
        end;

        if (Trim(mkGrupo.text) <> '') and (Trim(mkCodProd.text) <> '') then
          vSqlAdicional := vSqlAdicional + ' AND PRODUTOS.grupo_prod = ' + mkGrupo.text +
            ' and PRODUTOS.cod_prod = ' + QuotedStr(mkCodProd.text);

        if (ckLixeira.Checked) and (ckLixeira.Visible) then
        begin
        	if trim(vSqlAdicional) <> '' then
            if Copy(UpperCase(trim(vSqlAdicional)), 1, 3) = 'AND' then
              vSqlAdicional := ' ' + Copy(trim(vSqlAdicional), 4, Length(trim(vSqlAdicional)) - 3);

          if not Produto.ConsultaCamposLixeira('PRODUTOS', '', 'Todos', combobox3.Text, ComboBox2.text,
            true, vDadosIni.codEmpresa,
            ' PRODUTOS.*,' + vDadosIni.IfThen(vEstoqueDisp, ' EST.ESTOQUE, EST.EST_PRIMA ', ' CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA '),
            vDadosIni.IfThen(vEstoqueDisp,
            	' LEFT JOIN GETESTOQUEDISPONIVEL (PRODUTOS.GRUPO_PROD, PRODUTOS.COD_PROD, 0, PRODUTOS.COD_EMPRESA, 0, '''', 0, 0) EST ON 1 = 1 ',
              ''),
            vSqlAdicional) then
          begin
            if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
              ComboBox1.SetFocus;
          end
          else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
            DBGrid1.SetFocus;
        end
        else
        begin
        	if trim(vSqlAdicional) <> '' then
            if Copy(UpperCase(trim(vSqlAdicional)), 1, 3) = 'AND' then
              vSqlAdicional := ' ' + Copy(trim(vSqlAdicional), 4, Length(trim(vSqlAdicional)) - 3);

          if not Produto.ConsultaCampos('PRODUTOS', '', 'Todos', combobox3.Text, ComboBox2.text,
            true, vDadosIni.codEmpresa,
            ' PRODUTOS.*,' + vDadosIni.IfThen(vEstoqueDisp, ' EST.ESTOQUE, EST.EST_PRIMA ', ' CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA '),
            vDadosIni.IfThen(vEstoqueDisp,
            	' LEFT JOIN GETESTOQUEDISPONIVEL (PRODUTOS.GRUPO_PROD, PRODUTOS.COD_PROD, 0, PRODUTOS.COD_EMPRESA, 0, '''', 0, 0) EST ON 1 = 1 ',
              ''),
            vSqlAdicional) then
          begin
            if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
              ComboBox1.SetFocus;
          end
          else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
            DBGrid1.SetFocus;
        end;
      end
      else if MaskEdit2.Visible then
      begin
      	if (ckLixeira.Checked) and (ckLixeira.Visible) then
        begin
        	if trim(vSqlAdicional) <> '' then
            if Copy(UpperCase(trim(vSqlAdicional)), 1, 3) = 'AND' then
              vSqlAdicional := ' ' + Copy(trim(vSqlAdicional), 4, Length(trim(vSqlAdicional)) - 3);

          if not Produto.ConsultaCamposLixeira('PRODUTOS', ComboBox1.Text, ComboBox2.text,
            maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
            ' PRODUTOS.*,' + vDadosIni.IfThen(vEstoqueDisp, ' EST.ESTOQUE, EST.EST_PRIMA ', ' CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA '),
            vDadosIni.IfThen(vEstoqueDisp,
            	' LEFT JOIN GETESTOQUEDISPONIVEL (PRODUTOS.GRUPO_PROD, PRODUTOS.COD_PROD, 0, PRODUTOS.COD_EMPRESA, 0, '''', 0, 0) EST ON 1 = 1 ',
              ''),
            vSqlAdicional) then
          begin
            if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
              combobox1.setfocus;
          end
          else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
            DBGrid1.SetFocus;
        end
        else
        begin
        	if trim(vSqlAdicional) <> '' then
            if Copy(UpperCase(trim(vSqlAdicional)), 1, 3) = 'AND' then
              vSqlAdicional := ' ' + Copy(trim(vSqlAdicional), 4, Length(trim(vSqlAdicional)) - 3);

        	if not Produto.ConsultaCampos('PRODUTOS', ComboBox1.Text, ComboBox2.text,
            maskedit1.text, maskedit2.text, vDadosIni.codEmpresa, 1,
            ' PRODUTOS.*,' + vDadosIni.IfThen(vEstoqueDisp, ' EST.ESTOQUE, EST.EST_PRIMA ', ' CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA '),
            vDadosIni.IfThen(vEstoqueDisp,
            	' LEFT JOIN GETESTOQUEDISPONIVEL (PRODUTOS.GRUPO_PROD, PRODUTOS.COD_PROD, 0, PRODUTOS.COD_EMPRESA, 0, '''', 0, 0) EST ON 1 = 1 ',
              ''),
            vSqlAdicional) then
          begin
            if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
              combobox1.setfocus;
          end
          else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
            DBGrid1.SetFocus;
        end;
      end
      else if mkGrupo.Visible then
      begin
        if (Trim(mkGrupo.text) <> '') and (Trim(mkSubGrupo.text) <> '') and (Trim(mkCodProd.text) <> '') then
          vSqlAdicional := vSqlAdicional + ' AND PRODUTOS.SUB_G_PROD = ' + mkSubGrupo.text + ' and ' +
            'PRODUTOS.grupo_prod = ' + mkGrupo.text + ' and PRODUTOS.cod_prod = ' + QuotedStr(mkCodProd.text)
        else if (Trim(mkGrupo.text) = '') and (Trim(mkSubGrupo.text) <> '') and (Trim(mkCodProd.text) <> '') then
          vSqlAdicional := vSqlAdicional + ' AND PRODUTOS.sub_g_prod = ' + mkSubGrupo.text +
            ' and PRODUTOS.cod_prod = ' + QuotedStr(mkCodProd.text)
        else if (Trim(mkGrupo.text) <> '') and (Trim(mkSubGrupo.text) = '') and (Trim(mkCodProd.text) <> '') then
          vSqlAdicional := vSqlAdicional + ' AND PRODUTOS.grupo_prod = ' + mkGrupo.text +
            ' and PRODUTOS.cod_prod = ' + QuotedStr(mkCodProd.text)
        else if (Trim(mkGrupo.text) <> '') and (Trim(mkSubGrupo.text) <> '') and (Trim(mkCodProd.text) = '') then
          vSqlAdicional := vSqlAdicional + ' AND PRODUTOS.SUB_G_PROD = ' + mkSubGrupo.text +
            ' and PRODUTOS.grupo_prod = ' + mkGrupo.text
        else if (Trim(mkGrupo.text) = '') and (Trim(mkSubGrupo.text) = '') and (Trim(mkCodProd.text) <> '') then
          vSqlAdicional := vSqlAdicional + ' AND PRODUTOS.cod_prod = ' + QuotedStr(mkCodProd.text)
        else
        begin
          Application.MessageBox('Preencha no mínimo 2 campos para consulta.', 'Alerta', MB_OK +
            MB_ICONWARNING + MB_DEFBUTTON1);
          if (Self.Enabled) and (Self.Visible) and (mkGrupo.CanFocus) then
            mkGrupo.SetFocus;
          exit;
        end;

        if (ckLixeira.Checked) and (ckLixeira.Visible) then
        begin
        	if trim(vSqlAdicional) <> '' then
            if Copy(UpperCase(trim(vSqlAdicional)), 1, 3) = 'AND' then
              vSqlAdicional := ' ' + Copy(trim(vSqlAdicional), 4, Length(trim(vSqlAdicional)) - 3);

          if not Produto.ConsultaCamposLixeira('PRODUTOS', MaskEdit3.text, ComboBox1.Text, combobox3.Text, ComboBox2.text,
            true, vDadosIni.codEmpresa,
            ' PRODUTOS.*,' + vDadosIni.IfThen(vEstoqueDisp, ' EST.ESTOQUE, EST.EST_PRIMA ', ' CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA '),
            vDadosIni.IfThen(vEstoqueDisp,
            	' LEFT JOIN GETESTOQUEDISPONIVEL (PRODUTOS.GRUPO_PROD, PRODUTOS.COD_PROD, 0, PRODUTOS.COD_EMPRESA, 0, '''', 0, 0) EST ON 1 = 1 ',
              ''),
            vSqlAdicional) then
          begin
            if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
              ComboBox1.SetFocus;
          end
          else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
            DBGrid1.SetFocus;
        end
        else
        begin
        	if trim(vSqlAdicional) <> '' then
            if Copy(UpperCase(trim(vSqlAdicional)), 1, 3) = 'AND' then
              vSqlAdicional := ' ' + Copy(trim(vSqlAdicional), 4, Length(trim(vSqlAdicional)) - 3);

          if not Produto.ConsultaCampos('PRODUTOS', MaskEdit3.text, ComboBox1.Text, combobox3.Text, ComboBox2.text,
            true, vDadosIni.codEmpresa,
            ' PRODUTOS.*,' + vDadosIni.IfThen(vEstoqueDisp, ' EST.ESTOQUE, EST.EST_PRIMA ', ' CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA '),
            vDadosIni.IfThen(vEstoqueDisp,
            	' LEFT JOIN GETESTOQUEDISPONIVEL (PRODUTOS.GRUPO_PROD, PRODUTOS.COD_PROD, 0, PRODUTOS.COD_EMPRESA, 0, '''', 0, 0) EST ON 1 = 1 ',
              ''),
            vSqlAdicional) then
          begin
            if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
              ComboBox1.SetFocus;
          end
          else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
            DBGrid1.SetFocus;
        end;
      end
      else
      begin
        ASqlMult := '';
        if (Trim(MaskEdit3.Text) <> '') and (vDadosIni.getConfSisBool('prod_cons_mult_descr', Produto.buscas)) and
          (ComboBox1.Text = Produto.dataSet.FieldByName('DESCR_PROD').DisplayLabel) then
        begin
          AList := TStringList.Create;
          try
            AList := vDadosIni.SplitS(UpperCase(MaskEdit3.Text), ' ', False);
            for I := 0 to AList.Count - 1 do
              if Trim(AList[I]) <> '' then
                ASqlMult := ASqlMult + IfThen(ASqlMult <> '', ' and ') + '(PRODUTOS.DESCR_PROD LIKE ''%' + Trim(AList[I]) + '%'')';
          finally
            FreeAndNil(AList);
          end;
        end;

        if (trim(Produto.dataSet.FieldByName('ESTOQUE').DisplayLabel) = trim(ComboBox1.Text))
        	or (trim(Produto.dataSet.FieldByName('EST_PRIMA').DisplayLabel) = trim(ComboBox1.Text)) then
        begin
          vCampo    := 'Todos';
          vCondicao := combobox3.Text;
          vValor    := '';
          vOrdem    := Produto.dataSet.FieldByName('NUM_FAB_PROD').DisplayLabel;

          vCampoTmp := 'EST.ESTOQUE';
          if (trim(Produto.dataSet.FieldByName('EST_PRIMA').DisplayLabel) = trim(ComboBox1.Text)) then
          	vCampoTmp := 'EST.EST_PRIMA';

          if vCondicao = 'Igual' then
            vCondicao := '='
          else if vCondicao = 'Maior' then
            vCondicao := '>'
          else if vCondicao = 'Maior ou Igual' then
            vCondicao := '>='
          else if vCondicao = 'Menor' then
            vCondicao := '<'
          else if vCondicao = 'Menor ou Igual' then
            vCondicao := '<='
          else if vCondicao = 'Diferente' then
            vCondicao := '<>'
          else if (vCondicao = 'Esta contido') then
            vCondicao := 'like'
          else if (combobox3.Text = 'Começa') then
            vCondicao := 'like'
          else
            vCondicao := '=';

          if trim(vSqlAdicional) <> '' then
          	vSqlAdicional := vSqlAdicional + ' AND ';

          if (vCondicao = 'Esta contido') then
          	vSqlAdicional := vSqlAdicional + ' ' + vCampoTmp + ' ' + vCondicao + ' %' + MaskEdit3.text + '%'
          else if (combobox3.Text = 'Começa') then
          	vSqlAdicional := vSqlAdicional + ' ' + vCampoTmp + ' ' + vCondicao + MaskEdit3.text + '%'
          else
          	vSqlAdicional := vSqlAdicional + ' ' + vCampoTmp + ' ' + vCondicao + ' ' + MaskEdit3.text;
        end
        else
        begin
        	vCampo    := ComboBox1.Text;
          vCondicao := combobox3.Text;
          vValor    := MaskEdit3.text;
          vOrdem    := ComboBox2.text;
        end;

        if ASqlMult <> '' then
        begin
          vSqlAdicional := vSqlAdicional + ' AND (' + ASqlMult + ')';
          if (ckLixeira.Checked) and (ckLixeira.Visible) then
          begin
          	if trim(vSqlAdicional) <> '' then
              if Copy(UpperCase(trim(vSqlAdicional)), 1, 3) = 'AND' then
                vSqlAdicional := ' ' + Copy(trim(vSqlAdicional), 4, Length(trim(vSqlAdicional)) - 3);

            if not Produto.ConsultaCamposLixeira('PRODUTOS', '', 'Todos', vCondicao, vOrdem,
              true, vDadosIni.codEmpresa,
              ' PRODUTOS.*,' + vDadosIni.IfThen(vEstoqueDisp, ' EST.ESTOQUE, EST.EST_PRIMA ', ' CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA '),
              vDadosIni.IfThen(vEstoqueDisp,
                ' LEFT JOIN GETESTOQUEDISPONIVEL (PRODUTOS.GRUPO_PROD, PRODUTOS.COD_PROD, 0, PRODUTOS.COD_EMPRESA, 0, '''', 0, 0) EST ON 1 = 1 ',
                ''),
            	vSqlAdicional) then
            begin
              if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
                ComboBox1.SetFocus;
            end
            else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
              DBGrid1.SetFocus;
          end
          else
          begin
          	if trim(vSqlAdicional) <> '' then
              if Copy(UpperCase(trim(vSqlAdicional)), 1, 3) = 'AND' then
                vSqlAdicional := ' ' + Copy(trim(vSqlAdicional), 4, Length(trim(vSqlAdicional)) - 3);

            if not Produto.ConsultaCampos('PRODUTOS', '', 'Todos', vCondicao, vOrdem,
            	true, vDadosIni.codEmpresa,
            	' PRODUTOS.*,' + vDadosIni.IfThen(vEstoqueDisp, ' EST.ESTOQUE, EST.EST_PRIMA ', ' CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA '),
              vDadosIni.IfThen(vEstoqueDisp,
                ' LEFT JOIN GETESTOQUEDISPONIVEL (PRODUTOS.GRUPO_PROD, PRODUTOS.COD_PROD, 0, PRODUTOS.COD_EMPRESA, 0, '''', 0, 0) EST ON 1 = 1 ',
                ''),
            	vSqlAdicional) then
            begin
              if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
                ComboBox1.SetFocus;
            end
            else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
              DBGrid1.SetFocus;
          end;
        end
        else
        begin
        	if (ckLixeira.Checked) and (ckLixeira.Visible) then
          begin
          	if trim(vSqlAdicional) <> '' then
              if Copy(UpperCase(trim(vSqlAdicional)), 1, 3) = 'AND' then
                vSqlAdicional := ' ' + Copy(trim(vSqlAdicional), 4, Length(trim(vSqlAdicional)) - 3);

            if not Produto.ConsultaCamposLixeira('PRODUTOS', vValor, vCampo, vCondicao, vOrdem,
              true, vDadosIni.codEmpresa,
              ' PRODUTOS.*,' + vDadosIni.IfThen(vEstoqueDisp, ' EST.ESTOQUE, EST.EST_PRIMA ', ' CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA '),
              vDadosIni.IfThen(vEstoqueDisp,
                ' LEFT JOIN GETESTOQUEDISPONIVEL (PRODUTOS.GRUPO_PROD, PRODUTOS.COD_PROD, 0, PRODUTOS.COD_EMPRESA, 0, '''', 0, 0) EST ON 1 = 1 ',
                ''),
              vSqlAdicional) then
            begin
              if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
              	ComboBox1.SetFocus
            end
            else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
              DBGrid1.SetFocus;
          end
          else
          begin
          	if trim(vSqlAdicional) <> '' then
              if Copy(UpperCase(trim(vSqlAdicional)), 1, 3) = 'AND' then
                vSqlAdicional := ' ' + Copy(trim(vSqlAdicional), 4, Length(trim(vSqlAdicional)) - 3);

            if not Produto.ConsultaCampos('PRODUTOS', vValor, vCampo, vCondicao, vOrdem,
              true, vDadosIni.codEmpresa,
              ' PRODUTOS.*,' + vDadosIni.IfThen(vEstoqueDisp, ' EST.ESTOQUE, EST.EST_PRIMA ', ' CAST(0 AS FLOAT) ESTOQUE, CAST(0 AS FLOAT) EST_PRIMA '),
              vDadosIni.IfThen(vEstoqueDisp,
                ' LEFT JOIN GETESTOQUEDISPONIVEL (PRODUTOS.GRUPO_PROD, PRODUTOS.COD_PROD, 0, PRODUTOS.COD_EMPRESA, 0, '''', 0, 0) EST ON 1 = 1 ',
                ''),
              vSqlAdicional) then
            begin
              if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
              	ComboBox1.SetFocus
            end
            else if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
              DBGrid1.SetFocus;
          end;
        end;
      end;

      if Produto.dataSet.Active then
        for I := 0 to DBGrid1.Columns.Count - 1 do
          if DBGrid1.Columns[i].FieldName = 'OBS_ETIQ' then
            DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

      if ckLixeira.Checked then
      begin
//      	BitBtn3.Visible := false;
        SpeedButton1.Visible := false;
        SpeedButton5.Visible := true;
        btRestaurarRegistro.Visible := true;

        SpeedButton12.Visible := false;
        SpeedButton15.Visible := false;
        SpeedButton22.Visible := false;
        SpeedButton23.Visible := false;
        SpeedButton24.Visible := false;
        SpeedButton26.Visible := false;
        SpeedButton33.Visible := false;
        SpeedButton34.Visible := false;
        SpeedButton35.Visible := false;

        SpeedButtonAlterDados.Visible := false;
        SpeedButtonECommerce.Visible := false;
        SpeedButtonECommerce2.Visible := false;
        SpeedButtonComercioAberto.Visible := false;
        SpeedButtonComercioAberto2.Visible := false;
        SpeedButtonEnvComercioAberto.Visible := false;
        SpeedButtonCashback.Visible := false;
        btHistPreco.Visible := false;

        SpeedButtonAlterarProduto2.Visible := false;
		    SpeedButtonAlterarProduto.Visible := false;
		    SpeedButtonGradesEstoqueProduto.Visible := false;
    		SpeedButtonAlterarGrupoCodProduto.Visible := false;
        SpeedButtonSincronizarOutrasEmpECommerce.Visible := false;
		    btRestaurarRegistro.Visible := true;

        CheckBox3.Checked := false;
        CheckBox18.Checked := false;

        SpeedButton2.Hint := 'Excluir registro permanentemente - [PRO005]';
		   	btExcluirRegistro.Hint := 'Excluir registro permanentemente - [PRO005]';
      end
      else
      begin
//      	BitBtn3.Visible := PageControl1.ActivePage = TabSheet2;
      	SpeedButton1.Visible := true;
        SpeedButton5.Visible := false;
        btRestaurarRegistro.Visible := false;

        SpeedButton12.Visible := true;
        SpeedButton15.Visible := true;
        SpeedButton22.Visible := true;
        SpeedButton23.Visible := true;
        SpeedButton24.Visible := true;
        SpeedButton26.Visible := true;
        SpeedButton33.Visible := true;
        SpeedButton34.Visible := true;
        SpeedButton35.Visible := true;

        SpeedButtonAlterDados.Visible := true;
        SpeedButtonECommerce.Visible := vDadosIni.vEcommerce.vHabilitarEcommerce;
        SpeedButtonECommerce2.Visible := vDadosIni.vEcommerce.vHabilitarEcommerce;
        SpeedButtonComercioAberto.Visible := vDadosIni.vComercioAberto.vHabilitarComercioAberto;
        SpeedButtonComercioAberto2.Visible := vDadosIni.vComercioAberto.vHabilitarComercioAberto;
        SpeedButtonEnvComercioAberto.Visible := vDadosIni.vComercioAberto.vHabilitarComercioAberto;
        SpeedButtonCashback.Visible := vDadosIni.vCashback.vHabilitarCashback;
        btHistPreco.Visible := true;

        SpeedButtonAlterarProduto.Visible := true;
    	  SpeedButtonAlterarProduto2.Visible := true;
	      SpeedButtonGradesEstoqueProduto.Visible := true;
  	    SpeedButtonAlterarGrupoCodProduto.Visible := true;
        SpeedButtonSincronizarOutrasEmpECommerce.Visible := true;
        btRestaurarRegistro.Visible := false;

        SpeedButton2.Hint := 'Enviar para Lixeira - [PRO006]';
		    btExcluirRegistro.Hint := 'Enviar para Lixeira - [PRO006]';
      end;
    finally
      gravaConfiguracoesFormRegistro;
      Produto.ultimasql := Produto.dataSet.CommandText;
      Screen.Cursor := crDefault;
    end;
  end;

  if not Produto.dataSet.IsEmpty then
  begin
    if (PageControl1.ActivePage = tsDefinirPromocoes) then
      Produto.vPromocaoProduto._abrePromocaoProdutos(Produto.dataSet.FieldByName('GRUPO_PROD').AsString, Produto.dataSet.FieldByName('COD_PROD').AsString, '', '', '');

    if (PageControl1.ActivePage = tsDefinirPrecoDiferenciado) then
      Produto.vPromocaoProduto._abrePrecoProdutos(Produto.dataSet.FieldByName('GRUPO_PROD').AsString, Produto.dataSet.FieldByName('COD_PROD').AsString);
  end
  else if ckMenuLateral.Checked then
  begin
    if Produto.vEstoquePorEmpresa.dataSet.Active then
    	Produto.vEstoquePorEmpresa.dataSet.EmptyDataSet;
    if Produto.vEstoquePorEmpresa.vPrecoPorEmpresa.dataSet.Active then
      Produto.vEstoquePorEmpresa.vPrecoPorEmpresa.dataSet.EmptyDataSet;
  end;
end;

procedure TFrmCadProdutos.BitBtn20Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO077', 'EMITIR', '', 'PRODUTOS', '', Produto.buscas, true) then
    //  if vDadosIni.PesqPros('PRO077', '', Produto.buscas, true) then
    Produto.relMedia; //then
  //    qrpMedia.Preview;
end;

procedure TFrmCadProdutos.BitBtn21Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros('PRO075', 'EMITIR', '', 'PRODUTOS', '', Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO075', '', Produto.buscas, true) then
      Exit;
    QRLabel15.Enabled := ckPrecoTab2.Checked;
    QRDBText14.Enabled := ckPrecoTab2.Checked;
    QRLabel101.Enabled := ckPrecoTab2.Checked;
    QRExpr30.Enabled := ckPrecoTab2.Checked;
    Produto.relatorioDeProdutos(ckPrecoTab2.Checked, ckPrecoDif2.Checked, ckPromocao2.Checked, ckPrecoQtde2.Checked,
    'TAB_PRECO', Produto.dataSet.CommandText, TClientDataSet(DBGrid1.DataSource.DataSet).IndexName);
  finally
    _GravaConfiguracoesBoolean('ckPrecoTab2', ckPrecoTab2.Checked);
    _GravaConfiguracoesBoolean('ckPrecoDif2', ckPrecoDif2.Checked);
    _GravaConfiguracoesBoolean('ckPromocao2', ckPromocao2.Checked);
    _GravaConfiguracoesBoolean('ckPrecoQtde2', ckPrecoQtde2.Checked);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn22Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros('PRO022', 'EMITIR', '', 'PRODUTOS', '', Produto.buscas, true) then
     	exit;
    //  if vDadosIni.PesqPros('PRO022', '', produto.buscas, true) then
    Produto.CatalogoPrecos(ckPrecoTab2.Checked, ckPrecoDif2.Checked, ckPromocao2.Checked, ckPrecoQtde2.Checked,
    Produto.dataSet.CommandText, TClientDataSet(DBGrid1.DataSource.DataSet).IndexName);
  finally
    _GravaConfiguracoesBoolean('ckPrecoTab2', ckPrecoTab2.Checked);
    _GravaConfiguracoesBoolean('ckPrecoDif2', ckPrecoDif2.Checked);
    _GravaConfiguracoesBoolean('ckPromocao2', ckPromocao2.Checked);
    _GravaConfiguracoesBoolean('ckPrecoQtde2', ckPrecoQtde2.Checked);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn23Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
  DBGrid1.Parent := Panel1;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) and (DBGrid1.Visible) then
		DBGrid1.SetFocus;
  Produto.vGrupo.dataSet := tclientdataset(dtmProdutos.cdsLocG);
  Produto.vSubGrupo.dataSet := tclientdataset(dtmProdutos.cdsLocSG);
  ckMenuLateralClick(Sender);
end;

procedure TFrmCadProdutos.BitBtn24Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    Produto.relTabPreco(false, ckPrecoTab.Checked, ckPrecoDif.Checked, ckPromocao.Checked, ckPrecoQtde.Checked,
    	Produto.dataSet.CommandText, true);
  finally
    _GravaConfiguracoesBoolean('ckPrecoTab', ckPrecoTab.Checked);
    _GravaConfiguracoesBoolean('ckPrecoDif', ckPrecoDif.Checked);
    _GravaConfiguracoesBoolean('ckPromocao', ckPromocao.Checked);
    _GravaConfiguracoesBoolean('ckPrecoQtde', ckPrecoQtde.Checked);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn25Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    Produto.relTabPreco(true, ckPrecoTab.Checked, ckPrecoDif.Checked, ckPromocao.Checked, ckPrecoQtde.Checked,
    	Produto.dataSet.CommandText, true);
  finally
    _GravaConfiguracoesBoolean('ckPrecoTab', ckPrecoTab.Checked);
    _GravaConfiguracoesBoolean('ckPrecoDif', ckPrecoDif.Checked);
    _GravaConfiguracoesBoolean('ckPromocao', ckPromocao.Checked);
    _GravaConfiguracoesBoolean('ckPrecoQtde', ckPrecoQtde.Checked);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn26Click(Sender: TObject);
begin
  inherited;
  PageControl4.ActivePage := tsEscolha;
  Produto.vGrupo.dataSet := tclientdataset(dtmProdutos.cdsLocG);
  Produto.vSubGrupo.dataSet := tclientdataset(dtmProdutos.cdsLocSG);
end;

procedure TFrmCadProdutos.BitBtn27Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros('PRO022', 'EMITIR', '', 'PRODUTOS', '', Produto.buscas, true) then
      exit;

    QRLabel85.Enabled := ckPrecoTab2.Checked;
    QRDBText43.Enabled := ckPrecoTab2.Checked;
    QRShape27.Enabled := ckPrecoTab2.Checked;
    QRShape26.Enabled := ckPrecoTab2.Checked;

    QRLabel29.Enabled := ckPrecoTab2.Checked;
    QRDBText19.Enabled := ckPrecoTab2.Checked;
    QRShape13.Enabled := ckPrecoTab2.Checked;
    QRShape12.Enabled := ckPrecoTab2.Checked;

    QRLabel117.Enabled := ckPrecoTab2.Checked;
    QRExpr31.Enabled := ckPrecoTab2.Checked;

    //  if vDadosIni.PesqPros('PRO022', '', produto.buscas, true) then
    if ((not ckPrecoDif2.Checked) and (not ckPromocao2.Checked) and (not ckPrecoQtde2.Checked)) then
      Produto.CatalogoPrecosGrafico
    else
      Produto.relatorioDeProdutos(ckPrecoTab2.Checked, ckPrecoDif2.Checked, ckPromocao2.Checked, ckPrecoQtde2.Checked,
      'CATALAGO_PRECO_G', Produto.dataSet.CommandText, TClientDataSet(DBGrid1.DataSource.DataSet).IndexName);
  finally
    _GravaConfiguracoesBoolean('ckPrecoTab2', ckPrecoTab2.Checked);
    _GravaConfiguracoesBoolean('ckPrecoDif2', ckPrecoDif2.Checked);
    _GravaConfiguracoesBoolean('ckPromocao2', ckPromocao2.Checked);
    _GravaConfiguracoesBoolean('ckPrecoQtde2', ckPrecoQtde2.Checked);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn28Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO084', 'SALVAR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('COD_RECEITA').AsString, Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO084', Produto.dataSet.FieldByName('COD_RECEITA').AsString,
    //    produto.buscas, true) then
    Exit;

  if Produto.vRecAss.Post then
  begin
    GroupBox24.Enabled := true;
    if (Self.Enabled) and (Self.Visible) and (DBGrid9.CanFocus) then
      DBGrid9.SetFocus;
    BitBtn28.Enabled := false;
    //    BitBtn29.Enabled := true;
  end;
end;

procedure TFrmCadProdutos.BitBtn29Click(Sender: TObject);
begin
  inherited;
  GroupBox24.Visible := False;
  Produto.vRecAss.Cancel;
  Produto.vRecAss.Close;
  if True then

  if tsReceitaAss.Tag = 1 then
  begin
    if Produto.cadastroSimplificado then
      PageControl1.ActivePage := tsCadastroSimples
    else
      PageControl1.ActivePage := TabSheet1
  end
  else
  begin
    PageControl1.ActivePage := TabSheet2;
    if DBGrid1.Visible then
    	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	      DBGrid1.SetFocus;
  end;
end;

procedure TFrmCadProdutos.BitBtn2Click(Sender: TObject);
begin
  if (Produto.CodBarra.dataSet.ChangeCount > 0) or (Produto.dataSet.ChangeCount > 0) then
    if Application.MessageBox('Foram feitas alterações no banco de dados.' + chr(13) +
      'Deseja cancelar as alterações e sair?', 'Confirmação', MB_YESNO + MB_ICONQUESTION +
      MB_DEFBUTTON1) = mrYES then
    begin
      Produto.Cancel;
      Produto.CancelUpdates;
      Produto.CodBarra.Cancel;
      Produto.CodBarra.CancelUpdates;
      Produto.CloseDependentes();
      Produto.RollBackTransacao;
    end
    else
    begin
      PageControl3.ActivePage := TabSheet3;
      if (Self.Enabled) and (Self.Visible) and (DBEdit59.CanFocus) then
        DBEdit59.SetFocus;
      exit;
    end;
  inherited;
end;

procedure TFrmCadProdutos.BitBtn30Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS', 'A', Produto.buscas) then
    Exit;
  if not vDadosIni.PesqPros('PRO083', 'UTILIZAR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('COD_RECEITA').AsString
    +
    'PROD: ' + Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
    Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO083', 'REC: ' + Produto.dataSet.FieldByName('COD_RECEITA').AsString
    //    +
    //    'PROD: ' + Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
    //    Produto.dataSet.FieldByName('COD_PROD').AsString,
    //    produto.buscas, true) then
    Exit;
  if Produto.vRecAss.utilizar(Produto, tsReceitaAss.Tag = 2) then
  begin
    GroupBox24.Visible := False;
    if tsReceitaAss.Tag = 1 then
    begin
      if Produto.cadastroSimplificado then
        PageControl1.ActivePage := tsCadastroSimples
      else
        PageControl1.ActivePage := TabSheet1
    end
    else
    begin
      PageControl1.ActivePage := TabSheet2;
      if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
        DBGrid1.SetFocus;
    end;
  end;
end;

procedure TFrmCadProdutos.BitBtn31Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_RECEITAS', 'I', Produto.buscas) then
    Exit;
  if not vDadosIni.PesqPros('PRO082', 'ADICIONAR', '', 'PRODUTOS', '', Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO082', '', produto.buscas, true) then
    Exit;
  if Produto.vRecAss.Insert then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
      DBMemo1.SetFocus;
    GroupBox24.Enabled := false;
    BitBtn28.Enabled := true;
    //    BitBtn29.Enabled := false;
    BitBtn34.Enabled := true;
  end;
end;

procedure TFrmCadProdutos.BitBtn32Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_RECEITAS', 'A', Produto.buscas) then
    Exit;
  if not vDadosIni.PesqPros('PRO081', 'ADICIONAR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('COD_RECEITA').AsString, Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO081', Produto.dataSet.FieldByName('COD_RECEITA').AsString,
    //    produto.buscas, true) then
    Exit;
  if Produto.vRecAss.Edit then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
      DBMemo1.SetFocus;
    GroupBox24.Enabled := false;
    BitBtn28.Enabled := true;
    //    BitBtn29.Enabled := false;
    BitBtn34.Enabled := true;
  end;
end;

procedure TFrmCadProdutos.BitBtn33Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_RECEITAS', 'A', Produto.buscas) then
    Exit;
  if not vDadosIni.PesqPros('PRO080', 'DELETAR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('COD_RECEITA').AsString, Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO080', Produto.dataSet.FieldByName('COD_RECEITA').AsString,
    //    produto.buscas, true) then
    Exit;
  Produto.vRecAss.Delete
end;

procedure TFrmCadProdutos.BitBtn34Click(Sender: TObject);
begin
  inherited;
  Produto.vRecAss.Cancel;
  BitBtn34.Enabled := False;
  BitBtn28.Enabled := false;
  //  BitBtn29.Enabled := true;
  GroupBox24.Enabled := true;
end;

procedure TFrmCadProdutos.BitBtn35Click(Sender: TObject);
begin
  inherited;
  if not DBGrid15.DataSource.DataSet.IsEmpty then
    Produto.deletaEtiProdTemp(DBGrid15.DataSource.DataSet.FieldByName('NITEM').AsInteger, false);
end;

procedure TFrmCadProdutos.BitBtn36Click(Sender: TObject);
var
  ARescueOptions: TDBGridOptions;
  vRecno: Integer;
begin
  Screen.Cursor := crHourGlass;
	try
  	DBGrid15.DataSource.DataSet.DisableControls;

    if DBGrid15.DataSource.DataSet.RecordCount > 0 then
	    vRecno := DBGrid15.DataSource.DataSet.RecNo;
      
    ARescueOptions := DBGrid15.Options;
    DBGrid15.Options := DBGrid15.Options + [dgMultiSelect];

    DBGrid15.DataSource.DataSet.First;
    while not DBGrid15.DataSource.DataSet.Eof do
    begin
    	if (DBGrid15.SelectedRows.CurrentRowSelected) and (DBGrid15.DataSource.DataSet.FieldByName('sel').AsString <> 'S') then
      begin
      	DBGrid15.DataSource.DataSet.Edit;
      	DBGrid15.DataSource.DataSet.FieldByName('sel').AsString := 'S';
        DBGrid15.DataSource.DataSet.Post;
      end
    	else if DBGrid15.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
	      DBGrid15.SelectedRows.CurrentRowSelected := DBGrid15.DataSource.DataSet.FieldByName('sel').AsString = 'S';
      DBGrid15.DataSource.DataSet.Next;
    end;

    if vDadosIni.PesqPros('PRO152', 'IMPRIMIR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Produto.ImprimirEtiquetasQRP('PRODUTOS', 'Etiqueta de Produtos', DBGrid15, true, ckImprimirQtdeEstoqueMarcadas.Checked);
  finally
    _GravaConfiguracoesBoolean('ckImprimirQtdeEstoqueMarcadas', ckImprimirQtdeEstoqueMarcadas.Checked);
    DBGrid15.Options := ARescueOptions;
    if DBGrid15.DataSource.DataSet.RecordCount > 0 then
	    DBGrid15.DataSource.DataSet.RecNo := vRecno;
    DBGrid15.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn37Click(Sender: TObject);
begin
  inherited;
  Produto.deletaEtiProdTemp(0, true);
end;

procedure TFrmCadProdutos.BitBtn38Click(Sender: TObject);
var
  ARescueOptions: TDBGridOptions;
  vRecno: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
  	DBGrid15.DataSource.DataSet.DisableControls;

    if DBGrid15.DataSource.DataSet.RecordCount > 0 then
	    vRecno := DBGrid15.DataSource.DataSet.RecNo;
    
    ARescueOptions := DBGrid15.Options;
    DBGrid15.Options := DBGrid15.Options + [dgMultiSelect];

    DBGrid15.DataSource.dataSet.First;
    while not DBGrid15.DataSource.dataSet.Eof do
    begin
    	if (DBGrid15.SelectedRows.CurrentRowSelected) and (DBGrid15.DataSource.dataSet.FieldByName('sel').AsString <> 'S') then
      begin
      	DBGrid15.DataSource.dataSet.Edit;
      	DBGrid15.DataSource.dataSet.FieldByName('sel').AsString := 'S';
        DBGrid15.DataSource.dataSet.Post;
      end
    	else if DBGrid15.DataSource.dataSet.FieldByName('sel').AsString = 'S' then
	      DBGrid15.SelectedRows.CurrentRowSelected := DBGrid15.DataSource.dataSet.FieldByName('sel').AsString = 'S';
      DBGrid15.DataSource.dataSet.Next;
    end;
    
    Produto.relEtiTermica(false, true, DBGrid15);
  finally
  	DBGrid15.Options := ARescueOptions;
    if DBGrid15.DataSource.DataSet.RecordCount > 0 then
	    DBGrid15.DataSource.DataSet.RecNo := vRecno; 
    DBGrid15.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn39Click(Sender: TObject);
var
  ARescueOptions: TDBGridOptions;
  vRecno: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
  	DBGrid15.DataSource.DataSet.DisableControls;

    if DBGrid15.DataSource.DataSet.RecordCount > 0 then
	    vRecno := DBGrid15.DataSource.DataSet.RecNo;
    
    ARescueOptions := DBGrid15.Options;
    DBGrid15.Options := DBGrid15.Options + [dgMultiSelect];

    DBGrid15.DataSource.dataSet.First;
    while not DBGrid15.DataSource.dataSet.Eof do
    begin
    	if (DBGrid15.SelectedRows.CurrentRowSelected) and (DBGrid15.DataSource.dataSet.FieldByName('sel').AsString <> 'S') then
      begin
      	DBGrid15.DataSource.dataSet.Edit;
      	DBGrid15.DataSource.dataSet.FieldByName('sel').AsString := 'S';
        DBGrid15.DataSource.dataSet.Post;
      end
    	else if DBGrid15.DataSource.dataSet.FieldByName('sel').AsString = 'S' then
	      DBGrid15.SelectedRows.CurrentRowSelected := DBGrid15.DataSource.dataSet.FieldByName('sel').AsString = 'S';
      DBGrid15.DataSource.dataSet.Next;
    end;
    
    Produto.relEtiIntermec(false, true, DBGrid15);
  finally
  	DBGrid15.Options := ARescueOptions;
    if DBGrid15.DataSource.DataSet.RecordCount > 0 then
	    DBGrid15.DataSource.DataSet.RecNo := vRecno; 
    DBGrid15.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS', 'I', Produto.buscas) then
    Exit;   
  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    ShowAtencao('NFCe modo Offline, não permite inclusão de registros. Por favor acesso o sistema remoto');
    Exit;
  end;

  if not vDadosIni.PesqPros('PRO002', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
    Exit;

  Produto.cadastroSimplificado := vDadosIni.getConfSisBool('prod_cad_simpl_habilitado', Produto.buscas);

  vDadosIni.vInibeMensPesqPros := 'S';
  SpeedButtonAlternarCadastro.Visible := vDadosIni.PesqPros('PRO458', 'HABILITAR', '', 'PRODUTOS', '', Produto.buscas, true);
  SpeedButtonAlternarCadastro2.Visible := SpeedButtonAlternarCadastro.Visible;

  if Produto.cadastroSimplificado then
  begin
    if not Produto.Insert then
      exit;

    HabilitarCamposInclusao;
  end
  else
  begin
    if not Produto.dataSet.Active then
      Produto.abreProdutos;

    if not Produto.Insert then
      exit;

    HabilitarCamposInclusao;
  end;
end;

procedure TFrmCadProdutos.BitBtn40Click(Sender: TObject);
var
  ARescueOptions: TDBGridOptions;
  vRecno: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
  	DBGrid15.DataSource.DataSet.DisableControls;

    if DBGrid15.DataSource.DataSet.RecordCount > 0 then
	    vRecno := DBGrid15.DataSource.DataSet.RecNo;
    
    ARescueOptions := DBGrid15.Options;
    DBGrid15.Options := DBGrid15.Options + [dgMultiSelect];

    DBGrid15.DataSource.dataSet.First;
    while not DBGrid15.DataSource.dataSet.Eof do
    begin
    	if (DBGrid15.SelectedRows.CurrentRowSelected) and (DBGrid15.DataSource.dataSet.FieldByName('sel').AsString <> 'S') then
      begin
      	DBGrid15.DataSource.dataSet.Edit;
      	DBGrid15.DataSource.dataSet.FieldByName('sel').AsString := 'S';
        DBGrid15.DataSource.dataSet.Post;
      end
    	else if DBGrid15.DataSource.dataSet.FieldByName('sel').AsString = 'S' then
	      DBGrid15.SelectedRows.CurrentRowSelected := DBGrid15.DataSource.dataSet.FieldByName('sel').AsString = 'S';
      DBGrid15.DataSource.dataSet.Next;
    end;
    
    Produto.relEtiUmaColuna(false, true, DBGrid15);
  finally
  	DBGrid15.Options := ARescueOptions;
    if DBGrid15.DataSource.DataSet.RecordCount > 0 then
	    DBGrid15.DataSource.DataSet.RecNo := vRecno; 
    DBGrid15.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn41Click(Sender: TObject);
var
  ARescueOptions: TDBGridOptions;
  vRecno: Integer;
begin
  Screen.Cursor := crHourGlass;
	try
  	DBGrid15.DataSource.DataSet.DisableControls;

    if DBGrid15.DataSource.DataSet.RecordCount > 0 then
	    vRecno := DBGrid15.DataSource.DataSet.RecNo;
      
    ARescueOptions := DBGrid15.Options;
    DBGrid15.Options := DBGrid15.Options + [dgMultiSelect];

    DBGrid15.DataSource.DataSet.First;
    while not DBGrid15.DataSource.DataSet.Eof do
    begin
    	if (DBGrid15.SelectedRows.CurrentRowSelected) and (DBGrid15.DataSource.DataSet.FieldByName('sel').AsString <> 'S') then
      begin
      	DBGrid15.DataSource.DataSet.Edit;
      	DBGrid15.DataSource.DataSet.FieldByName('sel').AsString := 'S';
        DBGrid15.DataSource.DataSet.Post;
      end
    	else if DBGrid15.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
	      DBGrid15.SelectedRows.CurrentRowSelected := DBGrid15.DataSource.DataSet.FieldByName('sel').AsString = 'S';
      DBGrid15.DataSource.DataSet.Next;
    end;
    
    Produto.relEtiArgox(false, true, DBGrid15, ComboBox16.Text);
  finally
    _GravaConfiguracoesInteger('ComboBox16', ComboBox16.ItemIndex);
    DBGrid15.Options := ARescueOptions;
    if DBGrid15.DataSource.DataSet.RecordCount > 0 then
	    DBGrid15.DataSource.DataSet.RecNo := vRecno;
    DBGrid15.DataSource.DataSet.EnableControls;
     Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn42Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO093', 'EDITAR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
    Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO093', 'EDITANDO: ' +
    //    Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
    //    Produto.dataSet.FieldByName('COD_PROD').AsString, produto.buscas, true) then
    Exit;
  if Produto.Edit then
  begin
    Produto.oldGrupoProd := Produto.dataSet.FieldByName('GRUPO_PROD').AsString;
    Produto.oldCodProd := trim(Produto.dataSet.FieldByName('COD_PROD').AsString);
    Produto.statusRegistro := 'E';
    panelEditCusto.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (DBEdit23.CanFocus) then
      DBEdit23.SetFocus;
  end;
end;

procedure TFrmCadProdutos.BitBtn43Click(Sender: TObject);
begin
  inherited;
  try
    if Produto.Post then
      if Produto.Apply then
      begin
        Produto.CommitaTransacao;
        panelEditCusto.Visible := false;
        vDadosIni.GravaAuditoria('PRO094', 'APLICAR', 'SUCESSO', 'PRODUTOS',
          Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
          Produto.dataSet.FieldByName('COD_PROD').AsString, produto.buscas);
        //        vDadosIni.GravaAuditoria('PRO094', 'TRANSACAO CONFIRMADA' +
        //          Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
        //          Produto.dataSet.FieldByName('COD_PROD').AsString, produto.buscas);
      end
      else
        vDadosIni.PesqPros('PRO094', 'APLICAR', 'FALHA', 'PRODUTOS',
          Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
          Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true);
    //        vDadosIni.PesqPros('PRO094', 'APPLY NAO EFETUADO' +
    //          Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
    //          Produto.dataSet.FieldByName('COD_PROD').AsString, produto.buscas, true);
    vDadosIni.fechaStatusProcessamento;
    panelEditCusto.Visible := false;
  except
    on E: EXCEPTION do
    begin
      Produto.RollBackTransacao;
      vDadosIni.GravaAuditoria('PRO094', 'ROLLBACK', 'FALHA', 'PRODUTOS',
        Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
        Produto.dataSet.FieldByName('COD_PROD').AsString, produto.buscas);
      //
      //      vDadosIni.GravaAuditoria('PRO094', 'ROOLBACK TRANSACAO' +
      //        Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
      //        Produto.dataSet.FieldByName('COD_PROD').AsString, produto.buscas);
      Produto.registraErro(E.Message);
    end;
  end;
end;

procedure TFrmCadProdutos.BitBtn44Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO091', 'EDITAR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
    Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO091', 'EDITANDO: ' +
    //    Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
    //    Produto.dataSet.FieldByName('COD_PROD').AsString, produto.buscas, true) then
    Exit;
//  Produto.preparaAlterarEstoque(EditMoeda1, EditMoeda2);
  EditMoeda1.Valor := vDadosIni.getEstoqueDisponivel(Produto.buscas,
    Produto.dataSet.FieldByName('grupo_prod').AsInteger,
    Produto.dataSet.FieldByName('cod_prod').AsString);
  EditMoeda1.Enabled := true;
//  EditMoeda2.Enabled := true;
  if (Self.Enabled) and (Self.Visible) and (EditMoeda1.CanFocus) then
    EditMoeda1.SetFocus;
end;

procedure TFrmCadProdutos.BitBtn45Click(Sender: TObject);
var
  vEstoqueDispo, vEstoquePrima: Extended;
begin
  inherited;
  if not vDadosIni.PesqPros('PRO092', 'EDITAR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
    Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true) then
      Exit;

  if EditMoeda1.Enabled then
    if Produto.alterarEstoque(EditMoeda1.Valor, 0) then
    begin
      EditMoeda1.Valor := 0;
//      EditMoeda2.Valor := 0;
      EditMoeda1.Enabled := false;
//      EditMoeda2.Enabled := false;

      Produto.dataSet.Refresh;

      vEstoqueDispo := vDadosIni.getEstoqueDisponivel(Produto.buscas,
        Produto.dataSet.FieldByName('grupo_prod').AsInteger,
        Produto.dataSet.FieldByName('cod_prod').AsString);

      vEstoquePrima := vDadosIni.getEstoquePrima(Produto.buscas,
        Produto.dataSet.FieldByName('grupo_prod').AsInteger,
        Produto.dataSet.FieldByName('cod_prod').AsString);

      Label121.Caption := Format('%0.3f', [vEstoqueDispo]);

      Label260.Caption := Format('%0.3f', [Produto.dataSet.FieldByName('est_f').AsFloat - vEstoqueDispo]);

      Exit;


//      if Produto._produtoPossuiGrade(Produto.dataSet.FieldByName('GRUPO_PROD').AsInteger,
//        Produto.dataSet.FieldByName('COD_PROD').AsString) then
//      if Produto.alterarEstProd_Grade then
//      begin
//        Application.MessageBox(PChar('Ã‰ necessário confirmar também a alteração nas grades do produto para que seja confirmada a mudança no estoque.'),
//            'Atenção', MB_OK + MB_ICONINFORMATION +MB_DEFBUTTON1);
//        SpeedButton12Click(Sender);
//      end;
    end;
end;

procedure TFrmCadProdutos.BitBtn46Click(Sender: TObject);
begin
  inherited;
  EditMoeda1.Valor := 0;
//  EditMoeda2.Valor := 0;
  EditMoeda1.Enabled := false;
//  EditMoeda2.Enabled := false;
end;

procedure TFrmCadProdutos.BitBtn47Click(Sender: TObject);
begin
  inherited;
  EditMoeda1.Valor := 0;
//  EditMoeda2.Valor := 0;
  EditMoeda1.Enabled := false;
//  EditMoeda2.Enabled := false;
  panelEditCusto.Visible := false;
  PageControl1.ActivePage := TabSheet2;
  if DBGrid1.Visible then
  	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	    DBGrid1.SetFocus;
end;

procedure TFrmCadProdutos.BitBtn48Click(Sender: TObject);
begin
  inherited;
  Produto.Cancel;
  panelEditCusto.Visible := false;
end;

procedure TFrmCadProdutos.BitBtn4Click(Sender: TObject);
var
  codgrupo: integer;
  codprod: string;
  campo: string;
  vEstoque: Double;
  vSqlProd: string;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Validando dados do produto');

    if Produto.cadastroSimplificado then
    	Produto.dataSet.FieldByName('OBS_ETIQ').AsString := MemoObsEtiqSimples.Lines.Text
    else
    	Produto.dataSet.FieldByName('OBS_ETIQ').AsString := MemoObsEtiq.Lines.Text;

    if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
	    BitBtn4.SetFocus;
      
    if not Produto.DadosProdutoObrigatorios then
    begin
      setFocusCampoErro(Produto.vNomeCampoErro, Produto.vMensagemErro);
      exit;
    end;
    vEstoque := Produto.dataSet.FieldByName('est_f').AsFloat +
      Produto.dataSet.FieldByName('est_r').AsFloat;
    if DBLookupComboBox1.Enabled then
      DBLookupComboBox1Exit(Sender);

    if (vDadosIni.vEmp.vUsarProducao = 'S') then
    begin
     if vDadosIni.produtoAcabadoPrimaTemGrade(
       Produto.buscas,
       Produto.dataSet.FieldByName('grupo_prod').AsInteger,
       Produto.dataSet.FieldByName('cod_prod').AsString,
       0,
       '') then
     begin
       if vDadosIni.existeGradeProducao(
        Produto.buscas,
        Produto.dataSet.FieldByName('grupo_prod').AsInteger,
        Produto.dataSet.FieldByName('cod_prod').AsString,
        0,
        '') then
       begin
         if not vDadosIni.vincularProdutoAcabadoMateriaPrima(
           Produto.buscas,
           Produto.dataSet.FieldByName('grupo_prod').AsInteger,
           Produto.dataSet.FieldByName('cod_prod').AsString,
           0,
           0,
           '',
           0,
         	 true) then
             exit;
       end;
     end;
    end;

    if not Produto.Post then
    begin
      if setFocusCampoErro(Produto.vNomeCampoErro, Produto.vMensagemErro) then
        Exit;
      PageControl3.ActivePage := TabSheet3;
      if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
        DBEdit16.SetFocus;
      exit;
    end
    else if (vDadosIni.vAbrirGradeProduto = 'S') and (Produto._FormProdutos = nil) then
    begin
      vSqlProd := Produto.dataSet.CommandText;
      Produto.abreProdutos(StrToInt(Produto.oldGrupoProd), Produto.oldCodProd, 1);

      if not Produto.dataSet.IsEmpty then
      begin
        Label170.Caption := Format('%0.2f', [
        	Produto.dataSet.FieldByName('est_f').AsFloat]);

        Label208.Caption := Format('%0.2f', [
          vDadosIni.getEstoqueDisponivel(Produto.buscas,
	          Produto.dataSet.FieldByName('grupo_prod').AsInteger,
            	Produto.dataSet.FieldByName('cod_prod').AsString)]);

        Label495.Caption := Format('%0.2f', [
			  	vDadosIni.getEstoquePrima(Produto.buscas,
  					Produto.dataSet.FieldByName('grupo_prod').AsInteger,
				    	Produto.dataSet.FieldByName('cod_prod').AsString)]);

        Label494.Visible := (Produto.dataSet.FieldByName('criar_producao_aut').AsString = 'S')
          and (vDadosIni.vEmp.vUsarProducao = 'S');

        Label495.Visible := (Produto.dataSet.FieldByName('criar_producao_aut').AsString = 'S')
          and (vDadosIni.vEmp.vUsarProducao = 'S');

        Produto.vGradeEst.abreGradeEstoque(Produto.dataSet.FieldByName('grupo_prod').AsString,
          Produto.dataSet.FieldByName('cod_prod').AsString);
        Produto.vGradeEst.vGrade.dataSet.Filtered := false;
        Produto.vGradeEst.vGrade.dataSet.Filter := ' cod_grade<>0 ';
        Produto.vGradeEst.vGrade.dataSet.Filtered := true;
        Produto.vGradeEst._abreFormGradesEstoque(Produto);
        Produto.vGradeEst.vGrade.dataSet.Filtered := false;
        PageControl1.ActivePage := tsGrade;
        Produto.vGradeEst.abreGradeEstoque(Produto.dataSet.FieldByName('grupo_prod').AsString,
          Produto.dataSet.FieldByName('cod_prod').AsString);
      end;
      Produto.montaSelect(vSqlProd);
    end;
    if Produto.AlterarGrupo then
    	Produto.vGrupo.abreGrupos;
    Produto.AlterarGrupo := false;
    Produto.AtualizarProduto := false;
    GroupBox4.Enabled := true;
    GroupBox5.Enabled := true;
    GroupBox7.Enabled := true;
    GroupBox10.Enabled := true;
    GroupBox6.Enabled := true;
    GroupBox8.Enabled := true;
    //          Application.MessageBox('As alterações não poderão ser salvas.' + chr(13) +
    //            'Verifique as possíveis causas e tente novamente.', 'Aviso', MB_OK + MB_ICONERROR +
    //            MB_DEFBUTTON1);
    if ((TelaCadastro = 4) or (TelaCadastro = 5)) then
    begin
    	PageControl1.ActivePage := tsAlterDadosProd;
      tsAlterDadosProd.Show;
      exit;
    end
    else if TelaCadastro = 1 then
    begin
      BitBtn6.Click;
      Exit;
    end;
    if CheckCadSeq.Checked then
      BitBtn3Click(Sender)
    else
    begin
      Produto.CloseDependentes();
      inherited;
      ckMenuLateralClick(ckMenuLateral);
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadProdutos.BitBtn50Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO105', 'EDITAR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
    Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO105', '', produto.buscas, true) then
    Exit;
  if Produto.vRed.Edit then
    if (Self.Enabled) and (Self.Visible) and (DBEdit86.CanFocus) then
      DBEdit86.SetFocus;
end;

procedure TFrmCadProdutos.BitBtn51Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO104', 'GRAVAR', '', 'PRODUTOS', '', Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO104', '', produto.buscas, true) then
    Exit;
  if not Produto.vRed.Post then
    if (Self.Enabled) and (Self.Visible) and (DBEdit86.CanFocus) then
      DBEdit86.SetFocus;
end;

procedure TFrmCadProdutos.BitBtn52Click(Sender: TObject);
begin
  inherited;
  Produto.vRed.Cancel;
end;

procedure TFrmCadProdutos.BitBtn53Click(Sender: TObject);
begin
  inherited;
  Produto.vRed.Cancel;
//  PageControl1.ActivePage := TabSheet1;
end;

procedure TFrmCadProdutos.BitBtn54Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO107', 'APAGAR', '', 'PRODUTOS', '', Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO107', '', produto.buscas, true) then
    Exit;
  if Produto.vRed.Delete then
    if Produto.vRed.Apply then
      Produto.vRed.CommitaTransacao;
end;

procedure TFrmCadProdutos.BitBtn55Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO109', 'EMITIR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
    Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO109', '', Produto.buscas, true) then
    Exit;
  PageControl4.ActivePage := tsFichaProds;
  DBGrid11.Columns := DBGrid1.Columns;
end;

procedure TFrmCadProdutos.BitBtn56Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO106', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO106', '', produto.buscas, true) then
    Exit;
  if Produto.vRed.Insert(Produto) then
    if (Self.Enabled) and (Self.Visible) and (DBEdit86.CanFocus) then
      DBEdit86.SetFocus;
end;

procedure TFrmCadProdutos.BitBtn57Click(Sender: TObject);
begin
  inherited;
  Produto.relFichaProduto;
end;

procedure TFrmCadProdutos.BitBtn58Click(Sender: TObject);
begin
  inherited;
  PageControl4.ActivePage := tsEscolha;
  DBGrid11.Columns.Clear;
end;

procedure TFrmCadProdutos.BitBtn59Click(Sender: TObject);
begin
  inherited;

  try
    strtoint(maskedit18.text);
    strtoint(maskedit14.text);
    strtoint(maskedit15.text);
    strtoint(maskedit16.text);
    strtoint(maskedit17.text);
  except
    Application.MessageBox('Erro de Conversão dos dados do tempo cíclico', 'Aviso', MB_OK +
      MB_ICONWARNING + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (TMaskEdit(sender).CanFocus) then
      TMaskEdit(sender).setfocus;
    exit;
  end;
  try
    strtoint(combobox13.text);
  except
    Application.MessageBox('Erro de Conversão dos dados do tempo cíclico', 'Aviso', MB_OK +
      MB_ICONWARNING + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (TComboBox(sender).CanFocus) then
      TComboBox(sender).setfocus;
    exit;
  end;

  if (CheckBox6.Checked) and (EditMoeda3.Valor = 0) then
  begin
    Application.MessageBox('Para gerar o inventário se usar Divisão o valor do Acréscimo ou Desconto não pode ser zero.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EditMoeda3.CanFocus) then
      EditMoeda3.SetFocus;
    exit;
  end;

  BorderIcons := [];
  BitBtn59.Enabled := false;
  BitBtn60.Enabled := true;
  BitBtn61.Enabled := false;
  Produto.vusTipo74 := IfThen(CheckBox13.Checked, 'S', 'N') ;

  try
    RadioGroup1.Enabled := False;
    Screen.Cursor := crHourGlass;
    if RadioGroup1.ItemIndex = 0 then
      Produto.CalculaGiroEstoque(label154, ProgressBar2, MaskEdit12.Text, strtoint(MaskEdit18.Text),
        strtoint(MaskEdit14.Text), strtoint(MaskEdit15.Text), strtoint(MaskEdit16.Text),
        strtoint(MaskEdit17.Text), StrToInt(ComboBox13.Text))
    else if RadioGroup1.ItemIndex = 1 then
    begin
      if Produto.CalculaGiroEstoque(label154, ProgressBar2, MaskEdit12.Text,
        strtoint(MaskEdit18.Text), strtoint(MaskEdit14.Text), strtoint(MaskEdit15.Text),
        strtoint(MaskEdit16.Text), strtoint(MaskEdit17.Text), StrToInt(ComboBox13.Text)) then
        Produto.InventarioProd(label154, ProgressBar2, MaskEdit12.Text, ComboBox14.Text,
          ComboBox15.Text, CheckBox7.Checked, CheckBox6.Checked, CheckBox8.Checked,
          CheckBox5.Checked,
          EditMoeda3.Valor, SpinEdit1.Value);
    end
    else
      Produto.InventarioProd(label154, ProgressBar2, MaskEdit12.Text, ComboBox14.Text,
        ComboBox15.Text, CheckBox7.Checked, CheckBox6.Checked, CheckBox8.Checked, CheckBox5.Checked,
        EditMoeda3.Valor, SpinEdit1.Value);
  finally
    RadioGroup1.Enabled := True;
    Screen.Cursor := crDefault;
  end;

  BorderIcons := [biSystemMenu, biMinimize, biMaximize];
  BitBtn59.Enabled := true;
  BitBtn60.Enabled := false;
  BitBtn61.Enabled := true;
end;

procedure TFrmCadProdutos.BitBtn5Click(Sender: TObject);
begin
//  if not vDadosIni.PesqPros('PRO010', 'CANCELAR', '', 'PRODUTOS', '', Produto.buscas, true) then
//    Exit;

  Produto.Cancel;
  Produto.CancelUpdates;
  Produto.CodBarra.Cancel;
  Produto.CodBarra.CancelUpdates;
  Produto.CloseDependentes();
  Produto.RollBackTransacao;
  if (not Produto.AlterarGrupo) and (Produto.cadastroSimplificado) then
    ActiveControl := BitBtn_5
  else
  begin
    if Produto.AlterarGrupo then
    	Produto.vGrupo.abreGrupos;
    Produto.AlterarGrupo := false;
    Produto.AtualizarProduto := false;
    GroupBox4.Enabled := true;
    GroupBox5.Enabled := true;
    GroupBox7.Enabled := true;
    GroupBox10.Enabled := true;
    GroupBox6.Enabled := true;
    GroupBox8.Enabled := true;
    ActiveControl := BitBtn5;
  end;
  if ((TelaCadastro = 4) or (TelaCadastro = 5)) then
  begin
    PageControl1.ActivePage := tsAlterDadosProd;
    tsAlterDadosProd.Show;
    exit;
  end;
  inherited;
  TabSheet2.Show;

  if (not Produto.dataSet.IsEmpty)
  	and (ckMenuLateral.Checked)
    and (MenuLateralExibirCodigos.Checked) then
  begin
    Produto.CodBarra.abreCodBarrasProd(
      Produto.dataSet.FieldByName('GRUPO_PROD').AsInteger,
      Produto.dataSet.FieldByName('COD_PROD').AsString);
  end;
end;

procedure TFrmCadProdutos.BitBtn60Click(Sender: TObject);
begin
  inherited;
  if RadioGroup1.ItemIndex = 0 then
    Produto.Parar := 1
  else
    Produto.vInvProd.parar := true;
  //  Produto.Parar := 1;
  //  Produto.PararInventario;
end;

procedure TFrmCadProdutos.BitBtn61Click(Sender: TObject);
begin
  // inherited;
  if TelaCadastro = 2 then
  begin
  	tsGe.TabVisible := false;
    PageControl1.ActivePage := TabSheet2;
    BitBtn2Click(Sender);
  end
  else
  begin
  	tsGe.TabVisible := false;
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
  end;
end;

procedure TFrmCadProdutos.BitBtn62Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO153', 'EMITIR', '', 'PRODUTOS', '', Produto.buscas, true) then
    //    if vDadosIni.PesqPros('PRO153', '', Produto.buscas, true) then
    Produto.relPecasUltimaCompra;
end;

procedure TFrmCadProdutos.BitBtn63Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO152', 'EMITIR', '', 'PRODUTOS', '', Produto.buscas, true) then
    //  if vDadosIni.PesqPros('PRO152', '', Produto.buscas, true) then
    Produto.relReqMercadorias;
end;

procedure TFrmCadProdutos.BitBtn64Click(Sender: TObject);
var
  ARescueOptions: TDBGridOptions;
begin
  Screen.Cursor := crHourGlass;
  try
  	DBGrid1.DataSource.DataSet.DisableControls;
    Produto.storeRecNo;
    ARescueOptions := DBGrid1.Options;
    DBGrid1.Options := DBGrid1.Options + [dgMultiSelect];
    
    Produto.dataSet.First;
    while not Produto.dataSet.Eof do
    begin
    	if (DBGrid1.SelectedRows.CurrentRowSelected) and (Produto.dataSet.FieldByName('sel').AsString <> 'S') then
      begin
      	Produto.dataSet.Edit;
      	Produto.dataSet.FieldByName('sel').AsString := 'S';
        Produto.dataSet.Post;
      end
    	else if Produto.dataSet.FieldByName('sel').AsString = 'S' then
	      DBGrid1.SelectedRows.CurrentRowSelected := Produto.dataSet.FieldByName('sel').AsString = 'S';
      Produto.dataSet.Next;
    end;
    
  	Produto.relEtiTermica(CheckBox9.Checked, false, DBGrid1);
  finally
    _GravaConfiguracoesBoolean('CheckBox9', CheckBox9.Checked);
    DBGrid1.Options := ARescueOptions;
    Produto.restoreRecNo;
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn65Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    Produto.montaSelect(Produto.ultimasql);
    DBGrid1.Options := DBGrid1.Options - [dgMultiSelect];
    TabSheet2.Show;
    DBGrid1.Parent := Panel1;
    ckMenuLateralClick(Sender);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn66Click(Sender: TObject);
var
  ARescueOptions: TDBGridOptions;
begin
  Screen.Cursor := crHourGlass;
  try
  	DBGrid1.DataSource.DataSet.DisableControls;
    Produto.storeRecNo;
    ARescueOptions := DBGrid1.Options;
    DBGrid1.Options := DBGrid1.Options + [dgMultiSelect];
    
    Produto.dataSet.First;
    while not Produto.dataSet.Eof do
    begin
    	if (DBGrid1.SelectedRows.CurrentRowSelected) and (Produto.dataSet.FieldByName('sel').AsString <> 'S') then
      begin
      	Produto.dataSet.Edit;
      	Produto.dataSet.FieldByName('sel').AsString := 'S';
        Produto.dataSet.Post;
      end
    	else if Produto.dataSet.FieldByName('sel').AsString = 'S' then
	      DBGrid1.SelectedRows.CurrentRowSelected := Produto.dataSet.FieldByName('sel').AsString = 'S';
      Produto.dataSet.Next;
    end;
    
    Produto.relEtiIntermec(CheckBox10.Checked, false, DBGrid1);
  finally
    _GravaConfiguracoesInteger('RadioGroupOpcaoLinha', RadioGroupOpcaoLinha.ItemIndex);
    _GravaConfiguracoesBoolean('CheckBox10', CheckBox10.Checked);
    DBGrid1.Options := ARescueOptions;
    Produto.restoreRecNo;
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn67Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO090', 'CONFERIR', '', 'COD_GRADE_PROD',
    Produto.vGradeEst.dataSet.FieldByName('COD_GRADE').AsString, Produto.buscas, true) then
    Exit;
  if Produto.vGradeEst.confirmaConfereQtde(Produto) then
    TForm(pnGradesEst.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.BitBtn68Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    Produto.montaSelect(Produto.ultimasql);
    Produto.CommitaTransacao;
    tbsEti.Show;
    DBGrid1.Parent := GroupBox38;
    GroupBox46.Parent := GroupBox39;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn69Click(Sender: TObject);
var
  ARescueOptions: TDBGridOptions;
begin
  Screen.Cursor := crHourGlass;
  try
  	DBGrid1.DataSource.DataSet.DisableControls;
    Produto.storeRecNo;
    ARescueOptions := DBGrid1.Options;
    DBGrid1.Options := DBGrid1.Options + [dgMultiSelect];
    
    Produto.dataSet.First;
    while not Produto.dataSet.Eof do
    begin
    	if (DBGrid1.SelectedRows.CurrentRowSelected) and (Produto.dataSet.FieldByName('sel').AsString <> 'S') then
      begin
      	Produto.dataSet.Edit;
      	Produto.dataSet.FieldByName('sel').AsString := 'S';
        Produto.dataSet.Post;
      end
    	else if Produto.dataSet.FieldByName('sel').AsString = 'S' then
	      DBGrid1.SelectedRows.CurrentRowSelected := Produto.dataSet.FieldByName('sel').AsString = 'S';
      Produto.dataSet.Next;
    end;
    
    Produto.relEtiUmaColuna(CheckBox12.Checked, false, DBGrid1);
  finally
    _GravaConfiguracoesInteger('RadioGroupOpcaoLinha', RadioGroupOpcaoLinha.ItemIndex);
    _GravaConfiguracoesBoolean('CheckBox12', CheckBox12.Checked);
    DBGrid1.Options := ARescueOptions;
    Produto.restoreRecNo;
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn6Exit(Sender: TObject);
begin
  inherited;
  //  if PageControl3.ActivePage = TabSheet3 then
  //  begin
  //    if DBEdit16.Enabled and DBEdit16.Visible then
  //      if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
  //        DBEdit16.SetFocus;
  //  end
  //  else if PageControl3.ActivePage = TabSheet4 then
  //  begin
  //    if BitBtn7.Enabled and BitBtn7.Visible then
  //      if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
  //        BitBtn7.SetFocus;
  //  end;
end;

procedure TFrmCadProdutos.BitBtn70Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO158', 'VISUALIZAR', '', 'PRODUTOS', '', Produto.buscas, true) then
    //  if vDadosIni.PesqPros('PRO158', 'VISUALIZAR PRODUTOS MARCADOS PARA IMPRESSÃO', '', 'PRODUTOS', '', Produto.buscas, true) then
  begin
  	//  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    //    DBGrid1.SetFocus;
    //    DBGrid1.Parent := GroupBox42;
        {Produto.montaSelect('select ibp.nitem,dt_marcacao, p.* from imp_bar_prod ibp inner join produtos p ' +
          ' on ibp.cod_empresa=p.cod_empresa and ibp.grupo_prod=p.grupo_prod and ibp.cod_prod=p.cod_prod ' +
          ' where p.ativo=1 and p.cod_empresa=' + vDadosIni.codEmpresa);}
    if Produto.verProdutosMarcadosParaEtiqueta then
    begin
      tbsEtiMarcadas.Show;
      if (Self.Enabled) and (Self.Visible) and (DBGrid15.CanFocus) then
        DBGrid15.SetFocus;
    end;
  end;
end;

procedure TFrmCadProdutos.BitBtn71Click(Sender: TObject);
var
  ARescueOptions: TDBGridOptions;
begin
  Screen.Cursor := crHourGlass;
  try
    DBGrid1.DataSource.DataSet.DisableControls;
    Produto.storeRecNo;
    ARescueOptions := DBGrid1.Options;
    DBGrid1.Options := DBGrid1.Options + [dgMultiSelect];
    
    Produto.dataSet.First;
    while not Produto.dataSet.Eof do
    begin
    	if (DBGrid1.SelectedRows.CurrentRowSelected) and (Produto.dataSet.FieldByName('sel').AsString <> 'S') then
      begin
      	Produto.dataSet.Edit;
      	Produto.dataSet.FieldByName('sel').AsString := 'S';
        Produto.dataSet.Post;
      end
    	else if Produto.dataSet.FieldByName('sel').AsString = 'S' then
	      DBGrid1.SelectedRows.CurrentRowSelected := Produto.dataSet.FieldByName('sel').AsString = 'S';
      Produto.dataSet.Next;
    end;

    if vDadosIni.PesqPros('PRO152', 'IMPRIMIR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Produto.ImprimirEtiquetasQRP('PRODUTOS', 'Etiqueta de Produtos', DBGrid1, false, ckImprimirEtiQtdeEstoque.Checked);
  finally
    _GravaConfiguracoesBoolean('ckImprimirEtiQtdeEstoque', ckImprimirEtiQtdeEstoque.Checked);
    DBGrid1.Options := ARescueOptions;
    Produto.restoreRecNo;
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn72Click(Sender: TObject);
var
  ARescueOptions: TDBGridOptions;
begin
  Screen.Cursor := crHourGlass;
  try
  	DBGrid1.DataSource.DataSet.DisableControls;
    Produto.storeRecNo;
    ARescueOptions := DBGrid1.Options;
    DBGrid1.Options := DBGrid1.Options + [dgMultiSelect];
    
    Produto.dataSet.First;
    while not Produto.dataSet.Eof do
    begin
    	if (DBGrid1.SelectedRows.CurrentRowSelected) and (Produto.dataSet.FieldByName('sel').AsString <> 'S') then
      begin
      	Produto.dataSet.Edit;
      	Produto.dataSet.FieldByName('sel').AsString := 'S';
        Produto.dataSet.Post;
      end
    	else if Produto.dataSet.FieldByName('sel').AsString = 'S' then
	      DBGrid1.SelectedRows.CurrentRowSelected := Produto.dataSet.FieldByName('sel').AsString = 'S';
      Produto.dataSet.Next;
    end;

    if CheckBox14.Checked then
      Produto.relEtiCodBarras(false, true, DBGrid1)
    else
      Produto.relEtiCodBarras(false, false, DBGrid1);
  finally
    _GravaConfiguracoesInteger('RadioGroupOpcaoLinha', RadioGroupOpcaoLinha.ItemIndex);
    _GravaConfiguracoesBoolean('CheckBox14', CheckBox14.Checked);
    DBGrid1.Options := ARescueOptions;
    Produto.restoreRecNo;
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn73Click(Sender: TObject);
var
  ARescueOptions: TDBGridOptions;
  vRecno: Integer;
begin
  Screen.Cursor := crHourGlass;
	try
  	DBGrid15.DataSource.DataSet.DisableControls;

    if DBGrid15.DataSource.DataSet.RecordCount > 0 then
	    vRecno := DBGrid15.DataSource.DataSet.RecNo;
      
    ARescueOptions := DBGrid15.Options;
    DBGrid15.Options := DBGrid15.Options + [dgMultiSelect];

    DBGrid15.DataSource.DataSet.First;
    while not DBGrid15.DataSource.DataSet.Eof do
    begin
    	if (DBGrid15.SelectedRows.CurrentRowSelected) and (DBGrid15.DataSource.DataSet.FieldByName('sel').AsString <> 'S') then
      begin
      	DBGrid15.DataSource.DataSet.Edit;
      	DBGrid15.DataSource.DataSet.FieldByName('sel').AsString := 'S';
        DBGrid15.DataSource.DataSet.Post;
      end
    	else if DBGrid15.DataSource.DataSet.FieldByName('sel').AsString = 'S' then
	      DBGrid15.SelectedRows.CurrentRowSelected := DBGrid15.DataSource.DataSet.FieldByName('sel').AsString = 'S';
      DBGrid15.DataSource.DataSet.Next;
    end;
    
    Produto.relEtiCodBarras(true, false, DBGrid15);
  finally
  	DBGrid15.Options := ARescueOptions;
    if DBGrid15.DataSource.DataSet.RecordCount > 0 then
	    DBGrid15.DataSource.DataSet.RecNo := vRecno;
    DBGrid15.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn74Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_GRADES', 'I', Produto.buscas) then
    Exit;
  if not vDadosIni.PesqPros('PRO089', 'INCLUIR', '', 'COD_GRADE_PROD', '', Produto.buscas, true) then
    Exit;
  if Produto.vGradeEst._incluirGradeEstoque(produto) then
  begin
//    Produto.vGradeEst.Edit;
//	if (Self.Enabled) and (Self.Visible) and (DBEdit89.CanFocus) then
//    DBEdit89.SetFocus;
  end;
end;

procedure TFrmCadProdutos.BitBtn75Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_GRADES', 'A', Produto.buscas) then
    Exit;
  if not vDadosIni.PesqPros('PRO087', 'EDITAR', '', 'COD_GRADE_PROD',
    Produto.vGradeEst.dataSet.FieldByName('COD_GRADE').AsString, Produto.buscas, true) then
    Exit;
  if not Produto.vGradeEst.dataSet.IsEmpty then
  if Produto.vGradeEst.Edit then
  begin
    BitBtn118.Enabled := True;
    BitBtn74.Enabled := False;
    BitBtn75.Enabled := False;
    BitBtn79.Enabled := False;
    DBGrid14.Enabled := False;
    if (Self.Enabled) and (Self.Visible) and (DBEdit89.CanFocus) then
      DBEdit89.SetFocus;
    Produto.vNomeCampoErro := 'DBEdit89';
    Produto.vMensagemErro := '|I|Pressione a tecla ESC para cancelar a operação';
    setFocusCampoErro(Produto.vNomeCampoErro, Produto.vMensagemErro);
  end;
end;

procedure TFrmCadProdutos.BitBtn76Click(Sender: TObject);
begin
  inherited;
  if DBGrid13.DataSource.DataSet.IsEmpty then
  begin
    Application.MessageBox(Pchar('Nenhuma grades disponiveis para associação.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  TForm(pnGrades.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.BitBtn77Click(Sender: TObject);
begin
  inherited;
  Produto.vGradeEst.CancelUpdates;
  Produto.RollBackTransacao;
  Produto.Refresh;
  TForm(pnGradesEst.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtn78Click(Sender: TObject);
begin
  inherited;
  TForm(pnGrades.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtn79Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_GRADES', 'E', Produto.buscas) then
    Exit;

  if Produto.vGradeEst.dataSet.FieldByName('qtde').AsFloat > 0 then
  begin
    Application.MessageBox('Grade selecionada com estoque, não é possível apagar', 'Atenção', 0 + 64);
    Exit;
  end;
  if not vDadosIni.PesqPros('PRO088', 'APAGAR', '', 'COD_GRADE_PROD',
    Produto.vGradeEst.dataSet.FieldByName('COD_GRADE').AsString, Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO088', Produto.vGradeEst.dataSet.FieldByName('COD_GRADE').AsString,
    //    produto.buscas, true) then
    Exit;
  Produto.vGradeEst.Delete;
end;

procedure TFrmCadProdutos.BitBtn7Click(Sender: TObject);
begin
  inherited; 
  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    ShowAtencao('NFCe modo Offline, não permite inclusão de registros. Por favor acesso o sistema remoto');
    Exit;
  end;

  if not vDadosIni.PesqPros('PRO012', 'INCLUIR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
    Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true) then
    Exit;
  if Produto.cadastroSimplificado then
  begin
  	if (Self.Enabled) and (Self.Visible) and (BitBtn_4.CanFocus) then
      BitBtn_4.SetFocus;
  end;
  if Produto.CodBarra.Insert then
  begin
    if Produto.cadastroSimplificado then
      DBEdit118.Enabled := true
    else
      DBEdit78.Enabled := true;
//    A grade no codigo de barras passa a ficar sempre habilitada
//    if (vDadosIni.vEmp.vBuscaCodNoProduto = 'S') or ((vDadosIni.vEcommerce.vHabilitarEcommerce) and (vDadosIni.vEcommerce.vHabilitarGradeCodBarras)) then
//    begin
      if Produto.cadastroSimplificado then
        DBEdit133.Enabled := true
      else
        DBEdit109.Enabled := true;
//    end;

    if Produto.cadastroSimplificado then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit118.CanFocus) then
	      DBEdit118.SetFocus;
    end
    else
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit78.CanFocus) then
        DBEdit78.SetFocus;
    end;
    Produto.CodBarra.PreencheCampos(Produto);
  end;
end;

procedure TFrmCadProdutos.BitBtn80Click(Sender: TObject);
var
  ARescueOptions: TDBGridOptions;
begin
  Screen.Cursor := crHourGlass;
  try
  	DBGrid1.DataSource.DataSet.DisableControls;
    Produto.storeRecNo;
    ARescueOptions := DBGrid1.Options;
    DBGrid1.Options := DBGrid1.Options + [dgMultiSelect];
    
    Produto.dataSet.First;
    while not Produto.dataSet.Eof do
    begin
    	if (DBGrid1.SelectedRows.CurrentRowSelected) and (Produto.dataSet.FieldByName('sel').AsString <> 'S') then
      begin
      	Produto.dataSet.Edit;
      	Produto.dataSet.FieldByName('sel').AsString := 'S';
        Produto.dataSet.Post;
      end
    	else if Produto.dataSet.FieldByName('sel').AsString = 'S' then
	      DBGrid1.SelectedRows.CurrentRowSelected := Produto.dataSet.FieldByName('sel').AsString = 'S';
      Produto.dataSet.Next;
    end;
    
  	Produto.relEtiArgox(CheckBox15.Checked, false, DBGrid1, ComboBox44.Text);
  finally
    _GravaConfiguracoesBoolean('CheckBox15', CheckBox15.Checked);
    DBGrid1.Options := ARescueOptions;
    Produto.restoreRecNo;
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn81Click(Sender: TObject);
begin
  inherited;
  if not ((trim(ComboBox44.Text) = 'LOJA') or (trim(ComboBox44.Text) = 'LOJA 1')) then
  begin
    Application.MessageBox('Opção disponível apenas para LOJA', 'Atenção', 0 + 64);
    Exit;
  end;
  Screen.Cursor := crHourGlass;
  try
    Produto._abreFormEtiquetasEs;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn82Click(Sender: TObject);
var
  ARescueOptions: TDBGridOptions;
  vRecno: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
  	DBGrid15.DataSource.DataSet.DisableControls;

    if DBGrid15.DataSource.DataSet.RecordCount > 0 then
	    vRecno := DBGrid15.DataSource.DataSet.RecNo;
    
    ARescueOptions := DBGrid15.Options;
    DBGrid15.Options := DBGrid15.Options + [dgMultiSelect];

    DBGrid15.DataSource.dataSet.First;
    while not DBGrid15.DataSource.dataSet.Eof do
    begin
    	if (DBGrid15.SelectedRows.CurrentRowSelected) and (DBGrid15.DataSource.dataSet.FieldByName('sel').AsString <> 'S') then
      begin
      	DBGrid15.DataSource.dataSet.Edit;
      	DBGrid15.DataSource.dataSet.FieldByName('sel').AsString := 'S';
        DBGrid15.DataSource.dataSet.Post;
      end
    	else if DBGrid15.DataSource.dataSet.FieldByName('sel').AsString = 'S' then
	      DBGrid15.SelectedRows.CurrentRowSelected := DBGrid15.DataSource.dataSet.FieldByName('sel').AsString = 'S';
      DBGrid15.DataSource.dataSet.Next;
    end;

  	Produto.relEtiquetaX(CheckBox17.Checked, true, DBGrid15);
  finally
    _GravaConfiguracoesBoolean('CheckBox17', CheckBox17.Checked);
    DBGrid15.Options := ARescueOptions;
    if DBGrid15.DataSource.DataSet.RecordCount > 0 then
	    DBGrid15.DataSource.DataSet.RecNo := vRecno; 
    DBGrid15.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn83Click(Sender: TObject);
begin
  inherited;
  TForm(pnModEtiTermica.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.BitBtn84Click(Sender: TObject);
begin
  inherited;
  TForm(pnModEtiTermica.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtn85Click(Sender: TObject);
begin
  inherited;
  //  if not((trim(ComboBox44.Text) = 'LOJA') or (trim(ComboBox44.Text) = 'LOJA 1')) then
  //  begin
  //    Application.MessageBox('Opção disponível apenas para LOJA','Atenção', 0+64);
  //    Exit;
  //  end;
  Screen.Cursor := crHourGlass;
  try
    Produto._abreFormEtiquetasTerm;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn86Click(Sender: TObject);
var
  ARescueOptions: TDBGridOptions;
begin
  Screen.Cursor := crHourGlass;
  try
  	DBGrid1.DataSource.DataSet.DisableControls;
    Produto.storeRecNo;
    ARescueOptions := DBGrid1.Options;
    DBGrid1.Options := DBGrid1.Options + [dgMultiSelect];

    Produto.dataSet.First;
    while not Produto.dataSet.Eof do
    begin
    	if (DBGrid1.SelectedRows.CurrentRowSelected) and (Produto.dataSet.FieldByName('sel').AsString <> 'S') then
      begin
      	Produto.dataSet.Edit;
      	Produto.dataSet.FieldByName('sel').AsString := 'S';
        Produto.dataSet.Post;
      end
    	else if Produto.dataSet.FieldByName('sel').AsString = 'S' then
	      DBGrid1.SelectedRows.CurrentRowSelected := Produto.dataSet.FieldByName('sel').AsString = 'S';
      Produto.dataSet.Next;
    end;

    Produto.relEtiquetaX(CheckBox16.Checked, false, DBGrid1);
  finally
    _GravaConfiguracoesBoolean('CheckBox16', CheckBox16.Checked);
    DBGrid1.Options := ARescueOptions;
    Produto.restoreRecNo;
    DBGrid1.DataSource.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn87Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TfrmRelIndTecGrade, frmRelIndTecGrade);
  Produto.prepare_loop(IfThen(vDadosIni.ShowConfirmacao('Imprimir somente selecionados?') = ID_YES,
                       'sel = ''S'''));
  try
    if Produto.dataSet.IsEmpty then
    begin
      vDadosIni.ShowErro('Nenhum produto selecionado');
      Exit;
    end;

    with frmRelIndTecGrade do
    begin
      relIndTecGrade.executar(Produto.dataSet);
      QuickRep1.Preview;
    end;
  finally
    FreeAndNil(frmRelIndTecGrade);
    Produto.prepare_loop_done;
  end;

  exit;
  lblEmpresa2.Caption := vDadosIni.vEmp.vnomeEmpresa;
  Produto._GetDadosRelatorio(2);
  QuickRep_IndiceEst.Preview;
//  ckEstVndEmpClick(Sender);
//  Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
//  Produto.dataSet.AfterScroll := nil;
//  Produto.RelIndice;
end;

procedure TFrmCadProdutos.BitBtn88Click(Sender: TObject);
begin
  inherited;
  lblEmpresa3.Caption := vDadosIni.vEmp.vnomeEmpresa;
  Produto._GetDadosRelatorio(3);
  QuickRep_Validade.BeforePrint := QuickRep_ValidadeBeforePrint;
  QRExpr7.OnPrint := QRExpr7Print;
  QuickRep_Validade.Preview;
//  ckEstVndEmpClick(Sender);
//  Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
//  Produto.dataSet.AfterScroll := nil;
end;

procedure TFrmCadProdutos.BitBtn89Click(Sender: TObject);
var
  vTemp: string;
  I: Integer;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_INSUMOS', 'I', Produto.buscas) then
    Exit;

  if not vDadosIni.PesqPros('ITEC004', 'NOVO', '', 'INDICE_TECNICO', '', Produto.buscas, true) then
    Exit;

  if (trim(Produto.dataSet.FieldByName('TIPO_ITEM').AsString) <> '04') // Produto não é acabado
  	and (vDadosIni.vEcommerce.vHabilitarEcommerce) // E-Commerce configurado
    and (not vDadosIni.vEcommerce.vControleEstManualECommerce) // Estoque manual E-Commerce
    and (not Produto.vProdutosEC.dataSet.IsEmpty) // Existe dados do E-Commerce
    and (Produto.vProdutosEC.dataSet.FieldByName('sinc_ecommerce').AsString = 'S') // Produto definido para E-Commerce
    and (Produto.vProdutosEC.dataSet.FieldByName('disponivel').AsString = 'S') then  // Produto disponivel E-Commerce
  begin
    if Application.MessageBox('Produto disponível no E-Commerce, ' +
     'deseja mudar o tipo de item do produto para acabado?' + #13 + #13 +
     'Caso informe sim os estoques das matérias primas/insumo/embalagens será adicionado ao estoque do produto acabado E-Commerce.',
     'Atenção', MB_YESNO + MB_ICONQUESTION +
      MB_DEFBUTTON2) = mrYES then
    begin
      if not (Produto.dataSet.State in [dsInsert, dsEdit]) then
        Produto.dataSet.Edit;
      Produto.dataSet.FieldByName('TIPO_ITEM').AsString := '04';

      for I := 0 to DBComboBox11.Items.Count - 1 do
        if (trim(DBComboBox11.Items[i]) = '04') then
          DBComboBox11.ItemIndex := i;
    end;
  end;

  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');

  if Trim(vDadosIni.vPesquisa) = '' then
  	exit;

  if InputQuery('Informe um Valor', 'Informe a quantidade deste item. Ex: 5,6', vTemp) then
  begin
    try
      StrToFloat(vTemp);
    except
      Application.MessageBox('Quantidade inválida', 'Atenção', 0 + 64);
      Exit;
    end;

    if (StrToFloat(vTemp) <= 0) then
    begin
      Application.MessageBox('Quantidade não informada', 'Atenção', 0 + 64);
      Exit;
    end;

    if not Produto.InserirInsumoOutroProd(
    	StrToInt(vDadosIni.vPesquisaGrupo_prod),
      vDadosIni.vPesquisaCod_prod,
      StrToFloat(vTemp)) then
      	Exit;
  end;
end;

procedure TFrmCadProdutos.BitBtn8Click(Sender: TObject);
begin
  inherited;
  tsPendenciaPedido.TabVisible := false;
  Produto.buscas.close;
  DBGrid12.DataSource.DataSet := nil;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TFrmCadProdutos.BitBtn90Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_INSUMOS', 'E', Produto.buscas) then
    Exit;
    
  if Produto.vIndTec.dataSet.IsEmpty then
  	Exit;

  if not Produto.ApagarInsumoOutroProd then
  	Exit;
end;

procedure TFrmCadProdutos.BitBtn91Click(Sender: TObject);
begin
  GroupBox3.Parent := TabSheet2;

  BitBtn91.Parent := Panel16;
  BitBtn2.Visible := True;
  BitBtn3.Visible := True;
  ckLixeira.Visible := True;
  ckEcommerce.Visible := True;
  Panel1.Parent := TabSheet2;
  PageControl1.ActivePage := TabSheet2;
  if ckLixeira.Checked then
  	FrmCadProdutos.Caption := 'Produtos (Lixeira)'
  else if ckEcommerce.Checked then
  	FrmCadProdutos.Caption := 'Produtos (E-Commerce)'
  else
		FrmCadProdutos.Caption := 'Produtos';
  Panel2.Visible := True;

  ckMenuLateral.Visible := True;
  ckMenuLateralClick(Sender);

//  DBGrid1.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,
//    dgConfirmDelete, dgCancelOnExit{, dgMultiSelect}];
end;

procedure TFrmCadProdutos.BitBtn92Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_PRECOS_DIFERENCIADOS', 'I', Produto.buscas) then
    Exit;
  try
    if not Produto.vPromocaoProduto.Insert then
      exit;

    DBLookupComboBox5.KeyValue := Produto.vTipoPreco.dataSet.FieldByName('COD_TPPRECO').AsInteger;
    Produto.vRegiao._abreRegiao(DBLookupComboBox5.Text);

    EditHw1.AsValue := 0;
    EditHw10.AsValue := 0;
    Edit3.Text := '';

    DBLookupComboBox5.Enabled := true;
    DBGrid24.Enabled := true;

    btHabPercentProdLocSetCid.Visible := False;
    btHabMarkupProdLocSetorCid.Visible := True;
    EditHw10.Enabled := True;
    DBEdit7.Enabled := False;

    if vDadosIni.vProduto.Precos.UsarMargemAoMarkup then
    begin
      DBEdit7.DataField := 'MARGEM';
      Label532.Caption := 'Margem:';
    end
    else
    begin
      DBEdit7.DataField := 'MARKUP';
      Label532.Caption := 'Markup:';
    end;

    btHabDebCredTabPreco.Visible := True;
    ComboBox20.Enabled := not btHabDebCredTabPreco.Visible;
    ComboBox20.ItemIndex := -1;

    if not vDadosIni.abreForm('Cadastro', Panel41, [ofAutoSize, ofEscapeExit]) then
    begin
      Produto.vPromocaoProduto.Cancel;
      Produto.vPromocaoProduto.RollBackTransacao;
      Produto.vRegiao._abreRegiao(DBLookupComboBox5.Text);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn93Click(Sender: TObject);
var
  grupo_prod, cod_prod, num_fab_prod, tipo, cod_promocao, sigla, debcred: string;
  valor, percentual, markup: Double;
  dataini, datafim, horaini, horafim: string;
  cod_tipo: Integer;
begin
	try
  	if (Self.Enabled) and (Self.Visible) and (BitBtn93.CanFocus) then
      BitBtn93.SetFocus;

    DBGrid1.Visible  := False;
    DBGrid25.Visible := False;
    BitBtn93.Enabled := False;
    BitBtn98.Enabled := False;

    vDadosIni.vtpPreco := 'P';
    grupo_prod := Produto.dataSet.FieldByName('GRUPO_PROD').AsString;
    cod_prod := Produto.dataSet.FieldByName('COD_PROD').AsString;
    num_fab_prod := Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString;
    cod_promocao := Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsString;
    tipo := Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsString;
    sigla := Produto.vPromocaoProduto.dataSet.FieldByName('SIGLA').AsString;
    valor := EditHw2.AsValue;
    percentual := EditHw3.AsValue;
    markup := Produto.vPromocaoProduto.ffloat('markup');
    dataini := MaskEdit23.Text;
    datafim := MaskEdit25.Text;
    horaini := MaskEdit24.Text;
    horafim := MaskEdit26.Text;
    cod_tipo := DBLookupComboBox4.KeyValue;
    debcred := vDadosIni.IfThen(not DBComboBox18.Enabled, '', vDadosIni.IfThen(DBComboBox18.ItemIndex <= 0, 'Z', Copy(DBComboBox18.Text, 1, 1)));

    if not CheckBox20.Checked then
    begin
      if promocao_prod = '' then
      begin
        if not Produto.vPromocaoProduto.postPromocao(
          StrToInt(cod_promocao),
          StrToInt(tipo),
          valor,
          percentual,
          markup,
          debcred,
          dataini,
          datafim,
          horaini,
          horafim,
          sigla,
          Produto) then
        begin
          vDadosIni.fechaStatusProcessamento;
          setFocusCampoErro(Produto.vPromocaoProduto.vNomeCampoErro);
          exit;
        end;
      end
      else
      begin
        if not Produto.vPromocaoProduto.postPromocaoProduto(
          cod_promocao,
          tipo,
          grupo_prod,
          cod_prod,
          dataini,
          datafim,
          horaini,
          horafim,
          sigla,
          valor,
          percentual,
          markup,
          debcred) then
        begin
          vDadosIni.fechaStatusProcessamento;
          setFocusCampoErro(Produto.vPromocaoProduto.vNomeCampoErro);
          exit;
        end;
      end;

      BitBtn93.Enabled := true;
      GroupBox3.Enabled := true;
      DBEdit96.Enabled := true;
      DBLookupComboBox6.Enabled := true;
      DBLookupComboBox7.Enabled := true;
      CheckBox20.Checked := false;
      CheckBox20.Enabled := true;
      Label221.Enabled := true;

      Produto.montaSelect(Produto.ultimasql);
      Produto._retornarIndice;

      Produto.vPromocaoProduto._abrePromocaoProdutos(grupo_prod, cod_prod, '', '', '');

      Produto.IndexFieldNames := 'GRUPO_PROD;COD_PROD';
      Produto.FindNearest([grupo_prod, cod_prod]);

      PageControl7.ActivePage := TabSheet8;
    end
    else
    begin // Cadastro sequencial
      if (Produto.dataSet.FieldByName('SEL').AsString = 'S') then
      begin
        Produto.dataSet.Edit;
        Produto.dataSet.FieldByName('SEL').AsString := '';
        Produto.dataSet.Post;
      end;

      if (Produto.dataSet.FieldByName('SEL').AsString = '') then
      begin
        Produto.vPromocaoProduto._abrePromocaoProdutos('', '', '', '', '');

        if not (Produto.vPromocaoProduto.Insert) then
          exit;

        //Marcar Linha
        Produto._marcaLinha;

        if not Produto.vPromocaoProduto.postPromocaoProdutoS(
          cod_promocao,
          tipo,
          grupo_prod,
          cod_prod,
          dataini,
          datafim,
          horaini,
          horafim,
          sigla,
          valor,
          percentual,
          cod_tipo,
          0,
          markup,
          debcred) then
        begin
          setFocusCampoErro(Produto.vPromocaoProduto.vNomeCampoErro);
          BitBtn93.Enabled := true;
  //        Produto.vPromocaoProduto.Cancel;
  //        Produto.vPromocaoProduto.RollBackTransacao;

          GroupBox3.Enabled := true;
          DBEdit96.Enabled := true;
          DBLookupComboBox6.Enabled := true;
          DBLookupComboBox7.Enabled := true;
          EditHw2.Enabled := true;
          EditHw3.Enabled := true;
          CheckBox19.Enabled := true;

          Produto.montaSelect(Produto.ultimasql);
          Produto._retornarIndice;

          Produto.vPromocaoProduto._abrePromocaoProdutos(Produto.dataSet.FieldByName('GRUPO_PROD').AsString, Produto.dataSet.FieldByName('COD_PROD').AsString, '', '', '');

          PageControl7.ActivePage := TabSheet8;

          exit;
        end;

        Produto.Next;

        // Se chegar no fim cancela a inserção
        if (Produto.dataSet.FieldByName('SEL').AsString <> '') then
        begin
          BitBtn93.Enabled := true;
          Produto.vPromocaoProduto.Cancel;
          Produto.vPromocaoProduto.RollBackTransacao;

          GroupBox3.Enabled := true;
          DBEdit96.Enabled := true;
          DBLookupComboBox6.Enabled := true;
          DBLookupComboBox7.Enabled := true;
          EditHw2.Enabled := true;
          EditHw3.Enabled := true;
          CheckBox19.Enabled := true;

          Produto.montaSelect(Produto.ultimasql);
          Produto._retornarIndice;

          Produto.vPromocaoProduto._abrePromocaoProdutos(
            Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
            Produto.dataSet.FieldByName('COD_PROD').AsString,
            '',
            '',
            '');

          PageControl7.ActivePage := TabSheet8;

          promocao_prod := '';
          exit;
        end;
        EditHw2.AsValue := 0;
        EditHw3.AsValue := 0;

        Produto.vPromocaoProduto.Insert;
        DBEdit96.Field.AsInteger := StrToInt(cod_promocao);
        Produto.vTipoPreco._abreTipoPrecoPromocao;
        DBEdit97.Field.AsInteger := Produto.vTipoPreco.dataSet.FieldByName('COD_TPPRECO').AsInteger;
        Produto.vPromocaoProduto.vTipoVenda._abreTipoVenda(cod_promocao, tipo, grupo_prod, cod_prod);
        DBLookupComboBox7.Field.AsString := Produto.vPromocaoProduto.vTipoVenda.dataSet.FieldByName('SIGLA').AsString;

        if (Self.Enabled) and (Self.Visible) and (DBEdit96.CanFocus) then
          DBEdit96.SetFocus;
      end;
    end;
  finally
  	DBGrid1.Visible  := True;
    DBGrid25.Visible := True;
    BitBtn93.Enabled := True;
    BitBtn98.Enabled := True;
  end;
end;

procedure TFrmCadProdutos.BitBtn94Click(Sender: TObject);
begin
	try
    inherited;
    DBGrid23.Visible := False;
  	if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_PRECOS_DIFERENCIADOS', 'E', Produto.buscas) then
      Exit;
    vDadosIni.vtpPreco := Produto.vPromocaoProduto.dataSet.FieldByName('TIPO').AsString;

    if not (Produto.vPromocaoProduto.DeletePrecoProduto) then
      exit;

    Produto.vPromocaoProduto._abrePrecoProdutos(
      Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
      Produto.dataSet.FieldByName('COD_PROD').AsString);
  finally
    DBGrid23.Visible := True;
  end;
end;

procedure TFrmCadProdutos.BitBtn95Click(Sender: TObject);
begin
  try
    if (Self.Enabled) and (Self.Visible) and (BitBtn95.CanFocus) then
    	BitBtn95.SetFocus;

    try
      DbGrid24.Visible := False;
      BitBtn95.Enabled := False;
      BitBtn96.Enabled := False;
      if not (Produto.vPromocaoProduto.postTabela(
        Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
        Produto.dataSet.FieldByName('COD_PROD').AsString,
        EditHw1.AsValue,
        EditHw10.AsValue,
        Produto.dataSet.FieldByName('PREC_TAB_PROD').AsFloat,
        EditHw7.AsValue,
        Produto.vPromocaoProduto.ffloat('markup'),
        vDadosIni.IfThen(not ComboBox20.Enabled, '', vDadosIni.IfThen(ComboBox20.ItemIndex <= 0, 'Z', Copy(ComboBox20.Text, 1, 1))),
        DBLookupComboBox5.KeyValue)) then
      begin
        vDadosIni.fechaStatusProcessamento;
        exit;
      end;

    //  pagePrecos.ActivePage := tsDefinirPreco_Visualizar;
    //  BitBtn4.Enabled := true;
    //  BitBtn5.Enabled := true;
      Produto.vRegiao._abreRegiao(DBLookupComboBox5.Text);
      TForm(Panel41.Parent).ModalResult := IDOK;
    finally
      DbGrid24.Visible := True;
      BitBtn95.Enabled := True;
      BitBtn96.Enabled := True;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadProdutos.BitBtn97Click(Sender: TObject);
var
  tipoVenda: string;
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_PRECOS_DIFERENCIADOS', 'I', Produto.buscas) then
    Exit;
  try
    vDadosIni.vtpPreco := 'P';
    tipoVenda := Produto.vPromocaoProduto.dataSet.FieldByName('SIGLA').AsString;
    promocao_prod := '';
    if not (Produto.vPromocaoProduto.Insert) then
      exit;

    EditHw2.AsValue := 0;
    EditHw3.AsValue := 0;
    MaskEdit23.Text := '';
    MaskEdit25.Text := '';
    MaskEdit24.Text := '';
    MaskEdit26.Text := '';
    MaskEdit23.Enabled := false;
    MaskEdit24.Enabled := false;
    MaskEdit25.Enabled := false;
    MaskEdit26.Enabled := false;

    DBLookupComboBox6.Field.AsInteger := Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger;
    DBEdit96.Field.AsInteger := Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger;
    Produto.vTipoPreco._abreTipoPrecoPromocao;
    DBLookupComboBox4.Field.AsInteger := Produto.vTipoPreco.dataSet.FieldByName('COD_TPPRECO').AsInteger;
    DBEdit97.Field.AsInteger := Produto.vTipoPreco.dataSet.FieldByName('COD_TPPRECO').AsInteger;

    Produto.vPromocaoProduto.vTipoVenda._abreTipoVenda(IntToStr(Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger),
      Produto.vTipoPreco.dataSet.FieldByName('COD_TPPRECO').AsString,
      Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
      Produto.dataSet.FieldByName('COD_PROD').AsString);

    DBLookupComboBox7.Field.AsString := tipoVenda;

    GroupBox3.Enabled := false;

    CheckBox20.Checked := false;

    edMarukpMargemPromo.DataField := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'MARGEM', 'MARKUP');
    lbMarkupMargemPromo.Caption := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'Margem', 'Markup');

    EditHw3.Enabled := true;
		btHabPercentProdPromocao.Visible := false;
  	edMarukpMargemPromo.Enabled := false;
  	btHabMarkupProdPromocao.Visible := true;

    btHabDebCredProm.Visible := True;
    DBComboBox18.Enabled := not btHabDebCredProm.Visible;
    DBComboBox18.ItemIndex := -1;

    CheckBox19.Checked := false;

    PageControl7.ActivePage := TabSheet9;

    if (Self.Enabled) and (Self.Visible) and (DBEdit96.CanFocus) then
      DBEdit96.SetFocus;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn98Click(Sender: TObject);
var
	grupo_prod, cod_prod, num_fab_prod: string;
begin
  inherited;
  grupo_prod := Produto.dataSet.FieldByName('GRUPO_PROD').AsString;
  cod_prod := Produto.dataSet.FieldByName('COD_PROD').AsString;
  num_fab_prod := Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString;

  Produto.pIndex := TClientDataSet(DBGrid1.DataSource.DataSet).IndexName;
  BitBtn93.Enabled := true;
  Produto.vPromocaoProduto.Cancel;
  Produto.vPromocaoProduto.RollBackTransacao;

  GroupBox3.Enabled := true;
  DBEdit96.Enabled := true;
  DBLookupComboBox6.Enabled := true;
  DBLookupComboBox7.Enabled := true;
  EditHw2.Enabled := true;
  EditHw3.Enabled := true;
  CheckBox19.Enabled := true;
  CheckBox20.Checked := false;
  CheckBox20.Enabled := true;
  Label221.Enabled := true;
  promocao_prod := '';

  Produto.montaSelect(Produto.ultimasql);
  Produto._retornarIndice;

  Produto.vPromocaoProduto._abrePromocaoProdutos(Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
    Produto.dataSet.FieldByName('COD_PROD').AsString, '', '', '');

  Produto.IndexFieldNames := 'GRUPO_PROD;COD_PROD';
  Produto.FindNearest([grupo_prod, cod_prod]);

  PageControl7.ActivePage := TabSheet8;
end;

procedure TFrmCadProdutos.BitBtn99Click(Sender: TObject);
begin
	try
    inherited;
    DBGrid1.Visible   := False;
    DBGrid25.Visible  := False;

    if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_PRECOS_DIFERENCIADOS', 'E', Produto.buscas) then
      Exit;
    vDadosIni.vtpPreco := Produto.vPromocaoProduto.dataSet.FieldByName('TIPO').AsString;

    lbDelPromocaoProd1Op1.Caption :=
      'Cod Promoção: ' + IntToStr(Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsInteger);
    lbDelPromocaoProd1Op2.Caption :=
      'Promoção: ' + trim(Produto.vPromocaoProduto.dataSet.FieldByName('DESCR_PROMOCAO').AsString);
    lbDelPromocaoProd1Op3.Caption :=
      'Tipo Venda: ' + Produto.vPromocaoProduto.retornaSigla(trim(Produto.vPromocaoProduto.dataSet.FieldByName('SIGLA').AsString));
    lbDelPromocaoProd1Op4.Caption :=
      Copy('Para todos produtos selecionados?', 1, 50);


    lbDelPromocaoProd2Op1.Caption :=
      'Cod Promoção: ' + IntToStr(Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsInteger);
    lbDelPromocaoProd2Op2.Caption :=
      'Promoção: ' + trim(Produto.vPromocaoProduto.dataSet.FieldByName('DESCR_PROMOCAO').AsString);
    lbDelPromocaoProd2Op3.Caption :=
      'Sigla: ' + Produto.vPromocaoProduto.retornaSigla(trim(Produto.vPromocaoProduto.dataSet.FieldByName('SIGLA').AsString));
    lbDelPromocaoProd2Op4.Caption :=
      'Grupo Prod: ' + IntToStr(Produto.vPromocaoProduto.dataSet.FieldByName('GRUPO_PROD').AsInteger);
    lbDelPromocaoProd2Op5.Caption :=
      'Cod Prod: ' + trim(Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROD').AsString);
    lbDelPromocaoProd2Op6.Caption :=
      'Num Fab Prod: ' + trim(Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString);
    lbDelPromocaoProd2Op7.Caption :=
      Copy('Descr Prod: ' + trim(Produto.dataSet.FieldByName('DESCR_PROD').AsString), 1, 50);
    lbDelPromocaoProd2Op8.Caption :=
      Copy('Para este produto?', 1, 50);

    RadioButtonDelPromocaoProdOp1.Checked := true;
    if not vDadosIni.abreForm('Deseja remover promoção?', pnDelPromocaoProd, [ofAutoSize, ofEscapeExit]) then
      exit;

    if RadioButtonDelPromocaoProdOp1.Checked then
    begin
      if not (Produto.vPromocaoProduto.DeletePromocaoProduto(Produto.dataSet)) then
        exit;
    end
    else
    begin
      if not (Produto.vPromocaoProduto.DeletePromocaoProduto(False)) then
        exit;
    end;

    if Produto.dataSet.IsEmpty then
      Produto.vPromocaoProduto._abrePromocaoProdutos('0', '0', '0', '0', '0')
    else
      Produto.vPromocaoProduto._abrePromocaoProdutos(
        Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
        Produto.dataSet.FieldByName('COD_PROD').AsString, '', '', '');
  finally
  	DBGrid1.Visible   := True;
    DBGrid25.Visible  := True;
  end;
end;

procedure TFrmCadProdutos.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO014', 'EDITAR', '', 'PRODUTOS',
    Produto.CodBarra.dataSet.FieldByName('COD_BARRA').AsString, Produto.buscas, true) then
    Exit;
  Produto.CodBarra.codbarraAnterior := Produto.CodBarra.dataSet.FieldByName('COD_BARRA').AsString;
  if Produto.CodBarra.Edit then
  begin
    if Produto.cadastroSimplificado then
      DBEdit118.Enabled := true
    else
      DBEdit78.Enabled := true;
    if Produto.cadastroSimplificado then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit118.CanFocus) then
	      DBEdit118.SetFocus;
    end
    else
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit78.CanFocus) then
        DBEdit78.SetFocus;
    end;
    Produto.CodBarra.PreencheCampos(Produto);
  end;
end;

procedure TFrmCadProdutos.BitBtnAprovInsumoOutroProdClick(Sender: TObject);
var
  vTemp: string;
  I: Integer;
begin
  inherited;
	if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_INSUMOS', 'I', Produto.buscas) then
    Exit;

  if not vDadosIni.PesqPros('ITEC008', 'UTILIZAR', '', 'INDICE_TECNICO', '', Produto.buscas, true) then
    Exit;

  if (trim(Produto.dataSet.FieldByName('TIPO_ITEM').AsString) <> '04') // Produto não é acabado
  	and (vDadosIni.vEcommerce.vHabilitarEcommerce) // E-Commerce configurado
    and (not vDadosIni.vEcommerce.vControleEstManualECommerce) // Estoque manual E-Commerce
    and (not Produto.vProdutosEC.dataSet.IsEmpty) // Existe dados do E-Commerce
    and (Produto.vProdutosEC.dataSet.FieldByName('sinc_ecommerce').AsString = 'S') // Produto definido para E-Commerce
    and (Produto.vProdutosEC.dataSet.FieldByName('disponivel').AsString = 'S') then  // Produto disponivel E-Commerce
  begin
    if Application.MessageBox('Produto disponível no E-Commerce, ' +
     'deseja mudar o tipo de item do produto para acabado?' + #13 + #13 +
     'Caso informe sim os estoques das matérias primas/insumo/embalagens será adicionado ao estoque do produto acabado E-Commerce.',
     'Atenção', MB_YESNO + MB_ICONQUESTION +
      MB_DEFBUTTON2) = mrYES then
    begin
      if not (Produto.dataSet.State in [dsInsert, dsEdit]) then
        Produto.dataSet.Edit;
      Produto.dataSet.FieldByName('TIPO_ITEM').AsString := '04';

      for I := 0 to DBComboBox11.Items.Count - 1 do
        if (trim(DBComboBox11.Items[i]) = '04') then
          DBComboBox11.ItemIndex := i;
    end;
  end;

  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');

  if Trim(vDadosIni.vPesquisa) = '' then
  	exit;

  if not Produto.utilizarInsumoOutroProd(StrToInt(vDadosIni.vPesquisaGrupo_prod), vDadosIni.vPesquisaCod_prod) then
    exit;
end;

procedure TFrmCadProdutos.BitBtnInsumosOutrosProdCancelClick(Sender: TObject);
begin
  inherited;
	TForm(pnInsumosOutrosProd.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtnInsumosOutrosProdOKClick(Sender: TObject);
begin
  inherited;
	TForm(pnInsumosOutrosProd.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.BitBtnOpcoesAlterarGrupoCancelClick(Sender: TObject);
begin
  TForm(pnOpcoesAlterarGrupo.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtnOpcoesAlterarGrupoOKClick(Sender: TObject);
begin
	TForm(pnOpcoesAlterarGrupo.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.BitBtnProdutosAcabadosCancelarClick(Sender: TObject);
begin
  inherited;
	TForm(pnProdutosAcabados.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtnProdutosAcabadosOKClick(Sender: TObject);
begin
  inherited;
	TForm(pnProdutosAcabados.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.BitBtnProdutosAcabadosSairClick(Sender: TObject);
begin
  inherited;
  TForm(pnProdutosAcabados.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtnProdutosMatInsumosCancelarClick(
  Sender: TObject);
begin
  inherited;
	TForm(pnProdutosMatInsumos.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtnProdutosMatInsumosOKClick(Sender: TObject);
begin
  inherited;
	TForm(pnProdutosMatInsumos.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.BitBtnProdutosMatInsumosSairClick(Sender: TObject);
begin
  inherited;
	TForm(pnProdutosMatInsumos.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.BitBtn_4Click(Sender: TObject);
var
  codgrupo: integer;
  codprod: string;
  campo: string;
  vEstoque: Double;
  vSqlProd: string;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Validando dados do produto');

    if Produto.cadastroSimplificado then
    	Produto.dataSet.FieldByName('OBS_ETIQ').AsString := MemoObsEtiqSimples.Lines.Text
    else
    	Produto.dataSet.FieldByName('OBS_ETIQ').AsString := MemoObsEtiq.Lines.Text;

    if (Self.Enabled) and (Self.Visible) and (BitBtn_4.CanFocus) then
      BitBtn_4.SetFocus;

    if not Produto.validarCadastrosSimplificado then
    begin
      setFocusCampoErro(Produto.vNomeCampoErro, Produto.vMensagemErro, True);
      exit;
    end;

    vEstoque := Produto.dataSet.FieldByName('est_f').AsFloat;
    if DBLookupComboBox11.Enabled then
      DBLookupComboBox1Exit(Sender);
    if not Produto.Post then
    begin
      if setFocusCampoErro(Produto.vNomeCampoErro, Produto.vMensagemErro, True) then
        Exit;
      PageControl3.ActivePage := TabSheet3;
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox11.CanFocus) then
        DBLookupComboBox11.SetFocus;
      exit;
    end
    else if (vDadosIni.vAbrirGradeProduto = 'S') and (Produto._FormProdutos = nil) then
    begin
      vSqlProd := Produto.dataSet.CommandText;
      Produto.abreProdutos(StrToInt(Produto.oldGrupoProd), Produto.oldCodProd, 1);

      if not Produto.dataSet.IsEmpty then
      begin
        Label170.Caption := Format('%0.2f', [
          Produto.dataSet.FieldByName('est_f').AsFloat]);

        Label208.Caption := Format('%0.2f', [
          vDadosIni.getEstoqueDisponivel(Produto.buscas,
          	Produto.dataSet.FieldByName('grupo_prod').AsInteger,
            	Produto.dataSet.FieldByName('cod_prod').AsString)]);

        Label495.Caption := Format('%0.2f', [
			  	vDadosIni.getEstoquePrima(Produto.buscas,
  					Produto.dataSet.FieldByName('grupo_prod').AsInteger,
				    	Produto.dataSet.FieldByName('cod_prod').AsString)]);

        Label494.Visible := (Produto.dataSet.FieldByName('criar_producao_aut').AsString = 'S')
          and (vDadosIni.vEmp.vUsarProducao = 'S');

        Label495.Visible := (Produto.dataSet.FieldByName('criar_producao_aut').AsString = 'S')
          and (vDadosIni.vEmp.vUsarProducao = 'S');

        Produto.vGradeEst.abreGradeEstoque(Produto.dataSet.FieldByName('grupo_prod').AsString,
          Produto.dataSet.FieldByName('cod_prod').AsString);
        Produto.vGradeEst.vGrade.dataSet.Filtered := false;
        Produto.vGradeEst.vGrade.dataSet.Filter := ' cod_grade<>0 ';
        Produto.vGradeEst.vGrade.dataSet.Filtered := true;
        Produto.vGradeEst._abreFormGradesEstoque(Produto);
        Produto.vGradeEst.vGrade.dataSet.Filtered := false;
        PageControl1.ActivePage := tsGrade;
        Produto.vGradeEst.abreGradeEstoque(Produto.dataSet.FieldByName('grupo_prod').AsString,
          Produto.dataSet.FieldByName('cod_prod').AsString);
      end;
      Produto.montaSelect(vSqlProd);
    end;
    if Produto.AlterarGrupo then
    	Produto.vGrupo.abreGrupos;
    Produto.AlterarGrupo := false;
    Produto.AtualizarProduto := false;

    if TelaCadastro <> 0 then
      close
    else if CheckCadSeq_.Checked then
    begin
      BitBtn3.Click;
    end
    else
      TabSheet2.Show;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadProdutos.BitBtn_Alterar_DespesaClick(Sender: TObject);
var
	vQuantidade: string;
begin
  inherited;
	if DBGridInsumosOutrosProd.DataSource.DataSet.IsEmpty then
  	Exit;

  vQuantidade := FloatToStr(DBGridInsumosOutrosProd.DataSource.DataSet.FieldByName('qtde').AsFloat);

  if not InputQuery('Informe a quantidade', 'Informe a quantidade deste item', vQuantidade) then
  	Exit;

  if (trim(vQuantidade) = '') or (trim(vQuantidade) = '0') then
  begin
    Application.MessageBox('Quantidade não informada', 'Atenção', 0 + 64);
    exit;
  end;

  try
    StrToFloat(vQuantidade)
  except
    Application.MessageBox('Quantidade inválida', 'Atenção', 0 + 64);
  end;

  DBGridInsumosOutrosProd.DataSource.DataSet.Edit;
  DBGridInsumosOutrosProd.DataSource.DataSet.FieldByName('qtde').AsFloat := StrToFloat(vQuantidade);
  DBGridInsumosOutrosProd.DataSource.DataSet.Post;
end;

procedure TFrmCadProdutos.BitBtn_Alterar_PrecoPorQuantClick(Sender: TObject);
var
	I: Integer;
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRECO_PRODUTOS_QTDE', 'A', Produto.buscas) then
    Exit;

  try
    if Produto.vProdutosPrecoQtde.dataSet.IsEmpty then
    	exit;

    if not Produto.vProdutosPrecoQtde.Edit then
      exit;

    if Produto.vProdutosPrecoQtde.ffloat('MARKUP') = 0 then
    begin
      DBEdit211.Enabled := true;
  	  btHabPercentProdQtde.Visible := false;
    	DBEdit13.Enabled := false;
   	  btHabMarkupProdQtde.Visible := true;
    end
    else
    begin
    	DBEdit211.Enabled := false;
  	  btHabPercentProdQtde.Visible := true;
    	DBEdit13.Enabled := true;
   	  btHabMarkupProdQtde.Visible := false;
    end;
    DBLookupComboBox22.Enabled := false;
    DBEdit54.Enabled := false;

    DBEdit13.DataField := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'MARGEM', 'MARKUP');
    Label412.Caption := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'Margem:', 'Markup:');

    btHabDebCredPrecoQtde.Visible := True;
    DBComboBox20.Enabled := not btHabDebCredPrecoQtde.Visible;

    if trim(Produto.vProdutosPrecoQtde.dataSet.FieldByName('USAR_DEBCRED').AsString) <> '' then
    begin
      for I := 0 to DBComboBox20.Items.Count - 1 do
        if Copy(DBComboBox20.Items[I], 1, 1) = Produto.vProdutosPrecoQtde.dataSet.FieldByName('USAR_DEBCRED').AsString then
        begin
          DBComboBox20.ItemIndex := I;
          Break;
        end;
    end
    else
      DBComboBox20.ItemIndex := -1;

    if not vDadosIni.abreForm('Cadastro', Panel61, [ofAutoSize, ofEscapeExit]) then
    begin
      Produto.vProdutosPrecoQtde.Cancel;
      Produto.vProdutosPrecoQtde.RollBackTransacao;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.BitBtn_Excluir_PrecoPorQuantClick(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRECO_PRODUTOS_QTDE', 'E', Produto.buscas) then
    Exit;

  if not Produto.vProdutosPrecoQtde.Delete(Produto.dataSet) then
    exit;
end;

procedure TFrmCadProdutos.BitBtn_Imprimir_PrecoPorQuantClick(Sender: TObject);
begin
   if not vDadosIni.PesqPros('PRO308', 'IMPRIMIR', 'Grupo' + Produto.dataSet.FieldByName('GRUPO_PROD').AsString +
   ' Cod ' + Produto.dataSet.FieldByName('COD_PROD').AsString, 'PRECO_PRODUTOS_QTDE', '', Produto.buscas, true) then
    exit;

  QuickRepProdutosPrecoQtde.Preview;
end;

procedure TFrmCadProdutos.BitBtn_IndiceTecnicoClick(Sender: TObject);
begin
  inherited;
  lbEmpresa.Caption := vDadosIni.vEmp.vnomeEmpresa;
  Produto._GetDadosRelatorio(1);
  QuickRep_FichaProd.Preview;
//  ckEstVndEmpClick(Sender);
//  Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
//  Produto.dataSet.AfterScroll := nil;
//  Produto.RelIndice;
end;

procedure TFrmCadProdutos.BitBtn_Novo_PrecoPorQuantClick(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRECO_PRODUTOS_QTDE', 'I', Produto.buscas) then
    Exit;

  try
    if not Produto.vProdutosPrecoQtde.Insert(Produto.dataSet) then
      exit;

    DBEdit211.Enabled := true;
    btHabPercentProdQtde.Visible := false;
    DBEdit13.Enabled := false;
    btHabMarkupProdQtde.Visible := true;
    DBLookupComboBox22.Enabled := true;
    DBEdit54.Enabled := true;

    DBEdit13.DataField := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'MARGEM', 'MARKUP');
    Label412.Caption := IfThen(vDadosIni.vProduto.Precos.UsarMargemAoMarkup, 'Margem:', 'Markup:');

    btHabDebCredPrecoQtde.Visible := True;
    DBComboBox20.Enabled := not btHabDebCredPrecoQtde.Visible;
    DBComboBox20.ItemIndex := -1;

    if not vDadosIni.abreForm('Cadastro', Panel61, [ofAutoSize, ofEscapeExit]) then
    begin
      Produto.vProdutosPrecoQtde.Cancel;
      Produto.vProdutosPrecoQtde.RollBackTransacao;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.btAlterarSped0205Click(Sender: TObject);
begin
  inherited;
  if vProdAlt.iniciarAlteracaoRegistro(Produto.buscas) then
  begin 
    grCadastroSped0205.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (edGrupoSped0205.CanFocus) then
      edGrupoSped0205.SetFocus;
    btNovoSped0205.Enabled := False;
    btAlterarSped0205.Enabled := False;
    btExcluirSped0205.Enabled := False;
    btVoltarSped0205.Enabled := False;
    edGrupoSped0205.Text := vProdAlt.Grupo;
    edCodigoSped0205.Text := vProdAlt.Codigo;
    edDescricaoSped0205.Text := vProdAlt.Descricao;
    edDataIniSped0205.Text := DateToStr(vProdAlt.DataIni);
    edDataFimSped0205.Text := DateToStr(vProdAlt.DataFim);
    cbTipoAltSped0205.ItemIndex := Pos(vProdAlt.TipoAlt, 'CDA') - 1;
    edMesMovSped0205.Text := vProdAlt.MesSped;
  end;
end;

procedure TFrmCadProdutos.btVoltarDadosProdClick(Sender: TObject);
begin
	try
    inherited;
    if TelaCadastro = 4 then
    begin
      Close;
      exit;
    end;

    ckLixeira.Visible := True;
    ckLixeira.Checked := False;
    
    if ckLixeira.Checked then
      FrmCadProdutos.Caption := 'Produtos (Lixeira)'
    else if ckEcommerce.Checked then
    	FrmCadProdutos.Caption := 'Produtos (E-Commerce)'
    else
      FrmCadProdutos.Caption := 'Produtos';
//    Panel52.Visible := true;
//    GroupBox79.Visible := true;
    Panel2.Visible := true;

    GroupBox3.Parent := TabSheet2;

    btVoltarDadosProd.Parent := Panel52;
    BitBtn2.Visible := True;
	  BitBtn3.Visible := True;
    Panel1.Parent := TabSheet2;
    PageControl1.ActivePage := TabSheet2;
    TelaCadastro := 0;
    Self.fechar  := False;

    ckMenuLateral.Visible := True;
    ckMenuLateralClick(Sender);
    
  //  DBGrid1.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,
  //    dgConfirmDelete, dgCancelOnExit{, dgMultiSelect}];
	finally
    vDadosIni.vPesquisaChaveNF := '';
  end;
end;

procedure TFrmCadProdutos.btCancelarSped0205Click(Sender: TObject);
begin
  inherited;
  edGrupoSped0205.Clear;
  edCodigoSped0205.Clear;
  cbTipoAltSped0205.ItemIndex := -1;
  edDescricaoSped0205.Clear;
  edDataIniSped0205.Clear;
  edDataFimSped0205.Clear;
  edMesMovSped0205.Clear;
  btNovoSped0205.Enabled := True;
  btAlterarSped0205.Enabled := True;
  btExcluirSped0205.Enabled := True;
  btVoltarSped0205.Enabled := True;
  grCadastroSped0205.Enabled := False;
end;

procedure TFrmCadProdutos.btCancelarDelPromocaoProdClick(Sender: TObject);
begin
  inherited;
	TForm(pnDelPromocaoProd.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.btCancelarDelTabelaProdClick(Sender: TObject);
begin
  inherited;
	TForm(pnDelTabelaProd.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.btExcluirSped0205Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vProdAlt.excluirRegistro(Produto.buscas);
  finally
    vProdAlt.abreRegistros(
      Produto.dataSet.FieldByName('grupo_prod').AsInteger,
      Produto.dataSet.FieldByName('cod_prod').AsString, Produto.buscas);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.btFretePesoCancelClick(Sender: TObject);
begin
  inherited;
  Produto.FretePorPeso.Cancel;
  pageFretePeso.ActivePage := tsFretePesoGrid;
end;

procedure TFrmCadProdutos.btFretePesoOKClick(Sender: TObject);
begin
  inherited;

  if not Produto.FretePorPeso.Post() then
    exit;

  pageFretePeso.ActivePage := tsFretePesoGrid;
end;

procedure TFrmCadProdutos.btFretePesoProcuraClienteClick(Sender: TObject);
var
  id: string;
begin
  inherited;
  id := vDadosIni.pesquisaRapida('CLIENTES');

  if StrToIntDef(id, 0) > 0 then
  begin
    Produto.FretePorPeso.GetDataSetFonecedor(StrToIntDef(id, 0));
    if Produto.FretePorPeso.dataSet.State in [dsEdit, dsInsert] then
      Produto.FretePorPeso.dataSet.FieldByName('cod_cliente').AsInteger := StrToIntDef(id, 0);
  end;
end;

procedure TFrmCadProdutos.btHabDebCredPrecoQtdeClick(Sender: TObject);
begin
  inherited;
	btHabDebCredPrecoQtde.Visible := False;
  DBComboBox20.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBComboBox20.CanFocus) then
    DBComboBox20.SetFocus;
end;

procedure TFrmCadProdutos.btHabDebCredPromClick(Sender: TObject);
begin
  inherited;
	btHabDebCredProm.Visible := False;
  DBComboBox18.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBComboBox18.CanFocus) then
    DBComboBox18.SetFocus;
end;

procedure TFrmCadProdutos.btHabDebCredTabClick(Sender: TObject);
begin
  inherited;
  btHabDebCredTab.Visible := False;
  DBComboBox17.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBComboBox17.CanFocus) then
    DBComboBox17.SetFocus;
end;

procedure TFrmCadProdutos.btHabDebCredTabPrecoClick(Sender: TObject);
begin
  inherited;
  btHabDebCredTabPreco.Visible := False;
  ComboBox20.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (ComboBox20.CanFocus) then
    ComboBox20.SetFocus;
end;

procedure TFrmCadProdutos.btHabMarkupProdLocSetorCidClick(Sender: TObject);
begin
  inherited;
  btHabMarkupProdLocSetorCid.Visible := False;
  btHabPercentProdLocSetCid.Visible := True;
  DBEdit7.Enabled := True;
  EditHw10.Enabled := False;

  if (Self.Enabled) and (Self.Visible) and (DBEdit7.CanFocus) then
		DBEdit7.SetFocus;
end;

procedure TFrmCadProdutos.btHabMarkupProdPromocaoClick(Sender: TObject);
begin
  inherited;
  EditHw3.Enabled := False;
	btHabPercentProdPromocao.Visible := True;
  edMarukpMargemPromo.Enabled := True;
  btHabMarkupProdPromocao.Visible := False;
  if (Self.Enabled) and (Self.Visible) and (edMarukpMargemPromo.CanFocus) then
    edMarukpMargemPromo.SetFocus;
end;

procedure TFrmCadProdutos.btHabMarkupProdQtdeClick(Sender: TObject);
begin
  inherited;
  btHabMarkupProdQtde.Visible := False;
  btHabPercentProdQtde.Visible := True;
  edMarukpMargem.Enabled := True;
  DBEdit13.Enabled := True;
  DBEdit211.Enabled := False;
  if (Self.Enabled) and (Self.Visible) and (DBEdit13.CanFocus) then
    DBEdit13.SetFocus;
end;

procedure TFrmCadProdutos.btHabMarkupProdTabPrecoClick(Sender: TObject);
begin
  inherited;
  EditHw5.Enabled := False;
	btHabPercentProdTabPreco.Visible := True;
  edMarukpMargem.Enabled := True;
  btHabMarkupProdTabPreco.Visible := False;
  if (Self.Enabled) and (Self.Visible) and (edMarukpMargem.CanFocus) then
    edMarukpMargem.SetFocus;
end;

procedure TFrmCadProdutos.btHabPercentProdLocSetCidClick(Sender: TObject);
begin
  inherited;
  btHabPercentProdLocSetCid.Visible := False;
  btHabMarkupProdLocSetorCid.Visible := True;
  EditHw10.Enabled := True;
	DBEdit7.Enabled := False;

  if (Self.Enabled) and (Self.Visible) and (EditHw10.CanFocus) then
  	EditHw10.SetFocus;
end;

procedure TFrmCadProdutos.btHabPercentProdPromocaoClick(Sender: TObject);
begin
  inherited;
  EditHw3.Enabled := True;
	btHabPercentProdPromocao.Visible := False;
  edMarukpMargemPromo.Enabled := False;
  btHabMarkupProdPromocao.Visible := True;
  if (Self.Enabled) and (Self.Visible) and (EditHw3.CanFocus) then
  	EditHw3.SetFocus;
end;

procedure TFrmCadProdutos.btHabPercentProdQtdeClick(Sender: TObject);
begin
  inherited;
  btHabMarkupProdQtde.Visible := True;
  btHabPercentProdQtde.Visible := False;
  DBEdit13.Enabled := False;
  DBEdit211.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBEdit211.CanFocus) then
    DBEdit211.SetFocus;
end;

procedure TFrmCadProdutos.btHabPercentProdTabPrecoClick(Sender: TObject);
begin
  inherited;
  EditHw5.Enabled := True;
	btHabPercentProdTabPreco.Visible := False;
  edMarukpMargem.Enabled := False;
  btHabMarkupProdTabPreco.Visible := True;
  if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
  	EditHw5.SetFocus;
end;

procedure TFrmCadProdutos.btHistPrecoClick(Sender: TObject);
var
  afterScrollEvent: TDataSetNotifyEvent;
begin
  inherited;
  Application.CreateForm(TfrmCadProdutosHistPreco, frmCadProdutosHistPreco);

  try
    if produto.dataSet.state = dsBrowse then
      afterScrollEvent := Produto.dataSet.AfterScroll;

    Produto._dataSourceOOP := DBGrid1.DataSource;

    frmCadProdutosHistPreco.produto := Produto;
    frmCadProdutosHistPreco.markMargVisiveis := vDadosIni.PesqPros('PRO440', 'HABILITAR', '', '', '', Produto.buscas, False, False, True);
    frmCadProdutosHistPreco.custoVisivel := vDadosIni.PesqPros('PRO301', 'HABILITAR', '', '', '', Produto.buscas, False, False, True);
    frmCadProdutosHistPreco.ShowModal;

  finally
    Produto._dataSourceOOP := nil;

    if produto.dataSet.state = dsBrowse then
    begin
      Produto.dataSet.AfterScroll := afterScrollEvent;
      if Assigned(Produto.dataSet.AfterScroll) then
        Produto.dataSet.AfterScroll(Produto.dataSet);
    end;
  end;
end;

procedure TFrmCadProdutos.btImagemProdFecharClick(Sender: TObject);
begin
  inherited;
  TForm(pnImagemProd.Parent).ModalResult := ID_CLOSE;	
end;

procedure TFrmCadProdutos.btnAlterarDadosCAClick(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO376', 'ALTERAR', '', 'PRODUTOS_EC',
     Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
     Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true) then
    Exit;

  //  altera o modo design do webbrowse para ON
  lbEstCA.Enabled := false;
  DBEditEstCA.Enabled := false;

  btAlterEstCA.Enabled := true;
  btOKAlterEstCA.Enabled := false;
  btCancAlterEstCA.Enabled := false;

  lbEstGradeCA.Visible := false;
  DBEditEstCAGrade.Visible := false;

  btAlterEstCAGrade.Enabled := true;
  btOKAlterEstCAGrade.Enabled := false;
  btCancAlterEstCAGrade.Enabled := false;
  DBGridAlterEstCAGrade.Enabled := true;
  pnButtomAlterEstCAGrade.Visible := false;

  pnAlterEstCA.Visible := vDadosIni.vComercioAberto.vControleEstManualComercioAberto;

  LbPagCA.Caption := vDadosIni.IfThen(
  	(Produto.vProdutosEC.existeGrade(Produto.dataSet))
    and (vDadosIni.vComercioAberto.vControleEstManualComercioAberto) , '1/3', '1/2');

  sbVoltarCA.Visible := false;
  sbAvancarCA.Visible := true;
  pnOpcoesHtml.Visible := true;
  pnDadosCA.Enabled := true;
  pnOpcoesDadosCA.Visible := pnDadosCA.Enabled;
  if Assigned(WebBrowserCA.Document) then
	  (WebBrowserCA.Document as IHTMLDocument2).designMode := 'On';
  pnImagemProduto.Align := alClient;
  pnImagemProduto.Parent := pnImagemProdutoCA;

  lbDescrGradeImg.Caption := trim(Produto.vImagensProd.dataSet.FieldByName('DESCR_GRADE').AsString);
  if Produto.dataSet.State <> dsEdit then
    lbqtdeImgProd.Caption := ''
  else if Produto.vImagensProd.dataSet.RecordCount <= 0 then
  	lbqtdeImgProd.Caption := '0/0'
  else
  	lbqtdeImgProd.Caption := IntToStr(Produto.vImagensProd.dataSet.RecNo) +
      '/' + IntToStr(Produto.vImagensProd.dataSet.RecordCount);

  lbS_qtdeImgProd.Caption   := lbqtdeImgProd.Caption;
  lbS_qtdeImgProdEC.Caption := lbqtdeImgProd.Caption;
  lbS_qtdeImgProdCA.Caption := lbqtdeImgProd.Caption;

  if Produto.vProdutosEC.IsEmpty then
    Produto.vProdutosEC.Insert(Produto.dataSet)
  else
    Produto.vProdutosEC.Edit(Produto.dataSet);

  pnOpcoesDadosCA.Visible := true;
  DesativarAtivarCamposHtml('C', true);
	vDadosIni.abreForm('Dados Comércio Aberto', pnDadosCA, [ofEscapeExit, ofAlignAllClientWinCtrl]);

	PageControlCA.ActivePage := TabSheetCA1;

  if pnDadosCA.Tag <> 99 then
	  carregarwebbrownser(WebBrowserCA, Produto.vProdutosEC.dataSet.FieldByName('DESCR_PROD_COMPL').AsString);
  pnOpcoesDadosCA.Visible := false;
  DesativarAtivarCamposHtml('C', false);
end;

procedure TFrmCadProdutos.btnAlterarDadosECClick(Sender: TObject);
var
  I: Integer;
begin
  if not vDadosIni.PesqPros('PRO311', 'ALTERAR', '', 'PRODUTOS_EC',
     Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
     Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true) then
    Exit;

  // verificar limite produtos e-commerce
  if (Produto.vProdutosEC.dataSet.IsEmpty)
  	or ((not Produto.vProdutosEC.dataSet.IsEmpty) and (Produto.vProdutosEC.dataSet.FieldByName('sinc_ecommerce').AsString <> 'S')) then
  begin
    if not Produto.limiteProdutoEcommerce then
      exit;
  end;

  vSincronizarEcommerce := vDadosIni.IfThen(not Produto.vProdutosEC.dataSet.IsEmpty,
  	Produto.vProdutosEC.dataSet.FieldByName('SINC_ECOMMERCE').AsString, 'N');
  vDisponivelEcomerce := vDadosIni.IfThen(not Produto.vProdutosEC.dataSet.IsEmpty,
  	Produto.vProdutosEC.dataSet.FieldByName('DISPONIVEL').AsString, 'N');

  if (trim(Produto.dataSet.FieldByName('TIPO_ITEM').AsString) <> '04') // Produto não é acabado
  	and (vDadosIni.vEcommerce.vHabilitarEcommerce) // E-Commerce configurado
    and (not vDadosIni.vEcommerce.vControleEstManualECommerce) // Estoque manual E-Commerce
  	and (not Produto.vIndTec.dataSet.IsEmpty) then // Existe materias primas
  begin
    if not Produto.vProdutosEC.dataSet.IsEmpty then
    begin
      if (Produto.vProdutosEC.dataSet.FieldByName('sinc_ecommerce').AsString = 'S')
        and (Produto.vProdutosEC.dataSet.FieldByName('disponivel').AsString = 'S') then
      begin
        if Application.MessageBox('Produto disponível no E-Commerce, ' +
         'deseja mudar o tipo de item do produto para acabado?' + #13 + #13 +
         'Caso informe sim os estoques das matérias primas/insumo/embalagens será adicionado ao estoque do produto acabado no E-Commerce.',
         'Atenção', MB_YESNO + MB_ICONQUESTION +
          MB_DEFBUTTON2) = mrYES then
        begin
          if not (Produto.dataSet.State in [dsInsert, dsEdit]) then
            Produto.dataSet.Edit;
          Produto.dataSet.FieldByName('TIPO_ITEM').AsString := '04';

          for I := 0 to DBComboBox11.Items.Count - 1 do
            if (trim(DBComboBox11.Items[i]) = '04') then
              DBComboBox11.ItemIndex := i;
        end;
      end;
    end
    else
    begin
      if Application.MessageBox('Produto possui matérias primas/insumo/embalagens, ' +
       'deseja mudar o tipo de item do produto para acabado?' + #13 + #13 +
       'Caso informe sim os estoques das matérias primas/insumo/embalagens será adicionado ao estoque do produto acabado no E-Commerce.',
       'Atenção', MB_YESNO + MB_ICONQUESTION +
        MB_DEFBUTTON2) = mrYES then
      begin
        if not (Produto.dataSet.State in [dsInsert, dsEdit]) then
          Produto.dataSet.Edit;
        Produto.dataSet.FieldByName('TIPO_ITEM').AsString := '04';

        for I := 0 to DBComboBox11.Items.Count - 1 do
          if (trim(DBComboBox11.Items[i]) = '04') then
            DBComboBox11.ItemIndex := i;
      end;
    end;
  end;

  Produto.vProdutosEC.verificarTipoGradesEC(False);
  
  //  altera o modo design do webbrowse para ON
  lbEstMinEC.Enabled := false;
  DBEditEstMinEC.Enabled := false;

  lbEstEC.Enabled := false;
  DBEditEstEC.Enabled := false;
  
  btAlterEstEC.Enabled := true;
  btOKAlterEstEC.Enabled := false;
  btCancAlterEstEC.Enabled := false;

  lbEstGradeEC.Visible := false;
  DBEditEstECGrade.Visible := false;
  
  btAlterEstECGrade.Enabled := true;
  btOKAlterEstECGrade.Enabled := false;
  btCancAlterEstECGrade.Enabled := false;
  DBGridAlterEstECGrade.Enabled := true;
  pnButtomAlterEstECGrade.Visible := false;

  pnAlterEstEC.Visible := vDadosIni.vEcommerce.vControleEstManualECommerce;

  LbPagEC.Caption := vDadosIni.IfThen(
  	(Produto.vProdutosEC.existeGrade(Produto.dataSet))
    or (vDadosIni.vEcommerce.vControleEstManualECommerce) , '1/4', '1/3');

  sbVoltarEC.Visible := false;
  sbAvancarEC.Visible := true;
  pnOpcoesHtml.Visible := true;
  pnDadosEC.Enabled := true;
  pnOpcoesDadosEC.Visible := pnDadosEC.Enabled;
  if Assigned(WebBrowserEC.Document) then
	  (WebBrowserEC.Document as IHTMLDocument2).designMode := 'On';
  pnImagemProduto.Align := alClient;
  pnImagemProduto.Parent := pnImagemProdutoEC;

  lbDescrGradeImg.Caption := trim(Produto.vImagensProd.dataSet.FieldByName('DESCR_GRADE').AsString);
	if Produto.dataSet.State <> dsEdit then
    lbqtdeImgProd.Caption := ''
  else if Produto.vImagensProd.dataSet.RecordCount <= 0 then
  	lbqtdeImgProd.Caption := '0/0'
  else
  	lbqtdeImgProd.Caption := IntToStr(Produto.vImagensProd.dataSet.RecNo) +
      '/' + IntToStr(Produto.vImagensProd.dataSet.RecordCount);

  lbS_qtdeImgProd.Caption   := lbqtdeImgProd.Caption;
  lbS_qtdeImgProdEC.Caption := lbqtdeImgProd.Caption;
  lbS_qtdeImgProdCA.Caption := lbqtdeImgProd.Caption;
      
  if Produto.vProdutosEC.IsEmpty then
    Produto.vProdutosEC.Insert(Produto.dataSet)
  else
    Produto.vProdutosEC.Edit(Produto.dataSet);

  RemoveAcentosEspacos;

  pnOpcoesDadosEC.Visible := true;
  DesativarAtivarCamposHtml('E', true);
	vDadosIni.abreForm('Dados E-Commerce', pnDadosEC, [ofEscapeExit, ofAlignAllClientWinCtrl]);

	PageControlEC.ActivePage := TabSheetEC1;

	if pnDadosEC.Tag <> 99 then
	  carregarwebbrownser(WebBrowserEC, Produto.vProdutosEC.dataSet.FieldByName('DESCR_PROD_COMPL').AsString);
  pnOpcoesDadosEC.Visible := false;
  DesativarAtivarCamposHtml('E', false);
end;

procedure TFrmCadProdutos.btnCancProdLoteClick(Sender: TObject);
begin
  inherited;
  Produto.Cancel;
  Produto.CancelUpdates;
  Produto.CodBarra.Cancel;
  Produto.CodBarra.CancelUpdates;
  Produto.RollBackTransacao;

  PageControl1.ActivePage := tsAlterDadosProd;
  tsAlterDadosProd.Show;
end;

procedure TFrmCadProdutos.btNovoSped0205Click(Sender: TObject);
begin
  inherited;
  edGrupoSped0205.Clear;
  edCodigoSped0205.Clear;
  cbTipoAltSped0205.ItemIndex := -1;
  edDescricaoSped0205.Clear;
  edDataIniSped0205.Clear;
  edDataFimSped0205.Clear;
  edMesMovSped0205.Clear;
  btNovoSped0205.Enabled := True;
  btAlterarSped0205.Enabled := True;
  btExcluirSped0205.Enabled := True;
  btVoltarSped0205.Enabled := True;
  if vProdAlt.iniciarInclusaoRegistro(Produto.buscas) then
  begin
    grCadastroSped0205.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (edGrupoSped0205.CanFocus) then
      edGrupoSped0205.SetFocus;
    btNovoSped0205.Enabled := False;
    btAlterarSped0205.Enabled := False;
    btExcluirSped0205.Enabled := False;
    btVoltarSped0205.Enabled := False;
  end;
end;

procedure TFrmCadProdutos.btnSCashbackClick(Sender: TObject);
begin
  inherited;
	vDadosIni.abreForm('Cashback Produto', pnS_Cashback, [ofAutoSize, ofEscapeExit, ofBIMinimizeOff, ofBIMaximizeOff]);
end;

procedure TFrmCadProdutos.btnSComercioAbertoClick(Sender: TObject);
begin
  try
  
  	try
      if Assigned(TreeViewCat) then
        FreeAndNil(TreeViewCat);
    finally
      if not Assigned(TreeViewCat) then
      begin
        TreeViewCat := TTreeView.Create(Self);
        TreeViewCat.Parent := Panel94;
        TreeViewCat.Align := alClient;
        TreeViewCat.OnDblClick := TreeViewCatDblClick;
        TreeViewCat.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewCatDB) then
      	FreeAndNil(TreeViewCatDB);
    finally
    	if not Assigned(TreeViewCatDB) then
      begin
        TreeViewCatDB := TTreeView.Create(Self);
        TreeViewCatDB.Parent := Panel97;
        TreeViewCatDB.Align := alClient;
        TreeViewCatDB.OnDblClick := TreeViewCatDBDblClick;
        TreeViewCatDB.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewGradeEC) then
        FreeAndNil(TreeViewGradeEC);
    finally
      if not Assigned(TreeViewGradeEC) then
      begin
        TreeViewGradeEC := TTreeView.Create(Self);
        TreeViewGradeEC.Parent := Panel102;
        TreeViewGradeEC.Align := alClient;
        TreeViewGradeEC.OnDblClick := TreeViewGradeECDblClick;
        TreeViewGradeEC.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewGradeEC_DB) then
        FreeAndNil(TreeViewGradeEC_DB);
    finally
      if not Assigned(TreeViewGradeEC_DB) then
      begin
        TreeViewGradeEC_DB := TTreeView.Create(Self);
        TreeViewGradeEC_DB.Parent := Panel105;
        TreeViewGradeEC_DB.Align := alClient;
        TreeViewGradeEC_DB.OnDblClick := TreeViewGradeEC_DBDblClick;
        TreeViewGradeEC_DB.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewGradeCA) then
      	FreeAndNil(TreeViewGradeCA);
    finally
    	if not Assigned(TreeViewGradeCA) then
      begin
      	TreeViewGradeCA := TTreeView.Create(Self);
    		TreeViewGradeCA.Parent := Panel85;
        TreeViewGradeCA.Align := alClient;
        TreeViewGradeCA.OnDblClick := TreeViewGradeCADblClick;
        TreeViewGradeCA.Items.Clear;
      end;
    end;
    
    try
    	if Assigned(TreeViewGradeCA_DB) then
      	FreeAndNil(TreeViewGradeCA_DB);
    finally
    	if not Assigned(TreeViewGradeCA_DB) then
      begin
        TreeViewGradeCA_DB := TTreeView.Create(Self);
        TreeViewGradeCA_DB.Parent := Panel90;
        TreeViewGradeCA_DB.Align := alClient;
        TreeViewGradeCA_DB.OnDblClick := TreeViewGradeCA_DBDblClick;
        TreeViewGradeCA_DB.Items.Clear;
      end;
    end;

    vDadosIni.removerGradeNaoUtilizadosEcomerce(
      Produto.dataset.FieldByName('GRUPO_PROD').AsInteger,
      Produto.dataset.FieldByName('COD_PROD').AsString
    );

    Produto.vImagensProd.alterarImagemNovaTab(Produto.dataSet, vDiretorioDestino);

    pnDadosCA.Tag := 99;

//    vDadosIni.abreForm('Comércio Aberto', pnS_ComercioAberto, [ofAutoSize, ofEscapeExit, ofBIMinimizeOff, ofBIMaximizeOff]);

  	montarComponentes;

    PageControlCA.ActivePage := TabSheetCA1;

    pnDadosCA.Align  := alNone;
    pnDadosCA.Height := 348;
    pnDadosCA.Width  := 876;
    
    habilitarCamposComercioAberto(true);
		pnDadosCAEnter(Sender);
    btnAlterarDadosCAClick(Sender);
  finally
  	pnDadosCA.Align := alClient;
  	pnDadosCA.Tag := 0;
  end;
end;

procedure TFrmCadProdutos.btnSComposicaoClick(Sender: TObject);
begin
  inherited;
  vDadosIni.abreForm('Composição', pnS_Composicao, [ofAutoSize, ofEscapeExit, ofBIMinimizeOff, ofBIMaximizeOff]);
end;

procedure TFrmCadProdutos.btnSConversaoClick(Sender: TObject);
begin
  inherited;
  vDadosIni.abreForm('Conversão', pnS_Conversao, [ofAutoSize, ofEscapeExit, ofBIMinimizeOff, ofBIMaximizeOff]);
end;

procedure TFrmCadProdutos.btnSECommerceClick(Sender: TObject);
begin
  try

    try
      if Assigned(TreeViewCat) then
        FreeAndNil(TreeViewCat);
    finally
      if not Assigned(TreeViewCat) then
      begin
        TreeViewCat := TTreeView.Create(Self);
        TreeViewCat.Parent := Panel94;
        TreeViewCat.Align := alClient;
        TreeViewCat.OnDblClick := TreeViewCatDblClick;
        TreeViewCat.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewCatDB) then
      	FreeAndNil(TreeViewCatDB);
    finally
    	if not Assigned(TreeViewCatDB) then
      begin
        TreeViewCatDB := TTreeView.Create(Self);
        TreeViewCatDB.Parent := Panel97;
        TreeViewCatDB.Align := alClient;
        TreeViewCatDB.OnDblClick := TreeViewCatDBDblClick;
        TreeViewCatDB.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewGradeEC) then
        FreeAndNil(TreeViewGradeEC);
    finally
      if not Assigned(TreeViewGradeEC) then
      begin
        TreeViewGradeEC := TTreeView.Create(Self);
        TreeViewGradeEC.Parent := Panel102;
        TreeViewGradeEC.Align := alClient;
        TreeViewGradeEC.OnDblClick := TreeViewGradeECDblClick;
        TreeViewGradeEC.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewGradeEC_DB) then
        FreeAndNil(TreeViewGradeEC_DB);
    finally
      if not Assigned(TreeViewGradeEC_DB) then
      begin
        TreeViewGradeEC_DB := TTreeView.Create(Self);
        TreeViewGradeEC_DB.Parent := Panel105;
        TreeViewGradeEC_DB.Align := alClient;
        TreeViewGradeEC_DB.OnDblClick := TreeViewGradeEC_DBDblClick;
        TreeViewGradeEC_DB.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewGradeCA) then
      	FreeAndNil(TreeViewGradeCA);
    finally
    	if not Assigned(TreeViewGradeCA) then
      begin
      	TreeViewGradeCA := TTreeView.Create(Self);
    		TreeViewGradeCA.Parent := Panel85;
        TreeViewGradeCA.Align := alClient;
        TreeViewGradeCA.OnDblClick := TreeViewGradeCADblClick;
        TreeViewGradeCA.Items.Clear;
      end;
    end;
    
    try
    	if Assigned(TreeViewGradeCA_DB) then
      	FreeAndNil(TreeViewGradeCA_DB);
    finally
    	if not Assigned(TreeViewGradeCA_DB) then
      begin
        TreeViewGradeCA_DB := TTreeView.Create(Self);
        TreeViewGradeCA_DB.Parent := Panel90;
        TreeViewGradeCA_DB.Align := alClient;
        TreeViewGradeCA_DB.OnDblClick := TreeViewGradeCA_DBDblClick;
        TreeViewGradeCA_DB.Items.Clear;
      end;
    end;

    vDadosIni.removerGradeNaoUtilizadosEcomerce(
      Produto.dataset.FieldByName('GRUPO_PROD').AsInteger,
      Produto.dataset.FieldByName('COD_PROD').AsString
    );

    Produto.vImagensProd.alterarImagemNovaTab(Produto.dataSet, vDiretorioDestino);

//    vDadosIni.abreForm('E-Commerce', pnS_ECommerce, [ofAutoSize, ofEscapeExit, ofBIMinimizeOff, ofBIMaximizeOff]);

    pnDadosEC.Tag := 99;

    montarComponentes;

    PageControlEC.ActivePage := TabSheetEC1;

    pnDadosEC.Align  := alNone;
    pnDadosEC.Height := 348;
    pnDadosEC.Width  := 876;
    
    habilitarCamposECommerce(true);
    pnDadosECEnter(Sender);
    btnAlterarDadosECClick(Sender);
  finally
  	pnDadosEC.Align := alClient;
    pnDadosEC.Tag := 0;
  end;
end;

procedure TFrmCadProdutos.btnSFiscalClick(Sender: TObject);
begin
  inherited;
  vDadosIni.abreForm('Fiscal', pnS_Fiscal, [ofAutoSize, ofEscapeExit, ofBIMinimizeOff, ofBIMaximizeOff]);
end;

procedure TFrmCadProdutos.btnSFretePesoClick(Sender: TObject);
begin
  inherited;
  vDadosIni.abreForm('Frete por peso', pnS_FretePeso, [ofAutoSize, ofEscapeExit, ofBIMinimizeOff, ofBIMaximizeOff]);
end;

procedure TFrmCadProdutos.btnSKitsProdClick(Sender: TObject);
begin
  inherited;
  vDadosIni.abreForm('Kits do Produto', pnS_KitsProd, [ofAutoSize, ofEscapeExit, ofBIMinimizeOff, ofBIMaximizeOff]);
end;

procedure TFrmCadProdutos.btnSOutrosClick(Sender: TObject);
begin
  inherited;
  vDadosIni.abreForm('Outros Dados', pnS_Outros, [ofAutoSize, ofEscapeExit, ofBIMinimizeOff, ofBIMaximizeOff]);
end;

procedure TFrmCadProdutos.btnSPrecoPorQtdeClick(Sender: TObject);
begin
  inherited;
  vDadosIni.abreForm('Preços por quantidade', pnS_PrecosPorQtde , [ofAutoSize, ofEscapeExit, ofBIMinimizeOff, ofBIMaximizeOff]);
end;

procedure TFrmCadProdutos.btnSPrecosClick(Sender: TObject);
begin
  inherited;
  vDadosIni.abreForm('Preços', pnS_Precos, [ofAutoSize, ofEscapeExit, ofBIMinimizeOff, ofBIMaximizeOff]);
end;

procedure TFrmCadProdutos.btSairEtiTermicaClick(Sender: TObject);
begin
  inherited;
	TForm(pnModEtiTermica.Parent).ModalResult := ID_NO;
end;

procedure TFrmCadProdutos.btSalvarProdLoteClick(Sender: TObject);
begin
  inherited;
	try
  	Screen.Cursor := crHourGlass;
    FrmCadProdutos.Enabled := false;
    DBGrid1.Visible := false;
    
    Produto.vAtualizarProd.vHabGrupo :=	ckGrupo.Checked;
    Produto.vAtualizarProd.vHabPerfil := ckPerfil.Checked;
    Produto.vAtualizarProd.vHabSubGrupo := ckSubGrupo.Checked;
    Produto.vAtualizarProd.vHabMarca := ckMarca.Checked;
    Produto.vAtualizarProd.vHabNatOP := ckNatOP.Checked;
    Produto.vAtualizarProd.vHabNCM := ckNCM.Checked;
    Produto.vAtualizarProd.vHabCEST := ckCEST.Checked;
    Produto.vAtualizarProd.vHabCST := ckCST.Checked;
    Produto.vAtualizarProd.vHabAliqICMS := ckAliqICMS.Checked;
    Produto.vAtualizarProd.vHabCSON := ckCSON.Checked;
    Produto.vAtualizarProd.vHabPercReducao := ckPercReducao.Checked;
    Produto.vAtualizarProd.vHabCSTPisCofinsS := ckCSTPisCofinsS.Checked;
    Produto.vAtualizarProd.vHabCSTPisCofinsE := ckCSTPisCofinsE.Checked;
    Produto.vAtualizarProd.vHabNatRec := ckNatRec.Checked;
    Produto.vAtualizarProd.vHabAliqPisCofinsDif := ckAliqPisCofinsDif.Checked;
    Produto.vAtualizarProd.vHabAliqCredPisCofins := ckAliqCredPisCofins.Checked;
    Produto.vAtualizarProd.vHabIsento := ckIsento.Checked;
    Produto.vAtualizarProd.vHabCstIPI := ckCstIPI.Checked;
    Produto.vAtualizarProd.vHabAliqIPI := ckAliqIPI.Checked;
    Produto.vAtualizarProd.vHabCodEnqIPI := ckCodEnqIPI.Checked;
    Produto.vAtualizarProd.vHabPercTab := ckPercTab.Checked;
    Produto.vAtualizarProd.vHabPercAtac := ckPercAtac.Checked;
    Produto.vAtualizarProd.vHabPerc30 := ckPerc30.Checked;
    Produto.vAtualizarProd.vHabPerc60 := ckPerc60.Checked;
    Produto.vAtualizarProd.vHabPerc90 := ckPerc90.Checked;
    Produto.vAtualizarProd.vHabDescMax := ckDescMax.Checked;
    Produto.vAtualizarProd.vHabPercMargemMinVarejo := ckPercMargemMinVarejo.Checked;
    Produto.vAtualizarProd.vHabPercMargemMinAtacado := ckPercMargemMinAtacado.Checked;
    Produto.vAtualizarProd.vHabPercAjustePrec30 := ckPercAjustePrec30.Checked;
    Produto.vAtualizarProd.vHabPercAjustePrec60 := ckPercAjustePrec60.Checked;
    Produto.vAtualizarProd.vHabPercAjustePrec90 := ckPercAjustePrec90.Checked;
    Produto.vAtualizarProd.vHabObsEtiq := ckObsEtiq.Checked;
    Produto.vAtualizarProd.vHabTipoProd := ckTipoProduto.Checked;
    Produto.vAtualizarProd.vHabTipoitemProd := ckTipoItemProduto.Checked;
    Produto.vAtualizarProd.vHabConsumo := ckConsumo.Checked;
    Produto.vAtualizarProd.vHabPermDesc := ckPermDesc.Checked;
    Produto.vAtualizarProd.vHabClasse := ckClasse.Checked;
    Produto.vAtualizarProd.vHabAlterarDescrCupom := ckAlterarDescrCupom.Checked;
    Produto.vAtualizarProd.vHabAlterarVlCupom := ckAlterarVlCupom.Checked;
    Produto.vAtualizarProd.vHabComissaoProd := ckComissaoProduto.Checked;
    Produto.vAtualizarProd.vHabComissaoGerente := ckComissaoGerente.Checked;
    Produto.vAtualizarProd.vHabAplicacaoRef := ckAplicacaoRef.Checked;
    Produto.vAtualizarProd.vHabAloc1 := ckAloc1.Checked;
    Produto.vAtualizarProd.vHabAloc2 := ckAloc2.Checked;
    Produto.vAtualizarProd.vHabVendaOnline := ckVendaOnline.Checked;
    Produto.vAtualizarProd.vHabLancDebCred := ckLancDebCred.Checked;
    Produto.vAtualizarProd.vHabPercDebCredDev := ckPercDebCredDev.Checked;
    Produto.vAtualizarProd.vHabComissFaixaDesc := ckComissaoFaixaDesconto.Checked;
    Produto.vAtualizarProd.vHabCashback := ckCashback.Checked;

    Produto.vAtualizarProd.vCodGrupoLote := Trunc(EdCodGrupoProd.AsValue);
    Produto.vAtualizarProd.vCodPerfilLote := Trunc(EdCodPerfilProd.AsValue);
    Produto.vAtualizarProd.vCodSubGrupoLote := Trunc(EdCodSubGrupo.AsValue);
    Produto.vAtualizarProd.vCodMarcaLote := Trunc(EdCodMarca.AsValue);
    Produto.vAtualizarProd.vCFOPIntraLote := Trunc(EdCodCFOP.AsValue);
    Produto.vAtualizarProd.vCFOPInterLote := Trunc(EdCodCFOPInter.AsValue);
    Produto.vAtualizarProd.vNCMLote := trim(EdCodNCM.Text);
    Produto.vAtualizarProd.vCESTLote := trim(EdCEST.Text);
    Produto.vAtualizarProd.vCstICMSLote := trim(EdCodCST.Text);
    Produto.vAtualizarProd.vAliqICMSLote := EdAliqICMS.AsValue;
    Produto.vAtualizarProd.vCsosICMSLote := trim(EdCodCSOSN.Text);
    Produto.vAtualizarProd.vPercReducaoICMSLote := EdPercReducao.AsValue;
    Produto.vAtualizarProd.vCSTSaidaPisCofinsLote := trim(EdCSTPisCofinsSaida.Text);
    Produto.vAtualizarProd.vCSTEntradaPisCofinsLote := trim(EdCSTPisCofinsEntrada.Text);
    Produto.vAtualizarProd.vNatRecPisCofinsLote := trim(EdNatReceita.Text);
    Produto.vAtualizarProd.vAliqPisDifLote := EdAliqPisDif.AsValue;
    Produto.vAtualizarProd.vAliqCofinsDifLote := EdAliqCofinsDif.AsValue;
    Produto.vAtualizarProd.vAliqCredPisLote := EdAliqCredPis.AsValue;
    Produto.vAtualizarProd.vAliqCredCofinsLote := EdAliqCredCofins.AsValue;
    Produto.vAtualizarProd.vIsentoPisCofinsLote := trim(CbIsento.Text);
    Produto.vAtualizarProd.vCstIPILote := trim(EdCSTIPI.Text);
    Produto.vAtualizarProd.vAliqIPILote := EdAliqIPI.AsValue;
    Produto.vAtualizarProd.vCodEnqIPILote := trim(EdCodEnqIPI.Text);
    Produto.vAtualizarProd.vPercTabLote := EdPercTab.AsValue;
    Produto.vAtualizarProd.vPercAtacLote := EdPercAtac.AsValue;
    Produto.vAtualizarProd.vPerc30Lote := EdPerc30.AsValue;
    Produto.vAtualizarProd.vPerc60Lote := EdPerc60.AsValue;
    Produto.vAtualizarProd.vPerc90Lote := EdPerc90.AsValue;
    Produto.vAtualizarProd.vDescMaxLote := EdDescMax.AsValue;
    Produto.vAtualizarProd.vPercMargemMinVarejoLote := EdPercMargemMinVarejo.AsValue;
    Produto.vAtualizarProd.vPercMargemMinAtacadoLote := EdPercMargemMinAtacado.AsValue;
  	 Produto.vAtualizarProd.vPercAjustePrec30Lote := EdPercAjustePrec30.AsValue;
    Produto.vAtualizarProd.vPercAjustePrec60Lote := EdPercAjustePrec60.AsValue;
    Produto.vAtualizarProd.vPercAjustePrec90Lote := EdPercAjustePrec90.AsValue;
    Produto.vAtualizarProd.vObsEtiq := trim(EdObsEtiq.Text);
    Produto.vAtualizarProd.vTipoProdLote := trim(DbLTipo.KeyValue);
    Produto.vAtualizarProd.vTipoItemProdLote := Copy(trim(DbLTipoItem.Text), 1, 2);
    Produto.vAtualizarProd.vConsumoLote := trim(cbConsumo.Text);
    Produto.vAtualizarProd.vPermDescLote := trim(cbPermDesc.Text);
    Produto.vAtualizarProd.vClasseLote := trim(cbClasse.Text);
    Produto.vAtualizarProd.vAlterarDescrCupomLote := trim(cbAlterarDescrCupom.Text);
    Produto.vAtualizarProd.vAlterarVlCupomLote := trim(cbAlterarVlCupom.Text);
    Produto.vAtualizarProd.vComissaoProdLote := EdComissaoProduto.AsValue;
    Produto.vAtualizarProd.vComissaoGerenteLote := EdComissaoGerente.AsValue;
    Produto.vAtualizarProd.vAplicacaoRef := trim(EdAplicacaoRef.Text);
    Produto.vAtualizarProd.vAloc1 := trim(MkAloc1.Text);
    Produto.vAtualizarProd.vAloc2 := trim(MkAloc1.Text);
    Produto.vAtualizarProd.vVendaOnline := Trim(cbVendaOnline.Text);
    Produto.vAtualizarProd.vLancDebCred := Trim(cbLancDebCred.Text);
    Produto.vAtualizarProd.vPercDebCredDev := EdPercDebCredDev.AsValue;
    Produto.vAtualizarProd.vCodComissFaixaDesc := Trunc(EdComissaoFaixaDesc.AsValue);
    Produto.vAtualizarProd.vPercComissaoCashback := EdPercComissaoCashback.AsValue;
    Produto.vAtualizarProd.vDiasVencimentoCashback := Trunc(EdDiasVencCashback.AsValue);

    if not Produto.AtualizarProdutosEmLote then
    begin
      setFocusCampoErro(Produto.vNomeCampoErro, Produto.vMensagemErro);
      exit;
    end;
  finally
  	 _GravaConfiguracoesDouble(EdCodGrupoProd.Name, EdCodGrupoProd.AsValue);
    _GravaConfiguracoesInteger(DBLGrupoProd.Name,	DBLGrupoProd.KeyValue);
    _GravaConfiguracoesDouble(EdCodPerfilProd.Name, EdCodPerfilProd.AsValue);
    _GravaConfiguracoesString(EdPerfilProd.Name, EdPerfilProd.Text);
    _GravaConfiguracoesDouble(EdCodSubGrupo.Name, EdCodSubGrupo.AsValue);
    _GravaConfiguracoesDouble(DBLSubGrupo.Name, DBLSubGrupo.KeyValue);
    _GravaConfiguracoesDouble(EdCodMarca.Name, EdCodMarca.AsValue);
    _GravaConfiguracoesInteger(DBLMarca.Name, DBLMarca.KeyValue);
    _GravaConfiguracoesDouble(EdCodCFOP.Name, EdCodCFOP.AsValue);
    _GravaConfiguracoesDouble(EdCodCFOPInter.Name, EdCodCFOPInter.AsValue);
    _GravaConfiguracoesString(EdCodNCM.Name, EdCodNCM.Text);
    _GravaConfiguracoesString(EdCEST.Name, EdCEST.Text);
    _GravaConfiguracoesString(EdCodCST.Name, EdCodCST.Text);
    _GravaConfiguracoesDouble(EdAliqICMS.Name, EdAliqICMS.AsValue);
    _GravaConfiguracoesString(EdCodCSOSN.Name, EdCodCSOSN.Text);
    _GravaConfiguracoesDouble(EdPercReducao.Name, EdPercReducao.AsValue);
    _GravaConfiguracoesString(EdCSTPisCofinsSaida.Name, EdCSTPisCofinsSaida.Text);
    _GravaConfiguracoesString(EdCSTPisCofinsEntrada.Name, EdCSTPisCofinsEntrada.Text);
    _GravaConfiguracoesString(EdNatReceita.Name, EdNatReceita.Text);
    _GravaConfiguracoesDouble(EdAliqPisDif.Name, EdAliqPisDif.AsValue);
  	 _GravaConfiguracoesDouble(EdAliqCofinsDif.Name, EdAliqCofinsDif.AsValue);
    _GravaConfiguracoesDouble(EdAliqCredPis.Name, EdAliqCredPis.AsValue);
    _GravaConfiguracoesDouble(EdAliqCredCofins.Name, EdAliqCredCofins.AsValue);
    _GravaConfiguracoesInteger(CbIsento.Name, CbIsento.ItemIndex);
  	 _GravaConfiguracoesString(EdCSTIPI.Name, EdCSTIPI.Text);
    _GravaConfiguracoesDouble(EdAliqIPI.Name, EdAliqIPI.AsValue);
    _GravaConfiguracoesString(EdCodEnqIPI.Name, EdCodEnqIPI.Text);
    _GravaConfiguracoesDouble(EdPercComissaoCashback.Name, EdPercComissaoCashback.AsValue);
    _GravaConfiguracoesDouble(EdDiasVencCashback.Name, EdDiasVencCashback.AsValue);
    if not vDadosIni.vProduto.Precos.UsarMargemAoMarkup then
    begin
      _GravaConfiguracoesDouble(EdPercTab.Name, EdPercTab.AsValue);
      _GravaConfiguracoesDouble(EdPercAtac.Name, EdPercAtac.AsValue);
      _GravaConfiguracoesDouble(EdPerc30.Name, EdPerc30.AsValue);
      _GravaConfiguracoesDouble(EdPerc60.Name, EdPerc60.AsValue);
      _GravaConfiguracoesDouble(EdPerc90.Name, EdPerc90.AsValue);
    end
    else
    begin
      _GravaConfiguracoesDouble('Mrg' + EdPercTab.Name, EdPercTab.AsValue);
      _GravaConfiguracoesDouble('Mrg' + EdPercAtac.Name, EdPercAtac.AsValue);
      _GravaConfiguracoesDouble('Mrg' + EdPerc30.Name, EdPerc30.AsValue);
      _GravaConfiguracoesDouble('Mrg' + EdPerc60.Name, EdPerc60.AsValue);
      _GravaConfiguracoesDouble('Mrg' + EdPerc90.Name, EdPerc90.AsValue);
    end;
    _GravaConfiguracoesDouble(EdDescMax.Name, EdDescMax.AsValue);
    _GravaConfiguracoesDouble(EdPercMargemMinVarejo.Name, EdPercMargemMinVarejo.AsValue);
    _GravaConfiguracoesDouble(EdPercMargemMinAtacado.Name, EdPercMargemMinAtacado.AsValue);
    _GravaConfiguracoesDouble(EdPercAjustePrec30.Name, EdPercAjustePrec30.AsValue);
    _GravaConfiguracoesDouble(EdPercAjustePrec60.Name, EdPercAjustePrec60.AsValue);
    _GravaConfiguracoesDouble(EdPercAjustePrec90.Name, EdPercAjustePrec90.AsValue);
    _GravaConfiguracoesString(DbLTipo.Name, DbLTipo.KeyValue);
    _GravaConfiguracoesString(DbLTipoItem.Name, DbLTipoItem.KeyValue);
    _GravaConfiguracoesInteger(cbConsumo.Name, cbConsumo.ItemIndex);
    _GravaConfiguracoesInteger(cbPermDesc.Name, cbPermDesc.ItemIndex);
    _GravaConfiguracoesInteger(cbClasse.Name, cbClasse.ItemIndex);
    _GravaConfiguracoesInteger(cbAlterarDescrCupom.Name, cbAlterarDescrCupom.ItemIndex);
    _GravaConfiguracoesInteger(cbAlterarVlCupom.Name, cbAlterarVlCupom.ItemIndex);
    _GravaConfiguracoesDouble(EdComissaoProduto.Name, EdComissaoProduto.AsValue);
    _GravaConfiguracoesDouble(EdComissaoGerente.Name, EdComissaoGerente.AsValue);
    _GravaConfiguracoesString(EdObsEtiq.Name, trim(EdObsEtiq.Text));
    _GravaConfiguracoesString(EdAplicacaoRef.Name, trim(EdAplicacaoRef.Text));
    _GravaConfiguracoesString(MkAloc1.Name, trim(MkAloc1.Text));
    _GravaConfiguracoesString(MkAloc2.Name, trim(MkAloc2.Text));
    _GravaConfiguracoesInteger(cbVendaOnline.Name, cbVendaOnline.ItemIndex);
    _GravaConfiguracoesInteger(cbLancDebCred.Name, cbLancDebCred.ItemIndex);
    _GravaConfiguracoesDouble(EdPercDebCredDev.Name, EdPercDebCredDev.AsValue);
    _GravaConfiguracoesDouble(EdComissaoFaixaDesc.Name, EdComissaoFaixaDesc.AsValue);
    _GravaConfiguracoesInteger(DBLComissaoFaixaDesc.Name, DBLComissaoFaixaDesc.KeyValue);

    _GravaConfiguracoesBoolean(ckGrupo.Name, ckGrupo.Checked);
    _GravaConfiguracoesBoolean(ckPerfil.Name, ckPerfil.Checked);
    _GravaConfiguracoesBoolean(ckSubGrupo.Name, ckSubGrupo.Checked);
    _GravaConfiguracoesBoolean(ckMarca.Name, ckMarca.Checked);
    _GravaConfiguracoesBoolean(ckNatOP.Name, ckNatOP.Checked);
    _GravaConfiguracoesBoolean(ckNCM.Name, ckNCM.Checked);
    _GravaConfiguracoesBoolean(ckCEST.Name, ckCEST.Checked);
    _GravaConfiguracoesBoolean(ckCST.Name, ckCST.Checked);
    _GravaConfiguracoesBoolean(ckAliqICMS.Name, ckAliqICMS.Checked);
    _GravaConfiguracoesBoolean(ckCSON.Name, ckCSON.Checked);
    _GravaConfiguracoesBoolean(ckPercReducao.Name, ckPercReducao.Checked);
    _GravaConfiguracoesBoolean(ckCSTPisCofinsS.Name, ckCSTPisCofinsS.Checked);
    _GravaConfiguracoesBoolean(ckCSTPisCofinsE.Name, ckCSTPisCofinsE.Checked);
    _GravaConfiguracoesBoolean(ckNatRec.Name, ckNatRec.Checked);
    _GravaConfiguracoesBoolean(ckAliqPisCofinsDif.Name, ckAliqPisCofinsDif.Checked);
    _GravaConfiguracoesBoolean(ckAliqCredPisCofins.Name, ckAliqCredPisCofins.Checked);
    _GravaConfiguracoesBoolean(ckIsento.Name, ckIsento.Checked);
    _GravaConfiguracoesBoolean(ckCstIPI.Name, ckCstIPI.Checked);
    _GravaConfiguracoesBoolean(ckAliqIPI.Name, ckAliqIPI.Checked);
    _GravaConfiguracoesBoolean(ckCodEnqIPI.Name, ckCodEnqIPI.Checked);
    _GravaConfiguracoesBoolean(ckPercTab.Name, ckPercTab.Checked);
    _GravaConfiguracoesBoolean(ckPercAtac.Name, ckPercAtac.Checked);
    _GravaConfiguracoesBoolean(ckPerc30.Name, ckPerc30.Checked);
    _GravaConfiguracoesBoolean(ckPerc60.Name, ckPerc60.Checked);
    _GravaConfiguracoesBoolean(ckPerc90.Name, ckPerc90.Checked);
    _GravaConfiguracoesBoolean(ckDescMax.Name, ckDescMax.Checked);
    _GravaConfiguracoesBoolean(ckPercMargemMinVarejo.Name, ckPercMargemMinVarejo.Checked);
    _GravaConfiguracoesBoolean(ckPercMargemMinAtacado.Name, ckPercMargemMinAtacado.Checked);
    _GravaConfiguracoesBoolean(ckPercAjustePrec30.Name, ckPercAjustePrec30.Checked);
    _GravaConfiguracoesBoolean(ckPercAjustePrec60.Name, ckPercAjustePrec60.Checked);
    _GravaConfiguracoesBoolean(ckPercAjustePrec90.Name, ckPercAjustePrec90.Checked);
    _GravaConfiguracoesBoolean(ckTipoProduto.Name, ckTipoProduto.Checked);
    _GravaConfiguracoesBoolean(ckTipoItemProduto.Name, ckTipoItemProduto.Checked);
    _GravaConfiguracoesBoolean(ckConsumo.Name, ckConsumo.Checked);
    _GravaConfiguracoesBoolean(ckPermDesc.Name, ckPermDesc.Checked);
    _GravaConfiguracoesBoolean(ckClasse.Name, ckClasse.Checked);
    _GravaConfiguracoesBoolean(ckAlterarDescrCupom.Name, ckAlterarDescrCupom.Checked);
    _GravaConfiguracoesBoolean(ckAlterarVlCupom.Name, ckAlterarVlCupom.Checked);
    _GravaConfiguracoesBoolean(ckComissaoProduto.Name, ckComissaoProduto.Checked);
    _GravaConfiguracoesBoolean(ckComissaoGerente.Name, ckComissaoGerente.Checked);
    _GravaConfiguracoesBoolean(ckObsEtiq.Name, ckObsEtiq.Checked);
    _GravaConfiguracoesBoolean(ckAplicacaoRef.Name, ckAplicacaoRef.Checked);
    _GravaConfiguracoesBoolean(ckAloc1.Name, ckAloc1.Checked);
    _GravaConfiguracoesBoolean(ckAloc2.Name, ckAloc2.Checked);
    _GravaConfiguracoesBoolean(ckVendaOnline.Name, ckVendaOnline.Checked);
    _GravaConfiguracoesBoolean(ckLancDebCred.Name, ckLancDebCred.Checked);
    _GravaConfiguracoesBoolean(ckPercDebCredDev.Name, ckPercDebCredDev.Checked);
    _GravaConfiguracoesBoolean(ckComissaoFaixaDesconto.Name, ckComissaoFaixaDesconto.Checked);
    _GravaConfiguracoesBoolean(ckCashback.Name, ckCashback.Checked);
    FrmCadProdutos.Enabled := true;
    DBGrid1.Visible := true;
    Screen.Cursor := crDefault;
  end;
  PageControl1.ActivePage := tsAlterDadosProd;
  tsAlterDadosProd.Show;
end;

procedure TFrmCadProdutos.btSalvarSped0205Click(Sender: TObject);
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;
    gridSped0205.Visible := False;
    vProdAlt.Grupo := edGrupoSped0205.Text;
    vProdAlt.Codigo := edCodigoSped0205.Text;
    vProdAlt.Descricao := edDescricaoSped0205.Text;
    vProdAlt.DataIni := StrToDateDef(edDataIniSped0205.Text, 0);
    vProdAlt.DataFim := StrToDateDef(edDataFimSped0205.Text, 0);
    vProdAlt.TipoAlt := Copy(cbTipoAltSped0205.Text, 1, 1);
    vProdAlt.MesSped := edMesMovSped0205.Text;

    if vProdAlt.ID > 0 then
    begin
      if vProdAlt.alterarRegistro(Produto.buscas) then
        btCancelarSped0205.Click;
    end
    else if vProdAlt.incluirRegistro(Produto.buscas) then
      btCancelarSped0205.Click;

  finally
    vProdAlt.abreRegistros(
      Produto.dataSet.FieldByName('grupo_prod').AsInteger,
      Produto.dataSet.FieldByName('cod_prod').AsString, Produto.buscas);
    gridSped0205.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.btSelectAllEtiqClick(Sender: TObject);
begin
  SelecionartodosprodutosClick(Sender);
end;

procedure TFrmCadProdutos.btSelectAllEtiqEsterClick(Sender: TObject);
begin
  try
  	Screen.Cursor := crHourGlass;
		Produto.vEtEs._marcaTodosTemp(DBGrid17.DataSource.DataSet);
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.btSelectAllEtiqMarcadasClick(Sender: TObject);
begin
  SelecionartodosprodutosTempClick(Sender);
end;

procedure TFrmCadProdutos.btSelectAllEtiqterRapidaClick(Sender: TObject);
begin
  try
  	Screen.Cursor := crHourGlass;
		Produto.vEtiTer._marcaTodosTemp(DBGrid19.DataSource.DataSet);
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.btSelectAllGradeClick(Sender: TObject);
begin
  Produto.vGradeEst.vGrade._marcarTodos;
end;

procedure TFrmCadProdutos.btSelectAllInsumoClick(Sender: TObject);
begin
  try
    if DBGrid22.DataSource.DataSet.IsEmpty then
      Exit;

    DBGrid22.DataSource.DataSet.First;
    while not DBGrid22.DataSource.DataSet.Eof do
    begin
      DBGrid22.DataSource.DataSet.Edit;
      DBGrid22.DataSource.DataSet.FieldByName('SEL').AsString := 'S';
      DBGrid22.DataSource.DataSet.Post;

      DBGrid22.DataSource.DataSet.Next;
    end;
  finally
  	DBGrid22.DataSource.DataSet.First;
  end;
end;

procedure TFrmCadProdutos.btUnidadeClick(Sender: TObject);
var
	MenuItem, MenuItem2: TMenuItem;
  I: Integer;
begin
  inherited;
  if     (Produto.dataSet.State = dsInsert)
      or (Produto.AlterarGrupo)
  	  or ((Produto.dataSet.State = dsEdit)
      			and (not StartsText(vDadosIni.vEmp.vRegime, 'SIMPLES'))
      			and (Produto.produtoMovimentado)
      			and (Produto.dataSet.FieldByName('INF_UNIDADE').AsString = 'S'))
      or ((Produto.dataSet.State = dsEdit)
      			and (Produto.cadastroSimplificado)
          	and (DBComboBox24.Enabled))
      or ((Produto.dataSet.State = dsEdit)
      			and (not Produto.cadastroSimplificado)
          	and (DBComboBox23.Enabled)) then
  begin
    if Assigned(pop_menu_unidade2) then
    	FreeAndNil(pop_menu_unidade2);
      
    pop_menu_unidade2 := TPopupMenu.Create(Self);

    MenuItem2 := TMenuItem.Create(pop_menu_unidade2);
    MenuItem2.Caption := 'Nova unidade - [PRO447]';
    MenuItem2.OnClick := unidade_add;
    pop_menu_unidade2.Items.Add(MenuItem2);

    MenuItem2 := TMenuItem.Create(pop_menu_unidade2);
    MenuItem2.Caption := 'Alterar unidade - [PRO448]';
    MenuItem2.OnClick := unidade_edit;
    pop_menu_unidade2.Items.Add(MenuItem2);

    MenuItem2 := TMenuItem.Create(pop_menu_unidade2);
    MenuItem2.Caption := 'Excluir unidade - [PRO449]';
    MenuItem2.OnClick := unidade_del;
    pop_menu_unidade2.Items.Add(MenuItem2);

    pop_menu_unidade2.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  end
  else
  begin
    if Assigned(pop_menu_unidade) then
    	FreeAndNil(pop_menu_unidade);

    pop_menu_unidade := TPopupMenu.Create(Self);

    MenuItem := TMenuItem.Create(pop_menu_unidade);
    MenuItem.Caption := 'Alterar unidade do produto - [PRO446]';
    MenuItem.OnClick := produto_edit_unidade;
    pop_menu_unidade.Items.Add(MenuItem);

    MenuItem := TMenuItem.Create(pop_menu_unidade);
    MenuItem.Caption := 'Nova unidade - [PRO447]';
    MenuItem.OnClick := unidade_add;
    pop_menu_unidade.Items.Add(MenuItem);

    MenuItem := TMenuItem.Create(pop_menu_unidade);
    MenuItem.Caption := 'Alterar unidade - [PRO448]';
    MenuItem.OnClick := unidade_edit;
    pop_menu_unidade.Items.Add(MenuItem);

    MenuItem := TMenuItem.Create(pop_menu_unidade);
    MenuItem.Caption := 'Excluir unidade - [PRO449]';
    MenuItem.OnClick := unidade_del;
    pop_menu_unidade.Items.Add(MenuItem);
  
    pop_menu_unidade.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  end;
end;

procedure TFrmCadProdutos.btUnidadeConversaoClick(Sender: TObject);
var
	MenuItem, MenuItem2: TMenuItem;
  I: Integer;
begin
  inherited;
	if Assigned(pop_menu_unidade2) then
  	FreeAndNil(pop_menu_unidade2);
    
  pop_menu_unidade2 := TPopupMenu.Create(Self);

  MenuItem2 := TMenuItem.Create(pop_menu_unidade2);
  MenuItem2.Caption := 'Nova unidade - [PRO447]';
  MenuItem2.OnClick := unidade_add_conversao;
  pop_menu_unidade2.Items.Add(MenuItem2);

  MenuItem2 := TMenuItem.Create(pop_menu_unidade2);
  MenuItem2.Caption := 'Alterar unidade - [PRO448]';
  MenuItem2.OnClick := unidade_edit_conversao;
  pop_menu_unidade2.Items.Add(MenuItem2);

  MenuItem2 := TMenuItem.Create(pop_menu_unidade2);
  MenuItem2.Caption := 'Excluir remover - [PRO449]';
  MenuItem2.OnClick := unidade_del_conversao;
  pop_menu_unidade2.Items.Add(MenuItem2);

  pop_menu_unidade2.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFrmCadProdutos.btUnSelectAllEtiqClick(Sender: TObject);
begin
  Desmarcatodosprodutos1Click(Sender);
end;

procedure TFrmCadProdutos.btUnSelectAllEtiqEsterClick(Sender: TObject);
begin
  try
  	Screen.Cursor := crHourGlass;
		Produto.vEtEs._desmarcarTodosTemp(DBGrid17.DataSource.DataSet);
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.btUnSelectAllEtiqMarcadasClick(Sender: TObject);
begin
  DesmarcatodosprodutosTempClick(Sender);
end;

procedure TFrmCadProdutos.btUnSelectAllEtiqTerRapidaClick(Sender: TObject);
begin
  try
  	Screen.Cursor := crHourGlass;
		Produto.vEtiTer._desmarcarTodosTemp(DBGrid19.DataSource.DataSet);
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.btUnSelectAllGradeClick(Sender: TObject);
begin
  Produto.vGradeEst.vGrade._desmarcarTodos;
end;

procedure TFrmCadProdutos.btUnSelectAllInsumoClick(Sender: TObject);
begin
  try
    if DBGrid22.DataSource.DataSet.IsEmpty then
      Exit;

    DBGrid22.DataSource.DataSet.First;
    while not DBGrid22.DataSource.DataSet.Eof do
    begin
      DBGrid22.DataSource.DataSet.Edit;
      DBGrid22.DataSource.DataSet.FieldByName('SEL').AsString := '';
      DBGrid22.DataSource.DataSet.Post;

    	DBGrid22.DataSource.DataSet.Next;
    end;
  finally
    DBGrid22.DataSource.DataSet.First;
  end;
end;

procedure TFrmCadProdutos.bt_alt_est_maxClick(Sender: TObject);
begin
  inherited;
  with Produto do
    if not vDadosIni.PesqPros('PRO334', 'HABILITAR',
                              Format('%d-%s/%s Ant:%0.3f',
                                     [fint('grupo_prod'), fstr('cod_prod'), fstr('num_fab_prod'), ffloat('n_max_prod')]),
                              'PRODUTOS', fstr('grupo_prod') + '-' + fstr('cod_prod'), buscas) then
      Exit;

  DBEdit21.Enabled := True;
  DBEdit175.Enabled := True;
  Label21.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBEdit21.CanFocus) then
    DBEdit21.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit175.CanFocus) then
    DBEdit175.SetFocus;
end;

procedure TFrmCadProdutos.bt_alt_est_minClick(Sender: TObject);
begin
  inherited;
  with Produto do
    if not vDadosIni.PesqPros('PRO333', 'HABILITAR',
                              Format('%d-%s/%s Ant:%0.3f',
                                     [fint('grupo_prod'), fstr('cod_prod'), fstr('num_fab_prod'), ffloat('n_min_prod')]),
                              'PRODUTOS', fstr('grupo_prod') + '-' + fstr('cod_prod'), buscas) then
      Exit;

  DBEdit20.Enabled := True;
  DBEdit174.Enabled := True;
  Label20.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBEdit20.CanFocus) then
    DBEdit20.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit174.CanFocus) then
    DBEdit174.SetFocus;
end;

procedure TFrmCadProdutos.Button1Click(Sender: TObject);
begin
  inherited;
  Produto.vPromocaoProduto._abrePromocaoProdutos(Produto.vPromocaoProduto.dataSet.FieldByName('GRUPO_PROD').AsString,
    Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROD').AsString,
    Produto.vPromocaoProduto.dataSet.FieldByName('COD_TPPRECO').AsString, '', '');
end;

procedure TFrmCadProdutos.Button2Click(Sender: TObject);
begin
  inherited;
  Produto.vPromocaoProduto.Close;
  Produto.vPromocaoProduto.Open;
  Produto.vPromocaoProduto.dataSet.EmptyDataSet;
end;

procedure TFrmCadProdutos.CadastroMateriasPrimasCancelClick(Sender: TObject);
begin
	if Application.MessageBox(PChar('Deseja encerrar os vínculos das grades do Produto Acabado e Matérias Primas/Insumos/Embalagens?' + #13 + #13 +
  	'Caso informe sim a produção automática pode não ser gerada para as grades do Produto Acabado e Matérias Primas/Insumos/Embalagens.'),
    'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> mrYES then
    	exit;
      
  TForm(pnCadastroMateriasPrimas.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.carregarwebbrownser(pWebBrowser: TWebBrowser; pHtml: string);
var
  vhtml: string;
  ADoccument: Variant;
begin
   DBComboBoxSincEC.ItemIndex := vDadosIni.IfThen(
   	 Produto.vProdutosEC.dataSet.FieldByName('SINC_ECOMMERCE').AsString = 'S', 0, 1);
   DBComboBoxDispEC.ItemIndex := vDadosIni.IfThen(
   	 Produto.vProdutosEC.dataSet.FieldByName('DISPONIVEL').AsString = 'S', 0, 1);
   DBComboBoxPrecoCombinarEC.ItemIndex := vDadosIni.IfThen(
   	 Produto.vProdutosEC.dataSet.FieldByName('PRECO_A_COMBINAR_EC').AsString = 'S', 0, 1);
   DBComboBoxPromoEC.ItemIndex := vDadosIni.IfThen(
   	 Produto.vProdutosEC.dataSet.FieldByName('PROMOCIONAL').AsString = 'S', 0, 1);
   DBComboBoxFreteGratisEC.ItemIndex := vDadosIni.IfThen(
   	 Produto.vProdutosEC.dataSet.FieldByName('FRETE_GRATIS').AsString = 'S', 0, 1);
   DBComboBoxLancEC.ItemIndex := vDadosIni.IfThen(
   	 Produto.vProdutosEC.dataSet.FieldByName('LANCAMENTO').AsString = 'S', 0, 1);
   DBComboBoxTermAceiteEC.ItemIndex := vDadosIni.IfThen(
   	 Produto.vProdutosEC.dataSet.FieldByName('TERMOS_ACEITE').AsString = 'S', 0, 1);
   DBComboBoxCompreJuntoEC.ItemIndex := vDadosIni.IfThen(
   	 Produto.vProdutosEC.dataSet.FieldByName('COMPREJUNTO').AsString = 'S', 0, 1);
   DBComboBoxVirtualEC.ItemIndex := vDadosIni.IfThen(
   	 Produto.vProdutosEC.dataSet.FieldByName('VIRTUAL').AsString = 'S', 0, 1);
   DBComboBoxDestaqueEC.ItemIndex := vDadosIni.IfThen(
   	 Produto.vProdutosEC.dataSet.FieldByName('DESTAQUE').AsString = 'S', 0, 1);

   DBComboBoxEnvCA.ItemIndex := vDadosIni.IfThen(
   	 Produto.vProdutosEC.dataSet.FieldByName('ENV_COMERCIO_ABERTO').AsString = 'S', 0, 1);
   DBComboBoxPrecoCombinarCA.ItemIndex := vDadosIni.IfThen(
   	 Produto.vProdutosEC.dataSet.FieldByName('PRECO_A_COMBINAR_CA').AsString = 'S', 0, 1);

   DocumentoEmBranco(pWebBrowser);
   (pWebBrowser.Document as IHTMLDocument2).designMode := 'Off';
//     (pWebBrowser.Document as IHTMLDocument2).designMode := 'On';
   vhtml := '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">' +
     '<HTML><HEAD>' +
     '<META http-equiv=Content-Type content="text/html; charset=unicode">' +
     '<META content="MSHTML 6.00.2900.5512" name=GENERATOR></HEAD>' +
     '<BODY>' + pHtml +
     '</BODY></HTML>';
   ADoccument := pWebBrowser.Document;
   ADoccument.Clear;
   ADoccument.Write(vhtml);
   ADoccument.Close;
end;

procedure TFrmCadProdutos.cbGrupoOrdemKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TFrmCadProdutos.cbOrdemKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
	if not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure TFrmCadProdutos.cbxComEstClick(Sender: TObject);
begin
  inherited;
  if ((not cbxComEst.Checked) and (not cbxSemEst.Checked)) then
    cbxSemEst.Checked := true;
end;

procedure TFrmCadProdutos.cbxSemEstClick(Sender: TObject);
begin
  inherited;
 if ((not cbxComEst.Checked) and (not cbxSemEst.Checked)) then
    cbxComEst.Checked := true;
end;

procedure TFrmCadProdutos.CestChangecompativel(Sender: TObject);
var
  Cests: TCestsM;
  Client: TDataSet_OOP;
  I, J: Integer;
begin
  if not (Sender is TCestsM) then
    Exit;

  Cests := TCestsM(Sender);

  Client :=  TDataSet_OOP.Create(Produto.buscas.Database);
  try
    Client.dataSet.FieldDefs.Add('Cest'     , ftString, 7);
    Client.dataSet.FieldDefs.Add('NCM'      , ftString, 8);
    Client.dataSet.FieldDefs.Add('Ambito'   , ftInteger);
    Client.dataSet.FieldDefs.Add('Descricao', ftString, 512);
    Client.dataSet.CreateDataSet;
    Client.dataSet.FieldByName('Cest').EditMask := '00.000.0;0;_';

    for I := 0 to Cests.Count - 1 do
      for J := 0 to Cests.Items[I].NCMs.Count - 1 do
      begin
        Cests.Items[I].CopyTo(Client.dataSet, False, False, True, False);
        Cests.Items[I].NCMs.Items[J].CopyTo(Client.dataSet, True, False, False, False);
      end;
    form_modal_configure([bt_modal_assume, bt_modal_cancel, pn_modal_top], 'CESTs x NCM');

    grid_modal.DataSource := Client._dataSourceOOP;
    Client.dataSet.First;
    if vDadosIni.abreForm('Selecione o CEST correto para o produto', pn_modal, opFormsDefault) then
      Produto.dataSet.FieldByName('CEST').AsString := Client.fstr('cest');
  finally
    grid_modal.DataSource := nil;
    FreeAndNil(Client);
  end;
end;

procedure TFrmCadProdutos.ckPerc30Click(Sender: TObject);
begin
  inherited;
	edPerc30.Enabled := ckPerc30.Checked;
  if ckPerc30.Checked then
  begin
  	pnPerc30.ParentBackground := False;
		pnPerc30.Color := clYellow;
  end
  else
  begin
  	pnPerc30.ParentBackground := True;
  	pnPerc30.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdPerc30.CanFocus) then
  	EdPerc30.SetFocus;
end;

procedure TFrmCadProdutos.ckPerc60Click(Sender: TObject);
begin
  inherited;
	EdPerc60.Enabled := ckPerc60.Checked;
  if ckPerc60.Checked then
  begin
  	pnPerc60.ParentBackground := False;
		pnPerc60.Color := clYellow;
  end
  else
  begin
  	pnPerc60.ParentBackground := True;
  	pnPerc60.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdPerc60.CanFocus) then
  	EdPerc60.SetFocus;
end;

procedure TFrmCadProdutos.ckPerc90Click(Sender: TObject);
begin
  inherited;
	EdPerc90.Enabled := ckPerc90.Checked;
  if ckPerc90.Checked then
  begin
  	pnPerc90.ParentBackground := False;
		pnPerc90.Color := clYellow;
  end
  else
  begin
  	pnPerc90.ParentBackground := True;
  	pnPerc90.Color := clBtnFace;
  end;
  
  if (Self.Enabled) and (Self.Visible) and (EdPerc90.CanFocus) then
  	EdPerc90.SetFocus;
end;

procedure TFrmCadProdutos.ckPercAtacClick(Sender: TObject);
begin
  inherited;
	EdPercAtac.Enabled := ckPercAtac.Checked;
  if ckPercAtac.Checked then
  begin
  	pnPercAtac.ParentBackground := False;
		pnPercAtac.Color := clYellow;
  end
  else
  begin
  	pnPercAtac.ParentBackground := True;
  	pnPercAtac.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdPercAtac.CanFocus) then
  	EdPercAtac.SetFocus;
end;

procedure TFrmCadProdutos.ckPercDebCredDevClick(Sender: TObject);
begin
  inherited;
	EdPercDebCredDev.Enabled := ckPercDebCredDev.Checked;
  if ckPercDebCredDev.Checked then
  begin
  	pnPercDebCredDev.ParentBackground := False;
		pnPercDebCredDev.Color := clYellow;
  end
  else
  begin
  	pnPercDebCredDev.ParentBackground := True;
  	pnPercDebCredDev.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdPercDebCredDev.CanFocus) then
  	EdPercDebCredDev.SetFocus;
end;

procedure TFrmCadProdutos.ckPercMargemMinAtacadoClick(Sender: TObject);
begin
  inherited;
  EdPercMargemMinAtacado.Enabled := ckPercMargemMinAtacado.Checked;
  if ckPercMargemMinAtacado.Checked then
  begin
  	pnPercMargemMinAtacado.ParentBackground := False;
		pnPercMargemMinAtacado.Color := clYellow;
  end
  else
  begin
  	pnPercMargemMinAtacado.ParentBackground := True;
  	pnPercMargemMinAtacado.Color := clBtnFace;
  end;
  
  if (Self.Enabled) and (Self.Visible) and (EdPercMargemMinAtacado.CanFocus) then
  	EdPercMargemMinAtacado.SetFocus;
end;

procedure TFrmCadProdutos.ckPercMargemMinVarejoClick(Sender: TObject);
begin
  inherited;
	EdPercMargemMinVarejo.Enabled := ckPercMargemMinVarejo.Checked;
  if ckPercMargemMinVarejo.Checked then
  begin
  	pnPercMargemMinVarejo.ParentBackground := False;
		pnPercMargemMinVarejo.Color := clYellow;
  end
  else
  begin
  	pnPercMargemMinVarejo.ParentBackground := True;
  	pnPercMargemMinVarejo.Color := clBtnFace;
  end;
  
  if (Self.Enabled) and (Self.Visible) and (EdPercMargemMinVarejo.CanFocus) then
  	EdPercMargemMinVarejo.SetFocus;
end;

procedure TFrmCadProdutos.ckPercReducaoClick(Sender: TObject);
begin
  inherited;
	EdPercReducao.Enabled :=	ckPercReducao.Checked;
  if ckPercReducao.Checked then
  begin
  	pnPercReducao.ParentBackground := False;
		pnPercReducao.Color := clYellow;
  end
  else
  begin
  	pnPercReducao.ParentBackground := True;
  	pnPercReducao.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdPercReducao.CanFocus) then
  	EdPercReducao.SetFocus;
end;

procedure TFrmCadProdutos.CheckBox18Click(Sender: TObject);
begin
  inherited;
  if ((PageControl1.ActivePage = TabSheet2)
  	or (PageControl1.ActivePage = tsDefinirPromocoes)
  	or (PageControl1.ActivePage = tsDefinirPrecoDiferenciado)
    or (PageControl1.ActivePage = tsAlterDadosProd)) then
  begin
    if CheckBox18.Checked then
    begin
      GroupBox62.visible := true;
      if ((not CheckBox3.Checked) and (not (CheckBox1.Checked))) then
      begin
        Panel16.Height := 209;
        Panel32.Height := 209;
        Panel52.Height := 209;
        GroupBox11.Height := 209;
        GroupBox12.Height := 209;
        GroupBox62.Height := 209;
        
        GroupBox3.Height := 209;
      end;
    end
    else
    begin
      GroupBox62.visible := false;
      if ((not CheckBox1.Checked) and (not CheckBox3.Checked) and (not (CheckBox1.Checked))) then
      begin
        Panel16.Height := 73;
        Panel32.Height := 73;
        Panel52.Height := 73;
        GroupBox11.Height := 73;
        GroupBox12.Height := 73;
        GroupBox62.Height := 73;

        GroupBox3.Height := 73;
      end;
    end;
    exit;
  end;

  if CheckBox18.Checked then
  begin
    GroupBox62.visible := true;
    if ((not CheckBox3.Checked) and (not (CheckBox1.Checked))) then
      GroupBox3.Height := 201
        //  if ComboBox11.Items.Count = 0 then
//    begin
//      ComboBox11.Items := ComboBox1.Items;
//     ComboBox11.ItemIndex := 0;
//    end;
  end
  else
  begin
    GroupBox62.visible := false;
    if ((not CheckBox3.Checked) and (not (CheckBox1.Checked))) then
      GroupBox3.Height := 73;
    //    ComboBox11.Items.Clear;
  end;
end;

procedure TFrmCadProdutos.CheckBox19Click(Sender: TObject);
begin
  inherited;

   MaskEdit23.Enabled := CheckBox19.Checked;
   MaskEdit24.Enabled := CheckBox19.Checked;
   MaskEdit25.Enabled := CheckBox19.Checked;
   MaskEdit26.Enabled := CheckBox19.Checked;

   if not CheckBox19.Checked then
     produto.vPromocao._abreUnicaPromocao(DBLookupComboBox6.Field.AsInteger);

   if CheckBox19.Checked then
   begin
    if (Self.Enabled) and (Self.Visible) and (MaskEdit23.CanFocus) then
      MaskEdit23.SetFocus;
   end;
end;

procedure TFrmCadProdutos.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if ((PageControl1.ActivePage = TabSheet2)
  	or (PageControl1.ActivePage = tsDefinirPromocoes)
  	or (PageControl1.ActivePage = tsDefinirPrecoDiferenciado)
    or (PageControl1.ActivePage = tsAlterDadosProd)) then
  begin
    if CheckBox1.Checked then
    begin
    	GroupBox12.visible := true;

      Panel16.Height := 209;
      Panel32.Height := 209;
      Panel52.Height := 209;
      GroupBox11.Height := 209;
      GroupBox12.Height := 209;
      GroupBox62.Height := 209;

      if ComboBox11.Items.Count = 0 then
      begin
        ComboBox11.Items := ComboBox1.Items;
        ComboBox11.ItemIndex := 0;
      end;

      GroupBox3.Height := 209;
    end
    else
    begin
    	GroupBox12.visible := false;
      if ((not CheckBox1.Checked) and (not CheckBox3.Checked) and (not CheckBox18.Checked)) then
      begin
        Panel16.Height := 73;
        Panel32.Height := 73;
        Panel52.Height := 73;
        GroupBox11.Height := 73;
        GroupBox12.Height := 73;
        GroupBox62.Height := 73;

        GroupBox3.Height := 73;
      end;
    end;

    if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
      ComboBox11.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
      BitBtn1.SetFocus;
    exit;
  end;

  if CheckBox1.Checked then
  begin
    GroupBox12.visible := true;
    if ComboBox11.Items.Count = 0 then
    begin
      ComboBox11.Items := ComboBox1.Items;
      ComboBox11.ItemIndex := 0;
    end;
  end
  else
  begin
    GroupBox12.visible := false;
    //    ComboBox11.Items.Clear;
  end;
end;

procedure TFrmCadProdutos.ckPercTabClick(Sender: TObject);
begin
  inherited;
	EdPercTab.Enabled := ckPercTab.Checked;
  if ckPercTab.Checked then
  begin
  	pnPercTab.ParentBackground := False;
		pnPercTab.Color := clYellow;
  end
  else
  begin
  	pnPercTab.ParentBackground := True;
  	pnPercTab.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdPercTab.CanFocus) then
  	EdPercTab.SetFocus;
end;

procedure TFrmCadProdutos.ckPerfilClick(Sender: TObject);
begin
  inherited;
  EdCodPerfilProd.Enabled := ckPerfil.Checked;
  EdPerfilProd.Enabled := ckPerfil.Checked;
  SpeedBPerfil.Enabled := ckPerfil.Checked;
  if ckPerfil.Checked then
  begin
  	pnPerfil.ParentBackground := False;
		pnPerfil.Color := clYellow;
  end
  else
  begin
  	pnPerfil.ParentBackground := True;
  	pnPerfil.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdCodPerfilProd.CanFocus) then
  	EdCodPerfilProd.SetFocus;
end;

procedure TFrmCadProdutos.ckPermDescClick(Sender: TObject);
begin
  inherited;
	cbPermDesc.Enabled := ckPermDesc.Checked;
  if ckPermDesc.Checked then
  begin
  	pnPermDesc.ParentBackground := False;
		pnPermDesc.Color := clYellow;
  end
  else
  begin
  	pnPermDesc.ParentBackground := True;
  	pnPermDesc.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbPermDesc.CanFocus) then
  	cbPermDesc.SetFocus;
end;

procedure TFrmCadProdutos.ckPermOpcaoMarcadasClick(Sender: TObject);
begin
  inherited;
  _GravaConfiguracoesBoolean(ckPermOpcaoMarcadas.Name, ckPermOpcaoMarcadas.Checked);
end;

procedure TFrmCadProdutos.ckPrecoDifClick(Sender: TObject);
begin
  inherited;
  if ckPrecoDif.Checked then
    GroupBox73.Visible := true
  else
    GroupBox73.Visible := false;
end;

procedure TFrmCadProdutos.ckPromocaoClick(Sender: TObject);
begin
  inherited;
  if ckPromocao.Checked then
    GroupBox74.Visible := true
  else
    GroupBox74.Visible := false;
end;

procedure TFrmCadProdutos.CheckBox3Click(Sender: TObject);
begin
  inherited;
  if ((PageControl1.ActivePage = TabSheet2)
  	or (PageControl1.ActivePage = tsDefinirPromocoes)
  	or (PageControl1.ActivePage = tsDefinirPrecoDiferenciado)
    or (PageControl1.ActivePage = tsAlterDadosProd)) then
  begin
    if CheckBox3.Checked then
    begin
      GroupBox11.Visible := true;
      if ((not CheckBox18.Checked) and (not CheckBox1.Checked)) then
      begin
        Panel16.Height := 209;
        Panel32.Height := 209;
        Panel52.Height := 209;
        GroupBox11.Height := 209;
        GroupBox12.Height := 209;
        GroupBox62.Height := 209;

        GroupBox3.Height := 209;
      end;
    end
    else
    begin
      GroupBox11.visible := false;
      if ((not CheckBox1.Checked) and (not CheckBox18.Checked) and (not CheckBox1.Checked)) then
      begin
        Panel16.Height := 73;
        Panel32.Height := 73;
        Panel52.Height := 73;
        GroupBox11.Height := 73;
        GroupBox12.Height := 73;
        GroupBox62.Height := 73;
        
        GroupBox3.Height := 73;
      end;
    end;
    exit;
  end;
  if CheckBox3.Checked then
  begin
    GroupBox11.visible := true;
  end
  else
  begin
    GroupBox11.visible := false;
  end;
end;

procedure TFrmCadProdutos.CheckCadSeq_Click(Sender: TObject);
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

procedure TFrmCadProdutos.ckPercAjustePrec30Click(Sender: TObject);
begin
  inherited;
	EdPercAjustePrec30.Enabled := ckPercAjustePrec30.Checked;
  if ckPercAjustePrec30.Checked then
  begin
  	pnPercAjustePrec30.ParentBackground := False;
		pnPercAjustePrec30.Color := clYellow;
  end
  else
  begin
  	pnPercAjustePrec30.ParentBackground := True;
  	pnPercAjustePrec30.Color := clBtnFace;
  end;
  
  if (Self.Enabled) and (Self.Visible) and (EdPercAjustePrec30.CanFocus) then
  	EdPercAjustePrec30.SetFocus;
end;

procedure TFrmCadProdutos.ckPercAjustePrec90Click(Sender: TObject);
begin
  inherited;
  EdPercAjustePrec90.Enabled := ckPercAjustePrec90.Checked;
  if ckPercAjustePrec90.Checked then
  begin
  	pnPercAjustePrec90.ParentBackground := False;
		pnPercAjustePrec90.Color := clYellow;
  end
  else
  begin
  	pnPercAjustePrec90.ParentBackground := True;
  	pnPercAjustePrec90.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdPercAjustePrec90.CanFocus) then
  	EdPercAjustePrec90.SetFocus;
end;

procedure TFrmCadProdutos.ckAliqCredPisCofinsClick(Sender: TObject);
begin
  inherited;
	EdAliqCredPis.Enabled := ckAliqCredPisCofins.Checked;
  EdAliqCredCofins.Enabled := ckAliqCredPisCofins.Checked;
  if ckAliqCredPisCofins.Checked then
  begin
  	pnAliqCredPisCofins.ParentBackground := False;
		pnAliqCredPisCofins.Color := clYellow;
  end
  else
  begin
  	pnAliqCredPisCofins.ParentBackground := True;
  	pnAliqCredPisCofins.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdAliqCredPis.CanFocus) then
  	EdAliqCredPis.SetFocus;
end;

procedure TFrmCadProdutos.ckAliqICMSClick(Sender: TObject);
begin
  inherited;
  EdAliqICMS.Enabled :=	ckAliqICMS.Checked;
  if ckAliqICMS.Checked then
  begin
  	pnAliqICMS.ParentBackground := False;
		pnAliqICMS.Color := clYellow;
  end
  else
  begin
  	pnAliqICMS.ParentBackground := True;
  	pnAliqICMS.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdAliqICMS.CanFocus) then
  	EdAliqICMS.SetFocus;
end;

procedure TFrmCadProdutos.ckAliqIPIClick(Sender: TObject);
begin
  inherited;
	EdAliqIPI.Enabled := ckAliqIPI.Checked;
  if ckAliqIPI.Checked then
  begin
  	pnIPIAliq.ParentBackground := False;
		pnIPIAliq.Color := clYellow;
  end
  else
  begin
  	pnIPIAliq.ParentBackground := True;
  	pnIPIAliq.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdAliqIPI.CanFocus) then
  	EdAliqIPI.SetFocus;
end;

procedure TFrmCadProdutos.ckAliqPisCofinsDifClick(Sender: TObject);
begin
  inherited;
	EdAliqPisDif.Enabled := ckAliqPisCofinsDif.Checked;
  EdAliqCofinsDif.Enabled := ckAliqPisCofinsDif.Checked;
  if ckAliqPisCofinsDif.Checked then
  begin
  	pnAliqPisCofinsDif.ParentBackground := False;
		pnAliqPisCofinsDif.Color := clYellow;
  end
  else
  begin
  	pnAliqPisCofinsDif.ParentBackground := True;
  	pnAliqPisCofinsDif.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdAliqPisDif.CanFocus) then
  	EdAliqPisDif.SetFocus;
end;

procedure TFrmCadProdutos.ckAloc1Click(Sender: TObject);
begin
  inherited;
	MkAloc1.Enabled := ckAloc1.Checked;
  if ckAloc1.Checked then
  begin
   pnAloc1.ParentBackground := False;
	pnAloc1.Color := clYellow;
  end
  else
  begin
  	pnAloc1.ParentBackground := True;
  	pnAloc1.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (MkAloc1.CanFocus) then
  	MkAloc1.SetFocus;
end;

procedure TFrmCadProdutos.ckAloc2Click(Sender: TObject);
begin
  inherited;
  MkAloc2.Enabled := ckAloc2.Checked;
  if ckAloc2.Checked then
  begin
  	 pnAloc2.ParentBackground := False;
	 pnAloc2.Color := clYellow;
  end
  else
  begin
  	 pnAloc2.ParentBackground := True;
  	 pnAloc2.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (MkAloc2.CanFocus) then
  	MkAloc2.SetFocus;
end;

procedure TFrmCadProdutos.ckAlterarDescrCupomClick(Sender: TObject);
begin
  inherited;
	cbAlterarDescrCupom.Enabled := ckAlterarDescrCupom.Checked;
  if ckAlterarDescrCupom.Checked then
  begin
  	pnAlterarDescrCupom.ParentBackground := False;
		pnAlterarDescrCupom.Color := clYellow;
  end
  else
  begin
  	pnAlterarDescrCupom.ParentBackground := True;
  	pnAlterarDescrCupom.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbAlterarDescrCupom.CanFocus) then
  	cbAlterarDescrCupom.SetFocus;
end;

procedure TFrmCadProdutos.ckAlterarVlCupomClick(Sender: TObject);
begin
  inherited;
	cbAlterarVlCupom.Enabled := ckAlterarVlCupom.Checked;
  if ckAlterarVlCupom.Checked then
  begin
  	pnAlterarVlCupom.ParentBackground := False;
		pnAlterarVlCupom.Color := clYellow;
  end
  else
  begin
  	pnAlterarVlCupom.ParentBackground := True;
  	pnAlterarVlCupom.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbAlterarVlCupom.CanFocus) then
  	cbAlterarVlCupom.SetFocus;
end;

procedure TFrmCadProdutos.ckAlterouEstClick(Sender: TObject);
var
 vAlterouEst: boolean;
 vNAlteouEst: boolean;
begin
   try
//     vAlterouEst := ckAlterouEst.Checked;
//     vNAlteouEst := ckNAlterouEst.Checked;
//     pnFiltros.Visible := (vAlterouEst) or (vNAlteouEst);
//     if pnFiltros.Visible then
//     begin
//       GroupBox67.Height := 138;
//       Panel72.BevelOuter := bvLowered;
//     end
//     else
//     begin
//       GroupBox67.Height := 54;
//       Panel72.BevelOuter := bvNone;
//     end;
//     if ckAlterouEst.Checked then
//     begin
//       ckRequisicao.Checked := vAlterouEst;
//       ckOrdemServ.Checked := vAlterouEst;
//       ckNotas.Checked := vAlterouEst;
//       ckDevolucao.Checked := vAlterouEst;
//       ckProducao.Checked := vAlterouEst;
//       ckCorrecao.Checked := vAlterouEst;
//       ckBalD.Checked := vAlterouEst;
//       ckBalG.Checked := vAlterouEst;
//     end;
     if not aplicarFiltros then
       exit;
   finally

   end;
end;

procedure TFrmCadProdutos.ckAplicacaoRefClick(Sender: TObject);
begin
  inherited;
	EdAplicacaoRef.Enabled := ckAplicacaoRef.Checked;
  if ckAplicacaoRef.Checked then
  begin
  	pnAplicacaoRef.ParentBackground := False;
		pnAplicacaoRef.Color := clYellow;
  end
  else
  begin
  	pnAplicacaoRef.ParentBackground := True;
  	pnAplicacaoRef.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdAplicacaoRef.CanFocus) then
  	EdAplicacaoRef.SetFocus;
end;

procedure TFrmCadProdutos.ckCashbackClick(Sender: TObject);
begin
  inherited;
	EdPercComissaoCashback.Enabled := ckCashback.Checked;
  EdDiasVencCashback.Enabled := ckCashback.Checked;
  if ckCashback.Checked then
  begin
  	pnCashback.ParentBackground := False;
		pnCashback.Color := clYellow;
  end
  else
  begin
  	pnCashback.ParentBackground := True;
  	pnCashback.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdPercComissaoCashback.CanFocus) then
  	EdPercComissaoCashback.SetFocus;
end;

procedure TFrmCadProdutos.ckCESTClick(Sender: TObject);
begin
  inherited;
  EdCEST.Enabled := ckCEST.Checked;
  SpeedBCEST.Enabled := ckCEST.Checked;
  if ckCEST.Checked then
  begin
  	pnCEST.ParentBackground := False;
		pnCEST.Color := clYellow;
  end
  else
  begin
  	pnCEST.ParentBackground := True;
  	pnCEST.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdCEST.CanFocus) then
  	EdCEST.SetFocus;
end;

procedure TFrmCadProdutos.ckClasseClick(Sender: TObject);
begin
  inherited;
	cbClasse.Enabled := ckClasse.Checked;
  if ckClasse.Checked then
  begin
  	pnClasse.ParentBackground := False;
		pnClasse.Color := clYellow;
  end
  else
  begin
  	pnClasse.ParentBackground := True;
  	pnClasse.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbClasse.CanFocus) then
  	cbClasse.SetFocus;
end;

procedure TFrmCadProdutos.ckCodEnqIPIClick(Sender: TObject);
begin
  inherited;
	EdCodEnqIPI.Enabled := ckCodEnqIPI.Checked;
  if ckCodEnqIPI.Checked then
  begin
  	pnIPICodEnq.ParentBackground := False;
		pnIPICodEnq.Color := clYellow;
  end
  else
  begin
  	pnIPICodEnq.ParentBackground := True;
  	pnIPICodEnq.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdCodEnqIPI.CanFocus) then
  	EdCodEnqIPI.SetFocus;
end;

procedure TFrmCadProdutos.ckComissaoFaixaDescontoClick(Sender: TObject);
begin
  inherited;
	EdComissaoFaixaDesc.Enabled := ckComissaoFaixaDesconto.Checked;
  DBLComissaoFaixaDesc.Enabled := ckComissaoFaixaDesconto.Checked;
  if ckComissaoFaixaDesconto.Checked then
  begin
  	pnComissaoFaixaDesconto.ParentBackground := False;
		pnComissaoFaixaDesconto.Color := clYellow;
  end
  else
  begin
  	pnComissaoFaixaDesconto.ParentBackground := True;
  	pnComissaoFaixaDesconto.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdComissaoFaixaDesc.CanFocus) then
  	EdComissaoFaixaDesc.SetFocus;
end;

procedure TFrmCadProdutos.ckComissaoGerenteClick(Sender: TObject);
begin
  inherited;
	EdComissaoGerente.Enabled := ckComissaoGerente.Checked;
  if ckComissaoGerente.Checked then
  begin
  	pnComissaoGerente.ParentBackground := False;
		pnComissaoGerente.Color := clYellow;
  end
  else
  begin
  	pnComissaoGerente.ParentBackground := True;
  	pnComissaoGerente.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdComissaoGerente.CanFocus) then
  	EdComissaoGerente.SetFocus;
end;

procedure TFrmCadProdutos.ckComissaoProdutoClick(Sender: TObject);
begin
  inherited;
	EdComissaoProduto.Enabled := ckComissaoProduto.Checked;
  if ckComissaoProduto.Checked then
  begin
  	pnComissaoProduto.ParentBackground := False;
		pnComissaoProduto.Color := clYellow;
  end
  else
  begin
  	pnComissaoProduto.ParentBackground := True;
  	pnComissaoProduto.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdComissaoProduto.CanFocus) then
  	EdComissaoProduto.SetFocus;
end;

procedure TFrmCadProdutos.ckConsumoClick(Sender: TObject);
begin
  inherited;
	cbConsumo.Enabled := ckConsumo.Checked;
  if ckConsumo.Checked then
  begin
  	pnConsumo.ParentBackground := False;
		pnConsumo.Color := clYellow;
  end
  else
  begin
  	pnConsumo.ParentBackground := True;
  	pnConsumo.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbConsumo.CanFocus) then
  	cbConsumo.SetFocus;
end;

procedure TFrmCadProdutos.ckCSONClick(Sender: TObject);
begin
  inherited;
  EdCodCSOSN.Enabled :=	ckCSON.Checked;
  if ckCSON.Checked then
  begin
  	pnCSON.ParentBackground := False;
		pnCSON.Color := clYellow;
  end
  else
  begin
  	pnCSON.ParentBackground := True;
  	pnCSON.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdCodCSOSN.CanFocus) then
  	EdCodCSOSN.SetFocus;
end;

procedure TFrmCadProdutos.ckCSTClick(Sender: TObject);
begin
  inherited;
  EdCodCST.Enabled := ckCST.Checked;
  if ckCST.Checked then
  begin
  	pnCST.ParentBackground := False;
		pnCST.Color := clYellow;
  end
  else
  begin
  	pnCST.ParentBackground := True;
  	pnCST.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdCodCST.CanFocus) then
  	EdCodCST.SetFocus;
end;

procedure TFrmCadProdutos.ckCstIPIClick(Sender: TObject);
begin
  inherited;
  EdCSTIPI.Enabled := ckCstIPI.Checked;
  if ckCstIPI.Checked then
  begin
  	pnIPICst.ParentBackground := False;
		pnIPICst.Color := clYellow;
  end
  else
  begin
  	pnIPICst.ParentBackground := True;
  	pnIPICst.Color := clBtnFace;
  end;
  
  if (Self.Enabled) and (Self.Visible) and (EdCSTIPI.CanFocus) then
  	EdCSTIPI.SetFocus;
end;

procedure TFrmCadProdutos.ckCSTPisCofinsEClick(Sender: TObject);
begin
  inherited;
  EdCSTPisCofinsEntrada.Enabled := ckCSTPisCofinsE.Checked;
  if ckCSTPisCofinsE.Checked then
  begin
  	pnCSTPisCofinsE.ParentBackground := False;
		pnCSTPisCofinsE.Color := clYellow;
  end
  else
  begin
  	pnCSTPisCofinsE.ParentBackground := True;
  	pnCSTPisCofinsE.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdCSTPisCofinsEntrada.CanFocus) then
  	EdCSTPisCofinsEntrada.SetFocus;
end;

procedure TFrmCadProdutos.ckCSTPisCofinsSClick(Sender: TObject);
begin
  inherited;
	EdCSTPisCofinsSaida.Enabled := ckCSTPisCofinsS.Checked;
  if ckCSTPisCofinsS.Checked then
  begin
  	pnCSTPisCofinsS.ParentBackground := False;
		pnCSTPisCofinsS.Color := clYellow;
  end
  else
  begin
  	pnCSTPisCofinsS.ParentBackground := True;
  	pnCSTPisCofinsS.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdCSTPisCofinsSaida.CanFocus) then
  	EdCSTPisCofinsSaida.SetFocus;
end;

procedure TFrmCadProdutos.ckLancDebCredClick(Sender: TObject);
begin
  inherited;
  cbLancDebCred.Enabled := ckLancDebCred.Checked;
  if ckLancDebCred.Checked then
  begin
  	 pnLancDebCred.ParentBackground := False;
	 pnLancDebCred.Color := clYellow;
  end
  else
  begin
  	 pnLancDebCred.ParentBackground := True;
  	 pnLancDebCred.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbLancDebCred.CanFocus) then
  	cbLancDebCred.SetFocus;
end;

procedure TFrmCadProdutos.ckDescMaxClick(Sender: TObject);
begin
  inherited;
	EdDescMax.Enabled := ckDescMax.Checked;
  if ckDescMax.Checked then
  begin
  	pnDescMax.ParentBackground := False;
		pnDescMax.Color := clYellow;
  end
  else
  begin
  	pnDescMax.ParentBackground := True;
  	pnDescMax.Color := clBtnFace;
  end;
  
  if (Self.Enabled) and (Self.Visible) and (EdDescMax.CanFocus) then
  	EdDescMax.SetFocus;
end;

procedure TFrmCadProdutos.ckEcommerceClick(Sender: TObject);
var
	vVisible: boolean;
begin
  inherited;
  vVisible := ckLixeira.Visible;
  ckLixeira.Visible := false;
  ckLixeira.Enabled := not ckEcommerce.Checked;
  if not ckLixeira.Enabled then
  	ckLixeira.Checked := false;
  ckLixeira.Visible := vVisible;

  if not ckEcommerce.Visible then
    exit;

	if (PageControl1.ActivePage = tsAlterDadosProd)
  	and (TelaCadastro = 5) then
  begin
  	if ckLixeira.Checked then
      FrmCadProdutos.Caption := 'Alteração Produtos em Lote (Lixeira)'
  	else if ckEcommerce.Checked then
      FrmCadProdutos.Caption := 'Alteração Produtos em Lote (E-Commerce)'
    else
      FrmCadProdutos.Caption := 'Alteração Produtos em Lote';
  end
	else if PageControl1.ActivePage = tsDefinirPromocoes then
  begin
    if ckLixeira.Checked then
    	FrmCadProdutos.Caption := 'Definir Promoções (Lixeira)'
    else if ckEcommerce.Checked then
      FrmCadProdutos.Caption := 'Definir Promoções (E-Commerce)'
    else
      FrmCadProdutos.Caption := 'Definir Promoções';
  end
  else if PageControl1.ActivePage = tsDefinirPrecoDiferenciado then
  begin
  	if ckLixeira.Checked then
    	FrmCadProdutos.Caption := 'Definir Preços Diferenciados (Lixeira)'
    else if ckEcommerce.Checked then
    	FrmCadProdutos.Caption := 'Definir Preços Diferenciados (E-Commerce)'
    else
    	FrmCadProdutos.Caption := 'Definir Preços Diferenciados';
  end
  else
  begin
  	if ckLixeira.Checked then
    	FrmCadProdutos.Caption := 'Produtos (Lixeira)'
    else if ckEcommerce.Checked then
      FrmCadProdutos.Caption := 'Produtos (E-Commerce)'
    else
      FrmCadProdutos.Caption := 'Produtos';
  end;
  BitBtn1Click(Sender);
end;

procedure TFrmCadProdutos.ckEstoqueDiarioCClick(Sender: TObject);
begin
  inherited;
  Panel69.Visible := ckEstoqueDiarioC.Checked;
//  Produto.retirarFiltrosC;
  if ckEstoqueDiarioC.Checked then
    Produto.cdsEstoqueDiarioC.AfterScroll := Produto.datasetAfterScrollEstDiaC
  else
  begin
    Produto.cdsEstoqueDiarioC.AfterScroll := nil;
    if not aplicarFiltros then
      exit;
  end;
  _GravaConfiguracoesBoolean('ckEstoqueDiarioC', ckEstoqueDiarioC.Checked);
  if ckEstoqueDiarioC.Checked then
    Produto.cdsEstoqueDiarioC.First;
end;

procedure TFrmCadProdutos.ckEstoqueDiarioClick(Sender: TObject);
begin
  inherited;
  Panel45.Visible := ckEstoqueDiario.Checked;
  Produto.retirarFiltros;
  if ckEstoqueDiario.Checked then
    Produto.cdsEstoqueDiario.AfterScroll := Produto.datasetAfterScrollEstDia
  else
    Produto.cdsEstoqueDiario.AfterScroll := nil;
  _GravaConfiguracoesBoolean('ckEstoqueDiario', ckEstoqueDiario.Checked);
  if ckEstoqueDiario.Checked then
    Produto.cdsEstoqueDiario.First;
end;

procedure TFrmCadProdutos.ckEstoqueDisponivelClick(Sender: TObject);
begin
  inherited;
	if not ckEstoqueDisponivel.Visible then
    Exit;

  BitBtn1Click(Sender);
end;

procedure TFrmCadProdutos.ckMenuLateralClick(Sender: TObject);
begin
	if (not MenuLateralExibirObservacao.Checked)
    and (not MenuLateralExibirDetalhesCaractersticas.Checked)
    and (not MenuLateralExibirCodigos.Checked)
    and (not MenuLateralExibirEstoquePorEmpresa.Checked)
    and (not MenuLateralExibirPrecosVendaPorEmpresa.Checked) then
      MenuLateralExibirObservacao.Checked := True;

	try
	 	if (PageControl1.ActivePage <> TabSheet2) then
    begin
    	Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
    	Produto.dataSet.AfterScroll := nil;
      pnQtdeVndMes.Visible := false;
			pnObservacao.Visible := false;
      pnCodigo.Visible := false;
      pnEstoqueEmpresas.Visible := false;
      pnPrecosVndPorEmpresa.Visible := false;
      pnCaracteristica.Visible := false;
      pnOpcaoDireitaProdutos.Visible := false;
    	exit;
    end;

    vHabObservacaoProd := MenuLateralExibirObservacao.Checked;
    vHabCaracteristicaProd := MenuLateralExibirDetalhesCaractersticas.Checked;
    vHabCodigoProd := MenuLateralExibirCodigos.Checked;
		vHabEstoquePorEmpresas := MenuLateralExibirEstoquePorEmpresa.Checked;
    vHabPrecosVndPorEmpresa := MenuLateralExibirPrecosVendaPorEmpresa.Checked;
    vHabQtdeVndPorMes := False;

		pnObservacao.Visible := vHabObservacaoProd;
    SplitterObservacaoBottom.Visible := (vHabObservacaoProd) and ((vHabCaracteristicaProd) or (vHabCodigoProd) or (vHabEstoquePorEmpresas) or (vHabPrecosVndPorEmpresa));

    pnCaracteristica.Visible := vHabCaracteristicaProd;
    SplitterCaracteristicaBottom.Visible := (vHabCaracteristicaProd) and ((vHabCodigoProd) or (vHabEstoquePorEmpresas) or (vHabPrecosVndPorEmpresa));

    pnCodigo.Visible := vHabCodigoProd;
    SplitterCodigoEmpresasBottom.Visible := (vHabCodigoProd) and ((vHabEstoquePorEmpresas) or (vHabPrecosVndPorEmpresa));

    pnEstoqueEmpresas.Visible := vHabEstoquePorEmpresas;
    SplitterEstoqueEmpresasBottom.Visible := (vHabEstoquePorEmpresas) and (vHabPrecosVndPorEmpresa);

    pnPrecosVndPorEmpresa.Visible := vHabPrecosVndPorEmpresa;
    SplitterPrecosVndPorEmpresaBottom.Visible := (vHabPrecosVndPorEmpresa) and (vHabQtdeVndPorMes);

    pnQtdeVndMes.Visible := vHabQtdeVndPorMes;

    pnOpcaoDireitaProdutos.Visible := (ckMenuLateral.Checked);

    if ckMenuLateral.Checked then
    begin
      if not ckFiltrarEmpresa.Checked then
      begin
      	Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
	    	Produto.dataSet.AfterScroll := Produto.datasetAfterScrollEstProd;

        Produto.CodBarra.abreCodBarras(Produto.DataSet);
        Produto.vEstoquePorEmpresa.abreEstoquePorEmpresa(Produto.DataSet);
			  Produto.vEstoquePorEmpresa.vPrecoPorEmpresa.abrePrecoPorEmpresa(Produto.DataSet, false);
      end
      else
      begin
      	Produto.dataSet.AfterScroll := Produto.datasetAfterScrollEstProdVnd;
        Produto.vEstoquePorEmpresa.dataSet.AfterScroll := Produto.vEstoquePorEmpresa.datasetAfterScrollEstPrecoVnd;

        Produto.CodBarra.abreCodBarras(Produto.DataSet);
        Produto.vEstoquePorEmpresa.abreEstoquePorEmpresa(Produto.DataSet);
        Produto.vEstoquePorEmpresa.vPrecoPorEmpresa.abrePrecoPorEmpresa(Produto.vEstoquePorEmpresa.DataSet, true)
      end;
      if PrimeiraPesquisa1 then
      begin
        PrimeiraPesquisa1 := False;
        vDadosIni.configurarGridPeloConfigColunas(DBGridEstoqueEmpresas, GridCfg1, cdsGrid1, cdsColunas1, usuario, ListGridsAndDataSets1, vDadosIni.transacaoCol);
      end;
      if PrimeiraPesquisa2 then
      begin
        PrimeiraPesquisa2 := False;
	      vDadosIni.configurarGridPeloConfigColunas(DBGridPrecosVndPorEmpresa, GridCfg2, cdsGrid2, cdsColunas2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);
      end;
      if PrimeiraPesquisa3 then
      begin
        PrimeiraPesquisa3 := False;
        vDadosIni.configurarGridPeloConfigColunas(DBGridCodigo, GridCfg3, cdsGrid3, cdsColunas3, usuario, ListGridsAndDataSets3, vDadosIni.transacaoCol);
      end;
    end
    else
    begin
    	Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
    	Produto.dataSet.AfterScroll := nil;
    end;

    if ckMenuLateral.Tag = 99 then
    	AjustarBarraLateral(True)
    else
			AjustarBarraLateral(False);
  finally
  	if (PageControl1.ActivePage = TabSheet2) then
    begin
    	if pnOpcaoDireitaProdutos.Width < 180 then
      	pnOpcaoDireitaProdutos.Width := 180;

      if pnObservacao.Height < 48 then
      	pnObservacao.Height := 48;

      if pnCaracteristica.Height < 48 then
      	pnCaracteristica.Height := 48;

      if pnCodigo.Height < 48 then
        pnCodigo.Height := 48;

      if pnEstoqueEmpresas.Height < 48 then
      	pnEstoqueEmpresas.Height := 48;

      if pnPrecosVndPorEmpresa.Height < 48 then
      	pnPrecosVndPorEmpresa.Height := 48;

    	_GravaConfiguracoesBoolean(ckMenuLateral.Name + 'Prod', ckMenuLateral.Checked)
    end;
  end;
end;

procedure TFrmCadProdutos.ckFiltrarEmpresaClick(Sender: TObject);
begin
	try
  	if Produto.vEstoquePorEmpresa.dataSet.Active then
      if Produto.vEstoquePorEmpresa.dataSet.RecordCount > 0 then
        Produto.vEstoquePorEmpresa.storeRecNo;

    if not ckFiltrarEmpresa.Checked then
    begin
      Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
      Produto.dataSet.AfterScroll := Produto.datasetAfterScrollEstProd;

      Produto.CodBarra.abreCodBarras(Produto.DataSet);
      Produto.vEstoquePorEmpresa.abreEstoquePorEmpresa(Produto.dataSet);
      Produto.vEstoquePorEmpresa.vPrecoPorEmpresa.abrePrecoPorEmpresa(Produto.dataSet, false);
    end
    else
    begin
      Produto.dataSet.AfterScroll := Produto.datasetAfterScrollEstProdVnd;
      Produto.vEstoquePorEmpresa.dataSet.AfterScroll := Produto.vEstoquePorEmpresa.datasetAfterScrollEstPrecoVnd;

      Produto.CodBarra.abreCodBarras(Produto.DataSet);
      Produto.vEstoquePorEmpresa.abreEstoquePorEmpresa(Produto.dataSet);
      Produto.vEstoquePorEmpresa.vPrecoPorEmpresa.abrePrecoPorEmpresa(Produto.vEstoquePorEmpresa.dataSet, true);
    end;
  finally
  	if Produto.vEstoquePorEmpresa.dataSet.Active then
      if Produto.vEstoquePorEmpresa.dataSet.RecordCount > 0 then
        Produto.vEstoquePorEmpresa.restoreRecNo;
    _GravaConfiguracoesBoolean(ckFiltrarEmpresa.Name, ckFiltrarEmpresa.Checked);
  end;
end;

procedure TFrmCadProdutos.ckGrupoClick(Sender: TObject);
begin
  inherited;
  EdCodGrupoProd.Enabled := ckGrupo.Checked;
  DBLGrupoProd.Enabled := ckGrupo.Checked;
  if ckGrupo.Checked then
  begin
  	pnGrupo.ParentBackground := False;
		pnGrupo.Color := clYellow;
  end
  else
  begin
  	pnGrupo.ParentBackground := True;
  	pnGrupo.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdCodGrupoProd.CanFocus) then
  	EdCodGrupoProd.SetFocus;
end;

procedure TFrmCadProdutos.ckMarcaClick(Sender: TObject);
begin
  inherited;
  EdCodMarca.Enabled := ckMarca.Checked;
  DBLMarca.Enabled := ckMarca.Checked;
  if ckMarca.Checked then
  begin
  	pnMarca.ParentBackground := False;
		pnMarca.Color := clYellow;
  end
  else
  begin
  	pnMarca.ParentBackground := True;
  	pnMarca.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdCodMarca.CanFocus) then
  	EdCodMarca.SetFocus;
end;

procedure TFrmCadProdutos.ckNAlterouEstClick(Sender: TObject);
var
 vAlterouEst, vNAlteouEst: boolean;
begin
//   vAlterouEst := ckAlterouEst.Checked;
//   vNAlteouEst := ckNAlterouEst.Checked;

//   pnFiltros.Visible := (vAlterouEst) or (vNAlteouEst);
//   if pnFiltros.Visible then
//   begin
//     GroupBox67.Height := 138;
//     Panel72.BevelOuter := bvLowered;
//   end
//   else
//   begin
//     GroupBox67.Height := 54;
//     Panel72.BevelOuter := bvNone;
//   end;
//   if ckNAlterouEst.Checked then
//   begin
//     ckOrcamento.Checked := vNAlteouEst;
//     ckCupom.Checked := vNAlteouEst;
//     ckNotaD.Checked := vNAlteouEst;
//     ckNotasS.Checked := vNAlteouEst;
//     ckNotasC.Checked := vNAlteouEst;
//   end;

   if not aplicarFiltros then
     exit;
end;

procedure TFrmCadProdutos.ckNatOPClick(Sender: TObject);
begin
  inherited;
  EdCodCFOP.Enabled := ckNatOP.Checked;
  EdCodCFOPInter.Enabled := ckNatOP.Checked;
  if ckNatOP.Checked then
  begin
  	pnNatOP.ParentBackground := False;
		pnNatOP.Color := clYellow;
  end
  else
  begin
  	pnNatOP.ParentBackground := True;
  	pnNatOP.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdCodCFOP.CanFocus) then
  	EdCodCFOP.SetFocus;
end;

procedure TFrmCadProdutos.ckNatRecClick(Sender: TObject);
begin
  inherited;
	EdNatReceita.Enabled := ckNatRec.Checked;
  if ckNatRec.Checked then
  begin
  	pnNatRec.ParentBackground := False;
		pnNatRec.Color := clYellow;
  end
  else
  begin
  	pnNatRec.ParentBackground := True;
  	pnNatRec.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdNatReceita.CanFocus) then
  	EdNatReceita.SetFocus;
end;

procedure TFrmCadProdutos.ckNCMClick(Sender: TObject);
begin
  inherited;
  EdCodNCM.Enabled := ckNCM.Checked;
  if ckNCM.Checked then
  begin
  	pnNCM.ParentBackground := False;
		pnNCM.Color := clYellow;
  end
  else
  begin
  	pnNCM.ParentBackground := True;
  	pnNCM.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdCodNCM.CanFocus) then
  	EdCodNCM.SetFocus;
end;

procedure TFrmCadProdutos.ckObsEtiqClick(Sender: TObject);
begin
  inherited;
	EdObsEtiq.Enabled := ckObsEtiq.Checked;
  lbInfObsEtiq.Enabled := ckObsEtiq.Checked;
  if ckObsEtiq.Checked then
  begin
  	pnObsEtiq.ParentBackground := False;
		pnObsEtiq.Color := clYellow;
  end
  else
  begin
  	pnObsEtiq.ParentBackground := True;
  	pnObsEtiq.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdObsEtiq.CanFocus) then
  	EdObsEtiq.SetFocus;
end;

procedure TFrmCadProdutos.ckRequisicaoClick(Sender: TObject);
begin
//   ckAlterouEst.Checked := (ckRequisicao.Checked) and (ckOrdemServ.Checked) and
//     (ckOrcamento.Checked) and (ckNotas.Checked) and (ckDevolucao.Checked) and
//     (ckProducao.Checked) and (ckCorrecao.Checked) and (ckBalD.Checked) and
//     (ckBalG.Checked);

   if not aplicarFiltros then
     exit;
end;

procedure TFrmCadProdutos.ckSubGrupoClick(Sender: TObject);
begin
  inherited;
  EdCodSubGrupo.Enabled := ckSubGrupo.Checked;
  DBLSubGrupo.Enabled := ckSubGrupo.Checked;
  if ckSubGrupo.Checked then
  begin
  	pnSubGrupo.ParentBackground := False;
		pnSubGrupo.Color := clYellow;
  end
  else
  begin
  	pnSubGrupo.ParentBackground := True;
  	pnSubGrupo.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (EdCodSubGrupo.CanFocus) then
  	EdCodSubGrupo.SetFocus;
end;

procedure TFrmCadProdutos.ckTipoItemProdutoClick(Sender: TObject);
begin
  inherited;
	DbLTipoItem.Enabled := ckTipoItemProduto.Checked;
  if ckTipoItemProduto.Checked then
  begin
  	pnTipoItemProduto.ParentBackground := False;
		pnTipoItemProduto.Color := clYellow;
  end
  else
  begin
  	pnTipoItemProduto.ParentBackground := True;
  	pnTipoItemProduto.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (DbLTipoItem.CanFocus) then
  	DbLTipoItem.SetFocus;
end;

procedure TFrmCadProdutos.ckTipoProdutoClick(Sender: TObject);
begin
  inherited;
	DbLTipo.Enabled := ckTipoProduto.Checked;
  if ckTipoProduto.Checked then
  begin
  	pnTipoProduto.ParentBackground := False;
		pnTipoProduto.Color := clYellow;
  end
  else
  begin
  	pnTipoProduto.ParentBackground := True;
  	pnTipoProduto.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (DbLTipo.CanFocus) then
  	DbLTipo.SetFocus;
end;

procedure TFrmCadProdutos.ckUmEtiqCadaProdClick(Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
    if ckUmEtiqCadaProd.Visible  then
      Produto.vEtiTer.montarDataSetNF(ckUmEtiqCadaProd.Checked, TelaCadastro);
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.ckVendaOnlineClick(Sender: TObject);
begin
  inherited;
  cbVendaOnline.Enabled := ckVendaOnline.Checked;
  if ckVendaOnline.Checked then
  begin
  	 pnVendaOnline.ParentBackground := False;
	 pnVendaOnline.Color := clYellow;
  end
  else
  begin
  	 pnVendaOnline.ParentBackground := True;
  	 pnVendaOnline.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (cbVendaOnline.CanFocus) then
  	cbVendaOnline.SetFocus;
end;

procedure TFrmCadProdutos.ckIsentoClick(Sender: TObject);
begin
  inherited;
	CbIsento.Enabled := ckIsento.Checked;
  if ckIsento.Checked then
  begin
  	pnIsento.ParentBackground := False;
		pnIsento.Color := clYellow;
  end
  else
  begin
  	pnIsento.ParentBackground := True;
  	pnIsento.Color := clBtnFace;
  end;

  if (Self.Enabled) and (Self.Visible) and (CbIsento.CanFocus) then
  	CbIsento.SetFocus;
end;

procedure TFrmCadProdutos.ckLixeira2Click(Sender: TObject);
begin
  inherited;
  if not ckLixeira2.Visible then
    exit;
  
  if not ckLixeira2.Enabled then
  begin
  	if ckLixeira2.Checked then
	  	btExcluirRegistro.Hint := 'Excluir registro permanentemente - [PRO005]'
    else
    	btExcluirRegistro.Hint := 'Enviar para Lixeira - [PRO006]';
  	exit;
  end;

  if ckLixeira2.Checked then
  begin
   	Produto.AbrirLixeiraNF(trim(vDadosIni.vPesquisaChaveNF));
    SpeedButtonAlterarProduto2.Visible := false;
    SpeedButtonAlterarProduto.Visible := false;
    SpeedButtonGradesEstoqueProduto.Visible := false;
    SpeedButtonAlterarGrupoCodProduto.Visible := false;
    SpeedButtonSincronizarOutrasEmpECommerce.Visible := false;
    btRestaurarRegistro.Visible := true;
    btExcluirRegistro.Hint := 'Excluir registro permanentemente -  [PRO005]';
  end
  else
  begin
  	Produto.abreProdutosNF(trim(vDadosIni.vPesquisaChaveNF));
    SpeedButtonAlterarProduto2.Visible := true;
    SpeedButtonAlterarProduto.Visible := false;//true;
    SpeedButtonGradesEstoqueProduto.Visible := true;
    SpeedButtonAlterarGrupoCodProduto.Visible := true;
    SpeedButtonSincronizarOutrasEmpECommerce.Visible := true;
    btRestaurarRegistro.Visible := false;
    btExcluirRegistro.Hint := 'Enviar para Lixeira -  [PRO006]';
  end;
end;

procedure TFrmCadProdutos.ckLixeiraClick(Sender: TObject);
var
  vVisible: boolean;
begin
  inherited;
  vVisible := ckEcommerce.Visible;
  ckEcommerce.Visible := false;
  ckEcommerce.Enabled := not ckLixeira.Checked;
  if not ckEcommerce.Enabled then
  	ckEcommerce.Checked := false;
  ckEcommerce.Visible := vVisible;

  if not ckLixeira.Visible then
    exit;
    
  if not ckLixeira.Enabled then
  begin
  	if ckLixeira.Checked then
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente - [PRO005]';
      btExcluirRegistro.Hint := 'Excluir registro permanentemente - [PRO005]';
    end
    else
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira - [PRO006]';
      btExcluirRegistro.Hint := 'Enviar para Lixeira - [PRO006]';
    end;
  	exit;
  end;

  if ckLixeira.Checked then
  begin
  	 SpeedButton2.Hint := 'Excluir registro permanentemente - [PRO005]';
    btExcluirRegistro.Hint := 'Excluir registro permanentemente - [PRO005]';
  end
  else
  begin
	 SpeedButton2.Hint := 'Enviar para Lixeira - [PRO006]';
    btExcluirRegistro.Hint := 'Enviar para Lixeira - [PRO006]';
  end;

  if (PageControl1.ActivePage = tsAlterDadosProd)
  	and (TelaCadastro = 5) then
  begin
  	 if ckLixeira.Checked then
      FrmCadProdutos.Caption := 'Alteração Produtos em Lote (Lixeira)'
    else if ckEcommerce.Checked then
    	FrmCadProdutos.Caption := 'Alteração Produtos em Lote (E-Commerce)'
    else
      FrmCadProdutos.Caption := 'Alteração Produtos em Lote';
  end
  else if PageControl1.ActivePage = tsDefinirPromocoes then
  begin
    if ckLixeira.Checked then
    	FrmCadProdutos.Caption := 'Definir Promoções (Lixeira)'
    else if ckEcommerce.Checked then
      FrmCadProdutos.Caption := 'Definir Promoções (E-Commerce)'
    else
      FrmCadProdutos.Caption := 'Definir Promoções';
  end
  else if PageControl1.ActivePage = tsDefinirPrecoDiferenciado then
  begin
  	if ckLixeira.Checked then
    	FrmCadProdutos.Caption := 'Definir Preços Diferenciados (Lixeira)'
    else if ckEcommerce.Checked then
    	FrmCadProdutos.Caption := 'Definir Preços Diferenciados (E-Commerce)'
    else
    	FrmCadProdutos.Caption := 'Definir Preços Diferenciados';
  end
  else
  begin
  	if ckLixeira.Checked then
    	FrmCadProdutos.Caption := 'Produtos (Lixeira)'
    else if ckEcommerce.Checked then
      FrmCadProdutos.Caption := 'Produtos (E-Commerce)'
    else
      FrmCadProdutos.Caption := 'Produtos';
  end;
  BitBtn1Click(Sender);
end;

procedure TFrmCadProdutos.ComboBox10Exit(Sender: TObject);
begin
  inherited;
  ComboBox10.Text := ComboBox10.Items[ComboBox10.ItemIndex];
end;

procedure TFrmCadProdutos.ComboBox11Exit(Sender: TObject);
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
    for I := 0 to Produto.dataSet.Fields.Count - 1 do
    begin
      if Produto.dataSet.Fields.Fields[i].DisplayLabel = ComboBox11.Text then
      begin
        if Produto.dataSet.Fields.Fields[i] is TDateTimeField then
        begin
          MaskEdit5.Visible := false;
          MaskEdit4.Visible := true;
          MaskEdit6.Visible := true;
          //    Label4.Visible := true;
          if MaskEdit4.Text = '  /  /    ' then
            MaskEdit4.Text := DateToStr(Date);
          if MaskEdit6.Text = '  /  /    ' then
            MaskEdit6.Text := DateToStr(Date);
          //    for I := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
          //    begin
          //      if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = Column.FieldName then
          //      begin
          //        ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel;
          //        ComboBox2.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel;
          //        Break;
          //      end;
          //    end;
          //    if (not naoOrdenar) and (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
          //      MaskEdit1.SetFocus;
        end
        else
        begin
          MaskEdit5.Visible := true;
          MaskEdit4.Visible := false;
          MaskEdit6.Visible := false;
        end;
        {Label4.Visible := true;
        if (not naoOrdenar) and (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
          MaskEdit3.SetFocus;
        if DBGrid1.DataSource <> nil then
          for I := 0 to TClientDataSet(DBGrid1.DataSource.DataSet).FieldCount - 1 do
          begin
            if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName = Column.FieldName then
            begin
              MaskEdit3.EditMask := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].EditMask;
              ComboBox1.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel;
              ComboBox2.Text := TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel;
              Break;
            end;
          end;
      end;}
      end;
    end;
end;

procedure TFrmCadProdutos.ComboBox14Exit(Sender: TObject);
begin
  inherited;
  if ComboBox14.Text = 'Geral' then
  begin
    CheckBox8.Checked := false;
    CheckBox8.Enabled := false;
    CheckBox5.Enabled := true;
    CheckBox7.Enabled := true;
    CheckBox13.Enabled := false;
    CheckBox13.Checked := false;
  end
  else
  begin
    CheckBox8.enabled := true;
    CheckBox5.Checked := false;
    CheckBox5.Enabled := false;
    CheckBox7.Checked := false;
    CheckBox7.Enabled := false;
    CheckBox13.Enabled := true;
  end;
end;

procedure TFrmCadProdutos.ComboBox1Exit(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if DBGrid1.DataSource <> nil then
    for I := 0 to DBGrid1.Columns.Count - 1 do
    begin
      if TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].DisplayLabel = ComboBox1.Text then
      begin
        configuraCamposCodProd(TClientDataSet(DBGrid1.DataSource.DataSet).Fields[i].FieldName =
          'COD_PROD');
        Exit;
      end;
    end;
end;

procedure TFrmCadProdutos.ComboBox4Exit(Sender: TObject);
begin
  inherited;
  ComboBox4.Text := ComboBox4.Items[ComboBox4.ItemIndex];
end;

procedure TFrmCadProdutos.ComboBox5Exit(Sender: TObject);
begin
  inherited;
  ComboBox5.Text := ComboBox5.Items[ComboBox5.ItemIndex];
end;

procedure TFrmCadProdutos.ComboBox6Exit(Sender: TObject);
begin
  inherited;
  ComboBox6.Text := ComboBox6.Items[ComboBox6.ItemIndex];
end;

procedure TFrmCadProdutos.ComboBox7Exit(Sender: TObject);
begin
  inherited;
  ComboBox7.Text := ComboBox7.Items[ComboBox7.ItemIndex];
end;

procedure TFrmCadProdutos.ComboBox8Exit(Sender: TObject);
begin
  inherited;
  ComboBox8.Text := ComboBox8.Items[ComboBox8.ItemIndex];
end;

procedure TFrmCadProdutos.ComboBox9Exit(Sender: TObject);
begin
  inherited;
  ComboBox9.Text := ComboBox9.Items[ComboBox9.ItemIndex];
end;

procedure TFrmCadProdutos.ComboBoxUnidadePrincExit(Sender: TObject);
begin
  exibirInfConversao;
end;

procedure TFrmCadProdutos.ComboBoxUnidadePrincSaidaExit(Sender: TObject);
begin
	exibirInfConversaoSaida;
end;

procedure TFrmCadProdutos.configuraCamposCodProd(Habilitar: boolean);
begin
  try
    if (PageControl1.ActivePage = TabSheet2) then //and vCtrlLocalClick then
    begin
      if Habilitar then
      begin
        mkGrupo.Visible := true;
        mkSubGrupo.Visible := true;
        mkCodProd.Visible := true;
        lbGrupo.Visible := true;
        lbSubGrupo.Visible := true;
        lbCodProd.Visible := true;
        if (Self.Enabled) and (Self.Visible) and (mkGrupo.CanFocus) then
          mkGrupo.SetFocus;

        MaskEdit3.Visible := false;
        MaskEdit1.Visible := false;
        MaskEdit2.Visible := false;
        Label4.Visible := false;
        Label2.Visible := false;
      end
      else
      begin
        mkGrupo.Visible := False;
        mkSubGrupo.Visible := False;
        mkCodProd.Visible := False;
        lbGrupo.Visible := False;
        lbSubGrupo.Visible := False;
        lbCodProd.Visible := False;
        Label2.Visible := true;
      end;
    end;
  finally
    vCtrlLocalClick := false;
  end;
end;

procedure TFrmCadProdutos.Configurarcolunas1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('PRO197', 'CONFIGURAR', '', 'PRODUTOS', '', Produto.buscas, true) then
    inherited;
end;

procedure TFrmCadProdutos.ConfigurarcolunasCodigoPorEmpresaClick(
  Sender: TObject);
begin
//	if vDadosIni.PesqPros('PRO197', 'CONFIGURAR', '', 'PRODUTOS', '', Produto.buscas, true) then
	  vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas3, DBGridCodigo, GridCfg3, cdsGrid3, usuario, ListGridsAndDataSets3, vDadosIni.transacaoCol);
end;

procedure TFrmCadProdutos.ConfigurarcolunasEstoquePorEmpresaClick(
  Sender: TObject);
begin
//	if vDadosIni.PesqPros('PRO197', 'CONFIGURAR', '', 'PRODUTOS', '', Produto.buscas, true) then
	  vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas1, DBGridEstoqueEmpresas, GridCfg1, cdsGrid1, usuario, ListGridsAndDataSets1, vDadosIni.transacaoCol);
end;

procedure TFrmCadProdutos.ConfigurarcolunasPrecosVndPorEmpresaClick(
  Sender: TObject);
begin
//	if vDadosIni.PesqPros('PRO197', 'CONFIGURAR', '', 'PRODUTOS', '', Produto.buscas, true) then
	  vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas2, DBGridPrecosVndPorEmpresa, GridCfg2, cdsGrid2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TFrmCadProdutos.CopiarparareadetransfernciaCodigoPorEmpresaClick(
  Sender: TObject);
begin
  Clipboard.AsText := DBGridCodigo.DataSource.DataSet.FieldByName(DBGridCodigo.Columns[DBGridCodigo.SelectedIndex].FieldName).AsString;
end;

procedure TFrmCadProdutos.CopiarparareadetransfernciaEstoquePorEmpresaClick(
  Sender: TObject);
begin
  Clipboard.AsText := DBGridEstoqueEmpresas.DataSource.DataSet.FieldByName(DBGridEstoqueEmpresas.Columns[DBGridEstoqueEmpresas.SelectedIndex].FieldName).AsString;
end;

procedure TFrmCadProdutos.CopiarparareadetransfernciaPrecosVndPorEmpresaClick(
  Sender: TObject);
begin
  Clipboard.AsText := DBGridPrecosVndPorEmpresa.DataSource.DataSet.FieldByName(DBGridPrecosVndPorEmpresa.Columns[DBGridPrecosVndPorEmpresa.SelectedIndex].FieldName).AsString;
end;

procedure TFrmCadProdutos.DBComboBox10Exit(Sender: TObject);
begin
  inherited;
  Produto.AlteraCodDescCupom;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not ((copy(DBComboBox10.Text, 0, 1) = 'S') or (copy(DBComboBox10.Text, 0, 1) = 'N')) then
    begin
      Application.MessageBox('Selecione ''SIM'' ou ''NÃO''.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox10.CanFocus) then
        DBComboBox10.SetFocus;
    end;
end;

procedure TFrmCadProdutos.DBComboBox14Exit(Sender: TObject);
begin
  inherited;
	if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not ((copy(DBComboBox14.Text, 0, 1) = 'S') or (copy(DBComboBox14.Text, 0, 1) = 'N')) then
    begin
      Application.MessageBox('Selecione ''SIM'' ou ''NÃO''.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox14.CanFocus) then
        DBComboBox14.SetFocus;
    end;

  if trim(DBComboBox14.Text) <> '' then
	  if (trim(Produto.oldForaLinha) = 'S') and (copy(trim(DBComboBox14.Text), 0, 1) = 'S') then
    	Application.MessageBox('Produto definido como fora de linha,' +
      	' quando o mesmo estiver sem estoque será enviado para lixeira', 'Atenção', 0 + 64);
end;

procedure TFrmCadProdutos.DBComboBox15Exit(Sender: TObject);
begin
  inherited;
	if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not ((copy(DBComboBox15.Text, 0, 1) = 'S') or (copy(DBComboBox15.Text, 0, 1) = 'N')) then
    begin
      Application.MessageBox('Selecione ''SIM'' ou ''NÃO''.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox15.CanFocus) then
	      DBComboBox15.SetFocus;
    end;
end;

procedure TFrmCadProdutos.DBComboBoxUnidadeConvExit(Sender: TObject);
begin
  exibirInfConversao;
end;

procedure TFrmCadProdutos.DBComboBoxUnidadeConvSaidaChange(Sender: TObject);
begin
  inherited;
	exibirInfConversaoSaida;
end;

procedure TFrmCadProdutos.DBComboBoxUnidadeConvSaidaExit(Sender: TObject);
begin
	exibirInfConversaoSaida;
end;

procedure TFrmCadProdutos.DBComboBox18Change(Sender: TObject);
begin
  inherited;
	exibirInfConversaoSaida;
end;

procedure TFrmCadProdutos.DBComboBox18Exit(Sender: TObject);
begin
  inherited;
	exibirInfConversaoSaida;
end;

procedure TFrmCadProdutos.DBComboBox21Exit(Sender: TObject);
begin
  inherited;
	if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not ((copy(DBComboBox21.Text, 0, 1) = 'S') or (copy(DBComboBox21.Text, 0, 1) = 'N')) then
    begin
      Application.MessageBox('Selecione ''SIM'' ou ''NÃO''.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox21.CanFocus) then
        DBComboBox21.SetFocus;
    end;
end;

procedure TFrmCadProdutos.DBComboBox2Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not ((copy(DBComboBox2.Text, 0, 1) = 'S') or (copy(DBComboBox2.Text, 0, 1) = 'N')) then
    begin
      Application.MessageBox('Selecione ''SIM'' ou ''NÃO''.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
        DBComboBox2.SetFocus;
    end;
end;

procedure TFrmCadProdutos.DBComboBox3Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not ((copy(DBComboBox3.Text, 0, 1) = 'P') or (copy(DBComboBox3.Text, 0, 1) = 'T')) then
    begin
      Application.MessageBox('Selecione ''TERCEIRO'' ou ''PRÓPRIA''.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
        DBComboBox3.SetFocus;
    end;
end;

procedure TFrmCadProdutos.DBComboBox4Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not ((copy(DBComboBox4.Text, 0, 1) = 'S') or (copy(DBComboBox4.Text, 0, 1) = 'N')) then
    begin
      Application.MessageBox('Selecione ''SIM'' ou ''NÃO''.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox4.CanFocus) then
        DBComboBox4.SetFocus;
    end;
end;

procedure TFrmCadProdutos.DBComboBox5Exit(Sender: TObject);
begin
  inherited;
  Produto.AlteraCodDescCupom;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not ((copy(DBComboBox5.Text, 0, 1) = 'S') or (copy(DBComboBox5.Text, 0, 1) = 'N')) then
    begin
      Application.MessageBox('Selecione ''SIM'' ou ''NÃO''.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox5.CanFocus) then
        DBComboBox5.SetFocus;
    end;
end;

procedure TFrmCadProdutos.DBComboBox6Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not ((copy(DBComboBox6.Text, 0, 1) = 'S') or (copy(DBComboBox6.Text, 0, 1) = 'N')) then
    begin
      Application.MessageBox('Selecione ''SIM'' ou ''NÃO''.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox6.CanFocus) then
        DBComboBox6.SetFocus;
    end;
end;

procedure TFrmCadProdutos.DBComboBox7Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not ((copy(DBComboBox7.Text, 0, 1) = 'S') or (copy(DBComboBox7.Text, 0, 1) = 'N')) then
    begin
      Application.MessageBox('Selecione ''SIM'' ou ''NÃO''.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox7.CanFocus) then
        DBComboBox7.SetFocus;
    end;
end;

procedure TFrmCadProdutos.DBComboBox8Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not ((copy(DBComboBox8.Text, 0, 1) = 'S') or (copy(DBComboBox8.Text, 0, 1) = 'N')) then
    begin
      Application.MessageBox('Selecione ''SIM'' ou ''NÃO''.', 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBComboBox8.CanFocus) then
        DBComboBox8.SetFocus;
    end;
end;

procedure TFrmCadProdutos.DBEdit109Exit(Sender: TObject);
begin
  inherited;

  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) {and (activecontrol <> BitBtn10)} then
    if not Produto.CodBarra.BuscarGrade(Produto.CodBarra.dataSet.FieldByName('COD_GRADE').AsInteger) then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBEdit109.CanFocus) then
        DBEdit109.SetFocus;
      exit;
    end;

  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) {and (activecontrol <> BitBtn10)} then
    if not Produto.CodBarra.VerificarGrade(Produto.dataSet.FieldByName('GRUPO_PROD').AsInteger,
      Produto.dataSet.FieldByName('COD_PROD').AsString,
      Produto.CodBarra.dataSet.FieldByName('COD_GRADE').AsInteger) then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBEdit109.CanFocus) then
        DBEdit109.SetFocus;
      exit;
    end;
  Produto.CodBarra.TrataCodBarras(Produto,
    Produto.CodBarra.dataSet.FieldByName('COD_BARRA').AsString, Produto.CodBarra.dataSet.FieldByName('COD_GRADE').AsString);
  DBEdit78.Enabled := false;
  DBEdit109.Enabled := false;
end;

procedure TFrmCadProdutos.DBEdit109KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('GRADE');
    if trim(vDadosIni.vPesquisa) <> '' then
    begin
      //DBEdit98.Field.AsInteger := StrToInt(vDadosIni.vPesquisa);
    //  Produto.CodBarra.Edit;
      Produto.CodBarra.dataSet.FieldByName('COD_GRADE').AsInteger := StrToInt(vDadosIni.vPesquisa);
    end;
  end;
end;

procedure TFrmCadProdutos.DBEdit118KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
    Produto.CodBarra.Cancel;
    if (Self.Enabled) and (Self.Visible) and (DBGrid36.CanFocus) then
	    DBGrid36.SetFocus;
  end
  else if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('GRADE');
    if trim(vDadosIni.vPesquisa) <> '' then
    begin
      //DBEdit98.Field.AsInteger := StrToInt(vDadosIni.vPesquisa);
    //  Produto.CodBarra.Edit;
      Produto.CodBarra.dataSet.FieldByName('COD_GRADE').AsInteger := StrToInt(vDadosIni.vPesquisa);
    end;
  end; 
end;

procedure TFrmCadProdutos.DBEdit133Exit(Sender: TObject);
begin
  inherited;
  
  if (activecontrol <> BitBtn_5) and (activecontrol <> BitBtn_6) {and (activecontrol <> BitBtn10)} then
    if not Produto.CodBarra.BuscarGrade(Produto.CodBarra.dataSet.FieldByName('COD_GRADE').AsInteger) then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBEdit133.CanFocus) then
        DBEdit133.SetFocus;
      exit;
    end;

  if (activecontrol <> BitBtn_5) and (activecontrol <> BitBtn_6) {and (activecontrol <> BitBtn10)} then
    if not Produto.CodBarra.VerificarGrade(Produto.dataSet.FieldByName('GRUPO_PROD').AsInteger,
      Produto.dataSet.FieldByName('COD_PROD').AsString,
      Produto.CodBarra.dataSet.FieldByName('COD_GRADE').AsInteger) then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBEdit133.CanFocus) then
        DBEdit133.SetFocus;
      exit;
    end;

  Produto.CodBarra.TrataCodBarras(Produto,
    Produto.CodBarra.dataSet.FieldByName('COD_BARRA').AsString, Produto.CodBarra.dataSet.FieldByName('COD_GRADE').AsString);
  DBEdit118.Enabled := false;
  DBEdit133.Enabled := false;
end;

procedure TFrmCadProdutos.DBEdit13Exit(Sender: TObject);
begin
  inherited;
  if (Produto.vProdutosPrecoQtde.dataSet.State in [dsInsert, dsEdit]) then
		if Produto.vProdutosPrecoQtde.dataSet.FieldByName('MARKUP').AsFloat > 0 then
    begin
    	Produto.vProdutosPrecoQtde.dataSet.FieldByName('PRECO_VENDA').AsFloat := 0;
      Produto.vProdutosPrecoQtde.dataSet.FieldByName('PORCENTAGEM').AsFloat := 0;
    end;

  if (Sender as TDBEdit).DataField = 'MARGEM' then
    Produto.vProdutosPrecoQtde.dataSet.FieldByName('markup').AsFloat :=
      CalcUtils.Markup(Produto.vProdutosPrecoQtde.ffloat('margem'), DIGROUNDMAX)
  else
    Produto.vProdutosPrecoQtde.dataSet.FieldByName('margem').AsFloat :=
      CalcUtils.MargemLucro(Produto.vProdutosPrecoQtde.ffloat('markup'), DIGROUNDMAX);
end;

procedure TFrmCadProdutos.DBEdit148Exit(Sender: TObject);
begin
  inherited;
	if (Produto.vProdutosPrecoQtde.dataSet.State in [dsInsert, dsEdit]) then
		if Produto.vProdutosPrecoQtde.dataSet.FieldByName('PRECO_VENDA').AsFloat > 0 then
    begin
    	Produto.vProdutosPrecoQtde.dataSet.FieldByName('PORCENTAGEM').AsFloat := 0;
      Produto.vProdutosPrecoQtde.dataSet.FieldByName('MARKUP').AsFloat := 0;
    end;
end;

procedure TFrmCadProdutos.DBEdit149Exit(Sender: TObject);
begin
  inherited;
  if Produto.dataSet.State in [dsInsert, dsEdit] then
  begin
    Produto.dataSet.FieldByName('ISENTO_PIS').AsString := vDadosIni.IfThen(Produto.dataSet.FieldByName('cst_pis').AsString = '07', 'S', 'N');

    if not vDadosIni.strIn(Trim(Produto.dataSet.FieldByName('cst_pis').AsString),
                           ['', '01', '02', '03', '04', '05', '06', '07', '08', '09', '49', '99']) then
    begin
      vDadosIni.ShowErro('CST de Saída PIS COFIS inválido. Deixe em branco ou informe um dos seguintes valores:' + #13 +
                         '"01", "02", "03", "04", "05", "06", "07", "08", "09", "49", "99"');
      if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
        TDBEdit(Sender).SetFocus;
    end;
  end;
end;

procedure TFrmCadProdutos.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
	    DBLookupComboBox1.SetFocus;
end;

procedure TFrmCadProdutos.DBEdit20Exit(Sender: TObject);
begin
  inherited;
  with Produto do
    vDadosIni.Auditoria('PRO333', 'HABILITAR',Format('%d-%s/%s Novo:%0.3f', [fint('grupo_prod'), fstr('cod_prod'), fstr('num_fab_prod'), ffloat('n_min_prod')]),
                        'PRODUTOS', fstr('grupo_prod') + '-' + fstr('cod_prod'));
  DBEdit20.Enabled := False;
  DBEdit174.Enabled := False;
  Label20.Enabled := False;
end;

procedure TFrmCadProdutos.DBEdit211Exit(Sender: TObject);
begin
  inherited;
  if (Produto.vProdutosPrecoQtde.dataSet.State in [dsInsert, dsEdit]) then
		if Produto.vProdutosPrecoQtde.dataSet.FieldByName('PORCENTAGEM').AsFloat <> 0 then
    begin
    	Produto.vProdutosPrecoQtde.dataSet.FieldByName('PRECO_VENDA').AsFloat := 0;
      Produto.vProdutosPrecoQtde.dataSet.FieldByName('MARKUP').AsFloat := 0;
    end;
end;

procedure TFrmCadProdutos.DBEdit212KeyPress(Sender: TObject; var Key: Char);
begin
  if not( key in['0'..'9',#08] ) then 
    key:=#0;
end;

procedure TFrmCadProdutos.DBEdit219Exit(Sender: TObject);
begin
  inherited;
  Produto.HandleAlteracaoPreco((Sender as TDBEdit).DataField);
end;

procedure TFrmCadProdutos.DBEditURLAcessoExit(Sender: TObject);
begin
	RemoveAcentosEspacos;
end;

procedure TFrmCadProdutos.DBEdit21Exit(Sender: TObject);
begin
  inherited;
  with Produto do
    vDadosIni.Auditoria('PRO334', 'HABILITAR',Format('%d-%s/%s Novo:%0.3f', [fint('grupo_prod'), fstr('cod_prod'), fstr('num_fab_prod'), ffloat('n_max_prod')]),
                        'PRODUTOS', fstr('grupo_prod') + '-' + fstr('cod_prod'));
  DBEdit21.Enabled := False;
  DBEdit175.Enabled := False;
  Label21.Enabled := False;
end;

procedure TFrmCadProdutos.DBEdit23KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('PRO027', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
      //    if vDadosIni.PesqPros('PRO027', '', produto.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('G_DSGS');
        if vDadosIni.vPesquisa <> '' then
          Produto.dataSet.FieldByName('COD_DSGS').AsString := vDadosIni.vPesquisa;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('PRO028', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
      //    if vDadosIni.PesqPros('PRO028', '', produto.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := Produto.dataSet.FieldByName('COD_DSGS').AsString;
        Produto.CadDSGS(1);
        //        Produto.dataSet.FieldByName('COD_DSGS').AsString := vDadosIni.vPesquisa;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadProdutos.DBEdit25Exit(Sender: TObject);
var
 vMensagem: string;
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not Produto.TestarCFOPInter(vMensagem) then
    begin
      	Application.MessageBox(PChar(vMensagem), 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (DBEdit25.CanFocus) then
        	DBEdit25.SetFocus;
    end;
end;

procedure TFrmCadProdutos.DBEdit25KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if not vDadosIni.PesqPros('PRO019', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Exit;
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NAT_OP');
      if vDadosIni.vPesquisa <> '' then
        Produto.dataSet.FieldByName('CFOP_INTER_N_CONT').asstring := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadProdutos.DBEdit28Enter(Sender: TObject);
begin
  inherited;
  if Produto.dataSet.State = dsEdit then
    Produto.dataSet.FieldByName('DESCR_PROD').AsString :=
      trim(Produto.dataSet.FieldByName('DESCR_PROD').AsString);
  if Produto.cadastroSimplificado then
    DBEdit120.SelectAll
  else
    DBEdit28.SelectAll;
end;

procedure TFrmCadProdutos.DBEdit28Exit(Sender: TObject);
begin
  inherited;
  if (trim(Produto.dataSet.FieldByName('DESCR_PROD_RED').AsString) = '') and
    (trim(Produto.dataSet.FieldByName('DESCR_PROD').AsString) <> '') then
    Produto.dataSet.FieldByName('DESCR_PROD_RED').AsString :=
      trim(Produto.dataSet.FieldByName('DESCR_PROD').AsString);
end;

procedure TFrmCadProdutos.DBEdit32Exit(Sender: TObject);
begin
  inherited;
  if (Produto.dataSet.FieldByName('N_INCIDENCIA_PROD').AsString = 'S') or
    (Produto.dataSet.FieldByName('ISENTO_PROD').AsString = 'S') then
  begin
    if Produto.dataSet.FieldByName('ICM_PROD').AsFloat > 0 then
      Application.MessageBox('Produto marcado como isento ou não tributado. A alíquota de ICMS será zerada',
        'Atenção', 0 + 64);
    Produto.dataSet.FieldByName('ICM_PROD').AsFloat := 0;
  end;
end;

procedure TFrmCadProdutos.DBEdit33Exit(Sender: TObject);
begin
  inherited;
  Produto.HandleAlteracaoPreco((Sender as TDBEdit).DataField);
end;

procedure TFrmCadProdutos.DBEdit35Exit(Sender: TObject);
var
  pr, mk: Double;
begin
  inherited;

  if Sender is TDBEdit then
    if StartsText((Sender as TDBEdit).DataField, 'MARGEM') then
      if  Produto.ffloat((Sender as TDBEdit).DataField, -2) > 99.991 then
      begin
        ShowErro('Margem não pode ser superir a 99.99%');
        if (Self.Enabled) and (Self.Visible) and ((Sender as TDBEdit).CanFocus) then
          (Sender as TDBEdit).SetFocus;
        Exit;
      end;

  Produto.HandleAlteracaoPreco((Sender as TDBEdit).DataField);
  {
  Produto.HandleAlteracaoMarkupVarejo;
  if vDadosIni.vEmp.vALT_PERC_MARGEM = 'S' then
  begin
    if Produto.ffloat('PERC_TB_PROD') <> 0 then
    begin
      //preco calculado
      pr := RoundTo((Produto.ffloat('PREC_CUSM_PROD') + ((Produto.ffloat('PREC_CUSM_PROD') * Produto.ffloat('PERC_TB_PROD')) / 100)), 0 - vDadosIni.vEmp.vCasasDecimais);
      mk := (pr - Produto.ffloat('PREC_CUSM_PROD')) / Produto.ffloat('PREC_CUSM_PROD') * 100;
      //Mesmo ajuste da nota
      if RoundTo(mk, -2) < RoundTo(Produto.ffloat('PERC_TB_PROD'), -2) then
        pr := pr + 0.01;

      Produto.dataSet.FieldByName('PREC_TAB_PROD').AsFloat := pr;

          // Preço 30 dias
      if (Produto.ffloat('PERC_AD_30') <> 0) then
        Produto.dataSet.FieldByName('PREC_30_PROD').AsFloat := RoundTo(
          Produto.ffloat('PREC_TAB_PROD') *
          ( 1 + (Produto.ffloat('PERC_AD_30') / 100)), -2);
      // Preço 60 dias
      if (Produto.ffloat('PERC_AD_60') <> 0) then
        Produto.dataSet.FieldByName('PREC_60_PROD').AsFloat := RoundTo(
          Produto.ffloat('PREC_TAB_PROD') *
          ( 1 + (Produto.ffloat('PERC_AD_60') / 100)), -2);
      // Preço 90 dias
      if (Produto.ffloat('PERC_AD_90') <> 0) then
        Produto.dataSet.FieldByName('PREC_90_PROD').AsFloat := RoundTo(
          Produto.ffloat('PREC_TAB_PROD') *
          ( 1 + (Produto.ffloat('PERC_AD_90') / 100)), -2);
    end;
  end;
  if vDadosIni.vEmp.vUsarMargemMinProd = 'S' then
  begin
    if Produto.dataSet.FieldByName('PERC_TB_PROD').AsFloat > 99 then
    begin
      ShowMessage('Definido para usar margem mínima, não permitido maior que 99%');
      if (Produto.cadastroSimplificado) and (Self.Enabled) and (Self.Visible) and (edMarkUpTb.CanFocus) then
        edMarkUpTb.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit35.CanFocus) then
        DBEdit35.setfocus;
    end;
  end;
  }
end;

procedure TFrmCadProdutos.DBEdit39Change(Sender: TObject);
begin
  inherited;
	exibirInfConversaoSaida;
end;

procedure TFrmCadProdutos.DBEdit39Exit(Sender: TObject);
begin
  inherited;
	exibirInfConversaoSaida;
end;

procedure TFrmCadProdutos.DBEdit188Exit(Sender: TObject);
begin
  inherited;
  if Produto.dataSet.State in [dsInsert, dsEdit] then
  begin
    if not vDadosIni.strIn(Trim(Produto.dataSet.FieldByName('cst_pis_ent').AsString),
                           ['', '50', '51', '52', '53', '54', '55', '56',
                                '60', '61', '62', '63', '64', '65', '66', '67',
                                '70', '71', '72', '73', '74', '75', '98', '99']) then
    begin
      vDadosIni.ShowErro('CST de Entrada PIS COFIS inválido. Deixe em branco ou informe um dos seguintes valores:' + #13 +
                         '"50", "51", "52", "53", "54", "55", "56",'       + #13 +
                         '"60", "61", "62", "63", "64", "65", "66", "67",' + #13 +
                         '"70", "71", "72", "73", "74", "75", "98", "99"');
      if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
        TDBEdit(Sender).SetFocus;
    end;
  end;
end;

procedure TFrmCadProdutos.DBEdit18Exit(Sender: TObject);
var
  pr, mk: Double;
begin
  inherited;
  Produto.HandleAlteracaoPreco((Sender as TDBEdit).DataField);
  {
  Produto.HandleAlteracaoMarkupAtacado;
  if vDadosIni.vEmp.vALT_PERC_MARGEM = 'S' then
  begin
    if Produto.ffloat('PERC_TB_PRODA') <> 0 then
    begin
      pr := RoundTo((Produto.ffloat('PREC_CUSM_PROD') + ((Produto.ffloat('PREC_CUSM_PROD') * Produto.ffloat('PERC_TB_PRODA')) / 100)), 0 - vDadosIni.vEmp.vCasasDecimais);
      mk := (pr - Produto.ffloat('PREC_CUSM_PROD')) / Produto.ffloat('PREC_CUSM_PROD') * 100;
      //Mesmo ajuste da nota
      if RoundTo(mk, -2) < RoundTo(Produto.ffloat('PERC_TB_PRODA'), -2) then
        pr := pr + 0.01;

      Produto.dataSet.FieldByName('PREC_PUBLICO').AsFloat := pr;

      Produto.dataSet.FieldByName('PREC_PUBLICO').AsFloat := RoundTo((Produto.ffloat('PREC_CUSM_PROD') +
        ((Produto.ffloat('PREC_CUSM_PROD') * Produto.ffloat('PERC_TB_PRODA')) / 100)), 0 - vDadosIni.vEmp.vCasasDecimais);
    end;
  end;
  if vDadosIni.vEmp.vUsarMargemMinProd = 'S' then
  begin
    if Produto.dataSet.FieldByName('PERC_TB_PRODA').AsFloat > 99 then
    begin
      ShowMessage('Definido para usar margem mínima, não permitido maior que 99%');
      if (Produto.cadastroSimplificado) and (Self.Enabled) and (Self.Visible) and (edMarkUpAt.CanFocus) then
        edMarkUpAt.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
        DBEdit18.setfocus;
    end;
  end;
  }
end;

procedure TFrmCadProdutos.DBEdit195Exit(Sender: TObject);
var
  exp_ExisteContaContabil: Texp_ExisteContaContabil;
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if not vDadosIni.LoadPackage('pkSPED', vDadosIni.vSped.AHandle) then
    Exit;

  @exp_ExisteContaContabil := GetProcAddress(vDadosIni.vSped.AHandle, PChar('exp_ExisteContaContabil'));
  if not Assigned(exp_ExisteContaContabil) then
    Exit;

  if not exp_ExisteContaContabil(DBEdit195.Text, True) then
    if (Self.Enabled) and (Self.Visible) and (DBEdit195.CanFocus) then
	    DBEdit195.SetFocus;
end;

procedure TFrmCadProdutos.DBEdit195KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS_CONTABIL'));
    if vDadosIni.vPesquisa <> '' then
      with DBEdit195 do
        DataSource.DataSet.FieldByName(DataField).AsString := vDadosIni.vPesquisa;
  end
end;

procedure TFrmCadProdutos.DBEdit3Exit(Sender: TObject);
var
 vMensagem: string;
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not Produto.TestarCFOP(vMensagem) then
    begin
      Application.MessageBox(PChar(vMensagem), 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
        	DBEdit3.SetFocus;
    end;
end;

procedure TFrmCadProdutos.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if not vDadosIni.PesqPros('PRO019', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Exit;
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NAT_OP');
      if vDadosIni.vPesquisa <> '' then
        Produto.dataSet.FieldByName('CODIGO_NOP').asstring := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadProdutos.DBEdit48Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) then
    if not vDadosIni.TestarCst(Produto.dataSet.FieldByName('CST_PROD').AsString) then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit48.CanFocus) then
	      DBEdit48.SetFocus;
      exit;
    end;
end;

procedure TFrmCadProdutos.DBEdit54Exit(Sender: TObject);
begin
  inherited;
  Produto.vProdutosPrecoQtde.vTipoVenda._abreTipoVenda(
  	Produto.vProdutosPrecoQtde.dataSet.FieldByName('GRUPO_PROD').AsString,
    Produto.vProdutosPrecoQtde.dataSet.FieldByName('COD_PROD').AsString,
    Produto.vProdutosPrecoQtde.dataSet.FieldByName('QUANT').AsFloat);
end;

procedure TFrmCadProdutos.DBEdit55Exit(Sender: TObject);
var
  mk, pr: Double;
begin
  inherited;
  Produto.HandleAlteracaoPreco((Sender as TDBEdit).DataField);
  {
  Produto.HandleAlteracaoPrecoAtacado;
  if trim(vDadosIni.vEmp.vALT_PERC_MARGEM) = 'S' then
  begin
    if (Trim(DBEdit18.Text) <> '') and (Produto.ffloat('PREC_CUSM_PROD') > 0) and
      (produto.ffloat('PREC_PUBLICO') > 0) then
    begin
      mk := RoundTo( (((produto.ffloat('PREC_PUBLICO') - produto.ffloat('PREC_CUSM_PROD')) * 100) / produto.ffloat('PREC_CUSM_PROD')), -2);

      //Preco com o markup antigo
      pr := RoundTo(produto.ffloat('PREC_CUSM_PROD') * (1 + (Produto.ffloat('PERC_TB_PRODA') / 100)), 0 - vDadosIni.vEmp.vCasasDecimais) + 0.01;
      if RoundTo(produto.ffloat('PREC_PUBLICO'), 0 - vDadosIni.vEmp.vCasasDecimais) <> RoundTo(pr, 0 - vDadosIni.vEmp.vCasasDecimais) then
        Produto.dataSet.FieldByName('PERC_TB_PRODA').AsFloat := mk;
    end;
  end;
  }
end;

procedure TFrmCadProdutos.DBEdit56Exit(Sender: TObject);
begin
  inherited;
  if Produto.dataSet.FieldByName('PERC_TB_ATAC').AsCurrency > 99 then
  begin
    Application.MessageBox('Não permitido margem maior que 99%', 'Aviso', MB_OK + MB_ICONERROR +
      MB_DEFBUTTON1);
    if Produto.cadastroSimplificado then
    begin
    	if (Self.Enabled) and (Self.Visible) and (edMargMinAt.CanFocus) then
	      edMargMinAt.SetFocus;
    end
    else
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit56.CanFocus) then
	      DBEdit56.setfocus;
    end;
  end;
end;

procedure TFrmCadProdutos.DBEdit57Exit(Sender: TObject);
begin
  inherited;
  if Produto.dataSet.FieldByName('PERC_TB_VARE').AsCurrency > 99 then
  begin
    Application.MessageBox('Não permitido margem maior que 99%', 'Aviso', MB_OK + MB_ICONERROR +
      MB_DEFBUTTON1);
    if Produto.cadastroSimplificado then
    begin
    	if (Self.Enabled) and (Self.Visible) and (edMargMinVa.CanFocus) then
	      edMargMinVa.SetFocus;
    end
    else
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit57.CanFocus) then
	      DBEdit57.setfocus;
    end;
  end
  else if not Produto.cadastroSimplificado then
  begin
    TabSheet4.Show;
    if (Self.Enabled) and (Self.Visible) and (Dbedit32.CanFocus) then
	    Dbedit32.SetFocus;
  end;
end;

procedure TFrmCadProdutos.DBEdit59Exit(Sender: TObject);
var
 vMensagem: string;
begin
  inherited;
  if Produto.cadastroSimplificado then
    if (activecontrol = BitBtn_5) or (activecontrol = BitBtn_6) or (activecontrol = DBLookupComboBox11) then
      Exit;
  if not Produto.cadastroSimplificado then
    if (activecontrol = BitBtn5) or (activecontrol = BitBtn6) or (activecontrol = DBEdit16) or (activecontrol = DBLookupComboBox1) then
      Exit;

  if not Produto.CodBarra.Active then
    Produto.CodBarra.abreCodBarras(Produto.dataSet.FieldByName('GRUPO_PROD').OldValue,
      trim(Produto.dataSet.FieldByName('COD_PROD').OldValue));
  if not Produto.VerificaNumFabProd(vMensagem) then
  begin
    if Produto.cadastroSimplificado then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit119.CanFocus) then
	      DBEdit119.SetFocus;
    end
    else
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit59.CanFocus) then
	      DBEdit59.SetFocus;
    end;
    exit;
  end;
  if Produto.CodBarra.JaExisteCodBarras(Produto) then
  begin
    if Produto.cadastroSimplificado then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit119.CanFocus) then
	      DBEdit119.SetFocus;
    end
    else
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit59.CanFocus) then
	      DBEdit59.SetFocus;
    end;
    exit;
  end
  else if (vDadosIni.vEmp.vUsarCodigoSequencialProduto <> 'S') and (Produto.dataSet.State = dsInsert) then
  begin
    if not Produto.gravar then
    begin
      Application.MessageBox('O cadastro não pode ser realizado.' + chr(13) +
        'Verifique as possíveis causas e tente novamente.', 'Aviso', MB_OK + MB_ICONERROR +
        MB_DEFBUTTON1);
      if Produto.cadastroSimplificado then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBEdit119.CanFocus) then
	        DBEdit119.SetFocus;
      end
      else
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBEdit59.CanFocus) then
	        DBEdit59.SetFocus;
      end;
      exit;
    end;
    Produto.dataSet.Edit;
  end;

  if vDadosIni.vSupermercado = 'S' then
    Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString :=
      vDadosIni.StrZero(Trim(produto.dataSet.FieldByName('NUM_FAB_PROD').AsString), 13);

  if not Produto.CodBarra.GeraCodBarras(Produto) then
  begin
    if Produto.cadastroSimplificado then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit119.CanFocus) then
	      DBEdit119.SetFocus;
    end
    else
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit59.CanFocus) then
	      DBEdit59.SetFocus;
    end;
    exit;
  end;
end;

procedure TFrmCadProdutos.DBEdit60Exit(Sender: TObject);
begin
  inherited;
  Produto.HandleAlteracaoPreco((Sender as TDBEdit).DataField);
  {
  if (Produto.dataSet.FieldByName('PREC_30_PROD').AsFloat > 0) and
    (Produto.dataSet.FieldByName('MAX_DESC_ITEM').AsFloat > 0) and
    (vDadosIni.vProduto.vMaxDescPrecoAVista = 'S') then
    Produto.dataSet.FieldByName('PREC_TAB_PROD').AsFloat := RoundTo(
      Produto.dataSet.FieldByName('PREC_30_PROD').AsFloat -
      (Produto.dataSet.FieldByName('PREC_30_PROD').AsFloat *
      Produto.dataSet.FieldByName('MAX_DESC_ITEM').AsFloat / 100), -2);
      }
end;

procedure TFrmCadProdutos.DBEdit63Exit(Sender: TObject);
begin
  inherited;

  if Produto.pesquisaNCM then
  begin
    if Produto.valiqintrapesq <> 0 then
      Produto.dataSet.FieldByName('ICM_PROD').ascurrency := Produto.valiqintrapesq;

    Fconf_cest := vDadosIni.getConfSisObject('nf_icmsst_cest_v2', Produto.buscas);

    if Fconf_cest.value1_f = 1 then
    begin
      Produto.OnCestChange := CestChangecompativel;
      try
        Produto.ChecarCestCompativel;
      finally
        Produto.OnCestChange := nil;
      end;
    end
    else
    if produto.vCEST <> '' then
      Produto.dataSet.FieldByName('CEST').AsString := Produto.vCEST;
    if produto.vCodEnqIPI <> '' then
      Produto.dataSet.FieldByName('CENQ_IPI_NFE').AsString := Produto.vCodEnqIPI;

    //Função para atualizar as informações do pis e cofins
    Produto.Nbm.abreNBM(DBEdit63.Text);

    if ((Trim(Produto.Nbm.dataSet.FieldByName('CST_PIS_ENT').AsString) = '') or
      (Trim(Produto.Nbm.dataSet.FieldByName('CST_COFINS_ENT').AsString) = '') or
      (Trim(Produto.Nbm.dataSet.FieldByName('CST_PIS').AsString) = '') or
      (Trim(Produto.Nbm.dataSet.FieldByName('CST_COFINS').AsString) = '')) then
      exit;

    if ((Produto.dataSet.FieldByName('CST_PIS_ENT').AsString =
      Produto.Nbm.dataSet.FieldByName('CST_PIS_ENT').AsString) and
      (Produto.dataSet.FieldByName('CST_COFINS_ENT').AsString =
      Produto.Nbm.dataSet.FieldByName('CST_COFINS_ENT').AsString) and
      (Produto.dataSet.FieldByName('CST_PIS').AsString =
      Produto.Nbm.dataSet.FieldByName('CST_PIS').AsString) and
      (Produto.dataSet.FieldByName('CST_COFINS').AsString =
      Produto.Nbm.dataSet.FieldByName('CST_COFINS').AsString)) then
      exit;

    if Application.MessageBox('Deseja atualizar as informações de pis e cofins?',
      'Atualizar Informações', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
      exit;

    Produto.dataSet.FieldByName('CST_PIS_ENT').AsString    := Produto.Nbm.dataSet.FieldByName('CST_PIS_ENT').AsString;
    Produto.dataSet.FieldByName('CST_COFINS_ENT').AsString := Produto.Nbm.dataSet.FieldByName('CST_COFINS_ENT').AsString;
    Produto.dataSet.FieldByName('CST_PIS').AsString        := Produto.Nbm.dataSet.FieldByName('CST_PIS').AsString;
    Produto.dataSet.FieldByName('CST_COFINS').AsString     := Produto.Nbm.dataSet.FieldByName('CST_COFINS').AsString;
    Produto.dataSet.FieldByName('NAT_REC').AsString        := Produto.Nbm.dataSet.FieldByName('NAT_REC').AsString;
    DBEdit85.Field.AsFloat := Produto.Nbm.dataSet.FieldByName('ALIQ_PIS_DIFERENCIADA').AsFloat;
    DBEdit94.Field.AsFloat := Produto.Nbm.dataSet.FieldByName('ALIQ_CRED_PIS').AsFloat;
    DBEdit88.Field.AsFloat := Produto.Nbm.dataSet.FieldByName('ALIQ_COFINS_DIFERENCIADA').AsFloat;
    DBEdit95.Field.AsFloat := Produto.Nbm.dataSet.FieldByName('ALIQ_CRED_COFINS').AsFloat;
    DBEdit32.Field.AsFloat := Produto.Nbm.dataSet.FieldByName('ALIQ_INTRA').AsFloat;
  end
  else
    Application.MessageBox('NCM não encontrado no cadastro', 'Alerta', MB_OK
      +
      MB_ICONWARNING + MB_DEFBUTTON1);
end;

procedure TFrmCadProdutos.DBEdit63KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('PRO019', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
      //    if vDadosIni.PesqPros('PRO019', '', produto.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NBM');
        if vDadosIni.vPesquisa <> '' then
          Produto.dataSet.FieldByName('NBM').asstring := vDadosIni.vPesquisa;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('PRO025', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
      //    if vDadosIni.PesqPros('PRO025', '', produto.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := Produto.dataSet.FieldByName('NBM').asstring;
        Produto.CadNbm(1);
        if vDadosIni.vPesquisa <> '' then
          Produto.dataSet.FieldByName('NBM').asstring := vDadosIni.vPesquisa;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadProdutos.DBEdit73Exit(Sender: TObject);
begin
  inherited;
  if Produto.dataSet.FieldByName('COD_MARCA').asinteger <> 0 then
    Produto.dataSet.FieldByName('MARCA_P').AsString :=
      Produto.RetornaMarca(Produto.dataSet.FieldByName('COD_MARCA').asinteger);
end;

procedure TFrmCadProdutos.DBEdit73KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Marca: TMarcas;
begin
  try
    Screen.Cursor := crHourGlass;
    inherited;
    if Key = VK_F3 then
    begin
      if not vDadosIni.PesqPros('PRO025', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
        Exit;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('MARCA_PROD');
      if vDadosIni.vPesquisa <> '' then
      begin
        Produto.dataSet.FieldByName('COD_MARCA').asinteger := strtoint(vDadosIni.vPesquisa);
        Produto.dataSet.FieldByName('MARCA_P').AsString := Produto.RetornaMarca(strtoint(vDadosIni.vPesquisa));
      end;
    end;
    if Key = VK_F4 then
    begin
      if not vDadosIni.PesqPros('PRO026', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
        Exit;

      Marca := Tmarcas.create;
      Marca.abreMarcas;
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := 'CADMARCA|0|' + DBEdit123.Text + '|';
      Marca.CadMarcas(1);
      if (Pos('CADMARCA|', vDadosIni.vPesquisa) > 0) and (Pos('CADMARCA|0|', vDadosIni.vPesquisa) = 0) then
      begin
        if (Self.Enabled) and (Self.Visible) and (DBEdit73.CanFocus) then
          DBEdit73.SetFocus;
        if produto.cadastroSimplificado then
	        Produto.vLKMarca.dataSet.Refresh;
        Produto.dataSet.FieldByName('COD_MARCA').AsInteger := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,2));
        Produto.dataSet.FieldByName('MARCA_P').AsString := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
      end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.DBEdit78Exit(Sender: TObject);
begin
  inherited;

//  if (vDadosIni.vEmp.vBuscaCodNoProduto = 'S')
//  	or ((vDadosIni.vEcommerce.vHabilitarEcommerce) and (vDadosIni.vEcommerce.vHabilitarGradeCodBarras)) then
//    exit;

  if ((not Produto.cadastroSimplificado) and (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6)) or
     ((Produto.cadastroSimplificado) and (activecontrol <> BitBtn_5) and (activecontrol <> BitBtn_6)) then
    if Produto._produtoPossuiGrade(Produto.fint('grupo_prod'), Produto.fstr('cod_prod')) then
    begin
      if Produto.cadastroSimplificado then
        if (Self.Enabled) and (Self.Visible) and (DBEdit133.CanFocus) then
          DBEdit133.SetFocus;

      if not Produto.cadastroSimplificado then
        if (Self.Enabled) and (Self.Visible) and (DBEdit109.CanFocus) then
          DBEdit109.SetFocus;
      exit;
    end;

  if Produto.CodBarra.dataSet.State in [dsInsert, dsEdit] then
    Produto.CodBarra.TrataCodBarras(Produto,
      Produto.CodBarra.dataSet.FieldByName('COD_BARRA').AsString, Produto.CodBarra.dataSet.FieldByName('COD_GRADE').AsString);
  DBEdit78.Enabled := false;
  DBEdit109.Enabled := false;
  DBEdit118.Enabled := False;
  DBEdit133.Enabled := False;
end;

procedure TFrmCadProdutos.DBEdit86Enter(Sender: TObject);
begin
  inherited;
  if not (Produto.vRed.dataSet.State in [dsInsert, dsEdit]) then
    if PageControl1.ActivePage = tsReducao then
    	if (Self.Enabled) and (Self.Visible) and (DBGrid10.CanFocus) then
	      DBGrid10.SetFocus;
end;

procedure TFrmCadProdutos.DBEdit89Exit(Sender: TObject);
begin
  inherited;
//  if Produto.vGradeEst.dataSet.State in [dsEdit, dsInsert] then
//  begin
//    if not vDadosIni.PesqPros('PRO086', 'GRAVAR', '', 'COD_GRADE_PROD',
//      Produto.vGradeEst.dataSet.FieldByName('COD_GRADE').AsString, Produto.buscas, true) then
//      Exit;
//    if not Produto.vGradeEst.Post then
//      Exit;
//    if (Self.Enabled) and (Self.Visible) and (DBGrid14.CanFocus) then
//      DBGrid14.SetFocus;
//  end;
end;

procedure TFrmCadProdutos.DBEdit89KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  vRecNo: Integer;
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
    BitBtn74.Enabled := True;
    BitBtn75.Enabled := True;
    BitBtn79.Enabled := True;
    DBGrid14.Enabled := True;
    BitBtn74.Enabled := True;
    BitBtn74.Enabled := True;
    BitBtn118.Enabled := False;

    vRecNo := Produto.dataSet.RecNo;

    Produto.dataSet.Refresh;

    Produto.dataSet.RecNo := vRecNo;


    vRecNo := Produto.vGradeEst.dataSet.RecNo;
    Produto.vGradeEst.abreGradeEstoque(Produto.dataSet.FieldByName('grupo_prod').AsString,
      Produto.dataSet.FieldByName('cod_prod').AsString);
    Produto.vGradeEst.vGrade.dataSet.Filtered := false;
    Produto.vGradeEst.vGrade.dataSet.Filter := ' cod_grade<>0 ';
    Produto.vGradeEst.vGrade.dataSet.Filtered := true;
    Produto.vGradeEst.dataSet.RecNo := vRecNo;

  end;
end;

procedure TFrmCadProdutos.DBEdit8Exit(Sender: TObject);
var
  mk, pr: Double;
begin
  inherited;
  Produto.HandleAlteracaoPreco((Sender as TDBEdit).DataField);
  {
  Produto.HandleAlteracaoPrecoVarejo;
  if trim(vDadosIni.vEmp.vALT_PERC_MARGEM) = 'S' then
  begin
    //  eu:=((QRYProdutosPREC_TAB_PROD.value-QRYProdutosPREC_CUS_PROD.value)*100);
    //  eu:=eu/QRYProdutosPREC_CUS_PROD.value;
    if (Trim(DBEdit35.Text) <> '') and (Produto.ffloat('PREC_CUSM_PROD') > 0) and
       (produto.ffloat('PREC_TAB_PROD') > 0) then
    begin
      //Markup calculado
      mk := RoundTo( (((produto.ffloat('PREC_TAB_PROD') - produto.ffloat('PREC_CUSM_PROD')) * 100) / produto.ffloat('PREC_CUSM_PROD')), -2);

      //Preco com o markup antigo
      pr := RoundTo(produto.ffloat('PREC_CUSM_PROD') * (1 + (Produto.ffloat('PERC_TB_PROD') / 100)), 0 - vDadosIni.vEmp.vCasasDecimais) + 0.01;
      if RoundTo(produto.ffloat('PREC_TAB_PROD'), 0 - vDadosIni.vEmp.vCasasDecimais) <> RoundTo(pr, 0 - vDadosIni.vEmp.vCasasDecimais) then
        Produto.dataSet.FieldByName('PERC_TB_PROD').AsFloat := mk;
    end;
    if (Trim(DBEdit57.Text) <> '') and (Produto.ffloat('PREC_CUSM_PROD') > 0) and
       (produto.ffloat('PREC_TAB_PROD') > 0) then
    begin
      Produto.dataSet.FieldByName('PERC_TB_VARE').AsFloat := RoundTo(
        (((produto.ffloat('PREC_TAB_PROD') -
        produto.ffloat('PREC_CUSM_PROD')) * 100) /
        produto.ffloat('PREC_TAB_PROD')), -2);
    end;
  end;
  // Preço 30 dias
  if (not produto.dataSet.FieldByName('PERC_AD_30').isnull) and
    (Produto.ffloat('PERC_AD_30') <> 0) then
    produto.dataSet.FieldByName('PREC_30_PROD').AsFloat := RoundTo(
      produto.ffloat('PREC_TAB_PROD') +
      ((Produto.ffloat('PREC_TAB_PROD') *
        produto.ffloat('PERC_AD_30') ) / 100), -2);
  // Preço 60 dias
  if (not produto.dataSet.FieldByName('PERC_AD_60').isnull) and
    (Produto.ffloat('PERC_AD_60') <> 0) then
    produto.dataSet.FieldByName('PREC_60_PROD').AsFloat := RoundTo(
      produto.ffloat('PREC_TAB_PROD') +
      ((Produto.ffloat('PREC_TAB_PROD') *
      produto.ffloat('PERC_AD_60')) / 100), -2);
  // Preço 90 dias
  if (not produto.dataSet.FieldByName('PERC_AD_90').isnull) and
    (Produto.ffloat('PERC_AD_90') <> 0) then
    Produto.dataSet.FieldByName('PREC_90_PROD').AsFloat := RoundTo(
      produto.ffloat('PREC_TAB_PROD') +
      ((Produto.ffloat('PREC_TAB_PROD') *
      produto.ffloat('PERC_AD_90')) / 100), -2);
  }
end;

procedure TFrmCadProdutos.DBEdit92Exit(Sender: TObject);
begin
  inherited;
  Produto.existeInformacaoComplementar(Produto.dataSet.FieldByName('cod_inf').AsInteger);
  Memo2.Lines.Text := Produto.vTextoInfComplementar.Text;
  Memo1.Lines.Text := Produto.vTextoInfComplementar.Text;
end;

procedure TFrmCadProdutos.DBEdit92KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('SPED_INFORMACAO_COMPLEMENTAR'));
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        StrToInt(vDadosIni.vPesquisa);
      except
        Exit;
      end;
      Produto.existeInformacaoComplementar(StrToInt(vDadosIni.vPesquisa));
      Memo2.Lines.Text := Produto.vTextoInfComplementar.Text;
      Memo1.Lines.Text := Produto.vTextoInfComplementar.Text;
    end;
  end;
end;

procedure TFrmCadProdutos.DBEdit96Exit(Sender: TObject);
begin
  inherited;
  if vGrupoProdTemp <= 0 then
    vGrupoProdTemp := Produto.dataSet.FieldByName('GRUPO_PROD').AsInteger;
  if trim(vCodProdTemp) = '' then
    vCodProdTemp := Produto.dataSet.FieldByName('COD_PROD').AsString;
  if vCodPromocaoTemp <= 0 then
  	 vCodPromocaoTemp := Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger;

  if Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger > 0 then
  begin
    Produto.vPromocaoProduto.vTipoVenda._abreTipoVenda(IntToStr(Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger),
      Produto.vTipoPreco.dataSet.FieldByName('COD_TPPRECO').AsString,
      Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
      Produto.dataSet.FieldByName('COD_PROD').AsString);

    if (vGrupoProdTemp <> Produto.dataSet.FieldByName('GRUPO_PROD').AsInteger)
      or (vCodProdTemp <> Produto.dataSet.FieldByName('COD_PROD').AsString)
      or (vCodPromocaoTemp <> Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger) then
      begin
      	Produto.vPromocaoProduto.vTipoVenda.dataSet.First;
         Produto.vPromocaoProduto.vTipoVenda.dataSet.First;
         DBLookupComboBox7.Field.AsString := Produto.vPromocaoProduto.vTipoVenda.dataSet.FieldByName('sigla').AsString;
      end;
  end;

  if Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger > 0 then
  begin
    MaskEdit23.Text := FormatDateTime('dd/mm/yyyy', Produto.vPromocao.dataSet.FieldByName('DATA_INI').AsDateTime);
    MaskEdit25.Text := FormatDateTime('dd/mm/yyyy', Produto.vPromocao.dataSet.FieldByName('DATA_FIM').AsDateTime);
    MaskEdit24.Text := Produto.vPromocao.dataSet.FieldByName('HORA_INI').AsString;
    MaskEdit26.Text := Produto.vPromocao.dataSet.FieldByName('HORA_FIM').AsString;
  end
  else
  begin
    MaskEdit23.Text := '';
    MaskEdit25.Text := '';
    MaskEdit24.Text := '';
    MaskEdit26.Text := '';
  end;
  vGrupoProdTemp := Produto.dataSet.FieldByName('GRUPO_PROD').AsInteger;
  vCodProdTemp := Produto.dataSet.FieldByName('COD_PROD').AsString;
  vCodPromocaoTemp := Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger;
end;

procedure TFrmCadProdutos.DBEdit96KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if Key = VK_F3 then
 begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PROMOCAO', ' and not ((data_ini is null) or (data_fim is null)) ', 'Promoções');
    if trim(vDadosIni.vPesquisa) <> '' then
      DBEdit96.Field.AsString := vDadosIni.vPesquisa;
 end
 else if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('PRO224', 'INCLUIR', '', 'PROMOCAO', '', Produto.buscas, true) then
      //    if vDadosIni.PesqPros('PRO023', '', produto.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := inttostr(Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsInteger);
        Produto.vPromocao._cadPromocao(1);
        Produto.vPromocaoProduto.vPromocao._abrePromocao;
        Produto.vPromocaoProduto.vTipoPreco._abreTipoPrecoPromocao;
        if vDadosIni.vPesquisa <> '' then
          Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').asinteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end
end;

procedure TFrmCadProdutos.DBEditDescrECExit(Sender: TObject);
begin
	RemoveAcentosEspacos;
end;

procedure TFrmCadProdutos.DBEditTituloPagExit(Sender: TObject);
begin
	RemoveAcentosEspacos;
end;

procedure TFrmCadProdutos.DBGrid13CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	if not Produto.vGradeEst.vGrade.dataSet.IsEmpty then
      Produto.vGradeEst.vGrade._marcaDesmarcaLinha;
end;

procedure TFrmCadProdutos.DBGrid13ColEnter(Sender: TObject);
begin
  inherited;
  if DBGrid13.SelectedField.FieldName = 'EST_TEMP' then
  begin
    DBGrid13.Options := [dgEditing, dgTitles,dgIndicator,dgColumnResize,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
    DBGrid13.DataSource.AutoEdit := True;
  end;
end;

procedure TFrmCadProdutos.DBGrid13ColExit(Sender: TObject);
begin
  inherited;
  if DBGrid13.SelectedField.FieldName = 'EST_TEMP' then
  begin
    DBGrid13.Options := [dgTitles,dgIndicator,dgColumnResize,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
    DBGrid13.DataSource.AutoEdit := False;
  end;
end;

procedure TFrmCadProdutos.DBGrid13DrawColumnCell(Sender: TObject;
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

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmCadProdutos.DBGrid13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
  begin
    if not Produto.vGradeEst.vGrade.dataSet.IsEmpty then
      Produto.vGradeEst.vGrade._marcaDesmarcaLinha;
  end
  else if Key = VK_RETURN then
  begin
  	if (Self.Enabled) and (Self.Visible) and (BitBtn76.CanFocus) then
	    BitBtn76.SetFocus;
  end;
end;

procedure TFrmCadProdutos.DBGrid14DblClick(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit89.CanFocus) then
	  DBEdit89.SetFocus;
end;

procedure TFrmCadProdutos.DBGrid14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS_GRADES', 'A', Produto.buscas) then
      Exit;
    BitBtn75.Click;
  end;
end;

procedure TFrmCadProdutos.DBGrid15CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	Produto._marcaDesmarcaLinhaTemp(Produto.dtSetProdTemp);
end;

procedure TFrmCadProdutos.DBGrid15DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	if (TDBGrid(sender).DataSource.DataSet.FieldByName('sel').AsString = 'S') then
    with TDBGrid(sender).canvas do
    begin
    	Font.Color := clWindowText;
      if gdSelected in State then
        Brush.Color := clWindow
      else
        Brush.Color := clHighlight;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmCadProdutos.DBGrid15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_SPACE then
   Produto._marcaDesmarcaLinhaTemp(Produto.dtSetProdTemp);
end;

procedure TFrmCadProdutos.DBGrid16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if Label178.Caption <> 'PRODUTO NÃO ENCONTRADO' then
      Produto.vEtEs.addItem(Trim(EditFiscal1.Text), Trim(ComboBox44.Text));
    if (Self.Enabled) and (Self.Visible) and (EditFiscal1.CanFocus) then
	    EditFiscal1.SetFocus;
  end
  else if Key = VK_TAB then
  begin
  	if (Self.Enabled) and (Self.Visible) and (EditFiscal1.CanFocus) then
	    EditFiscal1.SetFocus;
  end
  else if key = VK_F5 then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid17.CanFocus) then
	    DBGrid17.SetFocus;
  end
  else if key = VK_F6 then
    SpeedButton27.Click
  else if key = VK_F7 then
    SpeedButton28.Click
  else if key = VK_ESCAPE then
    SpeedButton29.Click;
end;

procedure TFrmCadProdutos.DBGrid17CellClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
  	Produto.vEtEs._marcaDesmarcaLinha(DBGrid17.DataSource.DataSet);
end;

procedure TFrmCadProdutos.DBGrid17DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;    
begin
	if (TDBGrid(sender).DataSource.DataSet.FieldByName('sel').AsString = 'S') then
    with TDBGrid(sender).canvas do
    begin
      Font.Color := clWindowText;
      if gdSelected in State then
        Brush.Color := clWindow
      else
        Brush.Color := clHighlight;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

	if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmCadProdutos.DBGrid17KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    Produto.vEtEs._marcaDesmarcaLinha(DBGrid17.DataSource.DataSet)
  else if Key = VK_DELETE then
    Produto.vEtEs.deleteItem
  else if key = VK_F4 then
  begin
  	if (Self.Enabled) and (Self.Visible) and (EditFiscal1.CanFocus) then
	    EditFiscal1.SetFocus;
  end
  else if key = VK_F6 then
    SpeedButton27.Click
  else if key = VK_F7 then
    SpeedButton28.Click
  else if key = VK_ESCAPE then
    SpeedButton29.Click;
end;

procedure TFrmCadProdutos.DBGrid18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if Label186.Caption <> 'PRODUTO NÃO ENCONTRADO' then
      Produto.vEtiTer.addItem(Trim(EditFiscal2.Text));
    if (Self.Enabled) and (Self.Visible) and (EditFiscal2.CanFocus) then
	    EditFiscal2.SetFocus;
  end
  else if Key = VK_TAB then
  begin
  	if (Self.Enabled) and (Self.Visible) and (EditFiscal2.CanFocus) then
	    EditFiscal2.SetFocus;
  end
  else if key = VK_F5 then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid19.CanFocus) then
	    DBGrid19.SetFocus;
  end
  else if key = VK_F6 then
    SpeedButton20.Click
  else if key = VK_F7 then
    SpeedButton31.Click
  else if key = VK_ESCAPE then
    SpeedButton32.Click;
end;

procedure TFrmCadProdutos.DBGrid19CellClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
  	Produto.vEtiTer._marcaDesmarcaLinha(DBGrid19.DataSource.DataSet);
end;

procedure TFrmCadProdutos.DBGrid19DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;    
begin
	if (TDBGrid(sender).DataSource.DataSet.FieldByName('sel').AsString = 'S') then
    with TDBGrid(sender).canvas do
    begin
      Font.Color := clWindowText;
      if gdSelected in State then
        Brush.Color := clWindow
      else
        Brush.Color := clHighlight;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

	if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmCadProdutos.DBGrid19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    Produto.vEtiTer._marcaDesmarcaLinha(DBGrid19.DataSource.DataSet)
  else if Key = VK_DELETE then
    Produto.vEtiTer.deleteItem
  else if key = VK_F4 then
  begin
  	if (Self.Enabled) and (Self.Visible) and (EditFiscal2.CanFocus) then
	    EditFiscal2.SetFocus;
  end
  else if key = VK_F6 then
    SpeedButton20.Click
  else if key = VK_F7 then
    SpeedButton31.Click
  else if key = VK_ESCAPE then
    SpeedButton32.Click;
end;

procedure TFrmCadProdutos.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    Produto._marcaDesmarcaLinha;
end;

procedure TFrmCadProdutos.DBGrid1ColEnter(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedField.FieldName = 'SEL' then
    DBGrid1.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,
      dgConfirmDelete, dgCancelOnExit{, dgMultiSelect}];
end;

procedure TFrmCadProdutos.DBGrid1ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
//  if (PageControl1.ActivePage = TabSheet2) then
    inherited;
end;

procedure TFrmCadProdutos.DBGrid1DblClick(Sender: TObject);
begin
  if (PageControl1.ActivePage = TabSheet2) then
    inherited;
end;

procedure TFrmCadProdutos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if (PageControl1.ActivePage = TabSheet2)
  	or (PageControl1.ActivePage = tsDefinirPromocoes)
    or (PageControl1.ActivePage = tsDefinirPrecoDiferenciado)
    or (PageControl1.ActivePage = tsAlterDadosProd) then
  begin
  	if (UpperCase(Column.Field.Dataset.FieldbyName('CONSUMO').AsString) = 'S')
    	and (TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString <> 'S') then
    begin
      if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := pnConsumoCor.Color;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
    else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('FORA_LINHA').AsString)) = 'S')
    	and (TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString <> 'S') then
    begin
      if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := pnForaLinhaCor.Color;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
    else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('FORA_LINHA').AsString)) = 'S')
    	and (TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString <> 'S') then
    begin
      if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := pnForaLinhaCor.Color;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
    else if (ckEstoqueDisponivel.Checked)
    	and (vDadosIni.vEmp.vUsarProducao = 'S')
    	and (TDBGrid(sender).DataSource.DataSet.FieldByName('ESTOQUE').AsFloat +
      		 TDBGrid(sender).DataSource.DataSet.FieldByName('EST_PRIMA').AsFloat <=
             TDBGrid(sender).DataSource.DataSet.FieldByName('N_MIN_PROD').AsFloat) then
    begin
    	if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := pnEstoqueMinimoCor.Color;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
    else if (ckEstoqueDisponivel.Checked)
    	and (vDadosIni.vEmp.vUsarProducao <> 'S')
    	and (TDBGrid(sender).DataSource.DataSet.FieldByName('ESTOQUE').AsFloat <=
						 TDBGrid(sender).DataSource.DataSet.FieldByName('N_MIN_PROD').AsFloat) then
    begin
    	if (gdFocused in State) then
      begin
        TDBGrid(sender).canvas.brush.color := clWindow;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end
      else
      begin
        TDBGrid(sender).canvas.brush.color := pnEstoqueMinimoCor.Color;
        TDBGrid(sender).canvas.Font.color := clWindowText;
      end;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end;
  end;

  if PageControl1.ActivePage = tsAlterDadosProd then
  begin
    if pnCorLote.Visible then
      if (trim(TDBGrid(sender).DataSource.dataSet.FieldByName('COD_PROD').AsString) <> '')
        and (TDBGrid(sender).DataSource.dataSet.FieldByName('GRUPO_PROD').AsInteger <= 0) then
        if (gdFocused in State) then
          begin
            TDBGrid(sender).canvas.brush.color := clWindow;
            TDBGrid(sender).canvas.Font.color := clWindowText;
          end
          else
          begin
            TDBGrid(sender).canvas.brush.color := pnCorLote.Color;
            TDBGrid(sender).canvas.Font.color := clBlack;
          end;
      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;

//  if (PageControl1.ActivePage = tsDefinirPromocoes)
//  	and (TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString <> 'S') then
//  begin
//    if gdSelected in State then
//    begin
//      TDBGrid(sender).canvas.brush.color := clBtnText;
//      TDBGrid(sender).canvas.Font.color := clWindowText;
//    end;
//  end
//  else if (PageControl1.ActivePage = tsDefinirPrecoDiferenciado)
//  	and (TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString <> 'S') then
//  begin
//    if gdSelected in State then
//    begin
//      TDBGrid(sender).canvas.brush.color := clBtnText;
//      TDBGrid(sender).canvas.font.color := clWindowText;
//    end;
//  end
//  else
  if ((vDadosIni.vProduto.GridConsultaLinhaSelecionada)
  	and (THackDBGrid(Sender).DataLink.ActiveRecord = THackDBGrid(Sender).Row - 1))
    		or (TDBGrid(sender).DataSource.DataSet.FieldByName('sel').AsString = 'S') then

  begin
  	if (UpperCase(Column.Field.Dataset.FieldbyName('CONSUMO').AsString) = 'S')
    	and ((Column.FieldName = 'SEL')
      	or (Column.FieldName = 'GRUPO_PROD')
        or (Column.FieldName = 'COD_PROD')
        or (Column.FieldName = 'NUM_FAB_PROD')) then
    begin
      TDBGrid(sender).canvas.brush.color := pnConsumoCor.Color;
      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('FORA_LINHA').AsString)) = 'S')
    	and ((Column.FieldName = 'SEL')
      	or (Column.FieldName = 'GRUPO_PROD')
        or (Column.FieldName = 'COD_PROD')
        or (Column.FieldName = 'NUM_FAB_PROD')) then
    begin
    	TDBGrid(sender).canvas.brush.color := pnForaLinhaCor.Color;
      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else if (ckEstoqueDisponivel.Checked)
    	and (vDadosIni.vEmp.vUsarProducao = 'S')
    	and (TDBGrid(sender).DataSource.DataSet.FieldByName('ESTOQUE').AsFloat +
      		 TDBGrid(sender).DataSource.DataSet.FieldByName('EST_PRIMA').AsFloat <=
             TDBGrid(sender).DataSource.DataSet.FieldByName('N_MIN_PROD').AsFloat)
      and ((Column.FieldName = 'SEL')
      	or (Column.FieldName = 'GRUPO_PROD')
        or (Column.FieldName = 'COD_PROD')
        or (Column.FieldName = 'NUM_FAB_PROD')) then
    begin
    	TDBGrid(sender).canvas.brush.color := pnEstoqueMinimoCor.Color;
      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else if (ckEstoqueDisponivel.Checked)
    	and (vDadosIni.vEmp.vUsarProducao <> 'S')
    	and (TDBGrid(sender).DataSource.DataSet.FieldByName('ESTOQUE').AsFloat <=
						 TDBGrid(sender).DataSource.DataSet.FieldByName('N_MIN_PROD').AsFloat)
      and ((Column.FieldName = 'SEL')
      	or (Column.FieldName = 'GRUPO_PROD')
        or (Column.FieldName = 'COD_PROD')
        or (Column.FieldName = 'NUM_FAB_PROD')) then
    begin
      TDBGrid(sender).canvas.brush.color := pnEstoqueMinimoCor.Color;
      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end
    else
    begin
      if gdSelected in State then
        TDBGrid(sender).canvas.brush.Color := clMenuHighlight
      else
        TDBGrid(sender).canvas.brush.Color := TColor($00DAD5D3); //clHighlight;
    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmCadProdutos.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  {if (key = VK_RETURN) and (TelaCadastro = 1) then
  begin
    vDadosIni.vPesquisa := Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString;
    FrmCadProdutos.Close;
  end
  else}
  vDadosIni.vCtrlClick := Key = VK_CONTROL;

  if Key = VK_SPACE then
    if not Produto.dataSet.IsEmpty then
      Produto._marcaDesmarcaLinha;

  if (key = VK_RETURN) and (PageControl1.ActivePage = TabSheet2) then
    SpeedButton1Click(Sender)
  else if (key = VK_DELETE) and (PageControl1.ActivePage = TabSheet2) then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) and (PageControl1.ActivePage = TabSheet2) then
    BitBtn3Click(Sender)
  else if (key = VK_RETURN) and (PageControl1.ActivePage = tsAlterDadosProd) then
    SpeedButtonAlterarProdutoClick(Sender)
  else if (key = VK_DELETE) and (PageControl1.ActivePage = tsAlterDadosProd) then
  	SpeedButton2Click(Sender)
  else if (key = VK_SPACE) then
    Produto.seleciona;
end;

procedure TFrmCadProdutos.DBGrid1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  inherited;
  if PageControl1.ActivePage <> TabSheet2 then
    PopupMenu1.Items[0].Visible := false
  else PopupMenu1.Items[0].Visible := true;
end;

procedure TFrmCadProdutos.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    Produto._marcaDesmarcaLinha;
end;

procedure TFrmCadProdutos.DBGrid1TitleClick(Column: TColumn);
begin
//  if (PageControl1.ActivePage = TabSheet2) then
//  begin
    inherited;
    configuraCamposCodProd((Column.FieldName = 'COD_PROD') and (vDadosIni.vCtrlClick));
//  end;
end;

procedure TFrmCadProdutos.DBGrid20TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid20, Column);
end;

procedure TFrmCadProdutos.DBGrid21TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid21, Column);
end;

procedure TFrmCadProdutos.DBGrid22CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
  begin
    DBGrid22.DataSource.DataSet.Edit;
    if DBGrid22.DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
    	DBGrid22.DataSource.DataSet.FieldByName('SEL').AsString := ''
    else
    	DBGrid22.DataSource.DataSet.FieldByName('SEL').AsString := 'S';
    DBGrid22.DataSource.DataSet.Post;
  end;
end;

procedure TFrmCadProdutos.DBGrid22DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
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
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmCadProdutos.DBGrid22KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_SPACE) then
  begin
    DBGrid22.DataSource.DataSet.Edit;
    if DBGrid22.DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
    	DBGrid22.DataSource.DataSet.FieldByName('SEL').AsString := ''
    else
    	DBGrid22.DataSource.DataSet.FieldByName('SEL').AsString := 'S';
    DBGrid22.DataSource.DataSet.Post;
  end
	else if (key = VK_RETURN) then
    BitBtn130Click(Sender)
  else if (key = VK_DELETE) then
    BitBtn90Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn89Click(Sender);
end;

procedure TFrmCadProdutos.DBGrid23CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	Produto.vPromocaoProduto._marcaDesmarcaLinha;
end;

procedure TFrmCadProdutos.DBGrid23DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00DAD5D3); //clHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmCadProdutos.DBGrid23KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_INSERT) then
    BitBtn92Click(Sender)
  else if (Key = VK_RETURN) then
    BitBtn92Click(Sender)
  else if (Key = VK_DELETE) then
    BitBtn94Click(Sender)
  else if Key = VK_SPACE then
  	Produto.vPromocaoProduto._marcaDesmarcaLinha;
end;

procedure TFrmCadProdutos.DBGrid23TitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(DBGrid23, Column);
end;

procedure TFrmCadProdutos.DbGrid24CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    Produto.vRegiao._marcaDesmarcaLinha;
end;

procedure TFrmCadProdutos.DbGrid24ColEnter(Sender: TObject);
begin
  inherited;
  if DBGrid24.SelectedField.FieldName = 'SEL' then
    DBGrid24.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,
      dgConfirmDelete, dgCancelOnExit];
end;

procedure TFrmCadProdutos.DbGrid24DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if (Edit3.Text <> '') then
  begin
    if gdSelected in State then
    begin
      TDBGrid(sender).canvas.brush.color := clBtnText;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;         
end;

procedure TFrmCadProdutos.DbGrid24KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    Produto.vRegiao._marcaLinha
  else if Key = VK_F3 then
    Produto.vRegiao._desmarcaLinha
  else if Key = VK_SPACE then
    if not Produto.vRegiao.dataSet.IsEmpty then
      Produto.vRegiao._marcaDesmarcaLinha;
end;

procedure TFrmCadProdutos.DbGrid24MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    Produto.vRegiao._marcaDesmarcaLinha;
end;

procedure TFrmCadProdutos.DbGrid24TitleClick(Column: TColumn);
begin
  inherited;
  Produto.vRegiao.dataSet.IndexFieldNames := Column.FieldName;
end;

procedure TFrmCadProdutos.DBGrid25DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_INI').IsNull)
  	and (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_FIM').IsNull)
  	and (TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_INI').AsDateTime >= Date)
  	and (TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_FIM').AsDateTime <= Date) then
  	// Não vencida
  else if (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_INI').IsNull)
  	and (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_FIM').IsNull)
    and (Date >= TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_FIM').AsDateTime) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := pnCorPromocao.Color;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadProdutos.DBGrid25KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  vDadosIni.vShiftClick := Key = VK_SHIFT;

  if (Key = VK_INSERT) then
    BitBtn97Click(Sender)
  else if (Key = VK_RETURN) then
    BitBtn101Click(Sender)
  else if (Key = VK_DELETE) then
  	BitBtn99Click(Sender)
  else if (Key = VK_INSERT) then
  	BitBtn97Click(Sender);
end;

procedure TFrmCadProdutos.DBGrid25TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid25, Column);
end;

procedure TFrmCadProdutos.DBGrid26KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if (key = VK_RETURN) then
    BitBtn143Click(Sender)
  else if (key = VK_DELETE) then
    BitBtn106Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn107Click(Sender);
end;

procedure TFrmCadProdutos.DBGrid27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_DELETE) then
    BitBtn108Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn105Click(Sender);
end;

procedure TFrmCadProdutos.DBGrid28DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_INI').IsNull)
  	and (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_FIM').IsNull)
  	and (TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_INI').AsDateTime >= Date)
  	and (TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_FIM').AsDateTime <= Date) then
  	// Não vencida
  else if (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_INI').IsNull)
  	and (not TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_FIM').IsNull)
    and (Date >= TDBGrid(sender).DataSource.dataSet.FieldByName('DATA_FIM').AsDateTime) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := pnCorDif.Color;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadProdutos.DBGrid28KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  vDadosIni.vShiftClick := Key = VK_SHIFT;

  if (Key = VK_INSERT) then
  	BitBtn110Click(Sender)
  else if (Key = VK_RETURN) then
    BitBtn113Click(Sender)
  else if (Key = VK_DELETE) then
  	BitBtn111Click(Sender)
  else if (Key = VK_INSERT) then
  	BitBtn110Click(Sender);
end;

procedure TFrmCadProdutos.DBGrid28TitleClick(Column: TColumn);
begin
  inherited;
vDadosIni.DBGridOnTitleClick(DBGrid25, Column);
end;

procedure TFrmCadProdutos.DBGrid29DblClick(Sender: TObject);
begin
  inherited;
  if mkTipo.text <> '' then
  begin
    if (pos(copy(mkTipo.text, 1, 1), ',') <> 0) then
      mkTipo.text := StringReplace(mkTipo.text, ',', '(', [rfIgnoreCase]);
    if (pos(copy(mkTipo.text, 1, 1), '(') = 0) then
      mkTipo.text := '(' + mkTipo.text;
    if (pos(copy(mkTipo.text, length(mkTipo.text), 1), ')') = 0) then
      mkTipo.text := mkTipo.text + ')';
  end;
  if (pos(mkTipo.text, '(' + Produto.vRegiao.dataSet.FieldByName('CODIGO').asstring + ')') <>
    0) then
  begin
    mkTipo.text := StringReplace(mkTipo.text, '(' +
      Produto.vRegiao.dataSet.FieldByName('CODIGO').asstring + ')', '', [rfIgnoreCase]);
    exit;
  end;
  if (pos(',' + Produto.vRegiao.dataSet.FieldByName('CODIGO').asstring + ')', mkTipo.text) <>
    0) then
  begin
    mkTipo.text := StringReplace(mkTipo.text, trim(',' +
      Produto.vRegiao.dataSet.FieldByName('CODIGO').asstring + ')'), ')', [rfIgnoreCase]);
    exit;
  end;
  if (pos(',' + Produto.vRegiao.dataSet.FieldByName('CODIGO').asstring + ',', mkTipo.text) <>
    0) then
  begin
    mkTipo.text := StringReplace(mkTipo.text, ',' +
      Produto.vRegiao.dataSet.FieldByName('CODIGO').asstring + ',', ',', [rfIgnoreCase]);
    exit;
  end;
  if (pos('(' + Produto.vRegiao.dataSet.FieldByName('CODIGO').asstring + ',', mkTipo.text) <>
    0) then
  begin
    mkTipo.text := StringReplace(mkTipo.text, '(' +
      Produto.vRegiao.dataSet.FieldByName('CODIGO').asstring + ',', '(', [rfIgnoreCase]);
    exit;
  end;

  if mkTipo.text <> '' then
    mkTipo.text := copy(mkTipo.text, 1, pos(')', mkTipo.text) - 1)
      + ',' + Produto.vRegiao.dataSet.FieldByName('CODIGO').asstring + ')'
  else
    mkTipo.text := mkTipo.text + '(' + Produto.vRegiao.dataSet.FieldByName('CODIGO').asstring
      + ')';
end;

procedure TFrmCadProdutos.DBGrid29KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    DBGrid29DblClick(Sender);
end;

procedure TFrmCadProdutos.DBGrid30DblClick(Sender: TObject);
begin
  inherited;
  if mkPromocao.text <> '' then
  begin
    if (pos(copy(mkPromocao.text, 1, 1), ',') <> 0) then
      mkPromocao.text := StringReplace(mkPromocao.text, ',', '(', [rfIgnoreCase]);
    if (pos(copy(mkPromocao.text, 1, 1), '(') = 0) then
      mkPromocao.text := '(' + mkPromocao.text;
    if (pos(copy(mkPromocao.text, length(mkPromocao.text), 1), ')') = 0) then
      mkPromocao.text := mkPromocao.text + ')';
  end;
  if (pos(mkPromocao.text, '(' + Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').asstring + ')') <>
    0) then
  begin
    mkPromocao.text := StringReplace(mkPromocao.text, '(' +
      Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').asstring + ')', '', [rfIgnoreCase]);
    exit;
  end;
  if (pos(',' + Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').asstring + ')', mkPromocao.text) <>
    0) then
  begin
    mkPromocao.text := StringReplace(mkPromocao.text, trim(',' +
      Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').asstring + ')'), ')', [rfIgnoreCase]);
    exit;
  end;
  if (pos(',' + Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').asstring + ',', mkPromocao.text) <>
    0) then
  begin
    mkPromocao.text := StringReplace(mkPromocao.text, ',' +
      Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').asstring + ',', ',', [rfIgnoreCase]);
    exit;
  end;
  if (pos('(' + Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').asstring + ',', mkPromocao.text) <>
    0) then
  begin
    mkPromocao.text := StringReplace(mkPromocao.text, '(' +
      Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').asstring + ',', '(', [rfIgnoreCase]);
    exit;
  end;

  if mkPromocao.text <> '' then
    mkPromocao.text := copy(mkPromocao.text, 1, pos(')', mkPromocao.text) - 1)
      + ',' + Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').asstring + ')'
  else
    mkPromocao.text := mkPromocao.text + '(' + Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').asstring
      + ')';

end;

procedure TFrmCadProdutos.DBGrid30KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    DBGrid30DblClick(Sender);
end;

procedure TFrmCadProdutos.DBGrid31DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (trim(Column.Field.Dataset.FieldbyName('SIGLA_UF').AsString) <> '')
  	and (Column.Field.Dataset.FieldbyName('ATIVO').AsInteger = 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clGray;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;
end;

procedure TFrmCadProdutos.DBGrid31KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if (key = VK_DELETE) then
    BitBtn117Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn116Click(Sender);
end;

procedure TFrmCadProdutos.DBGrid32TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid32, Column);
end;

procedure TFrmCadProdutos.DBGrid33KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    TForm(pnEscolhaPerfil.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.DBGrid35DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('NATUREZA').AsString)) = 'E') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00E4FBD0);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end
  else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('NATUREZA').AsString)) = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00D3D3FA);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadProdutos.DBGrid35TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid35, Column);
end;

procedure TFrmCadProdutos.DBGrid37CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	Produto.vProdutosPrecoQtde._marcaDesmarcaLinha;
end;

procedure TFrmCadProdutos.DBGrid37DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
	if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00DAD5D3); //clHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmCadProdutos.DBGrid37KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_INSERT) then
  	BitBtn_Novo_PrecoPorQuantClick(Sender)
  else if (Key = VK_RETURN) then
    BitBtn_Alterar_PrecoPorQuantClick(Sender)
  else if (Key = VK_DELETE) then
    BitBtn_Excluir_PrecoPorQuantClick(Sender)
  else if Key = VK_SPACE then
  	Produto.vProdutosPrecoQtde._marcaDesmarcaLinha;
end;

procedure TFrmCadProdutos.DBGrid37TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid37, Column);
end;

procedure TFrmCadProdutos.DBGrid39DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if (trim(Column.Field.Dataset.FieldbyName('TIPO2').AsString) <> '')
    and (UpperCase(trim(Column.FieldName)) = 'STATUS')
    and (UpperCase(Trim(Column.Field.dataSet.FieldByName('STATUS').AsString)) <> 'FECHADA')
    and (UpperCase(Trim(Column.Field.dataSet.FieldByName('STATUS').AsString)) <> 'FECHADO') then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clWhite;
    TDBGrid(sender).canvas.Font.color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if (UpperCase(trim(Column.FieldName)) = 'STATUS'){if (UpperCase(trim(Column.FieldName)) = 'ALTERA_ESTOQUE')}
    and ((UpperCase(Trim(Column.Field.dataSet.FieldByName('STATUS').AsString)) = 'FECHADO')
      or (UpperCase(Trim(Column.Field.dataSet.FieldByName('STATUS').AsString)) = 'FECHADA')) then
//    and (UpperCase(Trim(Column.Field.dataSet.FieldByName('ALTERA_ESTOQUE').AsString)) = 'S') then
  begin
    if (UpperCase(Trim(Column.Field.dataSet.FieldByName('NATUREZA').AsString)) = 'S') then
      TDBGrid(sender).Canvas.Brush.Color := TColor($008A8AFF)
    else
      TDBGrid(sender).Canvas.Brush.Color := TColor($00FF8A8A);
    TDBGrid(sender).Canvas.Font.Color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('NATUREZA').AsString)) = 'E') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00E4FBD0);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end
  else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('NATUREZA').AsString)) = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00D3D3FA);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end
  else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('TIPO').AsString)) = 'ORC') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00B0ECFF);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end;
          

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadProdutos.DBGrid39TitleClick(Column: TColumn);
begin
  inherited;
    vDadosIni.DBGridOnTitleClick(DBGrid39, Column);
end;

procedure TFrmCadProdutos.DBGridQtdeVndMesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_TAB then
  	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	    DBGrid1.SetFocus;
end;

procedure TFrmCadProdutos.DBGrid40DblClick(Sender: TObject);
begin
  inherited;
  BitBtn132Click(Sender);
end;

procedure TFrmCadProdutos.DBGrid40KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  	BitBtn132Click(Sender);
end;

procedure TFrmCadProdutos.DBGrid45DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('NATUREZA').AsString)) = 'E') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00E4FBD0);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end
  else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('NATUREZA').AsString)) = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00D3D3FA);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadProdutos.DBGrid46DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
	if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('NATUREZA').AsString)) = 'E') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00E4FBD0);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end
  else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('NATUREZA').AsString)) = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00D3D3FA);
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadProdutos.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  vDadosIni.vShiftClick := Key = VK_SHIFT;
end;

procedure TFrmCadProdutos.DBGrid4TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid4, Column);
end;

procedure TFrmCadProdutos.DBGrid5TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid5, Column);
end;

procedure TFrmCadProdutos.DBGrid7DblClick(Sender: TObject);
begin
  inherited;
  if mkDescGr.text <> '' then
  begin
    if (pos(copy(mkDescGr.text, 1, 1), ',') <> 0) then
      mkDescGr.text := StringReplace(mkDescGr.text, ',', '(', [rfIgnoreCase]);
    if (pos(copy(mkDescGr.text, 1, 1), '(') = 0) then
      mkDescGr.text := '(' + mkDescGr.text;
    if (pos(copy(mkDescGr.text, length(mkDescGr.text), 1), ')') = 0) then
      mkDescGr.text := mkDescGr.text + ')';
  end;
  if (pos(mkDescGr.text, '(' + Produto.vGrupo.dataSet.FieldByName('CODIGO_GRUP').asstring + ')') <>
    0) then
  begin
    mkDescGr.text := StringReplace(mkDescGr.text, '(' +
      Produto.vGrupo.dataSet.FieldByName('CODIGO_GRUP').asstring + ')', '', [rfIgnoreCase]);
    exit;
  end;
  if (pos(',' + Produto.vGrupo.dataSet.FieldByName('CODIGO_GRUP').asstring + ')', mkDescGr.text) <>
    0) then
  begin
    mkDescGr.text := StringReplace(mkDescGr.text, trim(',' +
      Produto.vGrupo.dataSet.FieldByName('CODIGO_GRUP').asstring + ')'), ')', [rfIgnoreCase]);
    exit;
  end;
  if (pos(',' + Produto.vGrupo.dataSet.FieldByName('CODIGO_GRUP').asstring + ',', mkDescGr.text) <>
    0) then
  begin
    mkDescGr.text := StringReplace(mkDescGr.text, ',' +
      Produto.vGrupo.dataSet.FieldByName('CODIGO_GRUP').asstring + ',', ',', [rfIgnoreCase]);
    exit;
  end;
  if (pos('(' + Produto.vGrupo.dataSet.FieldByName('CODIGO_GRUP').asstring + ',', mkDescGr.text) <>
    0) then
  begin
    mkDescGr.text := StringReplace(mkDescGr.text, '(' +
      Produto.vGrupo.dataSet.FieldByName('CODIGO_GRUP').asstring + ',', '(', [rfIgnoreCase]);
    exit;
  end;

  if mkDescGr.text <> '' then
    mkDescGr.text := copy(mkDescGr.text, 1, pos(')', mkDescGr.text) - 1)
      + ',' + Produto.vGrupo.dataSet.FieldByName('CODIGO_GRUP').asstring + ')'
  else
    mkDescGr.text := mkDescGr.text + '(' + Produto.vGrupo.dataSet.FieldByName('CODIGO_GRUP').asstring
      + ')';
end;

procedure TFrmCadProdutos.DBGrid7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    DBGrid7DblClick(Sender);
end;

procedure TFrmCadProdutos.DBGrid8DblClick(Sender: TObject);
begin
  inherited;
  if mkDescSubGr.text <> '' then
  begin
    if (pos(copy(mkDescSubGr.text, 1, 1), ',') <> 0) then
      mkDescSubGr.text := StringReplace(mkDescSubGr.text, ',', '(', [rfIgnoreCase]);
    if (pos(copy(mkDescSubGr.text, 1, 1), '(') = 0) then
      mkDescSubGr.text := '(' + mkDescSubGr.text;
    if (pos(copy(mkDescSubGr.text, length(mkDescSubGr.text), 1), ')') = 0) then
      mkDescSubGr.text := mkDescSubGr.text + ')';
  end;
  if (pos(mkDescSubGr.text, '(' + Produto.vSubGrupo.dataSet.FieldByName('CODIGO_SUBGR').asstring +
    ')') <> 0) then
  begin
    mkDescSubGr.text := StringReplace(mkDescSubGr.text, '(' +
      Produto.vSubGrupo.dataSet.FieldByName('CODIGO_SUBGR').asstring + ')', '', [rfIgnoreCase]);
    exit;
  end;
  if (pos(',' + Produto.vSubGrupo.dataSet.FieldByName('CODIGO_SUBGR').asstring + ')',
    mkDescSubGr.text) <> 0) then
  begin
    mkDescSubGr.text := StringReplace(mkDescSubGr.text, trim(',' +
      Produto.vSubGrupo.dataSet.FieldByName('CODIGO_SUBGR').asstring + ')'), ')', [rfIgnoreCase]);
    exit;
  end;
  if (pos(',' + Produto.vSubGrupo.dataSet.FieldByName('CODIGO_SUBGR').asstring + ',',
    mkDescSubGr.text) <> 0) then
  begin
    mkDescSubGr.text := StringReplace(mkDescSubGr.text, ',' +
      Produto.vSubGrupo.dataSet.FieldByName('CODIGO_SUBGR').asstring + ',', ',', [rfIgnoreCase]);
    exit;
  end;
  if (pos('(' + Produto.vSubGrupo.dataSet.FieldByName('CODIGO_SUBGR').asstring + ',',
    mkDescSubGr.text) <> 0) then
  begin
    mkDescSubGr.text := StringReplace(mkDescSubGr.text, '(' +
      Produto.vSubGrupo.dataSet.FieldByName('CODIGO_SUBGR').asstring + ',', '(', [rfIgnoreCase]);
    exit;
  end;
  if mkDescSubGr.text <> '' then
    mkDescSubGr.text := copy(mkDescSubGr.text, 1, pos(')', mkDescSubGr.text) - 1)
      + ',' + Produto.vSubGrupo.dataSet.FieldByName('CODIGO_SUBGR').asstring + ')'
  else
    mkDescSubGr.text := mkDescSubGr.text + '(' +
      Produto.vSubGrupo.dataSet.FieldByName('CODIGO_SUBGR').asstring + ')';
end;

procedure TFrmCadProdutos.DBGrid8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    DBGrid8DblClick(Sender);
end;

procedure TFrmCadProdutos.DBGridCodigoColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGridCodigo, GridCfg3, cdsGrid3,
    cdsColunas3, usuario, ListGridsAndDataSets3, vDadosIni.transacaoCol);
end;

procedure TFrmCadProdutos.DBGridCodigoTitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(DBGridCodigo, Column);
end;

procedure TFrmCadProdutos.DBGridEstoqueEmpresasColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
	vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGridEstoqueEmpresas, GridCfg1, cdsGrid1,
    cdsColunas1, usuario, ListGridsAndDataSets1, vDadosIni.transacaoCol);
end;

procedure TFrmCadProdutos.DBGridEstoqueEmpresasTitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(DBGridEstoqueEmpresas, Column);
end;

procedure TFrmCadProdutos.DBGridInsumosOutrosProdDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(sender).DataSource.dataSet.FieldByName('SEL').AsString = 'S' then
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
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    TDBGrid(sender).Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmCadProdutos.DBGridKitsProdDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Column.Field.Dataset.FieldbyName('CODIGO_KIT').AsInteger > 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).Canvas.Font.Color := clWhite;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
    else if (Column.Field.Dataset.FieldbyName('QUANT_PROD').AsFloat > 0) then
    begin
      TDBGrid(sender).canvas.brush.color := clMoneyGreen;
      TDBGrid(sender).Canvas.Font.Color  := clWindowText;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
  end;
end;

procedure TFrmCadProdutos.DBGridKitsProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if (key = VK_RETURN) then
    BitBtn146Click(Sender)
  else if (key = VK_DELETE) then
    BitBtn145Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn144Click(Sender);
end;

procedure TFrmCadProdutos.DBGridPrecosVndPorEmpresaColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGridPrecosVndPorEmpresa, GridCfg2, cdsGrid2,
    cdsColunas2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TFrmCadProdutos.DBGridPrecosVndPorEmpresaDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (DBGridPrecosVndPorEmpresa.DataSource.DataSet.FieldByName('DESCR_TIPO').AsString = 'PROMOCAO') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := $009F9FFF;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
  end
  else if (DBGridPrecosVndPorEmpresa.DataSource.DataSet.FieldByName('DESCR_TIPO').AsString = 'QUANTIDADE') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := $00C1FFC1;
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
  end
  else if (gdFocused in State) then
  begin
    TDBGrid(sender).canvas.brush.color := clWindow;
    TDBGrid(sender).canvas.Font.color := clWindowText;
  end
  else if (trim(DBGridPrecosVndPorEmpresa.DataSource.DataSet.FieldByName('DESCR_TIPO').AsString) <> '') then
  begin
    TDBGrid(sender).canvas.brush.color := $00FFFD9F;
      TDBGrid(sender).canvas.Font.color := clBlack;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadProdutos.DBGridPrecosVndPorEmpresaTitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(DBGridPrecosVndPorEmpresa, Column);
end;

procedure TFrmCadProdutos.DBLComissaoFaixaDescExit(Sender: TObject);
begin
  inherited;
	if DBLComissaoFaixaDesc.KeyValue = null then
  	EdComissaoFaixaDesc.AsValue := 0
  else
	  EdComissaoFaixaDesc.AsValue := DBLComissaoFaixaDesc.KeyValue;
end;

procedure TFrmCadProdutos.DBLComissaoFaixaDescKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COMISSAO_FAIXA_DESCONTO', ' AND COMISSAO_FAIXA_DESCONTO.TIPO = ''ESPECIFICA'' ', 'Consulta Comissão Faixa de Desconto');
      if vDadosIni.vPesquisa <> '' then
        DBLComissaoFaixaDesc.KeyValue := strtoint(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadProdutos.DBLGrupoProdExit(Sender: TObject);
begin
  inherited;
  if DBLGrupoProd.KeyValue = null then
  	 EdCodGrupoProd.AsValue := 0
  else
	 EdCodGrupoProd.AsValue := DBLGrupoProd.KeyValue;
end;

procedure TFrmCadProdutos.DBLGrupoProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if not vDadosIni.PesqPros('PRO017', 'CONSULTAR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Exit;
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('GRUPOS');
      if vDadosIni.vPesquisa <> '' then
        EdCodGrupoProd.AsValue := strtoint(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not vDadosIni.PesqPros('PRO023', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Exit;
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := inttostr(Produto.dataSet.FieldByName('GRUPO_PROD').AsInteger);
      Produto.CadGrupos(1);
      Produto.vGrupo.abreGrupos;
      if vDadosIni.vPesquisa <> '' then
        EdCodGrupoProd.AsValue := strtoint(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F5 then
  begin
    Produto.vGrupo.dataSet.Refresh;
  end;
end;

procedure TFrmCadProdutos.DBLMarcaExit(Sender: TObject);
begin
  inherited;
  if DBLMarca.KeyValue = null then
  	EdCodMarca.AsValue := 0
  else
	  EdCodMarca.AsValue := DBLMarca.KeyValue;
end;

procedure TFrmCadProdutos.DBLMarcaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Marca: TMarcas;
begin
  try
    Screen.Cursor := crHourGlass;
    inherited;
    if Key = VK_F3 then
    begin
      if not vDadosIni.PesqPros('PRO025', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
        Exit;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('MARCA_PROD');
      if vDadosIni.vPesquisa <> '' then
        DBLMarca.KeyValue := strtoint(vDadosIni.vPesquisa);
    end;
    if Key = VK_F4 then
    begin
      if not vDadosIni.PesqPros('PRO026', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
        Exit;

      Marca := Tmarcas.create;
      Marca.abreMarcas;
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := 'CADMARCA|0|' + trim(DBLMarca.Text) + '|';
      Marca.CadMarcas(1);
      if (Pos('CADMARCA|', vDadosIni.vPesquisa) > 0) and (Pos('CADMARCA|0|', vDadosIni.vPesquisa) = 0) then
        DBLMarca.KeyValue := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,2));
    end
    else if Key = VK_F5 then
    begin
      Produto.MarcaProd.dataSet.Refresh;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.DBLookupComboBox10Click(Sender: TObject);
begin
  inherited;
  Produto.vRegiao._abreRegiao(DBLookupComboBox10.Text);
end;

procedure TFrmCadProdutos.DBLookupComboBox10Exit(Sender: TObject);
begin
  inherited;
  GroupBox73.Caption := UpperCase(Copy(DBLookupComboBox10.Text, 1, 1)) + LowerCase(Copy(DBLookupComboBox10.Text, 2, Length(DBLookupComboBox10.Text)));

  if DBLookupComboBox10.Text = 'LOCALIDADE' then
    DBLookupComboBox10.KeyValue := 2
  else if DBLookupComboBox10.Text = 'SETOR' then
    DBLookupComboBox10.KeyValue := 3
  else if DBLookupComboBox10.Text = 'CIDADE' then
    DBLookupComboBox10.KeyValue := 4;
end;

procedure TFrmCadProdutos.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if not (Produto.dataSet.State in [dsEdit, dsInsert]) then
    exit;
    	
  if (not Produto.AlterarGrupo) and (Produto.cadastroSimplificado) then
    if (activecontrol = BitBtn_5) or (activecontrol = BitBtn_6) then
      Exit;
  if (Produto.AlterarGrupo) or (not Produto.cadastroSimplificado) then
    if (activecontrol = BitBtn5) or (activecontrol = BitBtn6) or (activecontrol = DBEdit16) then
      Exit;

  if not Produto.vGrupo.GrupoExiste(Produto) then
  begin
    if (not Produto.AlterarGrupo) and (Produto.cadastroSimplificado) then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox11.CanFocus) then      
        DBLookupComboBox11.SetFocus
    end
    else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then         
      DBLookupComboBox1.SetFocus;
    exit;
  end;
  Produto.vSubGrupo.SubGrupoVinculado(Produto, false);
  Produto.GeraCodProd(Produto.dataSet.FieldByName('GRUPO_PROD').AsString);
  if not Produto.AlterarGrupo then
    Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString :=
      trim(produto.dataSet.FieldByName('NUM_FAB_PROD').AsString);
  if not Produto.AlterarGrupo then
    DBEdit59Exit(DBEdit59);
end;

procedure TFrmCadProdutos.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if not vDadosIni.PesqPros('PRO017', 'CONSULTAR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Exit;
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('GRUPOS');
      if vDadosIni.vPesquisa <> '' then
        Produto.dataSet.FieldByName('GRUPO_PROD').asinteger := strtoint(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not vDadosIni.PesqPros('PRO023', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Exit;
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := inttostr(Produto.dataSet.FieldByName('GRUPO_PROD').AsInteger);
      Produto.CadGrupos(1);
      Produto.vGrupo.abreGrupos;
      if vDadosIni.vPesquisa <> '' then
        Produto.dataSet.FieldByName('GRUPO_PROD').asinteger := strtoint(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F5 then
  begin
    Produto.vGrupo.dataSet.Refresh;
  end;
end;

procedure TFrmCadProdutos.DBLookupComboBox23Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit64.CanFocus) then
		DBEdit64.SetFocus;
end;

procedure TFrmCadProdutos.DBLookupComboBox25Exit(Sender: TObject);
begin
  inherited;
	if (trim(Produto.oldForaLinha) = 'S') and (Produto.dataSet.FieldByName('FORA_LINHA').AsString = 'S') then
  	Application.MessageBox('Produto definido como fora de linha,' +
    	' quando o mesmo estiver sem estoque será enviado para lixeira', 'Atenção', 0 + 64);
end;

procedure TFrmCadProdutos.DBLookupComboBox2Enter(Sender: TObject);
begin
  inherited;
  Produto.vSubGrupo.SubGrupoVinculado(Produto, true);
end;

procedure TFrmCadProdutos.DBLookupComboBox2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if not vDadosIni.PesqPros('PRO018', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Exit;

    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SUB_GRUPO');
      if vDadosIni.vPesquisa <> '' then
        Produto.dataSet.FieldByName('SUB_G_PROD').asinteger := strtoint(vDadosIni.vPesquisa);
      if not Produto.cadastroSimplificado then
      	if (Self.Enabled) and (Self.Visible) and (Dbedit67.CanFocus) then
	        Dbedit67.SetFocus;
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not vDadosIni.PesqPros('PRO024', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Exit;
    try
      Screen.Cursor := crHourGlass;
      Produto.CadSubGrupos(1);
      Produto.vSubGrupo.abreSubGrupos;
      if vDadosIni.vPesquisa <> '' then
        Produto.dataSet.FieldByName('SUB_G_PROD').asinteger := strtoint(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F5 then
  begin
    Produto.vSubGrupo.dataSet.Refresh;
  end;
end;

procedure TFrmCadProdutos.DBLookupComboBox4Click(Sender: TObject);
begin
  inherited;
  Produto.vRegiao._abreGruposSubgruposMarcas(DBLookupComboBox4.Text);
end;

procedure TFrmCadProdutos.DBLookupComboBox5Click(Sender: TObject);
begin
  inherited;
  Produto.vRegiao._abreRegiao(DBLookupComboBox5.Text);
end;

procedure TFrmCadProdutos.DBLookupComboBox6Exit(Sender: TObject);
begin
  inherited;
  if vGrupoProdTemp <= 0 then
    vGrupoProdTemp := Produto.dataSet.FieldByName('GRUPO_PROD').AsInteger;
  if trim(vCodProdTemp) = '' then
    vCodProdTemp := Produto.dataSet.FieldByName('COD_PROD').AsString;
  if vCodPromocaoTemp <= 0 then
  	 vCodPromocaoTemp := Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger;

  if Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger > 0 then
  begin
    Produto.vPromocaoProduto.vTipoVenda._abreTipoVenda(IntToStr(Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger),
     Produto.vTipoPreco.dataSet.FieldByName('COD_TPPRECO').AsString,
     Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
     Produto.dataSet.FieldByName('COD_PROD').AsString);
     if (vGrupoProdTemp <> Produto.dataSet.FieldByName('GRUPO_PROD').AsInteger)
      or (vCodProdTemp <> Produto.dataSet.FieldByName('COD_PROD').AsString)
      or (vCodPromocaoTemp <> Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger) then
      begin
      	Produto.vPromocaoProduto.vTipoVenda.dataSet.First;
         DBLookupComboBox7.Field.AsString := Produto.vPromocaoProduto.vTipoVenda.dataSet.FieldByName('sigla').AsString;
      end;
  end;

  if Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger > 0 then
  begin
    MaskEdit23.Text := FormatDateTime('dd/mm/yyyy', Produto.vPromocao.dataSet.FieldByName('DATA_INI').AsDateTime);
    MaskEdit25.Text := FormatDateTime('dd/mm/yyyy', Produto.vPromocao.dataSet.FieldByName('DATA_FIM').AsDateTime);
    MaskEdit24.Text := Produto.vPromocao.dataSet.FieldByName('HORA_INI').AsString;
    MaskEdit26.Text := Produto.vPromocao.dataSet.FieldByName('HORA_FIM').AsString;
  end
  else
  begin
    MaskEdit23.Text := '';
    MaskEdit25.Text := '';
    MaskEdit24.Text := '';
    MaskEdit26.Text := '';
  end;
  vGrupoProdTemp := Produto.dataSet.FieldByName('GRUPO_PROD').AsInteger;
  vCodProdTemp := Produto.dataSet.FieldByName('COD_PROD').AsString;
  vCodPromocaoTemp := Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').AsInteger;
end;

procedure TFrmCadProdutos.DBLookupComboBox7Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn98) then
    exit;

  if DBLookupComboBox7.Text = '' then
  	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then
	    DBLookupComboBox7.SetFocus;
end;

procedure TFrmCadProdutos.DBLookupComboBox8Exit(Sender: TObject);
begin
  inherited;
  if DBLookupComboBox8.Text <> '' then
    EditHw6.AsValue := DBLookupComboBox8.KeyValue;
end;

procedure TFrmCadProdutos.DBLookupComboBox9Exit(Sender: TObject);
begin
  inherited;
  if trim(DBLookupComboBox9.Text) <> '' then
   Produto.vRegiao._abreRegiao(DBLookupComboBox9.Text);

  if Trim(DBLookupComboBox9.Text) = 'LOCALIDADE' then
  begin
    DBLookupComboBox8.DataField := 'COD_LOCALIDADE';
    Label235.Caption := 'Localidade:';
  end
  else if Trim(DBLookupComboBox9.Text) = 'SETOR' then
  begin
    DBLookupComboBox8.DataField := 'COD_SETOR';
    Label235.Caption := 'Setor:';
  end
  else if Trim(DBLookupComboBox9.Text) = 'CIDADE' then
  begin
    DBLookupComboBox8.DataField := 'COD_CIDADE';
    Label235.Caption := 'Cidade:';
  end
  else if Trim(DBLookupComboBox9.Text) = 'AVULSO' then
  begin
    DBLookupComboBox8.DataField := 'COD_PROMOCAO';
    Label235.Caption := 'Tabela:';
  end
end;

procedure TFrmCadProdutos.DBLSubGrupoExit(Sender: TObject);
begin
  inherited;
  if DBLSubGrupo.KeyValue = null then
  	EdCodSubGrupo.AsValue := 0
  else
	  EdCodSubGrupo.AsValue := DBLSubGrupo.KeyValue;
end;

procedure TFrmCadProdutos.DBLSubGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if not vDadosIni.PesqPros('PRO018', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Exit;

    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SUB_GRUPO');
      if vDadosIni.vPesquisa <> '' then
        DBLSubGrupo.KeyValue := strtoint(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not vDadosIni.PesqPros('PRO024', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Exit;
    try
      Screen.Cursor := crHourGlass;
      Produto.CadSubGrupos(1);
      Produto.vSubGrupo.abreSubGrupos;
      if vDadosIni.vPesquisa <> '' then
        DBLSubGrupo.KeyValue := strtoint(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F5 then
  begin
    Produto.vSubGrupo.dataSet.Refresh;
  end;
end;

procedure TFrmCadProdutos.DBRadioGroup2Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
	  BitBtn4.SetFocus;
end;

procedure TFrmCadProdutos.DesativarAtivarCamposHtml(pTipo: string; pHablitar: boolean);
begin
	if pTipo = 'E' then
  begin
    pnDadosEC.Enabled := pHablitar;
    pnOpcoesDadosEC.Enabled := pHablitar;

    btnOKAlterarDadosEC.Enabled := (pnOpcoesDadosEC.Enabled)
    	and (pnOpcoesDadosEC.Visible);

    btnCancAlterarDadosEC.Enabled := (pnOpcoesDadosEC.Enabled)
    	and (pnOpcoesDadosEC.Visible);

    sbVoltarEC.Enabled := (pnOpcoesDadosEC.Enabled)
    	and (pnOpcoesDadosEC.Visible);

    sbAvancarEC.Enabled := (pnOpcoesDadosEC.Enabled)
    	and (pnOpcoesDadosEC.Visible);

    SpeedButtonAlterarHtmlEC.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);

    lbDescrCompletaEC.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);
    pnDescricaoHTMLEC.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);

    lbDescrEC.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);
    DBEditDescrEC.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);

    lbSincEC.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);
    DBComboBoxSincEC.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);

    lbDispEC.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);
    DBComboBoxDispEC.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);

    lbPrecoCombinarEC.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);
    DBComboBoxPrecoCombinarEC.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);

    lbPromoEC.Enabled := (pnOpcoesDadosEC.Enabled)
    	and (pnOpcoesDadosEC.Visible)
    	and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');
    DBComboBoxPromoEC.Enabled := (pnOpcoesDadosEC.Enabled)
    	and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');

    lbFreteGratisEC.Enabled := False;
//    	(pnOpcoesDadosEC.Enabled)
//      and (pnOpcoesDadosEC.Visible)
//      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) <> 'TRAY');
    DBComboBoxFreteGratisEC.Enabled := False;
//    	(pnOpcoesDadosEC.Enabled)
//      and (pnOpcoesDadosEC.Visible)
//      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) <> 'TRAY');

    lbLancEC.Enabled :=	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');
    DBComboBoxLancEC.Enabled :=	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');

    lbTermAceiteEC.Enabled := (pnOpcoesDadosEC.Enabled)
    	and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');
    DBComboBoxTermAceiteEC.Enabled := (pnOpcoesDadosEC.Enabled)
    	and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');

    lbCompreJuntoEC.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');
    DBComboBoxCompreJuntoEC.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');

    lbVirtualEC.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);
    DBComboBoxVirtualEC.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);

    lbDestaqueEC.Enabled := (pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');
    DBComboBoxDestaqueEC.Enabled := (pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');

    lbCategoria.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');
    DBLookupComboBoxCategoria.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');

    lbTituloPag.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');
    DBEditTituloPag.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');

    lbURLAcesso.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');
    DBEditURLAcesso.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');

    lbPalavrasChaves.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');
    lbPalavrasChavesExplic.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');
    DBEditPalavrasChaves.Enabled :=
    	(pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible)
      and (UpperCase(trim(vDadosIni.vEcommerce.vEcommerceIntegrado)) = 'TRAY');

//    PageControlEC.Enabled := pnOpcoesDadosEC.Enabled and pnOpcoesDadosEC.Visible;
  	TabSheetEC1.Enabled := (pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);
    TabSheetEC2.Enabled := (pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);
    TabSheetEC3.Enabled := (pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);
    TabSheetEC4.Enabled := (pnOpcoesDadosEC.Enabled)
      and (pnOpcoesDadosEC.Visible);
  end
  else if pTipo = 'C' then
  begin
    pnDadosCA.Enabled := pHablitar;
    pnOpcoesDadosCA.Enabled := pHablitar;

    btnOKAlterarDadosCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
    btnCancAlterarDadosCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
    sbVoltarCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
    sbAvancarCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;

    SpeedButtonAlterarHtmlCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;

    lbDescrCompletaCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
    pnDescricaoHTMLCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;

    lbDescrCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
    DBEditDescrCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;

    lbEnvCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
    DBComboBoxEnvCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;

    lbPrecoCombinarCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
    DBComboBoxPrecoCombinarCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
//    PageControlCA.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
  	TabSheetCA1.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
    TabSheetCA2.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
    TabSheetCA3.Enabled := pnOpcoesDadosCA.Enabled and pnOpcoesDadosCA.Visible;
	end;
end;

procedure TFrmCadProdutos.DesfazerselecaoClick(Sender: TObject);
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;
  	DbGrid24.Visible := False;
  	Produto.vRegiao._desmarcarTodos;
  finally
  	DbGrid24.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.DesmarcarTodosPrecosClickClick(Sender: TObject);
begin
  inherited;
  if not DBGrid23.Enabled then
    Exit;

	try
		Screen.Cursor := crHourGlass;
    DBGrid23.Visible := False;
  	Produto.vPromocaoProduto._desmarcarTodos;
  finally
  	DBGrid23.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.DesmarcarTodosPrecosQtdeClick(Sender: TObject);
begin
  inherited;
	if not DBGrid37.Enabled then
    Exit;

  try
    Screen.Cursor := crHourGlass;
  	DBGrid37.Visible := False;
    Produto.vProdutosPrecoQtde._desmarcarTodos;
  finally
    DBGrid37.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.Desmarcatodosprodutos1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if (PageControl1.ActivePage = TabSheet2) then
    begin
      Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
      Produto.dataSet.AfterScroll := nil;
    end;
    
    DBGrid1.Visible := false;
    Produto._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;

    if (PageControl1.ActivePage = TabSheet2) then
      ckMenuLateralClick(Sender);
  end;
end;

procedure TFrmCadProdutos.DesmarcatodosprodutosEtiqEsterClick(Sender: TObject);
begin
  btUnSelectAllEtiqEsterClick(Sender);
end;

procedure TFrmCadProdutos.DesmarcatodosprodutosEtiTerRapidaClick(
  Sender: TObject);
begin
  btUnSelectAllEtiqTerRapidaClick(Sender);
end;

procedure TFrmCadProdutos.DesmarcatodosprodutosTempClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    DBGrid15.Visible := false;
    Produto._desmarcarTodosTemp(Produto.dtSetProdTemp);

  finally
    Screen.Cursor := crDefault;
    DBGrid15.Visible := true;
  end;
end;

procedure TFrmCadProdutos.DocumentoEmBranco(pWebBrowser: TWebBrowser);
begin
  if not Assigned(pWebBrowser.Document) then
     pWebBrowser.Navigate('about:blank');
end;

procedure TFrmCadProdutos.EdCEST1Change(Sender: TObject);
begin
  inherited;
	TEdit(Sender).Text := vDadosIni.apenasNumeros(TEdit(Sender).Text);
end;

procedure TFrmCadProdutos.EdCESTExit(Sender: TObject);
begin
  inherited;
  if trim(EdCEST.Text) = '' then
  	exit;
    
	if not Produto.buscasCESTProduto(EdCEST.Text) then
    Application.MessageBox('CEST não encontrado no cadastro',
    	'Alerta', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
end;

procedure TFrmCadProdutos.EdCodCFOPInterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    if not vDadosIni.PesqPros('PRO019', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Exit;
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NAT_OP');
      if vDadosIni.vPesquisa <> '' then
        EdCodCFOPInter.AsValue := Trunc(StrToInt(vDadosIni.vPesquisa));
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadProdutos.EdCodCFOPKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    if not vDadosIni.PesqPros('PRO019', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Exit;
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NAT_OP');
      if vDadosIni.vPesquisa <> '' then
        EdCodCFOP.AsValue := Trunc(StrToInt(vDadosIni.vPesquisa));
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadProdutos.EdCodCSOSNChange(Sender: TObject);
begin
  inherited;
	TEdit(Sender).Text := vDadosIni.apenasNumeros(TEdit(Sender).Text);
end;

procedure TFrmCadProdutos.EdCodCSTChange(Sender: TObject);
begin
  inherited;
  TEdit(Sender).Text := vDadosIni.apenasNumeros(TEdit(Sender).Text);
end;

procedure TFrmCadProdutos.EdCodEnqIPIChange(Sender: TObject);
begin
  inherited;
  TEdit(Sender).Text := vDadosIni.apenasNumeros(TEdit(Sender).Text);
end;

procedure TFrmCadProdutos.EdCodGrupoProdExit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = btSalvarProdLote)
  	or (ActiveControl = btnCancProdLote)
    or (ActiveControl = btSairProdLote)) then
    Exit;

  DBLGrupoProd.KeyValue := EdCodGrupoProd.AsInteger;

  if EdCodGrupoProd.AsInteger <= 0 then
  	exit;

  if not Produto.buscasGrupoProduto(EdCodGrupoProd.AsInteger) then
  begin
    Application.MessageBox('Grupo não encontrado ou se encontra na lixeira', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdCodGrupoProd.CanFocus) then
    	EdCodGrupoProd.SetFocus;
    exit;
  end;
end;

procedure TFrmCadProdutos.EdCodGrupoProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if not vDadosIni.PesqPros('PRO017', 'CONSULTAR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Exit;
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('GRUPOS');
      if vDadosIni.vPesquisa <> '' then
        EdCodGrupoProd.AsValue := strtoint(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not vDadosIni.PesqPros('PRO023', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Exit;
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := inttostr(Trunc(EdCodGrupoProd.AsValue));
      Produto.CadGrupos(1);
      Produto.vGrupo.abreGrupos;
      if vDadosIni.vPesquisa <> '' then
        EdCodGrupoProd.AsValue := strtoint(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F5 then
  begin
    Produto.vGrupo.dataSet.Refresh;
  end;
end;

procedure TFrmCadProdutos.EdCodMarcaExit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = btSalvarProdLote)
  	or (ActiveControl = btnCancProdLote)
    or (ActiveControl = btSairProdLote)) then
    Exit;

  DBLMarca.KeyValue := EdCodMarca.AsInteger;

  if EdCodMarca.AsInteger <= 0 then
  	exit;

  if not Produto.buscasMarcaProduto(EdCodMarca.AsInteger) then
  begin
    Application.MessageBox('Marca não encontrado ou se encontra na lixeira', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdCodMarca.CanFocus) then
    	EdCodMarca.SetFocus;
    exit;
  end;
end;

procedure TFrmCadProdutos.EdCodMarcaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Marca: TMarcas;
begin
  try
    Screen.Cursor := crHourGlass;
    inherited;
    if Key = VK_F3 then
    begin
      if not vDadosIni.PesqPros('PRO025', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
        Exit;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('MARCA_PROD');
      if vDadosIni.vPesquisa <> '' then
        EdCodMarca.AsValue := strtoint(vDadosIni.vPesquisa);
    end;
    if Key = VK_F4 then
    begin
      if not vDadosIni.PesqPros('PRO026', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
        Exit;

      Marca := Tmarcas.create;
      Marca.abreMarcas;
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := 'CADMARCA|0|' + trim(DBLMarca.Text) + '|';
      Marca.CadMarcas(1);
      if (Pos('CADMARCA|', vDadosIni.vPesquisa) > 0) and (Pos('CADMARCA|0|', vDadosIni.vPesquisa) = 0) then
        EdCodMarca.AsValue := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa,2));
    end
    else if Key = VK_F5 then
    begin
      Produto.MarcaProd.dataSet.Refresh;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.EdCodNCMChange(Sender: TObject);
begin
  inherited;
	TEdit(Sender).Text := vDadosIni.apenasNumeros(TEdit(Sender).Text);
end;

procedure TFrmCadProdutos.EdCodNCMExit(Sender: TObject);
begin
  if (activecontrol = btnCancProdLote) or (activecontrol = btSairProdLote) then
  	Exit;

  inherited;
  if Produto.buscasNBMProduto(EdCodNCM.Text) then
  begin
    //Função para atualizar as informações do pis e cofins
//    Produto.buscasNBMProduto(EdCodNCM.Text);

    if (trim(EdCSTPisCofinsSaida.Text) = '')	or (trim(EdCSTPisCofinsEntrada.Text) = '') then
      	exit;

    if (trim(EdCSTPisCofinsEntrada.Text) = trim(Produto.buscas.FieldByName('CST_PIS_ENT').AsString))
      and (trim(EdCSTPisCofinsSaida.Text) = trim(Produto.buscas.FieldByName('CST_PIS').AsString)) then
      exit;

    if Application.MessageBox('Deseja atualizar as informações de pis e cofins?',
      'Atualizar Informações', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> mrYES then
      exit;

    EdCSTPisCofinsEntrada.Text := Produto.buscas.FieldByName('CST_PIS_ENT').AsString;
    EdCSTPisCofinsSaida.Text := Produto.buscas.FieldByName('CST_PIS').AsString;
    EdNatReceita.Text := Produto.buscas.FieldByName('NAT_REC').AsString;
    EdAliqPisDif.AsValue := Produto.buscas.FieldByName('ALIQ_PIS_DIFERENCIADA').AsFloat;
    EdAliqCredPis.AsValue := Produto.buscas.FieldByName('ALIQ_CRED_PIS').AsFloat;
    EdAliqCofinsDif.AsValue := Produto.buscas.FieldByName('ALIQ_COFINS_DIFERENCIADA').AsFloat;
  	EdAliqCredCofins.AsValue := Produto.buscas.FieldByName('ALIQ_CRED_COFINS').AsFloat;
    EdAliqICMS.AsValue := Produto.buscas.FieldByName('ALIQ_INTRA').AsFloat;
  end
  else
  begin
    Application.MessageBox('NCM não encontrado no cadastro',
    	'Alerta', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      
    if EdCodNCM.CanFocus then
      EdCodNCM.SetFocus;
  end;
end;

procedure TFrmCadProdutos.EdCodNCMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('PRO019', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
      //    if vDadosIni.PesqPros('PRO019', '', produto.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NBM');
        if vDadosIni.vPesquisa <> '' then
          EdCodNCM.Text := vDadosIni.vPesquisa;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
  if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('PRO025', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
      //    if vDadosIni.PesqPros('PRO025', '', produto.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := trim(EdCodNCM.Text);
        Produto.CadNbm(1);
        if vDadosIni.vPesquisa <> '' then
          EdCodNCM.Text := vDadosIni.vPesquisa;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadProdutos.EdCodPerfilProdExit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = btSalvarProdLote)
  	or (ActiveControl = btnCancProdLote)
    or (ActiveControl = btSairProdLote)) then
    Exit;

  if EdCodPerfilProd.AsInteger <= 0 then
	begin
  	EdCEST.Text := '';
  	exit;
  end;

  if not Produto.buscasPerfilProduto(EdCodPerfilProd.AsInteger) then
  begin
    Application.MessageBox('Perfil não encontrado ou se encontra na lixeira', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdCodPerfilProd.CanFocus) then
    	EdCodPerfilProd.SetFocus;
    exit;
  end;
	atribuirDadosPerfil;
end;

procedure TFrmCadProdutos.EdCodPerfilProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('PRO013', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
      //    if vDadosIni.PesqPros('PRO013', '', produto.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PERFIL_PRODUTOS');
        if vDadosIni.vPesquisa <> '' then
        begin
        	EdCodPerfilProd.AsValue := StrToInt(vDadosIni.vPesquisa);
          if not Produto.buscasPerfilProduto(EdCodPerfilProd.AsInteger) then
          begin
            Application.MessageBox('Perfil não encontrado ou se encontra na lixeira', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
            if (Self.Enabled) and (Self.Visible) and (EdCodPerfilProd.CanFocus) then
              EdCodPerfilProd.SetFocus;
            exit;
          end;
					atribuirDadosPerfil;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end
  else if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('PRO015', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
      //    if vDadosIni.PesqPros('PRO015', '', produto.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        //        vPerfil.CadPerfilProd(1);
        Produto.PerfilProd.CadPerfilProd(1);
        if vDadosIni.vPesquisa <> '' then
        begin
          if not Produto.buscasPerfilProduto(EdCodPerfilProd.AsInteger) then
          begin
            Application.MessageBox('Perfil não encontrado ou se encontra na lixeira', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
            if (Self.Enabled) and (Self.Visible) and (EdCodPerfilProd.CanFocus) then
              EdCodPerfilProd.SetFocus;
            exit;
          end;
        	atribuirDadosPerfil;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadProdutos.EdCodSubGrupoExit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = btSalvarProdLote)
  	or (ActiveControl = btnCancProdLote)
    or (ActiveControl = btSairProdLote)) then
     Exit;

  DBLSubGrupo.KeyValue := EdCodSubGrupo.AsInteger;

  if EdCodSubGrupo.AsInteger <= 0 then
  	exit;

  if not Produto.buscasSubGrupoProduto(EdCodSubGrupo.AsInteger) then
  begin
    Application.MessageBox('SubGrupo não encontrado ou se encontra na lixeira', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdCodSubGrupo.CanFocus) then
    	EdCodSubGrupo.SetFocus;
    exit;
  end;
end;

procedure TFrmCadProdutos.EdCodSubGrupoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if not vDadosIni.PesqPros('PRO018', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Exit;

    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SUB_GRUPO');
      if vDadosIni.vPesquisa <> '' then
        EdCodSubGrupo.AsValue := strtoint(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not vDadosIni.PesqPros('PRO024', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
      Exit;
    try
      Screen.Cursor := crHourGlass;
      Produto.CadSubGrupos(1);
      Produto.vSubGrupo.abreSubGrupos;
      if vDadosIni.vPesquisa <> '' then
        EdCodSubGrupo.AsValue := strtoint(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F5 then
  begin
    Produto.vSubGrupo.dataSet.Refresh;
  end;
end;

procedure TFrmCadProdutos.EdComissaoFaixaDescExit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = btSalvarProdLote)
  or (ActiveControl = btnCancProdLote)
  or (ActiveControl = btSairProdLote)) then
   Exit;

  DBLComissaoFaixaDesc.KeyValue := EdComissaoFaixaDesc.AsInteger;

  if EdComissaoFaixaDesc.AsInteger <= 0 then
  	exit;

  if not Produto.buscasRegraComissaoFaixaDesc(EdComissaoFaixaDesc.AsInteger) then
  begin
    Application.MessageBox('Código comissão por faixa de desconto não encontrado ou se encontra na lixeira', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdComissaoFaixaDesc.CanFocus) then
    	EdComissaoFaixaDesc.SetFocus;
    exit;
  end;
end;

procedure TFrmCadProdutos.EdComissaoFaixaDescKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('COMISSAO_FAIXA_DESCONTO', ' AND COMISSAO_FAIXA_DESCONTO.TIPO = ''ESPECIFICA'' ', 'Consulta Comissão Faixa de Desconto');
      if vDadosIni.vPesquisa <> '' then
        EdComissaoFaixaDesc.AsValue := strtoint(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadProdutos.EdCSTEntradaChange(Sender: TObject);
begin
  inherited;
  TEdit(Sender).Text := vDadosIni.apenasNumeros(TEdit(Sender).Text);
end;

procedure TFrmCadProdutos.EdCSTIPIChange(Sender: TObject);
begin
  inherited;
  TEdit(Sender).Text := vDadosIni.apenasNumeros(TEdit(Sender).Text);
end;

procedure TFrmCadProdutos.EdCSTPisCofinsEntradaExit(Sender: TObject);
begin
  if not vDadosIni.strIn(Trim(EdCSTPisCofinsEntrada.Text),
                         ['', '50', '51', '52', '53', '54', '55', '56',
                              '60', '61', '62', '63', '64', '65', '66', '67',
                              '70', '71', '72', '73', '74', '75', '98', '99']) then
  begin
    vDadosIni.ShowErro('CST de Entrada PIS COFIS inválido. Deixe em branco ou informe um dos seguintes valores:' + #13 +
                       '"50", "51", "52", "53", "54", "55", "56",'       + #13 +
                       '"60", "61", "62", "63", "64", "65", "66", "67",' + #13 +
                       '"70", "71", "72", "73", "74", "75", "98", "99"');
    if (Self.Enabled) and (Self.Visible) and (EdCSTPisCofinsEntrada.CanFocus) then
      EdCSTPisCofinsEntrada.SetFocus;
  end;
end;

procedure TFrmCadProdutos.EdCSTPisCofinsSaidaChange(Sender: TObject);
begin
  inherited;
	TEdit(Sender).Text := vDadosIni.apenasNumeros(TEdit(Sender).Text);
end;

procedure TFrmCadProdutos.EdCSTPisCofinsSaidaExit(Sender: TObject);
begin
  inherited;
  CbIsento.ItemIndex := vDadosIni.IfThen(trim(EdCSTPisCofinsSaida.Text) = '07', 2, 1);

  if not vDadosIni.strIn(Trim(EdCSTPisCofinsSaida.Text),
                         ['', '01', '02', '03', '04', '05', '06', '07', '08', '09', '49', '99']) then
  begin
    vDadosIni.ShowErro('CST de Saída PIS COFIS inválido. Deixe em branco ou informe um dos seguintes valores:' + #13 +
                       '"01", "02", "03", "04", "05", "06", "07", "08", "09", "49", "99"');
    if (Self.Enabled) and (Self.Visible) and (EdCSTPisCofinsSaida.CanFocus) then
      EdCSTPisCofinsSaida.SetFocus;
  end;
end;

procedure TFrmCadProdutos.EdDiasVencCashbackExit(Sender: TObject);
begin
  EdDiasVencCashback.AsValue := Trunc(EdDiasVencCashback.AsValue);
end;

procedure TFrmCadProdutos.Edit1Exit(Sender: TObject);
begin
  inherited;
  try
    if (trim(Edit1.Text) <> '') then
    begin
      Produto.AtribuirPerfilProd(strtoint(trim(Edit1.Text)));
      Edit2.Text := Produto.LocPerfilProd.buscas.FieldByName('DESCR_PERFIL').asstring;
      Produto.LocPerfilProd.buscas.close;
    end;
  except

  end;
end;

procedure TFrmCadProdutos.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
//var
//  vPerfil: TPerfilProduto;
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('PRO013', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
      //    if vDadosIni.PesqPros('PRO013', '', produto.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PERFIL_PRODUTOS');
        if vDadosIni.vPesquisa <> '' then
        begin
          Edit1.Text := vDadosIni.vPesquisa;
          Produto.AtribuirPerfilProd(strtoint(vDadosIni.vPesquisa));
          Edit2.Text := Produto.LocPerfilProd.buscas.FieldByName('DESCR_PERFIL').asstring;
          Produto.LocPerfilProd.buscas.close;
          if (Self.Enabled) and (Self.Visible) and (DBEdit67.CanFocus) then
	          DBEdit67.SetFocus;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end
  else if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('PRO015', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
      //    if vDadosIni.PesqPros('PRO015', '', produto.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        //        vPerfil.CadPerfilProd(1);
        Produto.PerfilProd.CadPerfilProd(1);
        if vDadosIni.vPesquisa <> '' then
        begin
          Edit1.Text := vDadosIni.vPesquisa;
          Produto.AtribuirPerfilProd(strtoint(vDadosIni.vPesquisa));
          Edit2.Text := Produto.LocPerfilProd.buscas.FieldByName('DESCR_PERFIL').asstring;
          Produto.LocPerfilProd.buscas.close;
          if (Self.Enabled) and (Self.Visible) and (DBEdit67.CanFocus) then
	          DBEdit67.SetFocus;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadProdutos.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not vDadosIni.isnumeroint(key) then
    key := #0;
end;

procedure TFrmCadProdutos.Edit3Change(Sender: TObject);
begin
  inherited;
  if (trim(Edit3.Text) <> '') then
  begin
    Produto.vRegiao.IndexFieldNames := 'DESCRICAO';
    Produto.vRegiao.FindNearest([trim(Edit3.Text)]);
  end
  else
  begin
    begin
      Produto.vRegiao.IndexFieldNames := 'CODIGO';
      Produto.vRegiao.FindNearest([1]);
    end;
  end;
end;

procedure TFrmCadProdutos.Edit3Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn95.CanFocus) then
    BitBtn95.SetFocus;
end;

procedure TFrmCadProdutos.Edit3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
    Produto.vRegiao._marcaLinha
  else if Key = VK_F3 then
    Produto.vRegiao._desmarcaLinha;
end;

procedure TFrmCadProdutos.EditFiscal1Exit(Sender: TObject);
begin
  inherited;
  if Trim(EditFiscal1.Text) = 'Código [F3 - Pesquisar]' then
  	exit;
    
  Label178.Caption := Produto.vEtEs.existeProduto(Trim(EditFiscal1.Text), Trim(ComboBox44.Text));
  if Label178.Caption = 'PRODUTO NÃO ENCONTRADO' then
  begin
  	if (Self.Enabled) and (Self.Visible) and (EditFiscal1.CanFocus) then
	    EditFiscal1.SetFocus;
    exit;
  end;
end;

procedure TFrmCadProdutos.EditFiscal1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) or (Key = VK_TAB) then
  begin
    DBGrid16.Columns[3].Showing;
    if (Self.Enabled) and (Self.Visible) and (DBGrid16.CanFocus) then
	    DBGrid16.SetFocus;
    DBGrid16.Columns[3].Showing;
  end
  else if key = VK_F5 then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid17.CanFocus) then
	    DBGrid17.SetFocus;
  end
  else if key = VK_F6 then
    SpeedButton27.Click
  else if key = VK_F7 then
    SpeedButton28.Click
  else if key = VK_ESCAPE then
    SpeedButton29.Click
  else if key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');

    if Trim(vDadosIni.vPesquisa) <> '' then
      EditFiscal1.Text := Produto.vEtEs.getCodigo(Trim(vDadosIni.vPesquisa));
  end;
end;

procedure TFrmCadProdutos.EditFiscal2Exit(Sender: TObject);
begin
  inherited;
  if Trim(EditFiscal2.Text) =  'Código [F3 - Pesquisar]' then
  	exit;

  Label186.Caption := Produto.vEtiTer.existeProduto(Trim(EditFiscal2.Text), Trim(ComboBox44.Text));
  if Label186.Caption = 'PRODUTO NÃO ENCONTRADO' then
  begin
  	if (Self.Enabled) and (Self.Visible) and (EditFiscal2.CanFocus) then
	    EditFiscal2.SetFocus;
    exit;
  end;
end;

procedure TFrmCadProdutos.EditFiscal2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) or (Key = VK_TAB) then
  begin
    DBGrid18.Columns[3].Showing;
    if (Self.Enabled) and (Self.Visible) and (DBGrid18.CanFocus) then
	    DBGrid18.SetFocus;
    DBGrid18.Columns[3].Showing;
  end
  else if key = VK_F5 then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid19.CanFocus) then
	    DBGrid19.SetFocus;
  end
  else if key = VK_F6 then
    SpeedButton20.Click
  else if key = VK_F7 then
    SpeedButton31.Click
  else if key = VK_ESCAPE then
    SpeedButton32.Click
  else if key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
    if Trim(vDadosIni.vPesquisa) <> '' then
      EditFiscal2.Text := Produto.vEtiTer.getCodigo(Trim(vDadosIni.vPesquisa));
  end;
end;

procedure TFrmCadProdutos.EditHw10Exit(Sender: TObject);
begin
  inherited;
	if EditHw10.AsValue <> 0 then
  begin
    EditHw1.AsValue := 0;

    Produto.vPromocaoProduto.dataSet.FieldByName('markup').AsFloat := 0;
    Produto.vPromocaoProduto.dataSet.FieldByName('margem').AsFloat := 0;
  end;
end;

procedure TFrmCadProdutos.EditHw1Exit(Sender: TObject);
begin
  inherited;
  if EditHw1.AsValue > 0 then
  begin
  	EditHw10.AsValue := 0;

    Produto.vPromocaoProduto.dataSet.FieldByName('markup').AsFloat := 0;
    Produto.vPromocaoProduto.dataSet.FieldByName('margem').AsFloat := 0;
  end;
end;

procedure TFrmCadProdutos.EditHw2Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn98) then
    exit;

  if (EditHw2.AsValue > 0) then
  begin
    EditHw3.AsValue := 0;
    Produto.vPromocaoProduto.dataSet.FieldByName('markup').AsFloat := 0;
    Produto.vPromocaoProduto.dataSet.FieldByName('margem').AsFloat := 0;
  end;
end;

procedure TFrmCadProdutos.EditHw3Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn98) then
    exit;

  if (EditHw3.AsValue > 0) then
  begin
    EditHw2.AsValue := 0;
    Produto.vPromocaoProduto.dataSet.FieldByName('markup').AsFloat := 0;
    Produto.vPromocaoProduto.dataSet.FieldByName('margem').AsFloat := 0;
  end;
end;

procedure TFrmCadProdutos.EditHw4Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn114) then
    exit;

  if (EditHw4.AsValue > 0) then
  begin
    EditHw5.AsValue := 0;

    Produto.vPromocaoProduto.dataSet.FieldByName('markup').AsFloat := 0;
    Produto.vPromocaoProduto.dataSet.FieldByName('margem').AsFloat := 0;
  end;
end;

procedure TFrmCadProdutos.EditHw5Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn114) then
    exit;

  if (EditHw5.AsValue <> 0) then
  begin
    EditHw4.AsValue := 0;

    Produto.vPromocaoProduto.dataSet.FieldByName('markup').AsFloat := 0;
    Produto.vPromocaoProduto.dataSet.FieldByName('margem').AsFloat := 0;
  end;
end;

procedure TFrmCadProdutos.EditHw6Exit(Sender: TObject);
begin
  inherited;
  if EditHw6.AsInteger > 0 then
    DBLookupComboBox8.KeyValue := EditHw6.AsInteger;
end;

procedure TFrmCadProdutos.EditHw6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if Trim(DBLookupComboBox9.Text) = 'LOCALIDADE' then
    begin
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('LOCALIDADE');
      if trim(vDadosIni.vPesquisa) <> '' then
        EditHw6.AsValue := StrToFloat(vDadosIni.vPesquisa);
    end
    else if Trim(DBLookupComboBox9.Text) = 'SETOR' then
    begin
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SETOR');
      if trim(vDadosIni.vPesquisa) <> '' then
        EditHw6.AsValue := StrToFloat(vDadosIni.vPesquisa);
    end
    else if Trim(DBLookupComboBox9.Text) = 'CIDADE' then
    begin
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
      if trim(vDadosIni.vPesquisa) <> '' then
        EditHw6.AsValue := StrToFloat(vDadosIni.vPesquisa);
    end
    else if Trim(DBLookupComboBox9.Text) = 'AVULSO' then
    begin
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PROMOCAO', ' and ((data_ini is null) or (data_fim is null)) and cod_promocao > 0 ', 'Tabela de Preço');
      if trim(vDadosIni.vPesquisa) <> '' then
        EditHw6.AsValue := StrToFloat(vDadosIni.vPesquisa);
    end;
  end;
end;

procedure TFrmCadProdutos.EditMoedaFatorConvExit(Sender: TObject);
begin
  if (EditMoedaFatorConv.Valor > 1) then
  	EditMoedaFatorPrinc.Valor := 1
  else if (EditMoedaFatorConv.Valor > 0) and (EditMoedaFatorConv.Valor < 1) then
  	EditMoedaFatorPrinc.Valor := 1;
  exibirInfConversao;
end;

procedure TFrmCadProdutos.EditMoedaFatorConvSaidaExit(Sender: TObject);
begin
  if (EditMoedaFatorConvSaida.Valor > 1) then
  	EditMoedaFatorPrincSaida.Valor := 1
  else if (EditMoedaFatorConvSaida.Valor > 0) and (EditMoedaFatorConvSaida.Valor < 1) then
  	EditMoedaFatorPrincSaida.Valor := 1;
  exibirInfConversaoSaida;
end;

procedure TFrmCadProdutos.EditMoedaFatorPrincExit(Sender: TObject);
begin
  if (EditMoedaFatorPrinc.Valor > 1) then
  	EditMoedaFatorConv.Valor := 1
  else if (EditMoedaFatorPrinc.Valor > 0) and (EditMoedaFatorPrinc.Valor < 1) then
  	EditMoedaFatorConv.Valor := 1;
  exibirInfConversao;
end;

procedure TFrmCadProdutos.EditMoedaFatorPrincSaidaExit(Sender: TObject);
begin
  if (EditMoedaFatorPrincSaida.Valor > 1) then
  	EditMoedaFatorConvSaida.Valor := 1
  else if (EditMoedaFatorPrincSaida.Valor > 0) and (EditMoedaFatorPrincSaida.Valor < 1) then
  	EditMoedaFatorConvSaida.Valor := 1;
  exibirInfConversaoSaida;
end;

procedure TFrmCadProdutos.edLocalizarChange(Sender: TObject);
begin
  inherited;
  try
    if Trim(edLocalizar.Text) <> '' then
    begin
      Produto.vGradeEst.vGrade.dataSet.Filter := 'descricao like ''%' + edLocalizar.Text + '%''';
      Produto.vGradeEst.vGrade.dataSet.Filtered := True;
    end;
  finally
    if Trim(edLocalizar.Text) = '' then
    begin
      Produto.vGradeEst.vGrade.dataSet.Filtered := False;
      Produto.vGradeEst.vGrade.dataSet.Filter := '';
    end;
  end;
end;

procedure TFrmCadProdutos.edMarukpMargemExit(Sender: TObject);
begin
  inherited;

  if (Produto.vPromocaoProduto.ffloat((Sender as TDBEdit).DataField) <= 0) then
  begin
    Produto.vPromocaoProduto.dataSet.FieldByName('markup').AsFloat := 0;
    Produto.vPromocaoProduto.dataSet.FieldByName('margem').AsFloat := 0;
    Exit;
  end;

  EditHw1.AsValue := 0;
  EditHw2.AsValue := 0;
  EditHw3.AsValue := 0;
  EditHw4.AsValue := 0;
  EditHw5.AsValue := 0;
  EditHw10.AsValue := 0;

  if (Sender as TDBEdit).DataField = 'MARGEM' then
    Produto.vPromocaoProduto.dataSet.FieldByName('markup').AsFloat :=
      CalcUtils.Markup(Produto.vPromocaoProduto.ffloat('margem'), DIGROUNDMAX)
  else
    Produto.vPromocaoProduto.dataSet.FieldByName('margem').AsFloat :=
      CalcUtils.MargemLucro(Produto.vPromocaoProduto.ffloat('markup'), DIGROUNDMAX);
end;

procedure TFrmCadProdutos.EdNatReceitaChange(Sender: TObject);
begin
  inherited;
  TEdit(Sender).Text := vDadosIni.apenasNumeros(TEdit(Sender).Text);
end;

procedure TFrmCadProdutos.EdObsEtiqChange(Sender: TObject);
begin
  inherited;
	lbInfObsEtiq.Caption := '';

	lbInfObsEtiq.Caption  := Produto._retornaValorCalculadoEtiqueta(TEdit(Sender).Text);
end;

procedure TFrmCadProdutos.EdPerc30Exit(Sender: TObject);
begin
  inherited;
	if not Produto.ChecaPercPrecoEmLote(Produto.buscas, EdPerc30.AsValue, false, vMensagemTmp) then
  	if (Self.Enabled) and (Self.Visible) and (EdPerc30.CanFocus) then
    	EdPerc30.SetFocus;
end;

procedure TFrmCadProdutos.EdPerc60Exit(Sender: TObject);
begin
  inherited;
	if not Produto.ChecaPercPrecoEmLote(Produto.buscas, EdPerc60.AsValue, false, vMensagemTmp) then
  	if (Self.Enabled) and (Self.Visible) and (EdPerc60.CanFocus) then
    	EdPerc60.SetFocus;
end;

procedure TFrmCadProdutos.EdPerc90Exit(Sender: TObject);
begin
  inherited;
	if not Produto.ChecaPercPrecoEmLote(Produto.buscas, EdPerc90.AsValue, false, vMensagemTmp) then
  	if (Self.Enabled) and (Self.Visible) and (EdPerc90.CanFocus) then
    	EdPerc90.SetFocus;
end;

procedure TFrmCadProdutos.EdPercAtacExit(Sender: TObject);
begin
  inherited;
	if not Produto.ChecaPercPrecoEmLote(Produto.buscas, EdPercAtac.AsValue, false, vMensagemTmp) then
  	if (Self.Enabled) and (Self.Visible) and (EdPercAtac.CanFocus) then
    	EdPercAtac.SetFocus;
end;

procedure TFrmCadProdutos.EdPercMargemMinAtacadoExit(Sender: TObject);
begin
  inherited;
	if EdPercMargemMinAtacado.AsValue > 99 then
  begin
    Application.MessageBox('Não permitido margem maior que 99%', 'Aviso', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdPercMargemMinAtacado.CanFocus) then
      EdPercMargemMinAtacado.setfocus;
  end
end;

procedure TFrmCadProdutos.EdPercMargemMinVarejoExit(Sender: TObject);
begin
  inherited;
	if EdPercMargemMinVarejo.AsValue > 99 then
  begin
    Application.MessageBox('Não permitido margem maior que 99%', 'Aviso', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (EdPercMargemMinVarejo.CanFocus) then
      EdPercMargemMinVarejo.setfocus;
  end
end;

procedure TFrmCadProdutos.EdPercTabExit(Sender: TObject);
begin
  inherited;
	if not Produto.ChecaPercPrecoEmLote(Produto.buscas, EdPercTab.AsValue, false, vMensagemTmp) then
  	if (Self.Enabled) and (Self.Visible) and (EdPercTab.CanFocus) then
    	EdPercTab.SetFocus;
end;

procedure TFrmCadProdutos.EdPerfilProdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    if vDadosIni.PesqPros('PRO013', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
      //    if vDadosIni.PesqPros('PRO013', '', produto.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PERFIL_PRODUTOS');
        if vDadosIni.vPesquisa <> '' then
        begin
        	EdCodPerfilProd.AsValue := StrToInt(vDadosIni.vPesquisa);
          if not Produto.buscasPerfilProduto(EdCodPerfilProd.AsInteger) then
          begin
            Application.MessageBox('Perfil não encontrado ou se encontra na lixeira', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
            if (Self.Enabled) and (Self.Visible) and (EdCodPerfilProd.CanFocus) then
              EdCodPerfilProd.SetFocus;
            exit;
          end;
					atribuirDadosPerfil;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end
  else if Key = VK_F4 then
  begin
    if vDadosIni.PesqPros('PRO015', 'INCLUIR', '', 'PRODUTOS', '', Produto.buscas, true) then
      //    if vDadosIni.PesqPros('PRO015', '', produto.buscas, true) then
    begin
      try
        Screen.Cursor := crHourGlass;
        //        vPerfil.CadPerfilProd(1);
        Produto.PerfilProd.CadPerfilProd(1);
        if vDadosIni.vPesquisa <> '' then
        begin
          if not Produto.buscasPerfilProduto(EdCodPerfilProd.AsInteger) then
          begin
            Application.MessageBox('Perfil não encontrado ou se encontra na lixeira', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
            if (Self.Enabled) and (Self.Visible) and (EdCodPerfilProd.CanFocus) then
              EdCodPerfilProd.SetFocus;
            exit;
          end;
        	atribuirDadosPerfil;
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TFrmCadProdutos.exibirInfConversao;
begin
	if trim(ComboBoxUnidadePrinc.Items[ComboBoxUnidadePrinc.ItemIndex]) = '' then
  	LabelInfConversao.Caption := ''
  else if trim(DBComboBoxUnidadeConv.Items[DBComboBoxUnidadeConv.ItemIndex]) = '' then
  	LabelInfConversao.Caption := ''
	else if EditMoedaFatorConv.Valor <= 0 then
 		LabelInfConversao.Caption := ''
  else if (EditMoedaFatorPrinc.Valor <= 1) and (EditMoedaFatorConv.Valor <= 1) then
  	LabelInfConversao.Caption := ''
	else if EditMoedaFatorPrinc.Valor > 1 then
    LabelInfConversao.Caption :=
      FloatToStr(RoundTo(1, -4)) + ' ' +
      trim(DBComboBoxUnidadeConv.Items[DBComboBoxUnidadeConv.ItemIndex]) +
      ' = ' + FloatToStr(RoundTo(EditMoedaFatorPrinc.Valor, -4)) +
      ' ' + trim(ComboBoxUnidadePrinc.Items[ComboBoxUnidadePrinc.ItemIndex])
  else if EditMoedaFatorConv.Valor > 1 then
    LabelInfConversao.Caption :=
      FloatToStr(RoundTo(1, -4)) + ' ' +
      trim(ComboBoxUnidadePrinc.Items[ComboBoxUnidadePrinc.ItemIndex]) +
      ' = ' + FloatToStr(RoundTo(EditMoedaFatorConv.Valor, -4)) +
      ' ' + trim(DBComboBoxUnidadeConv.Items[DBComboBoxUnidadeConv.ItemIndex]);
end;

procedure TFrmCadProdutos.exibirInfConversaoSaida;
begin
	if trim(ComboBoxUnidadePrincSaida.Items[ComboBoxUnidadePrincSaida.ItemIndex]) = '' then
  	LabelInfConversaoSaida.Caption := ''
  else if trim(DBComboBoxUnidadeConvSaida.Items[DBComboBoxUnidadeConvSaida.ItemIndex]) = '' then
  	LabelInfConversaoSaida.Caption := ''
	else if EditMoedaFatorConvSaida.Valor <= 0 then
 		LabelInfConversaoSaida.Caption := ''
  else if (EditMoedaFatorPrincSaida.Valor <= 1) and (EditMoedaFatorConvSaida.Valor <= 1) then
  	LabelInfConversaoSaida.Caption := ''
	else if EditMoedaFatorPrincSaida.Valor <> 1 then
    LabelInfConversaoSaida.Caption :=
      FloatToStr(RoundTo(1, -4)) + ' ' +
      trim(DBComboBoxUnidadeConvSaida.Items[DBComboBoxUnidadeConvSaida.ItemIndex]) +
      ' = ' + FloatToStr(RoundTo(EditMoedaFatorPrincSaida.Valor, -4)) +
      ' ' + trim(ComboBoxUnidadePrincSaida.Items[ComboBoxUnidadePrincSaida.ItemIndex])
  else if EditMoedaFatorConvSaida.Valor <> 1 then
    LabelInfConversaoSaida.Caption :=
      FloatToStr(RoundTo(1, -4)) + ' ' +
      trim(ComboBoxUnidadePrincSaida.Items[ComboBoxUnidadePrincSaida.ItemIndex]) +
      ' = ' + FloatToStr(RoundTo(EditMoedaFatorConvSaida.Valor, -4)) +
      ' ' + trim(DBComboBoxUnidadeConvSaida.Items[DBComboBoxUnidadeConvSaida.ItemIndex]);
end;

procedure TFrmCadProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (PageControl1.ActivePage = tsDefinirPromocoes) then
  begin
    GroupBox3.Parent := TabSheet2;
    BitBtn91.Parent := Panel16;
    BitBtn2.Visible := True;
    BitBtn3.Visible := True;
    Panel1.Parent := TabSheet2;
    Panel2.Visible := True;
    PageControl1.ActivePage := TabSheet2;
  end;
  if (PageControl1.ActivePage = tsDefinirPrecoDiferenciado) then
  begin
    GroupBox3.Parent := TabSheet2;
    BitBtn91.Parent := Panel32;
    BitBtn2.Visible := True;
    BitBtn3.Visible := True;
    Panel1.Parent := TabSheet2;
    Panel2.Visible := True;
    PageControl1.ActivePage := TabSheet2;
  end;
  if (PageControl1.ActivePage = tsAlterDadosProd) then
  begin
    GroupBox3.Parent := TabSheet2;
    btVoltarDadosProd.Parent := Panel52;
    BitBtn2.Visible := True;
    BitBtn3.Visible := True;
    Panel1.Parent := TabSheet2;
    Panel2.Visible := True;
    PageControl1.ActivePage := TabSheet2;
  end;

  TabSheet2.show;
  inherited;

  gravaConfiguracoesFormRegistro;

  if not Assigned(DBGridEstoqueEmpresas.DataSource) then
    Exit;
  if not Assigned(DBGridPrecosVndPorEmpresa.DataSource) then
    Exit;
  if not Assigned(DBGridCodigo.DataSource) then
    Exit;
  if not Assigned(DBGridEstoqueEmpresas.DataSource.DataSet) then
    Exit;
  if not Assigned(DBGridPrecosVndPorEmpresa.DataSource.DataSet) then
    Exit;
  if not Assigned(DBGridCodigo.DataSource.DataSet) then
    Exit;

  if not PrimeiraPesquisa1 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGridEstoqueEmpresas, GridCfg1, cdsGrid1,
      cdsColunas1, usuario, ListGridsAndDataSets1, vDadosIni.transacaoCol);

  if not PrimeiraPesquisa2 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGridPrecosVndPorEmpresa, GridCfg2, cdsGrid2,
      cdsColunas2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);

  if not PrimeiraPesquisa3 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGridCodigo, GridCfg3, cdsGrid3,
      cdsColunas3, usuario, ListGridsAndDataSets3, vDadosIni.transacaoCol);

  vDadosIni.restoreDataSetDefaultCadPadrao(DBGridEstoqueEmpresas, GridCfg1, true, ListPositions1, cdsGrid1);

  vDadosIni.restoreDataSetDefaultCadPadrao(DBGridPrecosVndPorEmpresa, GridCfg2, true, ListPositions2, cdsGrid2);

  vDadosIni.restoreDataSetDefaultCadPadrao(DBGridCodigo, GridCfg3, true, ListPositions3, cdsGrid3);

  Produto.Destroy;
  if Assigned(Fconf_cest) then FreeAndNil(Fconf_cest);
  Action := caFree;
  FrmCadProdutos := nil;
end;

procedure TFrmCadProdutos.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
	vPrecos, vEtiqueta, vEti, vPedAberto, vGE, vPromocao, vTabPreco, vAlterDadosProd, vAlterDadosLote: Boolean;
begin
	vPrecos         := PageControl1.ActivePage = tsPrecos;
	vEtiqueta       := PageControl1.ActivePage = tbsEtiqueta;
  vEti            := PageControl1.ActivePage = tbsEti;
	vPedAberto      := PageControl1.ActivePage = tsPendenciaPedido;
  vGE             := PageControl1.ActivePage = tsGE;
  vPromocao       := PageControl1.ActivePage = tsDefinirPromocoes;
  vTabPreco       := PageControl1.ActivePage = tsDefinirPrecoDiferenciado;
  vAlterDadosProd := PageControl1.ActivePage = tsAlterDadosProd;
  vAlterDadosLote := PageControl1.ActivePage = tsAlterDadosLote;
  if TelaCadastro = 4 then
  	if not Produto._verificarProdutosSemCodigo then
    begin
		  Canclose := Application.MessageBox('Algum grupo do produto não foi informado, caso o grupo não seja informado o(s) produto(s) não será(ão) cadastrado(s). Deseja sair assim mesmo desta tela?',
	      'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES;
      if not Canclose then
      	exit;
      Self.fechar := True;
      Produto._produtosSemCodigo;
    end;
  inherited;

  if vHabQtdeVndPorMes then
    BitBtn16Click(Sender)
  else if vEtiqueta then
    BitBtn65Click(Sender)
  else if vEti then
  begin
    BitBtn68Click(Sender);
    BitBtn65Click(Sender);
  end
  else if vPedAberto then
    BitBtn8Click(Sender)
  else if vGE then
    BitBtn61Click(Sender)
  else if vPrecos then
    BitBtn23Click(Sender)
  else if vPromocao then
    BitBtn91Click(Sender)
  else if vTabPreco then
    BitBtn109Click(Sender)
  else if vAlterDadosProd then
    btVoltarDadosProdClick(Sender)
  else if vAlterDadosLote then
  begin
    btnCancProdLoteClick(Sender);
    btVoltarDadosProdClick(Sender);
  end;
end;

procedure TFrmCadProdutos.FormCreate(Sender: TObject);
var
  i: integer;
begin
	vCriou := 0;

  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'F3CADPRODUTO' then
  begin
  	if not Assigned(FrmCadProdutos) then
	    FrmCadProdutos := TFrmCadProdutos(self);
  end;
  inherited;
  vDadosIni.vShiftClick := False;
  Produto := TProdutos.Create;
  Produto.triggerCorrecaoGrupoProd;

  Produto.lerConfigAdc;
  pnTotEstEmp.Visible := Produto.vEstoquePorEmpresa.vExibirSomaTotalEstoque;

  edPickerGrupoFiscal.OnEntitySelected := EventChangeEntitiesSelects;
  edPickerGrupoFiscal.OnEntityAdd := EventAddEntitiesSelects;

  for I := 0 to PageControl1.PageCount - 1 do
  	PageControl1.Pages[i].TabVisible := false;

  for I := 0 to PageControl4.PageCount - 1 do
      PageControl4.Pages[i].TabVisible := false;

  for I := 0 to PageControl5.PageCount - 1 do
    PageControl5.Pages[i].TabVisible := false;

  for I := 0 to pgAltEstCust.PageCount - 1 do
    pgAltEstCust.Pages[i].TabVisible := false;

  PageControl5.ActivePageIndex := 0;
  PageControl4.ActivePageIndex := 0;
  PageControl3.ActivePageIndex := 0;
  PageControl2.ActivePageIndex := 0;
  PageControl1.ActivePageIndex := 0;

  vHabObservacaoProd := False;
  vHabCaracteristicaProd := False;
  vHabCodigoProd := False;

  vCtrlLocalClick := False;
  TelaCadastro := vDadosIni.vTipoForm;
  setNomeTabela('PRODUTOS', vDadosIni.vEmp.vCampoPadraoProd);
  alturaForm := TabSheet3.Height;
  larguraForm := TabSheet3.ClientWidth;
  alturaDefault := panel4.Height;
  larguraDefault := panel4.Width;
  tsPrecosModal.TabVisible := false;
  tsAltEstoque.TabVisible := false;
  tsDefinirPreco_Visualizar.TabVisible := false;
  TabSheet7.TabVisible := false;
  TabSheet8.TabVisible := false;
  tsPrecosQtde_Visualizar.TabVisible := false;
  TabSheet6.TabVisible := false;
  TabSheet16.TabVisible := false;
  tsECommerce.TabVisible := false;
  tsComercioAberto.TabVisible := false;
  tsCashback.TabVisible := false;
  tsGradesImagens.TabVisible := false;
  tsAlterDadosLote.TabVisible := false;
  tsDadosComercioAberto.TabVisible := false;
  tsOpcoesAlterarGrupo.TabVisible := false;
  tsGradeProducao.TabVisible := false;
  tsFretePesoGrid.TabVisible := False;
  tsFretePesoCadastro.TabVisible := False;
  tsProdutosAcabados.TabVisible := False;
  tsProdutosMatInsumos.TabVisible := False;
  tsUnidade.TabVisible := False;
  tsObsMaxmized.TabVisible := False;
  tsImagemProd.TabVisible := False;
  tsInsumosOutrosProd.TabVisible := False;

  vHabQtdeVndPorMes := false;
  vHabEstoquePorEmpresas := false;
  vHabPrecosVndPorEmpresa := false;
  vHabObservacaoProd := false;
  vHabCaracteristicaProd := false;
  vHabCodigoProd := false;

  TabSheet5.TabVisible := false;
  TabSheet9.TabVisible := false;
  TabSheet10.TabVisible := false;
  TabSheet11.TabVisible := false;
  TabSheet12.TabVisible := false;
  TabSheet13.TabVisible := false;
  TabSheet14.TabVisible := false;
  TabSheet17.TabVisible := false;
  TabSheet18.TabVisible := false;
  TabSheet19.TabVisible := false;
  TabSheetEC1.TabVisible := false;
  TabSheetEC2.TabVisible := false;
  TabSheetEC3.TabVisible := false;
  TabSheetEC4.TabVisible := false;
  TabSheetCA1.TabVisible := false;
  TabSheetCA2.TabVisible := false;
  TabSheetCA3.TabVisible := false;

  MenuLateralExibirObservacao.Checked := _LerConfiguracoesRegistroBoolean(MenuLateralExibirObservacao.Name);
  MenuLateralExibirDetalhesCaractersticas.Checked := _LerConfiguracoesRegistroBoolean(MenuLateralExibirDetalhesCaractersticas.Name);
  MenuLateralExibirCodigos.Checked := _LerConfiguracoesRegistroBoolean(MenuLateralExibirCodigos.Name);
	MenuLateralExibirEstoquePorEmpresa.Checked := _LerConfiguracoesRegistroBoolean(MenuLateralExibirEstoquePorEmpresa.Name, True);
  MenuLateralExibirPrecosVendaPorEmpresa.Checked := _LerConfiguracoesRegistroBoolean(MenuLateralExibirPrecosVendaPorEmpresa.Name, True);

  ckMenuLateral.Checked := _LerConfiguracoesRegistroBoolean(ckMenuLateral.Name + 'Prod', True);

  pnObservacao.Height := _LerConfiguracoesRegistroInteger(pnObservacao.Name, vDadosIni.IfThen(pnObservacao.Height < 48, 48, pnObservacao.Height));
  pnCaracteristica.Height := _LerConfiguracoesRegistroInteger(pnCaracteristica.Name, vDadosIni.IfThen(pnCaracteristica.Height < 48, 48, pnCaracteristica.Height));
  pnCodigo.Height := _LerConfiguracoesRegistroInteger(pnCodigo.Name, vDadosIni.IfThen(pnCodigo.Height < 48, 48, pnCodigo.Height));
  pnEstoqueEmpresas.Height := _LerConfiguracoesRegistroInteger(pnEstoqueEmpresas.Name, vDadosIni.IfThen(pnEstoqueEmpresas.Height < 48, 48, pnEstoqueEmpresas.Height));
	pnPrecosVndPorEmpresa.Height := _LerConfiguracoesRegistroInteger(pnPrecosVndPorEmpresa.Name, vDadosIni.IfThen(pnPrecosVndPorEmpresa.Height < 48, 48, pnPrecosVndPorEmpresa.Height));

  pnOpcaoDireitaProdutos.Width := _LerConfiguracoesRegistroInteger(pnOpcaoDireitaProdutos.Name, vDadosIni.IfThen(pnOpcaoDireitaProdutos.Width < 180, 180, pnOpcaoDireitaProdutos.Width));

  ckFiltrarEmpresa.Checked := _LerConfiguracoesRegistroBoolean(ckFiltrarEmpresa.Name);
  
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
  Produto._setaFormularioProd(self);
end;

procedure TFrmCadProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  I: Integer;
begin
  if (Key = VK_ESCAPE) and ((ActiveControl = DBEdit118) or (ActiveControl = DBEdit133)) then
    Exit;
  if (PageControl1.ActivePage = tsDefinirPromocoes) then
  begin
    if Key = VK_F2 then
    begin
      if CheckBox20.Checked then
        CheckBox20.Checked := false
      else
        CheckBox20.Checked := true;
    end;
  end;

  if Produto.cadastroSimplificado then
    if PageControl1.ActivePage = tsCadastroSimples then
      if Key = VK_F2 then
        CheckCadSeq_.Checked := not CheckCadSeq_.Checked;

  if (PageControl1.ActivePage = tsDefinirPrecoDiferenciado) then
  begin
    if Key = VK_F2 then
    begin
      if CheckBox21.Checked then
        CheckBox21.Checked := false
      else
        CheckBox21.Checked := true;
    end;
  end;

  if (PageControl7.ActivePage = TabSheet9) then
  begin
    if Key = VK_ESCAPE then
    begin
    	if (Self.Enabled) and (Self.Visible) and (BitBtn98.CanFocus) then
	      BitBtn98.SetFocus;
      BitBtn98.Click;
    end;
  end;

  vCtrlLocalClick := Key = VK_CONTROL;
  if key = VK_F3 then
    if PageControl1.ActivePage = TabSheet2 then
      if (Self.Enabled) and (Self.Visible) and (mkGrupo.CanFocus) then
      begin
        mkGrupo.SetFocus;
        Exit;
      end;
  inherited;
  if Panel7.Visible then
    exit;

  if Key = VK_F2 then
  begin
  	if (ckEcommerce.visible) and (ckEcommerce.Enabled) and (PageControl1.ActivePage = TabSheet2) then
      ckEcommerce.Checked := not ckEcommerce.Checked
    else if (ckEcommerce.visible) and (ckEcommerce.Enabled) and (PageControl1.ActivePage = tsDefinirPromocoes) then
    	ckEcommerce.Checked := not ckEcommerce.Checked
    else if (ckEcommerce.visible) and (ckEcommerce.Enabled) and (PageControl1.ActivePage = tsDefinirPrecoDiferenciado) then
    	ckEcommerce.Checked := not ckEcommerce.Checked
    else if (ckEcommerce.visible) and (ckEcommerce.Enabled) and (PageControl1.ActivePage = tsAlterDadosProd) then
    	ckEcommerce.Checked := not ckEcommerce.Checked;
  end
  else if Key = VK_F4 then
  begin
    if (ckEstoqueDisponivel.Visible) and (ckEstoqueDisponivel.Enabled) and (PageControl1.ActivePage = TabSheet2) then
      ckEstoqueDisponivel.Checked := not ckEstoqueDisponivel.Checked
    else if (ckEcommerce.visible) and (ckEcommerce.Enabled) and (PageControl1.ActivePage = tsDefinirPromocoes) then
    	ckEstoqueDisponivel.Checked := not ckEstoqueDisponivel.Checked
    else if (ckEcommerce.visible) and (ckEcommerce.Enabled) and (PageControl1.ActivePage = tsDefinirPrecoDiferenciado) then
    	ckEstoqueDisponivel.Checked := not ckEstoqueDisponivel.Checked
    else if (ckEstoqueDisponivel.Visible) and (ckEstoqueDisponivel.Enabled) and (PageControl1.ActivePage = tsAlterDadosProd) then
      ckEstoqueDisponivel.Checked := not ckEstoqueDisponivel.Checked;
  end
  else if Key = VK_F6 then
  begin
    if (ckLixeira.visible) and (ckLixeira.Enabled) and (PageControl1.ActivePage = TabSheet2) then
      ckLixeira.Checked := not ckLixeira.Checked
    else if (ckLixeira.visible) and (ckLixeira.Enabled) and (PageControl1.ActivePage = tsAlterDadosProd) then
    	ckLixeira.Checked := not ckLixeira.Checked
    else if (ckLixeira2.visible) and (ckLixeira2.Enabled) and (PageControl1.ActivePage = tsAlterDadosProd) then
    	ckLixeira2.Checked := not ckLixeira2.Checked;
  end
  else if Key = VK_F7 then
  begin
  	if (PageControl1.ActivePage = TabSheet2) then
      for I := 0 to Produto.dataSet.FieldCount - 1 do
        if Produto.dataSet.Fields[i].DisplayLabel = ComboBox1.Text then
          configuraCamposCodProd(Produto.dataSet.Fields[i].FieldName = 'COD_PROD');
  end
  else if Key = VK_F11 then
  begin
    if (CheckBox18.visible) and (CheckBox18.Enabled) and (PageControl1.ActivePage = TabSheet2) then
      CheckBox18.Checked := not CheckBox18.Checked;
  end
  else if Key = VK_F12 then
  begin
    if (ckMenuLateral.visible) and (ckMenuLateral.Enabled) and (PageControl1.ActivePage = TabSheet2) then
      ckMenuLateral.Checked := not ckMenuLateral.Checked;
  end
  else if key = VK_INSERT then
  begin
    if PageControl1.ActivePage = TabSheet2 then
      BitBtn3Click(Sender);
  end
  else if ((key = VK_ESCAPE) and (PageControl3.ActivePage <> tsDefinirPreco) and (PageControl3.ActivePage <> tsPrecosQtde)) then
  begin
    if Produto.dataSet.State in [dsEdit, dsInsert] then
      //(PageControl3.ActivePage = TabSheet3) or (PageControl3.ActivePage = TabSheet4) then
    begin
      if ActiveControl is Tdbedit then
      begin
        if
          TdataSet(TdbEdit(ActiveControl).DataSource.DataSet).FindField(TdbEdit(ActiveControl).DataField).EditMask = '' then
          if Application.MessageBox('Deseja sair desta tela de cadastro?', 'Confirmação',
            MB_YESNO
            + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
          begin
            if (Self.Enabled) and (Self.Visible) and (BitBtn5.CanFocus) then
              ActiveControl := BitBtn5
            else if (Self.Enabled) and (Self.Visible) and (BitBtn_5.CanFocus) then
              ActiveControl := BitBtn_5;
            BitBtn5Click(Sender);
          end;
      end
      else
      begin
        if not Produto.AlterarGrupo then
        begin
          if (Self.Enabled) and (Self.Visible) and (BitBtn5.CanFocus) then
            ActiveControl := BitBtn5
          else if (Self.Enabled) and (Self.Visible) and (BitBtn_5.CanFocus) then
            ActiveControl := BitBtn_5;
        end;
        BitBtn5Click(Sender);
      end;
    end;
  end;
end;

procedure TFrmCadProdutos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if Key = VK_CONTROL then
    vDadosIni.vCtrlClick := False;
  if Key = VK_SHIFT then
    vDadosIni.vShiftClick := False;
end;

procedure TFrmCadProdutos.FormResize(Sender: TObject);
begin
  inherited;
  if (ScrollBox4.Height >= alturaForm) and (ScrollBox4.Width >= larguraForm) then
  begin
    //panel4.Align := alClient;
    panel6.Align := alClient;
    Panel87.Align := alClient;
    Panel10.Align := alClient;
    Panel22.Align := alClient;
    Panel54.Align := alClient;
    Panel28.Align := alClient;
    pnTribAdicional.Align := alClient;
    Panel77.Align := alClient;
  end
  else
  begin
    if ScrollBox4.Height <= alturaForm then
    begin
      panel6.Align := alNone;
      panel6.Height := alturaDefault;
//      panel4.Align := alNone;
//      panel4.Height := alturaDefault;
      panel87.Align := alNone;
      panel87.Height := alturaDefault;
      panel10.Align := alNone;
      panel10.Height := alturaDefault;
      panel22.Align := alNone;
      panel22.Height := alturaDefault;
      panel54.Align := alNone;
      panel54.Height := alturaDefault;
      panel28.Align := alNone;
      panel28.Height := alturaDefault;
      pnTribAdicional.Align := alNone;
      pnTribAdicional.Height := alturaDefault;
      panel77.Align := alNone;
      panel77.Height := alturaDefault;
    end;
    if ScrollBox4.Width <= larguraForm then
    begin
      begin
        panel6.Align := alNone;
        panel6.Width := larguraDefault;
//        panel4.Align := alNone;
//        panel4.Width := larguraDefault;
        panel87.Align := alNone;
        panel87.Width := larguraDefault;
        panel10.Align := alNone;
	      panel10.Height := alturaDefault;
        panel22.Align := alNone;
	      panel22.Height := alturaDefault;
        panel54.Align := alNone;
	      panel54.Height := alturaDefault;
        panel28.Align := alNone;
	      panel28.Height := alturaDefault;
        pnTribAdicional.Align := alNone;
	      pnTribAdicional.Height := alturaDefault;
        panel77.Align := alNone;
	      panel77.Height := alturaDefault;
      end;
    end;
  end;

  if (pnOpcaoDireitaProdutos.Visible) then
  begin
  	if (vDadosIni.IfThen(pnObservacao.Visible, pnObservacao.Height, 0) +
    		vDadosIni.IfThen(SplitterObservacaoBottom.Visible, SplitterObservacaoBottom.Height, 0) +
        vDadosIni.IfThen(pnCaracteristica.Visible, pnCaracteristica.Height, 0) +  
      	vDadosIni.IfThen(SplitterCaracteristicaBottom.Visible, SplitterCaracteristicaBottom.Height, 0) +
        vDadosIni.IfThen(pnCodigo.Visible, pnCodigo.Height, 0) +
        vDadosIni.IfThen(SplitterCodigoEmpresasBottom.Visible, SplitterCodigoEmpresasBottom.Height, 0) +
        vDadosIni.IfThen(pnEstoqueEmpresas.Visible, pnEstoqueEmpresas.Height, 0) +
        vDadosIni.IfThen(SplitterEstoqueEmpresasBottom.Visible, SplitterEstoqueEmpresasBottom.Height, 0) +
        vDadosIni.IfThen(pnPrecosVndPorEmpresa.Visible, pnPrecosVndPorEmpresa.Height, 0) +
        vDadosIni.IfThen(SplitterPrecosVndPorEmpresaBottom.Visible, SplitterPrecosVndPorEmpresaBottom.Height, 0) +
        vDadosIni.IfThen(pnQtdeVndMes.Visible, pnQtdeVndMes.Height, 0) > pnOpcaoDireitaProdutos.Height) then
    begin
      AjustarBarraLateral(False);

      Splitter1.Align := alLeft;
      Splitter1.Align := alRight;
    end;
  end;
end;

procedure TFrmCadProdutos.FormShow(Sender: TObject);
var
  i: integer;
begin
	if not Self.Enabled then
    Exit;

  try
//    tbsEti.TabVisible := false;
	  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'F3CADPRODUTO' then
    begin
      if not Assigned(FrmCadProdutos) then
        FrmCadProdutos := TFrmCadProdutos(self);
    end;

    TelaCadastro := vDadosIni.vTipoForm;

    DBGrid1.DataSource := dtmProdutos.dsProdutos;
    DBMemoObs.DataSource := dtmProdutos.dsProdutos;
    DBMemoDetCarac.DataSource := dtmProdutos.dsProdutos;
    DBGrid1.Options := DBGrid1.Options - [dgMultiSelect];
    {    tsPecasUltimaCompra.TabVisible := false;
        tsFichas.TabVisible := false;
        tsPrecos.TabVisible := false;
        tsReceitaAss.TabVisible := false;
        tsGrade.TabVisible := false;
        tsAltEstCusto.TabVisible := false;
        tsModEtiTermica.TabVisible := false;
        tsEtiTerRapida.TabVisible:=false;
        tsAltCusto.TabVisible := false;
        tsReducao.TabVisible := false;
        tsGE.TabVisible := false;
        tsPendenciaPedido.TabVisible := false;
        tbsEtiqueta.TabVisible := false;
        tbsEti.TabVisible := false;
        tbsEtiMarcadas.TabVisible := false;
        tbsEtiCodBarra.TabVisible := false;
        tsEster.TabVisible := false;
        TabSheet_IndTecprod.TabVisible := False;
        TabSheet_IndTecEst.TabVisible := False;
        TabSheet_Validade.TabVisible := false;}
//    for I := 0 to PageControl1.PageCount - 1 do
//      PageControl1.Pages[i].TabVisible := false;
    //    for I := 0 to PageControl2.PageCount - 1 do
    //      PageControl2.Pages[i].TabVisible:=false;
    //    for I := 0 to PageControl3.PageCount - 1 do
    //      PageControl3.Pages[i].TabVisible:=false;
//    for I := 0 to PageControl4.PageCount - 1 do
//      PageControl4.Pages[i].TabVisible := false;
//    for I := 0 to PageControl5.PageCount - 1 do
//      PageControl5.Pages[i].TabVisible := false;
//    for I := 0 to pgAltEstCust.PageCount - 1 do
//      pgAltEstCust.Pages[i].TabVisible := false;
//    PageControl5.ActivePageIndex := 0;
//    PageControl4.ActivePageIndex := 0;
//    PageControl3.ActivePageIndex := 0;
//    PageControl2.ActivePageIndex := 0;
//    PageControl1.ActivePageIndex := 0;
//    PageControl7.ActivePage := TabSheet8;
//    PageControl9.ActivePage := TabSheet13;
    SpeedButton33.Enabled := (vDadosIni.vEmp.vUsarProducao = 'S') or (vDadosIni.vEmp.vUsarProducao = 'D');
    pagePrecos.ActivePage := tsDefinirPreco_Visualizar;
    pagePrecoQtde.ActivePage := tsPrecosQtde_Visualizar;

    SpeedButton17.Caption := 'v';
    SpeedButton17.Tag := 0;
    Panel2.Height := 57;
    {
    if vDadosIni.vProduto.vMaxDescPrecoAVista = 'S' then
    begin
      Label175.Caption := 'Calc Preço(%):';
      DBEdit90.Hint := 'Percentual utilizado para calcular o preço a vista pelo Preço de 30 dias';
    end
    else
    begin
      Label175.Caption := 'Desc Max(%):';
      DBEdit90.Hint := 'Máximo de desconto permitido para o produto';
    end;
    }
    DBEdit59.CharCase := ecUpperCase;
    if vCriou = 0 then
    begin
      Produto.abreProdutos(0, '0');

      Produto.CodBarra.abreCodBarras(Produto.DataSet);
	  	Produto.vEstoquePorEmpresa.abreEstoquePorEmpresa(Produto.dataSet);
      Produto.vEstoquePorEmpresa.vPrecoPorEmpresa.abrePrecoPorEmpresa(Produto.dataSet, true);
    end;

    verificarBotaoLixeira;

    if vCriou = 0 then
    begin
      setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

      vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
        vAlterarNomeDtSet1, GridCfg1, DBGridEstoqueEmpresas, cdsGrid1, cdsColunas1, trans, ListGridsAndDataSets1,
        ListPositions1, nomeDTSEt1, PrimeiraPesquisa1, vCamposPadraoRegistro1, usuario);

      vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
        vAlterarNomeDtSet2, GridCfg2, DBGridPrecosVndPorEmpresa, cdsGrid2, cdsColunas2, trans, ListGridsAndDataSets2,
        ListPositions2, nomeDTSEt2, PrimeiraPesquisa2, vCamposPadraoRegistro2, usuario);

      vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
        vAlterarNomeDtSet3, GridCfg3, DBGridCodigo, cdsGrid3, cdsColunas3, trans, ListGridsAndDataSets3,
        ListPositions3, nomeDTSEt2, PrimeiraPesquisa3, vCamposPadraoRegistro3, usuario);
    end;
    inherited;

    leConfiguracoesFormRegistro;
    
    //  if TelaCadastro = 0 then
    //    PageControl1.ActivePage := TabSheet2
    //  else if TelaCadastro = 1 then
    if TelaCadastro = 1 then
    begin
      //    PageControl1.ActivePage := TabSheet2;
      BitBtn3Click(Sender);
    end
    else if TelaCadastro = 2 then
    begin
      RadioGroup1.ItemIndex := 2;
      SpeedButton26.Click;
    end
    else if TelaCadastro = 3 then
    begin
      if Produto.vEtiTer = nil then
        Produto.vEtiTer := TEtiquetasTermicas.create;
      tsEtiTerRapida.Show;
    end
    else if ((TelaCadastro = 4) or (TelaCadastro = 5)) then
    begin
      SpeedButtonAlterDadosClick(Sender);
      if TelaCadastro = 4 then
	      WindowState := wsNormal;
    end
    else if TelaCadastro = 6 then
    begin
    	vDadosIni.vPesquisa := 'ETICOMUM|' + IntToStr(vDadosIni.vTagCodNF);
    	Produto._abreFormEtiquetasComum;
      FrmCadProdutos.fechar := True;
      PostMessage(FrmCadProdutos.Handle, WM_CLOSE, 0, 0)
    end;

    if vCriou = 0 then
    begin
      Produto.verificarSubGrupoZero;
      Produto.verificarGradezero;
    end;

    DBGrid16.OnTitleClick := GridTitleClick;
    DBGrid18.OnTitleClick := GridTitleClick;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;

  if vCriou = 0 then
  begin
    testarDiretorioImagemProduto;

  	abrirDiretorioDestinoImagem;
  end;

  SpeedButtonECommerce.Visible := vDadosIni.vEcommerce.vHabilitarEcommerce;
  SpeedButtonECommerce2.Visible := vDadosIni.vEcommerce.vHabilitarEcommerce;
  SpeedButtonComercioAberto.Visible := vDadosIni.vComercioAberto.vHabilitarComercioAberto;
  SpeedButtonComercioAberto2.Visible := vDadosIni.vComercioAberto.vHabilitarComercioAberto;
  SpeedButtonEnvComercioAberto.Visible := vDadosIni.vComercioAberto.vHabilitarComercioAberto;
  SpeedButtonCashback.Visible := vDadosIni.vCashback.vHabilitarCashback;

  MemoObsEtiq.Hint :=
    'Para utilizar um campo na observação informe o nome do campo, exemplo: [@NUM_FAB_PROD]' + #13 + #13 +
  	'Para descobrir o nome do campo posicione no campo desejado e aperte as teclas (Shift + Ctrl + Alt + F10)';
  MemoObsEtiqSimples.Hint := MemoObsEtiq.Hint;
  EdObsEtiq.Hint := MemoObsEtiq.Hint;

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "PRO174" HABILITAR CAMPO CONTROLE NUMERO DE SERIE NO PRODUTO'+ #13 +
    'Processo "PRO263" NÃO VERIFICAR PERC. DE COMISSAO NO CADASTRO DO PRODUTO'+ #13 +
    'Processo "PRO264" NÃO PERMITIR CADASTRO DO PRODUTO SEM PERC. DE COMISSÃO' + #13 +
    'Processo "PRO296" HABILITAR OUTROS DADOS CADASTRO SIMPL PROD' + #13 +
    'Processo "PRO297" HABILITAR DADOS FISCAIS CADASTRO SIMPL PROD' + #13 +
    'Processo "PRO298" HABILITAR COMPOSICAO CADASTRO SIMPL PROD' + #13 +
    'Processo "PRO299" HABILITAR CONVERSAO CADASTRO SIMPL PROD' + #13 +
    'Processo "PRO300" HABILITAR PRECOS CADASTRO SIMPL PROD' + #13 +
    'Processo "PRO302" HABILITAR PRECOS POR QTDE CADASTRO SIMPL PROD' + #13 +
    'Processo "PRO309" HABILITAR E-COMMERCE CADASTRO SIMPL PROD' + #13 +
    'Processo "PRO310" APAGAR PRODUTO UTILIZADO NO E-COMMERCE' + #13 +
    'Processo "PRO375" HABILITAR COMERCIO ABERTO CADASTRO SIMPL PROD' + #13 +
    'Processo "PRO380" APAGAR PRODUTO UTILIZADO NO COMERCIO ABERTO' + #13 +
    'Processo "PRO381" REMOVER SICRONIZACAO DO PRODUTO UTILIZADO NO ECOMMERCE' + #13 +
    'Processo "PRO403" PERMITIR UTILIZAR NUMERO FABRICANTE EXISTENTE EM OUTROS PRODUTOS' + #13 +
    'Processo "PRO404" PERMITIR UTILIZAR CODIGO DE BARRA EXISTENTE EM OUTROS PRODUTOS' + #13 +
    'Processo "PRO433" HABILITAR FRETE POR PESO CADASTRO SIMPL PROD' + #13 +
    'Processo "PRO451" HABILITAR KITS CADASTRO SIMPL PROD';

   imgInformationTipo.Hint := 'TIPO' + #13 + #13 +
    'BALD - BALANÇO DIÁRIO' + #13 +
    'BALG - BALANÇO GERAL' + #13 +
    'COR - CORREÇÕES DE ESTOQUE / CUSTO' + #13 +
    'DEV - DEVOLUÇÃO' + #13 +
    'NF - NOTA FISCAL' + #13 +
    'OS - ORDEM DE SERVIÇO' + #13 +
    'PDC - PRODUÇÃO' + #13 +
    'REQ - REQUISIÇÃO' + #13 +
    'X - EXCLUSÃO OU CANCELAMENTO OU REABERTURA';

   imgInformationTipoC.Hint := 'TIPO' + #13 + #13 +
    'BALD - BALANÇO DIÁRIO' + #13 +
    'BALG - BALANÇO GERAL' + #13 +
    'COR - CORREÇÕES DE ESTOQUE' + #13 +
    'CP - CUPOM FISCAL' + #13 +
    'DEV - DEVOLUÇÃO' + #13 +
    'NF - NOTA FISCAL' + #13 +
    'NFC - NOTA FISCAL CONSUMIDOR' + #13 +
    'NFD - NOTA FISCAL SÃ‰RIE D' + #13 +
    'ORC - ORÇAMENTO' + #13 +
    'OS - ORDEM DE SERVIÇO' + #13 +
    'PDC - PRODUÇÃO' + #13 +
    'REQ - REQUISIÇÃO' + #13 +
    'X - EXCLUSÃO OU CANCELAMENTO OU REABERTURA';

  DBEdit119.Width := 210;

  if vCriou = 0 then
  	vCriou := 1;

  vDadosIni.vTipoForm := 0;
  vDadosIni.vPesquisa := '';

  vDadosIni.fechaStatusProcessamento;
end;

function TFrmCadProdutos.GetBrowserHtml(const webBrowser: TWebBrowser): String;
var
  strStream: TStringStream;
  adapter: IStream;
  browserStream: IPersistStreamInit;
begin
  strStream := TStringStream.Create('');
  try
    browserStream := webBrowser.Document as IPersistStreamInit;
    adapter := TStreamAdapter.Create(strStream,soReference);
    browserStream.Save(adapter,true);
    result := strStream.DataString;
  finally
  end;
  strStream.Free();
end;

procedure TFrmCadProdutos.gravaConfiguracoesFormRegistro;
begin
	if (TelaCadastro <= 0) then
  begin
    _GravaConfiguracoesBoolean(CheckBox18.Name, CheckBox18.Checked);
  end;

  if (TelaCadastro <= 0) and (CheckBox18.Checked) then
  begin
  	_GravaConfiguracoesInteger(ComboBox17.Name, ComboBox17.ItemIndex);
    _GravaConfiguracoesInteger(ComboBox18.Name, ComboBox18.ItemIndex);
    _GravaConfiguracoesInteger(ComboBox19.Name, ComboBox19.ItemIndex);
  end;

  if (not SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
    CheckBox3.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
  begin
  	_GravaConfiguracoesInteger(ComboBox4.Name,  ComboBox4.ItemIndex);
    _GravaConfiguracoesInteger(ComboBox5.Name,  ComboBox5.ItemIndex);
    _GravaConfiguracoesInteger(ComboBox6.Name,  ComboBox6.ItemIndex);
    _GravaConfiguracoesInteger(ComboBox10.Name, ComboBox10.ItemIndex);
    _GravaConfiguracoesInteger(ComboBox7.Name,  ComboBox7.ItemIndex);
    _GravaConfiguracoesInteger(ComboBox8.Name,  ComboBox8.ItemIndex);
    _GravaConfiguracoesInteger(ComboBox9.Name,  ComboBox9.ItemIndex);
  end;

  if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
    _GravaConfiguracoesString(ComboBox11.Name, ComboBox11.Text);
    _GravaConfiguracoesString(ComboBox12.Name, ComboBox12.Text);

    _GravaConfiguracoesBoolean(CheckBox2.Name, CheckBox2.Checked);

    _GravaConfiguracoesString(MaskEdit5.Name, MaskEdit5.Text);
    _GravaConfiguracoesString(MaskEdit4.Name, MaskEdit4.Text);
    _GravaConfiguracoesString(MaskEdit6.Name, MaskEdit6.Text);
  end;
end;

procedure TFrmCadProdutos.gridFretePesoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if (key = VK_RETURN) then
    BitBtn135Click(Sender)
  else if (key = VK_DELETE) then
    BitBtn134Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn131Click(Sender);
end;

procedure TFrmCadProdutos.GridTitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(TDBGrid(Column.Grid), Column);
end;

procedure TFrmCadProdutos.GroupBox12Exit(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TFrmCadProdutos.GroupBox69Enter(Sender: TObject);
begin
  inherited;
  GroupBox69.Caption := 'Definir Preço de Tabela';
end;

procedure TFrmCadProdutos.GroupBox72Enter(Sender: TObject);
begin
  inherited;
  GroupBox72.Caption := 'Definir Promoção';
end;

procedure TFrmCadProdutos.GroupBox9Exit(Sender: TObject);
begin
  inherited;
  Produto.ValidaPrecoPromocao;
  if DBCheckBox1.Enabled then
    vDadosIni.GravaAuditoria('PRO020', 'PROMOCAO', '', 'PRODUTOS',
      Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString + ' Promoção=' +
      Produto.dataSet.FieldByName('EM_PROMOCAO').AsString + ' Preço:' +
      Produto.dataSet.FieldByName('PRECO_PROMOCAO').AsString, produto.buscas);
  //
  //    vDadosIni.GravaAuditoria('PRO020', 'Produto ' +
  //      Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString + ' Promoção=' +
  //      Produto.dataSet.FieldByName('EM_PROMOCAO').AsString + ' Preço:' +
  //      Produto.dataSet.FieldByName('PRECO_PROMOCAO').AsString, Produto.buscas);
  DBEdit76.Enabled := false;
  DBCheckBox1.Enabled := false;
end;

procedure TFrmCadProdutos.habilitarCamposComercioAberto(pFormulario: boolean = False);
begin
	pnImagemProduto.Align := alClient;
	pnImagemProduto.Parent := pnImagemProdutoCA;

	if Produto.vProdutosEC.existeGrade(Produto.dataSet) then
  begin
    pnGradesCA.Visible := true;

    pnAlterEstProdCA.Visible := false;
    pnAlterEstGradeCA.Visible := true;

    pnAlterEstCA.Parent := ScrollBox13;
    pnAlterEstCA.Align := alLeft;
  end
  else
  begin
    pnGradesCA.Visible := false;

    pnAlterEstProdCA.Visible := true;
    pnAlterEstGradeCA.Visible := false;

    pnAlterEstCA.Parent := pnImagensGradeCA;
    pnAlterEstCA.Align := alRight;
    pnAlterEstCA.Width := 384;
  end;

  pnOpcoesDadosCA.Visible := false;
  if not pFormulario then
  begin
    DesativarAtivarCamposHtml('C', true);
    PageControlCA.ActivePage := TabSheetCA1;

    carregarwebbrownser(WebBrowserCA, Produto.vProdutosEC.dataSet.FieldByName('DESCR_PROD_COMPL').AsString);
  end;

  Produto.vProdutosEC.vProdutosECgrade.abreProdutosECgrade(Produto.dataSet);
  if Produto.montarTreeViewCA then
  begin
  	Produto.montarTreeViewCA := false;
	  Produto.vProdutosEC.vProdutosECgrade.montarTreeView('C', Produto, TreeViewGradeCA);
  	Produto.vProdutosEC.vProdutosECgrade.montarTreeViewDB('C', Produto, TreeViewGradeCA_DB);
  end;
end;

procedure TFrmCadProdutos.habilitarCamposECommerce(pFormulario: boolean = False);
begin
	pnImagemProduto.Align := alClient;
  pnImagemProduto.Parent := pnImagemProdutoEC;

	if Produto.vProdutosEC.existeGrade(Produto.dataSet) then
  begin
    pnGradeVaricaoEC.Visible := true;
    pnAlterEstGradeEC.Visible := true;
  end
  else
  begin
    pnGradeVaricaoEC.Visible := false;
    pnAlterEstGradeEC.Visible := false;
  end;
  pnOpcoesDadosEC.Visible := false;
  if not pFormulario then
  begin
	  DesativarAtivarCamposHtml('E', true);
	  PageControlEC.ActivePage := TabSheetEC1;

  	carregarwebbrownser(WebBrowserEC, Produto.vProdutosEC.dataSet.FieldByName('DESCR_PROD_COMPL').AsString);
  end;

  Produto.vProdutosEC.vProdutosECgrade.abreProdutosECgrade(Produto.dataSet);
  if Produto.montarTreeViewEC then
  begin
  	Produto.montarTreeViewEC := false;
  	Produto.vCategorias.montarTreeView(TreeViewCat);
	  Produto.vCategorias.montarTreeViewDB(Produto, TreeViewCatDB);
	  Produto.vProdutosEC.vProdutosECgrade.montarTreeView('E', Produto, TreeViewGradeEC);
  	Produto.vProdutosEC.vProdutosECgrade.montarTreeViewDB('E', Produto, TreeViewGradeEC_DB);
  end;
end;

procedure TFrmCadProdutos.HabilitarCamposEdicao;
var
  I: Integer;
begin
  if (not Produto.AlterarGrupo) and (Produto.cadastroSimplificado) then
  begin
  	 Label571.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';
    DBLookupComboBox27.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';
    
    CheckCadSeq_.Checked := false;
    CheckCadSeq_.Enabled := false;
    CheckCadSeq_.visible := false;
    LabelSeq_.Visible := false;

    PageControl1.ActivePage        := tsCadastroSimples;
    tsCadastroSimples.Show;
    pageCadSimples.ActivePage      := tsS_Cadastro;
    tsS_Cadastro.Show;

    vDadosIni.carregarUnidades(
    	Produto.buscas,
      DBComboBox24,
      False,
      UpperCase(trim(Produto.dataset.FieldByName('unidade').AsString)));

    if Produto.AlterarGrupo then
      Label287.Caption := 'Detalhes / Caracteristicas                    -                    -                    -                    -                    -'
    else
    	Label287.Caption := 'Detalhes / Caracteristicas                    -                    -                    -                    -                    -  Imagens do Produto     -                    -                    -                    - ';

    pnImagemProduto.Visible        := True;
    lbqtdeImgProd.Caption          := '';
    lbS_qtdeImgProd.Caption        := lbqtdeImgProd.Caption;
    lbS_qtdeImgProdEC.Caption      := lbqtdeImgProd.Caption;
    lbS_qtdeImgProdCA.Caption      := lbqtdeImgProd.Caption;

  	montarComponentes;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    Label491.Visible               := vDadosIni.vEmp.vUsarProducao = 'S';
    DBComboBox15.Visible           := vDadosIni.vEmp.vUsarProducao = 'S';
    SpeedButton55.Visible          := vDadosIni.vEmp.vUsarProducao = 'S';
    edPickerGrupoFiscal.Parent     := lbGrupoFiscal2.Parent;
    edPickerGrupoFiscal.Left       := lbGrupoFiscal2.Left + lbGrupoFiscal2.Width + 6;
    edPickerGrupoFiscal.Top        := lbGrupoFiscal2.Top - 3;

    THackWinControl(pageCadSimples.ActivePage).SelectFirst;
  end
  else
  begin
    Label158.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';
    DBComboBox22.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';

    CheckCadSeq.Checked := false;
    CheckCadSeq.Enabled := false;
    CheckCadSeq.visible := false;
    LabelSeq.Visible := false;

    PageControl1.ActivePage        := TabSheet1;
    TabSheet1.Show;
    PageControl3.ActivePage        := TabSheet3;
    TabSheet3.Show;

  	 vDadosIni.carregarUnidades(
    	Produto.buscas,
      DBComboBox23,
      False,
      UpperCase(trim(Produto.dataset.FieldByName('unidade').AsString)));

    if Produto.AlterarGrupo then
    	Label229.Caption := 'Detalhes / Caracteristicas                    -                    -                    -                    -                    -'
  	 else
    	Label229.Caption := 'Detalhes / Caracteristicas                    -                    -                    -                    -                    -  Imagens do Produto     -                    -                    -                    - ';

    pnImagemProduto.Visible        := True;
    lbqtdeImgProd.Caption          := '';
    lbS_qtdeImgProd.Caption        := lbqtdeImgProd.Caption;
    lbS_qtdeImgProdEC.Caption      := lbqtdeImgProd.Caption;
    lbS_qtdeImgProdCA.Caption      := lbqtdeImgProd.Caption;

    montarComponentes(Produto.AlterarGrupo);

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    Label491.Visible               := vDadosIni.vEmp.vUsarProducao = 'S';
    DBComboBox15.Visible           := vDadosIni.vEmp.vUsarProducao = 'S';
    SpeedButton55.Visible          := vDadosIni.vEmp.vUsarProducao = 'S';
    edPickerGrupoFiscal.Parent     := lbGrupoFiscal.Parent;
    edPickerGrupoFiscal.Left       := lbGrupoFiscal.Left + lbGrupoFiscal.Width + 6;
    edPickerGrupoFiscal.Top        := lbGrupoFiscal.Top - 3;
    edPickerGrupoFiscal.TabOrder   := DBEdit22.TabOrder + 1;

    if not Produto.AlterarGrupo then
    begin
      DBEdit16.Enabled          := false;
      DBLookupComboBox1.Enabled := false;
      DBEdit59.Enabled          := true;
      if (Self.Enabled) and (Self.Visible) and (DBEdit59.CanFocus) then
        DBEdit59.SetFocus;
    end
    else if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
      DBEdit16.SetFocus;
  end;
end;

procedure TFrmCadProdutos.HabilitarCamposInclusao;
var
  I: Integer;
begin
  if Produto.cadastroSimplificado then
  begin
    Label571.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';
    DBLookupComboBox27.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';

  	 if (Self.TelaCadastro = 0) and (Self.CheckCadSeq.Tag = 0) then
    begin
      CheckCadSeq_.Enabled := true;
      CheckCadSeq_.Visible := true;
      LabelSeq_.Enabled := true;
      LabelSeq_.Visible := true;
    end;

    PageControl1.ActivePage        := tsCadastroSimples;
    tsCadastroSimples.Show;
    pageCadSimples.ActivePage      := tsS_Cadastro;
    tsS_Cadastro.Show;

  	vDadosIni.carregarUnidades(
      Produto.buscas,
      DBComboBox24,
      True,
      '');

    Label287.Caption := 'Detalhes / Caracteristicas                    -                    -                    -                    -                    -';

    pnImagemProduto.Visible        := False;
    lbqtdeImgProd.Caption          := '';
    lbS_qtdeImgProd.Caption        := lbqtdeImgProd.Caption;
    lbS_qtdeImgProdEC.Caption      := lbqtdeImgProd.Caption;
    lbS_qtdeImgProdCA.Caption      := lbqtdeImgProd.Caption;

    montarComponentes;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    PageControl1.ActivePage        := tsCadastroSimples;
    Label491.Visible               := vDadosIni.vEmp.vUsarProducao = 'S';
    DBComboBox15.Visible           := vDadosIni.vEmp.vUsarProducao = 'S';
    SpeedButton55.Visible          := vDadosIni.vEmp.vUsarProducao = 'S';
    SpeedButtonAlterarEst2.Visible := vDadosIni.vProduto.vAlterarEstoque;
    edPickerGrupoFiscal.Parent     := lbGrupoFiscal2.Parent;
    edPickerGrupoFiscal.Left       := lbGrupoFiscal2.Left + lbGrupoFiscal2.Width + 6;
    edPickerGrupoFiscal.Top        := lbGrupoFiscal2.Top - 3;

    THackWinControl(pageCadSimples.ActivePage).SelectFirst;
//      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox11.CanFocus) then
//        DBLookupComboBox11.SetFocus;
  end
  else
  begin
    Label158.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';
    DBComboBox22.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';
    
    if (Self.TelaCadastro = 0) and (Self.CheckCadSeq.Tag = 0) then
    begin
      CheckCadSeq.Enabled := true;
      CheckCadSeq.Visible := true;
      LabelSeq.Enabled := true;
      LabelSeq.Visible := true;
    end;

    PageControl1.ActivePage        := TabSheet1;
    TabSheet1.Show;
    PageControl3.ActivePage        := TabSheet3;
    TabSheet3.Show;

  	 vDadosIni.carregarUnidades(
      Produto.buscas,
      DBComboBox23,
      True,
      '');


    Label229.Caption := 'Detalhes / Caracteristicas                    -                    -                    -                    -                    -';

    pnImagemProduto.Visible        := False;
    lbqtdeImgProd.Caption          := '';
    lbS_qtdeImgProd.Caption        := lbqtdeImgProd.Caption;
    lbS_qtdeImgProdEC.Caption      := lbqtdeImgProd.Caption;
    lbS_qtdeImgProdCA.Caption      := lbqtdeImgProd.Caption;

    montarComponentes;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    Label491.Visible               := vDadosIni.vEmp.vUsarProducao = 'S';
    DBComboBox15.Visible           := vDadosIni.vEmp.vUsarProducao = 'S';
    SpeedButton55.Visible          := vDadosIni.vEmp.vUsarProducao = 'S';
    SpeedButtonAlterarEst.Visible  := vDadosIni.vProduto.vAlterarEstoque;
    edPickerGrupoFiscal.Parent     := lbGrupoFiscal.Parent;
    edPickerGrupoFiscal.Left       := lbGrupoFiscal.Left + lbGrupoFiscal.Width + 6;
    edPickerGrupoFiscal.Top        := lbGrupoFiscal.Top - 3;
    edPickerGrupoFiscal.TabOrder   := DBEdit22.TabOrder + 1;

    DBLookupComboBox1.Enabled := true;
    DBEdit16.Enabled := true;
    if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
      DBEdit16.SetFocus;
//      inherited;
  end;
end;

procedure TFrmCadProdutos.habilitarImagensProduto;
begin
	if (Produto.cadastroSimplificado) then
  begin
    pnImagemProduto.Align := alNone;
  	pnImagemProduto.Parent := scrollS_Outros;
    pnImagemProduto.Left := 458;
    pnImagemProduto.Top := DBMemo2.Top;
    pnImagemProduto.Height := 222;
    pnImagemProduto.Width := 356;
  end
  else
  begin
    pnImagemProduto.Align := alNone;
	  pnImagemProduto.Parent := scrollOutros;
    pnImagemProduto.Left := 458;
    pnImagemProduto.Top := 18;
    pnImagemProduto.Height := 222;
    pnImagemProduto.Width := 356;
  end;
end;

procedure TFrmCadProdutos.Image1DblClick(Sender: TObject);
//var
//  vTemp: string;    
begin
//	if not Assigned(Produto.vGradesImagens) then
//  	exit;
//
//  if Produto.vGradesImagens.Count <= 0 then
//  	exit;
//
//  if Produto.vGradesImagens.Items[Produto.vGradesImagens.fIndex].img.Count <= 0 then
//  	exit;
//
//  vTemp := Produto.vGradesImagens.Items[Produto.vGradesImagens.fIndex].img.ItemSelected.fileNameImagem;
//  InputQuery('Endereço da Imagem', 'Endereço da imagem', vTemp);

  if Produto.vImagensProd.dataSet.RecordCount <= 0 then
  	exit;

  if Produto.vImagensProd.dataSet.FieldByName('DATA_CAD').IsNull then
    EditDataCadImg.Text  := ''
  else
  	EditDataCadImg.Text  := FormatDateTime('dd/mm/yyyy', Produto.vImagensProd.dataSet.FieldByName('DATA_CAD').AsDateTime);

  MemoEndereco.Text      := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
  	trim(Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString);

  MemoUrl.Text           := trim(Produto.vImagensProd.dataSet.FieldByName('URL').AsString);

  MemoErro.Text          := trim(Produto.vImagensProd.dataSet.FieldByName('ERRO').AsString);

	if Produto.vImagensProd.dataSet.FieldByName('DATA_HORA_FALHA').IsNull then
    EditDataErroImg.Text := ''
  else
  	EditDataErroImg.Text := FormatDateTime('dd/mm/yyyy', Produto.vImagensProd.dataSet.FieldByName('DATA_HORA_FALHA').AsDateTime);

  if not vDadosIni.abreForm('Imagem', pnImagemProd, [ofAutoSize, ofEscapeExit]) then
  	exit;

//  vTemp := 'IMAGEM' + #13 + #13 +
//  	'Endereço: ' + IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
//  		trim(Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString);
//  InputQuery('Endereço da Imagem', 'Endereço da imagem', vTemp);
end;

procedure TFrmCadProdutos.LabelSeq_Click(Sender: TObject);
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

procedure TFrmCadProdutos.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (TelaCadastro <= 0) then
  begin
    CheckBox18.Checked := _LerConfiguracoesRegistroBoolean(CheckBox18.Name);
  end;

  if (TelaCadastro <= 0) and (CheckBox18.Checked) then
  begin
    ComboBox17.ItemIndex  := _LerConfiguracoesRegistroInteger(ComboBox17.Name);
    ComboBox18.ItemIndex  := _LerConfiguracoesRegistroInteger(ComboBox18.Name);
    ComboBox19.ItemIndex  := _LerConfiguracoesRegistroInteger(ComboBox19.Name);
  end;

  if (TelaCadastro <= 0) and (CheckBox3.Checked) then
  begin
    ComboBox4.ItemIndex  := _LerConfiguracoesRegistroInteger(ComboBox4.Name);
    ComboBox5.ItemIndex  := _LerConfiguracoesRegistroInteger(ComboBox5.Name);
    ComboBox6.ItemIndex  := _LerConfiguracoesRegistroInteger(ComboBox6.Name);
    ComboBox10.ItemIndex := _LerConfiguracoesRegistroInteger(ComboBox10.Name);
    ComboBox7.ItemIndex  := _LerConfiguracoesRegistroInteger(ComboBox7.Name);
    ComboBox8.ItemIndex  := _LerConfiguracoesRegistroInteger(ComboBox8.Name);
    ComboBox9.ItemIndex  := _LerConfiguracoesRegistroInteger(ComboBox9.Name);
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
    	ComboBox12.Text   := _LerConfiguracoesRegistroString(ComboBox12.Name);

    CheckBox2.Checked := _LerConfiguracoesRegistroBoolean(CheckBox2.Name);

    if Trim(_LerConfiguracoesRegistroString(MaskEdit5.Name)) <> '' then
    	MaskEdit5.Text    := _LerConfiguracoesRegistroString(MaskEdit5.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit4.Name)) <> '' then
    	MaskEdit4.Text    := _LerConfiguracoesRegistroString(MaskEdit4.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit6.Name)) <> '' then
    	MaskEdit6.Text    := _LerConfiguracoesRegistroString(MaskEdit6.Name);
  end;
end;

procedure TFrmCadProdutos.Marcarprodutoparaetiqueta1Click(Sender: TObject);
begin
  inherited;
  Produto.marcarProdutoEtiqueta;
end;

procedure TFrmCadProdutos.MarcarTodasPecosClickClick(Sender: TObject);
begin
  inherited;
  if not DBGrid23.Enabled then
    Exit;

  try
    Screen.Cursor := crHourGlass;
  	DBGrid23.Visible := False;
    Produto.vPromocaoProduto._marcarTodos;
  finally
    DBGrid23.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.MarcarTodasPecosQtdeClick(Sender: TObject);
begin
  inherited;
	if not DBGrid37.Enabled then
    Exit;

  try
    Screen.Cursor := crHourGlass;
  	DBGrid37.Visible := False;
    Produto.vProdutosPrecoQtde._marcarTodos;
  finally
    DBGrid37.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.MargemLucro_Atacado_Exit(Sender: TObject);
var
  calculoMargem, calculoPreco, calculoMarkup: Double;
begin
  if Produto.ffloat('MARGEM_A_DESEJ', -2) > 99.99 then
  begin
    ShowErro('Margem não pode ser superir a 99.99%');
    if Produto.cadastroSimplificado then
    begin
    	if (Self.Enabled) and (Self.Visible) and (edMarkUpAt.CanFocus) then
	      edMarkUpAt.SetFocus;
    end
    else
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
	      DBEdit18.SetFocus;
    end;
    Exit;
  end;
  Produto.HandleAlteracaoPreco((Sender as TDBEdit).DataField);
  {
  Produto.HandleAlteracaoMargemAtacado;
  if (vDadosIni.vEmp.vALT_PERC_MARGEM = 'S') and
     (Produto.ffloat('perc_tb_atac') <> 0) and
     (Produto.ffloat('prec_cusm_prod') > 0) then
  begin
    calculoMargem := Produto.ffloat('perc_tb_atac', -2);
    calculoPreco := RoundTo(Produto.ffloat('prec_cusm_prod') / (1 - (calculoMargem / 100)), 0 - vDadosIni.vEmp.vCasasDecimais);
    calculoMargem := RoundTo((((calculoPreco - Produto.ffloat('prec_cusm_prod')) / calculoPreco) * 100), -2);

    //Mesmo ajuste da nota
    if RoundTo(calculoMargem, -2) < Produto.ffloat('perc_tb_atac', -2) then
      calculoPreco := calculoPreco + 0.01;

    Produto.dataSet.FieldByName('prec_publico').AsFloat := calculoPreco;   // PRECO
    Produto.dataSet.FieldByName('perc_tb_proda').AsFloat := calculoMarkup; // MARKUP
    Produto.dataSet.FieldByName('perc_tb_atac').AsFloat := calculoMargem;  // MARGEM
  end;
  }
end;

procedure TFrmCadProdutos.MargemLucro_Varejo_Exit(Sender: TObject);
var
  calculoMargem, calculoPreco, calculoMarkup: Double;
begin
  if Produto.ffloat('MARGEM_V_DESEJ', -2) > 99.991 then
  begin
    ShowErro('Margem não pode ser superir a 99.99%');
    if Produto.cadastroSimplificado then
    begin
    	if (Self.Enabled) and (Self.Visible) and (edMarkUpTb.CanFocus) then
	      edMarkUpTb.SetFocus;
    end
    else
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBEdit35.CanFocus) then
	      DBEdit35.setfocus;
    end;
    Exit;
  end;
  Produto.HandleAlteracaoPreco((Sender as TDBEdit).DataField);
  {
  Produto.HandleAlteracaoMargemVarejo;
  if (vDadosIni.vEmp.vALT_PERC_MARGEM = 'S') and
     (Produto.ffloat('perc_tb_vare') <> 0) and
     (Produto.ffloat('prec_cusm_prod') > 0) then
  begin
    calculoMargem := Produto.ffloat('perc_tb_vare', -2);
    calculoPreco := RoundTo(Produto.ffloat('prec_cusm_prod') / (1 - (calculoMargem / 100)), 0 - vDadosIni.vEmp.vCasasDecimais);
    calculoMargem := RoundTo((((calculoPreco - Produto.ffloat('prec_cusm_prod')) / calculoPreco) * 100), -2);

    //Mesmo ajuste da nota
    if RoundTo(calculoMargem, -2) < Produto.ffloat('perc_tb_vare', -2) then
      calculoPreco := calculoPreco + 0.01;

    calculoMarkup := RoundTo(((calculoPreco - Produto.ffloat('prec_cusm_prod')) * 100) / Produto.ffloat('prec_cusm_prod'), -2);

    Produto.dataSet.FieldByName('prec_tab_prod').AsFloat := calculoPreco; // PRECO
    Produto.dataSet.FieldByName('perc_tb_prod').AsFloat := calculoMarkup; // MARKUP
    Produto.dataSet.FieldByName('perc_tb_vare').AsFloat := calculoMargem; // MARGEM

        // Preço 30 dias
    if (Produto.ffloat('PERC_AD_30') <> 0) then
      Produto.dataSet.FieldByName('PREC_30_PROD').AsFloat := RoundTo(
        Produto.ffloat('PREC_TAB_PROD') *
        ( 1 + (Produto.ffloat('PERC_AD_30') / 100)), -2);
    // Preço 60 dias
    if (Produto.ffloat('PERC_AD_60') <> 0) then
      Produto.dataSet.FieldByName('PREC_60_PROD').AsFloat := RoundTo(
        Produto.ffloat('PREC_TAB_PROD') *
        ( 1 + (Produto.ffloat('PERC_AD_60') / 100)), -2);
    // Preço 90 dias
    if (Produto.ffloat('PERC_AD_90') <> 0) then
      Produto.dataSet.FieldByName('PREC_90_PROD').AsFloat := RoundTo(
        Produto.ffloat('PREC_TAB_PROD') *
        ( 1 + (Produto.ffloat('PERC_AD_90') / 100)), -2);
  end;
  }
end;

procedure TFrmCadProdutos.MaskEdit11Change(Sender: TObject);
begin
  inherited;
  Produto.vGrupo.FindNearest([MaskEdit11.Text]);
end;

procedure TFrmCadProdutos.MaskEdit11Enter(Sender: TObject);
begin
  inherited;
  Produto.vGrupo.IndexFieldNames := 'DESCRICAO';
  MaskEdit11.OnChange := MaskEdit11Change;
end;

procedure TFrmCadProdutos.MaskEdit11Exit(Sender: TObject);
begin
  inherited;
  MaskEdit11.OnChange := nil;
end;

procedure TFrmCadProdutos.MaskEdit13Change(Sender: TObject);
begin
  inherited;
  Produto.vSubGrupo.FindNearest([MaskEdit13.Text]);
end;

procedure TFrmCadProdutos.MaskEdit13Enter(Sender: TObject);
begin
  inherited;
  Produto.vSubGrupo.IndexFieldNames := 'DESCRICAO';
  MaskEdit13.OnChange := MaskEdit13Change;
end;

procedure TFrmCadProdutos.MaskEdit13Exit(Sender: TObject);
begin
  inherited;
  MaskEdit13.OnChange := nil;
end;

procedure TFrmCadProdutos.MaskEdit18Exit(Sender: TObject);
begin
  inherited;
  if ActiveControl <> BitBtn61 then
  begin
    if (ActiveControl is TMaskEdit) and (TMaskEdit(sender).Text = '') then
    begin
      if RadioGroup1.ItemIndex = 0 then
      begin
        if TMaskEdit(sender) = MaskEdit18 then
          Application.MessageBox('Estoque de Segurança não Informado', 'Atenção', MB_ICONWARNING
            + MB_OK)
        else if TMaskEdit(sender) = MaskEdit14 then
          Application.MessageBox('Tempo Processamento não Informado', 'Atenção', MB_ICONWARNING +
            MB_OK)
        else if TMaskEdit(sender) = MaskEdit15 then
          Application.MessageBox('Tempo de Entrega não Informado', 'Atenção', MB_ICONWARNING +
            MB_OK)
        else if TMaskEdit(sender) = MaskEdit16 then
          Application.MessageBox('Tempo de Alocação não Informado', 'Atenção', MB_ICONWARNING +
            MB_OK)
        else if TMaskEdit(sender) = MaskEdit17 then
          Application.MessageBox('FrequÃªncia Pedido não Informado', 'Atenção', MB_ICONWARNING +
            MB_OK);
        if (Self.Enabled) and (Self.Visible) and (TMaskEdit(sender).CanFocus) then
	        TMaskEdit(sender).setfocus;
        exit;
      end
      else if RadioGroup1.ItemIndex = 1 then
      begin
        if TMaskEdit(sender) = MaskEdit18 then
          Application.MessageBox('Estoque de Segurança não Informado', 'Atenção', MB_ICONWARNING
            + MB_OK)
        else if TMaskEdit(sender) = MaskEdit14 then
          Application.MessageBox('Tempo Processamento não Informado', 'Atenção', MB_ICONWARNING +
            MB_OK)
        else if TMaskEdit(sender) = MaskEdit15 then
          Application.MessageBox('Tempo de Entrega não Informado', 'Atenção', MB_ICONWARNING +
            MB_OK)
        else if TMaskEdit(sender) = MaskEdit16 then
          Application.MessageBox('Tempo de Alocação não Informado', 'Atenção', MB_ICONWARNING +
            MB_OK)
        else if TMaskEdit(sender) = MaskEdit17 then
          Application.MessageBox('FrequÃªncia Pedido não Informado', 'Atenção', MB_ICONWARNING +
            MB_OK);
        if (Self.Enabled) and (Self.Visible) and (TMaskEdit(sender).CanFocus) then
	        TMaskEdit(sender).setfocus;
        exit;
      end;
    end;

    if (ActiveControl is TComboBox) and (TComboBox(sender).Text = '') then
    begin
      if TComboBox(sender) = ComboBox13 then
        Application.MessageBox('Quantidade de meses para a sugestão não informado', 'Atenção',
          MB_ICONWARNING + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (TComboBox(sender).CanFocus) then
	      TComboBox(sender).setfocus;
      exit;
    end;

    try
      strtoint(maskedit18.text);
      strtoint(maskedit14.text);
      strtoint(maskedit15.text);
      strtoint(maskedit16.text);
      strtoint(maskedit17.text);
      strtoint(combobox13.text);
    except
      Application.MessageBox(PChar('Erro de Conversão dos dados do tempo cíclico.' + chr(13) +
        'Valores devem ser números inteiros.'), 'Atenção', MB_ICONWARNING + MB_OK);
      if ActiveControl is TMaskEdit then
      begin
      	if (Self.Enabled) and (Self.Visible) and (TMaskEdit(sender).CanFocus) then
	        TMaskEdit(sender).setfocus;
      end
      else
      begin
      	if (Self.Enabled) and (Self.Visible) and (TComboBox(sender).CanFocus) then
	        TComboBox(sender).SetFocus;
      end;
    end;
  end;
end;

procedure TFrmCadProdutos.MaskEdit20Change(Sender: TObject);
begin
  inherited;
  Produto.vRegiao.FindNearest([MaskEdit20.Text]);
end;

procedure TFrmCadProdutos.MaskEdit20Enter(Sender: TObject);
begin
  inherited;
  Produto.vRegiao.IndexFieldNames := 'DESCRICAO';
  MaskEdit20.OnChange := MaskEdit20Change;
end;

procedure TFrmCadProdutos.MaskEdit20Exit(Sender: TObject);
begin
  inherited;
  MaskEdit20.OnChange := nil;
end;

procedure TFrmCadProdutos.MaskEdit22Change(Sender: TObject);
begin
  inherited;
  Produto.vPromocao.FindNearest([MaskEdit22.Text]);
end;

procedure TFrmCadProdutos.MaskEdit22Enter(Sender: TObject);
begin
  inherited;
  Produto.vPromocao.IndexFieldNames := 'DESCR_PROMOCAO';
  MaskEdit22.OnChange := MaskEdit22Change;
end;

procedure TFrmCadProdutos.MaskEdit22Exit(Sender: TObject);
begin
  inherited;
  MaskEdit22.OnChange := nil;
end;

procedure TFrmCadProdutos.MemoObsEtiqChange(Sender: TObject);
begin
  inherited;
	if not (Produto.dataSet.State in [dsInsert, dsEdit]) then
  	exit;
    
	lbTextoObsEtiq.Caption := '';
  lbTextoObsEtiqSimples.Caption := '';

	lbTextoObsEtiq.Caption  := Produto._retornaValorCalculadoEtiqueta(TMemo(Sender).Lines.Text);
  lbTextoObsEtiqSimples.Caption := lbTextoObsEtiq.Caption;

  Produto.dataSet.FieldByName('OBS_ETIQ').AsString := TMemo(Sender).Lines.Text;

  lbTextoObsEtiq.Width := MemoObsEtiq.Width;
  lbTextoObsEtiqSimples.Left := MemoObsEtiqSimples.Left;
  lbTextoObsEtiqSimples.Width := MemoObsEtiqSimples.Width;
end;

procedure TFrmCadProdutos.MemoObsEtiqSimplesChange(Sender: TObject);
begin
  inherited;
	if not (Produto.dataSet.State in [dsInsert, dsEdit]) then
  	exit;

	lbTextoObsEtiq.Caption := '';
  lbTextoObsEtiqSimples.Caption := '';

	lbTextoObsEtiq.Caption  := Produto._retornaValorCalculadoEtiqueta(TMemo(Sender).Lines.Text);
  lbTextoObsEtiqSimples.Caption := lbTextoObsEtiq.Caption;

  Produto.dataSet.FieldByName('OBS_ETIQ').AsString := TMemo(Sender).Lines.Text;

  lbTextoObsEtiq.Width := MemoObsEtiq.Width;
  lbTextoObsEtiqSimples.Left := MemoObsEtiqSimples.Left;
  lbTextoObsEtiqSimples.Width := MemoObsEtiqSimples.Width;
end;

procedure TFrmCadProdutos.MenuItem1Click(Sender: TObject);
begin
  inherited;
  if not (Produto.vPromocaoProduto.DeleteTodasPrecoDiferenciadoProduto) then
    exit;
end;

procedure TFrmCadProdutos.MenuLateralExibirCodigosClick(
  Sender: TObject);
begin
  try
    MenuLateralExibirCodigos.Checked := not MenuLateralExibirCodigos.Checked;

    if (not MenuLateralExibirObservacao.Checked)
    	and (not MenuLateralExibirDetalhesCaractersticas.Checked)
      and (not MenuLateralExibirCodigos.Checked)
      and (not MenuLateralExibirEstoquePorEmpresa.Checked)
      and (not MenuLateralExibirPrecosVendaPorEmpresa.Checked) then
        MenuLateralExibirObservacao.Checked := True;

    try
    	ckMenuLateral.Tag := 99;
    	ckMenuLateralClick(Sender);
    finally
    	ckMenuLateral.Tag := 0;
    end;
  finally
  	_GravaConfiguracoesBoolean(MenuLateralExibirCodigos.Name, MenuLateralExibirCodigos.Checked);
    _GravaConfiguracoesInteger(pnObservacao.Name, vDadosIni.IfThen(pnObservacao.Height < 48, 48, pnObservacao.Height));
    _GravaConfiguracoesInteger(pnCaracteristica.Name, vDadosIni.IfThen(pnCaracteristica.Height < 48, 48, pnCaracteristica.Height));
    _GravaConfiguracoesInteger(pnCodigo.Name, vDadosIni.IfThen(pnCodigo.Height < 48, 48, pnCodigo.Height));
    _GravaConfiguracoesInteger(pnEstoqueEmpresas.Name, vDadosIni.IfThen(pnEstoqueEmpresas.Height < 48, 48, pnEstoqueEmpresas.Height));
    _GravaConfiguracoesInteger(pnPrecosVndPorEmpresa.Name, vDadosIni.IfThen(pnPrecosVndPorEmpresa.Height < 48, 48, pnPrecosVndPorEmpresa.Height));
  end;
end;

procedure TFrmCadProdutos.MenuLateralExibirDetalhesCaractersticasClick(
  Sender: TObject);
begin
	try
    MenuLateralExibirDetalhesCaractersticas.Checked := not MenuLateralExibirDetalhesCaractersticas.Checked;

    if (not MenuLateralExibirObservacao.Checked)
    	and (not MenuLateralExibirDetalhesCaractersticas.Checked)
      and (not MenuLateralExibirCodigos.Checked)
      and (not MenuLateralExibirEstoquePorEmpresa.Checked)
      and (not MenuLateralExibirPrecosVendaPorEmpresa.Checked) then
        MenuLateralExibirObservacao.Checked := True;

    try
    	ckMenuLateral.Tag := 99;
    	ckMenuLateralClick(Sender);
    finally
    	ckMenuLateral.Tag := 0;
    end;
  finally
  	_GravaConfiguracoesBoolean(MenuLateralExibirDetalhesCaractersticas.Name, MenuLateralExibirDetalhesCaractersticas.Checked);
    _GravaConfiguracoesInteger(pnObservacao.Name, vDadosIni.IfThen(pnObservacao.Height < 48, 48, pnObservacao.Height));
    _GravaConfiguracoesInteger(pnCaracteristica.Name, vDadosIni.IfThen(pnCaracteristica.Height < 48, 48, pnCaracteristica.Height));
    _GravaConfiguracoesInteger(pnCodigo.Name, vDadosIni.IfThen(pnCodigo.Height < 48, 48, pnCodigo.Height));
    _GravaConfiguracoesInteger(pnEstoqueEmpresas.Name, vDadosIni.IfThen(pnEstoqueEmpresas.Height < 48, 48, pnEstoqueEmpresas.Height));
    _GravaConfiguracoesInteger(pnPrecosVndPorEmpresa.Name, vDadosIni.IfThen(pnPrecosVndPorEmpresa.Height < 48, 48, pnPrecosVndPorEmpresa.Height));
  end;
end;

procedure TFrmCadProdutos.MenuLateralExibirEstoquePorEmpresaClick(
  Sender: TObject);
begin
	try
    MenuLateralExibirEstoquePorEmpresa.Checked := not MenuLateralExibirEstoquePorEmpresa.Checked;

    if (not MenuLateralExibirObservacao.Checked)
    	and (not MenuLateralExibirDetalhesCaractersticas.Checked)
      and (not MenuLateralExibirCodigos.Checked)
      and (not MenuLateralExibirEstoquePorEmpresa.Checked)
      and (not MenuLateralExibirPrecosVendaPorEmpresa.Checked) then
        MenuLateralExibirObservacao.Checked := True;

    try
    	ckMenuLateral.Tag := 99;
    	ckMenuLateralClick(Sender);
    finally
    	ckMenuLateral.Tag := 0;
    end;
  finally
    _GravaConfiguracoesBoolean(MenuLateralExibirEstoquePorEmpresa.Name, MenuLateralExibirEstoquePorEmpresa.Checked);
    _GravaConfiguracoesInteger(pnObservacao.Name, vDadosIni.IfThen(pnObservacao.Height < 48, 48, pnObservacao.Height));
    _GravaConfiguracoesInteger(pnCaracteristica.Name, vDadosIni.IfThen(pnCaracteristica.Height < 48, 48, pnCaracteristica.Height));
    _GravaConfiguracoesInteger(pnCodigo.Name, vDadosIni.IfThen(pnCodigo.Height < 48, 48, pnCodigo.Height));
    _GravaConfiguracoesInteger(pnEstoqueEmpresas.Name, vDadosIni.IfThen(pnEstoqueEmpresas.Height < 48, 48, pnEstoqueEmpresas.Height));
    _GravaConfiguracoesInteger(pnPrecosVndPorEmpresa.Name, vDadosIni.IfThen(pnPrecosVndPorEmpresa.Height < 48, 48, pnPrecosVndPorEmpresa.Height));
  end;
end;

procedure TFrmCadProdutos.MenuLateralExibirObservacaoClick(Sender: TObject);
begin
	try
    MenuLateralExibirObservacao.Checked := not MenuLateralExibirObservacao.Checked;

    if (not MenuLateralExibirObservacao.Checked)
    	and (not MenuLateralExibirDetalhesCaractersticas.Checked)
      and (not MenuLateralExibirCodigos.Checked)
      and (not MenuLateralExibirEstoquePorEmpresa.Checked)
      and (not MenuLateralExibirPrecosVendaPorEmpresa.Checked) then
        MenuLateralExibirObservacao.Checked := True;

    try
    	ckMenuLateral.Tag := 99;
    	ckMenuLateralClick(Sender);
    finally
    	ckMenuLateral.Tag := 0;
    end;
  finally
    _GravaConfiguracoesBoolean(MenuLateralExibirObservacao.Name, MenuLateralExibirObservacao.Checked);
    _GravaConfiguracoesInteger(pnObservacao.Name, vDadosIni.IfThen(pnObservacao.Height < 48, 48, pnObservacao.Height));
    _GravaConfiguracoesInteger(pnCaracteristica.Name, vDadosIni.IfThen(pnCaracteristica.Height < 48, 48, pnCaracteristica.Height));
    _GravaConfiguracoesInteger(pnCodigo.Name, vDadosIni.IfThen(pnCodigo.Height < 48, 48, pnCodigo.Height));
    _GravaConfiguracoesInteger(pnEstoqueEmpresas.Name, vDadosIni.IfThen(pnEstoqueEmpresas.Height < 48, 48, pnEstoqueEmpresas.Height));
    _GravaConfiguracoesInteger(pnPrecosVndPorEmpresa.Name, vDadosIni.IfThen(pnPrecosVndPorEmpresa.Height < 48, 48, pnPrecosVndPorEmpresa.Height));
  end;
end;

procedure TFrmCadProdutos.MenuLateralExibirPrecosVendaPorEmpresaClick(
  Sender: TObject);
begin
	try
    MenuLateralExibirPrecosVendaPorEmpresa.Checked := not MenuLateralExibirPrecosVendaPorEmpresa.Checked;

    if (not MenuLateralExibirObservacao.Checked)
    	and (not MenuLateralExibirDetalhesCaractersticas.Checked)
      and (not MenuLateralExibirCodigos.Checked)
      and (not MenuLateralExibirEstoquePorEmpresa.Checked)
      and (not MenuLateralExibirPrecosVendaPorEmpresa.Checked) then
        MenuLateralExibirObservacao.Checked := True;

    try
    	ckMenuLateral.Tag := 99;
    	ckMenuLateralClick(Sender);
    finally
    	ckMenuLateral.Tag := 0;
    end;
  finally
  	_GravaConfiguracoesBoolean(MenuLateralExibirPrecosVendaPorEmpresa.Name, MenuLateralExibirPrecosVendaPorEmpresa.Checked);
    _GravaConfiguracoesInteger(pnObservacao.Name, vDadosIni.IfThen(pnObservacao.Height < 48, 48, pnObservacao.Height));
    _GravaConfiguracoesInteger(pnCaracteristica.Name, vDadosIni.IfThen(pnCaracteristica.Height < 48, 48, pnCaracteristica.Height));
    _GravaConfiguracoesInteger(pnCodigo.Name, vDadosIni.IfThen(pnCodigo.Height < 48, 48, pnCodigo.Height));
    _GravaConfiguracoesInteger(pnEstoqueEmpresas.Name, vDadosIni.IfThen(pnEstoqueEmpresas.Height < 48, 48, pnEstoqueEmpresas.Height));
    _GravaConfiguracoesInteger(pnPrecosVndPorEmpresa.Name, vDadosIni.IfThen(pnPrecosVndPorEmpresa.Height < 48, 48, pnPrecosVndPorEmpresa.Height));
  end;
end;

procedure TFrmCadProdutos.mkDescGrChange(Sender: TObject);
begin
  inherited;
  mkDescGr.text := StringReplace(mkDescGr.text, ' ', '', [rfReplaceAll, rfIgnoreCase]);
end;

procedure TFrmCadProdutos.mkDescSubGrChange(Sender: TObject);
begin
  inherited;
  mkDescSubGr.text := StringReplace(mkDescSubGr.text, ' ', '', [rfReplaceAll, rfIgnoreCase]);
end;

procedure TFrmCadProdutos.mkPromocaoChange(Sender: TObject);
begin
  inherited;
  mkPromocao.text := StringReplace(mkPromocao.text, ' ', '', [rfReplaceAll, rfIgnoreCase]);
end;

procedure TFrmCadProdutos.mkTipoChange(Sender: TObject);
begin
  inherited;
  mkTipo.text := StringReplace(mkTipo.text, ' ', '', [rfReplaceAll, rfIgnoreCase]);
end;

procedure TFrmCadProdutos.montarComponentes(pAlterarGrupo: boolean);
var
  vEstPend, vEstDisponivel: Double;
  vHabCampos: Boolean;
  vHabCamposList: TStrings;
  I: Integer;
  vBtnVisivel: Boolean;
  vAbaVisivel: Boolean;
  vLista: TStrings;
  bMarkupMargemVis: Boolean;
begin
	Label447.Visible := false;
  DBEdit6.Visible := false;
  SpeedButtonAlterarEst.Visible := false;
  Label449.Visible := false;
  DBEdit218.Visible := false;
  SpeedButtonAlterarEst2.Visible := false;
  DBEdit5.Enabled := false;
  DBEdit6.Enabled := false;
  DBEdit150.Enabled := false;
  DBEdit218.Enabled := false;
  SpeedButtonAlterarEst.Enabled := true;
  SpeedButtonAlterarEst2.Enabled := true;
  Produto.vHabAlterarEstoque := false;

  //imagen do produto
  pnEscolherGradeImage.Visible := Produto.vGradeProd.dataSet.RecordCount > 1;
  lbDescrGradeImg.Caption := 'PRINCIPAL';
//  DBLookupComboBoxEscoherGradeImg.KeyValue := Produto.vProdutosGradesImagens.dataSet.FieldByName('cod_grade').AsInteger;

	if Produto.vImagensProd.dataSet.RecordCount <= 0 then
  begin
    Image1.Picture.Assign(nil);
    Image1.Hint    := '';
  end
  else
  begin
  	if not FileExists(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
    	Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString) then
    begin
      if not FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
        Image1.Picture.LoadFromFile('')
      else
        Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg')
    end
    else
    begin
    	Image1.Picture.LoadFromFile(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
      	Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString);
    end;

    Image1.Hint    := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
      Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString;
  end;

  CarregarGruposFiscais();

  lbDescrGradeImg.Caption := trim(Produto.vImagensProd.dataSet.FieldByName('DESCR_GRADE').AsString);
  if Produto.dataSet.State <> dsEdit then
    lbqtdeImgProd.Caption := ''
  else if Produto.vImagensProd.dataSet.RecordCount <= 0 then
  	lbqtdeImgProd.Caption := '0/0'
  else
  	lbqtdeImgProd.Caption := IntToStr(Produto.vImagensProd.dataSet.RecNo) +
      '/' + IntToStr(Produto.vImagensProd.dataSet.RecordCount);

  lbS_qtdeImgProd.Caption   := lbqtdeImgProd.Caption;
  lbS_qtdeImgProdEC.Caption := lbqtdeImgProd.Caption;
  lbS_qtdeImgProdCA.Caption := lbqtdeImgProd.Caption;

  pn_CashbackButtom.Visible := False;

  if (not pAlterarGrupo) and (produto.cadastroSimplificado) then
  begin
    BitBtn4.Caption := 'OK';
    BitBtn5.Caption := 'Cancela';
    BitBtn_4.Caption := '&OK';
    BitBtn_5.Caption := '&Cancela';
  end
  else
  begin
    BitBtn_4.Caption := 'OK';
    BitBtn_5.Caption := 'Cancela';
    BitBtn4.Caption := '&OK';
    BitBtn5.Caption := '&Cancela';
  end;

  lbTextoObsEtiq.Caption := '';
  lbTextoObsEtiqSimples.Caption := '';

  MemoObsEtiq.Lines.Text := Produto.dataSet.FieldByName('OBS_ETIQ').AsString;
  MemoObsEtiqSimples.Lines.Text := Produto.dataSet.FieldByName('OBS_ETIQ').AsString;
  lbTextoObsEtiq.Caption  := Produto._retornaValorCalculadoEtiqueta(Produto.dataSet.FieldByName('OBS_ETIQ').AsString);
  lbTextoObsEtiqSimples.Caption := lbTextoObsEtiq.Caption;

  lbTextoObsEtiq.Width := MemoObsEtiq.Width;
  lbTextoObsEtiqSimples.Left := MemoObsEtiqSimples.Left;
  lbTextoObsEtiqSimples.Width := MemoObsEtiqSimples.Width;

  Label35.Alignment := taRightJustify;
  Label47.Alignment := taRightJustify;
  if vDadosIni.vProduto.Precos.UsarMargemAoMarkup then
  begin
    //DBEdit35.OnExit := MargemLucro_Varejo_Exit;
    DBEdit35.DataField := 'MARGEM_V_DESEJ';
    //DBEdit18.OnExit := MargemLucro_Atacado_Exit;
    DBEdit18.DataField := 'MARGEM_A_DESEJ';
    DBEdit1.DataField := 'MARGEM_30_DESEJ';
    DBEdit4.DataField := 'MARGEM_60_DESEJ';
    DBEdit15.DataField := 'MARGEM_90_DESEJ';
    Label35.Caption := '% Marg Vare';
    Label47.Caption := '% Marg Atac';
    Label31.Caption := '% Marg 30';
    Label36.Caption := '% Marg 60';
    Label37.Caption := '% Marg 90';

    edMarkUpTb.DataField := 'MARGEM_V_DESEJ';
    //edMarkUpTb.OnExit := MargemLucro_Varejo_Exit;
    edMarkUpAt.DataField := 'MARGEM_A_DESEJ';
    edMarkUp30.DataField := 'MARGEM_30_DESEJ';
    edMarkUp60.DataField := 'MARGEM_60_DESEJ';
    edMarkUp90.DataField := 'MARGEM_90_DESEJ';
    //edMarkUpAt.OnExit := MargemLucro_Atacado_Exit;
    edMarkUpTb.Hint := 'Percentual de Margem para calculo de preço de varejo';
    edMarkUpAt.Hint := 'Percentual de Margem para calculo de preço de venda de atacado';
    edMarkUp30.Hint := 'Percentual de Margem para calculo de preço de venda 30 dias';
    edMarkUp60.Hint := 'Percentual de Margem para calculo de preço de venda 60 dias';
    edMarkUp90.Hint := 'Percentual de Margem para calculo de preço de venda 90 dias';
  end
  else
  begin
    //DBEdit35.OnExit := DBEdit35Exit;
    DBEdit35.DataField := 'PERC_TB_PROD';
    DBEdit18.OnExit := DBEdit18Exit;
    DBEdit18.DataField := 'PERC_TB_PRODA';
    DBEdit1.DataField := 'PERC_TB_PROD3';
    DBEdit4.DataField := 'PERC_TB_PROD6';
    DBEdit15.DataField := 'PERC_TB_PROD9';
    Label35.Caption := '%Markup Varej:';
    Label47.Caption := '% Markup Atac:';
    Label31.Caption := '% Markup 30';
    Label36.Caption := '% Markup 60';
    Label37.Caption := '% Markup 90';

    edMarkUpTb.DataField := 'PERC_TB_PROD';
    //edMarkUpTb.OnExit := DBEdit35Exit;
    edMarkUpTb.Hint := 'Percentual de MarkUp para calculo de preço de varejo';
    edMarkUpAt.DataField := 'PERC_TB_PRODA';
    edMarkUp30.DataField := 'PERC_TB_PROD3';
    edMarkUp60.DataField := 'PERC_TB_PROD6';
    edMarkUp90.DataField := 'PERC_TB_PROD9';
    //edMarkUpAt.OnExit := DBEdit18Exit;
    edMarkUpAt.Hint := 'Percentual de MarkUp para calculo de preço de venda de atacado';
    edMarkUp30.Hint := 'Percentual de MarkUp para calculo de preço de venda 30 dias';
    edMarkUp60.Hint := 'Percentual de MarkUp para calculo de preço de venda 60 dias';
    edMarkUp90.Hint := 'Percentual de MarkUp para calculo de preço de venda 90 dias';
  end;
  DBEdit35.Hint := edMarkUpTb.Hint;
  DBEdit18.Hint := edMarkUpAt.Hint;
  lbMarkUpTb.Hint := edMarkUpTb.Hint;
  lbMarkUpAt.Hint := edMarkUpAt.Hint;
  tsPrecosModal.TabVisible := False;
  lbPrecoMarkupProporcional.Caption := IfThen(vDadosIni.vProduto.Precos.ManterPrecoMarkupProporcional, 'SIM', 'NAO');
  //lbDescontoPreco30noVarejo.Caption := IfThen(Produto.Confs.Precos.VarejoComDesconto30Dias, 'SIM', 'NAO');
  //lbAdicionalPreco3060e90.Caption := IfThen(Produto.Confs.Precos.PreferirAdicional306090, 'SIM', 'NAO');

  pnDescImagemProduto.Visible := vDadosIni.vEcommerce.vHabilitarEcommerce;
  OpenPictureDialog1.Filter := 'All (*.jpg;*.jpeg' + IfThen((vDadosIni.vEcommerce.vHabilitarEcommerce) or (vDadosIni.vComercioAberto.vHabilitarComercioAberto), '', ';*.bmp') + ')' +
  														 '|*.jpg;*.jpeg' + IfThen((vDadosIni.vEcommerce.vHabilitarEcommerce) or (vDadosIni.vComercioAberto.vHabilitarComercioAberto), '', ';*.bmp') +
                               '|JPEG Image File (*.jpg)' +
                               '|*.jpg'+
                               '|JPEG Image File (*.jpeg)' +
                               '|*.jpeg' +
                               IfThen((vDadosIni.vEcommerce.vHabilitarEcommerce) or (vDadosIni.vComercioAberto.vHabilitarComercioAberto), '', '|Bitmaps (*.bmp)' + '|*.bmp');

  if Produto.dataSet.State = dsEdit then
  begin
    pageFretePeso.ActivePage := tsFretePesoGrid;
    gridFretePeso.DataSource := Produto.FretePorPeso._dataSourceOOP;
    edFreteCodCliente.DataSource := Produto.FretePorPeso._dataSourceOOP;
    edFreteUnidade.DataSource := Produto.FretePorPeso._dataSourceOOP;
    edFretePeso.DataSource := Produto.FretePorPeso._dataSourceOOP;
    edFreteValor.DataSource := Produto.FretePorPeso._dataSourceOOP;

    edFreteCodCliente.ListSource := Produto.FretePorPeso.dataFornecedor._dataSourceOOP;
  end;

  bMarkupMargemVis := vDadosIni.PesqPros('PRO439', 'HABILITAR', '', '', '', Produto.buscas, False, False, True);

  for I := 0 to DBGrid23.Columns.Count - 1 do
    if MatchText(DBGrid23.Columns[I].FieldName, ['MARKUP', 'MARGEM']) then
      DBGrid23.Columns[I].Visible := bMarkupMargemVis;

  pnDadosEC.Enabled := false;
  if (not pAlterarGrupo) and (produto.cadastroSimplificado) then
  begin
    tsS_Outros.OnExit     		:= tabSheetCadastroSimplesExit;
    tsS_Fiscal.OnExit     		:= tabSheetCadastroSimplesExit;
    tsS_Composicao.OnExit 		:= tabSheetCadastroSimplesExit;
    tsS_Conversao.OnExit  		:= tabSheetCadastroSimplesExit;
    tsS_Precos.OnExit     		:= tabSheetCadastroSimplesExit;
    tsS_PrecosPorQtde.OnExit	:= tabSheetCadastroSimplesExit;
    tsS_KitsProd.OnExit	      := tabSheetCadastroSimplesExit;
    tsS_ECommerce.OnExit      := tabSheetCadastroSimplesExit;
    tsS_ComercioAberto.OnExit := tabSheetCadastroSimplesExit;
    tsS_Cashback.OnExit       := tabSheetCadastroSimplesExit;
    {
    edPercAj30.OnExit := PercAdicional30DiasExit;
    edPercAj60.OnExit := PercAdicional60DiasExit;
    edPercAj90.OnExit := PercAdicional90DiasExit;
    }
    if vDadosIni.PesqPros('PRO296', 'HABILITAR', '', '', '', Produto.buscas, False, False, True) then
      tsS_Outros.Tag := 1
    else
      tsS_Outros.Tag := 0;

    if Produto.dataSet.State = dsInsert then
      tsS_Fiscal.Tag := 1
    else if vDadosIni.PesqPros('PRO297', 'HABILITAR', '', '', '', Produto.buscas, False, False, True) then
      tsS_Fiscal.Tag := 1
    else
      tsS_Fiscal.Tag := 0;

    if not(vDadosIni.strIn(vDadosIni.vEmp.vUsarProducao, ['S', 'D'])) then
      tsS_Composicao.Tag := 0
    else if Produto.dataSet.State = dsInsert then
      tsS_Composicao.Tag := 0
    else if vDadosIni.PesqPros('PRO298', 'HABILITAR', '', '', '', Produto.buscas, False, False, True) then
      tsS_Composicao.Tag := 1
    else
      tsS_Composicao.Tag := 0;

    if Produto.dataSet.State = dsInsert then
      tsS_Conversao.Tag := 0
    else if vDadosIni.PesqPros('PRO299', 'HABILITAR', '', '', '', Produto.buscas, False, False, True) then
      tsS_Conversao.Tag := 1
    else
      tsS_Conversao.Tag := 0;

    if Produto.dataSet.State = dsInsert then
      tsS_Precos.Tag := 0
    else if vDadosIni.PesqPros('PRO300', 'HABILITAR', '', '', '', Produto.buscas, False, False, True) then
      tsS_Precos.Tag := 1
    else
      tsS_Precos.Tag := 0;

    if Produto.dataSet.State = dsInsert then
      tsS_PrecosPorQtde.Tag := 0
    else if vDadosIni.PesqPros('PRO302', 'HABILITAR', '', '', '', Produto.buscas, False, False, True) then
      tsS_PrecosPorQtde.Tag := 1
    else
      tsS_PrecosPorQtde.Tag := 0;

    if Produto.dataSet.State = dsInsert then
      tsS_KitsProd.Tag := 0
    else  if vDadosIni.PesqPros('PRO451', 'HABILITAR', '', '', '', Produto.buscas, False, False, True) then
      tsS_KitsProd.Tag := 1
    else
      tsS_KitsProd.Tag := 0;

    if not vDadosIni.vEcommerce.vHabilitarEcommerce then
      tsS_ECommerce.Tag := 0
    else if Produto.dataSet.State = dsInsert then
      tsS_ECommerce.Tag := 0
    else if vDadosIni.PesqPros('PRO309', 'HABILITAR', '', '', '', Produto.buscas, False, False, True) then
      tsS_ECommerce.Tag := 1
    else
      tsS_ECommerce.Tag := 0;

    if not vDadosIni.vComercioAberto.vHabilitarComercioAberto then
      tsS_ComercioAberto.Tag := 0
    else if Produto.dataSet.State = dsInsert then
      tsS_ComercioAberto.Tag := 0
    else if vDadosIni.PesqPros('PRO375', 'HABILITAR', '', '', '', Produto.buscas, False, False, True) then
      tsS_ComercioAberto.Tag := 1
    else
      tsS_ComercioAberto.Tag := 0;

    if not vDadosIni.vCashback.vHabilitarCashback then
      tsS_Cashback.Tag := 0
    else if Produto.dataSet.State = dsInsert then
      tsS_Cashback.Tag := 0
    else if vDadosIni.PesqPros('PRO456', 'HABILITAR', '', '', '', Produto.buscas, False, False, True) then
      tsS_Cashback.Tag := 1
    else
      tsS_Cashback.Tag := 0;

    if Produto.dataSet.State = dsInsert then
      tsS_FretePeso.Tag := 0
    else if vDadosIni.PesqPros('PRO433', 'HABILITAR', '', '', '', Produto.buscas, False, False, True) then
      tsS_FretePeso.Tag := 1
    else
      tsS_FretePeso.Tag := 0;

    vBtnVisivel := vDadosIni.getConfSisBool('prod_cad_simpl_usar_botoes_n_abas', Produto.buscas);
    vAbaVisivel := not vBtnVisivel;

    tsS_Outros.TabVisible    			  := (vAbaVisivel) and (tsS_Outros.Tag = 1);
    tsS_Fiscal.TabVisible    			  := (vAbaVisivel) and (tsS_Fiscal.Tag = 1);
    tsS_Composicao.TabVisible 		  := (vAbaVisivel) and (tsS_Composicao.Tag = 1);
    tsS_Conversao.TabVisible 			  := (vAbaVisivel) and (tsS_Conversao.Tag = 1);
    tsS_Precos.TabVisible     			:= (vAbaVisivel) and (tsS_Precos.Tag = 1);
    tsS_KitsProd.TabVisible     		:= (vAbaVisivel) and (tsS_KitsProd.Tag = 1);
    tsS_PrecosPorQtde.TabVisible    := (vAbaVisivel) and (tsS_PrecosPorQtde.Tag = 1);
    tsS_ECommerce.TabVisible 				:= (vAbaVisivel) and (tsS_ECommerce.Tag = 1);
    tsS_ComercioAberto.TabVisible 	:= (vAbaVisivel) and (tsS_ComercioAberto.Tag = 1);
    tsS_Cashback.TabVisible         := (vAbaVisivel) and (tsS_Cashback.Tag = 1);
    tsS_FretePeso.TabVisible      	:= (vAbaVisivel) and (tsS_FretePeso.Tag = 1);

    btnSOutros.Visible     			    := (vBtnVisivel) and (tsS_Outros.Tag = 1);
    btnSFiscal.Visible     			    := (vBtnVisivel) and (tsS_Fiscal.Tag = 1);
    btnSComposicao.Visible 			    := (vBtnVisivel) and (tsS_Composicao.Tag = 1);
    btnSConversao.Visible  		     	:= (vBtnVisivel) and (tsS_Conversao.Tag = 1);
    btnSPrecos.Visible     			    := (vBtnVisivel) and (tsS_Precos.Tag = 1);
    btnSKitsProd.Visible     		    := (vBtnVisivel) and (tsS_KitsProd.Tag = 1);
    btnSPrecoPorQtde.Visible        := (vBtnVisivel) and (tsS_PrecosPorQtde.Tag = 1);
    btnSECommerce.Visible           := (vBtnVisivel) and (tsS_ECommerce.Tag = 1);
    btnSComercioAberto.Visible      := (vBtnVisivel) and (tsS_ComercioAberto.Tag = 1);
    btnSCashback.Visible            := (vBtnVisivel) and (tsS_Cashback.Tag = 1);
    btnSFretePeso.Visible           := (vBtnVisivel) and (tsS_FretePeso.Tag = 1);

    if Produto.vLKTpFabricacao.dataSet = nil then
      Produto.vLKTpFabricacao.setDadosDataSet(['T', 'P'], ['Terceiro', 'Própria'], nil);
    if Produto.vLKSimNao.dataSet = nil then
      Produto.vLKSimNao.setDadosDataSet(['S', 'N'], ['Sim', 'Nao'], nil);
    if Produto.vLKContNumSerie.dataSet = nil then
      Produto.vLKContNumSerie.setDadosDataSet(['', 'E', 'O', 'N'], ['', 'ECF - Emissor de Cupom Fiscal', 'Outros - (Nobreak, Computador, etc', 'Não - Sem controle de numero de serie'], nil);

    Produto.vLKMarca.Sql := 'select COD_MARCA, rtrim(DESCRICAO_MARCA) DESCRICAO_MARCA from marca_prod where ativo = 1 order by DESCRICAO_MARCA';// and coalesce(tipo_marca, '''') <> ''V''';
    Produto.vLKMarca.setDadosDataSet(['COD_MARCA', 'MARCA_P'], ['COD_MARCA', '%DESCRICAO_MARCA'], [],
      Produto.buscas, DBEdit123, dbgridLookUp);

    // Tipo lista fabrica
    Produto.ExecutaComandosSql(' SELECT TRIM(SIGLA) SIGLA, (TRIM(SIGLA)||'' - ''||TRIM(DESCRICAO)) DESCRICAO FROM TIPO_LISTA_FABRICA WHERE ATIVO = 1 ORDER BY 2 ', False);
    Produto.vLKTpListaFab.setDadosDataSet('SIGLA', 'DESCRICAO', Produto.buscas,  DBLookupComboBox21);

    // tipo fabricacao
    Produto.vLKTpFabricacao.setDBLookupComboBox(DBLookupComboBox13);
    // balanca sim nao
    Produto.vLKSimNao.setDBLookupComboBox(DBLookupComboBox14);
    // consumo sim nao
    Produto.vLKSimNao.setDBLookupComboBox(DBLookupComboBox16);
    // permitir desconto sim nao
    Produto.vLKSimNao.setDBLookupComboBox(DBLookupComboBox17);
    // controle de numero de serie
    Produto.vLKContNumSerie.setDBLookupComboBox(DBLookupComboBox18);
    // altera descricao do cupom
    Produto.vLKSimNao.setDBLookupComboBox(DBLookupComboBox19);
    // altera valor do cupom
    Produto.vLKSimNao.setDBLookupComboBox(DBLookupComboBox20);
    // fora de linha
    Produto.vLKSimNao.setDBLookupComboBox(DBLookupComboBox25);
  	 // debito e credito  
    Produto.vLKSimNao.setDBLookupComboBox(DBLookupComboBox26);
    // venda online
    Produto.vLKSimNao.setDBLookupComboBox(DBLookupComboBox27);

    vEstPend := vDadosIni.getPendenciasEstoque(
      Produto.dataSet.FieldByName('grupo_prod').AsInteger,
      Produto.dataSet.FieldByName('cod_prod').AsString, 0, '', Produto.buscas);

    edEstPend.Text := Format('%0.3n', [vEstPend]);

    vEstDisponivel := Produto.dataSet.FieldByName('est_f').AsFloat - vEstPend;

    edEstDisp.Text := Format('%0.3n', [vEstDisponivel]);

    //campos markup
    edMarkUpTb.Visible := False;
    edMarkUpAt.Visible := False;
    edMarkUp30.Visible := False;
    edMarkUp60.Visible := False;
    edMarkUp90.Visible := False;
    vHabCampos:= vDadosIni.getConfSisBool('prod_cad_simpl_usar_campos_markup', Produto.buscas) ;
    vHabCamposList := TStringList.Create;
    vHabCamposList.Clear;
    if vHabCampos then
      vHabCamposList := vDadosIni.getConfSisBlob('prod_cad_simpl_usar_campos_markup', Produto.buscas);
    for I := 0 to vHabCamposList.Count - 1 do
      if FindComponent(vDadosIni.getValue(vHabCamposList[i], 2)) <> nil then
        TDBEdit(FindComponent(vDadosIni.getValue(vHabCamposList[i], 2))).Visible :=
          (vDadosIni.vNivel >= StrToIntDef(vDadosIni.getValue(vHabCamposList[i], 3), 0)) or
          ( pos(';' + IntToStr(vDadosIni.vCodUsuario) + ';', ';' + vDadosIni.getValue(vHabCamposList[i], 4) + ';') > 0);
    lbMarkUpTb.Visible := edMarkUpTb.Visible;
    lbMarkUpAt.Visible := edMarkUpAt.Visible;
    lbMarkUp30.Visible := edMarkUp30.Visible;
    lbMarkUp60.Visible := edMarkUp60.Visible;
    lbMarkUp90.Visible := edMarkUp90.Visible;

    //campos perc ajuste
    edPercAj30.Visible := False;
    edPercAj60.Visible := False;
    edPercAj90.Visible := False;
    vHabCampos:= vDadosIni.getConfSisBool('prod_cad_simpl_usar_campos_perc_ajuste', Produto.buscas) ;
    vHabCamposList := TStringList.Create;
    vHabCamposList.Clear;
    if vHabCampos then
      vHabCamposList := vDadosIni.getConfSisBlob('prod_cad_simpl_usar_campos_perc_ajuste', Produto.buscas);
    for I := 0 to vHabCamposList.Count - 1 do
      if FindComponent(vDadosIni.getValue(vHabCamposList[i], 2)) <> nil then
        TDBEdit(FindComponent(vDadosIni.getValue(vHabCamposList[i], 2))).Visible :=
          (vDadosIni.vNivel >= StrToIntDef(vDadosIni.getValue(vHabCamposList[i], 3), 0)) or
          ( pos(';' + IntToStr(vDadosIni.vCodUsuario) + ';', ';' + vDadosIni.getValue(vHabCamposList[i], 4) + ';') > 0);
    lbPercAj30.Visible := edPercAj30.Visible;
    lbPercAj60.Visible := edPercAj60.Visible;
    lbPercAj90.Visible := edPercAj90.Visible;

    //campos margem minima
    edMargMinVa.Visible := False;
    edMargMinAt.Visible := False;
    vHabCampos:= vDadosIni.getConfSisBool('prod_cad_simpl_usar_campos_margem_minima', Produto.buscas) ;
    vHabCamposList := TStringList.Create;
    vHabCamposList.Clear;
    if vHabCampos then
      vHabCamposList := vDadosIni.getConfSisBlob('prod_cad_simpl_usar_campos_margem_minima', Produto.buscas);
    for I := 0 to vHabCamposList.Count - 1 do
      if FindComponent(vDadosIni.getValue(vHabCamposList[i], 2)) <> nil then
        TDBEdit(FindComponent(vDadosIni.getValue(vHabCamposList[i], 2))).Visible :=
          (vDadosIni.vNivel >= StrToIntDef(vDadosIni.getValue(vHabCamposList[i], 3), 0)) or
          ( pos(';' + IntToStr(vDadosIni.vCodUsuario) + ';', ';' + vDadosIni.getValue(vHabCamposList[i], 4) + ';') > 0);
    lbMargMinVa.Visible := edMargMinVa.Visible;
    lbMargMinAt.Visible := edMargMinAt.Visible;

    vLista := TStringList.Create;
    if Produto.cadastroSimplificado then
      vLista := vDadosIni.getConfSisBlob('prod_cad_simpl_campos_desabilitados', Produto.buscas)
    else
      vLista := vDadosIni.getConfSisBlob('prod_cad_campos_desabilitados', Produto.buscas);

    for I := 0 to vLista.Count - 1 do
      if FindComponent(vDadosIni.getValue(vLista[i], 2)) <> nil then
      begin
        TWinControl(FindComponent(vDadosIni.getValue(vLista[i], 2))).Enabled := True;
        if Produto.dataSet.State = dsInsert then
          if vDadosIni.strIn(LowerCase(vDadosIni.getValue(vLista[i], 3)), ['i', 'insercao', 'inclusao', 'incluir', 'inserir', 'a', 'ambos']) then
            if StrToIntDef(vDadosIni.getValue(vLista[i], 4), 0) >= vDadosIni.vNivel then
              TWinControl(FindComponent(vDadosIni.getValue(vLista[i], 2))).Enabled := False;
        if Produto.dataSet.State = dsEdit then
          if vDadosIni.strIn(LowerCase(vDadosIni.getValue(vLista[i], 3)), ['e', 'edicao', 'alteracao', 'editar', 'alterar', 'a', 'ambos']) then
            if StrToIntDef(vDadosIni.getValue(vLista[i], 4), 0) >= vDadosIni.vNivel then
              TWinControl(FindComponent(vDadosIni.getValue(vLista[i], 2))).Enabled := False;
      end;
    {
    if vDadosIni.vProduto.vMaxDescPrecoAVista = 'S' then
    begin
      Label324.Caption := 'Calc Preço(%):';
      DBEdit140.Hint := 'Percentual utilizado para calcular o preço a vista pelo Preço de 30 dias';
    end
    else
    begin
      Label324.Caption := 'Desc Max(%):';
      DBEdit140.Hint := 'Máximo de desconto permitido para o produto';
    end;
    Label324.Hint := DBEdit140.Hint;
    }
    edsValorCompraUltNF.Visible := vDadosIni.PesqPros('PRO301', 'HABILITAR', '', '', '', Produto.buscas, False, False, True);
    edsCustoUltimo.Visible := edsValorCompraUltNF.Visible;
    edsCustoMedio.Visible := edsValorCompraUltNF.Visible;
    edsCustoReposicao.Visible := edsValorCompraUltNF.Visible;
    edsCustoMNF.Visible := edsValorCompraUltNF.Visible;

    //ALTERACAO DE PRECOS
    DBEdit136.Enabled := vDadosIni.PesqPros( IfThen(Produto.dataSet.State = dsInsert, 'PRO440', 'PRO441'), 'HABILITAR', '', '', '', Produto.buscas, False, False, True);
    DBEdit138.Enabled := DBEdit136.Enabled;
    DBEdit142.Enabled := DBEdit136.Enabled;
    DBEdit145.Enabled := DBEdit136.Enabled;
    DBEdit146.Enabled := DBEdit136.Enabled;
    btns_alterarPrecos.Enabled := DBEdit136.Enabled;
    edMarkUpTb.Enabled := vDadosIni.PesqPros('PRO173', 'HABILITAR', '', '', '', Produto.buscas, False, False, True);
    edMarkUpAt.Enabled := edMarkUpTb.Enabled;
    edMarkUp30.Enabled := edMarkUpTb.Enabled;
    edMarkUp60.Enabled := edMarkUpTb.Enabled;
    edMarkUp90.Enabled := edMarkUpTb.Enabled;
    edMargMinVa.Enabled := edMarkUpTb.Enabled;
    edMargMinAt.Enabled := edMarkUpTb.Enabled;
    edPercAj30.Enabled := edMarkUpTb.Enabled;
    edPercAj60.Enabled := edMarkUpTb.Enabled;
    edPercAj90.Enabled := edMarkUpTb.Enabled;

    //btns_historicoPrecos.Enabled := DBEdit136.Enabled;

    //MARGKUPS E MARGENS VISIVEIS
    edMarkUpTb.Visible := bMarkupMargemVis;
    lbMarkUpTb.Visible := edMarkUpTb.Visible;
    edMarkUpAt.Visible := edMarkUpTb.Visible;
    lbMarkUpAt.Visible := edMarkUpTb.Visible;
    edMarkUp30.Visible := edMarkUpTb.Visible;
    lbMarkUp30.Visible := edMarkUpTb.Visible;
    edMarkUp60.Visible := edMarkUpTb.Visible;
    lbMarkUp60.Visible := edMarkUpTb.Visible;
    edMarkUp90.Visible := edMarkUpTb.Visible;
    lbMarkUp90.Visible := edMarkUpTb.Visible;
    edMargMinVa.Visible := edMarkUpTb.Visible;
    lbMargMinVa.Visible := edMarkUpTb.Visible;
    edMargMinAt.Visible := edMarkUpTb.Visible;
    lbMargMinAt.Visible := edMarkUpTb.Visible;
    edPercAj30.Visible := edMarkUpTb.Visible;
    lbPercAj30.Visible := edMarkUpTb.Visible;
    edPercAj60.Visible := edMarkUpTb.Visible;
    lbPercAj60.Visible := edMarkUpTb.Visible;
    edPercAj90.Visible := edMarkUpTb.Visible;
    lbPercAj90.Visible := edMarkUpTb.Visible;

    //tributacao adicional
    groupTribAdicional.Height := 305;
    groupTribAdicional.Parent := pnTribAdicional;

    if (produto.cadastroSimplificado) then
    begin
	    groupTribAdicional.Height := 180;
  	  groupTribAdicional.Align := alTop;
    	groupTribAdicional.Parent := scrollS_Fiscal;
      pnFiscal.Height := 495;
	    pnFiscal.Height := scrollS_Fiscal.Height;
    end;

    tabOpfiscal.Parent := scrollS_Fiscal;
    tabOpfiscal.Align := alTop;
    tabOpfiscal.Top := groupTribAdicional.Height;
    tabOpfiscal.TabOrder := groupTribAdicional.TabOrder + 1;

    //informacao complementar
    Memo1.Lines.Text := Produto.vTextoInfComplementar.Text;

    // atribuindo controles para o o cadastro simplificado
    groupComposicao.Parent := scrollS_Composicao;
    groupConversao.Parent := scrollS_Conversao;
    groupDesmembramento.Parent := scrollS_Conversao;
    groupKitsProd.Parent := scrollS_KitsProd;
    pagePrecos.Parent := scrollS_Precos;
    pagePrecoQtde.Parent := scrollS_PrecoPorQtde;
    GroupBoxDadosEC.Parent := scrollS_ECommerce;
    GroupBoxDadosCA.Parent := scrollS_ComercioAberto;
    GroupBoxCashback.Parent := scrollS_Cashback;
    pageFretePeso.Parent := scrollS_FretePeso;

    DBLookupComboBox11.Enabled := Produto.dataSet.State = dsInsert;

    DBEdit144.Enabled := vDadosIni.vEmp.vRegime = 'SIMPLES';
    pnImagemProduto.Align := alNone;
    pnImagemProduto.Parent := scrollS_Outros;
    pnImagemProduto.Left := 458;
    pnImagemProduto.Top := DBMemo2.Top;
    pnImagemProduto.Height := 222;
    pnImagemProduto.Width := 356;

//    pageCadSimples.ActivePage := tsS_Cadastro;
//    THackWinControl(pageCadSimples.ActivePage).SelectFirst;
  end
  else
  begin
    {
    DBEdit64.OnExit := PercAdicional30DiasExit;
    DBEdit65.OnExit := PercAdicional60DiasExit;
    DBEdit66.OnExit := PercAdicional90DiasExit;
    }

    edCustoMNF.Visible := vDadosIni.PesqPros('PRO301', 'HABILITAR', '', '', '', Produto.buscas, False, False, True);
    edCustoUltimo.Visible := edCustoMNF.Visible;
    edCustoMedio.Visible := edCustoMNF.Visible;
    edValorCompraUltNF.Visible := edCustoMNF.Visible;
    edCustoReposicao.Visible := edCustoMNF.Visible;
    edCustoReal.Visible := edCustoMNF.Visible;
    edCustoRealMedio.Visible := edCustoMNF.Visible;

    //ALTERACAO DE PRECOS
    DBEdit8.Enabled := vDadosIni.PesqPros(IfThen(Produto.dataSet.State = dsInsert, 'PRO440', 'PRO441'), 'HABILITAR', '', '', '', Produto.buscas, False, False, True);
    DBEdit55.Enabled := DBEdit8.Enabled;
    DBEdit60.Enabled := DBEdit8.Enabled;
    DBEdit61.Enabled := DBEdit8.Enabled;
    DBEdit40.Enabled := DBEdit8.Enabled;
    btn_alterarPrecos.Enabled := DBEdit8.Enabled;
    DBEdit35.Enabled := vDadosIni.PesqPros('PRO173', 'HABILITAR', '', '', '', Produto.buscas, False, False, True);
    DBEdit18.Enabled := DBEdit35.Enabled;
    DBEdit1.Enabled := DBEdit35.Enabled;
    DBEdit4.Enabled := DBEdit35.Enabled;
    DBEdit15.Enabled := DBEdit35.Enabled;
    DBEdit56.Enabled := DBEdit35.Enabled;
    DBEdit57.Enabled := DBEdit35.Enabled;
    DBEdit64.Enabled := DBEdit35.Enabled;
    DBEdit65.Enabled := DBEdit35.Enabled;
    DBEdit66.Enabled := DBEdit35.Enabled;
    //btn_historicoPrecos.Enabled := DBEdit8.Enabled;

    //MARGKUPS E MARGENS VISIVEIS
    DBEdit35.Visible := bMarkupMargemVis;
    Label35.Visible := DBEdit35.Visible;
    DBEdit18.Visible := DBEdit35.Visible;
    Label47.Visible := DBEdit35.Visible;
    DBEdit1.Visible := DBEdit35.Visible;
    Label31.Visible := DBEdit35.Visible;
    DBEdit4.Visible := DBEdit35.Visible;
    Label36.Visible := DBEdit35.Visible;
    DBEdit15.Visible := DBEdit35.Visible;
    Label37.Visible := DBEdit35.Visible;
    DBEdit56.Visible := DBEdit35.Visible;
    Label67.Visible := DBEdit35.Visible;
    DBEdit57.Visible := DBEdit35.Visible;
    Label68.Visible := DBEdit35.Visible;
    DBEdit64.Visible := DBEdit35.Visible;
    Label74.Visible := DBEdit35.Visible;
    DBEdit65.Visible := DBEdit35.Visible;
    Label75.Visible := DBEdit35.Visible;
    DBEdit66.Visible := DBEdit35.Visible;
    Label85.Visible := DBEdit35.Visible;

    //AJUSTANDO POSICIONAMENTO MAX DESC E COD CUSTO
    DBEdit90.Top := IfThen(DBEdit35.Visible, 23) + DBEdit35.Top;
    Label175.Top := IfThen(DBEdit35.Visible, 23) + Label35.Top;
    DBEdit44.Top := IfThen(DBEdit35.Visible, 23) + DBEdit18.Top;
    Label44.Top := IfThen(DBEdit35.Visible, 23) + Label47.Top;
    GroupBox5.Height := 86 - IfThen(not DBEdit35.Visible, 23);

    DBEdit189.Enabled := vDadosIni.vEmp.vRegime = 'SIMPLES';

    if (vDadosIni.vEmp.vBuscaCodNoProduto <> 'S') then
    begin
//      DBEdit109.Visible := ((vDadosIni.vEcommerce.vHabilitarEcommerce)
//      	and (vDadosIni.vEcommerce.vHabilitarGradeCodBarras));
//      Label231.Visible := ((vDadosIni.vEcommerce.vHabilitarEcommerce)
//      	and (vDadosIni.vEcommerce.vHabilitarGradeCodBarras));
    end;
    if vDadosIni.vEmp.vCombProduto <> 'S' then
      GroupBox70.Visible := false;

    Edit1.Text := '';
    Edit2.Text := '';
    Produto.oldGrupoProd := Produto.dataSet.FieldByName('GRUPO_PROD').AsString;
    Produto.oldCodProd := trim(Produto.dataSet.FieldByName('COD_PROD').AsString);
    Produto.vTipoProdutoFabrica.abreTipoProdutoFabrica;
    verificacampos;

    TabSheet3.TabVisible := True;
    TabSheet4.TabVisible := True;

    if Produto.dataSet.State = dsInsert then
    begin
      Produto.statusRegistro := 'I';    // composicao

      tsComposicao.TabVisible := False;
      tsDefinirPreco.TabVisible := False;
      tsPrecosQtde.TabVisible := False;
      tsECommerce.TabVisible := False;
      tsComercioAberto.TabVisible := False;
      tsCashback.TabVisible := vDadosIni.vCashback.vHabilitarCashback;
      tsTribAdicional.TabVisible := False;
      tsKitsProd.TabVisible := False;
      tsConversao.TabVisible := False;
      tsFretePeso.TabVisible := False;
    end
    else
    begin
      Memo2.Lines.Text := Produto.vTextoInfComplementar.Text;
      Produto.statusRegistro := 'E';

      tsComposicao.TabVisible := (vDadosIni.vEmp.vUsarProducao = 'S') or (vDadosIni.vEmp.vUsarProducao = 'D');
      tsDefinirPreco.TabVisible := True;
      tsPrecosQtde.TabVisible := True;
      tsECommerce.TabVisible := vDadosIni.vEcommerce.vHabilitarEcommerce;
      tsComercioAberto.TabVisible := vDadosIni.vComercioAberto.vHabilitarComercioAberto;
      tsCashback.TabVisible := vDadosIni.vCashback.vHabilitarCashback;
      tsTribAdicional.TabVisible := True;
      tsKitsProd.TabVisible := True;
      tsConversao.TabVisible := True;
      tsFretePeso.TabVisible := True;

      pageEAN_Conversao.ActivePage := TabSheet11;
      pagePrecos.ActivePage := tsDefinirPreco_Visualizar;
      pagePrecoQtde.ActivePage := tsPrecosQtde_Visualizar;

      //tributacao adicional
      groupTribAdicional.Height := 305;
      groupTribAdicional.Parent := pnTribAdicional;

      if (produto.cadastroSimplificado) then
      begin
        groupTribAdicional.Height := 180;
        groupTribAdicional.Align := alTop;
        groupTribAdicional.Parent := pnTribAdicional;
        pnFiscal.Height := 495;
	      pnFiscal.Height := scrollS_Fiscal.Height;
      end;


      tabOpfiscal.Parent := GroupBox47;
      tabOpfiscal.Align := alNone;
      tabOpfiscal.Top := 228;
      tabOpfiscal.Left := 17;
      tabOpfiscal.TabOrder := ednfe_qtrib.TabOrder + 1;

      groupDesmembramento.Parent := scrollConversao;
      groupDesmembramento.Visible := True;
    end;

        // atribuindo controles para o o cadastro normal
    groupComposicao.Parent := scrollComposicao;
    groupConversao.Parent := scrollConversao;
    groupDesmembramento.Parent := scrollConversao;
    groupKitsProd.Parent := ScrollBoxKitsProd;
    pagePrecos.Parent := scrollPrecos;
    pagePrecoQtde.Parent := scrollPrecosPorQtde;
    GroupBoxDadosEC.Parent := tsECommerce;
    GroupBoxDadosCA.Parent := tsComercioAberto;
    GroupBoxCashback.Parent := tsCashback;
    pageFretePeso.Parent := tsFretePeso;
    tsFretePeso.TabVisible := Produto.dataSet.State = dsEdit;

    pnImagemProduto.Align := alNone;
    pnImagemProduto.Parent := scrollOutros;
    pnImagemProduto.Left := 458;
    pnImagemProduto.Top := 18;
    pnImagemProduto.Height := 222;
    pnImagemProduto.Width := 356;

    vLista := TStringList.Create;
    if Produto.cadastroSimplificado then
      vLista := vDadosIni.getConfSisBlob('prod_cad_simpl_campos_desabilitados', Produto.buscas)
    else
      vLista := vDadosIni.getConfSisBlob('prod_cad_campos_desabilitados', Produto.buscas);

    for I := 0 to vLista.Count - 1 do
      if FindComponent(vDadosIni.getValue(vLista[i], 2)) <> nil then
      begin
        TWinControl(FindComponent(vDadosIni.getValue(vLista[i], 2))).Enabled := True;
        if Produto.dataSet.State = dsInsert then
          if vDadosIni.strIn(LowerCase(vDadosIni.getValue(vLista[i], 3)), ['i', 'insercao', 'inclusao', 'incluir', 'inserir', 'a', 'ambos']) then
            if StrToIntDef(vDadosIni.getValue(vLista[i], 4), 0) >= vDadosIni.vNivel then
              TWinControl(FindComponent(vDadosIni.getValue(vLista[i], 2))).Enabled := False;
        if Produto.dataSet.State = dsEdit then
          if vDadosIni.strIn(LowerCase(vDadosIni.getValue(vLista[i], 3)), ['e', 'edicao', 'alteracao', 'editar', 'alterar', 'a', 'ambos']) then
            if StrToIntDef(vDadosIni.getValue(vLista[i], 4), 0) >= vDadosIni.vNivel then
              TWinControl(FindComponent(vDadosIni.getValue(vLista[i], 2))).Enabled := False;
      end;

    lbDescrGradeImg.Caption := trim(Produto.vImagensProd.dataSet.FieldByName('DESCR_GRADE').AsString);
    if Produto.dataSet.State <> dsEdit then
      lbqtdeImgProd.Caption := ''
    else if Produto.vImagensProd.dataSet.RecordCount <= 0 then
    	lbqtdeImgProd.Caption := '0/0'
  	else
      lbqtdeImgProd.Caption := IntToStr(Produto.vImagensProd.dataSet.RecNo) +
      	'/' + IntToStr(Produto.vImagensProd.dataSet.RecordCount);

    lbS_qtdeImgProd.Caption   := lbqtdeImgProd.Caption;
  	lbS_qtdeImgProdEC.Caption := lbqtdeImgProd.Caption;
	  lbS_qtdeImgProdCA.Caption := lbqtdeImgProd.Caption;
  end;

  pageEAN_Conversao.ActivePage := TabSheet11;
  tabOpfiscal.TabIndex := -1;
  gridOpFiscal.Visible := False;
  pnOpfiscalBtns.Visible := False;
  pnOpfiscal.Caption := 'Selecione qual operação fiscal deseja visualizar';
end;

procedure TFrmCadProdutos.obterRegiao;
begin
  Produto.vPromocaoProduto.dataSet.First;
  while not Produto.vPromocaoProduto.dataSet.Eof do
  begin

    Produto.vPromocaoProduto.dataSet.Edit;
    if not (Produto.vPromocaoProduto.dataSet.FieldByName('LOCALIDADE').IsNull) then
    begin
      Produto.vPromocaoProduto.dataSet.FieldByName('DESCR_TIPO').AsString :=
        trim(Produto.vPromocaoProduto.dataSet.FieldByName('LOCALIDADE').AsString);
    end
    else if not (Produto.vPromocaoProduto.dataSet.FieldByName('SETOR').IsNull) then
    begin
      Produto.vPromocaoProduto.dataSet.FieldByName('DESCR_TIPO').AsString :=
        trim(Produto.vPromocaoProduto.dataSet.FieldByName('SETOR').AsString);
    end
    else if not (Produto.vPromocaoProduto.dataSet.FieldByName('NOME_CIDADE').IsNull) then
    begin
      Produto.vPromocaoProduto.dataSet.FieldByName('DESCR_TIPO').AsString :=
        trim(Produto.vPromocaoProduto.dataSet.FieldByName('NOME_CIDADE').AsString);
    end;
    Produto.vPromocaoProduto.dataSet.Post;
    Produto.vPromocaoProduto.dataSet.Next;
  end;
end;

procedure TFrmCadProdutos.pageCadSimplesChange(Sender: TObject);
var
	I: Integer;
begin
  inherited;
	if pageCadSimples.ActivePage = tsS_Outros then
  	habilitarImagensProduto
  else if pageCadSimples.ActivePage = tsS_ECommerce then
  	habilitarCamposECommerce
  else if pageCadSimples.ActivePage = tsS_ComercioAberto then
  	habilitarCamposComercioAberto;

  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;
end;

procedure TFrmCadProdutos.PageControl2Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if PageControl2.ActivePage = tsFichaComprasVendas then
  begin
  	if (Self.Enabled) and (Self.Visible) and (MaskEdit8.CanFocus) then
	    MaskEdit8.SetFocus;
  end
  else if PageControl2.ActivePage = tsUltComp then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid6.CanFocus) then
	    DBGrid6.SetFocus;
  end;
end;

procedure TFrmCadProdutos.PageControl3Change(Sender: TObject);
var
	I: Integer;
begin
  inherited;
	if PageControl3.ActivePage = tsOutros then
  	habilitarImagensProduto
  else if PageControl3.ActivePage = tsECommerce then
  	habilitarCamposECommerce
  else if PageControl3.ActivePage = tsComercioAberto then
  	habilitarCamposComercioAberto;

  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;
end;

procedure TFrmCadProdutos.PageFooterBand6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLabel171.Caption := 'SubTotal';
  if vRelProducaoEst.UltPagina < qkRProducaoEstoque.QRPrinter.PageCount then
    vRelProducaoEst.UltPagina := qkRProducaoEstoque.QRPrinter.PageCount;

  if vRelProducaoEst.UltPagina = qkRProducaoEstoque.QRPrinter.PageCount then
    if QRLabel171.Tag = 1 then
      QRLabel171.Caption := 'Total do Período';
end;

procedure TFrmCadProdutos.PageHeaderBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLabel31.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TFrmCadProdutos.PageHeaderBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLabel121.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TFrmCadProdutos.Panel155Enter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (EditMoedaFatorPrincSaida.CanFocus) then
    EditMoedaFatorPrincSaida.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (ComboBoxUnidadePrincSaida.CanFocus) then
  	ComboBoxUnidadePrincSaida.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditMoedaFatorConvSaida.CanFocus) then
  	EditMoedaFatorConvSaida.SetFocus
	else if (Self.Enabled) and (Self.Visible) and (DBComboBoxUnidadeConvSaida.CanFocus) then
    DBComboBoxUnidadeConvSaida.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBComboBoxDisVendaSaida.CanFocus) then
    DBComboBoxDisVendaSaida.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBComboBoxPadraoVndSaida.CanFocus) then
    DBComboBoxPadraoVndSaida.SetFocus
end;

procedure TFrmCadProdutos.Panel19Enter(Sender: TObject);
begin
  inherited;
  if (TabSheet9.Visible = True) then
    exit;

  if PageControl1.ActivePage = tsDefinirPromocoes then
  begin
  	pnOpcaoDireitaProdutos.Visible := false;
    Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
    Produto.dataSet.AfterScroll := Produto.datasetAfterScrollPromocao;
  end;
end;

procedure TFrmCadProdutos.Panel19Exit(Sender: TObject);
begin
  inherited;
  ckMenuLateralClick(Sender);
//  Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
//  Produto.dataSet.AfterScroll := nil;
end;

procedure TFrmCadProdutos.Panel33Enter(Sender: TObject);
begin
  inherited;
  if (TabSheet14.Visible = True) then
    exit;

  if PageControl1.ActivePage = tsDefinirPrecoDiferenciado then
  begin
  	pnOpcaoDireitaProdutos.Visible := false;
    Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
    Produto.dataSet.AfterScroll := Produto.datasetAfterScrollPrecoD;
  end;
end;

procedure TFrmCadProdutos.Panel33Exit(Sender: TObject);
begin
  inherited;
  ckMenuLateralClick(Sender);
//  Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
//  Produto.dataSet.AfterScroll := nil;
end;

procedure TFrmCadProdutos.pnTribAdicionalEnter(Sender: TObject);
begin
  inherited;
  Panel38.Visible := True;
  Panel38.Align := alClient;
  pnTribAdicional.OnEnter := nil;
end;

procedure TFrmCadProdutos.pn_CashbackEnter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit19.CanFocus) then
		DBEdit19.SetFocus;
end;

procedure TFrmCadProdutos.produto_edit_unidade(Sender: TObject);
begin
	if not vDadosIni.PesqPros('PRO446', 'PERMITIR', '', 'PRODUTOS',
  	IntToStr(Produto.dataSet.FieldByName('GRUPO_PROD').AsInteger) + '-' +
    trim(Produto.dataSet.FieldByName('COD_PROD').AsString),
  	Produto.buscas, true) then
  	Exit;

  if Application.MessageBox('Deseja alterar unidade do produto?' + #13 + #13 +
    'A unidade do produto poderá ser alterado somente até o estoque ser movimentado, ' +
    'caso o produto tenha movimentado o estoque em algum período a unidade não poderá ser alterada novamente.',
    'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> mrYES then
    	Exit;

  if (not Produto.AlterarGrupo) and (Produto.cadastroSimplificado) then
  begin
    if not Produto.vConsProdutosConversao.IsEmpty then
      if ShowConfirmacao('Produto já possui conversões cadastradas' + sLineBreak + sLineBreak +
                         'Deseja continuar mesmo assim') <> IDYES then
        Exit;

  	if not (Produto.dataSet.State in [dsInsert, dsEdit]) then
      Produto.dataSet.Edit;
    Produto.dataSet.FieldByName('INF_UNIDADE').AsString := 'S';

  	if not DBComboBox24.Enabled then
    	DBComboBox24.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox24.CanFocus) then
      DBComboBox24.SetFocus;
  end
	else
  begin      
    if not Produto.vConsProdutosConversao.IsEmpty then
      if ShowConfirmacao('Produto já possui conversões cadastradas' + sLineBreak + sLineBreak +
                         'Deseja continuar mesmo assim') <> IDYES then
        Exit;
  	if not (Produto.dataSet.State in [dsInsert, dsEdit]) then
      Produto.dataSet.Edit;
    Produto.dataSet.FieldByName('INF_UNIDADE').AsString := 'S';
    
  	if not DBComboBox23.Enabled then
			DBComboBox23.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox23.CanFocus) then
    	DBComboBox23.SetFocus;
  end;
end;

procedure TFrmCadProdutos.Panel56Enter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (EditMoedaFatorPrinc.CanFocus) then
    EditMoedaFatorPrinc.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (ComboBoxUnidadePrinc.CanFocus) then
  	ComboBoxUnidadePrinc.SetFocus
	else if (Self.Enabled) and (Self.Visible) and (EditMoedaFatorConv.CanFocus) then
    EditMoedaFatorConv.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBComboBoxUnidadeConv.CanFocus) then
    DBComboBoxUnidadeConv.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEditCodigoEAN.CanFocus) then
    DBEditCodigoEAN.SetFocus;
end;

procedure TFrmCadProdutos.Panel58Exit(Sender: TObject);
begin
  inherited;
  Produto.ValidaPrecoPromocao;
  if DBCheckBox2.Enabled then
    vDadosIni.GravaAuditoria('PRO020', 'PROMOCAO', '', 'PRODUTOS',
      Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString + ' Promoção=' +
      Produto.dataSet.FieldByName('EM_PROMOCAO').AsString + ' Preço:' +
      Produto.dataSet.FieldByName('PRECO_PROMOCAO').AsString, produto.buscas);

  DBEdit187.Enabled := false;
  DBCheckBox2.Enabled := false;
end;

procedure TFrmCadProdutos.pnOpcaoDireitaProdutosExit(Sender: TObject);
begin
  vHabQtdeVndPorMes := False;

  pnQtdeVndMes.Visible := vHabQtdeVndPorMes;
  pnOpcaoDireitaProdutos.Visible := (vHabObservacaoProd) or (vHabCaracteristicaProd) or (vHabCodigoProd) or (vHabEstoquePorEmpresas) or (vHabPrecosVndPorEmpresa) or (vHabQtdeVndPorMes);

  ckMenuLateralClick(Sender);
  Produto.buscas.Close;
end;

procedure TFrmCadProdutos.PercAdicional30DiasExit(Sender: TObject);
begin
  // Preço 30 dias
  if (produto.dataSet.FieldByName('PERC_AD_30').AsFloat <> 0) and
    (Produto.dataSet.FieldByName('PREC_TAB_PROD').AsFloat >= 0) then
    produto.dataSet.FieldByName('PREC_30_PROD').AsFloat :=
      produto.dataSet.FieldByName('PREC_TAB_PROD').AsFloat +
      ((Produto.dataSet.FieldByName('PREC_TAB_PROD').AsFloat *
      produto.dataSet.FieldByName('PERC_AD_30').AsFloat) / 100);
  {
  else if (produto.dataSet.FieldByName('PERC_AD_30').AsFloat <= 0) then
  begin
    produto.dataSet.FieldByName('PREC_30_PROD').AsFloat := 0;
    produto.dataSet.FieldByName('PERC_AD_30').AsFloat   := 0;
  end;
  }
end;

procedure TFrmCadProdutos.PercAdicional60DiasExit(Sender: TObject);
begin
  // Preço 60 dias
  if (produto.dataSet.FieldByName('PERC_AD_60').AsFloat <> 0) and
    (Produto.dataSet.FieldByName('PREC_TAB_PROD').AsFloat >= 0) then
    produto.dataSet.FieldByName('PREC_60_PROD').AsFloat :=
      produto.dataSet.FieldByName('PREC_TAB_PROD').AsFloat +
      ((Produto.dataSet.FieldByName('PREC_TAB_PROD').AsFloat *
      produto.dataSet.FieldByName('PERC_AD_60').AsFloat) / 100);
  {
  else if (produto.dataSet.FieldByName('PERC_AD_60').AsFloat <= 0) then
  begin
    produto.dataSet.FieldByName('PREC_60_PROD').AsFloat := 0;
    produto.dataSet.FieldByName('PERC_AD_60').AsFloat   := 0;
  end;
  }
end;

procedure TFrmCadProdutos.PercAdicional90DiasExit(Sender: TObject);
begin 
  // Preço 90 dias
  if (produto.dataSet.FieldByName('PERC_AD_90').AsFloat <> 0) and
    (Produto.dataSet.FieldByName('PREC_TAB_PROD').AsFloat >= 0) then
    produto.dataSet.FieldByName('PREC_90_PROD').AsFloat :=
      produto.dataSet.FieldByName('PREC_TAB_PROD').AsFloat +
      ((Produto.dataSet.FieldByName('PREC_TAB_PROD').AsFloat *
      produto.dataSet.FieldByName('PERC_AD_90').AsFloat) / 100);
  {
  else if (produto.dataSet.FieldByName('PERC_AD_90').AsFloat <= 0) then
  begin
    produto.dataSet.FieldByName('PREC_90_PROD').AsFloat := 0;
    produto.dataSet.FieldByName('PERC_AD_90').AsFloat   := 0;
  end;
  }
end;

procedure TFrmCadProdutos.pnAlterEstGradeCAEnter(Sender: TObject);
begin
  inherited;
	 if (Self.Enabled) and (Self.Visible) and (DBEditEstCAGrade.CanFocus) then
    DBEditEstCAGrade.SetFocus;
end;

procedure TFrmCadProdutos.pnAlterEstGradeECEnter(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (DBEditEstECGrade.CanFocus) then
    DBEditEstECGrade.SetFocus;
end;

procedure TFrmCadProdutos.pnAlterEstProdCAEnter(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (DBEditEstCA.CanFocus) then
     DBEditEstCA.SetFocus;
end;

procedure TFrmCadProdutos.pnAlterEstProdECEnter(Sender: TObject);
begin
   if (Self.Enabled) and (Self.Visible) and (DBEditEstMinEC.CanFocus) then
     DBEditEstMinEC.SetFocus;
end;

procedure TFrmCadProdutos.pnCadastroMateriasPrimasEnter(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (lk_grade_mp.CanFocus) then
  	lk_grade_mp.SetFocus;
end;

procedure TFrmCadProdutos.pnCadastroResultadoFinalEnter(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (lk_grade_it.CanFocus) then
  	lk_grade_it.SetFocus;
end;

procedure TFrmCadProdutos.pnCancDadosComercioAbertoClick(Sender: TObject);
begin
	TForm(pnDadosComercioAberto.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadProdutos.pnDadosCAEnter(Sender: TObject);
begin
  if not pnDadosCA.Enabled then
    exit;

  if not pnOpcoesDadosCA.Enabled then
    exit;

  carregarwebbrownser(WebBrowserCA, Produto.vProdutosEC.dataSet.FieldByName('DESCR_PROD_COMPL').AsString);
  if (Self.Enabled) and (Self.Visible) and (DBEditDescrCA.CanFocus) then
    DBEditDescrCA.SetFocus;
end;

procedure TFrmCadProdutos.pnDadosECEnter(Sender: TObject);
begin
  if not pnDadosEC.Enabled then
    exit;

  if not pnOpcoesDadosEC.Enabled then
    exit;

  carregarwebbrownser(WebBrowserEC, Produto.vProdutosEC.dataSet.FieldByName('DESCR_PROD_COMPL').AsString);
  if (Self.Enabled) and (Self.Visible) and (DBEditDescrEC.CanFocus) then
    DBEditDescrEC.SetFocus;
end;

procedure TFrmCadProdutos.pnGradesEnter(Sender: TObject);
begin
  inherited;
  Produto.vGradeEst.vGrade.dataSet.Filtered := False;
  Produto.vGradeEst.vGrade.dataSet.Filter := '';
  edLocalizar.Clear;
  if Produto.vGradeEst.vGrade.dataSet.RecordCount >= 10 then
  begin
    if (Self.Enabled) and (Self.Visible) and (edLocalizar.CanFocus) then
      edLocalizar.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (DBGrid13.CanFocus) then
    DBGrid13.SetFocus;
end;

procedure TFrmCadProdutos.pnImagemProdEnter(Sender: TObject);
begin
  if MemoEndereco.CanFocus then
    MemoEndereco.SetFocus;
end;

procedure TFrmCadProdutos.pnOKDadosComercioAbertoClick(Sender: TObject);
begin
	try
  	Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
  	Produto.dataSet.AfterScroll := nil;

  	if not Produto.EnviarDadosComercioAberto(RadioGroupOpcoesComercioAberto.ItemIndex = 1) then
    	exit;

	  TForm(pnDadosComercioAberto.Parent).ModalResult := IDOK;
  finally
  	ckMenuLateralClick(Sender);
    _GravaConfiguracoesInteger(RadioGroupOpcoesComercioAberto.Name,	RadioGroupOpcoesComercioAberto.ItemIndex);
  end;
end;

procedure TFrmCadProdutos.pnSped0205Enter(Sender: TObject);
begin
  inherited;
  btCancelarSped0205.Click;
end;

procedure TFrmCadProdutos.qkRProducaoEstoqueBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  vRelProducaoEst.QtdeEstoque := 0;
  vRelProducaoEst.QtdeEntrada := 0;
  vRelProducaoEst.QtdeSaida := 0;
  vRelProducaoEst.NumPagina := EditHw9.AsInteger;
  QRLabel133.Caption := vDadosIni.vEmp.vnomeEmpresa;
  QRLabel134.Caption := vDadosIni.vEmp.vIE;
  QRLabel135.Caption := vDadosIni.vEmp.vCNPJ;
  QRLabel137.Caption := MaskEdit19.Text + ' até ' + MaskEdit21.Text;
end;

procedure TFrmCadProdutos.qkRProducaoEstoquePreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, QuickRep_FichaProd.ReportTitle);
end;

procedure TFrmCadProdutos.QRDBText72Print(sender: TObject; var Value: string);
begin
  inherited;
  if trim(Produto.vProdutosRel.dataSet.FieldByName('DESCR_TIPO').AsString) <> '' then
    Value := trim(Produto.vProdutosRel.dataSet.FieldByName('DESCR_TIPO').AsString);
end;

procedure TFrmCadProdutos.QRExpr12Print(sender: TObject; var Value: string);
begin
  inherited;
  if trim(Produto.vProdutosRel.dataSet.FieldByName('DESCR_TIPO').AsString) = '' then
    Value := Produto.vProdutosRel.dataSet.FieldByName('EST_F').AsString;
end;

procedure TFrmCadProdutos.QRExpr13Print(sender: TObject; var Value: string);
begin
  inherited;
  if (trim(Produto.vProdutosRel.dataSet.FieldByName('DESCR_TIPO').AsString) <> '') then
    Value := formatfloat('#0.00', Produto.vProdutosRel.dataSet.FieldByName('MAX_DESC').AsFloat);
end;


procedure TFrmCadProdutos.QRExpr14Print(sender: TObject; var Value: string);
begin
  inherited;
  if (trim(Produto.vProdutosRel.dataSet.FieldByName('DESCR_TIPO').AsString) <> '') then
    Value := 'R$ ' + formatfloat('#0.00', Produto.vProdutosRel.dataSet.FieldByName('VALOR_PROMOCAO').AsFloat);
end;

procedure TFrmCadProdutos.QRExpr15Print(sender: TObject; var Value: string);
begin
  inherited;
   if (trim(Produto.vProdutosRel.dataSet.FieldByName('DESCR_TIPO').AsString) <> '') then
    Value := formatfloat('#0.00', Produto.vProdutosRel.dataSet.FieldByName('PORCENTAGEM').AsFloat);
end;

procedure TFrmCadProdutos.QRExpr16Print(sender: TObject; var Value: string);
begin
  inherited;
  if (trim(Produto.vProdutosRel.dataSet.FieldByName('DESCR_TIPO').AsString) <> '') then
    Value := formatfloat('#0.00', Produto.vProdutosRel.dataSet.FieldByName('MAX_DESC').AsFloat);
end;

procedure TFrmCadProdutos.QRExpr22Print(sender: TObject; var Value: string);
begin
  inherited;
  if trim(Produto.vProdutosRel.dataSet.FieldByName('DESCR_TIPO').AsString) <> '' then
    Value := 'R$ ' + formatfloat('#0.00', Produto.vProdutosRel.dataSet.FieldByName('PREC_CUS_PROD').AsFloat);
end;

procedure TFrmCadProdutos.QRExpr27Print(sender: TObject; var Value: string);
begin
  inherited;
  if trim(Produto.vProdutosRel.dataSet.FieldByName('DESCR_TIPO').AsString) <> '' then
  begin
    if trim(Produto.vProdutosRel.dataSet.FieldByName('TP').AsString) = 'T' then
      Value := Produto.vProdutosRel.dataSet.FieldByName('TIPO').AsString
    else if trim(Produto.vProdutosRel.dataSet.FieldByName('TP').AsString) = 'P' then
      Value := 'PROMOCAO'
    else if trim(Produto.vProdutosRel.dataSet.FieldByName('TP').AsString) = 'Q' then
      Value := 'QUANTIDADE';;  
  end;
end;

procedure TFrmCadProdutos.QRExpr28Print(sender: TObject; var Value: string);
begin
  inherited;
  if (trim(Produto.vProdutosRel.dataSet.FieldByName('DESCR_TIPO').AsString) <> '') then
    Value := 'R$ ' + formatfloat('#0.00', Produto.vProdutosRel.dataSet.FieldByName('VALOR_PROMOCAO').AsFloat);
end;

procedure TFrmCadProdutos.QRExpr29Print(sender: TObject; var Value: string);
begin
  inherited;
  if trim(Produto.vProdutosRel.dataSet.FieldByName('DESCR_TIPO').AsString) <> '' then
  begin
    if trim(Produto.vProdutosRel.dataSet.FieldByName('TP').AsString) = 'T' then
      Value := trim(Produto.vProdutosRel.dataSet.FieldByName('TIPO').AsString)
    else if trim(Produto.vProdutosRel.dataSet.FieldByName('TP').AsString) = 'P' then
      Value := 'PROMOCAO'
    else if trim(Produto.vProdutosRel.dataSet.FieldByName('TP').AsString) = 'Q' then
      Value := 'QUANTIDADE';
  end;
end;

procedure TFrmCadProdutos.QRExpr30Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := 'R$ ' + formatfloat('#0.00', Produto.vProdutosRel.dataSet.FieldByName('PREC_TAB_PROD').AsFloat);
end;

procedure TFrmCadProdutos.QRExpr31Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := 'R$ ' + formatfloat('#0.00', Produto.vProdutosRel.dataSet.FieldByName('PREC_TAB_PROD').AsFloat);
end;

procedure TFrmCadProdutos.QRExpr32Print(sender: TObject; var Value: string);
begin
  inherited;
  if (trim(Produto.vProdutosRel.dataSet.FieldByName('DESCR_TIPO').AsString) <> '') then
    Value := formatfloat('#0.00', Produto.vProdutosRel.dataSet.FieldByName('PORCENTAGEM').AsFloat);
end;

procedure TFrmCadProdutos.QRExpr33Print(sender: TObject; var Value: string);
begin
  inherited;
  if trim(Produto.vProdutosRel.dataSet.FieldByName('DESCR_TIPO').AsString) <> '' then
    Value := trim(Produto.vProdutosRel.dataSet.FieldByName('DESCR_TIPO').AsString);
end;

procedure TFrmCadProdutos.QRExpr7Print(sender: TObject; var Value: string);
begin
  Value := Format('%0.2n', [vrTmp]);
end;

procedure TFrmCadProdutos.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if trim(Produto.vProdutosRel.dataSet.FieldByName('DESCR_TIPO').AsString) <> '' then
    DetailBand5.Height := 18
  else
    DetailBand5.Height := 0;
end;

procedure TFrmCadProdutos.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if trim(Produto.vProdutosRel.dataSet.FieldByName('DESCR_TIPO').AsString) <> '' then
    DetailCatalogo2.Height := 25
  else
    DetailCatalogo2.Height := 0;
end;

procedure TFrmCadProdutos.QRLabel130Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := vDadosIni.StrZero(vRelProducaoEst.NumPagina, 4);
  vRelProducaoEst.NumPagina := vRelProducaoEst.NumPagina + 1;
end;

procedure TFrmCadProdutos.QRLabel166Print(sender: TObject; var Value: string);
begin
  inherited;
  if vRelProducaoEst.Buscas.FieldByName('E_S').AsString = 'E' then
  begin
    vRelProducaoEst.QtdeEstoque := vRelProducaoEst.QtdeEstoque + vRelProducaoEst.Buscas.FieldByName('QUANTIDADE').AsFloat;
    vRelProducaoEst.QtdeEntrada := vRelProducaoEst.QtdeEntrada + vRelProducaoEst.Buscas.FieldByName('QUANTIDADE').AsFloat;
  end
  else
  begin
    vRelProducaoEst.QtdeEstoque := vRelProducaoEst.QtdeEstoque - vRelProducaoEst.Buscas.FieldByName('QUANTIDADE').AsFloat;
    vRelProducaoEst.QtdeSaida := vRelProducaoEst.QtdeSaida + vRelProducaoEst.Buscas.FieldByName('QUANTIDADE').AsFloat;
  end;
  Value := Format('%0.3f', [vRelProducaoEst.QtdeEstoque]);
end;

procedure TFrmCadProdutos.QRLabel167Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := Format('%0.3f', [vRelProducaoEst.QtdeEntrada]);
end;

procedure TFrmCadProdutos.QRLabel168Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := Format('%0.3f', [vRelProducaoEst.QtdeSaida]);
end;

procedure TFrmCadProdutos.QRLabel172Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := Format('%0.3f', [vRelProducaoEst.QtdeEstoque]);
end;

procedure TFrmCadProdutos.QRLabel82Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := Format('%0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais) + 'f', [
    QRDBText_estf.DataSet.FieldByName(QRDBText_estf.DataField).AsFloat -
      QRDBText41.DataSet.FieldByName(QRDBText41.DataField).AsFloat]);
end;

procedure TFrmCadProdutos.QRLabel84Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := Format('%0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais) + 'f', [
    QuickRep_Validade.DataSet.FieldByName('est_f').AsFloat]);
  vrTmp := vrTmp + QRDBText44.DataSet.FieldByName('est_f').AsFloat;
end;

procedure TFrmCadProdutos.QRLabel89Print(sender: TObject; var Value: string);
begin
  inherited;
  Value := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TFrmCadProdutos.qrpCatalogoPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Catálogo de Preços');
end;

procedure TFrmCadProdutos.qrpEtiCodBarrasPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Etiquetas com código de barras');
end;

procedure TFrmCadProdutos.qrpMediaBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  QRLabel1.Caption := vDadosIni.vemp.vnomeEmpresa;
  if Produto.QtdMesEmpresa > 1 then
    QRLabel6.Caption := 'Média ' + vDadosIni.StrZero(Produto.QtdMesEmpresa, 2) + ' Meses'
      //;//vDadosIni.vemp.vnomeEmpresa;
  else
    QRLabel6.Caption := 'Média ' + vDadosIni.StrZero(Produto.QtdMesEmpresa, 2) + ' MÃªs';
end;

procedure TFrmCadProdutos.qrpMediaPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Média de Venda');
end;

procedure TFrmCadProdutos.qrpPecaUltimaCompraPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Tabela de Peças com Ãšltima Compra');
end;

procedure TFrmCadProdutos.QuickRep_FichaProdPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, QuickRep_FichaProd.ReportTitle);
end;

procedure TFrmCadProdutos.QuickRep_ValidadeBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  vrTmp := 0;
end;

procedure TFrmCadProdutos.QuickRep2Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório de Produtos');
end;

procedure TFrmCadProdutos.QuickRep5Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório de Produtos');
end;

procedure TFrmCadProdutos.QuickRepProdutosPrecoQtdePreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Preços por quantidade');
end;

procedure TFrmCadProdutos.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  if RadioGroup1.ItemIndex = 0 then
  begin
    GroupBox34.Visible := false;
    GroupBox33.Visible := true;
    label149.Visible := true;
    MaskEdit18.Visible := true;
  end
  else if RadioGroup1.ItemIndex = 1 then
  begin
    GroupBox33.Visible := true;
    GroupBox34.Visible := true;
    label149.Visible := true;
    MaskEdit18.Visible := true;
  end
  else
  begin
    GroupBox33.Visible := false;
    label149.Visible := false;
    MaskEdit18.Visible := false;
    GroupBox34.Visible := true;
  end;
  if (RadioGroup1.ItemIndex <> 0) and (ComboBox14.Text = 'Geral') then
  begin
    CheckBox8.Checked := false;
    CheckBox8.Enabled := false;
    CheckBox5.Enabled := true;
    CheckBox7.Enabled := true;
    CheckBox13.Checked := false;
    CheckBox13.Enabled := False;
  end
  else
  begin
    CheckBox8.enabled := true;
    CheckBox5.Checked := false;
    CheckBox5.Enabled := false;
    CheckBox7.Checked := false;
    CheckBox7.Enabled := false;
    CheckBox13.Checked := true;
  end;
end;

procedure TFrmCadProdutos.ReajustarLarguradascolunas1Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGridEstoqueEmpresas);
end;

procedure TFrmCadProdutos.ReajustarLarguradascolunasCodigoPorEmpresaClick(
  Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGridCodigo);
end;

procedure TFrmCadProdutos.ReajustarLarguradascolunasPrecosVndPorEmpresaClick(
  Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGridPrecosVndPorEmpresa);
end;

procedure TFrmCadProdutos.RecalcularCustoAcabadoClick(Sender: TObject);
var
	vNumero: Integer;
  vNitem: Integer;
  vData: TDateTime;
begin
  inherited;
	try
  	Screen.Cursor := crHourGlass;
    if DBGrid35.DataSource.DataSet.IsEmpty then
      exit;
      
    if (trim(DBGrid35.DataSource.DataSet.FieldByName('tipo').AsString) <> 'PDC') then
      exit;

    if (trim(DBGrid35.DataSource.DataSet.FieldByName('natureza').AsString) <> 'E') then
      exit;

    if not vDadosIni.PesqPros('PRO445', 'CORRIGIR',
    	'PRODUCAO ' + IntToStr(DBGrid35.DataSource.DataSet.FieldByName('numero').AsInteger) + ' ' +
      'ITEM ' + IntToStr(DBGrid35.DataSource.DataSet.FieldByName('N Item/Id').AsInteger),
    	'PRODUTOS',
    	Produto.dataSet.FieldByName('GRUPO_PROD').AsString + ' - ' +
    	Produto.dataSet.FieldByName('COD_PROD').AsString,
      Produto.buscas, true) then
        exit;

    vNumero    := DBGrid35.DataSource.DataSet.FieldByName('numero').AsInteger;
    vNitem     := DBGrid35.DataSource.DataSet.FieldByName('N Item/Id').AsInteger;
    vData      := DBGrid35.DataSource.DataSet.FieldByName('data_estoque').AsDateTime;

    if not Produto.RecalcularCustoProdutoAcabado(
      vNumero,
      vNitem,
      vData) then
        exit;

    DBGrid34.DataSource.DataSet.Refresh;
    DBGrid35.DataSource.DataSet.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.RecalcularEstoqueEstDiarioClick(Sender: TObject);
var
	vGrupoProd: Integer;
  vCodProd: string;
  vData: TDateTime;
begin
  inherited;
	try
  	Screen.Cursor := crHourGlass;
    if DBGrid35.DataSource.DataSet.IsEmpty then
      exit;
      
    if not vDadosIni.PesqPros('PRO444', 'CORRIGIR',
    	'DATA ' + FormatDateTime('dd/mm/yyyy', DBGrid35.DataSource.DataSet.FieldByName('data_estoque').AsDateTime),
    	'PRODUTOS',
    	Produto.dataSet.FieldByName('GRUPO_PROD').AsString + ' - ' +
    	Produto.dataSet.FieldByName('COD_PROD').AsString,
      Produto.buscas, true) then
        exit;

    vGrupoProd := DBGrid35.DataSource.DataSet.FieldByName('grupo').AsInteger;
    vCodProd   := DBGrid35.DataSource.DataSet.FieldByName('cod prod').AsString;
    vData      := DBGrid35.DataSource.DataSet.FieldByName('data_estoque').AsDateTime;

    if not Produto.RecalcularEstoqueInsum(
      vGrupoProd,
      vCodProd,
      vData) then
        exit;

    DBGrid34.DataSource.DataSet.Refresh;
    DBGrid35.DataSource.DataSet.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.RegistrarVendaPerdida1Click(Sender: TObject);
var
  X: Byte;
  hdTemp: THandle;
  formulario: TForm;
begin
  inherited;

  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase('TfrmCadVendaPerdida') then
      begin
        Application.MessageBox('Cadastro já esta aberto, use as janelas ja abertas para efetuar o cadastramento', 'Atenção', 64);
        Exit;
      end;

  if vDadosIni.PesqPros('PES009', 'VISUALIZAR', '', 'PESQUISARAPIDA',
    Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString, Produto.buscas, true) then

  TelaCadastro := 1;
  vDadosIni.vModalOuChild := 'M';
  try
    vDadosIni.vPesquisa := 'PESQRAPVNDPERD|' +
    	Produto.dataSet.FieldByName('num_fab_prod').asstring + '|' +
	    Produto.dataSet.FieldByName('grupo_prod').asstring + '|' +
  	  Produto.dataSet.FieldByName('cod_prod').asstring + '|';

    formulario := Funcoes.AbreForm('pkPedidoVenda', 'TfrmCadVendaPerdida', hdTemp);

    try
      formulario.ShowModal;
    finally
      formulario.Free;
      unLoadPackage(hdTemp);
    end;
  finally
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TFrmCadProdutos.RemoveAcentosEspacos;
begin
  if trim(Produto.vProdutosEC.dataSet.FieldByName('DESCR_PROD_RES').AsString) <> '' then
  	if trim(Produto.vProdutosEC.dataSet.FieldByName('TITULO_PAGINA').AsString) = '' then
    	Produto.vProdutosEC.dataSet.FieldByName('TITULO_PAGINA').AsString :=
        trim(Produto.vProdutosEC.dataSet.FieldByName('DESCR_PROD_RES').AsString);

	if trim(Produto.vProdutosEC.dataSet.FieldByName('DESCR_PROD_RES').AsString) <> '' then
  	if trim(Produto.vProdutosEC.dataSet.FieldByName('URL_ACESSO').AsString) = '' then
    	Produto.vProdutosEC.dataSet.FieldByName('URL_ACESSO').AsString :=
        vDadosIni.RemoveAcentos(trim(Produto.vProdutosEC.dataSet.FieldByName('DESCR_PROD_RES').AsString));

  if (trim(Produto.vProdutosEC.dataSet.FieldByName('URL_ACESSO').AsString) <> '')
  	and (Pos(' ', trim(Produto.vProdutosEC.dataSet.FieldByName('URL_ACESSO').AsString)) > 0) then
  begin
  	Produto.vProdutosEC.dataSet.FieldByName('URL_ACESSO').AsString :=
		  trim(StringReplace(trim(Produto.vProdutosEC.dataSet.FieldByName('URL_ACESSO').AsString), '  ', ' ', [rfReplaceAll, rfIgnoreCase]));
    Produto.vProdutosEC.dataSet.FieldByName('URL_ACESSO').AsString :=
		  trim(StringReplace(trim(Produto.vProdutosEC.dataSet.FieldByName('URL_ACESSO').AsString), '  ', ' ', [rfReplaceAll, rfIgnoreCase]));
  end;

  if (trim(Produto.vProdutosEC.dataSet.FieldByName('URL_ACESSO').AsString) <> '')
  	and (Pos(' ', trim(Produto.vProdutosEC.dataSet.FieldByName('URL_ACESSO').AsString)) > 0) then
  begin
  	Produto.vProdutosEC.dataSet.FieldByName('URL_ACESSO').AsString :=
		  trim(StringReplace(trim(Produto.vProdutosEC.dataSet.FieldByName('URL_ACESSO').AsString), ' ', '-', [rfReplaceAll, rfIgnoreCase]));
  end;

  if (trim(Produto.vProdutosEC.dataSet.FieldByName('URL_ACESSO').AsString) <> '')
  	and (Pos('-', trim(Produto.vProdutosEC.dataSet.FieldByName('URL_ACESSO').AsString)) > 0) then
  begin
  	Produto.vProdutosEC.dataSet.FieldByName('URL_ACESSO').AsString :=
		  trim(StringReplace(trim(Produto.vProdutosEC.dataSet.FieldByName('URL_ACESSO').AsString), '--', '-', [rfReplaceAll, rfIgnoreCase]));
  end;
end;

procedure TFrmCadProdutos.ResetarConfiguraesdecolunas1Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('PRO198', 'RESETAR', '', 'PRODUTOS', '', Produto.buscas, true) then
    inherited;
end;

procedure TFrmCadProdutos.ResetarConfiguraesdecolunasCodigoPorEmpresaClick(
  Sender: TObject);
begin
//	if vDadosIni.PesqPros('PRO198', 'RESETAR', '', 'PRODUTOS', '', Produto.buscas, true) then
    vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGridCodigo, GridCfg3, cdsColunas3, cdsGrid3, usuario,
       vDadosIni.transacaoCol, fReset, ListGridsAndDataSets3, false, ListPositions3);
end;

procedure TFrmCadProdutos.ResetarConfiguraesdecolunasEstoquePorEmpresaClick(
  Sender: TObject);
begin
//	if vDadosIni.PesqPros('PRO198', 'RESETAR', '', 'PRODUTOS', '', Produto.buscas, true) then
    vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGridEstoqueEmpresas, GridCfg1, cdsColunas1, cdsGrid1, usuario,
       vDadosIni.transacaoCol, fReset, ListGridsAndDataSets1, false, ListPositions1);
end;

procedure TFrmCadProdutos.ResetarConfiguraesdecolunasPrecosVndPorEmpresaClick(
  Sender: TObject);
begin
//	if vDadosIni.PesqPros('PRO198', 'RESETAR', '', 'PRODUTOS', '', Produto.buscas, true) then
    vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGridPrecosVndPorEmpresa, GridCfg2, cdsColunas2, cdsGrid2, usuario,
       vDadosIni.transacaoCol, fReset, ListGridsAndDataSets2, false, ListPositions2);
end;

procedure TFrmCadProdutos.SalvardadosnoExcelCodigoPorEmpresaClick(
  Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGridCodigo, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmCadProdutos.SalvardadosnoExcelEstoquePorEmpresaClick(
  Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGridEstoqueEmpresas, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmCadProdutos.SalvardadosnoExcelPrecosVndPorEmpresaClick(
  Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGridPrecosVndPorEmpresa, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmCadProdutos.sbAvancarCAClick(Sender: TObject);
begin
  if PageControlCA.ActivePage = TabSheetCA1 then
    PageControlCA.ActivePage := TabSheetCA2
  else if PageControlCA.ActivePage = TabSheetCA2 then
    PageControlCA.ActivePage := TabSheetCA3;
  verificarAbaEcommerceComercioAberto('C');
end;

procedure TFrmCadProdutos.sbAvancarECClick(Sender: TObject);
begin
  if PageControlEC.ActivePage = TabSheetEC1 then
    PageControlEC.ActivePage := TabSheetEC2
  else if PageControlEC.ActivePage = TabSheetEC2 then
     PageControlEC.ActivePage := TabSheetEC3
  else if PageControlEC.ActivePage = TabSheetEC3 then
     PageControlEC.ActivePage := TabSheetEC4;
  verificarAbaEcommerceComercioAberto('E');
end;

procedure TFrmCadProdutos.sbVoltarCAClick(Sender: TObject);
begin
  if PageControlCA.ActivePage = TabSheetCA3 then
    PageControlCA.ActivePage := TabSheetCA2
  else if PageControlCA.ActivePage = TabSheetCA2 then
    PageControlCA.ActivePage := TabSheetCA1;
  verificarAbaEcommerceComercioAberto('C');
end;

procedure TFrmCadProdutos.sbVoltarECClick(Sender: TObject);
begin
  if PageControlEC.ActivePage = TabSheetEC2 then
    PageControlEC.ActivePage := TabSheetEC1
  else if PageControlEC.ActivePage = TabSheetEC3 then
    PageControlEC.ActivePage := TabSheetEC2
  else if PageControlEC.ActivePage = TabSheetEC4 then
    PageControlEC.ActivePage := TabSheetEC3;
  verificarAbaEcommerceComercioAberto('E');
end;

procedure TFrmCadProdutos.ScrollBoxCodigoEnter(Sender: TObject);
begin
  inherited;
	vConfigColuna3 := true;
end;

procedure TFrmCadProdutos.ScrollBoxEstoqueEmpresasEnter(Sender: TObject);
begin
  inherited;
	vConfigColuna1 := true;
end;

procedure TFrmCadProdutos.ScrollBoxPrecosVndPorEmpresaEnter(Sender: TObject);
begin
  inherited;
	vConfigColuna2 := true;
end;

procedure TFrmCadProdutos.SelecionarTodos1Click(Sender: TObject);
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;
  	DbGrid24.Visible := False;
  	Produto.vRegiao._marcarTodos;
  finally
    DbGrid24.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SelecionartodosprodutosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if (PageControl1.ActivePage = TabSheet2) then
    begin
      Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
      Produto.dataSet.AfterScroll := nil;
    end;

    DBGrid1.Visible := false;
    Produto._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;

    if (PageControl1.ActivePage = TabSheet2) then
      ckMenuLateralClick(Sender);
  end;
end;

procedure TFrmCadProdutos.SelecionartodosprodutosEtiqEsterClick(
  Sender: TObject);
begin
	btSelectAllEtiqEsterClick(Sender);
end;

procedure TFrmCadProdutos.SelecionartodosprodutosEtiTerRapidaClick(
  Sender: TObject);
begin
  btSelectAllEtiqterRapidaClick(Sender);
end;

procedure TFrmCadProdutos.SelecionartodosprodutosTempClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    DBGrid15.Visible := false;
    Produto._marcaTodosTemp(Produto.dtSetProdTemp);

  finally
    Screen.Cursor := crDefault;
    DBGrid15.Visible := true;
  end;
end;

procedure TFrmCadProdutos.setarTipoFormEtiq;
begin
	TelaCadastro := vDadosIni.vTipoForm;
  if Produto.vEtiTer = nil then
    Produto.vEtiTer := TEtiquetasTermicas.create;
end;

procedure TFrmCadProdutos.Somarvaloresdacoluna1Click(Sender: TObject);
begin
	try
  	if (PageControl1.ActivePage = TabSheet2) then
    begin
      Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
      Produto.dataSet.AfterScroll := nil;
    end;

	  inherited;
  finally
  	if (PageControl1.ActivePage = TabSheet2) then
      ckMenuLateralClick(Sender);
  end;
end;

procedure TFrmCadProdutos.SomarvaloresdacolunaCodigoPorEmpresaClick(
  Sender: TObject);
begin
  vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGridCodigo, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmCadProdutos.SomarvaloresdacolunaEstoquePorEmpresaClick(
  Sender: TObject);
begin
  vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGridEstoqueEmpresas, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmCadProdutos.SomarvaloresdacolunaPrecosVndPorEmpresaClick(
  Sender: TObject);
begin
  vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGridPrecosVndPorEmpresa, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmCadProdutos.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO103', 'ABRIR', '', 'PRODUTOS', '', Produto.buscas, true) then
    Exit;
  Produto.vRed.abreReducaoProd(Produto);
  vDadosIni.abreForm('Redução', pnReducao, [ofAutoSize, ofEscapeExit]);
//  PageControl1.ActivePage := tsReducao;
end;

procedure TFrmCadProdutos.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    tsFichas.TabVisible := false;
    tsEscolha.TabVisible := false;
    tsTabPrecos.TabVisible := false;
    tsMedia.TabVisible := false;
    tsRelProd.TabVisible := false;
    tsCatalogo.TabVisible := false;
    tsFichaProds.TabVisible := false;
    PageControl1.ActivePage := tsPrecos;
    PageControl4.ActivePage := tsEscolha;
    DBGrid1.Parent := GroupBox48;

    ckPrecoTab.Checked := _LerConfiguracoesRegistroBoolean('ckPrecoTab');
    ckPrecoDif.Checked := _LerConfiguracoesRegistroBoolean('ckPrecoDif');
    ckPromocao.Checked := _LerConfiguracoesRegistroBoolean('ckPromocao');
    ckPrecoQtde.Checked := _LerConfiguracoesRegistroBoolean('ckPrecoQtde');

    ckPrecoTab2.Checked := _LerConfiguracoesRegistroBoolean('ckPrecoTab2');
    ckPrecoDif2.Checked := _LerConfiguracoesRegistroBoolean('ckPrecoDif2');
    ckPromocao2.Checked := _LerConfiguracoesRegistroBoolean('ckPromocao2');
    ckPrecoQtde2.Checked := _LerConfiguracoesRegistroBoolean('ckPrecoQtde2');
    tsEscolha.Show;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  if Produto.dataSet.IsEmpty then
  	Exit;

  if not vDadosIni.PesqPros('PRO085', 'ABRIR', '', 'PRODUTOS', '', Produto.buscas, true) then
    Exit;        

  if not Produto.vGradeEst._verificarEstProdSemGradeVinc(Produto) then
    Exit;

  Label170.Caption := Format('%0.2f', [
    Produto.dataSet.FieldByName('est_f').AsFloat]);

  Label208.Caption := Format('%0.2f', [
    vDadosIni.getEstoqueDisponivel(Produto.buscas,
    	Produto.dataSet.FieldByName('grupo_prod').AsInteger,
      	Produto.dataSet.FieldByName('cod_prod').AsString)]);

	Label495.Caption := Format('%0.2f', [
  	vDadosIni.getEstoquePrima(Produto.buscas,
  		Produto.dataSet.FieldByName('grupo_prod').AsInteger,
	    	Produto.dataSet.FieldByName('cod_prod').AsString)]);

  Label494.Visible := (Produto.dataSet.FieldByName('criar_producao_aut').AsString = 'S')
  	and (vDadosIni.vEmp.vUsarProducao = 'S');

	Label495.Visible := (Produto.dataSet.FieldByName('criar_producao_aut').AsString = 'S')
  	and (vDadosIni.vEmp.vUsarProducao = 'S');

  Produto.vGradeEst.abreGradeEstoque(Produto.dataSet.FieldByName('grupo_prod').AsString,
    Produto.dataSet.FieldByName('cod_prod').AsString);
  Produto.vGradeEst.vGrade.dataSet.Filtered := false;
  Produto.vGradeEst.vGrade.dataSet.Filter := ' cod_grade<>0 ';
  Produto.vGradeEst.vGrade.dataSet.Filtered := true;

  BitBtn74.Enabled := True;
  BitBtn75.Enabled := True;
  BitBtn79.Enabled := True;
  DBGrid14.Enabled := True;
  BitBtn74.Enabled := True;
  BitBtn74.Enabled := True;
  BitBtn118.Enabled := False;

  Produto.vGradeEst._abreFormGradesEstoque(Produto);
  Produto.vGradeEst.vGrade.dataSet.Filtered := false;
  exit;

//  PageControl1.ActivePage := tsGrade;
//  Produto.vGradeEst.abreGradeEstoque(Produto.dataSet.FieldByName('grupo_prod').AsString,
//    Produto.dataSet.FieldByName('cod_prod').AsString);
end;

procedure TFrmCadProdutos.SpeedButton13Click(Sender: TObject);
var
  vhora: Ttime;
begin
  inherited;
  if not vDadosIni.PesqPros('PRO003', 'DEFINIR', '', 'PRODUTOS', '', Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO003', '', produto.buscas, true) then
    exit;
  if Application.MessageBox('Deseja efetuar a definição das classes dos produtos?' + chr(13) +
    'Obs.: Ã‰ importante que não se esteja fazendo' + chr(13) +
    'alterações em quaisquer produto.', 'Confirmação', MB_YESNO + MB_ICONQUESTION +
    MB_DEFBUTTON1) = mrYES then
  begin
    vhora := Time;
    Panel7.Top := Trunc(TabSheet2.Height / 2) - Trunc(Panel7.Height / 2);
    Panel7.Left := Trunc(TabSheet2.Width / 2) - Trunc(Panel7.Width / 2);
    GroupBox3.Visible := false;
    Panel1.Visible := false;
    Panel7.Visible := true;
    Produto.Parar := 0;
    if Produto.DefinirClassesProdutos(ProgressBar1, Panel7) then
      Produto.CommitaTransacao
    else
      Produto.RollBackTransacao;

    if Produto.Parar = 0 then
    begin
      Application.MessageBox(Pchar('Curva ABC realizada com Sucesso! Tempo: ' + timetostr(time -
        vhora)), 'Informação', MB_OK +
        MB_ICONINFORMATION + MB_DEFBUTTON1);
      GroupBox3.Visible := true;
      Panel1.Visible := true;
      Panel7.Visible := false;
    end
    else
    begin
      Application.MessageBox('A definição da Curva ABC dos produtos foi interrompida.',
        'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      GroupBox3.Visible := true;
      Panel1.Visible := false;
      Panel7.Visible := false;
    end;
  end;
end;

procedure TFrmCadProdutos.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO108', 'RETIRAR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString, Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO108', Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString,
    //    produto.buscas, true) then
    Exit;
  Produto.retirarReceitaAssociada;
end;

procedure TFrmCadProdutos.SpeedButton15Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS', 'A', Produto.buscas) then
    Exit;
  if vDadosIni.PesqPros('PRO030', 'ALTERAR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString, Produto.buscas, true) then
  begin
    inherited;
    Produto.AlterarGrupo := true;
    Produto.oldGrupoProd := Produto.dataSet.FieldByName('GRUPO_PROD').AsString;
    Produto.oldCodProd := trim(Produto.dataSet.FieldByName('COD_PROD').AsString);
    DBEdit16.Enabled := true;
    DBLookupComboBox1.Enabled := true;
    DBEdit59.Enabled := false;
    GroupBox4.Enabled := false;
    GroupBox5.Enabled := false;
    GroupBox7.Enabled := false;
    GroupBox10.Enabled := false;
    GroupBox6.Enabled := false;
    GroupBox8.Enabled := false;
    SpeedButton1Click(sender);
  end;
end;

procedure TFrmCadProdutos.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO013', 'ABRIR', '', 'PRODUTOS', '', Produto.buscas, true) then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PERFIL_PRODUTOS');
    if vDadosIni.vPesquisa <> '' then
    begin
      Edit1.Text := vDadosIni.vPesquisa;
      Produto.AtribuirPerfilProd(strtoint(vDadosIni.vPesquisa));
      Edit2.Text := Produto.LocPerfilProd.buscas.FieldByName('DESCR_PERFIL').asstring;
      Produto.LocPerfilProd.buscas.close;
      if Produto.cadastroSimplificado then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBEdit120.CanFocus) then
	        DBEdit120.SetFocus;
      end
      else
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBEdit67.CanFocus) then
	        DBEdit67.SetFocus;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButton17Click(Sender: TObject);
var
  i: integer;
begin
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

procedure TFrmCadProdutos.SpeedButton18Click(Sender: TObject);
var
  vqtdetot: real;
begin
	if Produto.dataSet.IsEmpty then
  	Exit;
    
  if vDadosIni.PesqPros('PRO031', 'ABRIR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString, Produto.buscas, true) then
    //  if vDadosIni.PesqPros('PRO031', Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString,
    //    produto.buscas, true) then
  begin
    inherited;
    try
      Screen.Cursor := crHourGlass;
      Produto.exibeItensPedidoAberto;
      produto.buscas.First;
      vqtdetot := 0;
      while not produto.buscas.eof do
      begin
        vqtdetot := vqtdetot + produto.buscas.FieldByName('quant_ped_item').AsCurrency;
        produto.buscas.Next;
      end;
      label172.Caption := format('%n', [vqtdetot]);
      DBGrid12.DataSource.DataSet := Produto.buscas;
      tsPendenciaPedido.TabVisible := true;
      tsPendenciaPedido.Show;
    finally
      Screen.Cursor := crDefault;
    end;
    tsPendenciaPedido.Caption := 'Quantidade do produto ' +
      trim(Produto.dataSet.FieldByName('DESCR_PROD').AsString) + ' - ' +
      trim(Produto.dataSet.FieldByName('GRUPO_PROD').AsString) + '  ' +
      trim(Produto.dataSet.FieldByName('COD_PROD').AsString) + '  ' +
      trim(Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString) +
      ' nos seguintes pedidos em aberto:';
  end;
end;

procedure TFrmCadProdutos.SpeedButton19Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO154', 'MANTER', '', 'PRODUTOS', '', Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO154', '', Produto.buscas, true) then
    exit;
  Produto.manterPromocaoProd;
  Produto.Refresh;
end;

procedure TFrmCadProdutos.SpeedButton1Click(Sender: TObject);
var
	I: Integer;
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS', 'A', Produto.buscas) then
    Exit;
    
  if not vDadosIni.PesqPros('PRO004', 'ALTERAR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString, Produto.buscas, true) then
    Exit;

  if Produto.dataSet.IsEmpty then
  begin
    Application.MessageBox('Não há nenhum registro para ser alterado.', 'Informação', MB_OK +
      MB_ICONINFORMATION + MB_DEFBUTTON1);
    Exit;
  end;

  if TelaCadastro <> 4 then
  if Produto.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
  begin
    Application.MessageBox('Este registro está na lixeira.' + chr(13) +
      'Para alterá-lo restaure-o primeiro.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    Exit;
  end;

  Produto.cadastroSimplificado := vDadosIni.getConfSisBool('prod_cad_simpl_habilitado', Produto.buscas);

  if Produto.AlterarGrupo then
    SpeedButtonAlternarCadastro.Visible := False
  else
  begin
  	vDadosIni.vInibeMensPesqPros := 'S';
  	SpeedButtonAlternarCadastro.Visible := vDadosIni.PesqPros('PRO458', 'HABILITAR', '', 'PRODUTOS', '', Produto.buscas, true);
  end;
  SpeedButtonAlternarCadastro2.Visible := SpeedButtonAlternarCadastro.Visible;

  try
    if Assigned(TreeViewCat) then
      FreeAndNil(TreeViewCat);
  finally
    if not Assigned(TreeViewCat) then
    begin
      TreeViewCat := TTreeView.Create(Self);
      TreeViewCat.Parent := Panel94;
      TreeViewCat.Align := alClient;
      TreeViewCat.OnDblClick := TreeViewCatDblClick;
      TreeViewCat.Items.Clear;
    end;
  end;

  try
    if Assigned(TreeViewCatDB) then
      FreeAndNil(TreeViewCatDB);
  finally
    if not Assigned(TreeViewCatDB) then
    begin
      TreeViewCatDB := TTreeView.Create(Self);
      TreeViewCatDB.Parent := Panel97;
      TreeViewCatDB.Align := alClient;
      TreeViewCatDB.OnDblClick := TreeViewCatDBDblClick;
      TreeViewCatDB.Items.Clear;
    end;
  end;

  try
    if Assigned(TreeViewGradeEC) then
      FreeAndNil(TreeViewGradeEC);
  finally
    if not Assigned(TreeViewGradeEC) then
    begin
      TreeViewGradeEC := TTreeView.Create(Self);
      TreeViewGradeEC.Parent := Panel102;
      TreeViewGradeEC.Align := alClient;
      TreeViewGradeEC.OnDblClick := TreeViewGradeECDblClick;
      TreeViewGradeEC.Items.Clear;
    end;
  end;

  try
    if Assigned(TreeViewGradeEC_DB) then
      FreeAndNil(TreeViewGradeEC_DB);
  finally
    if not Assigned(TreeViewGradeEC_DB) then
    begin
      TreeViewGradeEC_DB := TTreeView.Create(Self);
      TreeViewGradeEC_DB.Parent := Panel105;
      TreeViewGradeEC_DB.Align := alClient;
      TreeViewGradeEC_DB.OnDblClick := TreeViewGradeEC_DBDblClick;
      TreeViewGradeEC_DB.Items.Clear;
    end;
  end;

  try
    if Assigned(TreeViewGradeCA) then
      FreeAndNil(TreeViewGradeCA);
  finally
    if not Assigned(TreeViewGradeCA) then
    begin
      TreeViewGradeCA := TTreeView.Create(Self);
      TreeViewGradeCA.Parent := Panel85;
      TreeViewGradeCA.Align := alClient;
      TreeViewGradeCA.OnDblClick := TreeViewGradeCADblClick;
      TreeViewGradeCA.Items.Clear;
    end;
  end;

  try
    if Assigned(TreeViewGradeCA_DB) then
      FreeAndNil(TreeViewGradeCA_DB);
  finally
    if not Assigned(TreeViewGradeCA_DB) then
    begin
      TreeViewGradeCA_DB := TTreeView.Create(Self);
      TreeViewGradeCA_DB.Parent := Panel90;
      TreeViewGradeCA_DB.Align := alClient;
      TreeViewGradeCA_DB.OnDblClick := TreeViewGradeCA_DBDblClick;
      TreeViewGradeCA_DB.Items.Clear;
    end;
  end;

  vDadosIni.removerGradeNaoUtilizadosEcomerce(
    Produto.dataset.FieldByName('GRUPO_PROD').AsInteger,
    Produto.dataset.FieldByName('COD_PROD').AsString
  );

  Produto.vImagensProd.alterarImagemNovaTab(Produto.dataSet, vDiretorioDestino);

  if (not Produto.AlterarGrupo) and (Produto.cadastroSimplificado) then
  begin
    if not Produto.Edit then
    	exit;

    HabilitarCamposEdicao;
  end
  else
  begin
    if not Produto.Edit then
      exit;

    HabilitarCamposEdicao;
  end;
end;

procedure TFrmCadProdutos.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  try
    Produto.relEtiquetaX2(DBGrid19.DataSource.DataSet);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButton21Click(Sender: TObject);
begin
  inherited;
  Produto._corrigirMD5Produtos;
end;

procedure TFrmCadProdutos.SpeedButton22Click(Sender: TObject);
begin
	try
    inherited;
    Produto.dataSet.AfterScroll := nil;
    Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;

    if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS', 'A', Produto.buscas) then
      Exit;
    Produto.cadAlteracaoPreco(True);
  finally
    ckMenuLateralClick(Sender);
  end;
end;

procedure TFrmCadProdutos.SpeedButton23Click(Sender: TObject);
var
  vEstoqueDispo, vEstoquePrima: Extended;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS', 'A', Produto.buscas) then
    Exit;

  if Produto.dataSet.FieldByName('FORA_LINHA').AsString = 'S' then
  begin
    if Application.MessageBox(PChar('Produto definido como Fora de Linha.' + #13 + #13 +
      'Deseja alterar estoque mesmo assim?'), 'Atenção', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
      Exit;

    if not vDadosIni.PesqPros('PRO429', 'ALTERAR', '', 'PRODUTOS',
      Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
      Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true) then
      Exit;
  end;

  if not vDadosIni.PesqPros('PRO091', 'ALTERAR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
    Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO091', Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
    //    Produto.dataSet.FieldByName('COD_PROD').AsString, produto.buscas, true) then
    Exit;

  if not Produto.validarCusto then
    Exit;

  if Produto.ExecutaComandosSql('select cod_grade from cod_grade_prod' +
    ' where grupo_prod = ' + IntToStr(Produto.dataSet.FieldByName('grupo_prod').AsInteger) +
    ' and cod_prod = ' + QuotedStr(Produto.dataSet.FieldByName('cod_prod').AsString) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa) then
  begin
    SpeedButton12.Click;
    Exit;
  end;

  vEstoqueDispo := vDadosIni.getEstoqueDisponivel(Produto.buscas,
    Produto.dataSet.FieldByName('grupo_prod').AsInteger,
    Produto.dataSet.FieldByName('cod_prod').AsString);

  vEstoquePrima := vDadosIni.getEstoquePrima(Produto.buscas,
  	Produto.dataSet.FieldByName('grupo_prod').AsInteger,
    Produto.dataSet.FieldByName('cod_prod').AsString);

  Label121.Caption := Format('%0.3f', [vEstoqueDispo]);

  Label260.Caption := Format('%0.3f', [Produto.dataSet.FieldByName('est_f').AsFloat - vEstoqueDispo]);

  Label493.Caption := Format('%0.3f', [vEstoquePrima]);

  Label495.Caption := Format('%0.3f', [vEstoquePrima]);

  Label492.Visible := (Produto.dataSet.FieldByName('criar_producao_aut').AsString = 'S')
  	and (vDadosIni.vEmp.vUsarProducao = 'S');

	Label493.Visible := (Produto.dataSet.FieldByName('criar_producao_aut').AsString = 'S')
  	and (vDadosIni.vEmp.vUsarProducao = 'S');

	Label494.Visible := (Produto.dataSet.FieldByName('criar_producao_aut').AsString = 'S')
  	and (vDadosIni.vEmp.vUsarProducao = 'S');

	Label495.Visible := (Produto.dataSet.FieldByName('criar_producao_aut').AsString = 'S')
  	and (vDadosIni.vEmp.vUsarProducao = 'S');

  PageControl1.ActivePage := tsAltEstCusto;
  pgAltEstCust.ActivePage := tsAltEstoque;
end;

procedure TFrmCadProdutos.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS', 'A', Produto.buscas) then
    Exit;
  if not vDadosIni.PesqPros('PRO093', 'ALTERAR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
    Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO093', Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
    //    Produto.dataSet.FieldByName('COD_PROD').AsString, produto.buscas, true) then
    Exit;
  panelEditCusto.Visible := false;  
  PageControl1.ActivePage := tsAltEstCusto;
  pgAltEstCust.ActivePage := tsAltCusto;
end;

procedure TFrmCadProdutos.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO008', 'ABRIR', '', 'PRODUTOS', '', Produto.buscas, true) then
    //  if vDadosIni.PesqPros('PRO008', '', produto.buscas, true) then
  begin
    if not vDadosIni.IfThen((TelaCadastro <> 5) and (trim(vDadosIni.vPesquisaChaveNF) <> ''),
    	Produto.AbrirLixeiraNF(trim(vDadosIni.vPesquisaChaveNF)),
    	Produto.AbrirLixeira) then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira - [PRO006]';
      btExcluirRegistro.Hint := 'Enviar para Lixeira - [PRO006]';
//      BitBtn3.Visible := true;
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
      btRestaurarRegistro.Visible := false;
      SpeedButtonAlterarProduto.Visible := true;
      SpeedButtonAlterarProduto2.Visible := true;
      SpeedButtonGradesEstoqueProduto.Visible := true;
      SpeedButtonAlterarGrupoCodProduto.Visible := true;
      SpeedButtonSincronizarOutrasEmpECommerce.Visible := true;

      SpeedButton12.Visible := true;
      SpeedButton15.Visible := true;
      SpeedButton22.Visible := true;
      SpeedButton23.Visible := true;
      SpeedButton24.Visible := true;
      SpeedButton26.Visible := true;
      SpeedButton33.Visible := true;
      SpeedButton34.Visible := true;
      SpeedButton35.Visible := true;

      SpeedButtonAlterDados.Visible := true;
      SpeedButtonECommerce.Visible := vDadosIni.vEcommerce.vHabilitarEcommerce;
      SpeedButtonECommerce2.Visible := vDadosIni.vEcommerce.vHabilitarEcommerce;
      SpeedButtonComercioAberto.Visible := vDadosIni.vComercioAberto.vHabilitarComercioAberto;
      SpeedButtonComercioAberto2.Visible := vDadosIni.vComercioAberto.vHabilitarComercioAberto;
      SpeedButtonEnvComercioAberto.Visible := vDadosIni.vComercioAberto.vHabilitarComercioAberto;
      SpeedButtonCashback.Visible := vDadosIni.vCashback.vHabilitarCashback;
      btHistPreco.Visible := true;

      ckLixeira.Enabled := false;
      ckLixeira.Checked := false;
      ckLixeira.Enabled := true;

      ckLixeira2.Enabled := false;
      ckLixeira2.Checked := false;
      ckLixeira2.Enabled := true;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente - [PRO005]';
      btExcluirRegistro.Hint := 'Excluir registro permanentemente - [PRO005]';
//      BitBtn3.Visible := false;
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
      btRestaurarRegistro.Visible := true;

      SpeedButton12.Visible := false;
      SpeedButton15.Visible := false;
      SpeedButton22.Visible := false;
      SpeedButton23.Visible := false;
      SpeedButton24.Visible := false;
      SpeedButton26.Visible := false;
      SpeedButton33.Visible := false;
      SpeedButton34.Visible := false;
      SpeedButton35.Visible := false;

      SpeedButtonAlterDados.Visible := false;
      SpeedButtonECommerce.Visible := false;
      SpeedButtonECommerce2.Visible := false;
      SpeedButtonComercioAberto.Visible := false;
      SpeedButtonComercioAberto2.Visible := false;
      SpeedButtonEnvComercioAberto.Visible := false;
      SpeedButtonCashback.Visible := false;
      btHistPreco.Visible := false;

      SpeedButtonAlterarProduto.Visible := false;
      SpeedButtonAlterarProduto2.Visible := false;
      SpeedButtonGradesEstoqueProduto.Visible := false;
      SpeedButtonAlterarGrupoCodProduto.Visible := false;
      SpeedButtonSincronizarOutrasEmpECommerce.Visible := false;

      ckLixeira.Enabled := false;
      ckLixeira.Checked := true;
      ckLixeira.Enabled := true;

      ckLixeira2.Enabled := false;
      ckLixeira2.Checked := true;
      ckLixeira2.Enabled := true;
    end;
  end;
end;

procedure TFrmCadProdutos.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS', 'A', Produto.buscas) then
    Exit;
//  if vDadosIni.PesqPros('PRO029', 'MONTAR CURVA', '', 'PRODUTOS', '', Produto.buscas, true) then
//    //  if vDadosIni.PesqPros('PRO029', '', produto.buscas, true) then
//  begin
    RadioGroup1Click(Sender);
    BitBtn60.Enabled := false;
    Produto.CurvaABCVariaveis;
    tsGE.Show;
    tsGE.TabVisible := true;
    MaskEdit14.Text := inttostr(Produto.TpProcessamento);
    MaskEdit15.Text := inttostr(Produto.TpEntrega);
    MaskEdit16.Text := inttostr(Produto.TpAlocacao);
    MaskEdit17.Text := inttostr(Produto.FreqPedido);
    MaskEdit18.Text := inttostr(Produto.EstSeguracaPadrao);
    ComboBox13.Text := inttostr(Produto.QtdMesEmpresa);
    EditMoeda3.Valor := 0;
//  end;
end;

procedure TFrmCadProdutos.SpeedButton27Click(Sender: TObject);
begin
  inherited;
 Screen.Cursor := crHourGlass;
  try
    produto.vEtEs.imprimirEtiquetas(Trim(ComboBox44.Text));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButton28Click(Sender: TObject);
begin
  inherited;
  Produto.vEtEs.deleteTodas;
end;

procedure TFrmCadProdutos.SpeedButton29Click(Sender: TObject);
begin
  inherited;
  produto.vEtEs.salvaDados;
  TForm(pnEtiquetasEs.Parent).ModalResult := IDOK;
end;

procedure TFrmCadProdutos.SpeedButton2Click(Sender: TObject);
var
	vStatusLixeira: boolean;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS', 'E', Produto.buscas) then
    Exit;
  try
//    if not vDadosIni.PesqPros('PRO005', 'EXCLUIR', '', 'PRODUTOS',
//      Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
//      Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, false) then
//      Exit;

    Produto.Delete;
    vStatusLixeira := Produto.StatusLixeira;
    btLixeiraCheia.Visible := vStatusLixeira;
    lixeiraVazia(not vStatusLixeira);

  except
    on E: Exception do
    begin
      Application.MessageBox(pchar('Erro inesperado. Tente novamente: ' + e.Message), 'Erro',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      vDadosIni.registraErro(e.Message);
      Produto.Cancel;
      Produto.RollBackTransacao;
    end;
  end;
end;

procedure TFrmCadProdutos.SpeedButton30Click(Sender: TObject);
begin
  inherited;
  Produto.MontarArqBalanca;
end;

procedure TFrmCadProdutos.SpeedButton31Click(Sender: TObject);
begin
  inherited;
  Produto.vEtiTer.deleteTodas;
end;

procedure TFrmCadProdutos.SpeedButton32Click(Sender: TObject);
begin
  inherited;
  if TelaCadastro <> 3 then
	  produto.vEtiTer.salvaDados;
  TForm(pnEtiquetasTer.Parent).ModalResult := IDOK;
  if TelaCadastro = 3 then
    close
  else if Produto.dataSet.State in [dsEdit, dsInsert] then
    TabSheet1.Show
  else
    tbsEti.Show;
  //    TabSheet2.Show;
end;

procedure TFrmCadProdutos.SpeedButton33Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS', 'A', Produto.buscas) then
    Exit;
  if ((not (trim(Produto.dataSet.FieldByName('num_fab_prod').AsString) = '')) and
    (not (Produto.dataset.FieldByName('tipo_item').AsString = '04'))) then
  begin
    Application.MessageBox('Este não é um produto acabado. Configure no cadastro de produtos na aba Informações Fiscais no campo Tipo de Item.', 'Atenção', 0);
    Exit;
  end;
  try
    inherited;
    Screen.Cursor := crHourGlass;

    Produto.vIndTec.cadIndiceTecnico(0, Produto.dataSet.FieldByName('num_fab_prod').AsString);
    Produto.vIndTec.vcodprod := Produto.dataset.FieldByName('num_fab_prod').AsString;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButton34Click(Sender: TObject);
var
  bMarkupMargemVis: Boolean;
  I: Integer;
begin
  inherited;
  vDadosIni.vtpPreco := 'P';
  if not vDadosIni.PesqPros('PRO242', 'ABRIR', '', 'PROMOCAO',
    Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsString,
    Produto.vPromocaoProduto.buscas, true) then
    exit;

  bMarkupMargemVis := vDadosIni.PesqPros('PRO439', 'HABILITAR', '', '', '', Produto.buscas, False, False, True);

  for I := 0 to DBGrid25.Columns.Count - 1 do
    if MatchText(DBGrid25.Columns[I].FieldName, ['MARKUP', 'MARGEM']) then
      DBGrid25.Columns[I].Visible := bMarkupMargemVis;

  Produto.vPromocao.dataSet := TClientDataSet(dtmProdutos.cdsPromocaoP1);
  Produto.vPromocaoProduto.dataSet := TClientDataSet(dtmProdutos.cdsPromocaoProduto);
  Produto.pIndex := TClientDataSet(DBGrid1.DataSource.DataSet).IndexName;

  GroupBox3.Parent := Panel16;
  BitBtn2.Visible := False;
  BitBtn3.Visible := False;
  BitBtn91.Parent := GroupBox3;
  Panel1.Parent := Panel19;
  Panel2.Visible := False;
  ckLixeira.Visible    := False;
  ckLixeira2.Visible   := False;
//  ckEcommerce.Visible  := False;

  Panel16.Height := GroupBox3.Height;
//  Panel16.Height := 73;
//  GroupBox11.Height := 73;
//  GroupBox11.visible := false;

//	pnOpcaoDireitaProdutos.Visible := false;
//  Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
	PageControl7.ActivePage := TabSheet8;
  PageControl1.ActivePage := tsDefinirPromocoes;
  if ckLixeira.Checked then
  	FrmCadProdutos.Caption := 'Definir Promoções (Lixeira)'
  else if ckEcommerce.Checked then
  	FrmCadProdutos.Caption := 'Definir Promoções (E-Commerce)'
  else
  	FrmCadProdutos.Caption := 'Definir Promoções';
  ckMenuLateral.Visible := False;
  ckMenuLateralClick(Sender);

//  DBGrid1.Options := [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines,
//    dgTabs, dgConfirmDelete, dgCancelOnExit{, dgMultiSelect}];

  Produto.vPromocaoProduto._abrePromocaoProdutos(Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
    Produto.dataSet.FieldByName('COD_PROD').AsString, '', '', '');
end;

procedure TFrmCadProdutos.SpeedButton35Click(Sender: TObject);
var
  bMarkupMargemVis: Boolean;
  I: Integer;
begin
  inherited;
  vDadosIni.vtpPreco := 'T';

  if not vDadosIni.PesqPros('PRO242', 'ABRIR', '', 'PROMOCAO',
    Produto.vPromocaoProduto.dataSet.FieldByName('COD_PROMOCAO').AsString,
    Produto.vPromocaoProduto.buscas, true) then
    exit;

  bMarkupMargemVis := vDadosIni.PesqPros('PRO439', 'HABILITAR', '', '', '', Produto.buscas, False, False, True);

  for I := 0 to DBGrid28.Columns.Count - 1 do
    if MatchText(DBGrid28.Columns[I].FieldName, ['MARKUP', 'MARGEM']) then
      DBGrid28.Columns[I].Visible := bMarkupMargemVis;

  Produto.vPromocao.dataSet := TClientDataSet(dtmProdutos.cdsPromocaoP1);
  Produto.vPromocaoProduto.dataSet := TClientDataSet(dtmProdutos.cdsPromocaoProduto);
  Produto.vTipoPreco._abreTipoPrecoTabela;
  Produto.pIndex := TClientDataSet(DBGrid1.DataSource.DataSet).IndexName;

  GroupBox3.Parent := Panel32;
  BitBtn2.Visible := False;
  BitBtn3.Visible := False;
  BitBtn109.Parent := GroupBox3;
  Panel1.Parent := Panel33;
  Panel2.Visible := False;
  ckLixeira.Visible    := False;
  ckLixeira2.Visible   := False;
//  ckEcommerce.Visible  := False;

  Panel32.Height := GroupBox3.Height;
//  Panel32.Height := 73;
//  GroupBox11.Height := 73;
//  GroupBox11.visible := false;


//	pnOpcaoDireitaProdutos.Visible := false;
//  Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
  PageControl9.ActivePage := TabSheet13;
  PageControl1.ActivePage := tsDefinirPrecoDiferenciado;
  if ckLixeira.Checked then
  	FrmCadProdutos.Caption := 'Definir Preços Diferenciados (Lixeira)'
  else if ckEcommerce.Checked then
  	FrmCadProdutos.Caption := 'Definir Preços Diferenciados (E-Commerce)'
  else
  	FrmCadProdutos.Caption := 'Definir Preços Diferenciados';
  ckMenuLateral.Visible := False;
  ckMenuLateralClick(Sender);

//  DBGrid1.Options := [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines,
//    dgTabs, dgConfirmDelete, dgCancelOnExit{, dgMultiSelect}];

  Produto.vPromocaoProduto._abrePrecoProdutos(Produto.dataSet.FieldByName('GRUPO_PROD').AsString,
    Produto.dataSet.FieldByName('COD_PROD').AsString);
end;

procedure TFrmCadProdutos.SpeedButton36Click(Sender: TObject);
begin
  inherited;
  Produto.salvarPathFileArquivosBuscaPreco(
    cbDelimitador.Text + '>' +
    IntToStr(edMaxCaract.Value) + '>' +
    cbApenasEAN.Text + '>' +
    cbApenasEst.Text + '>' +
    edSalvarComo.Text + '>');
  lbArqBuscaPreco.Items.Text := Produto.getArquivosBuscaPreco;
  if lbArqBuscaPreco.Items.Count > 0 then
    lbArqBuscaPreco.ItemIndex := 0;
end;

procedure TFrmCadProdutos.SpeedButton37Click(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
    edSalvarComo.Text := SaveDialog1.FileName;
end;

procedure TFrmCadProdutos.SpeedButton38Click(Sender: TObject);
begin
  inherited;
  if lbArqBuscaPreco.ItemIndex >= 0 then
  begin
    Produto.removerPathFileArquivosBuscaPreco(lbArqBuscaPreco.Items[lbArqBuscaPreco.ItemIndex]);

    lbArqBuscaPreco.Items.Text := Produto.getArquivosBuscaPreco;
    if lbArqBuscaPreco.Items.Count > 0 then
      lbArqBuscaPreco.ItemIndex := 0;
  end;
end;

procedure TFrmCadProdutos.SpeedButton39Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := tsBuscaPreco;
  lbArqBuscaPreco.Items.Text := Produto.getArquivosBuscaPreco;
  if lbArqBuscaPreco.Items.Count > 0 then
    lbArqBuscaPreco.ItemIndex := 0;
end;

procedure TFrmCadProdutos.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO157', 'ABRIR TELA PARA IMPRESSÃO DE ETIQUETAS', '', 'PRODUTOS', '',
    Produto.buscas, true) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	    DBGrid1.SetFocus;
    DBGrid1.Parent := GroupBox38;
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('PRO213', 'EXIBIR', '', 'PRODUTOS', '', Produto.buscas, true) then
    begin
      GroupBox40.Visible := false;
      GroupBox41.Visible := false;
      GroupBox44.Visible := false;
      GroupBox55.Visible := false;
      GroupBox26.Visible := false;
      GroupBox52.Visible := false;
      GroupBox53.Visible := false;
      GroupBox54.Visible := false;
    end
    else
    begin
      GroupBox40.Visible := true;
      GroupBox41.Visible := true;
      GroupBox44.Visible := true;
      GroupBox55.Visible := true;
      GroupBox26.Visible := true;
      GroupBox52.Visible := true;
      GroupBox53.Visible := true;
      GroupBox54.Visible := true;
    end;
    RadioGroupOpcaoLinha.ItemIndex := _LerConfiguracoesRegistroInteger('RadioGroupOpcaoLinha');
    CheckBox14.Checked := _LerConfiguracoesRegistroBoolean('CheckBox14');
	  CheckBox10.Checked := _LerConfiguracoesRegistroBoolean('CheckBox10');
	  CheckBox12.Checked := _LerConfiguracoesRegistroBoolean('CheckBox12');
	  CheckBox16.Checked := _LerConfiguracoesRegistroBoolean('CheckBox16');
	  CheckBox15.Checked := _LerConfiguracoesRegistroBoolean('CheckBox15');
    CheckBox17.Checked := false; //_LerConfiguracoesRegistroBoolean('CheckBox17');
    CheckBox17.Visible := false;
    ckImprimirEtiQtdeEstoque.Checked := _LerConfiguracoesRegistroBoolean('ckImprimirEtiQtdeEstoque');
    ckImprimirQtdeEstoqueMarcadas.Checked := false; //_LerConfiguracoesRegistroBoolean('ckImprimirQtdeEstoqueMarcadas');
    ckImprimirQtdeEstoqueMarcadas.Visible := false;
    ComboBox16.ItemIndex := _LerConfiguracoesRegistroInteger('ComboBox16');

    DBGrid1.Options := DBGrid1.Options + [dgMultiSelect];
    tbsEtiqueta.Show;
    tbsEti.Show;
    ckMenuLateralClick(Sender);
  end;
end;

procedure TFrmCadProdutos.SpeedButton40Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if Trim(DBGrid35.DataSource.DataSet.FieldByName('Tipo').AsString) = 'NF' then
    begin
      if DBGrid35.DataSource.DataSet.FieldByName('Cod NF').AsInteger <= 0 then
      begin
        Application.MessageBox('Nota fiscal de modelo antigo, não é possível visualizar', 'Atenção', 0 + 64);
        Exit;
      end;
      vDadosIni.vPesquisa := 'NF_FICHAPRODUTO|' + IntToStr(DBGrid35.DataSource.DataSet.FieldByName('Cod NF').AsInteger) + '|';
      vDadosIni.vNomeForm := 'frmCadNF';
      vDadosIni.abreFormCadastro('pkNF', 'TfrmCadNF', True, 'Formulário de Nota fiscal já aberto. Feche que tente novamente');
    end
    else if Trim(DBGrid35.DataSource.DataSet.FieldByName('Tipo').AsString) = 'PDC' then
    begin
      vDadosIni.vPesquisa := 'PRODUCAO_FICHAPRODUTO|' + IntToStr(DBGrid35.DataSource.DataSet.FieldByName('Numero').AsInteger) + '|';
      vDadosIni.vNomeForm := 'frmCadProducao';
      vDadosIni.abreFormCadastro('pkProducao', 'TfrmCadProducao', True, 'Formulário de Pedido de Produção já aberto. Feche que tente novamente');
    end
    else if Trim(DBGrid35.DataSource.DataSet.FieldByName('Tipo').AsString) = 'DEV' then
    begin
      vDadosIni.vPesquisa := 'DEVOLUCAO_FICHAPRODUTO|' + IntToStr(DBGrid35.DataSource.DataSet.FieldByName('Numero').AsInteger) + '|';
      vDadosIni.vNomeForm := 'frmDevolucao';
      vDadosIni.abreFormCadastro('pkDevolucao', 'TfrmDevolucao', True, 'Formulário de Devolução já aberto. Feche que tente novamente');
    end
    else if vDadosIni.strEstaContidoEm(Trim(DBGrid35.DataSource.DataSet.FieldByName('Tipo').AsString), ['REQ', 'OS']) then
    begin
      vDadosIni.vPesquisa := 'PEDVENDA_FICHAPRODUTO|' + Trim(DBGrid35.DataSource.DataSet.FieldByName('Tipo').AsString) + '|' + IntToStr(DBGrid35.DataSource.DataSet.FieldByName('Numero').AsInteger) + '|';
      vDadosIni.vNomeForm := 'FrmCadPedVenda';
      vDadosIni.abreFormCadastro('pkPedidoVenda', 'TFrmCadPedVenda', True, 'Formulário de Pedido de Venda ou Ordem de Serviço já aberto. Feche que tente novamente', 'NAME');
    end
    else
    begin
      Application.MessageBox(PChar('Sem detalhes para esta operação, detalhes apenas para as operações abaixo:' + #13 + #13 +
        'REQ: Pedido de Venda' + #13 +
        'OS: Ordem de Serviço' + #13 +
        'NF: Nota Fiscal' + #13 +
        'PDC: Pedido de Produção' + #13 +
        'DEV: Devolução'), 'Atenção', 0 + 64);
    end;

  finally
    vDadosIni.vPesquisa := '';
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButton48Click(Sender: TObject);
var
  vFileNameOrigem: string;
  vFileNameDestino: string;
  positionTemp: Integer;
  I: Integer;
  vtemp: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if Produto.vGradeProd.dataSet.RecordCount > 1 then
    begin
      if not vDadosIni.abreForm('Favor vincular as imagens a grade', pnGradesImagens, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
      begin
        Produto.vGradeProd.restoreRecNo;
        exit;
      end;
    end;

    if not vDadosIni.PesqPros(
      'PRO316',
      'ADICIONAR IMAGEM',
      '',
      'PRODUTOS',
      Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
      Produto.dataSet.FieldByName('COD_PROD').AsString,
      Produto.buscas,
      true) then
        exit;

    if not OpenPictureDialog1.Execute then
    begin
      Produto.vGradeProd.restoreRecNo;
      exit;
    end;

    try
    	for I := 0 to OpenPictureDialog1.Files.Count - 1 do
      begin
        vFileNameOrigem := OpenPictureDialog1.Files[I];//OpenPictureDialog1.FileName;

        vFileNameDestino := IfThen(trim(vDiretorioDestino) <> '',
          trim(vDiretorioDestino) + trim(ExtractFileName(vFileNameOrigem)),
          trim(vFileNameOrigem));

        // Testar imagem do produto
        if ((vDadosIni.vEcommerce.vHabilitarEcommerce) or (vDadosIni.vComercioAberto.vHabilitarComercioAberto)) then
        begin
          if (UpperCase(ExtractFileExt(vFileNameOrigem)) <> '.JPG')
            and (UpperCase(ExtractFileExt(vFileNameOrigem)) <> '.JPEG')
            {and (UpperCase(ExtractFileExt(vFileNameOrigem)) <> '.PNG')} then
          begin
            if (vDadosIni.vEcommerce.vHabilitarEcommerce) or (vDadosIni.vComercioAberto.vHabilitarComercioAberto) then
              vtemp := 'E-Commerce e Comércio Aberto'
            else if vDadosIni.vEcommerce.vHabilitarEcommerce then
          		vtemp := 'E-Commerce'
            else if vDadosIni.vComercioAberto.vHabilitarComercioAberto then
            	vtemp := 'Comércio Aberto';
            Application.MessageBox(PChar('Imagem selecionada não esta no formato aceito pelo ' + vtemp + ': ' + #13 + #13 +
              'Formatos suportados: JPG e JPEG '+ #13 +
              'Imagem: ' + ExtractFileName(vFileNameOrigem)), 'Atenção', MB_ICONERROR + MB_DEFBUTTON1);
            Produto.vGradeProd.restoreRecNo;
            exit;
          end;
        end
        else
        begin
       		if (UpperCase(ExtractFileExt(vFileNameOrigem)) <> '.JPG')
            and (UpperCase(ExtractFileExt(vFileNameOrigem)) <> '.JPEG')
            {and (UpperCase(ExtractFileExt(vFileNameOrigem)) <> '.PNG')} then
          begin
            Application.MessageBox(PChar('Imagem selecionada não esta no formato aceito pelo sistema: ' + #13 + #13 +
              'Formatos suportados: JPG e JPEG '+ #13 +
              'Imagem: ' + ExtractFileName(vFileNameOrigem)), 'Atenção', MB_ICONERROR + MB_DEFBUTTON1);
            Produto.vGradeProd.restoreRecNo;
            exit;
          end;
        end;

        // Criar classes e adicionar imagens a lista
        vFileNameDestino := Produto.vImagensProd.adicionarImagem(
          Produto.dataSet,
          Produto.vGradeProd.dataSet.FieldByName('cod_grade').AsInteger,
          Produto.vGradeProd.dataSet.FieldByName('descricao').AsString,
          vFileNameOrigem,
          vFileNameDestino,
          vDiretorioDestino);

        if Produto.dataSet.State in [dsInsert, dsEdit] then
        begin
        	if trim(Produto.dataSet.FieldByName('alterou_imagem').AsString) <> 'S' then
		        Produto.dataSet.FieldByName('alterou_imagem').AsString := 'S';
          if trim(Produto.dataSet.FieldByName('alterou_imagem_grade').AsString) <> 'S' then
	          Produto.dataSet.FieldByName('alterou_imagem_grade').AsString := 'S';
        end;

        lbDescrGradeImg.Caption := trim(Produto.vImagensProd.dataSet.FieldByName('DESCR_GRADE').AsString);
        Produto.vGradeProd.restoreRecNo;

      	if Produto.vImagensProd.dataSet.RecordCount <= 0 then
        begin
          Image1.Picture.Assign(nil);
          Image1.Hint    := '';
        end
        else
        begin
          Produto.vImagensProd.dataSet.Last;

          if not FileExists(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
            Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString) then
          begin
            if not FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
              Image1.Picture.LoadFromFile('')
            else
              Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg')
          end
          else
          begin
            Image1.Picture.LoadFromFile(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
              Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString);
          end;

          Image1.Hint    := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
            Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString;
        end;

        lbDescrGradeImg.Caption := trim(Produto.vImagensProd.dataSet.FieldByName('DESCR_GRADE').AsString);
        if Produto.dataSet.State <> dsEdit then
          lbqtdeImgProd.Caption := ''
        else if Produto.vImagensProd.dataSet.RecordCount <= 0 then
        	lbqtdeImgProd.Caption := '0/0'
        else
        	lbqtdeImgProd.Caption := IntToStr(Produto.vImagensProd.dataSet.RecNo) +
            '/' + IntToStr(Produto.vImagensProd.dataSet.RecordCount);

        lbS_qtdeImgProd.Caption   := lbqtdeImgProd.Caption;
        lbS_qtdeImgProdEC.Caption := lbqtdeImgProd.Caption;
        lbS_qtdeImgProdCA.Caption := lbqtdeImgProd.Caption;

        vDadosIni.GravaAuditoria(
        	'PRO316',
          'ADICIONAR IMAGEM',
          'SUCESSO - ' + ExtractFileName(vFileNameDestino),
        	'PRODUTOS',
          Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
          Produto.dataSet.FieldByName('COD_PROD').AsString,
          Produto.buscas);

      end;
    except on E: Exception do
      begin
        vDadosIni.GravaAuditoria(
        	'PRO316',
          'ADICIONAR IMAGEM',
          'FALHA - ' + ExtractFileName(vFileNameDestino),
          'PRODUTOS',
          Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
          Produto.dataSet.FieldByName('COD_PROD').AsString,
          Produto.buscas);

        Produto.registraErro('Falha adicionar imagem. Erro: ' + e.Message);
        Application.MessageBox(Pchar('Falha adicionar imagem. Erro: '+ e.Message), 'Erro', 0 + 64);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButton49Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    lbDescrGradeImg.Caption := trim(Produto.vImagensProd.dataSet.FieldByName('DESCR_GRADE').AsString);
    if Produto.dataSet.State <> dsEdit then
      lbqtdeImgProd.Caption := ''
    else if Produto.vImagensProd.dataSet.RecordCount <= 0 then
    	lbqtdeImgProd.Caption := '0/0'
    else
      lbqtdeImgProd.Caption := IntToStr(Produto.vImagensProd.dataSet.RecNo) +
        '/' + IntToStr(Produto.vImagensProd.dataSet.RecordCount);

  	lbS_qtdeImgProd.Caption   := lbqtdeImgProd.Caption;
    lbS_qtdeImgProdEC.Caption := lbqtdeImgProd.Caption;
    lbS_qtdeImgProdCA.Caption := lbqtdeImgProd.Caption;

    if Produto.vImagensProd.dataSet.RecordCount > 0 then
      if (Produto.vImagensProd.dataSet.RecNo = Produto.vImagensProd.dataSet.RecordCount) then
      begin
        Application.MessageBox(PChar('Fim da lista de imagens!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
        exit;
      end;

    try
      if not vDadosIni.PesqPros(
      	'PRO318',
        'PROXIMA IMAGEM',
        '',
        'PRODUTOS',
        Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
        Produto.dataSet.FieldByName('COD_PROD').AsString,
        Produto.buscas,
        true) then
          exit;

      if Produto.vImagensProd.dataSet.RecordCount > 0 then
     		if (Produto.vImagensProd.dataSet.RecNo < Produto.vImagensProd.dataSet.RecordCount) then
        	Produto.vImagensProd.dataSet.Next;

      if Produto.vImagensProd.dataSet.RecordCount <= 0 then
      begin
        Image1.Picture.Assign(nil);
        Image1.Hint    := '';
      end
      else
      begin
      	if not FileExists(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
        	Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString) then
        begin
					if not FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
            Image1.Picture.LoadFromFile('')
          else
            Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg')
        end
        else
        begin
          Image1.Picture.LoadFromFile(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
            Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString);
        end;

        Image1.Hint    := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
        	Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString;
      end;

      lbDescrGradeImg.Caption := trim(Produto.vImagensProd.dataSet.FieldByName('DESCR_GRADE').AsString);
      if Produto.dataSet.State <> dsEdit then
        lbqtdeImgProd.Caption := ''
      else if Produto.vImagensProd.dataSet.RecordCount <= 0 then
      	lbqtdeImgProd.Caption := '0/0'
      else
        lbqtdeImgProd.Caption := IntToStr(Produto.vImagensProd.dataSet.RecNo) +
          '/' + IntToStr(Produto.vImagensProd.dataSet.RecordCount);

      lbS_qtdeImgProd.Caption   := lbqtdeImgProd.Caption;
      lbS_qtdeImgProdEC.Caption := lbqtdeImgProd.Caption;
      lbS_qtdeImgProdCA.Caption := lbqtdeImgProd.Caption;

      vDadosIni.GravaAuditoria(
      	'PRO318',
        'PROXIMA IMAGEM',
        'SUCESSO',
        'PRODUTOS',
        Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
        Produto.dataSet.FieldByName('COD_PROD').AsString,
        Produto.buscas);
  
    except on E: Exception do
      begin
        vDadosIni.GravaAuditoria(
        	'PRO318',
          'PROXIMA IMAGEM',
          'FALHA',
        	'PRODUTOS',
          Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
          Produto.dataSet.FieldByName('COD_PROD').AsString,
          Produto.buscas);
          
        Produto.registraErro('Falha posicionar a proxima imagem. Erro: ' + e.Message);
        Application.MessageBox(Pchar('Falha posicionar a proxima imagem. Erro: '+ e.Message), 'Erro', 0 + 64);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.spLimparMesSpedReg0205Click(Sender: TObject);
begin
  inherited;
  edMesMovSped0205.Clear;
end;

procedure TFrmCadProdutos.Splitter1Moved(Sender: TObject);
begin
  inherited;
  _GravaConfiguracoesInteger(pnOpcaoDireitaProdutos.Name, vDadosIni.IfThen(pnOpcaoDireitaProdutos.Width < 180, 180, pnOpcaoDireitaProdutos.Width));
end;

procedure TFrmCadProdutos.SplitterObservacaoBottomMoved(
  Sender: TObject);
begin
  try
  	AjustarBarraLateral(False);
  finally
  	_GravaConfiguracoesInteger(pnObservacao.Name, vDadosIni.IfThen(pnObservacao.Height < 48, 48, pnObservacao.Height));
    _GravaConfiguracoesInteger(pnCaracteristica.Name, vDadosIni.IfThen(pnCaracteristica.Height < 48, 48, pnCaracteristica.Height));
    _GravaConfiguracoesInteger(pnCodigo.Name, vDadosIni.IfThen(pnCodigo.Height < 48, 48, pnCodigo.Height));
    _GravaConfiguracoesInteger(pnEstoqueEmpresas.Name, vDadosIni.IfThen(pnEstoqueEmpresas.Height < 48, 48, pnEstoqueEmpresas.Height));
    _GravaConfiguracoesInteger(pnPrecosVndPorEmpresa.Name, vDadosIni.IfThen(pnPrecosVndPorEmpresa.Height < 48, 48, pnPrecosVndPorEmpresa.Height));
  end;
end;

procedure TFrmCadProdutos.spAltSPED0205Click(Sender: TObject);
begin
  inherited;
  if Produto.dataSet.IsEmpty then
    Exit;

  vProdAlt := TProdutosAlteracaoSPED0205.create;
  try
    dsProdAltSped0205.DataSet := Produto.buscas;
    gridSped0205.DataSource := dsProdAltSped0205;
    if not vProdAlt.abreRegistros(
      Produto.dataSet.FieldByName('grupo_prod').AsInteger,
      Produto.dataSet.FieldByName('cod_prod').AsString, Produto.buscas) then
      Exit;

    vDadosIni.abreForm('Registro de Alteração de Produtos - Registro 0205 - SPED',
      pnSped0205, tsSped0205);

  finally
    dsProdAltSped0205.DataSet := nil;
    vProdAlt.Free;
    vProdAlt := nil;
  end;
end;

procedure TFrmCadProdutos.SpeedButton50Click(Sender: TObject);
var
  vFileNameImage: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if Produto.vImagensProd.dataSet.RecordCount <= 0 then
    begin
      Application.MessageBox(PChar('Nenhuma imagem encontrada na lista'),
        'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
      exit;
    end;

    if not vDadosIni.PesqPros(
      'PRO320',
      'EXCLUIR IMAGEM',
      '',
      'PRODUTOS',
      Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
      Produto.dataSet.FieldByName('COD_PROD').AsString,
      Produto.buscas,
      true) then
        exit;

    try
      vFileNameImage := Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString;

      Produto.vImagensProd.removerImagem(
        Produto.dataSet);

      if Produto.vImagensProd.dataSet.RecordCount <= 0 then
      begin
        Image1.Picture.Assign(nil);
        Image1.Hint    := '';
      end
      else
      begin
      	if not FileExists(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
          Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString) then
        begin
          if not FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
            Image1.Picture.LoadFromFile('')
          else
            Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg')
        end
        else
        begin
          Image1.Picture.LoadFromFile(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
            Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString);
        end;

        Image1.Hint    := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
          Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString;
      end;

      if Produto.dataSet.State in [dsInsert, dsEdit] then
      begin
        if trim(Produto.dataSet.FieldByName('alterou_imagem').AsString) <> 'S' then
          Produto.dataSet.FieldByName('alterou_imagem').AsString := 'S';
        if trim(Produto.dataSet.FieldByName('alterou_imagem_grade').AsString) <> 'S' then
          Produto.dataSet.FieldByName('alterou_imagem_grade').AsString := 'S';
      end;

      lbDescrGradeImg.Caption := trim(Produto.vImagensProd.dataSet.FieldByName('DESCR_GRADE').AsString);
      if Produto.dataSet.State <> dsEdit then
        lbqtdeImgProd.Caption := ''
      else if Produto.vImagensProd.dataSet.RecordCount <= 0 then
      	lbqtdeImgProd.Caption := '0/0'
      else
      	lbqtdeImgProd.Caption := IntToStr(Produto.vImagensProd.dataSet.RecNo) +
          '/' + IntToStr(Produto.vImagensProd.dataSet.RecordCount);

      lbS_qtdeImgProd.Caption   := lbqtdeImgProd.Caption;
      lbS_qtdeImgProdEC.Caption := lbqtdeImgProd.Caption;
      lbS_qtdeImgProdCA.Caption := lbqtdeImgProd.Caption;

      vDadosIni.GravaAuditoria(
        'PRO320',
        'EXCLUIR IMAGEM',
        'SUCESSO - ' + ExtractFileName(vFileNameImage),
        'PRODUTOS',
        Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
        Produto.dataSet.FieldByName('COD_PROD').AsString,
        Produto.buscas);

    except on E: Exception do
      begin
        vDadosIni.GravaAuditoria(
        	'PRO320',
          'EXCLUIR IMAGEM',
          'FALHA - ' + ExtractFileName(vFileNameImage),
          'PRODUTOS',
          Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
          Produto.dataSet.FieldByName('COD_PROD').AsString,
          Produto.buscas);

        Produto.registraErro('Falha excluir imagem. Erro: ' + e.Message);
        Application.MessageBox(Pchar('Falha excluir imagem. Erro: '+ e.Message), 'Erro', 0 + 64);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButton51Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    lbDescrGradeImg.Caption := trim(Produto.vImagensProd.dataSet.FieldByName('DESCR_GRADE').AsString);
  	if Produto.dataSet.State <> dsEdit then
      lbqtdeImgProd.Caption := ''
    else if Produto.vImagensProd.dataSet.RecordCount <= 0 then
    	lbqtdeImgProd.Caption := '0/0'
    else
      lbqtdeImgProd.Caption := IntToStr(Produto.vImagensProd.dataSet.RecNo) +
        '/' + IntToStr(Produto.vImagensProd.dataSet.RecordCount);

  	lbS_qtdeImgProd.Caption   := lbqtdeImgProd.Caption;
    lbS_qtdeImgProdEC.Caption := lbqtdeImgProd.Caption;
    lbS_qtdeImgProdCA.Caption := lbqtdeImgProd.Caption;

    if Produto.vImagensProd.dataSet.RecordCount > 0 then
      if (Produto.vImagensProd.dataSet.RecNo <= 1) then
      begin
        Application.MessageBox(PChar('Início da lista de imagens!'), 'Atenção', MB_ICONWARNING + MB_DEFBUTTON1);
        exit;
      end;

    try
      if not vDadosIni.PesqPros(
        'PRO319',
        'IMAGEM ANTERIOR',
        '',
        'PRODUTOS',
        Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
        Produto.dataSet.FieldByName('COD_PROD').AsString,
        Produto.buscas,
        true) then
          exit;

      if Produto.vImagensProd.dataSet.RecordCount > 0 then
     		if (Produto.vImagensProd.dataSet.RecNo > 1) then
        	Produto.vImagensProd.dataSet.Prior;

      if Produto.vImagensProd.dataSet.RecordCount <= 0 then
      begin
        Image1.Picture.Assign(nil);
        Image1.Hint    := '';
      end
      else
      begin
      	if not FileExists(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
        	Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString) then
        begin
          if not FileExists(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg') then
            Image1.Picture.LoadFromFile('')
          else
            Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg')
        end
        else
        begin
          Image1.Picture.LoadFromFile(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
            Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString);
        end;

        Image1.Hint    := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
        	Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString;
      end;

      lbDescrGradeImg.Caption := trim(Produto.vImagensProd.dataSet.FieldByName('DESCR_GRADE').AsString);
      if Produto.dataSet.State <> dsEdit then
        lbqtdeImgProd.Caption := ''
      else if Produto.vImagensProd.dataSet.RecordCount <= 0 then
      	lbqtdeImgProd.Caption := '0/0'
      else
        lbqtdeImgProd.Caption := IntToStr(Produto.vImagensProd.dataSet.RecNo) +
          '/' + IntToStr(Produto.vImagensProd.dataSet.RecordCount);

      lbS_qtdeImgProd.Caption   := lbqtdeImgProd.Caption;
      lbS_qtdeImgProdEC.Caption := lbqtdeImgProd.Caption;
      lbS_qtdeImgProdCA.Caption := lbqtdeImgProd.Caption;

      vDadosIni.GravaAuditoria(
      	'PRO319',
        'IMAGEM ANTERIOR',
        'SUCESSO',
        'PRODUTOS',
        Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
        Produto.dataSet.FieldByName('COD_PROD').AsString,
        Produto.buscas);

    except on E: Exception do
      begin
        vDadosIni.GravaAuditoria(
          'PRO319',
          'IMAGEM ANTERIOR',
          'FALHA',
          'PRODUTOS',
          Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
          Produto.dataSet.FieldByName('COD_PROD').AsString,
          Produto.buscas);

        Produto.registraErro('Falha posicionar imagem anterior. Erro: ' + e.Message);
        Application.MessageBox(Pchar('Falha posicionar imagem anterior. Erro: '+ e.Message), 'Erro', 0 + 64);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButton52Click(Sender: TObject);
var
  wides: WideString;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros(
    	'PRO317',
      'VISUALIZAR IMAGEM',
      '',
      'PRODUTOS',
      Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
      Produto.dataSet.FieldByName('COD_PROD').AsString,
      Produto.buscas,
      true) then
        exit;

    if Produto.vImagensProd.dataSet.RecordCount > 0 then
      if not FileExists(IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
      	Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString) then
      begin
      	Application.MessageBox(PChar('Imagem não encontrada: ' + #13 + #13 +
        	IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
          Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString),
          'Atenção', 0 + 64);
        exit;
      end
      else
      begin
        //viewImage(PChar(Produto.vGradesImagens.Items[Produto.vGradesImagens.fIndex].img.ItemSelected.fileNameImagemToZoom));
        wides := IfThen(trim(vDiretorioDestino) <> '', vDiretorioDestino, '') +
        	Produto.vImagensProd.dataSet.FieldByName('IMAGEM').AsString;
        hw_image_view(wides);
      end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButton53Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO020', 'PESQUISAR', '', 'PRODUTOS', '', Produto.buscas, true) then
  begin
    DBEdit187.Enabled := false;
    DBCheckBox2.Enabled := false;
  end
  else
  begin
    DBEdit187.Enabled := true;
    DBCheckBox2.Enabled := true;
  end;
end;

procedure TFrmCadProdutos.SpeedButton54Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if Trim(DBGrid39.DataSource.DataSet.FieldByName('Tipo').AsString) = 'NFD' then
    begin
      vDadosIni.vPesquisa := 'NFD_FICHAPRODUTO|' + IntToStr(DBGrid39.DataSource.DataSet.FieldByName('Numero').AsInteger) + '|';
      vDadosIni.vNomeForm := 'frmCadNfSerieD';
      vDadosIni.abreFormCadastro('pkAutomacao', 'TfrmCadNfSerieD', True, 'Formulário de Nota fiscal Série D já aberto. Feche que tente novamente');
    end
    else if Trim(DBGrid39.DataSource.DataSet.FieldByName('Tipo').AsString) = 'NFC' then
    begin
      vDadosIni.vPesquisa := 'NFC_FICHAPRODUTO|' + IntToStr(DBGrid39.DataSource.DataSet.FieldByName('Cod NF').AsInteger) + '|';
      vDadosIni.vNomeForm := 'frmCadNFCe';
      vDadosIni.abreFormCadastro('pkNFConsumidor', 'TfrmCadNFCe', True, 'Formulário de Nota fiscal Consumidor já aberto. Feche que tente novamente');
    end
    else if Trim(DBGrid39.DataSource.DataSet.FieldByName('Tipo').AsString) = 'NF' then
    begin
      if DBGrid39.DataSource.DataSet.FieldByName('Cod NF').AsInteger <= 0 then
      begin
        Application.MessageBox('Nota fiscal de modelo antigo, não é possível visualizar', 'Atenção', 0 + 64);
        Exit;
      end;
      vDadosIni.vPesquisa := 'NF_FICHAPRODUTO|' + IntToStr(DBGrid39.DataSource.DataSet.FieldByName('Cod NF').AsInteger) + '|';
      vDadosIni.vNomeForm := 'frmCadNF';
      vDadosIni.abreFormCadastro('pkNF', 'TfrmCadNF', True, 'Formulário de Nota fiscal já aberto. Feche que tente novamente');
    end
    else if Trim(DBGrid39.DataSource.DataSet.FieldByName('Tipo').AsString) = 'PDC' then
    begin
      vDadosIni.vPesquisa := 'PRODUCAO_FICHAPRODUTO|' + IntToStr(DBGrid39.DataSource.DataSet.FieldByName('Numero').AsInteger) + '|';
      vDadosIni.vNomeForm := 'frmCadProducao';
      vDadosIni.abreFormCadastro('pkProducao', 'TfrmCadProducao', True, 'Formulário de Pedido de Produção já aberto. Feche que tente novamente');
    end
    else if Trim(DBGrid39.DataSource.DataSet.FieldByName('Tipo').AsString) = 'DEV' then
    begin
      vDadosIni.vPesquisa := 'DEVOLUCAO_FICHAPRODUTO|' + IntToStr(DBGrid39.DataSource.DataSet.FieldByName('Numero').AsInteger) + '|';
      vDadosIni.vNomeForm := 'frmDevolucao';
      vDadosIni.abreFormCadastro('pkDevolucao', 'TfrmDevolucao', True, 'Formulário de Devolução já aberto. Feche que tente novamente');
    end
    else if vDadosIni.strEstaContidoEm(Trim(DBGrid39.DataSource.DataSet.FieldByName('Tipo').AsString), ['REQ', 'OS', 'ORC']) then
    begin
      vDadosIni.vPesquisa := 'PEDVENDA_FICHAPRODUTO|' + Trim(DBGrid39.DataSource.DataSet.FieldByName('Tipo').AsString) + '|' + IntToStr(DBGrid39.DataSource.DataSet.FieldByName('Numero').AsInteger) + '|';
      vDadosIni.vNomeForm := 'FrmCadPedVenda';
      vDadosIni.abreFormCadastro('pkPedidoVenda', 'TFrmCadPedVenda', True, 'Formulário de Pedido de Venda ou Ordem de Serviço ou Orçamento já aberto. Feche que tente novamente');
    end
    else
    begin
      Application.MessageBox(PChar('Sem detalhes para esta operação, detalhes apenas para as operações abaixo:' + #13 + #13 +
        'REQ: Pedido de Venda' + #13 +
        'OS: Ordem de Serviço' + #13 +
        'ORC: Orçamento' + #13 +
        'NF: Nota Fiscal' + #13 +
        'NFC: Nota Fiscal Consumidor' + #13 + 
        'NFS: Nota Fiscal Série D' + #13 +
        'PDC: Pedido de Produção' + #13 +
        'DEV: Devolução'), 'Atenção', 0 + 64);
    end;

  finally
    vDadosIni.vPesquisa := '';
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButton55Click(Sender: TObject);
begin
  try
    if (vDadosIni.vEmp.vUsarProducao = 'S') then
    begin
      if vDadosIni.produtoAcabadoPrimaTemGrade(
        Produto.buscas,
        Produto.dataSet.FieldByName('grupo_prod').AsInteger,
        Produto.dataSet.FieldByName('cod_prod').AsString,
        0,
        '') then
      begin
        if vDadosIni.existeGradeProducao(
          Produto.buscas,
          Produto.dataSet.FieldByName('grupo_prod').AsInteger,
          Produto.dataSet.FieldByName('cod_prod').AsString,
          0,
          '') then
        begin
          if not vDadosIni.vincularProdutoAcabadoMateriaPrima(
          	Produto.buscas,
            Produto.dataSet.FieldByName('grupo_prod').AsInteger,
            Produto.dataSet.FieldByName('cod_prod').AsString,
            0,
            0,
            '',
            0,
            true) then
              exit;
        end;
      end;
    end;

    Application.CreateForm(TFrmVisualizarAcabadoMateriasPrimas, FrmVisualizarAcabadoMateriasPrimas);
    vDadosIni.vPesquisaGrupo_prod := Produto.dataSet.FieldByName('grupo_prod').AsString;
    vDadosIni.vPesquisaCod_prod := Produto.dataSet.FieldByName('cod_prod').AsString;
    FrmVisualizarAcabadoMateriasPrimas.vIndTec := Produto.vIndTec;
    if FrmVisualizarAcabadoMateriasPrimas.ShowModal <> IDOK then
      exit;
  finally
  	if Assigned(FrmVisualizarAcabadoMateriasPrimas) then
    	FreeAndNil(FrmVisualizarAcabadoMateriasPrimas);
  end;
end;

procedure TFrmCadProdutos.SpeedButton56Click(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    if Trim(DBGrid45.DataSource.DataSet.FieldByName('Tipo').AsString) = 'NF' then
    begin
      if DBGrid45.DataSource.DataSet.FieldByName('Cod NF').AsInteger <= 0 then
      begin
        Application.MessageBox('Nota fiscal de modelo antigo, não é possível visualizar', 'Atenção', 0 + 64);
        Exit;
      end;
      vDadosIni.vPesquisa := 'NF_FICHAPRODUTO|' + IntToStr(DBGrid45.DataSource.DataSet.FieldByName('Cod NF').AsInteger) + '|';
      vDadosIni.vNomeForm := 'frmCadNF';
      vDadosIni.abreFormCadastro('pkNF', 'TfrmCadNF', True, 'Formulário de Nota fiscal já aberto. Feche que tente novamente');
    end
    else if Trim(DBGrid45.DataSource.DataSet.FieldByName('Tipo').AsString) = 'PDC' then
    begin
      vDadosIni.vPesquisa := 'PRODUCAO_FICHAPRODUTO|' + IntToStr(DBGrid45.DataSource.DataSet.FieldByName('Numero').AsInteger) + '|';
      vDadosIni.vNomeForm := 'frmCadProducao';
      vDadosIni.abreFormCadastro('pkProducao', 'TfrmCadProducao', True, 'Formulário de Pedido de Produção já aberto. Feche que tente novamente');
    end
    else if Trim(DBGrid45.DataSource.DataSet.FieldByName('Tipo').AsString) = 'DEV' then
    begin
      vDadosIni.vPesquisa := 'DEVOLUCAO_FICHAPRODUTO|' + IntToStr(DBGrid45.DataSource.DataSet.FieldByName('Numero').AsInteger) + '|';
      vDadosIni.vNomeForm := 'frmDevolucao';
      vDadosIni.abreFormCadastro('pkDevolucao', 'TfrmDevolucao', True, 'Formulário de Devolução já aberto. Feche que tente novamente');
    end
    else if vDadosIni.strEstaContidoEm(Trim(DBGrid45.DataSource.DataSet.FieldByName('Tipo').AsString), ['REQ', 'OS']) then
    begin
      vDadosIni.vPesquisa := 'PEDVENDA_FICHAPRODUTO|' + Trim(DBGrid45.DataSource.DataSet.FieldByName('Tipo').AsString) + '|' + IntToStr(DBGrid45.DataSource.DataSet.FieldByName('Numero').AsInteger) + '|';
      vDadosIni.vNomeForm := 'FrmCadPedVenda';
      vDadosIni.abreFormCadastro('pkPedidoVenda', 'TFrmCadPedVenda', True, 'Formulário de Pedido de Venda ou Ordem de Serviço já aberto. Feche que tente novamente');
    end
    else
    begin
      Application.MessageBox(PChar('Sem detalhes para esta operação, detalhes apenas para as operações abaixo:' + #13 + #13 +
        'REQ: Pedido de Venda' + #13 +
        'OS: Ordem de Serviço' + #13 +
        'NF: Nota Fiscal' + #13 +
        'PDC: Pedido de Produção' + #13 +
        'DEV: Devolução'), 'Atenção', 0 + 64);
    end;

  finally
    vDadosIni.vPesquisa := '';
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButton58Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if Trim(DBGrid46.DataSource.DataSet.FieldByName('Tipo').AsString) = 'NF' then
    begin
      if DBGrid46.DataSource.DataSet.FieldByName('Cod NF').AsInteger <= 0 then
      begin
        Application.MessageBox('Nota fiscal de modelo antigo, não é possível visualizar', 'Atenção', 0 + 64);
        Exit;
      end;
      vDadosIni.vPesquisa := 'NF_FICHAPRODUTO|' + IntToStr(DBGrid46.DataSource.DataSet.FieldByName('Cod NF').AsInteger) + '|';
      vDadosIni.vNomeForm := 'frmCadNF';
      vDadosIni.abreFormCadastro('pkNF', 'TfrmCadNF', True, 'Formulário de Nota fiscal já aberto. Feche que tente novamente');
    end
    else if Trim(DBGrid46.DataSource.DataSet.FieldByName('Tipo').AsString) = 'PDC' then
    begin
      vDadosIni.vPesquisa := 'PRODUCAO_FICHAPRODUTO|' + IntToStr(DBGrid46.DataSource.DataSet.FieldByName('Numero').AsInteger) + '|';
      vDadosIni.vNomeForm := 'frmCadProducao';
      vDadosIni.abreFormCadastro('pkProducao', 'TfrmCadProducao', True, 'Formulário de Pedido de Produção já aberto. Feche que tente novamente');
    end
    else if Trim(DBGrid46.DataSource.DataSet.FieldByName('Tipo').AsString) = 'DEV' then
    begin
      vDadosIni.vPesquisa := 'DEVOLUCAO_FICHAPRODUTO|' + IntToStr(DBGrid46.DataSource.DataSet.FieldByName('Numero').AsInteger) + '|';
      vDadosIni.vNomeForm := 'frmDevolucao';
      vDadosIni.abreFormCadastro('pkDevolucao', 'TfrmDevolucao', True, 'Formulário de Devolução já aberto. Feche que tente novamente');
    end
    else if vDadosIni.strEstaContidoEm(Trim(DBGrid46.DataSource.DataSet.FieldByName('Tipo').AsString), ['REQ', 'OS']) then
    begin
      vDadosIni.vPesquisa := 'PEDVENDA_FICHAPRODUTO|' + Trim(DBGrid46.DataSource.DataSet.FieldByName('Tipo').AsString) + '|' + IntToStr(DBGrid46.DataSource.DataSet.FieldByName('Numero').AsInteger) + '|';
      vDadosIni.vNomeForm := 'FrmCadPedVenda';
      vDadosIni.abreFormCadastro('pkPedidoVenda', 'TFrmCadPedVenda', True, 'Formulário de Pedido de Venda ou Ordem de Serviço já aberto. Feche que tente novamente');
    end
    else
    begin
      Application.MessageBox(PChar('Sem detalhes para esta operação, detalhes apenas para as operações abaixo:' + #13 + #13 +
        'REQ: Pedido de Venda' + #13 +
        'OS: Ordem de Serviço' + #13 +
        'NF: Nota Fiscal' + #13 +
        'PDC: Pedido de Produção' + #13 +
        'DEV: Devolução'), 'Atenção', 0 + 64);
    end;

  finally
    vDadosIni.vPesquisa := '';
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButtonECommerceClick(Sender: TObject);
begin
	try

    try
      if Assigned(TreeViewCat) then
        FreeAndNil(TreeViewCat);
    finally
      if not Assigned(TreeViewCat) then
      begin
        TreeViewCat := TTreeView.Create(Self);
        TreeViewCat.Parent := Panel94;
        TreeViewCat.Align := alClient;
        TreeViewCat.OnDblClick := TreeViewCatDblClick;
        TreeViewCat.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewCatDB) then
      	FreeAndNil(TreeViewCatDB);
    finally
    	if not Assigned(TreeViewCatDB) then
      begin
        TreeViewCatDB := TTreeView.Create(Self);
        TreeViewCatDB.Parent := Panel97;
        TreeViewCatDB.Align := alClient;
        TreeViewCatDB.OnDblClick := TreeViewCatDBDblClick;
        TreeViewCatDB.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewGradeEC) then
        FreeAndNil(TreeViewGradeEC);
    finally
      if not Assigned(TreeViewGradeEC) then
      begin
        TreeViewGradeEC := TTreeView.Create(Self);
        TreeViewGradeEC.Parent := Panel102;
        TreeViewGradeEC.Align := alClient;
        TreeViewGradeEC.OnDblClick := TreeViewGradeECDblClick;
        TreeViewGradeEC.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewGradeEC_DB) then
        FreeAndNil(TreeViewGradeEC_DB);
    finally
      if not Assigned(TreeViewGradeEC_DB) then
      begin
        TreeViewGradeEC_DB := TTreeView.Create(Self);
        TreeViewGradeEC_DB.Parent := Panel105;
        TreeViewGradeEC_DB.Align := alClient;
        TreeViewGradeEC_DB.OnDblClick := TreeViewGradeEC_DBDblClick;
        TreeViewGradeEC_DB.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewGradeCA) then
      	FreeAndNil(TreeViewGradeCA);
    finally
    	if not Assigned(TreeViewGradeCA) then
      begin
      	TreeViewGradeCA := TTreeView.Create(Self);
    		TreeViewGradeCA.Parent := Panel85;
        TreeViewGradeCA.Align := alClient;
        TreeViewGradeCA.OnDblClick := TreeViewGradeCADblClick;
        TreeViewGradeCA.Items.Clear;
      end;
    end;

    try
    	if Assigned(TreeViewGradeCA_DB) then
      	FreeAndNil(TreeViewGradeCA_DB);
    finally
    	if not Assigned(TreeViewGradeCA_DB) then
      begin
        TreeViewGradeCA_DB := TTreeView.Create(Self);
        TreeViewGradeCA_DB.Parent := Panel90;
        TreeViewGradeCA_DB.Align := alClient;
        TreeViewGradeCA_DB.OnDblClick := TreeViewGradeCA_DBDblClick;
        TreeViewGradeCA_DB.Items.Clear;
      end;
    end;

    vDadosIni.removerGradeNaoUtilizadosEcomerce(
      Produto.dataset.FieldByName('GRUPO_PROD').AsInteger,
      Produto.dataset.FieldByName('COD_PROD').AsString
    );

    Produto.vImagensProd.alterarImagemNovaTab(Produto.dataSet, vDiretorioDestino);

    pnDadosEC.Tag := 99;
    if not Produto.Edit then
      exit;

    montarComponentes;

    PageControlEC.ActivePage := TabSheetEC1;

    pnDadosEC.Align  := alNone;
    pnDadosEC.Height := 348;
    pnDadosEC.Width  := 876;

    habilitarCamposECommerce(true);
		pnDadosECEnter(Sender);
    btnAlterarDadosECClick(Sender);

    if Produto.vCategorias.dataSet.ChangeCount > 0 then
    	Produto.vCategorias.Apply;
    Produto.CommitaTransacao;
  finally
  	pnDadosEC.Align := alClient;
    pnDadosEC.Tag := 0;

  	Produto.Cancel;
    Produto.CancelUpdates;
    Produto.CodBarra.Cancel;
    Produto.CodBarra.CancelUpdates;
    Produto.RollBackTransacao;
  end;
end;

procedure TFrmCadProdutos.btn_historicoPrecosClick(Sender: TObject);
var
  afterScrollEvent: TDataSetNotifyEvent;
begin
  inherited;
  Application.CreateForm(TfrmCadProdutosHistPreco, frmCadProdutosHistPreco);

  try
    if produto.dataSet.state = dsBrowse then
      afterScrollEvent := Produto.dataSet.AfterScroll;

    Produto._dataSourceOOP := DBGrid1.DataSource;

    frmCadProdutosHistPreco.produto := Produto;
    frmCadProdutosHistPreco.markMargVisiveis := vDadosIni.PesqPros('PRO440', 'HABILITAR', '', '', '', Produto.buscas, False, False, True);
    frmCadProdutosHistPreco.custoVisivel := vDadosIni.PesqPros('PRO301', 'HABILITAR', '', '', '', Produto.buscas, False, False, True);
    frmCadProdutosHistPreco.ShowModal;

  finally
    Produto._dataSourceOOP := nil;

    if produto.dataSet.state = dsBrowse then
    begin
      Produto.dataSet.AfterScroll := afterScrollEvent;
      if Assigned(Produto.dataSet.AfterScroll) then
        Produto.dataSet.AfterScroll(Produto.dataSet);
    end;
  end;
end;

procedure TFrmCadProdutos.SpeedButton59Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('prod_%', Produto.buscas);

  Produto.lerConfigAdc;
  pnTotEstEmp.Visible := Produto.vEstoquePorEmpresa.vExibirSomaTotalEstoque;
end;

procedure TFrmCadProdutos.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PRODUTOS', 'A', Produto.buscas) then
    Exit;

//  if vDadosIni.PesqPros('PRO007', '', '', 'RESTAURAR',
//  	Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
//    Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, false) then
  if Produto.RestaurarRegistro then
    lixeiraVazia(not Produto.StatusLixeira);
end;

procedure TFrmCadProdutos.SpeedButtonAlterarHtmlCAClick(Sender: TObject);
var
  HTMLDocument: IHTMLDocument2;
begin
	HTMLDocument := WebBrowserCA.Document as IHTMLDocument2;
  carregarwebbrownser(WebBrowserCA, vDadosIni.abreFormEditorHtml(HTMLDocument.body.innerHTML, '', false));
  Produto.vProdutosEC.dataSet.FieldByName('DESCR_PROD_COMPL').AsString := HTMLDocument.body.innerHTML;
end;

procedure TFrmCadProdutos.SpeedButtonAlterarHtmlECClick(Sender: TObject);
var
  HTMLDocument: IHTMLDocument2;
begin
	HTMLDocument := WebBrowserEC.Document as IHTMLDocument2;
  carregarwebbrownser(WebBrowserEC, vDadosIni.abreFormEditorHtml(HTMLDocument.body.innerHTML, '', false));
  Produto.vProdutosEC.dataSet.FieldByName('DESCR_PROD_COMPL').AsString := HTMLDocument.body.innerHTML;
end;        

procedure TFrmCadProdutos.btn_alterarPrecosClick(Sender: TObject);
begin
  inherited;
  //vDadosIni.abreForm('Preços', pnPrecosUnificados, opFormsDefCadEsc);
  Application.CreateForm(TfrmCadProdutosPrecosUnificados, frmCadProdutosPrecosUnificados);

  try
    frmCadProdutosPrecosUnificados.produto := Produto;
    frmCadProdutosPrecosUnificados.custoVisivel := vDadosIni.PesqPros('PRO301', 'HABILITAR', '', '', '', Produto.buscas, False, False, True);
    frmCadProdutosPrecosUnificados.ShowModal;

  finally
  end;
end;

procedure TFrmCadProdutos.SpeedButton61Click(Sender: TObject);
var
	vSenhaDig: string;
  vSenhaAtual: string;
  vTmp1: Int64;
  vTmp2: Int64;
  vTmp3: Int64;
  vSenhaTmp: string;
begin
  inherited;
 if not InputQuery('Informe a senha', 'Informe a senha para liberar acesso', vSenhaDig) then
    exit;

  if (trim(vSenhaDig) = '') then
  begin
    Application.MessageBox('Senha não informada', 'Atenção', 0 + 64);
    exit;
  end;

  vTmp1 := StrToInt(FormatDateTime('ddmmyyyy', Date));
  vTmp2 := StrToInt(FormatDateTime('ddmm', Date));
  vTmp3 := StrToInt(FormatDateTime('dd', Date));

  vSenhaTmp := IntToStr(vTmp1* vTmp2 * vTmp3);

  vSenhaAtual := vDadosIni.codifica(vSenhaTmp);

  if (trim(vSenhaDig) <> trim(vSenhaAtual)) then
  begin
  	Application.MessageBox('Senha incorreta, favor tenta novamente', 'Atenção', 0 + 64);
    exit;
  end;

	AlterarQtdeNFProd.Visible := true;
  AlterarQtdeCustoNFProd.Visible := true;
  RecalcularEstoqueEstDiario.Visible := true;
  RecalcularCustoAcabado.Visible := true;
  SpeedButton61.Visible := false;
end;

procedure TFrmCadProdutos.SpeedButton62Click(Sender: TObject);
begin
  inherited;
	if (ActiveControl = DBMemo2) and (BitBtn_4.CanFocus) then
    ActiveControl := BitBtn_4//apenas para sair do campo de obs caso tenha sido digitado algum dado
  else if (ActiveControl = DBMemo4) and (BitBtn4.CanFocus) then
  	ActiveControl := BitBtn4;//apenas para sair do campo de obs caso tenha sido digitado algum dado

  vDadosIni.abreForm('Detalhes / Características', pnObsMaxmized, [ofAlignAllClientWinCtrl, ofMaximized]);
end;

procedure TFrmCadProdutos.SpeedButton63Click(Sender: TObject);
begin
  inherited;
	if (ActiveControl = DBMemo3) and (BitBtn_4.CanFocus) then
    ActiveControl := BitBtn_4//apenas para sair do campo de obs caso tenha sido digitado algum dado
  else if (ActiveControl = DBMemo5) and (BitBtn4.CanFocus) then
  	ActiveControl := BitBtn4;//apenas para sair do campo de obs caso tenha sido digitado algum dado
       
  vDadosIni.abreForm('Observações', pnObsMaxmized2, [ofAlignAllClientWinCtrl, ofMaximized]);
end;

procedure TFrmCadProdutos.SpeedButton68Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('prod_cad_alt_lote_reg', Produto.buscas);
end;

procedure TFrmCadProdutos.btMarcaSelecaoEtClick(Sender: TObject);
var
  rescueEventEstEmp: TDataSetNotifyEvent;
  rescueEvent: TDataSetNotifyEvent;
begin
  inherited;

  rescueEventEstEmp := Produto.vEstoquePorEmpresa.dataSet.AfterScroll;
  rescueEvent := Produto.dataSet.AfterScroll;

  Produto.prepare_loop('sel = ''S''');
  try                                  
    Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;
    Produto.dataSet.AfterScroll := nil;

    while not Produto.dataSet.Eof do
    begin
      Produto.marcarProdutoEtiqueta(True, ck1EtiqCadProd.Checked);
      Produto.dataSet.Next;
    end;
  finally
    Produto.prepare_loop_done();
    Produto.vEstoquePorEmpresa.dataSet.AfterScroll := rescueEventEstEmp;
    Produto.dataSet.AfterScroll := rescueEvent;

    ShowAtencao('Processo concluído');
  end;
end;

procedure TFrmCadProdutos.opfiscalEditBtnClick(Sender: TObject);
var
  AshowEditForm: TShowEditForm;
begin
  if dataSetOpf.IsEmpty then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);

    @AshowEditForm := GetProcAddress(vDadosIni.vCadBasicos.AHandle, 'operacaofiscal_edit');
    if Assigned(AshowEditForm) then
      if AshowEditForm(dataSetOpf.fint('id')) then
        tabOpfiscalChange(tabOpfiscal);
//        dataSetOpf.Refresh;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.opfiscalViewBtnClick(Sender: TObject);
var
  AshowModalForm: TShowModalForm;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vCadBasicos.AHandle = 0 then
      CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);

    @AshowModalForm := GetProcAddress(vDadosIni.vCadBasicos.AHandle, 'operacaofiscal_ncm_prod');
    if Assigned(AshowModalForm) then
      if AshowModalForm(Produto.fstr('nbm')) then
        tabOpfiscalChange(tabOpfiscal);
//        dataSetOpf.Refresh;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('PRO021', 'VERIFICAR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString, Produto.buscas, true) then
    //  if vDadosIni.PesqPros('PRO021', Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString,
    //    produto.buscas, true) then
  begin
  	vHabObservacaoProd := False;
    vHabCaracteristicaProd := False;
    vHabCodigoProd := False;
    vHabEstoquePorEmpresas := False;
    vHabPrecosVndPorEmpresa := False;
    vHabQtdeVndPorMes := True;
    
    Panel8.Top := Trunc(TabSheet2.Height / 2) - Trunc(Panel8.Height / 2);
    Panel8.Left := Trunc(TabSheet2.Width / 2) - Trunc(Panel8.Width / 2);
    Panel8.Visible := true;
    Panel1.Visible := false;
    GroupBox3.Visible := false;
    MaskEdit7.Text := datetostr(vDadosIni.getDataBanco(Produto.buscas) - (vdadosini.vEmp.vqtmessug * 30));
    if (Self.Enabled) and (Self.Visible) and (MaskEdit7.CanFocus) then
	    MaskEdit7.SetFocus;
  end;
end;

procedure TFrmCadProdutos.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO079', 'VERIFICAR', '', 'PRODUTOS',
    Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString, Produto.buscas, true) then
    //  if not vDadosIni.PesqPros('PRO079', '', produto.buscas, true) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    if copy(Produto.dataSet.FieldByName('balanca_prod').AsString, 1, 1) <> 'S' then
    begin
      Application.MessageBox('Produto não usa balança', 'Atenção', mb_ok +
        MB_ICONINFORMATION);
      exit;
    end;
    if PageControl1.ActivePage = TabSheet2 then
      tsReceitaAss.Tag := 2
    else if PageControl1.ActivePage = TabSheet1 then
      tsReceitaAss.Tag := 1
    else if PageControl1.ActivePage = tsCadastroSimples then
      tsReceitaAss.Tag := 1;

    PageControl1.ActivePage := tsReceitaAss;
    if not Produto.vRecAss.Active then
      Produto.vRecAss.Open;
    Produto.vRecAss.IndexFieldNames := 'cod_receita';
    Produto.vRecAss.FindNearest([Produto.dataSet.FieldByName('cod_receita').AsInteger]);
    if Produto.dataSet.FieldByName('cod_receita').AsInteger =
      Produto.vRecAss.dataSet.FieldByName('cod_receita').AsInteger then
    begin
      GroupBox24.Visible := False;
      label155.Caption := 'Receita de código ' + Produto.dataSet.FieldByName('cod_receita').AsString +
        ' está associada atualmente a este produto [ ' +
        trim(Produto.dataSet.FieldByName('DESCR_PROD').AsString) + ' ]';
    end
    else
    begin
      Application.MessageBox('Produto sem receita associada', 'Atenção', mb_ok +
        MB_ICONINFORMATION);
      label155.Caption := 'Produto [ ' + trim(Produto.dataSet.FieldByName('DESCR_PROD').AsString) +
        ' ] ainda sem receita associada.';
    end;
    PageControl1.ActivePage := tsReceitaAss;
    BitBtn10.Enabled := true;
    BitBtn34.Enabled := false;
    BitBtn28.Enabled := false;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    BitBtn120.Enabled := False;
    if not vDadosIni.PesqPros('PRO078', 'ABRIR', '', 'PRODUTOS',
      Produto.dataSet.FieldByName('NUM_FAB_PROD').AsString, Produto.buscas, true) then
      //    if not vDadosIni.PesqPros('PRO078', '', produto.buscas, true) then
      Exit;
    Produto.abrirUltimasCompras;
    vPeriodo := ' de ' + MaskEdit8.Text + ' a ' + MaskEdit9.Text;
    vPeriodoC := ' de ' + MaskEdit27.Text + ' a ' + MaskEdit28.Text;
    if not Produto.abrirComprasEVendas(MaskEdit8.Text, MaskEdit9.Text) then
    begin
      if (Self.Enabled) and (Self.Visible) and (MaskEdit8.CanFocus) then
        MaskEdit8.SetFocus;
      label113.Caption := format('%0.4f', [Produto.qtdentrada]);
      label116.Caption := format('%0.4f', [Produto.qtdsaida]);
    end
    else
    begin
      BitBtn120.Enabled := True;
      label113.Caption := format('%0.4f', [Produto.qtdentrada]);
      label116.Caption := format('%0.4f', [Produto.qtdsaida]);
      if (Self.Enabled) and (Self.Visible) and (DBGrid4.CanFocus) then
        DBGrid4.SetFocus;
    end;
    if not Produto.abrirComprasEVendasC(MaskEdit27.Text, MaskEdit28.Text) then
    begin
      label393.Caption := format('%0.4f', [Produto.qtdentradaC]);
      label394.Caption := format('%0.4f', [Produto.qtdsaidaC]);
//      label396.Caption := format('%0.4f', [Produto.qtdentradaCEst]);
//      label397.Caption := format('%0.4f', [Produto.qtdsaidaCEst]);
      label396.Caption := format('%0.4f', [Produto.qtdentradaConf]);
      label397.Caption := format('%0.4f', [Produto.qtdSaidaConf]);
      Label398.Caption := format('%0.4f', [Produto.qtdOrcC]);
    end
    else
    begin
      BitBtn127.Enabled := True;
      label394.Caption := format('%0.4f', [Produto.qtdentradaC]);
      label394.Caption := format('%0.4f', [Produto.qtdsaidaC]);
//      label396.Caption := format('%0.4f', [Produto.qtdentradaCEst]);
//      label397.Caption := format('%0.4f', [Produto.qtdsaidaCEst]);
      label396.Caption := format('%0.4f', [Produto.qtdentradaConf]);
      label397.Caption := format('%0.4f', [Produto.qtdSaidaConf]);
      Label398.Caption := format('%0.4f', [Produto.qtdOrcC]);
    end;
    DBGrid20.Visible := not DBGrid20.DataSource.DataSet.IsEmpty;
    DBGrid21.Visible := not DBGrid21.DataSource.DataSet.IsEmpty;
    if DBGrid20.Visible then
    begin
      DBGrid32.Height := Trunc(GroupBox14.Height / 3)-5;
      DBGrid20.Height := Trunc(GroupBox14.Height / 3)-5;
//      DBGrid4.Height := Trunc(GroupBox14.Height / 3)-3;
    end
    else
      DBGrid32.Height := Trunc(GroupBox14.Height / 2)-4;
    if DBGrid21.Visible then
      DBGrid21.Height := Trunc(GroupBox15.Height / 2)-4;
    ckEstoqueDiarioClick(Sender);
    ckEstoqueDiario.Checked := _LerConfiguracoesRegistroBoolean('ckEstoqueDiario');
    ckEstoqueDiarioCClick(Sender);
    ckEstoqueDiarioC.Checked := _LerConfiguracoesRegistroBoolean('ckEstoqueDiarioC');
    Produto.cdsEstoqueDiario.AfterScroll := Produto.datasetAfterScrollEstDia;
    Produto.cdsEstoqueDiarioC.AfterScroll := Produto.datasetAfterScrollEstDiaC;
    PageControl1.ActivePage := tsFichas;

    ckRequisicao.OnClick := nil;
    ckOrdemServ.OnClick := nil;
    ckOrcamento.OnClick := nil;
    ckNotas.OnClick := nil;
    ckDevolucao.OnClick := nil;
    ckProducao.OnClick := nil;
    ckCorrecao.OnClick := nil;
    ckBalD.OnClick := nil;
    ckBalG.OnClick := nil;
    ckExcCancReab.OnClick := nil;
    ckAlterouEst.OnClick := nil;
    ckNAlterouEst.OnClick := nil;
    ckCupom.OnClick := nil;
    ckNotaD.OnClick := nil;
    ckNotasS.OnClick := nil;
    ckNotasC.OnClick := nil;
    ckConfirmados.OnClick := nil;
    ckPendentes.OnClick := nil;

    ckRequisicao.Checked := _LerConfiguracoesRegistroBoolean('ckRequisicao');
    ckOrdemServ.Checked := _LerConfiguracoesRegistroBoolean('ckOrdemServ');
    ckOrcamento.Checked := _LerConfiguracoesRegistroBoolean('ckOrcamento');
    ckNotas.Checked := _LerConfiguracoesRegistroBoolean('ckNotas');
    ckDevolucao.Checked := _LerConfiguracoesRegistroBoolean('ckDevolucao');
    ckProducao.Checked := _LerConfiguracoesRegistroBoolean('ckProducao');
    ckCorrecao.Checked := _LerConfiguracoesRegistroBoolean('ckCorrecao');
    ckBalD.Checked := _LerConfiguracoesRegistroBoolean('ckBalD');
    ckBalG.Checked := _LerConfiguracoesRegistroBoolean('ckBalG');
    ckExcCancReab.Checked := _LerConfiguracoesRegistroBoolean('ckExcCancReab');
    ckAlterouEst.Checked := _LerConfiguracoesRegistroBoolean('ckAlterouEst');
    ckNAlterouEst.Checked := _LerConfiguracoesRegistroBoolean('ckNAlterouEst');
    ckCupom.Checked := _LerConfiguracoesRegistroBoolean('ckCupom');
    ckNotaD.Checked := _LerConfiguracoesRegistroBoolean('ckNotaD');
    ckNotasS.Checked := _LerConfiguracoesRegistroBoolean('ckNotasS');
    ckNotasC.Checked := _LerConfiguracoesRegistroBoolean('ckNotasC');
    ckConfirmados.Checked := _LerConfiguracoesRegistroBoolean('ckConfirmados');
    ckPendentes.Checked := _LerConfiguracoesRegistroBoolean('ckPendentes');

    ckRequisicao.OnClick := ckRequisicaoClick;
    ckOrdemServ.OnClick := ckRequisicaoClick;
    ckOrcamento.OnClick := ckRequisicaoClick;
    ckNotas.OnClick := ckRequisicaoClick;
    ckDevolucao.OnClick := ckRequisicaoClick;
    ckProducao.OnClick := ckRequisicaoClick;
    ckCorrecao.OnClick := ckRequisicaoClick;
    ckBalD.OnClick := ckRequisicaoClick;
    ckBalG.OnClick := ckRequisicaoClick;
    ckExcCancReab.OnClick := ckRequisicaoClick;
    ckAlterouEst.OnClick := ckAlterouEstClick;
    ckNAlterouEst.OnClick := ckNAlterouEstClick;
    ckCupom.OnClick := ckRequisicaoClick;
    ckNotaD.OnClick := ckRequisicaoClick;
    ckNotasS.OnClick := ckRequisicaoClick;
    ckNotasC.OnClick := ckRequisicaoClick;
    ckConfirmados.OnClick := ckAlterouEstClick;
    ckPendentes.OnClick := ckNAlterouEstClick;

    ckAlterouEstClick(Sender);
    aplicarFiltros;

//    Produto.dataSet.AfterScroll := nil;
//    Produto.vEstoquePorEmpresa.dataSet.AfterScroll := nil;

    if (Self.Enabled) and (Self.Visible) and (MaskEdit8.CanFocus) then
      MaskEdit8.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButtonAlterarEst2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO336', 'HABILITAR', '',
  'PRODUTOS', '', Produto.buscas, true) then
  	exit;
     
  SpeedButtonAlterarEst2.Visible := false;
  
  DBEdit150.Enabled := true;
  Label449.Visible := true;
  DBEdit218.Visible := true;

  DBEdit218.Enabled := true;
  Produto.vHabAlterarEstoque := true;
  if (Self.Enabled) and (Self.Visible) and (DBEdit150.CanFocus) then
	  DBEdit150.SetFocus;
end;

procedure TFrmCadProdutos.SpeedButtonAlterarEstClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO336', 'HABILITAR', '',
  'PRODUTOS', '', Produto.buscas, true) then
  	exit;

  SpeedButtonAlterarEst.Visible := false;
  
  DBEdit5.Enabled := true;
  Label447.Visible := true;
  DBEdit6.Visible := true;
  
  DBEdit6.Enabled := true;
  DBEdit6.OnExit := DBEdit33Exit; // chamada no exit da alteracao de preco de custo, para alterar precos se necessario

  Produto.vHabAlterarEstoque := true;
  if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
	  DBEdit5.SetFocus;
end;

procedure TFrmCadProdutos.SpeedButtonAlterarProduto2Click(Sender: TObject);
var
  I: Integer;
  vArrayCodTipoItem: array of string;
  vArrayDescrTipoItem: array of string;
  vIndexFieldNames: string;
  vIndexName: string;
  vRecNo: Integer;
begin
 	if not vDadosIni.PesqPros('PRO361', 'ALTERAR', '', 'PRODUTOS', '', Produto.buscas, true) then
	 	Exit;

  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;

//  if not Produto.vGrupo.dataSet.Active then
    Produto.vGrupo.abreGrupos;
//  if not Produto.vSubGrupo.dataSet.Active then
    Produto.vSubGrupo.abreSubGrupos;
//  if not Produto.MarcaProd.dataSet.Active then
    Produto.MarcaProd.abreMarca;
//  if not Produto.vTipoProdutoFabrica.Active then
    Produto.vTipoProdutoFabrica.abreTipoProdutoFabrica;
//  if not Produto.vComissaoFaixaDesconto.Active then
	  Produto.vComissaoFaixaDesconto.abreComissaoFaixaDescontoAltLote;

  SetLength(vArrayCodTipoItem, DBComboBox11.Items.Count);
  SetLength(vArrayDescrTipoItem, DBComboBox11.Items.Count);
  for I := 0 to DBComboBox11.Items.Count - 1 do
  begin
    vArrayCodTipoItem[I] := IntToStr(I);
    vArrayDescrTipoItem[I] := DBComboBox11.Items[I];
  end;
  vLKTipoItemProduto := TDadosLookUp_OOP.create;
  vLKTipoItemProduto.setDadosDataSet(vArrayCodTipoItem, vArrayDescrTipoItem, DbLTipoItem);

  MkAloc1.EditMask := vDadosIni.vMascaraLocacao;
  MkAloc2.EditMask := vDadosIni.vMascaraLocacao;

  pnVendaOnline.Visible := vDadosIni.vHwCloudIA.vUsarVendaOnline = 'S';

  EdCodGrupoProd.AsValue := _LerConfiguracoesRegistroDouble(EdCodGrupoProd.Name);
  DBLGrupoProd.KeyValue := _LerConfiguracoesRegistroInteger(DBLGrupoProd.Name);
  EdCodPerfilProd.AsValue := _LerConfiguracoesRegistroDouble(EdCodPerfilProd.Name);
  EdPerfilProd.Text := _LerConfiguracoesRegistroString(EdPerfilProd.Name);
  EdCodSubGrupo.AsValue := _LerConfiguracoesRegistroDouble(EdCodSubGrupo.Name);
  DBLSubGrupo.KeyValue := _LerConfiguracoesRegistroInteger(DBLSubGrupo.Name);
  EdCodMarca.AsValue := _LerConfiguracoesRegistroDouble(EdCodMarca.Name);
  DBLMarca.KeyValue := _LerConfiguracoesRegistroInteger(DBLMarca.Name);
  EdCodCFOP.AsValue := _LerConfiguracoesRegistroDouble(EdCodCFOP.Name);
  EdCodCFOPInter.AsValue := _LerConfiguracoesRegistroDouble(EdCodCFOPInter.Name);
  EdCodNCM.Text := _LerConfiguracoesRegistroString(EdCodNCM.Name);
  EdCEST.Text := _LerConfiguracoesRegistroString(EdCEST.Name);
  EdCodCST.Text := _LerConfiguracoesRegistroString(EdCodCST.Name);
  EdAliqICMS.AsValue := _LerConfiguracoesRegistroDouble(EdAliqICMS.Name);
  EdCodCSOSN.Text := _LerConfiguracoesRegistroString(EdCodCSOSN.Name);
  EdCSTPisCofinsSaida.Text := _LerConfiguracoesRegistroString(EdCSTPisCofinsSaida.Name);
  EdCSTPisCofinsEntrada.Text := _LerConfiguracoesRegistroString(EdCSTPisCofinsEntrada.Name);
  EdNatReceita.Text := _LerConfiguracoesRegistroString(EdNatReceita.Name);
  EdAliqPisDif.AsValue := _LerConfiguracoesRegistroDouble(EdAliqPisDif.Name);
  EdAliqCofinsDif.AsValue := _LerConfiguracoesRegistroDouble(EdAliqCofinsDif.Name);
  EdAliqCredPis.AsValue := _LerConfiguracoesRegistroDouble(EdAliqCredPis.Name);
  EdAliqCredCofins.AsValue := _LerConfiguracoesRegistroDouble(EdAliqCredCofins.Name);
  CbIsento.ItemIndex := _LerConfiguracoesRegistroInteger(CbIsento.Name);
  EdCSTIPI.Text := _LerConfiguracoesRegistroString(EdCSTIPI.Name);
  EdAliqIPI.AsValue := _LerConfiguracoesRegistroDouble(EdAliqIPI.Name);
  EdCodEnqIPI.Text := _LerConfiguracoesRegistroString(EdCodEnqIPI.Name);
  if not vDadosIni.vProduto.Precos.UsarMargemAoMarkup then
  begin
    EdPercTab.AsValue := _LerConfiguracoesRegistroDouble(EdPercTab.Name);
    EdPercAtac.AsValue := _LerConfiguracoesRegistroDouble(EdPercAtac.Name);
    EdPerc30.AsValue := _LerConfiguracoesRegistroDouble(EdPerc30.Name);
    EdPerc60.AsValue := _LerConfiguracoesRegistroDouble(EdPerc60.Name);
    EdPerc90.AsValue := _LerConfiguracoesRegistroDouble(EdPerc90.Name);
    lbPercTab.Caption := 'Markup Varejo';
    lbPercAtac.Caption := 'Markup Atacado';
    lbPerc30.Caption := 'Markup 30 dias';
    lbPerc60.Caption := 'Markup 60 dias';
    lbPerc90.Caption := 'Markup 90 dias';
  end
  else
  begin
    EdPercTab.AsValue := _LerConfiguracoesRegistroDouble('Mrg' + EdPercTab.Name);
    EdPercAtac.AsValue := _LerConfiguracoesRegistroDouble('Mrg' + EdPercAtac.Name);
    EdPerc30.AsValue := _LerConfiguracoesRegistroDouble('Mrg' + EdPerc30.Name);
    EdPerc60.AsValue := _LerConfiguracoesRegistroDouble('Mrg' + EdPerc60.Name);
    EdPerc90.AsValue := _LerConfiguracoesRegistroDouble('Mrg' + EdPerc90.Name);
    lbPercTab.Caption := 'Margem Varejo';
    lbPercAtac.Caption := 'Margem Atacado';
    lbPerc30.Caption := 'Margem 30 dias';
    lbPerc60.Caption := 'Margem 60 dias';
    lbPerc90.Caption := 'Margem 90 dias';
  end;
  EdDescMax.AsValue := _LerConfiguracoesRegistroDouble(EdDescMax.Name);
  EdPercMargemMinVarejo.AsValue := _LerConfiguracoesRegistroDouble(EdPercMargemMinVarejo.Name);
  EdPercMargemMinAtacado.AsValue := _LerConfiguracoesRegistroDouble(EdPercMargemMinAtacado.Name);
  EdPercAjustePrec30.AsValue := _LerConfiguracoesRegistroDouble(EdPercAjustePrec30.Name);
  EdPercAjustePrec60.AsValue := _LerConfiguracoesRegistroDouble(EdPercAjustePrec60.Name);
  EdPercAjustePrec90.AsValue := _LerConfiguracoesRegistroDouble(EdPercAjustePrec90.Name);
  DbLTipo.KeyValue := _LerConfiguracoesRegistroString(DbLTipo.Name);
  DbLTipoItem.KeyValue := _LerConfiguracoesRegistroString(DbLTipoItem.Name);
  cbConsumo.ItemIndex := _LerConfiguracoesRegistroInteger(cbConsumo.Name);
  cbPermDesc.ItemIndex := _LerConfiguracoesRegistroInteger(cbPermDesc.Name);
  cbClasse.ItemIndex := _LerConfiguracoesRegistroInteger(cbClasse.Name);
  cbAlterarDescrCupom.ItemIndex := _LerConfiguracoesRegistroInteger(cbAlterarDescrCupom.Name);
  cbAlterarVlCupom.ItemIndex := _LerConfiguracoesRegistroInteger(cbAlterarVlCupom.Name);
  EdComissaoProduto.AsValue := _LerConfiguracoesRegistroDouble(EdComissaoProduto.Name);
  EdComissaoGerente.AsValue := _LerConfiguracoesRegistroDouble(EdComissaoGerente.Name);

  EdObsEtiq.Text := _LerConfiguracoesRegistroString(EdObsEtiq.Name);
  lbInfObsEtiq.Caption := '';
	lbInfObsEtiq.Caption := Produto._retornaValorCalculadoEtiqueta(EdObsEtiq.Text);

  EdAplicacaoRef.Text := _LerConfiguracoesRegistroString(EdAplicacaoRef.Name);
  MkAloc1.Text := _LerConfiguracoesRegistroString(MkAloc1.Name);
  MkAloc2.Text := _LerConfiguracoesRegistroString(MkAloc2.Name);
  cbVendaOnline.ItemIndex := _LerConfiguracoesRegistroInteger(cbVendaOnline.Name);
  cbLancDebCred.ItemIndex := _LerConfiguracoesRegistroInteger(cbLancDebCred.Name);
  EdPercDebCredDev.AsValue := _LerConfiguracoesRegistroDouble(EdPercDebCredDev.Name);

  EdComissaoFaixaDesc.AsValue := _LerConfiguracoesRegistroDouble(EdComissaoFaixaDesc.Name);
  DBLComissaoFaixaDesc.KeyValue := _LerConfiguracoesRegistroInteger(DBLComissaoFaixaDesc.Name);

  EdPercComissaoCashback.AsValue := _LerConfiguracoesRegistroDouble(EdPercComissaoCashback.Name);
  EdDiasVencCashback.AsValue := _LerConfiguracoesRegistroDouble(EdDiasVencCashback.Name);

  if ckPermOpcaoMarcadas.Checked then
	ckGrupo.Checked := _LerConfiguracoesRegistroBoolean(ckGrupo.Name)
  else
  	ckGrupo.Checked := false;
  ckGrupoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	ckPerfil.Checked := _LerConfiguracoesRegistroBoolean(ckPerfil.Name)
  else
  	ckPerfil.Checked := false;
  ckPerfilClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	ckSubGrupo.Checked := _LerConfiguracoesRegistroBoolean(ckSubGrupo.Name)
  else
  	ckSubGrupo.Checked := false;
  ckSubGrupoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	ckMarca.Checked := _LerConfiguracoesRegistroBoolean(ckMarca.Name)
  else
  	ckMarca.Checked := false;
  ckMarcaClick(Sender);

	if ckPermOpcaoMarcadas.Checked then
  	ckNatOP.Checked := _LerConfiguracoesRegistroBoolean(ckNatOP.Name)
  else
  	ckNatOP.Checked := false;
  ckNatOPClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
	ckNCM.Checked := _LerConfiguracoesRegistroBoolean(ckNCM.Name)
  else
  	ckNCM.Checked := false;
  ckNCMClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckCEST.Checked := _LerConfiguracoesRegistroBoolean(ckCEST.Name)
  else
  	ckCEST.Checked := false;
  ckCESTClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckCST.Checked := _LerConfiguracoesRegistroBoolean(ckCST.Name)
  else
  	ckCST.Checked := false;
  ckCSTClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckAliqICMS.Checked := _LerConfiguracoesRegistroBoolean(ckAliqICMS.Name)
  else
  	ckAliqICMS.Checked := false;
  ckAliqICMSClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckCSON.Checked := _LerConfiguracoesRegistroBoolean(ckCSON.Name)
  else
  	ckCSON.Checked := false;
  ckCSONClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckPercReducao.Checked := _LerConfiguracoesRegistroBoolean(ckPercReducao.Name)
  else
  	ckPercReducao.Checked := false;
  ckPercReducaoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckCSTPisCofinsS.Checked := _LerConfiguracoesRegistroBoolean(ckCSTPisCofinsS.Name)
  else
  	ckCSTPisCofinsS.Checked := false;
  ckCSTPisCofinsSClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckCSTPisCofinsE.Checked := _LerConfiguracoesRegistroBoolean(ckCSTPisCofinsE.Name)
  else
  	ckCSTPisCofinsE.Checked := false;
  ckCSTPisCofinsEClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckNatRec.Checked := _LerConfiguracoesRegistroBoolean(ckNatRec.Name)
  else
  	ckNatRec.Checked := false;
  ckNatRecClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckAliqPisCofinsDif.Checked := _LerConfiguracoesRegistroBoolean(ckAliqPisCofinsDif.Name)
  else
  	ckAliqPisCofinsDif.Checked := false;
  ckAliqPisCofinsDifClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckAliqCredPisCofins.Checked := _LerConfiguracoesRegistroBoolean(ckAliqCredPisCofins.Name)
  else
  	ckAliqCredPisCofins.Checked := false;
  ckAliqCredPisCofinsClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckIsento.Checked := _LerConfiguracoesRegistroBoolean(ckIsento.Name)
  else
  	ckIsento.Checked := false;
  ckIsentoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckCstIPI.Checked := _LerConfiguracoesRegistroBoolean(ckCstIPI.Name)
  else
  	ckCstIPI.Checked := false;
  ckCstIPIClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckAliqIPI.Checked := _LerConfiguracoesRegistroBoolean(ckAliqIPI.Name)
  else
  	ckAliqIPI.Checked := false;
  ckAliqIPIClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckCodEnqIPI.Checked := _LerConfiguracoesRegistroBoolean(ckCodEnqIPI.Name)
  else
  	ckCodEnqIPI.Checked := false;
  ckCodEnqIPIClick(Sender);
  
  if ckPermOpcaoMarcadas.Checked then
  	ckPercTab.Checked := _LerConfiguracoesRegistroBoolean(ckPercTab.Name)
  else
  	ckPercTab.Checked := false;
  ckPercTabClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckPercAtac.Checked := _LerConfiguracoesRegistroBoolean(ckPercAtac.Name)
  else
  	ckPercAtac.Checked := false;
  ckPercAtacClick(Sender);
  
  if ckPermOpcaoMarcadas.Checked then
  	ckPerc30.Checked := _LerConfiguracoesRegistroBoolean(ckPerc30.Name)
  else
  	ckPerc30.Checked := false;
  ckPerc30Click(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckPerc60.Checked := _LerConfiguracoesRegistroBoolean(ckPerc60.Name)
  else
  	ckPerc60.Checked := false;
  ckPerc60Click(Sender);
  
  if ckPermOpcaoMarcadas.Checked then
  	ckPerc90.Checked := _LerConfiguracoesRegistroBoolean(ckPerc90.Name)
  else
  	ckPerc90.Checked := false;
  ckPerc90Click(Sender);
  
  if ckPermOpcaoMarcadas.Checked then
  	ckDescMax.Checked := _LerConfiguracoesRegistroBoolean(ckDescMax.Name)
  else
  	ckDescMax.Checked := false;
  ckDescMaxClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckPercMargemMinVarejo.Checked := _LerConfiguracoesRegistroBoolean(ckPercMargemMinVarejo.Name)
  else
  	ckPercMargemMinVarejo.Checked := false;
  ckPercMargemMinVarejoClick(Sender);
  
  if ckPermOpcaoMarcadas.Checked then
  	ckPercMargemMinAtacado.Checked := _LerConfiguracoesRegistroBoolean(ckPercMargemMinAtacado.Name)
  else
  	ckPercMargemMinAtacado.Checked := false;
  ckPercMargemMinAtacadoClick(Sender);
  
  if ckPermOpcaoMarcadas.Checked then
  	ckPercAjustePrec30.Checked := _LerConfiguracoesRegistroBoolean(ckPercAjustePrec30.Name)
  else
  	ckPercAjustePrec30.Checked := false;
  ckPercAjustePrec30Click(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckPercAjustePrec60.Checked := _LerConfiguracoesRegistroBoolean(ckPercAjustePrec60.Name)
  else
  	ckPercAjustePrec60.Checked := false;
  ckPercAjustePrec60Click(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckPercAjustePrec90.Checked := _LerConfiguracoesRegistroBoolean(ckPercAjustePrec90.Name)
  else
  	ckPercAjustePrec90.Checked := false;
  ckPercAjustePrec90Click(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckObsEtiq.Checked := _LerConfiguracoesRegistroBoolean(ckObsEtiq.Name)
  else
  	ckObsEtiq.Checked := false;
  ckObsEtiqClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckTipoProduto.Checked := _LerConfiguracoesRegistroBoolean(ckTipoProduto.Name)
  else
  	ckTipoProduto.Checked := false;
  ckTipoProdutoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckTipoItemProduto.Checked := _LerConfiguracoesRegistroBoolean(ckTipoItemProduto.Name)
  else
  	ckTipoItemProduto.Checked := false;
  ckTipoItemProdutoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckConsumo.Checked := _LerConfiguracoesRegistroBoolean(ckConsumo.Name)
  else
  	ckConsumo.Checked := false;
  ckConsumoClick(Sender);
  
  if ckPermOpcaoMarcadas.Checked then
  	ckPermDesc.Checked := _LerConfiguracoesRegistroBoolean(ckPermDesc.Name)
  else
  	ckPermDesc.Checked := false;
  ckPermDescClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckClasse.Checked := _LerConfiguracoesRegistroBoolean(ckClasse.Name)
  else
  	ckClasse.Checked := false;
  ckClasseClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckAlterarDescrCupom.Checked := _LerConfiguracoesRegistroBoolean(ckAlterarDescrCupom.Name)
  else
  	ckAlterarDescrCupom.Checked := false;
  ckAlterarDescrCupomClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckAlterarVlCupom.Checked := _LerConfiguracoesRegistroBoolean(ckAlterarVlCupom.Name)
  else
  	ckAlterarVlCupom.Checked := false;
  ckAlterarVlCupomClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckComissaoProduto.Checked := _LerConfiguracoesRegistroBoolean(ckComissaoProduto.Name)
  else
  	ckComissaoProduto.Checked := false;
  ckComissaoProdutoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckComissaoGerente.Checked := _LerConfiguracoesRegistroBoolean(ckComissaoGerente.Name)
  else
  	ckComissaoGerente.Checked := false;
  ckComissaoGerenteClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckAplicacaoRef.Checked := _LerConfiguracoesRegistroBoolean(ckAplicacaoRef.Name)
  else
  	ckAplicacaoRef.Checked := false;
  ckAplicacaoRefClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckAloc1.Checked := _LerConfiguracoesRegistroBoolean(ckAloc1.Name)
  else
  	ckAloc1.Checked := false;
  ckAloc1Click(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckAloc2.Checked := _LerConfiguracoesRegistroBoolean(ckAloc2.Name)
  else
  	ckAloc2.Checked := false;
  ckAloc2Click(Sender);

  if not pnVendaOnline.Visible then
   ckVendaOnline.Checked := False 
  else if ckPermOpcaoMarcadas.Checked then
   ckVendaOnline.Checked := _LerConfiguracoesRegistroBoolean(ckVendaOnline.Name)
  else
    ckVendaOnline.Checked := false;
  ckVendaOnlineClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
   ckLancDebCred.Checked := _LerConfiguracoesRegistroBoolean(ckLancDebCred.Name)
  else
  	ckLancDebCred.Checked := false;
  ckLancDebCredClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
    ckPercDebCredDev.Checked := _LerConfiguracoesRegistroBoolean(ckPercDebCredDev.Name)
  else
  	ckPercDebCredDev.Checked := false;
  ckPercDebCredDevClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
  	ckComissaoFaixaDesconto.Checked := _LerConfiguracoesRegistroBoolean(ckComissaoFaixaDesconto.Name)
  else
  	ckComissaoFaixaDesconto.Checked := false;
  ckComissaoFaixaDescontoClick(Sender);

  if ckPermOpcaoMarcadas.Checked then
    ckCashback.Checked := _LerConfiguracoesRegistroBoolean(ckCashback.Name)
  else
  	ckCashback.Checked := false;
  ckCashbackClick(Sender);

  try
  	vIndexFieldNames := Produto.dataSet.IndexFieldNames;
    vIndexName       := Produto.dataSet.IndexName;
    vRecNo           := Produto.dataSet.RecNo;

    for I := 0 to Produto.dataSet.Fields.Count - 1 do
    begin
    	if trim(Produto.dataSet.Fields[I].DisplayName) = trim(ComboBox2.text) then
      begin
      	vIndexFieldNames := Produto.dataSet.Fields[I].FieldName;
        break;
      end;
    end;

    Produto.dataSet.DisableControls;
    Produto.dataSet.Filtered := false;
    Produto.dataSet.Filter := 'sel = ''S'' ';
    Produto.dataSet.Filtered := true;

    if Produto.dataSet.IsEmpty then
    begin
      Application.MessageBox('Nenhum produto selecionado.', 'Atenção',
        MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      exit;
    end;
  finally
  	 Produto.dataSet.Filtered        := false;
    Produto.dataSet.IndexName       := vIndexName;
    Produto.dataSet.IndexFieldNames := vIndexFieldNames;
    if Produto.dataSet.RecordCount >= vRecNo then
	   Produto.dataSet.RecNo         := vRecNo;
    Produto.dataSet.EnableControls;
  end;

  PageControl1.ActivePage := tsAlterDadosLote;
  tsAlterDadosLote.Show;
end;

procedure TFrmCadProdutos.SpeedButtonAlterarProdutoClick(Sender: TObject);
begin
  inherited;
  SpeedButton1Click(Sender);
//  Produto.AtualizarProduto := true;
//  Produto.oldGrupoProd := Produto.dataSet.FieldByName('GRUPO_PROD').AsString;
//  Produto.oldCodProd := trim(Produto.dataSet.FieldByName('COD_PROD').AsString);
//  DBEdit16.Enabled := true;
//  DBLookupComboBox1.Enabled := true;
//  DBLookupComboBox11.Enabled := true;

  if (Produto.dataSet.State in [dsInsert, dsEdit]) then
  begin
  	if Produto.dataSet.FieldByName('ativo').AsInteger <> 1 then
     	Produto.dataSet.FieldByName('ativo').AsInteger := 1;
//	  if Produto.dataSet.FieldByName('grupo_prod').AsInteger <= 0 then
//	  	Produto.dataSet.FieldByName('num_fab_prod').Value := null;
  end;

//  if Produto.cadastroSimplificado then
//  begin
//  	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox11.CanFocus) then
//    	DBLookupComboBox11.SetFocus;
//  end
//  else
//  begin
//   if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
//    DBEdit16.SetFocus;
//  end;
end;

procedure TFrmCadProdutos.SpeedButtonAlterDadosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
  	 GroupBox3.Parent := Panel52;
	 BitBtn2.Visible := False;
	 BitBtn3.Visible := False;
    btVoltarDadosProd.Parent := GroupBox3;
    Panel1.Visible := true;
    Panel1.Parent := Panel128;
	 Panel2.Visible := False;

    Panel52.Visible := false;
    Panel52.Align := alNone;

    GroupBox79.Visible := false;
    GroupBox79.Align := alNone;

    pnCenterAlterDadosProd.Visible := false;
    pnCenterAlterDadosProd.Align := alNone;

    Panel128.Visible := false;
    Panel128.Align := alNone;

    Panel52.Visible := TelaCadastro <> 4;
    Panel52.Align := alTop;

    GroupBox79.Visible := TelaCadastro = 4;
    GroupBox79.Align := alTop;

    pnCenterAlterDadosProd.Visible := true;
    pnCenterAlterDadosProd.Align := alTop;

    Panel128.Visible := true;
    Panel128.Align := alClient;

    Panel52.Height := GroupBox3.Height;

		_LerConfiguracoesRegistroBoolean(ckPermOpcaoMarcadas.Name, False);

    PageControl1.ActivePage := tsAlterDadosProd;

    if TelaCadastro <> 4 then
      TelaCadastro := 5;
    Self.fechar := True;

    ckMenuLateral.Visible := False;
    ckMenuLateralClick(Sender);

    lbCorLote.Visible := false;
    pnCorLote.Visible := false;

    ckPermOpcaoMarcadas.Visible := true;
    lbExplProdSemGrupo.Visible := false;
    if TelaCadastro = 5 then
    begin
    	ckLixeira.Visible    := True;
      ckLixeira2.Visible   := False;
      ckEcommerce.Visible  := True;
    	if ckLixeira.Checked then
        FrmCadProdutos.Caption := 'Alteração Produtos em Lote (Lixeira)'
      else if ckEcommerce.Checked then
      	FrmCadProdutos.Caption := 'Alteração Produtos em Lote (E-Commerce)'
      else
        FrmCadProdutos.Caption := 'Alteração Produtos em Lote';
    end
    else
    begin
    	ckLixeira.Visible    := False;
      ckLixeira2.Visible   := True;
      ckEcommerce.Visible  := False;
      lbCorLote.Visible    := False;
      pnCorLote.Visible    := True;
      
      ckPermOpcaoMarcadas.Visible := false;
      lbExplProdSemGrupo.Visible := true;
      Produto.abreProdutosNF(vDadosIni.vPesquisaChaveNF);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.SpeedButtonAlternarCadastro2Click(Sender: TObject);
begin
  SpeedButtonAlternarCadastroClick(Sender);
end;

procedure TFrmCadProdutos.SpeedButtonAlternarCadastroClick(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO459', 'ALTERNAR',
   	vDadosIni.IfThen(not Produto.cadastroSimplificado, 'SIMPLIFICADO', 'COMPLETO'),
    'PRODUTOS',
    vDadosIni.IfThen(Produto.dataSet.State = dsEdit,
      Produto.dataSet.FieldByName('GRUPO_PROD').AsString + ' - ' +
      Produto.dataSet.FieldByName('COD_PROD').AsString, ''),
    Produto.buscas, true) then
    exit;

	Produto.cadastroSimplificado := not Produto.cadastroSimplificado;

  if Produto.cadastroSimplificado then
  	CheckCadSeq_.Checked := CheckCadSeq.Checked
  else
  	CheckCadSeq.Checked  := CheckCadSeq_.Checked;

  if Produto.dataSet.State = dsEdit then
  	HabilitarCamposEdicao
  else
    HabilitarCamposInclusao;
end;

procedure TFrmCadProdutos.SpeedButtonCashbackClick(Sender: TObject);
begin
  inherited;
	if not vDadosIni.PesqPros('PRO457', 'ALTERAR', '', 'PRODUTOS',
     Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
     Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true) then
    Exit;

  try
    if not Produto.Edit then
      exit;

    pn_CashbackButtom.Visible := True;
    GroupBoxCashback.Parent := pn_Cashback;
    if not vDadosIni.abreForm('Cashback Produto', pn_Cashback, [ofAutoSize, ofEscapeExit, ofBIMinimizeOff, ofBIMaximizeOff]) then
      exit;

    if not Produto.postSemTestes then
      Exit;

    Produto.CommitaTransacao;

    vDadosIni.GravaAuditoria('PRO457', 'ALTERAR', 'SUCESSO', 'PRODUTOS',
      Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
      Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas);
  finally
    Produto.Cancel;
    Produto.CancelUpdates;
    Produto.CodBarra.Cancel;
    Produto.CodBarra.CancelUpdates;
    Produto.RollBackTransacao;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadProdutos.SpeedButtonComercioAbertoClick(Sender: TObject);
begin
  try
  
  	try
      if Assigned(TreeViewCat) then
        FreeAndNil(TreeViewCat);
    finally
      if not Assigned(TreeViewCat) then
      begin
        TreeViewCat := TTreeView.Create(Self);
        TreeViewCat.Parent := Panel94;
        TreeViewCat.Align := alClient;
        TreeViewCat.OnDblClick := TreeViewCatDblClick;
        TreeViewCat.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewCatDB) then
      	FreeAndNil(TreeViewCatDB);
    finally
    	if not Assigned(TreeViewCatDB) then
      begin
        TreeViewCatDB := TTreeView.Create(Self);
        TreeViewCatDB.Parent := Panel97;
        TreeViewCatDB.Align := alClient;
        TreeViewCatDB.OnDblClick := TreeViewCatDBDblClick;
        TreeViewCatDB.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewGradeEC) then
        FreeAndNil(TreeViewGradeEC);
    finally
      if not Assigned(TreeViewGradeEC) then
      begin
        TreeViewGradeEC := TTreeView.Create(Self);
        TreeViewGradeEC.Parent := Panel102;
        TreeViewGradeEC.Align := alClient;
        TreeViewGradeEC.OnDblClick := TreeViewGradeECDblClick;
        TreeViewGradeEC.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewGradeEC_DB) then
        FreeAndNil(TreeViewGradeEC_DB);
    finally
      if not Assigned(TreeViewGradeEC_DB) then
      begin
        TreeViewGradeEC_DB := TTreeView.Create(Self);
        TreeViewGradeEC_DB.Parent := Panel105;
        TreeViewGradeEC_DB.Align := alClient;
        TreeViewGradeEC_DB.OnDblClick := TreeViewGradeEC_DBDblClick;
        TreeViewGradeEC_DB.Items.Clear;
      end;
    end;

    try
      if Assigned(TreeViewGradeCA) then
      	FreeAndNil(TreeViewGradeCA);
    finally
    	if not Assigned(TreeViewGradeCA) then
      begin
      	TreeViewGradeCA := TTreeView.Create(Self);
    		TreeViewGradeCA.Parent := Panel85;
        TreeViewGradeCA.Align := alClient;
        TreeViewGradeCA.OnDblClick := TreeViewGradeCADblClick;
        TreeViewGradeCA.Items.Clear;
      end;
    end;
    
    try
    	if Assigned(TreeViewGradeCA_DB) then
      	FreeAndNil(TreeViewGradeCA_DB);
    finally
    	if not Assigned(TreeViewGradeCA_DB) then
      begin
        TreeViewGradeCA_DB := TTreeView.Create(Self);
        TreeViewGradeCA_DB.Parent := Panel90;
        TreeViewGradeCA_DB.Align := alClient;
        TreeViewGradeCA_DB.OnDblClick := TreeViewGradeCA_DBDblClick;
        TreeViewGradeCA_DB.Items.Clear;
      end;
    end;

    vDadosIni.removerGradeNaoUtilizadosEcomerce(
      Produto.dataset.FieldByName('GRUPO_PROD').AsInteger,
      Produto.dataset.FieldByName('COD_PROD').AsString
    );

    Produto.vImagensProd.alterarImagemNovaTab(Produto.dataSet, vDiretorioDestino);

    pnDadosCA.Tag := 99;
    if not Produto.Edit then
      exit;

    montarComponentes;

    PageControlCA.ActivePage := TabSheetCA1;

    pnDadosCA.Align  := alNone;
    pnDadosCA.Height := 348;
    pnDadosCA.Width  := 876;

    habilitarCamposComercioAberto(true);
		pnDadosCAEnter(Sender);
    btnAlterarDadosCAClick(Sender);

    if Produto.vCategorias.dataSet.ChangeCount > 0 then
    	Produto.vCategorias.Apply;
    Produto.CommitaTransacao;
  finally
  	pnDadosCA.Align := alClient;
    pnDadosCA.Tag := 0;

  	Produto.Cancel;
    Produto.CancelUpdates;
    Produto.CodBarra.Cancel;
    Produto.CodBarra.CancelUpdates;
    Produto.RollBackTransacao;
  end;
end;

procedure TFrmCadProdutos.SpeedButtonEnvComercioAbertoClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('PRO376', 'ALTERAR', '', 'PRODUTOS',
     Produto.dataSet.FieldByName('GRUPO_PROD').AsString + '-' +
     Produto.dataSet.FieldByName('COD_PROD').AsString, Produto.buscas, true) then
    Exit;

  if not Produto.ConfigAPIComercioAbertoAtiva then
  begin
  	Application.MessageBox('Configuração da API do Comércio Aberto não definidas, favor verificar!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    exit;
  end;

  RadioGroupOpcoesComercioAberto.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroupOpcoesComercioAberto.Name);
  if not vDadosIni.abreForm('Atualizar informações Comércio Aberto', pnDadosComercioAberto, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
  	exit;
end;

procedure TFrmCadProdutos.SpeedButtonDescTodosGrupoClick(Sender: TObject);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Desmarcando grupos');
    mkDescGr.text := '';
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadProdutos.SpeedButtonDescTodosPromocaoClick(Sender: TObject);
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Desmarcando promoções');
    mkPromocao.text := '';
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadProdutos.SpeedButtonDescTodosSubGrupoClick(Sender: TObject);
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Desmarcando subgrupos');
    mkDescSubGr.text := '';
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadProdutos.SpeedButtonDescTodosTabPrecoClick(Sender: TObject);
begin
	try
  	if DBLookupComboBox10.Text = 'LOCALIDADE' then
      vDadosIni.abreStatusProcessamento('', 'Desmarcando localidades')
    else if DBLookupComboBox10.Text = 'SETOR' then
      vDadosIni.abreStatusProcessamento('', 'Desmarcando setores')
    else if DBLookupComboBox10.Text = 'CIDADE' then
    	vDadosIni.abreStatusProcessamento('', 'Desmarcando cidades');
    mkTipo.text := '';
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadProdutos.SpeedButtonDesmarcarTodosEsterClick(Sender: TObject);
begin
  btUnSelectAllEtiqEsterClick(Sender);
end;

procedure TFrmCadProdutos.SpeedButtonDesmarcarTodosRapidaClick(Sender: TObject);
begin
  btUnSelectAllEtiqTerRapidaClick(Sender);
end;

procedure TFrmCadProdutos.SpeedButtonSelTodosEsterClick(Sender: TObject);
begin
  btSelectAllEtiqEsterClick(Sender);
end;

procedure TFrmCadProdutos.SpeedButtonSelTodosGrupoClick(Sender: TObject);
begin
	try
  	vDadosIni.abreStatusProcessamento('', 'Selecionando grupos');

    mkDescGr.text := '';

    Produto.vGrupo.storeRecNo;
    Produto.vGrupo.dataSet.DisableControls;
    Produto.vGrupo.dataSet.First;
    while not Produto.vGrupo.dataSet.Eof do
    begin
    	vDadosIni.abreStatusProcessamento('', 'Selecionando grupos ( ' + IntToStr(Produto.vGrupo.dataSet.RecNo) + '/' + IntToStr(Produto.vGrupo.dataSet.RecordCount) + ')');

      if mkDescGr.text <> '' then
        mkDescGr.text := copy(mkDescGr.text, 1, pos(')', mkDescGr.text) - 1)
          + ',' + Produto.vGrupo.dataSet.FieldByName('CODIGO_GRUP').asstring + ')'
      else
        mkDescGr.text := mkDescGr.text + '(' + Produto.vGrupo.dataSet.FieldByName('CODIGO_GRUP').asstring
          + ')';
      Produto.vGrupo.dataSet.Next;
    end;
  finally
  	Produto.vGrupo.restoreRecNo;
    Produto.vGrupo.dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadProdutos.SpeedButtonSelTodosPromocaoClick(Sender: TObject);
begin
  try
  	vDadosIni.abreStatusProcessamento('', 'Selecionando promoções');

    mkPromocao.text := '';

    Produto.vPromocao.storeRecNo;
    Produto.vPromocao.dataSet.DisableControls;
    Produto.vPromocao.dataSet.First;
    while not Produto.vPromocao.dataSet.Eof do
    begin
    	vDadosIni.abreStatusProcessamento('', 'Selecionando promoções ( ' + IntToStr(Produto.vPromocao.dataSet.RecNo) + '/' + IntToStr(Produto.vPromocao.dataSet.RecordCount) + ')');

      if mkPromocao.text <> '' then
        mkPromocao.text := copy(mkPromocao.text, 1, pos(')', mkPromocao.text) - 1)
          + ',' + Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').asstring + ')'
      else
        mkPromocao.text := mkPromocao.text + '(' + Produto.vPromocao.dataSet.FieldByName('COD_PROMOCAO').asstring
          + ')';
      Produto.vPromocao.dataSet.Next;
    end;
  finally
  	Produto.vPromocao.restoreRecNo;
    Produto.vPromocao.dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadProdutos.SpeedButtonSelTodosRapidaClick(Sender: TObject);
begin
  btSelectAllEtiqterRapidaClick(Sender);
end;

procedure TFrmCadProdutos.SpeedButtonSelTodosSubGrupoClick(Sender: TObject);
begin
	try
  	vDadosIni.abreStatusProcessamento('', 'Selecionando subgrupos');

    mkDescSubGr.text := '';

    Produto.vSubGrupo.storeRecNo;
    Produto.vSubGrupo.dataSet.DisableControls;
    Produto.vSubGrupo.dataSet.First;
    while not Produto.vSubGrupo.dataSet.Eof do
    begin
    	vDadosIni.abreStatusProcessamento('', 'Selecionando subgrupos ( ' + IntToStr(Produto.vSubGrupo.dataSet.RecNo) + '/' + IntToStr(Produto.vSubGrupo.dataSet.RecordCount) + ')');

      if mkDescSubGr.text <> '' then
        mkDescSubGr.text := copy(mkDescSubGr.text, 1, pos(')', mkDescSubGr.text) - 1)
          + ',' + Produto.vSubGrupo.dataSet.FieldByName('CODIGO_SUBGR').asstring + ')'
      else
        mkDescSubGr.text := mkDescSubGr.text + '(' + Produto.vSubGrupo.dataSet.FieldByName('CODIGO_SUBGR').asstring
          + ')';
      Produto.vSubGrupo.dataSet.Next;
    end;
  finally
  	Produto.vSubGrupo.restoreRecNo;
  	Produto.vSubGrupo.dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadProdutos.SpeedButtonSelTodosTabPrecoClick(Sender: TObject);
begin
  try
  	if DBLookupComboBox10.Text = 'LOCALIDADE' then
	  	vDadosIni.abreStatusProcessamento('', 'Selecionando localidades')
    else if DBLookupComboBox10.Text = 'SETOR' then
      vDadosIni.abreStatusProcessamento('', 'Selecionando setores')
    else if DBLookupComboBox10.Text = 'CIDADE' then
    	vDadosIni.abreStatusProcessamento('', 'Selecionando cidades');

    mkTipo.text := '';

    Produto.vRegiao.storeRecNo;
    Produto.vRegiao.dataSet.DisableControls;
    Produto.vRegiao.dataSet.First;
    while not Produto.vRegiao.dataSet.Eof do
    begin
    	if DBLookupComboBox10.Text = 'LOCALIDADE' then
  	    vDadosIni.abreStatusProcessamento('', 'Selecionando localidades ( ' + IntToStr(Produto.vRegiao.dataSet.RecNo) + '/' + IntToStr(Produto.vRegiao.dataSet.RecordCount) + ')')
      else if DBLookupComboBox10.Text = 'SETOR' then
	      vDadosIni.abreStatusProcessamento('', 'Selecionando setores ( ' + IntToStr(Produto.vRegiao.dataSet.RecNo) + '/' + IntToStr(Produto.vRegiao.dataSet.RecordCount) + ')')
      else if DBLookupComboBox10.Text = 'CIDADE' then
	    	vDadosIni.abreStatusProcessamento('', 'Selecionando cidades ( ' + IntToStr(Produto.vRegiao.dataSet.RecNo) + '/' + IntToStr(Produto.vRegiao.dataSet.RecordCount) + ')');

      if mkTipo.text <> '' then
        mkTipo.text := copy(mkTipo.text, 1, pos(')', mkTipo.text) - 1)
          + ',' + Produto.vRegiao.dataSet.FieldByName('CODIGO').asstring + ')'
      else
        mkTipo.text := mkTipo.text + '(' + Produto.vRegiao.dataSet.FieldByName('CODIGO').asstring
          + ')';
      Produto.vRegiao.dataSet.Next;
    end;
  finally
  	Produto.vRegiao.restoreRecNo;
    Produto.vRegiao.dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadProdutos.SpeedButtonSincronizarOutrasEmpECommerceClick(
  Sender: TObject);
begin
  inherited;
	try
  	Screen.Cursor := crHourGlass;
    FrmCadProdutos.Enabled := false;
    DBGrid1.Visible := false;
  	if not Produto.sincronizarProdutosEmLote then
      exit;
  finally
  	FrmCadProdutos.Enabled := true;
    DBGrid1.Visible := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.TabSheet4Show(Sender: TObject);
begin
  inherited;
  //  BitBtn8.Visible := false;
  //  BitBtn10.Visible := false;
end;

procedure TFrmCadProdutos.tabSheetCadastroSimplesExit(Sender: TObject);
begin
  if (ActiveControl <> BitBtn_4) and (ActiveControl <> BitBtn_5) and (ActiveControl <> BitBtn_6) then
    if ActiveControl.Parent <> TWinControl(Sender).Parent then
      if pos('TSS_', UpperCase(ActiveControl.Name)) = 0 then
      begin
        while True do
        begin
          if pageCadSimples.ActivePageIndex = pageCadSimples.PageCount - 1  then
            pageCadSimples.ActivePageIndex := 0
          else
            pageCadSimples.ActivePageIndex := pageCadSimples.ActivePageIndex +  1;
          if pageCadSimples.ActivePage.TabVisible then
            Break;
        end;
        THackWinControl(pageCadSimples.ActivePage).SelectFirst;
      end;
end;

function TFrmCadProdutos.testarDiretorioImagemProduto: boolean;
var
  vListaImagens: string;
begin
  Result := true;
  vListaImagens := vDadosIni.getConfSisStr('prod_cad_diretorio_padrao_imagens', Produto.buscas);
  if trim(vListaImagens) <> '' then
  begin
    if not DirectoryExists(trim(vListaImagens)) then
    begin
      Application.MessageBox(PChar('Diretório de imagens não encontrado: ' + #13 + #13 + vListaImagens), 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      Result := false;
      exit;
    end;
  end;
end;

procedure TFrmCadProdutos.TitleBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrLabelEmpresa.Caption := vDadosIni.vemp.vnomeEmpresa;
end;

procedure TFrmCadProdutos.TitleBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrLabelEmpresa5.Caption := vDadosIni.vemp.vnomeEmpresa;
end;

procedure TFrmCadProdutos.TreeViewCatDBDblClick(Sender: TObject);
begin
	Screen.Cursor := crHourGlass;
  vDadosIni.abreStatusProcessamento('Processando', 'Removendo categoria');
  try
    if TreeViewCatDB.Items.Count <= 0 then
      exit;

    if not Produto.vCategorias.deleteItemTreeView(Produto, TreeViewCatDB, TreeViewCatDB.Selected.Text) then
      exit;
  finally
  	vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.TreeViewCatDblClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  vDadosIni.abreStatusProcessamento('Processando', 'Adicionando categoria');
  try

    if TreeViewCat.Items.Count <= 0 then
      exit;

    if not Produto.vCategorias.addItemTreeView(Produto, TreeViewCat, TreeViewCatDB, TreeViewCat.Selected.Text) then
      exit;
  finally
  	vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.TreeViewGradeEC_DBDblClick(Sender: TObject);
begin
	Screen.Cursor := crHourGlass;
  vDadosIni.abreStatusProcessamento('Processando', 'Removendo grade');
  try
    if TreeViewGradeEC_DB.Items.Count <= 0 then
      exit;

    if not Produto.vProdutosEC.vProdutosECgrade.deleteItemTreeView('E',
      Produto, TreeViewGradeEC_DB, TreeViewGradeEC_DB.Selected.Text) then
      exit;
  finally
  	vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.TreeViewGradeCADblClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  vDadosIni.abreStatusProcessamento('Processando', 'Adicionando grade');
  try
    if TreeViewGradeCA.Items.Count <= 0 then
     exit;

    if not Produto.vProdutosEC.vProdutosECgrade.addItemTreeView('C',
      Produto, TreeViewGradeCA, TreeViewGradeCA_DB, TreeViewGradeCA.Selected.Text) then
      exit;
  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.TreeViewGradeCA_DBDblClick(Sender: TObject);
begin
	Screen.Cursor := crHourGlass;
  vDadosIni.abreStatusProcessamento('Processando', 'Removendo grade');
  try
    if TreeViewGradeCA_DB.Items.Count <= 0 then
      exit;

    if not Produto.vProdutosEC.vProdutosECgrade.deleteItemTreeView('C',
      Produto, TreeViewGradeCA_DB, TreeViewGradeCA_DB.Selected.Text) then
      exit;
  finally
  	vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.TreeViewGradeECDblClick(Sender: TObject);
begin
	Screen.Cursor := crHourGlass;
  vDadosIni.abreStatusProcessamento('Processando', 'Adicionando grade');
  try
    if TreeViewGradeEC.Items.Count <= 0 then
     exit;
                                                         
    if not Produto.vProdutosEC.vProdutosECgrade.addItemTreeView('E',
      Produto, TreeViewGradeEC, TreeViewGradeEC_DB, TreeViewGradeEC.Selected.Text) then
      exit;
  finally
  	vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.tsEtiTerRapidaEnter(Sender: TObject);
begin
  inherited;
  if Produto.vEtiTer = nil then
    Produto.vEtiTer := TEtiquetasTermicas.create;
end;

procedure TFrmCadProdutos.tsFichaComprasVendasEnter(Sender: TObject);
begin
  inherited;
//  DBGrid20.Visible := (vDadosIni.vEmp.vUsarProducao = 'S') or (vDadosIni.vEmp.vUsarProducao = 'D');
//  DBGrid21.Visible := (vDadosIni.vEmp.vUsarProducao = 'S') or (vDadosIni.vEmp.vUsarProducao = 'D');

  if (vDadosIni.vEmp.vUsarProducao = 'S') or (vDadosIni.vEmp.vUsarProducao = 'D') then
  begin
//    DBGrid4.Height := 89;
//    DBGrid20.Height := 89;
//    DBGrid32.Height := 89;
//    DBGrid4.Height := 134;
//    DBGrid32.Height := 133;
  end
  else
  begin
//    DBGrid4.Height := 134;
//    DBGrid32.Height := 133;
  end;

  dtmProdutos.dsBusca1.DataSet := Produto.buscas;
  dtmProdutos.dsBusca2.DataSet := Produto.CodBarra.buscas;
end;

procedure TFrmCadProdutos.tsFichaComprasVendasExit(Sender: TObject);
begin
  inherited;
  dtmProdutos.dsBusca1.DataSet := nil;
  dtmProdutos.dsBusca2.DataSet := nil;
end;


procedure TFrmCadProdutos.unidade_add(Sender: TObject);
var
	SiglaOld: string;
	Sigla: string;
  Descricao: string;
  Fracionado: Integer;
begin
	SiglaOld := UpperCase(trim(Produto.dataSet.FieldByName('UNIDADE').AsString));

  with Produto.vUnidadeProd do
    if not Auditor.Processo('PRO447', 'NOVA', '').Inserir.Permitido then
      Exit;

  EdSiglaUnidade.Enabled := True;
  EdSiglaUnidade.Text := '';
  EdDescricaoUnidade.Text := '';
  RadioGroupFracionadoUnidade.ItemIndex := 0;

  if not vDadosIni.abreForm('Cadastrar unidade', pnUnidade, [ofAutoSize, ofEscapeExit]) then
  	exit;

	Sigla := UpperCase(trim(EdSiglaUnidade.Text));
  Descricao := UpperCase(trim(EdDescricaoUnidade.Text));
  Fracionado := vDadosIni.IfThen(RadioGroupFracionadoUnidade.ItemIndex = 0, 1, 0);

  Produto.buscas.Close;
  Produto.buscas.SQL.Text := ' select * from unidades ' +
  	' where sigla = ' + QuotedStr(Sigla);
  Produto.buscas.Open;

  if not Produto.buscas.IsEmpty then
  begin
  	Application.MessageBox(Pchar('Unidade já existe: ' + #13 + #13 +
    	'UNIDADE' + #13 +
      'Sigla: ' + UpperCase(trim(Sigla)) + #13 +
      'Descrição: ' + UpperCase(trim(Descricao))), 'Atenção', MB_ICONWARNING + MB_OK);
    exit;
  end;

  Produto.vUnidadeProd.Insert;
  Produto.vUnidadeProd.fdata('sigla').Put(Sigla);
  Produto.vUnidadeProd.fdata('descricao').Put(Descricao);
  Produto.vUnidadeProd.fdata('fracionado').Put(Fracionado);
  if not Produto.vUnidadeProd.Post then
  	exit;

 	AtualizarListaUnidade(True, SiglaOld);
end;

procedure TFrmCadProdutos.unidade_add_conversao(Sender: TObject);
var
	SiglaOld: string;
	Sigla: string;
  Descricao: string;
  Fracionado: Integer;
begin
  SiglaOld := UpperCase(trim(Produto.dataSet.FieldByName('UNIDADE').AsString));

	with Produto.vUnidadeProd do
    if not Auditor.Processo('PRO447', 'NOVA', '').Inserir.Permitido then
      Exit;

  EdSiglaUnidade.Enabled := True;
  EdSiglaUnidade.Text := '';
  EdDescricaoUnidade.Text := '';
  RadioGroupFracionadoUnidade.ItemIndex := 0;

  if not vDadosIni.abreForm('Cadastrar unidade', pnUnidade, [ofAutoSize, ofEscapeExit]) then
  	exit;

	Sigla := UpperCase(trim(EdSiglaUnidade.Text));
  Descricao := UpperCase(trim(EdDescricaoUnidade.Text));
  Fracionado := vDadosIni.IfThen(RadioGroupFracionadoUnidade.ItemIndex = 0, 1, 0);

  Produto.buscas.Close;
  Produto.buscas.SQL.Text := ' select * from unidades ' +
  	' where upper(sigla) = ' + QuotedStr(UpperCase(trim(Sigla)));
  Produto.buscas.Open;

  if not Produto.buscas.IsEmpty then
  begin
  	Application.MessageBox(Pchar('Unidade já existe: ' + #13 + #13 +
    	'UNIDADE' + #13 +
      'Sigla: ' + UpperCase(trim(Sigla)) + #13 +
      'Descrição: ' + UpperCase(trim(Descricao))), 'Atenção', MB_ICONWARNING + MB_OK);
    exit;
  end;

  Produto.vUnidadeProd.Insert;
  Produto.vUnidadeProd.fdata('sigla').Put(UpperCase(trim(Sigla)));
  Produto.vUnidadeProd.fdata('descricao').Put(UpperCase(Descricao));
  Produto.vUnidadeProd.fdata('fracionado').Put(Fracionado);
  if not Produto.vUnidadeProd.Post then
  	exit;

 	AtualizarListaUnidade(True, SiglaOld);
end;

procedure TFrmCadProdutos.unidade_del(Sender: TObject);
var
	SiglaOld: string;
begin
	SiglaOld := UpperCase(trim(Produto.dataSet.FieldByName('UNIDADE').AsString));

	bt_modal_assume.Caption := 'Excluir';
  form_modal_configure([bt_modal_assume, bt_modal_voltar]);
  Produto.vUnidadeProd.dataSet.First;
  grid_modal.DataSource := Produto.vUnidadeProd._dataSourceOOP;

  if not vDadosIni.abreForm('Selecione a unidade que deseja excluir', pn_modal, opFormsDefCad) then
    Exit;

  with Produto.vUnidadeProd do
    if not Auditor.Processo('PRO449', 'EXCLUIR', fstr('sigla')).Excluir.Permitido then
      Exit;

  if not Produto.vUnidadeProd.Delete then
  	exit;

  AtualizarListaUnidade(True, SiglaOld);
end;

procedure TFrmCadProdutos.unidade_del_conversao(Sender: TObject);
var
	SiglaOld: string;
begin
	SiglaOld := UpperCase(trim(Produto.dataSet.FieldByName('UNIDADE').AsString));

	bt_modal_assume.Caption := 'Excluir';
  form_modal_configure([bt_modal_assume, bt_modal_voltar]);
  Produto.vUnidadeProd.dataSet.First;
  grid_modal.DataSource := Produto.vUnidadeProd._dataSourceOOP;

  if not vDadosIni.abreForm('Selecione a unidade que deseja excluir', pn_modal, opFormsDefCad) then
    Exit;

  with Produto.vUnidadeProd do
    if not Auditor.Processo('PRO449', 'EXCLUIR', fstr('sigla')).Excluir.Permitido then
      Exit;

  if not Produto.vUnidadeProd.Delete then
  	exit;

  AtualizarListaUnidade(True, UpperCase(trim(SiglaOld)));
end;

procedure TFrmCadProdutos.unidade_edit(Sender: TObject);
var
  SiglaOld: string;
	Sigla: string;
  Descricao: string;
  Fracionado: Integer;
begin
  bt_modal_assume.Caption := 'Selecionar';
  form_modal_configure([bt_modal_assume, bt_modal_voltar]);
  Produto.vUnidadeProd.dataSet.First;
  grid_modal.DataSource := Produto.vUnidadeProd._dataSourceOOP;

  if not vDadosIni.abreForm('Selecione a unidade que deseja alterar', pn_modal, opFormsDefCad) then
    Exit;

  with Produto.vUnidadeProd do
    if not Auditor.Processo('PRO447', fstr('descricao'), fstr('sigla')).Alterar.Permitido then
      Exit;

  EdSiglaUnidade.Enabled := False;
  EdSiglaUnidade.Text := Produto.vUnidadeProd.dataSet.FieldByName('sigla').AsString;
  EdDescricaoUnidade.Text := Produto.vUnidadeProd.dataSet.FieldByName('descricao').AsString;
  RadioGroupFracionadoUnidade.ItemIndex :=
  	vDadosIni.IfThen(Produto.vUnidadeProd.dataSet.FieldByName('fracionado').AsInteger = 1,
    	0, 1);

  if not vDadosIni.abreForm('Alterar unidade', pnUnidade, [ofAutoSize, ofEscapeExit]) then
  	exit;

	Sigla := trim(EdSiglaUnidade.Text);
  Descricao := trim(EdDescricaoUnidade.Text);
  Fracionado := vDadosIni.IfThen(RadioGroupFracionadoUnidade.ItemIndex = 0, 1, 0);

  if not Produto.vUnidadeProd.Edit then
    Exit;

  Produto.vUnidadeProd.fdata('descricao').Put(Descricao);
  Produto.vUnidadeProd.fdata('fracionado').Put(Fracionado);
  if not Produto.vUnidadeProd.Post then
  	exit;
end;

procedure TFrmCadProdutos.unidade_edit_conversao(Sender: TObject);
var
  Sigla: string;
  Descricao: string;
  Fracionado: Integer;
begin
  bt_modal_assume.Caption := 'Selecionar';
  form_modal_configure([bt_modal_assume, bt_modal_voltar]);
  Produto.vUnidadeProd.dataSet.First;
  grid_modal.DataSource := Produto.vUnidadeProd._dataSourceOOP;

  if not vDadosIni.abreForm('Selecione a unidade que deseja alterar', pn_modal, opFormsDefCad) then
    Exit;

  with Produto.vUnidadeProd do
    if not Auditor.Processo('PRO447', fstr('descricao'), fstr('sigla')).Alterar.Permitido then
      Exit;

  EdSiglaUnidade.Enabled := False;
  EdSiglaUnidade.Text := Produto.vUnidadeProd.dataSet.FieldByName('sigla').AsString;
  EdDescricaoUnidade.Text := Produto.vUnidadeProd.dataSet.FieldByName('descricao').AsString;
  RadioGroupFracionadoUnidade.ItemIndex :=
  	vDadosIni.IfThen(Produto.vUnidadeProd.dataSet.FieldByName('fracionado').AsInteger = 1,
    	0, 1);

  if not vDadosIni.abreForm('Alterar unidade', pnUnidade, [ofAutoSize, ofEscapeExit]) then
  	exit;

	Sigla := trim(EdSiglaUnidade.Text);
  Descricao := trim(EdDescricaoUnidade.Text);
  Fracionado := vDadosIni.IfThen(RadioGroupFracionadoUnidade.ItemIndex = 0, 1, 0);

  if not Produto.vUnidadeProd.Edit then
    Exit;

  Produto.vUnidadeProd.fdata('descricao').Put(Descricao);
  Produto.vUnidadeProd.fdata('fracionado').Put(Fracionado);
  if not Produto.vUnidadeProd.Post then
  	exit;
end;

procedure TFrmCadProdutos.verificacampos;
begin
  vdadosini.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO172', 'LIBERAR CAMPO', '', 'PRODUTOS', '', produto.buscas, true)
    then
    DBLookupComboBox3.Enabled := false
  else
    DBLookupComboBox3.Enabled := true;
  {
  vdadosini.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO173', 'LIBERAR CAMPO', '', 'PRODUTOS', '', produto.buscas, true)
    then
  begin
    dbedit35.Enabled := false;
    dbedit18.Enabled := false;
    dbedit56.Enabled := false;
    dbedit57.Enabled := false;
  end
  else
  begin
    dbedit35.Enabled := true;
    dbedit18.Enabled := True;
    dbedit56.Enabled := true;
    dbedit57.Enabled := true;
  end;
  }
  vdadosini.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('PRO174', 'LIBERAR CAMPO', '', 'PRODUTOS', '', produto.buscas, true)
    then
  begin
    DBComboBox16.Visible := false;
    label173.Visible := false;
  end
  else
  begin
    DBComboBox16.Visible := true;
    label173.Visible := true;
  end;
end;

procedure TFrmCadProdutos.verificarAbaEcommerceComercioAberto(pTipo: string);
var
  vexistegrade: boolean;
begin
  vexistegrade := Produto.vProdutosEC.existeGrade(Produto.dataSet);
  if pTipo = 'E' then
  begin
    if PageControlEC.ActivePage = TabSheetEC1 then
    begin
      sbVoltarEC.Visible := false;
      sbAvancarEC.Visible := false;

      sbAvancarEC.Visible := true;

      LbPagEC.Caption := vDadosIni.IfThen(
    		(vexistegrade) or (vDadosIni.vEcommerce.vControleEstManualECommerce), '1/4', '1/3');
    end
    else if PageControlEC.ActivePage = TabSheetEC2 then
    begin
      sbVoltarEC.Visible := false;
      sbAvancarEC.Visible := false;

      sbAvancarEC.Visible := true;
      sbVoltarEC.Visible := true;

      LbPagEC.Caption := vDadosIni.IfThen(
        (vexistegrade) or (vDadosIni.vEcommerce.vControleEstManualECommerce), '2/4', '2/3');
    end
    else if PageControlEC.ActivePage = TabSheetEC3 then
    begin
      sbVoltarEC.Visible := false;
      sbAvancarEC.Visible := false;

      sbVoltarEC.Visible := true;
      sbAvancarEC.Visible := vDadosIni.IfThen(
        (vexistegrade) or (vDadosIni.vEcommerce.vControleEstManualECommerce), true, false);

      LbPagEC.Caption := vDadosIni.IfThen(
        (vexistegrade) or (vDadosIni.vEcommerce.vControleEstManualECommerce), '3/4', '3/3');
    end
    else if PageControlEC.ActivePage = TabSheetEC4 then
    begin
      sbVoltarEC.Visible := false;
      sbAvancarEC.Visible := false;

      sbVoltarEC.Visible := true;

      LbPagEC.Caption := '4/4';
    end;
  end
  else if pTipo = 'C' then
  begin
    if PageControlCA.ActivePage = TabSheetCA1 then
    begin
      sbVoltarCA.Visible := false;
      sbAvancarCA.Visible := false;

      sbAvancarCA.Visible := true;
      LbPagCA.Caption := vDadosIni.IfThen(
        (vexistegrade) and (vDadosIni.vComercioAberto.vControleEstManualComercioAberto), '1/3', '1/2');
    end
    else if PageControlCA.ActivePage = TabSheetCA2 then
    begin
      sbVoltarCA.Visible := false;
      sbAvancarCA.Visible := false;

      sbAvancarCA.Visible := vDadosIni.IfThen(
        (vexistegrade) and (vDadosIni.vComercioAberto.vControleEstManualComercioAberto), true, false);
      sbVoltarCA.Visible := true;
      LbPagCA.Caption := vDadosIni.IfThen(
        (vexistegrade) and (vDadosIni.vComercioAberto.vControleEstManualComercioAberto), '2/3', '2/2');
    end
    else if PageControlCA.ActivePage = TabSheetCA3 then
    begin
      sbVoltarCA.Visible := false;
      sbAvancarCA.Visible := false;

      sbVoltarCA.Visible := true;
      sbAvancarCA.Visible := false;
      LbPagCA.Caption := '3/3';
		end;
  end;
end;

procedure TFrmCadProdutos.verificarBotaoLixeira;
begin
  if Produto.StatusLixeira then
  begin
    SpeedButton25.Visible := true;
    btLixeiraCheia.Visible := true;
  end
  else
  begin
    SpeedButton25.Visible := false;
    btLixeiraCheia.Visible := false;
  end;
end;

procedure TFrmCadProdutos.Verificarreplicaointernapendente1Click(
  Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    Produto.VerificacaoGeralReplicacaoInternaProdutos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.VoltarClick(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TFrmCadProdutos.SpeedBSelTodosClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Produto._marcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadProdutos.SpeedBCESTClick(Sender: TObject);
var
  cest_search: Tcest_search;
  Cest: string;
begin
  inherited;
  if vDadosIni.vProduto.AHandle = 0 then
    CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
  @cest_search := GetProcAddress(vDadosIni.vProduto.AHandle, 'cest_search');
  if Assigned(cest_search) then
  begin
    Cest := cest_search(Produto.fstr('nbm'));
    if (Trim(Cest) <> '') then
      EdCEST.Text := Cest;
  end;
end;

procedure TFrmCadProdutos.SpeedBDesmarcarTodosClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Visible := false;
    Produto._desmarcarTodos;

  finally
    Screen.Cursor := crDefault;
    DBGrid1.Visible := true;
  end;
end;

procedure TFrmCadProdutos.SpeedBPerfilClick(Sender: TObject);
begin
  if not vDadosIni.PesqPros('PRO013', 'ABRIR', '', 'PRODUTOS', '', Produto.buscas, true) then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PERFIL_PRODUTOS');
    if vDadosIni.vPesquisa <> '' then
    begin
    	EdCodPerfilProd.AsValue := StrToInt(vDadosIni.vPesquisa);
      if not Produto.buscasPerfilProduto(EdCodPerfilProd.AsInteger) then
      begin
        Application.MessageBox('Perfil não encontrado ou se encontra na lixeira', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        if (Self.Enabled) and (Self.Visible) and (EdCodPerfilProd.CanFocus) then
          EdCodPerfilProd.SetFocus;
        exit;
      end;
      atribuirDadosPerfil;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadProdutos.bt_consulta_cest2Click(Sender: TObject);
var
  cest_search: Tcest_search;
  Cest: string;
begin
  inherited;
  if vDadosIni.vProduto.AHandle = 0 then
    CarregaPacote('pkProdutos', vDadosIni.vProduto.AHandle);
  @cest_search := GetProcAddress(vDadosIni.vProduto.AHandle, 'cest_search');
  if Assigned(cest_search) then
  begin
    Cest := cest_search(Produto.fstr('nbm'));
    if (Trim(Cest) <> '') and (Produto.dataSet.State in [dsEdit, dsInsert]) then
      Produto.dataSet.FieldByName('cest').AsString := Cest;
  end;
end;

procedure TFrmCadProdutos.bt_outros_prodClick(Sender: TObject);
begin
  inherited;
  pmOutros.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFrmCadProdutos.sp_dados_nfe_dados_ult_entradaClick(Sender: TObject);
begin
  inherited;
  Produto.alterar_dados_ult_entrada;
end;

procedure TFrmCadProdutos.tabOpfiscalChange(Sender: TObject);
begin
  inherited;
  dataSetOpf := Produto.GetOperacoesFiscaisProduto(TOpfProduto(tabOpfiscal.TabIndex));

  gridOpFiscal.DataSource := dataSetOpf._dataSourceOOP;

  gridOpFiscal.Visible := not dataSetOpf.IsEmpty;

  pnOpfiscal.Caption := 'Sem Operação fiscal para esse NCM';

  pnOpfiscalBtns.Visible := True;
end;

initialization
  RegisterClass(TFrmCadProdutos);
finalization
  UnRegisterClass(TFrmCadProdutos);

end.
