unit UcadEmpresa;

interface

uses
  Windows, UClassesCadastrosBasicos, uCadPadraoModal, Dialogs, DB, QRCtrls,
  grimgctrl, QuickRpt, StdCtrls, DBCtrls, ExtCtrls, Menus, ComCtrls, Buttons,
  Grids, DBGrids, Controls, Mask, Forms, Classes, comobj, AppEvnts, Graphics, uEditHw,
  uEditMoeda;

type
  TfrmCadEmpresa = class(TfrmCadPadraoM)
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label13: TLabel;
    DBEdit7: TDBEdit;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    Label15: TLabel;
    DBEdit9: TDBEdit;
    Label16: TLabel;
    DBEdit10: TDBEdit;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    Label18: TLabel;
    DBEdit12: TDBEdit;
    Label19: TLabel;
    DBEdit13: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit15: TDBEdit;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label22: TLabel;
    DBEdit16: TDBEdit;
    Label23: TLabel;
    DBEdit17: TDBEdit;
    Label24: TLabel;
    DBEdit18: TDBEdit;
    Label25: TLabel;
    DBEdit19: TDBEdit;
    Label26: TLabel;
    DBEdit20: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label27: TLabel;
    GroupBox6: TGroupBox;
    Label28: TLabel;
    DBEdit21: TDBEdit;
    Label29: TLabel;
    DBEdit22: TDBEdit;
    Label30: TLabel;
    DBEdit23: TDBEdit;
    Label31: TLabel;
    DBEdit24: TDBEdit;
    Label32: TLabel;
    DBEdit25: TDBEdit;
    GroupBox7: TGroupBox;
    Label33: TLabel;
    DBEdit26: TDBEdit;
    Label34: TLabel;
    DBEdit27: TDBEdit;
    Label35: TLabel;
    DBEdit28: TDBEdit;
    Label36: TLabel;
    DBEdit29: TDBEdit;
    Label37: TLabel;
    DBEdit30: TDBEdit;
    GroupBox8: TGroupBox;
    Label38: TLabel;
    DBEdit31: TDBEdit;
    Label39: TLabel;
    DBEdit32: TDBEdit;
    Label40: TLabel;
    DBEdit33: TDBEdit;
    Label41: TLabel;
    DBEdit34: TDBEdit;
    Label42: TLabel;
    DBEdit35: TDBEdit;
    Label43: TLabel;
    DBEdit36: TDBEdit;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    GroupBox9: TGroupBox;
    Label44: TLabel;
    DBComboBox2: TDBComboBox;
    Label46: TLabel;
    DBComboBox4: TDBComboBox;
    Label47: TLabel;
    DBEdit37: TDBEdit;
    Label48: TLabel;
    DBComboBox5: TDBComboBox;
    Label49: TLabel;
    DBComboBox6: TDBComboBox;
    Label50: TLabel;
    DBComboBox7: TDBComboBox;
    Label51: TLabel;
    DBComboBox8: TDBComboBox;
    Label52: TLabel;
    DBMemo1: TDBMemo;
    Label53: TLabel;
    DBEdit38: TDBEdit;
    Label54: TLabel;
    DBComboBox9: TDBComboBox;
    Label55: TLabel;
    DBComboBox10: TDBComboBox;
    Label56: TLabel;
    DBEdit39: TDBEdit;
    Label57: TLabel;
    DBEdit40: TDBEdit;
    Label58: TLabel;
    DBComboBox11: TDBComboBox;
    Label59: TLabel;
    DBComboBox12: TDBComboBox;
    Label60: TLabel;
    DBComboBox13: TDBComboBox;
    Label61: TLabel;
    DBComboBox14: TDBComboBox;
    Label62: TLabel;
    DBComboBox15: TDBComboBox;
    Label64: TLabel;
    DBComboBox16: TDBComboBox;
    GroupBox10: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label65: TLabel;
    Label66: TLabel;
    DBEdit42: TDBEdit;
    Label67: TLabel;
    DBEdit43: TDBEdit;
    Label68: TLabel;
    DBComboBox17: TDBComboBox;
    Label69: TLabel;
    DBEdit44: TDBEdit;
    Label70: TLabel;
    DBComboBox18: TDBComboBox;
    Label71: TLabel;
    DBEdit45: TDBEdit;
    Label72: TLabel;
    DBEdit46: TDBEdit;
    Label73: TLabel;
    DBEdit47: TDBEdit;
    Label74: TLabel;
    DBEdit48: TDBEdit;
    OpenDialog1: TOpenDialog;
    TabSheet6: TTabSheet;
    GroupBox14: TGroupBox;
    Label105: TLabel;
    DBComboBox27: TDBComboBox;
    Label106: TLabel;
    DBComboBox28: TDBComboBox;
    Label107: TLabel;
    DBComboBox29: TDBComboBox;
    Label108: TLabel;
    DBEdit71: TDBEdit;
    Label109: TLabel;
    DBEdit72: TDBEdit;
    Label110: TLabel;
    DBMemo2: TDBMemo;
    Label111: TLabel;
    DBComboBox30: TDBComboBox;
    Label112: TLabel;
    DBMemo3: TDBMemo;
    Label113: TLabel;
    DBComboBox31: TDBComboBox;
    Label114: TLabel;
    DBComboBox32: TDBComboBox;
    Label115: TLabel;
    DBEdit73: TDBEdit;
    Label116: TLabel;
    Label117: TLabel;
    TabSheet7: TTabSheet;
    GroupBox15: TGroupBox;
    Label118: TLabel;
    DBEdit74: TDBEdit;
    Label119: TLabel;
    DBEdit75: TDBEdit;
    Label120: TLabel;
    DBEdit76: TDBEdit;
    Label121: TLabel;
    DBEdit77: TDBEdit;
    Label122: TLabel;
    DBEdit78: TDBEdit;
    Label123: TLabel;
    DBEdit79: TDBEdit;
    Label124: TLabel;
    DBEdit80: TDBEdit;
    Label125: TLabel;
    DBEdit81: TDBEdit;
    Label126: TLabel;
    DBEdit82: TDBEdit;
    Label127: TLabel;
    DBEdit83: TDBEdit;
    Label128: TLabel;
    DBEdit84: TDBEdit;
    Label129: TLabel;
    DBEdit85: TDBEdit;
    GroupBox16: TGroupBox;
    Label130: TLabel;
    DBEdit86: TDBEdit;
    Label131: TLabel;
    DBEdit87: TDBEdit;
    Label132: TLabel;
    DBEdit88: TDBEdit;
    Label133: TLabel;
    DBEdit89: TDBEdit;
    Label134: TLabel;
    DBEdit90: TDBEdit;
    Label135: TLabel;
    DBEdit91: TDBEdit;
    Label136: TLabel;
    DBEdit92: TDBEdit;
    Label137: TLabel;
    DBEdit93: TDBEdit;
    Label138: TLabel;
    DBEdit94: TDBEdit;
    GroupBox17: TGroupBox;
    DBGrid2: TDBGrid;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    TabSheet8: TTabSheet;
    Label166: TLabel;
    DBEdit113: TDBEdit;
    Panel4: TPanel;
    Label167: TLabel;
    DBEdit114: TDBEdit;
    Label168: TLabel;
    DBEdit115: TDBEdit;
    Label169: TLabel;
    DBEdit116: TDBEdit;
    TabSheet12: TTabSheet;
    GroupBox18: TGroupBox;
    Label177: TLabel;
    DBEdit122: TDBEdit;
    Label178: TLabel;
    DBEdit123: TDBEdit;
    Label179: TLabel;
    DBEdit124: TDBEdit;
    Label180: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    Label181: TLabel;
    DBEdit125: TDBEdit;
    Label182: TLabel;
    DBEdit126: TDBEdit;
    GroupBox19: TGroupBox;
    DBEdit118: TDBEdit;
    Label172: TLabel;
    DBComboBox41: TDBComboBox;
    Label173: TLabel;
    Label176: TLabel;
    DBEdit121: TDBEdit;
    DBEdit117: TDBEdit;
    Label170: TLabel;
    Label183: TLabel;
    Label184: TLabel;
    DBComboBox42: TDBComboBox;
    DBComboBox43: TDBComboBox;
    TabSheet13: TTabSheet;
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRSysData1: TQRSysData;
    QRLabel17: TQRLabel;
    Label187: TLabel;
    DBComboBox40: TDBComboBox;
    DBEdit129: TDBEdit;
    DBEdit134: TDBEdit;
    Label171: TLabel;
    DBEdit130: TDBEdit;
    Label188: TLabel;
    DBEdit132: TDBEdit;
    tsSubstitutoTributario: TTabSheet;
    pnSubstitutoTributario: TPanel;
    pnSTCadastro: TPanel;
    Label310: TLabel;
    Label311: TLabel;
    DBEdit150: TDBEdit;
    DBComboBox44: TDBComboBox;
    Panel55: TPanel;
    btSalvarST: TBitBtn;
    btCancelarST: TBitBtn;
    pnSTConsulta: TPanel;
    GroupBox45: TGroupBox;
    DBGrid17: TDBGrid;
    Panel56: TPanel;
    SpeedButton22: TSpeedButton;
    btNovoST: TBitBtn;
    btAlterarST: TBitBtn;
    btRemoverST: TBitBtn;
    pnNfe: TPanel;
    pgControlNF: TPageControl;
    TabSheet9: TTabSheet;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    DBEdit95: TDBEdit;
    DBEdit96: TDBEdit;
    DBEdit97: TDBEdit;
    DBEdit98: TDBEdit;
    DBEdit99: TDBEdit;
    TabSheet10: TTabSheet;
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
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    DBEdit100: TDBEdit;
    DBEdit101: TDBEdit;
    DBComboBox33: TDBComboBox;
    DBComboBox34: TDBComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBComboBox35: TDBComboBox;
    DBComboBox36: TDBComboBox;
    DBEdit102: TDBEdit;
    DBEdit103: TDBEdit;
    DBEdit104: TDBEdit;
    DBEdit105: TDBEdit;
    DBEdit106: TDBEdit;
    DBComboBox37: TDBComboBox;
    TabSheet11: TTabSheet;
    Label159: TLabel;
    Label160: TLabel;
    Label161: TLabel;
    Label162: TLabel;
    Label163: TLabel;
    Label164: TLabel;
    Label165: TLabel;
    Label185: TLabel;
    Label186: TLabel;
    DBComboBox38: TDBComboBox;
    DBEdit109: TDBEdit;
    DBEdit110: TDBEdit;
    DBEdit111: TDBEdit;
    DBComboBox39: TDBComboBox;
    DBEdit112: TDBEdit;
    DBMemo4: TDBMemo;
    DBEdit127: TDBEdit;
    DBEdit128: TDBEdit;
    GroupBox21: TGroupBox;
    Label190: TLabel;
    DBEdit135: TDBEdit;
    Label192: TLabel;
    DBEdit136: TDBEdit;
    DBEdit137: TDBEdit;
    Label193: TLabel;
    Label194: TLabel;
    DBEdit138: TDBEdit;
    Label197: TLabel;
    Label198: TLabel;
    DBEdit141: TDBEdit;
    Label199: TLabel;
    DBEdit142: TDBEdit;
    Label200: TLabel;
    DBEdit143: TDBEdit;
    Label201: TLabel;
    DBEdit144: TDBEdit;
    DBComboBox46: TDBComboBox;
    Label203: TLabel;
    DBComboBox48: TDBComboBox;
    Label204: TLabel;
    DBComboBox49: TDBComboBox;
    Label205: TLabel;
    DBEdit140: TDBEdit;
    DBComboBox50: TDBComboBox;
    Label206: TLabel;
    TabSheet14: TTabSheet;
    Label207: TLabel;
    DBEdit145: TDBEdit;
    Label208: TLabel;
    Label209: TLabel;
    Label210: TLabel;
    DBEdit146: TDBEdit;
    Label212: TLabel;
    DBEdit147: TDBEdit;
    Label213: TLabel;
    Label214: TLabel;
    DBEdit148: TDBEdit;
    Label215: TLabel;
    Label216: TLabel;
    DBEdit149: TDBEdit;
    BitBtn13: TBitBtn;
    Label217: TLabel;
    DBEdit151: TDBEdit;
    Label218: TLabel;
    Label219: TLabel;
    DBEdit152: TDBEdit;
    Label220: TLabel;
    DBEdit153: TDBEdit;
    Label221: TLabel;
    DBEdit154: TDBEdit;
    Label222: TLabel;
    DBEdit155: TDBEdit;
    Label157: TLabel;
    DBEdit107: TDBEdit;
    DBEdit108: TDBEdit;
    Label158: TLabel;
    Label223: TLabel;
    DBEdit156: TDBEdit;
    Label224: TLabel;
    Label225: TLabel;
    DBEdit158: TDBEdit;
    DBComboBox51: TDBComboBox;
    Label226: TLabel;
    DBEdit157: TDBEdit;
    Label227: TLabel;
    DBEdit159: TDBEdit;
    tsSped: TTabSheet;
    DBRadioGroup2: TDBRadioGroup;
    Label189: TLabel;
    Label191: TLabel;
    DBEdit131: TDBEdit;
    DBEdit133: TDBEdit;
    BitBtn12: TBitBtn;
    Label95: TLabel;
    Label96: TLabel;
    DBEdit61: TDBEdit;
    DBEdit62: TDBEdit;
    Label231: TLabel;
    DBEdit160: TDBEdit;
    PageControl2: TPageControl;
    TabSheet15: TTabSheet;
    TabSheet16: TTabSheet;
    TabSheet17: TTabSheet;
    GroupBox13: TGroupBox;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label196: TLabel;
    DBEdit67: TDBEdit;
    DBEdit68: TDBEdit;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    DBEdit139: TDBEdit;
    GroupBox12: TGroupBox;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit65: TDBEdit;
    DBEdit66: TDBEdit;
    TabSheet18: TTabSheet;
    Label75: TLabel;
    Label76: TLabel;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    BitBtn7: TBitBtn;
    TabSheet19: TTabSheet;
    Label195: TLabel;
    Label202: TLabel;
    Label233: TLabel;
    Label232: TLabel;
    DBComboBox45: TDBComboBox;
    DBComboBox47: TDBComboBox;
    DBComboBox55: TDBComboBox;
    DBComboBox56: TDBComboBox;
    DBComboBox58: TDBComboBox;
    Label236: TLabel;
    TabSheet20: TTabSheet;
    tsContasAReceber: TTabSheet;
    Panel5: TPanel;
    Label259: TLabel;
    DBComboBox64: TDBComboBox;
    Label175: TLabel;
    Label174: TLabel;
    DBEdit120: TDBEdit;
    DBEdit119: TDBEdit;
    Label260: TLabel;
    DBComboBox65: TDBComboBox;
    DBEdit177: TDBEdit;
    Label261: TLabel;
    Label263: TLabel;
    DBEdit179: TDBEdit;
    Label264: TLabel;
    DBEdit180: TDBEdit;
    Label265: TLabel;
    DBEdit181: TDBEdit;
    Label266: TLabel;
    DBEdit182: TDBEdit;
    Label267: TLabel;
    Label268: TLabel;
    DBEdit183: TDBEdit;
    DBEdit184: TDBEdit;
    tsContasAPagar: TTabSheet;
    Panel6: TPanel;
    Label269: TLabel;
    DBComboBox66: TDBComboBox;
    PageControl5: TPageControl;
    TabSheet25: TTabSheet;
    TabSheet26: TTabSheet;
    GroupBox20: TGroupBox;
    Label239: TLabel;
    Label240: TLabel;
    GroupBox23: TGroupBox;
    Label241: TLabel;
    Label242: TLabel;
    Label243: TLabel;
    Label244: TLabel;
    Label245: TLabel;
    Label246: TLabel;
    Label247: TLabel;
    Label248: TLabel;
    Label249: TLabel;
    Label250: TLabel;
    Label251: TLabel;
    Label252: TLabel;
    Label253: TLabel;
    Label254: TLabel;
    Label255: TLabel;
    Label256: TLabel;
    Label262: TLabel;
    DBEdit161: TDBEdit;
    DBEdit162: TDBEdit;
    DBEdit163: TDBEdit;
    DBEdit164: TDBEdit;
    DBEdit165: TDBEdit;
    DBEdit166: TDBEdit;
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
    DBEdit178: TDBEdit;
    GroupBox24: TGroupBox;
    Label271: TLabel;
    DBEdit185: TDBEdit;
    Label272: TLabel;
    DBEdit186: TDBEdit;
    Label273: TLabel;
    Label274: TLabel;
    DBEdit187: TDBEdit;
    DBEdit188: TDBEdit;
    Label275: TLabel;
    DBComboBox67: TDBComboBox;
    DBEdit189: TDBEdit;
    Label276: TLabel;
    Label277: TLabel;
    DBEdit190: TDBEdit;
    TabSheet27: TTabSheet;
    Label279: TLabel;
    DBComboBox69: TDBComboBox;
    Label280: TLabel;
    DBComboBox70: TDBComboBox;
    Label282: TLabel;
    DBComboBox71: TDBComboBox;
    TabSheet28: TTabSheet;
    Panel7: TPanel;
    Label281: TLabel;
    Label283: TLabel;
    Label284: TLabel;
    Label285: TLabel;
    DBComboBox72: TDBComboBox;
    DBComboBox73: TDBComboBox;
    DBComboBox74: TDBComboBox;
    DBComboBox75: TDBComboBox;
    Label286: TLabel;
    DBComboBox76: TDBComboBox;
    Label290: TLabel;
    Label291: TLabel;
    DBEdit192: TDBEdit;
    Label292: TLabel;
    DBEdit193: TDBEdit;
    DBComboBox80: TDBComboBox;
    GroupBox25: TGroupBox;
    Label295: TLabel;
    DBEdit191: TDBEdit;
    Label296: TLabel;
    DBEdit194: TDBEdit;
    Label297: TLabel;
    DBEdit195: TDBEdit;
    Label298: TLabel;
    DBEdit196: TDBEdit;
    Label299: TLabel;
    DBEdit197: TDBEdit;
    Label300: TLabel;
    DBEdit198: TDBEdit;
    Label301: TLabel;
    DBEdit199: TDBEdit;
    Label302: TLabel;
    DBMemo5: TDBMemo;
    Label303: TLabel;
    RichEdit1: TRichEdit;
    GroupBox26: TGroupBox;
    Label307: TLabel;
    DBEdit200: TDBEdit;
    Label306: TLabel;
    DBComboBox84: TDBComboBox;
    Label308: TLabel;
    DBComboBox85: TDBComboBox;
    TabSheet29: TTabSheet;
    Panel8: TPanel;
    Label309: TLabel;
    DBComboBox86: TDBComboBox;
    Label312: TLabel;
    DBComboBox87: TDBComboBox;
    GroupBox27: TGroupBox;
    Label313: TLabel;
    Label314: TLabel;
    Label315: TLabel;
    Label316: TLabel;
    GroupBox28: TGroupBox;
    Label317: TLabel;
    Label318: TLabel;
    Label319: TLabel;
    Label320: TLabel;
    MaskEdit11: TMaskEdit;
    GroupBox29: TGroupBox;
    Label321: TLabel;
    Label322: TLabel;
    Label323: TLabel;
    Label324: TLabel;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    MaskEdit13: TMaskEdit;
    MaskEdit14: TMaskEdit;
    MaskEdit15: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    Label325: TLabel;
    DBEdit201: TDBEdit;
    Label327: TLabel;
    DBComboBox88: TDBComboBox;
    Label326: TLabel;
    Label328: TLabel;
    Label329: TLabel;
    Label330: TLabel;
    Label331: TLabel;
    Label332: TLabel;
    Label333: TLabel;
    Label334: TLabel;
    Label335: TLabel;
    Label336: TLabel;
    Label337: TLabel;
    Label338: TLabel;
    Label339: TLabel;
    DBComboBox89: TDBComboBox;
    Label340: TLabel;
    DBEdit202: TDBEdit;
    Label341: TLabel;
    Label342: TLabel;
    DBComboBox91: TDBComboBox;
    DBComboBox90: TDBComboBox;
    TabSheet30: TTabSheet;
    Panel9: TPanel;
    Label305: TLabel;
    DBComboBox83: TDBComboBox;
    Label343: TLabel;
    Label344: TLabel;
    DBComboBox92: TDBComboBox;
    DBComboBox93: TDBComboBox;
    DBComboBox94: TDBComboBox;
    Label345: TLabel;
    Label347: TLabel;
    DBComboBox96: TDBComboBox;
    PageControl6: TPageControl;
    TabSheet31: TTabSheet;
    TabSheet32: TTabSheet;
    GroupBox22: TGroupBox;
    Label228: TLabel;
    Label229: TLabel;
    Label230: TLabel;
    DBComboBox52: TDBComboBox;
    DBComboBox53: TDBComboBox;
    DBComboBox54: TDBComboBox;
    PageControl4: TPageControl;
    TabSheet21: TTabSheet;
    DBRadioGroup3: TDBRadioGroup;
    TabSheet22: TTabSheet;
    DBRadioGroup4: TDBRadioGroup;
    TabSheet23: TTabSheet;
    DBRadioGroup5: TDBRadioGroup;
    TabSheet24: TTabSheet;
    Label270: TLabel;
    DBRadioGroup6: TDBRadioGroup;
    DBComboBox98: TDBComboBox;
    Label349: TLabel;
    Label350: TLabel;
    DBComboBox99: TDBComboBox;
    GroupBox30: TGroupBox;
    Label348: TLabel;
    DBComboBox97: TDBComboBox;
    DBRadioGroup7: TDBRadioGroup;
    Label351: TLabel;
    DBEdit203: TDBEdit;
    Label352: TLabel;
    DBEdit204: TDBEdit;
    Label353: TLabel;
    DBEdit205: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label354: TLabel;
    DBEdit206: TDBEdit;
    Label355: TLabel;
    DBEdit207: TDBEdit;
    PageControl7: TPageControl;
    TabSheet34: TTabSheet;
    GroupBox11: TGroupBox;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label234: TLabel;
    Label_QuitarBoleto: TLabel;
    Label235: TLabel;
    Label237: TLabel;
    Label238: TLabel;
    Label257: TLabel;
    Label258: TLabel;
    Label278: TLabel;
    Label293: TLabel;
    SpeedButton10: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Label304: TLabel;
    Label346: TLabel;
    Label356: TLabel;
    DBComboBox19: TDBComboBox;
    DBComboBox20: TDBComboBox;
    DBComboBox21: TDBComboBox;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    DBComboBox22: TDBComboBox;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    DBComboBox23: TDBComboBox;
    DBComboBox24: TDBComboBox;
    DBComboBox25: TDBComboBox;
    DBComboBox26: TDBComboBox;
    DBComboBox57: TDBComboBox;
    DBComboBox_QuitarBoleto: TDBComboBox;
    DBComboBox59: TDBComboBox;
    DBComboBox60: TDBComboBox;
    DBComboBox61: TDBComboBox;
    DBComboBox62: TDBComboBox;
    DBComboBox63: TDBComboBox;
    DBComboBox68: TDBComboBox;
    ListBox1: TListBox;
    DBComboBox82: TDBComboBox;
    DBComboBox95: TDBComboBox;
    DBComboBox100: TDBComboBox;
    TabSheet35: TTabSheet;
    Panel10: TPanel;
    Label287: TLabel;
    Label288: TLabel;
    Label289: TLabel;
    Label294: TLabel;
    DBComboBox77: TDBComboBox;
    DBComboBox78: TDBComboBox;
    DBComboBox79: TDBComboBox;
    DBComboBox81: TDBComboBox;
    Label358: TLabel;
    DBComboBox101: TDBComboBox;
    Label359: TLabel;
    DBComboBox102: TDBComboBox;
    Label360: TLabel;
    DBComboBox103: TDBComboBox;
    Label361: TLabel;
    Label362: TLabel;
    DBComboBox105: TDBComboBox;
    DBEdit209: TDBEdit;
    DBComboBox104: TDBComboBox;
    Label363: TLabel;
    Label364: TLabel;
    DBEdit210: TDBEdit;
    Label365: TLabel;
    DBComboBox106: TDBComboBox;
    Label366: TLabel;
    DBComboBox107: TDBComboBox;
    Label367: TLabel;
    DBEdit211: TDBEdit;
    Label368: TLabel;
    DBEdit212: TDBEdit;
    Label369: TLabel;
    DBComboBox108: TDBComboBox;
    TabSheet33: TTabSheet;
    Panel11: TPanel;
    Label370: TLabel;
    DBEdit213: TDBEdit;
    Label371: TLabel;
    Label372: TLabel;
    DBComboBox109: TDBComboBox;
    DBComboBox110: TDBComboBox;
    Label373: TLabel;
    DBComboBox111: TDBComboBox;
    TabSheet36: TTabSheet;
    Label374: TLabel;
    DBComboBox112: TDBComboBox;
    Label375: TLabel;
    DBComboBox113: TDBComboBox;
    Label211: TLabel;
    Label376: TLabel;
    GroupBox31: TGroupBox;
    Label377: TLabel;
    Label378: TLabel;
    DBEdit214: TDBEdit;
    DBMemo6: TDBMemo;
    Label379: TLabel;
    DBEdit215: TDBEdit;
    BitBtn14: TBitBtn;
    Label380: TLabel;
    DBEdit216: TDBEdit;
    DBComboBox114: TDBComboBox;
    Label381: TLabel;
    Label382: TLabel;
    DBComboBox115: TDBComboBox;
    Label383: TLabel;
    DBEdit217: TDBEdit;
    tsCadastrosAcess: TTabSheet;
    Panel16: TPanel;
    GroupBox32: TGroupBox;
    DBGrid4: TDBGrid;
    GroupBox33: TGroupBox;
    DBGrid5: TDBGrid;
    Panel12: TPanel;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    pnCadastroAcesso: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    Label384: TLabel;
    DBRadioGroup8: TDBRadioGroup;
    DBRadioGroup9: TDBRadioGroup;
    DBRadioGroup10: TDBRadioGroup;
    Label385: TLabel;
    DBEdit218: TDBEdit;
    TabSheet37: TTabSheet;
    Panel13: TPanel;
    Label390: TLabel;
    DBComboBox119: TDBComboBox;
    GroupBox34: TGroupBox;
    Panel17: TPanel;
    Label393: TLabel;
    SpeedButton13: TSpeedButton;
    Label394: TLabel;
    Label395: TLabel;
    edCFOPPreNotas: TEditHw;
    SpeedButton14: TSpeedButton;
    pnSelEmpresa: TPanel;
    Panel19: TPanel;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    Label388: TLabel;
    Label389: TLabel;
    ListBox2: TListBox;
    ListBox3: TListBox;
    Label391: TLabel;
    Label392: TLabel;
    Label396: TLabel;
    DBComboBox120: TDBComboBox;
    TabSheet38: TTabSheet;
    Panel18: TPanel;
    Label397: TLabel;
    DBComboBox121: TDBComboBox;
    Label398: TLabel;
    Label399: TLabel;
    DBEdit219: TDBEdit;
    DBEdit220: TDBEdit;
    Label400: TLabel;
    DBEdit221: TDBEdit;
    DBComboBox122: TDBComboBox;
    Label401: TLabel;
    DBComboBox123: TDBComboBox;
    Label402: TLabel;
    Label403: TLabel;
    DBComboBox124: TDBComboBox;
    TabSheet39: TTabSheet;
    Panel20: TPanel;
    Label404: TLabel;
    Label405: TLabel;
    Label406: TLabel;
    Label407: TLabel;
    Label408: TLabel;
    Label409: TLabel;
    Label410: TLabel;
    Label411: TLabel;
    DBComboBox125: TDBComboBox;
    DBComboBox126: TDBComboBox;
    DBComboBox127: TDBComboBox;
    DBComboBox128: TDBComboBox;
    DBComboBox129: TDBComboBox;
    DBComboBox130: TDBComboBox;
    DBComboBox131: TDBComboBox;
    DBEdit222: TDBEdit;
    DBEdit223: TDBEdit;
    Label412: TLabel;
    Label357: TLabel;
    DBEdit208: TDBEdit;
    TabSheet40: TTabSheet;
    Panel21: TPanel;
    DBComboBox132: TDBComboBox;
    Label413: TLabel;
    Label414: TLabel;
    DBEdit224: TDBEdit;
    Label415: TLabel;
    DBEdit225: TDBEdit;
    Label416: TLabel;
    DBEdit226: TDBEdit;
    Label417: TLabel;
    DBComboBox133: TDBComboBox;
    Label419: TLabel;
    DBEdit227: TDBEdit;
    Label420: TLabel;
    DBComboBox135: TDBComboBox;
    Label421: TLabel;
    DBComboBox136: TDBComboBox;
    TabSheet41: TTabSheet;
    Panel22: TPanel;
    Label422: TLabel;
    Label418: TLabel;
    ComboBoxCtrPlano: TComboBox;
    BtAddCtrPlano: TBitBtn;
    BtDelCtrPlano: TBitBtn;
    lbCtrPlano: TLabel;
    DBComboBox134: TDBComboBox;
    DBComboBox137: TDBComboBox;
    DBComboBox138: TDBComboBox;
    Label424: TLabel;
    DBEdit228: TDBEdit;
    DBEdit229: TDBEdit;
    Label423: TLabel;
    Label425: TLabel;
    Label426: TLabel;
    DBComboBox139: TDBComboBox;
    Label427: TLabel;
    DBComboBox140: TDBComboBox;
    Label428: TLabel;
    DBEdit230: TDBEdit;
    Label429: TLabel;
    DBEdit231: TDBEdit;
    DBEdit232: TDBEdit;
    Label430: TLabel;
    DBEdit233: TDBEdit;
    Label431: TLabel;
    Label432: TLabel;
    DBEdit234: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    Label433: TLabel;
    DBComboBox116: TDBComboBox;
    Label434: TLabel;
    DBEdit235: TDBEdit;
    Label435: TLabel;
    DBEdit236: TDBEdit;
    Label436: TLabel;
    DBComboBox141: TDBComboBox;
    Label437: TLabel;
    DBComboBox143: TDBComboBox;
    DBLookupComboBox7: TDBLookupComboBox;
    DBEdit237: TDBEdit;
    Label438: TLabel;
    Label439: TLabel;
    DBEdit241: TDBEdit;
    Label444: TLabel;
    DBComboBox144: TDBComboBox;
    Label440: TLabel;
    DBEdit56: TDBEdit;
    Label86: TLabel;
    Label87: TLabel;
    DBEdit57: TDBEdit;
    gbConferenciaCega: TGroupBox;
    DBComboBox145: TDBComboBox;
    Label441: TLabel;
    DBComboBox118: TDBComboBox;
    Label387: TLabel;
    Label386: TLabel;
    DBComboBox117: TDBComboBox;
    Label442: TLabel;
    DBComboBox146: TDBComboBox;
    DBComboBox147: TDBComboBox;
    Label443: TLabel;
    Label445: TLabel;
    DBComboBox148: TDBComboBox;
    Label446: TLabel;
    DBComboBox149: TDBComboBox;
    tsDebCred: TTabSheet;
    GroupBox35: TGroupBox;
    Label449: TLabel;
    Label450: TLabel;
    Label451: TLabel;
    DBComboBox152: TDBComboBox;
    DBComboBox153: TDBComboBox;
    DBEdit239: TDBEdit;
    Label447: TLabel;
    DBComboBox150: TDBComboBox;
    groupAutXML: TGroupBox;
    spBtAutXMLAdicionar: TSpeedButton;
    spBtAutXMLRemover: TSpeedButton;
    lbxAutXML: TListBox;
    DBEdit41: TDBEdit;
    Label63: TLabel;
    Label45: TLabel;
    DBComboBox3: TDBComboBox;
    DBOrdemExibicao: TDBMemo;
    lbOrdemExibicao: TLabel;
    lbReordenarFila: TLabel;
    DBReordenarFIla: TDBComboBox;
    DBEdit238: TDBEdit;
    Label448: TLabel;
    Label452: TLabel;
    DBEdit240: TDBEdit;
    Label453: TLabel;
    DBEdit242: TDBEdit;
    Label454: TLabel;
    DBComboBox151: TDBComboBox;
    Label455: TLabel;
    DBComboBox154: TDBComboBox;
    ListBoxCtrPlano: TListBox;
    tsReplicacaoInterna: TTabSheet;
    pnReplicacaoInterna: TPanel;
    Panel24: TPanel;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    GroupBox36: TGroupBox;
    DBGrid3: TDBGrid;
    Panel23: TPanel;
    Label456: TLabel;
    Label457: TLabel;
    DBEdit243: TDBEdit;
    Label458: TLabel;
    DBEdit244: TDBEdit;
    Label459: TLabel;
    DBEdit245: TDBEdit;
    DBMemo7: TDBMemo;
    Label460: TLabel;
    DBEdit14: TDBEdit;
    lbEntradaDescDesp: TLabel;
    DBEditEntradaDescDesp: TDBEdit;
    Label461: TLabel;
    DBComboBox155: TDBComboBox;
    SpeedButton55: TSpeedButton;
    Label462: TLabel;
    DBEdit246: TDBEdit;
    Label463: TLabel;
    DBEdit247: TDBEdit;
    Label464: TLabel;
    DBEdit248: TDBEdit;
    Label465: TLabel;
    DBEdit249: TDBEdit;
    SpeedButton15: TSpeedButton;
    procedure DBEdit146Exit(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure DBEdit103Exit(Sender: TObject);
    procedure DBEdit172KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit170KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit168KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit166KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit164KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit162KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit248KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit247KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit174KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit245KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit220KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit246KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEditEntradaDescDespKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit219KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit244KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit175KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit178KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit176KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit243KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit173KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit171KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit169KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit167KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit165KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit163KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit161KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton55Click(Sender: TObject);
    procedure TabSheet25Show(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BtDelCtrPlanoClick(Sender: TObject);
    procedure BtAddCtrPlanoClick(Sender: TObject);
    procedure spBtAutXMLAdicionarClick(Sender: TObject);
    procedure spBtAutXMLRemoverClick(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton11Click(Sender: TObject);
    procedure DBEdit237Exit(Sender: TObject);
    procedure ListBox3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ListBox2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCFOPPreNotasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure DBComboBox90Exit(Sender: TObject);
    procedure MaskEdit15Exit(Sender: TObject);
    procedure MaskEdit14Exit(Sender: TObject);
    procedure MaskEdit11Exit(Sender: TObject);
    procedure MaskEdit10Exit(Sender: TObject);
    procedure MaskEdit8Exit(Sender: TObject);
    procedure MaskEdit7Exit(Sender: TObject);
    procedure MaskEdit6Exit(Sender: TObject);
    procedure MaskEdit15KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit14KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit13KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit12KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit11KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit10KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit9KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit8KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure MaskEdit13Exit(Sender: TObject);
    procedure MaskEdit12Exit(Sender: TObject);
    procedure MaskEdit9Exit(Sender: TObject);
    procedure MaskEdit5Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure PageControl5Enter(Sender: TObject);
    procedure DBEdit185KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GroupBox24Enter(Sender: TObject);
    procedure GroupBox20Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure DBEdit147Enter(Sender: TObject);
    procedure DBEdit144Exit(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure btSalvarSTClick(Sender: TObject);
    procedure btCancelarSTClick(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure btNovoSTClick(Sender: TObject);
    procedure btAlterarSTClick(Sender: TObject);
    procedure btRemoverSTClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBComboBox38KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox33KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox27KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox19KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BuscarDadosAgendaOficina;
    procedure GravarAgendaOficina;
    procedure LoadRegimeEspecialTributacaoNFSe();
  private
    { Private declarations }
    vCriou: Smallint;
  public
    { Public declarations }
  end;

var
  frmCadEmpresa: TfrmCadEmpresa;
  obEmpresa: TEmpresa;
implementation

uses uDtmAtivo, UDtmCadastrosBasicos, uDataSet_OOP, uDadosIni, SysUtils,
  FileCtrl, StdActns, ShlObj, ActiveX, uPadrao, Variants, StrUtils,
  uCadEmpresa_RepInterna, config_sistema_class, hw_win_utils, hw_utils;
{,UClassesGestor,UcadDNAEmpresa;}

function sistemaRegistrado(vcnpj, vSistema: string): LongBool; stdcall; external 'cons40.dll';

{$R *.dfm}

procedure TfrmCadEmpresa.BitBtn10Click(Sender: TObject);
begin
  inherited;
  if obEmpresa.vTx.Insert then
  begin
    BitBtn10.Visible := false;
    BitBtn11.Visible := false;
    BitBtn9.Visible := true;
    BitBtn8.Visible := true;
    Panel4.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (DBEdit114.CanFocus) then
    	DBEdit114.SetFocus;
  end;
end;

procedure TfrmCadEmpresa.BitBtn11Click(Sender: TObject);
begin
  inherited;
  obEmpresa.vTx.Edit;
  BitBtn10.Visible := false;
  BitBtn11.Visible := false;
  BitBtn9.Visible := true;
  BitBtn8.Visible := true;
  Panel4.Visible := true;
  if (Self.Enabled) and (Self.Visible) and (DBEdit114.CanFocus) then
  	DBEdit114.SetFocus;
end;

procedure TfrmCadEmpresa.BitBtn12Click(Sender: TObject);
begin
  inherited;
  vDadosIni.pesquisaRapida('CONTADOR');
  if vDadosIni.vPesquisa <> '' then
    obEmpresa.dataSet.FieldByName('COD_CONTADOR').AsString := vDadosIni.vPesquisa;
end;

procedure TfrmCadEmpresa.BitBtn13Click(Sender: TObject);
var
  resultado: integer;
  Util: OleVariant;
  certificado, msgResultado: widestring;
  msg: string;
begin
  //
  // Exemplo para escolher um certificado digital do repositório de certificados digitais do usuário corrente do
  // Windows
  //
  // A DLL utiliza o CSP do Windows, sendo necessário que o certificado digital esteja corretamente instalado no Windows.
  //
  certificado := '';
  msgResultado := '';
  //
  // instancia classe
  //
  Util := CreateOleObject('NFSe_Util.util');
  //
  // pega certificado
  //
  // o texto que retorna no campo Certificado será utilizada para identificar
  // o certificado digital em uso para as demais chamadas que necessitam de
  // um certificado digital
  //
  //
  // Códigos de retorno
  // ==========================================================================
  // 5401 - Foi selecionado um Certificado com o nome informado";
  // 5402 - Foi Selecionado o certificado de [{0:0}] na caixa de diálogo de escolha do certificado digital";
  // 5403 - Erro: Falha ao acessar certificado digital [{0:0}]";
  // 5404 - Erro: Nenhum certificado digital selecionado";
  // 5405 - Erro: Nenhum certificado válido foi encontrado com o nome [{0:0}] informado";

  resultado := Util.PegaNomeCertificado(certificado, msgResultado);
  obEmpresa.dataSet.FieldByName('NFS_CERT').AsString := certificado;
end;

procedure TfrmCadEmpresa.BitBtn14Click(Sender: TObject);
var
  S: string;
begin
  inherited;
  if SelectDirectory('Selecionar Pasta', '', S) then
    if obEmpresa.dataSet.State in [dsEdit, dsInsert] then
      obEmpresa.dataSet.FieldByName('DIRETORIO_HWF_TERM').AsString := S;
end;

procedure TfrmCadEmpresa.BitBtn15Click(Sender: TObject);
begin
  inherited;
  if obEmpresa.vAcessoCad.Insert then
  begin
  	if not obEmpresa.vAcessoCad.abreTabelasBanco then
    	Exit;
    obEmpresa.vAcessoCad.abreFormCadastro;
  end;
end;

procedure TfrmCadEmpresa.BitBtn16Click(Sender: TObject);
begin
  inherited;
  if obEmpresa.vAcessoCad.Edit then
  begin
  	if not obEmpresa.vAcessoCad.abreTabelasBanco then
    	Exit;
    obEmpresa.vAcessoCad.abreFormCadastro;
  end;
end;

procedure TfrmCadEmpresa.BitBtn17Click(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePage := TabSheet2;
end;

procedure TfrmCadEmpresa.BitBtn18Click(Sender: TObject);
begin
  inherited;
  if obEmpresa.vAcessoCad.Post then
    TForm(pnCadastroAcesso.Parent).ModalResult := IDOK
  else
    setFocusCampoErro(obEmpresa.vAcessoCad.vNomeCampoErro, obEmpresa.vAcessoCad.vMensagemErro);
end;

procedure TfrmCadEmpresa.BitBtn19Click(Sender: TObject);
begin
  inherited;
  obEmpresa.vAcessoCad.Cancel;
  TForm(pnCadastroAcesso.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadEmpresa.BitBtn1Click(Sender: TObject);
begin
  SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS076]';
  if vDadosIni.PesqPros('BAS072', 'PESQUISAR', '', 'EMPRESA', '', obEmpresa.buscas, true) then
  begin
    inherited;
    if MaskEdit2.Visible then
    begin
      if not obEmpresa.ConsultaCampos('Empresa', ComboBox1.Text,
        ComboBox2.text, maskedit1.text, maskedit2.text, vDadosIni.codEmpresa) then
        	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
        		combobox1.setfocus;
    end
    else if obEmpresa.ConsultaCampos('Empresa', MaskEdit3.text, ComboBox1.Text,
      combobox3.Text, ComboBox2.text, true, vDadosIni.codEmpresa) then
      	if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
      		ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    SpeedButton5.Visible := false;
    if obEmpresa.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
    obEmpresa.ultimasql := obEmpresa.dataSet.CommandText;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
  end;
end;

procedure TfrmCadEmpresa.BitBtn20Click(Sender: TObject);
begin
  inherited;
  TForm(pnSelEmpresa.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadEmpresa.BitBtn21Click(Sender: TObject);
begin
  inherited;
  TForm(pnSelEmpresa.Parent).ModalResult := IDOK;
end;

procedure TfrmCadEmpresa.BitBtn22Click(Sender: TObject);
begin
  inherited;
  if obEmpresa.vEmpresaRep.habilitarReplicacaoInterna then
  	obEmpresa.vEmpresaRep.abreEmpresaReplicacao;
end;

procedure TfrmCadEmpresa.BitBtn23Click(Sender: TObject);
begin
  inherited;
  if obEmpresa.vEmpresaRep.desabilitarReplicacaoInterna then
  	obEmpresa.vEmpresaRep.abreEmpresaReplicacao;
end;

procedure TfrmCadEmpresa.BitBtn24Click(Sender: TObject);
begin
  inherited;
  TForm(pnReplicacaoInterna.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadEmpresa.BitBtn2Click(Sender: TObject);
begin
  inherited;

  try
    obEmpresa.vContaLig.Cancel;
    obEmpresa.vContaLig.RollBackTransacao;
  except
  end;

end;

procedure TfrmCadEmpresa.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
  if vDadosIni.PesqPros('BAS073', 'INSERINDO NOVO REGISTRO', '', 'EMPRESA', '', obEmpresa.buscas,
    true) then
  begin
    lbxAutXML.Clear;
    if not obEmpresa.Insert then
      exit;

    ActiveControl := BitBtn3;
    inherited;

    DBEdit1.ReadOnly := False;
    PageControl1.ActivePage := TabSheet1;
    TabSheet3.TabVisible := true;
    PageControl3.ActivePage := TabSheet3;
    ListBoxCtrPlano.Items.Clear;
    if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    	DBEdit2.SetFocus;

//    if obEmpresa.dataSet.FieldByName('DIGITOSEMP').AsInteger <= 0 then
//    begin
//	    for I := 0 to DBComboBox60.Items.Count - 1 do
//      	if DBComboBox60.Items[I] = '1' then
//        begin
//        	DBComboBox60.ItemIndex := I;
//          DBComboBox60.Text := DBComboBox60.Items[DBComboBox60.ItemIndex];
//          Break;
//        end;
//    end;

    if obEmpresa.dataSet.FieldByName('DIGITOSGRUP').AsInteger <= 0 then
    begin
	    for I := 0 to DBComboBox59.Items.Count - 1 do
      	if DBComboBox59.Items[I] = '3' then
        begin
        	DBComboBox59.ItemIndex := I;
          DBComboBox59.Text := DBComboBox59.Items[DBComboBox59.ItemIndex];
          Break;
        end;
    end;

    obEmpresa.vUF.abreUF;
    obEmpresa.vTx.abreTaxaJuros;
    obEmpresa.vCabNF.abreCabNF;
    Label216.Caption := 'Certificado Digital NFSe:';
    BitBtn13.Visible := True;

    Label216.Visible := False;
    DBEdit149.Visible := False;
    Label217.Visible := False;
    DBEdit151.Visible := False;
    Label222.Visible := False;
    DBEdit155.Visible := False;
    BitBtn13.Visible := False;

//    if obEmpresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger = 3127701 then
//      Label222.Caption := 'Senha SIGISS:'
//    else
    if Trim(LowerCase(IniConf.FileReadStr('Cidades', obEmpresa.fstr('ibge_cod_cidade'), 'Provedor'))) = 'issdigital' then
    begin
      Label222.Caption := 'Senha ISSDigital:';
      Label216.Caption := 'Frase secreta:';
      BitBtn13.Visible := False;
      Label222.Visible := True;
      Label216.Visible := True;
      DBEdit149.Visible := True;
      DBEdit155.Visible := True;
    end
    else
      Label222.Caption := 'Licença FlexDocs:';

    //Label222.Caption := IfThen(obEmpresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger = 3127701, 'Senha SIGISS:', 'Licença FlexDocs:');
  end;
end;

procedure TfrmCadEmpresa.BitBtn4Click(Sender: TObject);
var
  vListaTmp: TStringList;
begin
  try
    if obEmpresa.dataSet.State = dsEdit then
    begin
      obEmpresa.sTipoPrecoN.Clear;
      obEmpresa.sTipoPrecoN.Add(ListBox1.Items[0]);
      obEmpresa.sTipoPrecoN.Add(ListBox1.Items[1]);
      obEmpresa.sTipoPrecoN.Add(ListBox1.Items[2]);
    end;

    GravarAgendaOficina;

    vListaTmp := TStringList.Create;
    vListaTmp.Text := lbxAutXML.Items.Text;

    if (obEmpresa.dataSet.State in [dsInsert, dsEdit]) then
    begin
      obEmpresa.dataSet.FieldByName('NFE_AUTXML').AsString := vDadosIni.Join(vListaTmp);
      obEmpresa.dataSet.FieldByName('CTR_PLANO_VEIC').AsString := ListBoxCtrPlano.Items.Text;
    end;

    vListaTmp.Free;
    vListaTmp := nil;

    Screen.Cursor := crHourGlass;

	  if not obEmpresa.Post then
      setFocusCampoErro(obEmpresa.vNomeCampoErro)
    else
    begin
      try
        if not obEmpresa.vContaLig.Post then
        begin
          Application.MessageBox('Ocorreu um erro ao salvar as Contas de Ligação, verifique!',
            'Atenção', MB_ICONERROR + MB_OK);
          PageControl3.ActivePage := TabSheet20;
          PageControl5.ActivePage := TabSheet25;
          if (Self.Enabled) and (Self.Visible) and (DBEdit161.CanFocus) then
          	DBEdit161.SetFocus;
          Exit;
        end;
      except
      end;

      try
        if not obEmpresa.vContaLigContabil.Post then
        begin
          Application.MessageBox('Ocorreu um erro ao salvar as Contas de Ligação Contábil, verifique!', 'Atenção', MB_ICONERROR + MB_OK);
          PageControl3.ActivePage := TabSheet20;
          PageControl5.ActivePage := TabSheet26;
          if (Self.Enabled) and (Self.Visible) and (DBEdit161.CanFocus) then
          	DBEdit161.SetFocus;
          Exit;
        end
        else
        if not sistemaRegistrado(vDadosIni.vEmp.vCNPJ, vDadosIni.vSistema) then
        begin
          Application.Terminate;
          Halt(0);
        end;
      except
      end;
      if CheckCadSeq.Checked then
      begin
        if obEmpresa.Insert then
        	if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
          	DBEdit3.SetFocus;
        MudaCor;
      end
      else
        inherited;
    end;
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmCadEmpresa.BitBtn5Click(Sender: TObject);
begin
//  if vDadosIni.PesqPros('BAS080', 'CANCELAR', '', 'EMPRESA',
//    obEmpresa.dataSet.FieldByName('COD_EMPRESA').AsString, obEmpresa.buscas, true) then
//  begin
    ActiveControl := BitBtn5;
    PageControl1.ActivePage := TabSheet2;
    obEmpresa.Cancel;
    obEmpresa.RollBackTransacao;

    try
      obEmpresa.vContaLig.Cancel;
      obEmpresa.vContaLig.RollBackTransacao;
    except
    end;

    inherited;
//  end;
end;

procedure TfrmCadEmpresa.BitBtn7Click(Sender: TObject);
begin
  inherited;
  OpenDialog1.Execute;
  DBEdit50.Text := OpenDialog1.FileName;
end;

procedure TfrmCadEmpresa.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if obEmpresa.vTx.Post then
  begin
    Panel4.Visible := false;
    BitBtn10.Visible := true;
    BitBtn11.Visible := true;
    BitBtn9.Visible := false;
    BitBtn8.Visible := false;
  end;
end;

procedure TfrmCadEmpresa.BitBtn9Click(Sender: TObject);
begin
  inherited;
  obEmpresa.vTx.Cancel;
  Panel4.Visible := false;
  BitBtn10.Visible := true;
  BitBtn11.Visible := true;
  BitBtn9.Visible := false;
  BitBtn8.Visible := false;
end;

procedure TfrmCadEmpresa.BtAddCtrPlanoClick(Sender: TObject);
begin
  if Pos(ComboBoxCtrPlano.Text, ListBoxCtrPlano.Items.Text) > 0 then
  begin
    Application.MessageBox('Controle já definido no plano de pagamento desta empresa!', 'Atenção');
    if (Self.Enabled) and (Self.Visible) and (ComboBoxCtrPlano.CanFocus) then
      ComboBoxCtrPlano.SetFocus;
    exit;
  end;
  ListBoxCtrPlano.Items.Add(ComboBoxCtrPlano.Text);
  if (Self.Enabled) and (Self.Visible) and (ComboBoxCtrPlano.CanFocus) then
    ComboBoxCtrPlano.SetFocus;
end;

procedure TfrmCadEmpresa.btAlterarSTClick(Sender: TObject);
begin
  inherited;
  if not obEmpresa.vSubTrib.dataSet.IsEmpty then
    if obEmpresa.vSubTrib.Edit then
    begin
      pnSTCadastro.Visible := True;
      pnSTConsulta.Visible := False;
      if (Self.Enabled) and (Self.Visible) and (DBEdit150.CanFocus) then
      	DBEdit150.SetFocus;
    end;
end;

procedure TfrmCadEmpresa.btCancelarSTClick(Sender: TObject);
begin
  inherited;
  obEmpresa.vSubTrib.Cancel;
  pnSTConsulta.Visible := True;
  pnSTCadastro.Visible := False;
end;

procedure TfrmCadEmpresa.BtDelCtrPlanoClick(Sender: TObject);
begin
  ListBoxCtrPlano.DeleteSelected;
  if (Self.Enabled) and (Self.Visible) and (ListBoxCtrPlano.CanFocus) then
    ListBoxCtrPlano.SetFocus;
end;

procedure TfrmCadEmpresa.btNovoSTClick(Sender: TObject);
begin
  inherited;
  if obEmpresa.vSubTrib.Insert then
  begin
    pnSTCadastro.Visible := True;
    pnSTConsulta.Visible := False;
    if (Self.Enabled) and (Self.Visible) and (DBEdit150.CanFocus) then
    	DBEdit150.SetFocus;
  end;
end;

procedure TfrmCadEmpresa.btRemoverSTClick(Sender: TObject);
begin
  inherited;
  if not obEmpresa.vSubTrib.dataSet.IsEmpty then
    obEmpresa.vSubTrib.Delete;
end;

procedure TfrmCadEmpresa.btSalvarSTClick(Sender: TObject);
begin
  inherited;
  if obEmpresa.vSubTrib.Post then
  begin
    pnSTConsulta.Visible := True;
    pnSTCadastro.Visible := False;
  end;
end;

procedure TfrmCadEmpresa.BuscarDadosAgendaOficina;
begin
  MaskEdit4.Text := Copy(vDadosIni.vEmp.vHora_Manha_Semana, 1, 2);
  MaskEdit5.Text := Copy(vDadosIni.vEmp.vHora_Manha_Semana, 4, 2);
  MaskEdit6.Text := Copy(vDadosIni.vEmp.vHora_Tarde_Semana, 1, 2);
  MaskEdit7.Text := Copy(vDadosIni.vEmp.vHora_Tarde_Semana, 4, 2);

  MaskEdit8.Text := Copy(vDadosIni.vEmp.vHora_Manha_Sab, 1, 2);
  MaskEdit9.Text := Copy(vDadosIni.vEmp.vHora_Manha_Sab, 4, 2);
  MaskEdit10.Text := Copy(vDadosIni.vEmp.vHora_Tarde_Sab, 1, 2);
  MaskEdit11.Text := Copy(vDadosIni.vEmp.vHora_Tarde_Sab, 4, 2);

  MaskEdit12.Text := Copy(vDadosIni.vEmp.vHora_Manha_Dom, 1, 2);
  MaskEdit13.Text := Copy(vDadosIni.vEmp.vHora_Manha_Dom, 4, 2);
  MaskEdit14.Text := Copy(vDadosIni.vEmp.vHora_Tarde_Dom, 1, 2);
  MaskEdit15.Text := Copy(vDadosIni.vEmp.vHora_Tarde_Dom, 4, 2);
end;

procedure TfrmCadEmpresa.DBComboBox19KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadEmpresa.DBComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadEmpresa.DBComboBox27KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadEmpresa.DBComboBox2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadEmpresa.DBComboBox33KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadEmpresa.DBComboBox38KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TfrmCadEmpresa.DBComboBox90Exit(Sender: TObject);
var
vrecepcao:string;
begin
  inherited;

  vrecepcao := DBComboBox91.Field.AsString;

  if ((DBComboBox90.Text = '1') or (DBComboBox90.Text = '1.0')) then
  begin
    DBComboBox91.Items.Clear;
    DBComboBox91.Items.Add('N - Assíncrono');
    DBComboBox91.Field.AsString := 'N - Assíncrono';
  end
  else
  begin
    DBComboBox91.Items.Clear;
    DBComboBox91.Items.Add('N - Assíncrono');
    DBComboBox91.Items.Add('S -  Síncrono');
    DBComboBox91.Field.AsString := vrecepcao;
  end;
end;

procedure TfrmCadEmpresa.DBEdit103Exit(Sender: TObject);
begin
  inherited;
  DBEdit146.Hint := ''; 
  LoadRegimeEspecialTributacaoNFSe();
end;

procedure TfrmCadEmpresa.DBEdit144Exit(Sender: TObject);
begin
  inherited;
  pgControlNF.ActivePage := TabSheet11;
  if (Self.Enabled) and (Self.Visible) and (DBComboBox38.CanFocus) then
    DBComboBox38.SetFocus;
end;

procedure TfrmCadEmpresa.DBEdit146Exit(Sender: TObject);
begin
  inherited;
  LoadRegimeEspecialTributacaoNFSe();
end;

procedure TfrmCadEmpresa.DBEdit147Enter(Sender: TObject);
begin
  inherited;
  if obEmpresa.dataSet.FieldByName('REGIME').AsString = 'SIMPLES' then
    obEmpresa.dataSet.FieldByName('NFS_OPTANTESIMPLES').asinteger := 1
  else
    obEmpresa.dataSet.FieldByName('NFS_OPTANTESIMPLES').asinteger := 2;
end;

procedure TfrmCadEmpresa.DBEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''S'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_TARIFAINTERMPAG').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit161KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''E'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_V_PROD').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit162KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('CONTROLES'));

    if trim(vDadosIni.vPesquisa) <> '' then
      obEmpresa.vContaLig.dataSet.FieldByName('CONTR_V_PROD').AsInteger := StrToInt(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit163KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
        ' and P_CONTAS.TIPO_PLC = ''E'' ',
        'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_V_SERV').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit164KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('CONTROLES'));

    if trim(vDadosIni.vPesquisa) <> '' then
      obEmpresa.vContaLig.dataSet.FieldByName('CONTR_V_SERV').AsInteger := StrToInt(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit165KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''S'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_C_PROD').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit166KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('CONTROLES'));

    if trim(vDadosIni.vPesquisa) <> '' then
      obEmpresa.vContaLig.dataSet.FieldByName('CONTR_C_PROD').AsInteger := StrToInt(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit167KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''S'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_C_VEIC').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit168KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('CONTROLES'));

    if trim(vDadosIni.vPesquisa) <> '' then
      obEmpresa.vContaLig.dataSet.FieldByName('CONTR_C_VEIC').AsInteger := StrToInt(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit169KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''S'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_S_CHQ').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit170KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('CONTROLES'));

    if trim(vDadosIni.vPesquisa) <> '' then
      obEmpresa.vContaLig.dataSet.FieldByName('CONTR_S_CHQ').AsInteger := StrToInt(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit171KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''S'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_S_CRD').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit172KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('CONTROLES'));

    if trim(vDadosIni.vPesquisa) <> '' then
      obEmpresa.vContaLig.dataSet.FieldByName('CONTR_S_CRD').AsInteger := StrToInt(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit173KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''S'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('CONTA_ICM').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit174KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''S'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('CONTA_PIS').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit175KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''S'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_D_PREST').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit176KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''E'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_J_PREST').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit178KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''S'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_TARIFABANCARIA').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit185KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    if obEmpresa.vContaLigContabil.dataSet.State in [dsEdit, dsInsert] then
    begin
      vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS_CONTABIL'));
      if vDadosIni.vPesquisa <> '' then
        TDBEdit(Sender).DataSource.DataSet.FieldByName(TDBEdit(Sender).DataField).AsString :=
          vDadosIni.vPesquisa;
    end;
end;

procedure TfrmCadEmpresa.DBEdit219KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''E'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_SOBRA').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit220KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''S'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_QUEBRA').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit237Exit(Sender: TObject);
begin
  inherited;
 try
    if DBEdit237.Field.AsInteger > 0 then
    begin
     if not obEmpresa.vControles.buscaControles(DBEdit237.Field.AsInteger) then
     begin
      Application.MessageBox('Controle não encontrado ou não definido para entrar em condições!', 'Erro', MB_ICONERROR + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (DBEdit237.CanFocus) then
        DBEdit237.SetFocus;
      exit;
     end;
    end;
  except
  end;
end;

procedure TfrmCadEmpresa.DBEdit243KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''E'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_ED_PREST').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit244KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''S'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_SJ_PREST').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit245KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''S'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_SOBRA').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit246KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''E'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_C_FRETE').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit247KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''S'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_S_TRANSF').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEdit248KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''E'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_E_TRANSF').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBEditEntradaDescDespKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''E'' ',
      'Consulta do Plano de Contas'));

    if trim(vDadosIni.vPesquisa) <> '' then
    	obEmpresa.vContaLig.dataSet.FieldByName('NCON_ENT_DESCDESP').AsString := trim(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadEmpresa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender);
end;

procedure TfrmCadEmpresa.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    BitBtn11Click(sender);

  if key = VK_DELETE then
    obEmpresa.vTx.Delete;

  if key = VK_ESCAPE then
    BitBtn9Click(sender);
end;

procedure TfrmCadEmpresa.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if trim(TDBGrid(sender).DataSource.DataSet.FieldByName('HAB').AsString) = 'S'  then
    begin
       if (gdFocused in State) then
       begin
         TDBGrid(sender).canvas.brush.color := clWindow;
         TDBGrid(sender).canvas.Font.color := clWindowText;
       end
       else
       begin
         TDBGrid(sender).canvas.brush.color := clMenuHighlight;
         TDBGrid(sender).canvas.Font.color := clWhite;
       end;
    end;
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadEmpresa.edCFOPPreNotasKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NAT_OP');
    if Trim(vDadosIni.vPesquisa) <> '' then
      try
        edCFOPPreNotas.AsValue := StrToInt(Trim(vDadosIni.vPesquisa));
      except
      end;
  end;
end;

procedure TfrmCadEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  
  if (obEmpresa <> nil) then
  	obEmpresa.Cancel;

	obEmpresa.free;
  obEmpresa := nil;

  action := cafree;
  if (frmCadEmpresa <> nil) then
  	frmCadEmpresa := nil;
end;

procedure TfrmCadEmpresa.FormCreate(Sender: TObject);
var
  I: integer;
begin
	vCriou := 0;
	TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  obEmpresa := TEmpresa.create;
  TabSheet3.TabVisible := True;
  TabSheet13.TabVisible := false;
  tsSubstitutoTributario.TabVisible := false;
  tsCadastrosAcess.TabVisible := false;
  tsReplicacaoInterna.TabVisible := false;
  Label222.Alignment := taRightJustify;
  Label216.Alignment := taRightJustify;

  with obEmpresa.buscas do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT FIRST 1 * FROM Produtos where ATIVO = 0 AND COD_EMPRESA = 0');
    Open;
    DBComboBox27.Clear;
    First;
    for I := 0 to FieldCount - 1 do
      DBComboBox27.Items.Add(Fields[I].FieldName);

    Close;
    SQL.Clear;
    SQL.Add('SELECT FIRST 1 * FROM CLIENTES where COD_CLIENTE = 0 AND COD_EMPRESA = 0 ');
    Open;
    DBComboBox28.Clear;
    First;
    for I := 0 to FieldCount - 1 do
      DBComboBox28.Items.Add(Fields[I].FieldName);

    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM VEICULOS where CHASSI = ''0000000000'' and cod_empresa = 0');
    Open;
    DBComboBox29.Clear;
    First;
    for I := 0 to FieldCount - 1 do
      DBComboBox29.Items.Add(Fields[I].FieldName);

    Close;
    SQL.Clear;
    SQL.Add('select * from CONTROLE_CHEQUE where CODIGO_CH = 0  AND CODIGO_EMP = 0');
    Open;
    DBComboBox42.Clear;
    First;
    for I := 0 to FieldCount - 1 do
      DBComboBox42.Items.Add(Fields[I].FieldName);

    Close;
    SQL.Clear;
    SQL.Add('select * from CONTROLE_CREDITOS where COD_CRED = 0 AND CODIGO_EMP = 0');
    Open;
    DBComboBox43.Clear;
    First;
    for I := 0 to FieldCount - 1 do
      DBComboBox43.Items.Add(Fields[I].FieldName);
  end;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadEmpresa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn5Click(sender);

  if key = VK_INSERT then
    BitBtn3Click(sender);
end;

procedure TfrmCadEmpresa.FormShow(Sender: TObject);
var
  I: integer;
  conf: TConfig_sistema_class;
begin
	if not Self.Enabled then
    Exit;

	if vShow <> 1 then
  begin
  	DBGrid1.DataSource := DtmCadBasicos.dsEmpresa;
    inherited;
    if vCriou = 0 then
  		setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  if vCriou = 0 then
  begin
    //  obEmpresa.abreEmpresa;
    obEmpresa.vUF.abreUF;
    obEmpresa.vTx.abreTaxaJuros;
    obEmpresa.vCabNF.abreCabNF;
  end;

  if TelaCadastro = 1 then
    BitBtn3Click(Sender);

  for I := 0 to Self.ComponentCount - 1 do
  begin
    if (Components[I] is TDBEdit) and (TDBEdit(Components[I]).Tag = 0) then
      TDBEdit(Components[I]).CharCase := ecUpperCase;
    if (Components[I] is TDBComboBox) and (TDBComboBox(Components[I]).Tag = 0) then
      TDBComboBox(Components[I]).CharCase := ecUpperCase;
    if (Components[I] is TEdit) and (TEdit(Components[I]).Tag = 0) then
      TEdit(Components[I]).CharCase := ecUpperCase;
  end;

  if obEmpresa.StatusLixeira then
    lixeiraVazia(false)
  else
    lixeiraVazia(true);

  if vCriou = 0 then
  begin
    obEmpresa.configuraItensTipovenda(DBComboBox63, 'ORC');
    obEmpresa.configuraItensTipovenda(DBComboBox57, 'REQ');
    vDadosIni.configuraItensTipovenda(DBComboBox95, 'REQ',obEmpresa.buscas,false);
    vDadosIni.configuraItensTipovenda(DBComboBox125, 'REQ',obEmpresa.buscas,false);
    for I := 0 to DBComboBox57.Items.Count - 1 do
      if Trim(DBComboBox57.Items[I]) <> 'E - ESCOLHA' then
        DBComboBox92.Items.Add(DBComboBox57.Items[I]);
    obEmpresa.configuraItensTipovenda(DBComboBox93, 'OS');
  end;

  conf := TCfg_sis.getConf('efd_icms_escrituracao', obEmpresa.buscas, vDadosIni.cod_empresa);

  try
    DBComboBox97.Visible := not conf.AsBoolean;
    Label348.Visible := not conf.AsBoolean;

    Label424.Visible := not conf.AsBoolean;
    DBComboBox138.Visible := not conf.AsBoolean;

    Label353.Visible := not conf.AsBoolean;
    DBEdit205.Visible := not conf.AsBoolean;

    Label355.Visible := not conf.AsBoolean;
    DBEdit207.Visible := not conf.AsBoolean;

  finally
    conf.Free;
  end;

  //Label46.Enabled := False;
  DBComboBox4.Enabled := False;

  SpeedButton7.Visible := vDadosIni.vCodEmpresaFisica = StrToInt(vDadosIni.codEmpresa);
  DBEdit155.PasswordChar := '*';
  Label122.Alignment := taRightJustify;

  Label61.Hint := 'Configuração deixou de ser usada, substituída pela Global "prod_precos" ManterMarkupeMargemProporcionalAosPrecos=S';
  DBComboBox14.DataField := '';
  DBComboBox14.Enabled := False;

  if vCriou = 0 then
    vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmCadEmpresa.GravarAgendaOficina;
begin

  if ((trim(MaskEdit4.Text) <> '') and (trim(MaskEdit5.Text) <> '')) then
    vDadosIni.vEmp.vHora_Manha_Semana := MaskEdit4.Text + '|' + MaskEdit5.Text
  else if ((trim(MaskEdit4.Text) = '') and (trim(MaskEdit5.Text) = '')) then
    vDadosIni.vEmp.vHora_Manha_Semana := '';

  if ((trim(MaskEdit6.Text) <> '') and (trim(MaskEdit7.Text) <> '')) then
    vDadosIni.vEmp.vHora_Tarde_Semana := MaskEdit6.Text + '|' + MaskEdit7.Text
  else if ((trim(MaskEdit6.Text) = '') and (trim(MaskEdit7.Text) = '')) then
    vDadosIni.vEmp.vHora_Tarde_Semana := '';

  if ((trim(MaskEdit8.Text) <> '') and (trim(MaskEdit9.Text) <> '')) then
    vDadosIni.vEmp.vHora_Manha_Sab := MaskEdit8.Text + '|' + MaskEdit9.Text
  else if ((trim(MaskEdit8.Text) = '') and (trim(MaskEdit9.Text) = '')) then
    vDadosIni.vEmp.vHora_Manha_Sab := '';

  if ((trim(MaskEdit10.Text) <> '') and (trim(MaskEdit11.Text) <> '')) then
    vDadosIni.vEmp.vHora_Tarde_Sab := MaskEdit10.Text + '|' + MaskEdit11.Text
  else if ((trim(MaskEdit10.Text) = '') and (trim(MaskEdit11.Text) = '')) then
    vDadosIni.vEmp.vHora_Tarde_Sab := '';

  if ((trim(MaskEdit12.Text) <> '') and (trim(MaskEdit13.Text) <> '')) then
    vDadosIni.vEmp.vHora_Manha_Dom := MaskEdit12.Text + '|' + MaskEdit13.Text
  else if ((trim(MaskEdit12.Text) = '') and (trim(MaskEdit13.Text) = '')) then
    vDadosIni.vEmp.vHora_Manha_Dom := '';

  if ((trim(MaskEdit14.Text) <> '') and (trim(MaskEdit15.Text) <> '')) then
    vDadosIni.vEmp.vHora_Tarde_Dom := MaskEdit14.Text + '|' + MaskEdit15.Text
  else if ((trim(MaskEdit14.Text) = '') and (trim(MaskEdit15.Text) = '')) then
    vDadosIni.vEmp.vHora_Tarde_Dom := '';
end;

procedure TfrmCadEmpresa.GroupBox20Enter(Sender: TObject);
begin
  inherited;

  //  obEmpresa.vContaLig.abreContasLig;
  //
  //  if obEmpresa.vContaLig.dataSet.IsEmpty then
  //  begin
  //     obEmpresa.vContaLig.Insert;
  //     obEmpresa.vContaLig.dataSet.FieldByName('COD_EMP').AsString:=vDadosIni.codEmpresa;
  //  end
  //  else
  //     obEmpresa.vContaLig.Edit;

  //  if (Self.Enabled) and (Self.Visible) and (DBEdit161.CanFocus) then
  //  	DBEdit161.SetFocus;
  //  Label240.Caption := vDadosIni.vEmp.vnomeEmpresa;

end;

procedure TfrmCadEmpresa.GroupBox24Enter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit185.CanFocus) then
  	DBEdit185.SetFocus;
end;

procedure TfrmCadEmpresa.ListBox2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
    if ListBox2.Items.Count > 0 then
    begin
      if not (obEmpresa.dataSet.State in [dsEdit, dsInsert]) then
        Exit;
      ListBox2.Items.Delete(ListBox2.ItemIndex);
      obEmpresa.dataSet.FieldByName('PRE_NOTA_TRANSF_CNPJ').AsString := ListBox2.Items.Text;
    end;
end;

procedure TfrmCadEmpresa.ListBox3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
    if ListBox3.Items.Count > 0 then
    begin
      if not (obEmpresa.dataSet.State in [dsEdit, dsInsert]) then
        Exit;
      ListBox3.Items.Delete(ListBox3.ItemIndex);
      obEmpresa.dataSet.FieldByName('PRE_NOTA_TRANSF_CFOP').AsString := ListBox3.Items.Text;
    end;
end;

procedure TfrmCadEmpresa.LoadRegimeEspecialTributacaoNFSe();
type
  nfse_get_regime_especial_trib = function (vendBanco: WideString; codempresa: integer): WideString; stdcall;
var
  hndlDll: THandle;
  GetRegimeEspecialTrib: nfse_get_regime_especial_trib;
  list: TStrings;
  I: Integer;
  S: string;
begin

  if DBEdit146.Hint = '' then
  begin
    hndlDll := LoadLibrary('hw.nfe.dx.dll');

    if hndlDll = 0  then
      raise Exception.Create('DLL "hw.nfe.dx.dll" não pode ser carregada. Por favor contacte o suporte técnico');

    try
      @GetRegimeEspecialTrib := GetProcAddress(hndlDll, PAnsiChar('nfse_get_regime_especial_trib'));

      DBEdit146.Hint := GetRegimeEspecialTrib(vDadosIni.vBancoHW, vDadosIni.cod_empresa);

    finally
      FreeLibrary(hndlDll)
    end;
  end;

  Label211.Caption := '';

  if DBEdit146.Hint <> '' then
  begin
    list := TStringList.Create;
    list.Text := DBEdit146.Hint;
    try
      for I := 0 to List.Count - 1 do
        if StartsText(obEmpresa.fstr('NFS_REGIMETRIB') + ' -', list[I]) then
        begin
          Label211.Caption := list[I];
          Break;
        end;
    finally
      list.Free;
    end;
  end;
end;

procedure TfrmCadEmpresa.MaskEdit10Exit(Sender: TObject);
begin
  inherited;
  if trim(MaskEdit10.Text) = '' then
    exit;

  if (StrToInt(MaskEdit10.Text) < 0) or (StrToInt(MaskEdit10.Text) > 23) then
  begin
    Application.MessageBox(pchar('Hora inválida'), 'Atenção', MB_OK);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit10.CanFocus) then
      MaskEdit10.SetFocus;
  end;
end;

procedure TfrmCadEmpresa.MaskEdit10KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfrmCadEmpresa.MaskEdit11Exit(Sender: TObject);
begin
  inherited;
  if trim(MaskEdit11.Text) = '' then
    exit;

  if (StrToInt(MaskEdit11.Text) < 0) or (StrToInt(MaskEdit11.Text) > 23) then
  begin
    Application.MessageBox(pchar('Hora inválida'), 'Atenção', MB_OK);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit11.CanFocus) then
      MaskEdit11.SetFocus;
  end;
end;

procedure TfrmCadEmpresa.MaskEdit11KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfrmCadEmpresa.MaskEdit12Exit(Sender: TObject);
begin
  inherited;
  if trim(MaskEdit12.Text) = '' then
    exit;

  if (StrToInt(MaskEdit12.Text) < 0) or (StrToInt(MaskEdit12.Text) > 23) then
  begin
    Application.MessageBox(pchar('Hora inválida'), 'Atenção', MB_OK);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit12.CanFocus) then
      MaskEdit12.SetFocus;
  end;
end;


procedure TfrmCadEmpresa.MaskEdit12KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfrmCadEmpresa.MaskEdit13Exit(Sender: TObject);
begin
  inherited;
  if trim(MaskEdit13.Text) = '' then
    exit;

  if (StrToInt(MaskEdit13.Text) < 0) or (StrToInt(MaskEdit13.Text) > 23) then
  begin
    Application.MessageBox(pchar('Hora inválida'), 'Atenção', MB_OK);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit13.CanFocus) then
      MaskEdit13.SetFocus;
  end;
end;


procedure TfrmCadEmpresa.MaskEdit13KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfrmCadEmpresa.MaskEdit14Exit(Sender: TObject);
begin
  inherited;
  if trim(MaskEdit14.Text) = '' then
    exit;

  if (StrToInt(MaskEdit14.Text) < 0) or (StrToInt(MaskEdit14.Text) > 23) then
  begin
    Application.MessageBox(pchar('Hora inválida'), 'Atenção', MB_OK);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit14.CanFocus) then
      MaskEdit14.SetFocus;
  end;
end;

procedure TfrmCadEmpresa.MaskEdit14KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfrmCadEmpresa.MaskEdit15Exit(Sender: TObject);
begin
  inherited;
  if trim(MaskEdit15.Text) = '' then
    exit;

  if (StrToInt(MaskEdit15.Text) < 0) or (StrToInt(MaskEdit15.Text) > 23) then
  begin
    Application.MessageBox(pchar('Hora inválida'), 'Atenção', MB_OK);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit15.CanFocus) then
      MaskEdit15.SetFocus;
  end;
end;

procedure TfrmCadEmpresa.MaskEdit15KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfrmCadEmpresa.MaskEdit4Exit(Sender: TObject);
begin
  inherited;
  if Trim(MaskEdit4.Text) = '' then
    exit;

  if (StrToInt(MaskEdit4.Text) < 0) or (StrToInt(MaskEdit4.Text) > 23) then
  begin
    Application.MessageBox(pchar('Hora inválida'), 'Atenção', MB_OK);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit4.CanFocus) then
      MaskEdit4.SetFocus;
  end;
end;

procedure TfrmCadEmpresa.MaskEdit4KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfrmCadEmpresa.MaskEdit5Exit(Sender: TObject);
begin
  inherited;
  if Trim(MaskEdit5.Text) = '' then
    exit;

  if (StrToInt(MaskEdit5.Text) < 0) or (StrToInt(MaskEdit5.Text) > 23) then
  begin
    Application.MessageBox(pchar('Hora inválida'), 'Atenção', MB_OK);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit5.CanFocus) then
      MaskEdit5.SetFocus;
  end;
end;


procedure TfrmCadEmpresa.MaskEdit5KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfrmCadEmpresa.MaskEdit6Exit(Sender: TObject);
begin
  inherited;
  if trim(MaskEdit6.Text) = '' then
    exit;

  if (StrToInt(MaskEdit6.Text) < 0) or (StrToInt(MaskEdit6.Text) > 23) then
  begin
    Application.MessageBox(pchar('Hora inválida'), 'Atenção', MB_OK);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit6.CanFocus) then
      MaskEdit6.SetFocus;
  end;
end;

procedure TfrmCadEmpresa.MaskEdit6KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfrmCadEmpresa.MaskEdit7Exit(Sender: TObject);
begin
  inherited;
  if trim(MaskEdit7.Text) = '' then
    exit;

  if (StrToInt(MaskEdit7.Text) < 0) or (StrToInt(MaskEdit7.Text) > 23) then
  begin
    Application.MessageBox(pchar('Hora inválida'), 'Atenção', MB_OK);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit7.CanFocus) then
      MaskEdit7.SetFocus;
  end;
end;

procedure TfrmCadEmpresa.MaskEdit7KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfrmCadEmpresa.MaskEdit8Exit(Sender: TObject);
begin
  inherited;
  if trim(MaskEdit8.Text) = '' then
    exit;

  if (StrToInt(MaskEdit8.Text) < 0) or (StrToInt(MaskEdit8.Text) > 23) then
  begin
    Application.MessageBox(pchar('Hora inválida'), 'Atenção', MB_OK);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit8.CanFocus) then
      MaskEdit8.SetFocus;
  end;
end;

procedure TfrmCadEmpresa.MaskEdit8KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfrmCadEmpresa.MaskEdit9Exit(Sender: TObject);
begin
  inherited;
  if trim(MaskEdit9.Text) = '' then
    exit;

  if (StrToInt(MaskEdit9.Text) < 0) or (StrToInt(MaskEdit9.Text) > 23) then
  begin
    Application.MessageBox(pchar('Hora inválida'), 'Atenção', MB_OK);
    if (Self.Enabled) and (Self.Visible) and (MaskEdit9.CanFocus) then
      MaskEdit9.SetFocus;
  end;
end;

procedure TfrmCadEmpresa.MaskEdit9KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (Key in ['0'..'9', Chr(8)]) then
    Key := #0;
end;

procedure TfrmCadEmpresa.PageControl5Enter(Sender: TObject);
begin
  inherited;

  Label240.Caption := vDadosIni.vEmp.vnomeEmpresa;
  if PageControl5.ActivePage = TabSheet25 then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit161.CanFocus) then
    	DBEdit161.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (DBEdit185.CanFocus) then
    DBEdit185.SetFocus;
end;

procedure TfrmCadEmpresa.QuickRep1Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Informações da Empresa');
end;

procedure TfrmCadEmpresa.spBtAutXMLAdicionarClick(Sender: TObject);
var
  vTemp: string;
begin
  inherited;

  if not (obEmpresa.dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  if not InputQuery('Autorizar CPF ou CNPJ', 'Informe o CPF ou CNPJ de que você deseja autorizar acesso ao XML', vTemp) then
    Exit;

  try
    if Trim(vTemp) = '' then
      raise exception.Create('CFP ou CNPJ não informado');

    if (Length(Trim(vTemp)) <> 11) and (Length(Trim(vTemp)) <> 14) then
      raise exception.Create('CFP ou CNPJ inválido. O campo deve conter 11 dígitos para CPF ou 14 para CNPJ');

    if (Length(Trim(vTemp)) = 11) then
      if not obEmpresa.CPF(Trim(vTemp)) then
        raise exception.Create('CFP inválido');

    if (Length(Trim(vTemp)) = 14) then
      if not obEmpresa.cgc(Trim(vTemp)) then
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

procedure TfrmCadEmpresa.spBtAutXMLRemoverClick(Sender: TObject);
begin
  inherited;
  if lbxAutXML.ItemIndex <> - 1 then
    lbxAutXML.DeleteSelected;
end;

procedure TfrmCadEmpresa.SpeedButton10Click(Sender: TObject);
begin
  if ListBox1.ItemIndex = -1 then
    listbox1.Selected[2]
  else if (ListBox1.ItemIndex < 2) then
    ListBox1.Items.Move(ListBox1.ItemIndex, ListBox1.ItemIndex + 1);

end;

procedure TfrmCadEmpresa.SpeedButton11Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('BAS351', 'ABRIR', '', 'EMPRESA', '', obEmpresa.buscas, True) then
    Exit;

  obEmpresa.abreFormEmpresasUnificadas;
end;

procedure TfrmCadEmpresa.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  if vDadosIni.PesqPros('BAS411', 'ABRIR', '', 'EMPRESA', '', obEmpresa.buscas, True) then
  begin
    inherited;
    obEmpresa.vEmpresaRep.abreFormReplicacaoInterna;
  end;
end;

procedure TfrmCadEmpresa.SpeedButton13Click(Sender: TObject);
var
  formulario: TfrmPadrao;
begin
  inherited;

  if not (obEmpresa.dataSet.State in [dsEdit, dsInsert]) then
    Exit;

  obEmpresa.vAcessoCad.vEmp.abreOutrasEmpresa;
  if obEmpresa.vAcessoCad.vEmp.dataSet.IsEmpty then
  begin
    Application.MessageBox('Nenhuma outra empresa encontrado no banco de dados', 'Atenção');
    Exit;
  end;

   try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Selecione a empresa';
    pnSelEmpresa.Parent := formulario;
    GroupBox32.Parent := pnSelEmpresa;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    pnSelEmpresa.Visible := True;
    GroupBox32.TabOrder := 0;
    if formulario.ShowModal = IDOK then
    begin
      ListBox2.Items.Add(Trim(obEmpresa.vAcessoCad.vEmp.dataSet.FieldByName('cgc_emp').AsString) + '|');
      obEmpresa.dataSet.FieldByName('PRE_NOTA_TRANSF_CNPJ').AsString := ListBox2.Items.Text;
    end;
  finally
    pnSelEmpresa.Visible := False;
    pnSelEmpresa.Parent := TabSheet19;
    GroupBox32.Parent := Panel16;
    formulario.Free;
    formulario := nil;
  end;

end;

procedure TfrmCadEmpresa.SpeedButton14Click(Sender: TObject);
begin
  inherited;

  if not (obEmpresa.dataSet.State in [dsEdit, dsInsert]) then
    Exit;

  if pos(IntToStr(edCFOPPreNotas.AsInteger) + '|',
    Trim(obEmpresa.dataSet.FieldByName('PRE_NOTA_TRANSF_CFOP').AsString)) > 0 then
    Exit;

  if obEmpresa.retornaValor('select codigo_nop as valor from nat_op where codigo_nop > 3999 and ' +
    ' codigo_nop = ' + IntToStr(edCFOPPreNotas.AsInteger)) <> IntToStr(edCFOPPreNotas.AsInteger) then
  begin
    Application.MessageBox('CFOP informado não encontrado no cadastro ou não é de saída', 'Atenção', 0 + 64);
    Exit;
  end;

  ListBox3.Items.Add(Trim(IntToStr(edCFOPPreNotas.AsInteger)) + '|');
  obEmpresa.dataSet.FieldByName('PRE_NOTA_TRANSF_CFOP').AsString := ListBox3.Items.Text;
end;

procedure TfrmCadEmpresa.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  LoadRegimeEspecialTributacaoNFSe();
  ShowAtencao('Relação de códigos do Regime Especial da Prefeitura' + sLineBreak + sLineBreak + DBEdit146.Hint);
end;

procedure TfrmCadEmpresa.SpeedButton1Click(Sender: TObject);
var
  vListaTmp: TStringList;
  I: Integer;
begin
  if not obEmpresa.dataSet.IsEmpty then
    if vDadosIni.PesqPros('BAS074', 'EDITANDO REGISTRO', '', 'EMPRESA',
      obEmpresa.dataSet.FieldByName('COD_EMPRESA').AsString, obEmpresa.buscas, true) then
    begin
      if obEmpresa.dataSet.FieldByName('ATIVO').AsInteger <> 1 then
        exit;
      inherited;
      if not obEmpresa.Edit then
        exit;

//      if obEmpresa.dataSet.FieldByName('DIGITOSEMP').AsInteger <= 0 then
//      begin
//        for I := 0 to DBComboBox60.Items.Count - 1 do
//          if DBComboBox60.Items[I] = '1' then
//          begin
//            DBComboBox60.ItemIndex := I;
//            DBComboBox60.Text := DBComboBox60.Items[DBComboBox60.ItemIndex];
//            Break;
//          end;
//      end;

      if obEmpresa.dataSet.FieldByName('DIGITOSGRUP').AsInteger <= 0 then
      begin
        for I := 0 to DBComboBox59.Items.Count - 1 do
          if DBComboBox59.Items[I] = '3' then
          begin
            DBComboBox59.ItemIndex := I;
            DBComboBox59.Text := DBComboBox59.Items[DBComboBox59.ItemIndex];
            Break;
          end;
      end;

      Label216.Caption := 'Certificado Digital NFSe:';
      BitBtn13.Visible := True;
      

      Label216.Visible := False;
      DBEdit149.Visible := False;
      Label217.Visible := False;
      DBEdit151.Visible := False;
      Label222.Visible := False;
      DBEdit155.Visible := False;
      BitBtn13.Visible := False;

//      if obEmpresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger = 3127701 then
//        Label222.Caption := 'Senha SIGISS:'
//      else
      if Trim(LowerCase(IniConf.FileReadStr('Cidades', obEmpresa.fstr('ibge_cod_cidade'), 'Provedor'))) = 'issdigital' then
      begin
        Label222.Caption := 'Senha ISSDigital:';
        Label216.Caption := 'Frase secreta:';
        BitBtn13.Visible := False;
        Label222.Visible := True;
        Label216.Visible := True;
        DBEdit149.Visible := True;
        DBEdit155.Visible := True;
      end
      else
        Label222.Caption := 'Licença FlexDocs:';
      //Label222.Caption := IfThen(obEmpresa.dataSet.FieldByName('IBGE_COD_CIDADE').AsInteger = 3127701, 'Senha SIGISS:', 'Licença FlexDocs:');
      ListBox2.Items.Text := obEmpresa.dataSet.FieldByName('PRE_NOTA_TRANSF_CNPJ').AsString;
      ListBox3.Items.Text := obEmpresa.dataSet.FieldByName('PRE_NOTA_TRANSF_CFOP').AsString;
      ListBoxCtrPlano.Items.Text := obEmpresa.dataSet.FieldByName('CTR_PLANO_VEIC').AsString;
      vListaTmp := TStringList.Create;
      vListaTmp := vDadosIni.Split(
        vDadosIni.retornoPorCondicao(Copy(obEmpresa.dataSet.FieldByName('NFE_AUTXML').AsString,1,1) = '|',
          Copy(obEmpresa.dataSet.FieldByName('NFE_AUTXML').AsString,2,Length(obEmpresa.dataSet.FieldByName('NFE_AUTXML').AsString)),
          obEmpresa.dataSet.FieldByName('NFE_AUTXML').AsString));
      lbxAutXML.Items.Text := vListaTmp.Text;
      vListaTmp.Free;
      vListaTmp := nil;

      LoadRegimeEspecialTributacaoNFSe();

      DBEdit1.ReadOnly := True;
      PageControl1.ActivePage := TabSheet1;
      TabSheet3.TabVisible := true;
      PageControl3.ActivePage := TabSheet3;
      if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      	DBEdit1.SetFocus;
      obEmpresa.vUF.abreUF;
      obEmpresa.vTx.abreTaxaJuros;
      obEmpresa.vCabNF.abreCabNF;
      obEmpresa.AbreTipoPreco;
      BuscarDadosAgendaOficina;
      ListBox1.Items.Text := obEmpresa.sTipoPreco.Text;
      //      ListBox1.Items.Add(obEmpresa.sTipoPreco[0]);
      //      ListBox1.Items.Add(obEmpresa.sTipoPreco[1]);
      //      ListBox1.Items.Add(obEmpresa.sTipoPreco[2]);
      if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      	DBEdit2.SetFocus;
    end;
end;

procedure TfrmCadEmpresa.SpeedButton22Click(Sender: TObject);
begin
  inherited;
  TForm(pnSubstitutoTributario.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadEmpresa.SpeedButton25Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS078', 'ABRIR A LIXEIRA', '', 'EMPRESA', '', obEmpresa.buscas, true) then
  begin
    inherited;
    if not obEmpresa.AbrirLixeira then
    begin
      SpeedButton2.Hint := 'Enviar para Lixeira -  [BAS076]';
      SpeedButton1.Visible := true;
      SpeedButton5.Visible := false;
    end
    else
    begin
      SpeedButton2.Hint := 'Excluir registro permanentemente -  [BAS075]';
      SpeedButton1.Visible := false;
      SpeedButton5.Visible := true;
    end;
  end;
end;

procedure TfrmCadEmpresa.SpeedButton2Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS075', '', '', 'EMPRESA', '', obEmpresa.buscas, true) then
  begin
    inherited;
    obEmpresa.Delete;
    if obEmpresa.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
end;

procedure TfrmCadEmpresa.SpeedButton3Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS081', 'IMPRIMIR', '', 'EMPRESA', '', obEmpresa.buscas, true) then
  begin
    inherited;
    QuickRep1.Preview;
  end;
end;

procedure TfrmCadEmpresa.SpeedButton55Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('emp_%', obEmpresa.buscas);
end;

procedure TfrmCadEmpresa.SpeedButton5Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS077', '', '', 'EMPRESA', '', obEmpresa.buscas, false) then
  begin
    inherited;
    obEmpresa.restauraLixeira;
    if obEmpresa.StatusLixeira then
      SpeedButton25.Visible := true
    else
      SpeedButton25.Visible := false;
  end;
end;

procedure TfrmCadEmpresa.SpeedButton6Click(Sender: TObject);
begin
  if vDadosIni.PesqPros('BAS082', 'ABRIR', '', 'EMPRESA_SUBSTITUTO', '', obEmpresa.buscas, True)
    then
  begin
    inherited;
    obEmpresa.abreFormSubstitutoTributario;
  end;
end;

procedure TfrmCadEmpresa.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if Trim(vDadosIni.vNomeUsuario) <> 'HW' then
    raise exception.Create('Apenas usuário HW tem acesso a esta funcionalidade');

  if vDadosIni.vNivel < 10 then
    raise exception.Create('Nível não permitido para o usuário. Apenas nível 10');

  if obEmpresa.vAcessoCad.iniciaAcessos then
  begin
    PageControl1.ActivePage := tsCadastrosAcess;

  end;
end;

procedure TfrmCadEmpresa.SpeedButton8Click(Sender: TObject);
var
  dna: TBasicosFormularios;
begin
  if not vDadosIni.PesqPros('BAS083', 'ABRIR', '', 'APURACAO_DEPTO', '', obEmpresa.buscas, True) then
    Exit;
  inherited;
  dna.cadDNDEmpresa;
end;

procedure TfrmCadEmpresa.SpeedButton9Click(Sender: TObject);
begin
  if ListBox1.ItemIndex = -1 then
    ListBox1.Selected[0]
  else if (ListBox1.ItemIndex > 0) then
    ListBox1.Items.Move(ListBox1.ItemIndex, ListBox1.ItemIndex - 1);

end;

procedure TfrmCadEmpresa.TabSheet25Show(Sender: TObject);
begin
  inherited;
  Label240.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

end.

