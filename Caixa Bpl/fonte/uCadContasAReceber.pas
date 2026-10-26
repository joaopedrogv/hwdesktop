unit uCadContasAReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadPadraoModal, AppEvnts, ExtCtrls, Menus, ComCtrls, StdCtrls,
  Buttons, Grids, DBGrids, Mask, DBCtrls, QRCtrls, QuickRpt, uEditHw, ImgList,
  uEditMoeda, DB, Spin, DBClient;

type
  TfrmCadContasAReceber = class(TfrmCadPadraoM)
    ckbNaoQuitado: TCheckBox;
    ckbQuitado: TCheckBox;
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
    tsRelatorio: TTabSheet;
    tsHistorico: TTabSheet;
    pnHistorico: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    BitBtn7: TBitBtn;
    DBGrid2: TDBGrid;
    tsMudaControleOuVoltaParaAtivo: TTabSheet;
    pnMudaControleOuVoltaParaAtivo: TPanel;
    Panel9: TPanel;
    pnCaptionOperacao: TPanel;
    Panel11: TPanel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Label27: TLabel;
    Label28: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    tsComissao: TTabSheet;
    pnComissao: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    GroupBox4: TGroupBox;
    Label32: TLabel;
    DBEdit28: TDBEdit;
    Label33: TLabel;
    DBEdit29: TDBEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    Panel15: TPanel;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    btDataRealBaixa: TSpeedButton;
    SpeedButton41: TSpeedButton;
    SpeedButton42: TSpeedButton;
    tsCadastroCredito: TTabSheet;
    ScrollBox4: TScrollBox;
    grupoCredito: TGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    DBEdit24: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Panel16: TPanel;
    Label53: TLabel;
    Label54: TLabel;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit34: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    DBComboBox3: TDBComboBox;
    DBEdit45: TDBEdit;
    DBComboBox4: TDBComboBox;
    tsCadastroCheque: TTabSheet;
    ScrollBox5: TScrollBox;
    grupoCheque: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    spbContasBancarias: TSpeedButton;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel4: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit2: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    DBComboBox1: TDBComboBox;
    DBEdit20: TDBEdit;
    DBComboBox2: TDBComboBox;
    DBEdit21: TDBEdit;
    BitBtn12: TBitBtn;
    rbCheque: TRadioButton;
    rbCredito: TRadioButton;
    Bevel1: TBevel;
    tsAvancado: TTabSheet;
    SpeedButton29: TSpeedButton;
    Label37: TLabel;
    DBEdit31: TDBEdit;
    Label38: TLabel;
    DBEdit32: TDBEdit;
    tsContasBancarias: TTabSheet;
    pnCadastroContasBancarias: TPanel;
    Panel17: TPanel;
    DBLookupComboBox6: TDBLookupComboBox;
    Label39: TLabel;
    DBEdit33: TDBEdit;
    Label67: TLabel;
    DBEdit47: TDBEdit;
    Label68: TLabel;
    DBEdit48: TDBEdit;
    Label69: TLabel;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    Panel21: TPanel;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    pnConsultaContasBancarias: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    DBGrid3: TDBGrid;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton34: TSpeedButton;
    SpeedButton9: TSpeedButton;
    relCR: TQuickRep;
    QRBand7: TQRBand;
    QRLabel29: TQRLabel;
    QRLabel35: TQRLabel;
    QRSysData5: TQRSysData;
    QRLabel36: TQRLabel;
    QRSysData6: TQRSysData;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel68: TQRLabel;
    QRBand8: TQRBand;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRBand9: TQRBand;
    QRShape9: TQRShape;
    QRLabel46: TQRLabel;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    qrlNome_Emp: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    pnNegativar: TPanel;
    Panel25: TPanel;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    RadioGroup1: TRadioGroup;
    ckbImpFicha: TCheckBox;
    rbValorParcela: TRadioButton;
    rbValorVenda: TRadioButton;
    ckbEmLote: TCheckBox;
    ckbCodigoMV: TCheckBox;
    edhistorico: TEdit;
    tsDetalhes: TTabSheet;
    pnDetalhes: TPanel;
    Panel10: TPanel;
    Panel22: TPanel;
    Panel26: TPanel;
    Label41: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBGrid4: TDBGrid;
    SpeedButton44: TSpeedButton;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    Label72: TLabel;
    SpeedButton45: TSpeedButton;
    Label73: TLabel;
    DBText8: TDBText;
    tsDataRealBaixa: TTabSheet;
    pnDataRealBaixa: TPanel;
    Panel27: TPanel;
    Label75: TLabel;
    Panel28: TPanel;
    Panel29: TPanel;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    edDataRealBaixa: TMaskEdit;
    tsGlobal: TTabSheet;
    pgGlobal: TPageControl;
    tsReplicacao: TTabSheet;
    pnReplicar: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Label74: TLabel;
    Label76: TLabel;
    edQtdeRepl: TEditHw;
    edDiaVencReplicar: TEditHw;
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
    tsReceber: TTabSheet;
    GroupBox5: TGroupBox;
    Label60: TLabel;
    edQtdeReplicarCadastro: TEditHw;
    Label61: TLabel;
    edDiaVencimentoReplicarCadastro: TEditHw;
    PageControl2: TPageControl;
    tsReceberIni: TTabSheet;
    pnReceber: TPanel;
    Panel38: TPanel;
    Label65: TLabel;
    Label66: TLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    Edit1: TEdit;
    Panel37: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    lbDinheiro: TLabel;
    lbCheque: TLabel;
    lbCreditos: TLabel;
    lbValeCompras: TLabel;
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
    tsRecLanc: TTabSheet;
    tsRecCheque: TTabSheet;
    tsRecCredito: TTabSheet;
    pnRecLanc: TPanel;
    Panel41: TPanel;
    BitBtn16: TBitBtn;
    BitBtn29: TBitBtn;
    pnRecCheque: TPanel;
    Panel42: TPanel;
    BitBtn30: TBitBtn;
    BitBtn31: TBitBtn;
    pnRecCredito: TPanel;
    Panel44: TPanel;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    tsRecRecibo: TTabSheet;
    tsDesconto: TTabSheet;
    pnDesconto: TPanel;
    Label59: TLabel;
    Label62: TLabel;
    pnValorDaOperacao: TPanel;
    Panel45: TPanel;
    BitBtn36: TBitBtn;
    BitBtn37: TBitBtn;
    edDescPerc: TEditHw;
    edDescValor: TEditHw;
    Panel18: TPanel;
    Panel19: TPanel;
    SpeedButton10: TSpeedButton;
    Panel20: TPanel;
    DBGrid5: TDBGrid;
    Panel33: TPanel;
    Panel34: TPanel;
    DBGrid6: TDBGrid;
    Panel35: TPanel;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    Splitter3: TSplitter;
    GroupBox6: TGroupBox;
    Label63: TLabel;
    Edit2: TEdit;
    GroupBox7: TGroupBox;
    Label64: TLabel;
    Edit3: TEdit;
    GroupBox8: TGroupBox;
    scrollDinheiro: TScrollBox;
    Label82: TLabel;
    DBEdit22: TDBEdit;
    DBLookupComboBox8: TDBLookupComboBox;
    Panel40: TPanel;
    Label84: TLabel;
    Label86: TLabel;
    DBEdit23: TDBEdit;
    DBEdit35: TDBEdit;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBComboBox5: TDBComboBox;
    DBLookupComboBox9: TDBLookupComboBox;
    DBComboBox6: TDBComboBox;
    pnRecibos: TPanel;
    Panel43: TPanel;
    Label96: TLabel;
    DBGrid7: TDBGrid;
    Label97: TLabel;
    Label98: TLabel;
    Panel46: TPanel;
    BitBtn34: TBitBtn;
    pnReciboValor: TPanel;
    Panel48: TPanel;
    BitBtn38: TBitBtn;
    BitBtn39: TBitBtn;
    Panel49: TPanel;
    Panel47: TPanel;
    edValorDeBaixa: TEditHw;
    Label99: TLabel;
    Label100: TLabel;
    Edit4: TEdit;
    Label101: TLabel;
    Panel50: TPanel;
    CheckBox2: TCheckBox;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton20: TSpeedButton;
    pnDiferenca: TPanel;
    Panel52: TPanel;
    BitBtn35: TBitBtn;
    BitBtn40: TBitBtn;
    Panel53: TPanel;
    Panel54: TPanel;
    Label102: TLabel;
    DBLookupComboBox10: TDBLookupComboBox;
    Label103: TLabel;
    edHistoricoDiferenca: TEdit;
    Label104: TLabel;
    DBLookupComboBox11: TDBLookupComboBox;
    pnDadosBaixa: TPanel;
    Panel55: TPanel;
    CheckBox5: TCheckBox;
    Label106: TLabel;
    Edit5: TEdit;
    pnValorBaixa: TPanel;
    Panel51: TPanel;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    Label107: TLabel;
    edValorBaixaParcial: TEditHw;
    Panel56: TPanel;
    Label108: TLabel;
    MaskEdit4: TMaskEdit;
    Panel57: TPanel;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    tsLoteQuit: TTabSheet;
    pnLoteQuit: TPanel;
    Panel58: TPanel;
    Panel59: TPanel;
    Panel60: TPanel;
    DBGrid8: TDBGrid;
    BitBtn13: TBitBtn;
    BitBtn43: TBitBtn;
    BitBtn44: TBitBtn;
    pnUsarValorCorrigido: TPanel;
    CheckBox4: TCheckBox;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    Bevel2: TBevel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    DesmarcardocumentocomoRecebendo1: TMenuItem;
    SpeedButton21: TSpeedButton;
    CheckBox8: TCheckBox;
    tsObs: TTabSheet;
    pnObs: TPanel;
    GroupBox9: TGroupBox;
    BitBtn47: TBitBtn;
    DBMemo1: TDBMemo;
    BitBtn49: TBitBtn;
    BitBtn48: TBitBtn;
    BitBtn45: TBitBtn;
    GroupBox10: TGroupBox;
    DBEdit58: TDBEdit;
    BitBtn46: TBitBtn;
    DBGrid9: TDBGrid;
    Edit6: TEdit;
    CheckBox9: TCheckBox;
    ckTranspComissao: TCheckBox;
    SpeedButton37: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton35: TSpeedButton;
    tsCartao: TTabSheet;
    PageControl4: TPageControl;
    tsNSU: TTabSheet;
    tsPendencias: TTabSheet;
    pnNSU: TPanel;
    pnimpnimpn: TPanel;
    Panel62: TPanel;
    GroupBox11: TGroupBox;
    BitBtn50: TBitBtn;
    BitBtn51: TBitBtn;
    pnPendenciasCartao: TPanel;
    Panel64: TPanel;
    Panel65: TPanel;
    BitBtn52: TBitBtn;
    BitBtn53: TBitBtn;
    GroupBox12: TGroupBox;
    DBGrid10: TDBGrid;
    Panel63: TPanel;
    Label115: TLabel;
    Label116: TLabel;
    DBEdit62: TDBEdit;
    DBEdit63: TDBEdit;
    Label118: TLabel;
    Edit7: TEdit;
    Label119: TLabel;
    Edit8: TEdit;
    Label120: TLabel;
    Label121: TLabel;
    Edit10: TEdit;
    Label122: TLabel;
    Label123: TLabel;
    Edit12: TEdit;
    Label124: TLabel;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    Label125: TLabel;
    Edit13: TEdit;
    Label126: TLabel;
    SpeedButton38: TSpeedButton;
    SpeedButton39: TSpeedButton;
    EditHw1: TEditHw;
    EditHw2: TEditHw;
    SpeedButton40: TSpeedButton;
    SpeedButton43: TSpeedButton;
    tsImpressao: TTabSheet;
    pnImpressao: TPanel;
    GroupBox14: TGroupBox;
    Panel67: TPanel;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    BitBtn55: TBitBtn;
    BitBtn56: TBitBtn;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox13: TCheckBox;
    SpeedButton46: TSpeedButton;
    tsListaRetornos: TTabSheet;
    pnListaRetornos: TPanel;
    GroupBox15: TGroupBox;
    GroupBox16: TGroupBox;
    Panel68: TPanel;
    gridListaMercadoriasRet: TDBGrid;
    BitBtn57: TBitBtn;
    BitBtn58: TBitBtn;
    BitBtn59: TBitBtn;
    BitBtn60: TBitBtn;
    CheckBox14: TCheckBox;
    gridCreditosRetorno: TDBGrid;
    BitBtn61: TBitBtn;
    BitBtn62: TBitBtn;
    Label128: TLabel;
    DBEdit65: TDBEdit;
    DBLookupComboBox13: TDBLookupComboBox;
    Label129: TLabel;
    DBEdit66: TDBEdit;
    DBLookupComboBox14: TDBLookupComboBox;
    pnDadosBaixaDevolv: TPanel;
    pnDadosHistSaidaDev: TPanel;
    lbHistSaidaDevo: TLabel;
    ckHistSaidaDev: TCheckBox;
    pnBotoesHistSaidaDev: TPanel;
    btContinuarHistSaidaDev: TBitBtn;
    lbTextoHistSaidaDev: TLabel;
    Label130: TLabel;
    DBEdit67: TDBEdit;
    Label131: TLabel;
    DBEdit68: TDBEdit;
    Panel66: TPanel;
    ckbReplVlContabil: TCheckBox;
    Label132: TLabel;
    edVlContDif: TEditHw;
    BitBtn63: TBitBtn;
    edNumRecibo: TEdit;
    Edit9: TEdit;
    Label133: TLabel;
    Label134: TLabel;
    Edit11: TEdit;
    Label127: TLabel;
    DBEdit64: TDBEdit;
    Label52: TLabel;
    DBEdit46: TDBEdit;
    Label48: TLabel;
    DBEdit44: TDBEdit;
    Label22: TLabel;
    DBEdit19: TDBEdit;
    GroupBox17: TGroupBox;
    ListBox1: TListBox;
    Panel69: TPanel;
    BitBtn64: TBitBtn;
    BitBtn65: TBitBtn;
    tsFaturaRec: TTabSheet;
    pnFaturaRec: TPanel;
    Panel70: TPanel;
    BitBtn66: TBitBtn;
    BitBtn67: TBitBtn;
    GroupBox40: TGroupBox;
    Panel71: TPanel;
    edDocFaturaEntrada: TEdit;
    edValorFaturaEntrada: TEditHw;
    edVencimentoFaturaEntrada: TMaskEdit;
    btSalvarFaturaEntrada: TBitBtn;
    ListBox3: TListBox;
    btAlterarFaturaEntrada: TBitBtn;
    GroupBox26: TGroupBox;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Edit14: TEdit;
    EditHw3: TEditHw;
    edcreditoQtdeParcelas: TSpinEdit;
    Panel72: TPanel;
    btGerar: TBitBtn;
    btApagarDesp: TBitBtn;
    dsDesp: TDataSource;
    cdsDesp: TClientDataSet;
    cdsDespNumConta: TFloatField;
    cdsDespDepartamento: TStringField;
    cdsDespValor: TCurrencyField;
    cdsDespDataReferencia: TDateField;
    cdsDespHistorico: TStringField;
    cdsDespNumDoc: TStringField;
    cdsDespNomeControle: TStringField;
    cdsDespTipoDespesa: TIntegerField;
    cdsDespCodFornecedor: TIntegerField;
    cdsDespDataVenc: TDateField;
    cdsDespNChq: TStringField;
    cdsDespContrBanc: TStringField;
    cdsDespNominalChq: TStringField;
    cdsDespControles: TIntegerField;
    cdsDespCodCred: TIntegerField;
    cdsDespParcela: TIntegerField;
    RadioGroupDescontoAcrescimo: TRadioGroup;
    SpeedButton47: TSpeedButton;
    lbPrevistoDesc: TLabel;
    lbPrevisto: TLabel;
    SpeedButtonInfDadosCartao: TSpeedButton;
    Panel73: TPanel;
    GroupBox13: TGroupBox;
    BitBtn54: TBitBtn;
    Panel74: TPanel;
    ckUsarValorCorrGerarBoleto: TCheckBox;
    GroupBox18: TGroupBox;
    Panel75: TPanel;
    BitBtn68: TBitBtn;
    ck_motivo_dev: TCheckBox;
    ed_motivo_dev: TEdit;
    SpeedButtonObsCred: TSpeedButton;
    CheckBoxExibirVenda: TCheckBox;
    CheckBox15: TCheckBox;
    relCR2: TQuickRep;
    QRBand3: TQRBand;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel13: TQRLabel;
    QRSysData2: TQRSysData;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    qrlNome_Emp2: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRBand4: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText33: TQRDBText;
    QRBand5: TQRBand;
    QRShape5: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel44: TQRLabel;
    QRBand6: TQRBand;
    QRShape6: TQRShape;
    QRLabel45: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel24: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel59: TQRLabel;
    QRDBText35: TQRDBText;
    tsRelatorioCH: TTabSheet;
    relCH: TQuickRep;
    QRBand10: TQRBand;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRSysData7: TQRSysData;
    QRLabel49: TQRLabel;
    QRSysData8: TQRSysData;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel67: TQRLabel;
    qrlNomeEmpresa: TQRLabel;
    QRBand11: TQRBand;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRBand12: TQRBand;
    QRShape12: TQRShape;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel56: TQRLabel;
    QRLabel66: TQRLabel;
    QRDBText36: TQRDBText;
    relCH2: TQuickRep;
    QRBand13: TQRBand;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRSysData3: TQRSysData;
    QRLabel71: TQRLabel;
    QRSysData4: TQRSysData;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    qrlNomeEmpresa2: TQRLabel;
    QRBand14: TQRBand;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRBand15: TQRBand;
    QRShape15: TQRShape;
    QRLabel83: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRLabel86: TQRLabel;
    QRBand16: TQRBand;
    QRShape16: TQRShape;
    QRLabel87: TQRLabel;
    QRGroup2: TQRGroup;
    QRLabel81: TQRLabel;
    QRDBText47: TQRDBText;
    SpeedButton48: TSpeedButton;
    SpeedButton49: TSpeedButton;
    GroupBox19: TGroupBox;
    Label105: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label117: TLabel;
    lbBandeiraCart: TLabel;
    Label138: TLabel;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    DBLookupComboBox12: TDBLookupComboBox;
    DBEdit61: TDBEdit;
    DBLookupComboBox15: TDBLookupComboBox;
    DBEdit69: TDBEdit;
    btVisualizarComprovante: TBitBtn;
    Panel61: TPanel;
    SpeedButton36: TSpeedButton;
    BitBtn76: TBitBtn;
    Label139: TLabel;
    DBText13: TDBText;
    Label140: TLabel;
    DBText14: TDBText;
    Panel76: TPanel;
    ckbReplAlterarNumQdeParcela: TCheckBox;
    ckbReplNaoAlterarNumQdeParcela: TCheckBox;
    MemoReplicar: TMemo;
    ckbReplAlterarNumQdeParcelaCadastro: TCheckBox;
    ckbReplNaoAlterarNumQdeParcelaCadastro: TCheckBox;
    SpeedButton50: TSpeedButton;
    imgReplInformation: TImage;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    QRLabel82: TQRLabel;
    QRLabel88: TQRLabel;
    QRLabel89: TQRLabel;
    QRLabel90: TQRLabel;
    QRDBText46: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    SpeedButton51: TSpeedButton;
    Label141: TLabel;
    DBEdit70: TDBEdit;
    Label142: TLabel;
    DBEdit71: TDBEdit;
    bt_alt_data_prev_rec2: TSpeedButton;
    bt_alt_data_prev_rec: TSpeedButton;
    tsDataPrevRec: TTabSheet;
    pnDataPrevRec: TPanel;
    Panel78: TPanel;
    Label143: TLabel;
    edDataPrevRec: TMaskEdit;
    Panel79: TPanel;
    Panel80: TPanel;
    BitBtn17: TBitBtn;
    BitBtn69: TBitBtn;
    SpeedButton52: TSpeedButton;
    SpeedButton53: TSpeedButton;
    bt_limpar_data_prev_rec: TSpeedButton;
    bt_limpar_data_prev_rec2: TSpeedButton;
    CheckBoxVerFormas: TCheckBox;
    SpeedButton54: TSpeedButton;
    SpeedButton55: TSpeedButton;
    tsDocumentosOrigem: TTabSheet;
    pnDocumentosOrigem: TPanel;
    pnDocumentosOrigemBottom: TPanel;
    btDocumentosOrigemVoltar: TBitBtn;
    DBGridDocumentosOrigem: TDBGrid;
    btDocumentosOrigemDoc: TSpeedButton;
    procedure btDocumentosOrigemDocClick(Sender: TObject);
    procedure SpeedButton55Click(Sender: TObject);
    procedure btDocumentosOrigemVoltarClick(Sender: TObject);
    procedure SpeedButton54Click(Sender: TObject);
    procedure bt_limpar_data_prev_rec2Click(Sender: TObject);
    procedure bt_limpar_data_prev_recClick(Sender: TObject);
    procedure SpeedButton53Click(Sender: TObject);
    procedure SpeedButton52Click(Sender: TObject);
    procedure BitBtn69Click(Sender: TObject);
    procedure BitBtn69KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn17Click(Sender: TObject);
    procedure bt_alt_data_prev_rec2Click(Sender: TObject);
    procedure bt_alt_data_prev_recClick(Sender: TObject);
    procedure SpeedButton51Click(Sender: TObject);
    procedure DBEdit24KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure imgReplInformationDblClick(Sender: TObject);
    procedure SpeedButton50Click(Sender: TObject);
    procedure ckbReplNaoAlterarNumQdeParcelaCadastroClick(Sender: TObject);
    procedure ckbReplAlterarNumQdeParcelaCadastroClick(Sender: TObject);
    procedure ckbReplNaoAlterarNumQdeParcelaClick(Sender: TObject);
    procedure ckbReplAlterarNumQdeParcelaClick(Sender: TObject);
    procedure BitBtn76Click(Sender: TObject);
    procedure btVisualizarComprovanteClick(Sender: TObject);
    procedure SpeedButton49Click(Sender: TObject);
    procedure SpeedButton57Click(Sender: TObject);
    procedure DBEdit43KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton48Click(Sender: TObject);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure ck_motivo_devClick(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure BitBtn68KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn68Click(Sender: TObject);
    procedure SpeedButtonInfDadosCartaoClick(Sender: TObject);
    procedure DBLookupComboBox8Exit(Sender: TObject);
    procedure DBEdit22Exit(Sender: TObject);
    procedure DBLookupComboBox10Exit(Sender: TObject);
    procedure SpeedButton47Click(Sender: TObject);
    procedure RadioGroupDescontoAcrescimoClick(Sender: TObject);
    procedure DBEdit34Exit(Sender: TObject);
    procedure BitBtn65Click(Sender: TObject);
    procedure btSalvarFaturaEntradaClick(Sender: TObject);
    procedure btAlterarFaturaEntradaClick(Sender: TObject);
    procedure edVencimentoFaturaEntradaExit(Sender: TObject);
    procedure BitBtn67Click(Sender: TObject);
    procedure BitBtn66Click(Sender: TObject);
    procedure btApagarDespClick(Sender: TObject);
    procedure btGerarClick(Sender: TObject);
    procedure BitBtn64Click(Sender: TObject);
    procedure GroupBox8Enter(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBLookupComboBox4Exit(Sender: TObject);
    procedure DBEdit24Exit(Sender: TObject);
    procedure edNumReciboKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn63Click(Sender: TObject);
    procedure edVlContDifExit(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure pnDadosBaixaDevolvEnter(Sender: TObject);
    procedure btContinuarHistSaidaDevClick(Sender: TObject);
    procedure edHistSaidaDevKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ckHistSaidaDevClick(Sender: TObject);
    procedure DBEdit66Exit(Sender: TObject);
    procedure DBEdit65Exit(Sender: TObject);
    procedure BitBtn62Click(Sender: TObject);
    procedure BitBtn61Click(Sender: TObject);
    procedure gridListaMercadoriasRetDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BitBtn60Click(Sender: TObject);
    procedure BitBtn57Click(Sender: TObject);
    procedure BitBtn59Click(Sender: TObject);
    procedure BitBtn58Click(Sender: TObject);
    procedure CheckBox14Click(Sender: TObject);
    procedure SpeedButton46Click(Sender: TObject);
    procedure BitBtn54Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure BitBtn54KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn55Click(Sender: TObject);
    procedure BitBtn56Click(Sender: TObject);
    procedure SpeedButton43Click(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure pnNSUEnter(Sender: TObject);
    procedure Panel63Exit(Sender: TObject);
    procedure BitBtn53Click(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure pnPendenciasCartaoExit(Sender: TObject);
    procedure pnPendenciasCartaoEnter(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure SpeedButton38Click(Sender: TObject);
    procedure BitBtn52Click(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure BitBtn51Click(Sender: TObject);
    procedure BitBtn50Click(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure BitBtn46Click(Sender: TObject);
    procedure BitBtn49Click(Sender: TObject);
    procedure BitBtn45Click(Sender: TObject);
    procedure BitBtn48Click(Sender: TObject);
    procedure BitBtn47Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure pnDescontoEnter(Sender: TObject);
    procedure DesmarcardocumentocomoRecebendo1Click(Sender: TObject);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure BitBtn13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grupoChequeEnter(Sender: TObject);
    procedure DBEdit13Enter(Sender: TObject);
    procedure edQtdeReplicarCadastroExit(Sender: TObject);
    procedure GroupBox5Exit(Sender: TObject);
    procedure grupoCreditoEnter(Sender: TObject);
    procedure BitBtn44Click(Sender: TObject);
    procedure BitBtn43Click(Sender: TObject);
    procedure pnLoteQuitExit(Sender: TObject);
    procedure pnLoteQuitEnter(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure edValorBaixaParcialKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn42Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure pnDadosBaixaEnter(Sender: TObject);
    procedure BitBtn40KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnDiferencaEnter(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure BitBtn38KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnRecibosEnter(Sender: TObject);
    procedure edNumReciboKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit4Enter(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure pnReciboValorEnter(Sender: TObject);
    procedure DBGrid7TitleClick(Column: TColumn);
    procedure edNumReciboExit(Sender: TObject);
    procedure edNumReciboEnter(Sender: TObject);
    procedure edNumReciboChange(Sender: TObject);
    procedure DBGrid7MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid7DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid7DblClick(Sender: TObject);
    procedure DBGrid7CellClick(Column: TColumn);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure DBEdit55Exit(Sender: TObject);
    procedure DBEdit52Exit(Sender: TObject);
    procedure DBEdit51Exit(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure pnRecLancEnter(Sender: TObject);
    procedure pnRecCreditoEnter(Sender: TObject);
    procedure pnRecChequeEnter(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure DBGrid5DblClick(Sender: TObject);
    procedure DBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox7Exit(Sender: TObject);
    procedure pnReceberEnter(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure edDescValorExit(Sender: TObject);
    procedure edDescPercExit(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure SpeedButton42Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure SpeedButton41Click(Sender: TObject);
    procedure btDataRealBaixaClick(Sender: TObject);
    procedure BitBtn26KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit28KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton45Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure pnComissaoEnter(Sender: TObject);
    procedure SpeedButton44Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure pnDetalhesEnter(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn7Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure pnHistoricoExit(Sender: TObject);
    procedure pnHistoricoEnter(Sender: TObject);
    procedure ckbEmLoteClick(Sender: TObject);
    procedure pnNegativarEnter(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure relCRPreview(Sender: TObject);
    procedure relCHPreview(Sender: TObject);
    procedure relCRBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand9BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand8BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand7BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure QRBand12BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure relCHBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand11BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand10BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbCheckClick(Sender: TObject);
    procedure DBEdit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox5Exit(Sender: TObject);
    procedure DBEdit36Exit(Sender: TObject);
    procedure DBEdit38KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit41Exit(Sender: TObject);
    procedure DBEdit38Exit(Sender: TObject);
    procedure DBEdit27Exit(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBEdit18Exit(Sender: TObject);
    procedure DBEdit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBEdit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit13Exit(Sender: TObject);
    procedure spbContasBancariasClick(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit33Exit(Sender: TObject);
    procedure DBEdit33KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure GroupBox3Exit(Sender: TObject);
    procedure GroupBox3Enter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn12Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure rbCreditoClick(Sender: TObject);
    procedure rbChequeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure ComboBox12Exit(Sender: TObject);
	 function _validarDetalhes: boolean;
    procedure getFaturas;  
    procedure setarFiltro(pRecebendo: boolean = true);
  private
    { Private declarations }
    vCriou: Smallint;
    vTipoCriou: string;
    vBoolTemp: Boolean;
    vValor1, vValor2, vValorJuros, vValorDesconto: Currency;
    vDtDia: TDate;
    procedure showForm;
    procedure NotasRetornoAfterScroll(DataSet: TDataSet);
    procedure habilitarDesabilitarReplicacaoCredito(pHab: boolean = False);
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;
  public
    { Public declarations }
    vNumDoc: string;
    vValorRec: Double;
    vDataVenc: TDateTime;
  end;

var
  frmCadContasAReceber: TfrmCadContasAReceber;
  vTipoE: string;

implementation

uses uDtmContasAReceber, uclassescontasareceber, uDtmAtivo, uDadosIni,
  uDataSet_OOP, uClassesImportacaoFinanceiro, DateUtils,  
  uclassesconciliacartao, hw_utils, StrUtils;

{$R *.dfm}

procedure TfrmCadContasAReceber.BitBtn10Click(Sender: TObject);
begin
  inherited;
  TForm(pnComissao.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContasAReceber.BitBtn11Click(Sender: TObject);
begin
  inherited;
  TForm(pnComissao.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn12Click(Sender: TObject);
var
  I: Integer;
  vcampo: string;
  vSel: boolean;
begin
  try
    Screen.Cursor := crHourGlass;

    vSel := false;

    habilitarDesabilitarReplicacaoCredito(False);
    SpeedButtonInfDadosCartao.Enabled := True;
    
    if conta.Docs = 'S1' then
      vcampo := 'STATUS_CH'
    else
      vcampo := 'STATUS_C';

    if BitBtn12.Caption = '&Receber' then
    begin
    	if Panel2.Visible then
      begin
        if conta.Docs = 'S1' then
          if not vDadosIni.PesqPros('CAR032', 'RECEBER', '', conta.Table, '', conta.buscas, True) then
            exit;
        if conta.Docs = 'S2' then
          if not vDadosIni.PesqPros('CAR033', 'RECEBER', '', conta.Table, '', conta.buscas, True) then
            exit;
      end;

      if not vDadosIni.VerificarinicioFechFinan(conta.buscas) then
        exit;

      BitBtn12.Caption := 'Volta&r';

      if (not conta.Recebendo) then
      begin
        try
          conta.dataSet.DisableControls;
          conta.dataSet.First;
          while not conta.dataSet.Eof do
          begin
            if (conta.dataSet.FieldByName('SEL').AsString = 'S')
              and (trim(conta.dataSet.FieldByName(vcampo).AsString) = '') then
            begin
              vSel := true;
              Break;
            end;

            conta.dataSet.Next;
          end;
        finally
          conta.dataSet.First;
          conta.dataSet.EnableControls;
        end;
      end;

      if (not conta.Recebendo) then
      begin
        conta.dataSet.Filtered := false;
        if (vSel) then
          conta.dataSet.Filter := '((' + vcampo + ' IS NULL) OR (TRIM(' + vcampo + ') = '''')) AND SEL = ''S'' '
        else
          conta.dataSet.Filter := '((' + vcampo + ' IS NULL) OR (TRIM(' + vcampo + ') = '''')) ';
        conta.dataSet.Filtered := true;
      end;

      vDadosIni.abreStatusProcessamento('', 'Aguarde... Iniciando processo de recebimento');

      inherited;

      vDadosIni.vInibeMensPesqPros := 'S';
      SpeedButton10.Enabled := vDadosIni.PesqPros('CAR056', 'RECEBER', '', conta.Table, '',
        conta.buscas, False);

      BitBtn3.Enabled := False;

//      ckbNaoQuitado.Checked := True;
//      ckbNaoQuitado.Enabled := False;
//
//      ckbQuitado.Checked := False;
//      ckbQuitado.Enabled := False;

      Panel2.Visible := False;
      Panel2.Enabled := False;

      Panel15.Visible := True;
      Panel15.Enabled := True;

      conta.Recebendo := True;

//      if Panel1.Visible then
//        BitBtn1.Click;

    end
    else
    begin
      BitBtn12.Caption := '&Receber';

      conta.dataSet.Filtered := false;

      vDadosIni.abreStatusProcessamento('', 'Aguarde... Terminando processo de recebimento');

      inherited;

      BitBtn3.Enabled := True;

//      ckbNaoQuitado.Enabled := True;
//      ckbQuitado.Enabled := True;
//
      Panel2.Visible := True;
      Panel2.Enabled := True;

      Panel15.Visible := False;
      Panel15.Enabled := False;

      if conta.Recebendo then
        if trim(conta.ultimasql) <> '' then
          conta.montaSelect(conta.ultimasql);

      conta.Recebendo := False; 

    end;

  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn13Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'E', conta.buscas) then
    Exit;
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'E', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'E', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;
    DBGrid8.Visible := False;
    if Application.MessageBox(pchar('Deseja mesmo efetuar o estorno do lote de quitação?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    	exit;

    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(conta.buscas) then
    begin
    	TForm(pnLoteQuit.Parent).ModalResult := IDCANCEL;
      Exit;
    end;
    try
      conta._estornarRecebimento;
    finally
      TForm(pnLoteQuit.Parent).ModalResult := IDOK;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
    DBGrid8.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn43.Click;
end;

procedure TfrmCadContasAReceber.BitBtn14Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(conta.buscas) then
    begin
    	TForm(pnReceber.Parent).ModalResult := IDCANCEL;
      Exit;
    end;
    if not vDadosIni.VerificarinicioFechFinan(conta.buscas) then
      exit;
    if conta._confereLancamentoRecebimento then
      TForm(pnReceber.Parent).ModalResult := IDOK;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn15Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja mesmo cancelar o recebimento de contas', 'Atenção',
    MB_ICONQUESTION + MB_YESNO) = IDYES then
    TForm(pnReceber.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn16Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  try

    Screen.Cursor := crHourGlass;
    if DBEdit22.DataSource.DataSet.FieldByName(DBEdit22.DataField).AsFloat <= 0 then
    begin
      Application.MessageBox('Nº da Conta deve ser preenchido', 'Atenção', MB_ICONERROR + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (DBEdit22.CanFocus) then
      	DBEdit22.SetFocus;
      Exit;
    end;

    if not conta._existePContas(DBEdit22.DataSource.DataSet.FieldByName(DBEdit22.DataField).AsFloat)
      then
    begin
      Application.MessageBox('Nº da Conta não encontrado no Plano de Contas', 'Atenção', MB_ICONERROR + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (DBEdit22.CanFocus) then
      	DBEdit22.SetFocus;
      Exit;
    end;

    if Trim(conta.vPCont.DataSet.FieldByName('sthab').AsString) = 'N' then
    begin
      Application.MessageBox('Nº da Conta Desabilitada, tente outra', 'Atenção', MB_ICONERROR + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (DBEdit22.CanFocus) then
      	DBEdit22.SetFocus;
      Exit;
    end;

    if vDadosIni.StrToFloatFormat(DBEdit55.DataSource.DataSet.FieldByName(DBEdit55.DataField).AsFloat,2) <= 0 then
    begin
      Application.MessageBox('Valor do lançamento deve ser informado', 'Atenção', MB_ICONERROR + MB_OK);
      if (Self.Enabled) and (Self.Visible) and (DBEdit55.CanFocus) then
      	DBEdit55.SetFocus;
      Exit;
    end;

    if ((vDadosIni.vContrapartida) and (DBEdit55.DataSource.DataSet.State = dsInsert)) then
      if (vDadosIni.StrToFloatFormat(DBEdit55.DataSource.DataSet.FieldByName(DBEdit55.DataField).AsFloat,2) >
         conta.dadosReceber.valorAInformar) then
      begin
        Application.MessageBox('Valor do lançamento não deve ser maior que o valor a informar', 'Erro', MB_ICONERROR + MB_OK);
        if (Self.Enabled) and (Self.Visible) and (DBEdit55.CanFocus) then
        	DBEdit55.SetFocus;
        Exit;
      end;


    for I := 0 to scrollDinheiro.ControlCount - 1 do
      if scrollDinheiro.Controls[I] is TDBEdit then
        TDBEdit(scrollDinheiro.Controls[I]).DataSource := nil
      else if scrollDinheiro.Controls[I] is TDBComboBox then
        TDBComboBox(scrollDinheiro.Controls[I]).DataSource := nil
      else if scrollDinheiro.Controls[I] is TDBLookupComboBox then
        TDBLookupComboBox(scrollDinheiro.Controls[I]).DataSource := nil;

    if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) then
    	BitBtn16.SetFocus;
    TForm(pnRecLanc.Parent).ModalResult := IDOK;

  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmCadContasAReceber.BitBtn17Click(Sender: TObject);
begin
  inherited;
  if edDataPrevRec.Text = '  /  /    ' then
  	conta.DataPrevRec := 0
  else
  	conta.DataPrevRec := StrToDate(edDataPrevRec.Text);
  TForm(pnDataPrevRec.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContasAReceber.BitBtn18Click(Sender: TObject);
begin
  inherited;
  if conta.vContabanc.post then
    TForm(pnCadastroContasBancarias.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContasAReceber.BitBtn19Click(Sender: TObject);
begin
  inherited;
  conta.vContabanc.Cancel;
  TForm(pnCadastroContasBancarias.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn1Click(Sender: TObject);
var
  I: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('', 'Pesquisando Contas a Receber');
    inherited;
    GroupBox3Enter(GroupBox3);

    if conta.Docs = 'S1' then
      if not vDadosIni.PesqPros('CAR003', 'CONSULTAR', '', conta.Table, '', conta.buscas, False)
        then
        exit;
    if conta.Docs = 'S2' then
      if not vDadosIni.PesqPros('CAR004', 'CONSULTAR', '', conta.Table, '', conta.buscas, False)
        then
        exit;

    conta.vCons.campo := ComboBox1.Text;
    conta.vCons.ordem := ComboBox2.Text;
    conta.vCons.condicao := ComboBox3.Text;
    conta.vCons.valor := MaskEdit3.Text;
    conta.vCons.dataIni := MaskEdit1.Text;
    conta.vCons.dataFim := MaskEdit2.Text;
    conta.vCons.porData := MaskEdit1.Visible;
    conta.vCons.retornos := CheckBox13.Checked;

    conta.vCons.campoAd := ComboBox11.Text;
    conta.vCons.valorAd := MaskEdit7.Text;
    conta.vCons.dataIniAd := MaskEdit9.Text;
    conta.vCons.dataFimAd := MaskEdit8.Text;
    conta.vCons.condicaoAd := ComboBox12.Text;
    conta.vCons.porDataAd := MaskEdit9.Visible;

    conta.vCons.naoQuitados := ckbNaoQuitado.Checked;
    conta.vCons.quitados := ckbQuitado.Checked;
    conta.vCons.adicional := CheckBox1.Checked;

    conta.vCons.verFormas := CheckBoxVerFormas.Checked;

    conta.vCons.tipoE := vTipoE;

    conta._consulta;
    
    if BitBtn12.Caption <> '&Receber' then
      conta.filterStr('((%s IS NULL) OR (TRIM(%s) = '''')) ',
                      [IfThen(conta.Docs = 'S1', 'STATUS_CH', 'STATUS_C'),
                       IfThen(conta.Docs = 'S1', 'STATUS_CH', 'STATUS_C')])
    else
      conta.filterClear;

    if (conta.Docs = 'S2') and (not conta.dataSet.IsEmpty) then
      for I := 0 to DBGrid1.Columns.Count - 1 do
        if DBGrid1.Columns[i].FieldName = 'OCORRENCIABANCARIA' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;

    SpeedButton46.Visible := CheckBox13.Checked and (not ckbQuitado.Checked);

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
    vDtDia := vDadosIni.getDataBanco(conta.buscas);

  finally
    vDadosIni.fechaStatusProcessamento;
    gravaConfiguracoesFormRegistro;
    conta.ultimasql := conta.dataSet.CommandText;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn20Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    conta.dadosCDL.vNegativar := RadioGroup1.ItemIndex = 0;
    conta.dadosCDL.vImprimirFichaSPC := ckbImpFicha.Checked;
    conta.dadosCDL.vValorVenda := rbValorVenda.Checked;
//    conta.dadosCDL.vCadastro := False;
    conta.dadosCDL.vEmLote := ckbEmLote.Checked;
    conta.dadosCDL.vCodigoMV := ckbCodigoMV.Checked;
    TForm(pnNegativar.Parent).ModalResult := IDOK;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn21Click(Sender: TObject);
begin
  inherited;
  TForm(pnNegativar.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn22Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if not _validarDetalhes then
    	exit;
      
    conta._impressaoDeRecibo;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn23Click(Sender: TObject);
var
  vDet: TDetalhesRecebimentoCX;
  vProcesso: string;
  vTemp: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if conta.vBx.dataSet.FieldByName('LOTE_QUIT').AsInteger <= 0 then
      Exit;

    if not _validarDetalhes then
    	exit;

    if conta.Docs = 'S1' then
      vProcesso := 'CAR043'
    else
      vProcesso := 'CAR044';

    if not vDadosIni.PesqPros(vProcesso, 'CONSULTA', '', conta.Table, '', conta.buscas, False) then
      exit;

    vDet := TDetalhesRecebimentoCX.create;
    if conta.Docs = 'S1' then
    	vDet._abreDetalhesRecebimentosModalidade(
        conta.vBx.dataSet.FieldByName('LOTE_QUIT').AsInteger,
        conta.vBx.dataSet.FieldByName('DATQ_CH').AsDateTime)
    else
      vDet._abreDetalhesRecebimentosModalidade(
        conta.vBx.dataSet.FieldByName('LOTE_QUIT').AsInteger,
        conta.vBx.dataSet.FieldByName('DATQ_C').AsDateTime);
    vDet.Free;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn24Click(Sender: TObject);
begin
  inherited;
  TForm(pnDetalhes.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContasAReceber.BitBtn25Click(Sender: TObject);
begin
  inherited;
  conta.DataRealBaixa := StrToDate(edDataRealBaixa.Text);
  TForm(pnDataRealBaixa.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContasAReceber.BitBtn26Click(Sender: TObject);
begin
  inherited;
  TForm(pnDataRealBaixa.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn26KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    TForm(pnDataRealBaixa.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn27Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if edQtdeRepl.AsInteger <= 0 then
    begin
      Application.MessageBox('Quantidade inválida, dever ser maior que zero', 'Atenção', 0 + 64);
      Exit;
    end;

    if (edDiaVencReplicar.AsInteger <= 0) or (edDiaVencReplicar.AsInteger > 31) then
    begin
      Application.MessageBox('Dia de vencimento inválido, dever estar entre 1 e 31', 'Atenção', 0
        + 64);
      Exit;
    end;
    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(conta.buscas) then
      Exit;
    if not vDadosIni.VerificarinicioFechFinan(conta.buscas) then
      exit;

    conta.QtdeReplicacao              := edQtdeRepl.AsInteger;
    conta.DiaReplicacao               := edDiaVencReplicar.AsInteger;
    conta.ReplVlContReplicacao        := ckbReplVlContabil.Checked;
    conta.ReplAltNumQtdeReplicacao    := ckbReplAlterarNumQdeParcela.Checked;
    conta.ReplNaoAltNumQtdeReplicacao := ckbReplNaoAlterarNumQdeParcela.Checked;

    TForm(pnReplicar.Parent).ModalResult := IDOK;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn28Click(Sender: TObject);
begin
  inherited;
  TForm(pnReplicar.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn29Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    for I := 0 to scrollDinheiro.ControlCount - 1 do
      if scrollDinheiro.Controls[I] is TDBEdit then
        TDBEdit(scrollDinheiro.Controls[I]).DataSource := nil
      else if scrollDinheiro.Controls[I] is TDBComboBox then
        TDBComboBox(scrollDinheiro.Controls[I]).DataSource := nil
      else if scrollDinheiro.Controls[I] is TDBLookupComboBox then
        TDBLookupComboBox(scrollDinheiro.Controls[I]).DataSource := nil;

    TForm(pnRecLanc.Parent).ModalResult := IDCANCEL;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn30Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if ((vDadosIni.vContrapartida) and (DBEdit12.DataSource.DataSet.State = dsInsert)) then
      if (vDadosIni.StrToFloatFormat(DBEdit12.DataSource.DataSet.FieldByName(DBEdit12.DataField).AsFloat,2) >
         conta.dadosReceber.valorAInformar) then
      begin
        Application.MessageBox('Valor do cheque não deve ser maior que o valor a informar', 'Erro', MB_ICONERROR + MB_OK);
        if (Self.Enabled) and (Self.Visible) and (DBEdit12.CanFocus) then
        	DBEdit12.SetFocus;
        Exit;
      end;

    if (Self.Enabled) and (Self.Visible) and (BitBtn30.CanFocus) then
    	BitBtn30.SetFocus;
    conta.dadosReceber.historicoSaida := Edit3.Text;
    if conta.vReceb.vCh.Post then
      TForm(pnRecCheque.Parent).ModalResult := IDOK
    else
      setFocusCampoErro(conta.vReceb.vCh.vNomeCampoErro);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn31Click(Sender: TObject);
begin
  inherited;
  TForm(pnRecCheque.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn32Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if ((vDadosIni.vContrapartida) and (DBEdit37.DataSource.DataSet.State = dsInsert)) then
      if (vDadosIni.StrToFloatFormat(DBEdit37.DataSource.DataSet.FieldByName(DBEdit37.DataField).AsFloat,2) >
         vDadosIni.StrToFloatFormat(conta.dadosReceber.valorAInformar, 2)) then
      begin
        Application.MessageBox('Valor do crédito não deve ser maior que o valor a informar', 'Erro', MB_ICONERROR + MB_OK);
        if (Self.Enabled) and (Self.Visible) and (DBEdit37.CanFocus) then
        	DBEdit37.SetFocus;
        Exit;
      end;

    if (Self.Enabled) and (Self.Visible) and (BitBtn30.CanFocus) then
    	BitBtn30.SetFocus;
    conta.dadosReceber.historicoSaida := Edit2.Text;
    vDadosIni.vDtSetTmp := cdsDesp;
    habilitarDesabilitarReplicacaoCredito(False);
    if conta.vReceb.vCr.Post then
    begin
      ListBox1.Clear;
      ListBox3.Clear;
      cdsDesp.EmptyDataSet;
      vDataVenc := 0;
      vNumDoc := '';
      vValorRec := 0;
      TForm(pnRecCredito.Parent).ModalResult := IDOK;
    end
    else
    begin
      setFocusCampoErro(conta.vReceb.vCr.vNomeCampoErro);
      if trim(conta.vReceb.vCr.vNomeCampoErro) = 'DadosCartao' then
      	SpeedButtonInfDadosCartaoClick(Sender);
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn33Click(Sender: TObject);
begin
  inherited;
  ListBox1.Clear;
  ListBox3.Clear;
  if not cdsDesp.IsEmpty then
    cdsDesp.EmptyDataSet;
  vDataVenc := 0;
  vNumDoc := '';
  vValorRec := 0;
  TForm(pnRecCredito.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn34Click(Sender: TObject);
begin
  inherited;
  TForm(pnRecibos.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContasAReceber.BitBtn35Click(Sender: TObject);
var
  vMensagem: string;
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn35.CanFocus) then
  	BitBtn35.SetFocus;
  if (DBLookupComboBox10.KeyValue <= 0) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox10.CanFocus) then
      DBLookupComboBox10.SetFocus;
    exit;
  end;

  if not conta.verificarConta(vDadosIni.IfThen(
    conta.dadosReceber.valorAtingido > conta.dadosReceber.valorOperacao, 'E', 'S'),
    conta.vPCont.dataSet.FieldByName('N_CONTA_PLC').AsFloat) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox10.CanFocus) then
      DBLookupComboBox10.SetFocus;
    exit;
  end;

  if not conta.testarNumConta(vDadosIni.IfThen(
    conta.dadosReceber.valorAtingido > conta.dadosReceber.valorOperacao, 'E', 'S'),
    conta.vPCont.dataSet.FieldByName('N_CONTA_PLC').AsFloat, vMensagem) then
  begin
    Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
//    if not vDadosIni.PesqPros('LANC038', 'PERMITIR', 'LANC CONTA ' + FloatToStr(conta.vPCont.dataSet.FieldByName('N_CONTA_PLC').AsFloat),
//      'LANCCXL', '', conta.buscas, True) then
//    begin
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox10.CanFocus) then
        DBLookupComboBox10.SetFocus;
      exit;
//    end;
  end;

  if conta.dadosReceber.valorAtingido > conta.dadosReceber.valorOperacao then
  begin
    if (conta.vPCont.dataSet.FieldByName('N_CONTA_PLC').AsFloat <>
		  conta.dadosReceber.numContaJuros) then
    begin
      Application.MessageBox(PChar('Conta de entrada selecionada diferente da informada nas contas de ligação (Juros Recebidos).'), 'Atenção', MB_ICONWARNING + MB_OK);
      if not vDadosIni.PesqPros('LANC046', 'PERMITIR', 'LANC CONTA ' + FloatToStr(conta.vPCont.dataSet.FieldByName('N_CONTA_PLC').AsFloat),
      'LANCAMENTOS', '', conta.buscas, True) then
      begin
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox10.CanFocus) then
        	DBLookupComboBox10.SetFocus;
	      exit;
      end;
    end;
  end
  else
  begin
  	if (conta.vPCont.dataSet.FieldByName('N_CONTA_PLC').AsFloat <>
		  conta.dadosReceber.numContaDesconto) then
    begin
      Application.MessageBox(PChar('Conta de saída selecionada diferente da informada nas contas de ligação (Descontos Recebidos).'), 'Atenção', MB_ICONWARNING + MB_OK);
      if not vDadosIni.PesqPros('LANC046', 'PERMITIR', 'LANC CONTA ' + FloatToStr(conta.vPCont.dataSet.FieldByName('N_CONTA_PLC').AsFloat),
      'LANCAMENTOS', '', conta.buscas, True) then
      begin
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox10.CanFocus) then
        	DBLookupComboBox10.SetFocus;
	      exit;
      end;
    end;
  end;

  if (trim(edHistoricoDiferenca.Text) = '') then
  begin
    Application.MessageBox('Histórico não informado.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (edHistoricoDiferenca.CanFocus) then
      edHistoricoDiferenca.SetFocus;
    Exit;
  end;

  if (DBLookupComboBox11.KeyValue <=0) then
  begin
    Application.MessageBox('Controle não informado.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox11.CanFocus) then
      DBLookupComboBox11.SetFocus;
    Exit;
  end;

  if (edVlContDif.AsValue <= 0) then
  begin
    Application.MessageBox('Valor Contabil não informado.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (edVlContDif.CanFocus) then
      edVlContDif.SetFocus;
    Exit;
  end;

  TForm(pnDiferenca.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContasAReceber.BitBtn36Click(Sender: TObject);
begin
  inherited;
  conta.DescontoPercentual := edDescPerc.AsValue;
  conta.DescontoValor := edDescValor.AsValue;
  conta.DescontoAcrescimo := vDadosIni.IfThen(RadioGroupDescontoAcrescimo.ItemIndex = 0, 'D', 'A');
  TForm(pnDesconto.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContasAReceber.BitBtn37Click(Sender: TObject);
begin
  inherited;
  TForm(pnDesconto.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn38Click(Sender: TObject);
begin
  inherited;
  if edValorDeBaixa.AsValue > 0 then
  begin
     if vDadosIni.vRecibo.ParcMinRestCC > 0 then
	     if (vDadosIni.StrToFloatFormat(edValorDeBaixa.AsValue, 2) <
         vDadosIni.StrToFloatFormat(conta.vReceb.vRecibo.dataSet.FieldByName('VALOR').AsCurrency, 2)) then
       begin
         if (vDadosIni.vRecibo.ParcMinRestCC > conta.vReceb.vRecibo.dataSet.FieldByName('VALOR').AsCurrency - edValorDeBaixa.AsValue) then
         begin
           Application.MessageBox(pchar('Valor restante do recibo ao realizar baixa parcial não deve ser menor que R$ ' +
                Format('%0.2n', [vDadosIni.vRecibo.ParcMinRestCC]) + '!' + #13 +
                'Valor restante R$ ' + Format('%0.2n', [conta.vReceb.vRecibo.dataSet.FieldByName('VALOR').AsCurrency - edValorDeBaixa.AsValue]) + '.'),
                'Informação', MB_OK + MB_ICONINFORMATION);

            if not vDadosIni.PesqPros('REC021', 'PERMITIR - R$ ' + Format('%0.2n', [vDadosIni.vRecibo.ParcMinRestCC]),
             'PERMITIR', 'RECIBOS', conta.vReceb.vRecibo.dataSet.FieldByName('NRECIBO').AsString, conta.buscas, true) then
              exit;
         end;
       end;

    conta.vReceb.vRecibo.valorRecibo := edValorDeBaixa.AsValue;
    TForm(pnReciboValor.Parent).ModalResult := IDOK;
  end
  else
    Application.MessageBox('Valor de Baixa não informado', 'Atenção', 0 + 64);
end;

procedure TfrmCadContasAReceber.BitBtn38KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn39.Click;
end;

procedure TfrmCadContasAReceber.BitBtn39Click(Sender: TObject);
begin
  inherited;
  TForm(pnReciboValor.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn3Click(Sender: TObject);
begin
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'I', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'I', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;

    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(conta.buscas) then
      Exit;
      
    if not conta.Insert then
      exit;

    habilitarDesabilitarReplicacaoCredito(False);
    SpeedButtonInfDadosCartao.Enabled := True;
    
    Label128.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    Label129.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    DBEdit65.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    DBEdit66.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    DBLookupComboBox13.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    DBLookupComboBox14.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    DBEdit66.Enabled := (conta.DataSource.DataSet.State = dsInsert);
    DBLookupComboBox14.Enabled := (conta.DataSource.DataSet.State = dsInsert);
    DBEdit65.Enabled := (conta.DataSource.DataSet.State = dsInsert);
    DBLookupComboBox13.Enabled := (conta.DataSource.DataSet.State = dsInsert);
    DBEdit37.Enabled := true;
    DBEdit12.Enabled := true;

    DBEdit70.Enabled                   := (conta.DataSource.DataSet.State = dsInsert);
    DBEdit71.Enabled                   := (conta.DataSource.DataSet.State = dsInsert);

    bt_limpar_data_prev_rec.Visible    := (conta.DataSource.DataSet.State = dsInsert);
    bt_limpar_data_prev_rec2.Visible   := (conta.DataSource.DataSet.State = dsInsert);

    bt_alt_data_prev_rec.Visible       := (conta.DataSource.DataSet.State = dsEdit);
    bt_alt_data_prev_rec2.Visible      := (conta.DataSource.DataSet.State = dsEdit);

    if conta.DataSource.DataSet.State = dsInsert then
    begin
      bt_limpar_data_prev_rec.Left     := DBEdit70.Left + DBEdit70.Width + 3;
      bt_limpar_data_prev_rec2.Left    := DBEdit71.Left + DBEdit71.Width + 3;

      bt_alt_data_prev_rec.Left        := DBEdit70.Left + DBEdit70.Width + 3;
      bt_alt_data_prev_rec2.Left       := DBEdit71.Left + DBEdit71.Width + 3;
    end
    else
    begin
      bt_alt_data_prev_rec.Left        := DBEdit70.Left + DBEdit70.Width + 3;
      bt_alt_data_prev_rec2.Left       := DBEdit71.Left + DBEdit71.Width + 3;

      bt_alt_data_prev_rec.Left        := DBEdit70.Left + DBEdit70.Width + 3;
      bt_alt_data_prev_rec2.Left       := DBEdit71.Left + DBEdit71.Width + 3;
    end;

    if (Self.Enabled) and (Self.Visible) and (BitBtn3.CanFocus) then
      BitBtn3.SetFocus;

    vDadosIni.vInibeMensPesqPros := 'S';
    if conta.Docs <> 'S1' then
     DBEdit64.Enabled := vDadosIni.PesqPros('CAR088', 'HABILITAR', '', conta.Table, conta.dataSet.FieldByName('COD_CRED').AsString, conta.buscas, False);

    PageControl1.ActivePage := TabSheet1;
    ListBox1.Clear;
    ListBox3.Clear;
    if conta.Docs = 'S1' then
    begin
      PageControl3.ActivePage := tsCadastroCheque;
      if (Self.Enabled) and (Self.Visible) and (DBEdit66.CanFocus) then
        DBEdit66.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
        DBEdit1.SetFocus;
    end
    else
    begin
      if not cdsDesp.IsEmpty then
	     cdsDesp.EmptyDataSet;
      PageControl3.ActivePage := tsCadastroCredito;
      if (Self.Enabled) and (Self.Visible) and (DBEdit65.CanFocus) then
        DBEdit65.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit24.CanFocus) then
        DBEdit24.SetFocus;
    end;

    statusBar(panelCadastro, '');
  finally
    Screen.Cursor := crDefault;
  end;

end;

procedure TfrmCadContasAReceber.BitBtn40Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja mesmo cancelar o lançamento da diferença', 'Atenção',
    MB_ICONQUESTION + MB_YESNO) = IDYES then
    TForm(pnDiferenca.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn40KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn40.Click;
end;

procedure TfrmCadContasAReceber.BitBtn41Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if conta.dadosReceber.baixaParcial then
    begin
      if vDadosIni.StrToFloatFormat(edValorBaixaParcial.AsValue, 2) = 0 then
      begin
        Application.MessageBox('Valor inválido', 'Atenção', 0 + 64);
        Exit;
      end;

      if vDadosIni.StrToFloatFormat(edValorBaixaParcial.AsValue, 2) >
        vDadosIni.StrToFloatFormat(
        conta.dataSet.FieldByName('valor_corr').AsFloat, 2) then
      begin
        Application.MessageBox('Valor informado maior que o valor devido, utilize a quitação normal', 'Atenção', 0 + 64);
        Exit;
      end;

      conta.dadosReceber.valorOperacao := vDadosIni.StrToFloatFormat(edValorBaixaParcial.AsValue,
        2);
    end;
    conta.dadosReceber.usarValorCorrigido := CheckBox4.Checked;
    conta.dadosReceber.acrescentarNomeHist := CheckBox5.Checked;
    conta.dadosReceber.lancarDesconto := CheckBox6.Checked;
    conta.dadosReceber.lancarJuros := CheckBox7.Checked;
    conta.dadosReceber.lancarTaxaCartao := CheckBox8.Checked;
    conta.dadosReceber.historicoSaidaLancamento := Edit5.Text;
    conta.dadosReceber.dataBaixa := StrToDate(MaskEdit4.Text);
    conta.dadosReceber.processamentoAutomatico := False;
    if not conta.dadosReceber.usarValorCorrigido then
    begin
      conta.dadosReceber.lancarDesconto := False;
      conta.dadosReceber.lancarJuros := False;
    end;

    _GravaConfiguracoesBoolean(conta.Docs + CheckBox4.Name, CheckBox4.Checked);
    _GravaConfiguracoesBoolean(conta.Docs + CheckBox5.Name, CheckBox5.Checked);
    _GravaConfiguracoesBoolean(conta.Docs + CheckBox6.Name, CheckBox6.Checked);
    _GravaConfiguracoesBoolean(conta.Docs + CheckBox7.Name, CheckBox7.Checked);
    _GravaConfiguracoesBoolean(conta.Docs + CheckBox8.Name, CheckBox8.Checked);

    TForm(pnDadosBaixa.Parent).ModalResult := IDOK;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn42Click(Sender: TObject);
begin
  inherited;
  TForm(pnDadosBaixa.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn43Click(Sender: TObject);
begin
  inherited;
  TForm(pnLoteQuit.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn44Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if not _validarDetalhes then
    	exit;
      
    if conta._visualizarLoteBaixa then
      conta.vBx.dataSet.Refresh;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn45Click(Sender: TObject);
begin
  inherited;
  if conta.vObs.Insert then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBMemo1.CanFocus) then
    	DBMemo1.SetFocus;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn46Click(Sender: TObject);
begin
  inherited;
  conta._informarObservacaoParaCxl(Edit6.Text, not CheckBox9.Checked);
end;

procedure TfrmCadContasAReceber.BitBtn47Click(Sender: TObject);
begin
  inherited;
  TForm(pnObs.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn48Click(Sender: TObject);
begin
  inherited;
  conta.vObs.Cancel;
end;

procedure TfrmCadContasAReceber.BitBtn49Click(Sender: TObject);
begin
  inherited;
  if conta.vObs.Post then
  begin
    if conta.dataSet.FieldByName('cod_obs').AsInteger = 0 then
    begin
      conta.dataSet.Edit;
      conta.dataSet.FieldByName('cod_obs').AsInteger := conta.vObs.dataSet.FieldByName('cod_obs').AsInteger;
      conta.dataSet.Post;
      if not conta.Apply then
        conta.RollBackTransacao
      else
        conta.CommitaTransacao;
    end
    else
      conta.CommitaTransacao;
  end
  else
    setFocusCampoErro(conta.vObs.vNomeCampoErro);
end;

procedure TfrmCadContasAReceber.BitBtn4Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    conta.Sequencial := CheckCadSeq.Checked;
    vDadosIni.vDtSetTmp := cdsDesp;
    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(conta.buscas) then
      Exit;

    if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    	BitBtn4.SetFocus;

    if conta.Docs = 'S2' then
	    habilitarDesabilitarReplicacaoCredito(False);
    if not conta.post then
    begin
      if conta.Docs = 'S1' then
        PageControl3.ActivePage := tsCadastroCheque
      else
        PageControl3.ActivePage := tsCadastroCredito;
      setFocusCampoErro(conta.vNomeCampoErro, conta.vMensagemErro);
      if trim(conta.vNomeCampoErro) = 'DadosCartao' then
      	SpeedButtonInfDadosCartaoClick(Sender);
    end
    else
    begin
      if not cdsDesp.IsEmpty then
      	cdsDesp.EmptyDataSet;
      if conta.Docs = 'S2' then
      begin
        conta.dataSet.FieldByName('RAZAO').OnGetText := conta.dataSetNomeRazaoGetText;
        conta.dataSet.FieldByName('NOME_C').OnGetText := conta.dataSetNomeRazaoGetText;
      end;
      if CheckCadSeq.Checked then
      begin
        if conta.Insert then
        begin
          if conta.Docs = 'S1' then
            PageControl3.ActivePage := tsCadastroCheque
          else
            PageControl3.ActivePage := tsCadastroCredito;

          if conta.Docs = 'S1' then
          begin
            if (Self.Enabled) and (Self.Visible) and (DBEdit66.CanFocus) then
            	DBEdit66.SetFocus
            else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
            	DBEdit1.SetFocus
          end
          else
          begin
            if (Self.Enabled) and (Self.Visible) and (DBEdit65.CanFocus) then
            	DBEdit65.SetFocus
            else if (Self.Enabled) and (Self.Visible) and (DBEdit24.CanFocus) then
            	DBEdit24.SetFocus;
          end;

        end;
      end
      else
        inherited;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn50Click(Sender: TObject);
begin
  inherited;
  TForm(pnNSU.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn51Click(Sender: TObject);
begin
  inherited;
  if (conta.AdmConfCartao) and (conta.TerminalConfCartao) then
  begin
//    if conta.dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger > 0 then
       if trim(conta.dataSet.FieldByName('COD_TERMINAL_ADM').AsString) = '' then
       begin
         Application.MessageBox('Terminal Adm não informado', 'Atenção', MB_ICONWARNING + MB_OK);
         if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox12.CanFocus) then
         	 DBLookupComboBox12.SetFocus;
         exit;
       end;

//    if trim(conta.dataSet.FieldByName('COD_TERMINAL_ADM').AsString) <> '' then
       if conta.dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger <= 0 then
       begin
         Application.MessageBox('Bandeira não informada', 'Atenção', MB_ICONWARNING + MB_OK);
         if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox15.CanFocus) then
         	 DBLookupComboBox15.SetFocus;
         exit;
       end;

       if (conta.dataSet.FieldByName('NPARCELA').AsInteger > 0)
       	and (conta.dataSet.FieldByName('QTDE_PARC').AsInteger <= 0) then
         conta.dataSet.FieldByName('QTDE_PARC').AsInteger := conta.dataSet.FieldByName('NPARCELA').AsInteger;

       if (conta.dataSet.FieldByName('NPARCELA').AsInteger > 0)
       	and (conta.dataSet.FieldByName('QTDE_PARC').AsInteger > 0)
        and (conta.dataSet.FieldByName('NPARCELA').AsInteger > conta.dataSet.FieldByName('QTDE_PARC').AsInteger) then
       begin
         Application.MessageBox('Número da parcela não pode ser maior que a quantidade de parcela', 'Atenção', MB_ICONWARNING + MB_OK);
         if (Self.Enabled) and (Self.Visible) and (DBEdit61.CanFocus) then
         	 DBEdit61.SetFocus;
         exit;
       end;
  end;

  if (not conta.verificarNSUnumAutorizacao(
  	conta.dataSet.FieldByName('N_DOCNSU_ADM').AsString,
  	conta.dataSet.FieldByName('N_AUT_CART').AsString,
    conta.dataSet.FieldByName('NPARCELA').AsInteger,
    conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger,
    conta.dataSet.FieldByName('COD_CRED').AsInteger)) then
  begin
  	if Application.MessageBox(PChar('Já Existe(m) crédito(s) aberto(s) com o mesmo NSU, Número de Autorização e Parcela:' + #13 + #13 +
      'NSU: ' + trim(conta.dataSet.FieldByName('N_DOCNSU_ADM').AsString) + #13 +
      'Número de Autorização: ' + trim(conta.dataSet.FieldByName('N_AUT_CART').AsString) + #13 +
      'Parcela: ' + IntToStr(conta.dataSet.FieldByName('NPARCELA').AsInteger) + #13 + #13 +
      'Deseja continuar assim mesmo!'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
    begin
      if not vDadosIni.PesqPros('CAR105', 'PERMITIR',
      	'NSU ' + trim(conta.dataSet.FieldByName('N_DOCNSU_ADM').AsString) + ' ' +
        'Num Aut ' + trim(conta.dataSet.FieldByName('N_AUT_CART').AsString) + ' ' +
        'Parc ' + IntToStr(conta.dataSet.FieldByName('NPARCELA').AsInteger),
      	conta.Table, IntToStr(conta.dataSet.FieldByName('COD_CRED').AsInteger),
        conta.buscas, True) then
      begin
        Application.MessageBox(PChar('Já existe(m) crédito(s) em aberto(s) com o mesmo NSU, Número de Autorização e Número de Parcela:' + #13 + #13 +
          'NSU: ' + trim(conta.dataSet.FieldByName('N_DOCNSU_ADM').AsString) + #13 +
          'Número de Autorização: ' + trim(conta.dataSet.FieldByName('N_AUT_CART').AsString) + #13 +
          'Parcela: ' + IntToStr(conta.dataSet.FieldByName('NPARCELA').AsInteger) + #13 + #13 +
          'Favor verificar antes de continuar!'),
          'Atenção', MB_ICONWARNING + MB_OK);
        if (Self.Enabled) and (Self.Visible) and (DBEdit59.CanFocus) then
          DBEdit59.SetFocus;
        exit;
      end;
    end
    else
    	exit;
  end;

  if (conta.AdmConfCartao) and (conta.TerminalConfCartao) then
  	if (trim(conta.CodTermAdmCartao) <> '') and (conta.CodBandeiraCartao <> 0) then
      if (trim(conta.CodTermAdmCartao) <> trim(conta.dataSet.FieldByName('COD_TERMINAL_ADM').AsString))
        or (conta.CodBandeiraCartao <> conta.dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger)
        or (conta.QtdeParcelaCartao <> conta.dataSet.FieldByName('QTDE_PARC').AsInteger) then
          Application.MessageBox('Algumas informações do cartão foram alteradas,' +
            'a taxa do cartão será recalculada', 'Atenção', MB_ICONINFORMATION + MB_OK);

  TForm(pnNSU.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContasAReceber.BitBtn52Click(Sender: TObject);
begin
  inherited;
  TForm(pnPendenciasCartao.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn53Click(Sender: TObject);
begin
  inherited;
  TForm(pnPendenciasCartao.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContasAReceber.BitBtn54Click(Sender: TObject);
begin
  try
    inherited;
    if not vDadosIni.PesqPros('BOL010', 'IMPRIMIR BOLETO', '', 'BOLETO', '', conta.buscas, true) then
      Exit;

    conta._imprimirBoleto(false, ckUsarValorCorrGerarBoleto.Checked);
    conta.Refresh;
    TForm(pnImpressao.Parent).ModalResult := IDCANCEL;
  finally
    _GravaConfiguracoesBoolean(ckUsarValorCorrGerarBoleto.Name, ckUsarValorCorrGerarBoleto.Checked);
  end;
end;

procedure TfrmCadContasAReceber.BitBtn54KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn56.Click;
end;

procedure TfrmCadContasAReceber.BitBtn55Click(Sender: TObject);
begin
  inherited;
  _GravaConfiguracoesBoolean(conta.Docs + RadioButton1.Name, RadioButton1.Checked);
  _GravaConfiguracoesBoolean(conta.Docs + CheckBox10.Name, CheckBox10.Checked);
  _GravaConfiguracoesBoolean(conta.Docs + CheckBox11.Name, CheckBox11.Checked);
  _GravaConfiguracoesBoolean(conta.Docs + CheckBox16.Name, CheckBox16.Checked);
  _GravaConfiguracoesBoolean(conta.Docs + CheckBox17.Name, CheckBox17.Checked);
  _GravaConfiguracoesBoolean(conta.Docs + CheckBox12.Name, CheckBox12.Checked);
  _GravaConfiguracoesBoolean(conta.Docs + CheckBoxExibirVenda.Name, CheckBoxExibirVenda.Checked);
  if (vDadosIni.vEmp.vFinanceiroUnificado) and (CheckBox15.Enabled) and (CheckBox15.Visible) then
	  _GravaConfiguracoesBoolean(conta.Docs + CheckBox15.Name, CheckBox15.Checked);
  if RadioButton1.Checked then
    conta.dadosImpressao.tpImpressao := tiGrafico
  else
    conta.dadosImpressao.tpImpressao := tiMatricial;
  conta.dadosImpressao.vSomenteSel   := CheckBox10.Checked;
  conta.dadosImpressao.vComEndereco  := CheckBox11.Checked;
  conta.dadosImpressao.vComJuros     := CheckBox12.Checked;
  conta.dadosImpressao.vBandAdmnParc := CheckBox16.Checked;
  conta.dadosImpressao.vCodVendNome  := CheckBox17.Checked;
  conta.dadosImpressao.vExibirVenda  := CheckBoxExibirVenda.Checked;
  conta.dadosImpressao.vAgruparEmpUnf := ((CheckBox15.Checked) and (CheckBox15.Visible));
  TForm(pnImpressao.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContasAReceber.BitBtn56Click(Sender: TObject);
begin
  inherited;
  TForm(pnImpressao.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn57Click(Sender: TObject);
begin
  inherited;
  vNotasRet.removerDaLista;
end;

procedure TfrmCadContasAReceber.BitBtn58Click(Sender: TObject);
var
  vSomaGeral, vSomaSel: Extended;
begin
  inherited;
  if not vDadosIni.PesqPros('CAR085', 'SOMAR', '', 'LISTA_RETORNADAS', '', vNotasRet.buscas, True) then
    Exit;
  vSomaGeral := 0;
  vSomaSel := 0;
  vNotasRet.dataSet.First;
  while not vNotasRet.dataSet.eof do
  begin
    vSomaGeral := vSomaGeral +  vNotasRet.dataSet.FieldByName('valor_total').AsFloat;
    if gridListaMercadoriasRet.SelectedRows.CurrentRowSelected then
      vSomaSel := vSomaSel +  vNotasRet.dataSet.FieldByName('valor_total').AsFloat;

    vNotasRet.dataSet.Next;
  end;
  Application.MessageBox(pchar('Soma dos registros:' + #13 +
    'Soma Geral................: ' + Format('%8.2n', [vSomaGeral]) + #13 +
    'Soma Selecionados..: ' + Format('%8.2n', [vSomaSel])), 'Atenção', 0+ 64);
end;

procedure TfrmCadContasAReceber.BitBtn59Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('CAR086', 'EXPORTAR', '', 'LISTA_RETORNADAS', '', vNotasRet.buscas, True) then
    Exit;
  vDadosIni.montarExcel(gridListaMercadoriasRet, 'Lista Mercadorias Retornadas');
end;

procedure TfrmCadContasAReceber.BitBtn5Click(Sender: TObject);
begin
  if conta.Docs = 'S2' then
  begin
    conta.dataSet.FieldByName('RAZAO').OnGetText := conta.dataSetNomeRazaoGetText;
    conta.dataSet.FieldByName('NOME_C').OnGetText := conta.dataSetNomeRazaoGetText;
  end;
  if not cdsDesp.IsEmpty then
    cdsDesp.EmptyDataSet;
  conta.Cancel;
  vDadosIni.GravaAuditoria('CAR029', 'CANCELAR', '', conta.Table, '', conta.buscas);
  inherited;
end;

procedure TfrmCadContasAReceber.BitBtn60Click(Sender: TObject);
begin
  inherited;
  TForm(pnListaRetornos.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn61Click(Sender: TObject);
begin
  inherited;
  vNotasRet.marcarMercadoriaParaBaixa(False, conta.dataSet.FieldByName('valor_c').AsFloat);
end;

procedure TfrmCadContasAReceber.BitBtn62Click(Sender: TObject);
begin
  inherited;
  vNotasRet.marcarMercadoriaParaBaixa(True, conta.dataSet.FieldByName('valor_c').AsFloat);
end;

procedure TfrmCadContasAReceber.BitBtn63Click(Sender: TObject);
begin
  inherited;
  try
    vDadosIni.abreStatusProcessamento('Impressão de recibo', 'Processando informações...');
    if conta.vReceb.vRecibo.dataSet.FieldByName('NRECIBO').AsInteger > 0 then
    begin
      vDadosIni.vPesquisa := 'IMPRIMIRRECIBO|' +  IntToStr(conta.vReceb.vRecibo.dataSet.FieldByName('NRECIBO').AsInteger) + '|';
      if conta._mdiAberto('pkRecibo', 'TFrmCadRecibo') then
      	conta.abreFormRecibo;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn64Click(Sender: TObject);
begin
  inherited;
  if trim(conta.dataSet.FieldByName('N_DOC_C').AsString) = '' then
  begin
    Application.MessageBox('Número do documento não informado, favor informar antes de continuar', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBEdit34.CanFocus) then
    	DBEdit34.SetFocus;
    Exit;
  end;

  if conta.dataSet.FieldByName('DATA_VENC_C').AsFloat <= 0 then
  begin
    Application.MessageBox('Data de Vencimento não informado, favor informar antes de continuar', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBEdit36.CanFocus) then
    	DBEdit36.SetFocus;
    Exit;
  end;

  if conta.dataSet.FieldByName('VALOR_C').AsFloat <= 0 then
  begin
    Application.MessageBox('Valor do documento não informado, favor informar antes de continuar', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBEdit37.CanFocus) then
    	DBEdit37.SetFocus;
    Exit;
  end;
  if not vDadosIni.vContrapartida then
  begin
  	  if not conta.vReceb.vCr.abreFormParcelamentoContas(conta.FContas, true) then
       exit;
  end
  else
  begin
     if not conta.abreFormParcelamentoContas(conta.FContas, true) then
      exit;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn65Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.vContrapartida then
  begin
    if not conta.vReceb.vCr.apagarContas then
      exit;

    conta.vReceb.vCr.ApagarContasPagarTemp(cdsDesp);
  end
  else
  begin
    if not conta.apagarContas then
      exit;

    conta.ApagarContasPagarTemp(cdsDesp);
  end;
end;

procedure TfrmCadContasAReceber.BitBtn66Click(Sender: TObject);
var
  vValorParcelas: Double;
  I: Integer;
begin
  inherited;
  vValorParcelas := 0;

  if (Length(conta.FContas.numeroDocumento) > 0) and (cdsDesp.IsEmpty) then
    btGerarClick(Sender);

  for I := 0 to Length(conta.FContas.numeroDocumento) - 1 do
    vValorParcelas := vValorParcelas + conta.FContas.valorDocumento[I];

  if (vDadosIni.StrToFloatFormat(vValorParcelas, 2) > 0) and (vDadosIni.StrToFloatFormat(vValorParcelas, 2) <>  vDadosIni.StrToFloatFormat(EditHw3.AsValue, 2)) then
  begin
   Application.MessageBox(Pchar('Valor total das parcelas difere do valor do crédito' + #13 +
   	'Valor total do parcelamento: R$ ' + FormatFloat('0.00', vValorParcelas) + #13 +
      'Valor do crédito: R$ ' + FormatFloat('0.00', EditHw3.AsValue) + #13 +
      'Favor conferir!'), 'Aviso', MB_OK + MB_ICONEXCLAMATION + MB_DEFBUTTON1);
     exit;
  end;

  BitBtn66.Enabled := true;
  BitBtn67.Enabled := true;
  btGerar.Enabled := true;
  btApagarDesp.Enabled := true;

  TForm(pnFaturaRec.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContasAReceber.BitBtn67Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja cancelar parcelamento?', 'Atenção',  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
   exit;

  try
    btApagarDespClick(Sender);
    TForm(pnFaturaRec.Parent).ModalResult := IDCANCEL;
  finally
    btAlterarFaturaEntrada.Enabled := True;
    ListBox3.Enabled := True;
    Panel71.Visible := False;

    BitBtn66.Enabled := true;
    BitBtn67.Enabled := true;
    btGerar.Enabled := true;
    btApagarDesp.Enabled := true;
  end;
end;

procedure TfrmCadContasAReceber.BitBtn68Click(Sender: TObject);
begin
  try
    inherited;
    if not vDadosIni.PesqPros('BOL010', 'IMPRIMIR BOLETO', '', 'BOLETO', '', conta.buscas, true) then
      Exit;

    conta._imprimirBoleto;
    conta.Refresh;
    TForm(pnImpressao.Parent).ModalResult := IDCANCEL;
  finally
    _GravaConfiguracoesBoolean(ckUsarValorCorrGerarBoleto.Name, ckUsarValorCorrGerarBoleto.Checked);
  end;
end;

procedure TfrmCadContasAReceber.BitBtn68KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if Key = VK_ESCAPE then
    BitBtn68.Click;
end;

procedure TfrmCadContasAReceber.BitBtn69Click(Sender: TObject);
begin
  inherited;
	TForm(pnDataPrevRec.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn69KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_ESCAPE then
    TForm(pnDataPrevRec.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.BitBtn76Click(Sender: TObject);
begin
  inherited;
	conta.vCtrl._abreTodosControlesCAR(conta.Docs, 'S', conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger);
end;

procedure TfrmCadContasAReceber.BitBtn7Click(Sender: TObject);
begin
  inherited;
  TForm(pnHistorico.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContasAReceber.BitBtn8Click(Sender: TObject);
begin
  inherited;
  // Financeiro sendo fechado
  if vDadosIni.financeiroFechando(conta.buscas) then
    Exit;
  if not vDadosIni.VerificarinicioFechFinan(conta.buscas) then
    exit;

  TForm(pnMudaControleOuVoltaParaAtivo.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContasAReceber.BitBtn9Click(Sender: TObject);
begin
  inherited;
  TForm(pnMudaControleOuVoltaParaAtivo.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.btAlterarFaturaEntradaClick(Sender: TObject);
begin
  try
    edDocFaturaEntrada.Text := conta.FContas.numeroDocumento[ListBox3.ItemIndex];
    edVencimentoFaturaEntrada.Text := conta.FContas.vencimentoDocumento[ListBox3.ItemIndex];
    edValorFaturaEntrada.AsValue := conta.FContas.valorDocumento[ListBox3.ItemIndex];
    Panel71.Visible := true;

    if (Self.Enabled) and (Self.Visible) and (edDocFaturaEntrada.CanFocus) then
    	edDocFaturaEntrada.SetFocus;
    btAlterarFaturaEntrada.Enabled := false;
    ListBox3.Enabled := false;

    BitBtn66.Enabled := false;
    BitBtn67.Enabled := false;
    btGerar.Enabled := false;
    btApagarDesp.Enabled := false;
  except
    Application.MessageBox('Selecione a parcela', 'Atenção', mb_ok + MB_ICONINFORMATION);
  end;
end;

procedure TfrmCadContasAReceber.btApagarDespClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.vContrapartida then
  begin
    if not conta.vReceb.vCr.apagarContas then
      exit;

    conta.vReceb.vCr.ApagarContasPagarTemp(cdsDesp);
  end
  else
  begin
    if not conta.apagarContas then
      exit;

    conta.ApagarContasPagarTemp(cdsDesp);
  end;
end;

procedure TfrmCadContasAReceber.btContinuarHistSaidaDevClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if ck_motivo_dev.Checked then    
      if StrLength(ed_motivo_dev.Text) = 0 then
      begin
        if ShowConfirmacao('Motivo não preenchido. Continuar?') <> IDYES then
          Exit;
      end
      else if StrLength(ed_motivo_dev.Text) < 15 then
        if ShowConfirmacao('Motivo com menos de 15 caracteres. Continuar?') <> IDYES then
          Exit;

    conta.dadosReceber.historicoSaidaLancamento := lbTextoHistSaidaDev.Caption;
    conta.dadosReceber.historicoDevolucao       := IfThen(ck_motivo_dev.Checked, Trim(ed_motivo_dev.Text)); 

    _GravaConfiguracoesBoolean(conta.Docs + ckHistSaidaDev.Name, ckHistSaidaDev.Checked);

    TForm(pnDadosBaixaDevolv.Parent).ModalResult := IDOK;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.btDataRealBaixaClick(Sender: TObject);
begin
  inherited;
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;

    conta._informarDataRealBaixa;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.btDocumentosOrigemDocClick(Sender: TObject);
begin
  inherited;
  if DBGridDocumentosOrigem.DataSource.DataSet.IsEmpty then
    Exit;

  try
    Screen.Cursor := crHourGlass;
    vDadosIni.vPesquisa := 'PEDVENDA_FICHAPRODUTO|' + Trim(DBGridDocumentosOrigem.DataSource.DataSet.FieldByName('TIPO').AsString) + '|' + IntToStr(DBGridDocumentosOrigem.DataSource.DataSet.FieldByName('NPED').AsInteger) + '|';
    vDadosIni.vNomeForm := 'FrmCadPedVenda';
    vDadosIni.abreFormCadastro('pkPedidoVenda', 'TFrmCadPedVenda', True, 'Formulário de Pedido de Venda ou Ordem de Serviço já aberto. Feche que tente novamente', 'NAME');
  finally
    vDadosIni.vPesquisa := '';
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.btDocumentosOrigemVoltarClick(Sender: TObject);
begin
  inherited;
  TForm(pnDocumentosOrigem.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.btGerarClick(Sender: TObject);
begin
  inherited;
  if not vDadosIni.vContrapartida then
  begin
    conta.vReceb.vCr.ApagarContasPagarTemp(cdsDesp);
    if not conta.vReceb.vCr.gerarContas(conta.FContas) then
     exit;

    conta.vReceb.vCr.GravarContasPagarTemp(conta.FContas, cdsDesp);
  end
  else
  begin
    conta.ApagarContasPagarTemp(cdsDesp);
    if not conta.gerarContas(conta.FContas) then
     exit;

    conta.GravarContasPagarTemp(conta.FContas, cdsDesp);
  end;
end;

procedure TfrmCadContasAReceber.btSalvarFaturaEntradaClick(Sender: TObject);
var
  vIndex:Integer;
begin
  inherited;
  try
    vIndex := ListBox3.ItemIndex;
    getFaturas;
    ListBox3.ItemIndex := vIndex;
  finally
    if not vDadosIni.vContrapartida then
      conta.vReceb.vCr.GravarContasPagarTemp(conta.FContas, cdsDesp)
    else
      conta.GravarContasPagarTemp(conta.FContas, cdsDesp);
    btAlterarFaturaEntrada.Enabled := True;
    ListBox3.Enabled := True;
    Panel71.Visible := False;

    BitBtn66.Enabled := true;
    BitBtn67.Enabled := true;
    btGerar.Enabled := true;
    btApagarDesp.Enabled := true;
  end;
end;

procedure TfrmCadContasAReceber.btSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    conta.checkUnCheckAllRows(True);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.btUnSelectAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    conta.checkUnCheckAllRows(False);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.btVisualizarComprovanteClick(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    if not conta.visualizarComprovanteCartao then
    	exit;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.bt_alt_data_prev_rec2Click(Sender: TObject);
begin
  inherited;
	if vDadosIni.PesqPros('CAR108', 'HABILITAR', 'NUM CRED ' +
    conta.dataSet.FieldByName('N_DOC_C').AsString + ' DATA: ' + DBEdit27.Text,
    'CONTROLE_CREDITOS', conta.dataSet.FieldByName('COD_CRED').AsString, conta.buscas, True) then
  begin
    DBEdit71.Enabled                 := True;
    bt_limpar_data_prev_rec2.Visible := True;
    bt_alt_data_prev_rec2.Visible    := False;
    if (Self.Enabled) and (Self.Visible) and (DBEdit71.CanFocus) then
    	DBEdit71.SetFocus;
  end;
end;

procedure TfrmCadContasAReceber.bt_alt_data_prev_recClick(Sender: TObject);
begin
  inherited;
	if vDadosIni.PesqPros('CAR107', 'HABILITAR', 'NUM CH ' +
    conta.dataSet.FieldByName('N_CH').AsString + ' DATA: ' + DBEdit3.Text,
    'CONTROLE_CHEQUE', conta.dataSet.FieldByName('CODIGO_CH').AsString, conta.buscas, True) then
  begin
  	DBEdit70.Enabled                 := True;
    bt_limpar_data_prev_rec.Visible  := True;
    bt_alt_data_prev_rec.Visible     := False;
    if (Self.Enabled) and (Self.Visible) and (DBEdit70.CanFocus) then
    	DBEdit70.SetFocus;
  end;
end;

procedure TfrmCadContasAReceber.bt_limpar_data_prev_rec2Click(Sender: TObject);
begin
  inherited;
  DBEdit71.Field.AsString := FormatDateTime('DD/MM/YYYY', Date);
  Perform(WM_NEXTDLGCTL, 0, 0);
  DBEdit71.Field.Clear;
end;

procedure TfrmCadContasAReceber.bt_limpar_data_prev_recClick(Sender: TObject);
begin
  inherited;
	DBEdit70.Field.AsString := FormatDateTime('DD/MM/YYYY', Date);
  Perform(WM_NEXTDLGCTL, 0, 0);
  DBEdit70.Field.Clear;
end;

procedure TfrmCadContasAReceber.CheckBox14Click(Sender: TObject);
begin
  inherited;
  if CheckBox14.Checked then
    vNotasRet.abreNotasMercadorias(0,0,0)
  else
    vNotasRet.abreNotasMercadorias(conta.dataSet.FieldByName('cod_cliente').AsInteger, conta.dataSet.FieldByName('COD_CRED').AsInteger, conta.dataSet.FieldByName('cod_emp_mult').AsInteger);
  GroupBox15.Visible := not CheckBox14.Checked;
end;

procedure TfrmCadContasAReceber.ckHistSaidaDevClick(Sender: TObject);
begin
  inherited;
  lbTextoHistSaidaDev.Caption := conta.dadosReceber.historicoSaidaLancamento;
  if ckHistSaidaDev.Checked then
    lbTextoHistSaidaDev.Caption := conta.dadosReceber.historicoSaidaLancamento + ' ' +
      conta.dadosReceber.nomeHistoricoSaida;
end;

procedure TfrmCadContasAReceber.ck_motivo_devClick(Sender: TObject);
begin
  inherited;
  ed_motivo_dev.Enabled := ck_motivo_dev.Checked;  
end;

procedure TfrmCadContasAReceber.CheckBox1Click(Sender: TObject);
begin
	if CheckBox1.Checked then
  begin
    groupAdicional.visible := true;
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
//  groupAdicional.Visible := CheckBox1.Checked;
  GroupBox3Enter(GroupBox3);
//
//  if CheckBox1.Checked then
//  	if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
//    	ComboBox11.SetFocus;
end;

procedure TfrmCadContasAReceber.CheckBox5Click(Sender: TObject);
begin
  inherited;

  Edit5.Text := conta.dadosReceber.historicoSaidaLancamento;
  if CheckBox5.Checked then
    Edit5.Text := conta.dadosReceber.historicoSaidaLancamento + ' ' +
      conta.dadosReceber.nomeHistoricoSaida;

end;

procedure TfrmCadContasAReceber.ckbEmLoteClick(Sender: TObject);
begin
  inherited;
  ckbCodigoMV.Enabled := ckbEmLote.Checked;
  if not ckbCodigoMV.Enabled then
    ckbCodigoMV.Checked := False;
  rbValorVenda.Enabled := not ckbEmLote.Checked;
  if not rbValorVenda.Enabled then
  begin
    rbValorVenda.Checked := False;
    rbValorParcela.Checked := True;
  end;
end;

procedure TfrmCadContasAReceber.ckbReplAlterarNumQdeParcelaCadastroClick(
  Sender: TObject);
begin
	if ckbReplAlterarNumQdeParcelaCadastro.Checked then
  	ckbReplNaoAlterarNumQdeParcelaCadastro.Checked := False
  else
  	ckbReplNaoAlterarNumQdeParcelaCadastro.Checked := True;
end;

procedure TfrmCadContasAReceber.ckbReplAlterarNumQdeParcelaClick(
  Sender: TObject);
begin
	if ckbReplAlterarNumQdeParcela.Checked then
  	ckbReplNaoAlterarNumQdeParcela.Checked := False
  else
  	ckbReplNaoAlterarNumQdeParcela.Checked := True;
end;

procedure TfrmCadContasAReceber.ckbReplNaoAlterarNumQdeParcelaCadastroClick(
  Sender: TObject);
begin
  if ckbReplNaoAlterarNumQdeParcelaCadastro.Checked then
  	ckbReplAlterarNumQdeParcelaCadastro.Checked := False
  else
  	ckbReplAlterarNumQdeParcelaCadastro.Checked := True;
end;

procedure TfrmCadContasAReceber.ckbReplNaoAlterarNumQdeParcelaClick(
  Sender: TObject);
begin
	if ckbReplNaoAlterarNumQdeParcela.Checked then
  	ckbReplAlterarNumQdeParcela.Checked := False
  else
  	ckbReplAlterarNumQdeParcela.Checked := True;
end;

procedure TfrmCadContasAReceber.ComboBox11Exit(Sender: TObject);
var
  I: Integer;
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

procedure TfrmCadContasAReceber.ComboBox12Exit(Sender: TObject);
begin
  inherited;
  TComboBox(Sender).Text := TComboBox(Sender).Items[TComboBox(Sender).ItemIndex];

  if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
end;

procedure TfrmCadContasAReceber.dbCheckClick(Sender: TObject);
begin
  inherited;
  Perform(WM_NEXTDLGCTL, 0, 0)
end;

procedure TfrmCadContasAReceber.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if not conta._permitirAlterarDataVencimento then
    if (Self.Enabled) and (Self.Visible) and (DBEdit11.CanFocus) then
      DBEdit11.SetFocus;
end;

procedure TfrmCadContasAReceber.DBEdit12Exit(Sender: TObject);
begin
  inherited;
  if conta.dataSet.State in [dsInsert, dsEdit] then
    if conta.Docs = 'S1' then
      conta.dataSet.FieldByName('vl_contabil').AsFloat := conta.dataSet.FieldByName('valor_ch').AsFloat
    else
      conta.dataSet.FieldByName('vl_contabil').AsFloat := conta.dataSet.FieldByName('valor_c').AsFloat;

  if ((conta.Docs = 'S2') and (conta.Recebendo)) then
  begin
    if ((vValorRec > 0) and (vValorRec <> conta.dataSet.FieldByName('valor_c').AsFloat) and (Length(conta.FContas.numeroDocumento) > 0)) then
    begin
      Edit14.Text := conta.dataSet.FieldByName('N_DOC_C').AsString;
      EditHw3.AsValue := conta.dataSet.FieldByName('VALOR_C').AsFloat;
      btGerarClick(Sender);
    end;
    vValorRec := conta.dataSet.FieldByName('valor_c').AsFloat;
  end;
end;

procedure TfrmCadContasAReceber.DBEdit13Enter(Sender: TObject);
begin
  inherited;
  DBEdit13.Tag := 1;
end;

procedure TfrmCadContasAReceber.DBEdit13Exit(Sender: TObject);
var
  vOK: Boolean;
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or
    (ActiveControl = BitBtn31) then
    Exit;

  if not conta._clienteValido then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit13.CanFocus) then
      DBEdit13.SetFocus;
  end
  else
  begin
    DBEdit14.ReadOnly := (conta.dataSet.FieldByName('cod_cliente').AsInteger > 0);

    if (Trim(conta.dataSet.FieldByName('agencia').AsString) = '') and
      (Trim(conta.dataSet.FieldByName('conta').AsString) = '') and
      (Trim(conta.dataSet.FieldByName('banco').AsString) = '') then
    begin
      conta.vContabanc._abreContasBancarias(conta.dataSet.FieldByName('cod_cliente').AsInteger, conta.dataSet.FieldByName('cod_emp_mult').AsInteger);

      vOK := False;
      if conta.vContabanc.dataSet.RecordCount > 1 then
        spbContasBancarias.Click
      else if conta.vContabanc.dataSet.RecordCount = 1 then
        if conta.dataSet.State in [dsInsert, dsEdit] then
        begin
          conta.dataSet.FieldByName('agencia').AsString :=
            conta.vContabanc.dataSet.FieldByName('agencia').AsString;
          conta.dataSet.FieldByName('conta').AsString :=
            conta.vContabanc.dataSet.FieldByName('conta').AsString;
          conta.dataSet.FieldByName('id_banco').AsString :=
            conta.vContabanc.dataSet.FieldByName('codbanco').AsString;
          conta.dataSet.FieldByName('banco').AsString :=
            conta.vContabanc.dataSet.FieldByName('banco').AsString;
        end;

    end;
  end;
  DBEdit13.Tag := 0;
end;

procedure TfrmCadContasAReceber.DBEdit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if conta.dataSet.State in [dsInsert, dsEdit] then
    if Key = VK_F3 then
    begin
      try
        vDadosIni.vPesquisaCodEmpresa := conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger;
        vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('CLIENTES'));
      finally
        vDadosIni.vPesquisaCodEmpresa := 0;
      end;
      if vDadosIni.vPesquisa <> '' then
      begin
        conta.dataSet.FieldByName('COD_CLIENTE').AsInteger := StrToInt(vDadosIni.vPesquisa);
        conta._clienteValido;
      end;
    end;
end;

procedure TfrmCadContasAReceber.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if not conta._clienteTerceiroValido then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit16.CanFocus) then
      DBEdit16.SetFocus;
  end
  else
    DBEdit17.ReadOnly := (conta.dataSet.FieldByName('COD_CLI_TERC').AsInteger > 0);
end;

procedure TfrmCadContasAReceber.DBEdit16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if conta.dataSet.State in [dsInsert, dsEdit] then
    if Key = VK_F3 then
    begin
      try
        vDadosIni.vPesquisaCodEmpresa := conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger;
        vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('CLIENTES'));
      finally
        vDadosIni.vPesquisaCodEmpresa := 0;
      end;
      if vDadosIni.vPesquisa <> '' then
      begin
        conta.dataSet.FieldByName('COD_CLI_TERC').AsInteger := StrToInt(vDadosIni.vPesquisa);
        conta._clienteValido;
      end;
    end;
end;

procedure TfrmCadContasAReceber.DBEdit18Exit(Sender: TObject);
begin
  inherited;
  if (conta._controleValido) and (conta.Docs = 'S2') then
    if (DBEdit31.DataSource.DataSet.State in [dsedit, dsInsert]) then
      DBEdit31.DataSource.DataSet.FieldByName(DBEdit31.DataField).AsString :=
        DBLookupComboBox5.ListSource.DataSet.FieldByName(DBLookupComboBox5.ListField).AsString;

  Label52.Visible := conta.Vale;
  DBEdit46.Visible := conta.Vale;
end;

procedure TfrmCadContasAReceber.DBEdit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
  	try
      vDadosIni.vPesquisaCodEmpresa := vDadosIni.cod_empresa;
      vDadosIni.codEmpresa := IntToStr(conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger);
      vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('CONTROLES',
      	' and (coalesce(controle_visivel, ''S'') = ''S'') ' +
        ' and docs = ''S1'' ', 'Consulta de Controles '));
    finally
    	vDadosIni.codEmpresa := IntToStr(vDadosIni.vPesquisaCodEmpresa);
      vDadosIni.vPesquisaCodEmpresa := 0;
    end;
    if (Trim(vDadosIni.vPesquisa) = '') then
    	vDadosIni.vPesquisa := '0';
    conta.dataSet.FieldByName('CODIGO_CTRL').AsInteger := StrToInt(vDadosIni.vPesquisa);
  end
end;

procedure TfrmCadContasAReceber.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  Edit11.Text := vDadosIni.retornaDescricaoTipoNumConta('E', conta.vPCont.dataSet.FieldByName('TIPO_CTP').AsString);
end;

procedure TfrmCadContasAReceber.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''E'' ',
      'Consulta do Plano de Contas'));
    if vDadosIni.vPesquisa <> '' then
      if conta.dataSet.State in [dsInsert, dsEdit] then
        conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat := StrToFloatDef(
          vDadosIni.vPesquisa, conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat);
  end
  else if Key = VK_F4 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS_CONTABIL'));
    if vDadosIni.vPesquisa <> '' then
    begin
      vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
        ' and P_CONTAS.COD_CTA_CONTABIL = ' + QuotedStr(vDadosIni.vPesquisa) +
        ' and P_CONTAS.TIPO_PLC = ''E'' ',
        'Plano de contas Conta Contabil = ' + vDadosIni.vPesquisa));
      if conta.dataSet.State in [dsInsert, dsEdit] then
        conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat := StrToFloatDef(
          vDadosIni.vPesquisa, conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat);
    end;
  end;
end;

procedure TfrmCadContasAReceber.DBEdit22Exit(Sender: TObject);
begin
  inherited;
  if DBEdit22.Field.AsFloat <= 0 then
  begin
    Application.MessageBox('Nº da Conta não informada.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBEdit22.CanFocus) then
      DBEdit22.SetFocus;
    Exit;
  end;

  if not conta.verificarConta('E', DBEdit22.Field.AsFloat) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit22.CanFocus) then
      DBEdit22.SetFocus;
    Exit;
  end;

  if not (conta.dataSet.State in [dsInsert, dsEdit]) then
   exit;

  if (conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat <> conta.dadosReceber.numContaTemp)
   and (conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat <> conta.dadosReceber.numContaVendaProd) then
  begin
      if (trim(conta.dataSet.FieldByName('HISTORICO_L').AsString) =
        trim(conta.vPCont.dataSet.FieldByName('DESC_PLC').AsString)) then
         exit;

      if Application.MessageBox(pchar('Deseja atualizar o histórico do lançamento?'),
        'Atenção',  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) <> IDYES then
      begin
        conta.dadosReceber.numContaTemp := conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat;
        exit;
      end;

      conta.dataSet.FieldByName('HISTORICO_L').AsString :=
      	trim(conta.vPCont.dataSet.FieldByName('DESC_PLC').AsString);
  end
  else
  begin
    if (conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat = conta.dadosReceber.numContaTemp) then
      exit;
      
  	conta.dataSet.FieldByName('HISTORICO_L').AsString :=
      	'ENTRADA DINHEIRO CONFORME CREDITO ACIMA';
        
    if vDadosIni.vEmp.vFinanceiroUnificado then
      conta.dataSet.FieldByName('HISTORICO_L').AsString :=
      	conta.dataSet.FieldByName('HISTORICO_L').AsString +
        ' EMP: ' + vDadosIni.StrZero(conta.dadosReceber.codigoUnificada, 3);
  end;
        
  conta.dadosReceber.numContaTemp := conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat;
end;

procedure TfrmCadContasAReceber.DBEdit24Exit(Sender: TObject);
begin
  inherited;
  Edit9.Text := vDadosIni.retornaDescricaoTipoNumConta('E', conta.vPCont.dataSet.FieldByName('TIPO_CTP').AsString);

  if not conta.vPCont.verificarConta('E', conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat) then
    Exit;
end;

procedure TfrmCadContasAReceber.DBEdit24KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
    	' and P_CONTAS.TIPO_PLC = ''E'' ',
      'Consulta do Plano de Contas'));
    if vDadosIni.vPesquisa <> '' then
      if conta.dataSet.State in [dsInsert, dsEdit] then
        conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat := StrToFloatDef(
          vDadosIni.vPesquisa, conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat);
  end
  else if Key = VK_F4 then
  begin
    vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS_CONTABIL'));
    if vDadosIni.vPesquisa <> '' then
    begin
      vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('P_CONTAS',
        ' and P_CONTAS.COD_CTA_CONTABIL = ' + QuotedStr(vDadosIni.vPesquisa) +
        ' and P_CONTAS.TIPO_PLC = ''E'' ',
        'Plano de contas Conta Contabil = ' + vDadosIni.vPesquisa));
      if conta.dataSet.State in [dsInsert, dsEdit] then
        conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat := StrToFloatDef(
          vDadosIni.vPesquisa, conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat);
    end;
  end;
end;

procedure TfrmCadContasAReceber.DBEdit27Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if not conta._dataRecebimentoValida then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit27.CanFocus) then
      DBEdit27.SetFocus;
  end
  else if (DBEdit27.DataSource.DataSet.State = dsEdit) and (not conta.Recebendo) then
    DBEdit27.Enabled := False;
end;

procedure TfrmCadContasAReceber.DBEdit28KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn11.Click;
end;

procedure TfrmCadContasAReceber.DBEdit33Exit(Sender: TObject);
begin
  inherited;
  conta.vCl._selecionaCliente(conta.vContabanc.dataSet.FieldByName('cod_cliente').AsInteger, conta.dataSet.FieldByName('cod_emp_mult').AsInteger);
end;

procedure TfrmCadContasAReceber.DBEdit33KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      vDadosIni.vPesquisaCodEmpresa := conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger;
      vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('CLIENTES'));
    finally
      vDadosIni.vPesquisaCodEmpresa := 0;
    end;
    if vDadosIni.vPesquisa <> '' then
      conta.vContabanc.dataSet.FieldByName('COD_CLIENTE').AsInteger :=
        StrToInt(vDadosIni.vPesquisa);
  end;
end;

procedure TfrmCadContasAReceber.DBEdit34Exit(Sender: TObject);
begin
  inherited;
  if ((conta.Docs = 'S2') and (conta.Recebendo)) then
  begin
    if ((trim(vNumDoc) <> '') and (trim(vNumDoc) <> trim(conta.dataSet.FieldByName('N_DOC_C').AsString)) and (Length(conta.FContas.numeroDocumento) > 0)) then
    begin
      Edit14.Text := conta.dataSet.FieldByName('N_DOC_C').AsString;
      EditHw3.AsValue := conta.dataSet.FieldByName('VALOR_C').AsFloat;
      btGerarClick(Sender);
    end;
    vNumDoc := conta.dataSet.FieldByName('N_DOC_C').AsString;
  end;
end;

procedure TfrmCadContasAReceber.DBEdit36Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if not conta._permitirAlterarDataVencimento then
    if (Self.Enabled) and (Self.Visible) and (DBEdit36.CanFocus) then
      DBEdit36.SetFocus;

  if ((conta.Docs = 'S2') and (conta.Recebendo)) then
  begin
    if ((vDataVenc > 0) and (vDataVenc <> conta.dataSet.FieldByName('DATA_VENC_C').AsDateTime) and (Length(conta.FContas.numeroDocumento) > 0)) then
    begin
      Edit14.Text := conta.dataSet.FieldByName('N_DOC_C').AsString;
      EditHw3.AsValue := conta.dataSet.FieldByName('VALOR_C').AsFloat;
      btGerarClick(Sender);
    end;
    vDataVenc := conta.dataSet.FieldByName('DATA_VENC_C').AsDateTime;
  end;
end;

procedure TfrmCadContasAReceber.DBEdit38Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if not conta._clienteValido then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit38.CanFocus) then
      DBEdit38.SetFocus;
  end
  else
    DBEdit39.ReadOnly := (conta.dataSet.FieldByName('cod_cliente').AsInteger > 0);
end;

procedure TfrmCadContasAReceber.DBEdit38KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if conta.dataSet.State in [dsInsert, dsEdit] then
    if Key = VK_F3 then
    begin
      try
        vDadosIni.vPesquisaCodEmpresa := conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger;
        vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('CLIENTES'));
      finally
        vDadosIni.vPesquisaCodEmpresa := 0;
      end;
      if vDadosIni.vPesquisa <> '' then
      begin
        conta.dataSet.FieldByName('COD_CLIENTE').AsInteger := StrToInt(vDadosIni.vPesquisa);
        conta._clienteValido;
      end;
    end;
end;

procedure TfrmCadContasAReceber.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if not conta._dataRecebimentoValida then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
      DBEdit3.SetFocus;
  end
  else if (DBEdit3.DataSource.DataSet.State = dsEdit) and (not conta.Recebendo) then
    DBEdit3.Enabled := False;

end;

procedure TfrmCadContasAReceber.DBEdit41Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if not conta._clienteTerceiroValido then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit41.CanFocus) then
      DBEdit41.SetFocus;
  end
  else
    DBEdit42.ReadOnly := (conta.dataSet.FieldByName('COD_CLI_TERC').AsInteger > 0);
end;

procedure TfrmCadContasAReceber.DBEdit43KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
  	try
      vDadosIni.vPesquisaCodEmpresa := vDadosIni.cod_empresa;
      vDadosIni.codEmpresa := IntToStr(conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger);
      vDadosIni.vPesquisa := Trim(vDadosIni.pesquisaRapida('CONTROLES',
      	' and (coalesce(controle_visivel, ''S'') = ''S'') ' +
        ' and docs = ''S2'' ', 'Consulta de Controles '));
    finally
    	vDadosIni.codEmpresa := IntToStr(vDadosIni.vPesquisaCodEmpresa);
      vDadosIni.vPesquisaCodEmpresa := 0;
    end;
    if (Trim(vDadosIni.vPesquisa) = '') then
    	vDadosIni.vPesquisa := '0';
    conta.dataSet.FieldByName('CODIGO_CTRL').AsInteger := StrToInt(vDadosIni.vPesquisa);
  end
end;

procedure TfrmCadContasAReceber.DBEdit51Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn16) and (ActiveControl <> BitBtn29) then
    if DBEdit51.DataSource.DataSet.FieldByName(DBEdit51.DataField).AsDateTime >
      (vDadosIni.diaFFinanceiro + 1) then
    begin
      Application.MessageBox('Data ainda não programada', 'Atenção', 0 + 64);
      if (Self.Enabled) and (Self.Visible) and (DBEdit51.CanFocus) then
      	DBEdit51.SetFocus;
    end;
end;

procedure TfrmCadContasAReceber.DBEdit52Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn16) and (ActiveControl <> BitBtn29) then
    if DBEdit52.DataSource.DataSet.FieldByName(DBEdit52.DataField).AsDateTime >
      (vDadosIni.diaFFinanceiro + 1) then
    begin
      Application.MessageBox('Data ainda não programada', 'Atenção', 0 + 64);
      if (Self.Enabled) and (Self.Visible) and (DBEdit52.CanFocus) then
      	DBEdit52.SetFocus;
    end;
end;

procedure TfrmCadContasAReceber.DBEdit55Exit(Sender: TObject);
begin
  inherited;
  if DBEdit56.DataSource.DataSet.State in [dsInsert, dsEdit] then
    DBEdit56.DataSource.DataSet.FieldByName(DBEdit56.DataField).AsFloat :=
      DBEdit55.DataSource.DataSet.FieldByName(DBEdit55.DataField).AsFloat;
end;

procedure TfrmCadContasAReceber.DBEdit65Exit(Sender: TObject);
var
 vTemp: string;
begin
 if (conta.Recebendo) then
   exit;

 if vDadosIni.vEmp.vFinanceiroUnificado then
 begin
 	 if conta.DataSource.DataSet.State = dsInsert then
   begin
     conta.vCtrl._abreTodosControlesCAR(
      conta.Docs,
      conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger);
   end
   else if conta.DataSource.DataSet.State = dsEdit then
   begin
     conta.vCtrl._abreTodosControlesCAR(
      conta.Docs,
      false,
      conta.dataSet.FieldByName('CODIGO_CTRL').AsInteger,
      conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger);
   end;
   
   if (conta.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0)
   	or (conta.dataSet.FieldByName('COD_CLI_TERC').AsInteger > 0)
    or (conta.dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0)  then
   begin
     if conta.vCodEmpMult <> conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger then
     begin
        if (conta.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0)
        	and (conta.dataSet.FieldByName('COD_CLI_TERC').AsInteger > 0)
          and (conta.dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0) then
        	vTemp := 'controle, cliente e cliente de terceiro'
        else if (conta.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0)
        	and (conta.dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0) then
        	vTemp := 'controle e cliente'
        else if (conta.dataSet.FieldByName('COD_CLI_TERC').AsInteger > 0)
        	and (conta.dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0)  then
          vTemp := 'controle e cliente de terceiro'
     	  else if (conta.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0)
         and (conta.dataSet.FieldByName('COD_CLI_TERC').AsInteger > 0) then
          vTemp := 'cliente e cliente de terceiro'
        else if (conta.dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0) then
        	vTemp := 'controle'
        else if (conta.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
          vTemp := 'cliente'
        else if (conta.dataSet.FieldByName('COD_CLI_TERC').AsInteger > 0) then
          vTemp := 'cliente de terceiro';

        if Application.MessageBox(pchar('Empresa Unificada foi alterada,' +
          ' é necessário informar o ' +vTemp + ' novamente, Deseja continuar assim mesmo?'),
          'Atenção',  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
        begin
           conta.vCodEmpMult := conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger;
           conta.dataSet.FieldByName('cod_cliente').Value := null;
           if (conta.Docs = 'S1') then
             conta.dataSet.FieldByName('nome_ch').Value := null
           else if (conta.Docs = 'S2') then
             conta.dataSet.FieldByName('nome_c').Value := null;
           conta.dataSet.FieldByName('razao').Value := null;
           conta.dataSet.FieldByName('cpfcgc').Value := null;
           if conta.dataSet.FieldByName('cod_cli_terc').AsInteger > 0 then
           begin
             conta.dataSet.FieldByName('cod_cli_terc').Value := null;
             conta.dataSet.FieldByName('nome_terc').Value := null;
           end;
           if conta.dataSet.FieldByName('codigo_ctrl').AsInteger > 0 then
             conta.dataSet.FieldByName('codigo_ctrl').Value := null;
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
     conta.vCodEmpMult := conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger;
  end;
end;

procedure TfrmCadContasAReceber.DBEdit66Exit(Sender: TObject);
var
 vTemp: string;
begin
 if (conta.Recebendo) then
   exit;

 if vDadosIni.vEmp.vFinanceiroUnificado then
 begin
 	 if conta.DataSource.DataSet.State = dsInsert then
   begin
     conta.vCtrl._abreTodosControlesCAR(
      conta.Docs,
      conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger);
   end
   else if conta.DataSource.DataSet.State = dsEdit then
   begin
     conta.vCtrl._abreTodosControlesCAR(
      conta.Docs,
      false,
      conta.dataSet.FieldByName('CODIGO_CTRL').AsInteger,
      conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger);
   end;
   
   if (conta.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0)
   	 or (conta.dataSet.FieldByName('COD_CLI_TERC').AsInteger > 0)
     or (conta.dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0)  then
   begin
     if conta.vCodEmpMult <> conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger then
     begin
      	if (conta.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0)
        	and (conta.dataSet.FieldByName('COD_CLI_TERC').AsInteger > 0)
          and (conta.dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0) then
        	vTemp := 'controle, cliente e cliente de terceiro'
        else if (conta.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0)
        	and (conta.dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0) then
        	vTemp := 'controle e cliente'
        else if (conta.dataSet.FieldByName('COD_CLI_TERC').AsInteger > 0)
        	and (conta.dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0) then
        	vTemp := 'controle e cliente de terceiro'
        else if (conta.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0)
        	and (conta.dataSet.FieldByName('COD_CLI_TERC').AsInteger > 0) then
          vTemp := 'cliente e cliente de terceiro'
        else if (conta.dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0) then
        	vTemp := 'controle'
        else if (conta.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
          vTemp := 'cliente'
        else if (conta.dataSet.FieldByName('COD_CLI_TERC').AsInteger > 0) then
          vTemp := 'cliente de terceiro';

        if Application.MessageBox(pchar('Empresa Unificada foi alterada,' +
          ' é necessário informar o ' +vTemp + ' novamente, Deseja continuar assim mesmo?'),
          'Atenção',  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
        begin
           conta.vCodEmpMult := conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger;
           conta.dataSet.FieldByName('cod_cliente').Value := null;
           if (conta.Docs = 'S1') then
             conta.dataSet.FieldByName('nome_ch').Value := null
           else if (conta.Docs = 'S2') then
             conta.dataSet.FieldByName('nome_c').Value := null;
           conta.dataSet.FieldByName('razao').Value := null;
           conta.dataSet.FieldByName('cpfcgc').Value := null;
           if conta.dataSet.FieldByName('cod_cli_terc').AsInteger > 0 then
           begin
             conta.dataSet.FieldByName('cod_cli_terc').Value := null;
             conta.dataSet.FieldByName('nome_terc').Value := null;
           end;
           if conta.dataSet.FieldByName('codigo_ctrl').AsInteger > 0 then
             conta.dataSet.FieldByName('codigo_ctrl').Value := null;
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
     conta.vCodEmpMult := conta.dataSet.FieldByName('COD_EMP_MULT').AsInteger;
 end;
end;

procedure TfrmCadContasAReceber.DBEdit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
    spbContasBancarias.Click;
end;

procedure TfrmCadContasAReceber.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    conta._marcaDesmarcaLinha;
end;

procedure TfrmCadContasAReceber.DBGrid1ColEnter(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedField.FieldName = 'OCORRENCIABANCARIA' then
    DBGrid1.Options := [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines,
      dgTabs, dgConfirmDelete, dgCancelOnExit];
end;

procedure TfrmCadContasAReceber.DBGrid1ColExit(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedField.FieldName = 'OCORRENCIABANCARIA' then
    DBGrid1.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,
      dgConfirmDelete, dgCancelOnExit];
end;

procedure TfrmCadContasAReceber.DBGrid1DblClick(Sender: TObject);
begin
  conta._marcaDesmarcaLinha;
end;

procedure TfrmCadContasAReceber.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if (conta.Docs = 'S1') and
    (Column.FieldName = 'DATA_VENC') and
    (not conta.dataSet.FieldByName('DATA_VENC').IsNull) and
    ((conta.dataSet.FieldByName('DATA_VENC').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros) < vDtDia) and
    (Trim(conta.dataSet.FieldByName('STATUS_CH').AsString) <> 'QUITADO') then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if (conta.Docs = 'S2') and
    (Column.FieldName = 'DATA_VENC_C') and
    (not conta.dataSet.FieldByName('DATA_VENC_C').IsNull) and
    ((conta.dataSet.FieldByName('DATA_VENC_C').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros) < vDtDia) and
    (Trim(conta.dataSet.FieldByName('STATUS_C').AsString) <> 'QUITADO') then
  begin
    TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if (conta.Docs = 'S1') and
  	(Column.FieldName = 'DATA_PREV_REC') and
    (not conta.dataSet.FieldByName('DATA_PREV_REC').IsNull) and
    (conta.dataSet.FieldByName('DATA_PREV_REC').AsDateTime < vDtDia) and
    (Trim(conta.dataSet.FieldByName('STATUS_CH').AsString) <> 'QUITADO') then
  begin
  	TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if (conta.Docs = 'S2') and
  	(Column.FieldName = 'DATA_PREV_REC') and
    (not conta.dataSet.FieldByName('DATA_PREV_REC').IsNull) and
    (conta.dataSet.FieldByName('DATA_PREV_REC').AsDateTime < vDtDia) and
    (Trim(conta.dataSet.FieldByName('STATUS_C').AsString) <> 'QUITADO') then
  begin
  	TDBGrid(sender).Canvas.Brush.Color := clRed;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if conta.dataSet.FieldByName('sel').AsString = 'S' then
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

procedure TfrmCadContasAReceber.DBGrid1KeyDown(Sender: TObject; var Key: Word;
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
    if not conta.dataSet.IsEmpty then
      conta._marcaDesmarcaLinha;
end;

procedure TfrmCadContasAReceber.DBGrid1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    conta._marcaDesmarcaLinha;
end;

procedure TfrmCadContasAReceber.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    TForm(pnHistorico.Parent).ModalResult := IDOK
  else if Key = VK_ESCAPE then
    TForm(pnHistorico.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_INSERT then
    SpeedButton30.Click
  else if key = VK_RETURN then
    SpeedButton32.Click
  else if key = VK_ESCAPE then
    SpeedButton34.Click
  else if key = VK_DELETE then
    SpeedButton31.Click;
end;

procedure TfrmCadContasAReceber.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn24.Click;
end;

procedure TfrmCadContasAReceber.DBGrid5DblClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    DBGrid5.Visible := False;
    conta.UsarValorAAtingir := CheckBox2.Checked;
    if not cdsDesp.IsEmpty then
    	cdsDesp.EmptyDataSet;

    DBEdit70.Enabled                   := True;
    DBEdit71.Enabled                   := True;

    bt_limpar_data_prev_rec.Visible    := True;
    bt_limpar_data_prev_rec2.Visible   := True;

    bt_alt_data_prev_rec.Visible       := False;
    bt_alt_data_prev_rec2.Visible      := False;

    bt_limpar_data_prev_rec.Left       := DBEdit70.Left + DBEdit70.Width + 3;
    bt_limpar_data_prev_rec2.Left      := DBEdit71.Left + DBEdit71.Width + 3;

    bt_alt_data_prev_rec.Left          := DBEdit70.Left + DBEdit70.Width + 3;
    bt_alt_data_prev_rec2.Left         := DBEdit71.Left + DBEdit71.Width + 3;
    
    if conta._receberComControleSelecionado(False) then
      pnReceberEnter(pnReceber);

  finally
    DBGrid5.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.DBGrid5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
  begin
    if Sender <> DBGrid5 then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBGrid5.CanFocus) then
      	DBGrid5.SetFocus
    end
    else
    begin
    	if (Self.Enabled) and (Self.Visible) and (DBGrid6.CanFocus) then
      	DBGrid6.SetFocus;
    end;
  end
  else if Key = VK_F3 then
  begin
    if Sender = DBGrid6 then
      SpeedButton13.Click;
  end
  else if Key = VK_DELETE then
  begin
    if Sender = DBGrid6 then
      SpeedButton14.Click;
  end
  else if (Key = VK_F5) and (SpeedButton10.Enabled) then
    SpeedButton10.Click
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

procedure TfrmCadContasAReceber.DBGrid7CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SELEC' then
    conta.vReceb.vRecibo._marcaDesmarcaLinha;
end;

procedure TfrmCadContasAReceber.DBGrid7DblClick(Sender: TObject);
begin
  inherited;
  conta.vReceb.vRecibo._marcaDesmarcaLinha;
end;

procedure TfrmCadContasAReceber.DBGrid7DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if conta.vReceb.vRecibo.dataSet.FieldByName('selec').AsString = 'S' then
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

  if Column.FieldName = 'SELEC' then
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

procedure TfrmCadContasAReceber.DBGrid7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if Key = VK_F5 then
    SpeedButton15.Click
  else if (Key = VK_TAB) or (Key = VK_RETURN) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (edNumRecibo.CanFocus) then
    	edNumRecibo.SetFocus;
  end
  else if Key = VK_SPACE then
    if not conta.vReceb.vRecibo.dataSet.IsEmpty then
      conta.vReceb.vRecibo._marcaDesmarcaLinha;
end;

procedure TfrmCadContasAReceber.DBGrid7MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    conta.vReceb.vRecibo._marcaDesmarcaLinha;
end;

procedure TfrmCadContasAReceber.DBGrid7TitleClick(Column: TColumn);
begin
  inherited;
  conta.vReceb.vRecibo.IndexFieldNames := Column.FieldName;
end;

procedure TfrmCadContasAReceber.DBLookupComboBox10Exit(Sender: TObject);
var
 vMensagem: string;
begin
  inherited;
  if conta.vPCont.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
	  edHistoricoDiferenca.Text := trim(conta.vPCont.dataSet.FieldByName('DESC_PLC').AsString);

  if not conta.verificarConta(vDadosIni.IfThen(
    conta.dadosReceber.valorAtingido > conta.dadosReceber.valorOperacao, 'E', 'S'),
    conta.vPCont.dataSet.FieldByName('N_CONTA_PLC').AsFloat) then
    exit;

//  if not conta.testarNumConta(vDadosIni.IfThen(
//    conta.dadosReceber.valorAtingido > conta.dadosReceber.valorOperacao, 'E', 'S'),
//    conta.vPCont.dataSet.FieldByName('N_CONTA_PLC').AsFloat, vMensagem) then
//  begin
//    Application.MessageBox(PChar(vMensagem), 'Atenção', MB_ICONWARNING + MB_OK);
//    exit;
//  end;
//
//  if conta.dadosReceber.valorAtingido > conta.dadosReceber.valorOperacao then
//  begin
//    if (conta.vPCont.dataSet.FieldByName('N_CONTA_PLC').AsFloat <>
//		  conta.dadosReceber.numContaJuros) then
//    begin
//      Application.MessageBox(PChar('Conta de entrada selecionada diferente da informada nas contas de ligação (Juros Recebidos).'), 'Atenção', MB_ICONWARNING + MB_OK);
//      exit;
//    end;
//  end
//  else
//  begin
//  	if (conta.vPCont.dataSet.FieldByName('N_CONTA_PLC').AsFloat <>
//		  conta.dadosReceber.numContaDesconto) then
//    begin
//      Application.MessageBox(PChar('Conta de saída selecionada diferente da informada nas contas de ligação (Descontos Recebidos).'), 'Atenção', MB_ICONWARNING + MB_OK);
//      exit;
//    end;
//  end;
end;

procedure TfrmCadContasAReceber.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  Edit11.Text := vDadosIni.retornaDescricaoTipoNumConta('E', conta.vPCont.dataSet.FieldByName('TIPO_CTP').AsString);
end;

procedure TfrmCadContasAReceber.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if not conta._controleValido then
    if (Self.Enabled) and (Self.Visible) and (DBEdit18.CanFocus) then
      DBEdit18.SetFocus;
end;

procedure TfrmCadContasAReceber.DBLookupComboBox4Exit(Sender: TObject);
begin
  inherited;
  Edit9.Text := vDadosIni.retornaDescricaoTipoNumConta('E', conta.vPCont.dataSet.FieldByName('TIPO_CTP').AsString);

  if not conta.vPCont.verificarConta('E', conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat) then
    Exit;
end;

procedure TfrmCadContasAReceber.DBLookupComboBox5Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) then
    Exit;

  if not conta._controleValido then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit43.CanFocus) then
      DBEdit43.SetFocus;
  end
  else if (DBEdit31.DataSource.DataSet.State in [dsedit, dsInsert]) then
    DBEdit31.DataSource.DataSet.FieldByName(DBEdit31.DataField).AsString :=
      DBLookupComboBox5.ListSource.DataSet.FieldByName(DBLookupComboBox5.ListField).AsString;

  Label52.Visible := conta.Vale;
  DBEdit46.Visible := conta.Vale;
end;

procedure TfrmCadContasAReceber.DBLookupComboBox7Exit(Sender: TObject);
begin
  inherited;

  if conta.Docs = 'S1' then
    conta.dadosReceber.numContaSCh := DBLookupComboBox7.KeyValue
  else
    conta.dadosReceber.numContaSCr := DBLookupComboBox7.KeyValue;

end;

procedure TfrmCadContasAReceber.DBLookupComboBox8Exit(Sender: TObject);
begin
  if DBLookupComboBox8.Field.AsFloat <= 0 then
  begin
    Application.MessageBox('Nº da Conta não informada.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox8.CanFocus) then
      DBLookupComboBox8.SetFocus;
    Exit;
  end;

  if not conta.verificarConta('E', DBLookupComboBox8.Field.AsFloat) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox8.CanFocus) then
      DBLookupComboBox8.SetFocus;
    Exit;
  end;

  if not (conta.dataSet.State in [dsInsert, dsEdit]) then
   exit;

  if (conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat <> conta.dadosReceber.numContaTemp)
   and (conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat <> conta.dadosReceber.numContaVendaProd) then
  begin
      if (trim(conta.dataSet.FieldByName('HISTORICO_L').AsString) =
        trim(conta.vPCont.dataSet.FieldByName('DESC_PLC').AsString)) then
         exit;

      if Application.MessageBox(pchar('Deseja atualizar o histórico do lançamento?'),
        'Atenção',  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON1) <> IDYES then
      begin
        conta.dadosReceber.numContaTemp := conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat;
        exit;
      end;

      conta.dataSet.FieldByName('HISTORICO_L').AsString :=
      	trim(conta.vPCont.dataSet.FieldByName('DESC_PLC').AsString);
  end
  else
  begin
    if (conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat = conta.dadosReceber.numContaTemp) then
      exit;
      
  	conta.dataSet.FieldByName('HISTORICO_L').AsString :=
      	'ENTRADA DINHEIRO CONFORME CREDITO ACIMA';
        
    if vDadosIni.vEmp.vFinanceiroUnificado then
      conta.dataSet.FieldByName('HISTORICO_L').AsString :=
      	conta.dataSet.FieldByName('HISTORICO_L').AsString +
        ' EMP: ' + vDadosIni.StrZero(conta.dadosReceber.codigoUnificada, 3);
  end;
        
  conta.dadosReceber.numContaTemp := conta.dataSet.FieldByName('N_CONTA_PLC').AsFloat;
end;

procedure TfrmCadContasAReceber.DesmarcardocumentocomoRecebendo1Click(
  Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    conta._desmarcarDocumentoComoRecebendo;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.edDescPercExit(Sender: TObject);
begin
  inherited;
  if edDescPerc.AsValue > 0 then
  begin
    edDescValor.AsValue := 0;
    if RadioGroupDescontoAcrescimo.ItemIndex = 0 then
      pnValorDaOperacao.Caption := Format('%0.2n', [conta.ValorOperacao -
        (conta.ValorOperacao * edDescPerc.AsValue / 100)])
    else
      pnValorDaOperacao.Caption := Format('%0.2n', [conta.ValorOperacao +
        (conta.ValorOperacao * edDescPerc.AsValue / 100)]);
  end
  else if (edDescPerc.AsValue <= 0) and (edDescValor.AsValue <= 0) then
    pnValorDaOperacao.Caption := Format('%0.2n', [conta.ValorOperacao]);
end;

procedure TfrmCadContasAReceber.edDescValorExit(Sender: TObject);
begin
  inherited;
  if edDescValor.AsValue > 0 then
  begin
    edDescPerc.AsValue := 0;
    if RadioGroupDescontoAcrescimo.ItemIndex = 0 then
    	pnValorDaOperacao.Caption := Format('%0.2n', [(conta.ValorOperacao - edDescValor.AsValue)])
    else
	    pnValorDaOperacao.Caption := Format('%0.2n', [(conta.ValorOperacao + edDescValor.AsValue)]);
  end
  else if (edDescPerc.AsValue <= 0) and (edDescValor.AsValue <= 0) then
    pnValorDaOperacao.Caption := Format('%0.2n', [conta.ValorOperacao]);
end;

procedure TfrmCadContasAReceber.edHistSaidaDevKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    TForm(pnDadosBaixaDevolv.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.Edit4Change(Sender: TObject);
begin
  inherited;
  conta.vReceb.vRecibo.FindNearest([Edit4.Text]);
end;

procedure TfrmCadContasAReceber.Edit4Enter(Sender: TObject);
begin
  inherited;
  Edit4.OnChange := Edit4Change;
  conta.vReceb.vRecibo.IndexFieldNames := 'NOME_DEV';
end;

procedure TfrmCadContasAReceber.Edit4Exit(Sender: TObject);
begin
  inherited;
  Edit4.OnChange := nil;
end;

procedure TfrmCadContasAReceber.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_UP then
  begin
  	if (Self.Enabled) and (Self.Visible) and (edNumRecibo.CanFocus) then
    	edNumRecibo.SetFocus;
  end
  else if Key = VK_F5 then
    SpeedButton15.Click;
end;

procedure TfrmCadContasAReceber.Edit7Exit(Sender: TObject);
var
  vFiltro: string;
  vValor: Extended;
begin
  inherited;
  try
    if pnPendenciasCartao.Tag = 0 then
      Exit;
    vFiltro := '';
    if Trim(Edit7.Text) <> '' then
      if vFiltro = '' then
        vFiltro := vFiltro + 'N_AUT_CART_CRED like ' + QuotedStr(Edit7.Text + '%')
      else
        vFiltro := vFiltro + ' and N_AUT_CART_CRED like ' + QuotedStr(Edit7.Text + '%');

    if Trim(Edit8.Text) <> '' then
      if vFiltro = '' then
        vFiltro := vFiltro + 'NUM_DOC_ADM like ' + QuotedStr(Edit8.Text + '%')
      else
        vFiltro := vFiltro + ' and NUM_DOC_ADM like ' + QuotedStr(Edit8.Text + '%');

    vValor := EditHw1.AsValue;
    if vValor > 0 then
      if vFiltro = '' then
        vFiltro := vFiltro + 'VALORPARCELA = ' + StringReplace(format('%0.6f', [vValor]), ',', ',', [rfIgnoreCase])
      else
        vFiltro := vFiltro + ' and VALORPARCELA = ' + StringReplace(format('%0.6f', [vValor]), ',', ',', [rfIgnoreCase]);

    if Trim(Edit10.Text) <> '' then
      if vFiltro = '' then
        vFiltro := vFiltro + 'COD_TERMINAL_ADM like ' + QuotedStr(Edit10.Text + '%')
      else
        vFiltro := vFiltro + ' and COD_TERMINAL_ADM like ' + QuotedStr(Edit10.Text + '%');

    if EditHw2.AsValue > 0 then
      if vFiltro = '' then
        vFiltro := vFiltro + 'RO_ADM = ' + (EditHw2.Text)
      else
        vFiltro := vFiltro + ' and RO_ADM = ' + (EditHw2.Text);

    if Trim(Edit12.Text) <> '' then
      if vFiltro = '' then
        vFiltro := vFiltro + 'NSU_RO_ADM like ' + QuotedStr(Edit12.Text + '%')
      else
        vFiltro := vFiltro + ' and NSU_RO_ADM like ' + QuotedStr(Edit12.Text + '%');

    if Trim(Edit13.Text) <> '' then
      if vFiltro = '' then
        vFiltro := vFiltro + 'DESC_STATUS_ADM like ' + QuotedStr(Edit13.Text + '%')
      else
        vFiltro := vFiltro + ' and DESC_STATUS_ADM like ' + QuotedStr(Edit13.Text + '%');

    if MaskEdit5.Text <> '  /  /    ' then
      if vFiltro = '' then
        vFiltro := vFiltro + 'DATA_PREV_PAG = ' + QuotedStr(MaskEdit5.Text)
      else
        vFiltro := vFiltro + ' and DATA_PREV_PAG = ' + QuotedStr(MaskEdit5.Text);

    if MaskEdit6.Text <> '  /  /    ' then
      if vFiltro = '' then
        vFiltro := vFiltro + 'DTPROCESSAMENTO = ' + QuotedStr(MaskEdit6.Text)
      else
        vFiltro := vFiltro + ' and DTPROCESSAMENTO = ' + QuotedStr(MaskEdit6.Text);

  finally
    conta.vPendenciasCartao.dataSet.Filter := vFiltro;
    conta.vPendenciasCartao.dataSet.Filtered :=  Trim(vFiltro) <> '';
  end;
end;

procedure TfrmCadContasAReceber.edNumReciboChange(Sender: TObject);
begin
  inherited;
  conta.vReceb.vRecibo.FindNearest([edNumRecibo.Text]);
end;

procedure TfrmCadContasAReceber.edNumReciboEnter(Sender: TObject);
begin
  inherited;
  edNumRecibo.OnChange := edNumReciboChange;
  if not vDadosIni.vRecibo.HabRecPorDepart then
    conta.vReceb.vRecibo.IndexFieldNames := 'NRECIBO'
  else
	  conta.vReceb.vRecibo.IndexFieldNames := 'NUM_REC_DEP';
end;

procedure TfrmCadContasAReceber.edNumReciboExit(Sender: TObject);
begin
  inherited;
  edNumRecibo.OnChange := nil;
end;

procedure TfrmCadContasAReceber.edNumReciboKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_UP then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid7.CanFocus) then
    	DBGrid7.SetFocus;
  end
  else if Key = VK_F5 then
    SpeedButton15.Click
end;

procedure TfrmCadContasAReceber.edNumReciboKeyPress(Sender: TObject;
  var Key: Char);
begin
  If not( key in['0'..'9',#08] ) then 
	  key:=#0;
end;

procedure TfrmCadContasAReceber.edQtdeReplicarCadastroExit(Sender: TObject);
begin
  inherited;
  if edQtdeReplicarCadastro.AsInteger > 0 then
    if edDiaVencimentoReplicarCadastro.AsInteger = 0 then
      if Trim(DBEdit36.DataSource.DataSet.FieldByName(DBEdit36.DataField).AsString) <> '' then
      try
        edDiaVencimentoReplicarCadastro.AsValue :=
          DayOf(DBEdit36.DataSource.DataSet.FieldByName(DBEdit36.DataField).AsDateTime);
      except
      end;
end;

procedure TfrmCadContasAReceber.edValorBaixaParcialKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    TForm(pnDadosBaixa.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.edVencimentoFaturaEntradaExit(Sender: TObject);
begin
  inherited;
  try
    StrToDate(edVencimentoFaturaEntrada.Text);
  except
    ShowMessage('Data Inválida !');
    if (Self.Enabled) and (Self.Visible) and (edVencimentoFaturaEntrada.CanFocus) then
     	edVencimentoFaturaEntrada.SetFocus;
  end;
end;

procedure TfrmCadContasAReceber.edVlContDifExit(Sender: TObject);
begin
  inherited;
  edVlContDif.AsValue := Abs(edVlContDif.AsValue);
end;

procedure TfrmCadContasAReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

	gravaConfiguracoesFormRegistro;

  conta.free;
  conta := nil;

  Action := caFree;
  frmCadContasAReceber := nil;

end;

procedure TfrmCadContasAReceber.FormCreate(Sender: TObject);
begin
	vCriou := 0;
  TelaCadastro := vDadosIni.vTipoForm;
  inherited;

  if vDadosIni.vPesquisa = 'S1' then
    conta := TControleCheque.create
  else
    conta := TControleCredito.create;
  vTipoCriou := trim(vDadosIni.vPesquisa);
    
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';

end;

procedure TfrmCadContasAReceber.FormKeyDown(Sender: TObject; var Key: Word;
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
    else if (Key = VK_F6) and (ckbNaoQuitado.Enabled) then
      ckbNaoQuitado.Checked := not ckbNaoQuitado.Checked
    else if (Key = VK_F7) and (ckbQuitado.Enabled) then
      ckbQuitado.Checked := not ckbQuitado.Checked
    else if Key = VK_F9 then
      CheckBox1Click(CheckBox1)
    else if (Key = VK_F11) and (rbCheque.Enabled) then
    begin
      if not rbCheque.Checked then
      begin
        rbCheque.Checked := True;
        rbChequeClick(rbCheque);
      end;
    end
    else if (Key = VK_F12) and (rbCredito.Enabled) then
    begin
      if not rbCredito.Checked then
      begin
        rbCredito.Checked := True;
        rbCreditoClick(rbCredito);
      end;
    end
    else if (Key = VK_F8) then
    	CheckBoxVerFormas.Checked := not CheckBoxVerFormas.Checked;
  end;

end;

procedure TfrmCadContasAReceber.FormShow(Sender: TObject);
var
  I: Integer;
  vCredCheqVenc: Boolean;
begin
	if not Self.Enabled then
    Exit;

	vCredCheqVenc := False;

	SpeedButton48.Visible := vDadosIni.vConcCartao.vHabilitarConcCartaoAPI;

	conta.dataSet.FieldByName('COD_EMP_MULT').Tag :=
  	vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 0, 1);
  conta.dataSet.FieldByName('IDENTIFICACAO_EMP').Tag :=
  	vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 0, 1);

  for I := 0 to DBGrid7.FieldCount - 1 do
    if not vDadosIni.vEmp.vFinanceiroUnificado then
    begin
      if (DBGrid7.Columns[I].FieldName = 'COD_EMP_MULT') then
      begin
        DBGrid7.Columns[I].Visible := false;
        if conta.vReceb <> nil then
          conta.vReceb.vRecibo.dataSet.FieldByName('COD_EMP_MULT').Visible := false;
      end
    end
    else
    begin
     if (DBGrid7.Columns[I].FieldName = 'COD_EMP_MULT') then
      begin
        DBGrid7.Columns[I].Visible := true;
        if conta.vReceb <> nil then
          conta.vReceb.vRecibo.dataSet.FieldByName('COD_EMP_MULT').Visible := false;
      end
    end;

	if vCriou = 1 then
  begin
    if trim(vTipoCriou) <> trim(vDadosIni.vPesquisa) then
    begin
    	if trim(vDadosIni.vPesquisa) = 'S1' then
    		rbCheque.Checked := True
      else
      	rbCredito.Checked := True;
      vTipoCriou := trim(vDadosIni.vPesquisa);
    end;
  end;

  rbCheque.Checked := conta.Docs = 'S1';
  rbCredito.Checked := not rbCheque.Checked;
  Panel2.Height := 57;

  if vShow <> 1 then
    showForm;

  if not vDadosIni.validarAcessoEmpresasUnificadas(conta.buscas) then
  begin
    vDadosIni.fechaStatusProcessamento;
    frmCadContasAReceber.fechar := True;
    PostMessage(frmCadContasAReceber.Handle, WM_CLOSE, 0, 0);
    Exit;
  end;

  vTipoE := '';

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('CXG137', 'HABILITAR', 'HAB CONTAS A RECEBER', 'P_CONTAS', '', conta.buscas, true) then
    vTipoE := vDadosIni.IfThen(trim(vTipoE) <> '', trim(vTipoE) + ',', '') + QuotedStr('E');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('CXG138', 'HABILITAR', 'HAB CONTAS A RECEBER', 'P_CONTAS', '', conta.buscas, true) then
    vTipoE := vDadosIni.IfThen(trim(vTipoE) <> '', trim(vTipoE) + ',', '') + QuotedStr('T');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('CXG139', 'HABILITAR', 'HAB CONTAS A RECEBER', 'P_CONTAS', '', conta.buscas, true) then
    vTipoE := vDadosIni.IfThen(trim(vTipoE) <> '', trim(vTipoE) + ',', '') + QuotedStr('O');

  vDadosIni.vInibeMensPesqPros := 'S';
  if not vDadosIni.PesqPros('CXG140', 'HABILITAR', 'HAB CONTAS A RECEBER', 'P_CONTAS', '', conta.buscas, true) then
    vTipoE := vDadosIni.IfThen(trim(vTipoE) <> '', trim(vTipoE) + ',', '') + QuotedStr('Z');

  // Com os vampos de valor contabil este campo TIP_CNT se torna obsoleto
  Label25.Visible := False;
  Label51.Visible := False;
  DBComboBox2.Visible := False;
  DBComboBox4.Visible := False;

  if vDadosIni.vRecibo.HabRecPorDepart then
  	edNumRecibo.OnKeyPress := nil;

  grupoCheque.Width := 801;
  grupoCheque.Top := 0;
  grupoCredito.Width := 801;
  grupoCredito.Top := 0;

  if TelaCadastro = 3 then
  begin
  	vCredCheqVenc := True;
    vDadosIni.vTipoForm := 0;
    TelaCadastro := vDadosIni.vTipoForm;
    ComboBox1.Text:=conta.dataSet.FieldByName('DATA_VENC_C').DisplayName; //'Data Vencimento';
    ComboBox1Exit(sender);
    MaskEdit1.text:='01/01/1990';
    MaskEdit2.text:=FormatDateTime('DD/MM/YYYY', vDadosIni.getDataBanco(conta.buscas));//datetostr(vDadosIni.getDataBanco(ctp.buscas));
    ckbNaoQuitado.Checked:=true;
    ckbQuitado.Checked:=False;
    BitBtn1Click(Sender);
  end
  else if TelaCadastro = 4 then
  begin
  	vCredCheqVenc := True;
    vDadosIni.vTipoForm := 0;
    TelaCadastro := vDadosIni.vTipoForm;
    ComboBox1.Text:=conta.dataSet.FieldByName('DATA_VENC').DisplayName; //'Data Vencimento';
    ComboBox1Exit(sender);
    MaskEdit1.text:='01/01/1990';
    MaskEdit2.text:=FormatDateTime('DD/MM/YYYY', vDadosIni.getDataBanco(conta.buscas));//datetostr(vDadosIni.getDataBanco(ctp.buscas));
    ckbNaoQuitado.Checked:=true;
    ckbQuitado.Checked:=False;
    BitBtn1Click(Sender);
  end;

  vDadosIni.fechaStatusProcessamento;

  DBEdit70.Hint := 'Data previsão de recebimento utilizada para (barrar / desbarrar) clientes' + #13 + #13 +
    'Obs:' + #13 + #13 +
  	'Se a data previsão de recebimento for maior que a data de vencimento + dias de carência, ' + #13 + 'será utilizado como base a data previsão de recebimento para (barrar / desbarrar) clientes' + #13 + #13 +
    'Se a data previsão de recebimento não for preenchida ou for menor que a data de vencimento + dias de carência, ' + #13 + 'será utilizado como base a data de vencimento + dias de carência para (barrar / desbarrar) clientes';
  DBEdit71.Hint := DBEdit70.Hint;
  edDataPrevRec.Hint := DBEdit70.Hint;

  imgInformation.Hint := imgInformation.Hint + #13 + #13 +
    'Processo "CAR040" PERMISSAO ALTERAR DATA CADASTRO CHEQUE' + #13 +
    'Processo "CAR041" PERMISSAO ALTERAR DATA CADASTRO CREDITO' + #13 +
    'Processo "CAR055" PERMISSÃO PARA REPLIÇÃO DE CONTAS CREDITOS' + #13 +
    'Processo "CAR056" PERMISSÃO PARA UTILIZAR RECIBO ANTECIPADO NA QUITAÇÃO' +#13 +
    'Processo "CAR061" POPUP MENU DESMARCAR COMO RECEBENDO' + #13 +
    'Processo "CAR062" PERMITIR DESCONTO FINANCEIRO SEM DEFINICAO NA EMPRESA' + #13 +
    'Processo "CAR064" DEVOLUCAO DE CREDITO NO RECEBIMENTO' + #13 +
    'Processo "CAR088" HABILITAR CAMPO NOSSO NUMERO BANCO' + #13 +
    'Processo "CAR094" HABILITAR CAMPO "VALOR" DOS CREDITO DA CONTRAPARTIDA' + #13 +
    'Processo "CAR095" HABILITAR CAMPO "VALOR" DOS CHEQUES DA CONTRAPARTIDA' + #13 +
    'Processo "CAR100" MONTAR BOLETO A PARTIR DE CREDITO' + #13 +
    'Processo "CAR101" EMITIR BOLETO DE CREDITO NA CONFIRMACAO' + #13 +
    'Processo "CAR109" DATA PREVISAO RECEBIMENTO MENOR DATA VENCIMENTO CHEQUE' + #13 +
    'Processo "CAR110" DATA PREVISAO RECEBIMENTO MENOR DATA VENCIMENTO CREDITO' + #13 +
    'Processo "CXL075" RECEBER PREST COM OUTRAS MAIS ANTIGAS EM ABERTO' + #13 +
    'Processo "CXG137" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (ENTRADA) - EMPRESTIMO' + #13 +
    'Processo "CXG138" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (ENTRADA) - TRANSFERENCIA	' + #13 +
    'Processo "CXG139" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (ENTRADA) - OUTRAS RECEITAS' + #13 +
    'Processo "CXG140" HABILITAR CONSULTAR FINANCEIRO PLANO CONTA (ENTRADA) - CORRECAO DE SALDO' + #13 +
    'Processo "LANC046" PERMITIR REALIZAR LANCAMENTOS DE CONTAS DIFERENTE INFORMADA NAS CONTAS DE LIGAÇÃO';
  if (vCriou = 0) and (not vDadosIni.vContrapartida) then
  	if (not vCredCheqVenc) then
    begin
      vDadosIni.verificarImpFaturaVindi;

    	vDadosIni.negativarClientes(0, '', False, True);

      vDadosIni.baixarRecAntValeCompra(0);

    	conta.abreFormBoletosProtesto;

      conta.abreFormNegativarClienteCredVenc(1, true);
    end;

  if vCriou = 0 then
    vCriou := 1;
end;

procedure TfrmCadContasAReceber.getFaturas;
var
  I: Integer;
begin
  try
    conta.FContas.numeroDocumento[ListBox3.ItemIndex] := edDocFaturaEntrada.Text;
    conta.FContas.vencimentoDocumento[ListBox3.ItemIndex] := edVencimentoFaturaEntrada.Text;
    conta.FContas.valorDocumento[ListBox3.ItemIndex] := edValorFaturaEntrada.AsValue;
    ListBox3.Clear;
    for I := 0 to conta.FContas.parcelas - 1 do
      ListBox3.Items.Add(trim(conta.FContas.numeroDocumento[i]) + '   ' +
        trim(conta.FContas.vencimentoDocumento[i]) + '    ' + 'R$ ' +
        trim(Format('%12.2n', [conta.FContas.valorDocumento[i]])));
    ListBox1.Items.Text := ListBox3.Items.Text;
  except
  end;
end;

procedure TfrmCadContasAReceber.gravaConfiguracoesFormRegistro;
begin
	_GravaConfiguracoesString(conta.Docs + ComboBox1.Name, ComboBox1.Text);
  _GravaConfiguracoesString(conta.Docs + ComboBox3.Name, ComboBox3.Text);
  _GravaConfiguracoesString(conta.Docs + MaskEdit1.Name, MaskEdit1.Text);
  _GravaConfiguracoesString(conta.Docs + MaskEdit2.Name, MaskEdit2.Text);
  _GravaConfiguracoesString(conta.Docs + MaskEdit3.Name, MaskEdit3.Text);

	if (TelaCadastro <= 0) then
  begin
    _GravaConfiguracoesBoolean(conta.Docs + ckbNaoQuitado.Name, ckbNaoQuitado.Checked);
    _GravaConfiguracoesBoolean(conta.Docs + ckbQuitado.Name, ckbQuitado.Checked);
    _GravaConfiguracoesBoolean(conta.Docs + CheckBox1.Name, CheckBox1.Checked);
  end;

  if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
    _GravaConfiguracoesBoolean('V' + conta.Docs + MaskEdit1.Name, MaskEdit1.Visible);
    _GravaConfiguracoesBoolean('V' + conta.Docs + MaskEdit2.Name, MaskEdit2.Visible);
    _GravaConfiguracoesBoolean('V' + conta.Docs + MaskEdit3.Name, MaskEdit3.Visible);

    _GravaConfiguracoesString(conta.Docs + ComboBox11.Name, ComboBox11.Text);
    _GravaConfiguracoesString(conta.Docs + ComboBox12.Name, ComboBox12.Text);
    _GravaConfiguracoesString(conta.Docs + MaskEdit7.Name, MaskEdit7.Text);
    _GravaConfiguracoesString(conta.Docs + MaskEdit8.Name, MaskEdit8.Text);
    _GravaConfiguracoesString(conta.Docs + MaskEdit9.Name, MaskEdit9.Text);

    _GravaConfiguracoesBoolean('V' + conta.Docs + MaskEdit7.Name, MaskEdit7.Visible);
    _GravaConfiguracoesBoolean('V' + conta.Docs + MaskEdit8.Name, MaskEdit8.Visible);
    _GravaConfiguracoesBoolean('V' + conta.Docs + MaskEdit9.Name, MaskEdit9.Visible);

    _GravaConfiguracoesBoolean('V' + conta.Docs + MaskEdit9.Name, MaskEdit9.Visible);

    _GravaConfiguracoesBoolean('V' + conta.Docs + CheckBox13.Name, CheckBox13.Visible);

    _GravaConfiguracoesBoolean(conta.Docs + CheckBox13.Name, CheckBox13.Checked);
  end;
end;

procedure TfrmCadContasAReceber.gridListaMercadoriasRetDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer;
  Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (Column.Field.Dataset.FieldbyName('COD_CRED_RET_FIN').Asinteger =
    conta.dataSet.FieldByName('cod_cred').AsInteger) and
    (conta.dataSet.FieldByName('cod_cred').AsInteger > 0) and
    (not CheckBox14.Checked) then
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
    begin
      TDBGrid(sender).canvas.brush.color := clMoneyGreen;// TColor($0000A4EA);
//      TDBGrid(sender).canvas.Font.color := clInfoText;
    end;


//  if Cliente.dataSet.FieldByName('sel').AsString = 'S' then
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
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TfrmCadContasAReceber.GroupBox3Enter(Sender: TObject);
begin
  if CheckBox1.Checked then
    GroupBox3.Height := 161
  else
    GroupBox3.Height := 73;
end;

procedure TfrmCadContasAReceber.GroupBox3Exit(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadContasAReceber.GroupBox5Exit(Sender: TObject);
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

  if conta.Recebendo then
  begin
    conta.vReceb.vCr.QtdeReplicacao              := edQtdeReplicarCadastro.AsInteger;
    conta.vReceb.vCr.DiaReplicacao               := edDiaVencimentoReplicarCadastro.AsInteger;
    conta.vReceb.vCr.ReplAltNumQtdeReplicacao    := ckbReplAlterarNumQdeParcelaCadastro.Checked;
    conta.vReceb.vCr.ReplNaoAltNumQtdeReplicacao := ckbReplNaoAlterarNumQdeParcelaCadastro.Checked;
  end
  else
  begin
    conta.QtdeReplicacao                         := edQtdeReplicarCadastro.AsInteger;
    conta.DiaReplicacao                          := edDiaVencimentoReplicarCadastro.AsInteger;
    conta.ReplAltNumQtdeReplicacao               := ckbReplAlterarNumQdeParcelaCadastro.Checked;
    conta.ReplNaoAltNumQtdeReplicacao            := ckbReplNaoAlterarNumQdeParcelaCadastro.Checked;
  end;
end;

procedure TfrmCadContasAReceber.GroupBox8Enter(Sender: TObject);
begin
  inherited;
  if vDadosIni.vContrapartida then
    if DBEdit55.DataSource.DataSet.State = dsInsert then
    begin
		  DBEdit55.Enabled := true;
      DBEdit56.Enabled := true;
    end
    else
    begin
       DBEdit55.Enabled := false;
       DBEdit56.Enabled := false;
    end;
end;

procedure TfrmCadContasAReceber.grupoChequeEnter(Sender: TObject);
begin
  inherited;
  DBEdit12.Enabled          := True;
  DBEdit18.Enabled          := True;
  DBLookupComboBox2.Enabled := True;
  if not conta.Recebendo then
  begin
    DBEdit12.Enabled          := (DBEdit12.DataSource.DataSet.State = dsInsert);
    DBEdit18.Enabled          := DBEdit12.Enabled;
    DBLookupComboBox2.Enabled := DBEdit12.Enabled;
  end;
  DBEdit3.Enabled := false;
  DBEdit66.Enabled := (conta.DataSource.DataSet.State = dsInsert) and (not conta.Recebendo);
  if (DBEdit66.Visible) and (DBEdit66.Enabled)
  	and (vDadosIni.vEmp.vFinanceiroUnificado) and (vDadosIni.vContrapartida) then
  	DBEdit66.Enabled := false;

  DBLookupComboBox14.Enabled := (conta.DataSource.DataSet.State = dsInsert) and (not conta.Recebendo);
  if (DBLookupComboBox14.Visible) and (DBLookupComboBox14.Enabled)
  	and (vDadosIni.vEmp.vFinanceiroUnificado) and (vDadosIni.vContrapartida) then
    DBLookupComboBox14.Enabled := false;

  DBEdit67.Enabled := not conta.Recebendo;
  DBComboBox2.Enabled := not conta.Recebendo;
  if (DBEdit67.Enabled) and (conta.DataSource.DataSet.State = dsEdit) then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit67.Enabled := vDadosIni.PesqPros('CAR092', 'HABILITAR', '', 'CONTROLE_CHEQUE', '', conta.buscas, False);
    DBComboBox2.Enabled := DBEdit67.Enabled;
  end;
  //  (DBEdit3.DataSource.DataSet.State = dsInsert) or (conta.Recebendo);

  if (Self.Enabled) and (Self.Visible) and (DBEdit66.CanFocus) then
  	DBEdit66.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox14.CanFocus) then
  	DBLookupComboBox14.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
  	DBEdit1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
  	DBLookupComboBox1.SetFocus;
end;

procedure TfrmCadContasAReceber.grupoCreditoEnter(Sender: TObject);
begin
  inherited;
//  edQtdeReplicarCadastro.AsValue := 0;
//  edDiaVencimentoReplicarCadastro.AsValue := 0;
//  ckbReplAlterarNumQdeParcelaCadastro.Checked := true;
//  ckbReplNaoAlterarNumQdeParcelaCadastro.Checked := false;
  if not vDadosIni.vContrapartida then
  begin
  	vDadosIni.vInibeMensPesqPros := 'S';
	  GroupBox5.Visible := (vDadosIni.PesqPros('CAR055', 'RECEBER', '', conta.Table, '', conta.buscas, False));
  end
  else
     GroupBox5.Visible := false;

  if GroupBox5.Visible then
    GroupBox5.Enabled := (DBEdit37.DataSource.DataSet.State = dsInsert);
  DBEdit37.Enabled := True;
  DBEdit43.Enabled := True;
  DBLookupComboBox5.Enabled := True;
  if not conta.Recebendo then
  begin
    DBEdit37.Enabled := (DBEdit37.DataSource.DataSet.State = dsInsert);
    DBEdit43.Enabled := DBEdit37.Enabled;
    DBLookupComboBox5.Enabled := DBEdit37.Enabled;
    GroupBox17.Visible := vDadosIni.IfThen(vDadosIni.vContrapartida, True, False);
  end
  else
  begin
    GroupBox5.Visible := False;
    GroupBox17.Visible := True;
  end;
  DBEdit27.Enabled := False;
  if conta.Docs = 'S2' then
  begin
    conta.dataSet.FieldByName('RAZAO').OnGetText := nil;
    conta.dataSet.FieldByName('NOME_C').OnGetText := nil;
  end;
  DBEdit65.Enabled := (conta.DataSource.DataSet.State = dsInsert) and (not conta.Recebendo);
  if (DBEdit65.Enabled) and (DBEdit65.Visible)
  	and (vDadosIni.vEmp.vFinanceiroUnificado) and (vDadosIni.vContrapartida) then
  	DBEdit65.Enabled := false;

  SpeedButtonObsCred.Visible := (conta.DataSource.DataSet.State = dsEdit) and (not conta.Recebendo);

  DBLookupComboBox13.Enabled := (conta.DataSource.DataSet.State = dsInsert) and (not conta.Recebendo);
  if (DBLookupComboBox13.Enabled) and (DBLookupComboBox13.Visible)
  	and (vDadosIni.vEmp.vFinanceiroUnificado) and (vDadosIni.vContrapartida) then
    DBLookupComboBox13.Enabled := false;
    
  DBEdit68.Enabled := (not conta.Recebendo);
  DBComboBox4.Enabled := not conta.Recebendo;
  if (DBEdit68.Enabled) and (conta.DataSource.DataSet.State = dsEdit) then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit68.Enabled := vDadosIni.PesqPros('CAR093', 'HABILITAR', '', 'CONTROLE_CREDITOS', '', conta.buscas, False);
    DBComboBox4.Enabled := DBEdit68.Enabled;
  end;

  if GroupBox5.Visible then
  begin
    edQtdeReplicarCadastro.Enabled := (conta.DataSource.DataSet.State = dsInsert);
    edDiaVencimentoReplicarCadastro.Enabled := (conta.DataSource.DataSet.State = dsInsert);
    SpeedButton50.Enabled := (conta.DataSource.DataSet.State = dsInsert);

    ckbReplAlterarNumQdeParcelaCadastro.Enabled := (conta.DataSource.DataSet.State = dsInsert);
    ckbReplNaoAlterarNumQdeParcelaCadastro.Enabled := (conta.DataSource.DataSet.State = dsInsert);
  end;
  //  (DBEdit27.DataSource.DataSet.State = dsInsert) or (conta.Recebendo);

  if (Self.Enabled) and (Self.Visible) and (DBEdit65.CanFocus) then
  	DBEdit65.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox13.CanFocus) then
  	DBLookupComboBox13.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit24.CanFocus) then
  	DBEdit24.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
  	DBLookupComboBox4.SetFocus;
end;

procedure TfrmCadContasAReceber.habilitarDesabilitarReplicacaoCredito(
  pHab: boolean);
var
	vDataVencimento: TDateTime;
  vDiaReplicacao: Integer;
begin
	if not pHab then
  begin
  	ckbReplAlterarNumQdeParcelaCadastro.Visible := False;
    ckbReplNaoAlterarNumQdeParcelaCadastro.Visible := False;
    
    DBLookupComboBox5.Visible := True;
    
    imgReplInformation.Visible := False;
    SpeedButtonInfDadosCartao.Enabled := True;
    SpeedButton50.Caption := 'v';
    SpeedButton50.Tag := 0;
    GroupBox5.Height := 52;
  end
  else
  begin
  	ckbReplAlterarNumQdeParcelaCadastro.Visible := True;
    ckbReplNaoAlterarNumQdeParcelaCadastro.Visible := True;

    DBLookupComboBox5.Enabled := False;

    imgReplInformation.Visible := True;
  	SpeedButtonInfDadosCartao.Enabled := False;
    SpeedButton50.Caption := '^';
    SpeedButton50.Tag := 1;
    GroupBox5.Height := 105;


    imgReplInformation.Hint := '';
    imgReplInformation.Hint := imgReplInformation.Hint +
    	'Replicar alterando o número e quantidade da parcela do documento atual informado (Exemplo 2 parcelas):' + #13;

    imgReplInformation.Hint := imgReplInformation.Hint +
    	'Documento atual:' + #13 +
      '   ' +
      ' Num Doc: ' + trim(vDadosIni.IfThen(trim(conta.dataSet.FieldByName('N_DOC_C').AsString) = '', '12', conta.dataSet.FieldByName('N_DOC_C').AsString)) + '-1' +
    	' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDadosIni.IfThen(conta.dataSet.FieldByName('DATA_VENC_C').IsNull, Date, conta.dataSet.FieldByName('DATA_VENC_C').AsDateTime)) +
      ' Valor: ' + formatfloat('0.00', vDadosIni.IfThen(conta.dataSet.FieldByName('VALOR_C').AsFloat <= 0, 25, conta.dataSet.FieldByName('VALOR_C').AsFloat)) +
      ' Num Parc: ' + IntToStr(1) +
      ' Qtde Parc: ' + IntToStr(3) + #13;

    vDataVencimento := vDadosIni.IfThen(conta.dataSet.FieldByName('DATA_VENC_C').IsNull, Date, conta.dataSet.FieldByName('DATA_VENC_C').AsDateTime);
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
      ' Num Doc: ' + trim(vDadosIni.IfThen(trim(conta.dataSet.FieldByName('N_DOC_C').AsString) = '', '12', conta.dataSet.FieldByName('N_DOC_C').AsString)) + '-2' +
    	' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDataVencimento) +
      ' Valor: ' + formatfloat('0.00', vDadosIni.IfThen(conta.dataSet.FieldByName('VALOR_C').AsFloat <= 0, 25, conta.dataSet.FieldByName('VALOR_C').AsFloat)) +
      ' Num Parc: ' + IntToStr(2) +
      ' Qtde Parc: ' + IntToStr(3) + #13;

    vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
    if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), vDiaReplicacao) then
      vDataVencimento := StartOfTheMonth(vDataVencimento) + vDiaReplicacao - 1
    else
      vDataVencimento := EndOfTheMonth(vDataVencimento);

    imgReplInformation.Hint := imgReplInformation.Hint +
    	'   ' +
    	' Num Doc: ' + trim(vDadosIni.IfThen(trim(conta.dataSet.FieldByName('N_DOC_C').AsString) = '', '12', conta.dataSet.FieldByName('N_DOC_C').AsString)) + '-3' +
    	' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDataVencimento) +
      ' Valor: ' + formatfloat('0.00', vDadosIni.IfThen(conta.dataSet.FieldByName('VALOR_C').AsFloat <= 0, 25, conta.dataSet.FieldByName('VALOR_C').AsFloat)) +
      ' Num Parc: ' + IntToStr(3) +
      ' Qtde Parc: ' + IntToStr(3) + #13;

    imgReplInformation.Hint := imgReplInformation.Hint + #13;

    imgReplInformation.Hint := imgReplInformation.Hint +
    	'Replicar sem alterar o número e quantidade da parcela do documento atual informado (Exemplo 2 parcelas):' + #13;

    imgReplInformation.Hint := imgReplInformation.Hint +
    	'Documento atual:' + #13;

    imgReplInformation.Hint := imgReplInformation.Hint +
    	'   ' +
    	' Num Doc: ' + trim(vDadosIni.IfThen(trim(conta.dataSet.FieldByName('N_DOC_C').AsString) = '', '12', conta.dataSet.FieldByName('N_DOC_C').AsString)) +
      	'-' + IntToStr(vDadosIni.IfThen(conta.dataSet.FieldByName('NPARCELA').AsInteger <= 0, 1, conta.dataSet.FieldByName('NPARCELA').AsInteger)) +
    	' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDadosIni.IfThen(conta.dataSet.FieldByName('DATA_VENC_C').IsNull, Date, conta.dataSet.FieldByName('DATA_VENC_C').AsDateTime)) +
      ' Valor: ' + formatfloat('0.00', vDadosIni.IfThen(conta.dataSet.FieldByName('VALOR_C').AsFloat <= 0, 25, conta.dataSet.FieldByName('VALOR_C').AsFloat)) +
      ' Num Parc: ' + IntToStr(vDadosIni.IfThen(conta.dataSet.FieldByName('NPARCELA').AsInteger <= 0, 1, conta.dataSet.FieldByName('NPARCELA').AsInteger)) +
      ' Qtde Parc: ' + IntToStr(vDadosIni.IfThen(conta.dataSet.FieldByName('QTDE_PARC').AsInteger <= 0, 1, conta.dataSet.FieldByName('QTDE_PARC').AsInteger)) + #13;

    vDataVencimento := vDadosIni.IfThen(conta.dataSet.FieldByName('DATA_VENC_C').IsNull, Date, conta.dataSet.FieldByName('DATA_VENC_C').AsDateTime);

    imgReplInformation.Hint := imgReplInformation.Hint +
    	'Demais documentos:' + #13;
    
    vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
    if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), vDiaReplicacao) then
      vDataVencimento := StartOfTheMonth(vDataVencimento) + vDiaReplicacao - 1
    else
      vDataVencimento := EndOfTheMonth(vDataVencimento);

    imgReplInformation.Hint := imgReplInformation.Hint +
    	'   ' +
    	' Num Doc: ' + trim(vDadosIni.IfThen(trim(conta.dataSet.FieldByName('N_DOC_C').AsString) = '', '12', conta.dataSet.FieldByName('N_DOC_C').AsString)) +
      	'-1' +
    	' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDataVencimento) +
      ' Valor: ' + formatfloat('0.00', vDadosIni.IfThen(conta.dataSet.FieldByName('VALOR_C').AsFloat <= 0, 25, conta.dataSet.FieldByName('VALOR_C').AsFloat)) +
      ' Num Parc: ' + IntToStr(1) +
      ' Qtde Parc: ' + IntToStr(2) + #13;

    vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
    if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), vDiaReplicacao) then
      vDataVencimento := StartOfTheMonth(vDataVencimento) + vDiaReplicacao - 1
    else
      vDataVencimento := EndOfTheMonth(vDataVencimento);

    imgReplInformation.Hint := imgReplInformation.Hint +
	    '   ' +
  		' Num Doc: ' + trim(vDadosIni.IfThen(trim(conta.dataSet.FieldByName('N_DOC_C').AsString) = '', '12', conta.dataSet.FieldByName('N_DOC_C').AsString)) +
      	'-2' +
  		' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDataVencimento) +
      ' Valor: ' + formatfloat('0.00', vDadosIni.IfThen(conta.dataSet.FieldByName('VALOR_C').AsFloat <= 0, 25, conta.dataSet.FieldByName('VALOR_C').AsFloat)) +
      ' Num Parc: ' + IntToStr(2) +
      ' Qtde Parc: ' + IntToStr(2);
  end;
end;

procedure TfrmCadContasAReceber.imgReplInformationDblClick(Sender: TObject);
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

procedure TfrmCadContasAReceber.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (TelaCadastro <= 0) then
  begin
    ckbNaoQuitado.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + ckbNaoQuitado.Name);
    ckbQuitado.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + ckbQuitado.Name);
    CheckBox1.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + CheckBox1.Name);
  end;

  if (TelaCadastro <= 0) and (CheckBox1.Checked) then
  begin
    if Trim(_LerConfiguracoesRegistroString(conta.Docs + ComboBox11.Name)) <> '' then
    begin
      ComboBox11.Text := Trim(_LerConfiguracoesRegistroString(conta.Docs + ComboBox11.Name));
      if (ComboBox11.Text = ComboBox11.Name) then ComboBox11.Text := ComboBox1.Text;
    end
    else
      ComboBox11.Text := 'Todos';

    for I := 0 to ComboBox11.Items.Count - 1 do
    begin
      if trim(ComboBox11.Items[I]) = trim(ComboBox11.Text) then
      begin
        ComboBox11.ItemIndex := I;
        Break;
      end;
    end;

    if Trim(_LerConfiguracoesRegistroString(conta.Docs + ComboBox12.Name)) <> '' then
      ComboBox12.Text := Trim(_LerConfiguracoesRegistroString(conta.Docs + ComboBox12.Name));
    if Trim(_LerConfiguracoesRegistroString(conta.Docs + MaskEdit7.Name)) <> '' then
      MaskEdit7.Text := Trim(_LerConfiguracoesRegistroString(conta.Docs + MaskEdit7.Name));
    MaskEdit7.Visible := _LerConfiguracoesRegistroBoolean('V' + conta.Docs + MaskEdit7.Name);
    if Trim(_LerConfiguracoesRegistroString(conta.Docs + MaskEdit8.Name)) <> '' then
      MaskEdit8.Text := Trim(_LerConfiguracoesRegistroString(conta.Docs + MaskEdit8.Name));
    MaskEdit8.Visible := _LerConfiguracoesRegistroBoolean('V' + conta.Docs + MaskEdit8.Name);
    if Trim(_LerConfiguracoesRegistroString(conta.Docs + MaskEdit9.Name)) <> '' then
      MaskEdit9.Text := Trim(_LerConfiguracoesRegistroString(conta.Docs + MaskEdit9.Name));
    MaskEdit9.Visible := _LerConfiguracoesRegistroBoolean('V' + conta.Docs + MaskEdit9.Name);

    MaskEdit7.Visible := not MaskEdit9.Visible;

    CheckBox13.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + CheckBox13.Name);
    CheckBox13.Visible :=	_LerConfiguracoesRegistroBoolean('V' + conta.Docs + CheckBox13.Name, True);
  end;
end;

procedure TfrmCadContasAReceber.NotasRetornoAfterScroll(DataSet: TDataSet);
begin
  vNotasRet.abreNotasMercadorias(conta.dataSet.FieldByName('cod_cliente').AsInteger, conta.dataSet.FieldByName('COD_CRED').AsInteger, conta.dataSet.FieldByName('cod_emp_mult').AsInteger);
end;

procedure TfrmCadContasAReceber.Panel63Exit(Sender: TObject);
begin
  inherited;
  Panel63.Enabled := False;
end;

procedure TfrmCadContasAReceber.pnComissaoEnter(Sender: TObject);
begin
  inherited;
  DBText1.DataSource := nil;
  DBText2.DataSource := nil;
  DBText3.DataSource := nil;
  DBText4.DataSource := nil;
  DBText8.DataSource := nil;
  DBEdit28.DataSource := nil;
  DBEdit29.DataSource := nil;
  if conta.Docs = 'S1' then
  begin
    Panel13.Caption := 'Valor e Data do Cheque pago para comissão de Colaboradores';
    Label29.Caption := 'Cliente do Cheque:';
    Label31.Caption := 'Numero Cheque:';
    DBText1.DataField := 'COD_CLIENTE';
    DBText1.DataSource := dtmContasAReceber.dsCtrlCh;
    DBText2.DataField := 'NOME_CH';
    DBText2.DataSource := dtmContasAReceber.dsCtrlCh;
    DBText3.DataField := 'RAZAO';
    DBText3.DataSource := dtmContasAReceber.dsCtrlCh;
    DBText4.DataField := 'N_CH';
    DBText4.DataSource := dtmContasAReceber.dsCtrlCh;
    DBText8.DataField := 'VALOR_CH';
    DBText8.DataSource := dtmContasAReceber.dsCtrlCh;
    DBEdit28.DataSource := dtmContasAReceber.dsCtrlCh;
    DBEdit29.DataSource := dtmContasAReceber.dsCtrlCh;

  end
  else
  begin
    Panel13.Caption := 'Valor e Data do Crédito pago para comissão de Colaboradores';
    Label29.Caption := 'Cliente do Cheque:';
    Label31.Caption := 'Numero Documento:';
    DBText1.DataField := 'COD_CLIENTE';
    DBText1.DataSource := dtmContasAReceber.dsCtrlCr;
    DBText2.DataField := 'NOME_C';
    DBText2.DataSource := dtmContasAReceber.dsCtrlCr;
    DBText3.DataField := 'RAZAO';
    DBText3.DataSource := dtmContasAReceber.dsCtrlCr;
    DBText4.DataField := 'N_DOC_C';
    DBText4.DataSource := dtmContasAReceber.dsCtrlCr;
    DBText8.DataField := 'VALOR_C';
    DBText8.DataSource := dtmContasAReceber.dsBxCred;
    DBEdit28.DataSource := dtmContasAReceber.dsBxCred;
    DBEdit29.DataSource := dtmContasAReceber.dsBxCred;
  end;
  
  if (Self.Enabled) and (Self.Visible) and (DBEdit28.CanFocus) then
    DBEdit28.SetFocus;
end;

procedure TfrmCadContasAReceber.pnDadosBaixaDevolvEnter(Sender: TObject);
begin
  inherited;
  ck_motivo_dev.Checked  := False;
  ed_motivo_dev.Enabled  := False;
  ed_motivo_dev.Text     := ''; 
  ckHistSaidaDev.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + ckHistSaidaDev.Name);
  lbTextoHistSaidaDev.Caption := conta.dadosReceber.historicoSaidaLancamento;
  if ckHistSaidaDev.Checked then
    lbTextoHistSaidaDev.Caption := conta.dadosReceber.historicoSaidaLancamento + ' ' +
      conta.dadosReceber.nomeHistoricoSaida;
end;

procedure TfrmCadContasAReceber.pnDadosBaixaEnter(Sender: TObject);
begin
  inherited;

  CheckBox4.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + CheckBox4.Name);
  // conta.dadosReceber.usarValorCorrigido;
//  Label105.Visible := not CheckBox4.Checked;
  pnValorBaixa.Visible := conta.dadosReceber.baixaParcial;
  pnUsarValorCorrigido.Visible := not conta.dadosReceber.baixaParcial;
  CheckBox5.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + CheckBox5.Name);
  // conta.dadosReceber.acrescentarNomeHist;
  CheckBox6.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + CheckBox6.Name);
  CheckBox7.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + CheckBox7.Name);
  CheckBox8.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + CheckBox8.Name);
  Edit5.Text := conta.dadosReceber.historicoSaidaLancamento;
  MaskEdit4.Text := DateToStr(vDadosIni.diaFFinanceiro + 1);
  MaskEdit4.Enabled := (conta.Docs = 'S1') or (conta.Docs = 'S2');
  if pnValorBaixa.Visible then
  begin
  	if (Self.Enabled) and (Self.Visible) and (edValorBaixaParcial.CanFocus) then
    	edValorBaixaParcial.SetFocus;
  end
  else
  begin
  	if (Self.Enabled) and (Self.Visible) and (Edit5.CanFocus) then
    	Edit5.SetFocus;
  end;
  if CheckBox5.Checked then
    Edit5.Text := conta.dadosReceber.historicoSaidaLancamento + ' ' +
      conta.dadosReceber.nomeHistoricoSaida;
end;

procedure TfrmCadContasAReceber.pnDescontoEnter(Sender: TObject);
begin
  inherited;
  RadioGroupDescontoAcrescimoClick(Sender);
  if (Self.Enabled) and (Self.Visible) and (edDescPerc.CanFocus) then
    edDescPerc.SetFocus;
end;

procedure TfrmCadContasAReceber.pnDetalhesEnter(Sender: TObject);
begin
  inherited;

  DBText5.DataSource := nil;
  DBText6.DataSource := nil;
  DBText7.DataSource := nil;

  if conta.Docs = 'S1' then
  begin
    Label70.Caption := 'Num Cheque:';
    Label71.Caption := 'Valor Cheque:';
    Label72.Caption := 'Atenção! Cheque ainda não quitado';
    Label72.Visible := Trim(conta.dataSet.FieldByName('status_ch').AsString) = '';

    if Trim(conta.dataSet.FieldByName('TIP_BAIXA').AsString) = 'D' then
    begin
	    Label72.Caption := 'Atenção! Cheque marcado como devolvido';
      Label72.Visible := Trim(conta.dataSet.FieldByName('TIP_BAIXA').AsString) = 'D';
    end
    else if Trim(conta.dataSet.FieldByName('TIP_BAIXA').AsString) = 'C' then
    begin
      Label72.Caption := 'Atenção! Cheque utilizado para quitar contas a pagar';
      Label72.Visible := Trim(conta.dataSet.FieldByName('TIP_BAIXA').AsString) = 'C';
    end;

    DBGrid4.DataSource := dtmContasAReceber.dsBxCh;
    DBText5.DataField := 'NOME_CH';
    DBText5.DataSource := DBGrid4.DataSource;
    DBText6.DataField := 'N_CH';
    DBText6.DataSource := DBGrid4.DataSource;
    DBText7.DataField := 'VALOR_CH';
    DBText7.DataSource := DBGrid4.DataSource;
  end
  else
  begin
    Label70.Caption := 'Num Documento:';
    Label71.Caption := 'Valor Original:';
    Label72.Caption := 'Atenção! Crédito ainda não quitado';
    Label72.Visible := Trim(conta.dataSet.FieldByName('status_c').AsString) = '';

    if Trim(conta.dataSet.FieldByName('TIP_BAIXA').AsString) = 'D' then
    begin
    Label72.Caption := 'Atenção! Crédito marcado como devolvido';
    Label72.Visible := Trim(conta.dataSet.FieldByName('TIP_BAIXA').AsString) = 'D';
    end
    else if Trim(conta.dataSet.FieldByName('TIP_BAIXA').AsString) = 'C' then
    begin
      Label72.Caption := 'Atenção! Crédito utilizado para quitar contas a pagar';
      Label72.Visible := Trim(conta.dataSet.FieldByName('TIP_BAIXA').AsString) = 'C';
    end;

    DBGrid4.DataSource := dtmContasAReceber.dsBxCred;
    DBText5.DataField := 'NOME_C';
    DBText5.DataSource := dtmContasAReceber.dsBxCred;
    DBText6.DataField := 'N_DOC_C';
    DBText6.DataSource := dtmContasAReceber.dsBxCred;
    DBText7.DataField := 'VALOR_C';
    DBText7.DataSource := dtmContasAReceber.dsBxCred;

  end;

end;

procedure TfrmCadContasAReceber.pnDiferencaEnter(Sender: TObject);
begin
  inherited;
  Panel53.Caption := 'Lançar o valor da diferença: R$ ' +
    Format('%0.2n', [Abs(conta.dadosReceber.valorAtingido - conta.dadosReceber.valorOperacao)]);
  edVlContDif.AsValue := Abs(conta.dadosReceber.valorAtingido - conta.dadosReceber.valorOperacao);
  edHistoricoDiferenca.Text := conta.dadosReceber.historicoSaida;
  if conta.dadosReceber.valorAtingido > conta.dadosReceber.valorOperacao then
    DBLookupComboBox10.KeyValue := conta.dadosReceber.numContaJuros
  else
    DBLookupComboBox10.KeyValue := conta.dadosReceber.numContaDesconto;
  conta.vPCont.dataSet.Locate('N_CONTA_PLC', DBLookupComboBox10.KeyValue, []);
  DBLookupComboBox11.KeyValue := 1;
  if conta.dadosReceber.valorOperacao > conta.dadosReceber.valorAtingido then
    Label102.Caption := 'Conta de Saída'
  else
    Label102.Caption := 'Conta de Entrada';
end;

procedure TfrmCadContasAReceber.pnHistoricoEnter(Sender: TObject);
begin
  inherited;
  dtmContasAReceber.dsBuscas.DataSet := dtmContasAReceber.qrBuscas;
end;

procedure TfrmCadContasAReceber.pnHistoricoExit(Sender: TObject);
begin
  inherited;
  dtmContasAReceber.dsBuscas.DataSet := nil;
end;

procedure TfrmCadContasAReceber.pnLoteQuitEnter(Sender: TObject);
begin
  inherited;
  Panel58.Caption := 'Lote de Quitação  Nº ' + conta.dataSet.FieldByName('lote_quit').AsString;
  dtmContasAReceber.dsBuscas.DataSet := dtmContasAReceber.qrBuscas;
end;

procedure TfrmCadContasAReceber.pnLoteQuitExit(Sender: TObject);
begin
  inherited;
  dtmContasAReceber.dsBuscas.DataSet := nil;
end;

procedure TfrmCadContasAReceber.pnNegativarEnter(Sender: TObject);
begin
  inherited;

  ckbEmLote.Enabled := conta.Docs = 'S2';
  ckbCodigoMV.Enabled := conta.Docs = 'S2';
  if not ckbEmLote.Enabled then
  begin
    ckbEmLote.Checked := False;
    ckbCodigoMV.Checked := False;
  end;
end;

procedure TfrmCadContasAReceber.pnNSUEnter(Sender: TObject);
begin
  inherited;
  Panel63.Enabled := False;
end;

procedure TfrmCadContasAReceber.pnPendenciasCartaoEnter(Sender: TObject);
begin
  inherited;
  pnPendenciasCartao.Tag := 1;
  if MaskEdit5.Tag = 0 then
  begin
    MaskEdit5.Clear;
    MaskEdit6.Clear;
    MaskEdit5.Tag := 1;
  end;
end;

procedure TfrmCadContasAReceber.pnPendenciasCartaoExit(Sender: TObject);
begin
  inherited;
  pnPendenciasCartao.Tag := 0;
end;

procedure TfrmCadContasAReceber.pnRecChequeEnter(Sender: TObject);
begin
  inherited;
  Edit3.Text := conta.dadosReceber.historicoSaida;

  if (Self.Enabled) and (Self.Visible) and (DBEdit66.CanFocus) then
  	DBEdit66.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox14.CanFocus) then
  	DBLookupComboBox14.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
  	DBEdit1.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox1.CanFocus) then
  	DBLookupComboBox1.SetFocus;
end;

procedure TfrmCadContasAReceber.pnRecCreditoEnter(Sender: TObject);
begin
  inherited;
  Edit2.Text := conta.dadosReceber.historicoSaida;

  if (Self.Enabled) and (Self.Visible) and (DBEdit65.CanFocus) then
  	DBEdit65.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox13.CanFocus) then
  	DBLookupComboBox13.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit24.CanFocus) then
  	DBEdit24.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
  	DBLookupComboBox4.SetFocus;
end;

procedure TfrmCadContasAReceber.pnReceberEnter(Sender: TObject);
begin
  inherited;

  if conta.Docs = 'S1' then
    DBLookupComboBox7.KeyValue := conta.dadosReceber.numContaSCh
  else
    DBLookupComboBox7.KeyValue := conta.dadosReceber.numContaSCr;

  Edit1.Text := conta.dadosReceber.historicoSaida;

  lbDinheiro.Caption := Format('%0.2n', [conta.dadosReceber.valorDinheiro]);
  lbCheque.Caption := Format('%0.2n', [conta.dadosReceber.valorCheque]);
  lbCreditos.Caption := Format('%0.2n', [conta.dadosReceber.valorCredito]);
  lbValeCompras.Caption := Format('%0.2n', [conta.dadosReceber.valorRecibos]);

  lbAtingir.Caption := Format('%0.2n', [conta.dadosReceber.valorOperacao]);
  lbPrevisto.Visible := conta.dadosReceber.valorPrevisto > 0;
  lbPrevistoDesc.Visible := conta.dadosReceber.valorPrevisto > 0;
  lbPrevisto.Caption := Format('%0.2n', [conta.dadosReceber.valorPrevisto]);
  lbInformar.Caption := Format('%0.2n', [conta.dadosReceber.valorAInformar]);
  lbAtingido.Caption := Format('%0.2n', [conta.dadosReceber.valorAtingido]);
  DBGrid5.Visible := True;

  if (conta.dadosReceber.valorAInformar = 0) and (BitBtn14.CanFocus) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (BitBtn14.CanFocus) then
    	BitBtn14.SetFocus;
  end
  else
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBGrid5.CanFocus) then
    	DBGrid5.SetFocus;
  end;
end;

procedure TfrmCadContasAReceber.pnRecibosEnter(Sender: TObject);
begin
  inherited;
  Label98.Caption := 'Total: ' + Format('%0.2n', [conta.vReceb.vRecibo._somaRecibos]);
end;

procedure TfrmCadContasAReceber.pnReciboValorEnter(Sender: TObject);
begin
  inherited;
  Panel49.Caption := 'Informe o valor de baixa para o recibo numero: ' +
     vDadosIni.IfThen(trim(conta.vReceb.vRecibo.dataSet.FieldByName('num_rec_dep').AsString) <> '',
      conta.vReceb.vRecibo.dataSet.FieldByName('num_rec_dep').AsString, conta.vReceb.vRecibo.dataSet.FieldByName('nrecibo').AsString) +
    '. Valor: R$ ' + Format('%0.2n', [conta.vReceb.vRecibo.dataSet.FieldByName('valor').AsFloat]);
end;

procedure TfrmCadContasAReceber.pnRecLancEnter(Sender: TObject);
var
  I: Integer;
begin
  inherited;

  for I := 0 to scrollDinheiro.ControlCount - 1 do
    if scrollDinheiro.Controls[I] is TDBEdit then
      TDBEdit(scrollDinheiro.Controls[I]).DataSource := conta.DataSource
    else if scrollDinheiro.Controls[I] is TDBComboBox then
      TDBComboBox(scrollDinheiro.Controls[I]).DataSource := conta.DataSource
    else if scrollDinheiro.Controls[I] is TDBLookupComboBox then
      TDBLookupComboBox(scrollDinheiro.Controls[I]).DataSource := conta.DataSource;

  if (Self.Enabled) and (Self.Visible) and (DBEdit22.CanFocus) then
  	DBEdit22.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox8.CanFocus) then
  	DBLookupComboBox8.SetFocus;
end;

procedure TfrmCadContasAReceber.QRBand10BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlNomeEmpresa.Caption := vDadosIni.vEmp.vnomeEmpresa;
  qrlNomeEmpresa2.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadContasAReceber.QRBand11BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;

  if vBoolTemp then
    PrintBand := conta.dataSet.FieldByName('sel').AsString = 'S';

  if not PrintBand then
    Exit;

  if Trim(conta.dataSet.FieldByName('status_ch').AsString) = '' then
    vValor1 := vValor1 + conta.dataSet.FieldByName('valor_ch').AsCurrency
  else
  begin
    vValor2 := vValor2 + conta.dataSet.FieldByName('valor_ch').AsCurrency;
    //vValorJuros := vValorJuros + conta.dataSet.FieldByName('juros_cob').AsCurrency;
    //vValorDesconto := vValorDesconto + conta.dataSet.FieldByName('valor_desc').AsCurrency;
  end;
end;

procedure TfrmCadContasAReceber.QRBand12BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLabel58.Caption := Format('%n', [vValor1]);
  QRLabel84.Caption := Format('%n', [vValor1]);

  QRLabel65.Caption := Format('%n', [vValor2]);
  QRLabel86.Caption := Format('%n', [vValor2]);

  vValor1 := 0;
  vValor2 := 0;
end;

procedure TfrmCadContasAReceber.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
	QRLabel46.Caption := Format('%n', [vValor1]);
  QRLabel27.Caption := Format('%n', [vValor1]);

  QRLabel4.Caption := Format('%n', [vValor2]);
  QRLabel31.Caption := Format('%n', [vValor2]);

  QRLabel9.Caption := Format('%n', [vValorJuros]);
  QRLabel34.Caption := Format('%n', [vValorJuros]);

  QRLabel10.Caption := Format('%n', [vValorDesconto]);
  QRLabel44.Caption := Format('%n', [vValorDesconto]);

  vValor1 := 0;
  vValor2 := 0;
  vValorJuros := 0;
  vValorDesconto := 0;
end;

procedure TfrmCadContasAReceber.QRBand7BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  qrlNome_Emp.Caption := vDadosIni.vEmp.vnomeEmpresa;
	qrlNome_Emp2.Caption := vDadosIni.vEmp.vnomeEmpresa;
end;

procedure TfrmCadContasAReceber.QRBand8BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;

  if vBoolTemp then
    PrintBand := conta.dataSet.FieldByName('sel').AsString = 'S';

  if not PrintBand then
    Exit;

  if Trim(conta.dataSet.FieldByName('status_c').AsString) = '' then
    vValor1 := vValor1 + conta.dataSet.FieldByName('valor_c').AsCurrency
  else
  begin
    vValor2 := vValor2 + conta.dataSet.FieldByName('valor_c').AsCurrency;
    vValorJuros := vValorJuros + conta.dataSet.FieldByName('juros_cob').AsCurrency;
    vValorDesconto := vValorDesconto + conta.dataSet.FieldByName('valor_desc').AsCurrency;
  end;
end;

procedure TfrmCadContasAReceber.QRBand9BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QRLabel46.Caption := Format('%n', [vValor1]);
  QRLabel27.Caption := Format('%n', [vValor1]);

  QRLabel4.Caption := Format('%n', [vValor2]);
  QRLabel31.Caption := Format('%n', [vValor2]);

  QRLabel9.Caption := Format('%n', [vValorJuros]);
  QRLabel34.Caption := Format('%n', [vValorJuros]);

  QRLabel10.Caption := Format('%n', [vValorDesconto]);
  QRLabel44.Caption := Format('%n', [vValorDesconto]);

  vValor1 := 0;
  vValor2 := 0;
  vValorJuros := 0;
  vValorDesconto := 0;
end;

procedure TfrmCadContasAReceber.RadioButton1Click(Sender: TObject);
begin
  inherited;
  CheckBox11.Enabled 					:= RadioButton2.Checked;
  CheckBox12.Enabled 					:= RadioButton2.Checked;
  CheckBox16.Enabled 					:= RadioButton2.Checked;
  CheckBox17.Enabled          := RadioButton2.Checked;
  CheckBoxExibirVenda.Enabled := RadioButton2.Checked;
end;

procedure TfrmCadContasAReceber.RadioGroupDescontoAcrescimoClick(Sender: TObject);
begin
  inherited;
  Label59.Caption := 'Percentual do ' + vDadosIni.IfThen(RadioGroupDescontoAcrescimo.ItemIndex = 0, 'Desconto:', 'Acréscimo:');
  Label62.Caption := vDadosIni.IfThen(RadioGroupDescontoAcrescimo.ItemIndex = 0, 'Desconto', 'Acréscimo') + ' sobre o Valor Corrigido:';
  BitBtn36.Hint := 'OK - [' + vDadosIni.IfThen(RadioGroupDescontoAcrescimo.ItemIndex = 0, 'CAR039', 'CAR096') + ']';

  if edDescPerc.AsValue > 0 then
  begin
    edDescValor.AsValue := 0;
    if RadioGroupDescontoAcrescimo.ItemIndex = 0 then
      pnValorDaOperacao.Caption := Format('%0.2n', [conta.ValorOperacao -
        (conta.ValorOperacao * edDescPerc.AsValue / 100)])
    else
      pnValorDaOperacao.Caption := Format('%0.2n', [conta.ValorOperacao +
        (conta.ValorOperacao * edDescPerc.AsValue / 100)]);
  end
  else if edDescValor.AsValue > 0 then
  begin
    edDescPerc.AsValue := 0;
    if RadioGroupDescontoAcrescimo.ItemIndex = 0 then
    	pnValorDaOperacao.Caption := Format('%0.2n', [(conta.ValorOperacao - edDescValor.AsValue)])
    else
	    pnValorDaOperacao.Caption := Format('%0.2n', [(conta.ValorOperacao + edDescValor.AsValue)]);
  end
  else if (edDescPerc.AsValue <= 0) and (edDescValor.AsValue <= 0) then
    pnValorDaOperacao.Caption := Format('%0.2n', [conta.ValorOperacao]);
end;

procedure TfrmCadContasAReceber.rbChequeClick(Sender: TObject);
begin
  try
    inherited;

    if (rbCheque.Enabled) and (rbCheque.Checked) then
      if conta.Docs <> 'S1' then
      begin
        vDadosIni.abreStatusProcessamento('', 'Preparando Cheques');
        gravaConfiguracoesFormRegistro;
        vDadosIni.vPesquisa := 'S1';
        ScrollBox2Exit(ScrollBox2);
        ScrollBox2.Tag := Self.Top;
        if not PrimeiraPesquisa then
        begin
          salvarGridNoConfigColunas(DBGrid1);
          PrimeiraPesquisa := True;
        end;
        restoreDataSetDefault(DBGrid1, True);
        conta := TControleCheque.create;
        DBGrid1.DataSource := conta.DataSource2;
        vCriou := 0;
        vTipoCriou := 'S1';
        showForm;
        configurarGridPeloConfigColunas(DBGrid1);
        Top := ScrollBox2.Tag;
//        CheckBox1.Checked := False;
        if Panel15.Visible then
          BitBtn12.Click;
      end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmCadContasAReceber.rbCreditoClick(Sender: TObject);
begin
  try
    inherited;

    if (rbCredito.Enabled) and (rbCredito.Checked) then
      if conta.Docs <> 'S2' then
      begin
        vDadosIni.abreStatusProcessamento('', 'Preparando Créditos');
        gravaConfiguracoesFormRegistro;
        vDadosIni.vPesquisa := 'S2';
        ScrollBox2Exit(ScrollBox2);
        ScrollBox2.Tag := Self.Top;
        if not PrimeiraPesquisa then
        begin
          salvarGridNoConfigColunas(DBGrid1);
          PrimeiraPesquisa := True;
        end;
        restoreDataSetDefault(DBGrid1, True);
        conta := TControleCredito.create;
        DBGrid1.DataSource := conta.DataSource2;
        vCriou := 0;
        vTipoCriou := 'S2';
        showForm;
        configurarGridPeloConfigColunas(DBGrid1);
        Top := ScrollBox2.Tag;
//        CheckBox1.Checked := False;
        if Panel15.Visible then
          BitBtn12.Click;
      end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmCadContasAReceber.relCHBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  vValor1 := 0;
  vValor2 := 0;
  vValorJuros := 0;
  vValorDesconto := 0;
end;

procedure TfrmCadContasAReceber.relCHPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório de Cheques');
end;

procedure TfrmCadContasAReceber.relCRBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  vValor1 := 0;
  vValor2 := 0;
  vValorJuros := 0;
  vValorDesconto := 0;
end;

procedure TfrmCadContasAReceber.relCRPreview(Sender: TObject);
begin
  inherited;
  vDadosIni.VisualizaRelQrp(Sender, 'Relatório de Créditos');
end;

procedure TfrmCadContasAReceber.setarFiltro(pRecebendo: boolean);
begin
	if pRecebendo then
	  BitBtn12.Caption := '&Receber'
  else
  	BitBtn12.Caption := 'Volta&r';
  BitBtn12.Click;
end;

procedure TfrmCadContasAReceber.showForm;
var
  I: Integer;
begin

  TabSheet1.TabVisible := False;
  TabSheet2.TabVisible := False;
  TabSheet3.TabVisible := True;
  tsRelatorio.TabVisible := False;
  tsRelatorioCH.TabVisible := False;
  tsAvancado.TabVisible := False;
  tsGlobal.TabVisible := False;
  tsReceber.TabVisible := False;
  tsCartao.TabVisible := False;
  tsCadastroCredito.TabVisible := False;
  tsCadastroCheque.TabVisible := False;
  tsFaturaRec.TabVisible := False;
  tsDocumentosOrigem.TabVisible := False;

  DBGrid1.DataSource := conta.DataSource2;
  PanelLeft.Tag := PanelLeft.Width;
  PageControl1.Tag := Self.ClientWidth;
  inherited FormShow(Self);
  PanelLeft.Width := PanelLeft.Tag;
  Self.ClientWidth := PageControl1.Tag;
  InibirEstatisticas := True;
  if vCriou = 0 then
  	setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

  ComboBox11.Items := ComboBox1.Items;
  //ComboBox11.Text := ComboBox1.Text;

  ComboBox12.Items := ComboBox3.Items;
  //ComboBox12.Text := ComboBox3.Text;

  if Trim(_LerConfiguracoesRegistroString(conta.Docs + ComboBox1.Name)) <> '' then
    ComboBox1.Text := Trim(_LerConfiguracoesRegistroString(conta.Docs + ComboBox1.Name));
  if Trim(_LerConfiguracoesRegistroString(conta.Docs + ComboBox3.Name)) <> '' then
    ComboBox3.Text := Trim(_LerConfiguracoesRegistroString(conta.Docs + ComboBox3.Name));
  if Trim(_LerConfiguracoesRegistroString(conta.Docs + MaskEdit1.Name)) <> '' then
  begin
    MaskEdit1.Text := Trim(_LerConfiguracoesRegistroString(conta.Docs + MaskEdit1.Name));
    MaskEdit1.Visible := _LerConfiguracoesRegistroBoolean('V' + conta.Docs + MaskEdit1.Name);
  end;
  if Trim(_LerConfiguracoesRegistroString(conta.Docs + MaskEdit2.Name)) <> '' then
  begin
    MaskEdit2.Text := Trim(_LerConfiguracoesRegistroString(conta.Docs + MaskEdit2.Name));
    MaskEdit2.Visible := _LerConfiguracoesRegistroBoolean('V' + conta.Docs + MaskEdit2.Name);
  end;
  if Trim(_LerConfiguracoesRegistroString(conta.Docs + MaskEdit3.Name)) <> '' then
  begin
    MaskEdit3.Text := Trim(_LerConfiguracoesRegistroString(conta.Docs + MaskEdit3.Name));
    MaskEdit3.Visible := _LerConfiguracoesRegistroBoolean('V' + conta.Docs + MaskEdit3.Name);
  end;

  leConfiguracoesFormRegistro;

  configuraVisual('*' + ComboBox1.Text);

  SpeedButton9.Visible := conta.Docs = 'S1';
  btDataRealBaixa.Visible := conta.Docs = 'S2';
  SpeedButton41.Visible := conta.Docs = 'S2';
  SpeedButton42.Visible := conta.Docs = 'S2';
  SpeedButton21.Visible := conta.Docs = 'S2';
  SpeedButton26.Visible := conta.Docs = 'S2';
  GroupBox10.Enabled := vDadosIni.vEmp.vModoFaturamento = 'S';

  vDadosIni.hw_registra_estatistica(Self.Name + conta.Docs);

  if conta.Docs = 'S1' then
  begin
    Caption := 'Contas a Receber - Cheques';
    SpeedButton11.Hint :=
      'Voltar cheque para o ativo [ Quitados ] - Mudar controle do cheque [ Em Aberto ]';
  end
  else
  begin
    Caption := 'Contas a Receber - Créditos';
    SpeedButton11.Hint :=
      'Voltar créditos para o ativo [ Quitados ] - Mudar controle do crédito [ Em Aberto ]';
  end;

  vDadosIni.vInibeMensPesqPros := 'S';
  rbCheque.Enabled := vDadosIni.PesqPros('CAR001', 'HABILITAR', '', conta.Table, '', conta.buscas,
    False);
  vDadosIni.vInibeMensPesqPros := 'S';
  rbCredito.Enabled := vDadosIni.PesqPros('CAR002', 'HABILITAR', '', conta.Table, '', conta.buscas,
    False);

end;

procedure TfrmCadContasAReceber.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    conta.UsarValorAAtingir := CheckBox2.Checked;

    if conta._receberComControleSelecionado(True) then
      pnReceberEnter(pnReceber);

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton11Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'I', conta.buscas) then
    Exit;

  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'I', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'I', conta.buscas) then
      Exit;
  end;

  if conta.Docs = 'S1' then
  begin
  	if not vDadosIni.testarContasLigacao(conta.buscas, 'CHQ') then
  		Exit;
  end
  else
  begin
  	if not vDadosIni.testarContasLigacao(conta.buscas, 'PREST') then
  		Exit;
  end;

  try
    Screen.Cursor := crHourGlass;
    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(conta.buscas) then
      Exit;

    if conta.Docs = 'S1' then
    begin
	    BitBtn76.Visible := Trim(conta.dataSet.FieldByName('STATUS_CH').AsString) <> '';
      BitBtn76.Hint    := 'Exibir todos controles S1 (Cheque)';
    end
    else
    begin
    	BitBtn76.Visible := Trim(conta.dataSet.FieldByName('STATUS_C').AsString) <> '';
      BitBtn76.Hint    := 'Exibir todos controles S2 (Crédito)';
    end;

    conta._mudarControleOuVoltarParaAtivo;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    conta._enviarModuloTranf;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    DBEdit70.Enabled                   := False;
    DBEdit71.Enabled                   := False;

    bt_limpar_data_prev_rec.Visible    := False;
    bt_limpar_data_prev_rec2.Visible   := False;

    bt_alt_data_prev_rec.Visible       := True;
    bt_alt_data_prev_rec2.Visible      := True;

    bt_alt_data_prev_rec.Left          := DBEdit70.Left + DBEdit70.Width + 3;
    bt_alt_data_prev_rec2.Left         := DBEdit71.Left + DBEdit71.Width + 3;

    bt_alt_data_prev_rec.Left          := DBEdit70.Left + DBEdit70.Width + 3;
    bt_alt_data_prev_rec2.Left         := DBEdit71.Left + DBEdit71.Width + 3;

    if conta._alterarLancamentoRecebimento then
      pnReceberEnter(pnReceber);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if conta._removerLancamentoRecebimento then
      pnReceberEnter(pnReceber);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    conta.vReceb.vRecibo._marcaLinha;
    if conta.vReceb.vRecibo.dataSet.FieldByName('valor_ut').AsFloat > 0 then
      edValorDeBaixa.AsValue := conta.vReceb.vRecibo.dataSet.FieldByName('valor_ut').AsFloat
    else if (conta.dadosReceber.valorAInformar <
      conta.vReceb.vRecibo.dataSet.FieldByName('valor').AsFloat) then
      edValorDeBaixa.AsValue := conta.dadosReceber.valorAInformar
    else
      edValorDeBaixa.AsValue := conta.vReceb.vRecibo.dataSet.FieldByName('valor').AsFloat;

    if not conta.vReceb.vRecibo.dataSet.IsEmpty then     
      if conta.vReceb.vRecibo._abreFormValorBaixaRecibo then
        conta.vReceb.vRecibo._somaValor;

    Label98.Caption := 'Total: ' + Format('%0.2n', [conta.vReceb.vRecibo._somaRecibos]);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  /// modifcar a data da venda mediante a processo.
  if vDadosIni.PesqPros('CAR040', 'HABILITAR', 'NUM CH ' +
    conta.dataSet.FieldByName('N_CH').AsString + ' DATA: ' + DBEdit3.Text,
    'CONTROLE_CHEQUE', conta.dataSet.FieldByName('CODIGO_CH').AsString, conta.buscas, True) then
  begin
    DBEdit3.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBEdit3.CanFocus) then
    	DBEdit3.SetFocus;
  end;                      
end;

procedure TfrmCadContasAReceber.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    conta._efetuarSoma;
  finally
    setarFiltro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton18Click(Sender: TObject);
var
  vtemp: string;
begin
  inherited;

  if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'I', conta.buscas) then
    Exit;

  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;

  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'I', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'I', conta.buscas) then
      Exit;
  end;

  if conta.Docs = 'S1' then
  begin
  	if not vDadosIni.testarContasLigacao(conta.buscas, 'CHQ') then
  		Exit;
  end
  else
  begin
  	if not vDadosIni.testarContasLigacao(conta.buscas, 'PREST') then
  		Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    habilitarDesabilitarReplicacaoCredito(False);
    vtemp := conta.dataSet.IndexName;
    DBGrid1.Visible := False;
    conta.dadosReceber.baixaParcial := False;
    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(conta.buscas) then
      Exit;
    if not conta.validarRegistrosParaQuitacao then
    	exit;
    conta._efetuarRecebimento;
  finally
    vDadosIni.fechaStatusProcessamento;
    DBGrid1.Visible := True;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
    conta.Recebendo := true;
    setarFiltro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton19Click(Sender: TObject);
begin
  inherited;

  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;

  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'I', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'I', conta.buscas) then
      Exit;
  end;

  if conta.Docs = 'S1' then
  begin
  	if not vDadosIni.testarContasLigacao(conta.buscas, 'CHQ') then
  		Exit;
  end
  else
  begin
  	if not vDadosIni.testarContasLigacao(conta.buscas, 'PREST') then
  		Exit;
  end;
  
  try
    Screen.Cursor := crHourGlass;
    habilitarDesabilitarReplicacaoCredito(False);
    DBGrid1.Visible := False;
    conta.dadosReceber.baixaParcial := True;
    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(conta.buscas) then
      Exit;
    if not conta.validarRegistrosParaQuitacao(true) then
    	exit;
    conta._efetuarRecebimento;
  finally
    vDadosIni.fechaStatusProcessamento;
    DBGrid1.Visible := True;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    	DBGrid1.SetFocus;
    conta.Recebendo := true;
    setarFiltro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton1Click(Sender: TObject);
var
 vpermitir: boolean;
begin
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    if not conta.Recebendo then
    begin
      Screen.Cursor := crHourGlass;
      // Financeiro sendo fechado
      if vDadosIni.financeiroFechando(conta.buscas) then
        Exit;
      if not conta.Edit then
        exit;

      habilitarDesabilitarReplicacaoCredito(False);
      SpeedButtonInfDadosCartao.Enabled := True;

      Label128.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
      Label129.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
      DBEdit65.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
      DBEdit66.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
      DBLookupComboBox13.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
      DBLookupComboBox14.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
      DBEdit66.Enabled := (conta.DataSource.DataSet.State = dsInsert);
      DBLookupComboBox14.Enabled := (conta.DataSource.DataSet.State = dsInsert);
      DBEdit65.Enabled := (conta.DataSource.DataSet.State = dsInsert);
      DBLookupComboBox13.Enabled := (conta.DataSource.DataSet.State = dsInsert);
      Edit9.Text := vDadosIni.retornaDescricaoTipoNumConta('E', conta.vPCont.dataSet.FieldByName('TIPO_CTP').AsString);
      Edit11.Text := vDadosIni.retornaDescricaoTipoNumConta('E', conta.vPCont.dataSet.FieldByName('TIPO_CTP').AsString);

      DBEdit70.Enabled                   := (conta.DataSource.DataSet.State = dsInsert);
      DBEdit71.Enabled                   := (conta.DataSource.DataSet.State = dsInsert);

      bt_limpar_data_prev_rec.Visible    := (conta.DataSource.DataSet.State = dsInsert);
      bt_limpar_data_prev_rec2.Visible   := (conta.DataSource.DataSet.State = dsInsert);

      bt_alt_data_prev_rec.Visible       := (conta.DataSource.DataSet.State = dsEdit);
      bt_alt_data_prev_rec2.Visible      := (conta.DataSource.DataSet.State = dsEdit);

      if conta.DataSource.DataSet.State = dsInsert then
      begin
        bt_limpar_data_prev_rec.Left     := DBEdit70.Left + DBEdit70.Width + 3;
        bt_limpar_data_prev_rec2.Left    := DBEdit71.Left + DBEdit71.Width + 3;

        bt_alt_data_prev_rec.Left        := DBEdit70.Left + DBEdit70.Width + 3;
        bt_alt_data_prev_rec2.Left       := DBEdit71.Left + DBEdit71.Width + 3;
      end
      else
      begin
        bt_alt_data_prev_rec.Left        := DBEdit70.Left + DBEdit70.Width + 3;
        bt_alt_data_prev_rec2.Left       := DBEdit71.Left + DBEdit71.Width + 3;

        bt_alt_data_prev_rec.Left        := DBEdit70.Left + DBEdit70.Width + 3;
        bt_alt_data_prev_rec2.Left       := DBEdit71.Left + DBEdit71.Width + 3;
      end;

      if conta.dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger > 0 then
      begin
         vDadosIni.vInibeMensPesqPros := 'S';
      	vpermitir := vDadosIni.PesqPros(vDadosIni.IfThen(conta.Docs = 'S1', 'CAR095', 'CAR094'), 'HABILITAR', '', conta.Table, '', conta.buscas, False);
         DBEdit12.Enabled := vpermitir;
         DBEdit37.Enabled := vpermitir;
      end
      else
      begin
      	DBEdit12.Enabled := true;
         DBEdit37.Enabled := true;
      end;

      if (Self.Enabled) and (Self.Visible) and (BitBtn3.CanFocus) then
        BitBtn3.SetFocus;

      vDadosIni.vInibeMensPesqPros := 'S';
      if conta.Docs <> 'S1' then
       DBEdit64.Enabled := vDadosIni.PesqPros('CAR088', 'HABILITAR', '', conta.Table, conta.dataSet.FieldByName('COD_CRED').AsString, conta.buscas, False);

      PageControl1.ActivePage := TabSheet1;
      ListBox1.Clear;
      ListBox3.Clear;
      if conta.Docs = 'S1' then
      begin
        PageControl3.ActivePage := tsCadastroCheque;
        if (Self.Enabled) and (Self.Visible) and (DBEdit66.CanFocus) then
          DBEdit66.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
          DBEdit1.SetFocus;
      end
      else
      begin
        if not cdsDesp.IsEmpty then
	     	 cdsDesp.EmptyDataSet;
        PageControl3.ActivePage := tsCadastroCredito;
        if (Self.Enabled) and (Self.Visible) and (DBEdit65.CanFocus) then
          DBEdit65.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBEdit24.CanFocus) then
          DBEdit24.SetFocus;
      end;
      statusBar(panelCadastro, '');
    end
    else
      SpeedButton18.Click;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  /// modifcar a data da venda mediante a processo.
  if vDadosIni.PesqPros('CAR041', 'HABILITAR', 'NUM CRED ' +
    conta.dataSet.FieldByName('N_DOC_C').AsString + ' DATA: ' + DBEdit27.Text,
    'CONTROLE_CREDITOS', conta.dataSet.FieldByName('COD_CRED').AsString, conta.buscas, True) then
  begin
    DBEdit27.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBEdit27.CanFocus) then
    	DBEdit27.SetFocus;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton21Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('BOLETOS', 'I', conta.buscas) then
    Exit;
  try
    Screen.Cursor := crHourGlass;
    conta._gerarCarne;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton22Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    conta._detalhesRecebimento;
  finally
  	setarFiltro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;
    conta._marcarBaixaParaDevolucao;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    conta._detalhesRecebimento;
  finally
  	setarFiltro(false);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton26Click(Sender: TObject);
var
  obCartaTemp: TCartasCobranca;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CAR065', 'VISUALIZAR', '', 'ITENS_CARTA', '', conta.buscas, True)
      then
      exit;
    obCartaTemp._cadItensCartas(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton27Click(Sender: TObject);
begin
  inherited;
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;
    conta._concederAcrescimoDesconto;
  finally
  	setarFiltro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton28Click(Sender: TObject);
begin
  inherited;
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;
    conta._corrigirValor(True);
  finally
  	setarFiltro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton29Click(Sender: TObject);
begin
  inherited;
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde... Terminando processo de recebimento');

    inherited;

    BitBtn3.Enabled := True;

    ckbNaoQuitado.Enabled := True;
    ckbQuitado.Enabled := True;

    Panel2.Visible := True;
    Panel2.Enabled := True;

    Panel15.Visible := False;
    Panel15.Enabled := False;

    conta.Recebendo := False; 

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'E', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'E', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;
    conta.Delete;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton30Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES_CONTAS_BANCARIAS', 'I', conta.buscas) then
    Exit;
  if conta.vContabanc.Insert then
  begin
    conta.vContabanc.dataSet.FieldByName('cod_cliente').AsInteger :=
      conta.dataSet.FieldByName('cod_cliente').AsInteger;
    conta.vCl._selecionaCliente(conta.vContabanc.dataSet.FieldByName('cod_cliente').AsInteger, conta.dataSet.FieldByName('cod_emp_mult').AsInteger);
    conta._abreFormCadastroContasBancarias;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton31Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES_CONTAS_BANCARIAS', 'E', conta.buscas) then
    Exit;
  conta.vContabanc.delete;
end;

procedure TfrmCadContasAReceber.SpeedButton32Click(Sender: TObject);
begin
  inherited;
  TForm(pnConsultaContasBancarias.Parent).ModalResult := IDOK;
end;

procedure TfrmCadContasAReceber.SpeedButton33Click(Sender: TObject);
begin
  inherited;
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;

    conta._informarDadosTransacaoCartao;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton34Click(Sender: TObject);
begin
  inherited;
  TForm(pnConsultaContasBancarias.Parent).ModalResult := IDCANCEL;
end;

procedure TfrmCadContasAReceber.SpeedButton35Click(Sender: TObject);
var
  vimportconccartao: Tconciliacartao;
  vimportconccartaoConfere: TconciliacartaoConfere;
begin
  inherited;
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;

    if (vDadosIni.vConcCartao.vVersaoConcCartao <> '1') or (vDadosIni.vConcCartao.vHabilitarConcCartaoAPI) then
    	vimportconccartaoConfere._AbreFormRetorno(0, true)
    else
    	conta._vicularTransacaoPendente;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton36Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CAR080', 'HABILITAR', 'NUM CRED ' +
    conta.dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
    conta.dataSet.FieldByName('COD_CRED').AsString, conta.buscas, True) then
    Exit;

  Panel63.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBEdit62.CanFocus) then
  	DBEdit62.SetFocus;
end;

procedure TfrmCadContasAReceber.SpeedButton37Click(Sender: TObject);
begin
  inherited;
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

procedure TfrmCadContasAReceber.SpeedButton38Click(Sender: TObject);
begin
  inherited;
  MaskEdit5.Clear;
  Edit7Exit(MaskEdit5);
end;

procedure TfrmCadContasAReceber.SpeedButton39Click(Sender: TObject);
begin
  inherited;
  MaskEdit6.Clear;
  Edit7Exit(MaskEdit6);
end;

procedure TfrmCadContasAReceber.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crDefault;

    RadioButton1.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + RadioButton1.Name);
    RadioButton2.Checked := not RadioButton1.Checked;

    CheckBox10.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + CheckBox10.Name);
    CheckBox11.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + CheckBox11.Name);
    CheckBox16.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + CheckBox16.Name);
    CheckBox17.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + CheckBox17.Name);
    CheckBox12.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + CheckBox12.Name);
    CheckBoxExibirVenda.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + CheckBoxExibirVenda.Name);

    CheckBox15.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    if vDadosIni.vEmp.vFinanceiroUnificado then
	    CheckBox15.Checked := _LerConfiguracoesRegistroBoolean(conta.Docs + CheckBox15.Name);

    ckUsarValorCorrGerarBoleto.Checked := _LerConfiguracoesRegistroBoolean(ckUsarValorCorrGerarBoleto.Name, true);
    BitBtn54.Enabled := conta.Docs = 'S2';
    RadioButton1.Enabled := conta.Docs = 'S2';
    RadioButton2.Enabled := conta.Docs = 'S2';
    CheckBox11.Enabled := conta.Docs = 'S2';
    CheckBox12.Enabled := conta.Docs = 'S2';
    if conta.Docs = 'S1' then
      RadioButton1.Checked := True
    else
    begin
      CheckBox11.Enabled 					:= RadioButton2.Checked;
      CheckBox12.Enabled 					:= RadioButton2.Checked;
      CheckBoxExibirVenda.Enabled := RadioButton2.Checked;
    end;

    if not conta._abreFormImpressao then
      Exit;

//    if conta.Docs = 'S2' then
//      if Application.MessageBox('Deseja imprimir Boleta ?',
//        'Informação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
//      begin
//        if vDadosIni.PesqPros('BOL010', 'IMPRIMIR BOLETO', '', 'BOLETO', '', conta.buscas, true)
//          then
//        begin
//          conta._imprimirBoleto;
//          exit;
//        end
//        else
//          exit;
//      end;

    // Nao colocar o HourGlass aqui para nao ficar no formulario do relatorio
    if conta.Docs = 'S1' then
      if not vDadosIni.PesqPros('CAR011', 'RELATORIO', '', 'CONTROLE_CHEQUE', '',
        conta.buscas, False) then
        exit;
    if conta.Docs = 'S2' then
      if not vDadosIni.PesqPros('CAR012', 'RELATORIO', '', 'CONTROLE_CREDITOS', '',
        conta.buscas, False) then
        exit;

    if not vDadosIni.vEmp.vFinanceiroUnificado then
    begin
  	  QRLabel59.Left := -680;
      QRDBText35.Left := -680;

      QRLabel66.Left := -712;
      QRDBText36.Left := -712;
    end;

    if conta.Docs = 'S1' then
    begin
      vBoolTemp := conta.dadosImpressao.vSomenteSel;
//        Application.MessageBox('Imprime somente selecionados?', 'Confirmação',
//        MB_ICONQUESTION + MB_YESNO) = IDYES;

      if conta.dadosImpressao.vAgruparEmpUnf then
      begin
        try
          conta.dataSet.IndexFieldNames := 'COD_EMP_MULT';
          relCH2.Preview;
        finally
          conta.dataSet.IndexFieldNames := '';
        end;
      end
      else
	      relCH.Preview;
    end
    else
    begin
      if conta.dadosImpressao.tpImpressao = tiGrafico then
//      if Application.MessageBox('Imprime Modo Grafico?', 'Confirmação', MB_ICONQUESTION + MB_YESNO)
//        = IDYES then
      begin
        vBoolTemp := conta.dadosImpressao.vSomenteSel;
//        Application.MessageBox('Imprime somente selecionados?', 'Confirmação',
//          MB_ICONQUESTION + MB_YESNO) = IDYES;

        conta.vCtrl._abreTodosControlesCAR;
        if conta.dadosImpressao.vAgruparEmpUnf then
        begin
        	try
          	conta.dataSet.IndexFieldNames := 'COD_EMP_MULT';
        		relCR2.Preview;
          finally
          	conta.dataSet.IndexFieldNames := '';
          end;
        end
        else
	        relCR.Preview;
      end
      else
      begin
        conta._relatorioMatricial;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton40Click(Sender: TObject);
var
  vimportconccartao: Tconciliacartao;
  vimportconccartaoConfere: TconciliacartaoConfere;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'A', conta.buscas) then
    Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'I', conta.buscas) then
    Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'I', conta.buscas) then
    Exit;
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;

    if (vDadosIni.vConcCartao.vVersaoConcCartao <> '1') or (vDadosIni.vConcCartao.vHabilitarConcCartaoAPI) then
	    vimportconccartaoConfere._AbreFormRetorno(0)
    else
	    vimportconccartao._AbreFormRetorno;

    BitBtn1.Click;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton41Click(Sender: TObject);
begin
  inherited;
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;

    conta._informarObservacoes;// _informarObservacaoParaCxl;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton42Click(Sender: TObject);
begin
  inherited;
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'I', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'I', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;

    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(conta.buscas) then
      Exit;

    if not vDadosIni.VerificarinicioFechFinan(conta.buscas) then
      exit;

    conta._replicarControleCredito;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton43Click(Sender: TObject);
begin
  inherited;

  if not vDadosIni.PesqPros('CAR082', 'EXCLUIR', 'ROD ADM: ' + conta.vPendenciasCartao.dataSet.FieldByName('RO_ADM').AsString +
    ' NSU RO ADM: ' + conta.vPendenciasCartao.dataSet.FieldByName('NSU_RO_ADM').AsString +
    ' NUM AUT: ' + conta.vPendenciasCartao.dataSet.FieldByName('N_AUT_CART_CRED').AsString +
    ' NUM DOC ADM: ' + conta.vPendenciasCartao.dataSet.FieldByName('NUM_DOC_ADM').AsString +
    ' PARC: ' + conta.vPendenciasCartao.dataSet.FieldByName('NPARCELA').AsString +
    ' VALOR: ' + conta.vPendenciasCartao.dataSet.FieldByName('VALORPARCELA').AsString,
    'PENDENCIAS_CARTAO', conta.vPendenciasCartao.dataSet.FieldByName('SEQID').AsString, conta.buscas, True) then
    exit;

  conta._removerPendenciaConciliacaoCartao;

end;

procedure TfrmCadContasAReceber.SpeedButton44Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    conta._modificarDataValorComissao;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton45Click(Sender: TObject);
begin
  inherited;
  if DBEdit29.DataSource.DataSet.State in [dsInsert, dsEdit] then
    DBEdit29.DataSource.DataSet.FieldByName(DBEdit29.DataField).AsString := '';
end;

procedure TfrmCadContasAReceber.SpeedButton46Click(Sender: TObject);
begin
  inherited;
  if conta.Docs = 'S1' then
  begin
    Application.MessageBox('Funcionalida não disponível para Cheques', 'Atenção', 0 + 64);
    Exit;
  end;

  try

    vNotasRet := TNotasRetornoMercadorias.create;

    CheckBox14.Checked := conta.dataSet.IsEmpty;
    GroupBox15.Visible := not CheckBox14.Checked;

    gridCreditosRetorno.DataSource := dtmContasAReceber.dsCtrlCr;
    gridCreditosRetorno.DataSource.AutoEdit := False;

    vNotasRet.abreNotasMercadorias(conta.dataSet.FieldByName('cod_cliente').AsInteger, conta.dataSet.FieldByName('COD_CRED').AsInteger, conta.dataSet.FieldByName('cod_emp_mult').AsInteger);

    conta.dataSet.AfterScroll := NotasRetornoAfterScroll;

    vNotasRet.abreFormNotasRetornoMercadorias;

    conta.dataSet.AfterScroll := nil;

  finally
    gridCreditosRetorno.DataSource := nil;
    vNotasRet.free;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton47Click(Sender: TObject);
begin
  inherited;
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;
    conta._altervalorcorrigido;
  finally
  	setarFiltro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton48Click(Sender: TObject);
var
  vimportconccartao: Tconciliacartao;
  vimportconccartaoConfere: TconciliacartaoConfere;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'A', conta.buscas) then
    Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'I', conta.buscas) then
    Exit;
  if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'I', conta.buscas) then
    Exit;
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;

    if (vDadosIni.vConcCartao.vVersaoConcCartao <> '1') or (vDadosIni.vConcCartao.vHabilitarConcCartaoAPI) then
	    vimportconccartaoConfere._AbreFormRetorno(0, true)
    else
	    vimportconccartao._AbreFormRetorno;

    BitBtn1.Click;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton49Click(Sender: TObject);
begin
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;
    conta._atualizarValorLiq;
  finally
  	setarFiltro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton50Click(Sender: TObject);
begin
  inherited;
	if SpeedButton50.Tag = 1 then
  	habilitarDesabilitarReplicacaoCredito(False)
  else if SpeedButton17.Tag = 0 then
    habilitarDesabilitarReplicacaoCredito(True);
end;

procedure TfrmCadContasAReceber.SpeedButton51Click(Sender: TObject);
var
	NegativarClienteCredVenc: TNegativarClienteCredVenc;
begin
  inherited;
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;
    conta.abreFormNegativarClienteCredVenc(0, false);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton52Click(Sender: TObject);
begin
  inherited;
	if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;

    conta._informarDataPrevRec;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton53Click(Sender: TObject);
begin
  inherited;
	edDataPrevRec.Clear;
end;

procedure TfrmCadContasAReceber.SpeedButton54Click(Sender: TObject);
begin
  inherited;
	vDadosIni.configurarSistema('cr_%', conta.buscas);
end;

procedure TfrmCadContasAReceber.SpeedButton55Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    conta.abreFormDocumentosOrigem(0);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton57Click(Sender: TObject);
begin
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;
    conta._atualizarValorLiq;
  finally
  	setarFiltro;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButtonInfDadosCartaoClick(Sender: TObject);
begin
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;

    if not conta.Recebendo then
	    conta._informarDadosTransacaoCartao(1)
    else
    begin
    	if Trim(conta.vCtrl.dataSet.FieldByName('DOCS').AsString) = 'S2' then
	    	conta.vReceb.vCr._informarDadosTransacaoCartao(1)
      else
	      conta.vReceb.vCh._informarDadosTransacaoCartao(1);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    conta._efetuarSoma;
  finally
    setarFiltro(false);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    conta._obterHistoricoCliente;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if conta.Docs = 'S1' then
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
      Exit;
  end
  else
  begin
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', conta.buscas) then
      Exit;
  end;
  try
    Screen.Cursor := crHourGlass;
    if vDadosIni.vEmp.vUsarBarramento <> 'S' then
    begin
      Application.MessageBox('Barramento pelo Financeiro desativado no cadastro da Empresa',
        'Atenção', 0 + 64);
      Exit;
    end;
    conta._abreFormNegativarCliente;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if conta.dataSet.IsEmpty then
      Exit;

    if not vDadosIni.PesqPros('CAR025', 'CONSULTA', '', conta.Table, '', conta.buscas, false) then
      exit;

    conta.vContabanc._abreContasBancarias(conta.dataSet.FieldByName('cod_cliente').AsInteger, conta.dataSet.FieldByName('cod_emp_mult').AsInteger);
    conta.vContabanc.EmCadastroCAR := True;
    conta._abreFormConsultaContasBancarias;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmCadContasAReceber.spbContasBancariasClick(Sender: TObject);
begin
  inherited;

  try
    Screen.Cursor := crHourGlass;

    if not vDadosIni.PesqPros('CAR025', 'CONSULTA', '', conta.Table, '', conta.buscas, False) then
      exit;

    conta.vContabanc._abreContasBancarias(conta.dataSet.FieldByName('cod_cliente').AsInteger, conta.dataSet.FieldByName('cod_emp_mult').AsInteger);
    conta.vContabanc.EmCadastroCAR := True;
    if conta._abreFormConsultaContasBancarias then
      if conta.dataSet.State in [dsInsert, dsEdit] then
      begin
        conta.dataSet.FieldByName('agencia').AsString :=
          conta.vContabanc.dataSet.FieldByName('agencia').AsString;
        conta.dataSet.FieldByName('conta').AsString :=
          conta.vContabanc.dataSet.FieldByName('conta').AsString;
        conta.dataSet.FieldByName('id_banco').AsString :=
          conta.vContabanc.dataSet.FieldByName('codbanco').AsString;
        conta.dataSet.FieldByName('banco').AsString :=
          conta.vContabanc.dataSet.FieldByName('banco').AsString;
        if (DBEdit13.Tag = 1) and (DBEdit5.CanFocus) then
        begin
        	if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
          	DBEdit5.SetFocus;
        end
        else if (Self.Enabled) and (Self.Visible) and (DBEdit11.CanFocus) then
          DBEdit11.SetFocus;
      end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

function TfrmCadContasAReceber._validarDetalhes: boolean;
var
  vTemp: string;
begin
   Result := true;
    
   if (trim(conta.vBx.dataSet.FieldByName('TIP_BAIXA').AsString) = 'C')
    	and (conta.vBx.dataSet.FieldByName('LOTE').AsInteger > 0) then
    begin
      Result := false;
      
      conta.buscas.Close;
      conta.buscas.SQL.Text := ' select first 1 ctp.cod_contrp, ctp.nome_for_ctp, ctp.n_doc_ctp, ' +
        ' ctp.historico_ctp, ctp.data_venc_ctp, ctp.n_conta_plc, p.desc_plc from contas_a_pagar ctp ' +
        ' inner join p_contas p on p.n_conta_plc = ctp.n_conta_plc ' +
        ' where ctp.lote = ' + IntToStr(conta.vBx.dataSet.FieldByName('LOTE').AsInteger) +
        ' and ctp.codigo_emp = ' + vDadosIni.codEmpresa;
      conta.buscas.Open;

      if conta.Docs = 'S1' then
        vTemp := 'Cheque'
      else
        vTemp := 'Crédito';
      vTemp := vTemp + ' utilizado para quitar uma conta a pagar';
      if not conta.buscas.IsEmpty then
        vTemp := vTemp + #13 + 'Dados da conta: ' + #13 + vDadosIni.IfThen(trim(conta.buscas.FieldByName('n_doc_ctp').AsString) = '',
          'CODIGO: ' + conta.buscas.FieldByName('cod_contrp').AsString, 'NUM DOC: ' + conta.buscas.FieldByName('n_doc_ctp').AsString) + #13 +
        'HIST: ' + conta.buscas.FieldByName('historico_ctp').AsString + #13 +
        'FORNEC: ' + conta.buscas.FieldByName('nome_for_ctp').AsString + #13 +
        'VENC: ' + FormatDateTime('mm/dd/yyyy', conta.buscas.FieldByName('data_venc_ctp').AsDateTime) + #13 +
        'CONTA: ' + FloatToStr(conta.buscas.FieldByName('n_conta_plc').AsFloat) + ' - ' + trim(conta.buscas.FieldByName('desc_plc').AsString);
      Application.MessageBox(PChar(vTemp), 'Atenção', 0 + 64);
      Exit;
    end;
end;

end.

