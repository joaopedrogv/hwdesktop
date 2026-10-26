unit uCadPedVenda;

interface

uses
  Windows, uCadPadraoModal, Dialogs, uEditMoeda, ExtCtrls, ComCtrls, DBCtrls, StdCtrls, Menus,
  Buttons, Grids, Controls, Mask, Forms, Classes, Spin, SysUtils,
  DB, jpeg, FileCtrl, DBClient, QuickRpt, QRCtrls, grimgctrl,
  AppEvnts, uEditHw, DBGrids, Graphics, IBDatabase, UClassesPedVenda;

type
  TFrmCadPedVenda = class(TfrmCadPadraoM)
    tsOrdemServ: TTabSheet;
    ScrollBox4: TScrollBox;
    panelOS: TPanel;
    GroupBox33: TGroupBox;
    DBEdit76: TDBEdit;
    Label118: TLabel;
    DBEdit77: TDBEdit;
    Label119: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Panel4: TPanel;
    GroupBox6: TGroupBox;
    Label13: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit1: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBEdit7: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    GroupBox4: TGroupBox;
    DBLookupComboBox14: TDBLookupComboBox;
    DBLookupComboBox15: TDBLookupComboBox;
    DBLookupComboBox16: TDBLookupComboBox;
    DBEdit113: TDBEdit;
    Label171: TLabel;
    Label15: TLabel;
    DBEdit115: TDBEdit;
    Panel15: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    SpeedButton13: TSpeedButton;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBLookupComboBox17: TDBLookupComboBox;
    OpenDialog1: TOpenDialog;
    TabSheet20: TTabSheet;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    GroupBox13: TGroupBox;
    Label177: TLabel;
    Label180: TLabel;
    Label181: TLabel;
    Label182: TLabel;
    ComboBox11: TComboBox;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    ComboBox12: TComboBox;
    RadioGroup3: TRadioGroup;
    TabSheet21: TTabSheet;
    lMsg: TPanel;
    CheckBox4: TCheckBox;
    Panel38: TPanel;
    tsMecanicosOS: TTabSheet;
    GroupBox41: TGroupBox;
    GroupBox42: TGroupBox;
    Edit5: TEdit;
    DBGrid60: TDBGrid;
    GroupBox44: TGroupBox;
    DBGrid50: TDBGrid;
    SpeedButton30: TSpeedButton;
    BitBtn86: TBitBtn;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    SpeedButton33: TSpeedButton;
    BitBtn82: TBitBtn;
    DBEdit129: TDBEdit;
    DBLookupComboBox29: TDBLookupComboBox;
    Label189: TLabel;
    tsDetalhePagamento: TTabSheet;
    GroupBox45: TGroupBox;
    DBGrid17: TDBGrid;
    BitBtn84: TBitBtn;
    tsKit: TTabSheet;
    tsFichaOS: TTabSheet;
    qrpFichaOS: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    lbNped: TQRLabel;
    lbNf: TQRLabel;
    lbCNPJ_Emp: TQRLabel;
    lbDtPED: TQRLabel;
    lbNomeCli: TQRLabel;
    lbCPFcli: TQRLabel;
    lbEnderecoCli: TQRLabel;
    lbCidadeUF: TQRLabel;
    lbBairroCli: TQRLabel;
    lbFoneCli: TQRLabel;
    lbFoneTrabCli: TQRLabel;
    lbDtFechOS: TQRLabel;
    lbHoraFechOS: TQRLabel;
    lbEquipamento: TQRLabel;
    lbProblema: TQRLabel;
    lbTecnico: TQRLabel;
    lbFoneTecnico: TQRLabel;
    lbNomeEmp: TQRLabel;
    lbFoneEmp: TQRLabel;
    lbEmailEmp: TQRLabel;
    QRShape1: TQRShape;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    QRHRule3: TQRHRule;
    QRHRule4: TQRHRule;
    QRHRule5: TQRHRule;
    QRHRule6: TQRHRule;
    QRHRule7: TQRHRule;
    QRMemo1: TQRMemo;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRHRule8: TQRHRule;
    QRHRule9: TQRHRule;
    QRHRule12: TQRHRule;
    QRHRule11: TQRHRule;
    QRHRule10: TQRHRule;
    QRHRule15: TQRHRule;
    QRHRule14: TQRHRule;
    QRHRule13: TQRHRule;
    QRHRule16: TQRHRule;
    QRHRule17: TQRHRule;
    QRHRule18: TQRHRule;
    QRHRule19: TQRHRule;
    QRHRule23: TQRHRule;
    QRHRule25: TQRHRule;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRHRule20: TQRHRule;
    Label37: TLabel;
    DBEdit53: TDBEdit;
    SpeedButton17: TSpeedButton;
    TabSheet4: TTabSheet;
    GroupBox9: TGroupBox;
    Label45: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    Label62: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    DBEdit79: TDBEdit;
    DBEdit80: TDBEdit;
    DBEdit81: TDBEdit;
    DBEdit82: TDBEdit;
    DBEdit83: TDBEdit;
    DBEdit84: TDBEdit;
    DBEdit85: TDBEdit;
    DBEdit86: TDBEdit;
    BitBtn46: TBitBtn;
    Label124: TLabel;
    DBText3: TDBText;
    BitBtn52: TBitBtn;
    SpeedButton18: TSpeedButton;
    TabSheet5: TTabSheet;
    GroupBox10: TGroupBox;
    Label131: TLabel;
    DBEdit91: TDBEdit;
    Label132: TLabel;
    DBText6: TDBText;
    Label133: TLabel;
    DBText7: TDBText;
    ScrollBox5: TScrollBox;
    Panel23: TPanel;
    DBGrid14: TDBGrid;
    Panel22: TPanel;
    Label91: TLabel;
    Label95: TLabel;
    Label98: TLabel;
    Label175: TLabel;
    Label176: TLabel;
    Label178: TLabel;
    Label179: TLabel;
    DBEdit49: TDBEdit;
    DBEdit55: TDBEdit;
    DBEdit117: TDBEdit;
    DBEdit118: TDBEdit;
    DBLookupComboBox20: TDBLookupComboBox;
    DBEdit120: TDBEdit;
    DBLookupComboBox21: TDBLookupComboBox;
    DBEdit121: TDBEdit;
    DBLookupComboBox22: TDBLookupComboBox;
    MaskEdit6: TMaskEdit;
    BitBtn48: TBitBtn;
    Panel21: TPanel;
    BitBtn38: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    BitBtn41: TBitBtn;
    BitBtn68: TBitBtn;
    GroupBox11: TGroupBox;
    DBGrid13: TDBGrid;
    Panel20: TPanel;
    Label60: TLabel;
    BitBtn37: TBitBtn;
    EditMoeda2: TEditMoeda;
    BitBtn70: TBitBtn;
    DBEdit92: TDBEdit;
    Label134: TLabel;
    SelecionarORC: TMenuItem;
    tsTransfOrcamento: TTabSheet;
    SelecionarDAVparaMesclagem1: TMenuItem;
    tsOutros: TTabSheet;
    pnTipoVenda: TPanel;
    GroupBox38: TGroupBox;
    DBComboBox4: TDBComboBox;
    BitBtn22: TBitBtn;
    pnCondPag: TPanel;
    GroupBox39: TGroupBox;
    BitBtn23: TBitBtn;
    DBLookupComboBox23: TDBLookupComboBox;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    pnDescontoItem: TPanel;
    GroupBox40: TGroupBox;
    BitBtn55: TBitBtn;
    Label144: TLabel;
    Label146: TLabel;
    edHWValorDesc: TEditHw;
    edHWPercDesc: TEditHw;
    pnAcrescimoItem: TPanel;
    GroupBox49: TGroupBox;
    Label147: TLabel;
    Label148: TLabel;
    edHWValorAcres: TEditHw;
    edHWPercAcres: TEditHw;
    BitBtn57: TBitBtn;
    Label150: TLabel;
    Label151: TLabel;
    SpeedButton19: TSpeedButton;
    Label152: TLabel;
    DBEdit95: TDBEdit;
    DBComboBox6: TDBComboBox;
    DBComboBox7: TDBComboBox;
    pnTipoOrc: TPanel;
    GroupBox50: TGroupBox;
    BitBtn58: TBitBtn;
    ComboBox4: TComboBox;
    pnTipoVendaOrc: TPanel;
    GroupBox51: TGroupBox;
    DBComboBox8: TDBComboBox;
    BitBtn59: TBitBtn;
    Label154: TLabel;
    DBComboBox9: TDBComboBox;
    pnECFSaida: TPanel;
    Panel40: TPanel;
    DBGrid15: TDBGrid;
    Panel41: TPanel;
    btEscolherECFSaida: TBitBtn;
    btCancelarECFSaida: TBitBtn;
    GroupBox52: TGroupBox;
    RemoverStatusdeFechandodaVenda1: TMenuItem;
    tsOSExterna: TTabSheet;
    qrpOSExterna: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText12: TQRDBText;
    QRShape3: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabelHoraEntrada: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRMemo3: TQRMemo;
    QRLabel17: TQRLabel;
    SummaryBand1: TQRBand;
    QRShape4: TQRShape;
    QRDBText19: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabelNomeEmp: TQRLabel;
    QRLabelEnderecoEmp: TQRLabel;
    QRLabelBairroEmp: TQRLabel;
    QRLabelCnpjEmp: TQRLabel;
    QRLabelCepEmp: TQRLabel;
    QRLabelInscEEmp: TQRLabel;
    QRLabelFoneEmp: TQRLabel;
    QRLabelCidadeEmp: TQRLabel;
    QRLabelEmailEmp: TQRLabel;
    QRLabelInscMEmp: TQRLabel;
    QRLabelEnderecoCli: TQRLabel;
    QRLabelFoneCli: TQRLabel;
    QRDBText1: TQRDBText;
    SpeedButton21: TSpeedButton;
    tsOutros2: TTabSheet;
    Label166: TLabel;
    Label167: TLabel;
    DBEdit103: TDBEdit;
    Label170: TLabel;
    BitBtn66: TBitBtn;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    CheckBox8: TCheckBox;
    SpeedButton37: TSpeedButton;
    SpeedButton35: TSpeedButton;
    tsOutros3: TTabSheet;
    pnDisponibilidadeMecanico: TPanel;
    GroupBox60: TGroupBox;
    GroupBox61: TGroupBox;
    DBLookupComboBox25: TDBLookupComboBox;
    GroupBox62: TGroupBox;
    Label186: TLabel;
    SpeedButton36: TSpeedButton;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    BitBtn76: TBitBtn;
    GroupBox63: TGroupBox;
    DBGrid21: TDBGrid;
    GroupBox64: TGroupBox;
    DBLookupComboBox32: TDBLookupComboBox;
    Panel39: TPanel;
    DBGrid22: TDBGrid;
    ScrollBox6: TScrollBox;
    Label197: TLabel;
    Label187: TLabel;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    pnMecanicoEspecifico: TPanel;
    GroupBox8: TGroupBox;
    Panel44: TPanel;
    Panel46: TPanel;
    DBGrid23: TDBGrid;
    BitBtn80: TBitBtn;
    BitBtn81: TBitBtn;
    pnBoxEspecifico: TPanel;
    GroupBox65: TGroupBox;
    Panel47: TPanel;
    BitBtn90: TBitBtn;
    BitBtn91: TBitBtn;
    Panel49: TPanel;
    DBGrid24: TDBGrid;
    SpeedButton38: TSpeedButton;
    DBEdit106: TDBEdit;
    DBLookupComboBox33: TDBLookupComboBox;
    SpeedButton40: TSpeedButton;
    SpeedButton41: TSpeedButton;
    RemoverliberaodoFinanceiro1: TMenuItem;
    SpeedButton42: TSpeedButton;
    SpeedButton43: TSpeedButton;
    pnFormasCliente: TPanel;
    Label199: TLabel;
    gridFormasCliente: TDBGrid;
    Panel51: TPanel;
    BitBtn92: TBitBtn;
    dsFormasCiente: TDataSource;
    tsOutros4: TTabSheet;
    pnOpcoesPagamento: TPanel;
    DBLookupComboBox36: TDBLookupComboBox;
    pnExcluirCancelamento: TPanel;
    Panel58: TPanel;
    btnExcluirCancelamento: TBitBtn;
    gbExcluirCancelamento: TGroupBox;
    DBGridExcluirCancelamento: TDBGrid;
    SpeedButton47: TSpeedButton;
    SpeedButton48: TSpeedButton;
    btnSair: TBitBtn;
    pnCancelarNFSE: TPanel;
    pnOKCancelar: TPanel;
    btnOKCancelar: TBitBtn;
    gbDetalhesCancelamento: TGroupBox;
    meDataCancelamento: TMaskEdit;
    edtMotivoCancelamento: TEdit;
    Label202: TLabel;
    Label203: TLabel;
    Label204: TLabel;
    Label205: TLabel;
    Label206: TLabel;
    SpeedButton51: TSpeedButton;
    SpeedButton52: TSpeedButton;
    Panel14: TPanel;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    GroupBox7: TGroupBox;
    DBGrid2: TDBGrid;
    SpeedButton54: TSpeedButton;
    tsObservacao: TTabSheet;
    pnObservacao: TPanel;
    gbObservacao: TGroupBox;
    DBMemoObservacao: TDBMemo;
    pnObservacaoBotoes: TPanel;
    btnOK: TBitBtn;
    sbEditarObservacao: TSpeedButton;
    RemoverStatusEditando1: TMenuItem;
    SpeedButton46: TSpeedButton;
    BitBtn103: TBitBtn;
    SpeedButton55: TSpeedButton;
    Panel61: TPanel;
    Label200: TLabel;
    PopupMenu4: TPopupMenu;
    DesmarcarAgendamentoLinhaSelecionadas: TMenuItem;
    Panel45: TPanel;
    Panel48: TPanel;
    btEraseAll: TSpeedButton;
    DBLookupComboBox37: TDBLookupComboBox;
    DBEdit126: TDBEdit;
    BitBtn104: TBitBtn;
    pnVendaRapidaPesquisa: TPanel;
    pnVendaRapidaPesquisaBotoes: TPanel;
    btVendaRapidaPesquisaEditar: TSpeedButton;
    btVendaRapidaPesquisaExcluir: TSpeedButton;
    btVendaRapidaPesquisaImprimir: TSpeedButton;
    btVendaRapidaPesquisaConfirmar: TSpeedButton;
    btVendaRapidaPesquisaReabrir: TSpeedButton;
    btVendaRapidaPesquisaEmiteCupom: TSpeedButton;
    btVendaRapidaPesquisaNova: TSpeedButton;
    btVendaRapidaPesquisaVolta: TSpeedButton;
    pnVendaRapidaPesquisaPesquisa: TPanel;
    lbVendaRapidaPesquisaDtaIni: TLabel;
    lbVendaRapidaPesquisaDtaFim: TLabel;
    edVendaRapidaPesquisaDataIni: TMaskEdit;
    edVendaRapidaPesquisaDataFim: TMaskEdit;
    btVendaRapidaPesquisaProcurar: TBitBtn;
    pnVendaRapidaPesquisaGrid: TPanel;
    gridVendaRapidaPesquisa: TDBGrid;
    Label218: TLabel;
    Label219: TLabel;
    CheckBox9: TCheckBox;
    BitBtn106: TBitBtn;
    Panel63: TPanel;
    BitBtn49: TBitBtn;
    BitBtn50: TBitBtn;
    BitBtn108: TBitBtn;
    SpeedButton10: TSpeedButton;
    tsFaturasServTerc: TTabSheet;
    pnFaturaPd: TPanel;
    Panel70: TPanel;
    BitBtn110: TBitBtn;
    BitBtn111: TBitBtn;
    GroupBox69: TGroupBox;
    Label228: TLabel;
    Label229: TLabel;
    Label230: TLabel;
    Edit14: TEdit;
    EditHw3: TEditHw;
    edcreditoQtdeParcelas: TSpinEdit;
    Panel72: TPanel;
    btGerar: TBitBtn;
    btApagarDesp: TBitBtn;
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
    dsDesp: TDataSource;
    Panel65: TPanel;
    GroupBox68: TGroupBox;
    Panel71: TPanel;
    edDocFaturaEntrada: TEdit;
    edValorFaturaEntrada: TEditHw;
    edVencimentoFaturaEntrada: TMaskEdit;
    btSalvarFaturaEntrada: TBitBtn;
    ListBox3: TListBox;
    btAlterarFaturaEntrada: TBitBtn;
    SpeedButton16: TSpeedButton;
    pnDetFaturas: TPanel;
    Panel67: TPanel;
    BitBtn112: TBitBtn;
    BitBtn113: TBitBtn;
    DBGrid28: TDBGrid;
    Label236: TLabel;
    DBComboBox14: TDBComboBox;
    DBComboBox15: TDBComboBox;
    DBEdit136: TDBEdit;
    Panel68: TPanel;
    PageControl2: TPageControl;
    PageControl5: TPageControl;
    ts_cliente: TTabSheet;
    ts_status_os: TTabSheet;
    ts_separacao: TTabSheet;
    ts_devolucao: TTabSheet;
    pnStatusOS: TPanel;
    PageControl6: TPageControl;
    ts_sep_impressao: TTabSheet;
    ts_sep_botoes: TTabSheet;
    pnImpressaoSeparacao: TPanel;
    Panel59: TPanel;
    Label208: TLabel;
    Label209: TLabel;
    Label210: TLabel;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    BitBtn100: TBitBtn;
    BitBtn101: TBitBtn;
    pnSeparacao: TPanel;
    Label207: TLabel;
    Panel57: TPanel;
    BitBtn95: TBitBtn;
    BitBtn96: TBitBtn;
    BitBtn97: TBitBtn;
    BitBtn98: TBitBtn;
    BitBtn99: TBitBtn;
    Edit1: TEdit;
    pnDevolucao: TPanel;
    GroupBox56: TGroupBox;
    GroupBox58: TGroupBox;
    EditFiscalCodBarraDev: TEditFiscal;
    GroupBox59: TGroupBox;
    DBGrid20: TDBGrid;
    GroupBox57: TGroupBox;
    Label173: TLabel;
    Label183: TLabel;
    Label184: TLabel;
    Label185: TLabel;
    BitBtn72: TBitBtn;
    BitBtn75: TBitBtn;
    page_cliente: TPageControl;
    ts_cliente_avulso: TTabSheet;
    ts_cliente_vnd: TTabSheet;
    ts_cliente_enderecos_add: TTabSheet;
    pnClienteAvulso: TPanel;
    GroupBox53: TGroupBox;
    Label155: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    Label161: TLabel;
    Label188: TLabel;
    Label193: TLabel;
    DBEdit97: TDBEdit;
    DBEdit98: TDBEdit;
    DBEdit99: TDBEdit;
    DBEdit100: TDBEdit;
    DBEdit101: TDBEdit;
    DBEdit102: TDBEdit;
    DBEdit124: TDBEdit;
    DBEdit125: TDBEdit;
    BitBtn61: TBitBtn;
    pnClienteVND: TPanel;
    GroupBox55: TGroupBox;
    Label143: TLabel;
    DBEdit104: TDBEdit;
    DBLookupComboBox28: TDBLookupComboBox;
    BitBtn67: TBitBtn;
    pn_cliente_dests: TPanel;
    Panel74: TPanel;
    Panel75: TPanel;
    bt_cliente_dests_utilizar_principal: TBitBtn;
    BitBtn115: TBitBtn;
    grid_cliente_dests: TDBGrid;
    bt_cliente_endadd_req: TSpeedButton;
    bt_cliente_dests_utilizar_entrega: TBitBtn;
    Label237: TLabel;
    Label238: TLabel;
    Panel73: TPanel;
    Panel76: TPanel;
    group_cliente_enddoc_minuta: TGroupBox;
    DBMemo9: TDBMemo;
    bt_cliente_endadd_os: TSpeedButton;
    SpeedButton56: TSpeedButton;
    ts_precos: TTabSheet;
    PageControl7: TPageControl;
    ts_precos_ultimos: TTabSheet;
    pn_precos_ultimos: TPanel;
    Panel78: TPanel;
    grid_ultimos_precos: TDBGrid;
    Panel79: TPanel;
    bt_preco_ultimo_utilizar: TBitBtn;
    BitBtn116: TBitBtn; 
    ts_nf_valores: TTabSheet;
    pn_valores_nf: TPanel;
    pn_valores_nf_client: TPanel;
    pn_valores_nf_bottom: TPanel;
    bt_valors_nf_voltar: TBitBtn;
    pn_valores_nf_dados: TPanel;
    pn_valores_nf_tv: TPanel;
    tv_nf_valores: TTreeView;
    lb_nf_ac_outras: TLabel;
    ed_nf_ac_outras: TDBEdit;
    lb_nf_ac_seguro: TLabel;
    ed_nf_ac_seguro: TDBEdit;
    lb_nf_ac_frete: TLabel;
    ed_nf_ac_frete: TDBEdit;
    lb_nf_ac_ipi: TLabel;
    ed_nf_ac_ipi: TDBEdit;
    lb_nf_ac_icmsst: TLabel;
    ed_nf_ac_icmsst: TDBEdit;
    lb_nf_ac_fcpst: TLabel;
    ed_nf_ac_fcpst: TDBEdit;
    lb_nf_ac_imposto_ii: TLabel;
    ed_nf_ac_imposto_ii: TDBEdit;
    bt_obter_valores_nf: TBitBtn;
    pn_valores_nf_tot_e_acres: TPanel;
    lb_acrescimo_valores_nf: TLabel;
    ed_acrescimo_valores_nf: TDBEdit;
    lb_valor_total_valores_nf: TLabel;
    ed_valor_total_valores_nf: TDBEdit;
    ed_nf_ac_calctrib: TDBLookupComboBox;
    lb_nf_ac_calctrib: TLabel;
    lb_nf_freteconta: TLabel;
    ed_nf_freteconta: TDBLookupComboBox;
    bt_ultimos_precos: TSpeedButton;
    bt_adicionar_ao_faturamento: TSpeedButton;
    SpeedButton57: TSpeedButton;
    ts_fat_lote_sel: TTabSheet;
    pn_fat_lote_sel: TPanel;
    Panel84: TPanel;
    grid_fat_lote_sel: TDBGrid;
    Panel85: TPanel;
    BitBtn117: TBitBtn;
    BitBtn114: TBitBtn;
    bt_fat_lote_sel_tick: TSpeedButton;
    bt_fat_lote_sel_untick: TSpeedButton;
    Panel77: TPanel;
    Panel80: TPanel;
    Panel81: TPanel;
    Panel82: TPanel;
    tsEcommerce: TTabSheet;
    pnEcommerce: TPanel;
    groupEcommerce: TGroupBox;
    pnEcomm_bottom: TPanel;
    bt_ecomm_ok: TBitBtn;
    bt_ecomm_cancel: TBitBtn;
    SpeedButton58: TSpeedButton;
    pnEcomm_top: TPanel;
    Label239: TLabel;
    DBText39: TDBText;
    Label244: TLabel;
    DBText12: TDBText;
    Label241: TLabel;
    DBText13: TDBText;
    grouEcomm_frete_envio: TGroupBox;
    Label240: TLabel;
    Label242: TLabel;
    Label243: TLabel;
    SpeedButton59: TSpeedButton;
    Label245: TLabel;
    DBEdit138: TDBEdit;
    DBEdit139: TDBEdit;
    DBLookupComboBox39: TDBLookupComboBox;
    DBEdit137: TDBEdit;
    grou_Ecomm_status: TGroupBox;
    lkecomm_status: TDBLookupComboBox;
    Label246: TLabel;
    ComboBoxStatusEC: TComboBox;
    DBText14: TDBText;
    Panel83: TPanel;
    DBText11: TDBText;
    lb_nf_dc_desconto: TLabel;
    ed_nf_dc_desconto: TDBEdit;
    lb_nf_ac_vicmdeson: TLabel;
    ed_nf_ac_vicmdeson: TDBEdit;
    lb_nf_dc_vicmdeson: TLabel;
    ed_nf_dc_vicmdeson: TDBEdit;
    lb_nf_cf_deson: TLabel;
    ed_nf_cf_deson_emb: TDBLookupComboBox;
    lb_desconto_valor: TLabel;
    ed_desconto_valor: TDBEdit;
    ed_desc_p_prod: TDBEdit;
    el_perc_desconto: TLabel;
    bt_notas_vinculadas: TSpeedButton;
    tsProdSimilar: TTabSheet;
    PnProdSimilar: TPanel;
    PanelProdSimilarBottom: TPanel;
    BitBtnSalvarProdSimilar: TBitBtn;
    BitBtnCancelarProdSimilar: TBitBtn;
    GroupBoxProd: TGroupBox;
    DBTextDescrProd: TDBText;
    LabelGrupoProd: TLabel;
    DBTextGrupoProd: TDBText;
    LabelCodProd: TLabel;
    DBTextCodProd: TDBText;
    LabelNumFab: TLabel;
    DBTextNumFab: TDBText;
    GroupBoxProdSim: TGroupBox;
    DBGridProdSim: TDBGrid;
    pn_dev_ped_itens: TPanel;
    grid_dev_ped_itens: TDBGrid;
    ck_exibir_devolucao: TCheckBox;
    Splitter_dev_itens: TSplitter;
    GroupBox72: TGroupBox;
    DBText4: TDBText;
    Label129: TLabel;
    GroupBoxOpcoesAlterarVendCli: TGroupBox;
    pnKitProd: TPanel;
    GroupBox46: TGroupBox;
    Panel69: TPanel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    EditMoeda6: TEditMoeda;
    DBLookupComboBox31: TDBLookupComboBox;
    CheckBox6: TCheckBox;
    BitBtn88: TBitBtn;
    BitBtn89: TBitBtn;
    DBEdit78: TDBEdit;
    DBLookupComboBox10: TDBLookupComboBox;
    DBEdit87: TDBEdit;
    DBLookupComboBox11: TDBLookupComboBox;
    GroupBox47: TGroupBox;
    DBGrid18: TDBGrid;
    GroupBox48: TGroupBox;
    DBGrid19: TDBGrid;
    Panel43: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    SpeedButton9: TSpeedButton;
    DBText5: TDBText;
    SpeedButton34: TSpeedButton;
    SpeedButton45: TSpeedButton;
    bt_show_form_valores_nf_req: TSpeedButton;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    GroupBox15: TGroupBox;
    ScrollBox7: TScrollBox;
    pgOS: TPageControl;
    tsOS: TTabSheet;
    GroupBox21: TGroupBox;
    Label38: TLabel;
    Label49: TLabel;
    Label48: TLabel;
    Label41: TLabel;
    Label39: TLabel;
    Label50: TLabel;
    Label46: TLabel;
    Label40: TLabel;
    Label47: TLabel;
    Label79: TLabel;
    Label191: TLabel;
    Label192: TLabel;
    Label190: TLabel;
    SpeedButton53: TSpeedButton;
    DBLookupComboBox30: TDBLookupComboBox;
    DBComboBox3: TDBComboBox;
    DBEdit36: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit34: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit42: TDBEdit;
    DBComboBox5: TDBComboBox;
    DBEdit131: TDBEdit;
    CheckBox5: TCheckBox;
    DBEdit130: TDBEdit;
    GroupBox22: TGroupBox;
    Image1: TImage;
    PageControl4: TPageControl;
    TabSheet10: TTabSheet;
    GroupBox16: TGroupBox;
    Label64: TLabel;
    Label65: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Shape1: TShape;
    Label69: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    DBEdit32: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    Memo1: TMemo;
    BitBtn7: TBitBtn;
    BitBtn15: TBitBtn;
    TrackBar1: TTrackBar;
    TabSheet11: TTabSheet;
    GroupBox34: TGroupBox;
    Label74: TLabel;
    Label73: TLabel;
    Label75: TLabel;
    SpeedButton27: TSpeedButton;
    Memo2: TMemo;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    BitBtn21: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn87: TBitBtn;
    TabSheet12: TTabSheet;
    GroupBox35: TGroupBox;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Memo3: TMemo;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    DBGrid4: TDBGrid;
    TabSheet6: TTabSheet;
    Label215: TLabel;
    Label214: TLabel;
    Label216: TLabel;
    Label217: TLabel;
    DBMemo6: TDBMemo;
    DBMemo1: TDBMemo;
    DBMemo7: TDBMemo;
    DBMemo8: TDBMemo;
    GroupBox23: TGroupBox;
    Label86: TLabel;
    Label80: TLabel;
    Label83: TLabel;
    Label85: TLabel;
    Label84: TLabel;
    DBEdit43: TDBEdit;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBMemo5: TDBMemo;
    DBMemo4: TDBMemo;
    tsServOS: TTabSheet;
    GroupBox17: TGroupBox;
    Panel10: TPanel;
    Label222: TLabel;
    Label223: TLabel;
    BitBtn14: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    BitBtn85: TBitBtn;
    Panel17: TPanel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label104: TLabel;
    Label57: TLabel;
    Label99: TLabel;
    Label103: TLabel;
    Label194: TLabel;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit62: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit61: TDBEdit;
    DBEdit48: TDBEdit;
    DBLookupComboBox19: TDBLookupComboBox;
    DBEdit56: TDBEdit;
    DBLookupComboBox6: TDBLookupComboBox;
    DBEdit60: TDBEdit;
    DBLookupComboBox7: TDBLookupComboBox;
    DBEdit105: TDBEdit;
    DBGrid5: TDBGrid;
    tsProdOS: TTabSheet;
    GroupBox24: TGroupBox;
    Panel16: TPanel;
    Label66: TLabel;
    Label88: TLabel;
    SpeedButton15: TSpeedButton;
    Label89: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label97: TLabel;
    Label87: TLabel;
    Label96: TLabel;
    Label137: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label234: TLabel;
    DBEdit44: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit116: TDBEdit;
    DBEdit45: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    DBEdit54: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    DBEdit94: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBLookupComboBox8: TDBLookupComboBox;
    DBComboBox10: TDBComboBox;
    DBComboBox11: TDBComboBox;
    DBEdit134: TDBEdit;
    Panel13: TPanel;
    Label220: TLabel;
    Label221: TLabel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn105: TBitBtn;
    BitBtn107: TBitBtn;
    pn_grid_os: TPanel;
    splitter_dev_os_itens: TSplitter;
    DBGrid3: TDBGrid;
    pn_dev_os_itens: TPanel;
    grid_dev_os_itens: TDBGrid;
    tsServTercOS: TTabSheet;
    GroupBox20: TGroupBox;
    Panel19: TPanel;
    GroupBox71: TGroupBox;
    Label250: TLabel;
    Label251: TLabel;
    DBEdit144: TDBEdit;
    DBEdit145: TDBEdit;
    DBEdit146: TDBEdit;
    DBGrid6: TDBGrid;
    Panel11: TPanel;
    Label224: TLabel;
    Label225: TLabel;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    BitBtn35: TBitBtn;
    BitBtn36: TBitBtn;
    tsProdTercOS: TTabSheet;
    GroupBox27: TGroupBox;
    Panel18: TPanel;
    GroupBox70: TGroupBox;
    Label248: TLabel;
    Label249: TLabel;
    Label247: TLabel;
    DBEdit141: TDBEdit;
    DBEdit142: TDBEdit;
    DBEdit143: TDBEdit;
    DBEdit140: TDBEdit;
    tsOutrosOS: TTabSheet;
    GroupBox31: TGroupBox;
    Edit3: TEdit;
    GroupBox32: TGroupBox;
    RichEdit1: TRichEdit;
    GroupBox43: TGroupBox;
    DBGrid8: TDBGrid;
    GroupBox14: TGroupBox;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label58: TLabel;
    SpeedButton14: TSpeedButton;
    Label81: TLabel;
    DBText2: TDBText;
    SpeedButton50: TSpeedButton;
    spSwitchDesc1: TSpeedButton;
    lbDescProdVal: TLabel;
    lbDescServVal: TLabel;
    bt_show_form_valores_nf_os: TSpeedButton;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    pnDescValorOS: TPanel;
    lbDescProdValor: TLabel;
    lbDescServValor: TLabel;
    lbDescProdPerc: TLabel;
    lbDescServPerc: TLabel;
    edDescProdValor: TEditHw;
    edDescServValor: TEditHw;
    Panel9: TPanel;
    ScrollBox8: TScrollBox;
    Panel24: TPanel;
    Panel87: TPanel;
    imgLogo: TImage;
    imgHw: TImage;
    Panel35: TPanel;
    Panel6: TPanel;
    Label138: TLabel;
    Label139: TLabel;
    DBText8: TDBText;
    DBText9: TDBText;
    Label153: TLabel;
    DBText10: TDBText;
    GroupBox28: TGroupBox;
    eSubTotal: TEditMoeda;
    GroupBox29: TGroupBox;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel27: TPanel;
    Panel8: TPanel;
    Panel86: TPanel;
    pnAtalhosPesquiarVenda: TPanel;
    pnAtalhosNovoPedVenda: TPanel;
    pnAtalhoKit: TPanel;
    ldescricao: TPanel;
    pgVendaRapida: TPageControl;
    tsItens: TTabSheet;
    GroupBox26: TGroupBox;
    eVlUnit: TEditMoeda;
    edCodBarra: TEditFiscal;
    Panel37: TPanel;
    GroupBox36: TGroupBox;
    splitter_dev_rap_itens: TSplitter;
    DBGrid12: TDBGrid;
    pn_dev_rap_itens: TPanel;
    grid_dev_rap_itens: TDBGrid;
    tsFechamento: TTabSheet;
    Panel26: TPanel;
    Label109: TLabel;
    Label111: TLabel;
    Label145: TLabel;
    Label149: TLabel;
    Label156: TLabel;
    Label163: TLabel;
    Label164: TLabel;
    Label165: TLabel;
    SpeedButton20: TSpeedButton;
    Label195: TLabel;
    SpeedButton44: TSpeedButton;
    bt_cliente_endadd_req_rap: TSpeedButton;
    bt_show_form_valores_nf_reqrap: TSpeedButton;
    DBEdit67: TDBEdit;
    DBLookupComboBox13: TDBLookupComboBox;
    DBEdit70: TDBEdit;
    DBLookupComboBox26: TDBLookupComboBox;
    DBEdit108: TDBEdit;
    DBLookupComboBox27: TDBLookupComboBox;
    DBEdit109: TDBEdit;
    DBEdit110: TDBEdit;
    DBEdit111: TDBEdit;
    DBEdit112: TDBEdit;
    DBEdit114: TDBEdit;
    DBEdit107: TDBEdit;
    DBLookupComboBox34: TDBLookupComboBox;
    tsCancelarItens: TTabSheet;
    GroupBox30: TGroupBox;
    tsAlteraPreco: TTabSheet;
    Panel36: TPanel;
    Label168: TLabel;
    Label169: TLabel;
    Label135: TLabel;
    lbQuantidadeVendaRapida: TLabel;
    Label233: TLabel;
    Label235: TLabel;
    bt_ultimos_precos_vnd_rap: TSpeedButton;
    edValorUnitarioVendaRapida: TEditMoeda;
    MaskEdit7: TMaskEdit;
    DBEdit93: TDBEdit;
    edQuantidadeVendaRapida: TEditMoeda;
    Panel64: TPanel;
    BitBtn74: TBitBtn;
    BitBtn73: TBitBtn;
    BitBtn109: TBitBtn;
    DBComboBox12: TDBComboBox;
    DBComboBox13: TDBComboBox;
    DBEdit135: TDBEdit;
    GroupBox5: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    Panel56: TPanel;
    Panel62: TPanel;
    Panel7: TPanel;
    Label108: TLabel;
    Label110: TLabel;
    DBEdit65: TDBEdit;
    DBEdit66: TDBEdit;
    Panel25: TPanel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    DBEdit68: TDBEdit;
    DBEdit69: TDBEdit;
    DBEdit71: TDBEdit;
    DBEdit72: TDBEdit;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    DBLookupComboBox9: TDBLookupComboBox;
    Panel88: TPanel;
    BitBtn42: TBitBtn;
    Panel89: TPanel;
    BitBtn43: TBitBtn;
    BitBtn44: TBitBtn;
    Panel90: TPanel;
    BitBtn45: TBitBtn;
    GroupBox19: TGroupBox;
    DBGrid9: TDBGrid;
    Panel91: TPanel;
    Label90: TLabel;
    Label198: TLabel;
    CheckBox2: TCheckBox;
    GroupBox18: TGroupBox;
    BitBtn54: TBitBtn;
    BitBtn56: TBitBtn;
    DBGrid7: TDBGrid;
    Panel12: TPanel;
    Label226: TLabel;
    Label227: TLabel;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn31: TBitBtn;
    BitBtn32: TBitBtn;
    dbObsReqSemLimite: TDBMemo;
    Panel31: TPanel;
    SpeedButton49: TSpeedButton;
    Panel34: TPanel;
    BitBtn71: TBitBtn;
    BitBtn83: TBitBtn;
    dbObsReqSemLimiteRap: TDBMemo;
    btEditoObsReq: TSpeedButton;
    SpeedButtonWhatsApp: TSpeedButton;
    Shape5: TShape;
    Label252: TLabel;
    Panel95: TPanel;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    tsVndRapMaisAcoes: TTabSheet;
    pn_vnd_rap_mais: TPanel;
    lbListActions: TListBox;
    SpeedButton60: TSpeedButton;
    Panel100: TPanel;
    BitBtn78: TBitBtn;
    BitBtn77: TBitBtn;
    MaskEdit14: TMaskEdit;
    Panel101: TPanel;
    BitBtn64: TBitBtn;
    BitBtn65: TBitBtn;
    bt_alt_hora_entrada: TSpeedButton;
    bt_alt_hora_prometida: TSpeedButton;
    SpeedButtonLucratividade: TSpeedButton;
    SpeedButtonLucratividade2: TSpeedButton;
    pnStatusCanc: TPanel;
    pnDevParcial: TPanel;
    pnDevTotal: TPanel;
    DevolucaoPedido: TMenuItem;
    Panel96: TPanel;
    BitBtn93: TBitBtn;
    BitBtn94: TBitBtn;
    Panel98: TPanel;
    Label201: TLabel;
    Label211: TLabel;
    Label212: TLabel;
    DBEdit122: TDBEdit;
    DBEdit123: TDBEdit;
    Panel60: TPanel;
    GroupBox67: TGroupBox;
    DBGrid27: TDBGrid;
    Panel97: TPanel;
    Panel42: TPanel;
    Panel50: TPanel;
    Splitter3: TSplitter;
    DBEdit147: TDBEdit;
    DBLookupComboBox40: TDBLookupComboBox;
    Label253: TLabel;
    pnCondPagPolitica: TPanel;
    Label254: TLabel;
    DBEdit148: TDBEdit;
    DBLookupComboBox41: TDBLookupComboBox;
    Panel102: TPanel;
    BitBtn120: TBitBtn;
    BitBtn121: TBitBtn;
    Panel103: TPanel;
    Panel104: TPanel;
    DBGrid25: TDBGrid;
    SpeedButton61: TSpeedButton;
    Label255: TLabel;
    ckListaTodasPoliticas: TCheckBox;
    GroupBox66: TPanel;
    Panel52: TPanel;
    Panel99: TPanel;
    Panel105: TPanel;
    Panel106: TPanel;
    Panel107: TPanel;
    SpeedButton62: TSpeedButton;
    DBEdit149: TDBEdit;
    DBLookupComboBox42: TDBLookupComboBox;
    Label256: TLabel;
    DBComboBox16: TDBComboBox;
    Label21: TLabel;
    DBComboBox17: TDBComboBox;
    Label257: TLabel;
    DBEdit132: TDBEdit;
    bt_ultimos_precos_vnd_os: TSpeedButton;
    Label231: TLabel;
    DBEdit13: TDBEdit;
    DBComboBoxUnVendaRapida: TDBComboBox;
    Label258: TLabel;
    edValorTotalVendaRapida: TEditMoeda;
    pnDevolucaoUnidade: TPanel;
    pnDevolucaoUnidadeButtom: TPanel;
    btnDevolucaoUnidadeOK: TBitBtn;
    btDevolucaoUnidadeCancel: TBitBtn;
    ComboBoxDevolucaoUn: TComboBox;
    Label232: TLabel;
    LabelInfConversaoSaida: TLabel;
    LabelInfGrupoConversaoSaida: TLabel;
    LabelInfCodProdConversaoSaida: TLabel;
    Panel112: TPanel;
    Panel108: TPanel;
    Panel109: TPanel;
    Panel110: TPanel;
    Panel111: TPanel;
    Panel66: TPanel;
    lbUnidadeOS: TLabel;
    DBUnidadeREQ: TDBEdit;
    DBUnidadeOS: TDBEdit;
    ComboBox8: TComboBox;
    GroupBox75: TGroupBox;
    ComboBoxOpMesclar: TComboBox;
    Label136: TLabel;
    MaskEdit11: TMaskEdit;
    CheckBox7: TCheckBox;
    PageControl8: TPageControl;
    tsMesclar: TTabSheet;
    tsMesclarProdutos: TTabSheet;
    Splitter4: TSplitter;
    Splitter5: TSplitter;
    tsMesclarServicos: TTabSheet;
    tsMesclarProdutosTerceiro: TTabSheet;
    tsMesclarServicosTerceiro: TTabSheet;
    Splitter6: TSplitter;
    CheckBoxProdServEmAbas: TCheckBox;
    PanelProdutosMesclar: TPanel;
    GroupBoxProdutosMesclar: TGroupBox;
    DBGrid10: TDBGrid;
    Panel5: TPanel;
    PanelServicosTerceiroMesclar: TPanel;
    GroupBoxServicosTerceiroMesclar: TGroupBox;
    DBGrid30: TDBGrid;
    Panel94: TPanel;
    PanelServicosMesclar: TPanel;
    GroupBoxServicosMesclar: TGroupBox;
    DBGrid11: TDBGrid;
    Panel92: TPanel;
    PanelProdutosTerceiroMesclar: TPanel;
    GroupBoxProdutosTerceiroMesclar: TGroupBox;
    DBGrid29: TDBGrid;
    Panel93: TPanel;
    GroupBox_12: TGroupBox;
    ScrollBox_12: TScrollBox;
    GroupBox_2: TGroupBox;
    ScrollBox_2: TScrollBox;
    PopupMenu_2: TPopupMenu;
    Configurarcolunas_2: TMenuItem;
    ResetarConfiguraesdecolunas_2: TMenuItem;
    ReajustarLarguradascolunas_2: TMenuItem;
    GroupBox_3: TGroupBox;
    ScrollBox_3: TScrollBox;
    PopupMenu_3: TPopupMenu;
    Configurarcolunas_3: TMenuItem;
    ResetarConfiguraesdecolunas_3: TMenuItem;
    ReajustarLarguradascolunas_3: TMenuItem;
    GroupBox_5: TGroupBox;
    ScrollBox_5: TScrollBox;
    PopupMenu_5: TPopupMenu;
    Configurarcolunas_5: TMenuItem;
    ResetarConfiguraesdecolunas_5: TMenuItem;
    ReajustarLarguradascolunas_5: TMenuItem;
    PopupMenu_6: TPopupMenu;
    Configurarcolunas_6: TMenuItem;
    ResetarConfiguraesdecolunas_6: TMenuItem;
    ReajustarLarguradascolunas_6: TMenuItem;
    PopupMenu_7: TPopupMenu;
    Configurarcolunas_7: TMenuItem;
    ResetarConfiguraesdecolunas_7: TMenuItem;
    ReajustarLarguradascolunas_7: TMenuItem;
    GroupBox_6: TGroupBox;
    ScrollBox_6: TScrollBox;
    GroupBox_7: TGroupBox;
    ScrollBox_7: TScrollBox;
    PopupMenu_12: TPopupMenu;
    Configurarcolunas_12: TMenuItem;
    ResetarConfiguraesdecolunas_12: TMenuItem;
    ReajustarLarguradascolunas_12: TMenuItem;
    Copiarparareadetransferncia_2: TMenuItem;
    Copiarparareadetransferncia_3: TMenuItem;
    Copiarparareadetransferncia_5: TMenuItem;
    Copiarparareadetransferncia_6: TMenuItem;
    Copiarparareadetransferncia_7: TMenuItem;
    Copiarparareadetransferncia_12: TMenuItem;
    GroupBox12: TGroupBox;
    Panel114: TPanel;
    Panel115: TPanel;
    Panel116: TPanel;
    Panel117: TPanel;
    Panel113: TPanel;
    btUnSelectAllProdutosMesclar: TSpeedButton;
    btUnSelectAllServicosMesclar: TSpeedButton;
    btUnSelectAllServicosTerceirosMesclar: TSpeedButton;
    btUnSelectAllProdutosTerceirosMesclar: TSpeedButton;
    btSelectAllProdutosMesclar: TSpeedButton;
    btSelectAllServicosMesclar: TSpeedButton;
    btSelectAllServicosTerceiroMesclar: TSpeedButton;
    btSelectAllProdutosTerceiroMesclar: TSpeedButton;
    Panel118: TPanel;
    Panel119: TPanel;
    Panel120: TPanel;
    Panel121: TPanel;
    Panel122: TPanel;
    Panel123: TPanel;
    Panel124: TPanel;
    DBGrid26: TDBGrid;
    Panel125: TPanel;
    SpeedButton63: TSpeedButton;
    SpeedButton64: TSpeedButton;
    SpeedButton66: TSpeedButton;
    tsConfirmarDoc: TTabSheet;
    pnConfirmarDoc: TPanel;
    Panel126: TPanel;
    btConfirmarDocOK: TBitBtn;
    btConfirmarDocCancel: TBitBtn;
    GroupBox25: TGroupBox;
    Label259: TLabel;
    GroupBox37: TGroupBox;
    ckEmitirNFeConf: TCheckBox;
    ckEmitirNFCeConf: TCheckBox;
    SpeedButtonWhatsApp2: TSpeedButton;
    btVendaRapidaPesquisaEmitenf: TSpeedButton;
    pnEmitirDoc: TPanel;
    Panel128: TPanel;
    btEmitirDocOK: TBitBtn;
    btEmitirDocCancel: TBitBtn;
    GroupBox73: TGroupBox;
    Label260: TLabel;
    GroupBox74: TGroupBox;
    ckEmitirNFeDoc: TCheckBox;
    ckEmitirNFCeDoc: TCheckBox;
    ckEmitirNFSeDoc: TCheckBox;
    ImgInfDoc: TImage;
    ImgInfConf: TImage;
    ckEmitirNFSeConf: TCheckBox;
    SpeedButton65: TSpeedButton;
    SpeedButton67: TSpeedButton;
    tsAcrescCondPagComissaoVend: TTabSheet;
    pnAcrescCondPagComissaoVend: TPanel;
    Panel129: TPanel;
    BitBtn60: TBitBtn;
    GroupBox76: TGroupBox;
    Label261: TLabel;
    Panel127: TPanel;
    Label263: TLabel;
    DBEdit133: TDBEdit;
    SpeedButton68: TSpeedButton;
    RadioGroup4: TRadioGroup;
    Label262: TLabel;
    DBEdit128: TDBEdit;
    Label264: TLabel;
    DBEdit150: TDBEdit;
    DBEdit151: TDBEdit;
    Label265: TLabel;
    Label266: TLabel;
    DBEdit152: TDBEdit;
    Label174: TLabel;
    DBEdit75: TDBEdit;
    Label267: TLabel;
    DBEdit153: TDBEdit;
    Timer2: TTimer;
    Panel131: TPanel;
    EditHw1: TEditHw;
    BitBtn51: TBitBtn;
    BitBtn69: TBitBtn;
    Panel130: TPanel;
    Panel132: TPanel;
    Panel133: TPanel;
    Panel134: TPanel;
    Panel135: TPanel;
    Panel136: TPanel;
    Panel137: TPanel;
    Panel138: TPanel;
    Panel139: TPanel;
    Label162: TLabel;
    SpeedButton22: TSpeedButton;
    DBLookupComboBox24: TDBLookupComboBox;
    Panel140: TPanel;
    BitBtn62: TBitBtn;
    BitBtn63: TBitBtn;
    Panel141: TPanel;
    DBGrid16: TDBGrid;
    DBEdit154: TDBEdit;
    Label172: TLabel;
    bt_alt_hora_prometida2: TSpeedButton;
    pnAcrescValorOS: TPanel;
    lbAcrescServValor: TLabel;
    lbAcrescProdPerc: TLabel;
    lbAcrescServPerc: TLabel;
    edAcrescProdValor: TEditHw;
    Label272: TLabel;
    Label274: TLabel;
    Label44: TLabel;
    Label52: TLabel;
    Label59: TLabel;
    DBEdit155: TDBEdit;
    Label276: TLabel;
    DBEdit156: TDBEdit;
    spSwitchAcresc: TSpeedButton;
    Label277: TLabel;
    DBEdit157: TDBEdit;
    edAcrescServValor: TEditHw;
    lbAcrescProdVal: TLabel;
    lbAcrescServVal: TLabel;
    lbAcrescProdValor: TLabel;
    Label268: TLabel;
    DBText15: TDBText;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText18: TDBText;
    Label63: TLabel;
    DBEdit158: TDBEdit;
    PageControl10: TPageControl;
    TabSheet13: TTabSheet;
    TabSheet14: TTabSheet;
    TabSheet15: TTabSheet;
    GroupBox54: TGroupBox;
    Label128: TLabel;
    Label130: TLabel;
    Label196: TLabel;
    SpeedButton39: TSpeedButton;
    Label213: TLabel;
    DBEdit88: TDBEdit;
    DBLookupComboBox12: TDBLookupComboBox;
    DBEdit90: TDBEdit;
    DBLookupComboBox18: TDBLookupComboBox;
    DBEdit119: TDBEdit;
    DBLookupComboBox35: TDBLookupComboBox;
    DBEdit127: TDBEdit;
    DBLookupComboBox38: TDBLookupComboBox;
    GroupBox77: TGroupBox;
    Panel143: TPanel;
    Label42: TLabel;
    DBLookupComboBox43: TDBLookupComboBox;
    Label43: TLabel;
    DBLookupComboBox44: TDBLookupComboBox;
    GroupBox78: TGroupBox;
    Panel144: TPanel;
    Label61: TLabel;
    Label82: TLabel;
    DBLookupComboBox45: TDBLookupComboBox;
    DBLookupComboBox46: TDBLookupComboBox;
    RadioGroup5: TRadioGroup;
    pnTopAlterarVendCli: TPanel;
    BitBtnCabOK: TBitBtn;
    BitBtnCabCancelar: TBitBtn;
    Panel142: TPanel;
    BitBtn79: TBitBtn;
    Panel145: TPanel;
    BitBtnServOK: TBitBtn;
    BitBtnServCancelar: TBitBtn;
    Panel146: TPanel;
    BitBtnProdOK: TBitBtn;
    BitBtnProdCancelar: TBitBtn;
    EditHw2: TEditHw;
    EditHw4: TEditHw;
    btSelectProdAll: TSpeedButton;
    btUnSelectProdAll: TSpeedButton;
    btSelectServAll: TSpeedButton;
    btUnSelectServAll: TSpeedButton;
    EditHw5: TEditHw;
    EditHw6: TEditHw;
    Label269: TLabel;
    DBText1: TDBText;
    DBText19: TDBText;
    Label270: TLabel;
    PageControl9: TPageControl;
    TabSheet7: TTabSheet;
    ckAlterarClienteVenda: TCheckBox;
    ckAlterarVendedorVenda: TCheckBox;
    ckAlterarClienteVendaFpCreditos: TCheckBox;
    ckAlterarVendedorVendaFpCreditos: TCheckBox;
    ckAlterarFormaPagamentoVenda: TCheckBox;
    ckAlterarParticipanteVenda: TCheckBox;
    TabSheet8: TTabSheet;
    ckAlterarMecTecServ: TCheckBox;
    ckAlterarVendedorServ: TCheckBox;
    TabSheet9: TTabSheet;
    ckAlterarMecTecProd: TCheckBox;
    ckAlterarVendedorProd: TCheckBox;
    procedure DBLookupComboBox46Exit(Sender: TObject);
    procedure EditHw6Exit(Sender: TObject);
    procedure DBLookupComboBox45Exit(Sender: TObject);
    procedure EditHw5Exit(Sender: TObject);
    procedure BitBtnProdCancelarClick(Sender: TObject);
    procedure BitBtnProdOKClick(Sender: TObject);
    procedure BitBtnServCancelarClick(Sender: TObject);
    procedure BitBtnServOKClick(Sender: TObject);
    procedure btUnSelectProdAllClick(Sender: TObject);
    procedure btSelectProdAllClick(Sender: TObject);
    procedure btUnSelectServAllClick(Sender: TObject);
    procedure btSelectServAllClick(Sender: TObject);
    procedure ckAlterarVendedorProdClick(Sender: TObject);
    procedure ckAlterarMecTecProdClick(Sender: TObject);
    procedure ckAlterarVendedorServClick(Sender: TObject);
    procedure ckAlterarMecTecServClick(Sender: TObject);
    procedure DBLookupComboBox44Exit(Sender: TObject);
    procedure EditHw4Exit(Sender: TObject);
    procedure DBLookupComboBox43Exit(Sender: TObject);
    procedure EditHw2Exit(Sender: TObject);
    procedure RadioGroup5Click(Sender: TObject);
    procedure BitBtn79Click(Sender: TObject);
    procedure edHWValorAcresExit(Sender: TObject);
    procedure edHWValorDescExit(Sender: TObject);
    procedure spSwitchAcrescClick(Sender: TObject);
    procedure pnAcrescValorOSExit(Sender: TObject);
    procedure bt_alt_hora_prometida2Click(Sender: TObject);
    procedure DBEdit57Exit(Sender: TObject);
    procedure DBEdit75Exit(Sender: TObject);
    procedure DBEdit136Exit(Sender: TObject);
    procedure DBComboBox15Exit(Sender: TObject);
    procedure DBComboBox14Exit(Sender: TObject);
    procedure DBEdit151Exit(Sender: TObject);
    procedure DBEdit135Exit(Sender: TObject);
    procedure DBComboBox13Exit(Sender: TObject);
    procedure DBComboBox12Exit(Sender: TObject);
    procedure DBEdit150Exit(Sender: TObject);
    procedure DBEdit134Exit(Sender: TObject);
    procedure DBComboBox11Exit(Sender: TObject);
    procedure DBComboBox10Exit(Sender: TObject);
    procedure DBComboBox7Exit(Sender: TObject);
    procedure DBComboBox6Exit(Sender: TObject);
    procedure DBEdit128Exit(Sender: TObject);
    procedure RadioGroup4Click(Sender: TObject);
    procedure SpeedButton65Click(Sender: TObject);
    procedure BitBtn60Click(Sender: TObject);
    procedure btEmitirDocCancelClick(Sender: TObject);
    procedure btEmitirDocOKClick(Sender: TObject);
    procedure ckEmitirNFCeDocClick(Sender: TObject);
    procedure ckEmitirNFeDocClick(Sender: TObject);
    procedure pnEmitirDocEnter(Sender: TObject);
    procedure ckEmitirNFCeConfClick(Sender: TObject);
    procedure ckEmitirNFeConfClick(Sender: TObject);
    procedure btConfirmarDocCancelClick(Sender: TObject);
    procedure btConfirmarDocOKClick(Sender: TObject);
    procedure SpeedButton66Click(Sender: TObject);
    procedure SpeedButton64Click(Sender: TObject);
    procedure SpeedButton63Click(Sender: TObject);
    procedure btUnSelectAllProdutosTerceirosMesclarClick(Sender: TObject);
    procedure btUnSelectAllServicosTerceirosMesclarClick(Sender: TObject);
    procedure btUnSelectAllServicosMesclarClick(Sender: TObject);
    procedure btUnSelectAllProdutosMesclarClick(Sender: TObject);
    procedure ScrollBox_12Enter(Sender: TObject);
    procedure ScrollBox_5Enter(Sender: TObject);
    procedure ScrollBox_3Enter(Sender: TObject);
    procedure ScrollBox_6Enter(Sender: TObject);
    procedure ScrollBox_7Enter(Sender: TObject);
    procedure ScrollBox2Enter(Sender: TObject);
    procedure Copiarparareadetransferncia_12Click(Sender: TObject);
    procedure Copiarparareadetransferncia_7Click(Sender: TObject);
    procedure Copiarparareadetransferncia_6Click(Sender: TObject);
    procedure Copiarparareadetransferncia_5Click(Sender: TObject);
    procedure Copiarparareadetransferncia_3Click(Sender: TObject);
    procedure Copiarparareadetransferncia_2Click(Sender: TObject);
    procedure DBGrid12ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure Configurarcolunas_12Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas_12Click(Sender: TObject);
    procedure ReajustarLarguradascolunas_12Click(Sender: TObject);
    procedure ReajustarLarguradascolunas_7Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas_7Click(Sender: TObject);
    procedure Configurarcolunas_7Click(Sender: TObject);
    procedure ReajustarLarguradascolunas_6Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas_6Click(Sender: TObject);
    procedure Configurarcolunas_6Click(Sender: TObject);
    procedure Configurarcolunas_5Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas_5Click(Sender: TObject);
    procedure ReajustarLarguradascolunas_5Click(Sender: TObject);
    procedure Configurarcolunas_3Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas_3Click(Sender: TObject);
    procedure ReajustarLarguradascolunas_3Click(Sender: TObject);
    procedure ReajustarLarguradascolunas_2Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas_2Click(Sender: TObject);
    procedure Configurarcolunas_2Click(Sender: TObject);
    procedure DBGrid7ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure DBGrid6ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure DBGrid3ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure DBGrid5ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure DBGrid2ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure ComboBoxOpMesclarSelect(Sender: TObject);
    procedure ComboBoxOpMesclarExit(Sender: TObject);
    procedure CheckBoxProdServEmAbasClick(Sender: TObject);
    procedure DBGrid20DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ComboBoxDevolucaoUnExit(Sender: TObject);
    procedure btDevolucaoUnidadeCancelClick(Sender: TObject);
    procedure btnDevolucaoUnidadeOKClick(Sender: TObject);
    procedure DBComboBoxUnVendaRapidaExit(Sender: TObject);
    procedure DBComboBox16Exit(Sender: TObject);
    procedure SpeedButton62Click(Sender: TObject);
    procedure pnOpcoesPagamentoEnter(Sender: TObject);
    procedure ckListaTodasPoliticasClick(Sender: TObject);
    procedure BitBtn121Click(Sender: TObject);
    procedure BitBtn120Click(Sender: TObject);
    procedure SpeedButton61Click(Sender: TObject);
    procedure DBEdit147Exit(Sender: TObject);
    procedure DBGrid26KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid26CellClick(Column: TColumn);
    procedure DBGrid26DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid26DblClick(Sender: TObject);
    procedure DBEdit51Enter(Sender: TObject);
    procedure DBEdit16Enter(Sender: TObject);
    procedure DBEdit14Enter(Sender: TObject);
    procedure DevolucaoPedidoClick(Sender: TObject);
    procedure SpeedButtonLucratividadeClick(Sender: TObject);
    procedure bt_alt_hora_prometidaClick(Sender: TObject);
    procedure bt_alt_hora_entradaClick(Sender: TObject);
    procedure lbListActionsDblClick(Sender: TObject);
    procedure lbListActionsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btSelectAllProdutosTerceiroMesclarClick(Sender: TObject);
    procedure btSelectAllServicosTerceiroMesclarClick(Sender: TObject);
    procedure DBGrid29KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid29DblClick(Sender: TObject);
    procedure DBGrid29CellClick(Column: TColumn);
    procedure DBGrid30KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid30DblClick(Sender: TObject);
    procedure DBGrid30CellClick(Column: TColumn);
    procedure DBGrid29KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid30KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid29Exit(Sender: TObject);
    procedure DBGrid30Exit(Sender: TObject);
    procedure DBGrid29DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid30DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBEdit107KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit108KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit70KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid12CellClick(Column: TColumn);
    procedure DBGrid11DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid10DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBEdit74KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit54KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit45KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit44KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit60KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit59KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit42KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit106KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit127KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit119KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit90KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit130KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit126KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButtonWhatsAppClick(Sender: TObject);
    procedure dbObsReqSemLimiteExit(Sender: TObject);
    procedure btEditoObsReqClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBEdit119Exit(Sender: TObject);
    procedure ckAlterarParticipanteVendaClick(Sender: TObject);
    procedure ckAlterarFormaPagamentoVendaClick(Sender: TObject);
    procedure ckAlterarClienteVendaFpCreditosClick(Sender: TObject);
    procedure ckAlterarClienteVendaClick(Sender: TObject);
    procedure ckAlterarVendedorVendaFpCreditosClick(Sender: TObject);
    procedure ckAlterarVendedorVendaClick(Sender: TObject);
    procedure pn_grid_osExit(Sender: TObject);
    procedure GroupBox36Exit(Sender: TObject);
    procedure pn_dev_os_itensExit(Sender: TObject);
    procedure GroupBox7Exit(Sender: TObject);
    procedure DBGrid3Exit(Sender: TObject);
    procedure DBGrid3Enter(Sender: TObject);
    procedure DBGrid2Exit(Sender: TObject);
    procedure DBGrid2Enter(Sender: TObject);
    procedure TabSheet21Exit(Sender: TObject);
    procedure ck_exibir_devolucaoClick(Sender: TObject);
    procedure TabSheet1Exit(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid11CellClick(Column: TColumn);
    procedure DBGrid10CellClick(Column: TColumn);
    procedure DBGrid9CellClick(Column: TColumn);
    procedure DBGrid9DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid7CellClick(Column: TColumn);
    procedure DBGrid6CellClick(Column: TColumn);
    procedure DBGrid5CellClick(Column: TColumn);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGridProdSimKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtnCancelarProdSimilarClick(Sender: TObject);
    procedure BitBtnSalvarProdSimilarClick(Sender: TObject);
    procedure bt_notas_vinculadasClick(Sender: TObject);
    procedure ed_nf_dc_descontoExit(Sender: TObject);
    procedure DBEdit141Exit(Sender: TObject);
    procedure DBEdit68Exit(Sender: TObject);
    procedure DBEdit142Exit(Sender: TObject);
    procedure DBEdit145Exit(Sender: TObject);
    procedure DBEdit142KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit145KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton59Click(Sender: TObject);
    procedure DBEdit138KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure bt_ecomm_okClick(Sender: TObject);
    procedure bt_ecomm_cancelClick(Sender: TObject);
    procedure SpeedButton58Click(Sender: TObject);
    procedure SpeedButton57Click(Sender: TObject);
    procedure bt_ultimos_precos_vnd_rapClick(Sender: TObject);
    procedure grid_ultimos_precosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_ultimos_precosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure bt_fat_lote_sel_untickClick(Sender: TObject);
    procedure bt_fat_lote_sel_tickClick(Sender: TObject);
    procedure grid_fat_lote_selCellClick(Column: TColumn);
    procedure grid_fat_lote_selDblClick(Sender: TObject);
    procedure grid_fat_lote_selKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure grid_fat_lote_selMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabSheet2Enter(Sender: TObject);
    procedure ed_nf_ac_outrasExit(Sender: TObject);
    procedure tv_nf_valoresCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure bt_show_form_valores_nf_reqClick(Sender: TObject);
    procedure bt_obter_valores_nfClick(Sender: TObject);
    procedure pn_fat_lote_selEnter(Sender: TObject);
    procedure grid_fat_lote_selDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure bt_adicionar_ao_faturamentoClick(Sender: TObject);
    procedure bt_preco_ultimo_utilizarClick(Sender: TObject);
    procedure bt_ultimos_precosClick(Sender: TObject);
    procedure grid_cliente_destsExit(Sender: TObject);
    procedure grid_cliente_destsEnter(Sender: TObject);
    procedure bt_cliente_dests_utilizar_entregaClick(Sender: TObject);
    procedure bt_cliente_endadd_reqClick(Sender: TObject);
    procedure bt_cliente_dests_utilizar_principalClick(Sender: TObject);
    procedure pn_cliente_destsEnter(Sender: TObject);
    procedure grid_cliente_destsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BitBtn112Click(Sender: TObject);
    procedure BitBtn113Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure btSalvarFaturaEntradaClick(Sender: TObject);
    procedure btApagarDespClick(Sender: TObject);
    procedure BitBtn111Click(Sender: TObject);
    procedure BitBtn110Click(Sender: TObject);
    procedure btGerarClick(Sender: TObject);
    procedure btAlterarFaturaEntradaClick(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BitBtn106Click(Sender: TObject);
    procedure DBGrid7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid7DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pnDescValorOSExit(Sender: TObject);
    procedure spSwitchDesc1Click(Sender: TObject);
    procedure DBGrid12Enter(Sender: TObject);
    procedure edQuantidadeVendaRapidaExit(Sender: TObject);
    procedure edValorUnitarioVendaRapidaExit(Sender: TObject);
    procedure BitBtn104Click(Sender: TObject);
    procedure DBLookupComboBox37Exit(Sender: TObject);
    procedure DBEdit126Exit(Sender: TObject);
    procedure DBLookupComboBox38Exit(Sender: TObject);
    procedure DBEdit127Exit(Sender: TObject);
    procedure pnClienteAvulsoEnter(Sender: TObject);
    procedure DBEdit124Exit(Sender: TObject);
    procedure btEraseAllClick(Sender: TObject);
    procedure DesmarcarAgendamentoLinhaSelecionadasClick(Sender: TObject);
    procedure DBGrid21DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton55Click(Sender: TObject);
    procedure pgOSChange(Sender: TObject);
    procedure BitBtn103Click(Sender: TObject);
    procedure SpeedButton46Click(Sender: TObject);
    procedure DBEdit122Exit(Sender: TObject);
    procedure RemoverStatusEditando1Click(Sender: TObject);
    procedure DBEdit26Exit(Sender: TObject);
    procedure DBComboBox5Exit(Sender: TObject);
    procedure sbEditarObservacaoClick(Sender: TObject);
    procedure BitBtn101KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn101Click(Sender: TObject);
    procedure BitBtn99Click(Sender: TObject);
    procedure BitBtn99KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BitBtn98Click(Sender: TObject);
    procedure BitBtn97Click(Sender: TObject);
    procedure BitBtn96Click(Sender: TObject);
    procedure pnSeparacaoEnter(Sender: TObject);
    procedure SpeedButton54Click(Sender: TObject);
    procedure BitBtn95Click(Sender: TObject);
    procedure pnImpressaoSeparacaoEnter(Sender: TObject);
    procedure BitBtn100Click(Sender: TObject);
    procedure GroupBox20Exit(Sender: TObject);
    procedure SpeedButton50Click(Sender: TObject);
    procedure GroupBox27Exit(Sender: TObject);
    procedure GroupBox17Exit(Sender: TObject);
    procedure tsKitShow(Sender: TObject);
    procedure GroupBox24Exit(Sender: TObject);
    procedure GroupBox4Exit(Sender: TObject);
    procedure TabSheet20Show(Sender: TObject);
    procedure DBEdit55Exit(Sender: TObject);
    procedure Panel23Exit(Sender: TObject);
    procedure SpeedButton52Click(Sender: TObject);
    procedure btnOKCancelarClick(Sender: TObject);
    procedure btnExcluirCancelamentoClick(Sender: TObject);
    procedure SpeedButton48Click(Sender: TObject);
    procedure SpeedButton47Click(Sender: TObject);
    procedure DBGrid25KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid25DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid25TitleClick(Column: TColumn);
    procedure DBLookupComboBox36Exit(Sender: TObject);
    procedure DBLookupComboBox36Enter(Sender: TObject);
    procedure SpeedButton45Click(Sender: TObject);
    procedure BitBtn93Click(Sender: TObject);
    procedure BitBtn94Click(Sender: TObject);
    procedure SpeedButton43Click(Sender: TObject);
    procedure BitBtn92Click(Sender: TObject);
    procedure SpeedButton42Click(Sender: TObject);
    procedure RemoverliberaodoFinanceiro1Click(Sender: TObject);
    procedure SpeedButton41Click(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure DBGrid9KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton27Click(Sender: TObject);
    procedure DBEdit103Exit(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure SpeedButton38Click(Sender: TObject);
    procedure GroupBox13Exit(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure ComboBox11Exit(Sender: TObject);
    procedure tsMecanicosOSExit(Sender: TObject);
    procedure DBGrid24KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn91Click(Sender: TObject);
    procedure BitBtn90Click(Sender: TObject);
    procedure DBGrid23KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn80Click(Sender: TObject);
    procedure BitBtn81Click(Sender: TObject);
    procedure DBGrid14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure MaskEdit13Exit(Sender: TObject);
    procedure MaskEdit13KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn78Exit(Sender: TObject);
    procedure DBGrid21KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btSelectAllProdutosMesclarClick(Sender: TObject);
    procedure DBGrid11KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid11Exit(Sender: TObject);
    procedure DBGrid11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid10Exit(Sender: TObject);
    procedure DBGrid10KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBLookupComboBox25Exit(Sender: TObject);
    procedure Marcartodosservios1Click(Sender: TObject);
    procedure Desmarcartodosservios1Click(Sender: TObject);
    procedure DBGrid22KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox32Exit(Sender: TObject);
    procedure BitBtn78Click(Sender: TObject);
    procedure DBGrid21Enter(Sender: TObject);
    procedure BitBtn77Click(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure DBGrid22DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid22ColEnter(Sender: TObject);
    procedure DBGrid22CellClick(Column: TColumn);
    procedure BitBtn76Click(Sender: TObject);
    procedure DBEdit33Exit(Sender: TObject);
    procedure DBEdit27Exit(Sender: TObject);
    procedure DBGrid20DblClick(Sender: TObject);
    procedure BitBtn72Enter(Sender: TObject);
    procedure BitBtn75Click(Sender: TObject);
    procedure EditFiscalCodBarraDevKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditFiscalCodBarraDevExit(Sender: TObject);
    procedure BitBtn72Click(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure BitBtn67Click(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn66Click(Sender: TObject);
    procedure Panel1Exit(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure ScrollBox2Exit(Sender: TObject);
    procedure BitBtn63Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure DBLookupComboBox31KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn62Click(Sender: TObject);
    procedure qrpOSExternaPreview(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure BitBtn61Click(Sender: TObject);
    procedure RemoverStatusdeFechandodaVenda1Click(Sender: TObject);
    procedure btEscolherECFSaidaClick(Sender: TObject);
    procedure btCancelarECFSaidaClick(Sender: TObject);
    procedure DBGrid15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox18Exit(Sender: TObject);
    procedure btSelectAllServicosMesclarClick(Sender: TObject);
    procedure DBComboBox9Exit(Sender: TObject);
    procedure BitBtn59Click(Sender: TObject);
    procedure BitBtn58Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure DBEdit95Exit(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure DBEdit15Enter(Sender: TObject);
    procedure edHWPercDescExit(Sender: TObject);
    procedure BitBtn57Click(Sender: TObject);
    procedure edHWPercAcresExit(Sender: TObject);
    procedure BitBtn55Click(Sender: TObject);
    procedure TrackBar1Exit(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure DBGrid10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure DBGrid11DblClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure DBGrid9DblClick(Sender: TObject);
    procedure DBGrid10DblClick(Sender: TObject);
    procedure SelecionarDAVparaMesclagem1Click(Sender: TObject);
    procedure DBGrid12DblClick(Sender: TObject);
    procedure DBGrid12DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn56Click(Sender: TObject);
    procedure SelecionarORCClick(Sender: TObject);
    procedure BitBtn54Click(Sender: TObject);
    procedure DBGrid12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid12Exit(Sender: TObject);
    procedure edCodBarraKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCodBarraExit(Sender: TObject);
    procedure edCodBarraEnter(Sender: TObject);
    procedure BitBtn73Click(Sender: TObject);
    procedure DBEdit93Exit(Sender: TObject);
    procedure DBEdit91Exit(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure DBEdit88Exit(Sender: TObject);
    procedure DBEdit90Exit(Sender: TObject);
    procedure BitBtnCabCancelarClick(Sender: TObject);
    procedure BitBtnCabOKClick(Sender: TObject);
    procedure DBLookupComboBox11Exit(Sender: TObject);
    procedure DBLookupComboBox10Exit(Sender: TObject);
    procedure BitBtn52Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure BitBtn46Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure DBEdit78Enter(Sender: TObject);
    procedure DBEdit53Enter(Sender: TObject);
    procedure DBEdit53Exit(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure qrpFichaOSPreview(Sender: TObject);
    procedure tsOrdemServShow(Sender: TObject);
    procedure DBEdit130Exit(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure BitBtn89Click(Sender: TObject);
    procedure BitBtn88Click(Sender: TObject);
    procedure DBLookupComboBox31Exit(Sender: TObject);
    procedure EditMoeda6Exit(Sender: TObject);
    procedure EditMoeda6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Timer2Timer(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure BitBtn87Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure BitBtn84Click(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit129Exit(Sender: TObject);
    procedure DBEdit38KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn83Click(Sender: TObject);
    procedure TrackBar1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid60KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid60DblClick(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
    procedure BitBtn82Click(Sender: TObject);
    procedure BitBtn86Click(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure DBGrid50KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton31Click(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure BitBtn85Click(Sender: TObject);
    procedure tsProdTercOSShow(Sender: TObject);
    procedure tsServTercOSShow(Sender: TObject);
    procedure tsProdOSShow(Sender: TObject);
    procedure tsServOSShow(Sender: TObject);
    procedure DBEdit89Enter(Sender: TObject);
		procedure tsOSExit(Sender: TObject);
		procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBEdit71Exit(Sender: TObject);
    procedure DBEdit73Enter(Sender: TObject);
    procedure BitBtn36Click(Sender: TObject);
    procedure BitBtn35Click(Sender: TObject);
    procedure BitBtn34Click(Sender: TObject);
    procedure BitBtn33Click(Sender: TObject);
    procedure BitBtn32Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure BitBtn30Click(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure DBLookupComboBox27Exit(Sender: TObject);
    procedure DBEdit108Exit(Sender: TObject);
    procedure DBLookupComboBox26Exit(Sender: TObject);
    procedure DBEdit70Exit(Sender: TObject);
    procedure BitBtn74Click(Sender: TObject);
    procedure BitBtn65Click(Sender: TObject);
    procedure DBEdit48KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit56KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit41KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit32KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton11Click(Sender: TObject);
    procedure RadioGroup3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBLookupComboBox22Exit(Sender: TObject);
    procedure DBLookupComboBox3Exit(Sender: TObject);
    procedure BitBtn68Click(Sender: TObject);
    procedure BitBtn70Click(Sender: TObject);
    procedure DBGrid14Exit(Sender: TObject);
    procedure BitBtn51Click(Sender: TObject);
    procedure BitBtn69Click(Sender: TObject);
    procedure BitBtn50Click(Sender: TObject);
    procedure BitBtn49Click(Sender: TObject);
    procedure DBLookupComboBox21Exit(Sender: TObject);
    procedure DBEdit49Exit(Sender: TObject);
    procedure DBEdit121Exit(Sender: TObject);
    procedure DBEdit120Exit(Sender: TObject);
    procedure DBEdit118Enter(Sender: TObject);
    procedure DBEdit117Exit(Sender: TObject);
    procedure MaskEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn48Click(Sender: TObject);
    procedure MaskEdit6Exit(Sender: TObject);
    procedure BitBtn37Click(Sender: TObject);
    procedure BitBtn41Click(Sender: TObject);
    procedure BitBtn40Click(Sender: TObject);
    procedure BitBtn39Click(Sender: TObject);
    procedure BitBtn38Click(Sender: TObject);
    procedure DBLookupComboBox4Exit(Sender: TObject);
    procedure DBEdit45Exit(Sender: TObject);
    procedure DBEdit56Exit(Sender: TObject);
    procedure DBEdit58Exit(Sender: TObject);
    procedure DBEdit62Exit(Sender: TObject);
    procedure DBLookupComboBox6Exit(Sender: TObject);
    procedure DBLookupComboBox7Exit(Sender: TObject);
    procedure DBLookupComboBox5Exit(Sender: TObject);
    procedure DBEdit60Exit(Sender: TObject);
    procedure DBEdit59Exit(Sender: TObject);
    procedure pgOSEnter(Sender: TObject);
    procedure PageControl4Enter(Sender: TObject);
    procedure TabSheet10Enter(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure BitBtn43Click(Sender: TObject);
    procedure tsOutrosOSShow(Sender: TObject);
    procedure BitBtn42Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure DBGrid4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn25Click(Sender: TObject);
    procedure BitBtn24Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure DBEdit41Exit(Sender: TObject);
    procedure GroupBox15Exit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure DBEdit32Exit(Sender: TObject);
    procedure DBMemo5Exit(Sender: TObject);
    procedure DBMemo3Exit(Sender: TObject);
    procedure DBComboBox3Exit(Sender: TObject);
    procedure DBEdit76Enter(Sender: TObject);
    procedure BitBtn28Click(Sender: TObject);
    procedure BitBtn27Click(Sender: TObject);
    procedure BitBtn26Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton9Click(Sender: TObject);
    procedure DBEdit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure GroupBox4Enter(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure DBEdit25Enter(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn64Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure DBEdit20Exit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBLookupComboBox15Exit(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure DBLookupComboBox16Exit(Sender: TObject);
    procedure DBEdit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
			Shift: TShiftState);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function setaTelacadastroEConfiguraEntrada(valor: integer): boolean;
    procedure setaTelacadastro(valor: Integer);
    function verificarDescontoTabDifPromPrecoQtde(
      pValorUn: Double;
      pQtde: Double;
      pValorUnOrig: Double;
      pDescAcresc: string;
      pPercValor: string;
      pValorDescAcresc: Double;
      pPerguntar: boolean = true): boolean;
    function verificarUnidadeTabDifPromPrecoQtde(
      pUnidade: string): boolean;
    procedure atualizarprecoTipoReqOsOrc;
    procedure gravaConfiguracoesFormRegistro;
    procedure leConfiguracoesFormRegistro;
    procedure limparCamposCab(Sender: TObject);
    procedure limparCamposServ(Sender: TObject);
    procedure limparCamposProd(Sender: TObject);

  private
    { Private declarations }
    CadPedVenda: TPedVenda;
  	dtm: TDataModule;//TDtmPedVenda;
    vCriou: Smallint;
    vTipoCriou: string;
    tempEdit5 {,UltimoNumOS,UltimoNumORC,UltimoNumReq}: string;
    enter, {desativar,} exitEdCodBarra, cancelaAltPreco: Boolean;
    vF9: Boolean;
    vNFGeraREQNPed: Integer;
    vNFGeraREQTipoPed: string;
    vNFGeraREQValor: string;
    Fnf_ac_calctrib_lookup: TObject;
    Fnf_freteconta: TObject;
    procedure voltaFormularioVendaRapidaParaInsercao;//procedure btVendaRapidaPesquisaVoltaClick(Sender: TObject);
    procedure alterarItemVendaRapida;
    procedure btVendaRapidaPesquisaProcurarClick(Sender: TObject);
    procedure gridVendaRapidaPesquisaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridVendaRapidaPesquisaTitleClick(Column: TColumn);
    procedure CheckBox4Click(Sender: TObject);
    procedure exitCliente(Sender: TObject);
    procedure exitCondPag(Sender: TObject);
    procedure exitPercComissaoVend3(Sender: TObject);
    procedure exitDescontoAcrescimo(Sender: TObject);
    procedure exitDescontoOSProdServ(Sender: TObject);
    procedure exitAcrescimoOSProdServ(Sender: TObject);
    procedure exitVendedorCab(Sender: TObject);
    procedure configuraEntrada;
    function ConsultaItem(codigo: string): boolean;
    procedure habilitaCamposRequisicao;
    procedure habilitaCamposOrdemDeServico;
    procedure habilitaCamposOrcamento;
    procedure habilitaControles;
    procedure habilitaControlesParaInsercao;
    procedure habilitaControlesParaEdicao;
    procedure ConfiguraCampoConsulta;
    procedure GravarCampoConsulta;
    procedure _marcaCamposConfig;
    procedure EventDescPercTotProdChange;
    procedure EventDescPercTotServChange;
    procedure EventAcrescPercTotProdChange;
    procedure EventAcrescPercTotServChange;

    procedure chamarConfirmacaoPEDpelaNF;
    procedure chamarReaberturaPEDpelaNF;
    procedure verificarItemRepetido(vQuant: string = '');
    procedure habilitarSelecaoVariosItens;
    procedure carregarImagemProdutos;
    procedure getFaturas;

    procedure pedvenda_cliente_endadd_scroll;
    procedure pedvenda_fechamento_after(Sender: TObject);

    procedure faturamento_calc_valores_nota(Sender: TObject);
    procedure faturamento_action_before_save;
    procedure estoque_minimo_notificar(Sender: TObject);
    procedure estoque_minimo_notificar_DrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure AfterEditPedido(Sender: TObject);
    procedure DevItensExibir(Sender: TObject);
    procedure DevItensHidePanels;
    function _mdiAberto(pNomeFormMDI: string;  pMensagem: string = ''): Boolean;

    procedure MensagemVendaRapida(const S: string);
  public
    procedure montarComponentes;
    procedure carregarDBGrids;
    procedure setCliente2;
    procedure setCliente3;
    procedure setCliente5;
    procedure setCliente6;
    procedure setCliente7;
    procedure setCliente12;
    { Public declarations }
  protected
    procedure processaMensagem(var Msg: TMsg; var handled: boolean); override;
  var
    alturaGroupbox22: Integer;
    vRecNo: Integer;
    temp: string;
  end;

var
  FrmCadPedVendaREQ: TFrmCadPedVenda;
  FrmCadPedVendaOS : TFrmCadPedVenda;
  FrmCadPedVendaORC: TFrmCadPedVenda;
  FrmCadPedVendaTRF: TFrmCadPedVenda;
  FrmCadPedVendaEST: TFrmCadPedVenda;

  vDiretorioPadraoImg: string;
  vCampoAdcional: string;
  vCondAdcional: string;
  vSqlAdcional: string;
  vCondpagPoliticaDesc: Integer;

  trans: TIBTransaction;
  cdsColunas2, cdsColunas3, cdsColunas5, cdsColunas6, cdsColunas7, cdsColunas12: TClientDataSet;
  cdsGrid2, cdsGrid3, cdsGrid5, cdsGrid6, cdsGrid7, cdsGrid12: TClientDataSet;
  GridCfg2, GridCfg3, GridCfg5, GridCfg6, GridCfg7, GridCfg12: TDBGrid;
  ListGridsAndDataSets2, ListGridsAndDataSets3, ListGridsAndDataSets5, ListGridsAndDataSets6, ListGridsAndDataSets7, ListGridsAndDataSets12: TStrings;
  ListPositions2, ListPositions3, ListPositions5, ListPositions6, ListPositions7, ListPositions12: TStrings;

  fReset2, fReset3, fReset5, fReset6, fReset7, fReset12: Boolean;
  vCamposPadraoRegistro2, vCamposPadraoRegistro3, vCamposPadraoRegistro5, vCamposPadraoRegistro6, vCamposPadraoRegistro7, vCamposPadraoRegistro12: Boolean;
  vConfigColuna2, vConfigColuna3, vConfigColuna5, vConfigColuna6, vConfigColuna7, vConfigColuna12 : boolean;
  setTClientPadrao2, setTClientPadrao3, setTClientPadrao5, setTClientPadrao6, setTClientPadrao7, setTClientPadrao12: Boolean;
  PrimeiraPesquisa2, PrimeiraPesquisa3, PrimeiraPesquisa5, PrimeiraPesquisa6, PrimeiraPesquisa7, PrimeiraPesquisa12: Boolean;
  TemColunasComPosicaoAlteradas2, TemColunasComPosicaoAlteradas3, TemColunasComPosicaoAlteradas5, TemColunasComPosicaoAlteradas6, TemColunasComPosicaoAlteradas7, TemColunasComPosicaoAlteradas12: Boolean;
  nomeDTSEt2, nomeDTSEt3, nomeDTSEt5, nomeDTSEt6, nomeDTSEt7, nomeDTSEt12: string;
  vAlterarNomeDtSet2, vAlterarNomeDtSet3, vAlterarNomeDtSet5, vAlterarNomeDtSet6, vAlterarNomeDtSet7, vAlterarNomeDtSet12: string;
  vusuario: string;

implementation

uses uDtmAtivo, uDtmPedVenda, UClassesClientes, UClassesProdutos,
  UClassesVeiculos, UClassesEquipamentos, uClassesCadastrosBasicos,
  uDataSet_OOP, Messages, Variants, uDadosIni, Registry, funcoes, Clipbrd,
  IBQuery, MMSystem, uClassesAgenda, Math, uItemRepetido,
  faturamento_hw_class, hw_erro_class, StrUtils, uCadPedVenda_NotasVinculadas,
  ContainerUnit, CallerNFSeFeaturesUnit, hw_utils,   
  uCadPedVenda_ValoresNF, config_sistema_class, uCadPedVenda_Cliente;

function VerRecallHonda(vbanco: string; vcodempresa: integer;
  vnivel: integer; vchass: string; vcodcons: string; vusihs: string; vchaveihs: string; vcod2w, vdataval: string): LongBool; stdcall; external 'cons40.dll';

{$R *.dfm}

procedure TFrmCadPedVenda.AfterEditPedido(Sender: TObject);
var
  continuar: Boolean;
begin
  continuar := False;
  try

    if not CadPedVenda.conf.exibir_devolucao_runtime then
      Exit;

    CadPedVenda.vItProd.OnFoundDevInterna := DevItensExibir;

    with CadPedVenda.vItProd.DevInterna do
    begin
      grid_dev_ped_itens.DataSource := _dataSourceOOP;
      grid_dev_rap_itens.DataSource := _dataSourceOOP;
      grid_dev_os_itens.DataSource := _dataSourceOOP;
    end;

    //DevItensExibir(CadPedVenda.vItProd);

    continuar := True;

  finally
    DevItensHidePanels;

    if not continuar then
      CadPedVenda.vItProd.DevInternaReset();
  end;
end;

procedure TFrmCadPedVenda.alterarItemVendaRapida;
begin
  if not vDadosIni.PesqPros('VND228', 'EDITANDO REGISTRO', 'PROD.:' + CadPedVenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString, 'PEDVENDA_PROD', CadPedVenda.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
    Exit;
  if (CadPedVenda.vendaFechada) or (Trim(CadPedVenda.dataSet.FieldByName('status_ped').AsString) = 'CANCELADO') then
  begin
    if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) then
      edCodBarra.SetFocus;
    Exit;
  end;

  if not vDadosIni.PesqPros('VND011', 'EDITANDO REGISTRO', 'PROD.:' + CadPedVenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString, 'PEDVENDA_PROD', CadPedVenda.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
    Exit;

  if not CadPedVenda.verPendenciaVendaIt then
    exit;

  if not CadPedVenda.vItProd.Edit then
    Exit;

  edQuantidadeVendaRapida.Valor    := CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat;

  edValorUnitarioVendaRapida.Valor := CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat;

  edValorTotalVendaRapida.Valor    := CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat *
																		    CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat;
  MaskEdit7.Text                := trim(CadPedVenda.vItProd.dataset.fieldbyname('DESCR_PROD_PED').AsString);

  vDadosIni.montarDbComboboxUndConv(
  	CadPedVenda.buscas,
    DBComboBoxUnVendaRapida,
    CadPedVenda.vItProd.dataset.fieldbyname('GRUPO_PROD').AsInteger,
    CadPedVenda.vItProd.dataset.fieldbyname('COD_PROD').AsString,
    CadPedVenda.vItProd.dataset.fieldbyname('NUM_FAB_PROD').AsString,
    vDadosIni.IfThen(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString) <> '',
    	UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString)),
      UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE').AsString))));
  try
    Screen.Cursor := crDefault;
    MaskEdit7.Enabled := (CadPedVenda.vItProd.vProduto.alteraDescricaoProduto) or (vDadosIni.vTintas = 'S');
    edQuantidadeVendaRapida.Enabled := vDadosIni.PesqPros('VND135', 'HABILITAR', '', 'PEDVENDA_PROD', CadPedVenda.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, False);
//    lbQuantidadeVendaRapida.Left := Label168.Left;
//    edQuantidadeVendaRapida.Left := EditMoeda5.Left;
//    lbQuantidadeVendaRapida.Visible := True;
//    edQuantidadeVendaRapida.Visible := True;
//    EditMoeda5.Left := 340;
//    Label168.Left := 250;

    cancelaAltPreco := False;
    //edCodBarra.Enabled := false;

    CadPedVenda.vItProd.vUnidade := vDadosIni.IfThen(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString) <> '',
	    UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString)),
  	  UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE').AsString)));

    CadPedVenda.vItProd.vQuantidade := CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat;

    if not vDadosIni.abreForm('Alteração', Panel36, [ofAutoSize, ofEscapeExit]) then
      Exit;


    {pgVendaRapida.ActivePage := tsAlteraPreco;
    tsAlteraPreco.Show;
    if (Self.Enabled) and (Self.Visible) and (edQuantidadeVendaRapida.CanFocus) then
      edQuantidadeVendaRapida.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (EditMoeda5.CanFocus) then
      editMoeda5.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (MaskEdit7.CanFocus) then
      MaskEdit7.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit93.CanFocus) then
      DBEdit93.SetFocus;
    while pgVendaRapida.ActivePage = tsAlteraPreco do
    begin
      if clicouNoX then
        abort;
      if PageControl1.ActivePage = TabSheet2 then
        Abort;
      Application.ProcessMessages;
    end;}
    edCodBarra.Enabled := true;
    if cancelaAltPreco then
      exit;

    CadPedVenda.calculaTotais;
    eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;
    pgVendaRapida.ActivePage := tsItens;
    try
      DBGrid12.DataSource := nil;
      if CadPedVenda.vItProd.dataSet.State in [dsInsert, dsedit] then
        CadPedVenda.vItProd.post;
      CadPedVenda.calculaTotais;
      eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;
      lMsg.Caption := 'Informe o Código de Barras do Produto';

      panel38.Caption := vDadosIni.IfThen(CadPedVenda.getTipoVenda = 'REQ', 'Venda Rápida', 'Orçamento Rápido') +
          vDadosIni.IfThen(CadPedVenda.dataSet.FieldByName('nped').AsInteger > 0, ' ' +CadPedVenda.dataSet.FieldByName('nped').AsString, '') +
          vDadosIni.IfThen(Trim(CadPedVenda.dataSet.FieldByName('status_ped').AsString) <> '', ' ' +CadPedVenda.dataSet.FieldByName('status_ped').AsString, '');

      if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) then
	      edCodBarra.SetFocus;
    finally
    	DBGrid12.DataSource := TDtmPedVenda(dtm).dsItemProd;
    end;


  finally
//    edQuantidadeVendaRapida.Enabled := True;
//    edQuantidadeVendaRapida.Visible := False;
//    EditMoeda5.Left := 134;
//    Label168.Left := 44;
    CadPedVenda.vItProd.dataSet.Cancel;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.atualizarprecoTipoReqOsOrc;
var
	vOK: boolean;
begin
	vOK := false;

  if not vDadosIni.vPedVnd.AcrescCondPagComissaoVend then
  	Exit;

  if CadPedVenda.vendaFechada then
    Exit;

  if not (CadPedVenda.dataSet.State in [dsinsert, dsedit]) then
    Exit;

  if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'ORC' then
  begin
    if trim(CadPedVenda.dataSet.FieldByName('TIPO_ORC').AsString) = '' then
      CadPedVenda.vTipoOrcExit := trim(CadPedVenda.dataSet.FieldByName('TIPO_ORC').AsString)
    else
    begin
      if trim(CadPedVenda.vTipoOrcExit) = trim(CadPedVenda.dataSet.FieldByName('TIPO_ORC').AsString) then
        Exit;
    end;
  end
  else if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'OS' then
  begin
    if trim(CadPedVenda.dataSet.FieldByName('TIPO_OS').AsString) = '' then
      CadPedVenda.vTipoOsExit := trim(CadPedVenda.dataSet.FieldByName('TIPO_OS').AsString)
    else
    begin
      if trim(CadPedVenda.vTipoOsExit) = trim(CadPedVenda.dataSet.FieldByName('TIPO_OS').AsString) then
        Exit;
    end;
  end
  else
  begin
    if trim(CadPedVenda.dataSet.FieldByName('TIPV').AsString) = '' then
      CadPedVenda.vTipoVExit := trim(CadPedVenda.dataSet.FieldByName('TIPV').AsString)
    else
    begin
      if trim(CadPedVenda.vTipoVExit) = trim(CadPedVenda.dataSet.FieldByName('TIPV').AsString) then
        Exit;
    end;
  end;

  if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'ORC' then
  begin
    if (trim(CadPedVenda.vTipoOrcExit) = '') then
      CadPedVenda.vTipoOrcExit := trim(CadPedVenda.dataSet.FieldByName('TIPO_ORC').AsString);

    if (trim(CadPedVenda.vTipoOrcOld) <> trim(CadPedVenda.dataSet.FieldByName('TIPO_ORC').AsString)) then
      vOK := true
    else if (trim(CadPedVenda.vTipoOrcExit) <> trim(CadPedVenda.dataSet.FieldByName('TIPO_ORC').AsString)) and (vDadosIni.vPedVnd.AcrescCondPagComissaoVend) then
      vOK := true
    else if (trim(CadPedVenda.vTipoOrcOld) = trim(CadPedVenda.dataSet.FieldByName('TIPO_ORC').AsString)) then
      vOK := vDadosIni.PesqPros('VND227', 'RECALCULAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False, False, True);
  end
  else if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'OS' then
  begin
    if (trim(CadPedVenda.vTipoOsExit) = '') then
      CadPedVenda.vTipoOsExit := trim(CadPedVenda.dataSet.FieldByName('TIPO_OS').AsString);

    if (trim(CadPedVenda.vTipoOsOld) <> trim(CadPedVenda.dataSet.FieldByName('TIPO_OS').AsString)) then
      vOK := true
    else if (trim(CadPedVenda.vTipoOsExit) <> trim(CadPedVenda.dataSet.FieldByName('TIPO_OS').AsString)) and (vDadosIni.vPedVnd.AcrescCondPagComissaoVend) then
      vOK := true
    else if (trim(CadPedVenda.vTipoOsOld) = trim(CadPedVenda.dataSet.FieldByName('TIPO_OS').AsString)) then
      vOK := vDadosIni.PesqPros('VND227', 'RECALCULAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False, False, True);
  end
  else
  begin
    if (trim(CadPedVenda.vTipoVExit) = '') then
      CadPedVenda.vTipoVExit := trim(CadPedVenda.dataSet.FieldByName('TIPV').AsString);

    if (trim(CadPedVenda.vTipoVOld) <> trim(CadPedVenda.dataSet.FieldByName('TIPV').AsString)) then
      vOK := true
    else if (trim(CadPedVenda.vTipoVExit) <> trim(CadPedVenda.dataSet.FieldByName('TIPV').AsString)) and (vDadosIni.vPedVnd.AcrescCondPagComissaoVend) then
      vOK := true
    else if (trim(CadPedVenda.vTipoVOld) = trim(CadPedVenda.dataSet.FieldByName('TIPV').AsString)) then
      vOK := vDadosIni.PesqPros('VND227', 'RECALCULAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False, False, True);
  end;

  if vOK then
  begin
    if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'ORC' then
      CadPedVenda.vTipoOrcOld := trim(CadPedVenda.dataSet.FieldByName('TIPO_ORC').AsString)
    else if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'OS' then
      CadPedVenda.vTipoOsOld := trim(CadPedVenda.dataSet.FieldByName('TIPO_OS').AsString)
    else
      CadPedVenda.vTipoVOld := trim(CadPedVenda.dataSet.FieldByName('TIPV').AsString);

    CadPedVenda.vItProd._setaVariaveisPromocao(
    	CadPedVenda.vCliente.endAdic.cod_localidade_dest,
      CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger,
      CadPedVenda.vCliente.dataSet.FieldByName('cod_tab_preco').AsInteger,
      CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger,
      CadPedVenda.vCliente.endAdic.cod_cidade_dest,
      CadPedVenda.dataSet.FieldByName('TIPV').AsString);
      
    try
      DBGrid3.DataSource.DataSet.DisableControls;
      CadPedVenda._recalcularPrecoProdutosPromocao;
    finally
      DBGrid3.DataSource.DataSet.EnableControls;
    end;
    
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);

    if CheckBox4.Checked then
      eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;
  end;

  if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'ORC' then
    CadPedVenda.vTipoOrcExit := trim(CadPedVenda.dataSet.FieldByName('TIPO_ORC').AsString)
  else if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'OS' then
    CadPedVenda.vTipoOsExit := trim(CadPedVenda.dataSet.FieldByName('TIPO_OS').AsString)
  else
    CadPedVenda.vTipoVExit := trim(CadPedVenda.dataSet.FieldByName('TIPV').AsString);
end;

procedure TFrmCadPedVenda.BitBtn100Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    _GravaConfiguracoesInteger(ComboBox5.Name, ComboBox5.ItemIndex);
    _GravaConfiguracoesInteger(ComboBox6.Name, ComboBox6.ItemIndex);
    _GravaConfiguracoesInteger(ComboBox7.Name, ComboBox7.ItemIndex);
    CadPedVenda.imprimirSeparacao(ComboBox5.Text, ComboBox6.Text, ComboBox7.Text);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.BitBtn101Click(Sender: TObject);
begin
  inherited;
  TForm(pnImpressaoSeparacao.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadPedVenda.BitBtn101KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
    if Key = VK_ESCAPE then
      BitBtn101.Click;
end;

procedure TFrmCadPedVenda.BitBtn103Click(Sender: TObject);
begin
  inherited;
   if not CadPedVenda.vendaFechada then
    Exit;
  if not vDadosIni.PesqPros('VND197', 'ALTERAR', 'PROD.:' + CadPedVenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString, 'PEDVENDA_PROD', CadPedVenda.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
    Exit;
   CadPedVenda.vItProd._alterarValorOriginal;
end;

procedure TFrmCadPedVenda.BitBtn104Click(Sender: TObject);
begin
  inherited;
  if (CadPedVenda.vItProd.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
       Exit;
    application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes','Atenção',+0+64);
    exit;
  end
  else if not(CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) or CadPedVenda.vendaFechada then
    exit
  else if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) then
  	BitBtn16.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) then
	  BitBtn8.SetFocus;
  if not CadPedVenda.verPendenciaVendaIt('P') then
    exit;
  PageControl3.Tag := 1;
  CheckBox6.Enabled := (vDadosIni.vEmp.vSegmentaProdVenda = 'S1') or (vDadosIni.vEmp.vSegmentaProdVenda = 'S2');
  CheckBox6.Checked := false;
//  CadPedVenda.vItProd.Insert;
  DBGrid19 := TDBGrid(DBGrid2);

  if CheckBox4.Checked then
	  vDadosIni.abreForm('Kits de Produtos', pnKitProd, [ofEscapeExit, ofAlignAllClientWinCtrl])
  else
  begin
    tskit.Tag:=1;
    PageControl1.ActivePage := tsKit;
    tskit.Show;
    if (Self.Enabled) and (Self.Visible) and (DBEdit87.CanFocus) then
      DBEdit87.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit78.CanFocus) then
      DBEdit78.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.BitBtn106Click(Sender: TObject);
begin
  inherited;
  if not CadPedVenda.vItProd.IsEmpty then
    vDadosIni.abreFormImagensProduto(CadPedVenda.vItProd.dataSet.FieldByName('DESCR_PROD_PED').AsString,
      CadPedVenda.vItProd.dataSet.FieldByName('GRUPO_PROD').AsString, CadPedVenda.vItProd.dataSet.FieldByName('COD_PROD').AsString,
      CadPedVenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString,
      0, 0, CadPedVenda.buscas);
end;

procedure TFrmCadPedVenda.BitBtn10Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.getTipoVenda = 'OS' then
  begin
    if not vDadosIni.PesqPros('VND015', 'EDITANDO REGISTRO', 'PROD.:' +
      CadPedVenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString, 'PEDVENDA_PROD',
      CadPedVenda.dataSet.FieldByName('NPED').AsString + '-' +
      CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
      Exit;
  end
  else if not vDadosIni.PesqPros('VND019', 'EDITANDO REGISTRO', 'PROD.:' + CadPedVenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString, 'PEDVENDA_PROD', CadPedVenda.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
    Exit;
  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.verPendenciaVendaIt('P') then
    exit;
  if CadPedVenda.vItProd.Edit then
  begin
  	DBComboBox16.Visible := True;
  	vDadosIni.montarDbComboboxUndConv(
    	CadPedVenda.buscas,
    	DBComboBox16,
      CadPedVenda.vItProd.dataset.fieldbyname('GRUPO_PROD').AsInteger,
      CadPedVenda.vItProd.dataset.fieldbyname('COD_PROD').AsString,
      CadPedVenda.vItProd.dataset.fieldbyname('NUM_FAB_PROD').AsString,
      vDadosIni.IfThen(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString) <> '',
      	UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString)),
        UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE').AsString))));

    DBComboBox17.Visible := True;
    vDadosIni.montarDbComboboxUndConv(
    	CadPedVenda.buscas,
    	DBComboBox17,
      CadPedVenda.vItProd.dataset.fieldbyname('GRUPO_PROD').AsInteger,
      CadPedVenda.vItProd.dataset.fieldbyname('COD_PROD').AsString,
      CadPedVenda.vItProd.dataset.fieldbyname('NUM_FAB_PROD').AsString,
      vDadosIni.IfThen(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString) <> '',
      	UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString)),
        UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE').AsString))));

    DBGrid3.Enabled:=not(CadPedVenda.vItProd.dataSet.State in [dsInsert, dsEdit]);
    Panel16.Enabled := true;
    dbedit46.enabled := false;
    SpeedButton15.Enabled := false;
    vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit47.Enabled := vDadosIni.PesqPros('VND135', 'HABILITAR', '', 'PEDVENDA_PROD', CadPedVenda.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, False);
    vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit51.Enabled := not vDadosIni.PesqPros('VND133', 'HABILITAR', '', 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').AsString + '/' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, false);
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('VND179', 'HABILITAR', '', 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').AsString + '/' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, false) then
    begin
     DBEdit50.Enabled := False;
     DBEdit19.Enabled := False;
     DBEdit20.Enabled := False;
    end
    else
    begin
     DBEdit50.Enabled := True;
     DBEdit19.Enabled := True;
     DBEdit20.Enabled := True;
    end;

    GroupBox14.Enabled := false;
//    GroupBox16.Enabled := false;

    if vDadosIni.vEmp.vAlmox ='S2' then
    	DBEdit47.Enabled := false;

    if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'T') then
    begin
    	vDadosIni.vInibeMensPesqPros := 'S';
      DBEdit14.Enabled := vDadosIni.PesqPros('VND297', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False);
      DBEdit51.Enabled := DBEdit14.Enabled;
    	edValorUnitarioVendaRapida.Enabled := DBEdit14.Enabled;
    end
    else if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'P') then
    begin
    	vDadosIni.vInibeMensPesqPros := 'S';
      DBEdit14.Enabled := vDadosIni.PesqPros('VND298', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False);
      DBEdit51.Enabled := DBEdit14.Enabled;
    	edValorUnitarioVendaRapida.Enabled := DBEdit14.Enabled;
    end
    else if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'Q') then
    begin
    	vDadosIni.vInibeMensPesqPros := 'S';
      DBEdit14.Enabled := vDadosIni.PesqPros('VND299', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False);
      DBEdit51.Enabled := DBEdit14.Enabled;
    	edValorUnitarioVendaRapida.Enabled := DBEdit14.Enabled;
    end
    else
    begin
      DBEdit14.Enabled := (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'P')
      	and (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'T')
        and (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'Q');

//      if (DBEdit14.Enabled) and (CadPedVenda.vItProd.dataSet.FieldByName('precoporqtde').AsString = 'S') then
//        DBEdit14.Enabled := vDadosIni.vPedVnd.alterarPrecoProdutosQtde;

      DBEdit51.Enabled := DBEdit14.Enabled;
    	edValorUnitarioVendaRapida.Enabled := DBEdit14.Enabled;
    end;
    DBEdit16.Enabled := DBEdit14.Enabled;
    if DBEdit14.Enabled then
    begin
      vDadosIni.vInibeMensPesqPros := 'S';
      if not vDadosIni.PesqPros('VND172', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, True) then
      begin
        if CadPedVenda.getTipoVenda = 'REQ' then
        begin
          DBEdit14.Enabled := not CadPedVenda.vItProd._usarPrecoCustoTiposVendas('REQ', CadPedVenda.dataSet.FieldByName('TIPV').AsString);
        	DBEdit51.Enabled := DBEdit14.Enabled;
    			edValorUnitarioVendaRapida.Enabled := DBEdit14.Enabled;
        end
        else if Trim(CadPedVenda.getTipoVenda) = 'OS' then
        begin
          DBEdit14.Enabled := not CadPedVenda.vItProd._usarPrecoCustoTiposVendas('OS', CadPedVenda.dataSet.FieldByName('TIPO_OS').AsString);
          DBEdit51.Enabled := DBEdit14.Enabled;
    			edValorUnitarioVendaRapida.Enabled := DBEdit14.Enabled;
        end;
      end;
    end;

    if (Self.Enabled) and (Self.Visible) and (DBEdit44.CanFocus) then
      DBEdit44.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox8.CanFocus) then
      DBLookupComboBox8.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit45.CanFocus) then
      DBEdit45.SetFocus;
    end
    else
      DBGrid3.Enabled := not (CadPedVenda.vItProd.dataSet.State in [dsInsert, dsEdit]);
end;

procedure TFrmCadPedVenda.BitBtn110Click(Sender: TObject);
var
  vValorParcelas: Double;
  I: Integer;
begin
  inherited;
  vValorParcelas := 0;

  if (Length(CadPedVenda.FContas.numeroDocumento) > 0) and (cdsDesp.IsEmpty) then
    btGerarClick(Sender);

  for I := 0 to Length(CadPedVenda.FContas.numeroDocumento) - 1 do
    vValorParcelas := vValorParcelas + CadPedVenda.FContas.valorDocumento[I];

  if (vDadosIni.StrToFloatFormat(vValorParcelas, 2) > 0) and (vDadosIni.StrToFloatFormat(vValorParcelas, 2) <>  vDadosIni.StrToFloatFormat(EditHw3.AsValue, 2)) then
  begin
   Application.MessageBox(Pchar('Valor total das parcelas difere do valor do serviço de terceiro' + #13 +
      'Valor total do parcelamento: R$ ' + FormatFloat('0.00', vValorParcelas) + #13 +
      'Valor do serviço: R$ ' + FormatFloat('0.00', EditHw3.AsValue) + #13 +
      'Favor conferir!'), 'Aviso', MB_OK + MB_ICONEXCLAMATION + MB_DEFBUTTON1);
     exit;
  end;

  BitBtn66.Enabled := true;
  BitBtn67.Enabled := true;
  btGerar.Enabled := true;
  btApagarDesp.Enabled := true;

  TForm(pnFaturaPd.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.BitBtn111Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja cancelar lançamento das despesas?', 'Atenção',  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
   exit;

  try
    btApagarDespClick(Sender);
    TForm(pnFaturaPd.Parent).ModalResult := IDCANCEL;
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

procedure TFrmCadPedVenda.BitBtn112Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VND237', 'INCLUIR', '', 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').AsString,
    CadPedVenda.buscas, FALSE) then
    Exit;

  TForm(pnDetFaturas.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.BitBtn113Click(Sender: TObject);
begin
  inherited;
  TForm(pnDetFaturas.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadPedVenda.btSelectAllProdutosTerceiroMesclarClick(Sender: TObject);
begin
  CadPedVenda.marcarDesmarcarItemProdTercTodos;
end;

procedure TFrmCadPedVenda.btSelectAllServicosTerceiroMesclarClick(Sender: TObject);
begin
  CadPedVenda.marcarDesmarcarItemServTercTodos;
end;

procedure TFrmCadPedVenda.btSelectProdAllClick(Sender: TObject);
begin
  inherited;
	try
  	Screen.Cursor := crHourGlass;

		CadPedVenda.vItProd._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.btSelectServAllClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

		CadPedVenda.vItServ._marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.bt_ecomm_okClick(Sender: TObject);
begin
  if (Self.Enabled) and (Self.Visible) and (bt_ecomm_ok.CanFocus) then
  	bt_ecomm_ok.SetFocus;
  if not CadPedVenda.salvarDadosEnvioEC then
  begin
    setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro);
    exit;
  end;
  TForm(pnEcommerce.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.bt_ecomm_cancelClick(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (bt_ecomm_ok.CanFocus) then
  	bt_ecomm_ok.SetFocus;
  CadPedVenda.Cancel;
  CadPedVenda.RollBackTransacao;
  TForm(pnEcommerce.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadPedVenda.bt_cliente_dests_utilizar_entregaClick(Sender: TObject);
begin
  inherited;
  CadPedVenda.vCliente.endAdic.utilizarEndereco_entrega;
  grid_cliente_dests.Repaint;
  pedvenda_cliente_endadd_scroll;
end;

procedure TFrmCadPedVenda.BitBtn11Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.getTipoVenda = 'OS' then
  begin
    if not vDadosIni.PesqPros('VND016', 'CANCELAR ALTERAÇÃO OU INCLUSÃO', '', 'PEDVENDA_PROD', CadPedVenda.vItProd.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
      Exit;
  end
  else if not vDadosIni.PesqPros('VND020', 'CANCELAR ALTERAÇÃO OU INCLUSÃO', '', 'PEDVENDA_PROD', CadPedVenda.vItProd.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
    Exit;
  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.verPendenciaVendaIt('P') then
    exit;
  if CadPedVenda.vItProd.Cancel then
  begin
  	DBComboBox16.Visible := False;
  	vDadosIni.carregarUnidades(
      CadPedVenda.buscas,
      DBComboBox16);

    DBComboBox16.Visible := False;
    vDadosIni.carregarUnidades(
      CadPedVenda.buscas,
      DBComboBox17);
      
    CadPedVenda.calculaTotais;
    //    CadPedVenda.calculaDescontoAcrescimo;
    DBGrid3.Enabled:= not(CadPedVenda.vItProd.dataSet.State in [dsInsert, dsEdit]);
    GroupBox14.Enabled := true;
    Panel16.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) then
	    BitBtn8.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (BitBtn9.CanFocus) then
	    BitBtn9.SetFocus;
    Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
  end;
end;

procedure TFrmCadPedVenda.bt_obter_valores_nfClick(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    bt_obter_valores_nf.Enabled := False;
    vDadosIni.abreStatusProcessamento('Calculando valores da NF', 'Aguarde enquanto o sistema está processando');

    CadPedVenda.fat_ped.calcular_valores_nf();
  finally
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
    bt_obter_valores_nf.Enabled := True;
  end;
end;

procedure TFrmCadPedVenda.BitBtn120Click(Sender: TObject);
begin
  inherited;
  TForm(pnCondPagPolitica.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.BitBtn121Click(Sender: TObject);
begin
  inherited;
  CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsInteger := vCondpagPoliticaDesc;
  DBEdit147Exit(Sender);
  TForm(pnCondPagPolitica.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadPedVenda.BitBtn12Click(Sender: TObject);
begin
  inherited;
  CadPedVenda.desselecionaDAVsParaMesclagem(DBGrid9.DataSource.DataSet.FieldByName('NPED').AsInteger, DBGrid9.DataSource.DataSet.FieldByName('TIPO').AsString, false);
end;

procedure TFrmCadPedVenda.BitBtn13Click(Sender: TObject);
begin
  inherited;
  CadPedVenda.desselecionaDAVsParaMesclagem(DBGrid9.DataSource.DataSet.FieldByName('NPED').AsInteger, DBGrid9.DataSource.DataSet.FieldByName('TIPO').AsString, true);
end;

procedure TFrmCadPedVenda.BitBtn14Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.getTipoVenda = 'OS' then
  begin
    if not vDadosIni.PesqPros('VND022', 'INCLUIR ITEM', '', 'PEDVENDA_SERV', '', CadPedVenda.buscas, true) then
      Exit;
  end
  else if not vDadosIni.PesqPros('VND026', 'INCLUIR ITEM', '', 'PEDVENDA_SERV', '', CadPedVenda.buscas, true) then
    Exit;

  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.verPendenciaVendaIt('S') then
    exit;
  Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
  Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
//  if not CadPedVenda.ChecaCamposObrigatorios then
//  begin
//    setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro);
//    exit;
//  end;
  if CadPedVenda.vItServ.Insert then
  begin
    Panel17.Enabled := true;
    DBEdit56.Enabled := true;
    DBLookupComboBox6.Enabled := true;
    DBEdit57.Enabled := true;
    GroupBox14.Enabled := false;
    DBGrid5.Enabled := false;
    vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit62.ReadOnly := vDadosIni.PesqPros('VND133', 'HABILITAR', '', 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').AsString + '/' + CadPedVenda.vItServ.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, false);
    DBEdit62.Enabled := True;
    DBEdit58.Enabled := True;
    if (Self.Enabled) and (Self.Visible) and (DBEdit56.CanFocus) and (DBEdit56.Enabled) then
      DBEdit56.SetFocus;
//    else if (Self.Enabled) and (Self.Visible) and (DBEdit59.CanFocus) then
//      DBEdit59.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.BitBtn15Click(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  CadPedVenda.fichaVeiculoAparelho('V');
end;

procedure TFrmCadPedVenda.BitBtn16Click(Sender: TObject);
begin
  inherited;
  if (activecontrol = BitBtn104) then
  begin
    BitBtn104Click(Sender);
  	Exit;
  end;

  if CadPedVenda.getTipoVenda = 'OS' then
  begin
    if not vDadosIni.PesqPros('VND014', 'INCLUIR ITEM', '', 'PEDVENDA_PROD', '', CadPedVenda.buscas, true) then
      Exit;
  end
  else if CadPedVenda.getTipoVenda = 'ORC' then
  begin
    if not vDadosIni.PesqPros('VND018', 'INCLUIR ITEM', '', 'PEDVENDA_PROD', '', CadPedVenda.buscas, true) then
      Exit;
  end
  else
  begin
    if not vDadosIni.PesqPros('VND010', 'INCLUIR ITEM', '', 'PEDVENDA_PROD', '', CadPedVenda.buscas, true) then
      Exit;
  end;

  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.verPendenciaVendaIt then
    exit;

  if not CadPedVenda.vItProd.validaAcresDescNoItem(DBComboBox6.Text, DBComboBox7.Text, CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit95.CanFocus) then
	    DBEdit95.setfocus;
    exit;
  end;
  Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
  if CadPedVenda.vItProd.Insert then
  begin
    CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency := 0;
    CadPedVenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString := 'DESCONTO';
    CadPedVenda.vItProd.dataSet.FieldByName('NAT_DESCACRES').AsString := 'PERCENTUAL';
    //    CadPedVenda.vItProd
    //    edmDescACres.Valor:=0;
    DBComboBox16.Visible := True;
    DBComboBox17.Visible := True;
    Panel15.Enabled := true;
    dbedit9.enabled := true;
    dbedit10.enabled := true;
    SpeedButton13.Enabled := true;
    GroupBox7.Enabled := false;

    if (Self.Enabled) and (Self.Visible) and (DBEdit129.CanFocus) then
      DBEdit129.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit8.Visible) and (DBEdit8.CanFocus) then
      DBEdit8.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
      DBEdit9.SetFocus
    else
      Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFrmCadPedVenda.BitBtn17Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.vendaFechada then
    Exit;

  if not CadPedVenda.vItProd.validaAcresDescNoItem(
  	DBComboBox6.Text,
    DBComboBox7.Text,
    CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit95.CanFocus) then
	    DBEdit95.setfocus;
    exit;
  end;

  if not CadPedVenda.vItProd.validarAcrescDescAcrescCondPagComissaoVend then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit128.CanFocus) then
	    DBEdit128.setfocus;
    exit;
  end;

  if not verificarDescontoTabDifPromPrecoQtde(
  	CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('VLUN_ORIG').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString,
    CadPedVenda.vItProd.dataSet.FieldByName('NAT_DESCACRES').AsString,
    CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsFloat,
    False) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit14.CanFocus) then
      DBEdit14.SetFocus;
    exit;
  end;

  if not CadPedVenda.vItProd.Post then
  begin
    Panel15.Enabled := true;
    GroupBox7.Enabled := false;
    if CadPedVenda.vItProd.vNomeCampoErro <> '' then
      setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro)
    else if (Self.Enabled) and (Self.Visible) and (dbedit9.CanFocus) then
      dbedit9.setfocus
    else if (Self.Enabled) and (Self.Visible) and (dbedit10.CanFocus) then
      dbedit10.setfocus;
    exit;
  end
  else
  begin
  	DBComboBox16.Visible := False;
  	vDadosIni.carregarUnidades(
      CadPedVenda.buscas,
      DBComboBox16);

    DBComboBox16.Visible := False;
    vDadosIni.carregarUnidades(
      CadPedVenda.buscas,
      DBComboBox17);

//    Panel15.Enabled := false;
    GroupBox7.Enabled := true;
    CadPedVenda.calculaTotais;
    if DBEdit21.CanFocus then
    ActiveControl := DBEdit21;
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    //    CadPedVenda.vCliente.ChecaLimiteEstourado(CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency);
    if (CadPedVenda.vNPEDold <> CadPedVenda.dataSet.FieldByName('NPED').AsInteger) and (vDadosIni.vEmp.vAbaterItens = 'S') then
    begin
      if CadPedVenda.getTipoVenda = 'REQ' then
        CadPedVenda.verificatipovenda(1, DBComboBox1, 'REQ', '');
      CadPedVenda.vNPEDold := CadPedVenda.dataSet.FieldByName('NPED').AsInteger;
    end;
  end;
end;

procedure TFrmCadPedVenda.BitBtn18Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.getTipoVenda = 'OS' then
  begin
    if not vDadosIni.PesqPros('VND015', 'EDITANDO REGISTRO', 'PROD.:' + CadPedVenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString, 'PEDVENDA_PROD', CadPedVenda.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
      Exit;
  end
  else if CadPedVenda.getTipoVenda = 'ORC' then
  begin
    if not vDadosIni.PesqPros('VND019', 'EDITANDO REGISTRO', 'PROD.:' + CadPedVenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString, 'PEDVENDA_PROD', CadPedVenda.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
      Exit;
  end
  else
  begin
    if not vDadosIni.PesqPros('VND011', 'EDITANDO REGISTRO', 'PROD.:' + CadPedVenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString, 'PEDVENDA_PROD', CadPedVenda.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
      Exit;
  end;

  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.verPendenciaVendaIt then
    exit;
  if CadPedVenda.vItProd.Edit then
  begin
  	DBComboBox16.Visible := True;
  	vDadosIni.montarDbComboboxUndConv(
      CadPedVenda.buscas,
    	DBComboBox16,
      CadPedVenda.vItProd.dataset.fieldbyname('GRUPO_PROD').AsInteger,
      CadPedVenda.vItProd.dataset.fieldbyname('COD_PROD').AsString,
      CadPedVenda.vItProd.dataset.fieldbyname('NUM_FAB_PROD').AsString,
      vDadosIni.IfThen(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString) <> '',
      	UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString)),
        UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE').AsString))));

    DBComboBox16.Visible := True;
    vDadosIni.montarDbComboboxUndConv(
      CadPedVenda.buscas,
    	DBComboBox17,
      CadPedVenda.vItProd.dataset.fieldbyname('GRUPO_PROD').AsInteger,
      CadPedVenda.vItProd.dataset.fieldbyname('COD_PROD').AsString,
      CadPedVenda.vItProd.dataset.fieldbyname('NUM_FAB_PROD').AsString,
      vDadosIni.IfThen(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString) <> '',
      	UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString)),
        UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE').AsString))));

    Panel15.Enabled := true;
    dbedit9.enabled := false;
    vDadosIni.vInibeMensPesqPros := 'S';
    dbedit10.enabled := vDadosIni.PesqPros('VND135', 'HABILITAR', '', 'PEDVENDA_PROD', CadPedVenda.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, False);
    SpeedButton13.Enabled := false;
    GroupBox7.Enabled := false;

    if vDadosIni.vEmp.vAlmox = 'S2' then
    begin
	    DBEdit10.Enabled := false;
      if (Self.Enabled) and (Self.Visible) and (DBEdit14.CanFocus) then
	      DBEdit14.SetFocus;
      exit;
    end;

    if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'T') then
    begin
    	vDadosIni.vInibeMensPesqPros := 'S';
      DBEdit14.Enabled := vDadosIni.PesqPros('VND297', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False);
      DBEdit51.Enabled := DBEdit14.Enabled;
    	edValorUnitarioVendaRapida.Enabled := DBEdit14.Enabled;
    end
    else if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'P') then
    begin
    	vDadosIni.vInibeMensPesqPros := 'S';
      DBEdit14.Enabled := vDadosIni.PesqPros('VND298', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False);
      DBEdit51.Enabled := DBEdit14.Enabled;
    	edValorUnitarioVendaRapida.Enabled := DBEdit14.Enabled;
    end
    else if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'Q') then
    begin
    	vDadosIni.vInibeMensPesqPros := 'S';
      DBEdit14.Enabled := vDadosIni.PesqPros('VND299', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False);
      DBEdit51.Enabled := DBEdit14.Enabled;
    	edValorUnitarioVendaRapida.Enabled := DBEdit14.Enabled;
    end
    else
    begin
      DBEdit14.Enabled := (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'P')
      	and (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'T')
        and (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'Q');

//      if (DBEdit14.Enabled) and (CadPedVenda.vItProd.dataSet.FieldByName('precoporqtde').AsString = 'S') then
//        DBEdit14.Enabled := vDadosIni.vPedVnd.alterarPrecoProdutosQtde;

      DBEdit51.Enabled := DBEdit14.Enabled;
    	edValorUnitarioVendaRapida.Enabled := DBEdit14.Enabled;
    end;
    DBEdit16.Enabled := DBEdit14.Enabled;
    if DBEdit14.Enabled then
    begin
      vDadosIni.vInibeMensPesqPros := 'S';
      if not vDadosIni.PesqPros('VND172', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, True) then
      begin
        if CadPedVenda.getTipoVenda = 'REQ' then
        begin
          DBEdit14.Enabled := not CadPedVenda.vItProd._usarPrecoCustoTiposVendas('REQ', CadPedVenda.dataSet.FieldByName('TIPV').AsString);
        	DBEdit51.Enabled := DBEdit14.Enabled;
    			edValorUnitarioVendaRapida.Enabled := DBEdit14.Enabled;
        end
        else if Trim(CadPedVenda.getTipoVenda) = 'OS' then
        begin
          DBEdit14.Enabled := not CadPedVenda.vItProd._usarPrecoCustoTiposVendas('OS', CadPedVenda.dataSet.FieldByName('TIPO_OS').AsString);
          DBEdit51.Enabled := DBEdit14.Enabled;
    			edValorUnitarioVendaRapida.Enabled := DBEdit14.Enabled;
        end;
      end;
    end;

    if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) then
      DBEdit8.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
      DBEdit10.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.BitBtn19Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.getTipoVenda = 'OS' then
  begin
    if not vDadosIni.PesqPros('VND016', 'CANCELAR ALTERAÇÃO OU INCLUSÃO', '', 'PEDVENDA_PROD', CadPedVenda.vItProd.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
      Exit;
  end
  else if CadPedVenda.getTipoVenda = 'ORC' then
  begin
    if not vDadosIni.PesqPros('VND020', 'CANCELAR ALTERAÇÃO OU INCLUSÃO', '', 'PEDVENDA_PROD', CadPedVenda.vItProd.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
      Exit;
  end
  else
  begin
    if not vDadosIni.PesqPros('VND012', 'CANCELAR ALTERAÇÃO OU INCLUSÃO', '', 'PEDVENDA_PROD', CadPedVenda.vItProd.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
      Exit;
  end;

  if CadPedVenda.vendaFechada then
    Exit;
  if CadPedVenda.cargaFechada then
  begin
    Application.MessageBox('Carga fechada! Não é permitido fazer qualquer alteração no pedido','Atenção', 0 + 64);
    Exit;
  end;
  if CadPedVenda.vItProd.Cancel then
  begin
  	DBComboBox16.Visible := False;
  	vDadosIni.carregarUnidades(
      CadPedVenda.buscas,
      DBComboBox16);

    DBComboBox17.Visible := False;
    vDadosIni.carregarUnidades(
      CadPedVenda.buscas,
      DBComboBox17);

    CadPedVenda.calculaTotais;
    CadPedVenda.calculaDescontoAcrescimo;
    GroupBox7.Enabled := true;
    GroupBox5.Enabled := true;
//    Panel15.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) then
	    BitBtn16.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (BitBtn17.CanFocus) then
  	  BitBtn17.SetFocus;

    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
  end;
end;

procedure TFrmCadPedVenda.BitBtn1Click(Sender: TObject);
var
	I: Integer;
begin
  try
    Screen.Cursor := crHourGlass;
    if CadPedVenda.getTipoVenda = 'REQ' then
    begin
      if not vDadosIni.PesqPros('VND064', 'CONSULTAR', '', 'PEDVENDA', '', CadPedVenda.buscas, FALSE) then
        Exit;
    end
    else if CadPedVenda.getTipoVenda = 'OS' then
    begin
      if not vDadosIni.PesqPros('VND065', 'CONSULTAR', '', 'PEDVENDA', '', CadPedVenda.buscas, FALSE) then
        Exit;
    end
    else if not vDadosIni.PesqPros('VND066', 'CONSULTAR', '', 'PEDVENDA', '', CadPedVenda.buscas, FALSE) then
      Exit;

    CadPedVenda.rPED.vCampo := ComboBox1.Text;
    CadPedVenda.rPED.vCampoAd := ComboBox11.Text;
    CadPedVenda.rPED.vValorAd := trim(MaskEdit8.Text);
    CadPedVenda.rPED.vDataIniAd := MaskEdit10.Text;
    CadPedVenda.rPED.vDataFimAd := MaskEdit9.Text;
    CadPedVenda.rPED.vCondicaoAd := ComboBox12.Text;
    CadPedVenda.rPED.vPorDataAd := MaskEdit10.Visible;
    CadPedVenda.rPED.vAdicional := CheckBox1.Checked;
    CadPedVenda._defineSqlAdicional;

    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	    DBGrid1.SetFocus;

    if not CadPedVenda.ConsultaAvancada('PEDVENDA', MaskEdit3.Text, ComboBox1.Text,
      ComboBox3.text, CadPedVenda.dataSet.FieldByName('nped').DisplayLabel,
      CheckBox3.Checked, true,
      vDadosIni.codEmpresa, maskedit1.text, maskedit2.text,
      RadioGroup2.ItemIndex, RadioGroup1.ItemIndex, MaskEdit2.Visible) then
        if (Self.Enabled) and (Self.Visible) and (combobox1.CanFocus) then
          combobox1.setfocus;

    if CadPedVenda.dataSet.Active then
      for I := 0 to DBGrid1.Columns.Count - 1 do
        if DBGrid1.Columns[i].FieldName = 'OBS_MINUTA' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis
        else if DBGrid1.Columns[i].FieldName = 'OBS_OS' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis
        else if DBGrid1.Columns[i].FieldName = 'OBS_TPVENDA' then
        	DBGrid1.Columns[i].ButtonStyle := cbsEllipsis
        else if DBGrid1.Columns[i].FieldName = 'DEFEITO' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis
        else if DBGrid1.Columns[i].FieldName = 'ESTADO_VEIC' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis
        else if DBGrid1.Columns[i].FieldName = 'ACESSORIOS' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis
        else if DBGrid1.Columns[i].FieldName = 'SELOS_COL' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis
        else if DBGrid1.Columns[i].FieldName = 'SELOS_REM' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis
        else if DBGrid1.Columns[i].FieldName = 'LACRES_COL' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis
        else if DBGrid1.Columns[i].FieldName = 'LACRES_REM' then
          DBGrid1.Columns[i].ButtonStyle := cbsEllipsis;
      
  finally
  	 inherited;
    if vDadosIni.vEmp.vUsarDAV <> 'S' then
      lixeiraVazia(CadPedVenda.lixeiraVazia);

    vDadosIni.vInibeMensPesqPros := 'S';
    if vDadosIni.PesqPros('VND128', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, true) then
    begin
      if vDadosIni.vEmp.vUsarDAV = 'S' then
      begin
        SpeedButton4.Visible := FALSE;
        SpeedButton25.Visible := FALSE;
      end;
    end
    else
    begin
      SpeedButton4.Visible := FALSE;
      SpeedButton25.Visible := FALSE;
    end;

    if (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'REQ') then
    begin
      SpeedButton1.Visible := True;
      SpeedButton6.Visible := True;
      SpeedButton7.Visible := True;
      SpeedButton8.Visible := True;
      SpeedButton10.Visible := (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'REQ');
      SpeedButton16.Visible := (CadPedVenda.getTipoVenda = 'OS');
      //      SpeedButton11.Visible := False;
      SpeedButton23.Visible := (CadPedVenda.getTipoVenda = 'OS') and (vDadosIni.vEmp.vUsarAparelho = 'S');
      SpeedButton28.Visible := (CadPedVenda.getTipoVenda = 'REQ') and (vDadosIni.vEmp.vVnd_AprovacaoGerente = 'S');
      SpeedButton29.Visible := (CadPedVenda.getTipoVenda = 'REQ') and (vDadosIni.vEmp.vOC_TipoControleOrdemC = 'REQ');
      SpeedButton62.Visible := vDadosIni.vEmp.vUsarPoliticasDesc;
    end
    else if CadPedVenda.getTipoVenda = 'ORC' then
    begin
      SpeedButton6.Visible := false;
      SpeedButton7.Visible := false;
      SpeedButton8.Visible := false;
      //      SpeedButton11.Visible := True;
      SpeedButton10.Visible := false;
      SpeedButton16.Visible := false;
      SpeedButton12.Visible := false;
      SpeedButton23.Visible := false;
      SpeedButton28.Visible := False;
      SpeedButton29.Visible := False;
      SpeedButton62.Visible := False;
    end;

    gravaConfiguracoesFormRegistro;

    SpeedButton5.Visible := False;
    panelOS.Width := 840; //PageControl1.ClientWidth-25;
    panel4.Width := 840; //PageControl1.ClientWidth-25;
    //    panel4.Width:=Width-30;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.BitBtn20Click(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  CadPedVenda.fichaVeiculoAparelho('A');
end;

procedure TFrmCadPedVenda.BitBtn21Click(Sender: TObject);
begin
  inherited;
  if not(CadPedVenda.dataSet.State in [dsEdit, dsInsert]) then
    exit;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('EQUIPAMENTO', ' AND EQUIPAMENTO.TIP_EQUIP = ''E'' ', '');
  if (Trim(vDadosIni.vPesquisa) = '') then
  begin
    vDadosIni.vPesquisa := '0';
    if (Self.Enabled) and (Self.Visible) and (DBEdit41.CanFocus) then
	    DBEdit41.SetFocus;
  end
  else if not CadPedVenda.buscaAparelho(StrToInt(vDadosIni.vPesquisa), Memo2) then
    if (Self.Enabled) and (Self.Visible) and (DBEdit40.CanFocus) then
	    DBEdit40.SetFocus;
end;

procedure TFrmCadPedVenda.BitBtn22Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  for I := 0 to DBComboBox4.Items.Count - 1 do
  begin
    if copy(DBComboBox4.Items[I], 1, 1) = copy(DBComboBox4.Text, 1, 1) then
    begin
      TForm(pnTipoVenda.Parent).ModalResult := IDOK;
      Exit;
    end;
  end;
  Application.MessageBox('Tipo de venda inválido', 'Atenção', 0 + 64);
end;

procedure TFrmCadPedVenda.BitBtn23Click(Sender: TObject);
begin
  inherited;
  TForm(pnCondPag.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.BitBtn24Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VND068', 'INCLUIR', '', 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').AsString, CadPedVenda.buscas, true) then
    Exit;
  CadPedVenda.incluirOcorrencia(Memo3.Lines.Text, MaskEdit4.Text, MaskEdit5.Text);
end;

procedure TFrmCadPedVenda.BitBtn25Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VND069', 'EXCLUIR', '', 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').AsString, CadPedVenda.buscas, true) then
    Exit;

 if Application.MessageBox('Tem certeza que deseja excluir esta ocorrência?',
    'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
  CadPedVenda.vOcorr.Delete;
end;

procedure TFrmCadPedVenda.BitBtn26Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.vItServ.Post then
  begin
    Panel17.Enabled := true;
    GroupBox14.Enabled := false;
    DBGrid5.Enabled := false;
    setFocusCampoErro(CadPedVenda.vItServ.vNomeCampoErro, CadPedVenda.vItServ.vMensagemErro);
//    if (Self.Enabled) and (Self.Visible) and (DBEdit56.CanFocus) then
//      DBEdit56.SetFocus;
//    else if (Self.Enabled) and (Self.Visible) and (DBEdit56.CanFocus) then
//      DBEdit56.SetFocus;
    exit;
  end
  else
  begin
//    CadPedVenda.vItServ.vTipServ.dataSet.Filtered:=false;
    Panel17.Enabled := false;
    DBGrid5.Enabled := true;
    CadPedVenda.calculaTotais;
    GroupBox14.Enabled := true;
    if (Self.Enabled) and (Self.Visible) and (DBEdit29.CanFocus) then
      DBEdit29.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (edDescProdValor.CanFocus) then
      edDescProdValor.SetFocus;
    //    CadPedVenda.vCliente.ChecaLimiteEstourado(CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency);
  end;
  if vDadosIni.vEmp.vSegmentaProdVenda = 'S2' then
  begin
    CadPedVenda.vItServ.Refresh;
    CadPedVenda.vItProd.Refresh;
    CadPedVenda.vItProd.vTipServ.Refresh;
  end;
end;

procedure TFrmCadPedVenda.BitBtn27Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.getTipoVenda = 'OS' then
  begin
    if not vDadosIni.PesqPros('VND023', 'EDITAR REGISTRO', 'SERV.:' + CadPedVenda.vItServ.dataSet.FieldByName('COD_SERVICO').AsString, 'PEDVENDA_SERV', CadPedVenda.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItServ.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
      Exit;
  end
  else if not vDadosIni.PesqPros('VND027', 'EDITAR REGISTRO', 'SERV.:' + CadPedVenda.vItServ.dataSet.FieldByName('COD_SERVICO').AsString, 'PEDVENDA_SERV', CadPedVenda.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItServ.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
    Exit;

  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.verPendenciaVendaIt('S') then
    exit;
//  vRecNo := CadPedVenda.vItServ.dataSet.RecNo;
//  if not CadPedVenda.ChecaCamposObrigatorios then
//  begin
//    setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro);
//    exit;
//  end;
//  CadPedVenda.vItServ.dataSet.RecNo := vRecNo;
  if CadPedVenda.vItServ.Edit then
  begin
    Panel17.Enabled := true;
    DBEdit56.Enabled := false;
    DBLookupComboBox6.Enabled := false;
    vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit57.Enabled := vDadosIni.PesqPros('VND135', 'HABILITAR', '', 'PEDVENDA_PROD', CadPedVenda.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItServ.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, False);
    vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit62.ReadOnly := vDadosIni.PesqPros('VND133', 'HABILITAR', '', 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').AsString + '/' + CadPedVenda.vItServ.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, false);
    GroupBox14.Enabled := false;
    DBGrid5.Enabled := false;
    if CadPedVenda.vItServ.vTipServ.dataSet.FieldByName('SHONDA').AsString = 'S' then
    begin
      DBEdit62.Enabled := False;
      DBEdit58.Enabled := True;
    end
    else
    begin
      DBEdit62.Enabled := True;
      DBEdit58.Enabled := False;
    end;
    if (Self.Enabled) and (Self.Visible) and (DBEdit59.CanFocus) then
      DBEdit59.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.BitBtn28Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.getTipoVenda = 'OS' then
  begin
    if not vDadosIni.PesqPros('VND096', 'CANCELAR ALTERAÇÃO OU INCLUSÃO', '', 'PEDVENDA_SERV', CadPedVenda.vItServ.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItServ.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
      Exit;
  end
  else if not vDadosIni.PesqPros('VND097', 'CANCELAR ALTERAÇÃO OU INCLUSÃO', '', 'PEDVENDA_SERV', CadPedVenda.vItServ.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItServ.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
    Exit;

  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.verPendenciaVendaIt('S') then
    exit;
  if CadPedVenda.vItServ.Cancel then
  begin
//    CadPedVenda.vColab.dataSet.Filtered:=false;
    CadPedVenda.calculaTotais;
    //    CadPedVenda.calculaDescontoAcrescimo;
    DBGrid5.Enabled := true;
    GroupBox14.Enabled := true;
    Panel17.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (BitBtn14.CanFocus) then
	    BitBtn14.SetFocus;
    Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
  end;
  if vDadosIni.vEmp.vSegmentaProdVenda = 'S2' then
  begin
    CadPedVenda.vItServ.Refresh;
    CadPedVenda.vItProd.Refresh;
    CadPedVenda.vItProd.vTipServ.Refresh;
  end;
end;

procedure TFrmCadPedVenda.BitBtn29Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.getTipoVenda = 'OS' then
  begin
    if not vDadosIni.PesqPros('VND030', 'INCLUIR ITEM', '', 'PEDVENDA_PROD_TERC', '', CadPedVenda.buscas, true) then
      Exit;
  end
  else if not vDadosIni.PesqPros('VND034', 'INCLUIR ITEM', '', 'PEDVENDA_PROD_TERC', '', CadPedVenda.buscas, true) then
    Exit;
  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.verPendenciaVendaIt('PT') then
    exit;
  Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
  Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
//  Label82.Caption := Format('%m', [CadPedVenda.getValorProdutoTerceiro]);
  if not CadPedVenda.ChecaCamposObrigatorios then
  begin
    setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro);
    exit;
  end;
  if CadPedVenda.vItProdTerc.Insert then
  begin
    Panel18.Enabled := true;
    GroupBox14.Enabled := false;
    DBGrid7.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (DBEdit74.CanFocus) then
	    DBEdit74.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.BitBtn30Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.vItProdTerc.Post then
  begin
    Panel18.Enabled := true;
    GroupBox14.Enabled := false;
    DBGrid7.Enabled := false;
    setFocusCampoErro(CadPedVenda.vItProdTerc.vNomeCampoErro, CadPedVenda.vItProdTerc.vMensagemErro);
//    if (Self.Enabled) and (Self.Visible) and (DBEdit74.CanFocus) then
//    DBEdit74.SetFocus;
    exit;
  end
  else
  begin
    Panel18.Enabled := false;
    DBGrid7.Enabled := true;
    CadPedVenda.calculaTotais;
    GroupBox14.Enabled := true;
    if (Self.Enabled) and (Self.Visible) and (DBEdit29.CanFocus) then
      DBEdit29.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (edDescProdValor.CanFocus) then
      edDescProdValor.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.BitBtn31Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.getTipoVenda = 'OS' then
  begin
    if not vDadosIni.PesqPros('VND031', 'EDITAR ITEM', 'PROD.:' + trim(CadPedVenda.vItProdTerc.dataSet.FieldByName('DESCRICAO').AsString), 'PEDVENDA_PROD_TERC', '', CadPedVenda.buscas, true) then
      Exit;
  end
  else if not vDadosIni.PesqPros('VND035', 'EDITAR ITEM', 'PROD.:' + trim(CadPedVenda.vItProdTerc.dataSet.FieldByName('DESCRICAO').AsString), 'PEDVENDA_PROD_TERC', '', CadPedVenda.buscas, true) then
    Exit;
  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.verPendenciaVendaIt('PT') then
    exit;
  if not CadPedVenda.ChecaCamposObrigatorios then
  begin
    setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro);
    exit;
  end;
  if CadPedVenda.vItProdTerc.Edit then
  begin
    Panel18.Enabled := true;
    GroupBox14.Enabled := false;
    DBGrid7.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (DBEdit74.CanFocus) then
	    DBEdit74.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.BitBtn32Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.getTipoVenda = 'OS' then
  begin
    if not vDadosIni.PesqPros('VND032', 'CANCELAR ALTERAÇÃO OU INCLUSÃO', 'PROD.:' + CadPedVenda.vItProdTerc.dataSet.FieldByName('DESCRICAO').AsString, 'PEDVENDA_PROD_TERC', '', CadPedVenda.buscas, true) then
      Exit;
  end
  else if not vDadosIni.PesqPros('VND036', 'CANCELAR ALTERAÇÃO OU INCLUSÃO', 'PROD.:' + CadPedVenda.vItProdTerc.dataSet.FieldByName('DESCRICAO').AsString, 'PEDVENDA_PROD_TERC', '', CadPedVenda.buscas, true) then
    Exit;

  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.verPendenciaVendaIt('PT') then
    exit;
  if CadPedVenda.vItProdTerc.Cancel then
  begin
    CadPedVenda.calculaTotais;
    GroupBox14.Enabled := true;
    DBGrid7.Enabled := true;
    Panel18.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (BitBtn29.CanFocus) then
	    BitBtn29.SetFocus;
    Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
//    Label82.Caption := Format('%m', [CadPedVenda.getValorProdutoTerceiro]);
  end;
end;

procedure TFrmCadPedVenda.BitBtn33Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.getTipoVenda = 'OS' then
  begin
    if not vDadosIni.PesqPros('VND038', 'INCLUIR ITEM', '', 'PEDVENDA_SERV_TERC', '', CadPedVenda.buscas, true) then
      Exit;
  end
  else
  begin
    if not vDadosIni.PesqPros('VND042', 'INCLUIR ITEM', '', 'PEDVENDA_SERV_TERC', '', CadPedVenda.buscas, true) then
      Exit;
  end;
  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.verPendenciaVendaIt('ST') then
    exit;
  Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
  Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
//  Label61.Caption := Format('%m', [CadPedVenda.getValorServicoTerceiro]);
  if not CadPedVenda.ChecaCamposObrigatorios then
  begin
    setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro);
    exit;
  end;
  if CadPedVenda.vItServTerc.Insert then
  begin
    Panel19.Enabled := true;
    GroupBox14.Enabled := false;
    DBGrid6.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (DBEdit66.CanFocus) then
	    DBEdit66.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.BitBtn34Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.vItServTerc.Post then
  begin
    Panel19.Enabled := true;
    DBGrid6.Enabled := false;
    GroupBox14.Enabled := false;
    setFocusCampoErro(CadPedVenda.vItServTerc.vNomeCampoErro, CadPedVenda.vItServTerc.vMensagemErro);
//    if DBEdit66.CanFocus then
//    DBEdit66.SetFocus;
    exit;
  end
  else
  begin
    Panel19.Enabled := false;
    DBGrid6.Enabled := true;
    CadPedVenda.calculaTotais;
    GroupBox14.Enabled := true;
    if (Self.Enabled) and (Self.Visible) and (DBEdit29.CanFocus) then
      DBEdit29.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (edDescProdValor.CanFocus) then
      edDescProdValor.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.BitBtn35Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.getTipoVenda = 'OS' then
  begin
    if not vDadosIni.PesqPros('VND039', 'EDITAR ITEM', 'SERV.:' + trim(CadPedVenda.vItServTerc.dataSet.FieldByName('DESCR_SERVT').AsString), 'PEDVENDA_SERV_TERC', '', CadPedVenda.buscas, true) then
      Exit;
  end
  else if not vDadosIni.PesqPros('VND043', 'EDITAR ITEM', 'SERV.:' + trim(CadPedVenda.vItServTerc.dataSet.FieldByName('DESCR_SERVT').AsString), 'PEDVENDA_SERV_TERC', '', CadPedVenda.buscas, true) then
    Exit;
  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.verPendenciaVendaIt('ST') then
    exit;
  if not CadPedVenda.ChecaCamposObrigatorios then
  begin
    setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro);
    exit;
  end;
  if CadPedVenda.vItServTerc.Edit then
  begin
    Panel19.Enabled := true;
    GroupBox14.Enabled := false;
    DBGrid6.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (DBEdit66.CanFocus) then
	    DBEdit66.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.BitBtn36Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.getTipoVenda = 'OS' then
  begin
    if not vDadosIni.PesqPros('VND040', 'CANCELAR ALTERAÇÃO OU INCLUSÃO', 'SERV.:' + CadPedVenda.vItServTerc.dataSet.FieldByName('DESCR_SERVT').AsString, 'PEDVENDA_SERV_TERC', '', CadPedVenda.buscas, true) then
      Exit;
  end
  else if not vDadosIni.PesqPros('VND044', 'CANCELAR ALTERAÇÃO OU INCLUSÃO', 'SERV.:' + CadPedVenda.vItServTerc.dataSet.FieldByName('DESCR_SERVT').AsString, 'PEDVENDA_SERV_TERC', '', CadPedVenda.buscas, true) then
    Exit;

  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.verPendenciaVendaIt('ST') then
    exit;
  if CadPedVenda.vItServTerc.Cancel then
  begin
    CadPedVenda.calculaTotais;
    GroupBox14.Enabled := true;
    DBGrid6.Enabled := true;
    Panel19.Enabled := false;
    if (Self.Enabled) and (Self.Visible) and (BitBtn33.CanFocus) then
	    BitBtn33.SetFocus;
    Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
//    Label61.Caption := Format('%m', [CadPedVenda.getValorServicoTerceiro]);
  end;
end;

procedure TFrmCadPedVenda.BitBtn37Click(Sender: TObject);
var
  nped: integer;
begin
  inherited;
  CadPedVenda.abrePedVenda(trunc(EditMoeda2.Valor));
  if (CadPedVenda.dataSet.FieldByName('STATUS_PED').AsString = 'FECHADA') then
  begin
    Application.MessageBox('Ordem de serviço já está FECHADA.', 'Informação', MB_OK + MB_ICONINFORMATION);
    CadPedVenda.abrePedVenda(0);
  end
  else if (CadPedVenda.dataSet.FieldByName('STATUS_PED').AsString = 'CANCELADO') then
  begin
    Application.MessageBox('Ordem de serviço está CANCELADA.', 'Informação', MB_OK + MB_ICONINFORMATION);
    CadPedVenda.abrePedVenda(0);
  end;
  if not CadPedVenda.dataSet.IsEmpty then
  begin
    if CadPedVenda.verificaFechamento(1) then
    begin
      Application.MessageBox('Ordem de serviço sendo Fechada neste momento.', 'Informação', MB_OK + MB_ICONINFORMATION);
      CadPedVenda.abrePedVenda(0);
    end;
  end;
  if not CadPedVenda.dataSet.IsEmpty then
  begin
    nped := CadPedVenda.dataSet.FieldByName('nped').AsInteger;

    CadPedVenda.vItProd.vListarImprimirItemVan := CadPedVenda.retornaVendaTipoVan;
    CadPedVenda.vItProd.abrePedVendaProd(nped);
    CadPedVenda.vCliente.abreClientes(CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger);
    if (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC') then
    begin
      CadPedVenda.vItServ.abrePedVendaServ(nped);
      CadPedVenda.vItServTerc.abreServicoTerceiro(nped);
      CadPedVenda.vItProdTerc.abreProdTerceiro(nped);
      if CadPedVenda.getTipoVenda = 'OS' then
        CadPedVenda.vOcorr.abreOcorreciaPed(nped, CadPedVenda.getTipoVenda);
    end;
    CadPedVenda.vListaColab.ListaColaborador;
    CadPedVenda.vColab.abreColaborador;
    CadPedVenda.vCondPag.abreCondPag;
    CadPedVenda.calculaTotais;
    CadPedVenda.calculaDescontoAcrescimo;
  end;
  if (Self.Enabled) and (Self.Visible) and (BitBtn38.CanFocus) then
	  BitBtn38.SetFocus;
end;

procedure TFrmCadPedVenda.BitBtn38Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.dataSet.IsEmpty then
    exit;
  if not vDadosIni.PesqPros('VND075', 'TRANSFERIR', '', 'PEDVENDA_PROD', '', CadPedVenda.buscas, true) then
    Exit;
  if CadPedVenda.vendaFechada then
  begin
    Application.MessageBox('Ordem de serviço fechada', 'Informação', MB_OK +
      MB_ICONINFORMATION);
    Exit;
  end;
  if CadPedVenda.vItProd.Insert then
  begin
  	MaskEdit6.Text := '';
    CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency := 0;
    CadPedVenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString := 'DESCONTO';
    CadPedVenda.vItProd.dataSet.FieldByName('NAT_DESCACRES').AsString := 'PERCENTUAL';
    
    Panel22.Visible := true;
    Panel23.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (MaskEdit6.CanFocus) then
	    MaskEdit6.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.BitBtn39Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.dataSet.IsEmpty then
    exit;
  if CadPedVenda.vItProd.dataSet.State in [dsinsert, dsEdit] then
     CadPedVenda.vItProd.dataSet.Cancel;
  CadPedVenda.vItProd.Refresh;
  Panel22.Visible := false;
  Panel23.Visible := true;
  BitBtn51.Visible:=true;
  EditHw1.Visible:=true;
  if (Self.Enabled) and (Self.Visible) and (DBGrid14.CanFocus) then
	  DBGrid14.SetFocus;
end;

procedure TFrmCadPedVenda.BitBtn3Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'I', CadPedVenda.buscas) then
    Exit;

  CadPedVenda.vItProd.setDescontoValor(0, 0);
  CadPedVenda.vItProd.setDescontoPercenentual(0);
  CadPedVenda.vItProd.setAcrescimoValor(0);
  CadPedVenda.vItProd.setAcrescimoPercenentual(0);

  if not CadPedVenda._permitirInclusaoEdicaoVND(true) then
    exit;
    	
  CadPedVenda.abreFormEscolhaTipoOrcamento(CheckBox4.Checked, CheckBox9.Checked, true);
  inherited;
  try
    Screen.Cursor := crHourGlass;
    habilitaControlesParaInsercao;
    FormResize(Sender);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.BitBtn40Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.dataSet.IsEmpty then
    exit;
  if CadPedVenda.vItProd.dataSet.State in [dsinsert, dsEdit] then
     CadPedVenda.vItProd.dataSet.Cancel;
  Panel22.Visible := false;
  Panel23.Visible := true;
  if (Self.Enabled) and (Self.Visible) and (DBGrid14.CanFocus) then
	  DBGrid14.SetFocus;
  BitBtn51.Visible:=false;
  EditHw1.Visible:=false;
end;

procedure TFrmCadPedVenda.BitBtn41Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.dataSet.IsEmpty then
    exit;
  Panel22.Visible := false;
  Panel23.Visible := false;
  CadPedVenda.imprimirSolicitacaoOS;
end;

procedure TFrmCadPedVenda.BitBtn42Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.registrarEntrega(Edit3.Text) then
    if (Self.Enabled) and (Self.Visible) and (Edit3.CanFocus) then
	    Edit3.SetFocus;
end;

procedure TFrmCadPedVenda.BitBtn43Click(Sender: TObject);
begin
  inherited;
  if OpenDialog1.Execute then
  begin
    RichEdit1.Lines.LoadFromFile(OpenDialog1.FileName);
  end;
end;

procedure TFrmCadPedVenda.BitBtn46Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.SalvarDadosOSParaLivro then
  begin
    TabSheet2.Show;
    if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	    DBGrid1.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.BitBtnCabOKClick(Sender: TObject);
begin
 try
 	 BitBtnCabOK.SetFocus;

 	 BitBtnCabOK.Enabled       := False;
   BitBtnCabCancelar.Enabled := False;

   CadPedVenda.vHabClienteAlterClienteVnd := ckAlterarClienteVenda.Checked;
   CadPedVenda.vHabVendedorAlterClienteVnd := ckAlterarVendedorVenda.Checked;
   CadPedVenda.vHabControleAlterClienteVnd := ckAlterarFormaPagamentoVenda.Checked;
   CadPedVenda.vHabParticipanteAlterClienteVnd := ckAlterarParticipanteVenda.Checked;

   CadPedVenda.vHabClienteAlterClienteFpCred := ckAlterarClienteVendaFpCreditos.Checked;
   CadPedVenda.vHabVendedorAlterClienteFpCred := ckAlterarVendedorVendaFpCreditos.Checked;

   if (not ckAlterarClienteVenda.Checked)
     and (not ckAlterarVendedorVenda.Checked)
     and (not ckAlterarFormaPagamentoVenda.Checked)
     and (not ckAlterarParticipanteVenda.Checked)
     and (not ckAlterarClienteVendaFpCreditos.Checked)
     and (not ckAlterarVendedorVendaFpCreditos.Checked) then
   begin
     Application.MessageBox(Pchar('Nenhuma opção selecionada!'), 'Atenção', MB_ICONWARNING + MB_OK);
     exit;
   end;

   if ((ckAlterarClienteVenda.Checked) or (ckAlterarClienteVendaFpCreditos.Checked))
     and (CadPedVenda.vCodClienteAlterCliente = CadPedVenda.dataset.FieldByName('cod_cliente').AsInteger) then
   begin
     Application.MessageBox(Pchar('Cliente não foi alterado, favor informar o novo!'), 'Atenção', MB_ICONWARNING + MB_OK);
     exit;
   end;

   if ((ckAlterarVendedorVenda.Checked) or (ckAlterarVendedorVendaFpCreditos.Checked))
     and (CadPedVenda.vCodVendedorAlterCliente = CadPedVenda.dataset.FieldByName('cod_vendedor').AsInteger) then
   begin
     Application.MessageBox(Pchar('Vendedor não foi alterado, favor informar o novo!'), 'Atenção', MB_ICONWARNING + MB_OK);
     exit;
   end;

   if (ckAlterarFormaPagamentoVenda.Checked)
     and (CadPedVenda.vCodControleAlterCliente = CadPedVenda.dataset.FieldByName('cod_controle').AsInteger) then
   begin
     Application.MessageBox(Pchar('Forma de pagamento não foi alterado, favor informar a nova!'), 'Atenção', MB_ICONWARNING + MB_OK);
     exit;
   end;

   if (ckAlterarParticipanteVenda.Checked)
     and (CadPedVenda.vCodParticipanteAlterCliente = CadPedVenda.dataset.FieldByName('cod_vendedor1').AsInteger) then
   begin
     Application.MessageBox(Pchar(trim(vDadosIni.vPedVnd.descricaoParticipante) + ' não foi alterado, favor informar o novo!'), 'Atenção', MB_ICONWARNING + MB_OK);
     exit;
   end;

   if not (CadPedVenda.dataSet.State in [dsInsert, dsEdit]) then
   	 CadPedVenda.dataSet.Edit;

   if (CadPedVenda.dataSet.FieldByName('COD_CONTROLE').AsInteger <= 0) then
   	 CadPedVenda.dataSet.FieldByName('COD_CONTROLE').Value := Null;

   if (CadPedVenda.dataSet.FieldByName('COD_VENDEDOR1').AsInteger <= 0) then
   	 CadPedVenda.dataSet.FieldByName('COD_VENDEDOR1').Value := Null;

   if not CadPedVenda._alterarFormPag then
     Exit;

  // if DBEdit90.Enabled then
   if not CadPedVenda.AlterarVendedorFormPagCreditosCheques(CadPedVenda.dataSet.FieldByName('NPED').AsInteger, CadPedVenda.dataSet.FieldByName('TIPO').AsString) then
     exit;

   if not CadPedVenda.SalvarAltVendedorClienteVenda then
     exit;

   ckAlterarClienteVenda.Checked := False;
   ckAlterarClienteVendaClick(Sender);
   ckAlterarVendedorVenda.Checked := False;
   ckAlterarVendedorVendaClick(Sender);
   ckAlterarFormaPagamentoVenda.Checked := False;
   ckAlterarFormaPagamentoVendaClick(Sender);
   ckAlterarParticipanteVenda.Checked := False;
   ckAlterarParticipanteVendaClick(Sender);

   ckAlterarClienteVendaFpCreditos.Checked := False;
   ckAlterarClienteVendaFpCreditosClick(Sender);
   ckAlterarVendedorVendaFpCreditos.Checked := False;
	 ckAlterarVendedorVendaFpCreditosClick(Sender);
//   TabSheet2.Show;
//   if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
//     DBGrid1.SetFocus;
 finally
   BitBtnCabOK.Enabled       := True;
   BitBtnCabCancelar.Enabled := True;
 end;
end;

procedure TFrmCadPedVenda.BitBtn48Click(Sender: TObject);
begin
  inherited;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
  MaskEdit6.Text := vDadosIni.vPesquisa;
  if (Self.Enabled) and (Self.Visible) and (MaskEdit6.CanFocus) then
	  MaskEdit6.SetFocus;
end;

procedure TFrmCadPedVenda.BitBtn49Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.vendaFechada then
    Exit;

  if CadPedVenda.getTipoVenda = 'OS' then
    if not CadPedVenda.verPendenciaVendaIt('P') then
    begin
      BitBtn50Click(Sender);
      exit;
    end;

  if not CadPedVenda.verificaColaboradorProdutos(false, true) then
  begin
    setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);
    exit;
  end;

  if not CadPedVenda.verificaColaboradorProdutos(true, false) then
  begin
    setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);
    exit;
  end;

  if not CadPedVenda.vItProd.validaAcresDescNoItem(DBComboBox14.Text, DBComboBox15.Text, CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit136.CanFocus) then
	    DBEdit136.setfocus;
    exit;
  end;

  if not CadPedVenda.vItProd.validarAcrescDescAcrescCondPagComissaoVend then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit75.CanFocus) then
	    DBEdit75.setfocus;
    exit;
  end;

  if not verificarDescontoTabDifPromPrecoQtde(
  	CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('VLUN_ORIG').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString,
    CadPedVenda.vItProd.dataSet.FieldByName('NAT_DESCACRES').AsString,
    CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsFloat,
    False) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit117.CanFocus) then
      DBEdit117.SetFocus;
    exit;
  end;

  if CadPedVenda.verificaFechamento(1) then
  begin
    Application.MessageBox('Ordem de serviço sendo Fechada neste momento.', 'Informação', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  if not CadPedVenda.vItProd.Post then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit55.CanFocus) then
	    DBEdit55.SetFocus;
    exit;
  end
  else
  begin
    if (Self.Enabled) and (Self.Visible) and (DBGrid13.CanFocus) then
	    DBGrid13.SetFocus;
    Panel22.Visible := False;
    Panel23.Visible := False;
  end;

  BitBtn70Click(Sender);
end;

procedure TFrmCadPedVenda.BitBtn4Click(Sender: TObject);
var
  vCheckCheck: TCheckCheck;
  vnped: integer;
  vtipo: string;
begin
	try
  	try
      vnped := CadPedVenda.dataSet.FieldByName('NPED').AsInteger;
      vtipo := trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString);

      vDadosIni.logsPedvenda(Self.ClassName + '.SALVAR DOC - begin ' +
        trim(vtipo) + '-' + IntToStr(vnped), 'pedvenda');

      CadPedVenda.onEstoqueMinimoAtingido := estoque_minimo_notificar;

      BitBtn4.Enabled := False;
      SpeedButton66.Enabled := False;
      DBGrid3.DataSource.DataSet.DisableControls;
  //    label201.Visible := false;
  //    label255.Visible := false;
      screen.Cursor := crHourGlass;
      if not vDadosIni.PesqPros('VND046', 'SALVAR PEDIDO', CadPedVenda.getTipoVenda + ' Nº ' +
        CadPedVenda.dataSet.FieldByName('NPED').AsString, 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').AsString, CadPedVenda.buscas, true) then
        Exit;
      if not CadPedVenda.vItProd.Post then
        Exit;
      if CadPedVenda.verificaFechamento(1) then
      begin
        Application.MessageBox('Venda sendo Fechada neste momento.', 'Informação', MB_OK + MB_ICONINFORMATION);
        exit;
      end;
      if CadPedVenda.getTipoVenda = 'REQ' then
      begin
        if not CadPedVenda.verificatipovenda(2, DBComboBox1, CadPedVenda.getTipoVenda, DBComboBox1.Text) then
        begin
          Application.MessageBox('Tipo de Venda inválido.', 'Informação', MB_OK + MB_ICONINFORMATION);
          if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
            DBComboBox1.SetFocus;
          exit;
        end;
        if not CadPedVenda.ChecaCamposObrigatorios then
          setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro)
        else
        begin
          faturamento_action_before_save;

          if not CadPedVenda.validarCamposPersonalizados then
          begin
            if not setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro, True) then
              if (Self.Enabled) and (Self.Visible) and (DBEdit77.CanFocus) then
                DBEdit77.SetFocus;
            exit;
          end;

          vDadosIni.logsPedvenda(Self.ClassName + '.SALVAR DOC - if CadPedVenda.Post then', 'pedvenda');

          if CadPedVenda.Post then
          begin
            if TelaCadastro <> 4 then
              inherited;

            TabSheet2.Show;
            if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
              ComboBox1.SetFocus;
          end
          else
          begin
            if CadPedVenda.vNomeCampoErro <> '' then
              setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro)
            else
              setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);
          end;
        end;
      end
      else if (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC') then
      begin
        if CadPedVenda.getTipoVenda = 'OS' then
        begin
          if not CadPedVenda.verificatipovenda(2, DBComboBox3, CadPedVenda.getTipoVenda, DBComboBox3.Text) then
          begin
            Application.MessageBox('Tipo de O.S. inválido.', 'Informação', MB_OK + MB_ICONINFORMATION);
            if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
              DBComboBox3.SetFocus;
            exit;
          end;
        end;
        if not CadPedVenda.ChecaCamposObrigatorios then
          setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro)
        else
        begin
          faturamento_action_before_save;

          if not CadPedVenda.validarCamposPersonalizados then
          begin
            if not setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro, True) then
              if (Self.Enabled) and (Self.Visible) and (DBEdit77.CanFocus) then
                DBEdit77.SetFocus;
            exit;
          end;

          vDadosIni.logsPedvenda(Self.ClassName + '.SALVAR DOC - if CadPedVenda.Post then', 'pedvenda');

          if CadPedVenda.Post then
          begin
            if TelaCadastro <> 4 then
              inherited;

            TabSheet2.Show;
            if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
              ComboBox1.SetFocus;
          end
          else
          begin
            if CadPedVenda.vItProd.vNomeCampoErro <> '' then
            begin
              tsProdOS.Show;
              setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);
            end
            else if CadPedVenda.vItServ.vNomeCampoErro <> '' then
            begin
              tsServOS.Show;
              setFocusCampoErro(CadPedVenda.vItServ.vNomeCampoErro, CadPedVenda.vItServ.vMensagemErro);
            end
            else if CadPedVenda.vItServTerc.vNomeCampoErro <> '' then
            begin
              tsServTercOS.Show;
              setFocusCampoErro(CadPedVenda.vItServTerc.vNomeCampoErro, CadPedVenda.vItServTerc.vMensagemErro);
            end
            else if CadPedVenda.vItProdTerc.vNomeCampoErro <> '' then
            begin
              tsProdTercOS.Show;
              setFocusCampoErro(CadPedVenda.vItProdTerc.vNomeCampoErro, CadPedVenda.vItProdTerc.vMensagemErro);
            end
            else if CadPedVenda.vNomeCampoErro <> '' then
              setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro);
          end;
        end;
      end;

    except
      on e: Exception do
      begin
      	vDadosIni.logsPedvenda(Self.ClassName + '.SALVAR DOC - ' + e.Message, 'pedvenda');
        Application.MessageBox(pchar('Erro ao salvar documento. Erro: ' + e.Message), 'Atenção', 0 + 64);
      end;
    end;

  finally
  	vDadosIni.logsPedvenda(Self.ClassName + '.SALVAR DOC - end ' +
    	trim(vtipo) + '-' + IntToStr(vnped), 'pedvenda');

    screen.Cursor := crDefault;
    CadPedVenda.onEstoqueMinimoAtingido := nil;
    DBGrid3.DataSource.DataSet.EnableControls;
    BitBtn4.Enabled := (not CadPedVenda.vendaFechada) and (not (CadPedVenda.dataSet.FieldByName('status_ped').AsString = 'CANCELADO'));
    SpeedButton66.Enabled := (CadPedVenda.vendaFechada);
  end;
end;

procedure TFrmCadPedVenda.BitBtn50Click(Sender: TObject);
begin
  inherited;
  //  if not vDadosIni.PesqPros('VND016', '', CadPedVenda.buscas, true) then
  //    Exit;
  //  if CadPedVenda.vendaFechada then
  //    Exit;
  if CadPedVenda.vItProd.Cancel then
  begin
    CadPedVenda.calculaTotais;
    if (Self.Enabled) and (Self.Visible) and (DBGrid13.CanFocus) then
	    DBGrid13.SetFocus;
    Panel22.Visible := false;
    Panel23.Visible := false;
  end;
end;

procedure TFrmCadPedVenda.BitBtn51Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VND016', 'CANCELAR ITEM', 'PROD.:' + CadPedVenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString, 'PEDVENDA_PROD', CadPedVenda.vItProd.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
    Exit;
  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.verPendenciaVendaIt('P') then
    exit;
  if CadPedVenda.verificaFechamento(1) then
  begin
    Application.MessageBox('Ordem de serviço sendo Fechada neste momento.', 'Informação', MB_OK + MB_ICONINFORMATION);
    exit;
  end;
  if CadPedVenda.vItProd.devolver(EditHw1.AsValue) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBGrid13.CanFocus) then
	    DBGrid13.SetFocus;
    Panel22.Visible := false;
    Panel23.Visible := false;
    EditHw1.AsValue := 0;
    if CadPedVenda.salvaTransfDev(true) then
      Application.MessageBox('Dados salvos com sucesso', 'Informação', MB_OK + MB_ICONINFORMATION);
  end
  else
  	EditHw1.AsValue := 0;
  Panel23.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (BitBtn39.CanFocus) then
	  BitBtn39.SetFocus;
end;

procedure TFrmCadPedVenda.BitBtn52Click(Sender: TObject);
begin
  inherited;
  CadPedVenda.dataSet.Cancel;
  TabSheet2.Show;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	  DBGrid1.SetFocus;
end;

procedure TFrmCadPedVenda.BitBtnCabCancelarClick(Sender: TObject);
begin
  try
    BitBtnCabCancelar.SetFocus;

    BitBtnCabOK.Enabled       := False;
    BitBtnCabCancelar.Enabled := False;

    CadPedVenda.dataSet.Cancel;
    if not (CadPedVenda.dataSet.State in [dsInsert, dsEdit]) then
      CadPedVenda.dataSet.Edit;

    limparCamposCab(Sender);
  finally
    BitBtnCabOK.Enabled       := True;
    BitBtnCabCancelar.Enabled := True;
  end;
end;

procedure TFrmCadPedVenda.BitBtn54Click(Sender: TObject);
var
  i: integer;
begin
  inherited;
  if not vDadosIni.PesqPros('VND138', 'PESQUISAR', '', 'PEDVENDA', '', CadPedVenda.buscas, true) then
    exit;

  if (ComboBoxOpMesclar.ItemIndex = 0) or (ComboBoxOpMesclar.ItemIndex = 2) then
    MaskEdit11.Text := '0';
  if (ComboBoxOpMesclar.ItemIndex = -1) then
  begin
    Application.MessageBox('Nenhuma opção para transferência foi selecionada.', 'Atenção', MB_OK + MB_ICONWARNING);
    if (Self.Enabled) and (Self.Visible) and (ComboBoxOpMesclar.CanFocus) then
	    ComboBoxOpMesclar.SetFocus;
  end
  else if CadPedVenda.getTipoVenda = 'ORC' then
  begin
    CadPedVenda.verificaFiscalAtivoOrcamento;
    if (ComboBoxOpMesclar.ItemIndex = 0) or (ComboBoxOpMesclar.ItemIndex = 1) then
    begin
      if CadPedVenda.exportarOrcamentoParaOsReq(strtoint(trim(MaskEdit11.Text)), 'REQ', CheckBox7.Checked) then
      begin
        TabSheet2.Show;
//        RadioGroup3.ItemIndex := 0;
//        CadPedVenda._recalcularPrecos(CadPedVenda.UltimoNpedMesclado);
//        CadPedVenda.abrePedVenda(CadPedVenda.UltimoNpedMesclado);
//        TabSheet2.Show;
//        if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
//          DBGrid1.SetFocus;
//        if CadPedVenda.dataSet.FieldByName('saveauto').AsString = 'S' then
//          CadPedVenda.pedidoEmEdicao(caRemoverEdicao, False);
//        SpeedButton1Click(Sender);
//        if not CadPedVenda.str_empty('nf_ac_calctrib') then
//          CadPedVenda.fat_ped.calcular_valores_nf;
//        Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
        CadPedVenda.desmarcarDAVsParaMesclagem;
        CadPedVenda.Refresh;

      	vDadosIni.vPesquisa := 'PEDVENDA_EDIT_CALC|REQ|' + IntToStr(CadPedVenda.UltimoNpedMesclado) + '|';
    		vDadosIni.vNomeForm := 'FrmCadPedVenda';
    		vDadosIni.abreFormCadastro('pkPedidoVenda', 'TFrmCadPedVenda', True, 'Formulário de Requisição / Ordem de Serviço já aberto. Feche que tente novamente', 'NAME');
      end;
    end
    else if CadPedVenda.exportarOrcamentoParaOsReq(strtoint(trim(MaskEdit11.Text)), 'OS', CheckBox7.Checked) then
    begin
      TabSheet2.Show;
//      RadioGroup3.ItemIndex := 1;
//      CadPedVenda._recalcularPrecos(CadPedVenda.UltimoNpedMesclado);
//      CadPedVenda.abrePedVenda(CadPedVenda.UltimoNpedMesclado);
//      TabSheet2.Show;
//      if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
//	     DBGrid1.SetFocus;
//      if CadPedVenda.dataSet.FieldByName('saveauto').AsString = 'S' then
//        CadPedVenda.pedidoEmEdicao(caRemoverEdicao, False);
//      SpeedButton1Click(Sender);
//      if not CadPedVenda.str_empty('nf_ac_calctrib') then
//        CadPedVenda.fat_ped.calcular_valores_nf;
//      Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    	CadPedVenda.desmarcarDAVsParaMesclagem;
      CadPedVenda.Refresh;

      vDadosIni.vPesquisa := 'PEDVENDA_EDIT_CALC|OS|' + IntToStr(CadPedVenda.UltimoNpedMesclado) + '|';
    	vDadosIni.vNomeForm := 'FrmCadPedVenda';
    	vDadosIni.abreFormCadastro('pkPedidoVenda', 'TFrmCadPedVenda', True, 'Formulário de Requisição / Ordem de Serviço já aberto. Feche que tente novamente', 'NAME');
    end;
  end
  else
  begin
    if (ComboBoxOpMesclar.ItemIndex = 0) or (ComboBoxOpMesclar.ItemIndex = 1) then
    begin
      if CadPedVenda.MesclarDAVsOSREQ(strtoint(trim(MaskEdit11.Text)), 'REQ') then
      begin
        TabSheet2.Show;
//        RadioGroup3.ItemIndex := 0;
//        CadPedVenda._recalcularPrecos(CadPedVenda.UltimoNpedMesclado);
//        CadPedVenda.abrePedVenda(CadPedVenda.UltimoNpedMesclado);
//        TabSheet2.Show;
//        if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
//	        DBGrid1.SetFocus;
//        if CadPedVenda.dataSet.FieldByName('saveauto').AsString = 'S' then
//          CadPedVenda.pedidoEmEdicao(caRemoverEdicao, False);
//        SpeedButton1Click(Sender);
//        if not CadPedVenda.str_empty('nf_ac_calctrib') then
//          CadPedVenda.fat_ped.calcular_valores_nf;
//        Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
      	CadPedVenda.desmarcarDAVsParaMesclagem;
        CadPedVenda.Refresh;

        vDadosIni.vPesquisa := 'PEDVENDA_EDIT_CALC|REQ|' + IntToStr(CadPedVenda.UltimoNpedMesclado) + '|';
    		vDadosIni.vNomeForm := 'FrmCadPedVenda';
    		vDadosIni.abreFormCadastro('pkPedidoVenda', 'TFrmCadPedVenda', True, 'Formulário de Requisição / Ordem de Serviço já aberto. Feche que tente novamente', 'NAME');
      end;
    end
    else if CadPedVenda.MesclarDAVsOSREQ(strtoint(trim(MaskEdit11.Text)), 'OS') then
    begin
      TabSheet2.Show;
//      RadioGroup3.ItemIndex := 1;
//      CadPedVenda._recalcularPrecos(CadPedVenda.UltimoNpedMesclado);
//      CadPedVenda.abrePedVenda(CadPedVenda.UltimoNpedMesclado);
//      if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
//	      DBGrid1.SetFocus;
//      TabSheet2.Show;
//      if CadPedVenda.dataSet.FieldByName('saveauto').AsString = 'S' then
//        CadPedVenda.pedidoEmEdicao(caRemoverEdicao, False);
//      SpeedButton1Click(Sender);
//      if not CadPedVenda.str_empty('nf_ac_calctrib') then
//        CadPedVenda.fat_ped.calcular_valores_nf;
//      Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    	CadPedVenda.desmarcarDAVsParaMesclagem;
      CadPedVenda.Refresh;

      vDadosIni.vPesquisa := 'PEDVENDA_EDIT_CALC|OS|' + IntToStr(CadPedVenda.UltimoNpedMesclado) + '|';
    	vDadosIni.vNomeForm := 'FrmCadPedVenda';
    	vDadosIni.abreFormCadastro('pkPedidoVenda', 'TFrmCadPedVenda', True, 'Formulário de Requisição / Ordem de Serviço já aberto. Feche que tente novamente', 'NAME');
    end;
  end;
end;

procedure TFrmCadPedVenda.BitBtn55Click(Sender: TObject);
begin
  inherited;
  TForm(pnDescontoItem.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.BitBtn56Click(Sender: TObject);
begin
  inherited;
  CadPedVenda.FecharOrcamentosATransferir;
  TabSheet2.Show;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	  DBGrid1.SetFocus;
end;

procedure TFrmCadPedVenda.BitBtn57Click(Sender: TObject);
begin
  inherited;
  TForm(pnAcrescimoItem.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.BitBtn58Click(Sender: TObject);
begin
  inherited;
  TForm(pnTipoOrc.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.BitBtn59Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if CadPedVenda.verificatipoorc(DBComboBox8.Text) then
  begin
    TForm(pnTipoVendaOrc.Parent).ModalResult := IDOK;
    Exit;
  end;

  {for I := 0 to DBComboBox8.Items.Count - 1 do
  begin
    if copy(DBComboBox8.Items[I], 1, 1) = copy(DBComboBox8.Text, 1, 1) then
    begin
      TForm(pnTipoVendaOrc.Parent).ModalResult := IDOK;
      Exit;
    end;
  end; }
  Application.MessageBox('Tipo de orçamento inválido', 'Atenção', 0 + 64);
end;

procedure TFrmCadPedVenda.BitBtn5Click(Sender: TObject);
var
  vRemoveUS_CAD: Boolean;
  vExibirPergFechar: boolean;
begin
  try
  	vExibirPergFechar := Self.exibirPergFechar;
    if (not vF9) and (BitBtn5.Tag <> 99) then
      if Trim(CadPedVenda.dataSet.FieldByName('status_ped').AsString) = '' then
      begin
        if Application.MessageBox('Deseja mesmo cancelar a Operação?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          Exit;

        Self.exibirPergFechar := False;
      end;
    vRemoveUS_CAD := False;
    if (TelaCadastro <> 4) and (not vF9) and (BitBtn5.Tag <> 99) then
    begin
      inherited;
      vRemoveUS_CAD:= True;
    end;
    CadPedVenda.salvarAgendamento(True);
    if (CadPedVenda.Cancel) or (CadPedVenda.vendaFechada) then
    begin
      panel38.Caption := vDadosIni.IfThen(CadPedVenda.getTipoVenda = 'REQ', 'Venda Rápida', 'Orçamento Rápido');
      CadPedVenda.CancelUpdates;
      CadPedVenda.vItProd.dataSet.Cancel;
      if CadPedVenda.getTipoVenda <> 'REQ' then
      begin
        CadPedVenda.vItServ.dataSet.Cancel;
        CadPedVenda.vItProdTerc.dataSet.Cancel;
        CadPedVenda.vItServTerc.dataSet.Cancel;
        CadPedVenda.vItProd.CancelUpdates;
        CadPedVenda.vItServ.CancelUpdates;
        CadPedVenda.vItProdTerc.CancelUpdates;
        CadPedVenda.vItServTerc.CancelUpdates;
      end
      else if (TelaCadastro = 3) then
      begin
        BitBtn2.Click;
        Exit;
      end;

      TabSheet2.Show;
      if (Self.Enabled) and (Self.Visible) and (ComboBox1.CanFocus) then
        ComboBox1.SetFocus;
      CadPedVenda.RollBackTransacao;
      if vRemoveUS_CAD then
        CadPedVenda.pedidoEmEdicao(caRemoverEdicao, False);
    end;
  finally
    Self.exibirPergFechar := vExibirPergFechar;
  end;
end;

procedure TFrmCadPedVenda.btSelectAllServicosMesclarClick(Sender: TObject);
begin
  CadPedVenda.marcarDesmarcarItemServTodos;
end;

procedure TFrmCadPedVenda.BitBtn60Click(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtn60.CanFocus) then
  	BitBtn60.SetFocus;
	TForm(pnAcrescCondPagComissaoVend.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.BitBtn61Click(Sender: TObject);
begin
  inherited;
  TForm(pnClienteAvulso.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.BitBtn62Click(Sender: TObject);
begin
  inherited;
  TForm(pnStatusOS.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.BitBtn63Click(Sender: TObject);
begin
  inherited;
  TForm(pnStatusOS.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadPedVenda.BitBtn64Click(Sender: TObject);
begin
  inherited;
  try
    if not vDadosIni.PesqPros('VND006', 'CANCELAR REGISTRO', '', 'PEDVENDA_PROD', CadPedVenda.vItProd.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, true) then
      Exit;
    if CadPedVenda.vendaFechada then
      Exit;
    if CadPedVenda.vItProd.Cancel then
    begin
      edCodBarra.Enabled := true;
      lMsg.Caption := CadPedVenda.vItProd.vtemp;
      temp := '';
      tsItens.Show;
      if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) then
      	edCodBarra.SetFocus;
      //      CadPedVenda.calculaDescontoAcrescimo;
      CadPedVenda.calculaTotais;
      eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;

      if Self.Tag = 999 then
        if FileExists(ExtractFilePath(Application.ExeName) + 'logo.jpg') then
        begin
          imgLogo.Proportional := false;
          
          try
          	imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
          except
          end;
          
        end;
    end;
  finally
    edCodBarra.Enabled := true;
    DBGrid12.Parent := GroupBox36;
    DBGrid12.Options := DBGrid12.Options - [dgIndicator];
    DBGrid12.Options := DBGrid12.Options - [dgRowLines];
    DBGrid12.Options := DBGrid12.Options - [dgRowSelect];
    pgVendaRapida.ActivePage := tsItens;
  end;
end;

procedure TFrmCadPedVenda.BitBtn65Click(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (TBitBtn(Sender).CanFocus) then
  	TBitBtn(Sender).SetFocus;
  DBGrid12.Parent := GroupBox36;
  DBGrid12.Options := DBGrid12.Options - [dgIndicator];
  DBGrid12.Options := DBGrid12.Options - [dgRowLines];
  DBGrid12.Options := DBGrid12.Options - [dgRowSelect];
  edCodBarra.Enabled := true;
  lMsg.Caption := 'Informe o Código de Barras do Produto';
  pgVendaRapida.ActivePage := tsItens;
end;

procedure TFrmCadPedVenda.BitBtn66Click(Sender: TObject);
var
	I: Integer;
begin
  inherited;
  if not vDadosIni.PesqPros('VND125', 'LIBERAR/TRAVAR', 'APLICAR EM REQ SELECIONADAS', 'PEDVENDA',
    '', CadPedVenda.buscas, true) then
    Exit;

  CadPedVenda.dataSet.FieldByName('sel').Visible := False;

  for I := 0 to DBGrid1.Columns.Count - 1 do
    if trim(DBGrid1.Columns[I].FieldName) = 'SEL' then
    begin
       DBGrid1.Columns[I].Visible := False;
       Break;
    end;

  DBGrid1.SelectedIndex := 0;
  DBGrid1.SelectedIndex := DBGrid1.Columns.Count - 1;
  DBGrid1.SelectedIndex := 0;
  BitBtn66.Visible := False;
  Panel2.Visible := True;
  CadPedVenda._liberarVendasSelecionadasParaFechamento;
end;

procedure TFrmCadPedVenda.BitBtn67Click(Sender: TObject);
begin
  inherited;
  TForm(pnClienteVND.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.BitBtn68Click(Sender: TObject);
var
  resp: Integer;
begin
  inherited;
  if CadPedVenda.vItProd.dataSet.ChangeCount > 0 then
  begin
    resp := Application.MessageBox('Deseja salvar alterações feitas?', 'Confirmação',
      MB_YESNOCANCEL +
      MB_ICONQUESTION);
    if resp = ID_YES then
      BitBtn70Click(sender)
    else if resp = ID_CANCEL then
      Exit;
  end;
  close;
end;

procedure TFrmCadPedVenda.BitBtn69Click(Sender: TObject);
begin
  inherited;
  Panel23.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (BitBtn39.CanFocus) then
	  BitBtn39.SetFocus;
end;

procedure TFrmCadPedVenda.BitBtn70Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.dataSet.IsEmpty then
    exit;
  if CadPedVenda.salvaTransfDev then
    Application.MessageBox('Dados salvos com sucesso', 'Informação', MB_OK +
      MB_ICONINFORMATION);
end;

procedure TFrmCadPedVenda.BitBtn72Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.vItProd.getValorItensLiquido = 0 then
  begin
    if vDadosIni.vEmp.vUsarDAV <> 'S' then
    begin
      if Application.MessageBox('Com a devolução de todos os itens deste pedido de venda a mesma precisará ser excluída.' + chr(13) + 'Deseja continuar?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
        TForm(pnDevolucao.Parent).ModalResult := IDOK;
    end
    else
      if Application.MessageBox('Com a devolução de todos os itens deste pedido de venda a mesma precisará ser cancelada.' + chr(13) + 'Deseja continuar?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = ID_YES then
        TForm(pnDevolucao.Parent).ModalResult := IDOK;
  end
  else
  begin
  	if not vDadosIni.PesqPros('VND130', 'DEVOLVER', '', 'PEDVENDA',
    	CadPedVenda.dataSet.FieldByName('NPED').AsString, CadPedVenda.buscas, true) then
    		Exit;

  	TForm(pnDevolucao.Parent).ModalResult := IDOK;
  end;
end;

procedure TFrmCadPedVenda.BitBtn72Enter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (TBitBtn(sender).CanFocus) then
	  TBitBtn(sender).SetFocus;
end;

procedure TFrmCadPedVenda.BitBtn73Click(Sender: TObject);
begin
  inherited;
  cancelaAltPreco := true;
  CadPedVenda.vItProd.Cancel;
  if (Self.Enabled) and (Self.Visible) and (TBitBtn(Sender).CanFocus) then
	  TBitBtn(Sender).SetFocus;
  edCodBarra.Enabled := true;
  TForm(Panel36.Parent).ModalResult := IDCANCEL;
  //pgVendaRapida.ActivePage := tsItens;
end;

procedure TFrmCadPedVenda.BitBtn74Click(Sender: TObject);
var
  Aperc, Aval, Avalini: Double;
  vmensagem: string;
  vDescAcresc: string;
  vPercValor: string;
  vTabPraticada: string;
begin
  inherited;

  vTabPraticada := CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString;

  Aperc   := 0;
  Aval    := 0;
  Avalini := 0;
  if (CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency > 0) then
  begin
    if (trim(CadPedVenda.vItProd.dataSet.FieldByName('NAT_DESCACRES').AsString) = 'VALOR') then
    begin
      Aval := CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency;

      if (trim(CadPedVenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString) = 'DESCONTO') then
      begin
        if (CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'P') and (vDadosIni.vPedVnd.ExibirDesconto.PrecoPromocao = 'S') then
        begin
          if vDadosIni.StrToFloatFormat(CadPedVenda.vItProd.dataSet.FieldByName('vlun_ped_item').AsFloat, vDadosIni.vEmp.vCasasDecimais) >= vDadosIni.StrToFloatFormat(CadPedVenda.vItProd.dataSet.FieldByName('vlun_orig').AsFloat, vDadosIni.vEmp.vCasasDecimais) then
            Avalini :=
              vDadosIni.StrToFloatFormat(
                (CadPedVenda.vItProd.dataSet.FieldByName('vlun_ped_item').AsFloat -
                 CadPedVenda.vItProd.dataSet.FieldByName('vlun_orig').AsFloat) *
                CadPedVenda.vItProd.dataSet.FieldByName('quant_ped_item').AsFloat, 2);
        end
        else if (CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'T') and (vDadosIni.vPedVnd.ExibirDesconto.PrecoDiferenciado = 'S') then
        begin
          if vDadosIni.StrToFloatFormat(CadPedVenda.vItProd.dataSet.FieldByName('vlun_ped_item').AsFloat, vDadosIni.vEmp.vCasasDecimais) >= vDadosIni.StrToFloatFormat(CadPedVenda.vItProd.dataSet.FieldByName('vlun_orig').AsFloat, vDadosIni.vEmp.vCasasDecimais) then
            Avalini :=
              vDadosIni.StrToFloatFormat(
                (CadPedVenda.vItProd.dataSet.FieldByName('vlun_ped_item').AsFloat -
                 CadPedVenda.vItProd.dataSet.FieldByName('vlun_orig').AsFloat) *
                CadPedVenda.vItProd.dataSet.FieldByName('quant_ped_item').AsFloat, 2)
        end
        else if (CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'Q') and (vDadosIni.vPedVnd.ExibirDesconto.PrecoQtde = 'S') then
        begin
          if vDadosIni.StrToFloatFormat(CadPedVenda.vItProd.dataSet.FieldByName('vlun_ped_item').AsFloat, vDadosIni.vEmp.vCasasDecimais) >= vDadosIni.StrToFloatFormat(CadPedVenda.vItProd.dataSet.FieldByName('vlun_orig').AsFloat, vDadosIni.vEmp.vCasasDecimais) then
            Avalini :=
              vDadosIni.StrToFloatFormat(
                (CadPedVenda.vItProd.dataSet.FieldByName('vlun_ped_item').AsFloat -
                 CadPedVenda.vItProd.dataSet.FieldByName('vlun_orig').AsFloat) *
                CadPedVenda.vItProd.dataSet.FieldByName('quant_ped_item').AsFloat, 2);
        end
      end;
    end
    else
      Aperc := CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency;
  end;

  if (trim(CadPedVenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString) = 'DESCONTO') then
  begin
    CadPedVenda.vItProd.setDescontoValor(Aval, Avalini);
    CadPedVenda.vItProd.setDescontoPercenentual(Aperc);
  end
  else
  begin
    CadPedVenda.vItProd.setAcrescimoValor(Aval);
    CadPedVenda.vItProd.setAcrescimoPercenentual(Aperc);
  end;

  CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsCurrency := edValorUnitarioVendaRapida.Valor;
  if not CadPedVenda.vItProd._validarAlteracaoPrecoUnitario(vTabPraticada) then
  begin
    edValorUnitarioVendaRapida.Valor := CadPedVenda.vItProd.dataSet.FieldByName('VLUN_ORIG').AsCurrency;
    if (Self.Enabled) and (Self.Visible) and (edValorUnitarioVendaRapida.CanFocus) then
	    edValorUnitarioVendaRapida.SetFocus;
    exit;
  end;

  edValorUnitarioVendaRapida.Valor := CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsCurrency;

  if edValorUnitarioVendaRapida.Valor <= 0 then
  begin
    Application.MessageBox('Campo Valor Unitário deve ser maior que zero.' + chr(13) +
      'Favor Verificar', 'Atenção', 0 + 64);
    if (Self.Enabled) and (Self.Visible) and (edValorUnitarioVendaRapida.CanFocus) then
      edValorUnitarioVendaRapida.SetFocus;
    exit;
  end;

  if not CadPedVenda.vItProd.validaAcresDescNoItem(
  	DBComboBox12.Text,
    DBComboBox13.Text,
    CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit135.CanFocus) then
	    DBEdit135.setfocus;
    exit;
  end;

  if not CadPedVenda.vItProd.validarAcrescDescAcrescCondPagComissaoVend then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit151.CanFocus) then
	    DBEdit151.setfocus;
    exit;
  end;

  if not verificarDescontoTabDifPromPrecoQtde(
  	CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('VLUN_ORIG').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString,
    CadPedVenda.vItProd.dataSet.FieldByName('NAT_DESCACRES').AsString,
    CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsFloat,
    False) then
  begin
  	 if (Self.Enabled) and (Self.Visible) and (edValorUnitarioVendaRapida.CanFocus) then
      edValorUnitarioVendaRapida.SetFocus;
    exit;
  end;

  if not CadPedVenda.vItProd.checaValoresItens then
  begin
    setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);
    exit;
  end;

  if not CadPedVenda.vItProd.checaValorOriginalItens then
  begin
    setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);
    exit;
  end;

  try
    CadPedVenda.vItProd.setDescricaoValorPeloVendaRapida(
    	edValorUnitarioVendaRapida.Valor,
      DBComboBoxUnVendaRapida.Items[DBComboBoxUnVendaRapida.ItemIndex],
      MaskEdit7.Text);

    TForm(Panel36.Parent).ModalResult := IDOK;
  finally
    //edCodBarra.Enabled := true;
    //pgVendaRapida.ActivePage := tsItens;
  end;
end;

procedure TFrmCadPedVenda.BitBtn75Click(Sender: TObject);
begin
  inherited;
  TForm(pnDevolucao.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadPedVenda.BitBtn76Click(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if not CadPedVenda.vAgenda._abreAgendaServicos(StrToDateTime(MaskEdit12.Text), MaskEdit13.Text, MaskEdit14.Text) then
    begin
      DBLookupComboBox25.KeyValue := 0;
      DBLookupComboBox32.KeyValue := 0;
      DBLookupComboBox25.Enabled := false;
      DBLookupComboBox32.Enabled := false;
      BitBtn77.Enabled := false;
      btSelectAll.Visible := false;
      btUnSelectAll.Visible := false;
      btEraseAll.Visible := false;
      exit;
    end;
    DBLookupComboBox25.Enabled := true;
    DBLookupComboBox32.Enabled := true;
    CadPedVenda.vAgenda.vAgendaItens.vTmoAgenda := 0;
    CadPedVenda.vAgenda.vAgendaItens._mostrarMecanicos;
    CadPedVenda.vAgenda.vAgendaItens._mostrarBox(0);
    DBLookupComboBox25.KeyValue := CadPedVenda.vAgenda.vAgendaItens.fTemp.FieldByName('COD_VENDEDOR').AsInteger;
    DBLookupComboBox32.KeyValue := CadPedVenda.vAgenda.vAgendaItens.fBox.FieldByName('COD_BOX').AsInteger;
    BitBtn77.Enabled := true;
    btSelectAll.Visible := true;
    btUnSelectAll.Visible := true;
    btEraseAll.Visible := true;

    if (Self.Enabled) and (Self.Visible) and (DBGrid21.CanFocus) then
      DBGrid21.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.BitBtn77Click(Sender: TObject);
var
  vCodMecanico, vCodBox:Integer;
begin
  try
    Screen.Cursor := crHourGlass;

    vCodMecanico := vDadosIni.IfThen(DBLookupComboBox25.KeyValue = null, 0, DBLookupComboBox25.KeyValue);
    vCodBox := vDadosIni.IfThen(DBLookupComboBox32.KeyValue = null, 0, DBLookupComboBox32.KeyValue);

    if not CadPedVenda.vAgenda._agendamentoDisponivel then
    	exit;
      
    if not CadPedVenda.vAgenda.vAgendaItens._tempoPorBox then
      exit;

    if not CadPedVenda.vItServ.abrePedVendaServAgenda(0) then
    begin
     DBLookupComboBox25.KeyValue := vCodMecanico;
     DBLookupComboBox32.KeyValue := vCodBox;

      if (Self.Enabled) and (Self.Visible) and (DBGrid22.CanFocus) then
        DBGrid22.SetFocus;
    end
    else
    begin
      TForm(pnDisponibilidadeMecanico.Parent).ModalResult := IDOK;
      CadPedVenda.vAgenda.vAgendaItens.fBox.Close;
      CadPedVenda.vAgenda.vAgendaItens.fMecanicos.Close;
      DBLookupComboBox25.KeyValue := 0;
      DBLookupComboBox25.Enabled := false;
      DBLookupComboBox32.Enabled := false;
      BitBtn77.Enabled := false;
      btSelectAll.Visible := false;
      btUnSelectAll.Visible := false;
      btEraseAll.Visible := false;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.BitBtn78Click(Sender: TObject);
begin
  inherited;
  TForm(pnDisponibilidadeMecanico.Parent).ModalResult := IDCANCEL;
  CadPedVenda.vAgenda.vAgendaItens.fBox.Close;
  CadPedVenda.vAgenda.vAgendaItens.fMecanicos.Close;
  DBLookupComboBox25.KeyValue := 0;
  DBLookupComboBox25.Enabled := false;
  DBLookupComboBox32.Enabled := false;
  BitBtn77.Enabled := false;
  btSelectAll.Visible := false;
  btUnSelectAll.Visible := false;
  btEraseAll.Visible := false;
end;

procedure TFrmCadPedVenda.BitBtn78Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBGrid22.CanFocus) then
    DBGrid22.SetFocus;
end;

procedure TFrmCadPedVenda.BitBtn79Click(Sender: TObject);
begin
  inherited;
  limparCamposCab(Sender);
  limparCamposServ(Sender);
  limparCamposProd(Sender);
  CadPedVenda.dataSet.Cancel;
  
	TabSheet2.Show;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
    DBGrid1.SetFocus;
end;

procedure TFrmCadPedVenda.btSelectAllProdutosMesclarClick(Sender: TObject);
begin
  CadPedVenda.marcarDesmarcarItemProdTodos;
end;

procedure TFrmCadPedVenda.BitBtn7Click(Sender: TObject);
begin
  inherited;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('VEICULOS');
  if (Trim(vDadosIni.vPesquisa) = '') then
    vDadosIni.vPesquisa := '0';
  if not CadPedVenda.buscaVeiculo(vDadosIni.vPesquisa, 0, Memo1, vDadosIni.vPesquisaPlaca, vDadosIni.vPesquisaChassi) then
    if (Self.Enabled) and (Self.Visible) and (DBEdit32.CanFocus) then
	    DBEdit32.SetFocus;
end;

procedure TFrmCadPedVenda.BitBtn80Click(Sender: TObject);
begin
  inherited;
  CadPedVenda.vAgenda.vAgendaItens.dataSet.Edit;
  CadPedVenda.vAgenda.vAgendaItens.dataSet.FieldByName('CODNOMEVENDEDOR').AsString :=
  CadPedVenda.vAgenda.vAgendaItens.fTemp.FieldByName('COD_VENDEDOR').AsString + ' - ' +
  CadPedVenda.vAgenda.vAgendaItens.fTemp.FieldByName('NOME_VENDEDOR').AsString;
  CadPedVenda.vAgenda.vAgendaItens.dataSet.Post;

  TForm(pnMecanicoEspecifico.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.BitBtn81Click(Sender: TObject);
begin
  inherited;
  TForm(pnMecanicoEspecifico.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadPedVenda.BitBtn82Click(Sender: TObject);
begin
  if (CadPedVenda.vItServ.vMecOs.dataSet.State in [dsInsert, dsEdit]) then
    if not CadPedVenda.vItServ.vMecOs.Post then
      Exit;
  if not CadPedVenda.vItServ.vMecOs.validarCampos then
  begin
    SpeedButton31Click(Sender);
    exit;
  end;
  CadPedVenda.vItServ.vMecOs.dataSet.Filtered:=false;
  DBGrid50.Visible := true;
  GroupBox42.visible := false;
  Panel17.Enabled := false;
  PageControl3.ActivePage := tsOrdemServ;
end;

procedure TFrmCadPedVenda.BitBtn83Click(Sender: TObject);
begin
  inherited;
  if BitBtn83.Tag <> 0 then
    Exit;
  CadPedVenda.onEstoqueMinimoAtingido := estoque_minimo_notificar;
  try
    BitBtn83.Tag := 1;
    Screen.Cursor := crHourGlass;
    if (Self.Enabled) and (Self.Visible) and (BitBtn83.CanFocus) then
	    BitBtn83.SetFocus;
    if ActiveControl <> BitBtn83 then
      exit;

    if not vDadosIni.PesqPros('VND046', 'SALVAR PEDIDO', CadPedVenda.getTipoVenda + ' Nº ' +
      CadPedVenda.dataSet.FieldByName('NPED').AsString, 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').AsString, CadPedVenda.buscas, true) then
      Exit;

    if not CadPedVenda.ChecaTipVendaVendedor then
      exit;
    {if not CadPedVenda.verificaColaboradorProdutos(true, false) then
    begin
      setFocusCampoErro(CadPedVenda.vNomeCampoErro);
      Exit;
    end;
    }
    if not CadPedVenda.ChecaCamposObrigatorios then
    begin
      tsFechamento.Show;
      if CadPedVenda.vNomeCampoErro = 'DBEdit67' then
        lMsg.Caption := 'Informe o cliente'
      else if CadPedVenda.vNomeCampoErro = 'DBEdit70' then
        lMsg.Caption := 'Informe o vendedor'
      else if CadPedVenda.vNomeCampoErro = 'DBEdit108' then
        lMsg.Caption := 'Informe a condição de pagamento';
      setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro);
    end
    else
    begin
      faturamento_action_before_save;

      CadPedVenda.AfterConfirmar := pedvenda_fechamento_after;
      if CadPedVenda.Post then
      begin
        inherited;
        CheckBox4.Checked := true;
        edCodBarra.Enabled := true;
        BitBtn3Click(BitBtn3);
        ldescricao.Caption := '';
        eVlUnit.Valor := 0;
        eSubTotal.Valor := 0;
        edCodBarra.Clear;
      end
      else if (CadPedVenda.vNomeCampoErro = 'DBEdit106') or (CadPedVenda.vNomeCampoErro = 'DBEdit149') then
      begin
        CadPedVenda.vNomeCampoErro := 'DBEdit107';
        setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro);
      end;
    end;
  finally
    BitBtn83.Tag := 0;
    CadPedVenda.onEstoqueMinimoAtingido := nil;
    CadPedVenda.AfterConfirmar := nil;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.BitBtn84Click(Sender: TObject);
begin
  inherited;
  TabSheet2.Show;
  if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
	  DBGrid1.SetFocus;
end;

procedure TFrmCadPedVenda.BitBtn85Click(Sender: TObject);
begin
  inherited;
  if not CadPedVenda.vItServ.post then
    Exit;
  if CadPedVenda.vItServ.dataSet.IsEmpty then
    Exit;
  CadPedVenda.vItServ.vMecOs.montaItens(
    CadPedVenda.vItServ.dataSet.FieldByName('nped').AsString,
    CadPedVenda.vItServ.dataSet.FieldByName('cod_servico').AsString,
    CadPedVenda.vItServ.dataSet.FieldByName('codigo_nop').AsString,
    CadPedVenda.vItServ.dataSet.FieldByName('tipo').AsString);
  PageControl3.Tag := 1;
  CadPedVenda.calculaTotais;
  DBGrid5.Enabled := true;
  GroupBox14.Enabled := true;
  tsMecanicosOS.Show;  
end;

procedure TFrmCadPedVenda.BitBtn86Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.vItServ.vMecOs.insert(
    CadPedVenda.vItServ.dataSet.FieldByName('cod_servico').AsInteger,
    CadPedVenda.vColab.dataSet.FieldByName('cod_vendedor').AsInteger,
    CadPedVenda.dataSet.FieldByName('nped').AsInteger,
    CadPedVenda.vItServ.dataSet.FieldByName('codigo_nop').AsInteger,
    CadPedVenda.vItServ.dataSet.FieldByName('TIPO').AsString) then
  begin
    CadPedVenda.vItServ.vMecOs.Edit;
    DBGrid50.Visible := false;
    if (Self.Enabled) and (Self.Visible) and (DBEdit91.CanFocus) then
	    DBEdit91.SetFocus;
    GroupBox42.visible := false;
//    if (Self.Enabled) and (Self.Visible) and (Edit5.CanFocus) then
//      Edit5.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.BitBtn87Click(Sender: TObject);
begin
  inherited;
  CadPedVenda.abrirAtestadoIntevencaoTecnica;
end;

procedure TFrmCadPedVenda.BitBtn88Click(Sender: TObject);
begin
  inherited;
  if DBLookupComboBox10.KeyValue = null then
  begin
    Application.MessageBox('Vendedor deve ser informado.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBEdit78.CanFocus) then
    	DBEdit78.SetFocus;
    exit;
  end;

  if DBLookupComboBox31.KeyValue = null then
  begin
    Application.MessageBox('Código do Kit deve ser informado.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (EditMoeda6.CanFocus) then
    	EditMoeda6.SetFocus;
    exit;
  end;

  if DBLookupComboBox31.KeyValue <> Null then
    if (CadPedVenda.getTipoVenda <> 'REQ') and not ((CadPedVenda.getTipoVenda = 'ORC') and CadPedVenda.OrcamentoSoPecas) then
    begin
      if CadPedVenda.incluirKit(DBLookupComboBox31.KeyValue,
      	DBLookupComboBox10.KeyValue,
        DBLookupComboBox11.KeyValue,
        CheckBox6.Checked,
        ((CheckBox4.Visible) and (CheckBox4.Checked))) then
        begin
          if (Self.Enabled) and (Self.Visible) and (BitBtn89.CanFocus) then
            BitBtn89.SetFocus;
        end;
    end
    else if CadPedVenda.incluirKit(DBLookupComboBox31.KeyValue,
    	DBLookupComboBox10.KeyValue,
      -1,
      CheckBox6.Checked,
      ((CheckBox4.Visible) and (CheckBox4.Checked))) then
    begin
      if (Self.Enabled) and (Self.Visible) and (BitBtn89.CanFocus) then
	      BitBtn89.SetFocus;
    end;
  CadPedVenda.vKit.abreKitProd;
end;

procedure TFrmCadPedVenda.BitBtn89Click(Sender: TObject);
begin
  inherited;
  if (CadPedVenda.getTipoVenda = 'REQ')
  	or ((CadPedVenda.getTipoVenda = 'ORC') and (CadPedVenda.OrcamentoSoPecas)) then
  begin
  	if (CheckBox4.Visible) and (CheckBox4.Checked) then
	  	TForm(pnKitProd.Parent).ModalResult := IDCANCEL
    else
    begin
	    PageControl1.ActivePage := TabSheet1;
  	  PageControl3.ActivePage := TabSheet3;
    end;
    try
      Screen.Cursor := crHourGlass;
      if (CadPedVenda.vItProd.dataSet.State in [dsEdit, dsInsert]) then
        CadPedVenda.vItProd.dataSet.Cancel;
      CadPedVenda.calculaDescontoAcrescimo;
      Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else
  begin
    PageControl1.ActivePage := TabSheet1;
    PageControl3.ActivePage := tsOrdemServ;
    pgOS.ActivePage := tsProdOS;
    try
      Screen.Cursor := crHourGlass;
      if (CadPedVenda.vItProd.dataSet.State in [dsEdit, dsInsert]) then
        CadPedVenda.vItProd.dataSet.Cancel;
      CadPedVenda.calculaDescontoAcrescimo;
      Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
      Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    finally
      Screen.Cursor := crDefault;
    end;
  end;
  eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;
end;

procedure TFrmCadPedVenda.BitBtn8Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.getTipoVenda = 'OS' then
  begin
    if not vDadosIni.PesqPros('VND014', 'INCLUIR ITEM', '', 'PEDVENDA_PROD', '', CadPedVenda.buscas, true) then
      Exit;
  end
  else if not vDadosIni.PesqPros('VND018', 'INCLUIR ITEM', '', 'PEDVENDA_PROD', '', CadPedVenda.buscas, true) then
    Exit;

  if CadPedVenda.vendaFechada then
    Exit;
  if not CadPedVenda.verPendenciaVendaIt('P') then
    exit;
//  if not CadPedVenda.ChecaCamposObrigatorios then
//  begin
//    setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro);
//    exit;
//  end;
  if CadPedVenda.vItProd.Insert then
  begin
    CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency := 0;
    CadPedVenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString := 'DESCONTO';
    CadPedVenda.vItProd.dataSet.FieldByName('NAT_DESCACRES').AsString := 'PERCENTUAL';

    DBComboBox16.Visible := True;
    DBComboBox17.Visible := True;
    DBGrid3.Enabled:= not(CadPedVenda.vItProd.dataSet.State in [dsInsert, dsEdit]);
    Panel16.Enabled := true;
    dbedit46.enabled := true;
    SpeedButton15.Enabled := true;
    dbedit47.enabled := true;
    GroupBox14.Enabled := false;
//    GroupBox16.Enabled := false;
    vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit51.Enabled := not vDadosIni.PesqPros('VND133', 'HABILITAR', '', 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').AsString + '/' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, false);
    if (Self.Enabled) and (Self.Visible) and (DBEdit44.CanFocus) then
      DBEdit44.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox8.CanFocus) then
      DBLookupComboBox8.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (DBEdit45.CanFocus) then
      DBEdit45.SetFocus;
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('VND179', 'HABILITAR', '', 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').AsString + '/' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, false) then
    begin
     DBEdit50.Enabled := False;
     DBEdit19.Enabled := False;
     DBEdit20.Enabled := False;
    end
    else
    begin
     DBEdit50.Enabled := True;
     DBEdit19.Enabled := True;
     DBEdit20.Enabled := True;
    end;
  end
  else
    DBGrid3.Enabled:= not(CadPedVenda.vItProd.dataSet.State in [dsInsert, dsEdit]);
  Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
  Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
end;

procedure TFrmCadPedVenda.BitBtn90Click(Sender: TObject);
begin
  inherited;
  CadPedVenda.vAgenda.vAgendaItens.dataSet.Edit;
  CadPedVenda.vAgenda.vAgendaItens.dataSet.FieldByName('CODBOX').AsString :=
  CadPedVenda.vAgenda.vAgendaItens.fBox.FieldByName('COD_BOX').AsString +
  ' - ' + CadPedVenda.vAgenda.vAgendaItens.fBox.FieldByName('DESCR_BOX').AsString;
  CadPedVenda.vAgenda.vAgendaItens.dataSet.Post;

  TForm(pnBoxEspecifico.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.BitBtn91Click(Sender: TObject);
begin
  inherited;
	TForm(pnBoxEspecifico.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadPedVenda.BitBtn92Click(Sender: TObject);
begin
  inherited;
  TForm(pnFormasCliente.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.BitBtn93Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.vRVnd.vRVndSel.IsEmpty then
  begin
    Application.MessageBox('Selecione pelo menos uma política de pagamento para continuar.','Informação',MB_OK+MB_ICONINFORMATION);
    exit;
  end;
  TForm(pnOpcoesPagamento.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.BitBtn94Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja sair sem informar política de pagamento?', 'Atenção',  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  begin
    if not vDadosIni.PesqPros('VND263', 'PERMITIR', CadPedVenda.dataSet.FieldByName('tipo').AsString +
      ' ' + CadPedVenda.dataset.FieldByName('NPED').AsString, 'PEDVENDA',
      CadPedVenda.dataSet.FieldByName('NPED').AsString, CadPedVenda.buscas, true) then
    begin
      TForm(pnOpcoesPagamento.Parent).ModalResult := IDCANCEL;
    end
    else
    begin
      CadPedVenda.vRVnd._demarcarRegras;
      TForm(pnOpcoesPagamento.Parent).ModalResult := IDOK;
    end;
  end;
end;

procedure TFrmCadPedVenda.BitBtn95Click(Sender: TObject);
var
  vStatusSep: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    vStatusSep:= CadPedVenda.getStatusPedidoESeparacao(CadPedVenda.dataSet.FieldByName('nped').AsInteger);
    if (vDadosIni.getCampoPipe(vStatusSep, 2) = '') or (vDadosIni.getCampoPipe(vStatusSep, 2) = 'SEPARACAO') then
      if Application.MessageBox('Status da separação ainda não é "EM SEPARACAO". Deseja alterar?',
        'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
      begin
        CadPedVenda.iniciarSeparacao;
        pnSeparacaoEnter(pnSeparacao);
      end;
    vDadosIni.abreForm('Impressão Separação', pnImpressaoSeparacao, tsOutros2);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.BitBtn96Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    CadPedVenda.iniciarSeparacao;
    pnSeparacaoEnter(pnSeparacao);
    if not BitBtn96.CanFocus then
      if (Self.Enabled) and (Self.Visible) and (BitBtn99.CanFocus) then
        BitBtn99.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.BitBtn97Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    CadPedVenda.removerStatusSeparacao;
    pnSeparacaoEnter(pnSeparacao);
    if not BitBtn97.CanFocus then
      if (Self.Enabled) and (Self.Visible) and (BitBtn99.CanFocus) then
        BitBtn99.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.BitBtn98Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    CadPedVenda.finalizarSeparacao;
    pnSeparacaoEnter(pnSeparacao);
    if not BitBtn98.CanFocus then
      if (Self.Enabled) and (Self.Visible) and (BitBtn99.CanFocus) then
        BitBtn99.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.BitBtn99Click(Sender: TObject);
begin
  inherited;
  TForm(pnSeparacao.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadPedVenda.BitBtn99KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    BitBtn99.Click;
end;

procedure TFrmCadPedVenda.BitBtn9Click(Sender: TObject);
begin
  inherited;
  if CadPedVenda.vendaFechada then
    Exit;

  if not CadPedVenda.verificaColaboradorProdutos(true, true) then
  begin
    setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);
    exit;
  end;

  if not CadPedVenda.vItProd.validaAcresDescNoItem(
  	DBComboBox10.Text,
    DBComboBox11.Text,
    CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit134.CanFocus) then
	    DBEdit134.setfocus;
    exit;
  end;

  if not CadPedVenda.vItProd.validarAcrescDescAcrescCondPagComissaoVend then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit150.CanFocus) then
	    DBEdit150.setfocus;
    exit;
  end;

  if not verificarDescontoTabDifPromPrecoQtde(
  	CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('VLUN_ORIG').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString,
    CadPedVenda.vItProd.dataSet.FieldByName('NAT_DESCACRES').AsString,
    CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsFloat,
    False) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (DBEdit51.CanFocus) then
      DBEdit51.SetFocus;
    exit;
  end;

  if not CadPedVenda.vItProd.Post then
  begin
    DBGrid3.Enabled:= not(CadPedVenda.vItProd.dataSet.State in [dsInsert, dsEdit]);
    Panel16.Enabled := true;
    GroupBox14.Enabled := false;
//    GroupBox16.Enabled := false;
    setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);
    exit;
  end
  else
  begin
  	DBComboBox16.Visible := False;
  	vDadosIni.carregarUnidades(
      CadPedVenda.buscas,
      DBComboBox16);

    DBComboBox17.Visible := False;
    vDadosIni.carregarUnidades(
      CadPedVenda.buscas,
      DBComboBox17);

    Panel16.Enabled := false;
    DBGrid3.Enabled:= not(CadPedVenda.vItProd.dataSet.State in [dsInsert, dsEdit]);
    GroupBox16.Enabled := true;
    CadPedVenda.calculaTotais;
    GroupBox14.Enabled := true;
    if (Self.Enabled) and (Self.Visible) and (DBEdit29.CanFocus) then
      DBEdit29.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (edDescProdValor.CanFocus) then
      edDescProdValor.SetFocus;
    //    CadPedVenda.vCliente.ChecaLimiteEstourado(CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency);
  end;
end;

procedure TFrmCadPedVenda.BitBtnCancelarProdSimilarClick(Sender: TObject);
begin
  TForm(PnProdSimilar.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadPedVenda.BitBtnProdCancelarClick(Sender: TObject);
begin
  try
  	BitBtnProdCancelar.SetFocus;

    BitBtnProdOK.Enabled       := False;
  	BitBtnProdCancelar.Enabled := False;
    btSelectProdAll.Enabled    := False;
    btUnSelectProdAll.Enabled  := False;

		limparCamposProd(Sender);
  finally
    BitBtnProdOK.Enabled       := True;
  	BitBtnProdCancelar.Enabled := True;
    btSelectProdAll.Enabled    := True;
    btUnSelectProdAll.Enabled  := True;
  end;
end;

procedure TFrmCadPedVenda.BitBtnProdOKClick(Sender: TObject);
begin
  try
    BitBtnProdOK.SetFocus;

    BitBtnProdOK.Enabled       := False;
    BitBtnProdCancelar.Enabled := False;
    btSelectProdAll.Enabled    := False;
    btUnSelectProdAll.Enabled  := False;

    CadPedVenda.vItProd.vHabMecTecProdAlterClienteVnd := ckAlterarMecTecProd.Checked;
    CadPedVenda.vItProd.vHabVendAlterProdClienteVnd   := ckAlterarVendedorProd.Checked;
    CadPedVenda.vItProd.vCodMecTecProdAlterClienteVnd := Trunc(EditHw5.AsValue);
    CadPedVenda.vItProd.vCodVendAlterProdClienteVnd   := Trunc(EditHw6.AsValue);

    if (ckAlterarMecTecProd.Checked) and (EditHw5.AsValue <= 0) then
    begin
      if vDadosIni.vEmp.vUsarAparelho = 'S' then
        Application.MessageBox(PChar('Técnico não informado.'), 'Atenção', mb_ok + MB_ICONINFORMATION)
      else
        Application.MessageBox(PChar('Mecânico não informado.'), 'Atenção', mb_ok + MB_ICONINFORMATION);
      Exit;
    end;

    if (ckAlterarVendedorProd.Checked) and (EditHw6.AsValue <= 0) then
    begin
      Application.MessageBox(PChar('Vendedor não informado.'), 'Atenção', mb_ok + MB_ICONINFORMATION);
      Exit;
    end;

    if not CadPedVenda.vItProd.AlterarMecTecVend then
      Exit;
  finally
    BitBtnProdOK.Enabled       := True;
    BitBtnProdCancelar.Enabled := True;
    btSelectProdAll.Enabled    := True;
    btUnSelectProdAll.Enabled  := True;
  end;
end;

procedure TFrmCadPedVenda.BitBtnSalvarProdSimilarClick(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (BitBtnSalvarProdSimilar.CanFocus) then
  	BitBtnSalvarProdSimilar.SetFocus;
  TForm(PnProdSimilar.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.BitBtnServCancelarClick(Sender: TObject);
begin
  try
    BitBtnServCancelar.SetFocus;

    BitBtnServOK.Enabled       := False;
    BitBtnServCancelar.Enabled := False;
    btSelectServAll.Enabled    := False;
    btUnSelectServAll.Enabled  := False;

		limparCamposServ(Sender);
  finally
    BitBtnServOK.Enabled       := True;
    BitBtnServCancelar.Enabled := True;
    btSelectServAll.Enabled    := True;
    btUnSelectServAll.Enabled  := True;
  end;
end;

procedure TFrmCadPedVenda.BitBtnServOKClick(Sender: TObject);
begin
  try
    BitBtnServOK.SetFocus;

    BitBtnServOK.Enabled       := False;
    BitBtnServCancelar.Enabled := False;
    btSelectServAll.Enabled    := False;
    btUnSelectServAll.Enabled  := False;

    CadPedVenda.vItServ.vHabMecTecServAlterClienteVnd := ckAlterarMecTecServ.Checked;
    CadPedVenda.vItServ.vHabVendAlterServClienteVnd   := ckAlterarVendedorServ.Checked;
    CadPedVenda.vItServ.vCodMecTecServAlterClienteVnd := Trunc(EditHw2.AsValue);
    CadPedVenda.vItServ.vCodVendAlterServClienteVnd   := Trunc(EditHw4.AsValue);

    if (ckAlterarMecTecServ.Checked) and (EditHw2.AsValue <= 0) then
    begin
      if vDadosIni.vEmp.vUsarAparelho = 'S' then
        Application.MessageBox(PChar('Técnico não informado.'), 'Atenção', mb_ok + MB_ICONINFORMATION)
      else
        Application.MessageBox(PChar('Mecânico não informado.'), 'Atenção', mb_ok + MB_ICONINFORMATION);
      Exit;
    end;

    if (ckAlterarVendedorServ.Checked) and (EditHw4.AsValue <= 0) then
    begin
      Application.MessageBox(PChar(trim(vDadosIni.vPedVnd.NomeSegCampoServ) + ' não informado.'), 'Atenção', mb_ok + MB_ICONINFORMATION);
      Exit;
    end;

    if not CadPedVenda.vItServ.AlterarMecTecVend then
      Exit;
  finally
    BitBtnServOK.Enabled       := True;
    BitBtnServCancelar.Enabled := True;
    btSelectServAll.Enabled    := True;
    btUnSelectServAll.Enabled  := True;
  end;
end;

procedure TFrmCadPedVenda.btAlterarFaturaEntradaClick(Sender: TObject);
begin
  try
    edDocFaturaEntrada.Text := CadPedVenda.FContas.numeroDocumento[ListBox3.ItemIndex];
    edVencimentoFaturaEntrada.Text := CadPedVenda.FContas.vencimentoDocumento[ListBox3.ItemIndex];
    edValorFaturaEntrada.AsValue := CadPedVenda.FContas.valorDocumento[ListBox3.ItemIndex];
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

procedure TFrmCadPedVenda.btApagarDespClick(Sender: TObject);
begin
  if not CadPedVenda.apagarContas then
    exit;

  CadPedVenda.ApagarContasPagarTemp(cdsDesp);
end;

procedure TFrmCadPedVenda.btCancelarECFSaidaClick(Sender: TObject);
begin
  inherited;
  TForm(pnECFSaida.Parent).ModalResult := IDCANCEL;
end;


procedure TFrmCadPedVenda.btConfirmarDocCancelClick(Sender: TObject);
begin
  TForm(pnConfirmarDoc.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadPedVenda.btConfirmarDocOKClick(Sender: TObject);
begin
  TForm(pnConfirmarDoc.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.btDevolucaoUnidadeCancelClick(Sender: TObject);
begin
  inherited;
  TForm(pnDevolucaoUnidade.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadPedVenda.btEraseAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    CadPedVenda.vAgenda.vAgendaItens._LimparDados(true);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.btEscolherECFSaidaClick(Sender: TObject);
begin
  inherited;
  TForm(pnECFSaida.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.btGerarClick(Sender: TObject);
begin
  inherited;
  if CadPedVenda.getTipoVenda = 'ORC' then
  CadPedVenda.ApagarContasPagarTemp(cdsDesp);
  if not CadPedVenda.gerarContas(vDadosIni.IfThen(
  	DBText14.DataSource = TDtmPedVenda(dtm).dsProdTerceiro, 'P', 'S'), CadPedVenda.FContas) then
  	exit;

  CadPedVenda.GravarContasPagarTemp(CadPedVenda.FContas, cdsDesp);
end;

procedure TFrmCadPedVenda.btnDevolucaoUnidadeOKClick(Sender: TObject);
begin
  inherited;
  TForm(pnDevolucaoUnidade.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.btnExcluirCancelamentoClick(Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
		CadPedVenda.excluirNFSE_CANCELADAS;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.btnOKCancelarClick(Sender: TObject);
begin
  try
  	Screen.Cursor := crHourGlass;
    
    if not (Length(Trim(edtMotivoCancelamento.Text)) >= 15) then
    begin
    	Application.MessageBox('O motivo precisa ter no minimo 15 caracteres!', 'Informação', MB_ICONEXCLAMATION + MB_OK);
      Exit;
    end;

    if Trim(meDataCancelamento.Text) = '' then
    begin
    	Application.MessageBox('Digite a data de cancelamento!', 'Informação', MB_ICONEXCLAMATION + MB_OK);
      Exit;
    end;           

		if CadPedVenda.cancelaNFSEXT(Trim(edtMotivoCancelamento.Text), StrToDate(meDataCancelamento.Text)) then
    	Application.MessageBox('Cancelamento Concluido!', 'Informação', MB_ICONEXCLAMATION + MB_OK);
      
    if vDadosIni.vPesquisa <> '' then
			Application.MessageBox(PChar('NFS-EXT não cancelada, favor conferir os seguintes campos: ' + #13 +
      'Aliquota IIS, CTISS, LC 116/03, CNAE. Verificar estes dados  nos seguintes tipos de serviços: ' + #13
      	+ vDadosIni.vPesquisa), 'Informação', MB_ICONEXCLAMATION + MB_OK);
        
    TForm(pnCancelarNFSE.Parent).ModalResult := mrOk;
  finally
    Screen.Cursor := crDefault;
    vDadosIni.vPesquisa := '';        
  end;
end;

procedure TFrmCadPedVenda.btSalvarFaturaEntradaClick(Sender: TObject);
var
  vIndex:Integer;
begin
  inherited;
  try
    vIndex := ListBox3.ItemIndex;
    getFaturas;
    ListBox3.ItemIndex := vIndex;
  finally
    CadPedVenda.GravarContasPagarTemp(CadPedVenda.FContas, cdsDesp);
    btAlterarFaturaEntrada.Enabled := True;
    ListBox3.Enabled := True;
    Panel71.Visible := False;

    BitBtn66.Enabled := true;
    BitBtn67.Enabled := true;
    btGerar.Enabled := true;
    btApagarDesp.Enabled := true;
  end;
end;

procedure TFrmCadPedVenda.btSelectAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    CadPedVenda.vAgenda.vAgendaItens._marcarTodos;
    DBLookupComboBox32.KeyValue := CadPedVenda.vAgenda.vAgendaItens.fBox.FieldByName('COD_BOX').AsInteger;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.btUnSelectAllClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    CadPedVenda.vAgenda.vAgendaItens._desmarcarTodos;
    DBLookupComboBox32.KeyValue := CadPedVenda.vAgenda.vAgendaItens.fBox.FieldByName('COD_BOX').AsInteger;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.btUnSelectAllProdutosMesclarClick(Sender: TObject);
begin
  CadPedVenda.marcarDesmarcarItemProdTodos(true);
end;

procedure TFrmCadPedVenda.btUnSelectAllProdutosTerceirosMesclarClick(
  Sender: TObject);
begin
  CadPedVenda.marcarDesmarcarItemProdTercTodos(true);
end;

procedure TFrmCadPedVenda.btUnSelectAllServicosMesclarClick(Sender: TObject);
begin
  CadPedVenda.marcarDesmarcarItemServTodos(true);
end;

procedure TFrmCadPedVenda.btUnSelectAllServicosTerceirosMesclarClick(
  Sender: TObject);
begin
	CadPedVenda.marcarDesmarcarItemServTercTodos(true);
end;

procedure TFrmCadPedVenda.btUnSelectProdAllClick(Sender: TObject);
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;

		CadPedVenda.vItProd._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.btUnSelectServAllClick(Sender: TObject);
begin
  inherited;
  try
  	Screen.Cursor := crHourGlass;

		CadPedVenda.vItServ._desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.btVendaRapidaPesquisaProcurarClick(Sender: TObject);
begin
  ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(CadPedVenda.dataSet.FieldByName('data_ped').DisplayLabel);
  ComboBox1.Text      := CadPedVenda.dataSet.FieldByName('data_ped').DisplayLabel;
  MaskEdit1.Visible := True;
  MaskEdit2.Visible := True;
  MaskEdit3.Visible := False;

  MaskEdit1.Text := edVendaRapidaPesquisaDataIni.Text;
  MaskEdit2.Text := edVendaRapidaPesquisaDataFim.Text;
  BitBtn1.Click;
  if (Self.Enabled) and (Self.Visible) and (gridVendaRapidaPesquisa.CanFocus) then
    gridVendaRapidaPesquisa.SetFocus;
end;

procedure TFrmCadPedVenda.bt_cliente_dests_utilizar_principalClick(Sender: TObject);
begin
  inherited;
  if CadPedVenda.vCliente.endAdic.utilizarEndereco_principal then
    bt_cliente_dests_utilizar_principal.Tag := 1;
  grid_cliente_dests.Repaint;
  pedvenda_cliente_endadd_scroll;
end;

procedure TFrmCadPedVenda.voltaFormularioVendaRapidaParaInsercao;
begin
  pnVendaRapidaPesquisa.Visible := False;
  lMsg.Visible                  := True;
  lMsg.Top                      := 2048;
  Panel9.Visible                := True;
  Panel9.Top                    := 2048;
  Panel35.Visible               := True;
  Panel35.Top                   := 2048;
end;

procedure TFrmCadPedVenda.carregarDBGrids;
begin
	if (setTClientPadrao2) and (PrimeiraPesquisa2) then
  begin
    PrimeiraPesquisa2 := False;

    vDadosIni.configurarGridPeloConfigColunas(
      DBGrid2,
      GridCfg2,
      cdsGrid2,
      cdsColunas2,
      vusuario,
      ListGridsAndDataSets2,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet2);
  end;

  if (setTClientPadrao3) and (PrimeiraPesquisa3) then
  begin
    PrimeiraPesquisa3 := False;

    vDadosIni.configurarGridPeloConfigColunas(
    	DBGrid3,
      GridCfg3,
      cdsGrid3,
      cdsColunas3,
      vusuario,
      ListGridsAndDataSets3,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet3);
  end;

  if (setTClientPadrao5) and (PrimeiraPesquisa5) then
  begin
    PrimeiraPesquisa5 := False;

    vDadosIni.configurarGridPeloConfigColunas(
    	DBGrid5,
      GridCfg5,
      cdsGrid5,
      cdsColunas5,
      vusuario,
      ListGridsAndDataSets5,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet5);
  end;

  if (setTClientPadrao6) and (PrimeiraPesquisa6) then
  begin
    PrimeiraPesquisa6 := False;

    vDadosIni.configurarGridPeloConfigColunas(
    	DBGrid6,
      GridCfg6,
      cdsGrid6,
      cdsColunas6,
      vusuario,
      ListGridsAndDataSets6,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet6);
  end;

  if (setTClientPadrao7) and (PrimeiraPesquisa7) then
  begin
    PrimeiraPesquisa7 := False;

    vDadosIni.configurarGridPeloConfigColunas(
    	DBGrid7,
      GridCfg7,
      cdsGrid7,
      cdsColunas7,
      vusuario,
      ListGridsAndDataSets7,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet7);
  end;

  if (setTClientPadrao12) and (PrimeiraPesquisa12) then
  begin
    PrimeiraPesquisa12 := False;

    vDadosIni.configurarGridPeloConfigColunas(
    	DBGrid12,
      GridCfg12,
      cdsGrid12,
      cdsColunas12,
      vusuario,
      ListGridsAndDataSets12,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet12);
  end;
end;

procedure TFrmCadPedVenda.carregarImagemProdutos;
var
  fListImg: TStrings;
  vtemp: string;
begin
   if (CadPedVenda.vItProd.vProduto.dataSet.FieldByName('GRUPO_PROD').AsInteger > 0)
     or (trim(CadPedVenda.vItProd.vProduto.dataSet.FieldByName('COD_PROD').AsString) <> '') then
   begin
      try
        fListImg := TStringList.Create;
        if trim(CadPedVenda.vItProd.vProduto.dataSet.FieldByName('LISTA_IMAGENS').AsString) <> '' then
        	fListImg.Text := CadPedVenda.vItProd.vProduto.dataSet.FieldByName('LISTA_IMAGENS').AsString
        else
        begin
          fListImg.Text := vDadosIni.retornaPrimeiraImagem(
          	CadPedVenda.buscas,
            CadPedVenda.vItProd.vProduto.dataSet.FieldByName('GRUPO_PROD').AsInteger,
            CadPedVenda.vItProd.vProduto.dataSet.FieldByName('COD_PROD').AsString);
        end;

        if fListImg.Count > 0 then
        begin
           if trim(vDiretorioPadraoImg) = '' then
             vtemp := fListImg[0]
           else if vDadosIni.strIn(Copy(fListImg[0], 2, 1), ['\', ':']) then
             vtemp := fListImg[0]
           else
             vtemp := vDiretorioPadraoImg + fListImg[0];

           if FileExists(vtemp) then
           begin
             imgLogo.Proportional := true;
             
             try
             	 imgLogo.Picture.LoadFromFile(trim(vtemp));
             except
             end;

             Self.Tag := 999;
           end;
        end;
      finally
      	if Assigned(fListImg) then
        	FreeAndNil(fListImg);
      end;
   end
   else if Self.Tag = 999 then
     if FileExists(ExtractFilePath(Application.ExeName) + 'logo.jpg') then
     begin
       imgLogo.Proportional := false;

       try
       	 imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
       except
       end;
       
     end;
end;

procedure TFrmCadPedVenda.chamarConfirmacaoPEDpelaNF;
var
  vTpTemp: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if dtm = nil then
	  	dtm := TDtmPedVenda.Create(Self);

    vTpTemp := CadPedVenda.getTipoVenda;

    vDadosIni.vtpVenda := vNFGeraREQTipoPed;
    CadPedVenda.create(TDtmPedVenda(dtm));
    CadPedVenda.FrmCadPed := Self;

    CadPedVenda.dataSet := TClientDataSet(TDtmPedVenda(dtm).cdsVnd);
    CadPedVenda.vItProd.dataSet := TClientDataSet(TDtmPedVenda(dtm).cdsIVnd);
    CadPedVenda.buscas := TIBQuery(TDtmPedVenda(dtm).qrbuscasVnd);
    CadPedVenda.vCliente.buscas := TIBQuery(TDtmPedVenda(dtm).qrbuscasVnd);
    CadPedVenda.vItProd.buscas := TIBQuery(TDtmPedVenda(dtm).qrbuscasVnd);
    CadPedVenda.transacao := TIBTransaction(TDtmPedVenda(dtm).ibTransPedVnd);
    CadPedVenda.vMovimentaEstoque.Transaction := TIBTransaction(TDtmPedVenda(dtm).ibTransPedVnd);
    CadPedVenda.vMovimentaEstoqueEC.Transaction := TIBTransaction(TDtmPedVenda(dtm).ibTransPedVnd);

    CadPedVenda.abrePedVenda(vNFGeraREQNPed);

    if not CadPedVenda.Edit then
      exit;

    if not CadPedVenda.validaConfirmacao then
    begin
    	CadPedVenda.Cancel;
    	Exit;
    end;

    if not CadPedVenda.calculaDescontoAcrescimo then
      Exit;

    if CadPedVenda.getTipoVenda = 'REQ' then
    begin
      if not CadPedVenda.vItProd.vProduto.validaEstoqueFechamento then
      begin
        Application.MessageBox('O documento não foi confirmado.', 'Informação', MB_ICONEXCLAMATION + MB_OK);
        exit;
      end;
    end;
    CadPedVenda.abrePedVenda(CadPedVenda.dataSet.FieldByName('NPED').AsInteger);
    CadPedVenda.confirmarVenda;
    CadPedVenda.RollBackTransacao;
  finally
    CadPedVenda.pedidoEmEdicao(caRemoverEdicao, False);
    CadPedVenda.vMovimentaEstoque.Transaction := TIBTransaction(TDtmPedVenda(dtm).IBTransPedVenda);
    CadPedVenda.vMovimentaEstoqueEC.Transaction := TIBTransaction(TDtmPedVenda(dtm).IBTransPedVenda);
    vDadosIni.vtpVenda := vTpTemp;
    CadPedVenda.create(TDtmPedVenda(dtm));
    CadPedVenda.dataSet := TClientDataSet(TDtmPedVenda(dtm).cdsPedVenda);
    CadPedVenda.vItProd.dataSet := TClientDataSet(TDtmPedVenda(dtm).cdsItemProd);
    CadPedVenda.buscas := TIBQuery(TDtmPedVenda(dtm).qrBuscas);
    CadPedVenda.vCliente.buscas := TIBQuery(TDtmPedVenda(dtm).qrBuscas);
    CadPedVenda.vItProd.buscas := TIBQuery(TDtmPedVenda(dtm).qrBuscas);
    CadPedVenda.transacao := TIBTransaction(TDtmPedVenda(dtm).IBTransPedVenda);
    if CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
      CadPedVenda.vCliente.abreClientes(CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.chamarReaberturaPEDpelaNF;
var
  vTpTemp: string;
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if dtm = nil then
	  	dtm := TDtmPedVenda.Create(Self);

    vTpTemp := CadPedVenda.getTipoVenda;

    vDadosIni.vtpVenda := vNFGeraREQTipoPed;
    CadPedVenda.create(TDtmPedVenda(dtm));
    CadPedVenda.FrmCadPed := Self;

    CadPedVenda.dataSet := TClientDataSet(TDtmPedVenda(dtm).cdsVnd);
    CadPedVenda.vItProd.dataSet := TClientDataSet(TDtmPedVenda(dtm).cdsIVnd);
    CadPedVenda.buscas := TIBQuery(TDtmPedVenda(dtm).qrbuscasVnd);
    CadPedVenda.transacao := TIBTransaction(TDtmPedVenda(dtm).ibTransPedVnd);

    CadPedVenda.abrePedVenda(vNFGeraREQNPed);

    CadPedVenda.reabrirVenda(False);

    CadPedVenda.RollBackTransacao;

  finally
    vDadosIni.vtpVenda := vTpTemp;
    CadPedVenda.create(TDtmPedVenda(dtm));
    CadPedVenda.dataSet := TClientDataSet(TDtmPedVenda(dtm).cdsPedVenda);
    CadPedVenda.vItProd.dataSet := TClientDataSet(TDtmPedVenda(dtm).cdsItemProd);
    CadPedVenda.buscas := TIBQuery(TDtmPedVenda(dtm).qrBuscas);
    CadPedVenda.transacao := TIBTransaction(TDtmPedVenda(dtm).IBTransPedVenda);
    if CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0 then
      CadPedVenda.vCliente.abreClientes(CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if trim(vTipoCriou) = 'REQ' then
  	RadioGroup4.ItemIndex := 0
  else if trim(vTipoCriou) = 'OS' then
  	RadioGroup4.ItemIndex := 1
	else
  	RadioGroup4.ItemIndex := 2;

  if CheckBox1.Checked then
  begin
    GroupBox13.Visible := CheckBox1.Checked;
    RadioGroup1.Visible := CheckBox3.Checked;
    RadioGroup2.Visible := CheckBox3.Checked;
//    RadioGroup3.Visible := CheckBox3.Checked;
  end
  else
  begin
    GroupBox13.Visible := CheckBox1.Checked;
    RadioGroup1.Visible := CheckBox3.Checked;
    RadioGroup2.Visible := CheckBox3.Checked;
//    RadioGroup3.Visible := CheckBox3.Checked;
  end;

  if ComboBox11.Items.Count = 0 then
  begin
    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;
  end;
  if (Self.Enabled) and (Self.Visible) and (ComboBox11.CanFocus) then
    ComboBox11.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
    BitBtn1.SetFocus;
  //    ComboBox11.Items := ComboBox1.Items;
//    ComboBox11.Text := ComboBox1.Text;
end;

procedure TFrmCadPedVenda.CheckBox2Click(Sender: TObject);
begin
  inherited;
  if CheckBox2.Checked then
    CadPedVenda.filtrarItensDAV(0, '');
end;

procedure TFrmCadPedVenda.CheckBox3Click(Sender: TObject);
begin
  inherited;
  if trim(vTipoCriou) = 'REQ' then
  	RadioGroup4.ItemIndex := 0
  else if trim(vTipoCriou) = 'OS' then
  	RadioGroup4.ItemIndex := 1
	else
  	RadioGroup4.ItemIndex := 2;

 if CheckBox3.Checked then
 begin
  RadioGroup1.Visible := CheckBox3.Checked;
  RadioGroup2.Visible := CheckBox3.Checked;
//    RadioGroup3.Visible := CheckBox3.Checked;
 end
 else
 begin
  RadioGroup1.Visible := CheckBox3.Checked;
  RadioGroup2.Visible := CheckBox3.Checked;
//    RadioGroup3.Visible := CheckBox3.Checked;
end;

if CheckBox1.Checked then
 GroupBox13.Visible := CheckBox1.Checked
else
 GroupBox13.Visible := CheckBox1.Checked;
end;

procedure TFrmCadPedVenda.CheckBox4Click(Sender: TObject);
begin
  if CadPedVenda.getTipoVenda = 'REQ' then
    _GravaConfiguracoesBoolean(CheckBox4.Name, CheckBox4.Checked);
end;

procedure TFrmCadPedVenda.CheckBox5Click(Sender: TObject);
begin
  inherited;
  CadPedVenda.vItProd.vUsarPPS := CheckBox5.Checked;
end;

procedure TFrmCadPedVenda.CheckBoxProdServEmAbasClick(Sender: TObject);
begin
  inherited;
	_GravaConfiguracoesBoolean(CheckBoxProdServEmAbas.Name, CheckBoxProdServEmAbas.Checked);

  if not CheckBoxProdServEmAbas.Checked then
  begin
    tsMesclarProdutos.TabVisible  := False;
    tsMesclarServicos.TabVisible  := False;
    tsMesclarProdutosTerceiro.TabVisible := False;
    tsMesclarServicosTerceiro.TabVisible := False;

    PageControl8.Align := alTop;
    PageControl8.Height := 470;

    GroupBoxProdutosMesclar.Parent := PanelProdutosMesclar;
    Splitter4.Parent  := tsMesclar;

    GroupBoxServicosMesclar.Parent := PanelServicosMesclar;
    Splitter5.Parent  := tsMesclar;

    GroupBoxServicosTerceiroMesclar.Parent := PanelServicosTerceiroMesclar;
    Splitter6.Parent  := tsMesclar;

    GroupBoxProdutosTerceiroMesclar.Parent := PanelProdutosTerceiroMesclar;

    PanelProdutosMesclar.Visible          := True;
    PanelServicosMesclar.Visible          := (CadPedVenda.getTipoVenda <> 'REQ');
    PanelServicosTerceiroMesclar.Visible  := (CadPedVenda.getTipoVenda <> 'REQ');
    PanelProdutosTerceiroMesclar.Visible  := (CadPedVenda.getTipoVenda <> 'REQ') and (vDadosIni.vProdTerc = 'S') and (vDadosIni.vTerminalFiscal <> 'S');

    Splitter4.Visible                     := (CadPedVenda.getTipoVenda <> 'REQ');
    Splitter5.Visible                     := (CadPedVenda.getTipoVenda <> 'REQ');
    Splitter6.Visible                     := (CadPedVenda.getTipoVenda <> 'REQ') and (vDadosIni.vProdTerc = 'S') and (vDadosIni.vTerminalFiscal <> 'S');

    PanelProdutosMesclar.Top              := 0;
    Splitter4.Top                         := PanelProdutosMesclar.Top + PanelProdutosMesclar.Height;

    PanelServicosMesclar.Top 							:= Splitter4.Top + Splitter4.Height;
    Splitter5.Top                         := PanelServicosMesclar.Top + PanelServicosMesclar.Height;

    PanelServicosTerceiroMesclar.Top      := Splitter5.Top + Splitter5.Height;
    Splitter6.Top                         := PanelServicosTerceiroMesclar.Top + PanelServicosTerceiroMesclar.Height;

    PanelProdutosTerceiroMesclar.Top      := Splitter6.Top + Splitter6.Height;

    if (CadPedVenda.getTipoVenda = 'REQ') then
    begin
      PanelProdutosMesclar.Align          := alClient;
      PanelServicosMesclar.Align          := alNone;
      PanelServicosTerceiroMesclar.Align  := alNone;
      PanelProdutosTerceiroMesclar.Align  := alNone;
    end
    else
    begin
      PanelProdutosMesclar.Align          := alTop;
      PanelProdutosMesclar.Height         := 130;

      PanelServicosMesclar.Align          := alTop;
      PanelServicosMesclar.Height         := 120;

      PanelServicosTerceiroMesclar.Align  := alTop;
      PanelServicosTerceiroMesclar.Height := 100;

      PanelProdutosTerceiroMesclar.Align  := alTop;
      PanelProdutosTerceiroMesclar.Height := 100;
    end;

    PageControl8.ActivePage := tsMesclar;
    tsMesclar.Show;
  end
  else
  begin
  	PageControl8.Align := alClient;

    GroupBoxProdutosMesclar.Parent := tsMesclarProdutos;
    Splitter4.Parent  := tsMesclarProdutos;

    GroupBoxServicosMesclar.Parent := tsMesclarServicos;
    Splitter5.Parent  := tsMesclarServicos;

    GroupBoxServicosTerceiroMesclar.Parent := tsMesclarServicosTerceiro;
    Splitter6.Parent  := tsMesclarServicosTerceiro;

    GroupBoxProdutosTerceiroMesclar.Parent := tsMesclarProdutosTerceiro;

    tsMesclarProdutos.TabVisible         := True;
    tsMesclarProdutos.Visible            := True;

    tsMesclarServicos.TabVisible         := (CadPedVenda.getTipoVenda <> 'REQ');
    tsMesclarServicos.Visible            := (CadPedVenda.getTipoVenda <> 'REQ');

    tsMesclarServicosTerceiro.TabVisible := (CadPedVenda.getTipoVenda <> 'REQ');
    tsMesclarServicosTerceiro.Visible    := (CadPedVenda.getTipoVenda <> 'REQ');

    tsMesclarProdutosTerceiro.TabVisible := (CadPedVenda.getTipoVenda <> 'REQ') and (vDadosIni.vProdTerc = 'S') and (vDadosIni.vTerminalFiscal <> 'S');
    tsMesclarProdutosTerceiro.Visible    := (CadPedVenda.getTipoVenda <> 'REQ') and (vDadosIni.vProdTerc = 'S') and (vDadosIni.vTerminalFiscal <> 'S');

    PageControl8.ActivePage := tsMesclarProdutos;
    tsMesclarProdutos.Show;
  end;
end;

procedure TFrmCadPedVenda.ckAlterarClienteVendaClick(Sender: TObject);
begin
	if ((not ckAlterarClienteVenda.Checked) and (ckAlterarClienteVendaFpCreditos.Checked)) then
  	ckAlterarClienteVendaFpCreditos.Checked := false;

  if not ckAlterarClienteVenda.Enabled then
  	exit;

  if (ckAlterarClienteVenda.Checked) then
  begin
	  if not vDadosIni.PesqPros(
    	vDadosIni.IfThen(CadPedVenda.getTipoVenda = 'REQ', 'VND098', vDadosIni.IfThen(CadPedVenda.getTipoVenda = 'ORC', 'VND199', 'VND200')),
    	'ALTERAR', 'CLIENTE', 'PEDVENDA',
    	trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) + ' ' + CadPedVenda.dataSet.FieldByName('NPED').AsString,
      CadPedVenda.buscas, true) then
    begin
      ckAlterarClienteVenda.Checked := false;
      exit;
    end;
  end;

  Label128.Enabled := (ckAlterarClienteVenda.Checked) or (ckAlterarClienteVendaFpCreditos.Checked);
  DBEdit88.Enabled := (ckAlterarClienteVenda.Checked) or (ckAlterarClienteVendaFpCreditos.Checked);
  DBLookupComboBox12.Enabled := (ckAlterarClienteVenda.Checked) or (ckAlterarClienteVendaFpCreditos.Checked);

  BitBtnCabOK.Enabled :=
  	(ckAlterarClienteVenda.Checked)
    or (ckAlterarVendedorVenda.Checked)
    or (ckAlterarFormaPagamentoVenda.Checked)
    or (ckAlterarParticipanteVenda.Checked)
    or (ckAlterarClienteVendaFpCreditos.Checked)
    or (ckAlterarVendedorVendaFpCreditos.Checked);
  BitBtnCabCancelar.Enabled :=
  	(ckAlterarClienteVenda.Checked)
    or (ckAlterarVendedorVenda.Checked)
    or (ckAlterarFormaPagamentoVenda.Checked)
    or (ckAlterarParticipanteVenda.Checked)
    or (ckAlterarClienteVendaFpCreditos.Checked)
    or (ckAlterarVendedorVendaFpCreditos.Checked);

  if (Self.Enabled) and (Self.Visible) and (DBEdit88.CanFocus) then
    DBEdit88.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit90.CanFocus) then
    DBEdit90.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit119.CanFocus) then
    DBEdit119.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit127.CanFocus) then
    DBEdit127.SetFocus;
end;

procedure TFrmCadPedVenda.ckAlterarClienteVendaFpCreditosClick(Sender: TObject);
begin
	if ckAlterarClienteVendaFpCreditos.Checked then
  	ckAlterarClienteVenda.Checked := true;

  if not ckAlterarClienteVendaFpCreditos.Enabled then
  	exit;

	if ckAlterarClienteVendaFpCreditos.Checked then
  	if not vDadosIni.PesqPros('VND238', 'ALTERAR', '', 'PEDVENDA',
    	CadPedVenda.dataSet.FieldByName('TIPO').AsString + ' ' + CadPedVenda.dataSet.FieldByName('NPED').AsString,
      CadPedVenda.buscas, true) then
    begin
    	ckAlterarClienteVendaFpCreditos.Checked := false;
    	exit;
    end;

  Label128.Enabled := (ckAlterarClienteVenda.Checked) or (ckAlterarClienteVendaFpCreditos.Checked);
  DBEdit88.Enabled := (ckAlterarClienteVenda.Checked) or (ckAlterarClienteVendaFpCreditos.Checked);
  DBLookupComboBox12.Enabled := (ckAlterarClienteVenda.Checked) or (ckAlterarClienteVendaFpCreditos.Checked);

  BitBtnCabOK.Enabled :=
  	(ckAlterarClienteVenda.Checked)
    or (ckAlterarVendedorVenda.Checked)
    or (ckAlterarFormaPagamentoVenda.Checked)
    or (ckAlterarParticipanteVenda.Checked)
    or (ckAlterarClienteVendaFpCreditos.Checked)
    or (ckAlterarVendedorVendaFpCreditos.Checked);
  BitBtnCabCancelar.Enabled :=
  	(ckAlterarClienteVenda.Checked)
    or (ckAlterarVendedorVenda.Checked)
    or (ckAlterarFormaPagamentoVenda.Checked)
    or (ckAlterarParticipanteVenda.Checked)
    or (ckAlterarClienteVendaFpCreditos.Checked)
    or (ckAlterarVendedorVendaFpCreditos.Checked);

  if (Self.Enabled) and (Self.Visible) and (DBEdit88.CanFocus) then
    DBEdit88.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit90.CanFocus) then
    DBEdit90.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit119.CanFocus) then
    DBEdit119.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit127.CanFocus) then
    DBEdit127.SetFocus;
end;

procedure TFrmCadPedVenda.ckAlterarFormaPagamentoVendaClick(Sender: TObject);
begin
  if not ckAlterarFormaPagamentoVenda.Enabled then
  	exit;

  if (ckAlterarFormaPagamentoVenda.Checked) then
  begin
    if not vDadosIni.PesqPros(
    	'VND162',
      'ALTERAR', 'FORMPAGAMENTO', 'PEDVENDA',
    	CadPedVenda.dataSet.FieldByName('TIPO').AsString + ' ' + CadPedVenda.dataSet.FieldByName('NPED').AsString,
      CadPedVenda.buscas, true) then
    begin
      ckAlterarFormaPagamentoVenda.Checked := false;
      exit;
    end;
  end;

  Label196.Enabled := (ckAlterarFormaPagamentoVenda.Checked);
  DBEdit119.Enabled := (ckAlterarFormaPagamentoVenda.Checked);
  DBLookupComboBox35.Enabled := (ckAlterarFormaPagamentoVenda.Checked);

  BitBtnCabOK.Enabled :=
  	(ckAlterarClienteVenda.Checked)
    or (ckAlterarVendedorVenda.Checked)
    or (ckAlterarFormaPagamentoVenda.Checked)
    or (ckAlterarParticipanteVenda.Checked)
    or (ckAlterarClienteVendaFpCreditos.Checked)
    or (ckAlterarVendedorVendaFpCreditos.Checked);
  BitBtnCabCancelar.Enabled :=
  	(ckAlterarClienteVenda.Checked)
    or (ckAlterarVendedorVenda.Checked)
    or (ckAlterarFormaPagamentoVenda.Checked)
    or (ckAlterarParticipanteVenda.Checked)
    or (ckAlterarClienteVendaFpCreditos.Checked)
    or (ckAlterarVendedorVendaFpCreditos.Checked);

  if (Self.Enabled) and (Self.Visible) and (DBEdit88.CanFocus) then
    DBEdit88.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit90.CanFocus) then
    DBEdit90.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit119.CanFocus) then
    DBEdit119.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit127.CanFocus) then
    DBEdit127.SetFocus;
end;

procedure TFrmCadPedVenda.ckAlterarMecTecProdClick(Sender: TObject);
begin
  if not ckAlterarMecTecProd.Enabled then
    Exit;

  if (ckAlterarMecTecProd.Checked) then
  begin
    if not vDadosIni.PesqPros(
    	vDadosIni.IfThen(CadPedVenda.getTipoVenda = 'OS', 'VND290', 'VND294'),
      'ALTERAR',
      vDadosIni.IfThen(vDadosIni.vEmp.vUsarAparelho = 'S', 'TECNICO', 'MECANICO'),
      'PEDVENDA',
    	CadPedVenda.dataSet.FieldByName('TIPO').AsString + ' ' + CadPedVenda.dataSet.FieldByName('NPED').AsString,
      CadPedVenda.buscas, true) then
    begin
      ckAlterarMecTecProd.Checked := false;
      exit;
    end;
  end;

  Label61.Enabled            := ckAlterarMecTecProd.Checked;
  EditHw5.Enabled            := ckAlterarMecTecProd.Checked;
  DBLookupComboBox45.Enabled := ckAlterarMecTecProd.Checked;

  BitBtnProdOK.Enabled       :=
  	(ckAlterarMecTecProd.Checked)
    or (ckAlterarVendedorProd.Checked);
  BitBtnProdCancelar.Enabled :=
  	(ckAlterarMecTecProd.Checked)
    or (ckAlterarVendedorProd.Checked);
  DBGrid3.Enabled           :=
  	(ckAlterarMecTecProd.Checked)
    or (ckAlterarVendedorProd.Checked);
  btSelectProdAll.Enabled    :=
  	(ckAlterarMecTecProd.Checked)
    or (ckAlterarVendedorProd.Checked);
  btUnSelectProdAll.Enabled  :=
  	(ckAlterarMecTecProd.Checked)
    or (ckAlterarVendedorProd.Checked);

  DBGrid3.Refresh;

  if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
    EditHw5.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditHw6.CanFocus) then
    EditHw6.SetFocus;
end;

procedure TFrmCadPedVenda.ckAlterarMecTecServClick(Sender: TObject);
begin
  if not ckAlterarMecTecServ.Enabled then
  	exit;

  if (ckAlterarMecTecServ.Checked) then
  begin
    if not vDadosIni.PesqPros(
    	vDadosIni.IfThen(CadPedVenda.getTipoVenda = 'OS', 'VND288', 'VND292'),
      'ALTERAR',
      vDadosIni.IfThen(vDadosIni.vEmp.vUsarAparelho = 'S', 'TECNICO', 'MECANICO'),
      'PEDVENDA',
    	CadPedVenda.dataSet.FieldByName('TIPO').AsString + ' ' + CadPedVenda.dataSet.FieldByName('NPED').AsString,
      CadPedVenda.buscas, true) then
    begin
      ckAlterarMecTecServ.Checked := false;
      exit;
    end;
  end;

	Label42.Enabled            := ckAlterarMecTecServ.Checked;
  EditHw2.Enabled            := ckAlterarMecTecServ.Checked;
  DBLookupComboBox43.Enabled := ckAlterarMecTecServ.Checked;

  BitBtnServOK.Enabled       :=
  	(ckAlterarMecTecServ.Checked)
    or (ckAlterarVendedorServ.Checked);
  BitBtnServCancelar.Enabled :=
  	(ckAlterarMecTecServ.Checked)
    or (ckAlterarVendedorServ.Checked);
  DBGrid5.Enabled           :=
  	(ckAlterarMecTecServ.Checked)
    or (ckAlterarVendedorServ.Checked);
  btSelectServAll.Enabled    :=
  	(ckAlterarMecTecServ.Checked)
    or (ckAlterarVendedorServ.Checked);
  btUnSelectServAll.Enabled  :=
  	(ckAlterarMecTecServ.Checked)
    or (ckAlterarVendedorServ.Checked);

  DBGrid5.Refresh;

  if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
    EditHw2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditHw4.CanFocus) then
    EditHw4.SetFocus;
end;

procedure TFrmCadPedVenda.ckAlterarParticipanteVendaClick(Sender: TObject);
begin
  if not ckAlterarParticipanteVenda.Enabled then
  	exit;

  if (ckAlterarParticipanteVenda.Checked) then
  begin
    if not vDadosIni.PesqPros(
    	'VND287',
      'ALTERAR', 'PARTICIPANTE', 'PEDVENDA',
    	CadPedVenda.dataSet.FieldByName('TIPO').AsString + ' ' + CadPedVenda.dataSet.FieldByName('NPED').AsString,
      CadPedVenda.buscas, true) then
    begin
      ckAlterarParticipanteVenda.Checked := false;
      exit;
    end;
  end;

  Label213.Enabled := (ckAlterarParticipanteVenda.Checked);
  DBEdit127.Enabled := (ckAlterarParticipanteVenda.Checked);
  DBLookupComboBox38.Enabled := (ckAlterarParticipanteVenda.Checked);

  BitBtnCabOK.Enabled :=
  	(ckAlterarClienteVenda.Checked)
    or (ckAlterarVendedorVenda.Checked)
    or (ckAlterarFormaPagamentoVenda.Checked)
    or (ckAlterarParticipanteVenda.Checked)
    or (ckAlterarClienteVendaFpCreditos.Checked)
    or (ckAlterarVendedorVendaFpCreditos.Checked);
  BitBtnCabCancelar.Enabled :=
  	(ckAlterarClienteVenda.Checked)
    or (ckAlterarVendedorVenda.Checked)
    or (ckAlterarFormaPagamentoVenda.Checked)
    or (ckAlterarParticipanteVenda.Checked)
    or (ckAlterarClienteVendaFpCreditos.Checked)
    or (ckAlterarVendedorVendaFpCreditos.Checked);

  if (Self.Enabled) and (Self.Visible) and (DBEdit88.CanFocus) then
    DBEdit88.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit90.CanFocus) then
    DBEdit90.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit119.CanFocus) then
    DBEdit119.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit127.CanFocus) then
    DBEdit127.SetFocus;
end;

procedure TFrmCadPedVenda.ckAlterarVendedorProdClick(Sender: TObject);
begin
  if not ckAlterarVendedorProd.Enabled then
    Exit;

  if (ckAlterarVendedorProd.Checked) then
  begin
    if not vDadosIni.PesqPros(
    	vDadosIni.IfThen(CadPedVenda.getTipoVenda = 'OS', 'VND291', 'VND295'),
      'ALTERAR',
      'VENDEDOR',
      'PEDVENDA',
    	CadPedVenda.dataSet.FieldByName('TIPO').AsString + ' ' + CadPedVenda.dataSet.FieldByName('NPED').AsString,
      CadPedVenda.buscas, true) then
    begin
      ckAlterarVendedorProd.Checked := false;
      exit;
    end;
  end;

  Label82.Enabled            := ckAlterarVendedorProd.Checked;
  EditHw6.Enabled            := ckAlterarVendedorProd.Checked;
  DBLookupComboBox46.Enabled := ckAlterarVendedorProd.Checked;

  BitBtnProdOK.Enabled       :=
  	(ckAlterarMecTecProd.Checked)
    or (ckAlterarVendedorProd.Checked);
  BitBtnProdCancelar.Enabled :=
  	(ckAlterarMecTecProd.Checked)
    or (ckAlterarVendedorProd.Checked);
  DBGrid3.Enabled           :=
  	(ckAlterarMecTecProd.Checked)
    or (ckAlterarVendedorProd.Checked);
  btSelectProdAll.Enabled    :=
  	(ckAlterarMecTecProd.Checked)
    or (ckAlterarVendedorProd.Checked);
  btUnSelectProdAll.Enabled  :=
  	(ckAlterarMecTecProd.Checked)
    or (ckAlterarVendedorProd.Checked);

  DBGrid3.Refresh;

  if (Self.Enabled) and (Self.Visible) and (EditHw5.CanFocus) then
    EditHw5.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditHw6.CanFocus) then
    EditHw6.SetFocus;
end;

procedure TFrmCadPedVenda.ckAlterarVendedorServClick(Sender: TObject);
begin
  if not ckAlterarVendedorServ.Enabled then
  	exit;

  if (ckAlterarVendedorServ.Checked) then
  begin
    if not vDadosIni.PesqPros(
    	vDadosIni.IfThen(CadPedVenda.getTipoVenda = 'OS', 'VND289', 'VND293'),
      'ALTERAR',
      UpperCase(trim(vDadosIni.vPedVnd.NomeSegCampoServ)),
      'PEDVENDA',
    	CadPedVenda.dataSet.FieldByName('TIPO').AsString + ' ' + CadPedVenda.dataSet.FieldByName('NPED').AsString,
      CadPedVenda.buscas, true) then
    begin
      ckAlterarVendedorServ.Checked := false;
      exit;
    end;
  end;

  Label43.Enabled            := ckAlterarVendedorServ.Checked;
  EditHw4.Enabled            := ckAlterarVendedorServ.Checked;
  DBLookupComboBox44.Enabled := ckAlterarVendedorServ.Checked;

  BitBtnServOK.Enabled       :=
  	(ckAlterarMecTecServ.Checked)
    or (ckAlterarVendedorServ.Checked);
  BitBtnServCancelar.Enabled :=
  	(ckAlterarMecTecServ.Checked)
    or (ckAlterarVendedorServ.Checked);
  DBGrid5.Enabled           :=
  	(ckAlterarMecTecServ.Checked)
    or (ckAlterarVendedorServ.Checked);
  btSelectServAll.Enabled    :=
  	(ckAlterarMecTecServ.Checked)
    or (ckAlterarVendedorServ.Checked);
  btUnSelectServAll.Enabled  :=
  	(ckAlterarMecTecServ.Checked)
    or (ckAlterarVendedorServ.Checked);

  DBGrid5.Refresh;

  if (Self.Enabled) and (Self.Visible) and (EditHw2.CanFocus) then
    EditHw2.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (EditHw4.CanFocus) then
    EditHw4.SetFocus
end;

procedure TFrmCadPedVenda.ckAlterarVendedorVendaClick(Sender: TObject);
begin
	if ((not ckAlterarVendedorVenda.Checked) and (ckAlterarVendedorVendaFpCreditos.Checked)) then
  	ckAlterarVendedorVendaFpCreditos.Checked := false;

  if not ckAlterarVendedorVenda.Enabled then
  	exit;

  if (ckAlterarVendedorVenda.Checked) then
	begin
	  if not vDadosIni.PesqPros(
    	vDadosIni.IfThen(CadPedVenda.getTipoVenda = 'REQ', 'VND256', vDadosIni.IfThen(CadPedVenda.getTipoVenda = 'ORC', 'VND257', 'VND201')),
    	'ALTERAR', 'VENDEDOR', 'PEDVENDA',
    	trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) + ' ' + CadPedVenda.dataSet.FieldByName('NPED').AsString,
      CadPedVenda.buscas, true) then
    begin
      ckAlterarVendedorVenda.Checked := false;
      exit;
    end;
  end;

  Label130.Enabled := (ckAlterarVendedorVenda.Checked) or (ckAlterarVendedorVendaFpCreditos.Checked);
  DBEdit90.Enabled := (ckAlterarVendedorVenda.Checked) or (ckAlterarVendedorVendaFpCreditos.Checked);
  DBLookupComboBox18.Enabled := (ckAlterarVendedorVenda.Checked) or (ckAlterarVendedorVendaFpCreditos.Checked);

  BitBtnCabOK.Enabled :=
  	(ckAlterarClienteVenda.Checked)
    or (ckAlterarVendedorVenda.Checked)
    or (ckAlterarFormaPagamentoVenda.Checked)
    or (ckAlterarParticipanteVenda.Checked)
    or (ckAlterarClienteVendaFpCreditos.Checked)
    or (ckAlterarVendedorVendaFpCreditos.Checked);
  BitBtnCabCancelar.Enabled :=
  	(ckAlterarClienteVenda.Checked)
    or (ckAlterarVendedorVenda.Checked)
    or (ckAlterarFormaPagamentoVenda.Checked)
    or (ckAlterarParticipanteVenda.Checked)
    or (ckAlterarClienteVendaFpCreditos.Checked)
    or (ckAlterarVendedorVendaFpCreditos.Checked);

  if (Self.Enabled) and (Self.Visible) and (DBEdit88.CanFocus) then
    DBEdit88.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit90.CanFocus) then
    DBEdit90.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit119.CanFocus) then
    DBEdit119.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit127.CanFocus) then
    DBEdit127.SetFocus;
end;

procedure TFrmCadPedVenda.ckAlterarVendedorVendaFpCreditosClick(
  Sender: TObject);
begin
	if ckAlterarVendedorVendaFpCreditos.Checked then
  	ckAlterarVendedorVenda.Checked := true;

  if not ckAlterarVendedorVendaFpCreditos.Enabled then
  	exit;

  if ckAlterarVendedorVendaFpCreditos.Checked then
  	if not vDadosIni.PesqPros('VND160', 'ALTERAR', '', 'PEDVENDA',
    	CadPedVenda.dataSet.FieldByName('TIPO').AsString + ' ' + CadPedVenda.dataSet.FieldByName('NPED').AsString,
      CadPedVenda.buscas, true) then
    begin
    	ckAlterarVendedorVendaFpCreditos.Checked := false;
    	exit;
    end;

  Label130.Enabled := (ckAlterarVendedorVenda.Checked) or (ckAlterarVendedorVendaFpCreditos.Checked);
  DBEdit90.Enabled := (ckAlterarVendedorVenda.Checked) or (ckAlterarVendedorVendaFpCreditos.Checked);
  DBLookupComboBox18.Enabled := (ckAlterarVendedorVenda.Checked) or (ckAlterarVendedorVendaFpCreditos.Checked);

	BitBtnCabOK.Enabled :=
  	(ckAlterarClienteVenda.Checked)
    or (ckAlterarVendedorVenda.Checked)
    or (ckAlterarFormaPagamentoVenda.Checked)
    or (ckAlterarParticipanteVenda.Checked)
    or (ckAlterarClienteVendaFpCreditos.Checked)
    or (ckAlterarVendedorVendaFpCreditos.Checked);
  BitBtnCabCancelar.Enabled :=
  	(ckAlterarClienteVenda.Checked)
    or (ckAlterarVendedorVenda.Checked)
    or (ckAlterarFormaPagamentoVenda.Checked)
    or (ckAlterarParticipanteVenda.Checked)
    or (ckAlterarClienteVendaFpCreditos.Checked)
    or (ckAlterarVendedorVendaFpCreditos.Checked);

  if (Self.Enabled) and (Self.Visible) and (DBEdit88.CanFocus) then
    DBEdit88.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit90.CanFocus) then
    DBEdit90.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit119.CanFocus) then
    DBEdit119.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit127.CanFocus) then
    DBEdit127.SetFocus;
end;

procedure TFrmCadPedVenda.ckEmitirNFCeConfClick(Sender: TObject);
begin
  if (ckEmitirNFCeConf.Checked) then
    ckEmitirNFeConf.Checked := False
end;

procedure TFrmCadPedVenda.ckEmitirNFCeDocClick(Sender: TObject);
begin
  if (ckEmitirNFCeDoc.Checked) then
  	ckEmitirNFeDoc.Checked := False;
end;

procedure TFrmCadPedVenda.ckEmitirNFeConfClick(Sender: TObject);
begin
  if (ckEmitirNFeConf.Checked) then
    ckEmitirNFCeConf.Checked := False
end;

procedure TFrmCadPedVenda.ckEmitirNFeDocClick(Sender: TObject);
begin
  if (ckEmitirNFeDoc.Checked) then
  	ckEmitirNFCeDoc.Checked := False;
end;

procedure TFrmCadPedVenda.ckListaTodasPoliticasClick(Sender: TObject);
begin
  inherited;
	try
  	Screen.Cursor := crHourGlass;
    CadPedVenda._abreRegraCondicoesPolitica(ckListaTodasPoliticas.Checked);
    if CadPedVenda.vRVnd.dataSet.IsEmpty then
    begin
    	Label255.Caption := '';
    	CadPedVenda._validaDescontoRegraVND(ckListaTodasPoliticas.Checked);
    end;
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.ck_exibir_devolucaoClick(Sender: TObject);
begin
  inherited;
  if Assigned(CadPedVenda) then
    CadPedVenda.conf.exibir_devolucao_runtime := ck_exibir_devolucao.Checked;
end;

procedure TFrmCadPedVenda.ComboBox11Exit(Sender: TObject);
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
          MaskEdit8.Visible := false;
          MaskEdit9.Visible := true;
          MaskEdit10.Visible := true;
          if MaskEdit9.Text = '  /  /    ' then
            MaskEdit9.Text := DateToStr(Date);
          if MaskEdit10.Text = '  /  /    ' then
            MaskEdit10.Text := DateToStr(Date);

         if (Self.Enabled) and (Self.Visible) and (MaskEdit10.CanFocus) then
	         MaskEdit10.SetFocus;
        end
        else
        begin
          MaskEdit8.Visible := true;
          MaskEdit9.Visible := false;
          MaskEdit10.Visible := false;

         if (Self.Enabled) and (Self.Visible) and (MaskEdit8.CanFocus) then
	         MaskEdit8.SetFocus;
        end;
      end;
    end;
end;

procedure TFrmCadPedVenda.ComboBoxDevolucaoUnExit(Sender: TObject);
begin
  inherited;
  LabelInfConversaoSaida.Caption := '';
  if ComboBoxDevolucaoUn.ItemIndex > 0 then
  begin
  	CadPedVenda.buscas.Close;
    CadPedVenda.buscas.SQL.Text := ' select first 1 pp.operacao_conv, pp.fator_conv from pedvenda_prod pp ' +
    	' where pp.nped = ' + IntToStr(CadPedVenda.dataSet.FieldByName('NPED').AsInteger) +
      ' and pp.tipo = ' + QuotedStr(CadPedVenda.dataSet.FieldByName('TIPO').AsString) +
      ' and pp.grupo_prod = ' + LabelInfGrupoConversaoSaida.Caption +
      ' and pp.cod_prod = ' + QuotedStr(LabelInfCodProdConversaoSaida.Caption) +
      ' and pp.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and pp.unidade_conv = ' + QuotedStr(trim(ComboBoxDevolucaoUn.Items[ComboBoxDevolucaoUn.ItemIndex])) +
      ' and ((pp.status = '''') or (pp.status is null)) ';
    CadPedVenda.buscas.Open;

    if Copy(trim(CadPedVenda.buscas.FieldByName('OPERACAO_CONV').AsString), 1, 1) = 'M' then
    begin
      LabelInfConversaoSaida.Caption :=
        '1 ' + trim(ComboBoxDevolucaoUn.Items[0]) +
        ' -> ' + FormatFloat('0.000', CadPedVenda.buscas.FieldByName('FATOR_CONV').AsFloat) +
        ' ' + trim(ComboBoxDevolucaoUn.Items[ComboBoxDevolucaoUn.ItemIndex]) +
        ' | 1 ' + trim(ComboBoxDevolucaoUn.Items[ComboBoxDevolucaoUn.ItemIndex]) +
        ' -> ' + FormatFloat('0.000', 1 / CadPedVenda.buscas.FieldByName('FATOR_CONV').AsFloat) +
        ' ' + trim(ComboBoxDevolucaoUn.Items[0]);
    end
    else if Copy(trim(CadPedVenda.buscas.FieldByName('OPERACAO_CONV').AsString), 1, 1) = 'D' then
    begin
      LabelInfConversaoSaida.Caption :=
        '1 ' + trim(ComboBoxDevolucaoUn.Items[0]) +
        ' -> ' + FormatFloat('0.000', 1 / CadPedVenda.buscas.FieldByName('FATOR_CONV').AsFloat) +
        ' ' + trim(ComboBoxDevolucaoUn.Items[ComboBoxDevolucaoUn.ItemIndex]) +
        ' | 1 ' + trim(ComboBoxDevolucaoUn.Items[ComboBoxDevolucaoUn.ItemIndex]) +
        ' -> ' + FormatFloat('0.000', CadPedVenda.buscas.FieldByName('FATOR_CONV').AsFloat) +
        ' ' + trim(ComboBoxDevolucaoUn.Items[0]);
    end;
  end;
end;

procedure TFrmCadPedVenda.ComboBoxOpMesclarExit(Sender: TObject);
begin
  inherited;
	if ComboBoxOpMesclar.ItemIndex = 1 then
  begin
    Label136.Caption := 'Informe o número da Requisão:';
    Label136.Visible := true;
    MaskEdit11.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (MaskEdit11.CanFocus) then
	    MaskEdit11.SetFocus;
  end
  else if ComboBoxOpMesclar.ItemIndex = 3 then
  begin
    Label136.Caption := 'Informe o número da Ordem de Serviço:';
    Label136.Visible := true;
    MaskEdit11.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (MaskEdit11.CanFocus) then
	    MaskEdit11.SetFocus;
  end
  else
  begin
    Label136.Visible := false;
    MaskEdit11.Visible := false;
    MaskEdit11.Text := '0';
  end;
end;

procedure TFrmCadPedVenda.ComboBoxOpMesclarSelect(Sender: TObject);
begin
  inherited;
  Exit;
	ComboBoxOpMesclarExit(Sender);
end;

procedure TFrmCadPedVenda.ConfiguraCampoConsulta;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + Self.ClassName, True);

      vTemp := Registro.ReadString('Campo' + CadPedVenda.getTipoVenda);
      if (vTemp <> '') then
      begin
        ComboBox1.Text := vTemp;
        ComboBox1.ItemIndex := ComboBox1.Items.IndexOf(vTemp);
      end;
      vTemp := Registro.ReadString('Condicao' + CadPedVenda.getTipoVenda);
      if vTemp <> '' then
      begin
        ComboBox3.Text := vTemp;
        ComboBox3.ItemIndex := ComboBox3.Items.IndexOf(vTemp)
      end;
      vTemp := Registro.ReadString('DataIni' + CadPedVenda.getTipoVenda);
      if vTemp <> '' then
        MaskEdit1.Text := vTemp;
      vTemp := Registro.ReadString('DataFim' + CadPedVenda.getTipoVenda);
      if vTemp <> '' then
        MaskEdit2.Text := vTemp;
      vTemp := Registro.ReadString('PalavraChave' + CadPedVenda.getTipoVenda);
      if vTemp <> '' then
        MaskEdit3.Text := vTemp;
      try
        MaskEdit1.Visible := Registro.KeyExists('MaskEdit1' + CadPedVenda.getTipoVenda) and Registro.ReadBool('MaskEdit1' + CadPedVenda.getTipoVenda);
        MaskEdit2.Visible := Registro.KeyExists('MaskEdit2' + CadPedVenda.getTipoVenda) and Registro.ReadBool('MaskEdit2' + CadPedVenda.getTipoVenda);
        MaskEdit3.Visible := not MaskEdit1.Visible or (Registro.KeyExists('MaskEdit3' + CadPedVenda.getTipoVenda) and Registro.ReadBool('MaskEdit3' + CadPedVenda.getTipoVenda));
      except
        MaskEdit1.Visible := false;
        MaskEdit2.Visible := false;
        MaskEdit3.Visible := true;
        MaskEdit3.EditMask:='';
        ComboBox1.Text := 'Todos';
        ComboBox1.ItemIndex := ComboBox1.Items.IndexOf('Todos')
      end;
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TFrmCadPedVenda.configuraEntrada;
var
  I: Integer;
begin
	if not Self.Enabled then
    Exit;

  Top := 0;
  CheckBox1.Visible := True;//False;
  CheckCadSeq.Enabled := false;
  Panel23.Top := Panel22.Top;
  TabSheet20.TabVisible := false;
  TabSheet21.TabVisible := false;
  tsKit.TabVisible := False;
  TabSheet2.Show;
  if (Self.Enabled) and (Self.Visible) and (ComboBox1.Visible) and (ComboBox1.CanFocus) then
	  ComboBox1.SetFocus;
  SpeedButton8.Visible := true;
  SpeedButton7.Visible := true;
  SpeedButton6.Visible := true;
  SpeedButton10.Visible := true;
  SpeedButton16.Visible := true;
  SpeedButton47.Visible := False;
  SpeedButton48.Visible := False;
  SpeedButton62.Visible := vDadosIni.vEmp.vUsarPoliticasDesc;
  DBEdit22.Enabled := (vDadosIni.vUsarPlano <> 'S') and (vDadosIni.vUsarPlano <> '2');
  DBEdit23.Enabled := (vDadosIni.vUsarPlano <> 'S') and (vDadosIni.vUsarPlano <> '2');
//  SpeedButton34.Enabled := (vDadosIni.vUsarPlano <> 'S') and (vDadosIni.vUsarPlano <> '2');
  SpeedButton34.Hint := 'Dados de Entrega';//(vDadosIni.vUsarPlano <> 'S') and (vDadosIni.vUsarPlano <> '2');
  CadPedVenda.TransProdutoOS(false);
  CheckBox8.Checked := _LerConfiguracoesRegistroBoolean('CheckBox8');
  pgOS.ActivePage := tsOS;
  SpeedButton41.Visible := False;
  SpeedButton45.Visible := vDadosIni.vEmp.vUsarPoliticasDesc;
  SpeedButton49.Visible := vDadosIni.vEmp.vUsarPoliticasDesc;
  SpeedButton50.Visible := vDadosIni.vEmp.vUsarPoliticasDesc;
  SelecionarDAVparaMesclagem1.Caption := 'Selecionar DAV/PreVenda para Mesclagem';
  bt_notas_vinculadas.Visible := CadPedVenda.fstr('tipo') <> 'ORC';
  if TelaCadastro = 2 then
  begin
    SpeedButton57.Visible := false;
    SpeedButton58.Visible := false;
    Self.Caption := 'Transferências e Devoluções de Produtos';
    PageControl1.ActivePage := TabSheet20;
    TabSheet20.Show;
    CadPedVenda.TransProdutoOS(true);
    CadPedVenda.dataSet.FieldByName('nped').DisplayLabel          := 'Num OS';
    CadPedVenda.dataSet.FieldByName('data_ped').DisplayLabel      := 'Data OS';
    CadPedVenda.dataSet.FieldByName('obs_ped').DisplayLabel       := 'Obs 1 da OS';
    CadPedVenda.dataSet.FieldByName('obs_os').DisplayLabel        := 'Obs 2 da OS';
    CadPedVenda.dataSet.FieldByName('obs_cxl_rq').DisplayLabel    := 'Obs do Vendedor';
    CadPedVenda.dataSet.FieldByName('obs_minuta').DisplayLabel    := 'Obs Minuta';
    CadPedVenda.dataSet.FieldByName('obs_livro_reg').DisplayLabel := 'Obs Livro de Registro';
    CadPedVenda.dataSet.FieldByName('obs_red_os').DisplayLabel    := 'Obs Red OS';
    CadPedVenda.dataSet.FieldByName('obs_tpvenda').DisplayLabel   := 'Obs Adicional';
    CadPedVenda.dataSet.FieldByName('status_ped').DisplayLabel    := 'Status OS';
    CadPedVenda.dataSet.FieldByName('tot_prod').DisplayLabel      := 'Total Produtos';
    CadPedVenda.dataSet.FieldByName('tot_serv').DisplayLabel      := 'Total Serviços';
    CadPedVenda.dataSet.FieldByName('tot_prod_terc').DisplayLabel := 'Total Produtos Terc';
    CadPedVenda.dataSet.FieldByName('tot_serv_terc').DisplayLabel := 'Total Serviços Terc';
    if vDadosIni.vEmp.vUsarAparelho = 'S' then
      Label178.Caption := 'Técnico:'
    else
      Label178.Caption := 'Mecânico:';
    //    CadPedVenda.abrePedVenda(0);
  end
  else if CadPedVenda.getTipoVenda = 'REQ' then
  begin
    SpeedButton57.Visible := vDadosIni.vPedVnd.comissaoPorVenda;
    SpeedButton58.Visible := true;
    Self.Caption := 'Requisições';
    CadPedVenda.dataSet.FieldByName('nped').DisplayLabel          := 'Num REQ';
    CadPedVenda.dataSet.FieldByName('data_ped').DisplayLabel      := 'Data Req';
    CadPedVenda.dataSet.FieldByName('obs_ped').DisplayLabel       := 'Obs 1 da Req';
    CadPedVenda.dataSet.FieldByName('obs_os').DisplayLabel        := 'Obs 2 da Req';
    CadPedVenda.dataSet.FieldByName('obs_cxl_rq').DisplayLabel    := 'Obs do Vendedor';
    CadPedVenda.dataSet.FieldByName('obs_minuta').DisplayLabel    := 'Obs Minuta';
    CadPedVenda.dataSet.FieldByName('obs_livro_reg').DisplayLabel := 'Obs Livro de Registro';
    CadPedVenda.dataSet.FieldByName('obs_red_os').DisplayLabel    := 'Obs Red Req';
    CadPedVenda.dataSet.FieldByName('obs_tpvenda').DisplayLabel   := 'Obs Adicional';
    CadPedVenda.dataSet.FieldByName('status_ped').DisplayLabel    := 'Status Req';
    CadPedVenda.dataSet.FieldByName('tot_prod').DisplayLabel      := 'Total Produtos';
    CadPedVenda.dataSet.FieldByName('tot_serv').DisplayLabel      := 'Total Serviços';
    CadPedVenda.dataSet.FieldByName('tot_prod_terc').DisplayLabel := 'Total Produtos Terc';
    CadPedVenda.dataSet.FieldByName('tot_serv_terc').DisplayLabel := 'Total Serviços Terc';

    CadPedVenda.dataSet.FieldByName('cod_carga').Tag := 0;
    if (vDadosIni.vEmp.vOC_UsarOrdemCarregamento <> 'D') and (vDadosIni.vEmp.vOC_TipoControleOrdemC <> 'REQ') then
      CadPedVenda.dataSet.FieldByName('cod_carga').Tag := 1;
    CheckBox4.Visible := true;
    CheckBox4.Enabled := true;
    CheckBox8.Visible := false;
    CheckBox8.Enabled := false;
    CheckBox4.Caption := 'Venda Rápida (F11)';
    CheckBox4.OnClick := CheckBox4Click;
    CheckBox4.Checked := _LerConfiguracoesRegistroBoolean(CheckBox4.Name);
    BitBtn1.Hint := 'Clique para pesquisar - [VND064]';
    BitBtn3.Hint := 'Novo cadastro - [VND001]';
    SpeedButton35.Hint := 'Devolver Itens da Venda ainda em Aberto - [VND129]';
    SpeedButton1.Hint := 'Editar Registro - [VND007]';
    SpeedButton22.Hint := 'Alterar Status Requisição - [VND124]';
//    if vDadosIni.vEmp.vUsarDAV <> 'S' then
//      SpeedButton2.Hint := 'Apagar Registro - [VND004]'
//    else
    SpeedButton2.Hint := 'Cancelar DAV - [VND104]';
    SpeedButton3.Hint := 'Imprimir - [VND054]';
    SpeedButton6.Hint := 'Confirmar Documento - [VND060]';
    SpeedButton21.Hint := 'Visualizar Status da Requisição - [VND123]';
    BitBtn14.Hint := 'Incluir - [VND022]';
    BitBtn85.Hint := 'Mecânicos';
    BitBtn26.Hint := 'Salvar';
    BitBtn27.Hint := 'Alterar';
    BitBtn28.Hint := 'Cancelar';
    BitBtn16.Hint := 'Incluir - [VND010]';
    BitBtn17.Hint := 'Salvar - [VND013]';
    BitBtn18.Hint := 'Alterar - [VND011]';
    BitBtn19.Hint := 'Cancelar - [VND012]';
    BitBtn104.Hint := 'Incluir Kit';
    BitBtn105.Hint := 'Incluir Kit';
    BitBtn8.Hint := 'Incluir';
    BitBtn9.Hint := 'Salvar';
    BitBtn10.Hint := 'Alterar';
    BitBtn11.Hint := 'Cancelar';
    BitBtn33.Hint := 'Incluir';
    BitBtn34.Hint := 'Salvar';
    BitBtn35.Hint := 'Alterar';
    BitBtn36.Hint := 'Cancelar';
    BitBtn29.Hint := 'Incluir';
    BitBtn30.Hint := 'Salvar';
    BitBtn31.Hint := 'Alterar';
    BitBtn32.Hint := 'Cancelar';
//    SpeedButton1.Hint:='Editar Registro [VND007]';
//    SpeedButton1.Hint:='Editar Registro [VND007]';
//    SpeedButton1.Hint:='Editar Registro [VND007]';
//    SpeedButton1.Hint:='Editar Registro [VND007]';
    SpeedButton26.Visible := false;
    SpeedButton17.Visible := false;
    SpeedButton21.Visible := true;
    SpeedButton35.Visible := true;
    label26.Visible := vDadosIni.vMNF = 'S';
    DBEdit18.Visible := vDadosIni.vMNF = 'S';
    SpeedButton24.Hint := 'Liberar Requisição da trava para abertura de novas Requisições - [VND091]';
    DBLookupComboBox11.Visible := false;
    DBEdit87.Visible := false;
    Label125.Visible := false;
    SpeedButton18.Visible := true;
    SpeedButton18.Top := 4;
    SpeedButton18.Left := 691;
    SpeedButton18.Hint := 'Alterar vendedor ou cliente da requisição - [VND098]';
    CadPedVenda.verificatipovenda(1, DBComboBox1, 'REQ', '');
    CadPedVenda.verificatipovenda(1, DBComboBox4, 'REQ', '');
    SpeedButton38.Visible := false;
    if vDadosIni.vEmp.vCaixaIntegrado = 'S' then
      SpeedButton41.Visible := True;
    pnAtalhosPesquiarVenda.Visible := vDadosIni.PesqPros('VND194', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, True, False, True);
    Panel32.Visible := not pnAtalhosPesquiarVenda.Visible;//Nao faz sentido o atalho de cancelamento da tela sendo que o salvamento é automatico
    pnAtalhosNovoPedVenda.Visible := not Panel32.Visible;
    pnAtalhosNovoPedVenda.Top := Panel32.Top;
    pnAtalhosNovoPedVenda.Left := Panel32.Left;
    //Campos invisíveis na requisição
    {if ((CadPedVenda.dataSet.FieldByName('TIPO_ORC').Tag = 0) or (CadPedVenda.dataSet.FieldByName('TIPO_ORC').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaTIPO_ORC').Name) = UpperCase('cdsPedVendaTIPO_ORC') then
        TCheckBox(FindComponent('cdsPedVendaTIPO_ORC')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('NOME_CLI_ORC').Tag = 0) or (CadPedVenda.dataSet.FieldByName('NOME_CLI_ORC').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaNOME_CLI_ORC').Name) = UpperCase('cdsPedVendaNOME_CLI_ORC') then
        TCheckBox(FindComponent('cdsPedVendaNOME_CLI_ORC')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('DESC_P_SERV').Tag = 0) or (CadPedVenda.dataSet.FieldByName('DESC_P_SERV').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaDESC_P_SERV').Name) = UpperCase('cdsPedVendaDESC_P_SERV') then
        TCheckBox(FindComponent('cdsPedVendaDESC_P_SERV')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('ACRESC_P_SERV').Tag = 0) or (CadPedVenda.dataSet.FieldByName('ACRESC_P_SERV').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaACRESC_P_SERV').Name) = UpperCase('cdsPedVendaACRESC_P_SERV') then
        TCheckBox(FindComponent('cdsPedVendaACRESC_P_SERV')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('PLACA').Tag = 0) or (CadPedVenda.dataSet.FieldByName('PLACA').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaPLACA').Name) = UpperCase('cdsPedVendaPLACA') then
        TCheckBox(FindComponent('cdsPedVendaPLACA')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('CHASSI').Tag = 0) or (CadPedVenda.dataSet.FieldByName('CHASSI').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaCHASSI').Name) = UpperCase('cdsPedVendaCHASSI') then
        TCheckBox(FindComponent('cdsPedVendaCHASSI')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('COD_EQUIP').Tag = 0) or (CadPedVenda.dataSet.FieldByName('COD_EQUIP').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaCOD_EQUIP').Name) = UpperCase('cdsPedVendaCOD_EQUIP') then
        TCheckBox(FindComponent('cdsPedVendaCOD_EQUIP')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('COD_VEICULO').Tag = 0) or (CadPedVenda.dataSet.FieldByName('COD_VEICULO').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaCOD_VEICULO').Name) = UpperCase('cdsPedVendaCOD_VEICULO') then
        TCheckBox(FindComponent('cdsPedVendaCOD_VEICULO')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('APARELHO_PED').Tag = 0) or (CadPedVenda.dataSet.FieldByName('APARELHO_PED').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaAPARELHO_PED').Name) = UpperCase('cdsPedVendaAPARELHO_PED') then
        TCheckBox(FindComponent('cdsPedVendaAPARELHO_PED')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('STAT_REQ').Tag = 0) or (CadPedVenda.dataSet.FieldByName('STAT_REQ').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaSTAT_REQ').Name) = UpperCase('cdsPedVendaSTAT_REQ') then
        TCheckBox(FindComponent('cdsPedVendaSTAT_REQ')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('KM_V').Tag = 0) or (CadPedVenda.dataSet.FieldByName('KM_V').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaKM_V').Name) = UpperCase('cdsPedVendaKM_V') then
        TCheckBox(FindComponent('cdsPedVendaKM_V')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('DT_PROMETIDA').Tag = 0) or (CadPedVenda.dataSet.FieldByName('DT_PROMETIDA').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaDT_PROMETIDA').Name) = UpperCase('cdsPedVendaDT_PROMETIDA') then
        TCheckBox(FindComponent('cdsPedVendaDT_PROMETIDA')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('GUARDA_VOL').Tag = 0) or (CadPedVenda.dataSet.FieldByName('GUARDA_VOL').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaGUARDA_VOL').Name) = UpperCase('cdsPedVendaGUARDA_VOL') then
        TCheckBox(FindComponent('cdsPedVendaGUARDA_VOL')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('COMBUST_VEIC').Tag = 0) or (CadPedVenda.dataSet.FieldByName('COMBUST_VEIC').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaCOMBUST_VEIC').Name) = UpperCase('cdsPedVendaCOMBUST_VEIC') then
        TCheckBox(FindComponent('cdsPedVendaCOMBUST_VEIC')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('DEFEITO').Tag = 0) or (CadPedVenda.dataSet.FieldByName('DEFEITO').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaDEFEITO').Name) = UpperCase('cdsPedVendaDEFEITO') then
        TCheckBox(FindComponent('cdsPedVendaDEFEITO')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('ESTADO_VEIC').Tag = 0) or (CadPedVenda.dataSet.FieldByName('ESTADO_VEIC').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaESTADO_VEIC').Name) = UpperCase('cdsPedVendaESTADO_VEIC') then
        TCheckBox(FindComponent('cdsPedVendaESTADO_VEIC')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('ACESSORIOS').Tag = 0) or (CadPedVenda.dataSet.FieldByName('ACESSORIOS').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaACESSORIOS').Name) = UpperCase('cdsPedVendaACESSORIOS') then
        TCheckBox(FindComponent('cdsPedVendaACESSORIOS')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('H_ENT').Tag = 0) or (CadPedVenda.dataSet.FieldByName('H_ENT').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaH_ENT').Name) = UpperCase('cdsPedVendaH_ENT') then
        TCheckBox(FindComponent('cdsPedVendaH_ENT')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('H_PROMETIDA').Tag = 0) or (CadPedVenda.dataSet.FieldByName('H_PROMETIDA').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaH_PROMETIDA').Name) = UpperCase('cdsPedVendaH_PROMETIDA') then
        TCheckBox(FindComponent('cdsPedVendaH_PROMETIDA')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('OBS_LIVRO_REG').Tag = 0) or (CadPedVenda.dataSet.FieldByName('OBS_LIVRO_REG').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaOBS_LIVRO_REG').Name) = UpperCase('cdsPedVendaOBS_LIVRO_REG') then
        TCheckBox(FindComponent('cdsPedVendaOBS_LIVRO_REG')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('OBS_RED_OS').Tag = 0) or (CadPedVenda.dataSet.FieldByName('OBS_RED_OS').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaOBS_RED_OS').Name) = UpperCase('cdsPedVendaOBS_RED_OS') then
        TCheckBox(FindComponent('cdsPedVendaOBS_RED_OS')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('NUM_NFEEXT').Tag = 0) or (CadPedVenda.dataSet.FieldByName('NUM_NFEEXT').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaNUM_NFEEXT').Name) = UpperCase('cdsPedVendaNUM_NFEEXT') then
        TCheckBox(FindComponent('cdsPedVendaNUM_NFEEXT')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('DATA_NFEXT').Tag = 0) or (CadPedVenda.dataSet.FieldByName('DATA_NFEXT').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaDATA_NFEXT').Name) = UpperCase('cdsPedVendaDATA_NFEXT') then
        TCheckBox(FindComponent('cdsPedVendaDATA_NFEXT')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('VALOR_NFEXT').Tag = 0) or (CadPedVenda.dataSet.FieldByName('VALOR_NFEXT').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaVALOR_NFEXT').Name) = UpperCase('cdsPedVendaVALOR_NFEXT') then
        TCheckBox(FindComponent('cdsPedVendaVALOR_NFEXT')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('TOT_SERV').Tag = 0) or (CadPedVenda.dataSet.FieldByName('TOT_SERV').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaTOT_SERV').Name) = UpperCase('cdsPedVendaTOT_SERV') then
        TCheckBox(FindComponent('cdsPedVendaTOT_SERV')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('TIPO_OS').Tag = 0) or (CadPedVenda.dataSet.FieldByName('TIPO_OS').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaTIPO_OS').Name) = UpperCase('cdsPedVendaTIPO_OS') then
        TCheckBox(FindComponent('cdsPedVendaTIPO_OS')).Checked := false;
    if ((CadPedVenda.dataSet.FieldByName('OBS_OS').Tag = 0) or (CadPedVenda.dataSet.FieldByName('OBS_OS').Tag = 3)) then
      if UpperCase(FindComponent('cdsPedVendaOBS_OS').Name) = UpperCase('cdsPedVendaOBS_OS') then
        TCheckBox(FindComponent('cdsPedVendaOBS_OS')).Checked := false;
    }
//    if ((CadPedVenda.dataSet.FieldByName('###').Tag=0) or (CadPedVenda.dataSet.FieldByName('###').Tag=3)) then
//      if UpperCase(FindComponent('cdsPedVenda###').Name)= UpperCase('cdsPedVenda###') then
//        TCheckBox(FindComponent('cdsPedVenda###')).Checked:=false;
//    COD_CARGA

//    ScrollBox2Exit(ScrollBox2);
  end
  else if (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC') then
  begin
    CadPedVenda.dataSet.FieldByName('cod_carga').Tag := 1;
    if (CadPedVenda.getTipoVenda = 'OS') then
    begin
      SpeedButton57.Visible := false;
      SpeedButton58.Visible := false;
      Self.Caption := 'Ordens de Serviço';
      CadPedVenda.dataSet.FieldByName('nped').DisplayLabel          := 'Num OS';
      CadPedVenda.dataSet.FieldByName('data_ped').DisplayLabel      := 'Data OS';
      CadPedVenda.dataSet.FieldByName('obs_ped').DisplayLabel       := 'Obs 1 da OS';
      CadPedVenda.dataSet.FieldByName('obs_os').DisplayLabel        := 'Obs 2 da OS';
      CadPedVenda.dataSet.FieldByName('obs_cxl_rq').DisplayLabel    := 'Obs do Vendedor';
    	CadPedVenda.dataSet.FieldByName('obs_minuta').DisplayLabel    := 'Obs Minuta';
    	CadPedVenda.dataSet.FieldByName('obs_livro_reg').DisplayLabel := 'Obs Livro de Registro';
    	CadPedVenda.dataSet.FieldByName('obs_red_os').DisplayLabel    := 'Obs Red OS';
      CadPedVenda.dataSet.FieldByName('obs_tpvenda').DisplayLabel   := 'Obs Adicional';
      CadPedVenda.dataSet.FieldByName('status_ped').DisplayLabel    := 'Status OS';
      CadPedVenda.dataSet.FieldByName('tot_prod').DisplayLabel      := 'Total Produtos';
      CadPedVenda.dataSet.FieldByName('tot_serv').DisplayLabel      := 'Total Serviços';
      CadPedVenda.dataSet.FieldByName('tot_prod_terc').DisplayLabel := 'Total Produtos Terc';
    	CadPedVenda.dataSet.FieldByName('tot_serv_terc').DisplayLabel := 'Total Serviços Terc';

      SpeedButton24.Hint := 'Liberar O.S. da trava para abertura de novas Ordens de Serviços - [VND091]';
      SpeedButton21.Hint := 'Visualizar Status da OS - [VND118]';
      SpeedButton6.Hint := 'Confirmar Documento - [VND061]';
      SpeedButton48.Visible := True;
      SpeedButton47.Visible := True;
      CadPedVenda.verificatipovenda(1, DBComboBox3, 'OS', '');
      CheckBox4.Visible := false;
      CheckBox4.Enabled := false;
      if vDadosIni.vEmp.vVincularVeicOBJ = 'E' then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
        if vDadosIni.PesqPros('VND127', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, true) then
        begin
          CheckBox8.Enabled := true;
          CheckBox8.Visible := true;
        end
        else
        begin
          CheckBox8.Checked := true;
          CheckBox8.Visible := true;
          CheckBox8.Enabled := false;
        end;
      end
      else if vDadosIni.vEmp.vVincularVeicOBJ = 'S' then
      begin
        CheckBox8.Checked := true;
        CheckBox8.Visible := true;
        CheckBox8.Enabled := false;
      end
      else
      begin
        CheckBox8.Checked := false;
        CheckBox8.Visible := true;
        CheckBox8.Enabled := false;
      end;
      if vDadosIni.vEmp.vUsarAparelho = 'S' then
      begin
        if vDadosIni.vEmp.vVincularVeicOBJ = 'E' then
          CheckBox8.Caption := 'Vincular OS com Objeto (F12)'
        else
        	CheckBox8.Caption := 'Vincular OS com Objeto';
        CheckBox8.Hint := 'Habilitar/Desabilitar vinculação de OS com Objeto - [VND127]';
      end
      else
      begin
        if vDadosIni.vEmp.vVincularVeicOBJ = 'E' then
          CheckBox8.Caption := 'Vincular OS com Veículo (F12)'
        else
        	CheckBox8.Caption := 'Vincular OS com Veículo';
        CheckBox8.Hint := 'Habilitar/Desabilitar vinculação de OS com Veículo - [VND127]';
      end;

      BitBtn1.Hint := 'Clique para pesquisar - [VND065]';
      BitBtn3.Hint := 'Novo cadastro - [VND002]';
      SpeedButton1.Hint := 'Editar Registro - [VND008]';
      SpeedButton22.Hint := 'Alterar Status OS - [VND117]';
      BitBtn14.Hint := 'Incluir - [VND022]';
      BitBtn85.Hint := 'Mecânicos';
      BitBtn26.Hint := 'Salvar - [VND025]';
      BitBtn27.Hint := 'Alterar - [VND023]';
      BitBtn28.Hint := 'Cancelar - [VND096 / VND024]';
      BitBtn16.Hint := 'Incluir - [VND014]';
      BitBtn17.Hint := 'Salvar - [VND017]';
      BitBtn18.Hint := 'Alterar - [VND011]';
      BitBtn19.Hint := 'Cancelar - [VND016]';
      BitBtn104.Hint := 'Incluir Kit';
      BitBtn105.Hint := 'Incluir Kit';
      BitBtn8.Hint := 'Incluir - [VND014]';
      BitBtn9.Hint := 'Salvar - [VND017]';
      BitBtn10.Hint := 'Alterar - [VND015]';
      BitBtn11.Hint := 'Cancelar - [VND016]';
      BitBtn33.Hint := 'Incluir - [VND038]';
      BitBtn34.Hint := 'Salvar - [VND041]';
      BitBtn35.Hint := 'Alterar - [VND039]';
      BitBtn36.Hint := 'Cancelar - [VND040]';
      BitBtn29.Hint := 'Incluir - [VND030]';
      BitBtn30.Hint := 'Salvar - [VND033]';
      BitBtn31.Hint := 'Alterar - [VND031]';
      BitBtn32.Hint := 'Cancelar - [VND032]';
//      if vDadosIni.vEmp.vUsarDAV <> 'S' then
//        SpeedButton2.Hint := 'Apagar Registro - [VND004]'
//      else
      SpeedButton2.Hint := 'Cancelar DAV - [VND104]';
      SpeedButton3.Hint := 'Imprimir - [VND055]';
      SpeedButton38.Visible := false;
//      SpeedButton1.Hint:='Editar Registro [VND007]';
//      SpeedButton1.Hint:='Editar Registro [VND007]';
//      SpeedButton1.Hint:='Editar Registro [VND007]';


      //Campos invisíveis na OS
      {if ((CadPedVenda.dataSet.FieldByName('TIPO_ORC').Tag = 0) or (CadPedVenda.dataSet.FieldByName('TIPO_ORC').Tag = 3)) then
        if UpperCase(FindComponent('cdsPedVendaTIPO_ORC').Name) = UpperCase('cdsPedVendaTIPO_ORC') then
          TCheckBox(FindComponent('cdsPedVendaTIPO_ORC')).Checked := false;
      if ((CadPedVenda.dataSet.FieldByName('NOME_CLI_ORC').Tag = 0) or (CadPedVenda.dataSet.FieldByName('NOME_CLI_ORC').Tag = 3)) then
        if UpperCase(FindComponent('cdsPedVendaNOME_CLI_ORC').Name) = UpperCase('cdsPedVendaNOME_CLI_ORC') then
          TCheckBox(FindComponent('cdsPedVendaNOME_CLI_ORC')).Checked := false;
      }
      //Campos visíveis apenas na OS
      {if ((CadPedVenda.dataSet.FieldByName('TIPO_OS').Tag = 0) or (CadPedVenda.dataSet.FieldByName('TIPO_OS').Tag = 3))
        and CadPedVenda.rConfigCampos.vTIPO_OS then
        if UpperCase(FindComponent('cdsPedVendaTIPO_OS').Name) = UpperCase('cdsPedVendaTIPO_OS') then
          TCheckBox(FindComponent('cdsPedVendaTIPO_OS')).Checked := true;
      if ((CadPedVenda.dataSet.FieldByName('NUM_NFEEXT').Tag = 0) or (CadPedVenda.dataSet.FieldByName('NUM_NFEEXT').Tag = 3))
        and CadPedVenda.rConfigCampos.vNUM_NFEEXT then
        if UpperCase(FindComponent('cdsPedVendaNUM_NFEEXT').Name) = UpperCase('cdsPedVendaNUM_NFEEXT') then
          TCheckBox(FindComponent('cdsPedVendaNUM_NFEEXT')).Checked := true;
      if ((CadPedVenda.dataSet.FieldByName('DATA_NFEXT').Tag = 0) or (CadPedVenda.dataSet.FieldByName('DATA_NFEXT').Tag = 3))
        and CadPedVenda.rConfigCampos.vDATA_NFEXT then
        if UpperCase(FindComponent('cdsPedVendaDATA_NFEXT').Name) = UpperCase('cdsPedVendaDATA_NFEXT') then
          TCheckBox(FindComponent('cdsPedVendaDATA_NFEXT')).Checked := true;
      if ((CadPedVenda.dataSet.FieldByName('VALOR_NFEXT').Tag = 0) or (CadPedVenda.dataSet.FieldByName('VALOR_NFEXT').Tag = 3))
        and CadPedVenda.rConfigCampos.vVALOR_NFEXT then
        if UpperCase(FindComponent('cdsPedVendaVALOR_NFEXT').Name) = UpperCase('cdsPedVendaVALOR_NFEXT') then
          TCheckBox(FindComponent('cdsPedVendaVALOR_NFEXT')).Checked := true;
      if ((CadPedVenda.dataSet.FieldByName('EM_NF').Tag = 0) or (CadPedVenda.dataSet.FieldByName('EM_NF').Tag = 3))
        and CadPedVenda.rConfigCampos.vEM_NF then
        if UpperCase(FindComponent('cdsPedVendaEM_NF').Name) = UpperCase('cdsPedVendaEM_NF') then
          TCheckBox(FindComponent('cdsPedVendaEM_NF')).Checked := true;
       }
    end
    else
    begin
      SpeedButton57.Visible := false;
      SpeedButton58.Visible := false;
      Self.Caption := 'Orçamentos';
      CadPedVenda.dataSet.FieldByName('nped').DisplayLabel          := 'Num Orc';
      CadPedVenda.dataSet.FieldByName('data_ped').DisplayLabel      := 'Data Orc';
      CadPedVenda.dataSet.FieldByName('obs_ped').DisplayLabel       := 'Obs 1 do Orc';
      CadPedVenda.dataSet.FieldByName('obs_os').DisplayLabel        := 'Obs 2 do Orc';
      CadPedVenda.dataSet.FieldByName('obs_cxl_rq').DisplayLabel    := 'Obs do Vendedor';
    	CadPedVenda.dataSet.FieldByName('obs_minuta').DisplayLabel    := 'Obs Minuta';
    	CadPedVenda.dataSet.FieldByName('obs_livro_reg').DisplayLabel := 'Obs Livro de Registro';
    	CadPedVenda.dataSet.FieldByName('obs_red_os').DisplayLabel    := 'Obs Red Orc';
      CadPedVenda.dataSet.FieldByName('obs_tpvenda').DisplayLabel   := 'Obs Adicional';
      CadPedVenda.dataSet.FieldByName('status_ped').DisplayLabel    := 'Status Orc';
      CadPedVenda.dataSet.FieldByName('tot_prod').DisplayLabel      := 'Total Produtos';
      CadPedVenda.dataSet.FieldByName('tot_serv').DisplayLabel      := 'Total Serviços';
      CadPedVenda.dataSet.FieldByName('tot_prod_terc').DisplayLabel := 'Total Produtos Terc';
    	CadPedVenda.dataSet.FieldByName('tot_serv_terc').DisplayLabel := 'Total Serviços Terc';

      CheckBox4.Visible := true;
      CheckBox4.Enabled := true;
      CheckBox4.Caption := 'Orçamento Rápido (F11)';
      if vDadosIni.vEmp.vVincularVeicOBJ = 'E' then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';
        if vDadosIni.PesqPros('VND127', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, true) then
        begin
          CheckBox8.Enabled := true;
          CheckBox8.Visible := true;
        end
        else
        begin
          CheckBox8.Checked := true;
          CheckBox8.Enabled := false;
          CheckBox8.Visible := true;
        end;
      end
      else if vDadosIni.vEmp.vVincularVeicOBJ = 'S' then
      begin
        CheckBox8.Checked := true;
        CheckBox8.Visible := true;
        CheckBox8.Enabled := false;
      end
      else
      begin
        CheckBox8.Checked := false;
        CheckBox8.Visible := true;
        CheckBox8.Enabled := false;
      end;

      if vDadosIni.vEmp.vUsarAparelho = 'S' then
      begin
        if vDadosIni.vEmp.vVincularVeicOBJ = 'E' then
          CheckBox8.Caption := 'Vincular Orçamento com Objeto (F12)'
        else
        	CheckBox8.Caption := 'Vincular Orçamento com Objeto';
        CheckBox8.Hint := 'Habilitar/Desabilitar vinculação de Orçamento com Objeto - [VND127]';
      end
      else
      begin
        if vDadosIni.vEmp.vVincularVeicOBJ = 'E' then
          CheckBox8.Caption := 'Vincular Orçamento com Veículo (F12)'
        else
        	CheckBox8.Caption := 'Vincular Orçamento com Veículo';
        CheckBox8.Hint := 'Habilitar/Desabilitar vinculação de Orçamento com Veículo - [VND127]';
      end;

      SpeedButton24.Visible := false;
      SpeedButton26.Visible := false;
      SpeedButton17.Visible := false;
      label26.Visible := (vDadosIni.vMNF = 'S');
      DBEdit18.Visible := (vDadosIni.vMNF = 'S');
      SpeedButton21.Hint := 'Visualizar Status do Orçamento - [VND120]';
      SpeedButton26.Visible := false;
      SpeedButton24.Hint := '';
      CadPedVenda.verificatipovenda(1, DBComboBox9, 'ORC', '');
      CadPedVenda.verificatipovenda(1, DBComboBox8, 'ORC', '');
      CadPedVenda.verificatipovenda(1, DBComboBox5, 'ORC', '');
      BitBtn1.Hint := 'Clique para pesquisar - [VND065]';
      BitBtn3.Hint := 'Novo cadastro - [VND003]';
      SpeedButton1.Hint := 'Editar Registro - [VND009]';
      SpeedButton22.Hint := 'Alterar Status Orçamento - [VND121]';
      BitBtn14.Hint := 'Incluir - [VND022]';
      BitBtn85.Hint := 'Mecânicos';
      BitBtn26.Hint := 'Salvar - [VND029]';
      BitBtn27.Hint := 'Alterar - [VND027]';
      BitBtn28.Hint := 'Cancelar - [VND097 / VND028]';
      BitBtn16.Hint := 'Incluir - [VND018]';
      BitBtn17.Hint := 'Salvar - [VND021]';
      BitBtn18.Hint := 'Alterar - [VND011]';
      BitBtn19.Hint := 'Cancelar - [VND020]';
      BitBtn104.Hint := 'Incluir Kit';
      BitBtn105.Hint := 'Incluir Kit';
      BitBtn8.Hint := 'Incluir  - [VND018]';
      BitBtn9.Hint := 'Salvar - [VND021]';
      BitBtn10.Hint := 'Alterar - [VND019]';
      BitBtn11.Hint := 'Cancelar - [VND020]';
      BitBtn33.Hint := 'Incluir - [VND042]';
      BitBtn34.Hint := 'Salvar - [VND045]';
      BitBtn35.Hint := 'Alterar - [VND043]';
      BitBtn36.Hint := 'Cancelar - [VND044]';
      BitBtn29.Hint := 'Incluir - [VND034]';
      BitBtn30.Hint := 'Salvar - [VND037]';
      BitBtn31.Hint := 'Alterar - [VND035]';
      BitBtn32.Hint := 'Cancelar - [VND036]';
//      if vDadosIni.vEmp.vUsarDAV <> 'S' then
//        SpeedButton2.Hint := 'Apagar Registro - [VND004]'
//      else
      SpeedButton2.Hint := 'Cancelar DAV - [VND104]';
      SpeedButton3.Hint := 'Imprimir - [VND056]';
      SpeedButton38.Visible := vDadosIni.vVerORCConvertidoVND='S';
      //Campos invisíveis no orçamento
      {if ((CadPedVenda.dataSet.FieldByName('TIPO_OS').Tag = 0) or (CadPedVenda.dataSet.FieldByName('TIPO_OS').Tag = 3)) then
        if UpperCase(FindComponent('cdsPedVendaTIPO_OS').Name) = UpperCase('cdsPedVendaTIPO_OS') then
          TCheckBox(FindComponent('cdsPedVendaTIPO_OS')).Checked := false;
      if ((CadPedVenda.dataSet.FieldByName('NUM_NFEEXT').Tag = 0) or (CadPedVenda.dataSet.FieldByName('NUM_NFEEXT').Tag = 3)) then
        if UpperCase(FindComponent('cdsPedVendaNUM_NFEEXT').Name) = UpperCase('cdsPedVendaNUM_NFEEXT') then
          TCheckBox(FindComponent('cdsPedVendaNUM_NFEEXT')).Checked := false;
      if ((CadPedVenda.dataSet.FieldByName('DATA_NFEXT').Tag = 0) or (CadPedVenda.dataSet.FieldByName('DATA_NFEXT').Tag = 3)) then
        if UpperCase(FindComponent('cdsPedVendaDATA_NFEXT').Name) = UpperCase('cdsPedVendaDATA_NFEXT') then
          TCheckBox(FindComponent('cdsPedVendaDATA_NFEXT')).Checked := false;
      if ((CadPedVenda.dataSet.FieldByName('VALOR_NFEXT').Tag = 0) or (CadPedVenda.dataSet.FieldByName('VALOR_NFEXT').Tag = 3)) then
        if UpperCase(FindComponent('cdsPedVendaVALOR_NFEXT').Name) = UpperCase('cdsPedVendaVALOR_NFEXT') then
          TCheckBox(FindComponent('cdsPedVendaVALOR_NFEXT')).Checked := false;
      if ((CadPedVenda.dataSet.FieldByName('EM_NF').Tag = 0) or (CadPedVenda.dataSet.FieldByName('EM_NF').Tag = 3)) then
        if UpperCase(FindComponent('cdsPedVendaEM_NF').Name) = UpperCase('cdsPedVendaEM_NF') then
          TCheckBox(FindComponent('cdsPedVendaEM_NF')).Checked := false;
      }

      //Campos visíveis apenas no ORC
      {if ((CadPedVenda.dataSet.FieldByName('TIPO_ORC').Tag = 0) or (CadPedVenda.dataSet.FieldByName('TIPO_ORC').Tag = 3))
        and CadPedVenda.rConfigCampos.vTIPO_ORC then
        if UpperCase(FindComponent('cdsPedVendaTIPO_ORC').Name) = UpperCase('cdsPedVendaTIPO_ORC') then
          TCheckBox(FindComponent('cdsPedVendaTIPO_ORC')).Checked := true;
      if ((CadPedVenda.dataSet.FieldByName('NOME_CLI_ORC').Tag = 0) or (CadPedVenda.dataSet.FieldByName('NOME_CLI_ORC').Tag = 3))
        and CadPedVenda.rConfigCampos.vNOME_CLI_ORC then
        if UpperCase(FindComponent('cdsPedVendaNOME_CLI_ORC').Name) = UpperCase('cdsPedVendaNOME_CLI_ORC') then
          TCheckBox(FindComponent('cdsPedVendaNOME_CLI_ORC')).Checked := true;
      }
    end;
    //Campos visíveis tanto pra OS quanto para ORC
    {if ((CadPedVenda.dataSet.FieldByName('TOT_SERV').Tag = 0) or (CadPedVenda.dataSet.FieldByName('TOT_SERV').Tag = 3))
      and CadPedVenda.rConfigCampos.vTOT_SERV then
      if UpperCase(FindComponent('cdsPedVendaTOT_SERV').Name) = UpperCase('cdsPedVendaTOT_SERV') then
        TCheckBox(FindComponent('cdsPedVendaTOT_SERV')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('OBS_OS').Tag = 0) or (CadPedVenda.dataSet.FieldByName('OBS_OS').Tag = 3))
      and CadPedVenda.rConfigCampos.vOBS_OS then
      if UpperCase(FindComponent('cdsPedVendaOBS_OS').Name) = UpperCase('cdsPedVendaOBS_OS') then
        TCheckBox(FindComponent('cdsPedVendaOBS_OS')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('TIPO_ORC').Tag = 0) or (CadPedVenda.dataSet.FieldByName('TIPO_ORC').Tag = 3))
      and CadPedVenda.rConfigCampos.vTIPO_ORC then
      if UpperCase(FindComponent('cdsPedVendaTIPO_ORC').Name) = UpperCase('cdsPedVendaTIPO_ORC') then
        TCheckBox(FindComponent('cdsPedVendaTIPO_ORC')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('NOME_CLI_ORC').Tag = 0) or (CadPedVenda.dataSet.FieldByName('NOME_CLI_ORC').Tag = 3))
      and CadPedVenda.rConfigCampos.vNOME_CLI_ORC then
      if UpperCase(FindComponent('cdsPedVendaNOME_CLI_ORC').Name) = UpperCase('cdsPedVendaNOME_CLI_ORC') then
        TCheckBox(FindComponent('cdsPedVendaNOME_CLI_ORC')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('DESC_P_SERV').Tag = 0) or (CadPedVenda.dataSet.FieldByName('DESC_P_SERV').Tag = 3))
      and CadPedVenda.rConfigCampos.vDESC_P_SERV then
      if UpperCase(FindComponent('cdsPedVendaDESC_P_SERV').Name) = UpperCase('cdsPedVendaDESC_P_SERV') then
        TCheckBox(FindComponent('cdsPedVendaDESC_P_SERV')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('ACRESC_P_SERV').Tag = 0) or (CadPedVenda.dataSet.FieldByName('ACRESC_P_SERV').Tag = 3))
      and CadPedVenda.rConfigCampos.vACRESC_P_SERV then
      if UpperCase(FindComponent('cdsPedVendaACRESC_P_SERV').Name) = UpperCase('cdsPedVendaACRESC_P_SERV') then
        TCheckBox(FindComponent('cdsPedVendaACRESC_P_SERV')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('PLACA').Tag = 0) or (CadPedVenda.dataSet.FieldByName('PLACA').Tag = 3))
      and CadPedVenda.rConfigCampos.vPLACA then
      if UpperCase(FindComponent('cdsPedVendaPLACA').Name) = UpperCase('cdsPedVendaPLACA') then
        TCheckBox(FindComponent('cdsPedVendaPLACA')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('CHASSI').Tag = 0) or (CadPedVenda.dataSet.FieldByName('CHASSI').Tag = 3))
      and CadPedVenda.rConfigCampos.vCHASSI then
      if UpperCase(FindComponent('cdsPedVendaCHASSI').Name) = UpperCase('cdsPedVendaCHASSI') then
        TCheckBox(FindComponent('cdsPedVendaCHASSI')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('COD_EQUIP').Tag = 0) or (CadPedVenda.dataSet.FieldByName('COD_EQUIP').Tag = 3))
      and CadPedVenda.rConfigCampos.vCOD_EQUIP then
      if UpperCase(FindComponent('cdsPedVendaCOD_EQUIP').Name) = UpperCase('cdsPedVendaCOD_EQUIP') then
        TCheckBox(FindComponent('cdsPedVendaCOD_EQUIP')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('COD_VEICULO').Tag = 0) or (CadPedVenda.dataSet.FieldByName('COD_VEICULO').Tag = 3))
      and CadPedVenda.rConfigCampos.vCOD_VEICULO then
      if UpperCase(FindComponent('cdsPedVendaCOD_VEICULO').Name) = UpperCase('cdsPedVendaCOD_VEICULO') then
        TCheckBox(FindComponent('cdsPedVendaCOD_VEICULO')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('APARELHO_PED').Tag = 0) or (CadPedVenda.dataSet.FieldByName('APARELHO_PED').Tag = 3))
      and CadPedVenda.rConfigCampos.vAPARELHO_PED then
      if UpperCase(FindComponent('cdsPedVendaAPARELHO_PED').Name) = UpperCase('cdsPedVendaAPARELHO_PED') then
        TCheckBox(FindComponent('cdsPedVendaAPARELHO_PED')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('STAT_REQ').Tag = 0) or (CadPedVenda.dataSet.FieldByName('STAT_REQ').Tag = 3))
      and CadPedVenda.rConfigCampos.vSTAT_REQ then
      if UpperCase(FindComponent('cdsPedVendaSTAT_REQ').Name) = UpperCase('cdsPedVendaSTAT_REQ') then
        TCheckBox(FindComponent('cdsPedVendaSTAT_REQ')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('KM_V').Tag = 0) or (CadPedVenda.dataSet.FieldByName('KM_V').Tag = 3))
      and CadPedVenda.rConfigCampos.vKM_V then
      if UpperCase(FindComponent('cdsPedVendaKM_V').Name) = UpperCase('cdsPedVendaKM_V') then
        TCheckBox(FindComponent('cdsPedVendaKM_V')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('DT_PROMETIDA').Tag = 0) or (CadPedVenda.dataSet.FieldByName('DT_PROMETIDA').Tag = 3))
      and CadPedVenda.rConfigCampos.vDT_PROMETIDA then
      if UpperCase(FindComponent('cdsPedVendaDT_PROMETIDA').Name) = UpperCase('cdsPedVendaDT_PROMETIDA') then
        TCheckBox(FindComponent('cdsPedVendaDT_PROMETIDA')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('GUARDA_VOL').Tag = 0) or (CadPedVenda.dataSet.FieldByName('GUARDA_VOL').Tag = 3))
      and CadPedVenda.rConfigCampos.vGUARDA_VOL then
      if UpperCase(FindComponent('cdsPedVendaGUARDA_VOL').Name) = UpperCase('cdsPedVendaGUARDA_VOL') then
        TCheckBox(FindComponent('cdsPedVendaGUARDA_VOL')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('COMBUST_VEIC').Tag = 0) or (CadPedVenda.dataSet.FieldByName('COMBUST_VEIC').Tag = 3))
      and CadPedVenda.rConfigCampos.vCOMBUST_VEIC then
      if UpperCase(FindComponent('cdsPedVendaCOMBUST_VEIC').Name) = UpperCase('cdsPedVendaCOMBUST_VEIC') then
        TCheckBox(FindComponent('cdsPedVendaCOMBUST_VEIC')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('DEFEITO').Tag = 0) or (CadPedVenda.dataSet.FieldByName('DEFEITO').Tag = 3))
      and CadPedVenda.rConfigCampos.vDEFEITO then
      if UpperCase(FindComponent('cdsPedVendaDEFEITO').Name) = UpperCase('cdsPedVendaDEFEITO') then
        TCheckBox(FindComponent('cdsPedVendaDEFEITO')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('ESTADO_VEIC').Tag = 0) or (CadPedVenda.dataSet.FieldByName('ESTADO_VEIC').Tag = 3))
      and CadPedVenda.rConfigCampos.vESTADO_VEIC then
      if UpperCase(FindComponent('cdsPedVendaESTADO_VEIC').Name) = UpperCase('cdsPedVendaESTADO_VEIC') then
        TCheckBox(FindComponent('cdsPedVendaESTADO_VEIC')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('ACESSORIOS').Tag = 0) or (CadPedVenda.dataSet.FieldByName('ACESSORIOS').Tag = 3))
      and CadPedVenda.rConfigCampos.vACESSORIOS then
      if UpperCase(FindComponent('cdsPedVendaACESSORIOS').Name) = UpperCase('cdsPedVendaACESSORIOS') then
        TCheckBox(FindComponent('cdsPedVendaACESSORIOS')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('H_ENT').Tag = 0) or (CadPedVenda.dataSet.FieldByName('H_ENT').Tag = 3))
      and CadPedVenda.rConfigCampos.vH_ENT then
      if UpperCase(FindComponent('cdsPedVendaH_ENT').Name) = UpperCase('cdsPedVendaH_ENT') then
        TCheckBox(FindComponent('cdsPedVendaH_ENT')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('H_PROMETIDA').Tag = 0) or (CadPedVenda.dataSet.FieldByName('H_PROMETIDA').Tag = 3))
      and CadPedVenda.rConfigCampos.vH_PROMETIDA then
      if UpperCase(FindComponent('cdsPedVendaH_PROMETIDA').Name) = UpperCase('cdsPedVendaH_PROMETIDA') then
        TCheckBox(FindComponent('cdsPedVendaH_PROMETIDA')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('OBS_LIVRO_REG').Tag = 0) or (CadPedVenda.dataSet.FieldByName('OBS_LIVRO_REG').Tag = 3))
      and CadPedVenda.rConfigCampos.vOBS_LIVRO_REG then
      if UpperCase(FindComponent('cdsPedVendaOBS_LIVRO_REG').Name) = UpperCase('cdsPedVendaOBS_LIVRO_REG') then
        TCheckBox(FindComponent('cdsPedVendaOBS_LIVRO_REG')).Checked := true;
    if ((CadPedVenda.dataSet.FieldByName('OBS_RED_OS').Tag = 0) or (CadPedVenda.dataSet.FieldByName('OBS_RED_OS').Tag = 3))
      and CadPedVenda.rConfigCampos.vOBS_RED_OS then
      if UpperCase(FindComponent('cdsPedVendaOBS_RED_OS').Name) = UpperCase('cdsPedVendaOBS_RED_OS') then
        TCheckBox(FindComponent('cdsPedVendaOBS_RED_OS')).Checked := true;
    }
//    ScrollBox2Exit(ScrollBox2);


    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('VND099', 'PERMITIR', '', 'PEDVENDA', inttostr(vDadosIni.vCodUsuario) + ' ' + vDadosIni.vNomeUsuario, CadPedVenda.buscas, true) then
    begin
      dbedit42.Enabled := false;
      dblookupcombobox1.Enabled := false;
    end
    else
    begin
      dbedit42.Enabled := true;
      dblookupcombobox1.Enabled := true;
    end;
    //    if CadPedVenda.vEmp.dataSet.FieldByName('DADVAP').AsString = 'SIM' then
    if vDadosIni.vEmp.vUsarAparelho = 'S' then
    begin
      TabSheet11.Enabled := true;
      TabSheet11.TabVisible := true;
      TabSheet6.TabVisible := (vDadosIni.vEquipamentos.HabAtivReparoInstrucacaoInMetr)
      	and (vDadosIni.vEmp.vUsarAparelho = 'S');
      PageControl4.ActivePage := TabSheet11;
      TabSheet10.Enabled := false;
      TabSheet10.TabVisible := false;
      Label83.Caption := 'Estado do Objeto:';
      DBMemo3.Hint := 'Informar o estado do objeto';
      Label87.Caption := 'Técnico:';
//      Label48.Caption := 'Técnico:';
      Label125.Caption := 'Técnico:';
      DBEdit45.Hint := 'Código do Técnico';
      DBEdit59.Hint := 'Código do Técnico';
      DBEdit60.Hint := 'Código do Técnico';
      DBEdit87.Hint := 'Código do Técnico';
      DBLookupComboBox4.Hint := 'Técnico selecionado';
      DBLookupComboBox5.Hint := 'Técnico selecionado';
      DBLookupComboBox11.Hint := 'Técnico selecionado';
      DBLookupComboBox7.Hint := 'Técnico 1 selecionado';
      Label102.Caption := 'Técnico:';
      Label103.Caption := trim(vDadosIni.vPedVnd.NomeSegCampoServ) + ':';
      BitBtn85.Caption := 'Técnicos';
      GroupBox61.Caption := 'Técnicos';
      GroupBox8.Caption := 'Técnico Específico';

      CadPedVenda.vItProd.dataSet.FieldByName('col_cod_vendedor').DisplayLabel := 'Cod Técnico';
      CadPedVenda.vItProd.dataSet.FieldByName('nome_vend1').DisplayLabel := 'Nome Técnico';
      CadPedVenda.vItProd.dataSet.FieldByName('cod_vendedor').DisplayLabel := 'Cod Vendedor';
      CadPedVenda.vItProd.dataSet.FieldByName('nome_vend').DisplayLabel := 'Nome Vendedor';

      CadPedVenda.vItServ.dataSet.FieldByName('cod_vendedor').DisplayLabel := 'Cod Técnico';
      CadPedVenda.vItServ.dataSet.FieldByName('nome_vend').DisplayLabel := 'Nome Técnico';
      CadPedVenda.vItServ.dataSet.FieldByName('cod_vendedor1').DisplayLabel := 'Cod ' + trim(vDadosIni.vPedVnd.NomeSegCampoServ);
      CadPedVenda.vItServ.dataSet.FieldByName('nome_vend1').DisplayLabel := 'Nome ' + trim(vDadosIni.vPedVnd.NomeSegCampoServ);
    end
    else
    begin
      TabSheet10.Enabled := true;
      TabSheet10.TabVisible := true;
      PageControl4.ActivePage := TabSheet10;
      TabSheet11.Enabled := false;
      TabSheet11.TabVisible := false;
      TabSheet6.TabVisible := (vDadosIni.vEquipamentos.HabAtivReparoInstrucacaoInMetr)
      	and (vDadosIni.vEmp.vUsarAparelho = 'S');
      Label83.Caption := 'Estado do Veículo:';
      DBMemo3.Hint := 'Informar o estado do veículo';
      Label87.Caption := 'Mecânico:';
//      Label48.Caption := 'Mecânico:';
      Label125.Caption := 'Mecânico:';
      DBEdit45.Hint := 'Código do Mecânico';
      DBEdit59.Hint := 'Código do Mecânico';
      DBEdit60.Hint := 'Código do Mecânico';
      DBEdit87.Hint := 'Código do Mecânico';
      DBLookupComboBox4.Hint := 'Mecânico selecionado';
      DBLookupComboBox5.Hint := 'Mecânico selecionado';
      DBLookupComboBox11.Hint := 'Mecânico selecionado';
      DBLookupComboBox7.Hint := 'Mecânico 1 selecionado';
      Label102.Caption := 'Mecânico:';
      Label103.Caption := trim(vDadosIni.vPedVnd.NomeSegCampoServ) + ':';
      BitBtn85.Caption := 'Mecânicos';
      GroupBox61.Caption := 'Mecânicos';
      GroupBox8.Caption := 'Mecânico Específico';

    	CadPedVenda.vItProd.dataSet.FieldByName('col_cod_vendedor').DisplayLabel := 'Cod Mecânico';
      CadPedVenda.vItProd.dataSet.FieldByName('nome_vend1').DisplayLabel := 'Nome Mecânico';
      CadPedVenda.vItProd.dataSet.FieldByName('cod_vendedor').DisplayLabel := 'Cod Vendedor';
      CadPedVenda.vItProd.dataSet.FieldByName('nome_vend').DisplayLabel := 'Nome Vendedor';

      CadPedVenda.vItServ.dataSet.FieldByName('cod_vendedor').DisplayLabel := 'Cod Mecânico';
      CadPedVenda.vItServ.dataSet.FieldByName('nome_vend').DisplayLabel := 'Nome Mecânico';
      CadPedVenda.vItServ.dataSet.FieldByName('cod_vendedor1').DisplayLabel := 'Cod ' + trim(vDadosIni.vPedVnd.NomeSegCampoServ);
      CadPedVenda.vItServ.dataSet.FieldByName('nome_vend1').DisplayLabel := 'Nome ' + trim(vDadosIni.vPedVnd.NomeSegCampoServ);
    end;

    vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit61.Enabled := vDadosIni.PesqPros('VND073', '', '', 'PEDVENDA', '', CadPedVenda.buscas, False);
// O processo abaixo será usado agora para permitir a alteração de preço apartir de exigência de senha.
//    vDadosIni.vInibeMensPesqPros := 'S';
//    DBEdit62.Enabled := vDadosIni.PesqPros('VND074', '', '', 'PEDVENDA', '', CadPedVenda.buscas, False);

    DBEdit58.Enabled := DBEdit62.Enabled;

    Label102.Visible := not (vDadosIni.vMecOS = 'S');
    Label103.Visible := not (vDadosIni.vMecOS = 'S');
    DBEdit59.Visible := not (vDadosIni.vMecOS = 'S');
    DBEdit60.Visible := not (vDadosIni.vMecOS = 'S');
    DBLookupComboBox5.Visible := not (vDadosIni.vMecOS = 'S');
    DBLookupComboBox7.Visible := not (vDadosIni.vMecOS = 'S');
    BitBtn85.Visible := (vDadosIni.vMecOS = 'S');
    DBLookupComboBox11.Visible := true;
    DBEdit87.Visible := true;
    Label125.Visible := true;
    SpeedButton18.Visible := true;
    SpeedButton18.Top := vDadosIni.retornoPorCondicao(CadPedVenda.getTipoVenda = 'ORC', 4, 55);
    SpeedButton18.Left := vDadosIni.retornoPorCondicao(CadPedVenda.getTipoVenda = 'ORC', 520, 634);
    SpeedButton18.Hint := vDadosIni.retornoPorCondicao(CadPedVenda.getTipoVenda = 'ORC',
      'Alterar vendedor ou cliente do orçamento - [VND199]',
      'Alterar cliente da ordem de serviço - [VND200]' + #13 +
      'Alterar recepcionista da ordem de serviço - [VND201]');
    SpeedButton35.Visible := false;
    pgOS.ActivePage := tsOS;
//    ScrollBox2Exit(ScrollBox2);
  end;

  vDadosIni.vInibeMensPesqPros := 'S';
  DBEdit14.ReadOnly := not vDadosIni.PesqPros('VND100', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False);
  vDadosIni.vInibeMensPesqPros := 'S';
  DBEdit51.ReadOnly := not vDadosIni.PesqPros('VND101', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False);
  DBEdit117.ReadOnly := DBEdit51.ReadOnly;

  DBEdit4.OnExit := exitCliente;
  DBEdit77.OnExit := exitCliente;
  DBEdit104.OnExit := exitCliente;
  DBEdit67.OnExit := exitCliente;
  DBEdit21.OnExit := exitDescontoAcrescimo;
  DBEdit22.OnExit := exitDescontoAcrescimo;
  DBEdit23.OnExit := exitDescontoAcrescimo;
  DBEdit24.OnExit := exitDescontoAcrescimo;
  DBEdit29.OnExit := exitDescontoAcrescimo;
  DBEdit30.OnExit := exitDescontoAcrescimo;
  DBEdit31.OnExit := exitDescontoAcrescimo;
//  DBEdit122.OnExit := exitDescontoAcrescimo;
  DBEdit123.OnExit := exitDescontoAcrescimo;
  DBEdit157.OnExit := exitDescontoAcrescimo;

  DBEdit6.OnExit := exitCondPag;
  DBLookupComboBox15.OnExit := exitCondPag;
  DBEdit130.OnExit := exitCondPag;
  DBLookupComboBox30.OnExit := exitCondPag;
  DBEdit108.OnExit := exitCondPag;
  DBLookupComboBox27.OnExit := exitCondPag;
  
  DBEdit133.OnExit := exitPercComissaoVend3;
//  DBEdit122.OnExit := exitCondPag;
  //  DBEdit79.OnExit := exitDescontoAcrescimo;
  //  DBEdit80.OnExit := exitDescontoAcrescimo;
  //  DBEdit81.OnExit := exitDescontoAcrescimo;
  DBEdit109.OnExit := exitDescontoAcrescimo;
  DBEdit110.OnExit := exitDescontoAcrescimo;
  DBEdit111.OnExit := exitDescontoAcrescimo;
  DBEdit112.OnExit := exitDescontoAcrescimo;
  //  DBEdit104.OnExit := exitVendedorCab;
  //  DBLookupComboBox10.OnExit := exitVendedorCab;

//  if CadPedVenda.getSegServ = 'S' then
  if (vDadosIni.vEmp.vSegmentaProdVenda = 'S1') or (vDadosIni.vEmp.vSegmentaProdVenda = 'S2') then
  begin
    Label16.Visible := vDadosIni.vEmp.vSegmentaProdVenda = 'S1';
    DBEdit8.Visible := vDadosIni.vEmp.vSegmentaProdVenda = 'S1';
    DBLookupComboBox17.Visible := vDadosIni.vEmp.vSegmentaProdVenda = 'S1';
    Label66.Visible := true;
    DBEdit44.Visible := vDadosIni.vEmp.vSegmentaProdVenda = 'S1';
    DBLookupComboBox8.Visible := true;
    Label91.Visible := true;
    DBEdit49.Visible := vDadosIni.vEmp.vSegmentaProdVenda = 'S1';
    DBLookupComboBox20.Visible := true;
    if vDadosIni.vEmp.vSegmentaProdVenda = 'S2' then
    begin
      DBLookupComboBox8.Left := 108;
      DBLookupComboBox8.Width := 302;

      DBLookupComboBox20.Left := 114;
      DBLookupComboBox20.Width := 306;

      Label66.Caption := 'Serviço:';
      Label91.Caption := 'Serviço:';
      DBEdit44.Hint := 'Código do serviço';

      TDtmPedVenda(dtm).dsItemServ.DataSet.Close;
      DBLookupComboBox8.ListSource := TDtmPedVenda(dtm).dsItemServ;
//      DBLookupComboBox8.KeyField := 'COD_SERVICO';
      DBLookupComboBox8.KeyField := 'NITEM_SERV';
      DBLookupComboBox8.ListField := 'DESC_SERV_PED;NITEM';

      DBLookupComboBox8.Hint := 'Serviço selecionado';
      DBLookupComboBox8.DataField := 'NITEM_SERV';
      DBLookupComboBox8.KeyField := 'NITEM_SERV';

      DBLookupComboBox20.Hint := 'Serviço selecionado';
      DBLookupComboBox20.DataField := 'NITEM_SERV';
      DBLookupComboBox20.KeyField := 'NITEM';
    end                         
    else
    begin
      DBLookupComboBox8.Left := 160;
      DBLookupComboBox8.Width := 250;

      DBLookupComboBox20.Left := 170;
      DBLookupComboBox20.Width := 250;

      TDtmPedVenda(dtm).dsItemServ.DataSet.Close;
      DBLookupComboBox8.ListSource := TDtmPedVenda(dtm).dsTipoServicoP;
      DBLookupComboBox8.KeyField := 'COD_SERVICO';
      DBLookupComboBox8.ListField := 'DESC_SERVICO';

      DBLookupComboBox8.DataField := 'COD_SEG_SERV';
      DBLookupComboBox8.KeyField := 'COD_SERVICO';

      DBLookupComboBox20.DataField := 'COD_SEG_SERV';
      DBLookupComboBox20.KeyField := 'COD_SERVICO';
    end;
  end;

  BitBtn87.Visible := trim(CadPedVenda.getNumCredenciamentoInterventor) <> '';

  if (vDadosIni.vProdTerc = 'S') and (vDadosIni.vTerminalFiscal <> 'S') then
  begin
    Label58.Visible := True;
//    Label61.Visible := True;
    //    Label81.Visible := True;
    //    Label82.Visible := True;
    tsServTercOS.TabVisible := true;
    tsProdTercOS.TabVisible := true;
//    CheckBox7.Visible := true;
		CheckBox7.Visible := false;
    Label81.Visible := true;
    DBText18.Visible := true;
  end
  else
  begin
//    Label63.Left := 633;
//    DBText1.Left := 478;
    //    Label81.Visible := false;
    //    Label82.Visible := false;
    tsProdTercOS.TabVisible := False;
    CheckBox7.Visible := false;
    Label81.Visible := false;
    DBText18.Visible := false;
  end;
  //  for I := 0 to TForm(FrmCadPedVenda).ComponentCount - 1 do
  //  begin
  //    if ((TForm(FrmCadPedVenda).Components[i]) is TControl) then
  //      TControl(TForm(FrmCadPedVenda).Components[i]).ShowHint := true;
  //  end;
  RadioGroup3.OnClick := nil;
  if CadPedVenda.getTipoVenda = 'REQ' then
    RadioGroup3.ItemIndex := 0
  else if CadPedVenda.getTipoVenda = 'OS' then
    RadioGroup3.ItemIndex := 1
  else if CadPedVenda.getTipoVenda = 'ORC' then
    RadioGroup3.ItemIndex := 2;
  RadioGroup3.OnClick := RadioGroup3Click;
  SpeedButton5.Enabled := True;
  if CadPedVenda.lixeiraVazia then
  begin
    lixeiraVazia(True);
    SpeedButton1.Visible := True;
    SpeedButton6.Visible := True;
    SpeedButton10.Visible := True;
    SpeedButton16.Visible := true;
    SpeedButton7.Visible := True;
    SpeedButton8.Visible := True;
    SpeedButton5.Visible := False;
    //    SpeedButton11.Visible := (CadPedVenda.getTipoVenda = 'ORC');
    SelecionarORC.Visible := (CadPedVenda.getTipoVenda = 'ORC');
    SelecionarDAVparaMesclagem1.Visible := ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS'));
  end
  else
    lixeiraVazia(False);
  SpeedButton42.Visible := (CadPedVenda.getTipoVenda = 'REQ');
  SpeedButton54.Visible := (CadPedVenda.getTipoVenda = 'REQ') and (vDadosIni.vEmp.vUSAR_SEPARACAO_PED = 'S');
  sbEditarObservacao.Visible := (CadPedVenda.getTipoVenda = 'OS') or ((CadPedVenda.getTipoVenda = 'REQ') and CadPedVenda.conf.ped_vnd_req_obs_semlimite);
  bt_adicionar_ao_faturamento.Visible := (CadPedVenda.getTipoVenda = 'REQ');

//  ck_venda_rapida_emitirnfe.Visible  := (CadPedVenda.getTipoVenda = 'REQ');
//  ck_venda_rapida_emitirnfce.Visible  := (CadPedVenda.getTipoVenda = 'REQ') and (vDadosIni.vNFConsumidor.CodEmissor > 0);
//
//  if ck_venda_rapida_emitirnfe.Visible then
//  	ck_venda_rapida_emitirnfe.Checked := regGetConfBool(ck_venda_rapida_emitirnfe.Name);
//
//  if ck_venda_rapida_emitirnfce.Visible then
//    ck_venda_rapida_emitirnfce.Checked := regGetConfBool(ck_venda_rapida_emitirnfce.Name);

  vDadosIni.vInibeMensPesqPros := 'S';
  if vDadosIni.PesqPros('VND128', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, true) then
  begin
    if vDadosIni.vEmp.vUsarDAV = 'S' then
    begin
      SpeedButton4.Visible := False;
      SpeedButton25.Visible := False;
    end;
  end
  else
  begin
    SpeedButton4.Visible := False;
    SpeedButton25.Visible := False;
  end;
end;

procedure TFrmCadPedVenda.Configurarcolunas1Click(Sender: TObject);
begin
  inherited;
//  _marcaCamposConfig;
end;

procedure TFrmCadPedVenda.Configurarcolunas_12Click(Sender: TObject);
begin
	vDadosIni.AtualizarColunasDBGrid(
  	DBGrid12,
    cdsColunas12,
    vusuario,
    vAlterarNomeDtSet12);

  vDadosIni.ConfigurarcolunasCadPadraoClick(
  	Sender,
    cdsColunas12,
    DBGrid12,
    GridCfg12,
    cdsGrid12,
    vusuario,
    ListGridsAndDataSets12,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet12);
end;

procedure TFrmCadPedVenda.Configurarcolunas_2Click(Sender: TObject);
begin
	vDadosIni.AtualizarColunasDBGrid(
  	DBGrid2,
    cdsColunas2,
    vusuario,
    vAlterarNomeDtSet2);

  vDadosIni.ConfigurarcolunasCadPadraoClick(
  	Sender,
    cdsColunas2,
    DBGrid2,
    GridCfg2,
    cdsGrid2,
    vusuario,
    ListGridsAndDataSets2,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet2);
end;

procedure TFrmCadPedVenda.Configurarcolunas_3Click(Sender: TObject);
begin
	vDadosIni.AtualizarColunasDBGrid(
  	DBGrid3,
    cdsColunas3,
    vusuario,
    vAlterarNomeDtSet3);

  vDadosIni.ConfigurarcolunasCadPadraoClick(
  	Sender,
    cdsColunas3,
    DBGrid3,
    GridCfg3,
    cdsGrid3,
    vusuario,
    ListGridsAndDataSets3,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet3);
end;

procedure TFrmCadPedVenda.Configurarcolunas_5Click(Sender: TObject);
begin
	vDadosIni.AtualizarColunasDBGrid(
  	DBGrid5,
    cdsColunas5,
    vusuario,
    vAlterarNomeDtSet5);

  vDadosIni.ConfigurarcolunasCadPadraoClick(
  	Sender,
    cdsColunas5,
    DBGrid5,
    GridCfg5,
    cdsGrid5,
    vusuario,
    ListGridsAndDataSets5,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet5);
end;

procedure TFrmCadPedVenda.Configurarcolunas_6Click(Sender: TObject);
begin
	vDadosIni.AtualizarColunasDBGrid(
  	DBGrid6,
    cdsColunas6,
    vusuario,
    vAlterarNomeDtSet6);

  vDadosIni.ConfigurarcolunasCadPadraoClick(
  	Sender,
    cdsColunas6,
    DBGrid6,
    GridCfg6,
    cdsGrid6,
    vusuario,
    ListGridsAndDataSets6,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet6);
end;

procedure TFrmCadPedVenda.Configurarcolunas_7Click(Sender: TObject);
begin
	vDadosIni.AtualizarColunasDBGrid(
  	DBGrid7,
    cdsColunas7,
    vusuario,
    vAlterarNomeDtSet7);

  vDadosIni.ConfigurarcolunasCadPadraoClick(
  	Sender,
    cdsColunas7,
    DBGrid7,
    GridCfg7,
    cdsGrid7,
    vusuario,
    ListGridsAndDataSets7,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet7);
end;

function TFrmCadPedVenda.ConsultaItem(codigo: string): boolean;
begin
  try
    Screen.Cursor := crHourGlass;
    CadPedVenda.vItProd.dataSet.DisableControls;
    cancelaAltPreco := false;
    Result := false;
    if CadPedVenda.vItProd.buscaProduto(
    	codigo,
      0,
      '',
      0,
      true,
      true) then
    begin
      if (CadPedVenda.vItProd.vProduto.alteraValorDescricaoProduto) or (vDadosIni.vUsarCommissao2 = 'S') then
      begin
        if CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsCurrency <= 0 then
        begin
          Result := False;
          Application.MessageBox('Valor unitário deve ser maior que zero!', 'Atenção', 0 + 64);
          exit;
        end;
         edValorUnitarioVendaRapida.Enabled := (CadPedVenda.vItProd.vProduto.alteraValorProduto) or (vDadosIni.vUsarCommissao2 = 'S');
        if (edValorUnitarioVendaRapida.Enabled) and (vDadosIni.vUsarCommissao2 <> 'S') then
        begin
          vDadosIni.vInibeMensPesqPros := 'S';
          if not vDadosIni.PesqPros('VND172', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, True) then
            edValorUnitarioVendaRapida.Enabled := not CadPedVenda.vItProd.vUsarPrecoCustoTipoVND;
        end;
        MaskEdit7.Enabled := CadPedVenda.vItProd.vProduto.alteraDescricaoProduto;

        if (edValorUnitarioVendaRapida.Enabled) or (MaskEdit7.Enabled) then
        begin
          if CadPedVenda.vItProd.vUsarPrecoCustoTipoVND then
            edValorUnitarioVendaRapida.Valor := CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsCurrency
          else if (CadPedVenda.vItProd.vProduto.dataSet.FieldByName('EM_PROMOCAO').AsString = 'S') and
            (CadPedVenda.vItProd.vProduto.dataSet.FieldByName('PRECO_PROMOCAO').AsCurrency > 0) and (not CadPedVenda.vItProd.vUsarPrecoCustoTipoVND) then
            edValorUnitarioVendaRapida.Valor := CadPedVenda.vItProd.vProduto.dataSet.FieldByName('PRECO_PROMOCAO').AsCurrency
          else if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'Q') then
            edValorUnitarioVendaRapida.Valor := CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsCurrency
          else if CadPedVenda.vItProd._setaPrecoPromocao(0, 0, 0, 0, '') > 0 then
            edValorUnitarioVendaRapida.Valor := CadPedVenda.vItProd.vPrecoPromocaoProd
          else
          	edValorUnitarioVendaRapida.Valor := CadPedVenda.vItProd.vProduto.dataSet.FieldByName('prec_tab_prod').AsCurrency;

          if (UpperCase(trim(CadPedVenda.vItProd.dataSet.FieldByName('UNIDADE').AsString)) <> UpperCase(trim(CadPedVenda.vItProd.dataSet.FieldByName('UNIDADE_CONV').AsString))) then
          begin
            if (CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').AsString = 'M')
            	and (CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
            begin
              edValorUnitarioVendaRapida.Valor :=
                edValorUnitarioVendaRapida.Valor /
                CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat;
            end
            else if (CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').AsString = 'D')
            	and (CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
            begin
              edValorUnitarioVendaRapida.Valor :=
                edValorUnitarioVendaRapida.Valor *
                CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat;
            end;
          end;

          edValorTotalVendaRapida.Valor := CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat *
          	edValorUnitarioVendaRapida.Valor;

          if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'Q') then
            eVlUnit.Valor := CadPedVenda.vItProd.vPrecoProdPorQtde
          else
            eVlUnit.Valor := edValorUnitarioVendaRapida.Valor;

          if (Pos('*', edCodBarra.Text) <= 0) and (CadPedVenda.vItProd.dataSet.FieldByName('PRECOPORQTDE').AsString = 'S') then
          	if CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat > 1 then
              edCodBarra.Text := FloatToStr(CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat) + '*' +
                CadPedVenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString;

          MaskEdit7.Text := trim(CadPedVenda.vItProd.vProduto.dataset.fieldbyname('descr_prod').asstring);
          try
            Screen.Cursor := crDefault;
            edQuantidadeVendaRapida.Enabled := vDadosIni.PesqPros('VND135', 'HABILITAR', '', 'PEDVENDA_PROD', CadPedVenda.dataSet.FieldByName('NPED').AsString + '-' + CadPedVenda.vItProd.dataSet.FieldByName('NITEM').AsString, CadPedVenda.buscas, False);
            edQuantidadeVendaRapida.Valor := CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat;
            //edCodBarra.Enabled := false;

            vDadosIni.montarDbComboboxUndConv(
              CadPedVenda.buscas,
              DBComboBoxUnVendaRapida,
              CadPedVenda.vItProd.dataset.fieldbyname('GRUPO_PROD').AsInteger,
              CadPedVenda.vItProd.dataset.fieldbyname('COD_PROD').AsString,
              CadPedVenda.vItProd.dataset.fieldbyname('NUM_FAB_PROD').AsString,
              vDadosIni.IfThen(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString) <> '',
              	UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString)),
                UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE').AsString))));

            CadPedVenda.vItProd.vUnidade := vDadosIni.IfThen(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString) <> '',
              UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString)),
              UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE').AsString)));

            CadPedVenda.vItProd.vQuantidade := CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat;

            if not vDadosIni.abreForm('Alteração', Panel36, [ofAutoSize, ofEscapeExit]) then
              Exit;
            {pgVendaRapida.ActivePage := tsAlteraPreco;
            tsAlteraPreco.Show;
            if (Self.Enabled) and (Self.Visible) and (edQuantidadeVendaRapida.CanFocus) then
              edQuantidadeVendaRapida.SetFocus
            else if (Self.Enabled) and (Self.Visible) and (EditMoeda5.CanFocus) then
              editMoeda5.SetFocus
            else if (Self.Enabled) and (Self.Visible) and (MaskEdit7.CanFocus) then
              MaskEdit7.SetFocus
            else if (Self.Enabled) and (Self.Visible) and (DBEdit93.CanFocus) then
              DBEdit93.SetFocus;
            while pgVendaRapida.ActivePage = tsAlteraPreco do
            begin
              if clicouNoX then
                abort;
              if PageControl1.ActivePage = TabSheet2 then
                Abort;
              Application.ProcessMessages;
            end;}
            edCodBarra.Enabled := true;
          finally
            Screen.Cursor := crHourGlass;
          end;
        end;
      end
      else if CadPedVenda.getTipoVenda <> 'OS' then
        if (CadPedVenda.ultimosPrecos.ver_na_inclusao_venda_rapida) and (CadPedVenda.vItProd.f_str('tabpraticada') = 'N') then
          bt_ultimos_precos.Click;

      if cancelaAltPreco then
        exit;
      Result := true;
      if (CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'Q') then
        eVlUnit.Valor := CadPedVenda.vItProd.vPrecoProdPorQtde
      else
        eVlUnit.Valor := CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsCurrency;

      if (UpperCase(trim(CadPedVenda.vItProd.dataSet.FieldByName('UNIDADE').AsString)) <> UpperCase(trim(CadPedVenda.vItProd.dataSet.FieldByName('UNIDADE_CONV').AsString))) then
      begin
        if (CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').AsString = 'M')
          and (CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
        begin
          eVlUnit.Valor :=
            eVlUnit.Valor /
            CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat;
        end
        else if (CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').AsString = 'D')
          and (CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
        begin
          eVlUnit.Valor :=
            eVlUnit.Valor *
            CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat;
        end;
      end;

      ldescricao.Caption := CadPedVenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString + ' ' +
        CadPedVenda.vItProd.dataSet.FieldByName('DESCR_PROD_PED').AsString + ' ' +
        UpperCase(trim(CadPedVenda.vItProd.vProduto.dataSet.FieldByName('UNIDADE').AsString));
    end;
  finally
    CadPedVenda.vItProd.dataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.Copiarparareadetransferncia_12Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid12.DataSource.DataSet.FieldByName(DBGrid12.Columns[DBGrid12.SelectedIndex].FieldName).AsString;
end;

procedure TFrmCadPedVenda.Copiarparareadetransferncia_2Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid2.DataSource.DataSet.FieldByName(DBGrid2.Columns[DBGrid2.SelectedIndex].FieldName).AsString;
end;

procedure TFrmCadPedVenda.Copiarparareadetransferncia_3Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid3.DataSource.DataSet.FieldByName(DBGrid3.Columns[DBGrid3.SelectedIndex].FieldName).AsString;
end;

procedure TFrmCadPedVenda.Copiarparareadetransferncia_5Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid5.DataSource.DataSet.FieldByName(DBGrid5.Columns[DBGrid5.SelectedIndex].FieldName).AsString;
end;

procedure TFrmCadPedVenda.Copiarparareadetransferncia_6Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid6.DataSource.DataSet.FieldByName(DBGrid6.Columns[DBGrid6.SelectedIndex].FieldName).AsString;
end;

procedure TFrmCadPedVenda.Copiarparareadetransferncia_7Click(Sender: TObject);
begin
  Clipboard.AsText := DBGrid7.DataSource.DataSet.FieldByName(DBGrid7.Columns[DBGrid7.SelectedIndex].FieldName).AsString;
end;

procedure TFrmCadPedVenda.DBComboBox10Exit(Sender: TObject);
begin
  inherited;
	CadPedVenda.vItProd.atualizarValorLiquido(
  	DBComboBox10,
    DBComboBox11);
end;

procedure TFrmCadPedVenda.DBComboBox11Exit(Sender: TObject);
begin
  inherited;
	CadPedVenda.vItProd.atualizarValorLiquido(
  	DBComboBox10,
    DBComboBox11);
end;

procedure TFrmCadPedVenda.DBComboBox12Exit(Sender: TObject);
begin
  inherited;
	CadPedVenda.vItProd.atualizarValorLiquido(
  	DBComboBox12,
    DBComboBox13);
end;

procedure TFrmCadPedVenda.DBComboBox13Exit(Sender: TObject);
begin
  inherited;
	CadPedVenda.vItProd.atualizarValorLiquido(
  	DBComboBox12,
    DBComboBox13);
end;

procedure TFrmCadPedVenda.DBComboBox14Exit(Sender: TObject);
begin
  inherited;
  CadPedVenda.vItProd.atualizarValorLiquido(
  	DBComboBox14,
    DBComboBox15);
end;

procedure TFrmCadPedVenda.DBComboBox15Exit(Sender: TObject);
begin
  inherited;
	CadPedVenda.vItProd.atualizarValorLiquido(
  	DBComboBox14,
    DBComboBox15);
end;

procedure TFrmCadPedVenda.DBComboBox16Exit(Sender: TObject);
var
	I: Integer;
//  vValorDescAcresc: Double;
  vUnidadeTmp: string;
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn19) or (ActiveControl = BitBtn11) or (clicouNoX) then
    exit;

  if not (CadPedVenda.vItProd.dataSet.State in [dsInsert, dsedit]) then
  	exit;

//  vValorDescAcresc := CadPedVenda.vItProd.dataset.fieldbyname('VALOR_DESCACRES').AsFloat;

  vUnidadeTmp := vDadosIni.IfThen(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString) <> '',
    UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString)),
    UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE').AsString)));

  try
    if (trim(CadPedVenda.vItProd.vUnidade) <> trim(vUnidadeTmp)) then
    begin
    	if not CadPedVenda.vItProd.atualizarUnidadeQtdePrecoUnPorCampoVenda(
        TDBComboBox(Sender).Items[TDBComboBox(Sender).ItemIndex]) then
          Exit;

      if (trim(CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString) <> '')
        and (trim(CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString) <> '') then
      begin
        if not CadPedVenda.vItProd.buscaProduto(
          CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString,
          CadPedVenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger,
          CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString,
          CadPedVenda.vItProd.dataSet.FieldByName('cod_grade').AsInteger,
          false,
          false,
          false) then
        begin
          if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
            TDBEdit(Sender).SetFocus;
          Exit;
        end;
      end;
    end;
  finally
//  	CadPedVenda.vItProd.dataset.fieldbyname('VALOR_DESCACRES').AsFloat := vValorDescAcresc;
  	CadPedVenda.vItProd.vUnidade := trim(vUnidadeTmp);
  end;

  if not verificarUnidadeTabDifPromPrecoQtde(
  	TDBComboBox(Sender).Items[TDBComboBox(Sender).ItemIndex]) then
  begin
  	for I := 0 to TDBComboBox(Sender).Items.Count - 1 do
  	begin
      if UpperCase(trim(TDBComboBox(Sender).Items[I])) = UpperCase(trim(CadPedVenda.vItProd.dataSet.FieldByName('UNIDADE').AsString)) then
      begin
      	TDBComboBox(Sender).ItemIndex := I;
        Break;
      end;
    end;
  end;
end;

procedure TFrmCadPedVenda.DBComboBoxUnVendaRapidaExit(Sender: TObject);
var
	I: Integer;
//  vValorDescAcresc: Double;
  vUnidadeTmp: string;
begin
  inherited;

//  vValorDescAcresc := CadPedVenda.vItProd.dataset.fieldbyname('VALOR_DESCACRES').AsFloat;

  vUnidadeTmp := vDadosIni.IfThen(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString) <> '',
    UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString)),
    UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE').AsString)));

  try
  	if (trim(CadPedVenda.vItProd.vUnidade) <> trim(vUnidadeTmp)) then
    begin
      if not CadPedVenda.vItProd.atualizarUnidadeQtdePrecoUnPorCampoVenda(
        TDBComboBox(Sender).Items[TDBComboBox(Sender).ItemIndex]) then
          Exit;

      if (trim(CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString) <> '')
        and (trim(CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString) <> '') then
      begin
        if not CadPedVenda.vItProd.buscaProduto(
          CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString,
          CadPedVenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger,
          CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString,
          CadPedVenda.vItProd.dataSet.FieldByName('cod_grade').AsInteger,
          false,
          false,
          false) then
        begin
          if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
            TDBEdit(Sender).SetFocus;
          Exit;
        end;
      end;
    end;
  finally
//  	CadPedVenda.vItProd.dataset.fieldbyname('VALOR_DESCACRES').AsFloat := vValorDescAcresc;
    CadPedVenda.vItProd.vUnidade := trim(vUnidadeTmp);
  end;

  edQuantidadeVendaRapida.Valor    := CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat;

  edValorUnitarioVendaRapida.Valor := CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat;

  edValorTotalVendaRapida.Valor    := CadPedvenda.vItProd.dataSet.FieldByName('VLTOT_PED_ITEM').AsFloat;
end;

procedure TFrmCadPedVenda.DBComboBox1Exit(Sender: TObject);
var
  flgl, i: integer;
  tpv: string;
begin
  inherited;
  if not Self.Enabled then
    Exit;

  flgl := 0;
  tpv := trim(CadPedVenda.dataset.FieldByName('TIPV').AsString);
  for i := 0 to DBComboBox1.Items.Count - 1 do
  begin
    if Copy(trim(tpv), 1, 1) = Copy(trim(DBComboBox1.Items[i]), 1, 1) then
    begin
      dbcombobox1.Text := tpv;
      flgl := 1;
      break;
    end;
  end;
  if flgl = 0 then
  begin
    Application.MessageBox('Tipo de Venda não encontrado!', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.setfocus;
    exit;
  end;

  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
    Exit;

  try
  if (activecontrol <> DBEdit4) and (CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger > 0) then
  begin
    if (not CadPedVenda.ChecaTipVendaCliente(DBComboBox1.Text)) then
    begin
//      if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
//        DBComboBox1.SetFocus;
      if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
        DBEdit4.SetFocus;
      exit;
    end;
  end
  else //if (activecontrol <> DBEdit4) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
      DBEdit4.SetFocus;
    exit;
  end;
  finally
  	if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'REQ' then
      atualizarprecoTipoReqOsOrc;
  end;

  CadPedVenda.vItProd._setaVariaveisPromocao(
  	CadPedVenda.vCliente.endAdic.cod_localidade_dest,
    CadPedVenda.vCliente.dataSet.FieldByName('cod_cliente').AsInteger,
    CadPedVenda.vCliente.dataSet.FieldByName('cod_tab_preco').AsInteger,
    CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger,
    CadPedVenda.vCliente.endAdic.cod_cidade_dest,
    CadPedVenda.dataSet.FieldByName('TIPV').AsString);

  if (CadPedVenda.getTipoVenda='REQ') then
  	 CadPedVenda.verificarSalvamentoAutomatico(true);
  if not CadPedVenda.ChecaVendedorVazio then
  begin
    if not CadPedVenda.ChecaTipVendaVendedor then
    begin
      if (uppercase(CadPedVenda.vNomeCampoErro) = 'DBCOMBOBOX1') then
        setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro)
      else if (activecontrol = dbedit5) or (activecontrol = DBLookupComboBox16) then
      begin
        if (Self.Enabled) and (Self.Visible) and (dbedit5.CanFocus) then
	        dbedit5.SetFocus
      end
      else if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
        DBComboBox1.SetFocus;
    end
    else
    begin
      if not CadPedVenda.verificatipovenda(2, DBComboBox1, CadPedVenda.getTipoVenda, DBComboBox1.Text) then
      begin
        Application.MessageBox('Tipo de Venda inválido.', 'Informação', MB_OK + MB_ICONINFORMATION);
        if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
          DBComboBox1.SetFocus;
        exit;
      end;
//      if (ActiveControl<>BitBtn16) and (ActiveControl<>BitBtn17) and (ActiveControl<>BitBtn18) and (ActiveControl<>BitBtn19) then
//        Perform(WM_NEXTDLGCTL, 0, 0);
//					if (Self.Enabled) and (Self.Visible) and (DBComboBox2.CanFocus) then
//            DBComboBox2.SetFocus;
    end;
  end;
end;

procedure TFrmCadPedVenda.DBComboBox3Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
    Exit;
  if CadPedVenda.dataSet.State=dsEdit then
    DBComboBox3.ItemIndex := DBComboBox3.Items.IndexOf(CadPedVenda.dataSet.FieldByName('TIPO_OS').AsString);
  DBComboBox3.Text := DBComboBox3.Items[DBComboBox3.ItemIndex];
  try
    DBGrid3.DataSource.DataSet.DisableControls;
    if CadPedVenda.vItProd.dataSet.RecordCount > 0 then
      if not CadPedVenda.verificaColaboradorProdutos(true, false,true) then
      begin
        setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);
        exit;
      end;
  finally
    DBGrid3.DataSource.DataSet.EnableControls;
  end;
  CadPedVenda.verificarSalvamentoAutomatico(true);
  if CadPedVenda.getTipoVenda='REQ' then
    CadPedVenda.vItProd.vUsarPrecoCustoTipoVND := CadPedVenda.vItProd._usarPrecoCustoTiposVendas(CadPedVenda.getTipoVenda, CadPedVenda.dataSet.FieldByName('TIPV').AsString)
  else if CadPedVenda.getTipoVenda='OS' then
    CadPedVenda.vItProd.vUsarPrecoCustoTipoVND := CadPedVenda.vItProd._usarPrecoCustoTiposVendas(CadPedVenda.getTipoVenda, CadPedVenda.dataSet.FieldByName('TIPO_OS').AsString)
  else
    CadPedVenda.vItProd.vUsarPrecoCustoTipoVND:=false;
  if CadPedVenda.ExecutaComandosSql('select * from tipo_vendas tv where tv.tipo_os=' +
    QuotedStr(dbcombobox3.Text) + ' and tv.tipo =' +
    QuotedStr(CadPedVenda.getTipoVenda) + ' and tv.comgarantia=''S''') then
  begin
    label48.visible := true;
    label49.visible := true;
    label50.visible := true;
    DBEdit35.visible := true;
    DBEdit36.visible := true;
    DBEdit37.visible := true;
//    Label190.visible := false;
//    DBEdit130.visible := false;
//    DBLookupComboBox30.visible := false;
  end
  else
  begin
    label48.visible := false;
    label49.visible := false;
    label50.visible := false;
    DBEdit35.visible := false;
    DBEdit36.visible := false;
    DBEdit37.visible := false;
    Label190.visible := true;
    DBEdit130.visible := true;
    DBLookupComboBox30.visible := true;
  end;

	if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'OS' then
  	atualizarprecoTipoReqOsOrc;
end;

procedure TFrmCadPedVenda.DBComboBox5Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
    Exit;
  if not CadPedVenda.verificaColaboradorProdutos(true, false,true) then
    setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);

  if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'ORC' then
  	atualizarprecoTipoReqOsOrc;

  CadPedVenda.verificarSalvamentoAutomatico(true);
end;

procedure TFrmCadPedVenda.DBComboBox6Exit(Sender: TObject);
begin
  inherited;
	CadPedVenda.vItProd.atualizarValorLiquido(
  	DBComboBox6,
    DBComboBox7);
end;

procedure TFrmCadPedVenda.DBComboBox7Exit(Sender: TObject);
begin
  inherited;
	CadPedVenda.vItProd.atualizarValorLiquido(
  	DBComboBox6,
    DBComboBox7);
end;

procedure TFrmCadPedVenda.DBComboBox9Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
    Exit;
  if not CadPedVenda.verificatipoorc(DBComboBox9.Text) then
  begin
    Application.MessageBox('Tipo Orçamento inválido.', 'Informação', MB_OK + MB_ICONINFORMATION);
    if (Self.Enabled) and (Self.Visible) and (DBComboBox9.CanFocus) then
	    DBComboBox9.SetFocus;
    exit;
  end;

  if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'ORC' then
  	atualizarprecoTipoReqOsOrc;
  
  CadPedVenda.verificarSalvamentoAutomatico(true);
end;

procedure TFrmCadPedVenda.DBEdit103Exit(Sender: TObject);
begin
  inherited;
  if (CadPedVenda.cargaFechada) and (CadPedVenda.dataSet.State in [dsInsert, dsEdit]) then
  begin
    Application.MessageBox('Carga já fechada', 'Atenção', 0 + 64);
    CadPedVenda.dataSet.FieldByName('cod_carga').Value := null;
  end;
end;

procedure TFrmCadPedVenda.DBEdit106KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.dataSet.FieldByName('COD_CONTROLE').AsString := vDadosIni.pesquisaRapida('CONTROLES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit107KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.dataSet.FieldByName('COD_CONTROLE').AsString := vDadosIni.pesquisaRapida('CONTROLES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit108Exit(Sender: TObject);
begin
  inherited;
  if ActiveControl = BitBtn71 then
    Exit;

//  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox27.CanFocus) then
//	  DBLookupComboBox27.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit108KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsString := vDadosIni.pesquisaRapida('COND_PAG');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit10Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn19) or (ActiveControl = BitBtn11) or (clicouNoX) then
    exit;

  if not (CadPedVenda.vItProd.dataSet.State in [dsInsert, dsedit]) then
  	exit;
    
  try
    if (CadPedVenda.vItProd.vQuantidade <> CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat) then
    begin
    	if not CadPedVenda.vItProd.atualizarUnidadeQtdePrecoUnPorCampoVenda then
  		  Exit;

      if (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
         or ((CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'P') and (vDadosIni.vPedVnd.ExibirDesconto.PrecoPromocao = 'S'))
         or ((CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'T') and (vDadosIni.vPedVnd.ExibirDesconto.PrecoDiferenciado = 'S'))
         or ((CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'Q') and (vDadosIni.vPedVnd.ExibirDesconto.PrecoQtde = 'S'))
         or ((CadPedVenda.vItProd._existePrecoPorQtde(CadPedVenda.dataSet.FieldByName('TIPV').AsString))
              and (trim(CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString) <> '')
              and (trim(CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString) <> '')) then
      begin
        if not CadPedVenda.vItProd.buscaProduto(
          CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString,
          CadPedVenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger,
          CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString,
          CadPedVenda.vItProd.dataSet.FieldByName('cod_grade').AsInteger,
          false,
          false,
          false) then
        begin
          if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
            TDBEdit(Sender).SetFocus;
          Exit;
        end;
      end;
    end;
  finally
  	CadPedVenda.vItProd.vQuantidade := CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat;
  end;

  if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'T') then
  begin
  	vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit14.ReadOnly := not vDadosIni.PesqPros('VND297', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False);
    DBEdit51.ReadOnly := DBEdit14.ReadOnly;
    edValorUnitarioVendaRapida.ReadOnly := DBEdit14.ReadOnly;
  end
  else if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'P') then
  begin
  	vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit14.ReadOnly := not vDadosIni.PesqPros('VND298', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False);
    DBEdit51.ReadOnly := DBEdit14.ReadOnly;
    edValorUnitarioVendaRapida.ReadOnly := DBEdit14.ReadOnly;
  end
  else if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'Q') then
  begin
  	vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit14.ReadOnly := not vDadosIni.PesqPros('VND299', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False);
    DBEdit51.ReadOnly := DBEdit14.ReadOnly;
    edValorUnitarioVendaRapida.ReadOnly := DBEdit14.ReadOnly;
  end
  else                                                              
  begin
    DBEdit14.ReadOnly := not ((CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'P')
    	and (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'T')
      and (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'Q'));

//    if (not DBEdit14.ReadOnly) and (CadPedVenda.vItProd.dataSet.FieldByName('precoporqtde').AsString = 'S') then
//      DBEdit14.ReadOnly := not vDadosIni.vPedVnd.alterarPrecoProdutosQtde;

    DBEdit51.ReadOnly := DBEdit14.ReadOnly;
    edValorUnitarioVendaRapida.ReadOnly := DBEdit14.ReadOnly;
  end;
  DBEdit16.ReadOnly := DBEdit14.ReadOnly;

  if DBEdit14.Enabled then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('VND172', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, True) then
    begin
      if CadPedVenda.getTipoVenda = 'REQ' then
      begin
        DBEdit14.ReadOnly := CadPedVenda.vItProd._usarPrecoCustoTiposVendas('REQ', CadPedVenda.dataSet.FieldByName('TIPV').AsString);
        DBEdit51.ReadOnly := DBEdit14.ReadOnly;
        edValorUnitarioVendaRapida.ReadOnly := DBEdit14.ReadOnly;
      end
      else if Trim(CadPedVenda.getTipoVenda) = 'OS' then
      begin
        DBEdit14.ReadOnly := CadPedVenda.vItProd._usarPrecoCustoTiposVendas('OS', CadPedVenda.dataSet.FieldByName('TIPO_OS').AsString);
        DBEdit51.ReadOnly := DBEdit14.ReadOnly;
        edValorUnitarioVendaRapida.ReadOnly := DBEdit14.ReadOnly;
      end;
    end;
  end;

//  if not DBEdit14.ReadOnly then
//    DBEdit14Exit(DBEdit14);
end;

procedure TFrmCadPedVenda.DBEdit117Exit(Sender: TObject);
var
	vTabPraticada: string;
begin
  inherited;
  if (activecontrol = bitbtn68) or (activecontrol = bitbtn50) then
    Exit;

  if CadPedVenda.vendaFechada then
    exit;

  vTabPraticada := CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString;

  if not verificarDescontoTabDifPromPrecoQtde(
  	CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('VLUN_ORIG').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString,
    CadPedVenda.vItProd.dataSet.FieldByName('NAT_DESCACRES').AsString,
    CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsFloat) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (TDBEdit(sender).CanFocus) then
    	TDBEdit(sender).SetFocus;
    exit;
  end;

  if not CadPedVenda.vItProd._validarAlteracaoPrecoUnitario(vTabPraticada) then
  begin
    if (Self.Enabled) and (Self.Visible) and (TDBEdit(sender).CanFocus) then
    	TDBEdit(sender).SetFocus;
    exit;
  end;

  if not CadPedVenda.vItProd.checaValoresItens then
    if (Self.Enabled) and (Self.Visible) and (DBEdit117.CanFocus) then
	    DBEdit117.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit118Enter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit120.CanFocus) then
	  DBEdit120.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit119Exit(Sender: TObject);
begin
//  try
//  	Screen.Cursor := crHourGlass;
//  	BitBtn47.Enabled := false;
//    BitBtn53.Enabled := false;
//
//    if not CadPedVenda.vCtrl.LocControlesFP(CadPedVenda.dataSet.FieldByName('COD_CONTROLE').AsInteger,
//    	Trim(CadPedVenda.vCliente.dataSet.FieldByName('controles_fp').AsString)) then
//    begin
//      if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
//        TDbedit(sender).SetFocus;
//      exit;
//    end;
//  finally
//    BitBtn47.Enabled := true;
//    BitBtn53.Enabled := true;
//    Screen.Cursor := crDefault;
//  end;
end;

procedure TFrmCadPedVenda.DBEdit119KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.dataSet.FieldByName('COD_CONTROLE').AsString := vDadosIni.pesquisaRapida('CONTROLES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit120Exit(Sender: TObject);
begin
  inherited;
//  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox21.CanFocus) then
//	  DBLookupComboBox21.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit121Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox22.CanFocus) then
	  DBLookupComboBox22.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit122Exit(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if (CadPedVenda.vItProd.dataSet.State in [dsinsert, dsedit]) then
      Exit;
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
      Exit;
//    CadPedVenda.vOpPag.Refresh;
    CadPedVenda.vRVnd.vCodRegras := '()';
    CadPedVenda.vRVnd.vRVndSel.montaSelect(' select first 0 * from regras_vendas rv ' +
    	' where rv.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and rv.ativo = 1 ' +
      ' order by rv.cod_regravnd ');
    
    if not CadPedVenda.calculaDescontoAcrescimo then
      if CadPedVenda.vNomeCampoErro <> '' then
        setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro)
      else if Sender is TWinControl then
        if (Self.Enabled) and (Self.Visible) and (TWinControl(Sender).CanFocus) then
          TWinControl(Sender).SetFocus;
    Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
	  eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;

//    label201.Visible := false;
//    label255.Visible := false;
    CadPedVenda._abreRegraCondicoesPolitica(ckListaTodasPoliticas.Checked);
    CadPedVenda._validaDescontoRegraVND(ckListaTodasPoliticas.Checked);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.DBEdit124Exit(Sender: TObject);
begin
  inherited;
  if not (CadPedVenda.dataSet.State in[dsInsert, dsEdit]) then
    Exit;

  CadPedVenda.dataSet.FieldByName('cpfcgc').AsString := Trim(CadPedVenda.dataSet.FieldByName('cpfcgc').AsString);
  if CadPedVenda.dataSet.FieldByName('cpfcgc').AsString <> '' then
    if Length(CadPedVenda.dataSet.FieldByName('cpfcgc').AsString) = 11 then
    begin
      if not CadPedVenda.Cpf(CadPedVenda.dataSet.FieldByName('cpfcgc').AsString) then
      begin
        Application.MessageBox('CPF inválido', 'Atenção', 0 + 64);
        if (Self.Enabled) and (Self.Visible) and (DBEdit124.CanFocus) then
        	DBEdit124.SetFocus;
        Exit;
      end;
    end
    else if Length(CadPedVenda.dataSet.FieldByName('cpfcgc').AsString) = 14 then
    begin
      if not CadPedVenda.cgc(CadPedVenda.dataSet.FieldByName('cpfcgc').AsString) then
      begin
        Application.MessageBox('CNPJ inválido', 'Atenção', 0 + 64);
        if (Self.Enabled) and (Self.Visible) and (DBEdit124.CanFocus) then
        	DBEdit124.SetFocus;
        Exit;
      end;
    end
    else
    begin
      Application.MessageBox('CPF ou CNPJ inválido', 'Atenção', 0 + 64);
      if (Self.Enabled) and (Self.Visible) and (DBEdit124.CanFocus) then
      	DBEdit124.SetFocus;
      Exit;
    end;
end;

procedure TFrmCadPedVenda.DBEdit126Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
    Exit;
  if CadPedVenda.vendaFechada then
    exit;
  if activecontrol = DBComboBox1 then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus;
    exit;
  end;
  if not CadPedVenda.ChecaParticipante then
  begin
    if (uppercase(CadPedVenda.vNomeCampoErro) = 'DBCOMBOBOX1') then
      setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro)
    else
    begin
      if (Self.Enabled) and (Self.Visible) and (DBEdit126.CanFocus) then
        DBEdit126.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
        DBEdit4.setfocus;
    end;
  end;
//  else
//  begin
//    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox37.CanFocus) then
//      DBLookupComboBox37.SetFocus
//    else
//      Perform(WM_NEXTDLGCTL, 0, 0);
//     if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
//        DBEdit4.setfocus;
//  end;
end;

procedure TFrmCadPedVenda.DBEdit126KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.dataSet.FieldByName('COD_VENDEDOR1').AsString := vDadosIni.pesquisaRapida('PARTICIPANTE');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit127Exit(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if (activecontrol = BitBtnCabCancelar) or (clicouNoX) then
      Exit;

    BitBtnCabOK.Enabled := false;
	  BitBtnCabCancelar.Enabled := false;

  //  if not CadPedVenda.vItProd.dataSet.Active then
    	CadPedVenda.vItProd.vListarImprimirItemVan := CadPedVenda.retornaVendaTipoVan;
      CadPedVenda.vItProd.abrePedVendaProd(cadpedvenda.dataSet.FieldByName('nped').AsInteger);
    if not CadPedVenda.ChecaParticipante then
    begin
      if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
        TDbedit(sender).SetFocus;
      exit;
    end;
  finally
  	BitBtnCabOK.Enabled := true;
    BitBtnCabCancelar.Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.DBEdit127KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.dataSet.FieldByName('COD_VENDEDOR1').AsString := vDadosIni.pesquisaRapida('PARTICIPANTE');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit128Exit(Sender: TObject);
begin
  inherited;
	if not CadPedVenda.vItProd.atualizarValorAcresc(
  	DBComboBox6,
    DBComboBox7,
    'COMISSAOVEND') then
  begin
  	if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
      TDBEdit(Sender).SetFocus;
    Exit;
  end;
end;

procedure TFrmCadPedVenda.DBEdit129Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (activecontrol = bitbtn11)
    or (activecontrol = bitbtn19) or (clicouNoX) then
    Exit;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox29.CanFocus) then
	  DBLookupComboBox29.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit130Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
    Exit;

//  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox30.CanFocus) then
//	  DBLookupComboBox30.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit130KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsString := vDadosIni.pesquisaRapida('COND_PAG');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit134Exit(Sender: TObject);
begin
  inherited;
  //  if not CadPedVenda.vItProd.validaAcresDescNoItem(DBComboBox6.Text, DBComboBox7.Text, CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency) then
//  begin
//    if (Self.Enabled) and (Self.Visible) and (DBEdit134.CanFocus) then
//    	DBEdit134.setfocus;
//    exit;
//  end;
	if not CadPedVenda.vItProd.atualizarValorAcresc(
  	DBComboBox10,
    DBComboBox11,
    'ACRESCIMO') then
  begin
  	if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
      TDBEdit(Sender).SetFocus;
    Exit;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBEdit11.CanFocus) and (DBEdit11.Visible) and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'ORC')) then
    DBEdit11.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit19.CanFocus) and (DBEdit19.Visible) and ((CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC')) then
  	DBEdit19.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit151.CanFocus) and (DBEdit151.Visible) and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'ORC')) then
  	DBEdit151.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) and (BitBtn16.Visible) and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'ORC')) then
    BitBtn16.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) and (BitBtn8.Visible) and ((CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC')) then
    BitBtn8.SetFocus
end;

procedure TFrmCadPedVenda.DBEdit135Exit(Sender: TObject);
begin
  inherited;
//  if not CadPedVenda.vItProd.validaAcresDescNoItem(DBComboBox6.Text, DBComboBox7.Text, CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency) then
//  begin
//		if (Self.Enabled) and (Self.Visible) and (DBEdit135.CanFocus) then
//    	DBEdit135.setfocus;
//    exit;
//  end;
	if not CadPedVenda.vItProd.atualizarValorAcresc(
  	DBComboBox12,
    DBComboBox13,
    'ACRESCIMO') then
  begin
  	if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
      TDBEdit(Sender).SetFocus;
    Exit;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBEdit11.CanFocus) and (DBEdit11.Visible) and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'ORC')) then
    DBEdit11.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit19.CanFocus) and (DBEdit19.Visible) and ((CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC')) then
  	DBEdit19.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit151.CanFocus) and (DBEdit151.Visible) and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'ORC')) then
  	DBEdit151.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) and (BitBtn16.Visible) and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'ORC')) then
    BitBtn16.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) and (BitBtn8.Visible) and ((CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC')) then
    BitBtn8.SetFocus
end;

procedure TFrmCadPedVenda.DBEdit136Exit(Sender: TObject);
begin
  inherited;
//  if not CadPedVenda.vItProd.validaAcresDescNoItem(DBComboBox6.Text, DBComboBox7.Text, CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency) then
//  begin
//		if (Self.Enabled) and (Self.Visible) and (DBEdit136.CanFocus) then
//    	DBEdit136.setfocus;
//    exit;
//  end;
	if not CadPedVenda.vItProd.atualizarValorAcresc(
  	DBComboBox14,
    DBComboBox15,
    'ACRESCIMO') then
  begin
  	if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
      TDBEdit(Sender).SetFocus;
    Exit;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBEdit11.CanFocus) and (DBEdit11.Visible) and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'ORC')) then
    DBEdit11.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit19.CanFocus) and (DBEdit19.Visible) and ((CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC')) then
  	DBEdit19.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit151.CanFocus) and (DBEdit151.Visible) and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'ORC')) then
  	DBEdit151.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) and (BitBtn16.Visible) and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'ORC')) then
    BitBtn16.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) and (BitBtn8.Visible) and ((CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC')) then
    BitBtn8.SetFocus
end;

procedure TFrmCadPedVenda.DBEdit138KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    TDBEdit(Sender).Text := '99/99/9999';
    TDBEdit(Sender).Clear;
  end;
end;

procedure TFrmCadPedVenda.DBEdit13Exit(Sender: TObject);
begin
  inherited;
//  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn19) or
//    (ActiveControl = BitBtn11) or (clicouNoX) then
//    exit;
//  if CadPedVenda.vendaFechada then
//    exit;
//  if not CadPedVenda.existeCFOP(CadPedVenda.vItProd.dataSet.FieldByName('codigo_nop').AsFloat) then
//  begin
//    if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
//	    TDBEdit(Sender).SetFocus;
//    exit;
//  end;
end;

procedure TFrmCadPedVenda.DBEdit141Exit(Sender: TObject);
begin
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn32) or
    (clicouNoX) then
    exit;
  if CadPedVenda.vendaFechada then
    exit;

 if (CadPedVenda.vItProdTerc.dataSet.State in [dsInsert, dsEdit]) then
 begin
   CadPedVenda.vItProdTerc.dataSet.FieldByName('vlcusto_tot').AsCurrency :=
     CadPedVenda.vItProdTerc.dataSet.FieldByName('qtde').AsFloat *
       CadPedVenda.vItProdTerc.dataSet.FieldByName('vlcusto').AsCurrency;
 end;
end;

procedure TFrmCadPedVenda.DBEdit142Exit(Sender: TObject);
begin
  if ActiveControl <> BitBtn5 then
  begin
    if trim(TDbedit(sender).text) = '' then
    begin
      try
        Screen.Cursor := crHourGlass;
        try
          vDadosIni.vPesquisaCodEmpresa := StrToInt(vDadosIni.codEmpresa);
          vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES', ' and (tipo=''F'' or tipo=''A'') ',
          	'Consulta de Fornecedores');
        finally
          vDadosIni.vPesquisaCodEmpresa := 0;
        end;
        if (Trim(vDadosIni.vPesquisa) = '') then
          vDadosIni.vPesquisa := '0';
        CadPedVenda.vItProdTerc.dataSet.FieldByName('COD_FORNECEDOR').AsInteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;

    if trim(TDbedit(sender).text) <> '' then
    begin
      if not CadPedVenda.vItProdTerc._locFornecedor(CadPedVenda.vItProdTerc.dataSet.FieldByName('COD_FORNECEDOR').AsInteger) then
      begin
        setFocusCampoErro(CadPedVenda.vItProdTerc.vNomeCampoErro);
        exit;
      end;
    end;
  end;
end;

procedure TFrmCadPedVenda.DBEdit142KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    if key = VK_F3 then
    begin
      Screen.Cursor := crHourGlass;
      try
        vDadosIni.vPesquisaCodEmpresa := StrToInt(vDadosIni.codEmpresa);
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES', ' and (tipo=''F'' or tipo=''A'') ', 'Consulta de Fornecedores');
      finally
        vDadosIni.vPesquisaCodEmpresa := 0;
      end;
      if (Trim(vDadosIni.vPesquisa) <> '') then
        CadPedVenda.vItProdTerc.dataSet.FieldByName('COD_FORNECEDOR').AsInteger := strtoint(vDadosIni.vPesquisa);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.DBEdit145Exit(Sender: TObject);
begin
  if ActiveControl <> BitBtn5 then
  begin
    if trim(TDbedit(sender).text) = '' then
    begin
      try
        Screen.Cursor := crHourGlass;
        try
          vDadosIni.vPesquisaCodEmpresa := StrToInt(vDadosIni.codEmpresa);
          vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES', ' and (tipo=''F'' or tipo=''A'') ',
          	'Consulta de Fornecedores');
        finally
          vDadosIni.vPesquisaCodEmpresa := 0;
        end;
        if (Trim(vDadosIni.vPesquisa) = '') then
          vDadosIni.vPesquisa := '0';
        CadPedVenda.vItServTerc.dataSet.FieldByName('COD_FORNECEDOR').AsInteger := strtoint(vDadosIni.vPesquisa);
      finally
        Screen.Cursor := crDefault;
      end;
    end;

    if trim(TDbedit(sender).text) <> '' then
    begin
      if not CadPedVenda.vItServTerc._locFornecedor(CadPedVenda.vItServTerc.dataSet.FieldByName('COD_FORNECEDOR').AsInteger) then
      begin
        setFocusCampoErro(CadPedVenda.vItServTerc.vNomeCampoErro);
        exit;
      end;
    end;
  end;
end;

procedure TFrmCadPedVenda.DBEdit145KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  try
    if key = VK_F3 then
    begin
      Screen.Cursor := crHourGlass;
      try
        vDadosIni.vPesquisaCodEmpresa := StrToInt(vDadosIni.codEmpresa);
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES', ' and (tipo=''F'' or tipo=''A'') ',
        	'Consulta de Fornecedores');
      finally
        vDadosIni.vPesquisaCodEmpresa := 0;
      end;
      if (Trim(vDadosIni.vPesquisa) <> '') then
        CadPedVenda.vItServTerc.dataSet.FieldByName('COD_FORNECEDOR').AsInteger := strtoint(vDadosIni.vPesquisa);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.DBEdit147Exit(Sender: TObject);
begin
  inherited;
	try
    Screen.Cursor := crHourGlass;
    if (CadPedVenda.vItProd.dataSet.State in [dsinsert, dsedit]) then
      Exit;
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
      Exit;
//    CadPedVenda.vOpPag.Refresh;
    CadPedVenda.vRVnd.vCodRegras := '()';
    CadPedVenda.vRVnd.vRVndSel.montaSelect(' select first 0 * from regras_vendas rv ' +
    	' where rv.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and rv.ativo = 1 ' +
      ' order by rv.cod_regravnd ');

    if not CadPedVenda.calculaDescontoAcrescimo then
      if CadPedVenda.vNomeCampoErro <> '' then
        setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro)
      else if Sender is TWinControl then
        if (Self.Enabled) and (Self.Visible) and (TWinControl(Sender).CanFocus) then
          TWinControl(Sender).SetFocus;
    Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
//    Label61.Caption := Format('%m', [CadPedVenda.getValorServicoTerceiro]);
//    Label82.Caption := Format('%m', [CadPedVenda.getValorProdutoTerceiro]);
    eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;

//    label201.Visible := false;
//    label255.Visible := false;
    CadPedVenda._abreRegraCondicoesPolitica(ckListaTodasPoliticas.Checked);
    CadPedVenda._validaDescontoRegraVND(ckListaTodasPoliticas.Checked);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.DBEdit14Enter(Sender: TObject);
begin
  inherited;
//  if DBEdit14.ReadOnly then
//  begin
//  	Perform(WM_NEXTDLGCTL, 0, 0);
//    DBEdit14.Enabled := false;
//  end;
end;

procedure TFrmCadPedVenda.DBEdit14Exit(Sender: TObject);
var
	vTabPraticada: string;
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn19) or (ActiveControl = BitBtn11) or (clicouNoX) then
    exit;

  if not (CadPedVenda.vItProd.dataSet.State in [dsInsert, dsedit]) then
  	exit;

  if CadPedVenda.vendaFechada then
    exit;

  vTabPraticada := CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString;

  if not verificarDescontoTabDifPromPrecoQtde(
  	CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('VLUN_ORIG').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString,
    CadPedVenda.vItProd.dataSet.FieldByName('NAT_DESCACRES').AsString,
    CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsFloat) then
  begin
    if (Self.Enabled) and (Self.Visible) and (TDBEdit(sender).CanFocus) then
      TDBEdit(sender).SetFocus;
    exit;
  end;

  if not CadPedVenda.vItProd._validarAlteracaoPrecoUnitario(vTabPraticada) then
  begin
    if (Self.Enabled) and (Self.Visible) and (TDBEdit(sender).CanFocus) then
    	TDBEdit(sender).SetFocus;
    exit;
  end;

  if not CadPedVenda.vItProd.checaValoresItens then
    setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);
end;

procedure TFrmCadPedVenda.DBEdit150Exit(Sender: TObject);
begin
  inherited;
	if not CadPedVenda.vItProd.atualizarValorAcresc(
  	DBComboBox10,
    DBComboBox11,
    'COMISSAOVEND') then
  begin
  	if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
      TDBEdit(Sender).SetFocus;
    Exit;
  end;
end;

procedure TFrmCadPedVenda.DBEdit151Exit(Sender: TObject);
begin
  inherited;
	if not CadPedVenda.vItProd.atualizarValorAcresc(
  	DBComboBox12,
    DBComboBox13,
    'COMISSAOVEND') then
  begin
  	if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
      TDBEdit(Sender).SetFocus;
    Exit;
  end;
end;

procedure TFrmCadPedVenda.DBEdit15Enter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBComboBox6.CanFocus) then
	  DBComboBox6.setfocus;
  //  ComboBox4.SetFocus;
  //  if Sender is TDBedit then
  //
  //  else
  //  if (Self.Enabled) and (Self.Visible) and (DBEdit11.CanFocus) then
  //    dbedit11.SetFocus
  //  else if (BitBtn16.Enabled) and (BitBtn16.Visible) and (CadPedVenda.getTipoVenda = 'REQ') then
  //	begin
	//    if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) then
  //    	BitBtn16.SetFocus
  //	end
  //  else if (BitBtn8.Enabled) and (BitBtn8.Visible) and (CadPedVenda.getTipoVenda = 'OS') then
  //	begin
  //		if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) then
  //    	BitBtn8.SetFocus
  //	end
  //  else if (BitBtn8.Enabled) and (BitBtn8.Visible) and (CadPedVenda.getTipoVenda = 'ORC') then
  //	begin
  //    BitBtn8.SetFocus;
  //	end
end;

procedure TFrmCadPedVenda.DBEdit16Enter(Sender: TObject);
begin
  inherited;
  if DBEdit16.ReadOnly then
  begin
  	Perform(WM_NEXTDLGCTL, 0, 0);
    DBEdit16.Enabled := false;
  end;
end;

procedure TFrmCadPedVenda.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn19) or (clicouNoX) then
    exit;

  if not (CadPedVenda.vItProd.dataSet.State in [dsInsert, dsedit]) then
  	exit;

  if CadPedVenda.vendaFechada then
    exit;

  if not verificarDescontoTabDifPromPrecoQtde(
  	CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('VLUN_ORIG').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString,
    CadPedVenda.vItProd.dataSet.FieldByName('NAT_DESCACRES').AsString,
    CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsFloat,
    False) then
  begin
    if (Self.Enabled) and (Self.Visible) and (TDBEdit(sender).CanFocus) then
      TDBEdit(sender).SetFocus;
    exit;
  end;

  if not CadPedVenda.vItProd._atualizarValorNFUnitario then
  begin
    if (Self.Enabled) and (Self.Visible) and (TDBEdit(sender).CanFocus) then
    	TDBEdit(sender).SetFocus;
    exit;
  end;

  CadPedVenda.vItProd.definirValorNF;
end;

procedure TFrmCadPedVenda.DBEdit20Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (dbedit92.CanFocus) then
    DBEdit92.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) and (BitBtn16.Visible) and (CadPedVenda.getTipoVenda = 'REQ') then
    BitBtn16.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) and (BitBtn8.Visible) and (CadPedVenda.getTipoVenda = 'OS') then
    BitBtn8.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) and (BitBtn8.Visible) and (CadPedVenda.getTipoVenda = 'ORC') then
    BitBtn8.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit25Enter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn4.CanFocus) then
    BitBtn4.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit26Exit(Sender: TObject);
begin
  inherited;
  CadPedVenda._setaHEntrada;
end;

procedure TFrmCadPedVenda.DBEdit27Exit(Sender: TObject);
begin
  inherited;
  CadPedVenda._setaHPrometida;
end;

procedure TFrmCadPedVenda.DBEdit32Exit(Sender: TObject);
begin
  inherited;
  if CadPedVenda.vendaFechada then
    Exit;
  if TDBEdit(sender).Text = '' then
    Exit;
  if not CadPedVenda.buscaVeiculo(TDBEdit(sender).Text, TDBEdit(sender).Tag, Memo1) then
    if (Self.Enabled) and (Self.Visible) and (TDBEdit(sender).CanFocus) then
    	TDBEdit(sender).SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit32KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vVeic: TVeiculos;
begin
  inherited;
  if Key = VK_F4 then
  begin
  	try
      vVeic := TVeiculos.create;
      vVeic.CadVeiculos(1);
      if vDadosIni.vPesquisa <> '' then
        CadPedVenda.buscaVeiculo(vDadosIni.vPesquisa, 0, Memo1, vDadosIni.vPesquisaPlaca, vDadosIni.vPesquisaChassi);
    finally
    	if Assigned(vVeic) then
      	FreeAndNil(vVeic);
    end;
  end
  else if key = vk_f3 then
    BitBtn7Click(BitBtn7);
end;

procedure TFrmCadPedVenda.DBEdit33Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit27.CanFocus) then
    DBEdit27.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit38KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vVeic: TVeiculos;
begin
  inherited;
  if Key = VK_F4 then
  begin
  	try
      vVeic := TVeiculos.create;
      vVeic.CadVeiculos(1);
      if vDadosIni.vPesquisa <> '' then
        CadPedVenda.buscaVeiculo(vDadosIni.vPesquisa, 0, Memo1, vDadosIni.vPesquisaPlaca, vDadosIni.vPesquisaChassi);
    finally
      if Assigned(vVeic) then
      	FreeAndNil(vVeic);
    end;
  end
  else if key = vk_f3 then
    BitBtn7Click(BitBtn7);
end;

procedure TFrmCadPedVenda.DBEdit41Exit(Sender: TObject);
begin
  inherited;
  if not(CadPedVenda.dataSet.State in [dsEdit, dsInsert]) then
    exit;

  if Trim(DBEdit41.Text) = '' then
  begin
    CadPedVenda.fdata('APARELHO_PED').SetNull;
    Memo2.Lines.Clear;
    Exit;
  end;

  if (ActiveControl <> BitBtn21) and (DBEdit41.Text <> '') then
  begin
    if not CadPedVenda.buscaAparelho(CadPedVenda.dataSet.FieldByName('COD_EQUIP').AsInteger, Memo2) then
      if (Self.Enabled) and (Self.Visible) and (DBEdit41.CanFocus) then
	      DBEdit41.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.DBEdit41KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vEquip: TEquipamentos;
begin
  inherited;
  if Key = VK_F4 then
  begin
  	try
      vEquip := TEquipamentos.create;
      vEquip.CadEquipamentos(1);
      if vDadosIni.vPesquisa <> '' then
        CadPedVenda.buscaAparelho(StrToInt(vDadosIni.vPesquisa), Memo2);
    finally
      if Assigned(vEquip) then
      	FreeAndNil(vEquip);
    end;
  end
  else if key = VK_F3 then
    BitBtn21Click(sender);
end;

procedure TFrmCadPedVenda.DBEdit42KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.dataSet.FieldByName('COD_VENDEDOR').AsString := vDadosIni.pesquisaRapida('COLABORADOR');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit44KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.vItProd.dataSet.FieldByName('COD_SEG_SERV').AsString := vDadosIni.pesquisaRapida('SERVICOS_EMP');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit45Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (activecontrol = bitbtn11) or (clicouNoX) then
    Exit;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox4.CanFocus) then
	  DBLookupComboBox4.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit45KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      if vDadosIni.vEmp.vUsarAparelho = 'S' then
      	CadPedVenda.vItProd.dataSet.FieldByName('COL_COD_VENDEDOR').AsString :=
          vDadosIni.pesquisaRapida(
            'COLABORADOR',
            ' AND COLABORADOR.COD_FUNCAO IN (SELECT FUNCOES.COD_FUNCAO FROM FUNCOES ' +
            '																 WHERE ((FUNCOES.DESC_FUNCAO = ''TECNICO'') ' +
            '																 OR (FUNCOES.DESC_FUNCAO = ''TÉCNICO''))) ',
            'Consulta de Técnico')
      else
        CadPedVenda.vItProd.dataSet.FieldByName('COL_COD_VENDEDOR').AsString :=
          vDadosIni.pesquisaRapida(
            'COLABORADOR',
            ' AND COLABORADOR.COD_FUNCAO IN (SELECT FUNCOES.COD_FUNCAO FROM FUNCOES ' +
            '																 WHERE ((FUNCOES.DESC_FUNCAO = ''MECANICO'') ' +
            '																 OR (FUNCOES.DESC_FUNCAO = ''MECÂNICO''))) ',
            'Consulta de Mecânico');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit48KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vProd: TProdutos;
begin
  inherited;
  if Key = VK_F4 then
  begin
  	try
      vProd := TProdutos.create;
      vProd.CadSubGrupos(1);
      CadPedVenda.vItServ.vSubG.Refresh;
    finally
      if Assigned(vProd) then
      	FreeAndNil(vProd);
    end;
  end;
end;

procedure TFrmCadPedVenda.DBEdit49Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox20.CanFocus) then
	  DBLookupComboBox20.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	AProcedure: Tcl_cadCliente;
begin
  inherited;
  if TDBEdit(sender)<> DBEdit88 then
  begin
    if CadPedVenda.vendaFechada then
      exit;
  end;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.pesquisaRapida('CLIENTES');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
  	try
    	if vDadosIni.vCliente.AHandle = 0 then
        CarregaPacote('pkClientes', vDadosIni.vCliente.AHandle);

      if vDadosIni.vCliente.AHandle = 0 then
      begin
        Application.MessageBox('Pacote Cliente não carregado', 'Anteção', 0 + 64);
        Exit;
      end;

      @AProcedure := GetProcAddress(vDadosIni.vCliente.AHandle, 'cl_cadCliente');

      if Assigned(AProcedure) then
        AProcedure(
          1);

      if vDadosIni.vPesquisa <> '' then
        CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
    finally
    end;

//  	try
//      vCliente := TCadClientes.create;
//      vCliente.CadCliente(1);
//      if vDadosIni.vPesquisa <> '' then
//        CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
//    finally
//      if Assigned(vCliente) then
//      	FreeAndNil(vCliente);
//    end;
  end;
end;

procedure TFrmCadPedVenda.DBEdit51Enter(Sender: TObject);
begin
  inherited;
//	if DBEdit51.ReadOnly then
//  begin
//  	Perform(WM_NEXTDLGCTL, 0, 0);
//    DBEdit51.Enabled := false;
//  end;
end;

procedure TFrmCadPedVenda.DBEdit53Enter(Sender: TObject);
begin
  inherited;
  //  if CadPedVenda.vItProd.ProdutoPossuiGrade(CadPedVenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger, CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString) then
  //    CadPedVenda.vItProd.SelecionaGradeProd;
end;

procedure TFrmCadPedVenda.DBEdit53Exit(Sender: TObject);
begin
  inherited;
  {if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (activecontrol = bitbtn28) or (clicouNoX) then
    Exit;
  CadPedVenda.vItProd.buscaProduto(
  	CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString,
    0,
    '',
    CadPedVenda);
  if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
  	DBEdit10.SetFocus;
  DBEdit53.enabled:=false;}
end;

procedure TFrmCadPedVenda.DBEdit54KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.vItProd.dataSet.FieldByName('COD_VENDEDOR').AsString :=
      	vDadosIni.pesquisaRapida(
          'COLABORADOR',
          ' AND COLABORADOR.COD_FUNCAO IN (SELECT FUNCOES.COD_FUNCAO FROM FUNCOES ' +
          '																 WHERE (FUNCOES.DESC_FUNCAO = ''VENDEDOR'')) ',
          'Consulta de Vendedor')
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit55Exit(Sender: TObject);
begin
  inherited;
  try
    if (CadPedVenda.vItProd.vQuantidade <> CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat) then
    begin
    	if not CadPedVenda.vItProd.atualizarUnidadeQtdePrecoUnPorCampoVenda then
  		  Exit;

      if (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
         or ((CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'P') and (vDadosIni.vPedVnd.ExibirDesconto.PrecoPromocao = 'S'))
         or ((CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'T') and (vDadosIni.vPedVnd.ExibirDesconto.PrecoDiferenciado = 'S'))
         or ((CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'Q') and (vDadosIni.vPedVnd.ExibirDesconto.PrecoQtde = 'S'))
         or ((CadPedVenda.vItProd._existePrecoPorQtde(CadPedVenda.dataSet.FieldByName('TIPV').AsString))
              and (trim(CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString) <> '')
              and (trim(CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString) <> '')) then
      begin
        if not CadPedVenda.vItProd.buscaProduto(
          CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString,
          CadPedVenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger,
          CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString,
          CadPedVenda.vItProd.dataSet.FieldByName('cod_grade').AsInteger,
          false,
          false,
          false) then
        begin
          if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
            TDBEdit(Sender).SetFocus;
          Exit;
        end;
      end;
    end;
  finally
  	CadPedVenda.vItProd.vQuantidade := CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat;
  end;

  DBEdit117.Enabled := (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'P') and
  	(CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'T') and
  	(CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'Q');

//  if (DBEdit117.Enabled) and (CadPedVenda.vItProd.dataSet.FieldByName('precoporqtde').AsString = 'S') then
//      DBEdit117.Enabled := vDadosIni.vPedVnd.alterarPrecoProdutosQtde;

  if not DBEdit117.Enabled then
    DBEdit117Exit(DBEdit14);
end;

procedure TFrmCadPedVenda.DBEdit56Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (activecontrol = bitbtn28) or (clicouNoX) then
    Exit;

  if (activecontrol <> DBLookupComboBox6) then
    DBLookupComboBox6Exit(DBLookupComboBox6);
    
  if (((vDadosIni.vEmp.vAgendaOficina = 'S') and (vDadosIni.vEmp.vUsarDisponibilidadeOS = 'A') and (CadPedVenda.vItServ.dataSet.FieldByName('COD_SERVICO').AsInteger > 0))
    or ((vDadosIni.vEmp.vAgendaOficina = 'S') and (CadPedVenda.dataSet.FieldByName('COD_AGENDA').AsInteger > 0))) then
    CadPedVenda.vItServ.abreMecanicos(CadPedVenda.vItServ.dataSet.FieldByName('COD_SERVICO').AsInteger);
end;

procedure TFrmCadPedVenda.DBEdit56KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vTipServ: TTipoServ;
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.vItServ.dataSet.FieldByName('COD_SERVICO').AsString := vDadosIni.pesquisaRapida('SERVICOS_EMP');
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if Key = VK_F4 then
  begin
  	try
      vTipServ := TTipoServ.create;
      vTipServ.CadTipoServ(1);
      CadPedVenda.vItServ.vTipServ.Refresh;
    finally
      if Assigned(vTipServ) then
      	FreeAndNil(vTipServ);
    end;
  end;
end;

procedure TFrmCadPedVenda.DBEdit57Exit(Sender: TObject);
begin
  inherited;
	if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn28) or (clicouNoX) then
    exit;
  if CadPedVenda.vendaFechada then
    exit;
  if not CadPedVenda.vItServ.checaValoresItens then
    if (Self.Enabled) and (Self.Visible) and (DBEdit57.CanFocus) then
	    DBEdit57.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit58Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn28) or (clicouNoX) then
    exit;
  if CadPedVenda.vendaFechada then
    exit;
  if not CadPedVenda.vItServ.checaValoresItens then
    setFocusCampoErro(CadPedVenda.vItServ.vNomeCampoErro, CadPedVenda.vItServ.vMensagemErro);
//    DBEdit58.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit59Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (activecontrol = bitbtn28) or (clicouNoX) then
    Exit;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox5.CanFocus) then
	  DBLookupComboBox5.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit59KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      if vDadosIni.vEmp.vUsarAparelho = 'S' then
        CadPedVenda.vItServ.dataSet.FieldByName('COD_VENDEDOR').AsString :=
          vDadosIni.pesquisaRapida(
            'COLABORADOR',
            ' AND COLABORADOR.COD_FUNCAO IN (SELECT FUNCOES.COD_FUNCAO FROM FUNCOES ' +
            '																 WHERE ((FUNCOES.DESC_FUNCAO = ''TECNICO'') ' +
            '																 OR (FUNCOES.DESC_FUNCAO = ''TÉCNICO''))) ',
            'Consulta de Técnico')
      else
        CadPedVenda.vItServ.dataSet.FieldByName('COD_VENDEDOR').AsString :=
          vDadosIni.pesquisaRapida(
            'COLABORADOR',
            ' AND COLABORADOR.COD_FUNCAO IN (SELECT FUNCOES.COD_FUNCAO FROM FUNCOES ' +
            '																 WHERE ((FUNCOES.DESC_FUNCAO = ''MECANICO'') ' +
            '																 OR (FUNCOES.DESC_FUNCAO = ''MECÂNICO''))) ',
            'Consulta de Mecânico');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit5Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
    Exit;

  if CadPedVenda.vendaFechada then
    Exit;

  if not (CadPedVenda.dataSet.State in [dsinsert, dsedit]) then
  	Exit;

  if CadPedVenda.dataSet.FieldByName('COD_VENDEDOR').AsInteger <= 0 then
  	CadPedVenda.vCodVendedorExit := CadPedVenda.dataSet.FieldByName('COD_VENDEDOR').AsInteger
  else
  begin
    if CadPedVenda.vCodVendedorExit = CadPedVenda.dataSet.FieldByName('COD_VENDEDOR').AsInteger then
      Exit;
  end;

  if activecontrol = DBComboBox1 then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus;
    exit;
  end;
  if not CadPedVenda.ChecaTipVendaVendedor then
  begin
    if (uppercase(CadPedVenda.vNomeCampoErro) = 'DBCOMBOBOX1') then
      setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro)
    else
    begin
      if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
        DBEdit5.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
        DBEdit4.setfocus;
    end;
  end
  else
  begin
    if not CadPedVenda.verPendenciaVenda(CadPedVenda.dataSet.FieldByName('COD_VENDEDOR').AsInteger, CadPedVenda.dataSet.FieldByName('TIPV').AsString) then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
        DBEdit5.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (dbedit4.CanFocus) then
        dbedit4.setfocus
      else if (Self.Enabled) and (Self.Visible) and (DBEdit70.CanFocus) then
        DBEdit70.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (dbedit67.CanFocus) then
        dbedit67.setfocus;
      exit;
    end;
//    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox16.CanFocus) then
//      DBLookupComboBox16.SetFocus
//    else
//      Perform(WM_NEXTDLGCTL, 0, 0);
//         DBEdit4.setfocus;
  end;

  CadPedVenda.vCodVendedorExit := CadPedVenda.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
end;

procedure TFrmCadPedVenda.DBEdit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.dataSet.FieldByName('COD_VENDEDOR').AsString := vDadosIni.pesquisaRapida('COLABORADOR');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit60Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (activecontrol = bitbtn28) or (clicouNoX) then
    Exit;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox7.CanFocus) then
	  DBLookupComboBox7.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit60KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.vItServ.dataSet.FieldByName('COD_VENDEDOR1').AsString := vDadosIni.pesquisaRapida('COLABORADOR');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit62Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn28) or (clicouNoX) then
    exit;
  if CadPedVenda.vendaFechada then
    exit;
  if not CadPedVenda.vItServ.validaAlteracaoPrecoServ then
  begin
    setFocusCampoErro(CadPedVenda.vItServ.vNomeCampoErro, CadPedVenda.vItServ.vMensagemErro);
    exit;
  end;
  if not CadPedVenda.vItServ.checaValoresItens then
    if (Self.Enabled) and (Self.Visible) and (DBEdit57.CanFocus) then
	    DBEdit57.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit68Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn32) or
    (clicouNoX) then
    exit;
  if CadPedVenda.vendaFechada then
    exit;

 if (CadPedVenda.vItProdTerc.dataSet.State in [dsInsert, dsEdit]) then
 begin
   CadPedVenda.vItProdTerc.dataSet.FieldByName('vl_total').AsCurrency :=
     CadPedVenda.vItProdTerc.dataSet.FieldByName('qtde').AsFloat *
       CadPedVenda.vItProdTerc.dataSet.FieldByName('vl_unit').AsCurrency;

   CadPedVenda.vItProdTerc.dataSet.FieldByName('vlcusto_tot').AsCurrency :=
     CadPedVenda.vItProdTerc.dataSet.FieldByName('qtde').AsFloat *
       CadPedVenda.vItProdTerc.dataSet.FieldByName('vlcusto').AsCurrency;
 end;
end;

procedure TFrmCadPedVenda.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsString := vDadosIni.pesquisaRapida('COND_PAG');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit70Exit(Sender: TObject);
begin
  inherited;
  if ActiveControl = BitBtn71 then
    Exit;

  if CadPedVenda.vendaFechada then
    Exit;

  if not (CadPedVenda.dataSet.State in [dsinsert, dsedit]) then
  	Exit;

  if CadPedVenda.dataSet.FieldByName('COD_VENDEDOR').AsInteger <= 0 then
  	CadPedVenda.vCodVendedorExit := CadPedVenda.dataSet.FieldByName('COD_VENDEDOR').AsInteger
  else
  begin
    if CadPedVenda.vCodVendedorExit = CadPedVenda.dataSet.FieldByName('COD_VENDEDOR').AsInteger then
      Exit;
  end;

  if not CadPedVenda.ChecaTipVendaVendedor then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit70.CanFocus) then
      DBEdit70.SetFocus;
  end;

  if (CadPedVenda.vCodVendedorOld <= 0) then
     CadPedVenda.vCodVendedorOld := CadPedVenda.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
//  else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox26.CanFocus) then
//    DBLookupComboBox26.SetFocus;

	CadPedVenda.vCodVendedorExit := CadPedVenda.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
end;

procedure TFrmCadPedVenda.DBEdit70KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.dataSet.FieldByName('COD_VENDEDOR').AsString := vDadosIni.pesquisaRapida('COLABORADOR');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit71Exit(Sender: TObject);
begin
  inherited;
  if (ActiveControl = BitBtn5) or (ActiveControl = BitBtn6) or (ActiveControl = BitBtn32) or
    (clicouNoX) then
    exit;
  if CadPedVenda.vendaFechada then
    exit;
  if not CadPedVenda.vItProdTerc.checaValoresItens then
    setFocusCampoErro(CadPedVenda.vItProdTerc.vNomeCampoErro, CadPedVenda.vItProdTerc.vMensagemErro);
end;

procedure TFrmCadPedVenda.DBEdit73Enter(Sender: TObject);
begin
  inherited;
  if (BitBtn29.CanFocus) and (BitBtn29.Visible) and (CadPedVenda.getTipoVenda = 'OS') then
    BitBtn29.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit74KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.vItProdTerc.dataSet.FieldByName('COD_VENDEDOR').AsString := vDadosIni.pesquisaRapida('COLABORADOR');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit75Exit(Sender: TObject);
begin
  inherited;
  if not CadPedVenda.vItProd.atualizarValorAcresc(
  	DBComboBox14,
    DBComboBox15,
    'COMISSAOVEND') then
  begin
  	if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
      TDBEdit(Sender).SetFocus;
    Exit;
  end;
end;

procedure TFrmCadPedVenda.DBEdit76Enter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit77.CanFocus) then
	  DBEdit77.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit78Enter(Sender: TObject);
begin
  inherited;
  if not (CadPedVenda.vItProd.dataSet.State in [dsEdit, dsInsert]) then
    CadPedVenda.vItProd.Insert;
end;

procedure TFrmCadPedVenda.DBEdit88Exit(Sender: TObject);
var
	vAtualizarCl: Boolean; 
begin
	try
  	Screen.Cursor := crHourGlass;

    if (activecontrol = BitBtnCabCancelar) or (clicouNoX) then
      Exit;
      
  	BitBtnCabOK.Enabled := false;
    BitBtnCabCancelar.Enabled := false;

    if TDbedit(sender).text = '' then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
        if (Trim(vDadosIni.vPesquisa) = '') then
          vDadosIni.vPesquisa := '0';
        if vDadosIni.vPesquisa <> '' then
          CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
      finally
        Screen.Cursor := crDefault;
      end;
    end;

    if TDbedit(sender).text <> '' then
    begin
      if not CadPedVenda.vCliente.LocCliente(CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
      begin
        try
        	if CadPedVenda.vCliente.possivelCli then
	        begin
            Screen.Cursor := crHourGlass;
            vDadosIni.vPesquisa := CadPedVenda.dataSet.FieldByName('cod_cliente').AsString;
            CadPedVenda.cadCliente(2);
          end;
        finally
          Screen.Cursor := crDefault;
        end;
        if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
          TDbedit(sender).SetFocus;
        exit;
      end;
    end;

    if trim(TDbedit(sender).Text) = '' then
    begin
      Application.MessageBox('Campo Cliente não pode ser vazio', 'Informação', MB_OK +
        MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
        TDbedit(sender).setfocus;
      exit;
    end;

    if (CadPedVenda.getTipoVenda <> 'ORC') then
    begin
    	if (CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
      begin
      	CadPedVenda.vCliente.abreClientes(CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger);
        if not CadPedVenda.vCliente.dataSet.IsEmpty then
        begin
        	vAtualizarCl := False;

          if (vDadosIni.vEmp.vFinanceiroUnificado)
            and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
          begin
            if trim(CadPedVenda.vCliente.dataSet.FieldByName('CPFCGC').AsString) <> '' then
              if (vDadosIni.negativarClientes(0, trim(CadPedVenda.vCliente.dataSet.FieldByName('CPFCGC').AsString))) then
                vAtualizarCl := True;
          end
          else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
          begin
          	if (vDadosIni.negativarClientes(CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger, '')) then
            	vAtualizarCl := True;
          end;

          if (vDadosIni.baixarRecAntValeCompra(CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger)) then
          	vAtualizarCl := True;

          if (vAtualizarCl) then
          	CadPedVenda.vCliente.dataSet.Refresh;
        end;
      end;

      if not CadPedVenda.vCliente.dataSet.FieldByName('CODIGO_FATURAMENTO').IsNull then
        if CadPedVenda.vCliente.faturamentoBarrado(CadPedVenda.vCliente.dataSet.FieldByName('CODIGO_FATURAMENTO').AsInteger) then
        begin
          if not vDadosIni.PesqPros('VND049', 'LIBERAR', CadPedVenda.dataSet.FieldByName('COD_CLIENTE').asstring + ' ' +
            CadPedVenda.vCliente.dataSet.FieldByName('NOME_CLIENTE').AsString, 'PEDVENDA',
            CadPedVenda.dataSet.FieldByName('NPED').asstring, CadPedVenda.buscas, True) then
          begin
            if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
              TDbedit(sender).setfocus;
            Exit;
          end
          else
          begin
            if Application.MessageBox('Deseja realmente alterar para este cliente?', 'Confirmação', MB_YESNO +
              MB_DEFBUTTON1) = mrNO then
            begin
              if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
                TDbedit(sender).setfocus;
              Exit;
            end;
          end;
        end;
    end;

    if not CadPedVenda.ChecaTipVendaCliente(DBComboBox1.Text) then
      if not vDadosIni.PesqPros('VND050', 'LIBERAR', CadPedVenda.dataSet.FieldByName('COD_CLIENTE').asstring + ' ' +
        CadPedVenda.vCliente.dataSet.FieldByName('NOME_CLIENTE').AsString, 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').asstring, CadPedVenda.buscas, True) then
      begin
        if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
          TDbedit(sender).setfocus;
        Exit;
      end
      else
      begin
        if Application.MessageBox('Deseja realmente alterar para este cliente?', 'Confirmação', MB_YESNO +
          MB_DEFBUTTON1) = mrNO then
        begin
          if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
            TDbedit(sender).setfocus;
          Exit;
        end;
      end;

    if CadPedVenda._habilitarFormPag then
    begin
      Label196.Visible := True;
      DBEdit119.Visible := True;
      DBLookupComboBox35.Visible := True;
  //    SpeedButton39.Visible := True;
    end
    else
    begin
      Label196.Visible := False;
      DBEdit119.Visible := False;
      DBLookupComboBox35.Visible := False;
  //    SpeedButton39.Visible := False;
    end;
  finally
    BitBtnCabOK.Enabled := true;
    BitBtnCabCancelar.Enabled := true;
    Screen.Cursor := crDefault;
  end;

end;

procedure TFrmCadPedVenda.DBEdit89Enter(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (DBEdit29.CanFocus) then
	  DBEdit29.SetFocus;
end;

procedure TFrmCadPedVenda.DBEdit8Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (activecontrol = bitbtn11) or (clicouNoX) then
    Exit;
end;

procedure TFrmCadPedVenda.DBEdit90Exit(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;

    if (activecontrol = BitBtnCabCancelar) or (clicouNoX) then
      Exit;
      
    BitBtnCabOK.Enabled := false;
    BitBtnCabCancelar.Enabled := false;

  //  if not CadPedVenda.vItProd.dataSet.Active then
  	  CadPedVenda.vItProd.vListarImprimirItemVan := CadPedVenda.retornaVendaTipoVan;
      CadPedVenda.vItProd.abrePedVendaProd(cadpedvenda.dataSet.FieldByName('nped').AsInteger);
    if not CadPedVenda.ChecaVendedorVazio then
    begin
      if not CadPedVenda.ChecaTipVendaVendedor then
      begin
        if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
          TDbedit(sender).SetFocus;
        exit;
      end;
    end
    else
    begin
      if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
      	TDbedit(sender).SetFocus;
    end;
    if not CadPedVenda.vItProd.dataSet.IsEmpty then
      if not CadPedVenda.verificaColaboradorProdutos(true, false) then
      begin
        if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
          TDbedit(sender).SetFocus;
        exit;
      end;

  finally
  	BitBtnCabOK.Enabled := true;
    BitBtnCabCancelar.Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.DBEdit90KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      CadPedVenda.dataSet.FieldByName('COD_VENDEDOR').AsString := vDadosIni.pesquisaRapida('COLABORADOR');
    finally
      Screen.Cursor := crDefault;
    end;
  end
end;

procedure TFrmCadPedVenda.DBEdit91Exit(Sender: TObject);
begin
  inherited;
  if ActiveControl <> BitBtn82 then
    SpeedButton33Click(Self);
end;

procedure TFrmCadPedVenda.DBEdit93Exit(Sender: TObject);
begin
  inherited;
  //  if (ActiveControl = BitBtn73) or (clicouNoX) then
  //    exit;
  //  if not CadPedVenda.vItProd.checaValoresItens then
  //    setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro);
end;

procedure TFrmCadPedVenda.DBEdit95Exit(Sender: TObject);
begin
  inherited;
//  if not CadPedVenda.vItProd.validaAcresDescNoItem(DBComboBox6.Text, DBComboBox7.Text, CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency) then
//  begin
//		if (Self.Enabled) and (Self.Visible) and (DBEdit95.CanFocus) then
//    	DBEdit95.setfocus;
//    exit;
//  end;
	if not CadPedVenda.vItProd.atualizarValorAcresc(
  	DBComboBox6,
    DBComboBox7,
    'ACRESCIMO') then
  begin
  	if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
      TDBEdit(Sender).SetFocus;
    Exit;
  end;

  if (Self.Enabled) and (Self.Visible) and (DBEdit11.CanFocus) and (DBEdit11.Visible) and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'ORC')) then
    DBEdit11.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit19.CanFocus) and (DBEdit19.Visible) and ((CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC')) then
  	DBEdit19.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit151.CanFocus) and (DBEdit151.Visible) and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'ORC')) then
  	DBEdit151.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) and (BitBtn16.Visible) and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'ORC')) then
    BitBtn16.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) and (BitBtn8.Visible) and ((CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC')) then
    BitBtn8.SetFocus
end;

procedure TFrmCadPedVenda.DBEdit9Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn19) or (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or
    (ActiveControl = BitBtn11) or (clicouNoX) or not(CadPedVenda.vItProd.dataSet.State in [dsInsert, dsEdit])  then
    Exit;
  if CadPedVenda.vendaFechada then
    exit;
  if TDBEdit(Sender).Text = '' then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if (vDadosIni.vPesquisa = '') or (vDadosIni.vPesquisa = '0') then
        exit;
      if CadPedVenda.vItProd.dataSet.State in [dsInsert, dsEdit] then
        if vDadosIni.vPesquisa <> '' then
        begin
          CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString := vDadosIni.vPesquisa;
          if trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
          	CadPedVenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger := StrToInt(vDadosIni.vPesquisaGrupo_prod);
          if trim(vDadosIni.vPesquisaCod_prod) <> '' then
          	CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString := vDadosIni.vPesquisaCod_prod;
        end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;

  if trim(TDBEdit(Sender).Text) <> '' then
  begin
  	try
      if not CadPedVenda.vItProd.buscaProduto(
        CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString,
        0,
        '') then
      begin
        if vDadosIni.getCampoPipe(CadPedVenda.vItProd.vNomeCampoErro, 1) = 'ITEMREPETIDO' then
          verificarItemRepetido(vDadosIni.getCampoPipe(CadPedVenda.vItProd.vNomeCampoErro, 2))
        else
        begin
          if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
            TDBEdit(Sender).SetFocus;
          Exit;
        end;
      end
      else
      begin
        vDadosIni.montarDbComboboxUndConv(
          CadPedVenda.buscas,
          DBComboBox16,
          CadPedVenda.vItProd.dataset.fieldbyname('GRUPO_PROD').AsInteger,
          CadPedVenda.vItProd.dataset.fieldbyname('COD_PROD').AsString,
          CadPedVenda.vItProd.dataset.fieldbyname('NUM_FAB_PROD').AsString,
          vDadosIni.IfThen(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString) <> '',
            UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString)),
            UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE').AsString))));

        vDadosIni.montarDbComboboxUndConv(
          CadPedVenda.buscas,
          DBComboBox17,
          CadPedVenda.vItProd.dataset.fieldbyname('GRUPO_PROD').AsInteger,
          CadPedVenda.vItProd.dataset.fieldbyname('COD_PROD').AsString,
          CadPedVenda.vItProd.dataset.fieldbyname('NUM_FAB_PROD').AsString,
          vDadosIni.IfThen(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString) <> '',
            UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString)),
            UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE').AsString))));
      end;
    finally
    	CadPedVenda.vItProd.vQuantidade :=
      	CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat;

      CadPedVenda.vItProd.vUnidade    :=
      	vDadosIni.IfThen(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString) <> '',
          UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE_CONV').AsString)),
          UpperCase(trim(CadPedVenda.vItProd.dataset.fieldbyname('UNIDADE').AsString)));
    end;
  end
  else
  begin
    if not (Sender is TSpeedButton) then
      if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
	      TDBEdit(Sender).SetFocus;
    Exit;
  end;

  if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'T') then
  begin
  	vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit14.Enabled := vDadosIni.PesqPros('VND297', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False);
    DBEdit51.Enabled := DBEdit14.Enabled;
    edValorUnitarioVendaRapida.Enabled := DBEdit14.Enabled;
  end
  else if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'P') then
  begin
  	vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit14.Enabled := vDadosIni.PesqPros('VND298', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False);
    DBEdit51.Enabled := DBEdit14.Enabled;
    edValorUnitarioVendaRapida.Enabled := DBEdit14.Enabled;
  end
  else if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'Q') then
  begin
  	vDadosIni.vInibeMensPesqPros := 'S';
    DBEdit14.Enabled := vDadosIni.PesqPros('VND299', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False);
    DBEdit51.Enabled := DBEdit14.Enabled;
    edValorUnitarioVendaRapida.Enabled := DBEdit14.Enabled;
  end
  else
  begin
    DBEdit14.Enabled := (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'P')
    	and (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'T')
      and (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'Q');

//    if (DBEdit14.Enabled) and (CadPedVenda.vItProd.dataSet.FieldByName('precoporqtde').AsString = 'S') then
//      DBEdit14.Enabled := vDadosIni.vPedVnd.alterarPrecoProdutosQtde;

    DBEdit51.Enabled := DBEdit14.Enabled;
    edValorUnitarioVendaRapida.Enabled := DBEdit14.Enabled;
  end;
  DBEdit16.Enabled := DBEdit14.Enabled;
  if DBEdit14.Enabled then
  begin
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('VND172', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, True) then
      DBEdit14.Enabled := not CadPedVenda.vItProd.vUsarPrecoCustoTipoVND;
  end;

  if CadPedVenda.getTipoVenda <> 'OS' then
    if (CadPedVenda.ultimosPrecos.ver_na_inclusao_normal) and (CadPedVenda.vItProd.f_str('tabpraticada') = 'N') then
      bt_ultimos_precos.Click;

  if DBEdit51.Enabled then
    DBEdit51.Enabled := DBEdit14.Enabled;

  if (TDBEdit(Sender) = DBEdit9) and (CadPedVenda.vItProd.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
	    DBEdit10.SetFocus;
  end
  else if (TDBEdit(Sender) = DBEdit46) and (CadPedVenda.vItProd.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if CadPedVenda.OrcamentoSoPecas then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
		    DBEdit10.SetFocus;
    end
    else if (Self.Enabled) and (Self.Visible) and (DBEdit47.CanFocus) then
	    DBEdit47.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) then
      BitBtn16.SetFocus;
//    Panel15.Enabled := false;
  end
  else if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) then
  begin
  	if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) then
      BitBtn8.SetFocus;
    Panel16.Enabled := false;
  end;

end;

procedure TFrmCadPedVenda.DBEdit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vProduto: TProdutos;
begin
  inherited;
  if CadPedVenda.vendaFechada then
    exit;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if (vDadosIni.vPesquisa = '') or (vDadosIni.vPesquisa = '0') then
        exit;
      if CadPedVenda.vItProd.dataSet.State in [dsInsert, dsEdit] then
      	if vDadosIni.vPesquisa <> '' then
        begin
          CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString := vDadosIni.vPesquisa;
          if trim(vDadosIni.vPesquisaGrupo_prod) <> '' then
            CadPedVenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger := StrToInt(vDadosIni.vPesquisaGrupo_prod);
          if trim(vDadosIni.vPesquisaCod_prod) <> '' then
            CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString := vDadosIni.vPesquisaCod_prod;
        end;
    finally
      Screen.Cursor := crDefault;
    end;
//    if CadPedVenda.getTipoVenda = 'REQ' then
//      DBEdit9Exit(DBEdit9)
//    else if (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC') then
//      DBEdit9Exit(DBEdit46);
  end
  else if key = VK_F4 then
  begin
  	try
      vProduto := TProdutos.create;
      vProduto.CadProdutos(1);
      if (vDadosIni.vPesquisa <> '') then
        CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString := vDadosIni.vPesquisa;
    finally
      if Assigned(vProduto) then
      	FreeAndNil(vProduto);
    end;
  end;
end;

procedure TFrmCadPedVenda.DBGrid10CellClick(Column: TColumn);
begin
  inherited;
	if (Column.FieldName = 'SEL') or (Column.FieldName = 'SELEC') then
  	CadPedVenda.SelecionarItemProdParaMesclar;
end;

procedure TFrmCadPedVenda.DBGrid10DblClick(Sender: TObject);
begin
  inherited;
  CadPedVenda.SelecionarItemProdParaMesclar;
end;

procedure TFrmCadPedVenda.DBGrid10DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  //If Column.FieldName = 'Status' then //Remova esta linha se você quer destacar toda a linha
  if Column.Field.Dataset.FieldbyName('STATUS').AsString <> 'CANCELADO' then
  begin
    if ((Column.FieldName = 'VLUN_PED_ITEM')
    	or (Column.FieldName = 'VLUN_PED_ITEM_LIQ')
      or (Column.FieldName = 'VLUN_PED_ITEM_CONV')
      or (Column.FieldName = 'VLUN_PED_ITEM_CONV_LIQ')
      or (Column.FieldName = 'TABPRATICADA')) then
    begin
      if ((CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'P') or
          (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'Q') or
          (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'T')) then
      begin
        if (gdFocused in State) then
          TDBGrid(sender).Canvas.Font.Color := clWhite
        else if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'P') then
        begin
  //        TDBGrid(sender).Canvas.Font.Color := clGreen
          TDBGrid(sender).Canvas.Brush.Color := clGreen;
          TDBGrid(sender).Canvas.FillRect(Rect);
        end
        else if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'Q') then
        begin
  //        TDBGrid(sender).Canvas.Font.Color := clGreen
          TDBGrid(sender).Canvas.Brush.Color := $00FFFFD2;
          TDBGrid(sender).Canvas.FillRect(Rect);
        end
        else
  //        TDBGrid(sender).Canvas.Font.Color := clHighlight;
          TDBGrid(sender).Canvas.Brush.Color := clGradientActiveCaption;//clHighlight;
        TDBGrid(sender).Canvas.FillRect(Rect);
        TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
      end;
    end;
  end;

  if Column.Field.Dataset.FieldbyName('STATUS').AsString = 'CANCELADO' then
  begin
    if (gdFocused in State) {//Verifica se a célula está no foco.} then
      TDBGrid(sender).canvas.brush.color := clGray
        //      dbgrid12.canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    //Agora vamos colorir a célula utilizando o método Defaut:
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end
  else if (UpperCase(trim(Column.FieldName)) = 'QUANT_ITEM_DEV')
    and  (Column.Field.Dataset.FieldbyName('QUANT_ITEM_DEV').AsInteger > 0) then
  begin
    TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    TDBGrid(sender).Canvas.Font.Color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
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

	if TDBGrid(sender).DataSource.DataSet.FieldByName('SELEC').AsString = 'S' then
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
  
  if (Column.FieldName = 'SEL') or (Column.FieldName = 'SELEC') then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 22 then
      Column.Width := 22;

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
end;

procedure TFrmCadPedVenda.DBGrid10Exit(Sender: TObject);
begin
  inherited;
  if DBGrid10.DataSource.DataSet.State = dsEdit then
    DBGrid10.DataSource.DataSet.Post;
end;

procedure TFrmCadPedVenda.DBGrid10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    CadPedVenda.SelecionarItemProdParaMesclar
  else if Key = VK_RETURN then
  	if DBGrid10.DataSource.DataSet.State = dsEdit then
	    DBGrid10.DataSource.DataSet.Post;
end;

procedure TFrmCadPedVenda.DBGrid10KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_DOWN then
    if DBGrid10.DataSource.DataSet.FieldByName('NPED').IsNull then
      DBGrid10.DataSource.DataSet.Cancel;
end;

procedure TFrmCadPedVenda.DBGrid11CellClick(Column: TColumn);
begin
  inherited;
	if (Column.FieldName = 'SEL') or (Column.FieldName = 'SELEC') then
  	CadPedVenda.SelecionarItemServParaMesclar;
end;

procedure TFrmCadPedVenda.DBGrid11DblClick(Sender: TObject);
begin
  inherited;
  CadPedVenda.SelecionarItemServParaMesclar;
end;

procedure TFrmCadPedVenda.DBGrid11DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  //If Column.FieldName = 'Status' then //Remova esta linha se você quer destacar toda a linha
  if Column.Field.Dataset.FieldbyName('Status').AsString = 'CANCELADO' then
  begin
    if (gdFocused in State) {//Verifica se a célula está no foco.} then
      TDBGrid(sender).canvas.brush.color := clGray
        //      dbgrid12.canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    //Agora vamos colorir a célula utilizando o método Defaut:
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end
  else if (UpperCase(trim(Column.FieldName)) = 'QUANT_ITEM_DEV')
    and  (Column.Field.Dataset.FieldbyName('QUANT_ITEM_DEV').AsInteger > 0) then
  begin
    TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    TDBGrid(sender).Canvas.Font.Color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
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

	if TDBGrid(sender).DataSource.DataSet.FieldByName('SELEC').AsString = 'S' then
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
  
  if (Column.FieldName = 'SEL') or (Column.FieldName = 'SELEC') then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 22 then
      Column.Width := 22;

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
end;

procedure TFrmCadPedVenda.DBGrid11Exit(Sender: TObject);
begin
  inherited;
  if DBGrid11.DataSource.DataSet.State = dsEdit then
    DBGrid11.DataSource.DataSet.Post;
end;

procedure TFrmCadPedVenda.DBGrid11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    CadPedVenda.SelecionarItemServParaMesclar;
end;

procedure TFrmCadPedVenda.DBGrid11KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_DOWN then
    if DBGrid11.DataSource.DataSet.FieldByName('NPED').IsNull then
      DBGrid11.DataSource.DataSet.Cancel;
end;

procedure TFrmCadPedVenda.DBGrid12CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    if pgVendaRapida.ActivePage = tsCancelarItens then
      CadPedVenda.vItProd._marcarDesmarcaItem
end;

procedure TFrmCadPedVenda.DBGrid12ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(
  	DBGrid12,
    GridCfg12,
    cdsGrid12,
    cdsColunas12,
    vusuario,
    ListGridsAndDataSets12,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet12);
  TemColunasComPosicaoAlteradas12  := True;
end;

procedure TFrmCadPedVenda.DBGrid12DblClick(Sender: TObject);
begin
  inherited;
  if pgVendaRapida.ActivePage = tsCancelarItens then
    CadPedVenda.vItProd._marcarDesmarcaItem;
end;

procedure TFrmCadPedVenda.DBGrid12DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  //If Column.FieldName = 'Status' then //Remova esta linha se você quer destacar toda a linha
  if Column.Field.Dataset.FieldbyName('STATUS').AsString <> 'CANCELADO' then
  begin
  	if (gdFocused in State) then
    begin
      TDBGrid(sender).Canvas.Font.Color := clWhite;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
    else if (Column.Field.Dataset.FieldbyName('QUANT_DEV_ITEM_TEMP').AsFloat > 0)
      and (Column.Field.Dataset.FieldbyName('QUANT_DEV_ITEM_TEMP').AsFloat >= Column.Field.Dataset.FieldbyName('QUANT_PED_ITEM').AsFloat) then
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00C1FFC1);
      TDBGrid(sender).Canvas.Font.Color  := clWindowText;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
    else if (Column.Field.Dataset.FieldbyName('QUANT_DEV_ITEM_TEMP').AsFloat > 0) then
    begin
      TDBGrid(sender).canvas.brush.color := TColor($0095FFFF);
      TDBGrid(sender).Canvas.Font.Color  := clWindowText;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end;

    if ((Column.FieldName = 'VLUN_PED_ITEM')
    	or (Column.FieldName = 'VLUN_PED_ITEM_LIQ')
      or (Column.FieldName = 'VLUN_PED_ITEM_CONV')
      or (Column.FieldName = 'VLUN_PED_ITEM_CONV_LIQ')
      or (Column.FieldName = 'TABPRATICADA')) then
    begin
      if ((CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'P') or
          (CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'Q') or
          (CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'T')) then
      begin
        if (gdFocused in State) then
          TDBGrid(sender).Canvas.Font.Color := clWhite
        else if (CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'P') then
        begin
  //        TDBGrid(sender).Canvas.Font.Color := clGreen
          TDBGrid(sender).Canvas.Brush.Color := clGreen;
          TDBGrid(sender).Canvas.FillRect(Rect);
        end
        else if (CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'Q') then
        begin
  //        TDBGrid(sender).Canvas.Font.Color := clGreen
          TDBGrid(sender).Canvas.Brush.Color := $00FFFFD2;
          TDBGrid(sender).Canvas.FillRect(Rect);
        end
        else
  //        TDBGrid(sender).Canvas.Font.Color := clHighlight;
          TDBGrid(sender).Canvas.Brush.Color := clGradientActiveCaption;//clHighlight;
        TDBGrid(sender).Canvas.FillRect(Rect);
        TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
      end;
    end;
  end;

  if Column.Field.Dataset.FieldbyName('STATUS').AsString = 'CANCELADO' then
  begin
    if (gdFocused in State) {//Verifica se a célula está no foco.} then
      TDBGrid(sender).canvas.brush.color := clGray
        //      dbgrid12.canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    //Agora vamos colorir a célula utilizando o método Defaut:
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end
  else if (UpperCase(trim(Column.FieldName)) = 'QUANT_ITEM_DEV')
    and  (Column.Field.Dataset.FieldbyName('QUANT_ITEM_DEV').AsInteger > 0) then
  begin
    TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    TDBGrid(sender).Canvas.Font.Color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if (Column.FieldName = 'SEL') or (Column.FieldName = 'SELEC') then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 22 then
      Column.Width := 22;

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
end;

procedure TFrmCadPedVenda.DBGrid12Enter(Sender: TObject);
begin
  inherited;
  if pgVendaRapida.ActivePage = tsCancelarItens then
  else
    DBGrid12.Options := DBGrid12.Options - [dgRowSelect];

  CadPedVenda.vItProd.DevInternaInit();
end;

procedure TFrmCadPedVenda.DBGrid12Exit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) and (pgVendaRapida.ActivePage = tsItens) and not clicouNoX then
    edCodBarra.SetFocus;

  CadPedVenda.vItProd.DevInternaReset(False);
end;

procedure TFrmCadPedVenda.DBGrid12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if pgVendaRapida.ActivePage = tsCancelarItens then
  begin
    if (Key = VK_RETURN) or (key = VK_DELETE) then
      BitBtn64Click(BitBtn64)
    else if Key = VK_SPACE then
      CadPedVenda.vItProd._marcarDesmarcaItem
    else if Key = VK_F2 then
      CadPedVenda.vItProd._marcarItem
    else if Key = VK_F3 then
      CadPedVenda.vItProd._desmarcaItem;
  end
  else
  begin
    if (key = VK_RETURN) then
    begin
      alterarItemVendaRapida; 
      if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) then
        edCodBarra.SetFocus;
    end
    else if (key = VK_TAB) then
    begin
      if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) then
        edCodBarra.SetFocus
    end;
  end;
end;

procedure TFrmCadPedVenda.DBGrid14Exit(Sender: TObject);
begin
  inherited;
  if not CadPedVenda.vItProd.dataSet.IsEmpty then
    EditHw1.AsValue := CadPedVenda.vItProd.dataSet.FieldByName('quant_ped_item').AsFloat;
end;

procedure TFrmCadPedVenda.DBGrid14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if  key = VK_RETURN then
    if (Self.Enabled) and (Self.Visible) and (EditHw1.CanFocus) then
      EditHw1.SetFocus;
end;

procedure TFrmCadPedVenda.DBGrid15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    btEscolherECFSaida.Click;
end;

procedure TFrmCadPedVenda.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    if BitBtn66.Visible then
      CadPedVenda._marcaDesmarcaLinha;
end;

procedure TFrmCadPedVenda.DBGrid1ColEnter(Sender: TObject);
begin
  inherited;
	if DBGrid1.SelectedField.FieldName = 'OBS_MINUTA' then
    DBGrid1.Options := DBGrid1.Options + [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'OBS_OS' then
    DBGrid1.Options := DBGrid1.Options + [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'OBS_TPVENDA' then
  	DBGrid1.Options := DBGrid1.Options + [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'DEFEITO' then
    DBGrid1.Options := DBGrid1.Options + [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'ESTADO_VEIC' then
    DBGrid1.Options := DBGrid1.Options + [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'ACESSORIOS' then
    DBGrid1.Options := DBGrid1.Options + [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'SELOS_COL' then
    DBGrid1.Options := DBGrid1.Options + [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'SELOS_REM' then
    DBGrid1.Options := DBGrid1.Options + [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'LACRES_COL' then
    DBGrid1.Options := DBGrid1.Options + [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'LACRES_REM' then
    DBGrid1.Options := DBGrid1.Options + [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'SEL' then
	  DBGrid1.Options := DBGrid1.Options - [dgEditing];
end;

procedure TFrmCadPedVenda.DBGrid1ColExit(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedField.FieldName = 'OBS_MINUTA' then
    DBGrid1.Options := DBGrid1.Options - [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'OBS_OS' then
    DBGrid1.Options := DBGrid1.Options - [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'OBS_TPVENDA' then
  	DBGrid1.Options := DBGrid1.Options - [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'DEFEITO' then
    DBGrid1.Options := DBGrid1.Options - [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'ESTADO_VEIC' then
    DBGrid1.Options := DBGrid1.Options - [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'ACESSORIOS' then
    DBGrid1.Options := DBGrid1.Options - [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'SELOS_COL' then
    DBGrid1.Options := DBGrid1.Options - [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'SELOS_REM' then
    DBGrid1.Options := DBGrid1.Options - [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'LACRES_COL' then
    DBGrid1.Options := DBGrid1.Options - [dgEditing]
  else if DBGrid1.SelectedField.FieldName = 'LACRES_REM' then
    DBGrid1.Options := DBGrid1.Options - [dgEditing]
end;

procedure TFrmCadPedVenda.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if BitBtn66.Visible then
    CadPedVenda._marcaDesmarcaLinha;
end;

procedure TFrmCadPedVenda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if Column.Field.Dataset.FieldbyName('Status_ped').AsString = 'CANCELADO' then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
      TDBGrid(sender).Canvas.Font.Color  := clWindowText;
    end;
  end
  else if trim(Column.Field.Dataset.FieldbyName('dev').AsString) = 'P' then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($0095FFFF);
      TDBGrid(sender).Canvas.Font.Color  := clWindowText;
    end;
  end
  else if trim(Column.Field.Dataset.FieldbyName('dev').AsString) = 'T' then
  begin
    if (gdFocused in State) then
      TDBGrid(sender).canvas.brush.color := clGray
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00C1FFC1);
      TDBGrid(sender).Canvas.Font.Color  := clWindowText;
    end;
  end
  else if BitBtn66.Visible then
    if CadPedVenda.f_str('sel') = 'S' then
    begin
      TDBGrid(sender).Canvas.Brush.Color := clHighlight;
      TDBGrid(sender).Canvas.Font.Color  := clHighlightText;
    end;

//  else if (TDBGrid(sender).SelectedRows.CurrentRowSelected) then
//      TDBGrid(sender).Canvas.brush.color := clWhite
//    else
//      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);

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

procedure TFrmCadPedVenda.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    SpeedButton1Click(Sender)
  else if Key = VK_DELETE then
    SpeedButton2Click(Sender)
  else if (key = VK_INSERT) then
    BitBtn3Click(Sender)
  else if (key = VK_F5) and (CadPedVenda.getTipoVenda = 'ORC') then
    SelecionarORCClick(Sender)
  else if (key = VK_F5) and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS')) then
  begin
  	if CadPedVenda.getTipoVenda = 'REQ' then
			if CadPedVenda.existeConferencia(CadPedVenda.dataSet.FieldByName('NPED').AsInteger) then
      begin
        Application.MessageBox(Pchar('Requisição de Venda está vinculada em uma conferência cega.' + chr(13) + 'Esta Requisição não pode ser mesclada.'), 'Atenção', +MB_ICONWARNING + MB_OK);
        Exit;
      end;
    SelecionarDAVparaMesclagem1Click(sender);
  end
  else if (BitBtn66.Visible) then
    if Key = VK_SPACE then
      CadPedVenda._marcaDesmarcaLinha;
  //  else if key=VK_END then
  //  begin
  //    disa
  //    exit;
  //  end;
  //    CadPedVenda.dataSet.GetNextPacket;
  //    CadPedVenda.dataSet.
    //  else if Key = VK_INSERT then
    //        BitBtn3Click(Sender);
end;

procedure TFrmCadPedVenda.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Classes.ssCtrl in Shift then
    if BitBtn66.Visible then
      CadPedVenda._marcaDesmarcaLinha;
end;

procedure TFrmCadPedVenda.DBGrid20DblClick(Sender: TObject);
begin
  inherited;
  EditFiscalCodBarraDev.Text := trim(CadPedVenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString);
  GroupBox58.Caption := 'Código de Barras-------------------------- Produto: ' + trim(CadPedVenda.vItProd.dataSet.FieldByName('DESCR_PROD_PED').AsString);
  if (Self.Enabled) and (Self.Visible) and (EditFiscalCodBarraDev.CanFocus) then
	  EditFiscalCodBarraDev.SetFocus;
end;

procedure TFrmCadPedVenda.DBGrid20DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  if TDBGrid(sender).DataSource.DataSet.FieldbyName('STATUS').AsString <> 'CANCELADO' then
  begin
    if ((Column.FieldName = 'VLUN_PED_ITEM')
    	or (Column.FieldName = 'VLUN_PED_ITEM_LIQ')
      or (Column.FieldName = 'VLUN_PED_ITEM_CONV')
      or (Column.FieldName = 'VLUN_PED_ITEM_CONV_LIQ')
      or (Column.FieldName = 'TABPRATICADA')) then
  	begin
      if (TDBGrid(sender).DataSource.DataSet.FieldByName('TABPRATICADA').AsString = 'P') then
      begin
        if (gdFocused in State) then
          TDBGrid(sender).Canvas.Font.Color := clWhite
        else
        begin
          TDBGrid(sender).Canvas.Brush.Color := clGreen;
          TDBGrid(sender).Canvas.FillRect(Rect);
        end;

        TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
      end
      else if (TDBGrid(sender).DataSource.DataSet.FieldByName('TABPRATICADA').AsString = 'Q') then
      begin
        if (gdFocused in State) then
          TDBGrid(sender).Canvas.Font.Color := clWhite
        else
        begin
          TDBGrid(sender).Canvas.Brush.Color := $00FFFFD2;
          TDBGrid(sender).Canvas.FillRect(Rect);
        end;

        TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
      end
      else if (TDBGrid(sender).DataSource.DataSet.FieldByName('TABPRATICADA').AsString = 'T') then
      begin
      	if (gdFocused in State) then
          TDBGrid(sender).Canvas.Font.Color := clWhite
        else
        begin
          TDBGrid(sender).Canvas.Brush.Color := clGradientActiveCaption;
          TDBGrid(sender).Canvas.FillRect(Rect);
        end;

        TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
      end;
    end;
  end;

  if TDBGrid(sender).DataSource.Dataset.FieldbyName('STATUS').AsString = 'CANCELADO' then
  begin
    if (gdFocused in State) {//Verifica se a célula está no foco.} then
      TDBGrid(sender).canvas.brush.color := clGray
        //      dbgrid12.canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    //Agora vamos colorir a célula utilizando o método Defaut:
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end
  else if (UpperCase(trim(Column.FieldName)) = 'QUANT_ITEM_DEV')
    and (TDBGrid(sender).DataSource.Dataset.FieldbyName('QUANT_ITEM_DEV').AsInteger > 0) then
  begin
    TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    TDBGrid(sender).Canvas.Font.Color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end
  else if (UpperCase(trim(Column.FieldName)) = 'QUANT_ITEM_DEV_CONV')
    and (TDBGrid(sender).DataSource.Dataset.FieldbyName('QUANT_ITEM_DEV_CONV').AsInteger > 0) then
  begin
    TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    TDBGrid(sender).Canvas.Font.Color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;
end;

procedure TFrmCadPedVenda.DBGrid21DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if not CadPedVenda.vAgenda.IsEmpty then
     if (CadPedVenda.vAgenda.dataSet.FieldByName('COD_USUARIO').AsInteger > 0) then
     begin
       TDBGrid(sender).canvas.brush.color := clRed;
       TDBGrid(sender).canvas.Font.color := clWhite;
     end
     else
     begin
//       if (gdFocused in State) then
//       begin
//         TDBGrid(sender).canvas.brush.color := clWindow;
//         TDBGrid(sender).canvas.Font.color := clWindowText;
//       end
//       else
//       begin
//         TDBGrid(sender).canvas.brush.color := clHighlight;
//         TDBGrid(sender).canvas.Font.color := clWhite;
//       end;
     end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadPedVenda.DBGrid21Enter(Sender: TObject);
begin
  inherited;
  if ((MaskEdit1.Text <> '') and (MaskEdit2.Text <> '')) then
    CadPedVenda.vAgenda.vAgendaItens._abreAgendaItens(CadPedVenda.vAgenda.dataSet.FieldByName('COD_AGENDA').AsInteger);
end;

procedure TFrmCadPedVenda.DBGrid21KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ((Key = VK_RETURN) or (Key = VK_TAB)) then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBGrid22.CanFocus) then
      DBGrid22.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.DBGrid22CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
  begin
    CadPedVenda.vAgenda.vAgendaItens._marcaDesmarcaLinha;
    DBLookupComboBox32.KeyValue := CadPedVenda.vAgenda.vAgendaItens.fBox.FieldByName('COD_BOX').AsInteger;
  end;
end;

procedure TFrmCadPedVenda.DBGrid22ColEnter(Sender: TObject);
begin
  inherited;
  if DBGrid22.SelectedField.FieldName = 'SEL' then
    DBGrid22.Options := [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs,
      dgConfirmDelete, dgCancelOnExit];
end;

procedure TFrmCadPedVenda.DBGrid22DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
   if not CadPedVenda.vAgenda.IsEmpty then
     if (CadPedVenda.vAgenda.dataSet.FieldByName('COD_USUARIO').AsInteger > 0) then
     begin
        TDBGrid(sender).canvas.brush.color := clRed;
        TDBGrid(sender).canvas.Font.color := clWhite;
     end
     else if CadPedVenda.vAgenda.vAgendaItens.dataSet.FieldByName('SEL').AsString = 'S' then
     begin
//       if (gdFocused in State) then
//       begin
//         TDBGrid(sender).canvas.brush.color := clWindow;
//         TDBGrid(sender).canvas.Font.color := clWindowText;
//       end
//       else
//       begin
         TDBGrid(sender).canvas.brush.color := clHighlight;
         TDBGrid(sender).canvas.Font.color := clWhite;
//       end;
     end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    DBGrid22.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); //Diminue o tamanho do CheckBox
    DrawFrameControl(DBGrid22.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;

end;

procedure TFrmCadPedVenda.DBGrid22KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ((Key = VK_RETURN) or (Key = VK_TAB)) then
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox25.CanFocus) then
      DBLookupComboBox25.SetFocus;

  if not CadPedVenda.vAgenda.vAgendaItens.dataSet.IsEmpty then
    if (Key = VK_SPACE) or (Key = VK_F2) then
    begin
      CadPedVenda.vAgenda.vAgendaItens._marcaDesmarcaLinha;
      DBLookupComboBox32.KeyValue := CadPedVenda.vAgenda.vAgendaItens.fBox.FieldByName('COD_BOX').AsInteger;
    end
    else if (Key = VK_F6) then
      CadPedVenda.vAgenda.vAgendaItens._LimparDados;
end;

procedure TFrmCadPedVenda.DBGrid23KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if ((Key = VK_TAB) or (key = VK_RETURN)) then
 begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn80.CanFocus) then
	  BitBtn80.SetFocus;
 end;
end;

procedure TFrmCadPedVenda.DBGrid24KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if ((Key = VK_TAB) or (key = VK_RETURN)) then
 begin
  if (Self.Enabled) and (Self.Visible) and (BitBtn90.CanFocus) then
	  BitBtn90.SetFocus;
 end;

end;

procedure TFrmCadPedVenda.DBGrid25DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if (trim(Column.Field.Dataset.FieldbyName('STATUS').AsString) = '') then
  begin
    //
  end
  else if (trim(Column.Field.Dataset.FieldbyName('STATUS').AsString) = 'Barrado') then
  begin
		TDBGrid(sender).canvas.brush.color := TColor($00CEF0FF);
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end
  else
  begin
    TDBGrid(sender).canvas.brush.color := TColor($00D5E2C7);
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;
end;

procedure TFrmCadPedVenda.DBGrid25TitleClick(Column: TColumn);
begin
  inherited;
  vDadosIni.DBGridOnTitleClick(DBGrid25, Column);
end;

procedure TFrmCadPedVenda.DBGrid26CellClick(Column: TColumn);
var
	vRecnoRVnd: Integer;
  vRecnoOpPag: Integer;
begin
  inherited;
	if Column.FieldName = 'SEL' then
  begin
  	if CadPedVenda.vRVnd.dataSet.IsEmpty then
    	exit;

    try
    	Screen.Cursor := crHourGlass;
      ckListaTodasPoliticas.Enabled := False;
      SpeedButton63.Enabled         := False;
      SpeedButton64.Enabled         := False;
      SpeedButton61.Enabled         := False;
      BitBtn93.Enabled              := False;

    	vRecnoRVnd  := CadPedVenda.vRVnd.dataSet.RecNo;
      vRecnoOpPag := CadPedVenda.vRVnd.vOpPag.dataSet.RecNo;

    	CadPedVenda.vRVnd._marcaDesmarcaLinha(CadPedVenda.buscas);
      CadPedVenda._SimularValoresComDesconto(label201);
      CadPedVenda._ExibirInfPoliticaSel(
      	CadPedVenda.vRVnd.dataSet,
      	CadPedVenda.vRVnd.vOpPag.dataSet,
        label255);
    finally
      CadPedVenda.vRVnd.dataSet.RecNo        := vRecnoRVnd;
      CadPedVenda.vRVnd.vOpPag.dataSet.RecNo := vRecnoOpPag;

      ckListaTodasPoliticas.Enabled := True;
      SpeedButton63.Enabled         := True;
      SpeedButton64.Enabled         := True;
      SpeedButton61.Enabled         := True;
      BitBtn93.Enabled              := True;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadPedVenda.DBGrid26DblClick(Sender: TObject);
var
	vRecnoRVnd: Integer;
  vRecnoOpPag: Integer;
begin
  inherited;
 	if CadPedVenda.vRVnd.dataSet.IsEmpty then
    exit;

  try
  	Screen.Cursor := crHourGlass;
    ckListaTodasPoliticas.Enabled := False;
    SpeedButton63.Enabled         := False;
    SpeedButton64.Enabled         := False;
    SpeedButton61.Enabled         := False;
    BitBtn93.Enabled              := False;

    vRecnoRVnd  := CadPedVenda.vRVnd.dataSet.RecNo;
    vRecnoOpPag := CadPedVenda.vRVnd.vOpPag.dataSet.RecNo;

    CadPedVenda.vRVnd._marcaDesmarcaLinha(CadPedVenda.buscas);
    CadPedVenda._SimularValoresComDesconto(label201);
    CadPedVenda._ExibirInfPoliticaSel(
    	CadPedVenda.vRVnd.dataSet,
    	CadPedVenda.vRVnd.vOpPag.dataSet,
      label255);
  finally
    CadPedVenda.vRVnd.dataSet.RecNo        := vRecnoRVnd;
    CadPedVenda.vRVnd.vOpPag.dataSet.RecNo := vRecnoOpPag;

    ckListaTodasPoliticas.Enabled := True;
    SpeedButton63.Enabled         := True;
    SpeedButton64.Enabled         := True;
    SpeedButton61.Enabled         := True;
    BitBtn93.Enabled              := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.DBGrid26DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
//	ShowScrollBar(TDBGrid(sender).Handle, SB_VERT, False);
	if (trim(Column.Field.Dataset.FieldbyName('STATUS').AsString) = '') then
  begin
    //
  end
  else if (trim(Column.Field.Dataset.FieldbyName('STATUS').AsString) = 'Barrado') then
  begin
		TDBGrid(sender).canvas.brush.color := TColor($00CEF0FF);
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end
  else
  begin
    if (trim(Column.Field.Dataset.FieldbyName('SOBREPOR_PROMOCAO').AsString) = 'S')
    	or (trim(Column.Field.Dataset.FieldbyName('SOBREPOR_TABPRECO').AsString) = 'S')
      or (trim(Column.Field.Dataset.FieldbyName('SOBREPOR_MAXDESCPROD').AsString) = 'S') then
     	 TDBGrid(sender).canvas.brush.color := TColor($00FFEBD7)
    else
       TDBGrid(sender).canvas.brush.color := TColor($00D5E2C7);
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 24 then
      Column.Width := 24;

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

procedure TFrmCadPedVenda.DBGrid26KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	vRecnoRVnd: Integer;
  vRecnoOpPag: Integer;
begin
  inherited;
  if Key = VK_SPACE then
  begin
    if CadPedVenda.vRVnd.dataSet.IsEmpty then
    	exit;

    try
    	Screen.Cursor := crHourGlass;
      ckListaTodasPoliticas.Enabled := False;
      SpeedButton63.Enabled         := False;
      SpeedButton64.Enabled         := False;
      SpeedButton61.Enabled         := False;
      BitBtn93.Enabled              := False;

    	vRecnoRVnd  := CadPedVenda.vRVnd.dataSet.RecNo;
      vRecnoOpPag := CadPedVenda.vRVnd.vOpPag.dataSet.RecNo;

    	CadPedVenda.vRVnd._marcaDesmarcaLinha(CadPedVenda.buscas);
      CadPedVenda._SimularValoresComDesconto(label201);
      CadPedVenda._ExibirInfPoliticaSel(
      	CadPedVenda.vRVnd.dataSet,
      	CadPedVenda.vRVnd.vOpPag.dataSet,
        label255);
    finally
      CadPedVenda.vRVnd.dataSet.RecNo        := vRecnoRVnd;
      CadPedVenda.vRVnd.vOpPag.dataSet.RecNo := vRecnoOpPag;

      ckListaTodasPoliticas.Enabled := True;
      SpeedButton63.Enabled         := True;
      SpeedButton64.Enabled         := True;
      SpeedButton61.Enabled         := True;
      BitBtn93.Enabled              := True;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadPedVenda.DBGrid29CellClick(Column: TColumn);
begin
  inherited;
	if (Column.FieldName = 'SEL') or (Column.FieldName = 'SELEC') then
  	CadPedVenda.SelecionarItemProdTercParaMesclar;
end;

procedure TFrmCadPedVenda.DBGrid29DblClick(Sender: TObject);
begin
  inherited;
 	CadPedVenda.SelecionarItemProdTercParaMesclar;
end;

procedure TFrmCadPedVenda.DBGrid29DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
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

	if TDBGrid(sender).DataSource.DataSet.FieldByName('SELEC').AsString = 'S' then
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
  
  if (Column.FieldName = 'SEL') or (Column.FieldName = 'SELEC') then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 22 then
      Column.Width := 22;

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
end;

procedure TFrmCadPedVenda.DBGrid29Exit(Sender: TObject);
begin
  inherited;
	if DBGrid29.DataSource.DataSet.State = dsEdit then
    DBGrid29.DataSource.DataSet.Post;
end;

procedure TFrmCadPedVenda.DBGrid29KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_SPACE then
    CadPedVenda.SelecionarItemProdTercParaMesclar
  else if Key = VK_RETURN then
  	if DBGrid29.DataSource.DataSet.State = dsEdit then
	    DBGrid29.DataSource.DataSet.Post;
end;

procedure TFrmCadPedVenda.DBGrid29KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if key = VK_DOWN then
    if DBGrid29.DataSource.DataSet.FieldByName('NPED').IsNull then
      DBGrid29.DataSource.DataSet.Cancel;
end;

procedure TFrmCadPedVenda.DBGrid2CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
  	CadPedVenda.vItProd._marcarDesmarcaItem;
end;

procedure TFrmCadPedVenda.DBGrid2ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(
  	DBGrid2,
    GridCfg2,
    cdsGrid2,
    cdsColunas2,
    vusuario,
    ListGridsAndDataSets2,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet2);
  TemColunasComPosicaoAlteradas2  := True;
end;

procedure TFrmCadPedVenda.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  //If Column.FieldName = 'Status' then //Remova esta linha se você quer destacar toda a linha
	if Column.Field.Dataset.FieldbyName('STATUS').AsString <> 'CANCELADO' then
  begin
  	if (gdFocused in State) then
    begin
      TDBGrid(sender).Canvas.Font.Color := clWhite;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
    else if (Column.Field.Dataset.FieldbyName('QUANT_DEV_ITEM_TEMP').AsFloat > 0)
      and (Column.Field.Dataset.FieldbyName('QUANT_DEV_ITEM_TEMP').AsFloat >= Column.Field.Dataset.FieldbyName('QUANT_PED_ITEM').AsFloat) then
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00C1FFC1);
      TDBGrid(sender).Canvas.Font.Color  := clWindowText;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
    else if (Column.Field.Dataset.FieldbyName('QUANT_DEV_ITEM_TEMP').AsFloat > 0) then
    begin
      TDBGrid(sender).canvas.brush.color := TColor($0095FFFF);
      TDBGrid(sender).Canvas.Font.Color  := clWindowText;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end;

    if ((Column.FieldName = 'VLUN_PED_ITEM')
    	or (Column.FieldName = 'VLUN_PED_ITEM_LIQ')
      or (Column.FieldName = 'VLUN_PED_ITEM_CONV')
      or (Column.FieldName = 'VLUN_PED_ITEM_CONV_LIQ')
      or (Column.FieldName = 'TABPRATICADA')) then
    begin
      if (gdFocused in State) then
        TDBGrid(sender).Canvas.Font.Color := clBlack
      else if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'P') then
        TDBGrid(sender).Canvas.Brush.Color := clGreen
      else if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'Q') then
        TDBGrid(sender).Canvas.Brush.Color := $00FFFFD2
      else if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'T') then
        TDBGrid(sender).Canvas.Brush.Color := clGradientActiveCaption
      else
	    	TDBGrid(sender).Canvas.Brush.Color := clWhite;

      TDBGrid(sender).Canvas.FillRect(Rect);
      TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
    end;
	end;

  if Column.Field.Dataset.FieldbyName('Status').AsString = 'CANCELADO' then
  begin
    if (gdFocused in State) {//Verifica se a célula está no foco.} then
      TDBGrid(sender).canvas.brush.color := clGray
        //      dbgrid12.canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    //Agora vamos colorir a célula utilizando o método Defaut:
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end
  else if (UpperCase(trim(Column.FieldName)) = 'QUANT_ITEM_DEV')
    and  (Column.Field.Dataset.FieldbyName('QUANT_ITEM_DEV').AsInteger > 0) then
  begin
    TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    TDBGrid(sender).Canvas.Font.Color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 22 then
      Column.Width := 22;

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
end;

procedure TFrmCadPedVenda.DBGrid2Enter(Sender: TObject);
begin
  inherited;
  CadPedVenda.vItProd.DevInternaInit;
end;

procedure TFrmCadPedVenda.DBGrid2Exit(Sender: TObject);
begin
  inherited;
  CadPedVenda.vItProd.DevInternaReset(False);
end;

procedure TFrmCadPedVenda.DBGrid2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    CadPedVenda.vItProd._marcarDesmarcaItem
  else if Key = VK_F2 then
    CadPedVenda.vItProd._marcarItem
  else if Key = VK_F3 then
    CadPedVenda.vItProd._desmarcaItem
  else if Key = VK_Tab then
  begin
    if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) then
	    BitBtn16.SetFocus;
  end
  else if key = VK_DELETE then
    BitBtn19Click(Sender);
end;

procedure TFrmCadPedVenda.DBGrid30CellClick(Column: TColumn);
begin
  inherited;
	if (Column.FieldName = 'SEL') or (Column.FieldName = 'SELEC') then
  	CadPedVenda.SelecionarItemServTercParaMesclar;
end;

procedure TFrmCadPedVenda.DBGrid30DblClick(Sender: TObject);
begin
  inherited;
	CadPedVenda.SelecionarItemServTercParaMesclar;
end;

procedure TFrmCadPedVenda.DBGrid30DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
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

	if TDBGrid(sender).DataSource.DataSet.FieldByName('SELEC').AsString = 'S' then
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
  
  if (Column.FieldName = 'SEL') or (Column.FieldName = 'SELEC') then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 22 then
      Column.Width := 22;

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
end;

procedure TFrmCadPedVenda.DBGrid30Exit(Sender: TObject);
begin
  inherited;
	if DBGrid30.DataSource.DataSet.State = dsEdit then
    DBGrid30.DataSource.DataSet.Post;
end;

procedure TFrmCadPedVenda.DBGrid30KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_SPACE then
    CadPedVenda.SelecionarItemServTercParaMesclar;
end;

procedure TFrmCadPedVenda.DBGrid30KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if key = VK_DOWN then
    if DBGrid30.DataSource.DataSet.FieldByName('NPED').IsNull then
      DBGrid30.DataSource.DataSet.Cancel;
end;

procedure TFrmCadPedVenda.DBGrid3CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	CadPedVenda.vItProd._marcarDesmarcaItem;
end;

procedure TFrmCadPedVenda.DBGrid3ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(
  	DBGrid3,
    GridCfg3,
    cdsGrid3,
    cdsColunas3,
    vusuario,
    ListGridsAndDataSets3,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet3);
  TemColunasComPosicaoAlteradas3  := True;
end;

procedure TFrmCadPedVenda.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  //If Column.FieldName = 'Status' then //Remova esta linha se você quer destacar toda a linha
  if Column.Field.Dataset.FieldbyName('STATUS').AsString <> 'CANCELADO' then
  begin
  	if (gdFocused in State) then
    begin
      TDBGrid(sender).Canvas.Font.Color := clWhite;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
    else if (Column.Field.Dataset.FieldbyName('QUANT_DEV_ITEM_TEMP').AsFloat > 0)
      and (Column.Field.Dataset.FieldbyName('QUANT_DEV_ITEM_TEMP').AsFloat >= Column.Field.Dataset.FieldbyName('QUANT_PED_ITEM').AsFloat) then
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00C1FFC1);
      TDBGrid(sender).Canvas.Font.Color  := clWindowText;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end
    else if (Column.Field.Dataset.FieldbyName('QUANT_DEV_ITEM_TEMP').AsFloat > 0) then
    begin
      TDBGrid(sender).canvas.brush.color := TColor($0095FFFF);
      TDBGrid(sender).Canvas.Font.Color  := clWindowText;

      TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
    end;

    if ((Column.FieldName = 'VLUN_PED_ITEM')
    	or (Column.FieldName = 'VLUN_PED_ITEM_LIQ')
      or (Column.FieldName = 'VLUN_PED_ITEM_CONV')
      or (Column.FieldName = 'VLUN_PED_ITEM_CONV_LIQ')
      or (Column.FieldName = 'TABPRATICADA')) then
    begin
    	if ((CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'P') or
          (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'Q') or
          (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'T')) then
      begin
        if (gdFocused in State) then
          TDBGrid(sender).Canvas.Font.Color := clWhite
        else if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'P') then
        begin
  //        TDBGrid(sender).Canvas.Font.Color := clGreen
          TDBGrid(sender).Canvas.Brush.Color := clGreen;
          TDBGrid(sender).Canvas.FillRect(Rect);
        end
        else if (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString = 'Q') then
        begin
  //        TDBGrid(sender).Canvas.Font.Color := clGreen
          TDBGrid(sender).Canvas.Brush.Color := $00FFFFD2;
          TDBGrid(sender).Canvas.FillRect(Rect);
        end
        else
  //        TDBGrid(sender).Canvas.Font.Color := clHighlight;
          TDBGrid(sender).Canvas.Brush.Color := clGradientActiveCaption;//clHighlight;
        TDBGrid(sender).Canvas.FillRect(Rect);
        TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
      end;
    end;
  end;
      
  if Column.Field.Dataset.FieldbyName('Status').AsString = 'CANCELADO' then
  begin
    if (gdFocused in State) {//Verifica se a célula está no foco.} then
      TDBGrid(sender).canvas.brush.color := clGray
        //      dbgrid12.canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    //Agora vamos colorir a célula utilizando o método Defaut:
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end
  else if (UpperCase(trim(Column.FieldName)) = 'QUANT_ITEM_DEV')
    and  (Column.Field.Dataset.FieldbyName('QUANT_ITEM_DEV').AsInteger > 0) then
  begin
    TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    TDBGrid(sender).Canvas.Font.Color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 22 then
      Column.Width := 22;

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
end;

procedure TFrmCadPedVenda.DBGrid3Enter(Sender: TObject);
begin
  inherited;
  CadPedVenda.vItProd.DevInternaInit();
end;

procedure TFrmCadPedVenda.DBGrid3Exit(Sender: TObject);
begin
  inherited;
  CadPedVenda.vItProd.DevInternaReset(False);
end;

procedure TFrmCadPedVenda.DBGrid3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    CadPedVenda.vItProd._marcarDesmarcaItem
  else if Key = VK_F2 then
    CadPedVenda.vItProd._marcarItem
  else if Key = VK_F3 then
    CadPedVenda.vItProd._desmarcaItem;
end;

procedure TFrmCadPedVenda.DBGrid4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_DELETE then
    BitBtn25Click(Sender);
end;

procedure TFrmCadPedVenda.DBGrid50KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_RETURN) then
    SpeedButton31Click(Self)
  else if key = VK_INSERT then
    SpeedButton30Click(Self)
  else if Key = VK_TAB then
  begin
    if (Self.Enabled) and (Self.Visible) and (BitBtn82.CanFocus) then
	    BitBtn82.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.DBGrid5CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
    CadPedVenda.vItServ._marcarDesmarcaItem;
end;

procedure TFrmCadPedVenda.DBGrid5ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(
  	DBGrid5,
    GridCfg5,
    cdsGrid5,
    cdsColunas5,
    vusuario,
    ListGridsAndDataSets5,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet5);
  TemColunasComPosicaoAlteradas5  := True;
end;

procedure TFrmCadPedVenda.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  //If Column.FieldName = 'Status' then //Remova esta linha se você quer destacar toda a linha

  if Column.Field.Dataset.FieldbyName('Status').AsString = 'CANCELADO' then
  begin
    if (gdFocused in State) {//Verifica se a célula está no foco.} then
      TDBGrid(sender).canvas.brush.color := clGray
        //      dbgrid12.canvas.brush.color := clGray
    else
      TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    //Agora vamos colorir a célula utilizando o método Defaut:
    TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
  end
  else if (UpperCase(trim(Column.FieldName)) = 'QUANT_ITEM_DEV')
    and  (Column.Field.Dataset.FieldbyName('QUANT_ITEM_DEV').AsInteger > 0) then
  begin
    TDBGrid(sender).canvas.brush.color := TColor($0000A4EA);
    TDBGrid(sender).Canvas.Font.Color := clWindowText;
    TDBGrid(sender).Canvas.FillRect(Rect);
    TDBGrid(sender).DefaultDrawDataCell(Rect, Column.Field, State);
  end;

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 22 then
      Column.Width := 22;

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
end;

procedure TFrmCadPedVenda.DBGrid5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    CadPedVenda.vItServ._marcarDesmarcaItem
  else if Key = VK_F2 then
    CadPedVenda.vItServ._marcarItem
  else if Key = VK_F3 then
    CadPedVenda.vItServ._desmarcaItem; 
end;

procedure TFrmCadPedVenda.DBGrid60DblClick(Sender: TObject);
begin
  inherited;
  BitBtn86Click(BitBtn86);
end;

procedure TFrmCadPedVenda.DBGrid60KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_RETURN then
    BitBtn86Click(BitBtn86);
end;

procedure TFrmCadPedVenda.DBGrid6CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
		CadPedVenda.vItServTerc._marcarDesmarcaItem;
end;

procedure TFrmCadPedVenda.DBGrid6ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(
  	DBGrid6,
    GridCfg6,
    cdsGrid6,
    cdsColunas6,
    vusuario,
    ListGridsAndDataSets6,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet6);
  TemColunasComPosicaoAlteradas6  := True;
end;

procedure TFrmCadPedVenda.DBGrid6DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
end;

procedure TFrmCadPedVenda.DBGrid6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    CadPedVenda.vItServTerc._marcarDesmarcaItem
  else if Key = VK_F2 then
    CadPedVenda.vItServTerc._marcarItem
  else if Key = VK_F3 then
    CadPedVenda.vItServTerc._desmarcaItem;
end;

procedure TFrmCadPedVenda.DBGrid7CellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
		CadPedVenda.vItProdTerc._marcarDesmarcaItem;
end;

procedure TFrmCadPedVenda.DBGrid7ColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  vDadosIni.salvarGridNoConfigColunasCadPadrao(
  	DBGrid7,
    GridCfg7,
    cdsGrid7,
    cdsColunas7,
    vusuario,
    ListGridsAndDataSets7,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet7);
  TemColunasComPosicaoAlteradas7  := True;
end;

procedure TFrmCadPedVenda.DBGrid7DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
end;

procedure TFrmCadPedVenda.DBGrid7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    CadPedVenda.vItProdTerc._marcarDesmarcaItem
  else if Key = VK_F2 then
    CadPedVenda.vItProdTerc._marcarItem
  else if Key = VK_F3 then
    CadPedVenda.vItProdTerc._desmarcaItem;
end;

procedure TFrmCadPedVenda.DBGrid9CellClick(Column: TColumn);
begin
  inherited;
	if Column.FieldName = 'SEL' then
  	CadPedVenda._SelecionarCabecalhoDAVParaMesclar;
end;

procedure TFrmCadPedVenda.DBGrid9DblClick(Sender: TObject);
begin
  inherited;
//  CadPedVenda._SelecionarCabecalhoDAVParaMesclar;
  CadPedVenda.filtrarItensDAV(DBGrid9.DataSource.DataSet.FieldByName('NPED').asinteger, DBGrid9.DataSource.DataSet.FieldByName('TIPO').asstring);
  CheckBox2.Checked := false;
end;

procedure TFrmCadPedVenda.DBGrid9DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
  inherited;
  if TDBGrid(sender).DataSource.DataSet.FieldByName('SEL').AsString = 'S' then
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

  if Column.FieldName = 'SEL' then
  begin
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 22 then
      Column.Width := 22;

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
end;

procedure TFrmCadPedVenda.DBGrid9KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_SPACE then
    CadPedVenda._SelecionarCabecalhoDAVParaMesclar;
end;

procedure TFrmCadPedVenda.DBGridProdSimKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = VK_RETURN then
  	BitBtnSalvarProdSimilarClick(Sender);
end;

procedure TFrmCadPedVenda.DBLookupComboBox10Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn89) or (clicouNoX) then
    Exit;
  if not CadPedVenda.verificaColaboradorProdutos(true, false) then
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox10.CanFocus) then
  	  DBLookupComboBox10.setfocus; //setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro);
end;

procedure TFrmCadPedVenda.DBLookupComboBox11Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn89) or (clicouNoX) then
    Exit;
  if not CadPedVenda.verificaColaboradorProdutos(false, true) then
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox11.CanFocus) then
	    DBLookupComboBox11.setfocus; //setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro);
end;

procedure TFrmCadPedVenda.DBLookupComboBox15Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
    Exit;
  if CadPedVenda.vendaFechada then
    exit;
  if not CadPedVenda.ChecaCodPagVazia(DBLookupComboBox15.Text) then
  begin
    if CadPedVenda.getTipoVenda = 'REQ' then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox15.CanFocus) then
	      DBLookupComboBox15.SetFocus;
    end
    else if CadPedVenda.getTipoVenda = 'ORC' then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox30.CanFocus) then
        DBLookupComboBox30.SetFocus
      else if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox15.CanFocus) then
        DBLookupComboBox15.SetFocus;
    end
    else if (Self.Enabled) and (Self.Visible) and (DBEdit36.CanFocus) then
    	DBEdit36.SetFocus;
  end;

//  label201.Visible := false;
//  label255.Visible := false;
  CadPedVenda._abreRegraCondicoesPolitica(ckListaTodasPoliticas.Checked);
  CadPedVenda._validaDescontoRegraVND(ckListaTodasPoliticas.Checked);
end;

procedure TFrmCadPedVenda.DBLookupComboBox16Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
    Exit;
  if CadPedVenda.vendaFechada then
    exit;
  if activecontrol = DBComboBox1 then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus;
  end
  else if CadPedVenda.ChecaVendedorVazio then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox16.CanFocus) then
      DBLookupComboBox16.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (dbedit4.CanFocus) then
      dbedit4.SetFocus;
  end
  else if not CadPedVenda.ChecaTipVendaVendedor then
    if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
      DBEdit5.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (dbedit4.CanFocus) then
      dbedit4.setfocus;
end;

procedure TFrmCadPedVenda.DBLookupComboBox18Exit(Sender: TObject);
begin
  inherited;
  DBEdit90Exit(Sender);
end;

procedure TFrmCadPedVenda.DBLookupComboBox21Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn50) or (activecontrol = bitbtn49) or (activecontrol = bitbtn68) then
    Exit;
  //  if not CadPedVenda.verificaColaboradorProdutos(2) then
  if not CadPedVenda.verificaColaboradorProdutos(false, true) then
    setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);
	//	 if (Self.Enabled) and (Self.Visible) and (DBEdit120.CanFocus) then  
  //    DBEdit120.SetFocus;
end;

procedure TFrmCadPedVenda.DBLookupComboBox22Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn50) or (activecontrol = bitbtn49) or (activecontrol = bitbtn68) then
    Exit;
  //  if not CadPedVenda.verificaColaboradorProdutos(1) then
  if not CadPedVenda.verificaColaboradorProdutos(true, false) then
    setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);
  //   if (Self.Enabled) and (Self.Visible) and (DBEdit121.CanFocus) then
  //    DBEdit121.SetFocus;
end;

procedure TFrmCadPedVenda.DBLookupComboBox25Exit(Sender: TObject);
begin
  inherited;
  CadPedVenda.vAgenda.vAgendaItens._PreecherMecanico;
end;

procedure TFrmCadPedVenda.DBLookupComboBox26Exit(Sender: TObject);
begin
  inherited;
  if ActiveControl = BitBtn71 then
    Exit;
  if CadPedVenda.vendaFechada then
    exit;
  if CadPedVenda.ChecaVendedorVazio then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox26.CanFocus) then
	    DBLookupComboBox26.SetFocus
  end
  else if not CadPedVenda.ChecaTipVendaVendedor then
    if (Self.Enabled) and (Self.Visible) and (DBEdit70.CanFocus) then
	    DBEdit70.SetFocus;
end;

procedure TFrmCadPedVenda.DBLookupComboBox27Exit(Sender: TObject);
begin
  inherited;
  if ActiveControl = BitBtn71 then
    Exit;
  if CadPedVenda.vendaFechada then
    exit;
  if not CadPedVenda.ChecaCodPagVazia(DBLookupComboBox27.Text) then
  begin
    if CadPedVenda.getTipoVenda = 'REQ' then
      if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox27.CanFocus) then
	      DBLookupComboBox27.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.DBLookupComboBox31Exit(Sender: TObject);
begin
  inherited;
  if (DBLookupComboBox31.KeyValue <> Null) and (not CadPedVenda.vKit.IsEmpty) then
    EditMoeda6.Valor := DBLookupComboBox31.KeyValue;
end;

procedure TFrmCadPedVenda.DBLookupComboBox31KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('KITS_PROD');
      if (vDadosIni.vPesquisa = '') or (vDadosIni.vPesquisa = '0') then
        exit;
      CadPedVenda.vKit.abreKitProd(StrToInt(vDadosIni.vPesquisa));
    finally
      Screen.Cursor := crDefault;
    end;
  end else if (Key = VK_UP) or (Key = VK_DOWN) and (DBLookupComboBox31.KeyValue <> 0) and (CadPedVenda.vKit.dataSet.RecordCount <= 1) then
    CadPedVenda.vKit.abreKitProd;
end;

procedure TFrmCadPedVenda.DBLookupComboBox32Exit(Sender: TObject);
begin
  inherited;
  CadPedVenda.vAgenda.vAgendaItens._PreecherBox;
end;

procedure TFrmCadPedVenda.DBLookupComboBox36Enter(Sender: TObject);
begin
  inherited;
//  tempEdit5 := CadPedVenda.vColab.IndexFieldNames;
//  CadPedVenda.vColab.IndexFieldNames := 'NOME_VENDEDOR';
end;

procedure TFrmCadPedVenda.DBLookupComboBox36Exit(Sender: TObject);
begin
  inherited;
//  CadPedVenda.vColab.IndexFieldNames := tempEdit5;
end;

procedure TFrmCadPedVenda.DBLookupComboBox37Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
    Exit;
  if CadPedVenda.vendaFechada then
    exit;
  if activecontrol = DBComboBox1 then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
      DBComboBox1.SetFocus;
  end
  else if not CadPedVenda.ChecaParticipante then
    if (Self.Enabled) and (Self.Visible) and (DBEdit1.CanFocus) then
      DBEdit1.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (dbedit4.CanFocus) then
      dbedit4.setfocus;
end;

procedure TFrmCadPedVenda.DBLookupComboBox38Exit(Sender: TObject);
begin
  inherited;
  DBEdit127Exit(Sender); 
end;

procedure TFrmCadPedVenda.DBLookupComboBox3Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (activecontrol = bitbtn11) or (clicouNoX) then
    Exit;
  if not CadPedVenda.verificaColaboradorProdutos(true, false) then
  begin
    setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);
  end;
//  else if CadPedVenda.getTipoVenda = 'REQ' then
//  begin
//    if (Self.Enabled) and (Self.Visible) and (DBEdit8.CanFocus) and (DBEdit8.enabled) then
//      DBEdit8.SetFocus
//    else if (Self.Enabled) and (Self.Visible) and (DBEdit9.CanFocus) then
//      DBEdit9.SetFocus
//    else
//      Perform(WM_NEXTDLGCTL, 0, 0);
//  end;
end;

procedure TFrmCadPedVenda.DBLookupComboBox43Exit(Sender: TObject);
begin
  inherited;
  if DBLookupComboBox43.KeyValue = null then
  	EditHw2.AsValue := 0
  else
  	EditHw2.AsValue := DBLookupComboBox43.KeyValue;
end;

procedure TFrmCadPedVenda.DBLookupComboBox44Exit(Sender: TObject);
begin
  inherited;
  if DBLookupComboBox44.KeyValue = null then
  	EditHw4.AsValue := 0
  else
  	EditHw4.AsValue := DBLookupComboBox44.KeyValue;
end;

procedure TFrmCadPedVenda.DBLookupComboBox45Exit(Sender: TObject);
begin
  inherited;
	if DBLookupComboBox45.KeyValue = null then
  	EditHw5.AsValue := 0
  else
  	EditHw5.AsValue := DBLookupComboBox45.KeyValue;
end;

procedure TFrmCadPedVenda.DBLookupComboBox46Exit(Sender: TObject);
begin
  inherited;
	if DBLookupComboBox46.KeyValue = null then
  	EditHw6.AsValue := 0
  else
  	EditHw6.AsValue := DBLookupComboBox46.KeyValue;
end;

procedure TFrmCadPedVenda.DBLookupComboBox4Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (activecontrol = bitbtn11) or (clicouNoX) then
    Exit;
  //  if not CadPedVenda.verificaColaboradorProdutos(2) then
  if not CadPedVenda.verificaColaboradorProdutos(false, true) then
    setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);
  //    DBEdit45.SetFocus;
end;

procedure TFrmCadPedVenda.DBLookupComboBox5Exit(Sender: TObject);
begin
  inherited;

  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (activecontrol = bitbtn28) or (clicouNoX) then
    Exit;
  if not CadPedVenda.verificaColaboradorServico(1) then
    if (Self.Enabled) and (Self.Visible) and (DBEdit59.CanFocus) then
	    DBEdit59.SetFocus;
end;

procedure TFrmCadPedVenda.DBLookupComboBox6Exit(Sender: TObject);
begin
  inherited;
  if CadPedVenda.vItServ.buscaServico(CadPedVenda.vItServ.dataSet.FieldByName('COD_SERVICO').AsInteger) then
  begin
    if CadPedVenda.vItServ.vTipServ.dataSet.FieldByName('SHONDA').AsString = 'S' then
    begin
      DBEdit62.Enabled := False;
      DBEdit58.Enabled := True;
    end
    else
    begin
      DBEdit62.Enabled := True;
      DBEdit58.Enabled := False;
    end;
  end;

  if (((vDadosIni.vEmp.vAgendaOficina = 'S') and (vDadosIni.vEmp.vUsarDisponibilidadeOS = 'A') and (CadPedVenda.vItServ.dataSet.FieldByName('COD_SERVICO').AsInteger > 0))
    or ((vDadosIni.vEmp.vAgendaOficina = 'S') and (CadPedVenda.dataSet.FieldByName('COD_AGENDA').AsInteger > 0))) then
        CadPedVenda.vItServ.abreMecanicos(CadPedVenda.vItServ.dataSet.FieldByName('COD_SERVICO').AsInteger);
end;

procedure TFrmCadPedVenda.DBLookupComboBox7Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (activecontrol = bitbtn28) or (clicouNoX) then
    Exit;
  if not CadPedVenda.verificaColaboradorServico(2) then
    if (Self.Enabled) and (Self.Visible) and (DBEdit60.CanFocus) then
	    DBEdit60.SetFocus;
end;

procedure TFrmCadPedVenda.DBMemo3Exit(Sender: TObject);
begin
  inherited;
  //if TDtmPedVenda(dtm)04.QRYOS.State = dsInsert then
  //    DBMemo3.Text := TDtmPedVenda(dtm)02.QRYempresaOBS_PAD_OS.AsString;
end;

procedure TFrmCadPedVenda.DBMemo5Exit(Sender: TObject);
begin
  inherited;
  //  if (ActiveControl <> BitBtn4) and (ActiveControl <> BitBtn5) and (ActiveControl <> BitBtn6) and
  //    (ActiveControl <> DBEdit77) and (ActiveControl <> DBLookupComboBox2) and
  //  (ActiveControl <> DBEdit30) and (ActiveControl <> DBEdit31) then
  //    tsServOS.Show;
end;

procedure TFrmCadPedVenda.dbObsReqSemLimiteExit(Sender: TObject);
begin
  inherited;
  if CadPedVenda.dataSet.State in [dsEdit, dsInsert] then
    CadPedVenda.dataSet.FieldByName('OBS_OS').AsString := AnsiUpperCase(CadPedVenda.fstr('OBS_OS'));
end;

procedure TFrmCadPedVenda.DesmarcarAgendamentoLinhaSelecionadasClick(
  Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;
    if CadPedVenda.vAgenda.IsEmpty then
    	exit;

    if not vDadosIni.PesqPros('AGO027', 'DESMARCA', '', 'AGENDA',
    	CadPedVenda.vAgenda.dataSet.FieldByName('COD_AGENDA').AsString, CadPedVenda.buscas, true) then
    	exit;

    if not CadPedVenda.salvarAgendamento(true, CadPedVenda.vAgenda.dataSet.FieldByName('COD_AGENDA').AsInteger) then
    	exit;
      
    CadPedVenda.vAgenda.Refresh;
    CadPedVenda.vAgenda.vAgendaItens.Refresh;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.Desmarcartodosservios1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    CadPedVenda.vAgenda.vAgendaItens._desmarcarTodos;
    DBLookupComboBox32.KeyValue := CadPedVenda.vAgenda.vAgendaItens.fBox.FieldByName('COD_BOX').AsInteger;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.edCodBarraEnter(Sender: TObject);
begin
  inherited;
  exitEdCodBarra := false;
  enter := false;
end;

procedure TFrmCadPedVenda.edCodBarraExit(Sender: TObject);
var
	vCodCondPag: Integer;
begin
  inherited;
  try
    if clicouNoX then
      exitEdCodBarra := true;
    if exitEdCodBarra then
      exit;
    if ActiveControl = DBGrid12 then
      exit;
    if trim(edCodBarra.Text) = '' then
    begin
      if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) then
	      edCodBarra.SetFocus;
      exit;
    end;
    Screen.Cursor := crHourGlass;
    if not enter then
    begin
      if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) and (activeControl <> edValorUnitarioVendaRapida) and (not clicouNoX) then
        edCodBarra.SetFocus;
      exit;
    end;
    enter := false;
    if (trim(edCodBarra.Text) = '') or (copy(trim(edCodBarra.Text), 1, 1) = ' ') then
      exit;
    if not CadPedVenda.abreFormEscolhaTipoVenda then
      exit;
    if not CadPedVenda.abreFormEscolhaTipoVendaOrc then
      exit;
    if vDadosIni.vEmp.vCliInicioVndRapida then
    begin
//    	vCodCondPag := CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger;
//
//      if (vCodCondPag > 0) then
//        if CadPedVenda.dataSet.State in [dsInsert, dsedit] then
//          CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger := 0;

      if not CadPedVenda.abreFormEscolhaClienteVND then
        exit;

//      if (CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger <= 0) and (vCodCondPag > 0) then
//        CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger := vCodCondPag;
    end
    else if CadPedVenda.vCliente.dataSet.FieldByName('COD_CLIENTE').AsInteger = 0 then
    begin
      CadPedVenda.vCliente.abreClientes(strtoint(vDadosIni.vCliente.vCodClientePadrao));
      
      CadPedVenda.vItProd._setaVariaveisPromocao(
      	CadPedVenda.vCliente.endAdic.cod_localidade_dest,
        CadPedVenda.vCliente.dataSet.FieldByName('cod_cliente').AsInteger,
        CadPedVenda.vCliente.dataSet.FieldByName('cod_tab_preco').AsInteger,
        CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger,
        CadPedVenda.vCliente.endAdic.cod_cidade_dest,
        CadPedVenda.dataSet.FieldByName('TIPV').AsString);
    end;

    if (CadPedVenda.vendaFechada) or (Trim(CadPedVenda.dataSet.FieldByName('status_ped').AsString) = 'CANCELADO') then
    begin
      if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) then
        edCodBarra.SetFocus;
      Exit;
    end;

    try
      if not ConsultaItem(edCodBarra.Text) then
      begin
        carregarImagemProdutos;
        if vDadosIni.getCampoPipe(CadPedVenda.vItProd.vNomeCampoErro, 1) = 'ITEMREPETIDO' then
          verificarItemRepetido(vDadosIni.getCampoPipe(CadPedVenda.vItProd.vNomeCampoErro, 2));

  //        Application.MessageBox('Item já incluso. Configuração na empresa não permite repetir item na venda.', 'Informação', MB_OK + MB_ICONEXCLAMATION);


        //      begin
  //        if Application.MessageBox('Item já incluso. Não é possível incluir o item novamente.', 'Confirmação', MB_YESNO + MB_ICONQUESTION+MB_DEFBUTTON1)= ID_YES then
  //          BitBtn18.Click
  //        else BitBtn10.Click;
  //      end ;
        if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) then
          edCodBarra.SetFocus;
        CadPedVenda.vItProd.dataSet.Cancel;
        exit;
      end;
      carregarImagemProdutos;
      CadPedVenda.calculaTotais;
      eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;
      pgVendaRapida.ActivePage := tsItens;
      try
        CadPedVenda.vItProd.dataSet.DisableControls;
        if CadPedVenda.vItProd.dataSet.State in [dsInsert, dsedit] then
          CadPedVenda.vItProd.post;
        CadPedVenda.calculaTotais;
        eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;
        lMsg.Caption := 'Informe o Código de Barras do Produto';

        panel38.Caption := vDadosIni.IfThen(CadPedVenda.getTipoVenda = 'REQ', 'Venda Rápida', 'Orçamento Rápido') +
            vDadosIni.IfThen(CadPedVenda.dataSet.FieldByName('nped').AsInteger > 0, ' ' +CadPedVenda.dataSet.FieldByName('nped').AsString, '') +
            vDadosIni.IfThen(Trim(CadPedVenda.dataSet.FieldByName('status_ped').AsString) <> '', ' ' +CadPedVenda.dataSet.FieldByName('status_ped').AsString, '');

        if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) then
          edCodBarra.SetFocus;
      finally
        CadPedVenda.vItProd.dataSet.EnableControls;
      end;
    finally
      CadPedVenda.vItProd.setDescontoValor(0, 0);
      CadPedVenda.vItProd.setDescontoPercenentual(0);
      CadPedVenda.vItProd.setAcrescimoValor(0);
      CadPedVenda.vItProd.setAcrescimoPercenentual(0);
    end;
  finally
    enter := false;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.edCodBarraKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vProduto: TProdutos;
begin
  inherited;
  if CadPedVenda.vendaFechada then
    exit;
  {if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      edCodBarra.Text := trim(vDadosIni.vPesquisa);
    finally
      Screen.Cursor := crDefault;
    end;
  end
  else if key = VK_F4 then
  begin
  	try
      vProduto := TProdutos.create;
      vProduto.CadProdutos(1);
    finnaly
    	if Assigned(vProduto) then
      	FreeAndNil(vProduto);
    end
  end
  else }
  if key = VK_RETURN then
  begin
    if Trim(edCodBarra.Text) = '' then
    begin
      alterarItemVendaRapida;
      Exit;
    end;
    enter := true;
    Perform(Wm_NextDlgCtl, 0, 0);
  end
  else if Key = VK_UP then
  begin
    if Trim(edCodBarra.Text) = '' then
    begin
      DBGrid12.Options := DBGrid12.Options + [dgRowSelect];
      CadPedVenda.vItProd.dataSet.Prior;
    end;
  end
  else if Key = VK_DOWN then
  begin
    if Trim(edCodBarra.Text) = '' then
    begin
      DBGrid12.Options := DBGrid12.Options + [dgRowSelect];
      CadPedVenda.vItProd.dataSet.Next;
    end;
  end;
end;

procedure TFrmCadPedVenda.Edit5Change(Sender: TObject);
begin
  inherited;
  CadPedVenda.vColab.FindNearest([Edit5.Text]);
end;

procedure TFrmCadPedVenda.Edit5Enter(Sender: TObject);
begin
  inherited;
  tempEdit5 := CadPedVenda.vColab.IndexFieldNames;
  CadPedVenda.vColab.IndexFieldNames := 'NOME_VENDEDOR';
  Edit5.OnChange := Edit5Change;
end;

procedure TFrmCadPedVenda.Edit5Exit(Sender: TObject);
begin
  inherited;
  CadPedVenda.vColab.IndexFieldNames := tempEdit5;
  Edit5.OnChange := nil;
end;

procedure TFrmCadPedVenda.EditFiscalCodBarraDevExit(Sender: TObject);
begin
//  inherited;
  if (TForm(pnDevolucao.Parent).ActiveControl = bitbtn75) or
    (TForm(pnDevolucao.Parent).ActiveControl = DBGrid20) or (clicouNoX) then
    Exit;

  if trim(TEditFiscal(Sender).Text) <> '' then
  begin
    if not CadPedVenda.vItProd._buscaProdutoParaDev(trim(EditFiscalCodBarraDev.Text)) then
    begin
      setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);
      TEditFiscal(Sender).SelectAll;
      GroupBox58.Caption := 'Código de Barras-------------------------- Produto: ';
      Exit;
    end
    else
    begin
      if CadPedVenda.vItProd._devolverItemVnd then
        PlaySound(Pchar('produto.wav'), 0, SND_ASYNC);
      CadPedVenda.calculaTotais;
      GroupBox58.Caption := 'Código de Barras-------------------------- Produto: ' + trim(CadPedVenda.vItProd.dataSet.FieldByName('DESCR_PROD_PED').AsString);
      Label183.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
      Label185.Caption := Format('%m', [CadPedVenda.vItProd.getValorItensLiquido]);
      EditFiscalCodBarraDev.Text := '';
      if (Self.Enabled) and (Self.Visible) and (TEditFiscal(Sender).CanFocus) then
	      TEditFiscal(Sender).SetFocus;
//      TEditFiscal(Sender).SelectAll;
    end;
  end;
end;

procedure TFrmCadPedVenda.EditFiscalCodBarraDevKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if (vDadosIni.vPesquisa = '') or (vDadosIni.vPesquisa = '0') then
        exit;
      EditFiscalCodBarraDev.Text := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
    EditFiscalCodBarraDevExit(EditFiscalCodBarraDev);
  end
  else
    if key = VK_RETURN then
      TForm(pnDevolucao.Parent).Perform(Wm_NextDlgCtl, 0, 0);
end;

procedure TFrmCadPedVenda.EditHw2Exit(Sender: TObject);
begin
  inherited;
	DBLookupComboBox43.KeyValue := EditHw2.AsValue;

  if EditHw2.AsValue <= 0 then
  	Exit;
end;

procedure TFrmCadPedVenda.EditHw4Exit(Sender: TObject);
begin
  inherited;
  DBLookupComboBox44.KeyValue := EditHw4.AsValue;

  if EditHw4.AsValue <= 0 then
  	Exit;
end;

procedure TFrmCadPedVenda.EditHw5Exit(Sender: TObject);
begin
  inherited;
	DBLookupComboBox45.KeyValue := EditHw5.AsValue;

  if EditHw5.AsValue <= 0 then
  	Exit;
end;

procedure TFrmCadPedVenda.EditHw6Exit(Sender: TObject);
begin
  inherited;
	DBLookupComboBox46.KeyValue := EditHw6.AsValue;

  if EditHw6.AsValue <= 0 then
  	Exit;
end;

procedure TFrmCadPedVenda.edValorUnitarioVendaRapidaExit(Sender: TObject);
var
	vTabPraticada: string;
begin
  inherited;
  if (ActiveControl = BitBtn73) or (clicouNoX) then
    exit;

  if not (CadPedVenda.vItProd.dataSet.State in [dsInsert, dsedit]) then
  	exit;

  if CadPedVenda.vendaFechada then
    exit;

  vTabPraticada := CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString;

  if not verificarDescontoTabDifPromPrecoQtde(
  	edValorUnitarioVendaRapida.Valor,
    edQuantidadeVendaRapida.Valor,
    CadPedVenda.vItProd.dataSet.FieldByName('VLUN_ORIG').AsFloat,
    CadPedVenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString,
    CadPedVenda.vItProd.dataSet.FieldByName('NAT_DESCACRES').AsString,
    CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsFloat) then
  begin
  	edValorUnitarioVendaRapida.Valor := CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat;

    edValorTotalVendaRapida.Valor := edValorUnitarioVendaRapida.Valor * edQuantidadeVendaRapida.Valor;
  	if (Self.Enabled) and (Self.Visible) and (TEditMoeda(sender).CanFocus) then
      TEditMoeda(sender).SetFocus;
    exit;
  end;

  CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsCurrency := TEditMoeda(sender).Valor;
  if not CadPedVenda.vItProd._validarAlteracaoPrecoUnitario(vTabPraticada) then
  begin
    if (Self.Enabled) and (Self.Visible) and (TDBEdit(sender).CanFocus) then
    	TEditMoeda(sender).SetFocus;
    exit;
  end;

  TEditMoeda(sender).Valor := CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsCurrency;

  if not CadPedVenda.vItProd.checaValoresItens then
    setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro);

  edValorTotalVendaRapida.Valor := edValorUnitarioVendaRapida.Valor * edQuantidadeVendaRapida.Valor;
end;

procedure TFrmCadPedVenda.EditMoeda6Exit(Sender: TObject);
begin
  inherited;
  if EditMoeda6.Valor <> 0 then
    CadPedVenda.vKit.abreKitProd(Trunc(EditMoeda6.Valor))
  else
    CadPedVenda.vKit.abreKitProd;
//  if (EditMoeda6.Valor <> 0) and (not CadPedVenda.vKit.IsEmpty) then
//  begin
  DBLookupComboBox31.KeyValue := CadPedVenda.vKit.dataSet.FieldByName('codigo_kit').AsInteger;
  if (not CadPedVenda.vKit.IsEmpty) then
    EditMoeda6.Valor := CadPedVenda.vKit.dataSet.FieldByName('codigo_kit').AsInteger;
//  end;
end;

procedure TFrmCadPedVenda.EditMoeda6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F3 then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('KITS_PROD');
      if (vDadosIni.vPesquisa = '') or (vDadosIni.vPesquisa = '0') then
        exit;
      CadPedVenda.vKit.abreKitProd(StrToInt(vDadosIni.vPesquisa));
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TFrmCadPedVenda.edHWPercAcresExit(Sender: TObject);
begin
  inherited;
  if (edHWPercAcres.AsValue <> 0) then
    edHWValorAcres.AsValue := 0;
end;

procedure TFrmCadPedVenda.edHWPercDescExit(Sender: TObject);
begin
  inherited;
  if (edHWPercDesc.AsValue <> 0) then
    edHWValorDesc.AsValue := 0;
end;

procedure TFrmCadPedVenda.edHWValorAcresExit(Sender: TObject);
begin
  inherited;
  if (edHWValorAcres.AsValue <> 0) then
    edHWPercAcres.AsValue := 0;
end;

procedure TFrmCadPedVenda.edHWValorDescExit(Sender: TObject);
begin
  inherited;
  if (edHWValorDesc.AsValue <> 0) then
    edHWPercDesc.AsValue := 0
end;

procedure TFrmCadPedVenda.edQuantidadeVendaRapidaExit(Sender: TObject);
var
  Ctrl: TWinControl;
begin
  inherited;
  if edQuantidadeVendaRapida.Valor > 0 then
  begin
  	try
      if (CadPedVenda.vItProd.vQuantidade <> edQuantidadeVendaRapida.Valor) then
      begin
        CadPedVenda.vItProd.setQuantidadePeloVendaRapida(
          edQuantidadeVendaRapida.Valor,
          DBComboBoxUnVendaRapida.Items[DBComboBoxUnVendaRapida.ItemIndex]);

        if (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
           or ((CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'P') and (vDadosIni.vPedVnd.ExibirDesconto.PrecoPromocao = 'S'))
           or ((CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'T') and (vDadosIni.vPedVnd.ExibirDesconto.PrecoDiferenciado = 'S'))
           or ((CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'Q') and (vDadosIni.vPedVnd.ExibirDesconto.PrecoQtde = 'S'))
           or ((CadPedVenda.vItProd._existePrecoPorQtde(CadPedVenda.dataSet.FieldByName('TIPV').AsString))
               and (trim(CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString) <> '')
               and (trim(CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString) <> '')) then
      	begin
          if not CadPedVenda.vItProd.buscaProduto(
            CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString,
            CadPedVenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger,
            CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString,
            CadPedVenda.vItProd.dataSet.FieldByName('cod_grade').AsInteger,
            false,
            false,
            false) then
          begin
            if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
              TDBEdit(Sender).SetFocus;
            Exit;
          end;
        end;
      end;
    finally
    	CadPedVenda.vItProd.vQuantidade := edQuantidadeVendaRapida.Valor;
    end;

    Ctrl := TForm(Panel36.Parent).ActiveControl;
    DBEdit10Exit(edQuantidadeVendaRapida);

    edValorUnitarioVendaRapida.Valor := CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat;

    edValorTotalVendaRapida.Valor := edValorUnitarioVendaRapida.Valor * edQuantidadeVendaRapida.Valor;

    if Ctrl <> nil then
      if not Ctrl.CanFocus then
        if (Self.Enabled) and (Self.Visible) and (DBComboBoxUnVendaRapida.CanFocus) then
          DBComboBoxUnVendaRapida.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (edValorUnitarioVendaRapida.CanFocus) then
          edValorUnitarioVendaRapida.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (MaskEdit7.CanFocus) then
          MaskEdit7.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBEdit93.CanFocus) then
          DBEdit93.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (BitBtn74.CanFocus) then
          BitBtn74.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.ed_nf_ac_outrasExit(Sender: TObject);
begin
  inherited;
  with CadPedVenda do if (dataSet.State in [dsinsert, dsedit]) then
  begin
    dataSet.FieldByName('ACRESCIMO').AsFloat := f_float('NF_AC_SEGURO') +
                                                f_float('NF_AC_OUTRAS') +
                                                f_float('NF_AC_FRETE') +
                                                f_float('NF_AC_IPI') +
                                                f_float('NF_AC_ICMSST') +
                                                f_float('NF_AC_FCPST') +
                                                f_float('NF_AC_IMPOSTO_II') +
                                                f_float('NF_AC_VICMDESON');
    calculaDescontoAcrescimo;
    eSubTotal.Valor := ffloat('valor_total');
  end;
end;

procedure TFrmCadPedVenda.ed_nf_dc_descontoExit(Sender: TObject);
begin
  inherited;
  with CadPedVenda do if (dataSet.State in [dsinsert, dsedit]) then
  begin
    dataSet.FieldByName('DESCONTO').AsFloat := f_float('NF_DC_DESCONTO') +
                                               f_float('NF_DC_VICMDESON');
    if not calculaDescontoAcrescimo then
      if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
        TDBEdit(Sender).SetFocus;
    eSubTotal.Valor := ffloat('valor_total');
  end;
end;

procedure TFrmCadPedVenda.estoque_minimo_notificar(Sender: TObject);
var
  Aprodutos: TDataSet_OOP;
begin
  Aprodutos                   := TDataSet_OOP(Sender);
  lb_modal_inf.Visible        := False;
  lb_modal_inf2.Visible       := False;
  pn_modal_top.Visible        := True;
  bt_modal_ok.Visible         := True;
  pn_modal_top.Caption        := 'Relação de estoque de mercadorias';
  grid_modal.OnDrawColumnCell := estoque_minimo_notificar_DrawColumnCell;
  try
    grid_modal.Visible    := True;
    grid_modal.DataSource := Aprodutos._dataSourceOOP;

    vDadosIni.abreForm('Relação de estoque de mercadorias', pn_modal, opFormsDefCad);

  finally
    bt_modal_ok.Visible         := False;
    grid_modal.OnDrawColumnCell := nil;
    grid_modal.DataSource       := nil;
    form_memo_botoes_restore;
  end;
end;

procedure TFrmCadPedVenda.estoque_minimo_notificar_DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  Agrid: TDBGrid;
begin
  inherited;
  Agrid := TDBGrid(Sender);
    if ((Column.FieldName = 'DISPONIVEL') and (Agrid.DataSource.DataSet.FieldByName('disponivel').AsFloat < 0)) or
       ((Column.FieldName = 'MINIMO') and (Agrid.DataSource.DataSet.FieldByName('disponivel').AsFloat > 0) and
        (Agrid.DataSource.DataSet.FieldByName('disponivel').AsFloat <= Agrid.DataSource.DataSet.FieldByName('minimo').AsFloat)) then
    begin
      if (gdFocused in State) then
        Agrid.Canvas.Font.Color := clWhite
      else if (Column.FieldName = 'DISPONIVEL') then
        Agrid.Canvas.Brush.Color := $00B3B3FF
      else
        Agrid.Canvas.Brush.Color := $00CCFFFF;
      Agrid.Canvas.FillRect(Rect);
      Agrid.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
end;

procedure TFrmCadPedVenda.EventDescPercTotProdChange;
var
  AValorProdQuePermiteDesconto: Double;
begin
  lbDescProdPerc.Caption       := Format('%0.2n', [CadPedVenda.dataSet.FieldByName('desc_p_prod').AsFloat]) + ' %';
  AValorProdQuePermiteDesconto := CadPedVenda.GetValorProdQuePermiteDesconto;

  edDescProdValor.AsValue      := AValorProdQuePermiteDesconto * CadPedVenda.dataSet.FieldByName('desc_p_prod').AsFloat / 100;
  lbDescProdVal.Caption        := 'R$ ' + Format('%0.2n', [edDescProdValor.AsValue]);
end;

procedure TFrmCadPedVenda.EventDescPercTotServChange;
begin
  lbDescServPerc.Caption       := Format('%0.2n', [CadPedVenda.dataSet.FieldByName('desc_p_serv').AsFloat]) + ' %';

  edDescServValor.AsValue      := CadPedVenda.dataSet.FieldByName('tot_serv').AsFloat * CadPedVenda.dataSet.FieldByName('desc_p_serv').AsFloat / 100;
  lbDescServVal.Caption        := 'R$ ' + Format('%0.2n', [edDescServValor.AsValue]);
end;

procedure TFrmCadPedVenda.EventAcrescPercTotProdChange;
begin
	lbAcrescProdPerc.Caption     := Format('%0.2n', [CadPedVenda.dataSet.FieldByName('acresc_p_prod').AsFloat]) + ' %';

  edAcrescProdValor.AsValue    := CadPedVenda.dataSet.FieldByName('tot_prod').AsFloat * CadPedVenda.dataSet.FieldByName('acresc_p_prod').AsFloat / 100;
  lbAcrescProdVal.Caption      := 'R$ ' + Format('%0.2n', [edAcrescProdValor.AsValue]);
end;

procedure TFrmCadPedVenda.EventAcrescPercTotServChange;
begin
	lbAcrescServPerc.Caption     := Format('%0.2n', [CadPedVenda.dataSet.FieldByName('acresc_p_serv').AsFloat]) + ' %';

  edAcrescServValor.AsValue    := CadPedVenda.dataSet.FieldByName('tot_serv').AsFloat * CadPedVenda.dataSet.FieldByName('acresc_p_serv').AsFloat / 100;
  lbAcrescServVal.Caption      := 'R$ ' + Format('%0.2n', [edAcrescServValor.AsValue]);
end;

procedure TFrmCadPedVenda.DevItensExibir(Sender: TObject);
begin
  if not Assigned(grid_dev_ped_itens.DataSource) then
    Exit;

  if not Assigned(grid_dev_ped_itens.DataSource.DataSet) then
    Exit;

  pn_dev_ped_itens.Visible := (grid_dev_ped_itens.DataSource.DataSet.Active) and
                              (grid_dev_ped_itens.DataSource.DataSet.RecordCount > 0) and
                              (MatchText(ActiveControl.Name, [DBGrid2.Name, DBGrid3.Name, DBGrid2.Name,
                                                              grid_dev_ped_itens.Name, grid_dev_rap_itens.Name, grid_dev_os_itens.Name]));
  pn_dev_rap_itens.Visible := pn_dev_ped_itens.Visible;
  pn_dev_os_itens.Visible := pn_dev_ped_itens.Visible;
  Splitter_dev_itens.Visible := pn_dev_ped_itens.Visible;
  splitter_dev_os_itens.Visible := Splitter_dev_itens.Visible;
  splitter_dev_rap_itens.Visible := Splitter_dev_itens.Visible;
  Splitter_dev_itens.Left := 0;   
  splitter_dev_rap_itens.Top := 0;
  splitter_dev_os_itens.Left := 0;
  if pn_dev_ped_itens.Visible then
  begin
    grid_dev_ped_itens.Columns[0].Width := grid_dev_ped_itens.Canvas
      .TextWidth(grid_dev_ped_itens.DataSource.DataSet.FieldByName(grid_dev_ped_itens.Columns[0].FieldName).AsString) + 10;
    grid_dev_rap_itens.Columns[0].Width := grid_dev_ped_itens.Columns[0].Width;
    grid_dev_os_itens.Columns[0].Width := grid_dev_ped_itens.Columns[0].Width;
  end;
end;

procedure TFrmCadPedVenda.DevItensHidePanels;
begin
  CadPedVenda.vItProd.DevInternaReset(False);
  pn_dev_ped_itens.Tag := IfThen(	CadPedVenda.vItProd.DevInterna.Active, 1, 0);
  pn_dev_ped_itens.Visible := False;
  pn_dev_os_itens.Visible := False;
  pn_dev_rap_itens.Visible := False;
  Splitter_dev_itens.Visible := False;
  splitter_dev_os_itens.Visible := False;
  splitter_dev_rap_itens.Visible := False;
end;

procedure TFrmCadPedVenda.DevolucaoPedidoClick(Sender: TObject);
begin
	try
    if (trim(CadPedVenda.dataSet.FieldByName('tipo').AsString) <> 'REQ')
      and (trim(CadPedVenda.dataSet.FieldByName('tipo').AsString) <> 'OS') then
    begin
      Application.MessageBox(pchar('Não é permitido fazer devolução para Orçamento.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
      Exit;
    end;

    if not CadPedVenda.vendaFechada then
    begin
      Application.MessageBox(pchar('Venda não esta fechada.'), 'Atenção', MB_ICONINFORMATION + MB_OK);
      Exit;
    end;

    if not _mdiAberto('TfrmDevolucao', 'O modulo de Devolução se encontra aberto!') then
      Exit;

    vDadosIni.dev_gerardevolucao(
      CadPedVenda.dataSet.FieldByName('NPED').AsInteger,
      CadPedVenda.dataSet.FieldByName('TIPO').AsString,
      CadPedVenda.dataSet.FieldByName('DATA_FECH').AsDateTime);
  finally
    CadPedVenda.Refresh;
  end;
end;

procedure TFrmCadPedVenda.exitAcrescimoOSProdServ(Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;
    if (CadPedVenda.vItProd.dataSet.State in [dsinsert, dsedit]) then
      Exit;

    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
      Exit;

    if CadPedVenda.vendaFechada then
      Exit;

    if not (CadPedVenda.dataSet.State in [dsinsert, dsedit]) then
      Exit;

    try
      CadPedVenda.EventAcrescPercTotServChange := nil;
      CadPedVenda.EventAcrescPercTotServChange := nil;

      if Sender = edAcrescProdValor then
        CadPedVenda.dataSet.FieldByName('acresc_p_prod').AsFloat := IfThen(CadPedVenda.dataSet.FieldByName('tot_prod').AsFloat > 0, edAcrescProdValor.AsValue / CadPedVenda.dataSet.FieldByName('tot_prod').AsFloat * 100)
      else if Sender = edAcrescServValor then
        CadPedVenda.dataSet.FieldByName('acresc_p_serv').AsFloat := IfThen(CadPedVenda.dataSet.FieldByName('tot_serv').AsFloat > 0, edAcrescServValor.AsValue / CadPedVenda.dataSet.FieldByName('tot_serv').AsFloat * 100);

    finally
      CadPedVenda.EventAcrescPercTotProdChange := EventAcrescPercTotProdChange;
      CadPedVenda.EventAcrescPercTotServChange := EventAcrescPercTotServChange;
    end;

    if not CadPedVenda.calculaDescontoAcrescimo then
      if CadPedVenda.vNomeCampoErro <> '' then
        setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro)
      else if Sender is TWinControl then
        if (Self.Enabled) and (Self.Visible) and (TWinControl(Sender).CanFocus) then
          TWinControl(Sender).SetFocus;
    Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
//    Label61.Caption := Format('%m', [CadPedVenda.getValorServicoTerceiro]);
//    Label82.Caption := Format('%m', [CadPedVenda.getValorProdutoTerceiro]);
    eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;
  finally
    lbAcrescProdPerc.Caption := Format('%0.2n', [CadPedVenda.dataSet.FieldByName('acresc_p_prod').AsFloat]) + ' %';
    lbAcrescServPerc.Caption := Format('%0.2n', [CadPedVenda.dataSet.FieldByName('acresc_p_serv').AsFloat]) + ' %';
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.exitCliente(Sender: TObject);
var
  vVenda: Boolean;
  vOK: Boolean;
  vCodCondPag: Integer;
  vPerguntar: Boolean;
  vtemp: string;
  vcnpjcpf, vcelular: string;
  vHabTeste: boolean;
  ConfigPoliticaPag: TConfig_sistema_class;
  vUsarControlesVenda: string;
  vCodCondPagTmp: Integer;
  AProcedure: Tcl_abreSituacaoDeCaixa;
  vAtualizarCl: Boolean; 
begin
	try
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (activecontrol = BitBtn71) or (clicouNoX) or (activecontrol=DBComboBox1) then
      Exit;

    if CadPedVenda.vendaFechada then
      Exit;

    if not (CadPedVenda.dataSet.State in [dsinsert, dsedit]) then
      Exit;

    if CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger <= 0 then
    	CadPedVenda.vCodClienteExit := CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger
    else
    begin
      if CadPedVenda.vCodClienteExit = CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger then
        Exit;
    end;

    ConfigPoliticaPag := TConfig_sistema_class.getConf('ped_vnd_definir_politica_pagamento', CadPedVenda.buscas, vDadosIni.cod_empresa);
  	vUsarControlesVenda := UpperCase(ConfigPoliticaPag.ReadString('CONTROLE', 'Usar'));

    if (TDbedit(sender).text = '') and (CadPedVenda.getTipoVenda <> 'REQ') then
    begin
      //    if CadPedVenda.vEmp.dataSet.FieldByName('DADVAP').AsString = 'SIM' then
      if (CadPedVenda.getTipoVenda = 'ORC') and (CadPedVenda.OrcamentoSoPecas) then
      else
        if vDadosIni.vEmp.vUsarAparelho = 'S' then
        begin
          vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('EQUIPAMENTO', ' AND EQUIPAMENTO.TIP_EQUIP = ''E'' ', '');
          if (Trim(vDadosIni.vPesquisa) = '') then
            vDadosIni.vPesquisa := '0';
          CadPedVenda.buscaAparelho(StrToInt(vDadosIni.vPesquisa), Memo2);
        end
        else
        begin
          vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('VEICULOS');
          if (Trim(vDadosIni.vPesquisa) = '') then
            vDadosIni.vPesquisa := '0';
          CadPedVenda.buscaVeiculo(vDadosIni.vPesquisa, 0, Memo1, vDadosIni.vPesquisaPlaca, vDadosIni.vPesquisaChassi);
        end;
    end;
    if (CadPedVenda.getTipoVenda <> 'ORC') then
    begin
     if vDadosIni.vEmp.vUsarAparelho <> 'S' then
     begin
      if vDadosIni.vEmp.vConcess = 'S' then
      begin
        if CadPedVenda.getTipoVenda <> 'ORC' then
        begin
          if (DBEdit38.text <> '') and (vDadosIni.vEmp.vcodconcess <> 0) then
          begin
             if (CadPedVenda.dataSet.State = dsinsert) then
              VerRecallHonda(vDadosIni.vBancoHW, strtoint(vDadosIni.codEmpresa), vDadosIni.vNivel,
                CadPedVenda.dataSet.FieldByName('CHASSI').AsString, inttostr(vDadosIni.vEmp.vcodconcess),
                'IHSWSDL', vDadosIni.vEmp.vCHAVEIHS, '13540', vDadosIni.vEmp.vDATAVALCHIHS);
          end;
        end;
      end;
     end;
    end;

    if TDbedit(sender).text = '' then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
        if (Trim(vDadosIni.vPesquisa) = '') then
          vDadosIni.vPesquisa := '0';
        CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsString := vDadosIni.vPesquisa;
      finally
        Screen.Cursor := crDefault;
      end;
    end;

    if TDbedit(sender).text <> '' then
    begin
      if not CadPedVenda.vCliente.LocCliente(CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
      begin
        try
          if CadPedVenda.vCliente.possivelCli then
          begin
            Screen.Cursor := crHourGlass;
            vDadosIni.vPesquisa := CadPedVenda.dataSet.FieldByName('cod_cliente').AsString;
            CadPedVenda.cadCliente(2);
          end;
        finally
          Screen.Cursor := crDefault;
        end;
        if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
          TDbedit(sender).SetFocus;
        exit;
      end
      else if (CadPedVenda.dataSet.State in [dsinsert, dsEdit])
      	and ((Trim(CadPedVenda.dataSet.FieldByName('tipo').AsString) = 'REQ') or (Trim(CadPedVenda.dataSet.FieldByName('tipo').AsString) = 'OS')) then
      begin
        if (vUsarControlesVenda = 'S') then
        begin
          CadPedVenda.vCtrl.dataSet.Close;
          if vDadosIni.vEmp.vUsarControlesCliente = 'S' then
            if Trim(CadPedVenda.vCliente.dataSet.FieldByName('controles_fp').AsString) <> '' then
              CadPedVenda.vCtrl._selecionaControlesFP(Trim(CadPedVenda.vCliente.dataSet.FieldByName('controles_fp').AsString));

          if not CadPedVenda.vCtrl.dataSet.Active then
            CadPedVenda.vCtrl._selecionaControlesFP('');

          if CadPedVenda.vCtrl.dataSet.RecordCount = 1 then
            CadPedVenda.dataSet.FieldByName('cod_controle').AsInteger :=
            CadPedVenda.vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger;
        end;
      end;

      CadPedVenda.retornaVendedorCarteira;

      if (CadPedVenda.dataSet.State in [dsinsert, dsEdit]) then
        if vDadosIni.vCliente.vCondPagPorCliente then
        begin
          if (not CadPedVenda.vendaFechada) then
            if CadPedVenda.vCliOriginalVND <> CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger then
              CadPedVenda.vCondPag.abreCondPag(CadPedVenda.vCliente.dataSet.FieldByName('COND_PAG_VND').AsString);

          if (not CadPedVenda.vendaFechada) then
            if (CadPedVenda.vCliente.dataSet.FieldByName('COND_PAG_VND').AsString <> '') then
            begin
            	vCodCondPag := CadPedVenda.vCliente.CondPag.GetPrimeiraCondPagCliente(
                CadPedVenda.vCliente.dataSet.FieldByName('COND_PAG_VND').AsString,
                CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger);

              if vCodCondPag > 0 then
              begin
              	vCodCondPagTmp := CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger;

              	CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger := vCodCondPag;

                if (vCodCondPagTmp <> CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger) and (vDadosIni.vPedVnd.AcrescCondPagComissaoVend) then
                	exitCondPag(Sender);
              end;
            end;
        end
        else if (CadPedVenda.vCliente.dataSet.FieldByName('cod_cond_pag').AsInteger > 0) and
          (CadPedVenda.vCliente.dataSet.FieldByName('cod_cond_pag').AsInteger <> CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger) then
        begin
          if (not CadPedVenda.vendaFechada) then
          begin
          	vCodCondPagTmp := CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger;

            CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger :=
            	CadPedVenda.vCliente.dataSet.FieldByName('cod_cond_pag').AsInteger;

            if (vCodCondPagTmp <> CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger) and (vDadosIni.vPedVnd.AcrescCondPagComissaoVend) then
            	exitCondPag(Sender);
          end;
        end
        else if (CheckBox4.Checked) or (trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'OS') then
        begin
          if (not CadPedVenda.vendaFechada) then
            if CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsString = '' then
            begin
            	vCodCondPagTmp := CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger;

              CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsString :=
                CadPedVenda.retornaValor(' select first 1 cond_pag.cod_cond_pag AS VALOR from cond_pag ' +
                	' inner join cond_pag_empresa on ' +
                  ' 	cond_pag_empresa.cod_cond_pag = cond_pag.cod_cond_pag ' +
                  '   and cond_pag_empresa.cod_empresa = ' + vDadosIni.codEmpresa +
                  ' where cond_pag.desc_cond_pag like ''%IST%'' ' +
                  ' and cond_pag.ativo = 1 ' +
                  ' ORDER BY cond_pag.seqpreco ');

              if (vCodCondPagTmp <> CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger) and (vDadosIni.vPedVnd.AcrescCondPagComissaoVend) then
            		exitCondPag(Sender);
            end;

          if (not CadPedVenda.vendaFechada) then
            if CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsString = '' then
            begin
            	vCodCondPagTmp := CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger;

              CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsString :=
                CadPedVenda.retornaValor(' select first 1 cond_pag.cod_cond_pag AS VALOR from cond_pag ' +
                	' inner join cond_pag_empresa on ' +
                  ' 	cond_pag_empresa.cod_cond_pag = cond_pag.cod_cond_pag ' +
                  '   and cond_pag_empresa.cod_empresa = ' + vDadosIni.codEmpresa +
                	' where cond_pag.ativo = 1 ');

              if (vCodCondPagTmp <> CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger) and (vDadosIni.vPedVnd.AcrescCondPagComissaoVend) then
            		exitCondPag(Sender);
            end;
        end;
    end;

    if trim(TDbedit(sender).Text) = '' then
    begin
      Application.MessageBox('Campo Cliente não pode ser vazio', 'Informação', MB_OK +
        MB_DEFBUTTON1);
      if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
        TDbedit(sender).setfocus;
      exit;
    end;

    if (CadPedVenda.getTipoVenda <> 'ORC') then
    begin
    	if (CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
      begin
      	CadPedVenda.vCliente.abreClientes(CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger);
      	if not CadPedVenda.vCliente.dataSet.IsEmpty then
        begin
          vAtualizarCl := False;

          if (vDadosIni.vEmp.vFinanceiroUnificado)
            and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
          begin
          	if trim(CadPedVenda.vCliente.dataSet.FieldByName('CPFCGC').AsString) <> '' then
              if (vDadosIni.negativarClientes(0, trim(CadPedVenda.vCliente.dataSet.FieldByName('CPFCGC').AsString))) then
                vAtualizarCl := True;
          end
          else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
          begin
          	if (vDadosIni.negativarClientes(CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger, '')) then
            	vAtualizarCl := True;
          end;

          if (vDadosIni.baixarRecAntValeCompra(CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger)) then
          	vAtualizarCl := True;

          if (vAtualizarCl) then
						CadPedVenda.vCliente.dataSet.Refresh;
        end;
      end;

      if not CadPedVenda.vCliente.dataSet.FieldByName('CODIGO_FATURAMENTO').IsNull then
        if CadPedVenda.vCliente.faturamentoBarrado(CadPedVenda.vCliente.dataSet.FieldByName('CODIGO_FATURAMENTO').AsInteger) then
        begin
  //        if not vDadosIni.PesqPros('VND049', 'LIBERAR', CadPedVenda.dataSet.FieldByName('COD_CLIENTE').asstring + ' ' +
  //          CadPedVenda.vCliente.dataSet.FieldByName('NOME_CLIENTE').AsString, 'PEDVENDA',
  //          CadPedVenda.dataSet.FieldByName('NPED').asstring, CadPedVenda.buscas, True) then
  //        begin
  //          TDbedit(sender).setfocus;
  //          Exit;
  //        end
  //        else
  //        begin
            if Application.MessageBox('Deseja continuar a venda?', 'Confirmação', MB_YESNO +
              MB_DEFBUTTON1) = mrNO then
            begin
              if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
                TDbedit(sender).setfocus;
              Exit;
            end
            else
            begin
            //          if CadPedVenda.getTipoVenda = 'REQ' then
            //          dbedit5.SetFocus;
            end;
  //        end;
        end;
    end;
    if (CadPedVenda.getTipoVenda='REQ') then
     CadPedVenda.verificarSalvamentoAutomatico(true);
    if not CadPedVenda.ChecaTipVendaCliente(DBComboBox1.Text) then
      if not vDadosIni.PesqPros('VND050', 'LIBERAR', CadPedVenda.dataSet.FieldByName('COD_CLIENTE').asstring + ' ' +
        CadPedVenda.vCliente.dataSet.FieldByName('NOME_CLIENTE').AsString, 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').asstring, CadPedVenda.buscas, True) then
      begin
        if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
          TDbedit(sender).setfocus;
        Exit;
      end
      else
      begin
        if Application.MessageBox('Deseja continuar a venda?', 'Confirmação', MB_YESNO +
          MB_DEFBUTTON1) = mrNO then
        begin
          if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
            TDbedit(sender).setfocus;
          Exit;
        end
        else
        begin
          //        dbedit5.SetFocus;
        end;
      end;

    if CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger <> strtoint(vDadosIni.vCliente.vCodClientePadrao) then
    begin
    	try
      	if vDadosIni.vCliente.AHandle = 0 then
          CarregaPacote('pkClientes', vDadosIni.vCliente.AHandle);

        if vDadosIni.vCliente.AHandle = 0 then
        begin
          Application.MessageBox('Pacote Cliente não carregado', 'Anteção', 0 + 64);
          Exit;
        end;

        @AProcedure := GetProcAddress(vDadosIni.vCliente.AHandle, 'cl_abreSituacaoDeCaixa');

        if Assigned(AProcedure) then
          if not AProcedure(
            CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger,
            False,
            (CadPedVenda.getTipoVenda <> 'ORC'),
            '') then
          begin
            if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
              TDbedit(sender).SetFocus;
            exit;
          end;

      finally
      end;
//     	try
//        vCliente := TCadClientes.create;
//        vCliente.abreClientes(CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger);
//
//        if vCliente.SituacaoDeCaixa(false, (CadPedVenda.getTipoVenda <> 'ORC')) = false then
//        begin
//          if (Self.Enabled) and (Self.Visible) and (TDbedit(sender).CanFocus) then
//            TDbedit(sender).SetFocus;
//           exit;
//        end;
//
//      finally
//        if Assigned(vCliente) then
//					FreeAndNil(vCliente);
//      end;
    end
    else if Pos(CadPedVenda.getTipoVenda, vDadosIni.vPedVnd.TiposDocUsamDadosClienteAvulso) > 0 then
      if not vDadosIni.vPedVnd.TiposDocUsamDadosClienteAvulso_AbrirAoSalvar then
        CadPedVenda.abreFormDadosClienteAvulso;

    if (CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger > 0) and
      (vDadosIni.vEmp.vEditarCliVenda = 'S') then
      //    (CadPedVenda.vEmp.dataSet.FieldByName('US_EDICAOCLIENTE_VENDA').AsString = 'S') then
    begin
      try
        Screen.Cursor := crHourGlass;
        vDadosIni.vPesquisa := CadPedVenda.dataSet.FieldByName('cod_cliente').AsString;
        CadPedVenda.cadCliente(2);
      finally
        Screen.Cursor := crDefault;
      end;
    end
    else if (vDadosIni.vProgFid.vHabilitarProgFid)
      and (vDadosIni.vProgFid.vHabilitarProgFidAPI) then
    begin
      if (CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger <>
        StrToIntDef(vDadosIni.vCliente.vCodClientePadrao, 0)) then
      begin
        if  (trim(CadPedVenda.vCliente.dataSet.FieldByName('CPFCGC').AsString) = '')
          or (trim(CadPedVenda.vCliente.dataSet.FieldByName('FONE_CELULAR').AsString) = '') then
        begin
          try
            vtemp := '';
            vcnpjcpf := trim(CadPedVenda.vCliente.dataSet.FieldByName('CPFCGC').AsString);
            vcelular := trim(CadPedVenda.vCliente.dataSet.FieldByName('FONE_CELULAR').AsString);

            Screen.Cursor := crHourGlass;

            vHabTeste := false;

            //CPF
            if vDadosIni.vProgFid.vHabilitarFuncaoCNPJIntegracaoAPI then
              vHabTeste := true
            else if Length(trim(vcnpjcpf)) = 11 then
              vHabTeste := true;

            if vHabTeste then
            begin
              if (vcnpjcpf = '') and (vcelular = '') then
                vtemp := vtemp + 'cpf/cnpj e ceular'
              else if (vcnpjcpf = '') then
                vtemp := vtemp + 'cpf/cnpj'
              else  if (vcelular = '') then
                vtemp := vtemp + 'celular';

              Application.MessageBox(Pchar('Cliente sem o ' + vtemp + ' informado. ' + #13 + #13 + 'Favor verificar!'),
               'Atenção', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
              vDadosIni.vPesquisa := CadPedVenda.dataSet.FieldByName('cod_cliente').AsString;
              CadPedVenda.cadCliente(2, true);
            end;
          finally
            Screen.Cursor := crDefault;
          end;
        end;
      end;
    end;

    if CadPedVenda.vCodClienteOld <> CadPedVenda.fint('COD_CLIENTE') then
      CadPedVenda.GetClienteFaturamento(CadPedVenda.fint('COD_CLIENTE'));

    if CadPedVenda.vCodClienteOld <> CadPedVenda.fint('COD_CLIENTE') then
    begin
      if (trim(CadPedVenda.getTipoVenda) = 'REQ') then
        CadPedVenda.dataSet.FieldByName('OBS_PED').AsString := CadPedVenda.retornaObsREQ_OS(
          CadPedVenda.dataSet.FieldByName('OBS_PED').AsString,
          CadPedVenda.vCodClienteExit,
          CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger)
      else if (trim(CadPedVenda.getTipoVenda) = 'OS') then
        CadPedVenda.dataSet.FieldByName('OBS_OS').AsString := CadPedVenda.retornaObsREQ_OS(
          CadPedVenda.dataSet.FieldByName('OBS_OS').AsString,
          CadPedVenda.vCodClienteExit,
          CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger)
      else if (trim(CadPedVenda.getTipoVenda) = 'ORC') then
        CadPedVenda.dataSet.FieldByName('OBS_OS').AsString := CadPedVenda.retornaObsREQ_OS(
          CadPedVenda.dataSet.FieldByName('OBS_OS').AsString,
          CadPedVenda.vCodClienteExit,
          CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger);
    end;

    vOK:= True;
    vPerguntar:= false;
    if (CadPedVenda.getTipoVenda = 'OS')
      and (CadPedVenda.vItProd._usarPrecoCustoTiposVendas(CadPedVenda.getTipoVenda, CadPedVenda.dataSet.FieldByName('TIPO_OS').AsString)) then
    begin
        vDadosIni.vInibeMensPesqPros := 'S';
        vPerguntar := vDadosIni.PesqPros('VND181', 'VALIDACAO', '', 'PEDVENDA',
          CadPedVenda.dataSet.FieldByName('NPED').AsString, CadPedVenda.buscas, true);
        if vPerguntar then
          vOK := Application.MessageBox('Preço de custo ativado. Deseja refazer o cálculo dos preços?',
            'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES;
    end
    else
    begin
      vOK := false;
      if (CadPedVenda.vCodClienteOld <= 0) then
        CadPedVenda.vCodClienteOld := CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger;

      if (CadPedVenda.vCodClienteOld <> CadPedVenda.f_int('COD_CLIENTE')) or
         (CadPedVenda.vDest_seqidOld <> CadPedVenda.f_int('DEST_SEQID')) then
        vOK := true
      else if (CadPedVenda.vCodClienteOld = CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger) then
      	vOK := vDadosIni.PesqPros('VND227', 'RECALCULAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False, False, True);
    end;

    if vOK then
    begin
      CadPedVenda.vCodClienteOld := CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger;
      CadPedVenda.vDest_seqidOld := CadPedVenda.dataSet.FieldByName('DEST_SEQID').AsInteger;

      CadPedVenda.vItProd._setaVariaveisPromocao(
      	CadPedVenda.vCliente.endAdic.cod_localidade_dest,
        CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger,
        CadPedVenda.vCliente.dataSet.FieldByName('cod_tab_preco').AsInteger,
        CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger,
        CadPedVenda.vCliente.endAdic.cod_cidade_dest,
        CadPedVenda.dataSet.FieldByName('TIPV').AsString);

      try
        DBGrid3.DataSource.DataSet.DisableControls;
        CadPedVenda._recalcularPrecoProdutosPromocao;
        if not CadPedVenda.str_empty('nf_ac_calctrib') then
          CadPedVenda.fat_ped.calcular_valores_nf;
      finally
        DBGrid3.DataSource.DataSet.EnableControls;
      end;
    end;

    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);

    if CheckBox4.Checked then
      eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;

    tsOrdemServ.Tag := 1;
    if CadPedVenda.getTipoVenda = 'REQ' then
    begin
      if not DBEdit5.Enabled then
      begin
        DBEdit5Exit(Sender);
        DBLookupComboBox16Exit(Sender);
      end;
    end;
//    else if not((ActiveControl is TDBComboBox) or (ActiveControl is TBitBtn)) then
//      Perform(WM_NEXTDLGCTL, 0, 0);

  	CadPedVenda.vCodClienteExit := CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger;
  finally
  	if Assigned(ConfigPoliticaPag) then
      FreeAndNil(ConfigPoliticaPag);
  end;
end;

procedure TFrmCadPedVenda.exitCondPag(Sender: TObject);
var
	vOK: boolean;
  vAtualizarCl: Boolean; 
begin
 	vOK := false;

  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (activecontrol = BitBtn71) or (clicouNoX) or (activecontrol=DBComboBox1) then
    Exit;

  if CadPedVenda.vendaFechada then
  	Exit;

  if not (CadPedVenda.dataSet.State in [dsinsert, dsedit]) then
  	Exit;

  if CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsInteger <= 0 then
  	CadPedVenda.vCodCondPagExit := CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsInteger
  else
  begin
    if CadPedVenda.vCodCondPagExit = CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsInteger then
      Exit;
  end;

  if (CadPedVenda.getTipoVenda <> 'ORC') then
  begin
    if (CadPedVenda.vCodCondPagOld <> CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsInteger) then
    begin
      if (vDadosIni.vCliente.vendaVistaClientesBarrados) then
      begin
      	if (CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
        begin
        	CadPedVenda.vCliente.abreClientes(CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger);
          if not CadPedVenda.vCliente.dataSet.IsEmpty then
        	begin
          	vAtualizarCl := False;

            if (vDadosIni.vEmp.vFinanceiroUnificado)
              and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
            begin
            	if trim(CadPedVenda.vCliente.dataSet.FieldByName('CPFCGC').AsString) <> '' then
                if (vDadosIni.negativarClientes(0, trim(CadPedVenda.vCliente.dataSet.FieldByName('CPFCGC').AsString))) then
                  vAtualizarCl := True;
            end
            else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
          	begin
            	if (vDadosIni.negativarClientes(CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger, '')) then
              	vAtualizarCl := True;
            end;

            if (vDadosIni.baixarRecAntValeCompra(CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger)) then
            	vAtualizarCl := True;

            if (vAtualizarCl) then
            	CadPedVenda.vCliente.dataSet.Refresh;
          end;
        end;

        if not CadPedVenda.vCliente.dataSet.FieldByName('CODIGO_FATURAMENTO').IsNull then
          if CadPedVenda.vCliente.faturamentoBarrado(CadPedVenda.vCliente.dataSet.FieldByName('CODIGO_FATURAMENTO').AsInteger, false) then
          begin
            if CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsInteger > 0 then
            begin
              if not vDadosIni.verificarControlesCondPagBarrados(CadPedVenda.buscas,
                CadPedVenda.dataSet.FieldByName('NPED').AsInteger, CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger,
                CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsInteger, CadPedVenda.dataSet.FieldByName('TIPO').AsString) then
              begin
                if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
                  TDBEdit(Sender).SetFocus;
                exit;
              end;
            end;
          end;
      end;
    end;
  end;

  if (CadPedVenda.vCodCondPagOld <= 0) then
    CadPedVenda.vCodCondPagOld := CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsInteger;

  if (CadPedVenda.vCodCondPagOld <> CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsInteger) then
  	vOK := true
  else if (CadPedVenda.vCodCondPagExit <> CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsInteger) and (vDadosIni.vPedVnd.AcrescCondPagComissaoVend) then
  	vOK := true
  else if (CadPedVenda.vCodCondPagOld = CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsInteger) then
    vOK := vDadosIni.PesqPros('VND227', 'RECALCULAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False, False, True);

  if vOK then
  begin
  	CadPedVenda.vCodCondPagOld := CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsInteger;

    CadPedVenda.vItProd._setaVariaveisPromocao(
    	CadPedVenda.vCliente.endAdic.cod_localidade_dest,
      CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger,
      CadPedVenda.vCliente.dataSet.FieldByName('cod_tab_preco').AsInteger,
      CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger,
      CadPedVenda.vCliente.endAdic.cod_cidade_dest,
      CadPedVenda.dataSet.FieldByName('TIPV').AsString);
      
    try
      DBGrid3.DataSource.DataSet.DisableControls;
      CadPedVenda._recalcularPrecoProdutosPromocao;
    finally
      DBGrid3.DataSource.DataSet.EnableControls;
    end;
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);

    if CheckBox4.Checked then
      eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;
  end;


  CadPedVenda.vCodCondPagExit := CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsInteger;
end;

procedure TFrmCadPedVenda.exitDescontoAcrescimo(Sender: TObject);
begin
  DevItensHidePanels;

  try
    Screen.Cursor := crHourGlass;
    if (CadPedVenda.vItProd.dataSet.State in [dsinsert, dsedit]) then
      Exit;

    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
      Exit;

    if CadPedVenda.vendaFechada then
      Exit;

    if not (CadPedVenda.dataSet.State in [dsinsert, dsedit]) then
      Exit;

    if not CadPedVenda.calculaDescontoAcrescimo then
      if CadPedVenda.vNomeCampoErro <> '' then
      begin
        if not setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro) then
          if Sender is TWinControl then
            if (Self.Enabled) and (Self.Visible) and (TWinControl(Sender).CanFocus) then
              TWinControl(Sender).SetFocus;
      end
      else if Sender is TWinControl then
        if (Self.Enabled) and (Self.Visible) and (TWinControl(Sender).CanFocus) then
          TWinControl(Sender).SetFocus;
    Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
//    Label61.Caption := Format('%m', [CadPedVenda.getValorServicoTerceiro]);
//    Label82.Caption := Format('%m', [CadPedVenda.getValorProdutoTerceiro]);
    eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;
  finally
    eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;

    if pn_dev_ped_itens.Tag = 1 then
    begin
      CadPedVenda.vItProd.DevInternaInit;
      DevItensExibir(CadPedVenda.vItProd);
    end;

    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.exitDescontoOSProdServ(Sender: TObject);
var
  AValorProdQuePermiteDesconto: Double;
begin
  try
    Screen.Cursor := crHourGlass;
    if (CadPedVenda.vItProd.dataSet.State in [dsinsert, dsedit]) then
      Exit;

    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
      Exit;

    if CadPedVenda.vendaFechada then
      Exit;

    if not (CadPedVenda.dataSet.State in [dsinsert, dsedit]) then
      Exit;

    AValorProdQuePermiteDesconto := CadPedVenda.GetValorProdQuePermiteDesconto;
    if AValorProdQuePermiteDesconto <= 0 then
      edDescProdValor.AsValue := 0
    else if edDescProdValor.AsValue >= AValorProdQuePermiteDesconto then
    begin
      vDadosIni.ShowAtencao('Valor de desconto maior que o valor dos produtos que permitem desconto ' + #13 +
         Format('%0.2n', [AValorProdQuePermiteDesconto]));
      if (Self.Enabled) and (Self.Visible) and (edDescProdValor.CanFocus) then
        edDescProdValor.SetFocus;
      Exit;
    end;

    if CadPedVenda.dataSet.FieldByName('tot_serv').AsFloat <= 0 then
      edDescServValor.AsValue := 0
    else if edDescServValor.AsValue >= CadPedVenda.dataSet.FieldByName('tot_serv').AsFloat then
    begin
      vDadosIni.ShowAtencao('Valor de desconto maior que o valor dos serviços' + #13 +
        Format('%0.2n', [CadPedVenda.dataSet.FieldByName('tot_serv').AsFloat]));
      if (Self.Enabled) and (Self.Visible) and (edDescServValor.CanFocus) then
        edDescServValor.SetFocus;
      Exit;
    end;

    try
      CadPedVenda.EventDescPercTotProdChange := nil;
      CadPedVenda.EventDescPercTotProdChange := nil;
      
      if Sender = edDescProdValor then
        CadPedVenda.dataSet.FieldByName('desc_p_prod').AsFloat := IfThen(AValorProdQuePermiteDesconto > 0, edDescProdValor.AsValue / AValorProdQuePermiteDesconto * 100)
      else if Sender = edDescServValor then
        CadPedVenda.dataSet.FieldByName('desc_p_serv').AsFloat := IfThen(CadPedVenda.dataSet.FieldByName('tot_serv').AsFloat > 0, edDescServValor.AsValue / CadPedVenda.dataSet.FieldByName('tot_serv').AsFloat * 100);

    finally
      CadPedVenda.EventDescPercTotProdChange   := EventDescPercTotProdChange;
      CadPedVenda.EventDescPercTotServChange   := EventDescPercTotServChange;
    end;

    if not CadPedVenda.calculaDescontoAcrescimo then
      if CadPedVenda.vNomeCampoErro <> '' then
        setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro)
      else if Sender is TWinControl then
        if (Self.Enabled) and (Self.Visible) and (TWinControl(Sender).CanFocus) then
          TWinControl(Sender).SetFocus;
    Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
//    Label61.Caption := Format('%m', [CadPedVenda.getValorServicoTerceiro]);
//    Label82.Caption := Format('%m', [CadPedVenda.getValorProdutoTerceiro]);
    eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;
  finally
    lbDescProdPerc.Caption := Format('%0.2n', [CadPedVenda.dataSet.FieldByName('desc_p_prod').AsFloat]) + ' %';
    lbDescServPerc.Caption := Format('%0.2n', [CadPedVenda.dataSet.FieldByName('desc_p_serv').AsFloat]) + ' %';
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.exitPercComissaoVend3(Sender: TObject);
begin
	if CadPedVenda.vendaFechada then
  	Exit;

  if not (CadPedVenda.dataSet.State in [dsinsert, dsedit]) then
  	Exit;

  if CadPedVenda.dataSet.FieldByName('PERC_COMISSAO_VEND3').AsFloat <= 0 then
  	CadPedVenda.vPercComissaoVend3Exit := CadPedVenda.dataSet.FieldByName('PERC_COMISSAO_VEND3').AsFloat
  else
  begin
    if CadPedVenda.vPercComissaoVend3Exit = CadPedVenda.dataSet.FieldByName('PERC_COMISSAO_VEND3').AsFloat then
      Exit;
  end;

  CadPedVenda.vItProd._setaVariaveisPromocao(
  	CadPedVenda.vCliente.endAdic.cod_localidade_dest,
    CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger,
    CadPedVenda.vCliente.dataSet.FieldByName('cod_tab_preco').AsInteger,
    CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger,
    CadPedVenda.vCliente.endAdic.cod_cidade_dest,
    CadPedVenda.dataSet.FieldByName('TIPV').AsString);
    
  try
    DBGrid3.DataSource.DataSet.DisableControls;
    CadPedVenda._recalcularPrecoProdutosPromocao;
  finally
    DBGrid3.DataSource.DataSet.EnableControls;
  end;
  Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);

  if CheckBox4.Checked then
    eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;

  CadPedVenda.vPercComissaoVend3Exit := CadPedVenda.dataSet.FieldByName('PERC_COMISSAO_VEND3').AsFloat;
end;

procedure TFrmCadPedVenda.exitVendedorCab(Sender: TObject);
begin
  {  if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
      Exit;
    if (CadPedVenda.vendaFechada) and (CadPedVenda.getTipoVenda <> 'ORC') then
      exit;
    if activecontrol = DBComboBox1 then
    begin
      if (Self.Enabled) and (Self.Visible) and (DBCOmbobox1.CanFocus) then
      	DBComboBox1.SetFocus;
      exit;
    end;
    if Sender = DBLookupComboBox16 then
    begin
      if CadPedVenda.ChecaVendedorVazio then
      	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox16.CanFocus) then
        	DBLookupComboBox16.SetFocus
    end
    else if Sender = DBLookupComboBox10 then
    begin
      if CadPedVenda.ChecaVendedorVazio then
      	if (Self.Enabled) and (Self.Visible) and (DBLookupCombobox10.CanFocus) then
        	DBLookupComboBox10.SetFocus
    end
    else if Sender = DBLookupComboBox26 then
    begin
      if CadPedVenda.ChecaVendedorVazio then
        if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
      	  DBLookupComboBox2.SetFocus
    end;
    if not CadPedVenda.ChecaTipVendaVendedor then
    begin
      if (CadPedVenda.getTipoVenda = 'REQ') then
      begin
      	if (Self.Enabled) and (Self.Visible) and (DBEdit5.CanFocus) then
        	DBEdit5.SetFocus
      end
      else if (CadPedVenda.getTipoVenda = 'ORC') then
      	if (Self.Enabled) and (Self.Visible) and (DBEdit104.CanFocus) then
        	DBEdit104.SetFocus;
    end
    else
    begin
      if (CadPedVenda.getTipoVenda = 'REQ') then
      begin
        if Sender <> DBLookupComboBox16 then
        	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox16.CanFocus) then
          	DBLookupComboBox16.SetFocus
      end
      else if (CadPedVenda.getTipoVenda = 'ORC') then
      begin
        if Sender <> DBLookupComboBox10 then
        	if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox10.CanFocus) then
          	DBLookupComboBox10.SetFocus;
      end;
    end;}
end;

procedure TFrmCadPedVenda.faturamento_action_before_save;
begin
  {
  if (vDadosIni.vUsarPlano = 'S') or (vDadosIni.vUsarPlano = '2') then
    exit;
  }

  if CadPedVenda.f_str('nf_ac_calctrib') = 'S' then
  begin
    CadPedVenda.fat_ped.calcular_valores_nf;

    if CadPedVenda.conf.valores_nf.ConfActive('Conf_' + CadPedVenda.f_str('tipo'), 'AbrirTelaAoSalvar', 'N', 'S') then
      bt_show_form_valores_nf_req.Click;
  end;
end;

procedure TFrmCadPedVenda.faturamento_calc_valores_nota(Sender: TObject);
var
  Anf: THw_notafiscal_class;
  Ait: THw_notafiscal_item_class;
  Aerros: THw_erro_classList;
  Alevel0, Alevel1, Alevel2: TTreeNode;
  I, J: Integer;
  Alist: TStrings;
begin
  tv_nf_valores.Items.Clear;
  if not Assigned(Sender) then
  begin
    tv_nf_valores.Items.AddChild(nil, 'Sem dados para apresentar. Contacte o suporte técnico');
  end
  else if Sender is THw_notafiscal_class then
  begin
    Anf := THw_notafiscal_class(Sender);
    if Anf.erros.Count > 0 then
    begin
      Alevel0 := tv_nf_valores.Items.AddChild(nil, 'Erros no processamento');
      for I := 0 to Pred(Aerros.Count) do
      begin
        Alevel1 := tv_nf_valores.Items.AddChild(Alevel0, Aerros.Items[I].erro);
        if Aerros.Items[I].detalhe <> '' then
          tv_nf_valores.Items.AddChild(Alevel1, Aerros.Items[I].detalhe);
      end;
    end;
    Alevel0 := tv_nf_valores.Items.AddChild(nil, 'Dados da nota fiscal');
    Alevel1 := tv_nf_valores.Items.AddChild(Alevel0, Format('Total.....: %n', [Anf.valor_total]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('BC ICMS.............: %n', [Anf.base_icm]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('ICMS................: %n', [Anf.valor_icm]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('BC ICMS ST..........: %n', [Anf.base_icmsub]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*ICMS ST............: %n', [Anf.valor_icmsub]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*Produtos...........: %n', [Anf.valor_prod]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*Descontos..........: %n', [Anf.valor_desc]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*IPI................: %n', [Anf.valor_ipi]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*Frete..............: %n', [Anf.valor_frete]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*Seguro.............: %n', [Anf.valor_seguro]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*Outros.............: %n', [Anf.valor_out_desp]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*Imposto Importação.: %n', [Anf.valor_ii]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*ICMS Desonerado....: %n', [Anf.vicmdeson]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*PIS Desonerado.....: %n', [Anf.vpisdeson]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*COFINS Desonerado..: %n', [Anf.vcofinsdeson]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('Val Aprox tributos..: %n', [Anf.vtottrib]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('ICMS Inter Dest.....: %n', [Anf.vicmsufdest]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('ICMS Inter Rem......: %n', [Anf.vicmsufremet]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('FCP Inter Dest......: %n', [Anf.vfcpufdest]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('FCP.................: %n', [Anf.fcp_vfcp]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('*FCP ST.............: %n', [Anf.fcp_vfcpst]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('FCP ST Ant..........: %n', [Anf.fcp_vfcpstret]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('Frete por conta.....: %s', [IfThen(Anf.freteconta_tr = '0', 'Terceiros')    +
                                                                              IfThen(Anf.freteconta_tr = '1', 'Emitente')     +
                                                                              IfThen(Anf.freteconta_tr = '2', 'Destinatário') +
                                                                              IfThen(IndexText(Anf.freteconta_tr, ['0', '1', '2']) = -1, 'Sem frete')]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('Consumidor Final....: %s', [IfThen(Anf.consumidor_final = 'S', 'Sim', 'Não')]));
    tv_nf_valores.Items.AddChild(Alevel1, Format('Indicador de IE.....: %d', [Anf.nfe_indiedest]));

    Alevel1 := tv_nf_valores.Items.AddChild(Alevel0, Format('Itens da nota - Qtde %d', [Anf.itens.Count]));
    for I := 0 to Pred(Anf.itens.Count) do
    begin
      Ait := Anf.itens.Items[I];
      Alevel2 := tv_nf_valores.Items.AddChild(Alevel1, Format('%d - %s', [Ait.nitem, Ait.descricao_item]));

      tv_nf_valores.Items.AddChild(Alevel2, Format('CFOP................: %4.0f', [Ait.codigo_nop]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('CST ICMS............: %s'   , [Ait.cst]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('Valor Unitário......: %0.6n', [Ait.valor_unitario]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('Quantidade..........: %0.6n', [Ait.quantidade]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('Valor Total.........: %0.2n', [Ait.valor_total]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('BC ICMS.............: %n', [Ait.base_icm]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('Aliq ICMS...........: %n', [Ait.aliq_icm]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('ICMS................: %n', [Ait.valor_icm]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('MVA.................: %n', [Ait.mva]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('BC ICMS ST..........: %n', [Ait.base_icmsub]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('Aliq ICMS ST........: %n', [Ait.aliq_icmsub]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*ICMS ST............: %n', [Ait.valor_icmsub]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*Descontos..........: %n', [Ait.rateio_desconto]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*IPI................: %n', [Ait.valor_ipi]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*Frete..............: %n', [Ait.rateio_frete]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*Seguro.............: %n', [Ait.rateio_seguro]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*Outros.............: %n', [Ait.rateio_outdesp]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*Imposto Importação.: %n', [Ait.valor_ii]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*ICMS Desonerado....: %n', [Ait.vicmdeson]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*PIS Desonerado.....: %n', [Ait.vpisdeson]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*COFINS Desonerado..: %n', [Ait.vcofinsdeson]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('Val Aprox tributos..: %n', [Ait.vtottrib]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('ICMS Inter Dest.....: %n', [Ait.vicmsufdest]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('ICMS Inter Rem......: %n', [Ait.vicmsufremet]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('FCP Inter Dest......: %n', [Ait.vfcpufdest]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('FCP.................: %n', [Ait.fcp_vfcp]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('*FCP ST.............: %n', [Ait.fcp_vfcpst]));
      tv_nf_valores.Items.AddChild(Alevel2, Format('FCP ST Ant..........: %n', [Ait.fcp_vfcpstret]));
    end;
    for I := 0 to Pred(tv_nf_valores.Items.Count) do
      if tv_nf_valores.Items[I].Level = 0 then
        tv_nf_valores.Items[i].Expand(False)
      else if (tv_nf_valores.Items[I].Level = 1) and (Pos('Itens da nota - Qtde', tv_nf_valores.Items[I].Text) = 1) then
        tv_nf_valores.Items[i].Expand(False);
//      else if (tv_nf_valores.Items[I].Level = 2) then
//        tv_nf_valores.Items[i].Expand(False);
  end
  else if Sender is THw_erro_classList then
  begin
    Aerros := THw_erro_classList(Sender);

    for I := 0 to Pred(Aerros.Count) do with Aerros.Items[I] do
    begin
      Alevel0 := tv_nf_valores.Items.AddChild(nil, erro);
      if detalhe <> '' then
        if Pos(sLineBreak, detalhe) = 0 then
          tv_nf_valores.Items.AddChild(Alevel0, detalhe)
        else
        begin
          Alist := TStringList.Create;
          try
            Alist.Text := detalhe;
            for J := 0 to Pred(Alist.Count) do
              tv_nf_valores.Items.AddChild(Alevel0, Alist[J]);
          finally
          	if Assigned(Alist) then
            	FreeAndNil(Alist);
          end;
        end;
    end;
  end;
end;

procedure TFrmCadPedVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Self <> nil then
    if Self.pnDisponibilidadeMecanico.Parent <> Self.tsOutros3 then
      exit;
  ScrollBox2Exit(ScrollBox2);
  _GravaConfiguracoesBoolean('CheckBox8', CheckBox8.Checked);

//  if ck_venda_rapida_emitirnfe.Visible then
//    regSetConfBool(ck_venda_rapida_emitirnfe.Name, ck_venda_rapida_emitirnfe.Checked);
//
//  if ck_venda_rapida_emitirnfce.Visible then
//    regSetConfBool(ck_venda_rapida_emitirnfce.Name, ck_venda_rapida_emitirnfce.Checked);

  inherited;

  GravarCampoConsulta;

  gravaConfiguracoesFormRegistro;

  if (CadPedVenda.dataSet.State = dsInsert) or (CadPedVenda.dataSet.State = dsEdit) then
	begin
    if CadPedVenda.Cancel then
    begin
      CadPedVenda.CancelUpdates;
      CadPedVenda.vItProd.dataSet.Cancel;
      CadPedVenda.vItProd.dataSet.CancelUpdates;
      if CadPedVenda.getTipoVenda <> 'REQ' then
      begin
        CadPedVenda.vItServ.dataSet.Cancel;
        CadPedVenda.vItProdTerc.dataSet.Cancel;
        CadPedVenda.vItServTerc.dataSet.Cancel;
        CadPedVenda.vItServ.CancelUpdates;
        CadPedVenda.vItProdTerc.CancelUpdates;
        CadPedVenda.vItServTerc.CancelUpdates;
      end;
		end;
	end;
	CadPedVenda.RollBackTransacao;

  if Assigned(Fnf_ac_calctrib_lookup) then
    FreeAndNil(Fnf_ac_calctrib_lookup);

  if Assigned(Fnf_freteconta) then
    FreeAndNil(Fnf_freteconta);

  if setTClientPadrao2 then
    if Assigned(DBGrid2.DataSource) then
      if Assigned(DBGrid2.DataSource.DataSet) then
      begin
        if not PrimeiraPesquisa2 then
          vDadosIni.salvarGridNoConfigColunasCadPadrao(
            DBGrid2,
            GridCfg2,
            cdsGrid2,
            cdsColunas2,
            vusuario,
            ListGridsAndDataSets2,
            vDadosIni.transacaoCol,
            vAlterarNomeDtSet2);

        if TemColunasComPosicaoAlteradas2 then
        vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid2, GridCfg2, true, ListPositions2, cdsGrid2);
      end;

  if setTClientPadrao3 then
    if Assigned(DBGrid3.DataSource) then
      if Assigned(DBGrid3.DataSource.DataSet) then
      begin
        if not PrimeiraPesquisa3 then
          vDadosIni.salvarGridNoConfigColunasCadPadrao(
            DBGrid3,
            GridCfg3,
            cdsGrid3,
            cdsColunas3,
            vusuario,
            ListGridsAndDataSets3,
            vDadosIni.transacaoCol,
            vAlterarNomeDtSet3);

        if TemColunasComPosicaoAlteradas3 then
        vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid3, GridCfg3, true, ListPositions3, cdsGrid3);
      end;

  if setTClientPadrao5 then
    if Assigned(DBGrid5.DataSource) then
      if Assigned(DBGrid5.DataSource.DataSet) then
      begin
        if not PrimeiraPesquisa5 then
          vDadosIni.salvarGridNoConfigColunasCadPadrao(
            DBGrid5,
            GridCfg5,
            cdsGrid5,
            cdsColunas5,
            vusuario,
            ListGridsAndDataSets5,
            vDadosIni.transacaoCol,
            vAlterarNomeDtSet5);

        if TemColunasComPosicaoAlteradas5 then
        vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid5, GridCfg5, true, ListPositions5, cdsGrid5);
      end;

  if setTClientPadrao6 then
    if Assigned(DBGrid6.DataSource) then
      if Assigned(DBGrid6.DataSource.DataSet) then
      begin
        if not PrimeiraPesquisa6 then
          vDadosIni.salvarGridNoConfigColunasCadPadrao(
            DBGrid6,
            GridCfg6,
            cdsGrid6,
            cdsColunas6,
            vusuario,
            ListGridsAndDataSets6,
            vDadosIni.transacaoCol,
            vAlterarNomeDtSet6);

        if TemColunasComPosicaoAlteradas6 then
        vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid6, GridCfg6, true, ListPositions6, cdsGrid6);
      end;

  if setTClientPadrao7 then
    if Assigned(DBGrid7.DataSource) then
      if Assigned(DBGrid7.DataSource.DataSet) then
      begin
        if not PrimeiraPesquisa7 then
          vDadosIni.salvarGridNoConfigColunasCadPadrao(
            DBGrid7,
            GridCfg7,
            cdsGrid7,
            cdsColunas7,
            vusuario,
            ListGridsAndDataSets7,
            vDadosIni.transacaoCol,
            vAlterarNomeDtSet7);

        if TemColunasComPosicaoAlteradas7 then
        vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid7, GridCfg7, true, ListPositions7, cdsGrid7);
      end;

  if setTClientPadrao12 then
    if Assigned(DBGrid12.DataSource) then
      if Assigned(DBGrid12.DataSource.DataSet) then
      begin
        if not PrimeiraPesquisa12 then
          vDadosIni.salvarGridNoConfigColunasCadPadrao(
            DBGrid12,
            GridCfg12,
            cdsGrid12,
            cdsColunas12,
            vusuario,
            ListGridsAndDataSets12,
            vDadosIni.transacaoCol,
            vAlterarNomeDtSet12);

        if TemColunasComPosicaoAlteradas12 then
        vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid12, GridCfg12, true, ListPositions12, cdsGrid12);
      end;

  CadPedVenda.Free;
  CadPedVenda := nil;
  Action := caFree;
  Self := nil;
    vDadosIni.vFiscalAtivo := '';
end;

procedure TFrmCadPedVenda.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Self <> nil then
    if Self.pnDisponibilidadeMecanico.Parent <> Self.tsOutros3 then
    begin
      Canclose := false;
      exit;
    end;


  if pgVendaRapida.ActivePage = tsAlteraPreco then
  begin
    clicouNoX := false;
    Canclose := false;
    exit;
  end;

  if not Canclose then
    Exit;

  inherited;

  if not Canclose then
  begin
  	GravarCampoConsulta;

    gravaConfiguracoesFormRegistro;

    if not Self.Visible then
    begin
      if CadPedVenda.getTipoVenda = 'REQ' then
        Self.Caption := 'Requisições'
    	else if CadPedVenda.getTipoVenda = 'OS' then
      	Self.Caption := 'Ordens de Serviço'
      else if CadPedVenda.getTipoVenda = 'ORC' then
      	Self.Caption := 'Orçamentos';
      CadPedVenda.desmarcarDAVsParaMesclagem;
    end;
  end;

  clicouNoX := CanClose;
  if CanClose then
  begin
    CadPedVenda.salvarAgendamento(true);
    CadPedVenda.pedidoEmEdicao(caRemoverEdicao, False);
    if PageControl1.ActivePage = TabSheet1 then
    begin
      CadPedVenda.dataSet.Cancel;
      CadPedVenda.CancelUpdates;
      CadPedVenda.vItProd.dataSet.Cancel;
      CadPedVenda.vItProd.dataSet.CancelUpdates;
      if CadPedVenda.getTipoVenda <> 'REQ' then
      begin
        CadPedVenda.vItServ.dataSet.Cancel;
        CadPedVenda.vItProdTerc.dataSet.Cancel;
        CadPedVenda.vItServTerc.dataSet.Cancel;
        CadPedVenda.vItServ.CancelUpdates;
        CadPedVenda.vItProdTerc.CancelUpdates;
        CadPedVenda.vItServTerc.CancelUpdates;
      end;
      try
      	PageControl1.ActivePage := TabSheet2;
      except
      end;
    end;
  end;
end;

procedure TFrmCadPedVenda.FormCreate(Sender: TObject);
begin
  inherited;
  vCriou := 0;
  TemColunasComPosicaoAlteradas2  := False;
  TemColunasComPosicaoAlteradas3  := False;
  TemColunasComPosicaoAlteradas5  := False;
  TemColunasComPosicaoAlteradas6  := False;
  TemColunasComPosicaoAlteradas7  := False;
  TemColunasComPosicaoAlteradas12 := False;

  vTipoCriou := trim(vDadosIni.vtpVenda);
  setTClientPadrao2 := False;
  setTClientPadrao3 := False;
  setTClientPadrao5 := False;
  setTClientPadrao6 := False;
  setTClientPadrao7 := False;
  setTClientPadrao12 := False;

  nomeDTSEt2  := 'cdsItemProdReqN';
  nomeDTSEt3  := 'cdsItemProdOsP';
  nomeDTSEt5  := 'cdsItemProdOsS';
  nomeDTSEt6  := 'cdsItemProdOsST';
  nomeDTSEt7  := 'cdsItemProdOsPT';
  nomeDTSEt12 := 'cdsItemProdReqR';

  vAlterarNomeDtSet2  := 'ReqN_';
  vAlterarNomeDtSet3  := 'OsP_';
  vAlterarNomeDtSet5  := 'OsS_';
  vAlterarNomeDtSet6  := 'OsST_';
  vAlterarNomeDtSet7  := 'OsPT_';
  vAlterarNomeDtSet12 := 'ReqR_';

  vF9 := False;
  {UltimoNumOS:='';
  UltimoNumORC:='';
  UltimoNumReq:='';}
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'NF_GERAR_REQ' then
  begin
    if Self = nil then
	    Self := TFrmCadPedVenda(Self);
    vDadosIni.vModalOuChild := 'M';
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'NF_REABRIR_REQ' then
  begin
    if Self = nil then
	    Self := TFrmCadPedVenda(Self);
    vDadosIni.vModalOuChild := 'M';
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'PEDVENDA_ABRIR' then
  begin
    if Self = nil then
	    Self := TFrmCadPedVenda(Self);
    vDadosIni.vModalOuChild := 'M';
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'TELEVENDA' then
  begin
  	vDadosIni.vtpVenda := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
		if Self = nil then
	    Self := TFrmCadPedVenda(Self);
    vDadosIni.vTipoForm := 5;
    vDadosIni.vModalOuChild := 'M';
  end;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'CONTROLE_ALMOXARIFADO' then
  begin
  	vDadosIni.vtpVenda := 'REQ';
		if Self = nil then
	    Self := TFrmCadPedVenda(Self);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'PEDVENDAESTMOTOOS' then
  begin
		vDadosIni.vtpVenda := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
    if Self = nil then
	    Self := TFrmCadPedVenda(Self);
    vDadosIni.vTipoForm := 7;
    vDadosIni.vModalOuChild := 'M';
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'PEDVENDAESTMOTOORC' then
  begin
  	vDadosIni.vtpVenda := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
		if Self = nil then
	    Self := TFrmCadPedVenda(Self);
    vDadosIni.vTipoForm := 8;
    vDadosIni.vModalOuChild := 'M';
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'PEDVENDAESTMOTOOSEDIT' then
  begin
  	vDadosIni.vtpVenda := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
		if Self = nil then
	    Self := TFrmCadPedVenda(Self);
    vDadosIni.vTipoForm := 9;
    vDadosIni.vModalOuChild := 'M';
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'PEDVENDAESTMOTOORCEDIT' then
  begin
  	vDadosIni.vtpVenda := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
		if Self = nil then
	    Self := TFrmCadPedVenda(Self);
    vDadosIni.vTipoForm := 10;
    vDadosIni.vModalOuChild := 'M';
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'PEDVENDAMOD' then
  begin
  	vDadosIni.vnumVenda := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
  	vDadosIni.vtpVenda := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
    if Self = nil then
	    Self := TFrmCadPedVenda(Self);
    vDadosIni.vTipoForm := 11;
    vDadosIni.vModalOuChild := 'M';
  end
  else if Pos('PEDVENDA_FICHAPRODUTO|', vDadosIni.vPesquisa) > 0 then // TelaCadastro = 11;
  begin
  	vDadosIni.vnumVenda := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3));
    vDadosIni.vtpVenda := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
    if Self = nil then
	    Self := TFrmCadPedVenda(Self);
    vDadosIni.vTipoForm := 12;
    vDadosIni.vModalOuChild := 'M';
  end
  else if Pos('NF_GERAR_REQ', vDadosIni.vPesquisa) > 0 then
  begin
  	if Self = nil then
	    Self := TFrmCadPedVenda(Self);
  	vDadosIni.vTipoForm := 13;
    vDadosIni.vModalOuChild := 'M';
  end
  else if Pos('NF_REABRIR_REQ', vDadosIni.vPesquisa) > 0 then
  begin
  	if Self = nil then
	    Self := TFrmCadPedVenda(Self);
  	vDadosIni.vTipoForm := 14;
    vDadosIni.vModalOuChild := 'M';
  end
  else if Pos('PEDVENDA_FICHAPRODUTO|', vDadosIni.vPesquisa) > 0 then // TelaCadastro = 11;
  begin
  	vDadosIni.vnumVenda := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3));
    vDadosIni.vtpVenda := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
    if Self = nil then
	    Self := TFrmCadPedVenda(Self);
    vDadosIni.vTipoForm := 15;
    vDadosIni.vModalOuChild := 'M';
  end;
  TelaCadastro := vDadosIni.vTipoForm;

  alturaGroupbox22 := GroupBox22.Height;
  Height := Height - 30;
  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet3.TabVisible := false;
  TabSheet4.TabVisible := false;
  TabSheet5.TabVisible := false;
  tsOrdemServ.TabVisible := false;
  tsTransfOrcamento.TabVisible := false;
  tsObservacao.TabVisible := false;
  //  tsOrcamento.TabVisible := false;
  tsMecanicosOS.TabVisible := false;
  TabSheet21.TabVisible := false;
  tsDetalhePagamento.TabVisible := false;
  tsFichaOS.TabVisible := false;
  tsOSExterna.TabVisible := false;
  tsOutros.TabVisible := false;
  tsOutros2.TabVisible := false;
  tsOutros3.TabVisible := false;
  tsOutros4.TabVisible := false;
  tsFaturasServTerc.TabVisible := false;
  tsEcommerce.TabVisible := false;
  tsProdSimilar.TabVisible := false;
  tsConfirmarDoc.TabVisible := false;
  tsAcrescCondPagComissaoVend.TabVisible := false;
  pgVendaRapida.TabIndex := 0;
  GroupBox32.Visible := False;
  lbDescProdVal.Caption := '';
  lbDescServVal.Caption := '';
  lbAcrescProdVal.Caption := '';
  lbAcrescServVal.Caption := '';

  if dtm = nil then
  	dtm := TDtmPedVenda.Create(Self);

  CadPedVenda := TPedVenda.create(TDtmPedVenda(dtm));
  CadPedVenda.FrmCadPed := Self;
  CadPedVenda.OnMessage := MensagemVendaRapida;

  vDadosIni.AlterarDataSourceComponentes(Self, TDtmPedVenda(dtm));

  if (vDadosIni.vEmp.vOC_UsarOrdemCarregamento <> 'D') and (vDadosIni.vEmp.vOC_TipoControleOrdemC <> 'REQ') then
    CadPedVenda.dataSet.FieldByName('cod_carga').Tag := 1;

  if DBGrid1.DataSource = nil then
    DBGrid1.DataSource := TDtmPedVenda(dtm).dsPedVenda;
  CadPedVenda.rConfigCampos.vVLInicialAtivado := False;
  CadPedVenda._inicializaCamposConfig;
//  if CadPedVenda.getTipoVenda = 'REQ' then
//    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,'REQ')
//  else if CadPedVenda.getTipoVenda = 'OS' then
//    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,'OS')
//  else if CadPedVenda.getTipoVenda = 'ORC' then
//    setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,'ORC')
//  else
//  	setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

  //  CadPedVenda.verificaFiscalAtivo;

  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmCadPedVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vProduto: TProdutos;
  vMsg: string;
  formulario: TForm;
  hdTemp: Cardinal;
begin
  if (Application.MainForm.ClassName = 'TfrmIntegracao') and (key = 76) and (Classes.ssCtrl in Shift) then
  begin
    vDadosIni.vPesquisa := 'LOGGOF|';
    formulario := Funcoes.abreform('pkEntrada', 'TfrmExplorer', hdTemp);
    try
      //formulario.ShowModal;
    finally
      formulario.Free;
      unLoadPackage(hdTemp);
    end;
    vDadosIni.vPesquisa := '';
    StatusBar1.Panels.Items[2].Text := 'Usuário: ' + vDadosIni.vNomeUsuario;
  end
  else
    if PageControl1.ActivePage = TabSheet21 then
    begin
      if pnVendaRapidaPesquisa.Visible then
      begin

      end                                                 
      else if (Key = VK_INSERT) and (pnAtalhosNovoPedVenda.Visible) then
      begin
        try
          vF9 := True;
          BitBtn5Click(BitBtn5);
        finally
          vF9 := False;
        end;
        BitBtn3.Click;
      end
      else if (Key = VK_F5) and (pnAtalhosPesquiarVenda.Visible) then
      begin
        try
          vF9 := True;
          BitBtn5Click(BitBtn5);
        finally
          vF9 := False;
        end;
        lMsg.Visible                            := False;
        Panel9.Visible                          := False;
        Panel35.Visible                         := False;
        btVendaRapidaPesquisaNova.OnClick       := BitBtn3Click;
        btVendaRapidaPesquisaEditar.OnClick     := SpeedButton1Click;
        btVendaRapidaPesquisaExcluir.OnClick    := SpeedButton2Click;
        btVendaRapidaPesquisaImprimir.OnClick   := SpeedButton3Click;
        btVendaRapidaPesquisaConfirmar.OnClick  := SpeedButton6Click;
        btVendaRapidaPesquisaReabrir.OnClick    := SpeedButton7Click;
        btVendaRapidaPesquisaEmiteCupom.Visible := SpeedButton8.Visible;
        btVendaRapidaPesquisaEmiteCupom.OnClick := SpeedButton8Click;
        btVendaRapidaPesquisaVolta.OnClick      := BitBtn3Click;//btVendaRapidaPesquisaVoltaClick;
        btVendaRapidaPesquisaProcurar.OnClick   := btVendaRapidaPesquisaProcurarClick;
        pnVendaRapidaPesquisa.Visible           := True;
        pnVendaRapidaPesquisa.Align             := alClient;
        ComboBox1.ItemIndex                     := ComboBox1.Items.IndexOf(CadPedVenda.dataSet.FieldByName('data_ped').DisplayLabel);
        edVendaRapidaPesquisaDataIni.Text       := MaskEdit1.Text;
        edVendaRapidaPesquisaDataFim.Text       := MaskEdit2.Text;

        gridVendaRapidaPesquisa.DataSource      := DBGrid1.DataSource;
        gridVendaRapidaPesquisa.Columns         := DBGrid1.Columns;
        gridVendaRapidaPesquisa.OnDrawColumnCell:= DBGrid1DrawColumnCell;
        gridVendaRapidaPesquisa.OnKeyDown       := gridVendaRapidaPesquisaKeyDown;
        gridVendaRapidaPesquisa.OnTitleClick    := gridVendaRapidaPesquisaTitleClick;

        btVendaRapidaPesquisaProcurar.Click;
      end
      else if Key = VK_F2 then
      begin
        if CadPedVenda.vendaFechada then
        begin
          if CadPedVenda.getTipoVenda <> 'REQ' then
            lMsg.Caption := 'Orçamento fechado ou não iniciado'
          else
            lMsg.Caption := 'Venda fechada ou não iniciada';
          exit;
        end;

        vDadosIni.enterTela.AddExclusion(lbListActions);
        try
          lbListActions.ItemIndex := 0;
          if not vDadosIni.abreForm('Mais ações - (Selecionar com Enter)', pn_vnd_rap_mais, opFormsDefCadEsc) then
            Exit;
        finally
          vDadosIni.enterTela.DeleteExclusion(lbListActions);
        end;

        if lbListActions.ItemIndex = 0 then
        	alterarItemVendaRapida
        else if lbListActions.ItemIndex = 1 then
        begin
          if not vDadosIni.abreForm('Escolha de Tipo de Venda', pnTipoVenda, opFormsDefCadEsc) then
            Exit;

          CadPedVenda.verificarSalvamentoAutomatico(true);
        end
        else if lbListActions.ItemIndex = 2 then
          BitBtn104Click(Sender)
        else if lbListActions.ItemIndex = 3 then
        	SpeedButtonLucratividadeClick(Sender);

        {
    	  if (CheckBox4.Visible) and (CheckBox4.Checked) then
        begin
          if not CadPedVenda.abreFormEscolhaTipoVenda then
            exit;
          if not CadPedVenda.abreFormEscolhaTipoVendaOrc then
            exit;
          if vDadosIni.vEmp.vCliInicioVndRapida then
          begin
            if not CadPedVenda.abreFormEscolhaClienteVND then
              exit;
          end else if CadPedVenda.vCliente.dataSet.FieldByName('COD_CLIENTE').AsInteger = 0 then
          begin
            CadPedVenda.vCliente.abreClientes(strtoint(vDadosIni.vCliente.vCodClientePadrao));

            CadPedVenda.vItProd._setaVariaveisPromocao(
            	CadPedVenda.vCliente.endAdic.cod_localidade_dest,
              CadPedVenda.vCliente.dataSet.FieldByName('cod_cliente').AsInteger,
              CadPedVenda.vCliente.dataSet.FieldByName('cod_tab_preco').AsInteger,
              CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger,
              CadPedVenda.vCliente.endAdic.cod_cidade_dest,
              CadPedVenda.dataSet.FieldByName('TIPV').AsString);
          end;
        end;

      	BitBtn104Click(Sender);
        }
      end
      else if Key = VK_F6 then
      begin
        if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) then
	        edCodBarra.SetFocus;
        exitEdCodBarra := true;
        if CadPedVenda.vendaFechada then
        begin
          if CadPedVenda.getTipoVenda <> 'REQ' then
            lMsg.Caption := 'Orçamento fechado ou não iniciado'
          else
            lMsg.Caption := 'Venda fechada ou não iniciada';
          exit;
        end;
        if CadPedVenda.vItProd.dataSet.IsEmpty then
        begin
          lMsg.Caption := 'Venda sem produtos';
          exit;
        end;
        lMsg.Caption := 'Selecione o item para cancelar. Duplo Clique, Delete';
        pgVendaRapida.ActivePage := tsCancelarItens;
        DBGrid12.Parent := GroupBox30;
        if (Self.Enabled) and (Self.Visible) and (DBGrid12.CanFocus) then
	        DBGrid12.SetFocus;
        DBGrid12.Options := DBGrid12.Options + [dgIndicator];
//        DBGrid12.Options := DBGrid12.Options + [dgRowLines];
//        DBGrid12.Options := DBGrid12.Options + [dgRowSelect];
//				if (Self.Enabled) and (Self.Visible) and (DBGrid1.CanFocus) then
//      		DBGrid11.SetFocus;
      end
      else if (key = vk_f7) and (Panel32.Visible) then
      begin
        exitEdCodBarra := true;
        if CadPedVenda.getTipoVenda <> 'REQ' then
        begin
          if Application.MessageBox('Deseja mesmo cancelar o orçamento?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDNO then
            exit;
        end
        else if Application.MessageBox('Deseja mesmo cancelar a venda?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDNO then
          exit;
        try
          vF9 := true;
          BitBtn5Click(BitBtn5);
          temp := '';
          if Self.Tag = 999 then
            if FileExists(ExtractFilePath(Application.ExeName) + 'logo.jpg') then
            begin
              imgLogo.Proportional := false;

              try
              	imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
              except
              end;
              
            end;
        finally
          vF9 := False;
          
          ldescricao.Caption := '';
          eVlUnit.Valor := 0;
          eSubTotal.Valor := 0;
          if CadPedVenda.getTipoVenda <> 'REQ' then
            Application.MessageBox('Orçamento Cancelado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION)
          else
            Application.MessageBox('Venda Cancelada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
          CheckBox4.Checked := true;
          DBGrid12.Parent := GroupBox36;
          BitBtn3Click(BitBtn3);
          temp := '';
          if Self.Tag = 999 then
            if FileExists(ExtractFilePath(Application.ExeName) + 'logo.jpg') then
            begin
              imgLogo.Proportional := false;

              try
              	imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
              except
              end;

            end;
        end;
//        if CadPedVenda.Cancel then
//        begin
//          CadPedVenda.CancelUpdates;
//          CadPedVenda.vItProd.dataSet.Cancel;
//          CadPedVenda.vItProd.dataSet.CancelUpdates;
//          lMsg.Caption := 'Venda Cancelada';
//          if CadPedVenda.getTipoVenda <> 'REQ' then
//          begin
//            lMsg.Caption := 'Orçamento Cancelado';
//            CadPedVenda.vItServ.dataSet.Cancel;
//            CadPedVenda.vItProdTerc.dataSet.Cancel;
//            CadPedVenda.vItServTerc.dataSet.Cancel;
//            CadPedVenda.vItProd.CancelUpdates;
//            CadPedVenda.vItServ.CancelUpdates;
//            CadPedVenda.vItProdTerc.CancelUpdates;
//            CadPedVenda.vItServTerc.CancelUpdates;
//          end;
//          ldescricao.Caption := '';
//          eVlUnit.Valor := 0;
//          eSubTotal.Valor := 0;
//          if CadPedVenda.getTipoVenda <> 'REQ' then
//            Application.MessageBox('Orçamento Cancelado!', 'Atenção', MB_OK + MB_ICONEXCLAMATION)
//          else
//            Application.MessageBox('Venda Cancelada!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
//          CheckBox4.Checked := true;
//          DBGrid12.Parent := GroupBox36;
//          BitBtn3Click(BitBtn3);
//          temp := '';
//          if Self.Tag = 999 then
//            if FileExists(ExtractFilePath(Application.ExeName) + 'logo.jpg') then
//              imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
//        end;
      end
      else if key = VK_F8 then
      begin
        if CadPedVenda.vendaFechada then
        begin
          if CadPedVenda.getTipoVenda <> 'REQ' then
            lMsg.Caption := 'Orçamento fechado ou não iniciado'
          else
            lMsg.Caption := 'Venda fechada ou não iniciada';
          exit;
        end;
        if CadPedVenda.abreFormEscolhaCondicaoPagamento then
        begin
          CadPedVenda.vItProd._setaVariaveisPromocao(
          	CadPedVenda.vCliente.endAdic.cod_localidade_dest,
            CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger,
            CadPedVenda.vCliente.dataSet.FieldByName('cod_tab_preco').AsInteger,
            CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger,
            CadPedVenda.vCliente.endAdic.cod_cidade_dest,
            CadPedVenda.dataSet.FieldByName('TIPV').AsString);

          if CadPedVenda._recalcularPrecoProdutosPromocao then
            eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;
        end;
      end
      else if key = VK_F12 then
      begin
        if CadPedVenda.vendaFechada then
        begin
          if CadPedVenda.getTipoVenda <> 'REQ' then
            lMsg.Caption := 'Orçamento fechado ou não iniciado'
          else
            lMsg.Caption := 'Venda fechada ou não iniciada';
          exit;
        end;
        if CadPedVenda.abreFormInformaDescontoItem then
        begin
          CadPedVenda.vItProd.setDescontoPercenentual(edHWPercDesc.AsValue);
          CadPedVenda.vItProd.setDescontoValor(edHWValorDesc.AsValue, 0);
        end;
      //      lMsg.Caption := 'Desconto';
      //      edCodBarra.Enabled := false;
      //      pgVendaRapida.ActivePage := tsAcresDesc;
      end
      else if key = VK_F10 then
      begin
        if CadPedVenda.vendaFechada then
        begin
          if CadPedVenda.getTipoVenda <> 'REQ' then
            lMsg.Caption := 'Orçamento fechado ou não iniciado'
          else
            lMsg.Caption := 'Venda fechada ou não iniciada';
          exit;
        end;
      {  if (key = VK_CONTROL) then
    begin
      if (GetKeyState(66) = 1) then
        if CadPedVenda.abreFormInformaAcrescimoItem then
        begin
          CadPedVenda.vItProd.setAcrescimoPercenentual(edHWPercAcres.AsValue);
          CadPedVenda.vItProd.setAcrescimoValor(edHWValorAcres.AsValue);
        end;
      exit;
    end;}
        if CadPedVenda.abreFormInformaAcrescimoItem then
        begin
          CadPedVenda.vItProd.setAcrescimoPercenentual(edHWPercAcres.AsValue);
          CadPedVenda.vItProd.setAcrescimoValor(edHWValorAcres.AsValue);
        end;
      end
      else if key = VK_F9 then
      begin
        if CadPedVenda.getTipoVenda <> 'REQ' then
          vMsg := 'Deseja Realmente Sair do Orçamento Rápido?'
        else
          vMsg := 'Deseja Realmente Sair da Venda Rápida?';
        if Application.MessageBox(pchar(vMsg), 'Confirmação',
          MB_ICONQUESTION + MB_YESNO) = IDYES then
        begin
          exitEdCodBarra := true;
          edCodBarra.Enabled := false;
          if pgVendaRapida.ActivePage = tsFechamento then
            ActiveControl:= BitBtn71;
          DBGrid12.Parent := GroupBox36;
          try
            vF9 := True;
            BitBtn5Click(BitBtn5);
            temp := '';
            if Self.Tag = 999 then
              if FileExists(ExtractFilePath(Application.ExeName) + 'logo.jpg') then
              begin
                imgLogo.Proportional := false;

                try
           	    	imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
                except
                end;

              end;
          finally
            vF9 := False;
          end;
        end;
      end
      else if key = VK_F11 then
      begin
      	exitEdCodBarra := true;
        if pgVendaRapida.ActivePage = tsItens then
        begin
          if CadPedVenda.vendaFechada then
          begin
            if CadPedVenda.getTipoVenda <> 'REQ' then
              lMsg.Caption := 'Orçamento fechado ou não iniciado'
            else
              lMsg.Caption := 'Venda fechada ou não iniciada';
          end
          else
          if CadPedVenda.getTipoVenda <> 'REQ' then
            lMsg.Caption := 'Preencha os campos para concluir o orçamento'
          else
            lMsg.Caption := 'Preencha os campos para concluir a venda';
          edCodBarra.Enabled := false;
          pgVendaRapida.ActivePage := tsFechamento;
          if vDadosIni.vEmp.vCliInicioVndRapida then
          begin
            if DBEdit70.CanFocus then
            begin
            	DBEdit70Exit(DBEdit70);
              if (Self.Enabled) and (Self.Visible) and (DBEdit70.CanFocus) then
              	DBEdit70.SetFocus;
            end
            else if DBEdit108.CanFocus then
            begin
            	exitCondPag(DBEdit108);
              if (Self.Enabled) and (Self.Visible) and (DBEdit108.CanFocus) then
              	DBEdit108.SetFocus;
            end;
          end
          else if DBEdit67.CanFocus then
          begin
          	exitCliente(DBEdit67);
            if (Self.Enabled) and (Self.Visible) and (DBEdit67.CanFocus) then
            	DBEdit67.SetFocus;
          end;
        end
        else if pgVendaRapida.ActivePage = tsFechamento then
        begin
          BitBtn83Click(BitBtn83);
        end;
      end
      else if pgVendaRapida.ActivePage = tsItens then
      begin
        if Key = VK_F3 then
        begin
          try
            if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) then
	            edCodBarra.SetFocus;
            Screen.Cursor := crHourGlass;
          //          desativar := true;
            vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
            edCodBarra.Text := trim(vDadosIni.vPesquisa);
          finally
            Screen.Cursor := crDefault;
          //          desativar := false;
          end;
        end
        else if key = VK_F4 then
        begin
          if (Self.Enabled) and (Self.Visible) and (edCodBarra.CanFocus) then
	          edCodBarra.SetFocus;
          try
            Screen.Cursor := crHourGlass;
            vProduto := TProdutos.create;
            vProduto.CadProdutos(1);
          finally
          	if Assigned(vProduto) then
            	FreeAndNil(vProduto);
            Screen.Cursor := crDefault;
          end;
        end;
      end;
      Screen.Cursor := crDefault;
      exit;
    end;

  inherited;

  if Key = VK_INSERT then
  begin
    if CadPedVenda.dataSet.State in [dsInsert, dsEdit] then
      exit;
    if (Self.Enabled) and (Self.Visible) and (BitBtn3.CanFocus) then
    begin
    	BitBtn3.SetFocus;
    	BitBtn3Click(Sender);
    end;
  end
  else if (PageControl1.ActivePage = TabSheet2) and (Key = VK_F11) then
    CheckBox4.Checked := ((not (CheckBox4.Checked)) and (CheckBox4.Enabled))
  else if (PageControl1.ActivePage = TabSheet2) and (key = VK_F7) then
    CheckBox9.Checked := not CheckBox9.Checked
  else if Key = VK_F12 then
  begin
    if vDadosIni.vEmp.vVincularVeicOBJ = 'E' then
      if (CheckBox8.Enabled) and (PageControl1.ActivePage = TabSheet2) then
        CheckBox8.Checked := not CheckBox8.Checked;
  end;
end;

procedure TFrmCadPedVenda.FormResize(Sender: TObject);
begin
  inherited;
  if Self = nil then
    Exit;

  if (PageControl1.ActivePage = TabSheet21) then
  begin
    if (Self.Height >= 675)
     and (Self.Width >= 899) then
    begin
      Panel24.Align := alClient;
    end
    else
    begin
      Panel24.Align := alTop;
      Panel24.Height := 340;
      Panel24.Width := 872;
    end;
  end
  else if (PageControl1.ActivePage = tsTransfOrcamento) then
  begin
    if (Self.Height >= 675)
      and (Self.Width >= 899) then
    begin
      //GroupBoxProdutosMesclar.Align := alClient;
      //GroupBoxServicosTerceiroMesclar.Align := alClient;
    end
    else
    begin
      {
      GroupBoxProdutosMesclar.Align := alTop;
      GroupBoxProdutosMesclar.Height := 175;
      GroupBoxProdutosMesclar.Width := Self.Width - 27;

      GroupBoxServicosTerceiroMesclar.Align := alTop;
      GroupBoxServicosTerceiroMesclar.Height := 135;
      GroupBoxServicosTerceiroMesclar.Width := Self.Width - 27;

      GroupBoxServicosMesclar.Align := alTop;
      GroupBoxServicosMesclar.Height := 135;
      GroupBoxServicosMesclar.Width := Self.Width - 27;

      GroupBoxProdutosTerceiroMesclar.Align := alTop;
      GroupBoxProdutosTerceiroMesclar.Height := 135;
      GroupBoxProdutosTerceiroMesclar.Width := Self.Width - 27;
      }
    end;
  end
  else if (PageControl3.ActivePage = TabSheet3) then
  begin
  	if (Self.Height >= 675)
      and (Self.Width >= 899) then
    begin
    	Panel4.Align := alClient;
      
      GroupBox6.Align := alTop;
      GroupBox4.Align := alTop;
      GroupBox7.Align := alClient;
      DBGrid2.Align := alClient;
    end
    else
    begin
    	Panel4.Align := AlTop;
    	Panel4.Height := 450;
      Panel4.Width := 864;
      
      GroupBox6.Align := alTop;
      GroupBox4.Align := alTop;
      GroupBox7.Align := alClient;
      DBGrid2.Align := alClient;
    end;
  end
  else if (PageControl3.ActivePage = tsOrdemServ) then
  begin
  	if (Self.Height >= 675)
      and (Self.Width >= 899) then
    begin
      pgOS.Align := alClient;

    	GroupBox21.Align := alTop;
      GroupBox22.Align := alTop;
      GroupBox22.Align := alTop;
      GroupBox23.Align := alTop;

      Panel16.Align := alTop;
      Panel13.Align := alTop;
      pn_grid_os.Align := alClient;

      Panel17.Align := alTop;
      Panel10.Align := alTop;
      DBGrid5.Align := alClient;

      Panel7.Align := alTop;
      GroupBox71.Align := alTop;
      Panel11.Align := alTop;
      DBGrid6.Align := alClient;

      Panel25.Align := alTop;
      GroupBox70.Align := alTop;
      Panel12.Align := alTop;
      DBGrid7.Align := alClient;

      GroupBox31.Align := alTop;
      GroupBox32.Align := alTop;
      GroupBox43.Align := alClient;
    end
    else
    begin
      pgOS.Align := alTop;
      pgOS.Height := 380;
    	pgOS.Width := 864;

    	GroupBox21.Align := alTop;
      GroupBox22.Align := alTop;
      GroupBox22.Align := alTop;
      GroupBox23.Align := alTop;

      Panel16.Align := alTop;
      Panel13.Align := alTop;
      pn_grid_os.Align := alClient;

      Panel17.Align := alTop;
      Panel10.Align := alTop;
      DBGrid5.Align := alClient;

      Panel7.Align := alTop;
      GroupBox71.Align := alTop;
      Panel11.Align := alTop;
      DBGrid6.Align := alClient;

      Panel25.Align := alTop;
      GroupBox70.Align := alTop;
      Panel12.Align := alTop;
      DBGrid7.Align := alClient;

      GroupBox31.Align := alTop;
      GroupBox32.Align := alTop;
      GroupBox43.Align := alClient;
    end;
  end
end;

procedure TFrmCadPedVenda.FormShow(Sender: TObject);
var
  i: integer;
  vCloseForm: Boolean;
  vItem: Boolean;
begin
  if not Self.Enabled then
  	Exit;

	vNFGeraREQNPed := 0;
  vNFGeraREQTipoPed := '';
  vNFGeraREQValor := '';
	if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'NF_GERAR_REQ' then
  begin
    if dtm = nil then
  		dtm := TDtmPedVenda.Create(Self);
    vDadosIni.vModalOuChild := 'M';
    CadPedVenda.setTipoVendaAlmox;
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'PEDVENDA_ABRIR' then
  begin
    if dtm = nil then
  		dtm := TDtmPedVenda.Create(Self);
    vDadosIni.vModalOuChild := 'M';
    CadPedVenda.setTipoVendaAlmox;
  end
	else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'TELEVENDA' then
  begin
    vDadosIni.vtpVenda := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
    if dtm = nil then
  		dtm := TDtmPedVenda.Create(Self);
    vDadosIni.vTipoForm := 5;
    vDadosIni.vModalOuChild := 'M';
    CadPedVenda.setTipoVendaAlmox;
  end;
  if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'CONTROLE_ALMOXARIFADO' then
  begin
  	vDadosIni.vtpVenda := 'REQ';
    if dtm = nil then
  		dtm := TDtmPedVenda.Create(Self);
    vDadosIni.vTipoForm := 6;
    vDadosIni.vModalOuChild := 'M';
    CadPedVenda.setTipoVendaAlmox;
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'PEDVENDAESTMOTOOS' then
  begin
  	vDadosIni.vtpVenda := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
    if dtm = nil then
  		dtm := TDtmPedVenda.Create(Self);
    vDadosIni.vTipoForm := 7;
    vDadosIni.vModalOuChild := 'M';
    CadPedVenda.setTipoVendaAlmox;
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'PEDVENDAESTMOTOORC' then
  begin
  	vDadosIni.vtpVenda := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
    if dtm = nil then
  		dtm := TDtmPedVenda.Create(Self);
    vDadosIni.vTipoForm := 8;
    vDadosIni.vModalOuChild := 'M';
    CadPedVenda.setTipoVendaAlmox;
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'PEDVENDAESTMOTOOSEDIT' then
  begin
    vDadosIni.vtpVenda := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
    if dtm = nil then
  		dtm := TDtmPedVenda.Create(Self);
    vDadosIni.vTipoForm := 9;
    vDadosIni.vModalOuChild := 'M';
    CadPedVenda.setTipoVendaAlmox;
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'PEDVENDAESTMOTOORCEDIT' then
  begin
  	vDadosIni.vtpVenda := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
    if dtm = nil then
  		dtm := TDtmPedVenda.Create(Self);
    vDadosIni.vTipoForm := 10;
    vDadosIni.vModalOuChild := 'M';
    CadPedVenda.setTipoVendaAlmox;
  end
  else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'PEDVENDAMOD' then
  begin
  	vDadosIni.vnumVenda := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
  	vDadosIni.vtpVenda := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
    if dtm = nil then
  		dtm := TDtmPedVenda.Create(Self);
    vDadosIni.vTipoForm := 11;
    vDadosIni.vModalOuChild := 'M';
    CadPedVenda.setTipoVendaAlmox;
  end
  else if Pos('PEDVENDA_FICHAPRODUTO|', vDadosIni.vPesquisa) > 0 then // TelaCadastro = 11;
  begin
  	vDadosIni.vnumVenda := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3));
    vDadosIni.vtpVenda := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
  	if dtm = nil then
  		dtm := TDtmPedVenda.Create(Self);
    vDadosIni.vTipoForm := 12;
    vDadosIni.vModalOuChild := 'M';
    CadPedVenda.setTipoVendaAlmox;
  end
  else if Pos('NF_GERAR_REQ', vDadosIni.vPesquisa) > 0 then
  begin
    if Self = nil then
	    Self := TFrmCadPedVenda(Self);
    vDadosIni.vTipoForm := 13;
    vDadosIni.vModalOuChild := 'M';
  	vNFGeraREQNPed := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
    vNFGeraREQTipoPed := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
    vNFGeraREQValor := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 5);
    vCloseForm := Trim(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 4)) = 'CLOSE';
  end
  else if Pos('NF_REABRIR_REQ', vDadosIni.vPesquisa) > 0 then
  begin
  	if Self = nil then
	    Self := TFrmCadPedVenda(Self);
    vDadosIni.vTipoForm := 14;
    vDadosIni.vModalOuChild := 'M';
  	vNFGeraREQNPed := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2));
    vNFGeraREQTipoPed := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3);
    vNFGeraREQValor := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 5);
    vCloseForm := Trim(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 4)) = 'CLOSE';
  end
  else if Pos('PEDVENDA_EDIT_CALC|', vDadosIni.vPesquisa) > 0 then // TelaCadastro = 11;
  begin
  	vDadosIni.vnumVenda := StrToInt(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3));
    vDadosIni.vtpVenda := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);
  	if dtm = nil then
  		dtm := TDtmPedVenda.Create(Self);
    vDadosIni.vTipoForm := 15;
    vDadosIni.vModalOuChild := 'M';
    CadPedVenda.setTipoVendaAlmox;
  end;
	TelaCadastro := vDadosIni.vTipoForm;
  vDadosIni.vPesquisa := '';
  vDadosIni.vTipoForm := 0;

	SpeedButton37.Caption := 'v';
  SpeedButton37.Tag := 0;
  Panel2.Height := 57;
  InibirEstatisticas := True;

  if vCriou = 0 then
  begin
    if CadPedVenda.getTipoVenda = 'REQ' then
      setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,'REQ')
    else if CadPedVenda.getTipoVenda = 'OS' then
      setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,'OS')
    else if CadPedVenda.getTipoVenda = 'ORC' then
      setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,'ORC')
    else
      setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);
  end;

  vDadosIni.hw_registra_estatistica(Self.Name + CadPedVenda.getTipoVenda);
  inherited;

  configuraEntrada;
  configuraShow;

//  CheckBox8.Checked:= _LerConfiguracoesRegistroBoolean('CheckBox8');// and  (CadPedVenda.getTipoVenda<>'REQ'));
  Width := PanelLeft.Width + 10;
  if Self.Enabled then

  ConfiguraCampoConsulta;

  leConfiguracoesFormRegistro;

  RadioGroup1.Items.Clear;
  RadioGroup1.Items.Add('Apenas Dav''s');
  RadioGroup1.Items.Add('Apenas Pré-Vendas');
  RadioGroup1.Items.Add('Cupons Avulsos');
  RadioGroup1.Items.Add('Todos');
  RadioGroup1.ItemIndex := 3;

  tsMesclar.TabVisible          := False;
  tsMesclarProdutos.TabVisible  := False;
  tsMesclarServicos.TabVisible  := False;
  tsMesclarProdutosTerceiro.TabVisible := False;
  tsMesclarServicosTerceiro.TabVisible := False;

  CheckBox9.Checked := _LerConfiguracoesRegistroBoolean(CheckBox9.Name + CadPedVenda.getTipoVenda);
  ck_exibir_devolucao.Checked := _LerConfiguracoesRegistroBoolean(ck_exibir_devolucao.Name + CadPedVenda.getTipoVenda);
  pn_dev_ped_itens.Width := _LerConfiguracoesRegistroInteger(pn_dev_ped_itens.Name + CadPedVenda.getTipoVenda, pn_dev_ped_itens.Width);
  pn_dev_rap_itens.Width := _LerConfiguracoesRegistroInteger(pn_dev_rap_itens.Name + CadPedVenda.getTipoVenda, pn_dev_rap_itens.Width);
  pn_dev_os_itens.Width := _LerConfiguracoesRegistroInteger(pn_dev_os_itens.Name + CadPedVenda.getTipoVenda, pn_dev_os_itens.Width);

  if vCriou = 0 then
  begin
    CadPedVenda.vItProd.abrePedVendaProd(-1);
    CadPedVenda.vItServ.abrePedVendaServ(-1);
    CadPedVenda.vItServTerc.abreServicoTerceiro(-1);
    CadPedVenda.vItProdTerc.abreProdTerceiro(-1);
  end;

  if TelaCadastro = 2 then
  begin
  	Self.Caption := 'Transferências e Devoluções de Produtos';
    PageControl1.ActivePage := TabSheet20;
    TabSheet20.Show;
  end
  else if (TelaCadastro = 3) or (TelaCadastro = 4) then
  begin
    //Position := poScreenCenter;
    if (TelaCadastro = 3) then
      CheckBox4.Checked := True;
    BitBtn3.Click;
  end
  else if (TelaCadastro = 5) then
  begin
    if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2) <> '' then
//      if CadPedVenda.dataSet.State = dsInsert then
    begin
      try
        CadPedVenda.buscas.Close;
        CadPedVenda.buscas.SQL.Text := 'select nped, tipo from pedvenda' +
          ' where nped = ' + vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 4) +
          ' and tipo = ' + QuotedStr(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3)) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        CadPedVenda.buscas.Open;

        CadPedVenda.abrePedVenda(CadPedVenda.buscas.FieldByName('nped').AsInteger);
        if CadPedVenda.dataSet.IsEmpty then
        begin
          BitBtn3.Click;
          CadPedVenda.buscas.Close;
          CadPedVenda.buscas.SQL.Text := 'select cod_agendamento, cod_cliente, cod_vendedor from agendamento' +
            ' where cod_agendamento = ' + vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa;
          CadPedVenda.buscas.Open;

//            if CadPedVenda.buscas.FieldByName('cod_agendamento').AsInteger = CadPedVenda.dataSet.FieldByName('cod_agendamento').AsInteger then
          begin
            if CadPedVenda.buscas.FieldByName('cod_cliente').AsInteger > 0 then
              CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger := CadPedVenda.buscas.FieldByName('cod_cliente').AsInteger;
            if CadPedVenda.buscas.FieldByName('cod_vendedor').AsInteger > 0 then
              CadPedVenda.dataSet.FieldByName('cod_vendedor').AsInteger := CadPedVenda.buscas.FieldByName('cod_vendedor').AsInteger;
          end;
          CadPedVenda.dataSet.FieldByName('cod_agendamento').AsString := vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 2);

          CadPedVenda.buscas.Close;
          CadPedVenda.buscas.SQL.Text := 'select tipo_venda_req_tlvnd, tipo_venda_os_tlvnd from empresa' +
            ' where cod_empresa = ' + vDadosIni.codEmpresa;
          CadPedVenda.buscas.Open;
          if (Trim(CadPedVenda.buscas.FieldByName('tipo_venda_req_tlvnd').AsString) <> '') and
             (Trim(CadPedVenda.dataSet.FieldByName('tipo').AsString) = 'REQ') then
            CadPedVenda.dataSet.FieldByName('tipv').AsString := Trim(CadPedVenda.buscas.FieldByName('tipo_venda_req_tlvnd').AsString)
          else if (Trim(CadPedVenda.buscas.FieldByName('tipo_venda_os_tlvnd').AsString) <> '') and
             (Trim(CadPedVenda.dataSet.FieldByName('tipo').AsString) = 'OS') then
            CadPedVenda.dataSet.FieldByName('tipo_os').AsString := Trim(CadPedVenda.buscas.FieldByName('tipo_venda_os_tlvnd').AsString);

          if vDadosIni.vDtSetTmp <> nil then
            if vDadosIni.vDtSetTmp.FindField('TIPO') <> nil then
              if vDadosIni.vDtSetTmp.FindField('TIPO').AsString = 'PROMTLV' then
                if (vDadosIni.vDtSetTmp.FindField('VENDER') <> nil) and
                  (vDadosIni.vDtSetTmp.FindField('GRUPO_PROD') <> nil) and
                  (vDadosIni.vDtSetTmp.FindField('COD_PROD') <> nil) and
                  (vDadosIni.vDtSetTmp.FindField('NUM_FAB_PROD') <> nil) then
                begin
                  vDadosIni.vDtSetTmp.First;
                  while not vDadosIni.vDtSetTmp.Eof do
                  begin
                    CadPedVenda.vItProd.insert;

                    CadPedVenda.vItProd.buscaProduto(
                      vDadosIni.vDtSetTmp.FieldByName('num_fab_prod').AsString,
                      vDadosIni.vDtSetTmp.FieldByName('grupo_prod').AsInteger,
                      vDadosIni.vDtSetTmp.FieldByName('cod_prod').AsString,
                      vDadosIni.vDtSetTmp.FieldByName('cod_grade').AsInteger);

                    CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat :=
                      vDadosIni.vDtSetTmp.FieldByName('vender').AsFloat;
                    CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency := 0;
                    CadPedVenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString := 'DESCONTO';
                    CadPedVenda.vItProd.dataSet.FieldByName('NAT_DESCACRES').AsString := 'PERCENTUAL';
                    vDadosIni.vDtSetTmp.Next;
                  end;
                end;
        end
        else
          SpeedButton1.Click;

      except
        BitBtn3.Click;
      end;
    end;
    vDadosIni.vPesquisa := '';
  end
  else if (TelaCadastro = 6) then
  begin
    RadioGroup3.ItemIndex := 0;
    BitBtn3.Click;

    vDadosIni.vDtSetTmp.First;
    while not vDadosIni.vDtSetTmp.Eof do
    begin
      if ((vDadosIni.vDtSetTmp.FieldByName('SEL').AsString = 'S') and (vDadosIni.vDtSetTmp.FieldByName('SIT_ATD').AsString = 'AT')) then
      begin
       CadPedvenda.buscas.Close;
       CadPedvenda.buscas.SQL.Text := ' SELECT SIT_ATD FROM CONTROLE_ALMOXARIFADO ' +
        ' WHERE COD_PEDIDO = :COD_PEDIDO AND NITEM = :NITEM AND COD_EMPRESA = :COD_EMPRESA';
       CadPedvenda.buscas.ParamByName('COD_PEDIDO').AsInteger := vDadosIni.vDtSetTmp.FieldByName('COD_PEDIDO').AsInteger;
       CadPedvenda.buscas.ParamByName('NITEM').AsInteger := vDadosIni.vDtSetTmp.FieldByName('NITEM').AsInteger;
       CadPedvenda.buscas.ParamByName('COD_EMPRESA').AsInteger := vDadosIni.vDtSetTmp.FieldByName('COD_EMPRESA').AsInteger;
       CadPedvenda.buscas.Open;

        if CadPedvenda.buscas.FieldByName('SIT_ATD').AsString = 'AT' then
        begin
           if CadPedVenda.vItProd.dataSet.ChangeCount <= 0 then
           begin
             CadPedvenda.dataSet.FieldByName('COD_COND_PAG').AsInteger := vDadosIni.vDtSetTmp.FieldByName('COD_COND_PAG').AsInteger;
             CadPedvenda.dataSet.FieldByName('TIPV').AsString := vDadosIni.vDtSetTmp.FieldByName('TIPV').AsString;
             CadPedvenda.dataSet.FieldByName('COD_VENDEDOR').AsInteger := vDadosIni.vDtSetTmp.FieldByName('COD_VENDEDOR').AsInteger;
             CadPedvenda.dataSet.FieldByName('COD_CLIENTE').AsInteger := vDadosIni.vDtSetTmp.FieldByName('COD_CLIENTE').AsInteger;
             CadPedvenda.vCliente.abreClientes(CadPedvenda.dataSet.FieldByName('COD_CLIENTE').AsInteger);
           end;

            try

             vItem := true;
             if vDadosIni.vDtSetTmp.FieldByName('NDOC').AsInteger > 0 then
             begin
               Application.MessageBox(PChar('Peça Num Fab '  + QuotedStr(trim(vDadosIni.vDtSetTmp.FieldByName('num_fab_prod').AsString)) +
               ' qtde ' + FloatToStr(vDadosIni.vDtSetTmp.FieldByName('quant').AsFloat) + #13 + #13 +
               'Vinculada ao documento: ' + IntToStr(vDadosIni.vDtSetTmp.FieldByName('NDOC').AsInteger) +
               ' tipo: ' + Trim(vDadosIni.vDtSetTmp.FieldByName('TPDOC').AsString) + '!'), 'Atenção', 0 + 64);
               if not vDadosIni.PesqPros('VND221', 'PERMITIR - NUM FAB = ' + QuotedStr(trim(vDadosIni.vDtSetTmp.FieldByName('num_fab_prod').AsString)) +
                ' QTDE = ' + FloatToStr(vDadosIni.vDtSetTmp.FieldByName('quant').AsFloat),
                ' - NUMDOC: ' + IntToStr(vDadosIni.vDtSetTmp.FieldByName('NDOC').AsInteger) +
                ' - TIPODOC: ' + Trim(vDadosIni.vDtSetTmp.FieldByName('TPDOC').AsString) +
                ' - GRUPO: ' + IntToStr(vDadosIni.vDtSetTmp.FieldByName('grupo_prod').AsInteger) +
                ' - COD_PROD: ' + Trim(vDadosIni.vDtSetTmp.FieldByName('cod_prod').AsString),
                 'CONTROLE_ALMOXARIFADO', vDadosIni.vDtSetTmp.FieldByName('COD_PEDIDO').AsString, CadPedvenda.buscas, true) then
                 vItem := false;
             end;

            	if vItem then
              begin
                CadPedVenda.vItProd.insert;
                CadPedVenda.vItProd.dataSet.FieldByName('NUM_FAB_PROD').AsString :=
	                vDadosIni.vDtSetTmp.FieldByName('num_fab_prod').AsString;
                CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat :=
                  vDadosIni.vDtSetTmp.FieldByName('quant').AsFloat;

                CadPedVenda.vItProd.buscaProduto(
                  vDadosIni.vDtSetTmp.FieldByName('num_fab_prod').AsString,
                  vDadosIni.vDtSetTmp.FieldByName('grupo_prod').AsInteger,
                  vDadosIni.vDtSetTmp.FieldByName('cod_prod').AsString,
                  vDadosIni.vDtSetTmp.FieldByName('cod_grade').AsInteger,
                  false);
                  
                CadPedVenda.vItProd.dataSet.FieldByName('COD_GRADE').AsFloat :=
                  vDadosIni.vDtSetTmp.FieldByName('cod_grade').AsFloat;
                CadPedvenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat :=
                  vDadosIni.vDtSetTmp.FieldByName('VLUN').AsFloat;
                CadPedvenda.vItProd.dataSet.FieldByName('VLTOT_PED_ITEM').AsFloat :=
                  vDadosIni.vDtSetTmp.FieldByName('VLTOT').AsFloat;
                CadPedvenda.vItProd.dataSet.FieldByName('VLUN_PED_NF').AsFloat :=
                  vDadosIni.vDtSetTmp.FieldByName('VLUN').AsFloat;
                CadPedvenda.vItProd.dataSet.FieldByName('VLTOT_PED_NF').AsFloat :=
                  vDadosIni.vDtSetTmp.FieldByName('VLTOT').AsFloat;
                CadPedvenda.vItProd.dataSet.FieldByName('COD_PEDIDO').AsInteger :=
                  vDadosIni.vDtSetTmp.FieldByName('COD_PEDIDO').AsInteger;
                CadPedvenda.vItProd.dataSet.FieldByName('NITEM_PEDIDO').AsInteger :=
                  vDadosIni.vDtSetTmp.FieldByName('NITEM').AsInteger;
                CadPedvenda.vItProd.dataSet.FieldByName('COD_VENDEDOR').AsInteger :=
                  vDadosIni.vDtSetTmp.FieldByName('COD_VENDEDOR').AsInteger;
                CadPedvenda.vItProd.dataSet.FieldByName('DATA_ATD').AsDateTime :=
                  vDadosIni.vDtSetTmp.FieldByName('DATA_ATD').AsDateTime;
                CadPedvenda.vItProd.dataSet.FieldByName('HORA_ATD').AsString :=
                  vDadosIni.vDtSetTmp.FieldByName('HORA_ATD').AsString;
                CadPedvenda.vItProd.dataSet.FieldByName('COD_ALMOXARIFADO').AsInteger :=
                  vDadosIni.vDtSetTmp.FieldByName('COD_VENDEDOR1').AsInteger;
                CadPedvenda.vItProd.dataSet.FieldByName('DATA_TRANSF').AsDateTime :=
                  vDadosIni.vDtSetTmp.FieldByName('DATA_ATD').AsDateTime;
                CadPedVenda.vItProd.dataSet.FieldByName('SIT_ATD').AsString := 'AT';
                CadPedVenda.vItProd.dataSet.FieldByName('VLO_UNITARIO').AsFloat :=
                  CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat;
                CadPedVenda.vItProd.dataSet.FieldByName('RATDSAS').AsCurrency := 0;

                if vDadosIni.vDtSetTmp.FieldByName('DESC_ITEM').AsCurrency > 0 then
                begin
                  CadPedVenda.vItProd.dataSet.FieldByName('DESC_ITEM').AsCurrency :=
                    vDadosIni.vDtSetTmp.FieldByName('DESC_ITEM').AsCurrency;
                  CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsCurrency :=
                    vDadosIni.vDtSetTmp.FieldByName('VALOR_DESCACRES').AsCurrency;
                  CadPedVenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString := 'DESCONTO';
                  CadPedVenda.vItProd.dataSet.FieldByName('NAT_DESCACRES').AsString := 'VALOR';
                end;

                CadPedVenda.vItProd._setaVariaveisPromocao(
                	CadPedVenda.vCliente.endAdic.cod_localidade_dest,
                	CadPedVenda.vCliente.dataSet.FieldByName('cod_cliente').AsInteger,
                  CadPedVenda.vCliente.dataSet.FieldByName('cod_tab_preco').AsInteger,
                	CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger,
                  CadPedVenda.vCliente.endAdic.cod_cidade_dest,
                  CadPedVenda.dataSet.FieldByName('TIPV').AsString);
                  
                CadPedVenda.vItProd.post;

                vDadosIni.GravaAuditoria('VND146', 'ABRIR VENDA',
                'GRUPO ' + IntToStr(CadPedVenda.vItProd.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
                ' - COD_PROD ' + trim(CadPedVenda.vItProd.dataSet.FieldByName('COD_PROD').AsString),
                'CONTROLE_ALMOXARIFADO', CadPedvenda.vItProd.dataSet.FieldByName('COD_PEDIDO').AsString,
                 CadPedvenda.buscas);
              end;
            except
              vDadosIni.GravaAuditoria('VND146', 'ABRIR VENDA',
              'GRUPO ' + IntToStr(CadPedVenda.vItProd.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
              ' - COD_PROD ' + trim(CadPedVenda.vItProd.dataSet.FieldByName('COD_PROD').AsString),
              'CONTROLE_ALMOXARIFADO', CadPedvenda.vItProd.dataSet.FieldByName('COD_PEDIDO').AsString,
              CadPedvenda.buscas);
            end;
           end;
        end;
      vDadosIni.vDtSetTmp.Next;
    end;
    CadPedVenda.calculaDescontoAcrescimo;
    CadPedVenda._recalcularPrecoProdutosPromocao;
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
  end
  else if (TelaCadastro = 7) then
  begin
    RadioGroup3.ItemIndex := 1;
    RadioGroup3Click(Sender);
    CadPedVenda.abrePedVenda(vDadosIni.vDtSetTmp.FieldByName('NPED').AsInteger, vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString);
    SpeedButton1Click(Sender);
  end
  else if (TelaCadastro = 8) then
  begin
    RadioGroup3.ItemIndex := 2;
    ComboBox4.ItemIndex := 0;
    RadioGroup3Click(Sender);
    CadPedVenda.abrePedVenda(vDadosIni.vDtSetTmp.FieldByName('NPED').AsInteger, vDadosIni.vDtSetTmp.FieldByName('TIPO').AsString);
    SpeedButton1Click(Sender);
  end
  else if (TelaCadastro = 9) then
  begin
    MaskEdit1.Visible := False;
    MaskEdit2.Visible := False;
    MaskEdit3.Visible := True;
    RadioGroup3.ItemIndex := 1;
    RadioGroup3Click(Sender);
    MaskEdit3.Text := vDadosIni.vDtSetTmp.FieldByName('NPED').AsString;
    ComboBox1.Text := CadPedVenda.dataSet.FieldByName('NPED').DisplayLabel;
    ComboBox3.Text := 'Igual';
    RadioGroup1.ItemIndex := 3;
    RadioGroup2.ItemIndex := 2;
    BitBtn1Click(Sender);
  end
  else if (TelaCadastro = 10) then
  begin
    MaskEdit1.Visible := False;
    MaskEdit2.Visible := False;
    MaskEdit3.Visible := True;
    RadioGroup3.ItemIndex := 2;
    RadioGroup3Click(Sender);
    MaskEdit3.Text := vDadosIni.vDtSetTmp.FieldByName('NPED').AsString;
    ComboBox1.Text := CadPedVenda.dataSet.FieldByName('NPED').DisplayLabel;
    ComboBox3.Text := 'Igual';
    RadioGroup1.ItemIndex := 3;
    RadioGroup2.ItemIndex := 2;
    BitBtn1Click(Sender);
  end
  else if (TelaCadastro = 11) then
  begin
    MaskEdit1.Visible := False;
    MaskEdit2.Visible := False;
    MaskEdit3.Visible := True;
    if trim(vDadosIni.vtpVenda) = 'ORC' then
    	RadioGroup3.ItemIndex := 2
    else if trim(vDadosIni.vtpVenda) = 'OS' then
    	RadioGroup3.ItemIndex := 1
    else
    	RadioGroup3.ItemIndex := 0;
    RadioGroup3Click(Sender);
    MaskEdit3.Text := IntToStr(vDadosIni.vnumVenda);
    ComboBox1.Text := CadPedVenda.dataSet.FieldByName('NPED').DisplayLabel;
    ComboBox3.Text := 'Igual';
    RadioGroup1.ItemIndex := 3;
    RadioGroup2.ItemIndex := 2;
    BitBtn1Click(Sender);
  end
  else if (TelaCadastro = 12) then
  begin
    TelaCadastro := 11;
//    CadPedVenda.rPED.vSqlAdicional := ' pedvenda.nped = ' + IntToStr(StrToIntDef(vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 3), 0));
//    CadPedVenda.ConsultaAvancada('PEDVENDA', '', 'NPED', 'Igual', 'NPED', true, vDadosIni.codEmpresa,
//      '', '', 2, 3, False);
    CadPedVenda.abrePedVenda(vDadosIni.vnumVenda, vDadosIni.vtpVenda);
    if CadPedVenda.dataSet.IsEmpty then
    begin
      Application.MessageBox('Registro não encontrado', 'Atenção', 0 + 64);
      Self.fechar := True;
      PostMessage(Self.Handle, WM_CLOSE, 0, 0);
    end;
    SpeedButton1Click(Sender);
  end
  else if (TelaCadastro = 13)
  	and (vNFGeraREQNPed > 0)
    and (trim(vNFGeraREQTipoPed) <> '')
    and (trim(vNFGeraREQValor) <> '') then
  begin
  	vDadosIni.fechaStatusProcessamento;
    if CadPedVenda.abreFormNFGeraREQ(
      'Deseja Confirmar a Requisição N° ' + IntToStr(vNFGeraREQNPed) +
      '. Valor R$ ' + trim(vNFGeraREQValor)) then
      chamarConfirmacaoPEDpelaNF;
    if vCloseForm then
    begin
      Close;
      exit;
  end;
  end
  else if (TelaCadastro = 14)
  	and (vNFGeraREQNPed > 0)
    and (trim(vNFGeraREQTipoPed) <> '')
    and (trim(vNFGeraREQValor) <> '') then
  begin
    vDadosIni.fechaStatusProcessamento;
    chamarReaberturaPEDpelaNF;
    if vCloseForm then
    begin
      Close;
      Exit;
    end;
  end
  else if (TelaCadastro = 15) then
  begin
  	CadPedVenda.abrePedVenda(vDadosIni.vnumVenda, vDadosIni.vtpVenda);
    if CadPedVenda.dataSet.IsEmpty then
    begin
      Application.MessageBox('Registro não encontrado', 'Atenção', 0 + 64);
      Self.fechar := True;
      PostMessage(Self.Handle, WM_CLOSE, 0, 0);
    end;

    if not CadPedVenda.recalcularMesclagem(vDadosIni.vnumVenda, vDadosIni.vtpVenda) then
    begin
      Application.MessageBox('Registro não encontrado', 'Atenção', 0 + 64);
      Self.fechar := True;
      PostMessage(Self.Handle, WM_CLOSE, 0, 0);
    end;

    CadPedVenda.abrePedVenda(vDadosIni.vnumVenda, vDadosIni.vtpVenda);
    if CadPedVenda.dataSet.IsEmpty then
    begin
      Application.MessageBox('Registro não encontrado', 'Atenção', 0 + 64);
      Self.fechar := True;
      PostMessage(Self.Handle, WM_CLOSE, 0, 0);
    end;
    SpeedButton1Click(Sender);
  end;

  if vCriou = 0 then
  begin
    try
      imgLogo.Proportional := false;
      imgLogo.Picture.RegisterFileFormat('jpg,*.jpg', 'JPG', TJPEGImage);
      imgHw.Picture.RegisterFileFormat('jpg,*.jpg', 'JPG', TJPEGImage);

      try
        imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
      except
      end;

      try
        imgHw.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'hw.jpg');
      except
      end;

    except
    end;
  end;
  {for I := 0 to TForm(FrmCadPedVenda).ComponentCount - 1 do
  begin
    if ((TForm(FrmCadPedVenda).Components[i]) is TControl) then
      TControl(TForm(FrmCadPedVenda).Components[i]).ShowHint := true;
  end;}

  if (Application.MainForm.ClassName = 'TfrmIntegracao') then
  begin
    StatusBar1.Panels.Items[1].Width := StatusBar1.Width -
      StatusBar1.Panels.Items[0].Width - 150;
    StatusBar1.Panels.Add; //(nil, 2);
    StatusBar1.Panels.Items[2].Text := 'Usuário: ' + vDadosIni.vNomeUsuario;
    StatusBar1.Panels.Items[2].Width := 150;
//    StatusBar1.Panels
  end;

  if (vDadosIni.vEmp.vAlmox = 'S2') then
  begin
    if (CadPedVenda.getTipoVenda = 'ORC') then
    begin
      BitBtn3.Enabled := true;
      BitBtn105.Enabled := true;
      BitBtn8.Enabled := true;
      BitBtn107.Enabled := true;
      BitBtn104.Enabled := true;
      BitBtn16.Enabled := true;
      BitBtn106.Enabled := true;
      CheckBox4.Enabled := true;
    end
    else if (CadPedVenda.getTipoVenda = 'OS') then
    begin
      BitBtn3.Enabled := true;
      BitBtn105.Enabled := false;
      BitBtn8.Enabled := false;
      BitBtn107.Enabled := false;
      BitBtn104.Enabled := false;
      BitBtn16.Enabled := false;
      BitBtn106.Enabled := false;
      CheckBox4.Enabled := false;
    end
    else
    begin
      BitBtn3.Enabled := false;
      BitBtn105.Enabled := false;
      BitBtn8.Enabled := false;
      BitBtn107.Enabled := false;
      BitBtn104.Enabled := false;
      BitBtn16.Enabled := false;
      BitBtn106.Enabled := false;
      CheckBox4.Enabled := false;
    end
  end;

  if ((vDadosIni.vEmp.vAgendaOficina = 'S') and (vDadosIni.vEmp.vAlmox <> 'S2')) then
  begin
    BitBtn3.Enabled := true;
    BitBtn105.Enabled := true;
    BitBtn8.Enabled := true;
    BitBtn107.Enabled := true;
    BitBtn104.Enabled := true;
    BitBtn16.Enabled := true;
    BitBtn106.Enabled := true;
    CheckBox4.Enabled := true;
  end;

  if vCriou = 0 then
  begin
    SpeedButton65.Visible := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    SpeedButton67.Visible := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    SpeedButton68.Visible := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    Label262.Visible      := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBEdit128.Visible     := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    Label231.Visible      := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBEdit13.Visible      := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    Label266.Visible      := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBEdit152.Visible     := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    Label264.Visible      := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBEdit150.Visible     := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    Label265.Visible      := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBEdit151.Visible     := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    Label174.Visible      := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBEdit75.Visible      := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    Label267.Visible      := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;
    DBEdit153.Visible     := vDadosIni.vPedVnd.AcrescCondPagComissaoVend;

    DBComboBox16.Visible := False;
    vDadosIni.carregarUnidades(
      CadPedVenda.buscas,
      DBComboBox16);

    DBComboBox17.Visible := False;
    vDadosIni.carregarUnidades(
      CadPedVenda.buscas,
      DBComboBox17);

    edValorUnitarioVendaRapida.FormatSize := '10.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
    edValorTotalVendaRapida.FormatSize := '10.' + IntToStr(vDadosIni.vEmp.vCasasDecimais);
    if CadPedVenda <> nil then
      vDiretorioPadraoImg := IncludeTrailingPathDelimiter(vDadosIni.getConfSisStr('prod_cad_diretorio_padrao_imagens', CadPedVenda.buscas));

    imgInformation.Hint := imgInformation.Hint + #13 + #13 +
      'Processo "FPG019" MONTAR BOLETO A PARTIR DE OS' + #13 +
      'Processo "FPG020" EMITIR BOLETO DE OS NA CONFIRMACAO' + #13 +
      'Processo "VND047" LIBERAR VENDA MARGEM MENOR' + #13 +
      'Processo "VND048" LIBERAR VENDA CLIENTE LIMITE ESTOURADO' + #13 +
      'Processo "VND049" LIBERAR VENDA CLIENTE FATURAMENTO BARRADO' + #13 +
      'Processo "VND050" LIBERAR VENDA CLIENTE TIPO VENDA DIFERENTE' + #13 +
      'Processo "VND085" LIBERAR CHECAR MARK UP POR ITEM AO FECHAR VENDA' + #13 +
      'Processo "VND086" LIBERAR CHECAR MARK UP POR ITEM AO FECHAR OS' + #13 +
      'Processo "VND087" LIBERAR DESCONTOS MAIOR QUE PERMITIDO' + #13 +
      'Processo "VND088" LIBERAR REABRIR VENDA APOS RECEBIMENTO NO CXL ' + #13 +
      'Processo "VND090" CONSULTAR USUÁRIO QUANTO AO TRAVAR VENDAS' + #13 +
      'Processo "VND099" TRAVAR O CODIGO DO VENDEDOR' + #13 +
      'Processo "VND100" TRAVAR VALOR UNITARIO DE VENDA(REQ, ORC) PRODUTO' + #13 +
      'Processo "VND101" TRAVAR VALOR UNITARIO DE VENDA(OS, ORC) PRODUTO' + #13 +
      'Processo "VND105" LIBERAR STATUS VENDA FECHANDO' + #13 +
      'Processo "VND119" LIBERAR DESCONTO ACIMA DO PERMITIDO POR ITEM' + #13 +
      'Processo "VND131" ALTERAR VALOR UNITÁRIO ITEM PRODUTO NA VENDA PARA CIMA' + #13 +
      'Processo "VND132" ALTERAR VALOR UNITÁRIO ITEM PRODUTO NA VENDA PARA BAIXO' + #13 +
      'Processo "VND133" HABILITAR ALTERAR VALOR UNITÁRIO DIF IR PARA ACRESC/DESC ' + #13 +
      'Processo "VND134" HABILITAR EXCLUSAO DO ITEM DAV ' + #13 +
      'Processo "VND136" EMITIR NFCE REQ' + #13 +
      'Processo "VND139" HABILITAR IMPRIMIR ITENS CANCELADOS' + #13 +
      'Processo "VND140" HABILITAR IMPRIMIR OBS/DEFEITO/ACESSORIOS NO ORC' + #13 +
      'Processo "VND155" IMPRIMIR OBS LIVRO DE REGISTRO NA OS OU ORC' + #13 +
      'Processo "VND157" LIBERAR VENDA PRA CLIENTE COM DEBITO' + #13 +
      'Processo "VND158" VERIFICAR PERC. DE COMISSAO DO PRODUTO NA VENDA' + #13 +
      'Processo "VND159" PERMITIR VENDA DE PRODUTO SEM PERC. DE COMISSÃO' + #13 +
      'Processo "VND160" ALTERAR VENDEDOR EM FORMA PAGAMENTO, CREDITOS E CHEQUES' + #13 +
      'Processo "VND161" ALTERAR VENDEDOR E CLIENTE EM CREDITOS JÁ RECEBIDOS' + #13 +
      'Processo "VND162" HABILITAR ALTERACAO CONTROLE REQ JA FECHADA'+ #13 +
      'Processo "VND164" CANCELAR VENDAS OS/REQ APÓS O FECHAMENTO DO MÊS' + #13 +
      'Processo "VND172" HABILITAR CAMPO VALOR UNITÁRIO COM PRECO DE CUSTO CONFIGURADO'+ #13 +
      'Processo "VND174" ABRIR TELA DE POLÍTICA DE DESCONTOS AO CONFIRMAR PEDIDO DE VENDA'+ #13 +
      'Processo "VND177" CONSULTAR USUÁRIO QUANTO AO TRAVAR ITENS NA VENDA' + #13 +
      'Processo "VND179" HABILITAR CAMPOS NATOP, NUM PEDIDO, NITEM (OS, ORC)' + #13 +
      'Processo "VND180" RECALCULAR PRODUTOS/SERVICOS AO TRANSFERIR MERCADORIAS UTILIZANDO EST.FECHADO' + #13 +
      'Processo "VND181" QUESTIONAR USUARIO PARA RECALCULAR PRECOS' + #13 +
      'Processo "VND182" ENVIAR PEDIDO AUTOMATICAMENTE PARA SEPARACAO' + #13 +
      'Processo "VND187" CANCELAR REQ COM REGISTRO DE SEPARACAO' + #13 +
      'Processo "VND188" CANCELAR REQ COM REGISTRO CONFERENCIA CEGA' + #13 +
      'Processo "VND191" LIBERAR CHECAR MARK UP POR ITEM AO FECHAR ORC' + #13 +
      'Processo "VND192" RECALCULAR PRODUTOS/SERVICOS AO CONFIRMAR VND/OS/ORC' + #13 +
      'Processo "VND193" RECALCULAR PRODUTOS/SERVICOS AO EXPORTAR/MESCLAR VND/OS/ORC' + #13 +
      'Processo "VND194" HABILITAR SALVAMENTO AUTO VND/OS/ORC' + #13 +
      'Processo "VND195" REMOVER STATUS EDITANDO AUTO VND/OS/ORC' + #13 +
      'Processo "VND202" HABILITAR CONFERENCIA UNICA ESTOQUE NO FECHAMENTO' + #13 +
      'Processo "VND203" HABILITAR CONFERENCIA UNICA MARKUP NO FECHAMENTO' + #13 +
      'Processo "VND222" HABILITAR PESQUISA VENDAS OUTRO VENDEDOR REQ' + #13 +
      'Processo "VND223" HABILITAR PESQUISA VENDAS OUTRO VENDEDOR OS' + #13 +
      'Processo "VND224" HABILITAR PESQUISA VENDAS OUTRO VENDEDOR ORC' + #13 +
      'Processo "VND225" PERMITIR REIMPRESSAO DAV ACIMA DO LIMITE' + #13 +
      'Processo "VND226" PERMITIR ALTERAR PRODUTOS COM PRECO POR QUANTIDADE PARA PRECO NORMAL' + #13 +
      'Processo "VND233" LIBERAR CONDICOES DE PAGAMENTO A VISTA PARA CLIENTE COM FATURAMENTO BARRADO' + #13 +
      'Processo "VND234" LIBERAR FORMAS DE PAGAMENTO A VISTA PARA CLIENTE COM FATURAMENTO BARRADO' + #13 +
      'Processo "VND235" LIBERAR FORMAS DE PAGAMENTO NÃO DEFINIDAS PARA CLIENTE COM FATURAMENTO BARRADO' + #13 +
      'Processo "VND238" ALTERAR CLIENTE EM FORMA PAGAMENTO, CREDITOS E CHEQUES' + #13 +
      'Processo "VND239" REABRIR/CANCELAR REQUISICAO/ORDEM DE SERVICO COM DEVOLUCAO' + #13 +
      'Processo "VND240" LIBERAR PERC/VALOR DESCONTO NO ITEM ACIMA DO PERMITIDO NO PRODUTO' + #13 +
      'Processo "VND250" CANCELAR VENDA REALIZADA PELO E-COMMERCE' + #13 +
      'Processo "VND251" ALTERAR CLIENTE VND/OS (PROG FID)' + #13 +
      'Processo "VND252" EMITIR NFCE OS' + #13 +
      'Processo "VND253" SITUAÇÃO DE CAIXA DO CLIENTE' + #13 +
      'Processo "VND254" HABILITAR RECEBIMENTO DE REQUISICOES PELO FINANCEIRO' + #13 +
      'Processo "VND255" HABILITAR RECEBIMENTO DE ORDENS DE SERVICO PELO FINANCEIRO' + #13 +
      'Processo "VND260" LIBERAR VENDA PARA CLIENTE COM VENDA ABERTA PARA MESMO CLIENTE E TIPO DE VENDA' + #13 +
      'Processo "VND277" PERCENTUAL DE COMISSAO INFORMADO MENOR QUE O PERCENTUAL CONFIGURADO' + #13 +
      'Processo "VND278" ALTERAR PERCENTUAL DE COMISSAO DEFINIDO NO PERFIL DE COMISSAO' + #13 +
      'Processo "VND279" PERMITIR COMISSAO DO VENDEDOR + PERCENTUAL CONDIÇÃO PAGAMENTO MAIOR QUE ACRESCIMO ITEM' + #13 +
      'Processo "VND280" PERMITIR COMISSAO DO VENDEDOR PARA ITEM VENDIDO ABAIXO DO PRECO' + #13 +
      'Processo "VND281" PERMITIR SALVAR ITEM SEM ESTOQUE' + #13 +
      'Processo "VND282" HABILITAR PROCESSO PARA PERMITIR SALVAR PEDIDO COM ITENS SEM ESTOQUE' + #13 +
      'Processo "VND283" PERMITIR SALVAR PEDIDO ITENS COM ESTOQUE NEGATIVO' + #13 + 
      'Processo "VND284" PERMITIR SALVAR VENDA VAN COM OUTRA EM ABERTO PARA MESMO VENDEDOR' + #13 +
      'Processo "VND285" PERMITIR ALTERAR PRODUTOS COM PRECO DIFERENCIADO PARA PRECO NORMAL' + #13 +
      'Processo "VND286" PERMITIR ALTERAR PRODUTOS COM PRECO PROMOCAO PARA PRECO NORMAL' + #13 +
      'Processo "VND297" HABILITAR CAMPO VALOR UNITARIO PRODUTOS COM PRECO DIFERENCIADO' + #13 +
      'Processo "VND298" HABILITAR CAMPO VALOR UNITARIO PRODUTOS COM PRECO PROMOCAO' + #13 +
      'Processo "VND299" HABILITAR CAMPO VALOR UNITARIO PRODUTOS COM PRECO POR QUANTIDADE' + #13 +
      'Processo "RM018"  CONFIRMAR VENDA SEM CONFERÊNCIA CEGA FECHADA' + #13 +
      'Processo "CHK004" PERMITIR VENDA SEM CONSULTAR NO CHECK CHECK';

    ImgInfConf.Hint := 'Informações adicionais' + #13 + #13 +
      'Processo "VND136" EMITIR CUPOM FISCAL / NFCe REQ' + #13 +
      'Processo "VND252" EMITIR CUPOM FISCAL / NFCe OS' + #13 +
      'Processo "VND266" EMITIR NFe REQ' + #13 +
      'Processo "VND267" EMITIR NFe OS' + #13 +
      'Processo "VND268" EMITIR NFSe OS';

    ImgInfDoc.Hint := ImgInfConf.Hint;

    RadioGroup1.Items.Clear;
    RadioGroup1.Items.Add('Apenas Dav''s');
    RadioGroup1.Items.Add('Apenas Pré-Vendas');
    RadioGroup1.Items.Add('Cupons Avulsos');
    RadioGroup1.Items.Add('Todos');
    RadioGroup1.ItemIndex := 3;

    SpeedButton8.Hint  := 'Emitir NFe / Cupom Fiscal / NFCe / NFSe';
  end;

  if vCriou = 0 then
    carregarDBGrids;

  if vCriou = 0 then
  begin
  	vCriou := 1;
    vTipoCriou := trim(CadPedVenda.getTipoVenda);
  end;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmCadPedVenda.getFaturas;
var
  I: Integer;
begin
  try
    CadPedVenda.FContas.numeroDocumento[ListBox3.ItemIndex] := edDocFaturaEntrada.Text;
    CadPedVenda.FContas.vencimentoDocumento[ListBox3.ItemIndex] := edVencimentoFaturaEntrada.Text;
    CadPedVenda.FContas.valorDocumento[ListBox3.ItemIndex] := edValorFaturaEntrada.AsValue;
    ListBox3.Clear;
    for I := 0 to CadPedVenda.FContas.parcelas - 1 do
      ListBox3.Items.Add(trim(CadPedVenda.FContas.numeroDocumento[i]) + '   ' +
        trim(CadPedVenda.FContas.vencimentoDocumento[i]) + '    ' + 'R$ ' +
        trim(Format('%12.2n', [CadPedVenda.FContas.valorDocumento[i]])));
  except
  end;
end;

procedure TFrmCadPedVenda.gravaConfiguracoesFormRegistro;
begin
	if (TelaCadastro <= 0) then
  begin
  	_GravaConfiguracoesBoolean(CheckBox1.Name + CadPedVenda.getTipoVenda, (CheckBox1.Checked) and (CheckBox1.Visible));
    _GravaConfiguracoesBoolean(CheckBox3.Name + CadPedVenda.getTipoVenda, (CheckBox3.Checked) and (CheckBox3.Visible));
    _GravaConfiguracoesBoolean(SalvarValoresConsultaAvancada.Name  + CadPedVenda.getTipoVenda,  (SalvarValoresConsultaAvancada.Checked) and (SalvarValoresConsultaAvancada.Visible));
    _GravaConfiguracoesBoolean(SalvarValoresConsultaAdicional.Name + CadPedVenda.getTipoVenda, (SalvarValoresConsultaAdicional.Checked) and (SalvarValoresConsultaAdicional.Visible));
  end;

	if (not SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
    CheckBox3.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAvancada.Checked) and (CheckBox3.Checked) then
  begin
    _GravaConfiguracoesInteger(RadioGroup1.Name + CadPedVenda.getTipoVenda, RadioGroup1.ItemIndex);
    _GravaConfiguracoesInteger(RadioGroup2.Name + CadPedVenda.getTipoVenda, RadioGroup2.ItemIndex);
  end;

	if (not SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
    CheckBox1.Checked := false
  else if (TelaCadastro <= 0) and (SalvarValoresConsultaAdicional.Checked) and (CheckBox1.Checked) then
  begin
    _GravaConfiguracoesString(ComboBox11.Name + CadPedVenda.getTipoVenda, ComboBox11.Text);
    _GravaConfiguracoesString(ComboBox12.Name + CadPedVenda.getTipoVenda, ComboBox12.Text);

    _GravaConfiguracoesString(MaskEdit8.Name  + CadPedVenda.getTipoVenda, MaskEdit8.Text);
    _GravaConfiguracoesString(MaskEdit10.Name + CadPedVenda.getTipoVenda, MaskEdit10.Text);
    _GravaConfiguracoesString(MaskEdit9.Name  + CadPedVenda.getTipoVenda, MaskEdit9.Text);
  end;
end;

procedure TFrmCadPedVenda.GravarCampoConsulta;
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
begin
	try
    _GravaConfiguracoesBoolean(CheckBox9.Name + CadPedVenda.getTipoVenda, CheckBox9.Checked);
    _GravaConfiguracoesBoolean(ck_exibir_devolucao.Name + CadPedVenda.getTipoVenda, ck_exibir_devolucao.Checked);
    _GravaConfiguracoesInteger(pn_dev_ped_itens.Name + CadPedVenda.getTipoVenda, pn_dev_ped_itens.Width);
    _GravaConfiguracoesInteger(pn_dev_rap_itens.Name + CadPedVenda.getTipoVenda, pn_dev_rap_itens.Width);
    _GravaConfiguracoesInteger(pn_dev_os_itens.Name + CadPedVenda.getTipoVenda, pn_dev_os_itens.Width);

    Registro := TRegistry.Create;
    try
      Registro.OpenKey(Conf + Self.ClassName, True);
      Registro.WriteString('Campo'+CadPedVenda.getTipoVenda, ComboBox1.Text);
      Registro.WriteString('Condicao'+CadPedVenda.getTipoVenda, ComboBox3.Text);
      Registro.WriteString('DataIni'+CadPedVenda.getTipoVenda, MaskEdit1.Text);
      Registro.WriteString('DataFim'+CadPedVenda.getTipoVenda, MaskEdit2.Text);
      Registro.WriteString('PalavraChave'+CadPedVenda.getTipoVenda, MaskEdit3.Text);
      Registro.WriteBool('MaskEdit1'+CadPedVenda.getTipoVenda,MaskEdit1.Visible);
      Registro.WriteBool('MaskEdit2'+CadPedVenda.getTipoVenda,MaskEdit2.Visible);
      Registro.WriteBool('MaskEdit3'+CadPedVenda.getTipoVenda,MaskEdit3.Visible);
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TFrmCadPedVenda.gridVendaRapidaPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btVendaRapidaPesquisaEditar.Click
  else if Key = VK_INSERT then
    btVendaRapidaPesquisaNova.Click
  else if Key = VK_ESCAPE then
    btVendaRapidaPesquisaNova.Click;
end;

procedure TFrmCadPedVenda.gridVendaRapidaPesquisaTitleClick(Column: TColumn);
begin
  vDadosIni.DBGridOnTitleClick(gridVendaRapidaPesquisa, Column);
end;

procedure TFrmCadPedVenda.grid_cliente_destsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if CadPedVenda.vCliente.endAdic.dataSet.IsEmpty then
    Exit;

 if (CadPedVenda.vCliente.endAdic.f_int('dest_seqid') = CadPedVenda.f_int('dest_seqid')) then
     TDBGrid(Sender).Canvas.Brush.Color := $00C1C1FF;

 if not CadPedVenda.dataSet.FieldByName('dest_seqid_entrg').IsNull then
   if (CadPedVenda.vCliente.endAdic.f_int('dest_seqid') = CadPedVenda.f_int('dest_seqid_entrg')) then
     TDBGrid(Sender).Canvas.Brush.Color := $00AEFF93;

  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmCadPedVenda.grid_cliente_destsEnter(Sender: TObject);
begin
  inherited;
  if CadPedVenda.vCliente.endAdic.dataSet.IsEmpty then
  begin
    group_cliente_enddoc_minuta.Visible := False;
    Exit;
  end;
  CadPedVenda.vCliente.endAdic.onAfterScroll := pedvenda_cliente_endadd_scroll;
end;

procedure TFrmCadPedVenda.grid_cliente_destsExit(Sender: TObject);
begin
  inherited;
  CadPedVenda.vCliente.endAdic.onAfterScroll := nil;
end;

procedure TFrmCadPedVenda.grid_fat_lote_selCellClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'SEL' then
    CadPedVenda.checkUnCheckRow();
end;

procedure TFrmCadPedVenda.grid_fat_lote_selDblClick(Sender: TObject);
begin
  inherited;
  CadPedVenda.checkUnCheckRow();
end;

procedure TFrmCadPedVenda.grid_fat_lote_selDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  Agrid: TDBGrid;
begin
  inherited;
  Agrid := TDBGrid(Sender);
  if (CadPedVenda.f_str('sel') = 'S') and (not (gdFocused in State)) then
  begin
    Agrid := TDBGrid(Sender);
    Agrid.Canvas.Brush.Color := clHighlight;
    Agrid.Canvas.Font.Color  := clHighlightText;
    Agrid.DefaultDrawColumnCell(rect, DataCol, Column, State);
  end;

  if Column.FieldName = 'SEL' then
  begin
    Agrid := TDBGrid(Sender);
    if Column.Index <> 0 then
      Column.Index := 0;
    if Column.Width <> 18 then
      Column.Width := 18;

    Agrid.Canvas.FillRect(Rect);
    Check := 0;
    if Column.Field.AsString = 'S' then
      Check := DFCS_CHECKED
    else
      Check := 0;
    R := Rect;
    InflateRect(R, 2, 0); {Diminue o tamanho do CheckBox}
    DrawFrameControl(Agrid.Canvas.Handle, R, DFC_BUTTON, DFCS_BUTTONCHECK or Check);
  end;
end;

procedure TFrmCadPedVenda.grid_fat_lote_selKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key in [VK_RETURN, VK_SPACE] then
    CadPedVenda.checkUnCheckRow();
end;

procedure TFrmCadPedVenda.grid_fat_lote_selMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if ssCtrl in Shift then
    CadPedVenda.checkUnCheckRow();
end;

procedure TFrmCadPedVenda.grid_ultimos_precosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
  Agrid: TDBGrid;
begin
  inherited;
  Agrid := TDBGrid(Sender);
  if ((Column.FieldName = 'VLUN_PED_ITEM')
  	or (Column.FieldName = 'VLUN_PED_ITEM_LIQ')
    or (Column.FieldName = 'VLUN_PED_ITEM_CONV')
    or (Column.FieldName = 'VLUN_PED_ITEM_CONV_LIQ')
    or (Column.FieldName = 'TABPRATICADA')) then
  begin
    if (vDadosIni.strIn(CadPedVenda.ultimosPrecos.f_str('tabpraticada'), ['P', 'T', 'Q'])) then
    begin
      if (gdFocused in State) then
        Agrid.Canvas.Font.Color := clWhite
      else if (CadPedVenda.ultimosPrecos.f_str('tabpraticada') = 'P') then
      begin
        Agrid.Canvas.Brush.Color := clGreen;
        Agrid.Canvas.FillRect(Rect);
      end
      else if (CadPedVenda.ultimosPrecos.f_str('tabpraticada') = 'Q') then
      begin
        Agrid.Canvas.Brush.Color := $00FFFFD2;
        Agrid.Canvas.FillRect(Rect);
      end
      else
        Agrid.Canvas.Brush.Color := clGradientActiveCaption;
      Agrid.Canvas.FillRect(Rect);
      Agrid.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
  end;
end;

procedure TFrmCadPedVenda.grid_ultimos_precosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    if bt_preco_ultimo_utilizar.Enabled then
      bt_preco_ultimo_utilizar.Click;
end;

procedure TFrmCadPedVenda.GroupBox13Exit(Sender: TObject);
begin
  inherited;
	if (Self.Enabled) and (Self.Visible) and (BitBtn1.CanFocus) then
 		BitBtn1.SetFocus;
end;

procedure TFrmCadPedVenda.GroupBox15Exit(Sender: TObject);
begin
  inherited;
  CadPedVenda.setCombustivel(TrackBar1.Position);
end;

procedure TFrmCadPedVenda.GroupBox17Exit(Sender: TObject);
begin
  inherited;
  if (CadPedVenda.vItServ.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6)
       or (clicouNoX) then
       Exit;
    application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes','Atenção',+0+64);
    if (Self.Enabled) and (Self.Visible) and (BitBtn28.CanFocus) then
      BitBtn28.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (GroupBox17.CanFocus) then
      GroupBox17.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.GroupBox20Exit(Sender: TObject);
begin
  inherited;
  if (CadPedVenda.vItServTerc.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
       Exit;
    application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes','Atenção',+0+64);
    if (Self.Enabled) and (Self.Visible) and (BitBtn36.CanFocus) then
      BitBtn36.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (GroupBox20.CanFocus) then
      GroupBox20.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.GroupBox24Exit(Sender: TObject);
begin
  inherited;
  if (CadPedVenda.vItProd.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6)
      or (tsKit.Tag=1) or (clicouNoX) then
       Exit;
    application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes','Atenção',+0+64);
    if (Self.Enabled) and (Self.Visible) and (BitBtn11.CanFocus) then
      BitBtn11.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (GroupBox24.CanFocus) then
      GroupBox24.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.GroupBox27Exit(Sender: TObject);
begin
  inherited;
  if (CadPedVenda.vItProdTerc.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6)
       or (clicouNoX) then
       Exit;
    application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes','Atenção',+0+64);
    if (Self.Enabled) and (Self.Visible) and (BitBtn32.CanFocus) then
      BitBtn32.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (GroupBox27.CanFocus) then
      GroupBox27.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.GroupBox36Exit(Sender: TObject);
begin
  inherited;
  pn_dev_rap_itens.Visible := False;
end;

procedure TFrmCadPedVenda.GroupBox4Enter(Sender: TObject);
begin
  inherited;
  if (CadPedVenda.dataSet.State in [dsInsert, dsEdit])
  	and not(CadPedVenda.vItProd.dataSet.State in [dsInsert, dsEdit])
    and (CadPedVenda.vItProd.dataSet.RecordCount = 0) then
      BitBtn16Click(Sender)
  else if (BitBtn16.CanFocus)
  	and (ActiveControl<>BitBtn17)
    and (ActiveControl<>BitBtn18) and (ActiveControl<>BitBtn19) then
    	if (Self.Enabled) and (Self.Visible) and (BitBtn16.CanFocus) then
      	BitBtn16.SetFocus;
end;


procedure TFrmCadPedVenda.GroupBox4Exit(Sender: TObject);
begin
  inherited;
  if (CadPedVenda.vItProd.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6)
    or (tsKit.Tag=1) or (clicouNoX) then
       Exit;
    application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes','Atenção',+0+64);
    if (Self.Enabled) and (Self.Visible) and (BitBtn19.CanFocus) then
      BitBtn19.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (GroupBox4.CanFocus) then
      GroupBox4.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.GroupBox7Exit(Sender: TObject);
begin
  inherited;
  DevItensHidePanels;
end;

procedure TFrmCadPedVenda.habilitaCamposOrcamento;
var
  i: integer;
begin
  CadPedVenda.EventDescPercTotProdChange   := nil;
  CadPedVenda.EventDescPercTotServChange   := nil;
  CadPedVenda.EventAcrescPercTotProdChange := nil;
  CadPedVenda.EventAcrescPercTotServChange := nil;

  EventDescPercTotProdChange;
  EventDescPercTotServChange;
  EventAcrescPercTotProdChange;
  EventAcrescPercTotServChange;

  pnDescValorOS.Visible      := False;
  pnDescValorOS.Width        := 245;
  pnDescValorOS.Height       := 52;
  pnDescValorOS.BevelOuter   := bvNone;

  pnAcrescValorOS.Visible    := False;
  pnAcrescValorOS.Width      := 245;
  pnAcrescValorOS.Height     := 52;
  pnAcrescValorOS.BevelOuter := bvNone;

  edDescProdValor.OnExit    := exitDescontoOSProdServ;
  edDescServValor.OnExit    := exitDescontoOSProdServ;

  edAcrescProdValor.OnExit  := exitAcrescimoOSProdServ;
  edAcrescServValor.OnExit  := exitAcrescimoOSProdServ;

  CadPedVenda.EventDescPercTotProdChange   := EventDescPercTotProdChange;
  CadPedVenda.EventDescPercTotServChange   := EventDescPercTotServChange;
  CadPedVenda.EventAcrescPercTotProdChange := EventAcrescPercTotProdChange;
  CadPedVenda.EventAcrescPercTotServChange := EventAcrescPercTotServChange;

  Label118.Caption := ' Nº Orcamento:';
  tsOS.Caption := 'Orçamento';
  Label38.Caption := 'Tipo de Orc';
  Label41.Caption := 'Data da Orc.';
  GroupBox14.Caption := 'Total do Orçamento';
  Label79.Caption := 'Vendedor';
  DBEdit21.OnExit := exitDescontoAcrescimo;
  DBEdit24.OnExit := exitDescontoAcrescimo;

  bt_alt_hora_entrada.Visible := False;
  DBEdit26.Visible := false;

//  DBEdit28.Visible := false;
//  DBEdit33.Visible := false;
  DBEdit35.Visible := false;
  DBEdit36.Visible := false;
  DBEdit37.Visible := false;
  DBComboBox3.Visible := False;
  CheckBox4.Checked := false;

  Label38.Visible := false;
//  Label39.Visible := false;
//  Label40.Visible := false;
  Label41.Visible := false;
  Label48.Visible := false;
  Label49.Visible := false;
  Label50.Visible := false;
  SpeedButton8.Visible := false;
  SpeedButton7.Visible := false;
  SpeedButton6.Visible := false;
  SpeedButton10.Visible := false;
  SpeedButton16.Visible := false;
  SpeedButton12.Visible := False;
  SpeedButton23.Visible := False;
  SpeedButton28.Visible := False;
  SpeedButton29.Visible := False;
  SpeedButton62.Visible := False;

  DBEdit130.Visible := true;
  DBEdit131.Visible := true;
  DBLookupComboBox30.Visible := true;
  Label190.Visible := true;
  Label191.Visible := true;
  Label192.Visible := true;
  CheckBox5.Visible := true;
  CheckBox5.Checked := false;
  DBComboBox5.Visible := true;
  DBComboBox5.Top := DBComboBox3.Top;
  DBComboBox5.Left := DBComboBox3.Left;
  //  SpeedButton11.Visible := true;

  SpeedButton1.Visible := True;
  SpeedButton2.Visible := True;
//  Label231.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
//  DBEdit128.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
//  Label232.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
//  DBEdit132.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
//  Label233.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
//  DBEdit133.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
  vDadosIni.vInibeMensPesqPros := 'S';
  if vDadosIni.PesqPros('VND128', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, true) then
  begin
    SpeedButton4.Visible := True;
    SpeedButton25.Visible := True;
  end
  else
  begin
    SpeedButton4.Visible := FALSE;
    SpeedButton25.Visible := FALSE;
  end;


  if (vDadosIni.vEmp.vUsarDAV = 'S') or (vDadosIni.vEmp.vUsarDAVOS = 'S') then
  begin
    SpeedButton2.Hint := 'Cancelar DAV - [VND104]';//- [VND006]';
    SpeedButton4.Visible := FALSE;
    SpeedButton25.Visible := FALSE;
  end;

  PageControl3.ActivePage := tsOrdemServ;
  tsOrdemServ.Tag := 0;
  //  if CadPedVenda.getSegServ = 'S' then
  if (vDadosIni.vEmp.vSegmentaProdVenda = 'S1') or (vDadosIni.vEmp.vSegmentaProdVenda = 'S2') then
  begin
    Label66.Visible := true;
    DBEdit44.Visible := vDadosIni.vEmp.vSegmentaProdVenda = 'S1';
    DBLookupComboBox8.Visible := true;
  end;
  DBEdit16.Enabled := vDadosIni.vTintas = 'S';
  Label63.Visible := False;
  SpeedButton24.Visible := false;
  SpeedButton26.Visible := false;
  SpeedButton17.Visible := false;

  if CadPedVenda._habilitadoDataPrometida(CadPedVenda.getTipoVenda) then
  begin
    Label46.Visible := True;
    DBEdit27.Visible := True;
    DBEdit27.Enabled := CadPedVenda.dataSet.State = dsInsert;
    bt_alt_hora_prometida.Visible := CadPedVenda.dataSet.State = dsEdit;

    Label47.Visible := True;
    DBEdit34.Visible := True;

    Label190.Top := 42;
    Label190.Left := 549;
    DBEdit130.Top := 57;
    DBEdit130.Left := 549;
    DBLookupComboBox30.Top := 57;
    DBLookupComboBox30.Left := 602;
    DBLookupComboBox30.Width := 202;
    SpeedButton53.Top := 57;
    SpeedButton53.Left := 808;
  end
  else
  begin
    Label46.Visible := False;
    DBEdit27.Visible := False;
    bt_alt_hora_prometida.Visible := False;

    Label47.Visible := False;
    DBEdit34.Visible := False;

    Label190.Top := 8;
    Label190.Left := 333;
    DBEdit130.Top := 21;
    DBEdit130.Left := 333;
    DBLookupComboBox30.Top := 21;
    DBLookupComboBox30.Left := 386;
    DBLookupComboBox30.Width := 261;
    SpeedButton53.Top := 21;
    SpeedButton53.Left := 653;
  end;

  Label256.Visible := false;
  DBEdit149.Visible := false;
  DBLookupComboBox42.Visible := false;
  if CadPedVenda.OrcamentoSoPecas then
  begin
    label26.Visible := false; //(vDadosIni.vMNF='S');
    DBEdit18.Visible := false; //(vDadosIni.vMNF='S');
  end;
//  SpeedButton21.Hint := 'Visualizar Status do Orçamento';
  SpeedButton21.Visible := true;
  SpeedButton24.Hint := '';
  SpeedButton18.Visible := True;
  SpeedButton18.Top := 4;
  SpeedButton18.Left := 520;
  SpeedButton18.Hint := 'Alterar vendedor ou cliente do orçamento - [VND199]';
  SpeedButton35.Visible := false;
  SelecionarORC.Visible := true;
  SelecionarDAVparaMesclagem1.Visible := false;
//  if CheckBox8.Enabled then
//  begin
    if vDadosIni.vEmp.vUsarAparelho = 'S' then
    begin
      for I := 0 to GroupBox22.ControlCount - 1 do
        if (vDadosIni.vEmp.vVincularVeicOBJ='E') and CheckBox8.Enabled then
          TGroupBox(GroupBox22.Controls[i]).Visible := CheckBox8.Checked or (CadPedVenda.dataSet.FieldByName('COD_EQUIP').AsInteger > 0)
        else if vDadosIni.vEmp.vVincularVeicOBJ='N' then
          TGroupBox(GroupBox22.Controls[i]).Visible := false
        else TGroupBox(GroupBox22.Controls[i]).Visible := true;
      for I := 0 to GroupBox23.ControlCount - 1 do
        if (vDadosIni.vEmp.vVincularVeicOBJ='E') and CheckBox8.Enabled then
          TGroupBox(GroupBox23.Controls[i]).Visible := CheckBox8.Checked or (CadPedVenda.dataSet.FieldByName('COD_EQUIP').AsInteger > 0)
        else if vDadosIni.vEmp.vVincularVeicOBJ='N' then
          TGroupBox(GroupBox23.Controls[i]).Visible := false
        else TGroupBox(GroupBox23.Controls[i]).Visible := true;
      Label86.Visible := true;
      Label85.Visible := true;
      Dbedit43.Visible := true;
      Dbmemo5.Visible := true;
      Image1.Visible := true;
    end
    else
    begin
      for I := 0 to GroupBox22.ControlCount - 1 do
        TGroupBox(GroupBox22.Controls[i]).Visible := CheckBox8.Checked or (trim(CadPedVenda.dataSet.FieldByName('PLACA').AsString) <> '');
      for I := 0 to GroupBox23.ControlCount - 1 do
        TGroupBox(GroupBox23.Controls[i]).Visible := CheckBox8.Checked or (trim(CadPedVenda.dataSet.FieldByName('PLACA').AsString) <> '');
      Label86.Visible := true;
      Label85.Visible := true;
      Dbedit43.Visible := true;
      Dbmemo5.Visible := true;
      Image1.Visible := true;
    end;
end;

procedure TFrmCadPedVenda.habilitaCamposOrdemDeServico;
var
  ConfigPoliticaPag: TConfig_sistema_class;
  i: integer;
  vUsarControlesVenda: string;
begin
	try
    ConfigPoliticaPag := TConfig_sistema_class.getConf('ped_vnd_definir_politica_pagamento', CadPedVenda.buscas, vDadosIni.cod_empresa);
    vUsarControlesVenda := UpperCase(ConfigPoliticaPag.ReadString('CONTROLE', 'Usar'));

    Label118.Caption := 'Nº Ordem Serv:';
    tsOS.Caption := 'Ordem de Serviço';
    Label38.Caption := 'Tipo da OS';
    Label41.Caption := 'Data da O.S.';
    GroupBox14.Caption := 'Total da Ordem de Serviço';
    Label79.Caption := 'Recepcionista';
    DBEdit31.Enabled := True;
    DBEdit157.Enabled := True;
  //  DBEdit29.OnExit := exitDescontoAcrescimo;

    bt_alt_hora_entrada.Visible := CadPedVenda.dataSet.State = dsEdit;
    DBEdit26.Visible := true;
    DBEdit26.Enabled := CadPedVenda.dataSet.State = dsInsert;

  //  DBEdit28.Visible := true;
  //  DBEdit33.Visible := true;
    DBEdit35.Visible := true;
    DBEdit36.Visible := true;
    DBEdit37.Visible := true;
    DBComboBox3.Visible := true;

    Label38.Visible := true;
  //  Label39.Visible := true;
  //  Label40.Visible := true;
    Label41.Visible := true;
    Label48.Visible := true;
    Label49.Visible := true;
    Label50.Visible := true;
    SpeedButton8.Visible := true;
    SpeedButton7.Visible := true;
    SpeedButton6.Visible := true;
    SpeedButton10.Visible := true;
    SpeedButton16.Visible := true;
    SpeedButton12.Visible := true;
    SpeedButton23.Visible := (vDadosIni.vEmp.vUsarAparelho = 'S');
    SpeedButton28.Visible := False;
    SpeedButton29.Visible := False;
    SpeedButton62.Visible := vDadosIni.vEmp.vUsarPoliticasDesc;

    if CadPedVenda._habilitadoDataPrometida(CadPedVenda.getTipoVenda) then
  	begin
      Label46.Visible := True;
      DBEdit27.Visible := True;
      DBEdit27.Enabled := CadPedVenda.dataSet.State = dsInsert;
      bt_alt_hora_prometida.Visible := CadPedVenda.dataSet.State = dsEdit;

      Label47.Visible := True;
      DBEdit34.Visible := True;

      Label190.Top := 42;
      Label190.Left := 549;
      DBEdit130.Top := 57;
      DBEdit130.Left := 549;
      DBLookupComboBox30.Top := 57;
      DBLookupComboBox30.Left := 602;
      DBLookupComboBox30.Width := 202;
      SpeedButton53.Top := 57;
      SpeedButton53.Left := 808;
    end
    else
    begin
      Label46.Visible := False;
      DBEdit27.Visible := False;

  	  Label47.Visible := False;
    	DBEdit34.Visible := False;

      Label190.Top := 8;
      Label190.Left := 333;
      DBEdit130.Top := 21;
      DBEdit130.Left := 333;
      DBLookupComboBox30.Top := 21;
      DBLookupComboBox30.Left := 386;
      DBLookupComboBox30.Width := 261;
      SpeedButton53.Top := 21;
      SpeedButton53.Left := 653;
    end;

    Label256.Visible := vUsarControlesVenda = 'S';
    DBEdit149.Visible := vUsarControlesVenda = 'S';
    DBLookupComboBox42.Visible := vUsarControlesVenda = 'S';

  //  DBEdit130.Visible := False;
    DBEdit131.Visible := False;
  //  DBLookupComboBox30.Visible := False;
  //  Label190.Visible := False;
    Label191.Visible := False;
    Label192.Visible := False;
    CheckBox4.Checked := false;
    CheckBox5.Visible := false;
    DBComboBox5.Visible := false;
    //  SpeedButton11.Visible := False;
    Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
//  Label231.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
//  DBEdit128.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
//  Label232.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
//  DBEdit132.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
//  Label233.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
//  DBEdit133.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
    SpeedButton2.Visible := True;
    vDadosIni.vInibeMensPesqPros := 'S';
    if vDadosIni.PesqPros('VND128', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, true) then
    begin
      SpeedButton4.Visible := True;
      SpeedButton25.Visible := True;
    end else
    begin
      SpeedButton4.Visible := FALSE;
      SpeedButton25.Visible := FALSE;
    end;

    if vDadosIni.vEmp.vUsarDAV = 'S' then
    begin
      SpeedButton2.Hint := 'Cancelar DAV - [VND104]';//- [VND005]';
      SpeedButton4.Visible := FALSE;
      SpeedButton25.Visible := FALSE;
    end;

    PageControl3.ActivePage := tsOrdemServ;
    tsOrdemServ.Tag := 0;
    //  if CadPedVenda.getSegServ = 'S' then
    if (vDadosIni.vEmp.vSegmentaProdVenda = 'S1') or (vDadosIni.vEmp.vSegmentaProdVenda = 'S2') then
    begin
      Label66.Visible := true;
      DBEdit44.Visible := vDadosIni.vEmp.vSegmentaProdVenda = 'S1';
      DBLookupComboBox8.Visible := true;
    end;
    DBEdit16.Enabled := vDadosIni.vTintas = 'S';
    SpeedButton24.Visible := True;
    SpeedButton26.Visible := True;
    SpeedButton17.Visible := true;
    SpeedButton21.Hint := 'Visualizar Status da OS - [VND118]';
    SpeedButton21.Visible := true;
    SpeedButton35.Visible := false;
    SpeedButton24.Hint := 'Liberar O.S. da trava para abertura de novas Ordens de Serviços - [VND091]';
    DBLookupComboBox11.Visible := true;
    DBEdit87.Visible := true;
    Label125.Visible := true;
    SpeedButton18.Visible := True;
    SpeedButton18.Top := 55;
    SpeedButton18.Left := 634;
    SpeedButton18.Hint := 'Alterar cliente da ordem de serviço - [VND200]' + #13 +
                          'Alterar recepcionista da ordem de serviço - [VND201]';
    SelecionarORC.Visible := false;
    SelecionarDAVparaMesclagem1.Visible := true;

    if CheckBox8.Enabled then
    begin
      if vDadosIni.vEmp.vUsarAparelho = 'S' then
      begin
        for I := 0 to GroupBox22.ControlCount - 1 do
          TGroupBox(GroupBox22.Controls[i]).Visible := CheckBox8.Checked or (CadPedVenda.dataSet.FieldByName('COD_EQUIP').AsInteger > 0);
        for I := 0 to GroupBox23.ControlCount - 1 do
          TGroupBox(GroupBox23.Controls[i]).Visible := CheckBox8.Checked or (CadPedVenda.dataSet.FieldByName('COD_EQUIP').AsInteger > 0);
        Label86.Visible := true;
        Label85.Visible := true;
        Dbedit43.Visible := true;
        Dbmemo5.Visible := true;
        Image1.Visible := true;
      end
      else
      begin
        for I := 0 to GroupBox22.ControlCount - 1 do
          TGroupBox(GroupBox22.Controls[i]).Visible := CheckBox8.Checked or (trim(CadPedVenda.dataSet.FieldByName('PLACA').AsString) <> '');
        for I := 0 to GroupBox23.ControlCount - 1 do
          TGroupBox(GroupBox23.Controls[i]).Visible := CheckBox8.Checked or (trim(CadPedVenda.dataSet.FieldByName('PLACA').AsString) <> '');
        Label86.Visible := true;
        Label85.Visible := true;
        Dbedit43.Visible := true;
        Dbmemo5.Visible := true;
        Image1.Visible := true;
      end;
    end;

    CadPedVenda.EventDescPercTotProdChange   := nil;
    CadPedVenda.EventDescPercTotServChange   := nil;
    CadPedVenda.EventAcrescPercTotProdChange := nil;
    CadPedVenda.EventAcrescPercTotServChange := nil;

    EventDescPercTotProdChange;
    EventDescPercTotServChange;
    EventAcrescPercTotProdChange;
    EventAcrescPercTotServChange;

    pnDescValorOS.Visible      := False;
    pnDescValorOS.Width        := 245;
    pnDescValorOS.Height       := 52;
    pnDescValorOS.BevelOuter   := bvNone;

    pnAcrescValorOS.Visible    := False;
    pnAcrescValorOS.Width      := 245;
    pnAcrescValorOS.Height     := 52;
    pnAcrescValorOS.BevelOuter := bvNone;

    edDescProdValor.OnExit    := exitDescontoOSProdServ;
    edDescServValor.OnExit    := exitDescontoOSProdServ;

    edAcrescProdValor.OnExit  := exitAcrescimoOSProdServ;
  	edAcrescServValor.OnExit  := exitAcrescimoOSProdServ;

    CadPedVenda.EventDescPercTotProdChange   := EventDescPercTotProdChange;
    CadPedVenda.EventDescPercTotServChange   := EventDescPercTotServChange;
    CadPedVenda.EventAcrescPercTotProdChange := EventAcrescPercTotProdChange;
    CadPedVenda.EventAcrescPercTotServChange := EventAcrescPercTotServChange;
    {
    if (vDadosIni.vUsarPlano =
     'S') or (vDadosIni.vUsarPlano = '2') then
      bt_show_form_valores_nf_os.Visible := False
    else
    }
    with CadPedVenda do
      bt_show_form_valores_nf_os.Visible := (conf.valores_nf.ConfActive('Conf_' + f_str('tipo'), 'Ativa', 'N', 'S')) or
                                            (f_str('nf_ac_calctrib') = 'S');
    DBEdit22.Enabled := True;

//    pnAcrescValorOS.Visible   := (not bt_show_form_valores_nf_os.Visible);

//    Label268.Enabled          := (not bt_show_form_valores_nf_os.Visible);
    DBEdit155.Enabled         := (not bt_show_form_valores_nf_os.Visible);
//    lbAcrescProdVal.Enabled   := (not bt_show_form_valores_nf_os.Visible);

//    Label276.Enabled          := (not bt_show_form_valores_nf_os.Visible);
//    DBEdit156.Enabled         := (not bt_show_form_valores_nf_os.Visible);
//    lbAcrescServVal.Enabled   := (not bt_show_form_valores_nf_os.Visible);

//    Label277.Enabled          := (not bt_show_form_valores_nf_os.Visible);
    DBEdit157.Enabled         := (not bt_show_form_valores_nf_os.Visible);
//    spSwitchAcresc.Visible    := (not bt_show_form_valores_nf_os.Visible);

  	edAcrescProdValor.Enabled := (not bt_show_form_valores_nf_os.Visible);

    if bt_show_form_valores_nf_os.Visible then
    begin
      DBEdit22.Enabled := False;
      DBEdit31.Enabled := False;
      DBEdit157.Enabled := False;
  //    DBEdit29.OnExit := ed_nf_dc_descontoExit;
    end
    else if (vDadosIni.vUsarPlano = 'S') or (vDadosIni.vUsarPlano = '2') then
      DBEdit22.Enabled := False
    else
      DBEdit22.Enabled := True;

    DBEdit23.Enabled  := DBEdit22.Enabled;
    DBEdit110.Enabled := DBEdit22.Enabled;
    DBEdit112.Enabled := DBEdit22.Enabled;

    CadPedVenda.onCalcValoresNF := faturamento_calc_valores_nota;
  finally
    if Assigned(ConfigPoliticaPag) then
      FreeAndNil(ConfigPoliticaPag);
  end;
end;

procedure TFrmCadPedVenda.habilitaCamposRequisicao;
var
	ConfigPoliticaPag: TConfig_sistema_class;
  vUsarControlesVenda: string;
begin
	try
    CadPedVenda.EventDescPercTotProdChange := nil;
    CadPedVenda.EventDescPercTotServChange := nil;
    CadPedVenda.EventAcrescPercTotProdChange := nil;
    CadPedVenda.EventAcrescPercTotServChange := nil;

    ConfigPoliticaPag := TConfig_sistema_class.getConf('ped_vnd_definir_politica_pagamento', CadPedVenda.buscas, vDadosIni.cod_empresa);
    vUsarControlesVenda := UpperCase(ConfigPoliticaPag.ReadString('CONTROLE', 'Usar'));

    if vDadosIni.vDadosAdicReceb <> 'S' then
    begin
  //    DBEdit19.Enabled := False;
  //    DBEdit20.Enabled := False;
      DBEdit92.Visible := False;
      DBEdit93.Visible := False;
      label134.Visible := false;
      label135.Visible := false;
      BitBtn103.Visible := false;
      DBComboBox16.Enabled := True;
      DBComboBox17.Enabled := True;
      DBComboBoxUnVendaRapida.Enabled := True;
    end
    else
    begin
  //    DBEdit19.Enabled := True;
  //    DBEdit20.Enabled := True;
      DBEdit92.Visible := true;
      DBEdit93.Visible := true;
      label134.Visible := true;
      label135.Visible := true;
      BitBtn103.Visible := CadPedVenda.vendaFechada;
  	  DBComboBox16.Enabled := False;
   	  DBComboBox17.Enabled := False;
   	  DBComboBoxUnVendaRapida.Enabled := False;
    end;
    DBEdit21.Enabled := True;
    DBEdit23.OnExit := exitDescontoAcrescimo;
    DBEdit24.OnExit := exitDescontoAcrescimo;
    DBEdit23.DataField := 'ACRESC_P_PROD';
    DBEdit23.Hint := 'Acréscimo em % no total dos produtos';
    Label29.Caption := 'Valor Desconto:';
    Label30.Caption := 'Valor do Acréscimo:';
    Label31.Caption := 'Acresc. Produtos(%):';

    DBEdit109.Enabled := True;
    DBEdit111.OnExit := exitDescontoAcrescimo;
    DBEdit112.OnExit := exitDescontoAcrescimo;
    DBEdit112.DataField := 'ACRESC_P_PROD';
    Label149.Caption := 'Valor Desconto:';
    Label156.Caption := 'Valor do Acréscimo:';
    Label164.Caption := 'Acresc. Produtos(%):';

//  Label231.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
//  DBEdit128.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
//  Label232.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
//  DBEdit132.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
//  Label233.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
//  DBEdit133.Visible := vDadosIni.vPedVnd.exibirUnidadeImpDAV;
    DBEdit17.Enabled := vDadosIni.vTintas = 'S';
    SpeedButton23.Visible := False;
    SpeedButton28.Visible := (vDadosIni.vEmp.vVnd_AprovacaoGerente = 'S') and (CadPedVenda.getTipoVenda = 'REQ');
    SpeedButton29.Visible := (vDadosIni.vEmp.vOC_TipoControleOrdemC = 'REQ') and (CadPedVenda.getTipoVenda = 'REQ');

  	if CadPedVenda._habilitadoDataPrometida(CadPedVenda.getTipoVenda) then
  	begin
      DBEdit113.Width := 493;
      btEditoObsReq.Left := 603;

      Label172.Visible := True;
      DBEdit154.Visible := True;
      DBEdit154.Enabled := CadPedVenda.dataSet.State = dsInsert;
      bt_alt_hora_prometida2.Visible := CadPedVenda.dataSet.State = dsEdit;
    end
    else
    begin
    	DBEdit113.Width := 726;
      btEditoObsReq.Left := 834;

      Label172.Visible := False;
      DBEdit154.Visible := False;
      bt_alt_hora_prometida2.Visible := False;
    end;

    SpeedButton2.Visible := True;
    vDadosIni.vInibeMensPesqPros := 'S';
    if vDadosIni.PesqPros('VND128', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, true) then
    begin
      SpeedButton4.Visible := True;
      SpeedButton25.Visible := True;
    end
    else
    begin
      SpeedButton4.Visible := FALSE;
      SpeedButton25.Visible := FALSE;
    end;

    if vDadosIni.vEmp.vUsarDAV = 'S' then
    begin
      SpeedButton2.Hint := 'Cancelar DAV - [VND104]';
      SpeedButton4.Visible := FALSE;
      SpeedButton25.Visible := FALSE;
    end;
    SpeedButton10.Visible := true;
    SpeedButton16.Visible := false;

    BorderIcons := [biMaximize, biMinimize, biSystemMenu];
    if CheckBox4.Checked then
    begin
      edCodBarra.Enabled := true;
      tsitens.TabVisible := false;
      tsfechamento.TabVisible := false;
      tsCancelarItens.TabVisible := false;
      //    tsAcresDesc.TabVisible := false;
      tsAlteraPreco.TabVisible := false;
      tsVndRapMaisAcoes.TabVisible := False;
      lMsg.Caption := 'Informe o Código de Barras do Produto';
      ldescricao.Caption := '';
    end;
    if CadPedVenda.getTipoVenda = 'REQ' then
    begin
      SpeedButton24.Visible := True;
      SpeedButton18.Visible := true;
      SpeedButton18.Top := 4;
      SpeedButton18.Left := 691;
      SpeedButton18.Hint := 'Alterar vendedor ou cliente da requisição - [VND098]';
      SpeedButton35.Visible := true;
      SpeedButton12.Visible := true;
    end;
    SpeedButton26.Visible := false;
    SpeedButton17.Visible := false;
    SpeedButton21.Hint := 'Visualizar Status da Requisição - [VND123]';
    SpeedButton21.Visible := true;
    SpeedButton24.Hint := 'Liberar Requisição da trava para abertura de novas Requisições';
    DBLookupComboBox11.Visible := false;
    DBEdit87.Visible := false;
    Label125.Visible := false;
  //  Panel15.Enabled := False;
    SelecionarORC.Visible := false;
    SelecionarDAVparaMesclagem1.Visible := true;
    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('VND099', 'PERMITIR', '', 'PEDVENDA', inttostr(vDadosIni.vCodUsuario) + ' ' + vDadosIni.vNomeUsuario, CadPedVenda.buscas, true) then
    begin
      dbedit5.Enabled := false;
      dblookupcombobox16.Enabled := false;
      dbedit70.Enabled := false;
      dblookupcombobox26.Enabled := false;
    end
    else
    begin
      dbedit5.Enabled := true;
      dblookupcombobox16.Enabled := true;
      dbedit70.Enabled := true;
      dblookupcombobox26.Enabled := true;
    end;
    DBEdit103.Visible := vDadosIni.vEmp.vOC_AlterarPedComOCFech <> 'N';
    Label170.Visible := vDadosIni.vEmp.vOC_AlterarPedComOCFech <> 'N';
    DBComboBox9.Visible := CadPedVenda.OrcamentoSoPecas;
    Label154.Visible := CadPedVenda.OrcamentoSoPecas;

    if (vDadosIni.vEmp.vUsarControlesCliente = 'S') and (vUsarControlesVenda <> 'S') then
    begin
  //    DBLookupComboBox14.Width := 258;
  //    SpeedButton43.Left := 400;
      SpeedButton43.Visible := True;

      DBLookupComboBox13.Width := 256;
      SpeedButton44.Left := 447;
      SpeedButton44.Visible := True;
    end
    else
    begin
  //    DBLookupComboBox14.Width := 258;
      SpeedButton43.Visible := False;

      DBLookupComboBox13.Width := 282;
      SpeedButton44.Visible := False;
    end;
    {
    if (vDadosIni.vUsarPlano = 'S') or (vDadosIni.vUsarPlano = '2') then
      bt_show_form_valores_nf_req.Visible := False
    else
    }
      bt_show_form_valores_nf_req.Visible := (CadPedVenda.conf.valores_nf.ConfActive('Conf_' + CadPedVenda.fstr('tipo'), 'Ativa', 'N', 'S')) or
                                             (CadPedVenda.fstr('nf_ac_calctrib') = 'S');

    dbObsReqSemLimite.Visible := CadPedVenda.conf.ped_vnd_req_obs_semlimite;
    dbObsReqSemLimite.Top := DBEdit113.Top;
    dbObsReqSemLimite.Left := DBEdit113.Left;
    dbObsReqSemLimite.Width := DBEdit113.Width;
    DBEdit113.Visible := not dbObsReqSemLimite.Visible;
    GroupBox6.Height := dbObsReqSemLimite.Top + IfThen(dbObsReqSemLimite.Visible, dbObsReqSemLimite.Height, DBEdit113.Height) + 7;
    btEditoObsReq.Visible := dbObsReqSemLimite.Visible;

    dbObsReqSemLimiteRap.Visible := dbObsReqSemLimite.Visible;
    dbObsReqSemLimiteRap.Top := DBEdit114.Top;
    dbObsReqSemLimiteRap.Left := DBEdit114.Left;
    dbObsReqSemLimiteRap.Width := DBEdit114.Width;
    DBEdit114.Visible := not dbObsReqSemLimiteRap.Visible;

    bt_show_form_valores_nf_reqrap.Visible := bt_show_form_valores_nf_req.Visible;
    DBEdit22.Enabled := True;
    if bt_show_form_valores_nf_req.Visible then
    begin
      DBEdit22.Enabled := False;
      DBEdit21.Enabled := False;
      DBEdit24.OnExit := ed_nf_dc_descontoExit;
      Label29.Caption := 'Soma Descontos R$';
      Label30.Caption := 'Soma Acréscimos R$';
      Label31.Caption := 'Desc. Produtos($):';
      DBEdit23.DataField := 'NF_DC_DESCONTO';
      DBEdit23.Hint := 'Desconto em R$ no total dos produtos que permitem desconto';
      DBEdit23.OnExit := ed_nf_dc_descontoExit;

      DBEdit109.Enabled := False;
      DBEdit111.OnExit := ed_nf_dc_descontoExit;
      Label149.Caption := 'Soma Descontos R$';
      Label156.Caption := 'Soma Acréscimos R$';
      Label164.Caption := 'Desc. Produtos($):';
      DBEdit112.DataField := 'NF_DC_DESCONTO';
      DBEdit112.OnExit := ed_nf_dc_descontoExit;
    end
    else if (vDadosIni.vUsarPlano = 'S') or (vDadosIni.vUsarPlano = '2') then
      DBEdit22.Enabled := False
    else
      DBEdit22.Enabled := True;

    //DBEdit23.Enabled  := DBEdit22.Enabled;
    DBEdit110.Enabled := DBEdit22.Enabled;
    //DBEdit112.Enabled := DBEdit22.Enabled;

    DBLookupComboBox13.OnKeyDown := nil;
    DBLookupComboBox14.OnKeyDown := nil;

    CadPedVenda.onCalcValoresNF := faturamento_calc_valores_nota;
  finally
  	if Assigned(ConfigPoliticaPag) then
      FreeAndNil(ConfigPoliticaPag);
  end;
end;

procedure TFrmCadPedVenda.habilitaControles;
begin
  if CadPedVenda.getTipoVenda = 'REQ' then
    habilitaCamposRequisicao
  else if CadPedVenda.getTipoVenda = 'OS' then
    habilitaCamposOrdemDeServico
  else if CadPedVenda.getTipoVenda = 'ORC' then
    habilitaCamposOrcamento;
  montarComponentes;
  CheckBox4.Enabled := (CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'ORC');
  CheckBox4.Visible := CheckBox4.Enabled;
end;

procedure TFrmCadPedVenda.habilitaControlesParaEdicao;
var
  vPointer: Pointer;
  vNPed: Integer;
  ConfigPoliticaPag: TConfig_sistema_class;
  vUsarControlesVenda: string;
  I: Integer;
begin
  try
    vDadosIni.abreStatusProcessamento('Status de Processamento', 'Aguarde um pouco...');

    ConfigPoliticaPag := TConfig_sistema_class.getConf('ped_vnd_definir_politica_pagamento', CadPedVenda.buscas, vDadosIni.cod_empresa);
		vUsarControlesVenda := UpperCase(ConfigPoliticaPag.ReadString('CONTROLE', 'Usar'));

    GroupBox_5.Parent := GroupBox17;
    DBGrid5.Parent    := GroupBox17;

    GroupBox_3.Parent := pn_grid_os;
    DBGrid3.Parent    := pn_grid_os;

    DBGrid3.Enabled := True;
	  DBGrid5.Enabled := True;

    DBComboBox1.Enabled := True;
    habilitarSelecaoVariosItens;
    temp := '';

    vNPed := CadPedVenda.dataSet.FieldByName('nped').AsInteger;
    vPointer := CadPedVenda.dataSet.GetBookmark;
    CadPedVenda.dataSet.Refresh;
    try
      CadPedVenda.dataSet.GotoBookmark(vPointer);
    except
      if vNPed <> CadPedVenda.dataSet.FieldByName('nped').AsInteger then
        CadPedVenda.dataSet.Locate('NPED', vNPed, []);
      if vNPed <> CadPedVenda.dataSet.FieldByName('nped').AsInteger then
      begin
        CadPedVenda.dataSet.Close;
        CadPedVenda.dataSet.Open;
        Application.MessageBox('Por favor repita o processo!', 'Atenção', 0 + 64);
      end;
    end;

    SpeedButton65.Visible := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
  	SpeedButton67.Visible := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
		SpeedButton68.Visible := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    Label262.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
  	DBEdit128.Visible     := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    Label231.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
  	DBEdit13.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    Label266.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
  	DBEdit152.Visible     := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    Label264.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
  	DBEdit150.Visible     := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    Label265.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
  	DBEdit151.Visible     := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    Label174.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    DBEdit75.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    Label267.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    DBEdit153.Visible     := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));

    Label63.Visible := (CadPedVenda.getTipoVenda = 'OS') and (not CadPedVenda.dataSet.FieldByName('data_fech').IsNull);
    DBEdit158.Visible := (CadPedVenda.getTipoVenda = 'OS') and (not CadPedVenda.dataSet.FieldByName('data_fech').IsNull);

    if (CadPedVenda.getTipoVenda = 'REQ') or ((CadPedVenda.getTipoVenda = 'ORC') and CadPedVenda.OrcamentoSoPecas) then
    begin
    	if not CheckBox4.Checked then
    		setCliente2   // DBGrid Req/ORC - Prod Normal
      else
      	setCliente12; // DBGrid Req/ORC - Prod Rapida
      carregarDBGrids;

      CadPedVenda.AfterEdit := AfterEditPedido;
      if not CadPedVenda.editarVenda(CheckBox4.Checked) then
      begin
        CadPedVenda.AfterEdit := nil;
        PageControl1.ActivePage := TabSheet2;
        exit;
      end;
      CadPedVenda.calculaDescontoAcrescimo;
      habilitaCamposRequisicao;
      montarComponentes;
      ckAlterarParticipanteVenda.Caption := 'Alterar ' + LowerCase(trim(vDadosIni.vPedVnd.descricaoParticipante)) + ' em venda';
      ckAlterarParticipanteVenda.Hint := ckAlterarParticipanteVenda.Caption;

      if vDadosIni.vPedVnd.habPartipante then
      begin
      	Label8.Caption := trim(vDadosIni.vPedVnd.descricaoParticipante) + ':';
        DBComboBox2.Visible := False;
        DBEdit126.Hint := 'Codigo do ' + trim(vDadosIni.vPedVnd.descricaoParticipante);
        DBEdit126.Visible := True;
        DBLookupComboBox37.Hint := trim(vDadosIni.vPedVnd.descricaoParticipante) + ' selecionado';
        DBLookupComboBox37.Visible := True;
      end
      else
      begin
      	Label8.Caption := 'Origem:';
        DBComboBox2.Visible := True;
        DBEdit126.Visible := False;
        DBLookupComboBox37.Visible := False;
      end;
      if CheckBox4.Checked then
      begin
        pgVendaRapida.ActivePage := tsItens;
        PageControl1.ActivePage := TabSheet21;
        voltaFormularioVendaRapidaParaInsercao;
        if (Self.Enabled) and (Self.Visible) and (edCodBarra. CanFocus) then
          edCodBarra.SetFocus;
        edCodBarra.Text := '';
        eVlUnit.Valor := 0;
        eSubTotal.Valor := 0;
        eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;

        if CadPedVenda.getTipoVenda = 'REQ' then
        begin
          statusBar('[Venda Rápida de Produtos]', edCodBarra.Hint);
          panel30.Caption := '(F11) Confirmar Venda';
          panel32.Caption := '(F7) Cancelar Venda';
          panel33.Caption := '(F9) Sair Venda Rápida';
          BitBtn83.Caption := '(F11) Confirmar Venda';
          label153.Visible := false;
          DBText10.Visible := false;

          Label195.Visible := vUsarControlesVenda = 'S';
          DBEdit107.Visible := vUsarControlesVenda = 'S';
          DBLookupComboBox34.Visible := vUsarControlesVenda = 'S';
        end
        else
        begin
          statusBar('[Orçamento Rápido de Produtos]', edCodBarra.Hint);
          panel30.Caption := '(F11) Confirmar Orçamento';
          panel32.Caption := '(F7) Cancelar Orçamento';
          panel33.Caption := '(F9) Sair Orçamento Rápido';
          BitBtn83.Caption := '(F11) Conf. Orçamento';
          label153.Visible := true;
          DBText10.Visible := true;
        end;
        panel38.Caption := vDadosIni.IfThen(CadPedVenda.getTipoVenda = 'REQ', 'Venda Rápida', 'Orçamento Rápido') +
          vDadosIni.IfThen(CadPedVenda.dataSet.FieldByName('nped').AsInteger > 0, ' ' +CadPedVenda.dataSet.FieldByName('nped').AsString, '') +
          vDadosIni.IfThen(Trim(CadPedVenda.dataSet.FieldByName('status_ped').AsString) <> '', ' ' +CadPedVenda.dataSet.FieldByName('status_ped').AsString, '');

        //nao permitir incluir mais itens quando o pedido já esta cancelado
        if (Trim(CadPedVenda.dataSet.FieldByName('status_ped').AsString) = 'CANCELADO') then
          CadPedVenda.dataSet.Cancel;
      end
      else
      begin
        CheckBox4.Checked := false;
        PageControl1.ActivePage := TabSheet1;
        PageControl3.ActivePage := TabSheet3;
        CadPedVenda.calculaTotais;
        Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);

        if vDadosIni.vEmp.vVnd_AprovacaoGerente = 'S' then
          if CadPedVenda.getTipoVenda = 'REQ' then
            DBComboBox1.Enabled := CadPedVenda.dataSet.FieldByName('APROVADA_GERENTE').AsString <> 'S';

        if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
          DBComboBox1.SetFocus
        else if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
          DBEdit4.SetFocus;
        BitBtn4.Enabled := (not CadPedVenda.vendaFechada) and (not (CadPedVenda.dataSet.FieldByName('status_ped').AsString = 'CANCELADO'));
        SpeedButton66.Enabled := (CadPedVenda.vendaFechada);
        SpeedButtonWhatsApp.Visible := vDadosIni.WhatsAppHabilitado(CadPedVenda.buscas);
        SpeedButtonWhatsApp2.Visible := SpeedButtonWhatsApp.Visible;

        if CadPedVenda.getTipoVenda = 'REQ' then
        begin
          GroupBox6.Caption := 'Venda de Produtos';
          GroupBox4.Caption := 'Itens da Venda';
          Label9.Caption := 'Nº Venda:';

          Label6.Visible := vUsarControlesVenda = 'S';
          DBEdit106.Visible := vUsarControlesVenda = 'S';
          DBLookupComboBox33.Visible := vUsarControlesVenda = 'S';
          GroupBox70.Visible := false;
          GroupBox71.Visible := false;
        end
        else
        begin
          GroupBox6.Caption := 'Orçamento de Produtos';
          GroupBox4.Caption := 'Itens do Orçamento';
          Label9.Caption := ' Nº Orçam.:';
          Label6.Visible := False;
          DBEdit106.Visible := False;
          DBLookupComboBox33.Visible := False;
          GroupBox70.Visible := false;
          GroupBox71.Visible := false;
        end;
      end;
      CadPedVenda.verificatipovenda(1, DBComboBox1, 'REQ', '');
      CadPedVenda.verificatipovenda(1, DBComboBox4, 'REQ', '');
    end
    else if CadPedVenda.getTipoVenda = 'OS' then
    begin
    	setCliente3; // DBGrid OS/ORC - Prod
      setCliente5; // DBGrid OS/ORC - Serv
      setCliente6; // DBGrid OS/ORC - Serv Terc
      setCliente7; // DBGrid OS/ORC - Prod Terc
      carregarDBGrids;

      CadPedVenda.AfterEdit := AfterEditPedido;
      if not CadPedVenda.Edit then
      begin
        CadPedVenda.AfterEdit := nil;
        PageControl1.ActivePage := TabSheet2;
        exit;
      end;
      habilitaCamposOrdemDeServico;
      montarComponentes;
      PageControl1.ActivePage := TabSheet1;
      PageControl3.ActivePage := tsOrdemServ;
      tsOrdemServ.Tag := 0;
      Label63.Visible := CadPedVenda.dataSet.FieldByName('data_fech').AsString <> '';
      if ((vDadosIni.vEmp.vUsarAparelho <> 'S') and (trim(CadPedVenda.dataSet.FieldByName('PLACA').AsString) <> '')) then
        CadPedVenda.buscaVeiculo(CadPedVenda.dataSet.FieldByName('PLACA').AsString, 1, Memo1);
      CadPedVenda.calculaTotais;
      pgOS.ActivePage := tsOS;
      if (Self.Enabled) and (Self.Visible) and (DBEdit77.CanFocus) then
      	DBEdit77.SetFocus;
      BitBtn4.Enabled := (not CadPedVenda.vendaFechada) and (not (CadPedVenda.dataSet.FieldByName('status_ped').AsString = 'CANCELADO'));
      SpeedButton66.Enabled := (CadPedVenda.vendaFechada);
      SpeedButtonWhatsApp.Visible := vDadosIni.WhatsAppHabilitado(CadPedVenda.buscas);
      SpeedButtonWhatsApp2.Visible := SpeedButtonWhatsApp.Visible;
      CadPedVenda.verificatipovenda(1, DBComboBox3, 'OS', '');
      GroupBox70.Visible := true;
      GroupBox71.Visible := true;
    end
    else if CadPedVenda.getTipoVenda = 'ORC' then
    begin
    	setCliente3; // DBGrid OS/ORC - Prod
      setCliente5; // DBGrid OS/ORC - Serv
      setCliente6; // DBGrid OS/ORC - Serv Terc
      setCliente7; // DBGrid OS/ORC - Prod Terc
      carregarDBGrids;

      if not CadPedVenda.Edit then
      begin
        PageControl1.ActivePage := TabSheet2;
        exit;
      end;
      habilitaCamposOrcamento;
      montarComponentes;
      PageControl1.ActivePage := TabSheet1;
      PageControl3.ActivePage := tsOrdemServ;
      tsOrdemServ.Tag := 0;
      CadPedVenda.calculaTotais;
      pgOS.ActivePage := tsOS;
      if (Self.Enabled) and (Self.Visible) and (DBEdit77.CanFocus) then
	      DBEdit77.SetFocus;
      BitBtn4.Enabled := not (CadPedVenda.dataSet.FieldByName('status_ped').AsString = 'CANCELADO');
      SpeedButton66.Enabled := (CadPedVenda.vendaFechada);
      SpeedButtonWhatsApp.Visible := vDadosIni.WhatsAppHabilitado(CadPedVenda.buscas);
      SpeedButtonWhatsApp2.Visible := SpeedButtonWhatsApp.Visible;
      CadPedVenda.verificatipovenda(1, DBComboBox9, 'ORC', '');
      CadPedVenda.verificatipovenda(1, DBComboBox8, 'ORC', '');
      CadPedVenda.verificatipovenda(1, DBComboBox5, 'ORC', '');
      GroupBox70.Visible := false;
      GroupBox71.Visible := false;
    end;
    CadPedVenda.verificarSalvamentoAutomatico;
    Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
//    Label61.Caption := Format('%m', [CadPedVenda.getValorServicoTerceiro]);
//    Label82.Caption := Format('%m', [CadPedVenda.getValorProdutoTerceiro]);
    habilitarSelecaoVariosItens;
  finally
    if Assigned(ConfigPoliticaPag) then
      FreeAndNil(ConfigPoliticaPag);
      
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadPedVenda.habilitaControlesParaInsercao;
var
	I: Integer;
  ConfigPoliticaPag: TConfig_sistema_class;
  vUsarControlesVenda: string;
begin
  try
    vDadosIni.abreStatusProcessamento('Status de Processamento', 'Aguarde um pouco...');

    ConfigPoliticaPag := TConfig_sistema_class.getConf('ped_vnd_definir_politica_pagamento', CadPedVenda.buscas, vDadosIni.cod_empresa);
    vUsarControlesVenda := UpperCase(ConfigPoliticaPag.ReadString('CONTROLE', 'Usar'));

    GroupBox_5.Parent := GroupBox17;
    DBGrid5.Parent    := GroupBox17;

    GroupBox_3.Parent := pn_grid_os;
    DBGrid3.Parent    := pn_grid_os;

    DBGrid3.Enabled := True;
    DBGrid5.Enabled := True;

    BitBtn4.Enabled := true;
    SpeedButton66.Enabled := false;
    SpeedButtonWhatsApp.Visible := vDadosIni.WhatsAppHabilitado(CadPedVenda.buscas);
    SpeedButtonWhatsApp2.Visible := SpeedButtonWhatsApp.Visible;
    DBComboBox1.Enabled := True;
    habilitarSelecaoVariosItens;
    DevItensHidePanels;
    temp := '';

    if (vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D') and (vDadosIni.vEmp.vOC_TipoControleOrdemC = 'REQ') and (CadPedVenda.getTipoVenda = 'REQ') then
    begin
      Label170.Visible := True;
      DBEdit103.Visible := True;
//      DBLookupComboBox16.Width := 161;
    end
    else
    begin
      Label170.Visible := False;
      DBEdit103.Visible := False;
//      DBLookupComboBox16.Width := 261;
    end;

    SpeedButton65.Visible := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
  	SpeedButton67.Visible := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
		SpeedButton68.Visible := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    Label262.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
  	DBEdit128.Visible     := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    Label231.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
  	DBEdit13.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    Label266.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
  	DBEdit152.Visible     := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    Label264.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
  	DBEdit150.Visible     := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    Label265.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
  	DBEdit151.Visible     := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    Label174.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    DBEdit75.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    Label267.Visible      := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));
    DBEdit153.Visible     := (vDadosIni.vPedVnd.AcrescCondPagComissaoVend)
    	and ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS') or (CadPedVenda.getTipoVenda = 'ORC'));

  	Label63.Visible := (CadPedVenda.getTipoVenda = 'OS') and (not CadPedVenda.dataSet.FieldByName('data_fech').IsNull);
    DBEdit158.Visible := (CadPedVenda.getTipoVenda = 'OS') and (not CadPedVenda.dataSet.FieldByName('data_fech').IsNull);

    if (CadPedVenda.getTipoVenda = 'REQ') or ((CadPedVenda.getTipoVenda = 'ORC') and CadPedVenda.OrcamentoSoPecas) then
    begin
      if not CheckBox4.Checked then
    		setCliente2   // DBGrid Req/ORC - Prod Normal
      else
      	setCliente12; // DBGrid Req/ORC - Prod Rapida
      carregarDBGrids;

      CadPedVenda.vItProd.abrePedVendaProd(0);
      if CadPedVenda.inserirVenda(CheckBox4.Checked) then
      begin
        habilitaCamposRequisicao;
        montarComponentes;

	      if vDadosIni.vPedVnd.habPartipante then
        begin
        	Label8.Caption := trim(vDadosIni.vPedVnd.descricaoParticipante) + ':';
          DBComboBox2.Visible := False;
          DBEdit126.Hint := 'Codigo do ' + trim(vDadosIni.vPedVnd.descricaoParticipante);
          DBEdit126.Visible := True;
	        DBLookupComboBox37.Hint := trim(vDadosIni.vPedVnd.descricaoParticipante) + ' selecionado';
          DBLookupComboBox37.Visible := True;
        end
        else
        begin
          Label8.Caption := 'Origem:';
          DBComboBox2.Visible := True;
          DBEdit126.Visible := False;
          DBLookupComboBox37.Visible := False;
        end;

        if CheckBox4.Checked then
        begin
          pgVendaRapida.ActivePage := tsItens;
          PageControl1.ActivePage := TabSheet21;
          voltaFormularioVendaRapidaParaInsercao;
          if (Self.Enabled) and (Self.Visible) and (edCodBarra. CanFocus) then
	          edCodBarra.SetFocus;
          edCodBarra.Text := '';
          eVlUnit.Valor := 0;
          eSubTotal.Valor := 0;
          if CadPedVenda.getTipoVenda = 'REQ' then
          begin
            statusBar('[Venda Rápida de Produtos]', edCodBarra.Hint);
            panel30.Caption := '(F11) Confirmar Venda';
            panel32.Caption := '(F7) Cancelar Venda';
            panel33.Caption := '(F9) Sair Venda Rápida';
            BitBtn83.Caption := '(F11) Confirmar Venda';
            label153.Visible := false;
            DBText10.Visible := false;
            GroupBox70.Visible := false;
            GroupBox71.Visible := false;

            Label195.Visible := vUsarControlesVenda = 'S';
            DBEdit107.Visible := vUsarControlesVenda = 'S';
            DBLookupComboBox34.Visible := vUsarControlesVenda = 'S';
          end
          else
          begin
            statusBar('[Orçamento Rápido de Produtos]', edCodBarra.Hint);
            panel30.Caption := '(F11) Confirmar Orçamento';
            panel32.Caption := '(F7) Cancelar Orçamento';
            panel33.Caption := '(F9) Sair Orçamento Rápido';
            BitBtn83.Caption := '(F11) Conf. Orçamento';
            label153.Visible := true;
            DBText10.Visible := true;
            GroupBox70.Visible := false;
            GroupBox71.Visible := false;
          end;
          if Self.Tag = 999 then
            if FileExists(ExtractFilePath(Application.ExeName) + 'logo.jpg') then
            begin
              imgLogo.Proportional := false;

              try
           	  	imgLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo.jpg');
              except
              end;

            end;
          panel38.Caption := vDadosIni.IfThen(CadPedVenda.getTipoVenda = 'REQ', 'Venda Rápida', 'Orçamento Rápido') +
            vDadosIni.IfThen(CadPedVenda.dataSet.FieldByName('nped').AsInteger > 0, ' ' +CadPedVenda.dataSet.FieldByName('nped').AsString, '') +
            vDadosIni.IfThen(Trim(CadPedVenda.dataSet.FieldByName('status_ped').AsString) <> '', ' ' +CadPedVenda.dataSet.FieldByName('status_ped').AsString, '');
        end
        else
        begin
          PageControl1.ActivePage := TabSheet1;
          PageControl3.ActivePage := TabSheet3;
          CadPedVenda.calculaTotais;
          Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
          if (Self.Enabled) and (Self.Visible) and (DBComboBox1.CanFocus) then
            DBComboBox1.SetFocus
          else if (Self.Enabled) and (Self.Visible) and (DBEdit4.CanFocus) then
            DBEdit4.SetFocus;
          if CadPedVenda.getTipoVenda = 'REQ' then
          begin
            GroupBox6.Caption := 'Venda de Produtos';
            GroupBox4.Caption := 'Itens da Venda';
            Label9.Caption := 'Nº Venda:';

            Label6.Visible := vUsarControlesVenda = 'S';// or vDadosIni.vEmp.vUsarPoliticasDesc;
            DBEdit106.Visible := vUsarControlesVenda = 'S';
            DBLookupComboBox33.Visible := vUsarControlesVenda = 'S';// or vDadosIni.vEmp.vUsarPoliticasDesc;
            GroupBox70.Visible := false;
            GroupBox71.Visible := false;
          end
          else
          begin
            GroupBox6.Caption := 'Orçamento de Produtos';
            GroupBox4.Caption := 'Itens do Orçamento';
            Label9.Caption := 'Nº Orçam.:';
            Label6.Visible := False;
            DBEdit106.Visible := False;
            DBLookupComboBox33.Visible := False;
            GroupBox70.Visible := false;
            GroupBox71.Visible := false;
          end;
        end;
      end;
      CadPedVenda.verificatipovenda(1, DBComboBox1, 'REQ', '');
      CadPedVenda.verificatipovenda(1, DBComboBox4, 'REQ', '');
    end
    else if CadPedVenda.getTipoVenda = 'OS' then
    begin
    	setCliente3; // DBGrid OS/ORC - Prod
      setCliente5; // DBGrid OS/ORC - Serv
      setCliente6; // DBGrid OS/ORC - Serv Terc
      setCliente7; // DBGrid OS/ORC - Prod Terc
      carregarDBGrids;

      if CadPedVenda.inserirVenda(CheckBox4.Checked) then
      begin
        if (vDadosIni.vEmp.vAgendaOficina = 'S') then
          if Application.MessageBox('Serviço Agendado?', 'Confirmação', MB_YESNO) = ID_YES then
            CadPedVenda._abreFormDisponibilidadeMecanico;

        CadPedVenda.vItProd.vListarImprimirItemVan := CadPedVenda.retornaVendaTipoVan;
        CadPedVenda.vItProd.abrePedVendaProd(CadPedVenda.dataSet.FieldByName('NPED').AsInteger);
        habilitaCamposOrdemDeServico;
        montarComponentes;
        PageControl1.ActivePage := TabSheet1;
        PageControl3.ActivePage := tsOrdemServ;
        tsOrdemServ.Tag := 0;
        Label63.Visible := CadPedVenda.dataSet.FieldByName('data_fech').AsString <> '';
        CadPedVenda.calculaTotais;
        if (Self.Enabled) and (Self.Visible) and (DBEdit77.CanFocus) then
	        DBEdit77.SetFocus;
        CadPedVenda.verificatipovenda(1, DBComboBox3, 'OS', '');
        Memo1.Clear;
        Memo2.Clear;
        Memo3.Clear;
        GroupBox70.Visible := true;
        GroupBox71.Visible := true;
        tsOS.Show;
      end;
    end
    else if CadPedVenda.getTipoVenda = 'ORC' then
    begin
    	setCliente3; // DBGrid OS/ORC - Prod
      setCliente5; // DBGrid OS/ORC - Serv
      setCliente6; // DBGrid OS/ORC - Serv Terc
      setCliente7; // DBGrid OS/ORC - Prod Terc
      carregarDBGrids;

  //    if not vDadosIni.PesqPros('VND003', 'INSERINDO NOVO REGISTRO', '', 'PEDVENDA', '', CadPedVenda.buscas, true) then
  //      Exit;
      if CadPedVenda.inserirVenda(CheckBox4.Checked) then
      begin
        habilitaCamposOrcamento;
        montarComponentes;
        CadPedVenda.vItProd.vListarImprimirItemVan := CadPedVenda.retornaVendaTipoVan;
        CadPedVenda.vItProd.abrePedVendaProd(CadPedVenda.dataSet.FieldByName('NPED').AsInteger);
        PageControl1.ActivePage := TabSheet1;
        PageControl3.ActivePage := tsOrdemServ;
        tsOrdemServ.Tag := 0;
        CadPedVenda.calculaTotais;
        if (Self.Enabled) and (Self.Visible) and (DBEdit77.CanFocus) then
	        DBEdit77.SetFocus;
        CadPedVenda.verificatipovenda(1, DBComboBox9, 'ORC', '');
        CadPedVenda.verificatipovenda(1, DBComboBox8, 'ORC', '');
        CadPedVenda.verificatipovenda(1, DBComboBox5, 'ORC', '');
        GroupBox70.Visible := false;
        GroupBox71.Visible := false;
        tsOS.Show;
      end;
    end;

    habilitarSelecaoVariosItens;
  finally
  	if Assigned(ConfigPoliticaPag) then
      FreeAndNil(ConfigPoliticaPag);

    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmCadPedVenda.habilitarSelecaoVariosItens;
var
	I: Integer;
begin
  CadPedVenda.habilitarCancelarVariosItensOSorc(CheckBox9.Checked);
  Label218.Visible := CadPedVenda.CancelarVariosItens;
  Label219.Visible := CadPedVenda.CancelarVariosItens;
  Label222.Visible := CadPedVenda.CancelarVariosItens;
  Label223.Visible := CadPedVenda.CancelarVariosItens;
  Label220.Visible := CadPedVenda.CancelarVariosItens;
  Label221.Visible := CadPedVenda.CancelarVariosItens;
  Label224.Visible := CadPedVenda.CancelarVariosItens;
  Label225.Visible := CadPedVenda.CancelarVariosItens;
  Label226.Visible := CadPedVenda.CancelarVariosItens;
  Label227.Visible := CadPedVenda.CancelarVariosItens;

  for I := 0 to DBGrid2.Columns.Count - 1 do
    if trim(DBGrid2.Columns[I].FieldName) = 'SEL' then
    begin
       DBGrid2.Columns[I].Visible := CadPedVenda.CancelarVariosItens;
       Break;
    end;

  for I := 0 to DBGrid3.Columns.Count - 1 do
    if trim(DBGrid3.Columns[I].FieldName) = 'SEL' then
    begin
       DBGrid3.Columns[I].Visible := CadPedVenda.CancelarVariosItens;
       Break;
    end;

  for I := 0 to DBGrid5.Columns.Count - 1 do
    if trim(DBGrid5.Columns[I].FieldName) = 'SEL' then
    begin
       DBGrid5.Columns[I].Visible := CadPedVenda.CancelarVariosItens;
       Break;
    end;

  for I := 0 to DBGrid6.Columns.Count - 1 do
    if trim(DBGrid6.Columns[I].FieldName) = 'SEL' then
    begin
       DBGrid6.Columns[I].Visible := CadPedVenda.CancelarVariosItens;
       Break;
    end;

  for I := 0 to DBGrid7.Columns.Count - 1 do
    if trim(DBGrid7.Columns[I].FieldName) = 'SEL' then
    begin
       DBGrid7.Columns[I].Visible := CadPedVenda.CancelarVariosItens;
       Break;
    end;

  for I := 0 to DBGrid12.Columns.Count - 1 do
    if trim(DBGrid12.Columns[I].FieldName) = 'SEL' then
    begin
       DBGrid12.Columns[I].Visible := CadPedVenda.CancelarVariosItens;
       Break;
    end;
    
end;

procedure TFrmCadPedVenda.lbListActionsDblClick(Sender: TObject);
begin
  inherited;
  TForm(pn_vnd_rap_mais.Parent).ModalResult := mrOk;
end;

procedure TFrmCadPedVenda.lbListActionsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    TForm(pn_vnd_rap_mais.Parent).ModalResult := mrOk;
end;

procedure TFrmCadPedVenda.leConfiguracoesFormRegistro;
var
	I: Integer;
begin
	if (TelaCadastro <= 0) then
  begin
  	CheckBox1.Checked := _LerConfiguracoesRegistroBoolean(CheckBox1.Name + CadPedVenda.getTipoVenda);
    CheckBox3.Checked := _LerConfiguracoesRegistroBoolean(CheckBox3.Name + CadPedVenda.getTipoVenda);
    SalvarValoresConsultaAvancada.Checked  := _LerConfiguracoesRegistroBoolean(SalvarValoresConsultaAvancada.Name + CadPedVenda.getTipoVenda);
    SalvarValoresConsultaAdicional.Checked := _LerConfiguracoesRegistroBoolean(SalvarValoresConsultaAdicional.Name + CadPedVenda.getTipoVenda);
  end;

  if (TelaCadastro <= 0) and (CheckBox3.Checked) then
  begin
    RadioGroup1.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup1.Name + CadPedVenda.getTipoVenda);
    RadioGroup2.ItemIndex := _LerConfiguracoesRegistroInteger(RadioGroup2.Name + CadPedVenda.getTipoVenda);
  end;

	if (TelaCadastro <= 0) and (CheckBox1.Checked) then
  begin
 	  CheckBox1Click(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox11.Name + CadPedVenda.getTipoVenda)) <> '' then
    	ComboBox11.Text   := _LerConfiguracoesRegistroString(ComboBox11.Name + CadPedVenda.getTipoVenda);
    for I := 0 to ComboBox11.Items.Count - 1 do
    begin
 			if trim(ComboBox11.Items[I]) = trim(ComboBox11.Text) then
      begin
      	ComboBox11.ItemIndex := I;
        Break;
      end;
    end;

    ComboBox11Exit(Self);
    if Trim(_LerConfiguracoesRegistroString(ComboBox12.Name   + CadPedVenda.getTipoVenda)) <> '' then
    	ComboBox12.Text       := _LerConfiguracoesRegistroString(ComboBox12.Name   + CadPedVenda.getTipoVenda);

    if Trim(_LerConfiguracoesRegistroString(MaskEdit8.Name    + CadPedVenda.getTipoVenda)) <> '' then
    	MaskEdit8.Text        := _LerConfiguracoesRegistroString(MaskEdit8.Name    + CadPedVenda.getTipoVenda);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit10.Name   + CadPedVenda.getTipoVenda)) <> '' then
    	MaskEdit10.Text       := _LerConfiguracoesRegistroString(MaskEdit10.Name   + CadPedVenda.getTipoVenda);
    if Trim(_LerConfiguracoesRegistroString(MaskEdit9.Name    + CadPedVenda.getTipoVenda)) <> '' then
    	MaskEdit9.Text        := _LerConfiguracoesRegistroString(MaskEdit9.Name    + CadPedVenda.getTipoVenda);
  end;
end;

procedure TFrmCadPedVenda.limparCamposCab(Sender: TObject);
begin
	ckAlterarClienteVenda.Checked := False;
  ckAlterarClienteVendaClick(Sender);
  ckAlterarVendedorVenda.Checked := False;
  ckAlterarVendedorVendaClick(Sender);
  ckAlterarFormaPagamentoVenda.Checked := False;
  ckAlterarFormaPagamentoVendaClick(Sender);
  ckAlterarParticipanteVenda.Checked := False;
  ckAlterarParticipanteVendaClick(Sender);

  ckAlterarClienteVendaFpCreditos.Checked := False;
  ckAlterarClienteVendaFpCreditosClick(Sender);
  ckAlterarVendedorVendaFpCreditos.Checked := False;
  ckAlterarVendedorVendaFpCreditosClick(Sender);
end;

procedure TFrmCadPedVenda.limparCamposProd(Sender: TObject);
begin
	EditHw5.AsValue := 0;
  DBLookupComboBox45.KeyValue := 0;

  EditHw6.AsValue := 0;
  DBLookupComboBox46.KeyValue := 0;

  ckAlterarMecTecProd.Checked := false;
  ckAlterarMecTecProdClick(Sender);
  ckAlterarVendedorProd.Checked := false;
  ckAlterarVendedorProdClick(Sender);
end;

procedure TFrmCadPedVenda.limparCamposServ(Sender: TObject);
begin
	EditHw2.AsValue := 0;
  DBLookupComboBox43.KeyValue := 0;

  EditHw4.AsValue := 0;
  DBLookupComboBox44.KeyValue := 0;

	ckAlterarMecTecServ.Checked := false;
  ckAlterarMecTecServClick(Sender);
  ckAlterarVendedorServ.Checked := false;
  ckAlterarVendedorServClick(Sender);
end;

procedure TFrmCadPedVenda.Marcartodosservios1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    CadPedVenda.vAgenda.vAgendaItens._marcarTodos;
    DBLookupComboBox32.KeyValue := CadPedVenda.vAgenda.vAgendaItens.fBox.FieldByName('COD_BOX').AsInteger;

  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.MaskEdit13Exit(Sender: TObject);
begin
  inherited;
  if Length(Trim(MaskEdit13.Text)) = 1 then
    MaskEdit13.Text := '0' + Trim(MaskEdit13.Text);
end;

procedure TFrmCadPedVenda.MaskEdit13KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not (key in ['0'..'9', Chr(8)]) then
    key := #0;
end;

procedure TFrmCadPedVenda.MaskEdit6Exit(Sender: TObject);
begin
  inherited;
  if (activecontrol = bitbtn68) or (activecontrol = bitbtn50) then
    Exit;
  if CadPedVenda.vendaFechada then
    exit;
  if MaskEdit6.Text = '' then
  begin
    try
      Screen.Cursor := crHourGlass;
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      MaskEdit6.Text := vDadosIni.vPesquisa;
    finally
      Screen.Cursor := crDefault;
    end;
  end;

  if trim(TDBEdit(Sender).Text) <> '' then
  begin
    if not CadPedVenda.vItProd.buscaProduto(
    	MaskEdit6.Text,
      0,
      '') then
    begin
      if vDadosIni.getCampoPipe(CadPedVenda.vItProd.vNomeCampoErro, 1) = 'ITEMREPETIDO' then
      	verificarItemRepetido(vDadosIni.getCampoPipe(CadPedVenda.vItProd.vNomeCampoErro, 2)) 
      else
      begin
        if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
        	TDBEdit(Sender).SetFocus;
        Exit;
      end;
    end;
  end
  else
  begin
    if (Self.Enabled) and (Self.Visible) and (TDBEdit(Sender).CanFocus) then
	    TDBEdit(Sender).SetFocus;
    Exit;
  end;

  DBEdit117.Enabled := (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'P') and
    (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'T') and
    (CadPedVenda.vItProd.dataSet.FieldByName('tabpraticada').AsString <> 'Q');
    
//  if (DBEdit117.Enabled) and (CadPedVenda.vItProd.dataSet.FieldByName('precoporqtde').AsString = 'S') then
//    DBEdit117.Enabled := vDadosIni.vPedVnd.alterarPrecoProdutosQtde;

  if TDBEdit(Sender) = DBEdit9 then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit10.CanFocus) then
	    DBEdit10.SetFocus;
  end
  else if TDBEdit(Sender) = DBEdit46 then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit47.CanFocus) then
	    DBEdit47.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.MaskEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if CadPedVenda.vendaFechada then
    exit;
  if Key = VK_F3 then
    BitBtn48Click(SENDER);
end;

procedure TFrmCadPedVenda.MensagemVendaRapida(const S: string);
var
	vtemp: string;
begin
  vtemp := StringReplace(S, sLineBreak, ' ', [rfReplaceAll]);
	GroupBox5.Caption  := vtemp;
  GroupBox66.Caption := vtemp;
	ldescricao.Caption := vtemp;

  Panel53.Visible  := False;
  Panel54.Visible  := False;
  Panel55.Visible  := False;
  Panel62.Visible  := False;
  Panel56.Visible  := False;
  Panel118.Visible := False;
  Panel119.Visible := False;

  Panel52.Visible  := False;
  Panel99.Visible  := False;
  Panel105.Visible := False;
  Panel107.Visible := False;
  Panel106.Visible := False;
  Panel120.Visible := False;
  Panel121.Visible := False;

  Timer2.Enabled := True;
end;

procedure TFrmCadPedVenda.montarComponentes;
var
  vLista: TStrings;
  I: Integer;
begin
	try
    vLista := TStringList.Create;
    vLista := vDadosIni.getConfSisBlob('ped_vnd_campos_desabilitados', CadPedVenda.buscas);
    for I := 0 to vLista.Count - 1 do
      if FindComponent(vDadosIni.getValue(vLista[i], 2)) <> nil then
      begin
        TWinControl(FindComponent(vDadosIni.getValue(vLista[i], 2))).Enabled := True;
        if CadPedVenda.dataSet.State = dsInsert then
          if vDadosIni.strIn(LowerCase(vDadosIni.getValue(vLista[i], 3)), ['i', 'insercao', 'inclusao', 'incluir', 'inserir', 'a', 'ambos']) then
            if StrToIntDef(vDadosIni.getValue(vLista[i], 4), 0) >= vDadosIni.vNivel then
              TWinControl(FindComponent(vDadosIni.getValue(vLista[i], 2))).Enabled := False;
        if CadPedVenda.dataSet.State = dsEdit then
          if vDadosIni.strIn(LowerCase(vDadosIni.getValue(vLista[i], 3)), ['e', 'edicao', 'alteracao', 'editar', 'alterar', 'a', 'ambos']) then
            if StrToIntDef(vDadosIni.getValue(vLista[i], 4), 0) >= vDadosIni.vNivel then
              TWinControl(FindComponent(vDadosIni.getValue(vLista[i], 2))).Enabled := False;
      end;
    bt_ultimos_precos.Visible := CadPedVenda.ultimosPrecos.confAtiva;
    bt_ultimos_precos_vnd_os.Visible := bt_ultimos_precos.Visible;
    bt_ultimos_precos_vnd_rap.Visible := bt_ultimos_precos.Visible;
  finally
    if Assigned(vLista) then
    	FreeAndNil(vLista);
  end;
end;

procedure TFrmCadPedVenda.pedvenda_cliente_endadd_scroll;
begin
  group_cliente_enddoc_minuta.Visible := (not CadPedVenda.dataSet.FieldByName('dest_seqid_entrg').IsNull) and
                                         (CadPedVenda.vCliente.endAdic.f_int('dest_seqid') = CadPedVenda.f_int('dest_seqid_entrg'));  
end;

procedure TFrmCadPedVenda.pedvenda_fechamento_after(Sender: TObject);
begin
//  if PageControl1.ActivePage = TabSheet21 then //vendarapida
//  begin
//  	if (not ck_venda_rapida_emitirnfe.Visible) or
//       (not ck_venda_rapida_emitirnfe.Checked) or
//       (not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas)) then
//          // Nao fazer nada
//    else
//    	CadPedVenda.emitirNotaDoPedido(false);
//
//    if (not ck_venda_rapida_emitirnfce.Visible) or
//       (not ck_venda_rapida_emitirnfce.Checked) or
//       (not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas)) or
//       (vDadosIni.vNFConsumidor.CodEmissor <= 0) then
//          // Nao fazer nada
//    else
//    	CadPedVenda.enviarVendaParaNFCe;
//  end;
end;

procedure TFrmCadPedVenda.pgOSChange(Sender: TObject);
begin
  inherited;
  if pgOS.Align <> alClient then
  begin
	  pgOS.Align := alClient;

		pgOS.Align := alTop;
	  pgOs.Width := 864;
    FormResize(Sender);
  end;
//  pgOS.Top   := 0;
//  if (pgOS.ActivePage = tsServOS)
//   or (pgOS.ActivePage = tsProdOS)
//   or (pgOS.ActivePage = tsServTercOS)
//   or (pgOS.ActivePage = tsProdTercOS)
//   or (pgOS.ActivePage = tsOutrosOS) then
//    if (CadPedVenda.dataSet.FieldByName('TIPO').AsString <> 'REQ')
//      and (tsServOS.Visible and tsServOS.TabVisible) then
//      if not CadPedVenda.ChecaCamposObrigatorios then
//      begin
//        tsOS.Show;
//        setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro);
//        exit;
//      end;
end;

procedure TFrmCadPedVenda.pgOSEnter(Sender: TObject);
begin
  inherited;
  if pgOS.ActivePage = tsOS then
  begin
    if CadPedVenda.vNomeCampoErro = '' then
      if CadPedVenda.getTipoVenda = 'OS' then
      begin
        if (Self.Enabled) and (Self.Visible) and (DBComboBox3.CanFocus) then
	        DBComboBox3.SetFocus;
      end
      else if CadPedVenda.getTipoVenda = 'ORC' then
      begin
        if (Self.Enabled) and (Self.Visible) and (DBComboBox5.CanFocus) then
	        DBComboBox5.SetFocus;
      end;
  end
  else if (pgOS.ActivePage = tsServOS) and (CadPedVenda.vItServ.vNomeCampoErro = '') then
  begin
    if (Self.Enabled) and (Self.Visible) and (BitBtn14.CanFocus) then
	    BitBtn14.SetFocus;
  end
  else if (pgOS.ActivePage = tsProdOS) and (CadPedVenda.vItProd.vNomeCampoErro = '') then
  begin
    if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) then
	    BitBtn8.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (BitBtn10.CanFocus) then
	    BitBtn10.SetFocus;
  end
  else if (pgOS.ActivePage = tsProdTercOS) and (CadPedVenda.vItProdTerc.vNomeCampoErro = '') then
  begin
    if (Self.Enabled) and (Self.Visible) and (BitBtn29.CanFocus) then
	    BitBtn29.SetFocus;
  end
  else if (pgOS.ActivePage = tsServTercOS) and (CadPedVenda.vItServTerc.vNomeCampoErro = '') then
  begin
    if (Self.Enabled) and (Self.Visible) and (BitBtn33.CanFocus) then
	    BitBtn33.SetFocus;
  end
  else if pgOS.ActivePage = tsOutrosOS then
  begin
    if (Self.Enabled) and (Self.Visible) and (BitBtn42.CanFocus) then
	    BitBtn42.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.pnAcrescValorOSExit(Sender: TObject);
begin
  inherited;
	DBEdit155.Enabled := True;
  DBEdit156.Enabled := True;
  pnAcrescValorOS.Visible := False;
end;

procedure TFrmCadPedVenda.pnClienteAvulsoEnter(Sender: TObject);
begin
  inherited;
  {Label157.Height  := vDadosIni.IfThen(Label157.Tag  = 0, Label157.Height , Label157.Tag);
  Label158.Height  := vDadosIni.IfThen(Label158.Tag  = 0, Label158.Height , Label158.Tag);
  Label159.Height  := vDadosIni.IfThen(Label159.Tag  = 0, Label159.Height , Label159.Tag);
  Label160.Height  := vDadosIni.IfThen(Label160.Tag  = 0, Label160.Height , Label160.Tag);
  Label161.Height  := vDadosIni.IfThen(Label161.Tag  = 0, Label161.Height , Label161.Tag);
  DBEdit98.Height  := vDadosIni.IfThen(DBEdit98.Tag  = 0, DBEdit98.Height , DBEdit98.Tag);
  DBEdit99.Height  := vDadosIni.IfThen(DBEdit99.Tag  = 0, DBEdit99.Height , DBEdit99.Tag);
  DBEdit100.Height := vDadosIni.IfThen(DBEdit100.Tag = 0, DBEdit100.Height, DBEdit100.Tag);
  DBEdit101.Height := vDadosIni.IfThen(DBEdit101.Tag = 0, DBEdit101.Height, DBEdit101.Tag);
  DBEdit102.Height := vDadosIni.IfThen(DBEdit102.Tag = 0, DBEdit102.Height, DBEdit102.Tag);}
  if CadPedVenda.getTipoVenda = 'ORC' then
  begin
    Label193.Visible    := False;
    DBEdit125.Visible   := False;
    Label161.Visible    := True;
    DBEdit102.Visible   := True;
    {Label188.Visible    := False;
    DBEdit124.Visible   := False;
    Label161.Caption    := 'Telefone';
    Label157.Height     := vDadosIni.IfThen(Label157.Tag  = 0, Label157.Height , Label157.Tag)  + 41;
    Label158.Height     := vDadosIni.IfThen(Label158.Tag  = 0, Label158.Height , Label158.Tag)  + 41;
    Label159.Height     := vDadosIni.IfThen(Label159.Tag  = 0, Label159.Height , Label159.Tag)  + 41;
    Label160.Height     := vDadosIni.IfThen(Label160.Tag  = 0, Label160.Height , Label160.Tag)  + 41;
    Label161.Height     := vDadosIni.IfThen(Label161.Tag  = 0, Label161.Height , Label161.Tag)  + 41;
    DBEdit98.Height     := vDadosIni.IfThen(DBEdit98.Tag  = 0, DBEdit98.Height , DBEdit98.Tag)  + 41;
    DBEdit99.Height     := vDadosIni.IfThen(DBEdit99.Tag  = 0, DBEdit99.Height , DBEdit99.Tag)  + 41;
    DBEdit100.Height    := vDadosIni.IfThen(DBEdit100.Tag = 0, DBEdit100.Height, DBEdit100.Tag) + 41;
    DBEdit101.Height    := vDadosIni.IfThen(DBEdit101.Tag = 0, DBEdit101.Height, DBEdit101.Tag) + 41;
    DBEdit102.Height    := vDadosIni.IfThen(DBEdit102.Tag = 0, DBEdit102.Height, DBEdit102.Tag) + 41; }
    DBEdit98.DataField  := 'END_RECEB';
    DBEdit99.DataField  := 'BAIRRO_RECEB';
    DBEdit100.DataField := 'CIDA_RECEB';
    DBEdit101.DataField := 'CEP_RECEB';
  end
  else
  begin        
    Label193.Visible    := True;
    DBEdit125.Visible   := True;  
    Label161.Visible    := False;
    DBEdit102.Visible   := False;
//    Label188.Visible := True;
//    DBEdit124.Visible := True;
//    Label161.Caption := 'Estado';
    DBEdit98.DataField  := 'END_AVL';
    DBEdit99.DataField  := 'BAIRRO_AVL';
    DBEdit100.DataField := 'CIDA_AVL';
    DBEdit101.DataField := 'CEP_AVL';
  end;
end;

procedure TFrmCadPedVenda.pnDescValorOSExit(Sender: TObject);
begin
  inherited;
  DBEdit29.Enabled := True;
  DBEdit30.Enabled := True;
  pnDescValorOS.Visible := False;
end;

procedure TFrmCadPedVenda.pnEmitirDocEnter(Sender: TObject);
begin
	if (Self.Enabled) and (Self.Visible) and (btEmitirDocCancel.CanFocus) then
    btEmitirDocCancel.SetFocus;
end;

procedure TFrmCadPedVenda.pnImpressaoSeparacaoEnter(Sender: TObject);
begin
  inherited;
  ComboBox5.ItemIndex := _LerConfiguracoesRegistroInteger(ComboBox5.Name);
  ComboBox6.ItemIndex := _LerConfiguracoesRegistroInteger(ComboBox6.Name);
  ComboBox7.ItemIndex := _LerConfiguracoesRegistroInteger(ComboBox7.Name);
end;

procedure TFrmCadPedVenda.pnOpcoesPagamentoEnter(Sender: TObject);
var
	I: Integer;
begin
  inherited;
  for I := 0 to DBGrid25.Columns.Count - 1 do
  begin
    if DBGrid25.Columns[I].FieldName = 'MAX_DESCSERV' then
    begin
      DBGrid25.Columns[I].Visible := trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) <> 'REQ';
      Break;
    end;
  end;
end;

procedure TFrmCadPedVenda.pnSeparacaoEnter(Sender: TObject);
var
  vStatusPed, vStatusSep: string;
begin
  inherited;
  vStatusPed := CadPedVenda.getStatusPedidoESeparacao(CadPedVenda.dataSet.FieldByName('nped').AsInteger);
  vStatusSep := vDadosIni.getCampoPipe(vStatusPed, 2);
  vStatusPed := vDadosIni.getCampoPipe(vStatusPed, 1);
  Edit1.Text := vStatusSep;
  if vStatusPed <> '' then
  begin
    BitBtn95.Enabled := True;
    BitBtn96.Enabled := False;
    BitBtn97.Enabled := False;
    BitBtn98.Enabled := False;
  end
  else
  begin
    BitBtn95.Enabled := (vStatusSep <> '') ;
    BitBtn96.Enabled := (vStatusSep = 'SEPARACAO') or (vStatusSep = '') or (vStatusSep = 'DEVOLUCAO CONFERENCIA');
    BitBtn97.Enabled := (vStatusSep <> 'CONFERENCIA') and (vStatusSep <> 'CONFERIDO') and (vStatusSep <> '');
    BitBtn98.Enabled := (vStatusSep <> 'CONFERENCIA') and (vStatusSep <> 'CONFERIDO') and (vStatusSep <> 'SEPARADO');
  end;
end;

procedure TFrmCadPedVenda.pn_cliente_destsEnter(Sender: TObject);
begin
  inherited;
  bt_cliente_dests_utilizar_principal.Tag     := 0;
  bt_cliente_dests_utilizar_principal.Enabled := CadPedVenda.dataSet.State in [dsEdit, dsInsert];
  bt_cliente_dests_utilizar_entrega.Enabled   := bt_cliente_dests_utilizar_principal.Enabled;
  grid_cliente_dests.DataSource               := CadPedVenda.vCliente.endAdic._dataSourceOOP;
  pedvenda_cliente_endadd_scroll;
end;

procedure TFrmCadPedVenda.pn_dev_os_itensExit(Sender: TObject);
begin
  inherited;
  pn_dev_os_itens.Visible := False;
end;

procedure TFrmCadPedVenda.pn_fat_lote_selEnter(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  lb_nf_ac_outras.Caption := 'Outras despesas';
  CadPedVenda.dataSet.DisableControls;
  try
    grid_fat_lote_sel.DataSource := nil;
    grid_fat_lote_sel.Columns.Clear;
    with grid_fat_lote_sel.Columns.Add do
    begin
      FieldName     := 'SEL';
      Title.Caption := '..';
    end;
    for I := 0 to Pred(DBGrid1.Columns.Count) do
      if (DBGrid1.Columns[I].Visible) and (DBGrid1.Columns[I].FieldName <> 'SEL') then
        with grid_fat_lote_sel.Columns.Add do
        begin
          FieldName := DBGrid1.Columns[I].FieldName;
          Width     := DBGrid1.Columns[I].Width;
        end;
    grid_fat_lote_sel.DataSource := DBGrid1.DataSource;
  finally
    CadPedVenda.dataSet.EnableControls;
  end;
end;

procedure TFrmCadPedVenda.pn_grid_osExit(Sender: TObject);
begin
  inherited;
  DevItensHidePanels;
end;

procedure TFrmCadPedVenda.PageControl4Enter(Sender: TObject);
begin
  inherited;
  if PageControl4.ActivePage = TabSheet10 then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit32.CanFocus) then
	    DBEdit32.SetFocus;
  end
  else if PageControl4.ActivePage = TabSheet11 then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBEdit41.CanFocus) then
	    DBEdit41.SetFocus;
  end
  else if PageControl4.ActivePage = TabSheet12 then
  begin
    if (Self.Enabled) and (Self.Visible) and (Memo3.CanFocus) then
	    Memo3.SetFocus;
  end
  else if PageControl4.ActivePage = TabSheet6 then
  begin
    if (Self.Enabled) and (Self.Visible) and (DBMemo6.CanFocus) then
    	DBMemo6.SetFocus;
  end;
end;

procedure TFrmCadPedVenda.Panel1Exit(Sender: TObject);
begin
  inherited;
  if BitBtn66.Visible then
  begin
    CadPedVenda.dataSet.FieldByName('sel').Visible := False;
    DBGrid1.SelectedIndex := 0;
    DBGrid1.SelectedIndex := DBGrid1.Columns.Count - 1;
    DBGrid1.SelectedIndex := 0;
    BitBtn66.Visible := False;
    Panel2.Visible := True;
  end;
end;

procedure TFrmCadPedVenda.Panel23Exit(Sender: TObject);
begin
  inherited;
  Panel22.Visible := false;
  Panel23.Visible := false;
end;

procedure TFrmCadPedVenda.processaMensagem(var Msg: TMsg; var handled: boolean);
begin
  if (Msg.message = WM_KeyDown) then
    if (Msg.wParam = VK_RETURN) and (ActiveControl = edCodBarra) and (Screen.ActiveForm = Self) then
    begin
      try
        enter := true;
        edCodBarraExit(edCodBarra);
      finally
        enter := false;
      end;
    end;
  inherited;
end;

procedure TFrmCadPedVenda.qrpFichaOSPreview(Sender: TObject);
begin
  inherited;
  CadPedVenda.set_campos_relFichaOS(lbNped, lbNf, lbCNPJ_Emp, lbDtPED, lbNomeCli,
    lbCPFcli, lbEnderecoCli, lbCidadeUF, lbBairroCli, lbFoneCli, lbFoneTrabCli, lbDtFechOS, lbHoraFechOS,
    lbEquipamento, lbProblema, lbTecnico, lbFoneTecnico, lbNomeEmp, lbFoneEmp, lbEmailEmp);
  vDadosIni.VisualizaRelQrp(Sender, 'Ficha de atendimento da Ordem de Serviço');
end;

procedure TFrmCadPedVenda.qrpOSExternaPreview(Sender: TObject);
begin
  inherited;
  CadPedVenda.set_campos_osexterna;
  vDadosIni.VisualizaRelQrp(Sender, 'OS Externa');
end;

procedure TFrmCadPedVenda.RadioGroup3Click(Sender: TObject);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  i: integer;
begin
	if not Self.Enabled then
    Exit
  else if not Self.Visible then
  	Exit;

  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try

      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName, True);
      // Grava as informações do form
      Registro.WriteString('Campo'+CadPedVenda.getTipoVenda, ComboBox1.Text);
      Registro.WriteString('Condicao'+CadPedVenda.getTipoVenda, ComboBox3.Text);
      Registro.WriteString('DataIni'+CadPedVenda.getTipoVenda, MaskEdit1.Text);
      Registro.WriteString('DataFim'+CadPedVenda.getTipoVenda, MaskEdit2.Text);
      Registro.WriteString('PalavraChave'+CadPedVenda.getTipoVenda, MaskEdit3.Text);
      Registro.WriteBool('MaskEdit1'+CadPedVenda.getTipoVenda,MaskEdit1.Visible);
      Registro.WriteBool('MaskEdit2'+CadPedVenda.getTipoVenda,MaskEdit2.Visible);
      Registro.WriteBool('MaskEdit3'+CadPedVenda.getTipoVenda,MaskEdit3.Visible);
      // Fecha a chave e o objeto
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
  _GravaConfiguracoesBoolean('CheckBox8', CheckBox8.Checked);
  inherited;
  try
  	if RadioGroup3.ItemIndex = 0 then
	    vDadosIni.abreStatusProcessamento('', 'Abrindo Venda Produtos')
    else if RadioGroup3.ItemIndex = 1 then
    	vDadosIni.abreStatusProcessamento('', 'Abrindo Ordem de Serviço')
    else if RadioGroup3.ItemIndex = 2 then
    	vDadosIni.abreStatusProcessamento('', 'Abrindo Orçamento');

    Screen.Cursor := crHourGlass;
    if RadioGroup3.ItemIndex = 0 then
      vDadosIni.vtpVenda := 'REQ'
    else if RadioGroup3.ItemIndex = 1 then
      vDadosIni.vtpVenda := 'OS'
    else if RadioGroup3.ItemIndex = 2 then
      vDadosIni.vtpVenda := 'ORC';
    if not PrimeiraPesquisa then
      salvarGridNoConfigColunas(DBGrid1);
    CadPedVenda.create(TDtmPedVenda(dtm));
    InibirEstatisticas := True;
    if CadPedVenda.getTipoVenda = 'REQ' then
      setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,'REQ')
    else if CadPedVenda.getTipoVenda = 'OS' then
      setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,'OS')
    else if CadPedVenda.getTipoVenda = 'ORC' then
      setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,'ORC')
    else
    	setTClientDataSet(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol);

    vDadosIni.setTClientDataSetCadPadrao(
      vDadosIni.dataSetCol,
      vDadosIni.vNomeUsuario,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet2,
      GridCfg2,
      DBGrid2,
      cdsGrid2,
      cdsColunas2,
      trans,
      ListGridsAndDataSets2,
      ListPositions2,
      nomeDTSEt2,
      PrimeiraPesquisa2,
      vCamposPadraoRegistro2,
      vusuario,
      True);

    vDadosIni.setTClientDataSetCadPadrao(
      vDadosIni.dataSetCol,
      vDadosIni.vNomeUsuario,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet3,
      GridCfg3,
      DBGrid3,
      cdsGrid3,
      cdsColunas3,
      trans,
      ListGridsAndDataSets3,
      ListPositions3,
      nomeDTSEt3,
      PrimeiraPesquisa3,
      vCamposPadraoRegistro3,
      vusuario,
      True);

    vDadosIni.setTClientDataSetCadPadrao(
      vDadosIni.dataSetCol,
      vDadosIni.vNomeUsuario,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet5,
      GridCfg5,
      DBGrid5,
      cdsGrid5,
      cdsColunas5,
      trans,
      ListGridsAndDataSets5,
      ListPositions5,
      nomeDTSEt5,
      PrimeiraPesquisa5,
      vCamposPadraoRegistro5,
      vusuario,
      True);

    vDadosIni.setTClientDataSetCadPadrao(
      vDadosIni.dataSetCol,
      vDadosIni.vNomeUsuario,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet6,
      GridCfg6,
      DBGrid6,
      cdsGrid6,
      cdsColunas6,
      trans,
      ListGridsAndDataSets6,
      ListPositions6,
      nomeDTSEt6,
      PrimeiraPesquisa6,
      vCamposPadraoRegistro6,
      vusuario,
      True);

    vDadosIni.setTClientDataSetCadPadrao(
      vDadosIni.dataSetCol,
      vDadosIni.vNomeUsuario,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet7,
      GridCfg7,
      DBGrid7,
      cdsGrid7,
      cdsColunas7,
      trans,
      ListGridsAndDataSets7,
      ListPositions7,
      nomeDTSEt7,
      PrimeiraPesquisa7,
      vCamposPadraoRegistro7,
      vusuario,
      True);

    vDadosIni.setTClientDataSetCadPadrao(
      vDadosIni.dataSetCol,
      vDadosIni.vNomeUsuario,
      vDadosIni.transacaoCol,
      vAlterarNomeDtSet12,
      GridCfg12,
      DBGrid12,
      cdsGrid12,
      cdsColunas12,
      trans,
      ListGridsAndDataSets12,
      ListPositions12,
      nomeDTSEt12,
      PrimeiraPesquisa12,
      vCamposPadraoRegistro12,
      vusuario,
      True);

    vDadosIni.hw_registra_estatistica(Self.Name + CadPedVenda.getTipoVenda);
    configuraEntrada;
    configuraShow;

    ConfiguraCampoConsulta;

    leConfiguracoesFormRegistro;

    configurarGridPeloConfigColunas(DBGrid1);
    habilitaControles;
    CadPedVenda.abrePedVenda(0);
    for I := 0 to ComboBox1.Items.Count - 1 do
      if ComboBox1.Items[i] = ComboBox1.Text then
      begin
        ComboBox1.ItemIndex := i;
        break;
      end;
//    CheckBox3.Checked := false;
//    CheckBox1.Checked := false;

    ComboBox11.Items := ComboBox1.Items;
    ComboBox11.ItemIndex := 0;

    if (vDadosIni.vEmp.vAlmox = 'S2') then
    begin
       if (CadPedVenda.getTipoVenda = 'ORC') then
      begin
        BitBtn3.Enabled := true;
        BitBtn105.Enabled := true;
        BitBtn8.Enabled := true;
        BitBtn107.Enabled := true;
        BitBtn104.Enabled := true;
        BitBtn16.Enabled := true;
        BitBtn106.Enabled := true;
        CheckBox4.Enabled := true;
      end
      else if (CadPedVenda.getTipoVenda = 'OS') then
      begin
        BitBtn3.Enabled := true;
        BitBtn105.Enabled := false;
        BitBtn8.Enabled := false;
        BitBtn107.Enabled := false;
        BitBtn104.Enabled := false;
        BitBtn16.Enabled := false;
        BitBtn106.Enabled := false;
        CheckBox4.Enabled := false;
      end
      else
      begin
        BitBtn3.Enabled := false;
        BitBtn105.Enabled := false;
        BitBtn8.Enabled := false;
        BitBtn107.Enabled := false;
        BitBtn104.Enabled := false;
        BitBtn16.Enabled := false;
        BitBtn106.Enabled := false;
        CheckBox4.Enabled := false;
      end
    end;
   if ((vDadosIni.vEmp.vAgendaOficina = 'S') and (vDadosIni.vEmp.vAlmox <> 'S2')) then
   begin
        BitBtn3.Enabled := true;
        BitBtn105.Enabled := true;
        BitBtn8.Enabled := true;
        BitBtn107.Enabled := true;
        BitBtn104.Enabled := true;
        BitBtn16.Enabled := true;
        BitBtn106.Enabled := true;
        CheckBox4.Enabled := true;
   end;
  finally
    if Assigned(CadPedVenda) then
      CadPedVenda.conf.exibir_devolucao_runtime := ck_exibir_devolucao.Checked;
    vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.RadioGroup4Click(Sender: TObject);
begin
  inherited;
  if not RadioGroup4.Enabled then
    Exit;
              
  if trim(vDadosIni.apenasLetras(Self.Name)) = 'FrmCadPedVenda' then
  begin
  	try
    	RadioGroup4.Enabled := False;
      if RadioGroup4.ItemIndex = 0 then
        vDadosIni.vtpVenda := 'REQ'
      else if RadioGroup4.ItemIndex = 1 then
        vDadosIni.vtpVenda := 'OS'
      else
        vDadosIni.vtpVenda := 'ORC';
      RadioGroup3.ItemIndex := RadioGroup4.ItemIndex;
      vTipoCriou := vDadosIni.vtpVenda;
    finally
      RadioGroup4.Enabled := True;
    end;
  end
  else
  begin
    try
      if RadioGroup4.ItemIndex = 0 then
        vDadosIni.vtpVenda := 'REQ'
      else if RadioGroup4.ItemIndex = 1 then
        vDadosIni.vtpVenda := 'OS'
      else
        vDadosIni.vtpVenda := 'ORC';
      TPedVenda.cadPedVenda(False);
    finally
      RadioGroup4.Enabled := False;
      if trim(vTipoCriou) = 'REQ' then
        RadioGroup4.ItemIndex := 0
      else if trim(vTipoCriou) = 'OS' then
        RadioGroup4.ItemIndex := 1
      else
        RadioGroup4.ItemIndex := 2;
//      CheckBox3.Checked := False;
//      CheckBox1.Checked := False;
      RadioGroup4.Enabled := True;
    end;
  end;
end;

procedure TFrmCadPedVenda.RadioGroup5Click(Sender: TObject);
begin
  inherited;
	if RadioGroup5.ItemIndex = 0 then
  begin
  	limparCamposCab(Sender);
    TabSheet7.Show;
    TabSheet13.Show;
  end
  else if RadioGroup5.ItemIndex = 1 then
  begin
  	limparCamposServ(Sender);
    TabSheet8.Show;
    TabSheet14.Show;
  end
  else if RadioGroup5.ItemIndex = 2 then
  begin
  	limparCamposProd(Sender);
  	TabSheet9.Show;
    TabSheet15.Show;
  end;
end;

procedure TFrmCadPedVenda.ReajustarLarguradascolunas_12Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid12);
end;

procedure TFrmCadPedVenda.ReajustarLarguradascolunas_2Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid2);
end;

procedure TFrmCadPedVenda.ReajustarLarguradascolunas_3Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid3);
end;

procedure TFrmCadPedVenda.ReajustarLarguradascolunas_5Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid5);
end;

procedure TFrmCadPedVenda.ReajustarLarguradascolunas_6Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid6);
end;

procedure TFrmCadPedVenda.ReajustarLarguradascolunas_7Click(Sender: TObject);
begin
  vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid7);
end;

procedure TFrmCadPedVenda.RemoverliberaodoFinanceiro1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    CadPedVenda.removerStatusLiberacaoFinanceiro;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.RemoverStatusdeFechandodaVenda1Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VND116', 'ALTERAR', 'TIPO:' +
    CadPedVenda.dataSet.FieldByName('TIPO').AsString + ' NUM ' +
    CadPedVenda.dataSet.FieldByName('NPED').AsString, 'PEDVENDA',
    CadPedVenda.dataSet.FieldByName('NPED').AsString, CadPedVenda.buscas, True) then
    Exit;

  CadPedVenda.verificaFechamento(3);

end;

procedure TFrmCadPedVenda.RemoverStatusEditando1Click(Sender: TObject);
begin
  inherited;
  if not CadPedVenda.pedidoEmEdicao(caNenhuma, True) then
  begin
    Application.MessageBox('Registro não esta em edição ou não é de salvamento automático', 'Atenção', 0 + 64);
    Exit;
  end;

  if Application.MessageBox('Deseja mesmo remover o status de Editando?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  if not vDadosIni.PesqPros('VND195', 'ALTERAR', 'TIPO:' +
    CadPedVenda.dataSet.FieldByName('TIPO').AsString + ' NUM ' +
    CadPedVenda.dataSet.FieldByName('NPED').AsString, 'PEDVENDA',
    CadPedVenda.dataSet.FieldByName('NPED').AsString, CadPedVenda.buscas, True) then
    Exit;

  try
    CadPedVenda.EmEdicaoSaveAuto := True;
    CadPedVenda.pedidoEmEdicao(caRemoverEdicao, True, True);
  finally
    CadPedVenda.EmEdicaoSaveAuto := False;
  end;
end;

procedure TFrmCadPedVenda.ResetarConfiguraesdecolunas_12Click(Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid12, GridCfg12, cdsColunas12, cdsGrid12, vusuario,
     vDadosIni.transacaoCol, fReset12, ListGridsAndDataSets12, false, ListPositions12);
end;

procedure TFrmCadPedVenda.ResetarConfiguraesdecolunas_2Click(Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid2, GridCfg2, cdsColunas2, cdsGrid2, vusuario,
     vDadosIni.transacaoCol, fReset2, ListGridsAndDataSets2, false, ListPositions2);
end;

procedure TFrmCadPedVenda.ResetarConfiguraesdecolunas_3Click(Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid3, GridCfg3, cdsColunas3, cdsGrid3, vusuario,
     vDadosIni.transacaoCol, fReset3, ListGridsAndDataSets3, false, ListPositions3);
end;

procedure TFrmCadPedVenda.ResetarConfiguraesdecolunas_5Click(Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid5, GridCfg5, cdsColunas5, cdsGrid5, vusuario,
     vDadosIni.transacaoCol, fReset5, ListGridsAndDataSets5, false, ListPositions5);
end;

procedure TFrmCadPedVenda.ResetarConfiguraesdecolunas_6Click(Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid6, GridCfg6, cdsColunas6, cdsGrid6, vusuario,
     vDadosIni.transacaoCol, fReset6, ListGridsAndDataSets6, false, ListPositions6);
end;

procedure TFrmCadPedVenda.ResetarConfiguraesdecolunas_7Click(Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid7, GridCfg7, cdsColunas7, cdsGrid7, vusuario,
     vDadosIni.transacaoCol, fReset7, ListGridsAndDataSets7, false, ListPositions7);
end;

procedure TFrmCadPedVenda.sbEditarObservacaoClick(Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
    CadPedVenda.editarObservacaoOSFechada;
  finally
  	Screen.Cursor := crDefault;
  end;	
end;

procedure TFrmCadPedVenda.ScrollBox2Enter(Sender: TObject);
begin
  vConfigColuna2 := true;
end;

procedure TFrmCadPedVenda.ScrollBox2Exit(Sender: TObject);
begin
  inherited;
//  CadPedVenda._inicializaCamposConfig;
end;

procedure TFrmCadPedVenda.ScrollBox_12Enter(Sender: TObject);
begin
  vConfigColuna12 := true;
end;

procedure TFrmCadPedVenda.ScrollBox_3Enter(Sender: TObject);
begin
  vConfigColuna3 := true;
end;

procedure TFrmCadPedVenda.ScrollBox_5Enter(Sender: TObject);
begin
  vConfigColuna5 := true;
end;

procedure TFrmCadPedVenda.ScrollBox_6Enter(Sender: TObject);
begin
  vConfigColuna6 := true;
end;

procedure TFrmCadPedVenda.ScrollBox_7Enter(Sender: TObject);
begin
  vConfigColuna7 := true;
end;

procedure TFrmCadPedVenda.SelecionarDAVparaMesclagem1Click(Sender: TObject);
begin
  inherited;

  if not CadPedVenda._permitirAlteracoesComEnvioMobilePendente then
    Exit;

  CadPedVenda.selecionaDAVsParaMesclagem(CadPedVenda.dataSet.FieldByName('nped').AsInteger);
end;

procedure TFrmCadPedVenda.SelecionarORCClick(Sender: TObject);
begin
  inherited;
  CadPedVenda.selecionaOrcParaTransferir(CadPedVenda.dataSet.FieldByName('nped').AsInteger, CadPedVenda.dataSet.FieldByName('NPREVENDA').AsInteger);
end;

procedure TFrmCadPedVenda.setaTelacadastro(valor: Integer);
begin
	if CadPedVenda.dataSet.State = dsBrowse then
  begin
    vDadosIni.vtpVenda := 'OS';
    vDadosIni.vTipoForm := valor;
    TelaCadastro := valor;
  end;
end;

function TFrmCadPedVenda.setaTelacadastroEConfiguraEntrada(valor: integer): boolean;
begin
  if CadPedVenda.dataSet.State = dsBrowse then
  begin
    vDadosIni.vtpVenda := 'OS';
    CadPedVenda.create(TDtmPedVenda(dtm));
    vDadosIni.vTipoForm := valor;
    TelaCadastro := valor;
    configuraEntrada;
    result := true;
  end
  else
  begin
    Application.MessageBox('Não é possível entrar no módulo "Trans/Devolução de Produtos" no momento pois há um pedido de venda sendo alterado em outro módulo aberto.', 'Informação', MB_ICONEXCLAMATION + MB_OK);
    result := false;
  end;
end;
procedure TFrmCadPedVenda.setCliente12;
begin
	// DBGrid REQ/ORC - Prod Rapida
	if setTClientPadrao12 then
    Exit;

	vDadosIni.setTClientDataSetCadPadrao(
    vDadosIni.dataSetCol,
    vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet12,
    GridCfg12,
    DBGrid12,
    cdsGrid12,
    cdsColunas12,
    trans,
    ListGridsAndDataSets12,
    ListPositions12,
    nomeDTSEt12,
    PrimeiraPesquisa12,
    vCamposPadraoRegistro12,
    vusuario,
    True);

  setTClientPadrao12 := True;
end;

procedure TFrmCadPedVenda.setCliente2;
begin
	// DBGrid REQ/ORC - Prod Normal
	if setTClientPadrao2 then
    Exit;

	vDadosIni.setTClientDataSetCadPadrao(
    vDadosIni.dataSetCol,
    vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet2,
    GridCfg2,
    DBGrid2,
    cdsGrid2,
    cdsColunas2,
    trans,
    ListGridsAndDataSets2,
    ListPositions2,
    nomeDTSEt2,
    PrimeiraPesquisa2,
    vCamposPadraoRegistro2,
    vusuario,
    True);

	setTClientPadrao2 := True;
end;

procedure TFrmCadPedVenda.setCliente3;
begin
	// DBGrid OS/ORC - Prod
	if setTClientPadrao3 then
    Exit;

  vDadosIni.setTClientDataSetCadPadrao(
    vDadosIni.dataSetCol,
    vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet3,
    GridCfg3,
    DBGrid3,
    cdsGrid3,
    cdsColunas3,
    trans,
    ListGridsAndDataSets3,
    ListPositions3,
    nomeDTSEt3,
    PrimeiraPesquisa3,
    vCamposPadraoRegistro3,
    vusuario,
    True);

  setTClientPadrao3 := True;
end;

procedure TFrmCadPedVenda.setCliente5;
begin
	// DBGrid OS/ORC - Serv
	if setTClientPadrao5 then
    Exit;

	vDadosIni.setTClientDataSetCadPadrao(
    vDadosIni.dataSetCol,
    vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet5,
    GridCfg5,
    DBGrid5,
    cdsGrid5,
    cdsColunas5,
    trans,
    ListGridsAndDataSets5,
    ListPositions5,
    nomeDTSEt5,
    PrimeiraPesquisa5,
    vCamposPadraoRegistro5,
    vusuario,
    True);

  setTClientPadrao5 := True;
end;

procedure TFrmCadPedVenda.setCliente6;
begin
	// DBGrid OS/ORC - Serv Terc
	if setTClientPadrao6 then
    Exit;

	vDadosIni.setTClientDataSetCadPadrao(
    vDadosIni.dataSetCol,
    vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet6,
    GridCfg6,
    DBGrid6,
    cdsGrid6,
    cdsColunas6,
    trans,
    ListGridsAndDataSets6,
    ListPositions6,
    nomeDTSEt6,
    PrimeiraPesquisa6,
    vCamposPadraoRegistro6,
    vusuario,
    True);

  setTClientPadrao6 := True;
end;

procedure TFrmCadPedVenda.setCliente7;
begin
	// DBGrid OS/ORC - Prod Terc
	if setTClientPadrao7 then
    Exit;

	vDadosIni.setTClientDataSetCadPadrao(
    vDadosIni.dataSetCol,
    vDadosIni.vNomeUsuario,
    vDadosIni.transacaoCol,
    vAlterarNomeDtSet7,
    GridCfg7,
    DBGrid7,
    cdsGrid7,
    cdsColunas7,
    trans,
    ListGridsAndDataSets7,
    ListPositions7,
    nomeDTSEt7,
    PrimeiraPesquisa7,
    vCamposPadraoRegistro7,
    vusuario,
    True);

  setTClientPadrao7 := True;
end;

procedure TFrmCadPedVenda.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas) then
    Exit;

  if not CadPedVenda.enviarBoletoPorEmail then
    exit;  
end;

procedure TFrmCadPedVenda.SpeedButton11Click(Sender: TObject);
var
  i, j: integer;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'I', CadPedVenda.buscas) then
    Exit;
  try

    if not vDadosIni.PesqPros('VND137', 'MESCLAR', '', 'PEDVENDA', '', CadPedVenda.buscas, true) then
      exit;

    Screen.Cursor := crHourGlass;

    CadPedVenda.vItProd.setDescontoValor(0, 0);
    CadPedVenda.vItProd.setDescontoPercenentual(0);
    CadPedVenda.vItProd.setAcrescimoValor(0);
    CadPedVenda.vItProd.setAcrescimoPercenentual(0);

    if not CadPedVenda.AbrirPedVendaATransferirouMesclar then
      exit;
    DBGrid9.DataSource := Cadpedvenda.dsORCTemp;
    Label136.Visible := false;
    MaskEdit11.Visible := false;
    for I := 0 to DBGrid9.FieldCount - 1 do
      if DBGrid9.Columns[i].FieldName <> 'SEL' then
      	DBGrid9.Columns[i].Visible := false
      else
      begin
      	DBGrid9.Columns[i].Title.Caption := 'Sel';
        DBGrid9.Columns[i].Width := 22;
      end;

    for I := 0 to DBGrid1.FieldCount - 1 do
    begin
      for j := 0 to DBGrid9.DataSource.DataSet.FieldCount - 1 do
      	if DBGrid9.Columns[j].FieldName <> 'SEL' then
          if DBGrid9.Columns[j].FieldName = DBGrid1.Columns[i].FieldName then
          begin
            DBGrid9.Columns[j].Title.Caption := DBGrid1.Columns[i].Title.Caption;
            DBGrid9.Columns[j].Visible := DBGrid1.Columns[i].Visible;
            break;
          end;
    end;

    CadPedVenda.vItProd.abrePedVendaProd(0);
    //a partir do terceiro field
    for I := 2 to DBGrid10.FieldCount - 1 do
      DBGrid10.Columns[i].Visible := false;
    for I := 0 to DBGrid10.FieldCount - 1 do
    begin
      for j := 0 to CadPedVenda.vItProd.DataSet.FieldCount - 1 do
        if DBGrid10.Columns[i].FieldName = CadPedVenda.vItProd.DataSet.Fields[j].FieldName then
        begin
          DBGrid10.Columns[i].Title.Caption := CadPedVenda.vItProd.DataSet.Fields[j].DisplayLabel;
          DBGrid10.Columns[i].Visible := true;
          break;
        end;
    end;

    CadPedVenda.vItServ.abrePedVendaServ(0);
    //a partir do segundo field
    for I := 1 to DBGrid11.FieldCount - 1 do
      DBGrid11.Columns[i].Visible := false;
    for I := 0 to DBGrid11.FieldCount - 1 do
    begin
      for j := 0 to CadPedVenda.vItServ.DataSet.FieldCount - 1 do
        if DBGrid11.Columns[i].FieldName = CadPedVenda.vItServ.DataSet.Fields[j].FieldName then
        begin
          DBGrid11.Columns[i].Title.Caption := CadPedVenda.vItServ.DataSet.Fields[j].DisplayLabel;
          DBGrid11.Columns[i].Visible := true;
          break;
        end;
    end;

    CadPedVenda.vItServTerc.abreServicoTerceiro(0);
    //a partir do segundo field
    for I := 1 to DBGrid30.FieldCount - 1 do
      DBGrid30.Columns[i].Visible := false;
    for I := 0 to DBGrid30.FieldCount - 1 do
    begin
      for j := 0 to CadPedVenda.vItServTerc.DataSet.FieldCount - 1 do
        if DBGrid30.Columns[i].FieldName = CadPedVenda.vItServTerc.DataSet.Fields[j].FieldName then
        begin
          DBGrid30.Columns[i].Title.Caption := CadPedVenda.vItServTerc.DataSet.Fields[j].DisplayLabel;
          DBGrid30.Columns[i].Visible := true;
          break;
        end;
    end;

    CadPedVenda.vItProdTerc.abreProdTerceiro(0);
    //a partir do terceiro field
    for I := 2 to DBGrid29.FieldCount - 1 do
      DBGrid29.Columns[i].Visible := false;
    for I := 0 to DBGrid29.FieldCount - 1 do
    begin
      for j := 0 to CadPedVenda.vItProdTerc.DataSet.FieldCount - 1 do
        if DBGrid29.Columns[i].FieldName = CadPedVenda.vItProdTerc.DataSet.Fields[j].FieldName then
        begin
          DBGrid29.Columns[i].Title.Caption := CadPedVenda.vItProdTerc.DataSet.Fields[j].DisplayLabel; 
          DBGrid29.Columns[i].Visible := true;
          break;
        end;
    end;

    CheckBoxProdServEmAbas.Checked := _LerConfiguracoesRegistroBoolean(CheckBoxProdServEmAbas.Name);

    PanelProdutosMesclar.Top := 0;

    PanelServicosMesclar.Visible := (RadioGroup3.ItemIndex = 1) or (RadioGroup3.ItemIndex = 2);
    if PanelServicosMesclar.Visible then
    	PanelServicosMesclar.Top := PanelProdutosMesclar.Top + PanelProdutosMesclar.Height;

    PanelServicosTerceiroMesclar.Visible := (RadioGroup3.ItemIndex = 1) or (RadioGroup3.ItemIndex = 2);
    if PanelServicosTerceiroMesclar.Visible then
    	PanelServicosTerceiroMesclar.Top := PanelServicosMesclar.Top + PanelServicosMesclar.Height;

    if (vDadosIni.vProdTerc = 'S') and (vDadosIni.vTerminalFiscal <> 'S') then
	    PanelProdutosTerceiroMesclar.Visible := (RadioGroup3.ItemIndex = 1) or (RadioGroup3.ItemIndex = 2)
    else
    	PanelProdutosTerceiroMesclar.Visible := False;
    if PanelProdutosTerceiroMesclar.Visible then
    	PanelProdutosTerceiroMesclar.Top := PanelServicosTerceiroMesclar.Top + PanelServicosTerceiroMesclar.Height;

    ScrollBox6.Top := 0;

    if not CheckBoxProdServEmAbas.Checked then
    begin
      tsMesclarProdutos.TabVisible  := False;
      tsMesclarServicos.TabVisible  := False;
      tsMesclarProdutosTerceiro.TabVisible := False;
      tsMesclarServicosTerceiro.TabVisible := False;

      PageControl8.Align := alTop;
      PageControl8.Height := 470;

      GroupBoxProdutosMesclar.Parent := PanelProdutosMesclar;
      Splitter4.Parent  := tsMesclar;

      GroupBoxServicosMesclar.Parent := PanelServicosMesclar;
      Splitter5.Parent  := tsMesclar;

      GroupBoxServicosTerceiroMesclar.Parent := PanelServicosTerceiroMesclar;
      Splitter6.Parent  := tsMesclar;

      GroupBoxProdutosTerceiroMesclar.Parent := PanelProdutosTerceiroMesclar;

      PanelProdutosMesclar.Visible          := True;
      PanelServicosMesclar.Visible          := (CadPedVenda.getTipoVenda <> 'REQ');
      PanelServicosTerceiroMesclar.Visible  := (CadPedVenda.getTipoVenda <> 'REQ');
      PanelProdutosTerceiroMesclar.Visible  := (CadPedVenda.getTipoVenda <> 'REQ') and (vDadosIni.vProdTerc = 'S') and (vDadosIni.vTerminalFiscal <> 'S');

      Splitter4.Visible                     := (CadPedVenda.getTipoVenda <> 'REQ');
      Splitter5.Visible                     := (CadPedVenda.getTipoVenda <> 'REQ');
      Splitter6.Visible                     := (CadPedVenda.getTipoVenda <> 'REQ') and (vDadosIni.vProdTerc = 'S') and (vDadosIni.vTerminalFiscal <> 'S');

      PanelProdutosMesclar.Top              := 0;
      Splitter4.Top                         := PanelProdutosMesclar.Top + PanelProdutosMesclar.Height;

      PanelServicosMesclar.Top						  := Splitter4.Top + Splitter4.Height;
			Splitter5.Top                         := PanelServicosMesclar.Top + PanelServicosMesclar.Height;

      PanelServicosTerceiroMesclar.Top      := Splitter5.Top + Splitter5.Height;
      Splitter6.Top                         := PanelServicosTerceiroMesclar.Top + PanelServicosTerceiroMesclar.Height;

      PanelProdutosTerceiroMesclar.Top      := Splitter6.Top + Splitter6.Height;

      if (CadPedVenda.getTipoVenda = 'REQ') then
      begin
      	PanelProdutosMesclar.Align          := alClient;
        PanelServicosMesclar.Align          := alNone;
        PanelServicosTerceiroMesclar.Align  := alNone;
        PanelProdutosTerceiroMesclar.Align  := alNone;
      end
      else
      begin
        PanelProdutosMesclar.Align          := alTop;
        PanelProdutosMesclar.Height         := 130;

        PanelServicosMesclar.Align          := alTop;
        PanelServicosMesclar.Height         := 120;

        PanelServicosTerceiroMesclar.Align  := alTop;
        PanelServicosTerceiroMesclar.Height := 100;

        PanelProdutosTerceiroMesclar.Align  := alTop;
        PanelProdutosTerceiroMesclar.Height := 100;
      end;

      PageControl8.ActivePage := tsMesclar;
      tsMesclar.Show;
    end
    else
    begin
    	PageControl8.Align := alClient;

      GroupBoxProdutosMesclar.Parent := tsMesclarProdutos;
      Splitter4.Parent  := tsMesclarProdutos;

      GroupBoxServicosMesclar.Parent := tsMesclarServicos;
      Splitter5.Parent  := tsMesclarServicos;

      GroupBoxServicosTerceiroMesclar.Parent := tsMesclarServicosTerceiro;
      Splitter6.Parent  := tsMesclarServicosTerceiro;

      GroupBoxProdutosTerceiroMesclar.Parent := tsMesclarProdutosTerceiro;

      tsMesclarProdutos.TabVisible         := True;
      tsMesclarProdutos.Visible            := True;

      tsMesclarServicos.TabVisible         := (CadPedVenda.getTipoVenda <> 'REQ');
      tsMesclarServicos.Visible            := (CadPedVenda.getTipoVenda <> 'REQ');

      tsMesclarServicosTerceiro.TabVisible := (CadPedVenda.getTipoVenda <> 'REQ');
      tsMesclarServicosTerceiro.Visible    := (CadPedVenda.getTipoVenda <> 'REQ');

      tsMesclarProdutosTerceiro.TabVisible := (CadPedVenda.getTipoVenda <> 'REQ') and (vDadosIni.vProdTerc = 'S') and (vDadosIni.vTerminalFiscal <> 'S');
      tsMesclarProdutosTerceiro.Visible    := (CadPedVenda.getTipoVenda <> 'REQ') and (vDadosIni.vProdTerc = 'S') and (vDadosIni.vTerminalFiscal <> 'S');

      PageControl8.ActivePage := tsMesclarProdutos;
      tsMesclarProdutos.Show;
    end;

    tsTransfOrcamento.Show;
    CheckBox2.Checked := true;
    ComboBoxOpMesclar.ItemIndex := -1;
    FormResize(Sender);

    if (Self.Enabled) and (Self.Visible) and (ComboBoxOpMesclar.CanFocus) then
      ComboBoxOpMesclar.SetFocus;
  finally
    Screen.Cursor := crDefault;
  end;
  //  CadPedVenda.importarOrcamentoParaOs(CadPedVenda.dataSet.FieldByName('nped').AsInteger);
//  CadPedVenda.selecionaOrcParaTransferir(CadPedVenda.dataSet.FieldByName('nped').AsInteger);
end;

procedure TFrmCadPedVenda.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  CadPedVenda.detalhesFormaDePagamento;
  //  if CadPedVenda.detalhesFormaDePagamento then
  //    PageControl1.ActivePage := tsDetalhePagamento;
end;

procedure TFrmCadPedVenda.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if CadPedVenda.vendaFechada then
      exit;
    DBEdit9Exit(sender);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  Perform(WM_NEXTDLGCTL, 0, 0);
  exitDescontoAcrescimo(DBEdit29);
end;

procedure TFrmCadPedVenda.SpeedButton16Click(Sender: TObject);
begin
   if not vDadosIni.PesqPros('VND236', 'ABRIR', '', 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').AsString,
    CadPedVenda.buscas, FALSE) then
    Exit;

  if not CadPedVenda.abreFormDetParcelamentoContas then
    exit;
end;

procedure TFrmCadPedVenda.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas) then
    Exit;
  if CadPedVenda.Alterar then
    TabSheet4.show;
end;

procedure TFrmCadPedVenda.SpeedButton18Click(Sender: TObject);
var
	I: Integer;
  vCheckBox9: Boolean;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas) then
    Exit;

  if vDadosIni.vProgFid.vHabilitarProgFid then
  begin
    DBEdit88.Enabled := CadPedVenda.dataSet.FieldByName('vale_troca').AsString <> 'S';
    DBLookupComboBox12.Enabled := CadPedVenda.dataSet.FieldByName('vale_troca').AsString <> 'S';
    if DBEdit88.Enabled then
    begin
      DBEdit88.Enabled := CadPedVenda.dataSet.FieldByName('valor_vale_prg').AsFloat <= 0;
      DBLookupComboBox12.Enabled := CadPedVenda.dataSet.FieldByName('valor_vale_prg').AsFloat <= 0;
    end;
    if DBEdit88.Enabled then
    begin
       CadPedVenda.SqlOpen(' select count(*) vale from conta_corrente_prog_fidelidade cc ' +
         ' where cc.ndoc = ' + IntToStr(CadPedVenda.dataSet.FieldByName('nped').AsInteger) +
         ' and cc.tipodoc = ' + QuotedStr(CadPedVenda.dataSet.FieldByName('tipo').AsString) +
         ' and cc.cod_empresa = ' + vDadosIni.codEmpresa +
         ' and cc.tipo = ''DÉBITO'' and cc.vale = ''S'' ');
       DBEdit88.Enabled := CadPedVenda.buscas.FieldByName('vale').AsFloat <= 0;
       DBLookupComboBox12.Enabled := CadPedVenda.buscas.FieldByName('vale').AsFloat <= 0;
    end;
  end
  else
  begin
    DBEdit88.Enabled := true;
    DBLookupComboBox12.Enabled := true;
  end;

  if CadPedVenda.AlterarVendedorCliente then
  begin
  	GroupBox_5.Parent := GroupBox77;
    DBGrid5.Parent    := GroupBox77;

    GroupBox_3.Parent := GroupBox78;
    DBGrid3.Parent    := GroupBox78;

    DBGrid5.Enabled := false;
    DBGrid3.Enabled := false;

    setCliente3; // DBGrid OS/ORC - Prod
    setCliente5; // DBGrid OS/ORC - Serv
    setCliente6; // DBGrid OS/ORC - Serv Terc
    setCliente7; // DBGrid OS/ORC - Prod Terc
    carregarDBGrids;

    try
      vCheckBox9 :=	CheckBox9.Checked;
      CheckBox9.Checked := True;
    	habilitarSelecaoVariosItens;
    finally
      CheckBox9.Checked := vCheckBox9;
    end;

  	RadioGroup5.Items.Clear;
    RadioGroup5.Items.Add('Cabeçalho');
    if (CadPedVenda.getTipoVenda = 'OS') or ((CadPedVenda.getTipoVenda = 'ORC') and (CadPedVenda.dataSet.FieldByName('TOT_SERV').AsFloat > 0)) then
			RadioGroup5.Items.Add('Serviços Aplicados');
		if (CadPedVenda.getTipoVenda = 'OS') or ((CadPedVenda.getTipoVenda = 'ORC') and (CadPedVenda.dataSet.FieldByName('TOT_SERV').AsFloat > 0)) then
			RadioGroup5.Items.Add('Produtos');

  	ckAlterarClienteVenda.Enabled := false;
    ckAlterarClienteVendaFpCreditos.Enabled := false;
    Label128.Enabled := false;
    DBEdit88.Enabled := false;
    DBLookupComboBox12.Enabled := false;
    ckAlterarClienteVenda.Checked := false;
    ckAlterarClienteVendaFpCreditos.Checked := false;

    ckAlterarVendedorVenda.Enabled := false;
    ckAlterarVendedorVendaFpCreditos.Enabled := false;
    Label130.Enabled := false;
    DBEdit90.Enabled := false;
    DBLookupComboBox18.Enabled := false;
    ckAlterarVendedorVenda.Checked := false;
    ckAlterarVendedorVendaFpCreditos.Checked := false;

    ckAlterarFormaPagamentoVenda.Enabled := false;
    Label196.Enabled := false;
  	DBEdit119.Enabled := false;
	  DBLookupComboBox35.Enabled := false;
    ckAlterarFormaPagamentoVenda.Checked := false;

    ckAlterarParticipanteVenda.Enabled := false;
    Label213.Enabled := false;
    DBEdit127.Enabled := false;
    DBLookupComboBox38.Enabled := false;
    ckAlterarParticipanteVenda.Checked := false;

    ckAlterarClienteVenda.Enabled := true;
    ckAlterarClienteVendaFpCreditos.Enabled := true;
    ckAlterarVendedorVenda.Enabled := true;
    ckAlterarVendedorVendaFpCreditos.Enabled := true;
    ckAlterarFormaPagamentoVenda.Enabled := true;
    ckAlterarParticipanteVenda.Enabled := true;

    ckAlterarMecTecServ.Caption   := 'Alterar ' + vDadosIni.IfThen(vDadosIni.vEmp.vUsarAparelho = 'S', 'técnico', 'mecânico') + ' nos serviços';
    ckAlterarMecTecServ.Hint      := 'Alterar ' + vDadosIni.IfThen(vDadosIni.vEmp.vUsarAparelho = 'S', 'técnico', 'mecânico') + ' nos serviços - [VND288/VND292]';
    Label42.Caption               := vDadosIni.IfThen(vDadosIni.vEmp.vUsarAparelho = 'S', 'Técnico', 'Mecânico') + ':';
    DBLookupComboBox43.Hint       := vDadosIni.IfThen(vDadosIni.vEmp.vUsarAparelho = 'S', 'Técnico', 'Mecânico') + ' selecionado';

    ckAlterarVendedorServ.Caption := 'Alterar ' + LowerCase(trim(vDadosIni.vPedVnd.NomeSegCampoServ)) + ' nos serviços';
    ckAlterarVendedorServ.Hint    := 'Alterar ' + LowerCase(trim(vDadosIni.vPedVnd.NomeSegCampoServ)) + ' nos serviços - [VND289/VND293]';
    Label43.Caption               := trim(vDadosIni.vPedVnd.NomeSegCampoServ) + ':';
    DBLookupComboBox44.Hint       := trim(vDadosIni.vPedVnd.NomeSegCampoServ) + ' selecionado';

    ckAlterarMecTecProd.Caption   := 'Alterar ' + vDadosIni.IfThen(vDadosIni.vEmp.vUsarAparelho = 'S', 'técnico', 'mecânico') + ' nos produtos';
    ckAlterarMecTecProd.Hint      := 'Alterar ' + vDadosIni.IfThen(vDadosIni.vEmp.vUsarAparelho = 'S', 'técnico', 'mecânico') + ' nos produtos - [VND290/VND294]';
    Label61.Caption               := vDadosIni.IfThen(vDadosIni.vEmp.vUsarAparelho = 'S', 'Técnico', 'Mecânico') + ':';
    DBLookupComboBox45.Hint       := vDadosIni.IfThen(vDadosIni.vEmp.vUsarAparelho = 'S', 'Técnico', 'Mecânico') + ' selecionado';

    ckAlterarVendedorProd.Caption := 'Alterar vendedor nos produtos';
    ckAlterarVendedorProd.Hint    := 'Alterar vendedor nos produtos - [VND291/VND295]';
    Label82.Caption               := 'Vendedor:';
    DBLookupComboBox46.Hint       := 'Vendedor selecionado';

    Label42.Enabled := false;
    EditHw2.Enabled := false;
    DBLookupComboBox43.Enabled := false;
    ckAlterarMecTecServ.Checked := false;
    Label43.Enabled := false;
    EditHw4.Enabled := false;
    DBLookupComboBox44.Enabled := false;
    ckAlterarVendedorServ.Checked := false;
    BitBtnServOK.Enabled := false;
    BitBtnServCancelar.Enabled := false;
    btSelectServAll.Enabled := false;
  	btUnSelectServAll.Enabled := false;

    Label61.Enabled := false;
    EditHw5.Enabled := false;
    DBLookupComboBox45.Enabled := false;
    ckAlterarMecTecProd.Checked := false;
    Label82.Enabled := false;
    EditHw6.Enabled := false;
    DBLookupComboBox46.Enabled := false;
    ckAlterarVendedorProd.Checked := false;
    btSelectProdAll.Enabled := false;
    btUnSelectProdAll.Enabled := false;
    btSelectProdAll.Enabled := false;
  	btUnSelectProdAll.Enabled := false;

    Label129.Caption := 'Num Req:';
    Label269.Caption := 'Data Req:';
    if CadPedVenda.getTipoVenda = 'OS' then
    begin
    	Label129.Caption := 'Num OS:';
      Label269.Caption := 'Data OS:';
    end
    else if CadPedVenda.getTipoVenda = 'ORC' then
    begin
    	Label129.Caption := 'Num ORC:';
      Label269.Caption := 'Data ORC:';
    end;

    ckAlterarVendedorVenda.Caption := 'Alterar vendedor em venda';
    if CadPedVenda.getTipoVenda = 'OS' then
    	ckAlterarVendedorVenda.Caption := 'Alterar recepcionista em venda';

    ckAlterarVendedorVenda.Hint := 'Alterar vendedor em venda - [VND201/VND256/VND257]';
    if CadPedVenda.getTipoVenda = 'OS' then
    	ckAlterarVendedorVenda.Hint := 'Alterar recepcionista em venda - [VND201/VND256/VND257]';

    ckAlterarVendedorVendaFpCreditos.Caption := 'Alterar vendedor nas formas de pagamento e créditos';
    if CadPedVenda.getTipoVenda = 'OS' then
    	ckAlterarVendedorVendaFpCreditos.Caption := 'Alterar recepcionista nas formas de pagamento e créditos';

    ckAlterarVendedorVendaFpCreditos.Hint := 'Alterar vendedor nas formas de pagamento e créditos - [VND160]';
    if CadPedVenda.getTipoVenda = 'OS' then
    	ckAlterarVendedorVendaFpCreditos.Hint := 'Alterar recepcionista nas formas de pagamento e créditos - [VND160]';

    Label130.Caption := 'Vendedor:';
    if CadPedVenda.getTipoVenda = 'OS' then
    	Label130.Caption := 'Recepcionista:';

    DBEdit90.Hint := 'Código do Vendedor';
    if CadPedVenda.getTipoVenda = 'OS' then
    	DBEdit90.Hint := 'Código do Recepcionista';

    DBLookupComboBox18.Hint := 'Vendedor selecionado';
    if CadPedVenda.getTipoVenda = 'OS' then
    	DBLookupComboBox18.Hint := 'Recepcionista selecionado';

    ckAlterarParticipanteVenda.Visible := vDadosIni.vPedVnd.habPartipante;
    Label213.Visible := vDadosIni.vPedVnd.habPartipante;
    DBEdit127.Visible := vDadosIni.vPedVnd.habPartipante;
    DBLookupComboBox38.Visible := vDadosIni.vPedVnd.habPartipante;
    Label213.Caption := trim(vDadosIni.vPedVnd.descricaoParticipante) + ':';
    DBEdit127.Hint := 'Codigo do ' + trim(vDadosIni.vPedVnd.descricaoParticipante);
    DBLookupComboBox38.Hint := trim(vDadosIni.vPedVnd.descricaoParticipante) + ' selecionado';
    DBEdit119.Enabled := False;
    DBLookupComboBox35.Enabled := False;

    ckAlterarClienteVendaFpCreditos.Enabled  := CadPedVenda.getTipoVenda <> 'ORC';
    ckAlterarVendedorVendaFpCreditos.Enabled := CadPedVenda.getTipoVenda <> 'ORC';

    TabSheet7.Show;
    TabSheet13.Show;

    TabSheet7.TabVisible := False;
    TabSheet8.TabVisible := False;
    TabSheet9.TabVisible := False;

    TabSheet13.TabVisible := False;
    TabSheet14.TabVisible := False;
    TabSheet15.TabVisible := False;

    RadioGroup5.ItemIndex := 0;
    RadioGroup5Click(Sender);

    if CadPedVenda.getTipoVenda <> 'ORC' then
    begin
      ckAlterarClienteVendaFpCreditos.Checked  := False;
      ckAlterarVendedorVendaFpCreditos.Checked := False;
    end;

    if CadPedVenda._habilitarFormPag then
    begin
    	ckAlterarFormaPagamentoVenda.Visible := True;
      Label196.Visible := True;
      DBEdit119.Visible := True;
      DBLookupComboBox35.Visible := True;
//      SpeedButton39.Visible := True;
    end
    else
    begin
    	ckAlterarFormaPagamentoVenda.Visible := False;
      Label196.Visible := False;
      DBEdit119.Visible := False;
      DBLookupComboBox35.Visible := False;
//      SpeedButton39.Visible := False;
    end;

    TabSheet5.show;
  end;
end;

procedure TFrmCadPedVenda.SpeedButton19Click(Sender: TObject);
var
  pnVisible: Boolean;
begin
  inherited;
  if (CadPedVenda.vItProd.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
       Exit;
    application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes','Atenção',+0+64);
    if (Self.Enabled) and (Self.Visible) and (BitBtn19.CanFocus) then
      BitBtn19.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (GroupBox4.CanFocus) then
      GroupBox4.SetFocus;
    exit;
  end;

  pnVisible := pn_dev_ped_itens.Visible;
  DevItensHidePanels;

  CadPedVenda.vItProd._setaVariaveisPromocao(
  	CadPedVenda.vCliente.endAdic.cod_localidade_dest,
    CadPedVenda.vCliente.dataSet.FieldByName('cod_cliente').AsInteger,
    CadPedVenda.vCliente.dataSet.FieldByName('cod_tab_preco').AsInteger,
    CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger,
    CadPedVenda.vCliente.endAdic.cod_cidade_dest,
    CadPedVenda.dataSet.FieldByName('TIPV').AsString);

  CadPedVenda.recalcularPrecoItensPelaCondicaoPagamento;
  Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);

  pn_dev_ped_itens.Visible := pnVisible;

  DBEdit21.OnExit(sender);
end;

procedure TFrmCadPedVenda.SpeedButton1Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas) then
    Exit;

  if CadPedVenda.dataSet.IsEmpty then
    exit;

  CadPedVenda.vItProd.setDescontoValor(0, 0);
  CadPedVenda.vItProd.setDescontoPercenentual(0);
  CadPedVenda.vItProd.setAcrescimoValor(0);
  CadPedVenda.vItProd.setAcrescimoPercenentual(0);

  if not CadPedVenda._permitirInclusaoEdicaoVND(false) then
    exit;
  if not CadPedVenda._permitirAlteracoesComEnvioMobilePendente then
    Exit;
  if (TelaCadastro <> 8) then
    CadPedVenda.abreFormEscolhaTipoOrcamento(false, false, false);
  inherited;
  try
    Screen.Cursor := crHourGlass;
    habilitaControlesParaEdicao;
    FormResize(Sender);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.SpeedButton20Click(Sender: TObject);
begin
  inherited;
  CadPedVenda.vItProd._setaVariaveisPromocao(
  	CadPedVenda.vCliente.endAdic.cod_localidade_dest,
    CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger,
    CadPedVenda.vCliente.dataSet.FieldByName('cod_tab_preco').AsInteger,
    CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger,
    CadPedVenda.vCliente.endAdic.cod_cidade_dest,
    CadPedVenda.dataSet.FieldByName('TIPV').AsString);

  if CadPedVenda.recalcularPrecoItensPelaCondicaoPagamento then
    eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;
end;

procedure TFrmCadPedVenda.SpeedButton21Click(Sender: TObject);
begin
  inherited;
//  CadPedVenda.verificatipovenda(1, DBComboBox10, 'TMO', '');
  CadPedVenda.abreFormStatusOS;
end;

procedure TFrmCadPedVenda.SpeedButton22Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas) then
    Exit;
  if CadPedVenda.getTipoVenda = 'OS' then
  begin
    if vDadosIni.PesqPros('VND117', 'ALTERAR', 'ALTERANDO STATUS OS', 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').AsString, CadPedVenda.buscas, true) then
      CadPedVenda.dataSet.Edit;
  end else if CadPedVenda.getTipoVenda = 'ORC' then
  begin
    if vDadosIni.PesqPros('VND121', 'ALTERAR', 'ALTERANDO STATUS ORÇAMENTO', 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').AsString, CadPedVenda.buscas, true) then
      CadPedVenda.dataSet.Edit;
  end else if CadPedVenda.getTipoVenda = 'REQ' then
  begin
    if vDadosIni.PesqPros('VND124', 'ALTERAR', 'ALTERANDO STATUS REQUISIÇÃO', 'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').AsString, CadPedVenda.buscas, true) then
      CadPedVenda.dataSet.Edit;
  end;

  DBLookupComboBox24.Enabled := true;
end;

procedure TFrmCadPedVenda.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  if not CadPedVenda.IsEmpty then
    qrpFichaOS.Preview;
end;

procedure TFrmCadPedVenda.SpeedButton24Click(Sender: TObject);
begin
  inherited;        
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas) then
    Exit;
  CadPedVenda.LiberarTravaVenda;
end;

procedure TFrmCadPedVenda.SpeedButton25Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if not CadPedVenda.abrirLixeira then
      exit;
    SpeedButton1.Visible := False;
    SpeedButton6.Visible := False;
    SpeedButton10.Visible := False;
    SpeedButton16.Visible := false;
    SpeedButton7.Visible := False;
    SpeedButton8.Visible := False;
    //    SpeedButton11.Visible := False;
    SpeedButton23.Visible := False;
    SpeedButton5.Visible := True;
    lixeiraVazia(false);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas) then
    Exit;
  CadPedVenda.MarcarOSParaLivro;
end;

procedure TFrmCadPedVenda.SpeedButton27Click(Sender: TObject);
begin
  inherited;
  CadPedVenda.buscaAparelho(CadPedVenda.dataSet.FieldByName('COD_EQUIP').AsInteger);
//    if (not (CadPedVenda.dataSet.FieldByName('COD_EQUIP').IsNull)) and (CadPedVenda.dataSet.State in [dsEdit, dsInsert]) then
//    CadPedVenda.dataSet.FieldByName('APARELHO_PED').AsString := trim(CadPedVenda.vApar.dataSet.fieldbyname('MARCA').asstring) +
//      ' ' + trim(CadPedVenda.vApar.dataSet.fieldbyname('NOM_EQUIP').asstring) + ' SERIE: ' +
//      trim(CadPedVenda.vApar.dataSet.fieldbyname('N_SERIE').AsString) + ' MODELO: ' + trim(CadPedVenda.vApar.dataSet.fieldbyname('MODELO').AsString);
end;

procedure TFrmCadPedVenda.SpeedButton28Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas) then
    Exit;
  if not vDadosIni.PesqPros('VND125', 'LIBERAR/TRAVAR', 'ACESSO PARA SELECIONAR', 'PEDVENDA',
    '', CadPedVenda.buscas, true) then
    Exit;

  CadPedVenda.dataSet.FieldByName('sel').Visible := true;

  for I := 0 to DBGrid1.Columns.Count - 1 do
    if trim(DBGrid1.Columns[I].FieldName) = 'SEL' then
    begin
       DBGrid1.Columns[I].Visible := True;
       Break;
    end;

  DBGrid1.SelectedIndex := 0;
  DBGrid1.SelectedIndex := DBGrid1.Columns.Count - 1;
  DBGrid1.SelectedIndex := 0;
  BitBtn66.Caption := 'Liberar/Travar vendas selecionadas para o Fechamento';
  BitBtn66.Visible := True;
  if (Self.Enabled) and (Self.Visible) and (BitBtn66.CanFocus) then
  	BitBtn66.SetFocus;
  Panel2.Visible := False;
end;

procedure TFrmCadPedVenda.SpeedButton29Click(Sender: TObject);
var
  hdTemp: THandle;
  formulario: TForm;
begin
  inherited;
  vDadosIni.vPesquisa := 'HISTORICO_CARGA|' + IntToStr(CadPedVenda.dataSet.FieldByName('nped').AsInteger) + '|' +
    Trim(CadPedVenda.dataSet.FieldByName('tipo').AsString) + '|';

  formulario := Funcoes.AbreForm('pkOrdemCarregamento', 'TfrmHistoricoEntregas', hdTemp);
  try
    if Trim(vDadosIni.vPesquisa) <> '' then
      formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;

end;

procedure TFrmCadPedVenda.SpeedButton2Click(Sender: TObject);
begin
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'E', CadPedVenda.buscas) then
    Exit;
  if (vDadosIni.vEmp.vUsarPreVenda = 'S') and (CadPedVenda.dataSet.FieldByName('paf_num_prevenda').AsInteger > 0) then
  begin
    Application.MessageBox('Cancelamento de Pré-Venda permitido apenas pelo PAF-ECF', 'Atenção', 0 + 64);
    exit;
  end;
  if not CadPedVenda._permitirAlteracoesComEnvioMobilePendente then
    Exit;

  inherited;
  try    //Na terá mais exclusão de de OS/REQ
//    if vDadosIni.vEmp.vUsarDAV <> 'S' then
//    begin
//      Screen.Cursor := crHourGlass;
//      CadPedVenda.lixeira;
//      if CadPedVenda.lixeiraVazia then
//      begin
//        lixeiraVazia(True);
//        SpeedButton1.Visible := True;
//        SpeedButton6.Visible := ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS'));
//        SpeedButton7.Visible := ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS'));
//        SpeedButton8.Visible := ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'OS'));
//      end
//      else
//        lixeiraVazia(False);
//    end
//    else
//    begin
      if CadPedVenda.CancelarDAV then
        Application.MessageBox('DAV Cancelado com Sucesso!', 'Informação', MB_ICONEXCLAMATION + MB_OK);
//    end;
  finally
    CadPedVenda.Refresh;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.SpeedButton30Click(Sender: TObject);
var
  vCodTemp: Integer;
begin
  inherited;
  GroupBox42.Visible := true;
  vCodTemp := CadPedVenda.vColab.dataSet.FieldByName('cod_vendedor').AsInteger;
  CadPedVenda.vColab.IndexFieldNames := 'NOME_VENDEDOR';
  DBLookupComboBox36.KeyValue := vCodTemp;
  if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox36.CanFocus) then
    DBLookupComboBox36.SetFocus;
//  Edit5.SetFocus;
end;

procedure TFrmCadPedVenda.SpeedButton31Click(Sender: TObject);
begin
  inherited;
  //  DBGrid50.ReadOnly := false;
  if CadPedVenda.vItServ.vMecOs.dataSet.IsEmpty then
    exit;
  CadPedVenda.vItServ.vMecOs.Edit;
  //  DBGrid50.SetFocus;
  DBGrid50.Visible := false;
  if (Self.Enabled) and (Self.Visible) and (DBEdit91.CanFocus) then
	  DBEdit91.SetFocus;
end;

procedure TFrmCadPedVenda.SpeedButton32Click(Sender: TObject);
begin
  inherited;
  CadPedVenda.vItServ.vMecOs.Delete;
end;

procedure TFrmCadPedVenda.SpeedButton33Click(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn82.CanFocus) then
	  BitBtn82.SetFocus;
  if CadPedVenda.vItServ.vMecOs.Post then
  begin
    DBGrid50.Visible := true;
    if (Self.Enabled) and (Self.Visible) and (DBGrid50.CanFocus) then
	    DBGrid50.SetFocus;
  end
  else if (Self.Enabled) and (Self.Visible) and (DBEdit91.CanFocus) then
    DBEdit91.SetFocus;
end;

procedure TFrmCadPedVenda.SpeedButton34Click(Sender: TObject);
begin
  inherited;
  if (CadPedVenda.vItProd.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
       Exit;
    application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes','Atenção',+0+64);
    if (Self.Enabled) and (Self.Visible) and (BitBtn19.CanFocus) then
      BitBtn19.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (GroupBox4.CanFocus) then
      GroupBox4.SetFocus;
    exit;
  end;
  CadPedVenda.verificaMinutaEntrega('');
end;

procedure TFrmCadPedVenda.SpeedButton35Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas) then
    Exit;

  if CadPedVenda._abreFormDevolucaItensVND then
    if CadPedVenda.vItProd.getValorItensLiquido = 0 then
    begin
      SpeedButton2Click(sender);
      BitBtn1.Click;
    end
    else if Application.MessageBox('Deseja alterar o tipo de venda do pedido e em seguida confirmá-lo?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYes then
    begin
      SpeedButton1Click(sender);
      //BitBtn1.Click;
    end;
end;

procedure TFrmCadPedVenda.SpeedButton36Click(Sender: TObject);
begin
  inherited;
  CadPedVenda.vAgenda._cadAgenda(0);
end;

procedure TFrmCadPedVenda.SpeedButton37Click(Sender: TObject);
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

procedure TFrmCadPedVenda.SpeedButton38Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas) then
    Exit;
  CadPedVenda._marcarOrcComoNaoVenda;
end;

procedure TFrmCadPedVenda.SpeedButton39Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.PesqPros('VND162', 'HABILITAR', 'HABILITAR ALTERACAO CONTROLES DA REQ',
    'PEDVENDA', CadPedVenda.dataSet.FieldByName('NPED').AsString, CadPedVenda.buscas, true) then
    Exit;

  Label196.Enabled := True;
  DBEdit119.Enabled := True;
  DBLookupComboBox35.Enabled := True;
  SpeedButton39.Enabled := True;
  
end;

procedure TFrmCadPedVenda.SpeedButton3Click(Sender: TObject);
var
  vnped: integer;
  vtipo: string;
begin
  inherited;
  try
  	try
      Screen.Cursor := crHourGlass;

      vnped := CadPedVenda.dataSet.FieldByName('NPED').AsInteger;
      vtipo := trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString);

      vDadosIni.logsPedvenda(Self.ClassName + '.IMPRIMIR DOC - begin ' +
        trim(vtipo) + '-' + IntToStr(vnped), 'pedvenda');

      if not CadPedVenda.verificarImpressaoPerm(True, True) then
        exit;

      vDadosIni.logsPedvenda(Self.ClassName + '.IMPRIMIR DOC - CadPedVenda.imprimirDocumento;', 'pedvenda');

      CadPedVenda.imprimirDocumento;

    except
      on e: Exception do
      begin
      	vDadosIni.logsPedvenda(Self.ClassName + '.IMPRIMIR DOC - ' + e.Message, 'pedvenda');
        Application.MessageBox(pchar('Erro ao imprimir documento. Erro: ' + e.Message), 'Atenção', 0 + 64);
      end;
    end;

  finally
  	vDadosIni.logsPedvenda(Self.ClassName + '.IMPRIMIR DOC - end ' +
    	trim(vtipo) + '-' + IntToStr(vnped), 'pedvenda');

    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.SpeedButton40Click(Sender: TObject);
begin
  inherited;
	if not vDadosIni.PesqPros('VND167', 'CONSULTA', '', 'PEDVENDA', '', TDtmPedVenda(dtm).qrBuscas, False) then
  	Exit;
  CadPedVenda.vItProd.vListarImprimirItemVan := CadPedVenda.retornaVendaTipoVan;
  CadPedVenda.vItProd.abrePedVendaProd(CadPedVenda.dataSet.FieldByName('NPED').AsInteger, CadPedVenda.dataSet.FieldByName('TIPO').AsString);
  if CadPedVenda.vItProd.dataSet.IsEmpty then
  begin
  	ShowMessage('Não foram encontrados itens (produtos) na venda selecionada!');
  	Exit;
  end;
  if CadPedVenda.dataSet.FieldByName('STATUS_PED').AsString = 'CANCELADO' then
  	Exit;
  vDadosIni.vDtSetTmp := TClientDataSet(CadPedVenda.vItProd.dataSet);
	CadPedVenda.abreFormLucratividade;
end;

procedure TFrmCadPedVenda.SpeedButton41Click(Sender: TObject);
var
  vAutoriza: TPedidosAutorizacaoFinanceiro;
begin
  inherited;

  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas) then
    Exit;

  if not vDadosIni.PesqPros('VND170', 'CONSULTA', '', 'PEDVENDA', '', CadPedVenda.buscas, False) then
    Exit;
    
  vAutoriza.abreAutorizacaoFinanceiro;
end;

procedure TFrmCadPedVenda.SpeedButton42Click(Sender: TObject);
var
  vSitPed: TSituacaoDosPedidos;
begin
  inherited;
  if not vDadosIni.PesqPros('VND171', 'CONSULTA', '', 'PEDVENDA', '', CadPedVenda.buscas, False) then
    Exit;
  
  vSitPed.abreSituacaoPedido;
end;

procedure TFrmCadPedVenda.SpeedButton43Click(Sender: TObject);
begin
  inherited;
  if (CadPedVenda.vItProd.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
       Exit;
    application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes','Atenção',+0+64);
    if (Self.Enabled) and (Self.Visible) and (BitBtn19.CanFocus) then
      BitBtn19.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (GroupBox4.CanFocus) then
      GroupBox4.SetFocus;
    exit;
  end;
  CadPedVenda.abreFormFormasCliente;
end;

procedure TFrmCadPedVenda.SpeedButton45Click(Sender: TObject);
begin
  inherited;
  if (CadPedVenda.vItProd.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
       Exit;
    application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes','Atenção',+0+64);
    if (Self.Enabled) and (Self.Visible) and (BitBtn19.CanFocus) then
      BitBtn19.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (GroupBox4.CanFocus) then
      GroupBox4.SetFocus;
    exit;
  end;

  DevItensHidePanels;
  if (activecontrol = DBEdit21) or (activecontrol = DBEdit22)
    or (activecontrol = DBEdit23) or (activecontrol = DBEdit24) then
    Perform(WM_NEXTDLGCTL, 0, 0);
//  exitDescontoAcrescimo(Sender);
//  Label201.Visible := false;
//  Label255.Visible := false;
  CadPedVenda._abreFormExibeCongPagamentos(ckListaTodasPoliticas.Checked);
  if pn_dev_ped_itens.Tag = 1 then
  begin
    CadPedVenda.vItProd.DevInternaInit;
    DevItensExibir(CadPedVenda.vItProd);
  end;
end;

procedure TFrmCadPedVenda.SpeedButton46Click(Sender: TObject);
begin
  inherited;
  if ActiveControl = DBEdit85 then
    Perform(WM_NEXTDLGCTL, 0, 0);
  if CadPedVenda.dataSet.State = dsEdit then
    CadPedVenda.dataSet.FieldByName('DATA_NFEXT').Value :=  Null;
end;

procedure TFrmCadPedVenda.SpeedButton47Click(Sender: TObject);
begin
  try
  	Screen.Cursor := crHourGlass;

    if Trim(CadPedVenda.dataSet.FieldByName('NUM_NFEEXT').AsString) = '' then
    	Exit;
      
    CadPedVenda.abreForm('Digite os detalhes do cancelamento!', pnCancelarNFSE, tsOutros);
    edtmotivoCancelamento.Clear;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.SpeedButton48Click(Sender: TObject);
begin
  try
  	Screen.Cursor := crHourGlass;
    CadPedVenda.abreNFSE_CANCELADAS;
		CadPedVenda.abreForm('Excluir Cancelamento NFS-EXT', pnExcluirCancelamento, tsOutros);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.SpeedButton50Click(Sender: TObject);
begin
  inherited;
  exitDescontoAcrescimo(Sender);
//  Label201.Visible := false;
//  Label255.Visible := false;
  CadPedVenda._abreFormExibeCongPagamentos(ckListaTodasPoliticas.Checked);
end;

procedure TFrmCadPedVenda.SpeedButton52Click(Sender: TObject);
begin
  if (CadPedVenda.vItProd.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
       Exit;
    application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes','Atenção',+0+64);
    if (Self.Enabled) and (Self.Visible) and (BitBtn19.CanFocus) then
      BitBtn19.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (GroupBox4.CanFocus) then
      GroupBox4.SetFocus;
    exit;
  end;
	try
    Screen.Cursor := crHourGlass;
    vCheckCheck := TCheckCheck.create;
		vDadosIni.vPesquisaCliente := CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsString;
    if Trim(vDadosIni.vPesquisaCliente) = '' then
    	Exit;
    vCheckCheck.cadCheckCheck;
  finally
    Screen.Cursor := crDefault;
    if Assigned(vCheckCheck) then
    	FreeAndNil(vCheckCheck);
  end;
end;

procedure TFrmCadPedVenda.SpeedButton54Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas) then
      Exit;
    if CadPedVenda.dataSet.IsEmpty then
      exit;
    if not CadPedVenda._permitirAlteracoesComEnvioMobilePendente then
      Exit;

    vDadosIni.abreForm('Sepação de Mercadorias', pnSeparacao, tsOutros2);
    try CadPedVenda.dataSet.Refresh; except end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.SpeedButton55Click(Sender: TObject);
begin
  inherited;
  CadPedVenda.conf.ExecutarConferenciaVariaveis;
  vDadosIni.configurarSistema('ped_vnd_%', CadPedVenda.buscas);
  CadPedVenda.LerVariaveisOtimizacao;
end;

procedure TFrmCadPedVenda.bt_adicionar_ao_faturamentoClick(Sender: TObject);
var
  AProcedure: TprocedureArrayInt;
  AarrayInt: arrayInt;
  Adoit: Boolean;
  Aoptions: TDBGridOptions;
  I: Integer;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  CadPedVenda.storeRecNo;
  try
    if vDadosIni.vNotaFiscal.AHandle = 0 then
      CarregaPacote('pkNF', vDadosIni.vNotaFiscal.AHandle);

    if vDadosIni.vNotaFiscal.AHandle = 0 then
    begin
      Application.MessageBox('Pacote Nota Fiscal não carregado', 'Anteção', 0 + 64);
      Exit;
    end;
    @AProcedure := GetProcAddress(vDadosIni.vNotaFiscal.AHandle, 'faturamento_add_pedidos');
    if Assigned(AProcedure) then
    begin
      //tsOutros2 -> ts_fat_lote_sel
      try
        CadPedVenda.filterStr('((status_ped <> ''CANCELADO'') or (status_ped is null)) and ((num_nf is null) or (num_nf = 0))');

        if not vDadosIni.abreForm('Selecione a rota para incluir', pn_fat_lote_sel, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
          Exit;

      finally
        CadPedVenda.filterClear;
      end;

      CadPedVenda.prepare_loop_fmt('sel = ''S'' ', [''], [ol_disableControls, ol_filterClear_done, ol_go_first]);
      try
        SetLength(AarrayInt, CadPedVenda.dataSet.RecordCount);
        while not CadPedVenda.dataSet.Eof do
        begin
          AarrayInt[Pred(CadPedVenda.dataSet.RecNo)] := CadPedVenda.f_int('nped');
          CadPedVenda.dataSet.Next;
        end;

      finally
        CadPedVenda.prepare_loop_done;
      end;

      if Length(AarrayInt) > 0 then
        AProcedure(AarrayInt, False);
    end;
  finally
    CadPedVenda.checkUnCheckAllRows(False);
    CadPedVenda.restoreRecNo;
    DBGrid1.Visible := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.bt_alt_hora_entradaClick(Sender: TObject);
begin
	if Application.MessageBox('Deseja alterar a Data da OS?', 'Confirmação', MB_YESNO + MB_DEFBUTTON2) <> IDYES then
  	Exit;

  if not vDadosIni.PesqPros('VND258', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, True) then
  	Exit;

	bt_alt_hora_entrada.Visible := False;
	DBEdit26.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBEdit26.CanFocus) then
		DBEdit26.SetFocus;
end;

procedure TFrmCadPedVenda.bt_alt_hora_prometida2Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja alterar a Data Prometida?', 'Confirmação', MB_YESNO + MB_DEFBUTTON2) <> IDYES then
  	Exit;

  if not vDadosIni.PesqPros('VND259', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, True) then
  	Exit;

	bt_alt_hora_prometida2.Visible := False;
  DBEdit154.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBEdit154.CanFocus) then
		DBEdit154.SetFocus;  
end;

procedure TFrmCadPedVenda.bt_alt_hora_prometidaClick(Sender: TObject);
begin
	if Application.MessageBox('Deseja alterar a Data Prometida?', 'Confirmação', MB_YESNO + MB_DEFBUTTON2) <> IDYES then
  	Exit;

  if not vDadosIni.PesqPros('VND259', 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, True) then
  	Exit;

	bt_alt_hora_prometida.Visible := False;
  DBEdit27.Enabled := True;
  if (Self.Enabled) and (Self.Visible) and (DBEdit27.CanFocus) then
		DBEdit27.SetFocus;
end;

procedure TFrmCadPedVenda.bt_show_form_valores_nf_reqClick(Sender: TObject);
var
  Avalues: string;
begin
  inherited;

  if not Assigned(Fnf_ac_calctrib_lookup) then
  begin
    Fnf_ac_calctrib_lookup := TDadosLookUp_OOP.create;
    TDadosLookUp_OOP(Fnf_ac_calctrib_lookup).setDadosDataSet(['S', 'N'], ['Sim', 'Não'], ed_nf_ac_calctrib);
    TDadosLookUp_OOP(Fnf_ac_calctrib_lookup).setDBLookupComboBox(ed_nf_cf_deson_emb);
  end;

  if not Assigned(Fnf_freteconta) then
  begin
    Fnf_freteconta := TDadosLookUp_OOP.create;
    TDadosLookUp_OOP(Fnf_freteconta).setDadosDataSet(['T', 'E', 'D'], ['Terceiros', 'Emitente', 'Destinatário'], ed_nf_freteconta);
  end;

  if frmCadPedVenda_ValoresNF = nil then
  	Application.CreateForm(TfrmCadPedVenda_ValoresNF, frmCadPedVenda_ValoresNF);

  vDadosIni.AlterarDataSourceComponentes(frmCadPedVenda_ValoresNF, CadPedVenda.DtmPed);

  CadPedVenda.onCalcValoresNF := frmCadPedVenda_ValoresNF.faturamento_calc_valores_nota;
  frmCadPedVenda_ValoresNF.PedVenda := CadPedVenda;

  try
  	frmCadPedVenda_ValoresNF.ShowModal;
  finally
    CadPedVenda.onCalcValoresNF := faturamento_calc_valores_nota;
  end;

//  tv_nf_valores.Items.Clear;
//  vDadosIni.abreForm('Valores de acréscimo e NF', pn_valores_nf, opFormsDefCadEsc);
//  tv_nf_valores.Items.Clear;

  if (CadPedVenda.dataSet.State in [dsinsert, dsedit]) then
    if CadPedVenda.f_str('nf_ac_calctrib') = 'S' then
    begin
      DevItensHidePanels;

      CadPedVenda.fat_ped.calcular_valores_nf;

      if pn_dev_ped_itens.Tag = 1 then
      begin
        CadPedVenda.vItProd.DevInternaInit;
        DevItensExibir(CadPedVenda.vItProd);
      end;
    end;
  eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;
end;

procedure TFrmCadPedVenda.SpeedButton57Click(Sender: TObject);
begin
  inherited;
	if not vDadosIni.PesqPros('VND242', 'ABRIR', '', 'PEDVENDA', '', TDtmPedVenda(dtm).qrBuscas, False) then
  	Exit;
  CadPedVenda.abreFormComissaoPorVenda(0);
end;

procedure TFrmCadPedVenda.SpeedButton58Click(Sender: TObject);
begin
  if not vDadosIni.PesqPros('VND248', 'ABRIR', '', 'PEDVENDA', '', TDtmPedVenda(dtm).qrBuscas, False) then
  	Exit;
  CadPedVenda.abreFormEnvioEC(0);
end;

procedure TFrmCadPedVenda.SpeedButton59Click(Sender: TObject);
begin
  if CadPedVenda.dataSet.State = dsEdit then
   CadPedVenda.dataSet.FieldByName('DATA_ENVIO_RAST').Value := Null;
end;

procedure TFrmCadPedVenda.bt_ultimos_precosClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  grid_ultimos_precos.Tag          := 0;
  grid_ultimos_precos.Visible      := CadPedVenda.ultimosPrecos.get_utlimos_precos.RecordCount > 0;
  grid_ultimos_precos.DataSource   := CadPedVenda.ultimosPrecos._dataSourceOOP;
  bt_preco_ultimo_utilizar.Enabled := (CadPedVenda.ultimosPrecos.botao_aplicar_preco) and
                                      (vDadosIni.strIn(CadPedVenda.vItProd.f_str('tabpraticada'), ['', 'N'])) and
                                      (DBEdit14.Enabled) and (not DBEdit14.ReadOnly) and (not CadPedVenda.vendaFechada);

  for I := 0 to Pred(grid_ultimos_precos.Columns.Count) do
  	with grid_ultimos_precos.Columns.Items[I] do
    begin
      if FieldName = 'VLUN_PED_ITEM' then
        Title.Color := clBtnShadow
      else if FieldName = 'OPERACAO_CONV' then
      	Visible := False
      else if FieldName = 'FATOR_CONV' then
        Visible := False;
    end;

  vDadosIni.abreForm('Últimos preços', pn_precos_ultimos, opFormsDefCadEsc);
  if (Self.Enabled) and (Self.Visible) and (DBEdit14.CanFocus) then
    DBEdit14.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (DBEdit51.CanFocus) then
  	DBEdit51.SetFocus;
end;

procedure TFrmCadPedVenda.bt_ultimos_precos_vnd_rapClick(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  if TForm(Panel36.Parent).ActiveControl <> edValorUnitarioVendaRapida then
     if (Self.Enabled) and (Self.Visible) and (edValorUnitarioVendaRapida.CanFocus) then
     begin
       edValorUnitarioVendaRapida.SetFocus;
       Exit;
     end;

  grid_ultimos_precos.Tag          := 1;
  grid_ultimos_precos.Visible      := CadPedVenda.ultimosPrecos.get_utlimos_precos.RecordCount > 0;
  grid_ultimos_precos.DataSource   := CadPedVenda.ultimosPrecos._dataSourceOOP;
  bt_preco_ultimo_utilizar.Enabled := (CadPedVenda.ultimosPrecos.botao_aplicar_preco) and
                                      (vDadosIni.strIn(CadPedVenda.vItProd.f_str('tabpraticada'), ['', 'N'])) and
                                      (DBEdit14.Enabled) and (not DBEdit14.ReadOnly) and (not CadPedVenda.vendaFechada) and
                                      (edValorUnitarioVendaRapida.Enabled) and (edValorUnitarioVendaRapida.CanFocus);

  for I := 0 to Pred(grid_ultimos_precos.Columns.Count) do
  	with grid_ultimos_precos.Columns.Items[I] do
    begin
      if FieldName = 'VLUN_PED_ITEM' then
        Title.Color := clBtnShadow
      else if FieldName = 'OPERACAO_CONV' then
      	Visible := False
      else if FieldName = 'FATOR_CONV' then
        Visible := False;
    end;

  vDadosIni.abreForm('Últimos preços', pn_precos_ultimos, opFormsDefCadEsc);
  if (Self.Enabled) and (Self.Visible) and (edValorUnitarioVendaRapida.CanFocus) then
    edValorUnitarioVendaRapida.SetFocus;
end;

procedure TFrmCadPedVenda.bt_cliente_endadd_reqClick(Sender: TObject);
var
  vOK: Boolean;
begin
  inherited;
  //Perform(WM_NEXTDLGCTL, 0, 0);
  CadPedVenda.vCliente.endAdic.onAfterScroll := nil;
  CadPedVenda.vCliente.endAdic.abrir(True);
  //vDadosIni.abreForm('Endereços do cliente', pn_cliente_dests, opFormsDefCadEsc);

  if frmCadPedVendaCliente = nil then
  	Application.CreateForm(TfrmCadPedVendaCliente, frmCadPedVendaCliente);

  vDadosIni.AlterarDataSourceComponentes(frmCadPedVendaCliente, CadPedVenda.DtmPed);

  frmCadPedVendaCliente.PedVenda := CadPedVenda;
  frmCadPedVendaCliente.ShowModal;

  CadPedVenda.vCliente.endAdic.onAfterScroll := nil;
  if bt_cliente_dests_utilizar_principal.Tag = 1 then
  begin
    vOK := false;
    if (CadPedVenda.vCodClienteOld <= 0) then
      CadPedVenda.vCodClienteOld := CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger;

    if (CadPedVenda.vCodClienteOld <> CadPedVenda.f_int('COD_CLIENTE')) or
       (CadPedVenda.vDest_seqidOld <> CadPedVenda.f_int('DEST_SEQID')) then
      vOK := True
    else
      vOK := vDadosIni.PesqPros('VND227', 'RECALCULAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False, False, True);

    if vOK then
    begin
      CadPedVenda.vCodClienteOld := CadPedVenda.dataSet.FieldByName('COD_CLIENTE').AsInteger;
      CadPedVenda.vDest_seqidOld := CadPedVenda.dataSet.FieldByName('DEST_SEQID').AsInteger;

      CadPedVenda.vItProd._setaVariaveisPromocao(
      	CadPedVenda.vCliente.endAdic.cod_localidade_dest,
        CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger,
        CadPedVenda.vCliente.dataSet.FieldByName('cod_tab_preco').AsInteger,
        CadPedVenda.dataSet.FieldByName('cod_cond_pag').AsInteger,
        CadPedVenda.vCliente.endAdic.cod_cidade_dest,
        CadPedVenda.dataSet.FieldByName('TIPV').AsString);

      DevItensHidePanels;
      try
        DBGrid3.DataSource.DataSet.DisableControls;
        CadPedVenda._recalcularPrecoProdutosPromocao;
      finally
        DBGrid3.DataSource.DataSet.EnableControls;
        if pn_dev_ped_itens.Tag = 1 then
        begin
          CadPedVenda.vItProd.DevInternaInit;
          DevItensExibir(CadPedVenda.vItProd);
        end;
      end;
    end;

    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);

    if CheckBox4.Checked then
      eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;
    Label52.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
  end;
end;

procedure TFrmCadPedVenda.bt_fat_lote_sel_tickClick(Sender: TObject);
begin
  inherited;
  CadPedVenda.checkUnCheckAllRows(True);
end;

procedure TFrmCadPedVenda.bt_fat_lote_sel_untickClick(Sender: TObject);
begin
  inherited;
  CadPedVenda.checkUnCheckAllRows(False);
end;

procedure TFrmCadPedVenda.bt_notas_vinculadasClick(Sender: TObject);
begin
  inherited;
  if frmCadPedVenda_NotasVinculadas = nil then
  	Application.CreateForm(TfrmCadPedVenda_NotasVinculadas, frmCadPedVenda_NotasVinculadas);

  vDadosIni.AlterarDataSourceComponentes(frmCadPedVenda_NotasVinculadas, CadPedVenda.DtmPed);

  with frmCadPedVenda_NotasVinculadas do
  begin
    Pedido_Numero := CadPedVenda.fint('nped');
    Pedido_Tipo   := CadPedVenda.fstr('tipo');
    frmCadPedVenda_NotasVinculadas.ShowModal;
  end;
end;

procedure TFrmCadPedVenda.bt_preco_ultimo_utilizarClick(Sender: TObject);
var
  vVLUN_PED_ITEM: Double;
  vVLUN_PED_ITEM_CONV: Double;
  vUNIDADE_CONV: string;
  vOPERACAO_CONV: string;
  vFATOR_CONV: Double;
	vTABPRATICADA: string;
  I: Integer;
begin
  inherited;

  if CadPedVenda.vendaFechada then
    Exit;

  vTABPRATICADA := CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString;

  if CadPedVenda.vItProd.dataSet.State in [dsInsert, dsEdit] then
  begin
    vVLUN_PED_ITEM      := CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat;
    vVLUN_PED_ITEM_CONV := CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat;
    vUNIDADE_CONV       := UpperCase(trim(CadPedVenda.vItProd.dataSet.FieldByName('UNIDADE_CONV').AsString));
    vOPERACAO_CONV      := CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').AsString;
    vFATOR_CONV         := CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat;

    with CadPedVenda.vItProd do
      if not vDadosIni.PesqPros('VND241', 'LIBERAR',
                                Format('PROD: %s Vl Unit: %n', [f_str('num_fab_prod'), vVLUN_PED_ITEM]), 'PEDVENDA_PROD',
                                Format('%d-%d/%d-%s', [CadPedVenda.f_int('nped'), f_int('nitem'), f_int('grupo_prod'), f_str('cod_prod')]) , buscas, true) then
        Exit;

    vVLUN_PED_ITEM      := CadPedVenda.vItProd.f_float('VLUN_PED_ITEM');
    vVLUN_PED_ITEM_CONV := CadPedVenda.vItProd.f_float('VLUN_PED_ITEM_CONV');
    vUNIDADE_CONV       := UpperCase(trim(CadPedVenda.vItProd.f_str('UNIDADE_CONV')));
    vOPERACAO_CONV      := CadPedVenda.vItProd.f_str('OPERACAO_CONV');
    vFATOR_CONV         := CadPedVenda.vItProd.f_float('FATOR_CONV');

    if (CadPedVenda.vItProd.dataSet.State = dsEdit) and (CheckBox4.Checked) then
    begin
      edValorUnitarioVendaRapida.Valor := CadPedVenda.ultimosPrecos.f_float('vlun_ped_item');
      for I := 0 to DBComboBoxUnVendaRapida.Items.Count - 1 do
      	if UpperCase(trim(DBComboBoxUnVendaRapida.Items[I])) = UpperCase(trim(CadPedVenda.ultimosPrecos.f_str('unidade_conv'))) then
      	begin
        	DBComboBoxUnVendaRapida.ItemIndex := I;
          Break;
        end;

      TForm(pn_precos_ultimos.Parent).ModalResult := IDOK;
      Exit;
    end
    else if (CadPedVenda.vItProd.dataSet.State = dsInsert) and (CheckBox4.Checked) then
    begin
      edValorUnitarioVendaRapida.Valor := CadPedVenda.ultimosPrecos.f_float('vlun_ped_item_conv');
      for I := 0 to DBComboBoxUnVendaRapida.Items.Count - 1 do
      	if UpperCase(trim(DBComboBoxUnVendaRapida.Items[I])) = UpperCase(trim(CadPedVenda.ultimosPrecos.f_str('unidade_conv'))) then
      	begin
        	DBComboBoxUnVendaRapida.ItemIndex := I;
          Break;
        end;
    end;

    if (trim(CadPedVenda.ultimosPrecos.f_str('OPERACAO_CONV')) = 'M') or (trim(CadPedVenda.ultimosPrecos.f_str('operacao_conv')) = 'D') then
    	CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').AsString := CadPedVenda.ultimosPrecos.f_str('operacao_conv')
    else
    	CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').Value := Null;

    if CadPedVenda.ultimosPrecos.f_float('fator_conv') > 0 then
    	CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat := CadPedVenda.ultimosPrecos.f_float('fator_conv')
    else
    	CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').Value := Null;

    CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat := CadPedVenda.ultimosPrecos.f_float('vlun_ped_item');
    CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat := CadPedVenda.ultimosPrecos.f_float('vlun_ped_item_conv');
    CadPedVenda.vItProd.dataSet.FieldByName('UNIDADE_CONV').AsString := UpperCase(trim(CadPedVenda.ultimosPrecos.f_str('unidade_conv')));

    if not verificarDescontoTabDifPromPrecoQtde(
    	CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat,
      CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM_CONV').AsFloat,
      CadPedVenda.vItProd.dataSet.FieldByName('VLUN_ORIG').AsFloat,
      CadPedVenda.vItProd.dataSet.FieldByName('TP_DESCACRES').AsString,
      CadPedVenda.vItProd.dataSet.FieldByName('NAT_DESCACRES').AsString,
      CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsFloat) then
    begin
    	if (trim(vOPERACAO_CONV) = 'M') or (trim(vOPERACAO_CONV) = 'D') then
      	CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').AsString := trim(vOPERACAO_CONV)
      else
      	CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').Value := Null;

      if vFATOR_CONV > 0 then
        CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat := vFATOR_CONV
      else
      	CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').Value := Null;

      CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat := vVLUN_PED_ITEM;
      CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat := vVLUN_PED_ITEM_CONV;
      CadPedVenda.vItProd.dataSet.FieldByName('UNIDADE_CONV').AsString := UpperCase(trim(vUNIDADE_CONV));
      exit;
    end;

    if not CadPedVenda.vItProd._validarAlteracaoPrecoUnitario(vTABPRATICADA) then
    begin
    	if (trim(vOPERACAO_CONV) = 'M') or (trim(vOPERACAO_CONV) = 'D') then
      	CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').AsString := trim(vOPERACAO_CONV)
      else
      	CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').Value := Null;

      if vFATOR_CONV > 0 then
        CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat := vFATOR_CONV
      else
      	CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').Value := Null;
        
      CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat := vVLUN_PED_ITEM;
      CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat := vVLUN_PED_ITEM_CONV;
      CadPedVenda.vItProd.dataSet.FieldByName('UNIDADE_CONV').AsString := UpperCase(trim(vUNIDADE_CONV));
      exit;
    end;

    with CadPedVenda.vItProd do
      vDadosIni.GravaAuditoria('VND241', 'APLICADO',
                               Format('PROD: %s Vl Unit: %n', [f_str('num_fab_prod'), CadPedVenda.vItProd.f_float('VLUN_PED_ITEM')]), 'PEDVENDA_PROD',
                               Format('%d-%d/%d-%s', [CadPedVenda.f_int('nped'), f_int('nitem'), f_int('grupo_prod'), f_str('cod_prod')]) , buscas);

    if not CadPedVenda.vItProd.checaValoresItens then
      setFocusCampoErro(CadPedVenda.vItProd.vNomeCampoErro, CadPedVenda.vItProd.vMensagemErro)
    else
      TForm(pn_precos_ultimos.Parent).ModalResult := IDOK;
  end;
end;

procedure TFrmCadPedVenda.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor := crHourGlass;
    CadPedVenda.restaurar;
    if CadPedVenda.lixeiraVazia then
    begin
      lixeiraVazia(True);
      SpeedButton1.Visible := True;
      SpeedButton6.Visible := True;
      SpeedButton10.Visible := True;
      SpeedButton16.Visible := true;
      SpeedButton7.Visible := True;
      SpeedButton8.Visible := True;
      //      SpeedButton11.Visible := (CadPedVenda.getTipoVenda = 'ORC');
            //      SpeedButton5.Visible := False;
    end
    else
      lixeiraVazia(False);
  finally
    CadPedVenda.Refresh;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.btEditoObsReqClick(Sender: TObject);
begin
  inherited;
  try
    gbObservacao.Caption := 'Observacao Pedido:';
    vDadosIni.abreForm('Editar Observação do Pedido', Self.pnObservacao, Self.tsObservacao);
    CadPedVenda.dataSet.FieldByName('OBS_OS').AsString := AnsiUpperCase(CadPedVenda.fstr('OBS_OS'));
  finally
    gbObservacao.Caption := 'Observacao OS:';
  end;
end;

procedure TFrmCadPedVenda.btEmitirDocCancelClick(Sender: TObject);
begin
  TForm(pnEmitirDoc.Parent).ModalResult := IDCANCEL;
end;

procedure TFrmCadPedVenda.btEmitirDocOKClick(Sender: TObject);
begin
  if (not ckEmitirNFeDoc.Checked)
  	and (not ckEmitirNFCeDoc.Checked)
    and (not ckEmitirNFSeDoc.Checked) then
  begin
  	Application.MessageBox(Pchar('Nenhuma opção selecionado:' + #13 + #13 +
      'OPÇÕES' + #13 +
      'Emitir NFe' + #13 +
      'Emitir Cupom / NFCe' + #13 +
      'Emitir NFSe' + #13 + #13 +
      'Favor selecionar uma opção para continuar.'), 'Aviso', MB_OK + MB_ICONEXCLAMATION + MB_DEFBUTTON1);
    exit;
  end;

  TForm(pnEmitirDoc.Parent).ModalResult := IDOK;
end;

procedure TFrmCadPedVenda.SpeedButton61Click(Sender: TObject);
begin
  inherited;
  vCondpagPoliticaDesc := CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsInteger;
	vDadosIni.abreForm('Alterar condição de pagamento', pnCondPagPolitica, [ofEscapeExit, ofAlignAllClientWinCtrl]);
end;

procedure TFrmCadPedVenda.SpeedButton62Click(Sender: TObject);
begin
  inherited;

  if (CadPedVenda.dataSet.FieldByName('STATUS_PED').AsString = 'CANCELADO') then
  begin
  	if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'REQ' then
    	Application.MessageBox('Requisição está CANCELADA.', 'Informação', MB_OK + MB_ICONINFORMATION)
    else
    	Application.MessageBox('Ordem de serviço está CANCELADA.', 'Informação', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if trim(CadPedVenda.dataSet.FieldByName('STATUS_PED').AsString) <> 'FECHADA' then
  begin
  	if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'REQ' then
    	Application.MessageBox('Requisição não esta fechada.', 'Atenção', MB_ICONINFORMATION + MB_OK)
    else
    	Application.MessageBox('Ordem de serviço não esta fechada.', 'Atenção', MB_ICONINFORMATION + MB_OK);
    exit;
	end;

  if not CadPedVenda.Edit then
  	Exit;

  if CadPedVenda.dataSet.State = dsBrowse then
  	CadPedVenda.dataSet.Edit;

  CadPedVenda.calculaDescontoAcrescimo;

	if not CadPedVenda._checarRegrasDescontoAoConfirmarVND then
  	Exit;

  CadPedVenda.dataSet.Post;
  CadPedVenda.Apply;
  CadPedVenda.CommitaTransacao;
  CadPedVenda.RollBackTransacao;
end;

procedure TFrmCadPedVenda.SpeedButton63Click(Sender: TObject);
var
	vRecnoRVnd: Integer;
  vRecnoOpPag: Integer;
begin
  inherited;
	if CadPedVenda.vRVnd.dataSet.IsEmpty then
  	exit;

  try
  	Screen.Cursor := crHourGlass;
    ckListaTodasPoliticas.Enabled := False;
    SpeedButton63.Enabled         := False;
    SpeedButton64.Enabled         := False;
    SpeedButton61.Enabled         := False;
    BitBtn93.Enabled              := False;

    vRecnoRVnd  := CadPedVenda.vRVnd.dataSet.RecNo;
    vRecnoOpPag := CadPedVenda.vRVnd.vOpPag.dataSet.RecNo;

  	CadPedVenda.vRVnd._marcarTodos(CadPedVenda.buscas);
    CadPedVenda._SimularValoresComDesconto(label201);
    CadPedVenda._ExibirInfPoliticaSel(
      CadPedVenda.vRVnd.dataSet,
      CadPedVenda.vRVnd.vOpPag.dataSet,
      label255);
  finally
  	CadPedVenda.vRVnd.dataSet.RecNo        := vRecnoRVnd;
    CadPedVenda.vRVnd.vOpPag.dataSet.RecNo := vRecnoOpPag;

    ckListaTodasPoliticas.Enabled := True;
    SpeedButton63.Enabled         := True;
    SpeedButton64.Enabled         := True;
    SpeedButton61.Enabled         := True;
    BitBtn93.Enabled              := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.SpeedButton64Click(Sender: TObject);
var
	vRecnoRVnd: Integer;
  vRecnoOpPag: Integer;
begin
  inherited;
	if CadPedVenda.vRVnd.dataSet.IsEmpty then
    exit;

  try
  	Screen.Cursor := crHourGlass;
    ckListaTodasPoliticas.Enabled := False;
    SpeedButton63.Enabled         := False;
    SpeedButton64.Enabled         := False;
    SpeedButton61.Enabled         := False;
    BitBtn93.Enabled              := False;

    vRecnoRVnd  := CadPedVenda.vRVnd.dataSet.RecNo;
    vRecnoOpPag := CadPedVenda.vRVnd.vOpPag.dataSet.RecNo;

  	CadPedVenda.vRVnd._desmarcarTodos(CadPedVenda.buscas);
    CadPedVenda._SimularValoresComDesconto(label201);
    CadPedVenda._ExibirInfPoliticaSel(
      CadPedVenda.vRVnd.dataSet,
      CadPedVenda.vRVnd.vOpPag.dataSet,
      label255);
  finally
  	CadPedVenda.vRVnd.dataSet.RecNo        := vRecnoRVnd;
    CadPedVenda.vRVnd.vOpPag.dataSet.RecNo := vRecnoOpPag;

    ckListaTodasPoliticas.Enabled := True;
    SpeedButton63.Enabled         := True;
    SpeedButton64.Enabled         := True;
    SpeedButton61.Enabled         := True;
    BitBtn93.Enabled              := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.SpeedButton65Click(Sender: TObject);
var
	ConfigImp: TConfig_sistema_class;
	vComissaoVend: string;
  vComissaoConf: Double;
begin
	if not vDadosIni.PesqPros('VND276', 'PERMITIR', '', 'PEDVENDA', '', CadPedVenda.buscas, true) then
  	Exit;

  try
    ConfigImp := TConfig_sistema_class.getConf('ped_vnd_acresc_condpag_comissao_vend', CadPedVenda.buscas, vDadosIni.cod_empresa);

    try
      vComissaoConf := StrToFloat(trim(ConfigImp.ReadString('Configuracao', 'PercComissaoVendedor')));
    except
      vComissaoConf := 0;
    end;

    vComissaoVend := FloatToStr(CadPedVenda.dataSet.FieldByName('PERC_COMISSAO_VEND3').AsFloat);
    if not InputQuery('Comissão do vendedor (%)', 'Informe percentual de comissão do vendedor.', vComissaoVend) then
      exit;

    if trim(vComissaoVend) = '' then
      vComissaoVend := '0';

    try
      StrToFloat(vComissaoVend);
    except
      Application.MessageBox(pchar('Percentual de comissão do vendedor inválido'), 'Atenção', 0 + 64);
    end;

    if StrToFloat(vComissaoVend) < 0 then
    begin
      Application.MessageBox(pchar('Percentual de comissão do vendedor não deve ser menor que 0'), 'Atenção', 0 + 64);
      Exit;
    end;
    

    if StrToFloat(trim(vComissaoVend)) = CadPedVenda.dataSet.FieldByName('PERC_COMISSAO_VEND3').AsFloat then
      exit;

  	if (vComissaoConf > StrToFloat(trim(vComissaoVend))) then
    begin
    	if Application.MessageBox(PChar('Percentual de comissão informado menor que o configurado.' + #13 + #13 +
      	'COMISSAO: ' + #13 +
        'Informado: ' + FormatFloat('0.000', StrToFloat(trim(vComissaoVend))) + #13 +
        'Configurado: ' + FormatFloat('0.000', vComissaoConf) + #13 + #13 +
      	'Deseja continuar mesmo assim?'), 'Atenção',  MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
			    exit;

      if not vDadosIni.PesqPros('VND277', 'PERMITIR',
      	'INF: ' + FormatFloat('0.000', StrToFloat(trim(vComissaoVend))) +
        ' CONF: ' + FormatFloat('0.000', vComissaoConf), 'PEDVENDA', '', CadPedVenda.buscas, true) then
  		  	exit;
    end;

    CadPedVenda.dataSet.FieldByName('PERC_COMISSAO_VEND3').AsFloat := StrToFloat(trim(vComissaoVend));

    exitPercComissaoVend3(Sender);
  //	vDadosIni.abreForm('Alterar condição de pagamento e comissão do vendedor', pnAcrescCondPagComissaoVend, [ofAutoSize, ofEscapeExit]);

  //  if (vCodCondPag <> CadPedVenda.dataSet.FieldByName('COD_COND_PAG').AsInteger)
  //  	or (vPercVendedor <> CadPedVenda.dataSet.FieldByName('PERC_COMISSAO_VEND3').AsFloat) then
  //  begin
  //  	CadPedVenda.dataSet.First;
  //    while not CadPedVenda.dataSet.Eof do
  //    begin
  //      if CadPedVenda.dataSet.FieldByName('TOT_PROD').AsFloat > 0 then
  //        CadPedVenda.vItProd.dataSet.FieldByName('rateio_acresc').AsCurrency :=
  //          RoundTo((acrescProd / CadPedVenda.dataSet.FieldByName('TOT_PROD').AsFloat *
  //          	vItProd.dataSet.FieldByName('vltot_ped_item').AsFloat) +
  //            	vItProd.dataSet.FieldByName('ACRESC_ITEM').AsFloat, -2)
  //      else
  //        CadPedVenda.vItProd.dataSet.FieldByName('rateio_acresc').AsCurrency := 0;
  //      CadPedVenda.vItProd.dataSet.FieldByName('rateio_acresc').AsFloat :=
  //        CadPedVenda.vItProd.f_float('rateio_acresc') +
  //        CadPedVenda.vItProd.f_float('vl_desp_nf');
  //
  //      CadPedVenda.dataSet.Next;
  //    end;
  //  end;
  finally
    if Assigned(ConfigImp) then
      FreeAndNil(ConfigImp);
  end;

end;

procedure TFrmCadPedVenda.SpeedButton66Click(Sender: TObject);
begin
  inherited;
  if (not CadPedVenda.vendaFechada) then
    Exit;

  try
  	ckEmitirNFeDoc.Checked  := _LerConfiguracoesRegistroBoolean(ckEmitirNFeDoc.Name + trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString));
    ckEmitirNFCeDoc.Checked := _LerConfiguracoesRegistroBoolean(ckEmitirNFCeDoc.Name + trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString));
    ckEmitirNFSeDoc.Checked := _LerConfiguracoesRegistroBoolean(ckEmitirNFSeDoc.Name + trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString));

    ckEmitirNFSeDoc.Enabled :=
    	(trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'OS')
      and (vDadosIni.vEmp.vNfe.modeloNFServico = '55')
      and (CadPedVenda.verificarNFSe(CadPedVenda.dataSet.FieldByName('NPED').AsInteger,
      															 CadPedVenda.dataSet.FieldByName('TIPO').AsString,
                                     False));

    if not ckEmitirNFSeDoc.Enabled then
      ckEmitirNFSeDoc.Checked := False;

    if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'OS' then
    	btEmitirDocOK.Hint := 'Sim - [VND267/VND252/VND268]'
    else
    	btEmitirDocOK.Hint := 'Sim - [VND266/VND136/VND268]';

    if not vDadosIni.abreForm('Atenção', pnEmitirDoc, tsConfirmarDoc) then
      exit;

    if (ckEmitirNFeDoc.Checked) then
    begin
      try
        Screen.Cursor := crHourGlass;
        CadPedVenda.emitirNotaDoPedido(False);
      finally
        Screen.Cursor := crDefault;
      end;
    end
    else if (ckEmitirNFCeDoc.Checked) then
    begin
      try
        Screen.Cursor := crHourGlass;
        if (vDadosIni.vFiscalAtivo = 'S') then
          CadPedVenda.enviarVendaParaCupom
        else if vDadosIni.vNFConsumidor.CodEmissor > 0 then
          CadPedVenda.enviarVendaParaNFCe;
      finally
        Screen.Cursor := crDefault;
      end;
    end;

    if ckEmitirNFSeDoc.Checked then
    begin
      if CadPedVenda.verificarNFSe(
          CadPedVenda.dataSet.FieldByName('NPED').AsInteger,
          CadPedVenda.dataSet.FieldByName('TIPO').AsString,
          False) then
      begin
        if vDadosIni.PesqPros('VND268', 'EMITIR NFS', CadPedVenda.getTipoVenda, 'PEDVENDA',
          CadPedVenda.dataSet.FieldByName('NPED').AsString, CadPedVenda.buscas, true) then
        begin
          CallerNFSeFeatures.Emitir( CadPedVenda.fint('nped'), False );
        end;
      end;
    end;
      
    CadPedVenda.Refresh;
  finally
  	_GravaConfiguracoesBoolean(ckEmitirNFeDoc.Name + trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString), ckEmitirNFeDoc.Checked);
    _GravaConfiguracoesBoolean(ckEmitirNFCeDoc.Name + trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString), ckEmitirNFCeDoc.Checked);
  	_GravaConfiguracoesBoolean(ckEmitirNFSeDoc.Name + trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString), ckEmitirNFSeDoc.Checked);
  end;
end;

procedure TFrmCadPedVenda.SpeedButton6Click(Sender: TObject);
var
  vExisteProduto, vExisteServicoOS: boolean;
  existeRetencaoProdutos, existeRetencaoServicos: boolean;
  sqlCommand: string;
  vSqlTmp: string;
  vProcessoPesqVendedor: string;
  vDataTmp: TDateTime;
  vnped: integer;
  vtipo: string;
  AProcedure: Tcl_abreSituacaoDeCaixa;
begin
	try
  	try
      vnped := CadPedVenda.dataSet.FieldByName('NPED').AsInteger;
      vtipo := trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString);

      vDadosIni.logsPedvenda(Self.ClassName + '.CONFIRMAR DOC - begin ' +
         trim(vtipo) + '-' + IntToStr(vnped), 'pedvenda');

      if not SpeedButton6.Enabled then
        Exit;

      inherited;

      if CadPedVenda.vendaFechada then
        Exit;

      if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas) then
        Exit;

      if vDadosIni.vTsPlus = 'S' then
      begin
        if (not CadPedVenda.dataSet.FieldByName('DATA_PED').IsNull) then
          vDataTmp := CadPedVenda.dataSet.FieldByName('DATA_PED').AsDateTime
        else
          vDataTmp := vDadosIni.getDataBanco(CadPedVenda.buscas);
      end;

      CadPedVenda.onEstoqueMinimoAtingido := estoque_minimo_notificar;
      SpeedButton6.Enabled := False;
      try
        Screen.Cursor := crHourGlass;
        if not CadPedVenda._permitirAlteracoesComEnvioMobilePendente then
          Exit;
        sqlCommand := CadPedVenda.dataSet.CommandText;
        CadPedVenda.RollBackTransacao;
        CadPedVenda.abrePedVenda(CadPedVenda.dataSet.FieldByName('NPED').AsInteger);

        if not CadPedVenda.verificaCalculoPendente then
          Exit;

        if not CadPedVenda.Edit then
          exit;

        if not CadPedVenda.ChecaCamposObrigatorios then
        begin
          setFocusCampoErro(CadPedVenda.vNomeCampoErro, CadPedVenda.vMensagemErro);
          exit;
        end;

        if CadPedVenda.getTipoVenda <> 'ORC' then
        begin
          if not CadPedVenda.validaCheckCheck then
            Exit;

          if not CadPedVenda.validaFaturamento then
            Exit;
        end;

        if cadpedVenda.getTipoVenda = 'OS' then
        begin
          if not CadPedVenda.vItProd.vProduto.validaEstoqueFechamento then
          begin
            Application.MessageBox('O documento não foi confirmado.', 'Informação', MB_ICONEXCLAMATION + MB_OK);
            exit;
          end;
        end;
        if CadPedVenda.getTipoVenda = 'REQ' then
        begin
          if not CadPedVenda.vItProd.vProduto.validaEstoqueFechamento then
          begin
            Application.MessageBox('O documento não foi confirmado.', 'Informação', MB_ICONEXCLAMATION + MB_OK);
            exit;
          end;
        end;

        if CadPedVenda.dataSet.FieldByName('idmobile').AsInteger > 0 then
        begin
          if CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger <> strtoint(vDadosIni.vCliente.vCodClientePadrao) then
          begin
          	try
              if vDadosIni.vCliente.AHandle = 0 then
                CarregaPacote('pkClientes', vDadosIni.vCliente.AHandle);

              if vDadosIni.vCliente.AHandle = 0 then
              begin
                Application.MessageBox('Pacote Cliente não carregado', 'Anteção', 0 + 64);
                Exit;
              end;

              @AProcedure := GetProcAddress(vDadosIni.vCliente.AHandle, 'cl_abreSituacaoDeCaixa');

              if Assigned(AProcedure) then
                if not AProcedure(
                  CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger,
                  False,
                  (CadPedVenda.getTipoVenda <> 'ORC'),
                  '') then
                  	exit;
            finally
            end;
//          	try
//              vCliente := TCadClientes.create;
//              vCliente.abreClientes(CadPedVenda.dataSet.FieldByName('cod_cliente').AsInteger);
//
//              if vCliente.SituacaoDeCaixa(false, (CadPedVenda.getTipoVenda <> 'ORC')) = false then
//                exit;
//            finally
//              if Assigned(vCliente) then
//              	FreeAndNil(vCliente);
//            end;
          end;

          //Checar limite de credito do cliente
          if CadPedVenda.getTipoVenda <> 'ORC' then
          begin
            if not CadPedVenda.validaLimiteCredito then
              Exit;
          end;
        end;
    //    label201.visible := false;
    //    label255.visible := false;
    //    if CadPedVenda._checarRegrasDescontoAoConfirmarVND then
        try
          CadPedVenda.vEmitirNFeNFC := 'NAO';
          CadPedVenda.vEmitirNFSe   := 'NAO';

          vDadosIni.logsPedvenda(Self.ClassName + '.CONFIRMAR DOC - if CadPedVenda.confirmarVenda then', 'pedvenda');

          if CadPedVenda.confirmarVenda then
          begin
            if CadPedVenda.vEmitirNFeNFC = 'NF' then
            begin
              try
                Screen.Cursor := crHourGlass;
                CadPedVenda.emitirNotaDoPedido(False);
              finally
                Screen.Cursor := crDefault;
              end;
            end
            else if CadPedVenda.vEmitirNFeNFC = 'NFC' then
            begin
              try
                Screen.Cursor := crHourGlass;
                if (vDadosIni.vFiscalAtivo = 'S') then
                  CadPedVenda.enviarVendaParaCupom
                else if vDadosIni.vNFConsumidor.CodEmissor > 0 then
                  CadPedVenda.enviarVendaParaNFCe;
              finally
                Screen.Cursor := crDefault;
              end;
            end;

            if CadPedVenda.vEmitirNFSe = 'NFS' then
            begin
              if CadPedVenda.verificarNFSe(
                CadPedVenda.dataSet.FieldByName('NPED').AsInteger,
                CadPedVenda.dataSet.FieldByName('TIPO').AsString,
                False) then
              begin
                if vDadosIni.PesqPros('VND268', 'EMITIR NFS', CadPedVenda.getTipoVenda, 'PEDVENDA',
                  CadPedVenda.dataSet.FieldByName('NPED').AsString, CadPedVenda.buscas, true) then
                begin
                  CallerNFSeFeatures.Emitir( CadPedVenda.fint('nped'), False );
                end;

                if (vDadosIni.vEmp.vModoFaturamento <> 'S') then
                begin
                  
                  existeRetencaoProdutos := CadPedVenda.fdif('TIPO', 'ORC')
                    and CadPedVenda.fequals('nf_ac_calctrib', 'S')
                    and vDadosIni.existeProdutoDoc(
                      CadPedVenda.buscas, CadPedVenda.fint('nped'), CadPedVenda.fstr('tipo')
                    )
                    and vDadosIni.RetencaoClienteNFe(
                      CadPedVenda.buscas,
                      IfThen(CadPedVenda.fint('cod_cli_fat') > 0, CadPedVenda.fint('cod_cli_fat'), CadPedVenda.fint('cod_cliente'))
                    );

                  existeRetencaoServicos := CadPedVenda.fequals('TIPO', 'OS')
                    and Container.GetInstance().ErpFeaturesFactory.CreateChecarPossivelRetencaoNFSeUseCase()
                      .Executar(CadPedVenda.fint('nped'));

                  if existeRetencaoProdutos or existeRetencaoServicos then
                    CadPedVenda.iniciaFormaPagamento;
                  {
                	vExisteServicoOS           := False;
                  vRetencaoFedClienteNF      := False;
                  vRetencaoFedClienteNFS     := False;
                  vRetencaoFedTpServNFS      := False;
                  vIssRetidoClienteNFS       := False;
                  vIssRetidoTpServNFS        := False;

                  vExisteProduto             := vDadosIni.existeProdutoDoc(
                                                  CadPedVenda.buscas,
    		                                          CadPedVenda.fint('NPED'),
        		                             	        CadPedVenda.fstr('TIPO'));

                  if trim(CadPedVenda.fstr('TIPO')) <> 'ORC' then
                  begin
                    if CadPedVenda.fstr('NF_AC_CALCTRIB') = 'N' then
                      vRetencaoFedClienteNF  := False
                    else
                      vRetencaoFedClienteNF  := vDadosIni.RetencaoClienteNFe(
                                                  CadPedVenda.buscas,
                                                  IfThen(CadPedVenda.fint('cod_cli_fat') > 0, CadPedVenda.fint('cod_cli_fat'), CadPedVenda.fint('cod_cliente')));
                  end;

                  if trim(CadPedVenda.fstr('TIPO')) = 'OS' then
                  begin
                  	vExisteServicoOS         := vDadosIni.existeServicoDoc(
		                                     	        CadPedVenda.buscas,
    		                                          CadPedVenda.fint('NPED'),
        		                             	        CadPedVenda.fstr('TIPO'));

                    vRetencaoFedClienteNFS   := vDadosIni.RetencaoClienteNFSe(
                                   		    	   	  CadPedVenda.buscas,
                                   		    		  	CadPedVenda.fint('cod_cliente'));

                  	vRetencaoFedTpServNFS    := vDadosIni.RetencaoTpServicoNFSe(
                                          	   		CadPedVenda.buscas,
                                         		      CadPedVenda.fint('nped'),
                                     	     		    CadPedVenda.fstr('tipo'));

                    vIssRetidoClienteNFS     := vDadosIni.IssRetidoClienteNFSe(
                                                  CadPedVenda.buscas,
                                                  CadPedVenda.fint('COD_CLIENTE'));

                    vIssRetidoTpServNFS      := vDadosIni.IssRetidoTpServicoNFSe(
                                                  CadPedVenda.buscas,
                                                  CadPedVenda.fint('NPED'),
                                                  CadPedVenda.fstr('TIPO'));
                  end;

                  if ((vExisteProduto) and (vRetencaoFedClienteNF))
                    or ((vExisteServicoOS) and ((vIssRetidoClienteNFS) or (vIssRetidoTpServNFS) or (vRetencaoFedClienteNFS) or (vRetencaoFedTpServNFS))) then
                  begin
                    CadPedVenda.iniciaFormaPagamento;
                  end;
                  }
                end;
              end;
            end;

    //        if (vDadosIni.vEmp.vModoFaturamento <> 'S') then
    //        begin
    //          if trim(CadPedVenda.dataset.FieldByName('TIPO').AsString) = 'OS' then
    //          begin
    //            if vDadosIni.vEmp.vNfe.modeloNFServico = '55' then
    //            begin
    //             CadPedVenda.buscas.close;
    //             CadPedVenda.buscas.sql.text := ' select count(*) as qtde, ' +
    //              ' sum(coalesce(valor_tot_serv, 0) - coalesce(rateio_desc, 0)) as valor from pedvenda_serv ' +
    //              ' where nped = ' + IntToStr(CadPedVenda.dataSet.FieldByName('NPED').AsInteger) +
    //              ' and tipo = ' + QuotedStr(CadPedVenda.dataSet.FieldByName('TIPO').AsString) +
    //              ' and cod_empresa = ' + vDadosIni.codEmpresa +
    //              ' and valor_tot_serv <> 0 ' +
    //              ' and (n_nf is null or n_nf = 0) ' +
    //              ' and (status is null or status = '''') ';
    //             CadPedVenda.buscas.open;
    //             if CadPedVenda.buscas.FieldByName('qtde').AsInteger > 0 then
    //             begin
    //               if Application.MessageBox(Pchar('Deseja Emitir NFSe dos Serviços desta Venda no valor de:'+format('%n', [CadPedVenda.buscas.fieldbyname('valor').ascurrency])+'?'), 'Confirmação',
    //                 MB_YESNO + MB_DEFBUTTON2) = mrYES then
    //               begin
    //                 CallerNFSeFeatures.Emitir( CadPedVenda.fint('nped') );
    //               end;
    //
    //							 vExisteServicoOS           := False;
		//               vRetencaoFedClienteNF      := False;
		//            	 vRetencaoFedClienteNFS     := False;
		//            	 vRetencaoFedTpServNFS      := False;
		//            	 vIssRetidoClienteNFS       := False;
		//               vIssRetidoTpServNFS        := False;
    //
    //							 vExisteProduto             := vDadosIni.existeProdutoDoc(
    //                                              CadPedVenda.buscas,
    //		                                          CadPedVenda.fint('NPED'),
    //    		                             	        CadPedVenda.fstr('TIPO'));
    //
    //							 if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) <> 'ORC' then
    //							 begin
  	//							   if CadPedVenda.fstr('NF_AC_CALCTRIB') = 'N' then
	  //                   vRetencaoFedClienteNF  := False
    //                 else
    //                   vRetencaoFedClienteNF  := vDadosIni.RetencaoClienteNFe(
    //                                               buscas,
    //                                               IfThen(CadPedVenda.fint('cod_cli_fat') > 0, fint('cod_cli_fat'), fint('cod_cliente')));
    //							 end;
    //
    //               if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'OS' then
    //               begin
    //								 vExisteServicoOS         := vDadosIni.existeServicoDoc(
    //		                                     	     CadPedVenda.buscas,
    //    		                                       CadPedVenda.fint('NPED'),
    //        		                             	     CadPedVenda.fstr('TIPO'));
    //
    //								 vRetencaoFedClienteNFS   := vDadosIni.RetencaoClienteNFSe(
    //                               		    		     CadPedVenda.buscas,
    //                               		    		   	 CadPedVenda.fint('cod_cliente'));
    //
    //								 vRetencaoFedTpServNFS    := vDadosIni.RetencaoTpServicoNFSe(
    //                                            	 CadPedVenda.buscas,
    //                                         	   	 CadPedVenda.fint('nped'),
    //                                     	     	   CadPedVenda.fstr('tipo'));
    //
    //                 vIssRetidoClienteNFS     := vDadosIni.IssRetidoClienteNFSe(
    //                                               CadPedVenda.buscas,
    //                                               CadPedVenda.fint('COD_CLIENTE'));
    //
    //                 vIssRetidoTpServNFS      := vDadosIni.IssRetidoTpServicoNFSe(
    //                                               CadPedVenda.buscas,
    //                                               CadPedVenda.fint('NPED'),
    //                                               CadPedVenda.fstr('TIPO'));
    //            	end;
    //
    //							if ((vExisteProduto) and (vRetencaoFedClienteNF))
    //									 or ((vExisteServicoOS) and ((vIssRetidoClienteNFS) or (vIssRetidoTpServNFS) or (vRetencaoFedClienteNFS) or (vRetencaoFedTpServNFS))) then
  	//								 begin
    //	            		 CadPedVenda.iniciaFormaPagamento;
  	//                 end;
    //             end;
    //            end;
    //          end;
    //        end;
          end;
        finally
          CadPedVenda.vEmitirNFeNFC := 'NAO';
          CadPedVenda.vEmitirNFSe   := 'NAO';
        end;
      finally
        CadPedVenda.onEstoqueMinimoAtingido := nil;
        CadPedVenda.pedidoEmEdicao(caRemoverEdicao, False);
        if CadPedVenda.dataSet.State in [dsEdit, dsInsert] then
        begin
          CadPedVenda.dataSet.Cancel;
          CadPedVenda.dataSet.CancelUpdates;
          //CadPedVenda.dataSet.Refresh;
        end;

        if vDadosIni.vTsPlus = 'S' then
        begin
          vSqlTmp := ' and pedvenda.tipo = ' + QuotedStr(CadPedVenda.getTipoVenda);
          if CadPedVenda.getTipoVenda = 'REQ' then
            vProcessoPesqVendedor := 'VND222'
          else if Trim(CadPedVenda.getTipoVenda) = 'OS' then
            vProcessoPesqVendedor := 'VND223'
          else
            vProcessoPesqVendedor := 'VND224';
          if not vDadosIni.PesqPros(vProcessoPesqVendedor, 'HABILITAR', '',
            'PEDVENDA', '', CadPedVenda.buscas, False, False, True) then
              vSqlTmp := vSqlTmp + ' and pedvenda.cod_vendedor = ' + IntToStr(vDadosIni.vCodUsuario);

          CadPedVenda.montaSelect(' select ' + CadPedVenda.Fsql_campos + ' from pedvenda ' +
            CadPedVenda.Fsql_inner +
            ' where pedvenda.data_ped = ' + QuotedStr(FormatDateTime('dd.mm.yyyy', vDataTmp)) +
            vSqlTmp +
            ' and pedvenda.cod_empresa = ' + vDadosIni.codEmpresa);
        end
        else
        begin
          if trim(sqlCommand) <> '' then
            CadPedVenda.montaSelect(sqlCommand);
        end;
        Screen.Cursor := crDefault;
        SpeedButton6.Enabled := True;
      end;

    except
      on e: Exception do
      begin
      	vDadosIni.logsPedvenda(Self.ClassName + '.CONFIRMAR DOC - ' + e.Message, 'pedvenda');
        Application.MessageBox(pchar('Erro ao confirmar documento. Erro: ' + e.Message), 'Atenção', 0 + 64);
      end;
    end;

  finally
    vDadosIni.logsPedvenda(Self.ClassName + '.CONFIRMAR DOC - end ' +
    	trim(vtipo) + '-' + IntToStr(vnped), 'pedvenda');
  end;
end;

procedure TFrmCadPedVenda.SpeedButton7Click(Sender: TObject);
var
  sqlCommand: string;
begin
  if not SpeedButton7.Enabled then
    Exit;
  inherited;
  SpeedButton7.Enabled := False;
  try
    if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas) then
      Exit;

    sqlCommand := CadPedVenda.dataSet.CommandText;
    CadPedVenda.RollBackTransacao;
    CadPedVenda.abrePedVenda(CadPedVenda.dataSet.FieldByName('NPED').AsInteger);

    Screen.Cursor := crHourGlass;
    CadPedVenda.reabrirVenda;
  finally
    CadPedVenda.RollBackTransacao;
    CadPedVenda.montaSelect(sqlCommand);
    Screen.Cursor := crDefault;
    SpeedButton7.Enabled := True;
  end;
end;

procedure TFrmCadPedVenda.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if not vDadosIni.validarAcessoCadastrosEmpresas('PEDIDO_VENDA', 'A', CadPedVenda.buscas) then
    Exit;

  try
  	ckEmitirNFeDoc.Checked  := _LerConfiguracoesRegistroBoolean(ckEmitirNFeDoc.Name + trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString));
    ckEmitirNFCeDoc.Checked := _LerConfiguracoesRegistroBoolean(ckEmitirNFCeDoc.Name + trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString));
    ckEmitirNFSeDoc.Checked := _LerConfiguracoesRegistroBoolean(ckEmitirNFSeDoc.Name + trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString));

    ckEmitirNFSeDoc.Enabled :=
    	(trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'OS')
      and (vDadosIni.vEmp.vNfe.modeloNFServico = '55')
      and (CadPedVenda.verificarNFSe(CadPedVenda.dataSet.FieldByName('NPED').AsInteger,
      															 CadPedVenda.dataSet.FieldByName('TIPO').AsString,
                                     False));

    if not ckEmitirNFSeDoc.Enabled then
      ckEmitirNFSeDoc.Checked := False;

    if trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString) = 'OS' then
    	btEmitirDocOK.Hint := 'Sim - [VND267/VND252/VND268]'
    else
    	btEmitirDocOK.Hint := 'Sim - [VND266/VND136/VND268]';

    if not vDadosIni.abreForm('Atenção', pnEmitirDoc, tsConfirmarDoc) then
      exit;

    if (ckEmitirNFeDoc.Checked) then
    begin
      try
        Screen.Cursor := crHourGlass;
        CadPedVenda.emitirNotaDoPedido(False);
      finally
        Screen.Cursor := crDefault;
      end;
    end
		else if (ckEmitirNFCeDoc.Checked) then
    begin
      try
        Screen.Cursor := crHourGlass;
        if (vDadosIni.vFiscalAtivo = 'S') then
          CadPedVenda.enviarVendaParaCupom
        else if vDadosIni.vNFConsumidor.CodEmissor > 0 then
          CadPedVenda.enviarVendaParaNFCe;
      finally
        Screen.Cursor := crDefault;
      end;
    end;

    if ckEmitirNFSeDoc.Checked then
    begin
      if CadPedVenda.verificarNFSe(
          CadPedVenda.dataSet.FieldByName('NPED').AsInteger,
          CadPedVenda.dataSet.FieldByName('TIPO').AsString,
          False) then
      begin
        if vDadosIni.PesqPros('VND268', 'EMITIR NFS', CadPedVenda.getTipoVenda, 'PEDVENDA',
          CadPedVenda.dataSet.FieldByName('NPED').AsString, CadPedVenda.buscas, true) then
        begin
          CallerNFSeFeatures.Emitir( CadPedVenda.fint('nped'), False );
        end;
      end;
    end;

  finally
  	_GravaConfiguracoesBoolean(ckEmitirNFeDoc.Name + trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString), ckEmitirNFeDoc.Checked);
    _GravaConfiguracoesBoolean(ckEmitirNFCeDoc.Name + trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString), ckEmitirNFCeDoc.Checked);
  	_GravaConfiguracoesBoolean(ckEmitirNFSeDoc.Name + trim(CadPedVenda.dataSet.FieldByName('TIPO').AsString), ckEmitirNFSeDoc.Checked);
  end;
end;

procedure TFrmCadPedVenda.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if (CadPedVenda.vItProd.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
       Exit;
    application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes','Atenção',+0+64);
    if (Self.Enabled) and (Self.Visible) and (BitBtn19.CanFocus) then
      BitBtn19.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (GroupBox4.CanFocus) then
      GroupBox4.SetFocus;
    exit;
  end;
  try
    Screen.Cursor := crHourGlass;
//    Panel15.Enabled := False;
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
      Exit;                
  	//	if (Self.Enabled) and (Self.Visible) and (DBEdit25.CanFocus) then  
    //    DBEdit25.SetFocus;
    CadPedVenda.calculaDescontoAcrescimo;
    Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);

  finally Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmCadPedVenda.SpeedButtonLucratividadeClick(Sender: TObject);
begin
  inherited;
  if (CadPedVenda.vItProd.dataSet.State in [dsEdit, dsInsert]) then
  begin
    if (activecontrol = bitbtn5) or (activecontrol = bitbtn6) or (clicouNoX) then
       Exit;
    application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes','Atenção',+0+64);
    exit;
  end;
  
  if not vDadosIni.PesqPros('VND167', 'CONSULTA', '', 'PEDVENDA', '', CadPedVenda.buscas, False) then
  	Exit;
  CadPedVenda.vItProd.vListarImprimirItemVan := CadPedVenda.retornaVendaTipoVan;
  if CadPedVenda.vItProd.dataSet.IsEmpty then
  begin
  	ShowMessage('Não foram encontrados itens (produtos) na venda selecionada!');
  	Exit;
  end;
  if CadPedVenda.dataSet.FieldByName('STATUS_PED').AsString = 'CANCELADO' then
  	Exit;
  vDadosIni.vDtSetTmp := TClientDataSet(CadPedVenda.vItProd.dataSet);
	CadPedVenda.abreFormLucratividade;
end;

procedure TFrmCadPedVenda.SpeedButtonWhatsAppClick(Sender: TObject);
begin
	if (CadPedVenda.vItProd.dataSet.State in [dsEdit, dsInsert]) then
  begin
    application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes de enviar WhatsApp','Atenção',+0+64);
    if PageControl3.ActivePage = tsOrdemServ then
    begin
      pgOS.ActivePage := tsProdOS;
      tsProdOS.Show;
    end;
    exit;
  end;

  if (CadPedVenda.vItServ.dataSet.State in [dsEdit, dsInsert]) then
  begin
    application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes de enviar WhatsApp','Atenção',+0+64);
    pgOS.ActivePage := tsServOS;
    tsServOS.Show;
    exit;
  end;

  if (CadPedVenda.vItProdTerc.dataSet.State in [dsEdit, dsInsert]) then
  begin
  	application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes de enviar WhatsApp','Atenção',+0+64);
    pgOS.ActivePage := tsProdTercOS;
    tsProdTercOS.Show;
    exit;
  end;

  if (CadPedVenda.vItServTerc.dataSet.State in [dsEdit, dsInsert]) then
  begin
  	application.messagebox('Salve ou Cancele a alteração/inclusão do Item antes de enviar WhatsApp','Atenção',+0+64);
    pgOS.ActivePage := tsServTercOS;
    tsServTercOS.Show;
    exit;
  end;

	if not CadPedVenda.EnviarMensagemWhatsApp then
  	exit;
end;

procedure TFrmCadPedVenda.spSwitchDesc1Click(Sender: TObject);
begin
  inherited;
  pnDescValorOS.Visible := True;
  try
    if (Self.Enabled) and (Self.Visible) and (edDescProdValor.CanFocus) then
      edDescProdValor.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (edDescServValor.CanFocus) then
    	edDescServValor.CanFocus; 
  finally
    if (ActiveControl <> edDescProdValor) and (ActiveControl <> edDescServValor) then
      pnDescValorOS.Visible := False;
  end;
end;

procedure TFrmCadPedVenda.spSwitchAcrescClick(Sender: TObject);
begin
	inherited;
  pnAcrescValorOS.Visible := True;
  try
    if (Self.Enabled) and (Self.Visible) and (edAcrescProdValor.CanFocus) then
      edAcrescProdValor.SetFocus
    else if (Self.Enabled) and (Self.Visible) and (edAcrescServValor.CanFocus) then
    	edAcrescServValor.SetFocus;
  finally
    if (ActiveControl <> edAcrescProdValor) and (ActiveControl <> edAcrescServValor) then
      pnAcrescValorOS.Visible := False;
  end;
end;

procedure TFrmCadPedVenda.TabSheet10Enter(Sender: TObject);
begin
  inherited;
  //  if (activecontrol) then

end;

procedure TFrmCadPedVenda.TabSheet1Exit(Sender: TObject);
begin
  inherited;
  if Assigned(CadPedVenda) and ((not CheckBox4.Checked) or (CadPedVenda.getTipoVenda <> 'REQ')) then // quando é venda rapida a aba normal é aberta so para depois apresentar o venda rapida, esse codigo tambem existe no exit da aba do venda rapida
    CadPedVenda.vItProd.DevInternaReset();
 end;

procedure TFrmCadPedVenda.TabSheet20Show(Sender: TObject);
begin
  inherited;
  CadPedVenda.abrePedVenda(0);
end;

procedure TFrmCadPedVenda.TabSheet21Exit(Sender: TObject);
begin
  inherited;
  if Assigned(CadPedVenda) then
    CadPedVenda.vItProd.DevInternaReset();
end;

procedure TFrmCadPedVenda.TabSheet2Enter(Sender: TObject);
begin
  inherited;
  if Assigned(CadPedVenda) then
    CadPedVenda.onCalcValoresNF := nil;
end;

procedure TFrmCadPedVenda.Timer2Timer(Sender: TObject);
begin
  inherited;
  GroupBox5.Caption  := '';
  GroupBox66.Caption := '';

  Panel53.Visible  := True;
  Panel54.Visible  := True;
  Panel55.Visible  := True;
  Panel62.Visible  := True;
  Panel56.Visible  := True;
  Panel118.Visible := True;
  Panel119.Visible := True;

  Panel52.Visible  := True;
  Panel99.Visible  := True;
  Panel105.Visible := True;
  Panel107.Visible := True;
  Panel106.Visible := True;
  Panel120.Visible := True;
  Panel121.Visible := True;

  Timer2.Enabled := False;
end;

procedure TFrmCadPedVenda.TrackBar1Exit(Sender: TObject);
begin
  inherited;
  ActiveControl := DBEdit43;
end;

procedure TFrmCadPedVenda.TrackBar1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    if (Self.Enabled) and (Self.Visible) and (DBEdit43.CanFocus) then
	    DBEdit43.SetFocus;
end;

procedure TFrmCadPedVenda.tsKitShow(Sender: TObject);
begin
  inherited;
  tsKit.Tag:=0;
end;

procedure TFrmCadPedVenda.tsMecanicosOSExit(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn14.CanFocus) then
    BitBtn14.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn85.CanFocus) then
    BitBtn85.SetFocus;
end;

procedure TFrmCadPedVenda.tsOrdemServShow(Sender: TObject);
begin
  inherited;
  if tsOrdemServ.Tag = 1 then
    if (Self.Enabled) and (Self.Visible) and (DBLookupComboBox2.CanFocus) then
	    DBLookupComboBox2.SetFocus;
end;

procedure TFrmCadPedVenda.tsOSExit(Sender: TObject);
begin
  inherited;
  if (ActiveControl <> BitBtn4) and (ActiveControl <> BitBtn5) and (ActiveControl <> BitBtn6) and
    (ActiveControl <> DBEdit77) and (ActiveControl <> DBLookupComboBox2) and
    (ActiveControl <> DBEdit29) and (ActiveControl <> tsMecanicosOS) and
    (ActiveControl <> edDescProdValor) and (ActiveControl <> edDescServValor) and
    (ActiveControl <> DBGrid50) and (PageControl3.ActivePage <> tsMecanicosOS) and
    (PageControl3.Tag <> 1) and (ActiveControl <> DBEdit30) and
    (ActiveControl <> DBEdit31) and (not clicouNoX) then
  begin
    pgOS.TabIndex := pgOS.TabIndex + 1;
  end;
  PageControl3.Tag := 0;
end;

procedure TFrmCadPedVenda.tsOutrosOSShow(Sender: TObject);
begin
  inherited;
  Edit3.Text := CadPedVenda.getRegistroEntrega;
  if (Self.Enabled) and (Self.Visible) and (BitBtn42.CanFocus) then
	  BitBtn42.SetFocus;
end;

procedure TFrmCadPedVenda.tsProdOSShow(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn8.CanFocus) then
	  BitBtn8.SetFocus
  else if (Self.Enabled) and (Self.Visible) and (BitBtn10.CanFocus) then
	  BitBtn10.SetFocus;
end;

procedure TFrmCadPedVenda.tsProdTercOSShow(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn29.CanFocus) then
	  BitBtn29.SetFocus;
end;

procedure TFrmCadPedVenda.tsServOSShow(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn14.CanFocus) then
	  BitBtn14.SetFocus;
end;

procedure TFrmCadPedVenda.tsServTercOSShow(Sender: TObject);
begin
  inherited;
  if (Self.Enabled) and (Self.Visible) and (BitBtn33.CanFocus) then
	  BitBtn33.SetFocus;
end;

procedure TFrmCadPedVenda.tv_nf_valoresCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  inherited;
  if (Node.Level = 1) or (Copy(Node.Text,1 ,1 ) = '*') then
    Sender.Canvas.Font.Style := [FSBOLD];
end;

function TFrmCadPedVenda.verificarDescontoTabDifPromPrecoQtde(
  pValorUn: Double;
  pQtde: Double;
  pValorUnOrig: Double;
  pDescAcresc: string;
  pPercValor: string;
  pValorDescAcresc: Double;
  pPerguntar: boolean): boolean;
var
	vProcesso: string;
  vMensagem: string;
  vMensagem2: string;
	vAlterar: Boolean;
  vExibirDesconto: string;
  vAlterouPreco: boolean;
  vValorItem: Double;
begin
	Result := true;

  if CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'N' then
  	exit;

  if (CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString <> 'T')
  	and (CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString <> 'P')
    and (CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString <> 'Q') then
    	Exit;

  if (CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'T') then
  begin
  	vExibirDesconto := vDadosIni.vPedVnd.ExibirDesconto.PrecoDiferenciado;
    vProcesso       := 'VND285';
    vMensagem       := 'Produto definido com preço diferenciado, ';
    vMensagem2      := 'produto possui preço diferenciado';
  end
  else if (CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'P') then
  begin
    vExibirDesconto := vDadosIni.vPedVnd.ExibirDesconto.PrecoPromocao;
    vProcesso       := 'VND286';
    vMensagem       := 'Produto definido com preço de promoção, ';
    vMensagem2      := 'produto possui preço de promoção';
  end
  else if (CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'Q') then
  begin
  	vExibirDesconto := vDadosIni.vPedVnd.ExibirDesconto.PrecoQtde;
    vProcesso       := 'VND226';
    vMensagem       := 'Produto definido com preço por quantidade, ';
    vMensagem2      := 'produto possui preço por quantidade';
  end;

  if (UpperCase(trim(CadPedVenda.vItProd.dataSet.FieldByName('UNIDADE').AsString)) <> UpperCase(trim(CadPedVenda.vItProd.dataSet.FieldByName('UNIDADE_CONV').AsString))) then
  begin
  	if (CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').AsString = 'M') and (CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
	  begin
    	pQtde      := CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat;
    	pValorUn   := pValorUn * CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat;
    end
    else if (CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').AsString = 'D') and (CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
    begin
    	pQtde      := CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat;
    	pValorUn   := pValorUn / CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat;
    end
  end;

  if (vDadosIni.strIn(CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString, ['P', 'T', 'Q'])) then //and  (pDescAcresc = 'DESCONTO') then
  begin
  	if vExibirDesconto = 'S' then
  		pValorUnOrig   := CadPedVenda.vItProd._retornaValorItemOrig;

    vAlterouPreco := False;
    if vDadosIni.StrToFloatFormat(pValorUn, 2) <> vDadosIni.StrToFloatFormat(pValorUnOrig, 2) then
			vAlterouPreco := True;

    if vAlterouPreco then
    begin
      vDadosIni.vInibeMensPesqPros := 'S';
      if vDadosIni.PesqPros(vProcesso, 'HABILITAR', '', 'PEDVENDA', '', CadPedVenda.buscas, False) then
      begin
        if pPerguntar then
          vAlterar := (Application.MessageBox(PChar(vMensagem +
            'deseja alterar o valor do item para preço normal?'),
            'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes)
        else
          vAlterar := False;

        if not vAlterar then
        begin
          CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat := pValorUnOrig;

          if (CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').AsString = 'M') and (CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
          begin
          	CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat :=
            	CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat / CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat;
          end
          else if (CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').AsString = 'D') and (CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
    			begin
          	CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat :=
            	CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat * CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat;
          end
          else
          begin
            CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat :=
              CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat;
          end;

          if not CadPedVenda.vItProd.atualizarUnidadeQtdePrecoUnPorCampoPadrao then
            Exit;

          Application.MessageBox(PChar('Não é possível alterar valor do item, ' + vMensagem2 + chr(13) + 'Favor Verificar'),'Atenção', 0 + 64);
          Result := False;
          exit;
        end
        else
        begin
          CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString := 'N';
          CadPedVenda.vItProd.dataSet.FieldByName('MAX_DESC_TAB').AsCurrency := CadPedVenda.vItProd.vProduto.dataSet.FieldByName('MAX_DESC_ITEM').AsCurrency;
          CadPedVenda.vItProd.dataSet.FieldByName('PRECOPORQTDE').AsString := 'N';
          CadPedVenda.vItProd.dataSet.FieldByName('VALOR_DESCACRES').AsFloat := 0;
          CadPedVenda.vItProd.dataSet.FieldByName('DESC_ITEM').AsFloat := 0;

          CadPedVenda.vItProd.dataSet.FieldByName('USAR_DEBCRED').AsString :=
	        	IfThen(CadPedVenda.vItProd.vProduto.dataSet.FieldByName('USAR_DEBCRED').AsString = 'N',
  	        	'N', 'S');

          CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat := pValorUn;
          if (CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').AsString = 'M') and (CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
          begin
            CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat :=
          	  CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat * CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat;
          end
          else if (CadPedVenda.vItProd.dataSet.FieldByName('OPERACAO_CONV').AsString = 'D') and (CadPedVenda.vItProd.dataSet.FieldByName('FATOR_CONV').AsFloat > 0) then
          begin
            CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat :=
          	  CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat / CadPedVenda.vItProd.dataSet.FieldByName('QUANT_PED_ITEM').AsFloat;
          end
          else
          begin
          	CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat :=
              CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM_CONV').AsFloat;
          end;

          CadPedVenda.vItProd.dataSet.FieldByName('VLUN_ORIG').AsFloat     := CadPedVenda.vItProd.dataSet.FieldByName('VLUN_PED_ITEM').AsFloat;

          if not CadPedVenda.vItProd.atualizarUnidadeQtdePrecoUnPorCampoPadrao then
            Exit;
        end;
      end;
//      else
//      begin
//        Application.MessageBox(PChar('Não é possível alterar valor do item, ' + vMensagem2 + chr(13) + 'Favor Verificar'),'Atenção', 0 + 64);
//        Result := false;
//        exit;
//      end;
    end;
  end;
end;

procedure TFrmCadPedVenda.verificarItemRepetido(vQuant: string = '');
var
  vProcesso: string;
begin
  try
    if frmItemRepetido = nil then
    	Application.CreateForm(TfrmItemRepetido, frmItemRepetido);

    vDadosIni.AlterarDataSourceComponentes(frmItemRepetido, CadPedVenda.DtmPed);

    frmItemRepetido.Label2.Caption := CadPedVenda.vItProd.dataSet.FieldByName('descr_prod_ped').AsString;
    frmItemRepetido.Label3.Caption := CadPedVenda.vItProd.dataSet.FieldByName('grupo_prod').AsString;
    frmItemRepetido.Label4.Caption := CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString;
    frmItemRepetido.Label5.Caption := CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString;
    frmItemRepetido.Label7.Caption := IntToStr(CadPedVenda.vItProd.dataSet.FieldByName('nitem').AsInteger);
    frmItemRepetido.Label9.Caption := FloatToStr(vDadosIni.StrToFloatFormat(CadPedVenda.vItProd.dataSet.FieldByName('quant_ped_item_conv').AsFloat, 3));
    frmItemRepetido.Label11.Caption := Format('%m', [CadPedVenda.vItProd.dataSet.FieldByName('vlun_ped_item_conv').AsFloat]);
    frmItemRepetido.Label13.Caption := Format('%m', [CadPedVenda.vItProd.dataSet.FieldByName('vltot_ped_item').AsFloat]);
    frmItemRepetido.Label15.Caption := UpperCase(trim(CadPedVenda.vItProd.dataSet.FieldByName('unidade_conv').AsString));
    if CadPedVenda.getTipoVenda = 'REQ' then
   	vProcesso := 'VND229'
    else if CadPedVenda.getTipoVenda = 'OS' then
      vProcesso := 'VND230'
    else
      vProcesso := 'VND231';
    frmItemRepetido.BitBtn1.Hint := 'Adicionar quantidade ao item - [' + vProcesso + ']';
    if ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'ORC')) and (CheckBox4.Checked) then
      frmItemRepetido.BitBtn18.Hint := 'Alterar item - [VND228]'
    else if CadPedVenda.getTipoVenda = 'REQ' then
      frmItemRepetido.BitBtn18.Hint := 'Alterar item - [VND011]'
    else if CadPedVenda.getTipoVenda = 'OS' then
      frmItemRepetido.BitBtn18.Hint := 'Alterar item - [VND015]'
    else
      frmItemRepetido.BitBtn18.Hint := 'Alterar item - [VND019]';
    frmItemRepetido.ShowHint := true;
    if frmItemRepetido.ShowModal = IDOK then
    begin
      if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'ITEMREPETIDOALTERAR' then
      begin
         if ((CadPedVenda.getTipoVenda = 'REQ') or (CadPedVenda.getTipoVenda = 'ORC')) and (CheckBox4.Checked) then
			  alterarItemVendaRapida
         else if ((CadPedVenda.getTipoVenda = 'REQ') or ((CadPedVenda.getTipoVenda = 'ORC') and (CadPedVenda.OrcamentoSoPecas))) then
           BitBtn18.Click
         else
           BitBtn10.Click;
      end
      else if vDadosIni.getCampoPipe(vDadosIni.vPesquisa, 1) = 'ITEMREPETIDOADICIONAR' then
      begin
        CadPedVenda.vItProd.adicionarQtdeItem(vQuant);
        CadPedVenda.calculaTotais;
        Label36.Caption := Format('%m', [CadPedVenda.getValorVendaBruta]);
        eSubTotal.Valor := CadPedVenda.dataSet.FieldByName('valor_total').AsCurrency;
        GroupBox7.Enabled := true;
        if (pgOS.ActivePage = tsProdOS) then
        begin
//          Panel16.Enabled := false;
          DBGrid3.Enabled:= not(CadPedVenda.vItProd.dataSet.State in [dsInsert, dsEdit]);
          GroupBox16.Enabled := true;
          GroupBox14.Enabled := true;
          if (Self.Enabled) and (Self.Visible) and (DBGrid3.CanFocus) then
            DBGrid3.SetFocus;
        end
        else if ((PageControl1.ActivePage = TabSheet20) and (CadPedVenda.getTipoVenda = 'OS')) then
        begin
          CadPedVenda.calculaTotais;
          if (Self.Enabled) and (Self.Visible) and (DBGrid13.CanFocus) then
            DBGrid13.SetFocus;
          Panel22.Visible := false;
          Panel23.Visible := false;
          BitBtn70.Click;
        end;
      end;
    end
    else
    begin
        if not (CadPedVenda.vItProd.dataSet.State in [dsInsert, dsedit]) then
          CadPedVenda.vItProd.dataSet.Edit;
        if ((PageControl1.ActivePage = TabSheet20) and (CadPedVenda.getTipoVenda = 'OS')) then
           BitBtn50.Click
        else if ((CadPedVenda.getTipoVenda = 'REQ') or ((CadPedVenda.getTipoVenda = 'ORC') and (CadPedVenda.OrcamentoSoPecas))) then
           BitBtn19.Click
        else
        begin
           if (Self.Enabled) and (Self.Visible) and (GroupBox24.CanFocus) then
             GroupBox24.SetFocus;
           BitBtn11.Click;
        end;
    end;
  finally
     vDadosIni.vPesquisa := '';
  end;
end;

function TFrmCadPedVenda.verificarUnidadeTabDifPromPrecoQtde(pUnidade: string): boolean;
begin
	Result := true;

	if (CadPedVenda.vItProd.vUsarPrecoProdPorQtde)
  	and (CadPedVenda.vItProd.dataSet.FieldByName('PRECOPORQTDE').AsString = 'S') then
  begin
    if (UpperCase(trim(pUnidade)) <> UpperCase(trim(CadPedVenda.vItProd.dataSet.FieldByName('UNIDADE').AsString))) then
    begin
    	if not CadPedVenda.vItProd.buscaProduto(
      	CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString,
        CadPedVenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger,
        CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString,
        CadPedVenda.vItProd.dataSet.FieldByName('cod_grade').AsInteger,
        false,
        false,
        false) then
        	exit;
    end;
  end
	else if (CadPedVenda.vItProd.vUsarPrecoProdPorQtde) and (CadPedVenda.vItProd.vPrecoProdPorQtde > 0)
  	and (CadPedVenda.vItProd.dataSet.FieldByName('PRECOPORQTDE').AsString = 'S') then
  begin
    if (UpperCase(trim(pUnidade)) <> UpperCase(trim(CadPedVenda.vItProd.dataSet.FieldByName('UNIDADE').AsString))) then
    begin
    	if not CadPedVenda.vItProd.buscaProduto(
      	CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString,
        CadPedVenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger,
        CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString,
        CadPedVenda.vItProd.dataSet.FieldByName('cod_grade').AsInteger,
        false,
        false,
        false) then
        	exit;
    end;
  end
  else if (CadPedVenda.vItProd.vUsarPrecoProdPorQtde) and (CadPedVenda.vItProd.vPrecoProdPorQtde > 0)
  	and (CadPedVenda.vItProd.dataSet.FieldByName('TABPRATICADA').AsString = 'Q') then
  begin
    if (UpperCase(trim(pUnidade)) <> UpperCase(trim(CadPedVenda.vItProd.dataSet.FieldByName('UNIDADE').AsString))) then
    begin
      if not CadPedVenda.vItProd.buscaProduto(
      	CadPedVenda.vItProd.dataSet.FieldByName('num_fab_prod').AsString,
        CadPedVenda.vItProd.dataSet.FieldByName('grupo_prod').AsInteger,
        CadPedVenda.vItProd.dataSet.FieldByName('cod_prod').AsString,
        CadPedVenda.vItProd.dataSet.FieldByName('cod_grade').AsInteger,
        false,
        false,
        false) then
        	exit;
    end;
  end;
end;

procedure TFrmCadPedVenda._marcaCamposConfig;
begin
  CadPedVenda.rConfigCampos.vVLInicialAtivado := false;
  if ((CadPedVenda.dataSet.FieldByName('TOT_SERV').Tag = 0) or (CadPedVenda.dataSet.FieldByName('TOT_SERV').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaTOT_SERV').Name) = UpperCase('cdsPedVendaTOT_SERV') then
      TCheckBox(FindComponent('cdsPedVendaTOT_SERV')).Checked := CadPedVenda.rConfigCampos.vTOT_SERV;
  if ((CadPedVenda.dataSet.FieldByName('TIPO_OS').Tag = 0) or (CadPedVenda.dataSet.FieldByName('TIPO_OS').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaTIPO_OS').Name) = UpperCase('cdsPedVendaTIPO_OS') then
      TCheckBox(FindComponent('cdsPedVendaTIPO_OS')).Checked := CadPedVenda.rConfigCampos.vTIPO_OS;
  if ((CadPedVenda.dataSet.FieldByName('OBS_OS').Tag = 0) or (CadPedVenda.dataSet.FieldByName('OBS_OS').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaOBS_OS').Name) = UpperCase('cdsPedVendaOBS_OS') then
      TCheckBox(FindComponent('cdsPedVendaOBS_OS')).Checked := CadPedVenda.rConfigCampos.vOBS_OS;
  if ((CadPedVenda.dataSet.FieldByName('OBS_OS').Tag = 0) or (CadPedVenda.dataSet.FieldByName('OBS_OS').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaOBS_OS').Name) = UpperCase('cdsPedVendaOBS_OS') then
      TCheckBox(FindComponent('cdsPedVendaOBS_OS')).Checked := CadPedVenda.rConfigCampos.vOBS_OS;
  if ((CadPedVenda.dataSet.FieldByName('TIPO_ORC').Tag = 0) or (CadPedVenda.dataSet.FieldByName('TIPO_ORC').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaTIPO_ORC').Name) = UpperCase('cdsPedVendaTIPO_ORC') then
      TCheckBox(FindComponent('cdsPedVendaTIPO_ORC')).Checked := CadPedVenda.rConfigCampos.vTIPO_ORC;
  if ((CadPedVenda.dataSet.FieldByName('NOME_CLI_ORC').Tag = 0) or (CadPedVenda.dataSet.FieldByName('NOME_CLI_ORC').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaNOME_CLI_ORC').Name) = UpperCase('cdsPedVendaNOME_CLI_ORC') then
      TCheckBox(FindComponent('cdsPedVendaNOME_CLI_ORC')).Checked := CadPedVenda.rConfigCampos.vNOME_CLI_ORC; ;
  if ((CadPedVenda.dataSet.FieldByName('DESC_P_SERV').Tag = 0) or (CadPedVenda.dataSet.FieldByName('DESC_P_SERV').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaDESC_P_SERV').Name) = UpperCase('cdsPedVendaDESC_P_SERV') then
      TCheckBox(FindComponent('cdsPedVendaDESC_P_SERV')).Checked := CadPedVenda.rConfigCampos.vDESC_P_SERV;
  if ((CadPedVenda.dataSet.FieldByName('ACRESC_P_SERV').Tag = 0) or (CadPedVenda.dataSet.FieldByName('ACRESC_P_SERV').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaACRESC_P_SERV').Name) = UpperCase('cdsPedVendaACRESC_P_SERV') then
      TCheckBox(FindComponent('cdsPedVendaACRESC_P_SERV')).Checked := CadPedVenda.rConfigCampos.vACRESC_P_SERV;
  if ((CadPedVenda.dataSet.FieldByName('PLACA').Tag = 0) or (CadPedVenda.dataSet.FieldByName('PLACA').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaPLACA').Name) = UpperCase('cdsPedVendaPLACA') then
      TCheckBox(FindComponent('cdsPedVendaPLACA')).Checked := CadPedVenda.rConfigCampos.vPLACA;
  if ((CadPedVenda.dataSet.FieldByName('CHASSI').Tag = 0) or (CadPedVenda.dataSet.FieldByName('CHASSI').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaCHASSI').Name) = UpperCase('cdsPedVendaCHASSI') then
      TCheckBox(FindComponent('cdsPedVendaCHASSI')).Checked := CadPedVenda.rConfigCampos.vCHASSI;
  if ((CadPedVenda.dataSet.FieldByName('COD_EQUIP').Tag = 0) or (CadPedVenda.dataSet.FieldByName('COD_EQUIP').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaCOD_EQUIP').Name) = UpperCase('cdsPedVendaCOD_EQUIP') then
      TCheckBox(FindComponent('cdsPedVendaCOD_EQUIP')).Checked := CadPedVenda.rConfigCampos.vCOD_EQUIP;
  if ((CadPedVenda.dataSet.FieldByName('COD_VEICULO').Tag = 0) or (CadPedVenda.dataSet.FieldByName('COD_VEICULO').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaCOD_VEICULO').Name) = UpperCase('cdsPedVendaCOD_VEICULO') then
      TCheckBox(FindComponent('cdsPedVendaCOD_VEICULO')).Checked := CadPedVenda.rConfigCampos.vCOD_VEICULO;
  if ((CadPedVenda.dataSet.FieldByName('APARELHO_PED').Tag = 0) or (CadPedVenda.dataSet.FieldByName('APARELHO_PED').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaAPARELHO_PED').Name) = UpperCase('cdsPedVendaAPARELHO_PED') then
      TCheckBox(FindComponent('cdsPedVendaAPARELHO_PED')).Checked := CadPedVenda.rConfigCampos.vAPARELHO_PED;
  if ((CadPedVenda.dataSet.FieldByName('STAT_REQ').Tag = 0) or (CadPedVenda.dataSet.FieldByName('STAT_REQ').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaSTAT_REQ').Name) = UpperCase('cdsPedVendaSTAT_REQ') then
      TCheckBox(FindComponent('cdsPedVendaSTAT_REQ')).Checked := CadPedVenda.rConfigCampos.vSTAT_REQ;
  if ((CadPedVenda.dataSet.FieldByName('KM_V').Tag = 0) or (CadPedVenda.dataSet.FieldByName('KM_V').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaKM_V').Name) = UpperCase('cdsPedVendaKM_V') then
      TCheckBox(FindComponent('cdsPedVendaKM_V')).Checked := CadPedVenda.rConfigCampos.vKM_V;
  if ((CadPedVenda.dataSet.FieldByName('DT_PROMETIDA').Tag = 0) or (CadPedVenda.dataSet.FieldByName('DT_PROMETIDA').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaDT_PROMETIDA').Name) = UpperCase('cdsPedVendaDT_PROMETIDA') then
      TCheckBox(FindComponent('cdsPedVendaDT_PROMETIDA')).Checked := CadPedVenda.rConfigCampos.vDT_PROMETIDA;
  if ((CadPedVenda.dataSet.FieldByName('GUARDA_VOL').Tag = 0) or (CadPedVenda.dataSet.FieldByName('GUARDA_VOL').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaGUARDA_VOL').Name) = UpperCase('cdsPedVendaGUARDA_VOL') then
      TCheckBox(FindComponent('cdsPedVendaGUARDA_VOL')).Checked := CadPedVenda.rConfigCampos.vGUARDA_VOL;
  if ((CadPedVenda.dataSet.FieldByName('COMBUST_VEIC').Tag = 0) or (CadPedVenda.dataSet.FieldByName('COMBUST_VEIC').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaCOMBUST_VEIC').Name) = UpperCase('cdsPedVendaCOMBUST_VEIC') then
      TCheckBox(FindComponent('cdsPedVendaCOMBUST_VEIC')).Checked := CadPedVenda.rConfigCampos.vCOMBUST_VEIC;
  if ((CadPedVenda.dataSet.FieldByName('DEFEITO').Tag = 0) or (CadPedVenda.dataSet.FieldByName('DEFEITO').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaDEFEITO').Name) = UpperCase('cdsPedVendaDEFEITO') then
      TCheckBox(FindComponent('cdsPedVendaDEFEITO')).Checked := CadPedVenda.rConfigCampos.vDEFEITO;
  if ((CadPedVenda.dataSet.FieldByName('ESTADO_VEIC').Tag = 0) or (CadPedVenda.dataSet.FieldByName('ESTADO_VEIC').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaESTADO_VEIC').Name) = UpperCase('cdsPedVendaESTADO_VEIC') then
      TCheckBox(FindComponent('cdsPedVendaESTADO_VEIC')).Checked := CadPedVenda.rConfigCampos.vESTADO_VEIC;
  if ((CadPedVenda.dataSet.FieldByName('ACESSORIOS').Tag = 0) or (CadPedVenda.dataSet.FieldByName('ACESSORIOS').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaACESSORIOS').Name) = UpperCase('cdsPedVendaACESSORIOS') then
      TCheckBox(FindComponent('cdsPedVendaACESSORIOS')).Checked := CadPedVenda.rConfigCampos.vACESSORIOS;
  if ((CadPedVenda.dataSet.FieldByName('H_ENT').Tag = 0) or (CadPedVenda.dataSet.FieldByName('H_ENT').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaH_ENT').Name) = UpperCase('cdsPedVendaH_ENT') then
      TCheckBox(FindComponent('cdsPedVendaH_ENT')).Checked := CadPedVenda.rConfigCampos.vH_ENT;
  if ((CadPedVenda.dataSet.FieldByName('H_PROMETIDA').Tag = 0) or (CadPedVenda.dataSet.FieldByName('H_PROMETIDA').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaH_PROMETIDA').Name) = UpperCase('cdsPedVendaH_PROMETIDA') then
      TCheckBox(FindComponent('cdsPedVendaH_PROMETIDA')).Checked := CadPedVenda.rConfigCampos.vH_PROMETIDA;
  if ((CadPedVenda.dataSet.FieldByName('OBS_LIVRO_REG').Tag = 0) or (CadPedVenda.dataSet.FieldByName('OBS_LIVRO_REG').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaOBS_LIVRO_REG').Name) = UpperCase('cdsPedVendaOBS_LIVRO_REG') then
      TCheckBox(FindComponent('cdsPedVendaOBS_LIVRO_REG')).Checked := CadPedVenda.rConfigCampos.vOBS_LIVRO_REG;
  if ((CadPedVenda.dataSet.FieldByName('OBS_RED_OS').Tag = 0) or (CadPedVenda.dataSet.FieldByName('OBS_RED_OS').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaOBS_RED_OS').Name) = UpperCase('cdsPedVendaOBS_RED_OS') then
      TCheckBox(FindComponent('cdsPedVendaOBS_RED_OS')).Checked := CadPedVenda.rConfigCampos.vOBS_RED_OS;
  if ((CadPedVenda.dataSet.FieldByName('NUM_NFEEXT').Tag = 0) or (CadPedVenda.dataSet.FieldByName('NUM_NFEEXT').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaNUM_NFEEXT').Name) = UpperCase('cdsPedVendaNUM_NFEEXT') then
      TCheckBox(FindComponent('cdsPedVendaNUM_NFEEXT')).Checked := CadPedVenda.rConfigCampos.vNUM_NFEEXT;
  if ((CadPedVenda.dataSet.FieldByName('DATA_NFEXT').Tag = 0) or (CadPedVenda.dataSet.FieldByName('DATA_NFEXT').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaDATA_NFEXT').Name) = UpperCase('cdsPedVendaDATA_NFEXT') then
      TCheckBox(FindComponent('cdsPedVendaDATA_NFEXT')).Checked := CadPedVenda.rConfigCampos.vDATA_NFEXT;
  if ((CadPedVenda.dataSet.FieldByName('VALOR_NFEXT').Tag = 0) or (CadPedVenda.dataSet.FieldByName('VALOR_NFEXT').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaVALOR_NFEXT').Name) = UpperCase('cdsPedVendaVALOR_NFEXT') then
      TCheckBox(FindComponent('cdsPedVendaVALOR_NFEXT')).Checked := CadPedVenda.rConfigCampos.vVALOR_NFEXT;
  if ((CadPedVenda.dataSet.FieldByName('EM_NF').Tag = 0) or (CadPedVenda.dataSet.FieldByName('EM_NF').Tag = 3)) then
    if UpperCase(FindComponent('cdsPedVendaEM_NF').Name) = UpperCase('cdsPedVendaEM_NF') then
      TCheckBox(FindComponent('cdsPedVendaEM_NF')).Checked := CadPedVenda.rConfigCampos.vEM_NF;

end;

function TFrmCadPedVenda._mdiAberto(pNomeFormMDI, pMensagem: string): Boolean;
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

procedure TFrmCadPedVenda.DBGrid25KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
//  if Key = VK_SPACE then
//    if not CadPedVenda.vRVnd.vOpPag.IsEmpty then
//      CadPedVenda.vRVnd.vOpPag._marcaDesmarcaLinha;
end;

initialization
  RegisterClass(TFrmCadPedVenda);
finalization
  UnRegisterClass(TFrmCadPedVenda);

end.

