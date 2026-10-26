unit uCadContasAPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, QuickRpt,
  QRCtrls, uEditHw, Spin, DB, DBClient, IBQuery;

type
	Tcadastrosbasicos_abreFormImagemDoc = function(
  	pBuscas: TIBQuery;
  	pCodigo: Integer;
    pCodEmpresa: Integer;
    pTipo: string): boolean;

  TFrmCadContasAPagar = class(TfrmCadPadraoM)
    tsOutros: TTabSheet;
    CheckBoxNQuitado: TCheckBox;
    CheckBoxQuitado: TCheckBox;
    CheckBoxDespesa: TCheckBox;
    CheckBoxFornec: TCheckBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBComboBox1: TDBComboBox;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBEdit7: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBComboBox4: TDBComboBox;
    pgOutros: TPageControl;
    tsRelContasApagar: TTabSheet;
    qrpContasAPagar: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    qrlNomeEmpresa: TQRLabel;
    qrBandDetalheCTP: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    qrBandPageFooter: TQRBand;
    QRLabel30: TQRLabel;
    QRShape6: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel72: TQRLabel;
    qrBandSubtotal: TQRBand;
    QRLabel59: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel71: TQRLabel;
    QRGroup1: TQRGroup;
    tsReplicacao: TTabSheet;
    pnReplicar: TPanel;
    Panel30: TPanel;
    Label74: TLabel;
    edQtdeRepl: TEditHw;
    Panel31: TPanel;
    Label76: TLabel;
    edDiaVencReplicar: TEditHw;
    Panel32: TPanel;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    Panel8: TPanel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    DBText9: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    Label80: TLabel;
    DBText12: TDBText;
    Panel4: TPanel;
    Label14: TLabel;
    cbReferenciaMes: TComboBox;
    tsAtualizarValorPago: TTabSheet;
    pnAtualizarValorPago: TPanel;
    Panel6: TPanel;
    Panel9: TPanel;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    Panel10: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    Label32: TLabel;
    DBText4: TDBText;
    Label28: TLabel;
    DBEdit4: TDBEdit;
    Label27: TLabel;
    DBText5: TDBText;
    tsAceitarContaCTP: TTabSheet;
    pnAceitarContaCTP: TPanel;
    Panel7: TPanel;
    Label33: TLabel;
    Panel11: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    edNomeBanco: TEdit;
    tsPagando: TTabSheet;
    pgPagando: TPageControl;
    tsPagar: TTabSheet;
    tsLancN_S2: TTabSheet;
    pnPagar: TPanel;
    Panel38: TPanel;
    Label65: TLabel;
    Label66: TLabel;
    Edit1: TEdit;
    Panel37: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    lbDinheiro: TLabel;
    lbCheque: TLabel;
    lbCreditos: TLabel;
    Panel36: TPanel;
    Label81: TLabel;
    lbAtingir: TLabel;
    Label83: TLabel;
    lbInformar: TLabel;
    Label85: TLabel;
    lbAtingido: TLabel;
    Panel39: TPanel;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    Panel18: TPanel;
    Splitter3: TSplitter;
    Panel19: TPanel;
    Panel20: TPanel;
    DBGrid5: TDBGrid;
    Panel33: TPanel;
    Panel34: TPanel;
    DBGrid6: TDBGrid;
    Panel35: TPanel;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    pnPagLancN_S2: TPanel;
    Panel41: TPanel;
    BitBtn16: TBitBtn;
    BitBtn29: TBitBtn;
    GroupBox8: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label82: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    DBEdit22: TDBEdit;
    DBLookupComboBox8: TDBLookupComboBox;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    tsLancS1: TTabSheet;
    pnPagLancS1: TPanel;
    Panel12: TPanel;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    GroupBox4: TGroupBox;
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
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    Label34: TLabel;
    lbChequesSel: TLabel;
    Panel50: TPanel;
    CheckBox2: TCheckBox;
    tsDadosQuitacao: TTabSheet;
    pnDadosQuitacao: TPanel;
    Panel51: TPanel;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    tsImpressaoLote: TTabSheet;
    pnImpressaoLote: TPanel;
    Panel14: TPanel;
    BitBtn13: TBitBtn;
    BitBtn17: TBitBtn;
    Panel15: TPanel;
    DBGrid3: TDBGrid;
    RadioGroup1: TRadioGroup;
    Edit2: TEdit;
    Label35: TLabel;
    GroupBox5: TGroupBox;
    Label36: TLabel;
    MaskEdit5: TMaskEdit;
    maskedit6: TMaskEdit;
    Label37: TLabel;
    EditHw1: TEditHw;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    tsDetalhesPagamento: TTabSheet;
    pnDetalhesPagamento: TPanel;
    Panel25: TPanel;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn24: TBitBtn;
    tsLancDiferenca: TTabSheet;
    pnLancDiferenca: TPanel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    BitBtn18: TBitBtn;
    BitBtn21: TBitBtn;
    Label44: TLabel;
    DBEdit17: TDBEdit;
    DBLookupComboBoxPContas: TDBLookupComboBox;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit18: TDBEdit;
    DBLookupComboBoxControle: TDBLookupComboBox;
    Bevel1: TBevel;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    Bevel2: TBevel;
    DBEdit21: TDBEdit;
    DesmarcardocumentocomoRecebendoLinhasselecionadas1: TMenuItem;
    SpeedButton20: TSpeedButton;
    DBEdit27: TDBEdit;
    Label41: TLabel;
    tsObs: TTabSheet;
    pnObs: TPanel;
    GroupBox9: TGroupBox;
    DBMemo1: TDBMemo;
    BitBtn49: TBitBtn;
    BitBtn48: TBitBtn;
    BitBtn45: TBitBtn;
    DBGrid9: TDBGrid;
    BitBtn47: TBitBtn;
    Label42: TLabel;
    DBEdit23: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit24: TDBEdit;
    Label43: TLabel;
    Label131: TLabel;
    DBEdit68: TDBEdit;
    tsImpressaCopia: TTabSheet;
    pnImpressaoCopias: TPanel;
    Panel29: TPanel;
    BitBtn23: TBitBtn;
    BitBtn25: TBitBtn;
    GroupBox7: TGroupBox;
    Label60: TLabel;
    Label61: TLabel;
    edQtdeReplicarCadastro: TEditHw;
    edDiaVencimentoReplicarCadastro: TEditHw;
    Panel40: TPanel;
    Label19: TLabel;
    Label49: TLabel;
    Label134: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit3: TEdit;
    tsFaturaDesp: TTabSheet;
    pnFaturaDesp: TPanel;
    Panel45: TPanel;
    BitBtn31: TBitBtn;
    BitBtn34: TBitBtn;
    GroupBox40: TGroupBox;
    Panel47: TPanel;
    ListBox3: TListBox;
    btAlterarFaturaEntrada: TBitBtn;
    GroupBox26: TGroupBox;
    Label21: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Edit6: TEdit;
    EditHw2: TEditHw;
    edcreditoQtdeParcelas: TSpinEdit;
    Panel42: TPanel;
    btGerar: TBitBtn;
    btApagarDesp: TBitBtn;
    edDocFaturaEntrada: TEdit;
    edValorFaturaEntrada: TEditHw;
    edVencimentoFaturaEntrada: TMaskEdit;
    btSalvarFaturaEntrada: TBitBtn;
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
    cdsDespNChq: TStringField;
    cdsDespContrBanc: TStringField;
    cdsDespNominalChq: TStringField;
    dsDesp: TDataSource;
    GroupBox10: TGroupBox;
    ListBox1: TListBox;
    Panel43: TPanel;
    BitBtn26: TBitBtn;
    BitBtn30: TBitBtn;
    tsLancS2: TTabSheet;
    pnPagLancS2: TPanel;
    Panel46: TPanel;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    GroupBox11: TGroupBox;
    DBGrid4: TDBGrid;
    Panel48: TPanel;
    Label22: TLabel;
    lbCreditosSel: TLabel;
    Label50: TLabel;
    RadioGroup2: TRadioGroup;
    Edit7: TEdit;
    GroupBox12: TGroupBox;
    Label51: TLabel;
    Label52: TLabel;
    SpeedButton10: TSpeedButton;
    SpeedButton17: TSpeedButton;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    EditHw3: TEditHw;
    DBEdit12: TDBEdit;
    Label48: TLabel;
    DBEdit25: TDBEdit;
    Label53: TLabel;
    pnNumConta: TPanel;
    Label54: TLabel;
    EditHwNumConta: TEditHw;
    DBLookupComboBoxNumConta: TDBLookupComboBox;
    lbPrevistoDesc: TLabel;
    lbPrevisto: TLabel;
    tsDetalhesContrapartida: TTabSheet;
    pnDetalhesPagamentoContrapartida: TPanel;
    Panel53: TPanel;
    pnLancContrapartida: TPanel;
    Panel55: TPanel;
    gridLancamentoContrapartida: TDBGrid;
    Panel58: TPanel;
    pnChContrapartida: TPanel;
    Panel60: TPanel;
    gridCTPContrapartida: TDBGrid;
    Panel61: TPanel;
    pnCTPContrapartida: TPanel;
    Panel63: TPanel;
    gridChequesContrapartida: TDBGrid;
    Panel64: TPanel;
    btnVoltarContrapartida: TBitBtn;
    Panel65: TPanel;
    pnCrContrapartida: TPanel;
    Panel67: TPanel;
    gridCreditosContrapartida: TDBGrid;
    BitBtn35: TBitBtn;
    DBEdit26: TDBEdit;
    Label58: TLabel;
    SpeedButton59: TSpeedButton;
    SpeedButtonObsCtp: TSpeedButton;
    qrpContasAPagar2: TQuickRep;
    QRBand2: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel9: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel10: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    qrlNomeEmpresa2: TQRLabel;
    qrBandDetalheCTP2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    qrBandPageFooter2: TQRBand;
    QRLabel22: TQRLabel;
    QRShape1: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    qrBandSubtotal2: TQRBand;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText16: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel32: TQRLabel;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    cbReferenciaMesCadastro: TComboBox;
    Label59: TLabel;
    tsMultiempresa: TTabSheet;
    pnMultiempresa: TPanel;
    pnMultiempresaBottom: TPanel;
    SpeedButtonMultiempresaSel: TSpeedButton;
    SpeedButtonMultiempresaDesm: TSpeedButton;
    btnMultiempresaOK: TBitBtn;
    btnMultiempresaCancelar: TBitBtn;
    DBGridMultiempresa: TDBGrid;
    SpeedButton21: TSpeedButton;
    Panel49: TPanel;
    Label62: TLabel;
    edValorBaixaParcial: TEditHw;
    tsDetalhes: TTabSheet;
    pnDetalhes: TPanel;
    Panel54: TPanel;
    Label63: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    Label64: TLabel;
    Panel59: TPanel;
    DBGrid7: TDBGrid;
    Panel62: TPanel;
    BitBtn37: TBitBtn;
    BitBtn38: TBitBtn;
    BitBtn44: TBitBtn;
    BitBtn36: TBitBtn;
    Label67: TLabel;
    Label68: TLabel;
    DBText8: TDBText;
    Panel56: TPanel;
    Panel57: TPanel;
    CheckBox7: TCheckBox;
    Panel66: TPanel;
    Label108: TLabel;
    MaskEdit4: TMaskEdit;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    imgReplInformation: TImage;
    SpeedButton50: TSpeedButton;
    ckbReplAlterarNumQdeParcelaCadastro: TCheckBox;
    ckbReplNaoAlterarNumQdeParcelaCadastro: TCheckBox;
    MemoReplicar: TMemo;
    Panel76: TPanel;
    ckbReplAlterarNumQdeParcela: TCheckBox;
    ckbReplNaoAlterarNumQdeParcela: TCheckBox;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    tsRelContasApagarOpcao: TTabSheet;
    pnOpcoesImp: TPanel;
    GroupBox6: TGroupBox;
    rbFormatoPadrao: TRadioButton;
    Panel26: TPanel;
    Label45: TLabel;
    SpeedButton9: TSpeedButton;
    ComboBox4: TComboBox;
    CheckBox4: TCheckBox;
    CheckBox9: TCheckBox;
    rbFormatoCopiaConsultaPrevia: TRadioButton;
    Panel27: TPanel;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox10: TCheckBox;
    rbFormatoCopiaPorData: TRadioButton;
    Panel28: TPanel;
    Label46: TLabel;
    Label47: TLabel;
    ckRelQuitadas: TCheckBox;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    ckRelAbertas: TCheckBox;
    ComboBox5: TComboBox;
    CheckBox8: TCheckBox;
    CheckBox11: TCheckBox;
    Panel13: TPanel;
    BitBtn22: TBitBtn;
    tsFornecedoresConta: TTabSheet;
    pnFornecedoresConta: TPanel;
    Panel68: TPanel;
    btFornContaOK: TBitBtn;
    btFornContaCancel: TBitBtn;
    DBGridFornecedoresConta: TDBGrid;
    tsConta: TTabSheet;
    pnConta: TPanel;
    Panel70: TPanel;
    btContaOK: TBitBtn;
    btContaCancel: TBitBtn;
    DBGridContas: TDBGrid;
    tsLancCTP: TTabSheet;
    pnPagLancCTP: TPanel;
    Panel69: TPanel;
    BitBtn43: TBitBtn;
    BitBtn46: TBitBtn;
    Panel71: TPanel;
    Panel17: TPanel;
    pnLanc: TPanel;
    Panel22: TPanel;
    pnCh: TPanel;
    Panel52: TPanel;
    pnCr: TPanel;
    Panel24: TPanel;
    pnLancCTP: TPanel;
    Panel73: TPanel;
    pnCTP: TPanel;
    Panel21: TPanel;
    gridLancamento: TDBGrid;
    Panel44: TPanel;
    gridCheques: TDBGrid;
    Panel72: TPanel;
    gridCreditos: TDBGrid;
    Panel23: TPanel;
    gridLancCTP: TDBGrid;
    Panel74: TPanel;
    gridCTP: TDBGrid;
    CheckBoxVerFormas: TCheckBox;
    SpeedButton22: TSpeedButton;
    SpeedButton27: TSpeedButton;
    procedure DBEdit16Exit(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure BitBtn46Click(Sender: TObject);
    procedure pnPagLancCTPEnter(Sender: TObject);
    procedure BitBtn43Click(Sender: TObject);
    procedure pnContaEnter(Sender: TObject);
    procedure DBGridContasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btContaCancelClick(Sender: TObject);
    procedure btContaOKClick(Sender: TObject);
    procedure DBGridFornecedoresContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnFornecedoresContaEnter(Sender: TObject);
    procedure btFornContaCancelClick(Sender: TObject);
    procedure btFornContaOKClick(Sender: TObject);
    procedure ckbReplNaoAlterarNumQdeParcelaClick(Sender: TObject);
    procedure ckbReplAlterarNumQdeParcelaClick(Sender: TObject);
    procedure ckbReplNaoAlterarNumQdeParcelaCadastroClick(Sender: TObject);
    procedure ckbReplAlterarNumQdeParcelaCadastroClick(Sender: TObject);
    procedure imgReplInformationDblClick(Sender: TObject);
    procedure SpeedButton50Click(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure pnDetalhesEnter(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn44Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure DBEdit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButtonMultiempresaDesmClick(Sender: TObject);
    procedure SpeedButtonMultiempresaSelClick(Sender: TObject);
    procedure btnMultiempresaCancelarClick(Sender: TObject);
    procedure btnMultiempresaOKClick(Sender: TObject);
    procedure pnMultiempresaEnter(Sender: TObject);
    procedure DBGridMultiempresaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridMultiempresaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure DBGridMultiempresaCellClick(Column: TColumn);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure qrpContasAPagar2Preview(Sender: TObject);
    procedure SpeedButton59Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure btnVoltarContrapartidaClick(Sender: TObject);
    procedure DBLookupComboBox8Exit(Sender: TObject);
    procedure DBEdit22Exit(Sender: TObject);
    procedure DBLookupComboBoxNumContaExit(Sender: TObject);
    procedure EditHwNumContaExit(Sender: TObject);
    procedure DBLookupComboBoxPContasExit(Sender: TObject);
    procedure DBEdit17Exit(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure EditHw3Change(Sender: TObject);
    procedure DBGrid4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure BitBtn32Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure edVencimentoFaturaEntradaExit(Sender: TObject);
    procedure btSalvarFaturaEntradaClick(Sender: TObject);
    procedure btAlterarFaturaEntradaClick(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure btApagarDespClick(Sender: TObject);
    procedure btGerarClick(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure GroupBox7Exit(Sender: TObject);
    procedure GroupBox1Enter(Sender: TObject);
    procedure edQtdeReplicarCadastroExit(Sender: TObject);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure QRLabel71Print(sender: TObject; var Value: string);
    procedure QRDBText32Print(sender: TObject; var Value: string);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit23Exit(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure BitBtn47Click(Sender: TObject);
    procedure BitBtn45Click(Sender: TObject);
    procedure BitBtn48Click(Sender: TObject);
    procedure BitBtn49Click(Sender: TObject);
    procedure DBComboBox3KeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton20Click(Sender: TObject);
    procedure DBEdit27Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure ComboBox12Exit(Sender: TObject);
    procedure ComboBox12Enter(Sender: TObject);
    procedure DesmarcardocumentocomoRecebendoLinhasselecionadas1Click(
      Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure EditHw1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure DBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ComboBox11Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure qrpContasAPagarPreview(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure getFaturas;
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;

  private
    { Private declarations }
    vCriou: Smallint;
    vDtDia: TDate;
    procedure habilitarDesabilitarReplicacaoConta(pHab: boolean = False);
  public
    { Public declarations }
  end;

var
  FrmCadContasAPagar: TFrmCadContasAPagar;
  vTipoS: string;
//  CTP: TContasAPagar;

implementation

uses
  uDtmContasAPagar, uDadosIni, uDtmAtivo, uClassesContasAPagar,
  uDataSet_OOP, DateUtils, funcoes, UdefRatContas;

{$R *.dfm}

procedure TFrmCadContasAPagar.BitBtn11Click(Sender: TObject);
begin
  inherited;
  TForm(pnPagLancS1.Parent).ModalResult := IDOK;
end;

procedure TFrmCadContasAPagar.BitBtn13Click(Sender: TObject);
begin
  inherited;
  if not CTP.loteLanc.IsEmpty then
    CTP._ImprimeRelatorioLoteCTP;
end;

procedure TFrmCadContasAPagar.BitBtn14Click(Sender: TObject);
begin
  inherited;
	try
  	// Financeiro sendo fechado
		if vDadosIni.financeiroFechando(CTP.buscas) then
    begin
    	TForm(pnPagar.Parent).ModalResult := IDCANCEL;
			Exit;
    end;

    if CTP._confirmarPagamento then
      TForm(pnPagar.Parent).ModalResult := IDOK
    else if vDadosIni.vContrapartidaCTPCanc then
      TForm(pnPagar.Parent).ModalResult := IDCANCEL
    else
    begin
      FrmCadContasAPagar.lbDinheiro.Caption := Format('%0.2m', [CTP.rCTP.vSaldoDinheiro]);
      FrmCadContasAPagar.lbCreditos.Caption := Format('%0.2m', [CTP.rCTP.vSaldoCredito]);
      FrmCadContasAPagar.lbCheque.Caption := Format('%0.2m', [CTP.rCTP.vSaldoCheque]);
      FrmCadContasAPagar.lbAtingir.Caption := Format('%0.2m', [CTP.rCTP.vValorOperacao]);
      FrmCadContasAPagar.lbPrevisto.Visible := CTP.rCTP.vValorPrevisto > 0;
      FrmCadContasAPagar.lbPrevistoDesc.Visible := CTP.rCTP.vValorPrevisto > 0;
      FrmCadContasAPagar.lbPrevisto.Caption := Format('%0.2m', [CTP.rCTP.vValorPrevisto]);
      FrmCadContasAPagar.lbInformar.Caption := Format('%0.2m', [CTP.rCTP.vValorAInformar]);
      FrmCadContasAPagar.lbAtingido.Caption := Format('%0.2m', [CTP.rCTP.vValorAtingido]);
    end;
  finally
    vDadosIni.vContrapartidaCTPCanc := false;
  end;
end;

procedure TFrmCadContasAPagar.BitBtn15Click(Sender: TObject);
begin
  inherited;
  if not CTP._cancelarPagamento then
    exit;
  TForm(pnPagar.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadContasAPagar.BitBtn16Click(Sender: TObject);
begin
  inherited;
  if trim(CTP.dtSetLancTemp.FieldByName('N_CHEQ_L').AsString) <> '' then
  	if (trim(CTP.dtSetLancTemp.FieldByName('DATA_VENC_CHEQ_L').AsString) = '')
    	or (trim(CTP.dtSetLancTemp.FieldByName('DATA_VENC_CHEQ_L').AsString) = '  /  /  ') then
    begin
      Application.MessageBox('Data de vencimento do cheque deve ser informada.', 'Atenção', MB_OK + MB_ICONINFORMATION);
      if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
        DBEdit26.SetFocus;
      exit;
    end;

  if trim(CTP.dtSetLancTemp.FieldByName('N_CHEQ_L').AsString) = '' then
  begin
  	 CTP.dtSetLancTemp.FieldByName('NOMINAL_L').Value := null;
     CTP.dtSetLancTemp.FieldByName('DATA_VENC_CHEQ_L').Value := Null;
  end;

  TForm(pnPagLancN_S2.Parent).ModalResult := IDOK;
end;

procedure TFrmCadContasAPagar.BitBtn17Click(Sender: TObject);
begin
  inherited;
  TForm(pnImpressaoLote.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadContasAPagar.BitBtn18Click(Sender: TObject);
var
  vMensagem: string;
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn18.CanFocus) then
  	BitBtn18.SetFocus;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn23) or (ActiveControl = BitBtn25)) then
    Exit;
  inherited;

  if (CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat <=0) then
  begin
    Application.MessageBox('Conta de entrada não informada.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBoxPContas.CanFocus) then
      DBLookupComboBoxPContas.SetFocus;
    Exit;
  end;

  if not CTP.verificarConta('E', CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBoxPContas.CanFocus) then
      DBLookupComboBoxPContas.SetFocus;
    Exit;
  end;

  if not CTP.testarNumConta3('E', CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat, vMensagem) then
  begin                                                       
    Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
//    if not vDadosIni.PesqPros('CTP032', 'PERMITIR', 'CONTA ' + FloatToStr(CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat),
//      'CONTAS_A_PAGAR', CTP.dataSet.FieldByName('cod_contrp').AsString, CTP.buscas, True) then
//    begin
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBoxPContas.CanFocus) then
        DBLookupComboBoxPContas.SetFocus;
      exit;
//    end;
  end;

  if (CTP.dtSetLancTemp.FieldByName('CODIGO_CTRL').AsInteger <=0) then
  begin
    Application.MessageBox('Controle não informado.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBoxControle.CanFocus) then
      DBLookupComboBoxControle.SetFocus;
    Exit;
  end;

  if (CTP.dtSetLancTemp.FieldByName('VALOR_L').AsInteger <=0) then
  begin
    Application.MessageBox('Valor da Diferença não informado.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBEdit20.CanFocus) then
      DBEdit20.SetFocus;
    Exit;
  end;
  TForm(pnLancDiferenca.Parent).ModalResult := IDOK;
end;

procedure TFrmCadContasAPagar.BitBtn19Click(Sender: TObject);
var
  i: currency;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'A', CTP.buscas) then
    Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'E', CTP.buscas) then
    Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', CTP.buscas) then
    Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', CTP.buscas) then
    Exit;

  // Financeiro sendo fechado
	if vDadosIni.financeiroFechando(CTP.buscas) then
  begin
  	TForm(pnDetalhesPagamento.Parent).ModalResult := IDOK;
		Exit;
  end;

  if CTP._estornarPagamento(CTP.NumLoteLanc, CTP.DataLoteLanc) then
  begin
    i := 0;
    FrmCadContasAPagar.pnLanc.Caption    := 'Total: ' + Format('%n', [i]);
    FrmCadContasAPagar.pnCh.Caption      := 'Total: ' + Format('%n', [i]);
    FrmCadContasAPagar.pnCr.Caption      := 'Total: ' + Format('%n', [i]);
    FrmCadContasAPagar.pnLancCTP.Caption := 'Total: ' + Format('%n', [i]);
    FrmCadContasAPagar.pnCTP.Caption     := 'Total: ' + Format('%n', [i]);
  end;
end;

procedure TFrmCadContasAPagar.BitBtn1Click(Sender: TObject);
var
	vFormPag: string;
begin
	try
  	Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CTP020', 'PESQUISAR', '', 'CONTAS_A_PAGAR', '', CTP.buscas, true) then
      exit;

    vDadosIni.verificarCTP_Pendentes_Unificacao(CTP.buscas);

    CTP.rCTP.vCampoAd := ComboBox11.Text;
    CTP.rCTP.vValorAd := trim(MaskEdit7.Text);
    CTP.rCTP.vDataIniAd := MaskEdit9.Text;
    CTP.rCTP.vDataFimAd := MaskEdit8.Text;
    CTP.rCTP.vCondicaoAd := ComboBox12.Text;
    CTP.rCTP.vPorDataAd := MaskEdit9.Visible;
    CTP.rCTP.vAdicional := CheckBox1.Checked;
    CTP.rCTP.vCampo := ComboBox1.Text;
    CTP.rCTP.vCondicao := ComboBox3.Text;
    CTP.rCTP.vValor := MaskEdit3.text;
    CTP.rCTP.vDataIni := maskedit1.text;
    CTP.rCTP.vDataFim := maskedit2.text;
    if not CTP._defineSqlAdicional(CheckBoxQuitado.Checked, CheckBoxNQuitado.Checked, CheckBoxDespesa.Checked, CheckBoxFornec.Checked) then
    begin
      if (Self.Enabled) and (Self.Visible) and (MaskEdit7.CanFocus) then
        MaskEdit7.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (MaskEdit9.CanFocus) then
        MaskEdit9.SetFocus;
      exit;
    end;
    inherited;

    vFormPag := '';
    if (trim(UpperCase(CTP.rCTP.vCampo)) = 'FORM PAG') then
    begin
      if trim(CTP.rCTP.vCondicao) = 'Começa' then
        vFormPag := CTP.rCTP.vValor + '%'
      else if trim(CTP.rCTP.vCondicao) = 'Esta contido' then
        vFormPag := '%' + CTP.rCTP.vValor + '%'
      else
        vFormPag := CTP.rCTP.vValor;
      CTP.rCTP.vCampo := '';
      CTP.rCTP.vValor := '';
    end
    else if (CTP.rCTP.vAdicional) and (trim(UpperCase(CTP.rCTP.vCampoAd)) = 'FORM PAG') then
    begin
      if trim(CTP.rCTP.vCondicaoAd) = 'Começa' then
        vFormPag := CTP.rCTP.vValorAd + '%'
      else if trim(CTP.rCTP.vCondicaoAd) = 'Esta contido' then
        vFormPag := '%' + CTP.rCTP.vValorAd + '%'
      else
        vFormPag := CTP.rCTP.vValorAd;
    end;

    if MaskEdit2.Visible then
    begin
      if not CTP.ConsultaCampos('CONTAS_A_PAGAR', CTP.rCTP.vCampo,
        ' contas_a_pagar.cod_contrp', CTP.rCTP.vDataIni, CTP.rCTP.vDataFim, vDadosIni.codEmpresa, 1,
        CTP.Fsql_campos,
        CTP.Fsql_inner +
        ' left join retorna_pag_ctp (contas_a_pagar.lote, contas_a_pagar.datq_ctp, ' + vDadosIni.codEmpresa + ', ' +
          vDadosIni.IfThen((CheckBoxVerFormas.Checked) or (trim(vFormPag) <> ''), '1,', '0,') + QuotedStr(vFormPag) + ') on 1 = 1 ',
        CTP.rCTP.vSqlAdicional +
        vDadosIni.IfThen(trim(vFormPag) <> '',
          vDadosIni.IfThen(trim(CTP.rCTP.vSqlAdicional) <> '',
            ' and ', '') + ' retorna_pag_ctp.encontrou > 0 ', '') +
        vDadosIni.IfThen(trim(vTipoS) <> '',
          vDadosIni.IfThen((trim(CTP.rCTP.vSqlAdicional) <> '') or (trim(vFormPag) <> ''),
            ' and ', '') + ' coalesce(p_contas.tipo_ctp, '''') not in (' + vTipoS + ')', ''),
        vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          ' (case when (empresa.financeiro_unificado = ''S'') then ' +
          ' 		  empresa.codigo_unificadora ' +
          '			else ' +
          '			  contas_a_pagar.codigo_emp ' +
          ' end) ', '')) then
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
            combobox1.setfocus;
    end
    else if not CTP.ConsultaCampos('CONTAS_A_PAGAR', CTP.rCTP.vValor, CTP.rCTP.vCampo,
      CTP.rCTP.vCondicao, 'contas_a_pagar.cod_contrp', true, vDadosIni.codEmpresa,
        CTP.Fsql_campos,
        CTP.Fsql_inner +
        ' left join retorna_pag_ctp (contas_a_pagar.lote, contas_a_pagar.datq_ctp, ' + vDadosIni.codEmpresa + ', ' +
          vDadosIni.IfThen((CheckBoxVerFormas.Checked) or (trim(vFormPag) <> ''), '1,', '0,') + QuotedStr(vFormPag) + ') on 1 = 1 ',
        CTP.rCTP.vSqlAdicional +
        vDadosIni.IfThen(trim(vFormPag) <> '',
          vDadosIni.IfThen(trim(CTP.rCTP.vSqlAdicional) <> '',
            ' and ', '') + ' retorna_pag_ctp.encontrou > 0 ', '') +
        vDadosIni.IfThen(trim(vTipoS) <> '',
          vDadosIni.IfThen((trim(CTP.rCTP.vSqlAdicional) <> '') or (trim(vFormPag) <> ''),
            ' and ', '') + ' coalesce(p_contas.tipo_ctp, '''') not in (' + vTipoS + ')', '') ,
        vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          ' (case when (empresa.financeiro_unificado = ''S'') then ' +
          ' 		  empresa.codigo_unificadora ' +
          '			else ' +
          '			  contas_a_pagar.codigo_emp ' +
          ' end) ', '')) then
          if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
            ComboBox1.SetFocus;

    SpeedButton1.Visible := true;
    CTP.ultimasql := CTP.dataset.CommandText;
    CTP.rCTP.vTipoCNT := '';
    CTP.TotalContasSelecionadas := 0;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
      DBGrid1.SetFocus;

    vDtDia := vDadosIni.getDataBanco(CTP.buscas);
  finally
  	gravaConfiguracoesFormRegistro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadContasAPagar.BitBtn20Click(Sender: TObject);
begin
  inherited;
  Panel24.Visible := vDadosIni.vContasAPagar.vExibirRenociacoes;
  Panel23.Visible := vDadosIni.vContasAPagar.vExibirRenociacoes;

  Panel17.Top := 0;
  Panel21.Top := Panel17.Top + Panel17.Height;

  Panel22.Top := Panel21.Top + Panel21.Height;
  Panel44.Top := Panel22.Top + Panel22.Height;

  Panel52.Top := Panel44.Top + Panel44.Height;
  Panel72.Top := Panel52.Top + Panel52.Height;

  Panel73.Top := Panel72.Top + Panel72.Height;
  Panel74.Top := Panel73.Top + Panel73.Height;

  Panel24.Top := Panel74.Top + Panel74.Height;
  Panel23.Top := Panel24.Top + Panel24.Height;

  Panel21.Height := vDadosIni.IfThen(vDadosIni.vContasAPagar.vExibirRenociacoes, 90, 117);
  Panel44.Height := vDadosIni.IfThen(vDadosIni.vContasAPagar.vExibirRenociacoes, 90, 117);
  Panel72.Height := vDadosIni.IfThen(vDadosIni.vContasAPagar.vExibirRenociacoes, 90, 117);
  Panel74.Height := vDadosIni.IfThen(vDadosIni.vContasAPagar.vExibirRenociacoes, 90, 117);
  Panel23.Height := vDadosIni.IfThen(vDadosIni.vContasAPagar.vExibirRenociacoes, 90, 117);

  if not CTP.loteLanc.IsEmpty then
    CTP._abreDetalhesPagamentoModalidade(
    	CTP.loteLanc.dataSet.FieldByName('N_LOTE').AsInteger,
      CTP.loteLanc.dataSet.FieldByName('DATA_LOTE').AsDateTime);
end;

procedure TFrmCadContasAPagar.BitBtn21Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja mesmo cancelar o lançamento da diferença e continuar a quitação da conta?', 'Atenção',
    MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    if not vDadosIni.PesqPros('CTP035', 'PERMITIR', 'LANC CONTA ' + FloatToStr(CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat),
      'LANCAMENTOS', '', CTP.buscas, True) then
      exit;

    TForm(pnLancDiferenca.Parent).ModalResult := IDCANCEL;
  end;
end;
                                                                
procedure TFrmCadContasAPagar.BitBtn23Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if (Self.Enabled) and (Self.Visible) and (BitBtn23.CanFocus) then
      BitBtn23.SetFocus;
    habilitarDesabilitarReplicacaoConta(False);
    if not CTP.Post then
      setFocusCampoErro(CTP.vNomeCampoErro, CTP.vMensagemErro)
    else
    begin
      edQtdeReplicarCadastro.AsValue := 0;
      edDiaVencimentoReplicarCadastro.AsValue := 0;
      cbReferenciaMesCadastro.ItemIndex := 0;
      ckbReplAlterarNumQdeParcelaCadastro.Checked := True;
      ckbReplNaoAlterarNumQdeParcelaCadastro.Checked := False;
      if not cdsDesp.IsEmpty then      
        cdsDesp.EmptyDataSet;
      if CTP.QtdeReplicacao > 0 then
      begin
        CTP.QtdeReplicacao := 0;
        CTP.DiaReplicacao := 0;
        CTP.ReferenciaMes := true;
        CTP.ReplAltNumQtdeReplicacao := true;
        CTP.ReplNaoAltNumQtdeReplicacao := false;
      end;
      TForm(GroupBox1.Parent).ModalResult := IDOK
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadContasAPagar.BitBtn24Click(Sender: TObject);
begin
  inherited;
  TForm(pnDetalhesPagamento.Parent).ModalResult := IDOK;
end;

procedure TFrmCadContasAPagar.BitBtn25Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn25.CanFocus) then
    BitBtn25.SetFocus;
  if (vDadosIni.vContrapartida) then
    Application.MessageBox('Operação cancelada pelo usuário', 'Atenção', 0 + 64);
    
  edQtdeReplicarCadastro.AsValue := 0;
  edDiaVencimentoReplicarCadastro.AsValue := 0;
  cbReferenciaMesCadastro.ItemIndex := 0;
  ckbReplAlterarNumQdeParcelaCadastro.Checked := True;
  ckbReplNaoAlterarNumQdeParcelaCadastro.Checked := False;
  if not cdsDesp.IsEmpty then
  	cdsDesp.EmptyDataSet;
  if CTP.QtdeReplicacao > 0 then
  begin
    CTP.QtdeReplicacao := 0;
    CTP.DiaReplicacao := 0;
    CTP.ReferenciaMes := true;
    CTP.ReplAltNumQtdeReplicacao := true;
    CTP.ReplNaoAltNumQtdeReplicacao := false;
  end;
  CTP.Cancel;
  CTP.CancelUpdates;
  CTP.RollBackTransacao;
  TForm(GroupBox1.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadContasAPagar.BitBtn26Click(Sender: TObject);
begin
  inherited;

  if CTP.dataSet.FieldByName('VALOR_CTP').AsFloat <= 0 then
  begin
    Application.MessageBox('Valor do documento não informado, favor informar antes de continuar', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
    	DBEdit10.SetFocus;
    Exit;
  end;

  if CTP.dataSet.FieldByName('DATA_VENC_CTP').AsFloat <= 0 then
  begin
    Application.MessageBox('Data de Vencimento não informado, favor informar antes de continuar', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
    	DBEdit1.SetFocus;
    Exit;
  end;

  if trim(CTP.dataSet.FieldByName('N_DOC_CTP').AsString) = '' then
  begin
    Application.MessageBox('Número do documento não informado, favor informar antes de continuar', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
    	DBEdit9.SetFocus;
    Exit;
  end;

  if not ctp.abreFormParcelamentoContas(true) then
  	exit;
end;

procedure TFrmCadContasAPagar.BitBtn27Click(Sender: TObject);
var
  vMensagem: string;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn27.CanFocus) then
  	BitBtn27.SetFocus;
  if EditHwNumConta.AsValue <= 0 then
  begin
    Application.MessageBox('Numero da Conta inválido, dever ser maior que zero', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (EditHwNumConta.CanFocus) then
      EditHwNumConta.SetFocus;
    Exit;
  end;

  if not CTP.verificarConta('S', EditHwNumConta.AsValue) then
  begin
    if (Self.Enabled) and (Self.Visible) and (EditHwNumConta.CanFocus) then
      EditHwNumConta.SetFocus;
    Exit;
  end;

  if not CTP.testarNumConta2('S', EditHwNumConta.AsValue, vMensagem) then
  begin
    Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
    if not vDadosIni.PesqPros('CTP032', 'PERMITIR', 'CONTA ' + FloatToStr(EditHwNumConta.AsValue),
      'CONTAS_A_PAGAR', CTP.dataSet.FieldByName('cod_contrp').AsString, CTP.buscas, True) then
    begin
      if (Self.Enabled) and (Self.Visible) and (EditHwNumConta.CanFocus) then
        EditHwNumConta.SetFocus;
      exit;
    end;
  end;

  if edQtdeRepl.AsInteger <= 0 then
  begin
    Application.MessageBox('Quantidade inválida, dever ser maior que zero', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (edQtdeRepl.CanFocus) then
      edQtdeRepl.SetFocus;
    Exit;
  end;

  if (edDiaVencReplicar.AsInteger <= 0) or (edDiaVencReplicar.AsInteger > 31) then
  begin
    Application.MessageBox('Dia de vencimento inválido, dever estar entre 1 e 31', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (edDiaVencReplicar.CanFocus) then
      edDiaVencReplicar.SetFocus;
    Exit;
  end;

  CTP.QtdeReplicacao := edQtdeRepl.AsInteger;
  CTP.DiaReplicacao := edDiaVencReplicar.AsInteger;
  CTP.ReferenciaMes := cbReferenciaMes.Text = 'SIM';
  CTP.ReplAltNumQtdeReplicacao := ckbReplAlterarNumQdeParcela.Checked;
  CTP.ReplNaoAltNumQtdeReplicacao := ckbReplNaoAlterarNumQdeParcela.Checked;
  TForm(pnReplicar.Parent).ModalResult := IDOK;
end;

procedure TFrmCadContasAPagar.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if (vDadosIni.vContrapartida) then
    Application.MessageBox('Operação cancelada pelo usuário', 'Atenção', 0 + 64);
end;

procedure TFrmCadContasAPagar.BitBtn31Click(Sender: TObject);
var
  vValorParcelas: Double;
  I: Integer;
begin
  inherited;
  vValorParcelas := 0;

  if (Length(CTP.FContas.numeroDocumento) > 0) and (cdsDesp.IsEmpty) then
    btGerarClick(Sender);

  for I := 0 to Length(CTP.FContas.numeroDocumento) - 1 do
    vValorParcelas := vValorParcelas + CTP.FContas.valorDocumento[I];

  if (vDadosIni.StrToFloatFormat(vValorParcelas, 2) > 0) and (vDadosIni.StrToFloatFormat(vValorParcelas, 2) <>  vDadosIni.StrToFloatFormat(EditHw2.AsValue, 2)) then
  begin
   Application.MessageBox(Pchar('Valor total das parcelas difere do valor da contrapartida' + #13 +
   	'Valor total do parcelamento: R$ ' + FormatFloat('0.00', vValorParcelas) + #13 +
      'Valor da contrapartida: R$ ' + FormatFloat('0.00', EditHw2.AsValue) + #13 +
      'Favor conferir!'), 'Aviso', MB_OK + MB_ICONEXCLAMATION + MB_DEFBUTTON1);
     exit;
  end;


  TForm(pnFaturaDesp.Parent).ModalResult := IDOK;
end;

procedure TFrmCadContasAPagar.BitBtn32Click(Sender: TObject);
begin
  inherited;
  TForm(pnPagLancS2.Parent).ModalResult := IDOK;
end;

procedure TFrmCadContasAPagar.BitBtn34Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja cancelar parcelamento?', 'Atenção',  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
   exit;

  btApagarDespClick(Sender);
  TForm(pnFaturaDesp.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadContasAPagar.BitBtn35Click(Sender: TObject);
begin
  inherited;
  if not CTP.loteLanc.IsEmpty then
    CTP._abreDetalhesPagamentoContrapartida(CTP.NumLoteLanc, CTP.DataLoteLanc);
end;

procedure TFrmCadContasAPagar.BitBtn36Click(Sender: TObject);
var
  vCodContrp, vCodContrpOrig, vLote, vCodEmpresa: Integer;
  vStatusCtp: string;
begin
  try
  	vCodContrp     := CTP.dataSet.FieldByName('COD_CONTRP').AsInteger;
    vCodContrpOrig := CTP.dataSet.FieldByName('COD_CONTRP_ORIG').AsInteger;
    vCodEmpresa    := CTP.dataSet.FieldByName('CODIGO_EMP').AsInteger;
    vLote          := CTP.dataSet.FieldByName('LOTE').AsInteger;
    vStatusCtp     := Trim(CTP.dataSet.FieldByName('STATUS_CTP').AsString);

    if CTP.detalhesConta.dataSet.FieldByName('LOTE').AsInteger <= 0 then
    begin
      Application.MessageBox('Conta não quitada não é possível imprimir.', 'Atenção', MB_OK + MB_ICONINFORMATION);
      exit;
    end;

    CTP.loteLanc._abreLoteLanc(
    	CTP.detalhesConta.dataSet.FieldByName('LOTE').AsInteger,
      CTP.detalhesConta.dataSet.FieldByName('DATQ_CTP').AsDateTime);

    if CTP.loteLanc.IsEmpty then
    begin
      Application.MessageBox('Lote da Conta não encontrado não é possível imprimir.', 'Atenção', MB_OK + MB_ICONINFORMATION);
      exit;
    end;

    CTP._ImprimeRelatorioLoteCTP;
  finally
  	CTP.dataSet.Refresh;
  	FrmCadContasAPagar.Label64.Visible  := Trim(vStatusCtp) = '';
    FrmCadContasAPagar.BitBtn36.Enabled := (vLote > 0) or (vCodContrpOrig > 0);
    FrmCadContasAPagar.BitBtn37.Enabled := (vLote > 0) or (vCodContrpOrig > 0);
    FrmCadContasAPagar.BitBtn39.Enabled := (vLote > 0) or (vCodContrpOrig > 0);
  	CTP.detalhesConta._abreDetalhesConta(vDadosIni.IfThen(vCodContrpOrig > 0, vCodContrpOrig, vCodContrp), vCodEmpresa);
  end;
end;

procedure TFrmCadContasAPagar.BitBtn37Click(Sender: TObject);
var
  vCodContrp, vCodContrpOrig, vLote, vCodEmpresa: Integer;
  vStatusCtp: string;
begin
  try
  	vCodContrp     := CTP.dataSet.FieldByName('COD_CONTRP').AsInteger;
    vCodContrpOrig := CTP.dataSet.FieldByName('COD_CONTRP_ORIG').AsInteger;
    vCodEmpresa    := CTP.dataSet.FieldByName('CODIGO_EMP').AsInteger;
    vLote          := CTP.dataSet.FieldByName('LOTE').AsInteger;
    vStatusCtp     := Trim(CTP.dataSet.FieldByName('STATUS_CTP').AsString);

    Panel24.Visible := vDadosIni.vContasAPagar.vExibirRenociacoes;
    Panel23.Visible := vDadosIni.vContasAPagar.vExibirRenociacoes;

    Panel17.Top := 0;
    Panel21.Top := Panel17.Top + Panel17.Height;

    Panel22.Top := Panel21.Top + Panel21.Height;
    Panel44.Top := Panel22.Top + Panel22.Height;

    Panel52.Top := Panel44.Top + Panel44.Height;
    Panel72.Top := Panel52.Top + Panel52.Height;

    Panel73.Top := Panel72.Top + Panel72.Height;
    Panel74.Top := Panel73.Top + Panel73.Height;

    Panel24.Top := Panel74.Top + Panel74.Height;
    Panel23.Top := Panel24.Top + Panel24.Height;

    Panel21.Height := vDadosIni.IfThen(vDadosIni.vContasAPagar.vExibirRenociacoes, 90, 117);
    Panel44.Height := vDadosIni.IfThen(vDadosIni.vContasAPagar.vExibirRenociacoes, 90, 117);
    Panel72.Height := vDadosIni.IfThen(vDadosIni.vContasAPagar.vExibirRenociacoes, 90, 117);
    Panel74.Height := vDadosIni.IfThen(vDadosIni.vContasAPagar.vExibirRenociacoes, 90, 117);
    Panel23.Height := vDadosIni.IfThen(vDadosIni.vContasAPagar.vExibirRenociacoes, 90, 117);

    if CTP.detalhesConta.dataSet.FieldByName('LOTE').AsInteger <= 0 then
    begin
      Application.MessageBox('Conta não quitada não é possível visualizar detalhes do recebimento.', 'Atenção', MB_OK + MB_ICONINFORMATION);
      exit;
    end;

    CTP.loteLanc._abreLoteLanc(
    	CTP.detalhesConta.dataSet.FieldByName('LOTE').AsInteger,
      CTP.detalhesConta.dataSet.FieldByName('DATQ_CTP').AsDateTime);

    if CTP.loteLanc.IsEmpty then
    begin
      Application.MessageBox('Lote da Conta não encontrado não é possível visualizar detalhes do recebimento.', 'Atenção', MB_OK + MB_ICONINFORMATION);
      exit;
    end;

    CTP._abreDetalhesPagamentoModalidade(
    	CTP.loteLanc.dataSet.FieldByName('N_LOTE').AsInteger,
      CTP.loteLanc.dataSet.FieldByName('DATA_LOTE').AsDateTime);
  finally
  	CTP.dataSet.Refresh;
  	FrmCadContasAPagar.Label64.Visible  := Trim(vStatusCtp) = '';
    FrmCadContasAPagar.BitBtn36.Enabled := (vLote > 0) or (vCodContrpOrig > 0);
    FrmCadContasAPagar.BitBtn37.Enabled := (vLote > 0) or (vCodContrpOrig > 0);
    FrmCadContasAPagar.BitBtn39.Enabled := (vLote > 0) or (vCodContrpOrig > 0);
    CTP.detalhesConta._abreDetalhesConta(vDadosIni.IfThen(vCodContrpOrig > 0, vCodContrpOrig, vCodContrp), vCodEmpresa);
  end;
end;

procedure TFrmCadContasAPagar.BitBtn38Click(Sender: TObject);
begin
  inherited;
	TForm(pnDetalhes.Parent).ModalResult := IDOK;
end;

procedure TFrmCadContasAPagar.BitBtn39Click(Sender: TObject);
var
	vCodContrp, vCodContrpOrig, vLote, vCodEmpresa: Integer;
  vStatusCtp: string;
	AImagemDoc: THandle;
  AProcedure: Tcadastrosbasicos_abreFormImagemDoc;
begin
	try
  	vCodContrp     := CTP.dataSet.FieldByName('COD_CONTRP').AsInteger;
    vCodContrpOrig := CTP.dataSet.FieldByName('COD_CONTRP_ORIG').AsInteger;
    vCodEmpresa    := CTP.dataSet.FieldByName('CODIGO_EMP').AsInteger;
    vLote          := CTP.dataSet.FieldByName('LOTE').AsInteger;
    vStatusCtp     := Trim(CTP.dataSet.FieldByName('STATUS_CTP').AsString);

    if CTP.detalhesConta.dataSet.FieldByName('LOTE').AsInteger <= 0 then
    begin
      Application.MessageBox('Conta não quitada não é possível imprimir.', 'Atenção', MB_OK + MB_ICONINFORMATION);
      exit;
    end;

    CTP.loteLanc._abreLoteLanc(
    	CTP.detalhesConta.dataSet.FieldByName('LOTE').AsInteger,
      CTP.detalhesConta.dataSet.FieldByName('DATQ_CTP').AsDateTime);

    if CTP.loteLanc.IsEmpty then
    begin
      Application.MessageBox('Lote da Conta não encontrado não é possível imprimir.', 'Atenção', MB_OK + MB_ICONINFORMATION);
      exit;
    end;

  	if not vDadosIni.PesqPros('CTP037', 'VISUALIZAR', '', 'CONTAS_A_PAGAR_IMAGENS',
	  	'LOTE ' + CTP.detalhesConta.dataSet.FieldByName('LOTE').AsString, CTP.buscas, true) then
  		  Exit;

    CarregaPacote('pkCadastrosBasicos', AImagemDoc);

    if AImagemDoc = 0 then
    begin
      Application.MessageBox('Pacote Cadastros Básicos não carregado', 'Atenção', 0 + 64);
      Exit;
    end;

    @AProcedure := GetProcAddress(AImagemDoc, 'cadastrosbasicos_abreFormImagemDoc');
    AProcedure(
    	CTP.buscas,
      CTP.detalhesConta.dataSet.FieldByName('LOTE').AsInteger,
      CTP.detalhesConta.dataSet.FieldByName('CODIGO_EMP').AsInteger,
      'LOTECTP'
    );

  finally
  	CTP.dataSet.Refresh;
  	FrmCadContasAPagar.Label64.Visible  := Trim(vStatusCtp) = '';
    FrmCadContasAPagar.BitBtn36.Enabled := (vLote > 0) or (vCodContrpOrig > 0);
    FrmCadContasAPagar.BitBtn37.Enabled := (vLote > 0) or (vCodContrpOrig > 0);
    FrmCadContasAPagar.BitBtn39.Enabled := (vLote > 0) or (vCodContrpOrig > 0);
  	CTP.detalhesConta._abreDetalhesConta(vDadosIni.IfThen(vCodContrpOrig > 0, vCodContrpOrig, vCodContrp), vCodEmpresa);
  end;
end;

procedure TFrmCadContasAPagar.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'I', CTP.buscas) then
    Exit;

  if not vDadosIni.PesqPros('CTP021', 'INCLUIR', '', 'CONTAS_A_PAGAR', '', CTP.buscas, true) then
  	exit;

  inherited;
  CTP.Recebendo := False;
  if not CTP.Insert then
    exit;

  habilitarDesabilitarReplicacaoConta(False);
  edQtdeReplicarCadastro.AsValue := 0;
  edDiaVencimentoReplicarCadastro.AsValue := 0;
  cbReferenciaMesCadastro.ItemIndex := 0;
  ckbReplAlterarNumQdeParcelaCadastro.Checked := True;
  ckbReplNaoAlterarNumQdeParcelaCadastro.Checked := False;
  if not cdsDesp.IsEmpty then
    cdsDesp.EmptyDataSet;
  if CTP.QtdeReplicacao > 0 then
  begin
    CTP.QtdeReplicacao := 0;
    CTP.DiaReplicacao := 0;
    CTP.ReferenciaMes := true;
    CTP.ReplAltNumQtdeReplicacao := true;
    CTP.ReplNaoAltNumQtdeReplicacao := false;
  end;
  //    TabSheet3.TabVisible := true;
  Panel29.Visible := vDadosIni.vContrapartida;
  if not vDadosIni.vContrapartida then
  begin
    PageControl3.ActivePage := TabSheet3;
    TabSheet3.Show;
  end;

  DBEdit27.Enabled := False;
  DBEdit16.Enabled := False;
  DBEdit1.Enabled := True;
  DBEdit9.Enabled := True;
  Label42.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  DBEdit23.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  DBLookupComboBox4.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  DBEdit23.Enabled := True;
  DBLookupComboBox4.Enabled := True;

  if (DBEdit23.Visible) and (DBEdit23.Enabled)
    and (vDadosIni.vContrapartida) and (vDadosIni.vEmp.vFinanceiroUnificado) then
  begin
    DBEdit23.Enabled := false;
    CTP.dataSet.FieldByName('COD_EMP_MULT').AsInteger := vDadosIni.vCodEmpresaUnificadaContrapartida;
  end;

  if (DBLookupComboBox4.Visible) and (DBLookupComboBox4.Enabled)
    and (vDadosIni.vContrapartida) and (vDadosIni.vEmp.vFinanceiroUnificado) then
    DBLookupComboBox4.Enabled := false;

  if not vDadosIni.vContrapartida then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit23.CanFocus) then
      DBEdit23.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
      DBEdit2.SetFocus;
  end;
  ctp.vpermitir := false;
  CTP.vNumConta := 0;
  DBEdit10.Enabled := not vDadosIni.vContrapartida;
  DBEdit68.Enabled := not vDadosIni.vContrapartida;
  Edit3.Text := '';
  Edit4.Text := '';
  Edit5.Text := '';
end;

procedure TFrmCadContasAPagar.BitBtn40Click(Sender: TObject);
var
	AImagemDoc: THandle;
  AProcedure: Tcadastrosbasicos_abreFormImagemDoc;
begin
	if CTP.loteLanc.IsEmpty then
  	exit;

  if not vDadosIni.PesqPros('CTP037', 'VISUALIZAR', '', 'CONTAS_A_PAGAR_IMAGENS',
    'LOTE ' + CTP.loteLanc.dataSet.FieldByName('N_LOTE').AsString, CTP.buscas, true) then
      Exit;
    
	CarregaPacote('pkCadastrosBasicos', AImagemDoc);

  if AImagemDoc = 0 then
  begin
    Application.MessageBox('Pacote Cadastros Básicos não carregado', 'Atenção', 0 + 64);
    Exit;
  end;

  @AProcedure := GetProcAddress(AImagemDoc, 'cadastrosbasicos_abreFormImagemDoc');
  AProcedure(
  	CTP.buscas,
  	CTP.loteLanc.dataSet.FieldByName('N_LOTE').AsInteger,
  	CTP.loteLanc.dataSet.FieldByName('CODIGO_EMP').AsInteger,
    'LOTECTP'
  );
end;

procedure TFrmCadContasAPagar.BitBtn41Click(Sender: TObject);
begin
  inherited;
  //    conta.dadosReceber.lancarDesconto := CheckBox6.Checked;
  //    conta.dadosReceber.lancarJuros := CheckBox7.Checked;
  //    conta.dadosReceber.historicoSaidaLancamento := Edit5.Text;
  //    CTP.rCTP.vDataBaixa := StrToDate(MaskEdit4.Text);
  if CTP.baixaParcial then
  begin
    if vDadosIni.StrToFloatFormat(edValorBaixaParcial.AsValue, 2) = 0 then
    begin
      Application.MessageBox('Valor inválido', 'Atenção', 0 + 64);
      Exit;
    end;

    if vDadosIni.StrToFloatFormat(edValorBaixaParcial.AsValue, 2) >=
      vDadosIni.StrToFloatFormat(
      CTP.dataSet.FieldByName('VALOR_CTP').AsFloat, 2) then
    begin
      Application.MessageBox('Valor informado maior ou igual ao valor devido, utilize a quitação normal', 'Atenção', 0 + 64);
      Exit;
    end;
  end;

  TForm(pnDadosQuitacao.Parent).ModalResult := IDOK;
end;

procedure TFrmCadContasAPagar.BitBtn42Click(Sender: TObject);
begin
  inherited;
  if not CTP._cancelarPagamento then
    exit;
  TForm(pnDadosQuitacao.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadContasAPagar.BitBtn43Click(Sender: TObject);
begin
  inherited;

  if not CTP.Post then
    setFocusCampoErro(CTP.vNomeCampoErro, CTP.vMensagemErro)
  else
		TForm(pnPagLancCTP.Parent).ModalResult := IDOK;
end;

procedure TFrmCadContasAPagar.btFornContaOKClick(Sender: TObject);
begin
  if not DBGridFornecedoresConta.DataSource.DataSet.IsEmpty then
  begin
    CTP.dataSet.FieldByName('COD_FORN_NFE').AsInteger := DBGridFornecedoresConta.DataSource.DataSet.FieldByName('COD_CLIENTE').AsInteger;
    CTP.dataSet.FieldByName('NOME_FOR_CTP').AsString := DBGridFornecedoresConta.DataSource.DataSet.FieldByName('RAZAO').AsString;
    CTP.dataSet.FieldByName('CPF_CGC_F').AsString := DBGridFornecedoresConta.DataSource.DataSet.FieldByName('CPFCGC').AsString;
  end;

  TForm(pnFornecedoresConta.Parent).ModalResult := IDOK;
end;

procedure TFrmCadContasAPagar.BitBtn44Click(Sender: TObject);
begin
  inherited;
	CTP._abreFormImpressaoLoteCTP;
end;

procedure TFrmCadContasAPagar.BitBtn45Click(Sender: TObject);
begin
  inherited;
  if CTP.vObs.Insert then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
	    DBMemo1.SetFocus;
  end;
end;

procedure TFrmCadContasAPagar.BitBtn46Click(Sender: TObject);
begin
  inherited;
	CTP.dataSet.Cancel;

  CTP.apagarContas;
  CTP.ApagarContasPagarTemp(cdsDesp);
  DBEdit1.Enabled := cdsDesp.IsEmpty;

  TForm(pnPagLancCTP.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadContasAPagar.btFornContaCancelClick(Sender: TObject);
begin
  TForm(pnFornecedoresConta.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadContasAPagar.BitBtn47Click(Sender: TObject);
begin
  inherited;
  TForm(pnObs.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadContasAPagar.BitBtn48Click(Sender: TObject);
begin
  inherited;
  CTP.vObs.Cancel;
end;

procedure TFrmCadContasAPagar.BitBtn49Click(Sender: TObject);
begin
  inherited;
  if CTP.vObs.Post then
  begin
    if CTP.dataSet.FieldByName('cod_obs').AsInteger = 0 then
    begin
      CTP.dataSet.Edit;
      CTP.dataSet.FieldByName('cod_obs').AsInteger := CTP.vObs.dataSet.FieldByName('cod_obs').AsInteger;
      CTP.dataSet.Post;
      if not CTP.Apply then
        CTP.RollBackTransacao
      else
        CTP.CommitaTransacao;
    end
    else
      CTP.CommitaTransacao;
  end
  else
    setFocusCampoErro(CTP.vObs.vNomeCampoErro);
end;

procedure TFrmCadContasAPagar.BitBtn4Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    BitBtn4.SetFocus;

  habilitarDesabilitarReplicacaoConta(False);
  if not CTP.Post then
    setFocusCampoErro(CTP.vNomeCampoErro, CTP.vMensagemErro)
  else
  begin
    edQtdeReplicarCadastro.AsValue := 0;
    edDiaVencimentoReplicarCadastro.AsValue := 0;
    cbReferenciaMesCadastro.ItemIndex := 0;
    ckbReplAlterarNumQdeParcelaCadastro.Checked := True;
    ckbReplNaoAlterarNumQdeParcelaCadastro.Checked := False;
    if not cdsDesp.IsEmpty then
    begin
      CTP.apagarContas;
      CTP.ApagarContasPagarTemp(cdsDesp);
      DBEdit1.Enabled := cdsDesp.IsEmpty;
    end;
    if CTP.QtdeReplicacao > 0 then
    begin
      CTP.QtdeReplicacao := 0;
      CTP.DiaReplicacao := 0;
      CTP.ReferenciaMes := true;
      CTP.ReplAltNumQtdeReplicacao := true;
      CTP.ReplNaoAltNumQtdeReplicacao := false;
    end;
    if CheckCadSeq.Checked then
    begin
      if CTP.Insert then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
        	DBEdit2.SetFocus;
      MudaCor;
    end
    else
      inherited;
  end;
end;

procedure TFrmCadContasAPagar.BitBtn5Click(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn5.CanFocus) then
    BitBtn5.SetFocus;
  if vDadosIni.PesqPros('CTP022', 'CANCELAR', '', 'CONTAS_A_PAGAR', '', CTP.buscas, true) then
  begin
    edQtdeReplicarCadastro.AsValue := 0;
    edDiaVencimentoReplicarCadastro.AsValue := 0;
    cbReferenciaMesCadastro.ItemIndex := 0;
    ckbReplAlterarNumQdeParcelaCadastro.Checked := True;
    ckbReplNaoAlterarNumQdeParcelaCadastro.Checked := False;
    if not cdsDesp.IsEmpty then
    	cdsDesp.EmptyDataSet;
    if CTP.QtdeReplicacao > 0 then
    begin
      CTP.QtdeReplicacao := 0;
      CTP.DiaReplicacao := 0;
      CTP.ReferenciaMes := true;
      CTP.ReplAltNumQtdeReplicacao := true;
      CTP.ReplNaoAltNumQtdeReplicacao := false;
    end;
    CTP.Cancel;
    CTP.CancelUpdates;
    CTP.RollBackTransacao;
    ActiveControl := BitBtn5;
    inherited;
    TabSheet2.Show;
  end;
end;

procedure TFrmCadContasAPagar.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if edQtdeRepl.AsInteger < 0 then
  begin
    Application.MessageBox('Valor a pagar inválido', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  TForm(pnAtualizarValorPago.Parent).ModalResult := IDOK;
end;

procedure TFrmCadContasAPagar.BitBtn9Click(Sender: TObject);
begin
  inherited;
  TForm(pnAceitarContaCTP.Parent).ModalResult := IDOK;
end;

procedure TFrmCadContasAPagar.btAlterarFaturaEntradaClick(Sender: TObject);
begin
  try
    edDocFaturaEntrada.Text := CTP.FContas.numeroDocumento[ListBox3.ItemIndex];
    edVencimentoFaturaEntrada.Text := CTP.FContas.vencimentoDocumento[ListBox3.ItemIndex];
    edValorFaturaEntrada.AsValue := CTP.FContas.valorDocumento[ListBox3.ItemIndex];
    Panel47.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (edDocFaturaEntrada.CanFocus) then
    	edDocFaturaEntrada.SetFocus;
    btAlterarFaturaEntrada.Enabled := false;
    ListBox3.Enabled := false;
  except
    Application.MessageBox('Selecione a parcela', 'Atenção', mb_ok + MB_ICONINFORMATION);
  end;
end;

procedure TFrmCadContasAPagar.btApagarDespClick(Sender: TObject);
begin
  inherited;
  if not CTP.apagarContas then
    exit;

  CTP.ApagarContasPagarTemp(cdsDesp);
  DBEdit1.Enabled := cdsDesp.IsEmpty;
end;

procedure TFrmCadContasAPagar.btContaCancelClick(Sender: TObject);
begin
  TForm(pnConta.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadContasAPagar.btContaOKClick(Sender: TObject);
begin
  if not DBGridContas.DataSource.DataSet.IsEmpty then
  begin
    CTP.dataSet.FieldByName('N_CONTA_PLC').AsFloat := DBGridContas.DataSource.DataSet.FieldByName('N_CONTA_PLC').AsFloat;

  	if DBGridContas.DataSource.DataSet.FieldByName('TIPO_CTP').AsString = 'F' then
      CTP.dataSet.FieldByName('TIPO_CTP').AsString := 'F'
    else
      CTP.dataSet.FieldByName('TIPO_CTP').AsString := 'D';
  end;

  TForm(pnConta.Parent).ModalResult := IDOK;
end;

procedure TFrmCadContasAPagar.btGerarClick(Sender: TObject);
begin
  inherited;
  CTP.ApagarContasPagarTemp(cdsDesp);
  if not CTP.gerarContas(CTP) then
  	exit;

  CTP.GravarContasPagarTemp(cdsDesp);
end;

procedure TFrmCadContasAPagar.btnMultiempresaCancelarClick(Sender: TObject);
begin
	TForm(pnMultiempresa.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadContasAPagar.btnMultiempresaOKClick(Sender: TObject);
var
	vEmpresa: boolean;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (btnMultiempresaOK.CanFocus) then
  	btnMultiempresaOK.SetFocus;

  vEmpresa := false;
  try
    CTP.vEmpresasUnificadas.dataSet.First;
    while not CTP.vEmpresasUnificadas.dataSet.Eof do
    begin
      if CTP.vEmpresasUnificadas.dataSet.FieldByName('SEL').AsString = 'S' then
      begin
        vEmpresa := true;
        break;
      end;

      CTP.vEmpresasUnificadas.dataSet.Next;
    end;

  finally
    CTP.vEmpresasUnificadas.dataSet.First;
  end;

  if not vEmpresa then
  begin
    Application.MessageBox(Pchar('Favor selecionar as empresas antes de continuar'), 'Atenção', MB_OK +
      MB_ICONWARNING + MB_DEFBUTTON1);
    exit;
  end;

	TForm(pnMultiempresa.Parent).ModalResult := IDOK;
end;

procedure TFrmCadContasAPagar.btnVoltarContrapartidaClick(Sender: TObject);
begin
  inherited;
  TForm(pnDetalhesPagamentoContrapartida.Parent).ModalResult := IDOK;
end;

procedure TFrmCadContasAPagar.btSalvarFaturaEntradaClick(Sender: TObject);
var
  vIndex:Integer;
begin
  inherited;
  try
    vIndex := ListBox3.ItemIndex;
    getFaturas;
    ListBox3.ItemIndex := vIndex;
  finally
    btAlterarFaturaEntrada.Enabled := True;
    ListBox3.Enabled := True;
    Panel47.Visible := False;
  end;
end;

procedure TFrmCadContasAPagar.btSelectAllClick(Sender: TObject);
begin
  inherited;
  CTP._marcaTodasAsLinhas;
end;

procedure TFrmCadContasAPagar.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  CTP._desmarcaTodasAsLinhas;
end;

procedure TFrmCadContasAPagar.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if CheckBox1.Checked then
  begin
    GroupBox24.visible := true;
    if ComboBox11.Items.Count = 0 then
    begin
      ComboBox11.Items := ComboBox1.Items;
      //      ComboBox11.ItemIndex := 0;
      ComboBox11.Text := trim(_LerConfiguracoesRegistroString(ComboBox11.Name));
    end;

    if (UpperCase(trim(ComboBox11.Text)) = 'COMBOBOX11') or (UpperCase(trim(ComboBox11.Text)) = 'TODOS') then
      ComboBox11.ItemIndex := 0
    else
      ComboBox11.ItemIndex := ComboBox11.Items.IndexOf(ComboBox11.Text);

    if ComboBox12.Items.Count = 0 then
    begin
      ComboBox12.Items := ComboBox3.Items;
      ComboBox12.Text := trim(_LerConfiguracoesRegistroString(ComboBox12.Name));
    end;

    if (UpperCase(trim(ComboBox12.Text)) = 'COMBOBOX12') then
      ComboBox12.ItemIndex := 0
    else
      ComboBox12.ItemIndex := ComboBox12.Items.IndexOf(ComboBox12.Text);

    if ComboBox12.Items.Count > 0 then
      if ComboBox12.ItemIndex = - 1 then
      	ComboBox12.ItemIndex := 0;

    if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    	ComboBox11.SetFocus;
  end;
end;

procedure TFrmCadContasAPagar.ckbReplAlterarNumQdeParcelaCadastroClick(
  Sender: TObject);
begin
	if ckbReplAlterarNumQdeParcelaCadastro.Checked then
  	ckbReplNaoAlterarNumQdeParcelaCadastro.Checked := False
  else
  	ckbReplNaoAlterarNumQdeParcelaCadastro.Checked := True;
end;

procedure TFrmCadContasAPagar.ckbReplAlterarNumQdeParcelaClick(Sender: TObject);
begin
	if ckbReplAlterarNumQdeParcela.Checked then
  	ckbReplNaoAlterarNumQdeParcela.Checked := False
  else
  	ckbReplNaoAlterarNumQdeParcela.Checked := True;
end;

procedure TFrmCadContasAPagar.ckbReplNaoAlterarNumQdeParcelaCadastroClick(
  Sender: TObject);
begin
	if ckbReplNaoAlterarNumQdeParcelaCadastro.Checked then
  	ckbReplAlterarNumQdeParcelaCadastro.Checked := False
  else
  	ckbReplAlterarNumQdeParcelaCadastro.Checked := True;
end;

procedure TFrmCadContasAPagar.ckbReplNaoAlterarNumQdeParcelaClick(
  Sender: TObject);
begin
	if ckbReplNaoAlterarNumQdeParcela.Checked then
  	ckbReplAlterarNumQdeParcela.Checked := False
  else
  	ckbReplAlterarNumQdeParcela.Checked := True;
end;

procedure TFrmCadContasAPagar.ComboBox11Exit(Sender: TObject);
var
  i: integer;
begin
  inherited;
  ComboBox11.Text := ComboBox11.Items[ComboBox11.ItemIndex];
  if trim(ComboBox11.Text) = '' then
  begin
  	if ComboBox11.ItemIndex<0 then
  		ComboBox11.ItemIndex := ComboBox11.Items.Count - 1;
  	if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    	ComboBox11.SetFocus;
    exit;
  end;

  if DBGrid1.DataSource <> nil then
    for I := 0 to CTP.dataSet.Fields.Count - 1 do
    begin
      if CTP.dataSet.Fields.Fields[i].DisplayLabel = ComboBox11.Text then
      begin
        if CTP.dataSet.Fields.Fields[i] is TDateTimeField then
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

procedure TFrmCadContasAPagar.ComboBox12Enter(Sender: TObject);
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

procedure TFrmCadContasAPagar.ComboBox12Exit(Sender: TObject);
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

procedure TFrmCadContasAPagar.DBComboBox3KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  key := #0;
end;

procedure TFrmCadContasAPagar.DBEdit10Exit(Sender: TObject);
begin
  inherited;
  if CTP.dataSet.State in [dsInsert, dsEdit] then
    CTP.dataSet.FieldByName('VL_CONTABIL').AsFloat := CTP.dataSet.FieldByName('VALOR_CTP').AsFloat;
end;

procedure TFrmCadContasAPagar.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  if not CTP._procuraCheque(dbedit11.text,CTP.dataSet.FieldByName('CODIGO_CTRL').AsInteger) then
    setFocusCampoErro(CTP.vNomeCampoErro);
end;

procedure TFrmCadContasAPagar.DBEdit16Exit(Sender: TObject);
begin
  inherited;
	DBEdit16.Enabled := False;
end;

procedure TFrmCadContasAPagar.DBEdit17Exit(Sender: TObject);
var
 vMensagem: string;
begin
  if (CTP.dtSetLancTemp.State in [dsInsert, dsEdit]) then
    CTP.dtSetLancTemp.FieldByName('HISTORICO_L').AsString := trim(CTP.dtSetPContas.FieldByName('DESC_PLC').AsString);

  if (CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat <=0) then
  begin
    Application.MessageBox('Conta de entrada não informada.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBEdit17.CanFocus) then
      DBEdit17.SetFocus;
    Exit;
  end;

  if not CTP.verificarConta('E', CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit17.CanFocus) then
      DBEdit17.SetFocus;
    Exit;
  end;

//  if not CTP.testarNumConta3('E', CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat, vMensagem) then
//  begin
//    Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
//    CTP.vNumConta := 0;
//    exit;
//  end;
  CTP.vNumConta := CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat;
end;

procedure TFrmCadContasAPagar.DBEdit22Exit(Sender: TObject);
begin
  if (CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat <=0) then
  begin
    Application.MessageBox('Nº da Conta não informada.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBEdit22.CanFocus) then
      DBEdit22.SetFocus;
    Exit;
  end;

  if not CTP.verificarConta('S', CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit22.CanFocus) then
      DBEdit22.SetFocus;
    Exit;
  end;

  if not (CTP.dtSetLancTemp.State in [dsInsert, dsEdit]) then
   exit;

  if (CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat <> CTP.rCTP.numContaTemp)
   and (CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat <> CTP.rCTP.vNumContaPadrao) then
  begin
      if (trim(CTP.dtSetLancTemp.FieldByName('HISTORICO_L').AsString) =
        trim(CTP.dtSetPContas.FieldByName('DESC_PLC').AsString)) then
         exit;

      if Application.MessageBox(pchar('Deseja atualizar o histórico do lançamento?'),
        'Atenção',  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) <> IDYES then
      begin
        CTP.rCTP.numContaTemp := CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat;
        exit;
      end;

      CTP.dtSetLancTemp.FieldByName('HISTORICO_L').AsString :=
      	trim(CTP.dtSetPContas.FieldByName('DESC_PLC').AsString);
  end
  else
  begin
    if (CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat = CTP.rCTP.numContaTemp) then
      exit;
      
  	CTP.dtSetLancTemp.FieldByName('HISTORICO_L').AsString :=
      	trim(CTP.rCTP.vHistoricoPadrao);
  end;
        
  CTP.rCTP.numContaTemp := CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat;
end;

procedure TFrmCadContasAPagar.DBEdit23Exit(Sender: TObject);
var
 vTemp: string;
begin                         
 if vDadosIni.vEmp.vFinanceiroUnificado then
 begin
   if CTP.dataSet.State = dsInsert then
 	 	 CTP._listaControles(false, 0, CTP.dataSet.FieldByName('COD_EMP_MULT').AsInteger)
   else
   	 CTP._listaControles(false, CTP.dataSet.FieldByName('CODIGO_CTRL').AsInteger, CTP.dataSet.FieldByName('COD_EMP_MULT').AsInteger);

   if (CTP.dataSet.FieldByName('COD_FORN_NFE').AsInteger > 0)
   	 or (CTP.dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0) then
   begin
     if CTP.vCodEmpMult <> CTP.dataSet.FieldByName('COD_EMP_MULT').AsInteger then
     begin
      	if (CTP.dataSet.FieldByName('COD_FORN_NFE').AsInteger > 0)
        	and (CTP.dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0) then
        	vTemp := 'fornecedor e controle'
        else if (CTP.dataSet.FieldByName('COD_FORN_NFE').AsInteger > 0) then
        	vTemp := 'fornecedor'
        else if (CTP.dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0) then
        	vTemp := 'controle';

        if Application.MessageBox(pchar('Empresa Unificada foi alterada,' +
          ' é necessário informar o ' +vTemp+ ' novamente, Deseja continuar assim mesmo?'),
          'Atenção',  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
        begin
           CTP.vCodEmpMult := CTP.dataSet.FieldByName('COD_EMP_MULT').AsInteger;
           CTP.dataSet.FieldByName('COD_FORN_NFE').Value := null;
           CTP.dataSet.FieldByName('NOME_FOR_CTP').Value := null;
           if CTP.dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0 then
             CTP.dataSet.FieldByName('CODIGO_CTRL').Value := null;
           exit;
        end
        else
        begin
          if (Sender is TDBEdit) then
          begin
           if (Self.Enabled) and (Self.Visible) and ((Sender as TDBEdit).CanFocus) then
             (Sender as TDBEdit).SetFocus;
          end
          else if (Sender is TDBLookupComboBox) then
          begin
            if (Self.Enabled) and (Self.Visible) and ((Sender as TDBLookupComboBox).CanFocus) then
              (Sender as TDBLookupComboBox).SetFocus;
        	end;
     		end;
		 end;
   end
   else
     CTP.vCodEmpMult := CTP.dataSet.FieldByName('COD_EMP_MULT').AsInteger;
 end;
end;

procedure TFrmCadContasAPagar.DBEdit27Exit(Sender: TObject);
begin
  inherited;
  DBEdit27.Enabled := False;
end;

procedure TFrmCadContasAPagar.DBEdit2Enter(Sender: TObject);
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn23) or (ActiveControl = BitBtn25)) then
    Exit;
    
  if CTP.dtSetPContas <> nil then
    CTP.dtSetPContas.Refresh;
end;

procedure TFrmCadContasAPagar.DBEdit2Exit(Sender: TObject);
var
	vMensagem: string;
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn23) or (ActiveControl = BitBtn25)) then
    Exit;

  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (ActiveControl <> BitBtn23) and (ActiveControl <> BitBtn25) and (not clicouNoX) then
  begin
    if CTP.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
    begin
      if not CTP._dadosNContaPlcValidos(trim(CTP.dataSet.FieldByName('HISTORICO_CTP').AsString) = '') then
      begin
        setFocusCampoErro(CTP.vNomeCampoErro);
      end;

      if (CTP.dataSet.FieldByName('COD_FORN_NFE').AsInteger <= 0)
      	and (trim(CTP.dataSet.FieldByName('NOME_FOR_CTP').AsString) = '') then
      begin
        if CTP.dataSet.FieldByName('N_CONTA_PLC').AsFloat <> 0 then
        begin
          if not CTP._locFornecedor(
            CTP.dataSet.FieldByName('N_CONTA_PLC').AsFloat,
            CTP.dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
              exit;
        end;
      end;
    end
    else
    begin
      CTP.rCTP.vDescricaoGR := '';
      CTP.rCTP.vDescricaoDEP := '';
      CTP.rCTP.vTipoConta := '';
    end;
    Edit3.Text := CTP.rCTP.vDescricaoGR;
    Edit4.Text := CTP.rCTP.vDescricaoDEP;
    Edit5.Text := CTP.rCTP.vTipoConta;
  end;

  if CTP.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
  begin
    if not CTP.testarNumConta(CTP.dataSet.FieldByName('N_CONTA_PLC').AsFloat, vMensagem) then
    begin
      if not CTP.vpermitir then
       Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
      if vDadosIni.PesqPros('CTP032', 'PERMITIR', 'CONTA ' + CTP.dataSet.FieldByName('N_CONTA_PLC').AsString,
        'CONTAS_A_PAGAR', CTP.dataSet.FieldByName('cod_contrp').AsString, CTP.buscas, True) then
         CTP.vpermitir := true
      else
      begin
        if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
          DBEdit2.SetFocus;
        exit;
      end;
    end;
  end;
end;

procedure TFrmCadContasAPagar.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''S'' ',
      'Consulta do Plano de Contas'));
    if vDadosIni.vPesquisa <> '' then
      if CTP.dataSet.State in [dsInsert, dsEdit] then
        CTP.dataSet.FieldByName('N_CONTA_PLC').AsFloat := StrToFloatDef(
          vDadosIni.vPesquisa, CTP.dataSet.FieldByName('N_CONTA_PLC').AsFloat);
  end
  else if Key = VK_F4 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS_CONTABIL'));
    if vDadosIni.vPesquisa <> '' then
    begin
      vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
        ' and P_CONTAS.COD_CTA_CONTABIL = ' + QuotedStr(vDadosIni.vPesquisa) +
        ' and P_CONTAS.TIPO_PLC = ''S'' ',
        'Plano de contas Conta Contabil = ' + vDadosIni.vPesquisa));
      if CTP.dataSet.State in [dsInsert, dsEdit] then
        CTP.dataSet.FieldByName('N_CONTA_PLC').AsFloat := StrToFloatDef(
          vDadosIni.vPesquisa, CTP.dataSet.FieldByName('N_CONTA_PLC').AsFloat);
    end;
  end;
end;

procedure TFrmCadContasAPagar.DBEdit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
  	try
      vDadosIni.vPesquisaCodEmpresa := vDadosIni.cod_empresa;
      vDadosIni.codEmpresa := IntToStr(CTP.dataSet.FieldByName('COD_EMP_MULT').AsInteger);
      vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('CONTROLES', ' and (coalesce(controle_visivel, ''S'') = ''S'') ', 'Consulta de Controles '));
    finally
    	vDadosIni.codEmpresa := IntToStr(vDadosIni.vPesquisaCodEmpresa);
      vDadosIni.vPesquisaCodEmpresa := 0;
    end;
    if (Trim(vDadosIni.vPesquisa) = '') then
    	vDadosIni.vPesquisa := '0';
    CTP.dataSet.FieldByName('CODIGO_CTRL').AsInteger := StrToInt(vDadosIni.vPesquisa);
  end
end;

procedure TFrmCadContasAPagar.DBEdit5Exit(Sender: TObject);
var
	vMensagem: string;
begin
  inherited;
  if ActiveControl <> BitBtn5 then
  begin
    if trim(TDbedit(sender).text) = '' then
    begin
      try
        Screen.Cursor := crHourGlass;
        try
          vDadosIni.vPesquisaCodEmpresa := CTP.dataSet.FieldByName('COD_EMP_MULT').AsInteger;
          vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES', ' and (tipo=''F'' or tipo=''A'') ', 'Consulta de Fornecedores');
        finally
          vDadosIni.vPesquisaCodEmpresa := 0;
        end;
        if (Trim(vDadosIni.vPesquisa) = '') then
          vDadosIni.vPesquisa := '0';
        CTP.dataSet.FieldByName('COD_FORN_NFE').AsInteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;

    if (trim(TDbedit(sender).text) <> '') then
    begin
      if not CTP._locFornecedor(
      	CTP.dataSet.FieldByName('COD_FORN_NFE').AsInteger,
        CTP.dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
      begin
        setFocusCampoErro(CTP.vNomeCampoErro);
        exit;
      end;

      if CTP.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
      begin
        if not CTP._dadosNContaPlcValidos(trim(CTP.dataSet.FieldByName('HISTORICO_CTP').AsString) = '') then
        begin
          setFocusCampoErro(CTP.vNomeCampoErro);
        end;
      end
      else
      begin
        CTP.rCTP.vDescricaoGR := '';
        CTP.rCTP.vDescricaoDEP := '';
        CTP.rCTP.vTipoConta := '';
      end;
      Edit3.Text := CTP.rCTP.vDescricaoGR;
      Edit4.Text := CTP.rCTP.vDescricaoDEP;
      Edit5.Text := CTP.rCTP.vTipoConta;

      if CTP.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
      begin
        if not CTP.testarNumConta(CTP.dataSet.FieldByName('N_CONTA_PLC').AsFloat, vMensagem) then
        begin
          if not CTP.vpermitir then
           Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
          if vDadosIni.PesqPros('CTP032', 'PERMITIR', 'CONTA ' + CTP.dataSet.FieldByName('N_CONTA_PLC').AsString,
            'CONTAS_A_PAGAR', CTP.dataSet.FieldByName('cod_contrp').AsString, CTP.buscas, True) then
             CTP.vpermitir := true
          else
          begin
            if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
              DBEdit2.SetFocus;
            exit;
          end;
        end;
      end;
    end;
  end;
end;

procedure TFrmCadContasAPagar.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  try
    if key = VK_F3 then
    begin
      Screen.Cursor := crHourGlass;
      try
        vDadosIni.vPesquisaCodEmpresa := CTP.dataSet.FieldByName('COD_EMP_MULT').AsInteger;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES', ' and (tipo=''F'' or tipo=''A'') ', 'Consulta de Fornecedores');
      finally
        vDadosIni.vPesquisaCodEmpresa := 0;
      end;
      if (Trim(vDadosIni.vPesquisa) <> '') then
        CTP.dataSet.FieldByName('COD_FORN_NFE').AsInteger := strtoint(vDadosIni.vPesquisa);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadContasAPagar.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    CTP._marcaDesmarcaLinha;
end;

procedure TFrmCadContasAPagar.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  CTP._marcaDesmarcaLinha;
end;

procedure TFrmCadContasAPagar.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if (Column.FieldName = 'DATA_VENC_CTP') and
    (not CTP.dataSet.FieldByName('DATA_VENC_CTP').IsNull) and
    ((CTP.dataSet.FieldByName('DATA_VENC_CTP').AsDateTime) < vDtDia) and
    (Trim(CTP.dataSet.FieldByName('STATUS_CTP').AsString) <> 'QUITADO') then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if CTP.dataSet.FieldByName('sel').AsString = 'S' then
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

procedure TFrmCadContasAPagar.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
    CTP._marcaDesmarcaLinha;
  //  else if key = VK_DELETE then
  //    SpeedButton2Click(Sender);
end;

procedure TFrmCadContasAPagar.DBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    CTP._marcaDesmarcaLinha;
end;

procedure TFrmCadContasAPagar.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
  begin
    CTP.ch._marcaDesmarcaLinha(CTP.dtSetLancTemp);
    CTP.ch._atualizaValorChequesSel(lbChequesSel);
  end;
end;

procedure TFrmCadContasAPagar.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if CTP.ch.dataSet.FieldByName('sel').AsString = 'S' then
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
  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    DBGrid2.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(DBGrid2.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
  if not TDBGrid(sender).Enabled then
    TDBGrid(sender).Enabled := true;
end;

procedure TFrmCadContasAPagar.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
  begin
    CTP.ch._marcaDesmarcaLinha(CTP.dtSetLancTemp);
    CTP.ch._atualizaValorChequesSel(lbChequesSel);
  end;
end;

procedure TFrmCadContasAPagar.DBGrid2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
  begin
    CTP.ch._marcaDesmarcaLinha(CTP.dtSetLancTemp);
    CTP.ch._atualizaValorChequesSel(lbChequesSel);
  end;
end;

procedure TFrmCadContasAPagar.DBGrid4CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
  begin
    CTP.cr._marcaDesmarcaLinha(CTP.dtSetLancTemp);
    CTP.cr._atualizaValorCreditosSel(lbCreditosSel);
  end;
end;

procedure TFrmCadContasAPagar.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if CTP.cr.dataSet.FieldByName('sel').AsString = 'S' then
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
  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    DBGrid4.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(DBGrid4.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
  if not TDBGrid(sender).Enabled then
    TDBGrid(sender).Enabled := true;
end;

procedure TFrmCadContasAPagar.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
  begin
    CTP.cr._marcaDesmarcaLinha(CTP.dtSetLancTemp);
    CTP.cr._atualizaValorCreditosSel(lbCreditosSel);
  end;
end;

procedure TFrmCadContasAPagar.DBGrid4MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
  begin
    CTP.cr._marcaDesmarcaLinha(CTP.dtSetLancTemp);
    CTP.cr._atualizaValorCreditosSel(lbCreditosSel);
  end;
end;

procedure TFrmCadContasAPagar.DBGrid5DblClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    //    DBGrid5.Visible := False;
    CTP.UsarValorAAtingir := CheckBox2.Checked;

    //    if CTP._receberComControleSelecionado(False) then
    //      pnReceberEnter(pnReceber);
    CTP.ch.dataSet.FieldByName('cod_emp_mult').DisplayLabel := 'Cod Unificada';
    CTP.ch.dataSet.FieldByName('cod_emp_mult').Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    CTP._pagarComControleSelecionado(dsInsert);
  finally
    //    DBGrid5.Visible := True;
    Screen.Cursor := crDefault;
  end;

end;

procedure TFrmCadContasAPagar.DBGrid5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
  begin
    if Sender <> DBGrid5 then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBGrid5.CanFocus) then
      	DBGrid5.SetFocus;
    end
    else if (Self.Enabled) and (Self.Visible) and (DBGrid6.CanFocus) then
      DBGrid6.SetFocus;
  end
  else if Key = VK_F3 then
  begin
    if Sender = DBGrid6 then
      SpeedButton13.Click;
  end
  else if (Key = VK_DELETE) or (Key = vk_f4) then
  begin
    if Sender = DBGrid6 then
      SpeedButton14.Click;
  end
    //  else if (Key = VK_F5) and (SpeedButton10.Enabled) then
    //    SpeedButton10.Click
  else if Key = VK_F6 then
    CheckBox2.Checked := not CheckBox2.Checked
  else if Key = VK_F11 then
    BitBtn14.Click
  else if Key = VK_ESCAPE then
    BitBtn15.Click
  else if Key = VK_RETURN then
  begin
    if Sender = DBGrid5 then
      DBGrid5DblClick(DBGrid5)
    else if Sender = DBGrid6 then
      SpeedButton13.Click;
  end;
end;

procedure TFrmCadContasAPagar.DBGridContasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
		btContaOKClick(Sender);
end;

procedure TFrmCadContasAPagar.DBGridFornecedoresContaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  	btFornContaOKClick(Sender);
end;

procedure TFrmCadContasAPagar.DBGridMultiempresaCellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	CTP.vEmpresasUnificadas._marcaDesmarcaLinha;
end;

procedure TFrmCadContasAPagar.DBGridMultiempresaDrawColumnCell(Sender: TObject;
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
      TDBGrid(sender).canvas.brush.color := clHighlight;
      TDBGrid(sender).canvas.Font.color := clWhite;
    end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    DBGrid2.Canvas.FillRect(Rect);
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
  
procedure TFrmCadContasAPagar.DBGridMultiempresaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
	if Key = VK_TAB then
  	Perform(WM_NEXTDLGCTL, 0, 0)
	else if Key = VK_RETURN then
  	btnMultiempresaOKClick(Sender)  
	else if Key = VK_SPACE then
    CTP.vEmpresasUnificadas._marcaDesmarcaLinha;
end;

procedure TFrmCadContasAPagar.DBLookupComboBox1Exit(Sender: TObject);
var
  vMensagem: string;
begin
  inherited;
  if ((ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn23) or (ActiveControl = BitBtn25)) then
    Exit;

  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (ActiveControl <> BitBtn23) and (ActiveControl <> BitBtn25) and (not clicouNoX) then
  begin
    if CTP.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
    begin
      if not CTP._dadosNContaPlcValidos(trim(CTP.dataSet.FieldByName('HISTORICO_CTP').AsString) = '') then
      begin
        setFocusCampoErro(CTP.vNomeCampoErro);
      end;
    end
    else
    begin
      CTP.rCTP.vDescricaoGR := '';
      CTP.rCTP.vDescricaoDEP := '';
      CTP.rCTP.vTipoConta := '';
    end;
    Edit3.Text := CTP.rCTP.vDescricaoGR;
    Edit4.Text := CTP.rCTP.vDescricaoDEP;
    Edit5.Text := CTP.rCTP.vTipoConta;
  end;

  if CTP.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
  begin
    if not CTP.testarNumConta(CTP.dataSet.FieldByName('N_CONTA_PLC').AsFloat, vMensagem) then
    begin
      if not CTP.vpermitir then
        Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
      if vDadosIni.PesqPros('CTP032', 'PERMITIR', 'CONTA ' + CTP.dataSet.FieldByName('N_CONTA_PLC').AsString,
        'CONTAS_A_PAGAR', CTP.dataSet.FieldByName('cod_contrp').AsString, CTP.buscas, True) then
         CTP.vpermitir := true
      else
      begin
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
          DBLookupComboBox1.SetFocus;
        exit;
      end;
    end;
  end;
end;

procedure TFrmCadContasAPagar.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  CTP.rCTP.vHistoricoPadrao := CTP._selecionaHistoricoPadrao(DBLookupComboBox2.KeyValue);
  if CTP.rCTP.vHistoricoPadrao = '' then
  begin
    Edit1.Text := 'PAGAMENTO DE DESPESAS';
    CTP.rCTP.vHistoricoPadrao := 'PAGAMENTO DE DESPESAS';
  end
  else
    Edit1.Text := CTP.rCTP.vHistoricoPadrao;
end;

procedure TFrmCadContasAPagar.DBLookupComboBox3Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol <> BitBtn5) and (activecontrol <> BitBtn6) and (activecontrol <> BitBtn23) and (activecontrol <> BitBtn25) and (not clicouNoX) then
    if not CTP._validaControle then
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
      	DBLookupComboBox3.SetFocus;
      exit;
    end
    else
    begin
      if CTP.dtSetControles.FieldByName('CONTR_BANC').AsString = 'S' then
      begin
        //        SpeedButton14.Enabled := true;
        label17.visible := true;
        label18.visible := true;
        dbedit7.visible := true;
        dbedit11.visible := true;
      end
      else
      begin
        //        SpeedButton14.Enabled := false;
        label17.visible := false;
        label18.visible := false;
        dbedit7.visible := false;
        dbedit11.visible := false;
      end;
    end;
end;

procedure TFrmCadContasAPagar.DBLookupComboBox8Exit(Sender: TObject);
begin
  if (CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat <=0) then
  begin
    Application.MessageBox('Nº da Conta não informada.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox8.CanFocus) then
      DBLookupComboBox8.SetFocus;
    Exit;
  end;

  if not CTP.verificarConta('S', CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox8.CanFocus) then
      DBLookupComboBox8.SetFocus;
    Exit;
  end;

  if not (CTP.dtSetLancTemp.State in [dsInsert, dsEdit]) then
   exit;
   
  if (CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat <> CTP.rCTP.numContaTemp)
   and (CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat <> CTP.rCTP.vNumContaPadrao) then
  begin
      if (trim(CTP.dtSetLancTemp.FieldByName('HISTORICO_L').AsString) =
        trim(CTP.dtSetPContas.FieldByName('DESC_PLC').AsString)) then
         exit;

      if Application.MessageBox(pchar('Deseja atualizar o histórico do lançamento?'),
        'Atenção',  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) <> IDYES then
      begin
        CTP.rCTP.numContaTemp := CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat;
        exit;
      end;

      CTP.dtSetLancTemp.FieldByName('HISTORICO_L').AsString :=
      	trim(CTP.dtSetPContas.FieldByName('DESC_PLC').AsString);
  end
  else
  begin
    if (CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat = CTP.rCTP.numContaTemp) then
    	exit;
      
  	CTP.dtSetLancTemp.FieldByName('HISTORICO_L').AsString :=
      	trim(CTP.rCTP.vHistoricoPadrao);
  end;
        
  CTP.rCTP.numContaTemp := CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat;
end;

procedure TFrmCadContasAPagar.DBLookupComboBoxNumContaExit(Sender: TObject);
var
 vMensagem: string;
begin
  EditHwNumConta.AsValue := DBLookupComboBoxNumConta.KeyValue;
  if (DBLookupComboBoxNumConta.KeyValue <=0) then
  begin
    Application.MessageBox('Nº da Conta não informada.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if not CTP.verificarConta('S', DBLookupComboBoxNumConta.KeyValue) then
    Exit;

  if not CTP.testarNumConta2('S', DBLookupComboBoxNumConta.KeyValue, vMensagem) then
  begin
    Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
    CTP.vNumConta := 0;
    exit;
  end;
  CTP.vNumConta := DBLookupComboBoxNumConta.KeyValue;
end;

procedure TFrmCadContasAPagar.DBLookupComboBoxPContasExit(Sender: TObject);
var
 vMensagem: string;
begin
  if (CTP.dtSetLancTemp.State in [dsInsert, dsEdit]) then
    CTP.dtSetLancTemp.FieldByName('HISTORICO_L').AsString := trim(CTP.dtSetPContas.FieldByName('DESC_PLC').AsString);
    
  if (CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat <=0) then
  begin
    Application.MessageBox('Conta de entrada não informada.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBoxPContas.CanFocus) then
      DBLookupComboBoxPContas.SetFocus;
    Exit;
  end;

  if not CTP.verificarConta('E', CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBoxPContas.CanFocus) then
      DBLookupComboBoxPContas.SetFocus;
    Exit;
  end;

//  if not CTP.testarNumConta3('E', CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat, vMensagem) then
//  begin
//    Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
//    CTP.vNumConta := 0;
//    exit;
//  end;
  CTP.vNumConta := CTP.dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat;
end;

procedure TFrmCadContasAPagar.DesmarcardocumentocomoRecebendoLinhasselecionadas1Click(
  Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    CTP._desmarcarDocumentoComoPagando;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadContasAPagar.Edit1Exit(Sender: TObject);
begin
  inherited;
  if trim(Edit1.Text)<>'' then
   CTP.rCTP.vHistoricoPadrao:=Edit1.Text;
end;

procedure TFrmCadContasAPagar.Edit2Change(Sender: TObject);
begin
  inherited;
  CTP._localizarCheques(RadioGroup1.ItemIndex, Edit2.Text)
end;

procedure TFrmCadContasAPagar.Edit7Change(Sender: TObject);
begin
  inherited;
  CTP._localizarCreditos(RadioGroup2.ItemIndex, Edit7.Text)
end;

procedure TFrmCadContasAPagar.EditHw1Change(Sender: TObject);
begin
  inherited;
  CTP._localizarCheques(RadioGroup1.ItemIndex, EditHw1.Text);
end;

procedure TFrmCadContasAPagar.EditHw3Change(Sender: TObject);
begin
  inherited;
  CTP._localizarCreditos(RadioGroup1.ItemIndex, EditHw1.Text);
end;

procedure TFrmCadContasAPagar.EditHwNumContaExit(Sender: TObject);
var
  vMensagem: string;
begin
  DBLookupComboBoxNumConta.KeyValue := EditHwNumConta.AsValue;
  if (EditHwNumConta.AsValue <=0) then
  begin
    Application.MessageBox('Nº da Conta não informado.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if not CTP.verificarConta('S', EditHwNumConta.AsValue) then
    Exit;

  if not CTP.testarNumConta2('S', EditHwNumConta.AsValue, vMensagem) then
  begin
    Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
    CTP.vNumConta := 0;
    exit;
  end;
  CTP.vNumConta := EditHwNumConta.AsValue;
end;

procedure TFrmCadContasAPagar.edQtdeReplicarCadastroExit(Sender: TObject);
begin
  inherited;
  if edQtdeReplicarCadastro.AsInteger > 0 then
    if edDiaVencimentoReplicarCadastro.AsInteger = 0 then
      if Trim(DBEdit1.DataSource.DataSet.FieldByName(DBEdit1.DataField).AsString) <> '' then
      try
        edDiaVencimentoReplicarCadastro.AsValue :=
          DayOf(DBEdit1.DataSource.DataSet.FieldByName(DBEdit1.DataField).AsDateTime);
      except
      end;
end;

procedure TFrmCadContasAPagar.edVencimentoFaturaEntradaExit(Sender: TObject);
begin
  try
    StrToDate(edVencimentoFaturaEntrada.Text);
  except
    ShowMessage('Data Inválida !');
    if (Self.Enabled) and (Self.Visible) and (edVencimentoFaturaEntrada.CanFocus) then
    	edVencimentoFaturaEntrada.SetFocus;
  end;
end;

procedure TFrmCadContasAPagar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  gravaConfiguracoesFormRegistro;

//  _GravaConfiguracoesString(ComboBox11.Name, ComboBox11.Text);
//  _GravaConfiguracoesString(MaskEdit7.Name, MaskEdit7.Text);
  //  _GravaConfiguracoesString(MaskEdit8.Name, MaskEdit8.Text);
//  _GravaConfiguracoesString(ComboBox12.Name, ComboBox12.Text);

//  _GravaConfiguracoesBoolean(CheckBoxNQuitado.Name, CheckBoxNQuitado.Checked);
//  _GravaConfiguracoesBoolean(CheckBoxQuitado.Name, CheckBoxQuitado.Checked);
//  _GravaConfiguracoesBoolean(CheckBoxDespesa.Name, CheckBoxDespesa.Checked);
//  _GravaConfiguracoesBoolean(CheckBoxFornec.Name, CheckBoxFornec.Checked);


//  _GravaConfiguracoesBoolean(CheckBoxVerFormas.Name, CheckBoxVerFormas.Checked);

  {  _GravaConfiguracoesBoolean('V'+conta.Docs+MaskEdit1.Name, MaskEdit1.Visible);
    _GravaConfiguracoesBoolean('V'+conta.Docs+MaskEdit2.Name, MaskEdit2.Visible);
    _GravaConfiguracoesBoolean('V'+conta.Docs+MaskEdit3.Name, MaskEdit3.Visible);

    _GravaConfiguracoesString(conta.Docs+ComboBox11.Name, ComboBox11.Text);
    _GravaConfiguracoesString(conta.Docs+ComboBox12.Name, ComboBox12.Text);
    _GravaConfiguracoesString(conta.Docs+MaskEdit7.Name, MaskEdit7.Text);
    _GravaConfiguracoesString(conta.Docs+MaskEdit8.Name, MaskEdit8.Text);
    _GravaConfiguracoesString(conta.Docs+MaskEdit9.Name, MaskEdit9.Text);

    _GravaConfiguracoesBoolean('V'+conta.Docs+MaskEdit7.Name, MaskEdit7.Visible);
    _GravaConfiguracoesBoolean('V'+conta.Docs+MaskEdit8.Name, MaskEdit8.Visible);
    _GravaConfiguracoesBoolean('V'+conta.Docs+MaskEdit9.Name, MaskEdit9.Visible);
  }
  CTP.free;
  CTP := nil;

  Action := caFree;
  FrmCadContasAPagar := nil;
end;

procedure TFrmCadContasAPagar.FormCreate(Sender: TObject);
var
  i: integer;
begin
	vCriou := 0;
  inherited;
  CTP := TContasAPagar.Create;
  TelaCadastro := vDadosIni.vTipoForm;
  for I := 0 to PageControl3.PageCount - 1 do
    PageControl3.Pages[i].TabVisible := false;
  for I := 1 to pgOutros.PageCount - 1 do
    pgOutros.Pages[i].TabVisible := false;
  for I := 0 to pgPagando.PageCount - 1 do
    pgPagando.Pages[i].TabVisible := false;
  tsOutros.TabVisible := false;
  tsPagando.TabVisible := false;
  tsLancN_S2.TabVisible := false;
  tsFaturaDesp.TabVisible := false;
  tsMultiempresa.TabVisible := false;
  tsFornecedoresConta.TabVisible := false;
  tsConta.TabVisible := false;
  PageControl1.ActivePage := TabSheet2;
  
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadContasAPagar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (PageControl1.ActivePage = TabSheet2) then
  begin
    if (key = VK_INSERT) and (BitBtn3.Enabled) then
      BitBtn3.Click
    else if (Key = VK_F2) and (DBGrid1.CanFocus) then
      btSelectAll.Click
    else if (Key = VK_F4) and (DBGrid1.CanFocus) then
      btUnSelectAll.Click
    else if (Key = VK_F6) then
      CheckBoxNQuitado.Checked := not CheckBoxNQuitado.Checked
    else if (Key = VK_F7) then
      CheckBoxQuitado.Checked := not CheckBoxQuitado.Checked
        //    else if Key = VK_F9 then
//      CheckBox1Click(CheckBox1)
    else if (Key = VK_F11) then
      CheckBoxDespesa.Checked := not CheckBoxDespesa.Checked
    else if (Key = VK_F12) then
      CheckBoxFornec.Checked := not CheckBoxFornec.Checked
    else if (Key = VK_F8) then
    	CheckBoxVerFormas.Checked := not CheckBoxVerFormas.Checked;
  end;                                                           
end;

procedure TFrmCadContasAPagar.FormShow(Sender: TObject);
var
 I: Integer;
begin
	if not Self.Enabled then
    Exit;

  try
    CTP.dataSet.FieldByName('COD_EMP_MULT').Tag :=
      vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 0, 1);
    CTP.dataSet.FieldByName('IDENTIFICACAO_EMP').Tag :=
      vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 0, 1);

    for I := 0 to DBGrid2.FieldCount - 1 do
      if not vDadosIni.vEmp.vFinanceiroUnificado then
      begin
        if (DBGrid2.Columns[I].FieldName = 'COD_EMP_MULT') then
          DBGrid2.Columns[I].Visible := false;
      end
      else
      begin
       if (DBGrid2.Columns[I].FieldName = 'COD_EMP_MULT') then
          DBGrid2.Columns[I].Visible := true;
      end;

     for I := 0 to DBGrid4.FieldCount - 1 do
      if not vDadosIni.vEmp.vFinanceiroUnificado then
      begin
        if (DBGrid4.Columns[I].FieldName = 'COD_EMP_MULT') then
          DBGrid4.Columns[I].Visible := false;
      end
      else
      begin
       if (DBGrid4.Columns[I].FieldName = 'COD_EMP_MULT') then
          DBGrid4.Columns[I].Visible := true;
      end;

    DBGrid1.DataSource := dtmContasAPagar.dsContaAPagar;
    if vCriou = 0 then
    begin
      CTP.montaSelect(' select ' + CTP.Fsql_campos + ' from contas_a_pagar ' +
       CTP.Fsql_inner +
       CTP.Fsql_inner_pag +
       ' where contas_a_pagar.cod_contrp = 0 ' +
       ' and contas_a_pagar.codigo_emp = 0 ');
      setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
      inherited;
    end;
    //    ComboBox11.Text := trim(_LerConfiguracoesRegistroString(ComboBox11.Name));
//    if MaskEdit7.Visible then
//      MaskEdit7.Text := _LerConfiguracoesRegistroString(MaskEdit7.Name)
//    else
//    begin
//      MaskEdit8.Text := _LerConfiguracoesRegistroString(MaskEdit8.Name);
//      MaskEdit8.Text := _LerConfiguracoesRegistroString(MaskEdit9.Name);
//    end;
    //    ComboBox12.Text := trim(_LerConfiguracoesRegistroString(ComboBox12.Name));

    leConfiguracoesFormRegistro;

    vDadosIni.verificarCTP_Pendentes_Unificacao(CTP.buscas);

    if TelaCadastro = 1 then
    begin
      BitBtn3Click(Sender);
    end
    else if TelaCadastro = 2 then
    begin
    	vDadosIni.vTipoForm := 0;
    	TelaCadastro := vDadosIni.vTipoForm;
      ComboBox1.Text:=CTP.dataSet.FieldByName('DATA_VENC_CTP').DisplayName; //'Data Vencimento';
      ComboBox1Exit(sender);
      MaskEdit1.text:='01/01/1990';
      MaskEdit2.text:=FormatDateTime('DD/MM/YYYY', vDadosIni.getDataBanco(ctp.buscas));//datetostr(vDadosIni.getDataBanco(ctp.buscas));
      CheckBoxNQuitado.Checked:=true;
      CheckBoxQuitado.Checked:=False;
      BitBtn1Click(Sender);
    end;

    //    else
    //      CheckBox1.Checked := true;
    if vDadosIni.vMostrarChassiFin = 'S' then
    begin
      Label23.Visible:=true;
      DBEdit14.Visible:=true;
    end
    else
    begin
     Label23.Visible:=False;
     DBEdit14.Visible:=False;
    end;

    // Com os vampos de valor contabil este campo TIP_CNT se torna obsoleto
    Label15.Visible := False;
    DBComboBox2.Visible := False;
    DBLookupComboBox1.DropDownWidth := DBLookupComboBox1.Width + 150;
    DBLookupComboBox2.DropDownWidth := DBLookupComboBox2.Width + 150;

    if not vDadosIni.validarAcessoEmpresasUnificadas(CTP.buscas) then
    begin
      vDadosIni.fechaStatusProcessamento;
      FrmCadContasAPagar.fechar := True;
      PostMessage(FrmCadContasAPagar.Handle, WM_CLOSE, 0, 0);
      Exit;
    end;

    vTipoS := '';

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CXG141', 'HABILITAR', 'HAB CONTAS A PAGAR', 'P_CONTAS', '', CTP.buscas, true) then
    	vTipoS := vDadosIni.IfThen(trim(vTipoS) <> '', trim(vTipoS) + ',', '') + QuotedStr('D');

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CXG142', 'HABILITAR', 'HAB CONTAS A PAGAR', 'P_CONTAS', '', CTP.buscas, true) then
    	vTipoS := vDadosIni.IfThen(trim(vTipoS) <> '', trim(vTipoS) + ',', '') + QuotedStr('F');

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CXG143', 'HABILITAR', 'HAB CONTAS A PAGAR', 'P_CONTAS', '', CTP.buscas, true) then
    	vTipoS := vDadosIni.IfThen(trim(vTipoS) <> '', trim(vTipoS) + ',', '') + QuotedStr('I');

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CXG144', 'HABILITAR', 'HAB CONTAS A PAGAR', 'P_CONTAS', '', CTP.buscas, true) then
    	vTipoS := vDadosIni.IfThen(trim(vTipoS) <> '', trim(vTipoS) + ',', '') + QuotedStr('P');

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CXG145', 'HABILITAR', 'HAB CONTAS A PAGAR', 'P_CONTAS', '', CTP.buscas, true) then
    	vTipoS := vDadosIni.IfThen(trim(vTipoS) <> '', trim(vTipoS) + ',', '') + QuotedStr('O');

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CXG146', 'HABILITAR', 'HAB CONTAS A PAGAR', 'P_CONTAS', '', CTP.buscas, true) then
    	vTipoS := vDadosIni.IfThen(trim(vTipoS) <> '', trim(vTipoS) + ',', '') + QuotedStr('Z');

    if vCriou = 0 then
      vCriou := 1;

  finally
    vDadosIni.fechaStatusProcessamento;
    imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "CTP023" POPUP MENU DESMARCAR COMO RECEBENDO' + #13 +
    'Processo "CTP024" PERMITIR EDITAR CONTA JÁ QUITADA' + #13 +
    'Processo "CTP026" VISUALIZAR TODOS CHEQUES ABERTOS AO QUITAR CONTAS' + #13 +
    'Processo "CTP027" HABILITAR/VISUALIZAR CAMPOS REPLICACAO AO CADASTRAR CONTAS A PAGAR' + #13 +
    'Processo "CTP030" VISUALIZAR TODOS CHEQUES ABERTOS AO QUITAR CONTAS' + #13 +
    'Processo "CTP031" PERMITIR UTILIZAR CRÉDITOS COM VALOR MAIOR DO QUE O VALOR A INFORMAR' + #13 +
    'Processo "CTP033" HABILITAR CAMPO VALOR DA CONTAS A PAGAR NA CONTRAPARTIDA' + #13 +
    'Processo "CTP034" PERMITIR APAGAR CONTAS A PAGAR REFERENTE A NOTA FISCAL' + #13 +
    'Processo "CTP042" PERMITIR CADASTRAR/ALTERAR CONTAS A PAGAR APOS DRE GERADO' + #13 +
    'Processo "CXG141" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (SAÍDA) - DESPESA' + #13 +
    'Processo "CXG142" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (SAÍDA) - FORNECEDOR' + #13 +
    'Processo "CXG143" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (SAÍDA) - IMPOSTOS' + #13 +
    'Processo "CXG144" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (SAÍDA) - FOLHA DE PAGAMENTO' + #13 +
    'Processo "CXG145" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (SAÍDA) - OUTRAS SAIDAS' + #13 +
    'Processo "CXG146" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (SAÍDA) - CORRECAO DE SALDO';
  end;
end;


procedure TFrmCadContasAPagar.getFaturas;
var
  I: Integer;
  vItemIndex: Integer;
begin
  try
  	vItemIndex := ListBox3.ItemIndex;
    CTP.FContas.numeroDocumento[ListBox3.ItemIndex] := edDocFaturaEntrada.Text;
    CTP.FContas.vencimentoDocumento[ListBox3.ItemIndex] := edVencimentoFaturaEntrada.Text;
    CTP.FContas.valorDocumento[ListBox3.ItemIndex] := edValorFaturaEntrada.AsValue;
    ListBox3.Clear;
    for I := 0 to CTP.FContas.parcelas - 1 do
      ListBox3.Items.Add(trim(CTP.FContas.numeroDocumento[i]) + '   ' +
        trim(CTP.FContas.vencimentoDocumento[i]) + '    ' + 'R$ ' +
        trim(Format('%12.2n', [CTP.FContas.valorDocumento[i]])));
    ListBox1.Items.Text := ListBox3.Items.Text;

    cdsDesp.IndexFieldNames := 'NumConta';
    cdsDesp.First;
    while not cdsDesp.Eof do
    begin
    	if vItemIndex = cdsDesp.RecNo - 1 then
      begin
        cdsDesp.Edit;
        cdsDesp.FieldByName('NumDoc').AsString := CTP.FContas.numeroDocumento[vItemIndex];
        cdsDesp.FieldByName('DataVenc').AsString := CTP.FContas.vencimentoDocumento[vItemIndex];
        cdsDesp.FieldByName('Valor').AsFloat := CTP.FContas.valorDocumento[vItemIndex];
        cdsDesp.Post;
      end;

      cdsDesp.Next;
    end;
  except
  end;
end;

procedure TFrmCadContasAPagar.gravaConfiguracoesFormRegistro;
begin
	if (TelaCadastro <= 0) then
  begin
    _GravaConfiguracoesBoolean(CheckBoxNQuitado.Name, CheckBoxNQuitado.Checked);
    _GravaConfiguracoesBoolean(CheckBoxQuitado.Name, CheckBoxQuitado.Checked);
    _GravaConfiguracoesBoolean(CheckBoxDespesa.Name, CheckBoxDespesa.Checked);
    _GravaConfiguracoesBoolean(CheckBoxFornec.Name, CheckBoxFornec.Checked);
  end;

  if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
    _GravaConfiguracoesString(ComboBox11.Name, ComboBox11.Text);
    _GravaConfiguracoesString(ComboBox12.Name, ComboBox12.Text);

    _GravaConfiguracoesString(MaskEdit9.Name, MaskEdit9.Text);
    _GravaConfiguracoesString(MaskEdit8.Name, MaskEdit8.Text);
    _GravaConfiguracoesString(MaskEdit7.Name, MaskEdit7.Text);
  end;
end;

procedure TFrmCadContasAPagar.GroupBox1Enter(Sender: TObject);
begin
  inherited;
//  edQtdeReplicarCadastro.AsValue := 0;
//  edDiaVencimentoReplicarCadastro.AsValue := 0;
//  cbReferenciaMesCadastro.ItemIndex := 0;
//  ckbReplAlterarNumQdeParcelaCadastro.Checked := True;
//  ckbReplNaoAlterarNumQdeParcelaCadastro.Checked := False;

  SpeedButtonObsCtp.Visible := (DBEdit10.DataSource.DataSet.State = dsEdit) and (not vDadosIni.vContrapartida);
  if CTP.Recebendo then
  begin
  	GroupBox7.Visible := false;
    GroupBox10.Visible := true;
  end
  else if not vDadosIni.vContrapartida then
  begin
  	vDadosIni.vInibeMensPesqPros := 'S';
	  GroupBox7.Visible := (vDadosIni.PesqPros('CTP027', 'RECEBER', '', 'CONTAS_A_PAGAR', '', CTP.buscas, False));
    GroupBox10.Visible := false;
  end
  else
  begin
    GroupBox7.Visible := false;
    GroupBox10.Visible := true;
  end;
  
  if GroupBox7.Visible then
  begin
    GroupBox7.Enabled := (DBEdit10.DataSource.DataSet.State = dsInsert);
    edQtdeReplicarCadastro.Enabled := (DBEdit10.DataSource.DataSet.State = dsInsert);
    edDiaVencimentoReplicarCadastro.Enabled := (DBEdit10.DataSource.DataSet.State = dsInsert);
    cbReferenciaMesCadastro.Enabled := (DBEdit10.DataSource.DataSet.State = dsInsert);
    SpeedButton50.Enabled := (DBEdit10.DataSource.DataSet.State = dsInsert);

    ckbReplAlterarNumQdeParcelaCadastro.Enabled := (DBEdit10.DataSource.DataSet.State = dsInsert);
    ckbReplNaoAlterarNumQdeParcelaCadastro.Enabled := (DBEdit10.DataSource.DataSet.State = dsInsert);
  end;
end;

procedure TFrmCadContasAPagar.GroupBox7Exit(Sender: TObject);
begin
  inherited;
  if (edQtdeReplicarCadastro.AsInteger = 0) and (edDiaVencimentoReplicarCadastro.AsInteger = 0) then
    Exit;

  if edQtdeReplicarCadastro.AsInteger <= 0 then
  begin
    Application.MessageBox('Quantidade inválida, dever ser maior que zero', 'Atenção', 0 + 64);
    if (Self.Enabled) and (Self.Visible) and (edQtdeReplicarCadastro.CanFocus) then
	    edQtdeReplicarCadastro.SetFocus;
    Exit;
  end;

  if (edDiaVencimentoReplicarCadastro.AsInteger <= 0) or (edDiaVencimentoReplicarCadastro.AsInteger > 31) then
  begin
    Application.MessageBox('Dia de vencimento inválido, dever estar entre 1 e 31', 'Atenção', 0 + 64);
    if (Self.Enabled) and (Self.Visible) and (edDiaVencimentoReplicarCadastro.CanFocus) then
	    edDiaVencimentoReplicarCadastro.SetFocus;
    Exit;
  end;

  CTP.QtdeReplicacao := edQtdeReplicarCadastro.AsInteger;
  CTP.DiaReplicacao := edDiaVencimentoReplicarCadastro.AsInteger;
  CTP.ReferenciaMes := cbReferenciaMesCadastro.Text = 'SIM';
  CTP.ReplAltNumQtdeReplicacao := ckbReplAlterarNumQdeParcelaCadastro.Checked;
  CTP.ReplNaoAltNumQtdeReplicacao := ckbReplNaoAlterarNumQdeParcelaCadastro.Checked;
end;

procedure TFrmCadContasAPagar.habilitarDesabilitarReplicacaoConta(
  pHab: boolean);
var
	vDataVencimento: TDateTime;
  vDiaReplicacao: Integer;
begin
	if not pHab then
  begin
    DBLookupComboBox3.Visible := True;
    Label26.Visible := True;
    DBComboBox4.Visible := True;
    Label15.Visible := True;
    DBComboBox2.Visible := True;

    imgReplInformation.Visible := False;
    SpeedButton50.Caption := 'v';
    SpeedButton50.Tag := 0;
    GroupBox7.Height := 56;
    ckbReplAlterarNumQdeParcelaCadastro.Visible := False;
    ckbReplNaoAlterarNumQdeParcelaCadastro.Visible := False;
  end
  else
  begin
    DBLookupComboBox3.Visible := False;
    Label26.Visible := False;
    DBComboBox4.Visible := False;
    Label15.Visible := False;
    DBComboBox2.Visible := False;
    
    imgReplInformation.Visible := True;
    SpeedButton50.Caption := '^';
    SpeedButton50.Tag := 1;
    GroupBox7.Height := 130;
    ckbReplAlterarNumQdeParcelaCadastro.Visible := True;
    ckbReplNaoAlterarNumQdeParcelaCadastro.Visible := True;

    imgReplInformation.Hint := '';
    imgReplInformation.Hint := imgReplInformation.Hint +
    	'Replicar alterando o número e quantidade da parcela do documento atual informado (Exemplo 2 parcelas):' + #13;

    imgReplInformation.Hint := imgReplInformation.Hint +
    	'Documento atual:' + #13 +
      '   ' +
      ' Num Doc: ' + trim(vDadosIni.IfThen(trim(CTP.dataSet.FieldByName('N_DOC_CTP').AsString) = '', '12', CTP.dataSet.FieldByName('N_DOC_CTP').AsString)) + '-1' +
    	' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDadosIni.IfThen(CTP.dataSet.FieldByName('DATA_VENC_CTP').IsNull, Date, CTP.dataSet.FieldByName('DATA_VENC_CTP').AsDateTime)) +
      ' Valor: ' + formatfloat('0.00', vDadosIni.IfThen(CTP.dataSet.FieldByName('VALOR_CTP').AsFloat <= 0, 25, CTP.dataSet.FieldByName('VALOR_CTP').AsFloat)) +
      ' Num Parc: ' + IntToStr(1) +
      ' Qtde Parc: ' + IntToStr(3) + #13;

    vDataVencimento := vDadosIni.IfThen(CTP.dataSet.FieldByName('DATA_VENC_CTP').IsNull, Date, CTP.dataSet.FieldByName('DATA_VENC_CTP').AsDateTime);
    vDiaReplicacao  := Trunc(edQtdeReplicarCadastro.AsValue);

    imgReplInformation.Hint := imgReplInformation.Hint +
  		'Demais documentos:' + #13;

    vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
    if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), vDiaReplicacao) then
      vDataVencimento := StartOfTheMonth(vDataVencimento) + vDiaReplicacao - 1
    else
      vDataVencimento := EndOfTheMonth(vDataVencimento);

    imgReplInformation.Hint := imgReplInformation.Hint +
    	'   ' +
      ' Num Doc: ' + trim(vDadosIni.IfThen(trim(CTP.dataSet.FieldByName('N_DOC_CTP').AsString) = '', '12', CTP.dataSet.FieldByName('N_DOC_CTP').AsString)) + '-2' +
    	' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDataVencimento) +
      ' Valor: ' + formatfloat('0.00', vDadosIni.IfThen(CTP.dataSet.FieldByName('VALOR_CTP').AsFloat <= 0, 25, CTP.dataSet.FieldByName('VALOR_CTP').AsFloat)) +
      ' Num Parc: ' + IntToStr(2) +
      ' Qtde Parc: ' + IntToStr(3) + #13;

    vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
    if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), vDiaReplicacao) then
      vDataVencimento := StartOfTheMonth(vDataVencimento) + vDiaReplicacao - 1
    else
      vDataVencimento := EndOfTheMonth(vDataVencimento);

    imgReplInformation.Hint := imgReplInformation.Hint +
    	'   ' +
    	' Num Doc: ' + trim(vDadosIni.IfThen(trim(CTP.dataSet.FieldByName('N_DOC_CTP').AsString) = '', '12', CTP.dataSet.FieldByName('N_DOC_CTP').AsString)) + '-3' +
    	' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDataVencimento) +
      ' Valor: ' + formatfloat('0.00', vDadosIni.IfThen(CTP.dataSet.FieldByName('VALOR_CTP').AsFloat <= 0, 25, CTP.dataSet.FieldByName('VALOR_CTP').AsFloat)) +
      ' Num Parc: ' + IntToStr(3) +
      ' Qtde Parc: ' + IntToStr(3) + #13;

    imgReplInformation.Hint := imgReplInformation.Hint + #13;

    imgReplInformation.Hint := imgReplInformation.Hint +
    	'Replicar sem alterar o número e quantidade da parcela do documento atual informado (Exemplo 2 parcelas):' + #13;

    imgReplInformation.Hint := imgReplInformation.Hint +
    	'Documento atual:' + #13;

    imgReplInformation.Hint := imgReplInformation.Hint +
    	'   ' +
    	' Num Doc: ' + trim(vDadosIni.IfThen(trim(CTP.dataSet.FieldByName('N_DOC_CTP').AsString) = '', '12', CTP.dataSet.FieldByName('N_DOC_CTP').AsString)) +
      	'-' + IntToStr(vDadosIni.IfThen(CTP.dataSet.FieldByName('NPARCELA').AsInteger <= 0, 1, CTP.dataSet.FieldByName('NPARCELA').AsInteger)) +
    	' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDadosIni.IfThen(CTP.dataSet.FieldByName('DATA_VENC_CTP').IsNull, Date, CTP.dataSet.FieldByName('DATA_VENC_CTP').AsDateTime)) +
      ' Valor: ' + formatfloat('0.00', vDadosIni.IfThen(CTP.dataSet.FieldByName('VALOR_CTP').AsFloat <= 0, 25, CTP.dataSet.FieldByName('VALOR_CTP').AsFloat)) +
      ' Num Parc: ' + IntToStr(vDadosIni.IfThen(CTP.dataSet.FieldByName('NPARCELA').AsInteger <= 0, 1, CTP.dataSet.FieldByName('NPARCELA').AsInteger)) +
      ' Qtde Parc: ' + IntToStr(vDadosIni.IfThen(CTP.dataSet.FieldByName('QTDE_PARC').AsInteger <= 0, 1, CTP.dataSet.FieldByName('QTDE_PARC').AsInteger)) + #13;

    vDataVencimento := vDadosIni.IfThen(CTP.dataSet.FieldByName('DATA_VENC_CTP').IsNull, Date, CTP.dataSet.FieldByName('DATA_VENC_CTP').AsDateTime);

    imgReplInformation.Hint := imgReplInformation.Hint +
    	'Demais documentos:' + #13;
    
    vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
    if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), vDiaReplicacao) then
      vDataVencimento := StartOfTheMonth(vDataVencimento) + vDiaReplicacao - 1
    else
      vDataVencimento := EndOfTheMonth(vDataVencimento);

    imgReplInformation.Hint := imgReplInformation.Hint +
    	'   ' +
    	' Num Doc: ' + trim(vDadosIni.IfThen(trim(CTP.dataSet.FieldByName('N_DOC_CTP').AsString) = '', '12', CTP.dataSet.FieldByName('N_DOC_CTP').AsString)) +
      	'-1' +
    	' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDataVencimento) +
      ' Valor: ' + formatfloat('0.00', vDadosIni.IfThen(CTP.dataSet.FieldByName('VALOR_CTP').AsFloat <= 0, 25, CTP.dataSet.FieldByName('VALOR_CTP').AsFloat)) +
      ' Num Parc: ' + IntToStr(1) +
      ' Qtde Parc: ' + IntToStr(2) + #13;

    vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
    if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), vDiaReplicacao) then
      vDataVencimento := StartOfTheMonth(vDataVencimento) + vDiaReplicacao - 1
    else
      vDataVencimento := EndOfTheMonth(vDataVencimento);

    imgReplInformation.Hint := imgReplInformation.Hint +
	    '   ' +
  		' Num Doc: ' + trim(vDadosIni.IfThen(trim(CTP.dataSet.FieldByName('N_DOC_CTP').AsString) = '', '12', CTP.dataSet.FieldByName('N_DOC_CTP').AsString)) +
      	'-2' +
  		' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDataVencimento) +
      ' Valor: ' + formatfloat('0.00', vDadosIni.IfThen(CTP.dataSet.FieldByName('VALOR_CTP').AsFloat <= 0, 25, CTP.dataSet.FieldByName('VALOR_CTP').AsFloat)) +
      ' Num Parc: ' + IntToStr(2) +
      ' Qtde Parc: ' + IntToStr(2);
  end;
end;

procedure TFrmCadContasAPagar.imgReplInformationDblClick(Sender: TObject);
var
  formMemo: TForm;
begin
  try
    formMemo := TForm.Create(Application);
    formMemo.Position := poScreenCenter;
    formMemo.Caption := 'Informação';
    pnMemo.Parent := formMemo;
    formMemo.AutoSize := True;
    formMemo.AutoScroll := False;
    formMemo.KeyPreview := True;
    formMemo.BorderIcons:=[biSystemMenu];

    listGrid.Clear;
    listGrid.Items.Text := imgReplInformation.Hint;

    formMemo.ShowModal;

  finally
    pnMemo.Parent := tsMEmo;
    formMemo.Free;
    formMemo := nil;
  end;
end;

procedure TFrmCadContasAPagar.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (TelaCadastro <= 0) then
  begin
    CheckBoxNQuitado.Checked := _LerConfiguracoesRegistroBoolean(CheckBoxNQuitado.Name);
    CheckBoxQuitado.Checked := _LerConfiguracoesRegistroBoolean(CheckBoxQuitado.Name);
    CheckBoxDespesa.Checked := _LerConfiguracoesRegistroBoolean(CheckBoxDespesa.Name);
    CheckBoxFornec.Checked := _LerConfiguracoesRegistroBoolean(CheckBoxFornec.Name);
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
    	ComboBox12.Text     := _LerConfiguracoesRegistroString(ComboBox12.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name)) <> '' then
    	MaskEdit9.Text      := _LerConfiguracoesRegistroString(MaskEdit9.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name)) <> '' then
    	MaskEdit8.Text      := _LerConfiguracoesRegistroString(MaskEdit8.Name);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit7.Name)) <> '' then
    	MaskEdit7.Text      := _LerConfiguracoesRegistroString(MaskEdit7.Name);
  end;
end;

procedure TFrmCadContasAPagar.pnContaEnter(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (DBGridContas.CanFocus) then
    DBGridContas.SetFocus;
end;

procedure TFrmCadContasAPagar.pnDetalhesEnter(Sender: TObject);
begin
  inherited;
  Label64.Visible := Trim(CTP.dataSet.FieldByName('status_ctp').AsString) = '';
end;

procedure TFrmCadContasAPagar.pnFornecedoresContaEnter(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (DBGridFornecedoresConta.CanFocus) then
    DBGridFornecedoresConta.SetFocus;
end;

procedure TFrmCadContasAPagar.pnMultiempresaEnter(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (DBGridMultiempresa.CanFocus) then
  	DBGridMultiempresa.SetFocus;
end;

procedure TFrmCadContasAPagar.pnPagLancCTPEnter(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (DBEdit23.CanFocus) then
    DBEdit23.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
  	DBEdit2.SetFocus;
end;

procedure TFrmCadContasAPagar.QRDBText32Print(sender: TObject;
  var Value: string);
var
  Teste: string;
begin
  inherited;
  Teste := StringReplace(Value, '$', '', [rfReplaceAll]);
  Teste := StringReplace(Teste, 'R', '', [rfReplaceAll]);
  Teste := StringReplace(Teste, ThousandSeparator, '', [rfReplaceAll]);
  Teste := StringReplace(Teste, ' ', '', [rfReplaceAll]);
  if StrToFloatDef(Teste, 0) = 0 then
    Value := '';
end;

procedure TFrmCadContasAPagar.QRLabel71Print(sender: TObject;
  var Value: string);
var
  Teste: string;
begin
  inherited;
  Teste := StringReplace(Value, '$', '', [rfReplaceAll]);
  Teste := StringReplace(Teste, 'R', '', [rfReplaceAll]);
  Teste := StringReplace(Teste, ThousandSeparator, '', [rfReplaceAll]);
  Teste := StringReplace(Teste, ' ', '', [rfReplaceAll]);
  if StrToFloatDef(Teste, 0) = 0 then
    Value := '';
end;

procedure TFrmCadContasAPagar.qrpContasAPagar2Preview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório de Contas a Pagar');
end;

procedure TFrmCadContasAPagar.qrpContasAPagarPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório de Contas a Pagar');
end;

procedure TFrmCadContasAPagar.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  if RadioGroup1.ItemIndex = 0 then
  begin
    Label35.Caption := 'Informe o valor do cheque';
    EditHw1.Visible := true;
    Edit2.Visible := false;
  end
  else
  begin
    Label35.Caption := 'Texto procurado';
    EditHw1.Visible := false;
    Edit2.Visible := true;
    Edit2.Text := '';
  end;
end;

procedure TFrmCadContasAPagar.RadioGroup2Click(Sender: TObject);
begin
  inherited;
  if RadioGroup2.ItemIndex = 0 then
  begin
    Label50.Caption := 'Informe o valor do documento';
    EditHw3.Visible := true;
    Edit7.Visible := false;
  end
  else
  begin
    Label50.Caption := 'Texto procurado';
    EditHw3.Visible := false;
    Edit7.Visible := true;
    Edit7.Text := '';
  end;
end;

procedure TFrmCadContasAPagar.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  try
    vDadosIni.abreStatusProcessamento('', 'Filtrando créditos por período');
    CTP._localizarCreditos(true, MaskEdit12.Text, maskedit13.Text);
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadContasAPagar.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'A', CTP.buscas) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    CTP._replicarContasAPagar;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadContasAPagar.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'A', CTP.buscas) then
    Exit;
  CTP._atualizarValorPagoCTP;
end;

procedure TFrmCadContasAPagar.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    CTP._alterarLancamentoSelecionado;
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TFrmCadContasAPagar.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  if CTP._deletarLancTemp then
  begin
    FrmCadContasAPagar.lbDinheiro.Caption := Format('%0.2m', [CTP.rCTP.vSaldoDinheiro]);
    FrmCadContasAPagar.lbCreditos.Caption := Format('%0.2m', [CTP.rCTP.vSaldoCredito]);
    FrmCadContasAPagar.lbCheque.Caption := Format('%0.2m', [CTP.rCTP.vSaldoCheque]);
    FrmCadContasAPagar.lbAtingir.Caption := Format('%0.2m', [CTP.rCTP.vValorOperacao]);
    FrmCadContasAPagar.lbPrevisto.Visible := CTP.rCTP.vValorPrevisto > 0;
	  FrmCadContasAPagar.lbPrevistoDesc.Visible := CTP.rCTP.vValorPrevisto > 0;
    FrmCadContasAPagar.lbPrevisto.Caption := Format('%0.2m', [CTP.rCTP.vValorPrevisto]);
    FrmCadContasAPagar.lbInformar.Caption := Format('%0.2m', [CTP.rCTP.vValorAInformar]);
    FrmCadContasAPagar.lbAtingido.Caption := Format('%0.2m', [CTP.rCTP.vValorAtingido]);
  end;
end;

procedure TFrmCadContasAPagar.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  try
    vDadosIni.abreStatusProcessamento('', 'Filtrando cheques por período');
    CTP._localizarCheques(true, MaskEdit5.Text, maskedit6.Text);
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadContasAPagar.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  try
    vDadosIni.abreStatusProcessamento('', 'Retirando Filtro na pesquisa de cheques');
    CTP._localizarCheques(false, MaskEdit5.Text, maskedit6.Text);
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadContasAPagar.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  try
    vDadosIni.abreStatusProcessamento('', 'Filtrando créditos por período');
    CTP._localizarCreditos(false, MaskEdit12.Text, maskedit13.Text);
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadContasAPagar.SpeedButton18Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('ctp_%', CTP.buscas);
end;

procedure TFrmCadContasAPagar.SpeedButton19Click(Sender: TObject);
var
	AImagemDoc: THandle;
  AProcedure: Tcadastrosbasicos_abreFormImagemDoc;
begin
	if CTP.dataSet.IsEmpty then
  	exit;

  if not vDadosIni.PesqPros('CTP037', 'VISUALIZAR', '', 'CONTAS_A_PAGAR_IMAGENS',
  	'CTP ' + CTP.dataSet.FieldByName('COD_CONTRP').AsString, CTP.buscas, true) then
    Exit;

  CarregaPacote('pkCadastrosBasicos', AImagemDoc);

  if AImagemDoc = 0 then
  begin
    Application.MessageBox('Pacote Cadastros Básicos não carregado', 'Atenção', 0 + 64);
    Exit;
  end;

  @AProcedure := GetProcAddress(AImagemDoc, 'cadastrosbasicos_abreFormImagemDoc');
  AProcedure(
  	CTP.buscas,
  	CTP.dataSet.FieldByName('COD_CONTRP').AsInteger,
  	CTP.dataSet.FieldByName('CODIGO_EMP').AsInteger,
    'CTP'
  );
end;

procedure TFrmCadContasAPagar.SpeedButton1Click(Sender: TObject);
begin
	if CTP.dataSet.IsEmpty then
  	Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'A', CTP.buscas) then
    Exit;

  if not vDadosIni.PesqPros('CTP001', 'EDITAR', '', 'CONTAS_A_PAGAR',
  	CTP.dataSet.FieldByName('COD_CONTRP').AsString + '/' + CTP.dataSet.FieldByName('N_DOC_CTP').AsString,
    CTP.buscas, true) then
  		exit;

  CTP.Recebendo := False;
  if not CTP.Edit then
  	exit;

  inherited;
  DBEdit1.Enabled := True;
  DBEdit9.Enabled := (CTP.dataSet.FieldByName('COD_DESPESA').AsInteger <= 0);
  if trim(CTP.dataSet.FieldByName('Status_ctp').AsString) = 'QUITADO' then
    dbedit10.Enabled := false
  else
  begin
    if CTP.dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger > 0 then
    begin
       vDadosIni.vInibeMensPesqPros := 'S';
     dbedit10.Enabled := vDadosIni.PesqPros('CTP033', 'HABILITAR', '', 'CONTAS_A_PAGAR', '', CTP.buscas, False);
    end
    else
     dbedit10.Enabled := true;
  end;

  habilitarDesabilitarReplicacaoConta(False);
  edQtdeReplicarCadastro.AsValue := 0;
  edDiaVencimentoReplicarCadastro.AsValue := 0;
  cbReferenciaMesCadastro.ItemIndex := 0;
  if not cdsDesp.IsEmpty then
    cdsDesp.EmptyDataSet;
  if CTP.QtdeReplicacao > 0 then
  begin
    CTP.QtdeReplicacao := 0;
    CTP.DiaReplicacao := 0;
    CTP.ReferenciaMes := true;
    CTP.ReplAltNumQtdeReplicacao := true;
    CTP.ReplNaoAltNumQtdeReplicacao := false;
  end;

  DBEdit27.Enabled := False;
  DBEdit16.Enabled := False;
  Label42.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  DBEdit23.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  if (DBEdit23.Visible) and (vDadosIni.vContrapartida) and (vDadosIni.vEmp.vFinanceiroUnificado) then
    DBEdit23.Enabled := false;

  DBLookupComboBox4.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  if (DBLookupComboBox4.Visible) and (vDadosIni.vContrapartida) and (vDadosIni.vEmp.vFinanceiroUnificado) then
    DBLookupComboBox4.Enabled := false;

  DBEdit23.Enabled := False;
  DBLookupComboBox4.Enabled := False;
  PageControl1.ActivePage := TabSheet1;
  TabSheet1.Show;
  PageControl3.ActivePage := TabSheet3;
  ctp.vNumConta := ctp.dataSet.FieldByName('N_CONTA_PLC').AsFloat;
  ctp.vpermitir := false;
  Panel29.Visible := false;

  if CTP._dadosNContaPlcValidos(trim(CTP.dataSet.FieldByName('HISTORICO_CTP').AsString) = '') then
  begin
    Edit3.Text := CTP.rCTP.vDescricaoGR;
    Edit4.Text := CTP.rCTP.vDescricaoDEP;
    Edit5.Text := CTP.rCTP.vTipoConta;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBEdit23.CanFocus) then
    DBEdit23.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit2.CanFocus) then
    DBEdit2.SetFocus;
end;

procedure TFrmCadContasAPagar.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  /// modifcar a data da venda mediante a processo.
  if vDadosIni.PesqPros('CTP043', 'HABILITAR',CTP.dataset.FieldByName('N_DOC_CTP').AsString+' '+CTP.dataSet.FieldByName('NOME_FOR_CTP').AsString,
    'CONTAS_A_PAGAR', CTP.dataSet.FieldByName('COD_CONTRP').AsString+'/'+CTP.dataSet.FieldByName('N_DOC_CTP').AsString, CTP.buscas, true) then
  begin
    DBEdit27.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBEdit27.CanFocus) then
    	DBEdit27.SetFocus;
  end;
end;

procedure TFrmCadContasAPagar.SpeedButton21Click(Sender: TObject);
begin
  inherited;

	if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'A', CTP.buscas) then
    Exit;

  if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'I', CTP.buscas) then
    Exit;

  if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', CTP.buscas) then
    Exit;

  if not vDadosIni.testarContasLigacao(CTP.buscas, 'CTP') then
  	Exit;

  // Financeiro sendo fechado
	if vDadosIni.financeiroFechando(CTP.buscas) then
		Exit;

  habilitarDesabilitarReplicacaoConta(False);

  try
  	CTP.Recebendo := True;
    CTP.baixaParcial := True;
    CTP._efetuarPagamentoCTP;
  finally
    CTP.Recebendo := False;
  end;
end;

procedure TFrmCadContasAPagar.SpeedButton22Click(Sender: TObject);
begin
  inherited;
	/// modifcar a data da venda mediante a processo.
  if vDadosIni.PesqPros('CTP044', 'HABILITAR',CTP.dataset.FieldByName('N_DOC_CTP').AsString+' '+CTP.dataSet.FieldByName('NOME_FOR_CTP').AsString,
    'CONTAS_A_PAGAR', CTP.dataSet.FieldByName('COD_CONTRP').AsString+'/'+CTP.dataSet.FieldByName('N_DOC_CTP').AsString, CTP.buscas, true) then
  begin
    DBEdit16.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
    	DBEdit16.SetFocus;
  end;
end;

procedure TFrmCadContasAPagar.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'A', CTP.buscas) then
    Exit;
  CTP._aceitarContaCTP;
end;

procedure TFrmCadContasAPagar.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'A', CTP.buscas) then
    Exit;
  CTP._marcarParaCancelarCTP;
end;

procedure TFrmCadContasAPagar.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'A', CTP.buscas) then
    Exit;
  try
    Screen.Cursor := crHourGlass;

    if not CTP.dataSet.IsEmpty then
      CTP._informarObservacoes;// _informarObservacaoParaCxl;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadContasAPagar.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'E', CTP.buscas) then
    Exit;
    
  CTP._excluirCTP;
end;

procedure TFrmCadContasAPagar.SpeedButton3Click(Sender: TObject);
var
  List: TStringList;
  Display: string;
  I, IndexCombo, IndexDtVenc: Integer;
  Field: TField;
  ACodigos: array of Integer;
  ACodEmpMult: array of Integer;
  vCodEmpMult: Integer;
  ARelatorioCopia: TRelatorioInformacaoCTP;
  AFormato: string;
  AIndexFieldNames: string;
begin
  inherited;
  AFormato := _LerConfiguracoesRegistroString('FormatoImpressao');
  rbFormatoCopiaConsultaPrevia.Checked := AFormato = 'Copia Consulta Previa';
  rbFormatoCopiaPorData.Checked := AFormato = 'Copia Consulta Periodo';
  rbFormatoPadrao.Checked := ((not rbFormatoCopiaConsultaPrevia.Checked) and (not rbFormatoCopiaPorData.Checked));
  CheckBox4.Checked := _LerConfiguracoesRegistroBoolean(CheckBox4.Name);
  CheckBox5.Checked := _LerConfiguracoesRegistroBoolean(CheckBox5.Name);
  CheckBox6.Checked := _LerConfiguracoesRegistroBoolean(CheckBox6.Name);
  CheckBox8.Checked := _LerConfiguracoesRegistroBoolean(CheckBox8.Name);
  ckRelQuitadas.Checked := _LerConfiguracoesRegistroBoolean(ckRelQuitadas.Name);
  ckRelAbertas.Checked := _LerConfiguracoesRegistroBoolean(ckRelAbertas.Name);
  ComboBox5.ItemIndex := _LerConfiguracoesRegistroInteger(ComboBox5.Name);
  MaskEdit10.Text := DateToStr( StrToDateDef(_LerConfiguracoesRegistroString(MaskEdit10.Name), Date));
  MaskEdit11.Text := DateToStr( StrToDateDef(_LerConfiguracoesRegistroString(MaskEdit11.Name), Date));
  CheckBox9.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  CheckBox10.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  CheckBox11.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  if vDadosIni.vEmp.vFinanceiroUnificado then
  begin
	  CheckBox9.Checked := _LerConfiguracoesRegistroBoolean(CheckBox9.Name);
	  CheckBox10.Checked := _LerConfiguracoesRegistroBoolean(CheckBox10.Name);
  	CheckBox11.Checked := _LerConfiguracoesRegistroBoolean(CheckBox11.Name);
  end;
  Panel26.Height := vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 50, 32);

  if not vDadosIni.vEmp.vFinanceiroUnificado then
  begin
  	QRLabel32.Left := -720;
    QRDBText17.Left := -720;
  end;
  QRLabel32.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  QRDBText17.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  if QRLabel32.Visible then
		QRLabel32.Visible := not CheckBox9.Checked;
  if QRDBText17.Visible then
  	QRDBText17.Visible := not CheckBox9.Checked;

//  MaskEdit10.Text := FormatDateTime('DD/MM/YYYY', StrToDateDef(MaskEdit10.Text, Date));
//  MaskEdit11.Text := FormatDateTime('DD/MM/YYYY', StrToDateDef(MaskEdit11.Text, Date));

  Display := regGetConfStr(ComboBox4.Name);
  List := TStringList.Create;
  List.Sorted := True;
  List.Duplicates := dupIgnore;
  List.Clear;
  List.Add(CTP.dataSet.FieldByName('DATA_VENC_CTP').DisplayLabel);
  for I := 0 to CTP.dataSet.Fields.Count - 1 do
    if CTP.dataSet.Fields[i].Visible then
      List.Add(Trim(CTP.dataSet.Fields[i].DisplayLabel));
  ComboBox4.Items.Text := List.Text;

  if TStringList(ComboBox4.Items).IndexOf(Display) > -1 then
    ComboBox4.ItemIndex := TStringList(ComboBox4.Items).IndexOf(Display)
  else if TStringList(ComboBox4.Items).IndexOf(CTP.dataSet.FieldByName('DATA_VENC_CTP').DisplayLabel) > -1 then
    ComboBox4.ItemIndex := TStringList(ComboBox4.Items).IndexOf(CTP.dataSet.FieldByName('DATA_VENC_CTP').DisplayLabel);

  if not vDadosIni.abreForm('Opções de Impressão', pnOpcoesImp, [ofAlignAllClientWinCtrl, ofEscapeExit, ofBIMinimizeOff, ofBIMaximizeOff]) then
    Exit;
  regSetConfStr(ComboBox4.Name, ComboBox4.Text);
  QRGroup1.Height := 0;
//  QRGroup2.Height := 0;
  qrBandSubtotal.Height := 35;
  qrBandSubtotal2.Height := 35;

  if rbFormatoPadrao.Checked then
  begin
    CTP._RelContasAPagar(ComboBox4.Text,
    	CheckBox4.Checked,
      ((CheckBox9.Visible) and (CheckBox9.Checked)));
  end
  else if rbFormatoCopiaConsultaPrevia.Checked then
  begin
    try
    	AIndexFieldNames := CTP.dataSet.IndexFieldNames;
      CTP.dataSet.DisableControls;
      if ((CheckBox10.Visible) and (CheckBox10.Checked)) then
	      CTP.dataSet.IndexFieldNames := 'COD_EMP_MULT';
      if CheckBox5.Checked then
      begin
        CTP.dataSet.Filter := 'SEL = ''S''';
        CTP.dataSet.Filtered := True;
      end;
      CTP.dataSet.Last;
      SetLength(ACodigos, CTP.dataSet.RecordCount);
      SetLength(ACodEmpMult, CTP.dataSet.RecordCount);

      vCodEmpMult := 0;
      CTP.dataSet.First;
      while not CTP.dataSet.Eof do
      begin
      	if ((CheckBox10.Visible) and (CheckBox10.Checked)) then
        begin
          if (vCodEmpMult <= 0) then
            ACodEmpMult[CTP.dataSet.RecNo - 1] := CTP.dataSet.FieldByName('COD_EMP_MULT').AsInteger
          else if (vCodEmpMult <> CTP.dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
            ACodEmpMult[CTP.dataSet.RecNo - 1] := CTP.dataSet.FieldByName('COD_EMP_MULT').AsInteger
          else
            ACodEmpMult[CTP.dataSet.RecNo - 1] := 0;
        end
        else
        	ACodEmpMult[CTP.dataSet.RecNo - 1] := CTP.dataSet.FieldByName('COD_EMP_MULT').AsInteger;

        ACodigos[CTP.dataSet.RecNo - 1] := CTP.dataSet.FieldByName('COD_CONTRP').AsInteger;

        vCodEmpMult := CTP.dataSet.FieldByName('COD_EMP_MULT').AsInteger;
        CTP.dataSet.Next;
      end;
    finally
      CTP.dataSet.Filtered := False;
      CTP.dataSet.Filter := '';
      if ((CheckBox10.Visible) and (CheckBox10.Checked)) then
	      CTP.dataSet.IndexFieldNames := AIndexFieldNames;
      CTP.dataSet.EnableControls;
    end;
    ARelatorioCopia := TRelatorioInformacaoCTP.create(CTP.buscas, 'Relatório de cópia de contas a pagar');
    try
      ARelatorioCopia.EmitirRelatorioPor_ContasSelecionadas(
      	ACodigos,
        ACodEmpMult,
      	CheckBox6.Checked,
        ((CheckBox10.Visible) and (CheckBox10.Checked)));
    finally
      FreeAndNil(ARelatorioCopia);
    end;
  end
  else if rbFormatoCopiaPorData.Checked then
  begin 
    ARelatorioCopia := TRelatorioInformacaoCTP.create(CTP.buscas, 'Relatório de cópia de contas a pagar');
    try
      ARelatorioCopia.EmitirRelatorioPor_Periodo(ComboBox5.Text,
        StrToDateDef(MaskEdit10.Text, Date),
        StrToDateDef(MaskEdit11.Text, Date),
        CheckBox8.Checked,
        ckRelQuitadas.Checked,
        ckRelAbertas.Checked,
        ((CheckBox11.Visible) and (CheckBox11.Checked)));
    finally
      FreeAndNil(ARelatorioCopia);
    end;

  end;
  if rbFormatoPadrao.Checked then
    AFormato := 'Padrao'
  else if rbFormatoCopiaConsultaPrevia.Checked then
    AFormato := 'Copia Consulta Previa'
  else if rbFormatoCopiaPorData.Checked then
    AFormato := 'Copia Consulta Periodo';
  _GravaConfiguracoesString('FormatoImpressao', AFormato);
  _GravaConfiguracoesBoolean(CheckBox4.Name, CheckBox4.Checked);
  _GravaConfiguracoesBoolean(CheckBox5.Name, CheckBox5.Checked);
  _GravaConfiguracoesBoolean(CheckBox6.Name, CheckBox6.Checked);
  _GravaConfiguracoesBoolean(CheckBox8.Name, CheckBox8.Checked);
  if (vDadosIni.vEmp.vFinanceiroUnificado) and (CheckBox9.Enabled) and (CheckBox9.Visible) then
		_GravaConfiguracoesBoolean(CheckBox9.Name, CheckBox9.Checked);
  if (vDadosIni.vEmp.vFinanceiroUnificado) and (CheckBox10.Enabled) and (CheckBox10.Visible) then
	  _GravaConfiguracoesBoolean(CheckBox10.Name, CheckBox10.Checked);
  if (vDadosIni.vEmp.vFinanceiroUnificado) and (CheckBox11.Enabled) and (CheckBox11.Visible) then
	  _GravaConfiguracoesBoolean(CheckBox11.Name, CheckBox11.Checked);
  _GravaConfiguracoesBoolean(ckRelQuitadas.Name, ckRelQuitadas.Checked);
  _GravaConfiguracoesBoolean(ckRelAbertas.Name, ckRelAbertas.Checked);
  _GravaConfiguracoesInteger(ComboBox5.Name, ComboBox5.ItemIndex);
  _GravaConfiguracoesString(MaskEdit10.Name, MaskEdit10.Text);
  _GravaConfiguracoesString(MaskEdit11.Name, MaskEdit11.Text);
end;

procedure TFrmCadContasAPagar.SpeedButton50Click(Sender: TObject);
begin
  inherited;
	if SpeedButton50.Tag = 1 then
  	habilitarDesabilitarReplicacaoConta(False)
  else if SpeedButton17.Tag = 0 then
    habilitarDesabilitarReplicacaoConta(True);
end;

procedure TFrmCadContasAPagar.SpeedButton59Click(Sender: TObject);
begin
  inherited;
	CTP.dtSetLancTemp.FieldByName('DATA_VENC_CHEQ_L').Value := Null;
end;

procedure TFrmCadContasAPagar.SpeedButton6Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'A', CTP.buscas) then
    Exit;

  if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'I', CTP.buscas) then
    Exit;

  if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', CTP.buscas) then
    Exit;

  if not vDadosIni.testarContasLigacao(CTP.buscas, 'CTP') then
  	Exit;

  // Financeiro sendo fechado
	if vDadosIni.financeiroFechando(CTP.buscas) then
		Exit;

  if not CTP._verificarMarcacaoLinha then
  	Exit;  

  habilitarDesabilitarReplicacaoConta(False);

  try
  	CTP.Recebendo := True;
    CTP.baixaParcial := False;
    CTP._efetuarPagamentoCTP;
  finally
    CTP.Recebendo := False;
  end;
end;

procedure TFrmCadContasAPagar.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  CTP._abreFormDetalhesLoteCTP;
end;

procedure TFrmCadContasAPagar.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  CTP._exibriSomatorio(DBGrid1);
end;

procedure TFrmCadContasAPagar.SpeedButton9Click(Sender: TObject);
var
  FieldName: string;
  Field: TField;
  I: Integer;
begin
  inherited;
  if ComboBox4.Text = CTP.dataSet.FieldByName('DATA_VENC_CTP').DisplayLabel then
  begin
    if CTP.dataSet.IndexName <> '' then
    begin
      FieldName := CTP.dataSet.IndexName;
      for I := 0 to CTP.dataSet.IndexDefs.Count - 1 do
        if CTP.dataSet.IndexDefs.Items[i].Name = FieldName then
          FieldName := CTP.dataSet.IndexDefs.Items[i].FieldExpression;
      if Pos(';', FieldName) > 0 then
        FieldName := Copy(FieldName, 1, Pos(';', FieldName) - 1);
      Field := CTP.dataSet.FindField(FieldName);
      if Field <> nil then
        if TStringList(ComboBox4.Items).IndexOf(Field.DisplayLabel) > -1 then
          ComboBox4.ItemIndex := TStringList(ComboBox4.Items).IndexOf(Field.DisplayLabel);
    end;
  end
  else
    if TStringList(ComboBox4.Items).IndexOf(CTP.dataSet.FieldByName('DATA_VENC_CTP').DisplayLabel) > -1 then
      ComboBox4.ItemIndex := TStringList(ComboBox4.Items).IndexOf(CTP.dataSet.FieldByName('DATA_VENC_CTP').DisplayLabel);
end;

procedure TFrmCadContasAPagar.SpeedButtonMultiempresaDesmClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    CTP.vEmpresasUnificadas._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadContasAPagar.SpeedButtonMultiempresaSelClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    CTP.vEmpresasUnificadas._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

initialization
  RegisterClass(TFrmCadContasAPagar);
finalization
  UnRegisterClass(TFrmCadContasAPagar);


end.

