unit uCadNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, ExtCtrls, Menus, ComCtrls, Buttons, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls, uClassesNotasFiscais, ImgList, uEditHw,
  Tabs, DB, DBClient, EnterantHw, AppEvnts, QRCtrls, grimgctrl, QuickRpt, uDataSet_OOP,
  CheckLst, IBDatabase, UFrameIbsCbs, ComboboxEntityPickerFrameUnit;

const
  Conf: string = 'Software\Hw\Configuracao\Telas\';

type
  TToggleMultSelectGridState = (tmOff, tmOn); 

  THackWinControl = class(TWinControl);
  TShowForm = procedure (Amodal: Boolean);
  TfrmCadNF = class(TfrmCadPadraoM)
    GroupBox4: TGroupBox;
    ckProdServ: TCheckBox;
    ckVeic: TCheckBox;
    ckOutras: TCheckBox;
    ckDespesas: TCheckBox;
    RadioGroup1: TRadioGroup;
    tsNotaFiscal: TTabSheet;
    groupItensNota: TGroupBox;
    groupTotais: TGroupBox;
    lbtbase_icm2: TLabel;
    lbtvalor_icm2: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    lbtvalor_serv2: TLabel;
    lbtvalor_desp_pf2: TLabel;
    Label53: TLabel;
    edtbase_icm2: TDBEdit;
    edtvalor_icm2: TDBEdit;
    edtbase_icmsub2: TDBEdit;
    edtvalor_icmsub2: TDBEdit;
    edtvalor_prod2: TDBEdit;
    edtvalor_serv2: TDBEdit;
    edtvalor_total2: TDBEdit;
    edtvalor_frete2: TDBEdit;
    edtvalor_seguro2: TDBEdit;
    edtvalor_out_desp2: TDBEdit;
    edtvalor_ipi2: TDBEdit;
    edtvalor_desc2: TDBEdit;
    edtvalor_desp_pf2: TDBEdit;
    Panel4: TPanel;
    pgContDadosNF: TPageControl;
    tsDadosNF: TTabSheet;
    tsFaturas: TTabSheet;
    tsObs: TTabSheet;
    ListBox1: TListBox;
    Label61: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    RadioGroup2: TRadioGroup;
    GroupBox5: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    ImageList1: TImageList;
    pmTranspo: TPopupMenu;
    ValidarTransportes1: TMenuItem;
    pmCabecalho: TPopupMenu;
    ValidarCabealho1: TMenuItem;
    pmRodape: TPopupMenu;
    ValidarRodap1: TMenuItem;
    tsVeiculos: TTabSheet;
    btSaida: TBitBtn;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    PageControl2: TPageControl;
    tsDadosNfVeic: TTabSheet;
    tsDadoEntVeic: TTabSheet;
    pnDetalheVeiculos: TPanel;
    pnDetalhesItemVeiculo: TPanel;
    Label97: TLabel;
    Label100: TLabel;
    Label105: TLabel;
    Label114: TLabel;
    Label178: TLabel;
    Label186: TLabel;
    Label187: TLabel;
    Label188: TLabel;
    Label189: TLabel;
    Label190: TLabel;
    Label191: TLabel;
    Label192: TLabel;
    Label193: TLabel;
    Label194: TLabel;
    Label195: TLabel;
    Label196: TLabel;
    Label197: TLabel;
    Label198: TLabel;
    Label199: TLabel;
    Label200: TLabel;
    Label201: TLabel;
    Label205: TLabel;
    Label208: TLabel;
    Label209: TLabel;
    DBEdit99: TDBEdit;
    DBEdit103: TDBEdit;
    DBEdit104: TDBEdit;
    DBEdit106: TDBEdit;
    DBEdit108: TDBEdit;
    DBEdit109: TDBEdit;
    DBEdit110: TDBEdit;
    DBEdit111: TDBEdit;
    DBEdit112: TDBEdit;
    DBEdit113: TDBEdit;
    DBEdit114: TDBEdit;
    DBEdit115: TDBEdit;
    DBEdit116: TDBEdit;
    DBEdit117: TDBEdit;
    DBEdit118: TDBEdit;
    DBEdit119: TDBEdit;
    DBEdit120: TDBEdit;
    DBEdit121: TDBEdit;
    DBEdit125: TDBEdit;
    DBEdit128: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit67: TDBEdit;
    DBEdit101: TDBEdit;
    Panel19: TPanel;
    pnDetalhesItemVeiculoSaida: TPanel;
    Label204: TLabel;
    Label212: TLabel;
    DBEdit124: TDBEdit;
    DBEdit132: TDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup5: TDBRadioGroup;
    btSalvarDetalhesVeiculo: TBitBtn;
    BitBtn39: TBitBtn;
    Label106: TLabel;
    Label176: TLabel;
    DBComboBox6: TDBComboBox;
    btAlterarDetalhesVeiculos: TBitBtn;
    tsOutras: TTabSheet;
    tsProdutosServicos: TTabSheet;
    PageControl4: TPageControl;
    TabSheet4: TTabSheet;
    pgFechamento: TPageControl;
    tsModificarFaturas: TTabSheet;
    pnModFaturas: TPanel;
    Panel6: TPanel;
    GroupBox7: TGroupBox;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    edLocalPag: TEdit;
    edObsBol1: TEdit;
    edObsBol2: TEdit;
    GroupBox9: TGroupBox;
    ListBox2: TListBox;
    BitBtn7: TBitBtn;
    BitBtn12: TBitBtn;
    Panel5: TPanel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    edDocumento: TEdit;
    edVencimentoBol: TMaskEdit;
    BitBtn31: TBitBtn;
    BitBtn33: TBitBtn;
    TabSheet5: TTabSheet;
    pgFechEntrada: TPageControl;
    tsEntGrade: TTabSheet;
    Panel12: TPanel;
    lbQtdeInformada: TLabel;
    lbQtdePendente: TLabel;
    GroupBox22: TGroupBox;
    DBGrid8: TDBGrid;
    GroupBox23: TGroupBox;
    DBGrid9: TDBGrid;
    edQuantGradeCompra: TEditHw;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    GroupBox24: TGroupBox;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    tsMargem: TTabSheet;
    Panel13: TPanel;
    Panel15: TPanel;
    Label104: TLabel;
    DBText6: TDBText;
    Bevel2: TBevel;
    DBText7: TDBText;
    DBText8: TDBText;
    Bevel3: TBevel;
    Bevel4: TBevel;
    DBText9: TDBText;
    DBText10: TDBText;
    GroupBox25: TGroupBox;
    DBGrid10: TDBGrid;
    GroupBox26: TGroupBox;
    DBGrid11: TDBGrid;
    GroupBox31: TGroupBox;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    edVEMK: TEditHw;
    edVOMK: TEditHw;
    edVEMM: TEditHw;
    edVOMM: TEditHw;
    GroupBox32: TGroupBox;
    Label161: TLabel;
    Label162: TLabel;
    Label163: TLabel;
    Label164: TLabel;
    edAEMK: TEditHw;
    edAOMK: TEditHw;
    edAEMM: TEditHw;
    edAOMM: TEditHw;
    GroupBox33: TGroupBox;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    BitBtn28: TBitBtn;
    GroupBox27: TGroupBox;
    Label165: TLabel;
    Label166: TLabel;
    edMarkUpV: TEditHw;
    edPrecoV: TEditHw;
    GroupBox28: TGroupBox;
    Label102: TLabel;
    Label103: TLabel;
    edMarkUpA: TEditHw;
    edPrecoA: TEditHw;
    btSalvaMargemObtida: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn32: TBitBtn;
    tsCalculoImposto: TTabSheet;
    pnCalculuImposto: TPanel;
    Label83: TLabel;
    Panel11: TPanel;
    GroupBox19: TGroupBox;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    BitBtn23: TBitBtn;
    btContinuarCalculo: TBitBtn;
    btResumoNF: TBitBtn;
    tsDadosProdutosServicos: TTabSheet;
    pnDescontos: TPanel;
    GroupBox6: TGroupBox;
    Label206: TLabel;
    Label207: TLabel;
    DBEdit102: TDBEdit;
    DBEdit126: TDBEdit;
    Panel23: TPanel;
    Label237: TLabel;
    DBEdit147: TDBEdit;
    GroupBox10: TGroupBox;
    Label214: TLabel;
    Label218: TLabel;
    Label234: TLabel;
    edSomaBrutaProdutos: TEditHw;
    edSomaProdNaoPermDesc: TEditHw;
    edSomaProdPermDesc: TEditHw;
    GroupBox34: TGroupBox;
    Label235: TLabel;
    edSomaBrutaServicos: TEditHw;
    Panel16: TPanel;
    BitBtn10: TBitBtn;
    tsGlobal: TTabSheet;
    tsPedVenda: TTabSheet;
    tsPedCompra: TTabSheet;
    grupoPedCompra: TGroupBox;
    GroupBox15: TGroupBox;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    edDataIniPC: TMaskEdit;
    edDataFimPC: TMaskEdit;
    BitBtn20: TBitBtn;
    GroupBox16: TGroupBox;
    Label130: TLabel;
    DBGrid4: TDBGrid;
    GroupBox17: TGroupBox;
    DBGrid5: TDBGrid;
    BitBtn21: TBitBtn;
    Panel14: TPanel;
    BitBtn22: TBitBtn;
    tsComando: TTabSheet;
    grupoComando: TGroupBox;
    GroupBox14: TGroupBox;
    Label85: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label113: TLabel;
    SpeedButton17: TSpeedButton;
    edDataIniComando: TMaskEdit;
    edDataFimComando: TMaskEdit;
    BitBtn35: TBitBtn;
    edComandoChassi: TEdit;
    edClienteComando: TEditHw;
    edNomeClienteComando: TEdit;
    GroupBox18: TGroupBox;
    Label115: TLabel;
    DBGrid6: TDBGrid;
    GroupBox20: TGroupBox;
    Label116: TLabel;
    Label136: TLabel;
    Label138: TLabel;
    Label137: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    Label167: TLabel;
    Label168: TLabel;
    Label169: TLabel;
    Label170: TLabel;
    Label171: TLabel;
    Label172: TLabel;
    Label173: TLabel;
    Label174: TLabel;
    Label175: TLabel;
    DBEdit68: TDBEdit;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    DBEdit71: TDBEdit;
    DBEdit72: TDBEdit;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    DBEdit75: TDBEdit;
    DBEdit76: TDBEdit;
    DBEdit77: TDBEdit;
    DBEdit85: TDBEdit;
    DBEdit86: TDBEdit;
    DBEdit87: TDBEdit;
    DBEdit88: TDBEdit;
    DBEdit89: TDBEdit;
    DBEdit90: TDBEdit;
    DBEdit91: TDBEdit;
    DBEdit92: TDBEdit;
    DBEdit93: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    DBEdit51: TDBEdit;
    BitBtn36: TBitBtn;
    BitBtn37: TBitBtn;
    Panel20: TPanel;
    tsTransito: TTabSheet;
    grupoTransito: TGroupBox;
    GroupBox21: TGroupBox;
    Label215: TLabel;
    Label216: TLabel;
    Label217: TLabel;
    SpeedButton18: TSpeedButton;
    edDataIniTrans: TMaskEdit;
    edDataFimTrans: TMaskEdit;
    BitBtn42: TBitBtn;
    edNumNFChassiTrans: TEdit;
    GroupBox29: TGroupBox;
    DBGrid7: TDBGrid;
    GroupBox30: TGroupBox;
    Label219: TLabel;
    Label220: TLabel;
    Label221: TLabel;
    Label222: TLabel;
    Label223: TLabel;
    Label224: TLabel;
    Label225: TLabel;
    Label226: TLabel;
    Label227: TLabel;
    Label228: TLabel;
    Label229: TLabel;
    Label230: TLabel;
    Label231: TLabel;
    Label232: TLabel;
    Label233: TLabel;
    Label236: TLabel;
    DBEdit130: TDBEdit;
    DBEdit131: TDBEdit;
    DBEdit133: TDBEdit;
    DBEdit134: TDBEdit;
    DBEdit135: TDBEdit;
    DBEdit136: TDBEdit;
    DBEdit137: TDBEdit;
    DBEdit138: TDBEdit;
    DBEdit139: TDBEdit;
    DBEdit140: TDBEdit;
    DBEdit141: TDBEdit;
    DBEdit142: TDBEdit;
    DBEdit143: TDBEdit;
    DBEdit144: TDBEdit;
    DBEdit145: TDBEdit;
    DBEdit146: TDBEdit;
    DBEdit149: TDBEdit;
    BitBtn43: TBitBtn;
    BitBtn44: TBitBtn;
    pnItensOutrasNF: TPanel;
    pnConsultaItensOutrasNF: TPanel;
    DBGrid12: TDBGrid;
    Panel26: TPanel;
    Panel24: TPanel;
    btRemoverItemOutrasNf: TBitBtn;
    pnCadastroItensOutrasNf: TPanel;
    Panel25: TPanel;
    btCancelarItemOutrasNf: TBitBtn;
    btSalvarItemOutrasNF: TBitBtn;
    tsProdutosDetalhado: TTabSheet;
    pnItesProdutosDetalhado: TPanel;
    PageControl5: TPageControl;
    tsDadosAdicionais: TTabSheet;
    pnParametros: TPanel;
    pnConsultaParametros: TPanel;
    Panel50: TPanel;
    DBGrid14: TDBGrid;
    GroupBox35: TGroupBox;
    DBMemo2: TDBMemo;
    Panel51: TPanel;
    SpeedButton20: TSpeedButton;
    BitBtn48: TBitBtn;
    BitBtn45: TBitBtn;
    BitBtn46: TBitBtn;
    BitBtn47: TBitBtn;
    pnCadastroParametros: TPanel;
    Panel53: TPanel;
    Label280: TLabel;
    Label308: TLabel;
    DBEdit148: TDBEdit;
    DBMemo3: TDBMemo;
    Panel54: TPanel;
    btSalvarParametros: TBitBtn;
    btCancelarParametros: TBitBtn;
    pnConsultaItensProdDetalhado: TPanel;
    DBGrid13: TDBGrid;
    Panel29: TPanel;
    Panel30: TPanel;
    btIncluirItemProdDetalhado: TBitBtn;
    btAlterarItemProdDetalhado: TBitBtn;
    btRemoverItemProdDetalhado: TBitBtn;
    pnCadastroItensProdDetalhado: TPanel;
    Panel32: TPanel;
    btCancelarItemProdServDetalhado: TBitBtn;
    btSalvarItemProdServDetalhado: TBitBtn;
    tsDadosECF: TTabSheet;
    PageControl6: TPageControl;
    tsECFEntrada: TTabSheet;
    tsECFSaida: TTabSheet;
    pnECFEntrada: TPanel;
    lbQtdeInfEcfEnt: TLabel;
    lbQtdePendEcfEnt: TLabel;
    Panel35: TPanel;
    Label282: TLabel;
    Label283: TLabel;
    Label284: TLabel;
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
    DBLookupComboBox6: TDBLookupComboBox;
    edNumSerieEcf: TEdit;
    Panel37: TPanel;
    btSalvarDetalhesECF: TBitBtn;
    BitBtn14: TBitBtn;
    btCancelarDetalhesECF: TBitBtn;
    GroupBox36: TGroupBox;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    DBText15: TDBText;
    pnECFSaida: TPanel;
    lbQtdeInfEcfSaida: TLabel;
    lbQtdePendECFSaida: TLabel;
    Panel40: TPanel;
    Panel41: TPanel;
    btEscolherECFSaida: TBitBtn;
    BitBtn17: TBitBtn;
    btCancelarECFSaida: TBitBtn;
    GroupBox37: TGroupBox;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText18: TDBText;
    DBText19: TDBText;
    DBText20: TDBText;
    DBGrid15: TDBGrid;
    DBText21: TDBText;
    Label295: TLabel;
    tsImpressao: TTabSheet;
    pnImpressao: TPanel;
    GroupBox38: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    Panel36: TPanel;
    btImprimir: TBitBtn;
    BitBtn19: TBitBtn;
    pnEtiquetas: TPanel;
    Panel43: TPanel;
    BitBtn13: TBitBtn;
    edMora: TEditHw;
    edMulta: TEditHw;
    DBText22: TDBText;
    DBText23: TDBText;
    DBText24: TDBText;
    Label297: TLabel;
    edQtdeEtiquetas: TEditHw;
    tsCSTTransito: TTabSheet;
    pnCSTTransito: TPanel;
    Panel44: TPanel;
    Panel46: TPanel;
    btOkCSTTransito: TBitBtn;
    BitBtn38: TBitBtn;
    DBText25: TDBText;
    DBText26: TDBText;
    DBText27: TDBText;
    DBText28: TDBText;
    edCSTTransito: TEdit;
    Label298: TLabel;
    DBText29: TDBText;
    Label299: TLabel;
    tsFaturasEntrada: TTabSheet;
    pnFaturaEntrada: TPanel;
    Panel42: TPanel;
    Panel45: TPanel;
    BitBtn29: TBitBtn;
    BitBtn34: TBitBtn;
    Label300: TLabel;
    DBText30: TDBText;
    GroupBox39: TGroupBox;
    GroupBox40: TGroupBox;
    edFreteCondPag: TEditHw;
    edDataFrete: TMaskEdit;
    ckLancarFrete: TCheckBox;
    Label301: TLabel;
    ListBox3: TListBox;
    btAlterarFaturaEntrada: TBitBtn;
    GroupBox41: TGroupBox;
    DBLookupComboBox7: TDBLookupComboBox;
    Panel47: TPanel;
    btSalvarFaturaEntrada: TBitBtn;
    edDocFaturaEntrada: TEdit;
    edValorFaturaEntrada: TEditHw;
    edVencimentoFaturaEntrada: TMaskEdit;
    btGerarFaturaEntrada: TBitBtn;
    tsSpedFiscal: TTabSheet;
    pnSpedFiscal: TPanel;
    btOutrosIntFisco: TBitBtn;
    pgSped: TPageControl;
    tsSpedDadosAdicionais: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    GroupBox42: TGroupBox;
    Label304: TLabel;
    Label305: TLabel;
    Label306: TLabel;
    Label307: TLabel;
    DBEdit151: TDBEdit;
    DBEdit152: TDBEdit;
    DBEdit164: TDBEdit;
    DBEdit165: TDBEdit;
    tsGenero: TTabSheet;
    GroupBox44: TGroupBox;
    DBMemo6: TDBMemo;
    DBMemo7: TDBMemo;
    Label309: TLabel;
    tsC111: TTabSheet;
    tsC112: TTabSheet;
    pnC111: TPanel;
    pnC111Cadastro: TPanel;
    Label310: TLabel;
    DBEdit150: TDBEdit;
    Label311: TLabel;
    DBComboBox7: TDBComboBox;
    Panel55: TPanel;
    btSalvarC111: TBitBtn;
    btCancelarC111: TBitBtn;
    pnC111Consulta: TPanel;
    GroupBox45: TGroupBox;
    DBGrid17: TDBGrid;
    Memo1: TMemo;
    Panel56: TPanel;
    SpeedButton22: TSpeedButton;
    btNovoC111: TBitBtn;
    btAlterarC111: TBitBtn;
    btRemoverC111: TBitBtn;
    pnC112: TPanel;
    pnC112Cadastro: TPanel;
    Panel59: TPanel;
    btSalvarC112: TBitBtn;
    btCancelarC112: TBitBtn;
    pnC112Consulta: TPanel;
    GroupBox46: TGroupBox;
    DBGrid18: TDBGrid;
    Panel61: TPanel;
    SpeedButton27: TSpeedButton;
    btNovoC112: TBitBtn;
    btAlterarC112: TBitBtn;
    btRemoverC112: TBitBtn;
    Label314: TLabel;
    Label315: TLabel;
    DBEdit168: TDBEdit;
    Label316: TLabel;
    DBEdit169: TDBEdit;
    Label317: TLabel;
    DBEdit170: TDBEdit;
    Label318: TLabel;
    DBEdit171: TDBEdit;
    DBComboBox9: TDBComboBox;
    Label319: TLabel;
    DBEdit167: TDBEdit;
    Label320: TLabel;
    DBEdit172: TDBEdit;
    Label312: TLabel;
    tsC113: TTabSheet;
    tsC114: TTabSheet;
    pnC114: TPanel;
    pnC114Cadastro: TPanel;
    Label324: TLabel;
    Label326: TLabel;
    Label328: TLabel;
    Label329: TLabel;
    Label330: TLabel;
    Panel62: TPanel;
    btSalvarC114: TBitBtn;
    btCancelarC114: TBitBtn;
    DBEdit173: TDBEdit;
    DBEdit175: TDBEdit;
    DBComboBox8: TDBComboBox;
    DBEdit176: TDBEdit;
    DBEdit177: TDBEdit;
    pnC114Consulta: TPanel;
    GroupBox48: TGroupBox;
    DBGrid20: TDBGrid;
    Panel65: TPanel;
    SpeedButton31: TSpeedButton;
    btNovoC114: TBitBtn;
    btAlterarC114: TBitBtn;
    btRemoverC114: TBitBtn;
    tsFilhosC110: TTabSheet;
    PageControl8: TPageControl;
    tsC120: TTabSheet;
    Panel57: TPanel;
    pnC120: TPanel;
    pnC120Cadastro: TPanel;
    Label325: TLabel;
    Label327: TLabel;
    Label331: TLabel;
    Label332: TLabel;
    Label333: TLabel;
    Panel66: TPanel;
    btSalvarC120: TBitBtn;
    btCancelarC120: TBitBtn;
    DBEdit166: TDBEdit;
    DBEdit174: TDBEdit;
    DBComboBox10: TDBComboBox;
    DBEdit178: TDBEdit;
    DBEdit179: TDBEdit;
    pnC120Consulta: TPanel;
    GroupBox49: TGroupBox;
    DBGrid21: TDBGrid;
    Panel68: TPanel;
    btNovoC120: TBitBtn;
    btAlterarC120: TBitBtn;
    btRemoverC120: TBitBtn;
    tsNfe: TTabSheet;
    pnGenero: TPanel;
    ListBox4: TListBox;
    Label338: TLabel;
    BitBtn53: TBitBtn;
    SpeedButton33: TSpeedButton;
    pnNFe: TPanel;
    GroupBox50: TGroupBox;
    DBRadioGroup4: TDBRadioGroup;
    GroupBox51: TGroupBox;
    Label340: TLabel;
    DBEdit181: TDBEdit;
    DBEdit182: TDBEdit;
    BitBtn54: TBitBtn;
    tsComplementar: TTabSheet;
    pnComplementar: TPanel;
    GroupBox52: TGroupBox;
    rbCompl1: TRadioButton;
    rbCompl2: TRadioButton;
    rbCompl3: TRadioButton;
    rbCompl4: TRadioButton;
    rbCompl5: TRadioButton;
    rbCompl6: TRadioButton;
    BitBtn55: TBitBtn;
    SpeedButton34: TSpeedButton;
    pnComplementarCadastro: TPanel;
    Panel67: TPanel;
    Label251: TLabel;
    edNumNfCompl: TEditHw;
    edSerieCompl: TEdit;
    Panel70: TPanel;
    GroupBox53: TGroupBox;
    BitBtn56: TBitBtn;
    BitBtn57: TBitBtn;
    DBGrid22: TDBGrid;
    GroupBox54: TGroupBox;
    Label254: TLabel;
    DBEdit183: TDBEdit;
    Label255: TLabel;
    DBEdit184: TDBEdit;
    DBMemo9: TDBMemo;
    GroupBox55: TGroupBox;
    Label258: TLabel;
    DBEdit185: TDBEdit;
    DBMemo10: TDBMemo;
    GroupBox56: TGroupBox;
    Label256: TLabel;
    DBEdit186: TDBEdit;
    DBMemo11: TDBMemo;
    GroupBox57: TGroupBox;
    Label345: TLabel;
    Label346: TLabel;
    Label347: TLabel;
    Label349: TLabel;
    Label350: TLabel;
    Label351: TLabel;
    Label352: TLabel;
    Label353: TLabel;
    Label354: TLabel;
    Label355: TLabel;
    Label356: TLabel;
    Label357: TLabel;
    Label358: TLabel;
    Label359: TLabel;
    DBText31: TDBText;
    DBText32: TDBText;
    DBText33: TDBText;
    DBText34: TDBText;
    DBText35: TDBText;
    DBText36: TDBText;
    DBText37: TDBText;
    DBText38: TDBText;
    DBText39: TDBText;
    DBText40: TDBText;
    DBText41: TDBText;
    DBText42: TDBText;
    DBText43: TDBText;
    DBText44: TDBText;
    Panel72: TPanel;
    SpeedButton35: TSpeedButton;
    pnC110: TPanel;
    pnC110Cadastro: TPanel;
    pnC110Consulta: TPanel;
    Panel48: TPanel;
    BitBtn50: TBitBtn;
    BitBtn51: TBitBtn;
    BitBtn52: TBitBtn;
    DBMemo8: TDBMemo;
    Panel49: TPanel;
    BitBtn41: TBitBtn;
    BitBtn49: TBitBtn;
    Label281: TLabel;
    DBEdit187: TDBEdit;
    Label360: TLabel;
    Panel52: TPanel;
    DBGrid16: TDBGrid;
    DBMemo13: TDBMemo;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    popMnDadosAd: TPopupMenu;
    btSalvarNF: TBitBtn;
    tsC115: TTabSheet;
    pnC115: TPanel;
    pnC115Cadastro: TPanel;
    Panel75: TPanel;
    btSalvarC115: TBitBtn;
    btCancelarC115: TBitBtn;
    pnC115Consulta: TPanel;
    GroupBox43: TGroupBox;
    DBGrid23: TDBGrid;
    Panel77: TPanel;
    SpeedButton36: TSpeedButton;
    btNovoC115: TBitBtn;
    btAlterarC115: TBitBtn;
    btRemoverC115: TBitBtn;
    GroupBox58: TGroupBox;
    GroupBox59: TGroupBox;
    Label303: TLabel;
    DBEdit188: TDBEdit;
    Label348: TLabel;
    DBEdit189: TDBEdit;
    Label361: TLabel;
    DBEdit190: TDBEdit;
    Label362: TLabel;
    DBEdit191: TDBEdit;
    DBEdit192: TDBEdit;
    DBEdit193: TDBEdit;
    Label363: TLabel;
    DBEdit194: TDBEdit;
    Label364: TLabel;
    DBLookupComboBox8: TDBLookupComboBox;
    Label365: TLabel;
    DBEdit195: TDBEdit;
    Label366: TLabel;
    DBEdit196: TDBEdit;
    Label367: TLabel;
    DBEdit197: TDBEdit;
    Label368: TLabel;
    DBEdit198: TDBEdit;
    Label369: TLabel;
    DBEdit199: TDBEdit;
    DBEdit200: TDBEdit;
    DBEdit201: TDBEdit;
    Label370: TLabel;
    DBEdit202: TDBEdit;
    Label371: TLabel;
    DBLookupComboBox9: TDBLookupComboBox;
    Label372: TLabel;
    DBEdit203: TDBEdit;
    DBRadioGroup6: TDBRadioGroup;
    DBRadioGroup7: TDBRadioGroup;
    btCancelarDetalhesVeiculo: TBitBtn;
    Label302: TLabel;
    DBComboBox11: TDBComboBox;
    Label179: TLabel;
    DBComboBox12: TDBComboBox;
    pnImpDadosAd: TPanel;
    GroupBox60: TGroupBox;
    GroupBox61: TGroupBox;
    DBMemo4: TDBMemo;
    DBMemo5: TDBMemo;
    Panel74: TPanel;
    BitBtn63: TBitBtn;
    Label373: TLabel;
    DBMemo12: TDBMemo;
    ProcessosReferenciados1: TMenuItem;
    ArrecadaesReferenciadas1: TMenuItem;
    NotasFiscaisReferenciadas1: TMenuItem;
    CuponsFiscaisReferenciados1: TMenuItem;
    DadosdeColetaEntrega1: TMenuItem;
    Label374: TLabel;
    Label375: TLabel;
    edCodClForPedCompra: TEditHw;
    btModuloNFe: TBitBtn;
    btIncluirItemServicoDetalhado: TBitBtn;
    tsEmbalagemOuMeia: TTabSheet;
    pnEmbMeia: TPanel;
    BitBtn24: TBitBtn;
    BitBtn67: TBitBtn;
    tsConsultaNfe: TTabSheet;
    pnConsultaNfe: TPanel;
    edChaveNFeConsulta: TEdit;
    edUFConsultaNfe: TComboBox;
    Label382: TLabel;
    Label383: TLabel;
    btConsultarNFe: TBitBtn;
    btCancelarConsultaNFe: TBitBtn;
    Label384: TLabel;
    edSerieConsultaNfe: TEditHw;
    Label385: TLabel;
    DevolucaodeNotaFiscalTotal1: TMenuItem;
    tsDevolucaoNf: TTabSheet;
    pnDevolucaoNf: TPanel;
    btOKDevolucaoNf: TBitBtn;
    BitBtn75: TBitBtn;
    Label386: TLabel;
    DBGrid24: TDBGrid;
    tsChaveNFe: TTabSheet;
    btCalcularNf: TSpeedButton;
    Label387: TLabel;
    tsProdForn: TTabSheet;
    pnProdForn: TPanel;
    GroupBox62: TGroupBox;
    DBGrid25: TDBGrid;
    Panel80: TPanel;
    BitBtn85: TBitBtn;
    BitBtn86: TBitBtn;
    OpenDialog1: TOpenDialog;
    spbSairDetalhe: TSpeedButton;
    spbAnterior: TSpeedButton;
    spbProximo: TSpeedButton;
    tsDespesa: TTabSheet;
    pnItensDespesa: TPanel;
    pnConsultaItensDespesa: TPanel;
    DBGrid26: TDBGrid;
    Panel89: TPanel;
    Panel90: TPanel;
    btIncluirItensDespesa: TBitBtn;
    btAlterarItensDespesa: TBitBtn;
    btRemoverItemDespesa: TBitBtn;
    tsAlterarDadosParaSintegra: TTabSheet;
    pnNfSintegra: TPanel;
    Panel81: TPanel;
    GroupBox63: TGroupBox;
    Label388: TLabel;
    DBEdit211: TDBEdit;
    DBEdit212: TDBEdit;
    Label389: TLabel;
    DBEdit213: TDBEdit;
    Label390: TLabel;
    DBEdit214: TDBEdit;
    DBEdit215: TDBEdit;
    GroupBox64: TGroupBox;
    pnConsultaItemSintegra: TPanel;
    pnAlterarItemSintegra: TPanel;
    Label391: TLabel;
    Label392: TLabel;
    DBEdit216: TDBEdit;
    DBEdit217: TDBEdit;
    Label393: TLabel;
    DBEdit218: TDBEdit;
    DBGrid27: TDBGrid;
    Panel85: TPanel;
    BitBtn88: TBitBtn;
    Panel86: TPanel;
    BitBtn89: TBitBtn;
    BitBtn90: TBitBtn;
    BitBtn91: TBitBtn;
    BitBtn92: TBitBtn;
    Label394: TLabel;
    DBEdit219: TDBEdit;
    spbDetalhesFormPag: TSpeedButton;
    tsEntrada: TTabSheet;
    PageControl7: TPageControl;
    tsDetalhepagEnt: TTabSheet;
    pnDetFormPagEnt: TPanel;
    dbGridDetPagEnt: TDBGrid;
    BitBtn93: TBitBtn;
    GroupBox65: TGroupBox;
    DBLookupComboBox10: TDBLookupComboBox;
    SpeedButton28: TSpeedButton;
    GroupBox66: TGroupBox;
    Label203: TLabel;
    DBEdit123: TDBEdit;
    Label202: TLabel;
    DBEdit122: TDBEdit;
    DBEdit220: TDBEdit;
    DBEdit221: TDBEdit;
    edtvalor_acres_fin2: TDBEdit;
    lbtvalor_acres_fin: TLabel;
    Label396: TLabel;
    edVServ: TEditHw;
    edValorBol: TEditHw;
    edBICM: TEditHw;
    edVICM: TEditHw;
    edBICMSub: TEditHw;
    edVICMSub: TEditHw;
    edVProd: TEditHw;
    edValorTotalDaNota: TEditHw;
    edVFrete: TEditHw;
    edVSeguro: TEditHw;
    edVOutDesp: TEditHw;
    edVIPI: TEditHw;
    edVAcresc: TEditHw;
    edVOutDesPF: TEditHw;
    edDesconto: TEditHw;
    edNpedPC: TEditHw;
    tsDetalheFatEnt: TTabSheet;
    pnDetFatEnt: TPanel;
    Panel83: TPanel;
    Label401: TLabel;
    Label402: TLabel;
    Label403: TLabel;
    Label404: TLabel;
    Panel84: TPanel;
    Panel87: TPanel;
    Label418: TLabel;
    Label419: TLabel;
    Label420: TLabel;
    Label421: TLabel;
    Label422: TLabel;
    DBEdit225: TDBEdit;
    DBLookupComboBox12: TDBLookupComboBox;
    DBEdit226: TDBEdit;
    Label405: TLabel;
    Label414: TLabel;
    DBGrid28: TDBGrid;
    Label415: TLabel;
    Panel88: TPanel;
    BitBtn94: TBitBtn;
    BitBtn95: TBitBtn;
    BitBtn96: TBitBtn;
    BitBtn97: TBitBtn;
    BitBtn98: TBitBtn;
    BitBtn99: TBitBtn;
    cdsDesp: TClientDataSet;
    cdsDespNumConta: TFloatField;
    cdsDespDepartamento: TStringField;
    cdsDespDataReferencia: TDateField;
    cdsDespHistorico: TStringField;
    cdsDespValor: TCurrencyField;
    dsDesp: TDataSource;
    DBEdit223: TDBEdit;
    DBEdit224: TDBEdit;
    BitBtn100: TBitBtn;
    btDetalheDespesa: TBitBtn;
    DBText45: TDBText;
    DBText46: TDBText;
    cdsDespNumDoc: TStringField;
    Label416: TLabel;
    DBEdit227: TDBEdit;
    cdsDespControles: TIntegerField;
    cdsDespNomeControle: TStringField;
    Label417: TLabel;
    DBEdit228: TDBEdit;
    DBLookupComboBox11: TDBLookupComboBox;
    pnC195_C197: TPanel;
    pnCadastroC195197: TPanel;
    Panel93: TPanel;
    Panel94: TPanel;
    BitBtn101: TBitBtn;
    BitBtn102: TBitBtn;
    Label424: TLabel;
    Label425: TLabel;
    DBEdit231: TDBEdit;
    Label426: TLabel;
    DBEdit232: TDBEdit;
    Label427: TLabel;
    DBEdit233: TDBEdit;
    Label428: TLabel;
    DBEdit234: TDBEdit;
    Label429: TLabel;
    DBEdit235: TDBEdit;
    Label430: TLabel;
    DBLookupComboBox13: TDBLookupComboBox;
    pnConsultaC195_C197: TPanel;
    GroupBox69: TGroupBox;
    DBGrid29: TDBGrid;
    Panel96: TPanel;
    BitBtn103: TBitBtn;
    BitBtn104: TBitBtn;
    BitBtn105: TBitBtn;
    DBComboBox13: TDBComboBox;
    Label423: TLabel;
    Label431: TLabel;
    Label432: TLabel;
    SpeedButton30: TSpeedButton;
    pnItensLancF: TGroupBox;
    Panel97: TPanel;
    DBGrid30: TDBGrid;
    Panel99: TPanel;
    BitBtn106: TBitBtn;
    Panel91: TPanel;
    BitBtn108: TBitBtn;
    BitBtn109: TBitBtn;
    SpeedButton32: TSpeedButton;
    SpeedButton37: TSpeedButton;
    BitBtn107: TBitBtn;
    pgDespesas: TPageControl;
    tsDadosAdConsumo: TTabSheet;
    pnDadosAdConsumo: TPanel;
    dbComboConsumo: TDBComboBox;
    Label433: TLabel;
    dbComboAgua: TDBComboBox;
    Label434: TLabel;
    DBEdit229: TDBEdit;
    Label435: TLabel;
    DBEdit230: TDBEdit;
    Label436: TLabel;
    DBEdit236: TDBEdit;
    Panel92: TPanel;
    BitBtn110: TBitBtn;
    BitBtn112: TBitBtn;
    spBotaoRemoverStatusEmProcessamento: TSpeedButton;
    btStatusNFe: TBitBtn;
    tsAntecTrib: TTabSheet;
    pnAtencTrib: TPanel;
    Panel95: TPanel;
    BitBtn113: TBitBtn;
    DBGrid31: TDBGrid;
    Panel98: TPanel;
    Panel100: TPanel;
    BitBtn114: TBitBtn;
    SpeedButton38: TSpeedButton;
    tsProdImportXml: TTabSheet;
    pnAtivDesativCalcSt: TPanel;
    Memo2: TMemo;
    BitBtn117: TBitBtn;
    BitBtn118: TBitBtn;
    BitBtn119: TBitBtn;
    BitBtn120: TBitBtn;
    BitBtn121: TBitBtn;
    tsAlterarDadosSPED: TTabSheet;
    pnAlterarDadosSPED: TPanel;
    Panel105: TPanel;
    GroupBox67: TGroupBox;
    Label441: TLabel;
    Label442: TLabel;
    Label443: TLabel;
    Label444: TLabel;
    DBEdit237: TDBEdit;
    DBEdit238: TDBEdit;
    DBEdit239: TDBEdit;
    DBEdit240: TDBEdit;
    DBEdit241: TDBEdit;
    DBEdit245: TDBEdit;
    BitBtn125: TBitBtn;
    BitBtn126: TBitBtn;
    Label448: TLabel;
    DBEdit246: TDBEdit;
    Label449: TLabel;
    DBEdit247: TDBEdit;
    Label450: TLabel;
    DBEdit248: TDBEdit;
    Label451: TLabel;
    DBEdit249: TDBEdit;
    Label452: TLabel;
    DBEdit250: TDBEdit;
    Label453: TLabel;
    DBEdit251: TDBEdit;
    Label454: TLabel;
    DBEdit252: TDBEdit;
    Label455: TLabel;
    DBEdit253: TDBEdit;
    Label458: TLabel;
    DBEdit254: TDBEdit;
    Label459: TLabel;
    DBEdit255: TDBEdit;
    Label460: TLabel;
    DBEdit256: TDBEdit;
    Label461: TLabel;
    DBEdit257: TDBEdit;
    tsCSTPISCOFINS: TTabSheet;
    GroupBox70: TGroupBox;
    pnConsultaItemSPED: TPanel;
    DBGrid33: TDBGrid;
    Panel111: TPanel;
    BitBtn127: TBitBtn;
    pnAlterarItemSPED: TPanel;
    Label447: TLabel;
    Label485: TLabel;
    DBEdit244: TDBEdit;
    DBEdit281: TDBEdit;
    Panel113: TPanel;
    BitBtn128: TBitBtn;
    BitBtn129: TBitBtn;
    GroupBox74: TGroupBox;
    Label500: TLabel;
    Label497: TLabel;
    Label498: TLabel;
    Label502: TLabel;
    Label501: TLabel;
    Label499: TLabel;
    DBEdit293: TDBEdit;
    DBEdit294: TDBEdit;
    DBEdit298: TDBEdit;
    DBEdit297: TDBEdit;
    DBEdit295: TDBEdit;
    GroupBox75: TGroupBox;
    Label509: TLabel;
    Label510: TLabel;
    Label511: TLabel;
    Label512: TLabel;
    Label513: TLabel;
    Label514: TLabel;
    DBEdit306: TDBEdit;
    DBEdit307: TDBEdit;
    DBEdit308: TDBEdit;
    DBEdit309: TDBEdit;
    DBEdit310: TDBEdit;
    GroupBox76: TGroupBox;
    Label503: TLabel;
    Label504: TLabel;
    Label505: TLabel;
    Label508: TLabel;
    DBEdit299: TDBEdit;
    DBEdit300: TDBEdit;
    DBEdit301: TDBEdit;
    DBEdit304: TDBEdit;
    GroupBox71: TGroupBox;
    Label487: TLabel;
    Label488: TLabel;
    Label489: TLabel;
    DBEdit283: TDBEdit;
    DBEdit284: TDBEdit;
    DBEdit285: TDBEdit;
    GroupBox72: TGroupBox;
    Label486: TLabel;
    Label490: TLabel;
    Label491: TLabel;
    Label492: TLabel;
    DBEdit286: TDBEdit;
    DBEdit287: TDBEdit;
    DBEdit288: TDBEdit;
    Label445: TLabel;
    Label446: TLabel;
    DBEdit242: TDBEdit;
    DBEdit243: TDBEdit;
    Memo3: TMemo;
    DBComboBox14: TDBComboBox;
    DBComboBox15: TDBComboBox;
    DBComboBox16: TDBComboBox;
    DBEdit258: TDBEdit;
    GroupBox68: TGroupBox;
    edPreco30: TEditHw;
    edPreco60: TEditHw;
    edPreco90: TEditHw;
    BitBtn122: TBitBtn;
    pnCSTPISCOFINS: TPanel;
    Panel107: TPanel;
    Panel109: TPanel;
    ListBox5: TListBox;
    Panel110: TPanel;
    BitBtn123: TBitBtn;
    btHabPISCOFINS: TSpeedButton;
    btOHabPISCOFINS: TSpeedButton;
    ScrollBox5: TScrollBox;
    Panel104: TPanel;
    btOKEmbalagem: TBitBtn;
    btCancelarEmabalagem: TBitBtn;
    Panel114: TPanel;
    Label57: TLabel;
    Label376: TLabel;
    Label377: TLabel;
    Label378: TLabel;
    Label379: TLabel;
    Label380: TLabel;
    eddQTDEMB_: TEditHw;
    eddQTDEMBREC_: TEditHw;
    eddVLREMBNF_: TEditHw;
    eddVLBRUREAL: TEditHw;
    eddPDESC_R: TEditHw;
    eddVLREMBNFR: TEditHw;
    Label475: TLabel;
    DBEdit259: TDBEdit;
    Label476: TLabel;
    DBEdit260: TDBEdit;
    Label477: TLabel;
    Label478: TLabel;
    tsDevolucaoItens: TTabSheet;
    pnDevolucaoItens: TPanel;
    GroupBox73: TGroupBox;
    SpeedButton42: TSpeedButton;
    SpeedButton47: TSpeedButton;
    BitBtn131: TBitBtn;
    GroupBox77: TGroupBox;
    Label480: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label481: TLabel;
    Label482: TLabel;
    Label483: TLabel;
    Panel117: TPanel;
    BitBtn132: TBitBtn;
    BitBtn133: TBitBtn;
    GroupBox78: TGroupBox;
    DBGrid34: TDBGrid;
    SpeedButton48: TSpeedButton;
    dsDevItens: TDataSource;
    dsItensTemp: TDataSource;
    Panel116: TPanel;
    DBGrid32: TDBGrid;
    SpeedButton49: TSpeedButton;
    SpeedButton54: TSpeedButton;
    PopupMenu4: TPopupMenu;
    Marcaritemparainformaragrade1: TMenuItem;
    tsDetalhesNF: TTabSheet;
    pnFormDetalhesNF: TPanel;
    Label484: TLabel;
    Label493: TLabel;
    Label494: TLabel;
    BitBtn135: TBitBtn;
    BitBtn136: TBitBtn;
    BitBtn137: TBitBtn;
    BitBtn138: TBitBtn;
    pnDetalhesItensNF: TPanel;
    GroupBox79: TGroupBox;
    Panel122: TPanel;
    SpeedButton55: TSpeedButton;
    SpeedButton56: TSpeedButton;
    Panel123: TPanel;
    pageDetalhesItensNF: TPageControl;
    tsDetItem_Grade: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    Panel124: TPanel;
    BitBtn139: TBitBtn;
    DBGrid37: TDBGrid;
    DBGrid38: TDBGrid;
    DBGrid39: TDBGrid;
    DBGrid36: TDBGrid;
    PopupMenu5: TPopupMenu;
    AlterarValordaNotaFiscal1: TMenuItem;
    tsImportacao: TTabSheet;
    pnImportacao: TPanel;
    GroupBox80: TGroupBox;
    SpeedButton57: TSpeedButton;
    SpeedButton59: TSpeedButton;
    BitBtn140: TBitBtn;
    Panel125: TPanel;
    DBGrid40: TDBGrid;
    GroupBox81: TGroupBox;
    Panel126: TPanel;
    DBGrid41: TDBGrid;
    BitBtn142: TBitBtn;
    BitBtn143: TBitBtn;
    BitBtn144: TBitBtn;
    pnDI: TPanel;
    GroupBox82: TGroupBox;
    Panel118: TPanel;
    DBGrid42: TDBGrid;
    BitBtn145: TBitBtn;
    BitBtn146: TBitBtn;
    BitBtn147: TBitBtn;
    Panel127: TPanel;
    BitBtn148: TBitBtn;
    BitBtn149: TBitBtn;
    pnADI: TPanel;
    Panel129: TPanel;
    BitBtn150: TBitBtn;
    BitBtn151: TBitBtn;
    Label495: TLabel;
    DBEdit262: TDBEdit;
    Label496: TLabel;
    DBEdit263: TDBEdit;
    Label506: TLabel;
    DBEdit264: TDBEdit;
    Label507: TLabel;
    Label515: TLabel;
    DBEdit266: TDBEdit;
    lbCEXPORTADOR: TLabel;
    dbedCEXPORTADOR: TDBEdit;
    Label517: TLabel;
    DBEdit268: TDBEdit;
    Label518: TLabel;
    DBEdit269: TDBEdit;
    Label519: TLabel;
    DBEdit270: TDBEdit;
    Label520: TLabel;
    DBEdit271: TDBEdit;
    DBComboBox18: TDBComboBox;
    DBText47: TDBText;
    DBRadioGroup8: TDBRadioGroup;
    DBRadioGroup9: TDBRadioGroup;
    tsCarga: TTabSheet;
    Label534: TLabel;
    BitBtn141: TBitBtn;
    tsVendaForaEstabelecimento: TTabSheet;
    pnVendaForaEstabelecimento: TPanel;
    Panel131: TPanel;
    Panel133: TPanel;
    Splitter3: TSplitter;
    SpeedButton60: TSpeedButton;
    Label535: TLabel;
    Label536: TLabel;
    Label537: TLabel;
    DBText48: TDBText;
    DBText49: TDBText;
    DBText50: TDBText;
    Splitter4: TSplitter;
    GroupBox83: TGroupBox;
    DBGrid43: TDBGrid;
    GroupBox84: TGroupBox;
    DBGrid44: TDBGrid;
    Panel128: TPanel;
    Splitter5: TSplitter;
    BitBtn152: TBitBtn;
    BitBtn153: TBitBtn;
    cdsTempITVFE: TClientDataSet;
    cdsTempITVFENITEM: TIntegerField;
    cdsTempITVFENUM_FAB_PROD: TStringField;
    cdsTempITVFEDESCRICAO_ITEM: TStringField;
    cdsTempITVFEQUANTIDADE: TFloatField;
    cdsTempITVFEVALOR_UNITARIO: TFloatField;
    cdsTempITVFEVALOR_TOTAL: TFloatField;
    Panel135: TPanel;
    SpeedButton62: TSpeedButton;
    EditHw8: TEditHw;
    EditHw9: TEditHw;
    EditHw10: TEditHw;
    Panel134: TPanel;
    SpeedButton61: TSpeedButton;
    EditHw4: TEditHw;
    EditHw5: TEditHw;
    EditHw6: TEditHw;
    SpeedButton63: TSpeedButton;
    EditHw7: TEditHw;
    Label538: TLabel;
    Edit4: TEdit;
    Label539: TLabel;
    Edit5: TEdit;
    Label540: TLabel;
    SpeedButton64: TSpeedButton;
    tsVerNotaVendaForaEstab: TTabSheet;
    pnNotasForaEstab: TPanel;
    SpeedButton65: TSpeedButton;
    Panel136: TPanel;
    Splitter6: TSplitter;
    Panel137: TPanel;
    Label541: TLabel;
    Label542: TLabel;
    Label543: TLabel;
    DBText51: TDBText;
    DBText52: TDBText;
    DBText53: TDBText;
    GroupBox86: TGroupBox;
    DBGrid46: TDBGrid;
    GroupBox85: TGroupBox;
    Panel138: TPanel;
    DBGrid45: TDBGrid;
    Splitter7: TSplitter;
    BitBtn154: TBitBtn;
    Label544: TLabel;
    DBEdit277: TDBEdit;
    Label545: TLabel;
    DBEdit278: TDBEdit;
    tsCC_e: TTabSheet;
    pnCC_e: TPanel;
    Splitter8: TSplitter;
    Panel140: TPanel;
    Panel141: TPanel;
    Label546: TLabel;
    Label547: TLabel;
    Label548: TLabel;
    DBText54: TDBText;
    DBText55: TDBText;
    DBText56: TDBText;
    GroupBox87: TGroupBox;
    GroupBox88: TGroupBox;
    Label549: TLabel;
    DBEdit280: TDBEdit;
    Label550: TLabel;
    DBEdit282: TDBEdit;
    Label551: TLabel;
    DBEdit289: TDBEdit;
    Label552: TLabel;
    DBMemo16: TDBMemo;
    Label553: TLabel;
    DBEdit290: TDBEdit;
    Label554: TLabel;
    Label555: TLabel;
    DBEdit292: TDBEdit;
    DBMemo17: TDBMemo;
    Label556: TLabel;
    DBEdit291: TDBEdit;
    Label557: TLabel;
    Memo4: TMemo;
    Panel139: TPanel;
    DBGrid47: TDBGrid;
    Panel143: TPanel;
    BitBtn161: TBitBtn;
    BitBtn155: TBitBtn;
    BitBtn158: TBitBtn;
    BitBtn159: TBitBtn;
    BitBtn160: TBitBtn;
    BitBtn156: TBitBtn;
    Label558: TLabel;
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRImage1: TQRImage;
    qrLbEmpresa: TQRLabel;
    QRMemo1: TQRMemo;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape5: TQRShape;
    QRMemo2: TQRMemo;
    QRShape6: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape7: TQRShape;
    QRLabel1: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape10: TQRShape;
    QRLabel8: TQRLabel;
    QRShape11: TQRShape;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRShape12: TQRShape;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRShape13: TQRShape;
    QRLabel11: TQRLabel;
    QRShape14: TQRShape;
    QRLabel12: TQRLabel;
    QRShape15: TQRShape;
    QRLabel13: TQRLabel;
    QRShape16: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    PageFooterBand1: TQRBand;
    QRShape17: TQRShape;
    QRMemo3: TQRMemo;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel19: TQRLabel;
    QRShape18: TQRShape;
    QRLabel20: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel21: TQRLabel;
    qrLbCNPJ: TQRLabel;
    Panel142: TPanel;
    SpeedButton66: TSpeedButton;
    BitBtn162: TBitBtn;
    tsExportacao: TTabSheet;
    DBComboBox22: TDBComboBox;
    Label561: TLabel;
    dsEventos: TDataSource;
    BitBtn165: TBitBtn;
    Label578: TLabel;
    BitBtn166: TBitBtn;
    Label579: TLabel;
    DBEdit296: TDBEdit;
    BitBtn168: TBitBtn;
    Label582: TLabel;
    DBEdit303: TDBEdit;
    BitBtn169: TBitBtn;
    Label583: TLabel;
    ckEfetuarLancamentoFiscalDocumento: TCheckBox;
    ckEfetuarLancamentoFiscalItemDocumento: TCheckBox;
    DBLookupComboBox15: TDBLookupComboBox;
    tsManifestacao: TTabSheet;
    pnManifestacao: TPanel;
    Panel145: TPanel;
    Panel149: TPanel;
    DBGridManifestacao: TDBGrid;
    Panel150: TPanel;
    SpeedButton67: TSpeedButton;
    SpeedButton68: TSpeedButton;
    SpeedButton69: TSpeedButton;
    SpeedButton70: TSpeedButton;
    SpeedButton71: TSpeedButton;
    SpeedButton72: TSpeedButton;
    Panel151: TPanel;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    RadioGroup5: TRadioGroup;
    SpeedButton73: TSpeedButton;
    Panel152: TPanel;
    Panel153: TPanel;
    SpeedButton75: TSpeedButton;
    Panel154: TPanel;
    SpeedButton74: TSpeedButton;
    Label588: TLabel;
    Edit6: TEdit;
    Label589: TLabel;
    EditHw1: TEditHw;
    Label590: TLabel;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    Edit7: TEdit;
    Label591: TLabel;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    BitBtn171: TBitBtn;
    SpeedButton76: TSpeedButton;
    SpeedButton77: TSpeedButton;
    SpeedButton78: TSpeedButton;
    Label594: TLabel;
    BitBtn172: TBitBtn;
    pnDevolucoesRef: TPanel;
    Panel157: TPanel;
    Panel156: TPanel;
    BitBtn173: TBitBtn;
    DBGrid50: TDBGrid;
    tsBaixaItensPedidos: TTabSheet;
    pnBaixaItensPedidos: TPanel;
    GroupBox91: TGroupBox;
    GroupBox92: TGroupBox;
    Panel155: TPanel;
    Panel159: TPanel;
    DBText57: TDBText;
    DBText58: TDBText;
    DBText59: TDBText;
    DBText60: TDBText;
    DBText61: TDBText;
    gridBaixaItensPedidos: TDBGrid;
    DBGrid51: TDBGrid;
    BitBtn174: TBitBtn;
    BitBtn175: TBitBtn;
    Splitter9: TSplitter;
    BitBtn176: TBitBtn;
    tsNFServico: TTabSheet;
    ckServicos: TCheckBox;
    BitBtn178: TBitBtn;
    Panel160: TPanel;
    BitBtn179: TBitBtn;
    BitBtn180: TBitBtn;
    BitBtn181: TBitBtn;
    tsDiversos: TTabSheet;
    pnDiversos: TPanel;
    Panel1Diversos: TPanel;
    btOKDiversos: TBitBtn;
    btCancelaDiversos: TBitBtn;
    Panel2Diversos: TPanel;
    gridDiversos: TDBGrid;
    spAtivarDFe: TSpeedButton;
    dsDiversos: TDataSource;
    tsOutrosDados: TTabSheet;
    pnCadastroOutrosDadosNF: TPanel;
    lbDINDRAW: TLabel;
    dbeNDRAW: TDBEdit;
    dbrgTPVIATRANSP: TDBRadioGroup;
    lbVAFRMM: TLabel;
    dbeVAFRMM: TDBEdit;
    dbrgTPINTERMEDIO: TDBRadioGroup;
    lbDICNPJ: TLabel;
    dbeDICNPJ: TDBEdit;
    lbUFTERCEIRO: TLabel;
    dbcbxUFTERCEIRO: TDBComboBox;
    pnDadosExportacao: TPanel;
    grExportItensNF: TGroupBox;
    btExportItemNFAnterior: TSpeedButton;
    btExportItemNFProximo: TSpeedButton;
    btExportItemNFVoltar: TBitBtn;
    pnExportItensNFGrid: TPanel;
    gridExportItensNF: TDBGrid;
    grExpDados: TGroupBox;
    pnExportDadosBotoes: TPanel;
    btExportDadosIncluir: TBitBtn;
    btExportDadosAlterar: TBitBtn;
    btExportDadosExcluir: TBitBtn;
    gridExportDados: TDBGrid;
    grExportInd: TGroupBox;
    pnExportIndBotoes: TPanel;
    btExportIndIncluir: TBitBtn;
    btExportIndAlterar: TBitBtn;
    btExportIndExcluir: TBitBtn;
    gridExportInd: TDBGrid;
    pnDetExportCad: TPanel;
    pnDetExportCadBotoes: TPanel;
    btDetExportCadSalvar: TBitBtn;
    brDetExportCadCancelar: TBitBtn;
    lbDetExportNDRAW: TLabel;
    dbeDetExportCadNDRAW: TDBEdit;
    pnDetExportIndCad: TPanel;
    dbtxDetExportIndCadDescricaoItem: TDBText;
    DetExportIndCadBotoes: TPanel;
    btDetExportIndSalvar: TBitBtn;
    btDetExportIndCancelar: TBitBtn;
    lbDetExportIndNRE: TLabel;
    dbeDetExportIndNRE: TDBEdit;
    lbDetExportIndCHNFE: TLabel;
    dbeDetExportIndCHNFE: TDBEdit;
    lbDetExportIndQEXPORT: TLabel;
    dbeDetExportIndQEXPORT: TDBEdit;
    pnExportacao: TPanel;
    GroupBox89: TGroupBox;
    Label559: TLabel;
    Label560: TLabel;
    DBEdit302: TDBEdit;
    DBComboBox21: TDBComboBox;
    pnExportaBotaoContinuar: TPanel;
    btnExportContinuar: TBitBtn;
    Label56: TLabel;
    dbeXLOCDESPACHO: TDBEdit;
    pnDadosCartao: TPanel;
    dbgridDadosCartoes: TDBGrid;
    pnDadosCartaoBotoes: TPanel;
    btDadosCartaoReceber: TBitBtn;
    btDadosCartaoVoltar: TBitBtn;
    pnContSelTermnalAdm: TPanel;
    pnSelTermnalAdm: TPanel;
    groupSelTermnalAdm: TGroupBox;
    pnSelTermnalAdmBotoes: TPanel;
    dblkListaTermAdm: TDBLookupComboBox;
    lbNaoEstaNaListaTermAdm: TLabel;
    edNumTerminalAdm: TEdit;
    btSelTermnalAdmContinuar: TBitBtn;
    btDadosCartaoCancelar: TBitBtn;
    lbPagamentoEmCartao: TLabel;
    btPagamentoEmCartao: TBitBtn;
    btDadosCartaoADM: TBitBtn;
    DBEdit41: TDBEdit;
    DBEdit267: TDBEdit;
    DBEdit315: TDBEdit;
    pgControlItensNFe: TPageControl;
    tsMerc_Mercadorias: TTabSheet;
    tsMerc_ICMS: TTabSheet;
    ScrollBox8: TScrollBox;
    pnIcmsItensMerc: TPanel;
    tsMerc_IPI: TTabSheet;
    tsMerc_PISCOFINS: TTabSheet;
    tsMerc_Interestadual: TTabSheet;
    tsMerc_ISS: TTabSheet;
    Label336: TLabel;
    eddRe: TEditHw;
    tsMerc_Importacao: TTabSheet;
    Label521: TLabel;
    Label522: TLabel;
    Label523: TLabel;
    Label524: TLabel;
    eddBCII: TEditHw;
    eddDespAduII: TEditHw;
    eddValorII: TEditHw;
    eddIOFII: TEditHw;
    tsMerc_Combustiveis: TTabSheet;
    Label562: TLabel;
    Label563: TLabel;
    Label564: TLabel;
    Label565: TLabel;
    Label566: TLabel;
    Label567: TLabel;
    Label568: TLabel;
    Label569: TLabel;
    lbPMixGN: TLabel;
    eddQAmb: TEditHw;
    eddCIDE_Aliq: TEditHw;
    eddCIDE_base: TEditHw;
    eddCIDE_valor: TEditHw;
    eddCodANP: TEdit;
    eddCODIF: TEdit;
    eddUFCons: TEdit;
    eddPMixGN: TEditHw;
    tsMerc_PedidoCliente: TTabSheet;
    Label595: TLabel;
    Label596: TLabel;
    eddXPedCompra: TEdit;
    eddNItemPedCompra: TEditHw;
    tsMerc_Devolucao: TTabSheet;
    lbItemDevolPercDevol: TLabel;
    lbItemDevolValorIPIDevolv: TLabel;
    eddItemDevolPercDevol: TEditHw;
    eddItemDevolVLIPIDevol: TEditHw;
    gb_cst_icms: TGroupBox;
    Label252: TLabel;
    eddCFOP: TEditHw;
    pgControlOItensNFe: TPageControl;
    tsOut_Mercadorias: TTabSheet;
    ScrollBox4: TScrollBox;
    tsOut_ICMS: TTabSheet;
    ScrollBox9: TScrollBox;
    pnIcmsItemOutras: TPanel;
    GroupBox96: TGroupBox;
    Label243: TLabel;
    Label239: TLabel;
    edOnCST: TEditHw;
    edOnCSOSN: TEditHw;
    edOnCFOP: TEditHw;
    GroupBox97: TGroupBox;
    Label339: TLabel;
    Label341: TLabel;
    Label342: TLabel;
    Label245: TLabel;
    edOnAliqICM: TEditHw;
    edOnRedBaseICM: TEditHw;
    edOnBaseICM: TEditHw;
    edOnValorICM: TEditHw;
    GroupBox98: TGroupBox;
    Label249: TLabel;
    Label250: TLabel;
    Label257: TLabel;
    Label343: TLabel;
    Label344: TLabel;
    Label581: TLabel;
    edOnMVA: TEditHw;
    edOnValorST: TEditHw;
    edOnAliqICMSub: TEditHw;
    edOnRedBaseST: TEditHw;
    edOnBaseICMSub: TEditHw;
    edoAntT: TEdit;
    tsOut_IPI: TTabSheet;
    tsOut_ISS: TTabSheet;
    tsOut_PISCOFINS: TTabSheet;
    Label468: TLabel;
    Label469: TLabel;
    Label470: TLabel;
    SpeedButton45: TSpeedButton;
    Label472: TLabel;
    Label473: TLabel;
    edoAliqPIS: TEditHw;
    edoBasePIS: TEditHw;
    edOCSTPIS: TComboBox;
    edoValorPIS: TEditHw;
    edoAliqCofins: TEditHw;
    edoValorCOFINS: TEditHw;
    tsOut_Interestadual: TTabSheet;
    Label471: TLabel;
    Label607: TLabel;
    Label608: TLabel;
    Label609: TLabel;
    Label610: TLabel;
    Label611: TLabel;
    Label612: TLabel;
    Label613: TLabel;
    edovBCUFDest: TEditHw;
    edopFCPUFDest: TEditHw;
    edopICMSUFDest: TEditHw;
    edopICMSInter: TEditHw;
    edopICMSInterPart: TEditHw;
    edovFCPUFDest: TEditHw;
    edovICMSUFDest: TEditHw;
    edovICMSUFRemet: TEditHw;
    tsOut_Importacao: TTabSheet;
    Label525: TLabel;
    Label526: TLabel;
    Label527: TLabel;
    Label528: TLabel;
    edoBCII: TEditHw;
    edoDespAduII: TEditHw;
    edoValorII: TEditHw;
    edoIOFII: TEditHw;
    tsOut_Combustiveis: TTabSheet;
    Label570: TLabel;
    Label571: TLabel;
    Label572: TLabel;
    Label573: TLabel;
    Label574: TLabel;
    Label575: TLabel;
    Label576: TLabel;
    Label577: TLabel;
    lboPMixGN: TLabel;
    edoQAmb: TEditHw;
    edoCIDE_Aliq: TEditHw;
    edoCIDE_base: TEditHw;
    edoCIDE_valor: TEditHw;
    edoCodANP: TEdit;
    edoCODIF: TEdit;
    edoUFCons: TEdit;
    edoPMixGN: TEditHw;
    tsOut_PedidoCliente: TTabSheet;
    Label597: TLabel;
    Label598: TLabel;
    edoXPedCompra: TEdit;
    edoNItemPedCompra: TEditHw;
    tsOut_Devolucao: TTabSheet;
    lbolItemDevolPercDevol: TLabel;
    lbolItemDevolVLIPIDevol: TLabel;
    edoItemDevolPercDevol: TEditHw;
    edoItemDevolVLIPIDevol: TEditHw;
    ScrollBox10: TScrollBox;
    Panel144: TPanel;
    Label246: TLabel;
    Label274: TLabel;
    Label381: TLabel;
    spEmbalagemMNF: TSpeedButton;
    Label265: TLabel;
    Label275: TLabel;
    Label253: TLabel;
    Label259: TLabel;
    Label260: TLabel;
    Label262: TLabel;
    eddNumFab: TEdit;
    edDTipo: TEdit;
    eddDescricao: TEdit;
    eddMNF: TEdit;
    eddNumFabFornecedor: TEdit;
    eddReferencia: TEdit;
    eddCodigo: TEdit;
    eddGrupo: TEditHw;
    eddQtde: TEditHw;
    eddValorUnitario: TEditHw;
    ed_rateio_desconto: TEditHw;
    eddValorTotal: TEditHw;
    Label617: TLabel;
    ckonAnt_calc: TCheckBox;
    BitBtn163: TBitBtn;
    SpeedButton40: TSpeedButton;
    Label276: TLabel;
    eddUnidade_nf: TEdit;
    Label277: TLabel;
    eddQTDEMB_old: TEditHw;
    eddQTDEMBREC: TEditHw;
    Label618: TLabel;
    Label619: TLabel;
    eddVLREMBNF: TEditHw;
    btnUnlockEmb: TSpeedButton;
    btnLockEmb: TSpeedButton;
    lbPrecoVarejoAtual: TLabel;
    Label620: TLabel;
    Label624: TLabel;
    lbPrecoAtacadoAtual: TLabel;
    SpeedButton46: TSpeedButton;
    tsIrregularidadesNCMCEST: TTabSheet;
    pnIrregularidadesNCMCEST: TPanel;
    GroupBox99: TGroupBox;
    Panel34: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    DBGrid52: TDBGrid;
    Panel58: TPanel;
    groupDivergNCM: TGroupBox;
    groupDivergCEST: TGroupBox;
    DBEdit317: TDBEdit;
    DBMemo18: TDBMemo;
    DBEdit318: TDBEdit;
    DBMemo19: TDBMemo;
    BitBtn164: TBitBtn;
    Label621: TLabel;
    BitBtn182: TBitBtn;
    Label622: TLabel;
    DBEdit319: TDBEdit;
    DBMemo20: TDBMemo;
    DBEdit320: TDBEdit;
    DBMemo21: TDBMemo;
    BitBtn183: TBitBtn;
    Label623: TLabel;
    BitBtn184: TBitBtn;
    Label625: TLabel;
    BitBtn185: TBitBtn;
    BitBtn186: TBitBtn;
    Panel64: TPanel;
    Memo5: TMemo;
    Label626: TLabel;
    DBEdit321: TDBEdit;
    DBEdit322: TDBEdit;
    btEspelhoCalc: TSpeedButton;
    Panel71: TPanel;
    pnEspelhoCalcAntSt: TPanel;
    GroupBox101: TGroupBox;
    DBGrid53: TDBGrid;
    Panel101: TPanel;
    DBMemo22: TDBMemo;
    BitBtn190: TBitBtn;
    ckMostrarApenasComST: TCheckBox;
    SpeedButton80: TSpeedButton;
    DBEdit324: TDBEdit;
    DBEdit105: TDBEdit;
    DBLookupComboBox16: TDBLookupComboBox;
    DBEdit100: TDBEdit;
    DBLookupComboBox17: TDBLookupComboBox;
    ckUsarValorDoPedido: TCheckBox;
    ckUsarValorDoPedido2: TCheckBox;
    ckCopiaCtpFinanceiro: TCheckBox;
    tsMudancaCfopCST: TTabSheet;
    pnMudancaCfopCST: TPanel;
    pnMudDados: TPanel;
    pnMudBotoes: TPanel;
    pnMudDados1: TPanel;
    btnMudVoltar: TBitBtn;
    gbMudOpcoes: TGroupBox;
    ckMudCFOP: TCheckBox;
    ckMudSelecionados: TCheckBox;
    ckMudCST: TCheckBox;
    ckMudAliqICMS: TCheckBox;
    edMudCFOP: TEditHw;
    edMudCST: TEditHw;
    edMudAliqICMS: TEditHw;
    btMudAplicarOpcoes: TBitBtn;
    btMudAplicarAuto: TBitBtn;
    edMudOrigCST: TEditHw;
    btMudPopUpMenu: TSpeedButton;
    pmMarcacoes: TPopupMenu;
    SelecionaDesselecionaItem1: TMenuItem;
    SelecionaTodos1: TMenuItem;
    DesselecionaTodos1: TMenuItem;
    InverterSeleo1: TMenuItem;
    ckMudOrigem: TCheckBox;
    edMudCSOSN: TEditHw;
    panelGrupoVenda: TPanel;
    GroupBox11: TGroupBox;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    SpeedButton10: TSpeedButton;
    ckReqPV: TCheckBox;
    ckOSPV: TCheckBox;
    edDataIniPV: TMaskEdit;
    edDataFimPV: TMaskEdit;
    BitBtn15: TBitBtn;
    edCodClForPedVenda: TEditHw;
    edNPedVenda: TEditHw;
    ckPVApenasComCupomFiscal: TCheckBox;
    ckVendasVAN: TCheckBox;
    GroupBox12: TGroupBox;
    Panel103: TPanel;
    BitBtn18: TBitBtn;
    bt_nf_prod_add_pedpvenda: TBitBtn;
    bt_nf_serv_add_pedpvenda: TBitBtn;
    Panel106: TPanel;
    DBGrid2: TDBGrid;
    Panel108: TPanel;
    Panel10: TPanel;
    Label74: TLabel;
    Panel8: TPanel;
    Label122: TLabel;
    Panel112: TPanel;
    Splitter10: TSplitter;
    GroupBox13: TGroupBox;
    DBGrid3: TDBGrid;
    Panel115: TPanel;
    Panel7: TPanel;
    Label123: TLabel;
    ckValorNf: TCheckBox;
    Panel9: TPanel;
    Label124: TLabel;
    ckEsconderNotas: TCheckBox;
    btPVTickAll: TSpeedButton;
    btPVUnTickAll: TSpeedButton;
    tsFaturaDetalhes: TTabSheet;
    pnFaturasDetalhes: TPanel;
    GroupBox90: TGroupBox;
    DBGrid48: TDBGrid;
    Panel130: TPanel;
    BitBtn191: TBitBtn;
    BitBtn192: TBitBtn;
    BitBtn167: TBitBtn;
    BitBtn193: TBitBtn;
    tsEntSaiModulo: TTabSheet;
    PageControl10: TPageControl;
    TabSheet13: TTabSheet;
    TabSheet14: TTabSheet;
    TabSheet15: TTabSheet;
    PageControl11: TPageControl;
    TabSheet16: TTabSheet;
    TabSheet17: TTabSheet;
    TabSheet18: TTabSheet;
    pnC113Consulta: TPanel;
    GroupBox47: TGroupBox;
    DBGrid19: TDBGrid;
    Panel63: TPanel;
    btNovoC113: TBitBtn;
    btRemoverC113: TBitBtn;
    BitBtn187: TBitBtn;
    pnC113: TPanel;
    pnC113Cadastro: TPanel;
    Label313: TLabel;
    Label321: TLabel;
    Label322: TLabel;
    Label323: TLabel;
    SpeedButton79: TSpeedButton;
    Panel60: TPanel;
    btSalvarC113: TBitBtn;
    btCancelarC113: TBitBtn;
    edNaturezaC113: TComboBox;
    edNumNFC113: TEditHw;
    edSerieC113: TEdit;
    edClForC113: TEditHw;
    edNomeClForC113: TEdit;
    pnNovaRefNFeChave: TPanel;
    GroupBox100: TGroupBox;
    SpeedButton58: TSpeedButton;
    Edit8: TMaskEdit;
    Panel69: TPanel;
    BitBtn188: TBitBtn;
    BitBtn189: TBitBtn;
    TabSheet19: TTabSheet;
    pnNovaRefNFeAvulsa: TPanel;
    GroupBox102: TGroupBox;
    Panel79: TPanel;
    BitBtn62: TBitBtn;
    BitBtn64: TBitBtn;
    BitBtn65: TBitBtn;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    edRefNnf: TEditHw;
    edRefModelo: TEditHw;
    edRefSerie: TEditHw;
    edRefUF: TMaskEdit;
    edRefAAMM: TMaskEdit;
    edRefCNPJ: TMaskEdit;
    pnEntrada: TPanel;
    BitBtn68: TBitBtn;
    BitBtn69: TBitBtn;
    BitBtn70: TBitBtn;
    BitBtn71: TBitBtn;
    edChaveConsultaSefaz: TEdit;
    BitBtn73: TBitBtn;
    BitBtn74: TBitBtn;
    BitBtn87: TBitBtn;
    pnSaida: TPanel;
    BitBtn76: TBitBtn;
    BitBtn80: TBitBtn;
    BitBtn81: TBitBtn;
    BitBtn77: TBitBtn;
    BitBtn84: TBitBtn;
    BitBtn177: TBitBtn;
    TabSheet20: TTabSheet;
    pnEscolhaNFBotoes: TPanel;
    btNF_P: TBitBtn;
    btNF_V: TBitBtn;
    btNF_O: TBitBtn;
    btNF_D: TBitBtn;
    btNF_S: TBitBtn;
    btNF_Voltar: TBitBtn;
    memoInfNotas: TMemo;
    pnEntSaidaNFe: TPanel;
    BitBtn78: TBitBtn;
    BitBtn79: TBitBtn;
    BitBtn82: TBitBtn;
    BitBtn111: TBitBtn;
    BitBtn115: TBitBtn;
    BitBtn157: TBitBtn;
    BitBtn170: TBitBtn;
    pnEscolhaNFBotoesProdServ: TPanel;
    btNF_P_Prod: TBitBtn;
    btNF_P_Serv: TBitBtn;
    btNF_Voltar_ProdServ: TBitBtn;
    memoInfNotasProdServ: TMemo;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edDescANP: TMaskEdit;
    edpGLP: TEditHw;
    edpGNn: TEditHw;
    edpGNi: TEditHw;
    edvPart: TEditHw;
    edoDescANP: TMaskEdit;
    edopGLP: TEditHw;
    edopGNn: TEditHw;
    edopGNi: TEditHw;
    edovPart: TEditHw;
    Label55: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label101: TLabel;
    Label117: TLabel;
    tsOut_EscalaRelevante: TTabSheet;
    pnIPIItens: TPanel;
    Label263: TLabel;
    Label268: TLabel;
    Label270: TLabel;
    lbEnqIPI: TLabel;
    lbCSTIPI: TLabel;
    Label633: TLabel;
    edaliq_ipi: TEditHw;
    edperc_red_ipi: TEditHw;
    edbase_ipi: TEditHw;
    edcenq_ipi_nfe: TEdit;
    edcst_ipi: TMaskEdit;
    edvalor_ipi: TEditHw;
    pnNotaFiscal: TPanel;
    pageDadosNF: TPageControl;
    tsnf_ResumoNota: TTabSheet;
    tsnf_Destinatario: TTabSheet;
    tsnf_Transporte: TTabSheet;
    tsnf_Cobranca: TTabSheet;
    tsnf_Totais: TTabSheet;
    tsnf_InfAdicionais: TTabSheet;
    pnAbaDestinatario: TPanel;
    Label440: TLabel;
    DBEdit107: TDBEdit;
    DBEdit325: TDBEdit;
    DBEdit326: TDBEdit;
    Label465: TLabel;
    DBEdit327: TDBEdit;
    Label616: TLabel;
    DBEdit328: TDBEdit;
    Label634: TLabel;
    DBEdit329: TDBEdit;
    Label635: TLabel;
    DBEdit330: TDBEdit;
    Label636: TLabel;
    DBEdit331: TDBEdit;
    DBLookupComboBox18: TDBLookupComboBox;
    btRefressDest: TSpeedButton;
    btPriorDest: TSpeedButton;
    btNextDest: TSpeedButton;
    pnAbaNotaFiscal: TPanel;
    Label659: TLabel;
    Label638: TLabel;
    Label639: TLabel;
    Label642: TLabel;
    Label643: TLabel;
    Label645: TLabel;
    Label644: TLabel;
    DBEdit332: TDBEdit;
    DBEdit333: TDBEdit;
    DBEdit334: TDBEdit;
    DBEdit335: TDBEdit;
    DBEdit336: TDBEdit;
    DBEdit337: TDBEdit;
    DBEdit338: TDBEdit;
    DBEdit339: TDBEdit;
    DBEdit340: TDBEdit;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit78: TDBEdit;
    ckConsumidorFinal: TDBCheckBox;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label77: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    ednum_nf: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    lkcod_vendedor: TDBLookupComboBox;
    edserie: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit45: TDBEdit;
    edmodelo_nf: TDBEdit;
    DBEdit180: TDBEdit;
    DBEdit279: TDBEdit;
    DBEdit305: TDBEdit;
    dbeHoraEmissao: TDBEdit;
    ckEmissaoPropria: TDBCheckBox;
    lkFinalidade: TDBLookupComboBox;
    Label637: TLabel;
    Label15: TLabel;
    ed_codigo_nop: TDBEdit;
    DBEdit11: TDBEdit;
    ckVerificarMudCFOP: TDBCheckBox;
    pnAbaTotais: TPanel;
    pnAbaTransporte: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit79: TDBEdit;
    lkFrete: TDBLookupComboBox;
    Label640: TLabel;
    Label36: TLabel;
    lbtbase_icm: TLabel;
    lbtvalor_icm: TLabel;
    Label647: TLabel;
    Label648: TLabel;
    Label649: TLabel;
    Label650: TLabel;
    Label651: TLabel;
    Label652: TLabel;
    Label653: TLabel;
    Label654: TLabel;
    lbtvalor_serv: TLabel;
    lbtvalor_desp_pf: TLabel;
    Label657: TLabel;
    Label658: TLabel;
    edtbase_icm: TDBEdit;
    edtvalor_icm: TDBEdit;
    edtbase_icmsub: TDBEdit;
    edtvalor_icmsub: TDBEdit;
    edtvalor_prod: TDBEdit;
    edtvalor_serv: TDBEdit;
    edtvalor_total: TDBEdit;
    edtvalor_frete: TDBEdit;
    edtvalor_seguro: TDBEdit;
    edt_valor_out_desp: TDBEdit;
    edtvalor_ipi: TDBEdit;
    edtvalor_desc: TDBEdit;
    edtvalor_desp_pf: TDBEdit;
    edtvalor_acres_fin: TDBEdit;
    Label660: TLabel;
    edtvicmsufdest: TDBEdit;
    Label662: TLabel;
    edtvfcpufdest: TDBEdit;
    Label663: TLabel;
    edtfcp_vfcp: TDBEdit;
    Label664: TLabel;
    edtfcp_vfcpst: TDBEdit;
    Label666: TLabel;
    edtvalor_ii: TDBEdit;
    Label667: TLabel;
    edtipi_vipidevol: TDBEdit;
    Label668: TLabel;
    edtvtottrib: TDBEdit;
    tsnf_Outras: TTabSheet;
    pnAbaOutras: TPanel;
    pnAbaInfAdicionais: TPanel;
    Label669: TLabel;
    DBMemo1: TDBMemo;
    Splitter11: TSplitter;
    Label670: TLabel;
    DBMemo14: TDBMemo;
    Label671: TLabel;
    Splitter12: TSplitter;
    DBMemo15: TDBMemo;
    tsnf_NFServico: TTabSheet;
    pnAbaNFServico: TPanel;
    ScrollBox6: TScrollBox;
    Label599: TLabel;
    Label600: TLabel;
    Label601: TLabel;
    Label602: TLabel;
    Label603: TLabel;
    Label604: TLabel;
    DBComboBox23: TDBComboBox;
    DBEdit316: TDBEdit;
    DBLookupComboBox14: TDBLookupComboBox;
    DBComboBox24: TDBComboBox;
    DBComboBox25: TDBComboBox;
    Label457: TLabel;
    eddevolucao: TDBComboBox;
    Label592: TLabel;
    edcod_devolucao: TDBEdit;
    Label474: TLabel;
    DBComboBox17: TDBComboBox;
    ednum_ped: TDBEdit;
    Label593: TLabel;
    DBComboBox5: TDBComboBox;
    Label135: TLabel;
    SpeedButton39: TSpeedButton;
    lbCarga: TLabel;
    edcod_carga: TDBEdit;
    lbIRRF: TLabel;
    dbeIRRF: TDBEdit;
    Label456: TLabel;
    Label132: TLabel;
    Label134: TLabel;
    Label133: TLabel;
    DBComboBox19: TDBComboBox;
    DBComboBox1: TDBComboBox;
    _DBComboBox4: TDBComboBox;
    DBComboBox3: TDBComboBox;
    ckfrete_f_nfe2: TDBCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    edtvalor_ii2: TDBEdit;
    edtfcp_vfcpst2: TDBEdit;
    tsnf_Invisivel: TTabSheet;
    PageControl12: TPageControl;
    TabSheet22: TTabSheet;
    pnGrupoCFOPRetorno: TPanel;
    Panel31: TPanel;
    grupoRetorno: TGroupBox;
    Label211: TLabel;
    Label213: TLabel;
    DBEdit127: TDBEdit;
    DBEdit129: TDBEdit;
    BitBtn60: TBitBtn;
    BitBtn66: TBitBtn;
    BitBtn194: TBitBtn;
    btNotaRetorno: TSpeedButton;
    pnAbaCobranca: TPanel;
    TabSheet21: TTabSheet;
    pncadPagamento: TPanel;
    Panel102: TPanel;
    DBGrid55: TDBGrid;
    Panel132: TPanel;
    Panel146: TPanel;
    Label9: TLabel;
    edvpag: TDBEdit;
    lkBandeira: TDBLookupComboBox;
    Label10: TLabel;
    edcaut: TDBEdit;
    Label11: TLabel;
    Panel147: TPanel;
    btpag_salvar: TBitBtn;
    btpag_cancelar: TBitBtn;
    ckfrete_f_nfe: TDBCheckBox;
    ckipi_base_icm: TDBCheckBox;
    ckfrete_base_icm: TDBCheckBox;
    ckfrete_base_ipi: TDBCheckBox;
    cktipo_desconto: TDBCheckBox;
    pageFatDup: TPageControl;
    tsnf_pagamentos: TTabSheet;
    tsnf_fat_dup: TTabSheet;
    Panel148: TPanel;
    Panel33: TPanel;
    btpag_incluir: TBitBtn;
    btpag_alterar: TBitBtn;
    btpag_remover: TBitBtn;
    btpag_sempagamento: TBitBtn;
    Panel76: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label533: TLabel;
    gridpag: TDBGrid;
    pnfat: TPanel;
    Panel161: TPanel;
    Label41: TLabel;
    Label42: TLabel;
    edfat_nfat: TDBEdit;
    Label51: TLabel;
    edfat_vorig: TDBEdit;
    Label52: TLabel;
    edfat_vdesc: TDBEdit;
    Label78: TLabel;
    edfat_vliq: TDBEdit;
    pndup: TPanel;
    Label395: TLabel;
    Panel163: TPanel;
    btfat_alterar: TBitBtn;
    btfat_gerar: TBitBtn;
    btfat_aproveitarpedidos: TBitBtn;
    TabSheet23: TTabSheet;
    pndup_gerar: TPanel;
    Label587: TLabel;
    Label641: TLabel;
    Label646: TLabel;
    lkdup_condpag: TDBLookupComboBox;
    lkdup_controles: TDBLookupComboBox;
    eddup_gerar_valor: TEditHw;
    Panel158: TPanel;
    btdup_cancelar: TBitBtn;
    BitBtn195: TBitBtn;
    groupdup_dadosst: TGroupBox;
    Label656: TLabel;
    Label672: TLabel;
    eddup_gerar_valorst: TEditHw;
    eddup_vencimentost: TMaskEdit;
    eddup_numerost: TMaskEdit;
    Label674: TLabel;
    pndup_alterar: TPanel;
    Panel164: TPanel;
    brdup_salvar: TBitBtn;
    btdu_cancelar2: TBitBtn;
    Label675: TLabel;
    eddup_ndup: TDBEdit;
    Label676: TLabel;
    eddup_dvenc: TDBEdit;
    Label677: TLabel;
    eddup_vdup: TDBEdit;
    btpag_aproveitarpedidos: TBitBtn;
    Label680: TLabel;
    DBEdit2: TDBEdit;
    btEnviarNFe: TBitBtn;
    TabSheet26: TTabSheet;
    pageModuloNFe400: TPageControl;
    TabSheet24: TTabSheet;
    TabSheet25: TTabSheet;
    pnNFeModulo_Enviar: TPanel;
    pnNFeModulo_Enviar_Botoes: TPanel;
    BitBtn72: TBitBtn;
    btNFeAutorizar2: TBitBtn;
    pnNFeModulo_Enviar_Opcoes: TGroupBox;
    ckNFeAutorizacao_print: TCheckBox;
    ckNFeAutorizacao_mail: TCheckBox;
    pnNFeModulo_Imprimir: TPanel;
    pnNFeModulo_Imprimir_Botoes: TPanel;
    BitBtn196: TBitBtn;
    btNFeImprimir2: TBitBtn;
    pnNFeModulo_Imprimir_Opcoes: TGroupBox;
    SpeedButton85: TSpeedButton;
    ckNFeImpressao_print: TCheckBox;
    ckNFeImpressao_pdf: TCheckBox;
    edNFeImpressao_pathPDF: TMaskEdit;
    ckNFeImpressao_onlySel: TCheckBox;
    pnNFeModulo_Email: TPanel;
    Panel168: TPanel;
    BitBtn197: TBitBtn;
    btNFeEmail2: TBitBtn;
    GroupBox107: TGroupBox;
    btNFeEmail_anexar: TSpeedButton;
    Label688: TLabel;
    Label689: TLabel;
    ckNFeEmail_UnicoEmail: TCheckBox;
    ckNFeEmail_comEventos: TCheckBox;
    edNFeEmail_email: TMaskEdit;
    ckNFeEmail_comPDF: TCheckBox;
    lbNFeEmail_anexos: TListBox;
    ckNFeEmail_onlySel: TCheckBox;
    tsModuloNFe400: TTabSheet;
    pnBotoesLabesNFe400: TPanel;
    pnBotoesModuloNFe4: TPanel;
    btNFeAutorizar: TSpeedButton;
    btNFeImprimir: TSpeedButton;
    btNFeEmail: TSpeedButton;
    btNFeEventos: TSpeedButton;
    btNFeInuti: TSpeedButton;
    btNFeConsulta: TSpeedButton;
    btNFeManifestacao: TSpeedButton;
    btNFeVoltar: TSpeedButton;
    btNFeModulo310: TSpeedButton;
    pnNFeInut: TPanel;
    Panel169: TPanel;
    gridNFeInut: TDBGrid;
    Panel170: TPanel;
    edInutAno: TMaskEdit;
    SpeedButton9: TSpeedButton;
    SpeedButton19: TSpeedButton;
    btNFeInut_enviar: TBitBtn;
    btNFeInut_email: TBitBtn;
    btNFeInut_print: TBitBtn;
    btNFeInut_excluir: TBitBtn;
    BitBtn202: TBitBtn;
    BitBtn198: TBitBtn;
    pnNFeInut_cad: TPanel;
    Panel165: TPanel;
    BitBtn199: TBitBtn;
    BitBtn200: TBitBtn;
    Label690: TLabel;
    edInut_serie: TEditHw;
    lbInut: TLabel;
    Label691: TLabel;
    edInut_nnfini: TEditHw;
    Label692: TLabel;
    edInut_nnffin: TEditHw;
    edInut_justificativa: TMaskEdit;
    Label693: TLabel;
    btConfirmarNF: TBitBtn;
    btNFeValidar: TSpeedButton;
    pnNFeModulo_Consulta: TPanel;
    Panel173: TPanel;
    btNFeConsulta2: TBitBtn;
    ckNFeConsulta_onlySel: TCheckBox;
    BitBtn58: TBitBtn;
    pnLabelsNFe: TPanel;
    Label687: TLabel;
    DBText64: TDBText;
    DBText65: TDBText;
    Label686: TLabel;
    Panel171: TPanel;
    Label685: TLabel;
    DBText62: TDBText;
    btNFeServicos: TSpeedButton;
    tsMerc_Outros: TTabSheet;
    tsOut_Outros: TTabSheet;
    pnOutrosDadosItem: TPanel;
    lbRecopi: TLabel;
    ednfe_nrecopi: TEdit;
    Label694: TLabel;
    ednfci: TMaskEdit;
    Label118: TLabel;
    edCBenef: TMaskEdit;
    Label210: TLabel;
    edIndTot: TEdit;
    Panel162: TPanel;
    griddup: TDBGrid;
    Panel172: TPanel;
    DBEdit3: TDBEdit;
    Label119: TLabel;
    lbutrib: TLabel;
    edutrib: TEdit;
    lbqtrib: TLabel;
    edqtrib: TEditHw;
    btfat_verificarimpressao: TBitBtn;
    ckNFeAutorizacao_Bol: TCheckBox;
    ckNFeEmail_comBol: TCheckBox;
    lbpag_total: TLabel;
    lbpag_falta: TLabel;
    DBText63: TDBText;
    DBText66: TDBText;
    Label697: TLabel;
    lkindpag: TDBLookupComboBox;
    SpeedButton21: TSpeedButton;
    tsMerc_ICMS_Entrada: TTabSheet;
    scroll_icm_entrada: TScrollBox;
    pn_icms_entrada: TPanel;
    lb_icment_orig: TLabel;
    lb_icment_cst: TLabel;
    lb_icment_csosn: TLabel;
    ed_icment_orig: TMaskEdit;
    ed_icment_cst: TMaskEdit;
    ed_icment_csosn: TMaskEdit;
    ed_icment_pred: TEditHw;
    ed_icment_vbc: TEditHw;
    ed_icment_picm: TEditHw;
    ed_icment_vicm: TEditHw;
    lb_icment_pred: TLabel;
    lb_icment_vbc: TLabel;
    lb_icment_picm: TLabel;
    lb_icment_vicm: TLabel;
    lb_ret_icm_op: TLabel;
    ed_icment_vbcfcp: TEditHw;
    ed_icment_pfcp: TEditHw;
    ed_icment_vfcp: TEditHw;
    lb_ed_icment_vbcfcp: TLabel;
    lb_icment_pfcp: TLabel;
    lb_icment_vfcp: TLabel;
    lb_ret_fcp_op: TLabel;
    ed_icment_pmvast: TEditHw;
    lb_icment_modbcst: TLabel;
    lb_icment_pmva: TLabel;
    lb_ret_icm_st: TLabel;
    ed_icment_predst: TEditHw;
    ed_icment_vbcst: TEditHw;
    ed_icment_picmst: TEditHw;
    ed_icment_vicmst: TEditHw;
    lb_icment_predst: TLabel;
    lb_icment_vbcst: TLabel;
    lb_icment_picmst: TLabel;
    lb_icment_vicmst: TLabel;
    ed_icment_modbcst: TMaskEdit;
    ed_icment_vbcfcpst: TEditHw;
    ed_icment_pfcpst: TEditHw;
    ed_icment_vfcpst: TEditHw;
    lb_icment_vbcfcpst: TLabel;
    lb_icment_pfcpst: TLabel;
    lb_icment_vfcpst: TLabel;
    fcp_st: TLabel;
    ed_icment_vicmdeson: TEditHw;
    lb_icment_vdeson: TLabel;
    ed_icment_vicmssusbstituto: TEditHw;
    ed_icment_vbcstret: TEditHw;
    ed_icment_pst: TEditHw;
    ed_icment_vicmstret: TEditHw;
    lb_icment_vicmssusbstituto: TLabel;
    lb_icment_vbcstret: TLabel;
    lb_icment_pst: TLabel;
    lb_icment_vicmstret: TLabel;
    lb_ret_retido: TLabel;
    ed_icment_vbcfcpstret: TEditHw;
    ed_icment_pfcpstret: TEditHw;
    ed_icment_vfcpstret: TEditHw;
    lb_icment_vbcfcpstret: TLabel;
    lb_icment_pfcpstret: TLabel;
    lb_icment_vfcpstret: TLabel;
    tsOut_ICMS_Entrada: TTabSheet;
    sp_icment_verdados_out: TSpeedButton;
    sp_icment_verdados: TSpeedButton;
    bt_outras_nf: TSpeedButton;
    ck_tipo_seguro: TDBCheckBox;
    ck_tipo_outdesp: TDBCheckBox;
    ck_tipo_frete: TDBCheckBox;
    lb_rateio_seguro: TLabel;
    ed_rateio_seguro: TEditHw;
    lb_rateio_outdesp: TLabel;
    ed_rateio_outdesp: TEditHw;
    lb_rateio_frete: TLabel;
    ed_rateio_frete: TEditHw;
    lk_finalidadeid: TDBLookupComboBox;
    lb_finalidadeid: TLabel;
    lbt_vicmdeson: TLabel;
    edtvicmdeson: TDBEdit;
    ed_alt_sped_csosn: TDBEdit;
    btNF_ent_pedvenda: TBitBtn;
    pn_entrada_retorno_pedvenda: TPanel;
    lb_entrada_retorno_pedvenda_cst: TLabel;
    lb_entrada_retorno_pedvenda_cfop: TLabel;
    ed_entrada_retorno_pedvenda_cst: TEditHw;
    ed_entrada_retorno_pedvenda_cfop: TEditHw;
    pn_entrada_retorno_pedvenda_botoes: TPanel;
    ed_entrada_retorno_pedvenda_continuar: TBitBtn;
    bt_entrada_retorno_pedvenda_cancel: TBitBtn;
    bt_inf_compl_docref_consulta_voltar: TBitBtn;
    Label698: TLabel;
    ed_altent_data_lanc: TDBEdit;
    SpeedButton29: TSpeedButton;
    OpenDialog2: TOpenDialog;
    btnXMLNFS: TBitBtn;
    pnErrosImportacao: TPanel;
    btErrosImportacao: TBitBtn;
    MemoErrosImportacao: TMemo;
    tsnf_obscont: TTabSheet;
    pn_aba_obscont: TPanel;
    Panel175: TPanel;
    bt_obscont_incluir: TBitBtn;
    bt_obscont_alterar: TBitBtn;
    bt_obscont_remover: TBitBtn;
    grid_obscont: TDBGrid;
    TabSheet27: TTabSheet;
    pncadObsCont: TPanel;
    Panel180: TPanel;
    bt_obscont_salvar: TBitBtn;
    bt_obscont_cancel: TBitBtn;
    Label699: TLabel;
    Label700: TLabel;
    ed_obscont_xcampo: TDBEdit;
    ed_obscont_xtexto: TDBEdit;
    SpeedButton43: TSpeedButton;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    cktot_com_deson: TDBCheckBox;
    tsMaisNFe: TTabSheet;
    pageMaisNFe: TPageControl;
    tsmaisnfe_ide: TTabSheet;
    tsmaisnfe_entregaintermed: TTabSheet;
    tsnf_Coleta: TTabSheet;
    pn_col_ent: TPanel;
    lb_col_nome: TLabel;
    lb_col_cpfcnpj: TLabel;
    lb_col_ie: TLabel;
    lb_col_cep: TLabel;
    lb_col_logradouro: TLabel;
    lb_col_compl: TLabel;
    lb_col_bairro: TLabel;
    lb_col_cidade: TLabel;
    lb_col_fone: TLabel;
    lb_col_email: TLabel;
    lb_col_pais: TLabel;
    sp_col_edit: TSpeedButton;
    sp_col_del: TSpeedButton;
    sp_col_cep: TSpeedButton;
    ed_col_nome: TDBEdit;
    ed_col_cpfcnpj: TDBEdit;
    ed_col_ie: TDBEdit;
    ed_col_cep: TDBEdit;
    ed_col_logradouro: TDBEdit;
    ed_col_nro: TDBEdit;
    ed_col_compl: TDBEdit;
    ed_col_bairro: TDBEdit;
    ed_col_fone: TDBEdit;
    ed_col_email: TDBEdit;
    ed_col_cidade: TDBLookupComboBox;
    ed_col_pais: TDBLookupComboBox;
    tsnf_Entrega: TTabSheet;
    pnmaisnfe_ide: TPanel;
    pnmaisnfe_entregaintermed: TPanel;
    Label681: TLabel;
    lbChave: TLabel;
    Label684: TLabel;
    Label585: TLabel;
    Label682: TLabel;
    Label683: TLabel;
    bt_nfe_verificar_dados_contingencia: TSpeedButton;
    lkAmbiente: TDBLookupComboBox;
    edChave: TDBEdit;
    btConsultaNFe: TBitBtn;
    lkformaEmiss: TDBLookupComboBox;
    ednfe_dhcont: TDBEdit;
    ednfe_xjust: TDBEdit;
    lbIndPres: TLabel;
    lkIndPres: TDBLookupComboBox;
    lb_tipoCalc: TLabel;
    bt_tipo_calc_unlock: TSpeedButton;
    TabSheet28: TTabSheet;
    Panel176: TPanel;
    bt_pc_config: TSpeedButton;
    popItens: TPopupMenu;
    Configurarbasedeclculo1: TMenuItem;
    ConfBC_ICMS: TMenuItem;
    ConfBC_ICMSST: TMenuItem;
    ConfBC_ICMSUFDest: TMenuItem;
    ConfBC_PISCOFINS: TMenuItem;
    ConfBC_IPI: TMenuItem;
    ConfBC_ISSQN: TMenuItem;
    pn_confbc: TPanel;
    gpConfBC: TGroupBox;
    Panel174: TPanel;
    ck_base: TCheckListBox;
    ck_base_hab: TCheckBox;
    BitBtn11: TBitBtn;
    Panel177: TPanel;
    spbDetalharItem: TSpeedButton;
    ed_bc_espelho: TMemo;
    ed_tipoCalc: TComboBox;
    Panel181: TPanel;
    pn_icms_ufdest_tributos: TPanel;
    lb_tipo_calc_4: TLabel;
    Label707: TLabel;
    lbvBCUFDest: TLabel;
    lbpFCPUFDest: TLabel;
    lbpICMSUFDest: TLabel;
    lbpICMSInter: TLabel;
    lbpICMSInterPart: TLabel;
    lbvFCPUFDest: TLabel;
    lbvICMSUFDest: TLabel;
    lbvICMSUFRemet: TLabel;
    eddvBCUFDest: TEditHw;
    eddpFCPUFDest: TEditHw;
    eddpICMSUFDest: TEditHw;
    eddpICMSInter: TEditHw;
    eddpICMSInterPart: TEditHw;
    eddvFCPUFDest: TEditHw;
    eddvICMSUFDest: TEditHw;
    eddvICMSUFRemet: TEditHw;
    bt_calc_run: TSpeedButton;
    bt_alterar_campos_icms: TSpeedButton;
    bt_alterar_campos_icms_ufdest: TSpeedButton;
    bt_calc_run2: TSpeedButton;
    pn_icms_tributos_cst: TPanel;
    Label261: TLabel;
    eddCST: TEditHw;
    eddCSOSN: TEditHw;
    tsMerc_itens_outras: TTabSheet;
    ScrollBox11: TScrollBox;
    Panel28: TPanel;
    Label238: TLabel;
    Label248: TLabel;
    Label247: TLabel;
    Label240: TLabel;
    Label241: TLabel;
    Label244: TLabel;
    Label242: TLabel;
    Label615: TLabel;
    Label679: TLabel;
    lbo_rateio_seguro: TLabel;
    lbo_rateio_outdesp: TLabel;
    lbo_rateio_frete: TLabel;
    edOnCodigo: TEdit;
    edOnReferencia: TEdit;
    edOnQtde: TEditHw;
    edOnValorUnitario: TEditHw;
    edo_rateio_desconto: TEditHw;
    edo_valor_total: TEditHw;
    edOnNCM: TEdit;
    edoCEST: TMaskEdit;
    edocean: TMaskEdit;
    edo_rateio_seguro: TEditHw;
    edo_rateio_outdesp: TEditHw;
    edo_rateio_frete: TEditHw;
    edOnDescricaoOutras: TMemo;
    btIncluirItemOutrasNf: TBitBtn;
    btAlterarItensOutrasNf: TBitBtn;
    edt_vpisdeson: TDBEdit;
    Label665: TLabel;
    Label661: TLabel;
    edt_vcofins_deson: TDBEdit;
    ScrollBox13: TScrollBox;
    Panel178: TPanel;
    Label732: TLabel;
    bt_calc_piscofins_run: TSpeedButton;
    bt_alterar_campos_piscofins: TSpeedButton;
    pn_piscofins_tributos: TPanel;
    Panel182: TPanel;
    gb_pis_aliq: TGroupBox;
    Label711: TLabel;
    Label713: TLabel;
    ed_ppis: TEditHw;
    ed_pis_vbc: TEditHw;
    GroupBox111: TGroupBox;
    Label723: TLabel;
    ed_vpis: TEditHw;
    gb_pis_qtde: TGroupBox;
    Label721: TLabel;
    Label722: TLabel;
    ed_pis_valiq: TEditHw;
    ed_pis_qbc: TEditHw;
    Panel183: TPanel;
    gb_cofins_aliq: TGroupBox;
    Label724: TLabel;
    Label725: TLabel;
    ed_pcofins: TEditHw;
    ed_cofins_vbc: TEditHw;
    GroupBox113: TGroupBox;
    Label726: TLabel;
    ed_vcofins: TEditHw;
    gb_cofins_qtde: TGroupBox;
    Label727: TLabel;
    Label728: TLabel;
    ed_cofins_valiq: TEditHw;
    ed_cofins_qbc: TEditHw;
    GroupBox115: TGroupBox;
    Label730: TLabel;
    Label729: TLabel;
    Label731: TLabel;
    ed_piscofins_motivo_deson: TDBLookupComboBox;
    ed_vpisdeson: TEditHw;
    ed_vcofinsdeson: TEditHw;
    GroupBox93: TGroupBox;
    lb_cst_pis: TLabel;
    Label720: TLabel;
    ed_piscofins_cst: TMaskEdit;
    ed_piscofins_nat_rec: TMaskEdit;
    Panel179: TPanel;
    Label462: TLabel;
    Label463: TLabel;
    Label464: TLabel;
    bt_it_pc_alterar_aliq_perc: TSpeedButton;
    Label466: TLabel;
    Label467: TLabel;
    Label606: TLabel;
    eddAliqPIS: TEditHw;
    eddBasePIS: TEditHw;
    eddCSTPIS: TComboBox;
    eddValorPIS: TEditHw;
    eddAliqCOFINS: TEditHw;
    eddValorCOFINS: TEditHw;
    lb_tipo_calc_5: TLabel;
    pn_iss_tributos: TPanel;
    Label334: TLabel;
    Label335: TLabel;
    Label708: TLabel;
    eddAliqISS: TEditHw;
    eddBaseISS: TEditHw;
    edvalor_iss: TEditHw;
    gb_cst_iss: TPanel;
    Label709: TLabel;
    bt_calc_iss_run: TSpeedButton;
    bt_alterar_campos_iss: TSpeedButton;
    SpeedButton41: TSpeedButton;
    ed_conf_isuf: TDBLookupComboBox;
    Label710: TLabel;
    Label712: TLabel;
    ed_vtot_trib: TEditHw;
    edtbase_icm_sn: TDBEdit;
    Label733: TLabel;
    edtvalor_icm_sn: TDBEdit;
    Label734: TLabel;
    lb_icm_pdif: TLabel;
    Label715: TLabel;
    ed_icm_pdif: TEditHw;
    lb_icm_vdif: TLabel;
    ed_icm_vdif: TEditHw;
    lb_icm_vicmop_dif: TLabel;
    ed_icm_vicmop_dif: TEditHw;
    lb_icm_fcp_pdif: TLabel;
    ed_icm_fcp_pdif: TEditHw;
    lb_icm_fcp_vdif: TLabel;
    ed_icm_fcp_vdif: TEditHw;
    lb_icm_fcp_vfcpop: TLabel;
    ed_icm_fcp_vfcpop: TEditHw;
    Panel184: TPanel;
    SpeedButton81: TSpeedButton;
    Label673: TLabel;
    ed_tipoCalcPC: TComboBox;
    bt_tipo_calc_pc_unlock: TSpeedButton;
    lbCEST: TLabel;
    eddCEST: TMaskEdit;
    Panel499: TPanel;
    Alterarvariositens1: TMenuItem;
    AntecipaotributriadeICMS1: TMenuItem;
    EspelhoclculoICMS1: TMenuItem;
    memo_espelho_calc: TMemo;
    lb_ent_grade_prod: TLabel;
    lb_ent_grade_dados: TLabel;
    ed_xpag: TDBEdit;
    Label655: TLabel;
    tsnf_compra: TTabSheet;
    Panel185: TPanel;
    Label737: TLabel;
    Label739: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label735: TLabel;
    DBEdit8: TDBEdit;
    Label736: TLabel;
    ed_indSomaPISST: TEdit;
    ed_indSomaCOFINSST: TEdit;
    Label738: TLabel;
    Label740: TLabel;
    edcBarra: TMaskEdit;
    btmanutencaoRenave: TBitBtn;
    lbManutencaoRenave: TLabel;
    SpeedButton82: TSpeedButton;
    ck_tipo_desppf: TDBCheckBox;
    Label742: TLabel;
    ed_rateio_desp_pf: TEditHw;
    Panel186: TPanel;
    Panel187: TPanel;
    BitBtn16: TBitBtn;
    BitBtn40: TBitBtn;
    ComboBox4: TComboBox;
    CheckBox17: TCheckBox;
    Label743: TLabel;
    edmed_cprodanvisa: TMaskEdit;
    Label744: TLabel;
    edmed_vpmc: TEditHw;
    GroupBox8: TGroupBox;
    Label745: TLabel;
    edrastro_nlote: TEdit;
    Label746: TLabel;
    edrastro_qlote: TEditHw;
    Label747: TLabel;
    Label748: TLabel;
    edrastro_dfab: TMaskEdit;
    edrastro_dval: TMaskEdit;
    SpeedButton83: TSpeedButton;
    SpeedButton84: TSpeedButton;
    tsnf_retencao: TTabSheet;
    panel_retencao: TPanel;
    Label749: TLabel;
    Label750: TLabel;
    Label751: TLabel;
    Label759: TLabel;
    Label760: TLabel;
    Label762: TLabel;
    Label769: TLabel;
    Label770: TLabel;
    Label771: TLabel;
    Label772: TLabel;
    Label773: TLabel;
    DBEdit10: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit81: TDBEdit;
    DBComboBox4: TDBComboBox;
    DBComboBox20: TDBComboBox;
    DBComboBox26: TDBComboBox;
    DBComboBox27: TDBComboBox;
    Label752: TLabel;
    Alterardatadeemisso1: TMenuItem;
    pg_icms_tributos: TPageControl;
    tab_icms_tributos: TTabSheet;
    tab_icms_tributos_mono: TTabSheet;
    pn_icms_tributos: TPanel;
    gb_item_icms_op: TGroupBox;
    Label516: TLabel;
    Label266: TLabel;
    Label267: TLabel;
    Label272: TLabel;
    lb_valor_icm: TLabel;
    eddAliqICM: TEditHw;
    eddReducaoBaseICM: TEditHw;
    eddBaseICM: TEditHw;
    eddModBC: TComboBox;
    eddvalor_icm: TEditHw;
    gb_item_icms_desoneracao: TGroupBox;
    lb_vicmdeson: TLabel;
    Label706: TLabel;
    lkDesoneracao: TDBLookupComboBox;
    eddvicmdeson: TEditHw;
    gb_item_icms_st: TGroupBox;
    Label269: TLabel;
    Label271: TLabel;
    Label273: TLabel;
    Label279: TLabel;
    Label296: TLabel;
    Label580: TLabel;
    Label605: TLabel;
    Label337: TLabel;
    btAbsorverICMSST: TSpeedButton;
    eddAliqICMSub: TEditHw;
    eddBaseICMSub: TEditHw;
    eddMVA: TEditHw;
    eddReducaoBaseICMSub: TEditHw;
    eddValorICMSST: TEditHw;
    eddModBCST: TComboBox;
    eddAntT: TEdit;
    eddValorDif: TEditHw;
    ckdAnt_calc: TCheckBox;
    gpICMSEfetivoItens: TGroupBox;
    Label628: TLabel;
    Label695: TLabel;
    Label696: TLabel;
    Label614: TLabel;
    edpicmsefet: TEditHw;
    edpredbcefet: TEditHw;
    edvbcefet: TEditHw;
    edvicmsefet: TEditHw;
    pnFCPItens: TPanel;
    GroupBox104: TGroupBox;
    Label629: TLabel;
    Label630: TLabel;
    Label631: TLabel;
    edpfcpst: TEditHw;
    edvbcfcpst: TEditHw;
    edvfcpst: TEditHw;
    GroupBox103: TGroupBox;
    Label121: TLabel;
    Label129: TLabel;
    Label131: TLabel;
    edpfcp: TEditHw;
    edvbcfcp: TEditHw;
    edvfcp: TEditHw;
    gpICMSAnterior: TGroupBox;
    lb_ret_vicmssubstituto: TLabel;
    lb_base_icmant_sub: TLabel;
    lb_ret_pst: TLabel;
    lb_valor_icmant_sub: TLabel;
    lb_fcp_vbcfcpstret: TLabel;
    lb_fcp_pfcpstret: TLabel;
    lb_fcp_vfcpstret: TLabel;
    ed_ant_vicmssubstituto: TEditHw;
    ed_base_icmant_sub: TEditHw;
    ed_ant_pst: TEditHw;
    ed_valor_icmant_sub: TEditHw;
    ed_fcp_vbcfcpstret: TEditHw;
    ed_fcp_pfcpstret: TEditHw;
    ed_fcp_vfcpstret: TEditHw;
    gb_item_icms_diferido: TPanel;
    GroupBox109: TGroupBox;
    Label714: TLabel;
    lb_dif_vicmsop: TLabel;
    Label716: TLabel;
    ed_pdif: TEditHw;
    ed_dif_vicmsop: TEditHw;
    ed_vicmsdif: TEditHw;
    gp_fcp_diferido: TGroupBox;
    Label717: TLabel;
    Label718: TLabel;
    Label719: TLabel;
    ed_pfcpdif: TEditHw;
    ed_dif_vfcpefet: TEditHw;
    ed_vfcpdif: TEditHw;
    pn_icms_tributos_mono: TPanel;
    gb_icms_tributos_mono: TGroupBox;
    Label753: TLabel;
    Label754: TLabel;
    Label756: TLabel;
    ed_qbcmono: TEditHw;
    ed_adremicms: TEditHw;
    ed_vicmsmono: TEditHw;
    gb_icms_tributos_mono_reten: TGroupBox;
    Label755: TLabel;
    Label757: TLabel;
    Label758: TLabel;
    ed_qbcmonoreten: TEditHw;
    ed_adremicmsreten: TEditHw;
    ed_vicmsmonoreten: TEditHw;
    gb_icms_tributos_mono_ret: TGroupBox;
    Label761: TLabel;
    Label763: TLabel;
    Label764: TLabel;
    ed_qbcmonoret: TEditHw;
    ed_adremicmsret: TEditHw;
    ed_vicmsmonoret: TEditHw;
    Label765: TLabel;
    DBEdit28: TDBEdit;
    Label766: TLabel;
    DBEdit29: TDBEdit;
    Label767: TLabel;
    DBEdit31: TDBEdit;
    Label768: TLabel;
    DBEdit32: TDBEdit;
    Label774: TLabel;
    DBEdit33: TDBEdit;
    Label775: TLabel;
    DBEdit34: TDBEdit;
    bt_icms_tributos_mono_info: TSpeedButton;
    lb_vicmsmono_un: TLabel;
    Label776: TLabel;
    Label777: TLabel;
    Label778: TLabel;
    Label779: TLabel;
    ed_icm_adremicms: TEditHw;
    ed_icm_qbcmono: TEditHw;
    ed_icm_vicmsmono: TEditHw;
    Label780: TLabel;
    Label781: TLabel;
    Label782: TLabel;
    Label783: TLabel;
    ed_icm_adremicmsreten: TEditHw;
    ed_icm_qbcmonoreten: TEditHw;
    ed_icm_vicmsmonoreten: TEditHw;
    Label784: TLabel;
    Label785: TLabel;
    Label786: TLabel;
    Label787: TLabel;
    ed_icm_adremicmsret: TEditHw;
    ed_icm_qbcmonoret: TEditHw;
    ed_icm_vicmsmonoret: TEditHw;
    CheckListEtiq: TCheckListBox;
    ckNFeAutorizacao_onlySel: TCheckBox;
    cbNFeAutorizacao_tipoDanfe: TComboBox;
    cbNFeImpressao_tipoDanfe: TComboBox;
    pnNFeModulo_Imprimir_Etiq: TPanel;
    CheckListEtiq2: TCheckListBox;
    btNFeImprimirEtq2: TBitBtn;
    edUndVnd: TComboBox;
    bt_popmenu_und: TSpeedButton;
    lbUndVnd: TLabel;
    bt_info_und_xml: TSpeedButton;
    N1: TMenuItem;
    CriarconversodoXMLeapplicarsobreQtde1: TMenuItem;
    Aplicarfatordeconversoutilizandoaquantidade1: TMenuItem;
    DefinirquandoaentradaXMLforiguala1: TMenuItem;
    lbDadosCertificado: TLabel;
    GroupBoxManifestacao: TGroupBox;
    ScrollBoxManifestacao: TScrollBox;
    PopupMenuManifestacao: TPopupMenu;
    ConfigurarcolunasManifestacao: TMenuItem;
    ResetarConfiguraesdecolunasManifestacao: TMenuItem;
    SalvardadosnoExcelManifestacao: TMenuItem;
    ReajustarLarguradascolunasManifestacao: TMenuItem;
    CopiarparareadetransfernciaManifestacao: TMenuItem;
    SomarvaloresdacolunaManifestacao: TMenuItem;
    PanelStatusNFfechadaManifestacao: TPanel;
    PanelStatusNFabertoManifestacao: TPanel;
    ts_Merc_Retencoes_federais: TTabSheet;
    ScrollBox12: TScrollBox;
    Panel166: TPanel;
    Label788: TLabel;
    bt_calc_retencoes_run: TSpeedButton;
    bt_alterar_campos_retencoes: TSpeedButton;
    bt_tipo_calc_ret_unlock: TSpeedButton;
    ed_tipoCalcRet: TComboBox;
    pn_ret_bc: TPanel;
    GroupBox94: TGroupBox;
    ed_vbcretfed: TEditHw;
    Panel167: TPanel;
    GroupBox95: TGroupBox;
    Label790: TLabel;
    Label791: TLabel;
    ed_pretir: TEditHw;
    ed_vretir: TEditHw;
    GroupBox105: TGroupBox;
    Label792: TLabel;
    Label793: TLabel;
    ed_pretcsll: TEditHw;
    ed_vretcsll: TEditHw;
    GroupBox106: TGroupBox;
    Label789: TLabel;
    Label794: TLabel;
    ed_pretpis: TEditHw;
    ed_vretpis: TEditHw;
    GroupBox108: TGroupBox;
    Label795: TLabel;
    Label796: TLabel;
    ed_pretcofins: TEditHw;
    ed_vretcofins: TEditHw;
    Label797: TLabel;
    ed_retfed: TDBLookupComboBox;
    N2: TMenuItem;
    NfAreaDeTransferenciaMenuEscolherCopiar1: TMenuItem;
    Ativarseleomultipladenotasparacpia1: TMenuItem;
    NfAreaDeTransferenciaMenuCopiarItens1: TMenuItem;
    NfAreaDeTransferenciaMenuVisualizar1: TMenuItem;
    ItensAreaDeTransferenciaMenu1: TMenuItem;
    ItensAreaDeTransferenciaMenuColaritens1: TMenuItem;
    ItensAreaDeTransferenciaMenuCopiaritens1: TMenuItem;
    ItensAreaDeTransferenciaMenuVisualizar1: TMenuItem;
    N3: TMenuItem;
    ItensAreaDeTransferenciaMenuItemCopiaritem1: TMenuItem;
    N4: TMenuItem;
    ItensAreaDeTransferenciaMenuLimpar1: TMenuItem;
    NfAreaDeTransferenciaMenu1: TMenuItem;
    N5: TMenuItem;
    NfAreaDeTransferenciaMenuColaritens1: TMenuItem;
    N6: TMenuItem;
    NfAreaDeTransferenciaMenuLimpar1: TMenuItem;
    pnEstoqueItemNfSaida: TPanel;
    Label798: TLabel;
    lbEstoqueItemNfSaida: TLabel;
    DevolucaodeNotaFiscal1: TMenuItem;
    DevolucaodeNotaFiscalParcial1: TMenuItem;
    N7: TMenuItem;
    DevolucaodeNotaFiscalViafuncionalidadedecpias1: TMenuItem;
    N8: TMenuItem;
    Criarconversao11paraitemselecionado1: TMenuItem;
    Criarconversao11paratodositenssemconversodefinida1: TMenuItem;
    Verificaritenscomconversoexistente1: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Panel188: TPanel;
    Label705: TLabel;
    lb_tipo_calc_1: TLabel;
    bt_calc_ipi_run: TSpeedButton;
    bt_alterar_campos_ipi: TSpeedButton;
    pnIPIItensDados: TPanel;
    Label437: TLabel;
    edipi_cnpjprod: TMaskEdit;
    Label438: TLabel;
    edipi_cselo: TMaskEdit;
    Label439: TLabel;
    edipi_qselo: TEditHw;
    lbxPedCliDisponiveis: TListBox;
    Label805: TLabel;
    tsnf_agropecuario: TTabSheet;
    pn_aba_agronegocio: TPanel;
    page_agronegocio: TPageControl;
    tsnf_agro_defensivo: TTabSheet;
    Panel190: TPanel;
    Panel191: TPanel;
    bt_defensivo_incluir: TBitBtn;
    bt_defensivo_alterar: TBitBtn;
    bt_defensivo_remover: TBitBtn;
    grid_defensivos: TDBGrid;
    tsnf_agro_guiatransito: TTabSheet;
    Panel193: TPanel;
    TabSheet29: TTabSheet;
    pn_cad_agro_defensivo: TPanel;
    Label806: TLabel;
    Label807: TLabel;
    Panel192: TPanel;
    bt_agro_salvar: TBitBtn;
    BitBtn204: TBitBtn;
    ed_agro_nreceituario: TDBEdit;
    ed_agro_cpfresptec: TDBEdit;
    pn_agro_guiatransito: TPanel;
    pn_guiatr_cadastro: TPanel;
    bt_guiatr_salvar: TBitBtn;
    BitBtn206: TBitBtn;
    pn_guiatr_consulta: TPanel;
    bt_guiatr_alterar: TBitBtn;
    bt_guiatr_remover: TBitBtn;
    pn_agro_de_campos: TPanel;
    Label808: TLabel;
    Label809: TLabel;
    ed_agro_ufguia: TDBEdit;
    ed_agro_tpguia: TDBLookupComboBox;
    ed_agro_serieguia: TDBEdit;
    Label810: TLabel;
    ed_agro_nguia: TDBEdit;
    Label811: TLabel;
    GroupBox110: TGroupBox;
    Label120: TLabel;
    Label632: TLabel;
    edindEscala: TMaskEdit;
    edCNPJFab: TMaskEdit;
    GroupBox112: TGroupBox;
    Label812: TLabel;
    Label813: TLabel;
    edChaveNFeRef: TMaskEdit;
    edNitemNFeRef: TEditHw;
    Label814: TLabel;
    ed_icment_nitem_xml: TEditHw;
    SpeedButton86: TSpeedButton;
    SpeedButton87: TSpeedButton;
    tsnf_itens: TTabSheet;
    Label54: TLabel;
    DBEdit39: TDBEdit;
    Label817: TLabel;
    DBEdit80: TDBEdit;
    lbidLocalDestOperacao: TLabel;
    lkIdDest: TDBLookupComboBox;
    Label816: TLabel;
    ed_cmunfg: TDBLookupComboBox;
    Label819: TLabel;
    ed_cmunfgibs: TDBLookupComboBox;
    Label818: TLabel;
    DBEdit222: TDBEdit;
    GroupBox114: TGroupBox;
    Label701: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label702: TLabel;
    SpeedButton44: TSpeedButton;
    DBEdit4: TDBEdit;
    Label704: TLabel;
    DBEdit5: TDBEdit;
    Label703: TLabel;
    ed_VBCIBSCBS: TDBEdit;
    Label820: TLabel;
    ed_VIBSUF: TDBEdit;
    Label821: TLabel;
    ed_VIBSMUN: TDBEdit;
    Label822: TLabel;
    ed_VIBS: TDBEdit;
    Label823: TLabel;
    ed_VCBS: TDBEdit;
    Label824: TLabel;
    ed_VIS: TDBEdit;
    Label825: TLabel;
    ed_VNFTOT: TDBEdit;
    Label826: TLabel;
    ed_VIBSMONO: TDBEdit;
    Label827: TLabel;
    ed_VCBSMONO: TDBEdit;
    Label828: TLabel;
    ed_VIBSMONORETEN: TDBEdit;
    Label829: TLabel;
    ed_VCBSMONORETEN: TDBEdit;
    Label830: TLabel;
    ed_VIBSMONORET: TDBEdit;
    Label831: TLabel;
    ed_VCBSMONORET: TDBEdit;
    Label832: TLabel;
    ed_VIBSESTCRED: TDBEdit;
    Label833: TLabel;
    ed_VCBSESTCRED: TDBEdit;
    Label834: TLabel;
    ed_IBSUF_VDIF: TDBEdit;
    Label835: TLabel;
    ed_IBSUF_VDEVTRIB: TDBEdit;
    Label836: TLabel;
    ed_IBSMUN_VDIF: TDBEdit;
    Label837: TLabel;
    ed_IBSMUN_VDEVTRIB: TDBEdit;
    Label838: TLabel;
    ed_IBS_VCREDPRES: TDBEdit;
    Label839: TLabel;
    ed_IBS_VCREDPRESCONDSUS: TDBEdit;
    Label840: TLabel;
    ed_CBS_VDIF: TDBEdit;
    Label841: TLabel;
    ed_CBS_VDEVTRIB: TDBEdit;
    Label842: TLabel;
    ed_CBS_VCREDPRES: TDBEdit;
    Label843: TLabel;
    ed_CBS_VCREDPRESCONDSUS: TDBEdit;
    tsMerc_IBSCBS: TTabSheet;
    tsMerc_IS: TTabSheet;
    ScrollBoxIbsCbsFrameProd: TScrollBox;
    Label844: TLabel;
    lkIdDestMais: TDBLookupComboBox;
    edPickerOpInterna: TComboboxEntityPickerFrame;
    lbOpInterna: TLabel;
    FrameIbsCbs1: TFrameIbsCbs;
    MainMenu1: TMainMenu;
    pnItensVeiculos: TPanel;
    pnConsultaItensVeiculos: TPanel;
    DBGrid35: TDBGrid;
    Panel119: TPanel;
    Panel120: TPanel;
    SpeedButton50: TSpeedButton;
    BitBtn124: TBitBtn;
    BitBtn130: TBitBtn;
    BitBtn134: TBitBtn;
    pnCadastroItensVeiculos: TPanel;
    Panel17: TPanel;
    Panel78: TPanel;
    Panel73: TPanel;
    btDetalhesVeiculo: TBitBtn;
    BitBtn83: TBitBtn;
    Panel22: TPanel;
    btAlterarItemVeiculo: TBitBtn;
    btCancelarItemVeiculo: TBitBtn;
    btSalvarItemVeiculo: TBitBtn;
    Panel121: TPanel;
    SpeedButton51: TSpeedButton;
    SpeedButton52: TSpeedButton;
    SpeedButton53: TSpeedButton;
    pageItensVeiculos: TPageControl;
    tsVeic_Item: TTabSheet;
    tsVeic_IBSCBS: TTabSheet;
    ScrollBox7: TScrollBox;
    pnItensVeiculo: TPanel;
    Label86: TLabel;
    Label89: TLabel;
    Label87: TLabel;
    Label180: TLabel;
    Label181: TLabel;
    Label182: TLabel;
    Label183: TLabel;
    Label184: TLabel;
    Label185: TLabel;
    Label88: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label94: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label177: TLabel;
    Label95: TLabel;
    Label84: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label96: TLabel;
    Label479: TLabel;
    Label529: TLabel;
    Label530: TLabel;
    Label531: TLabel;
    Label532: TLabel;
    lbModBCST: TLabel;
    lbvPercMercDevol: TLabel;
    lbvVLIPIDevol: TLabel;
    Label627: TLabel;
    DBEdit52: TDBEdit;
    DBComboBox2: TDBComboBox;
    DBEdit53: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit65: TDBEdit;
    DBEdit66: TDBEdit;
    DBEdit94: TDBEdit;
    DBEdit95: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    DBEdit60: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit61: TDBEdit;
    DBEdit96: TDBEdit;
    DBEdit97: TDBEdit;
    DBEdit98: TDBEdit;
    DBEdit261: TDBEdit;
    DBEdit265: TDBEdit;
    DBEdit272: TDBEdit;
    DBEdit273: TDBEdit;
    DBEdit274: TDBEdit;
    dbcbVeicModBCST: TDBComboBox;
    dbevPercMercDevol: TDBEdit;
    dbevVLIPIDEVOL: TDBEdit;
    DBEdit323: TDBEdit;
    pnItemVeicPisCofins: TPanel;
    Label799: TLabel;
    Label800: TLabel;
    Label801: TLabel;
    Label802: TLabel;
    Label803: TLabel;
    Label804: TLabel;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit47: TDBEdit;
    DBEdit49: TDBEdit;
    ScrollBoxIbsCbsFrameVeic: TScrollBox;
    tsDetItem_IBSCBS: TTabSheet;
    ScrollBoxIbsCbsFrameDetItemNF: TScrollBox;
    Splitter13: TSplitter;
    pnCadastroItensDespesa: TPanel;
    pageItensDespesas: TPageControl;
    tsDesp_Item: TTabSheet;
    tsDesp_IBSCBS: TTabSheet;
    ScrollBoxIbsCbsFrameDesp: TScrollBox;
    ScrollBoxCamposDespesa: TScrollBox;
    Panel82: TPanel;
    btCancelarItensDespesa: TBitBtn;
    btSalvarItensDespesa: TBitBtn;
    pnCamposItensDespesa: TPanel;
    Label406: TLabel;
    Label407: TLabel;
    Label408: TLabel;
    Label409: TLabel;
    Label410: TLabel;
    Label411: TLabel;
    Label412: TLabel;
    Label413: TLabel;
    Label397: TLabel;
    Label398: TLabel;
    Label399: TLabel;
    Label400: TLabel;
    Label741: TLabel;
    DBEdit42: TDBEdit;
    DBEdit62: TDBEdit;
    DBEdit82: TDBEdit;
    DBEdit83: TDBEdit;
    DBEdit84: TDBEdit;
    DBEdit204: TDBEdit;
    DBEdit205: TDBEdit;
    DBEdit206: TDBEdit;
    DBEdit207: TDBEdit;
    DBEdit208: TDBEdit;
    DBEdit209: TDBEdit;
    DBEdit210: TDBEdit;
    DBEdit9: TDBEdit;
    ckIgnorarTributosRTC: TDBCheckBox;
    pnItensEspecificos: TPanel;
    Label678: TLabel;
    Label278: TLabel;
    edcean: TMaskEdit;
    eddValidade: TMaskEdit;
    eddNCM: TEdit;
    Label264: TLabel;
    pnItensEspecificosProd: TPanel;
    pnItensEspecificosServ: TPanel;
    Label845: TLabel;
    ed_nbs: TEdit;
    pnPrecoVenda: TPanel;
    Label586: TLabel;
    Label584: TLabel;
    eddPrecoVendaVarejo: TEditHw;
    eddPrecoVendaAtacado: TEditHw;
    btEditGrade: TSpeedButton;
    sp_ibscbsent_verdados: TSpeedButton;
    Label846: TLabel;
    lkFormatoDANFe: TDBLookupComboBox;
    tsmaisnfe_mensagenssefaz: TTabSheet;
    edMemoAlertasSefaz: TMemo;
    Label815: TLabel;
    DBEdit50: TDBEdit;
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure lkFormatoDANFeExit(Sender: TObject);
    procedure sp_ibscbsent_verdadosClick(Sender: TObject);
    procedure pageItensDespesasChange(Sender: TObject);
    procedure pageDetalhesItensNFChange(Sender: TObject);
    procedure pageItensVeiculosChange(Sender: TObject);
    procedure SpeedButton87Click(Sender: TObject);
    procedure SpeedButton86Click(Sender: TObject);
    procedure bt_guiatr_salvarClick(Sender: TObject);
    procedure bt_guiatr_removerClick(Sender: TObject);
    procedure bt_guiatr_alterarClick(Sender: TObject);
    procedure bt_defensivo_removerClick(Sender: TObject);
    procedure bt_defensivo_alterarClick(Sender: TObject);
    procedure bt_defensivo_incluirClick(Sender: TObject);
    procedure pn_aba_agronegocioEnter(Sender: TObject);
    procedure bt_agro_salvarClick(Sender: TObject);
    procedure lbxPedCliDisponiveisDblClick(Sender: TObject);
    procedure tsMerc_PedidoClienteEnter(Sender: TObject);
    procedure bt_alterar_campos_ipiClick(Sender: TObject);
    procedure DBEdit40Exit(Sender: TObject);
    procedure DBEdit49Exit(Sender: TObject);
    procedure Verificaritenscomconversoexistente1Click(Sender: TObject);
    procedure Criarconversao11paratodositenssemconversodefinida1Click(
      Sender: TObject);
    procedure Criarconversao11paraitemselecionado1Click(Sender: TObject);
    procedure ItensAreaDeTransferenciaMenuLimpar1Click(Sender: TObject);
    procedure ItensAreaDeTransferenciaMenuItemCopiaritem1Click(Sender: TObject);
    procedure ItensAreaDeTransferenciaMenuCopiaritens1Click(Sender: TObject);
    procedure ItensAreaDeTransferenciaMenuVisualizar1Click(Sender: TObject);
    procedure ItensAreaDeTransferenciaMenuColaritens1Click(Sender: TObject);
    procedure NfAreaDeTransferenciaMenuColaritens1Click(Sender: TObject);
    procedure NfAreaDeTransferenciaMenuVisualizar1Click(Sender: TObject);
    procedure Ativarseleomultipladenotasparacpia1Click(Sender: TObject);
    procedure NfAreaDeTransferenciaMenuEscolherCopiar1Click(Sender: TObject);
    procedure bt_alterar_campos_retencoesClick(Sender: TObject);
    procedure bt_tipo_calc_ret_unlockClick(Sender: TObject);
    procedure ed_tipoCalcRetExit(Sender: TObject);
    procedure DBGridManifestacaoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure SomarvaloresdacolunaManifestacaoClick(Sender: TObject);
    procedure CopiarparareadetransfernciaManifestacaoClick(Sender: TObject);
    procedure ReajustarLarguradascolunasManifestacaoClick(Sender: TObject);
    procedure SalvardadosnoExcelManifestacaoClick(Sender: TObject);
    procedure ResetarConfiguraesdecolunasManifestacaoClick(Sender: TObject);
    procedure ConfigurarcolunasManifestacaoClick(Sender: TObject);
    procedure DBGridManifestacaoColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure ScrollBoxManifestacaoEnter(Sender: TObject);
    procedure DefinirquandoaentradaXMLforiguala1Click(Sender: TObject);
    procedure Aplicarfatordeconversoutilizandoaquantidade1Click(
      Sender: TObject);
    procedure CriarconversodoXMLeapplicarsobreQtde1Click(Sender: TObject);
    procedure PopupMenu4Popup(Sender: TObject);
    procedure bt_info_und_xmlClick(Sender: TObject);
    procedure bt_popmenu_undClick(Sender: TObject);
    procedure eddVLREMBNFExit(Sender: TObject);
    procedure eddQTDEMBRECExit(Sender: TObject);
    procedure eddValorTotalExit(Sender: TObject);
    procedure eddValorUnitarioExit(Sender: TObject);
    procedure edUndVndChange(Sender: TObject);
    procedure edUndVndEnter(Sender: TObject);
    procedure btNFeImprimirEtq2Click(Sender: TObject);
    procedure ed_vicmsmonoretExit(Sender: TObject);
    procedure bt_icms_tributos_mono_infoClick(Sender: TObject);
    procedure Alterardatadeemisso1Click(Sender: TObject);
    procedure SpeedButton84Click(Sender: TObject);
    procedure SpeedButton83Click(Sender: TObject);
    procedure SpeedButton82Click(Sender: TObject);
    procedure btmanutencaoRenaveClick(Sender: TObject);
    procedure EspelhoclculoICMS1Click(Sender: TObject);
    procedure AntecipaotributriadeICMS1Click(Sender: TObject);
    procedure Alterarvariositens1Click(Sender: TObject);
    procedure bt_tipo_calc_pc_unlockClick(Sender: TObject);
    procedure ed_tipoCalcPCExit(Sender: TObject);
    procedure bt_alterar_campos_issClick(Sender: TObject);
    procedure tsMerc_itens_outrasEnter(Sender: TObject);
    procedure lb_cst_pisDblClick(Sender: TObject);
    procedure ed_cofins_vbcExit(Sender: TObject);
    procedure ed_pis_vbcExit(Sender: TObject);
    procedure ed_cofins_qbcExit(Sender: TObject);
    procedure ed_pis_qbcExit(Sender: TObject);
    procedure ed_piscofins_cstChange(Sender: TObject);
    procedure bt_alterar_campos_piscofinsClick(Sender: TObject);
    procedure bt_alterar_campos_icms_ufdestClick(Sender: TObject);
    procedure bt_alterar_campos_icmsClick(Sender: TObject);
    procedure bt_calc_runClick(Sender: TObject);
    procedure bt_tipo_calc_unlockClick(Sender: TObject);
    procedure lb_tipo_calc_1Click(Sender: TObject);
    procedure ed_tipoCalcExit(Sender: TObject);
    procedure ed_tipoCalcChange(Sender: TObject);
    procedure bt_pc_configClick(Sender: TObject);
    procedure ck_base_habClick(Sender: TObject);
    procedure ConfBC_ICMSClick(Sender: TObject);
    procedure SpeedButton44Click(Sender: TObject);
    procedure pageMaisNFeChange(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure SpeedButton43Click(Sender: TObject);
    procedure bt_obscont_removerClick(Sender: TObject);
    procedure bt_obscont_alterarClick(Sender: TObject);
    procedure bt_obscont_incluirClick(Sender: TObject);
    procedure bt_obscont_salvarClick(Sender: TObject);
    procedure DBEdit84Exit(Sender: TObject);
    procedure btErrosImportacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btErrosImportacaoClick(Sender: TObject);
    procedure btnXMLNFSClick(Sender: TObject);
    procedure ed_altent_data_lancExit(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure ed_entrada_retorno_pedvenda_continuarClick(Sender: TObject);
    procedure btNF_ent_pedvendaClick(Sender: TObject);
    //**** RELEASE ICMS DESONERADO ****
    procedure ed_rateio_descontoDblClick(Sender: TObject);
    procedure edo_rateio_descontoDblClick(Sender: TObject);
    procedure bt_outras_nfClick(Sender: TObject);
    procedure lkIdDestExit(Sender: TObject);
    procedure sp_icment_verdados_outClick(Sender: TObject);
    procedure sp_icment_verdadosClick(Sender: TObject);
    procedure ed_col_paisExit(Sender: TObject);
    procedure ed_col_cidadeExit(Sender: TObject);
    procedure pn_col_entExit(Sender: TObject);
    procedure sp_col_cepClick(Sender: TObject);
    procedure ed_col_cepExit(Sender: TObject);
    procedure sp_col_delClick(Sender: TObject);
    procedure sp_col_editClick(Sender: TObject);
    procedure edInut_nnfiniExit(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure Label81DblClick(Sender: TObject);
    procedure btfat_verificarimpressaoClick(Sender: TObject);
    procedure DBText65DblClick(Sender: TObject);
    procedure btNFeServicosClick(Sender: TObject);
    procedure btNFeConsultaClick(Sender: TObject);
    procedure btNFeConsulta2Click(Sender: TObject);
    procedure btNFeValidarClick(Sender: TObject);
    procedure btConfirmarNFClick(Sender: TObject);
    procedure BitBtn198Click(Sender: TObject);
    procedure BitBtn199Click(Sender: TObject);
    procedure gridNFeInutMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure gridNFeInutKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridNFeInutCellClick(Column: TColumn);
    procedure gridNFeInutDblClick(Sender: TObject);
    procedure btNFeInut_emailClick(Sender: TObject);
    procedure btNFeInut_printClick(Sender: TObject);
    procedure btNFeInut_enviarClick(Sender: TObject);
    procedure btNFeInut_excluirClick(Sender: TObject);
    procedure btNFeInutiClick(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure btNFeEmail_anexarClick(Sender: TObject);
    procedure btNFeEmailClick(Sender: TObject);
    procedure btNFeEmail2Click(Sender: TObject);
    procedure btNFeImprimirClick(Sender: TObject);
    procedure btNFeImprimir2Click(Sender: TObject);
    procedure SpeedButton85Click(Sender: TObject);
    procedure btNFeAutorizar2Click(Sender: TObject);
    procedure btNFeAutorizarClick(Sender: TObject);
    procedure btNFeVoltarClick(Sender: TObject);
    procedure btNFeEventosClick(Sender: TObject);
    procedure btNFeModulo310Click(Sender: TObject);
    procedure btNFeManifestacaoClick(Sender: TObject);
    procedure btEnviarNFeClick(Sender: TObject);
    procedure bt_nfe_verificar_dados_contingenciaClick(Sender: TObject);
    procedure btpag_aproveitarpedidosClick(Sender: TObject);
    procedure btfat_aproveitarpedidosClick(Sender: TObject);
    procedure btfat_alterarClick(Sender: TObject);
    procedure brdup_salvarClick(Sender: TObject);
    procedure btfat_gerarClick(Sender: TObject);
    procedure BitBtn195Click(Sender: TObject);
    procedure lkFinalidadeExit(Sender: TObject);
    procedure btpag_sempagamentoClick(Sender: TObject);
    procedure DBGrid55Exit(Sender: TObject);
    procedure DBGrid55KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid55DblClick(Sender: TObject);
    procedure btpag_removerClick(Sender: TObject);
    procedure btpag_alterarClick(Sender: TObject);
    procedure btpag_incluirClick(Sender: TObject);
    procedure btpag_salvarClick(Sender: TObject);
    procedure btNotaRetornoClick(Sender: TObject);
    procedure pnAbaNotaFiscalEnter(Sender: TObject);
    procedure BitBtn194Click(Sender: TObject);
    procedure DBEdit127Exit(Sender: TObject);
    procedure pnAbaOutrasEnter(Sender: TObject);
    procedure lkFreteExit(Sender: TObject);
    procedure pageDadosNFChange(Sender: TObject);
    procedure tsnf_ResumoNotaExit(Sender: TObject);
    procedure pnAbaDestinatarioEnter(Sender: TObject);
    procedure btPriorDestClick(Sender: TObject);
    procedure btNextDestClick(Sender: TObject);
    procedure btRefressDestClick(Sender: TObject);
    procedure edipi_cnpjprodExit(Sender: TObject);
    procedure edCNPJFabExit(Sender: TObject);
    procedure edindEscalaExit(Sender: TObject);
    procedure pnNovaRefNFeAvulsaEnter(Sender: TObject);
    procedure BitBtn62Click(Sender: TObject);
    procedure BitBtn64Click(Sender: TObject);
    procedure BitBtn65Click(Sender: TObject);
    procedure BitBtn192Click(Sender: TObject);
    procedure BitBtn191Click(Sender: TObject);
    procedure btPVTickAllClick(Sender: TObject);
    procedure eddQTDEMB_oldKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btPVUnTickAllClick(Sender: TObject);
    procedure ckEsconderNotasClick(Sender: TObject);
    procedure ckPVApenasComCupomFiscalClick(Sender: TObject);
    procedure DBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure panelGrupoVendaEnter(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btEditGradeClick(Sender: TObject);
    procedure edMudCSOSNExit(Sender: TObject);
    procedure edMudCSTExit(Sender: TObject);
    procedure btMudPopUpMenuClick(Sender: TObject);
    procedure InverterSeleo1Click(Sender: TObject);
    procedure DesselecionaTodos1Click(Sender: TObject);
    procedure SelecionaTodos1Click(Sender: TObject);
    procedure SelecionaDesselecionaItem1Click(Sender: TObject);
    procedure btMudAplicarAutoClick(Sender: TObject);
    procedure btMudAplicarOpcoesClick(Sender: TObject);
    procedure edIndTotChange(Sender: TObject);
    procedure ckUsarValorDoPedido2Click(Sender: TObject);
    procedure ckUsarValorDoPedidoClick(Sender: TObject);
    procedure SpeedButton79Click(Sender: TObject);
    procedure BitBtn187Click(Sender: TObject);
    procedure BitBtn188Click(Sender: TObject);
    procedure ckMostrarApenasComSTClick(Sender: TObject);
    procedure btEspelhoCalcClick(Sender: TObject);
    procedure Edit8Exit(Sender: TObject);
    procedure SpeedButton58Click(Sender: TObject);
    procedure BitBtn185Click(Sender: TObject);
    procedure BitBtn186Click(Sender: TObject);
    procedure BitBtn182Click(Sender: TObject);
    procedure BitBtn164Click(Sender: TObject);
    procedure BitBtn184Click(Sender: TObject);
    procedure BitBtn183Click(Sender: TObject);
    procedure pnIrregularidadesNCMCESTEnter(Sender: TObject);
    procedure SpeedButton46Click(Sender: TObject);
    procedure Panel144Enter(Sender: TObject);
    procedure btnUnlockEmbClick(Sender: TObject);
    procedure eddQTDEMB_oldExit(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure BitBtn163Click(Sender: TObject);
    procedure ckdAnt_calcClick(Sender: TObject);
    procedure ckonAnt_calcClick(Sender: TObject);
    procedure btOHabPISCOFINSClick(Sender: TObject);
    procedure tsOut_MercadoriasEnter(Sender: TObject);
    procedure pgControlOItensNFeEnter(Sender: TObject);
    procedure tsOut_MercadoriasExit(Sender: TObject);
    procedure tsMerc_MercadoriasEnter(Sender: TObject);
    procedure tsMerc_ICMSExit(Sender: TObject);
    procedure tsMerc_MercadoriasExit(Sender: TObject);
    procedure pgControlItensNFeEnter(Sender: TObject);
    procedure edcst_ipiExit(Sender: TObject);
    procedure dbgridDadosCartoesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pnSelTermnalAdmExit(Sender: TObject);
    procedure btDadosCartaoADMClick(Sender: TObject);
    procedure btPagamentoEmCartaoClick(Sender: TObject);
    procedure btDadosCartaoCancelarClick(Sender: TObject);
    procedure btDadosCartaoReceberClick(Sender: TObject);
    procedure pnDadosCartaoExit(Sender: TObject);
    procedure lbNaoEstaNaListaTermAdmClick(Sender: TObject);
    procedure btSelTermnalAdmContinuarClick(Sender: TObject);
    procedure pnSelTermnalAdmEnter(Sender: TObject);
    procedure pnDadosCartaoEnter(Sender: TObject);
    procedure btDadosCartaoVoltarClick(Sender: TObject);
    procedure btnExportContinuarClick(Sender: TObject);
    procedure PageControl5MouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure btDetExportIndCancelarClick(Sender: TObject);
    procedure btDetExportIndSalvarClick(Sender: TObject);
    procedure brDetExportCadCancelarClick(Sender: TObject);
    procedure btDetExportCadSalvarClick(Sender: TObject);
    procedure btExportIndExcluirClick(Sender: TObject);
    procedure btExportIndAlterarClick(Sender: TObject);
    procedure btExportIndIncluirClick(Sender: TObject);
    procedure btExportDadosExcluirClick(Sender: TObject);
    procedure btExportDadosAlterarClick(Sender: TObject);
    procedure btExportDadosIncluirClick(Sender: TObject);
    procedure btNF_DExit(Sender: TObject);
    procedure btNF_P_ServClick(Sender: TObject);
    procedure btNF_P_ProdClick(Sender: TObject);
    procedure btNF_SClick(Sender: TObject);
    procedure btNF_DClick(Sender: TObject);
    procedure btNF_OClick(Sender: TObject);
    procedure btNF_VClick(Sender: TObject);
    procedure btNF_PClick(Sender: TObject);
    procedure pnEscolhaNFBotoesEnter(Sender: TObject);
    procedure btNF_Voltar_ProdServClick(Sender: TObject);
    procedure btNF_P_ProdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btNF_P_ProdEnter(Sender: TObject);
    procedure btNF_VoltarClick(Sender: TObject);
    procedure btNF_PKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btNF_PEnter(Sender: TObject);
    procedure pnDiversosExit(Sender: TObject);
    procedure spAtivarDFeClick(Sender: TObject);
    procedure pnDiversosEnter(Sender: TObject);
    procedure BitBtn181Click(Sender: TObject);
    procedure BitBtn180Click(Sender: TObject);
    procedure BitBtn179Click(Sender: TObject);
    procedure BitBtn178Click(Sender: TObject);
    procedure BitBtn177Click(Sender: TObject);
    procedure BitBtn176Click(Sender: TObject);
    procedure BitBtn174Click(Sender: TObject);
    procedure BitBtn175Click(Sender: TObject);
    procedure gridBaixaItensPedidosMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure gridBaixaItensPedidosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridBaixaItensPedidosDblClick(Sender: TObject);
    procedure gridBaixaItensPedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure gridBaixaItensPedidosCellClick(Column: TColumn);
    procedure BitBtn173Click(Sender: TObject);
    procedure BitBtn172Click(Sender: TObject);
    procedure pnDevolucoesRefExit(Sender: TObject);
    procedure DBGrid50Enter(Sender: TObject);
    procedure SpeedButton78Click(Sender: TObject);
    procedure SpeedButton77Click(Sender: TObject);
    procedure SpeedButton76Click(Sender: TObject);
    procedure MaskEdit5Enter(Sender: TObject);
    procedure MaskEdit4Enter(Sender: TObject);
    procedure MaskEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MaskEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eddPrecoVendaAtacadoExit(Sender: TObject);
    procedure eddPrecoVendaVarejoExit(Sender: TObject);
    procedure SpeedButton75Click(Sender: TObject);
    procedure BitBtn171Click(Sender: TObject);
    procedure SpeedButton72Click(Sender: TObject);
    procedure SpeedButton71Click(Sender: TObject);
    procedure SpeedButton70Click(Sender: TObject);
    procedure SpeedButton69Click(Sender: TObject);
    procedure SpeedButton68Click(Sender: TObject);
    procedure SpeedButton74Click(Sender: TObject);
    procedure SpeedButton67Click(Sender: TObject);
    procedure SpeedButton73Click(Sender: TObject);
    procedure pnManifestacaoEnter(Sender: TObject);
    procedure BitBtn170Click(Sender: TObject);
    procedure pnAtencTribEnter(Sender: TObject);
    procedure ckEfetuarLancamentoFiscalItemDocumentoClick(Sender: TObject);
    procedure ckEfetuarLancamentoFiscalDocumentoClick(Sender: TObject);
    procedure BitBtn169Click(Sender: TObject);
    procedure BitBtn168Click(Sender: TObject);
    procedure DBLookupComboBox13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnFormDetalhesNFEnter(Sender: TObject);
    procedure BitBtn167Click(Sender: TObject);
    procedure BitBtn166Click(Sender: TObject);
    procedure pnModFaturasEnter(Sender: TObject);
    procedure pnCC_eEnter(Sender: TObject);
    procedure BitBtn165Click(Sender: TObject);
    procedure dsEventosDataChange(Sender: TObject; Field: TField);
    procedure DBEdit45Exit(Sender: TObject);
    procedure DBEdit45Enter(Sender: TObject);
    procedure BitBtn162Click(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure BitBtn159Click(Sender: TObject);
    procedure DBGrid47MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure DBMemo16Change(Sender: TObject);
    procedure BitBtn156Click(Sender: TObject);
    procedure BitBtn160Click(Sender: TObject);
    procedure BitBtn161Click(Sender: TObject);
    procedure BitBtn158Click(Sender: TObject);
    procedure BitBtn155Click(Sender: TObject);
    procedure BitBtn156KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn157Click(Sender: TObject);
    procedure DBEdit277Exit(Sender: TObject);
    procedure DBGrid46KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnNotasForaEstabExit(Sender: TObject);
    procedure pnNotasForaEstabEnter(Sender: TObject);
    procedure SpeedButton65Click(Sender: TObject);
    procedure BitBtn154Click(Sender: TObject);
    procedure GroupBox84Enter(Sender: TObject);
    procedure SpeedButton64Click(Sender: TObject);
    procedure EditHw8Exit(Sender: TObject);
    procedure EditHw4Exit(Sender: TObject);
    procedure pnVendaForaEstabelecimentoEnter(Sender: TObject);
    procedure EditHw10Exit(Sender: TObject);
    procedure EditHw6Exit(Sender: TObject);
    procedure BitBtn152Click(Sender: TObject);
    procedure BitBtn153Click(Sender: TObject);
    procedure SpeedButton63Click(Sender: TObject);
    procedure DBGrid44KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHw10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton62Click(Sender: TObject);
    procedure SpeedButton61Click(Sender: TObject);
    procedure EditHw6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid44Exit(Sender: TObject);
    procedure DBGrid43Exit(Sender: TObject);
    procedure DBGrid43KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton60Click(Sender: TObject);
    procedure BitBtn141Click(Sender: TObject);
    procedure pnItensVeiculoEnter(Sender: TObject);
    procedure edOnCFOPExit(Sender: TObject);
    procedure eddCFOPExit(Sender: TObject);
    procedure DBEdit261Exit(Sender: TObject);
    procedure pnADIEnter(Sender: TObject);
    procedure pnImportacaoEnter(Sender: TObject);
    procedure pnDIEnter(Sender: TObject);
    procedure BitBtn140Click(Sender: TObject);
    procedure BitBtn151Click(Sender: TObject);
    procedure BitBtn149Click(Sender: TObject);
    procedure BitBtn150Click(Sender: TObject);
    procedure BitBtn148Click(Sender: TObject);
    procedure BitBtn147Click(Sender: TObject);
    procedure BitBtn146Click(Sender: TObject);
    procedure BitBtn145Click(Sender: TObject);
    procedure BitBtn144Click(Sender: TObject);
    procedure BitBtn143Click(Sender: TObject);
    procedure BitBtn142Click(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure SpeedButton57Click(Sender: TObject);
    procedure edtvalor_total2Exit(Sender: TObject);
    procedure edtvalor_total2Enter(Sender: TObject);
    procedure AlterarValordaNotaFiscal1Click(Sender: TObject);
    procedure BitBtn137Click(Sender: TObject);
    procedure pnDetalhesItensNFExit(Sender: TObject);
    procedure pnDetalhesItensNFEnter(Sender: TObject);
    procedure SpeedButton56Click(Sender: TObject);
    procedure SpeedButton55Click(Sender: TObject);
    procedure BitBtn139Click(Sender: TObject);
    procedure BitBtn138KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn138Click(Sender: TObject);
    procedure BitBtn136Click(Sender: TObject);
    procedure BitBtn135Click(Sender: TObject);
    procedure Marcaritemparainformaragrade1Click(Sender: TObject);
    procedure SpeedButton54Click(Sender: TObject);
    procedure edNumSerieEcfEnter(Sender: TObject);
    procedure SpeedButton51Click(Sender: TObject);
    procedure SpeedButton53Click(Sender: TObject);
    procedure SpeedButton52Click(Sender: TObject);
    procedure SpeedButton50Click(Sender: TObject);
    procedure pnCadastroItensVeiculosExit(Sender: TObject);
    procedure BitBtn134Click(Sender: TObject);
    procedure BitBtn124Click(Sender: TObject);
    procedure BitBtn130Click(Sender: TObject);
    procedure DBGrid32DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid34KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton49Click(Sender: TObject);
    procedure BitBtn131Click(Sender: TObject);
    procedure BitBtn133Click(Sender: TObject);
    procedure pnDevolucaoItensExit(Sender: TObject);
    procedure BitBtn132Click(Sender: TObject);
    procedure SpeedButton42Click(Sender: TObject);
    procedure SpeedButton48Click(Sender: TObject);
    procedure SpeedButton47Click(Sender: TObject);
    procedure pnDevolucaoItensEnter(Sender: TObject);
    procedure DBEdit260KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit259KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edOCSTPISExit(Sender: TObject);
    procedure edOCSTPISChange(Sender: TObject);
    procedure SpeedButton45Click(Sender: TObject);
    procedure bt_it_pc_alterar_aliq_percClick(Sender: TObject);
    procedure btHabPISCOFINSClick(Sender: TObject);
    procedure eddCSTPISExit(Sender: TObject);
    procedure eddCSTPISChange(Sender: TObject);
    procedure eddCSTPISDblClick(Sender: TObject);
    procedure BitBtn123Click(Sender: TObject);
    procedure BitBtn123KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btRemoverC120Click(Sender: TObject);
    procedure DBGrid13Enter(Sender: TObject);
    procedure DBGrid13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edPreco30Exit(Sender: TObject);
    procedure BitBtn122Click(Sender: TObject);
    procedure DBEdit258Exit(Sender: TObject);
    procedure DBComboBox16Exit(Sender: TObject);
    procedure DBComboBox16Change(Sender: TObject);
    procedure BitBtn125Click(Sender: TObject);
    procedure BitBtn126Click(Sender: TObject);
    procedure BitBtn127Click(Sender: TObject);
    procedure BitBtn128Click(Sender: TObject);
    procedure BitBtn129Click(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure eddevolucaoExit(Sender: TObject);
    procedure SpeedButton38Click(Sender: TObject);
    procedure BitBtn120Click(Sender: TObject);
    procedure BitBtn118Click(Sender: TObject);
    procedure BitBtn119Click(Sender: TObject);
    procedure BitBtn117Click(Sender: TObject);
    procedure BitBtn121Click(Sender: TObject);
    procedure bt_nf_serv_add_pedpvendaClick(Sender: TObject);
    procedure BitBtn115Click(Sender: TObject);
    procedure BitBtn113Click(Sender: TObject);
    procedure BitBtn114Click(Sender: TObject);
    procedure btStatusNFeClick(Sender: TObject);
    procedure spBotaoRemoverStatusEmProcessamentoClick(Sender: TObject);
    procedure BitBtn112Click(Sender: TObject);
    procedure BitBtn111Click(Sender: TObject);
    procedure BitBtn110Click(Sender: TObject);
    procedure BitBtn107Click(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure BitBtn106Click(Sender: TObject);
    procedure BitBtn108Click(Sender: TObject);
    procedure BitBtn109Click(Sender: TObject);
    procedure BitBtn104Click(Sender: TObject);
    procedure BitBtn103Click(Sender: TObject);
    procedure BitBtn101Click(Sender: TObject);
    procedure BitBtn102Click(Sender: TObject);
    procedure BitBtn105Click(Sender: TObject);
    procedure Label431Click(Sender: TObject);
    procedure BitBtn94Click(Sender: TObject);
    procedure BitBtn95Click(Sender: TObject);
    procedure BitBtn100Click(Sender: TObject);
    procedure BitBtn98Click(Sender: TObject);
    procedure BitBtn96Click(Sender: TObject);
    procedure BitBtn97Click(Sender: TObject);
    procedure BitBtn99Click(Sender: TObject);
    procedure btDetalheDespesaClick(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure dbGridDetPagEntKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn93Click(Sender: TObject);
    procedure spbDetalhesFormPagClick(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure BitBtn91Click(Sender: TObject);
    procedure BitBtn92Click(Sender: TObject);
    procedure BitBtn88Click(Sender: TObject);
    procedure BitBtn89Click(Sender: TObject);
    procedure BitBtn90Click(Sender: TObject);
    procedure pnItensDespesaExit(Sender: TObject);
    procedure DBEdit204Exit(Sender: TObject);
    procedure DBEdit83Exit(Sender: TObject);
    procedure btAlterarItensDespesaClick(Sender: TObject);
    procedure btIncluirItensDespesaClick(Sender: TObject);
    procedure btCancelarItensDespesaClick(Sender: TObject);
    procedure btSalvarItensDespesaClick(Sender: TObject);
    procedure DBGrid13DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure spbSairDetalheClick(Sender: TObject);
    procedure spbProximoClick(Sender: TObject);
    procedure spbAnteriorClick(Sender: TObject);
    procedure spbDetalharItemClick(Sender: TObject);
    procedure BitBtn87Click(Sender: TObject);
    procedure BitBtn71Click(Sender: TObject);
    procedure DBGrid25KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn85Click(Sender: TObject);
    procedure BitBtn86Click(Sender: TObject);
    procedure eddNumFabFornecedorExit(Sender: TObject);
    procedure BitBtn83Click(Sender: TObject);
    procedure btDetalhesVeiculoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn79Click(Sender: TObject);
    procedure BitBtn78Click(Sender: TObject);
    procedure BitBtn82KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn82Click(Sender: TObject);
    procedure BitBtn84Click(Sender: TObject);
    procedure BitBtn77Click(Sender: TObject);
    procedure BitBtn80Click(Sender: TObject);
    procedure BitBtn76Click(Sender: TObject);
    procedure BitBtn81KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn81Click(Sender: TObject);
    procedure BitBtn74Click(Sender: TObject);
    procedure BitBtn74KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Panel13Enter(Sender: TObject);
    procedure DBGrid11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edChaveExit(Sender: TObject);
    procedure edmodelo_nfExit(Sender: TObject);
    procedure btConsultaNFeClick(Sender: TObject);
    procedure BitBtn70Click(Sender: TObject);
    procedure BitBtn69Click(Sender: TObject);
    procedure BitBtn73Click(Sender: TObject);
    procedure DevolucaodeNotaFiscalTotal1Click(Sender: TObject);
    procedure DBGrid24KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btOKDevolucaoNfClick(Sender: TObject);
    procedure BitBtn75Click(Sender: TObject);
    procedure BitBtn68Click(Sender: TObject);
    procedure btConsultarNFeClick(Sender: TObject);
    procedure btCancelarConsultaNFeClick(Sender: TObject);
    procedure BitBtn67Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure eddDescricaoExit(Sender: TObject);
    procedure spEmbalagemMNFClick(Sender: TObject);
    procedure eddMNFExit(Sender: TObject);
    procedure eddMNFChange(Sender: TObject);
    procedure btOKEmbalagemClick(Sender: TObject);
    procedure btCancelarEmabalagemClick(Sender: TObject);
    procedure eddVLREMBNFRExit(Sender: TObject);
    procedure eddPDESC_RExit(Sender: TObject);
    procedure btIncluirItemServicoDetalhadoClick(Sender: TObject);
    procedure btModuloNFeClick(Sender: TObject);
    procedure edCodClForPedCompraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodClForPedVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnCadastroItensOutrasNfExit(Sender: TObject);
    procedure pnCadastroItensProdDetalhadoExit(Sender: TObject);
    procedure eddCSOSNExit(Sender: TObject);
    procedure edOnCSOSNExit(Sender: TObject);
    procedure DadosdeColetaEntrega1Click(Sender: TObject);
    procedure CuponsFiscaisReferenciados1Click(Sender: TObject);
    procedure NotasFiscaisReferenciadas1Click(Sender: TObject);
    procedure ArrecadaesReferenciadas1Click(Sender: TObject);
    procedure ProcessosReferenciados1Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn63Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure BitBtn60Click(Sender: TObject);
    procedure btCancelarDetalhesVeiculoClick(Sender: TObject);
    procedure btCancelarItemVeiculoClick(Sender: TObject);
    procedure DBEdit53KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit202Exit(Sender: TObject);
    procedure DBEdit194Exit(Sender: TObject);
    procedure btSalvarC115Click(Sender: TObject);
    procedure btCancelarC115Click(Sender: TObject);
    procedure btRemoverC115Click(Sender: TObject);
    procedure btAlterarC115Click(Sender: TObject);
    procedure btNovoC115Click(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure btSalvarNFClick(Sender: TObject);
    procedure eddNumFabEnter(Sender: TObject);
    procedure pgContDadosNFEnter(Sender: TObject);
    procedure DBMemo14KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton35Click(Sender: TObject);
    procedure BitBtn54Click(Sender: TObject);
    procedure edSerieComplExit(Sender: TObject);
    procedure BitBtn56Click(Sender: TObject);
    procedure BitBtn57Click(Sender: TObject);
    procedure BitBtn55Click(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure edOnCSTExit(Sender: TObject);
    procedure edOnDescricaoOutrasEnter(Sender: TObject);
    procedure edOnDescricaoOutrasExit(Sender: TObject);
    procedure DBRadioGroup4Exit(Sender: TObject);
    procedure ListBox4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListBox4KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn53Click(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure eddNCMKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btCancelarC120Click(Sender: TObject);
    procedure btSalvarC120Click(Sender: TObject);
    procedure btAlterarC120Click(Sender: TObject);
    procedure btNovoC120Click(Sender: TObject);
    procedure btRemoverC114Click(Sender: TObject);
    procedure btAlterarC114Click(Sender: TObject);
    procedure btNovoC114Click(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);
    procedure btSalvarC114Click(Sender: TObject);
    procedure btCancelarC114Click(Sender: TObject);
    procedure edNaturezaC113Exit(Sender: TObject);
    procedure edClForC113Exit(Sender: TObject);
    procedure edClForC113KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btNovoC113Click(Sender: TObject);
    procedure btRemoverC113Click(Sender: TObject);
    procedure btSalvarC113Click(Sender: TObject);
    procedure btCancelarC113Click(Sender: TObject);
    procedure DBEdit172Exit(Sender: TObject);
    procedure DBEdit172Enter(Sender: TObject);
    procedure btCancelarC112Click(Sender: TObject);
    procedure btSalvarC112Click(Sender: TObject);
    procedure btRemoverC112Click(Sender: TObject);
    procedure btAlterarC112Click(Sender: TObject);
    procedure btNovoC112Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure btRemoverC111Click(Sender: TObject);
    procedure btAlterarC111Click(Sender: TObject);
    procedure btNovoC111Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure btSalvarC111Click(Sender: TObject);
    procedure btCancelarC111Click(Sender: TObject);
    procedure BitBtn49Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure btOutrosIntFiscoClick(Sender: TObject);
    procedure BitBtn52Click(Sender: TObject);
    procedure BitBtn51Click(Sender: TObject);
    procedure BitBtn50Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure ListBox3DblClick(Sender: TObject);
    procedure btGerarFaturaEntradaClick(Sender: TObject);
    procedure btSalvarFaturaEntradaClick(Sender: TObject);
    procedure btAlterarFaturaEntradaClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure btOkCSTTransitoClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure BitBtn46Click(Sender: TObject);
    procedure BitBtn47Click(Sender: TObject);
    procedure btCancelarParametrosClick(Sender: TObject);
    procedure btSalvarParametrosClick(Sender: TObject);
    procedure BitBtn45Click(Sender: TObject);
    procedure BitBtn48Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure btIncluirItemProdDetalhadoClick(Sender: TObject);
    procedure btSalvarItemProdServDetalhadoClick(Sender: TObject);
    procedure pnCadastroItensOutrasNfEnter(Sender: TObject);
    procedure btRemoverItemOutrasNfClick(Sender: TObject);
    procedure edOnQtdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edo_rateio_descontoExit(Sender: TObject);
    procedure edOnQtdeExit(Sender: TObject);
    procedure btAlterarItensOutrasNfClick(Sender: TObject);
    procedure btIncluirItemOutrasNfClick(Sender: TObject);
    procedure btSalvarItemOutrasNFClick(Sender: TObject);
    procedure btCancelarItemOutrasNfClick(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure DBEdit126Exit(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure DBEdit39Exit(Sender: TObject);
    procedure BitBtn43Click(Sender: TObject);
    procedure BitBtn44Click(Sender: TObject);
    procedure DBEdit94Exit(Sender: TObject);
    procedure DBEdit105Exit(Sender: TObject);
    procedure DBEdit100Exit(Sender: TObject);
    procedure DBLookupComboBox5Exit(Sender: TObject);
    procedure DBLookupComboBox4Exit(Sender: TObject);
    procedure DBEdit52Exit(Sender: TObject);
    procedure btAlterarItemVeiculoClick(Sender: TObject);
    procedure btAlterarDetalhesVeiculosClick(Sender: TObject);
    procedure btSalvarDetalhesVeiculoClick(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure btDetalhesVeiculoClick(Sender: TObject);
    procedure btSalvarItemVeiculoClick(Sender: TObject);
    procedure edClienteComandoExit(Sender: TObject);
    procedure edClienteComandoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton17Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn35Click(Sender: TObject);
    procedure edtvalor_desp_pf2Exit(Sender: TObject);
    procedure edtvalor_desc2Exit(Sender: TObject);
    procedure btResumoNFClick(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure btSalvaMargemObtidaClick(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure edMarkUpVExit(Sender: TObject);
    procedure DBGrid9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure DBGrid8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton14Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure btContinuarCalculoClick(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn20Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure bt_nf_prod_add_pedpvendaClick(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btCalcularNfClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure ed_codigo_nopExit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_codigo_nopKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ValidarRodap1Click(Sender: TObject);
    procedure ValidarCabealho1Click(Sender: TObject);
    procedure ValidarTransportes1Click(Sender: TObject);
    procedure DBEdit3Enter(Sender: TObject);
    procedure btSaidaClick(Sender: TObject);
    procedure tsDadosEntradaEnter(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox11Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

    //
    procedure campoEnterPerform(Sender: TObject);
    procedure btAlterarItemProdDetalhadoClick(Sender: TObject);
    procedure btRemoverItemProdDetalhadoClick(Sender: TObject);
    procedure btCancelarItemProdServDetalhadoClick(Sender: TObject);
    procedure edDTipoExit(Sender: TObject);
    procedure edDTipoChange(Sender: TObject);
    procedure eddNumFabExit(Sender: TObject);
    procedure eddNumFabKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eddCSTExit(Sender: TObject);
    procedure pnItesProdutosDetalhadoEnter(Sender: TObject);
    procedure eddQtdeExit(Sender: TObject);
    procedure ed_rateio_descontoExit(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure btSalvarDetalhesECFClick(Sender: TObject);
    procedure btCancelarDetalhesECFClick(Sender: TObject);
    procedure edNumSerieEcfExit(Sender: TObject);
    procedure DBLookupComboBox6Exit(Sender: TObject);
    procedure btCancelarECFSaidaClick(Sender: TObject);
    procedure btEscolherECFSaidaClick(Sender: TObject);
    procedure DBLookupComboBox10Exit(Sender: TObject);
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;

  private
    FrameIbsCbsVeic1: TFrameIbsCbs;
    FrameIbsCbsDesp1: TFrameIbsCbs;
    FrameIbsCbsEntrada1: TFrameIbsCbs;
    FrameIbsCbsDetItemNf1: TFrameIbsCbs;
    vCheck: TCheckBox;
    vf3Produto: Boolean;
    vEntS: string;
    vCriou: Smallint;
    enterTela2 : TEnterHw;
    vData_Lanc: TDate;
    vStringEntradaSaidaFormEscolhaNF: string;
    vStringProdOuServNF: string;
    ARecNo: Integer;
    FpopMenuNFe: TPopupMenu;
    FpopMenuOut: TPopupMenu;//Outras notas
    FpopMenuUnd: TPopupMenu;//Outras notas
    FlkColCidade: TDadosLookUp_OOP;
    FlkColPais: TDadosLookUp_OOP;
    FlkMotivoDesoneracao: TDadosLookUp_OOP;
    FlkFormatoDANFe: TDadosLookUp_OOP;
    //Funçoes para salvar e gravar dados no registro do windows
    procedure getDadosFormularioMontarNfPedVenda;
    procedure setDadosFormularioMontarNfPedVenda;
    procedure getDadosFormularioMontarNfPedCompra;
    procedure setDadosFormularioMontarNfPedCompra;
    procedure setDadosFormularioMontarNfComando;
    procedure getDadosFormularioMontarNfTransito;
    procedure setDadosFormularioMontarNfTransito;

    //Funcoes de Controle do Formulario
    //procedure habilitaCamposCadastroNotaFiscal;
    procedure buildCadastroItens;                       // Aqui usa o vrDadosItem (Produtos e Outras Notass)
    procedure buildCadastroItensDtSet(Sender: TObject); // Aqui usa o dataset do item direto (Veiculos, ...)
    procedure buildCadastroItensAlteracaoTributo;
    procedure buildCadastroCamposCalculoICMSSN;
    procedure getCampos;
    procedure setCampos;
    procedure getCamposDetalhado;
    procedure setCamposDetalhado;
    procedure getCamposOutrasNF;
    procedure setCamposOutrasNf;
    procedure getCamposMargem;

    //divergencias ncm ou cest
    procedure habilitarComponentesNcmCest;

    //outras funcionalidades
    procedure btNFeEmail2_Inutilizacao_Click(Sender: TObject);
    procedure gridItensButtonClick(Sender: TObject);
    procedure gridNFe_DrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure gridNFe_DblClick(Sender: TObject);
    procedure gridNFe_MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure gridNFe_CellClick(Column: TColumn);
    procedure gridNFe_KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure toggle_multi_selecao_dbgrid1(state: TToggleMultSelectGridState);

    procedure pag_event_AtualizarValoresCobranca;
    procedure nota_event_change_frete_f_nfe;
    procedure nota_event_change_num_nf;
    procedure nota_event_change_tipo_desconto;
    procedure nota_event_change_tipo_seguro;
    procedure nota_event_change_tipo_outdesp;
    procedure nota_event_change_tipo_frete;
    procedure nota_event_change_tipo_desppf;
    procedure nota_event_change_consumidor_final;
    procedure nota_event_change_finalidadeid;
    procedure nota_event_change_emissao_propria;
    procedure nota_event_change_verificar_mud_cfop;
    procedure nota_event_clear;

    procedure nota_coleta_entrega_tab_change;

    procedure nfe_options_copiar_xml(Sender: TObject);
    procedure nfe_options_visualizar_xml(Sender: TObject);
    procedure nfe_options_salvar_xml(Sender: TObject);
    procedure nfe_options_status_servico(Sender: TObject);

    procedure nf_outras_options_ajustes_estoque(Sender: TObject);
    procedure nf_outras_options_rest_compl_icmsst(Sender: TObject);
    procedure nf_outras_options_notas_pend_canc(Sender: TObject);
    procedure nf_outras_options_dados_certificado(Sender: TObject);
    procedure nf_outras_options_notas_pend_sefaz(Sender: TObject);

    procedure uvnd_fill_select(uvndIdx: string = '');
    procedure uvnd_criar_conversao_do_xml(Sender: TObject);
    procedure uvnd_criar_conversao_do_xml_applicar(Sender: TObject);
    procedure uvnd_criar_conversao(Sender: TObject);
    procedure uvnd_definir_preferencia_xml(Sender: TObject);

    function confirmacao_nota_tela_enviar(var Aprint, AsendMail, AcomBol: Boolean; var tipoDANFe: string): Boolean;

    function VerificarNotasPendentesCancelamento: Boolean;
    function VerificarNotasPendentesSefaz: Boolean; 
    procedure ResolverEmissaoEmContingencia(CodigoNF: Integer);
    procedure ResolverPendenciaSefaz(CodigoNF: Integer);

    procedure handleHintDblClick(Sender: TObject);
    procedure campos_itens_cstChange(Sender: TObject);
    procedure nf_itens_espelho_calc_afterscroll(Sender: TObject);
    procedure handleChangeQtdeQBCMono(qtdeChange: Double);
    procedure handleImpressaoEtiquetas();
    procedure statusBar(textoPadrao, hintControle: string); override;
    procedure EventAddEntitiesSelects(Sender: TObject; Entity: TObject; out Display: string; out SetSelected: Boolean);
    procedure EventChangeEntitiesSelects(Sender: TObject; Entity: TObject; out Info: string);

    procedure FrameIbsCbsCalculoCallBack(Sender: TObject);
    procedure FrameIbsCbsCalculoItemDtSetCallBack(Sender: TObject);
    procedure VisualItemTributosRtcIgnorar();
    procedure VisualConfigurarOperacaoInterna(SetVisivel: Boolean);

    function ValidarSetarIbsCbsCalculoItemDtSetCallBack(Sender: TObject): Boolean;
  protected
    FlkformaEmiss: TDadosLookUp_OOP;
    Flkambiente  : TDadosLookUp_OOP;
    Flkindpag    : TDadosLookUp_OOP;
    FlkindIEDest : TDadosLookUp_OOP;
    FlkFinalClFor: TDadosLookUp_OOP;
    lkIntermed   : TDadosLookUp_OOP;
    lkConfSuframa: TDadosLookUp_OOP;
    lkRetFed: TDadosLookUp_OOP;
    lkTipoGuiaTransito: TDadosLookUp_OOP;
  public
    habilitaCamposCadastroNotaFiscalOnShow: Boolean;
    //Funcoes de Controle do Formulario
    procedure habilitaCamposCadastroNotaFiscal;

    procedure getDadosFormularioMontarNfComando;
    procedure getCalculoImposto;
    procedure getFaturas;
    constructor Create2(AOwner: TComponent; nPedVenda: integer; tipoPedVenda: string);
    procedure setNpedVendaTipoPedVenda(nPedVenda: integer; tipoPedVenda: string);
    procedure setNComando(nComando: integer);

    procedure FormMargemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  var
  	PrimeiraPesquisaManifestacao: Boolean;
  	vConfigColunaManifestacao: boolean;
    cdsColunasManifestacao: TClientDataSet;

    GridCfgManifestacao: TDBGrid;
    cdsGridManifestacao: TClientDataSet;
    ListGridsAndDataSetsManifestacao: TStrings;
    ListPositionsManifestacao: TStrings;

    transManifestacao: TIBTransaction;
    fResetManifestacao: boolean;
    nomeDTSEtManifestacao, vAlterarNomeDtSetManifestacao: string;
    vCamposPadraoRegistroManifestacao: Boolean;

    usuario: string;
  end;

var
  frmCadNF: TfrmCadNF;
  CadNf: TNFCab;
  vNFAvulsaEst: boolean;


implementation

uses
  uDtmAtivo, uDtmNf, Registry, uDadosIni,
  uDtmSpedNf, Clipbrd, ShellAPI, uClasseMargemProduto, Funcoes, DateUtils,
  uImportXmlNf, DFeHwLibUnit, StrUtils, MAth, notafiscal_sped_c113_class,
  notafiscal_item_class, notafiscal_inut_class, Types, hw_utils, config_sistema_class,
  uCadNF_PendCanc, uClassesNotasFiscais_consts, uClassesNotasFiscais_itens_cadastros,
  opfiscal_model, hw_strings, faturamento_hw_class, uCadNF_AlterarDados, uCadNF_AlterarItens,
  uCadNF_AntecipacaoST_Itens, uClassesNotasFiscais_itens_detalhes, hw_win_utils,
  uCadNF_FretePorPeso, cabecalho_etiqueta_class, UnidadeVenda_Model, hw_undconv_utils,
  ProdutosConversao_Model, uCadNF_Copiador, hw_grid_utils, hw_progress_utils, Query_OOP,
  hw_copia_nf_models, hw_confirmacao, hw_const_types, uCadNF_ReferenciaItem,
  uClassesNotasFiscais_Tipos, ContainerUnit, OperacaoInternaEtdUnit, SituacaoNFeEnumUnit,
  hw_pedido_cliente, TributoDFeContextEtdUnit, TributoDFeIbsCbsEtdUnit, UNotasFiscaisPendentesSEFAZ,
  TributoDFeImpostoSeletivoEtdUnit, TipoComunsUnit, TributoDFeOrigemEnumUnit, LegacyDFeDLLAdapterUnit,
  hw_audit_utils, opfiscal_confs, DFeEnums, FormatoImpressaoDANFeEnumUnit, AlertasDFeUtils, UIUtilsUnit,
  uEnviarMensagem, StringServiceUnit;

{$R *.dfm}

procedure renave_zero_estoque_renave(paramsList: WideString); stdcall; external 'hw.utils.dx.dll';

procedure TfrmCadNF.btCalcularNfClick(Sender: TObject);
var
  controle:TWinControl;
begin
  inherited;

  CadNf.vItem.prepare_loop();
  Screen.Cursor := crHourGlass;
  try

    if (pnCadastroItensProdDetalhado.CanFocus) or (pnCadastroItensDespesa.CanFocus) then
      Exit;
    controle := ActiveControl;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus;
    if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) then
    	BitBtn6.SetFocus;
    CadNf.somaTotaisNF(True);
    //CadNf.definirPISCOFINS;
    if CadNf.campo_natureza_nf = 'E' then
      CadNf.abreFormCalculoImposto;
  finally
    try
      if (Self.Enabled) and (Self.Visible) and (controle.canfocus) then
        controle.SetFocus;
    except
    end;

    CadNf.vItem.prepare_loop_done();
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btCancelarC111Click(Sender: TObject);
begin
  inherited;
  CadNf.vSped.vC110.vC111.Cancel;
  pnC111Consulta.Visible := True;
  pnC111Cadastro.Visible := False;
end;

procedure TfrmCadNF.btCancelarC112Click(Sender: TObject);
begin
  inherited;
  CadNf.vSped.vC110.vC112.Cancel;
  pnC112Consulta.Visible := True;
  pnC112Cadastro.Visible := False;
end;

procedure TfrmCadNF.btCancelarC113Click(Sender: TObject);
begin
  inherited;
  TForm(pnC113Cadastro.Parent).ModalResult := IDCANCEL;
  {
  pnC113Consulta.Visible := True;
  pnC113Cadastro.Visible := False;
  }
end;

procedure TfrmCadNF.btCancelarC114Click(Sender: TObject);
begin
  inherited;
  CadNf.vSped.vC110.vC114.Cancel;
  pnC114Consulta.Visible := True;
  pnC114Cadastro.Visible := False;
end;

procedure TfrmCadNF.btCancelarC115Click(Sender: TObject);
begin
  inherited;
  CadNf.vSped.vC110.vC115.Cancel;
  pnC115Consulta.Visible := True;
  pnC115Cadastro.Visible := False;
end;

procedure TfrmCadNF.btCancelarC120Click(Sender: TObject);
begin
  inherited;
  CadNf.vSped.vC120.Cancel;
  pnC120Consulta.Visible := True;
  pnC120Cadastro.Visible := False;
end;

procedure TfrmCadNF.btCancelarConsultaNFeClick(Sender: TObject);
begin
  inherited;
  TForm(pnConsultaNfe.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.btCancelarDetalhesECFClick(Sender: TObject);
begin
  inherited;
  CadNf.vItem.vDetEcf.Cancel;
  edNumSerieEcf.Enabled := True;
  TForm(pnECFEntrada.Parent).ModalResult := mrCancel;
end;

procedure TfrmCadNF.btCancelarECFSaidaClick(Sender: TObject);
begin
  inherited;
  TForm(pnECFSaida.Parent).ModalResult := mrCancel;
end;

procedure TfrmCadNF.btCancelarItemOutrasNfClick(Sender: TObject);
begin
  inherited;
  CadNf.vItem.cancelar;
  getCamposOutrasNF;                 
  pnConsultaItensOutrasNF.Visible := True;
  pnCadastroItensOutrasNf.Visible := False;
end;

procedure TfrmCadNF.btCancelarItemProdServDetalhadoClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  btAlterarItemProdDetalhado.Tag:= 0;
  if (Self.Enabled) and (Self.Visible) and (btCancelarItemProdServDetalhado.CanFocus) then
  	btCancelarItemProdServDetalhado.SetFocus;
  CadNf.vItem.cancelar;
  getCamposDetalhado;
  if btAlterarItemProdDetalhado.Tag <> 0 then
  begin
    CadNf.vItem.IndexFieldNames := 'NITEM';
    CadNf.vItem.FindNearest([btAlterarItemProdDetalhado.Tag]);
    btAlterarItemProdDetalhado.Tag := 0;
  end;
  pnConsultaItensProdDetalhado.Visible := True;
  pnConsultaItensProdDetalhado.Enabled := True;
  pnCadastroItensProdDetalhado.Visible := False;
  pnCadastroItensProdDetalhado.Enabled := False;
  eddCST.OnChange                      := nil;
  for I := 0 to pgControlItensNFe.PageCount - 1 do
    pgControlItensNFe.Pages[I].Enabled := True;

  if pageDadosNF.Tag = 1 then
  begin
    pageDadosNF.ActivePage := tsnf_ResumoNota;
    pageDadosNF.Tag := 0;
    pageDadosNFChange(pageDadosNF);
  end;
end;

procedure TfrmCadNF.btCancelarItensDespesaClick(Sender: TObject);
begin
  inherited;
  TFloatField(CadNf.vItem.dataSet.FieldByName('valor_unitario')).DisplayFormat := '#,##0.000000';

  CadNf.vItem.Cancel;
  pnConsultaItensDespesa.Visible := True;
  pnCadastroItensDespesa.Visible := False;
end;

procedure TfrmCadNF.btCancelarParametrosClick(Sender: TObject);
begin
  inherited;
  CadNf.vInfCompl.Cancel;
  pnCadastroParametros.Visible := False;
  pnConsultaParametros.Visible := True;
end;

procedure TfrmCadNF.NfAreaDeTransferenciaMenuVisualizar1Click(Sender: TObject);
begin
  inherited;

  if not CadNf.Auditor.Visualizar.Processo('NF0244').Permitido then
    Exit;

  Application.CreateForm(TfrmCadNFCopiador, frmCadNFCopiador);
  frmCadNFCopiador.Nota := CadNf;
  frmCadNFCopiador.FilterFrame1.FillForm(CadNf.dataSet, ComboBox1.Items, ComboBox1.Text);

  if (Sender as TMenuItem).Name = 'AreadetransferenciaMultiempresa1' then
    frmCadNFCopiador.HandleConsultaMultiEmpresa
  else
    frmCadNFCopiador.OnlyShowClipBoard;
  if frmCadNFCopiador.ShowModal = mrOk then
    habilitaCamposCadastroNotaFiscal
end;

procedure TfrmCadNF.Alterardatadeemisso1Click(Sender: TObject);
var
  dataHora: TDateTime;
  dhStr: string;
begin
  inherited;

  dataHora := vDadosIni.FusoDateTime();
  dhStr := FormatDateTime('DD/MM/YYYY hh:mm:ss', dataHora);

  if not InputQuery('Data hora emissão', 'Informe a nova data e hora de emissão', dhStr) then
    Exit;

  if not TryStrToDateTime(dhStr, dataHora) then
    ShowAtencao('Data e hora informada inválida. Tente novamente por favor')
  else
    CadNf.AtualizarDataHoraEmisssao(dataHora);
end;

procedure TfrmCadNF.AlterarValordaNotaFiscal1Click(Sender: TObject);
begin
  inherited;
  {
  if (vDadosIni.vEmp.vRegime <> 'SIMPLES') then
  begin
    Application.MessageBox('Empresa não optante pelo Simples Nacional', 'Atenção', 0 + 64);
    Exit;
  end;

  if not CadNf.cfopDeDevolucao(Trunc(CadNf.dataSet.FieldByName('codigo_nop').AsFloat)) then
  begin
    Application.MessageBox('Opção permitida apenas para Devolução de Mercadorias', 'Atenção', 0 + 64);
    Exit;
  end;
  }

  if not vDadosIni.PesqPros('NF0131', 'ALTERAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString,
    'NOTAFISCAL', CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  edtvalor_total2.Tag := 99;
  edtvalor_total2.OnEnter := edtvalor_total2Enter;
  if (Self.Enabled) and (Self.Visible) and (edtvalor_total2.CanFocus) then
  	edtvalor_total2.SetFocus;
end;

procedure TfrmCadNF.Alterarvariositens1Click(Sender: TObject);
begin
  inherited;
  
  if not CadNf.Auditor.Processo(IfThen(CadNf.fequals('tipo_nf', 'O'), 'NF0056', 'NF0048'),
    'NUM NF '+ CadNf.fstr('NUM_NF'), CadNf.fstr('COD_NF'))
    .Inserir.Permitido then
    Exit;

  if (not btConfirmarNF.Enabled) and (not btSalvarNF.Enabled) then
    Exit;                             

  Application.CreateForm(TfmrCadNF_AlterarItens, fmrCadNF_AlterarItens);
  fmrCadNF_AlterarItens.nota := CadNf;
  fmrCadNF_AlterarItens.ShowModal;

  CadNf.vItem.prepare_loop();
  Screen.Cursor := crHourGlass;
  try
    CadNf.somaTotaisNF();
  finally
    CadNf.vItem.prepare_loop_done();
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.AntecipaotributriadeICMS1Click(Sender: TObject);
var
  AntSt: TNFItem_AntecipacaoST;
begin
  inherited;

  AntSt := TNFItem_AntecipacaoST.create(CadNf);
  try
    Application.CreateForm(TfrmCadNF_AntecipacaoST_Itens, frmCadNF_AntecipacaoST_Itens);

    frmCadNF_AntecipacaoST_Itens.nota  := CadNf;
    frmCadNF_AntecipacaoST_Itens.AntST := AntSt;

    AntSt.AnalisarItens(CadNf.Config.Conf_Geral.nf_hab_validacao_antecipacao_st.ReadString('Conf', 'PreferirAliquotaAoMVA') = 'S');

    frmCadNF_AntecipacaoST_Itens.ShowModal;

  finally
    AntSt.Free;
  end;
end;

procedure TfrmCadNF.Aplicarfatordeconversoutilizandoaquantidade1Click(
  Sender: TObject);
var
  undVenda: TUnidadeVenda_Model;
  sUndVenda: TStrings;
begin
  inherited;
  CadNf.vItem.alterar;
  try

    sUndVenda := CadNf.vItem.GetUndVendaProd();

    if sUndVenda.IndexOf(CadNf.vItem.vrDadosItem.ucom) >= 0 then
    begin
      undVenda := (sUndVenda.Objects[sUndVenda.IndexOf(CadNf.vItem.vrDadosItem.ucom)] as TUnidadeVenda_Model);

      if undVenda.fator > 0 then
        CadNf.vItem.AplicarConversaoDadosXML(undVenda);
    end;

  finally
    CadNf.vItem.cancelar;
  end;
end;

procedure TfrmCadNF.ArrecadaesReferenciadas1Click(Sender: TObject);
begin
  inherited;
  if not CadNf.vSped.vC110.dataSet.IsEmpty then
    CadNf.abreFormC112;
end;

procedure TfrmCadNF.Ativarseleomultipladenotasparacpia1Click(Sender: TObject);
begin
  inherited;
  if Ativarseleomultipladenotasparacpia1.Tag = 0 then
    toggle_multi_selecao_dbgrid1(tmOn)
  else
    toggle_multi_selecao_dbgrid1(tmOff);
end;

procedure TfrmCadNF.btDetalheDespesaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0101', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if ListBox3.ItemIndex < 0 then
  begin
    Application.MessageBox('Selecione a parcela', 'Atenção', mb_ok + MB_ICONINFORMATION);
    exit;
  end;
  try
    CadNf.abreFormDetalhesDespesa(ListBox3.ItemIndex,cdsDesp);
  except
    Application.MessageBox('Selecione a parcela', 'Atenção', mb_ok + MB_ICONINFORMATION);
  end;
end;

procedure TfrmCadNF.BitBtn100Click(Sender: TObject);
begin
  inherited;
  cdsDesp.Delete;
end;

procedure TfrmCadNF.BitBtn101Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0102', 'SALVAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.vSped.vC195_C197.Post then
    TForm(pnCadastroC195197.Parent).ModalResult := IDOK
  else
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
end;

procedure TfrmCadNF.BitBtn102Click(Sender: TObject);
begin
  inherited;
  CadNf.vSped.vC195_C197.Cancel;
  TForm(pnCadastroC195197.Parent).ModalResult := mrCancel;
end;

procedure TfrmCadNF.BitBtn103Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL_LANCAMENTOS_FISCAIS', 'I', CadNf.buscas) then
    Exit;
  if not vDadosIni.PesqPros('NF0103', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.vSped.vC195_C197.incluirC195_c197(
  CadNf.dataSet.FieldByName('cod_nf').AsInteger, 0, 0, 0, 0, 0) then
    CadNf.abreFormCadastroC195_C197;
end;

procedure TfrmCadNF.BitBtn104Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL_LANCAMENTOS_FISCAIS', 'A', CadNf.buscas) then
    Exit;
  if not vDadosIni.PesqPros('NF0104', 'ALTERAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.vSped.vC195_C197.Edit then
    CadNf.abreFormCadastroC195_C197;
end;

procedure TfrmCadNF.BitBtn105Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL_LANCAMENTOS_FISCAIS', 'E', CadNf.buscas) then
    Exit;

  if not vDadosIni.PesqPros('NF0230', 'EXCLUIR', 'NUM NF '+ CadNf.fstr('NUM_NF'), 'NOTAFISCAL',
    CadNf.fstr('COD_NF'), CadNf.buscas, True) then
    Exit;

  CadNf.vSped.vC195_C197.Delete;
end;

procedure TfrmCadNF.BitBtn106Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL_LANCAMENTOS_FISCAIS', 'I', CadNf.buscas) then
    Exit;
  if not vDadosIni.PesqPros('NF0103', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.abreFormItensLancFiscal then
    if CadNf.vSped.vC195_C197.incluirC195_c197(
      CadNf.dataSet.FieldByName('cod_nf').AsInteger,
      CadNf.vItem.dataSet.FieldByName('nitem').AsInteger, 0, 0, 0, 0) then
      CadNf.abreFormCadastroC195_C197;
end;

procedure TfrmCadNF.BitBtn107Click(Sender: TObject);
begin
  inherited;
  TForm(pnConsultaC195_C197.Parent).ModalResult := mrCancel;
end;

procedure TfrmCadNF.BitBtn108Click(Sender: TObject);
begin
  inherited;
  TForm(pnItensLancF.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn109Click(Sender: TObject);
begin
  inherited;
  TForm(pnItensLancF.Parent).ModalResult := mrCancel;
end;

procedure TfrmCadNF.BitBtn110Click(Sender: TObject);
begin
  inherited;
  TForm(pnDadosAdConsumo.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn111Click(Sender: TObject);
begin
  inherited;
  CadNf.efetualBackupArquivosXML;
end;

procedure TfrmCadNF.BitBtn112Click(Sender: TObject);
begin
  inherited;
  BitBtn56.Enabled := CadNf.existeNotaFiscalComplementar(edNumNfCompl.AsInteger, edSerieCompl.Text);
end;

procedure TfrmCadNF.BitBtn113Click(Sender: TObject);
begin
  inherited;
  TForm(pnAtencTrib.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn114Click(Sender: TObject);
begin
  inherited;
  TForm(pnAtencTrib.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn115Click(Sender: TObject);
begin
  inherited;
  CadNf.abreShiftF12Servico;
end;

procedure TfrmCadNF.bt_nf_serv_add_pedpvendaClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    CadNf.emitirNotaFiscalEletronicaServicos;
    TForm(panelGrupoVenda.Parent).ModalResult := IDCANCEL;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn117Click(Sender: TObject);
begin
  inherited;
  CadNf.ativaDesativaCalculoSt('N','N');
end;

procedure TfrmCadNF.BitBtn118Click(Sender: TObject);
begin
  inherited;
  CadNf.ativaDesativaCalculoSt('N','S');
end;

procedure TfrmCadNF.BitBtn119Click(Sender: TObject);
begin
  inherited;
  CadNf.ativaDesativaCalculoSt('S','N');
end;

procedure TfrmCadNF.bt_obscont_alterarClick(Sender: TObject);
begin
  inherited;
  try
//    if CadNf.obsCont.dataSet.FieldByName('origem_ped').AsString = 'S' then
//      if not vDadosIni.PesqPros('NF0202', 'ALTERAR', 'NUM NF' + IntToStr(CadNf.campo_num_nf),
//        'NOTAFISCAL_DUP', IntToStr(CadNf.campo_cod_nf), CadNf.buscas, True) then
//        exit;
    if not (CadNf.dataSet.State  in [dsEdit, dsInsert]) then
      ShowErro('Dados da nota fiscal não podem ser alterados')
    else if CadNf.obsCont.dataSet.IsEmpty then
      ShowErro('Sem registro selecionado')
    else if CadNf.obsCont.Edit then
      vDadosIni.abreForm('Observações do Contribuinte', pncadObsCont, opFormsDefCad);
  finally
    CadNf.obsCont.dataSet.Cancel;
  end;
end;

procedure TfrmCadNF.bt_obscont_incluirClick(Sender: TObject);
begin
  inherited;
  try
    if not (CadNf.dataSet.State  in [dsEdit, dsInsert]) then
      ShowErro('Dados da nota fiscal não podem ser alterados')
    else if CadNf.obsCont.Insert then
      vDadosIni.abreForm('Observações do Contribuinte', pncadObsCont, opFormsDefCad);
  finally
    CadNf.obsCont.dataSet.Cancel;
  end;
end;

procedure TfrmCadNF.bt_obscont_removerClick(Sender: TObject);
begin
  inherited;
//  if CadNf.obsCont.dataSet.FieldByName('origem_ped').AsString = 'S' then
//    if not vDadosIni.PesqPros('NF0200', 'EXCLUIR', 'NUM NF' + IntToStr(CadNf.campo_num_nf),
//      'NOTAFISCAL_DUP', IntToStr(CadNf.campo_cod_nf), CadNf.buscas, True) then
//      exit;
  if not (CadNf.dataSet.State  in [dsEdit, dsInsert]) then
    ShowErro('Dados da nota fiscal não podem ser alterados')
  else
   CadNf.obsCont.Delete;
end;

procedure TfrmCadNF.btErrosImportacaoClick(Sender: TObject);
begin
  inherited;
  TForm(pnErrosImportacao.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.btErrosImportacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if key = VK_ESCAPE then
    btErrosImportacao.Click;
end;

procedure TfrmCadNF.btNF_ent_pedvendaClick(Sender: TObject);
begin
  inherited;
  bt_nf_prod_add_pedpvenda.Hint := 'Anexar a nota Fiscal - [NF0215]';
  bt_nf_serv_add_pedpvenda.Visible := False;
  vDadosIni.vInibeMensPesqPros := 'S';
  ckValorNf.Visible := vDadosIni.PesqPros('NF0192', 'HABILITAR', '', 'NOTAFISCAL', '', CadNf.buscas, True);
  if not ckValorNf.Visible then
    ckValorNf.Checked := False;
  vStringEntradaSaidaFormEscolhaNF := 'E';
  vStringProdOuServNF := 'P';

//  if Trim(vStringProdOuServNF) = '' then
//    Exit;
  if CadNf.incluirNf(tnfProdutos, 'P', 'E') then
  begin
    getDadosFormularioMontarNfPedVenda;
    if CadNf.abreFormPedidoDeVenda then
      TForm(pnEscolhaNFBotoes.Parent).ModalResult := IDOK
    else
      CadNf.CancelUpdates;
  end;
end;

procedure TfrmCadNF.btSaidaClick(Sender: TObject);
begin
	if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'I', CadNf.buscas) then
    Exit;

  if VerificarNotasPendentesCancelamento then
    Exit;
    
  if VerificarNotasPendentesSefaz then
    Exit;
  try
    Screen.Cursor := crHourGlass;

    try ARecNo := CadNf.dataSet.RecNo; except end;
    inherited;

    vDadosIni.vInibeMensPesqPros := 'S';
	  btnXMLNFS.Visible := vDadosIni.PesqPros('NF0220', 'HABILITAR', '', 'NOTAFISCAL', '', CadNf.buscas, True);
    if vDadosIni.abreForm('Saída de Nota Fiscal', pnSaida, opFormsDefCad) then
      habilitaCamposCadastroNotaFiscal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn120Click(Sender: TObject);
begin
  inherited;
  CadNf.ativaDesativaCalculoSt('S','S');
end;

procedure TfrmCadNF.BitBtn121Click(Sender: TObject);
begin
  inherited;
  TForm(pnAtivDesativCalcSt.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn122Click(Sender: TObject);
var
  vMargemProd: TMargemProduto;
begin
  try
    Screen.Cursor := crHourGlass;
    vMargemProd.cadMargemProduto;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn123Click(Sender: TObject);
begin
  inherited;
  TForm(pnCSTPISCOFINS.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn123KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn123.Click;
end;

procedure TfrmCadNF.BitBtn124Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0051', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  if CadNf.notaFechada then
    exit;
  if not CadNf.validaCabecalho then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    exit;
  end;
  if not CadNf.validaRodape then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    exit;
  end;

  if CadNf.campo_natureza_nf = 'E' then
  begin
    if CadNf.dataSet.FieldByName('valor_prod').AsFloat <= 0 then
    begin
      Application.MessageBox('Valor total dos produtos zerado','Atenção',0+64);
      exit;
    end;
  end;

  if CadNf.incluirItemNFVeiculoEntrada then
  begin
    buildCadastroItensDtSet(Sender);

    if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
      DBComboBox2.SetFocus;
    btCancelarItemVeiculo.Tag := 1;
  end;
end;

procedure TfrmCadNF.BitBtn125Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0072', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  TForm(pnAlterarDadosSPED.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn126Click(Sender: TObject);
begin
  inherited;
  TForm(pnAlterarDadosSPED.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn127Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0073', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.vItem.Edit then
  begin
    pnAlterarItemSPED.Visible := True;
    pnConsultaItemSPED.Visible := False;
    if (Self.Enabled) and (Self.Visible) and (DBEdit244.CanFocus) then
    	DBEdit244.SetFocus;
  end;
end;

procedure TfrmCadNF.BitBtn128Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0074', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.vItem.salvaItemAlteracaoSintegra(CadNf) then
  begin
    pnConsultaItemSPED.Visible := True;
    pnAlterarItemSPED.Visible := False;
  end;
end;

procedure TfrmCadNF.BitBtn129Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.Cancel;
  pnConsultaItemSPED.Visible := True;
  pnAlterarItemSPED.Visible := False;
end;

procedure TfrmCadNF.BitBtn12Click(Sender: TObject);
begin
  inherited;
  try
    if CadNf.setFatura(ListBox2.ItemIndex, edDocumento.Text, edVencimentoBol.Text,
      edValorBol.AsValue) then
      getFaturas
    else
      Application.MessageBox('Erro ao modificar duplicata', 'Atenção', 0 + 64);
  finally
    BitBtn7.Enabled := True;
    ListBox2.Enabled := True;
    Panel5.Visible := False;
    BitBtn12.Visible := False;
  end;
end;

procedure TfrmCadNF.BitBtn130Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0052', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.notaFechada then
    exit;
  if not CadNf.validaCabecalho then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    exit;
  end;
  if not CadNf.validaRodape then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    exit;
  end;
  if not (CadNf.vItem.dataSet.State in [dsInsert, dsEdit]) then
    CadNf.vItem.Edit;
  if CadNf.vItem.DataSet.state = dsEdit then
  begin
    CadNf.alterarItensNfVeiculoEntrada;
    buildCadastroItensDtSet(Sender);

    if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
      DBComboBox2.SetFocus;
    btCancelarItemVeiculo.Tag := 0;
  end;
end;

procedure TfrmCadNF.BitBtn131Click(Sender: TObject);
var
  vOK: Boolean;
  vMsg: string;
begin
  inherited;
  CadNf.vItem.dataSet.First;
  while not CadNf.vItem.dataSet.Eof do
  begin
    if (CadNf.cfopDeDevolucao(Trunc(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsFloat))) or
     (CadNf.cfopDeDevolucaoSPED(Trunc(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsFloat))) then
    begin
      vOK := (CadNf.vItem.dataSet.FieldByName('cod_nf_dev').AsInteger <> 0) or
        (CadNf.vItem.dataSet.FieldByName('nitem_dev').AsInteger <> 0);
      if not vOK then
        vMsg := 'Item Nº ' + CadNf.vItem.dataSet.FieldByName('NITEM').AsString +
          ' com CFOP de devolução. Por favor informe os dados da nota fiscal devolvida'
      else
      begin
        vOK := CadNf.ExecutaComandosSql('select nitem from notafiscal_item' +
          ' where cod_nf = ' + IntToStr(CadNf.vItem.dataSet.FieldByName('cod_nf_dev').AsInteger) +
          ' and nitem = ' + IntToStr(CadNf.vItem.dataSet.FieldByName('nitem_dev').AsInteger) );
        if not vOK then
          vMsg := 'Item Nº ' + CadNf.vItem.dataSet.FieldByName('NITEM').AsString +
            ' com CFOP de devolução. Não encontrada a nota fiscal informada para o item'
      end;

      if (vDadosIni.vEmp.vRegime <> 'SIMPLES') and (vDadosIni.vEmp.vSpedIncidTribPISCOFINS <> '2') then
      if not vOK then
        if not vDadosIni.PesqPros('NF0122', 'VALIDAR', 'NUM NF ' + CadNf.dataSet.FieldByName('NUM_NF').AsString +
          ' N ITEM ' + CadNf.vItem.dataSet.FieldByName('NITEM').AsString +
          ' COD NF ' + CadNf.dataSet.FieldByName('COD_NF').AsString , 'NOTAFISCAL_ITEM',
          CadNf.dataSet.FieldByName('COD_NF').AsString, CadNf.buscas, True ) then
        begin
          Application.MessageBox(pchar(vMsg), 'Atenção', 0 + 64);
          Exit;
        end;
    end;
    CadNf.vItem.dataSet.Next;
  end;
  TForm(pnDevolucaoItens.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn132Click(Sender: TObject);
begin
  inherited;

  if not CadNf.existeNFDevolvida(StrToInt(vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 1))) then
    Exit;

  if DBGrid34.DataSource.DataSet.FieldByName('nitem').AsInteger = 0 then
  begin
    Application.MessageBox('Item não encontrado para nota fiscal informada', 'Atenção', 0 + 64);
    exit;
  end;

  CadNf.vItem.dataSet.Edit;
  CadNf.vItem.dataSet.FieldByName('cod_nf_dev').AsInteger := StrToInt(vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 1));
  CadNf.vItem.dataSet.FieldByName('nitem_dev').AsInteger := DBGrid34.DataSource.DataSet.FieldByName('nitem').AsInteger;
  CadNf.vItem.dataSet.Post;
end;

procedure TfrmCadNF.BitBtn133Click(Sender: TObject);
begin
  inherited;

  if Application.MessageBox(pchar('Se sair desta tela a nota fiscal não será confirmada'+#13+
    'Deseja continuar?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;
  TForm(pnDevolucaoItens.Parent).ModalResult := IDCANCEL;
  
end;

procedure TfrmCadNF.BitBtn134Click(Sender: TObject);
begin
  inherited;
  CadNf.removerItemVeiculo;
end;

procedure TfrmCadNF.BitBtn135Click(Sender: TObject);
begin
  inherited;
  CadNf.vSped.vC110.vC114.abreC114(CadNf.dataSet.FieldByName('cod_nf').AsInteger);
  if CadNf.vSped.vC110.vC114.dataSet.IsEmpty then
  begin
    Application.MessageBox('Nota Fiscal não tem cupons referenciados', 'Atenção', 0 + 64);
    exit;
  end;
  CadNf.abreFormC114(False); 
end;

procedure TfrmCadNF.BitBtn136Click(Sender: TObject);
begin
  inherited;
  CadNf.vSped.vC110.vC115.abreC115(CadNf.dataSet.FieldByName('cod_nf').AsInteger);
  if CadNf.vSped.vC110.vC115.dataSet.IsEmpty then
  begin
    Application.MessageBox('Nota Fiscal não tem dados de Coleta e/ou Entrega', 'Atenção', 0 +
      64);
    exit;
  end;
  CadNf.abreFormC115(False);
end;

procedure TfrmCadNF.BitBtn137Click(Sender: TObject);
begin
  inherited;

  if FrameIbsCbsDetItemNf1 = nil then
  begin
    FrameIbsCbsDetItemNf1                 := TFrameIbsCbs.Create(Self);
    FrameIbsCbsDetItemNf1.Name            := 'FrameIbsCbsDetItemNf1';
    FrameIbsCbsDetItemNf1.Parent          := ScrollBoxIbsCbsFrameDetItemNF;
    FrameIbsCbsDetItemNf1.Align           := alTop;
    FrameIbsCbsDetItemNf1.Setup( True );
  end;

  CadNf.abreFormDetalhesItensNF;
end;

procedure TfrmCadNF.BitBtn138Click(Sender: TObject);
begin
  inherited;
  TForm(pnFormDetalhesNF.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn138KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn138.Click;
end;

procedure TfrmCadNF.BitBtn139Click(Sender: TObject);
begin
  inherited;
  TForm(pnDetalhesItensNF.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn13Click(Sender: TObject);
begin
  inherited;
  TForm(pnEtiquetas.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.btSalvarC111Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0080', 'SALVAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, true) then
    Exit;
  if CadNf.vSped.vC110.vC111.Post then
  begin
    pnC111Consulta.Visible := True;
    pnC111Cadastro.Visible := False;
  end;
end;

procedure TfrmCadNF.btSalvarC112Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0084', 'SALVAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.vSped.vC110.vC112.Post then
  begin
    pnC112Consulta.Visible := True;
    pnC112Cadastro.Visible := False;
  end;
end;

procedure TfrmCadNF.btSalvarC113Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0087', 'SALVAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if not CadNf.vSped.vC110.vC113.existeNotaFiscal(UpperCase(edNaturezaC113.Text),
    UpperCase(edSerieC113.Text), edNumNFC113.AsInteger, edClForC113.AsInteger) then
    exit;
  if CadNf.vSped.vC110.incluirC113 then
    if CadNf.vSped.vC110.vC113.Post then
      TForm(pnC113Cadastro.Parent).ModalResult := IDOK;
    {
    begin
      pnC113Consulta.Visible := True;
      pnC113Cadastro.Visible := False;
    end;
    }
end;

procedure TfrmCadNF.btSalvarC114Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0091', 'SALVAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.notaFechada then
  begin
    pnC114Consulta.Visible := True;
    pnC114Cadastro.Visible := False;
    Exit;
  end;
  if CadNf.vSped.vC110.vC114.Post then
  begin
    pnC114Consulta.Visible := True;
    pnC114Cadastro.Visible := False;
  end;
end;

procedure TfrmCadNF.btSalvarC115Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0095', 'SALVAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.notaFechada then
  begin
    pnC115Consulta.Visible := True;
    pnC115Cadastro.Visible := False;
    Exit;
  end;
  if CadNf.vSped.vC110.vC115.Post then
  begin
    pnC115Consulta.Visible := True;
    pnC115Cadastro.Visible := False;
  end;
end;

procedure TfrmCadNF.btSalvarC120Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0099', 'SALVAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.vSped.vC120.Post then
  begin
    pnC120Consulta.Visible := True;
    pnC120Cadastro.Visible := False;
  end;
end;

procedure TfrmCadNF.btSalvarDetalhesECFClick(Sender: TObject);
begin
  inherited;
  CadNf.vItem.vDetEcf.vECF :=
    CadNf.vItem.dataSet.FieldByName('ecf').AsString = 'E';
  if CadNf.vItem.vDetEcf.Post then
  begin
    edNumSerieEcf.Enabled := True;
    TForm(pnECFEntrada.Parent).ModalResult := IDOK;
  end;
end;

procedure TfrmCadNF.BitBtn140Click(Sender: TObject);
begin
  inherited;
  TForm(pnImportacao.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn141Click(Sender: TObject);
var
	hdTemp: THandle;
  formulario: TForm;
begin
  inherited;
  vDadosIni.vPesquisa := 'HISTORICO_CARGA|' + IntToStr(CadNf.dataSet.FieldByName('cod_nf').AsInteger) + '|' +
    Trim('NF') + '|';

  formulario := Funcoes.AbreForm('pkOrdemCarregamento', 'TfrmHistoricoEntregas', hdTemp);
  try
    if Trim(vDadosIni.vPesquisa) <> '' then
      formulario.ShowModal; 
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

procedure TfrmCadNF.BitBtn142Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NF0133', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL_ITEM_DI',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  dbcbxUFTERCEIRO.Items.Text := vDadosIni.getListaUF(True);

  if CadNf.vItem.vDI.Insert then
    vDadosIni.abreForm('DI - Documento de Importação', pnDI, opFormsDefCad);
end;

procedure TfrmCadNF.BitBtn143Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NF0134', 'ALTERAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL_ITEM_DI',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  dbcbxUFTERCEIRO.Items.Text := vDadosIni.getListaUF(True);

  if CadNf.vItem.vDI.Edit then
    vDadosIni.abreForm('DI - Documento de Importação', pnDI, opFormsDefCad);
end;

procedure TfrmCadNF.BitBtn144Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.vDI.Delete;
end;

procedure TfrmCadNF.BitBtn145Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NF0137', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL_ITEM_ADI',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  if CadNf.vItem.vDI.vADI.Insert then
    vDadosIni.abreForm('ADI - Adição de Documento de Importação', pnADI, opFormsDefCad);
end;

procedure TfrmCadNF.BitBtn146Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NF0138', 'ALTERAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL_ITEM_ADI',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  if CadNf.vItem.vDI.vADI.Edit then
    vDadosIni.abreForm('ADI - Adição de Documento de Importação', pnADI, opFormsDefCad);
end;

procedure TfrmCadNF.BitBtn147Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.vDI.vADI.Delete;
end;

procedure TfrmCadNF.BitBtn148Click(Sender: TObject);
begin
  inherited;
  if CadNf.vItem.vDI.Post then
    TForm(pnDI.Parent).ModalResult := IDOK
  else
    setFocusCampoErro(CadNf.vItem.vDI.vNomeCampoErro, CadNf.vItem.vDI.vMensagemErro);
end;

procedure TfrmCadNF.BitBtn149Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.vDI.Cancel;
  TForm(pnDI.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn14Click(Sender: TObject);
begin
  inherited;
  TForm(pnECFEntrada.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.btIncluirItemProdDetalhadoClick(Sender: TObject);
begin
  inherited;
  if not CadNf.Auditor.Processo(IfThen(CadNf.fequals('tipo_nf', 'O'), 'NF0055', 'NF0047'),
    'NUM NF '+ CadNf.fstr('NUM_NF'), CadNf.fstr('COD_NF'))
    .Inserir.Permitido then
    Exit;

  // para o produtos nao precisa chamar o inserir
  if CadNf.fequals('tipo_nf', 'O') then
  begin
    if not CadNf.incluirItemOutrasNf then
      Exit;
  end
  else if not CadNf.incluirItemProduto then
    Exit;

  FrameIbsCbs1.Reset();

  getCamposDetalhado;

  uvnd_fill_select;

  buildCadastroItens;

  Exit;

  {
  pgControlItensNFe.ActivePage := tsMerc_Mercadorias;
  btAlterarItemProdDetalhado.Tag:= CadNf.vItem.dataSet.FieldByName('nitem').AsInteger;
  if CadNf.notaFechada then
    exit;
  if not CadNf.validaCabecalho then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    exit;
  end;
  if not CadNf.validaRodape then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    exit;
  end;

  eddNumFabFornecedor.Visible := False;
  if CadNf.campo_natureza_nf = 'E' then
  begin
    if CadNf.dataSet.FieldByName('valor_prod').AsFloat <= 0 then
    begin
      Application.MessageBox('Valor total dos produtos zerado','Atenção',0+64);
      exit;
    end;
    eddNumFab.Left := 271;
    eddNumFab.Width := 90;
    eddNumFabFornecedor.Visible := True;
  end;

  btHabPISCOFINS.Enabled := (CadNf.campo_natureza_nf = 'E') or (CadNf.dataSet.FieldByName('devolucao').AsString = 'SIM');
  SpeedButton41.Enabled := (CadNf.campo_natureza_nf = 'E');

  CadNf.vItem.cancelar;
  getCamposDetalhado;

  eddNumFab.Enabled                    := CadNf.vItem.vrDadosItem.stado <> dsEdit;
  eddTipo.Enabled                      := CadNf.vItem.vrDadosItem.stado <> dsEdit;
  btEditGrade.Visible                  := False;
  pnCadastroItensProdDetalhado.Visible := True;
  pnCadastroItensProdDetalhado.Enabled := True;
  pnConsultaItensProdDetalhado.Visible := False;
  pnConsultaItensProdDetalhado.Enabled := False;
  edDTipo.Text                         := 'P';
  eddTipo.Enabled                      := False;
  eddMNF.Text                          := CadNf.vItem.dataSet.FieldByName('mnf').AsString;
  ed_rateio_seguro.Enabled             := ck_tipo_seguro.Checked;
  ed_rateio_frete.Enabled              := ck_tipo_frete.Checked;
  if (Self.Enabled) and (Self.Visible) and (eddNumFabFornecedor.CanFocus) and (vDadosIni.vEmp.vBuscaCodNoProduto <> 'S') then
    eddNumFabFornecedor.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (eddTipo.CanFocus) then
    eddTipo.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (eddNumFab.CanFocus) then
    eddNumFab.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (eddDescricao.CanFocus) then
    eddDescricao.SetFocus;
  }
end;

procedure TfrmCadNF.btIncluirItemServicoDetalhadoClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0046', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  if not CadNf.incluirItemServico then
    Exit;

  getCamposDetalhado;

  uvnd_fill_select;

  buildCadastroItens;

  Exit;
  {
  pgControlItensNFe.ActivePage := tsMerc_Mercadorias;
  if CadNf.notaFechada then
    exit;
  if not CadNf.validaCabecalho then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    exit;
  end;
  if not CadNf.validaRodape then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    exit;
  end;

  if CadNf.campo_natureza_nf = 'E' then
    if CadNf.dataSet.FieldByName('valor_serv').AsFloat <= 0 then
    begin
      Application.MessageBox('Valor total dos serviços zerado','Atenção',0+64);
      exit;
    end;

  //btHabPISCOFINS.Enabled := (CadNf.dataSet.FieldByName('devolucao').AsString = 'SIM') or
  //                          (CadNf.campo_natureza_nf = 'E');
  //bt_it_pc_alterar_aliq_perc.Enabled := (CadNf.campo_natureza_nf = 'E');

  eddNumFab.Left := 188;
  eddNumFab.Width := 174;
  eddNumFabFornecedor.Visible := False;

  CadNf.vItem.cancelar;
  getCamposDetalhado;
  eddNumFab.Enabled := CadNf.vItem.vrDadosItem.stado <> dsEdit;
  eddTipo.Enabled := CadNf.vItem.vrDadosItem.stado <> dsEdit;
  ed_rateio_seguro.Enabled := False;
  ed_rateio_frete.Enabled  := False;
  pnCadastroItensProdDetalhado.Visible := True;
  pnCadastroItensProdDetalhado.Enabled := True;
  pnConsultaItensProdDetalhado.Visible := False;
  pnConsultaItensProdDetalhado.Enabled := False;
  edDTipo.Text := 'S';
  eddTipo.Enabled := False;
  if (Self.Enabled) and (Self.Visible) and (eddTipo.CanFocus) then
    eddTipo.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (eddNumFab.CanFocus) then
    eddNumFab.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (eddDescricao.CanFocus) then
    eddDescricao.SetFocus;
    }
end;

procedure TfrmCadNF.btIncluirItensDespesaClick(Sender: TObject);
var
  tributosRTC: TributoDFeContextEtd;
  IsInclusao, IsAlteracao: Boolean;
begin
  IsInclusao := Sender = btIncluirItensDespesa;
  IsAlteracao := Sender = btAlterarItensDespesa;

  if IsInclusao then
    if not vDadosIni.PesqPros('NF0059', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
      CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
      Exit;

  if IsAlteracao then
    if not vDadosIni.PesqPros('NF0060', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
      CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
      Exit;

  if not CadNf.validaCabecalho then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    exit;
  end;

  if (IsInclusao and CadNf.incluirItemDespesaNf)
    or
    (IsAlteracao and CadNf.vItem.Edit)
  then
  begin
    if CadNf.fstrin('modelo_nf', ['6', '06', '62', '66']) then
      TFloatField(CadNf.vItem.dataSet.FieldByName('valor_unitario')).DisplayFormat := ''
    else
      TFloatField(CadNf.vItem.dataSet.FieldByName('valor_unitario')).DisplayFormat := '#,##0.000000';

    pageItensDespesas.ActivePage := tsDesp_Item;

    pnCadastroItensDespesa.Visible := True;
    if (Self.Enabled) and (Self.Visible) and (DBEdit62.CanFocus) then
    	DBEdit62.SetFocus;
    pnConsultaItensDespesa.Visible := False;
    
    {$REGION 'Tributos da RTC'}

    tributosRTC := CadNf.vItem.GetStateTributoRTC();
    try
      if (tributosRTC = nil)
        or ( (tributosRTC.IbsCbs = nil) and (tributosRTC.ImpostoSeletivo = nil) )
      then
        FrameIbsCbsDesp1.Setup( nil )
      else
        FrameIbsCbsDesp1.Setup( tributosRTC.IbsCbs );

      FrameIbsCbsDesp1.Reset();
    finally
      tributosRTC.Free();
    end;

    {$ENDREGION}

  end;
end;

procedure TfrmCadNF.btmanutencaoRenaveClick(Sender: TObject);
var
  paramsValues: WideString;
begin
  inherited;
  paramsValues := Format(';databaseName=%s;empresaid=%d;silent=false;userHW=HW;userLevel=10;nfId=%d',
                         [vDadosIni.vBancoHW, vDadosIni.cod_empresa, CadNf.fint('cod_nf')]);
  renave_zero_estoque_renave(paramsValues);
end;

procedure TfrmCadNF.btnExportContinuarClick(Sender: TObject);
begin
  inherited;
  if not CadNf._validaDadosExportacao  then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    Exit;
  end;

  TForm(pnDadosExportacao.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.btNotaRetornoClick(Sender: TObject);
begin
  inherited;
  grupoRetorno.Enabled := True;
  if not vDadosIni.abreForm('Dados da Nota Fiscal emitida para retorno da nota fiscal informada',
    pnGrupoCFOPRetorno, opFormsDefCad) then
    if (Self.Enabled) and (Self.Visible) and (ed_codigo_nop.CanFocus) then
      ed_codigo_nop.SetFocus;
end;

procedure TfrmCadNF.btNovoC111Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0078', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.vSped.vC110.incluirC111 then
  begin
    pnC111Cadastro.Visible := True;
    pnC111Consulta.Visible := False;
    if (Self.Enabled) and (Self.Visible) and (DBEdit150.CanFocus) then
    	DBEdit150.SetFocus;
  end;
end;

procedure TfrmCadNF.btNovoC112Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0082', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.vSped.vC110.incluirC112 then
  begin
    pnC112Cadastro.Visible := True;
    pnC112Consulta.Visible := False;
    if (Self.Enabled) and (Self.Visible) and (DBCombobox9.CanFocus) then
    	DBComboBox9.SetFocus;
  end;
end;

procedure TfrmCadNF.btNovoC113Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0086', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  vDadosIni.abreForm('Referenciar de uma NF no banco', pnC113Cadastro, opFormsDefCad + [ofEscapeExit]);
  {
  edNumNFC113.AsValue := 0;
  edClForC113.AsValue := 0;
  edNomeClForC113.Text := '';
  pnC113Cadastro.Visible := True;
  pnC113Consulta.Visible := False;
  if (Self.Enabled) and (Self.Visible) and (edNaturezaC113.CanFocus) then
    edNaturezaC113.SetFocus;
  }
end;

procedure TfrmCadNF.btNovoC114Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0089', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.vSped.vC110.incluirC114 then
  begin
    pnC114Cadastro.Visible := True;
    pnC114Consulta.Visible := False;
    if (Self.Enabled) and (Self.Visible) and (DBCombobox8.CanFocus) then
    	DBComboBox8.SetFocus;
  end;
end;

procedure TfrmCadNF.btNovoC115Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0093', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.vSped.vC110.incluirC115 then
  begin
    pnC115Cadastro.Visible := True;
    pnC115Consulta.Visible := False;
    if (Self.Enabled) and (Self.Visible) and (DBRadioGroup6.CanFocus) then
    	DBRadioGroup6.SetFocus;
  end;
end;

procedure TfrmCadNF.btNovoC120Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0097', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.vSped.vC120.Insert then
  begin
    CadNf.vSped.vC120.dataSet.FieldByName('cod_nf').AsInteger :=
      CadNf.dataSet.FieldByName('cod_nf').AsInteger;
    CadNf.vSped.vC120.dataSet.FieldByName('cod_empresa').AsString :=
      vDadosIni.codEmpresa;
    pnC120Cadastro.Visible := True;
    pnC120Consulta.Visible := False;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox10.CanFocus) then
    	DBComboBox10.SetFocus;
  end;
end;

procedure TfrmCadNF.btOHabPISCOFINSClick(Sender: TObject);
begin
  inherited;
  tsOut_PISCOFINS.Enabled := True;
  tsOut_PISCOFINS.TabVisible := True;
  tsOut_PISCOFINS.Show;
end;

procedure TfrmCadNF.btOkCSTTransitoClick(Sender: TObject);
begin
  inherited;
  TForm(pnCSTTransito.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.btAlterarItemProdDetalhadoClick(Sender: TObject);
begin
  inherited;
  if not CadNf.Auditor.Processo(IfThen(CadNf.fequals('tipo_nf', 'O'), 'NF0056', 'NF0048'),
    'NUM NF '+ CadNf.fstr('NUM_NF'), CadNf.fstr('COD_NF'))
    .Inserir.Permitido then
    Exit;
//  if not vDadosIni.PesqPros('NF0048', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
//    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
//    Exit;

  if not CadNf.vItem.alterar then
    Exit;

  FrameIbsCbs1.Reset();

  getCamposDetalhado;

  uvnd_fill_select(CadNf.vItem.vrDadosItem.unidade_nf);

  buildCadastroItens;
  Exit;

  {
  pgControlItensNFe.ActivePage := tsMerc_Mercadorias;
  btAlterarItemProdDetalhado.Tag:= CadNf.vItem.dataSet.FieldByName('nitem').AsInteger;
  if not CadNf.validaCabecalho then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    exit;
  end;

  btHabPISCOFINS.Enabled := (CadNf.dataSet.FieldByName('devolucao').AsString = 'SIM') or
                            (CadNf.campo_natureza_nf = 'E');
  bt_it_pc_alterar_aliq_perc.Enabled := (CadNf.campo_natureza_nf = 'E');

  if not CadNf.vItem.alterar then
    Exit;


  getCamposDetalhado;
  if vDadosIni.vEmp.vRegime = 'SIMPLES' then
    eddCSOSN.Text := CadNf.getCSOSNPorCST(eddCST.AsString, eddCSOSN.AsString, False);
//    eddCSTExit(eddCST);
//    pnCombustiveis.Visible := (Trim(CadNf.vItem.vrDadosItem.comb_cprodanp) <> '') and (Trim(vDadosIni.vEmp.vCombProduto) = 'S');
  if (eddNumFabFornecedor.Visible) then
    eddNumFabFornecedor.Enabled := (CadNf.vItem.vrDadosItem.stado <> dsEdit) or
      ((CadNf.vItem.vrDadosItem.tipo_item = 'P') and (CadNf.vItem.vrDadosItem.cod_prod = ''));
  eddNumFab.Enabled := (CadNf.vItem.vrDadosItem.stado <> dsEdit) or
  ((CadNf.vItem.vrDadosItem.tipo_item = 'P') and (CadNf.vItem.vrDadosItem.cod_prod = ''));
  eddTipo.Enabled := CadNf.vItem.vrDadosItem.stado <> dsEdit;
  btEditGrade.Visible := CadNf.vItem.vrDadosItem.cod_grade > 0;
  ed_rateio_seguro.Enabled := (CadNf.vItem.vrDadosItem.tipo_item <> 'S') and (ck_tipo_seguro.Checked);
  ed_rateio_frete.Enabled  := (CadNf.vItem.vrDadosItem.tipo_item <> 'S') and (ck_tipo_frete.Checked);
  pnCadastroItensProdDetalhado.Visible := True;
  pnCadastroItensProdDetalhado.Enabled := True;
  pnConsultaItensProdDetalhado.Visible := False;
  pnConsultaItensProdDetalhado.Enabled := False;

  buildCadastroItensAlteracaoTributo;

  if (eddNumFabFornecedor.CanFocus)  then
  begin
  	if (Self.Enabled) and (Self.Visible) and (eddNumFabFornecedor.CanFocus) then
    	eddNumFabFornecedor.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (eddDescricao.CanFocus) then
    eddDescricao.SetFocus;
  }
end;

procedure TfrmCadNF.btRemoverC111Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0081', 'EXCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  CadNf.vSped.vC110.vC111.Delete;
end;

procedure TfrmCadNF.btRemoverC112Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0085', 'EXCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  CadNf.vSped.vC110.vC112.Delete;
end;

procedure TfrmCadNF.btRemoverC113Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0088', 'EXCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  CadNf.vSped.vC110.vC113.Delete;
end;

procedure TfrmCadNF.btRemoverC114Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0092', 'EXCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  CadNf.vSped.vC110.vC114.Delete;
end;

procedure TfrmCadNF.btRemoverC115Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0096', 'EXCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  CadNf.vSped.vC110.vC115.Delete;
end;

procedure TfrmCadNF.btRemoverC120Click(Sender: TObject);
begin
  inherited;
    if not vDadosIni.PesqPros('NF0100', 'SALVAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  CadNf.vSped.vC120.Delete;
end;

procedure TfrmCadNF.btRemoverItemOutrasNfClick(Sender: TObject);
begin
  inherited;
  CadNf.vItem.prepare_loop();
  Screen.Cursor := crHourGlass;
  try
    CadNf.removerItem;
  finally
    CadNf.vItem.prepare_loop_done();
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btResumoNFClick(Sender: TObject);
begin
  inherited;
  CadNf.imprimirResumo;
end;

procedure TfrmCadNF.btSalvarItemOutrasNFClick(Sender: TObject);
var
  vOK: Boolean;
begin
  inherited;
  if not vDadosIni.PesqPros('NF0057', 'SALVAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if Trim(edOnCodigo.Text) = '' then
    Exit;
  vOK := False;
  setCamposOutrasNf;
  if not CadNf.calcularValorItemDesconto then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro, True);
    exit;
  end;

  if not CadNf.calcularValores then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro, True);
    exit;
  end;

  if CadNf.vItem.vrDadosItem.stado = dsEdit then
    vOK := CadNf.alterarItem
  else
    vOK := CadNf.incluirItem;
  if vOK then
  begin
    CadNf.somaTotaisNF;
    pnConsultaItensOutrasNF.Visible := True;
    pnCadastroItensOutrasNf.Visible := False;
  end
  else
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro, True);
  getCamposOutrasNF;
end;

procedure TfrmCadNF.btSalvarItemVeiculoClick(Sender: TObject);
var
  vMarcItem: Pointer;
  vMarcItemDet: Pointer;
begin
  inherited;
  if not vDadosIni.PesqPros('NF0054', 'SALVAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  vMarcItem := CadNf.vItem.dataSet.GetBookmark;

  if not CadNf.vItem.verificaExistenciaVeiculo then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit52.CanFocus) then
      DBEdit52.SetFocus;
    exit;
  end;

  if not ValidarSetarIbsCbsCalculoItemDtSetCallBack(FrameIbsCbsVeic1) then
    Exit;

  if CadNf.salvaDadosVeiculo() then
  begin
    btCalcularNf.Enabled     := True;
    pnItensVeiculo.Enabled   := False;
    FrameIbsCbsVeic1.Enabled := False;
    btConfirmarNF.Enabled    := CadNf.permiteConfirmacao;

    if (CadNf.campo_natureza_nf = 'E')  then
    begin
      pnConsultaItensVeiculos.Visible := True;
      pnCadastroItensVeiculos.Visible := False;
      if (Self.Enabled) and (Self.Visible) and (BitBtn124.CanFocus) then
        BitBtn124.SetFocus;
    end;

    btAlterarItemVeiculo.Enabled  := True;
    btSalvarItemVeiculo.Enabled   := False;
    btCancelarItemVeiculo.Enabled := False;
    btCalcularNf.Enabled := True;
    btDetalhesVeiculo.Enabled := True;

    CadNf.somaTotaisNF;
    if not CadNf.validaCabecalho then
    begin
      setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
      exit;
    end;

    groupItensNota.Parent        := tsnf_ResumoNota;
    pageDadosNF.ActivePage       := tsnf_ResumoNota;
    pageItensVeiculos.ActivePage := tsVeic_Item;

    CadNf.vItem.dataSet.GotoBookmark(vMarcItem);
    CadNf.vItem.Edit;
    vMarcItemDet := CadNf.vItem.vDetVeic.dataSet.GetBookmark;

    CadNf.salvaDadosDetalhesVeiculo;

    CadNf.vItem.dataSet.GotoBookmark(vMarcItem);
    CadNf.vItem.vDetVeic.dataSet.GotoBookmark(vMarcItemDet);

    CadNf.abreFormDetalheVeiculo;
  end
  else
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
end;

procedure TfrmCadNF.btSalvarItensDespesaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0061', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  if not ValidarSetarIbsCbsCalculoItemDtSetCallBack(FrameIbsCbsDesp1) then
    Exit;  

  if CadNf.salvaDespesa then
  begin
    TFloatField(CadNf.vItem.dataSet.FieldByName('valor_unitario')).DisplayFormat := '#,##0.000000';

    CadNf.somaTotaisNF;
    pnConsultaItensDespesa.Visible := True;
    pnCadastroItensDespesa.Visible := False;
  end;
end;

procedure TfrmCadNF.btSalvarParametrosClick(Sender: TObject);
begin
  inherited;
  if CadNf.vInfCompl.Post then
  begin
    pnCadastroParametros.Visible := False;
    pnConsultaParametros.Visible := True;
  end;
end;

procedure TfrmCadNF.btStatusNFeClick(Sender: TObject);
begin
  inherited;
  CadNf.ConsultarNFe;
  habilitaCamposCadastroNotaFiscal;
end;

procedure TfrmCadNF.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  CadNf.checkUnCheckAllRows(False);
end;

procedure TfrmCadNF.BitBtn150Click(Sender: TObject);
begin
  inherited;
  if CadNf.vItem.vDI.vADI.Post then
    TForm(pnADI.Parent).ModalResult := IDOK
  else
    setFocusCampoErro(CadNf.vItem.vDI.vADI.vNomeCampoErro, CadNf.vItem.vDI.vADI.vMensagemErro);
end;

procedure TfrmCadNF.BitBtn151Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.vDI.vADI.Cancel;
  TForm(pnADI.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn152Click(Sender: TObject);
begin
  inherited;
  if not CadNf.vItemNFVFE._dataTemp.IsEmpty then
  begin
    CadNf.vItemNFVFE.vNumNF:= EditHw7.AsInteger;
    TForm(pnVendaForaEstabelecimento.Parent).ModalResult := IDOK;
  end;
end;

procedure TfrmCadNF.BitBtn153Click(Sender: TObject);
begin
  inherited;
  TForm(pnVendaForaEstabelecimento.Parent).ModalResult := IDCANCEL;

end;

procedure TfrmCadNF.BitBtn154Click(Sender: TObject);
begin
  inherited;
  TForm(pnNotasForaEstab.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn155Click(Sender: TObject);
begin
  inherited;
  if CadNf.campo_situacao_nfe <> sitAutorizada then
  begin
    Application.MessageBox('Nota Fiscal não autorizada', 'Atenção', 64);
    Exit;
  end;

  if not vDadosIni.PesqPros('NF0146', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL_CARTA_CORRECAO',
    CadNf.vCC_e.dataSet.FieldByName('IDLOTE').AsString, dtmNF.qrBuscas, True) then
    Exit;

  Label558.Caption := IntToStr(Length(Trim(DBMemo16.Text)));
  DBComboBox22.Enabled := True;

  if CadNf.vCC_e.Insert then
  	if (Self.Enabled) and (Self.Visible) and (DBComboBox22.CanFocus) then
    	DBComboBox22.SetFocus;
end;

procedure TfrmCadNF.BitBtn156Click(Sender: TObject);
begin
  inherited;
  TForm(pnCC_e.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn156KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn156.Click;
end;

procedure TfrmCadNF.BitBtn157Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'A', CadNf.buscas) then
    Exit;
  if not vDadosIni.PesqPros('NF0145', 'VISUALIZAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.vCC_e.selecionaCC_e(CadNf.dataSet.FieldByName('cod_nf').AsInteger) then
    CadNf.abreFormCartaCorrecaoEletronica;
end;

procedure TfrmCadNF.BitBtn158Click(Sender: TObject);
begin
  inherited;
  if CadNf.campo_situacao_nfe <> sitAutorizada then
  begin
    Application.MessageBox('Nota Fiscal não autorizada', 'Atenção', 64);
    Exit;
  end;

  if CadNf.vCC_e.Post then
  begin
    if CadNf.vCC_e.dataSet.FieldByName('tipo_evento').AsString = 'CAN' then
    begin
      
      if not vDadosIni.PesqPros('NF0026', 'CANCELAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString + ' NATUREZA ' + CadNf.campo_natureza_nf,
        'NOTAFISCAL', CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
        Exit;

      if CadNf.vCC_e._enviarCancelamento then
        if CadNf.vCC_e._CC_eAutorizada then
          if CadNf.vCC_e._NF_e_Cancelada then
          begin
            CadNf.cancelarNotaFiscal(ocEventoCanc);
            CadNf.vCC_e._imprimirEvento;
          end;
    end
    else if CadNf.vCC_e.dataSet.FieldByName('tipo_evento').AsString = 'CCE' then
    begin
      if CadNf.vCC_e._enviarCC_e then
        if CadNf.vCC_e._CC_eAutorizada then
          CadNf.vCC_e._imprimirEvento;
    end;
//        QuickRep1.Preview;
  end;
end;

procedure TfrmCadNF.BitBtn159Click(Sender: TObject);
begin
  inherited;
  if CadNf.vCC_e._CC_eAutorizada then
  begin
    CadNf.vCC_e._imprimirEvento;
//    QuickRep1.Preview;
  end;
end;

procedure TfrmCadNF.BitBtn15Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadNf.vPedVNf.pesquisaPedVenda(ckReqPV.Checked, ckOSPV.Checked, Trunc(edNPedVenda.AsValue),
      edCodClForPedVenda.AsInteger, edDataIniPV.Text, edDataFimPV.Text, ckPVApenasComCupomFiscal.Checked, ckVendasVAN.Checked) then
    begin
      ckPVApenasComCupomFiscalClick(ckPVApenasComCupomFiscal);
      ckEsconderNotasClick(ckEsconderNotas);
      {
      if (vDadosIni.vEmp.vUsarUmaVendaPorNF = 'S') and (not ckPVApenasComCupomFiscal.Checked) then
      begin
        DBGrid2.Options :=[dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit];
        DBGrid2.Tag := 0;
      end
      else
      begin
        DBGrid2.Options :=[dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
        DBGrid2.Tag := 1;
      end;
      }
    	if (Self.Enabled) and (Self.Visible) and (DBGrid2.CanFocus) then
      	DBGrid2.SetFocus;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn160Click(Sender: TObject);
begin
  inherited;
  if (CadNf.vCC_e.dataSet.State in [dsinsert, dsEdit]) then
    CadNf.vCC_e.Cancel
  else
    BitBtn156.Click;
end;

procedure TfrmCadNF.BitBtn161Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0146', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL_CARTA_CORRECAO',
    CadNf.vCC_e.dataSet.FieldByName('IDLOTE').AsString, dtmNF.qrBuscas, True) then
    Exit;

  Label558.Caption := IntToStr(Length(Trim(DBMemo16.Text)));
  DBComboBox22.Enabled := False;

  if CadNf.vCC_e.Edit then
  	if (Self.Enabled) and (Self.Visible) and (DBMemo16.CanFocus) then
    	DBMemo16.SetFocus;
end;

procedure TfrmCadNF.BitBtn162Click(Sender: TObject);
begin
  inherited;
  
  if not vDadosIni.PesqPros('NF0148', 'EXCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL_CARTA_CORRECAO',
    CadNf.vCC_e.dataSet.FieldByName('IDLOTE').AsString, dtmNF.qrBuscas, True) then
    Exit;

  CadNf.vCC_e.Delete;

  Label558.Caption := IntToStr(Length(Trim(DBMemo16.Text)));
end;

procedure TfrmCadNF.BitBtn163Click(Sender: TObject);
begin
  inherited;
  CadNf.abrirCadastroObrigacoesICMSDifal(True);
end;

procedure TfrmCadNF.BitBtn164Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.divergNcmCest.selecionarAcaoCEST( 'cad');
  habilitarComponentesNcmCest;
end;

procedure TfrmCadNF.btSelectAllClick(Sender: TObject);
begin
  inherited;
  CadNf.checkUnCheckAllRows(True);
end;

procedure TfrmCadNF.btSelTermnalAdmContinuarClick(Sender: TObject);
begin
  inherited;
  if Trim(edNumTerminalAdm.Text) <> '' then
    vDadosIni.vPesquisa := Trim(edNumTerminalAdm.Text)
  else
    vDadosIni.vPesquisa := string(dblkListaTermAdm.KeyValue);

  dblkListaTermAdm.KeyField := '';
  dblkListaTermAdm.ListField := '';
  dblkListaTermAdm.ListSource := nil;
  dsDiversos.DataSet := CadNf.buscas;

  TForm(pnSelTermnalAdm.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.btDadosCartaoADMClick(Sender: TObject);
begin
  if vDadosIni.GetIni('TEF', 'POSVirtual', 'N') <> 'S' then
  begin
    Application.MessageBox('POS Virtual desativado!', 'Atenção', 0 + 64);
    Exit;
  end;
  if not vDadosIni.PesqPros('NF0194', 'INICIAR', vDadosIni.vNomeUsuario, '', '', dtmNF.qrBuscasNf2, True) then
    Exit;
  if not vDadosIni.operacaoPosVirtual(posADM, 'Operação Administrativo', '', 0, dtmNF.qrBuscasNf2) then
  begin
    vDadosIni.GravaAuditoria('NF0194', 'INICIAR', 'OPERACAO CANCELADA - ' + vDadosIni.vNomeUsuario, '', vDadosIni.vPOSV.numeroDocumento, dtmNF.qrBuscasNf2);
    Exit;
  end;

  if vDadosIni.vPOSV.retorno = retSucesso then
    vDadosIni.GravaAuditoria('NF0194', 'INICIAR', 'SUCESSO - ' + vDadosIni.vNomeUsuario, '', vDadosIni.vPOSV.numeroDocumento, dtmNF.qrBuscasNf2)
  else
    vDadosIni.GravaAuditoria('NF0194', 'INICIAR', 'FALHA - ' + vDadosIni.vNomeUsuario, '', vDadosIni.vPOSV.numeroDocumento, dtmNF.qrBuscasNf2);
end;

procedure TfrmCadNF.btDadosCartaoCancelarClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    dbgridDadosCartoes.Visible := False;
    CadNf.efetuarCancelamentoTransacaoCartaoRegistroSelecionado;
  finally
    dbgridDadosCartoes.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btDadosCartaoReceberClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    dbgridDadosCartoes.Visible := False;
    CadNf.efetuarTransacaoCartaoRegistroSelecionado;
  finally
    dbgridDadosCartoes.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btDadosCartaoVoltarClick(Sender: TObject);
begin
  inherited;
  TForm(pnDadosCartao.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn165Click(Sender: TObject);
begin
  inherited;
  if CadNf.vCC_e._CC_eAutorizada then
  begin
    CadNf.vCC_e._enviarEmailEvento;
//    QuickRep1.Preview;
  end;
end;

procedure TfrmCadNF.BitBtn166Click(Sender: TObject);
var
  Actrl: TControlesNF;
begin
  inherited;
  if CadNf.vBol = nil then
    CadNf.vBol:= TBoletasNF.create;
  CadNf.vItem.selecionaItens(CadNf.dataSet.FieldByName('cod_nf').AsInteger);

  try
    CadNf.vBol.selecionaBoletas(CadNf.dataSet.FieldByName('cod_nf').AsInteger);
    if CadNf.vBol.dataSet.RecordCount = 0 then
    begin
      CadNf.vBol.selecionaBoletas(CadNf.dataSet.FieldByName('num_nf').AsInteger,
        StrToInt(CadNf.dataSet.FieldByName('serie').AsString));
    end;
  except
    Exit;
  end;

  vDadosIni.abreForm('Detalhes das faturas da nota fiscal', pnFaturasDetalhes, opFormsDefCad);
  {
  if not CadNf.vBol.dataSet.IsEmpty then
    CadNf.abreFormFaturasSaida(False, not CadNf.vBol.dataSet.IsEmpty)
  else
  if CadNf.gerarFaturas(True) then
    if CadNf.abreFormFaturasSaida(True, not CadNf.vBol.dataSet.IsEmpty) then
      if vDadosIni.vEmp.vConfGerarBoletoNF = 'S' then
        CadNf.CommitaTransacao;
        }
end;

procedure TfrmCadNF.BitBtn167Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0154', 'EXCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString + ' EXCLUIR BOLETAS', 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  CadNf.vBol.dataSet.First;
  while not CadNf.vBol.Eof do
  begin
    if Trim(CadNf.vBol.dataSet.FieldByName('remessa_enviada').AsString) = 'S' then
    begin
      Application.MessageBox('Remessa ja gerada ou enviada. Exclusão não permitida', 'Atenção', 0 + 64);
      Exit;
    end;

    if Trim(CadNf.vBol.dataSet.FieldByName('nosso_numero_banco').AsString) <> '' then
      if Application.MessageBox('Boletos ja foram impressos. Deseja continuar assim mesmo?', 'Confirmação',
        MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;

    CadNf.vBol.dataSet.Next;
  end;

  CadNf.buscas.Close;
  CadNf.buscas.SQL.Text := 'delete from boletas where num_nf_vnd = ' +
    CadNf.dataSet.FieldByName('num_nf').AsString +
    ' and cod_empresa = ' + CadNf.dataSet.FieldByName('COD_EMPRESA').AsString + ' and sub_serie = '
    + Trim(CadNf.dataSet.FieldByName('SERIE').AsString);
  CadNf.buscas.Prepare;
  try
    CadNf.buscas.ExecSQL;
    CadNf.CommitaTransacao;

    if CadNf.vBol = nil then
      CadNf.vBol:= TBoletasNF.create;
    CadNf.vItem.selecionaItens(CadNf.dataSet.FieldByName('cod_nf').AsInteger);

    try
      CadNf.vBol.selecionaBoletas(CadNf.dataSet.FieldByName('cod_nf').AsInteger);
      if CadNf.vBol.dataSet.RecordCount = 0 then
      begin
        CadNf.vBol.selecionaBoletas(CadNf.dataSet.FieldByName('num_nf').AsInteger,
          StrToInt(CadNf.dataSet.FieldByName('serie').AsString));
      end;
    except
      Exit;
    end;

  except
    on e: exception do begin
      CadNf.registraErro(e.Message);
      Application.MessageBox(pchar('Erro ao excluir boletos. Erro: ' + e.Message), 'Atenção', 0 + 64 );
    end;
  end;
end;

procedure TfrmCadNF.BitBtn168Click(Sender: TObject);
begin
  CadNf.vSped.vC110.Apply;
  CadNf.vSped.vC120.Apply;
  CadNf.vSped.vC195_C197.Apply;
  CadNf.CommitaTransacao;
  TForm(pnSpedFiscal.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn169Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.selecionaItens(CadNf.dataSet.FieldByName('cod_nf').AsInteger);
  CadNf.abreFormDadosStCobradaAntecipada(True);
end;

procedure TfrmCadNF.bt_nf_prod_add_pedpvendaClick(Sender: TObject);
var
  Amensagem: TStrings;
  CFOPentrada: Integer;
  CSTEntrada : string;
  Processo: string;
begin
  inherited;
  Processo := IfThen(CadNf.fstr('natureza_nf') = 'E', 'NF0215', 'NF0068');
  if not vDadosIni.PesqPros(Processo, 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  if CadNf.fstr('natureza_nf') = 'E' then
  begin
    lb_entrada_retorno_pedvenda_cst.Caption  := IfThen(vDadosIni.vEmp.vRegime = 'SIMPLES', 'CSOSN', 'CST');
    if lb_entrada_retorno_pedvenda_cst.Caption = 'CST' then
      ed_entrada_retorno_pedvenda_cst.AsValue  := StrToIntDef(_LerConfiguracoesRegistroString(ed_entrada_retorno_pedvenda_cst.Name , '090' ), 90)
    else
      ed_entrada_retorno_pedvenda_cst.AsValue  := StrToIntDef(_LerConfiguracoesRegistroString(ed_entrada_retorno_pedvenda_cst.Name + 'CSOSN' , '900' ), 900);
    ed_entrada_retorno_pedvenda_cfop.AsValue := StrToIntDef(_LerConfiguracoesRegistroString(ed_entrada_retorno_pedvenda_cfop.Name, '1949'), 1949);

    if not vDadosIni.abreForm('Dados para a entrada', pn_entrada_retorno_pedvenda, opFormsDefCad) then
      Exit;

    if lb_entrada_retorno_pedvenda_cst.Caption = 'CST' then
      _GravaConfiguracoesString(ed_entrada_retorno_pedvenda_cst.Name , ed_entrada_retorno_pedvenda_cst.AsString )
    else
      _GravaConfiguracoesString(ed_entrada_retorno_pedvenda_cst.Name + 'CSOSN', ed_entrada_retorno_pedvenda_cst.AsString );
    _GravaConfiguracoesString(ed_entrada_retorno_pedvenda_cfop.Name, ed_entrada_retorno_pedvenda_cfop.AsString);

    CFOPentrada := ed_entrada_retorno_pedvenda_cfop.AsInteger;
    CSTEntrada  := ed_entrada_retorno_pedvenda_cst.AsString;

  end
  else
  begin
    CFOPentrada := 0;
    CSTEntrada  := '';
  end;

  Amensagem := TStringList.Create;
  CadNf.vPedVNf.vItem.prepare_loop();
  CadNf.vItem.prepare_loop();
  Screen.Cursor := crHourGlass;
  try
    if CadNf.vPedVNf.dataSet.IsEmpty then
    begin

    end;
    CadNf.vObsOS := False;
    //if (vDadosIni.vEmp.vUsarUmaVendaPorNF <> 'S') or (DBGrid2.Tag = 1) then
    if (vDadosIni.vEmp.vUsarUmaVendaPorNF <> 'S') or (ckPVApenasComCupomFiscal.Checked) or (CadNf.fstr('natureza_nf') = 'E') then
    begin
      try
        CadNf.vPedVNf.dataSet.Filter := 'SEL = ''S''';
        CadNf.vPedVNf.dataSet.Filtered := True;

        CadNf.vPedVNf.dataSet.First;
        while not CadNf.vPedVNf.dataSet.Eof do
        begin
          Application.ProcessMessages;
          //if DBGrid2.SelectedRows.CurrentRowSelected then

            if not CadNf.adicionaVendaAnotaFiscal(ckValorNf.Checked, False, Amensagem, CSTEntrada, CFOPentrada) then
            begin
              TForm(panelGrupoVenda.Parent).ModalResult := IDCANCEL;
            end;
          CadNf.vPedVNf.dataSet.Next;
        end;
      finally
        ckEsconderNotasClick(ckEsconderNotas);
      end;
    end
    else
    begin
      if not CadNf.adicionaVendaAnotaFiscal(ckValorNf.Checked, True, Amensagem, CSTEntrada, CFOPentrada) then
      begin
        TForm(panelGrupoVenda.Parent).ModalResult := IDCANCEL;
      end;
    end;

    setDadosFormularioMontarNfPedVenda;
    TForm(panelGrupoVenda.Parent).ModalResult := IDOK;

    
    if Amensagem.Count > 0 then
    begin
      Amensagem.Insert(0, '');
      Amensagem.Insert(0, 'Existem CF ou NFC-e referenciados. Favor informar nos Dados Adicionais (Interesse do Fisco)');
      Application.MessageBox(PChar(Amensagem.Text), 'Atenção', 64);
    end;
  finally
    CadNf.vPedVNf.vItem.prepare_loop_done();
    CadNf.vPedVNf.vItem.filterClear;
    CadNf.vItem.prepare_loop_done();
    CadNf.vObsOS := False;
    FreeAndNil(Amensagem);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn170Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NF0155', 'ABRIR', '', 'NF_DESTINADAS',
    '', dtmNF.qrBuscas, True) then
    Exit;

  if CadNf.manifestacaoDestinatario then
  begin
    if CadNf.importaXml(CadNf.vManifestDest.vXML) then
    begin
      habilitaCamposCadastroNotaFiscal;
      CadNf.vItem.dataSet.First;
      TForm(pnEntSaidaNFe.Parent).ModalResult := IDOK;
    end;
  end;
end;

procedure TfrmCadNF.BitBtn171Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NF0156', 'PESQUISAR', '', 'NF_DESTINADAS',
    '', dtmNF.qrBuscas, True) then
    Exit;
  try
    Screen.Cursor := crHourGlass;

    CadNf.vManifestDest._cpfCnpj := Edit6.Text;
    CadNf.vManifestDest._numNf := EditHw1.AsInteger;
    CadNf.vManifestDest._dtIni := MaskEdit4.Text;
    CadNf.vManifestDest._dtFim := MaskEdit5.Text;
    CadNf.vManifestDest._entSa := Edit7.Text;

    if not CheckBox11.Visible then
    	CadNf.vManifestDest._autorizadas := False
    else
    	CadNf.vManifestDest._autorizadas := CheckBox11.Checked;

    if not CheckBox12.Visible then
    	CadNf.vManifestDest._canceladas := False
    else
    	CadNf.vManifestDest._canceladas := CheckBox12.Checked;

    CadNf.vManifestDest._ciencia := CheckBox13.Checked;
    CadNf.vManifestDest._desconhecimento := CheckBox14.Checked;
    CadNf.vManifestDest._naoRealizada := CheckBox15.Checked;
    CadNf.vManifestDest._confirmacao := CheckBox16.Checked;
    CadNf.vManifestDest.pesquisar;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn172Click(Sender: TObject);
begin
  inherited;
  CadNf.abreFormDevolucoesReferenciadas;
end;

procedure TfrmCadNF.BitBtn173Click(Sender: TObject);
begin
  inherited;
  TForm(pnDevolucoesRef.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn174Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0169', 'VALIDAR', '', 'NOTAFISCAL',
    CadNf.vItem.dataSet.FieldByName('COD_NF').AsString, CadNf.buscas, True) then
    Exit;
  CadNf.vBaixaPedidos.vAutomatica := False;
  if CadNf.vBaixaPedidos.validaBaixaSemMarcarPedidos(CadNF.vItem) then
    TForm(pnBaixaItensPedidos.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn175Click(Sender: TObject);
begin
  inherited;
  TForm(pnBaixaItensPedidos.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn176Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0170', 'VALIDAR', '', 'NOTAFISCAL',
    CadNf.vItem.dataSet.FieldByName('COD_NF').AsString, CadNf.buscas, True) then
    Exit;
  CadNf.vBaixaPedidos.vAutomatica := True;
  TForm(pnBaixaItensPedidos.Parent).ModalResult := IDOK;  
end;

procedure TfrmCadNF.BitBtn177Click(Sender: TObject);
begin
  inherited;
//  if not vDadosIni.PesqPros('NF0041', 'CONSULTA', '', 'NOTAFISCAL',
//    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
//    Exit;
  if CadNf.montarNFSaidaMPInsumosProducao(InputBox('Código da Produção','Informe o Código da Produção','Informar o código aqui')) then
  begin
    TForm(pnSaida.Parent).ModalResult := IDOK;
  end;
end;

procedure TfrmCadNF.BitBtn178Click(Sender: TObject);
begin
  inherited;
  CadNf.abreFormDadosAdicionaisDespesa;
end;

procedure TfrmCadNF.BitBtn179Click(Sender: TObject);
begin
  inherited;
  CadNf.limparReferenciaDevolucao;
end;

procedure TfrmCadNF.btRemoverItemProdDetalhadoClick(Sender: TObject);
begin
  inherited;
  CadNf.vItem.prepare_loop([ol_storeRecno, ol_storeFilter, ol_disableControls, ol_filterClear_done]);
  Screen.Cursor := crHourGlass;
  try
    CadNf.removerItem;
  finally
    CadNf.vItem.prepare_loop_done();
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btImprimirClick(Sender: TObject);
begin
  inherited;
  CadNf.vImpNF := CheckBox2.Checked;
  CadNf.vImpEspelho := CheckBox4.Checked;
  CadNf.vImpResumo := CheckBox5.Checked;
  CadNf.vImpEtiTerm := CheckBox6.Checked;
  CadNf.vImpEtiComum := CheckBox17.Checked;
  CadNf.vImpRelProdAlterados := CheckBox7.Checked;
  CadNf.vImpEtiqPeq := CheckBox8.Checked;
  CadNf.vImpEtiqGra := CheckBox9.Checked;
  CadNf.vImpEtiq1Col := CheckBox10.Checked;
  CadNf.vImpCopiaCTP := ckCopiaCtpFinanceiro.Checked;
//  CadNf.vImpDadosTransporte := ckDadosTransporte.Checked;
//  CadNf.vImpDanfeSimplificado := ckDanfeSimplificado.Checked;
  TForm(pnImpressao.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.btIncluirItemOutrasNfClick(Sender: TObject);
begin
  inherited;
  if not CadNf.validaCabecalho then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    exit;
  end;
  if CadNf.incluirItemOutrasNf then
  begin
    pgControlOItensNFe.ActivePage := tsOut_Mercadorias;

    btOHabPISCOFINS.Enabled := True;

    SpeedButton45.Enabled := (CadNf.campo_natureza_nf = 'E');

    pnCadastroItensOutrasNf.Visible := True;
    pnConsultaItensOutrasNF.Visible := False;
    getCamposOutrasNF;
    if (Self.Enabled) and (Self.Visible) and (edOnCodigo.CanFocus) then
    	edOnCodigo.SetFocus;
  end;
end;

procedure TfrmCadNF.BitBtn180Click(Sender: TObject);
begin
  inherited;
  cadnf.visualizarReferenciaDevolucao;
end;

procedure TfrmCadNF.BitBtn181Click(Sender: TObject);
begin
  inherited;
  CadNf.referenciarDevolucao;
end;

procedure TfrmCadNF.BitBtn182Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.divergNcmCest.selecionarAcaoCEST('xml');
  habilitarComponentesNcmCest;
end;

procedure TfrmCadNF.BitBtn183Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.divergNcmCest.selecionarAcaoNCM('cad');
  habilitarComponentesNcmCest;
end;

procedure TfrmCadNF.BitBtn184Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.divergNcmCest.selecionarAcaoNCM('xml');
  habilitarComponentesNcmCest;
end;

procedure TfrmCadNF.BitBtn185Click(Sender: TObject);
begin
  inherited;
  if not CadNf.vItem.divergNcmCest.divergenciasMarcadas then
  begin
    Application.MessageBox('Existem divergencias não solucionadas', 'Atenção', MB_ICONWARNING + MB_OK);
    if not vDadosIni.PesqPros('NF0196', 'VALIDAR', '', 'NOTAFISCAL', '', CadNf.buscas, True, True) then
      Exit;
  end;
  TForm(pnIrregularidadesNCMCEST.Parent).ModalResult := mrOk;
end;

procedure TfrmCadNF.BitBtn186Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja mesmo cancelar a concerreção das divergencias? A nota não será salva',
    'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
     TForm(pnIrregularidadesNCMCEST.Parent).ModalResult := mrCancel;
end;

procedure TfrmCadNF.BitBtn187Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0086', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  vDadosIni.abreForm('', pnNovaRefNFeChave, [ofAutoSize, ofEscapeExit]);
end;

procedure TfrmCadNF.BitBtn188Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0087', 'SALVAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if not ValidaChaveNFe(PChar(OnlyNumber(Edit8.Text))) then
  begin
    vDadosIni.ShowErro('Chave inválida');
    Exit;
  end;
  if CadNf.vSped.vC110.incluirC113 then
    if CadNf.vSped.vC110.vC113.salvarReferenciaPelaChaveNFe(OnlyNumber(Edit8.Text)) then
      TForm(pnNovaRefNFeChave.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.btNFeAutorizar2Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    btNFeAutorizar2.Enabled := False;
    CadNf.printEtqDanfe := handleImpressaoEtiquetas;

    CadNf.nfe_autorizacao(ckNFeAutorizacao_print.Checked, ckNFeAutorizacao_mail.Checked, ckNFeAutorizacao_Bol.Checked, ckNFeAutorizacao_onlySel.Checked,
                          IfThen(cbNFeAutorizacao_tipoDanfe.Visible, cbNFeAutorizacao_tipoDanfe.Text));

    CadNf.printEtqDanfe();
  finally
    btNFeAutorizar2.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btNFeAutorizarClick(Sender: TObject);
var
  I: Integer;
  list: TStrings;
begin
  inherited;
  if not vDadosIni.PesqPros('HW512', 'ENVIAR', 'NUM NF' + IntToStr(CadNf.campo_num_nf),
    'NFE', IntToStr(CadNf.campo_cod_nf), CadNf.buscas, True) then
      exit;
  try
    Screen.Cursor := crHourGlass;
    btNFeAutorizar.Enabled := False;

    ckNFeAutorizacao_print.Checked   := regGetConfBool(ckNFeAutorizacao_print.Name  , ckNFeAutorizacao_print.Checked);
    ckNFeAutorizacao_mail.Checked    := regGetConfBool(ckNFeAutorizacao_mail.Name   , ckNFeAutorizacao_mail.Checked);
    ckNFeAutorizacao_Bol.Checked     := regGetConfBool(ckNFeAutorizacao_Bol.Name   , ckNFeAutorizacao_Bol.Checked);
    ckNFeAutorizacao_onlySel.Checked := CadNf.SetArrayOfcod_nf > 0;

    cbNFeAutorizacao_tipoDanfe.Visible := StartsText('Selecionar', vDadosIni.vEmp.vNfe.danfeTipo);
    cbNFeAutorizacao_tipoDanfe.ItemIndex := regGetConfInt('SelecaoTipoDANFe', 0);
    {
    pnNFeModulo_Enviar.Height := IfThen(cbNFeAutorizacao_tipoDanfe.Visible, 173, 144);
    ckNFeAutorizacao_onlySel.Top := IfThen(cbNFeAutorizacao_tipoDanfe.Visible, 97, 70);
    }
    CheckListEtiq2.Items.Clear;
    list := CadNf.GetListEtiquetasDanfe(True);
    pnNFeModulo_Imprimir_Etiq.Visible := list.Count > 0;
    for I := 0 to List.Count - 1 do
      CheckListEtiq2.AddItem(list[i], list.Objects[i]);

    pnNFeModulo_Enviar_Opcoes.Height := IfThen(cbNFeAutorizacao_tipoDanfe.Visible, 85, 52);
    pnNFeModulo_Imprimir_Etiq.Parent := pnNFeModulo_Enviar;
    pnNFeModulo_Imprimir_Etiq.Top := pnNFeModulo_Enviar_Opcoes.Top + pnNFeModulo_Enviar_Opcoes.Height + 6;
    pnNFeModulo_Enviar_Botoes.Top := pnNFeModulo_Imprimir_Etiq.Top + pnNFeModulo_Imprimir_Etiq.Height + 6;
    pnNFeModulo_Enviar.Height := pnNFeModulo_Enviar_Botoes.Top + pnNFeModulo_Enviar_Botoes.Height + 12;

    vDadosIni.abreForm('Enviar pedido de Autorização', pnNFeModulo_Enviar, opFormsDefCad + [ofEscapeExit, ofAutoSize]);

    regSetConfBool(ckNFeAutorizacao_print.Name, ckNFeAutorizacao_print.Checked);
    regSetConfBool(ckNFeAutorizacao_mail.Name , ckNFeAutorizacao_mail.Checked);
    regSetConfBool(ckNFeAutorizacao_Bol.Name  , ckNFeAutorizacao_Bol.Checked);
    regSetConfInt('SelecaoTipoDANFe', cbNFeAutorizacao_tipoDanfe.ItemIndex);
  finally
    btNFeAutorizar.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btNFeImprimir2Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    btNFeImprimir2.Enabled := False;
    btNFeImprimirEtq2.Enabled := False;

    CadNf.nfe_impressao(ckNFeImpressao_print.Checked, ckNFeImpressao_pdf.Checked, ckNFeImpressao_onlySel.Checked, edNFeImpressao_pathPDF.Text,
                        IfThen(cbNFeImpressao_tipoDanfe.Visible, cbNFeImpressao_tipoDanfe.Text));

    btNFeImprimirEtq2.Click;

  finally
    btNFeImprimir2.Enabled := True;
    btNFeImprimirEtq2.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btNFeImprimirClick(Sender: TObject);
var
  I: Integer;
  list: TStrings;
begin
  inherited;
  if not vDadosIni.PesqPros('HW516', 'IMPRIMIR', 'NUM NF' + IntToStr(CadNf.campo_num_nf),
    'NFE', IntToStr(CadNf.campo_cod_nf), CadNf.buscas, True) then
      exit;
  try
    Screen.Cursor := crHourGlass;
    btNFeImprimir.Enabled := False;

    ckNFeImpressao_print.Checked   := regGetConfBool(ckNFeImpressao_print.Name  , ckNFeImpressao_print.Checked);
    ckNFeImpressao_pdf.Checked     := regGetConfBool(ckNFeImpressao_pdf.Name    , ckNFeImpressao_pdf.Checked);
    edNFeImpressao_pathPDF.Text    := regGetConfStr(edNFeImpressao_pathPDF.Name , edNFeImpressao_pathPDF.Text);
    ckNFeImpressao_onlySel.Checked := CadNf.SetArrayOfcod_nf > 0;

    cbNFeImpressao_tipoDanfe.Visible := StartsText('Selecionar', vDadosIni.vEmp.vNfe.danfeTipo);
    cbNFeImpressao_tipoDanfe.ItemIndex := regGetConfInt('SelecaoTipoDANFe', 0);
    {
    pnNFeModulo_Imprimir.Height := IfThen(cbNFeImpressao_tipoDanfe.Visible, 195, 167);
    ckNFeImpressao_onlySel.Top := IfThen(cbNFeImpressao_tipoDanfe.Visible, 122, 95);
    }                                                                                                        
    CheckListEtiq2.Items.Clear;
    list := CadNf.GetListEtiquetasDanfe(False);
    pnNFeModulo_Imprimir_Etiq.Visible := list.Count > 0;
    btNFeImprimirEtq2.Visible := list.Count > 0;
    for I := 0 to List.Count - 1 do
      CheckListEtiq2.AddItem(list[i], list.Objects[i]);

    pnNFeModulo_Imprimir_Opcoes.Height := IfThen(cbNFeImpressao_tipoDanfe.Visible, 103, 73);
    pnNFeModulo_Imprimir_Etiq.Parent := pnNFeModulo_Imprimir;
    pnNFeModulo_Imprimir_Etiq.Top := pnNFeModulo_Imprimir_Opcoes.Top + pnNFeModulo_Imprimir_Opcoes.Height + 6;
    pnNFeModulo_Imprimir_Botoes.Top := pnNFeModulo_Imprimir_Etiq.Top + pnNFeModulo_Imprimir_Etiq.Height + 6;
    pnNFeModulo_Imprimir.Height := pnNFeModulo_Imprimir_Botoes.Top + pnNFeModulo_Imprimir_Botoes.Height + 12;

    vDadosIni.abreForm('Impresão de NFe', pnNFeModulo_Imprimir, opFormsDefCad + [ofEscapeExit, ofAutoSize]);

    regSetConfBool(ckNFeImpressao_print.Name  , ckNFeImpressao_print.Checked);
    regSetConfBool(ckNFeImpressao_pdf.Name    , ckNFeImpressao_pdf.Checked);
    regSetConfStr(edNFeImpressao_pathPDF.Name , edNFeImpressao_pathPDF.Text);
    regSetConfInt('SelecaoTipoDANFe', cbNFeImpressao_tipoDanfe.ItemIndex);
  finally
    btNFeImprimir.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btNFeInut_emailClick(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NFE008', 'EMAIL', '',
    'NOTAFISCAL_INUT', '', CadNf.buscas, True) then
      exit;
  try
    btNFeEmail2.OnClick := btNFeEmail2_Inutilizacao_Click;
    ckNFeEmail_UnicoEmail.Enabled := False;
    ckNFeEmail_comEventos.Enabled := False;
    ckNFeEmail_comPDF.Enabled := False;
    ckNFeEmail_comBol.Enabled := False;

    vDadosIni.abreForm('Envio de email Inutilização NFe', pnNFeModulo_Email, opFormsDefCad + [ofEscapeExit]);

  finally
    ckNFeEmail_UnicoEmail.Enabled := True;
    ckNFeEmail_comEventos.Enabled := True;
    ckNFeEmail_comPDF.Enabled := True;
    ckNFeEmail_comBol.Enabled := True;
    btNFeEmail2.OnClick := btNFeEmail2Click;
  end;
end;

procedure TfrmCadNF.btNFeInut_enviarClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    btNFeInut_enviar.Enabled := False;

    if CadNf.inut.nfe_inutilizacao_enviar(CadNf.inut.dataSet.FieldByName('seqid').AsInteger) then
      if not CadNf.dllNFe.nfe_inutilizacao_imprimir(CadNf.inut.dataSet.FieldByName('seqid').AsInteger, True, False, '') then
        vDadosIni.ShowErro(CadNf.dllNFe.retornoStr.Text);

  finally
    btNFeInut_enviar.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btNFeInut_excluirClick(Sender: TObject);
begin
  inherited;
  CadNf.inut.delete;
end;

procedure TfrmCadNF.btNFeInut_printClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    btNFeInut_print.Enabled := False;

    if not CadNf.dllNFe.nfe_inutilizacao_imprimir(CadNf.inut.dataSet.FieldByName('seqid').AsInteger, True, False, '') then
      vDadosIni.ShowErro(CadNf.dllNFe.retornoStr.Text);

  finally
    btNFeInut_print.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btNF_DClick(Sender: TObject);
begin
  inherited;
  TForm(pnEscolhaNFBotoes.Parent).ModalResult := vDadosIni.retornoPorCondicao(
    CadNf.incluirNf(tnfDespesas, 'A', vStringEntradaSaidaFormEscolhaNF[1]), IDOK, IDCANCEL);//0: D Despesas
end;

procedure TfrmCadNF.btNF_DExit(Sender: TObject);
begin
  inherited;
  memoInfNotas.Lines.Text := ActiveControl.Hint;
end;

procedure TfrmCadNF.btNF_OClick(Sender: TObject);
begin
  inherited;
  TForm(pnEscolhaNFBotoes.Parent).ModalResult := vDadosIni.retornoPorCondicao(
    CadNf.incluirNf( tnfOutras, 'A', vStringEntradaSaidaFormEscolhaNF[1]), IDOK, IDCANCEL);//0: O Outras
end;

procedure TfrmCadNF.btNF_PClick(Sender: TObject);
begin
  inherited;
  if ((vDadosIni.vEmp.vNfe.modeloNF = '55') and
    (vDadosIni.vEmp.vNfe.usarServico <> 'S')) and
    (vStringEntradaSaidaFormEscolhaNF = 'S') then
  begin
    vStringProdOuServNF := '';
    if not vDadosIni.abreForm('Escolha o tipo de Nota: Produtos ou Serviços', pnEscolhaNFBotoesProdServ, opFormsDefCad) then
      vStringProdOuServNF := '';

    vStringProdOuServNF := IfThen(vDadosIni.strIn(vStringProdOuServNF, ['P', 'S']), vStringProdOuServNF);

    if vStringProdOuServNF = 'P' then
      if not CadNf.Auditor.Visualizar.Processo('NF0243').Permitido then
        Exit;

    if Trim(vStringProdOuServNF) = '' then
      TForm(pnEscolhaNFBotoes.Parent).ModalResult := IDCANCEL
    else
      TForm(pnEscolhaNFBotoes.Parent).ModalResult := IfThen(
        CadNf.incluirNf( tnfProdutos, vStringProdOuServNF[1], vStringEntradaSaidaFormEscolhaNF[1]), IDOK, IDCANCEL);//0: P Produtos e Servicos conjugada
  end
  else
    TForm(pnEscolhaNFBotoes.Parent).ModalResult := IfThen(
      CadNf.incluirNf( tnfProdutos, 'A', vStringEntradaSaidaFormEscolhaNF[1]), IDOK, IDCANCEL);//0: P Produtos e Servicos conjugada
end;

procedure TfrmCadNF.btNF_PEnter(Sender: TObject);
begin
  inherited;
  memoInfNotas.Lines.Text := TForm(pnEscolhaNFBotoes.Parent).ActiveControl.Hint;
end;

procedure TfrmCadNF.btNF_PKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    btNF_Voltar.Click;
end;

procedure TfrmCadNF.btNF_P_ProdClick(Sender: TObject);
begin
  inherited;
  //btNF_P_Prod.Tag = 1, avulsa;

  if btNF_P_Prod.Tag = 1 then  
    if not CadNf.Auditor.Visualizar.Processo('NF0243').Permitido then
      Exit;

  vStringProdOuServNF := 'P';
  TForm(pnEscolhaNFBotoesProdServ.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.btNF_P_ProdEnter(Sender: TObject);
begin
  inherited;
  memoInfNotasProdServ.Lines.Text := TForm(pnEscolhaNFBotoesProdServ.Parent).ActiveControl.Hint;
end;

procedure TfrmCadNF.btNF_P_ProdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    btNF_Voltar_ProdServ.Click;
end;

procedure TfrmCadNF.btNF_P_ServClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0105', 'INCLUIR', '', 'NOTAFISCAL', '', CadNf.buscas) then
    Exit;

  vStringProdOuServNF := 'S';
  TForm(pnEscolhaNFBotoesProdServ.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.btNF_SClick(Sender: TObject);
begin
  inherited;
  TForm(pnEscolhaNFBotoes.Parent).ModalResult := vDadosIni.retornoPorCondicao(
    CadNf.incluirNf( tnfServicos, 'A', vStringEntradaSaidaFormEscolhaNF[1]), IDOK, IDCANCEL);//4: S Serviços somente
end;

procedure TfrmCadNF.btNF_VClick(Sender: TObject);
begin
  inherited;
  if vStringEntradaSaidaFormEscolhaNF = 'S' then
  begin
//    if not vDadosIni.PesqPros('NF0149', 'INCLUIR', '', 'NOTAFISCAL', '', CadNf.buscas, True) then
//      Exit;
    getDadosFormularioMontarNfComando;
  end;

  TForm(pnEscolhaNFBotoes.Parent).ModalResult := vDadosIni.retornoPorCondicao(
    CadNf.incluirNf( tnfVeiculos, 'A', vStringEntradaSaidaFormEscolhaNF[1]), IDOK, IDCANCEL);//0: V Veiculos
end;

procedure TfrmCadNF.btNF_VoltarClick(Sender: TObject);
begin
  inherited;
  TForm(pnEscolhaNFBotoes.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.btNF_Voltar_ProdServClick(Sender: TObject);
begin
  inherited;
  TForm(pnEscolhaNFBotoesProdServ.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn18Click(Sender: TObject);
begin
  inherited;
  setDadosFormularioMontarNfPedVenda;
  TForm(panelGrupoVenda.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.btMudAplicarOpcoesClick(Sender: TObject);
var
  AErro, ACST: string;
begin
  inherited;
  if ckMudCFOP.Checked then
  begin
    AErro := '';
    if edMudCFOP.AsValue <= 0 then
      AErro := 'CFOP não informado'
    else if CadNf.campo_natureza_nf = 'S' then
    begin
      if Pos( Copy(Trim(edMudCFOP.AsString), 1, 1) , '567') = 0 then
        AErro := 'CFOP para operações de saída deve iniciar em 5, 6 ou 7'
    end
    else if Pos( Copy(Trim(edMudCFOP.AsString), 1, 1) , '123') = 0 then
      AErro := 'CFOP para operações de entrada deve iniciar em 1, 2 ou 3';

    if AErro <> '' then
    begin
      vDadosIni.ShowErro(AErro);
      Exit;
    end;
  end;

  if ckMudCST.Checked then
  begin
    ACST := edMudOrigCST.AsString + edMudCST.AsString;
    if vDadosIni.vEmp.vRegime = 'SIMPLES' then
    begin
      if not CadNf.vItem.TestarCSOSN(edMudCSOSN.AsString, '') then
        Exit;
    end
    else if not CadNf.vItem.TestarCST(ACST) then
      Exit;
  end;

  CadNf.verificaMudancaCfopCstEmTela(False);
end;

procedure TfrmCadNF.btMudAplicarAutoClick(Sender: TObject);
begin
  inherited;                        
  CadNf.vItem.prepare_loop();
  Screen.Cursor := crHourGlass;
  try
    CadNf.verificaMudancaCfopCstEmTela(True);
  finally
    CadNf.vItem.prepare_loop_done();
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn191Click(Sender: TObject);
var
  ArescueStr: string;
begin
  inherited;
  if not CadNf.vBol.dataSet.IsEmpty then
  begin
    vDadosIni.ShowAtencao('Existem boletos gerados. Use essa opção apenas se não existir boleto');
    Exit;
  end;

  ArescueStr := vDadosIni.vEmp.vConfGerarBoletoNF;
  try
    vDadosIni.vEmp.vConfGerarBoletoNF := 'S';

    if CadNf.gerarFaturas(True) then
      if CadNf.abreFormFaturasSaida(True) then
          CadNf.CommitaTransacao;

    if CadNf.vBol = nil then
      CadNf.vBol:= TBoletasNF.create;
    CadNf.vItem.selecionaItens(CadNf.dataSet.FieldByName('cod_nf').AsInteger);

    try
      CadNf.vBol.selecionaBoletas(CadNf.dataSet.FieldByName('cod_nf').AsInteger);
      if CadNf.vBol.dataSet.RecordCount = 0 then
      begin
        CadNf.vBol.selecionaBoletas(CadNf.dataSet.FieldByName('num_nf').AsInteger,
          StrToInt(CadNf.dataSet.FieldByName('serie').AsString));
      end;
    except
      Exit;
    end;

  finally
    vDadosIni.vEmp.vConfGerarBoletoNF := ArescueStr;
  end;
end;

procedure TfrmCadNF.BitBtn192Click(Sender: TObject);
begin
  inherited;
  if CadNf.vBol.dataSet.IsEmpty then
  begin
    vDadosIni.ShowAtencao('Não existem boletos gerados');
    Exit;
  end;

  if not vDadosIni.vBoletos.ExisteConvenio then
  begin
    vDadosIni.ShowAtencao('Não existe configuração ativa de Convênios para gerar os boletos');
    exit;
  end;

  if not vDadosIni.PesqPros('NF0120', 'IMPRIMIR', 'NUM NF ' + CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, CadNf.buscas, True) then
    Exit;

  vDadosIni.gerar_boletoNFOS(
  	CadNf.dataSet.FieldByName('num_nf').AsInteger,
    StrToIntDef(CadNf.dataSet.FieldByName('serie').AsString, 0),
    'NF',
    CadNf.dataSet.FieldByName('cod_cliente').AsInteger,
    '',
    true,
    true,
    vDadosIni.retornaArrayAplicativo,
    vDadosIni.retornaArrayContato(CadNf.dataSet.FieldByName('cod_cliente').AsInteger, cBoleto),
    cBoleto);

  if CadNf.vBol = nil then
    CadNf.vBol:= TBoletasNF.create;
  CadNf.vItem.selecionaItens(CadNf.dataSet.FieldByName('cod_nf').AsInteger);

  try
    CadNf.vBol.selecionaBoletas(CadNf.dataSet.FieldByName('cod_nf').AsInteger);
    if CadNf.vBol.dataSet.RecordCount = 0 then
    begin
      CadNf.vBol.selecionaBoletas(CadNf.dataSet.FieldByName('num_nf').AsInteger,
        StrToInt(CadNf.dataSet.FieldByName('serie').AsString));
    end;
  except
    Exit;
  end;

end;

procedure TfrmCadNF.BitBtn194Click(Sender: TObject);
begin
  inherited;
  if CadNf.notaFechada then
    exit;
    
  if (CadNf.dataSet.FieldByName('num_nf_emt').AsInteger = 0) or
    (Trim(CadNf.dataSet.FieldByName('serie_emt').AsString) = '') then
  begin
    if not vDadosIni.PesqPros('NF0119', 'VALIDAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString + ' NAO ENCONTRADA NF DE REMESSA', 'NOTAFISCAL', '', CadNf.buscas, True) then
      Application.MessageBox('Dados da nota fiscal emitida não informados', 'Atenção', 0 + 64)
    else
    begin
      if CadNf.dataSet.State in [dsinsert, dsedit] then
      begin
        CadNf.dataSet.FieldByName('num_nf_emt').AsInteger := 0;
        CadNf.dataSet.FieldByName('serie_emt').AsString := '';
      end;
      vDadosIni.GravaAuditoria('NF0119', 'VALIDAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString + ' NAO INFORMOU NF DE REMESSA', 'NOTAFISCAL', '', CadNf.buscas);
      TForm(pnGrupoCFOPRetorno.Parent).ModalResult := IDOK;
    end;
  end
  else
    TForm(pnGrupoCFOPRetorno.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn195Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    CadNf.dupNFe.dataSet.DisableControls;

    eddup_gerar_valor.AsValue   := IfThen(eddup_gerar_valor.AsValue > 0, eddup_gerar_valor.AsValue);
    eddup_gerar_valorst.AsValue := IfThen(eddup_gerar_valorst.AsValue > 0, eddup_gerar_valorst.AsValue);

    if not CadNf.dupNFe.gerarAvulso(eddup_gerar_valor.AsValue,
                                    eddup_gerar_valorst.AsValue,
                                    StrToDate(eddup_vencimentost.Text),
                                    eddup_numerost.Text) then
      setFocusCampoErro(CadNf.dupNFe.vNomeCampoErro, CadNf.dupNFe.vMensagemErro)
    else
      TForm(pndup_gerar.Parent).ModalResult := IDOK;
  finally                                
    CadNf.dupNFe.dataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn198Click(Sender: TObject);
begin
  inherited;
  
  if not vDadosIni.PesqPros('NFE006', 'INSERIR', '',
    'NOTAFISCAL_INUT', '', CadNf.buscas, True) then
      exit;

  lbInut.Caption := Format('Inutilização de NFe modelo 55 ambiente de %s', [vDadosIni.vEmp.vNfe.webServiceAmbiente]);
  edInut_serie.AsValue := vDadosIni.vEmp.vSubSerieNotaFiscal;
  edInut_nnfini.AsValue := 0;
  edInut_nnffin.AsValue := 0;
  edInut_justificativa.Text := '';
  vDadosIni.abreForm('Nova Inutilização de NFe', pnNFeInut_cad, opFormsDefCad);
end;

procedure TfrmCadNF.BitBtn199Click(Sender: TObject);
var
  Ainut: TNotafiscal_inut_class;
begin
  inherited;

  Ainut := TNotafiscal_inut_class.Create;
  try
    Screen.Cursor := crHourGlass;
    BitBtn199.Enabled := False;
    Ainut.cod_empresa := StrToInt(vDadosIni.codEmpresa);
    Ainut.tpamb       := IfThen(vDadosIni.vEmp.vNfe.webServiceAmbiente <> 'Produção', '2', '1');
    Ainut.ano         := YearOf(Date);
    Ainut.cnpj        := vDadosIni.vEmp.vCNPJ;
    Ainut.modelo      := '55';
    Ainut.serie       := edInut_serie.AsInteger;
    Ainut.nnfini      := edInut_nnfini.AsInteger;
    Ainut.nnffin      := edInut_nnffin.AsInteger;
    Ainut.xjust       := edInut_justificativa.Text;

    if Ainut.nnfini <> Ainut.nnffin then
      if not vDadosIni.PesqPros('NFE007', 'INSERIR', Format('FAIXA DE %d A %d', [Ainut.nnfini, Ainut.nnffin]),
        'NOTAFISCAL_INUT', '', CadNf.buscas, True) then
          exit;

    Ainut.seqid := CadNf.inut.Salvar(Ainut);

    if Ainut.seqid = 0 then
      setFocusCampoErro(CadNf.inut.vNomeCampoErro, CadNf.inut.vMensagemErro)
    else
    begin
      if CadNf.inut.nfe_inutilizacao_enviar(Ainut.seqid) then
        if not CadNf.dllNFe.nfe_inutilizacao_imprimir(Ainut.seqid, True, False, '') then
          vDadosIni.ShowErro(CadNf.dllNFe.retornoStr.Text);
      CadNf.inut.dataSet.Refresh;

      TForm(pnNFeInut_cad.Parent).ModalResult := IDOK;
    end;
  finally
    FreeAndNil(Ainut);           
    BitBtn199.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btNFeEmail2Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    btNFeEmail2.Enabled := False;

    CadNf.nfe_envioemail(ckNFeEmail_UnicoEmail.Checked,
                         ckNFeEmail_comEventos.Checked,
                         ckNFeEmail_comPDF.Checked,
                         ckNFeEmail_comBol.Checked,
                         ckNFeEmail_onlySel.Checked,
                         edNFeEmail_email.Text,
                         lbNFeEmail_anexos.Items.Text);

  finally
    btNFeEmail2.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btNFeEmail2_Inutilizacao_Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    CadNf.inut.nfe_inutilizacao_email(ckNFeEmail_onlySel.Checked,
                                      edNFeEmail_email.Text,
                                      lbNFeEmail_anexos.Items.Text);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btpag_incluirClick(Sender: TObject);
begin
  inherited;
  try
    if CadNf.pagNFe.Insert then
      vDadosIni.abreForm('Pagamento', pncadPagamento, opFormsDefCad);
  finally
    CadNf.pagNFe.dataSet.Cancel;
  end;
end;

procedure TfrmCadNF.btpag_alterarClick(Sender: TObject);
begin
  inherited;
  try
    if CadNf.pagNFe.dataSet.FieldByName('origem_ped').AsString = 'S' then
      if not vDadosIni.PesqPros('NF0202', 'ALTERAR', 'NUM NF' + IntToStr(CadNf.campo_num_nf),
        'NOTAFISCAL_DUP', IntToStr(CadNf.campo_cod_nf), CadNf.buscas, True) then
        exit;
    if CadNf.pagNFe.dataSet.IsEmpty then
      vDadosIni.ShowErro('Sem registro selecionado')
    else if CadNf.pagNFe.dataSet.FieldByName('tpag').AsInteger = 90 then
      vDadosIni.ShowErro('Registro "Sem pagamento" não pode ser alterado, apenas excluído')
    else if CadNf.pagNFe.Edit then
    begin
      if CadNf.pagNFe.dataSet.FieldByName('cod_controle').AsInteger > 0 then
        CadNf.pagNFe.formas.dataSet.Locate('CODIGO_CTRL', CadNf.pagNFe.dataSet.FieldByName('cod_controle').AsInteger, [])
      else
        CadNf.pagNFe.formas.dataSet.Locate('NFCE_TPAG', CadNf.pagNFe.dataSet.FieldByName('tpag').AsInteger, []);
      vDadosIni.abreForm('Pagamento', pncadPagamento, opFormsDefCad);
    end;
  finally
    CadNf.pagNFe.dataSet.Cancel;
  end;
end;

procedure TfrmCadNF.btpag_aproveitarpedidosClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    CadNf.pagNFe.pagamentoDosPedidos;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btpag_removerClick(Sender: TObject);
begin
  inherited;
  if CadNf.pagNFe.dataSet.FieldByName('origem_ped').AsString = 'S' then
    if not vDadosIni.PesqPros('NF0200', 'EXCLUIR', 'NUM NF' + IntToStr(CadNf.campo_num_nf),
      'NOTAFISCAL_DUP', IntToStr(CadNf.campo_cod_nf), CadNf.buscas, True) then
      exit;
  CadNf.pagNFe.Delete;
end;

procedure TfrmCadNF.BitBtn19Click(Sender: TObject);
begin
  inherited;
  TForm(pnImpressao.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn1Click(Sender: TObject);
var
  setOffColSel: Boolean;
begin
  setOffColSel := PrimeiraPesquisa;

  try
    Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('', 'Pesquisando Notas Fiscais');

    inherited;

    if setOffColSel then
      GridHandlerSingleton.GetInstance().ChangeVisibility(DBGrid1, ['sel'], False);

    if not vDadosIni.PesqPros('NF0002', 'CONSULTAR', '', 'NOTAFISCAL', '',
      CadNf.buscas, True) then
      exit;
    CadNf.vCons.campo := ComboBox1.Text;
    CadNf.vCons.ordem := CadNf.dataSet.FieldByName('cod_nf').DisplayLabel;
    CadNf.vCons.condicao := ComboBox3.Text;
    CadNf.vCons.valor := MaskEdit3.Text;
    CadNf.vCons.dataIni := MaskEdit1.Text;
    CadNf.vCons.dataFim := MaskEdit2.Text;
    CadNf.vCons.porData := MaskEdit1.Visible;

    CadNf.vCons.avancada := CheckBox3.Checked;
    CadNf.vCons.adicional := CheckBox1.Checked;
    CadNf.vCons.operacaoAv := RadioGroup1.Items[RadioGroup1.ItemIndex];
    CadNf.vCons.statusAv := RadioGroup2.Items[RadioGroup2.ItemIndex];
    CadNf.vCons.prodServAv := ckProdServ.Checked;
    CadNf.vCons.veiculosAv := ckVeic.Checked;
    CadNf.vCons.outrasAv := ckOutras.Checked;
    CadNf.vCons.despesasAv := ckDespesas.Checked;
    CadNf.vCons.servicosAv := ckServicos.Checked;

    CadNf.vCons.campoAd := ComboBox11.Text;
    CadNf.vCons.valorAd := MaskEdit7.Text;
    CadNf.vCons.dataIniAd := MaskEdit9.Text;
    CadNf.vCons.dataFimAd := MaskEdit8.Text;
    CadNf.vCons.condicaoAd := ComboBox12.Text;
    CadNf.vCons.porDataAd := MaskEdit9.Visible;

    CadNf.consulta;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
    _GravaConfiguracoesInteger(RadioGroup2.Name, RadioGroup2.ItemIndex);
  finally
  	gravaConfiguracoesFormRegistro;
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn20Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadNf.vPedCNf.pesquisaPedCompra(Trunc(edNpedPC.AsValue),
      edCodClForPedCompra.AsInteger, edDataIniPC.Text, edDataFimPC.Text) then
      	if (Self.Enabled) and (Self.Visible) and (DBGrid4.CanFocus) then
      		DBGrid4.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn21Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0069', 'INCLUIR', '', 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    if CadNf.vPedCNf.dataSet.IsEmpty then
    begin

    end;
    if not CadNf.adicionaPedidoAnotaFiscal then
    begin
      TForm(grupoPedCompra.Parent).ModalResult := IDCANCEL;
      Exit;
    end;
    setDadosFormularioMontarNfPedCompra;
    TForm(grupoPedCompra.Parent).ModalResult := IDOK;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn22Click(Sender: TObject);
begin
  inherited;
  setDadosFormularioMontarNfPedCompra;
  TForm(grupoPedCompra.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn23Click(Sender: TObject);
begin
  inherited;
  TForm(pnCalculuImposto.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn24Click(Sender: TObject);
begin
  inherited;
  CadNf.aplicaValoresDoCalculo;
  if (Self.Enabled) and (Self.Visible) and (btContinuarCalculo.CanFocus) then
    btContinuarCalculo.SetFocus;
end;

procedure TfrmCadNF.btCancelarEmabalagemClick(Sender: TObject);
begin
  inherited;
  TForm(pnEmbMeia.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.btConsultarNFeClick(Sender: TObject);
begin
  inherited;
  TForm(pnConsultaNfe.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.btContinuarCalculoClick(Sender: TObject);
begin
  inherited;
  if vDadosIni.vEmp.vConfDiferencaEnt = 'S' then
  begin
    if CadNf.existeDiferencaoAcimaDoLimite then
    begin
      Application.MessageBox(pchar('Existe diferença da soma dos itens para os totais informados na nota fiscal' + #13 +
          'Valor máximo permitido para diferenças: ' + Format('%0.2f',[vDadosIni.vEmp.vMaxDifEnt])
          ), 'Atenção', MB_OK + MB_ICONINFORMATION);
      vDadosIni.vInibeMensPesqPros := 'S';
      if not vDadosIni.PesqPros('NF0112', 'HABILITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
        CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
        exit;
      if
      Application.MessageBox(pchar('Deseja continuar mesmo assim?'
        ), 'Atenção', MB_YESNO + MB_ICONQUESTION) <> IDYES then
        exit;
      vDadosIni.GravaAuditoria('NF0112','HABILITAR', 'COFIRMACAO DE NF', 'NOTAFISCAL',
        CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas);
    end;
  end;
  TForm(pnCalculuImposto.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn25Click(Sender: TObject);
begin
  inherited;
  if CadNf.vGrComp.salvaQtdeGrade(edQuantGradeCompra.AsValue) then
  begin
    edQuantGradeCompra.AsValue := CadNf.vGrComp.QtdePendente;
    lbQtdeInformada.Caption := 'Quantidade Informada: ' + Format('%0.4f',
      [CadNf.vGrComp.QtdeInformada]);
    lbQtdePendente.Caption := 'Quantidade Pendente: ' + Format('%0.4f',
      [CadNf.vGrComp.QtdePendente]);
    BitBtn26.Enabled := True;
    if Format('%0.4f', [CadNf.vGrComp.QtdePendente]) = '0,0000' then
    begin
      BitBtn27.Enabled := True;
      BitBtn25.Enabled := False;
      if (Self.Enabled) and (Self.Visible) and (BitBtn27.CanFocus) then
        BitBtn27.SetFocus;
    end
    else if (Self.Enabled) and (Self.Visible) and (dbgrid8.CanFocus) then
      dbgrid8.SetFocus;         
  end;
end;

procedure TfrmCadNF.BitBtn26Click(Sender: TObject);
begin
  inherited;
  if CadNf.vGrComp.removerEntradaGrade then
  begin
    edQuantGradeCompra.AsValue := CadNf.vGrComp.QtdePendente;
    lbQtdeInformada.Caption := 'Quantidade Informada: ' + Format('%0.4f',
      [CadNf.vGrComp.QtdeInformada]);
    lbQtdePendente.Caption := 'Quantidade Pendente: ' + Format('%0.4f',
      [CadNf.vGrComp.QtdePendente]);
    BitBtn26.Enabled := not CadNf.vGrComp.dataSet.IsEmpty;
    if Format('%0.4f', [CadNf.vGrComp.QtdePendente]) <> '0,0000' then
    begin
      BitBtn27.Enabled := False;
      BitBtn25.Enabled := True;
    end;
  end;
end;

procedure TfrmCadNF.BitBtn27Click(Sender: TObject);
begin
  inherited;
  if CadNf.vGrComp.concluirEntradaDeGrades then
  begin
    TForm(Panel12.Parent).ModalResult := IDOK;
  end;
end;

procedure TfrmCadNF.BitBtn28Click(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (edMarkUpV.CanFocus) then
  	edMarkUpV.SetFocus;
end;

procedure TfrmCadNF.BitBtn29Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0065', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  TForm(pnFaturaEntrada.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.btSalvaMargemObtidaClick(Sender: TObject);
begin
  inherited;              
  if not vDadosIni.PesqPros('NF0066', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  CadNf.vItem.Preco30 := edPreco30.AsValue;
  CadNf.vItem.Preco60 := edPreco60.AsValue;
  CadNf.vItem.Preco90 := edPreco90.AsValue;

  if CadNf.vItem.salvaMargemObtida then
  begin
    getCamposMargem;
    if (Self.Enabled) and (Self.Visible) and (BitBtn28.CanFocus) then
    	BitBtn28.SetFocus;
  end;
end;

procedure TfrmCadNF.BitBtn2Click(Sender: TObject);
begin
  CadNf.CancelUpdates;
  nota_event_clear;
  inherited;
end;

procedure TfrmCadNF.BitBtn30Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.CancelMargem;
  getCamposMargem;
//  if (Self.Enabled) and (Self.Visible) and (DBGrid11.CanFocus) then
//    DBGrid11.SetFocus;
end;

procedure TfrmCadNF.BitBtn31Click(Sender: TObject);
begin
  inherited;
  TForm(pnModFaturas.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn32Click(Sender: TObject);
begin
  inherited;
  TForm(Panel13.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn33Click(Sender: TObject);
begin
  inherited;
  //  CadNf.setFatura(edMora.Valor, edMulta.Valor, edLocalPag.Text, edObsBol1.Text, edObsBol2.Text);
  TForm(pnModFaturas.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn34Click(Sender: TObject);
begin
  inherited;
  TForm(pnFaturaEntrada.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.btSalvarItemProdServDetalhadoClick(Sender: TObject);
var
  vOK: Boolean;
begin
  inherited;
  if not vDadosIni.PesqPros('NF0049', 'SALVAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  if (Self.Enabled) and (Self.Visible) and (btSalvarItemProdServDetalhado.CanFocus) then
  	btSalvarItemProdServDetalhado.SetFocus;
  if Trim(eddNumFab.Text) = '' then
    Exit;
  vOK := False;
  setCamposDetalhado;
  if not CadNf.calcularValorItemDesconto then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro, True);
    exit;
  end;

  if CadNf.vItem.vrDadosItem.tipo_item <> 'S' then
    if not CadNf.validaDadosItem then
    begin
      setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro, True);
      exit;
    end;

  if not CadNf.calcularValores(False) then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro, True);
    exit;
  end;

  if CadNf.vItem.vrDadosItem.stado = dsEdit then
    vOK := CadNf.alterarItem
  else
    vOK := CadNf.incluirItem;
  if vOK then
  begin
    CadNf.vItem.storeRecNo();
    CadNf.vItem.prepare_loop();
    Screen.Cursor := crHourGlass;
    try
      CadNf.somaTotaisNF;
      pnConsultaItensProdDetalhado.Visible := True;
      pnConsultaItensProdDetalhado.Enabled := True;
      pnCadastroItensProdDetalhado.Visible := False;
      pnCadastroItensProdDetalhado.Enabled := False;
      eddCST.OnChange                      := nil;

      if pageDadosNF.Tag = 1 then
      begin
        CadNf.vItem.restoreRecNo();
        pageDadosNF.ActivePage := tsnf_ResumoNota;
        pageDadosNF.Tag := 0;
        pageDadosNFChange(pageDadosNF);
      end;

      if (Self.Enabled) and (Self.Visible) and (btIncluirItemProdDetalhado.CanFocus) then
        btIncluirItemProdDetalhado.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (btIncluirItemServicoDetalhado.CanFocus) then
        btIncluirItemServicoDetalhado.SetFocus;
      if btAlterarItemProdDetalhado.Tag <> 0 then
      begin
        CadNf.vItem.IndexFieldNames := 'NITEM';
        CadNf.vItem.FindNearest([btAlterarItemProdDetalhado.Tag]);
        btAlterarItemProdDetalhado.Tag := 0;
      end;           
    finally
      CadNf.vItem.prepare_loop_done();
      Screen.Cursor := crDefault;
    end;
  end
  else
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro, True);
  getCamposDetalhado;
end;

procedure TfrmCadNF.btDetalhesVeiculoClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0053', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if not CadNf.notaFechada then
    if not CadNf.validaCabecalho then
      exit;
  CadNf.abreFormDetalheVeiculo;
end;

procedure TfrmCadNF.btDetalhesVeiculoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RIGHT then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadNF.btDetExportCadSalvarClick(Sender: TObject);
begin
  inherited;
  if CadNf.vItem.vDetExport.Post then
    TForm(pnDetExportCad.Parent).ModalResult := IDOK
  else
    setFocusCampoErro(CadNf.vItem.vDetExport.vNomeCampoErro, CadNf.vItem.vDetExport.vMensagemErro);
end;

procedure TfrmCadNF.btDetExportIndCancelarClick(Sender: TObject);
begin
  inherited;
  CadNf.vItem.vDetExport.vExpIndireta.Cancel;
  TForm(pnDetExportIndCad.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.btDetExportIndSalvarClick(Sender: TObject);
begin
  inherited;
  if CadNf.vItem.vDetExport.vExpIndireta.Post then
    TForm(pnDetExportIndCad.Parent).ModalResult := IDOK
  else
    setFocusCampoErro(CadNf.vItem.vDetExport.vExpIndireta.vNomeCampoErro, CadNf.vItem.vDetExport.vExpIndireta.vMensagemErro);
end;

procedure TfrmCadNF.btEditGradeClick(Sender: TObject);
begin
  inherited;
  if CadNf.vItem.vrDadosItem.stado in [dsEdit, dsInsert] then
    if CadNf.AlterarGradeItem then
    begin
      eddDescricao.Text := CadNf.vItem.vrDadosItem.descricao_item;
      edcean.Text       := CadNf.vItem.vrDadosItem.cean;
    end;
end;

procedure TfrmCadNF.btEnviarNFeClick(Sender: TObject);
var
  Aprint, AsendMail, AcomBol, checaContingencia: Boolean;
  codigoNF: Integer;
  sit: string;
begin
  inherited;
  codigoNF := CadNf.fint('cod_nf');

  if SituacaoNFeToEnum(CadNf.fstr('situacao_nfe')) in [stEmContingencia, stEmContingenciaRejeitada] then
  begin
    ResolverPendenciaSefaz(codigoNF);
    Exit;
  end;

  if not vDadosIni.PesqPros('HW512', 'ENVIAR', 'NUM NF' + IntToStr(CadNf.campo_num_nf),
    'NOTAFISCAL_DUP', IntToStr(codigoNF), CadNf.buscas, True) then
      exit;

  try
    Screen.Cursor := crHourGlass;
    btEnviarNFe.Enabled := False;
    CadNf.confNFeForm := confirmacao_nota_tela_enviar;

    AsendMail := True;
    AcomBol   := CadNf._LerConfiguracoesRegistroBoolean('SendMailComBoleto', True);

    if CadNf.enviarNotaFiscalEletronica(AsendMail, AcomBol) then
    begin
      if CadNf.dataSet.FieldByName('natureza_nf').AsString = 'S' then
        CadNf.verificarImpressaoBoleto;
      if AsendMail then
        CadNf.emailNFe(AcomBol)
    end
    else
      checaContingencia := CadNf.fdif('nfe_tpemis', '9')
        and CadNf.fequals('tpimp', Ord(fidSimplificadoTipo2))
        and CadNf.fequals('situacao_nfe', sitEnviando)
        and ContainsText(CadNf.fstr('descricaoerro'), 'ERRO HTTP:');

    CadNf._GravaConfiguracoesBoolean('SendMailComBoleto', AcomBol);

    habilitaCamposCadastroNotaFiscal;

  finally
    CadNf.confNFeForm := nil;
    btEnviarNFe.Enabled := True;
    Screen.Cursor := crDefault;
  end;

  if checaContingencia then
  begin
    PageControl1.ActivePage := TabSheet2;
    ResolverEmissaoEmContingencia(codigoNF);
  end;
end;

procedure TfrmCadNF.btEscolherECFSaidaClick(Sender: TObject);
begin
  inherited;
  TForm(pnECFSaida.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.btEspelhoCalcClick(Sender: TObject);
var
  rescueEvent: TNotifyEvent;
  controlsDisabled: Boolean;
begin
  inherited;
  try
    controlsDisabled := CadNf.vItem.dataSet.ControlsDisabled;

    CadNf.vItem.dataSet.EnableControls;
    CadNf.vItem.dataSet.EnableControls;
    CadNf.vItem.dataSet.EnableControls;

    ckMostrarApenasComST.Checked := _LerConfiguracoesRegistroBoolean(ckMostrarApenasComST.Name);
    CadNf.vItem.dataSet.Filter := 'antec_trib = ''S''';
    CadNf.vItem.dataSet.Filtered := ckMostrarApenasComST.Checked;
    rescueEvent := CadNf.vItem.OnAfterScroll;
    CadNf.vItem.OnAfterScroll := nf_itens_espelho_calc_afterscroll;
    nf_itens_espelho_calc_afterscroll(CadNf.vItem);

    vDadosIni.abreForm( 'Espelho de Cálculo do ICMS', pnEspelhoCalcAntSt, [ofAlignAllClientWinCtrl, ofEscapeExit]);
  finally
    _GravaConfiguracoesBoolean(ckMostrarApenasComST.Name, ckMostrarApenasComST.Checked);
    CadNf.vItem.dataSet.Filtered := False;
    CadNf.vItem.dataSet.Filter := '';
    CadNf.vItem.OnAfterScroll := rescueEvent;
    if controlsDisabled then
      CadNf.vItem.dataSet.DisableControls;
  end;
end;

procedure TfrmCadNF.btExportDadosAlterarClick(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NF0184', 'ALTERAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL_ITEM_DETEXPORT',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  if CadNf.vItem.vDetExport.Edit then
    vDadosIni.abreForm('Alteração de detalhes da exportação do item', pnDetExportCad, tsExportacao);
end;

procedure TfrmCadNF.btExportDadosExcluirClick(Sender: TObject);
begin
  inherited;
  CadNf.vItem.vDetExport.Delete;
end;

procedure TfrmCadNF.btExportDadosIncluirClick(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NF0183', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL_ITEM_DETEXPORT',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  if CadNf.vItem.vDetExport.Insert then
    vDadosIni.abreForm('Detalhes da exportação do item', pnDetExportCad, tsExportacao);
end;

procedure TfrmCadNF.btExportIndAlterarClick(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NF0188', 'ALTERAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL_ITEM_EXPORTIND',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  if CadNf.vItem.vDetExport.vExpIndireta.Edit then
    vDadosIni.abreForm('Alteração de detalhes da exportação indireta do item', pnDetExportIndCad, tsExportacao);
end;

procedure TfrmCadNF.btExportIndExcluirClick(Sender: TObject);
begin
  inherited;
  CadNf.vItem.vDetExport.vExpIndireta.Delete;
end;

procedure TfrmCadNF.btExportIndIncluirClick(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NF0187', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL_ITEM_EXPORTIND',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  if CadNf.vItem.vDetExport.vExpIndireta.Insert then
    vDadosIni.abreForm('Detalhes da exportação indireta do item', pnDetExportIndCad, tsExportacao);
end;

procedure TfrmCadNF.btfat_alterarClick(Sender: TObject);
begin
  inherited;
  if CadNf.dupNFe.IsEmpty then
    vDadosIni.ShowAtencao('Sem registros para alterar')
  else if CadNf.dupNFe.Edit then
    try
      if CadNf.dupNFe.dataSet.FieldByName('seqform').AsInteger > 0 then
      begin
        vDadosIni.ShowAtencao('Duplicata vincula ao pedido, não permitido alterar');
        Exit;
      end;

      if not vDadosIni.PesqPros('NF0062', 'EDITAR', 'NUM NF '+ IntToStr(CadNf.campo_num_nf), 'NOTAFISCAL',
        IntToStr(CadNf.campo_cod_nf), dtmNF.qrBuscas, True) then
      Exit;

      vDadosIni.abreForm('Alterando Duplicatas', pndup_alterar, opFormsDefCad);
    finally
      CadNf.dupNFe.Cancel;
    end;
end;

procedure TfrmCadNF.btfat_aproveitarpedidosClick(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NF0199', 'VALIDAR', 'NUM NF '+ IntToStr(CadNf.campo_num_nf),
    'NOTAFISCAL', IntToStr(CadNf.campo_cod_nf), CadNf.buscas) then
    Exit;

  try
    Screen.Cursor := crHourGlass;

    CadNf.dupNFe.aproveitarDosPedidos;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btfat_gerarClick(Sender: TObject);
var
  AcontroleVenda: Integer;
begin
  inherited;

  if not CadNf.Auditor.Inserir.Processo('NF0221').Permitido then
    Exit;
  
  AcontroleVenda := CadNf.dupNFe.getControleVenda;

  CadNf.dupNFe.lkControles.setDadosDataSet('CODIGO_CTRL', 'NOME_CTRL',
    CadNf.dupNFe.SqlOpen('select c.codigo_ctrl, c.nome_ctrl, c.qseqperf from controles c' +
                         ' where c.codigo_emp = ' + vDadosIni.codEmpresa +
                         ' and c.ativo = 1 ' +
                         ' and c.usar_boleto = ''S''' +
                         IfThen(AcontroleVenda > 0, ' and c.codigo_ctrl = ' + IntToStr(AcontroleVenda)) +
                         ' union' +
                         ' select null codigo_controle, '' - '' nome_ctrl, -999 qseqperf from rdb$database' +
                         ' order by 3'), lkdup_controles);

  if AcontroleVenda > 0 then
    lkdup_controles.KeyValue := AcontroleVenda
  else if CadNf.dupNFe.controlePad > 0 then
    lkdup_controles.KeyValue := CadNf.dupNFe.controlePad;

  CadNf.dupNFe.lkCondPag.setDadosDataSet('COD_COND_PAG', 'DESC_COND_PAG;MODALIDADE;CONSIDERAR_DIA_UTIL;PARCELAS_ADICIONAIS',
    CadNf.dupNFe.SqlOpen('select c.cod_cond_pag, c.desc_cond_pag,' +
                         ' ''Mod:''||c.modalidade modalidade,' +
                         ' ''DUtil:''||c.considerar_dia_util considerar_dia_util,' +
                         ' ''ParAd:''||c.parcelas_adicionais parcelas_adicionais' +
                         ' from cond_pag c' +
                         ' where c.natureza_cp <> ''C''' +
                         ' and c.ativo = 1 ' +
                         ' order by 2'), lkdup_condpag);
  lkdup_condpag.KeyValue := CadNf.dataSet.FieldByName('cod_cond_pag').AsInteger;

  groupdup_dadosst.Enabled := (CadNf.dataSet.FieldByName('valor_icmsub').AsFloat > 0) or
                              (CadNf.dataSet.FieldByName('fcp_vfcpst').AsFloat > 0);
  if groupdup_dadosst.Enabled then
  begin
    eddup_gerar_valorst.AsValue := CadNf.dataSet.FieldByName('valor_icmsub').AsFloat +
                                   CadNf.dataSet.FieldByName('fcp_vfcpst').AsFloat;
    eddup_vencimentost.Text     := DateToStr(date + 7);
    eddup_numerost.Text         := vDadosIni.StrZero(CadNf.dataSet.FieldByName('num_nf').AsInteger, 6) + '-ST';
  end
  else
    eddup_gerar_valorst.AsValue := 0;

  eddup_gerar_valor.AsValue := CadNf.dataSet.FieldByName('valor_total').AsFloat - eddup_gerar_valorst.AsValue;

  vDadosIni.abreForm('Duplicatas', pndup_gerar, opFormsDefCad);
end;

procedure TfrmCadNF.btfat_verificarimpressaoClick(Sender: TObject);
begin
  inherited;
  CadNf.dupNFe.gerarBoletosPendentes(CadNf.campo_cod_nf);
  CadNf.verificarImpressaoBoleto;
end;

procedure TfrmCadNF.btGerarFaturaEntradaClick(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0064', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.gerarFaturas(False) then
    getFaturas;
end;

procedure TfrmCadNF.BitBtn35Click(Sender: TObject);
var
  codCl: Integer;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    codCl := Trunc(edClienteComando.AsValue);
    if CadNf.vComFat.pesquisaComandoFaturamento(codCl,
      edComandoChassi.Text,
      edDataIniComando.Text, edDataFimComando.Text) then
    begin
      	if (Self.Enabled) and (Self.Visible) and (DBGrid7.CanFocus) then
      		DBGrid7.SetFocus;
      setDadosFormularioMontarNfComando;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn36Click(Sender: TObject);
begin
  inherited;         
  if not vDadosIni.PesqPros('NF0070', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    if not CadNf.adicionaVeiculoAnotaFiscal then
    begin
      TForm(grupoComando.Parent).ModalResult := IDCANCEL;
      Exit;
    end;
    TForm(grupoComando.Parent).ModalResult := IDOK;
    vNFAvulsaEst := True;
  finally
    setDadosFormularioMontarNfComando;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn37Click(Sender: TObject);
begin
  inherited;
  setDadosFormularioMontarNfComando;
  TForm(grupoComando.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn38Click(Sender: TObject);
begin
  inherited;
  TForm(pnCSTTransito.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.btSalvarDetalhesVeiculoClick(Sender: TObject);
begin
  inherited;       
  if not vDadosIni.PesqPros('NF0054', 'SALVAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.salvaDadosDetalhesVeiculo then
  begin
    pnDetalhesItemVeiculo.Enabled := False;
    TForm(pnDetalheVeiculos.Parent).ModalResult := IDOK;
  end
  else
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
end;

procedure TfrmCadNF.btSalvarFaturaEntradaClick(Sender: TObject);
var
  vIndex:Integer;
begin
  inherited;
  try
    vIndex := ListBox3.ItemIndex;
    if CadNf.setFatura(ListBox3.ItemIndex, edDocFaturaEntrada.Text, edVencimentoFaturaEntrada.Text,
      edValorFaturaEntrada.AsValue) then
    begin
      getFaturas;
      ListBox3.ItemIndex := vIndex;
      if btDetalheDespesa.Tag = 1 then
        btDetalheDespesa.Click;
    end
    else
      Application.MessageBox('Erro ao modificar Faturas', 'Atenção', 0 + 64);
  finally
    btAlterarFaturaEntrada.Enabled := True;
    ListBox3.Enabled := True;
    Panel47.Visible := False;
    if btDetalheDespesa.Tag = 1 then
      btDetalheDespesa.Visible := True;
  end;
end;

procedure TfrmCadNF.BitBtn39Click(Sender: TObject);
begin
  inherited;
  TForm(pnDetalheVeiculos.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn3Click(Sender: TObject);
begin
	btNF_P_Prod.Tag := 0;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'I', CadNf.buscas) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    try ARecNo := CadNf.dataSet.RecNo; except end;

    if vDadosIni.abreForm('Entrada de Nota Fiscal', pnEntrada, opFormsDefCad) then
      habilitaCamposCadastroNotaFiscal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.brDetExportCadCancelarClick(Sender: TObject);
begin
  inherited;
  CadNf.vItem.vDetExport.Cancel;
  TForm(pnDetExportCad.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.brdup_salvarClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    CadNf.dupNFe.dataSet.DisableControls;

    if not CadNf.dupNFe.Post then
      setFocusCampoErro(CadNf.dupNFe.vNomeCampoErro, CadNf.dupNFe.vMensagemErro)
    else
      TForm(pndup_alterar.Parent).ModalResult := IDOK;
  finally                                
    CadNf.dupNFe.dataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btAlterarC111Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0079', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if not CadNf.vSped.vC110.vC111.dataSet.IsEmpty then
    if CadNf.vSped.vC110.vC111.Edit then
    begin
      pnC111Cadastro.Visible := True;
      pnC111Consulta.Visible := False;
      if (Self.Enabled) and (Self.Visible) and (DBEdit150.CanFocus) then
      	DBEdit150.SetFocus;
    end;
end;

procedure TfrmCadNF.btAlterarC112Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0083', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if not CadNf.vSped.vC110.vC112.dataSet.IsEmpty then
    if CadNf.vSped.vC110.vC112.Edit then
    begin
      pnC112Cadastro.Visible := True;
      pnC112Consulta.Visible := False;
      if (Self.Enabled) and (Self.Visible) and (DBComboBox9.CanFocus) then
      	DBComboBox9.SetFocus;
    end;
end;

procedure TfrmCadNF.btAlterarC114Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0090', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if not CadNf.vSped.vC110.vC114.dataSet.IsEmpty then
    if CadNf.vSped.vC110.vC114.Edit then
    begin
      pnC114Cadastro.Visible := True;
      pnC114Consulta.Visible := False;
      if (Self.Enabled) and (Self.Visible) and (DBComboBox8.CanFocus) then
      	DBComboBox8.SetFocus;
    end;
end;

procedure TfrmCadNF.btAlterarC115Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0094', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if not CadNf.vSped.vC110.vC115.dataSet.IsEmpty then
    if CadNf.vSped.vC110.vC115.Edit then
    begin
      pnC115Cadastro.Visible := True;
      pnC115Consulta.Visible := False;
      if (Self.Enabled) and (Self.Visible) and (DBRadioGroup6.CanFocus) then
      	DBRadioGroup6.SetFocus;
    end;
end;

procedure TfrmCadNF.btAlterarC120Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0098', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if not CadNf.vSped.vC120.dataSet.IsEmpty then
    if CadNf.vSped.vC120.Edit then
    begin
      pnC120Cadastro.Visible := True;
      pnC120Consulta.Visible := False;
      if (Self.Enabled) and (Self.Visible) and (DBComboBox10.CanFocus) then
      	DBComboBox10.SetFocus;
    end;
end;

procedure TfrmCadNF.btAlterarDetalhesVeiculosClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0052', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if not CadNf.validaCabecalho then
    exit;
  CadNf.vItem.vDetVeic.dataSet.Edit;
  btSalvarDetalhesVeiculo.Enabled := (CadNf.vItem.vDetVeic.dataSet.State in [dsEdit, dsInsert]);
  btAlterarDetalhesVeiculos.Enabled := not (CadNf.vItem.vDetVeic.dataSet.State in [dsEdit,
    dsInsert]);
  pnDetalhesItemVeiculo.Enabled := (CadNf.vItem.vDetVeic.dataSet.State in [dsEdit, dsInsert]);
  btCancelarDetalhesVeiculo.Enabled :=
    btSalvarDetalhesVeiculo.Enabled;
  if pnDetalhesItemVeiculo.Enabled then
    if (Self.Enabled) and (Self.Visible) and (DBEdit258.CanFocus) then
	    DBEdit258.SetFocus;
end;

procedure TfrmCadNF.btAlterarItemVeiculoClick(Sender: TObject);
begin
  inherited;        
  if not vDadosIni.PesqPros('NF0052', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.notaFechada then
    exit;
  if not CadNf.validaCabecalho then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    exit;
  end;
  if not CadNf.validaRodape then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    exit;
  end;
  CadNf.vItem.Edit;
  if CadNf.vItem.DataSet.state = dsEdit then
  begin
    CadNf.alterarItensNfVeiculoEntrada;
    buildCadastroItensDtSet(Sender);

    if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
     DBComboBox2.SetFocus;
  end;
end;

procedure TfrmCadNF.btAlterarItensDespesaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0060', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if not CadNf.validaCabecalho then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    exit;
  end;
  if CadNf.vItem.Edit then
  begin
    if CadNf.fstrin('modelo_nf', ['6', '06', '62', '66']) then
      TFloatField(CadNf.vItem.dataSet.FieldByName('valor_unitario')).DisplayFormat := ''
    else
      TFloatField(CadNf.vItem.dataSet.FieldByName('valor_unitario')).DisplayFormat := '#,##0.000000';

    pnCadastroItensDespesa.Visible := True;
    if (Self.Enabled) and (Self.Visible) and (DBEdit62.CanFocus) then
    	DBEdit62.SetFocus;
    pnConsultaItensDespesa.Visible := False;
  end;
end;

procedure TfrmCadNF.btAlterarItensOutrasNfClick(Sender: TObject);
begin
  inherited;
  if not CadNf.validaCabecalho then
  begin
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    exit;
  end;
  if CadNf.vItem.alterar then
  begin
    pgControlOItensNFe.ActivePage := tsOut_Mercadorias;
    btOHabPISCOFINS.Enabled := True;

    SpeedButton45.Enabled := (CadNf.campo_natureza_nf = 'E');

    pnCadastroItensOutrasNf.Visible := True;
    pnConsultaItensOutrasNF.Visible := False;
    getCamposOutrasNF;
    if (Self.Enabled) and (Self.Visible) and (edOnCodigo.CanFocus) then
    	edOnCodigo.SetFocus;
  end;
end;

procedure TfrmCadNF.btAlterarFaturaEntradaClick(Sender: TObject);
begin
  inherited;
  if btDetalheDespesa.Visible then
    btDetalheDespesa.Tag := 1;
  if btDetalheDespesa.Tag = 1 then
    btDetalheDespesa.Visible := False;  
  if not vDadosIni.PesqPros('NF0063', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  try
    edDocFaturaEntrada.Text := CadNf.Fatura.numeroDocumento[ListBox3.ItemIndex];
    edVencimentoFaturaEntrada.Text := CadNf.Fatura.vencimentoDocumento[ListBox3.ItemIndex];
    edValorFaturaEntrada.AsValue := CadNf.Fatura.valorDocumento[ListBox3.ItemIndex];
    Panel47.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (edDocFaturaEntrada.CanFocus) then
    	edDocFaturaEntrada.SetFocus;
    btAlterarFaturaEntrada.Enabled := false;
    ListBox3.Enabled := false;
  except
    Application.MessageBox('Selecione a parcela', 'Atenção', mb_ok + MB_ICONINFORMATION);
  end;
end;

procedure TfrmCadNF.btOutrosIntFiscoClick(Sender: TObject);
begin
  inherited;
  pgSped.ActivePage := tsSpedDadosAdicionais;
  BitBtn168.Visible := CadNf.notaFechada;
  GroupBox54.Enabled := False;
  GroupBox55.Enabled := False;
  GroupBox56.Enabled := False;
  frmCadNF := TfrmCadNF(Self);
  if (CadNf.validaCabecalho) or (CadNf.notaFechada) then
    CadNf.abreFormSpedFiscal
  else
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
end;

procedure TfrmCadNF.btNFeConsulta2Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    CadNf.nfe_consultar(ckNFeConsulta_onlySel.Checked);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btNFeConsultaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('HW513', 'CONSULTAR', 'NUM NF' + IntToStr(CadNf.campo_num_nf),
    'NOTAFISCAL_DUP', IntToStr(CadNf.campo_cod_nf), CadNf.buscas, True) then
      exit;
  try
    Screen.Cursor := crHourGlass;
    btNFeConsulta.Enabled := False;

    ckNFeConsulta_onlySel.Checked    := CadNf.SetArrayOfcod_nf > 0;

    vDadosIni.abreForm('Consulta NFe', pnNFeModulo_Consulta, opFormsDefCad + [ofEscapeExit]);

    regSetConfBool(ckNFeConsulta_onlySel.Name    , ckNFeConsulta_onlySel.Checked);

  finally
    btNFeConsulta.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn41Click(Sender: TObject);
begin
  inherited;
  if CadNf.vSped.vC110.Post then
  begin
    CadNf.montarDadosAdicionaisFisco;
    pnC110Consulta.Visible := True;
    pnC110Cadastro.Visible := False;
  end;
end;

procedure TfrmCadNF.BitBtn42Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadNf.vTransNF.pesquisaTransitoNotaFiscal(edNumNFChassiTrans.Text,
      edDataIniTrans.Text, edDataFimTrans.Text) then
      	if (Self.Enabled) and (Self.Visible) and (DBGrid7.CanFocus) then
      		DBGrid7.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn43Click(Sender: TObject);
begin
  inherited;           
  if not vDadosIni.PesqPros('NF0071', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    if not CadNf.adicionaNotaFiscalTransito then
    begin
      TForm(grupoTransito.Parent).ModalResult := IDCANCEL;
      Exit;
    end;
    TForm(grupoTransito.Parent).ModalResult := IDOK;
  finally
    setDadosFormularioMontarNfTransito;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn44Click(Sender: TObject);
begin
  inherited;
  setDadosFormularioMontarNfTransito;
  TForm(grupoTransito.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn45Click(Sender: TObject);
begin
  inherited;
  if CadNf.vInfCompl.Insert then
  begin
    pnConsultaParametros.Visible := False;
    pnCadastroParametros.Visible := true;
  end;
end;

procedure TfrmCadNF.BitBtn46Click(Sender: TObject);
begin
  inherited;
  if not CadNf.vInfCompl.dataSet.IsEmpty then
    if CadNf.vInfCompl.Edit then
    begin
      pnConsultaParametros.Visible := False;
      pnCadastroParametros.Visible := true;
    end;
end;

procedure TfrmCadNF.BitBtn47Click(Sender: TObject);
begin
  inherited;
  CadNf.vInfCompl.Delete;
end;

procedure TfrmCadNF.BitBtn48Click(Sender: TObject);
begin
  inherited;
  if CadNf.adicionaParametroSelecionado then
    TForm(pnParametros.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn49Click(Sender: TObject);
begin
  inherited;
  CadNf.vSped.vC110.Cancel;
  pnC110Consulta.Visible := True;
  pnC110Cadastro.Visible := False;
end;

procedure TfrmCadNF.BitBtn50Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0075', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.abreFormParametros then
  begin
    pnC110Cadastro.Visible := True;
    pnC110Consulta.Visible := False;
    if (Self.Enabled) and (Self.Visible) and (DBMemo8.CanFocus) then
    	DBMemo8.SetFocus;
  end;
end;

procedure TfrmCadNF.BitBtn51Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0076', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if not CadNf.vSped.vC110.dataSet.IsEmpty then
    if CadNf.vSped.vC110.Edit then
    begin
      pnC110Cadastro.Visible := True;
      pnC110Consulta.Visible := False;
      if (Self.Enabled) and (Self.Visible) and (DBMemo8.CanFocus) then
      	DBMemo8.SetFocus;
    end;
end;

procedure TfrmCadNF.BitBtn52Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0077', 'EXCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  CadNf.vSped.vC110.Delete;
end;

procedure TfrmCadNF.BitBtn53Click(Sender: TObject);
begin
  inherited;
  if ListBox4.ItemIndex = -1 then
  begin
    Application.MessageBox('Genero não selecionado', 'Atenção', 0 + 64);
    exit;
  end;
  TForm(pnGenero.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn54Click(Sender: TObject);
begin
  try
    Screen.cursor := crHourGlass;
    inherited;
    BitBtn56.Enabled := False;
    if CadNf.incluirNfComplementar then
      habilitaCamposCadastroNotaFiscal
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn55Click(Sender: TObject);
begin
  inherited;
  TForm(pnComplementar.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn56Click(Sender: TObject);
begin
  inherited;
  if (Trim(edNumNfCompl.AsString) = '') or (edNumNfCompl.AsInteger = 0) then
    exit;
  if (Trim(edSerieCompl.Text) = '') then
    exit;
  
  TForm(pnComplementarCadastro.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn57Click(Sender: TObject);
begin
  inherited;
  TForm(pnComplementarCadastro.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.btSalvarNFClick(Sender: TObject);
var
  acao: string;
begin

  CadNf.vItem.prepare_loop();
  Screen.Cursor := crHourGlass;
  try
    DBGrid13.Visible := False;
    if (Self.Enabled) and (Self.Visible) and (btSalvarNF.CanFocus) then
      btSalvarNF.SetFocus;
    if ActiveControl <> btSalvarNF then
      Exit;
    if not CadNf.validaDesconto('N') then
    begin
      setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
      exit;
    end;
    acao := 'EDITAR';
    if CadNf.dataSet.State = dsInsert then
      acao := 'INCLUIR';
    if not vDadosIni.PesqPros('NF0003', acao, 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString + ' SALVAR NOTA FISCAL', 'NOTAFISCAL',
      CadNf.dataSet.FieldByName('COD_NF').AsString, CadNf.buscas, True) then
      Exit;
    if not CadNf.validaCabecalho then
    begin
      setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
      exit;
    end;
    if not CadNf.validaRodape then
    begin
      setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
      exit;
    end;
    if not CadNf.validaCodigoPeloCodFornecedor then
    begin
      Application.MessageBox(pchar('Itens não encontrados no cadastro'+#13+
      'Por favor informe o código no item'),'Atenção',0+64);
      Exit;
    end;
    if not CadNf.Post then
    begin
      PageControl3.ActivePage := tsNotaFiscal;
      if not setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro) then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        	DBEdit1.SetFocus;
    end
    else
    begin
      btConfirmarNF.Enabled    := CadNf.permiteConfirmacao;
      btOutrosIntFisco.Enabled := (CadNf.dataSet.FieldByName('cod_nf').AsInteger > 0);
      groupItensNota.Parent := tsnf_ResumoNota;
      pageDadosNF.ActivePage := tsnf_ResumoNota;
      inherited;
    end;
  finally
    DBGrid13.Visible := True;

    CadNf.vItem.prepare_loop_done();
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btCancelarItemVeiculoClick(Sender: TObject);
begin
  inherited;
  if (CadNf.campo_natureza_nf = 'E') and (btCancelarItemVeiculo.Tag = 1) then
    CadNf.vItem.Delete
  else
  begin
    CadNf.vItem.vDetVeic.Cancel;
    CadNf.vItem.Cancel;
  end;
  btCalcularNf.Enabled     := True;
  pnItensVeiculo.Enabled   := False;
  FrameIbsCbsVeic1.Enabled := False;
  btConfirmarNF.Enabled    := CadNf.permiteConfirmacao;

  btAlterarItemVeiculo.Enabled  := True;
  btSalvarItemVeiculo.Enabled   := False;

  btCalcularNf.Enabled := True;
  btDetalhesVeiculo.Enabled := True;
  BitBtn124.Enabled := CadNf.campo_natureza_nf = 'E';
  BitBtn134.Enabled := CadNf.campo_natureza_nf = 'E';
  if (CadNf.campo_natureza_nf = 'E')  then
  begin
    pnConsultaItensVeiculos.Visible := True;
    pnCadastroItensVeiculos.Visible := False;
    if (Self.Enabled) and (Self.Visible) and (BitBtn124.CanFocus) then
      BitBtn124.SetFocus;
  end;

  groupItensNota.Parent        := tsnf_ResumoNota;
  pageDadosNF.ActivePage       := tsnf_ResumoNota;
  pageItensVeiculos.ActivePage := tsVeic_Item;

  btCancelarItemVeiculo.Enabled := False;

  CadNf.somaTotaisNF;
end;

procedure TfrmCadNF.BitBtn5Click(Sender: TObject);
begin
  CadNf.CancelUpdates;
  try
    try CadNf.dataSet.IndexName := CadNf.UltimoIndice; except end;
    if ARecNo > 0 then
      CadNf.dataSet.RecNo := ARecNo;
    except
    end;
  Self.Caption := 'Notas Fiscais';
  nota_event_clear;
  inherited;
end;

procedure TfrmCadNF.BitBtn60Click(Sender: TObject);
begin
  inherited;
  CadNf.preencheDadosNfRetorno;
end;

procedure TfrmCadNF.btNFeImprimirEtq2Click(Sender: TObject);
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;
    btNFeImprimir2.Enabled := False;
    btNFeImprimirEtq2.Enabled := False;
    CadNf.printEtqDanfe := handleImpressaoEtiquetas;

    CadNf.SetArrayOfcod_nf(ckNFeImpressao_onlySel.Checked, True);

    CadNf.printEtqDanfe();

  finally
    btNFeImprimir2.Enabled := True;
    btNFeImprimirEtq2.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.bt_obscont_salvarClick(Sender: TObject);
begin
  inherited;
  if not CadNf.obsCont.Post then
    setFocusCampoErro(CadNf.obsCont.vNomeCampoErro, CadNf.obsCont.vMensagemErro)
  else
    TForm(pncadObsCont.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.btModuloNFeClick(Sender: TObject);
var
  Acod_nf: Integer;
begin
  inherited;

  if VerificarNotasPendentesCancelamento then
    Exit;                               
  if VerificarNotasPendentesSefaz then
    Exit;

  //vDadosIni.abreForm('Opções da Nota Fiscal Eletronica', pnEntSaidaNFe, opFormsDefCad);
  if Panel2.Parent <> tsModuloNFe400 then
  begin
    if not Panel1.Visible then
    begin
      CadNf.montaSelect('select * from notafiscal where cod_nf = 0 and cod_empresa = 0 and cod_nf = 0');
      Panel1.Visible := True;
    end;

  Acod_nf := CadNf.dataSet.FieldByName('cod_nf').AsInteger;

  Panel2.Parent             := tsModuloNFe400;
  pnBotoesModuloNFe4.Parent := Panel1;
  pnLabelsNFe.Parent        := Panel1;
  CadNf.dataSet.Filter      := ' modelo_nf = ''55''';// nfe_versao = ' + QuotedStr() ;
  CadNf.dataSet.Filtered    := True;

  toggle_multi_selecao_dbgrid1(tmOn);

//  DBGrid1.OnDrawColumnCell  := gridNFe_DrawColumnCell;
//  DBGrid1.OnDblClick        := gridNFe_DblClick;
//  DBGrid1.OnCellClick       := gridNFe_CellClick;
//  DBGrid1.OnKeyDown         := gridNFe_KeyDown;
//  DBGrid1.OnMouseUp         := gridNFe_MouseUp;

  BitBtn3.Enabled := False;
  btSaida.Enabled := False;
//  btSelectAll.Visible := True;
//  btUnSelectAll.Visible := True;

  if CadNf.dataSet.Active then
    CadNf.dataSet.Locate('COD_NF', Acod_nf, []);
  end
  else
    btNFeVoltar.Click;
end;

procedure TfrmCadNF.BitBtn62Click(Sender: TObject);
var
  Anota: TNotafiscal_sped_c113_class;
begin
  inherited;
  if not vDadosIni.PesqPros('NF0087', 'SALVAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  Anota := TNotafiscal_sped_c113_class.Create;
  try
    Anota.nnf := edRefNnf.AsInteger;
    Anota.modelo := edRefModelo.AsInteger;
    Anota.serie := edRefSerie.AsInteger;
    Anota.cuf := vDadosIni.UFtoIBGE(edRefUF.Text);
    Anota.aamm := edRefAAMM.Text;
    Anota.cnpj := edRefCNPJ.Text;

    if CadNf.vSped.vC110.vC113.salvarReferenciaModelo01ou02(Anota) then
      TForm(pnNovaRefNFeAvulsa.Parent).ModalResult := IDOK;

  finally
    FreeAndNil(Anota);
  end;
end;

procedure TfrmCadNF.BitBtn63Click(Sender: TObject);
begin
  inherited;
  TForm(pnImpDadosAd.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn64Click(Sender: TObject);
begin
  inherited;
  TForm(pnNovaRefNFeAvulsa.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn65Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0086', 'INCLUIR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;

  vDadosIni.abreForm('', pnNovaRefNFeAvulsa, [ofAutoSize, ofEscapeExit]);
end;

procedure TfrmCadNF.BitBtn67Click(Sender: TObject);
begin
  inherited;
  CadNf.abreFormConsultaNFe;
end;

procedure TfrmCadNF.BitBtn68Click(Sender: TObject);
begin
  btNF_P_Prod.Tag := 0;
  try
    Screen.Cursor := crHourGlass;

    vStringEntradaSaidaFormEscolhaNF := 'E';
    if vDadosIni.abreForm('Entra de Notas Fiscais', pnEscolhaNFBotoes, opFormsDefCad) then
      TForm(pnEntrada.Parent).ModalResult := IDOK;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn69Click(Sender: TObject);
begin
  inherited;
  if CadNf.incluirNf( tnfProdutos, 'P', 'E') then
  begin
    getDadosFormularioMontarNfPedCompra;
    if CadNf.abreFormPedidoDeCompra then
    TForm(pnEntrada.Parent).ModalResult := IDOK
    else
    CadNf.CancelUpdates;
//    habilitaCamposCadastroNotaFiscal;
//		if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
//    	DBEdit1.SetFocus;
  end;
end;

procedure TfrmCadNF.btOKEmbalagemClick(Sender: TObject);
begin
  inherited;
  TForm(pnEmbMeia.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.btPagamentoEmCartaoClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0191', 'VISUALIZAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.verificaFaturasEmCartao <> -1 then
    vDadosIni.abreForm('Transações de Cartão de Crédito a efetuar/efetuadas', pnDadosCartao, tsDetalhesNF);  
end;

procedure TfrmCadNF.btpag_sempagamentoClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0201', 'INCLUIR', 'NUM NF' + IntToStr(CadNf.campo_num_nf),
    'NOTAFISCAL_DUP', IntToStr(CadNf.campo_cod_nf), CadNf.buscas, True) then
      exit;

  CadNf.pagNFe.semPagamento;
end;

procedure TfrmCadNF.btPVTickAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    CadNf.vPedVNf.check_uncheck(True);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btPVUnTickAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    CadNf.vPedVNf.check_uncheck(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btCancelarDetalhesVeiculoClick(Sender: TObject);
begin
  inherited;
  CadNf.vItem.vDetVeic.dataSet.Cancel;
  pnDetalhesItemVeiculo.Enabled := False;
  btCancelarDetalhesVeiculo.Enabled := False;
  btSalvarDetalhesVeiculo.Enabled := False;
  btAlterarDetalhesVeiculos.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (BitBtn39.CanFocus) then
  	BitBtn39.SetFocus;
//  TForm(pnDetalheVeiculos.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.btOKDevolucaoNfClick(Sender: TObject);
begin
  inherited;
  TForm(pnDevolucaoNf.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn70Click(Sender: TObject);
begin
  inherited;
  if CadNf.incluirNf( tnfVeiculos, 'P', 'E') then
  begin
    getDadosFormularioMontarNfTransito;
//    btImportarNfTransito.Enabled := not CadNf.abreFormTransitoNF;
    if  CadNf.abreFormTransitoNF then
      TForm(pnEntrada.Parent).ModalResult := IDOK
    else
      CadNf.CancelUpdates;
//    habilitaCamposCadastroNotaFiscal;
//		if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
//    	DBEdit1.SetFocus;
  end;
end;

procedure TfrmCadNF.BitBtn71Click(Sender: TObject);
var
  Registro: TRegistry;
  vTempPath:string;
begin
  inherited;
  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + Self.ClassName, True);
      OpenDialog1.InitialDir := Registro.ReadString(OpenDialog1.Name);
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;

  if OpenDialog1.Execute then
  begin
    if CadNf.importaXml(OpenDialog1.FileName) then
    begin
      habilitaCamposCadastroNotaFiscal;
      CadNf.vItem.dataSet.First;
      TForm(pnEntrada.Parent).ModalResult := IDOK;
    end;
    try
      // Chama o construtor do objeto
      Registro := TRegistry.Create;
      try
        Registro.OpenKey(Conf + Self.ClassName, True);
        Registro.WriteString(OpenDialog1.Name, ExtractFileDir(OpenDialog1.FileName));
        Registro.CloseKey;
      finally
        Registro.Free;
      end;
    except
    end;
  end;
end;

procedure TfrmCadNF.btpag_salvarClick(Sender: TObject);
begin
  inherited;
  if not CadNf.pagNFe.Post then
    setFocusCampoErro(CadNf.pagNFe.vNomeCampoErro, CadNf.pagNFe.vMensagemErro)
  else
    TForm(pncadPagamento.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.btConfirmarNFClick(Sender: TObject);
var
  acao: string;
  checaContingencia: Boolean;
  codigoNF: Integer;
begin
  codigoNF := CadNf.fint('cod_nf');
  checaContingencia := False;

  CadNf.vItem.prepare_loop();
  Screen.Cursor := crHourGlass;
  try
    DBGrid13.Visible := False;
    CadNf.confNFeForm := confirmacao_nota_tela_enviar;

    if not CadNf.validaDesconto('N') then
      exit;
    acao := 'EDITAR';
    if CadNf.dataSet.State = dsInsert then
      acao := 'INCLUIR';
    if not vDadosIni.PesqPros('NF0003', acao, 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString + ' SALVAR NOTA FISCAL', 'NOTAFISCAL',
      IntToStr(codigoNF), CadNf.buscas, True) then
      Exit;

    //    CadNf.somaTotaisNF;

    if CadNf.campo_natureza_nf = 'E' then
    begin
      if not CadNf.validarAntecipacaoST then
        Exit;
      if not CadNf.validarRegrasCFOP_CST then
        exit;
      CadNf.somaTotaisNF(True);
      if CadNf.campo_situacao_nfe = '' then
        if not CadNf.abreFormCalculoImposto then
          Exit;
    end
    else
      if not CadNf.validarRegrasCFOP_CST then
        exit;

    if CadNf.campo_situacao_nfe = '' then
      if not CadNf.validaTransporte then
      begin
        if not setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro) then
          if (Self.Enabled) and (Self.Visible) and (DBEdit12.CanFocus) then
            DBEdit12.SetFocus;
        exit;
      end;

    if not CadNf.confirmaNF then
    begin
      PageControl3.ActivePage := tsNotaFiscal;
      if not setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro) then
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
          DBEdit1.SetFocus;
    end
    else
    begin
      checaContingencia := CadNf.fdif('nfe_tpemis', '9')
        and CadNf.fequals('tpimp', Ord(fidSimplificadoTipo2))
        and CadNf.fequals('situacao_nfe', sitEnviando)
        and ContainsText(CadNf.fstr('descricaoerro'), 'ERRO HTTP:');

      if checaContingencia then
        ResolverEmissaoEmContingencia(codigoNF);

      Self.Caption := 'Notas Fiscais';
      nota_event_clear;
      inherited BitBtn4Click(Sender);
      try CadNf.dataSet.IndexName := CadNf.UltimoIndice; except end;
      try
        if ARecNo > 0 then
        CadNf.dataSet.RecNo := ARecNo;
      except
      end;
    end;
  finally
    CadNf.confNFeForm := nil;
    DBGrid13.Visible := True;

    CadNf.vItem.prepare_loop_done();
    CadNf.vItem.dataSet.EnableControls;
    CadNf.vItem.dataSet.EnableControls;

    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btConsultaNFeClick(Sender: TObject);
begin
  inherited;
  CadNf.ConsultaSefaz(CadNf.dataSet.FieldByName('dest_uf').AsString,
    CadNf.dataSet.FieldByName('chave_nfe').AsString,
    CadNf.dataSet.FieldByName('serie').AsString);
end;

procedure TfrmCadNF.BitBtn73Click(Sender: TObject);
begin
  inherited;    
  if not vDadosIni.PesqPros('NF0041', 'CONSULTA', '', 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.devolverNotaFiscal(InputBox('Código de Devolução','Informe o Código interno da devolução','Informar o código aqui')) then
  begin
//    habilitaCamposCadastroNotaFiscal;
    TForm(pnEntrada.Parent).ModalResult := IDOK;
  end;
end;

procedure TfrmCadNF.BitBtn74Click(Sender: TObject);
begin
  inherited;
  TForm(pnEntrada.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn74KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_ESCAPE then
    BitBtn74.Click;
end;

procedure TfrmCadNF.BitBtn75Click(Sender: TObject);
begin
  inherited;
    TForm(pnDevolucaoNf.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn76Click(Sender: TObject);
begin
  inherited;
  btNF_P_Prod.Tag := 1;
  try
    Screen.Cursor := crHourGlass;
    vStringEntradaSaidaFormEscolhaNF := 'S';
    if vDadosIni.abreForm('Saída de Notas Fiscais', pnEscolhaNFBotoes, opFormsDefCad) then
      TForm(pnSaida.Parent).ModalResult := IDOK;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn77Click(Sender: TObject);
begin
  inherited;
  getDadosFormularioMontarNfComando;
  if CadNf.incluirNf( tnfVeiculos, 'V', 'S') then
    TForm(pnSaida.Parent).ModalResult := IDOK
  else
    CadNf.CancelUpdates;
end;

procedure TfrmCadNF.BitBtn78Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'A', CadNf.buscas) then
    Exit;
  CadNf.abreShiftF12;
//  BitBtn82.Click;
end;

procedure TfrmCadNF.BitBtn79Click(Sender: TObject);
begin
  inherited;
  CadNf.abreFormConsultaNFe;
//  BitBtn82.Click;
end;

procedure TfrmCadNF.BitBtn7Click(Sender: TObject);
var
  vCtrl : TControlesNF;
begin
  inherited;
  if not vDadosIni.PesqPros('NF0062', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  try
    edDocumento.Text := CadNf.Fatura.numeroDocumento[ListBox2.ItemIndex];
    edVencimentoBol.Text := CadNf.Fatura.vencimentoDocumento[ListBox2.ItemIndex];
    edValorBol.AsValue := CadNf.Fatura.valorDocumento[ListBox2.ItemIndex];
    Panel5.Visible := true;
    vCtrl := TControlesNF.create;
    if (vDadosIni.vEmp.vConfFormPagamento = 'NF') and (not vCtrl.controleCobrebem) then
    edDocumento.Enabled := True
    else
    edDocumento.Enabled := (vDadosIni.vEmp.vNfUsarFormaPagDoPed <> 'S') and (not vCtrl.controleCobrebem);
    if (Self.Enabled) and (Self.Visible) and (edVencimentoBol.CanFocus) then
    	edVencimentoBol.SetFocus;
    BitBtn7.Enabled := false;
    ListBox2.Enabled := false;
    BitBtn12.Visible := True;
  except
    Application.MessageBox('Selecione a parcela', 'Atenção', mb_ok + MB_ICONINFORMATION);
  end;
end;

procedure TfrmCadNF.BitBtn80Click(Sender: TObject);
var
  vTemp: string;
begin
  inherited;
  btNF_P_Prod.Tag := 0;
  bt_nf_prod_add_pedpvenda.Hint := 'Anexar a nota Fiscal - [NF0068]';
  bt_nf_serv_add_pedpvenda.Visible := True;
  vDadosIni.vInibeMensPesqPros := 'S';
  ckValorNf.Visible := vDadosIni.PesqPros('NF0192', 'HABILITAR', '', 'NOTAFISCAL', '', CadNf.buscas, True);
  if not ckValorNf.Visible then
    ckValorNf.Checked := False;
  vStringEntradaSaidaFormEscolhaNF := 'S';
  vStringProdOuServNF := 'A';
  if (vDadosIni.vEmp.vNfe.modeloNF = '55') and (vDadosIni.vEmp.vNfe.usarServico <> 'S') then
  begin
    vStringProdOuServNF := '';
    if not vDadosIni.abreForm('Escolha o tipo de Nota: Produtos ou Serviços', pnEscolhaNFBotoesProdServ, opFormsDefCad + [ofEscapeExit]) then
      vStringProdOuServNF := '';
    vStringProdOuServNF := vDadosIni.retornoPorCondicao(
      vDadosIni.strEstaContidoEm(vStringProdOuServNF, ['P', 'S']), vStringProdOuServNF, '');
  end;

  if Trim(vStringProdOuServNF) = '' then
    Exit;
  if CadNf.incluirNf( tnfProdutos, vStringProdOuServNF[1], vStringEntradaSaidaFormEscolhaNF[1]) then
  begin
    getDadosFormularioMontarNfPedVenda;
    if CadNf.abreFormPedidoDeVenda then
      TForm(pnSaida.Parent).ModalResult := IDOK
    else
      CadNf.CancelUpdates;
  end;
end;

procedure TfrmCadNF.BitBtn81Click(Sender: TObject);
begin
  inherited;
  TForm(pnSaida.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn81KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_ESCAPE then
    BitBtn81.Click;
end;

procedure TfrmCadNF.BitBtn82Click(Sender: TObject);
begin
  inherited;
    TForm(pnEntSaidaNFe.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn82KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_ESCAPE then
    BitBtn82.Click;
end;

procedure TfrmCadNF.BitBtn83Click(Sender: TObject);
begin
  inherited;
  CadNf.imprimeNotaFiscal;
end;

procedure TfrmCadNF.BitBtn84Click(Sender: TObject);
begin
  inherited;
  try
    Screen.cursor := crHourGlass;
    inherited;
    BitBtn56.Enabled := False;
    if CadNf.incluirNfComplementar then
    begin
      TForm(pnSaida.Parent).ModalResult := IDOK;
      habilitaCamposCadastroNotaFiscal;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.BitBtn85Click(Sender: TObject);
begin
  inherited;
  TForm(pnProdForn.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn86Click(Sender: TObject);
begin
  inherited;
  TForm(pnProdForn.Parent).ModalResult := mrCancel;
end;

procedure TfrmCadNF.BitBtn87Click(Sender: TObject);
begin
  inherited;  
  if Trim(edChaveConsultaSefaz.Text) <> '' then
    if CadNf.MontaXmlPeloPortalSefaz(edChaveConsultaSefaz.Text) then
    begin
      habilitaCamposCadastroNotaFiscal;
      CadNf.vItem.dataSet.First;
      TForm(pnEntrada.Parent).ModalResult := IDOK;
    end;
end;

procedure TfrmCadNF.BitBtn88Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0073', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.vItem.Edit then
  begin
    pnAlterarItemSintegra.Visible := True;
    pnConsultaItemSintegra.Visible := False;
    if (Self.Enabled) and (Self.Visible) and (DBEdit216.CanFocus) then
    	DBEdit216.SetFocus;
  end;
end;

procedure TfrmCadNF.BitBtn89Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0074', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.vItem.salvaItemAlteracaoSintegra(CadNf) then
  begin
    pnConsultaItemSintegra.Visible := True;
    pnAlterarItemSintegra.Visible := False;
  end;
end;

procedure TfrmCadNF.BitBtn8Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if CadNf.gerarFaturas(True) then
  begin
    getFaturas;
    //    BitBtn9.Enabled := true;
  end;
end;

procedure TfrmCadNF.BitBtn90Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.Cancel;
  pnConsultaItemSintegra.Visible := True;
  pnAlterarItemSintegra.Visible := False;
end;

procedure TfrmCadNF.BitBtn91Click(Sender: TObject);
begin
  inherited;     
  if not vDadosIni.PesqPros('NF0072', 'EDITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  TForm(pnNfSintegra.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn92Click(Sender: TObject);
begin
  inherited;
  TForm(pnNfSintegra.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn93Click(Sender: TObject);
begin
  inherited;
      TForm(pnDetFormPagEnt.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn94Click(Sender: TObject);
begin
  inherited;
  if pos('F', Label404.Caption) > 0 then
  begin
    IF CadNf.salvarDetalhesFatura(CadNf.Fatura.parcelas - 1,cdsDesp) THEN
      TForm(pnDetFatEnt.Parent).ModalResult := IDOK;
  end
  else
  IF CadNf.salvarDetalhesFatura(ListBox3.ItemIndex,cdsDesp) THEN
    TForm(pnDetFatEnt.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.BitBtn95Click(Sender: TObject);
begin
  inherited;
  IF CadNf.cancelarDetalhesFatura(ListBox3.ItemIndex,cdsDesp) THEN
    TForm(pnDetFatEnt.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.BitBtn96Click(Sender: TObject);
var
  vrTemp: Currency;
begin
  inherited;
  try
  cdsDespDepartamento.AsString := DBText46.Caption;
  if Trim(cdsDespNumConta.AsString) = '' then
    raise exception.create('Numero da Conta precisa ser preenchido');
  if Trim(cdsDespDataReferencia.AsString) = '' then
    raise exception.create('Data de Referencia precisa ser preenchida');
  if Trim(cdsDespHistorico.AsString) = '' then
    raise exception.create('Histórico da Conta precisa ser preenchido');
  if cdsDespValor.AsCurrency <= 0 then
    raise exception.create('Valor da Conta precisa ser preenchido');
  if Trim(cdsDespNumDoc.AsString) = '' then
    raise exception.create('Numero do documento da Conta precisa ser preenchido');
  if Trim(cdsDespControles.AsString) = '' then
    raise exception.create('Controle da Conta precisa ser preenchido');
  if Trim(DBLookupComboBox11.Text) = '' then
    raise exception.create('Controle da Conta precisa ser preenchido');
  cdsDespNomeControle.Text := DBLookupComboBox11.Text;
  cdsDespValor.AsCurrency:= vDadosIni.StrToFloatFormat(cdsDespValor.AsCurrency,2);
  cdsDesp.Post;
  Panel87.Enabled := False;
  Panel88.Enabled := True;
  Panel84.Enabled := True;
  cdsDesp.First;
  vrTemp:=0;
  while not cdsDesp.Eof do
  begin
    vrTemp:= vrTemp + cdsDespValor.AsFloat;
    cdsDesp.Next;
  end;
  if pos('F', Label404.Caption) > 0 then
    Label414.Caption :=Format('%0.2m', [CadNf.Fatura.valorDocumento[CadNf.Fatura.parcelas - 1] - vrTemp] )
  else
    Label414.Caption :=Format('%0.2m', [CadNf.Fatura.valorDocumento[ListBox3.ItemIndex] - vrTemp] );
  except
    on e:exception do begin
      Application.MessageBox(pchar(e.Message),'Atenção',0+64);
    end;
  end;
end;

procedure TfrmCadNF.BitBtn97Click(Sender: TObject);
var
  vrTemp: Currency;
begin
  inherited;
  cdsDesp.Cancel;
  Panel87.Enabled := False;
  Panel88.Enabled := True;
  Panel84.Enabled := True;
  cdsDesp.First;
    vrTemp:=0;
  while not cdsDesp.Eof do
  begin
    vrTemp:= vrTemp + cdsDespValor.AsFloat;
    cdsDesp.Next;
  end;
  Label414.Caption :=Format('%0.2m', [vrTemp] );
end;

procedure TfrmCadNF.BitBtn98Click(Sender: TObject);
begin
  inherited;
  cdsDesp.Edit;             
  Panel87.Enabled := True;
  Panel88.Enabled := False; 
  Panel84.Enabled := False;
  if (Self.Enabled) and (Self.Visible) and (DBEdit225.CanFocus) then
  	DBEdit225.SetFocus;
end;

procedure TfrmCadNF.BitBtn99Click(Sender: TObject);
var
  vrTemp: Currency;
begin
  inherited;
  vrTemp:=0;
  cdsDesp.First;
  while not cdsDesp.Eof do
  begin
    vrTemp:= vrTemp + cdsDespValor.AsFloat;
    cdsDesp.Next;
  end;
  cdsDesp.Append;
  if pos('F', Label404.Caption) > 0 then
  begin
    cdsDespHistorico.AsString := 'CONHECIMENTO DE FRETE NF ' + CadNf.dataSet.FieldByName('num_nf').AsString;
    cdsDespNumDoc.AsString := CadNf.Fatura.numeroDocumento[CadNf.Fatura.parcelas - 1]+'-'+vDadosIni.StrZero(cdsDesp.RecordCount+1,2);
    cdsDespValor.AsCurrency := CadNf.Fatura.valorDocumento[CadNf.Fatura.parcelas - 1] - vrTemp;
  end
  else
  begin
    cdsDespHistorico.AsString := 'COMPRA DE PRODUTO/SERVICO CONFORME NF ' + CadNf.dataSet.FieldByName('num_nf').AsString;
    cdsDespNumDoc.AsString := CadNf.Fatura.numeroDocumento[ListBox3.ItemIndex]+'-'+vDadosIni.StrZero(cdsDesp.RecordCount+1,2);
    cdsDespValor.AsCurrency := CadNf.Fatura.valorDocumento[ListBox3.ItemIndex] - vrTemp;
  end;
  cdsDespDataReferencia.AsDateTime := CadNf.dataSet.FieldByName('data_lanc').AsDateTime;
  Panel87.Enabled := True;
  Panel88.Enabled := False;
  Panel84.Enabled := False;
  if (Self.Enabled) and (Self.Visible) and (DBEdit225.CanFocus) then
  	DBEdit225.SetFocus;
end;

procedure TfrmCadNF.BitBtn9Click(Sender: TObject);
begin
  inherited;
  CadNf.abreFormFaturasSaida(false);
end;

procedure TfrmCadNF.campoEnterPerform(Sender: TObject);
begin
  //NAO APAGAR, ESTA LIGADO A VARIOS COMPONENTES
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadNF.campos_itens_cstChange(Sender: TObject);
var
  str: string;
begin
  str := eddCST.Text;

  if Length(str) <> 3 then
    Exit;

  str := Copy(str, 2, 2);

  if not MatchStr(str, icmsCSTs) then
    exit;

//  gb_item_icms_desoneracao.Enabled := MatchStr(Copy(eddCST.Text, 2, 2), ['20', '30', '40', '70', '90']);
//  gb_item_icms_diferido.Enabled    := MatchStr(Copy(eddCST.Text, 2, 2), ['51']);
  gb_item_icms_desoneracao.Enabled := MatchStr(str, ['20', '30', '40', '60', '70', '90']);
  gb_item_icms_diferido.Enabled    := MatchStr(str, ['51']);
  gb_icms_tributos_mono.Enabled       := MatchStr(str, ['02', '15']);
  gb_icms_tributos_mono_reten.Enabled := MatchStr(str, ['15']);
  gb_icms_tributos_mono_ret.Enabled   := MatchStr(str, ['61']);

  if not gb_item_icms_desoneracao.Enabled then
    gb_item_icms_desoneracao.Font.Color := clGray
  else
    gb_item_icms_desoneracao.ParentFont := True;

  if not gb_item_icms_diferido.Enabled then
    gb_item_icms_diferido.Font.Color := clGray
  else
    gb_item_icms_diferido.ParentFont := True;

  if (not pn_icms_tributos_mono.Enabled) or (not gb_icms_tributos_mono.Enabled) then
    gb_icms_tributos_mono.Font.Color := clGray
  else
    gb_icms_tributos_mono.ParentFont := True;

  if (not pn_icms_tributos_mono.Enabled) or (not gb_icms_tributos_mono_reten.Enabled) then
    gb_icms_tributos_mono_reten.Font.Color := clGray
  else
    gb_icms_tributos_mono_reten.ParentFont := True;

  if (not pn_icms_tributos_mono.Enabled) or (not gb_icms_tributos_mono_ret.Enabled) then
    gb_icms_tributos_mono_ret.Font.Color := clGray
  else
    gb_icms_tributos_mono_ret.ParentFont := True;

  if MatchText(str, ['02', '15', '53', '61']) then
  begin
    pg_icms_tributos.ActivePage := tab_icms_tributos_mono;
    pg_icms_tributos.Height := pn_icms_tributos_mono.Height;
  end
  else
  begin
    pg_icms_tributos.ActivePage := tab_icms_tributos;
    pg_icms_tributos.Height := pn_icms_tributos.Height;
  end;
end;

procedure TfrmCadNF.ResolverEmissaoEmContingencia(CodigoNF: Integer);
var
  Erro: WideString;
begin
  Screen.Cursor := crHourGlass;
  try try

    if ShowConfirmacao(
      'NFe não pode ser Autorizada!!!.' + sLineBreak +
      'É possível gerar um contingência agora e solucionar o problema depois' + sLineBreak +
      'Uma cópia dessa NFe será criada e ficará como Pendente para Inutilização ou Cancelamento' + sLineBreak +
      'Essa NFe vai gerar um novo número e ficará com situação igual a "Contingencia" para posterior Autorização' + sLineBreak + sLineBreak +
      'Deseja continuar mesmo assim?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> mrYes then
      Exit;

    if DFeHwLib.ConverterEmContingencia(CodigoNF, Erro) then
    begin
      ShowMessage(
        'Contigência gerada com sucesso.' + sLineBreak +
        'O emitente da NFe deve manter uma cópia impressa dessa NFe até o momento de sua Autorização'
      );
    end
    else
      ShowErro(Erro);

  except on E: Exception do
    UIUtils.HandleError(E);
  end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.ResolverPendenciaSefaz(CodigoNF: Integer);
var
  erros: WideString;
begin
  if not DFeHwLib.ResolverPendenciaNFeSefaz(CodigoNF, erros) then
    ShowErro(erros)
  else
    ShowAtencao('Processo concluído');

  CadNf.Refresh;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadNF.CheckBox3Click(Sender: TObject);
begin
  inherited;
  GroupBox4.Visible := CheckBox3.Checked;
  GroupBox5.Visible := CheckBox1.Checked;
end;

procedure TfrmCadNF.ckdAnt_calcClick(Sender: TObject);
begin
  inherited;
  if ckdAnt_calc.Checked then
  begin
    eddAliqICMSub.AsValue := 0;
    eddReducaoBaseICMSub.AsValue := 0;
    eddMVA.AsValue := 0;
    eddAntT.Text := 'S';
    if (Self.Enabled) and (Self.Visible) and (eddBaseICMSub.CanFocus) then
      eddBaseICMSub.SetFocus;
    eddAliqICMSub.Enabled := False;
    eddReducaoBaseICMSub.Enabled := False;
    eddMVA.Enabled := False;
    eddAntT.Enabled := False;
    eddValorICMSST.Enabled := True;
    if eddBaseICMSub.CanFocus then
      Application.MessageBox('Por favor preencha apenas os campos de Base de calculo e de Valor', 'Atenção', 0 + 64);
  end
  else
  begin
    eddAliqICMSub.Enabled := True;
    eddReducaoBaseICMSub.Enabled := True;
    eddMVA.Enabled := True;
    eddAntT.Enabled := True;
    eddValorICMSST.Enabled := False;
  end;
end;

procedure TfrmCadNF.ckEfetuarLancamentoFiscalDocumentoClick(Sender: TObject);
begin
  inherited;
  if ckEfetuarLancamentoFiscalItemDocumento.Checked then
    ckEfetuarLancamentoFiscalItemDocumento.Checked := not ckEfetuarLancamentoFiscalDocumento.Checked;
  if (not CadNf.vSped.vC195_C197.vLancFiscal.dataSet.Active) or (CadNf.vSped.vC195_C197.vLancFiscal.dataSet.IsEmpty) then
    CadNf.vSped.vC195_C197.vLancFiscal.abreLancamentosFiscais;
  DBLookupComboBox15.KeyValue := CadNf.vSped.vC195_C197.vLancFiscal.dataSet.FieldByName('cod_obs').AsInteger;
  DBLookupComboBox15.Enabled := (ckEfetuarLancamentoFiscalDocumento.Checked) or (ckEfetuarLancamentoFiscalItemDocumento.Checked);

  if not DBLookupComboBox15.Enabled then
    BitBtn113.Enabled := True
  else
    BitBtn113.Enabled := not CadNf.vSped.vC195_C197.vLancFiscal.dataSet.IsEmpty;
  regSetConfBool(ckEfetuarLancamentoFiscalItemDocumento.Name, ckEfetuarLancamentoFiscalItemDocumento.Checked);
end;

procedure TfrmCadNF.ckEfetuarLancamentoFiscalItemDocumentoClick(
  Sender: TObject);
begin
  inherited;
  if ckEfetuarLancamentoFiscalDocumento.Checked then
    ckEfetuarLancamentoFiscalDocumento.Checked := not ckEfetuarLancamentoFiscalItemDocumento.Checked;
  if (not CadNf.vSped.vC195_C197.vLancFiscal.dataSet.Active) or (CadNf.vSped.vC195_C197.vLancFiscal.dataSet.IsEmpty) then
    CadNf.vSped.vC195_C197.vLancFiscal.abreLancamentosFiscais;
  DBLookupComboBox15.KeyValue := CadNf.vSped.vC195_C197.vLancFiscal.dataSet.FieldByName('cod_obs').AsInteger;
  DBLookupComboBox15.Enabled := (ckEfetuarLancamentoFiscalDocumento.Checked) or (ckEfetuarLancamentoFiscalItemDocumento.Checked);

  if not DBLookupComboBox15.Enabled then
    BitBtn113.Enabled := True
  else
    BitBtn113.Enabled := not CadNf.vSped.vC195_C197.vLancFiscal.dataSet.IsEmpty;
end;

procedure TfrmCadNF.ckEsconderNotasClick(Sender: TObject);
begin
  inherited;
  if not CadNf.vPedVNf.dataSet.Active then
    Exit;

  try
    CadNf.vPedVNf.dataSet.Filter := IfThen(ckEsconderNotas.Checked, 'num_nf is null');
  finally
    CadNf.vPedVNf.dataSet.Filtered := CadNf.vPedVNf.dataSet.Filter <> '';
  end;
end;

procedure TfrmCadNF.ckMostrarApenasComSTClick(Sender: TObject);
begin
  inherited;
  CadNf.vItem.dataSet.Filtered := ckMostrarApenasComST.Checked;
end;

procedure TfrmCadNF.ckonAnt_calcClick(Sender: TObject);
begin
  inherited;
  if ckonAnt_calc.Checked then
  begin
    edOnAliqICMSub.AsValue := 0;
    edOnRedBaseST.AsValue := 0;
    edOnMVA.AsValue := 0;
    edoAntT.Text := 'S';
    if (Self.Enabled) and (Self.Visible) and (edOnBaseICMSub.CanFocus) then
    	edOnBaseICMSub.SetFocus;
    edoAntT.Enabled := False;
    edOnAliqICMSub.Enabled := False;
    edOnRedBaseST.Enabled := False;
    edOnMVA.Enabled := False;
    Application.MessageBox('Por favor preencha apenas os campos de Base de calculo e de Valor',
      'Atenção', 0 + 64);
  end
  else
  begin
    edoAntT.Enabled := True;
    edoAntT.Enabled := True;
    edOnAliqICMSub.Enabled := True;
    edOnRedBaseST.Enabled := True;
    edOnMVA.Enabled := True;
  end;
end;

procedure TfrmCadNF.ckPVApenasComCupomFiscalClick(Sender: TObject);
var
  ANewColumn: Boolean;
  I: Integer;
begin
  inherited;
  if (vDadosIni.vEmp.vUsarUmaVendaPorNF <> 'S') or (ckPVApenasComCupomFiscal.Checked) or (CadNf.fstr('natureza_nf') = 'E') then
  begin
    BitBtn15.Top := 20;
    btPVTickAll.Visible := True;
    btPVUnTickAll.Visible := True;
    ANewColumn := True;
    for I := 0 to DBGrid2.Columns.Count - 1 do
      if DBGrid2.Columns.Items[I].FieldName = 'SEL' then
      begin
        ANewColumn := False;
        Break;
      end;
    if ANewColumn then
      with TColumn(DBGrid2.Columns.Insert(0)) do
      begin
        FieldName := 'SEL';
        DisplayName := '..';
      end;
  end
  else
  begin
    BitBtn15.Top := 35;
    btPVTickAll.Visible := False;
    btPVUnTickAll.Visible := False;
    for I := DBGrid2.Columns.Count - 1 downto 0 do
      if DBGrid2.Columns.Items[I].FieldName = 'SEL' then
      begin
        DBGrid2.Columns.Delete(I);
        Break;
      end;
  end;
end;

procedure TfrmCadNF.ckUsarValorDoPedido2Click(Sender: TObject);
var
  Fat: RFaturas;
begin
  inherited;
  if ckUsarValorDoPedido2.Enabled and ckUsarValorDoPedido2.Checked then
    if not vDadosIni.PesqPros('NF0199', 'VALIDAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString,
      'NOTAFISCAL', CadNf.dataSet.FieldByName('COD_NF').AsString, CadNf.buscas) then
      Exit;
  Fat := CadNf.Fatura;
  Fat.UsarValorDoPedido := ckUsarValorDoPedido2.Checked;
  CadNf.Fatura := Fat;
  CadNf._GravaConfiguracoesBoolean('Fatura_UsarValorDoPedido', CadNf.Fatura.UsarValorDoPedido);
  if CadNf.gerarFaturas(True) then
    getFaturas;
end;

procedure TfrmCadNF.ckUsarValorDoPedidoClick(Sender: TObject);
var
  Fat: RFaturas;
begin
  inherited;
  if ckUsarValorDoPedido.Enabled and ckUsarValorDoPedido.Checked then
    if not vDadosIni.PesqPros('NF0199', 'VALIDAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString,
      'NOTAFISCAL', CadNf.dataSet.FieldByName('COD_NF').AsString, CadNf.buscas) then
      Exit;
  Fat := CadNf.Fatura;
  Fat.UsarValorDoPedido := ckUsarValorDoPedido.Checked;
  CadNf.Fatura := Fat;
  CadNf._GravaConfiguracoesBoolean('Fatura_UsarValorDoPedido', CadNf.Fatura.UsarValorDoPedido);
  if CadNf.gerarFaturas(True) then
    getFaturas;
end;

procedure TfrmCadNF.ck_base_habClick(Sender: TObject);
begin
  inherited;
  ck_base.Enabled := ck_base_hab.Checked;
end;

procedure TfrmCadNF.ItensAreaDeTransferenciaMenuColaritens1Click(Sender: TObject);
var
  props: TNewCopyProps;
  ignorarOriginal: YesNoEnum;
begin
  inherited;
  if not CadNf.Auditor.Visualizar
    .Processo('NF0246')
    .SetMensagem('NUM NF %d', [CadNf.fint('num_nf')])
    .SetChave(CadNf.fstr('cod_nf'))
    .Permitido then
    Exit;

  CadNf.vItem.prepare_loop();
  props := TNewCopyProps.Create;
  try
    props.EouS  := CadNf.fstr('natureza_nf');
    props.IsDev := CadNf.fequals('tipo_emissao', '4');
    props.ClienteId := CadNf.fint('cod_cliente');
    props.IsSN := vDadosIni.vEmp.vRegime = 'SIMPLES';

    ignorarOriginal := YesNoEnum(CadNf.fint('dfe_trib_ignorar'));

    CadNf.ColarItensNaNF(CadNf.CopiadorNF.NewCopy(props), nil);

    if CadNf.fequals('tipo_emissao', '4')
      and (YesNoEnum(CadNf.fint('dfe_trib_ignorar')) = ynNo) and (ignorarOriginal = ynYes) then
    begin
      ProgressUtil.Terminate();
      ShowAtencao(
        'Os dados dos tributos da RTC foram encontrados e copiados para devolução' + sLineBreak +
        'Caso não seja o caso de devolver esses tributos, marque a opção para Ignorar os tributos da RTC'
      );
    end;

  finally
    props.Free;
    ProgressUtil.TimeOut(2);
    CadNf.vItem.prepare_loop_done();
  end;
end;

procedure TfrmCadNF.ComboBox11Exit(Sender: TObject);
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

function TfrmCadNF.confirmacao_nota_tela_enviar(var Aprint, AsendMail,
  AcomBol: Boolean; var tipoDANFe: string): Boolean;
var
  I: Integer;
  list: TStrings;  
begin
  try
    btNFeAutorizar2.OnClick := nil;

    ckNFeAutorizacao_print.Checked := Aprint;
    ckNFeAutorizacao_mail.Checked  := AsendMail;
    ckNFeAutorizacao_Bol.Checked   := AcomBol;
    ckNFeAutorizacao_onlySel.Enabled := False;
    ckNFeAutorizacao_onlySel.Checked := False;

    cbNFeAutorizacao_tipoDanfe.Visible := StartsText('Selecionar', vDadosIni.vEmp.vNfe.danfeTipo);
    cbNFeAutorizacao_tipoDanfe.ItemIndex := cbNFeAutorizacao_tipoDanfe.Items.IndexOf(tipoDANFe);
    {
    pnNFeModulo_Enviar.Height := IfThen(cbNFeAutorizacao_tipoDanfe.Visible, 173, 144);
    ckNFeAutorizacao_onlySel.Top := IfThen(cbNFeAutorizacao_tipoDanfe.Visible, 97, 70);
    }                                                                                                  
    CheckListEtiq2.Items.Clear;
    list := CadNf.GetListEtiquetasDanfe(True);
    pnNFeModulo_Imprimir_Etiq.Visible := list.Count > 0;
    for I := 0 to List.Count - 1 do
      CheckListEtiq2.AddItem(list[i], list.Objects[i]);

    pnNFeModulo_Enviar_Opcoes.Height := IfThen(cbNFeAutorizacao_tipoDanfe.Visible, 79, 47);
    pnNFeModulo_Imprimir_Etiq.Parent := pnNFeModulo_Enviar;
    pnNFeModulo_Imprimir_Etiq.Top := pnNFeModulo_Enviar_Opcoes.Top + pnNFeModulo_Enviar_Opcoes.Height + 6;
    pnNFeModulo_Enviar_Botoes.Top := pnNFeModulo_Imprimir_Etiq.Top + pnNFeModulo_Imprimir_Etiq.Height + 6;
    pnNFeModulo_Enviar.Height := pnNFeModulo_Enviar_Botoes.Top + pnNFeModulo_Enviar_Botoes.Height + 12;

    if cbNFeAutorizacao_tipoDanfe.ItemIndex = -1 then
      cbNFeAutorizacao_tipoDanfe.ItemIndex := regGetConfInt('SelecaoTipoDANFe', 0);

    Result := vDadosIni.abreForm('Enviar pedido de Autorização', pnNFeModulo_Enviar, opFormsDefCad + [ofAutoSize]);

    Aprint := ckNFeAutorizacao_print.Checked;
    AsendMail := ckNFeAutorizacao_mail.Checked;
    AcomBol := ckNFeAutorizacao_Bol.Checked;
    tipoDANFe := IfThen(cbNFeAutorizacao_tipoDanfe.Visible, cbNFeAutorizacao_tipoDanfe.Text);

    regSetConfInt('SelecaoTipoDANFe', cbNFeAutorizacao_tipoDanfe.ItemIndex);

  finally
    ckNFeAutorizacao_onlySel.Enabled := True;
    btNFeAutorizar2.OnClick := btNFeAutorizar2Click;
  end;
end;

procedure TfrmCadNF.edOCSTPISChange(Sender: TObject);
begin
  inherited;
  edOCSTPIS.Hint := 'CST do PIS:'+edOCSTPIS.Items[edOCSTPIS.ItemIndex];
end;

procedure TfrmCadNF.edOCSTPISExit(Sender: TObject);
begin
  inherited;
  edOCSTPIS.Text := edOCSTPIS.Items[edOCSTPIS.ItemIndex];

  if (CadNf.campo_natureza_nf = 'S') then
    if copy(edOCSTPIS.Text,1,2) = '03' then
    begin
      SpeedButton45.Caption := '%';
      SpeedButton45.Click;
    end
    else
    begin
      SpeedButton45.Caption := '$';
      SpeedButton45.Click;
    end;
end;

procedure TfrmCadNF.eddCSTPISChange(Sender: TObject);
begin
  inherited;
  eddCSTPIS.Hint := 'CST do PIS:'+eddCSTPIS.Items[eddCSTPIS.ItemIndex];
end;

procedure TfrmCadNF.eddCSTPISDblClick(Sender: TObject);
begin
  inherited;
  CadNf.abreFormCSTPISCOFINS;
end;

procedure TfrmCadNF.eddCSTPISExit(Sender: TObject);
begin
  inherited;
  eddCSTPIS.Text := eddCSTPIS.Items[eddCSTPIS.ItemIndex];

  if (CadNf.campo_natureza_nf = 'S') then
    if copy(eddCSTPIS.Text,1,2) = '03' then
    begin
      bt_it_pc_alterar_aliq_perc.Caption := '%';
      bt_it_pc_alterar_aliq_perc.Click;
    end
    else
    begin
      bt_it_pc_alterar_aliq_perc.Caption := '$';
      bt_it_pc_alterar_aliq_perc.Click;
    end;

end;

procedure TfrmCadNF.ItensAreaDeTransferenciaMenuCopiaritens1Click(Sender: TObject);
begin
  inherited;

  if CadNf.dataSet.IsEmpty then
  begin
    ProgressUtil.TimeOut(1, 'Nenhuma nota selecionada');
    Exit;
  end;

  if not CadNf.Auditor.Visualizar.Processo('NF0245').Permitido then
    Exit;

  if PageControl1.ActivePage = TabSheet2 then
    CadNf.vItem.selecionaItens(CadNf.fint('cod_nf'));

  CadNf.vItem.prepare_loop();
  try
    CadNf.CopiadorNF.CopyFrom(CadNf.dataSet, CadNf.vItem.dataSet, ProgressUtil.Msg);
  finally
    CadNf.vItem.prepare_loop_done();
    ProgressUtil.TimeOut(1);
  end;
end;

procedure TfrmCadNF.ItensAreaDeTransferenciaMenuItemCopiaritem1Click(Sender: TObject);
begin
  inherited;

  if not CadNf.Auditor.Visualizar.Processo('NF0245').Permitido then
    Exit;

  CadNf.vItem.prepare_loop('nitem = ' + CadNf.vItem.fstr('nitem'));
  try
    CadNf.CopiadorNF.CopyFrom(CadNf.dataSet, CadNf.vItem.dataSet, ProgressUtil.Msg);
  finally
    CadNf.vItem.prepare_loop_done();
    ProgressUtil.TimeOut(1);
  end;
end;

procedure TfrmCadNF.ItensAreaDeTransferenciaMenuLimpar1Click(Sender: TObject);
begin
  inherited;
  if CadNf.CopiadorNF.ClipBoardNF.Prods.Count = 0 then
    ProgressUtil.TimeOut(2, 'Área de transferência não possui itens')
  else
  begin
    if ShowCustomDlg.Msg('Deseja mesmo limpar todos os registros da área de transferência?', mdtQuestion, [brYes, brNo])
      .SetDefaultBtn(brNo)
      .Show().ResultDlg <> IDYES then
      Exit;

    CadNf.CopiadorNF.ClipBoardNF.Prods.Clear;
    ProgressUtil.TimeOut(2, 'Área de transferência limpa com sucesso');
  end;
end;

procedure TfrmCadNF.NfAreaDeTransferenciaMenuEscolherCopiar1Click(Sender: TObject);
begin
  inherited;
//  LogApp.Log('teste', ' A 1');
  //
  Application.CreateForm(TfrmCadNFCopiador, frmCadNFCopiador);
//  LogApp.Log('teste', ' A 2');
  frmCadNFCopiador.Nota := CadNf;
//  LogApp.Log('teste', ' A 3');
  frmCadNFCopiador.HandleSelecaoNotas;
//  LogApp.Log('teste', ' A 4');
  if frmCadNFCopiador.ShowModal = mrOk then
    habilitaCamposCadastroNotaFiscal;
end;

procedure TfrmCadNF.NfAreaDeTransferenciaMenuColaritens1Click(Sender: TObject);
var
  props: TNewCopyProps;
  ignorarOriginal: YesNoEnum;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'A', CadNf.buscas) then
    Exit;

  if CadNf.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
    exit;

  if CadNf.dataSet.IsEmpty then
  begin
    ProgressUtil.Error('');
    ProgressUtil.TimeOut(2, 'Nenhuma nota selecionada');
    Exit;
  end;

  if not CadNf.emEdicao then
  begin
    ProgressUtil.Error('');
    ProgressUtil.TimeOut(2, 'Nota fiscal não permite mais alterações');
    Exit;
  end;

  if CadNf.CopiadorNF.ClipBoardNF.Prods.Count = 0 then
  begin
    ProgressUtil.Error('');
    ProgressUtil.TimeOut(2, 'Sem itens na área de transferência');
    Exit;
  end;

  if not CadNf.conferenciaCegaFechada then
    begin
    	Application.MessageBox(pChar('Nota Fiscal criada a partir da Conferência Cega, '#13'não é possivel editar/ excluir até que a Conferência Cega esteja FECHADA, '#13'Código da Conferência Cega: ' + IntToStr(CadNf.CodConferencia)), 'Atenção', 0 + 64);
      Exit;
    end;

  if not CadNf.Auditor.Visualizar
    .Processo('NF0246')
    .SetMensagem('NUM NF %d', [CadNf.fint('num_nf')])
    .SetChave(CadNf.fstr('cod_nf'))
    .Permitido then
    Exit;

  if CadNf.Edit then
  begin
    try

      props := TNewCopyProps.Create;
      try
        props.EouS  := CadNf.fstr('natureza_nf');
        props.IsDev := CadNf.fequals('tipo_emissao', '4');
        props.ClienteId := CadNf.fint('cod_cliente');
        props.IsSN := vDadosIni.vEmp.vRegime = 'SIMPLES';

        ignorarOriginal := YesNoEnum(CadNf.fint('dfe_trib_ignorar'));

        if CadNf.ColarItensNaNF(CadNf.CopiadorNF.NewCopy(props), nil) then
        begin
          habilitaCamposCadastroNotaFiscal;
          if CadNf.fequals('tipo_emissao', '4')
            and (YesNoEnum(CadNf.fint('dfe_trib_ignorar')) = ynNo) and (ignorarOriginal = ynYes) then
          begin
            ProgressUtil.Terminate();
            ShowAtencao(
              'Os dados dos tributos da RTC foram encontrados e copiados para devolução' + sLineBreak +
              'Caso não seja o caso de devolver esses tributos, marque a opção para Ignorar os tributos da RTC'
            );
          end;
        end
        else
          CadNf.CancelUpdates;
      finally
        props.Free;
        ProgressUtil.TimeOut(2);
      end;

    except on E: Exception do
      CadNf.CancelUpdates
    end;
  end;
end;

procedure TfrmCadNF.CopiarparareadetransfernciaManifestacaoClick(
  Sender: TObject);
begin
  inherited;
	Clipboard.AsText :=
  	DBGridManifestacao.DataSource.DataSet.FieldByName(DBGridManifestacao.Columns[DBGridManifestacao.SelectedIndex].FieldName).AsString;
end;

constructor TfrmCadNF.Create2(AOwner: TComponent; nPedVenda: integer;
  tipoPedVenda: string);
begin
  inherited Create(AOwner);
  TelaCadastro := vDadosIni.vTipoForm;
  CadNf := TNFCab.create(nPedVenda,tipoPedVenda);
end;

procedure TfrmCadNF.Criarconversao11paraitemselecionado1Click(Sender: TObject);
begin
  inherited;

  if not CadNf.Auditor.Inserir.Processo('NF0250', 'NUM NF '+ CadNf.fstr('NUM_NF'), CadNf.fstr('COD_NF')).Permitido then
    Exit;

  CadNf.vItem.CadastrarConversaoUmParaUmAuto(False);
end;

procedure TfrmCadNF.Criarconversao11paratodositenssemconversodefinida1Click(
  Sender: TObject);
begin
  inherited;

  if not CadNf.Auditor.Inserir.Processo('NF0251', 'NUM NF '+ CadNf.fstr('NUM_NF'), CadNf.fstr('COD_NF')).Permitido then
    Exit;

  CadNf.vItem.CadastrarConversaoUmParaUmAuto(True);
end;

procedure TfrmCadNF.CriarconversodoXMLeapplicarsobreQtde1Click(Sender: TObject);
var
  payload: TConvUnidadeCriarInput;
  undVenda: TUnidadeVenda_Model;
  sUndVenda: TStrings;
begin
  inherited;
  payload := TConvUnidadeCriarInput.Create;
  payload.grupo_prod := CadNf.vItem.fint('grupo_prod');
  payload.cod_prod := CadNf.vItem.fstr('cod_prod');
  payload.cod_empresa := vDadosIni.cod_empresa;
  payload.usuario := vDadosIni.vNomeUsuario;
  payload.uvnd := AnsiUpperCase(CadNf.vItem.fstr('ucom'));
  payload.ean := IfThen(CadNf.vItem.fstr('cean') <> 'SEM GTIN', CadNf.vItem.fstr('cean'));

  if ConversaoUnidadeUtils.Criar(CadNf.buscas.Database, payload) then
  begin
    CadNf.vItem.alterar;
    try

      sUndVenda := CadNf.vItem.GetUndVendaProd();

      if sUndVenda.IndexOf(CadNf.vItem.fstr('ucom')) >= 0 then
      begin
        undVenda := (sUndVenda.Objects[sUndVenda.IndexOf(CadNf.vItem.fstr('ucom'))] as TUnidadeVenda_Model);

        if undVenda.fator > 0 then
          CadNf.vItem.AplicarConversaoDadosXML(undVenda);
      end;

    finally
      CadNf.vItem.cancelar;
    end;
  end;
end;

procedure TfrmCadNF.CuponsFiscaisReferenciados1Click(Sender: TObject);
begin
  inherited;
  if not CadNf.vSped.vC110.dataSet.IsEmpty then
    CadNf.abreFormC114(True);
end;

procedure TfrmCadNF.DadosdeColetaEntrega1Click(Sender: TObject);
begin
  inherited;
  if not CadNf.vSped.vC110.dataSet.IsEmpty then
    CadNf.abreFormC115(True);
end;

procedure TfrmCadNF.DBComboBox16Change(Sender: TObject);
begin
  inherited;
  try
    Memo3.Lines.Clear;
    Memo3.Lines.Add(TDBComboBox(sender).Items[TDBComboBox(sender).itemIndex]);
  except
  end;
end;

procedure TfrmCadNF.DBComboBox16Exit(Sender: TObject);
begin
  inherited;
  Memo3.Lines.Clear;
end;

procedure TfrmCadNF.eddevolucaoExit(Sender: TObject);
begin
  inherited;
  eddAliqICM.Enabled := True;
  DBEdit39.Enabled   := True;
  eddModBCST.Enabled := True;

  CadNf.vItem.prepare_loop();
  Screen.Cursor := crHourGlass;
  try
    CadNf.verPermissaoDesconto;
  finally
    CadNf.vItem.prepare_loop_done();
    Screen.Cursor := crDefault;
  end;

  eddModBCST.Enabled      := (CadNf.campo_natureza_nf = 'E') and (copy(CadNf.dataSet.FieldByName('devolucao').AsString , 1, 1) <> 'S');
  edcod_devolucao.Enabled := (CadNf.campo_natureza_nf = 'E') and (copy(CadNf.dataSet.FieldByName('devolucao').AsString , 1, 1) = 'S');
  if (CadNf.campo_natureza_nf = 'E') or (CadNf.f_int('COD_PRODUCAO_MP') > 0) or (CadNf.f_str('devolucao') = 'SIM') then
    eddValorUnitario.FormatSize := '0.10'
  else
    eddValorUnitario.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais + IfThen(eddValorTotal.Enabled, 1));
end;

procedure TfrmCadNF.DBEdit100Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = btSalvarDetalhesVeiculo) or (ActiveControl = btCancelarDetalhesVeiculo) then
    Exit;
  CadNf.vItem.verificaMarcaVeiculoHonda;
end;

procedure TfrmCadNF.DBEdit105Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = btSalvarDetalhesVeiculo) or (ActiveControl = btCancelarDetalhesVeiculo) then
    Exit;
  CadNf.vItem.verificaCorDescricao;
end;

procedure TfrmCadNF.ed_codigo_nopExit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn92) then
    exit;

  Screen.Cursor := crHourGlass;
  try
    CadNf.FTemp := 1;
    if not CadNf.exitCodigoTabela('NAT_OP') then
      if not setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro) then
      begin
        if (Self.Enabled) and (Self.Visible) and (ed_codigo_nop.CanFocus) then
          ed_codigo_nop.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBEdit214.CanFocus) then
          DBEdit214.SetFocus;
        exit;
      end;
    ckConsumidorFinal.Enabled := ckConsumidorFinal.Visible and (CadNf.fstr('codigo_nop', 2, 3) <> '929');
    btNotaRetorno.Enabled := CadNf.notaFiscalDeRetorno;
    btNotaRetorno.Left := IfThen(edPickerOpInterna.Visible, 381, 421 );    
    DBEdit11.Width := btNotaRetorno.Left - DBEdit11.Left - 6{margens}; 
    {
    if (btNotaRetorno.Enabled) and
      ((CadNf.dataSet.FieldByName('num_nf_emt').AsInteger = 0) or
      (Trim(CadNf.dataSet.FieldByName('serie_emt').AsString) = ''))then
      btNotaRetorno.Click;
    }
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.ed_codigo_nopKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
    CadNf.teclaAtalho('NAT_OP', 'F3');
end;

procedure TfrmCadNF.DBEdit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
    CadNf.teclaAtalho('NAT_OP_DESCRICAO', 'F3');
end;

procedure TfrmCadNF.DBEdit126Exit(Sender: TObject);
begin
  inherited;
  CadNf.vItem.prepare_loop();
  Screen.Cursor := crHourGlass;
  try
    CadNf.validaDesconto('S');
  finally
    CadNf.vItem.prepare_loop_done();
    Screen.Cursor := crDefault;
  end;                              
end;

procedure TfrmCadNF.DBEdit127Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn66) then
    Exit;

  if CadNf.notaFechada then
    exit;

  if (CadNf.dataSet.FieldByName('num_nf_emt').AsInteger <> 0) and
    (Trim(CadNf.dataSet.FieldByName('serie_emt').AsString) <> '') then
    if not CadNf.existeNotaFiscalDeDemonstracao then
      Application.MessageBox('Nota fiscal informada não encontrada', 'Atenção', 0 + 64);
end;

procedure TfrmCadNF.DBEdit12Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    exit;
                                 
  Screen.Cursor := crHourGlass;
  try
    if DBEdit12.Text <> '' then
      if not CadNf.exitCodigoTabela('TRANSPORTADOR') then
        if not setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro) then
        	if (Self.Enabled) and (Self.Visible) and (DBEdit12.CanFocus) then
          	DBEdit12.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.DBEdit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
    CadNf.teclaAtalho('TRANSPORTADOR', 'F3')
  else if key = VK_F4 then
    CadNf.teclaAtalho('TRANSPORTADOR', 'F4');
end;

procedure TfrmCadNF.DBEdit172Enter(Sender: TObject);
begin
  inherited;
  Label312.Visible := true;
end;

procedure TfrmCadNF.DBEdit172Exit(Sender: TObject);
begin
  inherited;
  Label312.Visible := False;
end;

procedure TfrmCadNF.DBEdit194Exit(Sender: TObject);
begin
  inherited;
  if ActiveControl = btCancelarC115 then
    Exit;

  if not CadNf.vSped.vC110.vC115.existeUF('C') then
  	if (Self.Enabled) and (Self.Visible) and (DBEdit194.CanFocus) then
    	DBEdit194.SetFocus;
end;

procedure TfrmCadNF.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    CadNf.vItem.dataSet.DisableControls;

    if (ActiveControl = BitBtn5) or
       (ActiveControl = BitBtn6)  or
       (ActiveControl = BitBtn92) then
      Exit;
    if (not CadNf.exitCodigoTabela('CLIENTES')) then//and (ActiveControl = DBEdit1) then
    begin
      if not setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro) then
        if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
          DBEdit1.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBEdit107.CanFocus) then
          DBEdit107.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBEdit211.CanFocus) then
          DBEdit211.SetFocus;
    end
    else
    begin
      nota_event_change_emissao_propria;
      lkIdDest.Enabled := (CadNf.f_str('dest_uf') <> vDadosIni.vEmp.vSiglaUF) or CadNf.fequals('cpfcgc', vDadosIni.vEmp.vCNPJ);
      lkIdDestMais.Enabled := lkIdDest.Enabled;
    end;
  finally
    CadNf.vItem.dataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
    CadNf.teclaAtalho('CLIENTES', 'F3')
  else if not (ssAlt in Shift) and (key = VK_F4) then
    CadNf.teclaAtalho('CLIENTES', 'F4');
end;

procedure TfrmCadNF.DBEdit202Exit(Sender: TObject);
begin
  inherited;
  if ActiveControl = btCancelarC115 then
    Exit;

  if not CadNf.vSped.vC110.vC115.existeUF('E') then
  	if (Self.Enabled) and (Self.Visible) and (DBEdit202.CanFocus) then
    	DBEdit202.SetFocus;
end;

procedure TfrmCadNF.DBEdit204Exit(Sender: TObject);
begin
  inherited;
  if CadNf.vItem.dataSet.State in [dsinsert, dsEdit] then
    CadNf.vItem.dataSet.fieldbyname('valor_icm').AsFloat := vDadosIni.StrToFloatFormat(
      CadNf.vItem.dataSet.fieldbyname('aliq_icm').AsFloat * CadNf.vItem.dataSet.fieldbyname('base_icm').AsFloat / 100,2);
end;

procedure TfrmCadNF.DBEdit258Exit(Sender: TObject);
begin
  inherited;
  if CadNf.vItem.vDetVeic.dataSet.FieldByName('VERSAO').AsInteger > 0 then
    if not CadNf.vItem.vDetVeic.vModV.buscarModelo(CadNf.vItem.vDetVeic.dataSet.FieldByName('VERSAO').AsInteger) then
    begin
     Application.MessageBox('Versão do Veículo não encontrado!', 'Atenção', 0 + 64);
     if (Self.Enabled) and (Self.Visible) and (DBEdit258.CanFocus) then
       DBEdit258.SetFocus;
     exit;
    end
    else if CadNf.vItem.vDetVeic.dataSet.FieldByName('VERSAO').AsInteger > 0 then
      if trim(CadNf.vItem.vDetVeic.dataSet.FieldByName('TIPO_VENDA').AsString) = 'N' then
        if trim(CadNf.vItem.vDetVeic.vModV.dataSet.FieldByName('VNDESTOQUE').AsString) <> 'S' then
        begin
          Application.MessageBox('Versão do Veículo não configurada como Venda Estoque, favor verificar!', 'Atenção', 0 + 64);
          if (Self.Enabled) and (Self.Visible) and (DBEdit258.CanFocus) then
            DBEdit258.SetFocus;
          exit;
        end;
end;

procedure TfrmCadNF.DBEdit259KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if DBEdit259.DataSource.DataSet.State in [dsInsert, dsEdit] then
    if Key = VK_F3 then
    begin
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SPED_PROC_REF_ACAO_JUDICIAL');
      if Trim(vDadosIni.vPesquisa) <> '' then
        DBEdit259.DataSource.DataSet.FieldByName(DBEdit259.DataField).AsString := Trim(vDadosIni.vPesquisa);
    end;
end;

procedure TfrmCadNF.DBEdit260KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if DBEdit260.DataSource.DataSet.State in [dsInsert, dsEdit] then
    if Key = VK_F3 then
    begin
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SPED_PROC_REF_ADMINISTRATIVO');
      if Trim(vDadosIni.vPesquisa) <> '' then
        DBEdit260.DataSource.DataSet.FieldByName(DBEdit260.DataField).AsString := Trim(vDadosIni.vPesquisa);
    end;
end;

procedure TfrmCadNF.DBEdit261Exit(Sender: TObject);
begin
  inherited;

  Label529.Visible := copy(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsString, 1, 1) = '3';
  Label530.Visible := copy(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsString, 1, 1) = '3';
  Label531.Visible := copy(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsString, 1, 1) = '3';
  Label532.Visible := copy(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsString, 1, 1) = '3';
  DBEdit265.Visible := copy(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsString, 1, 1) = '3';
  DBEdit272.Visible := copy(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsString, 1, 1) = '3';
  DBEdit273.Visible := copy(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsString, 1, 1) = '3';
  DBEdit274.Visible := copy(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsString, 1, 1) = '3';

end;

procedure TfrmCadNF.DBEdit277Exit(Sender: TObject);
begin
  inherited;
  if CadNf.campo_emissao_propria = 'N' then
    if not CadNf.validarChaveNFe(pchar(Trim(CadNf.dataSet.FieldByName('chave_nfe').AsString))) then
      raise Exception.Create('Chave da NF-e inválida. Verifique a chave informada');
end;

procedure TfrmCadNF.edtvalor_total2Enter(Sender: TObject);
begin
  inherited;
  CadNf.fValorNotaAntesAlterar := CadNf.dataSet.FieldByName('valor_total').AsFloat;
end;

procedure TfrmCadNF.edtvalor_total2Exit(Sender: TObject);
begin
  inherited;
  if edtvalor_total2.Tag <> 99 then
    Exit;

  edtvalor_total2.Tag := 0;
  edtvalor_total2.OnEnter := campoEnterPerform;

  if RoundTo(CadNf.fValorNotaAntesAlterar, -2) <> RoundTo(CadNf.dataSet.FieldByName('valor_total').AsFloat, -2) then
  begin
    CadNf.fValorNotaAlterado := True;
    vDadosIni.GravaAuditoria('NF0131', 'ALTERAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString +
      ' DE ' + Format('%0.2f', [CadNf.fValorNotaAntesAlterar]) +
      ' PARA ' + Format('%0.2f', [CadNf.dataSet.FieldByName('valor_total').AsFloat]) ,
      'NOTAFISCAL', CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas);
  end;
end;

procedure TfrmCadNF.edUndVndChange(Sender: TObject);
var
  undVendaAnt, undVendaNova: TUnidadeVenda_Model;
  vlPrincipal: Double;
  habEmb: Boolean;
begin
  inherited;

  if edUndVnd.Items.Count = 0 then
    Exit;

  if (edUndVnd.ItemIndex = -1) or (edUndVnd.Tag = -1) then
    Exit;

  undVendaAnt := (edUndVnd.Items.Objects[edUndVnd.Tag] as TUnidadeVenda_Model);
  undVendaNova := (edUndVnd.Items.Objects[edUndVnd.ItemIndex] as TUnidadeVenda_Model);

  if undVendaNova.fator = 0 then
  begin
    edUndVnd.Color := $00D1FBFC;
    lbUndVnd.Caption := undVendaNova.paridade;
//    Exit;
  end
  else if undVendaAnt.fator = 0 then
  begin
    eddQtde.AsValue := undVendaNova.CalculaPrincipal(eddQTDEMBREC.AsValue);
    eddValorUnitario.AsValue := eddValorTotal.AsValue / eddQtde.AsValue;
  end
  else
  begin

    vlPrincipal := eddValorTotal.AsValue * undVendaAnt.fator;

    edUndVnd.Color := clWindow;

    if eddQTDEMBREC.AsValue = 0 then
    begin
      if CadNf.fequals('natureza_nf', 'E') then
      begin
        eddQTDEMBREC.AsValue := eddQtde.AsValue;
        eddVLREMBNF.AsValue  := eddValorTotal.AsValue / eddQTDEMBREC.AsValue;
      end
      else
      // Se saida provavelmente é venda
      begin
        eddQTDEMBREC.AsValue := undVendaAnt.CalculaVenda(eddQtde.AsValue);
        eddVLREMBNF.AsValue  := undVendaAnt.CalculaVenda(eddValorUnitario.AsValue);//eddValorTotal.AsValue / eddQTDEMBREC.AsValue;
      end;
    end;

    eddValorTotal.AsValue := vlPrincipal / undVendaNova.fator;

    eddQtde.AsValue          := undVendaNova.CalculaPrincipal(eddQTDEMBREC.AsValue);
    eddVLREMBNF.AsValue      := eddValorTotal.AsValue / eddQTDEMBREC.AsValue;
    eddValorUnitario.AsValue := eddValorTotal.AsValue / eddQtde.AsValue;
  end;

  lbUndVnd.Caption := undVendaNova.paridade;
  edUndVnd.Tag := edUndVnd.ItemIndex;
                                   
  habEmb := undVendaNova.unid_princ <> undVendaNova.unid_vnd;

  eddQTDEMBREC.Enabled     := habEmb;
  eddVLREMBNF.Enabled      := habEmb;
  eddQtde.Enabled          := not habEmb;
  eddValorUnitario.Enabled := (not habEmb) and (not eddValorTotal.Enabled);

  if not habEmb then
  begin
    eddQTDEMBREC.AsValue := 0;
    eddVLREMBNF.AsValue  := 0;
    eddQTDEMBREC.Clear;
    eddVLREMBNF.Clear;
  end;

//  eddQTDEMB_oldExit(eddQTDEMB_old);
end;

procedure TfrmCadNF.edUndVndEnter(Sender: TObject);
begin
  inherited;
  edUndVnd.Tag := edUndVnd.ItemIndex;
end;

procedure TfrmCadNF.ed_altent_data_lancExit(Sender: TObject);
begin
  inherited;
  ed_altent_data_lanc.Enabled := false;
  vDadosIni.GravaAuditoria('NF0218', 'HABILITAR', 'NUM NF '+ CadNf.fstr('NUM_NF') + ' NOVA: ' + CadNf.fstr('DATA_LANC'),
    'NOTAFISCAL', CadNf.fstr('COD_NF'), CadNf.buscas);
end;

procedure TfrmCadNF.ed_cofins_qbcExit(Sender: TObject);
begin
  inherited;
  ed_pis_qbc.AsValue := ed_cofins_qbc.AsValue;
end;

procedure TfrmCadNF.ed_cofins_vbcExit(Sender: TObject);
begin
  inherited;
  ed_pis_vbc.AsValue := ed_cofins_vbc.AsValue;
end;

procedure TfrmCadNF.ed_col_cepExit(Sender: TObject);
begin
  inherited;
  if pageDadosNF.ActivePage = tsnf_Coleta then  
    CadNf.coleta.ConsultaCEP(False)
  else
    CadNf.entrega.ConsultaCEP(False);
end;

procedure TfrmCadNF.ed_col_cidadeExit(Sender: TObject);
begin
  inherited;
  if ed_col_pais.DataSource.DataSet.State in [dsEdit, dsInsert] then
    with ed_col_pais.DataSource.DataSet do
    begin
      FieldByName('xmun').AsString := FlkColCidade.dataSet.FieldByName('xmun').AsString;
      FieldByName('uf').AsString := FlkColCidade.dataSet.FieldByName('uf').AsString;
    end;
end;

procedure TfrmCadNF.ed_col_paisExit(Sender: TObject);
begin
  inherited;
  if ed_col_pais.DataSource.DataSet.State in [dsEdit, dsInsert] then
    with ed_col_pais.DataSource.DataSet do
      FieldByName('xpais').AsString := FlkColPais.dataSet.FieldByName('xpais').AsString;
end;

procedure TfrmCadNF.ed_entrada_retorno_pedvenda_continuarClick(Sender: TObject);
begin
  inherited;
  if lb_entrada_retorno_pedvenda_cst.Caption = 'CST' then
    if not CadNf.vItem.TestarCST(ed_entrada_retorno_pedvenda_cst.AsString) then
      Exit;

  if lb_entrada_retorno_pedvenda_cst.Caption = 'CSOSN' then
    if not CadNf.vItem.TestarCSOSN(ed_entrada_retorno_pedvenda_cst.AsString, '') then
      Exit;

  if not CadNf.vItem.cfopValido(ed_entrada_retorno_pedvenda_cfop.AsInteger, 'E') then
    Exit;  

  TForm(pn_entrada_retorno_pedvenda.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.ed_piscofins_cstChange(Sender: TObject);
var
  pisqtde: Boolean;
  pisaliq: Boolean;
begin
  inherited;
  Exit;
  pisqtde := (ed_piscofins_cst.Text = '03') and CadNf.fequals('natureza_nf', 'S');
  pisaliq := (MatchStr(ed_piscofins_cst.Text, ['01', '02', '49', '99']) and CadNf.fequals('natureza_nf', 'S')) or
             (MatchStr(Copy(ed_piscofins_cst.Text, 1, 1), ['5', '6', '9']) and CadNf.fequals('natureza_nf', 'E')) or
             (VarToInt(ed_piscofins_motivo_deson.KeyValue) > 0);
  ed_indSomaPISST.Enabled := ((ed_piscofins_cst.Text = '05') and CadNf.fequals('natureza_nf', 'S') or
                             (ed_piscofins_cst.Text = '05') and CadNf.fequals('natureza_nf', 'E'));
  ed_indSomaCOFINSST.Enabled := ed_indSomaPISST.Enabled;
  { no futuro que sabe
  pisqtde := (ed_piscofins_cst.Text = '03') and CadNf.fequals('natureza_nf', 'S') or
             (MatchStr(Copy(ed_piscofins_cst.Text, 1, 1), ['5', '6', '9']) and CadNf.fequals('natureza_nf', 'E'));
  pisaliq := (MatchStr(ed_piscofins_cst.Text, ['01', '02', '49', '99']) and CadNf.fequals('natureza_nf', 'S')) or
             (MatchStr(Copy(ed_piscofins_cst.Text, 1, 1), ['5', '6', '9']) and CadNf.fequals('natureza_nf', 'E'));
  }

  gb_pis_aliq.Enabled       := pisaliq;
  gb_pis_aliq.ParentFont    := pisaliq;
  gb_cofins_aliq.Enabled    := pisaliq;
  gb_cofins_aliq.ParentFont := pisaliq;
  gb_pis_qtde.Enabled       := pisqtde;
  gb_pis_qtde.ParentFont    := pisqtde;
  gb_cofins_qtde.Enabled    := pisqtde;
  gb_cofins_qtde.ParentFont := pisqtde;
  if not pisaliq then
  begin
    gb_pis_aliq.Font.Color    := clGray;
    gb_cofins_aliq.Font.Color := clGray;
  end;
  if not pisqtde then
  begin
    gb_pis_qtde.Font.Color    := clGray;
    gb_cofins_qtde.Font.Color := clGray;
  end;
end;

procedure TfrmCadNF.ed_pis_qbcExit(Sender: TObject);
begin
  inherited;
  ed_cofins_qbc.AsValue := ed_pis_qbc.AsValue;
end;

procedure TfrmCadNF.ed_pis_vbcExit(Sender: TObject);
begin
  inherited;
  ed_cofins_vbc.AsValue := ed_pis_vbc.AsValue;
end;

procedure TfrmCadNF.edtvalor_desc2Exit(Sender: TObject);
begin
  inherited;
  CadNf.vItem.prepare_loop();
  Screen.Cursor := crHourGlass;
  try

    if CadNf.validaDesconto('N') then
      CadNf.recalcularDadosDaNotaFiscal;

  finally
    CadNf.vItem.prepare_loop_done();
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.edtvalor_desp_pf2Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    exit;
  CadNf.vItem.prepare_loop();
  Screen.Cursor := crHourGlass;
  try

    CadNf.recalcularDadosDaNotaFiscal;
  finally
    CadNf.vItem.prepare_loop_done();
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.DBEdit39Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    exit;
  CadNf.calculaICMSCabecalho;
end;

procedure TfrmCadNF.DBEdit3Enter(Sender: TObject);
begin
  inherited;
  //NAO APAGAR, ESTA LIGADO A VARIOS COMPONENTES
  Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadNF.edChaveExit(Sender: TObject);
begin
  inherited;
  if CadNf.fequals('emissao_propria', 'N') then
  begin
    edmodelo_nf.Enabled    := CadNf.fempty('chave_nfe');

    if (not CadNf.fempty('chave_nfe')) and (CadNf.dataSet.State in [dsInsert, dsEdit]) then
      CadNf.fdata('modelo_nf').Put(CadNf.fdata('chave_nfe').SubString(20, 2));

    edChave.Enabled        := CadNf.fstrin('modelo_nf', ['55', '62', '66']);
    btConsultarNFe.Enabled := edChave.Enabled;
  end;
  edChave.ReadOnly         := CadNf.fequals('emissao_propria', 'S');
end;

procedure TfrmCadNF.DBEdit40Exit(Sender: TObject);
begin
  inherited;
  CadNf.vItem.dataSet.FieldByName('base_cofins').AsFloat := CadNf.vItem.ffloat('base_pis');
end;

procedure TfrmCadNF.DBEdit45Enter(Sender: TObject);
begin
  inherited;
  vData_Lanc := CadNf.dataSet.FieldByName('data_lanc').AsDateTime;
end;

procedure TfrmCadNF.DBEdit45Exit(Sender: TObject);
var
  vOK: Boolean;
  vDataTmp: TDate;
begin
  inherited;
  if CadNf.campo_natureza_nf <> 'E' then
    Exit;
    
  vOK := True;
  vDataTmp := vData_Lanc;
  if YearOf(vData_Lanc) > YearOf(CadNf.dataSet.FieldByName('data_lanc').AsDateTime) then
    vOK := False
  else if MonthOf(vData_Lanc) > MonthOf(CadNf.dataSet.FieldByName('data_lanc').AsDateTime) then
    vOK := False;

  if not vOK then
  begin
    Application.MessageBox('Data de lançamento informada não corresponde ao mês atual. Processo [NF0151]', 'Atenção', 0 + 64);
    if not vDadosIni.PesqPros('NF0151', 'ALTERAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString +
      ' DATA ANT ' + DateToStr(vData_Lanc) + ' NOVA DATA ' + DateToStr(CadNf.dataSet.FieldByName('data_lanc').AsDateTime),
      'NOTAFISCAL', CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
      if (Self.Enabled) and (Self.Visible) and (DBEdit45.CanFocus) then
      begin
      	DBEdit45.SetFocus;
        vData_Lanc := vDataTmp;
      end
      else if CadNf.dataSet.State in [dsInsert, dsEdit] then
        CadNf.dataSet.FieldByName('data_lanc').AsDateTime := vDataTmp;
  end;
end;

procedure TfrmCadNF.DBEdit49Exit(Sender: TObject);
begin
  inherited;
  CadNf.vItem.dataSet.FieldByName('cst_cofins').AsString := CadNf.vItem.fstr('cst_pis');
end;

procedure TfrmCadNF.edmodelo_nfExit(Sender: TObject);
begin
  inherited;
  tsChaveNFe.TabVisible := (CadNf.campo_modelo_nf = '55') and
                           (CadNf.campo_emissao_propria <> 'S');
  DBEdit305.Enabled := (vDadosIni.StrZero(CadNf.campo_modelo_nf, 3) = '001') or
                       (vDadosIni.StrZero(CadNf.campo_modelo_nf, 3) = '01A') or
                       (vDadosIni.StrZero(CadNf.campo_modelo_nf, 3) = '1-A') or
                       (CadNf.campo_modelo_nf = 'E') or
                       (CadNf.campo_modelo_nf = 'O');
  DBComboBox23.Enabled := not (CadNf.campo_modelo_nf = 'E');
end;

procedure TfrmCadNF.DBEdit52Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = btCancelarItemVeiculo) then
    Exit;
  if not CadNf.vItem.verificaChassiEntrada(CadNf) then
   if (Self.Enabled) and (Self.Visible) and (DBEdit52.CanFocus) then
     DBEdit52.SetFocus;
end;

procedure TfrmCadNF.DBEdit53KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vTemp: string;
begin
  inherited;
  if key = VK_F3 then
  begin
    vTemp := CadNf.getNCMSHouGenero(True);
    if (vTemp <> '') and (CadNf.vItem.dataSet.state in [dsEdit, dsInsert]) then
    begin
      CadNf.vItem.dataSet.FieldByName('ncm').AsString := vTemp;
      vTemp := CadNf.vItem.vNcm.getFirstCEST(Trim(CadNf.vItem.dataSet.FieldByName('ncm').AsString));
      if vTemp <> '' then
        CadNf.vItem.dataSet.FieldByName('cest').AsString := vTemp;
    end;
  end
  else if key = VK_F4 then
  begin
    vTemp := CadNf.getNCMSHouGenero(False);
    if (vTemp <> '') and (CadNf.vItem.dataSet.state in [dsEdit, dsInsert]) then
      CadNf.vItem.dataSet.FieldByName('ncm').AsString := vTemp;
  end;
end;

procedure TfrmCadNF.DBEdit83Exit(Sender: TObject);
begin
  inherited;
  if CadNf.vItem.dataSet.State in [dsinsert, dsEdit] then
    CadNf.vItem.fdata('valor_total').Put(CadNf.vItem.ffloat('valor_unitario') * CadNf.vItem.ffloat('quantidade'), -2);
end;

procedure TfrmCadNF.DBEdit84Exit(Sender: TObject);
begin
  inherited;
  if CadNf.vItem.dataSet.State in [dsinsert, dsEdit] then
    CadNf.vItem.fdata('valor_unitario').Put(CadNf.vItem.ffloat('valor_total') / CadNf.vItem.ffloat('quantidade'), -10);
end;

procedure TfrmCadNF.DBEdit94Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;
  CadNf.vItem.verificaDescontoNoItem;
end;

procedure TfrmCadNF.DBGrid11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  	if (Self.Enabled) and (Self.Visible) and (BitBtn28.CanFocus) then
    	BitBtn28.SetFocus;
end;

procedure TfrmCadNF.DBGrid13DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Trim(CadNf.vItem.dataSet.FieldByName('cod_prod').AsString) = '') and
    (Trim(CadNf.vItem.dataSet.FieldByName('tipo_item').AsString) = 'P') then
  begin
    DBGrid13.Canvas.Brush.Color := clRed; // define uma cor de fundo //$00FFD9B3
    DBGrid13.Canvas.Font.Color := clWhite; // define uma cor de fundo //$00FFD9B3
    DBGrid13.Canvas.FillRect(Rect); // pinta a célula
    DBGrid13.DefaultDrawDataCell(Rect, Column.Field, State); // pinta o texto padrão
  end
  else if (Trim(CadNf.vItem.dataSet.FieldByName('selg').AsString) = 'S') and
    (Trim(CadNf.vItem.dataSet.FieldByName('tipo_item').AsString) = 'P') and
    (Column.FieldName = 'DESCRICAO_ITEM') then
  begin
    DBGrid13.Canvas.Brush.Color := $00FFD9B3;
    DBGrid13.Canvas.Font.Color := clWindowText;
    DBGrid13.Canvas.FillRect(Rect);
    DBGrid13.DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if (Trim(CadNf.vItem.dataSet.FieldByName('sel').AsString) = 'S') and
    (Column.FieldName = 'NITEM') then
  begin                                                      
    DBGrid13.Canvas.Brush.Color := $00FFD9B3;
    DBGrid13.Canvas.Font.Color := clWindowText;
    DBGrid13.Canvas.FillRect(Rect);
    DBGrid13.DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if ((Column.FieldName = 'UVND') or (Column.FieldName = 'QVND') or (Column.FieldName = 'VVND'))
//    and (not CadNf.vItem.fempty('unidade_nf'))
//    and (CadNf.vItem.ffloat('qtdemb') = 0) then
    and (not CadNf.vItem.fempty('ucom'))                             // Existe Unidade no XML
    and (AnsiUpperCase(CadNf.vItem.fstr('referencia')) <> AnsiUpperCase(CadNf.vItem.fstr('ucom'))) // Unidades diferences
    and (CadNf.vItem.ffloat('qtdemb') = 0) then                      // Sem fator, precisa converter
  begin
    DBGrid13.Canvas.Brush.Color := $00C6C6FF;
    DBGrid13.Canvas.Font.Color := clWindowText;
    DBGrid13.Canvas.FillRect(Rect);
    DBGrid13.DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TfrmCadNF.DBGrid13Enter(Sender: TObject);
begin
  inherited;
  statusBar('', DBGrid13.Hint);
end;

procedure TfrmCadNF.DBGrid13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F8 then
    CadNf.vItem.marcaItemParaGrade
  else if Key = VK_F3 then
    CadNf.vItem.marcaItem(opmIndividual)
  else if Key = VK_F4 then
    CadNf.vItem.marcaItem(opmTodos);
end;

procedure TfrmCadNF.DBGrid1EditButtonClick(Sender: TObject);
begin
  memoGrid9999.Align := alClient;
  memoGrid9999.Visible := True;
  listGrid.Visible := False;

  inherited;
end;

procedure TfrmCadNF.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    SpeedButton1Click(SpeedButton1);
  end;
end;

procedure TfrmCadNF.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  CadNf.UltimoIndice := CadNf.dataSet.IndexName;
end;

procedure TfrmCadNF.DBGrid24KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) or (key = VK_TAB) then
    btOKDevolucaoNf.Click;
end;

procedure TfrmCadNF.DBGrid25KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    BitBtn85.Click
  else if Key = VK_ESCAPE then
    BitBtn86.Click;
end;

procedure TfrmCadNF.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    if (vDadosIni.vEmp.vUsarUmaVendaPorNF <> 'S') or (ckPVApenasComCupomFiscal.Checked) or (CadNf.fstr('natureza_nf') = 'E') then
      CadNf.vPedVNf.check_uncheck;
end;

procedure TfrmCadNF.dbgridDadosCartoesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    btDadosCartaoVoltar.Click;
end;

procedure TfrmCadNF.dbGridDetPagEntKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    BitBtn93.Click;
end;

procedure TfrmCadNF.DBGrid2DblClick(Sender: TObject);
begin
  inherited;
  if (vDadosIni.vEmp.vUsarUmaVendaPorNF <> 'S') or (ckPVApenasComCupomFiscal.Checked) or (CadNf.fstr('natureza_nf') = 'E') then
    CadNf.vPedVNf.check_uncheck;
end;

procedure TfrmCadNF.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if ((CadNf.vPedVNf.dataSet.FieldByName('num_nf').AsInteger > 0)
    and (CadNf.vPedVNf.dataSet.FieldByName('num_nf').AsInteger <>
    CadNf.dataSet.FieldByName('num_nf').AsInteger)) or
    (CadNf.vPedVNf.dataSet.FieldByName('num_nfeext').AsInteger > 0) then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := $00EAEAFF; // define uma cor de fundo //$00FFD9B3
    TDBGrid(Sender).Canvas.FillRect(Rect); // pinta a célula
    TDBGrid(Sender).DefaultDrawDataCell(Rect, Column.Field, State); // pinta o texto padrão
  end
  else if (CadNf.vPedVNf.dataSet.FieldByName('num_nf').AsInteger =
    CadNf.dataSet.FieldByName('num_nf').AsInteger) and
    (CadNf.dataSet.FieldByName('num_nf').AsInteger > 0) then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := $00FFD9B3; // define uma cor de fundo //$00FFD9B3
    TDBGrid(Sender).Canvas.FillRect(Rect); // pinta a célula
    TDBGrid(Sender).DefaultDrawDataCell(Rect, Column.Field, State); // pinta o texto padrão
  end
  else if ((TDBGrid(Sender).DataSource.DataSet.FieldByName('ncupom').AsInteger > 0) and (vDadosIni.strIn(Column.FieldName, ['NCUPOM', 'NSERIEECF'])))or
    ((Trim(TDBGrid(Sender).DataSource.DataSet.FieldByName('dados_nfce').AsString) <> '') and (Column.FieldName = 'DADOS_NFCE')) then
  begin
    TDBGrid(Sender).Canvas.Brush.Color := $00D2FFD2; // define uma cor de fundo //$00FFD9B3
    TDBGrid(Sender).Canvas.FillRect(Rect); // pinta a célula
    TDBGrid(Sender).DefaultDrawDataCell(Rect, Column.Field, State); // pinta o texto padrão
  end
  else
  if (TDBGrid(Sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(Sender).canvas.brush.color := clWindow;
      TDBGrid(Sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(Sender).canvas.brush.color := clHighlight;
      TDBGrid(Sender).canvas.Font.color := clWhite;
    end;
    TDBGrid(Sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

    TDBGrid(sender).Canvas.FillRect(Rect);
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(TDBGrid(sender).Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

end;

procedure TfrmCadNF.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    if (vDadosIni.vEmp.vUsarUmaVendaPorNF <> 'S') or (ckPVApenasComCupomFiscal.Checked) or (CadNf.fstr('natureza_nf') = 'E') then
      CadNf.vPedVNf.check_uncheck;
end;

procedure TfrmCadNF.DBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssShift in Shift then
    if (vDadosIni.vEmp.vUsarUmaVendaPorNF <> 'S') or (ckPVApenasComCupomFiscal.Checked) or (CadNf.fstr('natureza_nf') = 'E') then
      CadNf.vPedVNf.check_uncheck;
end;

procedure TfrmCadNF.DBGrid32DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (CadNf.vItem.dataSet.FieldByName('nitem_dev').AsInteger = 0) and
    (Column.FieldName = 'DESCRICAO_ITEM') then
  begin
    DBGrid32.Canvas.Brush.Color := clYellow; // define uma cor de fundo //$00FFD9B3
    DBGrid32.Canvas.FillRect(Rect); // pinta a célula
    DBGrid32.DefaultDrawDataCell(Rect, Column.Field, State); // pinta o texto padrão
  end;
end;

procedure TfrmCadNF.DBGrid34KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    SpeedButton48.Click
  else if (Key = VK_RETURN) or (key = VK_TAB) then
  	if (Self.Enabled) and (Self.Visible) and (BitBtn132.CanFocus) then
  		BitBtn132.SetFocus;
end;

procedure TfrmCadNF.DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (CadNf.vPedVNf.vItem.dataSet.FieldByName('n_nf').AsInteger > 0) and
    (CadNf.vPedVNf.vItem.dataSet.FieldByName('n_nf').AsInteger <>
    CadNf.dataSet.FieldByName('num_nf').AsInteger) then
  begin
    DBGrid3.Canvas.Brush.Color := $00EAEAFF; // define uma cor de fundo
    DBGrid3.Canvas.FillRect(Rect); // pinta a célula
    DBGrid3.DefaultDrawDataCell(Rect, Column.Field, State); // pinta o texto padrão
  end
  else
  begin
    CadNf.vItem.dataSet.First;
    while not CadNf.vItem.dataSet.Eof do
    begin
      if (CadNf.vItem.dataSet.FieldByName('nped').AsInteger =
        CadNf.vPedVNf.dataSet.FieldByName('nped').AsInteger) and
        (Trim(CadNf.vItem.dataSet.FieldByName('tipo_ped').AsString) =
        Trim(CadNf.vPedVNf.dataSet.FieldByName('tipo').AsString)) and
        (CadNf.vItem.dataSet.FieldByName('nitem_ped').AsInteger =
        CadNf.vPedVNf.vItem.dataSet.FieldByName('nitem').AsInteger) and
        (CadNf.vItem.dataSet.FieldByName('tipo_item').AsString =
        CadNf.vPedVNf.vItem.dataSet.FieldByName('tipo_item').AsString) then
      begin
        DBGrid3.Canvas.Brush.Color := $00FFD9B3; // define uma cor de fundo //$00FFD9B3
        DBGrid3.Canvas.FillRect(Rect); // pinta a célula
        DBGrid3.DefaultDrawDataCell(Rect, Column.Field, State); // pinta o texto padrão
        Break;
      end;
      CadNf.vItem.dataSet.Next;
    end;
  end;
end;

procedure TfrmCadNF.DBGrid43Exit(Sender: TObject);
begin
  inherited;
  EditHw4.AsValue := 0;
  EditHw5.AsValue := CadNf.vItemNFVFE.dataSet.FieldByName('valor_unitario').AsFloat;
  EditHw6.AsValue := CadNf.vItemNFVFE.dataSet.FieldByName('valor_total').AsFloat;
end;

procedure TfrmCadNF.DBGrid43KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_TAB) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBGrid44.CanFocus) then
      DBGrid44.SetFocus;
  end
  else if (Key = VK_RETURN) then
    if (Self.Enabled) and (Self.Visible) and (EditHw4.CanFocus) then
      EditHw4.SetFocus;
end;

procedure TfrmCadNF.DBGrid44Exit(Sender: TObject);
begin
  inherited;
  EditHw8.AsValue := CadNf.vItemNFVFE._dataTemp.FieldByName('quantidade').AsFloat;
  EditHw9.AsValue := CadNf.vItemNFVFE._dataTemp.FieldByName('valor_unitario').AsFloat;
  EditHw10.AsValue := CadNf.vItemNFVFE._dataTemp.FieldByName('valor_total').AsFloat;
end;

procedure TfrmCadNF.DBGrid44KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_TAB) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBGrid43.CanFocus) then
      DBGrid43.SetFocus;
  end
  else if (Key = VK_RETURN) then
  begin
    if (Self.Enabled) and (Self.Visible) and (EditHw8.CanFocus) then
      EditHw8.SetFocus;
  end;
end;

procedure TfrmCadNF.DBGrid46KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_ESCAPE then
    BitBtn154.Click;
end;

procedure TfrmCadNF.DBGrid47MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  inherited;
  Label558.Caption := IntToStr(Length(Trim(DBMemo16.Text)));
end;

procedure TfrmCadNF.DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (CadNf.vPedCNf.dataSet.FieldByName('num_ped').AsInteger =
    CadNf.dataSet.FieldByName('num_ped').AsInteger) then
  begin
    DBGrid2.Canvas.Brush.Color := $00FFD9B3; // define uma cor de fundo //$00FFD9B3
    DBGrid2.Canvas.FillRect(Rect); // pinta a célula
    DBGrid2.DefaultDrawDataCell(Rect, Column.Field, State); // pinta o texto padrão
  end;
end;

procedure TfrmCadNF.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if Key = VK_RETURN then
    BitBtn21.Click;
end;

procedure TfrmCadNF.DBGrid50Enter(Sender: TObject);
begin
  inherited;
  dsDevItens.DataSet := CadNf.buscas;
end;

procedure TfrmCadNF.DBGrid55DblClick(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (edvpag.CanFocus) then
  	edvpag.SetFocus;
end;

procedure TfrmCadNF.DBGrid55Exit(Sender: TObject);
begin
  inherited;
  lkBandeira.Enabled := (CadNf.pagNFe.formas.dataSet.FieldByName('nfce_tpag').AsInteger in [ 3, 4]);
  edcaut.Enabled := (CadNf.pagNFe.formas.dataSet.FieldByName('nfce_tpag').AsInteger in [ 3, 4]);
  ed_xpag.Enabled := (CadNf.pagNFe.formas.dataSet.FieldByName('nfce_tpag').AsInteger in [99]);
end;

procedure TfrmCadNF.DBGrid55KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
  	if (Self.Enabled) and (Self.Visible) and (edvpag.CanFocus) then
    	edvpag.SetFocus;
end;

procedure TfrmCadNF.gravaConfiguracoesFormRegistro;
begin
  if (not SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
    CheckBox3.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
  begin
  	_GravaConfiguracoesInteger(RadioGroup1.Name, RadioGroup1.ItemIndex);

    _GravaConfiguracoesInteger(RadioGroup2.Name, RadioGroup2.ItemIndex);

    _GravaConfiguracoesBoolean(ckProdServ.Name, ckProdServ.Checked);
    _GravaConfiguracoesBoolean(ckVeic.Name, ckVeic.Checked);
    _GravaConfiguracoesBoolean(ckOutras.Name, ckOutras.Checked);
    _GravaConfiguracoesBoolean(ckDespesas.Name, ckDespesas.Checked);
    _GravaConfiguracoesBoolean(ckServicos.Name, ckServicos.Checked);
  end;

	if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
    _GravaConfiguracoesString(ComboBox11.Name, ComboBox11.Text);
    _GravaConfiguracoesString(ComboBox12.Name, ComboBox12.Text);

    _GravaConfiguracoesString(MaskEdit7.Name, MaskEdit7.Text);
    _GravaConfiguracoesString(MaskEdit8.Name, MaskEdit8.Text);
    _GravaConfiguracoesString(MaskEdit9.Name, MaskEdit9.Text);
  end;
end;

procedure TfrmCadNF.gridBaixaItensPedidosCellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    CadNf.vBaixaPedidos.marcaDesmarcaItem(CadNf.vItem);
end;

procedure TfrmCadNF.gridBaixaItensPedidosDblClick(Sender: TObject);
begin
  inherited;
  CadNf.vBaixaPedidos.marcaDesmarcaItem(CadNf.vItem);
end;

procedure TfrmCadNF.gridBaixaItensPedidosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Field.DisplayWidth := 1;

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

procedure TfrmCadNF.gridBaixaItensPedidosKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    CadNf.vBaixaPedidos.marcaDesmarcaItem(CadNf.vItem);
end;

procedure TfrmCadNF.gridBaixaItensPedidosMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    CadNf.vBaixaPedidos.marcaDesmarcaItem(CadNf.vItem);
end;

procedure TfrmCadNF.gridItensButtonClick(Sender: TObject);
var
  I: Integer;
  formMemo: TForm;
begin
  if TDBGrid(Sender).SelectedField.FieldName = 'ICMS_RECOMPOSICAO' then
  begin
    if CadNf.dataSet.State in [dsEdit, dsInsert] then
      CadNf.vItem.calcucarReconposicaoDeICMS(CadNf);
    try
      formMemo := TForm.Create(Application);
      formMemo.Position := poScreenCenter;
      formMemo.Caption := 'Espelho do cálculo da Recomposição de ICMS do Item';
      pnMemo.Parent := formMemo;
      formMemo.AutoSize := True;
      formMemo.AutoScroll := False;
      formMemo.KeyPreview := True;
      formMemo.BorderIcons:=[biSystemMenu];

      listGrid.Clear;
      listGrid.Items.Text := CadNf.vItem.dataSet.FieldByName('espelho_calc_st').AsString;
      listGrid.Font.Name := 'Consolas';

      formMemo.ShowModal;

    finally
      pnMemo.Parent := tsMEmo;
      formMemo.Free;
      formMemo := nil;
    end;
  end;
end;

procedure TfrmCadNF.gridNFeInutCellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    CadNf.inut.checkUnCheckRow;
end;

procedure TfrmCadNF.gridNFeInutDblClick(Sender: TObject);
begin
  inherited;
  CadNf.inut.checkUnCheckRow;
end;

procedure TfrmCadNF.gridNFeInutKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    CadNf.inut.checkUnCheckRow();
end;

procedure TfrmCadNF.gridNFeInutMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    CadNf.inut.checkUnCheckRow;
end;

procedure TfrmCadNF.gridNFe_CellClick(Column: TColumn);
begin
  if Column.FieldName = 'SEL' then
    CadNf.checkUnCheckRow;
end;

procedure TfrmCadNF.gridNFe_DblClick(Sender: TObject);
begin
  CadNf.checkUnCheckRow;
end;

procedure TfrmCadNF.gridNFe_DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  vDadosIni.DBGridOnDrawColumnCell(Sender, Rect, DataCol, Column, State);
end;

procedure TfrmCadNF.gridNFe_KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    CadNf.checkUnCheckRow();
end;

procedure TfrmCadNF.gridNFe_MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Classes.ssCtrl in Shift then
    CadNf.checkUnCheckRow;
end;

procedure TfrmCadNF.DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  //  if (CadNf.vComFat.dataSet.FieldByName('num_nota_v').AsInteger > 0) then
  //  begin
  //    DBGrid6.Canvas.Brush.Color := clRed; // define uma cor de fundo //$00FFD9B3
  //    DBGrid6.Canvas.FillRect(Rect); // pinta a célula
  //    DBGrid6.DefaultDrawDataCell(Rect, Column.Field, State); // pinta o texto padrão
  //  end;
end;

procedure TfrmCadNF.DBGrid6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    BitBtn36.Click;//Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadNF.DBGrid7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
    if Key = VK_RETURN then
    BitBtn43.Click;
end;

procedure TfrmCadNF.DBGrid8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) or (Key = VK_TAB) then
  begin
    edQuantGradeCompra.AsValue := CadNf.vGrComp.QtdePendente;
    if (Self.Enabled) and (Self.Visible) and (edQuantGradeCompra.CanFocus) then
    	edQuantGradeCompra.SetFocus;
  end;
end;

procedure TfrmCadNF.DBGrid9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) or (Key = VK_TAB) then
    Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmCadNF.GroupBox84Enter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBGrid44.CanFocus) then
  	DBGrid44.SetFocus;
end;

procedure TfrmCadNF.DBGridManifestacaoColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  inherited;
	vDadosIni.salvarGridNoConfigColunasCadPadrao(
  	DBGridManifestacao,
    GridCfgManifestacao,
    cdsGridManifestacao,
    cdsColunasManifestacao,
    usuario,
    ListGridsAndDataSetsManifestacao,
    vDadosIni.transacaoCol);
end;

procedure TfrmCadNF.DBGridManifestacaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if Column.Field.Dataset.FieldbyName('NUM_NF').AsInteger > 0 then
    if (Column.FieldName = 'STATUS_NF') then
      if (trim(Column.Field.Dataset.FieldByName('STATUS_NF').AsString) = 'Fechada') then
      begin
        if (gdFocused in State) then
          TDBGrid(sender).Canvas.Font.Color := clWindowText
        else
          TDBGrid(sender).Canvas.Brush.Color := PanelStatusNFfechadaManifestacao.Color;
        TDBGrid(sender).Canvas.FillRect(Rect);
        TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
      end
      else if (trim(Column.Field.Dataset.FieldByName('STATUS_NF').AsString) <> '') then
      begin
        if (gdFocused in State) then
          TDBGrid(sender).Canvas.Font.Color := clWindowText
        else
          TDBGrid(sender).Canvas.Brush.Color := PanelStatusNFabertoManifestacao.Color;
        TDBGrid(sender).Canvas.FillRect(Rect);
        TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
      end
end;

procedure TfrmCadNF.DBLookupComboBox10Exit(Sender: TObject);
var
  AFaturas: RFaturas;
begin
  inherited;
  if DBLookupComboBox10.KeyValue <> null then
    if CadNf.Fatura.codControle <> Integer(DBLookupComboBox10.KeyValue) then
    begin
      AFaturas := CadNf.Fatura;
      AFaturas.codControle := Integer(DBLookupComboBox10.KeyValue);
      CadNf.Fatura := AFaturas;
      CadNf.gerarFaturas(False);
      getFaturas;
    end;
end;

procedure TfrmCadNF.DBLookupComboBox13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SPED_LANCAMENTO_FISCAL');
    if Trim(vDadosIni.vPesquisa) <> '' then
    begin
      CadNf.vSped.vC195_C197.vLancFiscal.abreLancamentosFiscais;
      if CadNf.vSped.vC195_C197.dataSet.State in [dsEdit, dsInsert] then
        CadNf.vSped.vC195_C197.dataSet.FieldByName('COD_OBS').AsString := vDadosIni.vPesquisa;
    end;
  end;
end;

procedure TfrmCadNF.DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = vk_f4 then
    CadNf.teclaAtalho('COND_PAG', 'F4');
end;

procedure TfrmCadNF.DBLookupComboBox4Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = btSalvarDetalhesVeiculo) or (ActiveControl = btCancelarDetalhesVeiculo) then
    Exit;
  CadNf.vItem.verificaModeloVeiculo(CadNf);

  if CadNf.vItem.vDetVeic.dataSet.FieldByName('VERSAO').AsInteger > 0 then
    if trim(CadNf.vItem.vDetVeic.dataSet.FieldByName('TIPO_VENDA').AsString) = 'N' then
      if trim(CadNf.vItem.vDetVeic.vModV.dataSet.FieldByName('VNDESTOQUE').AsString) <> 'S' then
      begin
        Application.MessageBox('Versão do Veículo não configurada para Venda Estoque= ''S'', favor configurar!', 'Atenção', 0 + 64);
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
          DBLookupComboBox4.SetFocus;
        exit;
      end;
end;

procedure TfrmCadNF.DBLookupComboBox5Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = btSalvarDetalhesVeiculo) or (ActiveControl = btCancelarDetalhesVeiculo) then
    Exit;
  CadNf.vItem.verificaTipoPintura;
end;

procedure TfrmCadNF.DBLookupComboBox6Exit(Sender: TObject);
begin
  inherited;
  CadNf.vItem.vDetEcf.verificaImpressoraCNIEE;
end;

procedure TfrmCadNF.DBMemo14KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //  if key <>#13 then
  //    Key := #0;
end;

procedure TfrmCadNF.DBMemo16Change(Sender: TObject);
begin
  inherited;
  Label558.Caption := IntToStr(Length(Trim(DBMemo16.Text)));
  if (Length(Trim(DBMemo16.Text)) < 15) or (Length(Trim(DBMemo16.Text)) > 1000) then
    Label558.Font.Color := clRed
  else
    Label558.Font.Color := clBlue;
end;

procedure TfrmCadNF.DBRadioGroup4Exit(Sender: TObject);
begin
  inherited;
  CadNf.existeNotaFiscalComplementar;
end;

procedure TfrmCadNF.DBText65DblClick(Sender: TObject);
begin
  inherited;
  vDadosIni.ShowAtencao('Codigo: ' + CadNf.dataSet.FieldByName('nfe_cstat').AsString + sLineBreak +
                        sLineBreak +
                        CadNf.dataSet.FieldByName('descricaoerro').AsString);
end;

procedure TfrmCadNF.DefinirquandoaentradaXMLforiguala1Click(Sender: TObject);
var
  undVenda, payload: TUnidadeVenda_Model;
  sUndVenda: TStrings;
  I: Integer;
begin
  inherited;
  CadNf.vItem.alterar;
  try

    sUndVenda := CadNf.vItem.GetUndVendaProd(False);

    if sUndVenda.IndexOf(CadNf.vItem.vrDadosItem.unidade_nf) >= 0 then
    begin
      undVenda := (sUndVenda.Objects[sUndVenda.IndexOf(CadNf.vItem.vrDadosItem.unidade_nf)] as TUnidadeVenda_Model);

      payload := TUnidadeVenda_Model.Create;
      try
        payload.CopyFrom(undVenda);
        payload.unid_pref := CadNf.vItem.vrDadosItem.ucom;

        if CadNf.helperConv.SetPreferencial(payload) then
        begin
          for I := 0 to sUndVenda.Count - 1 do
            if (sUndVenda.Objects[I] as TUnidadeVenda_Model).unid_pref = CadNf.vItem.vrDadosItem.ucom then
              (sUndVenda.Objects[I] as TUnidadeVenda_Model).unid_pref := '';
          undVenda.unid_pref := CadNf.vItem.vrDadosItem.ucom;
        end;

      finally
        payload.Free;
      end;
    end;

  finally
    CadNf.vItem.cancelar;
  end;
end;

procedure TfrmCadNF.DesselecionaTodos1Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.marcaItem(opmNenhum);
end;

procedure TfrmCadNF.DevolucaodeNotaFiscalTotal1Click(Sender: TObject);
begin
  inherited;

  if Sender = DevolucaodeNotaFiscalViafuncionalidadedecpias1 then
  begin
    Application.CreateForm(TfrmCadNFCopiador, frmCadNFCopiador);
    frmCadNFCopiador.Nota := CadNf;
    frmCadNFCopiador.HandleDevolucao;
    if frmCadNFCopiador.ShowModal = mrOk then
      habilitaCamposCadastroNotaFiscal;
  end
  else
  if CadNf.devolverNotaFiscal(Sender = DevolucaodeNotaFiscalTotal1) then
    habilitaCamposCadastroNotaFiscal;
end;

procedure TfrmCadNF.dsEventosDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  Label557.Visible := Trim(CadNf.vCC_e.dataSet.FieldByName('tipo_evento').AsString) = 'CCE';
  Memo4.Visible := Trim(CadNf.vCC_e.dataSet.FieldByName('tipo_evento').AsString) = 'CCE';

  if Trim(CadNf.vCC_e.dataSet.FieldByName('tipo_evento').AsString) = 'CCE' then
    Label552.Caption := 'Correção'
  else
    Label552.Caption := 'Justificativa';
end;

procedure TfrmCadNF.edClForC113Exit(Sender: TObject);
var
  vtemp: string;
begin
  inherited;
  vtemp := Trim(CadNf.vSped.vC110.vC113.getCliente(edClForC113.AsInteger));
  if vtemp <> '' then
    edNomeClForC113.Text := vtemp
  else
  begin
    edNomeClForC113.Text := '';
    edClForC113.AsValue := 0;
    Exit;
  end;
  edNaturezaC113Exit(Sender);
end;

procedure TfrmCadNF.edClForC113KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  codigo: string;
begin
  inherited;
  if Key = VK_F3 then
  begin
    codigo := vDadosIni.pesquisaRapida('CLIENTES');
    if codigo <> '' then
      edClForC113.Text := codigo;
  end;
end;

procedure TfrmCadNF.edClienteComandoExit(Sender: TObject);
begin
  inherited;
  edNomeClienteComando.Text := CadNf.retornaValor('SELECT NOME_CLIENTE AS VALOR FROM CLIENTES WHERE'
    +
    ' COD_CLIENTE = ' + edClienteComando.AsString + ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND ATIVO = 1');
  if (Trim(edNomeClienteComando.Text) = '') and (edClienteComando.AsInteger <> 0) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (edClienteComando.CanFocus) then
    	edClienteComando.SetFocus;
    Application.MessageBox('Cliente não encontrado', 'Atenção', 0 + 64);
  end;
end;

procedure TfrmCadNF.edClienteComandoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vtemp: string;
begin
  inherited;
  if Key = VK_F3 then
  begin
    vtemp := vDadosIni.pesquisaRapida('CLIENTES');
    if Trim(vtemp) <> '' then
      edClienteComando.AsValue := StrToInt(vtemp);
  end;
end;

procedure TfrmCadNF.edCNPJFabExit(Sender: TObject);
begin
  inherited;
  if Trim(edCNPJFab.Text) <> '' then
    if not CadNf.cgc(Trim(edCNPJFab.Text)) then
      vDadosIni.ShowErro('CNPJ informado inválido');
end;

procedure TfrmCadNF.edCodClForPedVendaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    edCodClForPedVenda.AsValue := CadNf.vClFor.pesquisaCliente(CadNf.campo_natureza_nf);
end;

procedure TfrmCadNF.eddCFOPExit(Sender: TObject);
begin
  inherited;
  tsMerc_Importacao.TabVisible := Copy(Trim(eddCFOP.AsString),1,1) = '3';
end;

procedure TfrmCadNF.eddCSOSNExit(Sender: TObject);
var
  vTemp: string;
begin
  inherited;
  if not CadNf.vItem.TestarCSOSN(eddCSOSN.Text, eddCST.Text, '') then
  begin
    if vDadosIni.ShowConfirmacao('Corrigir?') = IDYES then
      if (Self.Enabled) and (Self.Visible) and (eddCSOSN.CanFocus) then
        eddCSOSN.SetFocus;
  end
  else
  if vDadosIni.vEmp.vRegime = 'SIMPLES' then
  begin
    eddCST.Text := CadNf.getCSTPorCSOSN(eddCST.AsString, eddCSOSN.AsString);
//    if TComponent(Sender).Name = 'eddCSOSN' then
//    begin
//      vTemp := CadNf.getCSOSNPorCST(eddCST.AsString, eddCSOSN.AsString, True);
//      if vTemp <> '' then
//        eddCSOSN.Text := vTemp;
//    end;
  end;
end;

procedure TfrmCadNF.eddCSTExit(Sender: TObject);
begin
  inherited;
  if not CadNf.vItem.TestarCST(eddCST.Text) then
  begin
    if vDadosIni.ShowConfirmacao('Corrigir?') = IDYES then
      if eddCST.CanFocus then
      begin
      	if (Self.Enabled) and (Self.Visible) and (eddCST.CanFocus) then
        	eddCST.SetFocus;
        Exit;
      end;
  end
  else if vDadosIni.vEmp.vRegime = 'SIMPLES' then
    eddCSOSN.Text := CadNf.getCSOSNPorCST(eddCST.AsString, eddCSOSN.AsString, False);

  

//  eddCSOSNExit(eddCST);
  
  //gb_item_icms_desoneracao.Top     := gb_item_icms_st.Top - 1;
  //gb_item_icms_diferido.Top        := gb_item_icms_st.Top - 1;
//  if (not gb_item_icms_desoneracao.Enabled) and ((VarToInt(lkDesoneracao.KeyValue) > 0) or (eddvicmdeson.AsValue > 0)) then
//    if ShowConfirmacao('O CST de ICMS selecionando não possui campos para desoneração do ICMS' +
//                       ' e os campos estão preenchidos. ' + sLineBreak + sLineBreak +
//                       ' Motivo: %s' + sLineBreak +
//                       ' Valor: %n' + sLineBreak + sLineBreak +
//                       'Se prosseguir esses valores serão zerados. Continuar?',
//                       [lkDesoneracao.Text, eddvicmdeson.AsValue]) = IDYES then
//    begin
//      lkDesoneracao.KeyValue := 0;
//      eddvicmdeson.AsValue := 0;
//    end;
end;

procedure TfrmCadNF.edcst_ipiExit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = btCancelarItemProdServDetalhado) or
     (ActiveControl = btCancelarItemOutrasNf) then
    exit;
  if not CadNf.vItem.TestarCSTIPI(copy(edcst_ipi.Text,1,2), CadNf.campo_natureza_nf) then
  	if (Self.Enabled) and (Self.Visible) and (edcst_ipi.CanFocus) then
    	edcst_ipi.SetFocus;
end;

procedure TfrmCadNF.eddDescricaoExit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> btCancelarItemProdServDetalhado) and
   (pos('TSMERC_', UpperCase(ActiveControl.Name)) = 0) then
    if (Self.Enabled) and (Self.Visible) and (eddMNF.CanFocus) then
      eddMNF.SetFocus;
end;

procedure TfrmCadNF.edIndTotChange(Sender: TObject);
begin
  inherited;
  if ((Sender as TEdit).Text = 'N') or ((Sender as TEdit).Text = 'S') then
  else
    (Sender as TEdit).Text := '';
end;

procedure TfrmCadNF.edInut_nnfiniExit(Sender: TObject);
begin
  inherited;
  if edInut_nnffin.AsInteger <= edInut_nnfini.AsInteger then
    edInut_nnffin.AsValue := edInut_nnfini.AsInteger; 
end;

procedure TfrmCadNF.eddNCMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vTemp: string;
begin
  inherited;
  if key = VK_UP then
    Perform(WM_NEXTDLGCTL, 1, 0)
  else if key = VK_F3 then
  begin
    vTemp := CadNf.getNCMSHouGenero(True);
    if vTemp <> '' then
      eddNCM.Text := vTemp;
  end
  else if key = VK_F4 then
  begin
    vTemp := CadNf.getNCMSHouGenero(False);
    if vTemp <> '' then
      eddNCM.Text := vTemp;
  end;
end;

procedure TfrmCadNF.eddNumFabEnter(Sender: TObject);
begin
  inherited;
  if eddTipo.Text = 'P' then
  begin
//    Panel39.Height := 55;
//    Panel38.Visible := True;
    tsMerc_ICMS.TabVisible := True;
    tsMerc_IPI.TabVisible := True;
    tsMerc_ISS.TabVisible := False;
  end
  else if eddTipo.Text = 'S' then
  begin
    tsMerc_ICMS.TabVisible := False;
    tsMerc_IPI.TabVisible := False;
    tsMerc_ISS.TabVisible := True;
  end
end;

procedure TfrmCadNF.eddNumFabExit(Sender: TObject);
begin
  inherited;
  try
    if (CadNf.vItem.vrDadosItem.tipo_item = 'P') and (Trim(CadNf.vItem.vrDadosItem.cod_prod) = '')  then
    else if (CadNf.vItem.vrDadosItem.stado = dsEdit) then
      exit;
    if (ActiveControl = btCancelarItemProdServDetalhado) or
      (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
      Exit;

    if (Trim(eddNumFab.Text) = Trim(cadNF.vItem.vrDadosItem.num_fab_prod)) and
      (Trim(eddNumFab.Text) <> '') then
      exit;

    if Trim(eddNumFab.Text) = '0' then
    begin
      btCancelarItemProdServDetalhadoClick(Sender);
      exit;
    end;

    if Trim(eddNumFab.Text) = '' then
    begin
      if eddTipo.Text = 'P' then
      begin
        if not CadNf.teclaAtalho('PRODUTOS', 'F3') then
        begin
        	if (Self.Enabled) and (Self.Visible) and (eddNumFab.CanFocus) then
          	eddNumFab.SetFocus;
          exit;
        end;
        if not CadNf.buscaItem(eddTipo.Text, vDadosIni.vPesquisa) then
        begin
        	if (Self.Enabled) and (Self.Visible) and (eddNumFab.CanFocus) then
          	eddNumFab.SetFocus;
        end
        else
        begin
          getCamposDetalhado;

          uvnd_fill_select;

          btEditGrade.Visible := CadNf.fequals('natureza_nf', 'S');// Sempre habilitado pois o alterar junta com cod_grade_prod CadNf.vItem.vrDadosItem.cod_grade > 0;
          if eddMNF.Text = 'S' then
            spEmbalagemMNF.Click;
//          if (Self.Enabled) and (Self.Visible) and (eddCST.CanFocus) then
//          	eddCST.SetFocus;
        end;
      end
      else if eddTipo.Text = 'S' then
      begin
        if not CadNf.teclaAtalho('TIPO_SERVICO', 'F3') then
        begin
        	if (Self.Enabled) and (Self.Visible) and (eddNumFab.CanFocus) then
          	eddNumFab.SetFocus;
          exit;
        end;
        if not CadNf.buscaItem(eddTipo.Text, vDadosIni.vPesquisa) then
        begin
        	if (Self.Enabled) and (Self.Visible) and (eddNumFab.CanFocus) then
          	eddNumFab.SetFocus;
        end
        else
        begin
          getCamposDetalhado;
          if eddMNF.Text = 'S' then
            spEmbalagemMNF.Click;
//				if (Self.Enabled) and (Self.Visible) and (eddCFOP.CanFocus) then
//          eddCFOP.SetFocus;
        end;
      end;
    end
    else if not vf3Produto then
    begin
      if eddTipo.Text = 'P' then
      begin
        if not CadNf.buscaItem(eddTipo.Text, eddNumFab.Text) then
        begin
        	if (Self.Enabled) and (Self.Visible) and (eddNumFab.CanFocus) then
          	eddNumFab.SetFocus;
        end
        else
        begin
          getCamposDetalhado;

          uvnd_fill_select;

          btEditGrade.Visible := CadNf.fequals('natureza_nf', 'S');// Sempre habilitado pois o alterar junta com cod_grade_prod CadNf.vItem.vrDadosItem.cod_grade > 0;
          if eddMNF.Text = 'S' then
            spEmbalagemMNF.Click;
//				if (Self.Enabled) and (Self.Visible) and (eddCST.CanFocus) then
//          eddCST.SetFocus;
        end;
      end
      else if eddTipo.Text = 'S' then
      begin
        if not CadNf.buscaItem(eddTipo.Text, eddNumFab.Text) then
        begin
        	if (Self.Enabled) and (Self.Visible) and (eddNumFab.CanFocus) then
          	eddNumFab.SetFocus;
        end
        else
        begin
          getCamposDetalhado;
          if eddMNF.Text = 'S' then
            spEmbalagemMNF.Click;
//          if (Self.Enabled) and (Self.Visible) and (eddCFOP.CanFocus) then
//          	eddCFOP.SetFocus;
        end;
      end;
    end;
    buildCadastroItensAlteracaoTributo;
  finally
    tsMerc_Combustiveis.TabVisible := ((Trim(CadNf.vItem.vrDadosItem.comb_cprodanp) <> '') or CadNf.fequals('tipo_nf', 'O')) and
      (Trim(vDadosIni.vEmp.vCombProduto) = 'S');
    vf3Produto := False;
  end;
end;

procedure TfrmCadNF.eddNumFabFornecedorExit(Sender: TObject);
begin
  inherited;
  if Trim(eddNumFabFornecedor.Text) <> '' then
  begin
    setCamposDetalhado;
    if vDadosIni.vEmp.vBuscaCodNoProduto = 'S' then
    begin
      if Trim(eddNumFab.Text) = '' then
        eddNumFab.Text := eddNumFabFornecedor.Text;
    end
    else //if Trim(eddNumFab.Text) = '' then
      eddNumFab.Text := CadNf.getCodigoPeloCodFornecedor(eddNumFabFornecedor.Text,True);
  end;
end;

procedure TfrmCadNF.eddNumFabKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F3 then
  begin
    if eddTipo.Text = 'P' then
    begin
      if CadNf.teclaAtalho('PRODUTOS', 'F3') then
      begin
        if CadNf.buscaItem(eddTipo.Text, vDadosIni.vPesquisa) then
        begin
          getCamposDetalhado;

          uvnd_fill_select;

          vf3Produto := True;
          if (Self.Enabled) and (Self.Visible) and (eddQtde.CanFocus) then
            eddQtde.SetFocus;
        end;
      end
    end
    else if eddTipo.Text = 'S' then
    begin
      if CadNf.teclaAtalho('TIPO_SERVICO', 'F3') then
      begin
        if CadNf.buscaItem(eddTipo.Text, vDadosIni.vPesquisa) then
        begin
          getCamposDetalhado;
          vf3Produto := True;
          if (Self.Enabled) and (Self.Visible) and (eddQtde.CanFocus) then
            eddQtde.SetFocus;
        end;
      end;
    end;
  end
  else if key = VK_F4 then
  begin
    if eddTipo.Text = 'P' then
    begin
      CadNf.teclaAtalho('PRODUTOS', 'F4');
      if Trim(vDadosIni.vPesquisa) <> '' then
        if CadNf.buscaItem(eddTipo.Text, vDadosIni.vPesquisa) then
        begin
          getCamposDetalhado;

          uvnd_fill_select;

          vf3Produto := True;
          if (Self.Enabled) and (Self.Visible) and (eddQtde.CanFocus) then
            eddQtde.SetFocus;
        end;
    end
    else if eddTipo.Text = 'S' then
    begin
      CadNf.teclaAtalho('TIPO_SERVICO', 'F4');
      if Trim(vDadosIni.vPesquisa) <> '' then
        if CadNf.buscaItem(eddTipo.Text, vDadosIni.vPesquisa) then
        begin
          getCamposDetalhado;
          vf3Produto := True;
          if (Self.Enabled) and (Self.Visible) and (eddQtde.CanFocus) then
            eddQtde.SetFocus;
        end;
    end;
  end
  else if key = VK_UP then
  begin
    if (Self.Enabled) and (Self.Visible) and (eddTipo.CanFocus) then
      eddTipo.SetFocus;
  end;
end;

procedure TfrmCadNF.eddPDESC_RExit(Sender: TObject);
begin
  inherited;
  if eddPDESC_R.AsValue > 0 then
    eddVLREMBNFR.AsValue := eddVLBRUREAL.AsValue - ((eddVLBRUREAL.AsValue * eddPDESC_R.AsValue) / 100)
  else
    eddVLREMBNFR.AsValue := eddVLBRUREAL.AsValue;
end;

procedure TfrmCadNF.ed_rateio_descontoDblClick(Sender: TObject);
var
  Astr: string;
  Adouble: Double;
begin
  inherited;
  if not InputQuery('Conceder desconto em percentual', 'Percentual de desconto', Astr) then
    Exit;
  if not TryStrToFloat(Astr, Adouble) then
  begin
    vDadosIni.ShowErro('Valor digitado inválido');
    Exit;
  end
  else if (Adouble < 0) or (Adouble > 100) then
  begin
    vDadosIni.ShowErro('Valor digitado inválido. Informe o valor entre 0 e 100');
    Exit;
  end;
  ed_rateio_desconto.AsValue := Adouble * eddValorTotal.AsValue / 100;
end;

procedure TfrmCadNF.ed_rateio_descontoExit(Sender: TObject);
begin
  inherited;
  if CadNf.vItem.vrDadosItem.stado = dsInsert then
  begin
    setCamposDetalhado;
    if not CadNf.calcularValorItemDesconto then
      if (Self.Enabled) and (Self.Visible) and (ed_rateio_desconto.CanFocus) then
        ed_rateio_desconto.SetFocus;
    getCamposDetalhado;
  end;
end;

procedure TfrmCadNF.ed_tipoCalcChange(Sender: TObject);
begin
  inherited;
  buildCadastroItensAlteracaoTributo;
end;

procedure TfrmCadNF.ed_tipoCalcExit(Sender: TObject);
begin
  inherited;
  ed_tipoCalc.Enabled := False;
end;

procedure TfrmCadNF.ed_tipoCalcPCExit(Sender: TObject);
begin
  inherited;
  ed_tipoCalcPC.Enabled := False;
end;

procedure TfrmCadNF.ed_tipoCalcRetExit(Sender: TObject);
begin
  inherited;
  ed_tipoCalcRet.Enabled := False;
end;

procedure TfrmCadNF.ed_vicmsmonoretExit(Sender: TObject);
var
  calc: Double;
begin
  inherited;
  if ed_adremicmsret.AsValue > 0 then
  begin
    calc := ed_qbcmonoret.AsValue / ed_adremicmsret.AsValue;
    lb_vicmsmono_un.Caption := Format('Vr un: %0.2n', [calc]);
  end
  else
    lb_vicmsmono_un.Caption := '';
end;

procedure TfrmCadNF.EspelhoclculoICMS1Click(Sender: TObject);
begin
  inherited;
  btEspelhoCalc.Click;
//  vDadosIni.abreForm( 'Espelho de Cálculo da Antecipação da ST', pnEspelhoCalcAntSt, [ofAlignAllClientWinCtrl, ofEscapeExit]);
  //
end;

procedure TfrmCadNF.EventAddEntitiesSelects(Sender, Entity: TObject;
  out Display: string; out SetSelected: Boolean);
begin
  SetSelected := False;
  if Sender = edPickerOpInterna then
  begin
    if Entity = nil then
      Display := ''
    else
    begin
      Display := OperacaoInternaEtd(Entity).Descricao;
      SetSelected := OperacaoInternaEtd(Entity).Id = CadNf.fstr('op_interna_id');
    end;
  end;
end;

procedure TfrmCadNF.EventChangeEntitiesSelects(Sender, Entity: TObject;
  out Info: string);
begin
  if Sender = edPickerOpInterna then
  begin
    if not (CadNf.dataSet.State in [dsInsert, dsEdit]) then
      Exit;                                                                               
    
    if Entity = nil then
      CadNf.dataSet.FieldByName('op_interna_id').Value := Null
    else
      CadNf.dataSet.FieldByName('op_interna_id').AsString := OperacaoInternaEtd(Entity).Id;
  end
end;

procedure TfrmCadNF.eddPrecoVendaAtacadoExit(Sender: TObject);
begin
  inherited;
  if eddPrecoVendaAtacado.AsValue < 0 then
  begin
    Application.MessageBox('Valor menor que zero!', 'Atenção', 0 + 64);
    if (Self.Enabled) and (Self.Visible) and (eddPrecoVendaAtacado.CanFocus) then
      eddPrecoVendaAtacado.SetFocus;
    Exit;
  end;
end;

procedure TfrmCadNF.eddPrecoVendaVarejoExit(Sender: TObject);
begin
  inherited;
  if eddPrecoVendaVarejo.AsValue < 0 then
  begin
    Application.MessageBox('Valor menor que zero!', 'Atenção', 0 + 64);
    if (Self.Enabled) and (Self.Visible) and (eddPrecoVendaVarejo.CanFocus) then
      eddPrecoVendaVarejo.SetFocus;
    Exit;
  end;
end;

procedure TfrmCadNF.eddQtdeExit(Sender: TObject);
begin
  inherited;
  if CadNf.vItem.vrDadosItem.stado in [dsInsert, dsEdit] then
  begin
    if CadNf.fequals('natureza_nf', 'S') and CadNf.fequals('tipo_emissao', '1') then
      eddQtde.AsValue := CadNf.helperConv.HandleUnidadeFracao(eddReferencia.Text, eddQtde.AsValue);

    if (eddValorUnitario.Enabled) and (eddValorUnitario.AsValue > 0) and (eddQtde.AsValue > 0) then
    begin
      eddValorTotal.AsValue    := RoundTo(eddValorUnitario.AsValue * eddQtde.AsValue, -2);
      eddValorUnitario.AsValue := eddValorTotal.AsValue / eddQtde.AsValue;
    end;
    handleChangeQtdeQBCMono(eddQtde.AsValue);
    //eddQTDEMB_oldExit(eddQtde);
//    setCamposDetalhado;
//    CadNf.calcularValorItemDesconto;
//    getCamposDetalhado;
  end;
end;

procedure TfrmCadNF.eddQTDEMBRECExit(Sender: TObject);
var
  undVenda: TUnidadeVenda_Model;
begin
  inherited;
  if (CadNf.vItem.vrDadosItem.stado in [dsInsert, dsEdit])
    and (eddQTDEMBREC.AsValue > 0) then
  begin
    undVenda := (edUndVnd.Items.Objects[edUndVnd.ItemIndex] as TUnidadeVenda_Model);

    if undVenda.fator = 0 then
      Exit;

    if CadNf.fequals('natureza_nf', 'S') and CadNf.fequals('tipo_emissao', '1') then
      eddQTDEMBREC.AsValue := CadNf.helperConv.HandleUnidadeFracao(undVenda.unid_vnd, eddQTDEMBREC.AsValue);

    eddValorTotal.AsValue := RoundTo(eddQTDEMBREC.AsValue * eddVLREMBNF.AsValue, -2);

    eddQtde.AsValue := undVenda.CalculaPrincipal(eddQTDEMBREC.AsValue);
    eddValorUnitario.AsValue := eddValorTotal.AsValue / eddQtde.AsValue;

    handleChangeQtdeQBCMono(eddQtde.AsValue);
    //eddQTDEMB_oldExit(eddQtde);
//    setCamposDetalhado;
//    CadNf.calcularValorItemDesconto;
//    getCamposDetalhado;
  end;
end;

procedure TfrmCadNF.eddQTDEMB_oldExit(Sender: TObject);
var
  undVenda: TUnidadeVenda_Model;
begin
  inherited;
  {
  if not eddUnidade_nf.Enabled then
  begin
    if (eddValorTotal.Enabled) and (eddValorTotal.AsValue > 0) and (eddQtde.AsValue > 0) then
      eddValorUnitario.AsValue := eddValorTotal.AsValue / eddQtde.AsValue
    else if (eddValorUnitario.Enabled) and (eddValorUnitario.AsValue > 0) and (eddQtde.AsValue > 0) then
    begin
      eddValorTotal.AsValue := vDadosIni.StrToFloatFormat(eddValorUnitario.AsValue * eddQtde.AsValue, 2);
      eddValorUnitario.AsValue := eddValorTotal.AsValue / eddQtde.AsValue;
    end;
  end
  else
  begin
    eddQtde.AsValue := eddQTDEMB.AsValue * eddQTDEMBREC.AsValue;
    handleChangeQtdeQBCMono(eddQtde.AsValue);
    if eddValorTotal.Enabled then
    begin
      eddValorUnitario.AsValue := 0;
      if eddQTDEMBREC.AsValue > 0 then
        eddVLREMBNF.AsValue := eddValorTotal.AsValue / eddQTDEMBREC.AsValue;
      if eddQtde.AsValue > 0 then
        eddValorUnitario.AsValue := eddValorTotal.AsValue / eddQtde.AsValue;
    end
    else
    begin
      eddValorUnitario.AsValue := 0;
      eddValorTotal.AsValue := eddVLREMBNF.AsValue * eddQTDEMBREC.AsValue;
      if eddQTDEMBREC.AsValue > 0 then
        eddVLREMBNF.AsValue := eddValorTotal.AsValue / eddQTDEMBREC.AsValue;
      if eddQtde.AsValue > 0 then
        eddValorUnitario.AsValue := eddValorTotal.AsValue / eddQtde.AsValue;
    end;
  end;
  }
  //if not eddUnidade_nf.Enabled then
  if not edUndVnd.Enabled then
  begin
    if (eddValorTotal.Enabled) and (eddValorTotal.AsValue > 0) and (eddQtde.AsValue > 0) then
      eddValorUnitario.AsValue := eddValorTotal.AsValue / eddQtde.AsValue
    else if (eddValorUnitario.Enabled) and (eddValorUnitario.AsValue > 0) and (eddQtde.AsValue > 0) then
    begin
      eddValorTotal.AsValue := vDadosIni.StrToFloatFormat(eddValorUnitario.AsValue * eddQtde.AsValue, 2);
      eddValorUnitario.AsValue := eddValorTotal.AsValue / eddQtde.AsValue;
    end;
  end
  else
  begin

    undVenda := (edUndVnd.Items.Objects[edUndVnd.ItemIndex] as TUnidadeVenda_Model);

    eddQtde.AsValue := undVenda.CalculaPrincipal(eddQTDEMBREC.AsValue);
    handleChangeQtdeQBCMono(eddQtde.AsValue);
    if eddValorTotal.Enabled then
    begin
      eddValorUnitario.AsValue := 0;
      if eddQTDEMBREC.AsValue > 0 then
        eddVLREMBNF.AsValue := eddValorTotal.AsValue / eddQTDEMBREC.AsValue;
      if eddQtde.AsValue > 0 then
        eddValorUnitario.AsValue := eddValorTotal.AsValue / eddQtde.AsValue;
    end
    else
    begin
      eddValorUnitario.AsValue := 0;
      eddValorTotal.AsValue := eddVLREMBNF.AsValue * eddQTDEMBREC.AsValue;
      if eddQTDEMBREC.AsValue > 0 then
        eddVLREMBNF.AsValue := eddValorTotal.AsValue / eddQTDEMBREC.AsValue;
      if eddQtde.AsValue > 0 then
        eddValorUnitario.AsValue := eddValorTotal.AsValue / eddQtde.AsValue;
    end;
  end;
end;

procedure TfrmCadNF.eddQTDEMB_oldKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  AValstr: string;
  AVal: Double;
begin
  inherited;
  if key = VK_UP then
    Perform(WM_NEXTDLGCTL, 1, 0)
  else if Key = VK_F3 then
  begin
    AValstr := '/1';
    if not InputQuery('Fator de conversão','Informe o valor. Ex: /30', AValstr) then
      Exit;

    if Copy(AValstr, 1, 1) = '/'  then
    begin
      eddQTDEMB_old.FormatSize := '0.10';
      AVal := 1 / StrToFloatDef( Copy(AValstr, 2, Length(AValstr))  , 1);
      if AVal > 0 then
        eddQTDEMB_old.AsValue := AVal;
    end;
  end;
end;

procedure TfrmCadNF.edDTipoChange(Sender: TObject);
begin
  inherited;
  if (eddTipo.Text = 'P') or (eddTipo.Text = 'S') then
  else
    eddTipo.Text := '';
end;

procedure TfrmCadNF.edDTipoExit(Sender: TObject);
begin
  inherited;
  if eddTipo.Text = 'P' then
  begin
    tsMerc_ICMS.TabVisible := True;
    tsMerc_IPI.TabVisible := True;
    tsMerc_ISS.TabVisible := False;
  end
  else if eddTipo.Text = 'S' then
  begin
    tsMerc_ICMS.TabVisible := False;
    tsMerc_IPI.TabVisible := False;
    tsMerc_ISS.TabVisible := True;
  end
  else
  begin
    if (eddTipo.Text = '') and (eddTipo.Enabled) then
    begin
      Application.MessageBox('Informe o Tipo de Item. "P: Produto" ou "S: Serviço"', 'Atenção', 0
        + 64);      
      if (Self.Enabled) and (Self.Visible) and (edDTipo.CanFocus) then
        eddTipo.SetFocus;
    end;
    if ActiveControl = eddNumFab then
    begin
      Application.MessageBox('Tipo de Item Inválido. Veja o Help os tipos corretos.', 'Atenção', 0
        + 64);
      if (Self.Enabled) and (Self.Visible) and (edDTipo.CanFocus) then
        eddTipo.SetFocus;
    end;
  end;
end;

procedure TfrmCadNF.eddValorTotalExit(Sender: TObject);
begin
  inherited;
  if (eddValorTotal.Enabled) and (eddValorTotal.AsValue > 0) then
  begin
    if (eddQtde.AsValue > 0) then
      eddValorUnitario.AsValue := eddValorTotal.AsValue / eddQtde.AsValue;

    if (eddQTDEMBREC.AsValue > 0) then
      eddVLREMBNF.AsValue := eddValorTotal.AsValue / eddQTDEMBREC.AsValue;
  end;
end;

procedure TfrmCadNF.eddValorUnitarioExit(Sender: TObject);
begin
  inherited;

  if (eddValorUnitario.Enabled) and (eddValorUnitario.AsValue > 0) and (eddQtde.AsValue > 0) then
  begin
    eddValorTotal.AsValue    := RoundTo(eddValorUnitario.AsValue * eddQtde.AsValue, -2);
    eddValorUnitario.AsValue := eddValorTotal.AsValue / eddQtde.AsValue;
  end;
end;

procedure TfrmCadNF.eddVLREMBNFExit(Sender: TObject);
begin
  inherited;
  if (eddVLREMBNF.Enabled) and (eddVLREMBNF.AsValue > 0) and (eddQTDEMBREC.AsValue > 0) then
  begin
    eddValorTotal.AsValue    := RoundTo(eddVLREMBNF.AsValue * eddQTDEMBREC.AsValue, -2);
    eddVLREMBNF.AsValue      := eddValorTotal.AsValue / eddQTDEMBREC.AsValue;
    eddValorUnitario.AsValue := eddValorTotal.AsValue / eddQtde.AsValue;
  end;
end;

procedure TfrmCadNF.eddVLREMBNFRExit(Sender: TObject);
begin
  inherited;
  if ActiveControl = btCancelarEmabalagem then
    Exit;
  if eddVLREMBNFR.AsValue = 0 then
  begin
    Application.MessageBox(pchar('Valor Real do Produto Deve Ser Informado' + chr(13) + 'Campo Obrigatório'),'Atenção',0+64);
    if (Self.Enabled) and (Self.Visible) and (eddVLBRUREAL.CanFocus) then
    	eddVLBRUREAL.SetFocus;
  end;
end;

procedure TfrmCadNF.edindEscalaExit(Sender: TObject);
begin
  inherited;
  if not vDadosIni.strIn(edindEscala.Text, ['', 'S', 'N']) then
    edindEscala.Text := '';
end;

procedure TfrmCadNF.edipi_cnpjprodExit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = btCancelarItemProdServDetalhado) or
     (ActiveControl = btCancelarItemOutrasNf) then
    exit;
  if Trim(edipi_cnpjprod.Text) <> '' then
    if not CadNf.cgc(Trim(edipi_cnpjprod.Text)) then
      vDadosIni.ShowErro('CNPJ informado inválido');
end;

procedure TfrmCadNF.Edit8Exit(Sender: TObject);
begin
  inherited;
  if Trim(Edit8.Text) <> '' then
    if not validaChaveNfe(PChar(OnlyNumber(Edit8.Text))) then
      if Application.MessageBox('Chave da NF-e inválida. Digitar Novamente', 'Atenção', MB_ICONQUESTION + MB_YESNO) = IDYES then
      begin
      	if (Self.Enabled) and (Self.Visible) and (Edit8.CanFocus) then
        	Edit8.SetFocus;
      end
      else
        Edit8.Clear;
end;

procedure TfrmCadNF.EditHw10Exit(Sender: TObject);
begin
  inherited;
  if (Edithw8.AsValue > 0) and (Edithw10.AsValue > 0) then
    Edithw9.AsValue := Edithw10.AsValue / Edithw8.AsValue;
  if (Self.Enabled) and (Self.Visible) and (EditHw8.CanFocus) then
    EditHw8.SetFocus;
end;

procedure TfrmCadNF.EditHw10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F12 then
    SpeedButton62.Click
  else if Key = VK_ESCAPE then
    if (Self.Enabled) and (Self.Visible) and (DBGrid44.CanFocus) then
      DBGrid44.SetFocus;
end;

procedure TfrmCadNF.EditHw4Exit(Sender: TObject);
begin
  inherited;
  Edithw6.AsValue := Edithw4.AsValue * Edithw5.AsValue; 
end;

procedure TfrmCadNF.EditHw6Exit(Sender: TObject);
begin
  inherited;
  if (Edithw4.AsValue > 0) and (Edithw6.AsValue > 0) then
    Edithw5.AsValue := Edithw6.AsValue / Edithw4.AsValue;
  if (Self.Enabled) and (Self.Visible) and (EditHw4.CanFocus) then
    EditHw4.SetFocus;
end;

procedure TfrmCadNF.EditHw6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F12 then
    SpeedButton61.Click
  else if Key = VK_ESCAPE then
    if (Self.Enabled) and (Self.Visible) and (DBGrid43.CanFocus) then
      DBGrid43.SetFocus;
end;

procedure TfrmCadNF.EditHw8Exit(Sender: TObject);
begin
  inherited;
  Edithw10.AsValue := Edithw8.AsValue * Edithw9.AsValue;
end;

procedure TfrmCadNF.edCodClForPedCompraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    edCodClForPedVenda.AsValue := CadNf.vClFor.pesquisaCliente(CadNf.campo_natureza_nf);
end;

procedure TfrmCadNF.edNumSerieEcfEnter(Sender: TObject);
begin
  inherited;
  Label283.Enabled := CadNf.vItem.dataSet.FieldByName('ecf').AsString = 'E';
  DBLookupComboBox6.Enabled := Label283.Enabled;
  Label287.Enabled := Label283.Enabled;
  DBEdit156.Enabled := Label283.Enabled;
  Label288.Enabled := Label283.Enabled;
  DBEdit157.Enabled := Label283.Enabled;
  Label289.Enabled := Label283.Enabled;
  DBEdit158.Enabled := Label283.Enabled;
  Label290.Enabled := Label283.Enabled;
  DBEdit159.Enabled := Label283.Enabled;
  Label291.Enabled := Label283.Enabled;
  DBEdit160.Enabled := Label283.Enabled;
  Label292.Enabled := Label283.Enabled;
  DBEdit161.Enabled := Label283.Enabled;
  if Label283.Enabled then
    Label284.Caption := 'Tipo de ECF'
  else
    Label284.Caption := 'Tipo de Equipamento';
end;

procedure TfrmCadNF.edNumSerieEcfExit(Sender: TObject);
begin
  inherited;
  if ActiveControl <> btCancelarDetalhesECF then
    if CadNf.existeECF(Trim(edNumSerieEcf.Text)) then
    begin
    	if (Self.Enabled) and (Self.Visible) and (edNumSerieEcf.CanFocus) then
      	edNumSerieEcf.SetFocus;
    end
    else
    begin
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
        DBLookupComboBox6.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit154.CanFocus) then
        DBEdit154.SetFocus;
      edNumSerieEcf.Enabled := False;
    end;
end;

procedure TfrmCadNF.edMarkUpVExit(Sender: TObject);
var
  vTmp: string;
begin
  inherited;

  vTmp := TEditHw(Sender).Name;
  CadNf.vItem.calculaPreco(
    Copy(vTmp, length(vTmp), 1),
    Copy(vTmp, 3, 1), TEditHw(Sender).AsValue);
  getCamposMargem;
end;

procedure TfrmCadNF.edMudCSOSNExit(Sender: TObject);
begin
  inherited;
  if not CadNf.vItem.TestarCSOSN(edMudCSOSN.Text, '') then
  begin
    if vDadosIni.ShowConfirmacao('Corrigir?') = IDYES then
      if (Self.Enabled) and (Self.Visible) and (edMudCSOSN.CanFocus) then
        edMudCSOSN.SetFocus;
  end
  else
  if vDadosIni.vEmp.vRegime = 'SIMPLES' then
    edMudCST.Text := Copy(CadNf.getCSTPorCSOSN(edMudOrigCST.AsString + edMudCST.AsString, edMudCSOSN.AsString), 2, 2);
end;

procedure TfrmCadNF.edMudCSTExit(Sender: TObject);
begin
  inherited;
  if not CadNf.vItem.TestarCST(edMudOrigCST.AsString + edMudCST.Text) then
  begin
    if vDadosIni.ShowConfirmacao('Corrigir?') = IDYES then
      if (Self.Enabled) and (Self.Visible) and (edMudCST.CanFocus) then
        edMudCST.SetFocus;
  end
  else if vDadosIni.vEmp.vRegime = 'SIMPLES' then
    edMudCSOSN.Text := CadNf.getCSOSNPorCST(edMudOrigCST.AsString + edMudCST.AsString, edMudCSOSN.AsString, False);
end;

procedure TfrmCadNF.eddMNFChange(Sender: TObject);
begin
  inherited;
  if (eddmnf.Text = 'S') or (eddmnf.Text = 'N') then
  else
    eddmnf.Text := 'N';
end;

procedure TfrmCadNF.eddMNFExit(Sender: TObject);
begin
  inherited;
  if (eddMNF.Text = 'S') then
  begin
    eddVLBRUREAL.enabled := true;
    eddPDESC_R.enabled := true;
    eddVLREMBNFR.enabled := true;
  end
  else
  begin
    eddVLBRUREAL.enabled := false;
    eddPDESC_R.enabled := false;
    eddVLREMBNFR.enabled := false;
  end;
  if ActiveControl <> btCancelarItemProdServDetalhado then
    spEmbalagemMNF.Click;
end;

procedure TfrmCadNF.edNaturezaC113Exit(Sender: TObject);
begin
  inherited;
  if ActiveControl = btCancelarC113 then
    Exit;
  CadNf.vSped.vC110.vC113.existeNotaFiscal(UpperCase(edNaturezaC113.Text),
    UpperCase(edSerieC113.Text), edNumNFC113.AsInteger, edClForC113.AsInteger);
end;

procedure TfrmCadNF.edOnCFOPExit(Sender: TObject);
begin
  inherited;
  tsOut_Importacao.TabVisible := Copy(Trim(edOnCFOP.AsString),1,1) = '3';
end;

procedure TfrmCadNF.edOnCSOSNExit(Sender: TObject);
var
  vTemp: string;
begin
  inherited;
  if vDadosIni.vEmp.vRegime = 'SIMPLES' then
  begin
    edOnCST.Text := CadNf.getCSTPorCSOSN(edOnCST.AsString, edOnCSOSN.AsString);
    if TComponent(Sender).Name = 'edOnCSOSN' then
    begin
      vTemp := CadNf.getCSOSNPorCST(edOnCST.AsString, edOnCSOSN.AsString, True);
      if vTemp <> '' then
        edOnCSOSN.Text := vTemp;
    end;
  end;
end;

procedure TfrmCadNF.edOnCSTExit(Sender: TObject);
begin
  inherited;
  if vDadosIni.vEmp.vRegime = 'SIMPLES' then
    edOnCSOSN.Text := CadNf.getCSOSNPorCST(edOnCST.AsString, edOnCSOSN.AsString, False);
  edOnCSOSNExit(edOnCST);
end;

procedure TfrmCadNF.edOnDescricaoOutrasEnter(Sender: TObject);
begin
  inherited;
  edOnDescricaoOutras.Height := 75;
  //  edOnDescricaoOutras.ScrollBars := ssBoth;
end;

procedure TfrmCadNF.edOnDescricaoOutrasExit(Sender: TObject);
begin
  inherited;
  edOnDescricaoOutras.Height := 21;
  //  edOnDescricaoOutras.ScrollBars := ssNone;
end;

procedure TfrmCadNF.edo_rateio_descontoDblClick(Sender: TObject);
var
  Astr: string;
  Adouble: Double;
begin
  inherited;
  if not InputQuery('Conceder desconto em percentual', 'Percentual de desconto', Astr) then
    Exit;
  if not TryStrToFloat(Astr, Adouble) then
  begin
    vDadosIni.ShowErro('Valor digitado inválido');
    Exit;
  end
  else if (Adouble < 0) or (Adouble > 100) then
  begin
    vDadosIni.ShowErro('Valor digitado inválido. Informe o valor entre 0 e 100');
    Exit;
  end;
  edo_rateio_desconto.AsValue := Adouble * edo_valor_total.AsValue / 100;
end;

procedure TfrmCadNF.edo_rateio_descontoExit(Sender: TObject);
begin
  inherited;
  if CadNf.vItem.vrDadosItem.stado = dsInsert then
  begin
//    setCamposOutrasNf;
    setCamposDetalhado;
    if not CadNf.calcularValorItemDesconto then
      if (Self.Enabled) and (Self.Visible) and (edo_rateio_desconto.CanFocus) then
        edo_rateio_desconto.SetFocus;
    getCamposDetalhado;
//    getCamposOutrasNF;
  end;
end;

procedure TfrmCadNF.edOnQtdeExit(Sender: TObject);
begin
  inherited;
  if CadNf.vItem.vrDadosItem.stado in [dsInsert, dsEdit] then
  begin
//    setCamposOutrasNf;
    handleChangeQtdeQBCMono(eddQtde.AsValue);
    setCamposDetalhado;
    CadNf.calcularValorItemDesconto;
    getCamposDetalhado;
//    getCamposOutrasNF;
  end;
end;

procedure TfrmCadNF.edOnQtdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_UP then
    Perform(WM_NEXTDLGCTL, 1, 0)
end;

procedure TfrmCadNF.edPreco30Exit(Sender: TObject);
var
  vTemp: Double;
begin
  inherited;
  vTemp := CadNf.vItem.calculaPrecoAVistaPeloPrazo(edPreco30.AsValue);
  if vTemp > 0 then
    edPrecoV.AsValue := vTemp;

end;

procedure TfrmCadNF.edSerieComplExit(Sender: TObject);
begin
  inherited;
  BitBtn56.Enabled := CadNf.existeNotaFiscalComplementar(edNumNfCompl.AsInteger, edSerieCompl.Text);
end;

procedure TfrmCadNF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  gravaConfiguracoesFormRegistro;
  
  if enterTela2 <> nil then
    FreeAndNil(enterTela2);
  if Assigned(FlkformaEmiss) then
    FreeAndNil(FlkformaEmiss);
  if Assigned(Flkambiente) then
    FreeAndNil(Flkambiente);
  if Assigned(Flkindpag) then
    FreeAndNil(Flkindpag);
  if Assigned(FlkindIEDest) then
    FreeAndNil(FlkindIEDest);
  if Assigned(FpopMenuNFe) then
    FreeAndNil(FpopMenuNFe);
  if Assigned(FpopMenuOut) then
    FreeAndNil(FpopMenuOut);
  if Assigned(FpopMenuUnd) then
    FreeAndNil(FpopMenuUnd);
  if Assigned(FlkColCidade) then
    FreeAndNil(FlkColCidade);
  if Assigned(FlkColPais) then
    FreeAndNil(FlkColPais);
  if Assigned(FlkMotivoDesoneracao) then
    FreeAndNil(FlkMotivoDesoneracao);
  if Assigned(FlkFinalClFor) then
    FreeAndNil(FlkFinalClFor);
  if Assigned(lkIntermed) then
    FreeAndNil(lkIntermed);
  if Assigned(lkConfSuframa) then
    FreeAndNil(lkConfSuframa);
  if Assigned(lkRetFed) then
    FreeAndNil(lkRetFed);
  if Assigned(lkTipoGuiaTransito) then
    FreeAndNil(lkTipoGuiaTransito);
  if Assigned(FlkFormatoDANFe) then
    FreeAndNil(FlkFormatoDANFe);
  CadNf.changesF.disableAll;
  CadNf.Free;
  CadNf := nil;
  Action := caFree;
  frmCadNF := nil;
end;

procedure TfrmCadNF.FormCreate(Sender: TObject);
begin
  inherited;
  if UpperCase(vDadosIni.vNomeForm) <> UpperCase(Self.Name)  then
    FormStyle := fsMDIChild
  else if vDadosIni.vModalOuChild = 'M' then
    else
      FormStyle := fsMDIChild;
  CadNf := TNFCab.create;

  statusBar('', '');
  lbDadosCertificado.OnDblClick := nf_outras_options_dados_certificado;
  lbDadosCertificado.Caption := '';
  if Assigned(CadNf) then
    lbDadosCertificado.Caption := CadNf.GetDadosCertificadoAtualizado.Values['Vencendo'];
  lbDadosCertificado.Visible := lbDadosCertificado.Caption <> '';

  vCriou := 0;
  vDadosIni.vModalOuChild := 'C';
  habilitaCamposCadastroNotaFiscalOnShow := False;

  pnNotaFiscal.Parent     := tsNotaFiscal;

  // ALTERACOES DEFINITIVAS

  groupItensNota.Parent := tsnf_ResumoNota;
  groupTotais.Parent := tsnf_ResumoNota;
  lbDadosCertificado.Parent := ScrollBox1;
  pnNotaFiscal.Parent     := ScrollBox1;
  PageControl3.Visible := False;
  pnNotaFiscal.BevelKind := bkNone;
  pnNotaFiscal.BorderWidth := 0;
  pnNotaFiscal.Align := alClient;

end;

procedure TfrmCadNF.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  ANat: string;
begin
  inherited;
  if ActiveControl = DBRadioGroup7 then
  begin
    if Key = VK_RETURN then
      Perform(WM_NEXTDLGCTL, 0, 0);
  end
  else if PageControl1.ActivePage = TabSheet2 then
  begin
    if (key = VK_F8) or (key = VK_F9) then
    begin
      GroupBox4.Visible := CheckBox3.Checked;
      GroupBox5.Visible := CheckBox1.Checked;
    end;
  end
  else if PageControl1.ActivePage = TabSheet1 then
  begin
    if PageControl3.ActivePage = tsNotaFiscal then
    begin
      if (Key = VK_F2) and (ckVerificarMudCFOP.Enabled) and (ckVerificarMudCFOP.Visible) then
      begin

        if CadNf.Config.Conf_Geral.nf_mudanca_cfop_com_opcoes then
        begin
          ANat := CadNf.campo_natureza_nf;

          ckMudSelecionados.Checked := _LerConfiguracoesRegistroBoolean(ckMudSelecionados.Name + ANat);
          ckMudCFOP.Checked         := _LerConfiguracoesRegistroBoolean(ckMudCFOP.Name + ANat);
          ckMudOrigem.Checked       := _LerConfiguracoesRegistroBoolean(ckMudOrigem.Name + ANat);
          ckMudCST.Checked          := _LerConfiguracoesRegistroBoolean(ckMudCST.Name + ANat);
          ckMudAliqICMS.Checked     := _LerConfiguracoesRegistroBoolean(ckMudAliqICMS.Name + ANat);
          edMudCFOP.AsValue         := _LerConfiguracoesRegistroInteger(edMudCFOP.Name + ANat);
          edMudOrigCST.AsValue      := _LerConfiguracoesRegistroInteger(edMudOrigCST.Name + ANat);
          edMudCST.AsValue          := _LerConfiguracoesRegistroInteger(edMudCST.Name + ANat);
          edMudCSOSN.AsValue        := _LerConfiguracoesRegistroInteger(edMudCSOSN.Name + ANat);
          edMudAliqICMS.AsValue     := _LerConfiguracoesRegistroDouble(edMudAliqICMS.Name + ANat);

          edMudCSOSN.Enabled := vDadosIni.vEmp.vRegime = 'SIMPLES';//ANat = 'S';

          if edMudCFOP.AsInteger = 0 then
            edMudCFOP.AsValue := Trunc(CadNf.dataSet.FieldByName('codigo_nop').AsFloat);
          if edMudCST.AsInteger = 0 then
            if vDadosIni.strIn(Copy(Trim(edMudCFOP.AsString), 2, 3), ['403', '411' , '405']) then
            begin
              if vDadosIni.vEmp.vRegime = 'SIMPLES' then
                edMudCSOSN.AsValue := StrToInt(CadNf.getCSOSNPorCST('60', ' ', False));
              edMudCST.AsValue := StrToFloat('60');
              edMudAliqICMS.AsValue := 0;
            end;

          try
            CadNf.changesF.onChange_verificar_mud_cfop := nil;
            vDadosIni.abreForm('Alteração de dados dos itens', pnMudancaCfopCST, [ofAutoSize, ofEscapeExit]);
          finally
            CadNf.changesF.onChange_verificar_mud_cfop := nota_event_change_verificar_mud_cfop;
          end;

          _GravaConfiguracoesBoolean(ckMudSelecionados.Name + ANat, ckMudSelecionados.Checked);
          _GravaConfiguracoesBoolean(ckMudCFOP.Name + ANat        , ckMudCFOP.Checked);
          _GravaConfiguracoesBoolean(ckMudOrigem.Name + ANat      , ckMudOrigem.Checked);
          _GravaConfiguracoesBoolean(ckMudCST.Name + ANat         , ckMudCST.Checked);
          _GravaConfiguracoesBoolean(ckMudAliqICMS.Name + ANat    , ckMudAliqICMS.Checked);
          _GravaConfiguracoesInteger(edMudCFOP.Name + ANat        , edMudCFOP.AsInteger);
          _GravaConfiguracoesInteger(edMudOrigCST.Name + ANat     , edMudOrigCST.AsInteger);
          _GravaConfiguracoesInteger(edMudCST.Name + ANat         , edMudCST.AsInteger);
          _GravaConfiguracoesInteger(edMudCSOSN.Name + ANat       , edMudCSOSN.AsInteger);
          _GravaConfiguracoesDouble(edMudAliqICMS.Name + ANat     , edMudAliqICMS.AsValue);
        end
        else
        begin
          if (CadNf.dataSet.State in [dsEdit, dsInsert]) then
            if CadNf.dataSet.FieldByName('VERIFICAR_MUD_CFOP').AsString = 'S' then
              CadNf.dataSet.FieldByName('VERIFICAR_MUD_CFOP').AsString := 'N'
            else
              CadNf.dataSet.FieldByName('VERIFICAR_MUD_CFOP').AsString := 'S';

          CadNf.verificaMudancaCFOP(true);
        end;
      end
      else if (Key = VK_F5) then
        btCalcularNf.Click
      else if (Key = VK_F3) and (ActiveControl <> DBEdit1) and (Panel4.Height = 94) then
        if CadNf.dataSet.FieldByName('cod_cliente').AsInteger = 0 then
          CadNf.teclaAtalho('CLIENTES', 'F3')
        else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
          DBEdit1.SetFocus;
    end;
  end;


  //  else if Key = VK_UP then
  //  begin
  //    Perform(WM_NEXTDLGCTL,1,0);
  //    if ActiveControl = edQtde then
  //		begin
  //		if (Self.Enabled) and (Self.Visible) and (edDescricao.CanFocus) then
  //      edDescricao.SetFocus;
	//		end
  //    else if ActiveControl = edValUnitario then
  //		begin
  //			if (Self.Enabled) and (Self.Visible) and (edQtde.CanFocus) then
  //      	edQtde.SetFocus
	//		end
  //    else if ActiveControl = edPercDesc then
  //		begin
  //			if (Self.Enabled) and (Self.Visible) and (edValUnitario.CanFocus) then
  //      	edValUnitario.SetFocus;
  //		end
  //    else if activecontrol = edCFOP then
  //		begin
  //			if (Self.Enabled) and (Self.Visible) and (edPercDesc.CanFocus) then
  //      	edPercDesc.SetFocus;
  //		end
  //    else if ActiveControl = edPercICMS then
  //    begin
  //			if (Self.Enabled) and (Self.Visible) and (edRef.CanFocus) then
  //      	edRef.SetFocus;
  //		end
  //    else if ActiveControl = edPercIPI then
  //		begin
  //			if (Self.Enabled) and (Self.Visible) and (edPercIMCS.CanFocus) then
  //      	edPercICMS.SetFocus;
 	//		end
  //    else if activecontrol = edPercICMSub then
  //		begin
  //			if (Self.Enabled) and (Self.Visible) and (edPercIPI.CanFocus) then
  //      	edPercIPI.setFocus;
  //		end
  //    else if activecontrol = edMVA then
  //		begin
  //			if (Self.Enabled) and (Self.Visible) and (edPercICMSub.CanFocus) then
  //      	edPercICMSub.SetFocus;
  //		end
  //    else if ActiveControl = edpercredBase then
  //		begin
  //			if (Self.Enabled) and (Self.Visible) and (edMVA.CanFocus) then
  //      	edMVA.SetFocus;
  //		end
  //    else if ActiveControl = edRedIPI then
  //      ActiveControl := edPercRedBase;
  //  end;
end;

procedure TfrmCadNF.FormMargemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then
  begin
    if (Self.Enabled) and (Self.Visible) and (edPreco30.CanFocus) then
      edPreco30.SetFocus;
  end;
end;

procedure TfrmCadNF.FormShow(Sender: TObject);
var
  I: Integer;
  vTemp: string;
begin
	if not Self.Enabled then
    Exit;

  try
  if vCriou = 0 then
  begin
    vCriou := 1;
    if DBGrid1.DataSource = nil then
      DBGrid1.DataSource := DtmNF.dsNf;
    DBGrid1.Options := DBGrid1.Options + [dgEditing];
    AddFieldEditButton('OBS')
      .AddFieldEditButton('DADOS_INTERESSE_FISCO')
      .AddFieldEditButton('DADOS_LANCAMENTO_FISCAL');
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsNotaFiscal;
    pgContDadosNF.ActivePage := tsDadosNF;
    TabSheet1.TabVisible := false;
    TabSheet2.TabVisible := false;
    TabSheet3.TabVisible := false;
    tsNotaFiscal.TabVisible := false;
    tsEntSaiModulo.TabVisible := false;
    tsProdutosServicos.TabVisible := false;
    tsVeiculos.TabVisible := false;
    tsOutras.TabVisible := false;
    tsGlobal.TabVisible := false;
    tsSpedFiscal.TabVisible := false;
    tsFilhosC110.TabVisible := false;
    //tsC120.TabVisible := false;
    tsDespesa.TabVisible := False;
    tsnf_Invisivel.TabVisible := False;

    tsMerc_Combustiveis.Enabled := False;
//    pnOCombustiveis.Visible := False;
    tsMerc_Devolucao.Visible := False;
//    pnoItemDevolNFe.Visible := False;
    tsMerc_ICMS_Entrada.TabVisible := False;
    tsOut_ICMS_Entrada.TabVisible  := False;

    grupoRetorno.Enabled := False;
    Panel4.Height := 60;
    self.Height := 700;
    self.Width := 816;
    pnC120Cadastro.Left := 10;
    pnC120Cadastro.Top := 10;
    pnC120Consulta.Left := 10;
    pnC120Consulta.Top := 10;

    inherited;

    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.Text := ComboBox1.Text;

//    vDadosIni.setTClientDataSetCadPadrao(
//    	vDadosIni.dataSetCol,
//      vDadosIni.vNomeUsuario,
//      vDadosIni.transacaoCol,
//      vAlterarNomeDtSetManifestacao,
//      GridCfgManifestacao,
//      DBGridManifestacao,
//      cdsGridManifestacao,
//      cdsColunasManifestacao,
//      transManifestacao,
//      ListGridsAndDataSetsManifestacao,
//      ListPositionsManifestacao,
//      nomeDTSEtManifestacao,
//      PrimeiraPesquisaManifestacao,
//      vCamposPadraoRegistroManifestacao,
//      usuario);


    for I := 0 to Self.ComponentCount - 1 do
    begin
      if (Components[I] is TDBEdit) and (TDBEdit(Components[I]).Tag = 0) then
        TDBEdit(Components[I]).CharCase := ecUpperCase;
      if (Components[I] is TDBComboBox) and (TDBComboBox(Components[I]).Tag = 0) then
        TDBComboBox(Components[I]).CharCase := ecUpperCase;
      if (Components[I] is TEdit) and (TEdit(Components[I]).Tag = 0) then
        TEdit(Components[I]).CharCase := ecUpperCase;
    end;
    //  lixeiraVazia(CadNf.leixeiraVazia);
    pgControlItensNFe.OnEnter := pgControlItensNFeEnter;
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;

    imgInformation.Hint := imgInformation.Hint + #13 + #13 +
      'Processo "NF0178" CONFIRMAR NF SEM REFERENCIAR NF DEVOLUCAO' + #13 +
      'Processo "NF0179" HABILITAR BOTAO INCLUIR ITENS EM NOTAS FISCAIS DE VENDA FORA DO ESTABELECIMENTO' + #13 +
      'Processo "NF0191" HABILITAR PESQUISA DE NF VENDAS VAN' + #13 +
      'Processo "NF0220" HABILITAR IMPORTACAO XML DE NF-E SAIDA' + #13 +
      'Processo "NF0221" BT GERAR BOLETOS NF AVULSO';

    edcst_ipi.Hint := '00 - Entrada com recuperação de crédito' + #13 +
                      '01 - Entrada tributada com alíquota zero' + #13 +
                      '02 - Entrada isenta' + #13 +
                      '03 - Entrada não-tributada' + #13 +
                      '04 - Entrada imune' + #13 +
                      '05 - Entrada com suspensão' + #13 +
                      '49 - Outras entradas' + #13 +
                      '50 - Saída tributada' + #13 +
                      '51 - Saída tributada com alíquota zero' + #13 +
                      '52 - Saída isenta' + #13 +
                      '53 - Saída não-tributada' + #13 +
                      '54 - Saída imune' + #13 +
                      '55 - Saída com suspensão' + #13 +
                      '99 - Outras saídas';
    edipi_cnpjprod.Hint := 'CNPJ do produtor da mercadoria, quando diferente do emitente. ' +
                           'Somente para os casos de exportação direta ou indireta.';
    edipi_cselo.Hint := 'Código do selo de controle IPI ' + #13 +
                        'Preenchimento conforme Anexo II-A da Instrução Normativa RFB Nº 770/2007';
    edipi_qselo.Hint := 'Quantidade de selo de controle';
    ed_tipoCalc.Hint := 'Tipo de cálculo que o sistema irá executar' + sLineBreak + sLineBreak + sLineBreak +
                        'Completo: Para saída o sistema obtem as aliquotas do cadastro e efetua o cálculo dos tributos com base nas mesmas' + sLineBreak + sLineBreak +
                        'Parcial: O usuário deve preencher as aliquotas, o sistema irá preencher as bases apenas se for necessário, ' + sLineBreak + 'se ja for preenchida o sistema não altera, seguindo o sistema calcula os tributos' + sLineBreak + sLineBreak +
                        'Nenhum: O sistema não executa nenhum cálculo, ficando o usuário responsável do preenchimento de todos os dados';
    lb_tipoCalc.Hint := ed_tipoCalc.Hint;
    lb_tipoCalc.OnDblClick := handleHintDblClick;
    lb_tipo_calc_1.Hint := lb_tipoCalc.Hint;
    //lb_tipo_calc_2.Hint := lb_tipoCalc.Hint;
    //lb_tipo_calc_3.Hint := lb_tipoCalc.Hint;
    lb_tipo_calc_4.Hint := lb_tipoCalc.Hint;
    lb_tipo_calc_1.OnDblClick := handleHintDblClick;
    //lb_tipo_calc_2.OnDblClick := handleHintDblClick;
    //lb_tipo_calc_3.OnDblClick := handleHintDblClick;
    lb_tipo_calc_4.OnDblClick := handleHintDblClick;

    pg_icms_tributos.ActivePage := tab_icms_tributos;
    tab_icms_tributos.TabVisible := False;
    tab_icms_tributos_mono.TabVisible := False;
    pg_icms_tributos.ActivePage := tab_icms_tributos;
    pg_icms_tributos.Top := 9999;

    //edoCSTIPI.Hint                    := eddCSTIPI.Hint;
    DBGrid13.Hint                     := '[F3: Marca Item - F4: Marca Todos Itens - F8: Marcar Grade] - Itens da nota fiscal.';
    ed_rateio_desconto.FormatSize     := '0.2';
    edo_rateio_desconto.FormatSize    := '0.2';

    panelGrupoVenda.Width  := 800;
    panelGrupoVenda.Height := 600;

    edCBenef.Hint    := 'Código de Benefício Fiscal utilizado pela UF, aplicado ao item.' + #13 + #13 +
                        'Obs.: Deve ser utilizado o mesmo código adotado na EFD e outras declarações, nas UF que o exigem.';
    Label118.Hint    := edCBenef.Hint;
    edindEscala.Hint := 'Indicador de Produção em escala relevante, conforme Cláusula 23 do Convenio ICMS 52/2017' + #13 +
                        'S - Produzido em Escala Relevante' + #13 +
                        'N – Produzido em Escala NÃO Relevante' + #13 +
                        'Nota: preenchimento obrigatório para produtos com NCM relacionado no Anexo XXVII do Convenio 52/2017';
    Label120.Hint    := edindEscala.Hint;
    edCNPJFab.Hint   := 'CNPJ do Fabricante da Mercadoria, obrigatório para produto em escala NÃO relevante';
    Label21.Hint     := edCNPJFab.Hint;
    RadioGroup2.Items.Clear;
    RadioGroup2.Items.Add('Todas');
    RadioGroup2.Items.Add('Abertas');
    RadioGroup2.Items.Add('Fechadas');
    RadioGroup2.Items.Add('Canceladas');
    RadioGroup2.Items.Add('Pre Notas');
    RadioGroup2.Items.Add('Mais Opções NFe');
    //RadioGroup2.Items.Add('A Inutilizar');
    RadioGroup2.Tag := _LerConfiguracoesRegistroInteger(RadioGroup2.Name, 0);
    RadioGroup2.ItemIndex := IfThen((RadioGroup2.Tag >= 0) and (RadioGroup2.Tag <= 5), RadioGroup2.Tag, 0);
    DBGrid2.OnTitleClick := vDadosIni.DBGrid_event_TitleClick;
    if vDadosIni.GetIni('MD', 'BTSTSNFE', 'N') = 'S' then
      pnLabelsNFe.Parent := Panel1;

    GridHandlerSingleton.GetInstance().PersistGrid(DBGrid13, True).Configure(DBGrid13, False);

  end;

  leConfiguracoesFormRegistro;

  if FormStyle = fsNormal then
  begin
    self.Height := 700;
    self.Width := 816;
    WindowState:= wsNormal;
    if enterTela2 = nil then
    begin
      enterTela2 := TEnterHw.Create(Self);
      enterTela2.ClassList.Clear;
      enterTela2.classList.Add('TMaskEdit');
      enterTela2.classList.Add('TEdit');
      enterTela2.classList.Add('TDBEdit');
      enterTela2.classList.Add('TEditMoeda'); { Componente de Moeda e Inteiros HwSistemas}
      enterTela2.classList.Add('TEditHw'); { Componente de Moeda e Inteiros HwSistemas melhorado}
      enterTela2.classList.Add('TCheckBox');
      enterTela2.classList.Add('TDBCheckBox');
      enterTela2.classList.Add('TComboBox');
      enterTela2.classList.Add('TDBComboBox');
      enterTela2.classList.Add('TListBox');
      enterTela2.classList.Add('TDBListBox');
      enterTela2.classList.Add('TDBLookupListBox');
      enterTela2.classList.Add('TDBLookupComboBox');
      enterTela2.classList.Add('TSpinEdit');
      enterTela2.classList.Add('TDateTimePicker');
      enterTela2.classList.Add('TRadioGroup');
      enterTela2.classList.Add('TDBRadioGroup');
      enterTela2.classList.Add('TRadioButton');
      enterTela2.classList.Add('TDBRadioButton');
    end;
  end;
  if frmCadNF = nil then
    frmCadNF := TfrmCadNF(Self);

  if TelaCadastro = 1 then
    BitBtn3Click(Sender)
  else if (self.tag = 11) then
  BEGIN
    TelaCadastro:=2;
    if CadNf.verificaNotaFiscalIntegracao then
      SpeedButton1Click(Sender)      //      habilitaCamposCadastroNotaFiscal
    else
      begin
        Application.Terminate;
        Abort;
        Close;
      end;
  end
  else if (self.tag = 12) then
  BEGIN
    TelaCadastro:=2;
    if CadNf.importaXml(vDadosIni.vDtSetTmp.FieldByName('XML').AsString) then
    begin
      habilitaCamposCadastroNotaFiscal;
      CadNf.vItem.dataSet.First;
    end;
  end
  else if (self.tag = 13) then
  BEGIN
     TelaCadastro:=2;
      MaskEdit3.Text := IntToStr(vDadosIni.vDtSetTmp.FieldByName('COD_NF').AsInteger);
      ComboBox1.Text := CadNf.dataSet.FieldByName('COD_NF').DisplayLabel;
      MaskEdit1.Visible := False;
      MaskEdit2.Visible := False;
      MaskEdit3.Visible := true;
      BitBtn1Click(Sender)      //      habilitaCamposCadastroNotaFiscal
  end
  else if (self.tag = 14) then
  BEGIN
    TelaCadastro:=2;
    if vDadosIni.vEmp.vVersaoVeiculos = '4' then
    begin
      if not CadNf.incluirNf( tnfVeiculos, 'A', 'E') then
      begin
      	frmCadNF.fechar := True;
        PostMessage(frmCadNF.Handle, WM_CLOSE, 0, 0);
      end
      else
        habilitaCamposCadastroNotaFiscal;
    end;

  end
  else if (self.tag = 15) then
  BEGIN
    TelaCadastro:=2;
    if vDadosIni.vEmp.vVersaoVeiculos = '4' then
    begin
      vNFAvulsaEst := False;
      getDadosFormularioMontarNfComando;
      CadNf.incluirNf( tnfVeiculos, 'A', 'S');
      if vNFAvulsaEst then
        habilitaCamposCadastroNotaFiscal
      else
      begin
      	frmCadNF.fechar := True;
        PostMessage(frmCadNF.Handle, WM_CLOSE, 0, 0);
      end;
    end;
  end
  else if (self.tag = 16) then
  BEGIN
    TelaCadastro:=2;
    SpeedButton74.Caption := 'Sair';
    BitBtn170Click(Sender);
  end
  else if (self.tag = 21) then
  BEGIN
    TelaCadastro:=2;
    if CadNf.verificaComandoIntegracao then
    begin
      habilitaCamposCadastroNotaFiscal;
      if vDadosIni.vEmp.vVersaoVeiculos = '4' then
        btSalvarNFClick(Sender);
    end
    else
      begin
        Application.Terminate;
        Abort;
        Close;
      end;
  end
  else if (self.tag = 22)  then
  BEGIN
    TelaCadastro:=2;
    if CadNf.criarNotaFiscalDoPedvenda() then
      habilitaCamposCadastroNotaFiscal
    else
      begin
        Application.Terminate;
        Abort;
        Close;
      end;
  end
  else if (self.tag = 23) then
  begin
    TelaCadastro:=2;
    vTemp := 'A';
    if (vDadosIni.vEmp.vNfe.modeloNF = '55') and (vDadosIni.vEmp.vNfe.usarServico <> 'S') then
      vTemp := 'P';
    if vTemp <> ''  then
      if CadNf.incluirNf( tnfProdutos, vTemp[1], 'S') then
      begin
        getDadosFormularioMontarNfPedVenda;
        if CadNf.abreFormPedidoDeVenda then
          habilitaCamposCadastroNotaFiscal
        else
        BEGIN
          CadNf.CancelUpdates;
          Application.Terminate;
          Abort;
          Close;
        end;
      end;
  end
  else if (self.tag = 31) then
  begin
    TelaCadastro:=2;
    CadNf.verificaComandoIntegracao;
    habilitaCamposCadastroNotaFiscal;
  end
  else if (self.tag = 32) then
  BEGIN
    TelaCadastro:=2;
    CadNf.criarNotaFiscalDoPedvenda();
    habilitaCamposCadastroNotaFiscal;
  end
  else if (self.tag = 33)  then
  begin
    TelaCadastro:=2;
    CadNf.verificaContratoIntegracao;
    habilitaCamposCadastroNotaFiscal;
  end
  else if Pos('NF_FICHAPRODUTOMOD|', vDadosIni.vPesquisa) > 0 then
  begin
  	TelaCadastro := 2;
    MaskEdit3.Text := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
    ComboBox1.Text := CadNf.dataSet.FieldByName('COD_NF').DisplayLabel;
    MaskEdit1.Visible := False;
    MaskEdit2.Visible := False;
    MaskEdit3.Visible := true;
    BitBtn1Click(Sender)      //
  end
  else if Pos('NF_FICHAPRODUTO|', vDadosIni.vPesquisa) > 0 then
  begin
    TelaCadastro := 2;
    try
      CadNf.vCons.personalisada := True;
      CadNf.vCons.sqlPersonalizado := ' and notafiscal.cod_nf = ' + vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
      CadNf.consulta;
    finally
      CadNf.vCons.personalisada := False;
    end;
    if CadNf.dataSet.IsEmpty then
    begin
      Application.MessageBox('Registro não encontrado', 'Atenção', 0 + 64);
      frmCadNF.fechar := True;
      PostMessage(frmCadNF.Handle, WM_CLOSE, 0, 0);
    end;
    CadNf.Edit;
    habilitaCamposCadastroNotaFiscal;
  end;

    if habilitaCamposCadastroNotaFiscalOnShow then
    begin
      TelaCadastro := vDadosIni.vTipoForm;
      habilitaCamposCadastroNotaFiscal();
    end;

  finally
    habilitaCamposCadastroNotaFiscalOnShow := False;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmCadNF.FrameIbsCbsCalculoCallBack(Sender: TObject);
begin
  setCamposDetalhado;

  if (CadNf.vItem.vrDadosItem.valor_unitario <= 0) or
    ((CadNf.vItem.vrDadosItem.tipo_item <> 'S') and (Length(CadNf.vItem.vrDadosItem.cst) <> 3))
  then
    Exit;

  CadNf.calc_fat.calculo_faturamento_individual_executar(False, True);

  getCamposDetalhado;
end;

procedure TfrmCadNF.FrameIbsCbsCalculoItemDtSetCallBack(Sender: TObject);
begin
  ValidarSetarIbsCbsCalculoItemDtSetCallBack(Sender);
end;

function TfrmCadNF.ValidarSetarIbsCbsCalculoItemDtSetCallBack(Sender: TObject): Boolean;
var
  IbsCbs: TributoDFeIbsCbsEtd;
  ImpSel: TributoDFeImpostoSeletivoEtd;
  frameIbsCbsDtSet: TFrameIbsCbs;
begin

  if Sender = FrameIbsCbsVeic1 then
    frameIbsCbsDtSet := FrameIbsCbsVeic1
  else if Sender = FrameIbsCbsDesp1 then
    frameIbsCbsDtSet := FrameIbsCbsDesp1
  else
    raise Exception.Create('Sender não foi passado corretamente para FrameIbsCbsCalculoItemDtSetCallBack');

  if YesNoEnum(CadNf.fint('dfe_trib_ignorar')) = ynYes then
  begin
    IbsCbs := nil;
    ImpSel := nil;
  end
  else
  begin
    IbsCbs := frameIbsCbsDtSet.GetIbsCbs();
    ImpSel := nil; //FrameImpostoSeletivo1.GetImpostoSeletivo();
  end;

  CadNf.vItem.PrepareDadosItem();

  if (IbsCbs = nil) and (ImpSel = nil) then
    CadNf.vItem.vrDadosItem.tributosRTC := nil
  else
    CadNf.vItem.vrDadosItem.tributosRTC := TributoDFeContextEtd.Create(
      CadNf.vItem.vrDadosItem.dfe_trib_id,
      tdfoNotaFiscal,
      ImpSel,
      IbsCbs
    );
  try
    Result := CadNf.calc_fat.calculo_faturamento_individual_executar(False, True);

    if (CadNf.vItem.vrDadosItem.tributosRTC = nil)
      or ( (CadNf.vItem.vrDadosItem.tributosRTC.IbsCbs = nil) and (CadNf.vItem.vrDadosItem.tributosRTC.ImpostoSeletivo = nil) )
    then
      frameIbsCbsDtSet.Setup( nil )
    else
      frameIbsCbsDtSet.Setup( CadNf.vItem.vrDadosItem.tributosRTC.IbsCbs );

    CadNf.vItem.SetStateTributoRTC( CadNf.vItem.vrDadosItem.tributosRTC.Clone() );
  finally
    CadNf.vItem.cancelar;
  end;
end;

procedure TfrmCadNF.getCalculoImposto ;
var
  vExisteDiferenca: Boolean;
begin
  vExisteDiferenca := False;
  edBICM.AsValue := CadNf.CalculoImposto.vBaseICMS;
  edVICM.AsValue := CadNf.CalculoImposto.vValorICM;
  edBICMSub.AsValue := CadNf.CalculoImposto.vBaseICMSSub;
  edVICMSub.AsValue := CadNf.CalculoImposto.vValorICMSub;
  edVProd.AsValue  := CadNf.CalculoImposto.vValorProdutos;
  edVServ.AsValue  := CadNf.CalculoImposto.vValorServicos;
  //        edDesconto.Valor := CadNf.CalculoImposto.
  edVFrete.AsValue := CadNf.CalculoImposto.vValorFrete;
  edVSeguro.AsValue := CadNf.CalculoImposto.vValorSeguro;
  edVOutDesp.AsValue := CadNf.CalculoImposto.vValorOutDesp;
  edVIPI.AsValue := CadNf.CalculoImposto.vValorIPI;
  edVAcresc.AsValue := CadNf.CalculoImposto.vValorAcresFin;
  edVOutDesPF.AsValue := CadNf.CalculoImposto.vValorOutDespPF;
  edValorTotalDaNota.AsValue := CadNf.CalculoImposto.vValorLiquidoNF;

  if Format('%0.2f', [CadNf.CalculoImposto.vBaseICMS]) <>
    Format('%0.2f', [CadNf.dataSet.FieldByName('base_icm').AsFloat]) then
    edBICM.Font.Color := clRed
  else
    edBICM.Font.Color := clWindowText;

  if Format('%0.2f', [CadNf.CalculoImposto.vValorICM]) <>
    Format('%0.2f', [CadNf.dataSet.FieldByName('valor_icm').AsFloat]) then
    edVICM.Font.Color := clRed
  else
    edVICM.Font.Color := clWindowText;

  if Format('%0.2f', [CadNf.CalculoImposto.vBaseICMSSub]) <>
    Format('%0.2f', [CadNf.dataSet.FieldByName('base_icmsub').AsFloat])
  then
    edBICMSub.Font.Color := clRed
  else
    edBICMSub.Font.Color := clWindowText;

  if Format('%0.2f', [CadNf.CalculoImposto.vValorICMSub]) <>
    Format('%0.2f', [CadNf.dataSet.FieldByName('valor_icmsub').AsFloat])
  then
    edVICMSub.Font.Color := clRed
  else
    edVICMSub.Font.Color := clWindowText;

  if Format('%0.2f', [CadNf.CalculoImposto.vValorProdutos]) <>
    Format('%0.2f', [CadNf.dataSet.FieldByName('valor_prod').AsFloat]) then
    edVProd.Font.Color := clRed
  else
    edVProd.Font.Color := clWindowText;

  if Format('%0.2f', [CadNf.CalculoImposto.vValorServicos]) <>
    Format('%0.2f', [CadNf.dataSet.FieldByName('valor_serv').AsFloat]) then
    edVServ.Font.Color := clRed
  else
    edVServ.Font.Color := clWindowText;

  //        edDesconto.Valor := CadNf.CalculoImposto.

  if Format('%0.2f', [CadNf.CalculoImposto.vValorFrete]) <>
    Format('%0.2f', [CadNf.dataSet.FieldByName('valor_frete').AsFloat]) then
    edVFrete.Font.Color := clRed
  else
    edVFrete.Font.Color := clWindowText;

  if Format('%0.2f', [CadNf.CalculoImposto.vValorSeguro]) <>
    Format('%0.2f', [CadNf.dataSet.FieldByName('valor_seguro').AsFloat]) then
    edVSeguro.Font.Color := clRed
  else
    edVSeguro.Font.Color := clWindowText;

  if Format('%0.2f', [CadNf.CalculoImposto.vValorOutDesp]) <>
    Format('%0.2f', [CadNf.dataSet.FieldByName('valor_out_desp').AsFloat]) then
    edVOutDesp.Font.Color := clRed
  else
    edVOutDesp.Font.Color := clWindowText;

  if Format('%0.2f', [CadNf.CalculoImposto.vValorIPI]) <>
    Format('%0.2f', [CadNf.dataSet.FieldByName('valor_ipi').AsFloat]) then
    edVIPI.Font.Color := clRed
  else
    edVIPI.Font.Color := clWindowText;

  if Format('%0.2f', [CadNf.CalculoImposto.vValorAcresFin]) <>
    Format('%0.2f', [CadNf.dataSet.FieldByName('valor_acres_fin').AsFloat]) then
    edVAcresc.Font.Color := clRed
  else
    edVAcresc.Font.Color := clWindowText;

  if Format('%0.2f', [CadNf.CalculoImposto.vValorOutDespPF]) <>
    Format('%0.2f', [CadNf.dataSet.FieldByName('valor_desp_pf').AsFloat]) then
    edVOutDesPF.Font.Color := clRed
  else
    edVOutDesPF.Font.Color := clWindowText;

  if Format('%0.2f', [CadNf.CalculoImposto.vValorLiquidoNF]) <>
    Format('%0.2f', [CadNf.dataSet.FieldByName('valor_total').AsFloat]) then
    edValorTotalDaNota.Font.Color := clRed
  else
    edValorTotalDaNota.Font.Color := clWindowText;
  vExisteDiferenca := (edVICM.Font.Color = clRed) or (edVICM.Font.Color = clRed) or
    (edBICMSub.Font.Color = clRed) or (edVICMSub.Font.Color = clRed) or (edVProd.Font.Color = clRed)
    or
    (edVFrete.Font.Color = clRed) or (edVSeguro.Font.Color = clRed) or (edVOutDesp.Font.Color =
    clRed) or
    (edVIPI.Font.Color = clRed) or (edVAcresc.Font.Color = clRed) or (edVOutDesPF.Font.Color = clRed)
    or
    (edValorTotalDaNota.Font.Color = clRed);
  btContinuarCalculo.Enabled := True;
  if CadNf.campo_emissao_propria = 'S' then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('NF0132', 'HABILITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
      CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
      btContinuarCalculo.Enabled := not vExisteDiferenca;
  end;
//  else if vDadosIni.vEmp.vConfDiferencaEnt = 'S' then
//  begin
//    btContinuarCalculo.Enabled := not CadNf.existeDiferencaoAcimaDoLimite;
//    if not btContinuarCalculo.Enabled then
//    begin
//      vDadosIni.vInibeMensPesqPros := 'S';
//      btContinuarCalculo.Enabled := vDadosIni.PesqPros('NF0112', 'HABILITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
//        CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, False);
//    end;
//  end;
  if vExisteDiferenca then
    Application.MessageBox('Existe Diferença', 'Atenção', 0 + 64);
end;

procedure TfrmCadNF.getCampos;
begin
  with CadNf.vItem.vrDadosItem do
  begin
    edOnCodigo.Text                := num_fab_prod;
    edOnDescricaoOutras.Lines.Text := descricao_item_outras.Text;
    edOnReferencia.Text            := referencia;
    edOnNCM.Text                   := ncm;
    edoCEST.Text                   := cest;
    edocean.Text                   := cean;
    edcBarra.Text                  := cbarra;
    edOnQtde.AsValue               := quantidade;
    edOnValorUnitario.AsValue      := valor_unitario;
    edo_rateio_desconto.AsValue    := rateio_desconto;
    edo_valor_total.AsValue        := valor_total;
    edo_rateio_seguro.AsValue      := rateio_seguro;
    edo_rateio_outdesp.AsValue     := rateio_outdesp;
    edo_rateio_frete.AsValue       := rateio_frete;

    edcenq_ipi_nfe.Text    := cenq_ipi_nfe;
    edcst_ipi.Text         := cst_ipi;
    edaliq_ipi.AsValue     := aliq_ipi;
    edperc_red_ipi.AsValue := perc_red_ipi;
    edbase_ipi.AsValue     := base_ipi;
    edvalor_ipi.AsValue    := valor_ipi;
    edipi_cnpjprod.Text    := ipi_cnpjprod;
    edipi_cselo.Text       := ipi_cselo;
    edipi_qselo.AsValue    := ipi_qselo;
    edpredbcefet.AsValue   := predbcefet;
    edvbcefet.AsValue      := vbcefet;
    edpicmsefet.AsValue    := picmsefet;
    edvicmsefet.AsValue    := vicmsefet;

    edpfcp.AsValue       := fcp_pfcp;
    edvbcfcp.AsValue     := fcp_vbcfcp;
    edvfcp.AsValue       := fcp_vfcp;
    edpfcpst.AsValue     := fcp_pfcpst;
    edvbcfcpst.AsValue   := fcp_vbcfcpst;
    edvfcpst.AsValue     := fcp_vfcpst;
    edindEscala.Text     := nfe_indescala;
    edCNPJFab.Text       := nfe_cnpjfab;
    ednfe_nrecopi.Text   := nfe_nrecopi;
    ednfci.Text          := nfci;
    edCBenef.Text        := nfe_cbenef;
    edIndTot.Text        := vDadosIni.IfThen(indTot = 1, 'S', 'N');
    edutrib.Text         := utrib;
    edqtrib.AsValue      := qtrib;
    ed_vtot_trib.AsValue := vtottrib;

    edmed_cprodanvisa.Text := med_cprodanvisa;
    edmed_vpmc.AsValue     := med_vpmc;
    edrastro_nlote.Text    := rastro_nlote;
    edrastro_qlote.AsValue := rastro_qlote;
    edrastro_dfab.Text     := IfThen(rastro_dfab > 0, DateToStr(rastro_dfab), '');
    edrastro_dval.Text     := IfThen(rastro_dval > 0, DateToStr(rastro_dval), '');

    ed_pdif.AsValue         := pdif;
    ed_dif_vicmsop.AsValue  := vicmsop_dif;
    ed_vicmsdif.AsValue     := vicmsdif;
    ed_pfcpdif.AsValue      := pfcpdif;
    ed_dif_vfcpefet.AsValue := vfcpefet_dif;
    ed_vfcpdif.AsValue      := vfcpdif;

    ed_piscofins_cst.Text              := cst_pis;
    ed_piscofins_nat_rec.Text          := nat_rec;
    ed_ppis.AsValue                    := aliq_pis;
    ed_pis_vbc.AsValue                 := base_pis;
    ed_pis_valiq.AsValue               := aliq_pis_quant;
    ed_pis_qbc.AsValue                 := quant_bc_pis;
    ed_pcofins.AsValue                 := aliq_cofins;
    ed_cofins_vbc.AsValue              := base_cofins;
    ed_cofins_valiq.AsValue            := aliq_cofins_quant;
    ed_cofins_qbc.AsValue              := quant_bc_cofins;
    ed_vpis.AsValue                    := valor_pis;
    ed_vcofins.AsValue                 := valor_cofins;
    ed_piscofins_motivo_deson.KeyValue := motdes_pc;
    ed_vpisdeson.AsValue               := vpisdeson;
    ed_vcofinsdeson.AsValue            := vcofinsdeson;
    ed_indSomaPISST.Text               := IfThen(indsomapisst = 1, 'S', 'N');
    ed_indSomaCOFINSST.Text            := IfThen(indsomacofinsst = 1, 'S', 'N');

    edChaveNFeRef.Text                 := chave_nfe_ref;
    edNitemNFeRef.Text                 := IfThen(nitem_nfe_ref > 0, IntToStr(nitem_nfe_ref));
    ed_nbs.Text                        := CadNf.vItem.vrDadosItem.nbs;

    ed_icment_csosn.Text               := icm_csosn;
    ed_icment_orig.Text                := icm_orig;
    ed_icment_cst.Text                 := icm_cst;
    ed_icment_nitem_xml.AsValue        := nitem_xml;
    ed_icment_modbcst.Text             := icm_modbcst;
    ed_icment_pred.AsValue             := icm_pred;
    ed_icment_vbc.AsValue              := icm_vbc;
    ed_icment_picm.AsValue             := icm_picm;
    ed_icment_vicm.AsValue             := icm_vicm;
    ed_icment_vbcfcp.AsValue           := icm_vbcfcp;
    ed_icment_pfcp.AsValue             := icm_pfcp;
    ed_icment_vfcp.AsValue             := icm_vfcp;
    ed_icment_pmvast.AsValue           := icm_pmvast;
    ed_icment_predst.AsValue           := icm_predbcst;
    ed_icment_vbcst.AsValue            := icm_vbcst;
    ed_icment_picmst.AsValue           := icm_picmst;
    ed_icment_vicmst.AsValue           := icm_vicmst;
    ed_icment_vbcfcpst.AsValue         := icm_vbcfcpst;
    ed_icment_pfcpst.AsValue           := icm_pfcpst;
    ed_icment_vfcpst.AsValue           := icm_vfcpst;
    ed_icment_vicmdeson.AsValue        := icm_vicmdeson;
    ed_icment_vbcstret.AsValue         := icm_vbcstret;
    ed_icment_pst.AsValue              := icm_pst;
    ed_icment_vicmssusbstituto.AsValue := icm_vicmssubstituto;
    ed_icment_vicmstret.AsValue        := icm_vicmsstret;
    ed_icment_vbcfcpstret.AsValue      := icm_vbcfcpstret;
    ed_icment_pfcpstret.AsValue        := icm_pfcpstret;
    ed_icment_vfcpstret.AsValue        := icm_vfcpstret;
    ed_ant_vicmssubstituto.AsValue     := ant_vicmssubstituto;
    ed_base_icmant_sub.AsValue         := base_icmant_sub;
    ed_ant_pst.AsValue                 := ant_pst;
    ed_valor_icmant_sub.AsValue        := valor_icmant_sub;
    ed_fcp_vbcfcpstret.AsValue         := fcp_vbcfcpstret;
    ed_fcp_pfcpstret.AsValue           := fcp_pfcpstret;
    ed_fcp_vfcpstret.AsValue           := fcp_vfcpstret;
    ed_icm_pdif.AsValue                := icm_pdif;
    ed_icm_vdif.AsValue                := icm_vicmsdif;
    ed_icm_vicmop_dif.AsValue          := icm_vicmsop_dif;
    ed_icm_fcp_pdif.AsValue            := icm_pfcpdif;
    ed_icm_fcp_vdif.AsValue            := icm_vfcpdif;
    ed_icm_fcp_vfcpop.AsValue          := icm_vfcpefet_dif;
    ed_icm_qbcmono.AsValue             := icm_qbcmono;
    ed_icm_adremicms.AsValue           := icm_adremicms;
    ed_icm_vicmsmono.AsValue           := icm_vicmsmono;
    ed_icm_qbcmonoreten.AsValue        := icm_qbcmonoreten;
    ed_icm_adremicmsreten.AsValue      := icm_adremicmsreten;
    ed_icm_vicmsmonoreten.AsValue      := icm_vicmsmonoreten;
    ed_icm_qbcmonoret.AsValue          := icm_qbcmonoret;
    ed_icm_adremicmsret.AsValue        := icm_adremicmsret;
    ed_icm_vicmsmonoret.AsValue        := icm_vicmsmonoret;

    ed_vbcretfed.AsValue  := vbcretfed;
    ed_pretir.AsValue     := pretir;
    ed_pretcsll.AsValue   := pretcsll;
    ed_pretpis.AsValue    := pretpis;
    ed_pretcofins.AsValue := pretcofins;
    ed_vretir.AsValue     := vretir;
    ed_vretcsll.AsValue   := vretcsll;
    ed_vretpis.AsValue    := vretpis;
    ed_vretcofins.AsValue := vretcofins;

    {$REGION 'aba icms'}
    ed_tipoCalc.ItemIndex   := tipo_calc;
    ed_tipoCalcPC.ItemIndex := tipo_calc_pc;
    ed_tipoCalcRet.ItemIndex := tipo_calc_retfed;

    ed_qbcmono.AsValue        := qbcmono;
    ed_qbcmonoreten.AsValue   := qbcmonoreten;
    ed_qbcmonoret.AsValue     := qbcmonoret;
    ed_adremicms.AsValue      := adremicms;
    ed_adremicmsreten.AsValue := adremicmsreten;
    ed_adremicmsret.AsValue   := adremicmsret;
    ed_vicmsmono.AsValue      := vicmsmono;
    ed_vicmsmonoreten.AsValue := vicmsmonoreten;
    ed_vicmsmonoret.AsValue   := vicmsmonoret;
    if qbcmonoret > 0 then
      lb_vicmsmono_un.Caption := Format('Vr un: %0.2n', [vicmsmonoret / qbcmonoret])
    else
      lb_vicmsmono_un.Caption := '';
    {$ENDREGION}

    if (tributosRTC = nil) or ( (tributosRTC.IbsCbs = nil) and (tributosRTC.ImpostoSeletivo = nil) ) then
      FrameIbsCbs1.Setup( nil )
    else
      FrameIbsCbs1.Setup( tributosRTC.IbsCbs );
  end;
end;

procedure TfrmCadNF.getCamposDetalhado;
var
  I: Integer;
  querEst: TQuery_OOP;
begin
  try
    getCampos;

    eddNumFab.Text               := CadNf.vItem.vrDadosItem.num_fab_prod;
    eddNumFabFornecedor.Text     := CadNf.vItem.vrDadosItem.num_fab_fornecedor;
    eddQtde.AsValue              := CadNf.vItem.vrDadosItem.quantidade;
    eddReferencia.Text           := CadNf.vItem.vrDadosItem.referencia;
    eddGrupo.AsValue             := CadNf.vItem.vrDadosItem.grupo_prod;
    eddCodigo.Text               := CadNf.vItem.vrDadosItem.cod_prod;
    eddReducaoBaseICMSub.AsValue := CadNf.vItem.vrDadosItem.perc_red_prod_sub;
    eddValorUnitario.AsValue     := CadNf.vItem.vrDadosItem.valor_unitario;
    //eddPercDesc.AsValue          := CadNf.vItem.vrDadosItem.perc_desconto;
    eddValorTotal.AsValue        := CadNf.vItem.vrDadosItem.valor_total;
    eddCFOP.AsValue              := CadNf.vItem.vrDadosItem.codigo_nop;
    eddCST.Text                  := CadNf.vItem.vrDadosItem.cst;
    eddNCM.Text                  := CadNf.vItem.vrDadosItem.ncm;
    eddCSOSN.Text                := CadNf.vItem.vrDadosItem.csosn;
    eddReducaoBaseICM.AsValue    := CadNf.vItem.vrDadosItem.perc_red_prod;
    eddAliqICMSub.AsValue        := CadNf.vItem.vrDadosItem.aliq_icmsub;
    eddMVA.AsValue               := CadNf.vItem.vrDadosItem.mva;
    ckdAnt_calc.Visible          := CadNf.campo_natureza_nf = 'E';

    if not ckdAnt_calc.Visible then
      ckdAnt_calc.Checked := False
    else
      ckdAnt_calc.Checked := vDadosIni.IfThen(CadNf.vItem.vrDadosItem.ant_calc = 'D', True, False);
    if ckdAnt_calc.Checked then
    begin
      eddBaseICMSub.AsValue  := CadNf.vItem.vrDadosItem.base_icmsub_ant * CadNf.vItem.vrDadosItem.quantidade;
      eddValorICMSST.AsValue := CadNf.vItem.vrDadosItem.valor_icmsub_ant * CadNf.vItem.vrDadosItem.quantidade;
    end
    else
    begin
      eddBaseICMSub.AsValue  := CadNf.vItem.vrDadosItem.base_icmsub;
      eddValorICMSST.AsValue := CadNf.vItem.vrDadosItem.valor_icmsub;
    end;
    eddAntT.Enabled              := not ckdAnt_calc.Checked;
    eddAliqICMSub.Enabled        := eddAntT.Enabled;
    eddReducaoBaseICMSub.Enabled := eddAntT.Enabled;
    eddMVA.Enabled               := eddAntT.Enabled;
    eddAntT.Enabled              := eddAntT.Enabled;
    eddValorICMSST.Enabled       := not eddAntT.Enabled;
//    eddAliqIPI.AsValue           := CadNf.vItem.vrDadosItem.aliq_ipi;
//    eddReducaoBaseIPI.AsValue    := CadNf.vItem.vrDadosItem.perc_red_ipi;
//    eddBaseIPI.AsValue           := CadNf.vItem.vrDadosItem.base_ipi;
    eddDescricao.Text            := CadNf.vItem.vrDadosItem.descricao_item;
    eddValorDif.AsValue          := CadNf.vItem.vrDadosItem.valor_dif;
    eddBaseISS.AsValue           := CadNf.vItem.vrDadosItem.base_iss;
    eddAliqISS.AsValue           := CadNf.vItem.vrDadosItem.aliq_iss;
    edvalor_iss.AsValue          := CadNf.vItem.vrDadosItem.valor_iss;
    eddModBC.ItemIndex           := CadNf.vItem.vrDadosItem.modbc;
    eddModBCST.ItemIndex         := CadNf.vItem.vrDadosItem.modbcst;
//    eddCSTIPI.Text               := CadNf.vItem.vrDadosItem.cst_ipi;

    if Trim(CadNf.vItem.vrDadosItem.mnf) <> '' then
      eddMNF.Text        := Trim(CadNf.vItem.vrDadosItem.mnf);
    eddQTDEMB_old.AsValue    := CadNf.vItem.vrDadosItem.qtdemb;
    eddQTDEMBREC.AsValue := CadNf.vItem.vrDadosItem.qtdembrec;
    eddVLREMBNF.AsValue  := CadNf.vItem.vrDadosItem.vlrembnf;
    eddUnidade_nf.Text   := CadNf.vItem.vrDadosItem.unidade_nf;

    eddVLBRUREAL.AsValue := CadNf.vItem.vrDadosItem.vlbrureal;
    eddPDESC_R.AsValue   := CadNf.vItem.vrDadosItem.pdesc_r;
    eddVLREMBNFR.AsValue := CadNf.vItem.vrDadosItem.vlrembnfr;

    eddvicmdeson.AsValue := CadNf.vItem.vrDadosItem.vicmdeson;
    if (Trim(CadNf.vItem.vrDadosItem.csosn) <> '') and (Trim(CadNf.vItem.vrDadosItem.csosn) <> '900') and
      (CadNf.campo_natureza_nf = 'S') and (CadNf.fequals('tipo_emissao', '1')) then
    begin
      eddvalor_icm.AsValue := CadNf.vItem.vrDadosItem.valor_icm_simples;
      eddBaseICM.AsValue := CadNf.vItem.vrDadosItem.base_icm_simples;
      eddAliqICM.AsValue := CadNf.vItem.vrDadosItem.aliq_icm_simples;
    end
    else
    begin
      eddvalor_icm.AsValue := CadNf.vItem.vrDadosItem.valor_icm;
      eddBaseICM.AsValue := CadNf.vItem.vrDadosItem.base_icm;
      eddAliqICM.AsValue := CadNf.vItem.vrDadosItem.aliq_icm;
    end;
    lkDesoneracao.KeyValue := IntToStr(CadNf.vItem.vrDadosItem.ind_desoneracao);

    if CadNf.vItem.vrDadosItem.data_validade > 0 then
      eddValidade.Text := DateToStr(CadNf.vItem.vrDadosItem.data_validade);

    eddTipo.Text := CadNf.vItem.vrDadosItem.tipo_item;
    if CadNf.campo_natureza_nf = 'E' then
    begin
      if Trim(CadNf.vItem.vrDadosItem.tipo_item) = '' then
        eddTipo.Text := 'P'
      else
        eddTipo.Text := CadNf.vItem.vrDadosItem.tipo_item;
    end;
    if (not (CadNf.produto and CadNf.servico)) and (Trim(eddTipo.Text) = '' ) then// Trim(eddTipo.Text) = '' then
    begin
      if CadNf.servico then
        eddTipo.Text := 'S'
      else
        eddTipo.Text := 'P';
    end;

    {
    if Trim(CadNf.vItem.vrDadosItem.cst_pis) = '' then
      eddCSTPIS.ItemIndex := -1
    else
      for I := 0 to eddCSTPIS.Items.Count - 1 do
        if Copy(eddCSTPIS.Items[I],1,2) = CadNf.vItem.vrDadosItem.cst_pis then
          eddCSTPIS.ItemIndex := I;

    if CadNf.vItem.vrDadosItem.aliq_pis_quant > 0 then
    begin
      bt_it_pc_alterar_aliq_perc.Caption := '%';
      bt_it_pc_alterar_aliq_perc.Click;
      eddAliqPIS.AsValue := CadNf.vItem.vrDadosItem.aliq_pis_quant;
      eddBasePIS.AsValue := CadNf.vItem.vrDadosItem.quant_bc_pis;
    end
    else
    begin
      bt_it_pc_alterar_aliq_perc.Caption := '$';
      bt_it_pc_alterar_aliq_perc.Click;
      eddAliqPIS.AsValue := CadNf.vItem.vrDadosItem.aliq_pis;
      eddBasePIS.AsValue := CadNf.vItem.vrDadosItem.base_pis;
    end;
    eddValorPIS.AsValue := CadNf.vItem.vrDadosItem.valor_pis;

    if CadNf.vItem.vrDadosItem.aliq_cofins_quant > 0 then
    begin
      eddAliqCOFINS.AsValue := CadNf.vItem.vrDadosItem.aliq_cofins_quant;
    end
    else
    begin
      eddAliqCOFINS.AsValue := CadNf.vItem.vrDadosItem.aliq_cofins;
    end;
    eddValorCOFINS.AsValue := CadNf.vItem.vrDadosItem.valor_cofins;
    }
    
    eddBCII.AsValue      := CadNf.vItem.vrDadosItem.base_ii;
    eddDespAduII.AsValue := CadNf.vItem.vrDadosItem.valor_despadu_ii;
    eddIOFII.AsValue     := CadNf.vItem.vrDadosItem.valor_iof_ii;
    eddValorII.AsValue   := CadNf.vItem.vrDadosItem.valor_ii;

    eddCodANP.Text        := CadNf.vItem.vrDadosItem.comb_cprodanp;
    eddPMixGN.AsValue     := CadNf.vItem.vrDadosItem.comb_pmixgn;
    eddCODIF.Text         := CadNf.vItem.vrDadosItem.comb_codif;
    eddUFCons.Text        := CadNf.vItem.vrDadosItem.comb_ufcons;
    eddQAmb.AsValue       := CadNf.vItem.vrDadosItem.comb_qtemp;
    eddCIDE_Aliq.AsValue  := CadNf.vItem.vrDadosItem.comb_cide_valiqprod;
    eddCIDE_base.AsValue  := CadNf.vItem.vrDadosItem.comb_cide_qbcprod;
    eddCIDE_valor.AsValue := CadNf.vItem.vrDadosItem.comb_cide_vcide;
    edDescANP.Text        := CadNf.vItem.vrDadosItem.comb_descanp;
    edpGLP.AsValue        := CadNf.vItem.vrDadosItem.comb_pglp;
    edpGNn.AsValue        := CadNf.vItem.vrDadosItem.comb_pgnn;
    edpGNi.AsValue        := CadNf.vItem.vrDadosItem.comb_pgni;
    edvPart.AsValue       := CadNf.vItem.vrDadosItem.comb_vpart;

    eddXPedCompra.Text             := CadNf.vItem.vrDadosItem.xped_compra;
    eddNItemPedCompra.AsValue      := CadNf.vItem.vrDadosItem.nitemped_compra;
    eddItemDevolPercDevol.AsValue  := CadNf.vItem.vrDadosItem.nfe_pdevol;
    eddItemDevolVLIPIDevol.AsValue := CadNf.vItem.vrDadosItem.nfe_vipidevol;

    eddAntT.Text   := CadNf.vItem.vrDadosItem.antec_trib;

    pnPrecoVenda.Visible         := (vDadosIni.vEmp.vUsarAltPrecoNFDigItem = 'S') and (CadNf.campo_natureza_nf = 'E');
    eddPrecoVendaVarejo.AsValue  := IfThen(pnPrecoVenda.Visible, CadNf.vItem.vrDadosItem.prec_vnd_prod);
    eddPrecoVendaAtacado.AsValue := IfThen(pnPrecoVenda.Visible, CadNf.vItem.vrDadosItem.prec_vnd_proda);

//    eddEnqIPI.Text            := CadNf.vItem.vrDadosItem.cenq_ipi_nfe;
    eddCEST.Text              := CadNf.vItem.vrDadosItem.cest;
    eddvBCUFDest.AsValue      := CadNf.vItem.vrDadosItem.vbcufdest;
    eddpFCPUFDest.AsValue     := CadNf.vItem.vrDadosItem.pfcpufdest;
    eddpICMSUFDest.AsValue    := CadNf.vItem.vrDadosItem.picmsufdest;
    eddpICMSInter.AsValue     := CadNf.vItem.vrDadosItem.picmsinter;
    eddpICMSInterPart.AsValue := CadNf.vItem.vrDadosItem.picmsinterpart;
    eddvFCPUFDest.AsValue     := CadNf.vItem.vrDadosItem.vfcpufdest;
    eddvICMSUFDest.AsValue    := CadNf.vItem.vrDadosItem.vicmsufdest;
    eddvICMSUFRemet.AsValue   := CadNf.vItem.vrDadosItem.vicmsufremet;
    edcean.Text               := CadNf.vItem.vrDadosItem.cean;

    with CadNf.vItem.vrDadosItem do
    begin
      ed_rateio_desconto.AsValue := rateio_desconto;
      ed_rateio_seguro.AsValue   := rateio_seguro;
      ed_rateio_outdesp.AsValue  := rateio_outdesp;
      ed_rateio_frete.AsValue    := rateio_frete;
      ed_rateio_desp_pf.AsValue  := rateio_desp_pf;
    end;

    if pnEstoqueItemNfSaida.Visible then
    begin
      querEst := CadNf.vItem.vProd.GetQueryEstoque(
        CadNf.vItem.vrDadosItem.grupo_prod,
        CadNf.vItem.vrDadosItem.cod_prod,
        CadNf.vItem.vrDadosItem.cod_grade);

      lbEstoqueItemNfSaida.Caption := Format('%0.3n/%0.3n', [querEst.ffloat('estoque'), querEst.ffloat('est_f')]);
      lbEstoqueItemNfSaida.Hint    := Format('Disponível %0.3n / Físico %0.3n', [querEst.ffloat('estoque'), querEst.ffloat('est_f')]);
      pnEstoqueItemNfSaida.Hint    := lbEstoqueItemNfSaida.Hint;
    end;
  except
  end;
end;

procedure TfrmCadNF.getCamposMargem;
begin
  edPrecoV.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
  edPrecoA.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
  edPreco30.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
  edPreco60.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
  edPreco90.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
  edMarkUpV.FormatSize := '0.' + IntToStr(vDadosIni.vProduto.Precos.DigMrkMrg);
  edMarkUpA.FormatSize := '0.' + IntToStr(vDadosIni.vProduto.Precos.DigMrkMrg);
  //
  if vDadosIni.vProduto.Precos.UsarMargemAoMarkup then
  begin                                      
    edMarkUpV.AsValue := CadNf.vItem.MargemObtidaV;
    edMarkUpA.AsValue := CadNf.vItem.MargemObtidaA;
  end
  else
  begin
    edMarkUpV.AsValue := CadNf.vItem.MarkUpV;
    edMarkUpA.AsValue := CadNf.vItem.MarkUpA;
  end;
  edPrecoV.AsValue := CadNf.vItem.PrecoV;
  edPrecoA.AsValue := CadNf.vItem.PrecoA;
  edPreco30.AsValue := CadNf.vItem.Preco30;
  edPreco60.AsValue := CadNf.vItem.Preco60;
  edPreco90.AsValue := CadNf.vItem.Preco90;

  edVEMK.AsValue := CadNf.vItem.MarkUpEsperadoV;
  edVEMM.AsValue := CadNf.vItem.MargemEsperadaV;
  edVOMK.AsValue := CadNf.vItem.MarkUpV;
  edVOMM.AsValue := CadNf.vItem.MargemObtidaV;

  edAEMK.AsValue := CadNf.vItem.MarkUpEsperadoA;
  edAEMM.AsValue := CadNf.vItem.MargemEsperadaA;
  edAOMK.AsValue := CadNf.vItem.MarkUpA;
  edAOMM.AsValue := CadNf.vItem.MargemObtidaA;

  edVOMK.Font.Color := CadNf.vItem.getCorCampo('V', 'MK');
  edVOMM.Font.Color := CadNf.vItem.getCorCampo('V', 'MM');

  edAOMK.Font.Color := CadNf.vItem.getCorCampo('A', 'MK');
  edAOMM.Font.Color := CadNf.vItem.getCorCampo('A', 'MM');

  lbPrecoVarejoAtual.Caption  := Format('%0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais) + 'n', [CadNf.vItem.PrecoAtualVarejo]);
  lbPrecoAtacadoAtual.Caption := Format('%0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais) + 'n', [CadNf.vItem.PrecoAtualAtacado]);
end;

procedure TfrmCadNF.getCamposOutrasNF;
var
  I: Integer;
begin
  try
    getCampos;

    edOnCodigo.Text := CadNf.vItem.vrDadosItem.num_fab_prod;
    edOnQtde.AsValue := CadNf.vItem.vrDadosItem.quantidade;
    edOnReferencia.Text := CadNf.vItem.vrDadosItem.referencia;
    edOnValorUnitario.AsValue := CadNf.vItem.vrDadosItem.valor_unitario;
    //edOnPercentualDesconto.AsValue := CadNf.vItem.vrDadosItem.perc_desconto;
    edo_valor_total.AsValue := CadNf.vItem.vrDadosItem.valor_total;
    edOnCFOP.AsValue := CadNf.vItem.vrDadosItem.codigo_nop;
    edOnCST.Text := CadNf.vItem.vrDadosItem.cst;
    edOnNCM.Text := CadNf.vItem.vrDadosItem.ncm;
    edOnCSOSN.Text := CadNf.vItem.vrDadosItem.csosn;
    edOnRedBaseICM.AsValue := CadNf.vItem.vrDadosItem.perc_red_prod;
    edOnAliqICMSub.AsValue := CadNf.vItem.vrDadosItem.aliq_icmsub;
    edonMVA.AsValue := CadNf.vItem.vrDadosItem.mva;
    edOnBaseICMSub.AsValue := CadNf.vItem.vrDadosItem.base_icmsub;
    ckonAnt_calc.Checked := vDadosIni.IfThen(CadNf.vItem.vrDadosItem.ant_calc = 'D', True, False);
    edoAntT.Enabled := not ckonAnt_calc.Checked;
//    edOnAliqIPI.AsValue := CadNf.vItem.vrDadosItem.aliq_ipi;
//    edOnRedBaseIPI.AsValue := CadNf.vItem.vrDadosItem.perc_red_ipi;
//    edOnBaseIPI.AsValue := CadNf.vItem.vrDadosItem.base_ipi;
//    edOnValorIPI.AsValue := CadNf.vItem.vrDadosItem.valor_ipi;
    edOnRedBaseST.AsValue := CadNf.vItem.vrDadosItem.perc_red_prod_sub;
    edOnValorST.AsValue := CadNf.vItem.vrDadosItem.valor_icmsub;
    edOnDescricaoOutras.Lines.Text := CadNf.vItem.vrDadosItem.descricao_item_outras.Text;

    if Trim(CadNf.vItem.vrDadosItem.cst_pis) = '' then
      edoCSTPIS.ItemIndex := -1
    else
      for I := 0 to edoCSTPIS.Items.Count - 1 do
        if Copy(edoCSTPIS.Items[I],1,2) = CadNf.vItem.vrDadosItem.cst_pis then
          edoCSTPIS.ItemIndex := I;

//    if Trim(CadNf.vItem.vrDadosItem.cst_cofins) = '' then
//      edoCSTCOFINS.ItemIndex := -1
//    else
//      for I := 0 to edoCSTCOFINS.Items.Count - 1 do
//        if Copy(edoCSTCOFINS.Items[I],1,2) = CadNf.vItem.vrDadosItem.cst_cofins then
//          edoCSTCOFINS.ItemIndex := I;

    if CadNf.vItem.vrDadosItem.aliq_pis_quant > 0 then
    begin
      SpeedButton45.Caption := '%';
      SpeedButton45.Click;
      edoAliqPIS.AsValue := CadNf.vItem.vrDadosItem.aliq_pis_quant;
      edoBasePIS.AsValue := CadNf.vItem.vrDadosItem.quant_bc_pis;
    end
    else
    begin
      SpeedButton45.Caption := '$';
      SpeedButton45.Click;
      edoAliqPIS.AsValue := CadNf.vItem.vrDadosItem.aliq_pis;
      edoBasePIS.AsValue := CadNf.vItem.vrDadosItem.base_pis;
    end;
    edoValorPIS.AsValue := CadNf.vItem.vrDadosItem.valor_pis;

    if CadNf.vItem.vrDadosItem.aliq_cofins_quant > 0 then
    begin
      edoAliqCOFINS.AsValue := CadNf.vItem.vrDadosItem.aliq_cofins_quant;
    end
    else
    begin
      edoAliqCOFINS.AsValue := CadNf.vItem.vrDadosItem.aliq_cofins;
    end;
    edoValorCOFINS.AsValue := CadNf.vItem.vrDadosItem.valor_cofins;

    edoBCII.AsValue := CadNf.vItem.vrDadosItem.base_ii;
    edoDespAduII.AsValue := CadNf.vItem.vrDadosItem.valor_despadu_ii;
    edoIOFII.AsValue := CadNf.vItem.vrDadosItem.valor_iof_ii;
    edoValorII.AsValue := CadNf.vItem.vrDadosItem.valor_ii;

    edoCodANP.Text        := CadNf.vItem.vrDadosItem.comb_cprodanp;
    edoPMixGN.AsValue     := CadNf.vItem.vrDadosItem.comb_pmixgn;
    edoCODIF.Text         := CadNf.vItem.vrDadosItem.comb_codif;
    edoUFCons.Text        := CadNf.vItem.vrDadosItem.comb_ufcons;
    edoQAmb.AsValue       := CadNf.vItem.vrDadosItem.comb_qtemp;
    edoCIDE_Aliq.AsValue  := CadNf.vItem.vrDadosItem.comb_cide_valiqprod;
    edoCIDE_base.AsValue  := CadNf.vItem.vrDadosItem.comb_cide_qbcprod;
    edoCIDE_valor.AsValue := CadNf.vItem.vrDadosItem.comb_cide_vcide;
    edoDescANP.Text       := CadNf.vItem.vrDadosItem.comb_descanp;
    edopGLP.AsValue       := CadNf.vItem.vrDadosItem.comb_pglp;
    edopGNn.AsValue       := CadNf.vItem.vrDadosItem.comb_pgnn;
    edopGNi.AsValue       := CadNf.vItem.vrDadosItem.comb_pgni;
    edovPart.AsValue      := CadNf.vItem.vrDadosItem.comb_vpart;

    edoXPedCompra.Text := CadNf.vItem.vrDadosItem.xped_compra;
    edoNItemPedCompra.AsValue := CadNf.vItem.vrDadosItem.nitemped_compra;
    edoItemDevolPercDevol.AsValue := CadNf.vItem.vrDadosItem.nfe_pdevol;
    edoItemDevolVLIPIDevol.AsValue := CadNf.vItem.vrDadosItem.nfe_vipidevol;
//    edoCSTIPI.Text := CadNf.vItem.vrDadosItem.cst_ipi;

    edoAntT.Text := CadNf.vItem.vrDadosItem.antec_trib;

//    edoEnqIPI.Text := CadNf.vItem.vrDadosItem.cenq_ipi_nfe;
    edoCEST.Text := CadNf.vItem.vrDadosItem.cest;
//    edoEnqIPI.Text := CadNf.vItem.vrDadosItem.cenq_ipi_nfe;
    edoCEST.Text := CadNf.vItem.vrDadosItem.cest;
    edovBCUFDest.AsValue := CadNf.vItem.vrDadosItem.vbcufdest;
    edopFCPUFDest.AsValue := CadNf.vItem.vrDadosItem.pfcpufdest;
    edopICMSUFDest.AsValue := CadNf.vItem.vrDadosItem.picmsufdest;
    edopICMSInter.AsValue := CadNf.vItem.vrDadosItem.picmsinter;
    edopICMSInterPart.AsValue := CadNf.vItem.vrDadosItem.picmsinterpart;
    edovFCPUFDest.AsValue := CadNf.vItem.vrDadosItem.vfcpufdest;
    edovICMSUFDest.AsValue := CadNf.vItem.vrDadosItem.vicmsufdest;
    edovICMSUFRemet.AsValue := CadNf.vItem.vrDadosItem.vicmsufremet;
    edocean.Text := CadNf.vItem.vrDadosItem.cean;

    if (Trim(CadNf.vItem.vrDadosItem.csosn) <> '') and (CadNf.campo_natureza_nf = 'S') and
      (CadNf.fdif('devolucao', 'SIM')) then
    begin
      edOnValorICM.AsValue := CadNf.vItem.vrDadosItem.valor_icm_simples;
      edOnAliqICM.AsValue := CadNf.vItem.vrDadosItem.aliq_icm_simples;
      edOnBaseICM.AsValue := CadNf.vItem.vrDadosItem.base_icm_simples;
    end
    else
    begin
      edOnValorICM.AsValue := CadNf.vItem.vrDadosItem.valor_icm;
      edOnAliqICM.AsValue := CadNf.vItem.vrDadosItem.aliq_icm;
      edOnBaseICM.AsValue := CadNf.vItem.vrDadosItem.base_icm;
    end;

    with CadNf.vItem.vrDadosItem do
    begin
      edo_rateio_desconto.AsValue := rateio_desconto;
      edo_rateio_seguro.AsValue   := rateio_seguro;
      edo_rateio_outdesp.AsValue  := rateio_outdesp;
      edo_rateio_frete.AsValue    := rateio_frete;
    end;

  except
  end;
end;

procedure TfrmCadNF.getDadosFormularioMontarNfComando;
begin
  edComandoChassi.Text := RegistroWin.Read(Self.ClassName, edComandoChassi.Name, '');
  edNomeClienteComando.Text := RegistroWin.Read(Self.ClassName, edNomeClienteComando.Name, '');
  edClienteComando.AsValue := RegistroWin.Read(Self.ClassName, edClienteComando.Name, Integer(0));
  edDataIniComando.Text := RegistroWin.Read(Self.ClassName, edDataIniComando.Name, '');
  edDataFimComando.Text := RegistroWin.Read(Self.ClassName, edDataFimComando.Name, '');
end;

procedure TfrmCadNF.getDadosFormularioMontarNfPedCompra;
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2º. ParÃ¢metro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      edNpedPC.AsValue := Registro.ReadInteger(edNpedPC.Name);
      edDataIniPC.Text := Registro.ReadString(edDataIniPC.Name);
      edDataFimPC.Text := Registro.ReadString(edDataFimPC.Name);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmCadNF.getDadosFormularioMontarNfPedVenda;
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2º. ParÃ¢metro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      ckReqPV.Checked := Registro.ReadBool(ckReqPV.Name);
      ckOSPV.Checked := Registro.ReadBool(ckOSPV.Name);
      ckValorNf.Checked := Registro.ReadBool(ckValorNf.Name);
      edNPedVenda.AsValue := Registro.ReadInteger(edNPedVenda.Name);
      edDataIniPV.Text := Registro.ReadString(edDataIniPV.Name);
      edDataFimPV.Text := Registro.ReadString(edDataFimPV.Name);
      edCodClForPedVenda.AsValue := Registro.ReadFloat(edCodClForPedVenda.Name);
      //ckPVApenasComCupomFiscal.Checked := Registro.ReadBool(ckPVApenasComCupomFiscal.Name);
      //ckVendasVAN.Checked := Registro.ReadBool(ckVendasVAN.Name);
      ckEsconderNotas.Checked := Registro.ReadBool(ckEsconderNotas.Name);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmCadNF.getDadosFormularioMontarNfTransito;
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2º. ParÃ¢metro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      edDataIniTrans.Text := Registro.ReadString(edDataIniTrans.Name);
      edDataFimTrans.Text := Registro.ReadString(edDataFimTrans.Name);
      edNumNFChassiTrans.Text := Registro.ReadString(edNumNFChassiTrans.Name);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmCadNF.getFaturas;
var
  I: Integer;
begin
  try
    ListBox1.Clear;
    for I := 0 to CadNf.Fatura.parcelas - 1 do
      ListBox1.Items.Add(
        CadNf.Fatura.vencimentoDocumento[i] + '   -   ' +
        CadNf.Fatura.numeroDocumento[i] + '   -   ' +
        Format('%12.2n',
        [CadNf.Fatura.valorDocumento[i]])
        );
    ListBox2.Items := ListBox1.Items;
    ListBox3.Items := ListBox1.Items;
  except
  end;
end;

procedure TfrmCadNF.habilitaCamposCadastroNotaFiscal;
var
  vHabEmbalagem, isEmissaoPropria: Boolean;
  ACol: TColumn;
  I: Integer;
  Astr: string;
  tributosRTC: TributoDFeContextEtd;
begin
  ConfBC_PISCOFINS.Visible := False; // já que no sped recalcula, to tirando daqui para não dar confusao

  isEmissaoPropria := CadNf.fequals('emissao_propria', 'S');

  //pnNotaFiscal.Parent     := tsNotaFiscal;
  Panel4.Parent           := tsnf_Invisivel;
  pnNotaFiscal.TabOrder   := 0;
  groupItensNota.TabOrder := IfThen(CadNf.campo_natureza_nf = 'S', 1, 2);
  groupTotais.TabOrder    := IfThen(CadNf.campo_natureza_nf = 'S', 2, 1);

  pnCadastroItensVeiculos.parent               := tsDadosNfVeic;
  pnConsultaItensVeiculos.parent         := tsDadosNfVeic;
  pnItensOutrasNF.parent         := tsOutras;
  pnItesProdutosDetalhado.parent := tsProdutosDetalhado;
  groupItensNota.Caption         := 'Itens da Nota Fiscal';
  btCalcularNf.Enabled           := True;

  ckVerificarMudCFOP.Visible := ((CadNf.campo_natureza_nf = 'S') or CadNf.Config.Conf_Geral.nf_mudanca_cfop_com_opcoes) and (CadNf.dataSet.FieldByName('tipo_nf').AsString = 'P') and (CadNf.dataSet.FieldByName('COD_PRODUCAO_MP').AsInteger = 0);
  DBLookupComboBox1.Enabled := True;
  if (vDadosIni.vEmp.vUsarUmaVendaPorNF = 'S') and (CadNf.campo_natureza_nf = 'S') and
    (CadNf.dataSet.FieldByName('nped').AsInteger > 0) and (CadNf.dataSet.FieldByName('tipo_ped').AsString = 'REQ') then
    DBLookupComboBox1.Enabled := False;
  ckConsumidorFinal.Visible := isEmissaoPropria;

  if (CadNf.campo_natureza_nf = 'E') then
    if CadNf.Config.Conf_Geral.nf_e_add_calc_recomposicao_ao_custo then// o sistema NAO esta habilitado para calcular a recomposicao
    begin
      ACol := nil;
      for I := 0 to DBGrid13.Columns.Count - 1 do
        if DBGrid13.Columns.Items[I].FieldName = 'ICMS_RECOMPOSICAO' then
        begin
          ACol := DBGrid13.Columns.Items[I];
          Break;
        end;
      if not Assigned(ACol) then
      begin
        ACol := DBGrid13.Columns.Add;
        ACol.FieldName := 'ICMS_RECOMPOSICAO';
        ACol.Index := DBGrid13.Columns.Count - 1;
        ACol.ButtonStyle := cbsEllipsis;
      end;

      ACol := nil;
      for I := 0 to DBGrid12.Columns.Count - 1 do
        if DBGrid12.Columns.Items[I].FieldName = 'ICMS_RECOMPOSICAO' then
        begin
          ACol := DBGrid12.Columns.Items[I];
          Break;
        end;
      if not Assigned(ACol) then
      begin
        ACol := DBGrid12.Columns.Add;
        ACol.FieldName := 'ICMS_RECOMPOSICAO';
        ACol.Index := DBGrid12.Columns.Count - 1;
        ACol.ButtonStyle := cbsEllipsis;
      end;
      DBGrid12.OnEditButtonClick := gridItensButtonClick;
      DBGrid13.OnEditButtonClick := gridItensButtonClick;
    end;

  for I := 0 to DBGrid13.Columns.Count - 1 do
    if DBGrid13.Columns.Items[I].FieldName = 'ESPELHO_CALC' then
      DBGrid13.Columns.Items[I].ButtonStyle := cbsEllipsis;

  if vDadosIni.vEmp.vRegime <> 'SIMPLES' then
    for I := 0 to DBGrid13.Columns.Count - 1 do
      if MatchText(DBGrid13.Columns.Items[I].FieldName, ['CSOSN', 'ALIQ_ICM_SIMPLES', 'BASE_ICM_SIMPLES', 'VALOR_ICM_SIMPLES']) then
        DBGrid13.Columns.Items[I].Visible := False;

  DBEdit44.Enabled         := isEmissaoPropria and not CadNf.fequals('tpimp', Ord(fidSimplificadoTipo2));
  DBEdit180.Enabled        := DBEdit44.Enabled;
  DBEdit45.Enabled         := CadNf.campo_natureza_nf = 'E';
  DBEdit46.Enabled         := CadNf.campo_natureza_nf = 'E';
  dbeHoraEmissao.Enabled   := CadNf.campo_natureza_nf = 'E';
  Label134.Enabled         := CadNf.campo_natureza_nf = 'E';
  ckfrete_f_nfe.Enabled    := CadNf.campo_natureza_nf = 'E';
  cktot_com_deson.Visible  := (CadNf.campo_natureza_nf = 'E') or (CadNf.campo_natureza_nf = 'S');
  ckfrete_f_nfe2.Enabled   := ckfrete_f_nfe.Enabled;
  edcod_devolucao.Enabled  := (CadNf.campo_natureza_nf = 'E') and (copy(CadNf.dataSet.FieldByName('devolucao').AsString , 1, 1) = 'S');
  ednum_ped.Enabled        := (CadNf.campo_natureza_nf = 'E');
  edcod_carga.Enabled      := (CadNf.campo_natureza_nf = 'S') and (vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D') and (vDadosIni.vEmp.vOC_TipoControleOrdemC = 'NF');
  //Habilitando campo de Aliq de ICMS quando Entrada e desabilitando quando SImples
  DBEdit39.Enabled         := (CadNf.campo_natureza_nf = 'E') or (vDadosIni.vEmp.vRegime <> 'SIMPLES') or CadNf.fdif('tipo_emissao', '1'); 
  eddAliqICM.Enabled       := DBEdit39.Enabled;

  buildCadastroCamposCalculoICMSSN;

  if copy(CadNf.dataSet.FieldByName('devolucao').AsString , 1, 1) = 'S' then
  begin
    eddAliqICM.Enabled     := True;
    DBEdit39.Enabled       := True;
  end;
  CadNf.fValorNotaAlterado := False;

  DBEdit55.Enabled         := DBEdit39.Enabled;

  //uso de embalagens na entrada de nota fiscal
  vHabEmbalagem            := (CadNf.campo_natureza_nf = 'E') and (CadNf.Config.Conf_Geral.nf_e_hab_conversao_embalagem_produto) and (CadNf.f_int('id_ajuste') = 0);
  eddUnidade_nf.Enabled    := vHabEmbalagem;
  eddQTDEMB_old.Enabled        := vHabEmbalagem;
  eddQTDEMBREC.Enabled     := vHabEmbalagem;
  eddQtde.Enabled          := (not vHabEmbalagem) and (CadNf.f_int('id_ajuste') = 0); // quando embalagem ativada os campos de unidade sao desabilitados, sendo assim se for saida vai ser sempre habilitado
  eddValorTotal.Enabled    := CadNf.Config.Conf_Geral.nf_hab_digitacao_valor_total; // quando o valor total for habilitado os campos de valor unitario sao desativados
  eddValorUnitario.Enabled := (not eddValorTotal.Enabled) and (not vHabEmbalagem);
  eddVLREMBNF.Enabled      := (not eddValorTotal.Enabled) and (vHabEmbalagem);
  if not vHabEmbalagem  then
  begin
    btnLockEmb.Tag       := 0;
    btnLockEmb.Visible   := False;
    btnUnlockEmb.Visible := False;
  end
  else
  begin
    btnLockEmb.Tag       := 1;
    btnLockEmb.Visible   := not vHabEmbalagem;
    btnUnlockEmb.Visible := vHabEmbalagem;
  end;
  btnLockEmb.Top  := btnUnlockEmb.Top;
  btnLockEmb.Left := btnUnlockEmb.Left;

  if eddValorTotal.Enabled then
    eddValorTotal.OnEnter := nil
  else
    eddValorTotal.OnEnter := campoEnterPerform;

  Label381.Visible            := vDadosIni.vMNF = 'S';
  eddMNF.Visible              := vDadosIni.vMNF = 'S';
  eddMNF.Enabled              := (CadNf.campo_natureza_nf = 'E') ;
  spEmbalagemMNF.Enabled      := (CadNf.campo_natureza_nf = 'E') ;
  tsChaveNFe.TabVisible       := (CadNf.campo_modelo_nf = '55') and not isEmissaoPropria;
  BitBtn83.Visible            := (Self.Tag = 21) and (CadNf.campo_situacao_nfe = sitAutorizada);
  SpeedButton39.Visible       := not isEmissaoPropria;
  DBEdit279.Enabled           := CadNf.dataSet.FieldByName('tipo_nf').AsString = 'D';
  DBEdit305.Enabled           := (vDadosIni.StrZero(CadNf.campo_modelo_nf, 3) = '001') or (vDadosIni.StrZero(CadNf.campo_modelo_nf, 3) = '01A') or (vDadosIni.StrZero(CadNf.campo_modelo_nf, 3) = '1-A');
  DBComboBox5.Visible         := False;
  BitBtn106.Enabled           := False;
  lbCarga.Enabled             := edcod_carga.Enabled;

  DBEdit1.OnEnter             := nil;
  DBEdit66.OnEnter            := nil;
  edtvalor_total2.PopupMenu   := nil;

  dbcbVeicModBCST.Enabled     := CadNf.campo_natureza_nf = 'E';
  edtvalor_acres_fin.Enabled  := CadNf.campo_natureza_nf = 'E';
  edtvalor_acres_fin2.Enabled := edtvalor_acres_fin.Enabled;
  lbtvalor_acres_fin.Visible  := CadNf.campo_natureza_nf = 'E';
  edtvalor_serv.Visible       := (CadNf.campo_natureza_nf = 'E') and (CadNf.dataSet.FieldByName('tipo_nf').AsString = 'S');
  lbtvalor_serv.Visible       := edtvalor_serv.Visible;
  edtvalor_serv2.Visible      := edtvalor_serv.Visible;
  lbtvalor_serv2.Visible      := edtvalor_serv.Visible;
  edtvalor_desp_pf.Visible    := CadNf.campo_natureza_nf = 'E';
  lbtvalor_desp_pf.Visible    := edtvalor_desp_pf.Visible;
  edtvalor_desp_pf2.Visible   := edtvalor_desp_pf.Visible;
  lbtvalor_desp_pf2.Visible   := edtvalor_desp_pf.Visible;
  if CadNf.fstr('tipo_nf') <> 'S' then
  begin
    edtvalor_serv2.DataField    := 'VICMDESON';
    lbtvalor_serv2.Caption      := 'Desoneração';
    edtvalor_serv2.Visible      := True;
    lbtvalor_serv2.Visible      := True;
  end
  else
  begin
    edtvalor_serv2.DataField    := 'VALOR_SERV';
    lbtvalor_serv2.Caption      := 'Valor Serviços';
  end;

  //Eventos dos campos
  if CadNf.campo_natureza_nf = 'E' then
  begin
    dbeIRRF.OnEnter            := campoEnterPerform;
    lkcod_vendedor.OnEnter     := campoEnterPerform;
    ednum_nf.OnEnter           := nil;
    edserie.OnEnter            := nil;
    edmodelo_nf.OnEnter        := nil;
    edtbase_icm.OnEnter        := nil;
    edtvalor_icm.OnEnter       := nil;
    edtbase_icmsub.OnEnter     := nil;
    edtvalor_icmsub.OnEnter    := nil;
    edtvalor_prod.OnEnter      := nil;
    edtvalor_serv.OnEnter      := nil;
    edtvalor_total.OnEnter     := nil;
    edtvalor_ipi.OnEnter       := nil;
    edtvalor_acres_fin.OnEnter := nil;
    if (CadNf.campo_num_gerado = 'S') then
    begin
      ednum_nf.OnEnter    := campoEnterPerform;
      edserie.OnEnter     := campoEnterPerform;
      edmodelo_nf.OnEnter := campoEnterPerform;
    end;
  end
  else
  begin
    //Eventos dos campos
    dbeIRRF.OnEnter            := nil;
    lkcod_vendedor.OnEnter     := nil;
    ednum_nf.OnEnter           := campoEnterPerform;
    edserie.OnEnter            := campoEnterPerform;
    edmodelo_nf.OnEnter        := campoEnterPerform;
    edtbase_icm.OnEnter        := campoEnterPerform;
    edtvalor_icm.OnEnter       := campoEnterPerform;
    edtbase_icmsub.OnEnter     := campoEnterPerform;
    edtvalor_icmsub.OnEnter    := campoEnterPerform;
    edtvalor_prod.OnEnter      := campoEnterPerform;
    edtvalor_serv.OnEnter      := campoEnterPerform;
    edtvalor_total.OnEnter     := campoEnterPerform;
    edtvalor_ipi.OnEnter       := campoEnterPerform;
    edtvalor_acres_fin.OnEnter := campoEnterPerform;
    if (CadNf.dataSet.FieldByName('tipo_nf').AsString = 'V') and
      (CadNf.dataSet.FieldByName('n_comando').AsInteger  > 0) then
    begin
      DBEdit1.OnEnter  := campoEnterPerform;
      DBEdit66.OnEnter := campoEnterPerform;
    end;
  end;
  edtbase_icm2.OnEnter        := edtbase_icm.OnEnter;
  edtvalor_icm2.OnEnter       := edtvalor_icm.OnEnter;
  edtbase_icmsub2.OnEnter     := edtbase_icmsub.OnEnter;
  edtvalor_icmsub2.OnEnter    := edtvalor_icmsub.OnEnter;
  edtvalor_prod2.OnEnter      := edtvalor_prod.OnEnter;
  edtvalor_serv2.OnEnter      := edtvalor_serv.OnEnter;
  edtvalor_total2.OnEnter     := edtvalor_total.OnEnter;
  edtvalor_ipi2.OnEnter       := edtvalor_ipi.OnEnter;
  edtvalor_acres_fin2.OnEnter := edtvalor_acres_fin.OnEnter;

  if CadNf.campo_natureza_nf = 'E' then
  begin
    tsFaturas.TabVisible         := False;
    Label77.Caption              := ' Usuário:';
    eddValorUnitario.FormatSize  := '0.10';
    eddVLREMBNF.FormatSize       := '0.10';
    edOnValorUnitario.FormatSize := '0.10';
    groupTotais.Align            := alTop;
    Self.Caption                 := 'Notas Fiscais [ Entrada ';
  end
  else
  begin
    edtvalor_total2.PopupMenu    := PopupMenu5;
    tsFaturas.TabVisible         := true;
    ckUsarValorDoPedido.Visible  := (vDadosIni.vEmp.vNfUsarFormaPagDoPed = 'N') and (CadNf.Config.Conf_Geral.nf_habilitar_fat_usar_valor_ped);
    ckUsarValorDoPedido2.Visible := ckUsarValorDoPedido.Visible;

    //desabilitando somente para não chamar o processo no evento click
    ckUsarValorDoPedido.Enabled  := False;
    ckUsarValorDoPedido2.Enabled := ckUsarValorDoPedido.Enabled;

    ckUsarValorDoPedido.Checked  := ckUsarValorDoPedido.Visible and CadNf.Fatura.UsarValorDoPedido;
    ckUsarValorDoPedido2.Checked := ckUsarValorDoPedido.Checked;

    ckUsarValorDoPedido.Enabled  := True;
    ckUsarValorDoPedido2.Enabled := ckUsarValorDoPedido.Enabled;
//    if not ckUsarValorDoPedido.Visible then
//    begin
//      ckUsarValorDoPedido.Visible  := vDadosIni.getConfSisBool('nf_habilitar_fat_usar_valor_ped', CadNf.buscas);
//      ckUsarValorDoPedido2.Visible := ckUsarValorDoPedido.Visible;
//    end;
    Label77.Caption := 'Vendedor:';
    if vDadosIni.vEmp.vCasasDecimais > 0 then
    begin
      if (CadNf.f_int('COD_PRODUCAO_MP') > 0) or CadNf.fdif('tipo_emissao', '1') then // Caso ajuste,complementar ou devolucao
        eddValorUnitario.FormatSize := '0.6'
      else if eddValorTotal.Enabled then
        eddValorUnitario.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais + 1)// apenas para evitar erros de arredondamento, pois o campo vai ficar desabilitado mesmo
      else
        eddValorUnitario.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
      edOnValorUnitario.FormatSize := '0.6';//edOnValorUnitario.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
    end;
    groupTotais.Align           := alBottom;
    Self.Caption                := 'Notas Fiscais [ Saída ';
  end;

  eddNumFabFornecedor.Visible  := CadNf.fequals('tipo_nf', 'P') and CadNf.fequals('natureza_nf', 'E');
  eddNumFab.Left               := IfThen(eddNumFabFornecedor.Visible, 271, 188);
  eddNumFab.Width              := IfThen(eddNumFabFornecedor.Visible,  90, 174);
  Label246.Caption             := IfThen(CadNf.fequals('tipo_nf', 'P'), 'Cód/Fornc/Codigo:', 'Código/Descrição:');

  tsMerc_PISCOFINS.Enabled    := True;
  tsMerc_PISCOFINS.TabVisible := True;
  tsnf_NFServico.TabVisible := False;
  DBComboBox23.Enabled      := True;
  Label45.Caption           := 'Valor Produtos';

  AntecipaotributriadeICMS1.Visible := CadNf.fequals('natureza_nf', 'E');

  if CadNf.fstrin('tipo_nf', ['P', 'S', 'O']) then
  begin
    Self.Caption := Self.Caption + IfThen(CadNf.fequals('tipo_nf', 'O'), 'de Outras Notas Fiscais ]', 'de Produtos e/ou Serviços ]');


    if CadNf.fequals('tipo_nf', 'P') then
      edmodelo_nf.Hint := 'Modelos Válidos: 1, 1A, 4 e 55'
    else if CadNf.fequals('tipo_nf', 'O') then
      edmodelo_nf.Hint := 'Modelos Válidos: 1, 1A, 4 e 55'
    else
      edmodelo_nf.Hint := 'Modelos Válidos: "E" e "O"';

    tsnf_NFServico.TabVisible             := CadNf.fequals('tipo_nf', 'S');
    DBComboBox23.Enabled                  := not (CadNf.campo_modelo_nf = 'E');
    FrameIbsCbs1.Parent                   := ScrollBoxIbsCbsFrameProd;
    pnItesProdutosDetalhado.parent        := groupItensNota;
    pnItesProdutosDetalhado.Align         := alClient;
    pnConsultaItensProdDetalhado.Align    := alClient;
    pnConsultaItensProdDetalhado.Visible  := True;
    pnConsultaItensProdDetalhado.Enabled  := True;
    pnCadastroItensProdDetalhado.Visible  := False;
    pnCadastroItensProdDetalhado.Enabled  := False;
    pnCadastroItensProdDetalhado.Align    := alClient;
    tsMerc_itens_outras.TabVisible        := CadNf.fequals('tipo_nf', 'O');
    tsMerc_Mercadorias.TabVisible         := CadNf.fdif('tipo_nf', 'O');
    btIncluirItemProdDetalhado.Visible    := CadNf.fdif('tipo_nf', 'S');
    btIncluirItemServicoDetalhado.Visible := CadNf.fdif('tipo_nf', 'O');
    btIncluirItemProdDetalhado.Caption    := Format('Incluir %s', [IfThen(CadNf.fequals('tipo_nf', 'O'), '&Item', '&Produto')]);
    btIncluirItemProdDetalhado.Hint       := Format('Incluir Item - [%s]', [IfThen(CadNf.fequals('tipo_nf', 'O'), 'NF0055', 'NF0047')]);
    btAlterarItemProdDetalhado.Hint       := Format('Alterar Item - [%s]', [IfThen(CadNf.fequals('tipo_nf', 'O'), 'NF0056', 'NF0048')]);

    getCamposDetalhado;

    if CadNf.fdif('tipo_nf', 'O') then
      if not (CadNf.produto and CadNf.servico) then
      begin
        eddTipo.OnEnter := campoEnterPerform;
        eddTipo.OnExit := nil;
        if CadNf.produto then
          eddTipo.Text := 'P'
        else
          eddTipo.Text := 'S';
      end
      else
      begin
        if CadNf.produto then
          eddTipo.Text := 'P'
        else
          eddTipo.Text := 'S';
        eddTipo.OnEnter := nil;
        eddTipo.OnExit := edDTipoExit;
      end;

    spbSairDetalhe.Visible                  :=False;
    spbAnterior.Visible                     :=False;
    spbProximo.Visible                      :=False;
    spbDetalharItem.Visible                 :=False;
    btSalvarItemProdServDetalhado.Enabled   :=True;
    btCancelarItemProdServDetalhado.Enabled :=True;
    spbDetalharItem.Visible                 := CadNf.notaFechada;

    tsMerc_ICMS.TabVisible                  := True;
    tsMerc_IPI.TabVisible                   := True;
    pnOutrosDadosItem.Parent                := tsMerc_Outros;
    pn_icms_entrada.Parent                  := tsMerc_ICMS_Entrada;

    //pn_icms_tributos.Parent                 := pnIcmsItensMerc;
    pg_icms_tributos.Parent                 := pnIcmsItensMerc;
    {
    gpICMSEfetivoItens.Parent               := pnIcmsItensMerc;
    pnFCPItens.Parent                       := pnIcmsItensMerc;
    gpICMSAnterior.Parent                   := pnIcmsItensMerc;
    }
    pnIPIItens.Parent                       := tsMerc_IPI;
  end
  else if CadNf.dataSet.FieldByName('tipo_nf').AsString = 'V' then
  begin
    Self.Caption                      := Self.Caption + 'de Veículos ]';
    edmodelo_nf.Hint                  := 'Modelos Válidos: 1, 1A e 55';
    VisualItemTributosRtcIgnorar();
    pnCadastroItensVeiculos.parent    := groupItensNota;
    pnConsultaItensVeiculos.parent    := groupItensNota;
    pnDetalhesItemVeiculo.Enabled     := CadNf.campo_natureza_nf = 'E';
    pnDetalhesItemVeiculoSaida.Visible := CadNf.campo_natureza_nf = 'S';
    btSalvarDetalhesVeiculo.Visible   := CadNf.campo_natureza_nf = 'E';
    btAlterarDetalhesVeiculos.Visible := CadNf.campo_natureza_nf = 'E';
    DBEdit65.Enabled                  := CadNf.dataSet.FieldByName('crt').AsString = '1';
    btAlterarItemVeiculo.Visible      := True;
    SpeedButton50.Visible             := False;
    SpeedButton51.Visible             := False;
    SpeedButton52.Visible             := False;
    SpeedButton53.Visible             := False;

    if FrameIbsCbsVeic1 = nil then
    begin
      FrameIbsCbsVeic1                 := TFrameIbsCbs.Create(Self);
      FrameIbsCbsVeic1.Name            := 'FrameIbsCbsVeic1';
      FrameIbsCbsVeic1.Parent          := ScrollBoxIbsCbsFrameVeic;
      FrameIbsCbsVeic1.Align           := alTop;
      FrameIbsCbsVeic1.CalculoCallBack := FrameIbsCbsCalculoItemDtSetCallBack;
    end;
    pnItensVeiculo.Enabled   := False;
    FrameIbsCbsVeic1.Enabled := False;

    if CadNf.campo_natureza_nf = 'E' then
    begin
      pnDetalheVeiculos.Height        := 405;
      DBEdit52.OnEnter                := nil;
      DBComboBox2.OnEnter             := nil;
      DBEdit65.OnEnter                := nil;
      pnConsultaItensVeiculos.parent  := groupItensNota;
      pnConsultaItensVeiculos.Align   := alClient;
      btAlterarItemVeiculo.Visible    := False;
      pnConsultaItensVeiculos.Visible := True;
      SpeedButton50.Visible           := CadNf.notaFechada;
    end
    else
    begin
      pnDetalheVeiculos.Height        := 477;
      DBEdit52.OnEnter                := campoEnterPerform;
      DBComboBox2.OnEnter             := campoEnterPerform;
      DBEdit65.OnEnter                := campoEnterPerform;
      pnItensVeiculo.Visible          := True;
      pnCadastroItensVeiculos.Visible := True;
      pnConsultaItensVeiculos.Visible := False;
      pageItensVeiculos.ActivePage    := tsVeic_Item;

      {$REGION 'Tributos da RTC'}

      //Como a nota de saida de veiculo fica sempre ativa entao precisa disso para deixar disponivel a aba
      tributosRTC := CadNf.vItem.GetStateTributoRTC();
      try
        if (tributosRTC = nil)
          or ( (tributosRTC.IbsCbs = nil) and (tributosRTC.ImpostoSeletivo = nil) )
        then
          FrameIbsCbsVeic1.Setup( nil )
        else
          FrameIbsCbsVeic1.Setup( tributosRTC.IbsCbs );

        FrameIbsCbsVeic1.Reset();
      finally
        tributosRTC.Free();
      end;

      {$ENDREGION}

    end;
    Panel22.Enabled := not CadNf.notaFechada;
    if CadNf.notaFechada then
    begin
      CadNf.vItem.vDetVeic.Cancel;
      CadNf.vItem.dataSet.Cancel;
      CadNf.dataSet.Cancel;
    end;
  end
  else if CadNf.dataSet.FieldByName('tipo_nf').AsString = 'O' then
  begin
    Self.Caption                    := Self.Caption + 'de Outras Notas Fiscais ]';
    edmodelo_nf.Hint                := 'Modelos Válidos: 1, 1A e 55';
    pnItensOutrasNF.parent          := groupItensNota;
    pnItensOutrasNF.Align           := alClient;
    pnConsultaItensOutrasNF.Align   := alClient;
    pnConsultaItensOutrasNF.Visible := True;
    pnCadastroItensOutrasNf.Visible := False;
    pnCadastroItensOutrasNf.Align   := alClient;

    pnOutrosDadosItem.Parent        := tsOut_Outros;
    pn_icms_entrada.Parent          := tsOut_ICMS_Entrada;

    //pn_icms_tributos.Parent         := pnIcmsItemOutras;
    pg_icms_tributos.Parent         := pnIcmsItemOutras;
    {
    gpICMSEfetivoItens.Parent       := pnIcmsItemOutras;
    pnFCPItens.Parent               := pnIcmsItemOutras;
    gpICMSAnterior.Parent           := pnIcmsItemOutras;
    }
    pnIcmsItemOutras.Height         := gpICMSAnterior.Top + gpICMSAnterior.Height + 10;
    pnIPIItens.Parent               := tsOut_IPI;
    getCamposOutrasNF;
  end
  else if CadNf.dataSet.FieldByName('tipo_nf').AsString = 'D' then
  begin
    Self.Caption                   := Self.Caption + 'de Despesas ]';
    edmodelo_nf.Hint               := 'Modelos Válidos: 6, 21 e 22';
    Label45.Caption                := 'Total dos Itens';
    pnItensDespesa.parent          := groupItensNota;
    pnItensDespesa.Align           := alClient;
    pnConsultaItensDespesa.Align   := alClient;
    pnConsultaItensDespesa.Visible := True;
    pnCadastroItensDespesa.Visible := False;
    pnCadastroItensDespesa.Align   := alClient;

    if FrameIbsCbsDesp1 = nil then
    begin
      FrameIbsCbsDesp1                 := TFrameIbsCbs.Create(Self);
      FrameIbsCbsDesp1.Name            := 'FrameIbsCbsDesp1';
      FrameIbsCbsDesp1.Parent          := ScrollBoxIbsCbsFrameDesp;
      FrameIbsCbsDesp1.Align           := alTop;
      FrameIbsCbsDesp1.CalculoCallBack := FrameIbsCbsCalculoItemDtSetCallBack;
    end;

  end
  else if CadNf.dataSet.FieldByName('tipo_nf').AsString = 'I' then
  begin
    pnItesProdutosDetalhado.parent       := groupItensNota;
    pnItesProdutosDetalhado.Align        := alClient;
    pnConsultaItensProdDetalhado.Align   := alClient;
    pnConsultaItensProdDetalhado.Visible := True;
    pnConsultaItensProdDetalhado.Enabled := True;
    pnCadastroItensProdDetalhado.Visible := False;
    pnCadastroItensProdDetalhado.Enabled := False;
    pnCadastroItensProdDetalhado.Align   := alClient;
  end
  else if CadNf.dataSet.FieldByName('tipo_nf').AsString = 'I' then
  begin
    if vDadosIni.vEmp.vNfe.ibgeCodCidade <> 3106200 then // Belo Horizonte
    begin
      Label599.Enabled := False;
      Label602.Enabled := False;
      Label603.Enabled := False;
      DBComboBox23.Enabled := False;
      DBComboBox24.Enabled := False;
      DBComboBox25.Enabled := False;
    end;
  end;

  BitBtn124.Enabled := CadNf.campo_natureza_nf = 'E';
  BitBtn134.Enabled := CadNf.campo_natureza_nf = 'E';

  eddValidade.Enabled           := (CadNf.campo_natureza_nf = 'E') and (CadNf.dataSet.FieldByName('tipo_nf').AsString = 'P');
  btCancelarDetalhesECF.Enabled := not CadNf.notaFechada;
  btSalvarDetalhesECF.Enabled   := not CadNf.notaFechada;

  ed_icm_pdif.Visible           := CadNf.fstr('import_xml') >= 'Ver002';
  lb_icm_pdif.Visible           := ed_icm_pdif.Visible;
  ed_icm_vdif.Visible           := ed_icm_pdif.Visible;
  lb_icm_vdif.Visible           := ed_icm_pdif.Visible;
  gp_fcp_diferido.Visible       := CadNf.fstr('import_xml') > 'Ver002';
  lb_dif_vicmsop.Visible        := gp_fcp_diferido.Visible;
  ed_dif_vicmsop.Visible        := gp_fcp_diferido.Visible;
  ed_icment_vbcfcpstret.Visible := gp_fcp_diferido.Visible;
  lb_icment_vbcfcpstret.Visible := gp_fcp_diferido.Visible;

  ed_icm_vicmop_dif.Visible     := gp_fcp_diferido.Visible;
  lb_icm_vicmop_dif.Visible     := gp_fcp_diferido.Visible;
  ed_icm_fcp_pdif.Visible       := gp_fcp_diferido.Visible;
  lb_icm_fcp_pdif.Visible       := gp_fcp_diferido.Visible;
  ed_icm_fcp_vdif.Visible       := gp_fcp_diferido.Visible;
  lb_icm_fcp_vdif.Visible       := gp_fcp_diferido.Visible;
  ed_icm_fcp_vfcpop.Visible     := gp_fcp_diferido.Visible;
  lb_icm_fcp_vfcpop.Visible     := gp_fcp_diferido.Visible;

  if CadNf.dataSet.FieldByName('COD_NF_REM_VFE').AsInteger > 0 then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('NF0179', 'HABILITAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
      CadNf.dataSet.FieldByName('COD_NF').AsString, CadNf.buscas, True) then
    begin
      btIncluirItemProdDetalhado.Enabled :=   False;
      btIncluirItemServicoDetalhado.Enabled := False;
    end
    else
    begin
      btIncluirItemProdDetalhado.Enabled := CadNf.produto;
      btIncluirItemServicoDetalhado.Enabled := CadNf.servico;
    end;
    btRemoverItemProdDetalhado.Enabled := (CadNf.campo_natureza_nf = 'S');
  end
  else
  begin
    btIncluirItemProdDetalhado.Enabled := CadNf.produto or CadNf.fequals('tipo_nf', 'O');
    btIncluirItemServicoDetalhado.Enabled := CadNf.servico;
    btRemoverItemProdDetalhado.Enabled := True;
  end;

  ckIgnorarTributosRTC.Enabled := CadNf.Auditor.Habilitar.InibirMensagens.Processo('NF0257', 'NUM NF '+ CadNf.fstr('NUM_NF'), CadNf.fstr('COD_NF')).Permitido;

  ckEmissaoPropria.Enabled := (CadNf.campo_natureza_nf = 'E') and
                              (CadNf.campo_num_gerado <> 'S') and
                              (CadNf.dataSet.FieldByName('tipo_nf').AsString <> 'D');

  ckConsumidorFinal.Enabled := ckConsumidorFinal.Visible and (CadNf.fstr('codigo_nop', 2, 3) <> '929');

  tsmaisnfe_mensagenssefaz.TabVisible := isEmissaoPropria;
  if isEmissaoPropria and AlertasDFeUtil.TryObterAlertasFormatado(CadNf.fstr('chave_nfe'), Astr) then
    edMemoAlertasSefaz.Lines.Text := Astr
  else
    edMemoAlertasSefaz.Lines.Text := '';

  getFaturas;
  PageControl1.ActivePage := TabSheet1;
  PageControl3.ActivePage := tsNotaFiscal;
  pgContDadosNF.ActivePage := tsDadosNF;

  btOutrosIntFisco.Enabled      := (CadNf.dataSet.FieldByName('cod_nf').AsInteger > 0);
  DadosdeColetaEntrega1.Enabled := CadNf.campo_natureza_nf = 'S';
  {
  if copy(CadNf.dataSet.FieldByName('devolucao').AsString , 1, 1) = 'S' then
    eddModBCST.Enabled := True
  else
    eddModBCST.Enabled := CadNf.campo_natureza_nf = 'E';
    }
  Panel96.Enabled := not CadNf.notaFechada;
  BitBtn107.Enabled := False;
//  btStatusNFe.Visible := (CadNf.campo_natureza_nf = 'S') and
//                         (CadNf.campo_situacao_nfe = sitEmProcessamento);
  Label474.Visible := (CadNf.campo_natureza_nf = 'E') and
                      (CadNf.dataSet.FieldByName('tipo_nf').AsString = 'O');
  DBComboBox17.Visible := (CadNf.campo_natureza_nf = 'E') and
                          (CadNf.dataSet.FieldByName('tipo_nf').AsString = 'O');
  if (CadNf.dataSet.FieldByName('TIPO_EMISSAO').AsString = '2') then
  begin
    DadosdeColetaEntrega1.Enabled := False;
    CuponsFiscaisReferenciados1.Enabled := False;
//    btImportarNfTransito.Enabled := False;
//    btImportarPedVenda.Enabled := False;
//    btImportarPedidoCompra.Enabled := False;
    Self.Caption := 'Notas Fiscais [ Nota Fiscal Complementar ]';
  end;
  if not isEmissaoPropria then
    edmodelo_nf.Enabled := Trim(CadNf.dataSet.FieldByName('chave_nfe').AsString) = '';

  if CadNf.campo_natureza_nf = 'S' then
    btEnviarNFe.Visible := (CadNf.campo_modelo_nf = '55') and isEmissaoPropria and
                           (CadNf.campo_status = stsFechada) and
                           (vDadosIni.strIn(CadNf.campo_situacao_nfe, [sitVazio ,sitEnviando, sitEmProcessamento, sitEmEPEC, sitContingencia, sitContingencia]))
  else
    btEnviarNFe.Visible := (CadNf.campo_modelo_nf = '55') and isEmissaoPropria and
                           (CadNf.campo_num_gerado = 'S') and
                           (vDadosIni.strIn(CadNf.campo_situacao_nfe, [sitVazio ,sitEnviando, sitEmProcessamento, sitEmEPEC]));

  btSalvarNF.Enabled := (CadNf.campo_cod_nf = 0) or (CadNf.campo_status = stsAberta) or
                        (vDadosIni.strIn(CadNf.campo_situacao_nfe, [sitVazio, sitRejeitada]));
  if (btSalvarNF.Enabled) and (CadNf.campo_natureza_nf = 'E') and isEmissaoPropria and
    (vDadosIni.strIn(CadNf.campo_situacao_nfe, [sitEnviando, sitEmProcessamento, sitAutorizada, sitDenegada, sitCancelada, sitInutilizada])) then
    btSalvarNF.Enabled := False
  else if (btSalvarNF.Enabled) and (CadNf.campo_natureza_nf = 'E') and not isEmissaoPropria and (CadNf.campo_status = stsFechada) then
    btSalvarNF.Enabled := False;
  btConfirmarNF.Enabled := CadNf.permiteConfirmacao;
  if btConfirmarNF.Enabled then
    btEnviarNFe.Visible := False;

  btfat_verificarimpressao.Visible := vDadosIni.strIn(CadNf.campo_situacao_nfe, [sitAutorizada, sitEmEPEC]);
  if btfat_verificarimpressao.Visible then
    btfat_verificarimpressao.Enabled := vDadosIni.PesqPros('NF0120', 'IMPRIMIR', 'NUM NF ' + IntToStr(CadNf.campo_num_nf),
                                                           'NOTAFISCAL', IntToStr(CadNf.campo_cod_nf), CadNf.buscas, False, False, True);

  if not Assigned(lkFinalidade.ListSource) then
    CadNf.lkFinalidade.setDadosDataSet(['1', '2', '3', '4'],
                                       ['1 - NF-e normal',
                                        '2 - NF-e complementar',
                                        '3 - NF-e de ajuste',
                                        '4 - Devolução de mercadoria'],
                                        lkFinalidade);

  // existe diferenca aqui da NFe pois foi feito no padrão da EFD q mudou posteriormente, entao permanecemos com os valores 0, 1, 2 diferentes da NF-e
  if not Assigned(lkFrete.ListSource) then
    CadNf.lkFrete.setDadosDataSet(['0', '1', '2', '3', '4', '9'],
                                       ['0 - Terceiros',
                                        '1 - Emitente',
                                        '2 - Destinatário',
                                        '3 - Transporte próprio Remetente',
                                        '4 - Transporte próprio Destinatário',
                                        '9 - Sem frete'],
                                        lkFrete);

  if not Assigned(lkIndPres.ListSource) then
    CadNf.lkIndPres.setDadosDataSet(['0', '1', '2', '3', '5', '9'],
                                       ['0 - Não se aplica (ex: Ajustes, Complementer, etc)',
                                        '1 - Operação presencial',
                                        '2 - Operação não presencial, pela Internet',
                                        '3 - Operação não presencial, Teleatendimento',
                                        '5 - Operação presencial, fora do estabelecimento',
                                        '9 - Operação não presencial, outros'],
                                        lkIndPres);

  if not Assigned(lkIdDest.ListSource) then
  begin
    CadNf.lkIdDest.setDadosDataSet(['1', '2', '3'],
                                       ['1 - Operação interna',
                                        '2 - Operação interestadual',
                                        '3 - Operação com exterior'],
                                        lkIdDest);
    CadNf.lkIdDest.setDBLookupComboBox(lkIdDestMais);
  end;

  if not Assigned(lkBandeira.ListSource) then
    CadNf.pagNFe.lkBandeira.setDadosDataSet(['', '1', '2', '3', '4', '5', '6', '7', '8', '9', '99'],
                                            ['-',
                                             '01 - Visa',
                                             '02 - Mastercard',
                                             '03 - American Express',
                                             '04 - Sorocred',
                                             '05 - Diners Club',
                                             '06 - Elo',
                                             '07 - Hipercard',
                                             '08 - Aura',
                                             '09 - Cabal',
                                             '99 - Outros'], lkBandeira);
  lkformaEmiss.Tag := IfThen(vDadosIni.PesqPros('NF0203', 'HABILITAR', '', 'NOTAFISCAL', '', CadNf.buscas, False, False, True), 1, 0);//1=HAB, 2=DES
  if not Assigned(FlkformaEmiss) then
    FlkformaEmiss := TDadosLookUp_OOP.create;

  Astr := IfThen(vDadosIni.strIn(vDadosIni.vEmp.vNfe.webServiceSiglaUF, ['AC', 'AL', 'AP', 'DF', 'ES', 'MG', 'PB', 'PI', 'RJ', 'RN', 'RO', 'RR', 'RS', 'SC', 'SE', 'SP', 'TO']), '6', '7');
  if not Assigned(lkformaEmiss.ListSource) then
    FlkformaEmiss.setDadosDataSet(
      ['1', '4', Astr, '9'],
      ['1 - Normal', '4 - EPEC', Astr + ' - SVC' +IfThen(Astr = '6', 'AN', 'RS'), '9 - Contingência off-line'],
      lkformaEmiss
    );

  if not Assigned(Flkambiente) then
    Flkambiente := TDadosLookUp_OOP.create;
  if not Assigned(lkAmbiente.ListSource) then
    Flkambiente.setDadosDataSet(['1', '2'], ['1 - Produção', '2 - Homologação'], lkAmbiente);

  if not Assigned(Flkindpag) then
    Flkindpag := TDadosLookUp_OOP.create;
  if not Assigned(lkindpag.ListSource) then
    Flkindpag.setDadosDataSet(['', '0', '1'], ['', '0 - A vista', '1 - A prazo'], lkindpag);

  if not Assigned(FlkindIEDest) then
    FlkindIEDest := TDadosLookUp_OOP.create;
  if not Assigned(DBLookupComboBox18.ListSource) then
    FlkindIEDest.setDadosDataSet(['1', '2', '9'], ['1-Contribuinte', '2-Isento', '9-Não Contribuinte'], DBLookupComboBox18);

  if not Assigned(FlkMotivoDesoneracao) then
    FlkMotivoDesoneracao := TDadosLookUp_OOP.create;
  if not Assigned(lkDesoneracao.ListSource) then
    FlkMotivoDesoneracao.setDadosDataSet(['0', '1', '3', '4', '5', '6', '7', '8', '9', '10', '11'],
                                         ['0 - Sem desoneração',
                                          '1 - Taxi',
                                          '3 - Produtor Agropecuário',
                                          '4 - Frotista/Locadora',
                                          '5 - Diplomático/Consular',
                                          '6 - Utilitários e Motocicletas da Amazônia Ocidental e Áreas de Livre Comércio (Resolução 714/88 e 790/94 – CONTRAN e suas alterações)',
                                          '7 - SUFRAMA',
                                          '8 - Venda a Órgão Público',
                                          '9 - Outros. (NT 2011/004)',
                                          '10 - Deficiente Condutor (Convênio ICMS 38/12)',
                                          '11 - Deficiente Não Condutor (Convênio ICMS 38/12)'],
                                          lkDesoneracao);
  FlkMotivoDesoneracao.setDBLookupComboBox(ed_piscofins_motivo_deson);

  if not Assigned(FlkFinalClFor) then
    FlkFinalClFor := TDadosLookUp_OOP.create;

  FlkFinalClFor.setDadosDataSet('ID', 'DESCRICAO', CadNf.SqlOpen('select fi.id, fi.descricao from finalidade fi' +
                                                                 ' where cod_empresa = %s' +
                                                                 ' union ' +
                                                                 ' select null id, null descricao from rdb$database' +
                                                                 ' order by 2 ', [vDadosIni.codEmpresa]),
                                                                 lk_finalidadeid);
  if not Assigned(lkIntermed) then
    lkIntermed := TDadosLookUp_OOP.create;
  lkIntermed.setDadosDataSet(['', '0', '1'], ['Não se aplica', '0 - Operação "Sem" intermediador', '1 - Operação "Com" intermediador'], DBLookupComboBox2);

  if not Assigned(lkConfSuframa) then
    lkConfSuframa := TDadosLookUp_OOP.create;
  lkConfSuframa.setDadosDataSet(['', 'A', 'I'], ['Sem Conferência', 'Inscrição Ativa', 'Inscrição Inativa'], ed_conf_isuf);

  if not Assigned(lkRetFed) then
    lkRetFed := TDadosLookUp_OOP.create;
  lkRetFed.setDadosDataSet(['0', '1', '2'], ['Sem retenção', 'Com Retenção(mín R$10)', 'Com Retenção'], ed_retfed);
  ed_retfed.Hint := 'Retenção dos tributos federais: IR, CSLL, PIS e COFINS. Algumas retenções são aplicadas apenas quando o valor chega a R$10,00.' +
                    ' Outras podem reter mesmo se o valor for menor que R$10,00';

  if not Assigned(lkTipoGuiaTransito) then
    lkTipoGuiaTransito := TDadosLookUp_OOP.create;
  lkTipoGuiaTransito.setDadosDataSet(
  	['1', '2', '3', '4', '5', '6', '7'],
    ['1 - GTA - Guia de Trânsito Animal',
     '2 - TTA - Termo de Trânsito Animal',
     '3 - DTA - Documento de Transferência Animal',
     '4 - ATV - Autorização de Trânsito Vegetal',
     '5 - PTV - Permissão de Trânsito Vegetal',
     '6 - GTV - Guia de Trânsito Vegetal',
     '7 - Guia Florestal (DOF, SisFlora - PA e MT ou SIAM - MG)'], ed_agro_tpguia);

  if not Assigned(FlkColCidade) then
  begin
    FlkColCidade := TDadosLookUp_OOP.create;

    FlkColCidade.setDadosDataSet('CMUN', 'XMUN',
      CadNf.SqlOpen(
        'select * from ( select 0 ordem, null CMUN, ''[Vazio]'' XMUN, null uf from rdb$database ' +
        ' union ' +
        'select 1 ordem, ci.codigo_mun_ibge CMUN, ci.nome_municipio XMUN, es.sigla_uf as uf from cidades_ibge ci ' +
        ' left join estados es on es.ibge_codigo_uf = ci.codigo_uf_ibge )' +
        ' order by 1, xmun'
      ), ed_cmunfg
    );
    FlkColCidade.setDBLookupComboBox( ed_cmunfgibs );
    FlkColCidade.setDBLookupComboBox( ed_col_cidade );
  end;

  if not Assigned(FlkFormatoDANFe) then
    FlkFormatoDANFe := TDadosLookUp_OOP.create;
  FlkFormatoDANFe.setDadosDataSet(
    DFeEnumUtils.FormatoImpressaoDANFeNFeValues(), FormatoImpressaoDANFeEnumStr, lkFormatoDANFe
  );

  VisualConfigurarOperacaoInterna( CadNf.Config.Conf_RTC.EmVigencia(vDadosIni.vEmp.vRegime) );

  {$REGION 'dados coleta e entrega'}
  ed_col_nome.DataField       := 'XNOME';
  ed_col_cpfcnpj.DataField    := 'CPFCNPJ';
  ed_col_ie.DataField         := 'IE';
  ed_col_cep.DataField        := 'CEP';
  ed_col_logradouro.DataField := 'XLGR';
  ed_col_nro.DataField        := 'NRO';
  ed_col_compl.DataField      := 'XCPL';
  ed_col_bairro.DataField     := 'XBAIRRO';
  ed_col_cidade.DataField     := 'CMUN';
  ed_col_pais.DataField       := 'CPAIS';
  ed_col_fone.DataField       := 'FONE';
  ed_col_email.DataField      := 'EMAIL';
  {$ENDREGION}

  sp_icment_verdados.Visible := (CadNf.fstr('natureza_nf') = 'E') and (vDadosIni.strin(CadNf.fstr('tipo_nf'), ['P', 'V']));
  sp_ibscbsent_verdados.Visible := sp_icment_verdados.Visible;

  lkIdDest.Enabled := (CadNf.f_str('dest_uf') <> vDadosIni.vEmp.vSiglaUF) or CadNf.fequals('cpfcgc', vDadosIni.vEmp.vCNPJ);
  lkIdDestMais.Enabled := lkIdDest.Enabled;

  pag_event_AtualizarValoresCobranca;
  CadNf.changesF.onChange_frete_f_nfe        := nota_event_change_frete_f_nfe;
  CadNf.changesF.onChange_num_nf             := nota_event_change_num_nf;
  CadNf.changesF.onChange_tipo_desconto      := nota_event_change_tipo_desconto;
  CadNf.changesF.onChange_tipo_seguro        := nota_event_change_tipo_seguro;
  CadNf.changesF.onChange_tipo_outdesp       := nota_event_change_tipo_outdesp;
  CadNf.changesF.onChange_tipo_frete         := nota_event_change_tipo_frete;
  CadNf.changesF.onChange_consumidor_final   := nota_event_change_consumidor_final;
  CadNf.changesF.onChange_emissao_propria    := nota_event_change_emissao_propria;
  CadNf.changesF.onChange_verificar_mud_cfop := nota_event_change_verificar_mud_cfop;
  CadNf.changesF.onChange_finalidadeid       := nota_event_change_finalidadeid;
  CadNf.changesF.onChange_tipo_desppf        := nota_event_change_tipo_desppf;
  CadNf.printEtqDanfe := handleImpressaoEtiquetas;
  nota_event_change_frete_f_nfe;
  nota_event_change_emissao_propria;
  nota_event_change_num_nf;
  nota_event_change_tipo_desconto;
  nota_event_change_tipo_seguro;
  nota_event_change_tipo_outdesp;
  nota_event_change_tipo_frete;
  nota_event_change_tipo_desppf;

  pageDadosNF.ActivePage := tsnf_ResumoNota;
  pageDadosNFChange(pageDadosNF);

//	if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
//  	DBEdit1.SetFocus;
end;

procedure TfrmCadNF.habilitarComponentesNcmCest;
begin
  groupDivergNCM.Visible := False;
  groupDivergCEST.Visible := False;
  groupDivergNCM.Visible := vDadosIni.strIn(CadNf.vItem.divergNcmCest.divergencias.FieldByName('usncm').AsString, ['pen', 'cad', 'xml']);
  groupDivergCEST.Visible := vDadosIni.strIn(CadNf.vItem.divergNcmCest.divergencias.FieldByName('uscest').AsString, ['pen', 'cad', 'xml']);
  if groupDivergNCM.Visible and groupDivergCEST.Visible then
    Panel58.Height := 195
  else
    Panel58.Height := 98;
  DBEdit319.Color := vDadosIni.IfThen( CadNf.vItem.divergNcmCest.divergencias.FieldByName('usncm').AsString = 'cad', clSkyBlue, clWindow );
  DBEdit320.Color := vDadosIni.IfThen( CadNf.vItem.divergNcmCest.divergencias.FieldByName('usncm').AsString = 'xml', clSkyBlue, clWindow );
  DBEdit317.Color := vDadosIni.IfThen( CadNf.vItem.divergNcmCest.divergencias.FieldByName('uscest').AsString = 'cad', clSkyBlue, clWindow );
  DBEdit318.Color := vDadosIni.IfThen( CadNf.vItem.divergNcmCest.divergencias.FieldByName('uscest').AsString = 'xml', clSkyBlue, clWindow );
  if (Self.Enabled) and (Self.Visible) and (DBGrid52.CanFocus) then
  	DBGrid52.SetFocus;
end;

procedure TfrmCadNF.handleChangeQtdeQBCMono(qtdeChange: Double);
begin
  if RoundTo(CadNf.vItem.vrDadosItem.quantidade, -4) = RoundTo(ed_qbcmonoret.AsValue, -4) then
    if RoundTo(qtdeChange, -4) <> RoundTo(ed_qbcmonoret.AsValue, -4) then
      ed_qbcmonoret.AsValue := RoundTo(qtdeChange, -4);

  CadNf.vItem.vrDadosItem.quantidade := qtdeChange;
end;

procedure TfrmCadNF.handleHintDblClick(Sender: TObject);
begin
  try
    form_memo_botoes_ok_voltar_habilitar();
    listGrid.Items.Text := TControl(Sender).Hint;

    if not vDadosIni.abreForm('Informações', pnMemo, opFormsDefault) then
      Exit;

  finally
    form_memo_botoes_restore;
  end;
end;

procedure TfrmCadNF.handleImpressaoEtiquetas();
var
  I: Integer;
begin
  for I := 0 to CheckListEtiq2.Items.Count - 1 do
    if CheckListEtiq2.Checked[I] then
    begin
      CadNf.imprimeDanfeSimplificadoDadosTransporte(
        TCabecalho_etiqueta_class(CheckListEtiq2.Items.Objects[I]).cod_etiqueta,
        VarToInt(TCabecalho_etiqueta_class(CheckListEtiq2.Items.Objects[I]).quant_impressao));
    end;
end;

procedure TfrmCadNF.ConfBC_ICMSClick(Sender: TObject);
var
  conf: TConfTributo;
  section, trib, es, modelo: string;
  I: Integer;
begin
  inherited;
  gpConfBC.Caption := 'Base de cálculo ' + (Sender as TMenuItem).Caption;

  trib    := ReplaceText((Sender as TMenuItem).Name, 'ConfBC_', '');
  es      := IfThen(CadNf.fequals('natureza_nf', 'E'), 'Entrada', 'Saida');
  modelo  := PadL(CadNf.fstr('modelo_nf'), 2, '0');
  modelo  := IfThen(modelo = '00', CadNf.fstr('modelo_nf'), modelo);
  section := Format('Composicao_BC_%s_%s_Modelo_%s', [trib, es, modelo]);

  conf := TConfTributo.Create();
  try
    conf.Text := CadNf.fstr('conf_bc');

    ck_base_hab.Checked := conf.ReadBool(section, 'Habilitado');
    ck_base.Enabled := ck_base_hab.Checked;

    for I := 0 to ck_base.Items.Count - 1 do
      ck_base.Checked[I] :=
        conf.ReadString(section, 'Campo_' + ck_base.Items[I],
          IfThen((I >= 0) and (I <= 4), 'S') +                                                                    // Valor + Seguro + Frete + Outras - Desconto + Frete
          IfThen((I =  5) and (Sender = ConfBC_ICMSST   ), 'S') +                                                 // ValorIPI quando ICMSST
          IfThen((I =  5) and (Sender = ConfBC_PISCOFINS) and CadNf.fequals('natureza_nf', 'E'), 'S') +           // ValorIPI quando PISCOFINS e Entrada
          IfThen((I >= 8) and (I <= 10) and (Sender = ConfBC_ICMSST), 'S')                                        // - ( DesoneracaoICMS + DesoneracaoPIS + DesoneracaoCOFINS) quando ICMSST
        ) = 'S';

    vDadosIni.abreForm('Configura BC ' + ReplaceText((Sender as TMenuItem).Caption, '&', ''), pn_confbc, opFormsDefCadEsc);

    conf.WriteBool(section, 'Habilitado', ck_base_hab.Checked);

    for I := 0 to ck_base.Items.Count - 1 do
      conf.WriteString(section, 'Campo_' + ck_base.Items[I], IfThen(ck_base.Checked[I], 'S', 'N'));

    if ck_base_hab.Checked then
      conf.WriteBool('UserSet', trib, True);

    if CadNf.dataSet.State in [dsEdit, dsInsert] then
      CadNf.dataSet.FieldByName('conf_bc').AsString := conf.Text;

    CadNf.vItem.prepare_loop();
    Screen.Cursor := crHourGlass;
    try
      CadNf.checkConfigBcICMS();
      CadNf.somaTotaisNF();
    finally
      CadNf.vItem.prepare_loop_done();
      Screen.Cursor := crDefault;
    end;                       

  finally
    conf.Free;
  end;
end;

procedure TfrmCadNF.ConfigurarcolunasManifestacaoClick(Sender: TObject);
begin
  inherited;
	vDadosIni.ConfigurarcolunasCadPadraoClick(
  	Sender,
    cdsColunasManifestacao,
    DBGridManifestacao,
    GridCfgManifestacao,
    cdsGridManifestacao,
    usuario,
    ListGridsAndDataSetsManifestacao,
    vDadosIni.transacaoCol);
end;

procedure TfrmCadNF.InverterSeleo1Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.marcaItem(opmInversao);
end;

procedure TfrmCadNF.Label431Click(Sender: TObject);
begin
  inherited;
  ShellExecute(Application.Handle, nil,
    PChar('http://www.fazenda.gov.br/confaz/confaz/atos/atos_cotepe/2008/ac009_08.htm'), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmCadNF.Label81DblClick(Sender: TObject);
begin
  inherited;
  if CadNf.dataSet.State in [dsEdit, dsInsert] then
    if CadNf.campo_emissao_propria = 'S' then
      if vDadosIni.ShowConfirmacao('Atualizar data de emissão') = IDYES then
      begin
        CadNf.dataSet.FieldByName('data_contabil').AsDateTime := vDadosIni.getDataBanco(CadNf.buscas);
        CadNf.dataSet.FieldByName('hora_emissao').AsString := FormatDateTime('HH:MM:SS', Time);
      end;
end;

procedure TfrmCadNF.lbNaoEstaNaListaTermAdmClick(Sender: TObject);
begin
  inherited;
  edNumTerminalAdm.Visible := True;
  if (Self.Enabled) and (Self.Visible) and (edNumTerminalAdm.CanFocus) then
    edNumTerminalAdm.SetFocus;
end;

procedure TfrmCadNF.lbxPedCliDisponiveisDblClick(Sender: TObject);
var
  S: string;
begin
  inherited;
  if lbxPedCliDisponiveis.ItemIndex = -1 then
    Exit;

  S := lbxPedCliDisponiveis.Items[lbxPedCliDisponiveis.ItemIndex];

  eddXPedCompra.Text := Trim(ExtractStr(S, 'N°: ', ' - Item: '));
  S := Trim(ExtractStr(S, ' - Item: ', ' - Quant: '));

  eddNItemPedCompra.AsValue := StrToInt(S);
end;

procedure TfrmCadNF.lb_cst_pisDblClick(Sender: TObject);
begin
  inherited;
  CadNf.abreFormCSTPISCOFINS;
end;

procedure TfrmCadNF.lb_tipo_calc_1Click(Sender: TObject);
begin
  inherited;
  if tsMerc_ICMS.TabVisible then
    pgControlItensNFe.ActivePage := tsMerc_ICMS
  else if tsMerc_ISS.TabVisible then
    pgControlItensNFe.ActivePage := tsMerc_ISS;
end;

procedure TfrmCadNF.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (TelaCadastro <= 0) and (CheckBox3.Checked) then
  begin
  	RadioGroup1.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup1.Name);

    RadioGroup2.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup2.Name);

    ckProdServ.Checked := _LerConfiguracoesRegistroBoolean(ckProdServ.Name);
    ckVeic.Checked := _LerConfiguracoesRegistroBoolean(ckVeic.Name);
    ckOutras.Checked := _LerConfiguracoesRegistroBoolean(ckOutras.Name);
    ckDespesas.Checked := _LerConfiguracoesRegistroBoolean(ckDespesas.Name);
    ckServicos.Checked := _LerConfiguracoesRegistroBoolean(ckServicos.Name);
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
    	ComboBox12.Text       := _LerConfiguracoesRegistroString(ComboBox12.Name);

    if Trim(_LerConfiguracoesRegistroString(MaskEdit7.Name)) <> '' then
    	MaskEdit7.Text        := _LerConfiguracoesRegistroString(MaskEdit7.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name)) <> '' then
    	MaskEdit8.Text        := _LerConfiguracoesRegistroString(MaskEdit8.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name)) <> '' then
    	MaskEdit9.Text        := _LerConfiguracoesRegistroString(MaskEdit9.Name);
  end;
end;

procedure TfrmCadNF.ListBox3DblClick(Sender: TObject);
begin
  inherited;
  btAlterarFaturaEntradaClick(Sender);
end;

procedure TfrmCadNF.ListBox4KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_DOWN) or (key = VK_UP) then
    Label338.Caption := ListBox4.Items[ListBox4.ItemIndex];
end;

procedure TfrmCadNF.ListBox4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Label338.Caption := ListBox4.Items[ListBox4.ItemIndex];
end;

procedure TfrmCadNF.lkFinalidadeExit(Sender: TObject);
begin
  inherited;
  if (CadNf.dataSet.State in [dsEdit, dsInsert]) and (not CadNf.notaFechada) and
    (CadNf.fstrin('tipo_emissao', ['2', '3', '4'])) then
  begin
    buildCadastroCamposCalculoICMSSN;
    if (CadNf.fstrin('tipo_emissao', ['3', '4'])) then
      CadNf.pagNFe.semPagamento(False);
  end;
end;

procedure TfrmCadNF.lkFormatoDANFeExit(Sender: TObject);
begin
  inherited;
  if CadNf.fequals('emissao_propria', 'S') and CadNf.fequals('tpimp', Ord(fidSimplificadoTipo2)) then
  begin
    CadNf.dataSet.FieldByName('data_ent_saida').Clear;
    CadNf.dataSet.FieldByName('hora_ent_saida').Clear;
    CadNf.dataSet.FieldByName('nfe_iddest').AsInteger := 1;
  end;

  DBEdit44.Enabled  := CadNf.fequals('emissao_propria', 'S') and not CadNf.fequals('tpimp', Ord(fidSimplificadoTipo2));
  DBEdit180.Enabled := DBEdit44.Enabled;
end;

procedure TfrmCadNF.lkFreteExit(Sender: TObject);
begin
  inherited;
  edtvalor_desp_pf2Exit(edtvalor_frete2);
end;

procedure TfrmCadNF.lkIdDestExit(Sender: TObject);
begin
  inherited;            
  Screen.Cursor := crHourGlass;
  try
    CadNf.exitCodigoTabela('CLIENTES');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.Marcaritemparainformaragrade1Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.marcaItemParaGrade;
end;

procedure TfrmCadNF.MaskEdit4Enter(Sender: TObject);
begin
  inherited;
  mostrarHintEmBalao(MaskEdit4.Handle, PChar('Data inicial para pesquisar os registros salvos' + #13 +
                                             'Pressione "ESC" para limpar o conteÃºdo'), 'Atenção', TTI_INFO);
end;

procedure TfrmCadNF.MaskEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    MaskEdit4.Text := '99/99/9999';
    Perform(WM_NEXTDLGCTL,0,0);
    MaskEdit4.Clear;
  end;
  inherited;
end;

procedure TfrmCadNF.MaskEdit5Enter(Sender: TObject);
begin
  inherited;
  mostrarHintEmBalao(MaskEdit5.Handle, PChar('Data final para pesquisar os registros salvos' + #13 +
                                             'Pressione "ESC" para limpar o conteÃºdo'), 'Atenção', TTI_INFO);
end;

procedure TfrmCadNF.MaskEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
  begin
    MaskEdit5.Text := '99/99/9999';
    Perform(WM_NEXTDLGCTL,0,0);
    MaskEdit5.Clear;
  end;
end;

procedure TfrmCadNF.nfe_options_copiar_xml(Sender: TObject);
var
  Axml: string;
begin
  if not vDadosIni.PesqPros('NFE009', 'COPIAR', 'NUM NF ' + IntToStr(CadNf.campo_num_nf),
    'NOTAFISCAL', IntToStr(CadNf.campo_cod_nf), CadNf.buscas) then
    Exit;
  if CadNf.dataSet.FieldByName('nfe_versao').AsString > strVer310 then
  begin
    Axml :=
    CadNf.SqlOpen('select xml_nfe from notafiscal' +
                                      ' where cod_nf = ' + IntToStr(CadNf.campo_cod_nf) +
                                      ' and cod_empresa = ' + vDadosIni.codEmpresa).
                                      FieldByName('xml_nfe').AsString;
    Clipboard.AsText := Axml;
  end
  else
    vDadosIni.ShowErro('Notas fiscais de versão inferior a versão "4.00" não possui xml salvo no banco');
end;

procedure TfrmCadNF.nfe_options_salvar_xml(Sender: TObject);
var
  Axml: TStrings;
  AsaveDlg: TSaveDialog;
begin
  if not vDadosIni.PesqPros('NFE011', 'SALVAR', 'NUM NF ' + IntToStr(CadNf.campo_num_nf),
    'NOTAFISCAL', IntToStr(CadNf.campo_cod_nf), CadNf.buscas) then
    Exit;
  if CadNf.dataSet.FieldByName('nfe_versao').AsString > strVer310 then
  begin
    AsaveDlg := TSaveDialog.Create(Self);
    Axml := TStringList.Create;
    try
      Axml.Text := CadNf.SqlOpen('select xml_nfe from notafiscal' +
                                 ' where cod_nf = ' + IntToStr(CadNf.campo_cod_nf) +
                                 ' and cod_empresa = ' + vDadosIni.codEmpresa).
                                 FieldByName('xml_nfe').AsString;

      if Axml.Count > 0 then
      begin
        AsaveDlg.Title := 'Salvar XML da NFe';
        AsaveDlg.DefaultExt := 'xml';
        AsaveDlg.Filter := 'Arquivos XML ( *.xml)|*.xml';
        AsaveDlg.FileName := CadNf.dataSet.FieldByName('chave_nfe').AsString + '-nfe.xml';
        if AsaveDlg.Execute then
          Axml.SaveToFile(AsaveDlg.FileName);
      end;
    finally
      FreeAndNil(AsaveDlg);
      FreeAndNil(Axml);
    end;
  end
  else
    vDadosIni.ShowErro('Notas fiscais de versão inferior a versão "4.00" não possui xml salvo no banco');
end;

procedure TfrmCadNF.nfe_options_status_servico(Sender: TObject);
var
  AtpEmiss, AtpAmb: string;
begin
  AtpEmiss := IfThen(vDadosIni.vEmp.vNfe.danfeFormaEmissao = 'SVC', '6', '1');
  if not InputQuery('Consultar', 'Informe onde consultar 1: Normal, 6: SVC-AN; 7: SVC-RS', AtpEmiss)  then
    Exit;

  AtpAmb   := Copy(AtpEmiss, 2, 1);
  AtpEmiss := Copy(AtpEmiss, 1, 1);

  if not vDadosIni.strIn(AtpEmiss, ['1', '6', '7']) then
  begin
    vDadosIni.ShowErro('Valores inválidos, informe "1", "6" ou "7"');
    Exit;
  end;

  if not vDadosIni.strIn(AtpAmb, ['1', '2']) then
    AtpAmb := IfThen(vDadosIni.vEmp.vNfe.webServiceAmbiente = 'Produção', '1', '2');


  CadNf.dllNFe.nfe_status_servico(AtpEmiss + AtpAmb);
end;

procedure TfrmCadNF.nfe_options_visualizar_xml(Sender: TObject);
var
  Axml: TStrings;
begin
  if not vDadosIni.PesqPros('NFE010', 'VISUALIZAR', 'NUM NF ' + IntToStr(CadNf.campo_num_nf),
    'NOTAFISCAL', IntToStr(CadNf.campo_cod_nf), CadNf.buscas) then
    Exit;
  if CadNf.dataSet.FieldByName('nfe_versao').AsString > strVer310 then
  begin
    Axml := TStringList.Create;
    try
      Axml.Text := CadNf.SqlOpen('select xml_nfe from notafiscal' +
                                 ' where cod_nf = ' + IntToStr(CadNf.campo_cod_nf) +
                                 ' and cod_empresa = ' + vDadosIni.codEmpresa).
                                 FieldByName('xml_nfe').AsString;
      Axml.SaveToFile(ExtractFilePath(Application.ExeName) + 'visualizacao_xml_nfe.xml');
      ShellExecute(Application.Handle, 'open', PAnsiChar(ExtractFilePath(Application.ExeName) + 'visualizacao_xml_nfe.xml'), nil, nil, SW_SHOWNORMAL);
    finally
      FreeAndNil(Axml);
    end;
  end
  else
    vDadosIni.ShowErro('Notas fiscais de versão inferior a versão "4.00" não possui xml salvo no banco');
end;

procedure TfrmCadNF.nf_itens_espelho_calc_afterscroll(Sender: TObject);
begin
  if not CadNf.vItem.fempty('espelho_calc') then
    memo_espelho_calc.Lines.Text := CadNf.vItem.fstr('espelho_calc')
  else
    memo_espelho_calc.Lines.Text := CadNf.vItem.fstr('espelho_calc_st');
end;

procedure TfrmCadNF.nf_outras_options_ajustes_estoque(Sender: TObject);
var
  Aajuste_estoque_show: TShowForm;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vNotaFiscal.AHandle = 0 then
      CarregaPacote('pkNF', vDadosIni.vNotaFiscal.AHandle);
    @Aajuste_estoque_show := GetProcAddress(vDadosIni.vNotaFiscal.AHandle, 'ajuste_estoque_show');
    if Assigned(Aajuste_estoque_show) then
      Aajuste_estoque_show(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.nf_outras_options_dados_certificado(Sender: TObject);
begin
  ShowAtencao(StrReplace(CadNf.GetDadosCertificadoAtualizado.Text, [';'], sLineBreak));
end;

procedure TfrmCadNF.nf_outras_options_notas_pend_canc(Sender: TObject);
begin
  Application.CreateForm(TfrmCadNF_PencCanc, frmCadNF_PencCanc);
  frmCadNF_PencCanc.Nota := CadNf;
  frmCadNF_PencCanc.ShowModal;
end;

procedure TfrmCadNF.nf_outras_options_notas_pend_sefaz(Sender: TObject);
var
  Form: TFrmNotasFiscaisPendentesSEFAZ;
begin
  Application.CreateForm(TFrmNotasFiscaisPendentesSEFAZ, Form);
  try
    Form.Setup();
    Form.ShowModal;
  finally
    FreeAndNil(Form);
  end;
end;

procedure TfrmCadNF.nf_outras_options_rest_compl_icmsst(Sender: TObject);
var
  Aicmsst_complemento_restituicao: TShowForm;
begin
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vNotaFiscal.AHandle = 0 then
      CarregaPacote('pkNF', vDadosIni.vNotaFiscal.AHandle);
    @Aicmsst_complemento_restituicao := GetProcAddress(vDadosIni.vNotaFiscal.AHandle, 'icmsst_complemento_restituicao');
    if Assigned(Aicmsst_complemento_restituicao) then
      Aicmsst_complemento_restituicao(False);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.NotasFiscaisReferenciadas1Click(Sender: TObject);
begin
  inherited;
  CadNf.vSped.vC110.vC113.abreC113(CadNf.dataSet.FieldByName('cod_nf').AsInteger,
      CadNf.vSped.vC110.dataSet.FieldByName('cod_inf').AsInteger);
  if not CadNf.vSped.vC110.dataSet.IsEmpty then
    vDadosIni.abreForm('Documentos Fiscais referenciados na nota fiscal', pnC113Consulta, opFormsDefCad + [ofEscapeExit]);
  {
    CadNf.abreFormC113;
  }
end;

procedure TfrmCadNF.nota_coleta_entrega_tab_change;
var
  Ads: TDataSource;
begin
  inherited;
  if pageMaisNFe.ActivePage = tsnf_Coleta then
    Ads := CadNf.coleta._dataSourceOOP
  else
    Ads := CadNf.entrega._dataSourceOOP;
  ed_col_nome.DataSource       := Ads;
  ed_col_cpfcnpj.DataSource    := Ads;
  ed_col_ie.DataSource         := Ads;
  ed_col_cep.DataSource        := Ads;
  ed_col_logradouro.DataSource := Ads;
  ed_col_nro.DataSource        := Ads;
  ed_col_compl.DataSource      := Ads;
  ed_col_bairro.DataSource     := Ads;
  ed_col_cidade.DataSource     := Ads;
  ed_col_pais.DataSource       := Ads;
  ed_col_fone.DataSource       := Ads;
  ed_col_email.DataSource      := Ads;

  if not Assigned(FlkColPais) then
    FlkColPais := TDadosLookUp_OOP.create;

  FlkColPais.setDadosDataSet('CPAIS', 'XPAIS',
                             CadNf.SqlOpen('select p.cod_pais CPAIS, p.nome_pais XPAIS from paises p order by p.nome_pais'), ed_col_pais);
  {
  if not Assigned(FlkColCidade) then
    FlkColCidade := TDadosLookUp_OOP.create;

  FlkColCidade.setDadosDataSet('CMUN', 'XMUN',
                               CadNf.SqlOpen('select ci.codigo_mun_ibge CMUN, ci.nome_municipio XMUN, es.sigla_uf as uf from cidades_ibge ci ' +
                                             ' left join estados es on es.ibge_codigo_uf = ci.codigo_uf_ibge' +
                                             ' order by ci.nome_municipio'),
                               ed_col_cidade);
  }

  sp_col_edit.Visible := Ads.DataSet.RecordCount = 0;
  sp_col_del.Visible  := not sp_col_edit.Visible;

  if (not CadNf.notaFechada) and (Ads.State = dsBrowse) then
    if Ads.DataSet.RecordCount > 0 then
      Ads.DataSet.Edit;
end;

procedure TfrmCadNF.nota_event_change_consumidor_final;
begin
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    exit;

  if not (CadNf.dataSet.State in [dsEdit, dsInsert]) then
    exit;

  if (CadNf.dataSet.FieldByName('consumidor_final').AsString = 'N') then
    if (vDadosIni.vEmp.vSiglaUF = CadNf.dataSet.FieldByName('dest_uf').AsString) then
      CadNf.dataSet.FieldByName('nfe_iddest').AsInteger := 1
    else
      CadNf.dataSet.FieldByName('nfe_iddest').AsInteger := IfThen(CadNf.dataSet.FieldByName('dest_uf').AsString = 'EX', 3, 2);

  CadNf.vItem.prepare_loop();
  Screen.Cursor := crHourGlass;   
  try
    CadNf.somaTotaisNF(True);
  finally
    CadNf.vItem.prepare_loop_done();
    Screen.Cursor := crDefault;
  end;

  lkIdDest.Enabled := (CadNf.f_str('dest_uf') <> vDadosIni.vEmp.vSiglaUF) or CadNf.fequals('cpfcgc', vDadosIni.vEmp.vCNPJ);
  lkIdDestMais.Enabled := lkIdDest.Enabled;
end;

procedure TfrmCadNF.nota_event_change_emissao_propria;
  procedure Set_hab_campo(Acontrol: TWinControl; Avalue: Boolean);
  begin
    if not Avalue then
      if ActiveControl = Acontrol then
        Perform(WM_NEXTDLGCTL, 0, 0);
    Acontrol.Enabled := Avalue;
  end;
begin
  SpeedButton39.Visible := (CadNf.campo_emissao_propria <> 'S');
  if (CadNf.campo_emissao_propria = 'S') then
  begin
    SpeedButton39.Visible := False;
    DBComboBox5.Visible   := False;
    if (CadNf.dataSet.State in [dsInsert, dsEdit]) then
       CadNf.dataSet.FieldByName('da').AsString := 'N';
  end;
  if (CadNf.campo_emissao_propria = 'S') and
     (CadNf.campo_natureza_nf = 'E') and
     (CadNf.dataSet.State in [dsInsert, dsEdit]) then
  begin
    if (CadNf.campo_num_gerado <> 'S') then
    begin
      CadNf.dataSet.FieldByName('serie').AsString     := IntToStr(vDadosIni.vEmp.vSubSerieNotaFiscal);
      CadNf.dataSet.FieldByName('modelo_nf').AsString := vDadosIni.vEmp.vNfe.modeloNF;
    end;
    edserie.Enabled := False;
    edmodelo_nf.Enabled := False;
  end
  else if (CadNf.campo_emissao_propria = 'N') then
  begin
    edserie.Enabled := True;
    edmodelo_nf.Enabled := Trim(CadNf.dataSet.FieldByName('chave_nfe').AsString) = '';
  end;
  Set_hab_campo(ckConsumidorFinal, (CadNf.campo_emissao_propria = 'S') and (CadNf.fstr('codigo_nop', 2, 3) <> '929'));
  Set_hab_campo(lkFinalidade     , (CadNf.campo_emissao_propria = 'S') and (CadNf.campo_modelo_nf = '55'));
  Set_hab_campo(lkformaEmiss     , (CadNf.campo_emissao_propria = 'S') and (CadNf.campo_modelo_nf = '55') and (lkformaEmiss.Tag = 1));
  Set_hab_campo(lkIndPres        , (CadNf.campo_emissao_propria = 'S') and (CadNf.campo_modelo_nf = '55'));
  Set_hab_campo(lkIdDest         , (CadNf.campo_emissao_propria = 'S') and (CadNf.campo_modelo_nf = '55'));
  Set_hab_campo(ednfe_dhcont     , (CadNf.campo_emissao_propria = 'S') and (CadNf.campo_modelo_nf = '55'));
  Set_hab_campo(ednfe_xjust      , (CadNf.campo_emissao_propria = 'S') and (CadNf.campo_modelo_nf = '55'));

  lkIdDestMais.Enabled := lkIdDest.Enabled;

  if CadNf.fequals('nfe_iddest', '3') and CadNf.fequals('emissao_propria', 'S')  then
    edtvalor_total2.PopupMenu := PopupMenu5
  else if CadNf.fequals('natureza_nf', 'S')  then
    edtvalor_total2.PopupMenu := PopupMenu5
  else
    edtvalor_total2.PopupMenu := nil;

  nota_event_change_num_nf;
end;

procedure TfrmCadNF.nota_event_change_finalidadeid;
begin
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    exit;

  if not (CadNf.dataSet.State in [dsEdit, dsInsert]) then
    exit;

  CadNf.somaTotaisNF(True);
end;

procedure TfrmCadNF.nota_event_change_frete_f_nfe;
begin
  if CadNf.dataSet.FieldByName('frete_f_nfe').AsString = 'S' then
    edtvalor_frete.Color := clWhite
  else
    edtvalor_frete.Color := $00D1FBFC;
end;

procedure TfrmCadNF.nota_event_change_num_nf;
var
  Abloqueado: Boolean;
begin
//  if CadNf.campo_natureza_nf = natSaida then
//    Abloqueado := CadNf.campo_num_nf > 0
//  else
//    Abloqueado := (CadNf.campo_emissao_propria = 'S') and
//                  (CadNf.campo_num_gerado      = 'S');
//
//  lkAmbiente.Enabled   := Fnot Abloqueado;
  //lkformaEmiss.Enabled := not Abloqueado;  
end;

procedure TfrmCadNF.nota_event_change_tipo_desconto;
begin
  edtvalor_desc.Enabled       := not cktipo_desconto.Checked;
  edtvalor_desc2.Enabled      := not cktipo_desconto.Checked;
  ed_rateio_desconto.Enabled  :=     cktipo_desconto.Checked;
  edo_rateio_desconto.Enabled :=     cktipo_desconto.Checked;
end;

procedure TfrmCadNF.nota_event_change_tipo_desppf;
begin
  edtvalor_desp_pf.Enabled   := not ck_tipo_desppf.Checked;
  edtvalor_desp_pf2.Enabled  := not ck_tipo_desppf.Checked;
  ed_rateio_desp_pf.Enabled  :=     ck_tipo_desppf.Checked;
end;

procedure TfrmCadNF.nota_event_change_tipo_frete;
begin
  edtvalor_frete.Enabled   := not ck_tipo_frete.Checked;
  edtvalor_frete2.Enabled  := not ck_tipo_frete.Checked;
  ed_rateio_frete.Enabled  :=     ck_tipo_frete.Checked;
  edo_rateio_frete.Enabled :=     ck_tipo_frete.Checked;
end;

procedure TfrmCadNF.nota_event_change_tipo_outdesp;
begin
  edt_valor_out_desp.Enabled := not ck_tipo_outdesp.Checked;
  edtvalor_out_desp2.Enabled := not ck_tipo_outdesp.Checked;
  ed_rateio_outdesp.Enabled  :=     ck_tipo_outdesp.Checked;
  edo_rateio_outdesp.Enabled :=     ck_tipo_outdesp.Checked;
end;

procedure TfrmCadNF.nota_event_change_tipo_seguro;
begin
  edtvalor_seguro.Enabled   := not ck_tipo_seguro.Checked;
  edtvalor_seguro2.Enabled  := not ck_tipo_seguro.Checked;
  ed_rateio_seguro.Enabled  :=     ck_tipo_seguro.Checked;
  edo_rateio_seguro.Enabled :=     ck_tipo_seguro.Checked;
end;

procedure TfrmCadNF.nota_event_change_verificar_mud_cfop;
begin
  if not (CadNf.dataSet.State in [dsEdit, dsInsert]) then
    Exit;
  CadNf.verificaMudancaCFOP(False);
end;

procedure TfrmCadNF.nota_event_clear;
begin
  if not Assigned(CadNf) then
    Exit;
  if not Assigned(CadNf.changesF) then
    Exit;

  CadNf.changesF.onChange_frete_f_nfe        := nil;
  CadNf.changesF.onChange_num_nf             := nil;
  CadNf.changesF.onChange_tipo_desconto      := nil;
  CadNf.changesF.onChange_tipo_seguro        := nil;
  CadNf.changesF.onChange_tipo_outdesp       := nil;
  CadNf.changesF.onChange_tipo_frete         := nil;
  CadNf.changesF.onChange_consumidor_final   := nil;
  CadNf.changesF.onChange_emissao_propria    := nil;
  CadNf.changesF.onChange_verificar_mud_cfop := nil;
  CadNf.changesF.onChange_finalidadeid       := nil;
end;

procedure TfrmCadNF.PageControl5MouseActivate(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBComboBox21.CanFocus) then
    DBComboBox21.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (btExportItemNFVoltar.CanFocus) then
    btExportItemNFVoltar.SetFocus;
end;

procedure TfrmCadNF.pageDadosNFChange(Sender: TObject);
begin
  inherited;

  CadNf.pagNFe.onChangesValue := nil;

  if pageDadosNF.ActivePage.Name = tsnf_ResumoNota.Name then
  begin
    if (not CadNf.fnull('dfe_trib_ignorar')
      and (YesNoEnum(CadNf.fint('dfe_trib_ignorar')) = ynNo)
      and not edPickerOpInterna.Visible)
      or
      ((YesNoEnum(CadNf.fint('dfe_trib_ignorar')) = ynYes)
      and edPickerOpInterna.Visible)
    then
      VisualConfigurarOperacaoInterna( YesNoEnum(CadNf.fint('dfe_trib_ignorar')) = ynNo );

    groupItensNota.Parent := tsnf_ResumoNota;
  end
  else if pageDadosNF.ActivePage.Name = tsnf_itens.Name then
  begin
    groupItensNota.Parent := tsnf_itens;
  end
  else if pageDadosNF.ActivePage.Name = tsnf_Cobranca.Name then
  begin
    pageFatDup.ActivePage := tsnf_pagamentos;
    pnNotaFiscal.Height := pnAbaCobranca.Height + 31 + 10;
    CadNf.pagNFe.onChangesValue := pag_event_AtualizarValoresCobranca;
    pag_event_AtualizarValoresCobranca;
  end
  else if pageDadosNF.ActivePage.Name = tsMaisNFe.Name then
    pageMaisNFe.ActivePage := tsmaisnfe_ide;


  Exit; // pOR ENQUANTO FICA SEM UTILIDADE

  CadNf.pagNFe.onChangesValue              := nil;
  if pageDadosNF.ActivePage.Name = tsnf_ResumoNota.Name then
    pnNotaFiscal.Height := pnAbaNotaFiscal.Height + 31 + 10
  else if pageDadosNF.ActivePage.Name = tsnf_Destinatario.Name then
    pnNotaFiscal.Height := pnAbaDestinatario.Height + 31 + 10
  else if pageDadosNF.ActivePage.Name = tsnf_Totais.Name then
    pnNotaFiscal.Height := pnAbaTotais.Height + 31 + 10
  else if pageDadosNF.ActivePage.Name = tsnf_Transporte.Name then
    pnNotaFiscal.Height := pnAbaTransporte.Height + 31 + 10
  else if pageDadosNF.ActivePage.Name = tsnf_Cobranca.Name then
  begin
    pageFatDup.ActivePage := tsnf_pagamentos;
    pnNotaFiscal.Height := pnAbaCobranca.Height + 31 + 10;
    CadNf.pagNFe.onChangesValue := pag_event_AtualizarValoresCobranca;
    pag_event_AtualizarValoresCobranca;
  end
  else if pageDadosNF.ActivePage.Name = tsnf_InfAdicionais.Name then
    pnNotaFiscal.Height := pnAbaInfAdicionais.Height + 31 + 10
  else if pageDadosNF.ActivePage.Name = tsnf_NFServico.Name then
    pnNotaFiscal.Height := pnAbaNFServico.Height + 31 + 10
  else if pageDadosNF.ActivePage.Name = tsnf_Outras.Name then
    pnNotaFiscal.Height := pnAbaOutras.Height + 31 + 10
  else if pageDadosNF.ActivePage.Name = tsnf_obscont.Name then
  begin
    pnNotaFiscal.Height          := pn_aba_obscont.Height + 31 + 10;
    grid_obscont.DataSource      := CadNf.obsCont._dataSourceOOP;
    ed_obscont_xcampo.DataSource := CadNf.obsCont._dataSourceOOP;
    ed_obscont_xtexto.DataSource := CadNf.obsCont._dataSourceOOP;
  end
  else if pageDadosNF.ActivePage.Name = tsnf_agropecuario.Name then
  begin
    page_agronegocio.ActivePage     := tsnf_agro_defensivo;
    pnNotaFiscal.Height             := pn_aba_agronegocio.Height + 31 + 10;
    grid_defensivos.DataSource      := CadNf.defensivo._dataSourceOOP;
    ed_agro_nreceituario.DataSource := CadNf.defensivo._dataSourceOOP;
    ed_agro_cpfresptec.DataSource   := CadNf.defensivo._dataSourceOOP;
    ed_agro_tpguia.DataSource       := CadNf.guiaTransito._dataSourceOOP;
    ed_agro_ufguia.DataSource       := CadNf.guiaTransito._dataSourceOOP;
    ed_agro_serieguia.DataSource    := CadNf.guiaTransito._dataSourceOOP;
    ed_agro_nguia.DataSource        := CadNf.guiaTransito._dataSourceOOP;
  end
  else if pageDadosNF.ActivePage.Name = tsMaisNFe.Name then
  begin
    pageMaisNFe.ActivePage := tsmaisnfe_entregaintermed;
    pageMaisNFe.Height := pnmaisnfe_entregaintermed.Height + 30;
    pnNotaFiscal.Height := pageMaisNFe.Height + 30;
  end
  else if pageDadosNF.ActivePage.Name = tsnf_retencao.Name then
    pnNotaFiscal.Height := panel_retencao.Height + 31 + 10
  else
    pnNotaFiscal.Height := pnAbaDestinatario.Height + 31 + 10;
  {
  if pageDadosNF.ActivePage.Name = tsnf_Entrega.Name then
  begin
    pn_col_ent.Parent := tsnf_Entrega;
    pnNotaFiscal.Height := pn_col_ent.Height + 31 + 10;
    nota_coleta_entrega_tab_change;
  end
  else if pageDadosNF.ActivePage.Name = tsnf_Coleta.Name then
  begin
    pn_col_ent.Parent := tsnf_Coleta;
    pnNotaFiscal.Height := pn_col_ent.Height + 31 + 10;
    nota_coleta_entrega_tab_change;
  end
  else;
  }
  THackWinControl(pageDadosNF.ActivePage).SelectFirst;
end;

procedure TfrmCadNF.pageDetalhesItensNFChange(Sender: TObject);
begin
  if pageDetalhesItensNF.ActivePage = tsDetItem_IBSCBS then
  begin
    CadNf.vItem.PrepareDadosItem();
    try
      if (CadNf.vItem.vrDadosItem.tributosRTC = nil)
        or ( (CadNf.vItem.vrDadosItem.tributosRTC.IbsCbs = nil) and (CadNf.vItem.vrDadosItem.tributosRTC.ImpostoSeletivo = nil) )
      then
        FrameIbsCbsDetItemNf1.Setup( nil )
      else
        FrameIbsCbsDetItemNf1.Setup( CadNf.vItem.vrDadosItem.tributosRTC.IbsCbs );
    finally
      CadNf.vItem.cancelar;
    end;
  end;
end;

procedure TfrmCadNF.pageItensDespesasChange(Sender: TObject);
begin
  inherited;
  if pageItensDespesas.ActivePage = tsDesp_IBSCBS then
    FrameIbsCbsCalculoItemDtSetCallBack(FrameIbsCbsDesp1);
end;

procedure TfrmCadNF.pageItensVeiculosChange(Sender: TObject);
begin
  if pageItensVeiculos.ActivePage = tsVeic_IBSCBS then
    FrameIbsCbsCalculoItemDtSetCallBack(FrameIbsCbsVeic1);
end;

procedure TfrmCadNF.pag_event_AtualizarValoresCobranca;
begin
  lbpag_total.Caption := Format('%n', [CadNf.pagNFe.total]);
  lbpag_falta.Caption := Format('%n', [CadNf.pagNFe.falta]);
//  edpagtotal.AsValue := CadNf.pagNFe.total;
//  edpagfalta.AsValue := CadNf.pagNFe.falta;
//  edpagtroco.AsValue := CadNf.pagNFe.troco;
end;

procedure TfrmCadNF.Panel13Enter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBGrid11.CanFocus) then
    DBGrid11.SetFocus;
end;

procedure TfrmCadNF.Panel144Enter(Sender: TObject);
var
  habEmb, vHabEmbalagem: Boolean;
  undVenda: TUnidadeVenda_Model;
begin
  inherited;
  {
  vHabEmbalagem := (Trim(eddUnidade_nf.Text) <> '') and (btnLockEmb.Tag = 1) and (CadNf.f_int('id_ajuste') = 0);
  if (btnLockEmb.Tag = 0) then
  begin
    btnLockEmb.Visible := False;
    btnUnlockEmb.Visible := False;
  end
  else
  begin
    btnLockEmb.Visible := not vHabEmbalagem;
    btnUnlockEmb.Visible := vHabEmbalagem;
  end;

  eddUnidade_nf.Enabled := vHabEmbalagem;
  eddQTDEMB_old.Enabled     := vHabEmbalagem;
  eddQTDEMBREC.Enabled  := vHabEmbalagem;
  eddQtde.Enabled := (not vHabEmbalagem) and (CadNf.f_int('id_ajuste') = 0);
  eddValorUnitario.Enabled := (not eddValorTotal.Enabled) and (not vHabEmbalagem);
  eddVLREMBNF.Enabled      := (not eddValorTotal.Enabled) and (vHabEmbalagem);
  if not vHabEmbalagem then
  begin
    eddUnidade_nf.Text := '';
    eddQTDEMB_old.AsValue := 0;
    eddQTDEMBREC.AsValue := 0;
    eddVLREMBNF.AsValue := 0;
  end;
  }

//  esse id_ajuste é ajuste de estoque, quando tem ajuste nao mexe em embalagem,
//  tambem nao altera a quantidade, sendo assim melhor vir do GetUndVenda ja com 1 unidade principal


  if (CadNf.vItem.vrDadosItem.tipo_item = 'P') and (edUndVnd.Enabled) and (edUndVnd.Items.Count > 0) and (CadNf.f_int('id_ajuste') = 0) then
  begin
    undVenda := (edUndVnd.Items.Objects[edUndVnd.Tag] as TUnidadeVenda_Model);

    habEmb := undVenda.unid_princ <> undVenda.unid_vnd;
    lbUndVnd.Caption := undVenda.paridade;
  end
  else
    habEmb := False;

  eddQTDEMBREC.Enabled     := habEmb;
  eddVLREMBNF.Enabled      := habEmb;
  eddQtde.Enabled          := not habEmb;
  eddValorUnitario.Enabled := (not habEmb) and (not eddValorTotal.Enabled);       
end;

procedure TfrmCadNF.pnDiversosEnter(Sender: TObject);
begin
  inherited;
  dsDiversos.DataSet := CadNf.buscas;
end;

procedure TfrmCadNF.pnDiversosExit(Sender: TObject);
begin
  inherited;
  dsDiversos.DataSet := nil;
end;

procedure TfrmCadNF.pnEscolhaNFBotoesEnter(Sender: TObject);
begin
  inherited;
  btNF_D.Enabled := vStringEntradaSaidaFormEscolhaNF = 'E';
  btNF_S.Enabled := vStringEntradaSaidaFormEscolhaNF = 'E';
end;

procedure TfrmCadNF.panelGrupoVendaEnter(Sender: TObject);
var
  ANewColumn: Boolean;
  I: Integer;
begin
  inherited;
  panelGrupoVenda.Caption := '';
  ckVendasVAN.Caption := 'Vendas que não fecham';
  ckVendasVAN.Visible := True;//(vDadosIni.vEmp.vAbaterItens = 'S') or (CadNf.fstr('natureza_nf') = 'E');
  ckVendasVAN.Enabled := vDadosIni.PesqPros(IfThen(CadNf.fstr('natureza_nf') = 'S', 'NF0191', 'NF0217'), 'HABILITAR', '', 'NOTAFISCAL', '', CadNf.buscas, False, False, True);
  if not ckVendasVAN.Enabled then
    ckVendasVAN.Checked := False;
  CadNf.vPedVNf.Close;
  CadNf.vPedVNf.vItem.Close;

  ckPVApenasComCupomFiscalClick(ckPVApenasComCupomFiscal);
//  if vDadosIni.vEmp.vUsarUmaVendaPorNF = 'S' then
//    DBGrid2.Options :=[dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit]
//  else
//    DBGrid2.Options :=[dgEditing,dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,dgTabs,dgConfirmDelete,dgCancelOnExit,dgMultiSelect];
end;

procedure TfrmCadNF.pgContDadosNFEnter(Sender: TObject);
begin
  inherited;
  if (activeControl = pgContDadosNF) and (pgContDadosNF.ActivePage = tsDadosNf) then
  	if (Self.Enabled) and (Self.Visible) and (ednum_nf.CanFocus) then
    	ednum_nf.setfocus;
end;

procedure TfrmCadNF.pgControlItensNFeEnter(Sender: TObject);
var
  vDataTest: string;
  I: Integer;
begin
  inherited;

  if not spbSairDetalhe.Visible then
    for I := 0 to pgControlItensNFe.PageCount - 1 do
      pgControlItensNFe.Pages[I].Enabled := True;

  tsMerc_Importacao.TabVisible := Copy(Trim(CadNf.dataSet.FieldByName('codigo_nop').AsString),1,1) = '3';

  tsMerc_Devolucao.TabVisible := Trim(CadNf.dataSet.FieldByName('tipo_emissao').AsString) = '4';

  tsMerc_PedidoCliente.TabVisible := True;//CadNf.campo_emissao_propria = 'S';

  tsMerc_Mercadorias.TabVisible := CadNf.fdif('tipo_nf', 'O');
  
  tsMerc_itens_outras.TabVisible := CadNf.fequals('tipo_nf', 'O');

//  tsMerc_PISCOFINS.TabVisible := (
//    (CadNf.campo_emissao_propria = 'S') and
//    (CadNf.campo_modelo_nf = '55') and
//    (CadNf.campo_situacao_nfe = sitAutorizada));

  vDataTest := '01/01/2016';
  if vDadosIni.vEmp.vNfe.webServiceAmbiente = 'Homologação' then
    vDataTest := '01/01/2015';
  tsMerc_Interestadual.TabVisible :=
    ((Trim(CadNf.dataSet.FieldByName('nfe_indiedest').AsString) = '9') or
    ((Trim(CadNf.dataSet.FieldByName('insc_est').AsString) = 'ISENTO') and
    (Trim(CadNf.dataSet.FieldByName('nfe_indiedest').AsString) = ''))) and
    (CadNf.dataSet.FieldByName('consumidor_final').AsString = 'S') and
    (CadNf.dataSet.FieldByName('data_contabil').AsDateTime >= StrToDate(vDataTest)) or
    (CadNf.fequals('tipo_emissao', '4'));

  if (CadNf.campo_natureza_nf = 'S') then
  begin
    tsMerc_ICMS.OnExit := tsMerc_ICMSExit;
    tsMerc_IPI.OnExit := tsMerc_MercadoriasExit;
  end
  else
  begin
    tsMerc_ICMS.OnExit := tsMerc_MercadoriasExit;
    tsMerc_IPI.OnExit := tsMerc_ICMSExit;
  end;
end;

procedure TfrmCadNF.pgControlOItensNFeEnter(Sender: TObject);
var
  vDataTest: string;
  I: Integer;
begin
  inherited;

  if not spbSairDetalhe.Visible then
    for I := 0 to pgControlOItensNFe.PageCount - 1 do
      pgControlOItensNFe.Pages[I].Enabled := True;

  tsOut_Importacao.TabVisible := Copy(Trim(CadNf.dataSet.FieldByName('codigo_nop').AsString),1,1) = '3';

  tsOut_Devolucao.TabVisible := Trim(CadNf.dataSet.FieldByName('tipo_emissao').AsString) = '4';

  tsOut_PedidoCliente.TabVisible := CadNf.campo_emissao_propria = 'S';

  tsOut_PISCOFINS.TabVisible := (
    (CadNf.campo_emissao_propria = 'S') and
    (CadNf.campo_modelo_nf = '55') and
    (CadNf.campo_situacao_nfe = sitAutorizada));

  vDataTest := '01/01/2016';
  if vDadosIni.vEmp.vNfe.webServiceAmbiente = 'Homologação' then
    vDataTest := '01/01/2015';
  tsOut_Interestadual.TabVisible :=
    ((Trim(CadNf.dataSet.FieldByName('nfe_indiedest').AsString) = '2') or
    ((Trim(CadNf.dataSet.FieldByName('insc_est').AsString) = 'ISENTO') and
    (Trim(CadNf.dataSet.FieldByName('nfe_indiedest').AsString) = ''))) and
    (CadNf.dataSet.FieldByName('consumidor_final').AsString = 'S') and
    (CadNf.dataSet.FieldByName('data_contabil').AsDateTime >= StrToDate(vDataTest));
end;

procedure TfrmCadNF.pageMaisNFeChange(Sender: TObject);
begin
  inherited;
  if pageMaisNFe.ActivePage.Name = tsmaisnfe_entregaintermed.Name then
  begin
    pageMaisNFe.Height := pnmaisnfe_entregaintermed.Height + 30;
    pnNotaFiscal.Height := pageMaisNFe.Height + 30;
  end
  else if MatchText(pageMaisNFe.ActivePage.Name, [tsnf_Entrega.Name, tsnf_Coleta.Name]) then
  begin
    if pageMaisNFe.ActivePage.Name = tsnf_Coleta.Name then
      pn_col_ent.Parent := tsnf_Coleta
    else
      pn_col_ent.Parent := tsnf_Entrega;
    pageMaisNFe.Height := pn_col_ent.Height + 30;
    pnNotaFiscal.Height := pageMaisNFe.Height + 30;
    nota_coleta_entrega_tab_change;
  end
  else
  begin
    pageMaisNFe.Height := pnmaisnfe_ide.Height + 30;
    pnNotaFiscal.Height := pageMaisNFe.Height + 30;
  end;

  THackWinControl(pageMaisNFe.ActivePage).SelectFirst;
end;

procedure TfrmCadNF.pnADIEnter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit268.CanFocus) then
    DBEdit268.SetFocus;
end;

procedure TfrmCadNF.pnAtencTribEnter(Sender: TObject);
begin
  inherited;
  BitBtn113.Enabled := True;
  DBLookupComboBox15.Enabled := False;
  ckEfetuarLancamentoFiscalDocumento.Checked     := not regGetConfBool(ckEfetuarLancamentoFiscalItemDocumento.Name);
  ckEfetuarLancamentoFiscalItemDocumento.Checked := regGetConfBool(ckEfetuarLancamentoFiscalItemDocumento.Name);
  CadNf.vSped.vC195_C197.vLancFiscal.abreLancamentosFiscais;
  DBLookupComboBox15.KeyValue := CadNf.vSped.vC195_C197.vLancFiscal.dataSet.FieldByName('cod_obs').AsInteger;
end;

procedure TfrmCadNF.pnCadastroItensOutrasNfEnter(Sender: TObject);
begin
  inherited;
  edOnCSOSN.Enabled :=
  ((CadNf.dataSet.FieldByName('crt').AsString = '1') and (CadNf.campo_natureza_nf = 'S' ));// or
end;

procedure TfrmCadNF.pnCadastroItensOutrasNfExit(Sender: TObject);
begin
  inherited;
  if (not pnConsultaItensOutrasNF.Visible) and (pnCadastroItensOutrasNf.Visible) then
  	if (Self.Enabled) and (Self.Visible) and (pnCadastroItensOutrasNf.CanFocus) then
    	pnCadastroItensOutrasNf.SetFocus;
end;

procedure TfrmCadNF.pnCadastroItensProdDetalhadoExit(Sender: TObject);
begin
  inherited;
  if (not pnConsultaItensProdDetalhado.Visible) and (pnCadastroItensProdDetalhado.Visible) then
  begin
    application.messagebox('Salve ou Cancele o Item antes','Atenção',+0+64);
    if (Self.Enabled) and (Self.Visible) and (pnCadastroItensProdDetalhado.CanFocus) then
    	pnCadastroItensProdDetalhado.SetFocus;
  end;
end;

procedure TfrmCadNF.pnCC_eEnter(Sender: TObject);
begin
  inherited;
  if pnCC_e.Tag <> 1 then
    Exit;

  CadNf.vCC_e.dataSet.Last;
  if CadNf.vCC_e.dataSet.FieldByName('tipo_evento').AsString = 'CAN' then
    Exit;

  BitBtn155.Click;

  if CadNf.vCC_e.dataSet.State = dsInsert then
  begin
    CadNf.vCC_e.dataSet.FieldByName('tipo_evento').AsString := 'CAN';
    if (Self.Enabled) and (Self.Visible) and (DBMemo16.CanFocus) then
    	DBMemo16.SetFocus;
  end;
end;

procedure TfrmCadNF.pnDadosCartaoEnter(Sender: TObject);
begin
  inherited;
  btDadosCartaoReceber.Enabled := vDadosIni.GetIni('TEF', 'POSVirtual', 'N') = 'S';
  btDadosCartaoCancelar.Enabled := btDadosCartaoReceber.Enabled;
  btDadosCartaoADM.Enabled := btDadosCartaoReceber.Enabled;
  dsDiversos.DataSet := CadNf.buscas;
  dbgridDadosCartoes.DataSource := dsDiversos;
end;

procedure TfrmCadNF.pnDadosCartaoExit(Sender: TObject);
begin
  inherited;
  dsDiversos.DataSet := nil;
  dbgridDadosCartoes.DataSource := nil;
end;

procedure TfrmCadNF.pnAbaDestinatarioEnter(Sender: TObject);
begin
  inherited;
  btNextDest.Enabled  := (CadNf.vClFor.EndDoc.indice + 1) < CadNf.vClFor.EndDoc.lista.Count;
  btPriorDest.Enabled := CadNf.vClFor.EndDoc.indice > 0;
end;

procedure TfrmCadNF.pnAbaNotaFiscalEnter(Sender: TObject);
begin
  inherited;
  btNotaRetorno.Enabled := CadNf.notaFiscalDeRetorno;
  DBEdit11.Width := btNotaRetorno.Left - DBEdit11.Left - 6{margens}; 
end;

procedure TfrmCadNF.pnAbaOutrasEnter(Sender: TObject);
begin
  inherited;
  {
  lkIdDest.Enabled := (CadNf.dataSet.FieldByName('consumidor_final').AsString = 'S') and
                      (Trim(CadNf.dataSet.FieldByName('dest_idestrangeiro').AsString) <> '') and
                      (CadNf.campo_emissao_propria = 'S') and (CadNf.campo_modelo_nf = '55');
  edChave.Enabled  := (CadNf.campo_modelo_nf = '55') and (CadNf.campo_natureza_nf = 'E');
  }
  edChave.Enabled  := CadNf.fstrin('modelo_nf', ['55', '62', '66']);
  edChave.ReadOnly := CadNf.fequals('emissao_propria', 'S');
  btConsultarNFe.Enabled := edChave.Enabled;
end;

procedure TfrmCadNF.pnDetalhesItensNFEnter(Sender: TObject);
begin
  inherited;
  dsDevItens.DataSet := CadNf.buscas;
  pageDetalhesItensNF.ActivePage := tsDetItem_Grade;
end;

procedure TfrmCadNF.pnDetalhesItensNFExit(Sender: TObject);
begin
  inherited;
  dsDevItens.DataSet := nil;
end;

procedure TfrmCadNF.pnDevolucaoItensEnter(Sender: TObject);
begin
  inherited;
  CadNf.existeNFDevolvida(0);
  Edit1.Text := vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 2);
  Edit2.Text := vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 3);
  Edit3.Text := vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 4);
  dsDevItens.DataSet := CadNf._buscas;
  dsItensTemp.DataSet := CadNf.vItem.dataSet;
  CadNf.vItem.dataSet.First;
  while not CadNf.vItem.dataSet.Eof do
  begin
    if CadNf.cfopDeDevolucao(Trunc(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsFloat)) then
    begin
      if CadNf.existeNFDevolvida(CadNf.vItem.dataSet.FieldByName('cod_nf_dev').AsInteger) then
      begin
        Edit1.Text := vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 2);
        Edit2.Text := vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 3);
        Edit3.Text := vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 4);
      end;
      Break;
    end;
    CadNf.vItem.dataSet.Next;
  end;
  if (Self.Enabled) and (Self.Visible) and (DBGrid34.CanFocus) then
  	DBGrid34.SetFocus;
end;

procedure TfrmCadNF.pnDevolucaoItensExit(Sender: TObject);
begin
  inherited;
  dsDevItens.DataSet := nil;
  dsItensTemp.DataSet := nil;
end;

procedure TfrmCadNF.pnDevolucoesRefExit(Sender: TObject);
begin
  inherited;
  dsDevItens.DataSet := nil;
end;

procedure TfrmCadNF.pnDIEnter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit262.CanFocus) then
    DBEdit262.SetFocus;
end;

procedure TfrmCadNF.pnFormDetalhesNFEnter(Sender: TObject);
begin
  inherited;

  btPagamentoEmCartao.Visible := False;//(CadNf.campo_natureza_nf = 'S') and (vDadosIni.GetIni('TEF', 'POSVirtual', 'N') = 'S');
  lbPagamentoEmCartao.Visible := False;//btPagamentoEmCartao.Visible;

end;

procedure TfrmCadNF.pnImportacaoEnter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn140.CanFocus) then
    BitBtn140.SetFocus;
end;

procedure TfrmCadNF.pnIrregularidadesNCMCESTEnter(Sender: TObject);
begin
  inherited;
  DBGrid52.DataSource  := CadNf.vItem.divergNcmCest.dataSource;
  DBEdit319.DataSource := CadNf.vItem.divergNcmCest.dataSource;
  DBMemo20.DataSource  := CadNf.vItem.divergNcmCest.dataSource;
  DBEdit320.DataSource := CadNf.vItem.divergNcmCest.dataSource;
  DBMemo21.DataSource  := CadNf.vItem.divergNcmCest.dataSource;
  DBEdit317.DataSource := CadNf.vItem.divergNcmCest.dataSource;
  DBMemo18.DataSource  := CadNf.vItem.divergNcmCest.dataSource;
  DBEdit318.DataSource := CadNf.vItem.divergNcmCest.dataSource;
  DBMemo19.DataSource  := CadNf.vItem.divergNcmCest.dataSource;

  DBEdit319.DataField := 'ncm_cad';
  DBMemo20.DataField  := 'nome_ncm_cad';
  DBEdit320.DataField := 'ncm';
  DBMemo21.DataField  := 'nome_ncm';
  DBEdit317.DataField := 'cest_cad';
  DBMemo18.DataField  := 'nome_cest_cad';
  DBEdit318.DataField := 'cest';
  DBMemo19.DataField  := 'nome_cest';

  CadNf.vItem.divergNcmCest.eventAfterScroll := habilitarComponentesNcmCest;
  habilitarComponentesNcmCest;
end;

procedure TfrmCadNF.pnItensDespesaExit(Sender: TObject);
begin
  inherited;
  if (not pnConsultaItensDespesa.Visible) and
  (pnCadastroItensDespesa.Visible) then
  begin
    application.messagebox('Salve ou Cancele o Item antes','Atenção',+0+64);
    if (Self.Enabled) and (Self.Visible) and (pnCadastroItensDespesa.CanFocus) then
    	pnCadastroItensDespesa.SetFocus;
  end;
end;

procedure TfrmCadNF.pnItensVeiculoEnter(Sender: TObject);
begin
  inherited;
  Label529.Visible := copy(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsString, 1, 1) = '3';
  Label530.Visible := copy(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsString, 1, 1) = '3';
  Label531.Visible := copy(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsString, 1, 1) = '3';
  Label532.Visible := copy(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsString, 1, 1) = '3';
  DBEdit265.Visible := copy(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsString, 1, 1) = '3';
  DBEdit272.Visible := copy(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsString, 1, 1) = '3';
  DBEdit273.Visible := copy(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsString, 1, 1) = '3';
  DBEdit274.Visible := copy(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsString, 1, 1) = '3';

  lbvPercMercDevol.Visible := Trim(CadNf.dataSet.FieldByName('tipo_emissao').AsString) = '4';
  dbevPercMercDevol.Visible := Trim(CadNf.dataSet.FieldByName('tipo_emissao').AsString) = '4';
  lbvVLIPIDevol.Visible := Trim(CadNf.dataSet.FieldByName('tipo_emissao').AsString) = '4';
  dbevVLIPIDEVOL.Visible := Trim(CadNf.dataSet.FieldByName('tipo_emissao').AsString) = '4';
end;

procedure TfrmCadNF.pnItesProdutosDetalhadoEnter(Sender: TObject);
begin
  inherited;
  eddCSOSN.Enabled := vDadosIni.vEmp.vRegime = 'SIMPLES';
end;

procedure TfrmCadNF.pnManifestacaoEnter(Sender: TObject);
begin
  inherited;

  Edit6.Text := _LerConfiguracoesRegistroString(Edit6.Name);
  EditHw1.AsValue := _LerConfiguracoesRegistroInteger(EditHw1.Name);
  MaskEdit4.Text := _LerConfiguracoesRegistroString(MaskEdit4.Name, '  /  /    ');
  MaskEdit5.Text := _LerConfiguracoesRegistroString(MaskEdit5.Name, '  /  /    ');
  Edit7.Text := _LerConfiguracoesRegistroString(Edit7.Name);

  CheckBox11.Checked := _LerConfiguracoesRegistroBoolean(CheckBox11.Name);
  CheckBox12.Checked := _LerConfiguracoesRegistroBoolean(CheckBox12.Name);
  CheckBox13.Checked := _LerConfiguracoesRegistroBoolean(CheckBox13.Name);
  CheckBox16.Checked := _LerConfiguracoesRegistroBoolean(CheckBox16.Name);
  CheckBox14.Checked := _LerConfiguracoesRegistroBoolean(CheckBox14.Name);
  CheckBox15.Checked := _LerConfiguracoesRegistroBoolean(CheckBox15.Name);

  RadioGroup4.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup4.Name);
  RadioGroup3.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup3.Name);
  RadioGroup5.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup5.Name);

  RadioGroup4.Items[1] := 'Todos CNPJ <> ' + Copy(vDadosIni.vEmp.vCNPJ,1,8);
//  MaskEdit4.Clear;
//  MaskEdit5.Clear;
  CadNf.vManifestDest.pesquisarUltimos15Dias;

  if PrimeiraPesquisaManifestacao then
  begin
    PrimeiraPesquisaManifestacao := False;

    vDadosIni.configurarGridPeloConfigColunas(
    	DBGridManifestacao,
      GridCfgManifestacao,
      cdsGridManifestacao,
      cdsColunasManifestacao,
      usuario,
      ListGridsAndDataSetsManifestacao,
      vDadosIni.transacaoCol);
  end;
end;

procedure TfrmCadNF.pnModFaturasEnter(Sender: TObject);
begin
  inherited;
  BitBtn33.Visible := vDadosIni.vEmp.vConfGerarBoletoNF = 'S';
  ckUsarValorDoPedido.Visible  := (vDadosIni.vEmp.vNfUsarFormaPagDoPed = 'N') and (CadNf.Config.Conf_Geral.nf_habilitar_fat_usar_valor_ped);
  ckUsarValorDoPedido2.Visible := ckUsarValorDoPedido.Visible;

  //desabilitando somente para não chamar o processo no evento click
  ckUsarValorDoPedido.Enabled  := False;
  ckUsarValorDoPedido2.Enabled := ckUsarValorDoPedido.Enabled;

  ckUsarValorDoPedido.Checked  := ckUsarValorDoPedido.Visible and CadNf.Fatura.UsarValorDoPedido;
  ckUsarValorDoPedido2.Checked := ckUsarValorDoPedido.Checked;

  ckUsarValorDoPedido.Enabled := True;
  ckUsarValorDoPedido2.Enabled := ckUsarValorDoPedido.Enabled;

  //ckUsarValorDoPedido.Visible := vDadosIni.vEmp.vNfUsarFormaPagDoPed = 'N';
//  if not ckUsarValorDoPedido.Visible then
//  begin
//    ckUsarValorDoPedido.Visible  := CadNf.Config.Conf_Geral.nf_habilitar_fat_usar_valor_ped;
//    ckUsarValorDoPedido2.Visible := ckUsarValorDoPedido.Visible;
//  end;
  if CadNf.vBol = nil then
    CadNf.vBol:= TBoletasNF.create;

  try

    CadNf.vBol.selecionaBoletas(CadNf.dataSet.FieldByName('cod_nf').AsInteger);
    if CadNf.vBol.dataSet.RecordCount = 0 then
    begin
      CadNf.vBol.selecionaBoletas(CadNf.dataSet.FieldByName('num_nf').AsInteger,
        StrToInt(CadNf.dataSet.FieldByName('serie').AsString));
    end;
  except
    Exit;
  end;
end;

procedure TfrmCadNF.pnNotasForaEstabEnter(Sender: TObject);
begin
  inherited;
  DBGrid46.DataSource := dtmNF.dsTemp;
  DBGrid45.DataSource := dtmNF.dsTemp2;
end;

procedure TfrmCadNF.pnNotasForaEstabExit(Sender: TObject);
begin
  inherited;
  DBGrid46.DataSource := nil;
  DBGrid45.DataSource := nil;
end;

procedure TfrmCadNF.pnNovaRefNFeAvulsaEnter(Sender: TObject);
begin
  inherited;
  edRefNnf.Clear;
  edRefModelo.Clear;
  edRefSerie.Clear;
  edRefUF.Clear;
  edRefAAMM.Clear;
  edRefCNPJ.Clear;
end;

procedure TfrmCadNF.pnSelTermnalAdmEnter(Sender: TObject);
begin
  inherited;
  edNumTerminalAdm.Text := '';
  edNumTerminalAdm.Visible := False;
  dsDiversos.DataSet := CadNf.buscas;
  dblkListaTermAdm.ListSource := dsDiversos;
  dblkListaTermAdm.ListField := 'COD_TERM_ADM;DESC_TERM_ADM;DESCRICAO_ADM';
  dblkListaTermAdm.KeyField := 'COD_TERM_ADM';
end;

procedure TfrmCadNF.pnSelTermnalAdmExit(Sender: TObject);
begin
  inherited;
  dblkListaTermAdm.ListSource := nil;
  dblkListaTermAdm.ListField := '';
  dblkListaTermAdm.KeyField := '';
  dsDiversos.DataSet := CadNf.buscas;
end;

procedure TfrmCadNF.pnCadastroItensVeiculosExit(Sender: TObject);
begin
  inherited;
  if (not pnConsultaItensVeiculos.Visible) and (pnCadastroItensVeiculos.Visible) and
    (CadNf.dataSet.FieldByName('tipo_nf').AsString = 'V') and
    (CadNf.campo_natureza_nf = 'E') then
  begin
    application.messagebox('Salve ou Cancele o Item antes','Atenção',+0+64);
    if (Self.Enabled) and (Self.Visible) and (pnCadastroItensVeiculos.CanFocus) then
    	pnCadastroItensVeiculos.SetFocus;
  end;
end;

procedure TfrmCadNF.pnVendaForaEstabelecimentoEnter(Sender: TObject);
begin
  inherited;
  EditHw4.FormatSize := '0.4';
  EditHw5.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
  EditHw8.FormatSize := '0.4';
  EditHw9.FormatSize := '0.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);

  TFloatField( DBGrid43.DataSource.DataSet.FieldByName('quantidade')).DisplayFormat := '#0.0000';
  TFloatField( DBGrid43.DataSource.DataSet.FieldByName('qtde_nf')).DisplayFormat := '#0.0000';
  TFloatField( DBGrid43.DataSource.DataSet.FieldByName('qtde_util')).DisplayFormat := '#0.0000';
  TFloatField( DBGrid43.DataSource.DataSet.FieldByName('valor_total')).DisplayFormat := '#0.00';
  TFloatField( DBGrid43.DataSource.DataSet.FieldByName('valor_unitario')).DisplayFormat := '#0.' + vDadosIni.StrZero(0,vDadosIni.vEmp.vCasasDecimais);

  Edit4.Text := vDadosIni.vEmp.vNF_SerieVendaForaEstabelecimento;
  Edit5.Text := vDadosIni.vEmp.vNF_ModeloVendaForaEstabelecimento;
  CadNf.buscas.Close;
  CadNf.buscas.SQL.Text := 'select max(num_nf) num_nf from notafiscal' +
    ' where cod_nf_rem_vfe > 0  and status = ' + QuotedStr(stsFechada) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and natureza_nf = ''S''' +
    ' and modelo_nf = ' + QuotedStr(Trim(vDadosIni.vEmp.vNF_ModeloVendaForaEstabelecimento)) +
    ' and serie = ' + QuotedStr(Trim(vDadosIni.vEmp.vNF_SerieVendaForaEstabelecimento)) ;

  CadNf.buscas.Open;
  EditHw7.AsValue := CadNf.buscas.FieldByName('num_nf').AsInteger + 1;
end;

procedure TfrmCadNF.pn_aba_agronegocioEnter(Sender: TObject);
begin
  inherited;
  pn_guiatr_cadastro.Visible := False;
  pn_guiatr_consulta.Visible := True;
end;

procedure TfrmCadNF.pn_col_entExit(Sender: TObject);
begin
  inherited;
  if ed_col_nome.DataSource.DataSet.State in [dsEdit, dsInsert] then
    if pageDadosNF.ActivePage = tsnf_Coleta then
      CadNf.coleta.Post
    else
      CadNf.entrega.Post;
end;

procedure TfrmCadNF.PopupMenu4Popup(Sender: TObject);
var
  AmenuItem: TMenuItem;
  undVenda: TUnidadeVenda_Model;
  sUndVenda: TStrings;
begin
  inherited;
  CriarconversodoXMLeapplicarsobreQtde1.Visible := False;
  Aplicarfatordeconversoutilizandoaquantidade1.Visible := False;
  DefinirquandoaentradaXMLforiguala1.Visible := False;
  Criarconversao11paraitemselecionado1.Visible := False;
  Criarconversao11paratodositenssemconversodefinida1.Visible := False;
  Verificaritenscomconversoexistente1.Visible := False;

  if (CadNf.notaFechada) or (CadNf.vItem.dataSet.IsEmpty) then
    Exit;

  Verificaritenscomconversoexistente1.Visible := True;

  CadNf.vItem.alterar;
  try

    if (CadNf.vItem.vrDadosItem.unidade_nf = CadNf.vItem.vrDadosItem.ucom) // Igual a NFe
        and (CadNf.vItem.vrDadosItem.qtdemb = 0)
        and (CadNf.vItem.vrDadosItem.qcom > 0)
        and (CadNf.vItem.vrDadosItem.vuncom > 0)
    then
    begin
      sUndVenda := CadNf.vItem.GetUndVendaProd();

      if sUndVenda.IndexOf(CadNf.vItem.vrDadosItem.ucom) >= 0 then
      begin
        undVenda := (sUndVenda.Objects[sUndVenda.IndexOf(CadNf.vItem.vrDadosItem.ucom)] as TUnidadeVenda_Model);

        Aplicarfatordeconversoutilizandoaquantidade1.Caption := Format('Aplicar fator de conversão [ %s ] utilizando a quantidade %s', [undVenda.paridade, FloatToStr(CadNf.vItem.ffloat('qcom'))]);
        Aplicarfatordeconversoutilizandoaquantidade1.Visible := True;
      end
      else
      begin
        CriarconversodoXMLeapplicarsobreQtde1.Caption := Format('Criar conversão [ %s > %s ] do XML e aplicar sobre quantidade %s', [CadNf.vItem.fstr('unidade_nf'), CadNf.vItem.fstr('referencia'), FloatToStr(CadNf.vItem.ffloat('qcom'))]);
        CriarconversodoXMLeapplicarsobreQtde1.Visible := True;
        
        Criarconversao11paraitemselecionado1.Caption := Format('Criar automaticamente a conversão [ 1%s = 1%s ] para item selecionado', [CadNf.vItem.fstr('unidade_nf'), CadNf.vItem.fstr('referencia'), FloatToStr(CadNf.vItem.ffloat('qcom'))]);
        Criarconversao11paraitemselecionado1.Visible := True;

        Criarconversao11paratodositenssemconversodefinida1.Caption := 'Criar automaticamente uma conversao [ 1(und estoque) = 1(und fornecedor) ] para todos itens sem conversão existente';
        Criarconversao11paratodositenssemconversodefinida1.Visible := True;
      end;
    end;

    if (CadNf.vItem.vrDadosItem.unidade_nf <> CadNf.vItem.vrDadosItem.ucom) then
    begin
      sUndVenda := CadNf.vItem.GetUndVendaProd();
      if sUndVenda.IndexOf(CadNf.vItem.vrDadosItem.unidade_nf) >= 0 then
      begin
        undVenda := (sUndVenda.Objects[sUndVenda.IndexOf(CadNf.vItem.vrDadosItem.unidade_nf)] as TUnidadeVenda_Model);

        if //(undVenda.unid_vnd <> CadNf.vItem.vrDadosItem.ucom) // Difere do NFe
          {and} (undVenda.unid_vnd <> undVenda.unid_princ)       // e da principal, caso fornecedor venha a alterar unidade
          and (undVenda.fator > 0)
          and (undVenda.unid_pref = '')
          and (CadNf.vItem.vrDadosItem.qcom > 0)
          and (CadNf.vItem.vrDadosItem.vuncom > 0)then
        begin
          DefinirquandoaentradaXMLforiguala1.Caption := Format('Definir [%s] quando a entrada XML for igual a [%s]', [undVenda.paridade, CadNf.vItem.vrDadosItem.ucom]);
          DefinirquandoaentradaXMLforiguala1.Visible := True;
        end;
      end;
    end;

  finally
    CadNf.vItem.cancelar;
  end;
end;

procedure TfrmCadNF.ProcessosReferenciados1Click(Sender: TObject);
begin
  inherited;
  if not CadNf.vSped.vC110.dataSet.IsEmpty then
    CadNf.abreFormC111;
end;

procedure TfrmCadNF.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  qrLbEmpresa.Caption := vDadosIni.vEmp.vnomeEmpresa ;
  qrLbCNPJ.Caption := 'CNPJ: ' + vDadosIni.vEmp.vCNPJ;
  QRMemo1.Lines.Add(vDadosIni.vEmp.vEndereco + ', ' +vDadosIni.vEmp.vNumeroEnd);
  QRMemo1.Lines.Add(vDadosIni.vEmp.vBairro);
  QRMemo1.Lines.Add(vDadosIni.vEmp.vCidade + ' - ' + vDadosIni.vEmp.vSiglaUF);
  QRMemo1.Lines.Add('FONE: ' + vDadosIni.vEmp.vTelefone);

  if (copy(CadNf.dataSet.FieldByName('serie').AsString, 1, 1) =  '9') and
    (Length(Trim(CadNf.dataSet.FieldByName('serie').AsString)) = 3) then
    QRLabel21.Caption := '90'
  else
    QRLabel21.Caption := vDadosIni.StrZero(vDadosIni.vEmp.vNfe.ibgeCodEstado, 2);
  try
    if Trim(vDadosIni.vEmp.vNfe.pathLogo) <> '' then
      QRImage1.Picture.LoadFromFile(vDadosIni.vEmp.vNfe.pathLogo);
  except
  end;

end;

procedure TfrmCadNF.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Carta de Correção EletrÃ´nica - CC-e');
end;

procedure TfrmCadNF.ReajustarLarguradascolunasManifestacaoClick(
  Sender: TObject);
begin
  inherited;
	vDadosIni.AjustaLaguraColunasCadPadrao(
  	DBGridManifestacao);
end;

procedure TfrmCadNF.ResetarConfiguraesdecolunasManifestacaoClick(
  Sender: TObject);
begin
  inherited;
	vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(
  	DBGridManifestacao,
    GridCfgManifestacao,
    cdsColunasManifestacao,
    cdsGridManifestacao,
    usuario,
    vDadosIni.transacaoCol,
    fResetManifestacao,
    ListGridsAndDataSetsManifestacao,
    false,
    ListPositionsManifestacao);
end;

procedure TfrmCadNF.SalvardadosnoExcelManifestacaoClick(Sender: TObject);
begin
  inherited;
  vDadosIni.SalvardadosnoExcelCadPadraoClick(
  	Sender,
    DBGridManifestacao,
    usuario,
    vDadosIni.transacaoCol,
    lbStatusProcessamento,
    lbTextoProcessamento,
    pnStatusProcessamento,
    Self.Caption);
end;

procedure TfrmCadNF.ScrollBoxManifestacaoEnter(Sender: TObject);
begin
  inherited;
	vConfigColunaManifestacao := true;
end;

procedure TfrmCadNF.SelecionaDesselecionaItem1Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.marcaItem(opmIndividual);
end;

procedure TfrmCadNF.SelecionaTodos1Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.marcaItem(opmTodos);
end;

procedure TfrmCadNF.setCampos;
var
  IbsCbs: TributoDFeIbsCbsEtd;
  ImpSel: TributoDFeImpostoSeletivoEtd;
begin
  with CadNf.vItem.vrDadosItem do
  begin
    if tipo_item = 'O' then
    begin
      num_fab_prod               := edOnCodigo.Text;
      descricao_item_outras.Text := edOnDescricaoOutras.Lines.Text;
      referencia                 := edOnReferencia.Text;
      ncm                        := edOnNCM.Text;
      cest                       := edoCEST.Text;
      cean                       := edocean.Text;
      quantidade                 := edOnQtde.AsValue;
      valor_unitario             := edOnValorUnitario.AsValue;
      rateio_desconto            := edo_rateio_desconto.AsValue;
      valor_total                := edo_valor_total.AsValue;
      rateio_seguro              := edo_rateio_seguro.AsValue;
      rateio_outdesp             := edo_rateio_outdesp.AsValue;
      rateio_frete               := edo_rateio_frete.AsValue;
    end
    else
    begin                                                    
      num_fab_prod               := eddNumFab.Text;
      //descricao_item_outras.Text := edOnDescricaoOutras.Lines.Text;
      referencia                 := eddReferencia.Text;
      ncm                        := eddNCM.Text;
      cest                       := eddCEST.Text;
      cean                       := edcean.Text;
      quantidade                 := eddQtde.AsValue;
      valor_unitario             := eddValorUnitario.AsValue;
      rateio_desconto            := ed_rateio_desconto.AsValue;
      valor_total                := eddValorTotal.AsValue;
      rateio_seguro              := ed_rateio_seguro.AsValue;
      rateio_outdesp             := ed_rateio_outdesp.AsValue;
      rateio_frete               := ed_rateio_frete.AsValue;
      rateio_desp_pf             := ed_rateio_desp_pf.AsValue;
    end;
    cbarra := edcbarra.Text;

    cenq_ipi_nfe := edcenq_ipi_nfe.Text;
    cst_ipi      := edcst_ipi.Text;
    aliq_ipi     := edaliq_ipi.AsValue;
    perc_red_ipi := edperc_red_ipi.AsValue;
    base_ipi     := edbase_ipi.AsValue;
    valor_ipi    := edvalor_ipi.AsValue;
    ipi_cnpjprod := Trim(edipi_cnpjprod.Text);
    ipi_cselo    := edipi_cselo.Text;
    ipi_qselo    := edipi_qselo.AsInteger;
    predbcefet   := edpredbcefet.AsValue;
    vbcefet      := edvbcefet.AsValue;
    picmsefet    := edpicmsefet.AsValue;
    vicmsefet    := edvicmsefet.AsValue;

    fcp_pfcp      := edpfcp.AsValue;
    fcp_vbcfcp    := edvbcfcp.AsValue;
    fcp_vfcp      := edvfcp.AsValue;
    fcp_pfcpst    := edpfcpst.AsValue;
    fcp_vbcfcpst  := edvbcfcpst.AsValue;
    fcp_vfcpst    := edvfcpst.AsValue;
    nfe_indescala := edindEscala.Text;
    nfe_cnpjfab   := Trim(edCNPJFab.Text);
    nfe_nrecopi   := ednfe_nrecopi.Text;
    nfci          := ednfci.Text;
    nfe_cbenef    := edCBenef.Text;
    indTot        := vDadosIni.IfThen(edIndTot.Text = 'N', 0, 1);
    utrib         := Trim(edutrib.Text);
    qtrib         := edqtrib.AsValue;
    vtottrib      := ed_vtot_trib.AsValue;
    valor_icm     := eddvalor_icm.AsValue;
    vicmdeson     := eddvicmdeson.AsValue;

    med_cprodanvisa := edmed_cprodanvisa.Text;
    med_vpmc := edmed_vpmc.AsValue;
    rastro_nlote := edrastro_nlote.Text;
    rastro_qlote := edrastro_qlote.AsValue;
    rastro_dfab := StrToDateTimeDef(edrastro_dfab.Text, 0);
    rastro_dval := StrToDateTimeDef(edrastro_dval.Text, 0);

    pdif         := ed_pdif.AsValue;
    vicmsop_dif  := ed_dif_vicmsop.AsValue;
    vicmsdif     := ed_vicmsdif.AsValue;
    pfcpdif      := ed_pfcpdif.AsValue;
    vfcpefet_dif := ed_dif_vfcpefet.AsValue;
    vfcpdif      := ed_vfcpdif.AsValue;

    cst_pis           := ed_piscofins_cst.Text;
    cst_cofins        := ed_piscofins_cst.Text;
    nat_rec           := ed_piscofins_nat_rec.Text;
    aliq_pis          := ed_ppis.AsValue;
    base_pis          := ed_pis_vbc.AsValue;
    base_cofins       := ed_pis_vbc.AsValue;
    aliq_pis_quant    := ed_pis_valiq.AsValue;
    quant_bc_pis      := ed_pis_qbc.AsValue;
    aliq_cofins       := ed_pcofins.AsValue;
    base_cofins       := ed_cofins_vbc.AsValue;
    aliq_cofins_quant := ed_cofins_valiq.AsValue;
    quant_bc_cofins   := ed_cofins_qbc.AsValue;
    valor_pis         := ed_vpis.AsValue;
    valor_cofins      := ed_vcofins.AsValue;
    motdes_pc         := VarToInt(ed_piscofins_motivo_deson.KeyValue);
    vpisdeson         := ed_vpisdeson.AsValue;
    vcofinsdeson      := ed_vcofinsdeson.AsValue;
    indsomapisst      := IfThen(ed_indSomaPISST.Text = 'N', 0, 1);
    indsomacofinsst   := IfThen(ed_indSomaCOFINSST.Text = 'N', 0, 1);

    chave_nfe_ref     := edChaveNFeRef.Text;
    nitem_nfe_ref     := edNitemNFeRef.AsInteger;
    CadNf.vItem.vrDadosItem.nbs := ed_nbs.Text;

    nitem_xml           := ed_icment_nitem_xml.AsInteger;
    icm_orig            := ed_icment_orig.Text;
    icm_cst             := ed_icment_cst.Text;
    icm_csosn           := ed_icment_csosn.Text;
    icm_modbcst         := ed_icment_modbcst.Text;
    icm_pred            := ed_icment_pred.AsValue;
    icm_vbc             := ed_icment_vbc.AsValue;
    icm_picm            := ed_icment_picm.AsValue;
    icm_vicm            := ed_icment_vicm.AsValue;
    icm_vbcfcp          := ed_icment_vbcfcp.AsValue;
    icm_pfcp            := ed_icment_pfcp.AsValue;
    icm_vfcp            := ed_icment_vfcp.AsValue;
    icm_pmvast          := ed_icment_pmvast.AsValue;
    icm_predbcst        := ed_icment_predst.AsValue;
    icm_vbcst           := ed_icment_vbcst.AsValue;
    icm_picmst          := ed_icment_picmst.AsValue;
    icm_vicmst          := ed_icment_vicmst.AsValue;
    icm_vbcfcpst        := ed_icment_vbcfcpst.AsValue;
    icm_pfcpst          := ed_icment_pfcpst.AsValue;
    icm_vfcpst          := ed_icment_vfcpst.AsValue;
    icm_vicmdeson       := ed_icment_vicmdeson.AsValue;
    icm_vbcstret        := ed_icment_vbcstret.AsValue;
    icm_pst             := ed_icment_pst.AsValue;
    icm_vicmssubstituto := ed_icment_vicmssusbstituto.AsValue;
    icm_vicmsstret      := ed_icment_vicmstret.AsValue;
    icm_vbcfcpstret     := ed_icment_vbcfcpstret.AsValue;
    icm_pfcpstret       := ed_icment_pfcpstret.AsValue;
    icm_vfcpstret       := ed_icment_vfcpstret.AsValue;
    ant_vicmssubstituto := ed_ant_vicmssubstituto.AsValue;
    base_icmant_sub     := ed_base_icmant_sub.AsValue;
    ant_pst             := ed_ant_pst.AsValue;
    valor_icmant_sub    := ed_valor_icmant_sub.AsValue;
    fcp_vbcfcpstret     := ed_fcp_vbcfcpstret.AsValue;
    fcp_pfcpstret       := ed_fcp_pfcpstret.AsValue;
    fcp_vfcpstret       := ed_fcp_vfcpstret.AsValue;
    icm_pdif            := ed_icm_pdif.AsValue;
    icm_vicmsdif        := ed_icm_vdif.AsValue;
    icm_vicmsop_dif     := ed_icm_vicmop_dif.AsValue;
    icm_pfcpdif         := ed_icm_fcp_pdif.AsValue;
    icm_vfcpdif         := ed_icm_fcp_vdif.AsValue;
    icm_vfcpefet_dif    := ed_icm_fcp_vfcpop.AsValue;    

    qbcmono             := ed_qbcmono.AsValue;
    adremicms           := ed_adremicms.AsValue;
    vicmsmono           := ed_vicmsmono.AsValue;
    qbcmonoreten        := ed_qbcmonoreten.AsValue;
    adremicmsreten      := ed_adremicmsreten.AsValue;
    vicmsmonoreten      := ed_vicmsmonoreten.AsValue;
    qbcmonoret          := ed_qbcmonoret.AsValue;
    adremicmsret        := ed_adremicmsret.AsValue;
    vicmsmonoret        := ed_vicmsmonoret.AsValue;

    icm_qbcmono         := ed_icm_qbcmono.AsValue;
    icm_adremicms       := ed_icm_adremicms.AsValue;
    icm_vicmsmono       := ed_icm_vicmsmono.AsValue;
    icm_qbcmonoreten    := ed_icm_qbcmonoreten.AsValue;
    icm_adremicmsreten  := ed_icm_adremicmsreten.AsValue;
    icm_vicmsmonoreten  := ed_icm_vicmsmonoreten.AsValue;
    icm_qbcmonoret      := ed_icm_qbcmonoret.AsValue;
    icm_adremicmsret    := ed_icm_adremicmsret.AsValue;
    icm_vicmsmonoret    := ed_icm_vicmsmonoret.AsValue;

    vbcretfed  := ed_vbcretfed.AsValue;
    pretir     := ed_pretir.AsValue;
    pretcsll   := ed_pretcsll.AsValue;
    pretpis    := ed_pretpis.AsValue;
    pretcofins := ed_pretcofins.AsValue;
    vretir     := ed_vretir.AsValue;
    vretcsll   := ed_vretcsll.AsValue;
    vretpis    := ed_vretpis.AsValue;
    vretcofins := ed_vretcofins.AsValue;

    {$REGION 'aba icms'}
    tipo_calc    := ed_tipoCalc.ItemIndex;
    tipo_calc_pc := ed_tipoCalcPC.ItemIndex;
    tipo_calc_retfed := ed_tipoCalcRet.ItemIndex;

    qbcmono        := ed_qbcmono.AsValue;
    qbcmonoreten   := ed_qbcmonoreten.AsValue;
    qbcmonoret     := ed_qbcmonoret.AsValue;
    adremicms      := ed_adremicms.AsValue;
    adremicmsreten := ed_adremicmsreten.AsValue;
    adremicmsret   := ed_adremicmsret.AsValue;
    vicmsmono      := ed_vicmsmono.AsValue;
    vicmsmonoreten := ed_vicmsmonoreten.AsValue;
    vicmsmonoret   := ed_vicmsmonoret.AsValue;
    {$ENDREGION}

    if YesNoEnum(CadNf.fint('dfe_trib_ignorar')) = ynYes then
    begin
      IbsCbs := nil;
      ImpSel := nil;
    end
    else
    begin
      IbsCbs := FrameIbsCbs1.GetIbsCbs();
      ImpSel := nil; //FrameImpostoSeletivo1.GetImpostoSeletivo();
    end;

    if (IbsCbs = nil) and (ImpSel = nil) then
      tributosRTC := nil
    else
      tributosRTC := TributoDFeContextEtd.Create(
      	dfe_trib_id,
        tdfoNotaFiscal,
        ImpSel,
        IbsCbs
      );
  end;
end;

procedure TfrmCadNF.setCamposDetalhado;
var
  undVenda: TUnidadeVenda_Model;
begin
  try
    setCampos;

    //CadNf.vItem.vrDadosItem.num_fab_prod := eddNumFab.Text;
    CadNf.vItem.vrDadosItem.num_fab_fornecedor := eddNumFabFornecedor.Text;
//    CadNf.vItem.vrDadosItem.quantidade := eddQtde.AsValue;
    //CadNf.vItem.vrDadosItem.referencia := eddReferencia.Text;
    CadNf.vItem.vrDadosItem.grupo_prod := eddGrupo.AsInteger;
    CadNf.vItem.vrDadosItem.cod_prod := eddCodigo.Text;
    CadNf.vItem.vrDadosItem.perc_red_prod_sub := eddReducaoBaseICMSub.AsValue;
//    CadNf.vItem.vrDadosItem.valor_unitario := eddValorUnitario.AsValue;
    //CadNf.vItem.vrDadosItem.perc_desconto := eddPercDesc.AsValue;
//    CadNf.vItem.vrDadosItem.valor_total := eddValorTotal.AsValue;
    CadNf.vItem.vrDadosItem.codigo_nop := eddCFOP.AsValue;
    CadNf.vItem.vrDadosItem.cst := eddCST.AsString;
//    CadNf.vItem.vrDadosItem.cst_ipi := eddCSTIPI.Text;
//    CadNf.vItem.vrDadosItem.ncm := eddNCM.Text;
    CadNf.vItem.vrDadosItem.csosn := eddCSOSN.AsString;
    CadNf.vItem.vrDadosItem.perc_red_prod := eddReducaoBaseICM.AsValue;
    CadNf.vItem.vrDadosItem.aliq_icmsub := eddAliqICMSub.AsValue;
    CadNf.vItem.vrDadosItem.mva := eddMVA.AsValue;
    CadNf.vItem.vrDadosItem.ant_calc := vDadosIni.IfThen(ckdAnt_calc.Checked, 'D', '');
    CadNf.vItem.vrDadosItem.base_icmsub := eddBaseICMSub.AsValue;
    CadNf.vItem.vrDadosItem.valor_icmsub := eddValorICMSST.AsValue;
    if CadNf.vItem.vrDadosItem.ant_calc = 'D' then
    begin
      CadNf.vItem.vrDadosItem.base_icmsub_ant := CadNf.vItem.vrDadosItem.base_icmsub / CadNf.vItem.vrDadosItem.quantidade;
      CadNf.vItem.vrDadosItem.valor_icmsub_ant := CadNf.vItem.vrDadosItem.valor_icmsub / CadNf.vItem.vrDadosItem.quantidade;
    end;    
//    CadNf.vItem.vrDadosItem.aliq_ipi := eddAliqIPI.AsValue;
//    CadNf.vItem.vrDadosItem.perc_red_ipi := eddReducaoBaseIPI.AsValue;
//    CadNf.vItem.vrDadosItem.base_ipi := eddBaseIPI.AsValue;
    CadNf.vItem.vrDadosItem.descricao_item := eddDescricao.Text;
    CadNf.vItem.vrDadosItem.valor_dif := eddValorDif.AsValue;
    CadNf.vItem.vrDadosItem.base_iss := eddBaseISS.AsValue;
    CadNf.vItem.vrDadosItem.aliq_iss := eddAliqISS.AsValue;
    CadNf.vItem.vrDadosItem.valor_iss := edvalor_iss.AsValue;
    CadNf.vItem.vrDadosItem.modbc := eddModBC.ItemIndex;
    CadNf.vItem.vrDadosItem.modbcst := eddModBCST.ItemIndex;
//    CadNf.vItem.vrDadosItem.aliq_icm_simples := eddAliqICM.AsValue;
//    CadNf.vItem.vrDadosItem.base_icm_simples := eddBaseICM.AsValue;
    CadNf.vItem.vrDadosItem.ind_desoneracao := FlkMotivoDesoneracao.KeyAsInteger;

//    CadNf.vItem.vrDadosItem.cst_ipi := Copy(eddCSTIPI.Text, 1, 2);

    CadNf.vItem.vrDadosItem.mnf:=eddMNF.Text;
    {
    if not eddUnidade_nf.Enabled then
    begin
      eddUnidade_nf.Text := '';
      eddQTDEMB_old.AsValue := 0;
      eddQTDEMBREC.AsValue := 0;
      eddVLREMBNF.AsValue := 0;
    end;
    }
    if edUndVnd.ItemIndex >= 0 then
    begin
      undVenda := (edUndVnd.Items.Objects[edUndVnd.ItemIndex] as TUnidadeVenda_Model);

      //CadNf.vItem.vrDadosItem.qtdemb := eddQTDEMB.AsValue;
      CadNf.vItem.vrDadosItem.qtdembrec := eddQTDEMBREC.AsValue;
      //CadNf.vItem.vrDadosItem.qtdemb := CadNf.vItem.vrDadosItem.quantidade / CadNf.vItem.vrDadosItem.qtdembrec;
      CadNf.vItem.vrDadosItem.qtdemb := undVenda.fator;
      CadNf.vItem.vrDadosItem.vlrembnf := eddVLREMBNF.AsValue ;
      //CadNf.vItem.vrDadosItem.unidade_nf := eddUnidade_nf.Text ;
      CadNf.vItem.vrDadosItem.unidade_nf := undVenda.unid_vnd;
    end;

    CadNf.vItem.vrDadosItem.vlbrureal:=eddVLBRUREAL.AsValue;
    CadNf.vItem.vrDadosItem.pdesc_r:=eddPDESC_R.AsValue;
    CadNf.vItem.vrDadosItem.vlrembnfr:=eddVLREMBNFR.AsValue;
    {
    CadNf.vItem.vrDadosItem.cst_pis := copy(eddCSTPIS.Items[eddCSTPIS.ItemIndex],1,2);
    CadNf.vItem.vrDadosItem.cst_cofins := CadNf.vItem.vrDadosItem.cst_pis;

    if bt_it_pc_alterar_aliq_perc.Caption = '$' then
    begin
      CadNf.vItem.vrDadosItem.aliq_pis_quant := eddAliqPIS.AsValue;
      CadNf.vItem.vrDadosItem.quant_bc_pis := eddBasePIS.AsValue;
      CadNf.vItem.vrDadosItem.aliq_pis := 0;
      CadNf.vItem.vrDadosItem.base_pis := 0;
    end
    else
    begin
      CadNf.vItem.vrDadosItem.aliq_pis := eddAliqPIS.AsValue;
      CadNf.vItem.vrDadosItem.base_pis := eddBasePIS.AsValue;
      CadNf.vItem.vrDadosItem.aliq_pis_quant := 0;
      CadNf.vItem.vrDadosItem.quant_bc_pis := 0;
    end;

    if bt_it_pc_alterar_aliq_perc.Caption = '$' then
    begin
      CadNf.vItem.vrDadosItem.aliq_cofins_quant := eddAliqCOFINS.AsValue;
      CadNf.vItem.vrDadosItem.quant_bc_cofins := CadNf.vItem.vrDadosItem.quant_bc_pis;
      CadNf.vItem.vrDadosItem.aliq_cofins := 0;
      CadNf.vItem.vrDadosItem.base_cofins := 0;
    end
    else
    begin
      CadNf.vItem.vrDadosItem.aliq_cofins := eddAliqCOFINS.AsValue;
      CadNf.vItem.vrDadosItem.base_cofins := CadNf.vItem.vrDadosItem.base_pis;
      CadNf.vItem.vrDadosItem.aliq_cofins_quant := 0;
      CadNf.vItem.vrDadosItem.quant_bc_cofins := 0;
    end;
    }

    CadNf.vItem.vrDadosItem.base_ii := eddBCII.AsValue;
    CadNf.vItem.vrDadosItem.valor_despadu_ii := eddDespAduII.AsValue;
    CadNf.vItem.vrDadosItem.valor_iof_ii := eddIOFII.AsValue;
    CadNf.vItem.vrDadosItem.valor_ii := eddValorII.AsValue;

    CadNf.vItem.vrDadosItem.comb_cprodanp       := eddCodANP.Text;
    CadNf.vItem.vrDadosItem.comb_pmixgn         := eddPMixGN.AsValue;
    CadNf.vItem.vrDadosItem.comb_codif          := eddCODIF.Text;
    CadNf.vItem.vrDadosItem.comb_ufcons         := eddUFCons.Text;
    CadNf.vItem.vrDadosItem.comb_qtemp          := eddQAmb.AsValue;
    CadNf.vItem.vrDadosItem.comb_cide_valiqprod := eddCIDE_Aliq.AsValue;
    CadNf.vItem.vrDadosItem.comb_cide_qbcprod   := eddCIDE_base.AsValue;
    CadNf.vItem.vrDadosItem.comb_cide_vcide     := eddCIDE_valor.AsValue;
    CadNf.vItem.vrDadosItem.comb_descanp        := edDescANP.Text;
    CadNf.vItem.vrDadosItem.comb_pglp           := edpGLP.AsValue;
    CadNf.vItem.vrDadosItem.comb_pgnn           := edpGNn.AsValue;
    CadNf.vItem.vrDadosItem.comb_pgni           := edpGNi.AsValue;
    CadNf.vItem.vrDadosItem.comb_vpart          := edvPart.AsValue;

    CadNf.vItem.vrDadosItem.xped_compra := eddXPedCompra.Text;
    CadNf.vItem.vrDadosItem.nitemped_compra := eddNItemPedCompra.AsInteger;
    CadNf.vItem.vrDadosItem.nfe_pdevol := eddItemDevolPercDevol.AsValue;
    CadNf.vItem.vrDadosItem.nfe_vipidevol := eddItemDevolVLIPIDevol.AsValue;

//    CadNf.vItem.vrDadosItem.cenq_ipi_nfe := eddEnqIPI.Text;
//    CadNf.vItem.vrDadosItem.cest := eddCEST.Text;
    CadNf.vItem.vrDadosItem.vbcufdest := eddvBCUFDest.AsValue;
    CadNf.vItem.vrDadosItem.pfcpufdest := eddpFCPUFDest.AsValue;
    CadNf.vItem.vrDadosItem.picmsufdest := eddpICMSUFDest.AsValue;
    CadNf.vItem.vrDadosItem.picmsinter := eddpICMSInter.AsValue;
    CadNf.vItem.vrDadosItem.picmsinterpart := eddpICMSInterPart.AsValue;
    CadNf.vItem.vrDadosItem.vfcpufdest := eddvFCPUFDest.AsValue;
    CadNf.vItem.vrDadosItem.vicmsufdest := eddvICMSUFDest.AsValue;
    CadNf.vItem.vrDadosItem.vicmsufremet := eddvICMSUFRemet.AsValue;

    CadNf.vItem.vrDadosItem.antec_trib := eddAntT.Text;
    //CadNf.vItem.vrDadosItem.cean := edcean.Text;

//    with CadNf.vItem.vrDadosItem do
//    begin
//      rateio_desconto := ed_rateio_desconto.AsValue;
//      rateio_seguro   := ed_rateio_seguro.AsValue;
//      rateio_outdesp  := ed_rateio_outdesp.AsValue;
//      rateio_frete    := ed_rateio_frete.AsValue;
//    end;

    if (vDadosIni.vEmp.vUsarAltPrecoNFDigItem = 'S') and (CadNf.campo_natureza_nf = 'E') then
    begin
      CadNf.vItem.vrDadosItem.prec_vnd_prod := eddPrecoVendaVarejo.AsValue;
      CadNf.vItem.vrDadosItem.prec_vnd_proda := eddPrecoVendaAtacado.AsValue;
    end;

    CadNf.vItem.vrDadosItem.vicmdeson := eddvicmdeson.AsValue;
    if (Trim(CadNf.vItem.vrDadosItem.csosn) <> '') and (Trim(CadNf.vItem.vrDadosItem.csosn) <> '900') and
      (CadNf.campo_natureza_nf = 'S') and (CadNf.fequals('tipo_emissao', '1')) then
    begin
      CadNf.vItem.vrDadosItem.valor_icm_simples := eddvalor_icm.AsValue;
      CadNf.vItem.vrDadosItem.aliq_icm_simples := eddAliqICM.AsValue;
      CadNf.vItem.vrDadosItem.base_icm_simples := eddBaseICM.AsValue;
    end
    else
    begin
      CadNf.vItem.vrDadosItem.valor_icm := eddvalor_icm.AsValue;
      CadNf.vItem.vrDadosItem.aliq_icm := eddAliqICM.AsValue;
      CadNf.vItem.vrDadosItem.base_icm := eddBaseICM.AsValue;
    end;
    if eddValidade.Text <> '  /  /    ' then
      CadNf.vItem.vrDadosItem.data_validade := StrToDate(eddValidade.Text);
  except
  end;
end;

procedure TfrmCadNF.setCamposOutrasNf;
begin
  try
    setCampos;

    CadNf.vItem.vrDadosItem.num_fab_prod := edOnCodigo.Text;
    CadNf.vItem.vrDadosItem.quantidade := edOnQtde.AsValue;
    CadNf.vItem.vrDadosItem.referencia := edOnReferencia.Text;
    CadNf.vItem.vrDadosItem.valor_unitario := edOnValorUnitario.AsValue;
    //CadNf.vItem.vrDadosItem.perc_desconto := edOnPercentualDesconto.AsValue;
    CadNf.vItem.vrDadosItem.valor_total := edo_valor_total.AsValue;
    CadNf.vItem.vrDadosItem.codigo_nop := edOnCFOP.AsInteger;
    CadNf.vItem.vrDadosItem.cst := edOnCST.AsString;
    CadNf.vItem.vrDadosItem.ncm := edOnNCM.Text;
    CadNf.vItem.vrDadosItem.csosn := edOnCSOSN.AsString;
//    CadNf.vItem.vrDadosItem.aliq_icm := edOnAliqICM.AsValue;
    CadNf.vItem.vrDadosItem.perc_red_prod := edOnRedBaseICM.AsValue;
//    CadNf.vItem.vrDadosItem.base_icm := edOnBaseICM.AsValue;
    CadNf.vItem.vrDadosItem.aliq_icmsub := edOnAliqICMSub.AsValue;
    CadNf.vItem.vrDadosItem.mva := edOnMVA.AsValue;
    CadNf.vItem.vrDadosItem.base_icmsub := edOnBaseICMSub.AsValue;
    CadNf.vItem.vrDadosItem.ant_calc := vDadosIni.IfThen(ckonAnt_calc.Checked, 'D', '');
//    CadNf.vItem.vrDadosItem.aliq_ipi := edOnAliqIPI.AsValue;
//    CadNf.vItem.vrDadosItem.perc_red_ipi := edOnRedBaseIPI.AsValue;
//    CadNf.vItem.vrDadosItem.base_ipi := edOnBaseIPI.AsValue;
//    CadNf.vItem.vrDadosItem.valor_ipi:= edOnValorIPI.AsValue;
//    CadNf.vItem.vrDadosItem.valor_icm := edOnValorICM.AsValue;
    CadNf.vItem.vrDadosItem.perc_red_prod_sub := edOnRedBaseST.AsValue;
    CadNf.vItem.vrDadosItem.valor_icmsub := edOnValorST.AsValue;
    CadNf.vItem.vrDadosItem.descricao_item_outras.Text := edOnDescricaoOutras.Lines.Text;

    CadNf.vItem.vrDadosItem.cst_pis := copy(edoCSTPIS.Items[edoCSTPIS.ItemIndex],1,2);
    CadNf.vItem.vrDadosItem.cst_cofins := CadNf.vItem.vrDadosItem.cst_pis;

    if SpeedButton45.Caption = '$' then
    begin
      CadNf.vItem.vrDadosItem.aliq_pis_quant := edoAliqPIS.AsValue;
      CadNf.vItem.vrDadosItem.quant_bc_pis := edoBasePIS.AsValue;
      CadNf.vItem.vrDadosItem.aliq_pis := 0;
      CadNf.vItem.vrDadosItem.base_pis := 0;
    end
    else
    begin
      CadNf.vItem.vrDadosItem.aliq_pis := edoAliqPIS.AsValue;
      CadNf.vItem.vrDadosItem.base_pis := edoBasePIS.AsValue;
      CadNf.vItem.vrDadosItem.aliq_pis_quant := 0;
      CadNf.vItem.vrDadosItem.quant_bc_pis := 0;
    end;

    if SpeedButton45.Caption = '$' then
    begin
      CadNf.vItem.vrDadosItem.aliq_cofins_quant := edoAliqCOFINS.AsValue;
      CadNf.vItem.vrDadosItem.quant_bc_cofins := CadNf.vItem.vrDadosItem.quant_bc_pis;
      CadNf.vItem.vrDadosItem.aliq_cofins := 0;
      CadNf.vItem.vrDadosItem.base_cofins := 0;
    end
    else
    begin
      CadNf.vItem.vrDadosItem.aliq_cofins := edoAliqCOFINS.AsValue;
      CadNf.vItem.vrDadosItem.base_cofins := CadNf.vItem.vrDadosItem.base_pis;
      CadNf.vItem.vrDadosItem.aliq_cofins_quant := 0;
      CadNf.vItem.vrDadosItem.quant_bc_cofins := 0;
    end;

    CadNf.vItem.vrDadosItem.base_ii := edoBCII.AsValue;
    CadNf.vItem.vrDadosItem.valor_despadu_ii := edoDespAduII.AsValue;
    CadNf.vItem.vrDadosItem.valor_iof_ii := edoIOFII.AsValue;
    CadNf.vItem.vrDadosItem.valor_ii := edoValorII.AsValue;

    CadNf.vItem.vrDadosItem.comb_cprodanp       := edoCodANP.Text;
    CadNf.vItem.vrDadosItem.comb_pmixgn         := edoPMixGN.AsValue;
    CadNf.vItem.vrDadosItem.comb_codif          := edoCODIF.Text;
    CadNf.vItem.vrDadosItem.comb_ufcons         := edoUFCons.Text;
    CadNf.vItem.vrDadosItem.comb_qtemp          := edoQAmb.AsValue;
    CadNf.vItem.vrDadosItem.comb_cide_valiqprod := edoCIDE_Aliq.AsValue;
    CadNf.vItem.vrDadosItem.comb_cide_qbcprod   := edoCIDE_base.AsValue;
    CadNf.vItem.vrDadosItem.comb_cide_vcide     := edoCIDE_valor.AsValue;
    CadNf.vItem.vrDadosItem.comb_descanp        := edoDescANP.Text;
    CadNf.vItem.vrDadosItem.comb_pglp           := edopGLP.AsValue;
    CadNf.vItem.vrDadosItem.comb_pgnn           := edopGNn.AsValue;
    CadNf.vItem.vrDadosItem.comb_pgni           := edopGNi.AsValue;
    CadNf.vItem.vrDadosItem.comb_vpart          := edovPart.AsValue;

    CadNf.vItem.vrDadosItem.xped_compra := edoXPedCompra.Text;
    CadNf.vItem.vrDadosItem.nitemped_compra := edoNItemPedCompra.AsInteger;
    CadNf.vItem.vrDadosItem.nfe_pdevol := edoItemDevolPercDevol.AsValue;
    CadNf.vItem.vrDadosItem.nfe_vipidevol := edoItemDevolVLIPIDevol.AsValue;
//    CadNf.vItem.vrDadosItem.cst_ipi := edoCSTIPI.Text;

    CadNf.vItem.vrDadosItem.antec_trib := edoAntT.Text;

//    CadNf.vItem.vrDadosItem.cenq_ipi_nfe := edoEnqIPI.Text;
    CadNf.vItem.vrDadosItem.cest := edoCEST.Text;
    CadNf.vItem.vrDadosItem.vbcufdest := edovBCUFDest.AsValue;
    CadNf.vItem.vrDadosItem.pfcpufdest := edopFCPUFDest.AsValue;
    CadNf.vItem.vrDadosItem.picmsufdest := edopICMSUFDest.AsValue;
    CadNf.vItem.vrDadosItem.picmsinter := edopICMSInter.AsValue;
    CadNf.vItem.vrDadosItem.picmsinterpart := edopICMSInterPart.AsValue;
    CadNf.vItem.vrDadosItem.vfcpufdest := edovFCPUFDest.AsValue;
    CadNf.vItem.vrDadosItem.vicmsufdest := edovICMSUFDest.AsValue;
    CadNf.vItem.vrDadosItem.vicmsufremet := edovICMSUFRemet.AsValue;
    CadNf.vItem.vrDadosItem.cean := edocean.Text;

    if (Trim(CadNf.vItem.vrDadosItem.csosn) <> '') and (CadNf.campo_natureza_nf = 'S') and
      (CadNf.fdif('devolucao', 'SIM')) then
    begin
      CadNf.vItem.vrDadosItem.valor_icm_simples := edOnValorICM.AsValue;
      CadNf.vItem.vrDadosItem.aliq_icm_simples := edOnAliqICM.AsValue;
      CadNf.vItem.vrDadosItem.base_icm_simples := edOnBaseICM.AsValue;
    end
    else
    begin
      CadNf.vItem.vrDadosItem.valor_icm := edOnValorICM.AsValue;
      CadNf.vItem.vrDadosItem.aliq_icm := edOnAliqICM.AsValue;
      CadNf.vItem.vrDadosItem.base_icm := edOnBaseICM.AsValue;
    end;

    with CadNf.vItem.vrDadosItem do
    begin
      rateio_desconto := edo_rateio_desconto.AsValue;
      rateio_seguro   := edo_rateio_seguro.AsValue;
      rateio_outdesp  := edo_rateio_outdesp.AsValue;
      rateio_frete    := edo_rateio_frete.AsValue;
    end;
  except
  end;
end;

procedure TfrmCadNF.setDadosFormularioMontarNfComando;
begin
  RegistroWin.Write(Self.ClassName, edComandoChassi.Name, edComandoChassi.Text);
  RegistroWin.Write(Self.ClassName, edNomeClienteComando.Name, edNomeClienteComando.Text);
  RegistroWin.Write(Self.ClassName, edClienteComando.Name, edClienteComando.AsInteger);
  RegistroWin.Write(Self.ClassName, edDataIniComando.Name, edDataIniComando.Text);
  RegistroWin.Write(Self.ClassName, edDataFimComando.Name, edDataFimComando.Text);
end;

procedure TfrmCadNF.setDadosFormularioMontarNfPedCompra;
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2º. ParÃ¢metro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteInteger(edNpedPC.Name, Trunc(edNpedPC.AsValue));
      Registro.WriteString(edDataIniPC.Name, edDataIniPC.Text);
      Registro.WriteString(edDataFimPC.Name, edDataFimPC.Text);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmCadNF.setDadosFormularioMontarNfPedVenda;
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2º. ParÃ¢metro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteBool(ckReqPV.Name, ckReqPV.Checked);
      Registro.WriteBool(ckOSPV.Name, ckOSPV.Checked);
      Registro.WriteBool(ckValorNf.Name, ckValorNf.Checked);
      Registro.WriteInteger(edNPedVenda.Name, Trunc(edNPedVenda.AsValue));
      Registro.WriteString(edDataIniPV.Name, edDataIniPV.Text);
      Registro.WriteString(edDataFimPV.Name, edDataFimPV.Text);
      Registro.WriteFloat(edCodClForPedVenda.Name, edCodClForPedVenda.AsValue);
      Registro.WriteBool(ckPVApenasComCupomFiscal.Name, ckPVApenasComCupomFiscal.Checked);
      Registro.WriteBool(ckVendasVAN.Name, ckVendasVAN.Checked);
      Registro.WriteBool(ckEsconderNotas.Name, ckEsconderNotas.Checked);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmCadNF.setDadosFormularioMontarNfTransito;
var
  Registro: TRegistry;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2º. ParÃ¢metro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteString(edDataIniTrans.Name, edDataIniTrans.Text);
      Registro.WriteString(edDataFimTrans.Name, edDataFimTrans.Text);
      Registro.WriteString(edNumNFChassiTrans.Name, edNumNFChassiTrans.Text);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmCadNF.setNComando(nComando: integer);
begin
  CadNf.setNComando(nComando);
end;

procedure TfrmCadNF.setNpedVendaTipoPedVenda(nPedVenda: integer;
  tipoPedVenda: string);
begin
  CadNf.setNpedVendaTipoPedVenda(nPedVenda,tipoPedVenda);
end;

procedure TfrmCadNF.SomarvaloresdacolunaManifestacaoClick(Sender: TObject);
begin
  inherited;
	vDadosIni.SomarvaloresdacolunaCadPadraoClick(
  	DBGridManifestacao,
    lbStatusProcessamento,
    lbTextoProcessamento,
    pnStatusProcessamento);
end;

procedure TfrmCadNF.spAtivarDFeClick(Sender: TObject);
begin
  inherited;
  CadNf.vManifestDest._ativarDFe;
end;

procedure TfrmCadNF.spbAnteriorClick(Sender: TObject);
begin
  inherited;
  CadNf.vItem.dataSet.Prior;
  CadNf.vItem.cancelar;
  CadNf.vItem.alterar;
  getCamposDetalhado;
  edDTipoExit(edDTipo);

  if pgControlItensNFe.ActivePage = tsMerc_ICMS_Entrada then
    sp_ibscbsent_verdados.Click();
end;

procedure TfrmCadNF.spbDetalharItemClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if not vDadosIni.PesqPros('NF0050', 'CONSULTA', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  btSalvarItemProdServDetalhado.Enabled :=False;
  btCancelarItemProdServDetalhado.Enabled :=False;
  spbSairDetalhe.Visible :=True;
  spbAnterior.Visible :=True;
  spbProximo.Visible :=True;
  CadNf.vItem.cancelar;
  CadNf.vItem.alterar;
  getCamposDetalhado;
  edDTipoExit(edDTipo);
  for I := 0 to pgControlItensNFe.PageCount - 1 do
    pgControlItensNFe.Pages[I].Enabled := False;

//  pnICMSNormal.Enabled := False;
//  pnICMSST.Enabled := False;
//  pnIPI.Enabled := False;
  pnCadastroItensProdDetalhado.Visible := True;
  pnCadastroItensProdDetalhado.Enabled := True;
  pnConsultaItensProdDetalhado.Visible := False;
  pnConsultaItensProdDetalhado.Enabled := False;

  pageDadosNF.ActivePage := tsnf_itens;
  groupItensNota.Parent := tsnf_itens;

  VisualItemTributosRtcIgnorar();

  if CadNf.fequals('tipo_nf', 'O') then
    pgControlItensNFe.ActivePage       := tsMerc_itens_outras
  else if CadNf.fstrin('tipo_nf', ['P', 'S']) then
    pgControlItensNFe.ActivePage       := tsMerc_Mercadorias;

  campos_itens_cstChange(eddCST);
  if (Self.Enabled) and (Self.Visible) and (BitBtn6.CanFocus) then
    BitBtn6.SetFocus;
end;

procedure TfrmCadNF.spbDetalhesFormPagClick(Sender: TObject);
begin
  inherited;
  CadNf.detalheFormPagamento;
end;

procedure TfrmCadNF.spbProximoClick(Sender: TObject);
begin
  inherited;
  CadNf.vItem.dataSet.Next;
  CadNf.vItem.cancelar;
  CadNf.vItem.alterar;
  getCamposDetalhado;
  edDTipoExit(edDTipo);

  if pgControlItensNFe.ActivePage = tsMerc_ICMS_Entrada then
    sp_ibscbsent_verdados.Click();
end;

procedure TfrmCadNF.spbSairDetalheClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  pnConsultaItensProdDetalhado.Visible := True;
  pnConsultaItensProdDetalhado.Enabled := True;
  pnCadastroItensProdDetalhado.Visible := False;
  pnCadastroItensProdDetalhado.Enabled := False;
  for I := 0 to pgControlItensNFe.PageCount - 1 do
    pgControlItensNFe.Pages[I].Enabled := True;
//  pnICMSNormal.Enabled := True;
//  pnICMSNormal.Height := 41;
//  pnICMSST.Enabled := True;
//  pnICMSST.Height := 41;
end;

procedure TfrmCadNF.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  edDataIniPV.Clear;
  edDataFimPV.Clear;
end;

procedure TfrmCadNF.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'A', CadNf.buscas) then
    Exit;
  CadNf.alteraCstNfTransito;
end;

procedure TfrmCadNF.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  CadNf.abreConhecimentoDeFrete;
end;

procedure TfrmCadNF.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  edDataIniPC.Clear;
  edDataFimPC.Clear;
end;

procedure TfrmCadNF.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  CadNf.removerNumeroDoPedidoDaNotaFiscal;
end;

procedure TfrmCadNF.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.PriorMargem;
  getCamposMargem;
  if (Self.Enabled) and (Self.Visible) and (BitBtn28.CanFocus) then
  	BitBtn28.SetFocus;
  if (Self.Enabled) and (Self.Visible) and (edMarkUpV.CanFocus) then
  	edMarkUpV.SetFocus;
end;

procedure TfrmCadNF.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.NextMargem;
  getCamposMargem;
  if (Self.Enabled) and (Self.Visible) and (BitBtn28.CanFocus) then
  	BitBtn28.SetFocus;
  if (Self.Enabled) and (Self.Visible) and (edMarkUpV.CanFocus) then
  	edMarkUpV.SetFocus;
end;

procedure TfrmCadNF.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  edDataIniComando.Clear;
  edDataFimComando.Clear;
end;

procedure TfrmCadNF.SpeedButton18Click(Sender: TObject);
begin
  inherited;
  edDataIniTrans.Clear;
  edDataFimTrans.Clear;
end;

procedure TfrmCadNF.SpeedButton19Click(Sender: TObject);
begin
  inherited;
  CadNf.inut.abrir(1);
  edInutAno.Text := CadNf.inut.Ano;
end;

procedure TfrmCadNF.btNFeEmailClick(Sender: TObject);
var
  email, anexo: string;
  sListSend, sList: TStrings;
  NFIds: ArrayInts;
  anexos: hw_utils.ArrayString;
  vAplicativo: TAplicativoEnv;
  vArrayAplicativo: arrayaplicativo;
  vArrayContato: arraycontato;
  vUtilizarArrayContato: Boolean;
  vAssunto, vMensagem: string;
  vClienteId: Integer;
  vArrayClientes: ArrayInts;
  vEnvUnicaMens, vAnexarEventos, vAnexarPdfs, vAnexarBoletos: Boolean;
  vStringListErros: TStringList;
  I, J: Integer;
begin
  inherited;
  if CadNf.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('HW520', 'ENVIAR', 'NUM NF' + IntToStr(CadNf.campo_num_nf),
    'NFE', IntToStr(CadNf.campo_cod_nf), CadNf.buscas, True) then
      exit;
  try
    Screen.Cursor := crHourGlass;
    CadNf.Config.ExecutarLeitura('S');
    CadNf.vClFor.selecionaClFor;

    email := '';
    for I := 0 to CadNf.vClFor.EndDoc.lista.Count - 1 do
      if CadNf.vClFor.EndDoc.lista.Items[I].dest_seqid = 0 then
      begin
        email := CadNf.vClFor.EndDoc.lista.Items[I].email;
        Break;
      end;
    
    if email = '' then
      for I := 0 to CadNf.vClFor.EndDoc.lista.Count - 1 do
        if CadNf.vClFor.EndDoc.lista.Items[I].email <> '' then
        begin
          email := CadNf.vClFor.EndDoc.lista.Items[I].email;
          Break;
        end;

    if CadNf.Config.Conf_Geral.UsarMensageriaAI then
    begin
      try
      	try
          vArrayClientes := CadNf.GetArrayDistinctInts('cod_cliente', True, True);
          vClienteId := IfThen(Length(vArrayClientes) > 1, 0, vArrayClientes[0]);
        finally
          SetLength(vArrayClientes, 0);
        end;

        if not vDadosIni.sincronizarDadosContatoClienteAplicativo(vClienteId) then
        	Exit;

        vStringListErros := TStringList.Create;
        vStringListErros.Clear;

        Application.CreateForm(TFrmEnviarMensagem, FrmEnviarMensagem);
        FrmEnviarMensagem.CheckListBoxOpcoes.Items.Clear;
        FrmEnviarMensagem.CheckListBoxOpcoes.Items.Add('Enviar única mensagem');
        FrmEnviarMensagem.CheckListBoxOpcoes.Items.Add('Anexar Eventos');
        FrmEnviarMensagem.CheckListBoxOpcoes.Items.Add('Anexar PDFs');
      	FrmEnviarMensagem.CheckListBoxOpcoes.Items.Add('Anexar Boletos');

        FrmEnviarMensagem.FrameCheckListaContato.CodCliente := vClienteId;
        FrmEnviarMensagem.FrameCheckListaContato.Origem := cNfe;
        FrmEnviarMensagem.FrameCheckListaContato.UnicoMens := False;

        if FrmEnviarMensagem.ShowModal <> ID_OK then
          Exit;

        vArrayAplicativo := vDadosIni.retornaArrayAplicativo(FrmEnviarMensagem.FrameCheckListaContato.CheckListBoxAplicativo, True);
        vArraycontato    := vDadosIni.retornaArrayContato(FrmEnviarMensagem.FrameCheckListaContato.CheckListBoxContato, True);

        vUtilizarArrayContato := Length(vArrayContato) > 0;

        vEnvUnicaMens  := FrmEnviarMensagem.EnvUnicaMens;
        vAnexarEventos := FrmEnviarMensagem.AnexarEventos;
        vAnexarPdfs    := FrmEnviarMensagem.AnexarPdfs;
        vAnexarBoletos := FrmEnviarMensagem.AnexarBoletos;

        try
      NFIds := CadNf.GetArrayInts('cod_nf', True, True);

          for I := 0 to Length(NFIds) - 1 do
          begin
          	if vEnvUnicaMens then
      anexo := LegacyDFeDLLAdapter.GeraArquivosNFe(
                NFIds, vDadosIni.cod_empresa, vAnexarPdfs, vAnexarEventos, vAnexarBoletos, vDadosIni.vBancoHW
              )
            else
            	anexo := LegacyDFeDLLAdapter.GeraArquivosNFe(
                NFIds[I], vDadosIni.cod_empresa, vAnexarPdfs, vAnexarEventos, vAnexarBoletos, vDadosIni.vBancoHW
      );

            anexos := NewArrayString(anexo, ';');

            if vUtilizarArrayContato then
         		begin
              for J := 0 to Length(vArrayContato) - 1 do
              begin
                 vDadosIni.retornaMensagemEnv(cNfe, vArraycontato[J].Aplicativo, vAssunto, vMensagem);
                                       
      try
                   if not vDadosIni.EnvEmail(
                     vAssunto,
                     vMensagem,
                     vClienteId,
                     vArrayContato[J].Aplicativo,
                     vDadosIni.IfThen(vEnvUnicaMens, 0, NFIds[I]),
                     vDadosIni.IfThen(vEnvUnicaMens, '', OrigemEnvStr[cNfe]),
                     cNfe,
                     StringService.Join(sLineBreak, anexos),
                     Length(anexos),
                     True,
                     vArrayContato[J].Identificacao,
                     vArrayContato[J].Contato,
                     vArrayContato[J].Avulso) then
                   begin
                   	 if vStringListErros.Count = 10 then
                     	 vStringListErros.Add('...');
                     if vStringListErros.Count < 10 then
                     	 vStringListErros.Add('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[J].Aplicativo]) + ' para ' + trim(vArrayContato[J].Identificacao) + '.');
                   end;
                 except
                 	 if vStringListErros.Count = 10 then
                   	 vStringListErros.Add('...');
                 	 if vStringListErros.Count < 10 then
                   	 vStringListErros.Add('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[J].Aplicativo]) + ' para ' + trim(vArrayContato[J].Identificacao) + '.');
                 end;
              end;

              if vEnvUnicaMens then
              	Break;
            end
            else
            begin
            	for vAplicativo in vArrayAplicativo do
           		begin
                vDadosIni.retornaMensagemEnv(cNfe, vAplicativo, vAssunto, vMensagem);

                CadNf.SqlOpen(' select cod_cliente from notafiscal ' +
                	' where cod_nf = ' + IntToStr(NFIds[I]) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa, CadNf.buscas);
                vClienteId := CadNf.buscas.FieldByName('cod_cliente').AsInteger;

                if not vDadosIni.sincronizarDadosContatoClienteAplicativo(vClienteId) then
                	Exit;

                vArrayContato := vDadosIni.retornaArrayContato(vClienteId, vAplicativo, cNfe, False);

                for J := 0 to Length(vArrayContato) - 1 do
                begin
                  try
                    if not vDadosIni.EnvEmail(
                      vAssunto,
                      vMensagem,
                      vClienteId,
                      vArrayContato[J].Aplicativo,
                      vDadosIni.IfThen(vEnvUnicaMens, 0, NFIds[I]),
                      vDadosIni.IfThen(vEnvUnicaMens, '', OrigemEnvStr[cNfe]),
                      cNfe,
                      StringService.Join(sLineBreak, anexos),
                      Length(anexos),
                      True,
                      vArrayContato[J].Identificacao,
                      vArrayContato[J].Contato,
                      vArrayContato[J].Avulso) then
                    begin
                      if vStringListErros.Count = 10 then
                     	  vStringListErros.Add('...');
                      if vStringListErros.Count < 10 then
                        vStringListErros.Add('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[J].Aplicativo]) + ' para ' + trim(vArrayContato[J].Identificacao) + '.');
                    end;
                  except
                    if vStringListErros.Count = 10 then
                     	vStringListErros.Add('...');
                    if vStringListErros.Count < 10 then
                     	vStringListErros.Add('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[J].Aplicativo]) + ' para ' + trim(vArrayContato[J].Identificacao) + '.');
                  end;
                end;
              end;
            end;
          end;

          if vStringListErros.Count > 0 then
          	Application.MessageBox(PChar(vStringListErros.Text), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
      finally
        for anexo in anexos do
          	if FileExists(anexo) then
          DeleteFile(anexo);
      end;
      finally
        if Assigned(vStringListErros) then
        	FreeAndNil(vStringListErros);

        if Assigned(FrmEnviarMensagem) then
        begin
          FrmEnviarMensagem.Free;
          FrmEnviarMensagem := nil;
        end;
      end;
      Exit;
    end;

    ckNFeEmail_UnicoEmail.Checked := regGetConfBool(ckNFeEmail_UnicoEmail.Name , ckNFeEmail_UnicoEmail.Checked);
    ckNFeEmail_comEventos.Checked := regGetConfBool(ckNFeEmail_comEventos.Name , ckNFeEmail_comEventos.Checked);
    ckNFeEmail_comPDF.Checked     := regGetConfBool(ckNFeEmail_comPDF.Name     , ckNFeEmail_comPDF.Checked);
    ckNFeEmail_comBol.Checked     := regGetConfBool(ckNFeEmail_comBol.Name     , ckNFeEmail_comBol.Checked);
    ckNFeEmail_onlySel.Checked    := CadNf.SetArrayOfcod_nf > 0;

    edNFeEmail_email.Text         := email;

    vDadosIni.abreForm('Envio de email NFe', pnNFeModulo_Email, opFormsDefCad + [ofEscapeExit]);

    regSetConfBool(ckNFeEmail_UnicoEmail.Name , ckNFeEmail_UnicoEmail.Checked);
    regSetConfBool(ckNFeEmail_comEventos.Name , ckNFeEmail_comEventos.Checked);
    regSetConfBool(ckNFeEmail_comPDF.Name     , ckNFeEmail_comPDF.Checked);
    regSetConfBool(ckNFeEmail_comBol.Name     , ckNFeEmail_comBol.Checked);
    regSetConfBool(ckNFeEmail_onlySel.Name    , ckNFeEmail_onlySel.Checked);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btNFeEmail_anexarClick(Sender: TObject);
var
  AfileOpen: TOpenDialog;
  Afile: file;
  Asize: Integer;
  Abuffer: PAnsiChar;
  AumMega: Integer;
begin
  inherited;
  AumMega := 1024;
  AfileOpen := TOpenDialog.Create(Self);
  try
    if AfileOpen.Execute then
      if FileExists(AfileOpen.FileName) then
      begin
        AssignFile(Afile, OpenDialog1.FileName);
        try
          Reset(Afile, 1);
          Asize := FileSize(Afile);

          if Asize > (AumMega * 10) then
            vDadosIni.ShowErro('Tamanho do arquivo selecionado superior a 10mb')
          else
            lbNFeEmail_anexos.Items.Add(AfileOpen.FileName);
        finally
          CloseFile(Afile);
        end;
      end;
  finally
    FreeAndNil(AfileOpen);
  end;
end;

procedure TfrmCadNF.SpeedButton1Click(Sender: TObject);
begin
	if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'A', CadNf.buscas) then
    Exit;
  try
    if not CadNf.conferenciaCegaFechada then
    begin
    	Application.MessageBox(pChar('Nota Fiscal criada a partir da Conferência Cega, '#13'não é possivel editar/ excluir até que a Conferência Cega esteja FECHADA, '#13'Código da Conferência Cega: ' + IntToStr(CadNf.CodConferencia)), 'Atenção', 0 + 64);
      Exit;
    end;

    Screen.Cursor := crHourGlass;
    try ARecNo := CadNf.dataSet.RecNo; except end;
    if CadNf.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
      exit;
    if CadNf.Edit then
      habilitaCamposCadastroNotaFiscal;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  TForm(pnParametros.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.SpeedButton21Click(Sender: TObject);
var
  AmenuItem: TMenuItem;
begin
  inherited;
  if not Assigned(FpopMenuNFe) then
  begin
    FpopMenuNFe := TPopupMenu.Create(Self);

    AmenuItem := TMenuItem.Create(FpopMenuNFe);
    AmenuItem.Caption := 'Verificar Status do Serviço';
    AmenuItem.OnClick := nfe_options_status_servico;
    FpopMenuNFe.Items.Add(AmenuItem);

    AmenuItem := TMenuItem.Create(FpopMenuNFe);
    AmenuItem.Caption := '-';
    FpopMenuNFe.Items.Add(AmenuItem);

    AmenuItem := TMenuItem.Create(FpopMenuNFe);
    AmenuItem.Caption := 'Copiar XML para memória';
    AmenuItem.OnClick := nfe_options_copiar_xml;
    FpopMenuNFe.Items.Add(AmenuItem);

    AmenuItem := TMenuItem.Create(FpopMenuNFe);
    AmenuItem.Caption := 'Visualizar XML';
    AmenuItem.OnClick := nfe_options_visualizar_xml;
    FpopMenuNFe.Items.Add(AmenuItem);

    AmenuItem := TMenuItem.Create(FpopMenuNFe);
    AmenuItem.Caption := 'Salvar XML';
    AmenuItem.OnClick := nfe_options_salvar_xml;
    FpopMenuNFe.Items.Add(AmenuItem);
  end;

  FpopMenuNFe.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);

end;

procedure TfrmCadNF.btNFeEventosClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'A', CadNf.buscas) then
    Exit;
  if not vDadosIni.PesqPros('NF0145', 'VISUALIZAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
    CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
    Exit;
  if CadNf.vCC_e.selecionaCC_e(CadNf.dataSet.FieldByName('cod_nf').AsInteger) then
    CadNf.abreFormCartaCorrecaoEletronica;
end;

procedure TfrmCadNF.btPriorDestClick(Sender: TObject);
begin
  inherited;
  if CadNf.dataSet.State in [dsInsert, dsEdit] then
    CadNf.vClFor.SetDadosDestinatario(CadNf.vClFor.EndDoc.Prior);
  btNextDest.Enabled  := (CadNf.vClFor.EndDoc.indice + 1) < CadNf.vClFor.EndDoc.lista.Count;
  btPriorDest.Enabled := CadNf.vClFor.EndDoc.indice > 0;
  lkIdDest.Enabled := (CadNf.f_str('dest_uf') <> vDadosIni.vEmp.vSiglaUF) or CadNf.fequals('cpfcgc', vDadosIni.vEmp.vCNPJ);
  lkIdDestMais.Enabled := lkIdDest.Enabled;
end;

procedure TfrmCadNF.SpeedButton22Click(Sender: TObject);
begin
  inherited;
  TForm(pnC111.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  CadNf.abreFormChamadaDetalhesNF;
  exit;

  CadNf.vSped.vC110.vC114.abreC114(CadNf.dataSet.FieldByName('cod_nf').AsInteger);
  if CadNf.vSped.vC110.vC114.dataSet.IsEmpty then
  begin
    Application.MessageBox('Nota Fiscal não tem cupons referenciados', 'Atenção', 0 + 64);
    exit;
  end;
  CadNf.abreFormC114(False); ;
end;

procedure TfrmCadNF.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'A', CadNf.buscas) then
    Exit;

  if not CadNf.permiteAlterarNotaFechadaParaSPED then
    Exit;

  Application.CreateForm(TfrmCadNfAlterarDados, frmCadNfAlterarDados);
  frmCadNfAlterarDados.Nota := CadNf;
  if frmCadNfAlterarDados.ShowModal = mrOk then
    CadNf.alterarNotaFechadaParaSPED
  else
    CadNf.CancelUpdates;

  Exit;

  BitBtn178.Visible := ((CadNf.campo_modelo_nf) = '6') or
                       ((CadNf.campo_modelo_nf) = '06') or
                       ((CadNf.campo_modelo_nf) = '21') or
                       ((CadNf.campo_modelo_nf) = '22') or
                       ((CadNf.campo_modelo_nf) = '28') or
                       ((CadNf.campo_modelo_nf) = '29');
  dbComboConsumo.ItemIndex := -1;
  CadNf.abreFormAlterarDadosSPED;
end;

procedure TfrmCadNF.SpeedButton27Click(Sender: TObject);
begin
  inherited;
  TForm(pnC112.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.SpeedButton28Click(Sender: TObject);
begin
  inherited;
  if CadNf.removerFaturas then
    ListBox1.Clear;
end;

procedure TfrmCadNF.SpeedButton29Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0218', 'HABILITAR', 'NUM NF '+ CadNf.fstr('NUM_NF') + ' DT LANC: ' + CadNf.fstr('DATA_LANC'),
    'NOTAFISCAL', CadNf.fstr('COD_NF'), CadNf.buscas) then
    Exit;
  ed_altent_data_lanc.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (ed_altent_data_lanc.CanFocus) then
  	ed_altent_data_lanc.SetFocus;
end;

procedure TfrmCadNF.spEmbalagemMNFClick(Sender: TObject);
begin
  inherited;
  if (eddMNF.Text = 'S') or (vDadosIni.vSupermercado = 'S') then
  begin
    eddVLBRUREAL.Enabled := (eddMNF.Text = 'S');
    eddPDESC_R.Enabled := (eddMNF.Text = 'S');
    eddVLREMBNFR.Enabled := (eddMNF.Text = 'S');
    if CadNf.abreFormEmbalagemMNF then
    begin
      if eddVLREMBNFR.AsValue = 0 then
      begin
        eddMNF.Text :='N';
        eddVLBRUREAL.AsValue := 0;
      end;
    end
    else
    begin
      eddVLREMBNFR.AsValue := CadNf.vItem.vrDadosItem.vlrembnfr;
      eddVLBRUREAL.AsValue := CadNf.vItem.vrDadosItem.vlbrureal;

      if eddVLREMBNFR.AsValue = 0 then
      begin
        eddMNF.Text :='N';
        eddVLBRUREAL.AsValue := 0;
      end;

    end;
  end;
end;

procedure TfrmCadNF.sp_col_cepClick(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (ed_col_logradouro.CanFocus) then
    ed_col_logradouro.SetFocus;

  if pageMaisNFe.ActivePage = tsnf_Coleta then
    CadNf.coleta.ConsultaCEP(True)
  else
    CadNf.entrega.ConsultaCEP(True);
end;

procedure TfrmCadNF.sp_col_delClick(Sender: TObject);
begin
  inherited;
  if pageMaisNFe.ActivePage = tsnf_Coleta then
    CadNf.coleta.Clear
  else
    CadNf.entrega.Clear;
  sp_col_edit.Visible := True;
  sp_col_del.Visible  := False;
end;

procedure TfrmCadNF.sp_col_editClick(Sender: TObject);
begin
  inherited;
  if CadNf.notaFechada then
    Exit;

  if pageMaisNFe.ActivePage = tsnf_Coleta then
    CadNf.coleta.Insert
  else
    CadNf.entrega.Insert;

  if (Self.Enabled) and (Self.Visible) and (ed_col_nome.CanFocus) then
    ed_col_nome.SetFocus;


  sp_col_del.Visible  := True;
  sp_col_edit.Visible := False;
end;

procedure TfrmCadNF.sp_icment_verdadosClick(Sender: TObject);
begin
  inherited;
  if FrameIbsCbsEntrada1 <> nil then
    FrameIbsCbsEntrada1.Visible := False;

  pn_icms_entrada.Visible := True;

  pgControlItensNFe.ActivePage := tsMerc_ICMS_Entrada;
end;

procedure TfrmCadNF.sp_icment_verdados_outClick(Sender: TObject);
begin
  inherited;
  pgControlOItensNFe.ActivePage := tsOut_ICMS_Entrada;
end;

procedure TfrmCadNF.sp_ibscbsent_verdadosClick(Sender: TObject);
var
  ibsCbsEntrada: TributoDFeIbsCbsEtd;
begin
  inherited;

  if FrameIbsCbsEntrada1 = nil then
  begin
    FrameIbsCbsEntrada1                 := TFrameIbsCbs.Create(Self);
    FrameIbsCbsEntrada1.Name            := 'FrameIbsCbsEntrada1';
    FrameIbsCbsEntrada1.Parent          := scroll_icm_entrada;
    FrameIbsCbsEntrada1.Align           := alTop;
    FrameIbsCbsEntrada1.Setup( True );
  end;

  pn_icms_entrada.Visible := False;
  FrameIbsCbsEntrada1.Visible := True;

  ibsCbsEntrada := CadNf.vItem.GetTributoIbsCbsEntrada();
  try
    FrameIbsCbsEntrada1.Setup( ibsCbsEntrada );
    FrameIbsCbsEntrada1.Enabled := False;
  finally
    ibsCbsEntrada.Free();
  end;

  pgControlItensNFe.ActivePage := tsMerc_ICMS_Entrada;
end;

procedure TfrmCadNF.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'E', CadNf.buscas) then
    Exit;
  try
    if not CadNf.conferenciaCegaFechada then
    begin
    	Application.MessageBox(pChar('Nota Fiscal criada a partir da Conferência Cega, '#13'não é possivel editar/ excluir até que a Conferência Cega esteja FECHADA, '#13'Código da Conferência Cega: ' + IntToStr(CadNf.CodConferencia)), 'Atenção', 0 + 64);
      Exit;
    end;
    
    screen.Cursor := crHourGlass;
    DBGrid1.Enabled := False;
    CadNf.apagaNF;
  finally
    DBGrid1.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.SpeedButton30Click(Sender: TObject);
begin
  inherited;
  CadNf.abreFormConsultaC195_C197;
end;

procedure TfrmCadNF.SpeedButton31Click(Sender: TObject);
begin
  inherited;
  TForm(pnC114.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.SpeedButton32Click(Sender: TObject);
var
  vBaseICMSubResumo: Currency;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn101.CanFocus) then
  	BitBtn101.SetFocus;
  if CadNf.vSped.vC195_C197.dataSet.FieldByName('nitem').AsInteger = 0 then
  begin
    vBaseICMSubResumo := 0;
    CadNf.vItem.First;
    while not CadNf.vItem.dataSet.Eof do
    begin
      vBaseICMSubResumo := vBaseICMSubResumo +
        (CadNf.vItem.dataSet.FieldByName('base_icmsub_ant').AsCurrency *
          CadNf.vItem.dataSet.FieldByName('quantidade').AsFloat);
      CadNf.vItem.dataSet.Next;
    end;
    if vBaseICMSubResumo > 0 then
      CadNf.vSped.vC195_C197.setValorBaseICMS_ST( vBaseICMSubResumo );
  end
  else
  begin
    if CadNf.vItem.dataSet.FieldByName('base_icmsub_ant').AsCurrency > 0 then
      CadNf.vSped.vC195_C197.setValorBaseICMS_ST(CadNf.vItem.dataSet.FieldByName('base_icmsub_ant').AsCurrency *
        CadNf.vItem.dataSet.FieldByName('quantidade').AsFloat);
  end;
end;

procedure TfrmCadNF.SpeedButton33Click(Sender: TObject);
begin
  inherited;
  TForm(pnGenero.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.SpeedButton34Click(Sender: TObject);
begin
  inherited;
  TForm(pnComplementar.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.SpeedButton35Click(Sender: TObject);
begin
  inherited;
  TForm(pnSpedFiscal.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadNF.SpeedButton36Click(Sender: TObject);
begin
  inherited;
  TForm(pnC115.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.SpeedButton37Click(Sender: TObject);
var
  vValorICMSubResumo: Currency;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn101.CanFocus) then
  	BitBtn101.SetFocus;
  if CadNf.vSped.vC195_C197.dataSet.FieldByName('nitem').AsInteger = 0 then
  begin
    vValorICMSubResumo := 0;
    CadNf.vItem.First;
    while not CadNf.vItem.dataSet.Eof do
    begin
      vValorICMSubResumo := vValorICMSubResumo +
        (CadNf.vItem.dataSet.FieldByName('valor_icmsub_ant').AsCurrency *
        CadNf.vItem.dataSet.FieldByName('quantidade').AsFloat) ;
      CadNf.vItem.dataSet.Next;
    end;
    if vValorICMSubResumo > 0 then
      CadNf.vSped.vC195_C197.setValorDoICMS_ST( vValorICMSubResumo );
  end
  else
  begin
    if CadNf.vItem.dataSet.FieldByName('valor_icmsub_ant').AsCurrency > 0 then
      CadNf.vSped.vC195_C197.setValorDoICMS_ST( (CadNf.vItem.dataSet.FieldByName('valor_icmsub_ant').AsCurrency *
        CadNf.vItem.dataSet.FieldByName('quantidade').AsFloat));
  end;
end;

procedure TfrmCadNF.SpeedButton38Click(Sender: TObject);
begin
  inherited;
  CadNf.abreFormAtivarDesatCalcST;
end;

procedure TfrmCadNF.SpeedButton39Click(Sender: TObject);
begin
  inherited;
  DBComboBox5.Visible := not DBComboBox5.Visible;
  DBComboBox5.Enabled := DBComboBox5.Visible;
end;

procedure TfrmCadNF.spBotaoRemoverStatusEmProcessamentoClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'A', CadNf.buscas) then
    Exit;
  CadNf.removerStatusEmProcessamento;
end;

procedure TfrmCadNF.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    CheckBox2.Checked            := False;
    CheckBox4.Checked            := False;
    CheckBox5.Checked            := False;
    CheckBox6.Checked            := False;
    CheckBox17.Checked           := False;
    CheckBox7.Checked            := False;
    CheckBox8.Checked            := False;
    CheckBox9.Checked            := False;
    CheckBox10.Checked           := False;
    ckCopiaCtpFinanceiro.Checked := False;

    CheckBox2.Enabled := CadNf.campo_emissao_propria = 'S';
    CheckBox5.Enabled            := (CadNf.campo_natureza_nf = 'E') and (CadNf.fstr('tipo_nf') = 'P');
    CheckBox6.Enabled            := (CadNf.campo_natureza_nf = 'E') and (CadNf.fstr('tipo_nf') = 'P');
    CheckBox17.Enabled           := (CadNf.campo_natureza_nf = 'E') and (CadNf.fstr('tipo_nf') = 'P');
    CheckBox7.Enabled            := (CadNf.campo_natureza_nf = 'E') and (CadNf.fstr('tipo_nf') = 'P');
    CheckBox8.Enabled            := (CadNf.campo_natureza_nf = 'E') and (CadNf.fstr('tipo_nf') = 'P');
    CheckBox9.Enabled            := (CadNf.campo_natureza_nf = 'E') and (CadNf.fstr('tipo_nf') = 'P');
    CheckBox10.Enabled           := (CadNf.campo_natureza_nf = 'E') and (CadNf.fstr('tipo_nf') = 'P');
    ckCopiaCtpFinanceiro.Enabled := CadNf.campo_natureza_nf = 'E';

    CadNf.abreFormImpressao;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.btHabPISCOFINSClick(Sender: TObject);
begin
  inherited;
  tsMerc_PISCOFINS.Enabled := True;
  tsMerc_PISCOFINS.TabVisible := True;
  tsMerc_PISCOFINS.Show;

//  pnPIS.Visible := True;
//  pnCOFINS.Visible := True;
//  pnCOFINS.Align := alBottom;
//  pnCOFINS.Align := alTop;
end;

procedure TfrmCadNF.SpeedButton40Click(Sender: TObject);
begin
  inherited;
  vDadosIni.configurarSistema('prod_precos;nf_%', CadNf.buscas);
end;

procedure TfrmCadNF.bt_agro_salvarClick(Sender: TObject);
begin
  inherited;
  if not CadNf.defensivo.Post then
    setFocusCampoErro(CadNf.defensivo.vNomeCampoErro, CadNf.defensivo.vMensagemErro)
  else
    TForm(pn_cad_agro_defensivo.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.bt_alterar_campos_icmsClick(Sender: TObject);
//var
//  sCst: string
begin
  inherited;
  if ActiveControl = ed_tipoCalc then
  	if (Self.Enabled) and (Self.Visible) and (eddCFOP.CanFocus) then
    	eddCFOP.SetFocus;

//  sCst := eddCST.Text;
//  if Length(Trim(sCst)) <> 3 then
//    sCst := '090';
//  sCst :=

  pn_icms_tributos.Enabled               := True;
  pn_icms_tributos.ParentFont            := True;
  pn_icms_tributos_cst.Enabled           := True;
  pn_icms_tributos_cst.ParentFont        := True;
  pn_icms_tributos_mono.Enabled          := (TTipoCalculo(ed_tipoCalc.ItemIndex) <> tcCompleto);
//  cst :=
//  pn_icms_tributos_mono.Enabled          := (TTipoCalculo(ed_tipoCalc.ItemIndex) = tcNenhum);
//  pn_icms_tributos_mono.ParentFont       := (TTipoCalculo(ed_tipoCalc.ItemIndex) = tcNenhum);

  bt_alterar_campos_icms.Visible         := False;
  bt_calc_run.Enabled                    := (TTipoCalculo(ed_tipoCalc.ItemIndex) <> tcNenhum);
  ed_tipoCalc.Visible                    := False;
  bt_tipo_calc_unlock.Visible            := False;
  lb_tipo_calc_5.Visible                 := True;
  eddAliqICM.Enabled                     := (CadNf.campo_natureza_nf = 'E') or (vDadosIni.vEmp.vRegime <> 'SIMPLES') or CadNf.fdif('tipo_emissao', '1') or (TTipoCalculo(ed_tipoCalc.ItemIndex) <> tcCompleto);
  CadNf.vItem.vrDadosItem.calcIcmsActive := True;

  campos_itens_cstChange(eddCST);

end;

procedure TfrmCadNF.bt_alterar_campos_icms_ufdestClick(Sender: TObject);
begin
  inherited;
  pn_icms_ufdest_tributos.Enabled              := True;
  pn_icms_ufdest_tributos.ParentFont           := True;
  bt_alterar_campos_icms_ufdest.Visible        := False;  
  bt_calc_run2.Enabled                         := True;
  CadNf.vItem.vrDadosItem.calcIcmsUfDestActive := True;
end;

procedure TfrmCadNF.bt_alterar_campos_ipiClick(Sender: TObject);
begin
  inherited;
  pnIPIItens.Enabled                    := True;
  pnIPIItens.ParentFont                 := True;
  bt_calc_ipi_run.Enabled               := (TTipoCalculo(ed_tipoCalcRet.ItemIndex) <> tcNenhum);
  CadNf.vItem.vrDadosItem.calcIPIActive := True;
end;

procedure TfrmCadNF.bt_alterar_campos_issClick(Sender: TObject);
begin
  inherited;
  pn_iss_tributos.Enabled               := True;
  pn_iss_tributos.ParentFont            := True;
  bt_alterar_campos_iss.Visible         := False;
  bt_calc_iss_run.Enabled               := True;
  CadNf.vItem.vrDadosItem.calcISSActive := True;
end;

procedure TfrmCadNF.bt_alterar_campos_piscofinsClick(Sender: TObject);
begin
  inherited;
  pn_piscofins_tributos.Enabled               := True;
  pn_piscofins_tributos.ParentFont            := True;
  bt_alterar_campos_piscofins.Visible         := False;
  bt_calc_piscofins_run.Enabled               := (TTipoCalculo(ed_tipoCalcPC.ItemIndex) <> tcNenhum);
  bt_tipo_calc_pc_unlock.Visible              := False;
  CadNf.vItem.vrDadosItem.calcPISCOFINSActive := True;
end;

procedure TfrmCadNF.bt_alterar_campos_retencoesClick(Sender: TObject);
begin
  inherited;
  pn_ret_bc.Enabled                         := True;
  pn_ret_bc.ParentFont                      := True;
  bt_alterar_campos_retencoes.Visible       := False;
  bt_calc_retencoes_run.Enabled             := (TTipoCalculo(ed_tipoCalcRet.ItemIndex) <> tcNenhum);
  bt_tipo_calc_ret_unlock.Visible           := False;
  CadNf.vItem.vrDadosItem.calcRetTribActive := True;
end;

procedure TfrmCadNF.bt_calc_runClick(Sender: TObject);
begin
  inherited;

  //caso algum campo esteja em alteracao o foco vai forçar a gravar o valor e continuar o processamento
  if (ActiveControl <> btSalvarItemProdServDetalhado) then
  	if (Self.Enabled) and (Self.Visible) and (btSalvarItemProdServDetalhado.CanFocus) then
    	btSalvarItemProdServDetalhado.SetFocus;

  //somente vai calcular se a logica acima funcionou
  if (ActiveControl <> btSalvarItemProdServDetalhado) then
    Exit;

  setCamposDetalhado;

  if (CadNf.vItem.vrDadosItem.valor_unitario <= 0) or
     (Length(CadNf.vItem.vrDadosItem.cst) <> 3) then
    Exit;

  CadNf.calc_fat.calculo_faturamento_individual_executar(False, True);

  getCamposDetalhado;

  ed_tipoCalc.Enabled := False;
  ed_tipoCalc.Visible := True;

  buildCadastroItensAlteracaoTributo;
end;

procedure TfrmCadNF.bt_defensivo_alterarClick(Sender: TObject);
begin
  inherited;
  try
    if not (CadNf.dataSet.State  in [dsEdit, dsInsert]) then
      ShowErro('Dados da nota fiscal não podem ser alterados')
    else if CadNf.defensivo.dataSet.IsEmpty then
      ShowErro('Sem registro selecionado')
    else if CadNf.defensivo.Edit then
      vDadosIni.abreForm('Defensivos Agrícolas', pn_cad_agro_defensivo, opFormsDefCad);
  finally
    CadNf.defensivo.dataSet.Cancel;
  end;
end;

procedure TfrmCadNF.bt_defensivo_incluirClick(Sender: TObject);
begin
  inherited;
  try
    if not (CadNf.dataSet.State  in [dsEdit, dsInsert]) then
      ShowErro('Dados da nota fiscal não podem ser alterados')
    else if CadNf.defensivo.Insert then
      vDadosIni.abreForm('Defensivos Agrícolas', pn_cad_agro_defensivo, opFormsDefCad);
  finally
    CadNf.defensivo.dataSet.Cancel;
  end;
end;

procedure TfrmCadNF.bt_defensivo_removerClick(Sender: TObject);
begin
  inherited;
  if not (CadNf.dataSet.State  in [dsEdit, dsInsert]) then
    ShowErro('Dados da nota fiscal não podem ser alterados')
  else
   CadNf.defensivo.Delete;
end;

procedure TfrmCadNF.bt_guiatr_alterarClick(Sender: TObject);
begin
  inherited;
  try
    if not (CadNf.dataSet.State  in [dsEdit, dsInsert]) then
      ShowErro('Dados da nota fiscal não podem ser alterados')
    else if CadNf.guiaTransito.Insert then
    begin
      pn_guiatr_cadastro.Visible := True;
      pn_guiatr_consulta.Visible := False;
      pn_agro_de_campos.Enabled := True;
      pn_agro_de_campos.ParentFont := True;
      vDadosIni.abreForm('Guia de Trânsito', pn_agro_guiatransito, opFormsDefCad);
    end;
  finally
    pn_guiatr_cadastro.Visible := False;
    pn_guiatr_consulta.Visible := True;
    pn_agro_de_campos.Font.Color := clGrayText;
    pn_agro_de_campos.Enabled := False;
    CadNf.guiaTransito.dataSet.Cancel;
  end;
end;

procedure TfrmCadNF.bt_guiatr_removerClick(Sender: TObject);
begin
  inherited;
  if not (CadNf.dataSet.State  in [dsEdit, dsInsert]) then
    ShowErro('Dados da nota fiscal não podem ser alterados')
  else
   CadNf.guiaTransito.Delete;
end;

procedure TfrmCadNF.bt_guiatr_salvarClick(Sender: TObject);
begin
  inherited;
  if not CadNf.guiaTransito.Post then
    setFocusCampoErro(CadNf.guiaTransito.vNomeCampoErro, CadNf.guiaTransito.vMensagemErro)
  else
    TForm(pn_agro_guiatransito.Parent).ModalResult := IDOK;
end;

procedure TfrmCadNF.bt_it_pc_alterar_aliq_percClick(Sender: TObject);
begin
  inherited;
  if bt_it_pc_alterar_aliq_perc.Caption = '%' then
  begin
     bt_it_pc_alterar_aliq_perc.Caption := '$';

     Label463.Caption := 'Aliquota em R$:';
     Label462.Caption := 'Qtde Base de Cálculo:';

     Label466.Caption := 'Aliquota em R$:';
  end
  else
  begin
     bt_it_pc_alterar_aliq_perc.Caption := '%';

     Label463.Caption := 'Aliquota:';
     Label462.Caption := 'Base de Cálculo:';

     Label466.Caption := 'Aliquota:';
  end;
end;

procedure TfrmCadNF.SpeedButton42Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.dataSet.Prior;
  while not CadNf.vItem.dataSet.Bof do
  begin
    if CadNf.cfopDeDevolucao(Trunc(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsFloat)) then
    begin
      CadNf.existeNFDevolvida(CadNf.vItem.dataSet.FieldByName('cod_nf_dev').AsInteger);
      Edit1.Text := vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 2);
      Edit2.Text := vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 3);
      Edit3.Text := vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 4);
      if (Self.Enabled) and (Self.Visible) and (DBGrid34.CanFocus) then
      	DBGrid34.SetFocus;
      exit;
    end;
    CadNf.vItem.dataSet.Prior;
  end;
  Application.MessageBox('Primeiro registro atingido', 'Atenção', 0 + 64);
end;

procedure TfrmCadNF.SpeedButton43Click(Sender: TObject);
var
  Aconf: TConfig_sistema_class;
begin
  inherited;
  Aconf := TConfig_sistema_class.getConf('nfs_obscont_camposad', CadNf.buscas, vDadosIni.cod_empresa);
  try
    listGrid.Items.Text := vDadosIni.Split(Aconf.ReadString('Conf', 'CamposAdicionais', ''), ',').Text;
  finally
    FreeAndNil(Aconf);
  end;

  if listGrid.Items.Count = 0 then
  begin
    ShowErro('Sem campos configurados. Acesso o menu de Configuração Global e procure pela chave "nfs_obscont_camposad"');
    Exit;
  end;

  try
    form_memo_botoes_ok_voltar_habilitar();

    if not vDadosIni.abreForm('Informe o campo desejado', pnMemo, opFormsDefault) then
      Exit;

    if listGrid.ItemIndex > -1 then
      CadNf.obsCont.fdata('xcampo').Put(listGrid.Items[listGrid.ItemIndex]);

  finally
    form_memo_botoes_restore;
  end;
end;

procedure TfrmCadNF.SpeedButton44Click(Sender: TObject);
begin
  inherited;
  if not (CadNf.dataSet.State  in [dsEdit, dsInsert]) then
  begin
    ShowErro('Dados da nota fiscal não podem ser alterados');
    Exit;
  end;

  vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('CLIENTES', ' and CHAR_LENGTH(CLIENTES.CPFCGC) = 14', 'Consulta intermediarores/marketplaces'));
  if vDadosIni.vPesquisa <> '' then
  begin
    with CadNf.SqlOpen('select nome_cliente, cpfcgc from clientes where cod_cliente = %d and cod_empresa = %d',
           [StrToIntDef(vDadosIni.vPesquisa, 0), vDadosIni.cod_empresa]) do
    begin
      CadNf.dataSet.FieldByName('infintermed_cnpj').AsString := Trim(FieldByName('cpfcgc').AsString);
      CadNf.dataSet.FieldByName('infintermed_idcadinttran').AsString := Trim(FieldByName('nome_cliente').AsString);
    end;
  end;
end;

procedure TfrmCadNF.btNFeInutiClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NFE005', 'ABRIR', '',
    'NOTAFISCAL_INUT', '', CadNf.buscas, True) then
      exit;

  try                          
    Screen.Cursor := crHourGlass;
    gridNFeInut.OnDrawColumnCell := gridNFe_DrawColumnCell;

    CadNf.inut.abrir(0);
    edInutAno.Text := CadNf.inut.Ano;
    vDadosIni.abreForm('Inutilização de NFe', pnNFeInut, opFormsDefault);

  finally
    gridNFeInut.OnDrawColumnCell := nil;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.SpeedButton45Click(Sender: TObject);
begin
  inherited;
  if SpeedButton45.Caption = '%' then
  begin
     SpeedButton45.Caption := '$';

     Label469.Caption := 'Aliquota em R$:';
     Label468.Caption := 'Qtde Base de Cálculo:';

     Label472.Caption := 'Aliquota em R$:';
     Label471.Caption := 'Qtde Base de Cálculo:';
  end
  else
  begin
     SpeedButton45.Caption := '%';

     Label469.Caption := 'Aliquota:';
     Label468.Caption := 'Base de Cálculo:';

     Label472.Caption := 'Aliquota:';
     Label471.Caption := 'Base de Cálculo:';
  end;
end;

procedure TfrmCadNF.SpeedButton46Click(Sender: TObject);
begin
  inherited;
  vDadosIni.pesquisaRapida('PRODUTOS');
end;

procedure TfrmCadNF.btnUnlockEmbClick(Sender: TObject);
var
  vHabEmbalagem: Boolean;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (eddReferencia.CanFocus) then
    eddReferencia.SetFocus;
  btnLockEmb.Visible := not btnLockEmb.Visible;
  btnUnlockEmb.Visible := not btnLockEmb.Visible;
  vHabEmbalagem := btnUnlockEmb.Visible and (CadNf.f_int('id_ajuste') = 0);
  eddUnidade_nf.Enabled := vHabEmbalagem;
  eddQTDEMB_old.Enabled     := vHabEmbalagem;
  eddQTDEMBREC.Enabled  := vHabEmbalagem;
  eddQtde.Enabled := (not vHabEmbalagem) and (CadNf.f_int('id_ajuste') = 0);
  eddValorUnitario.Enabled := (not eddValorTotal.Enabled) and (not vHabEmbalagem);
  eddVLREMBNF.Enabled      := (not eddValorTotal.Enabled) and (vHabEmbalagem);
  if not vHabEmbalagem then
  begin
    eddUnidade_nf.Text := '';
    eddQTDEMB_old.AsValue := 0;
    eddQTDEMBREC.AsValue := 0;
    eddVLREMBNF.AsValue := 0;
  end;
end;

procedure TfrmCadNF.btnXMLNFSClick(Sender: TObject);
var
  Registro: TRegistry;
  vTempPath:string;
  I: Integer;
  vOKImport: boolean;
  vErroImport: boolean;
begin
  if not vDadosIni.PesqPros('NF0219', 'IMPORTAR', '', 'NOTAFISCAL',
    '', CadNf._buscas, True) then
    Exit;

  inherited;
  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + Self.ClassName, True);
      OpenDialog1.InitialDir := Registro.ReadString(OpenDialog1.Name);
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;

  vOKImport := false;
  vErroImport := false;

  MemoErrosImportacao.Clear;

  if OpenDialog2.Execute then
  begin
    for I := 0 to OpenDialog2.Files.Count - 1 do
    begin
    	try
        vDadosIni.abreStatusProcessamento('', 'Importando notas fiscais (' + IntToStr(I + 1) + ' de ' +  IntToStr(OpenDialog2.Files.Count) + ')');
        if CadNf.importaXmlSaida(OpenDialog2.Files[I], MemoErrosImportacao) then
          vOKImport := true
        else
        begin
          vErroImport := true;
          if I <> OpenDialog2.Files.Count - 1 then
            if Application.MessageBox('Deseja continuar assim mesmo?', 'Confirmação',
              MB_ICONQUESTION + MB_YESNO) <> IDYES then
            begin
            	if MemoErrosImportacao.Lines.Count > 0 then
	              vDadosIni.abreForm('Erros importação', frmCadNF.pnErrosImportacao, [ofEscapeExit, ofAlignAllClientWinCtrl]);
	            exit;
            end;
        end;
      finally
        vDadosIni.fechaStatusProcessamento;
      end;
    end;
    if vErroImport then
    	if MemoErrosImportacao.Lines.Count > 0 then
		   	vDadosIni.abreForm('Erros importação', frmCadNF.pnErrosImportacao, [ofEscapeExit, ofAlignAllClientWinCtrl]);

    if vOKImport then
	    Application.MessageBox('Notas importadas com sucesso!', 'Informação',  MB_ICONINFORMATION);

    try
      // Chama o construtor do objeto
      Registro := TRegistry.Create;
      try
        Registro.OpenKey(Conf + Self.ClassName, True);
        Registro.WriteString(OpenDialog2.Name, ExtractFileDir(OpenDialog2.FileName));
        Registro.CloseKey;
      finally
        Registro.Free;
      end;
    except
    end;
  end;
end;

procedure TfrmCadNF.SpeedButton47Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.dataSet.Next;
  while not CadNf.vItem.dataSet.Eof do
  begin
    if CadNf.cfopDeDevolucao(Trunc(CadNf.vItem.dataSet.FieldByName('codigo_nop').AsFloat)) then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBGrid34.CanFocus) then
      	DBGrid34.SetFocus;
      CadNf.existeNFDevolvida(CadNf.vItem.dataSet.FieldByName('cod_nf_dev').AsInteger);
      Edit1.Text := vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 2);
      Edit2.Text := vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 3);
      Edit3.Text := vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 4);
      exit;
    end;
    CadNf.vItem.dataSet.Next;
  end;
  Application.MessageBox('Último registro atingido', 'Atenção', 0 + 64);
end;

procedure TfrmCadNF.SpeedButton48Click(Sender: TObject);
var
  vSqltp: string;
begin
  inherited;
  if CadNf.campo_natureza_nf = 'S' then
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NOTAFISCAL',
      ' and notafiscal.natureza_nf = ''E''', 'Consulta de Notas Fiscais de Entrada' )
  else
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NOTAFISCAL',
      ' and notafiscal.natureza_nf = ''S''', 'Consulta de Notas Fiscais de Saída' );

  if Trim(vDadosIni.vPesquisa) <> '' then
    if CadNf.existeNFDevolvida(StrToInt(Trim(vDadosIni.vPesquisa))) then
    begin
      Edit1.Text := vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 2);
      Edit2.Text := vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 3);
      Edit3.Text := vDadosIni.getCampoPipe(CadNf.DadosNFDevolvida, 4);
    end;

end;

procedure TfrmCadNF.SpeedButton49Click(Sender: TObject);
begin
  inherited;

  CadNf.vItem.dataSet.Edit;
  CadNf.vItem.dataSet.FieldByName('cod_nf_dev').Value := Null;
  CadNf.vItem.dataSet.FieldByName('nitem_dev').Value := Null;
  CadNf.vItem.dataSet.Post;

end;

procedure TfrmCadNF.SpeedButton50Click(Sender: TObject);
begin
  pnCadastroItensVeiculos.Visible := True;
  pnConsultaItensVeiculos.Visible := false;
  SpeedButton51.Visible := True;
  SpeedButton52.Visible := True;
  SpeedButton53.Visible := True;
end;

procedure TfrmCadNF.SpeedButton51Click(Sender: TObject);
begin
  inherited;
  pnCadastroItensVeiculos.Visible := False;
  pnConsultaItensVeiculos.Visible := True;
  SpeedButton51.Visible := False;
  SpeedButton52.Visible := False;
  SpeedButton53.Visible := False;
end;

procedure TfrmCadNF.SpeedButton52Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.Prior;
end;

procedure TfrmCadNF.SpeedButton53Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.Next;
end;

procedure TfrmCadNF.SpeedButton54Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.vDetEcf.dataSet.Cancel;
  CadNf.vItem.vDetEcf.dataSet.Insert;
  DBLookupComboBox6.KeyValue := Null;
  edNumSerieEcf.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (edNumSerieEcf.CanFocus) then
  	edNumSerieEcf.SetFocus;
end;

procedure TfrmCadNF.SpeedButton55Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.Prior;

  if pageDetalhesItensNF.ActivePage = tsDetItem_IBSCBS then
    pageDetalhesItensNFChange(pageDetalhesItensNF);
end;

procedure TfrmCadNF.SpeedButton56Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.Next;

  if pageDetalhesItensNF.ActivePage = tsDetItem_IBSCBS then
    pageDetalhesItensNFChange(pageDetalhesItensNF);
end;

procedure TfrmCadNF.SpeedButton57Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.dataSet.Prior;
end;

procedure TfrmCadNF.SpeedButton58Click(Sender: TObject);
var
  impXML: TXmlImport;
  Chave: string;
begin
  inherited;
  impXML := TXmlImport.create;
  try
    if OpenDialog1.Execute then
      if FileExists(OpenDialog1.FileName) then
      begin
        Chave := impXML.retornaChaveNfe(OpenDialog1.FileName);
        if Trim(Chave) <> '' then
          Edit8.Text := Trim(Chave);
      end;
  finally
    FreeAndNil(impXML);
  end;
end;

procedure TfrmCadNF.SpeedButton59Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.dataSet.Next;
end;

procedure TfrmCadNF.SpeedButton60Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'I', CadNf.buscas) then
    Exit;
  if CadNf.incluirNFVendaForaEstabelecimento then
    habilitaCamposCadastroNotaFiscal;
end;

procedure TfrmCadNF.SpeedButton61Click(Sender: TObject);
begin
  inherited;
  if CadNf.vItemNFVFE.incluir then
  begin
    EditHw4.AsValue := EditHw4.AsValue;
    EditHw6.AsValue := EditHw6.AsValue;
    if (Self.Enabled) and (Self.Visible) and (BitBtn152.CanFocus) then
    	BitBtn152.SetFocus;
    if CadNf.vItemNFVFE.salvar(EditHw4.AsValue, EditHw6.AsValue ) then
    begin
      CadNf.vItemNFVFE.dataSet.Next;
      if (Self.Enabled) and (Self.Visible) and (DBGrid43.CanFocus) then
        DBGrid43.SetFocus;
    end;
  end;
end;

procedure TfrmCadNF.SpeedButton62Click(Sender: TObject);
begin
  inherited;
  if CadNf.vItemNFVFE.alterar then
  begin
    EditHw4.AsValue := EditHw4.AsValue;
    EditHw6.AsValue := EditHw6.AsValue;
    if (Self.Enabled) and (Self.Visible) and (BitBtn152.CanFocus) then
    	BitBtn152.SetFocus;
    if CadNf.vItemNFVFE.salvar(EditHw8.AsValue, EditHw10.AsValue ) then
    begin
      CadNf.vItemNFVFE._dataTemp.Next;
      if (Self.Enabled) and (Self.Visible) and (DBGrid44.CanFocus) then
      	DBGrid44.SetFocus;
    end;
  end;
end;

procedure TfrmCadNF.SpeedButton63Click(Sender: TObject);
begin
  inherited;
  CadNf.vItemNFVFE.delete;
end;

procedure TfrmCadNF.SpeedButton64Click(Sender: TObject);
begin
  inherited;
  if CadNf.vItemNFVFE.montarRetornoRemessa then
    BitBtn152.Click;
end;

procedure TfrmCadNF.SpeedButton65Click(Sender: TObject);
begin
  inherited;
  CadNf.verNotasVendaForaEstabelecimento;
end;

procedure TfrmCadNF.SpeedButton67Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadNf.vManifestDest.download then
    begin
      if Application.MessageBox('Deseja efetuar a entrada da nota fiscal?', 'Confirmação',
        MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;

      
      if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'I', CadNf.buscas) then
        Exit;

      if CadNf.vManifestDest.entrarComNF then
        TForm(pnManifestacao.Parent).ModalResult := IDOK;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.SpeedButton68Click(Sender: TObject);
begin
  inherited;   
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'I', CadNf.buscas) then
    Exit;

  if not vDadosIni.PesqPros('NF0163', 'ALTERAR', 'NUM NF' + CadNf.vManifestDest.dataSet.FieldByName('NUM_NF').AsString + ' CHAVE ' + CadNf.vManifestDest.dataSet.FieldByName('CHAVE_NFE').AsString,
    'NF_DESTINADAS', '', dtmNF.qrBuscas, True) then
    Exit;

  try
    Screen.Cursor := crHourGlass;

    if CadNf.vManifestDest.entrarComNF then
      TForm(pnManifestacao.Parent).ModalResult := IDOK;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.SpeedButton69Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NF0158', 'ALTERAR', 'NUM NF' + CadNf.vManifestDest.dataSet.FieldByName('NUM_NF').AsString + ' CHAVE ' + CadNf.vManifestDest.dataSet.FieldByName('CHAVE_NFE').AsString,
    'NF_DESTINADAS', '', dtmNF.qrBuscas, True) then
    Exit;
    
  try
    Screen.Cursor := crHourGlass;
    CadNf.vManifestDest.cienciaDaOperacao;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'E', CadNf.buscas) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    DBGrid1.Enabled := False;

    if not vDadosIni.PesqPros('NF0145', 'VISUALIZAR', 'NUM NF '+ CadNf.dataSet.FieldByName('NUM_NF').AsString, 'NOTAFISCAL',
      CadNf.dataSet.FieldByName('COD_NF').AsString, dtmNF.qrBuscas, True) then
      Exit;

    if (CadNf.dataSet.FieldByName('tipo_nf').AsString = 'V') and
      (CadNf.campo_natureza_nf = 'S') and
      (CadNf.dataSet.FieldByName('n_comando').AsInteger > 0) then
    begin
      CadNf.buscas.close;
      CadNf.buscas.SQL.Text := 'select * from com_fat where n_comando = ' +
        CadNf.dataSet.FieldByName('n_comando').AsString +
        ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND ATIVO = 1';
      CadNf.buscas.Open;
      if (CadNf.buscas.FieldByName('DIA_CXL').IsNull) or (CadNf.buscas.FieldByName('DIA_CXL').AsString = '') then
      else
      begin
        CadNf.buscas.close;
        Application.MessageBox(pchar('Documento já Recebido Pelo Caixa da Loja'),
          'Informação', 0 + 64);
        if not vDadosIni.PesqPros('HW478', 'EDITAR', 'CANCELAR RECEBIMENTO CXL', 'COM_FAT',
          CadNf.dataSet.FieldByName('n_comando').AsString, CadNf.buscas, True) then
          Exit;
        if Application.MessageBox('Deseja realmente excluir o recebimento do Comando?',
          'Confirmação',
          MB_ICONQUESTION + MB_YESNO) = IDYES then
        begin
          CadNf.ExecutaComandosSqlExec('update com_fat set status_cxl_rq = null, dia_cxl = null' +
            ' where n_comando = ' + CadNf.dataSet.FieldByName('n_comando').AsString +
            ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1');
          CadNf.CommitaTransacao;
        end;
        Exit;
      end;
    end;

    if (CadNf.campo_modelo_nf = '55') and
      (CadNf.campo_emissao_propria = 'S') and
      (CadNf.campo_situacao_nfe <> sitInutilizada) and
      (CadNf.campo_situacao_nfe <> sitDenegada) and
      (CadNf.campo_situacao_nfe <> sitCancelada) and
      (CadNf.campo_status <> stsCancelada) then
    begin
      if (vDadosIni.vEmp.vVersaoVeiculos = '4') and (CadNf.dataSet.FieldByName('tipo_nf').AsString = 'V') then
      begin
        CadNf.vItem.vDetVeic.selecionaDetalheVeiculo(CadNf.dataSet.FieldByName('cod_nf').AsInteger);
        if not CadNf._VerificarPendenciaNFeComando(tCancelar) then
           exit;
      end;

      if CadNf.vCC_e.selecionaCC_e(CadNf.dataSet.FieldByName('cod_nf').AsInteger) then
        CadNf.abreFormCartaCorrecaoEletronica(True);
      Exit;
    end
    else
      CadNf.cancelarNotaFiscal;
  finally
    DBGrid1.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.SpeedButton70Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NF0159', 'ALTERAR', 'NUM NF' + CadNf.vManifestDest.dataSet.FieldByName('NUM_NF').AsString + ' CHAVE ' + CadNf.vManifestDest.dataSet.FieldByName('CHAVE_NFE').AsString,
    'NF_DESTINADAS', '', dtmNF.qrBuscas, True) then
    Exit;
    
  try
    Screen.Cursor := crHourGlass;
    CadNf.vManifestDest.desconhecimentodaOperacao;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.SpeedButton71Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NF0160', 'ALTERAR', 'NUM NF' + CadNf.vManifestDest.dataSet.FieldByName('NUM_NF').AsString + ' CHAVE ' + CadNf.vManifestDest.dataSet.FieldByName('CHAVE_NFE').AsString,
    'NF_DESTINADAS', '', dtmNF.qrBuscas, True) then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    CadNf.vManifestDest.operacaoNaoRealizada;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.SpeedButton72Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NF0161', 'ALTERAR', 'NUM NF' + CadNf.vManifestDest.dataSet.FieldByName('NUM_NF').AsString + ' CHAVE ' + CadNf.vManifestDest.dataSet.FieldByName('CHAVE_NFE').AsString,
    'NF_DESTINADAS', '', dtmNF.qrBuscas, True) then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    CadNf.vManifestDest.confirmacaoDaOperacao;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.SpeedButton73Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('NF0157', 'CONSULTAR', '', 'NF_DESTINADAS',
    '', dtmNF.qrBuscas, True) then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    pnManifestacao.Enabled := False;
    Application.ProcessMessages;
    CadNf.vManifestDest.consulta(RadioGroup4.ItemIndex,
                               RadioGroup3.ItemIndex,
                               RadioGroup5.ItemIndex);

    BitBtn171.Click;
  finally
    pnManifestacao.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.SpeedButton74Click(Sender: TObject);
begin
  inherited;
  TForm(pnManifestacao.Parent).ModalResult := IDCANCEL;
  if UpperCase(trim(SpeedButton74.Caption)) = 'SAIR' then
  begin
  	frmCadNF.fechar := True;
    PostMessage(frmCadNF.Handle, WM_CLOSE, 0, 0);
  end;
end;

procedure TfrmCadNF.SpeedButton75Click(Sender: TObject);
begin
  inherited;
  if Panel153.Visible then
  begin
    Panel153.Visible := False;
    Panel152.Height := 18;
    SpeedButton75.Caption := 'v';
  end
  else
  begin
    Panel153.Visible := True;
    Panel152.Height := 48;
    SpeedButton75.Caption := '^';
    if (Self.Enabled) and (Self.Visible) and (Edit6.CanFocus) then
      Edit6.SetFocus;
  end;
end;

procedure TfrmCadNF.SpeedButton76Click(Sender: TObject);
begin
  inherited;
  CadNf.vManifestDest._limparNSU;
end;

procedure TfrmCadNF.SpeedButton77Click(Sender: TObject);
begin
  inherited;                           
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'A', CadNf.buscas) then
    Exit;
  CadNf.vManifestDest._atualizarSatusNF;
end;

procedure TfrmCadNF.SpeedButton78Click(Sender: TObject);
begin
  inherited;
  CadNf.vManifestDest._limparStatusUsuario;
end;

procedure TfrmCadNF.SpeedButton79Click(Sender: TObject);
var
  Retorno: string;
begin
  inherited;

  Retorno := CadNf.vSped.vC110.vC113.getNotaFiscalDaPesquisa;
  if Retorno <> '' then
  begin
    edNaturezaC113.ItemIndex := edNaturezaC113.Items.IndexOf(vDadosIni.getValue(Retorno,1));
    edNumNFC113.AsValue := StrToInt(vDadosIni.getValue(Retorno, 2));
    edSerieC113.Text := vDadosIni.getValue(Retorno, 3);
    edClForC113.AsValue := StrToInt(vDadosIni.getValue(Retorno, 4));
    edNomeClForC113.Text := vDadosIni.getValue(Retorno, 5);
  end;
end;

procedure TfrmCadNF.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  try
    if CadNf.fequals('status', stsFechada) then
      DBGrid11.DataSource := dtmNF.dsINf;

    CadNf.abreMargem;
  finally
    DBGrid11.DataSource := dtmNF.dsTempINf;
  end;
end;

procedure TfrmCadNF.btMudPopUpMenuClick(Sender: TObject);
var
  vPointer: TPoint;
begin
  inherited;
  GetCursorPos(vPointer);
  pmMarcacoes.Popup(vPointer.X, vPointer.Y);
end;

procedure TfrmCadNF.btNextDestClick(Sender: TObject);
begin
  inherited;
  if CadNf.dataSet.State in [dsInsert, dsEdit] then
    CadNf.vClFor.SetDadosDestinatario(CadNf.vClFor.EndDoc.Next);
  btNextDest.Enabled  := (CadNf.vClFor.EndDoc.indice + 1) < CadNf.vClFor.EndDoc.lista.Count;
  btPriorDest.Enabled := CadNf.vClFor.EndDoc.indice > 0;
  lkIdDest.Enabled := (CadNf.f_str('dest_uf') <> vDadosIni.vEmp.vSiglaUF) or CadNf.fequals('cpfcgc', vDadosIni.vEmp.vCNPJ);
  lkIdDestMais.Enabled := lkIdDest.Enabled;
end;

procedure TfrmCadNF.btNFeManifestacaoClick(Sender: TObject);
begin
	try
    inherited;

    if not vDadosIni.PesqPros('NF0155', 'ABRIR', '', 'NF_DESTINADAS',
      '', dtmNF.qrBuscas, True) then
      Exit;

    vDadosIni.setTClientDataSetCadPadrao(
    	vDadosIni.dataSetCol,
      vDadosIni.vNomeUsuario,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSetManifestacao,
      GridCfgManifestacao,
      DBGridManifestacao,
      cdsGridManifestacao,
      cdsColunasManifestacao,
      transManifestacao,
      ListGridsAndDataSetsManifestacao,
      ListPositionsManifestacao,
      nomeDTSEtManifestacao,
      PrimeiraPesquisaManifestacao,
      vCamposPadraoRegistroManifestacao,
      usuario);
      
    if CadNf.manifestacaoDestinatario then
    begin
      if CadNf.importaXml(CadNf.vManifestDest.vXML) then
      begin
        habilitaCamposCadastroNotaFiscal;
        CadNf.vItem.dataSet.First;
        TForm(pnEntSaidaNFe.Parent).ModalResult := IDOK;
      end;
    end;
  finally
  	if Assigned(DBGridManifestacao.DataSource) then
      if Assigned(DBGridManifestacao.DataSource.DataSet) then
      begin
        if not PrimeiraPesquisaManifestacao then
          vDadosIni.salvarGridNoConfigColunasCadPadrao(
            DBGridManifestacao,
            GridCfgManifestacao,
            cdsGridManifestacao,
            cdsColunasManifestacao,
            usuario,
            ListGridsAndDataSetsManifestacao,
            vDadosIni.transacaoCol);

        vDadosIni.restoreDataSetDefaultCadPadrao(
          DBGridManifestacao,
          GridCfgManifestacao,
          true,
          ListPositionsManifestacao,
          cdsGridManifestacao);
      end;

    _GravaConfiguracoesString(Edit6.Name, Edit6.Text);
    _GravaConfiguracoesInteger(EditHw1.Name, EditHw1.AsInteger);
    _GravaConfiguracoesString(MaskEdit4.Name, MaskEdit4.Text);
    _GravaConfiguracoesString(MaskEdit5.Name, MaskEdit5.Text);
    _GravaConfiguracoesString(Edit7.Name, Edit7.Text);

    _GravaConfiguracoesBoolean(CheckBox11.Name, CheckBox11.Checked);
    _GravaConfiguracoesBoolean(CheckBox12.Name, CheckBox12.Checked);
    _GravaConfiguracoesBoolean(CheckBox13.Name, CheckBox13.Checked);
    _GravaConfiguracoesBoolean(CheckBox16.Name, CheckBox16.Checked);
    _GravaConfiguracoesBoolean(CheckBox14.Name, CheckBox14.Checked);
    _GravaConfiguracoesBoolean(CheckBox15.Name, CheckBox15.Checked);

    _GravaConfiguracoesInteger(RadioGroup4.Name, RadioGroup4.ItemIndex);
    _GravaConfiguracoesInteger(RadioGroup3.Name, RadioGroup3.ItemIndex);
    _GravaConfiguracoesInteger(RadioGroup5.Name, RadioGroup5.ItemIndex);
  end;
end;

procedure TfrmCadNF.btNFeValidarClick(Sender: TObject);
begin
  inherited;
  CadNf.abreFormConsultaNFe;
end;

procedure TfrmCadNF.btNFeVoltarClick(Sender: TObject);
var
  Acod_nf: Integer;
begin
  inherited;

  Acod_nf := CadNf.dataSet.FieldByName('cod_nf').AsInteger;

  Panel2.Parent             := Panel1;
  pnBotoesModuloNFe4.Parent := pnBotoesLabesNFe400;
  if vDadosIni.GetIni('MD', 'BTSTSNFE', 'N') <> 'S' then
    pnLabelsNFe.Parent      := pnBotoesLabesNFe400;
  CadNf.dataSet.Filter      := '';
  CadNf.dataSet.Filtered    := False;

  toggle_multi_selecao_dbgrid1(tmOff);

//  DBGrid1.OnDrawColumnCell  := nil;
//  DBGrid1.OnDblClick        := nil;
//  DBGrid1.OnCellClick       := nil;
//  DBGrid1.OnKeyDown         := DBGrid1KeyDown;
//  DBGrid1.OnMouseUp         := nil;

  CadNf.dataSet.FieldByName('sel').Visible := False;

  BitBtn3.Enabled := True;
  btSaida.Enabled := True;    
//  btSelectAll.Visible := False;
//  btUnSelectAll.Visible := False;

  if CadNf.dataSet.Active then
    CadNf.dataSet.Locate('COD_NF', Acod_nf, []);
end;

procedure TfrmCadNF.btNFeModulo310Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('NOTAFISCAL', 'A', CadNf.buscas) then
    Exit;
  CadNf.abreShiftF12;
end;

procedure TfrmCadNF.btNFeServicosClick(Sender: TObject);
begin
  inherited;
  CadNf.abreShiftF12Servico;
end;

procedure TfrmCadNF.SpeedButton82Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('NF0225', 'VISUALIZAR', 'NUM NF ' + CadNf.fstr('NUM_NF'),
    'NOTAFISCAL', CadNf.fstr('COD_NF'), CadNf.buscas, True) then
    Exit;

  screen.Cursor := crHourGlass;
  try

    Application.CreateForm(TfrmCadNFFretePorPeso, frmCadNFFretePorPeso);
    try
      frmCadNFFretePorPeso.freteModel := CadNf.GetFretePorPeso;

      if frmCadNFFretePorPeso.ShowModal = IDOK then
      begin
        CadNf.PostFretePorPeso(frmCadNFFretePorPeso.freteModel);

        CadNf.vItem.prepare_loop();
        try
          CadNf.somaTotaisNF();
        finally
          CadNf.vItem.prepare_loop_done();
        end;
      end;

    finally
      frmCadNFFretePorPeso.Free;
    end;

  finally                      
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadNF.SpeedButton83Click(Sender: TObject);
begin
  inherited;
  edrastro_dfab.Clear;
end;

procedure TfrmCadNF.SpeedButton84Click(Sender: TObject);
begin
  inherited;
  edrastro_dval.Clear;
end;

procedure TfrmCadNF.SpeedButton85Click(Sender: TObject);
var
  Afolter: WideString;
begin
  inherited;
  Afolter := regGetConfStr(edNFeImpressao_pathPDF.Name);
  if CadNf.dllNFe.file_open_dialog(Afolter) then
  begin
    edNFeImpressao_pathPDF.Text := Afolter;
    regSetConfStr(edNFeImpressao_pathPDF.Name, edNFeImpressao_pathPDF.Text);
  end;
end;

procedure TfrmCadNF.SpeedButton86Click(Sender: TObject);
var
  camposAd: TStrings;
begin
  inherited;

  camposAd :=  NewStringList('CHAVE_NFE');
  try
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NOTAFISCAL',
      ' and coalesce(notafiscal.chave_nfe,'''') <> ''''', 'Consulta de Notas Fiscais', camposAd );

    if camposAd.Values['CHAVE_NFE'] <> '' then
      edChaveNFeRef.Text := camposAd.Values['CHAVE_NFE'];

  finally
    camposAd.Free();
  end;
end;

procedure TfrmCadNF.SpeedButton87Click(Sender: TObject);
var
  refResult: TNotaFiscalRefenciaResult;
begin
  inherited;
  refResult := ReferenciaItemUtils.Referenciar(edChaveNFeRef.Text, edNitemNFeRef.AsInteger);

  if (refResult.ChaveNFe = edChaveNFeRef.Text) and (refResult.NItem > 0) then
    edNitemNFeRef.AsValue := refResult.NItem;
end;

procedure TfrmCadNF.bt_icms_tributos_mono_infoClick(Sender: TObject);
begin
  inherited;
  if  CadNf.fequals('emissao_propria', 'S') then
    ShowAtencao('Quantidade: Você pode deixar o campo de quantidade com valor zero que o sistema irá preencher o XML com a própria quantidade comercializada' + sLineBreak +
                'Caso preenchido pelo usuário o sistema mantem o valor informado para geração do XML' + sLineBreak + '-' + sLineBreak +
                'Valor: Na emissão própria de nota fiscal o campo "Valor" cobrado anteriormente corresponde ao valor unitáio, durante a criação do XML o sistema irá multiplicar pelo campo de quantidade')
  else
    ShowAtencao('Diferente das notas emissão própria os campos preenchidos aqui serão considerados totalizadosconsi')  

end;

procedure TfrmCadNF.bt_info_und_xmlClick(Sender: TObject);
begin
  inherited;
  ShowAtencao('Quantidade = %s' + sLineBreak +
              'Unidade de medida = %s' + sLineBreak +
              'Valor Unitário = %s',
              [FloatToStr(CadNf.vItem.vrDadosItem.qcom), CadNf.vItem.vrDadosItem.ucom, FloatToStr(CadNf.vItem.vrDadosItem.vuncom)]);
end;

procedure TfrmCadNF.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  CadNf.abreFormDetalhesNfe;
end;

procedure TfrmCadNF.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  CadNf.inut.abrir(-1);
  edInutAno.Text := CadNf.inut.Ano;
end;

procedure TfrmCadNF.bt_nfe_verificar_dados_contingenciaClick(Sender: TObject);
begin
  inherited;
  CadNf.nfe_verificar_dados_contingencia;
end;

procedure TfrmCadNF.bt_outras_nfClick(Sender: TObject);
var
  AmenuItem: TMenuItem;
begin
  inherited;
  if not Assigned(FpopMenuOut) then
  begin
    FpopMenuOut := TPopupMenu.Create(Self);

    AmenuItem := TMenuItem.Create(FpopMenuOut);
    AmenuItem.Caption := '&Ajuste de estoque';
    AmenuItem.OnClick := nf_outras_options_ajustes_estoque;
    FpopMenuOut.Items.Add(AmenuItem);

    AmenuItem := TMenuItem.Create(FpopMenuOut);
    AmenuItem.Caption := '&Restituição ou Complemento do ICMS ST';
    AmenuItem.OnClick := nf_outras_options_rest_compl_icmsst;
    FpopMenuOut.Items.Add(AmenuItem);

    AmenuItem := TMenuItem.Create(FpopMenuOut);
    AmenuItem.Caption := '&Notas pendentes de cancelamento no sistema';
    AmenuItem.OnClick := nf_outras_options_notas_pend_canc;
    FpopMenuOut.Items.Add(AmenuItem);
    
    AmenuItem := TMenuItem.Create(FpopMenuOut);
    AmenuItem.Caption := '&Notas pendentes na SEFAZ';
    AmenuItem.OnClick := nf_outras_options_notas_pend_sefaz;
    FpopMenuOut.Items.Add(AmenuItem);

    AmenuItem := TMenuItem.Create(FpopMenuOut);
    AmenuItem.Caption := '-';
    FpopMenuOut.Items.Add(AmenuItem);

    AmenuItem := TMenuItem.Create(FpopMenuOut);
    AmenuItem.Caption := '&Dados certificado';
    AmenuItem.OnClick := nf_outras_options_dados_certificado;
    FpopMenuOut.Items.Add(AmenuItem);
    
    AmenuItem := TMenuItem.Create(FpopMenuOut);
    AmenuItem.Caption := '-';
    FpopMenuOut.Items.Add(AmenuItem);

    AmenuItem := TMenuItem.Create(FpopMenuOut);
    AmenuItem.Caption := 'Área de transferência';               
    AmenuItem.Name    := 'Areadetransferencia';
    AmenuItem.OnClick := NfAreaDeTransferenciaMenuVisualizar1Click;
    FpopMenuOut.Items.Add(AmenuItem);

    AmenuItem := TMenuItem.Create(FpopMenuOut);
    AmenuItem.Caption := 'Área de transferência - Consulta por empresa';
    AmenuItem.Name    := 'AreadetransferenciaMultiempresa1';
    AmenuItem.OnClick := NfAreaDeTransferenciaMenuVisualizar1Click;
    FpopMenuOut.Items.Add(AmenuItem);
  end;

  FpopMenuOut.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmCadNF.bt_pc_configClick(Sender: TObject);
begin
  inherited;
  popItens.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmCadNF.bt_popmenu_undClick(Sender: TObject);
var
  AmenuItem: TMenuItem;
  undVenda: TUnidadeVenda_Model;
begin
  inherited;
  if Assigned(FpopMenuUnd) then
    FreeAndNil(FpopMenuUnd);
  FpopMenuUnd := TPopupMenu.Create(Self);

  if (CadNf.vItem.vrDadosItem.ucom <> '')
    and (CadNf.vItem.vrDadosItem.qcom > 0)
    and (CadNf.vItem.vrDadosItem.vuncom > 0)
    and (edUndVnd.Items.IndexOf(CadNf.vItem.vrDadosItem.ucom) = -1) then
  begin
    AmenuItem := TMenuItem.Create(FpopMenuUnd);
    AmenuItem.Caption := Format('[Dados do XML] - Criar conversão de ["%s" = "%s"]', [CadNf.vItem.vrDadosItem.ucom, eddReferencia.Text]);
    AmenuItem.OnClick := uvnd_criar_conversao_do_xml;
    FpopMenuUnd.Items.Add(AmenuItem);
  end;

  if edUndVnd.ItemIndex >= 0 then
  begin
    undVenda := (edUndVnd.Items.Objects[edUndVnd.ItemIndex] as TUnidadeVenda_Model);

    if (undVenda.unid_vnd = CadNf.vItem.vrDadosItem.ucom) // Igual a NFe
      and (undVenda.fator = 0)
      and (CadNf.vItem.vrDadosItem.qcom > 0)
      and (CadNf.vItem.vrDadosItem.vuncom > 0) then
    begin
      AmenuItem := TMenuItem.Create(FpopMenuUnd);
      AmenuItem.Caption := Format('Criar conversão ["%s" = "%s"] do XML e aplicar sobre Qtde %s', [undVenda.unid_vnd, undVenda.unid_princ, FloatToStr(CadNf.vItem.vrDadosItem.qcom)]);
      AmenuItem.OnClick := uvnd_criar_conversao_do_xml_applicar;
      FpopMenuUnd.Items.Add(AmenuItem);

      AmenuItem := TMenuItem.Create(FpopMenuUnd);
      AmenuItem.Caption := '-';
      FpopMenuUnd.Items.Add(AmenuItem);
    end;

    if //(undVenda.unid_vnd <> CadNf.vItem.vrDadosItem.ucom) // Difere do NFe
      {and} (undVenda.unid_vnd <> undVenda.unid_princ)       // e da principal, caso fornecedor venha a alterar unidade
      and (undVenda.fator > 0)
      and (undVenda.unid_pref = '')
      and (CadNf.vItem.vrDadosItem.qcom > 0)
      and (CadNf.vItem.vrDadosItem.vuncom > 0)then
    begin
      AmenuItem := TMenuItem.Create(FpopMenuUnd);
      AmenuItem.Caption := Format('Definir [%s] quando a entrada XML for igual a [%s]', [undVenda.paridade, CadNf.vItem.vrDadosItem.ucom]);
      AmenuItem.OnClick := uvnd_definir_preferencia_xml;
      FpopMenuUnd.Items.Add(AmenuItem);

      AmenuItem := TMenuItem.Create(FpopMenuUnd);
      AmenuItem.Caption := '-';
      FpopMenuUnd.Items.Add(AmenuItem);
    end;

  end;

  AmenuItem := TMenuItem.Create(FpopMenuUnd);
  AmenuItem.Caption := 'Criar nova conversão para uma outra de medida';
  AmenuItem.OnClick := uvnd_criar_conversao;
  FpopMenuUnd.Items.Add(AmenuItem);

  FpopMenuUnd.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TfrmCadNF.bt_tipo_calc_pc_unlockClick(Sender: TObject);
begin
  inherited;
  ed_tipoCalcPC.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (ed_tipoCalcPC.CanFocus) then
    ed_tipoCalcPC.SetFocus;
end;

procedure TfrmCadNF.bt_tipo_calc_ret_unlockClick(Sender: TObject);
begin
  inherited;
  ed_tipoCalcRet.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (ed_tipoCalcRet.CanFocus) then
    ed_tipoCalcRet.SetFocus;
end;

procedure TfrmCadNF.bt_tipo_calc_unlockClick(Sender: TObject);
begin
  inherited;
  ed_tipoCalc.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (ed_tipoCalc.CanFocus) then
    ed_tipoCalc.SetFocus;
//  if not bt_alterar_campos_icms.Visible then //se nao ta visivel o usuário pode ter alterado os dados
//    bt_calc_run.Click;
end;

procedure TfrmCadNF.buildCadastroCamposCalculoICMSSN;
begin
  edtbase_icm2.DataField  := 'BASE_ICM'   + IfThen((vDadosIni.vEmp.vRegime = 'SIMPLES') and CadNf.fequals('natureza_nf', 'S') and CadNf.fequals('tipo_emissao', '1') , '_SIMPLES');
  edtvalor_icm2.DataField := 'VALOR_ICM'  + IfThen((vDadosIni.vEmp.vRegime = 'SIMPLES') and CadNf.fequals('natureza_nf', 'S') and CadNf.fequals('tipo_emissao', '1') , '_SIMPLES');
  lbtbase_icm2.Caption    := 'Base ICMS'  + IfThen((vDadosIni.vEmp.vRegime = 'SIMPLES') and CadNf.fequals('natureza_nf', 'S') and CadNf.fequals('tipo_emissao', '1') , ' SN');
  lbtvalor_icm2.Caption   := 'Valor ICMS' + IfThen((vDadosIni.vEmp.vRegime = 'SIMPLES') and CadNf.fequals('natureza_nf', 'S') and CadNf.fequals('tipo_emissao', '1') , ' SN');
end;

procedure TfrmCadNF.buildCadastroItens;
begin
  if CadNf.notaFechada then
    exit;

  if not CadNf.validaCabecalho then
  begin
    CadNf.vItem.cancelar;
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
    exit;
  end;

  if CadNf.vItem.vrDadosItem.stado <> dsEdit then
    if not CadNf.validaRodape then
    begin
      CadNf.vItem.cancelar;
      setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
      exit;
    end;

  if CadNf.vItem.vrDadosItem.stado <> dsEdit then
    if (CadNf.campo_natureza_nf = 'E') and (CadNf.ffloat('valor_prod') <= 0) then
      begin
        CadNf.vItem.cancelar;
        Application.MessageBox('Valor total dos produtos zerado','Atenção',0+64);
        exit;
      end;

  // Direcionamento para aba maior de itens
  pageDadosNF.Tag := IfThen( pageDadosNF.ActivePage = tsnf_ResumoNota, 1, 2);

  pageDadosNF.ActivePage := tsnf_itens;
  groupItensNota.Parent := tsnf_itens;

  VisualItemTributosRtcIgnorar();

  if CadNf.vItem.vrDadosItem.stado = dsEdit then
    if vDadosIni.vEmp.vRegime = 'SIMPLES' then
      eddCSOSN.Text := CadNf.getCSOSNPorCST(eddCST.AsString, eddCSOSN.AsString, False);

  if CadNf.fequals('tipo_nf', 'O') then
    pgControlItensNFe.ActivePage       := tsMerc_itens_outras
  else if CadNf.fstrin('tipo_nf', ['P', 'S']) then
    pgControlItensNFe.ActivePage       := tsMerc_Mercadorias;
  btAlterarItemProdDetalhado.Tag       := CadNf.vItem.dataSet.FieldByName('nitem').AsInteger;
  //btHabPISCOFINS.Enabled               := (CadNf.campo_natureza_nf = 'E') or (CadNf.dataSet.FieldByName('devolucao').AsString = 'SIM');
  //bt_it_pc_alterar_aliq_perc.Enabled   := (CadNf.campo_natureza_nf = 'E');
  eddNumFabFornecedor.Enabled          := (CadNf.vItem.vrDadosItem.stado <> dsEdit) or ((CadNf.vItem.vrDadosItem.tipo_item = 'P') and (CadNf.vItem.vrDadosItem.cod_prod = ''));
  eddNumFab.Enabled                    := (CadNf.vItem.vrDadosItem.stado <> dsEdit) or ((CadNf.vItem.vrDadosItem.tipo_item = 'P') and (CadNf.vItem.vrDadosItem.cod_prod = ''));
  eddTipo.Enabled                      := CadNf.vItem.vrDadosItem.stado <> dsEdit;
  btEditGrade.Visible                  := CadNf.fequals('natureza_nf', 'S') and (CadNf.vItem.vrDadosItem.tipo_item = 'P');// Sempre habilitado pois o alterar junta com cod_grade_prod CadNf.vItem.vrDadosItem.cod_grade > 0;
  pnCadastroItensProdDetalhado.Visible := True;
  pnCadastroItensProdDetalhado.Enabled := True;
  pnConsultaItensProdDetalhado.Visible := False;
  pnConsultaItensProdDetalhado.Enabled := False;
  //edDTipo.Text                         := 'P';
  eddTipo.Enabled                      := False;
  eddMNF.Text                          := CadNf.vItem.dataSet.FieldByName('mnf').AsString;
  ed_rateio_seguro.Enabled             := (CadNf.vItem.vrDadosItem.tipo_item <> 'S') and (ck_tipo_seguro.Checked);
  ed_rateio_frete.Enabled              := (CadNf.vItem.vrDadosItem.tipo_item <> 'S') and (ck_tipo_frete.Checked);
  ed_rateio_outdesp.Enabled            := (CadNf.vItem.vrDadosItem.tipo_item <> 'S') and (ck_tipo_outdesp.Checked);
  ed_rateio_desp_pf.Enabled            := (CadNf.vItem.vrDadosItem.tipo_item <> 'S') and (ck_tipo_desppf.Checked);
  ed_tipoCalc.Enabled                  := False;
  ed_tipoCalc.Visible                  := True;
  bt_tipo_calc_unlock.Visible          := True;
  ed_tipoCalcPC.Enabled                := False;
  ed_tipoCalcPC.Visible                := True;
  ed_tipoCalcRet.Enabled               := False;
  ed_tipoCalcRet.Visible               := True;
  bt_tipo_calc_pc_unlock.Visible       := True;
  bt_tipo_calc_ret_unlock.Visible      := True;
  lb_tipo_calc_5.Visible               := False;
  eddCST.OnChange                      := campos_itens_cstChange;
  eddReferencia.Enabled                := CadNf.vItem.vrDadosItem.tipo_item <> 'P';
  edUndVnd.Enabled                     := CadNf.vItem.vrDadosItem.tipo_item = 'P';
  lbUndVnd.Caption                     := '';
  lbUndVnd.Visible                     := CadNf.vItem.vrDadosItem.tipo_item = 'P';
  bt_popmenu_und.Visible               := CadNf.vItem.vrDadosItem.tipo_item = 'P';
  bt_info_und_xml.Visible              := (CadNf.vItem.vrDadosItem.ucom <> '') and (CadNf.vItem.vrDadosItem.qcom > 0);
  pnEstoqueItemNfSaida.Visible         := CadNf.fequals('natureza_nf', 'S') and (CadNf.vItem.vrDadosItem.stado <> dsEdit) and (CadNf.vItem.vrDadosItem.tipo_item = 'P') and (CadNf.vItem.vrDadosItem.cod_prod = '');
  lbEstoqueItemNfSaida.Caption         := '?/?';
  lbEstoqueItemNfSaida.Hint            := 'Disponível ? / Físco ?';
  pnEstoqueItemNfSaida.Hint            := lbEstoqueItemNfSaida.Hint;


//  gb_item_icms_desoneracao.Enabled     := MatchStr(Copy(eddCST.Text, 2, 2), ['20', '30', '40', '70', '90']);
//  gb_item_icms_diferido.Enabled        := MatchStr(Copy(eddCST.Text, 2, 2), ['51']);
//
//  if not gb_item_icms_desoneracao.Enabled then
//    gb_item_icms_desoneracao.Font.Color := clGray
//  else
//    gb_item_icms_desoneracao.ParentFont := True;
//
//  if not gb_item_icms_diferido.Enabled then
//    gb_item_icms_diferido.Font.Color := clGray
//  else
//    gb_item_icms_diferido.ParentFont := True;
  buildCadastroItensAlteracaoTributo;

  if (Self.Enabled) and (Self.Visible) and (edOnCodigo.CanFocus) then
    edOnCodigo.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (eddNumFabFornecedor.CanFocus) and (vDadosIni.vEmp.vBuscaCodNoProduto <> 'S') then
    eddNumFabFornecedor.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (eddTipo.CanFocus) then
    eddTipo.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (eddNumFab.CanFocus) then
    eddNumFab.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (eddDescricao.CanFocus) then
    eddDescricao.SetFocus;
end;

procedure TfrmCadNF.buildCadastroItensAlteracaoTributo;
var
  tipoCalc: TTipoCalculo;
begin
  tipoCalc := TTipoCalculo(ed_tipoCalc.ItemIndex);

  if (tipoCalc = tcParcial) and
    (TTipoCalculo(CadNf.vItem.vrDadosItem.tipo_calc) <> tcParcial) then
  begin
    //CadNf.vItem.vrDadosItem.calcIcmsActive := True;
    //CadNf.vItem.vrDadosItem.calcIcmsUfDestActive := True;
    //CadNf.vItem.vrDadosItem.calcPISCOFINSActive := True;
  end;

  {$REGION 'todos tributos exceto piscofins e retencoes'}
  pn_icms_tributos_mono.Enabled            := False;
//  if tipoCalc = tcNenhum then
//    pn_icms_tributos_mono.ParentFont       := True
//  else
//    pn_icms_tributos_mono.Font.Color       := clGray;

  if tipoCalc = tcCompleto then
  begin
    pn_icms_tributos.Enabled              := False;
    pn_icms_tributos.Font.Color           := clGray;
    pn_icms_tributos_cst.Enabled          := False;
    pn_icms_tributos_cst.Font.Color       := clGray;
    bt_alterar_campos_icms.Visible        := False;

    pn_icms_ufdest_tributos.Enabled       := False;
    pn_icms_ufdest_tributos.Font.Color    := clGray;
    bt_alterar_campos_icms_ufdest.Visible := False;

    pn_iss_tributos.Enabled         := False;
    pn_iss_tributos.Font.Color      := clGray;
    bt_alterar_campos_iss.Visible   := False;

    pnIPIItens.Enabled            := False;
    pnIPIItens.Font.Color         := clGray;
    bt_alterar_campos_ipi.Visible := True;
  end
  else
  //else if tipoCalc = tcParcial then
  begin
    pn_icms_tributos.Font.Color           := clGray;
    pn_icms_tributos.Enabled              := CadNf.vItem.vrDadosItem.calcIcmsActive;
    pn_icms_tributos.ParentFont           := CadNf.vItem.vrDadosItem.calcIcmsActive;

    pn_icms_tributos_cst.Font.Color       := clGray;
    pn_icms_tributos_cst.Enabled          := CadNf.vItem.vrDadosItem.calcIcmsActive;
    pn_icms_tributos_cst.ParentFont       := CadNf.vItem.vrDadosItem.calcIcmsActive;
    bt_alterar_campos_icms.Visible        := not CadNf.vItem.vrDadosItem.calcIcmsActive;

    pn_icms_ufdest_tributos.Font.Color    := clGray;
    pn_icms_ufdest_tributos.Enabled       := CadNf.vItem.vrDadosItem.calcIcmsUfDestActive;
    pn_icms_ufdest_tributos.ParentFont    := CadNf.vItem.vrDadosItem.calcIcmsUfDestActive;
    bt_alterar_campos_icms_ufdest.Visible := not CadNf.vItem.vrDadosItem.calcIcmsUfDestActive;

    pn_iss_tributos.Font.Color      := clGray;
    pn_iss_tributos.Enabled         := CadNf.vItem.vrDadosItem.calcISSActive;
    pn_iss_tributos.ParentFont      := CadNf.vItem.vrDadosItem.calcISSActive;
    bt_alterar_campos_iss.Visible   := not CadNf.vItem.vrDadosItem.calcISSActive;

    pnIPIItens.Font.Color         := clGray;
    pnIPIItens.Enabled            := CadNf.vItem.vrDadosItem.calcIPIActive;
    pnIPIItens.ParentFont         := CadNf.vItem.vrDadosItem.calcIPIActive;
    bt_alterar_campos_ipi.Visible := True;
  end;

  bt_calc_run.Enabled     := (tipoCalc <> tcNenhum) and (not bt_alterar_campos_icms.Visible);
  bt_calc_run2.Enabled    := bt_calc_run.Enabled;
  eddModBCST.Enabled      := tipoCalc <> tcCompleto;
  eddvalor_icm.Enabled    := tipoCalc = tcNenhum;
  eddvalor_icm.Enabled    := tipoCalc = tcNenhum;
  eddvicmdeson.Enabled    := tipoCalc = tcNenhum;
  eddValorICMSST.Enabled  := (tipoCalc = tcNenhum) or (not eddAntT.Enabled);
  edvicmsefet.Enabled     := tipoCalc = tcNenhum;
  edvfcp.Enabled          := tipoCalc = tcNenhum;
  edvfcpst.Enabled        := tipoCalc = tcNenhum;
  edvalor_ipi.Enabled     := tipoCalc = tcNenhum;
  edvalor_iss.Enabled     := tipoCalc = tcNenhum;
  eddvICMSUFDest.Enabled  := tipoCalc = tcNenhum;
  eddvICMSUFRemet.Enabled := tipoCalc = tcNenhum;
  eddvFCPUFDest.Enabled   := tipoCalc = tcNenhum;
  ed_vtot_trib.Enabled    := tipoCalc = tcNenhum;

  lb_tipo_calc_1.Caption  := ed_tipoCalc.Text;
//  /lb_tipo_calc_2.Caption  := ed_tipoCalc.Text;
  //lb_tipo_calc_3.Caption  := ed_tipoCalc.Text;
  lb_tipo_calc_4.Caption  := ed_tipoCalc.Text;
  lb_tipo_calc_5.Caption  := ed_tipoCalc.Text;
  {$ENDREGION}

  {$REGION 'piscofins'}
  tipoCalc := TTipoCalculo(ed_tipoCalcPC.ItemIndex);

  if tipoCalc = tcCompleto then
  begin
    pn_piscofins_tributos.Enabled         := False;
    pn_piscofins_tributos.Font.Color      := clGray;
    bt_alterar_campos_piscofins.Visible   := False;
  end
  else
  begin
    pn_piscofins_tributos.Font.Color      := clGray;
    pn_piscofins_tributos.Enabled         := CadNf.vItem.vrDadosItem.calcPISCOFINSActive;
    pn_piscofins_tributos.ParentFont      := CadNf.vItem.vrDadosItem.calcPISCOFINSActive;
    bt_alterar_campos_piscofins.Visible   := not CadNf.vItem.vrDadosItem.calcPISCOFINSActive;
  end;

  bt_calc_piscofins_run.Enabled := (tipoCalc <> tcNenhum) and (not bt_alterar_campos_piscofins.Visible);
  ed_vpis.Enabled         := tipoCalc = tcNenhum;
  ed_vcofins.Enabled      := tipoCalc = tcNenhum;
  ed_vpisdeson.Enabled    := tipoCalc = tcNenhum;
  ed_vcofinsdeson.Enabled := tipoCalc = tcNenhum;
  {$ENDREGION}

  {$REGION 'retençoes federais'}

  tipoCalc := TTipoCalculo(ed_tipoCalcRet.ItemIndex);

  if tipoCalc = tcCompleto then
  begin
    pn_ret_bc.Enabled         := False;
    pn_ret_bc.Font.Color      := clGray;
    bt_alterar_campos_retencoes.Visible   := False;
  end
  else
  begin
    pn_ret_bc.Font.Color      := clGray;
    pn_ret_bc.Enabled         := CadNf.vItem.vrDadosItem.calcRetTribActive;
    pn_ret_bc.ParentFont      := CadNf.vItem.vrDadosItem.calcRetTribActive;
    bt_alterar_campos_retencoes.Visible   := not CadNf.vItem.vrDadosItem.calcRetTribActive;
  end;

  bt_calc_retencoes_run.Enabled := (tipoCalc <> tcNenhum) and (not bt_alterar_campos_retencoes.Visible);
  ed_vretir.Enabled     := tipoCalc = tcNenhum;
  ed_vretcsll.Enabled   := tipoCalc = tcNenhum;
  ed_vretpis.Enabled    := tipoCalc = tcNenhum;
  ed_vretcofins.Enabled := tipoCalc = tcNenhum;

  {$ENDREGION}

  campos_itens_cstChange(eddCST);
end;

procedure TfrmCadNF.buildCadastroItensDtSet(Sender: TObject);
var
  tributosRTC: TributoDFeContextEtd;
begin
  pnCadastroItensVeiculos.Visible := True;
  pnItensVeiculo.Enabled          := True;
  FrameIbsCbsVeic1.Enabled        := True;
  pnConsultaItensVeiculos.Visible := False;
  btSalvarItemVeiculo.Enabled     := True;
  btCancelarItemVeiculo.Enabled   := True;
  btConfirmarNF.Enabled           := False;
  btAlterarItemVeiculo.Enabled    := False;
  btCalcularNf.Enabled            := False;
  btDetalhesVeiculo.Enabled       := False;
  pnItemVeicPisCofins.Visible     := CadNf.fequals('tipo_emissao', '4') and CadNf.fequals('natureza_nf', 'S');

  // Direcionamento para aba maior de itens
  pageDadosNF.ActivePage := tsnf_itens;
  groupItensNota.Parent := tsnf_itens;
  pageItensVeiculos.ActivePage := tsVeic_Item;

  {$REGION 'Tributos da RTC'}

  tributosRTC := CadNf.vItem.GetStateTributoRTC();
  try
    if (tributosRTC = nil)
      or ( (tributosRTC.IbsCbs = nil) and (tributosRTC.ImpostoSeletivo = nil) )
    then
      FrameIbsCbsVeic1.Setup( nil )
    else
      FrameIbsCbsVeic1.Setup( tributosRTC.IbsCbs );

    FrameIbsCbsVeic1.Reset();
  finally
    tributosRTC.Free();
  end;

  {$ENDREGION}
end;

procedure TfrmCadNF.statusBar(textoPadrao, hintControle: string);
begin
  inherited;

  if not Assigned(CadNf) then
    Exit;

  StatusBar1.Panels.Clear;

  try
  if CadNf.DadosCertificado.Values['Error'] <> '' then
    with StatusBar1.Panels.Add do
    begin
      Text := 'Erro leitura certificado!';
      Width := 120;
    end;

  if CadNf.DadosCertificado.Values['DataVencimento'] <> '' then
    with StatusBar1.Panels.Add do
    begin
      Text := 'Cert venc: ' + CadNf.DadosCertificado.Values['DataVencimento'];
      Width := 125;
    end;
  except on E: Exception do
    begin
      CadNf.registraErro('TfrmCadNF.statusBar Erro: ' + e.Message);
      vDadosIni.ShowErro('Erro leitura certificado!' + sLineBreak + sLineBreak + E.Message);
    end;
  end;

  if TextoPadrao <> '' then
    TextoPadraoStatusBar := textoPadrao;

  if TextoPadraoStatusBar <> '' then  
    with StatusBar1.Panels.Add do
    begin
      Text := TextoPadraoStatusBar;
      Width := 345;
    end;

  if hintControle <> '' then
    with StatusBar1.Panels.Add do
    begin
      Text := hintControle;
      Width := 345;
    end;
end;

procedure TfrmCadNF.btRefressDestClick(Sender: TObject);
begin
  inherited;
  if CadNf.dataSet.State in [dsInsert, dsEdit] then
  begin
    CadNf.vClFor.selecionaClFor;
    if CadNf.vClFor.EndDoc.lista.Count > 0 then
      CadNf.vClFor.SetDadosDestinatario(CadNf.vClFor.EndDoc.lista.Items[0]);
    btNextDest.Enabled  := (CadNf.vClFor.EndDoc.indice + 1) < CadNf.vClFor.EndDoc.lista.Count;
    btPriorDest.Enabled := CadNf.vClFor.EndDoc.indice > 0;
    lkIdDest.Enabled := (CadNf.f_str('dest_uf') <> vDadosIni.vEmp.vSiglaUF) or CadNf.fequals('cpfcgc', vDadosIni.vEmp.vCNPJ);
    lkIdDestMais.Enabled := lkIdDest.Enabled;
  end;
end;

procedure TfrmCadNF.toggle_multi_selecao_dbgrid1(
  state: TToggleMultSelectGridState);
var
  I: Integer;
begin
  for I := 0 to DBGrid1.Columns.Count - 1 do
    if DBGrid1.Columns[I].FieldName = 'SEL' then
    begin
      DBGrid1.Columns[I].Visible := state = tmOn;
      DBGrid1.Columns[I].Index := 0;
      Break;
    end;

  if state = tmOff then
  begin                            
    CadNf.dataSet.FieldByName('sel').Visible := False;
    DBGrid1.OnDrawColumnCell  := nil;
    DBGrid1.OnDblClick        := nil;
    DBGrid1.OnCellClick       := nil;
    DBGrid1.OnKeyDown         := DBGrid1KeyDown;
    DBGrid1.OnMouseUp         := nil;

    btSelectAll.Visible := False;
    btUnSelectAll.Visible := False;

    Ativarseleomultipladenotasparacpia1.Caption := 'Ativar seleção multipla de notas para cópia';
    Ativarseleomultipladenotasparacpia1.Tag := 0;
  end
  else
  begin
    CadNf.dataSet.FieldByName('sel').Visible := True;
    DBGrid1.OnDrawColumnCell  := gridNFe_DrawColumnCell;
    DBGrid1.OnDblClick        := gridNFe_DblClick;
    DBGrid1.OnCellClick       := gridNFe_CellClick;
    DBGrid1.OnKeyDown         := gridNFe_KeyDown;
    DBGrid1.OnMouseUp         := gridNFe_MouseUp;

    btSelectAll.Visible := True;
    btUnSelectAll.Visible := True;

    Ativarseleomultipladenotasparacpia1.Caption := 'Desativar seleção multipla de notas';
    Ativarseleomultipladenotasparacpia1.Tag := 1;

//    CadNf.storeRecNo;
//    CadNf.First;
//    CadNf.Last;
//    CadNf.restoreRecNo;
  end;
end;

procedure TfrmCadNF.tsDadosEntradaEnter(Sender: TObject);
begin
  inherited;
  Panel4.Height := 115;
end;

procedure TfrmCadNF.tsMerc_ICMSExit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> btSalvarItemProdServDetalhado) and (ActiveControl <> btCancelarItemProdServDetalhado) then
    if ActiveControl.Parent <> TWinControl(Sender).Parent then
      if pos('TSMERC_', UpperCase(ActiveControl.Name)) = 0 then
        ActiveControl := btSalvarItemProdServDetalhado;
end;

procedure TfrmCadNF.tsMerc_itens_outrasEnter(Sender: TObject);
begin
  inherited;

  tsMerc_ICMS.TabVisible := True;

  tsMerc_IPI.TabVisible := True;

  tsMerc_ISS.TabVisible := False;

  tsMerc_Combustiveis.TabVisible := ((Trim(CadNf.vItem.vrDadosItem.comb_cprodanp) <> '') or CadNf.fequals('tipo_nf', 'O'))
    and (Trim(vDadosIni.vEmp.vCombProduto) = 'S');
end;

procedure TfrmCadNF.tsMerc_MercadoriasEnter(Sender: TObject);
begin
  inherited;

  tsMerc_ICMS.TabVisible := Trim(edDTipo.Text) = 'P';

  tsMerc_IPI.TabVisible := Trim(edDTipo.Text) = 'P';

  tsMerc_ISS.TabVisible := Trim(edDTipo.Text) = 'S';

  tsMerc_Combustiveis.TabVisible := ((Trim(CadNf.vItem.vrDadosItem.comb_cprodanp) <> '') or CadNf.fequals('tipo_nf', 'O'))
    and (Trim(vDadosIni.vEmp.vCombProduto) = 'S');

  ts_Merc_Retencoes_federais.TabVisible := CadNf.fint('ret_fed') > 0;

  pnItensEspecificos.Visible := MatchText( Trim(edDTipo.Text), [ 'P', 'O' ]);
  pnItensEspecificosProd.Visible := Trim(edDTipo.Text) = 'P';
  pnItensEspecificosServ.Visible := Trim(edDTipo.Text) = 'S';

  if (CadNf.campo_natureza_nf = 'S') then
    tsMerc_ISS.OnExit := tsMerc_MercadoriasExit
  else
    tsMerc_ISS.OnExit := tsMerc_ICMSExit;

  if tsMerc_ISS.TabVisible then
  begin
    ed_tipoCalc.Parent := gb_cst_iss;
    ed_tipoCalc.Left   := 44;
    ed_tipoCalc.Top    := 8;

  end
  else
  begin
    ed_tipoCalc.Parent := gb_cst_icms;
    ed_tipoCalc.Left   := 498;
    ed_tipoCalc.Top    := 10;
  end;
end;

procedure TfrmCadNF.tsMerc_MercadoriasExit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> btSalvarItemProdServDetalhado) and (ActiveControl <> btCancelarItemProdServDetalhado) then
    if ActiveControl.Parent <> TWinControl(Sender).Parent then
      if pos('TSMERC_', UpperCase(ActiveControl.Name)) = 0 then
      begin
        while True do
        begin
          if pgControlItensNFe.ActivePageIndex = pgControlItensNFe.PageCount - 1  then
            pgControlItensNFe.ActivePageIndex := 0
          else
            pgControlItensNFe.ActivePageIndex := pgControlItensNFe.ActivePageIndex + 1;
          if pgControlItensNFe.ActivePage.TabVisible then
            Break;
        end;
        THackWinControl(pgControlItensNFe.ActivePage).SelectFirst;
      end;
end;

procedure TfrmCadNF.tsMerc_PedidoClienteEnter(Sender: TObject);
var
  pedidos: PedidosCompraClienteNFe;
  ped: PedidosCompraClienteNFe;
  I: Integer;
begin
  inherited;
  lbxPedCliDisponiveis.Visible := CadNf.vItem.vrDadosItem.tipo_item = 'P';
  if not lbxPedCliDisponiveis.Visible then
    Exit;

  pedidos := CadNf.PedidoCliente.GetPedidos(CadNf.vItem.vrDadosItem.cod_prod, CadNf.vItem.vrDadosItem.grupo_prod, CadNf.vItem.vrDadosItem.cod_grade,
    IfThen(CadNf.fint('cod_cli_ped') > 0, CadNf.fint('cod_cli_ped'), CadNf.fint('cod_cliente'))
  );

  lbxPedCliDisponiveis.Clear();
  for I := Low(pedidos) to High(pedidos) do
  begin
    lbxPedCliDisponiveis.Items.Add(Format('%s - N°: %s - Item: %d - Quant: %0.3f/%0.3f',
      [DateToStr(pedidos[i].DataPedido), pedidos[i].Numero, pedidos[i].NumItem, pedidos[i].QtdePed, pedidos[i].QtdeEnv]));
  end;
end;

procedure TfrmCadNF.tsOut_MercadoriasEnter(Sender: TObject);
begin
  inherited;
  tsOut_ICMS.TabVisible := True;

  tsOut_IPI.TabVisible := True;

  tsOut_ISS.TabVisible := False;

  tsOut_Combustiveis.TabVisible := (Trim(CadNf.vItem.vrDadosItem.comb_cprodanp) <> '') and (Trim(vDadosIni.vEmp.vCombProduto) = 'S');
end;

procedure TfrmCadNF.tsOut_MercadoriasExit(Sender: TObject);
var
  vFocoNoSalvar: Boolean;
begin
  inherited;
  vFocoNoSalvar := False;
  if (ActiveControl <> btSalvarItemOutrasNF) and (ActiveControl <> btCancelarItemOutrasNf) then
    if ActiveControl.Parent <> TWinControl(Sender).Parent then
      if pos('TSOUT_', UpperCase(ActiveControl.Name)) = 0 then
      begin
        while True do
        begin
          if pgControlOItensNFe.ActivePageIndex = pgControlOItensNFe.PageCount - 1  then
            vFocoNoSalvar := True
          else
            pgControlOItensNFe.ActivePageIndex := pgControlOItensNFe.ActivePageIndex + 1;
          if pgControlOItensNFe.ActivePage.TabVisible then
            Break;
          if vFocoNoSalvar then
            Break;
        end;
        if vFocoNoSalvar then
          ActiveControl := btSalvarItemOutrasNF
        else
          THackWinControl(pgControlOItensNFe.ActivePage).SelectFirst;
      end;
end;

procedure TfrmCadNF.uvnd_criar_conversao(Sender: TObject);
var
  undVnd: string;
  payload: TConvUnidadeCriarInput;
begin
  undVnd := '?';

  if not InputQuery('Nova conversão', 'Informe a unidade para conversão', undVnd) then
    Exit;

  undVnd := AnsiUpperCase(Trim(undVnd));

  if (undVnd = '?')
    or (Length(undVnd) <= 0)
    or (Length(undVnd) > 6) then
  begin
    ShowAtencao('Unidade inválida. Informe de 1 a 6 caracteres');
    Exit;
  end;

  if (undVnd = Trim(eddReferencia.Text)) then
  begin
    ShowAtencao('Unidade informada é a mesma do estoque. Não há necessidade de criar conversão');
    Exit;
  end;

  payload := TConvUnidadeCriarInput.Create;
  payload.grupo_prod := CadNf.vItem.vrDadosItem.grupo_prod;
  payload.cod_prod := CadNf.vItem.vrDadosItem.cod_prod;
  payload.cod_empresa := vDadosIni.cod_empresa;
  payload.usuario := vDadosIni.vNomeUsuario;
  payload.uvnd := undVnd;
  payload.ean := IfThen(CadNf.vItem.vrDadosItem.cean <> 'SEM GTIN', CadNf.vItem.vrDadosItem.cean);

  if ConversaoUnidadeUtils.Criar(CadNf.buscas.Database, payload) then
    uvnd_fill_select;
end;

procedure TfrmCadNF.uvnd_criar_conversao_do_xml(Sender: TObject);
var
  payload: TConvUnidadeCriarInput;
begin
  payload := TConvUnidadeCriarInput.Create;
  payload.grupo_prod := CadNf.vItem.vrDadosItem.grupo_prod;
  payload.cod_prod := CadNf.vItem.vrDadosItem.cod_prod;
  payload.cod_empresa := vDadosIni.cod_empresa;
  payload.usuario := vDadosIni.vNomeUsuario;
  payload.uvnd := CadNf.vItem.vrDadosItem.ucom;
  payload.ean := IfThen(CadNf.vItem.vrDadosItem.cean <> 'SEM GTIN', CadNf.vItem.vrDadosItem.cean);

  if ConversaoUnidadeUtils.Criar(CadNf.buscas.Database, payload) then
    uvnd_fill_select;
end;

procedure TfrmCadNF.uvnd_criar_conversao_do_xml_applicar(Sender: TObject);
var
  payload: TConvUnidadeCriarInput;
  undVenda: TUnidadeVenda_Model;
begin
  payload := TConvUnidadeCriarInput.Create;
  payload.grupo_prod := CadNf.vItem.vrDadosItem.grupo_prod;
  payload.cod_prod := CadNf.vItem.vrDadosItem.cod_prod;
  payload.cod_empresa := vDadosIni.cod_empresa;
  payload.usuario := vDadosIni.vNomeUsuario;
  payload.uvnd := CadNf.vItem.vrDadosItem.ucom;
  payload.ean := IfThen(CadNf.vItem.vrDadosItem.cean <> 'SEM GTIN', CadNf.vItem.vrDadosItem.cean);

  if ConversaoUnidadeUtils.Criar(CadNf.buscas.Database, payload) then
  begin
    edUndVnd.Items := CadNf.vItem.GetUndVendaProd();

    if edUndVnd.Items.IndexOf(CadNf.vItem.vrDadosItem.ucom) >= 0 then
    begin
      undVenda := (edUndVnd.Items.Objects[edUndVnd.Items.IndexOf(CadNf.vItem.vrDadosItem.ucom)] as TUnidadeVenda_Model);

      if undVenda.fator > 0 then
      begin
        eddQTDEMBREC.AsValue     := CadNf.vItem.vrDadosItem.qcom;
        eddQtde.AsValue          := undVenda.CalculaPrincipal(CadNf.vItem.vrDadosItem.qcom);
        eddVLREMBNF.AsValue      := CadNf.vItem.vrDadosItem.vuncom;
        eddValorTotal.AsValue    := CadNf.vItem.vrDadosItem.qcom * CadNf.vItem.vrDadosItem.vuncom;
        eddValorUnitario.AsValue := eddValorTotal.AsValue / eddQtde.AsValue;

        edUndVnd.ItemIndex := edUndVnd.Items.IndexOf(CadNf.vItem.vrDadosItem.ucom);
        edUndVnd.Tag := edUndVnd.ItemIndex;
        edUndVndChange(edUndVnd);
      end;
    end;
  end;
end;

procedure TfrmCadNF.uvnd_definir_preferencia_xml(Sender: TObject);
var
  undVenda, payload: TUnidadeVenda_Model;
  I: Integer;
begin
  if edUndVnd.ItemIndex >= 0 then
  begin
    undVenda := (edUndVnd.Items.Objects[edUndVnd.ItemIndex] as TUnidadeVenda_Model);
    payload := TUnidadeVenda_Model.Create;
    try
      payload.CopyFrom(undVenda);
      payload.unid_pref := CadNf.vItem.vrDadosItem.ucom;

      if CadNf.helperConv.SetPreferencial(payload) then
      begin
        for I := 0 to edUndVnd.Items.Count - 1 do
          if (edUndVnd.Items.Objects[I] as TUnidadeVenda_Model).unid_pref = CadNf.vItem.vrDadosItem.ucom then
            (edUndVnd.Items.Objects[I] as TUnidadeVenda_Model).unid_pref := '';
        undVenda.unid_pref := CadNf.vItem.vrDadosItem.ucom;
      end;

    finally
      payload.Free;
    end;
  end;
end;

procedure TfrmCadNF.uvnd_fill_select(uvndIdx: string);
var
  undVenda: TUnidadeVenda_Model;
begin
  edUndVnd.Items.Clear;
  if CadNf.vItem.vrDadosItem.tipo_item <> 'P' then
    edUndVnd.Items.Clear
  else if CadNf.vItem.vrDadosItem.stado = dsEdit then
    edUndVnd.Items := CadNf.vItem.UndVenda
  else if CadNf.vItem.vrDadosItem.stado = dsInsert then
    edUndVnd.Items := CadNf.vItem.GetUndVendaProd()
  else
    edUndVnd.Items.Clear;

  if edUndVnd.Items.Count > 0 then
  begin
    if (Trim(uvndIdx) <> '') and (edUndVnd.Items.IndexOf(uvndIdx) >= 0) then
      edUndVnd.ItemIndex := edUndVnd.Items.IndexOf(uvndIdx)
    else
      edUndVnd.ItemIndex := 0;

    undVenda := (edUndVnd.Items.Objects[edUndVnd.ItemIndex] as TUnidadeVenda_Model);

    if (CadNf.vItem.vrDadosItem.stado = dsInsert) and (undVenda.unid_princ <> undVenda.unid_vnd) then
      edUndVnd.Tag := edUndVnd.Items.IndexOf(undVenda.unid_princ)
    else
      edUndVnd.Tag := edUndVnd.ItemIndex;

    edUndVndChange(edUndVnd);
  end;
end;

procedure TfrmCadNF.tsnf_ResumoNotaExit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> nil) and (ActiveControl <> btSalvarItemProdServDetalhado) and (ActiveControl <> btCancelarItemProdServDetalhado) then
    if ActiveControl.Parent <> TWinControl(Sender).Parent then
      if pos('TSMERC_', UpperCase(ActiveControl.Name)) = 0 then
      begin
        while True do
        begin
          if pgControlItensNFe.ActivePageIndex = pgControlItensNFe.PageCount - 1  then
            pgControlItensNFe.ActivePageIndex := 0
          else
            pgControlItensNFe.ActivePageIndex := pgControlItensNFe.ActivePageIndex + 1;
          if pgControlItensNFe.ActivePage.TabVisible then
            Break;
        end;
        THackWinControl(pgControlItensNFe.ActivePage).SelectFirst;
      end;
end;

procedure TfrmCadNF.ValidarCabealho1Click(Sender: TObject);
begin
  inherited;
  if not CadNf.validaCabecalho then
  begin
    pgContDadosNF.ActivePage := tsDadosNF;
    setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro);
  end;
end;

procedure TfrmCadNF.ValidarRodap1Click(Sender: TObject);
begin
  inherited;
  if not CadNf.validaRodape then
    if not setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro) then
      if (Self.Enabled) and (Self.Visible) and (edtvalor_desc2.CanFocus) then      
        edtvalor_desc2.SetFocus;
end;

procedure TfrmCadNF.ValidarTransportes1Click(Sender: TObject);
begin
  inherited;
  if not CadNf.validaTransporte then
    if not setFocusCampoErro(CadNf.vNomeCampoErro, CadNf.vMensagemErro) then
    	if (Self.Enabled) and (Self.Visible) and (DBEdit12.CanFocus) then
      	DBEdit12.SetFocus;
end;

procedure TfrmCadNF.Verificaritenscomconversoexistente1Click(Sender: TObject);
begin
  inherited;
  CadNf.vItem.VerificarItensComConversaoPendente;
end;

function TfrmCadNF.VerificarNotasPendentesCancelamento: Boolean;
var
  count: Integer;
  data: TDateTime;
begin
  Result := False;
  data := 0;
  TryStrToDate(regGetConfStr('LastShowPendInut'), data);

  if data < Date  then
  begin
    count := CadNf.SqlOpen('select count(nf.cod_nf) cont from notafiscal nf' +
                           ' where nf.situacao_nfe in (''Cancelada'', ''Inutilizada'', ''Denegada'') and nf.status <> ''Cancelada'' and nf.cod_empresa = %d' +
                           ' and nf.emissao_propria = ''S'' and iif(nf.natureza_nf = ''S'', ''S'', nf.num_gerado) = ''S''',
                           [vDadosIni.cod_empresa]).FieldByName('cont').AsInteger;

    if count > 0 then
    begin
      Result := True;
      if ShowConfirmacao('O sistema localizou %d %s de cancelamento. Deseja visualizar para efetuar o cancelamento?',
                         [count, IfThen(count = 1, 'nota pendente', 'notas pendentes')]) = ID_YES then
        nf_outras_options_notas_pend_canc(nil);
    end;

    regSetConfStr('LastShowPendInut', DateToStr(Date));
  end;
end;

function TfrmCadNF.VerificarNotasPendentesSefaz: Boolean;
var
  count: Integer;
  data: TDateTime;
begin
  Result := False;
  data := 0;
  TryStrToDate(regGetConfStr('LastShowPendSefaz'), data);

  if data < Date  then
  begin
    count := Container.GetInstance().ErpFeaturesFactory.CreateObterQuantidadePendenciasSefazUseCase().Executar();

    if count > 0 then
    begin
      Result := True;
      if ShowConfirmacao('O sistema localizou %d %s de resolução com a SEFAZ. Deseja visualizar para resolução?',
                         [count, IfThen(count = 1, 'nota pendente', 'notas pendentes')]) = ID_YES then
        nf_outras_options_notas_pend_sefaz(nil);
    end;

    regSetConfStr('LastShowPendSefaz', DateToStr(Date));
  end;
end;

procedure TfrmCadNF.VisualConfigurarOperacaoInterna(SetVisivel: Boolean);
begin
  if SetVisivel then
  begin
    lbidLocalDestOperacao.Visible := False;
    lkIdDest.Visible := False;
    lbOpInterna.Top := 88;
    lbOpInterna.Left := 410;
    lbOpInterna.Visible := True;
    edPickerOpInterna.Top := 85;
    edPickerOpInterna.Left := 502;
    edPickerOpInterna.Visible := True;
    edPickerOpInterna.OnEntitySelected := EventChangeEntitiesSelects;
    edPickerOpInterna.OnEntityAdd := EventAddEntitiesSelects;
    with Container.GetInstance().ErpFeaturesFactory.CreateListarAtualeTodasOperacoesInternasUseCase() do
    try
      edPickerOpInterna.LoadEntities( Executar(CadNf.fstr('op_interna_id')), True );
    finally
      FreeSafe();
    end;
    FrameIbsCbs1.CalculoCallBack := FrameIbsCbsCalculoCallBack;
  end
  else
  begin
    lbidLocalDestOperacao.Visible := True;
    lkIdDest.Visible := True;
    edPickerOpInterna.Visible := False;
    lbOpInterna.Visible := False;
  end;
  btNotaRetorno.Left := IfThen(edPickerOpInterna.Visible, 381, 421 );  
  DBEdit11.Width := btNotaRetorno.Left - DBEdit11.Left - 6{margens};
end;

procedure TfrmCadNF.VisualItemTributosRtcIgnorar;
begin
  tsMerc_IS.TabVisible := False; //YesNoEnum(CadNf.fint('dfe_trib_ignorar')) = ynNo;
  tsMerc_IBSCBS.TabVisible := YesNoEnum(CadNf.fint('dfe_trib_ignorar')) = ynNo;
  tsVeic_IBSCBS.TabVisible := YesNoEnum(CadNf.fint('dfe_trib_ignorar')) = ynNo;
  tsDesp_IBSCBS.TabVisible := YesNoEnum(CadNf.fint('dfe_trib_ignorar')) = ynNo;
end;

procedure TfrmCadNF.ItensAreaDeTransferenciaMenuVisualizar1Click(Sender: TObject);
begin
  inherited;

  if not CadNf.Auditor.Visualizar.Processo('NF0244').Permitido then
    Exit;

  Application.CreateForm(TfrmCadNFCopiador, frmCadNFCopiador);
  frmCadNFCopiador.Nota := CadNf;
  frmCadNFCopiador.OnlyShowClipBoard;
  frmCadNFCopiador.tabNota.Visible := False;
  frmCadNFCopiador.ShowModal;
end;

initialization
  RegisterClass(TfrmCadNF);
finalization
  UnRegisterClass(TfrmCadNF);

end.
