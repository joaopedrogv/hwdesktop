unit uRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, StdCtrls, Buttons, Mask, ExtCtrls, UclassesRelatorios,
  DBCtrls, QRCtrls, uEditMoeda, Spin, Grids, DBGrids, uEditHw, CheckLst;

type
  TfrmRelatorios = class(TfrmPadrao)
    GroupBox1: TGroupBox;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    MaskEdit2: TMaskEdit;
    Label4: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ProgressBar: TProgressBar;
    imgInformation: TImage;
    Label80: TLabel;
    MemoComentario: TMemo;
    ScrollBox1: TScrollBox;
    pageRelatorios: TPageControl;
    tbsResumo: TTabSheet;
    pageResumo: TPageControl;
    TabSheet3: TTabSheet;
    tbsVendaBalcao: TTabSheet;
    Panel13: TPanel;
    tbsVendaBalcaoPariticipante: TTabSheet;
    Panel5: TPanel;
    tbsVendaOficina: TTabSheet;
    Panel14: TPanel;
    tbsVendaGeral: TTabSheet;
    Panel15: TPanel;
    tbsVendaVendedor: TTabSheet;
    Panel16: TPanel;
    tbsComprasPorPeriodo: TTabSheet;
    Panel17: TPanel;
    Label55: TLabel;
    Label56: TLabel;
    Label40: TLabel;
    Label43: TLabel;
    Label7: TLabel;
    Label13: TLabel;
    ComboBox51: TComboBox;
    ComboBox53: TComboBox;
    ComboBox35: TComboBox;
    ComboBox38: TComboBox;
    ComboBox4: TComboBox;
    ComboBox7: TComboBox;
    tbsEstoque: TTabSheet;
    Panel18: TPanel;
    Label59: TLabel;
    MaskEdit4: TMaskEdit;
    tbsResumoGeral: TTabSheet;
    tbsComissaoRecebimento: TTabSheet;
    Panel19: TPanel;
    tbsFinVendaModalidadePag: TTabSheet;
    tbsFinVendaVendedor: TTabSheet;
    tbsFinVendaVendedorComissaoServ: TTabSheet;
    Panel20: TPanel;
    DBLookupComboBox15: TDBLookupComboBox;
    CheckBox27: TCheckBox;
    DBLookupComboBox17: TDBLookupComboBox;
    CheckBox28: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox51: TCheckBox;
    DBComboBox4: TDBComboBox;
    tbsVendedores: TTabSheet;
    pnVendedores: TPanel;
    GroupBox3: TGroupBox;
    DBGrid1: TDBGrid;
    GroupBox4: TGroupBox;
    BitBtn4: TBitBtn;
    CheckBox26: TCheckBox;
    tbsRecebimentoFinanceiro: TTabSheet;
    Panel6: TPanel;
    Label35: TLabel;
    Label68: TLabel;
    lbAgruparUnificadas: TLabel;
    lbCodigoEmpUnificada: TLabel;
    ComboBox23: TComboBox;
    CheckBox57: TCheckBox;
    DBLookupComboBox33: TDBLookupComboBox;
    CheckBox58: TCheckBox;
    DBLookupComboBox34: TDBLookupComboBox;
    CheckBox59: TCheckBox;
    DBLookupComboBox35: TDBLookupComboBox;
    CheckBox60: TCheckBox;
    ComboBox24: TComboBox;
    CheckBox61: TCheckBox;
    ComboBox25: TComboBox;
    CheckBox62: TCheckBox;
    DBLookupComboBox36: TDBLookupComboBox;
    ComboBox29: TComboBox;
    cbAgruparUnificadas: TComboBox;
    edCodigoEmpUnificada: TEdit;
    tbsGerenciais: TTabSheet;
    pageGerenciais: TPageControl;
    tbsNotasEmitidasPorPeriodo: TTabSheet;
    Label8: TLabel;
    CheckBox29: TCheckBox;
    DBLookupComboBox16: TDBLookupComboBox;
    edmCFOP: TEditMoeda;
    CheckBox11: TCheckBox;
    ComboBox11: TComboBox;
    ComboBox5: TComboBox;
    tbsProdutosComPendenciasEmOSREQ: TTabSheet;
    tbsRequisicoesEmitidasPorPeriodo: TTabSheet;
    Panel21: TPanel;
    Label57: TLabel;
    Label84: TLabel;
    ComboBox40: TComboBox;
    DBLookupComboBox18: TDBLookupComboBox;
    CheckBox31: TCheckBox;
    DBEdit9: TDBEdit;
    CheckBox36: TCheckBox;
    DBLookupComboBox21: TDBLookupComboBox;
    CheckBox67: TCheckBox;
    DBLookupComboBox42: TDBLookupComboBox;
    DBEdit25: TDBEdit;
    RadioGroupRouF1: TRadioGroup;
    tbsOrdensDeServicosEmitidasPorPeriodo: TTabSheet;
    Panel22: TPanel;
    Label44: TLabel;
    Label85: TLabel;
    ComboBox52: TComboBox;
    CheckBox30: TCheckBox;
    DBLookupComboBox19: TDBLookupComboBox;
    CheckBox45: TCheckBox;
    DBLookupComboBox26: TDBLookupComboBox;
    DBEdit15: TDBEdit;
    CheckBox52: TCheckBox;
    DBComboBox5: TDBComboBox;
    CheckBox68: TCheckBox;
    DBLookupComboBox43: TDBLookupComboBox;
    DBEdit26: TDBEdit;
    RadioGroupRouF2: TRadioGroup;
    tbsRequisicoesOrdemServicoEmitidasPorPeriodo: TTabSheet;
    Panel28: TPanel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label86: TLabel;
    ComboBox34: TComboBox;
    CheckBox69: TCheckBox;
    DBLookupComboBox44: TDBLookupComboBox;
    CheckBox70: TCheckBox;
    DBLookupComboBox45: TDBLookupComboBox;
    DBEdit27: TDBEdit;
    CheckBox71: TCheckBox;
    DBComboBox6: TDBComboBox;
    CheckBox72: TCheckBox;
    DBLookupComboBox46: TDBLookupComboBox;
    DBEdit28: TDBEdit;
    CheckBox73: TCheckBox;
    DBLookupComboBox47: TDBLookupComboBox;
    ComboBox60: TComboBox;
    ComboBox61: TComboBox;
    RadioGroupRouF3: TRadioGroup;
    tbsRecibos: TTabSheet;
    pageRecibos: TPageControl;
    tbsRecibosEmitidos: TTabSheet;
    Panel27: TPanel;
    Label63: TLabel;
    Label62: TLabel;
    ComboBox56: TComboBox;
    ComboBox57: TComboBox;
    tbsInventarioRec: TTabSheet;
    Panel26: TPanel;
    Label65: TLabel;
    Label66: TLabel;
    MaskEdit8: TMaskEdit;
    ComboBox58: TComboBox;
    tbsHistoricoRecibos: TTabSheet;
    Panel25: TPanel;
    Label61: TLabel;
    ComboBox59: TComboBox;
    tbsListaDeAlteracaoDePreco: TTabSheet;
    Panel23: TPanel;
    Label58: TLabel;
    ComboBox54: TComboBox;
    tbsRelatoriosdeVendasPlacaCliente: TTabSheet;
    Panel24: TPanel;
    Label60: TLabel;
    labelperiodo: TLabel;
    ComboBox55: TComboBox;
    DBLookupComboBox20: TDBLookupComboBox;
    CheckBox32: TCheckBox;
    DBEdit10: TDBEdit;
    CheckBox33: TCheckBox;
    CheckBox34: TCheckBox;
    CheckBox35: TCheckBox;
    CheckBox37: TCheckBox;
    MaskEdit5: TMaskEdit;
    CheckBox6: TCheckBox;
    tbsRelatoriodeVendasObjetoCliente: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    labelPeriodo1: TLabel;
    ComboBox1: TComboBox;
    DBLookupComboBox22: TDBLookupComboBox;
    CheckBox1: TCheckBox;
    DBEdit11: TDBEdit;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    DBLookupComboBox23: TDBLookupComboBox;
    DBEdit12: TDBEdit;
    tbsRelatorioApuracaoICMS: TTabSheet;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ComboBox3: TComboBox;
    EditHw1: TEditHw;
    EditHw2: TEditHw;
    EditHw3: TEditHw;
    ComboBox6: TComboBox;
    tbsRelatorioVeiculosNegociados: TTabSheet;
    Label14: TLabel;
    CheckBox8: TCheckBox;
    DBLookupComboBox24: TDBLookupComboBox;
    DBEdit13: TDBEdit;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    CheckBox9: TCheckBox;
    CheckBox10: TCheckBox;
    ComboBox10: TComboBox;
    tbsRelatorioVeiculosemDemonstracao: TTabSheet;
    Label15: TLabel;
    CheckBox38: TCheckBox;
    ComboBox12: TComboBox;
    ComboBox13: TComboBox;
    tbsRelatorioAcompanhamentodeVeiculo: TTabSheet;
    tbsRelatorioPosicaodeEstoqueVeiculos: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid2: TDBGrid;
    RadioGroup1: TRadioGroup;
    tbsRelatorioVeiculosemTransito: TTabSheet;
    Label16: TLabel;
    ComboBox14: TComboBox;
    tbsRelatorioDiarioDiretoria: TTabSheet;
    Label17: TLabel;
    EditHw4: TEditHw;
    tbsInventarioVeiculos: TTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    EditHw5: TEditHw;
    ComboBox15: TComboBox;
    EditHw6: TEditHw;
    EditHw7: TEditHw;
    CheckBox39: TCheckBox;
    CheckBox40: TCheckBox;
    CheckBox41: TCheckBox;
    CheckBox42: TCheckBox;
    CheckBox43: TCheckBox;
    MaskEdit3: TMaskEdit;
    tsbRelatorioSituacaodoEstoqueFechado: TTabSheet;
    Label21: TLabel;
    CheckBox44: TCheckBox;
    DBLookupComboBox25: TDBLookupComboBox;
    DBEdit14: TDBEdit;
    ComboBox16: TComboBox;
    tbsRelatorioVeiculosPagosAntecipados: TTabSheet;
    tbsRelatorioVeiculosQueChegaramAntesDoPagamento: TTabSheet;
    Label24: TLabel;
    MaskEdit6: TMaskEdit;
    tbsRelatorioFaturamentodeVeiculos: TTabSheet;
    CheckBox46: TCheckBox;
    DBLookupComboBox27: TDBLookupComboBox;
    DBEdit16: TDBEdit;
    ckGerente: TCheckBox;
    ckConcessionaria: TCheckBox;
    ckEstoque: TCheckBox;
    ckConsignado: TCheckBox;
    ckIntermediacao: TCheckBox;
    ckEstoqueReal: TCheckBox;
    tbsRelatorioparaGerenciaVeiculos: TTabSheet;
    ckEstoque2: TCheckBox;
    ckConsignado2: TCheckBox;
    ckIntermediacao2: TCheckBox;
    ckGerente2: TCheckBox;
    tbsRelatorioTabeladePrecosVeiculos: TTabSheet;
    Label25: TLabel;
    ckEstoque3: TCheckBox;
    ckConsignado3: TCheckBox;
    ckIntermediacao3: TCheckBox;
    cbMarca: TComboBox;
    tbsRelatorioRecebimentodeVeiculos: TTabSheet;
    tbsRelatorioDespesasdeVeiculos: TTabSheet;
    Label29: TLabel;
    ckEstoque4: TCheckBox;
    ckConsignado4: TCheckBox;
    ckIntermediacao4: TCheckBox;
    ckConcessionaria4: TCheckBox;
    ComboBox18: TComboBox;
    tbsRelatorioPendenciasdeVeiculos: TTabSheet;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    EditChassi: TEdit;
    EditPlaca: TEdit;
    CheckBox47: TCheckBox;
    DBLookupComboBox28: TDBLookupComboBox;
    RadioGroupSituacao: TRadioGroup;
    DBEdit17: TDBEdit;
    ComboBox17: TComboBox;
    tbsRelatorioContratoContaCorrente: TTabSheet;
    Panel7: TPanel;
    Label37: TLabel;
    Label64: TLabel;
    CheckBox63: TCheckBox;
    DBLookupComboBox37: TDBLookupComboBox;
    DBEdit21: TDBEdit;
    EditMoedaTotpontosVencimentos: TEditMoeda;
    tbsRelatorioVendasRecProgFid: TTabSheet;
    Panel8: TPanel;
    Label67: TLabel;
    ComboBox27: TComboBox;
    CheckBox64: TCheckBox;
    DBLookupComboBox38: TDBLookupComboBox;
    DBEdit22: TDBEdit;
    tbsRelatorioTitulosporRota: TTabSheet;
    Panel9: TPanel;
    Panel10: TPanel;
    Label69: TLabel;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    ckCartao: TCheckBox;
    ckFinanc: TCheckBox;
    ckBoleta: TCheckBox;
    ckChequePre: TCheckBox;
    DBLookupComboBox39: TDBLookupComboBox;
    RadioGroupRouF: TRadioGroup;
    ComboBoxValorCorrigido: TComboBox;
    ckOutros: TCheckBox;
    DBGrid3: TDBGrid;
    tbsRelatorioComissaoPorVenda: TTabSheet;
    Panel11: TPanel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    ComboBox30: TComboBox;
    ComboBox31: TComboBox;
    CheckBox65: TCheckBox;
    DBLookupComboBox40: TDBLookupComboBox;
    CheckBox66: TCheckBox;
    DBLookupComboBox41: TDBLookupComboBox;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    RadioGroupRouFComissaoPorVenda: TRadioGroup;
    ComboBox32: TComboBox;
    ComboBox33: TComboBox;
    ComboBoXMovVenc: TComboBox;
    tbsComentario: TTabSheet;
    pnComentario: TPanel;
    Panel12: TPanel;
    BitBtn5: TBitBtn;
    GroupBox2: TGroupBox;
    MemoComentario2: TMemo;
    tbsVendaVendedorComissaoFaixaDesc: TTabSheet;
    Panel29: TPanel;
    tbsPagamentoFinanceiro: TTabSheet;
    Panel30: TPanel;
    Label89: TLabel;
    ComboBox64: TComboBox;
    CheckBox80: TCheckBox;
    DBLookupComboBox52: TDBLookupComboBox;
    Label90: TLabel;
    ComboBox65: TComboBox;
    lbCodigoEmpUnificada2: TLabel;
    edCodigoEmpUnificada2: TEdit;
    lbAgruparUnificadas2: TLabel;
    cbAgruparUnificadas2: TComboBox;
    DBLookupComboBox32: TDBLookupComboBox;
    CheckBox56: TCheckBox;
    DBEdit20: TDBEdit;
    DBLookupComboBox53: TDBLookupComboBox;
    CheckBox81: TCheckBox;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    tbsPagamentoRecebimentoFinanceiro: TTabSheet;
    Panel31: TPanel;
    Label91: TLabel;
    Label92: TLabel;
    lbAgruparUnificadas3: TLabel;
    lbCodigoEmpUnificada3: TLabel;
    ComboBox66: TComboBox;
    CheckBox82: TCheckBox;
    DBLookupComboBox54: TDBLookupComboBox;
    CheckBox83: TCheckBox;
    DBLookupComboBox55: TDBLookupComboBox;
    CheckBox84: TCheckBox;
    DBLookupComboBox56: TDBLookupComboBox;
    CheckBox85: TCheckBox;
    ComboBox67: TComboBox;
    CheckBox86: TCheckBox;
    ComboBox68: TComboBox;
    CheckBox87: TCheckBox;
    DBLookupComboBox57: TDBLookupComboBox;
    ComboBox69: TComboBox;
    cbAgruparUnificadas3: TComboBox;
    edCodigoEmpUnificada3: TEdit;
    DBLookupComboBox58: TDBLookupComboBox;
    CheckBox88: TCheckBox;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    CheckBox89: TCheckBox;
    DBLookupComboBox59: TDBLookupComboBox;
    DBEdit36: TDBEdit;
    CheckBox90: TCheckBox;
    DBLookupComboBox60: TDBLookupComboBox;
    DBEdit37: TDBEdit;
    CheckBox91: TCheckBox;
    DBLookupComboBox61: TDBLookupComboBox;
    DBEdit38: TDBEdit;
    Label93: TLabel;
    ComboBox70: TComboBox;
    Label94: TLabel;
    ComboBox71: TComboBox;
    Label95: TLabel;
    ComboBox72: TComboBox;
    tbsRecebimentoCaixaAuxiliar: TTabSheet;
    Panel32: TPanel;
    Label96: TLabel;
    ComboBox73: TComboBox;
    Label97: TLabel;
    Edit1: TEdit;
    lbCodigoEmpUnificada4: TLabel;
    edCodigoEmpUnificada4: TEdit;
    lbAgruparUnificadas4: TLabel;
    cbAgruparUnificadas4: TComboBox;
    CheckBox92: TCheckBox;
    ComboBox75: TComboBox;
    DBLookupComboBox62: TDBLookupComboBox;
    CheckBox93: TCheckBox;
    CheckBox94: TCheckBox;
    DBLookupComboBox63: TDBLookupComboBox;
    CheckBox95: TCheckBox;
    DBLookupComboBox64: TDBLookupComboBox;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    Label98: TLabel;
    ComboBox74: TComboBox;
    Label99: TLabel;
    ComboBox76: TComboBox;
    Label100: TLabel;
    ComboBox77: TComboBox;
    Label101: TLabel;
    ComboBox78: TComboBox;
    Label102: TLabel;
    ComboBox79: TComboBox;
    Label103: TLabel;
    ComboBox80: TComboBox;
    Label104: TLabel;
    ComboBox81: TComboBox;
    Panel33: TPanel;
    Label41: TLabel;
    ComboBox36: TComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    CheckBox14: TCheckBox;
    Panel34: TPanel;
    CheckListBox1: TCheckListBox;
    CheckBox13: TCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    Panel35: TPanel;
    Label39: TLabel;
    Label42: TLabel;
    Label36: TLabel;
    ComboBox37: TComboBox;
    ComboBox41: TComboBox;
    ComboBox26: TComboBox;
    CheckBox12: TCheckBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    btSelectAllVendSaidasBalcao: TSpeedButton;
    btUnSelectAllVendSaidasBalcao: TSpeedButton;
    Panel36: TPanel;
    Label32: TLabel;
    ComboBox20: TComboBox;
    DBLookupComboBox31: TDBLookupComboBox;
    CheckBox55: TCheckBox;
    Panel37: TPanel;
    DBLookupComboBox29: TDBLookupComboBox;
    DBEdit18: TDBEdit;
    CheckBox96: TCheckBox;
    btSelectAllVendSaidasBalcaoPart: TSpeedButton;
    btUnSelectAllVendSaidasBalcaoPart: TSpeedButton;
    CheckListBox2: TCheckListBox;
    Panel38: TPanel;
    Label31: TLabel;
    Label33: TLabel;
    Label38: TLabel;
    ComboBox21: TComboBox;
    CheckBox53: TCheckBox;
    DBLookupComboBox30: TDBLookupComboBox;
    DBEdit19: TDBEdit;
    ComboBox22: TComboBox;
    ComboBox28: TComboBox;
    Label34: TLabel;
    Panel39: TPanel;
    Label47: TLabel;
    ComboBox43: TComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    CheckBox17: TCheckBox;
    Panel40: TPanel;
    CheckBox16: TCheckBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    CheckListBox3: TCheckListBox;
    btSelectAllVendSaidasProdServ: TSpeedButton;
    btUnSelectAllVendSaidasProdServ: TSpeedButton;
    Panel41: TPanel;
    CheckBox15: TCheckBox;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit4: TDBEdit;
    CheckBox48: TCheckBox;
    DBComboBox1: TDBComboBox;
    Label45: TLabel;
    ComboBox44: TComboBox;
    Label50: TLabel;
    ComboBox48: TComboBox;
    Panel42: TPanel;
    Label48: TLabel;
    ComboBox42: TComboBox;
    DBLookupComboBox9: TDBLookupComboBox;
    CheckBox20: TCheckBox;
    CheckBox21: TCheckBox;
    DBLookupComboBox10: TDBLookupComboBox;
    Panel43: TPanel;
    CheckBox19: TCheckBox;
    DBLookupComboBox7: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    CheckListBox4: TCheckListBox;
    btSelectAllVendSaidasGeral: TSpeedButton;
    btUnSelectAllVendSaidasGeral: TSpeedButton;
    Panel44: TPanel;
    CheckBox18: TCheckBox;
    DBLookupComboBox8: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    CheckBox49: TCheckBox;
    DBComboBox2: TDBComboBox;
    Label46: TLabel;
    ComboBox45: TComboBox;
    Label49: TLabel;
    ComboBox46: TComboBox;
    Panel45: TPanel;
    Label52: TLabel;
    ComboBox47: TComboBox;
    DBLookupComboBox13: TDBLookupComboBox;
    CheckBox24: TCheckBox;
    CheckBox25: TCheckBox;
    DBLookupComboBox14: TDBLookupComboBox;
    Panel46: TPanel;
    CheckBox23: TCheckBox;
    DBLookupComboBox11: TDBLookupComboBox;
    DBEdit7: TDBEdit;
    CheckListBox5: TCheckListBox;
    btSelectAllVendSaidasVend: TSpeedButton;
    btUnSelectAllVendSaidasVend: TSpeedButton;
    Panel47: TPanel;
    CheckBox50: TCheckBox;
    DBComboBox3: TDBComboBox;
    Label51: TLabel;
    ComboBox49: TComboBox;
    Label53: TLabel;
    ComboBox50: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label30: TLabel;
    ComboBox19: TComboBox;
    Panel48: TPanel;
    Label54: TLabel;
    ComboBox39: TComboBox;
    Panel49: TPanel;
    CheckBox22: TCheckBox;
    DBLookupComboBox12: TDBLookupComboBox;
    DBEdit8: TDBEdit;
    Panel50: TPanel;
    CheckBox74: TCheckBox;
    DBLookupComboBox48: TDBLookupComboBox;
    DBEdit29: TDBEdit;
    btSelectAllVendComissProdRec: TSpeedButton;
    btUnSelectAllVendComissProdRec: TSpeedButton;
    CheckListBox6: TCheckListBox;
    Panel51: TPanel;
    Label88: TLabel;
    ComboBox62: TComboBox;
    DBLookupComboBox50: TDBLookupComboBox;
    CheckBox76: TCheckBox;
    CheckBox77: TCheckBox;
    DBLookupComboBox51: TDBLookupComboBox;
    Panel52: TPanel;
    CheckBox75: TCheckBox;
    DBLookupComboBox49: TDBLookupComboBox;
    DBEdit30: TDBEdit;
    CheckListBox7: TCheckListBox;
    btSelectAllVendComissFaixaDesc: TSpeedButton;
    btUnSelectAllVendComissFaixaDesc: TSpeedButton;
    Panel53: TPanel;
    CheckBox78: TCheckBox;
    DBComboBox7: TDBComboBox;
    CheckBox79: TCheckBox;
    Label87: TLabel;
    ComboBox63: TComboBox;
    Label105: TLabel;
    ComboBox82: TComboBox;
    Label106: TLabel;
    ComboBox83: TComboBox;
    Label107: TLabel;
    ComboBox84: TComboBox;
    Label108: TLabel;
    ComboBox85: TComboBox;
    Label109: TLabel;
    ComboBox86: TComboBox;
    Label110: TLabel;
    ComboBox87: TComboBox;
    Label111: TLabel;
    ComboBox88: TComboBox;
    Label112: TLabel;
    ComboBox89: TComboBox;
    tbsVendaVendedorAcrescCondPagVend: TTabSheet;
    Panel54: TPanel;
    Panel55: TPanel;
    Label113: TLabel;
    ComboBox90: TComboBox;
    DBLookupComboBox65: TDBLookupComboBox;
    CheckBox54: TCheckBox;
    CheckBox97: TCheckBox;
    DBLookupComboBox66: TDBLookupComboBox;
    Panel56: TPanel;
    btSelectAllVendSaidasVendAcrescVend: TSpeedButton;
    btUnSelectAllVendSaidasVendAcrescVend: TSpeedButton;
    CheckBox98: TCheckBox;
    DBEdit42: TDBEdit;
    CheckListBox8: TCheckListBox;
    DBLookupComboBox67: TDBLookupComboBox;
    Panel57: TPanel;
    Label114: TLabel;
    Label115: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    CheckBox99: TCheckBox;
    DBComboBox8: TDBComboBox;
    ComboBox91: TComboBox;
    ComboBox92: TComboBox;
    ComboBox94: TComboBox;
    ComboBox95: TComboBox;
    ComboBox96: TComboBox;
    Label120: TLabel;
    ComboBox97: TComboBox;
    procedure btUnSelectAllVendSaidasVendAcrescVendClick(Sender: TObject);
    procedure btSelectAllVendSaidasVendAcrescVendClick(Sender: TObject);
    procedure CheckBox98Click(Sender: TObject);
    procedure CheckBox99Click(Sender: TObject);
    procedure CheckBox54Click(Sender: TObject);
    procedure CheckBox97Click(Sender: TObject);
    procedure ComboBox92Exit(Sender: TObject);
    procedure ComboBox90Exit(Sender: TObject);
    procedure tbsVendaVendedorAcrescCondPagVendShow(Sender: TObject);
    procedure Panel54Enter(Sender: TObject);
    procedure ComboBox50Exit(Sender: TObject);
    procedure ComboBox51Exit(Sender: TObject);
    procedure ComboBox51Change(Sender: TObject);
    procedure ComboBox53Exit(Sender: TObject);
    procedure ComboBox53Change(Sender: TObject);
    procedure ComboBox82Exit(Sender: TObject);
    procedure ComboBox82Change(Sender: TObject);
    procedure btUnSelectAllVendComissFaixaDescClick(Sender: TObject);
    procedure btSelectAllVendComissFaixaDescClick(Sender: TObject);
    procedure btUnSelectAllVendComissProdRecClick(Sender: TObject);
    procedure btSelectAllVendComissProdRecClick(Sender: TObject);
    procedure btUnSelectAllVendSaidasVendClick(Sender: TObject);
    procedure btSelectAllVendSaidasVendClick(Sender: TObject);
    procedure btUnSelectAllVendSaidasGeralClick(Sender: TObject);
    procedure btSelectAllVendSaidasGeralClick(Sender: TObject);
    procedure btUnSelectAllVendSaidasProdServClick(Sender: TObject);
    procedure btSelectAllVendSaidasProdServClick(Sender: TObject);
    procedure CheckBox96Click(Sender: TObject);
    procedure btUnSelectAllVendSaidasBalcaoPartClick(Sender: TObject);
    procedure btSelectAllVendSaidasBalcaoPartClick(Sender: TObject);
    procedure btUnSelectAllVendSaidasBalcaoClick(Sender: TObject);
    procedure btSelectAllVendSaidasBalcaoClick(Sender: TObject);
    procedure ComboBox80Exit(Sender: TObject);
    procedure CheckBox92Click(Sender: TObject);
    procedure ComboBox73Exit(Sender: TObject);
    procedure tbsRecebimentoCaixaAuxiliarShow(Sender: TObject);
    procedure CheckBox95Click(Sender: TObject);
    procedure CheckBox94Click(Sender: TObject);
    procedure CheckBox93Click(Sender: TObject);
    procedure ComboBox66Exit(Sender: TObject);
    procedure ComboBox23Exit(Sender: TObject);
    procedure ComboBox64Exit(Sender: TObject);
    procedure CheckBox91Click(Sender: TObject);
    procedure CheckBox90Click(Sender: TObject);
    procedure CheckBox89Click(Sender: TObject);
    procedure CheckBox86Click(Sender: TObject);
    procedure CheckBox87Click(Sender: TObject);
    procedure CheckBox85Click(Sender: TObject);
    procedure CheckBox82Click(Sender: TObject);
    procedure CheckBox83Click(Sender: TObject);
    procedure CheckBox84Click(Sender: TObject);
    procedure DBLookupComboBox58KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox88Click(Sender: TObject);
    procedure tbsPagamentoRecebimentoFinanceiroShow(Sender: TObject);
    procedure DBLookupComboBox53KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox81Click(Sender: TObject);
    procedure DBLookupComboBox32KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox22KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox46KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox43KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox56Click(Sender: TObject);
    procedure CheckBox80Click(Sender: TObject);
    procedure edCodigoEmpUnificada2KeyPress(Sender: TObject; var Key: Char);
    procedure tbsPagamentoFinanceiroShow(Sender: TObject);
    procedure tbsVendaVendedorComissaoFaixaDescShow(Sender: TObject);
    procedure Panel29Enter(Sender: TObject);
    procedure CheckBox75Click(Sender: TObject);
    procedure CheckBox76Click(Sender: TObject);
    procedure CheckBox78Click(Sender: TObject);
    procedure CheckBox77Click(Sender: TObject);
    procedure ComboBox62Exit(Sender: TObject);
    procedure pageRelatoriosChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CheckBox74Click(Sender: TObject);
    procedure CheckBox72Click(Sender: TObject);
    procedure CheckBox71Click(Sender: TObject);
    procedure CheckBox69Click(Sender: TObject);
    procedure CheckBox73Click(Sender: TObject);
    procedure CheckBox70Click(Sender: TObject);
    procedure tbsRequisicoesOrdemServicoEmitidasPorPeriodoShow(Sender: TObject);
    procedure CheckBox68Click(Sender: TObject);
    procedure CheckBox67Click(Sender: TObject);
    procedure pnComentarioEnter(Sender: TObject);
    procedure DBLookupComboBox37KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckGerenteClick(Sender: TObject);
    procedure MemoComentarioDblClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure edCodigoEmpUnificadaKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox33Exit(Sender: TObject);
    procedure CheckBox66Click(Sender: TObject);
    procedure CheckBox65Click(Sender: TObject);
    procedure tbsRelatorioComissaoPorVendaShow(Sender: TObject);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ckCartaoClick(Sender: TObject);
    procedure tbsRelatorioTitulosporRotaShow(Sender: TObject);
    procedure CheckBox64Click(Sender: TObject);
    procedure tbsRelatorioVendasRecProgFidShow(Sender: TObject);
    procedure CheckBox63Click(Sender: TObject);
    procedure tbsRelatorioContratoContaCorrenteShow(Sender: TObject);
    procedure CheckBox62Click(Sender: TObject);
    procedure CheckBox61Click(Sender: TObject);
    procedure CheckBox60Click(Sender: TObject);
    procedure CheckBox59Click(Sender: TObject);
    procedure CheckBox58Click(Sender: TObject);
    procedure CheckBox57Click(Sender: TObject);
    procedure tbsRecebimentoFinanceiroShow(Sender: TObject);
    procedure tbsVendaBalcaoPariticipanteShow(Sender: TObject);
    procedure CheckBox53Click(Sender: TObject);
    procedure Label34Click(Sender: TObject);
    procedure CheckBox55Click(Sender: TObject);
    procedure tbsRecibosShow(Sender: TObject);
    procedure pageGerenciaisChange(Sender: TObject);
    procedure CheckBox52Click(Sender: TObject);
    procedure CheckBox51Click(Sender: TObject);
    procedure CheckBox50Click(Sender: TObject);
    procedure CheckBox49Click(Sender: TObject);
    procedure CheckBox48Click(Sender: TObject);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure CheckBox47Click(Sender: TObject);
    procedure tbsRelatorioPendenciasdeVeiculosShow(Sender: TObject);
    procedure tbsRelatorioDespesasdeVeiculosShow(Sender: TObject);
    procedure tbsRelatorioRecebimentodeVeiculosShow(Sender: TObject);
    procedure ckIntermediacao3Click(Sender: TObject);
    procedure ckConsignado3Click(Sender: TObject);
    procedure ckEstoque3Click(Sender: TObject);
    procedure tbsRelatorioTabeladePrecosVeiculosShow(Sender: TObject);
    procedure ckIntermediacao2Click(Sender: TObject);
    procedure ckConsignado2Click(Sender: TObject);
    procedure ckEstoque2Click(Sender: TObject);
    procedure tbsRelatorioparaGerenciaVeiculosShow(Sender: TObject);
    procedure ckEstoqueRealClick(Sender: TObject);
    procedure ckConcessionariaClick(Sender: TObject);
    procedure CheckBox46Click(Sender: TObject);
    procedure ckIntermediacaoClick(Sender: TObject);
    procedure ckConsignadoClick(Sender: TObject);
    procedure ckEstoqueClick(Sender: TObject);
    procedure tbsRelatorioFaturamentodeVeiculosShow(Sender: TObject);
    procedure tbsRelatorioVeiculosQueChegaramAntesDoPagamentoShow(
      Sender: TObject);
    procedure tbsRelatorioVeiculosPagosAntecipadosShow(Sender: TObject);
    procedure CheckBox45Click(Sender: TObject);
    procedure CheckBox44Click(Sender: TObject);
    procedure tsbRelatorioSituacaodoEstoqueFechadoShow(Sender: TObject);
    procedure tbsInventarioVeiculosShow(Sender: TObject);
    procedure Panel16Enter(Sender: TObject);
    procedure tbsRelatorioDiarioDiretoriaShow(Sender: TObject);
    procedure tbsRelatorioVeiculosemTransitoShow(Sender: TObject);
    procedure DBGrid2ColExit(Sender: TObject);
    procedure DBGrid2ColEnter(Sender: TObject);
    procedure tbsRelatorioPosicaodeEstoqueVeiculosShow(Sender: TObject);
    procedure tbsRelatorioAcompanhamentodeVeiculoShow(Sender: TObject);
    procedure CheckBox38Click(Sender: TObject);
    procedure tbsRelatorioVeiculosemDemonstracaoShow(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure tbsRelatorioVeiculosNegociadosShow(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure ComboBox3Exit(Sender: TObject);
    procedure tbsRelatorioApuracaoICMSShow(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure pageResumoChange(Sender: TObject);
    procedure Panel24Enter(Sender: TObject);
    procedure Panel1Enter(Sender: TObject);
    procedure DBLookupComboBox23KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox5Click(Sender: TObject);
    procedure tbsRelatoriodeVendasObjetoClienteShow(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure tbsHistoricoRecibosShow(Sender: TObject);
    procedure tbsInventarioRecShow(Sender: TObject);
    procedure tbsRecibosEmitidosShow(Sender: TObject);
    procedure CheckBox37Click(Sender: TObject);
    procedure CheckBox36Click(Sender: TObject);
    procedure CheckBox35Click(Sender: TObject);
    procedure CheckBox34Click(Sender: TObject);
    procedure CheckBox33Click(Sender: TObject);
    procedure DBLookupComboBox20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CheckBox32Click(Sender: TObject);
    procedure tbsRelatoriosdeVendasPlacaClienteShow(Sender: TObject);
    procedure tbsListaDeAlteracaoDePrecoShow(Sender: TObject);
    procedure tbsOrdensDeServicosEmitidasPorPeriodoShow(Sender: TObject);
    procedure CheckBox30Click(Sender: TObject);
    procedure CheckBox31Click(Sender: TObject);
    procedure tbsRequisicoesEmitidasPorPeriodoShow(Sender: TObject);
    procedure tbsProdutosComPendenciasEmOSREQShow(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure pageGerenciaisExit(Sender: TObject);
    procedure DBLookupComboBox16KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox16CloseUp(Sender: TObject);
    procedure DBLookupComboBox16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edmCFOPExit(Sender: TObject);
    procedure tbsNotasEmitidasPorPeriodoShow(Sender: TObject);
    procedure CheckBox29Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBLookupComboBox15Exit(Sender: TObject);
    procedure CheckBox27Click(Sender: TObject);
    procedure CheckBox28Click(Sender: TObject);
    procedure tbsFinVendaVendedorComissaoServShow(Sender: TObject);
    procedure tbsFinVendaVendedorShow(Sender: TObject);
    procedure tbsFinVendaModalidadePagShow(Sender: TObject);
    procedure CheckBox22Click(Sender: TObject);
    procedure tbsComissaoRecebimentoShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure tbsEstoqueShow(Sender: TObject);
    procedure tbsComprasPorPeriodoShow(Sender: TObject);
    procedure ComboBox47Exit(Sender: TObject);
    procedure tbsVendaVendedorShow(Sender: TObject);
    procedure CheckBox23Click(Sender: TObject);
    procedure CheckBox24Click(Sender: TObject);
    procedure CheckBox25Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure tbsVendaGeralShow(Sender: TObject);
    procedure CheckBox18Click(Sender: TObject);
    procedure CheckBox19Click(Sender: TObject);
    procedure CheckBox21Click(Sender: TObject);
    procedure CheckBox20Click(Sender: TObject);
    procedure tbsVendaOficinaShow(Sender: TObject);
    procedure CheckBox15Click(Sender: TObject);
    procedure CheckBox16Click(Sender: TObject);
    procedure CheckBox17Click(Sender: TObject);
    procedure tbsVendaBalcaoShow(Sender: TObject);
    procedure CheckBox14Click(Sender: TObject);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    function habilitaBotoes(vtip: integer): boolean;
    procedure escreverComentario(vtab: TTabSheet);
    procedure FormKeyDownComentario(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorios: TfrmRelatorios;
  ObRel: TRelatorios;
  //  ObRel: TRelatorioVendaProdutosBalcao;
implementation

uses uDtmRelatorios, uDtmAtivo, uDadosIni, DB;

{$R *.dfm}

procedure TfrmRelatorios.BitBtn1Click(Sender: TObject);
begin
  inherited;
  try
    pageRelatorios.Enabled := false;
    BitBtn1.Enabled := false;
    BitBtn2.Enabled := False;
    BitBtn3.Enabled := true;
    if pageRelatorios.ActivePage = tbsResumo then
    begin
      if pageResumo.ActivePage = tbsVendaBalcao then //TRelatorioVendaProdutosBalcao
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.TotalProduto := ComboBox37.Text;
        ObRel.TotalGrupo := ComboBox41.Text;
        ObRel.OrdenarPor := ComboBox26.Text;

        if ObRel.FiltrarTipoVenda then
          ObRel.TipoVenda := DBLookupComboBox3.KeyValue
        else
          ObRel.TipoVenda := 'TODOS';

        if ObRel.FiltrarVendedor then
        begin
        	ObRel.CodVendedor := obRel.retornaStringVendedores(CheckListBox1);
          ObRel.Vendedor := StringReplace(ObRel.CodVendedor, '(', '', [rfReplaceAll]);
          ObRel.Vendedor := StringReplace(ObRel.Vendedor, ')', '', [rfReplaceAll]);
          if trim(ObRel.CodVendedor) = '' then
          begin
          	if (Self.Enabled) and (Self.Visible) and (CheckListBox1.CanFocus) then
              CheckListBox1.SetFocus;
            exit;
          end;
        end
        else
          ObRel.Vendedor := 'TODOS';

        ObRel.TipoRelatorio := ComboBox36.Text;

        if ObRel.FiltrarGrupo then
          ObRel.GrupoNum := inttostr(DBLookupComboBox2.KeyValue);

        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end;

      if pageResumo.ActivePage = tbsVendaBalcaoPariticipante then //TRelatorioVendaProdutosBalcao
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.TotalProduto := ComboBox21.Text;
        ObRel.TotalGrupo := ComboBox22.Text;
        ObRel.OrdenarPor := ComboBox28.Text;

        if ObRel.FiltrarTipoVenda then
          ObRel.TipoVenda := DBLookupComboBox31.KeyValue
        else
          ObRel.TipoVenda := 'TODOS';

        if ObRel.FiltrarVendedor then
        begin
          ObRel.CodVendedor := obRel.retornaStringParticipantes(CheckListBox2);
          ObRel.Vendedor := StringReplace(ObRel.CodVendedor, '(', '', [rfReplaceAll]);
          ObRel.Vendedor := StringReplace(ObRel.Vendedor, ')', '', [rfReplaceAll]);
          if trim(ObRel.CodVendedor) = '' then
          begin
          	if (Self.Enabled) and (Self.Visible) and (CheckListBox2.CanFocus) then
              CheckListBox2.SetFocus;
            exit;
          end;
        end
        else
          ObRel.Vendedor := 'TODOS';

        ObRel.TipoRelatorio := ComboBox20.Text;

        if ObRel.FiltrarGrupo then
          ObRel.GrupoNum := inttostr(DBLookupComboBox30.KeyValue);

        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end;

      if pageResumo.ActivePage = tbsVendaOficina then //TRelatorioVendasOficina
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);

        ObRel.TotalProduto := ComboBox44.Text;
        ObRel.TotalGrupo := ComboBox48.Text;

        if ObRel.FiltrarTipoOS then
          ObRel.TipoOs := DBLookupComboBox6.KeyValue
        else
          ObRel.TipoOs := 'TODOS';

        if ObRel.FiltrarVendedor then
        begin
          ObRel.CodVendedor := obRel.retornaStringVendedores(CheckListBox3);
          ObRel.Vendedor := StringReplace(ObRel.CodVendedor, '(', '', [rfReplaceAll]);
          ObRel.Vendedor := StringReplace(ObRel.Vendedor, ')', '', [rfReplaceAll]);
          if trim(ObRel.CodVendedor) = '' then
          begin
          	if (Self.Enabled) and (Self.Visible) and (CheckListBox3.CanFocus) then
              CheckListBox3.SetFocus;
            exit;
          end;
        end
        else
          ObRel.Vendedor := 'TODOS';

        if ObRel.FiltrarAreaExec then
          ObRel.AreaExec := (DBComboBox1.Text)
        else
          ObRel.AreaExec := 'TODOS';

        ObRel.TipoRelatorio := ComboBox43.Text;

        if ObRel.FiltrarGrupo then
          ObRel.GrupoNum := inttostr(DBLookupComboBox5.KeyValue);

        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end;
      if pageResumo.ActivePage = tbsVendaGeral then //TRelatorioVendasGeral
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);

        ObRel.TotalProduto := ComboBox45.Text;
        ObRel.TotalGrupo := ComboBox46.Text;

        if ObRel.FiltrarTipoVenda then
          ObRel.TipoVenda := DBLookupComboBox10.KeyValue
        else
          ObRel.TipoVenda := 'TODOS';

        if ObRel.FiltrarTipoOS then
          ObRel.TipoOs := DBLookupComboBox9.KeyValue
        else
          ObRel.TipoOs := 'TODOS';

        if ObRel.FiltrarVendedor then
        begin
          ObRel.CodVendedor := obRel.retornaStringVendedores(CheckListBox4);
          ObRel.Vendedor := StringReplace(ObRel.CodVendedor, '(', '', [rfReplaceAll]);
          ObRel.Vendedor := StringReplace(ObRel.Vendedor, ')', '', [rfReplaceAll]);
          if trim(ObRel.CodVendedor) = '' then
          begin
          	if (Self.Enabled) and (Self.Visible) and (CheckListBox4.CanFocus) then
              CheckListBox4.SetFocus;
            exit;
          end;
        end
        else
          ObRel.Vendedor := 'TODOS';

        if ObRel.FiltrarAreaExec then
          ObRel.AreaExec := DBComboBox2.Text
        else
          ObRel.AreaExec := 'TODOS';

        ObRel.TipoRelatorio := ComboBox42.Text;

        if ObRel.FiltrarGrupo then
          ObRel.GrupoNum := inttostr(DBLookupComboBox8.KeyValue);

        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end;

      if pageResumo.ActivePage = tbsVendaVendedor then //TRelatorioVendasPorVendedor
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);

        if ObRel.FiltrarTipoVenda then
          ObRel.TipoVenda := DBLookupComboBox14.KeyValue
        else
          ObRel.TipoVenda := 'TODOS';

        if ObRel.FiltrarTipoOS then
          ObRel.TipoOs := DBLookupComboBox13.KeyValue
        else
          ObRel.TipoOs := 'TODOS';

        if ObRel.FiltrarVendedor then
        begin
          ObRel.CodVendedor := obRel.retornaStringVendedores(CheckListBox5);
          ObRel.Vendedor := StringReplace(ObRel.CodVendedor, '(', '', [rfReplaceAll]);
          ObRel.Vendedor := StringReplace(ObRel.Vendedor, ')', '', [rfReplaceAll]);
          if trim(ObRel.CodVendedor) = '' then
          begin
          	if (Self.Enabled) and (Self.Visible) and (CheckListBox5.CanFocus) then
              CheckListBox5.SetFocus;
            exit;
          end;
        end
        else
          ObRel.Vendedor := 'TODOS';

        if ObRel.FiltrarAreaExec then
          ObRel.AreaExec := DBComboBox3.Text
        else
          ObRel.AreaExec := 'TODOS';

        ObRel.TipoRelatorio := ComboBox47.Text;

        ObRel.TotalMO := ComboBox49.Text;
        ObRel.ListarProdutos := ComboBox50.Text;
        ObRel.AgrupoPorTipoServico := ComboBox19.Text;
        ObRel.ListarFuncComissSemVND := Combobox2.Text = 'SIM';
        ObRel.TotalVenda := ComboBox87.Text;
        ObRel.RecebimentoVenda := ComboBox88.Text;
        try
          Screen.Cursor := crHourGlass;
          ObRel.ImprimeRelatorios;
        finally
          Screen.Cursor := crDefault;
        end;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end;

      if pageResumo.ActivePage = tbsVendaVendedorAcrescCondPagVend then //TRelatorioVendasPorVendedorAcrescCondPagVend
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);

        if ObRel.FiltrarTipoVenda then
          ObRel.TipoVenda := DBLookupComboBox66.KeyValue
        else
          ObRel.TipoVenda := 'TODOS';

        if ObRel.FiltrarTipoOS then
          ObRel.TipoOs := DBLookupComboBox65.KeyValue
        else
          ObRel.TipoOs := 'TODOS';

        if ObRel.FiltrarVendedor then
        begin
          ObRel.CodVendedor := obRel.retornaStringVendedores(CheckListBox8);
          ObRel.Vendedor := StringReplace(ObRel.CodVendedor, '(', '', [rfReplaceAll]);
          ObRel.Vendedor := StringReplace(ObRel.Vendedor, ')', '', [rfReplaceAll]);
          if trim(ObRel.CodVendedor) = '' then
          begin
          	if (Self.Enabled) and (Self.Visible) and (CheckListBox8.CanFocus) then
              CheckListBox8.SetFocus;
            exit;
          end;
        end
        else
          ObRel.Vendedor := 'TODOS';

        if ObRel.FiltrarAreaExec then
          ObRel.AreaExec := DBComboBox8.Text
        else
          ObRel.AreaExec := 'TODOS';

        ObRel.TipoRelatorio := ComboBox90.Text;

        ObRel.ExibirValorBruto := ComboBox97.Text;
        ObRel.TotalMO := ComboBox91.Text;
        ObRel.ListarProdutos := ComboBox92.Text;
        ObRel.AgrupoPorTipoServico := ComboBox94.Text;
        ObRel.TotalVenda := ComboBox95.Text;
        ObRel.RecebimentoVenda := ComboBox96.Text;
        try
          Screen.Cursor := crHourGlass;
          ObRel.ImprimeRelatorios;
        finally
          Screen.Cursor := crDefault;
        end;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end;

      if pageResumo.ActivePage = tbsVendaVendedorComissaoFaixaDesc then //TRelatorioVendasPorVendedor (Comissao por Faixa Desconto)
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);

        if ObRel.FiltrarTipoVenda then
          ObRel.TipoVenda := DBLookupComboBox51.KeyValue
        else
          ObRel.TipoVenda := 'TODOS';

        if ObRel.FiltrarTipoOS then
          ObRel.TipoOs := DBLookupComboBox50.KeyValue
        else
          ObRel.TipoOs := 'TODOS';

        if ObRel.FiltrarVendedor then
        begin
          ObRel.CodVendedor := obRel.retornaStringVendedores(CheckListBox7);
          ObRel.Vendedor := StringReplace(ObRel.CodVendedor, '(', '', [rfReplaceAll]);
          ObRel.Vendedor := StringReplace(ObRel.Vendedor, ')', '', [rfReplaceAll]);
          if trim(ObRel.CodVendedor) = '' then
          begin
          	if (Self.Enabled) and (Self.Visible) and (CheckListBox4.CanFocus) then
              CheckListBox4.SetFocus;
            exit;
          end;
        end
        else
          ObRel.Vendedor := 'TODOS';

        if ObRel.FiltrarAreaExec then
          ObRel.AreaExec := DBComboBox7.Text
        else
          ObRel.AreaExec := 'TODOS';

        ObRel.TipoRelatorio := ComboBox62.Text;

//        ObRel.TotalMO := ComboBox49.Text;
        ObRel.ListarProdutos := ComboBox63.Text;

        ObRel.ExibirComissaoTecMec := CheckBox79.Checked;

//        ObRel.AgrupoPorTipoServico := ComboBox19.Text;
//        ObRel.ListarFuncComissSemVND := Combobox2.Text = 'SIM';
        try
          Screen.Cursor := crHourGlass;
          ObRel.ImprimeRelatorios;
        finally
          Screen.Cursor := crDefault;
        end;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end;

      if pageResumo.ActivePage = tbsComprasPorPeriodo then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.TipoRelatorio := ComboBox51.Text;
        ObRel.ListarProdutos := ComboBox53.Text;
        ObRel.DA := ComboBox35.Text;
        ObRel.AgrupaNF := ComboBox83.Text;
        ObRel.AgrupaFornec := ComboBox38.Text;
        ObRel.TotalPorCFOP := ComboBox89.Text;
        ObRel.OrdenarPor := ComboBox4.Text;
        ObRel.ComGrade := ComboBox7.Text;
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end;

      if pageResumo.ActivePage = tbsEstoque then
      begin
        ObRel.dataReferencia := strtodate(MaskEdit4.Text);
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end;

      if pageResumo.ActivePage = tbsComissaoRecebimento then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.TipoRelatorio := ComboBox39.Text;

      	if ObRel.FiltrarControle then
          ObRel.Controle := DBLookupComboBox48.KeyValue
        else
          ObRel.Controle := 'TODOS';

        if ObRel.FiltrarVendedor then
        begin
          ObRel.CodVendedor := obRel.retornaStringVendedores(CheckListBox6);
          ObRel.Vendedor := StringReplace(ObRel.CodVendedor, '(', '', [rfReplaceAll]);
          ObRel.Vendedor := StringReplace(ObRel.Vendedor, ')', '', [rfReplaceAll]);
          if trim(ObRel.CodVendedor) = '' then
          begin
          	if (Self.Enabled) and (Self.Visible) and (CheckListBox4.CanFocus) then
              CheckListBox4.SetFocus;
            exit;
          end;
        end
        else
          ObRel.Vendedor := 'TODOS';

        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end;

      if pageResumo.ActivePage = tbsPagamentoFinanceiro then
      begin
      	ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.TipoRelatorio := ComboBox64.Text;

        ObRel.Exibir := ComboBox65.Text;

        ObRel.FiltrarCliente := CheckBox81.Checked;
        if ObRel.FiltrarCliente then
        begin
        	if DBLookupComboBox53.KeyValue = Null then
          begin
          	Application.MessageBox(pchar('Cliente não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox53.CanFocus) then
            	DBLookupComboBox53.SetFocus;
            exit;
          end
          else if DBLookupComboBox53.KeyValue <= 0 then
          begin
          	Application.MessageBox(pchar('Cliente não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox53.CanFocus) then
            	DBLookupComboBox53.SetFocus;
            exit;
          end;

        	ObRel.Cliente := DBLookupComboBox53.KeyValue;
          ObRel.NomeCliente := trim(DBLookupComboBox53.Text);
        end
        else
        begin
        	ObRel.Cliente := 'TODOS';
          ObRel.NomeCliente := '';
        end;

        ObRel.FiltrarOrigControle := CheckBox91.Checked;
        if ObRel.FiltrarOrigControle then
        begin
        	if DBLookupComboBox61.KeyValue = Null then
          begin
          	Application.MessageBox(pchar('Origem Controle não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox61.CanFocus) then
            	DBLookupComboBox61.SetFocus;
            exit;
          end
          else if DBLookupComboBox61.KeyValue <= 0 then
          begin
          	Application.MessageBox(pchar('Origem Controle não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox61.CanFocus) then
            	DBLookupComboBox61.SetFocus;
            exit;
          end;

        	ObRel.OrigControle := DBLookupComboBox61.KeyValue;
          ObRel.NomeOrigControle := trim(DBLookupComboBox61.Text);
        end
        else
        begin
        	ObRel.OrigControle := 'TODOS';
          ObRel.NomeOrigControle := '';
        end;

        ObRel.FiltrarControle := CheckBox80.Checked;
        if ObRel.FiltrarControle then
        begin
        	if DBLookupComboBox52.KeyValue = Null then
          begin
          	Application.MessageBox(pchar('Controle não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox52.CanFocus) then
            	DBLookupComboBox52.SetFocus;
            exit;
          end
          else if DBLookupComboBox52.KeyValue <= 0 then
          begin
          	Application.MessageBox(pchar('Controle não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox52.CanFocus) then
            	DBLookupComboBox52.SetFocus;
            exit;
          end;

          ObRel.Controle := DBLookupComboBox52.KeyValue;
          ObRel.NomeControle := trim(DBLookupComboBox52.Text);
        end
        else
        begin
          ObRel.Controle := 'TODOS';
          ObRel.NomeControle := '';
        end;

        ObRel.ExibirDetalhesRec := trim(ComboBox70.Text);

        if ComboBox64.Items[ComboBox64.ItemIndex] = 'ANALÍTICO' then
	        ObRel.ExibirTotatis := ComboBox76.Items[ComboBox76.ItemIndex]
        else
        	ObRel.ExibirTotatis := 'SIM';

        ObRel.Exibir := ComboBox65.Text;
        ObRel.AgruparEmpUnificada := cbAgruparUnificadas2.Text;
        ObRel.CodEmpUnificada := vDadosIni.IfThen(trim(edCodigoEmpUnificada2.Text) = '', 0, StrToInt(edCodigoEmpUnificada2.Text));

      	if not vDadosIni.validarAcessoEmpresasUnificadas(ObRel.buscas) then
        begin
          vDadosIni.fechaStatusProcessamento;
          Exit;
        end;

        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end;

      if pageResumo.ActivePage = tbsRecebimentoFinanceiro then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.TipoRelatorio := ComboBox23.Text;

        ObRel.FiltrarVenda := CheckBox60.Checked;
        if ObRel.FiltrarVenda then
          ObRel.Venda := ComboBox24.Text
        else
          ObRel.Venda := 'TODOS';

        ObRel.FiltrarTipoVenda := CheckBox57.Checked;
        if ObRel.FiltrarTipoVenda then
          ObRel.TipoVenda := DBLookupComboBox33.KeyValue
        else
          ObRel.TipoVenda := 'TODOS';

        ObRel.FiltrarTipoOS := CheckBox58.Checked;
				if ObRel.FiltrarTipoOS then
          ObRel.TipoOs := DBLookupComboBox34.KeyValue
        else
          ObRel.TipoOs := 'TODOS';

        ObRel.FiltrarTipoVeic := CheckBox59.Checked;
        if ObRel.FiltrarTipoVeic then
          ObRel.TipoVeic := DBLookupComboBox35.KeyValue
        else
          ObRel.TipoVeic := 'TODOS';

        ObRel.FiltrarCliente := CheckBox56.Checked;
        if ObRel.FiltrarCliente then
        begin
        	if DBLookupComboBox32.KeyValue = Null then
          begin
          	Application.MessageBox(pchar('Cliente não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox32.CanFocus) then
            	DBLookupComboBox32.SetFocus;
            exit;
          end
          else if DBLookupComboBox32.KeyValue <= 0 then
          begin
          	Application.MessageBox(pchar('Cliente não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox32.CanFocus) then
            	DBLookupComboBox32.SetFocus;
            exit;
          end;

        	ObRel.Cliente := DBLookupComboBox32.KeyValue;
          ObRel.NomeCliente := trim(DBLookupComboBox32.Text);
        end
        else
        begin
        	ObRel.Cliente := 'TODOS';
          ObRel.NomeCliente := '';
        end;

        ObRel.FiltrarOrigControle := CheckBox89.Checked;
        if ObRel.FiltrarOrigControle then
        begin
        	if DBLookupComboBox59.KeyValue = Null then
          begin
          	Application.MessageBox(pchar('Origem Controle não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox59.CanFocus) then
            	DBLookupComboBox59.SetFocus;
            exit;
          end
          else if DBLookupComboBox59.KeyValue <= 0 then
          begin
          	Application.MessageBox(pchar('Origem Controle não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox59.CanFocus) then
            	DBLookupComboBox59.SetFocus;
            exit;
          end;

        	ObRel.OrigControle := DBLookupComboBox59.KeyValue;
          ObRel.NomeOrigControle := trim(DBLookupComboBox59.Text);
        end
        else
        begin
        	ObRel.OrigControle := 'TODOS';
          ObRel.NomeOrigControle := '';
        end;

        ObRel.FiltrarControle := CheckBox62.Checked;
        if ObRel.FiltrarControle then
        begin
        	if DBLookupComboBox36.KeyValue = Null then
          begin
          	Application.MessageBox(pchar('Controle não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox36.CanFocus) then
            	DBLookupComboBox36.SetFocus;
            exit;
          end
          else if DBLookupComboBox36.KeyValue <= 0 then
          begin
          	Application.MessageBox(pchar('Controle não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox36.CanFocus) then
            	DBLookupComboBox36.SetFocus;
            exit;
          end;

          ObRel.Controle := DBLookupComboBox36.KeyValue;
          ObRel.NomeControle := trim(DBLookupComboBox36.Text);
        end
        else
        begin
          ObRel.Controle := 'TODOS';
          ObRel.NomeControle := '';
        end;

        ObRel.ExibirDetalhesRec := trim(ComboBox71.Text);

        if ComboBox23.Items[ComboBox23.ItemIndex] = 'ANALÍTICO' then
	        ObRel.ExibirTotatis := ComboBox77.Items[ComboBox77.ItemIndex]
        else
        	ObRel.ExibirTotatis := 'SIM';

        ObRel.FiltrarPorTipo := CheckBox61.Checked;
        if ObRel.FiltrarPorTipo then
          ObRel.PorTipo := ComboBox25.Text
        else
          ObRel.PorTipo := 'TODOS';

        ObRel.Exibir := ComboBox29.Text;
        ObRel.AgruparEmpUnificada := cbAgruparUnificadas.Text;
        ObRel.CodEmpUnificada := vDadosIni.IfThen(trim(edCodigoEmpUnificada.Text) = '', 0, StrToInt(edCodigoEmpUnificada.Text));

        if not vDadosIni.validarAcessoEmpresasUnificadas(ObRel.buscas) then
        begin
          vDadosIni.fechaStatusProcessamento;
          Exit;
        end;

        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end;

      if pageResumo.ActivePage = tbsPagamentoRecebimentoFinanceiro then
      begin
      	ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.TipoRelatorio := ComboBox66.Text;

        ObRel.FiltrarVenda := CheckBox85.Checked;
        if ObRel.FiltrarVenda then
          ObRel.Venda := ComboBox67.Text
        else
          ObRel.Venda := 'TODOS';

        ObRel.FiltrarTipoVenda := CheckBox82.Checked;
        if ObRel.FiltrarTipoVenda then
          ObRel.TipoVenda := DBLookupComboBox54.KeyValue
        else
          ObRel.TipoVenda := 'TODOS';

        ObRel.FiltrarTipoOS := CheckBox83.Checked;
				if ObRel.FiltrarTipoOS then
          ObRel.TipoOs := DBLookupComboBox55.KeyValue
        else
          ObRel.TipoOs := 'TODOS';

        ObRel.FiltrarTipoVeic := CheckBox84.Checked;
        if ObRel.FiltrarTipoVeic then
          ObRel.TipoVeic := DBLookupComboBox56.KeyValue
        else
          ObRel.TipoVeic := 'TODOS';

        ObRel.FiltrarCliente := CheckBox88.Checked;
        if ObRel.FiltrarCliente then
        begin
          if DBLookupComboBox58.KeyValue = Null then
          begin
          	Application.MessageBox(pchar('Cliente não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox58.CanFocus) then
            	DBLookupComboBox58.SetFocus;
            exit;
          end
          else if DBLookupComboBox58.KeyValue <= 0 then
          begin
          	Application.MessageBox(pchar('Cliente não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox58.CanFocus) then
            	DBLookupComboBox58.SetFocus;
            exit;
          end;

        	ObRel.Cliente := DBLookupComboBox58.KeyValue;
          ObRel.NomeCliente := trim(DBLookupComboBox58.Text);
        end
        else
        begin
        	ObRel.Cliente := 'TODOS';
          ObRel.NomeCliente := '';
        end;

        ObRel.FiltrarOrigControle := CheckBox90.Checked;
        if ObRel.FiltrarOrigControle then
        begin
        	if DBLookupComboBox60.KeyValue = Null then
          begin
          	Application.MessageBox(pchar('Origem Controle não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox60.CanFocus) then
            	DBLookupComboBox60.SetFocus;
            exit;
          end
          else if DBLookupComboBox60.KeyValue <= 0 then
          begin
            Application.MessageBox(pchar('Origem Controle não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox60.CanFocus) then
            	DBLookupComboBox60.SetFocus;
            exit;
          end;
          
        	ObRel.OrigControle := DBLookupComboBox60.KeyValue;
          ObRel.NomeOrigControle := trim(DBLookupComboBox60.Text);
        end
        else
        begin
        	ObRel.OrigControle := 'TODOS';
          ObRel.NomeOrigControle := '';
        end;

        ObRel.FiltrarControle := CheckBox87.Checked;
        if ObRel.FiltrarControle then
        begin
        	if DBLookupComboBox57.KeyValue = Null then
          begin
          	Application.MessageBox(pchar('Controle não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox57.CanFocus) then
            	DBLookupComboBox57.SetFocus;
            exit;
          end
          else if DBLookupComboBox57.KeyValue <= 0 then
          begin
          	Application.MessageBox(pchar('Controle não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox57.CanFocus) then
            	DBLookupComboBox57.SetFocus;
            exit;
          end;
          
          ObRel.Controle := DBLookupComboBox57.KeyValue;
          ObRel.NomeControle := trim(DBLookupComboBox57.Text);
        end
        else
        begin
          ObRel.Controle := 'TODOS';
          ObRel.NomeControle := '';
        end;

      	ObRel.ExibirDetalhesRec := trim(ComboBox72.Text);

        if ComboBox66.Items[ComboBox66.ItemIndex] = 'ANALÍTICO' then
	        ObRel.ExibirTotatis := ComboBox78.Items[ComboBox78.ItemIndex]
        else
        	ObRel.ExibirTotatis := 'SIM';

        ObRel.FiltrarPorTipo := CheckBox86.Checked;
        if ObRel.FiltrarPorTipo then
          ObRel.PorTipo := ComboBox68.Text
        else
          ObRel.PorTipo := 'TODOS';

        ObRel.Exibir := ComboBox69.Text;
        ObRel.AgruparEmpUnificada := cbAgruparUnificadas3.Text;
        ObRel.CodEmpUnificada := vDadosIni.IfThen(trim(edCodigoEmpUnificada3.Text) = '', 0, StrToInt(edCodigoEmpUnificada3.Text));

        if not vDadosIni.validarAcessoEmpresasUnificadas(ObRel.buscas) then
        begin
          vDadosIni.fechaStatusProcessamento;
          Exit;
        end;

        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end;

      if pageResumo.ActivePage = tbsRecebimentoCaixaAuxiliar then
      begin
      	ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.TipoRelatorio := ComboBox73.Text;

        ObRel.FiltrarCliente := CheckBox93.Checked;
        if ObRel.FiltrarCliente then
        begin
        	if DBLookupComboBox62.KeyValue = Null then
          begin
          	Application.MessageBox(pchar('Cliente não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox62.CanFocus) then
            	DBLookupComboBox62.SetFocus;
            exit;
          end
          else if DBLookupComboBox62.KeyValue <= 0 then
          begin
          	Application.MessageBox(pchar('Cliente não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox62.CanFocus) then
            	DBLookupComboBox62.SetFocus;
            exit;
          end;

          ObRel.Cliente := DBLookupComboBox62.KeyValue;
          ObRel.NomeCliente := trim(DBLookupComboBox62.Text);
        end
        else
        begin
          ObRel.Cliente := 'TODOS';
          ObRel.NomeCliente := '';
        end;

        ObRel.FiltrarOrigControle := CheckBox94.Checked;
        if ObRel.FiltrarOrigControle then
        begin
        	if DBLookupComboBox63.KeyValue = Null then
          begin
          	Application.MessageBox(pchar('Origem Controle não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox63.CanFocus) then
            	DBLookupComboBox63.SetFocus;
            exit;
          end
          else if DBLookupComboBox63.KeyValue <= 0 then
          begin
            Application.MessageBox(pchar('Origem Controle não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox63.CanFocus) then
            	DBLookupComboBox63.SetFocus;
            exit;
          end;

        	ObRel.OrigControle := DBLookupComboBox63.KeyValue;
          ObRel.NomeOrigControle := trim(DBLookupComboBox63.Text);
        end
        else
        begin
        	ObRel.OrigControle := 'TODOS';
          ObRel.NomeOrigControle := '';
        end;

        ObRel.FiltrarControle := CheckBox95.Checked;
        if ObRel.FiltrarControle then
        begin
        	if DBLookupComboBox64.KeyValue = Null then
          begin
          	Application.MessageBox(pchar('Controle não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox64.CanFocus) then
            	DBLookupComboBox64.SetFocus;
            exit;
          end
          else if DBLookupComboBox64.KeyValue <= 0 then
          begin
          	Application.MessageBox(pchar('Controle não encontrado'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
            if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox64.CanFocus) then
            	DBLookupComboBox64.SetFocus;
            exit;
          end;
          
          ObRel.Controle := DBLookupComboBox64.KeyValue;
          ObRel.NomeControle := trim(DBLookupComboBox64.Text);
        end
        else
        begin
          ObRel.Controle := 'TODOS';
          ObRel.NomeControle := '';
        end;

        ObRel.ExibirDetalhesRec := trim(ComboBox74.Text);

        if ComboBox73.Items[ComboBox73.ItemIndex] = 'ANALÍTICO' then
	        ObRel.ExibirTotatis := ComboBox79.Items[ComboBox79.ItemIndex]
        else
        	ObRel.ExibirTotatis := 'SIM';
        
        ObRel.FiltrarPorTipo := CheckBox92.Checked;
        if ObRel.FiltrarPorTipo then
          ObRel.PorTipo := ComboBox75.Text
        else
          ObRel.PorTipo := 'TODOS';

        ObRel.AgruparEmpUnificada := cbAgruparUnificadas4.Text;
        ObRel.CodEmpUnificada := vDadosIni.IfThen(trim(edCodigoEmpUnificada4.Text) = '', 0, StrToInt(edCodigoEmpUnificada4.Text));

        if not vDadosIni.validarAcessoEmpresasUnificadas(ObRel.buscas) then
        begin
          vDadosIni.fechaStatusProcessamento;
          Exit;
        end;

        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end;

      if pageResumo.ActivePage = tbsFinVendaModalidadePag then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.ImprimeRelatorios;
        habilitaBotoes(1);
        exit;
      end;
      //  (Financeiro) Vendas por Vendedor (Comissão por serviço)
      if pageResumo.ActivePage = tbsFinVendaVendedorComissaoServ then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.StatusPed := ComboBox80.Text;
        if ObRel.FiltrarTipoOS then
          ObRel.TipoOs := DBLookupComboBox17.KeyValue
        else
          ObRel.TipoOs := 'TODOS';
        if ObRel.FiltrarAreaExec then
          ObRel.AreaExec := DBComboBox4.Text
        else
          ObRel.AreaExec := 'TODOS';
        obRel.OrdenarPor := ComboBox81.Text;
        ObRel.ListaVendedores(true);
        habilitaBotoes(1);
        exit;
      end;
    end
    else
    begin
      if pageGerenciais.ActivePage = tbsNotasEmitidasPorPeriodo then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.Exibir := ComboBox82.Items[ComboBox82.ItemIndex];
        ObRel.ExibirTotCFOP := ComboBox84.Items[ComboBox84.ItemIndex];
        ObRel.ExibirTotNFCeNFe := ComboBox85.Items[ComboBox85.ItemIndex];
        ObRel.ExibirTotEntrSaida := ComboBox86.Items[ComboBox86.ItemIndex];        
        ObRel.OrdenarPor := ComboBox5.Text;
        ObRel.TipoNF := ComboBox11.Text;
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsProdutosComPendenciasEmOSREQ then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRequisicoesEmitidasPorPeriodo then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.StatusPed := ComboBox40.Text;
        if ObRel.FiltrarTipoVenda then
          ObRel.TipoVenda := DBLookupComboBox21.KeyValue
        else
          ObRel.TipoVenda := 'TODOS';
        ObRel.ExibirRazaoFantasia := RadioGroupRouF1.ItemIndex;
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsOrdensDeServicosEmitidasPorPeriodo then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.StatusPed := ComboBox52.Text;
        if ObRel.FiltrarTipoOS then
          ObRel.TipoOs := DBLookupComboBox19.KeyValue
        else
          ObRel.TipoOs := 'TODOS';
        if ObRel.FiltrarAreaExec then
          ObRel.AreaExec := DBComboBox5.Text
        else
          ObRel.AreaExec := 'TODOS';
        ObRel.ExibirRazaoFantasia := RadioGroupRouF2.ItemIndex;
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRequisicoesOrdemServicoEmitidasPorPeriodo then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.StatusPed := ComboBox34.Text;
        if ObRel.FiltrarTipoVenda then
          ObRel.TipoVenda := DBLookupComboBox47.KeyValue
        else
          ObRel.TipoVenda := 'TODOS';
        if ObRel.FiltrarTipoOS then
          ObRel.TipoOs := DBLookupComboBox44.KeyValue
        else
          ObRel.TipoOs := 'TODOS';
        if ObRel.FiltrarAreaExec then
          ObRel.AreaExec := DBComboBox6.Text
        else
          ObRel.AreaExec := 'TODOS';
        ObRel.ExibirItens := ComboBox60.Items[ComboBox60.ItemIndex];
        ObRel.ExibirFinac := ComboBox61.Items[ComboBox61.ItemIndex];
        ObRel.ExibirRazaoFantasia := RadioGroupRouF3.ItemIndex;
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsListaDeAlteracaoDePreco then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.LitadeAltPrecos := ComboBox54.Text;
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end //Relatório de vendas por Placa/Cliente
      else if pageGerenciais.ActivePage = tbsRelatoriosdeVendasPlacaCliente then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.FiltrarData := CheckBox35.Checked;
        ObRel.StatusPed := trim(ComboBox55.Text);
        if ObRel.FiltrarPlaca then
          ObRel.Placa := MaskEdit5.Text;
        ObRel.ImprimeRelatorios;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRelatoriodeVendasObjetoCliente then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.FiltrarData := CheckBox4.Checked;
        //        if ObRel.FiltrarObjeto then
        //          ObRel.CodEquip := MaskEdit5.Text;
        ObRel.ImprimeRelatorios;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRecibos then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        //      ObRel.FiltrarData := CheckBox35.Checked;
        if pageRecibos.ActivePage = tbsRecibosEmitidos then
        begin
          ObRel.TipoRec := 'RECIBOS EMITIDOS';
          ObRel.StatusRec := ComboBox56.Text;
          ObRel.DepartamentoRec := ComboBox57.Text;
        end
        else if pageRecibos.ActivePage = tbsInventarioRec then
        begin
          ObRel.TipoRec := 'INVENTÁRIO REC';
          ObRel.DepartamentoRec := ComboBox58.Text;
          ObRel.dataReferencia := StrToDate(MaskEdit8.Text);
        end
        else if pageRecibos.ActivePage = tbsHistoricoRecibos then
        begin
          ObRel.TipoRec := 'HISTORICO RECIBOS';
          ObRel.DepartamentoRec := ComboBox59.Text;
        end;

        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRelatorioApuracaoICMS then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.TipoRelatorio := ComboBox3.Text;
        ObRel.SAnterior := EditHw1.AsValue;
        ObRel.OutrosCreditos := EditHw2.AsValue;
        ObRel.OutrosDebitos := EditHw3.AsValue;
        ObRel.ModeloP := ComboBox6.Text;
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRelatorioVeiculosNegociados then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.TipoVenda := trim(ComboBox8.Text);
        ObRel.TipoVeiculo := trim(ComboBox9.Text);
        ObRel.DepartamentoRec := trim(ComboBox10.Text);
        ObRel.Vendedor := inttostr(DBLookupComboBox24.KeyValue);
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRelatorioVeiculosemDemonstracao then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.TipoRelatorio := trim(ComboBox13.Text);
        ObRel.TipoVenda := trim(ComboBox12.Text);
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRelatorioAcompanhamentodeVeiculo then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRelatorioPosicaodeEstoqueVeiculos then
      begin
       if RadioGroup1.ItemIndex = 0 then
         ObRel.TipoRelatorio := '1'
       else
         ObRel.TipoRelatorio := '2';
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRelatorioVeiculosemTransito then
      begin
        ObRel.TipoRelatorio := UpperCase(trim(ComboBox14.Text));
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRelatorioDiarioDiretoria then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.QtdeCotas := EditHw4.AsValue;
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsInventarioVeiculos then
      begin
        ObRel.TipoRelatorio := UpperCase(trim(ComboBox15.Text));
        ObRel.dataReferencia := strtodate(MaskEdit3.Text);
        ObRel.ValorPecas := EditHw5.AsValue;
        ObRel.PaginaInicial := EditHw6.AsInteger;
        ObRel.AcresDecres := EditHw7.AsValue;
        ObRel.Tipo74 := CheckBox43.Checked;
        ObRel.ComStatus := CheckBox40.Checked;
        ObRel.VeiculoNovo := CheckBox41.Checked;
        ObRel.VeiculoUsado := CheckBox42.Checked;
        ObRel.Divisao := CheckBox39.Checked;
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRelatorioVeiculosPagosAntecipados then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRelatorioVeiculosQueChegaramAntesDoPagamento then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.dataReferencia := StrToDate(MaskEdit6.Text);
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tsbRelatorioSituacaodoEstoqueFechado then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.OrdenarPor := trim(ComboBox16.Text);
        if ObRel.FiltrarVendedor then
        begin
          try
            ObRel.CodVendedor := inttostr(DBLookupComboBox25.KeyValue);
            ObRel.Vendedor := Trim(DBLookupComboBox25.Text);
          except
          end;
        end
        else
          ObRel.Vendedor := 'TODOS';
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRelatorioFaturamentodeVeiculos then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.Gerente := ckGerente.Checked;
        ObRel.Estoque := ckEstoque.Checked;
        ObRel.Consignado := ckConsignado.Checked;
        ObRel.Intermediacao := ckIntermediacao.Checked;
        ObRel.EstoqueReal := ckEstoqueReal.Checked;
        ObRel.Concessionaria := ckConcessionaria.Checked;
        if ObRel.FiltrarVendedor then
        begin
          try
            ObRel.CodVendedor := inttostr(DBLookupComboBox27.KeyValue);
            ObRel.Vendedor := Trim(DBLookupComboBox27.Text);
          except
          end;
        end
        else
          ObRel.Vendedor := 'TODOS';
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRelatorioparaGerenciaVeiculos then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.Gerente := ckGerente2.Checked;
        ObRel.Estoque := ckEstoque2.Checked;
        ObRel.Consignado := ckConsignado2.Checked;
        ObRel.Intermediacao := ckIntermediacao2.Checked;
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRelatorioTabeladePrecosVeiculos then
      begin
        ObRel.Estoque := ckEstoque3.Checked;
        ObRel.Consignado := ckConsignado3.Checked;
        ObRel.Intermediacao := ckIntermediacao3.Checked;
        ObRel.Marca := Trim(UpperCase(cbMarca.Text));
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRelatorioRecebimentodeVeiculos then
      begin
        ObRel.datainicial := strtodate(MaskEdit1.Text);
        ObRel.datafinal := StrToDate(MaskEdit2.Text);
        ObRel.ImprimeRelatorios;
        //    ObRel.Free;
        habilitaBotoes(1);
        exit;
      end
      else if pageGerenciais.ActivePage = tbsRelatorioDespesasdeVeiculos then
      begin
         ObRel.TipoRelatorio := trim(ComboBox18.Text);
         ObRel.datainicial := strtodate(MaskEdit1.Text);
         ObRel.datafinal := StrToDate(MaskEdit2.Text);
         ObRel.Estoque := ckEstoque4.Checked;
         ObRel.Consignado := ckConsignado4.Checked;
         ObRel.Intermediacao := ckIntermediacao4.Checked;
         ObRel.Concessionaria := ckConcessionaria4.Checked;
         ObRel.ImprimeRelatorios;
         //    ObRel.Free;
         habilitaBotoes(1);
         exit;
       end
       else if pageGerenciais.ActivePage = tbsRelatorioPendenciasdeVeiculos then
       begin
         ObRel.datainicial := strtodate(MaskEdit1.Text);
         ObRel.datafinal := StrToDate(MaskEdit2.Text);
         ObRel.Todos := RadioGroupSituacao.ItemIndex = 0;
         ObRel.Pendente := RadioGroupSituacao.ItemIndex = 1;
         ObRel.Regular := RadioGroupSituacao.ItemIndex = 2;
         ObRel.Chassi := trim(EditChassi.Text);
         ObRel.Placa := trim(EditPlaca.Text);
         ObRel.TipoRelatorio := UpperCase(trim(ComboBox17.Text));
         if ObRel.FiltrarVendedor then
         begin
           try
             ObRel.CodVendedor := inttostr(DBLookupComboBox28.KeyValue);
             ObRel.Vendedor := Trim(DBLookupComboBox28.Text);
           except
           end;
         end
         else
           ObRel.Vendedor := 'TODOS';
         ObRel.ImprimeRelatorios;
         //    ObRel.Free;
         habilitaBotoes(1);
         exit;
       end
       else if pageGerenciais.ActivePage = tbsRelatorioContratoContaCorrente then
       begin
          ObRel.datainicial := strtodate(MaskEdit1.Text);
          ObRel.datafinal := strtodate(MaskEdit2.Text);
          ObRel.FiltrarCliente := CheckBox63.Checked;
          ObRel.MediaVencimentos := Trunc(EditMoedaTotpontosVencimentos.Valor);
          ObRel.ImprimeRelatorios;
          //    ObRel.Free;
          habilitaBotoes(1);
          exit;
        end
        else if pageGerenciais.ActivePage = tbsRelatorioVendasRecProgFid then
        begin
          ObRel.datainicial := strtodate(MaskEdit1.Text);
          ObRel.datafinal := strtodate(MaskEdit2.Text);
          ObRel.TipoRelatorio := trim(ComboBox27.Text);
          ObRel.FiltrarCliente := CheckBox64.Checked;
          ObRel.ImprimeRelatorios;
          //    ObRel.Free;
          habilitaBotoes(1);
          exit;
        end
        else if pageGerenciais.ActivePage = tbsRelatorioTitulosporRota then
        begin
          ObRel.datainicial := strtodate(MaskEdit1.Text);
          ObRel.datafinal := strtodate(MaskEdit2.Text);
          ObRel.ExibirValorCorr := trim(ComboBoxValorCorrigido.Text);
          ObRel.ExibirRazaoFantasia := RadioGroupRouF.ItemIndex;
          if ObRel.dtSetRota.IsEmpty then
            ObRel.CodRota := 0
          else if trim(DBLookupComboBox39.Text) = '' then
            ObRel.CodRota := 0
          else               
            ObRel.CodRota := ObRel.dtSetRota.FieldByName('cod_rota').AsInteger;
          _GravaConfiguracoesBoolean('ckCartao', ckCartao.Checked);
          _GravaConfiguracoesBoolean('ckFinanc', ckFinanc.Checked);
    		  _GravaConfiguracoesBoolean('ckBoleta', ckBoleta.Checked);
          _GravaConfiguracoesBoolean('ckChequePre', ckChequePre.Checked);
          _GravaConfiguracoesBoolean('ckOutros', ckOutros.Checked);
          _GravaConfiguracoesInteger('RadioGroupRouF', RadioGroupRouF.ItemIndex);
          _GravaConfiguracoesInteger('ComboBoxValorCorrigido', ComboBoxValorCorrigido.ItemIndex);
          ObRel.ImprimeRelatorios;
          //    ObRel.Free;
          habilitaBotoes(1);
          exit;
        end
        else if pageGerenciais.ActivePage = tbsRelatorioComissaoPorVenda then
        begin
          ObRel.datainicial := strtodate(MaskEdit1.Text);
          ObRel.datafinal := strtodate(MaskEdit2.Text);
          ObRel.TipoRelatorio := trim(ComboBox30.Text);
          ObRel.ConsRelatorio := trim(ComboBoXMovVenc.Text);
          ObRel.Exibir := trim(ComboBox31.Text);
          ObRel.Listar := trim(ComboBox33.Text);
          ObRel.StatusPed := trim(ComboBox32.Text);
          ObRel.ExibirRazaoFantasia := RadioGroupRouFComissaoPorVenda.ItemIndex;
          _GravaConfiguracoesInteger('RadioGroupRouFComissaoPorVenda', RadioGroupRouFComissaoPorVenda.ItemIndex);
          _GravaConfiguracoesInteger('ComboBoXMovVenc', ComboBoXMovVenc.ItemIndex);
          ObRel.ImprimeRelatorios;
          //    ObRel.Free;
          habilitaBotoes(1);
          exit;
        end;
    end;
  finally
    habilitaBotoes(1);
  end;
end;

procedure TfrmRelatorios.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if ObRel.buscas <> nil then
    ObRel.buscas.Close;
  if ObRel.buscas1 <> nil then
    ObRel.buscas1.Close;
  if ObRel.buscas2 <> nil then
    ObRel.buscas2.Close;
  if ObRel.buscas3 <> nil then
    ObRel.buscas3.Close;
  if ObRel.buscas4 <> nil then
    ObRel.buscas4.Close;
  if ObRel.buscas5 <> nil then
    ObRel.buscas5.Close;
  if ObRel.buscasGerais <> nil then
    ObRel.buscasGerais.Close;
  Close;
end;

procedure TfrmRelatorios.BitBtn3Click(Sender: TObject);
begin
  inherited;
  ObRel.variavel_parar := true;
end;

procedure TfrmRelatorios.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if CheckBox26.Checked then
  begin
  	try
    	ObRel.dtSetColab.DisableControls;
      ObRel.dtSetColab.First;
      while not ObRel.dtSetColab.Eof do
      begin
        DBGrid1.SelectedRows.CurrentRowSelected := True;
        ObRel.dtSetColab.Next;
      end;
    finally
      ObRel.dtSetColab.First;
      ObRel.dtSetColab.EnableControls;
    end;
  end;
  ObRel.ImprimeRelatorios;
end;

procedure TfrmRelatorios.BitBtn5Click(Sender: TObject);
begin
  inherited;
  TForm(pnComentario.Parent).ModalResult := IDOK;
end;

procedure TfrmRelatorios.btSelectAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ObRel.marcaTodos(ObRel.dtSetCtrlTitRota);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmRelatorios.btSelectAllVendComissFaixaDescClick(Sender: TObject);
begin
  inherited;
	obRel.SelTodaListaVendedores(CheckListBox7);
end;

procedure TfrmRelatorios.btSelectAllVendComissProdRecClick(Sender: TObject);
begin
  inherited;
	obRel.SelTodaListaVendedores(CheckListBox6);
end;

procedure TfrmRelatorios.btSelectAllVendSaidasBalcaoClick(Sender: TObject);
begin
  inherited;
	obRel.SelTodaListaVendedores(CheckListBox1);
end;

procedure TfrmRelatorios.btSelectAllVendSaidasBalcaoPartClick(Sender: TObject);
begin
  inherited;
	obRel.SelTodaListaParticipantes(CheckListBox2);
end;

procedure TfrmRelatorios.btSelectAllVendSaidasGeralClick(Sender: TObject);
begin
  inherited;
	obRel.SelTodaListaVendedores(CheckListBox4);
end;

procedure TfrmRelatorios.btSelectAllVendSaidasProdServClick(Sender: TObject);
begin
  inherited;
  obRel.SelTodaListaVendedores(CheckListBox3);
end;

procedure TfrmRelatorios.btSelectAllVendSaidasVendAcrescVendClick(
  Sender: TObject);
begin
  inherited;
	obRel.SelTodaListaVendedores(CheckListBox8);
end;

procedure TfrmRelatorios.btSelectAllVendSaidasVendClick(Sender: TObject);
begin
  inherited;
	obRel.SelTodaListaVendedores(CheckListBox5);
end;

procedure TfrmRelatorios.btUnSelectAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ObRel.desmarcaTodos(ObRel.dtSetCtrlTitRota);
  finally
    Screen.Cursor := crDefault;
  end;  
end;

procedure TfrmRelatorios.btUnSelectAllVendComissProdRecClick(Sender: TObject);
begin
  inherited;
	obRel.DesmarcaTodaListaVendedores(CheckListBox6);
end;

procedure TfrmRelatorios.btUnSelectAllVendSaidasBalcaoClick(Sender: TObject);
begin
  inherited;
  obRel.DesmarcaTodaListaVendedores(CheckListBox1);
end;

procedure TfrmRelatorios.btUnSelectAllVendSaidasBalcaoPartClick(Sender: TObject);
begin
  inherited;
  obRel.DesmarcaTodaListaParticipantes(CheckListBox2);
end;

procedure TfrmRelatorios.btUnSelectAllVendSaidasGeralClick(Sender: TObject);
begin
  inherited;
	obRel.DesmarcaTodaListaVendedores(CheckListBox4);
end;

procedure TfrmRelatorios.btUnSelectAllVendSaidasProdServClick(Sender: TObject);
begin
  inherited;
  obRel.DesmarcaTodaListaVendedores(CheckListBox3);
end;

procedure TfrmRelatorios.btUnSelectAllVendSaidasVendAcrescVendClick(
  Sender: TObject);
begin
  inherited;
	obRel.DesmarcaTodaListaVendedores(CheckListBox5);
end;

procedure TfrmRelatorios.btUnSelectAllVendSaidasVendClick(Sender: TObject);
begin
  inherited;
	obRel.DesmarcaTodaListaVendedores(CheckListBox5);
end;

procedure TfrmRelatorios.CheckBox10Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoVeic := TCheckBox(sender).Checked;
  ComboBox9.Enabled := TCheckBox(sender).Checked;
end;

procedure TfrmRelatorios.CheckBox11Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoNF := TCheckBox(sender).Checked;
  ComboBox11.Enabled := TCheckBox(sender).Checked;
end;

procedure TfrmRelatorios.CheckBox12Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarGrupo := TCheckBox(sender).Checked;
  DBEdit2.Visible := false;
  if ObRel.ListaGrupos(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox2.Enabled := true;
    DBLookupComboBox2.KeyValue := ObRel.dtSetGrup.FieldByName('CODIGO_GRUP').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
	    DBLookupComboBox2.SetFocus;
  end
  else
    DBLookupComboBox2.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox13Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarVendedor := TCheckBox(sender).Checked;
//  DBEdit1.Visible := false;

  if ObRel.MontarListaVendedores(
  	TCheckBox(sender).Checked,
    CheckListBox1) then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL002', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
    	Panel34.Height := 29;
      DBLookupComboBox1.Enabled := false;
      DBLookupComboBox1.Visible := true;
      checkListBox1.Visible := false;
      btSelectAllVendSaidasBalcao.Visible := false;
      btUnSelectAllVendSaidasBalcao.Visible := false;
      DBLookupComboBox1.KeyValue := vDadosIni.vCodUsuario;
      exit;
    end;

    Panel34.Height := 112;
    DBLookupComboBox1.Visible := false;
    CheckListBox1.Visible := true;
    btSelectAllVendSaidasBalcao.Visible := true;
    btUnSelectAllVendSaidasBalcao.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (CheckListBox1.CanFocus) then
      CheckListBox1.SetFocus;
  end
  else
  begin
  	Panel34.Height := 29;
    DBLookupComboBox1.Enabled := false;
    DBLookupComboBox1.Visible := true;
    CheckListBox1.Visible := false;
    btSelectAllVendSaidasBalcao.Visible := false;
    btUnSelectAllVendSaidasBalcao.Visible := false;
  end;
end;

procedure TfrmRelatorios.CheckBox14Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoVenda := TCheckBox(sender).Checked;
  if ObRel.ListaTiposVenda('REQ', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox3.Enabled := true;
    DBLookupComboBox3.KeyValue := ObRel.dtSetTipVenda.FieldByName('SIGLA').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox3.CanFocus) then
	    DBLookupComboBox3.SetFocus;
  end
  else
    DBLookupComboBox3.Enabled := false;
  
end;

procedure TfrmRelatorios.CheckBox15Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarGrupo := TCheckBox(sender).Checked;
  DBEdit4.Visible := false;
  if ObRel.ListaGrupos(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox5.Enabled := true;
    DBLookupComboBox5.KeyValue := ObRel.dtSetGrup.FieldByName('CODIGO_GRUP').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox5.CanFocus) then
	    DBLookupComboBox5.SetFocus;
  end
  else
    DBLookupComboBox5.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox16Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarVendedor := TCheckBox(sender).Checked;
//  DBEdit3.Visible := false;
  if ObRel.MontarListaVendedores(
  	TCheckBox(sender).Checked,
    CheckListBox3) then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL004', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      Panel40.Height := 29;
      DBLookupComboBox4.Enabled := false;
      DBLookupComboBox4.Visible := true;
      checkListBox3.Visible := false;
      btSelectAllVendSaidasProdServ.Visible := false;
      btUnSelectAllVendSaidasProdServ.Visible := false;
      DBLookupComboBox4.KeyValue := vDadosIni.vCodUsuario;
      exit;
    end;

    Panel40.Height := 112;
    DBLookupComboBox4.Visible := false;
    CheckListBox3.Visible := true;
    btSelectAllVendSaidasProdServ.Visible := true;
    btUnSelectAllVendSaidasProdServ.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (CheckListBox3.CanFocus) then
      CheckListBox3.SetFocus;
  end
  else
  begin
    Panel40.Height := 29;
    DBLookupComboBox4.Enabled := false;
    DBLookupComboBox4.Visible := true;
    checkListBox3.Visible := false;
    btSelectAllVendSaidasProdServ.Visible := false;
    btUnSelectAllVendSaidasProdServ.Visible := false;
    DBLookupComboBox4.KeyValue := vDadosIni.vCodUsuario;
  end;
end;

procedure TfrmRelatorios.CheckBox17Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoOS := TCheckBox(sender).Checked;
  if ObRel.ListaTiposOS('OS', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox6.Enabled := true;
    DBLookupComboBox6.KeyValue := ObRel.dtSetTipoOS.FieldByName('TIPO_OS').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox6.CanFocus) then
	    DBLookupComboBox6.SetFocus;
  end
  else
    DBLookupComboBox6.Enabled := false;
  CheckBox48.Enabled := not TCheckBox(sender).Checked;
  if TCheckBox(sender).Checked then
  begin
    CheckBox48.Checked := false;
    DBComboBox1.Enabled := false;
  end;
end;

procedure TfrmRelatorios.CheckBox18Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarGrupo := TCheckBox(sender).Checked;
  DBEdit6.Visible := false;
  if ObRel.ListaGrupos(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox8.Enabled := true;
    DBLookupComboBox8.KeyValue := ObRel.dtSetGrup.FieldByName('CODIGO_GRUP').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox8.CanFocus) then
	    DBLookupComboBox8.SetFocus;
  end
  else
    DBLookupComboBox8.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox19Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarVendedor := TCheckBox(sender).Checked;
//  DBEdit5.Visible := false;
  if ObRel.MontarListaVendedores(
  	TCheckBox(sender).Checked,
    CheckListBox4) then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL006', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      Panel43.Height := 29;
      DBLookupComboBox7.Enabled := false;
      DBLookupComboBox7.Visible := true;
      checkListBox4.Visible := false;
      btSelectAllVendSaidasGeral.Visible := false;
      btUnSelectAllVendSaidasGeral.Visible := false;
      DBLookupComboBox7.KeyValue := vDadosIni.vCodUsuario;
      exit;
    end;

    Panel43.Height := 112;
    DBLookupComboBox7.Visible := false;
    CheckListBox4.Visible := true;
    btSelectAllVendSaidasGeral.Visible := true;
    btUnSelectAllVendSaidasGeral.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (CheckListBox4.CanFocus) then
      CheckListBox4.SetFocus;
  end
  else
  begin
    Panel43.Height := 29;
    DBLookupComboBox7.Enabled := false;
    DBLookupComboBox7.Visible := true;
    checkListBox4.Visible := false;
    btSelectAllVendSaidasGeral.Visible := false;
    btUnSelectAllVendSaidasGeral.Visible := false;
    DBLookupComboBox7.KeyValue := vDadosIni.vCodUsuario;
  end;
end;

procedure TfrmRelatorios.CheckBox1Click(Sender: TObject);
var
  codcliente: string;
begin
  inherited;
  ObRel.FiltrarCliente := TCheckBox(sender).Checked;
  DBEdit11.Visible := false;
  try
    if ObRel.FiltrarCliente then
    begin
      Screen.Cursor := crHourGlass;
      codcliente := vDadosIni.pesquisaRapida('CLIENTES');
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  if ObRel.ListaClientes(TCheckBox(sender).Checked, codcliente) then
  begin
    DBLookupComboBox22.Enabled := true;
    DBLookupComboBox22.KeyValue := ObRel.dtSetCliente.FieldByName('COD_CLIENTE').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox22.CanFocus) then
	    DBLookupComboBox22.SetFocus;
  end
  else
    DBLookupComboBox22.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox20Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoOS := TCheckBox(sender).Checked;
  if ObRel.ListaTiposOS('OS', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox9.Enabled := true;
    DBLookupComboBox9.KeyValue := ObRel.dtSetTipoOS.FieldByName('TIPO_OS').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox9.CanFocus) then
	    DBLookupComboBox9.SetFocus;
  end
  else
    DBLookupComboBox9.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox21Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoVenda := TCheckBox(sender).Checked;
  if ObRel.ListaTiposVenda('REQ', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox10.Enabled := true;
    DBLookupComboBox10.KeyValue := ObRel.dtSetTipVenda.FieldByName('SIGLA').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox10.CanFocus) then
	    DBLookupComboBox10.SetFocus;
  end
  else
    DBLookupComboBox10.Enabled := false;
  CheckBox49.Enabled := not TCheckBox(sender).Checked;
  if TCheckBox(sender).Checked then
  begin
    CheckBox49.Checked := false;
    DBComboBox2.Enabled := false;
  end;
end;

procedure TfrmRelatorios.CheckBox22Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarVendedor := TCheckBox(sender).Checked;
//  DBEdit8.Visible := false;
  if ObRel.MontarListaVendedores(
    TCheckBox(sender).Checked,
    checkListBox6) then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL012', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      Panel49.Height := 29;
      DBLookupComboBox12.Enabled := false;
      DBLookupComboBox12.Visible := true;
      checkListBox6.Visible := false;
      btSelectAllVendComissProdRec.Visible := false;
      btUnSelectAllVendComissProdRec.Visible := false;
      DBLookupComboBox12.KeyValue := vDadosIni.vCodUsuario;
      exit;
    end;

    Panel49.Height := 112;
    DBLookupComboBox12.Visible := false;
    CheckListBox6.Visible := true;
    btSelectAllVendComissProdRec.Visible := true;
    btUnSelectAllVendComissProdRec.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (CheckListBox6.CanFocus) then
      CheckListBox6.SetFocus;
  end
  else
  begin
    Panel49.Height := 29;
    DBLookupComboBox12.Enabled := false;
    DBLookupComboBox12.Visible := true;
    checkListBox6.Visible := false;
    btSelectAllVendComissProdRec.Visible := false;
    btUnSelectAllVendComissProdRec.Visible := false;
    DBLookupComboBox12.KeyValue := vDadosIni.vCodUsuario;
  end;
end;

procedure TfrmRelatorios.CheckBox23Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarVendedor := TCheckBox(sender).Checked;
//  Label2.Visible := not ObRel.FiltrarVendedor;
//  ComboBox2.Visible := not ObRel.FiltrarVendedor;
//  DBEdit7.Visible := ObRel.FiltrarVendedor;
//  DBEdit7.Enabled := false;
  if ObRel.MontarListaVendedores(
  	TCheckBox(sender).Checked,
    CheckListBox5) then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL008', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      Panel46.Height := 29;
      DBLookupComboBox11.Enabled := false;
      DBLookupComboBox11.Visible := true;
      checkListBox5.Visible := false;
      btSelectAllVendSaidasVend.Visible := false;
      btUnSelectAllVendSaidasVend.Visible := false;
      DBLookupComboBox11.KeyValue := vDadosIni.vCodUsuario;
      exit;
    end;

    Panel46.Height := 112;
    DBLookupComboBox11.Visible := false;
    CheckListBox5.Visible := true;
    btSelectAllVendSaidasVend.Visible := true;
    btUnSelectAllVendSaidasVend.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (CheckListBox5.CanFocus) then
      CheckListBox5.SetFocus;
  end
  else
  begin
    Panel46.Height := 29;
    DBLookupComboBox11.Enabled := false;
    DBLookupComboBox11.Visible := true;
    checkListBox5.Visible := false;
    btSelectAllVendSaidasVend.Visible := false;
    btUnSelectAllVendSaidasVend.Visible := false;
    DBLookupComboBox11.KeyValue := vDadosIni.vCodUsuario;
  end;
end;

procedure TfrmRelatorios.CheckBox24Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoOS := TCheckBox(sender).Checked;
  if ObRel.ListaTiposOS('OS', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox13.Enabled := true;
    DBLookupComboBox13.KeyValue := ObRel.dtSetTipoOS.FieldByName('TIPO_OS').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox13.CanFocus) then
	    DBLookupComboBox13.SetFocus;
  end
  else
    DBLookupComboBox13.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox25Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoVenda := TCheckBox(sender).Checked;
  if ObRel.ListaTiposVenda('REQ', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox14.Enabled := true;
    DBLookupComboBox14.KeyValue := ObRel.dtSetTipVenda.FieldByName('SIGLA').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox14.CanFocus) then
	    DBLookupComboBox14.SetFocus;
  end
  else
    DBLookupComboBox14.Enabled := false;
  CheckBox50.Enabled := not TCheckBox(sender).Checked;
  if TCheckBox(sender).Checked then
  begin
    CheckBox50.Checked := false;
    DBComboBox3.Enabled := false;
  end;
end;

procedure TfrmRelatorios.CheckBox27Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarFuncao := TCheckBox(sender).Checked;
  if ObRel.ListaFuncoes(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox15.Enabled := true;
    DBLookupComboBox15.KeyValue := ObRel.dtSetFuncoes.FieldByName('COD_FUNCAO').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox15.CanFocus) then
	    DBLookupComboBox15.SetFocus;
  end
  else
    DBLookupComboBox15.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox28Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoOS := TCheckBox(sender).Checked;
  if ObRel.ListaTiposOS('OS', TCheckBox(sender).Checked, 1) then
  begin
    DBLookupComboBox17.Enabled := true;
    DBLookupComboBox17.KeyValue := ObRel.dtSetTipoOS.FieldByName('TIPO_OS').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox17.CanFocus) then
	    DBLookupComboBox17.SetFocus;
  end
  else
    DBLookupComboBox17.Enabled := false;
  CheckBox51.Enabled := not TCheckBox(sender).Checked;
  if TCheckBox(sender).Checked then
  begin
    CheckBox51.Checked := false;
    DBComboBox4.Enabled := false;
  end;
end;

procedure TfrmRelatorios.CheckBox29Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarCFOP := TCheckBox(sender).Checked;
  edmCFOP.Enabled := false;
  if ObRel.ListaCFOP(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox16.Enabled := true;
    DBLookupComboBox16.KeyValue := ObRel.dtSetCFOP.FieldByName('CODIGO_NOP').AsFloat;
    edmCFOP.Enabled := true;
    edmCFOP.Valor := ObRel.dtSetCFOP.FieldByName('CODIGO_NOP').AsFloat;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox16.CanFocus) then
	    DBLookupComboBox16.SetFocus;
  end
  else
  begin
    DBLookupComboBox16.Enabled := false;
    edmCFOP.Valor := 0;
    edmCFOP.Enabled := false;
  end;
end;

procedure TfrmRelatorios.CheckBox30Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoOS := TCheckBox(sender).Checked;
  if ObRel.ListaTiposOS('OS', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox19.Enabled := true;
    DBLookupComboBox19.KeyValue := ObRel.dtSetTipoOS.FieldByName('TIPO_OS').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox19.CanFocus) then
	    DBLookupComboBox19.SetFocus;
  end
  else
    DBLookupComboBox19.Enabled := false;
  CheckBox52.Enabled := not TCheckBox(sender).Checked;
  if TCheckBox(sender).Checked then
  begin
    CheckBox52.Checked := false;
    DBComboBox5.Enabled := false;
  end;  
end;

procedure TfrmRelatorios.CheckBox31Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarCondPagamento := TCheckBox(sender).Checked;
  DBEdit9.Visible := false;
  if ObRel.ListaCondPag(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox18.Enabled := true;
    DBLookupComboBox18.KeyValue := ObRel.dtSetCondPag.FieldByName('COD_COND_PAG').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox18.CanFocus) then
	    DBLookupComboBox18.SetFocus;
  end
  else
    DBLookupComboBox18.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox32Click(Sender: TObject);
var
  codcliente: string;
begin
  inherited;
  ObRel.FiltrarCliente := TCheckBox(sender).Checked;
  DBEdit10.Visible := false;
  try
    if ObRel.FiltrarCliente then
    begin
      Screen.Cursor := crHourGlass;
      codcliente := vDadosIni.pesquisaRapida('CLIENTES');
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  if ObRel.ListaClientes(TCheckBox(sender).Checked, codcliente) then
  begin
    DBLookupComboBox20.Enabled := true;
    DBLookupComboBox20.KeyValue := ObRel.dtSetCliente.FieldByName('COD_CLIENTE').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox20.CanFocus) then
	    DBLookupComboBox20.SetFocus;
  end
  else
    DBLookupComboBox20.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox33Click(Sender: TObject);
begin
  inherited;
  ObRel.ExibirVendaREQ := TCheckBox(sender).Checked;
end;

procedure TfrmRelatorios.CheckBox34Click(Sender: TObject);
begin
  inherited;
  ObRel.ExibirVendaOS := TCheckBox(sender).Checked;
end;

procedure TfrmRelatorios.CheckBox35Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarData := TCheckBox(sender).Checked;
end;

procedure TfrmRelatorios.CheckBox36Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoVenda := TCheckBox(sender).Checked;
  if ObRel.ListaTiposVenda('REQ', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox21.Enabled := true;
    DBLookupComboBox21.KeyValue := ObRel.dtSetTipVenda.FieldByName('SIGLA').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox21.CanFocus) then
	    DBLookupComboBox21.SetFocus;
  end
  else
    DBLookupComboBox21.Enabled := false;

end;

procedure TfrmRelatorios.CheckBox37Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarPlaca := TCheckBox(sender).Checked;
  if ObRel.FiltrarPlaca then
  begin
    MaskEdit5.Visible := true;
    MaskEdit5.Text := '';
    if (Self.Enabled) and (Self.Visible) and (MaskEdit5.CanFocus) then
	    MaskEdit5.SetFocus;
  end
  else
    MaskEdit5.Visible := false;
end;

procedure TfrmRelatorios.CheckBox38Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoVenda := TCheckBox(sender).Checked;
  ComboBox12.Enabled := TCheckBox(sender).Checked;
end;

procedure TfrmRelatorios.CheckBox44Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarVendedor := TCheckBox(sender).Checked;
  DBEdit14.Visible := false;

  if ObRel.ListaVendedores(TCheckBox(sender).Checked) then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL028', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      DBLookupComboBox25.Enabled := false;
      DBLookupComboBox25.KeyValue := vDadosIni.vCodUsuario;
      exit;
    end;

    DBLookupComboBox25.Enabled := true;
    DBLookupComboBox25.KeyValue := ObRel.dtSetColab.FieldByName('COD_VENDEDOR').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox25.CanFocus) then
	    DBLookupComboBox25.SetFocus;
  end
  else
    DBLookupComboBox25.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox45Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarCondPagamento := TCheckBox(sender).Checked;
  DBEdit15.Visible := false;
  if ObRel.ListaCondPag(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox26.Enabled := true;
    DBLookupComboBox26.KeyValue := ObRel.dtSetCondPag.FieldByName('COD_COND_PAG').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox26.CanFocus) then
	    DBLookupComboBox26.SetFocus;
  end
  else
    DBLookupComboBox26.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox46Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarVendedor := TCheckBox(sender).Checked;
//  DBEdit5.Visible := false;
  if ObRel.ListaVendedores(TCheckBox(sender).Checked) then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL047', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      DBLookupComboBox27.Enabled := false;
      DBLookupComboBox27.KeyValue := vDadosIni.vCodUsuario;
      exit;
    end;
    DBLookupComboBox27.Enabled := true;
    DBLookupComboBox27.KeyValue := ObRel.dtSetColab.FieldByName('COD_VENDEDOR').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox27.CanFocus) then
	    DBLookupComboBox27.SetFocus;
  end
  else
    DBLookupComboBox27.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox47Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarVendedor := TCheckBox(sender).Checked;
  DBEdit17.Visible := false;

  if ObRel.ListaVendedores(TCheckBox(sender).Checked) then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL044', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      DBLookupComboBox28.Enabled := false;
      DBLookupComboBox28.KeyValue := vDadosIni.vCodUsuario;
      exit;
    end;

    DBLookupComboBox28.Enabled := true;
    DBLookupComboBox28.KeyValue := ObRel.dtSetColab.FieldByName('COD_VENDEDOR').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox28.CanFocus) then
	    DBLookupComboBox28.SetFocus;
  end
  else
    DBLookupComboBox28.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox48Click(Sender: TObject);
begin
  ObRel.FiltrarAreaExec := TCheckBox(sender).Checked;
  if ObRel.ListaAreaExec(DBComboBox1, TCheckBox(sender).Checked, 'OS') then
  begin
    DBComboBox1.Enabled := true;
    DBComboBox1.Text := ObRel.dtSetArea.FieldByName('AREA_EXEC').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
	    DBComboBox1.SetFocus;
  end
  else
    DBComboBox1.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox49Click(Sender: TObject);
begin
  ObRel.FiltrarAreaExec := TCheckBox(sender).Checked;
  if ObRel.ListaAreaExec(DBComboBox2, TCheckBox(sender).Checked, 'OS') then
  begin
    DBComboBox2.Enabled := true;
    DBComboBox2.Text := ObRel.dtSetArea.FieldByName('AREA_EXEC').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
	    DBComboBox2.SetFocus;
  end
  else
    DBComboBox2.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox50Click(Sender: TObject);
begin
  ObRel.FiltrarAreaExec := TCheckBox(sender).Checked;
  if ObRel.ListaAreaExec(DBComboBox3, TCheckBox(sender).Checked, 'OS') then
  begin
    DBComboBox3.Enabled := true;
    DBComboBox3.Text := ObRel.dtSetArea.FieldByName('AREA_EXEC').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
	    DBComboBox3.SetFocus;
  end
  else
    DBComboBox3.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox51Click(Sender: TObject);
begin
  ObRel.FiltrarAreaExec := TCheckBox(sender).Checked;
  if ObRel.ListaAreaExec(DBComboBox4, TCheckBox(sender).Checked, 'OS') then
  begin
    DBComboBox4.Enabled := true;
    DBComboBox4.Text := ObRel.dtSetArea.FieldByName('AREA_EXEC').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox4.CanFocus) then
	    DBComboBox4.SetFocus;
  end
  else
    DBComboBox4.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox52Click(Sender: TObject);
begin
  ObRel.FiltrarAreaExec := TCheckBox(sender).Checked;
  if ObRel.ListaAreaExec(DBComboBox5, TCheckBox(sender).Checked, 'OS') then
  begin
    DBComboBox5.Enabled := true;
    DBComboBox5.Text := ObRel.dtSetArea.FieldByName('AREA_EXEC').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox5.CanFocus) then
	    DBComboBox5.SetFocus;
  end
  else
    DBComboBox5.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox53Click(Sender: TObject);
begin
  ObRel.FiltrarGrupo := TCheckBox(sender).Checked;
  DBEdit19.Visible := false;
  if ObRel.ListaGrupos(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox30.Enabled := true;
    DBLookupComboBox30.KeyValue := ObRel.dtSetGrup.FieldByName('CODIGO_GRUP').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox30.CanFocus) then
	    DBLookupComboBox30.SetFocus;
  end
  else
    DBLookupComboBox30.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox54Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarTipoOS := TCheckBox(sender).Checked;
  if ObRel.ListaTiposOS('OS', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox65.Enabled := true;
    DBLookupComboBox65.KeyValue := ObRel.dtSetTipoOS.FieldByName('TIPO_OS').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox65.CanFocus) then
	    DBLookupComboBox65.SetFocus;
  end
  else
    DBLookupComboBox65.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox55Click(Sender: TObject);
begin
  ObRel.FiltrarTipoVenda := TCheckBox(sender).Checked;
  if ObRel.ListaTiposVenda('REQ', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox31.Enabled := true;
    DBLookupComboBox31.KeyValue := ObRel.dtSetTipVenda.FieldByName('SIGLA').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox31.CanFocus) then
	    DBLookupComboBox31.SetFocus;
  end
  else
    DBLookupComboBox31.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox56Click(Sender: TObject);
var
  codcliente: string;
begin
  inherited;
  ObRel.FiltrarCliente := TCheckBox(sender).Checked;
  DBEdit20.Visible := false;
  try
    if ObRel.FiltrarCliente then
    begin
      Screen.Cursor := crHourGlass;
      codcliente := vDadosIni.pesquisaRapida('CLIENTES');
    end;
  finally
    Screen.Cursor := crDefault;
  end;

  if trim(codcliente) = '' then
  	TCheckBox(sender).Checked := False
  else
    if ObRel.ListaClientesRec(TCheckBox(sender).Checked, codcliente) then
    begin
      DBLookupComboBox32.Enabled := true;
      DBLookupComboBox32.KeyValue := ObRel.dtSetClienteRec.FieldByName('COD_CLIENTE').AsInteger;
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox32.CanFocus) then
        DBLookupComboBox32.SetFocus;
    end
    else
      DBLookupComboBox32.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox57Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoVenda := TCheckBox(sender).Checked;
  if ObRel.ListaTiposVendaRec('REQ', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox33.Enabled := true;
    DBLookupComboBox33.KeyValue := ObRel.dtSetTipVendaRec.FieldByName('SIGLA').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox33.CanFocus) then
	    DBLookupComboBox33.SetFocus;
  end
  else
    DBLookupComboBox33.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox58Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoOS := TCheckBox(sender).Checked;
  if ObRel.ListaTiposOSRec('OS', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox34.Enabled := true;
    DBLookupComboBox34.KeyValue := ObRel.dtSetTipoOSRec.FieldByName('TIPO_OS').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox34.CanFocus) then
	    DBLookupComboBox34.SetFocus;
  end
  else
    DBLookupComboBox34.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox59Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoVeic := TCheckBox(sender).Checked;
  if ObRel.ListaTiposVeicRec('VEI', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox35.Enabled := true;
    DBLookupComboBox35.KeyValue := ObRel.dtSetTipoVeicRec.FieldByName('TIPO_OS').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox35.CanFocus) then
	    DBLookupComboBox35.SetFocus;
  end
  else
    DBLookupComboBox35.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox5Click(Sender: TObject);
var
  vCodobjeto: string;
begin
  inherited;
  ObRel.FiltrarObjeto := TCheckBox(sender).Checked;
  DBEdit12.Visible := false;
  try
    if ObRel.FiltrarObjeto then
    begin
      Screen.Cursor := crHourGlass;
      vCodobjeto := vDadosIni.pesquisaRapida('EQUIPAMENTO', ' AND EQUIPAMENTO.TIP_EQUIP = ''E'' ', '');
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  if ObRel.ListaObjetos(TCheckBox(sender).Checked, vCodobjeto) then
  begin
    DBLookupComboBox23.Enabled := true;
    DBLookupComboBox23.KeyValue := ObRel.dtSetObjeto.FieldByName('COD_EQUIP').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox23.CanFocus) then
	    DBLookupComboBox23.SetFocus;
  end
  else
    DBLookupComboBox23.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox60Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarVenda := TCheckBox(sender).Checked;
  if ObRel.FiltrarVenda then
	  ComboBox24.Enabled := true
  else
		ComboBox24.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox61Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarPorTipo := TCheckBox(sender).Checked;
  if ObRel.FiltrarPorTipo then
	  ComboBox25.Enabled := true
  else
		ComboBox25.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox62Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarControle := TCheckBox(sender).Checked;
  DBEdit33.Visible := false;
  if ObRel.ListaControlesRec(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox36.Enabled := true;
    DBLookupComboBox36.KeyValue := ObRel.dtSetControlesRec.FieldByName('CODIGO_CTRL').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox36.CanFocus) then
	    DBLookupComboBox36.SetFocus;
  end
  else
    DBLookupComboBox36.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox63Click(Sender: TObject);
var
  codcliente: string;
begin
  inherited;
  ObRel.FiltrarCliente := TCheckBox(sender).Checked;
  DBEdit21.Visible := false;
  try
    if ObRel.FiltrarCliente then
    begin
      Screen.Cursor := crHourGlass;
      codcliente := vDadosIni.pesquisaRapida('CLIENTES');
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  if ObRel.ListaClientes(TCheckBox(sender).Checked, codcliente) then
  begin
    DBLookupComboBox37.Enabled := true;
    DBLookupComboBox37.KeyValue := ObRel.dtSetCliente.FieldByName('COD_CLIENTE').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox37.CanFocus) then
	    DBLookupComboBox37.SetFocus;
  end
  else
    DBLookupComboBox37.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox64Click(Sender: TObject);
var
  codcliente: string;
begin
  inherited;
  ObRel.FiltrarCliente := TCheckBox(sender).Checked;
  DBEdit10.Visible := false;
  try
    if ObRel.FiltrarCliente then
    begin
      Screen.Cursor := crHourGlass;
      codcliente := vDadosIni.pesquisaRapida('CLIENTES');
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  if ObRel.ListaClientes(TCheckBox(sender).Checked, codcliente) then
  begin
    DBLookupComboBox38.Enabled := true;
    DBLookupComboBox38.KeyValue := ObRel.dtSetCliente.FieldByName('COD_CLIENTE').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox38.CanFocus) then
	    DBLookupComboBox38.SetFocus;
  end
  else
    DBLookupComboBox38.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox65Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarVendedor := TCheckBox(sender).Checked;
  DBEdit23.Visible := false;

  if ObRel.ListaVendedores(TCheckBox(sender).Checked) then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL055', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      DBLookupComboBox40.Enabled := false;
      DBLookupComboBox40.KeyValue := vDadosIni.vCodUsuario;
      exit;
    end;

    DBLookupComboBox40.Enabled := true;
    DBLookupComboBox40.KeyValue := ObRel.dtSetColab.FieldByName('COD_VENDEDOR').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox40.CanFocus) then
	    DBLookupComboBox40.SetFocus;
  end
  else
    DBLookupComboBox40.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox66Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.vPedVnd.habPartipante then
    exit;
     
  ObRel.FiltrarParticipante := TCheckBox(sender).Checked;
  DBEdit24.Visible := false;

  if ObRel.ListaParticipantes(TCheckBox(sender).Checked, true) then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL056', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      DBLookupComboBox41.Enabled := false;
      DBLookupComboBox41.KeyValue := vDadosIni.vCodUsuario;
      exit;
    end;

    DBLookupComboBox41.Enabled := true;
    DBLookupComboBox41.KeyValue := ObRel.dtSetParticipante.FieldByName('COD_PARTICIPANTE').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox41.CanFocus) then
	    DBLookupComboBox41.SetFocus;
  end
  else
    DBLookupComboBox41.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox67Click(Sender: TObject);
var
  codcliente: string;
begin
  inherited;
  ObRel.FiltrarCliente := TCheckBox(sender).Checked;
  DBEdit25.Visible := false;
  try
    if ObRel.FiltrarCliente then
    begin
      Screen.Cursor := crHourGlass;
      codcliente := vDadosIni.pesquisaRapida('CLIENTES');
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  if ObRel.ListaClientes(TCheckBox(sender).Checked, codcliente) then
  begin
    DBLookupComboBox42.Enabled := true;
    DBLookupComboBox42.KeyValue := ObRel.dtSetCliente.FieldByName('COD_CLIENTE').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox42.CanFocus) then
	    DBLookupComboBox42.SetFocus;
  end
  else
    DBLookupComboBox42.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox68Click(Sender: TObject);
var
  codcliente: string;
begin
  inherited;
  ObRel.FiltrarCliente := TCheckBox(sender).Checked;
  DBEdit26.Visible := false;
  try
    if ObRel.FiltrarCliente then
    begin
      Screen.Cursor := crHourGlass;
      codcliente := vDadosIni.pesquisaRapida('CLIENTES');
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  if ObRel.ListaClientes(TCheckBox(sender).Checked, codcliente) then
  begin
    DBLookupComboBox43.Enabled := true;
    DBLookupComboBox43.KeyValue := ObRel.dtSetCliente.FieldByName('COD_CLIENTE').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox43.CanFocus) then
	    DBLookupComboBox43.SetFocus;
  end
  else
    DBLookupComboBox43.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox69Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarTipoOS := TCheckBox(sender).Checked;
  if ObRel.ListaTiposOS('OS', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox44.Enabled := true;
    DBLookupComboBox44.KeyValue := ObRel.dtSetTipoOS.FieldByName('TIPO_OS').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox44.CanFocus) then
	    DBLookupComboBox44.SetFocus;
  end
  else
    DBLookupComboBox44.Enabled := false;
  CheckBox71.Enabled := not TCheckBox(sender).Checked;
  if TCheckBox(sender).Checked then
  begin
    CheckBox71.Checked := false;
    DBComboBox6.Enabled := false;
  end;  
end;

procedure TfrmRelatorios.CheckBox6Click(Sender: TObject);
begin
  inherited;
  ObRel.ExibirDavORC := TCheckBox(sender).Checked;
end;

procedure TfrmRelatorios.CheckBox70Click(Sender: TObject);
begin
  ObRel.FiltrarCondPagamento := TCheckBox(sender).Checked;
  DBEdit27.Visible := false;
  if ObRel.ListaCondPag(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox45.Enabled := true;
    DBLookupComboBox45.KeyValue := ObRel.dtSetCondPag.FieldByName('COD_COND_PAG').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox45.CanFocus) then
	    DBLookupComboBox45.SetFocus;
  end
  else
    DBLookupComboBox45.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox71Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarAreaExec := TCheckBox(sender).Checked;
  if ObRel.ListaAreaExec(DBComboBox6, TCheckBox(sender).Checked, 'OS') then
  begin
    DBComboBox6.Enabled := true;
    DBComboBox6.Text := ObRel.dtSetArea.FieldByName('AREA_EXEC').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox6.CanFocus) then
	    DBComboBox6.SetFocus;
  end
  else
    DBComboBox6.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox72Click(Sender: TObject);
var
  codcliente: string;
begin
  inherited;
  ObRel.FiltrarCliente := TCheckBox(sender).Checked;
  DBEdit28.Visible := false;
  try
    if ObRel.FiltrarCliente then
    begin
      Screen.Cursor := crHourGlass;
      codcliente := vDadosIni.pesquisaRapida('CLIENTES');
    end;
  finally
    Screen.Cursor := crDefault;
  end;
  if ObRel.ListaClientes(TCheckBox(sender).Checked, codcliente) then
  begin
    DBLookupComboBox46.Enabled := true;
    DBLookupComboBox46.KeyValue := ObRel.dtSetCliente.FieldByName('COD_CLIENTE').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox46.CanFocus) then
	    DBLookupComboBox46.SetFocus;
  end
  else
    DBLookupComboBox46.Enabled := false;
  Label83.Visible := CheckBox72.Checked;
  ComboBox61.Visible := CheckBox72.Checked;
end;

procedure TfrmRelatorios.CheckBox73Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoVenda := TCheckBox(sender).Checked;
  if ObRel.ListaTiposVenda('REQ', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox47.Enabled := true;
    DBLookupComboBox47.KeyValue := ObRel.dtSetTipVenda.FieldByName('SIGLA').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox47.CanFocus) then
	    DBLookupComboBox47.SetFocus;
  end
  else
    DBLookupComboBox47.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox74Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarControle := TCheckBox(sender).Checked;
  DBEdit29.Visible := false;
  if ObRel.ListaControles(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox48.Enabled := true;
    DBLookupComboBox48.KeyValue := ObRel.dtSetControles.FieldByName('CODIGO_CTRL').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox48.CanFocus) then
	    DBLookupComboBox48.SetFocus;
  end
  else
    DBLookupComboBox48.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox75Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarVendedor := TCheckBox(sender).Checked;
//  Label2.Visible := not ObRel.FiltrarVendedor;
//  ComboBox2.Visible := not ObRel.FiltrarVendedor;
//  DBEdit30.Visible := ObRel.FiltrarVendedor;
//  DBEdit30.Enabled := false;
  if ObRel.MontarListaVendedores(
  	TCheckBox(sender).Checked,
    checkListBox7) then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL059', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      Panel52.Height := 29;
      DBLookupComboBox49.Enabled := false;
      DBLookupComboBox49.Visible := true;
      checkListBox7.Visible := false;
      btSelectAllVendComissFaixaDesc.Visible := false;
      btUnSelectAllVendComissFaixaDesc.Visible := false;
      DBLookupComboBox49.KeyValue := vDadosIni.vCodUsuario;
      exit;
    end;

    Panel52.Height := 112;
    DBLookupComboBox49.Visible := false;
    CheckListBox7.Visible := true;
    btSelectAllVendComissFaixaDesc.Visible := true;
    btUnSelectAllVendComissFaixaDesc.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (checkListBox7.CanFocus) then
      checkListBox7.SetFocus;
  end
  else
  begin
    Panel52.Height := 29;
    DBLookupComboBox49.Enabled := false;
    DBLookupComboBox49.Visible := true;
    checkListBox7.Visible := false;
    btSelectAllVendComissFaixaDesc.Visible := false;
    btUnSelectAllVendComissFaixaDesc.Visible := false;
    DBLookupComboBox49.KeyValue := vDadosIni.vCodUsuario;
  end;
end;

procedure TfrmRelatorios.CheckBox76Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarTipoOS := TCheckBox(sender).Checked;
  if ObRel.ListaTiposOS('OS', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox50.Enabled := true;
    DBLookupComboBox50.KeyValue := ObRel.dtSetTipoOS.FieldByName('TIPO_OS').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox50.CanFocus) then
	    DBLookupComboBox50.SetFocus;
  end
  else
    DBLookupComboBox50.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox77Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarTipoVenda := TCheckBox(sender).Checked;
  if ObRel.ListaTiposVenda('REQ', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox51.Enabled := true;
    DBLookupComboBox51.KeyValue := ObRel.dtSetTipVenda.FieldByName('SIGLA').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox51.CanFocus) then
	    DBLookupComboBox51.SetFocus;
  end
  else
    DBLookupComboBox51.Enabled := false;
  CheckBox78.Enabled := not TCheckBox(sender).Checked;
  if TCheckBox(sender).Checked then
  begin
    CheckBox78.Checked := false;
    DBComboBox7.Enabled := false;
  end;
end;

procedure TfrmRelatorios.CheckBox78Click(Sender: TObject);
begin
	ObRel.FiltrarAreaExec := TCheckBox(sender).Checked;
  if ObRel.ListaAreaExec(DBComboBox7, TCheckBox(sender).Checked, 'OS') then
  begin
    DBComboBox7.Enabled := true;
    DBComboBox7.Text := ObRel.dtSetArea.FieldByName('AREA_EXEC').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox7.CanFocus) then
	    DBComboBox7.SetFocus;
  end
  else
    DBComboBox7.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox80Click(Sender: TObject);
begin
	ObRel.FiltrarControle := TCheckBox(sender).Checked;
  DBEdit32.Visible := false;
  if ObRel.ListaControlesPag(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox52.Enabled := true;
    DBLookupComboBox52.KeyValue := ObRel.dtSetControlesPag.FieldByName('CODIGO_CTRL').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox52.CanFocus) then
	    DBLookupComboBox52.SetFocus;
  end
  else
    DBLookupComboBox52.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox81Click(Sender: TObject);
var
  codcliente: string;
begin
  inherited;
  ObRel.FiltrarCliente := TCheckBox(sender).Checked;
  DBEdit31.Visible := false;
  try
    if ObRel.FiltrarCliente then
    begin
      Screen.Cursor := crHourGlass;
      codcliente := vDadosIni.pesquisaRapida('CLIENTES');
    end;
  finally
    Screen.Cursor := crDefault;
  end;

  if trim(codcliente) = '' then
  	TCheckBox(sender).Checked := False
  else
    if ObRel.ListaClientesPag(TCheckBox(sender).Checked, codcliente) then
    begin
      DBLookupComboBox53.Enabled := true;
      DBLookupComboBox53.KeyValue := ObRel.dtSetClientePag.FieldByName('COD_CLIENTE').AsInteger;
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox53.CanFocus) then
        DBLookupComboBox53.SetFocus;
    end
    else
      DBLookupComboBox53.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox82Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoVenda := TCheckBox(sender).Checked;
  if ObRel.ListaTiposVendaPagRec('REQ', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox54.Enabled := true;
    DBLookupComboBox54.KeyValue := ObRel.dtSetTipVendaPagRec.FieldByName('SIGLA').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox54.CanFocus) then
	    DBLookupComboBox54.SetFocus;
  end
  else
    DBLookupComboBox54.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox83Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoOS := TCheckBox(sender).Checked;
  if ObRel.ListaTiposOSPagRec('OS', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox55.Enabled := true;
    DBLookupComboBox55.KeyValue := ObRel.dtSetTipoOSPagRec.FieldByName('TIPO_OS').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox55.CanFocus) then
	    DBLookupComboBox55.SetFocus;
  end
  else
    DBLookupComboBox55.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox84Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarTipoVeic := TCheckBox(sender).Checked;
  if ObRel.ListaTiposVeicPagRec('VEI', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox56.Enabled := true;
    DBLookupComboBox56.KeyValue := ObRel.dtSetTipoVeicPagRec.FieldByName('TIPO_OS').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox56.CanFocus) then
	    DBLookupComboBox56.SetFocus;
  end
  else
    DBLookupComboBox56.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox85Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarVenda := TCheckBox(sender).Checked;
  if ObRel.FiltrarVenda then
	  ComboBox67.Enabled := true
  else
		ComboBox67.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox86Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarPorTipo := TCheckBox(sender).Checked;
  if ObRel.FiltrarPorTipo then
	  ComboBox68.Enabled := true
  else
		ComboBox68.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox87Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarControle := TCheckBox(sender).Checked;
  DBEdit35.Visible := false;
  if ObRel.ListaControlesPagRec(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox57.Enabled := true;
    DBLookupComboBox57.KeyValue := ObRel.dtSetControlesPagRec.FieldByName('CODIGO_CTRL').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox57.CanFocus) then
	    DBLookupComboBox57.SetFocus;
  end
  else
    DBLookupComboBox57.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox88Click(Sender: TObject);
var
  codcliente: string;
begin
  inherited;
  ObRel.FiltrarCliente := TCheckBox(sender).Checked;
  DBEdit34.Visible := false;
  try
    if ObRel.FiltrarCliente then
    begin
      Screen.Cursor := crHourGlass;
      codcliente := vDadosIni.pesquisaRapida('CLIENTES');
    end;
  finally
    Screen.Cursor := crDefault;
  end;

  if trim(codcliente) = '' then
  	TCheckBox(sender).Checked := False
  else
    if ObRel.ListaClientesPagRec(TCheckBox(sender).Checked, codcliente) then
    begin
      DBLookupComboBox58.Enabled := true;
      DBLookupComboBox58.KeyValue := ObRel.dtSetClientePagRec.FieldByName('COD_CLIENTE').AsInteger;
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox58.CanFocus) then
        DBLookupComboBox58.SetFocus;
    end
    else
      DBLookupComboBox58.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox89Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarOrigControle := TCheckBox(sender).Checked;
  DBEdit36.Visible := false;
  if ObRel.ListaOrigControlesRec(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox59.Enabled := true;
    DBLookupComboBox59.KeyValue := ObRel.dtSetOrigControlesRec.FieldByName('CODIGO_CTRL').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox59.CanFocus) then
	    DBLookupComboBox59.SetFocus;
  end
  else
    DBLookupComboBox59.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox8Click(Sender: TObject);
begin
  ObRel.FiltrarVendedor := TCheckBox(sender).Checked;
  DBEdit13.Visible := false;

  if ObRel.ListaVendedores(TCheckBox(sender).Checked) then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL046', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      DBLookupComboBox24.Enabled := false;
      DBLookupComboBox24.KeyValue := vDadosIni.vCodUsuario;
      exit;
    end;

    DBLookupComboBox24.Enabled := true;
    DBLookupComboBox24.KeyValue := ObRel.dtSetColab.FieldByName('COD_VENDEDOR').AsInteger;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox24.CanFocus) then
	    DBLookupComboBox24.SetFocus;
  end
  else
    DBLookupComboBox24.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox90Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarOrigControle := TCheckBox(sender).Checked;
  DBEdit37.Visible := false;
  if ObRel.ListaOrigControlesPagRec(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox60.Enabled := true;
    DBLookupComboBox60.KeyValue := ObRel.dtSetOrigControlesPagRec.FieldByName('CODIGO_CTRL').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox60.CanFocus) then
	    DBLookupComboBox60.SetFocus;
  end
  else
    DBLookupComboBox60.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox91Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarOrigControle := TCheckBox(sender).Checked;
  DBEdit38.Visible := false;
  if ObRel.ListaOrigControlesPag(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox61.Enabled := true;
    DBLookupComboBox61.KeyValue := ObRel.dtSetOrigControlesPag.FieldByName('CODIGO_CTRL').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox61.CanFocus) then
	    DBLookupComboBox61.SetFocus;
  end
  else
    DBLookupComboBox61.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox92Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarPorTipo := TCheckBox(sender).Checked;
  if ObRel.FiltrarPorTipo then
	  ComboBox75.Enabled := true
  else
		ComboBox75.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox93Click(Sender: TObject);
var
  codcliente: string;
begin
  inherited;
  ObRel.FiltrarCliente := TCheckBox(sender).Checked;
  DBEdit40.Visible := false;
  try
    if ObRel.FiltrarCliente then
    begin
      Screen.Cursor := crHourGlass;
      codcliente := vDadosIni.pesquisaRapida('CLIENTES');
    end;
  finally
    Screen.Cursor := crDefault;
  end;

  if trim(codcliente) = '' then
  	TCheckBox(sender).Checked := False
  else
    if ObRel.ListaClientesRecCXL(TCheckBox(sender).Checked, codcliente) then
    begin
      DBLookupComboBox62.Enabled := true;
      DBLookupComboBox62.KeyValue := ObRel.dtSetClienteRecCXL.FieldByName('COD_CLIENTE').AsInteger;
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox62.CanFocus) then
        DBLookupComboBox62.SetFocus;
    end
    else
      DBLookupComboBox62.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox94Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarOrigControle := TCheckBox(sender).Checked;
  DBEdit41.Visible := false;
  if ObRel.ListaOrigControlesRecCXL(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox63.Enabled := true;
    DBLookupComboBox63.KeyValue := ObRel.dtSetOrigControlesRecCXL.FieldByName('CODIGO_CTRL').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox63.CanFocus) then
	    DBLookupComboBox63.SetFocus;
  end
  else
    DBLookupComboBox63.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox95Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarControle := TCheckBox(sender).Checked;
  DBEdit39.Visible := false;
  if ObRel.ListaControlesRecCXL(TCheckBox(sender).Checked) then
  begin
    DBLookupComboBox64.Enabled := true;
    DBLookupComboBox64.KeyValue := ObRel.dtSetControlesRecCXL.FieldByName('CODIGO_CTRL').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox64.CanFocus) then
	    DBLookupComboBox64.SetFocus;
  end
  else
    DBLookupComboBox64.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox96Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarVendedor := TCheckBox(sender).Checked;
//  DBEdit18.Visible := false;

  if ObRel.MontarListaParticipantes(
  	TCheckBox(sender).Checked,
    CheckListBox2) then
  begin
    Panel37.Height := 112;
    DBLookupComboBox29.Visible := false;
    CheckListBox2.Visible := true;
    btSelectAllVendSaidasBalcaoPart.Visible := true;
    btUnSelectAllVendSaidasBalcaoPart.Visible := true;
  end
  else
  begin
    Panel37.Height := 29;
    DBLookupComboBox29.Enabled := false;
    DBLookupComboBox29.Visible := true;
    CheckListBox2.Visible := false;
    btSelectAllVendSaidasBalcaoPart.Visible := false;
    btUnSelectAllVendSaidasBalcaoPart.Visible := false;
  end;
end;

procedure TfrmRelatorios.CheckBox97Click(Sender: TObject);
begin
  inherited;
 	ObRel.FiltrarTipoVenda := TCheckBox(sender).Checked;
  if ObRel.ListaTiposVenda('REQ', TCheckBox(sender).Checked, 0) then
  begin
    DBLookupComboBox66.Enabled := true;
    DBLookupComboBox66.KeyValue := ObRel.dtSetTipVenda.FieldByName('SIGLA').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox66.CanFocus) then
	    DBLookupComboBox66.SetFocus;
  end
  else
    DBLookupComboBox66.Enabled := false;
  CheckBox99.Enabled := not TCheckBox(sender).Checked;
  if TCheckBox(sender).Checked then
  begin
    CheckBox99.Checked := false;
    DBComboBox8.Enabled := false;
  end;
end;

procedure TfrmRelatorios.CheckBox98Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarVendedor := TCheckBox(sender).Checked;
//  Label2.Visible := not ObRel.FiltrarVendedor;
//  ComboBox2.Visible := not ObRel.FiltrarVendedor;
//  DBEdit7.Visible := ObRel.FiltrarVendedor;
//  DBEdit7.Enabled := false;
  if ObRel.MontarListaVendedores(
  	TCheckBox(sender).Checked,
    CheckListBox8) then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL064', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      Panel56.Height := 29;
      DBLookupComboBox67.Enabled := false;
      DBLookupComboBox67.Visible := true;
      CheckListBox8.Visible := false;
      btSelectAllVendSaidasVendAcrescVend.Visible := false;
      btUnSelectAllVendSaidasVendAcrescVend.Visible := false;
      DBLookupComboBox67.KeyValue := vDadosIni.vCodUsuario;
      exit;
    end;

    Panel56.Height := 112;
    DBLookupComboBox67.Visible := false;
    CheckListBox8.Visible := true;
    btSelectAllVendSaidasVendAcrescVend.Visible := true;
    btUnSelectAllVendSaidasVendAcrescVend.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (CheckListBox8.CanFocus) then
      CheckListBox8.SetFocus;
  end
  else
  begin
    Panel56.Height := 29;
    DBLookupComboBox67.Enabled := false;
    DBLookupComboBox67.Visible := true;
    CheckListBox8.Visible := false;
    btSelectAllVendSaidasVendAcrescVend.Visible := false;
    btUnSelectAllVendSaidasVendAcrescVend.Visible := false;
    DBLookupComboBox67.KeyValue := vDadosIni.vCodUsuario;
  end;
end;

procedure TfrmRelatorios.CheckBox99Click(Sender: TObject);
begin
  inherited;
	ObRel.FiltrarAreaExec := TCheckBox(sender).Checked;
  if ObRel.ListaAreaExec(DBComboBox8, TCheckBox(sender).Checked, 'OS') then
  begin
    DBComboBox8.Enabled := true;
    DBComboBox8.Text := ObRel.dtSetArea.FieldByName('AREA_EXEC').AsString;
    if (Self.Enabled) and (Self.Visible) and (DBComboBox8.CanFocus) then
	    DBComboBox8.SetFocus;
  end
  else
    DBComboBox8.Enabled := false;
end;

procedure TfrmRelatorios.CheckBox9Click(Sender: TObject);
begin
  inherited;
  ObRel.FiltrarTipoVenda:= TCheckBox(sender).Checked;
  ComboBox8.Enabled := TCheckBox(sender).Checked;
end;

procedure TfrmRelatorios.ckCartaoClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    ObRel.ListaCtrlTitulosRota(ckCartao.Checked, ckFinanc.Checked, ckBoleta.Checked, ckChequePre.Checked, ckOutros.Checked);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmRelatorios.ckConcessionariaClick(Sender: TObject);
begin
  ckEstoqueReal.Enabled := not (ckConcessionaria.Checked);
end;

procedure TfrmRelatorios.ckConsignado2Click(Sender: TObject);
begin
  ckEstoque2.Enabled := not (ckConsignado2.Checked);
  ckIntermediacao2.Enabled := not (ckConsignado2.Checked);
end;

procedure TfrmRelatorios.ckConsignado3Click(Sender: TObject);
begin
  ckEstoque3.Enabled := not (ckConsignado3.Checked);
  ckIntermediacao3.Enabled := not (ckConsignado3.Checked);
end;

procedure TfrmRelatorios.ckConsignadoClick(Sender: TObject);
begin
  ckEstoque.Enabled := not (ckConsignado.Checked);
  ckIntermediacao.Enabled := not (ckConsignado.Checked);
end;

procedure TfrmRelatorios.ckEstoque2Click(Sender: TObject);
begin
  ckConsignado2.Enabled := not (ckEstoque2.Checked);
  ckIntermediacao2.Enabled := not (ckEstoque2.Checked);
end;

procedure TfrmRelatorios.ckEstoque3Click(Sender: TObject);
begin
  ckConsignado3.Enabled := not (ckEstoque3.Checked);
  ckIntermediacao3.Enabled := not (ckEstoque3.Checked);
end;

procedure TfrmRelatorios.ckEstoqueClick(Sender: TObject);
begin
  ckConsignado.Enabled := not (ckEstoque.Checked);
  ckIntermediacao.Enabled := not (ckEstoque.Checked);
end;

procedure TfrmRelatorios.ckEstoqueRealClick(Sender: TObject);
begin
  ckConcessionaria.Enabled := not (ckEstoqueReal.Checked);
end;

procedure TfrmRelatorios.ckGerenteClick(Sender: TObject);
begin
  inherited;
  if ckGerente.Checked then
  	CheckBox46.Caption := 'Filtrar por Gerente:'
  else
  	CheckBox46.Caption := 'Filtrar por Vendedor:';
end;

procedure TfrmRelatorios.ckIntermediacao2Click(Sender: TObject);
begin
  ckEstoque2.Enabled := not (ckIntermediacao2.Checked);
  ckConsignado2.Enabled := not (ckIntermediacao2.Checked);
end;

procedure TfrmRelatorios.ckIntermediacao3Click(Sender: TObject);
begin
  ckEstoque3.Enabled := not (ckIntermediacao3.Checked);
  ckConsignado3.Enabled := not (ckIntermediacao3.Checked);
end;

procedure TfrmRelatorios.ckIntermediacaoClick(Sender: TObject);
begin
  ckEstoque.Enabled := not (ckIntermediacao.Checked);
  ckConsignado.Enabled := not (ckIntermediacao.Checked);
end;

procedure TfrmRelatorios.ComboBox23Exit(Sender: TObject);
begin
  inherited;
	Label94.Enabled    := ComboBox23.Items[ComboBox23.ItemIndex] = 'ANALÍTICO';
  ComboBox71.Enabled := ComboBox23.Items[ComboBox23.ItemIndex] = 'ANALÍTICO';
  Label100.Enabled   := ComboBox23.Items[ComboBox23.ItemIndex] = 'ANALÍTICO';
  ComboBox77.Enabled := ComboBox23.Items[ComboBox23.ItemIndex] = 'ANALÍTICO';
end;

procedure TfrmRelatorios.ComboBox33Exit(Sender: TObject);
begin
  inherited;
  if not (vDadosIni.vPedVnd.habPartipante) then
   exit;
   
  CheckBox65.Enabled := true;
  CheckBox66.Enabled := vDadosIni.vPedVnd.habPartipante;
  DBLookupComboBox40.Enabled := true;
  DBLookupComboBox41.Enabled := vDadosIni.vPedVnd.habPartipante;
  if ComboBox33.ItemIndex = 1 then
  begin
    CheckBox66.Enabled := false;
    DBLookupComboBox41.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (CheckBox65.CanFocus) then
      CheckBox65.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox40.CanFocus) then
      DBLookupComboBox40.SetFocus;
  end
  else if ComboBox33.ItemIndex = 2 then
  begin
    CheckBox65.Enabled := false;
    DBLookupComboBox40.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (CheckBox66.CanFocus) then
      CheckBox66.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox41.CanFocus) then
      DBLookupComboBox41.SetFocus;
  end
  else
  begin
    if (Self.Enabled) and (Self.Visible) and (CheckBox65.CanFocus) then
      CheckBox65.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox40.CanFocus) then
      DBLookupComboBox40.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (CheckBox66.CanFocus) then
      CheckBox66.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox41.CanFocus) then
      DBLookupComboBox41.SetFocus;
  end;
end;

procedure TfrmRelatorios.ComboBox3Exit(Sender: TObject);
begin
  inherited;
  if Trim(ComboBox3.Text) = 'SINTÉTICO' then
  begin
    Label9.Visible := true;
    Label10.Visible := true;
    Label11.Visible := true;
    EditHw1.Visible := true;
    EditHw2.Visible := true;
    EditHw3.Visible := true;
    Label12.Visible := false;
    ComboBox6.Visible := false;
  end
  else
  begin
    Label9.Visible := false;
    Label10.Visible := false;
    Label11.Visible := false;
    EditHw1.Visible := false;
    EditHw2.Visible := false;
    EditHw3.Visible := false;
    Label12.Visible := true;
    ComboBox6.Visible := true;
  end;
end;

procedure TfrmRelatorios.ComboBox47Exit(Sender: TObject);
begin
  inherited;
  if ComboBox47.Text = 'ANALÍTICO' then
  begin
    Label53.Visible := true;
    ComboBox50.Visible := true;
    Label110.Visible := ComboBox50.ItemIndex = 0;
    ComboBox87.Visible := ComboBox50.ItemIndex = 0;
    Label111.Visible := ComboBox50.ItemIndex = 0;
    ComboBox88.Visible := ComboBox50.ItemIndex = 0;
  end
  else
  begin
    Label53.Visible := false;
    ComboBox50.Visible := false;
    Label110.Visible := false;
    ComboBox87.Visible := false;
    Label111.Visible := false;
    ComboBox88.Visible := false;
  end;
end;

procedure TfrmRelatorios.ComboBox50Exit(Sender: TObject);
begin
  inherited;
	ComboBox47Exit(Sender);
end;

procedure TfrmRelatorios.ComboBox51Change(Sender: TObject);
begin
	Label56.Enabled := (ComboBox51.ItemIndex = 1);
  ComboBox53.Enabled := (ComboBox51.ItemIndex = 1);

  Label106.Enabled := (ComboBox51.ItemIndex = 1) and (ComboBox53.ItemIndex = 0);
  ComboBox83.Enabled := (ComboBox51.ItemIndex = 1) and (ComboBox53.ItemIndex = 0);

	if not ComboBox83.Enabled then
  	ComboBox83.ItemIndex := 1;
  if not ComboBox83.Enabled then
    ComboBox53.ItemIndex := 1;
end;

procedure TfrmRelatorios.ComboBox51Exit(Sender: TObject);
begin
	Label56.Enabled := (ComboBox51.ItemIndex = 1);
  ComboBox53.Enabled := (ComboBox51.ItemIndex = 1);

  Label106.Enabled := (ComboBox51.ItemIndex = 1) and (ComboBox53.ItemIndex = 0);
  ComboBox83.Enabled := (ComboBox51.ItemIndex = 1) and (ComboBox53.ItemIndex = 0);

	if not ComboBox83.Enabled then
  	ComboBox83.ItemIndex := 1;
  if not ComboBox83.Enabled then
    ComboBox53.ItemIndex := 1;
end;

procedure TfrmRelatorios.ComboBox53Change(Sender: TObject);
begin
	Label56.Enabled := (ComboBox51.ItemIndex = 1);
	ComboBox53.Enabled := (ComboBox51.ItemIndex = 1);

  Label106.Enabled := (ComboBox51.ItemIndex = 1) and (ComboBox53.ItemIndex = 0);
  ComboBox83.Enabled := (ComboBox51.ItemIndex = 1) and (ComboBox53.ItemIndex = 0);

	if not ComboBox83.Enabled then
  	ComboBox83.ItemIndex := 1;
  if not ComboBox83.Enabled then
    ComboBox53.ItemIndex := 1;
end;

procedure TfrmRelatorios.ComboBox53Exit(Sender: TObject);
begin
	Label56.Enabled := (ComboBox51.ItemIndex = 1);
	ComboBox53.Enabled := (ComboBox51.ItemIndex = 1);

  Label106.Enabled := (ComboBox51.ItemIndex = 1) and (ComboBox53.ItemIndex = 0);
  ComboBox83.Enabled := (ComboBox51.ItemIndex = 1) and (ComboBox53.ItemIndex = 0);

  if not ComboBox83.Enabled then
  	ComboBox83.ItemIndex := 1;
  if not ComboBox83.Enabled then
    ComboBox53.ItemIndex := 1;
end;

procedure TfrmRelatorios.ComboBox62Exit(Sender: TObject);
begin
  inherited;
  if ComboBox62.Text = 'ANALÍTICO' then
  begin
    Label87.Visible := true;
    ComboBox63.Visible := true;
  end
  else
  begin
    Label87.Visible := false;
    ComboBox63.Visible := false;
  end;
end;

procedure TfrmRelatorios.ComboBox64Exit(Sender: TObject);
begin
  inherited;
  Label93.Enabled    := ComboBox64.Items[ComboBox64.ItemIndex] = 'ANALÍTICO';
	ComboBox70.Enabled := ComboBox64.Items[ComboBox64.ItemIndex] = 'ANALÍTICO';
  Label99.Enabled    := ComboBox64.Items[ComboBox64.ItemIndex] = 'ANALÍTICO';
  ComboBox76.Enabled := ComboBox64.Items[ComboBox64.ItemIndex] = 'ANALÍTICO';
end;

procedure TfrmRelatorios.ComboBox66Exit(Sender: TObject);
begin
  inherited;
	Label95.Enabled    := ComboBox66.Items[ComboBox66.ItemIndex] = 'ANALÍTICO';
  ComboBox72.Enabled := ComboBox66.Items[ComboBox66.ItemIndex] = 'ANALÍTICO';
  Label101.Enabled   := ComboBox66.Items[ComboBox66.ItemIndex] = 'ANALÍTICO';
  ComboBox78.Enabled := ComboBox66.Items[ComboBox66.ItemIndex] = 'ANALÍTICO';
end;

procedure TfrmRelatorios.ComboBox73Exit(Sender: TObject);
begin
  inherited;
	Label98.Enabled    := ComboBox73.Items[ComboBox73.ItemIndex] = 'ANALÍTICO';
  ComboBox74.Enabled := ComboBox73.Items[ComboBox73.ItemIndex] = 'ANALÍTICO';
  Label102.Enabled   := ComboBox73.Items[ComboBox73.ItemIndex] = 'ANALÍTICO';
  ComboBox79.Enabled := ComboBox73.Items[ComboBox73.ItemIndex] = 'ANALÍTICO';
end;

procedure TfrmRelatorios.ComboBox80Exit(Sender: TObject);
begin
  inherited;
	if ComboBox80.ItemIndex = 0 then
  begin
  	Label104.Enabled := false;
    ComboBox81.Enabled := false;
    ComboBox81.ItemIndex := 0;
  end
  else if ComboBox80.ItemIndex = 1 then
  begin
    Label104.Enabled := false;
    ComboBox81.Enabled := false;
    ComboBox81.ItemIndex := 0;
  end
  else if ComboBox80.ItemIndex = 2 then
  begin
    Label104.Enabled := true;
    ComboBox81.Enabled := true;
    ComboBox81.ItemIndex := 1;
  end;
end;

procedure TfrmRelatorios.ComboBox82Change(Sender: TObject);
begin
  CheckBox11.Enabled := (ComboBox82.ItemIndex = 0) or (ComboBox82.ItemIndex = 1);
  if (not CheckBox11.Enabled) then
    CheckBox11.Checked := False;
end;

procedure TfrmRelatorios.ComboBox82Exit(Sender: TObject);
begin
  CheckBox11.Enabled := (ComboBox82.ItemIndex = 0) or (ComboBox82.ItemIndex = 1);
  if (not CheckBox11.Enabled) then
    CheckBox11.Checked := False;
end;

procedure TfrmRelatorios.ComboBox90Exit(Sender: TObject);
begin
  inherited;
  if ComboBox90.Text = 'ANALÍTICO' then
  begin
  	Label120.Visible := true;
    ComboBox97.Visible := true;
    Label115.Visible := true;
    ComboBox92.Visible := true;
    Label118.Visible := ComboBox92.ItemIndex = 0;
    ComboBox95.Visible := ComboBox92.ItemIndex = 0;
    Label119.Visible := ComboBox92.ItemIndex = 0;
    ComboBox96.Visible := ComboBox92.ItemIndex = 0;
  end
  else
  begin
  	Label120.Visible := false;
    ComboBox97.Visible := false;
    Label115.Visible := false;
    ComboBox92.Visible := false;
    Label118.Visible := false;
    ComboBox95.Visible := false;
    Label119.Visible := false;
    ComboBox96.Visible := false;
  end;
end;

procedure TfrmRelatorios.ComboBox92Exit(Sender: TObject);
begin
  inherited;
	ComboBox90Exit(Sender);
end;

procedure TfrmRelatorios.DBGrid2ColEnter(Sender: TObject);
begin
  inherited;
  if DBGrid2.SelectedField.FieldName = 'AFATURAR' then
    DBGrid2.Options := DBGrid2.Options + [dgEditing];
end;

procedure TfrmRelatorios.DBGrid2ColExit(Sender: TObject);
begin
  inherited;
  if DBGrid2.SelectedField.FieldName = 'AFATURAR' then
    DBGrid2.Options := DBGrid2.Options - [dgEditing];
end;

procedure TfrmRelatorios.DBGrid2TitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(DBGrid2, Column);
end;

procedure TfrmRelatorios.DBGrid3DrawColumnCell(Sender: TObject;
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
      Column.Field.DisplayWidth := 1;

    DBGrid3.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(DBGrid3.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TfrmRelatorios.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
    ObRel.marcaDesmarca(ObRel.dtSetCtrlTitRota);
end;

procedure TfrmRelatorios.DBLookupComboBox15Exit(Sender: TObject);
begin
  inherited;
  //  ObRel.NomeFuncao:=  trim(ObRel.dtSetFuncoes.FieldByName('DESC_FUNCAO').AsString);
end;

procedure TfrmRelatorios.DBLookupComboBox16CloseUp(Sender: TObject);
begin
  inherited;
  edmCFOP.Valor := ObRel.dtSetCFOP.FieldByName('CODIGO_NOP').AsFloat;
end;

procedure TfrmRelatorios.DBLookupComboBox16KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (key = VK_DOWN) or (key = VK_UP) then
    edmCFOP.Valor := ObRel.dtSetCFOP.FieldByName('CODIGO_NOP').AsFloat;
end;

procedure TfrmRelatorios.DBLookupComboBox16KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  edmCFOP.Valor := ObRel.dtSetCFOP.FieldByName('CODIGO_NOP').AsFloat;
end;

procedure TfrmRelatorios.DBLookupComboBox1Exit(Sender: TObject);
begin
  inherited;
  if pageRelatorios.ActivePage = tbsResumo then
  begin
    if pageResumo.ActivePage = tbsVendaBalcao then
    begin
//      DBEdit1.Visible := CheckBox13.Checked;
      DBEdit2.Visible := CheckBox12.Checked;
    end
    else if pageResumo.ActivePage = tbsVendaBalcaoPariticipante then
    begin
//    	DBEdit18.Visible := CheckBox54.Checked;
      DBEdit19.Visible := CheckBox53.Checked;
    end
    else if pageResumo.ActivePage = tbsVendaOficina then
    begin
//      DBEdit3.Visible := CheckBox16.Checked;
      DBEdit4.Visible := CheckBox15.Checked;
    end
    else if pageResumo.ActivePage = tbsVendaGeral then
    begin
//      DBEdit5.Visible := CheckBox19.Checked;
      DBEdit6.Visible := CheckBox18.Checked;
    end
    else if pageResumo.ActivePage = tbsVendaVendedor then
    begin
//    	DBEdit7.Visible := CheckBox23.Checked
    end
    else if pageResumo.ActivePage = tbsVendaVendedorComissaoFaixaDesc then
    begin
//    	DBEdit30.Visible := CheckBox75.Checked
    end
    else if pageResumo.ActivePage = tbsComissaoRecebimento then
    begin
//      DBEdit8.Visible := CheckBox22.Checked;
    	DBEdit29.Visible := CheckBox74.Checked;
    end
    else if pageResumo.ActivePage = tbsPagamentoFinanceiro then
    begin
    	DBEdit31.Visible := CheckBox81.Checked;
      DBEdit38.Visible := CheckBox91.Checked;
      DBEdit32.Visible := CheckBox80.Checked;
    end
    else if pageResumo.ActivePage = tbsRecebimentoFinanceiro then
    begin
			DBEdit20.Visible := CheckBox56.Checked;
      DBEdit36.Visible := CheckBox89.Checked;
      DBEdit33.Visible := CheckBox62.Checked;
    end
    else if pageResumo.ActivePage = tbsPagamentoRecebimentoFinanceiro then
    begin
    	DBEdit34.Visible := CheckBox88.Checked;
      DBEdit37.Visible := CheckBox90.Checked;
      DBEdit35.Visible := CheckBox87.Checked;
    end
    else if pageResumo.ActivePage = tbsRecebimentoCaixaAuxiliar then
    begin
    	DBEdit40.Visible := CheckBox93.Checked;
      DBEdit41.Visible := CheckBox94.Checked;
      DBEdit39.Visible := CheckBox95.Checked;
    end;
  end
  else if pageRelatorios.ActivePage = tbsGerenciais then
  begin
    if pageGerenciais.ActivePage = tbsNotasEmitidasPorPeriodo then
      edmCFOP.Valor := ObRel.dtSetCFOP.FieldByName('CODIGO_NOP').AsFloat
    else if pageGerenciais.ActivePage = tbsRequisicoesEmitidasPorPeriodo then
    begin
      DBEdit9.Visible := CheckBox31.Checked;
      DBEdit25.Visible := CheckBox67.Checked;
    end
    else if pageGerenciais.ActivePage = tbsOrdensDeServicosEmitidasPorPeriodo then
    begin
      DBEdit15.Visible := CheckBox45.Checked;
      DBEdit26.Visible := CheckBox68.Checked;
    end
    else if pageGerenciais.ActivePage = tbsRequisicoesOrdemServicoEmitidasPorPeriodo then
    begin
      DBEdit27.Visible := CheckBox70.Checked;
      DBEdit28.Visible := CheckBox72.Checked;
    end
    else if pageGerenciais.ActivePage = tbsRelatoriosdeVendasPlacaCliente then
    begin
      DBEdit10.Visible := CheckBox32.Checked;
    end
    else if pageGerenciais.ActivePage = tbsRelatoriodeVendasObjetoCliente then
    begin
      DBEdit11.Visible := CheckBox1.Checked;
      DBEdit12.Visible := CheckBox5.Checked;
    end
    else if pageGerenciais.ActivePage = tbsRelatorioVeiculosNegociados then
      DBEdit13.Visible := CheckBox8.Checked
    else if pageGerenciais.ActivePage = tsbRelatorioSituacaodoEstoqueFechado then
      DBEdit14.Visible := CheckBox44.Checked
    else if pageGerenciais.ActivePage = tbsRelatorioFaturamentodeVeiculos then
    	DBEdit16.Visible := CheckBox46.Checked
    else if pageGerenciais.ActivePage = tbsRelatorioPendenciasdeVeiculos then
	    DBEdit17.Visible := CheckBox47.Checked
    else if pageGerenciais.ActivePage = tbsRelatorioContratoContaCorrente then
	    DBEdit21.Visible := CheckBox63.Checked
    else if pageGerenciais.ActivePage = tbsRelatorioVendasRecProgFid then
	    DBEdit22.Visible := CheckBox64.Checked
    else if pageGerenciais.ActivePage = tbsRelatorioComissaoPorVenda then
    begin
      DBEdit23.Visible := CheckBox65.Checked;
      DBEdit24.Visible := CheckBox66.Checked;
    end;
  end;
end;

procedure TfrmRelatorios.DBLookupComboBox20KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  codcli: string;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      codcli := vDadosIni.pesquisaRapida('CLIENTES');
      if codcli <> '' then
        TDBLookupComboBox(sender).KeyValue := strtoint(codcli);
      if ObRel.ListaClientes(CheckBox32.Checked, codcli) then
      begin
        DBLookupComboBox20.Enabled := true;
        DBLookupComboBox20.KeyValue := ObRel.dtSetCliente.FieldByName('COD_CLIENTE').AsInteger;
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox20.CanFocus) then
	        DBLookupComboBox20.SetFocus;
      end
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmRelatorios.DBLookupComboBox22KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  codcli: string;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      codcli := vDadosIni.pesquisaRapida('CLIENTES');
      if codcli <> '' then
        TDBLookupComboBox(sender).KeyValue := strtoint(codcli);
      if ObRel.ListaClientes(CheckBox1.Checked, codcli) then
      begin
        DBLookupComboBox22.Enabled := true;
        DBLookupComboBox22.KeyValue := ObRel.dtSetCliente.FieldByName('COD_CLIENTE').AsInteger;
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox22.CanFocus) then
	        DBLookupComboBox22.SetFocus;
      end
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmRelatorios.DBLookupComboBox23KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  codobj: string;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      codobj := vDadosIni.pesquisaRapida('EQUIPAMENTO', ' AND EQUIPAMENTO.TIP_EQUIP = ''E'' ', '');
      if codobj <> '' then
        DBLookupComboBox23.KeyValue := strtoint(codobj);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmRelatorios.DBLookupComboBox2Exit(Sender: TObject);
begin
  inherited;
  if pageResumo.ActivePage = tbsVendaBalcao then
    DBEdit2.Visible := true
  else if pageResumo.ActivePage = tbsVendaOficina then
    DBEdit4.Visible := true
  else if pageResumo.ActivePage = tbsVendaGeral then
    DBEdit6.Visible := true
  else if pageResumo.ActivePage = tbsVendaBalcaoPariticipante then
  	DBEdit19.Visible := true;
end;

procedure TfrmRelatorios.DBLookupComboBox32KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  codcli: string;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      codcli := vDadosIni.pesquisaRapida('CLIENTES');
      if codcli <> '' then
        TDBLookupComboBox(sender).KeyValue := strtoint(codcli);
      if ObRel.ListaClientesRec(CheckBox56.Checked, codcli) then
      begin
        DBLookupComboBox32.Enabled := true;
        DBLookupComboBox32.KeyValue := ObRel.dtSetClienteRec.FieldByName('COD_CLIENTE').AsInteger;
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox32.CanFocus) then
	        DBLookupComboBox32.SetFocus;
      end
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmRelatorios.DBLookupComboBox37KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  codcli: string;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      codcli := vDadosIni.pesquisaRapida('CLIENTES');
      if codcli <> '' then
        TDBLookupComboBox(sender).KeyValue := strtoint(codcli);
      if ObRel.ListaClientes(CheckBox63.Checked, codcli) then
      begin
        DBLookupComboBox37.Enabled := true;
        DBLookupComboBox37.KeyValue := ObRel.dtSetCliente.FieldByName('COD_CLIENTE').AsInteger;
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox37.CanFocus) then
	        DBLookupComboBox37.SetFocus;
      end
    finally
      Screen.Cursor := crDefault;
    end;
  end;	
end;

procedure TfrmRelatorios.DBLookupComboBox43KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  codcli: string;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      codcli := vDadosIni.pesquisaRapida('CLIENTES');
      if codcli <> '' then
        TDBLookupComboBox(sender).KeyValue := strtoint(codcli);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmRelatorios.DBLookupComboBox46KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  codcli: string;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      codcli := vDadosIni.pesquisaRapida('CLIENTES');
      if codcli <> '' then
        TDBLookupComboBox(sender).KeyValue := strtoint(codcli);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmRelatorios.DBLookupComboBox53KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  codcli: string;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      codcli := vDadosIni.pesquisaRapida('CLIENTES');
      if codcli <> '' then
        TDBLookupComboBox(sender).KeyValue := strtoint(codcli);
      if ObRel.ListaClientesPag(CheckBox81.Checked, codcli) then
      begin
        DBLookupComboBox53.Enabled := true;
        DBLookupComboBox53.KeyValue := ObRel.dtSetClientePag.FieldByName('COD_CLIENTE').AsInteger;
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox53.CanFocus) then
	        DBLookupComboBox53.SetFocus;
      end
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmRelatorios.DBLookupComboBox58KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  codcli: string;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      codcli := vDadosIni.pesquisaRapida('CLIENTES');
      if codcli <> '' then
        TDBLookupComboBox(sender).KeyValue := strtoint(codcli);
      if ObRel.ListaClientesPagRec(CheckBox88.Checked, codcli) then
      begin
        DBLookupComboBox58.Enabled := true;
        DBLookupComboBox58.KeyValue := ObRel.dtSetClientePagRec.FieldByName('COD_CLIENTE').AsInteger;
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox58.CanFocus) then
	        DBLookupComboBox58.SetFocus;
      end
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmRelatorios.edCodigoEmpUnificada2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
    key := #0;
end;

procedure TfrmRelatorios.edCodigoEmpUnificadaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
    key := #0;
end;

procedure TfrmRelatorios.edmCFOPExit(Sender: TObject);
begin
  inherited;
  DBLookupComboBox16.KeyValue := edmCFOP.Valor;
end;

procedure TfrmRelatorios.escreverComentario(vtab: TTabSheet);
begin
  MemoComentario.Clear;
  if vtab.Name = tbsVendaBalcao.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe os totais das saídas realizadas no balcão (Requisição)');
    MemoComentario.Lines.Add('Tipo de Relatório: No modo analítico é exibido os produtos utilizados em cada saída');
    MemoComentario.Lines.Add('Filtrar Requisições por tipo: Por padrão exibe os produtos das requisições definidas como venda ou caso queira filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar por Vendedor: Filtrar por colaborador específico');
    MemoComentario.Lines.Add('Filtrar por Grupo: Filtrar por grupo de produto específico');
    MemoComentario.Lines.Add('Com Total por Produto: Exibir totais dos produtos por código');
    MemoComentario.Lines.Add('Com Total por Grupo: Exibir totais dos produtos por grupo');
  end
  else if vtab.Name = tbsVendaBalcaoPariticipante.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe os totais das saídas realizadas no balcão (Requisição)');
    MemoComentario.Lines.Add('Tipo de Relatório: No modo analítico é exibido os produtos utilizados em cada saída');
    MemoComentario.Lines.Add('Filtrar Requisições por tipo: Por padrão exibe os produtos das requisições definidas como venda ou caso queira filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar por Participante: Filtrar por partipante específico');
    MemoComentario.Lines.Add('Filtrar por Grupo: Filtrar por grupo de produto específico');
    MemoComentario.Lines.Add('Com Total por Produto: Exibir totais dos produtos por código');
    MemoComentario.Lines.Add('Com Total por Grupo: Exibir totais dos produtos por grupo');
  end
  else if vtab.Name = tbsVendaOficina.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe os totais das saídas realizadas na oficina (Ordem de Serviço)');
    MemoComentario.Lines.Add('Tipo de Relatório: No modo analítico é exibido os produtos utilizados em cada saída');
    MemoComentario.Lines.Add('Filtrar OS por tipo: Por padrão exibe os produtos das ordens de serviço definidas como venda ou caso queira filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar por Vendedor: Filtrar por colaborador específico');
    MemoComentario.Lines.Add('Filtrar por Grupo: Filtrar por grupo de produto específico');
    MemoComentario.Lines.Add('Filtrar por Area de Exec: Filtrar por area de execução específico (Local onde o serviço foi realizado)');
    MemoComentario.Lines.Add('Com Total por Produto: Exibir totais dos produtos por código');
    MemoComentario.Lines.Add('Com Total por Grupo: Exibir totais dos produtos por grupo');
  end
  else if vtab.Name = tbsVendaGeral.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe os totais das saídas (Requisição, Ordem de Serviço) e devoluções');
    MemoComentario.Lines.Add('Tipo de Relatório: No modo analítico é exibido os produtos utilizados em cada saída ordernados por tipo (Requisição, Ordem de Serviço e Devolução)');
    MemoComentario.Lines.Add('Filtrar Requisições por tipo: Por padrão exibe os produtos das requisições definidas como venda ou caso queira filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar OS por tipo: Por padrão exibe os produtos das ordens de serviço definidas como venda ou caso queira filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar por Vendedor: Filtrar por colaborador específico');
    MemoComentario.Lines.Add('Filtrar por Grupo: Filtrar por grupo de produto específico');
    MemoComentario.Lines.Add('Filtrar por Area de Exec: Filtrar por area de execução específico (Local onde o serviço foi realizado)');
    MemoComentario.Lines.Add('Com Total por Produto: Exibir totais dos produtos por código');
    MemoComentario.Lines.Add('Com Total por Grupo: Exibir totais dos produtos por grupo');
  end
  else if (vtab.Name = tbsVendaVendedor.Name) or (vtab.Name = tbsVendaVendedorAcrescCondPagVend.Name) then
  begin
    MemoComentario.Lines.Add('O relatório exibe os totais de cada colaborador das saídas (Requisição, Ordem de Serviço) e devoluções');
    MemoComentario.Lines.Add('Tipo de Relatório: No modo analítico dentro de cada colaborador é exibido as saídas e devoluções realizadas');
    MemoComentario.Lines.Add('Filtrar Requisições por tipo: Por padrão exibe os produtos das requisições definidas como venda ou caso queira filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar OS por tipo: Por padrão exibe os produtos das ordens de serviço definidas como venda ou caso queira filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar por Vendedor: Filtrar por colaborador específico');
    MemoComentario.Lines.Add('Filtrar por Area de Exec: Filtrar por area de execução específico (Local onde o serviço foi realizado)');
    MemoComentario.Lines.Add('Total P/M.O: Exibe o total dos serviços realizados');
    MemoComentario.Lines.Add('Vendedores Comissionados sem vendas: Exibir colaboradores sem saídas realizadas com percentuais de venda de serviço e produto definidos');
    MemoComentario.Lines.Add('Listar Produtos: Caso informe "SIM", no modo analítico é exibido os produtos utilizados em cada operação');
    MemoComentario.Lines.Add('Agrupamento descrição padrão serviço: Agrupar serviços realizados por tipo de serviço');
    MemoComentario.Lines.Add('Observação: ');
    MemoComentario.Lines.Add('Exibe apenas as informações dos colaboradores com percentuais de venda de serviço e produto definidos');
  end
  else if vtab.Name = tbsVendaVendedorComissaoFaixaDesc.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe os totais de cada colaborador das saídas (Requisição, Ordem de Serviço) e devoluções');
    MemoComentario.Lines.Add('Tipo de Relatório: No modo analítico dentro de cada colaborador é exibido as saídas e devoluções realizadas');
    MemoComentario.Lines.Add('Filtrar Requisições por tipo: Por padrão exibe os produtos das requisições definidas como venda ou caso queira filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar OS por tipo: Por padrão exibe os produtos das ordens de serviço definidas como venda ou caso queira filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar por Vendedor: Filtrar por colaborador específico');
    MemoComentario.Lines.Add('Filtrar por Area de Exec: Filtrar por area de execução específico (Local onde o serviço foi realizado)');
//    MemoComentario.Lines.Add('Total P/M.O: Exibe o total dos serviços realizados');
//    MemoComentario.Lines.Add('Vendedores Comissionados sem vendas: Exibir colaboradores sem saídas realizadas com percentuais de venda de serviço e produto definidos');
    MemoComentario.Lines.Add('Listar Produtos: Caso informe "SIM", no modo analítico é exibido os produtos utilizados em cada operação');
//    MemoComentario.Lines.Add('Agrupamento descrição padrão serviço: Agrupar serviços realizados por tipo de serviço');
    MemoComentario.Lines.Add('Observação: ');
    MemoComentario.Lines.Add('Exibe comissões somente sobre os descontos aplicados nos produtos das saídas (Requisições, Ordem de Serviço) e devoluções');
    MemoComentario.Lines.Add('Exibe as comissões definidas no cadastro de comissão por faixa de desconto');
  end
  else if vtab.Name = tbsComprasPorPeriodo.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe os totais de custo das notas de entradas realizadas por período');
    MemoComentario.Lines.Add('Tipo de Relatório: No modo analítico exibe cada nota de entrada por ordem de data de emissão');
    MemoComentario.Lines.Add('Listar Produtos: Exibe as mercadórias de cada nota de entrada');
    MemoComentario.Lines.Add('Agrupar por Fornecedor: Agrupar as notas de entrada por fornecedor');
    MemoComentario.Lines.Add('Com Grade: Exibe as grades e quantidades de cada nota de entrada');
    MemoComentario.Lines.Add('Observação: ');
    MemoComentario.Lines.Add('Exibe somente as informações das notas de entradas onde cfop esta definido para mostrar no relatório de compras ');
  end
  else if vtab.Name = tbsEstoque.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe o total do estoque por data de referência');
  end
  else if vtab.Name = tbsComissaoRecebimento.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe os recebimentos à vista, créditos e cheques');
    MemoComentario.Lines.Add('Filtrar por Vendedor: Filtrar por colaborador específico');
  end
  else if vtab.Name = tbsFinVendaModalidadePag.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe por controle o total das vendas recebidas e suas formas de recebimentos');
    MemoComentario.Lines.Add('Atenção:');
    MemoComentario.Lines.Add('Não apresenta os totais dos controles configurados para não exibir em relatórios financeiro');
    MemoComentario.Lines.Add('Apresenta 	 somente os totais dos recebimentos realizados antes do processamento do financeiro');
  end
  else if vtab.Name = tbsFinVendaVendedorComissaoServ.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe total das comissões dos serviços realizados pela oficina (Ordem de Serviço)');
    MemoComentario.Lines.Add('Filtrar OS por tipo: Filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Função do Colaborador: Filtrar colaboradores por função específica');
//    MemoComentario.Lines.Add('Exibir ORC convertido em DAV:');
    MemoComentario.Lines.Add('Filtrar por Area de Exec: Filtrar por area de execução específico (Local onde o serviço foi realizado)');
  end
  else if vtab.Name = tbsRecebimentoFinanceiro.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe o total diário dos recebimentos realizados pelo financeiro através das saídas (Requisição, Ordem de Serviço e Comando de Faturamento), recibos antecipados e crediário (Créditos e Cheques)');
    MemoComentario.Lines.Add('Tipo de Relatório: No modo analítico é exibido as saídas, recibos antecipado, devoluções e suas formas de recebimento');
    MemoComentario.Lines.Add('Filtrar por Venda (SIM ou NÃO): Filtrar por saídas definidas como venda ou não');
    MemoComentario.Lines.Add('Filtrar Requisições por tipo: Por padrão exibe as requisições definidas como venda ou caso queira filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar OS por tipo: Por padrão exibe as ordens de serviço definidas como venda ou caso queira filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar Vendas Veículos por tipo: Por padrão exibe as saídas de veículos definidas como venda ou caso queira filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar por Cliente: Filtrar por cliente específico');
    MemoComentario.Lines.Add('Filtrar por Origem Controle: Filtrar por controle de origem específico');
    MemoComentario.Lines.Add('Filtrar por Tipo: Filtrar por sáidas/vendas, recibo antecipado e crédito/cheque');
    MemoComentario.Lines.Add('Filtrar por Controle: Filtrar por controle específico');
    MemoComentario.Lines.Add('Filtrar por: Filtrar por quitados, não quitados ou ambos');
    MemoComentario.Lines.Add('Exibir detalhes pagamento/recebimento: Sim ou Não');
    MemoComentario.Lines.Add('Exibir totais por controle: Sim ou Não');
    if vDadosIni.vEmp.vFinanceiroUnificado then
    begin
      MemoComentario.Lines.Add('Código Empresa Unificada (0 - TODAS): Filtrar por código da empresa unificada específica');
      MemoComentario.Lines.Add('Agrupar Empresas Unificadas: Agrupar empresas unificadas ou não agrupar');
    end;
  end
  else if vtab.Name = tbsPagamentoFinanceiro.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe o total diário dos pagamentos realizados pelo financeiro');
    MemoComentario.Lines.Add('Tipo de Relatório: No modo analítico é exibido as contas');
    MemoComentario.Lines.Add('Filtrar por Cliente: Filtrar por cliente específico');
    MemoComentario.Lines.Add('Filtrar por Origem Controle: Filtrar por controle de origem específico');
    MemoComentario.Lines.Add('Filtrar por Controle: Filtrar por controle específico');
    MemoComentario.Lines.Add('Filtrar por: Filtrar por quitados, não quitados ou ambos');
    MemoComentario.Lines.Add('Exibir detalhes pagamento/recebimento: Sim ou Não');
    MemoComentario.Lines.Add('Exibir totais por controle: Sim ou Não');
    if vDadosIni.vEmp.vFinanceiroUnificado then
    begin
      MemoComentario.Lines.Add('Código Empresa Unificada (0 - TODAS): Filtrar por código da empresa unificada específica');
      MemoComentario.Lines.Add('Agrupar Empresas Unificadas: Agrupar empresas unificadas ou não agrupar');
    end;
  end
  else if vtab.Name = tbsPagamentoRecebimentoFinanceiro.Name then
  begin
  	MemoComentario.Lines.Add('O relatório exibe o total diário dos pagamentos e recebimentos realizados pelo financeiro através das saídas (Requisição, Ordem de Serviço e Comando de Faturamento), recibos antecipados e crediário (Créditos e Cheques)');
    MemoComentario.Lines.Add('Tipo de Relatório: No modo analítico é exibido as contas a pagar, saídas, recibos antecipado, devoluções e suas formas de recebimento');
    MemoComentario.Lines.Add('Filtrar por Venda (SIM ou NÃO): Filtrar por saídas definidas como venda ou não');
    MemoComentario.Lines.Add('Filtrar Requisições por tipo: Por padrão exibe as requisições definidas como venda ou caso queira filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar OS por tipo: Por padrão exibe as ordens de serviço definidas como venda ou caso queira filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar Vendas Veículos por tipo: Por padrão exibe as saídas de veículos definidas como venda ou caso queira filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar por Cliente: Filtrar por cliente específico');
    MemoComentario.Lines.Add('Filtrar por Origem Controle: Filtrar por controle de origem específico');
    MemoComentario.Lines.Add('Filtrar por Tipo: Filtrar por contas a pagar, sáidas/vendas, recibo antecipado e crédito/cheque');
    MemoComentario.Lines.Add('Filtrar por Controle: Filtrar por controle específico');
    MemoComentario.Lines.Add('Filtrar por: Filtrar por quitados, não quitados ou ambos');
    MemoComentario.Lines.Add('Exibir detalhes pagamento/recebimento: Sim ou Não');
    MemoComentario.Lines.Add('Exibir totais por controle: Sim ou Não');
    if vDadosIni.vEmp.vFinanceiroUnificado then
    begin
      MemoComentario.Lines.Add('Código Empresa Unificada (0 - TODAS): Filtrar por código da empresa unificada específica');
      MemoComentario.Lines.Add('Agrupar Empresas Unificadas: Agrupar empresas unificadas ou não agrupar');
    end;
  end
  else if vtab.Name = tbsRecebimentoCaixaAuxiliar.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe o total dos recebimentos realizados por cada operador do caixa auxiliar');
    MemoComentario.Lines.Add('Tipo de Relatório: No modo analítico exibe cada documento (Requisição, Ordem de Serviço, Comando de Faturamento, Recibos Antecipados, Lançamentos Avulsos e Prestações) recebido por operador');
    MemoComentario.Lines.Add('Código Operador CXL: Filtrar por operador do caixa auxiliar específico');
    MemoComentario.Lines.Add('Filtrar por Cliente: Filtrar por cliente específico');
    MemoComentario.Lines.Add('Filtrar por Origem Controle: Filtrar por controle de origem específico');
    MemoComentario.Lines.Add('Filtrar por Tipo: Filtrar por veículos, ecommerce, balcão, serviços, recibo antecipado, lançamento avulso e prestações');
    MemoComentario.Lines.Add('Filtrar por Controle: Filtrar por controle específico');
    MemoComentario.Lines.Add('Exibir detalhes pagamento/recebimento: Sim ou Não');
    MemoComentario.Lines.Add('Exibir totais por controle: Sim ou Não');
    if vDadosIni.vEmp.vFinanceiroUnificado then
    begin
      MemoComentario.Lines.Add('Código Empresa Unificada (0 - TODAS): Filtrar por código da empresa unificada específica');
      MemoComentario.Lines.Add('Agrupar Empresas Unificadas: Agrupar empresas unificadas ou não agrupar');
    end;
  end
  else if vtab.Name = tbsNotasEmitidasPorPeriodo.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe as notas fiscais emitidas por período');
    MemoComentario.Lines.Add('Filtrar por CFOP: Filtrar por CFOP específico');
    MemoComentario.Lines.Add('Filtrar por Tipo NF: Filtrar por tipo de nota fiscal (PRODUTOS/SERVICOS, VEICULOS, OUTRAS NOTAS e DESPESAS)');
    MemoComentario.Lines.Add('Observação:');
    MemoComentario.Lines.Add('Exibe somente as informações das notas fiscais de entrada e saída definidas como emissão própria');
  end
  else if vtab.Name = tbsProdutosComPendenciasEmOSREQ.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe as mercadorias pendentes em requisição, ordem de serviço, produção e estoque fechado');
    MemoComentario.Lines.Add('Observação:');
    MemoComentario.Lines.Add('Exibe somente as informações das mercadorias com documentos em aberto');
  end
  else if vtab.Name = tbsRequisicoesEmitidasPorPeriodo.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe as saídas realizadas no balcão (Requisição) agrupadas por data de abertura');
    MemoComentario.Lines.Add('Situação da Requisição: Filtrar por situação da saída (Aberta, Fechada ou Ambas)');
    MemoComentario.Lines.Add('Filtrar Condição Pagamento: Filtrar por condição de pagamento específica');
    MemoComentario.Lines.Add('Filtrar Requisições por Tipo: Filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar por Cliente: Filtrar por cliente específico');
    MemoComentario.Lines.Add('Observação:');
    MemoComentario.Lines.Add('Caso consulte as saídas em aberto também será considerado as requisições que fecharam após o período informado');
  end
  else if vtab.Name = tbsOrdensDeServicosEmitidasPorPeriodo.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe as saídas realizadas na oficina (Ordem de Serviço) agrupadas por data de abertura');
    MemoComentario.Lines.Add('Situação da REQ/OS: Filtrar por situação da saída (Aberta, Fechada ou Ambas situações)');
    MemoComentario.Lines.Add('Filtrar Condição Pagamento: Filtrar por condição de pagamento específica');
    MemoComentario.Lines.Add('Filtrar OS por Tipo: Filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar por Area de Exec: Filtrar por area de execução específico (Local onde o serviço foi realizado)');
    MemoComentario.Lines.Add('Filtrar por Cliente: Filtrar por cliente específico');
    MemoComentario.Lines.Add('Observação:');
    MemoComentario.Lines.Add('Caso consulte as saídas em aberto também será considerado as ordens de serviço que fecharam após o período informado');
  end
  else if vtab.Name = tbsRequisicoesOrdemServicoEmitidasPorPeriodo.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe as saídas realizadas no balcão e oficina (Requisições e Ordem de Serviço) agrupadas por data de abertura');
    MemoComentario.Lines.Add('Situação da Ordem de Serviço: Filtrar por situação da saída (Aberta, Fechada ou Ambas situações)');
    MemoComentario.Lines.Add('Filtrar Condição Pagamento: Filtrar por condição de pagamento específica');
    MemoComentario.Lines.Add('Filtrar Requisições por Tipo: Filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar OS por Tipo: Filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Filtrar por Cliente: Filtrar por cliente específico');
    MemoComentario.Lines.Add('Filtrar por Area de Exec: Filtrar por area de execução específico (Local onde o serviço foi realizado)');
    MemoComentario.Lines.Add('Exibir Itens: Exibir itens das saídas ou não exibir');
    MemoComentario.Lines.Add('Exibir Crediário: Exibir crediário em aberto');
    MemoComentario.Lines.Add('Observação:');
    MemoComentario.Lines.Add('Caso consulte as saídas em aberto também será considerado as ordens de serviço que fecharam após o período informado');
  end
  else if vtab.Name = tbsRecibosEmitidos.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe os recibos emitidos por período');
    MemoComentario.Lines.Add('Tipo: Filtrar por recibos confirmados (recibos utilizados) ou não confirmados (recibos não utilizados)');
    MemoComentario.Lines.Add('Departamento: Filtrar por departamento do recibo específico');
    MemoComentario.Lines.Add('Observação');
    MemoComentario.Lines.Add('Caso informe recibos confirmados, a consulta será realizada por data da baixa do recibo');
    MemoComentario.Lines.Add('Caso informe recibos não confirmados, a consulta será realizada por data de cadastro do recibo');
  end
  else if vtab.Name = tbsInventarioRec.Name then
  begin
    MemoComentario.Lines.Add('O inventário exibe os recibos por data de referência');
    MemoComentario.Lines.Add('Departamento: Filtrar por departamento do recibo específico');
  end
  else if vtab.Name = tbsHistoricoRecibos.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe os recibos baixados (Recibos utilizados na quitação de algum documento)');
    MemoComentario.Lines.Add('Departamento: Filtrar por departamento do recibo específico');
  end
  else if vtab.Name = tbsListaDeAlteracaoDePreco.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe as mercadorias que tiveram alteração');
    MemoComentario.Lines.Add('Opção para lista de preços: Listar mercadorias alteradas atrávés da edição no cadastro do produto ou através da entrada de nota');
  end
  else if vtab.Name = tbsRelatoriosdeVendasPlacaCliente.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe as saidas (Requisição e Ordem de Serviço) e orçamentos, e dentro de cada saída e orçamento é exibido os itens de produtos e serviços');
    MemoComentario.Lines.Add('Exibir Vendas Balcão: Exibir saídas realizadas no balcão (Requisição)');
    MemoComentario.Lines.Add('Exibir Vendas OS: Exibir saídas realizadas na oficina (Ordem de Serviço)');
    MemoComentario.Lines.Add('Exibir Apenas DAVs ORC: Exibir orçamento convertidos em venda');
    MemoComentario.Lines.Add('Situação da Requisição/OS: Filtrar por documentos (Aberto, Fechado ou Ambos)');
    MemoComentario.Lines.Add('Filtrar por Cliente: Filtrar por cliente específico');
    MemoComentario.Lines.Add('Filtrar por data: Filtrar por data inicial e final informada');
    MemoComentario.Lines.Add('Filtrar por placa: Filtrar por placa específica');
  end
  else if vtab.Name = tbsRelatoriodeVendasObjetoCliente.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe as saídas (Requisição e Ordem de Serviço), e dentro de cada saída é exibido os itens de produtos e serviços');
    MemoComentario.Lines.Add('Exibir Vendas Balcão: Exibir saídas realizadas no balcão (Requisição)');
    MemoComentario.Lines.Add('Exibir Vendas OS: Exibir saídas realizadas na oficina (Ordem de Serviço)');
    MemoComentario.Lines.Add('Situação da Requisição/OS: Filtrar por documentos (Aberto, Fechado ou Ambos)');
    MemoComentario.Lines.Add('Filtrar por Cliente: Filtrar por cliente específico');
    MemoComentario.Lines.Add('Filtrar por data: Filtrar por data inicial e final informada');
    MemoComentario.Lines.Add('Filtrar por objeto: Filtrar por objeto específico');
  end
  else if vtab.Name = tbsRelatorioApuracaoICMS.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe a relação da apuração do icms dos documentos fiscais de entradas e saídas dentro do estado, fora do estado, do exterior e por cfop.');
    MemoComentario.Lines.Add('Tipo de Relatório: No modo sintético é exibido apenas os total apurado por cfop e estado, no modo entrada ou saída é listado cada documento fiscal');
  end
  else if vtab.Name = tbsRelatorioVeiculosNegociados.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe a relação dos veículos negociados no período informado');
    MemoComentario.Lines.Add('Tipo de Venda: Filtrar por tipo de venda específico');
    MemoComentario.Lines.Add('Tipo de Veículo: Filtrar por situação do veículo (Novo ou Usado');
    MemoComentario.Lines.Add('Filtrar por Vendedor: Filtrar por colaborador específico');
    MemoComentario.Lines.Add('Departamento: Filtrar por departamento do recibo específico');
    MemoComentario.Lines.Add('Observação');
    MemoComentario.Lines.Add('Apenas as operações onde o cfop esta configurado como faturamento');
  end
  else if vtab.Name = tbsRelatorioVeiculosemDemonstracao.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe a relação dos veículos em demonstração no período informado');
    MemoComentario.Lines.Add('Tipo de Relatório: Filtrar por veículo em demonstraçao não faturados (veículos no estoque), e por faturados (veículos já vendidos)');
    MemoComentario.Lines.Add('Tipo de Venda: Filtrar por tipo de venda específico');
  end
  else if vtab.Name = tbsRelatorioAcompanhamentodeVeiculo.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe a relação dos veículos com nota fiscal em transito no período informado');
  end
  else if vtab.Name = tbsRelatorioPosicaodeEstoqueVeiculos.Name then
  begin
    MemoComentario.Lines.Add('O relatório lista todos os modelos de veículo definidos como venda estoque');
    MemoComentario.Lines.Add('Para cada modelo de veícuo será exibido a quantidade em estoque, em demonstração, em demonstração reservados para venda, em transito não reservados para venda e não reservados para venda em transito');
  end
  else if vtab.Name = tbsRelatorioVeiculosemTransito.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe a relação dos veículos em trânsito (Reservado para venda e não reservado)');
    MemoComentario.Lines.Add('Status: Listar veículos reservados, não reservados ou ambos');
  end
  else if vtab.Name = tbsRelatorioDiarioDiretoria.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe os totais das saidas realizadas no período informado (Requisição, Ordem de Serviço e Comando de Faturamento)');
    MemoComentario.Lines.Add('Total por grupo de produto, por modelo de veículo, por varejo e atacado');
  end
  else if vtab.Name = tbsInventarioVeiculos.Name then
  begin
    MemoComentario.Lines.Add('O inventário lista todos os veículos novo e usados com estoque na data refência informada');
    MemoComentario.Lines.Add('Data Referência: Data de referência do inventário');
    MemoComentario.Lines.Add('Valor das Peças: Valor monetário das mercadorias em estoque');
    MemoComentario.Lines.Add('Tipo de Cabeçalho: Modelo geral e contábil');
    MemoComentario.Lines.Add('Página Inicial: Número exibido na página inicial do relatório');
    MemoComentario.Lines.Add('Com Status: Exibir status do veículo (Reservado, Demonstração e etc)');
    MemoComentario.Lines.Add('Veículo Novo: Exibir veículos novos');
    MemoComentario.Lines.Add('Veículo Usado: Exibir veículos usados');
    MemoComentario.Lines.Add('Gravar Tipo 74: Gravar inventário');
  end
  else if vtab.Name = tsbRelatorioSituacaodoEstoqueFechado.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe as mercadorias no estoque fechado (carrinho de compra) e reservadas por colaborador');
    MemoComentario.Lines.Add('Filtrar por Vendedor: Filtrar por colaborador específico');
  end
  else if vtab.Name = tbsRelatorioVeiculosPagosAntecipados.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe a relação dos veículos adquiridos que contas foram pagas (Contas a Pagar) antes da entrada de nota fiscal');
    MemoComentario.Lines.Add('Observação:');
    MemoComentario.Lines.Add('O cfop das notas fiscais de entrada devem estar definidos como compra');
    MemoComentario.Lines.Add('Exibe apenas os veículos pagos onde a entrada de nota fiscal não foi realizada ou a entrada de nota fiscal foi realizada após o período informado');
  end
  else if vtab.Name = tbsRelatorioVeiculosQueChegaramAntesDoPagamento.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe a relação dos veículos adquiridos onde as contas a pagar foram quitadas depois do período informado e até a data limite');
    MemoComentario.Lines.Add('Data Limite: Data limite do pagamento (Contas a Pagar)');
    MemoComentario.Lines.Add('Observação:');
    MemoComentario.Lines.Add('O cfop das notas fiscais de entrada devem estar definidos como compra');
    MemoComentario.Lines.Add('Exibe apenas os veículos adquiridos sem quitação do contas a pagar ou onde a quitação do contas a pagar foi realizada após o período informado e até a data limite do pagamento');
  end
  else if vtab.Name = tbsRelatorioFaturamentodeVeiculos.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe a relação dos veículos negociados no período informado');
    MemoComentario.Lines.Add('Filtrar por Vendedor: Filtrar por colaborador/gerente específico');
    MemoComentario.Lines.Add('Gerente: Filtrar por gerente ou colaborador');
    MemoComentario.Lines.Add('Estoque: Filtrar por veículos comprados');
    MemoComentario.Lines.Add('Consignado: Filtrar por veículos consignados');
    MemoComentario.Lines.Add('Intermediação: Filtrar por veículos intermediados');
    MemoComentario.Lines.Add('Estoque Real: Filtrar por veículos próprios');
    MemoComentario.Lines.Add('Concessionária: Filtrar por veículos de outras concessionárias');
    MemoComentario.Lines.Add('Observação:');
    MemoComentario.Lines.Add('O cfop das operações (Comando de Faturamento) devem estar definidos como faturamento');
  end
  else if vtab.Name = tbsRelatorioparaGerenciaVeiculos.Name then
  begin
    MemoComentario.Lines.Add('O relatório gerencial exibe a relação dos veículos negociados no período informado');
    MemoComentario.Lines.Add('Gerente: Exibir gerente ou vendedor responsável pela operação');
    MemoComentario.Lines.Add('Estoque: Filtrar por veículos comprados');
    MemoComentario.Lines.Add('Consignado: Filtrar por veículos consignados');
    MemoComentario.Lines.Add('Intermediação: Filtrar por veículos intermediados');
    MemoComentario.Lines.Add('Observação:');
    MemoComentario.Lines.Add('O cfop das operações (Comando de Faturamento) devem estar definidos como faturamento');
  end
  else if vtab.Name = tbsRelatorioTabeladePrecosVeiculos.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe a relação dos veículos não negociados com o preço de tabela');
    MemoComentario.Lines.Add('Marca: Filtrar por marca de veículo específica');
    MemoComentario.Lines.Add('Estoque: Filtrar por veículos comprados');
    MemoComentario.Lines.Add('Consignado: Filtrar por veículos consignados');
    MemoComentario.Lines.Add('Intermediação: Filtrar por veículos intermediados');
  end
  else if vtab.Name = tbsRelatorioRecebimentodeVeiculos.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe a relação dos veículos adquiridos no período informado');
  end
  else if vtab.Name = tbsRelatorioDespesasdeVeiculos.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe a relação das despesas (Contas a Pagar) de cada veículo no período informado');
    MemoComentario.Lines.Add('Estoque: Filtrar por veículos comprados');
    MemoComentario.Lines.Add('Consignado: Filtrar por veículos consignados');
    MemoComentario.Lines.Add('Intermediação: Filtrar por veículos intermediados');
    MemoComentario.Lines.Add('Concessionária: Filtrar por veículos de outras concessionárias');
  end
  else if vtab.Name = tbsRelatorioPendenciasdeVeiculos.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe a relação das pendências de cada veículo');
    MemoComentario.Lines.Add('Chassi: Filtrar por chassi específico');
    MemoComentario.Lines.Add('Placa: Filtrar por placa específica');
    MemoComentario.Lines.Add('Filtrar por funcionário: Filtrar por funcionário responsável');
    MemoComentario.Lines.Add('Situação: Filtrar por resolvida ou não resolvida');
    MemoComentario.Lines.Add('Pesquisar: Consultar por data de cadastro da pendência ou data prevista');
  end
  else if vtab.Name = tbsRelatorioContratoContaCorrente.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe os lançamento do programa de fidelidade agrupados por dia');
    MemoComentario.Lines.Add('Filtrar por Cliente: Filtrar por cliente específico');
    MemoComentario.Lines.Add('Exibir total de pontos dos proxímos x vencimentos por período: Somatório dos pontos vencidos dos proxímos x dias');
  end
  else if vtab.Name = tbsRelatorioVendasRecProgFid.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe os total dos documentos recebidos (Requisição, Ordem de Serviço e Comando de Faturamento) e total dos vales (voucher) por período');
    MemoComentario.Lines.Add('Tipo relatório: No modo analítico é exibido os documentos que os vales foram utilizados');
    MemoComentario.Lines.Add('Filtrar por Cliente: Filtrar por cliente específico');
  end
  else if vtab.Name = tbsRelatorioTitulosporRota.Name then
  begin
		MemoComentario.Lines.Add('O relatório exibe os títulos (Créditos e Cheques) por rota de entrega dos clientes');
    MemoComentario.Lines.Add('Rota: Filtrar títulos por rota específica');
    MemoComentario.Lines.Add('Tipo de Plano do Controle: Filtrar por tipo do plano dos controles dos títulos');
    MemoComentario.Lines.Add('Razão ou Nome Fantasia: Exibir razão social ou nome fantasia dos clientes');
    MemoComentario.Lines.Add('Exibir Valor Corrigido: Exibir valor corrigido ou valor original dos títulos');
    MemoComentario.Lines.Add('Observação:');
    MemoComentario.Lines.Add('Para exibir os títulos os clientes devem estar vinculados a uma rota de entrega');
  end
  else if vtab.Name = tbsRelatorioComissaoPorVenda.Name then
  begin
    MemoComentario.Lines.Add('O relatório exibe saídas realizadas (Requisição e Ordem de Serviço) e valores de comissão por colaborador e participante');
    MemoComentario.Lines.Add('Tipo de Relatório: No modo analítico exibe o parcelamento da comissão do colaborador e partipante');
    MemoComentario.Lines.Add('Listas Vendas por: Consultar saídas por data de abertura ou data de fechamento ou data do recebimento ou data de vecimento ');
    MemoComentario.Lines.Add('Razão ou Nome Fantasia: Exibir razão social ou nome fantasia dos clientes');
    MemoComentario.Lines.Add('Exibir Comissões: Exibir comissão dos colaborador, participantes ou ambos');
    MemoComentario.Lines.Add('Filtrar por Vendedor: Filtrar por cliente específico');
    MemoComentario.Lines.Add('Filtrar por ' + vDadosIni.vPedVnd.descricaoParticipante + ': Filtrar por ' + LowerCase(vDadosIni.vPedVnd.descricaoParticipante) + ' específico');
    MemoComentario.Lines.Add('Status das Vendas: Filtrar por saídas abertas, fechadas ou ambas');
    MemoComentario.Lines.Add('Exibir Vendas: Exibir saídas com e sem comissão definidas');
    MemoComentario.Lines.Add('Observação:');
    MemoComentario.Lines.Add('Este relatório exibe os totais de comissão por colaborador' +
    	vDadosIni.IfThen(vDadosIni.vPedVnd.habPartipante, ' e ' + LowerCase(vDadosIni.vPedVnd.descricaoParticipante), '') +
    	', sendo assim a mesma venda pode ser apresentada de forma repetida para colaborador' +
      vDadosIni.IfThen(vDadosIni.vPedVnd.habPartipante, ' e ' + LowerCase(vDadosIni.vPedVnd.descricaoParticipante), '') +
      ' diferentes.');
  end;
  MemoComentario.SelStart := 0;
  MemoComentario.SelLength := 0;
end;

procedure TfrmRelatorios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  ObRel.Free;
  ObRel := nil;

  CadRelatorio.Free;
  CadRelatorio := nil;
  Action := caFree;

  if (frmRelatorios <> nil) then
	  frmRelatorios := nil;
  //  vDadosIni.vNumeroRelatorio := '';
end;

procedure TfrmRelatorios.FormCreate(Sender: TObject);
var
  i: integer;
begin
  inherited;
  //  ObRel:= TRelatorios.create;
  CadRelatorio := TRelatorios.create;
  TabSheet3.TabVisible := false;
  tbsResumoGeral.TabVisible := false;
  tbsVendedores.TabVisible := false;
  //  tbsFinVendaVendedor.TabVisible := not (vDadosIni.vMecOS = 'S');
  tbsFinVendaVendedor.TabVisible := false;
  tbsFinVendaVendedorComissaoServ.TabVisible := (vDadosIni.vMecOS = 'S');
  tbsResumo.TabVisible := false;
  tbsGerenciais.TabVisible := false;
  tbsComentario.TabVisible := false;

  vDadosIni.mudaregistroODBC('Admin');
  vDadosIni._acertarRegistroCrystal;

  if vDadosIni.vTipoForm = 0 then
    tbsResumo.Show
  else
    tbsGerenciais.Show;
  for I := 0 to pageGerenciais.PageCount - 1 do
    pageGerenciais.Pages[i].TabVisible := false;
end;

procedure TfrmRelatorios.FormKeyDownComentario(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  	BitBtn5Click(Sender);
end;

procedure TfrmRelatorios.FormResize(Sender: TObject);
begin
  inherited;
  if frmRelatorios = nil then
  	exit;

  if (frmRelatorios.Height >= 675) and (frmRelatorios.Width >= 814) then
  	pageRelatorios.Align := alClient
  else
  begin
  	pageRelatorios.Align := alTop;
  	pageRelatorios.Height := 471; //467;
    pageRelatorios.Width := 802;
  end;
end;

procedure TfrmRelatorios.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;

  InibirEstatisticas := True;
  inherited;
  pageResumo.ActivePage := tbsVendaBalcao;
  if not vDadosIni.vPedVnd.habPartipante then
	  tbsVendaBalcaoPariticipante.TabVisible := false
  else
  	tbsVendaBalcaoPariticipante.Caption := 'Saídas Balcão ' + vDadosIni.vPedVnd.descricaoParticipante;
    
  lbAgruparUnificadas.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  lbAgruparUnificadas2.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  lbAgruparUnificadas3.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  lbAgruparUnificadas4.Visible := vDadosIni.vEmp.vFinanceiroUnificado;

  cbAgruparUnificadas.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  cbAgruparUnificadas2.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  cbAgruparUnificadas3.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  cbAgruparUnificadas4.Visible := vDadosIni.vEmp.vFinanceiroUnificado;

  lbCodigoEmpUnificada.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  lbCodigoEmpUnificada2.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  lbCodigoEmpUnificada3.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  lbCodigoEmpUnificada4.Visible := vDadosIni.vEmp.vFinanceiroUnificado;

  edCodigoEmpUnificada.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  edCodigoEmpUnificada2.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  edCodigoEmpUnificada3.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  edCodigoEmpUnificada4.Visible := vDadosIni.vEmp.vFinanceiroUnificado;

  tbsVendaVendedorAcrescCondPagVend.TabVisible := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;

  MaskEdit1.Text := DateToStr(date);
  MaskEdit2.Text := DateToStr(date);
  MaskEdit3.Text := DateToStr(date);
  if (Self.Enabled) and (Self.Visible) and (MaskEdit1.CanFocus) then
    MaskEdit1.setfocus;
  BitBtn3.Enabled := false;
  pageResumoChange(Sender);
  pageGerenciaisChange(Sender);
  CheckBox79.Caption := 'Exibir comissão ' + vDadosIni.IfThen(vDadosIni.vEmp.vUsarAparelho = 'S', 'técnico', 'mecânico') + ':';
  CheckBox79.Left := vDadosIni.IfThen(vDadosIni.vEmp.vUsarAparelho = 'S', 82, 66);  
  CheckBox79.Width := vDadosIni.IfThen(vDadosIni.vEmp.vUsarAparelho = 'S', 154, 170);
  Label34.Caption := 'Filtrar por ' + vDadosIni.vPedVnd.descricaoParticipante + ':';
  Label34.Hint := 'Filtrar ' + vDadosIni.vPedVnd.descricaoParticipante;
  Label53.Visible := false;
  ComboBox50.Visible := false;
  Label110.Visible := false;
  ComboBox87.Visible := false;
  Label118.Visible := false;
  ComboBox95.Visible := false;
  Label111.Visible := false;
  ComboBox88.Visible := false;
  Label119.Visible := false;
  ComboBox96.Visible := false;
  Label87.Visible := false;
  ComboBox63.Visible := false;
end;

function TfrmRelatorios.habilitaBotoes(vtip: integer): boolean;
begin
  if vtip = 1 then
  begin
    pageRelatorios.Enabled := true;
    BitBtn1.Enabled := true;
    BitBtn2.Enabled := true;
    BitBtn3.Enabled := false;
  end
  else
  begin
    pageRelatorios.Enabled := false;
    BitBtn1.Enabled := false;
    BitBtn2.Enabled := false;
    BitBtn3.Enabled := true;
  end;
end;

procedure TfrmRelatorios.Label34Click(Sender: TObject);
begin
	CheckBox96.Checked := not CheckBox96.Checked;
end;

procedure TfrmRelatorios.MaskEdit1Exit(Sender: TObject);
begin
  inherited;
  //  if pageGerenciais.ActivePage = tbsRelatoriosdeVendasPlacaCliente then
  //    labelPeriodo.Caption:='Período de '+MaskEdit1.text + ' até '+ MaskEdit2.text
  //  else if pageGerenciais.ActivePage = tbsRelatoriodeVendasObjetoCliente then
  //    labelPeriodo1.Caption:='Período de '+MaskEdit1.text + ' até '+MaskEdit2.text;
end;

procedure TfrmRelatorios.MaskEdit2Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (pageResumo.CanFocus) then
    pageResumo.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (pageGerenciais.CanFocus) then
    pageGerenciais.SetFocus;
end;

procedure TfrmRelatorios.MemoComentarioDblClick(Sender: TObject);
begin
  inherited;
  MemoComentario2.Text := MemoComentario.Text;
  vDadosIni.abreForm(label5.Caption, pnComentario, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]);
end;

procedure TfrmRelatorios.pageGerenciaisChange(Sender: TObject);
begin
  inherited;
  if pageRelatorios.Align <> alClient then
  begin
	  pageRelatorios.Align := alClient;

		pageRelatorios.Align := alTop;
	  pageRelatorios.Width := 802;
    FormResize(Sender);
  end;

  if pageGerenciais.ActivePage = tsbRelatorioSituacaodoEstoqueFechado then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL028', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      CheckBox44.Checked := true;
      CheckBox44.Enabled := false;
      DBLookupComboBox25.Enabled := false;
      DBLookupComboBox25.KeyValue := vDadosIni.vCodUsuario;
    end;
  end
  else if pageGerenciais.ActivePage = tbsRelatorioFaturamentodeVeiculos then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL047', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      CheckBox46.Checked := true;
      CheckBox46.Enabled := false;
      DBLookupComboBox27.Enabled := false;
      DBLookupComboBox27.KeyValue := vDadosIni.vCodUsuario;
    end;
  end
  else if pageGerenciais.ActivePage = tbsRelatorioPendenciasdeVeiculos then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL044', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      CheckBox47.Checked := true;
      CheckBox47.Enabled := false;
      DBLookupComboBox28.Enabled := false;
      DBLookupComboBox28.KeyValue := vDadosIni.vCodUsuario;
    end;
  end
  else if pageGerenciais.ActivePage = tbsRelatorioVeiculosNegociados then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL046', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      CheckBox8.Checked := true;
      CheckBox8.Enabled := false;
      DBLookupComboBox24.Enabled := false;
      DBLookupComboBox24.KeyValue := vDadosIni.vCodUsuario;
    end;
  end;
end;

procedure TfrmRelatorios.pageGerenciaisExit(Sender: TObject);
begin
  inherited;
  //  if (BitBtn1.CanFocus) and (ActiveControl <> BitBtn2) then
  //    BitBtn1.SetFocus;
end;

procedure TfrmRelatorios.pageRelatoriosChange(Sender: TObject);
begin
  inherited;
	if pageRelatorios.Align <> alClient then
  begin
	  pageRelatorios.Align := alClient;

		pageRelatorios.Align := alTop;
	  pageRelatorios.Width := 802;
    FormResize(Sender);
  end;
end;

procedure TfrmRelatorios.pageResumoChange(Sender: TObject);
begin
  inherited;
  if pageRelatorios.Align <> alClient then
  begin
	  pageRelatorios.Align := alClient;

		pageRelatorios.Align := alTop;
	  pageRelatorios.Width := 802;
    FormResize(Sender);
  end;

  if pageResumo.ActivePage = tbsVendaBalcao then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL002', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      CheckBox13.Checked := true;
      CheckBox13.Enabled := false;
      DBLookupComboBox1.Enabled := false;
      CheckListBox1.Visible := false;
    end;
  end;
  if pageResumo.ActivePage = tbsVendaOficina then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL004', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      CheckBox16.Checked := true;
      CheckBox16.Enabled := false;
      DBLookupComboBox4.Enabled := false;
      DBLookupComboBox4.KeyValue := vDadosIni.vCodUsuario;
    end;
  end;
  if pageResumo.ActivePage = tbsVendaGeral then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL006', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      CheckBox19.Checked := true;
      CheckBox19.Enabled := false;
      DBLookupComboBox7.Enabled := false;
      DBLookupComboBox7.KeyValue := vDadosIni.vCodUsuario;
    end;
  end;
  if pageResumo.ActivePage = tbsVendaVendedor then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL008', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      CheckBox23.Checked := true;
      CheckBox23.Enabled := false;
      DBLookupComboBox11.Enabled := false;
      DBLookupComboBox11.KeyValue := vDadosIni.vCodUsuario;
    end;
  end;
  if pageResumo.ActivePage = tbsComissaoRecebimento then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('REL012', 'HABILITAR', '', '', '', CadRelatorio.buscas, false) then
    begin
      CheckBox22.Checked := true;
      CheckBox22.Enabled := false;
      DBLookupComboBox12.Enabled := false;
      DBLookupComboBox12.KeyValue := vDadosIni.vCodUsuario;
    end;
  end;
end;

procedure TfrmRelatorios.Panel16Enter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (ComboBox47.CanFocus) then
    ComboBox47.CanFocus;
end;

procedure TfrmRelatorios.Panel1Enter(Sender: TObject);
begin
  inherited;
  labelPeriodo1.Caption := 'Período de ' + MaskEdit1.text + ' até ' + MaskEdit2.text;
end;

procedure TfrmRelatorios.Panel24Enter(Sender: TObject);
begin
  inherited;
  labelPeriodo.Caption := 'Período de ' + MaskEdit1.text + ' até ' + MaskEdit2.text;
end;


procedure TfrmRelatorios.Panel29Enter(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (ComboBox62.CanFocus) then
  	ComboBox62.SetFocus;
end;

procedure TfrmRelatorios.Panel54Enter(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (ComboBox90.CanFocus) then
    ComboBox90.CanFocus;
end;

procedure TfrmRelatorios.pnComentarioEnter(Sender: TObject);
begin
  TForm(pnComentario).OnKeyDown := FormKeyDownComentario;
end;

procedure TfrmRelatorios.btUnSelectAllVendComissFaixaDescClick(Sender: TObject);
begin
  inherited;
	obRel.DesmarcaTodaListaVendedores(CheckListBox7);
end;

procedure TfrmRelatorios.tbsComissaoRecebimentoShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := 'Informações adicionais ' + #13 + #13 +
     'Processo "REL012" HABILITAR VENDEDOR RELATORIO SALDAS POR VENDEDOR';
  BitBtn1.Hint := 'OK - [REL013]';
  ObRel.free;
  ObRel := TRelatorioComissaoProdRecebimento.Create;
  CheckBox22.Checked := ObRel.FiltrarVendedor;
  label5.Caption := tbsComissaoRecebimento.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsComprasPorPeriodoShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL010]';
  ObRel.free;
  ObRel := TRelatorioComprasPorPeriodo.Create;
  label5.Caption := tbsComprasPorPeriodo.Caption;
  ComboBox35.Clear;
  ComboBox35.Items.Add('AMBOS');
  ComboBox35.Items.Add('SIM');
  ComboBox35.Items.Add('NAO');
  ComboBox35.ItemIndex := 0;

  Label56.Enabled := (ComboBox51.ItemIndex = 1);
  ComboBox53.Enabled := (ComboBox51.ItemIndex = 1);

  Label106.Enabled := (ComboBox51.ItemIndex = 1) and (ComboBox53.ItemIndex = 0);
  ComboBox83.Enabled := (ComboBox51.ItemIndex = 1) and (ComboBox53.ItemIndex = 0);

  if not ComboBox83.Enabled then
  	ComboBox83.ItemIndex := 1;
  if not ComboBox83.Enabled then
    ComboBox53.ItemIndex := 1;
    
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsEstoqueShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL011]';
  ObRel.free;
  ObRel := TRelatorioEstoque.Create;
  MaskEdit4.Text := DateToStr(date);
  label5.Caption := tbsEstoque.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsFinVendaModalidadePagShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL050]';
  ObRel.free;
  ObRel := TRelatorioFinVendaModalidadePag.Create;
  label5.Caption := tbsFinVendaModalidadePag.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsFinVendaVendedorComissaoServShow(Sender: TObject);
begin
  inherited;
  if ComboBox80.ItemIndex = 0 then
  begin
  	Label104.Enabled := false;
    ComboBox81.Enabled := false;
    ComboBox81.ItemIndex := 0;
  end
  else if ComboBox80.ItemIndex = 1 then
  begin
    Label104.Enabled := false;
    ComboBox81.Enabled := false;
    ComboBox81.ItemIndex := 0;
  end
  else if ComboBox80.ItemIndex = 2 then
  begin
    Label104.Enabled := true;
    ComboBox81.Enabled := true;
    ComboBox81.ItemIndex := 1;
  end;
  
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL014]';
  ObRel.free;
  ObRel := TRelatorioVendaVendedorComissaoServ.Create;
  if ObRel.ExibirDavORC then
  begin
    CheckBox28.Checked := false;
    CheckBox28.Enabled := false;
    CheckBox7.Checked := true;
    CheckBox7.Enabled := false;
  end else begin
    CheckBox7.Checked := false;
    CheckBox7.visible := false;
  end;
//  ObRel.FiltrarTipoOS := CheckBox28.Checked;
  label5.Caption := tbsFinVendaVendedorComissaoServ.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsFinVendaVendedorShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL003]';
  ObRel.free;
  ObRel := TRelatorioVendaProdutosBalcao.Create;
  label5.Caption := tbsFinVendaVendedor.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsHistoricoRecibosShow(Sender: TObject);
begin
  inherited;
  ObRel.free;
  ObRel := TRelatoriosdeRecibos.Create;
  label5.Caption := tbsHistoricoRecibos.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsInventarioRecShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL019]';
  ObRel.free;
  ObRel := TRelatoriosdeRecibos.Create;
  MaskEdit8.Text := DateToStr(date);
  ObRel.dataReferencia := date;
  label5.Caption := tbsInventarioRec.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsInventarioVeiculosShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL036]';
  ObRel.free;
  ObRel := TInventarioVeiculos.Create;
  label5.Caption := tbsInventarioVeiculos.Caption;
  Label3.Caption := 'Data Referência:';
  GroupBox1.Visible := False;
  escreverComentario(TTabSheet(Sender));
  if (Self.Enabled) and (Self.Visible) and (MaskEdit3.CanFocus) then
    MaskEdit3.SetFocus;
end;

procedure TfrmRelatorios.tbsListaDeAlteracaoDePrecoShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL020]';
  ObRel.free;
  ObRel := TRelatorioListaDeAlteracaoDePreco.Create;
  //  CheckBox29.Checked := ObRel.FiltrarCFOP;
  //  DBLookupComboBox16.Enabled := ObRel.FiltrarCFOP;
  label5.Caption := tbsListaDeAlteracaoDePreco.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsNotasEmitidasPorPeriodoShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL015]';
  ObRel.free;
  ObRel := TRelatorioNotasEmitidasPorPeriodo.Create;
  CheckBox11.Checked := ObRel.FiltrarTipoNF;
  ComboBox11.Enabled := ObRel.FiltrarTipoNF;
  DBLookupComboBox16.Enabled := ObRel.FiltrarCFOP;
  CheckBox29.Checked := ObRel.FiltrarCFOP;
  edmCFOP.Enabled := ObRel.FiltrarCFOP;
  label5.Caption := tbsNotasEmitidasPorPeriodo.Caption;

  CheckBox11.Enabled := (ComboBox82.ItemIndex = 0) or (ComboBox82.ItemIndex = 1);
  if (not CheckBox11.Enabled) then
    CheckBox11.Checked := False;

  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsOrdensDeServicosEmitidasPorPeriodoShow(
  Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL018]';
  ObRel.free;
  ObRel := TRelatorioOrdensDeServicosEmitidasPorPeriodo.Create;
  CheckBox30.Checked := ObRel.FiltrarTipoOS;
  CheckBox45.Checked := ObRel.FiltrarCondPagamento;
  label5.Caption := tbsOrdensDeServicosEmitidasPorPeriodo.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsPagamentoFinanceiroShow(Sender: TObject);
begin
  inherited;
	imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL060]';
  ObRel.free;
  ObRel := TRelatorioPagamentosFinanceiro.Create;

  label5.Caption := tbsRecebimentoFinanceiro.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsPagamentoRecebimentoFinanceiroShow(Sender: TObject);
begin
	imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL061]';
  ObRel.free;
  ObRel := TRelatorioPagamentosRecebimentosFinanceiro.Create;

  label5.Caption := tbsPagamentoRecebimentoFinanceiro.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsProdutosComPendenciasEmOSREQShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL016]';
  ObRel.free;
  ObRel := TRelatorioProdutosComPendenciaEmVendasREQOS.Create;
  label5.Caption := tbsProdutosComPendenciasEmOSREQ.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRecebimentoCaixaAuxiliarShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL062]';
  ObRel.free;
  ObRel := TRelatorioRecebimentosCaixaAuxiliar.Create;

  label5.Caption := tbsRecebimentoCaixaAuxiliar.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRecebimentoFinanceiroShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL048]';
  ObRel.free;
  ObRel := TRelatorioRecebimentosFinanceiro.Create;

  label5.Caption := tbsRecebimentoFinanceiro.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRecibosEmitidosShow(Sender: TObject);
begin
  inherited;
  ObRel.free;
  ObRel := TRelatoriosdeRecibos.Create;
  label5.Caption := tbsRecibosEmitidos.Caption;
  //  ObRel.dataReferencia := strtodate(MaskEdit4.Text);
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRecibosShow(Sender: TObject);
begin
  inherited;
  ObRel.verificatipodepartamento(ComboBox57);
  ObRel.verificatipodepartamento(ComboBox58);
end;

procedure TfrmRelatorios.tbsRelatorioAcompanhamentodeVeiculoShow(
  Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL032]';
  ObRel.free;
  ObRel := TRelatorioAcompanhamentodeVeiculo.Create;
  label5.Caption := tbsRelatorioAcompanhamentodeVeiculo.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRelatorioApuracaoICMSShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL027]';
  ObRel.free;
  ObRel := TRelatorioApuracaoICMS.Create;
  label5.Caption := tbsRelatorioApuracaoICMS.Caption;
  CheckBox9.Checked := ObRel.FiltrarTipoVeic;
  CheckBox10.Checked := ObRel.FiltrarTipoVenda;
  CheckBox8.Checked := ObRel.FiltrarVendedor;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRelatorioComissaoPorVendaShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL054]';
  ObRel.free;
  ObRel := TRelatorioComissaoPorVenda.Create;
  CheckBox66.Caption := 'Filtrar por ' + vDadosIni.vPedVnd.descricaoParticipante + ':';
  RadioGroupRouFComissaoPorVenda.ItemIndex := _LerConfiguracoesRegistroInteger('RadioGroupRouFComissaoPorVenda');
  ComboBoXMovVenc.ItemIndex := _LerConfiguracoesRegistroInteger('ComboBoXMovVenc');
//  CheckBox65.Enabled := true;
//  CheckBox66.Enabled := vDadosIni.vPedVnd.habPartipante;;
//  DBLookupComboBox40.Enabled := true;
//  DBLookupComboBox41.Enabled := vDadosIni.vPedVnd.habPartipante;;

//  Label77.Visible := vDadosIni.vPedVnd.habPartipante;
//  ComboBox33.Visible := vDadosIni.vPedVnd.habPartipante;
//
//  CheckBox33.Visible := true;
//  CheckBox66.Visible := vDadosIni.vPedVnd.habPartipante;
//  DBLookupComboBox41.Visible := vDadosIni.vPedVnd.habPartipante;
//  DBEdit24.Visible := vDadosIni.vPedVnd.habPartipante;

  if not vDadosIni.vPedVnd.habPartipante then
  begin
    Label77.Enabled := false;
    ComboBox33.Enabled := false;
    CheckBox66.Enabled := false;
    DBLookupComboBox41.Enabled := false;
    DBEdit24.Enabled := false;
  end;
  Label78.Visible := vDadosIni.vPedVnd.habPartipante;
  if not vDadosIni.vPedVnd.habPartipante then
    Label78.Caption := 'Este relatório exibe os totais de comissão por vendedor, ' +
      'sendo assim a mesma venda pode ser apresentada de forma repetida para vendedor diferentes.'
  else
    Label78.Caption := 'Este relatório exibe os totais de comissão por vendedor e ' + LowerCase(vDadosIni.vPedVnd.descricaoParticipante) + ', ' +
      'sendo assim a mesma venda pode ser apresentada de forma repetida por vendedor e ' + LowerCase(vDadosIni.vPedVnd.descricaoParticipante) + ' diferentes.';

  if vDadosIni.vPedVnd.habPartipante then
  begin
  	ComboBox33.Clear;
    ComboBox33.Items.Add('AMBOS (VENDEDOR E ' + UpperCase(trim(vDadosIni.vPedVnd.descricaoParticipante)) + ')');
    ComboBox33.Items.Add('VENDEDOR');
    ComboBox33.Items.Add(UpperCase(trim(vDadosIni.vPedVnd.descricaoParticipante)));
    ComboBox33.ItemIndex := 0;
  end;
//  CheckBox2.Checked := ObRel.ExibirVendaREQ;
//  CheckBox3.Checked := ObRel.ExibirVendaOS;
//  CheckBox4.Checked := ObRel.FiltrarData;
//  CheckBox5.Checked := ObRel.FiltrarObjeto;
  label5.Caption := tbsRelatorioComissaoPorVenda.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRelatorioContratoContaCorrenteShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  Label37.Caption := 'Exibir total de ' +
  	 vDadosIni.IfThen(vDadosIni.vProgFid.vExibirReciboPontosValorAmbos = 'V', 'valor',
    vDadosIni.IfThen(vDadosIni.vProgFid.vExibirReciboPontosValorAmbos = 'P', 'pontos', 'pontos/valor')) + ' dos próximos:';
  BitBtn1.Hint := 'OK - [REL051]';
  ObRel.free;
  ObRel := TRelatoriosExtratoContaCorrenteProgFid.Create;
//  CheckBox2.Checked := ObRel.ExibirVendaREQ;
//  CheckBox3.Checked := ObRel.ExibirVendaOS;
//  CheckBox4.Checked := ObRel.FiltrarData;
//  CheckBox5.Checked := ObRel.FiltrarObjeto;
  label5.Caption := tbsRelatorioContratoContaCorrente.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRelatorioDespesasdeVeiculosShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL043]';
  escreverComentario(TTabSheet(Sender));
  if CadRelatorio.abreFormSelEmpresas then
  begin
    ObRel.free;
    ObRel := TRelatorioDespesasdeVeiculos.Create;
    label5.Caption := tbsRelatorioDespesasdeVeiculos.Caption;
  end
  else
  begin
  	frmRelatorios.fechar := True;
    PostMessage(frmRelatorios.Handle, WM_CLOSE, 0, 0);
  end;
end;

procedure TfrmRelatorios.tbsRelatoriodeVendasObjetoClienteShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL021]';
  ObRel.free;
  ObRel := TRelatoriosdeVendasObjetoCliente.Create;
  CheckBox2.Checked := ObRel.ExibirVendaREQ;
  CheckBox3.Checked := ObRel.ExibirVendaOS;
  CheckBox4.Checked := ObRel.FiltrarData;
  CheckBox5.Checked := ObRel.FiltrarObjeto;
  label5.Caption := tbsRelatoriodeVendasObjetoCliente.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRelatorioDiarioDiretoriaShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL035]';
  ObRel.free;
  ObRel := TRelatorioDiarioDiretoria.Create;
  label5.Caption := tbsRelatorioDiarioDiretoria.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRelatorioFaturamentodeVeiculosShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := 'Informações adicionais ' + #13 + #13 +
     'Processo "REL047" HABILITAR VENDEDOR FATURAMENTO VEICULOS';
  BitBtn1.Hint := 'OK - [REL039]';
  escreverComentario(TTabSheet(Sender));
  if CadRelatorio.abreFormSelEmpresas then
  begin
    ObRel.free;
    ObRel := TRelatorioFaturamentodeVeiculos.Create;
    CheckBox46.Checked := ObRel.FiltrarVendedor;
    label5.Caption := tbsRelatorioFaturamentodeVeiculos.Caption;
    ckEstoqueReal.Visible := vDadosIni.vEmp.vTipoEmpVeiculos = 'A';
    ckConcessionaria.Visible := vDadosIni.vEmp.vTipoEmpVeiculos = 'A';
  end
  else
  begin
  	frmRelatorios.fechar := True;
    PostMessage(frmRelatorios.Handle, WM_CLOSE, 0, 0);
  end;
end;

procedure TfrmRelatorios.tbsRelatorioparaGerenciaVeiculosShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL040]';
  escreverComentario(TTabSheet(Sender));
  if CadRelatorio.abreFormSelEmpresas then
  begin
    ObRel.free;
    ObRel := TRelatorioparaGerenciaVeiculos.Create;
    label5.Caption := tbsRelatorioparaGerenciaVeiculos.Caption;
  end
  else
  begin
  	frmRelatorios.fechar := True;
    PostMessage(frmRelatorios.Handle, WM_CLOSE, 0, 0);
  end;
end;

procedure TfrmRelatorios.tbsRelatoriosdeVendasPlacaClienteShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL022]';
  ObRel.free;
  ObRel := TRelatoriosdeVendasPlacaCliente.Create;
  CheckBox33.Checked := ObRel.ExibirVendaREQ;
  CheckBox33.Enabled := ObRel.ExibirVendaREQ;
  CheckBox34.Checked := ObRel.ExibirVendaOS;
  CheckBox34.Enabled := ObRel.ExibirVendaOS;
  CheckBox6.Checked := ObRel.ExibirDavORC;
  CheckBox6.Enabled := false;
  if ObRel.ExibirDavORC then
  begin
    ComboBox55.ItemIndex := 1;
    ComboBox55.Enabled := false;
  end;
  CheckBox35.Checked := ObRel.FiltrarData;
  CheckBox37.Checked := ObRel.FiltrarPlaca;
  MaskEdit5.Visible := ObRel.FiltrarPlaca;
  MaskEdit5.Text := '';
  label5.Caption := tbsRelatoriosdeVendasPlacaCliente.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRelatorioTabeladePrecosVeiculosShow(
  Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL041]';
  GroupBox1.Visible := False;
  escreverComentario(TTabSheet(Sender));
  if CadRelatorio.abreFormSelEmpresas then
  begin
    ObRel.free;
    ObRel := TRelatorioTabelaPrecoVeiculos.Create;
    label5.Caption := tbsRelatorioTabeladePrecosVeiculos.Caption;

    cbMarca.Clear;
    cbMarca.Items.Add('TODOS');
    ObRel.buscas.Close;
    ObRel.buscas.SQL.Text := ' SELECT TRIM(DESCRICAO_MARCA) DESCRICAO_MARCA FROM MARCA_PROD ' +
     ' WHERE TIPO_MARCA = ''V'' ';
    ObRel.buscas.Open;
    ObRel.buscas.FetchAll;
    ObRel.buscas.First;

    while not ObRel.buscas.Eof do
    begin
      cbMarca.Items.Add(trim(UpperCase(ObRel.buscas.FieldByName('DESCRICAO_MARCA').AsString)));
      ObRel.buscas.Next;
    end;
    cbMarca.Text := 'TODOS';
    cbMarca.ItemIndex := 0;
  end
  else
  begin
    frmRelatorios.fechar := True;
    PostMessage(frmRelatorios.Handle, WM_CLOSE, 0, 0);
  end;
end;

procedure TfrmRelatorios.tbsRelatorioTitulosporRotaShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL053]';
  ObRel.free;
  ObRel := TRelatorioTitulosPorRota.Create;
  ObRel.ListaRota;
  if not ObRel.dtSetRota.IsEmpty then
    DBLookupComboBox39.KeyValue := ObRel.dtSetRota.FieldByName('cod_rota').AsInteger;
//  CheckBox2.Checked := ObRel.ExibirVendaREQ;
//  CheckBox3.Checked := ObRel.ExibirVendaOS;
//  CheckBox4.Checked := ObRel.FiltrarData;
//  CheckBox5.Checked := ObRel.FiltrarObjeto;
  label5.Caption := tbsRelatorioTitulosporRota.Caption;
                                              
  ckCartao.Checked := _LerConfiguracoesRegistroBoolean('ckCartao');
  ckFinanc.Checked := _LerConfiguracoesRegistroBoolean('ckFinanc');
  ckChequePre.Checked := _LerConfiguracoesRegistroBoolean('ckChequePre');
  ckBoleta.Checked := _LerConfiguracoesRegistroBoolean('ckBoleta');
  ckOutros.Checked := _LerConfiguracoesRegistroBoolean('ckOutros');
  RadioGroupRouF.ItemIndex := _LerConfiguracoesRegistroInteger('RadioGroupRouF');
  ComboBoxValorCorrigido.ItemIndex := _LerConfiguracoesRegistroInteger('ComboBoxValorCorrigido');
  ObRel.ListaCtrlTitulosRota(ckCartao.Checked, ckFinanc.Checked, ckBoleta.Checked, ckChequePre.Checked, ckOutros.Checked);
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRequisicoesEmitidasPorPeriodoShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL017]';
  ObRel.free;
  ObRel := TRelatorioRequisicoesEmitidasPorPeriodo.Create;
  CheckBox36.Checked := ObRel.FiltrarTipoVenda;
  CheckBox31.Checked := ObRel.FiltrarCondPagamento;
  label5.Caption := tbsRequisicoesEmitidasPorPeriodo.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRequisicoesOrdemServicoEmitidasPorPeriodoShow(
  Sender: TObject);
begin
  inherited;
	imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL057]';
  ObRel.free;
  ObRel := TRelatorioRequisicoesOrdensDeServicosEmitidasPorPeriodo.Create;
  CheckBox73.Checked := ObRel.FiltrarTipoVenda;
  CheckBox69.Checked := ObRel.FiltrarTipoOS;
  CheckBox70.Checked := ObRel.FiltrarCondPagamento;
  CheckBox71.Checked := ObRel.FiltrarAreaExec;
  CheckBox72.Checked := ObRel.FiltrarCliente;

  Label83.Visible := CheckBox72.Checked;
  ComboBox61.Visible := CheckBox72.Checked;

  label5.Caption := tbsOrdensDeServicosEmitidasPorPeriodo.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRelatorioVeiculosemDemonstracaoShow(
  Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL031]';
  ObRel.free;
  ObRel := TRelatorioVeiculosemDemonstracao.Create;
  label5.Caption := tbsRelatorioVeiculosemDemonstracao.Caption;
  CheckBox38.Checked := ObRel.FiltrarTipoVenda;
  ComboBox12.Enabled := ObRel.FiltrarTipoVenda;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRelatorioVeiculosemTransitoShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL034]';
  ObRel.free;
  ObRel := TRelatorioVeiculosemTransito.Create;
  label5.Caption := tbsRelatorioVeiculosemTransito.Caption;
  GroupBox1.Visible := False;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRelatorioVeiculosNegociadosShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := 'Informações adicionais ' + #13 + #13 +
     'Processo "REL046" HABILITAR VENDEDOR VEICULOS NEGOCIADOS';
  BitBtn1.Hint := 'OK - [REL030]';
  ObRel.free;
  ObRel := TRelatorioVeiculosNegociados.Create;
  CheckBox9.Checked := ObRel.FiltrarTipoVenda;
  ComboBox8.Enabled := ObRel.FiltrarTipoVenda;
  CheckBox10.Checked := ObRel.FiltrarTipoVeic;
  ComboBox9.Enabled := ObRel.FiltrarTipoVeic;
  CheckBox8.Checked := ObRel.FiltrarVendedor;
  DBLookupComboBox24.Enabled := ObRel.FiltrarVendedor;
  DBLookupComboBox24.KeyValue := 0;
  label5.Caption := tbsRelatorioVeiculosNegociados.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsVendaBalcaoPariticipanteShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL049]';
  ObRel.free;
  ObRel := TRelatorioVendaProdutosBalcaoParticipante.Create;
  CheckBox55.Checked := ObRel.FiltrarTipoVenda;
  CheckBox96.Checked := ObRel.FiltrarVendedor;
  CheckBox53.Checked := ObRel.FiltrarGrupo;
  label5.Caption := tbsVendaBalcaoPariticipante.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsVendaBalcaoShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := 'Informações adicionais ' + #13 + #13 +
     'Processo "REL002" HABILITAR VENDEDOR RELATORIO SALDAS BALCAO';
  BitBtn1.Hint := 'OK - [REL003]';
  ObRel.free;
  ObRel := TRelatorioVendaProdutosBalcao.Create;
  CheckBox14.Checked := ObRel.FiltrarTipoVenda;
  CheckBox13.Checked := ObRel.FiltrarVendedor;
  CheckBox12.Checked := ObRel.FiltrarGrupo;
  label5.Caption := tbsVendaBalcao.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsVendaGeralShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := 'Informações adicionais ' + #13 + #13 +
     'Processo "REL006" HABILITAR VENDEDOR RELATORIO SALDAS GERAL';
  BitBtn1.Hint := 'OK - [REL007]';
  ObRel.free;
  ObRel := TRelatorioVendasGeral.Create;
  CheckBox21.Checked := ObRel.FiltrarTipoVenda;
  CheckBox20.Checked := ObRel.FiltrarTipoOS;
  CheckBox19.Checked := ObRel.FiltrarVendedor;
  CheckBox18.Checked := ObRel.FiltrarGrupo;
  label5.Caption := tbsVendaGeral.Caption;
  DBComboBox2.Enabled := false;
	escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsVendaOficinaShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := 'Informações adicionais ' + #13 + #13 +
     'Processo "REL004" HABILITAR VENDEDOR RELATORIO SALDAS PRODUTOS SERVICOS';
  BitBtn1.Hint := 'OK - [REL005]';
  ObRel.free;
  ObRel := TRelatorioVendasOficina.Create;
  CheckBox17.Checked := ObRel.FiltrarTipoVenda;
  CheckBox16.Checked := ObRel.FiltrarVendedor;
  CheckBox15.Checked := ObRel.FiltrarGrupo;
  label5.Caption := tbsVendaOficina.Caption;
  DBComboBox1.Enabled := false;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsVendaVendedorAcrescCondPagVendShow(Sender: TObject);
begin
	inherited;
  imgInformation.Hint := 'Informações adicionais ' + #13 + #13 +
     'Processo "REL064" HABILITAR VENDEDOR RELATORIO SALDAS POR VENDEDOR DE ACORDO COM CONDIÇÃO DE PAGAMENTO E COMISSÃO DO VENDEDOR';
  BitBtn1.Hint := 'OK - [REL063]';
  ObRel.free;
  ObRel := TRelatorioVendasPorVendedorAcrescCondPagVend.Create;
  CheckBox97.Checked := ObRel.FiltrarTipoVenda;
  CheckBox54.Checked := ObRel.FiltrarTipoOS;
  CheckBox98.Checked := ObRel.FiltrarVendedor;
  if (Self.Enabled) and (Self.Visible) and (ComboBox90.CanFocus) then
	  ComboBox90.SetFocus;
  label5.Caption := tbsVendaVendedorAcrescCondPagVend.Caption;
  DBComboBox8.Enabled := false;
	escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsVendaVendedorComissaoFaixaDescShow(Sender: TObject);
begin
  inherited;
	imgInformation.Hint := 'Informações adicionais ' + #13 + #13 +
     'Processo "REL059" HABILITAR VENDEDOR COMISSAO FAIXA DESCONTO';
  BitBtn1.Hint := 'OK - [REL058]';
  ObRel.free;
  ObRel := TRelatorioVendasPorVendedorFaixaDesconto.Create;
  CheckBox77.Checked := ObRel.FiltrarTipoVenda;
  CheckBox76.Checked := ObRel.FiltrarTipoOS;
  CheckBox75.Checked := ObRel.FiltrarVendedor;
  if (Self.Enabled) and (Self.Visible) and (ComboBox62.CanFocus) then
	  ComboBox62.SetFocus;
  label5.Caption := tbsVendaVendedorComissaoFaixaDesc.Caption;
//  DBEdit30.Enabled := false;
	escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsVendaVendedorShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := 'Informações adicionais ' + #13 + #13 +
     'Processo "REL008" HABILITAR VENDEDOR RELATORIO SALDAS POR VENDEDOR';
  BitBtn1.Hint := 'OK - [REL009]';
  ObRel.free;
  ObRel := TRelatorioVendasPorVendedor.Create;
  CheckBox25.Checked := ObRel.FiltrarTipoVenda;
  CheckBox24.Checked := ObRel.FiltrarTipoOS;
  CheckBox23.Checked := ObRel.FiltrarVendedor;
  if (Self.Enabled) and (Self.Visible) and (ComboBox47.CanFocus) then
	  ComboBox47.SetFocus;
  label5.Caption := tbsVendaVendedor.Caption;
  DBComboBox3.Enabled := false;
	escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tsbRelatorioSituacaodoEstoqueFechadoShow(
  Sender: TObject);
begin
  inherited;
  imgInformation.Hint := 'Informações adicionais ' + #13 + #13 +
     'Processo "REL028" HABILITAR VENDEDOR RELATORIO SITUACAO ESTOQUE FECHADO';
  BitBtn1.Hint := 'OK - [REL029]';
  ObRel.free;
  ObRel := TRelatorioSituacaodoEstoqueFechado.Create;
  label5.Caption := tsbRelatorioSituacaodoEstoqueFechado.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRelatorioVeiculosPagosAntecipadosShow(
  Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL037]';
  ObRel.free;
  ObRel := TRelatorioVeiculosPagosAntecipados.Create;
  label5.Caption := tbsRelatorioVeiculosPagosAntecipados.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRelatorioVeiculosQueChegaramAntesDoPagamentoShow(
  Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL038]';
  ObRel.free;
  ObRel := TRelatorioVeiculosQueChegaramAntesDoPagamento.Create;
  label5.Caption := tbsRelatorioVeiculosQueChegaramAntesDoPagamento.Caption;
  MaskEdit6.text:=datetostr(date);
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRelatorioVendasRecProgFidShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL052]';
  ObRel.free;
  ObRel := TRelatoriosVendasProgFid.Create;
//  CheckBox2.Checked := ObRel.ExibirVendaREQ;
//  CheckBox3.Checked := ObRel.ExibirVendaOS;
//  CheckBox4.Checked := ObRel.FiltrarData;
//  CheckBox5.Checked := ObRel.FiltrarObjeto;
  label5.Caption := tbsRelatorioVendasRecProgFid.Caption;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRelatorioPendenciasdeVeiculosShow(Sender: TObject);
begin
  inherited;
   imgInformation.Hint := 'Informações adicionais ' + #13 + #13 +
     'Processo "REL045" HABILITAR VENDEDOR PENDENCIAS VEICULOS';
  BitBtn1.Hint := 'OK - [REL045]';
  escreverComentario(TTabSheet(Sender));
  if CadRelatorio.abreFormSelEmpresas then
  begin
    ObRel.free;
    ObRel := TRelatorioPendenciasdeVeiculos.Create;
    label5.Caption := tbsRelatorioPendenciasdeVeiculos.Caption;
    CheckBox47.Checked := ObRel.FiltrarVendedor;
    EditChassi.Text := '';
    EditPlaca.Text := '';
  end
  else
  begin
    frmRelatorios.fechar := True;
    PostMessage(frmRelatorios.Handle, WM_CLOSE, 0, 0);
  end;
end;

procedure TfrmRelatorios.tbsRelatorioPosicaodeEstoqueVeiculosShow(
  Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL033]';
  ObRel.free;
  ObRel := TRelatorioPosicaodeEstoqueVeiculos.Create;
  ObRel.abrePosicaodeEstoqueVeiculos;
  label5.Caption := tbsRelatorioPosicaodeEstoqueVeiculos.Caption;
  GroupBox1.Visible := False;
  escreverComentario(TTabSheet(Sender));
end;

procedure TfrmRelatorios.tbsRelatorioRecebimentodeVeiculosShow(Sender: TObject);
begin
  inherited;
  imgInformation.Hint := '';
  BitBtn1.Hint := 'OK - [REL042]';
  escreverComentario(TTabSheet(Sender));
  if CadRelatorio.abreFormSelEmpresas then
  begin
    ObRel.free;
    ObRel := TRelatorioRecebimentodeVeiculos.Create;
    label5.Caption := tbsRelatorioRecebimentodeVeiculos.Caption;
  end
  else
  begin
    frmRelatorios.fechar := True;
    PostMessage(frmRelatorios.Handle, WM_CLOSE, 0, 0);
  end;
end;

end.

