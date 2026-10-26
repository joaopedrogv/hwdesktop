unit uCadEstMotosCCIA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, UClassesVeiculosCCIA, UClassesClientes, 
  DB, uEditMoeda, uEditHw, DBClient, Spin, IBDatabase;

type
  TfrmEstMotosCCIA = class(TfrmCadPadraoM)
    TabSheet_Dados: TTabSheet;
    ScrollBox4: TScrollBox;
    GroupBox4: TGroupBox;
    TabSheet_Pendencias: TTabSheet;
    ScrollBox7: TScrollBox;
    TabSheet_Despesas: TTabSheet;
    ScrollBox8: TScrollBox;
    TabSheet_Notas: TTabSheet;
    ScrollBox9: TScrollBox;
    GroupBox7: TGroupBox;
    TabSheet_Oficina: TTabSheet;
    ScrollBox10: TScrollBox;
    GroupBox6: TGroupBox;
    groupAvancadas: TGroupBox;
    TabSheet_Contratos: TTabSheet;
    ScrollBox6: TScrollBox;
    GroupBox5: TGroupBox;
    BitBtn13: TBitBtn;
    BitBtn16: TBitBtn;
    groupAdicional: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    ComboBox11: TComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    ComboBox12: TComboBox;
    GroupBox28: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    DBGridCTRS: TDBGrid;
    Panel5: TPanel;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    Panel14: TPanel;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    PageControl2: TPageControl;
    TabSheet6: TTabSheet;
    GroupBox23: TGroupBox;
    Label11: TLabel;
    DBText1: TDBText;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn12: TBitBtn;
    Panel13: TPanel;
    DBGrid9: TDBGrid;
    TabSheet7: TTabSheet;
    GroupBox24: TGroupBox;
    Label71: TLabel;
    DBText2: TDBText;
    BitBtn11: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    Panel12: TPanel;
    DBGrid7: TDBGrid;
    GroupBox16: TGroupBox;
    Label33: TLabel;
    Label37: TLabel;
    Label66: TLabel;
    Label68: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label34: TLabel;
    Label75: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label92: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label70: TLabel;
    Label6: TLabel;
    Label63: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label25: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit31: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox7: TDBLookupComboBox;
    DBLookupComboBox8: TDBLookupComboBox;
    DBLookupComboBox9: TDBLookupComboBox;
    DBEdit8: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit43: TDBEdit;
    DBComboBox2: TDBComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    DBComboBox3: TDBComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit10: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBComboBox5: TDBComboBox;
    DBComboBox6: TDBComboBox;
    GroupBox19: TGroupBox;
    ckTransito: TCheckBox;
    ckVivo: TCheckBox;
    ckMorto: TCheckBox;
    ckEstacionamento: TCheckBox;
    tsStatusVeiculo: TTabSheet;
    Label27: TLabel;
    DBComboBox7: TDBComboBox;
    pnStatusVeiculo: TPanel;
    Panel16: TPanel;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    GroupBox8: TGroupBox;
    Panel11: TPanel;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    GroupBox9: TGroupBox;
    Panel15: TPanel;
    BitBtn29: TBitBtn;
    BitBtn20: TBitBtn;
    DBGridNFS: TDBGrid;
    Panel10: TPanel;
    GroupBox20: TGroupBox;
    rbNomeFantasia: TRadioButton;
    rbRazaoSocial: TRadioButton;
    Panel17: TPanel;
    Panel18: TPanel;
    DBGridNFE: TDBGrid;
    DBGridCTRE: TDBGrid;
    Panel21: TPanel;
    Label38: TLabel;
    Panel22: TPanel;
    Label39: TLabel;
    GroupBox14: TGroupBox;
    Panel6: TPanel;
    DBGrid4: TDBGrid;
    Panel9: TPanel;
    GroupBox18: TGroupBox;
    Label62: TLabel;
    BitBtn_Alterar_Despesa: TBitBtn;
    BitBtn_Cancelar_Despesa: TBitBtn;
    BitBtn_Excluir_Despesa: TBitBtn;
    BitBtn_Salvar_Despesa: TBitBtn;
    BitBtn_Novo_Despesa: TBitBtn;
    EditMoedaSomaTotalDespesas: TEditMoeda;
    GroupBox15: TGroupBox;
    Label59: TLabel;
    Label32: TLabel;
    DBEdit_Valor_Despesa: TDBEdit;
    DBMemo_Despesa_Obs: TDBMemo;
    GroupBox25: TGroupBox;
    Label51: TLabel;
    Label52: TLabel;
    Label7: TLabel;
    DBEdit_Data_Despesa: TDBEdit;
    DBLookupComboBox_Fornecedor_Despesa: TDBLookupComboBox;
    DBLookupComboBox_Assunto_Despesa: TDBLookupComboBox;
    DBEdit_Assunto_Despesa: TDBEdit;
    DBEdit_Fornecedor_Despesa: TDBEdit;
    GroupBox12: TGroupBox;
    Panel7: TPanel;
    DBGrid3: TDBGrid;
    GroupBox17: TGroupBox;
    Label61: TLabel;
    EditMoedaSomaTotalPend: TEditMoeda;
    BitBtn_Novo_Pendencia: TBitBtn;
    BitBtn_Alterar_Pendencia: TBitBtn;
    BitBtn_Salvar_Pendencia: TBitBtn;
    BitBtn_Cancelar_Pendencia: TBitBtn;
    BitBtn_Excluir_Pendencia: TBitBtn;
    GroupBox13: TGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    DBEdit_DataPrevista_Pendencia: TDBEdit;
    DBLookupComboBox_Funcionario_Pendencia: TDBLookupComboBox;
    DBEdit_Valor_Pendencia: TDBEdit;
    DBComboBox_Status_Pendencia: TDBComboBox;
    GroupBox22: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    DBEdit_Data_Pendencia: TDBEdit;
    DBLookupComboBox_Assunto_Pendencia: TDBLookupComboBox;
    DBEdit_Descricao_Pendencia: TDBEdit;
    DBEdit_Assunto_Pendencia: TDBEdit;
    Label57: TLabel;
    DBLookupComboBox_Funcionario_Despesa: TDBLookupComboBox;
    Panel8: TPanel;
    Label10: TLabel;
    Panel26: TPanel;
    Label53: TLabel;
    Panel27: TPanel;
    RadioGroup1: TRadioGroup;
    checkConc: TCheckBox;
    BitBtn30: TBitBtn;
    Label54: TLabel;
    DBEdit12: TDBEdit;
    DBEdit17: TDBEdit;
    Label58: TLabel;
    Label60: TLabel;
    DBEdit19: TDBEdit;
    Label67: TLabel;
    DBEdit20: TDBEdit;
    Label69: TLabel;
    DBEdit21: TDBEdit;
    tsFaturaDesp: TTabSheet;
    pnFaturaDesp: TPanel;
    Panel42: TPanel;
    Label300: TLabel;
    DBText30: TDBText;
    Panel45: TPanel;
    BitBtn31: TBitBtn;
    BitBtn34: TBitBtn;
    GroupBox39: TGroupBox;
    Label301: TLabel;
    edFreteCondPag: TEditHw;
    edDataFrete: TMaskEdit;
    ckLancarFrete: TCheckBox;
    GroupBox40: TGroupBox;
    Panel47: TPanel;
    btSalvarFaturaEntrada: TBitBtn;
    edDocFaturaEntrada: TEdit;
    edValorFaturaEntrada: TEditHw;
    edVencimentoFaturaEntrada: TMaskEdit;
    ListBox3: TListBox;
    btAlterarFaturaEntrada: TBitBtn;
    btDetalheDespesa: TBitBtn;
    GroupBox41: TGroupBox;
    DBLookupComboBox6: TDBLookupComboBox;
    btGerarFaturaEntrada: TBitBtn;
    tsDetalheDespesa: TTabSheet;
    pnDetFatEnt: TPanel;
    Panel83: TPanel;
    Label401: TLabel;
    Label402: TLabel;
    Label403: TLabel;
    Label404: TLabel;
    Label405: TLabel;
    Label414: TLabel;
    Panel84: TPanel;
    DBGrid28: TDBGrid;
    BitBtn98: TBitBtn;
    BitBtn99: TBitBtn;
    BitBtn100: TBitBtn;
    Panel87: TPanel;
    Label418: TLabel;
    Label419: TLabel;
    Label420: TLabel;
    Label421: TLabel;
    Label422: TLabel;
    Label415: TLabel;
    DBText45: TDBText;
    DBText46: TDBText;
    Label416: TLabel;
    Label417: TLabel;
    DBEdit225: TDBEdit;
    DBLookupComboBox12: TDBLookupComboBox;
    DBEdit226: TDBEdit;
    BitBtn96: TBitBtn;
    BitBtn97: TBitBtn;
    DBEdit223: TDBEdit;
    DBEdit224: TDBEdit;
    DBEdit227: TDBEdit;
    DBEdit228: TDBEdit;
    DBLookupComboBox11: TDBLookupComboBox;
    Panel88: TPanel;
    BitBtn94: TBitBtn;
    BitBtn95: TBitBtn;
    GroupBox26: TGroupBox;
    Edit3: TEdit;
    EditHw1: TEditHw;
    edcreditoQtdeParcelas: TSpinEdit;
    Label74: TLabel;
    btGerar: TBitBtn;
    dsDesp: TDataSource;
    DBLookupComboBox13: TDBLookupComboBox;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    DBLookupComboBox14: TDBLookupComboBox;
    DBLookupComboBox15: TDBLookupComboBox;
    Label72: TLabel;
    Label73: TLabel;
    EditHw2: TEditHw;
    EditHw3: TEditHw;
    DBEdit22: TDBEdit;
    cdsDesp: TClientDataSet;
    cdsDespNumConta: TFloatField;
    cdsDespDepartamento: TStringField;
    cdsDespValor: TCurrencyField;
    cdsDespDataReferencia: TDateField;
    cdsDespHistorico: TStringField;
    cdsDespNumDoc: TStringField;
    cdsDespControles: TIntegerField;
    cdsDespNomeControle: TStringField;
    cdsDespTipoDespesa: TIntegerField;
    cdsDespCodFornecedor: TIntegerField;
    cdsDespDataVenc: TDateField;
    Label84: TLabel;
    DBEdit23: TDBEdit;
    cdsDespNChq: TStringField;
    cdsDespContrBanc: TStringField;
    btApagarDesp: TBitBtn;
    Label55: TLabel;
    DBEdit24: TDBEdit;
    cdsDespNominalChq: TStringField;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    Panel31: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    GroupBox27: TGroupBox;
    DBGridOrcamento: TDBGrid;
    GroupBox29: TGroupBox;
    Panel4: TPanel;
    Label40: TLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Panel23: TPanel;
    DBGridOficina: TDBGrid;
    Panel32: TPanel;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    cbReserva: TComboBox;
    cbDemonstracao: TComboBox;
    cbCancelado: TComboBox;
    cbUsadoTroca: TComboBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    tsEstoque: TTabSheet;
    PnEstoque: TPanel;
    Panel34: TPanel;
    Panel33: TPanel;
    Label23: TLabel;
    Panel36: TPanel;
    Label26: TLabel;
    Panel37: TPanel;
    Label31: TLabel;
    Panel24: TPanel;
    Label41: TLabel;
    Panel19: TPanel;
    Label35: TLabel;
    Panel38: TPanel;
    Label48: TLabel;
    Panel20: TPanel;
    Label36: TLabel;
    Panel25: TPanel;
    Label42: TLabel;
    Panel39: TPanel;
    Label56: TLabel;
    btPosicao: TSpeedButton;
    btStatus: TSpeedButton;
    ckNovo: TCheckBox;
    ckUsado: TCheckBox;
    imgInformationTipoOP: TImage;
    checkEstoqueReal: TCheckBox;
    GroupBoxNFE: TGroupBox;
    ScrollBoxNFE: TScrollBox;
    GroupBoxNFS: TGroupBox;
    ScrollBoxNFS: TScrollBox;
    PopupMenuNFE: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    PopupMenuNFS: TPopupMenu;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    PopupMenuCTRE: TPopupMenu;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    PopupMenuCTRS: TPopupMenu;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    PopupMenuORC: TPopupMenu;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    PopupMenuOS: TPopupMenu;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    GroupBoxCTRE: TGroupBox;
    ScrollBoxCTRE: TScrollBox;
    GroupBoxCTRS: TGroupBox;
    ScrollBoxCTRS: TScrollBox;
    GroupBoxORC: TGroupBox;
    ScrollBoxORC: TScrollBox;
    GroupBoxOS: TGroupBox;
    ScrollBoxOS: TScrollBox;
    BitBtn120: TBitBtn;
    BitBtn36: TBitBtn;
    Panel35: TPanel;
    Label24: TLabel;
    BitBtn37: TBitBtn;
    BitBtn38: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    BitBtn41: TBitBtn;
    GroupBox21: TGroupBox;
    Panel41: TPanel;
    btSituacaoTpOP: TSpeedButton;
    ckEstReal: TCheckBox;
    ckCons: TCheckBox;
    ckInter: TCheckBox;
    Panel43: TPanel;
    btSituacaoEst: TSpeedButton;
    Bevel2: TBevel;
    ckComEstoque: TCheckBox;
    ckSemEstoque: TCheckBox;
    TabSheet_NotasTransito: TTabSheet;
    GroupBox30: TGroupBox;
    Panel40: TPanel;
    GroupBox31: TGroupBox;
    DBGridNFT: TDBGrid;
    Panel44: TPanel;
    Label86: TLabel;
    BitBtn42: TBitBtn;
    Panel46: TPanel;
    GroupBoxNFT: TGroupBox;
    ScrollBoxNFT: TScrollBox;
    Panel48: TPanel;
    Label90: TLabel;
    PopupMenuNFT: TPopupMenu;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    ckDeposito: TCheckBox;
    BitBtn35: TBitBtn;
    BitBtn19: TBitBtn;
    Panel49: TPanel;
    Label22: TLabel;
    Label85: TLabel;
    ComboBox6: TComboBox;
    DBComboBox13: TDBComboBox;
    Label15: TLabel;
    DBEdit3: TDBEdit;
    Label91: TLabel;
    DBEdit6: TDBEdit;
    Label93: TLabel;
    DBEdit7: TDBEdit;
    TabSheet_MaisInformacoes: TTabSheet;
    ScrollBox5: TScrollBox;
    pnObservacao: TPanel;
    GroupBox32: TGroupBox;
    Label94: TLabel;
    Label95: TLabel;
    DBMemo_Observacoes: TDBMemo;
    DBMemo_Adicionais: TDBMemo;
    pnConfirmObs: TPanel;
    BitBtn43: TBitBtn;
    BitBtn44: TBitBtn;
    Label96: TLabel;
    DBMemo_Pendencia_Obs: TDBMemo;
    Label97: TLabel;
    DBEdit9: TDBEdit;
    Label98: TLabel;
    DBEdit16: TDBEdit;
    Label99: TLabel;
    DBEdit25: TDBEdit;
    Label100: TLabel;
    DBEdit29: TDBEdit;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    lbPosicaoVeic: TLabel;
    cbPosicaoVeic: TComboBox;
    btAlterarChassiPlaca: TSpeedButton;
    SpeedButton40: TSpeedButton;
    procedure SpeedButton40Click(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btAlterarChassiPlacaClick(Sender: TObject);
    procedure ComboBox12Enter(Sender: TObject);
    procedure ComboBox12Exit(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn44Click(Sender: TObject);
    procedure BitBtn43Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure MenuItem35Click(Sender: TObject);
    procedure MenuItem34Click(Sender: TObject);
    procedure MenuItem33Click(Sender: TObject);
    procedure MenuItem32Click(Sender: TObject);
    procedure MenuItem31Click(Sender: TObject);
    procedure DBGridNFTDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridNFTTitleClick(Column: TColumn);
    procedure DBGridNFTColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure ScrollBoxNFTExit(Sender: TObject);
    procedure ScrollBoxNFTEnter(Sender: TObject);
    procedure ckVivoClick(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn120Click(Sender: TObject);
    procedure MenuItem30Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem29Click(Sender: TObject);
    procedure MenuItem24Click(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem27Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem26Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure DBGridOficinaColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure DBGridOrcamentoColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure ScrollBoxOSExit(Sender: TObject);
    procedure ScrollBoxORCExit(Sender: TObject);
    procedure ScrollBoxOSEnter(Sender: TObject);
    procedure ScrollBoxORCEnter(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure ScrollBoxCTRSExit(Sender: TObject);
    procedure ScrollBoxCTREExit(Sender: TObject);
    procedure ScrollBoxCTRSEnter(Sender: TObject);
    procedure ScrollBoxCTREEnter(Sender: TObject);
    procedure DBGridCTRSColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure DBGridCTREColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure DBGridNFSColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure DBGridNFEColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure ScrollBoxNFSExit(Sender: TObject);
    procedure ScrollBoxNFEExit(Sender: TObject);
    procedure ScrollBoxNFSEnter(Sender: TObject);
    procedure ScrollBoxNFEEnter(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure checkConcClick(Sender: TObject);
    procedure checkEstoqueRealClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btSituacaoTpOPClick(Sender: TObject);
    procedure btSituacaoEstClick(Sender: TObject);
    procedure btStatusClick(Sender: TObject);
    procedure btPosicaoClick(Sender: TObject);
    procedure DBGridOrcamentoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton23Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure DBGrid4TitleClick(Column: TColumn);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure btApagarDespClick(Sender: TObject);
    procedure DBEdit228Exit(Sender: TObject);
    procedure DBGrid28TitleClick(Column: TColumn);
    procedure BitBtn100Click(Sender: TObject);
    procedure BitBtn98Click(Sender: TObject);
    procedure BitBtn99Click(Sender: TObject);
    procedure DBLookupComboBox15Exit(Sender: TObject);
    procedure DBLookupComboBox14Exit(Sender: TObject);
    procedure EditHw2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHw3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditHw3Exit(Sender: TObject);
    procedure EditHw2Exit(Sender: TObject);
    procedure BitBtn97Click(Sender: TObject);
    procedure BitBtn96Click(Sender: TObject);
    procedure btGerarClick(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn94Click(Sender: TObject);
    procedure BitBtn95Click(Sender: TObject);
    procedure btSalvarFaturaEntradaClick(Sender: TObject);
    procedure btAlterarFaturaEntradaClick(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure btDetalheDespesaClick(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridHistCTRDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridHistNFDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridHistOficinaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridNFEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridOficinaTitleClick(Column: TColumn);
    procedure DBGridCTRSTitleClick(Column: TColumn);
    procedure DBGridCTRETitleClick(Column: TColumn);
    procedure DBGridNFSTitleClick(Column: TColumn);
    procedure DBGridNFETitleClick(Column: TColumn);
    procedure rbNomeFantasiaClick(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBComboBox3Exit(Sender: TObject);
    procedure DBEdit18Exit(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton8Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure groupAdicionalExit(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit31KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit27KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit4Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit_Fornecedor_DespesaExit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit31Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PageControl3Change(Sender: TObject);
    procedure DBEdit_Assunto_DespesaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit_Assunto_PendenciaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit_Fornecedor_DespesaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn_Excluir_DespesaClick(Sender: TObject);
    procedure BitBtn_Cancelar_DespesaClick(Sender: TObject);
    procedure BitBtn_Salvar_DespesaClick(Sender: TObject);
    procedure BitBtn_Alterar_DespesaClick(Sender: TObject);
    procedure BitBtn_Novo_DespesaClick(Sender: TObject);
    procedure BitBtn_Excluir_PendenciaClick(Sender: TObject);
    procedure BitBtn_Cancelar_PendenciaClick(Sender: TObject);
    procedure BitBtn_Salvar_PendenciaClick(Sender: TObject);
    procedure BitBtn_Alterar_PendenciaClick(Sender: TObject);
    procedure BitBtn_Novo_PendenciaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
    function _atualizarCombobox: Boolean;
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;

  private
  	vCriou: Smallint;
    cdsColunasNFE, cdsColunasNFS, cdsColunasNFT, cdsColunasCTRE, cdsColunasCTRS, cdsColunasORC, cdsColunasOS: TClientDataSet;
    trans: TIBTransaction;
    vCheck: TCheckBox;
    vTabela, vCampoPadrao, vAlterarNomeDtSet: string;
    fReset: boolean;
    procedure _HabilitarCamposPendencia;
    procedure _HabilitarCamposDespesa;
    procedure _DesabilitarCamposPendencia;
    procedure _DesabilitarCamposDespesa;
    procedure _buscarInfModelo;
    procedure getFaturas;
    procedure ConfigurarForm(pValor: string);
    { Private declarations }
  public
        procedure _DesabilitaCampos;
    function _SomarValoresGridPendencia(): Double;
    function _SomarValoresGridDespesa(): Double;
    procedure AtualizarHistorico(pAtualizar: boolean = False; pAtualizarTudo: boolean = False);
    { Public declarations }
  end;

var
  frmEstMotosCCIA: TfrmEstMotosCCIA;
  EstMoto: TEstMotoCCIA;
  vCampoAdcional: string;
  vCondAdcional: string;
  vSqlAdcional: string;
  vAbilitar: Boolean;
  vRecNo: Integer;
  vAgruparHist: string;

implementation

uses
  uDtmAtivo, UDtmVeiculosCCIA, ConsultasU, UClassesCadastrosBasicos, uClassesNotasFiscais,
  uDadosIni, uDataSet_OOP, IniFiles, Registry;

{$R *.dfm}

procedure TfrmEstMotosCCIA.AtualizarHistorico(pAtualizar: boolean = False; pAtualizarTudo: boolean = False);
var
  pChassi, pPlaca: string;
begin
  pChassi := trim(EstMoto.dataSet.FieldByName('CHASSI_C').AsString);
  pPlaca := trim(EstMoto.dataSet.FieldByName('PLACAEST').AsString);
  if (PageControl3.ActivePage = TabSheet_Contratos) or pAtualizarTudo then
  begin
     if EstMoto.vHistCTRE.dataSet.IsEmpty or pAtualizar or pAtualizarTudo then
     begin
       EstMoto.vHistCTRE.buscarHist(pChassi, pPlaca, 'CTR', 'E', rbRazaoSocial.Checked, vAgruparHist);
       EstMoto.vHistCTRE.dataSet.IndexFieldNames := 'DATA;COD_HIST';
       DBGridCTRE.DataSource.DataSet.Last;
     end;
     if EstMoto.vHistCTRS.dataset.IsEmpty or pAtualizar or pAtualizarTudo then
     begin
       EstMoto.vHistCTRS.buscarHist(pChassi, pPlaca, 'CFT', 'S', rbRazaoSocial.Checked, vAgruparHist);
       EstMoto.vHistCTRS.dataSet.IndexFieldNames := 'DATA;COD_HIST';
       DBGridCTRS.DataSource.DataSet.Last;
     end;
  end;
  if (PageControl3.ActivePage = TabSheet_Notas) or pAtualizarTudo then
  begin
     if EstMoto.vHistNFE.dataSet.IsEmpty or pAtualizar or pAtualizarTudo then
     begin
       EstMoto.vHistNFE.buscarHist(pChassi, pPlaca, 'NF', 'E', rbRazaoSocial.Checked, vAgruparHist);
       EstMoto.vHistNFE.dataSet.IndexFieldNames := 'DATA;COD_HIST';
       DBGridNFE.DataSource.DataSet.Last;
     end;

     if EstMoto.vHistNFS.dataSet.IsEmpty or pAtualizar or pAtualizarTudo then
     begin
       EstMoto.vHistNFS.buscarHist(pChassi, pPlaca, 'NF', 'S', rbRazaoSocial.Checked, vAgruparHist);
       EstMoto.vHistNFS.dataSet.IndexFieldNames := 'DATA;COD_HIST';
       DBGridNFS.DataSource.DataSet.Last;
     end;
  end;
  if (PageControl3.ActivePage = TabSheet_Oficina) or pAtualizarTudo then
  begin
     if EstMoto.vHistORC.dataSet.IsEmpty or pAtualizar or pAtualizarTudo then
     begin
       EstMoto.vHistORC.buscarHist(pChassi, pPlaca, 'ORC', 'S', rbRazaoSocial.Checked, vAgruparHist);
       EstMoto.vHistORC.dataSet.IndexFieldNames := 'DATA;COD_HIST';
       DBGridOrcamento.DataSource.DataSet.Last;
     end;

     if EstMoto.vHistOS.dataSet.IsEmpty or pAtualizar or pAtualizarTudo then
     begin
       EstMoto.vHistOS.buscarHist(pChassi, pPlaca, 'OS', 'S', rbRazaoSocial.Checked, vAgruparHist);
       EstMoto.vHistOS.dataSet.IndexFieldNames := 'DATA;COD_HIST';
       DBGridOficina.DataSource.DataSet.Last;
     end;
  end;
  if (PageControl3.ActivePage = TabSheet_NotasTransito) or pAtualizarTudo then
  begin
     if EstMoto.vHistNFT.dataSet.IsEmpty or pAtualizar or pAtualizarTudo then
     begin
       EstMoto.vHistNFT.buscarHist(pChassi, pPlaca, 'NF', 'T', rbRazaoSocial.Checked, vAgruparHist);
       EstMoto.vHistNFT.dataSet.IndexFieldNames := 'DATA;COD_HIST';
       DBGridNFT.DataSource.DataSet.Last;
     end;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn100Click(Sender: TObject);
begin
  inherited;
  cdsDesp.Delete;
end;

procedure TfrmEstMotosCCIA.BitBtn10Click(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;

     if DBGridOficina.DataSource.DataSet.IsEmpty then
      exit;
//     if _mdiAberto('TFrmCadPedVenda', 'O modulo de Venda se encontra aberto!') then
       EstMoto.vHistOS.ImprimirPedVenda(
       	DBGridOficina.DataSource.DataSet.FieldByName('NUMDOC').AsInteger,
        DBGridOficina.DataSource.DataSet.FieldByName('TIPO').AsString);
   finally
     vDadosIni.vPesquisa := '';
     Screen.Cursor := crDefault;
   end;
end;

procedure TfrmEstMotosCCIA.BitBtn120Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    AtualizarHistorico(true, true);
    vDadosIni.montarExcel(DBGridNFE, 'Notas Fiscal de Entrada', 'A');
    vDadosIni.montarExcel(DBGridNFS, 'Nota Fiscais de Saída', 'N');
    vDadosIni.montarExcel(DBGridNFT, 'Nota Fiscais em Trânsito', 'N');
    vDadosIni.montarExcel(DBGridCTRE, 'Contrato de Entrada', 'N');
    if (vDadosIni.vEmp.vTipoEmpVeiculos <> 'C') then
      vDadosIni.montarExcel(DBGridCTRS, 'Contrato de Saída', 'N')
    else
      vDadosIni.montarExcel(DBGridCTRS, 'Comando de Faturamento', 'N');
    vDadosIni.montarExcel(DBGridOrcamento, 'Orçamento', 'N');
    vDadosIni.montarExcel(DBGridOficina, 'Ordem de Serviço', 'F');
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn17Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if DBGridOrcamento.DataSource.DataSet.IsEmpty then
      exit;
//    if _mdiAberto('TFrmCadPedVenda', 'O modulo de Venda se encontra aberto!') then
      EstMoto.vHistORC.abrirPedVenda(
      	DBGridOrcamento.DataSource.DataSet.FieldByName('NUMDOC').AsInteger,
        DBGridOrcamento.DataSource.DataSet.FieldByName('TIPO').AsString);
  finally
    PageControl3Change(Sender);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn18Click(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;

     if DBGridOrcamento.DataSource.DataSet.IsEmpty then
      exit;
//     if _mdiAberto('TFrmCadPedVenda', 'O modulo de Venda se encontra aberto!') then
       EstMoto.vHistORC.ImprimirPedVenda(
       	DBGridOrcamento.DataSource.DataSet.FieldByName('NUMDOC').AsInteger,
        DBGridOrcamento.DataSource.DataSet.FieldByName('TIPO').AsString);
   finally
     vDadosIni.vPesquisa := '';
     Screen.Cursor := crDefault;
   end;
end;

procedure TfrmEstMotosCCIA.BitBtn19Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn19.CanFocus) then
    BitBtn19.SetFocus;

  if not EstMoto.existeTipoOpVeiculo(trim(DBComboBox13.Text)) then
    exit;

  TForm(PnEstoque.Parent).ModalResult := IDOK;
end;

procedure TfrmEstMotosCCIA.BitBtn1Click(Sender: TObject);
var
 I: Integer;
begin
  try
    if not vDadosIni.PesqPros('VEI058', 'CONSULTA', '', 'EST_MOTO', '', EstMoto.buscas, true) then
      Exit;

    EstMoto.vCons.campo := ComboBox1.Text;
    EstMoto.vCons.ordem := ComboBox2.Text;
    EstMoto.vCons.condicao := ComboBox3.Text;
    EstMoto.vCons.valor := MaskEdit3.Text;
    EstMoto.vCons.dataIni := MaskEdit1.Text;
    EstMoto.vCons.dataFim := MaskEdit2.Text;
    EstMoto.vCons.porData := MaskEdit1.Visible;

    EstMoto.vCons.avancada := CheckBox3.Checked;
    EstMoto.vCons.adicional := CheckBox1.Checked;
    if (not ckNovo.Checked) and (not ckUsado.Checked) and (not ckDeposito.Checked) then
      ckNovo.Checked := True;
    if (not ckVivo.Checked) and (not ckTransito.Checked) and (not ckEstacionamento.Checked) and (not ckMorto.Checked) then
      ckVivo.Checked := True;
    if ckNovo.Enabled then
      EstMoto.vCons.novo := ckNovo.Checked
    else
      EstMoto.vCons.novo := False;
    if ckUsado.Enabled then
      EstMoto.vCons.usado := ckUsado.Checked
    else
      EstMoto.vCons.usado := False;
    if ckComEstoque.Enabled then
      EstMoto.vCons.comEstoque := ckComEstoque.Checked
    else
      EstMoto.vCons.comEstoque := False;
    if ckSemEstoque.Enabled then
      EstMoto.vCons.semEstoque := ckSemEstoque.Checked
    else
      EstMoto.vCons.semEstoque := False;
    if ckEstReal.Enabled then
      EstMoto.vCons.EstoqueReal := ckEstReal.Checked
    else
      EstMoto.vCons.EstoqueReal := False;
    if ckCons.Enabled then
      EstMoto.vCons.Consignado := ckCons.Checked
    else
      EstMoto.vCons.Consignado := False;
    if ckInter.Enabled then
      EstMoto.vCons.Intermediacao := ckInter.Checked
    else
      EstMoto.vCons.Intermediacao := False;
    EstMoto.vCons.transfdeposito := ckDeposito.Checked;
    if cbDemonstracao.Enabled then
      EstMoto.vCons.demonstracao := cbDemonstracao.Text
    else
      EstMoto.vCons.demonstracao := '';
    if cbReserva.Enabled then
      EstMoto.vCons.reserva := cbReserva.Text
    else
      EstMoto.vCons.reserva := '';
    if cbUsadoTroca.Enabled then
      EstMoto.vCons.usadotroca := cbUsadoTroca.Text
    else
      EstMoto.vCons.usadotroca := '';
    if cbCancelado.Enabled then
      EstMoto.vCons.canc := cbCancelado.Text
    else
      EstMoto.vCons.canc := '';
    EstMoto.vCons.campoAd := ComboBox11.Text;
    EstMoto.vCons.valorAd := MaskEdit7.Text;
    EstMoto.vCons.dataIniAd := MaskEdit9.Text;
    EstMoto.vCons.dataFimAd := MaskEdit8.Text;
    EstMoto.vCons.condicaoAd := ComboBox12.Text;
    EstMoto.vCons.porDataAd := MaskEdit9.Visible;
    if ckVivo.Enabled then
      EstMoto.vCons.vivo := ckVivo.Checked
    else
      EstMoto.vCons.vivo := False;
    if ckMorto.Enabled then
      EstMoto.vCons.morto := ckMorto.Checked
    else
      EstMoto.vCons.morto := False;
    if ckEstacionamento.Enabled then    
      EstMoto.vCons.estacionamento := ckEstacionamento.Checked
    else
      EstMoto.vCons.estacionamento := False;
    if ckTransito.Enabled then
      EstMoto.vCons.transito := ckTransito.Checked
    else
      EstMoto.vCons.transito := False;
    EstMoto.vCons.posicaoAND_OU := btPosicao.Caption;
    EstMoto.vCons.statusAND_OU := btStatus.Caption;
    EstMoto.vCons.situacaoEstAND_OU := btSituacaoEst.Caption;
    EstMoto.vCons.situacaoTPOPAND_OU := btSituacaoTpOP.Caption;

    Screen.Cursor := crHourGlass;
    if CheckBox3.Checked then
      if (not ckVivo.Checked) and (not ckTransito.Checked) and (not ckEstacionamento.Checked) and (not ckMorto.Checked) then
      begin
        Application.MessageBox(Pchar('Favor informar a posição para realizar a consulta!'), 'Aviso', MB_OK +  MB_ICONEXCLAMATION + MB_DEFBUTTON1);
        Screen.Cursor := crDefault;
        if (Self.Enabled) and (Self.Visible) and (GroupBox19.CanFocus) then
          GroupBox19.SetFocus;
        exit;
      end;
    inherited;
    EstMoto.consulta;
    if EstMoto.dataSet.Active then
      for I := 0 to DBGrid1.Columns.Count - 1 do
        if DBGrid1.Columns[i].FieldName = 'OBS_RES' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

    if not EstMoto.IsEmpty then         
     if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
       DBGrid1.SetFocus;
  finally
    gravaConfiguracoesFormRegistro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn20Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if DBGridNFS.DataSource.DataSet.IsEmpty then
      exit;
    if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
     try
       vNf := TNFCab.create;
       vNf.selecionaNotaFiscal(DBGridNFS.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
       if DBGridNFS.DataSource.DataSet.FieldByName('emissao_propria').AsString = 'S' then
         vNf.imprimeNotaFiscal
       else
         vNf.imprimeEspelhoNF;
     finally
       vNf.Free;
     end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn21Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if DBGridCTRE.DataSource.DataSet.IsEmpty then
    exit;

    if _mdiAberto('TfrmMovVeiculosCCIA', 'O modulo de Comando/Contrato se encontra aberto!') then
       EstMoto.vHistCTRE.abrirComFat(DBGridCTRE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);

  finally
    AtualizarHistorico(true);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn22Click(Sender: TObject);
var
  vComFatEstMoto: TComFat;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if DBGridCTRE.DataSource.DataSet.IsEmpty then
      exit;

    try
     vComFatEstMoto := TComFat.create;
     vComFatEstMoto.abreComFat(DBGridCTRE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
     if not (vComFatEstMoto.dataSet.State in [dsInsert, dsEdit]) then
        vComFatEstMoto.Edit;
     vComFatEstMoto.ImprimirContratoComando;
     vComFatEstMoto.dataSet.Cancel;
    finally
       vComFatEstMoto.Free;
    end;
   finally
     AtualizarHistorico(true);
     Screen.Cursor := crDefault;
   end;
end;

procedure TfrmEstMotosCCIA.BitBtn23Click(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;

     if DBGridCTRS.DataSource.DataSet.IsEmpty then
      exit;

     if _mdiAberto('TfrmMovVeiculosCCIA', 'O modulo de Comando/Contrato se encontra aberto!') then
       EstMoto.vHistCTRS.abrirComFat(DBGridCTRS.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
   finally
      AtualizarHistorico(true);
      Screen.Cursor := crDefault;
   end;
end;

procedure TfrmEstMotosCCIA.BitBtn24Click(Sender: TObject);
var
  vComFatEstMoto: TComFat;
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;

     if DBGridCTRS.DataSource.DataSet.IsEmpty then
      exit;
     if trim(DBGridCTRS.DataSource.DataSet.FieldByName('TIPO').AsString) = 'CFT' then
       if not _mdiAberto('TfrmMovVeiculosCCIA', 'O modulo de Comando/Contrato se encontra aberto!') then
         exit;

     try
       vComFatEstMoto := TComFat.create;
       vComFatEstMoto.abreComFat(DBGridCTRS.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
       if not (vComFatEstMoto.dataSet.State in [dsInsert, dsEdit]) then
         vComFatEstMoto.Edit;
       vComFatEstMoto.ImprimirContratoComando;
       vComFatEstMoto.dataSet.Cancel;
     finally
       vComFatEstMoto.Free;
     end;
   finally
	   AtualizarHistorico(true);
     Screen.Cursor := crDefault;
   end;
end;

procedure TfrmEstMotosCCIA.BitBtn25Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
   try
    Screen.Cursor := crHourGlass;

    if DBGridNFE.DataSource.DataSet.IsEmpty then
      exit;
    if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
      try
        vNf := TNFCab.create;
        vNf.cadAbrirNfIntegracao(DBGridNFE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
      finally
        vNf.Free;
      end;
    end;
   finally
     AtualizarHistorico(true);
     Screen.Cursor := crDefault;
   end;
end;

procedure TfrmEstMotosCCIA.BitBtn26Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
   try
     Screen.Cursor := crHourGlass;

     if DBGridNFE.DataSource.DataSet.IsEmpty then
      exit;
     if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
     begin
       try
         vNf := TNFCab.create;
         vNf.selecionaNotaFiscal(DBGridNFE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
         if DBGridNFE.DataSource.DataSet.FieldByName('emissao_propria').AsString = 'S' then
           vNf.imprimeNotaFiscal
         else
           vNf.imprimeEspelhoNF;
       finally
         vNf.Free;
       end;
     end;
   finally
     Screen.Cursor := crDefault;
   end;
end;

procedure TfrmEstMotosCCIA.BitBtn27Click(Sender: TObject);
begin
  TForm(pnStatusVeiculo.Parent).ModalResult := IDOK;
end;

procedure TfrmEstMotosCCIA.BitBtn28Click(Sender: TObject);
begin
  inherited;
  TForm(pnStatusVeiculo.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmEstMotosCCIA.BitBtn29Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if DBGridNFS.DataSource.DataSet.IsEmpty then
     exit;

    if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
      try
        vNf := TNFCab.create;
        vNf.cadAbrirNfIntegracao(DBGridNFS.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
      finally
        vNf.Free;
      end;
    end;
  finally
    AtualizarHistorico(true);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn30Click(Sender: TObject);
begin
  inherited;
  if not EstMoto.abreFormStatusVeiculo(vAbilitar) then
     exit;

  if RadioGroup1.ItemIndex = 0 then
    EstMoto.dataSet.FieldByName('TIPV_VEICULO').AsString := 'V'
  else if RadioGroup1.ItemIndex = 1 then
    EstMoto.dataSet.FieldByName('TIPV_VEICULO').AsString := 'C'
  else if RadioGroup1.ItemIndex = 2 then
  begin
    EstMoto.dataSet.FieldByName('TIPV_VEICULO').AsString := 'I';
    EstMoto.dataSet.FieldByName('POSICAO').AsString := 'ESTACIONAMENTO';
  end;
  if checkConc.Checked then
    EstMoto.dataSet.FieldByName('ESTOQUE').AsString := 'C'
  else if checkEstoqueReal.Checked then
    EstMoto.dataSet.FieldByName('ESTOQUE').AsString := 'P'
  else
    EstMoto.dataSet.FieldByName('ESTOQUE').Value := Null;

  _atualizarCombobox;  
end;

procedure TfrmEstMotosCCIA.BitBtn31Click(Sender: TObject);
var
 pValorItens: Extended;
 I: Integer;
begin
  inherited;
  pValorItens := 0;

  if ListBox3.Items.Count <= 0 then
  begin
    Application.MessageBox(Pchar('Nenhuma Parcela encontrada!'), 'Aviso', MB_OK +  MB_ICONEXCLAMATION + MB_DEFBUTTON1);
    exit;
  end;

  for I := 0 to Length(EstMoto.vDespesaVeic.FDespesas.numeroDocumento) - 1 do
    pValorItens := pValorItens + EstMoto.vDespesaVeic.FDespesas.valorDocumento[I];

  if (vDadosIni.StrToFloatFormat(pValorItens, 2) > 0) and (vDadosIni.StrToFloatFormat(pValorItens, 2) <>  vDadosIni.StrToFloatFormat(EditHw1.AsValue, 2)) then
  begin
   Application.MessageBox(Pchar('Valor total do parcelamento = '''+ 'R$ ' + FormatFloat('0.00', pValorItens) + '''' + #13 +
      'Valor total das despesas = '''+ 'R$ ' +FormatFloat('0.00', EditHw1.AsValue) + '''' + #13 +
      'Favor conferir!'), 'Aviso', MB_OK +  MB_ICONEXCLAMATION + MB_DEFBUTTON1);
     exit;
  end;


//  EstMoto.vDespesaVeic.dataSet.FieldByName('COD_TP_DESPESA').AsInteger := cdsDesp.FieldByName('TipoDespesa').AsInteger;
//  EstMoto.vDespesaVeic.dataSet.FieldByName('VALOR_DESPESA').AsFloat := pValorItens; //  cdsDesp.FieldByName('Valor').AsFloat;
//  EstMoto.vDespesaVeic.dataSet.FieldByName('COD_CLIENTE').AsInteger := cdsDesp.FieldByName('CodFornecedor').AsInteger;
//  EstMoto.vDespesaVeic.dataSet.FieldByName('COD_CONTROLE').AsInteger := cdsDesp.FieldByName('Controles').AsInteger;
//  EstMoto.vDespesaVeic.dataSet.FieldByName('N_DOC').AsString := trim(Edit3.Text); // cdsDesp.FieldByName('NumDoc').AsString;
//  EstMoto.vDespesaVeic.dataSet.FieldByName('STATUS_DESPESA').AsString := 'PENDENTE';
//  EstMoto.vDespesaVeic.dataSet.FieldByName('OBS').AsString := trim(ListBox3.Items.Text);
//  if not EstMoto.vDespesaVeic.Post then
//  begin
//    PageControl3.ActivePage := TabSheet_Despesas;
//    setFocusCampoErro(EstMoto.vDespesaVeic.vNomeCampoErro, EstMoto.vDespesaVeic.vMensagemErro);
//    exit;
//  end;

  EstMoto.vDespesaVeic.dataSet.FieldByName('VALOR_DESPESA').AsFloat := pValorItens;
  TForm(pnFaturaDesp.Parent).ModalResult := IDOK;
end;

procedure TfrmEstMotosCCIA.BitBtn32Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
   try
    Screen.Cursor := crHourGlass;

    if DBGridNFE.DataSource.DataSet.IsEmpty then
      exit;
    if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
      Application.MessageBox('Será aberto o módulo de Nota Fiscal. Faça a consulta da nota e efetue o Cancelamento ou a exclusão!',
        'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
      try
        vNf := TNFCab.create;
        EstMoto.vHistNFE.GravarCodNFdatasetTemp(DBGridNFE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
        vNf.cadAbrirNfIntegracaoCanc(DBGridNFE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
      finally
        vNf.Free;
      end;
    end;
   finally
     AtualizarHistorico(true);
     Screen.Cursor := crDefault;
   end;
end;

procedure TfrmEstMotosCCIA.BitBtn33Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
   try
    Screen.Cursor := crHourGlass;

    if DBGridNFS.DataSource.DataSet.IsEmpty then
      exit;
    if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
      Application.MessageBox('Será aberto o módulo de Nota Fiscal. Faça a consulta da nota e efetue o Cancelamento ou a exclusão!',
        'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
      try
        vNf := TNFCab.create;
        EstMoto.vHistNFS.GravarCodNFdatasetTemp(DBGridNFS.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
        vNf.cadAbrirNfIntegracaoCanc(DBGridNFS.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
      finally
        vNf.Free;
      end;
    end;
   finally
     AtualizarHistorico(true);
     Screen.Cursor := crDefault;
   end;
end;

procedure TfrmEstMotosCCIA.BitBtn34Click(Sender: TObject);
begin
  inherited;
  TForm(pnFaturaDesp.Parent).ModalResult := IDCANCEL;

//   EstMoto.vDespesaVeic.Cancel;
//  _DesabilitarCamposDespesa;
end;

procedure TfrmEstMotosCCIA.BitBtn35Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn19.CanFocus) then
    BitBtn19.SetFocus;
  TForm(PnEstoque.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmEstMotosCCIA.BitBtn36Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
   try
    Screen.Cursor := crHourGlass;

    if DBGridNFE.DataSource.DataSet.IsEmpty then
      exit;
    if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
      try
        vNf := TNFCab.create;
        EstMoto.vHistNFE.GravarCodNFdatasetTemp(DBGridNFE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
        vNf.cadAbrirNfIntegracaoCanc(DBGridNFE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
      finally
        vNf.Free;
      end;
    end;
   finally
     AtualizarHistorico(true);
     Screen.Cursor := crDefault;
   end;
end;

procedure TfrmEstMotosCCIA.BitBtn37Click(Sender: TObject);
var
  vNf: TNfCab;
begin
  inherited;
   try
    Screen.Cursor := crHourGlass;

    if DBGridNFS.DataSource.DataSet.IsEmpty then
      exit;
    if _mdiAberto('TfrmCadNF', 'O modulo de Nota Fiscal se encontra aberto!') then
    begin
      try
        vNf := TNFCab.create;
        EstMoto.vHistNFS.GravarCodNFdatasetTemp(DBGridNFS.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
        vNf.cadAbrirNfIntegracaoCanc(DBGridNFS.DataSource.DataSet.FieldByName('NUMDOC').AsInteger);
      finally
        vNf.Free;
      end;
    end;
   finally
     AtualizarHistorico(true);
     Screen.Cursor := crDefault;
   end;
end;

procedure TfrmEstMotosCCIA.BitBtn38Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if DBGridCTRE.DataSource.DataSet.IsEmpty then
    exit;

    if _mdiAberto('TfrmMovVeiculosCCIA', 'O modulo de Comando/Contrato se encontra aberto!') then
       EstMoto.vHistCTRE.abrirComFat(DBGridCTRE.DataSource.DataSet.FieldByName('NUMDOC').AsInteger, 1);

  finally
    AtualizarHistorico(true);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn39Click(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;

     if DBGridCTRS.DataSource.DataSet.IsEmpty then
      exit;

     if _mdiAberto('TfrmMovVeiculosCCIA', 'O modulo de Comando/Contrato se encontra aberto!') then
       EstMoto.vHistCTRS.abrirComFat(DBGridCTRS.DataSource.DataSet.FieldByName('NUMDOC').AsInteger, 1);
   finally
      AtualizarHistorico(true);
      Screen.Cursor := crDefault;
   end;
end;

procedure TfrmEstMotosCCIA.BitBtn3Click(Sender: TObject);
var
	I: Integer;
begin
	if not vDadosIni.PesqPros('VEI059', 'INCLUIR', '', 'EST_MOTO', '', EstMoto.buscas, true) then
   exit;

  if not EstMoto.Insert then
    exit;

  for I := 0 to ComponentCount - 1 do
    if (Components[I] is TScrollBox) then
      TScrollBox(Components[I]).VertScrollBar.Position := 0;

  inherited;

  DBComboBox7.Clear;
  DBComboBox7.Items.Add('VIVO');
  DBComboBox7.Items.Add('TRANSITO');
  DBComboBox7.Items.Add('ESTACIONAMENTO');
  DBEdit26.Enabled := EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'N';
  Label8.Visible := (vDadosIni.vEmp.vTipoEmpVeiculos <> 'A') and
   (EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'U');
  DBComboBox6.Visible := (vDadosIni.vEmp.vTipoEmpVeiculos <> 'A') and
   (EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'U');

  BitBtn4.Enabled := true;
  SpeedButton9.Visible := False;
  ComboBox4.Text := '';
  ComboBox5.Text := '';

  Label80.Enabled := true;
  DBEdit18.Enabled := true;
  Label81.Enabled := true;
  DBEdit26.Enabled := true;
  btAlterarChassiPlaca.Visible := false;

  LabelSeq.Visible := false;
  CheckCadSeq.Visible := false;
  TabSheet_Dados.TabVisible := true;
  TabSheet_MaisInformacoes.TabVisible := true;
  TabSheet_Contratos.TabVisible := false;
  TabSheet_Pendencias.TabVisible := false;
  TabSheet_Despesas.TabVisible := false;
  TabSheet_Notas.TabVisible := false;
  TabSheet_NotasTransito.TabVisible := false;
  TabSheet_Oficina.TabVisible := false;
  PageControl3.ActivePage := TabSheet_Dados;
  TabSheet_Dados.Show;
  _atualizarCombobox;
  _DesabilitaCampos;
  SelectNext(ActiveControl, true, true);
end;

procedure TfrmEstMotosCCIA.BitBtn40Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if DBGridOrcamento.DataSource.DataSet.IsEmpty then
      exit;
//    if _mdiAberto('TFrmCadPedVenda', 'O modulo de Venda se encontra aberto!') then
      EstMoto.vHistORC.abrirPedVenda(
      	DBGridOrcamento.DataSource.DataSet.FieldByName('NUMDOC').AsInteger,
        DBGridOrcamento.DataSource.DataSet.FieldByName('TIPO').AsString,
        1);
  finally
    PageControl3Change(Sender);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn41Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if DBGridOficina.DataSource.DataSet.IsEmpty then
      exit;
//    if _mdiAberto('TFrmCadPedVenda', 'O modulo de Venda se encontra aberto!') then
      EstMoto.vHistOS.abrirPedVenda(
      	DBGridOficina.DataSource.DataSet.FieldByName('NUMDOC').AsInteger,
        DBGridOficina.DataSource.DataSet.FieldByName('TIPO').AsString,
        1);
  finally
    AtualizarHistorico(true);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn42Click(Sender: TObject);
var
 vEstMotoTransito: TEstMotoTransitoCCIA;
begin
  try
    Screen.Cursor := crHourGlass;

    if DBGridNFT.DataSource.dataSet.IsEmpty then
     exit;

    if _mdiAberto('FrmTransitoVeiculosCCIA', 'O modulo de Nota Fiscal em Transito se encontra aberto!') then
    begin
      try
        vEstMotoTransito := TEstMotoTransitoCCIA.create;
        vEstMotoTransito.CadEstMotoTransito(1, DBGridNFT.DataSource.DataSet.FieldByName('NUM_NOTA').AsInteger);
      finally
        vEstMotoTransito.Free;
      end;
    end;
  finally
     vDadosIni.fechaStatusProcessamento;
     Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn43Click(Sender: TObject);
begin
   TForm(pnObservacao.Parent).ModalResult := IDOK;
end;

procedure TfrmEstMotosCCIA.BitBtn44Click(Sender: TObject);
begin
  TForm(pnObservacao.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmEstMotosCCIA.BitBtn4Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
  	BitBtn4.SetFocus;
  if not vDadosIni.PesqPros('VEI061', 'SALVAR', 'CHASSI ' + EstMoto.dataSet.FieldByName('CHASSI_C').AsString,
    'EST_MOTO', EstMoto.dataSet.FieldByName('CODIGO').AsString, EstMoto.buscas, true) then
    exit;
  try
    Screen.Cursor := crHourGlass;

    if not EstMoto.Post then
      setFocusCampoErro(EstMoto.vNomeCampoErro, EstMoto.vMensagemErro)
    else
    begin
      if TelaCadastro = 1 then
      begin
        BitBtn6.Click;
        Exit;
      end;
      if CheckCadSeq.Checked then
      begin
        if EstMoto.Insert then
        	if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
          	DBComboBox3.SetFocus;
        MudaCor;
      end
      else
        inherited;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn5Click(Sender: TObject);
begin
  EstMoto.Cancel;
  EstMoto.RollBackTransacao;
  EstMoto.Refresh;
  inherited;
end;

procedure TfrmEstMotosCCIA.BitBtn94Click(Sender: TObject);
begin
  inherited;
  try
   TClientDataSet(DBGrid28.DataSource.DataSet).IndexDefs.Clear;
   TClientDataSet(DBGrid28.DataSource.DataSet).IndexDefs.Add('IDX$ANumConta', 'NumConta', []);
   TClientDataSet(DBGrid28.DataSource.DataSet).IndexName := 'IDX$ANumConta';

   if DBGrid28.DataSource <> nil then
      if TClientDataSet(DBGrid28.DataSource.DataSet).active then
        TClientDataSet(DBGrid28.DataSource.DataSet).First;

   TForm(pnDetFatEnt.Parent).ModalResult := IDOK;
  except
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn95Click(Sender: TObject);
begin
  inherited;
   TForm(pnDetFatEnt.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmEstMotosCCIA.BitBtn96Click(Sender: TObject);
var
  vrTemp: Currency;
begin
  inherited;
  try
  if not (cdsDesp.State in [dsInsert, dsEdit]) then
   exit;

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
//  cdsDespNomeControle.Text := DBLookupComboBox11.Text;
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
    Label414.Caption :=Format('%0.2m', [EstMoto.vDespesaVeic.FDespesas.valorDocumento[EstMoto.vDespesaVeic.FDespesas.parcelas - 1] - vrTemp] )
  else
    Label414.Caption :=Format('%0.2m', [EstMoto.vDespesaVeic.FDespesas.valorDocumento[ListBox3.ItemIndex] - vrTemp] );
  except
    on e:exception do begin
      Application.MessageBox(pchar(e.Message),'Atenção',0+64);
    end;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn97Click(Sender: TObject);
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

procedure TfrmEstMotosCCIA.BitBtn98Click(Sender: TObject);
begin
  cdsDesp.Edit;
  Panel87.Enabled := True;
  Panel88.Enabled := False;
  Panel84.Enabled := False;
  Label84.Visible := False;
  DBEdit23.Visible := False;
  Label55.Visible := False;
  DBEdit24.Visible := False;
  if (Self.Enabled) and (Self.Visible) and (DBEdit227.CanFocus) then
    DBEdit227.SetFocus;
end;

procedure TfrmEstMotosCCIA.BitBtn99Click(Sender: TObject);
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
  cdsDespHistorico.AsString := 'DESPESA VEICULO ' + EstMoto.dataSet.FieldByName('CHASSI_C').AsString;
  cdsDespNumDoc.AsString := EstMoto.vDespesaVeic.FDespesas.numeroDocumento[EstMoto.vDespesaVeic.FDespesas.parcelas - 1]+'-'+vDadosIni.StrZero(cdsDesp.RecordCount+1,2);
  cdsDespValor.AsCurrency := EstMoto.vDespesaVeic.FDespesas.valorDocumento[EstMoto.vDespesaVeic.FDespesas.parcelas - 1] - vrTemp;
  cdsDespDataReferencia.AsDateTime := vDadosIni.getDataBanco(EstMoto.buscas);
  Panel87.Enabled := True;
  Panel88.Enabled := False;
  Panel84.Enabled := False;
  Label84.Visible := False;
  DBEdit23.Visible := False;
  Label55.Visible := False;
  DBEdit24.Visible := False;
  if (Self.Enabled) and (Self.Visible) and (DBEdit225.CanFocus) then
  	DBEdit225.SetFocus;
end;

procedure TfrmEstMotosCCIA.BitBtn9Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if DBGridOficina.DataSource.DataSet.IsEmpty then
      exit;
//    if _mdiAberto('TFrmCadPedVenda', 'O modulo de Venda se encontra aberto!') then
      EstMoto.vHistOS.abrirPedVenda(
      	DBGridOficina.DataSource.DataSet.FieldByName('NUMDOC').AsInteger,
        DBGridOficina.DataSource.DataSet.FieldByName('TIPO').AsString);
  finally
    AtualizarHistorico(true);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn_Alterar_DespesaClick(Sender: TObject);
begin
  inherited;
   if EstMoto.vDespesaVeic.dataSet.IsEmpty then
    exit;

  if not vDadosIni.PesqPros('VEI028', 'EDITAR', 'CHASSI ' + EstMoto.dataSet.FieldByName('CHASSI_C').AsString,
   'DESPESAS_VEIC', EstMoto.vDespesaVeic.dataSet.FieldByName('COD_DESPESA').AsString, EstMoto.buscas, true) then
    Exit;

  if not EstMoto.vDespesaVeic.DespesaQuitada(EstMoto.vDespesaVeic.dataSet.FieldByName('COD_DESPESA').AsInteger) then
  begin
   Application.MessageBox(Pchar('Não é possível editar pois despesa já foi quitada!'), 'Aviso', MB_OK +  MB_ICONEXCLAMATION + MB_DEFBUTTON1);
   exit;
  end;

  if not EstMoto.vDespesaVeic.Edit then
   exit;

  if not EstMoto.vDespesaVeic.abreFormDespesa(true) then
     exit;
end;

procedure TfrmEstMotosCCIA.BitBtn_Alterar_PendenciaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI021', 'EDITAR', 'CHASSI ' + EstMoto.dataSet.FieldByName('CHASSI_C').AsString,
   'PENDENCIAS_VEIC', EstMoto.vPendenciaVeic.dataSet.FieldByName('COD_PENDENCIA').AsString, EstMoto.buscas, true) then
    Exit;
  if EstMoto.vPendenciaVeic.Edit then
  begin
    _HabilitarCamposPendencia;
    if (Self.Enabled) and (Self.Visible) and (DBEdit_Assunto_Pendencia.CanFocus) then
      DBEdit_Assunto_Pendencia.SetFocus;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn_Cancelar_DespesaClick(Sender: TObject);
begin
  inherited;
  EstMoto.vDespesaVeic.Cancel;
  _DesabilitarCamposDespesa;
end;

procedure TfrmEstMotosCCIA.BitBtn_Cancelar_PendenciaClick(Sender: TObject);
begin
  inherited;
  EstMoto.vPendenciaVeic.Cancel;
  _DesabilitarCamposPendencia;
end;

procedure TfrmEstMotosCCIA.BitBtn_Excluir_DespesaClick(Sender: TObject);
begin
  inherited;

  if EstMoto.vDespesaVeic.dataSet.IsEmpty then
    exit;

  if not vDadosIni.PesqPros('VEI030', 'APAGAR', 'CHASSI ' + EstMoto.dataSet.FieldByName('CHASSI_C').AsString,
    'DESPESAS_VEIC', EstMoto.vDespesaVeic.dataSet.FieldByName('COD_DESPESA').AsString, EstMoto.buscas, true) then
    Exit;

  if not EstMoto.vDespesaVeic.DespesaQuitada(EstMoto.vDespesaVeic.dataSet.FieldByName('COD_DESPESA').AsInteger) then
  begin
   Application.MessageBox(Pchar('Não é possível excluir pois despesa já foi quitada!'), 'Aviso', MB_OK +  MB_ICONEXCLAMATION + MB_DEFBUTTON1);
   exit;
  end;

  EstMoto.vDespesaVeic.Delete;
  //Soma os valores do Grid
  EditMoedaSomaTotalDespesas.Valor := _SomarValoresGridDespesa;
end;

procedure TfrmEstMotosCCIA.BitBtn_Excluir_PendenciaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI023', 'APAGAR', 'CHASSI ' + EstMoto.dataSet.FieldByName('CHASSI_C').AsString,
    'PENDENCIAS_VEIC', EstMoto.vPendenciaVeic.dataSet.FieldByName('COD_PENDENCIA').AsString, EstMoto.buscas, true) then
    Exit;
  EstMoto.vPendenciaVeic.Delete;
  //Soma os valores do Grid
  EditMoedaSomaTotalPend.Valor := _SomarValoresGridPendencia;
end;

procedure TfrmEstMotosCCIA.BitBtn_Novo_DespesaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI029', 'INCLUIR', 'CHASSI ' + EstMoto.dataSet.FieldByName('CHASSI_C').AsString,
   'DESPESAS_VEIC', '', EstMoto.buscas, true) then
    Exit;
  if not EstMoto.vDespesaVeic.insert(EstMoto) then
   exit;
  if not EstMoto.vDespesaVeic.abreFormDespesa then
     exit;
end;

procedure TfrmEstMotosCCIA.BitBtn_Novo_PendenciaClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VEI022', 'INCLUIR', 'CHASSI ' + EstMoto.dataSet.FieldByName('CHASSI_C').AsString,
    'PENDENCIAS_VEIC', '', EstMoto.buscas, true) then
    Exit;
  if EstMoto.vPendenciaVeic.Insert(EstMoto) then
  begin
    _HabilitarCamposPendencia;
    if (Self.Enabled) and (Self.Visible) and (DBEdit_Assunto_Pendencia.CanFocus) then
      DBEdit_Assunto_Pendencia.SetFocus;
  end;
end;

procedure TfrmEstMotosCCIA.BitBtn_Salvar_DespesaClick(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn_Salvar_Despesa.CanFocus) then
  	BitBtn_Salvar_Despesa.SetFocus;
  
  if not vDadosIni.PesqPros('VEI027', 'SALVAR', 'CHASSI ' + EstMoto.dataSet.FieldByName('CHASSI_C').AsString,
    'DESPESAS_VEIC', EstMoto.vDespesaVeic.dataSet.FieldByName('COD_DESPESA').AsString, EstMoto.buscas, true) then
    Exit;
  if not EstMoto.vDespesaVeic.Post then
  begin
    PageControl3.ActivePage := TabSheet_Despesas;
    setFocusCampoErro(EstMoto.vDespesaVeic.vNomeCampoErro, EstMoto.vDespesaVeic.vMensagemErro);
    exit;
  end;

  _DesabilitarCamposDespesa;
  //Soma os valores do Grid
  EditMoedaSomaTotalDespesas.Valor := _SomarValoresGridDespesa;
end;

procedure TfrmEstMotosCCIA.BitBtn_Salvar_PendenciaClick(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn_Salvar_Pendencia.CanFocus) then
  	BitBtn_Salvar_Pendencia.SetFocus;
  
  if not vDadosIni.PesqPros('VEI020', 'SALVAR', 'CHASSI ' + EstMoto.dataSet.FieldByName('CHASSI_C').AsString,
    'PENDENCIAS_VEIC', EstMoto.vPendenciaVeic.dataSet.FieldByName('COD_PENDENCIA').AsString, EstMoto.buscas, true) then
    Exit;
  if not EstMoto.vPendenciaVeic.Post then
  begin
    PageControl3.ActivePage := TabSheet_Pendencias;
    setFocusCampoErro(EstMoto.vPendenciaVeic.vNomeCampoErro, EstMoto.vPendenciaVeic.vMensagemErro);
    exit;
  end;

  _DesabilitarCamposPendencia;
  //Soma os valores do Grid
  EditMoedaSomaTotalPend.Valor := _SomarValoresGridPendencia;
end;

procedure TfrmEstMotosCCIA.btAlterarChassiPlacaClick(Sender: TObject);
var
  vChassi: string;
  vPlaca: string;
  vCodigo: Integer;
begin
  inherited;
  vCodigo := EstMoto.dataset.FieldByName('CODIGO').AsInteger;	
  vChassi := trim(EstMoto.dataset.FieldByName('CHASSI_C').AsString);
  vPlaca  := trim(EstMoto.dataset.FieldByName('PLACAEST').AsString);

	if not vDadosIni.AtualizarChassiPlaca(vChassi, vPlaca, EstMoto.buscas) then
  	exit;

  EstMoto.AbreEstMoto(vCodigo, vChassi);
  if not (EstMoto.dataset.State in [dsEdit, dsInsert]) then
	 	EstMoto.dataset.Edit;
end;

procedure TfrmEstMotosCCIA.btAlterarFaturaEntradaClick(Sender: TObject);
begin
  inherited;
  try
    edDocFaturaEntrada.Text := EstMoto.vDespesaVeic.FDespesas.numeroDocumento[ListBox3.ItemIndex];
    edVencimentoFaturaEntrada.Text := EstMoto.vDespesaVeic.FDespesas.vencimentoDocumento[ListBox3.ItemIndex];
    edValorFaturaEntrada.AsValue := EstMoto.vDespesaVeic.FDespesas.valorDocumento[ListBox3.ItemIndex];
    Panel47.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (edDocFaturaEntrada.CanFocus) then
    	edDocFaturaEntrada.SetFocus;
    btAlterarFaturaEntrada.Enabled := false;
    ListBox3.Enabled := false;
    GroupBox26.Enabled := false;
  except
    Application.MessageBox('Selecione a parcela', 'Atenção', mb_ok + MB_ICONINFORMATION);
  end;
end;

procedure TfrmEstMotosCCIA.btApagarDespClick(Sender: TObject);
begin
  inherited;
  if not EstMoto.vDespesaVeic.ApagarDespesa(EstMoto) then
    exit;

  EstMoto.vDespesaVeic.ApagarContasPagarTemp(cdsDesp);

  Edit3.Enabled := True;
  EditHw1.Enabled := True;
  EditHw2.Enabled := True;
  DBLookupComboBox14.Enabled := True;
  EditHw3.Enabled := True;
  DBLookupComboBox15.Enabled := True;
end;

procedure TfrmEstMotosCCIA.btDetalheDespesaClick(Sender: TObject);
begin
  inherited;
  if ListBox3.ItemIndex < 0 then
  begin
    Application.MessageBox('Selecione a parcela', 'Atenção', mb_ok + MB_ICONINFORMATION);
    exit;
  end;

  try
    EstMoto.vDespesaVeic.abreFormDespesaDetalhado(ListBox3.ItemIndex, cdsDesp);
  except
    Application.MessageBox('Erro ao selecione a parcela', 'Atenção', mb_ok + MB_ICONINFORMATION);
  end;
end;

procedure TfrmEstMotosCCIA.btGerarClick(Sender: TObject);
begin
  inherited;
  try
   if trim(Edit3.Text) = '' then
   begin
     Application.MessageBox('Nº do Documento não informado!', 'Atenção', mb_ok + MB_ICONINFORMATION);
     if (Self.Enabled) and (Self.Visible) and (Edit3.CanFocus) then
       Edit3.SetFocus;
     exit;
   end;
   if EditHw1.AsValue <= 0 then
   begin
     Application.MessageBox('Valor da Despesa não informado!', 'Atenção', mb_ok + MB_ICONINFORMATION);
     if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
       EditHw1.SetFocus;
     exit;
   end;
   if EditHw2.AsInteger <= 0 then
   begin
     Application.MessageBox('Tipo de Despesa não informado!', 'Atenção', mb_ok + MB_ICONINFORMATION);
     if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
       EditHw2.SetFocus;
     exit;
   end
   else if EditHw2.AsInteger > 0 then
   begin
     if not EstMoto.vDespesaVeic.LocTipoDespesa.buscarLocTipoDespesa(EditHw2.AsInteger) then
     begin
       Application.MessageBox('Tipo de Despesa não encontrado!', 'Informação', MB_OK + MB_ICONINFORMATION +
         MB_DEFBUTTON1);
       if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
         EditHw2.SetFocus;
       exit;
     end;
   end;
  if not EstMoto.vDespesaVeic.vPlanoC.abrePContas(EstMoto.vDespesaVeic.LocTipoDespesa.dataSet.FieldByName('N_CONTA_PLC').AsInteger) then
  begin
     Application.MessageBox('Plano de Contas não encontrado para este Tipo de Despesa!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
        EditHw2.SetFocus;
      exit;
  end;
  if EditHw3.AsInteger <= 0 then
  begin
      Application.MessageBox('Fornecedor não encontrado!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (EditHw3.CanFocus) then
        EditHw3.SetFocus;
      exit;
  end
  else if EditHw3.AsInteger > 0 then
  begin
    if not EstMoto.vDespesaVeic.LocCliDespesa.abreClientes(EditHw3.AsInteger) then
    begin
      Application.MessageBox('Fornecedor não encontrado!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (EditHw3.CanFocus) then
        EditHw3.SetFocus;
      exit;
    end;
  end;
   if (edcreditoQtdeParcelas.Value <= 0) and (trim(DBLookupComboBox6.Text) = '') then
   begin
     Application.MessageBox('Quantidade de parcelas ou Condição de Pagamento não foi informado!', 'Atenção', mb_ok + MB_ICONINFORMATION);
     if (Self.Enabled) and (Self.Visible) and (edcreditoQtdeParcelas.CanFocus) then
       edcreditoQtdeParcelas.SetFocus;
     exit;
   end;
   if not EstMoto.vDespesaVeic.gerarDespesa(EstMoto) then
     exit;

   EstMoto.vDespesaVeic.GravarContasPagarTemp(cdsDesp);
   Edit3.Enabled := False;
   EditHw1.Enabled := False;
   EditHw2.Enabled := False;
   DBLookupComboBox14.Enabled := False;
   EditHw3.Enabled := False;
   DBLookupComboBox15.Enabled := False;
  except
  end;
end;

procedure TfrmEstMotosCCIA.btPosicaoClick(Sender: TObject);
begin
  if trim(btPosicao.Caption) = 'E' then
    btPosicao.Caption := 'OU'
  else
    btPosicao.Caption := 'E';
end;

procedure TfrmEstMotosCCIA.btSalvarFaturaEntradaClick(Sender: TObject);
var
  vIndex:Integer;
begin
  inherited;
  try
    vIndex := ListBox3.ItemIndex;
    if EstMoto.vDespesaVeic.setFatura(ListBox3.ItemIndex, edDocFaturaEntrada.Text, edVencimentoFaturaEntrada.Text,
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
    GroupBox26.Enabled := True;
    Panel47.Visible := False;
    if btDetalheDespesa.Tag = 1 then
      btDetalheDespesa.Visible := True;
  end;
end;

procedure TfrmEstMotosCCIA.btSituacaoEstClick(Sender: TObject);
begin
  if trim(btSituacaoEst.Caption) = 'E' then
    btSituacaoEst.Caption := 'OU'
  else
    btSituacaoEst.Caption := 'E';
end;

procedure TfrmEstMotosCCIA.btSituacaoTpOPClick(Sender: TObject);
begin
  if trim(btSituacaoTpOP.Caption) = 'E' then
    btSituacaoTpOP.Caption := 'OU'
  else
    btSituacaoTpOP.Caption := 'E';
end;

procedure TfrmEstMotosCCIA.btStatusClick(Sender: TObject);
begin
  if trim(btStatus.Caption) = 'E' then
    btStatus.Caption := 'OU'
  else
    btStatus.Caption := 'E';
end;

procedure TfrmEstMotosCCIA.CheckBox1Click(Sender: TObject);
begin
   if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 264
  else
    GroupBox3.Height := 90;
    
  groupAdicional.Visible := CheckBox1.Checked;

  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;

  if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    ComboBox11.SetFocus;
end;

procedure TfrmEstMotosCCIA.CheckBox3Click(Sender: TObject);
begin
  if (CheckBox1.Checked) or (CheckBox3.Checked) then
    GroupBox3.Height := 264
  else
    GroupBox3.Height := 90;
  groupAvancadas.Visible := CheckBox3.Checked;
end;

procedure TfrmEstMotosCCIA.checkConcClick(Sender: TObject);
begin
  checkEstoqueReal.Enabled := not (checkConc.Checked);
end;

procedure TfrmEstMotosCCIA.checkEstoqueRealClick(Sender: TObject);
begin
  checkConc.Enabled := not (checkEstoqueReal.Checked);
end;

procedure TfrmEstMotosCCIA.ckVivoClick(Sender: TObject);
begin
  cbDemonstracao.Enabled := (ckVivo.Checked and ckMorto.Checked)
    or (not ckVivo.Checked and not ckMorto.Checked);
  cbCancelado.Enabled := (ckVivo.Checked and ckMorto.Checked)
    or (not ckVivo.Checked and not ckMorto.Checked);
  ckComEstoque.Enabled := (ckVivo.Checked and ckMorto.Checked)
    or (not ckVivo.Checked and not ckMorto.Checked);

  if (ckVivo.Checked <> ckMorto.Checked) then
  begin
    cbCancelado.Enabled := not ckVivo.Checked;
    cbDemonstracao.Enabled :=  not ckMorto.Checked;
    ckComEstoque.Enabled := not ckMorto.Checked;
  end;
  if ((not ckVivo.Checked) and (not ckMorto.Checked)) and (ckTransito.Checked) then
  begin
    cbCancelado.Enabled := false;
    cbDemonstracao.Enabled := false;
    ckComEstoque.Enabled := false;
  end;
end;

procedure TfrmEstMotosCCIA.ComboBox11Exit(Sender: TObject);
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
    if (Self.Enabled) and (Self.Visible) and (MaskEdit9.CanFocus) then
      MaskEdit9.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (MaskEdit7.CanFocus) then
      MaskEdit7.SetFocus;
end;

procedure TfrmEstMotosCCIA.ComboBox12Enter(Sender: TObject);
var
  i: integer;
begin
  if Sender is TComboBox then
  begin
    for I := 0 to TComboBox(sender).Items.Count - 1 do
    begin
      if UpperCase(TComboBox(sender).Text) = UpperCase(TComboBox(sender).Items[i]) then
      begin
        TComboBox(sender).Text := TComboBox(sender).Items[TComboBox(sender).ItemIndex];
        TComboBox(sender).ItemIndex := i;
        exit;
      end;
    end;
  end;
end;

procedure TfrmEstMotosCCIA.ComboBox12Exit(Sender: TObject);
var
  i: integer;
begin
  if Sender is TComboBox then
  begin
    for I := 0 to TComboBox(sender).Items.Count - 1 do
    begin
      if UpperCase(TComboBox(sender).Text) = UpperCase(TComboBox(sender).Items[i]) then
      begin
        TComboBox(sender).Text := TComboBox(sender).Items[TComboBox(sender).ItemIndex];
        TComboBox(sender).ItemIndex := i;
        break;
      end;
    end;
  end;
  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TfrmEstMotosCCIA.Configurarcolunas1Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('VEI114', 'CONFIGURAR', '', 'EST_MOTO', '', EstMoto.buscas, true) then
  inherited;
end;

procedure TfrmEstMotosCCIA.ConfigurarForm(pValor: string);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
  try
    if (TelaCadastro <= 0 ) then
      exit;
      
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + 'TfrmPrincipalS', True);
      // Grava as informações do form
      Registro.WriteString('JanelasMaximizadas', pValor);
      Registro.WriteString('ExibirPropagandaFlash', 'N');
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TfrmEstMotosCCIA.DBComboBox1Exit(Sender: TObject);
begin
  inherited;
   if EstMoto.dataSet.State = dsEdit then
   _DesabilitaCampos;
end;

procedure TfrmEstMotosCCIA.DBComboBox3Exit(Sender: TObject);
begin
  inherited;
  if EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'N' then
  begin
    EstMoto.dataSet.FieldByName('PLACAEST').AsString := '';
    if (vDadosIni.vEmp.vTipoEmpVeiculos <> 'A') then
      EstMoto.dataSet.FieldByName('ESTOQUE').AsString := '';
    DBEdit26.Enabled := false;
    DBComboBox6.Enabled := false;
  end
  else
  begin
    DBEdit26.Enabled := true;
    DBComboBox6.Enabled := true;
  end;

end;

procedure TfrmEstMotosCCIA.DBEdit10Exit(Sender: TObject);
begin
  inherited;
//  if (not EstMoto.dataSet.FieldByName('COM_ENT').IsNull) and (EstMoto.dataSet.FieldByName('COM_ENT').AsInteger <> 0) then
//    EstMoto.dataSet.FieldByName('VL_REC_CAIXA').AsFloat := 0
//  else
//    EstMoto.dataSet.FieldByName('VL_REC_CAIXA').AsFloat := EstMoto.dataSet.FieldByName('VL_COMPRA').AsFloat;
 if EstMoto.dataSet.FieldByName('PRECO_CUSTO_REP').AsFloat <= 0 then
   EstMoto.dataSet.FieldByName('PRECO_CUSTO_REP').AsFloat := EstMoto.dataSet.FieldByName('PRECO_CUSTO').AsFloat;
 if EstMoto.dataSet.FieldByName('PRECO_CUSTO_DESP').AsFloat <= 0 then
   EstMoto.dataSet.FieldByName('PRECO_CUSTO_DESP').AsFloat := EstMoto.dataSet.FieldByName('PRECO_CUSTO').AsFloat;
end;

procedure TfrmEstMotosCCIA.DBEdit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vMarcaVeic: TMarcas;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('MARCA_PROD',
        ' AND TIPO_MARCA =''V''', 'Consulta de Marcas');
      if vDadosIni.vPesquisa <> '' then
        EstMoto.dataSet.FieldByName('COD_MARCA').AsString := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadMarcas', 'O Formulário Cadastro de Marcas se encontra aberto!') then
      exit;
    EstMoto.vModVeic.AbrirMarca;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.dataSet.FieldByName('COD_MARCA').asinteger := strtoint(vDadosIni.vPesquisa);
        EstMoto.vMarcaVeic._AbreMarca;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit18Exit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if EstMoto.verificajacad(1) then
  begin
    if Application.MessageBox('Veiculo já cadastrado no estoque, Deseja visualizar os dados?',
      'Alerta', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
      EstMoto.AbreEstMoto(EstMoto.vcodestmotopesq, EstMoto.vchassiestmotopesq, true);
       _atualizarCombobox;
      if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
        DBEdit26.SetFocus;
    end
    else
    begin
      if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
        DBEdit18.SetFocus;
    end;
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit228Exit(Sender: TObject);
begin
  inherited;
  try
    Label84.Visible := EstMoto.vDespesaVeic.vControles.dataset.FieldByName('CONTR_BANC').AsString = 'S';
    DBEdit23.Visible := EstMoto.vDespesaVeic.vControles.dataset.FieldByName('CONTR_BANC').AsString = 'S';
    Label55.Visible := EstMoto.vDespesaVeic.vControles.dataset.FieldByName('CONTR_BANC').AsString = 'S';
    DBEdit24.Visible := EstMoto.vDespesaVeic.vControles.dataset.FieldByName('CONTR_BANC').AsString = 'S';

    if EstMoto.vDespesaVeic.vControles.dataset.FieldByName('CONTR_BANC').AsString <> 'S' then
     if not (cdsDesp.State in [dsInsert, dsEdit]) then
     begin
        cdsDesp.Edit;
        cdsDesp.FieldByName('NChq').Value := Null;
        cdsDesp.FieldByName('NominalChq').Value := Null;
     end;
 except
 end;
end;

procedure TfrmEstMotosCCIA.DBEdit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCor: TCores;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.dataSet.FieldByName('COD_COR').AsString := vDadosIni.pesquisaRapida('CODIGO_CORFAB');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadCores', 'O Formulário Cadastro de Cores se encontra aberto!') then
      exit;
    EstMoto.AbrirCores;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.dataSet.FieldByName('COD_COR').AsString := vDadosIni.vPesquisa;
        EstMoto.vCoresVeic._AbreCores;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;
    
  if EstMoto.dataSet.FieldByName('COD_FORNECEDOR').AsInteger > 0 then
    if not EstMoto.vFornecedorVeic.abreClientes(EstMoto.dataSet.FieldByName('COD_FORNECEDOR').asinteger, 'E') then
    begin
      Application.MessageBox('Fornecedor não encontrado!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        DBEdit2.SetFocus;
    end;
end;

procedure TfrmEstMotosCCIA.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCliente: TCadClientes;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.dataSet.FieldByName('COD_FORNECEDOR').AsString := vDadosIni.pesquisaRapida('CLIENTES', ' AND ((TIPO <> ''C'') OR (TIPO IS NULL))  ', 'Consulta de Fornecedor');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadClientes', 'O Formulário Cadastro de Clientes/Fornecedor se encontra aberto!') then
      exit;
    EstMoto.vFornecedorVeic.AbrirCliente(EstMoto.dataSet.FieldByName('COD_FORNECEDOR').AsString);
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.dataSet.FieldByName('COD_FORNECEDOR').AsString := vDadosIni.vPesquisa;
        EstMoto.vFornecedorVeic.abreClientes(EstMoto.dataSet.FieldByName('COD_FORNECEDOR').AsInteger, 'E');
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit31Exit(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  ComboBox4.Text := '';
  ComboBox5.Text := '';

  if (EstMoto.dataSet.FieldByName('VERSAOEST').AsInteger > 0) then
  begin
     if not EstMoto.vModVeic.buscarModelo(EstMoto.dataSet.FieldByName('VERSAOEST').AsInteger, 0, EstMoto.dataSet.FieldByName('STATUS_USO').AsString) then
     begin
       Application.MessageBox('Modelo de veículo não encontrado!', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
       if (Self.Enabled) and (Self.Visible) and (DBEdit31.CanFocus) then
         DBEdit31.SetFocus;
       exit;
     end;

    if (EstMoto.dataSet.FieldByName('NUM_NOTA').AsInteger <=0)
     and (EstMoto.dataSet.FieldByName('NUM_NOTAV').AsInteger <=0)
     and (EstMoto.dataSet.FieldByName('N_COMANDO').AsInteger <=0)
     and (EstMoto.dataSet.FieldByName('N_COMANDOV').AsInteger <=0) then
    begin
       ComboBox4.Visible := true;
       ComboBox5.Visible := true;
       Label65.Visible := true;
       Label70.Visible := true;

       EstMoto.dataSet.FieldByName('COD_MARCA').AsInteger := EstMoto.vModVeic.buscas.FieldByName('COD_MARCA').AsInteger;
       EstMoto.dataSet.FieldByName('COD_COMBUSTIVEL').AsInteger := EstMoto.vModVeic.buscas.FieldByName('COD_COMBUSTIVEL').AsInteger;
       EstMoto.dataSet.FieldByName('LOTACAOEST').AsString := EstMoto.vModVeic.buscas.FieldByName('LOTACAO').AsString;
       EstMoto.dataSet.FieldByName('COD_ESPE_SEG').AsInteger := EstMoto.vModVeic.buscas.FieldByName('COD_TIPO_ESP').AsInteger;
       EstMoto.dataSet.FieldByName('ANO_FABEST').AsInteger := EstMoto.vModVeic.buscas.FieldByName('ANO1').AsInteger;
       EstMoto.dataSet.FieldByName('ANO_MODEST').AsInteger := EstMoto.vModVeic.buscas.FieldByName('MODELO1').AsInteger;
       EstMoto.dataSet.FieldByName('HPEST').AsFloat := EstMoto.vModVeic.buscas.FieldByName('HP').AsFloat;
       EstMoto.dataSet.FieldByName('CILINDROSEST').AsFloat := EstMoto.vModVeic.buscas.FieldByName('CILINDROS').AsFloat;
       EstMoto.dataSet.FieldByName('CILINDRADAEST').AsFloat := EstMoto.vModVeic.buscas.FieldByName('CILINDRADA').AsFloat;
       EstMoto.dataSet.FieldByName('RENAVAMEST').AsString := EstMoto.vModVeic.buscas.FieldByName('RENAVAM').AsString;
       EstMoto.dataSet.FieldByName('PRECO_TABEST').AsFloat := EstMoto.vModVeic.dataSet.FieldByName('VALTAB').AsFloat;

       if (EstMoto.dataSet.FieldByName('STATUS_USO').AsString <> 'N') and (vDadosIni.vEmp.vInfRedLucro = 'S') then
       begin
         EstMoto.dataSet.FieldByName('PERC_RED').AsFloat := EstMoto.vModVeic.buscas.FieldByName('PERC_RED').AsFloat;
         EstMoto.dataSet.FieldByName('RED_LUCRO').AsString := EstMoto.vModVeic.buscas.FieldByName('RED_LUCRO').AsString;
         if EstMoto.dataSet.FieldByName('RED_LUCRO').AsString = 'S' then
           DBComboBox5.ItemIndex := 0
         else
           DBComboBox5.ItemIndex := 1;
       end;
    end;

    _atualizarCombobox;

    _buscarInfModelo;
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit31KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vModeloVeic: TModVeiculoCCIA;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vModeloVeic.dataSet.FieldByName('VERSAOEST').AsString := vDadosIni.pesquisaRapida('TIPMODELO');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TFrmCadModVeiculosCCIA', 'O Formulário Cadastro de Modelos de Veículos se encontra aberto!') then
      exit;
    EstMoto.AbrirModeloVeic;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.dataSet.FieldByName('VERSAOEST').AsString := vDadosIni.vPesquisa;
        EstMoto.vModVeic.abreModVeiculos;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadClientes', 'O Formulário Cadastro de Clientes/Fornecedor se encontra aberto!') then
      exit;
    EstMoto.vClientesVeic.AbrirCliente(EstMoto.dataSet.FieldByName('COD_CLIENTE').AsString);
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
        EstMoto.vClientesVeic.abreClientes(EstMoto.dataSet.FieldByName('COD_CLIENTE').AsInteger, 'S');
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit4Exit(Sender: TObject);
begin
  inherited;

  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6)) then
    Exit;

  if EstMoto.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
    if not EstMoto.vClientesVeic.abreClientes(EstMoto.dataSet.FieldByName('COD_CLIENTE').asinteger, 'S') then
    begin
      Application.MessageBox('Cliente não encontrado!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
        DBEdit4.SetFocus;
    end;
end;

procedure TfrmEstMotosCCIA.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCliente: TCadClientes;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.pesquisaRapida('CLIENTES', ' AND ((TIPO <> ''F'') OR (TIPO IS NULL)) ', 'Consulta de Cliente');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadClientes', 'O Formulário Cadastro de Clientes/Fornecedor se encontra aberto!') then
      exit;
    EstMoto.vClientesVeic.AbrirCliente(EstMoto.dataSet.FieldByName('COD_CLIENTE').AsString);
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
        EstMoto.vClientesVeic.abreClientes(EstMoto.dataSet.FieldByName('COD_CLIENTE').AsInteger, 'S');
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCombustivel: TCombustivel;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.dataSet.FieldByName('COD_COMBUSTIVEL').AsString := vDadosIni.pesquisaRapida('TP_COMB_RENAVAM');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadCombustivel', 'O Formulário Cadastro de Combustível se encontra aberto!') then
      exit;
    EstMoto.vModVeic.AbrirCombustivel;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.dataSet.FieldByName('COD_COMBUSTIVEL').AsString := vDadosIni.vPesquisa;
        EstMoto.vCombustivelVeic.abreTipoCombustiveis;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit_Assunto_DespesaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vAssuntoDesp: TTipoDespesa;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.vDespesaVeic.dataSet.FieldByName('COD_TP_DESPESA').AsString := vDadosIni.pesquisaRapida('TIPO_DESPESA');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadTipoDespesa', 'O Formulário Cadastro de Tipos de Despesa se encontra aberto!') then
      exit;
    EstMoto.vDespesaVeic.AbreTipoDesp;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.vDespesaVeic.dataSet.FieldByName('COD_TP_DESPESA').AsString := vDadosIni.vPesquisa;
        EstMoto.vDespesaVeic.LocTipoDespesa.abreLocTipoDespesa;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit_Assunto_PendenciaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vAssuntoPend: TTipoPendencia;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.vPendenciaVeic.dataSet.FieldByName('COD_TP_PENDENCIA').AsString := vDadosIni.pesquisaRapida('TIPO_PENDENCIA');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadTipoPendencia', 'O Formulário Cadastro de Tipos de Pendência se encontra aberto!') then
      exit;
    EstMoto.vPendenciaVeic.AbreTipoPend;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.vPendenciaVeic.dataSet.FieldByName('COD_TP_PENDENCIA').AsString := vDadosIni.vPesquisa;
        EstMoto.vPendenciaVeic.LocTipoPendencia.abreLocTipoPendencia;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBEdit_Fornecedor_DespesaExit(Sender: TObject);
begin
  inherited;
  if EstMoto.vDespesaVeic.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
    if not EstMoto.vDespesaVeic.LocCliDespesa.abreClientes(EstMoto.vDespesaVeic.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
    begin
      Application.MessageBox('Fornecedor não encontrado!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (DBEdit_Fornecedor_Despesa.CanFocus) then
        DBEdit_Fornecedor_Despesa.SetFocus;
    end;
end;

procedure TfrmEstMotosCCIA.DBEdit_Fornecedor_DespesaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  vCliente: TCadClientes;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.vDespesaVeic.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadClientes', 'O Formulário Cadastro de Clientes/Fornecedor se encontra aberto!') then
      exit;
    EstMoto.vClientesVeic.AbrirCliente(EstMoto.vDespesaVeic.dataSet.FieldByName('COD_CLIENTE').AsString);
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EstMoto.vDespesaVeic.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
        EstMoto.vClientesVeic.abreClientes(EstMoto.vDespesaVeic.dataSet.FieldByName('COD_CLIENTE').AsInteger, 'E');
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('STATUS_DEMONST').AsString)) = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($008C9A9A);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end
  else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('STATUS_TRANSDEP').AsString)) = 'S')
    and (Column.Field.Dataset.FieldbyName('DATA_TRANS_RET').IsNull) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($0000B22D);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end
  else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('STATUS_RES').AsString)) = 'S') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($008F7C3B);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end
  else if (UpperCase(Trim(Column.Field.Dataset.FieldbyName('POSICAO').AsString)) = 'TRANSITO')
  or (UpperCase(Trim(Column.Field.Dataset.FieldbyName('MODELO_NF').AsString)) = 'TRA') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00A3A573);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmEstMotosCCIA.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = VK_RETURN) then
    SpeedButton1Click(Sender)
  else if key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if (Key = VK_F5) then
  begin
    try
      Screen.Cursor := crHourGlass;
      EstMoto.Refresh;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmEstMotosCCIA.DBGrid28TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid28, Column);
end;

procedure TfrmEstMotosCCIA.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
 if (TDBGrid(sender).DataSource.DataSet.FieldByName('COD_PENDENCIA').AsInteger > 0)
   and (UpperCase(trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_PENDENCIA').AsString)) <> 'REGULAR') then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clRed;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmEstMotosCCIA.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 	if (key = VK_RETURN) then
    BitBtn_Alterar_PendenciaClick(Sender)
  else if key = VK_DELETE then
    BitBtn_Excluir_PendenciaClick(Sender)
  else if (Key = VK_INSERT) then
  	BitBtn_Novo_PendenciaClick(Sender);
end;

procedure TfrmEstMotosCCIA.DBGrid3TitleClick(Column: TColumn);
begin
  inherited;
 vDadosIni.DBGridOnTitleClick(DBGrid3, Column);
end;

procedure TfrmEstMotosCCIA.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
 if (TDBGrid(sender).DataSource.DataSet.FieldByName('COD_DESPESA').AsInteger > 0)
   and (UpperCase(trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_DESPESA').AsString)) <> 'QUITADA') then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clRed;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmEstMotosCCIA.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if (key = VK_RETURN) then
    BitBtn_Alterar_DespesaClick(Sender)
  else if key = VK_DELETE then
    BitBtn_Excluir_DespesaClick(Sender)
  else if (Key = VK_INSERT) then
  	BitBtn_Novo_DespesaClick(Sender);
end;

procedure TfrmEstMotosCCIA.DBGrid4TitleClick(Column: TColumn);
begin
  inherited;
 vDadosIni.DBGridOnTitleClick(DBGrid4, Column);
end;

procedure TfrmEstMotosCCIA.DBGridCTREColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGridCTRE.Columns.Count - 1 do
    DBGridCTRE.Columns[i].Title.Font.Style := [];
  DBGridCTRE.Columns[ToIndex].Title.Font.Style := [fsBold];
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasCTRE, DBGridCTRE, vDadosIni.vNomeUsuario, 'cdsHistCTREEstMotos', self, ScrollBoxCTRE, trans);
end;

procedure TfrmEstMotosCCIA.DBGridCTRETitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGridCTRE, Column);
end;

procedure TfrmEstMotosCCIA.DBGridCTRSColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGridCTRS.Columns.Count - 1 do
    DBGridCTRS.Columns[i].Title.Font.Style := [];
  DBGridCTRS.Columns[ToIndex].Title.Font.Style := [fsBold];
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasCTRS, DBGridCTRS, vDadosIni.vNomeUsuario, 'cdsHistCTRSEstMotos', self, ScrollBoxCTRS, trans);
end;

procedure TfrmEstMotosCCIA.DBGridCTRSTitleClick(Column: TColumn);
begin
  inherited;
vDadosIni.DBGridOnTitleClick(DBGridCTRS, Column);
end;

procedure TfrmEstMotosCCIA.DBGridHistCTRDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
    if ((trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'CTR')
      or (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'CFT'))
       and ((UpperCase(trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString)) = 'ABERTO')
       or (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString) = '')) then
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
    end
    else if ((trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'CTR')
      or (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'CFT'))
       and (UpperCase(trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString)) = 'CANCELADO') then
    begin
       if (gdFocused in State) then
       begin
         TDBGrid(sender).canvas.brush.color := clWindow;
         TDBGrid(sender).canvas.Font.color := clWindowText;
       end
       else
       begin
         TDBGrid(sender).canvas.brush.color := TColor($00009BDD);
         TDBGrid(sender).canvas.Font.color := clWhite;
       end;
    end
    else if (((trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'CTR')
          and (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('MODELO').AsString) <> 'CTRINTERM'))
          or (TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString = 'CFT'))
         and (TDBGrid(sender).DataSource.DataSet.FieldByName('COD_NF_CFT').AsInteger <= 0)
         and (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('MODELO_NF').AsString) = '55') then
    begin
       if (gdFocused in State) then
       begin
         TDBGrid(sender).canvas.brush.color := clWindow;
         TDBGrid(sender).canvas.Font.color := clWindowText;
       end
       else
       begin
           TDBGrid(sender).canvas.brush.color := clRed;
           TDBGrid(sender).canvas.Font.color := clWhite;
       end;
    end;
      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmEstMotosCCIA.DBGridHistNFDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'NF')
   and ((UpperCase(trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_NFE').AsString)) = 'ABERTA')
   or   (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_NFE').AsString) = '')) then
 begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clRed;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end
  else  if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'NF')
   and ((UpperCase(trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_NFE').AsString)) = 'CANCELADA')
   or   (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_NFE').AsString) = '')) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00009BDD);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmEstMotosCCIA.DBGridHistOficinaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'OS')
    and (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString) <> 'CANCELADO')
    and (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString) <> 'FECHADA')then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := clRed;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end
  else if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'OS')
   and (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString) = 'CANCELADO') then
  begin 
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00009BDD);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmEstMotosCCIA.DBGridNFEColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGridNFE.Columns.Count - 1 do
    DBGridNFE.Columns[i].Title.Font.Style := [];
  DBGridNFE.Columns[ToIndex].Title.Font.Style := [fsBold];
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasNFE, DBGridNFE, vDadosIni.vNomeUsuario, 'cdsHistNFEEstmotos', self, ScrollBoxNFE, trans);
end;

procedure TfrmEstMotosCCIA.DBGridNFEKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 vDadosIni.vShiftClick := Key = VK_SHIFT;
end;

procedure TfrmEstMotosCCIA.DBGridNFETitleClick(Column: TColumn);
begin
  inherited;
 vDadosIni.DBGridOnTitleClick(DBGridNFE, Column);
end;

procedure TfrmEstMotosCCIA.DBGridNFSColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGridNFS.Columns.Count - 1 do
    DBGridNFS.Columns[i].Title.Font.Style := [];
  DBGridNFS.Columns[ToIndex].Title.Font.Style := [fsBold];
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasNFS, DBGridNFS, vDadosIni.vNomeUsuario, 'cdsHistNFSEstmotos', self, ScrollBoxNFS, trans);
end;

procedure TfrmEstMotosCCIA.DBGridNFSTitleClick(Column: TColumn);
begin
  inherited;
 vDadosIni.DBGridOnTitleClick(DBGridNFS, Column);
end;

procedure TfrmEstMotosCCIA.DBGridNFTColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGridNFT.Columns.Count - 1 do
    DBGridNFT.Columns[i].Title.Font.Style := [];
  DBGridNFT.Columns[ToIndex].Title.Font.Style := [fsBold];
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasNFT, DBGridNFT, vDadosIni.vNomeUsuario, 'cdsHistNFTEstmotos', self, ScrollBoxNFT, trans);
end;

procedure TfrmEstMotosCCIA.DBGridNFTDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString) = 'CANCELADA') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00009BDD);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end
  else if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString) = '')
  and (TDBGrid(sender).DataSource.DataSet.FieldByName('NUM_NOTA').AsInteger > 0) then
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

procedure TfrmEstMotosCCIA.DBGridNFTTitleClick(Column: TColumn);
begin
  inherited;
   vDadosIni.DBGridOnTitleClick(DBGridNFS, Column);
end;

procedure TfrmEstMotosCCIA.DBGridOficinaColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGridOficina.Columns.Count - 1 do
    DBGridOficina.Columns[i].Title.Font.Style := [];
  DBGridOficina.Columns[ToIndex].Title.Font.Style := [fsBold];
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasOS, DBGridOficina, vDadosIni.vNomeUsuario, 'cdsHistOSEstMotos', self, ScrollBoxOS, trans);
end;

procedure TfrmEstMotosCCIA.DBGridOficinaTitleClick(Column: TColumn);
begin
  inherited;
vDadosIni.DBGridOnTitleClick(DBGridOficina, Column);
end;

procedure TfrmEstMotosCCIA.DBGridOrcamentoColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
var
  i:integer;
begin
  for I := 0 to DBGridOrcamento.Columns.Count - 1 do
    DBGridOrcamento.Columns[i].Title.Font.Style := [];
  DBGridOrcamento.Columns[ToIndex].Title.Font.Style := [fsBold];
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasORC, DBGridOrcamento, vDadosIni.vNomeUsuario, 'cdsHistORCEstMotos', self, ScrollBoxORC, trans);
end;

procedure TfrmEstMotosCCIA.DBGridOrcamentoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('TIPO').AsString) = 'ORC')
   and (trim(TDBGrid(sender).DataSource.DataSet.FieldByName('STATUS_V').AsString) = 'CANCELADO') then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00009BDD);
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmEstMotosCCIA.DBLookupComboBox14Exit(Sender: TObject);
begin
 try
   EditHw2.AsValue := DBLookupComboBox14.KeyValue;
   EstMoto.vDespesaVeic.vPlanoC.abrePContas(EstMoto.vDespesaVeic.LocTipoDespesa.dataSet.FieldByName('N_CONTA_PLC').AsInteger);
 except
 end;
end;

procedure TfrmEstMotosCCIA.DBLookupComboBox15Exit(Sender: TObject);
begin
  try
   EditHw3.AsValue := DBLookupComboBox15.KeyValue;
   EstMoto.vDespesaVeic.LocCliDespesa.abreClientes(DBLookupComboBox15.KeyValue)
  except
  end;
end;

procedure TfrmEstMotosCCIA.EditHw2Exit(Sender: TObject);
begin
  try
    DBLookupComboBox14.KeyValue := EditHw2.AsInteger;
    EstMoto.vDespesaVeic.vPlanoC.abrePContas(EstMoto.vDespesaVeic.LocTipoDespesa.dataSet.FieldByName('N_CONTA_PLC').AsInteger);
  except
  end;
end;

procedure TfrmEstMotosCCIA.EditHw2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      TEditHw(Sender).Text := vDadosIni.pesquisaRapida('TIPO_DESPESA');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadTipoDespesa', 'O Formulário Cadastro de Tipos de Despesa se encontra aberto!') then
      exit;
    EstMoto.vDespesaVeic.AbreTipoDesp;
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        TEditHw(Sender).Text := vDadosIni.vPesquisa;
        EstMoto.vDespesaVeic.LocTipoDespesa.abreLocTipoDespesa;
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.EditHw3Exit(Sender: TObject);
begin
  inherited;
  try
   DBLookupComboBox15.KeyValue := EditHw3.AsInteger;
   EstMoto.vDespesaVeic.LocCliDespesa.abreClientes(EditHw3.AsInteger);
  except
  end;
end;

procedure TfrmEstMotosCCIA.EditHw3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vCliente: TCadClientes;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      EditHw3.AsValue := StrToInt(vDadosIni.pesquisaRapida('CLIENTES'));
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
    if not _mdiAberto('TfrmCadClientes', 'O Formulário Cadastro de Clientes/Fornecedor se encontra aberto!') then
      exit;
    EstMoto.vClientesVeic.AbrirCliente(EstMoto.vDespesaVeic.dataSet.FieldByName('COD_CLIENTE').AsString);
    if vDadosIni.vPesquisa <> '' then
    begin
      try
        EditHw3.AsValue := StrToInt(vDadosIni.vPesquisa);
        EstMoto.vClientesVeic.abreClientes(StrToInt(vDadosIni.vPesquisa), 'E');
      except
      end;
    end;
    vDadosIni.vPesquisa := '';
  end;
end;

procedure TfrmEstMotosCCIA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (cdsColunasNFE <> nil) and (DBGridNFE.DataSource <> nil) then
    vDadosIni.configuraChecks(TClientDataSet(DBGridNFE.DataSource.DataSet), self);
  if (cdsColunasNFS <> nil) and (DBGridNFS.DataSource <> nil) then
    vDadosIni.configuraChecks(TClientDataSet(DBGridNFS.DataSource.DataSet), self);
  if (cdsColunasNFT <> nil) and (DBGridNFT.DataSource <> nil) then
    vDadosIni.configuraChecks(TClientDataSet(DBGridNFT.DataSource.DataSet), self);
  if (cdsColunasCTRE <> nil) and (DBGridCTRE.DataSource <> nil) then
    vDadosIni.configuraChecks(TClientDataSet(DBGridCTRE.DataSource.DataSet), self);
  if (cdsColunasCTRS <> nil) and (DBGridCTRS.DataSource <> nil) then
    vDadosIni.configuraChecks(TClientDataSet(DBGridCTRS.DataSource.DataSet), self);
  if (cdsColunasORC <> nil) and (DBGridOrcamento.DataSource <> nil) then
    vDadosIni.configuraChecks(TClientDataSet(DBGridOrcamento.DataSource.DataSet), self);
  if (cdsColunasOS <> nil) and (DBGridOficina.DataSource <> nil) then
    vDadosIni.configuraChecks(TClientDataSet(DBGridOficina.DataSource.DataSet), self);
  inherited;

  gravaConfiguracoesFormRegistro;

  if (EstMoto <> nil) then
    EstMoto.Cancel;

  EstMoto.free;
  EstMoto := nil;

  Action := caFree;
  if (frmEstMotosCCIA <> nil) then
    frmEstMotosCCIA := nil;
end;

procedure TfrmEstMotosCCIA.FormCreate(Sender: TObject);
var
  I: Integer;
begin
	vCriou := 0;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'ESTMOTO' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
    vDadosIni.vPesquisa := '';
    frmEstMotosCCIA := TfrmEstMotosCCIA(self);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'ESTMOTOEDIT' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 7;
    vDadosIni.vModalOuChild := 'M';
    vDadosIni.vPesquisa := '';
    frmEstMotosCCIA := TfrmEstMotosCCIA(self);
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  TabSheet3.TabVisible := False;
  inherited;
  EstMoto := TEstMotoCCIA.create;
  EstMoto.AbreEstMoto;

  for I := 0 to PageControl1.PageCount - 1 do
    PageControl1.Pages[i].TabVisible := false;

  for I := 0 to PageControl3.PageCount - 1 do
    PageControl3.Pages[i].TabVisible := false;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TfrmEstMotosCCIA.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if PageControl1.ActivePage = TabSheet2  then
  begin
    if Key = VK_F11 then
      ckNovo.Checked := not ckNovo.Checked
    else if Key = VK_F12 then
      ckUsado.Checked := not ckUsado.Checked
    else if Key = VK_F7 then
      ckDeposito.Checked := not ckDeposito.Checked
    else if Key = VK_INSERT then
      BitBtn3Click(Sender);
  end;
end;

procedure TfrmEstMotosCCIA.FormShow(Sender: TObject);
begin
  if not Self.Enabled then
  	Exit;

  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'ESTMOTO' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
    vDadosIni.vPesquisa := '';
    frmEstMotosCCIA := TfrmEstMotosCCIA(self);
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'ESTMOTOEDIT' then
  begin
    if DtmVeiculosCCIA = nil then
      DtmVeiculosCCIA := TDtmVeiculosCCIA.Create(DtmVeiculosCCIA);
    vDadosIni.vTipoForm := 7;
    vDadosIni.vModalOuChild := 'M';
    vDadosIni.vPesquisa := '';
    frmEstMotosCCIA := TfrmEstMotosCCIA(self);
  end;
  TelaCadastro := vDadosIni.vTipoForm;
  vDadosIni.vPesquisa := '';
  vDadosIni.vTipoForm := 0;

  if vShow <> 1 then
  begin
    vTabela := 'HIST_ESTMOTO';
    vCampoPadrao := 'COD_HIST';
    trans := vDadosIni.transacaoCol;

    DBGridNFE.DataSource := dtmVeiculosCCIA.dsHistNFEEstmotos;
    if vCriou = 0 then
    begin
      cdsColunasNFE := TClientDataSet(vDadosIni.dataSetCol);
      vDadosIni.setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, cdsColunasNFE,
      'cdsHistNFEEstmotos', DBGridNFE, vTabela, vCampoPadrao, self, vCheck, ScrollBoxNFE);
    end;

    DBGridNFS.DataSource := dtmVeiculosCCIA.dsHistNFSEstmotos;
    if vCriou = 0 then
    begin
      cdsColunasNFS := TClientDataSet(vDadosIni.dataSetCol);
      vDadosIni.setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, cdsColunasNFS,
      'cdsHistNFSEstmotos', DBGridNFS, vTabela, vCampoPadrao, self, vCheck, ScrollBoxNFS);
    end;

    DBGridNFT.DataSource := dtmVeiculosCCIA.dsHistNFTEstmotos;
    if vCriou = 0 then
    begin
      cdsColunasNFT := TClientDataSet(vDadosIni.dataSetCol);
      vDadosIni.setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, cdsColunasNFT,
      'cdsHistNFTEstmotos', DBGridNFT, vTabela, vCampoPadrao, self, vCheck, ScrollBoxNFT);
    end;

    DBGridCTRE.DataSource := dtmVeiculosCCIA.dsHistCTREEstMotos;
    if vCriou = 0 then
    begin
      cdsColunasCTRE := TClientDataSet(vDadosIni.dataSetCol);
      vDadosIni.setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, cdsColunasCTRE,
      'cdsHistCTREEstMotos', DBGridCTRE, vTabela, vCampoPadrao, self, vCheck, ScrollBoxCTRE);
    end;

    DBGridCTRS.DataSource := dtmVeiculosCCIA.dsHistCTRSEstmotos;
    if vCriou = 0 then
    begin
      cdsColunasCTRS := TClientDataSet(vDadosIni.dataSetCol);
      vDadosIni.setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, cdsColunasCTRS,
      'cdsHistCTRSEstMotos', DBGridCTRS, vTabela, vCampoPadrao, self, vCheck, ScrollBoxCTRS);
    end;

    DBGridOrcamento.DataSource := dtmVeiculosCCIA.dsHistORCEstMotos;
    if vCriou = 0 then
    begin
      cdsColunasORC := TClientDataSet(vDadosIni.dataSetCol);
      vDadosIni.setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, cdsColunasORC,
      'cdsHistORCEstMotos', DBGridOrcamento, vTabela, vCampoPadrao, self, vCheck, ScrollBoxORC);
    end;

    DBGridOficina.DataSource := dtmVeiculosCCIA.dsHistOSEstMotos;
    if vCriou = 0 then
    begin
      cdsColunasOS := TClientDataSet(vDadosIni.dataSetCol);
      vDadosIni.setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol, cdsColunasOS,
      'cdsHistOSEstMotos', DBGridOficina, vTabela, vCampoPadrao, self, vCheck, ScrollBoxOS);
    end;

    DBGrid1.DataSource := dtmVeiculosCCIA.dsEstMotos;
    if vCriou = 0 then
    begin
    	inherited;
    	setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
    end;
  end;
  if (TelaCadastro = 7) then
    ConfigurarForm('N');

  if (TelaCadastro = 6) then
    BitBtn3.Click
  else if (TelaCadastro = 7) then
  begin
    EstMoto.AbreEstMoto(vDadosIni.vDtSetTmp.FieldByName('CODIGO').AsInteger, vDadosIni.vDtSetTmp.FieldByName('CHASSI_C').AsString);
    if not EstMoto.dataSet.IsEmpty then
      SpeedButton1Click(Sender);
  end;

  if vCriou = 0 then
    vAgruparHist := EstMoto.retornaValor('select coalesce(agrupar_historico_veic, '''') as valor from empresa ' +
     ' where cod_empresa = ' + vDadosIni.codEmpresa);

  vDadosIni.fechaStatusProcessamento;
  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "VEI096" HABILITAR INFORMAÇÕES DE REDUÇÃO NO CADASTRO DE VEICULOS COM MOVIMENTACAO' +#13+
    'Processo "VEI102" HABILITAR CAMPO TIPO DE OPERAÇÃO' + #13 +
    'Processo "VEI113" HABILITAR CAMPOS NOTA FISCAL DE ENTRADA' + #13 +
    'Processo "VEI126" HABILITAR BOTAO DE CONFIRMACAO DE VEICULOS QUE POSSUEM PENDENCIAS' + #13 +
    'Processo "VEI127" ATUALIZAR INFORMACOES DO VEICULO (NOTAFISCAL, COMANDO, HISTORICOS)';

  imgInformationTipoOP.Hint := 'TIPO OP (ENTRADA/SAÍDA)' + #13 + #13 +
    'A - ATIVO IMOBILIZADO' + #13 +
    'C - CONSIGNAÇÃO' + #13 +
    'D - DEMONSTRAÇÃO DE MERCADORIAS' + #13 +
    'E - DEVOLUÇÃO' + #13 +
    'I - INTERMEDIAÇÃO' + #13 +
    'O - OUTRAS OPERAÇÕES' + #13 +
    'R - RETORNO DE DEMONSTRAÇÃO' + #13 +
    'T - TRANSFERÊNCIA' + #13 +
    'V - MERCADORIA ADQUIRIDA';

  leConfiguracoesFormRegistro;

  DBGrid1.Refresh;

  if (vCriou = 0) and (vDadosIni.vMensagemConsorcio = 'S') then
    if not (vDadosIni.VerificarDataAssembleia(EstMoto.buscas))then
      Application.MessageBox('Reservas de consorcio sem data da assembleia definida.', 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);

  if vCriou = 0 then
    vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TfrmEstMotosCCIA.getFaturas;
var
  I: Integer;
begin
  try
      EstMoto.vDespesaVeic.FDespesas.numeroDocumento[frmEstMotosCCIA.ListBox3.ItemIndex] := frmEstMotosCCIA.edDocFaturaEntrada.Text;
      EstMoto.vDespesaVeic.FDespesas.vencimentoDocumento[frmEstMotosCCIA.ListBox3.ItemIndex] := frmEstMotosCCIA.edVencimentoFaturaEntrada.Text;
      EstMoto.vDespesaVeic.FDespesas.valorDocumento[frmEstMotosCCIA.ListBox3.ItemIndex] := frmEstMotosCCIA.edValorFaturaEntrada.AsValue;
//      ListBox3.Items.Insert(frmEstMotosCCIA.ListBox3.ItemIndex,
//        EstMoto.vDespesaVeic.FDespesas.vencimentoDocumento[frmEstMotosCCIA.ListBox3.ItemIndex] + '   -   ' +
//        EstMoto.vDespesaVeic.FDespesas.numeroDocumento[frmEstMotosCCIA.ListBox3.ItemIndex] + '   -   ' +
//        Format('%12.2n', [EstMoto.vDespesaVeic.FDespesas.valorDocumento[frmEstMotosCCIA.ListBox3.ItemIndex]]));
    ListBox3.Clear;
    for I := 0 to EstMoto.vDespesaVeic.FDespesas.parcelas - 1 do
      ListBox3.Items.Add(trim(EstMoto.vDespesaVeic.FDespesas.numeroDocumento[i]) + '   ' +
        trim(EstMoto.vDespesaVeic.FDespesas.vencimentoDocumento[i]) + '    ' + 'R$ ' +
        trim(Format('%12.2n', [EstMoto.vDespesaVeic.FDespesas.valorDocumento[i]])));
  except
  end;
end;

procedure TfrmEstMotosCCIA.gravaConfiguracoesFormRegistro;
begin
	if (TelaCadastro <= 0) then
  begin
  	_GravaConfiguracoesBoolean(ckNovo.Name, ckNovo.Checked);
    _GravaConfiguracoesBoolean(ckUsado.Name, ckUsado.Checked);
    _GravaConfiguracoesBoolean(ckDeposito.Name, ckDeposito.Checked);
  end;

  if (not SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
    CheckBox3.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
  begin
  	_GravaConfiguracoesString(btPosicao.Name, btPosicao.Caption);
    _GravaConfiguracoesBoolean(ckVivo.Name, ckVivo.Checked);
    _GravaConfiguracoesBoolean(ckTransito.Name, ckTransito.Checked);
    _GravaConfiguracoesBoolean(ckEstacionamento.Name, ckEstacionamento.Checked);
    _GravaConfiguracoesBoolean(ckMorto.Name, ckMorto.Checked);

    _GravaConfiguracoesString(btStatus.Name, btStatus.Caption);
    _GravaConfiguracoesInteger(cbReserva.Name, cbReserva.ItemIndex);
    _GravaConfiguracoesInteger(cbDemonstracao.Name, cbDemonstracao.ItemIndex);
    _GravaConfiguracoesInteger(cbUsadoTroca.Name, cbUsadoTroca.ItemIndex);
    _GravaConfiguracoesInteger(cbCancelado.Name, cbCancelado.ItemIndex);

    _GravaConfiguracoesString(btSituacaoEst.Name, btSituacaoEst.Caption);
    _GravaConfiguracoesBoolean(ckComEstoque.Name, ckComEstoque.Checked);
    _GravaConfiguracoesBoolean(ckSemEstoque.Name, ckSemEstoque.Checked);

    _GravaConfiguracoesString(btSituacaoTpOP.Name, btSituacaoTpOP.Caption);
    _GravaConfiguracoesBoolean(ckEstReal.Name, ckEstReal.Checked);
    _GravaConfiguracoesBoolean(ckCons.Name, ckCons.Checked);
    _GravaConfiguracoesBoolean(ckInter.Name, ckInter.Checked);
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

procedure TfrmEstMotosCCIA.groupAdicionalExit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TfrmEstMotosCCIA.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (TelaCadastro <= 0) then
  begin
    ckNovo.Checked := _LerConfiguracoesRegistroBoolean(ckNovo.Name);
    ckUsado.Checked := _LerConfiguracoesRegistroBoolean(ckUsado.Name);
    ckDeposito.Checked := _LerConfiguracoesRegistroBoolean(ckDeposito.Name);
  end;

  if (TelaCadastro <= 0) and (CheckBox3.Checked) then
  begin
  	btPosicao.Caption := _LerConfiguracoesRegistroString(btPosicao.Name, 'E');
    ckVivo.Checked := _LerConfiguracoesRegistroBoolean(ckVivo.Name);
    ckTransito.Checked := _LerConfiguracoesRegistroBoolean(ckTransito.Name);
    ckEstacionamento.Checked := _LerConfiguracoesRegistroBoolean(ckEstacionamento.Name);
    ckMorto.Checked := _LerConfiguracoesRegistroBoolean(ckMorto.Name);

    btStatus.Caption := _LerConfiguracoesRegistroString(btStatus.Name, 'E');
    cbReserva.ItemIndex := _LerConfiguracoesRegistroInteger(cbReserva.Name);
    cbDemonstracao.ItemIndex := _LerConfiguracoesRegistroInteger(cbDemonstracao.Name);
    cbUsadoTroca.ItemIndex := _LerConfiguracoesRegistroInteger(cbUsadoTroca.Name);
    cbCancelado.ItemIndex := _LerConfiguracoesRegistroInteger(cbCancelado.Name);

    btSituacaoEst.Caption := _LerConfiguracoesRegistroString(btSituacaoEst.Name, 'E');
    ckComEstoque.Checked := _LerConfiguracoesRegistroBoolean(ckComEstoque.Name);
    ckSemEstoque.Checked := _LerConfiguracoesRegistroBoolean(ckSemEstoque.Name);

    btSituacaoTpOP.Caption := _LerConfiguracoesRegistroString(btSituacaoTpOP.Name, 'E');
    ckEstReal.Checked := _LerConfiguracoesRegistroBoolean(ckEstReal.Name);
    ckCons.Checked := _LerConfiguracoesRegistroBoolean(ckCons.Name);
    ckInter.Checked := _LerConfiguracoesRegistroBoolean(ckInter.Name);
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

procedure TfrmEstMotosCCIA.MenuItem10Click(Sender: TObject);
begin
  vDadosIni.Copiarparareadetransferncia(DBGridNFS);
end;

procedure TfrmEstMotosCCIA.MenuItem11Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('VEI118', 'CONFIGURAR', '', 'EST_MOTO', '', EstMoto.buscas, true) then
   vDadosIni.Configurarcolunas(cdsColunasCTRE, DBGridCTRE, GroupBoxCTRE, ScrollBoxCTRE, Self);
end;

procedure TfrmEstMotosCCIA.MenuItem12Click(Sender: TObject);
begin
 vDadosIni.resetarConfiguracoesDeColunas(cdsColunasCTRE, 'cdsHistCTREEstMotos', trans, vDadosIni.vNomeUsuario, true);
end;

procedure TfrmEstMotosCCIA.MenuItem13Click(Sender: TObject);
begin
  vDadosIni.montarExcel(DBGridCTRE, 'Contrato de Entrada');
end;

procedure TfrmEstMotosCCIA.MenuItem14Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunas(DBGridCTRE);
end;

procedure TfrmEstMotosCCIA.MenuItem15Click(Sender: TObject);
begin
  vDadosIni.Copiarparareadetransferncia(DBGridCTRE);
end;

procedure TfrmEstMotosCCIA.MenuItem16Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('VEI119', 'CONFIGURAR', '', 'EST_MOTO', '', EstMoto.buscas, true) then
   vDadosIni.Configurarcolunas(cdsColunasCTRS, DBGridCTRS, GroupBoxCTRS, ScrollBoxCTRS, Self);
end;

procedure TfrmEstMotosCCIA.MenuItem17Click(Sender: TObject);
begin
  vDadosIni.resetarConfiguracoesDeColunas(cdsColunasCTRS, 'cdsHistCTRSEstMotos', trans, vDadosIni.vNomeUsuario, true);
end;

procedure TfrmEstMotosCCIA.MenuItem18Click(Sender: TObject);
begin
  if (vDadosIni.vEmp.vTipoEmpVeiculos <> 'C') then
    vDadosIni.montarExcel(DBGridCTRS, 'Contrato de Saída')
  else
    vDadosIni.montarExcel(DBGridCTRS, 'Comando de Faturamento');
end;

procedure TfrmEstMotosCCIA.MenuItem19Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunas(DBGridCTRS);
end;

procedure TfrmEstMotosCCIA.MenuItem1Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('VEI115', 'CONFIGURAR', '', 'EST_MOTO', '', EstMoto.buscas, true) then
  vDadosIni.Configurarcolunas(cdsColunasNFE, DBGridNFE, GroupBoxNFE, ScrollBoxNFE, Self);
end;

procedure TfrmEstMotosCCIA.MenuItem20Click(Sender: TObject);
begin
  vDadosIni.Copiarparareadetransferncia(DBGridCTRS);
end;

procedure TfrmEstMotosCCIA.MenuItem21Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('VEI121', 'CONFIGURAR', '', 'EST_MOTO', '', EstMoto.buscas, true) then
  vDadosIni.Configurarcolunas(cdsColunasORC, DBGridOrcamento, GroupBoxORC, ScrollBoxORC, Self);
end;

procedure TfrmEstMotosCCIA.MenuItem22Click(Sender: TObject);
begin
  vDadosIni.resetarConfiguracoesDeColunas(cdsColunasORC, 'cdsHistORCEstMotos', trans, vDadosIni.vNomeUsuario, true);
end;

procedure TfrmEstMotosCCIA.MenuItem23Click(Sender: TObject);
begin
  vDadosIni.montarExcel(DBGridOrcamento, 'Orçamento');
end;

procedure TfrmEstMotosCCIA.MenuItem24Click(Sender: TObject);
begin
 vDadosIni.AjustaLaguraColunas(DBGridOrcamento);
end;

procedure TfrmEstMotosCCIA.MenuItem25Click(Sender: TObject);
begin
  vDadosIni.Copiarparareadetransferncia(DBGridOrcamento);
end;

procedure TfrmEstMotosCCIA.MenuItem26Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('VEI120', 'CONFIGURAR', '', 'EST_MOTO', '', EstMoto.buscas, true) then
   vDadosIni.Configurarcolunas(cdsColunasOS, DBGridOficina, GroupBoxOS, ScrollBoxOS, Self);
end;

procedure TfrmEstMotosCCIA.MenuItem27Click(Sender: TObject);
begin
  vDadosIni.resetarConfiguracoesDeColunas(cdsColunasOS, 'cdsHistOSEstMotos', trans, vDadosIni.vNomeUsuario, true);
end;

procedure TfrmEstMotosCCIA.MenuItem28Click(Sender: TObject);
begin
  vDadosIni.montarExcel(DBGridOficina, 'Ordem de Serviço');
end;

procedure TfrmEstMotosCCIA.MenuItem29Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunas(DBGridOficina);
end;

procedure TfrmEstMotosCCIA.MenuItem2Click(Sender: TObject);
begin
 vDadosIni.resetarConfiguracoesDeColunas(cdsColunasNFE, 'cdsHistNFEEstmotos', trans, vDadosIni.vNomeUsuario, true);
end;

procedure TfrmEstMotosCCIA.MenuItem30Click(Sender: TObject);
begin
  vDadosIni.Copiarparareadetransferncia(DBGridOficina);
end;

procedure TfrmEstMotosCCIA.MenuItem31Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('VEI117', 'CONFIGURAR', '', 'EST_MOTO', '', EstMoto.buscas, true) then
   vDadosIni.Configurarcolunas(cdsColunasNFT, DBGridNFT, GroupBoxNFT, ScrollBoxNFT, Self);
end;

procedure TfrmEstMotosCCIA.MenuItem32Click(Sender: TObject);
begin
  vDadosIni.resetarConfiguracoesDeColunas(cdsColunasNFT, 'cdsHistNFTEstmotos', trans, vDadosIni.vNomeUsuario, true);
end;

procedure TfrmEstMotosCCIA.MenuItem33Click(Sender: TObject);
begin
  vDadosIni.montarExcel(DBGridNFT, 'Nota Fiscais em Trânsito');
end;

procedure TfrmEstMotosCCIA.MenuItem34Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunas(DBGridNFT);
end;

procedure TfrmEstMotosCCIA.MenuItem35Click(Sender: TObject);
begin
  vDadosIni.Copiarparareadetransferncia(DBGridNFT);
end;

procedure TfrmEstMotosCCIA.MenuItem3Click(Sender: TObject);
begin
 vDadosIni.montarExcel(DBGridNFE, 'Notas Fiscal de Entrada');
end;

procedure TfrmEstMotosCCIA.MenuItem4Click(Sender: TObject);
begin
 vDadosIni.AjustaLaguraColunas(DBGridNFE);
end;

procedure TfrmEstMotosCCIA.MenuItem5Click(Sender: TObject);
begin
  vDadosIni.Copiarparareadetransferncia(DBGridNFE);
end;

procedure TfrmEstMotosCCIA.MenuItem6Click(Sender: TObject);
begin
 if vDadosIni.PesqPros('VEI116', 'CONFIGURAR', '', 'EST_MOTO', '', EstMoto.buscas, true) then
   vDadosIni.Configurarcolunas(cdsColunasNFS, DBGridNFS, GroupBoxNFS, ScrollBoxNFS, Self);
end;

procedure TfrmEstMotosCCIA.MenuItem7Click(Sender: TObject);
begin
  vDadosIni.resetarConfiguracoesDeColunas(cdsColunasNFS, 'cdsHistNFSEstmotos', trans, vDadosIni.vNomeUsuario, true);
end;

procedure TfrmEstMotosCCIA.MenuItem8Click(Sender: TObject);
begin
  vDadosIni.montarExcel(DBGridNFS, 'Nota Fiscais de Saída');
end;

procedure TfrmEstMotosCCIA.MenuItem9Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunas(DBGridNFS);
end;

procedure TfrmEstMotosCCIA.PageControl3Change(Sender: TObject);
var
  I: integer;
begin
  try
    inherited;
    Screen.Cursor := crHourGlass;
    if PageControl3.ActivePage = TabSheet_Pendencias then
    begin
      EstMoto.vPendenciaVeic._AbrePendencia(EstMoto);
       if EstMoto.vPendenciaVeic.dataSet.Active then
        for I := 0 to DBGrid3.Columns.Count - 1 do
          if DBGrid3.Columns[i].FieldName = 'OBS' then
            DBGrid3.Columns[i].ButtonStyle := cbsEllipsis;
         //Soma os valores do Grid
      EditMoedaSomaTotalPend.Valor := _SomarValoresGridPendencia;
      _DesabilitarCamposPendencia;

      if (Self.Enabled) and (Self.Visible) and (BitBtn_Novo_Pendencia.CanFocus) then
        BitBtn_Novo_Pendencia.SetFocus;
    end
    else if PageControl3.ActivePage = TabSheet_Despesas then
    begin
      EstMoto.vDespesaVeic._AbreDespesa(EstMoto);
      if EstMoto.vDespesaVeic.dataSet.Active then
        for I := 0 to DBGrid4.Columns.Count - 1 do
          if DBGrid4.Columns[i].FieldName = 'OBS' then
            DBGrid4.Columns[i].ButtonStyle := cbsEllipsis;
         //Soma os valores do Grid
      EditMoedaSomaTotalDespesas.Valor := _SomarValoresGridDespesa;
      _DesabilitarCamposDespesa;

      if (Self.Enabled) and (Self.Visible) and (BitBtn_Novo_Despesa.CanFocus) then
        BitBtn_Novo_Despesa.SetFocus;
    end
    else if PageControl3.ActivePage = TabSheet_Contratos then
    begin
       GroupBox20.Parent := Panel17;
       GroupBox10.Height := Trunc((GroupBox5.Height / 2) - 28);
       GroupBox11.Height := Trunc((GroupBox5.Height / 2) - 28);
       GroupBox10.Align := alTop;
       GroupBox11.Align := alClient;
    end
    else if PageControl3.ActivePage = TabSheet_Notas then
    begin
       GroupBox20.Parent := Panel10;
       GroupBox8.Height := Trunc((GroupBox7.Height / 2) - 28);
       GroupBox9.Height := Trunc((GroupBox7.Height / 2) - 28);
       GroupBox8.Align := alTop;
       GroupBox9.Align := alClient;
    end
    else if PageControl3.ActivePage = TabSheet_Oficina then
    begin
       GroupBox20.Parent := Panel18;
       GroupBox27.Height := Trunc((GroupBox6.Height / 2) - 28);
       GroupBox29.Height := Trunc((GroupBox6.Height / 2) - 28);
       GroupBox27.Align := alTop;
       GroupBox29.Align := alClient;
    end
    else if PageControl3.ActivePage = TabSheet_NotasTransito then
    begin
      GroupBox20.Parent := Panel40;
    end
    else if PageControl3.ActivePage = TabSheet_Dados then
      SelectNext(ActiveControl, true, true);
  finally
    AtualizarHistorico;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.rbNomeFantasiaClick(Sender: TObject);
var
  I: Integer;
  vGrid, vGrid2: TDBGrid;
begin
  inherited;
  if PageControl3.ActivePage = TabSheet_Notas then
  begin
    vGrid := DBGridNFE;
    vGrid2 := DBGridNFS;
  end
  else if PageControl3.ActivePage = TabSheet_Contratos then
  begin
    vGrid := DBGridCTRE;
    vGrid2 := DBGridCTRS;
  end
  else if PageControl3.ActivePage = TabSheet_Oficina then
  begin
    vGrid := DBGridOrcamento;
    vGrid2 := DBGridOficina;
  end
  else if PageControl3.ActivePage = TabSheet_NotasTransito then
  begin
    vGrid := DBGridNFT;
  end;

  if rbNomeFantasia.Checked then
  begin
    for I := 0 to vGrid.Columns.Count - 1 do
      if vGrid.Columns[i].FieldName = 'CLIENTE' then
        vGrid.Columns[i].Title.Caption := 'Cliente Nome Fantasia';

    if PageControl3.ActivePage <> TabSheet_NotasTransito then
      for I := 0 to vGrid2.Columns.Count - 1 do
       if vGrid2.Columns[i].FieldName = 'CLIENTE' then
         vGrid2.Columns[i].Title.Caption := 'Cliente Nome Fantasia';

    for I := 0 to vGrid.Columns.Count - 1 do
      if vGrid.Columns[i].FieldName = 'INTERMEDIADOR' then
        vGrid.Columns[i].Title.Caption := 'Intermediador Nome Fantasia';

    if PageControl3.ActivePage <> TabSheet_NotasTransito then
      for I := 0 to vGrid2.Columns.Count - 1 do
        if vGrid2.Columns[i].FieldName = 'INTERMEDIADOR' then
          vGrid2.Columns[i].Title.Caption := 'Intermediador Nome Fantasia';

    for I := 0 to vGrid.Columns.Count - 1 do
      if vGrid.Columns[i].FieldName = 'CONCESSIONARIA' then
        vGrid.Columns[i].Title.Caption := 'Concessionaria Nome Fantasia';

    if PageControl3.ActivePage <> TabSheet_NotasTransito then
      for I := 0 to vGrid2.Columns.Count - 1 do
        if vGrid2.Columns[i].FieldName = 'CONCESSIONARIA' then
          vGrid2.Columns[i].Title.Caption := 'Concessionaria Nome Fantasia';

    for I := 0 to vGrid.Columns.Count - 1 do
      if vGrid.Columns[i].FieldName = 'CLIENTE_VENDEDOR' then
        vGrid.Columns[i].Title.Caption := 'Cliente Vendedor Nome Fantasia';

    if PageControl3.ActivePage <> TabSheet_NotasTransito then
      for I := 0 to vGrid2.Columns.Count - 1 do
        if vGrid2.Columns[i].FieldName = 'CLIENTE_VENDEDOR' then
          vGrid2.Columns[i].Title.Caption := 'Cliente Vendedor Nome Fantasia';

  end
  else if rbRazaoSocial.Checked then
  begin
    for I := 0 to vGrid.Columns.Count - 1 do
      if vGrid.Columns[i].FieldName = 'CLIENTE' then
        vGrid.Columns[i].Title.Caption := 'Cliente Razao Social';

    if PageControl3.ActivePage <> TabSheet_NotasTransito then
      for I := 0 to vGrid2.Columns.Count - 1 do
        if vGrid2.Columns[i].FieldName = 'CLIENTE' then
          vGrid2.Columns[i].Title.Caption := 'Cliente Razao Social';

    for I := 0 to vGrid.Columns.Count - 1 do
      if vGrid.Columns[i].FieldName = 'INTERMEDIADOR' then
        vGrid.Columns[i].Title.Caption := 'Intermediador Razao Social';

    if PageControl3.ActivePage <> TabSheet_NotasTransito then
      for I := 0 to vGrid2.Columns.Count - 1 do
        if vGrid2.Columns[i].FieldName = 'INTERMEDIADOR' then
          vGrid2.Columns[i].Title.Caption := 'Intermediador Razao Social';

    for I := 0 to vGrid.Columns.Count - 1 do
      if vGrid.Columns[i].FieldName = 'CONCESSIONARIA' then
        vGrid.Columns[i].Title.Caption := 'Concessionaria Razao Social';

    if PageControl3.ActivePage <> TabSheet_NotasTransito then
      for I := 0 to vGrid2.Columns.Count - 1 do
        if vGrid2.Columns[i].FieldName = 'CONCESSIONARIA' then
          vGrid2.Columns[i].Title.Caption := 'Concessionaria Razao Social';

    for I := 0 to vGrid.Columns.Count - 1 do
      if vGrid.Columns[i].FieldName = 'CLIENTE_VENDEDOR' then
        vGrid.Columns[i].Title.Caption := 'Cliente Vendedor Razao Social';

    if PageControl3.ActivePage <> TabSheet_NotasTransito then
      for I := 0 to vGrid2.Columns.Count - 1 do
        if vGrid2.Columns[i].FieldName = 'CLIENTE_VENDEDOR' then
          vGrid2.Columns[i].Title.Caption := 'Cliente Vendedor Razao Social';

  end;
  AtualizarHistorico(true);
end;

procedure TfrmEstMotosCCIA.ScrollBoxCTREEnter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TfrmEstMotosCCIA.ScrollBoxCTREExit(Sender: TObject);
begin
  if (cdsColunasCTRE = nil) or (not cdsColunasCTRE.Active) or (not vConfigColuna) then
    exit;
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasCTRE, DBGridCTRE, vDadosIni.vNomeUsuario, 'cdsHistCTREEstMotos', self, ScrollBoxCTRE, trans);
  GroupBoxCTRE.Visible := false;
  vDadosIni.mostraColunas(cdsColunasCTRE, DBGridCTRE, vDadosIni.vNomeUsuario, 'cdsHistCTREEstMotos', vTabela, vCampoPadrao);
end;

procedure TfrmEstMotosCCIA.ScrollBoxCTRSEnter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TfrmEstMotosCCIA.ScrollBoxCTRSExit(Sender: TObject);
begin
  if (cdsColunasCTRS = nil) or (not cdsColunasCTRS.Active) or (not vConfigColuna) then
    exit;
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasCTRS, DBGridCTRS, vDadosIni.vNomeUsuario, 'cdsHistCTRSEstMotos', self, ScrollBoxCTRS, trans);
  GroupBoxCTRS.Visible := false;
  vDadosIni.mostraColunas(cdsColunasCTRS, DBGridCTRS, vDadosIni.vNomeUsuario, 'cdsHistCTRSEstMotos', vTabela, vCampoPadrao);
end;

procedure TfrmEstMotosCCIA.ScrollBoxNFEEnter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TfrmEstMotosCCIA.ScrollBoxNFEExit(Sender: TObject);
begin
  if (cdsColunasNFE = nil) or (not cdsColunasNFE.Active) or (not vConfigColuna) then
    exit;
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasNFE, DBGridNFE, vDadosIni.vNomeUsuario, 'cdsHistNFEEstmotos', self, ScrollBoxNFE, trans);
  GroupBoxNFE.Visible := false;
  vDadosIni.mostraColunas(cdsColunasNFE, DBGridNFE, vDadosIni.vNomeUsuario, 'cdsHistNFEEstmotos', vTabela, vCampoPadrao);
end;

procedure TfrmEstMotosCCIA.ScrollBoxNFSEnter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TfrmEstMotosCCIA.ScrollBoxNFSExit(Sender: TObject);
begin
  if (cdsColunasNFS = nil) or (not cdsColunasNFS.Active) or (not vConfigColuna) then
    exit;
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasNFS, DBGridNFS, vDadosIni.vNomeUsuario, 'cdsHistNFSEstmotos', self, ScrollBoxNFS, trans);
  GroupBoxNFS.Visible := false;
  vDadosIni.mostraColunas(cdsColunasNFS, DBGridNFS, vDadosIni.vNomeUsuario, 'cdsHistNFSEstmotos', vTabela, vCampoPadrao);
end;

procedure TfrmEstMotosCCIA.ScrollBoxORCEnter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TfrmEstMotosCCIA.ScrollBoxORCExit(Sender: TObject);
begin
  if (cdsColunasORC = nil) or (not cdsColunasORC.Active) or (not vConfigColuna) then
    exit;
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasORC, DBGridOrcamento, vDadosIni.vNomeUsuario, 'cdsHistORCEstMotos', self, ScrollBoxORC, trans);
  GroupBoxORC.Visible := false;
  vDadosIni.mostraColunas(cdsColunasORC, DBGridOrcamento, vDadosIni.vNomeUsuario, 'cdsHistORCEstMotos', vTabela, vCampoPadrao);
end;

procedure TfrmEstMotosCCIA.ScrollBoxOSEnter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TfrmEstMotosCCIA.ScrollBoxOSExit(Sender: TObject);
begin
  if (cdsColunasOS = nil) or (not cdsColunasOS.Active) or (not vConfigColuna) then
    exit;
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasOS, DBGridOficina, vDadosIni.vNomeUsuario, 'cdsHistOSEstMotos', self, ScrollBoxOS, trans);
  GroupBoxOS.Visible := false;
  vDadosIni.mostraColunas(cdsColunasOS, DBGridOficina, vDadosIni.vNomeUsuario, 'cdsHistOSEstMotos', vTabela, vCampoPadrao);
end;

procedure TfrmEstMotosCCIA.ScrollBoxNFTEnter(Sender: TObject);
begin
  vConfigColuna := true;
end;

procedure TfrmEstMotosCCIA.ScrollBoxNFTExit(Sender: TObject);
begin
  if (cdsColunasNFT = nil) or (not cdsColunasNFT.Active) or (not vConfigColuna) then
    exit;
  vDadosIni.gravaConfiguracaoUsuario(cdsColunasNFT, DBGridNFT, vDadosIni.vNomeUsuario, 'cdsHistNFTEstmotos', self, ScrollBoxNFT, trans);
  GroupBoxNFT.Visible := false;
  vDadosIni.mostraColunas(cdsColunasNFT, DBGridNFT, vDadosIni.vNomeUsuario, 'cdsHistNFTEstmotos', vTabela, vCampoPadrao);
end;

procedure TfrmEstMotosCCIA.SpeedButton10Click(Sender: TObject);
begin
  try
    if EstMoto.dataset.IsEmpty then
      exit;
    vRecNo := EstMoto.dataSet.RecNo;
    if not EstMoto.abreFormAvaria then
     exit;

    EstMoto.Refresh;
  finally
    EstMoto.dataSet.RecNo := vRecNo;
  end;
end;

procedure TfrmEstMotosCCIA.SpeedButton11Click(Sender: TObject);
begin
  inherited;
 try
    Screen.Cursor := crHourGlass;
    EstMoto.abreFormEntradaCCIA(1);
    EstMoto.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  try
     Screen.Cursor := crHourGlass;
     EstMoto.abreFormComfat(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.SpeedButton1Click(Sender: TObject);
var
	I: Integer;
begin
	try
    if EstMoto.dataSet.IsEmpty then
      Exit;

    if not vDadosIni.PesqPros('VEI060', 'ALTERAR', 'CHASSI ' + EstMoto.dataSet.FieldByName('CHASSI_C').AsString,
      'EST_MOTO', EstMoto.dataSet.FieldByName('CODIGO').AsString, EstMoto.buscas, true) then
      exit;

    Screen.Cursor := crHourGlass;

    if not EstMoto.Edit then
      exit;

    for I := 0 to ComponentCount - 1 do
      if (Components[I] is TScrollBox) then
        TScrollBox(Components[I]).VertScrollBar.Position := 0;

    inherited;
    ComboBox4.Text := '';
    ComboBox5.Text := '';
    LabelSeq.Visible := false;
    CheckCadSeq.Visible := false;
    DBComboBox7.Clear;
    DBComboBox7.Items.Add('VIVO');
    DBComboBox7.Items.Add('TRANSITO');
    DBComboBox7.Items.Add('ESTACIONAMENTO');
    if trim(EstMoto.dataSet.FieldByName('POSICAO').AsString) = 'MORTO' then
      DBComboBox7.Items.Add('MORTO');
    Label8.Visible := (vDadosIni.vEmp.vTipoEmpVeiculos <> 'A') and
     (EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'U');
    DBComboBox6.Visible := (vDadosIni.vEmp.vTipoEmpVeiculos <> 'A') and
     (EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'U');

    Label80.Enabled := false;
    DBEdit18.Enabled := false;
    Label81.Enabled := false;
    DBEdit26.Enabled := false;
    btAlterarChassiPlaca.Visible := true;

    TabSheet_Dados.TabVisible := true;
    TabSheet_MaisInformacoes.TabVisible := true;
    TabSheet_Contratos.TabVisible := true;
    TabSheet_Pendencias.TabVisible := true;
    TabSheet_Despesas.TabVisible := true;
    TabSheet_Notas.TabVisible := true;
    TabSheet_NotasTransito.TabVisible := true;
    TabSheet_Oficina.TabVisible := true;
    PageControl3.ActivePage := TabSheet_Dados;
    TabSheet_Dados.Show;
    _DesabilitarCamposPendencia;
    _DesabilitarCamposDespesa;
    _DesabilitaCampos;
    _atualizarCombobox;
    _buscarInfModelo;
     SelectNext(ActiveControl, true, true);
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmEstMotosCCIA.SpeedButton23Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('VEI101', 'ALTERAR', 'CHASSI ' + EstMoto.dataSet.FieldByName('CHASSI_C').AsString,
    'EST_MOTO', EstMoto.dataSet.FieldByName('CODIGO').AsString, EstMoto.buscas, false) then
    Exit;

  if EstMoto.dataSet.IsEmpty then
    Exit;

  if trim(EstMoto.dataSet.FieldByName('POSICAO').AsString) = 'MORTO' then
  begin
    Application.MessageBox('Veículo se encontra finalizado (Morto)',//, não é possível alterar o estoque!',
    	'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
//    exit;
  end;

  EstMoto.abreFormAlterarEstoque;
end;

procedure TfrmEstMotosCCIA.SpeedButton24Click(Sender: TObject);
begin
 try
  Screen.Cursor := crHourGlass;

  if EstMoto.dataSet.IsEmpty then
   exit;

  if not vDadosIni.PesqPros('VEI060', 'EDITAR', 'CHASSI ' + EstMoto.dataSet.FieldByName('CHASSI_C').AsString,
     'EST_MOTO', EstMoto.dataSet.FieldByName('CODIGO').AsString, EstMoto.buscas, true) then
    Exit;

  EstMoto.AlterarStatus(1);
  EstMoto.Refresh;
 finally
    Screen.Cursor := crDefault;
 end;
end;

procedure TfrmEstMotosCCIA.SpeedButton26Click(Sender: TObject);
begin
 try
  Screen.Cursor := crHourGlass;

  if EstMoto.dataSet.IsEmpty then
   exit;

  if not vDadosIni.PesqPros('VEI123', 'EDITAR', 'CHASSI ' + EstMoto.dataSet.FieldByName('CHASSI_C').AsString,
    'EST_MOTO', EstMoto.dataSet.FieldByName('CODIGO').AsString, EstMoto.buscas, true) then
    Exit;

  EstMoto.abreFormObservacao;
  EstMoto.dataSet.Refresh;
 finally
    Screen.Cursor := crDefault;
 end;
end;

procedure TfrmEstMotosCCIA.SpeedButton2Click(Sender: TObject);
begin
  try
    inherited;
    if not EstMoto.Delete then
      exit;
  except
    Application.MessageBox('Erro inesperado. Se o erro persistir contacte o administrador da rede.', 'Erro',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
    EstMoto.Cancel;
    EstMoto.RollBackTransacao;
  end;
end;

procedure TfrmEstMotosCCIA.SpeedButton40Click(Sender: TObject);
begin
  vDadosIni.configurarSistema('vei_%', EstMoto.buscas);
end;

procedure TfrmEstMotosCCIA.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    EstMoto.abreFormSaidaCCIA(1);
    EstMoto.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.SpeedButton7Click(Sender: TObject);
begin
 try
 Screen.Cursor := crHourGlass;

  if EstMoto.dataSet.IsEmpty then
   exit;

  if trim(EstMoto.dataSet.FieldByName('POSICAO').AsString) <> 'MORTO' then
  begin
    Application.MessageBox('Veículo não se encontra finalizado (Morto)!', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
    exit;
  end;

  EstMoto.abreFormDadosReais(1);
  EstMoto.Refresh;
 finally
    Screen.Cursor := crDefault;
 end;
end;

procedure TfrmEstMotosCCIA.SpeedButton8Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    vRecNo := EstMoto.dataSet.RecNo;
    if EstMoto.IsEmpty then
      Exit;
    if not vDadosIni.PesqPros('VEI062', 'CONSULTA', '', 'EST_MOTO', '',
      EstMoto.buscas, true) then
      Exit;

    if not EstMoto.vReserva.verificarRegistro then
       exit;
       
    if not EstMoto.vReserva.abreFormReserva(
    	1,
    	EstMoto.dataSet.FieldByName('CODIGO').AsInteger,
      EstMoto.dataSet.FieldByName('COD_EMPRESA').AsInteger,
      EstMoto.dataSet.FieldByName('CHASSI_C').AsString) then
        exit;

    EstMoto.Refresh;
    EstMoto.dataSet.RecNo := vRecNo; 
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmEstMotosCCIA.SpeedButton9Click(Sender: TObject);
var
  vPercRed, vRedLucro: string;

begin
   if not vDadosIni.PesqPros('VEI125', 'ALTERAR', 'CHASSI ' + EstMoto.dataSet.FieldByName('CHASSI_C').AsString,
     'EST_MOTO', EstMoto.dataSet.FieldByName('CODIGO').AsString, EstMoto.buscas, true) then
     exit;

   if Application.MessageBox('Redução da base sobre o lucro?', 'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYES then
     vRedLucro := 'S'
   else
     vRedLucro := 'N';

   vPercRed := EstMoto.dataSet.FieldByName('PERC_RED').AsString;

   if InputQuery('Informe um Valor', 'Informe o Percentual de Redução', vPercRed) then
   begin
      try
        StrToFloat(vPercRed)
      except
        Application.MessageBox('Percentual de Redução Inválido', 'Atenção', 0 + 64);
        Exit;
      end;

      if StrToFloat(vPercRed) < 0 then
      begin
        Application.MessageBox('Percentual de Redução não informado', 'Atenção', 0 + 64);
        Exit;
      end;
   end
   else
   begin
     Application.MessageBox('Percentual de Redução não informado', 'Atenção', 0 + 64);
     Exit;
   end;

   if EstMoto.dataSet.State in [dsInsert, dsEdit] then
   begin
     EstMoto.dataSet.FieldByName('RED_LUCRO').AsString := trim(vRedLucro);
     EstMoto.dataSet.FieldByName('PERC_RED').AsFloat := StrToFloat(vPercRed);
   end;

   EstMoto.AlterarReducao(trim(vRedLucro), StrToFloat(vPercRed));
end;

function TfrmEstMotosCCIA._atualizarCombobox: Boolean;
var
 vTemp: string;
begin
  try
   vTemp := copy(trim(EstMoto.dataSet.FieldByName('TIPV_VEICULO').AsString), 1 , 1);

  if vTemp = 'C' then
    DBComboBox1.ItemIndex := 1
  else if vTemp = 'I' then
    DBComboBox1.ItemIndex := 2
  else
    DBComboBox1.ItemIndex := 0;

  vTemp := trim(EstMoto.dataSet.FieldByName('POSICAO').AsString);

  if vTemp = 'VIVO' then
    DBComboBox7.ItemIndex := 0
  else if vTemp = 'TRANSITO' then
    DBComboBox7.ItemIndex := 1
  else if vTemp = 'ESTACIONAMENTO' then
    DBComboBox7.ItemIndex := 2
  else if vTemp = 'MORTO' then
    DBComboBox7.ItemIndex := 3;

  vTemp := EstMoto.dataSet.FieldByName('STATUS_USO').AsString;

  if vTemp = 'U' then
    DBComboBox3.ItemIndex := 1
  else
    DBComboBox3.ItemIndex := 0;

  vTemp := copy(trim(EstMoto.dataSet.FieldByName('LOTACAOEST').AsString), 1, 2);
  vTemp := vDadosIni.StrZero(vTemp , 2);

  if vTemp = '01' then
    DBComboBox2.ItemIndex := 0
  else if vTemp = '02' then
    DBComboBox2.ItemIndex := 1
  else if vTemp = '03' then
    DBComboBox2.ItemIndex := 2
  else if vTemp = '04' then
    DBComboBox2.ItemIndex := 3
  else if vTemp = '05' then
    DBComboBox2.ItemIndex := 4;

  vTemp := copy(trim(EstMoto.dataSet.FieldByName('ESTOQUE').AsString), 1, 1);
  if vTemp = 'P' then
  	DBComboBox6.ItemIndex := 0
  else if vTemp = 'T' then
  	DBComboBox6.ItemIndex := 1
  else if vTemp = 'O' then
  	DBComboBox6.ItemIndex := 2;

  except
  end;
end;

procedure TfrmEstMotosCCIA._buscarInfModelo;
begin
  if EstMoto.dataSet.FieldByName('VERSAOEST').AsInteger <= 0 then
    exit;

  if EstMoto.vModVeic.buscarModelo(EstMoto.dataSet.FieldByName('VERSAOEST').AsInteger) then
  begin
    if EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString = '01' then
      ComboBox4.Text := EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString + ' - ' + 'PASSAGEIRO'
    else if EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString = '02' then
      ComboBox4.Text := EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString + ' - ' + 'CARGA'
    else if EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString = '03' then
      ComboBox4.Text := EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString + ' - ' + 'MISTO'
    else
      ComboBox4.Text := EstMoto.vModVeic.buscas.FieldByName('ESPRENAVAM').AsString;

    if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '01' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + ' CICLOMOTO'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '02' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'TRICICLO'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '03' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'MOTONETA'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '04' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'MOTOCICLO'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '05' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'TRICICLO'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '06' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'AUTOMÓVEL'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '07' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'MICROÔNIBUS'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '08' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'ÔNIBUS'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '10' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'REBOQUE'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '11' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'SEMIRREBOQUE'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '13' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'CAMINHONETA'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '14' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'CAMINHÃO'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '17' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'CAMINHÃO TRATOR'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '18' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'TR RODAS'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '19' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'TR ESTEIRAS'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '20' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'TR MISTO'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '21' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'QUADRICICLO'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '22' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'ESPECIAL / ÔNIBUS'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '23' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'MISTO / CAMINHONETE'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '25' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'UTILITÁRIO'
    else if EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString = '26' then
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString + ' - ' + 'MOTOR CASA'
    else
      ComboBox5.Text := EstMoto.vModVeic.buscas.FieldByName('TIP_VEICULO').AsString;
  end;
end;

procedure TfrmEstMotosCCIA._DesabilitaCampos;
begin
  pnConfirmObs.Visible := false;
  vDadosIni.vInibeMensPesqPros := 'S';
  DBEdit15.Enabled := vDadosIni.PesqPros('VEI096', 'HABILITAR', '', 'EST_MOTO', '', EstMoto.buscas, False);
  DBComboBox5.Enabled := DBEdit15.Enabled;

   if (EstMoto.dataSet.FieldByName('NUM_NOTA').AsInteger > 0)
     or (EstMoto.dataSet.FieldByName('N_OS').AsInteger > 0)
     or (trim(EstMoto.dataSet.FieldByName('MODELO_CFT').AsString) <> '')
     or (EstMoto.dataSet.FieldByName('NUM_NOTAV').AsInteger > 0)
     or (trim(EstMoto.dataSet.FieldByName('MODELO_CFTV').AsString) <> '')
     or (trim(EstMoto.dataSet.FieldByName('POSICAO').AsString) = 'MORTO') then
     vAbilitar := false
   else
     vAbilitar := true;

  pnConfirmObs.Visible := False;
  BitBtn4.Enabled := vAbilitar;


  if not BitBtn4.Enabled then
  begin
   vDadosIni.vInibeMensPesqPros := 'S';
   BitBtn4.Enabled := vDadosIni.PesqPros('VEI126', 'HABILITAR', '', 'EST_MOTO', '', EstMoto.buscas, False);
  end;

  SpeedButton9.Visible := not vAbilitar;
  BitBtn27.Enabled := (EstMoto.dataSet.State = dsEdit) and (vAbilitar);// and (vDadosIni.vEmp.vTipoEmpVeiculos = 'A');
  Label29.Enabled := (EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'U');
  DBEdit15.Enabled := (EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'U');
  DBComboBox5.Enabled := (EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'U');
  Label30.Enabled := (EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'U');
  DBComboBox5.Enabled := (EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'U');
//  Label25.Visible := (EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'U');
//  DBEdit10.Visible := (EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'U');
//  Label54.Visible := (EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'U');
//  DBEdit12.Visible := (EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'U');
  Label28.Visible := (EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'U');
  DBEdit13.Visible := (EstMoto.dataSet.FieldByName('STATUS_USO').AsString = 'U');
end;

procedure TfrmEstMotosCCIA._DesabilitarCamposDespesa;
begin
  DBLookupComboBox_Assunto_Despesa.Enabled := True;
  DBLookupComboBox_Fornecedor_Despesa.Enabled := True;
  DBLookupComboBox_Funcionario_Despesa.Enabled := True;
  DBMemo_Despesa_Obs.Enabled := True;
  DBEdit_Assunto_Despesa.Enabled := True;
  DBEdit_Data_Despesa.Enabled := True;
  DBEdit_Fornecedor_Despesa.Enabled := True;
  DBEdit_Valor_Despesa.Enabled := True;
  BitBtn_Salvar_Despesa.Enabled := True;
  BitBtn_Cancelar_Despesa.Enabled := True;

//  DBLookupComboBox_Assunto_Despesa.Enabled := false;
//  DBLookupComboBox_Fornecedor_Despesa.Enabled := false;
//  DBLookupComboBox_Funcionario_Despesa.Enabled := false;
//  DBMemo_Despesa_Obs.Enabled := false;
//  DBEdit_Assunto_Despesa.Enabled := false;
//  DBEdit_Data_Despesa.Enabled := false;
//  DBEdit_Fornecedor_Despesa.Enabled := false;
//  DBEdit_Valor_Despesa.Enabled := false;
//  BitBtn_Salvar_Despesa.Enabled := false;
//  BitBtn_Cancelar_Despesa.Enabled := false;

//  if EstMoto.dataSet.FieldByName('STATUS_ESTOQUE').AsString = 'S' then
//  begin
    BitBtn_Novo_Despesa.Enabled := true;
    BitBtn_Alterar_Despesa.Enabled := true;
    BitBtn_Excluir_Despesa.Enabled := true;
    BitBtn_Salvar_Despesa.Enabled := false;
    BitBtn_Cancelar_Despesa.Enabled := false;
    TabSheet_Despesas.TabVisible := true;
//  end
//  else
//  begin
//    BitBtn_Novo_Despesa.Enabled := False;
//    BitBtn_Alterar_Despesa.Enabled := False;
//    BitBtn_Excluir_Despesa.Enabled := False;
//    BitBtn_Salvar_Despesa.Enabled := False;
//    BitBtn_Cancelar_Despesa.Enabled := False;
//    TabSheet_Despesas.TabVisible := true;
//  end;
end;

procedure TfrmEstMotosCCIA._DesabilitarCamposPendencia;
begin
  DBLookupComboBox_Assunto_Pendencia.Enabled := false;
  DBEdit_Descricao_Pendencia.Enabled := false;
  DBLookupComboBox_Funcionario_Pendencia.Enabled := false;
  DBComboBox_Status_Pendencia.Enabled := false;
  DBEdit_Valor_Pendencia.Enabled := false;
  DBEdit_DataPrevista_Pendencia.Enabled := false;
  DBEdit_Assunto_Pendencia.Enabled := false;
  DBEdit_Data_Pendencia.Enabled := false;
  DBMemo_Pendencia_Obs.Enabled := false;

//  if EstMoto.dataSet.FieldByName('STATUS_ESTOQUE').AsString = 'S' then
//  begin
    BitBtn_Salvar_Pendencia.Enabled := false;
    BitBtn_Cancelar_Pendencia.Enabled := false;
    BitBtn_Novo_Pendencia.Enabled := true;
    BitBtn_Alterar_Pendencia.Enabled := true;
    BitBtn_Excluir_Pendencia.Enabled := true;
    TabSheet_Pendencias.TabVisible := true;
//  end
//  else
//  begin
//    BitBtn_Salvar_Pendencia.Enabled := false;
//    BitBtn_Cancelar_Pendencia.Enabled := false;
//    BitBtn_Novo_Pendencia.Enabled := false;
//    BitBtn_Alterar_Pendencia.Enabled := false;
//    BitBtn_Excluir_Pendencia.Enabled := false;
//    TabSheet_Pendencias.TabVisible := true;
//  end;
end;

procedure TfrmEstMotosCCIA._HabilitarCamposDespesa;
begin
  DBLookupComboBox_Assunto_Despesa.Enabled := true;
  DBLookupComboBox_Fornecedor_Despesa.Enabled := true;
  DBMemo_Despesa_Obs.Enabled := true;
  DBEdit_Assunto_Despesa.Enabled := true;
  DBEdit_Data_Despesa.Enabled := false;
  DBEdit_Fornecedor_Despesa.Enabled := true;
  DBEdit_Valor_Despesa.Enabled := true;
  DBLookupComboBox_Funcionario_Despesa.Enabled := true;

  BitBtn_Salvar_Despesa.Enabled := true;
  BitBtn_Cancelar_Despesa.Enabled := true;
  BitBtn_Novo_Despesa.Enabled := false;
  BitBtn_Alterar_Despesa.Enabled := false;
  BitBtn_Excluir_Despesa.Enabled := false;
  TabSheet_Despesas.TabVisible := true;
end;

procedure TfrmEstMotosCCIA._HabilitarCamposPendencia;
begin
  DBLookupComboBox_Assunto_Pendencia.Enabled := true;
  DBEdit_Descricao_Pendencia.Enabled := true;
  DBLookupComboBox_Funcionario_Pendencia.Enabled := true;
  DBComboBox_Status_Pendencia.Enabled := true;
  DBEdit_Valor_Pendencia.Enabled := true;
  DBEdit_DataPrevista_Pendencia.Enabled := true;
  DBEdit_Assunto_Pendencia.Enabled := true;
  DBEdit_Data_Pendencia.Enabled := false;
  DBMemo_Pendencia_Obs.Enabled := true; 

  BitBtn_Salvar_Pendencia.Enabled := true;
  BitBtn_Cancelar_Pendencia.Enabled := true;
  BitBtn_Novo_Pendencia.Enabled := false;
  BitBtn_Alterar_Pendencia.Enabled := false;
  BitBtn_Excluir_Pendencia.Enabled := false;
  TabSheet_Pendencias.TabVisible := true;
end;

function TfrmEstMotosCCIA._mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
var
  x: Byte;
begin
  Result := True;
  if Application.MainForm.MDIChildCount > 0 then
    for X := 0 to Pred(Application.MainForm.MDIChildCount) do
      if UpperCase(Application.MainForm.MDIChildren[X].ClassName) =
        UpperCase(pNomeFormMDI) then
      begin
        Result := False;
        if trim(pMensagem) <> ''  then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;

end;

function TfrmEstMotosCCIA._SomarValoresGridDespesa: Double;
var
  Soma: double;
  Ponteiro: TBookMark;
begin
  try
    Soma := 0;
    Ponteiro := EstMoto.vDespesaVeic.DataSet.GetBookMark; // Pega posicao atual do Dataset
    EstMoto.vDespesaVeic.DataSet.First;
    while not EstMoto.vDespesaVeic.DataSet.Eof do
    begin
      Soma := Soma + EstMoto.vDespesaVeic.DataSet.FieldByName('VALOR_DESPESA').AsFloat;
      EstMoto.vDespesaVeic.DataSet.Next;
    end;
    EstMoto.vDespesaVeic.DataSet.GotoBookMark(Ponteiro); // Retorna posicao original do Dataset
    if Soma > 0 then
    begin
      if not (EstMoto.dataSet.State in [dsInsert, dsEdit]) then
          EstMoto.dataSet.Edit;
      EstMoto.dataSet.FieldByName('PRECO_CUSTO_DESP').AsFloat :=
        EstMoto.dataSet.FieldByName('PRECO_CUSTO').AsFloat + Soma;
      EstMoto.dataSet.Post;
      EstMoto.Apply;
      EstMoto.CommitaTransacao;
      if not (EstMoto.dataSet.State in [dsInsert, dsEdit]) then
        EstMoto.dataSet.Edit;
    end;
    Result := Soma;
    _atualizarCombobox;
  except
  end;
end;

function TfrmEstMotosCCIA._SomarValoresGridPendencia: Double;
var
  Soma: double;
  Ponteiro: TBookMark;
begin
  try
   Soma := 0;
   Ponteiro := EstMoto.vPendenciaVeic.DataSet.GetBookMark; // Pega posicao atual do Dataset
   EstMoto.vPendenciaVeic.DataSet.First;
   while not EstMoto.vPendenciaVeic.DataSet.Eof do
   begin
     Soma := Soma + EstMoto.vPendenciaVeic.DataSet.FieldByName('VALOR_PENDENCIA').AsFloat;
     EstMoto.vPendenciaVeic.DataSet.Next;
   end;
   EstMoto.vPendenciaVeic.DataSet.GotoBookMark(Ponteiro); // Retorna posicao original do Dataset
   Result := Soma;
  except
  end;
end;


initialization
  RegisterClass(TFrmEstMotosCCIA);
finalization
  UnRegisterClass(TFrmEstMotosCCIA);

end.

