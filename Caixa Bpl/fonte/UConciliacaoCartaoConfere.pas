unit UConciliacaoCartaoConfere;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPadrao, ComCtrls, Grids, DBGrids, Gauges, StdCtrls, Mask, Buttons, uclassesconciliacartao, 
  DBClient, IBDatabase, Menus, ExtCtrls, DBCtrls, QRCtrls, grimgctrl, qrpctrls,
  QuickRpt;

type
  TFrmConciliaCartaoConfere = class(TfrmPadrao)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBoxFinanceiro: TGroupBox;
    GroupBox5: TGroupBox;
    BitBtn_QuitarCreditos: TBitBtn;
    BitBtn_ExportarExcel: TBitBtn;
    lbl_statusProc: TLabel;
    Gauge_HistoricoRetorno: TGauge;
    GroupBox2: TGroupBox;
    ScrollBox1: TScrollBox;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    Configurarcolunas1: TMenuItem;
    ResetarConfiguraesdecolunas1: TMenuItem;
    SalvardadosnoExcel1: TMenuItem;
    ReajustarLarguradascolunas1: TMenuItem;
    Copiarparareadetransferncia1: TMenuItem;
    Somarvaloresdacoluna1: TMenuItem;
    pnStatusProcessamento: TPanel;
    lbStatusProcessamento: TLabel;
    lbTextoProcessamento: TLabel;
    BitBtnSairTelaFinanc: TBitBtn;
    GroupBoxPendencias: TGroupBox;
    GroupBox3: TGroupBox;
    BitBtnSairTelaPendenc: TBitBtn;
    PopupMenu2: TPopupMenu;
    Configurarcolunas2: TMenuItem;
    ResetarConfiguraesdecolunas2: TMenuItem;
    SalvardadosnoExcel2: TMenuItem;
    ReajustarLarguradascolunas2: TMenuItem;
    Copiarparareadetransferncia2: TMenuItem;
    Somarvaloresdacoluna2: TMenuItem;
    GroupBox7: TGroupBox;
    pnBtnBuscarFinanceiros: TPanel;
    pnOpcoesTopFinanc: TPanel;
    pnUnificadasFinanc: TPanel;
    lbUnificadasFinanc: TLabel;
    DBLookupComboBoxUnificadasFinanc: TDBLookupComboBox;
    pnAdministradoraFinanc: TPanel;
    lbDataInicialFinanc: TLabel;
    lbDataFinalFinanc: TLabel;
    lbAdmCartaoFinanc: TLabel;
    meDtInicialFinanc: TMaskEdit;
    meDtFinalFinanc: TMaskEdit;
    DBLookupComboBoxAdmCartaoFinanc: TDBLookupComboBox;
    DBLookupComboBoxBandeiraFinanc: TDBLookupComboBox;
    lbBandeiraFinanc: TLabel;
    TabSheet3: TTabSheet;
    GroupBox8: TGroupBox;
    BitBtnSairTelaErros: TBitBtn;
    MemoErros: TMemo;
    pnDBGridPendConfere: TPanel;
    Splitter1: TSplitter;
    pnDBGridPendCreditos: TPanel;
    pnBtnBuscarPendencias: TPanel;
    pnOpcoesTopPend: TPanel;
    pnUnificadasPendenc: TPanel;
    lbUnificadasPendenc: TLabel;
    DBLookupComboBoxUnificadasPendenc: TDBLookupComboBox;
    pnAdministradoraPendenc: TPanel;
    lbAdmCartaoPendenc: TLabel;
    DBLookupComboBoxAdmCartaoPendenc: TDBLookupComboBox;
    DBLookupComboBoxBandeiraPendenc: TDBLookupComboBox;
    lbBandeiraPendenc: TLabel;
    PopupMenu3: TPopupMenu;
    Configurarcolunas3: TMenuItem;
    ResetarConfiguraesdecolunas3: TMenuItem;
    SalvardadosnoExcel3: TMenuItem;
    ReajustarLarguradascolunas3: TMenuItem;
    Copiarparareadetransferncia3: TMenuItem;
    Somarvaloresdacoluna3: TMenuItem;
    pnListaPend: TPanel;
    GroupBox6: TGroupBox;
    ScrollBox2: TScrollBox;
    DBGrid2: TDBGrid;
    pnListaPendCreditos: TPanel;
    GroupBox9: TGroupBox;
    ScrollBox3: TScrollBox;
    DBGrid3: TDBGrid;
    bt_financeiro_goto_confere: TSpeedButton;
    bt_financeiro_goto_sistema: TSpeedButton;
    bt_financeiro_vincular_confere: TSpeedButton;
    bt_financeiro_gotocancel_sistema: TSpeedButton;
    bt_financeiro_pesquisar_confere: TSpeedButton;
    bt_financeiro_gotocancel_confere: TSpeedButton;
    bt_financeiro_vincular_sistema: TSpeedButton;
    SpeedButton2: TSpeedButton;
    pnPendente: TPanel;
    pnFinanceiroConfere: TPanel;
    pnDivergenciaData: TPanel;
    pnDivergenciaValor: TPanel;
    TabSheet5: TTabSheet;
    GroupBoxPendenciasExcluir: TGroupBox;
    Panel1: TPanel;
    BitBtn_BuscarPendencExcluir: TBitBtn;
    Panel2: TPanel;
    pnUnificadasPendencExcluir: TPanel;
    lbUnificadasPendencExcluir: TLabel;
    DBLookupComboBoxUnificadasPendencExcluir: TDBLookupComboBox;
    pnAdministradoraPendencExcluir: TPanel;
    lbAdmCartaoPendencExcluir: TLabel;
    lbBandeiraPendencExcluir: TLabel;
    DBLookupComboBoxAdmCartaoPendencExcluir: TDBLookupComboBox;
    DBLookupComboBoxBandeiraPendencExcluir: TDBLookupComboBox;
    GroupBoxPendConfereExcluir: TGroupBox;
    BitBtnVoltarTelaPendencExcluir: TBitBtn;
    pnDBGridPendConfereExcluir: TPanel;
    pnListaPendExcluir: TPanel;
    btSelTodosPendencExcluir: TSpeedButton;
    btDesTodosPendencExcluir: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel5: TPanel;
    lbDataInicialPendencExcluir: TLabel;
    meDtInicialPendencExcluir: TMaskEdit;
    lbDataFinalPendencExcluir: TLabel;
    meDtFinalPendencExcluir: TMaskEdit;
    lbNSUPendencExcluir: TLabel;
    edNSUPendencExlcuir: TEdit;
    lbNumAutPendencExcluir: TLabel;
    edNumAutPendencExcluir: TEdit;
    BitBtn_ContasAjuste: TBitBtn;
    TabSheet4: TTabSheet;
    pnDBGridPendDataConfere: TPanel;
    pnListaPendData: TPanel;
    GroupBox4: TGroupBox;
    ScrollBox4: TScrollBox;
    DBGrid4: TDBGrid;
    PopupMenu4: TPopupMenu;
    Configurarcolunas4: TMenuItem;
    ResetarConfiguraesdecolunas4: TMenuItem;
    SalvardadosnoExcel4: TMenuItem;
    ReajustarLarguradascolunas4: TMenuItem;
    Copiarparareadetransferncia4: TMenuItem;
    Somarvaloresdacoluna4: TMenuItem;
    GroupBox10: TGroupBox;
    BitBtnSairTelaPendencData: TBitBtn;
    Label2: TLabel;
    ComboBoxEventoFinanc: TComboBox;
    bt_resolver_pendencias: TSpeedButton;
    TabSheet6: TTabSheet;
    pnDBGridResolverPendencias: TPanel;
    GroupBoxResolverPendencias: TGroupBox;
    BitBtnVoltarTelaResolverPendencias: TBitBtn;
    pnResolverPendencias: TPanel;
    GroupBox1: TGroupBox;
    ScrollBox5: TScrollBox;
    DBGrid5: TDBGrid;
    PopupMenu5: TPopupMenu;
    Configurarcolunas5: TMenuItem;
    ResetarConfiguraesdecolunas5: TMenuItem;
    SalvardadosnoExcel5: TMenuItem;
    ReajustarLarguradascolunas5: TMenuItem;
    Copiarparareadetransferncia5: TMenuItem;
    Somarvaloresdacoluna5: TMenuItem;
    btSelectAllResolverPend: TSpeedButton;
    btUnSelectAllResolverPend: TSpeedButton;
    BitBtn4: TBitBtn;
    pnConfere: TPanel;
    pnERP: TPanel;
    TabSheet12: TTabSheet;
    pnCreditosQuitados: TPanel;
    pnDBGridCreditosQuitados: TPanel;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    ScrollBox12: TScrollBox;
    DBGrid12: TDBGrid;
    BitBtnSairTelaCreditosQuitados: TBitBtn;
    PopupMenu12: TPopupMenu;
    Configurarcolunas12: TMenuItem;
    ResetarConfiguraesdecolunas12: TMenuItem;
    SalvardadosnoExcel12: TMenuItem;
    ReajustarLarguradascolunas12: TMenuItem;
    Copiarparareadetransferncia12: TMenuItem;
    Somarvaloresdacoluna12: TMenuItem;
    Panel4: TPanel;
    lbDesPendenciaConfere: TLabel;
    lbCreditosNaoEncontrado: TLabel;
    btDesPendenciaConfere: TSpeedButton;
    btCreditosNaoEncontrado: TSpeedButton;
    lbCreditosDivergenciaData: TLabel;
    btCreditosDivergenciaData: TSpeedButton;
    lbCreditosQuitados: TLabel;
    btCreditosQuitados: TSpeedButton;
    Panel6: TPanel;
    lbDescTotAjustePositivo: TLabel;
    lbDescTotAjusteNegativo: TLabel;
    edTotComissoesLiq: TEdit;
    edTotAjustePositivoLiq: TEdit;
    edTotAjusteNegativoLiq: TEdit;
    ckLancarComissoes: TCheckBox;
    ckLancarAjustePositivo: TCheckBox;
    ckLancarAjusteNegativo: TCheckBox;
    BitBtn_Imprimir: TBitBtn;
    TabSheet7: TTabSheet;
    PageControl2: TPageControl;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    QuickRep_Conciliacao: TQuickRep;
    DetailBand1: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel_n_doc_c: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRPLabel1: TQRPLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRHRule1: TQRHRule;
    QRHRule2: TQRHRule;
    lbEmpresa: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel7: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel31: TQRLabel;
    QRLabel_Valor: TQRLabel;
    QRLabel_ValorLiquido: TQRLabel;
    QRShape6: TQRShape;
    QuickRep_Conciliacao1: TQuickRep;
    DetailBand2: TQRBand;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRLabel_n_doc: TQRLabel;
    PageHeaderBand2: TQRBand;
    QRPLabel2: TQRPLabel;
    QRSysData3: TQRSysData;
    QRLabel27: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel28: TQRLabel;
    lbEmpresa1: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRHRule3: TQRHRule;
    QRHRule4: TQRHRule;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel55: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel56: TQRLabel;
    QRDBText32: TQRDBText;
    QRLabel57: TQRLabel;
    PageFooterBand2: TQRBand;
    QRLabel59: TQRLabel;
    QRLabel_vl: TQRLabel;
    QRLabel_VlLiquido: TQRLabel;
    QRShape1: TQRShape;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel60: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRDBText34: TQRDBText;
    QRLabel49: TQRLabel;
    QRLabel48: TQRLabel;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText33: TQRDBText;
    lbInfDataHoraApi: TLabel;
    lbDataHoraApi: TLabel;
    SpeedButtonAtualizarApi: TSpeedButton;
    BitBtn_BuscarFinanc: TBitBtn;
    BitBtn_EmpresaAdq: TBitBtn;
    lbDescTotComissoes: TLabel;
    BitBtn_TipoLanc: TBitBtn;
    lbNumEstCartaoFinanc: TLabel;
    DBLookupComboBoxNumEstFinanc: TDBLookupComboBox;
    lbNumEstCartaoPendenc: TLabel;
    DBLookupComboBoxNumEstPendenc: TDBLookupComboBox;
    Label6: TLabel;
    DBLookupComboBoxNumEstPendencExcluir: TDBLookupComboBox;
    btSelectAll: TSpeedButton;
    btUnSelectAll: TSpeedButton;
    btSomarFinanc: TSpeedButton;
    TabSheet10: TTabSheet;
    pnTotalFinanceiro: TPanel;
    Panel34: TPanel;
    BitBtn19: TBitBtn;
    lbTotalVendas: TLabel;
    lbTotalAntecipacoes: TLabel;
    lbTotalCancelamentos: TLabel;
    lbTotalChargeback: TLabel;
    lbTotalAjustePositivo: TLabel;
    lbTotalAjusteNegativo: TLabel;
    lbTotal: TLabel;
    lbDescTotalVendas: TLabel;
    lbDescTotalAntecipacoes: TLabel;
    lbDescTotalCancelamentos: TLabel;
    lbDescTotalChargeback: TLabel;
    lbDescTotalAjustePositivo: TLabel;
    lbDescTotalAjusteNegativo: TLabel;
    lbDescTotal: TLabel;
    lbDescTotalPendencia: TLabel;
    lbDescTotalQuitado: TLabel;
    lbTotalPendencia: TLabel;
    lbTotalQuitado: TLabel;
    GroupBox13: TGroupBox;
    lbDescVendas: TLabel;
    lbTotVendasLiq: TLabel;
    lbDescAntecipacoes: TLabel;
    lbTotAntecipacoesLiq: TLabel;
    lbDescCancelamentos: TLabel;
    lbTotCancelamentosLiq: TLabel;
    lbDescChargeBack: TLabel;
    lbTotChargeBackLiq: TLabel;
    lbTotVendasBruto: TLabel;
    lbTotAntecipacoesBruto: TLabel;
    lbTotCancelamentosBruto: TLabel;
    lbTotChargeBackBruto: TLabel;
    lbDescPagoOperadora: TLabel;
    lbPagoOperadora: TLabel;
    lbDescPendencia: TLabel;
    lbTotPendenciaLiq: TLabel;
    lbDescAjustePos: TLabel;
    lbDescAjusteNeg: TLabel;
    lbTotAjustePosLiq: TLabel;
    lbTotAjusteNegLiq: TLabel;
    GroupBox14: TGroupBox;
    lbDescVendasAdm: TLabel;
    lbDescAntecipacoesAdm: TLabel;
    lbDescCancelamentosAdm: TLabel;
    lbDescChargeBackAdm: TLabel;
    lbDescAjustePosAdm: TLabel;
    lbDescAjusteNegAdm: TLabel;
    lbTotVendasLiqAdm: TLabel;
    lbTotAntecipacoesLiqAdm: TLabel;
    lbTotCancelamentosLiqAdm: TLabel;
    lbTotChargeBackLiqAdm: TLabel;
    lbTotAjustePosLiqAdm: TLabel;
    lbTotAjusteNegLiqAdm: TLabel;
    Label19: TLabel;
    lbPagoOperadoraAdm: TLabel;
    Label21: TLabel;
    Label3: TLabel;
    TabSheet11: TTabSheet;
    TabSheet13: TTabSheet;
    lbDesTotTarifa: TLabel;
    edTotTarifaLiq: TEdit;
    ckLancarTarifas: TCheckBox;
    lbDescQuitados: TLabel;
    lbTotQuitadosLiq: TLabel;
    PopupMenu6: TPopupMenu;
    Configurarcolunas6: TMenuItem;
    ResetarConfiguraesdecolunas6: TMenuItem;
    SalvardadosnoExcel6: TMenuItem;
    ReajustarLarguradascolunas6: TMenuItem;
    Copiarparareadetransferncia6: TMenuItem;
    Somarvaloresdacoluna6: TMenuItem;
    Panel9: TPanel;
    GroupBox16: TGroupBox;
    ScrollBox6: TScrollBox;
    DBGrid6: TDBGrid;
    GroupBox17: TGroupBox;
    BitBtn1: TBitBtn;
    GroupBoxFinanceiroAdm: TGroupBox;
    Panel7: TPanel;
    BitBtn_BuscarFinancAdm: TBitBtn;
    pnOpcoesTopFinancAdm: TPanel;
    pnUnificadasFinancAdm: TPanel;
    lbUnificadasFinancAdm: TLabel;
    DBLookupComboBoxUnificadasFinancAdm: TDBLookupComboBox;
    pnAdministradoraFinancAdm: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lbNumEstCartaoFinancAdm: TLabel;
    meDtInicialFinancAdm: TMaskEdit;
    meDtFinalFinancAdm: TMaskEdit;
    DBLookupComboBoxAdmCartaoFinancAdm: TDBLookupComboBox;
    DBLookupComboBoxBandeiraFinancAdm: TDBLookupComboBox;
    ComboBoxEventoFinancAdm: TComboBox;
    DBLookupComboBoxNumEstFinancAdm: TDBLookupComboBox;
    pnListaFinancAdm: TPanel;
    pnDivergenciaValor2: TPanel;
    pnDivergenciaData2: TPanel;
    btSomarFinancAdm: TSpeedButton;
    SpeedButton_BuscarArquivos: TSpeedButton;
    pnDivergenciaData3: TPanel;
    imgInformation: TImage;
    lbDataInicialPendenc: TLabel;
    meDtInicialPendenc: TMaskEdit;
    lbDataFinalPendenc: TLabel;
    meDtFinalPedenc: TMaskEdit;
    BitBtn_BuscarPendenc: TBitBtn;
    Label4: TLabel;
    edNSUPendenc: TEdit;
    lbNumAutPendenc: TLabel;
    edNumAutPendenc: TEdit;
    procedure SpeedButton_BuscarArquivosClick(Sender: TObject);
    procedure btSomarFinancAdmClick(Sender: TObject);
    procedure lbTotAjusteNegLiqAdmDblClick(Sender: TObject);
    procedure lbTotAjustePosLiqAdmDblClick(Sender: TObject);
    procedure lbTotAjusteNegLiqDblClick(Sender: TObject);
    procedure lbTotAjustePosLiqDblClick(Sender: TObject);
    procedure lbTotChargeBackLiqAdmDblClick(Sender: TObject);
    procedure lbTotChargeBackLiqDblClick(Sender: TObject);
    procedure lbTotCancelamentosLiqAdmDblClick(Sender: TObject);
    procedure lbTotCancelamentosLiqDblClick(Sender: TObject);
    procedure lbTotAntecipacoesLiqAdmDblClick(Sender: TObject);
    procedure lbTotAntecipacoesLiqDblClick(Sender: TObject);
    procedure lbTotVendasLiqAdmDblClick(Sender: TObject);
    procedure lbTotVendasLiqDblClick(Sender: TObject);
    procedure lbTotPendenciaLiqDblClick(Sender: TObject);
    procedure lbPagoOperadoraAdmDblClick(Sender: TObject);
    procedure DBGrid6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure lbPagoOperadoraDblClick(Sender: TObject);
    procedure DBGrid6TitleClick(Column: TColumn);
    procedure DBGrid6ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure ScrollBox6Enter(Sender: TObject);
    procedure Somarvaloresdacoluna6Click(Sender: TObject);
    procedure Copiarparareadetransferncia6Click(Sender: TObject);
    procedure ReajustarLarguradascolunas6Click(Sender: TObject);
    procedure SalvardadosnoExcel6Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas6Click(Sender: TObject);
    procedure Configurarcolunas6Click(Sender: TObject);
    procedure BitBtn_BuscarFinancAdmClick(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure btSomarFinancClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btUnSelectAllClick(Sender: TObject);
    procedure btSelectAllClick(Sender: TObject);
    procedure BitBtn_TipoLancClick(Sender: TObject);
    procedure BitBtn_EmpresaAdqClick(Sender: TObject);
    procedure SpeedButtonAtualizarApiClick(Sender: TObject);
    procedure DetailBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure BitBtn_ImprimirClick(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DBGrid12TitleClick(Column: TColumn);
    procedure Somarvaloresdacoluna12Click(Sender: TObject);
    procedure ReajustarLarguradascolunas12Click(Sender: TObject);
    procedure Copiarparareadetransferncia12Click(Sender: TObject);
    procedure ReajustarLarguradascolunas5Click(Sender: TObject);
    procedure SalvardadosnoExcel12Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas12Click(Sender: TObject);
    procedure Configurarcolunas12Click(Sender: TObject);
    procedure DBGrid12ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure ScrollBox12Enter(Sender: TObject);
    procedure btCreditosQuitadosClick(Sender: TObject);
    procedure BitBtnSairTelaCreditosQuitadosClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btUnSelectAllResolverPendClick(Sender: TObject);
    procedure btSelectAllResolverPendClick(Sender: TObject);
    procedure DBGrid5CellClick(Column: TColumn);
    procedure bt_resolver_pendenciasClick(Sender: TObject);
    procedure Somarvaloresdacoluna5Click(Sender: TObject);
    procedure Copiarparareadetransferncia5Click(Sender: TObject);
    procedure SalvardadosnoExcel5Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas5Click(Sender: TObject);
    procedure Configurarcolunas5Click(Sender: TObject);
    procedure DBGrid5TitleClick(Column: TColumn);
    procedure DBGrid5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid5ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure ScrollBox5Enter(Sender: TObject);
    procedure btCreditosDivergenciaDataClick(Sender: TObject);
    procedure ScrollBox4Enter(Sender: TObject);
    procedure DBGrid4ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure Somarvaloresdacoluna4Click(Sender: TObject);
    procedure Copiarparareadetransferncia4Click(Sender: TObject);
    procedure ReajustarLarguradascolunas4Click(Sender: TObject);
    procedure SalvardadosnoExcel4Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas4Click(Sender: TObject);
    procedure Configurarcolunas4Click(Sender: TObject);
    procedure DBGrid4TitleClick(Column: TColumn);
    procedure DBGrid4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn_ContasAjusteClick(Sender: TObject);
    procedure DBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure SpeedButton5Click(Sender: TObject);
    procedure bt_financeiro_pesquisar_confereClick(Sender: TObject);
    procedure btDesTodosPendencExcluirClick(Sender: TObject);
    procedure btSelTodosPendencExcluirClick(Sender: TObject);
    procedure BitBtnVoltarTelaPendencExcluirClick(Sender: TObject);
    procedure bt_financeiro_excluir_confereClick(Sender: TObject);
    procedure BitBtn_BuscarPendencExcluirClick(Sender: TObject);
    procedure btCreditosNaoEncontradoClick(Sender: TObject);
    procedure btDesPendenciaConfereClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure bt_financeiro_vincular_confereClick(Sender: TObject);
    procedure bt_financeiro_vincular_sistemaClick(Sender: TObject);
    procedure bt_financeiro_gotocancel_confereClick(Sender: TObject);
    procedure bt_financeiro_gotocancel_sistemaClick(Sender: TObject);
    procedure bt_financeiro_goto_confereClick(Sender: TObject);
    procedure bt_financeiro_goto_sistemaClick(Sender: TObject);
    procedure DBGrid3TitleClick(Column: TColumn);
    procedure DBGrid3ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure ScrollBox3Enter(Sender: TObject);
    procedure Somarvaloresdacoluna3Click(Sender: TObject);
    procedure Copiarparareadetransferncia3Click(Sender: TObject);
    procedure ReajustarLarguradascolunas3Click(Sender: TObject);
    procedure SalvardadosnoExcel3Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas3Click(Sender: TObject);
    procedure Configurarcolunas3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure BitBtn_QuitarCreditosClick(Sender: TObject);
    procedure DBGrid2ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure DBGrid1ColumnMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure DBGrid2TitleClick(Column: TColumn);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn_BuscarPendencClick(Sender: TObject);
    procedure Somarvaloresdacoluna2Click(Sender: TObject);
    procedure Copiarparareadetransferncia2Click(Sender: TObject);
    procedure ReajustarLarguradascolunas2Click(Sender: TObject);
    procedure SalvardadosnoExcel2Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas2Click(Sender: TObject);
    procedure Configurarcolunas2Click(Sender: TObject);
    procedure ScrollBox2Enter(Sender: TObject);
    procedure BitBtn_ExportarExcelClick(Sender: TObject);
    procedure BitBtnSairTelaFinancClick(Sender: TObject);
    procedure ScrollBox1Enter(Sender: TObject);
    procedure Somarvaloresdacoluna1Click(Sender: TObject);
    procedure Copiarparareadetransferncia1Click(Sender: TObject);
    procedure ReajustarLarguradascolunas1Click(Sender: TObject);
    procedure SalvardadosnoExcel1Click(Sender: TObject);
    procedure ResetarConfiguraesdecolunas1Click(Sender: TObject);
    procedure Configurarcolunas1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn_BuscarFinancClick(Sender: TObject);
    procedure EncontrarCreditosPorNumAutorizacao(Sender: TObject);
    procedure salvaConfiguracoesJanela(pJanela: string);
    procedure BuscasFinanceiroAdm(pTipo: string);
  private
    { Private declarations }
    FpopMenuOut: TPopupMenu;
    vCriou: Smallint;
  public
    { Public declarations }
    vCodUnificadaPend: Integer;
    vNumEstPend: string;
    vCodAdmCartaoPend: Integer;
    vCodBandeiraPend: Integer;
    vPendencias: Boolean;
  end;

var
  FrmConciliaCartaoConfere: TFrmConciliaCartaoConfere;
  cadconciliaconfere: TconciliacartaoConfere;
  cadconciliaconfereRec: TconciliacartaoRecConfere;
  pendenciasconfere: TPendenciasConfere;
  resolverPendenciasconfere: TResolverPendenciasConfere;
  cadconciliaconfereadm: TconciliacartaoConfereAdm;

  PrimeiraPesquisa1, PrimeiraPesquisa2, PrimeiraPesquisa3, PrimeiraPesquisa4, PrimeiraPesquisa5, PrimeiraPesquisa6, PrimeiraPesquisa12: Boolean;
  vConfigColuna1, vConfigColuna2, vConfigColuna3, vConfigColuna4, vConfigColuna5, vConfigColuna6, vConfigColuna12: boolean;
  campoPesquisa1, campoPesquisa2, campoPesquisa3, campoPesquisa4, campoPesquisa5, campoPesquisa6, campoPesquisa12: string;
  cdsColunas1, cdsColunas2, cdsColunas3, cdsColunas4, cdsColunas5, cdsColunas6, cdsColunas12: TClientDataSet;

  cdsGrid1, cdsGrid2, cdsGrid3, cdsGrid4, cdsGrid5, cdsGrid6, cdsGrid12: TClientDataSet;
  GridCfg1, GridCfg2, GridCfg3, GridCfg4, GridCfg5, GridCfg6, GridCfg12: TDBGrid;
  ListGridsAndDataSets1, ListGridsAndDataSets2, ListGridsAndDataSets3, ListGridsAndDataSets4, ListGridsAndDataSets5, ListGridsAndDataSets6, ListGridsAndDataSets12: TStrings;
  ListPositions1, ListPositions2, ListPositions3, ListPositions4, ListPositions5, ListPositions6, ListPositions12: TStrings;

  trans: TIBTransaction;
  vTabela, vCampoPadrao: string;
  fReset, vCtrlClick, vShiftClick: Boolean;
  // Variavel usada na criacao dos checks para mostrar as configuracoes das colunas
  nomeDTSEt1, nomeDTSEt2, nomeDTSEt3, nomeDTSEt4, nomeDTSEt5, nomeDTSEt6, nomeDTSEt12: string;
  vAlterarNomeDtSet1, vAlterarNomeDtSet2, vAlterarNomeDtSet3, vAlterarNomeDtSet4, vAlterarNomeDtSet5, vAlterarNomeDtSet6, vAlterarNomeDtSet12: string;
  usuario: string;
  vCamposPadraoRegistro1, vCamposPadraoRegistro2, vCamposPadraoRegistro3, vCamposPadraoRegistro4, vCamposPadraoRegistro5, vCamposPadraoRegistro6, vCamposPadraoRegistro12: Boolean;
  Valor, ValorLiquido: Currency; //Variavel para imprimir relatório
  Valor2, ValorLiquido2: Currency; //Variavel para imprimir relatório
	ConcCartAdqCielo: TConciliaCartaoAdquirenteCielo;
  vTestarDataFinanc: Boolean;
  vTotPendConfere: Double;
  vTotFinancRec: Double;

implementation

uses uDtmContasAReceber, uDtmAtivo, Clipbrd, uDadosIni, uDataSet_OOP, DB,
  Registry;

{$R *.dfm}

procedure TFrmConciliaCartaoConfere.BitBtn19Click(Sender: TObject);
begin
	TForm(pnTotalFinanceiro.Parent).ModalResult := IDOK;
end;

procedure TFrmConciliaCartaoConfere.BitBtn4Click(Sender: TObject);
begin
	if not pendenciasconfere.vincularCreditos then
  	exit;

  EncontrarCreditosPorNumAutorizacao(Sender);
end;

procedure TFrmConciliaCartaoConfere.BitBtnSairTelaCreditosQuitadosClick(
  Sender: TObject);
begin
	Close;
end;

procedure TFrmConciliaCartaoConfere.BitBtnSairTelaFinancClick(Sender: TObject);
begin
	Close;
end;

procedure TFrmConciliaCartaoConfere.BitBtn_BuscarPendencClick(Sender: TObject);
var
	vtempSql1: string;
  vtempSql2: string;
begin
	try
    Screen.Cursor := crHourGlass;

    btDesPendenciaConfere.Enabled   := false;
	  btCreditosNaoEncontrado.Enabled := false;

    if (meDtInicialPendenc.Text = '  /  /    ') then
    begin
      Application.MessageBox('Data inicial não informada!', 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;

    if (meDtFinalPedenc.Text = '  /  /    ') then
    begin
      Application.MessageBox('Data final não informada!', 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;

    try
	    StrToDate(meDtInicialPendenc.Text);
    except
    	Application.MessageBox('Data inicial inválida!', 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;

    try
	    StrToDate(meDtFinalPedenc.Text);
    except
    	Application.MessageBox('Data final inválida!', 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;

    if not vDadosIni.PesqPros('IMPFIN037', 'CONSULTAR', '', 'CONCILIACAO_FINANCEIRO', '', cadconciliaconfere.buscas, false) then
  		exit;

    vtempSql1 := ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
    vtempSql2 := ' and COD_EMP_MULT = ' + vDadosIni.codEmpresa;

    if (vDadosIni.vEmp.vFinanceiroUnificado) and (pendenciasconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger <= 0) then
    begin
      vtempSql1 := '';
      vtempSql2 := '';
    end
    else if (vDadosIni.vEmp.vFinanceiroUnificado) and (pendenciasconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger > 0) then
  	begin
      vtempSql1 := ' and COD_EMPRESA = ' + IntToStr(pendenciasconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger);
      vtempSql2 := ' and COD_EMP_MULT = ' + IntToStr(pendenciasconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger);
    end;

    vtempSql1 := vtempSql1 +
      vDadosIni.IfThen(trim(pendenciasconfere.vnumestConcCartao.dataSet.FieldByName('CODIGO').AsString) = 'Todos',
        '', ' and ESTABLISHMENT_NUMBER = ' + QuotedStr(trim(pendenciasconfere.vnumestConcCartao.dataSet.FieldByName('CODIGO').AsString)));

    vtempSql1 := vtempSql1 +
      vDadosIni.IfThen(pendenciasconfere.vadmcartaoConcCartao.dataSet.FieldByName('id').AsInteger = 0,
        '', ' and ACQUIRER_ID = ' + IntToStr(pendenciasconfere.vadmcartaoConcCartao.dataSet.FieldByName('id').AsInteger));

    vtempSql1 := vtempSql1 +
      vDadosIni.IfThen(pendenciasconfere.vbandeiraConcCartao.dataSet.FieldByName('id').AsInteger = 0,
        '', ' and BRAND_ID = ' + IntToStr(pendenciasconfere.vbandeiraConcCartao.dataSet.FieldByName('id').AsInteger));


    vtempSql2 := vtempSql2 +
      vDadosIni.IfThen(pendenciasconfere.vadmcartaoConcCartao.dataSet.FieldByName('cod_adm').AsInteger = 0,
        '', ' and COD_ADM = ' + IntToStr(pendenciasconfere.vadmcartaoConcCartao.dataSet.FieldByName('cod_adm').AsInteger));

    vtempSql2 := vtempSql2 +
      vDadosIni.IfThen(pendenciasconfere.vbandeiraConcCartao.dataSet.FieldByName('cod_bandeira').AsInteger = 0,
        '', ' and COD_BANDEIRA_ADM = ' + IntToStr(pendenciasconfere.vbandeiraConcCartao.dataSet.FieldByName('cod_bandeira').AsInteger));


    vtempSql1 := vtempSql1 +
    	vDadosIni.IfThen(trim(edNSUPendenc.Text) = '',
    		'', ' and NSU like ' + QuotedStr('%' + trim(edNSUPendenc.Text) + '%'));

    vtempSql1 := vtempSql1 +
    	vDadosIni.IfThen(trim(edNumAutPendenc.Text) = '',
    		'', ' and AUTHORIZATION_NUMBER like ' + QuotedStr('%' + trim(edNumAutPendenc.Text) + '%'));

    vtempSql2 := vtempSql2 +
    	vDadosIni.IfThen(trim(edNSUPendenc.Text) = '',
    		'', ' and N_DOCNSU_ADM like ' + QuotedStr('%' + trim(edNSUPendenc.Text) + '%'));

    vtempSql2 := vtempSql2 +
    	vDadosIni.IfThen(trim(edNumAutPendenc.Text) = '',
    		'', ' and N_AUT_CART like ' + QuotedStr('%' + trim(edNumAutPendenc.Text) + '%'));

    if pendenciasconfere.dataSet.Filtered then
	    pendenciasconfere.dataSet.Filtered := False;

    if pendenciasconfere.vcreditosPendConcCartao.dataSet.Filtered then
	    pendenciasconfere.vcreditosPendConcCartao.dataSet.Filtered := False;

    pendenciasconfere.abreConsultaPendencias(
    	StrToDate(meDtInicialPendenc.Text),
      StrToDate(meDtFinalPedenc.Text),
      vtempSql1);

  	pendenciasconfere.vcreditosPendConcCartao.abreCreditos(
    	' DATA_VENC_C >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', StrToDate(meDtInicialPendenc.Text))) +
      ' and DATA_VENC_C <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', StrToDate(meDtFinalPedenc.Text))),
      vtempSql2);

    vCodUnificadaPend := vDadosIni.IfThen(DBLookupComboBoxUnificadasPendencExcluir.KeyValue = null, 0, DBLookupComboBoxUnificadasPendencExcluir.KeyValue);
    vCodAdmCartaoPend := vDadosIni.IfThen(DBLookupComboBoxAdmCartaoPendencExcluir.KeyValue = null, 0, DBLookupComboBoxAdmCartaoPendencExcluir.KeyValue);
    vCodBandeiraPend  := vDadosIni.IfThen(DBLookupComboBoxBandeiraPendencExcluir.KeyValue = null, 0, DBLookupComboBoxBandeiraPendencExcluir.KeyValue);
  finally
  	vDadosIni._GravaConfiguracoesInteger(DBLookupComboBoxUnificadasPendenc.Name, DBLookupComboBoxUnificadasPendenc.KeyValue);
    vDadosIni._GravaConfiguracoesString(DBLookupComboBoxNumEstPendenc.Name, DBLookupComboBoxNumEstPendenc.KeyValue);
    vDadosIni._GravaConfiguracoesInteger(DBLookupComboBoxAdmCartaoPendenc.Name, DBLookupComboBoxAdmCartaoPendenc.KeyValue);
    vDadosIni._GravaConfiguracoesString(meDtInicialPendenc.Name, meDtInicialPendenc.Text);
    vDadosIni._GravaConfiguracoesString(meDtFinalPedenc.Name, meDtFinalPedenc.Text);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConciliaCartaoConfere.BitBtn_BuscarPendencExcluirClick(
  Sender: TObject);
var
	vtempSql1: string;
begin
	try
  	if (meDtInicialPendencExcluir.Text = '  /  /    ') then
    begin
      Application.MessageBox('Data inicial não informada!', 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;

    if (meDtFinalPendencExcluir.Text = '  /  /    ') then
    begin
      Application.MessageBox('Data final não informada!', 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;

    try
	    StrToDate(meDtInicialPendencExcluir.Text);
    except
    	Application.MessageBox('Data inicial inválida!', 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;

    try
	    StrToDate(meDtFinalPendencExcluir.Text);
    except
    	Application.MessageBox('Data final inválida!', 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;
    
    Screen.Cursor := crHourGlass;

    btDesPendenciaConfere.Enabled   := false;
	  btCreditosNaoEncontrado.Enabled := false;

    if not vDadosIni.PesqPros('IMPFIN037', 'CONSULTAR', '', 'CONCILIACAO_FINANCEIRO', '', cadconciliaconfere.buscas, false) then
  		exit;
    
    vtempSql1 := ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;

    if (vDadosIni.vEmp.vFinanceiroUnificado) and (pendenciasconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger <= 0) then
      vtempSql1 := ''
    else if (vDadosIni.vEmp.vFinanceiroUnificado) and (pendenciasconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger > 0) then
      vtempSql1 := ' and COD_EMPRESA = ' + IntToStr(pendenciasconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger);

    vtempSql1 := vtempSql1 +
      vDadosIni.IfThen(trim(pendenciasconfere.vnumestConcCartao.dataSet.FieldByName('CODIGO').AsString) = 'Todos',
        '', ' and ESTABLISHMENT_NUMBER = ' + QuotedStr(trim(pendenciasconfere.vnumestConcCartao.dataSet.FieldByName('CODIGO').AsString)));

    vtempSql1 := vtempSql1 +
      vDadosIni.IfThen(pendenciasconfere.vadmcartaoConcCartao.dataSet.FieldByName('id').AsInteger = 0,
        '', ' and ACQUIRER_ID = ' + IntToStr(pendenciasconfere.vadmcartaoConcCartao.dataSet.FieldByName('id').AsInteger));

    vtempSql1 := vtempSql1 +
      vDadosIni.IfThen(pendenciasconfere.vbandeiraConcCartao.dataSet.FieldByName('id').AsInteger = 0,
        '', ' and BRAND_ID = ' + IntToStr(pendenciasconfere.vbandeiraConcCartao.dataSet.FieldByName('id').AsInteger));

    vtempSql1 := vtempSql1 +
    	vDadosIni.IfThen(trim(edNSUPendencExlcuir.Text) <> '',
    		'', ' and NSU like ' + QuotedStr('%'+ trim(edNSUPendencExlcuir.Text) + '%'));

    vtempSql1 := vtempSql1 +
    	vDadosIni.IfThen(trim(edNumAutPendencExcluir.Text) <> '',
    		'', ' and AUTHORIZATION_NUMBER like ' + QuotedStr('%' + trim(edNumAutPendencExcluir.Text) + '%'));

    if pendenciasconfere.dataSet.Filtered then
	    pendenciasconfere.dataSet.Filtered := False;

    if pendenciasconfere.vcreditosPendConcCartao.dataSet.Filtered then
	    pendenciasconfere.vcreditosPendConcCartao.dataSet.Filtered := False;

    pendenciasconfere.abreConsultaPendencias(
    	StrToDate(meDtInicialPendencExcluir.Text),
      StrToDate(meDtFinalPendencExcluir.Text),
      vtempSql1);
  finally
  	vDadosIni._GravaConfiguracoesInteger(DBLookupComboBoxUnificadasFinancAdm.Name, DBLookupComboBoxUnificadasFinancAdm.KeyValue);
  	vDadosIni._GravaConfiguracoesString(DBLookupComboBoxNumEstPendencExcluir.Name, DBLookupComboBoxNumEstPendencExcluir.KeyValue);
    vDadosIni._GravaConfiguracoesInteger(DBLookupComboBoxAdmCartaoFinancAdm.Name, DBLookupComboBoxAdmCartaoFinancAdm.KeyValue);
  	vDadosIni._GravaConfiguracoesString(meDtInicialPendencExcluir.Name, meDtInicialPendencExcluir.Text);
    vDadosIni._GravaConfiguracoesString(meDtFinalPendencExcluir.Name, meDtFinalPendencExcluir.Text);
    vDadosIni._GravaConfiguracoesString(edNSUPendencExlcuir.Name, edNSUPendencExlcuir.Text);
    vDadosIni._GravaConfiguracoesString(edNumAutPendencExcluir.Name, edNumAutPendencExcluir.Text);
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConciliaCartaoConfere.BitBtn_ContasAjusteClick(Sender: TObject);
begin
	salvaConfiguracoesJanela('N');
	vDadosIni.cadastrosbasicos_contasajuste(1);
end;

procedure TFrmConciliaCartaoConfere.BitBtnVoltarTelaPendencExcluirClick(
  Sender: TObject);
begin
	GroupBox6.Parent := pnDBGridPendConfere;
  DBGrid2.Parent := pnDBGridPendConfere;

  pendenciasconfere.dataSet.FieldByName('SEL').Tag := 1;

  TabSheet1.TabVisible := true;
  TabSheet2.TabVisible := true;
  TabSheet3.TabVisible := true;
  TabSheet4.TabVisible := true;
  TabSheet12.TabVisible := true;

  vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
      vAlterarNomeDtSet2, GridCfg2, DBGrid2, cdsGrid2, cdsColunas2, trans, ListGridsAndDataSets2,
      ListPositions2, nomeDTSEt2, PrimeiraPesquisa2, vCamposPadraoRegistro2, usuario);

	vDadosIni.configurarGridPeloConfigColunas(DBGrid2, GridCfg2, cdsGrid2, cdsColunas2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);

  DBLookupComboBoxUnificadasPendenc.KeyValue := vCodUnificadaPend;
  DBLookupComboBoxAdmCartaoPendenc.KeyValue  := vCodAdmCartaoPend;
  DBLookupComboBoxBandeiraPendenc.KeyValue   := vCodBandeiraPend;

	PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;
end;

procedure TFrmConciliaCartaoConfere.BitBtn_BuscarFinancAdmClick(
  Sender: TObject);
var
	vtempSql: string;
begin
	try
    Screen.Cursor := crHourGlass;

    if (meDtInicialFinancAdm.Text = '  /  /    ') then
    begin
      Application.MessageBox('Data inicial não informada!', 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;

    if (meDtFinalFinancAdm.Text = '  /  /    ') then
    begin
      Application.MessageBox('Data final não informada!', 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;

    try
      StrToDate(meDtInicialFinancAdm.Text);
    except
      Application.MessageBox('Data inicial inválida!', 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;

    try
      StrToDate(meDtFinalFinancAdm.Text);
    except
      Application.MessageBox('Data final inválida!', 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;

    if StrToDate(meDtInicialFinancAdm.Text) > (vDadosIni.diaFFinanceiro + 1) then
    begin
      Application.MessageBox('Data inicial não pode ser maior que a data do financeiro, será atribuído o dia atual do financeiro!', 'Atenção', MB_ICONERROR + MB_OK);
      meDtInicialFinancAdm.Text := FormatDateTime('dd/mm/yyyy', vDadosIni.diaFFinanceiro + 1);
      exit;
    end;

    if StrToDate(meDtFinalFinancAdm.Text) > (vDadosIni.diaFFinanceiro + 1) then
    begin
      Application.MessageBox('Data final não pode ser maior que a data do financeiro, será atribuído o dia atual do financeiro!', 'Atenção', MB_ICONERROR + MB_OK);
      meDtFinalFinancAdm.Text := FormatDateTime('dd/mm/yyyy', vDadosIni.diaFFinanceiro + 1);
      exit;
    end;

    if not vDadosIni.PesqPros('IMPFIN035', 'CONSULTAR', '', 'CONCILIACAO_FINANCEIRO', '', cadconciliaconfere.buscas, false) then
      exit;

    vtempSql  := ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
    if (vDadosIni.vEmp.vFinanceiroUnificado) and (cadconciliaconfereadm.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger <= 0) then
      vtempSql  := ''
    else if (vDadosIni.vEmp.vFinanceiroUnificado) and (cadconciliaconfereadm.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger > 0) then
      vtempSql  := ' and COD_EMPRESA = ' + IntToStr(cadconciliaconfereadm.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger);

    vtempSql := vtempSql +
      vDadosIni.IfThen(trim(cadconciliaconfereadm.vnumestConcCartao.dataSet.FieldByName('CODIGO').AsString) = 'Todos',
        '', ' and ESTABLISHMENT_NUMBER = ' + QuotedStr(trim(cadconciliaconfereadm.vnumestConcCartao.dataSet.FieldByName('CODIGO').AsString)));

    vtempSql := vtempSql +
      vDadosIni.IfThen(cadconciliaconfereadm.vadmcartaoConcCartao.dataSet.FieldByName('id').AsInteger = 0,
        '', ' and ACQUIRER_ID = ' + IntToStr(cadconciliaconfereadm.vadmcartaoConcCartao.dataSet.FieldByName('id').AsInteger));

    vtempSql := vtempSql +
      vDadosIni.IfThen(cadconciliaconfereadm.vbandeiraConcCartao.dataSet.FieldByName('id').AsInteger = 0,
        '', ' and BRAND_ID = ' + IntToStr(cadconciliaconfereadm.vbandeiraConcCartao.dataSet.FieldByName('id').AsInteger));

    vtempSql := vtempSql +
    	vDadosIni.IfThen(UpperCase(trim(ComboBoxEventoFinancAdm.Items[ComboBoxEventoFinancAdm.ItemIndex])) = 'TODOS',
      	'', ' and EVENT_TYPE_DESCRIPTION = ' + QuotedStr(trim(ComboBoxEventoFinancAdm.Items[ComboBoxEventoFinancAdm.ItemIndex])));

    if not cadconciliaconfereadm.abreConsultaFinanceiroAdm(
    	StrToDate(meDtInicialFinancAdm.Text),
      StrToDate(meDtFinalFinancAdm.Text),
      vtempSql) then
  finally
  	vDadosIni._GravaConfiguracoesInteger(DBLookupComboBoxUnificadasFinancAdm.Name, DBLookupComboBoxUnificadasFinancAdm.KeyValue);
    vDadosIni._GravaConfiguracoesString(DBLookupComboBoxNumEstFinancAdm.Name, DBLookupComboBoxNumEstFinancAdm.KeyValue);
    vDadosIni._GravaConfiguracoesInteger(DBLookupComboBoxAdmCartaoFinancAdm.Name, DBLookupComboBoxAdmCartaoFinancAdm.KeyValue);
  	vDadosIni._GravaConfiguracoesString(meDtInicialFinancAdm.Name, meDtInicialFinancAdm.Text);
    vDadosIni._GravaConfiguracoesString(meDtFinalFinancAdm.Name, meDtFinalFinancAdm.Text);
  	Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConciliaCartaoConfere.BitBtn_BuscarFinancClick(Sender: TObject);
var
  vtempSql: string;
  vtempSql1: string;
  vtempSql2: string;
  vtempSql3: string;
  vErroFinanc: boolean;
begin
	try
  	Screen.Cursor := crHourGlass;

  	vErroFinanc := false;

    vTotPendConfere    := 0;
  	vTotFinancRec      := 0;

//  	FrmConciliaCartaoConfere.Enabled := false;
  	SpeedButton_BuscarArquivos.Enabled := false;
  	BitBtn_BuscarFinanc.Enabled := false;
    btDesPendenciaConfere.Enabled := false;
    btCreditosNaoEncontrado.Enabled := false;
    btCreditosDivergenciaData.Enabled := false;
    btCreditosQuitados.Enabled := false;
    btSelectAll.Enabled := false;
    btUnSelectAll.Enabled := false;
    btSomarFinanc.Enabled := false;
    BitBtn_EmpresaAdq.Enabled := false;
    BitBtn_QuitarCreditos.Enabled := false;
    BitBtn_ExportarExcel.Enabled := false;
    BitBtn_Imprimir.Enabled := false;
    BitBtn_TipoLanc.Enabled := false;
    BitBtn_ContasAjuste.Enabled := false;
    ckLancarTarifas.Enabled := false;
    ckLancarComissoes.Enabled := false;
    ckLancarAjustePositivo.Enabled := false;
    ckLancarAjusteNegativo.Enabled := false;

    if (meDtInicialFinanc.Text = '  /  /    ') then
    begin
      Application.MessageBox('Data inicial não informada!', 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;

    if (meDtFinalFinanc.Text = '  /  /    ') then
    begin
      Application.MessageBox('Data final não informada!', 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;

    try
	    StrToDate(meDtInicialFinanc.Text);
    except
    	Application.MessageBox('Data inicial inválida!', 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;

    try
	    StrToDate(meDtFinalFinanc.Text);
    except
    	Application.MessageBox('Data final inválida!', 'Atenção', MB_ICONERROR + MB_OK);
      exit;
    end;

    if vTestarDataFinanc then
      if StrToDate(meDtInicialFinanc.Text) > (vDadosIni.diaFFinanceiro + 1) then
      begin
        Application.MessageBox('Data inicial não pode ser maior que a data do financeiro, será atribuído o dia atual do financeiro!', 'Atenção', MB_ICONERROR + MB_OK);
        meDtInicialFinanc.Text := FormatDateTime('dd/mm/yyyy', vDadosIni.diaFFinanceiro + 1);
        meDtFinalFinanc.Text := FormatDateTime('dd/mm/yyyy', vDadosIni.diaFFinanceiro + 1);
        exit;
      end;

    if vTestarDataFinanc then
      if StrToDate(meDtFinalFinanc.Text) > (vDadosIni.diaFFinanceiro + 1) then
      begin
        Application.MessageBox('Data final não pode ser maior que a data do financeiro, será atribuído o dia atual do financeiro!', 'Atenção', MB_ICONERROR + MB_OK);
        meDtFinalFinanc.Text := FormatDateTime('dd/mm/yyyy', vDadosIni.diaFFinanceiro + 1);
        exit;
      end;

  	if not vDadosIni.PesqPros('IMPFIN035', 'CONSULTAR', '', 'CONCILIACAO_FINANCEIRO', '', cadconciliaconfere.buscas, false) then
  		exit;

    vtempSql  := ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
    vtempSql1 := ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
    vtempSql2 := ' and COD_EMP_MULT = ' + vDadosIni.codEmpresa;
    vtempSql3 := ' and COD_EMP_MULT = ' + vDadosIni.codEmpresa;
    if (vDadosIni.vEmp.vFinanceiroUnificado) and (cadconciliaconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger <= 0) then
    begin
      vtempSql  := '';
      vtempSql1 := '';
      vtempSql2 := '';
      vtempSql3 := '';
    end
    else if (vDadosIni.vEmp.vFinanceiroUnificado) and (cadconciliaconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger > 0) then
    begin
      vtempSql  := ' and COD_EMPRESA = ' + IntToStr(cadconciliaconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger);
      vtempSql1 := ' and COD_EMPRESA = ' + IntToStr(cadconciliaconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger);
      vtempSql2 := ' and COD_EMP_MULT = ' + IntToStr(cadconciliaconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger);
      vtempSql3 := ' and COD_EMP_MULT = ' + IntToStr(cadconciliaconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger);
    end;

    vtempSql := vtempSql +
      vDadosIni.IfThen(trim(cadconciliaconfere.vnumestConcCartao.dataSet.FieldByName('CODIGO').AsString) = 'Todos',
        '', ' and ESTABLISHMENT_NUMBER = ' + QuotedStr(trim(cadconciliaconfere.vnumestConcCartao.dataSet.FieldByName('CODIGO').AsString)));
    vtempSql1 := vtempSql1 +
      vDadosIni.IfThen(trim(cadconciliaconfere.vnumestConcCartao.dataSet.FieldByName('CODIGO').AsString) = 'Todos',
        '', ' and ESTABLISHMENT_NUMBER = ' + QuotedStr(trim(cadconciliaconfere.vnumestConcCartao.dataSet.FieldByName('CODIGO').AsString)));

    vtempSql := vtempSql +
      vDadosIni.IfThen(cadconciliaconfere.vadmcartaoConcCartao.dataSet.FieldByName('id').AsInteger = 0,
        '', ' and ACQUIRER_ID = ' + IntToStr(cadconciliaconfere.vadmcartaoConcCartao.dataSet.FieldByName('id').AsInteger));
    vtempSql1 := vtempSql1 +
      vDadosIni.IfThen(cadconciliaconfere.vadmcartaoConcCartao.dataSet.FieldByName('id').AsInteger = 0,
        '', ' and ACQUIRER_ID = ' + IntToStr(cadconciliaconfere.vadmcartaoConcCartao.dataSet.FieldByName('id').AsInteger));

    vtempSql2 := vtempSql2 +
      vDadosIni.IfThen(cadconciliaconfere.vadmcartaoConcCartao.dataSet.FieldByName('cod_adm').AsInteger = 0,
        '', ' and COD_ADM = ' + IntToStr(cadconciliaconfere.vadmcartaoConcCartao.dataSet.FieldByName('cod_adm').AsInteger));
    vtempSql3 := vtempSql3 +
      vDadosIni.IfThen(cadconciliaconfere.vadmcartaoConcCartao.dataSet.FieldByName('cod_adm').AsInteger = 0,
        '', ' and COD_ADM = ' + IntToStr(cadconciliaconfere.vadmcartaoConcCartao.dataSet.FieldByName('cod_adm').AsInteger));

    vtempSql := vtempSql +
      vDadosIni.IfThen(cadconciliaconfere.vbandeiraConcCartao.dataSet.FieldByName('id').AsInteger = 0,
        '', ' and BRAND_ID = ' + IntToStr(cadconciliaconfere.vbandeiraConcCartao.dataSet.FieldByName('id').AsInteger));
    vtempSql1 := vtempSql1 +
      vDadosIni.IfThen(cadconciliaconfere.vbandeiraConcCartao.dataSet.FieldByName('id').AsInteger = 0,
        '', ' and BRAND_ID = ' + IntToStr(cadconciliaconfere.vbandeiraConcCartao.dataSet.FieldByName('id').AsInteger));

    vtempSql2 := vtempSql2 +
      vDadosIni.IfThen(cadconciliaconfere.vbandeiraConcCartao.dataSet.FieldByName('cod_bandeira').AsInteger = 0,
        '', ' and COD_BANDEIRA_ADM = ' + IntToStr(cadconciliaconfere.vbandeiraConcCartao.dataSet.FieldByName('cod_bandeira').AsInteger));
    vtempSql3 := vtempSql3 +
      vDadosIni.IfThen(cadconciliaconfere.vbandeiraConcCartao.dataSet.FieldByName('cod_bandeira').AsInteger = 0,
        '', ' and COD_BANDEIRA_ADM = ' + IntToStr(cadconciliaconfere.vbandeiraConcCartao.dataSet.FieldByName('cod_bandeira').AsInteger));

    vtempSql := vtempSql +
    	vDadosIni.IfThen(UpperCase(trim(ComboBoxEventoFinanc.Items[ComboBoxEventoFinanc.ItemIndex])) = 'TODOS',
      	'', ' and EVENT_TYPE_DESCRIPTION = ' + QuotedStr(trim(ComboBoxEventoFinanc.Items[ComboBoxEventoFinanc.ItemIndex])));

    if pendenciasconfere.dataSet.Filtered then
	    pendenciasconfere.dataSet.Filtered := False;

    if pendenciasconfere.vcreditosPendConcCartao.dataSet.Filtered then
	    pendenciasconfere.vcreditosPendConcCartao.dataSet.Filtered := False;

    if pendenciasconfere.vcreditosPendDataConcCartao.dataSet.Filtered then
	    pendenciasconfere.vcreditosPendDataConcCartao.dataSet.Filtered := False;

    pendenciasconfere.abreConsultaPendencias(
      StrToDate(meDtInicialFinanc.Text),
      StrToDate(meDtFinalFinanc.Text),
      vtempSql1);

    pendenciasconfere.vcreditosPendConcCartao.abreCreditos(
      ' DATA_VENC_C >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', StrToDate(meDtInicialFinanc.Text))) +
      ' and DATA_VENC_C <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', StrToDate(meDtFinalFinanc.Text))),
      vtempSql2);

    pendenciasconfere.vcreditosPendDataConcCartao.abreCreditos(
      ' DATA_VENC_C >= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', StrToDate(meDtInicialFinanc.Text))) +
      ' and DATA_VENC_C <= ' + QuotedStr(FormatDateTime('mm/dd/yyyy', StrToDate(meDtFinalFinanc.Text))),
      vtempSql3);

    MemoErros.Clear;
    if not cadconciliaconfere.abreConsultaFinanceiro(
    	StrToDate(meDtInicialFinanc.Text),
      StrToDate(meDtFinalFinanc.Text),
      vtempSql,
    	MemoErros) then
	    	vErroFinanc := true;

    cadconciliaconfereRec.abreConsultaFinanceiroRec(
    	cadconciliaconfere,
      StrToDate(meDtInicialFinanc.Text),
      StrToDate(meDtFinalFinanc.Text),
      vtempSql);

    if (vErroFinanc) then
	    if (MemoErros.Lines.Count > 0) then
	    	Application.MessageBox('Alguns erros encontrados favor olhar na aba erros, favor verificar antes de continuar!', 'Atenção', MB_ICONERROR + MB_OK);

    if (vErroFinanc) then
  	begin
    	btSelectAll.Enabled           := false;
      btUnSelectAll.Enabled         := false;
      btSomarFinanc.Enabled         := false;
      BitBtn_QuitarCreditos.Enabled := false;
      BitBtn_ExportarExcel.Enabled  := false;
      BitBtn_Imprimir.Enabled       := false;
    end
    else
    begin
      btSelectAll.Enabled           := vDadosIni.IfThen(cadconciliaconfere.dataSet.RecordCount > 0, true, false);
      btUnSelectAll.Enabled         := vDadosIni.IfThen(cadconciliaconfere.dataSet.RecordCount > 0, true, false);
      btSomarFinanc.Enabled         := vDadosIni.IfThen(cadconciliaconfere.dataSet.RecordCount > 0, true, false);
      BitBtn_QuitarCreditos.Enabled := vDadosIni.IfThen(cadconciliaconfere.dataSet.RecordCount > 0, true, false);
      BitBtn_ExportarExcel.Enabled  := vDadosIni.IfThen(cadconciliaconfere.dataSet.RecordCount > 0, true, false);
      BitBtn_Imprimir.Enabled       := vDadosIni.IfThen(cadconciliaconfereRec.vTotFinancRec > 0, true, false);
    end;

    lbDataHoraApi.Caption := cadconciliaconfere.retornaDataConsultaFinanc(cadconciliaconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger);
	  if trim(lbDataHoraApi.Caption) = '' then
  		lbDataHoraApi.Caption := '01/01/2000 00:00:00';

    btDesPendenciaConfere.Enabled := vDadosIni.IfThen(pendenciasconfere.vTotPendConfere > 0, true, false);
    lbDesPendenciaConfere.Caption := 'Pendências conciliação: ' + Format('%0.2n', [pendenciasconfere.vTotPendConfere]);

    btCreditosNaoEncontrado.Enabled := vDadosIni.IfThen(pendenciasconfere.vcreditosPendConcCartao.vTotCredAbertos > 0, true, false);
    lbCreditosNaoEncontrado.Caption := 'Créditos não encontrados: ' + Format('%0.2n', [pendenciasconfere.vcreditosPendConcCartao.vTotCredAbertos]);

    btCreditosDivergenciaData.Enabled := vDadosIni.IfThen(pendenciasconfere.vcreditosPendDataConcCartao.vTotCredPendData > 0, true, false);
    lbCreditosDivergenciaData.Caption := 'Créditos divergência de data: ' + Format('%0.2n', [pendenciasconfere.vcreditosPendDataConcCartao.vTotCredPendData]);

    btCreditosQuitados.Enabled := vDadosIni.IfThen(cadconciliaconfereRec.vTotFinancRec > 0, true, false);
    lbCreditosQuitados.Caption := 'Créditos quitados: ' + Format('%0.2n', [cadconciliaconfereRec.vTotFinancRec]);

    BitBtn_EmpresaAdq.Enabled         := true;
    BitBtn_TipoLanc.Enabled           := true;
    BitBtn_ContasAjuste.Enabled       := true;
//    GroupBox7.Visible := true;

    edTotTarifaLiq.Text							  := Format('%0.2n', [Abs(cadconciliaconfere.vTotTarifaLiq) +
    																							        Abs(cadconciliaconfere.vTotTarifaLiqQuit)]);

    edTotAjustePositivoLiq.Text 		  := Format('%0.2n', [Abs(cadconciliaconfere.vTotAjustesPositivoLiq) +
    																											Abs(cadconciliaconfere.vTotAjustesPositivoLiqQuit)]);

    edTotAjusteNegativoLiq.Text 		  := Format('%0.2n', [Abs(cadconciliaconfere.vTotAjustesNegativoLiq) +
    																											Abs(cadconciliaconfere.vTotAjustesNegativoLiqQuit)]);

    edTotComissoesLiq.Text        	  := Format('%0.2n', [Abs(cadconciliaconfere.vTotComissoesLiq) +
    																										  Abs(cadconciliaconfere.vTotComissoesLiqQuit)]);

    lbTotVendasBruto.Caption 			    := Format('%0.2n', [Abs(cadconciliaconfere.vTotVendasBruto)]);
    lbTotCancelamentosBruto.Caption   := Format('%0.2n', [Abs(cadconciliaconfere.vTotCancelamentosBruto)]);
    lbTotChargeBackBruto.Caption 	    := Format('%0.2n', [Abs(cadconciliaconfere.vTotChargeBackBruto)]);
    lbTotAntecipacoesBruto.Caption    := Format('%0.2n', [Abs(cadconciliaconfere.vTotAntecipacoesBruto)]);

    lbTotVendasLiq.Caption 			      := Format('%0.2n', [Abs(cadconciliaconfere.vTotVendasLiq) +
    																											Abs(cadconciliaconfere.vTotVendasLiqQuit)]);

    lbTotVendasLiqAdm.Caption 			  := Format('%0.2n', [Abs(cadconciliaconfere.vTotVendasLiqAdm)]);

    lbTotCancelamentosLiq.Caption     := Format('%0.2n', [- (Abs(cadconciliaconfere.vTotCancelamentosLiq) +
    																												 Abs(cadconciliaconfere.vTotCancelamentosLiqQuit))]);

    lbTotCancelamentosLiqAdm.Caption  := Format('%0.2n', [- Abs(cadconciliaconfere.vTotCancelamentosLiqAdm)]);

    lbTotChargeBackLiq.Caption 	      := Format('%0.2n', [- (Abs(cadconciliaconfere.vTotChargeBackLiq) +
    																												 Abs(cadconciliaconfere.vTotChargeBackLiqQuit))]);

    lbTotChargeBackLiqAdm.Caption     := Format('%0.2n', [- Abs(cadconciliaconfere.vTotChargeBackLiqAdm)]);

    lbTotAjustePosLiq.Caption 	      := Format('%0.2n', [Abs(cadconciliaconfere.vTotAjustesPositivoLiq) +
    																											Abs(cadconciliaconfere.vTotAjustesPositivoLiqQuit)]);

    lbTotAjustePosLiqAdm.Caption 	    := Format('%0.2n', [Abs(cadconciliaconfere.vTotAjustesPositivoLiqAdm)]);

    lbTotAjusteNegLiq.Caption 			  := Format('%0.2n', [- (Abs(cadconciliaconfere.vTotAjustesNegativoLiq) +
    																												 Abs(cadconciliaconfere.vTotAjustesNegativoLiqQuit))]);

    lbTotAjusteNegLiqAdm.Caption 	    := Format('%0.2n', [- Abs(cadconciliaconfere.vTotAjustesNegativoLiqAdm)]);

    lbTotPendenciaLiq.Caption         := Format('%0.2n', [pendenciasconfere.vTotPendConfere]);

    lbTotQuitadosLiq.Caption          := Format('%0.2n', [Abs(cadconciliaconfereRec.vTotFinancRec)]);

    lbTotAntecipacoesLiq.Caption      := Format('%0.2n', [Abs(cadconciliaconfere.vTotAntecipacoesLiq)]);

    lbPagoOperadora.Caption           := Format('%0.2n', [
      Abs(cadconciliaconfere.vTotVendasLiq)
      + Abs(cadconciliaconfere.vTotAntecipacoesLiq)
      - Abs(cadconciliaconfere.vTotCancelamentosLiq)
      - Abs(cadconciliaconfere.vTotChargeBackLiq)
      + Abs(cadconciliaconfere.vTotAjustesPositivoLiq)
      - Abs(cadconciliaconfere.vTotAjustesNegativoLiq)
      + pendenciasconfere.vTotPendConfere 
      + Abs(cadconciliaconfere.vTotVendasLiqQuit)   //cadconciliaconfereRec.vTotFinancRec]);
      - Abs(cadconciliaconfere.vTotCancelamentosLiqQuit)
      - Abs(cadconciliaconfere.vTotChargeBackLiqQuit)
      + Abs(cadconciliaconfere.vTotAjustesPositivoLiqQuit)
      - Abs(cadconciliaconfere.vTotAjustesNegativoLiqQuit)]);

    lbPagoOperadoraAdm.Caption        := Format('%0.2n', [
      Abs(cadconciliaconfere.vTotVendasLiqAdm)
      + Abs(cadconciliaconfere.vTotAntecipacoesLiqAdm)
      - Abs(cadconciliaconfere.vTotCancelamentosLiqAdm)
      - Abs(cadconciliaconfere.vTotChargeBackLiqAdm)
      + Abs(cadconciliaconfere.vTotAjustesPositivoLiqAdm)
      - Abs(cadconciliaconfere.vTotAjustesNegativoLiqAdm)]);

    vTotPendConfere    := pendenciasconfere.vTotPendConfere;
  	vTotFinancRec      := Abs(cadconciliaconfereRec.vTotFinancRec);
  finally
  	vDadosIni._GravaConfiguracoesInteger(DBLookupComboBoxUnificadasFinanc.Name, DBLookupComboBoxUnificadasFinanc.KeyValue);
    vDadosIni._GravaConfiguracoesString(DBLookupComboBoxNumEstFinanc.Name, DBLookupComboBoxNumEstFinanc.KeyValue);
    vDadosIni._GravaConfiguracoesInteger(DBLookupComboBoxAdmCartaoFinanc.Name, DBLookupComboBoxAdmCartaoFinanc.KeyValue);
  	vDadosIni._GravaConfiguracoesString(meDtInicialFinanc.Name, meDtInicialFinanc.Text);
    vDadosIni._GravaConfiguracoesString(meDtFinalFinanc.Name, meDtFinalFinanc.Text);
    SpeedButton_BuscarArquivos.Enabled := true;
  	BitBtn_BuscarFinanc.Enabled := true;
    BitBtn_EmpresaAdq.Enabled := true;
    BitBtn_TipoLanc.Enabled := true;
    BitBtn_ContasAjuste.Enabled := true;
    ckLancarTarifas.Enabled := true;
    ckLancarComissoes.Enabled := true;
    ckLancarAjustePositivo.Enabled := true;
    ckLancarAjusteNegativo.Enabled := true;
//    FrmConciliaCartaoConfere.Enabled := true;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConciliaCartaoConfere.BitBtn_EmpresaAdqClick(Sender: TObject);
begin
	salvaConfiguracoesJanela('N');
	vDadosIni.cadastrosbasicos_empresaadq(1);
end;

procedure TFrmConciliaCartaoConfere.BitBtn_ExportarExcelClick(Sender: TObject);
begin
	SalvardadosnoExcel1Click(Sender);
end;

procedure TFrmConciliaCartaoConfere.BitBtn_ImprimirClick(Sender: TObject);
begin
	if not vDadosIni.PesqPros('IMPFIN041', 'IMPRIMIR', '', 'CONCILIACAO_FINANCEIRO_REC', '', cadconciliaconfere.buscas, false) then
    exit;
	Valor := 0;
  Valor2 := 0;
  ValorLiquido := 0;
  ValorLiquido2 := 0;
  lbEmpresa.Caption := trim(vDadosIni.vEmp.vnomeEmpresa);
  lbEmpresa1.Caption := trim(vDadosIni.vEmp.vnomeEmpresa);
  if vDadosIni.vEmp.vFinanceiroUnificado then
  	QuickRep_Conciliacao1.Preview
  else
	  QuickRep_Conciliacao.Preview;
end;

procedure TFrmConciliaCartaoConfere.BitBtn_QuitarCreditosClick(Sender: TObject);
var
	vbtSelectAll: boolean;
  vbtUnSelectAll: boolean;
  vbtSomar: boolean;
	vBitBtn_BuscarArquivos: boolean;
  vBitBtn_BuscarFinanc: boolean;
  vBitBtn_QuitarCreditos: boolean;
  vBitBtn_ExportarExcel: boolean;
  vBitBtn_Imprimir: boolean;
  vBitBtn_EmpresaAdq: boolean;
  vBitBtn_TipoLanc: boolean;
  vBitBtn_ContasAjuste: boolean;
  vSpeedButtonAtualizarApi: boolean;
  vbtDesPendenciaConfere: boolean;
  vbtCreditosNaoEncontrado: boolean;
  vbtCreditosDivergenciaData: boolean;
  vbtCreditosQuitados: boolean;
  vckLancarTarifas: boolean;
  vckLancarComissoes: boolean;
  vckLancarAjustePositivo: boolean;
  vckLancarAjusteNegativo: boolean;
begin
	try
  	Screen.Cursor := crHourGlass;
//  	FrmConciliaCartaoConfere.Enabled := false;
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'A', cadconciliaconfere.buscas) then
      Exit;
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_PAGAR', 'I', cadconciliaconfere.buscas) then
      Exit;
    if not vDadosIni.validarAcessoCadastrosEmpresas('LANCAMENTOS', 'I', cadconciliaconfere.buscas) then
      Exit;
    if not vDadosIni.validarAcessoCadastrosEmpresas('CONTAS_A_RECEBER', 'A', cadconciliaconfere.buscas) then
      Exit;
    // Financeiro sendo fechado
	  if vDadosIni.financeiroFechando(cadconciliaconfere.buscas) then
  	  Exit;

    cadconciliaconfere.vLancarTarifa := ckLancarTarifas.Checked;
  	cadconciliaconfere.vLancarComissao := ckLancarComissoes.Checked;
	 	cadconciliaconfere.vLancarAjustePositivo := ckLancarAjustePositivo.Checked;
	  cadconciliaconfere.vLancarAjusteNegativo := ckLancarAjusteNegativo.Checked;

    // Salvando estado do componentes
    vbtSelectAll := btSelectAll.Enabled;
    vbtUnSelectAll := btUnSelectAll.Enabled;
    vbtSomar := btSomarFinanc.Enabled;
    vBitBtn_BuscarArquivos := SpeedButton_BuscarArquivos.Enabled;
    vBitBtn_BuscarFinanc := BitBtn_BuscarFinanc.Enabled;
    vBitBtn_QuitarCreditos := BitBtn_QuitarCreditos.Enabled;
    vBitBtn_ExportarExcel := BitBtn_ExportarExcel.Enabled;
    vBitBtn_Imprimir := BitBtn_Imprimir.Enabled;
    vBitBtn_EmpresaAdq := BitBtn_EmpresaAdq.Enabled;
    vBitBtn_ContasAjuste := BitBtn_ContasAjuste.Enabled;
    vBitBtn_TipoLanc := BitBtn_TipoLanc.Enabled;
    vBitBtn_ContasAjuste := BitBtn_ContasAjuste.Enabled;
    vSpeedButtonAtualizarApi := SpeedButtonAtualizarApi.Enabled;
    vbtDesPendenciaConfere := btDesPendenciaConfere.Enabled;
    vbtCreditosNaoEncontrado := btCreditosNaoEncontrado.Enabled;
    vbtCreditosDivergenciaData := btCreditosDivergenciaData.Enabled;
    vbtCreditosQuitados := btCreditosQuitados.Enabled;
    vckLancarTarifas := ckLancarTarifas.Enabled;
    vckLancarComissoes := ckLancarComissoes.Enabled;
    vckLancarAjustePositivo := ckLancarAjustePositivo.Enabled;
    vckLancarAjusteNegativo := ckLancarAjusteNegativo.Enabled;

    btSelectAll.Enabled := False;
    btUnSelectAll.Enabled := False;
    btSomarFinanc.Enabled := False;
  	SpeedButton_BuscarArquivos.Enabled := False;
    BitBtn_BuscarFinanc.Enabled := False;
    BitBtn_QuitarCreditos.Enabled := False;
    BitBtn_ExportarExcel.Enabled := False;
    BitBtn_Imprimir.Enabled := False;
    BitBtn_EmpresaAdq.Enabled := False;
    BitBtn_TipoLanc.Enabled := False;
    BitBtn_ContasAjuste.Enabled := False;
    SpeedButtonAtualizarApi.Enabled := False;
    btDesPendenciaConfere.Enabled := False;
    btCreditosNaoEncontrado.Enabled := False;
    btCreditosDivergenciaData.Enabled := False;
    btCreditosQuitados.Enabled := False;
    ckLancarTarifas.Enabled := False;
    ckLancarComissoes.Enabled := False;
    ckLancarAjustePositivo.Enabled := False;
    ckLancarAjusteNegativo.Enabled := False;

    lbl_statusProc.Visible := true;
	  Gauge_HistoricoRetorno.Visible := true;

    if not cadconciliaconfere.confirmarConciliacao(Gauge_HistoricoRetorno) then
    begin
    	// Voltando estado do componentes
      btSelectAll.Enabled := vbtSelectAll;
      btUnSelectAll.Enabled := vbtUnSelectAll;
      btSomarFinanc.Enabled := vbtSomar;
      SpeedButton_BuscarArquivos.Enabled := vBitBtn_BuscarArquivos;
      BitBtn_BuscarFinanc.Enabled := vBitBtn_BuscarFinanc;
      BitBtn_QuitarCreditos.Enabled := vBitBtn_QuitarCreditos;
      BitBtn_ExportarExcel.Enabled := vBitBtn_ExportarExcel;
      BitBtn_Imprimir.Enabled := vBitBtn_Imprimir;
      BitBtn_EmpresaAdq.Enabled := vBitBtn_EmpresaAdq;
      BitBtn_ContasAjuste.Enabled := vBitBtn_ContasAjuste;
      BitBtn_TipoLanc.Enabled := vBitBtn_TipoLanc;
      BitBtn_ContasAjuste.Enabled := vBitBtn_ContasAjuste;
      SpeedButtonAtualizarApi.Enabled := vSpeedButtonAtualizarApi;
      btDesPendenciaConfere.Enabled := vbtDesPendenciaConfere;
      btCreditosNaoEncontrado.Enabled := vbtCreditosNaoEncontrado;
      btCreditosDivergenciaData.Enabled := vbtCreditosDivergenciaData;
      btCreditosQuitados.Enabled := vbtCreditosQuitados;
      ckLancarTarifas.Enabled := vckLancarTarifas;
      ckLancarComissoes.Enabled := vckLancarComissoes;
      ckLancarAjustePositivo.Enabled := vckLancarAjustePositivo;
      ckLancarAjusteNegativo.Enabled := vckLancarAjusteNegativo;
    	exit;
    end;

    cadconciliaconfere.dataSet.EmptyDataSet;

   	BitBtn_BuscarFinancClick(Sender);

//    edTotTarifaLiq.Text							:= Format('%0.2n', [0.00]);
//    edTotAjustePositivoLiq.Text 		:= Format('%0.2n', [0.00]);
//    edTotAjusteNegativoLiq.Text 		:= Format('%0.2n', [0.00]);
//    edTotComissoesLiq.Text        	:= Format('%0.2n', [0.00]);
//
//    lbTotVendasBruto.Caption 			  := Format('%0.2n', [0.00]);
//    lbTotCancelamentosBruto.Caption := Format('%0.2n', [0.00]);
//    lbTotChargeBackBruto.Caption 	  := Format('%0.2n', [0.00]);
//    lbTotAntecipacoesBruto.Caption  := Format('%0.2n', [0.00]);
//
//    lbTotVendasLiq.Caption 			    := Format('%0.2n', [0.00]);
//    lbTotCancelamentosLiq.Caption   := Format('%0.2n', [0.00]);
//    lbTotChargeBackLiq.Caption 	    := Format('%0.2n', [0.00]);
//    lbTotAjustePosLiq.Caption 	    := Format('%0.2n', [0.00]);
//    lbTotAjusteNegLiq.Caption				:= Format('%0.2n', [0.00]);
//    lbTotPendenciaLiq.Caption       := Format('%0.2n', [0.00]);
//    lbTotQuitadosLiq.Caption        := Format('%0.2n', [0.00]);
//    lbTotAntecipacoesLiq.Caption    := Format('%0.2n', [0.00]);
//
//    lbPagoOperadora.Caption         := Format('%0.2n', [0.00]);
//
//    lbDesPendenciaConfere.Caption     := 'Pendências conciliação: ' + Format('%0.2n', [0.00]);
//    lbCreditosNaoEncontrado.Caption   := 'Créditos não encontrados: ' + Format('%0.2n', [0.00]);
//    lbCreditosDivergenciaData.Caption := 'Créditos divergência de data: ' + Format('%0.2n', [0.00]);

//    btSelectAll.Enabled               := false;
//    btUnSelectAll.Enabled             := false;
//    btSomarFinanc.Enabled             := false;
//    SpeedButton_BuscarArquivos.Enabled     := True;
//    BitBtn_BuscarFinanc.Enabled       := True;
//    BitBtn_QuitarCreditos.Enabled     := false;
//    BitBtn_ExportarExcel.Enabled      := false;
//    BitBtn_Imprimir.Enabled           := false;
//    BitBtn_EmpresaAdq.Enabled         := True;
//    BitBtn_ContasAjuste.Enabled       := True;
//    BitBtn_TipoLanc.Enabled           := True;
//    BitBtn_ContasAjuste.Enabled       := True;
//    SpeedButtonAtualizarApi.Enabled   := vSpeedButtonAtualizarApi;
//    btDesPendenciaConfere.Enabled     := vbtDesPendenciaConfere;
//    btCreditosNaoEncontrado.Enabled   := vbtCreditosNaoEncontrado;
//    btCreditosDivergenciaData.Enabled := vbtCreditosDivergenciaData;
//    btCreditosQuitados.Enabled        := vbtCreditosQuitados;
//    ckLancarTarifas.Enabled           := vckLancarTarifas;
//    ckLancarComissoes.Enabled         := vckLancarComissoes;
//    ckLancarAjustePositivo.Enabled    := vckLancarAjustePositivo;
//    ckLancarAjusteNegativo.Enabled    := vckLancarAjusteNegativo;

//    GroupBox7.Visible := true;
  finally
    lbl_statusProc.Visible := false;
	  Gauge_HistoricoRetorno.Visible := false;
//    FrmConciliaCartaoConfere.Enabled := true;
  	Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConciliaCartaoConfere.BitBtn_TipoLancClick(Sender: TObject);
begin
	salvaConfiguracoesJanela('N');
	vDadosIni.cadastrosbasicos_contastipolanc(1);
  cadconciliaconfere.vnumestConcCartao.abreConciliacartaoNumEst;
  pendenciasconfere.vnumestConcCartao.abreConciliacartaoNumEst;
end;

procedure TFrmConciliaCartaoConfere.btCreditosDivergenciaDataClick(
  Sender: TObject);
begin
	PageControl1.ActivePage := TabSheet4;
  TabSheet4.Show;
end;

procedure TFrmConciliaCartaoConfere.btCreditosNaoEncontradoClick(
  Sender: TObject);
begin
	PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;
end;

procedure TFrmConciliaCartaoConfere.btCreditosQuitadosClick(Sender: TObject);
begin
	PageControl1.ActivePage := TabSheet12;
  TabSheet12.Show;
end;

procedure TFrmConciliaCartaoConfere.btDesPendenciaConfereClick(Sender: TObject);
begin
	PageControl1.ActivePage := TabSheet2;
  TabSheet2.Show;
end;

procedure TFrmConciliaCartaoConfere.btDesTodosPendencExcluirClick(
  Sender: TObject);
begin
	try
		Screen.Cursor := crHourGlass;
		pendenciasconfere.desmarcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConciliaCartaoConfere.btSelectAllClick(Sender: TObject);
begin
	cadconciliaconfere._marcarTodos;
end;

procedure TFrmConciliaCartaoConfere.btSelectAllResolverPendClick(
  Sender: TObject);
begin
	pendenciasconfere.marcarTodosTemp(pendenciasconfere.fTempPendConcCartao);
end;

procedure TFrmConciliaCartaoConfere.btSelTodosPendencExcluirClick(
  Sender: TObject);
begin
	try
		Screen.Cursor := crHourGlass;
		pendenciasconfere.marcarTodos;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConciliaCartaoConfere.btSomarFinancAdmClick(Sender: TObject);
begin
	cadconciliaconfereadm.somarSelecionados;
end;

procedure TFrmConciliaCartaoConfere.btSomarFinancClick(Sender: TObject);
begin
  cadconciliaconfere.somarSelecionados;
end;

procedure TFrmConciliaCartaoConfere.btUnSelectAllClick(Sender: TObject);
begin
	cadconciliaconfere._desmarcarTodos;
end;

procedure TFrmConciliaCartaoConfere.btUnSelectAllResolverPendClick(
  Sender: TObject);
begin
	pendenciasconfere.desmarcarTodosTemp(pendenciasconfere.fTempPendConcCartao);
end;

procedure TFrmConciliaCartaoConfere.bt_financeiro_excluir_confereClick(
  Sender: TObject);
begin
	btDesPendenciaConfere.Enabled   := false;
  btCreditosNaoEncontrado.Enabled := false;

  GroupBox6.Parent := pnDBGridPendConfereExcluir;
  DBGrid2.Parent := pnDBGridPendConfereExcluir;

	PageControl1.ActivePage := TabSheet5;
  TabSheet5.Show;
end;

procedure TFrmConciliaCartaoConfere.bt_financeiro_gotocancel_confereClick(
  Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('', 'Removendo filtro registros administradora...');

    if trim(pendenciasconfere.vUltSQL) <> '' then
    	pendenciasconfere.montaSelect(pendenciasconfere.vUltSQL)
    else
    begin
      if pendenciasconfere.dataSet.Filtered then
        pendenciasconfere.dataSet.Filtered := False;
    end;
  finally
  	vDadosIni.fechaStatusProcessamento;
  	Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConciliaCartaoConfere.bt_financeiro_gotocancel_sistemaClick(
  Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
    vDadosIni.abreStatusProcessamento('', 'Removendo filtro registro financeiro em aberto...');
    
    if trim(pendenciasconfere.vcreditosPendConcCartao.vUltSQL) <> '' then
    	pendenciasconfere.vcreditosPendConcCartao.montaSelect(pendenciasconfere.vcreditosPendConcCartao.vUltSQL)
    else
    begin
      if pendenciasconfere.vcreditosPendConcCartao.dataSet.Filtered then
        pendenciasconfere.vcreditosPendConcCartao.dataSet.Filtered := False;
    end;
  finally
  	vDadosIni.fechaStatusProcessamento;
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConciliaCartaoConfere.bt_financeiro_goto_confereClick(
  Sender: TObject);
begin
	try
  	Screen.Cursor := crHourGlass;
    pendenciasconfere.localizarPendencias(
      pendenciasconfere.vcreditosPendConcCartao.dataSet.FieldByName('N_DOCNSU_ADM').AsString,
      pendenciasconfere.vcreditosPendConcCartao.dataSet.FieldByName('N_AUT_CART').AsString,
      pendenciasconfere.vcreditosPendConcCartao.dataSet.FieldByName('VALOR_C').AsFloat,
      pendenciasconfere.vcreditosPendConcCartao.dataSet.FieldByName('VALOR_LIQUIDO').AsFloat,
      pendenciasconfere.vcreditosPendConcCartao.dataSet.FieldByName('NPARCELA').AsInteger);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConciliaCartaoConfere.bt_financeiro_goto_sistemaClick(
  Sender: TObject);
begin
	try
    Screen.Cursor := crHourGlass;
    pendenciasconfere.vcreditosPendConcCartao.localizarCreditos(
      pendenciasconfere.dataSet.FieldByName('NSU').AsString,
      pendenciasconfere.dataSet.FieldByName('AUTHORIZATION_NUMBER').AsString,
      pendenciasconfere.dataSet.FieldByName('GROSS_AMOUNT').AsFloat,
      pendenciasconfere.dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat,
      pendenciasconfere.dataSet.FieldByName('INSTALLMENT_NUMBER').AsInteger);
  finally
  	Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConciliaCartaoConfere.bt_financeiro_pesquisar_confereClick(
  Sender: TObject);
var
	I: Integer;
begin
	btDesPendenciaConfere.Enabled   := false;
  btCreditosNaoEncontrado.Enabled := false;

  DBLookupComboBoxUnificadasPendencExcluir.KeyValue := vDadosIni._LerConfiguracoesRegistroInteger(DBLookupComboBoxUnificadasPendencExcluir.Name);
  DBLookupComboBoxNumEstPendencExcluir.KeyValue     := vDadosIni._LerConfiguracoesRegistroString(DBLookupComboBoxNumEstPendencExcluir.Name);
  DBLookupComboBoxAdmCartaoPendencExcluir.KeyValue  := vDadosIni._LerConfiguracoesRegistroInteger(DBLookupComboBoxAdmCartaoPendencExcluir.Name);
  meDtInicialPendencExcluir.Text                    := vDadosIni._LerConfiguracoesRegistroString(meDtInicialPendencExcluir.Name);
  meDtFinalPendencExcluir.Text                      := vDadosIni._LerConfiguracoesRegistroString(meDtFinalPendencExcluir.Name);
  edNSUPendencExlcuir.Text                          := vDadosIni._LerConfiguracoesRegistroString(edNSUPendencExlcuir.Name);
  edNumAutPendencExcluir.Text                       := vDadosIni._LerConfiguracoesRegistroString(edNumAutPendencExcluir.Name);

  vCodUnificadaPend := vDadosIni.IfThen(DBLookupComboBoxUnificadasPendenc.KeyValue = null, 0, DBLookupComboBoxUnificadasPendenc.KeyValue);
  vNumEstPend       := vDadosIni.IfThen(DBLookupComboBoxNumEstPendencExcluir.KeyValue, '', DBLookupComboBoxNumEstPendencExcluir.KeyValue);
  vCodAdmCartaoPend := vDadosIni.IfThen(DBLookupComboBoxAdmCartaoPendenc.KeyValue = null, 0, DBLookupComboBoxAdmCartaoPendenc.KeyValue);
  vCodBandeiraPend  := vDadosIni.IfThen(DBLookupComboBoxBandeiraPendenc.KeyValue = null, 0, DBLookupComboBoxBandeiraPendenc.KeyValue);

  if vCodUnificadaPend > 0 then
  	DBLookupComboBoxUnificadasPendencExcluir.KeyValue := vCodUnificadaPend;

  if trim(vNumEstPend) <> '' then
  	DBLookupComboBoxNumEstPendencExcluir.KeyValue     := vNumEstPend;

  if vCodAdmCartaoPend > 0 then
  	DBLookupComboBoxAdmCartaoPendencExcluir.KeyValue  := vCodAdmCartaoPend;

  if vCodBandeiraPend > 0 then
  	DBLookupComboBoxBandeiraPendencExcluir.KeyValue   := vCodBandeiraPend;

  GroupBox6.Parent := pnDBGridPendConfereExcluir;
  DBGrid2.Parent := pnDBGridPendConfereExcluir;

  pendenciasconfere.dataSet.FieldByName('SEL').Tag := 0;

  TabSheet1.TabVisible := false;
  TabSheet2.TabVisible := false;
  TabSheet3.TabVisible := false;
  TabSheet4.TabVisible := false;
  TabSheet12.TabVisible:= false;

  vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
      vAlterarNomeDtSet2, GridCfg2, DBGrid2, cdsGrid2, cdsColunas2, trans, ListGridsAndDataSets2,
      ListPositions2, nomeDTSEt2, PrimeiraPesquisa2, vCamposPadraoRegistro2, usuario);

	vDadosIni.configurarGridPeloConfigColunas(DBGrid2, GridCfg2, cdsGrid2, cdsColunas2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);

  for I := 0 to DBGrid2.Columns.Count - 1 do
  	if UpperCase(trim(DBGrid2.Columns[i].FieldName)) = 'SEL' then
    begin
    	DBGrid2.Columns[i].Visible := true;
		  DBGrid2.Columns[i].Index := 0;
      DBGrid2.Columns[i].Width := 18;
    end;

	PageControl1.ActivePage := TabSheet5;
  TabSheet5.Show;
end;

procedure TFrmConciliaCartaoConfere.bt_financeiro_vincular_confereClick(
  Sender: TObject);
begin
	if pendenciasconfere.dataSet.IsEmpty then
  	exit;

  if pendenciasconfere.vcreditosPendConcCartao.dataSet.IsEmpty then
  	exit;
    
	if not pendenciasconfere.vcreditosPendConcCartao.vincularCreditos(
    pendenciasconfere.dataSet.FieldByName('ID').AsInteger,
    pendenciasconfere.dataSet.FieldByName('INSTALLMENT_NUMBER').AsInteger,
    pendenciasconfere.dataSet.FieldByName('INSTALLMENTS_TOTAL').AsInteger,
    pendenciasconfere.dataSet.FieldByName('COD_EMPRESA').AsInteger,
    pendenciasconfere.dataSet.FieldByName('GROSS_AMOUNT').AsFloat,
    pendenciasconfere.dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat,
    pendenciasconfere.dataSet.FieldByName('NSU').AsString,
    pendenciasconfere.dataSet.FieldByName('AUTHORIZATION_NUMBER').AsString) then
      exit;

  try
  	vDadosIni.abreStatusProcessamento('', 'Consultando pendências administradora...');

    if trim(pendenciasconfere.vUltSQL) <> '' then
	  	pendenciasconfere.montaSelect(pendenciasconfere.vUltSQL)
    else
    begin
      if pendenciasconfere.dataSet.Filtered then
		  	pendenciasconfere.dataSet.Filtered := False;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;

  try
  	vDadosIni.abreStatusProcessamento('', 'Consultando registros financeiros não encontrados na conciliação...');

    if trim(pendenciasconfere.vcreditosPendConcCartao.vUltSQL) <> '' then
  		pendenciasconfere.vcreditosPendConcCartao.montaSelect(pendenciasconfere.vcreditosPendConcCartao.vUltSQL)
    else
    begin
      if pendenciasconfere.vcreditosPendConcCartao.dataSet.Filtered then
		  	pendenciasconfere.vcreditosPendConcCartao.dataSet.Filtered := False;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmConciliaCartaoConfere.bt_financeiro_vincular_sistemaClick(
  Sender: TObject);
begin
	if pendenciasconfere.dataSet.IsEmpty then
  	exit;

	if pendenciasconfere.vcreditosPendConcCartao.dataSet.IsEmpty then
  	exit;

	if not pendenciasconfere.vcreditosPendConcCartao.vincularCreditos(
    pendenciasconfere.dataSet.FieldByName('ID').AsInteger,
    pendenciasconfere.dataSet.FieldByName('INSTALLMENT_NUMBER').AsInteger,
    pendenciasconfere.dataSet.FieldByName('INSTALLMENTS_TOTAL').AsInteger,
    pendenciasconfere.dataSet.FieldByName('COD_EMPRESA').AsInteger,
    pendenciasconfere.dataSet.FieldByName('GROSS_AMOUNT').AsFloat,
    pendenciasconfere.dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat,
    pendenciasconfere.dataSet.FieldByName('NSU').AsString,
    pendenciasconfere.dataSet.FieldByName('AUTHORIZATION_NUMBER').AsString) then
      exit;

  try
  	vDadosIni.abreStatusProcessamento('', 'Consultando pendências administradora...');

    if trim(pendenciasconfere.vUltSQL) <> '' then
	  	pendenciasconfere.montaSelect(pendenciasconfere.vUltSQL)
    else
    begin
      if pendenciasconfere.dataSet.Filtered then
		  	pendenciasconfere.dataSet.Filtered := False;
    end;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;

  try
  	vDadosIni.abreStatusProcessamento('', 'Consultando registros financeiros não encontrados na conciliação...');

    if trim(pendenciasconfere.vcreditosPendConcCartao.vUltSQL) <> '' then
  		pendenciasconfere.vcreditosPendConcCartao.montaSelect(pendenciasconfere.vcreditosPendConcCartao.vUltSQL)
    else
    begin
	   	if pendenciasconfere.vcreditosPendConcCartao.dataSet.Filtered then
  			pendenciasconfere.vcreditosPendConcCartao.dataSet.Filtered := False;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TFrmConciliaCartaoConfere.bt_resolver_pendenciasClick(
  Sender: TObject);
var
  AmenuItem: TMenuItem;
begin
  inherited;
  if not Assigned(FpopMenuOut) then
  begin
    FpopMenuOut := TPopupMenu.Create(Self);

    AmenuItem := TMenuItem.Create(FpopMenuOut);
    AmenuItem.Caption := 'Localizar créditos pelo número de autorização';
    AmenuItem.OnClick := EncontrarCreditosPorNumAutorizacao;
    FpopMenuOut.Items.Add(AmenuItem);
  end;
  FpopMenuOut.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TFrmConciliaCartaoConfere.BuscasFinanceiroAdm(pTipo: string);
var
	I: Integer;
begin
	DBLookupComboBoxUnificadasFinancAdm.KeyValue := DBLookupComboBoxUnificadasFinanc.KeyValue;
  DBLookupComboBoxNumEstFinancAdm.KeyValue := DBLookupComboBoxNumEstFinanc.KeyValue;
  DBLookupComboBoxAdmCartaoFinancAdm.KeyValue := DBLookupComboBoxAdmCartaoFinanc.KeyValue;
  DBLookupComboBoxBandeiraFinancAdm.KeyValue := DBLookupComboBoxBandeiraFinanc.KeyValue;
  meDtInicialFinancAdm.Text := meDtInicialFinanc.Text;
  meDtFinalFinancAdm.Text := meDtFinalFinanc.Text;
  ComboBoxEventoFinancAdm.Text := ComboBoxEventoFinanc.Text;

  if (trim(pTipo) = '') or (trim(pTipo) = 'TOTAL') then
  	ComboBoxEventoFinancAdm.ItemIndex := 0
  else
  begin
    for I := 0 to ComboBoxEventoFinancAdm.Items.Count - 1 do
      if (trim(pTipo) = 'VENDA') and (trim(ComboBoxEventoFinancAdm.Items[I]) = 'Venda') then
      begin
        ComboBoxEventoFinancAdm.ItemIndex := I;
        Break;
      end
      else if (trim(pTipo) = 'AJUSTE') and (trim(ComboBoxEventoFinancAdm.Items[I]) = 'Ajuste') then
      begin
        ComboBoxEventoFinancAdm.ItemIndex := I;
        Break;
      end
      else if (trim(pTipo) = 'CANCELAMENTO') and (trim(ComboBoxEventoFinancAdm.Items[I]) = 'Cancelamento') then
      begin
        ComboBoxEventoFinancAdm.ItemIndex := I;
        Break;
      end
      else if (trim(pTipo) = 'CHARGEBACK') and (trim(ComboBoxEventoFinancAdm.Items[I]) = 'Chargeback') then
      begin
        ComboBoxEventoFinancAdm.ItemIndex := I;
        Break;
      end
      else if (trim(pTipo) = 'ANTECIPACAO') and (Pos('Antecip', trim(ComboBoxEventoFinancAdm.Items[I])) > 0) then
      begin
        ComboBoxEventoFinancAdm.ItemIndex := I;
        Break;
      end;
  end;

  BitBtn_BuscarFinancAdmClick(BitBtn_BuscarFinancAdm);

  PageControl1.ActivePage := TabSheet11;
  TabSheet11.Show;
end;

procedure TFrmConciliaCartaoConfere.Configurarcolunas12Click(Sender: TObject);
begin
	vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas12, DBGrid12, GridCfg12, cdsGrid12, usuario, ListGridsAndDataSets12, vDadosIni.transacaoCol);
end;

procedure TFrmConciliaCartaoConfere.Configurarcolunas1Click(Sender: TObject);
begin
	vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas1, DBGrid1, GridCfg1, cdsGrid1, usuario, ListGridsAndDataSets1, vDadosIni.transacaoCol);
end;

procedure TFrmConciliaCartaoConfere.Configurarcolunas2Click(Sender: TObject);
begin
	vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas2, DBGrid2, GridCfg2, cdsGrid2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TFrmConciliaCartaoConfere.Configurarcolunas3Click(Sender: TObject);
begin
	vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas3, DBGrid3, GridCfg3, cdsGrid3, usuario, ListGridsAndDataSets3, vDadosIni.transacaoCol);
end;

procedure TFrmConciliaCartaoConfere.Configurarcolunas4Click(Sender: TObject);
begin
		vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas4, DBGrid4, GridCfg4, cdsGrid4, usuario, ListGridsAndDataSets4, vDadosIni.transacaoCol);
end;

procedure TFrmConciliaCartaoConfere.Configurarcolunas5Click(Sender: TObject);
begin
	vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas5, DBGrid5, GridCfg5, cdsGrid5, usuario, ListGridsAndDataSets5, vDadosIni.transacaoCol);
end;

procedure TFrmConciliaCartaoConfere.Configurarcolunas6Click(Sender: TObject);
begin
	vDadosIni.ConfigurarcolunasCadPadraoClick(Sender, cdsColunas6, DBGrid6, GridCfg6, cdsGrid6, usuario, ListGridsAndDataSets6, vDadosIni.transacaoCol);
end;

procedure TFrmConciliaCartaoConfere.Copiarparareadetransferncia12Click(
  Sender: TObject);
begin
	Clipboard.AsText := DBGrid12.DataSource.DataSet.FieldByName(DBGrid12.Columns[DBGrid12.SelectedIndex].FieldName).AsString;
end;

procedure TFrmConciliaCartaoConfere.Copiarparareadetransferncia1Click(
  Sender: TObject);
begin
	Clipboard.AsText := DBGrid1.DataSource.DataSet.FieldByName(DBGrid1.Columns[DBGrid1.SelectedIndex].FieldName).AsString;
end;

procedure TFrmConciliaCartaoConfere.Copiarparareadetransferncia2Click(
  Sender: TObject);
begin
	Clipboard.AsText := DBGrid2.DataSource.DataSet.FieldByName(DBGrid2.Columns[DBGrid2.SelectedIndex].FieldName).AsString;
end;

procedure TFrmConciliaCartaoConfere.Copiarparareadetransferncia3Click(
  Sender: TObject);
begin
	Clipboard.AsText := DBGrid3.DataSource.DataSet.FieldByName(DBGrid3.Columns[DBGrid3.SelectedIndex].FieldName).AsString;
end;

procedure TFrmConciliaCartaoConfere.Copiarparareadetransferncia4Click(
  Sender: TObject);
begin
	Clipboard.AsText := DBGrid4.DataSource.DataSet.FieldByName(DBGrid4.Columns[DBGrid4.SelectedIndex].FieldName).AsString;
end;

procedure TFrmConciliaCartaoConfere.Copiarparareadetransferncia5Click(
  Sender: TObject);
begin
	Clipboard.AsText := DBGrid5.DataSource.DataSet.FieldByName(DBGrid5.Columns[DBGrid5.SelectedIndex].FieldName).AsString;
end;

procedure TFrmConciliaCartaoConfere.Copiarparareadetransferncia6Click(
  Sender: TObject);
begin
	Clipboard.AsText := DBGrid6.DataSource.DataSet.FieldByName(DBGrid6.Columns[DBGrid6.SelectedIndex].FieldName).AsString;
end;

procedure TFrmConciliaCartaoConfere.DBGrid12ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
	vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid12, GridCfg12, cdsGrid12,
    cdsColunas12, usuario, ListGridsAndDataSets12, vDadosIni.transacaoCol);
end;

procedure TFrmConciliaCartaoConfere.DBGrid12TitleClick(Column: TColumn);
begin
	vDadosIni.DBGridOnTitleClick(DBGrid12, Column);
end;

procedure TFrmConciliaCartaoConfere.DBGrid1CellClick(Column: TColumn);
begin
	if Column.FieldName = 'SEL' then
  	cadconciliaconfere._marcaDesmarcaLinha;
end;

procedure TFrmConciliaCartaoConfere.DBGrid1ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
	vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid1, GridCfg1, cdsGrid1,
    cdsColunas1, usuario, ListGridsAndDataSets1, vDadosIni.transacaoCol);
end;

procedure TFrmConciliaCartaoConfere.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	if TDBGrid(sender).DataSource.dataSet.FieldByName('Sel').AsString = 'S' then
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor($00DAD5D3);// clHighlight;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end;

	if (TDBGrid(Sender).DataSource.dataSet.FieldByName('ID').AsInteger > 0) then
  begin
    if (Column.FieldName = 'VALOR_LIQUIDO') or (Column.FieldName = 'EVENT_NET_AMOUNT') then
    	if (not TDBGrid(Sender).DataSource.dataSet.FieldByName('VALOR_LIQUIDO').IsNull)
      	and (not TDBGrid(Sender).DataSource.dataSet.FieldByName('EVENT_NET_AMOUNT').IsNull) then
      begin
        if (vDadosIni.StrToFloatFormat(TDBGrid(Sender).DataSource.dataSet.FieldByName('VALOR_LIQUIDO').AsFloat, 2) <>
          vDadosIni.StrToFloatFormat(TDBGrid(Sender).DataSource.dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat, 2)) then
        begin
          TDBGrid(sender).canvas.brush.color := TColor(pnDivergenciaValor.Color);
          TDBGrid(sender).canvas.Font.color := clBlack;
        end;
      end;

    if (Column.FieldName = 'PAYMENT_DATE') or (Column.FieldName = 'DATA_VENC_C') then
    	if (not TDBGrid(Sender).DataSource.dataSet.FieldByName('PAYMENT_DATE').IsNull)
	      and (not TDBGrid(Sender).DataSource.dataSet.FieldByName('DATA_VENC_C').IsNull) then
      begin
        if (TDBGrid(Sender).DataSource.dataSet.FieldByName('PAYMENT_DATE').AsDateTime >
          TDBGrid(Sender).DataSource.dataSet.FieldByName('DATA_VENC_C').AsDateTime) then
        begin
          TDBGrid(sender).canvas.brush.color := TColor(pnDivergenciaData.Color);
          TDBGrid(sender).canvas.Font.color := clBlack;
        end;
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

procedure TFrmConciliaCartaoConfere.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if Key = VK_SPACE then
  	cadconciliaconfere._marcaDesmarcaLinha;
end;

procedure TFrmConciliaCartaoConfere.DBGrid1TitleClick(Column: TColumn);
begin
	vDadosIni.DBGridOnTitleClick(DBGrid1, Column);
end;

procedure TFrmConciliaCartaoConfere.DBGrid2CellClick(Column: TColumn);
begin
	 if Column.FieldName = 'SEL' then
    pendenciasconfere.marcaDesmarcaLinha;
end;

procedure TFrmConciliaCartaoConfere.DBGrid2ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
	vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid2, GridCfg2, cdsGrid2,
    cdsColunas2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);
end;

procedure TFrmConciliaCartaoConfere.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	if (TDBGrid(Sender).DataSource.dataSet.FieldByName('ID').AsInteger > 0) then
  begin
    if (gdFocused in State) then
    begin
      TDBGrid(sender).canvas.brush.color := clWindow;
      TDBGrid(sender).canvas.Font.color := clWindowText;
    end
    else
    begin
      TDBGrid(sender).canvas.brush.color := TColor(pnPendente.Color);
      TDBGrid(sender).canvas.Font.color := clBlack;
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

procedure TFrmConciliaCartaoConfere.DBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
	if (Key = VK_SPACE) and (PageControl1.ActivePage = TabSheet5) then
    if not pendenciasconfere.dataSet.IsEmpty then
      pendenciasconfere.marcaDesmarcaLinha;
end;

procedure TFrmConciliaCartaoConfere.DBGrid2TitleClick(Column: TColumn);
begin
	vDadosIni.DBGridOnTitleClick(DBGrid2, Column);
end;

procedure TFrmConciliaCartaoConfere.DBGrid3ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
	vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid3, GridCfg3, cdsGrid3,
    cdsColunas3, usuario, ListGridsAndDataSets3, vDadosIni.transacaoCol);
end;

procedure TFrmConciliaCartaoConfere.DBGrid3TitleClick(Column: TColumn);
begin
	vDadosIni.DBGridOnTitleClick(DBGrid3, Column);
end;

procedure TFrmConciliaCartaoConfere.DBGrid4ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
	vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid4, GridCfg4, cdsGrid4,
    cdsColunas4, usuario, ListGridsAndDataSets4, vDadosIni.transacaoCol);
end;

procedure TFrmConciliaCartaoConfere.DBGrid4DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	if (TDBGrid(Sender).DataSource.dataSet.FieldByName('ID').AsInteger > 0) then
  begin
    if (Column.FieldName = 'PAYMENT_DATE') or (Column.FieldName = 'DATA_VENC_C') then
    	if (not TDBGrid(Sender).DataSource.dataSet.FieldByName('PAYMENT_DATE').IsNull)
	      and (not TDBGrid(Sender).DataSource.dataSet.FieldByName('DATA_VENC_C').IsNull) then
      begin
        if (TDBGrid(Sender).DataSource.dataSet.FieldByName('PAYMENT_DATE').AsDateTime >
          TDBGrid(Sender).DataSource.dataSet.FieldByName('DATA_VENC_C').AsDateTime) then
        begin
          TDBGrid(sender).canvas.brush.color := TColor(pnDivergenciaData3.Color);
          TDBGrid(sender).canvas.Font.color := clBlack;
        end;
      end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmConciliaCartaoConfere.DBGrid4TitleClick(Column: TColumn);
begin
	vDadosIni.DBGridOnTitleClick(DBGrid4, Column);
end;

procedure TFrmConciliaCartaoConfere.DBGrid5CellClick(Column: TColumn);
begin
	if Column.FieldName = 'SEL' then
  	pendenciasconfere.marcaDesmarcaLinhaTemp(pendenciasconfere.fTempPendConcCartao);
end;

procedure TFrmConciliaCartaoConfere.DBGrid5ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
	vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid5, GridCfg5, cdsGrid5,
    cdsColunas5, usuario, ListGridsAndDataSets5, vDadosIni.transacaoCol);
end;

procedure TFrmConciliaCartaoConfere.DBGrid5DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	if (TDBGrid(Sender).DataSource.dataSet.FieldByName('ID').AsInteger > 0) then
  begin
  	if (Column.FieldName = 'VALOR_C') or (Column.FieldName = 'VALOR_LIQUIDO') then
    begin
      TDBGrid(sender).canvas.brush.color := TColor(pnERP.Color);
      TDBGrid(sender).canvas.Font.color := clBlack;
    end;
    if (Column.FieldName = 'GROSS_AMOUNT') or (Column.FieldName = 'EVENT_NET_AMOUNT') or (Column.FieldName = 'BATCH_NET_AMOUNT') then
    begin
      TDBGrid(sender).canvas.brush.color := TColor(pnConfere.Color);
      TDBGrid(sender).canvas.Font.color := clBlack;
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

procedure TFrmConciliaCartaoConfere.DBGrid5TitleClick(Column: TColumn);
begin
	vDadosIni.DBGridOnTitleClick(DBGrid5, Column);
end;

procedure TFrmConciliaCartaoConfere.DBGrid6ColumnMoved(Sender: TObject;
  FromIndex, ToIndex: Integer);
begin
	vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid6, GridCfg6, cdsGrid6,
    cdsColunas6, usuario, ListGridsAndDataSets6, vDadosIni.transacaoCol);
end;

procedure TFrmConciliaCartaoConfere.DBGrid6DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  Check: Integer;
  R: TRect;
begin
	if (TDBGrid(Sender).DataSource.dataSet.FieldByName('ID').AsInteger > 0) then
  begin
    if (Column.FieldName = 'VALOR_LIQUIDO') or (Column.FieldName = 'EVENT_NET_AMOUNT') then
    	if (not TDBGrid(Sender).DataSource.dataSet.FieldByName('VALOR_LIQUIDO').IsNull)
      	and (not TDBGrid(Sender).DataSource.dataSet.FieldByName('EVENT_NET_AMOUNT').IsNull) then
      begin
        if (vDadosIni.StrToFloatFormat(TDBGrid(Sender).DataSource.dataSet.FieldByName('VALOR_LIQUIDO').AsFloat, 2) <>
          vDadosIni.StrToFloatFormat(TDBGrid(Sender).DataSource.dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat, 2)) then
        begin
          TDBGrid(sender).canvas.brush.color := TColor(pnDivergenciaValor2.Color);
          TDBGrid(sender).canvas.Font.color := clBlack;
        end;
      end;

    if (Column.FieldName = 'PAYMENT_DATE') or (Column.FieldName = 'DATA_VENC_C') then
    	if (not TDBGrid(Sender).DataSource.dataSet.FieldByName('PAYMENT_DATE').IsNull)
	      and (not TDBGrid(Sender).DataSource.dataSet.FieldByName('DATA_VENC_C').IsNull) then
      begin
        if (TDBGrid(Sender).DataSource.dataSet.FieldByName('PAYMENT_DATE').AsDateTime >
          TDBGrid(Sender).DataSource.dataSet.FieldByName('DATA_VENC_C').AsDateTime) then
        begin
          TDBGrid(sender).canvas.brush.color := TColor(pnDivergenciaData2.Color);
          TDBGrid(sender).canvas.Font.color := clBlack;
        end;
      end;
  end;
  TDBGrid(sender).DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure TFrmConciliaCartaoConfere.DBGrid6TitleClick(Column: TColumn);
begin
	vDadosIni.DBGridOnTitleClick(DBGrid6, Column);
end;

procedure TFrmConciliaCartaoConfere.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
	//  QRLabel_n_doc_c.Caption := trim(Retorno._vQuitacaoCredito.dataSet.FieldByName('N_DOC_C').AsString);
  QRLabel_n_doc_c.Caption :=
    trim(cadconciliaconfereRec.dataSet.FieldByName('N_DOC_C').AsString);
  //
  //  Valor :=   Valor  +
  //   Retorno._vQuitacaoCredito.dataSet.FieldByName('VALOR_C').AsFloat;
  //
  //   ValorLiquido := ValorLiquido +
  //   Retorno._vQuitacaoCredito.dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;
  //
  //  QRLabel_Valor.Caption := Format('%m', [Valor]);
  //
  //   QRLabel_ValorJuros.Caption := Format('%m',[ValorLiquido]);

  Valor := Valor +
    //Retorno._vQuitacaoCredito.dataSet.FieldByName('VALOR_C').AsFloat;
  cadconciliaconfereRec.dataSet.FieldByName('VALOR_C').AsFloat;

  ValorLiquido := ValorLiquido +
    //   cadconciliaconfereRec.dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;
  cadconciliaconfereRec.dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;

  //  QRLabel_Valor.Caption := Format('%m', [Valor]);
  QRLabel_Valor.Caption := Format('%m', [Valor]);

  //   QRLabel_ValorJuros.Caption := Format('%m',[ValorLiquido]);
  QRLabel_ValorLiquido.Caption := Format('%m', [ValorLiquido]);
end;

procedure TFrmConciliaCartaoConfere.DetailBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
	//  QRLabel_n_doc_c.Caption := trim(Retorno._vQuitacaoCredito.dataSet.FieldByName('N_DOC_C').AsString);
  QRLabel_n_doc.Caption :=
    trim(cadconciliaconfereRec.dataSet.FieldByName('N_DOC_C').AsString);
  //
  //  Valor :=   Valor  +
  //   Retorno._vQuitacaoCredito.dataSet.FieldByName('VALOR_C').AsFloat;
  //
  //   ValorLiquido := ValorLiquido +
  //   Retorno._vQuitacaoCredito.dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;
  //
  //  QRLabel_Valor.Caption := Format('%m', [Valor]);
  //
  //   QRLabel_ValorJuros.Caption := Format('%m',[ValorLiquido]);

  Valor2 := Valor2 +
    //Retorno._vQuitacaoCredito.dataSet.FieldByName('VALOR_C').AsFloat;
  cadconciliaconfereRec.dataSet.FieldByName('VALOR_C').AsFloat;

  ValorLiquido2 := ValorLiquido2 +
    //   cadconciliaconfereRec.dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;
  cadconciliaconfereRec.dataSet.FieldByName('EVENT_NET_AMOUNT').AsFloat;

  //  QRLabel_Valor.Caption := Format('%m', [Valor2]);
  QRLabel_vl.Caption := Format('%m', [Valor2]);

  //   QRLabel_ValorJuros.Caption := Format('%m',[ValorLiquido]);
  QRLabel_VlLiquido.Caption := Format('%m', [ValorLiquido2]);
end;

procedure TFrmConciliaCartaoConfere.EncontrarCreditosPorNumAutorizacao(
  Sender: TObject);
begin
	BitBtn_BuscarPendencClick(Sender);

  pendenciasconfere.resolverPendencias(pendenciasconfere.vcreditosPendConcCartao.dataSet);

  PageControl1.ActivePage := TabSheet6;
  TabSheet6.Show;
end;

procedure TFrmConciliaCartaoConfere.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	inherited;
	if not Assigned(DBGrid1.DataSource) then
    Exit;
  if not Assigned(DBGrid2.DataSource) then
    Exit;
  if not Assigned(DBGrid3.DataSource) then
    Exit;
  if not Assigned(DBGrid4.DataSource) then
    Exit;
  if not Assigned(DBGrid5.DataSource) then
    Exit;
  if not Assigned(DBGrid6.DataSource) then
    Exit;
  if not Assigned(DBGrid12.DataSource) then
    Exit;

  if not Assigned(DBGrid1.DataSource.DataSet) then
    Exit;
  if not Assigned(DBGrid2.DataSource.DataSet) then
    Exit;
  if not Assigned(DBGrid3.DataSource.DataSet) then
    Exit;
  if not Assigned(DBGrid4.DataSource.DataSet) then
    Exit;
  if not Assigned(DBGrid5.DataSource.DataSet) then
    Exit;
  if not Assigned(DBGrid6.DataSource.DataSet) then
    Exit;
  if not Assigned(DBGrid12.DataSource.DataSet) then
    Exit;

  if not PrimeiraPesquisa1 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid1, GridCfg1, cdsGrid1,
      cdsColunas1, usuario, ListGridsAndDataSets1, vDadosIni.transacaoCol);

  if not PrimeiraPesquisa2 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid2, GridCfg2, cdsGrid2,
      cdsColunas2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);

  if not PrimeiraPesquisa3 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid3, GridCfg3, cdsGrid3,
      cdsColunas3, usuario, ListGridsAndDataSets3, vDadosIni.transacaoCol);

  if not PrimeiraPesquisa4 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid4, GridCfg4, cdsGrid4,
      cdsColunas4, usuario, ListGridsAndDataSets4, vDadosIni.transacaoCol);

  if not PrimeiraPesquisa5 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid5, GridCfg5, cdsGrid5,
      cdsColunas5, usuario, ListGridsAndDataSets5, vDadosIni.transacaoCol);

  if not PrimeiraPesquisa6 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid6, GridCfg6, cdsGrid6,
      cdsColunas6, usuario, ListGridsAndDataSets6, vDadosIni.transacaoCol);

  if not PrimeiraPesquisa12 then
    vDadosIni.salvarGridNoConfigColunasCadPadrao(DBGrid12, GridCfg12, cdsGrid12,
      cdsColunas12, usuario, ListGridsAndDataSets12, vDadosIni.transacaoCol);

  vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid1, GridCfg1, true, ListPositions1, cdsGrid1);

  vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid2, GridCfg2, true, ListPositions2, cdsGrid2);

  vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid3, GridCfg3, true, ListPositions3, cdsGrid3);

  vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid4, GridCfg4, true, ListPositions4, cdsGrid4);

  vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid5, GridCfg5, true, ListPositions5, cdsGrid5);

  vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid6, GridCfg6, true, ListPositions6, cdsGrid6);

  vDadosIni.restoreDataSetDefaultCadPadrao(DBGrid12, GridCfg12, true, ListPositions12, cdsGrid12);

	if Assigned(FpopMenuOut) then
    FreeAndNil(FpopMenuOut);

  Action := caFree;
  cadconciliaconfere.Free;
  cadconciliaconfere := nil;
  cadconciliaconfereRec.Free;
  cadconciliaconfereRec := nil;
  pendenciasconfere.Free;
  pendenciasconfere := nil;
  resolverPendenciasconfere.Free;
  resolverPendenciasconfere := nil;
  cadconciliaconfereadm.Free;
  cadconciliaconfereadm := nil;
  FrmConciliaCartaoConfere := nil;
end;

procedure TFrmConciliaCartaoConfere.FormCreate(Sender: TObject);
begin
	vCriou := 0;
	inherited;
	vPendencias := False;
	if vDadosIni.vPesquisa = 'PENDENCIASCARTAO' then
  begin
  	vPendencias         := True;
	  vDadosIni.vPesquisa := '';
  end;
  ConcCartAdqCielo          := TConciliaCartaoAdquirenteCielo.create;
	cadconciliaconfere        := TconciliacartaoConfere.create;
  cadconciliaconfereRec     := TconciliacartaoRecConfere.create;
  pendenciasconfere         := TPendenciasConfere.create;
  cadconciliaconfereadm     := TconciliacartaoConfereAdm.create;
  resolverPendenciasconfere := TResolverPendenciasConfere.create;
  
  if vDadosIni.vModalOuChild <> 'M' then
    FormStyle := fsMDIChild;
  vDadosIni.vModalOuChild := 'C';
end;

procedure TFrmConciliaCartaoConfere.FormShow(Sender: TObject);
begin
	if not Self.Enabled then
    Exit;
    
	inherited;
  DBGrid1.DataSource  := dtmContasAReceber.dsConciliacaoFinanceiro;
  DBGrid2.DataSource  := dtmContasAReceber.dsConciliacaoPendencias;
  DBGrid3.DataSource  := dtmContasAReceber.dsCtrlCrConciliacao2;
  DBGrid4.DataSource  := dtmContasAReceber.dsCtrlCrConciliacao3;
  DBGrid5.DataSource  := pendenciasconfere.fTempPendConcCartaoDtSource;
  DBGrid6.DataSource  := dtmContasAReceber.dsConciliacaoFinanceiroAdm;
  DBGrid12.DataSource := dtmContasAReceber.dsConciliacaoFinanceiroRec;

  vAlterarNomeDtSet1 := 'Financ';
  vAlterarNomeDtSet2 := 'Pend';
  vAlterarNomeDtSet3 := 'CredPend';
  vAlterarNomeDtSet4 := 'CredPendData';
  vAlterarNomeDtSet5 := 'ResolverPend';

  vTotPendConfere    := 0;
  vTotFinancRec      := 0;

  pendenciasconfere.dataSet.FieldByName('SEL').Tag := 1;

  if vCriou = 0 then
  begin
    vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
        vAlterarNomeDtSet1, GridCfg1, DBGrid1, cdsGrid1, cdsColunas1, trans, ListGridsAndDataSets1,
        ListPositions1, nomeDTSEt1, PrimeiraPesquisa1, vCamposPadraoRegistro1, usuario);

    vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
        vAlterarNomeDtSet2, GridCfg2, DBGrid2, cdsGrid2, cdsColunas2, trans, ListGridsAndDataSets2,
        ListPositions2, nomeDTSEt2, PrimeiraPesquisa2, vCamposPadraoRegistro2, usuario);

    vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
        vAlterarNomeDtSet3, GridCfg3, DBGrid3, cdsGrid3, cdsColunas3, trans, ListGridsAndDataSets3,
        ListPositions3, nomeDTSEt3, PrimeiraPesquisa3, vCamposPadraoRegistro3, usuario);

    vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
        vAlterarNomeDtSet4, GridCfg4, DBGrid4, cdsGrid4, cdsColunas4, trans, ListGridsAndDataSets4,
        ListPositions4, nomeDTSEt4, PrimeiraPesquisa4, vCamposPadraoRegistro4, usuario);

    vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
        vAlterarNomeDtSet5, GridCfg5, DBGrid5, cdsGrid5, cdsColunas5, trans, ListGridsAndDataSets5,
        ListPositions5, nomeDTSEt5, PrimeiraPesquisa5, vCamposPadraoRegistro5, usuario);

    vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
        vAlterarNomeDtSet6, GridCfg6, DBGrid6, cdsGrid6, cdsColunas6, trans, ListGridsAndDataSets6,
        ListPositions6, nomeDTSEt6, PrimeiraPesquisa6, vCamposPadraoRegistro6, usuario);

    vDadosIni.setTClientDataSetCadPadrao(vDadosIni.dataSetCol, vDadosIni.vNomeUsuario, vDadosIni.transacaoCol,
        vAlterarNomeDtSet12, GridCfg12, DBGrid12, cdsGrid12, cdsColunas12, trans, ListGridsAndDataSets12,
        ListPositions12, nomeDTSEt12, PrimeiraPesquisa12, vCamposPadraoRegistro12, usuario);
  end;

  if PrimeiraPesquisa1 then
  begin
    PrimeiraPesquisa1 := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid1, GridCfg1, cdsGrid1, cdsColunas1, usuario, ListGridsAndDataSets1, vDadosIni.transacaoCol);
  end;

  if PrimeiraPesquisa2 then
  begin
    PrimeiraPesquisa2 := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid2, GridCfg2, cdsGrid2, cdsColunas2, usuario, ListGridsAndDataSets2, vDadosIni.transacaoCol);
  end;

  if PrimeiraPesquisa3 then
  begin
    PrimeiraPesquisa3 := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid3, GridCfg3, cdsGrid3, cdsColunas3, usuario, ListGridsAndDataSets3, vDadosIni.transacaoCol);
  end;

  if PrimeiraPesquisa4 then
  begin
    PrimeiraPesquisa4 := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid4, GridCfg4, cdsGrid4, cdsColunas4, usuario, ListGridsAndDataSets4, vDadosIni.transacaoCol);
  end;

  if PrimeiraPesquisa5 then
  begin
    PrimeiraPesquisa5 := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid5, GridCfg5, cdsGrid5, cdsColunas5, usuario, ListGridsAndDataSets5, vDadosIni.transacaoCol);
  end;

  if PrimeiraPesquisa6 then
  begin
    PrimeiraPesquisa6 := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid6, GridCfg6, cdsGrid6, cdsColunas6, usuario, ListGridsAndDataSets6, vDadosIni.transacaoCol);
  end;

  if PrimeiraPesquisa12 then
  begin
    PrimeiraPesquisa12 := False;
    vDadosIni.configurarGridPeloConfigColunas(DBGrid12, GridCfg12, cdsGrid12, cdsColunas12, usuario, ListGridsAndDataSets12, vDadosIni.transacaoCol);
  end;

  DBLookupComboBoxUnificadasFinanc.KeyValue    := vDadosIni._LerConfiguracoesRegistroInteger(DBLookupComboBoxUnificadasFinanc.Name);
  DBLookupComboBoxNumEstFinanc.KeyValue        := vDadosIni._LerConfiguracoesRegistroString(DBLookupComboBoxNumEstFinanc.Name);
  DBLookupComboBoxAdmCartaoFinanc.KeyValue     := vDadosIni._LerConfiguracoesRegistroInteger(DBLookupComboBoxAdmCartaoFinanc.Name);
  meDtInicialFinanc.Text                       := vDadosIni._LerConfiguracoesRegistroString(meDtInicialFinanc.Name);
  meDtFinalFinanc.Text                         := vDadosIni._LerConfiguracoesRegistroString(meDtFinalFinanc.Name);

  DBLookupComboBoxUnificadasPendenc.KeyValue   := vDadosIni._LerConfiguracoesRegistroInteger(DBLookupComboBoxUnificadasPendenc.Name);
  DBLookupComboBoxNumEstPendenc.KeyValue       := vDadosIni._LerConfiguracoesRegistroString(DBLookupComboBoxNumEstPendenc.Name);
  DBLookupComboBoxAdmCartaoPendenc.KeyValue    := vDadosIni._LerConfiguracoesRegistroInteger(DBLookupComboBoxAdmCartaoPendenc.Name);
  meDtInicialPendenc.Text                      := vDadosIni._LerConfiguracoesRegistroString(meDtInicialPendenc.Name);
  meDtFinalPedenc.Text                         := vDadosIni._LerConfiguracoesRegistroString(meDtFinalPedenc.Name);

  DBLookupComboBoxUnificadasFinancAdm.KeyValue := vDadosIni._LerConfiguracoesRegistroInteger(DBLookupComboBoxUnificadasFinancAdm.Name);
  DBLookupComboBoxNumEstFinancAdm.KeyValue     := vDadosIni._LerConfiguracoesRegistroString(DBLookupComboBoxNumEstFinancAdm.Name);
  DBLookupComboBoxAdmCartaoFinancAdm.KeyValue  := vDadosIni._LerConfiguracoesRegistroInteger(DBLookupComboBoxAdmCartaoFinancAdm.Name);
  meDtInicialFinancAdm.Text                    := vDadosIni._LerConfiguracoesRegistroString(meDtInicialFinancAdm.Name);
  meDtFinalFinancAdm.Text                      := vDadosIni._LerConfiguracoesRegistroString(meDtFinalFinancAdm.Name);

  lbl_statusProc.Visible := false;
  Gauge_HistoricoRetorno.Visible := false;
//  GroupBox7.Visible := true;

	SpeedButton_BuscarArquivos.Visible := trim(vDadosIni.vConcCartao.vVersaoConcCartao) <> '1';
  lbInfDataHoraApi.Visible := vDadosIni.vConcCartao.vHabilitarConcCartaoAPI;
  lbDataHoraApi.Visible := vDadosIni.vConcCartao.vHabilitarConcCartaoAPI;
  SpeedButtonAtualizarApi.Visible := vDadosIni.vConcCartao.vHabilitarConcCartaoAPI;

  cadconciliaconfere.vunificadasConcCartao.abreConciliacartaoUnificadas;
  cadconciliaconfereadm.vunificadasConcCartao.abreConciliacartaoUnificadas;
  pendenciasconfere.vunificadasConcCartao.abreConciliacartaoUnificadas;

  cadconciliaconfere.vnumestConcCartao.abreConciliacartaoNumEst;
  cadconciliaconfereadm.vnumestConcCartao.abreConciliacartaoNumEst;
  pendenciasconfere.vnumestConcCartao.abreConciliacartaoNumEst;

  cadconciliaconfere.vadmcartaoConcCartao.abreConciliacartaoAdmCartao;
  cadconciliaconfereadm.vadmcartaoConcCartao.abreConciliacartaoAdmCartao;
  pendenciasconfere.vadmcartaoConcCartao.abreConciliacartaoAdmCartao;

  cadconciliaconfere.vbandeiraConcCartao.abreConciliacartaoBandeira;
  cadconciliaconfereadm.vbandeiraConcCartao.abreConciliacartaoBandeira;
  pendenciasconfere.vbandeiraConcCartao.abreConciliacartaoBandeira;

  pnUnificadasFinanc.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  pnUnificadasPendenc.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  pnUnificadasPendencExcluir.Visible := vDadosIni.vEmp.vFinanceiroUnificado;

  pnAdministradoraFinanc.Height := 104;
  if not vDadosIni.vEmp.vFinanceiroUnificado then
	  GroupBoxFinanceiro.Height := GroupBoxFinanceiro.Height - pnUnificadasFinanc.Height;

  pnAdministradoraFinancAdm.Height := 104;
  if not vDadosIni.vEmp.vFinanceiroUnificado then
	  GroupBoxFinanceiroAdm.Height := GroupBoxFinanceiroAdm.Height - pnUnificadasFinancAdm.Height;

  pnAdministradoraPendenc.Height := 104;
  if not vDadosIni.vEmp.vFinanceiroUnificado then
	  GroupBoxPendencias.Height := GroupBoxPendencias.Height - pnUnificadasPendenc.Height;

  GroupBoxPendenciasExcluir.Height := 104;
  if not vDadosIni.vEmp.vFinanceiroUnificado then
	  GroupBoxPendenciasExcluir.Height := GroupBoxPendenciasExcluir.Height - pnUnificadasPendencExcluir.Height;

  if not cadconciliaconfere.vunificadasConcCartao.dataSet.IsEmpty then
  	DBLookupComboBoxUnificadasFinanc.KeyValue := cadconciliaconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger;

  if not pendenciasconfere.vunificadasConcCartao.dataSet.IsEmpty then
  	DBLookupComboBoxUnificadasPendenc.KeyValue := pendenciasconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger;

  if not pendenciasconfere.vunificadasConcCartao.dataSet.IsEmpty then
  	DBLookupComboBoxUnificadasPendencExcluir.KeyValue := pendenciasconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger;

  if not cadconciliaconfere.vnumestConcCartao.dataSet.IsEmpty then
    DBLookupComboBoxNumEstFinanc.KeyValue := trim(cadconciliaconfere.vnumestConcCartao.dataSet.FieldByName('codigo').AsString);

  if not cadconciliaconfereadm.vnumestConcCartao.dataSet.IsEmpty then
    DBLookupComboBoxNumEstFinancAdm.KeyValue := trim(cadconciliaconfereadm.vnumestConcCartao.dataSet.FieldByName('codigo').AsString);

  if not pendenciasconfere.vnumestConcCartao.dataSet.IsEmpty then
  	DBLookupComboBoxNumEstPendenc.KeyValue := trim(pendenciasconfere.vnumestConcCartao.dataSet.FieldByName('codigo').AsString);

  if not pendenciasconfere.vnumestConcCartao.dataSet.IsEmpty then
  	DBLookupComboBoxNumEstPendencExcluir.KeyValue := trim(pendenciasconfere.vnumestConcCartao.dataSet.FieldByName('codigo').AsString);

  if not cadconciliaconfere.vadmcartaoConcCartao.dataSet.IsEmpty then
	  DBLookupComboBoxAdmCartaoFinanc.KeyValue := cadconciliaconfere.vadmcartaoConcCartao.dataSet.FieldByName('id').AsInteger;

  if not cadconciliaconfereadm.vadmcartaoConcCartao.dataSet.IsEmpty then
  	DBLookupComboBoxAdmCartaoFinancAdm.KeyValue := cadconciliaconfereadm.vadmcartaoConcCartao.dataSet.FieldByName('id').AsInteger;

  if not pendenciasconfere.vadmcartaoConcCartao.dataSet.IsEmpty then
	  DBLookupComboBoxAdmCartaoPendenc.KeyValue := pendenciasconfere.vadmcartaoConcCartao.dataSet.FieldByName('id').AsInteger;

  if not pendenciasconfere.vadmcartaoConcCartao.dataSet.IsEmpty then
	  DBLookupComboBoxAdmCartaoPendencExcluir.KeyValue := pendenciasconfere.vadmcartaoConcCartao.dataSet.FieldByName('id').AsInteger;

  if not cadconciliaconfere.vbandeiraConcCartao.dataSet.IsEmpty then
  	DBLookupComboBoxBandeiraFinanc.KeyValue  := cadconciliaconfere.vbandeiraConcCartao.dataSet.FieldByName('id').AsInteger;

  if not cadconciliaconfereadm.vbandeiraConcCartao.dataSet.IsEmpty then
  	DBLookupComboBoxBandeiraFinancAdm.KeyValue := cadconciliaconfereadm.vbandeiraConcCartao.dataSet.FieldByName('id').AsInteger;

	if not pendenciasconfere.vbandeiraConcCartao.dataSet.IsEmpty then
  	DBLookupComboBoxBandeiraPendenc.KeyValue  := pendenciasconfere.vbandeiraConcCartao.dataSet.FieldByName('id').AsInteger;

  if not pendenciasconfere.vbandeiraConcCartao.dataSet.IsEmpty then
  	DBLookupComboBoxBandeiraPendencExcluir.KeyValue  := pendenciasconfere.vbandeiraConcCartao.dataSet.FieldByName('id').AsInteger;

  vCodUnificadaPend := DBLookupComboBoxUnificadasPendenc.KeyValue;
  vNumEstPend       := DBLookupComboBoxNumEstPendenc.KeyValue;
  vCodAdmCartaoPend := DBLookupComboBoxAdmCartaoPendenc.KeyValue;
  vCodBandeiraPend  := DBLookupComboBoxBandeiraPendenc.KeyValue;

  btSelectAll.Enabled               := false;
  btUnSelectAll.Enabled             := false;
  btSomarFinanc.Enabled             := false;
  BitBtn_QuitarCreditos.Enabled     := false;
  BitBtn_ExportarExcel.Enabled      := false;
  BitBtn_Imprimir.Enabled           := false;
  BitBtn_EmpresaAdq.Enabled         := true;
  BitBtn_TipoLanc.Enabled           := true;
  BitBtn_ContasAjuste.Enabled       := true;
  btDesPendenciaConfere.Enabled     := false;
  btCreditosNaoEncontrado.Enabled   := false;
  btCreditosDivergenciaData.Enabled := false;
  btCreditosQuitados.Enabled        := false;
  TabSheet5.TabVisible              := false;
  TabSheet6.TabVisible              := false;
  TabSheet7.TabVisible              := false;
  TabSheet10.TabVisible             := false;
  TabSheet13.TabVisible             := false;

  lbDataHoraApi.Caption := cadconciliaconfere.retornaDataConsultaFinanc(0);
  if trim(lbDataHoraApi.Caption) = '' then
  	lbDataHoraApi.Caption := '01/01/2000 00:00:00';

  vDadosIni.vInibeMensPesqPros := 'S';
  vTestarDataFinanc := vDadosIni.PesqPros('IMPFIN042', 'HABILITAR', '', 'CONCILIACAO_FINANCEIRO', '', cadconciliaconfere.buscas, false);

  imgInformation.Hint := 'Informações Adicionais' + #13 + #13 +
  	'Processo "IMPFIN042" TESTAR DATA FINANCEIRO AO CONSULTAR (CONCILIACAO CARTAO)';

  if vPendencias then
  begin
    PageControl1.ActivePage := TabSheet2;
    TabSheet2.Show;
  end
  else
  begin
    PageControl1.ActivePage := TabSheet1;
    TabSheet1.Show;
  end;

  if vCriou = 0 then
    vCriou := 1;

  vDadosIni.fechaStatusProcessamento;
end;

procedure TFrmConciliaCartaoConfere.lbPagoOperadoraAdmDblClick(Sender: TObject);
begin
	BuscasFinanceiroAdm('TOTAL');
end;

procedure TFrmConciliaCartaoConfere.lbPagoOperadoraDblClick(Sender: TObject);
begin
  BuscasFinanceiroAdm('TOTAL');
end;

procedure TFrmConciliaCartaoConfere.lbTotAjusteNegLiqAdmDblClick(
  Sender: TObject);
begin
  BuscasFinanceiroAdm('AJUSTE');
end;

procedure TFrmConciliaCartaoConfere.lbTotAjusteNegLiqDblClick(Sender: TObject);
begin
  BuscasFinanceiroAdm('AJUSTE');
end;

procedure TFrmConciliaCartaoConfere.lbTotAjustePosLiqAdmDblClick(
  Sender: TObject);
begin
  BuscasFinanceiroAdm('AJUSTE');
end;

procedure TFrmConciliaCartaoConfere.lbTotAjustePosLiqDblClick(Sender: TObject);
begin
  BuscasFinanceiroAdm('AJUSTE');
end;

procedure TFrmConciliaCartaoConfere.lbTotAntecipacoesLiqAdmDblClick(
  Sender: TObject);
begin
	BuscasFinanceiroAdm('ANTECIPACAO');
end;

procedure TFrmConciliaCartaoConfere.lbTotAntecipacoesLiqDblClick(
  Sender: TObject);
begin
	BuscasFinanceiroAdm('ANTECIPACAO');
end;

procedure TFrmConciliaCartaoConfere.lbTotCancelamentosLiqAdmDblClick(
  Sender: TObject);
begin
	BuscasFinanceiroAdm('CANCELAMENTO');
end;

procedure TFrmConciliaCartaoConfere.lbTotCancelamentosLiqDblClick(
  Sender: TObject);
begin
	BuscasFinanceiroAdm('CANCELAMENTO');
end;

procedure TFrmConciliaCartaoConfere.lbTotChargeBackLiqAdmDblClick(
  Sender: TObject);
begin
  BuscasFinanceiroAdm('CHARGEBACK');
end;

procedure TFrmConciliaCartaoConfere.lbTotChargeBackLiqDblClick(Sender: TObject);
begin
  BuscasFinanceiroAdm('CHARGEBACK');
end;

procedure TFrmConciliaCartaoConfere.lbTotPendenciaLiqDblClick(Sender: TObject);
begin
	BuscasFinanceiroAdm('TOTAL');
end;

procedure TFrmConciliaCartaoConfere.lbTotVendasLiqAdmDblClick(Sender: TObject);
begin
	BuscasFinanceiroAdm('VENDA');
end;

procedure TFrmConciliaCartaoConfere.lbTotVendasLiqDblClick(Sender: TObject);
begin
	BuscasFinanceiroAdm('VENDA');
end;

procedure TFrmConciliaCartaoConfere.ReajustarLarguradascolunas12Click(
  Sender: TObject);
begin
	vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid12);
end;

procedure TFrmConciliaCartaoConfere.ReajustarLarguradascolunas1Click(
  Sender: TObject);
begin
	vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid1);
end;

procedure TFrmConciliaCartaoConfere.ReajustarLarguradascolunas2Click(
  Sender: TObject);
begin
	vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid2);
end;

procedure TFrmConciliaCartaoConfere.ReajustarLarguradascolunas3Click(
  Sender: TObject);
begin
	vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid3);
end;

procedure TFrmConciliaCartaoConfere.ReajustarLarguradascolunas4Click(
  Sender: TObject);
begin
	vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid4);
end;

procedure TFrmConciliaCartaoConfere.ReajustarLarguradascolunas5Click(
  Sender: TObject);
begin
	vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid5);
end;

procedure TFrmConciliaCartaoConfere.ReajustarLarguradascolunas6Click(
  Sender: TObject);
begin
	vDadosIni.AjustaLaguraColunasCadPadrao(DBGrid6);
end;

procedure TFrmConciliaCartaoConfere.ResetarConfiguraesdecolunas12Click(
  Sender: TObject);
begin
	vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid12, GridCfg12, cdsColunas12, cdsGrid12, usuario,
     vDadosIni.transacaoCol, fReset, ListGridsAndDataSets12, false, ListPositions12);
end;

procedure TFrmConciliaCartaoConfere.ResetarConfiguraesdecolunas1Click(
  Sender: TObject);
begin
	vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid1, GridCfg1, cdsColunas1, cdsGrid1, usuario,
     vDadosIni.transacaoCol, fReset, ListGridsAndDataSets1, false, ListPositions1);
end;

procedure TFrmConciliaCartaoConfere.ResetarConfiguraesdecolunas2Click(
  Sender: TObject);
begin
	vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid2, GridCfg2, cdsColunas2, cdsGrid2, usuario,
     vDadosIni.transacaoCol, fReset, ListGridsAndDataSets2, false, ListPositions2);
end;

procedure TFrmConciliaCartaoConfere.ResetarConfiguraesdecolunas3Click(
  Sender: TObject);
begin
  vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid3, GridCfg3, cdsColunas3, cdsGrid3, usuario,
     vDadosIni.transacaoCol, fReset, ListGridsAndDataSets3, false, ListPositions3);
end;

procedure TFrmConciliaCartaoConfere.ResetarConfiguraesdecolunas4Click(
  Sender: TObject);
begin
	vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid4, GridCfg4, cdsColunas4, cdsGrid4, usuario,
     vDadosIni.transacaoCol, fReset, ListGridsAndDataSets4, false, ListPositions4);
end;

procedure TFrmConciliaCartaoConfere.ResetarConfiguraesdecolunas5Click(
  Sender: TObject);
begin
	vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid5, GridCfg5, cdsColunas5, cdsGrid5, usuario,
     vDadosIni.transacaoCol, fReset, ListGridsAndDataSets5, false, ListPositions5);
end;

procedure TFrmConciliaCartaoConfere.ResetarConfiguraesdecolunas6Click(
  Sender: TObject);
begin
	vDadosIni.ResetarConfiguraesdecolunasCadPadraoClick(DBGrid6, GridCfg6, cdsColunas6, cdsGrid6, usuario,
     vDadosIni.transacaoCol, fReset, ListGridsAndDataSets6, false, ListPositions6);
end;

procedure TFrmConciliaCartaoConfere.salvaConfiguracoesJanela(pJanela: string);
var
  Registro: TRegistry;
begin
  try
    Registro := TRegistry.Create;
    try
      Registro.OpenKey('Software\Hw\Configuracao\Telas\TfrmPrincipalS', True);
//      if PanelFlash.Visible then
//        Registro.WriteString('ExibirPropagandaFlash', 'S')
//      else
//        Registro.WriteString('ExibirPropagandaFlash', 'N');

    	if trim(pJanela) <> '' then
      	Registro.WriteString('JanelasMaximizadas', trim(pJanela))
      else
      begin
        if WindowState = wsMaximized then
          Registro.WriteString('JanelasMaximizadas', 'S')
        else
          Registro.WriteString('JanelasMaximizadas', 'N');
      end;
      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TFrmConciliaCartaoConfere.SalvardadosnoExcel12Click(Sender: TObject);
begin
	vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid12, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmConciliaCartaoConfere.SalvardadosnoExcel1Click(Sender: TObject);
begin
	vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid1, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmConciliaCartaoConfere.SalvardadosnoExcel2Click(Sender: TObject);
begin
	vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid2, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmConciliaCartaoConfere.SalvardadosnoExcel3Click(Sender: TObject);
begin
  vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid3, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmConciliaCartaoConfere.SalvardadosnoExcel4Click(Sender: TObject);
begin
	vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid4, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmConciliaCartaoConfere.SalvardadosnoExcel5Click(Sender: TObject);
begin
	vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid5, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmConciliaCartaoConfere.SalvardadosnoExcel6Click(Sender: TObject);
begin
	vDadosIni.SalvardadosnoExcelCadPadraoClick(Sender, DBGrid6, usuario, vDadosIni.transacaoCol, lbStatusProcessamento,
     lbTextoProcessamento, pnStatusProcessamento, Self.Caption);
end;

procedure TFrmConciliaCartaoConfere.ScrollBox12Enter(Sender: TObject);
begin
	vConfigColuna12 := true;
end;

procedure TFrmConciliaCartaoConfere.ScrollBox1Enter(Sender: TObject);
begin
	vConfigColuna1 := true;
end;

procedure TFrmConciliaCartaoConfere.ScrollBox2Enter(Sender: TObject);
begin
	vConfigColuna2 := true;
end;

procedure TFrmConciliaCartaoConfere.ScrollBox3Enter(Sender: TObject);
begin
	vConfigColuna3 := true;
end;

procedure TFrmConciliaCartaoConfere.ScrollBox4Enter(Sender: TObject);
begin
	vConfigColuna4 := true;
end;

procedure TFrmConciliaCartaoConfere.ScrollBox5Enter(Sender: TObject);
begin
	vConfigColuna5 := true;
end;

procedure TFrmConciliaCartaoConfere.ScrollBox6Enter(Sender: TObject);
begin
	vConfigColuna6 := true;
end;

procedure TFrmConciliaCartaoConfere.Somarvaloresdacoluna12Click(
  Sender: TObject);
begin
	vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid12, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmConciliaCartaoConfere.Somarvaloresdacoluna1Click(Sender: TObject);
begin
	vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid1, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmConciliaCartaoConfere.Somarvaloresdacoluna2Click(Sender: TObject);
begin
	vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid2, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmConciliaCartaoConfere.Somarvaloresdacoluna3Click(Sender: TObject);
begin
  vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid3, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmConciliaCartaoConfere.Somarvaloresdacoluna4Click(Sender: TObject);
begin
	vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid4, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmConciliaCartaoConfere.Somarvaloresdacoluna5Click(Sender: TObject);
begin
	vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid5, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmConciliaCartaoConfere.Somarvaloresdacoluna6Click(Sender: TObject);
begin
	vDadosIni.SomarvaloresdacolunaCadPadraoClick(DBGrid6, lbStatusProcessamento, lbTextoProcessamento, pnStatusProcessamento);
end;

procedure TFrmConciliaCartaoConfere.SpeedButtonAtualizarApiClick(Sender: TObject);
begin
	lbDataHoraApi.Caption := cadconciliaconfere.atualizarDataConsultaFinanc(cadconciliaconfere.vunificadasConcCartao.dataSet.FieldByName('cod_empresa').AsInteger);
  if trim(lbDataHoraApi.Caption) = '' then
    lbDataHoraApi.Caption := '01/01/2000 00:00:00';
end;

procedure TFrmConciliaCartaoConfere.SpeedButton_BuscarArquivosClick(
  Sender: TObject);
var
	vbtSelectAll: boolean;
  vbtUnSelectAll: boolean;
  vbtSomar: boolean;
	vBitBtn_BuscarArquivos: boolean;
  vBitBtn_BuscarFinanc: boolean;
  vBitBtn_QuitarCreditos: boolean;
  vBitBtn_ExportarExcel: boolean;
  vBitBtn_Imprimir: boolean;
  vBitBtn_EmpresaAdq: boolean;
  vBitBtn_TipoLanc: boolean;
  vBitBtn_ContasAjuste: boolean;
  vSpeedButtonAtualizarApi: boolean;
  vbtDesPendenciaConfere: boolean;
  vbtCreditosNaoEncontrado: boolean;
  vbtCreditosDivergenciaData: boolean;
  vbtCreditosQuitados: boolean;
  vckLancarTarifas: boolean;
  vckLancarComissoes: boolean;
  vckLancarAjustePositivo: boolean;
  vckLancarAjusteNegativo: boolean;
begin
	try
  	Screen.Cursor := crHourGlass;

    // Salvando estado do componentes
    vbtSelectAll := btSelectAll.Enabled;
    vbtUnSelectAll := btUnSelectAll.Enabled;
    vbtSomar := btSomarFinanc.Enabled;
    vBitBtn_BuscarArquivos := SpeedButton_BuscarArquivos.Enabled;
    vBitBtn_BuscarFinanc := BitBtn_BuscarFinanc.Enabled;
    vBitBtn_QuitarCreditos := BitBtn_QuitarCreditos.Enabled;
    vBitBtn_ExportarExcel := BitBtn_ExportarExcel.Enabled;
    vBitBtn_Imprimir := BitBtn_Imprimir.Enabled;
    vBitBtn_EmpresaAdq := BitBtn_EmpresaAdq.Enabled;
    vBitBtn_ContasAjuste := BitBtn_ContasAjuste.Enabled;
    vBitBtn_TipoLanc := BitBtn_TipoLanc.Enabled;
    vBitBtn_ContasAjuste := BitBtn_ContasAjuste.Enabled;
    vSpeedButtonAtualizarApi := SpeedButtonAtualizarApi.Enabled;
    vbtDesPendenciaConfere := btDesPendenciaConfere.Enabled;
    vbtCreditosNaoEncontrado := btCreditosNaoEncontrado.Enabled;
    vbtCreditosDivergenciaData := btCreditosDivergenciaData.Enabled;
    vbtCreditosQuitados := btCreditosQuitados.Enabled;
    vckLancarTarifas := ckLancarTarifas.Enabled;
    vckLancarComissoes := ckLancarComissoes.Enabled;
    vckLancarAjustePositivo := ckLancarAjustePositivo.Enabled;
    vckLancarAjusteNegativo := ckLancarAjusteNegativo.Enabled;

    btSelectAll.Enabled := False;
    btUnSelectAll.Enabled := False;
    btSomarFinanc.Enabled := False;
  	SpeedButton_BuscarArquivos.Enabled := False;
    BitBtn_BuscarFinanc.Enabled := False;
    BitBtn_QuitarCreditos.Enabled := False;
    BitBtn_ExportarExcel.Enabled := False;
    BitBtn_Imprimir.Enabled := False;
    BitBtn_EmpresaAdq.Enabled := False;
    BitBtn_TipoLanc.Enabled := False;
    BitBtn_ContasAjuste.Enabled := False;
    SpeedButtonAtualizarApi.Enabled := False;
    btDesPendenciaConfere.Enabled := False;
    btCreditosNaoEncontrado.Enabled := False;
    btCreditosDivergenciaData.Enabled := False;
    btCreditosQuitados.Enabled := False;
    ckLancarTarifas.Enabled := False;
    ckLancarComissoes.Enabled := False;
    ckLancarAjustePositivo.Enabled := False;
    ckLancarAjusteNegativo.Enabled := False;

    Screen.Cursor := crHourGlass;

		if not ConcCartAdqCielo.ProcessarArquivo then
    	exit;
  finally
  	// Voltando estado dos componentes
  	btSelectAll.Enabled := vbtSelectAll;
    btUnSelectAll.Enabled := vbtUnSelectAll;
    btSomarFinanc.Enabled := vbtSomar;
    SpeedButton_BuscarArquivos.Enabled := vBitBtn_BuscarArquivos;
    BitBtn_BuscarFinanc.Enabled := vBitBtn_BuscarFinanc;
    BitBtn_QuitarCreditos.Enabled := vBitBtn_QuitarCreditos;
    BitBtn_ExportarExcel.Enabled := vBitBtn_ExportarExcel;
    BitBtn_Imprimir.Enabled := vBitBtn_Imprimir;
    BitBtn_EmpresaAdq.Enabled := vBitBtn_EmpresaAdq;
    BitBtn_TipoLanc.Enabled := vBitBtn_TipoLanc;
    BitBtn_ContasAjuste.Enabled := vBitBtn_ContasAjuste;
    SpeedButtonAtualizarApi.Enabled := vSpeedButtonAtualizarApi;
    btDesPendenciaConfere.Enabled := vbtDesPendenciaConfere;
    btCreditosNaoEncontrado.Enabled := vbtCreditosNaoEncontrado;
    btCreditosDivergenciaData.Enabled := vbtCreditosDivergenciaData;
    btCreditosQuitados.Enabled := vbtCreditosQuitados;
    ckLancarTarifas.Enabled := vckLancarTarifas;
    ckLancarComissoes.Enabled := vckLancarComissoes;
    ckLancarAjustePositivo.Enabled := vckLancarAjustePositivo;
    ckLancarAjusteNegativo.Enabled := vckLancarAjusteNegativo;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TFrmConciliaCartaoConfere.SpeedButton5Click(Sender: TObject);
begin
	if not pendenciasconfere.excluir then
  	exit;
end;

end.
