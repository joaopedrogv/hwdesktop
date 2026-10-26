//tirar o s2 do pagamento
//testar os lancamentos de cheques de unificadas diferentes, nao esta fazendo os dois lancamentos

unit uClassesContasAPagar;

interface
uses
  uDataSet_OOP, Messages, Controls, DB, DBClient, IBQuery, UClassesCadastrosBasicosCx,
  DBGrids, QuickRpt, StdCtrls, DBCtrls, RDprint,uClassesImportacaoFinanceiro,
  Contnrs, Classes, uDadosIni, Math;

type
  RContas = record
    parcelas, indice: Integer;
    NumConta: array of Double;
    CodFornecedor, CodTpDespesa: array of Integer;
    dataReferencia, numeroDocumento, vencimentoDocumento: arraystring;
    NumDoc, NCHQ, NCHQNominal, tipoVenda, numVenda, historico, ContrBanc: arraystring;
    valorDocumento: arrayextended;
    Controle: array of Integer;
  end;

  RConsultaCTP = record
    vExibirQuitados, vExibirNaoQuitados, vExibirDespesas, vExibirFornecedores,processamentoAutomatico: Boolean;
    vDescricaoGR, vDescricaoDEP, vHistoricoPadrao, vTipoCNT, vNumChequeCTP, vTipoConta: string;
    vNumContaPadrao,numContaCompraProd, vNumContaPadraoCH, vNumContaPadraoCR,vNumContaPadraoDif, vSaldoDinheiro,
      vSaldoCredito, vSaldoCheque, vValorOperacao, vValorPrevisto, vValorAInformar, vValorAtingido, vValorDiferenca,
      vnumcontaicm,vnumcontapiscofins,vnumcontacveic, vSomaValorContabil: double;
    numCtrlCompra: integer;
    numContaTemp: Double;
    vDataBaixa: TDate;
    vSqlAdicional: AnsiString;
    vDataIniAd, vDataFimAd, vDataIni, vDataFim, vCondicaoAd, vCondicao, vCampoAd, vCampo, vValorAd, vValor: string;
    vPorData, vAdicional, vPorDataAd, vLancDiferenca: boolean;
  end;
  TContasAPagar = class;
  TLancamentosCTP = class;
  TContasCTP = class;
  TChequesCTP = class;
  TCreditosCTP = class;
  TLoteLancCTP = class;
  TDetalhesConta = class;
  TObs_CTP = class;
  TEmpresasUnificadas = class;

  TEmpresasUnificadas = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTodosEmpresas: Boolean;
    function _BuscarEmpresas(vCodEmp: Integer): Boolean;
    procedure _marcaDesmarcaLinha;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
  end;

  TContasAPagar = class(TDataSet_OOP)
  private
    function _existePContas(pNContaPlc: Double;vtp: smallint): Boolean;
  protected
    FdtSetPContas, FdtSetControles,FdtRateiosContas: TClientDataSet;
    vHistPConta: THistPContas;
    FQtdeReplicacao, FDiaReplicacao: Integer; // Armazena os dados para replicação de contas a pagar
    FReferenciaMes, FReplAltNumQtdeReplicacao, FReplNaoAltNumQtdeReplicacao: boolean; // Armazena os dados para replicação de contas a pagar

    vNomeBanco: string; //Variável para armazenar temporiaramente o nome do banco no momento de aceite de contas a pagar.
    FUsarValorAAtingir: boolean;
    FNumLoteLanc, FCodigo: Integer;
    FDataLoteLanc: TDateTime;
    FRdp: TRdprint;
    vLinha: integer;
    FBuscas2: TIBQuery;
    FTotalContasSelecionadas: integer;

    //    FContaPadrao: double;
//    FHistoricoPadrao: string;
//    FTipoCNT: string; //Variável para armazenar o tipo_cnt (C/N) da conta e assim na seleção de contas seja selecionadas apenas contas do mesmo tipo cnt.

    quickRep: TQuickRep; //Variaveis para o relatório de contas a pagar
    vGridRel: TDBGrid; //Variaveis para o relatório de contas a pagar
    vRelSomenteSelecionado: boolean; //Variaveis para o relatório de contas a pagar
    vSubTotDiaVlConta, vSubTotDiaVlPago, vTotalVlConta, vTotalVlPago,vltotalgeralconta,vltotalgeralvlpago: real; //Variaveis para o relatório de contas a pagar

    dtSetCtrlTemp, dtSetPContasTemp, FdtSetLancTemp: TClientDataSet;
    dsCtrltemp, dsPContasTemp: TdataSource;
    dsLancTemp, dsCHTemp, dsCrTemp, dsCTPTemp, dsLancCTPTemp: TdataSource;
    dsCTPTempCC, dsLancTempCC, dsCrTempCC, dsCHTempCC: TDataSource;
    vContLigL: TContaLigacaoImp;
    fQuitacaoCTP: TClientDataSet;
    fDsQuitacaoCTP: TDataSource;
    function _definirDataSetQuitacaoCTP: Boolean;
  public
  	 Fsql_campos, Fsql_inner, Fsql_inner_pag: string;
    buscasCTP: TIBQuery;
    destructor destroy; override;
    constructor create;
    property dtSetPContas: TClientDataSet read FdtSetPContas write FdtSetPContas;
    property dtSetControles: TClientDataSet read FdtSetControles write FdtSetControles;
    property QtdeReplicacao: Integer read FQtdeReplicacao write FQtdeReplicacao;
    property DiaReplicacao: Integer read FDiaReplicacao write FDiaReplicacao;
    property ReferenciaMes: boolean read FReferenciaMes write FReferenciaMes;
    property ReplAltNumQtdeReplicacao: boolean read FReplAltNumQtdeReplicacao write FReplAltNumQtdeReplicacao;
    property ReplNaoAltNumQtdeReplicacao: boolean read FReplNaoAltNumQtdeReplicacao write FReplNaoAltNumQtdeReplicacao;
    property dtSetLancTemp: TClientDataSet read FdtSetLancTemp write FdtSetLancTemp;
    property UsarValorAAtingir: Boolean read FUsarValorAAtingir write FUsarValorAAtingir;
    property NumLoteLanc: Integer read FNumLoteLanc write FNumLoteLanc;
    property DataLoteLanc: TDateTime read FDataLoteLanc write FDataLoteLanc;
    property Rdp: TRdPrint read FRdp write FRdp;
    property TotalContasSelecionadas: Integer read FTotalContasSelecionadas write FTotalContasSelecionadas;

    //    property ContaPadrao: double read FContaPadrao write FContaPadrao;
//    property HistoricoPadrao: string read FHistoricoPadrao write FHistoricoPadrao;
//    property TipoCNT: string read FTipoCNT write FTipoCNT;

    //    function _abreCntAPagar :boolean
    function insert: boolean; override;
    function edit: boolean; override;
    function post: boolean; override;
    function _existeControle(pControle: Integer; pCodEmpMult: Integer = 0): Boolean;
    function _locFornecedor(pCodFornec: integer; pCodEmpMult: Integer = 0): boolean; overload;
    function _locFornecedor(pNContas: Double; pCodEmpMult: Integer = 0): boolean; overload;
    function _locFornecedor(pCpcCnpj: string; pCodEmpMult: Integer = 0): boolean; overload;
    function _listaPContas(pTipo: string = 'S'; pCodPContas: Double = 0): boolean; overload;
    function _listaPContas(pDBLookupComboBox: TDBLookupComboBox; pDbEdit: TDBEdit): boolean; overload;
    function _listaControles(pQuitacao: Boolean = False; pCodControle: Integer = 0; pCodEmpMult: Integer = 0): boolean;
    function _dadosNContaPlcValidos(pAbreHistPadrao: Boolean): boolean;
    function _procuraCheque(vnch: string;vcontrole: integer): boolean;
    function _validaControle: boolean;
    function _validaNum_conta_plc: boolean;
    function _abreFormReplicacaoContasCTP: Boolean;
    function _replicarContasAPagar(pExibir: boolean = true): Boolean;
    function _atualizarValorPagoCTP: Boolean;
    function _abreFormAtualizarValorPagoCTP: Boolean;
    function _abreFormAceitarContaCTP: Boolean;
    function _aceitarContaCTP: Boolean;
    function _marcarParaCancelarCTP: Boolean;
    function _controleBancario(pCodCtrl: integer): boolean;
    function _controlesTemp: boolean;
    function _PContasTemp: boolean;
    function _lancamentosTemp: boolean;
    function _deletarLancTemp: boolean;
    function _selecionaHistoricoPadrao(pNumConta: double): string;
    function _getTotalLancPorControle: boolean;
    function _abreFormQuitarCTP: Boolean;
    function _abreFormLancN_S2(pState: TDataSetState): Boolean;
    function _abreFormLancS1(pState: TDataSetState): Boolean;
    function _abreFormLancS2(pState: TDataSetState): Boolean;
    function _abreFormLancCTP(pState: TDataSetState): Boolean;
    function _abreFormDadosParaBaixa: Boolean;
    function _abreFormDetalhesLoteCTP: Boolean;
    function _abreFormImpressaoLoteCTP: Boolean;
    function _efetuarPagamentoCTP: Boolean;
    function _definirContasPadrao: boolean;
    function _pagarComControleSelecionado(pState: TDataSetState): boolean;
    function _alterarLancamentoSelecionado: boolean;
    function _gravaLancamentosCTP(pProcessamentoAutomatico:boolean=false): boolean;
    function _confirmarPagamento: boolean;
    function _cancelarPagamento: boolean;
    function _abreDetalhesPagamentoModalidade(pLote_lanc: Integer; pData_Lanc: TDateTime): Boolean;
    function _abreDetalhesPagamentoContrapartida(pLote_lanc: Integer; pData_lanc: TDateTime): Boolean;
    function _estornarPagamento(pLote_lanc: integer; pData_lanc: TDateTime): boolean;
    function _abreFormLancDiferencaCTP: Boolean;
    function _defineSqlAdicional(pQuitados, pNaoquitados, pDespesas, pFornecedores: boolean): boolean;
    function _efetuaValidacaoCH: boolean;
    function _efetuaValidacaoCr: boolean;
    function _excluirCTP: boolean;
    function _abreFormObservacoes: Boolean;
    function _quitarContasConciliacaoCartao(pLote: Integer; pCartaoCDS: TClientDataSet; pCodigoUnificada: Integer = 0): Boolean; //virtual; abstract;
    function _existeContasPagar: boolean;
    function buscarContas(pDoc, pDataVenc: string): boolean;
    procedure cadContasAPagar(TipoForm: integer);
    procedure _marcaDesmarcaLinha;
    function  _verificarMarcacaoLinha: boolean;
    procedure _marcaTodasAsLinhas;
    procedure _desmarcaTodasAsLinhas;
    procedure _montaSqlAdicional(pQuitados, pNaoquitados, pDespesas, pFornecedores: boolean);
    procedure _exibriSomatorio(grid: TDBGrid);
    procedure _bandaDetalheBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure _qrBandDetalheCTPAfterPrint(Sender: TQRCustomBand; BandPrinted: Boolean);
    procedure _qrBandSubtotalBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure _qrBandPageFooterBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure _qrpContasAPagarAfterPreview(Sender: TObject);
    procedure _qrpContasAPagarBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure _RelContasAPagar(Ordem: string; ASomenteSelecionados: Boolean; AAgruparEmpresaUnif: Boolean);
    procedure _ImprimeRelatorioLoteCTP;
    procedure _localizarCheques(pIndice: integer; pTexto: string); overload;
    procedure _localizarCheques(pFiltrarPorData: boolean; pDataIni, pDataFim: string); overload;
    procedure _localizarCreditos(pIndice: integer; pTexto: string); overload;
    procedure _localizarCreditos(pFiltrarPorData: boolean; pDataIni, pDataFim: string); overload;
    procedure _DBLookupComboBoxControleExit(Sender: TObject);
    procedure preencherDadosRateios;
    procedure retornaDadosDataSet;
    function cadastraRateios(pCommitar: boolean = true): boolean;
    function cadastraRateiosEmpresas(pCommitar: boolean = true): boolean;
    function definirRateiosContas(pCodigoUnificada: Integer = 0): boolean;
    procedure _desmarcarDocumentoComoPagando;
    function _informarObservacoes: Boolean;
    function testarNumConta(pNumConta: Double; var pMensagem: string): boolean;
    function abreFormCadCTP: boolean;
    function abreFormParcelamentoContas(pAlter: boolean = false): boolean;
    function gerarContas(vContasAPagar: TContasAPagar; pAlter: boolean = false): boolean;
    function apagarContas: boolean;
    function obterValorFaturamento(pdataini: TDateTime; pdatafim: TDateTime; pCodEmpresa: Integer): Double;
    procedure GravarContasPagarTemp(cdsDesp: TClientDataSet);
    procedure ApagarContasPagarTemp(cdsDesp: TClientDataSet);
    function abreFormEmpresas: boolean;
    function verificarConta(pNatureza: string; pNumConta: Double): boolean;
    function testarNumConta2(pNatureza: string; pNumConta: Double; var pMensagem: string): boolean;
    function testarNumConta3(pNatureza: string; pNumConta: Double; var pMensagem: string): boolean;
  var
  	Recebendo: boolean;
    baixaParcial: boolean;
    ultimasql: string;
    rCTP: RConsultaCTP;
    lanc: TLancamentosCTP;
    cp: TContasCTP;
    ch: TChequesCTP;
    cr: TCreditosCTP;
    loteLanc: TLoteLancCTP;
    detalhesConta: TDetalhesConta;
    vObs: TObs_CTP;
    vEmpresasUnificadas: TEmpresasUnificadas;
    vCodEmpMult: Integer;
    vCodControle: Integer;
    vDataReferencia: TDateTime;
    vpermitir: boolean;
    vNumConta: Double;
    vCodContaCtpRpl: Integer;
    FContas: RContas;
	  vnumcontaRateio, vnomefornRateio,vndocRateio,vhistRateio,vaceiteRateio,vtipcontaRateio,vnominalaRateio,
  	vtipolancRateio,vnchequeRateio,vchassiRateio: string;
  	vcodfornRateio,vcontroleRateio,vnumnotaRateio, vTmpEmpMultRateio: integer;
  	vdtrefRateio,vdtvencRateio: Tdate;
    vvalorCtpRateio,vvlcontabilRateio: Double;
  end;

  TLancamentosCTP = class(TDataSet_OOP)
  private
  protected
  public
    destructor destroy; override;
    constructor create;
    function _abreLancamentos(pLoteLanc: integer): boolean;
  end;

  TContasCTP = class(TDataSet_OOP)
  public
  	destructor destroy; override;
    constructor create;
    function _abreContasCTP(ACodigoEmpresa: Integer): boolean; overload;
    function _abreContasCTP(ACodContrp: Integer; ACodigoEmpresa: Integer): boolean; overload;
  end;

  TChequesCTP = class(TDataSet_OOP)
  private
    vNumCtrlTemp:integer;
  protected
    vSaldoChequesSelecionados: double;
  public
    destructor destroy; override;
    constructor create;
    function _abreChequesCTP: boolean; overload;
    function _abreChequesCTP(ACodigo: Integer; ACodigoEmpresa: Integer): boolean; overload;
    procedure _marcaDesmarcaLinha(pDataSetLanc: TClientDataSet);
    procedure _atualizaValorChequesSel(pLabel: TLabel);
  end;

  TCreditosCTP = class(TDataSet_OOP)
  private
    vNumCtrlTemp:integer;
  protected
    vSaldoCreditosSelecionados: double;
  public
    destructor destroy; override;
    constructor create;
    function _abreCreditosCTP: boolean; overload;
    function _abreCreditosCTP(ACodigo: Integer; ACodigoEmpresa: Integer): boolean; overload;
    procedure _marcaDesmarcaLinha(pDataSetLanc: TClientDataSet);
    procedure _atualizaValorCreditosSel(pLabel: TLabel);
  end;

  TLotelancCTP = class(TDataSet_OOP)
  private
  protected
  public
    destructor destroy; override;
    constructor create;
    function _abreLoteLanc: boolean; overload;
    function _abreLoteLanc(pLote: Integer; pDatq: TDateTime): boolean; overload;
  end;

  TDetalhesConta = class(TDataSet_OOP)
  private
  public
  	constructor create;
    function _abreDetalhesConta(pCodContrp: Integer; pCodigoEmp: Integer): boolean;
    function _somarTotalConta(pCodContrp: Integer; pCodigoEmp: Integer): Double;
  end;

  TObs_CTP = class(TDataSet_OOP)
  private
    fCOD_OBS: Integer;
  public
    constructor create;
    function post: Boolean; override;
    function insert: Boolean; override;
    function _selecionaObs(pCOD_OBS: Integer): Boolean;
    function verificarTabelaCodigo(var pCOD_OBS: Integer): boolean;
  end;

  TInformacaoCTPCadBasico = class
  private
    FDescricao: string;
    FCodigo: Integer;
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);
  public
    property Codigo: Integer read FCodigo write SetCodigo;
    property Descricao: string read FDescricao write SetDescricao;
  end;

  TInformacaoCTP = class
  private
    FControlePgto: TInformacaoCTPCadBasico;
    FCodPagto: TInformacaoCTPCadBasico;
    FDataVencimento: TDate;
    FBancoDocumento: string;
    FStatus: string;
    FDataEmissao: TDate;
    FCodEmpMult: Integer;
    FFornecedor: TInformacaoCTPCadBasico;
    FTipo: string;
    FCheque: string;
    FNumeroNF: string;
    FObservacoes: TStrings;
    FNumeroDocumento: string;
    FValor: Double;
    FDataQuitacao: TDate;
    FValorPago: Double;
    FExibirEmp: string;
    procedure SetCodEmpMult(const Value: Integer);
    procedure SetValorPago(const Value: Double);
    procedure SetDataQuitacao(const Value: TDate);
    procedure SetValor(const Value: Double);
    procedure SetBancoDocumento(const Value: string);
    procedure SetCheque(const Value: string);
    procedure SetCodPagto(const Value: TInformacaoCTPCadBasico);
    procedure SetControlePgto(const Value: TInformacaoCTPCadBasico);
    procedure SetDataEmissao(const Value: TDate);
    procedure SetDataVencimento(const Value: TDate);
    procedure SetFornecedor(const Value: TInformacaoCTPCadBasico);
    procedure SetNumeroDocumento(const Value: string);
    procedure SetNumeroNF(const Value: string);
    procedure SetObservacoes(const Value: TStrings);
    procedure SetStatus(const Value: string);
    procedure SetTipo(const Value: string);
  public
    destructor Destroy; override;
    constructor create;
    function GetImpressao(pAgruparEmpresaUnif: Boolean): TStrings;

    property CodEmpMult     : Integer                 read FCodEmpMult      write SetCodEmpMult;
    property Fornecedor     : TInformacaoCTPCadBasico read FFornecedor      write SetFornecedor;
    property NumeroDocumento: string                  read FNumeroDocumento write SetNumeroDocumento;
    property Valor          : Double                  read FValor           write SetValor;
    property ValorPago      : Double                  read FValorPago       write SetValorPago;
    property DataVencimento : TDate                   read FDataVencimento  write SetDataVencimento;
    property Tipo           : string                  read FTipo            write SetTipo; //NF: fornecedor: DE: Despesa
    property NumeroNF       : string                  read FNumeroNF        write SetNumeroNF;
    property DataEmissao    : TDate                   read FDataEmissao     write SetDataEmissao;
    property CodPagto       : TInformacaoCTPCadBasico read FCodPagto        write SetCodPagto;
    property ControlePgto   : TInformacaoCTPCadBasico read FControlePgto    write SetControlePgto;
    property Cheque         : string                  read FCheque          write SetCheque;
    property BancoDocumento : string                  read FBancoDocumento  write SetBancoDocumento;
    property Status         : string                  read FStatus          write SetStatus;
    property DataQuitacao   : TDate                   read FDataQuitacao    write SetDataQuitacao;
    property Observacoes    : TStrings                read FObservacoes     write SetObservacoes;
  end;

  TInformacaoCTPList = class(TObjectList)
  private
    function GetItem(Index: integer): TInformacaoCTP;
    procedure SetItem(Index: integer; const Value: TInformacaoCTP);
  public
    function New: TInformacaoCTP;
    property Items[Index: integer]: TInformacaoCTP read GetItem write SetItem;
  end;

  TRelatorioInformacaoCTP = class
  private
    Buscas        : TIBQuery;
    BuscasAux     : TIBQuery;
    FTitulo       : string;
    FSqlCampos    : string;
    FDadosCTP     : TInformacaoCTPList;
    FTipoDeFiltro : TStrings;
    FParametros   : TStrings;
    FComAssinatura: Boolean;
    procedure VisualizarRelatorio(pAgruparEmpresaUnif: Boolean);
    procedure obterDadosDoBanco(
    	pExibirEmp: string;
      pCodEmpMult: Integer;
      pAgruparEmpresaUnif: Boolean);
  public
    destructor Destroy; override;
    constructor create(AQueryBuscas: TIBQuery; ATitulo: string);

    procedure EmitirRelatorioPor_NumeroDeNota(
    	ANumero, AFornecedor: Integer;
      ASerie: string;
      AAgruparEmpresaUnif: Boolean;	
      ADataLancamento: TDateTime = 0);
    procedure EmitirRelatorioPor_ContasSelecionadas(
    	ACodigoInterno: array of Integer;
      ACodEmpMult: array of Integer;
      AComAssinatura: Boolean;
      AAgruparEmpresaUnif: Boolean);
    procedure EmitirRelatorioPor_Periodo(
    	AQualData: string;
      ADataIni, ADataFim: TDateTime;
      AComAssinatura, AQuitados, AAbertos: Boolean;
      AAgruparEmpresaUnif: Boolean);


//    property DadosCTP: TInformacaoCTPList read FDadosCTP write SetDadosCTP;
//    property TipoDeFiltro: TStrings read FTipoDeFiltro write SetTipoDeFiltro;
  end;


var
  CTP: TContasAPagar;

implementation
uses
  uDtmContasAPagar, uDtmAtivo, Forms, SysUtils, Windows, IBDatabase, uPadrao, uCadContasAPagar, DateUtils, Variants,
  UdefRatContas, IBCustomDataSet, uEditHw, uCadPadraoModal, ExtCtrls;

function gerar_contrapartidaCTP(ACamposCTP, AValoresCTP: string; AQtdeCampos: Integer): boolean;
var
  AContasAPagar: TContasAPagar;
  ABuscas: TIBQuery;
  I: Integer;
  vTempCampoCTP, vTempValorCTP: string;
begin
  try
    Result := false;

    vDadosIni.vContrapartida := true;
    vDadosIni.vPesquisa := 'CONTRAPARTIDA|OK';
    vDadosIni.vCamposContrapartida := ACamposCTP;
    vDadosIni.vValoresContrapartida := AValoresCTP;
    vDadosIni.vQtdeCamposContrapartida := AQtdeCampos;
    AContasAPagar := TContasAPagar.create;

    for I := 1 to AQtdeCampos do
    begin
    	if vDadosIni.getCampoPipe(ACamposCTP, I) = 'VALOR_L' then
	     vDadosIni.vValorContrapartida := StrToFloat(vDadosIni.getCampoPipe(AValoresCTP, I))
      else if vDadosIni.getCampoPipe(ACamposCTP, I) = 'VL_CONTABIL' then
        vDadosIni.vValorContabilContrapartida := StrToFloat(vDadosIni.getCampoPipe(AValoresCTP, I))
      else if (vDadosIni.getCampoPipe(ACamposCTP, I) = 'COD_EMP_MULT') and (vDadosIni.vEmp.vFinanceiroUnificado) then
      	vDadosIni.vCodEmpresaUnificadaContrapartida := StrToInt(vDadosIni.getCampoPipe(AValoresCTP, I))
    end;
         
    if dtmContasAPagar = nil then
      dtmContasAPagar := TdtmContasAPagar.Create(dtmContasAPagar);
    if FrmCadContasAPagar = nil then
      FrmCadContasAPagar := TFrmCadContasAPagar.Create(FrmCadContasAPagar)
    else if not FrmCadContasAPagar.Visible then
    	FrmCadContasAPagar.Visible := True;

    Result := AContasAPagar.abreFormCadCTP;
  finally
    vDadosIni.vContrapartida := false;
    if not Result then
      FrmCadContasAPagar.BitBtn5.Click;
    FrmCadContasAPagar.fechar := True;
    PostMessage(FrmCadContasAPagar.Handle, WM_CLOSE, 0, 0)
  end;
end;

exports
  gerar_contrapartidaCTP;


procedure ctp_relatorio_por_nf(ANumero, AFornecedor: Integer; ASerie: string; ADataLancamento: TDateTime);
var
  ARelatorio: TRelatorioInformacaoCTP;
begin   
  if dtmContasAPagar = nil then
    dtmContasAPagar := TdtmContasAPagar.Create(dtmContasAPagar);
  ARelatorio := TRelatorioInformacaoCTP.create(dtmContasAPagar.qrBuscasCntAPagar, 'Cópia de Contas a Pagar pela Nota Fiscal');
  try
    ARelatorio.EmitirRelatorioPor_NumeroDeNota(
    	ANumero,
      AFornecedor,
      ASerie,
      false,
      ADataLancamento);
  finally
    FreeAndNil(ARelatorio);
  end;
end;


exports
  ctp_relatorio_por_nf;

{ TContasAPagar }

function TContasAPagar.abreFormCadCTP: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 800;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Trabalhando com Contas a Pagar';
    if vDadosIni.vContrapartida then
	    formulario.Caption := formulario.Caption + ' (Lançar contrapartida)'; 

    FrmCadContasAPagar.GroupBox1.Parent := formulario;
    FrmCadContasAPagar.Panel29.Visible := vDadosIni.vContrapartida;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    formulario.BorderIcons := [];
    FrmCadContasAPagar.GroupBox7.Visible := vDadosIni.vContrapartida;

    FrmCadContasAPagar.BitBtn3.Click;

    //     vDadosIni.definirDiaFinanceiroFechado(buscas);
    result := (formulario.ShowModal = IDOK);

  finally
    FrmCadContasAPagar.GroupBox1.Parent := FrmCadContasAPagar.ScrollBox3;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAPagar.abreFormEmpresas: boolean;
begin
	vEmpresasUnificadas.dataSet.First;
  while not vEmpresasUnificadas.dataSet.Eof do
  begin
  	vEmpresasUnificadas.dataSet.Edit;
    vEmpresasUnificadas.dataSet.FieldByName('SEL').AsString :=
    	vDadosIni.IfThen(dataSet.FieldByName('COD_EMP_MULT').AsString = vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsString,
      	'S', 'N');
    vEmpresasUnificadas.dataSet.Post;

    vEmpresasUnificadas.dataSet.Next;
  end;
  vEmpresasUnificadas.dataSet.First;
	Result :=	vDadosIni.abreForm('Selecionar as empresas que participarão do rateio de contas', FrmCadContasAPagar.pnMultiempresa, [ofEscapeExit, ofAlignAllClientWinCtrl]);
end;

function TContasAPagar.abreFormParcelamentoContas(pAlter: boolean): boolean;
var
  formulario: TfrmPadrao;
  I: Integer;
  buscas2: TIBQuery;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Contas a pagar';
    frmCadContasApagar.pnFaturaDesp.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := True;
    formulario.BorderIcons := [];

    frmCadContasApagar.Edit6.Text := dataSet.FieldByName('N_DOC_CTP').AsString;
    frmCadContasApagar.EditHw2.AsValue := dataSet.FieldByName('VALOR_CTP').AsFloat;
    if not frmCadContasApagar.cdsDesp.IsEmpty then
    	frmCadContasApagar.edcreditoQtdeParcelas.Value := frmCadContasApagar.cdsDesp.RecordCount
    else
	   frmCadContasApagar.edcreditoQtdeParcelas.Value := 1;

    if pAlter then
    begin
      frmCadContasApagar.ListBox3.Clear;
      FrmCadContasAPagar.ListBox1.Clear;
      frmCadContasApagar.Edit6.Enabled := False;
      frmCadContasApagar.EditHw2.Enabled := False;
      gerarContas(CTP, pAlter);
    end;

    result := (formulario.ShowModal = mrOk);
  finally
  	if not Result then
    begin
			apagarContas;
      ApagarContasPagarTemp(FrmCadContasAPagar.cdsDesp);
      FrmCadContasAPagar.ListBox3.Enabled := True;
    	FrmCadContasAPagar.Panel47.Visible := False;
      FrmCadContasAPagar.btAlterarFaturaEntrada.Enabled := True;
    end;
    frmCadContasApagar.DBEdit1.Enabled := frmCadContasApagar.cdsDesp.IsEmpty;
    frmCadContasApagar.pnFaturaDesp.Parent := frmCadContasApagar.tsFaturaDesp;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAPagar.apagarContas: boolean;
begin
  try
    Result := True;
    FrmCadContasAPagar.ListBox3.Clear;
    FrmCadContasAPagar.ListBox1.Clear;
  except
    Result := False;
  end;
end;

procedure TContasAPagar.ApagarContasPagarTemp(cdsDesp: TClientDataSet);
begin
  while not cdsDesp.IsEmpty do
    cdsDesp.Delete;
end;

function TContasAPagar.buscarContas(pDoc, pDataVenc: string): boolean;
begin
  dataSet.Close;
  dataSet.CommandText := ' select ' + Fsql_campos + ' from contas_a_pagar  ' +
    Fsql_inner +
    Fsql_inner_pag +
    ' where contas_a_pagar.n_doc_ctp = ' + QuotedStr(pDoc) +
    ' and contas_a_pagar.data_venc_ctp = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', StrToDate(pDataVenc))) +
    ' and contas_a_pagar.codigo_emp = ' + vDadosIni.codEmpresa;
  dataSet.Open;

  Result := not dataSet.IsEmpty;
end;


function TContasAPagar.cadastraRateios(pCommitar: boolean = true): boolean;
begin
	result:=false;
  try
  	FdtRateiosContas.DisableControls;
    FdtRateiosContas.first;
    while not FdtRateiosContas.Eof do
    begin
      if FdtRateiosContas.FieldByName('VALORDESTINO').AsCurrency > 0 then
      begin
        result:=true;
        Break;
      end;

      FdtRateiosContas.next;
    end;
  finally
    FdtRateiosContas.EnableControls;
  end;

  if not Result then
  begin
  	Application.MessageBox(PChar('Valor de destino menor ou igual a zero, rateio das contas não será realizado'), 'Atenção', MB_ICONWARNING + MB_OK);
    exit;
  end;

  dataSet.Cancel;
  try
  	FdtRateiosContas.DisableControls;
    FdtRateiosContas.first;
    while not FdtRateiosContas.Eof do
    begin
     if FdtRateiosContas.FieldByName('VALORDESTINO').AsCurrency > 0 then
     begin
       dataSet.Insert;
       dataSet.FieldByName('US_CAD').AsInteger:=vDadosIni.vCodUsuario;
       dataSet.FieldByName('N_CONTA_PLC').value:=FdtRateiosContas.FieldByName('CONTADEST').Value;
       dataSet.FieldByName('COD_FORN_NFE').AsInteger:=vcodfornRateio;
       dataSet.FieldByName('NOME_FOR_CTP').AsString:=vnomefornRateio;
       dataSet.FieldByName('N_DOC_CTP').AsString:=vndocRateio;
       dataSet.FieldByName('HISTORICO_CTP').AsString:=vhistRateio+' '+FdtRateiosContas.FieldByName('DEPTO').AsString;
       dataSet.FieldByName('ACEITE_CTP').AsString:=vaceiteRateio;
       dataSet.FieldByName('TIPO_CTP').AsString:=vtipcontaRateio;
       dataSet.FieldByName('NOMINAL_CTP').AsString:=vnominalaRateio;
       dataSet.FieldByName('TIP_CNT').AsString:=vtipolancRateio;
       dataSet.FieldByName('N_CHEQ_CTP').AsString:=vnchequeRateio;
       dataSet.FieldByName('CHASSI_CONC').AsString:=vchassiRateio;
       dataSet.FieldByName('CODIGO_CTRL').AsInteger:=vcontroleRateio;
       dataSet.FieldByName('NUM_NOTA_NFE').AsInteger:=vnumnotaRateio;
       dataSet.FieldByName('DTREFERENCIA').AsDateTime:=vdtrefRateio;
       dataSet.FieldByName('DATA_VENC_CTP').AsDateTime:=vdtvencRateio;
       dataSet.FieldByName('DATA_ENT_CTP').AsDateTime:=vDadosIni.diaFFinanceiro+1;
       dataSet.FieldByName('VALOR_CTP').AsCurrency:= FdtRateiosContas.FieldByName('VALORDESTINO').AsCurrency;
       dataSet.FieldByName('VL_CONTABIL').AsCurrency := FdtRateiosContas.FieldByName('VALORDESTINOCNT').AsCurrency;
       dataSet.FieldByName('CODIGO_EMP').AsString:=vDadosIni.codEmpresa;
       dataSet.FieldByName('COD_EMP_MULT').AsInteger:=vTmpEmpMultRateio;
       dtmContasAPagar.SpIncCodigo.Transaction:=buscas.Transaction;
       dataSet.FieldByName('COD_CONTRP').AsInteger:=Gencodigo('CONTAS_A_PAGAR', dtmContasAPagar.SpIncCodigo, vDadosIni.codEmpresa);
       dataSet.post;
       Apply;
     end;
     FdtRateiosContas.next;
    end;
  finally
    FdtRateiosContas.EnableControls;
  end;
  if pCommitar then
	  CommitaTransacao;
  if Pos('FOPAG|', vDadosIni.vPesquisa) > 0 then
    vDadosIni.vPesquisa := 'FOPAG|SUCESSO';
  result:=true;
end;

function TContasAPagar.cadastraRateiosEmpresas(pCommitar: boolean): boolean;
begin
	result:=false;
	if vvalorCtpRateio <= 0 then
  begin
  	Application.MessageBox(PChar('Valor informado menor ou igual a zero,' +
    	' rateio para empresa ' + IntToStr(vTmpEmpMultRateio) + ' não será realizado'), 'Atenção', MB_ICONWARNING + MB_OK);
    exit;
  end;
  
	dataSet.Cancel;

  dataSet.Insert;
  dataSet.FieldByName('US_CAD').AsInteger:=vDadosIni.vCodUsuario;
  dataSet.FieldByName('N_CONTA_PLC').value:=vnumcontaRateio;
  dataSet.FieldByName('COD_FORN_NFE').AsInteger:=vcodfornRateio;
  dataSet.FieldByName('NOME_FOR_CTP').AsString:=vnomefornRateio;
  dataSet.FieldByName('N_DOC_CTP').AsString:=vndocRateio;
  dataSet.FieldByName('HISTORICO_CTP').AsString:=vhistRateio+' '+' EMP ' + IntToStr(vTmpEmpMultRateio);
  dataSet.FieldByName('ACEITE_CTP').AsString:=vaceiteRateio;
  dataSet.FieldByName('TIPO_CTP').AsString:=vtipcontaRateio;
  dataSet.FieldByName('NOMINAL_CTP').AsString:=vnominalaRateio;
  dataSet.FieldByName('TIP_CNT').AsString:=vtipolancRateio;
  dataSet.FieldByName('N_CHEQ_CTP').AsString:=vnchequeRateio;
  dataSet.FieldByName('CHASSI_CONC').AsString:=vchassiRateio;
  dataSet.FieldByName('CODIGO_CTRL').AsInteger:=vcontroleRateio;
  dataSet.FieldByName('NUM_NOTA_NFE').AsInteger:=vnumnotaRateio;
  dataSet.FieldByName('DTREFERENCIA').AsDateTime:=vdtrefRateio;
  dataSet.FieldByName('DATA_VENC_CTP').AsDateTime:=vdtvencRateio;
  dataSet.FieldByName('DATA_ENT_CTP').AsDateTime:=vDadosIni.diaFFinanceiro+1;
  dataSet.FieldByName('VALOR_CTP').AsCurrency:=vvalorCtpRateio;
  dataSet.FieldByName('VL_CONTABIL').AsCurrency:=vvlcontabilRateio;
  dataSet.FieldByName('CODIGO_EMP').AsString:=vDadosIni.codEmpresa;
  dataSet.FieldByName('COD_EMP_MULT').AsInteger:=vTmpEmpMultRateio;
  dtmContasAPagar.SpIncCodigo.Transaction:=buscas.Transaction;
  dataSet.FieldByName('COD_CONTRP').AsInteger:=Gencodigo('CONTAS_A_PAGAR', dtmContasAPagar.SpIncCodigo, vDadosIni.codEmpresa);
  dataSet.post;
  Apply;

  if pCommitar then
	  CommitaTransacao;
  if Pos('FOPAG|', vDadosIni.vPesquisa) > 0 then
    vDadosIni.vPesquisa := 'FOPAG|SUCESSO';
  result:=true;
end;

procedure TContasAPagar.cadContasAPagar(TipoForm: integer);
begin
  vDadosIni.abreStatusProcessamento('', 'Abrindo Contas a Pagar');

  if dtmContasAPagar = nil then
    dtmContasAPagar := TdtmContasAPagar.Create(dtmContasAPagar);

  vDadosIni.vTipoForm := TipoForm;
  if FrmCadContasAPagar = nil then
  begin
    if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';
    //    vDadosIni.vPesquisa := pDocs;
    Application.CreateForm(TFrmCadContasAPagar, FrmCadContasAPagar);
  end
  else
    vDadosIni.fechaStatusProcessamento;

  if (TipoForm > 0) and (not FrmCadContasAPagar.Visible) then
    FrmCadContasAPagar.ShowModal
  else if (not FrmCadContasAPagar.Visible) then
    FrmCadContasAPagar.Show
  else if FrmCadContasAPagar.FormStyle = fsMDIChild then
    FrmCadContasAPagar.Show
  else
    FrmCadContasAPagar.ShowModal;
  vDadosIni.fechaStatusProcessamento;
end;

constructor TContasAPagar.create;
begin
  Fsql_campos := ' contas_a_pagar.*, controles.nome_ctrl, empresa.identificacao_emp, ' +
                 ' p_contas.desc_plc, grupos_ct.desc_gr, depart_ct.desc_dep, ' +
                 ' p_contas_contabil.cod_cta, p_contas_contabil.nome_cta, ' +
                 vDadosIni.IfThen(vDadosIni.vContasAPagar.vExibirValorFormasPag, ' retorna_pag_ctp.form_pag2 as form_pag ', '	retorna_pag_ctp.form_pag ');

  Fsql_inner  := ' left join controles on controles.codigo_ctrl = contas_a_pagar.codigo_ctrl and controles.codigo_emp = contas_a_pagar.codigo_emp ' +
                 ' left join empresa on empresa.cod_empresa = contas_a_pagar.cod_emp_mult ' +
                 ' left join p_contas on p_contas.n_conta_plc = contas_a_pagar.n_conta_plc ' +
                 ' left join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct ' +
                 ' left join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep ' +
                 ' left join p_contas_contabil on p_contas_contabil.cod_cta = p_contas.cod_cta_contabil and p_contas_contabil.cod_empresa = contas_a_pagar.cod_emp_mult ';

  Fsql_inner_pag := ' left join retorna_pag_ctp (contas_a_pagar.lote, contas_a_pagar.datq_ctp, ' + vDadosIni.codEmpresa + ', 0, '''') on 1 = 1 ';

  TableName := 'CONTAS_A_PAGAR';

  if dtmContasAPagar = nil then
    dtmContasAPagar := TdtmContasAPagar.Create(dtmContasAPagar);
  DataSet := TClientDataSet(dtmContasAPagar.cdsContaAPagar);
  transacao := TIBTransaction(dtmContasAPagar.transContaAPagar);
  Buscas := TIBQuery(dtmContasAPagar.qrBuscasCntAPagar);
  FBuscas2 := TIBQuery(dtmContasAPagar.qrBuscas2);
  FdtRateiosContas:=TClientDataSet(dtmContasAPagar.CdsRateioContaConta);

  buscasCTP := TIBQuery.Create(Application);
  buscasCTP.Database := buscas.Database;
  buscasCTP.Transaction := buscas.Transaction;
  try
   FdtRateiosContas.CreateDataSet;
  except

  end;
  if vDadosIni.vEmp.vFinanceiroUnificado then
  begin
    dataSet.FieldByName('COD_EMP_MULT').Tag := 0;
    dataSet.FieldByName('IDENTIFICACAO_EMP').Tag := 0;
  end
  else
  begin
    dataSet.FieldByName('COD_EMP_MULT').Tag := 1;
    dataSet.FieldByName('IDENTIFICACAO_EMP').Tag := 1;
  end;
  _definirContasPadrao;
  lanc := TLancamentosCTP.create;
  cp := TContasCTP.create;
  ch := TChequesCTP.create;
  cr := TCreditosCTP.create;
  loteLanc := TLoteLancCTP.create;
  detalhesConta := TDetalhesConta.create;
  vObs:= TObs_CTP.create;
  vEmpresasUnificadas := TEmpresasUnificadas.create;
  Rdp := TRdPrint(dtmContasAPagar.RdPrint1);
end;

function TContasAPagar.definirRateiosContas(pCodigoUnificada: Integer = 0): boolean;
var
 mes,dia,ano: word;
 vtot,vtoti: currency;
begin
 DecodeDate(vdtrefRateio,ano,mes,dia);
 FdtRateiosContas.EmptyDataSet;
 buscas.Close;
 buscas.SQL.text:= ' select * from CONTAS_REL_ORIGEM ' +
	 ' where N_CONTA_PLC_OR = :N_CONTA_PLC_OR';
 buscas.ParamByName('N_CONTA_PLC_OR').AsFloat:=StrToFloat(vnumcontaRateio);
 buscas.open;
 vtot:=0;
 buscas.first;
 while not buscas.eof do
 begin
   FBuscas2.close;
   FBuscas2.SQL.text:='select sum(coalesce(valor_l, 0)) as valorrealizado from mapa_desp ' +
  	 ' where extract(month from dtreferencia) = ' + IntToStr(mes) +
     ' and extract(year from dtreferencia) = ' + IntToStr(ano) +
	   ' and n_conta_plc = cast(' + vDadosIni.trocaVirgulaPorPonto(buscas.FieldByName('N_CONTA_PLC_VAL').AsString) + ' as double precision) ' +
     vDadosIni.retornoPorCondicao((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodigoUnificada > 0),
       ' and cod_emp_mult = ' + IntToStr(pCodigoUnificada), ' and codigo_emp = ' + vDadosIni.codEmpresa);
   FBuscas2.open;
   FBuscas2.First;
   While not FBuscas2.eof do
   begin
     vtot:=vtot+FBuscas2.fieldbyname('valorrealizado').AsCurrency;
     FBuscas2.next;
   end;
   buscas.next;
 end;
 vtoti:=0;
 buscas.first;
 while not buscas.eof do
 begin
   FBuscas2.close;
   FBuscas2.SQL.text:='select sum(coalesce(valor_l, 0)) as valorrealizado from mapa_desp ' +
     ' where extract(month from dtreferencia) = ' + IntToStr(mes) +
     ' and extract(year from dtreferencia) = ' + IntToStr(ano) +
  	 ' and n_conta_plc = cast(' + vDadosIni.trocaVirgulaPorPonto(buscas.FieldByName('N_CONTA_PLC_VAL').AsString) + ' as double precision) ' +
     vDadosIni.retornoPorCondicao((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodigoUnificada > 0),
     	 ' and cod_emp_mult = ' + IntToStr(pCodigoUnificada), ' and codigo_emp = ' + vDadosIni.codEmpresa);
   FBuscas2.open;
   vtoti:=0;
   FBuscas2.First;
   While not FBuscas2.eof do
   begin
     vtoti:=vtoti+FBuscas2.fieldbyname('valorrealizado').AsCurrency;
     FBuscas2.next;
   end;
   FdtRateiosContas.Append;
   FdtRateiosContas.FieldByName('CONTAOR').Value:=vnumcontaRateio;
   FdtRateiosContas.FieldByName('CONTADEST').value:=buscas.FieldByName('N_CONTA_DEST').value;
   FdtRateiosContas.FieldByName('CONTAVALOR').Value:=buscas.FieldByName('N_CONTA_PLC_VAL').value;
   FdtRateiosContas.FieldByName('MES_ANO').AsString:=inttostr(mes)+'/'+inttostr(ano);
   FdtRateiosContas.FieldByName('VALORORIGEM').Value:=vtoti;
   if vtot <> 0 then
     FdtRateiosContas.FieldByName('PERCORIGEM').value:=(vtoti/vtot)*100
   else
     FdtRateiosContas.FieldByName('PERCORIGEM').value:=0;
   FdtRateiosContas.FieldByName('VALORDESTINO').Value:=(FdtRateiosContas.FieldByName('PERCORIGEM').Value/100)*vvalorCtpRateio;
   FdtRateiosContas.FieldByName('VALORDESTINOCNT').Value:=(FdtRateiosContas.FieldByName('PERCORIGEM').Value/100)*vvlcontabilRateio;
   FBuscas2.Close;
   FBuscas2.SQL.text := ' select * from p_contas ' +
  	 ' where n_conta_plc = cast('+vDadosIni.trocaVirgulaPorPonto(buscas.FieldByName('N_CONTA_DEST').AsString) +' as double precision)';
   FBuscas2.open;
   FdtRateiosContas.FieldByName('DESCRICAO_CONTA').AsString:=FBuscas2.fieldbyname('DESC_PLC').AsString;
   FBuscas2.close;
   FBuscas2.SQL.text := ' select * from p_contas ' +
   	 ' where n_conta_plc = cast('+vDadosIni.trocaVirgulaPorPonto(buscas.FieldByName('N_CONTA_PLC_VAL').asstring) + ' as double precision)';
   FBuscas2.open;
   FdtRateiosContas.FieldByName('DESCRICAOCONTAVALOR').value:=FBuscas2.fieldbyname('DESC_PLC').AsString;
   FBuscas2.close;
   FBuscas2.SQL.text := ' select p.*,d.desc_dep from p_contas p, depart_ct d,grupos_ct c ' +
  	 ' where p.n_conta_plc = cast(' + vDadosIni.trocaVirgulaPorPonto(buscas.FieldByName('N_CONTA_PLC_VAL').asstring) + ' as double precision) ' +
     ' and p.grup_ct = c.grup_ct ' +
     ' and c.cod_dep = d.cod_dep ';
   FBuscas2.Open;
   FdtRateiosContas.FieldByName('DEPTO').value:=FBuscas2.fieldbyname('desc_dep').AsString;
   FdtRateiosContas.post;
   buscas.next;
 end;
 Result:=true;
end;

destructor TContasAPagar.destroy;
begin
  Close;
  loteLanc.Free;
  loteLanc := nil;
  detalhesConta.Free;
  detalhesConta := nil;
  vObs.Free;
  vObs:= nil;
  vEmpresasUnificadas.Free;
  vEmpresasUnificadas := nil;
  if FdtRateiosContas.Active then
    FdtRateiosContas.Close;
  inherited;
end;

function TContasAPagar.edit: boolean;
begin
  result:=false;
  if trim(dataSet.FieldByName('Status_ctp').AsString) = 'QUITADO' then
    if Application.MessageBox('Deseja realmente editar uma conta já quitada?', 'Confirmação', MB_YESNO + MB_DEFBUTTON1 + MB_ICONQUESTION) = IDNO then
      exit
    else if not vDadosIni.PesqPros('CTP024', 'LIBERAR', '', 'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+dataSet.FieldByName('N_DOC_CTP').AsString, buscas, true) then
        Exit;

  Result := inherited edit;
  vDadosIni.definirDiaFinanceiroFechado(buscas);
  if Result then
  begin
    vEmpresasUnificadas._abreTodosEmpresas;
    if dataSet.FieldByName('CODIGO_EMP').IsNull then
    	dataSet.FieldByName('CODIGO_EMP').AsInteger := strToInt(vDadosIni.codEmpresa);
    if dataSet.FieldByName('COD_EMP_MULT').IsNull then
    	dataSet.FieldByName('COD_EMP_MULT').AsInteger := strToInt(vDadosIni.codEmpresa);
    vCodEmpMult := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
    vCodControle := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
    vDataReferencia := dataSet.FieldByName('DTREFERENCIA').AsDateTime;
//    dataSet.FieldByName('DATA_ENT_CTP').AsDateTime := vDadosIni.diaFFinanceiro; // _retornaDiaFinanceiroAberto(buscas);
//    dataSet.FieldByName('DTREFERENCIA').AsDateTime := dataSet.FieldByName('DATA_ENT_CTP').AsDateTime;
//    dataSet.FieldByName('TIPO_CTP').AsString := 'D';
  	_listaPContas('S', dataSet.FieldByName('N_CONTA_PLC').AsFloat);
    _listaControles(false, dataSet.FieldByName('CODIGO_CTRL').AsInteger, dataSet.FieldByName('COD_EMP_MULT').AsInteger);
  end;

end;

function TContasAPagar.gerarContas(vContasAPagar: TContasAPagar;
  pAlter: boolean): boolean;
var
  I, K: Integer;
  dias: array of integer;
  vCond: string;
begin
 Result := False;
 K:=0;
 I := 0;
 SetLength(dias, 100);
 SetLength(FContas.vencimentoDocumento, 100);
 SetLength(FContas.dataReferencia, 100);
 SetLength(FContas.numeroDocumento, 100);
 SetLength(FContas.CodFornecedor, 100);
 SetLength(FContas.CodTpDespesa, 100);
 SetLength(FContas.Controle, 100);
 SetLength(FContas.NumConta, 100);
 SetLength(FContas.NCHQ, 100);
 SetLength(FContas.NCHQNominal, 100);
 SetLength(FContas.valorDocumento, 100);
 SetLength(FContas.numVenda, 100);
 SetLength(FContas.tipoVenda, 100);
 SetLength(FContas.historico, 100);

 FContas.parcelas := 0;
  try
    FrmCadContasAPagar.ListBox3.Clear;
    FrmCadContasAPagar.ListBox1.Clear;

    if FrmCadContasAPagar.cdsDesp.IsEmpty then
    begin
      vCond := IntToStr(FrmCadContasAPagar.edcreditoQtdeParcelas.Value) + 'X';

      if not vDadosIni.montarParcelamento(buscas, FContas.numeroDocumento, FContas.vencimentoDocumento, FContas.valorDocumento,
        trim(FrmCadContasAPagar.Edit6.Text), vDadosIni.StrToFloatFormat(FrmCadContasAPagar.EditHw2.AsValue, 2),
        dataSet.FieldByName('COD_FORN_NFE').AsInteger, vCond,
        vDadosIni.IfThen(FrmCadContasAPagar.edcreditoQtdeParcelas.Value > 0,	FrmCadContasAPagar.edcreditoQtdeParcelas.Value, 1),
        'N', dataSet.FieldByName('DATA_VENC_CTP').AsString) then
      begin
        SetLength(FContas.vencimentoDocumento, 100);
        SetLength(FContas.numeroDocumento, 100);
        SetLength(FContas.valorDocumento, 100);
        FContas.NumConta[I] := dataSet.FieldByName('N_CONTA_PLC').AsFloat;

        FContas.numeroDocumento[I] := vDadosIni.StrZero(FrmCadContasAPagar.Edit6.Text, 6) + '-1';
        FContas.CodFornecedor[I] := dataSet.FieldByName('COD_FORN_NFE').AsInteger;
        FContas.Controle[I] := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
        FContas.vencimentoDocumento[I] := DateToStr(vDadosIni.getDataBanco(buscas));
        FContas.dataReferencia[I] := DateToStr(vDadosIni.getDataBanco(buscas));
        FContas.valorDocumento[I] := FrmCadContasAPagar.EditHw2.AsValue;
        FContas.parcelas := FContas.parcelas + 1;
        FrmCadContasAPagar.ListBox3.Items.Add(FContas.numeroDocumento[I] + '   ' + FContas.vencimentoDocumento[I] + '    ' + Format('%m', [FContas.valorDocumento[I]]));
        FrmCadContasAPagar.ListBox1.Items.Add(FContas.numeroDocumento[I] + '   ' + FContas.vencimentoDocumento[I] + '    ' + Format('%m', [FContas.valorDocumento[I]]));
      end
      else
      begin
        for I := 0 to Length(FContas.numeroDocumento) - 1 do
        begin
          FrmCadContasAPagar.ListBox3.Items.Add(FContas.numeroDocumento[I] + '   ' + FContas.vencimentoDocumento[I] + '    ' + Format('%m', [FContas.valorDocumento[I]]));
          FrmCadContasAPagar.ListBox1.Items.Add(FContas.numeroDocumento[I] + '   ' + FContas.vencimentoDocumento[I] + '    ' + Format('%m', [FContas.valorDocumento[I]]));
          FContas.NumConta[I] := dataSet.FieldByName('N_CONTA_PLC').AsFloat;
          FContas.CodFornecedor[I] := dataSet.FieldByName('COD_FORN_NFE').AsInteger;
//          FContas.historico[I] := 'DESPESA VEICULO ' + QuotedStr(vEstMoto.dataSet.FieldByName('chassi_c').AsString);
          FContas.Controle[I] := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
          FContas.dataReferencia[I] := DateToStr(vDadosIni.getDataBanco(buscas));
          FContas.parcelas := FContas.parcelas + 1;
        end;
      end;
    end
    else
    begin
       FrmCadContasAPagar.cdsDesp.IndexFieldNames := 'NumConta';
       FrmCadContasAPagar.cdsDesp.First;
       if not FrmCadContasAPagar.cdsDesp.IsEmpty then
       begin
         while not FrmCadContasAPagar.cdsDesp.Eof do
         begin
           FContas.NumConta[I] := FrmCadContasAPagar.cdsDesp.FieldByName('NumConta').AsFloat;
	         FContas.historico[I] := FrmCadContasAPagar.cdsDesp.FieldByName('Historico').AsString;
           FContas.numeroDocumento[I] := FrmCadContasAPagar.cdsDesp.FieldByName('NumDoc').AsString;
           FContas.CodFornecedor[I] := FrmCadContasAPagar.cdsDesp.FieldByName('CodFornecedor').AsInteger;
           FContas.Controle[I] := FrmCadContasAPagar.cdsDesp.FieldByName('Controles').AsInteger;
           FContas.vencimentoDocumento[I] := FrmCadContasAPagar.cdsDesp.FieldByName('DataVenc').AsString;
           FContas.dataReferencia[I] := FrmCadContasAPagar.cdsDesp.FieldByName('DataReferencia').AsString;
           FContas.valorDocumento[I] := FrmCadContasAPagar.cdsDesp.FieldByName('Valor').AsFloat;
           FContas.NCHQ[I] := FrmCadContasAPagar.cdsDesp.FieldByName('NChq').AsString;
           FContas.NCHQNominal[I] := FrmCadContasAPagar.cdsDesp.FieldByName('NominalChq').AsString;
           FrmCadContasAPagar.ListBox3.Items.Add(trim(FrmCadContasAPagar.cdsDesp.FieldByName('NumDoc').AsString) + '   '
             + trim(FrmCadContasAPagar.cdsDesp.FieldByName('DataVenc').AsString) + '    ' + Format('%m', [FrmCadContasAPagar.cdsDesp.FieldByName('Valor').AsFloat]));
           FrmCadContasAPagar.ListBox1.Items.Add(trim(FrmCadContasAPagar.cdsDesp.FieldByName('NumDoc').AsString) + '   '
             + trim(FrmCadContasAPagar.cdsDesp.FieldByName('DataVenc').AsString) + '    ' + Format('%m', [FrmCadContasAPagar.cdsDesp.FieldByName('Valor').AsFloat]));
           FContas.parcelas := FContas.parcelas + 1;
           Inc(I);

           FrmCadContasAPagar.cdsDesp.Next;
         end;
       end;
       FrmCadContasAPagar.cdsDesp.First;
    end;
    Result := True;
 except
   Result := False;
 end;
end;

procedure TContasAPagar.GravarContasPagarTemp(cdsDesp: TClientDataSet);
var
 I: Integer;
 vNomeCtr, vContrBanco: string;
begin
  while not cdsDesp.IsEmpty do
    cdsDesp.Delete;
  for I := 0 to FContas.parcelas - 1 do
  begin
    cdsDesp.Insert;
    cdsDesp.FieldByName('NumConta').AsFloat := FContas.NumConta[I];
//    cdsDesp.FieldByName('Departamento').AsString := trim(vPlanoC.dataset.FieldByName('desc_dep').AsString);
    cdsDesp.FieldByName('DataReferencia').AsString := FContas.dataReferencia[I];
    cdsDesp.FieldByName('DataVenc').AsString := FContas.vencimentoDocumento[I];
    cdsDesp.FieldByName('NumDoc').AsString := FContas.numeroDocumento[I];
    cdsDesp.FieldByName('Historico').AsString := FContas.historico[I];
    cdsDesp.FieldByName('TipoDespesa').AsInteger := FContas.CodTpDespesa[I];
    cdsDesp.FieldByName('Valor').AsFloat := FContas.valorDocumento[I];
    cdsDesp.FieldByName('CodFornecedor').AsInteger := FContas.CodFornecedor[I];
    cdsDesp.FieldByName('Controles').AsInteger := FContas.Controle[I];
    cdsDesp.FieldByName('NChq').AsString := FContas.NCHQ[I];
    cdsDesp.FieldByName('NominalChq').AsString := FContas.NCHQNominal[I];

    buscas.Close;
    buscas.SQL.Text := 'SELECT CODIGO_CTRL, NOME_CTRL, CONTR_BANC FROM CONTROLES ' +
     ' WHERE CODIGO_CTRL = :CODIGO_CTRL ' +
     ' AND CODIGO_EMP = :CODIGO_EMP ';
    buscas.ParamByName('CODIGO_CTRL').AsInteger := cdsDesp.FieldByName('Controles').AsInteger;
    buscas.ParamByName('CODIGO_EMP').AsInteger := vDadosIni.cod_empresa;
    buscas.Open;

    vNomeCtr := buscas.FieldByName('NOME_CTRL').AsString;
    vContrBanco := buscas.FieldByName('CONTR_BANC').AsString;

    cdsDesp.FieldByName('ContrBanc').AsString := vContrBanco;
    cdsDesp.FieldByName('NomeControle').AsString := trim(vNomeCtr);

    cdsDesp.Post;
  end;
end;

function TContasAPagar.insert: boolean;
begin
  if not dataSet.Active then
    montaSelect(' select ' + Fsql_campos + ' from contas_a_pagar ' +
     Fsql_inner +
     Fsql_inner_pag +
     ' where contas_a_pagar.cod_contrp = -1 ' +
     ' and contas_a_pagar.codigo_emp = ' + vDadosIni.codEmpresa);
  vDadosIni.definirDiaFinanceiroFechado(buscas);
  Result := inherited Insert;
  if Result then
  begin
    vEmpresasUnificadas._abreTodosEmpresas;
    vDadosIni.vDataHora := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('CODIGO_EMP').AsInteger := strToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('COD_EMP_MULT').AsInteger := strToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('DATA_ENT_CTP').AsDateTime := vDadosIni.diaFFinanceiro+1; //_retornaDiaFinanceiroAberto(buscas);
    vDadosIni.vInibeMensPesqPros := 'S';
    if vDadosIni.PesqPros('LANC034', 'HABILITAR', '', 'CONTAS_A_PAGAR', '', buscas, True) then
      dataSet.FieldByName('DTREFERENCIA').AsDateTime := dataSet.FieldByName('DATA_ENT_CTP').AsDateTime;
    dataSet.FieldByName('TIPO_CTP').AsString := 'D';
    vCodEmpMult := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
    vCodControle := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
    vDataReferencia := dataSet.FieldByName('DTREFERENCIA').AsDateTime;

    if vDadosIni.vContrapartida then
    begin
      dataSet.FieldByName('VALOR_CTP').AsFloat := vDadosIni.vValorContrapartida;
      dataSet.FieldByName('VALOR_CTP_ORIG').AsFloat := vDadosIni.vValorContrapartida;
      dataSet.FieldByName('VL_CONTABIL').AsFloat := vDadosIni.vValorContabilContrapartida;
    end;

    _listaPContas;
    _listaControles(false, 0, dataSet.FieldByName('COD_EMP_MULT').AsInteger);
  end;

end;

function TContasAPagar.obterValorFaturamento(pdataini: TDateTime; pdatafim: TDateTime; pCodEmpresa: Integer): Double;
begin
	Result := 0;

	buscas.Close;
  buscas.SQL.Text :=
    ' select pd.tipo, ' +
    ' sum(coalesce(pd.valor_total, 0)) valor_total from pedvenda pd ' +
    ' inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.cod_empresa = pd.cod_empresa ' +
    ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
    ' 	and tv.venda = ''S'' ' +
    ' where trim(pd.tipo) in (''REQ'', ''OS'') and coalesce(pd.status_ped, '''') = ''FECHADA'' ' +
    ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
    ' group by 1 ' +
    ' union ' +
    ' select ''MOT'' as tipo, ' +
    ' sum(coalesce(cf.valor_real, 0)) as valor_total from com_fat cf ' +
    ' inner join clientes cl on cl.cod_cliente = cf.clientes_v and cl.cod_empresa = cf.cod_empresa ' +
    ' inner join tipo_vendas tv on tv.tipo = ''VEI'' and tv.tipo_os = cf.tipo_v ' +
    ' 	and tv.venda = ''S'' ' +
    ' where cf.status_v = ''FECHADO'' and cf.natureza = ''S'' ' +
    ' and cf.data_fech >= :dtini and cf.data_fech <= :dtfim and cf.cod_empresa = :cod_empresa ' +
    ' group by 1 ' +
    ' union ' +
    ' select ''VALE''||pd.tipo, ' +
    ' sum(coalesce((select coalesce(valor_vale, 0) from existe_formas (pd.nped, pd.tipo, pd.cod_empresa)), 0)) valor_total from pedvenda pd ' +
    ' inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.cod_empresa = pd.cod_empresa ' +
    ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
    ' 	and tv.venda = ''S'' ' +
    ' where trim(pd.tipo) in (''REQ'', ''OS'') and coalesce(pd.status_ped, '''') = ''FECHADA'' ' +
    ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
    ' group by 1 ' +
    ' union ' +
    ' select ''VALEMOT'' as tipo, ' +
    ' sum(coalesce((select coalesce(valor_vale, 0) from existe_formas (cf.n_comando, ''MOT'', cf.cod_empresa)), 0)) as valor_total from com_fat cf ' +
    ' inner join clientes cl on cl.cod_cliente = cf.clientes_v and cl.cod_empresa = cf.cod_empresa ' +
    ' inner join tipo_vendas tv on tv.tipo = ''VEI'' and tv.tipo_os = cf.tipo_v ' +
    ' 	and tv.venda = ''S'' ' +
    ' where cf.status_v = ''FECHADO'' and cf.natureza = ''S'' ' +
    ' and cf.data_fech >= :dtini and cf.data_fech <= :dtfim and cf.cod_empresa = :cod_empresa ' +
    ' group by 1 ' +
    ' union ' +
    ' select ''DEV'' tipo, ' +
    ' sum(coalesce((select coalesce(dp.valor_dev, 0) from devolucao_nped (pd.nped, pd.tipo, pd.cod_empresa) dp), 0)) valor_total from pedvenda pd ' +
    ' inner join clientes cl on cl.cod_cliente = pd.cod_cliente and cl.cod_empresa = pd.cod_empresa ' +
    ' inner join tipo_vendas tv on pd.tipo = tv.tipo and ((pd.tipv = tv.sigla) or (pd.tipo_os = tv.tipo_os)) ' +
    ' 	and tv.venda = ''S'' ' +
    ' where trim(pd.tipo) in (''REQ'', ''OS'') and coalesce(pd.status_ped, '''') = ''FECHADA'' ' +
    ' and pd.data_fech >= :dtini and pd.data_fech <= :dtfim and pd.cod_empresa = :cod_empresa ' +
    ' group by 1 ' +
    ' union ' +
    ' select ''DEV'' as tipo, ' +
    ' sum(case when (select ndev from existe_dev_nf_v(cf.cod_nf, cf.cod_empresa)) > 0 then ' +
    '    (coalesce(-1 * cf.valor_real, 0)) ' +
    ' else ' +
    '	0 ' +
    ' end) as valor_total from com_fat cf ' +
    ' inner join clientes cl on cl.cod_cliente = cf.clientes_v and cl.cod_empresa = cf.cod_empresa ' +
    ' inner join tipo_vendas tv on tv.tipo = ''VEI'' and tv.tipo_os = cf.tipo_v ' +
    ' 	and tv.venda = ''S'' ' +
    ' where cf.status_v = ''FECHADO'' and cf.natureza = ''S'' ' +
    ' and cf.data_fech >= :dtini and cf.data_fech <= :dtfim and cf.cod_empresa = :cod_empresa ' +
    ' group by 1 ' +
    ' union ' +
    ' select ''DEVA'' tipo, ' +
    ' sum(coalesce(-1 * case when (dev.valor_tot > 0) then dev.valor_tot else (dev.quant * dev.valor) end, 0)) as valor_total from devolucao dev ' +
    ' inner join clientes cl on cl.cod_cliente = dev.cod_cliente and cl.cod_empresa = dev.cod_empresa ' +
    ' where dev.data >= :dtini and dev.data <= :dtfim and dev.cod_empresa = :cod_empresa ' +
    ' and not((coalesce(dev.cod_venda, 0) > 0) and (dev.tipo_venda in (''REQ'', ''OS''))) ' +
    ' group by 1 ' +
    ' union ' +
    ' select ''DEVA'' as tipo, ' +
    ' sum(coalesce(-1 * nfi2.valor_total, 0)) as valor_total from notafiscal nf2 ' +
    ' inner join clientes cl on cl.cod_cliente = nf2.cod_cliente and cl.cod_empresa = nf2.cod_empresa ' +
    ' inner join notafiscal_item nfi2 on nfi2.cod_nf = nf2.cod_nf and nfi2.cod_empresa = nf2.cod_empresa ' +
    ' where coalesce(nfi2.cod_nf_dev, 0) <= 0 ' +
    ' and nf2.tipo_nf = ''V'' and nf2.natureza_nf = ''E'' and nf2.devolucao = ''SIM'' ' +
    ' and nf2.emissao_propria = ''S'' and nf2.status = ''Fechada'' and nf2.situacao_nfe = ''Autorizada'' ' +
    ' and nf2.data_lanc >= :dtini and nf2.data_lanc <= :dtfim and nf2.cod_empresa = :cod_empresa ' +
    ' group by 1 ' +
    ' union ' +
    ' select ''DEVA'' as tipo, ' +
    ' sum(coalesce(-1 * nfi2.valor_total, 0)) as valor_total from notafiscal nf2 ' +
    ' inner join clientes cl on cl.cod_cliente = nf2.cod_cliente and cl.cod_empresa = nf2.cod_empresa ' +
    ' inner join notafiscal_item nfi2 on nfi2.cod_nf = nf2.cod_nf and nfi2.cod_empresa = nf2.cod_empresa ' +
    ' where coalesce(nfi2.cod_nf_dev, 0) <= 0 ' +
    ' and nf2.tipo_nf = ''V'' and nf2.natureza_nf = ''E'' and nf2.devolucao = ''SIM'' ' +
    ' and nf2.emissao_propria = ''N'' and nf2.status = ''Fechada'' ' +
    ' and nf2.data_lanc >= :dtini and nf2.data_lanc <= :dtfim and nf2.cod_empresa = :cod_empresa ' +
    ' group by 1 ';
  buscas.ParamByName('dtini').AsDateTime := pdataini;
  buscas.ParamByName('dtfim').AsDateTime := pdatafim;
  buscas.ParamByName('cod_empresa').AsInteger := pCodEmpresa;
  buscas.Open;
  buscas.FetchAll;

  Result := 0;
  
  buscas.First;
  while not buscas.Eof do
  begin
	  Result := Result + buscas.FieldByName('valor_total').AsFloat;

    buscas.Next;
  end;
end;

function TContasAPagar.post: boolean;
var
  acao, processo: string;
  vDataRef, vDataLan: TDate;
  vMensagem: string;
  vCodLanc: Integer;
  I, J: Integer;
  vCampo, vValor: Variant;
  buscas2: TIBQuery;
  vValorParcelas: Double;
  vArrayFat: array of Double;
  vValorFaturamento: Double;
begin
  try
    Result := false;
    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      result := true;
      exit;
    end;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    if dataSet.State = dsInsert then
    begin
      acao := 'INSERIR';
      processo := 'CTP021';
    end
    else
    begin
      acao := 'EDITAR';
      processo := 'CTP001';
    end;

    if vDadosIni.vEmp.vFinanceiroUnificado then
    begin
      if dataSet.FieldByName('COD_EMP_MULT').AsInteger <= 0 then
        raiseExceptionCreate('Código Empresa Unificada', 'DBEdit23');

      if not vEmpresasUnificadas._BuscarEmpresas(dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
        raiseExceptionCreate('Código Empresa Unificada não existe ou não encontrada!', 'DBEdit23');
    end
    else
      dataSet.FieldByName('COD_EMP_MULT').AsInteger := dataSet.FieldByName('CODIGO_EMP').AsInteger;


    if not _existePContas(0,2) then
    begin
      vNomeCampoErro := 'dbedit2';
      raiseExceptionCreate('Nº da Conta precisa não informado.', 'DBEdit2');
    end;

    if not testarNumConta(dataSet.FieldByName('N_CONTA_PLC').AsFloat, vMensagem) then
    begin
      vNomeCampoErro := 'dbedit2';
      raiseExceptionCreate(vMensagem, 'DBEdit2');
    end;

    if dataSet.FieldByName('COD_FORN_NFE').isnull then
      dataSet.FieldByName('COD_FORN_NFE').AsInteger := 0;

    if trim(dataSet.FieldByName('NOME_FOR_CTP').AsString) = '' then
    begin
      vNomeCampoErro := 'dbedit6';
      raiseExceptionCreate('Nome do fornecedor não informado.' + chr(13) + 'Campo requerido.', 'dbedit6');
    end;

    if dataSet.FieldByName('TIP_CNT').AsString = 'C' then
      if dataSet.FieldByName('VL_CONTABIL').AsFloat = 0 then
      begin
        vNomeCampoErro := 'dbedit12';
        raiseExceptionCreate('Valor contábil não informado.' + chr(13) + 'Campo requerido.', 'dbedit12');
      end;

    if not _validaNum_conta_plc then
    begin
      vNomeCampoErro := 'dbedit2';
      exit;
    end;

    if dataSet.FieldByName('CODIGO_CTRL').IsNull then
    begin
      vNomeCampoErro := 'dbedit3';
      raiseExceptionCreate('Controle não informado.' + chr(13) + 'Campo requerido.', 'DBEdit3');
    end;

    if (acao = 'EDITAR') and (vCodControle = dataSet.FieldByName('codigo_ctrl').AsInteger) then
    	//Não fazer nada
    else if not _existeControle(dataSet.FieldByName('codigo_ctrl').AsInteger, dataSet.FieldByName('cod_emp_mult').AsInteger) then
    begin
    	vNomeCampoErro := 'dbedit3';
      raiseExceptionCreate('Controle não encontrado.' + chr(13) + 'Campo requerido.', 'dbedit3');
    end;

    if trim(dataSet.FieldByName('N_DOC_CTP').AsString) = '' then
      if dataSet.FieldByName('VL_CONTABIL').AsFloat = 0 then
      begin
        vNomeCampoErro := 'dbedit9';
        raiseExceptionCreate('Nº Documento Vazio' + chr(13) + 'Campo requerido.', 'dbedit9');
      end;

    if Trim(dataSet.FieldByName('data_venc_ctp').AsString) = '' then
    begin
    	vNomeCampoErro := 'dbedit1';
      raiseExceptionCreate('Data vencimento inválida', 'dbedit1');
    end;

    if dataSet.FieldByName('DTREFERENCIA').IsNull then
    begin
    	vNomeCampoErro := 'dbedit16';
     	raiseExceptionCreate('Data Referência não preenchida', 'dbedit16');
    end;

    buscas.Close;
    buscas.SQL.Text:= ' select * from Contas_a_Pagar ' +
    	' where COD_FORN_NFE = :Vcod ' +
      ' and N_DOC_CTP = :vndoc ' +
      ' and DATA_VENC_CTP = :vdat '+
	    ' and codigo_emp = :cod_empresa ';
    buscas.params[0].AsInteger := dataSet.FieldByName('COD_FORN_NFE').Value;
    buscas.params[1].AsString := dataSet.FieldByName('N_DOC_CTP').AsString;
    buscas.Params[2].AsDate := dataSet.FieldByName('DATA_VENC_CTP').AsDateTime;
    buscas.Params[3].value := vDadosIni.codEmpresa;
    buscas.open;
    if not buscas.IsEmpty then
    begin
     if acao = 'INSERIR' then
     begin
       if Pos('FOPAG|', vDadosIni.vPesquisa) > 0 then
       begin
         if Application.MessageBox(Pchar('Mesmo Nº de documento/Data de Vencimento/codforn/codempresa já exitem no Cadastro. Deseja continuar mesmo assim?'),
           'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
         begin
           Result := False;
           Exit;
         end;
       end
       else
       begin
         vNomeCampoErro := 'dbedit1';
         raiseExceptionCreate('Mesmo Nº de documento/Data de Vencimento/codforn/codempresa já exitem no Cadastro', 'dbedit1');
       end;
     end
     else
     begin
      if dataSet.FieldByName('COD_CONTRP').AsInteger <> buscas.FieldByName('COD_CONTRP').AsInteger then
      begin
      	vNomeCampoErro := 'dbedit1';
       	raiseExceptionCreate('Mesmo Nº de documento/Data de Vencimento/codforn/codempresa já exitem no Cadastro', 'dbedit1');
      end;
     end;
    end;

    if not _existeContasPagar then
    begin
      vNomeCampoErro := 'dbedit1';
      raiseExceptionCreate('Mesmo Nº de documento/codforn/num nota/serie/codempresa já exitem no Cadastro', 'dbedit1');
    end;

    if (acao = 'INSERIR') or ((acao = 'EDITAR') and (vDataReferencia <> dataSet.FieldByName('DTREFERENCIA').AsDateTime)) then
    begin
      buscas.Close;
      buscas.SQL.Text := ' select first 1 apuracao_depto.cod_dep, ' +
        ' apuracao_depto.mes, ' +
        ' apuracao_depto.ano, ' +
        ' apuracao_depto.tpdesp, ' +
        ' apuracao_depto.cod_empresa, ' +
        ' apuracao_depto.datacad_ap from apuracao_depto ' +
        ' inner join empresa on empresa.cod_empresa = apuracao_depto.cod_empresa ' +
        ' where apuracao_depto.mes = :mes ' +
        ' and apuracao_depto.ano = :ano ' +
        ' and (case when (empresa.financeiro_unificado = ''S'') then ' +
        '             empresa.codigo_unificadora ' +
        '           else ' +
        '             apuracao_depto.cod_empresa ' +
        '      end) = :cod_empresa ';
      buscas.ParamByName('mes').AsInteger := StrToInt(FormatDateTime('mm', dataSet.FieldByName('dtreferencia').AsDateTime));
      buscas.ParamByName('ano').AsInteger := StrToInt(FormatDateTime('yyyy', dataSet.FieldByName('dtreferencia').AsDateTime));
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.Open;

      if not buscas.IsEmpty then
      begin
      	if Application.MessageBox(PChar('DRE do mês ' + FormatDateTime('mm', dataSet.FieldByName('dtreferencia').AsDateTime) +
          ' ano ' + FormatDateTime('yyyy', dataSet.FieldByName('dtreferencia').AsDateTime) +
          ' salvo, deseja continuar o cadastro/alteração mesmo assim?'),
        	'Confirmação', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDNO then
        begin
        	vNomeCampoErro := 'dbedit16';
          raiseExceptionCreate('DRE do mês ' + FormatDateTime('mm', dataSet.FieldByName('dtreferencia').AsDateTime) +
            ' ano ' + FormatDateTime('yyyy', dataSet.FieldByName('dtreferencia').AsDateTime) +
            ' salvo, não é permitido utilizar esta data de referência para continuar o cadastro/alteração', 'dbedit16');
        end;

      	if not vDadosIni.PesqPros('CTP042', 'PERMITIR', '', 'CONTAS_A_PAGAR',
        	dataSet.FieldByName('COD_CONTRP').AsString+'/'+dataSet.FieldByName('N_DOC_CTP').AsString, buscas, true) then
        begin
          vNomeCampoErro := 'dbedit16';
          raiseExceptionCreate('DRE do mês ' + FormatDateTime('mm', dataSet.FieldByName('dtreferencia').AsDateTime) +
            ' ano ' + FormatDateTime('yyyy', dataSet.FieldByName('dtreferencia').AsDateTime) +
            ' salvo, não é permitido utilizar esta data de referência para continuar o cadastro/alteração', 'dbedit16');
        end;
      end;
    end;

    vDataLan := StartOfTheMonth(dataSet.FieldByName('data_ent_ctp').AsDateTime);
    vDataRef := StartOfTheMonth(dataSet.FieldByName('dtreferencia').AsDateTime);

    if vDataRef >= vDataLan then
    begin
      buscas.Close;
      buscas.SQL.Text := ' select conta_referencia from p_contas' +
        ' where N_CONTA_PLC = :N_CONTA_PLC';
      buscas.ParamByName('N_CONTA_PLC').AsFloat := dataSet.FieldByName('N_CONTA_PLC').AsFloat;
      buscas.Open;
      if buscas.FieldByName('CONTA_REFERENCIA').AsString = 'S' then
      begin
        Application.MessageBox(PChar('Conta do lançamento configurada como conta de referência!' + #13 +
          'O mês de referência do lançamento deve ser inferior ao mes do Financeiro'), 'Atenção', MB_ICONWARNING + MB_OK);
        if not vDadosIni.PesqPros('LANC035', 'VALIDAR', trim(dataSet.FieldByName('N_DOC_CTP').AsString)+' '+dataSet.FieldByName('NOME_FOR_CTP').AsString,
          'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString, buscas, True, True) then
          exit;
      end;
    end;

    buscas.close;
    buscas.sql.text := ' select count(*) as conta from contas_rel_origem ' +
    	' where N_CONTA_PLC_OR = cast('+vDadosIni.trocaVirgulaPorPonto(dataSet.FieldByName('N_CONTA_PLC').AsString)+ ' as double precision)';
    buscas.open;
    if buscas.FieldByName('CONTA').AsInteger > 0 then
    begin
      if (vDadosIni.vEmp.vFinanceiroUnificado) then
      begin
      	preencherDadosRateios;
      	if not abreFormEmpresas then
        begin
        	Result:=false;
        	exit;
        end;
        try
        	vEmpresasUnificadas.dataSet.Filtered := false;
          vEmpresasUnificadas.dataSet.Filter := 'SEL = ''S'' ';
          vEmpresasUnificadas.dataSet.Filtered := true;
          vEmpresasUnificadas.dataSet.IndexFieldNames := 'COD_EMPRESA';

          SetLength(vArrayFat, vEmpresasUnificadas.dataSet.RecordCount);

          vEmpresasUnificadas.dataSet.First;
          while not	vEmpresasUnificadas.dataSet.Eof do
          begin
            vArrayFat[vEmpresasUnificadas.dataSet.RecNo - 1] :=
            	obterValorFaturamento(
              	StartOfTheMonth(vDadosIni.vDtSetTmp.FieldByName('DTREFERENCIA').AsDateTime),
              	EndOfTheMonth(vDadosIni.vDtSetTmp.FieldByName('DTREFERENCIA').AsDateTime),
                vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger);

          	vEmpresasUnificadas.dataSet.Next;
          end;

          vValorFaturamento := 0;
          for I := 0 to Length(vArrayFat) - 1 do
          	vValorFaturamento := vValorFaturamento + vArrayFat[I];

          vEmpresasUnificadas.dataSet.First;
          while not	vEmpresasUnificadas.dataSet.Eof do
          begin
          	if (vDadosIni.vEmp.vFinanceiroUnificado) and (vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger > 0) then
              vTmpEmpMultRateio := vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger
            else
              vTmpEmpMultRateio := dataSet.FieldByName('COD_EMP_MULT').AsInteger;

            if definirRateiosContas(vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger) then
            begin
            	_listaControles(false, 0, vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger);

              if Assigned(FrmRatContas) then
                FreeAndNil(FrmRatContas);
              
              Application.CreateForm(TFrmRatContas,FrmRatContas);
              if dtSetPContas = nil then
                _listaPContas('S', dataSet.FieldByName('N_CONTA_PLC').AsFloat);
              FrmRatContas.Caption := 'RATEIO DE CONTA PARA CONTA [' +
              	IntToStr(vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger) + ' - ' +
              	trim(vEmpresasUnificadas.dataset.FieldByName('IDENTIFICACAO_EMP').AsString) + ']';
              FrmRatContas.Panel1.Caption := trim(dtSetPContas.FieldByName('DESC_PLC').AsString);

              FrmRatContas.GroupBox1.Visible := false;
              if vEmpresasUnificadas.dataSet.RecordCount > 1 then
              begin
                FrmRatContas.GroupBox1.Visible := true;
                FrmRatContas.lbQtdeEmp.Visible := true;
                FrmRatContas.IBQuery1 := buscas;
                FrmRatContas.Tag := vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger;
                FrmRatContas.lbCPF.Caption := vEmpresasUnificadas.dataSet.FieldByName('CGC_EMP').AsString;
                FrmRatContas.lbQtdeEmp.Caption := IntToStr(vEmpresasUnificadas.dataset.RecNo) + ' / ' +
                  IntToStr(vEmpresasUnificadas.dataset.RecordCount);
                FrmRatContas.Panel2.Visible := true;
                FrmRatContas.DBGrid1.Visible := true;

                _listaControles(false, 0, vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger);

                if vDadosIni.vDtSetTmp.FieldByName('CODIGO_EMP').AsInteger = vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger then
                begin
                  FrmRatContas.EditHwFornec.AsValue := vDadosIni.vDtSetTmp.FieldByName('COD_FORN_NFE').Value;
                  FrmRatContas.EditFornec.Text := vDadosIni.vDtSetTmp.FieldByName('NOME_FOR_CTP').Value;
                  FrmRatContas.EditHwControle.AsValue := vDadosIni.vDtSetTmp.FieldByName('CODIGO_CTRL').Value;
                  FrmRatContas.DBLookupComboBoxControle.KeyValue := vDadosIni.vDtSetTmp.FieldByName('CODIGO_CTRL').Value;
                end
                else
                begin
                  FrmRatContas.EditHwFornec.AsValue := 0;
                  FrmRatContas.EditFornec.Text := '';
                  FrmRatContas.EditHwControle.AsValue := 0;
                  FrmRatContas.DBLookupComboBoxControle.KeyValue := 0;

                  if vDadosIni.vDtSetTmp.FieldByName('COD_FORN_NFE').Value > 0 then
                  begin
                    buscas.Close;
                    buscas.SQL.Text := ' select cod_cliente, nome_cliente, cpfcgc from clientes ' +
                      ' where cod_cliente = ' + IntToStr(vDadosIni.vDtSetTmp.FieldByName('COD_FORN_NFE').AsInteger) +
                      ' and cod_empresa = ' + IntToStr(vDadosIni.vDtSetTmp.FieldByName('CODIGO_EMP').AsInteger);
                    buscas.Open;

                    if trim(buscas.FieldByName('CPFCGC').AsString) <> '' then
                    begin
                      buscas2.Close;
                      buscas2.SQL.Text := ' select cod_cliente, nome_cliente, cpfcgc from clientes ' +
                        ' where cpfcgc = ' + QuotedStr(buscas.FieldByName('CPFCGC').AsString) +
                        ' and cod_empresa = ' + IntToStr(vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger) +
                        ' order by cod_cliente ';
                      buscas2.Open;

                      if not buscas2.IsEmpty then
                      begin
                        FrmRatContas.EditHwFornec.AsValue := buscas2.FieldByName('COD_CLIENTE').AsInteger;
                        FrmRatContas.EditFornec.Text := buscas2.FieldByName('NOME_CLIENTE').AsString;
                      end;
                    end;
                  end;

                  if vDadosIni.vDtSetTmp.FieldByName('CODIGO_CTRL').Value > 0 then
                  begin
	                  buscas.Close;
                    buscas.SQL.Text := ' select * from controles ' +
								  	  ' where codigo_ctrl = ' + IntToStr(vDadosIni.vDtSetTmp.FieldByName('CODIGO_CTRL').Value) +
                      ' and codigo_emp = ' + IntToStr(vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger) +
								      ' and ativo = 1 ' +
											' and (coalesce(controle_visivel, ''S'') = ''S'') ' +
									    ' and coalesce(nao_gera_finan, '''') <> ''S'' ';
                    buscas.Open;

                    if not buscas.IsEmpty then
                    begin
                      FrmRatContas.EditHwControle.AsValue := buscas.FieldByName('CODIGO_CTRL').AsInteger;
                      FrmRatContas.DBLookupComboBoxControle.KeyValue := buscas.FieldByName('CODIGO_CTRL').AsInteger;
                    end;
                  end;
                end;
                FrmRatContas.EditHwValor.AsValue :=
                	vDadosIni.vDtSetTmp.FieldByName('VALOR_CTP').AsFloat *
                  (vArrayFat[vEmpresasUnificadas.dataSet.RecNo - 1] / vValorFaturamento);
                FrmRatContas.EditHwValorContabil.AsValue :=
                	vDadosIni.vDtSetTmp.FieldByName('VALOR_CTP').AsFloat *
                  (vArrayFat[vEmpresasUnificadas.dataSet.RecNo - 1] / vValorFaturamento);
//                FrmRatContas.EditHwValor.AsValue := vDadosIni.vDtSetTmp.FieldByName('VALOR_CTP').AsFloat;
//                FrmRatContas.EditHwValorContabil.AsValue := vDadosIni.vDtSetTmp.FieldByName('VL_CONTABIL').AsFloat;
              	try
                	FdtRateiosContas.DisableControls;
                  FdtRateiosContas.First;
                  while not FdtRateiosContas.Eof do
                  begin
                    FdtRateiosContas.Edit;
                    FdtRateiosContas.FieldByName('VALORDESTINO').Value:=(FdtRateiosContas.FieldByName('PERCORIGEM').Value/100)*FrmRatContas.EditHwValor.AsValue;
                    FdtRateiosContas.FieldByName('VALORDESTINOCNT').Value:=(FdtRateiosContas.FieldByName('PERCORIGEM').Value/100)*FrmRatContas.EditHwValor.AsValue;
                    FdtRateiosContas.Post;

                    FdtRateiosContas.Next;
                  end;
                finally
                	FdtRateiosContas.First;
                  FdtRateiosContas.EnableControls;
                end;
              end;
              FrmRatContas.ShowModal;
              if FrmRatContas.ModalResult = mrcancel then
              begin
              	RollBackTransacao;
                Refresh;
                _listaControles(false, 0, vDadosIni.vDtSetTmp.FieldByName('CODIGO_EMP').AsInteger);
                vNomeCampoErro := 'dbedit2';
                retornaDadosDataSet;
                raiseExceptionCreate('Cancelado o lançamento do rateio', 'dbedit2');
                exit;
              end
              else
              begin
              	vcodfornRateio := Trunc(FrmRatContas.EditHwFornec.AsValue);
                vnomefornRateio := Trim(FrmRatContas.EditFornec.Text);
                // Chama o método para replicar as contas
                if not cadastraRateios(false) then
                begin
                	RollBackTransacao;
                  Refresh;
                  _listaControles(false, 0, vDadosIni.vDtSetTmp.FieldByName('CODIGO_EMP').AsInteger);
                	retornaDadosDataSet;
                	result:=false;
                  exit;
                end;
              end;
            end
            else
            begin
            	RollBackTransacao;
              Refresh;
              _listaControles(false, 0, vDadosIni.vDtSetTmp.FieldByName('CODIGO_EMP').AsInteger);
              result:=false;
              exit;
            end;

            vEmpresasUnificadas.dataSet.Next;
          end;
          CommitaTransacao;
          Result := true;
          Refresh;
          exit;
        finally
          vEmpresasUnificadas.dataSet.Filtered := false;
          vEmpresasUnificadas.dataSet.IndexFieldNames := 'COD_EMPRESA';
        end;
      end
      else
      begin
      	preencherDadosRateios;
        if definirRateiosContas then
        begin

          if Assigned(FrmRatContas) then
            FreeAndNil(FrmRatContas);

          Application.CreateForm(TFrmRatContas,FrmRatContas);
          if dtSetPContas = nil then
            _listaPContas('S', dataSet.FieldByName('N_CONTA_PLC').AsFloat);
          FrmRatContas.Caption := 'RATEIO DE CONTA PARA CONTA';
          FrmRatContas.Panel1.Caption := trim(dtSetPContas.FieldByName('DESC_PLC').AsString);
          FrmRatContas.GroupBox1.Visible := false;
          FrmRatContas.lbQtdeEmp.Visible := false;
          FrmRatContas.Panel2.Visible := true;
          FrmRatContas.DBGrid1.Visible := true;
          
          FrmRatContas.ShowModal;
          if FrmRatContas.ModalResult = mrcancel then
          begin
            vNomeCampoErro := 'dbedit2';
            raiseExceptionCreate('Cancelado o lançamento do rateio', 'dbedit2');
            exit;
          end
          else
          begin
            // Chama o método para replicar as contas
            if not cadastraRateios then
            begin
              Result:=false;
              exit;
            end
            else
            begin
              result:=true;
              Refresh;
            end;
            exit;
          end;
        end
        else
        begin
          result:=false;
          exit;
        end;
      end;
    end
    else if (vDadosIni.vEmp.vFinanceiroUnificado) then
    begin
    	buscas.close;
      buscas.sql.text := ' select coalesce(rateio_empresa, ''N'') rateio_empresa from p_contas ' +
        ' where N_CONTA_PLC = cast('+vDadosIni.trocaVirgulaPorPonto(dataSet.FieldByName('N_CONTA_PLC').AsString)+ ' as double precision)';
      buscas.open;

      if buscas.FieldByName('RATEIO_EMPRESA').AsString = 'S' then
      begin
      	preencherDadosRateios;
      	if not abreFormEmpresas then
        begin
        	Result:=false;
        	exit;
        end;
        try
        	vEmpresasUnificadas.dataSet.Filtered := false;
          vEmpresasUnificadas.dataSet.Filter := 'SEL = ''S'' ';
          vEmpresasUnificadas.dataSet.Filtered := true;
          vEmpresasUnificadas.dataSet.IndexFieldNames := 'COD_EMPRESA';

          SetLength(vArrayFat, vEmpresasUnificadas.dataSet.RecordCount);

          vEmpresasUnificadas.dataSet.First;
          while not	vEmpresasUnificadas.dataSet.Eof do
          begin
            vArrayFat[vEmpresasUnificadas.dataSet.RecNo - 1] :=
            	obterValorFaturamento(
              	StartOfTheMonth(vDadosIni.vDtSetTmp.FieldByName('DTREFERENCIA').AsDateTime),
              	EndOfTheMonth(vDadosIni.vDtSetTmp.FieldByName('DTREFERENCIA').AsDateTime),
                vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger);

          	vEmpresasUnificadas.dataSet.Next;
          end;

          vValorFaturamento := 0;
          for I := 0 to Length(vArrayFat) - 1 do
          	vValorFaturamento := vValorFaturamento + vArrayFat[I];

          vEmpresasUnificadas.dataSet.First;
          while not	vEmpresasUnificadas.dataSet.Eof do
          begin
          	if (vDadosIni.vEmp.vFinanceiroUnificado) and (vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger > 0) then
              vTmpEmpMultRateio := vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger
            else
              vTmpEmpMultRateio := dataSet.FieldByName('COD_EMP_MULT').AsInteger;

            _listaControles(false, 0, vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger);

            if Assigned(FrmRatContas) then
              FreeAndNil(FrmRatContas);

            Application.CreateForm(TFrmRatContas,FrmRatContas);
            if dtSetPContas = nil then
              _listaPContas('S', dataSet.FieldByName('N_CONTA_PLC').AsFloat);
            FrmRatContas.Caption := 'RATEIO DE CONTA POR EMPRESA [' +
              IntToStr(vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger) + ' - ' +
              trim(vEmpresasUnificadas.dataset.FieldByName('IDENTIFICACAO_EMP').AsString) + ']';
            FrmRatContas.Panel1.Caption := trim(dtSetPContas.FieldByName('DESC_PLC').AsString);

            FrmRatContas.GroupBox1.Visible := false;
            if vEmpresasUnificadas.dataSet.RecordCount > 1 then
            begin
              FrmRatContas.GroupBox1.Visible := true;
              FrmRatContas.lbQtdeEmp.Visible := true;
              FrmRatContas.IBQuery1 := buscas;
              FrmRatContas.Tag := vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger;
              FrmRatContas.lbCPF.Caption := vEmpresasUnificadas.dataSet.FieldByName('CGC_EMP').AsString;
              FrmRatContas.lbQtdeEmp.Caption := IntToStr(vEmpresasUnificadas.dataset.RecNo) + ' / ' +
                IntToStr(vEmpresasUnificadas.dataset.RecordCount);
              FrmRatContas.Panel2.Visible := false;
		          FrmRatContas.DBGrid1.Visible := false;
              FrmRatContas.Height := FrmRatContas.Height + 20 - (FrmRatContas.Panel2.Height + FrmRatContas.DBGrid1.Height);

              _listaControles(false, 0, vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger);

              if vDadosIni.vDtSetTmp.FieldByName('CODIGO_EMP').AsInteger = vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger then
              begin
                FrmRatContas.EditHwFornec.AsValue := vDadosIni.vDtSetTmp.FieldByName('COD_FORN_NFE').Value;
                FrmRatContas.EditFornec.Text := vDadosIni.vDtSetTmp.FieldByName('NOME_FOR_CTP').Value;
                FrmRatContas.EditHwControle.AsValue := vDadosIni.vDtSetTmp.FieldByName('CODIGO_CTRL').Value;
                FrmRatContas.DBLookupComboBoxControle.KeyValue := vDadosIni.vDtSetTmp.FieldByName('CODIGO_CTRL').Value;
              end
              else
              begin
                FrmRatContas.EditHwFornec.AsValue := 0;
                FrmRatContas.EditFornec.Text := '';
                FrmRatContas.EditHwControle.AsValue := 0;
                FrmRatContas.DBLookupComboBoxControle.KeyValue := 0;

                if vDadosIni.vDtSetTmp.FieldByName('COD_FORN_NFE').Value > 0 then
                begin
                  buscas.Close;
                  buscas.SQL.Text := ' select cod_cliente, nome_cliente, cpfcgc from clientes ' +
                    ' where cod_cliente = ' + IntToStr(vDadosIni.vDtSetTmp.FieldByName('COD_FORN_NFE').AsInteger) +
                    ' and cod_empresa = ' + IntToStr(vDadosIni.vDtSetTmp.FieldByName('CODIGO_EMP').AsInteger);
                  buscas.Open;

                  if trim(buscas.FieldByName('CPFCGC').AsString) <> '' then
                  begin
                    buscas2.Close;
                    buscas2.SQL.Text := ' select cod_cliente, nome_cliente, cpfcgc from clientes ' +
                      ' where cpfcgc = ' + QuotedStr(buscas.FieldByName('CPFCGC').AsString) +
                      ' and cod_empresa = ' + IntToStr(vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger) +
                      ' order by cod_cliente ';
                    buscas2.Open;

                    if not buscas2.IsEmpty then
                    begin
                      FrmRatContas.EditHwFornec.AsValue := buscas2.FieldByName('COD_CLIENTE').AsInteger;
                      FrmRatContas.EditFornec.Text := buscas2.FieldByName('NOME_CLIENTE').AsString;
                    end;
                  end;
                end;

                if vDadosIni.vDtSetTmp.FieldByName('CODIGO_CTRL').Value > 0 then
                begin
                  buscas.Close;
                  buscas.SQL.Text := ' select * from controles ' +
                    ' where codigo_ctrl = ' + IntToStr(vDadosIni.vDtSetTmp.FieldByName('CODIGO_CTRL').Value) +
                    ' and codigo_emp = ' + IntToStr(vEmpresasUnificadas.dataSet.FieldByName('COD_EMPRESA').AsInteger) +
                    ' and ativo = 1 ' +
                    ' and (coalesce(controle_visivel, ''S'') = ''S'') ' +
                    ' and coalesce(nao_gera_finan, '''') <> ''S'' ';
                  buscas.Open;

                  if not buscas.IsEmpty then
                  begin
                    FrmRatContas.EditHwControle.AsValue := buscas.FieldByName('CODIGO_CTRL').AsInteger;
                    FrmRatContas.DBLookupComboBoxControle.KeyValue := buscas.FieldByName('CODIGO_CTRL').AsInteger;
                  end;
                end;
              end;
              if vValorFaturamento <= 0 then
              	FrmRatContas.EditHwValor.AsValue := 0
              else
                FrmRatContas.EditHwValor.AsValue :=
                  vDadosIni.vDtSetTmp.FieldByName('VALOR_CTP').AsFloat *
                  (vArrayFat[vEmpresasUnificadas.dataSet.RecNo - 1] / vValorFaturamento);

              if vValorFaturamento <= 0 then
              	FrmRatContas.EditHwValorContabil.AsValue := 0
              else
                FrmRatContas.EditHwValorContabil.AsValue :=
                  vDadosIni.vDtSetTmp.FieldByName('VALOR_CTP').AsFloat *
                  (vArrayFat[vEmpresasUnificadas.dataSet.RecNo - 1] / vValorFaturamento);
//                FrmRatContas.EditHwValor.AsValue := vDadosIni.vDtSetTmp.FieldByName('VALOR_CTP').AsFloat;
//                FrmRatContas.EditHwValorContabil.AsValue := vDadosIni.vDtSetTmp.FieldByName('VL_CONTABIL').AsFloat;
            	vEmpresasUnificadas.dataSet.Edit;
              vEmpresasUnificadas.dataSet.FieldByName('VALORDESTINO').AsFloat := FrmRatContas.EditHwValor.AsValue;
              vEmpresasUnificadas.dataSet.FieldByName('VALORDESTINOCNT').AsFloat := FrmRatContas.EditHwValor.AsValue;
              vEmpresasUnificadas.dataSet.Post;
            end;
            FrmRatContas.ShowModal;
            if FrmRatContas.ModalResult = mrcancel then
            begin
              RollBackTransacao;
              Refresh;
              _listaControles(false, 0, vDadosIni.vDtSetTmp.FieldByName('CODIGO_EMP').AsInteger);
              vNomeCampoErro := 'dbedit2';
              retornaDadosDataSet;
              raiseExceptionCreate('Cancelado o lançamento do rateio', 'dbedit2');
              exit;
            end
            else
            begin
            	vvalorCtpRateio   := FrmRatContas.EditHwValor.AsValue;
              vvlcontabilRateio := FrmRatContas.EditHwValorContabil.AsValue;
              vcodfornRateio    := Trunc(FrmRatContas.EditHwFornec.AsValue);
              vnomefornRateio   := Trim(FrmRatContas.EditFornec.Text);
              // Chama o método para replicar as contas
              if not cadastraRateiosEmpresas(false) then
              begin
                RollBackTransacao;
                Refresh;
                _listaControles(false, 0, vDadosIni.vDtSetTmp.FieldByName('CODIGO_EMP').AsInteger);
                retornaDadosDataSet;
                result:=false;
              end;
            end;

            vEmpresasUnificadas.dataSet.Next;
          end;
          CommitaTransacao;
          Result := true;
          Refresh;
          exit;
        finally
        	vEmpresasUnificadas.dataSet.Filtered := false;
          vEmpresasUnificadas.dataSet.IndexFieldNames := 'COD_EMPRESA';
        end;
      end;
    end;

    if QtdeReplicacao > 0 then
      if Trim(dataSet.FieldByName('n_doc_ctp').AsString) = '' then
      begin
        vNomeCampoErro := 'DBEdit9';
        raiseExceptionCreate('Para replicar contas é necessário informar o número do documento', 'DBEdit9');
      end;

    for I := 0 to (FContas.parcelas - 1) do
      vValorParcelas := vValorParcelas + FContas.valorDocumento[I];
    if not FrmCadContasAPagar.cdsDesp.IsEmpty then
      if (vDadosIni.StrToFloatFormat(vValorParcelas, 2) > 0) and (vDadosIni.StrToFloatFormat(vValorParcelas, 2) <>  vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_CTP').AsFloat, 2)) then
      begin
        Application.MessageBox(Pchar('Valor total das parcelas difere do valor da contrapartida' + #13 +
          'Valor total do parcelamento = '''+ 'R$ ' + FormatFloat('0.00', vValorParcelas) + '''' + #13 +
          'Valor da contrapartida = '''+ 'R$ ' +FormatFloat('0.00', dataSet.FieldByName('VALOR_CTP').AsFloat) + '''' + #13 +
          'Favor conferir!'), 'Aviso', MB_OK +  MB_ICONEXCLAMATION + MB_DEFBUTTON1);
         exit;
      end;

    if dataSet.State = dsInsert then
    begin
    	if dataSet.FieldByName('NPARCELA').IsNull then
      	dataSet.FieldByName('NPARCELA').AsInteger := 1;
    	if dataSet.FieldByName('QTDE_PARC').IsNull then
      	dataSet.FieldByName('QTDE_PARC').AsInteger := 1;
    end;

    if (FQtdeReplicacao > 0) then
    begin
      if ReferenciaMes then
        dataSet.FieldByName('DTREFERENCIA').AsDateTime := StartOfTheMonth(dataSet.FieldByName('DATA_VENC_CTP').AsDateTime) - 1;
//      else
//        dataSet.FieldByName('DTREFERENCIA').AsDateTime := dataSet.FieldByName('DATA_VENC_CTP').AsDateTime;
    end;

//    if (FQtdeReplicacao > 0)
//    	and (FReplAltNumQtdeReplicacao) then
//    begin
//      dataSet.FieldByName('N_DOC_CTP').AsString := Trim(dataSet.FieldByName('N_DOC_CTP').AsString) + '-' + intToStr(1);
//      dataSet.FieldByName('NPARCELA').AsInteger := 1;
//      dataSet.FieldByName('QTDE_PARC').AsInteger := FQtdeReplicacao + 1;
//    end;

    if dataSet.State = dsInsert then
    begin
      dtmContasAPagar.SpIncCodigo.Transaction := buscas.Transaction;
      if (FrmCadContasAPagar.cdsDesp.IsEmpty) and (not Recebendo) then
	      dataSet.FieldByName('COD_CONTRP').AsInteger := Gencodigo('CONTAS_A_PAGAR', dtmContasAPagar.SpIncCodigo, vDadosIni.codEmpresa);
    end;

    if (FrmCadContasAPagar.cdsDesp.IsEmpty) and (not Recebendo) then
    begin
      Result := inherited post;

      if dataSet.ChangeCount = 0 then
      begin
        Result := true;
        exit;
      end;

      if Result then
        Result := Apply;
    end;

    if ((acao = 'INSERIR') and (Recebendo) and (FrmCadContasAPagar.cdsDesp.IsEmpty)) then
    begin
    	vDadosIni.vDtSetTmp := TClientDataSet.Create(nil);
      vDadosIni.vDtSetTmp.Close;
      vDadosIni.vDtSetTmp.FieldDefs.Clear;
      for I := 0 to dataSet.Fields.Count - 1 do
        vDadosIni.vDtSetTmp.FieldDefs.Add(dataSet.Fields.Fields[I].FieldName, dataSet.Fields.Fields[I].DataType, dataSet.Fields.Fields[I].Size, false);
      vDadosIni.vDtSetTmp.CreateDataSet;
      vDadosIni.vDtSetTmp.EmptyDataSet;

      dtSetLancTemp.Append;
      for I := 0 to dataSet.Fields.Count - 1 do
      	dtSetLancTemp.FieldByName(dataSet.Fields[I].FieldName).Value := dataSet.Fields[I].Value;
      dtSetLancTemp.FieldByName('COD_CONTRP').AsInteger := 1;
      dtSetLancTemp.FieldByName('CODIGO_CTRL').AsInteger := 0;
      dtSetLancTemp.FieldByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('CODIGO_EMP').AsInteger;
      dtSetLancTemp.FieldByName('COD_EMP_MULT').AsInteger := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
      dtSetLancTemp.FieldByName('NOME_CTRL').AsString := 'CONTAS A PAGAR';
      dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat := dataSet.FieldByName('N_CONTA_PLC').AsFloat;
      dtSetLancTemp.FieldByName('VALOR_CTP').AsFloat := dataSet.FieldByName('VALOR_CTP').AsFloat;
      dtSetLancTemp.FieldByName('VALOR_CTP_ORIG').AsFloat := dataSet.FieldByName('VALOR_CTP').AsFloat;
      dtSetLancTemp.FieldByName('VL_CONTABIL').AsFloat := dataSet.FieldByName('VALOR_CTP').AsFloat;
      dtSetLancTemp.FieldByName('NDOC_L').AsString := dataSet.FieldByName('N_DOC_CTP').AsString;
      dtSetLancTemp.FieldByName('N_CHEQ_L').AsString := dataSet.FieldByName('N_CHEQ_CTP').AsString;
      dtSetLancTemp.FieldByName('VALOR_L').AsFloat := dataSet.FieldByName('VALOR_CTP').AsFloat;
      dtSetLancTemp.FieldByName('HISTORICO_L').AsString := dataSet.FieldByName('HISTORICO_CTP').AsString;
      dtSetLancTemp.FieldByName('TIPO_L').AsString := 'S';
    	dtSetLancTemp.FieldByName('CODIGO_CTRL_CONTRP').AsInteger := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
      dtSetLancTemp.FieldByName('NOME_CTRL_CONTRP').AsString := dataSet.FieldByName('NOME_CTRL').AsString;
      dtSetLancTemp.Post;

      dataSet.Cancel;
      Result := true;
      Exit;
    end
    else if ((acao = 'INSERIR') and (Recebendo) and (not FrmCadContasAPagar.cdsDesp.IsEmpty)) then
    begin
    	vDadosIni.vDtSetTmp := TClientDataSet.Create(nil);
      vDadosIni.vDtSetTmp.Close;
      vDadosIni.vDtSetTmp.FieldDefs.Clear;
      for I := 0 to dataSet.Fields.Count - 1 do
        vDadosIni.vDtSetTmp.FieldDefs.Add(dataSet.Fields.Fields[I].FieldName, dataSet.Fields.Fields[I].DataType, dataSet.Fields.Fields[I].Size, false);
      vDadosIni.vDtSetTmp.CreateDataSet;
      vDadosIni.vDtSetTmp.EmptyDataSet;

      FrmCadContasAPagar.cdsDesp.IndexFieldNames := 'NumConta';
      FrmCadContasAPagar.cdsDesp.First;
      while not FrmCadContasAPagar.cdsDesp.Eof do
      begin
        dtSetLancTemp.Append;
        for I := 0 to dataSet.Fields.Count - 1 do
          dtSetLancTemp.FieldByName(dataSet.Fields[I].FieldName).Value := dataSet.Fields[I].Value;
        dtSetLancTemp.FieldByName('COD_CONTRP').AsInteger := 1;
        dtSetLancTemp.FieldByName('CODIGO_CTRL').AsInteger := 0;
        dtSetLancTemp.FieldByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('CODIGO_EMP').AsInteger;
        dtSetLancTemp.FieldByName('COD_EMP_MULT').AsInteger := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
        dtSetLancTemp.FieldByName('NOME_CTRL').AsString := 'CONTAS A PAGAR';
        dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat := dataSet.FieldByName('N_CONTA_PLC').AsFloat;
        dtSetLancTemp.FieldByName('HISTORICO_L').AsString := dataSet.FieldByName('HISTORICO_CTP').AsString;
        dtSetLancTemp.FieldByName('TIPO_L').AsString := 'S';
        dtSetLancTemp.FieldByName('CODIGO_CTRL_CONTRP').AsInteger := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
        dtSetLancTemp.FieldByName('NOME_CTRL_CONTRP').AsString := dataSet.FieldByName('NOME_CTRL').AsString;

        dtSetLancTemp.FieldByName('N_DOC_CTP').AsString :=
        	FrmCadContasAPagar.cdsDesp.FieldByName('NumDoc').AsString;
        dtSetLancTemp.FieldByName('DTREFERENCIA').AsString :=
        	FrmCadContasAPagar.cdsDesp.FieldByName('DataReferencia').AsString;
        dtSetLancTemp.FieldByName('DATA_VENC_CTP').AsString :=
        	FrmCadContasAPagar.cdsDesp.FieldByName('DataVenc').AsString;
        dtSetLancTemp.FieldByName('NDOC_L').AsString :=
        	FrmCadContasAPagar.cdsDesp.FieldByName('NumDoc').AsString;
        dtSetLancTemp.FieldByName('N_CHEQ_L').AsString :=
        	dataSet.FieldByName('N_CHEQ_CTP').AsString;
        dtSetLancTemp.FieldByName('VALOR_CTP').AsFloat :=
        	FrmCadContasAPagar.cdsDesp.FieldByName('Valor').AsFloat;
      	dtSetLancTemp.FieldByName('VALOR_CTP_ORIG').AsFloat :=
        	FrmCadContasAPagar.cdsDesp.FieldByName('Valor').AsFloat;
        dtSetLancTemp.FieldByName('VL_CONTABIL').AsFloat :=
        	FrmCadContasAPagar.cdsDesp.FieldByName('Valor').AsFloat;
        dtSetLancTemp.FieldByName('VALOR_L').AsFloat :=
        	FrmCadContasAPagar.cdsDesp.FieldByName('Valor').AsFloat;
        dtSetLancTemp.Post;

        FrmCadContasAPagar.cdsDesp.Next;
      end;

      dataSet.Cancel;
      Result := true;

      apagarContas;
  		ApagarContasPagarTemp(FrmCadContasAPagar.cdsDesp);

      Exit;
    end
    else if ((acao = 'INSERIR') and (vDadosIni.vContrapartida)) then
    begin
       buscas2.Close;
       buscas2.SQL.Text := ' select trim(r.rdb$field_name) campo, trim(t.rdb$type_name) tipo from rdb$relation_fields r' +
       	 ' left join rdb$fields f on r.rdb$field_source = f.rdb$field_name ' +
         ' left join rdb$types t on t.rdb$type = f.rdb$field_type ' +
         ' where r.rdb$relation_name = ''LANCAMENTOS'' and t.rdb$field_name = ''RDB$FIELD_TYPE'' ';
       buscas2.Open;

       buscas.Close;
       buscas.SQL.Text := ' INSERT INTO LANCAMENTOS (';
       for I := 1 to vDadosIni.vQtdeCamposContrapartida do
       begin
         if buscas2.locate('campo',vDadosIni.getCampoPipe(vDadosIni.vCamposContrapartida, I),[lopartialkey]) then
           buscas.SQL.Text := buscas.SQL.Text + vDadosIni.getCampoPipe(vDadosIni.vCamposContrapartida, I) + ', ';
       end;
       buscas.SQL.Text := Copy(buscas.SQL.Text, 1, Length(buscas.SQL.Text) - 4) + vDadosIni.getCampoPipe(vDadosIni.vCamposContrapartida, I) + ') VALUES (';
       for I := 1 to vDadosIni.vQtdeCamposContrapartida do
       begin
         if buscas2.locate('campo',vDadosIni.getCampoPipe(vDadosIni.vCamposContrapartida, I),[lopartialkey]) then
           buscas.SQL.Text := buscas.SQL.Text + ':'+ vDadosIni.getCampoPipe(vDadosIni.vCamposContrapartida, I) + ', ';
       end;
       buscas.SQL.Text := Copy(buscas.SQL.Text, 1, Length(buscas.SQL.Text) - 4) + vDadosIni.getCampoPipe(vDadosIni.vCamposContrapartida, I) + ');';
       for I := 1 to vDadosIni.vQtdeCamposContrapartida do
       begin
         if buscas2.locate('campo',vDadosIni.getCampoPipe(vDadosIni.vCamposContrapartida, I),[lopartialkey]) then
         begin
           vCampo := vDadosIni.getCampoPipe(vDadosIni.vCamposContrapartida, I);
           vValor := vDadosIni.getCampoPipe(vDadosIni.vValoresContrapartida, I);
           if trim(vValor) <> '' then
             if buscas2.FieldByName('TIPO').AsString = 'DOUBLE' then
                buscas.ParamByName(vCampo).AsFloat := StrToFloat(vValor)
             else if buscas2.FieldByName('TIPO').AsString = 'TIMESTAMP' then
                buscas.ParamByName(vCampo).AsDateTime := StrToDateTime(vValor)
             else
	             buscas.ParamByName(vCampo).Value := vValor;
         end;
       end;
       vCodLanc := Gencodigo('LANCAMENTOS', dtmContasAPagar.SpIncCodigo, vDadosIni.codEmpresa);
       buscas.ParamByName('COD_LANC').AsInteger := vCodLanc;
       buscas.ParamByName('COD_CONTRAPARTIDA').AsInteger := vCodLanc;
       buscas.ExecSQL;

       if FrmCadContasAPagar.cdsDesp.IsEmpty then
       begin
         dataSet.Edit;
         dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger := vCodLanc;
         dataSet.Post;
         Apply;
       end
       else
       begin
         buscas2.Close;
         buscas2.SQL.Text := ' select trim(r.rdb$field_name) campo, trim(t.rdb$type_name) tipo from rdb$relation_fields r' +
           ' left join rdb$fields f on r.rdb$field_source = f.rdb$field_name ' +
           ' left join rdb$types t on t.rdb$type = f.rdb$field_type ' +
           ' where r.rdb$relation_name = ''CONTAS_A_PAGAR'' and t.rdb$field_name = ''RDB$FIELD_TYPE'' ';
         buscas2.Open;

         for J := 0 to (FContas.parcelas - 1) do
         begin
            buscas.Close;
            buscas.SQL.Text := ' INSERT INTO CONTAS_A_PAGAR (';
            for I := 0 to dataSet.FieldCount - 1 do
            begin
              if buscas2.locate('campo', dataSet.Fields[I].FieldName, []) then
              begin
                if I = dataSet.FieldCount - 1 then
                   buscas.SQL.Text := buscas.SQL.Text + dataSet.Fields[I].FieldName + ') VALUES ('
                else
                   buscas.SQL.Text := buscas.SQL.Text + dataSet.Fields[I].FieldName + ', ';
              end;
            end;
            for I := 0 to dataSet.FieldCount - 1 do
            begin
              if buscas2.locate('campo', dataSet.Fields[I].FieldName, []) then
              begin
                if I = dataSet.FieldCount - 1 then
                   buscas.SQL.Text := buscas.SQL.Text + ':'+ dataSet.Fields[I].FieldName + ');'
                else
                   buscas.SQL.Text := buscas.SQL.Text + ':'+ dataSet.Fields[I].FieldName + ', ';
              end;
            end;
            for I := 0 to dataSet.FieldCount - 1 do
              if buscas2.locate('campo', dataSet.Fields[I].FieldName, []) then
                buscas.ParamByName(dataSet.Fields[I].FieldName).Value := dataSet.FieldByName(dataSet.Fields[I].FieldName).Value;
            buscas.ParamByName('COD_CONTRP').AsInteger := Gencodigo('CONTAS_A_PAGAR', dtmContasAPagar.SpIncCodigo, vDadosIni.codEmpresa);
            buscas.ParamByName('N_DOC_CTP').AsString := copy(FContas.numeroDocumento[J], 1, 20);
            buscas.ParamByName('NPARCELA').AsInteger := J + 1;
            buscas.ParamByName('QTDE_PARC').AsInteger := FContas.parcelas;
            buscas.ParamByName('DATA_VENC_CTP').AsDate := StrToDate(FContas.vencimentoDocumento[J]);
            buscas.ParamByName('DTREFERENCIA').AsDate := StrToDate(FContas.vencimentoDocumento[J]);
            buscas.ParamByName('VALOR_CTP').AsCurrency := FContas.valorDocumento[J];
            buscas.ParamByName('VL_CONTABIL').AsCurrency := FContas.valorDocumento[J];
            buscas.ParamByName('COD_CONTRAPARTIDA').AsInteger := vCodLanc;
            buscas.ExecSQL;

            Result := true;
         end;
       end;
    end;

    if QtdeReplicacao > 0 then
      _replicarContasAPagar(false);

    if Result then
      Result := CommitaTransacao;
    if Result then
      vDadosIni.GravaAuditoria(processo, acao, 'SUCESSO', 'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+
      trim(dataSet.FieldByName('N_DOC_CTP').AsString)+' '+dataSet.FieldByName('NOME_FOR_CTP').AsString, buscas)
    else
      vDadosIni.GravaAuditoria(processo, acao, 'FALHA', 'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+
      '/'+trim(dataSet.FieldByName('N_DOC_CTP').AsString)+' '+dataSet.FieldByName('NOME_FOR_CTP').AsString, buscas);
    montaSelect(ultimasql);
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TContasAPagar.preencherDadosRateios;
var
	I: Integer;
begin
	vDadosIni.vDtSetTmp := TClientDataSet.Create(nil);
  vDadosIni.vDtSetTmp.Close;
  vDadosIni.vDtSetTmp.FieldDefs.Clear;
  for I := 0 to dataSet.Fields.Count - 1 do
	  vDadosIni.vDtSetTmp.FieldDefs.Add(dataSet.Fields.Fields[I].FieldName, dataSet.Fields.Fields[I].DataType, dataSet.Fields.Fields[I].Size, false);
	vDadosIni.vDtSetTmp.CreateDataSet;
  vDadosIni.vDtSetTmp.EmptyDataSet;

  vDadosIni.vDtSetTmp.Insert;
  for I := 0 to dataSet.Fields.Count - 1 do
  	vDadosIni.vDtSetTmp.FieldByName(dataSet.Fields.Fields[I].FieldName).Value := dataSet.Fields.Fields[I].Value;
  vDadosIni.vDtSetTmp.Post;

	vnumcontaRateio:=dataSet.FieldByName('N_CONTA_PLC').AsString;
	vcodfornRateio:=dataSet.FieldByName('COD_FORN_NFE').AsInteger;
  vnomefornRateio:=dataSet.FieldByName('NOME_FOR_CTP').AsString;
  vndocRateio:=dataSet.FieldByName('N_DOC_CTP').AsString;
  vhistRateio:=dataSet.FieldByName('HISTORICO_CTP').AsString;
  vaceiteRateio:=dataSet.FieldByName('ACEITE_CTP').asstring;
  vtipcontaRateio:=dataSet.FieldByName('TIPO_CTP').AsString;
  vnominalaRateio:=dataSet.FieldByName('NOMINAL_CTP').AsString;
  vtipolancRateio:=dataSet.FieldByName('TIP_CNT').asstring;
  vnchequeRateio:=dataSet.FieldByName('N_CHEQ_CTP').asstring;
  vchassiRateio:=dataSet.FieldByName('CHASSI_CONC').asstring;
  vcontroleRateio:=dataSet.FieldByName('CODIGO_CTRL').AsInteger;
  vnumnotaRateio:=dataSet.FieldByName('NUM_NOTA_NFE').asinteger;
  vdtrefRateio:=dataSet.FieldByName('DTREFERENCIA').AsDateTime;
  vdtvencRateio:=dataSet.FieldByName('DATA_VENC_CTP').AsDateTime;
  vvalorCtpRateio:=dataSet.FieldByName('VALOR_CTP').AsCurrency;
  vvlcontabilRateio:=dataSet.FieldByName('VL_CONTABIL').AsCurrency;
  vTmpEmpMultRateio:=dataSet.FieldByName('COD_EMP_MULT').AsInteger
end;

procedure TContasAPagar.retornaDadosDataSet;
var
  I: Integer;
begin
	if (dataSet.State in [dsInsert, dsEdit]) then
  	exit;

	dataSet.Insert;
  for I := 0 to vDadosIni.vDtSetTmp.Fields.Count - 1 do
  	dataSet.FieldByName(vDadosIni.vDtSetTmp.Fields[I].FieldName).Value := vDadosIni.vDtSetTmp.Fields[I].Value;
end;

function TContasAPagar.testarNumConta(pNumConta: Double; var pMensagem: string): boolean;
begin
  try
    if ((vNumConta = pNumConta) or (vpermitir)) then
    begin
    	Result := True;
      Exit;
    end;

    Result := false;

    buscas.Close;
    buscas.SQL.Text := ' select p.n_conta_plc, p.desc_plc, p.tipo_plc, c.desc_gr, ' +
      ' c.tipo_gr, s.desc_sub_ct, p.tipo_ctp, p.gerar_contrapartida, p.estornar_vale from p_contas p  ' +
    	' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
      ' left join sub_grup_ct s on p.cod_sub_ct = s.cod_sub_ct ' +
      ' where p.n_conta_plc = :n_conta_plc ';
    buscas.ParamByName('N_CONTA_PLC').AsFloat := pNumConta;
    buscas.Open;

    pMensagem := 'Conta "' + FloatToStr(pNumConta) +
    	' - ' + trim(buscas.FieldByName('desc_plc').AsString) + '" não esta configurada!' + #13 +
      'Motivo(s): ' + #13 +
      '* Natureza do grupo da conta não esta definida como "SAÍDA"' + #13 +
      '* Tipo da conta não é de origem "FORNECEDOR"/"OUTRAS SAÍDAS"!' + #13 +
      '* Conta não pode estar configurada como contrapartida' + #13 +
      '* Conta não pode estar configurada como estornar vale' + #13 +
    	'Favor verificar antes de continuar!';

    Result := True;
    
    if buscas.IsEmpty then
      Exit;

    if buscas.FieldByName('GERAR_CONTRAPARTIDA').AsString = 'S' then
    begin
      Result := false;
      Exit;
    end
    else if buscas.FieldByName('ESTORNAR_VALE').AsString = 'S' then
    begin
      Result := false;
      Exit;
    end;

    if buscas.FieldByName('TIPO_PLC').AsString = 'E' then //Conta de entrada
    	Exit
    else if buscas.FieldByName('TIPO_GR').AsString = 'S' then //Natureza da conta de saída
    	Exit
    else if buscas.FieldByName('TIPO_CTP').AsString = 'F' then // Conta do tipo fornecedor
    	Exit
    else if buscas.FieldByName('TIPO_CTP').AsString = 'O' then // Conta do tipo outras
    	Exit;

    Result := False;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TContasAPagar.testarNumConta2(pNatureza: string; pNumConta: Double;
  var pMensagem: string): boolean;
begin
 try
    if (vNumConta = pNumConta) then
    begin
    	Result := True;
      Exit;
    end;

    Result := false;

    buscas.Close;
    buscas.SQL.Text := ' select p.n_conta_plc, p.desc_plc, p.tipo_plc, c.desc_gr, ' +
    	' c.tipo_gr, s.desc_sub_ct, p.tipo_ctp, p.gerar_contrapartida, p.estornar_vale from p_contas p  ' +
    	' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
      ' left join sub_grup_ct s on p.cod_sub_ct = s.cod_sub_ct ' +
      ' where p.n_conta_plc = :n_conta_plc ';
    buscas.ParamByName('N_CONTA_PLC').AsFloat := pNumConta;
    buscas.Open;

    if pNatureza = 'S' then
      pMensagem := 'Conta "' + FloatToStr(pNumConta) +
        ' - ' + trim(buscas.FieldByName('desc_plc').AsString) + '" não esta configurada!' + #13 +
        'Motivo(s): ' + #13 +
        '* Natureza do grupo da conta não esta definida como "SAÍDA"' + #13 +
        '* Tipo da conta não é de origem "FORNECEDOR"/"OUTRAS SAÍDAS"' + #13 +
        '* Conta não pode estar configurada como contrapartida' + #13 +
        '* Conta não pode estar configurada como estornar vale' + #13 +
        'Favor verificar antes de continuar!'
    else
    	pMensagem := 'Conta "' + FloatToStr(pNumConta) +
        ' - ' + trim(buscas.FieldByName('desc_plc').AsString) + '" não esta configurada!' + #13 +
        'Motivo(s): ' + #13 +
        '* Tipo de entrada não é de origem "EMPRESTIMO"/"TRANSFERÊNCIA"/"OUTRAS RECEITAS"!' + #13 +
        '* Conta não pode estar configurada como contrapartida' + #13 +
        'Favor verificar antes de continuar!';

    Result := True;
    
    if buscas.IsEmpty then
      Exit;

    if buscas.FieldByName('GERAR_CONTRAPARTIDA').AsString = 'S' then
    begin
      Result := False;
      Exit;
    end
    else if buscas.FieldByName('ESTORNAR_VALE').AsString = 'S' then
    begin
      Result := false;
      Exit;
    end;

    if pNatureza = 'S' then
    begin
	    if buscas.FieldByName('TIPO_PLC').AsString = 'E' then //Conta de entrada
   	 	Exit;
    end
    else
    begin
      if buscas.FieldByName('TIPO_PLC').AsString = 'S' then //Conta de saída
   	 	Exit
    end;

    if pNatureza = 'S' then
    begin
      if buscas.FieldByName('TIPO_GR').AsString = 'S' then //Natureza da conta de saída
        Exit
      else if buscas.FieldByName('TIPO_CTP').AsString = 'F' then // Conta do tipo fornecedor
        Exit
    end
    else
    begin
      if buscas.FieldByName('TIPO_CTP').AsString = 'E' then // Conta do tipo emprestimo
        Exit
      else if buscas.FieldByName('TIPO_CTP').AsString = 'T' then // Conta do tipo transferencia
        Exit;
    end;

    if buscas.FieldByName('TIPO_CTP').AsString = 'O' then // Conta do tipo outras
    	Exit;

    Result := False;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TContasAPagar.testarNumConta3(pNatureza: string; pNumConta: Double;
  var pMensagem: string): boolean;
begin
 try
//    if (vNumConta = pNumConta) then
//    begin
//    	Result := True;
//      Exit;
//    end;

    Result := false;

    buscas.Close;
    buscas.SQL.Text := ' select p.n_conta_plc, p.desc_plc, p.tipo_plc, c.desc_gr, ' +
    	' c.tipo_gr, s.desc_sub_ct, p.tipo_ctp, p.gerar_contrapartida, p.estornar_vale from p_contas p  ' +
    	' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
      ' left join sub_grup_ct s on p.cod_sub_ct = s.cod_sub_ct ' +
      ' where p.n_conta_plc = :n_conta_plc ';
    buscas.ParamByName('N_CONTA_PLC').AsFloat := pNumConta;
    buscas.Open;

    if not buscas.IsEmpty then
      pMensagem := 'Conta "' + FloatToStr(pNumConta) +  ' - ' + trim(buscas.FieldByName('desc_plc').AsString) + '"' + #13 +
        'Motivo(s): ' + #13 +
        '* Conta não pode estar configurada como contrapartida' + #13 +
        '* Conta não pode estar configurada como estornar vale' + #13 +
        'Favor verificar antes de continuar!';
        
    if buscas.IsEmpty then
    begin
      Result := true;
      Exit;
    end;
    
    if buscas.FieldByName('GERAR_CONTRAPARTIDA').AsString = 'S' then
    begin
      Result := false;
      Exit;
    end;

    if buscas.FieldByName('ESTORNAR_VALE').AsString = 'S' then
    begin
      Result := false;
      Exit;
    end;

    Result := true;

//    if pNatureza = 'S' then
//      pMensagem := 'Conta "' + FloatToStr(pNumConta) +
//        ' - ' + trim(buscas.FieldByName('desc_plc').AsString) + '" não esta configurada!' + #13 +
//        'Motivo(s): ' + #13 +
//        '* Natureza do grupo da conta não esta definida como "SAÍDA"' + #13 +
//        '* Tipo da conta não é de origem "FORNECEDOR"/"OUTRAS SAÍDAS"' + #13 +
//        '* Conta não pode estar configurada como contrapartida' + #13 +
//        '* Conta não pode estar configurada como estornar vale' + #13 +
//        'Favor verificar antes de continuar!'
//    else
//    	pMensagem := 'Conta "' + FloatToStr(pNumConta) +
//        ' - ' + trim(buscas.FieldByName('desc_plc').AsString) + '" não esta configurada!' + #13 +
//        'Motivo(s): ' + #13 +
//        '* Tipo de entrada não é de origem "EMPRESTIMO"/"TRANSFERÊNCIA"/"OUTRAS RECEITAS"!' + #13 +
//        '* Conta não pode estar configurada como contrapartida' + #13 +
//        'Favor verificar antes de continuar!';

//    Result := True;

//    if buscas.IsEmpty then
//      Exit;
//
//    if buscas.FieldByName('GERAR_CONTRAPARTIDA').AsString = 'S' then
//    begin
//      Result := False;
//      Exit;
//    end
//    else if buscas.FieldByName('ESTORNAR_VALE').AsString = 'S' then
//    begin
//      Result := false;
//      Exit;
//    end;
//
//    if pNatureza = 'S' then
//    begin
//	    if buscas.FieldByName('TIPO_PLC').AsString = 'E' then //Conta de entrada
//   	 	Exit;
//    end
//    else
//    begin
//      if buscas.FieldByName('TIPO_PLC').AsString = 'S' then //Conta de saída
//   	 	Exit
//    end;
//
//    if pNatureza = 'S' then
//    begin
//      if buscas.FieldByName('TIPO_GR').AsString = 'S' then //Natureza da conta de saída
//        Exit
//      else if buscas.FieldByName('TIPO_CTP').AsString = 'F' then // Conta do tipo fornecedor
//        Exit
//    end
//    else
//    begin
//      if buscas.FieldByName('TIPO_CTP').AsString = 'E' then // Conta do tipo emprestimo
//        Exit
//      else if buscas.FieldByName('TIPO_CTP').AsString = 'T' then // Conta do tipo transferencia
//        Exit;
//    end;
//
//    if buscas.FieldByName('TIPO_CTP').AsString = 'O' then // Conta do tipo outras
//    	Exit;
//
//    Result := False;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TContasAPagar.verificarConta(pNatureza: string;
  pNumConta: Double): boolean;
var
 vtemp: string;
begin
 vtemp := vDadosIni.IfThen(pNatureza = 'S', 'Saída', 'Entrada');

 buscas.Close;
 buscas.SQL.Text := 'select * from P_Contas ' +
 		' where ativo = 1 and n_conta_plc = :n_conta_plc';
 buscas.ParamByName('n_conta_plc').AsFloat := pNumConta;
 buscas.Open;

 Result := not buscas.IsEmpty;

 if Result then
 begin
   if (buscas.FieldByName('tipo_plc').AsString <> pNatureza) then
   begin
    Application.MessageBox(PChar('Natureza da conta informada não é de ' + vtemp),
     'Informação', MB_OK + MB_ICONINFORMATION);
    Result := false;  
    exit;
   end;
 end
 else
 begin
   Application.MessageBox('Conta do Plano de Contas não encontrado.' + chr(13) +
   'Campo requerido.', 'Informação', MB_OK + MB_ICONINFORMATION);
   exit;
 end;
end;

procedure TContasAPagar._localizarCheques(pIndice: integer; pTexto: string);
begin
  if (pIndice = 0) and (ch.dataSet.IndexFieldNames <> 'VALOR_CH') then
    ch.dataSet.IndexFieldNames := 'VALOR_CH'
  else if (pIndice = 1) and (ch.dataSet.IndexFieldNames <> 'NOME_CH') then
    ch.dataSet.IndexFieldNames := 'NOME_CH';
  ch.FindNearest([pTexto]);
end;

procedure TContasAPagar._localizarCheques(pFiltrarPorData: boolean; pDataIni,
  pDataFim: string);
begin

  if pFiltrarPorData then
  begin
    if not vDadosIni.PesqPros('CTP017', 'FILTRAR', '', 'CONTROLE_CHEQUE', '', buscas, true) then
      Exit;
    try
      strtodate(pDataIni);
      strtodate(pDataFim);
    except
      exit;
    end;

    ch.dataSet.Filtered := false; //filtro por data funciona é dd/mm/yyyy mesmo
    ch.dataSet.Filter := 'data_venc>=' + QuotedStr(FormatDateTime('dd/mm/yyyy', StrToDate(pDataIni))) +
      ' and data_venc<=' + QuotedStr(FormatDateTime('dd/mm/yyyy', StrToDate(pDataFim)));
    ch.dataSet.Filtered := true;
  end
  else
  begin
    if not vDadosIni.PesqPros('CTP018', 'RETIRAR FILTRO', '', 'CONTROLE_CHEQUE', '', buscas, true) then
      Exit;
    ch.dataSet.Filtered := false;
  end;
end;

procedure TContasAPagar._localizarCreditos(pIndice: integer; pTexto: string);
begin
  if (pIndice = 0) and (cr.dataSet.IndexFieldNames <> 'VALOR_C') then
    cr.dataSet.IndexFieldNames := 'VALOR_C'
  else if (pIndice = 1) and (cr.dataSet.IndexFieldNames <> 'NOME_C') then
    cr.dataSet.IndexFieldNames := 'NOME_C';
  cr.FindNearest([pTexto]);
end;

procedure TContasAPagar._localizarCreditos(pFiltrarPorData: boolean; pDataIni,
  pDataFim: string);
begin

  if pFiltrarPorData then
  begin
    if not vDadosIni.PesqPros('CTP028', 'FILTRAR', '', 'CONTROLE_CHEQUE', '', buscas, true) then
      Exit;
    try
      strtodate(pDataIni);
      strtodate(pDataFim);
    except
      exit;
    end;

    cr.dataSet.Filtered := false; //filtro por data funciona é dd/mm/yyyy mesmo
    cr.dataSet.Filter := 'data_venc_c>=' + QuotedStr(FormatDateTime('dd/mm/yyyy', StrToDate(pDataIni))) +
      ' and data_venc_c<=' + QuotedStr(FormatDateTime('dd/mm/yyyy', StrToDate(pDataFim)));
    cr.dataSet.Filtered := true;
  end
  else
  begin
    if not vDadosIni.PesqPros('CTP029', 'RETIRAR FILTRO', '', 'CONTROLE_CHEQUE', '', buscas, true) then
      Exit;
    cr.dataSet.Filtered := false;
  end;
end;

function TContasAPagar._locFornecedor(pNContas: Double;
  pCodEmpMult: Integer): boolean;
var
	vDataSource: TDataSource;
begin
	result := false;

  try
    vDataSource := TDataSource.Create(nil);

    buscas.Close;
    buscas.SQL.Text := ' select cl.cod_cliente, cl.cod_empresa, cl.cpfcgc, cl.nome_cliente, cl.razao from p_contas_clientes pc ' +
      ' inner join clientes cl on cl.cpfcgc = pc.cpfcgc and cl.cod_empresa = ' + IntToStr(pCodEmpMult) +
      ' where pc.n_conta_plc = :n_conta_plc ' +
      ' and (cl.tipo = ''F'' or cl.tipo = ''A'') ' +
      ' and cl.ativo = 1 ' +
      ' order by cl.nome_cliente ';
    buscas.ParamByName('n_conta_plc').AsFloat := pNContas;
    buscas.Open;
    buscas.FetchAll;

    buscas.FieldByName('cod_cliente').DisplayLabel := 'Cod Cliente';
    buscas.FieldByName('nome_cliente').DisplayLabel := 'Nome Fantasia';
    buscas.FieldByName('razao').DisplayLabel := 'Razão Social';
    buscas.FieldByName('cpfcgc').DisplayLabel := 'CPF/CNPJ';
    buscas.FieldByName('cod_empresa').Visible := False;

    vDataSource.DataSet := buscas;

    FrmCadContasAPagar.DBGridFornecedoresConta.DataSource := vDataSource;

    if buscas.IsEmpty then
    	exit;

    if buscas.RecordCount > 1 then
    begin
      Result := vDadosIni.abreForm('Selecione o cliente / fornecedor - Plano de Contas', FrmCadContasAPagar.pnFornecedoresConta, [ofEscapeExit, ofAlignAllClientWinCtrl]);

      if not Result then
        exit;
    end
    else
    begin
      dataSet.FieldByName('COD_FORN_NFE').AsInteger := buscas.FieldByName('COD_CLIENTE').AsInteger;
      dataSet.FieldByName('NOME_FOR_CTP').AsString := buscas.FieldByName('RAZAO').AsString;
      dataSet.FieldByName('CPF_CGC_F').AsString := buscas.FieldByName('CPFCGC').AsString;
      result := true;
    end;
  finally
    if Assigned(vDataSource) then
      FreeAndNil(vDataSource);
  end;
end;

function TContasAPagar._locFornecedor(pCpcCnpj: string;
  pCodEmpMult: Integer): boolean;
begin
	result := false;

  buscas.Close;
  buscas.SQL.Text := ' select first 1 cod_cliente, cod_empresa, nome_cliente, razao, cpfcgc from clientes ' +
    ' where cpfcgc = ' + QuotedStr(trim(pCpcCnpj)) +
    ' and (tipo = ''F'' or tipo = ''A'') ' +
    ' and ativo = 1 ' +
    ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
   		InttoStr(pCodEmpMult) , vDadosIni.codEmpresa);
  buscas.Open;
  if buscas.IsEmpty then
  	Application.MessageBox(PChar('Fornecedor do plano de contas não encontrado'), 'Atenção', MB_ICONWARNING + MB_OK);

	if not buscas.IsEmpty then
  begin
  	dataSet.FieldByName('COD_FORN_NFE').AsInteger := buscas.FieldByName('COD_CLIENTE').AsInteger;
    dataSet.FieldByName('NOME_FOR_CTP').AsString := buscas.FieldByName('RAZAO').AsString;
    dataSet.FieldByName('CPF_CGC_F').AsString := buscas.FieldByName('CPFCGC').AsString;
    result := true;
  end;
end;

function TContasAPagar._locFornecedor(pCodFornec: integer; pCodEmpMult: Integer = 0): boolean;
var
	vDataSource: TDataSource;
  vNConta: boolean;
begin
  result := false;
  buscas.Close;
  buscas.SQL.Text := ' select cod_cliente, cod_empresa, nome_cliente, razao, cpfcgc from clientes ' +
    ' where cod_cliente = ' + IntToStr(pCodFornec) +
    ' and (tipo = ''F'' or tipo = ''A'') ' +
    ' and ativo = 1 ' +
    ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
   		InttoStr(pCodEmpMult) , vDadosIni.codEmpresa);
  buscas.Open;
  if buscas.IsEmpty then
  begin
    if Application.MessageBox(Pchar('Fornecedor não Encontrado.' + chr(13) + 'Deseja continuar?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION +
      MB_DEFBUTTON2) = mrNo then
      vNomeCampoErro := 'dbedit5'
    else if trim(dataSet.FieldByName('NOME_FOR_CTP').AsString) = '' then
    begin
      vNomeCampoErro := 'dbedit6';
      result := true;
    end;
  end
  else
  begin
  	dataSet.FieldByName('COD_FORN_NFE').AsInteger := pCodFornec;
    dataSet.FieldByName('NOME_FOR_CTP').AsString := buscas.FieldByName('RAZAO').AsString;
    dataSet.FieldByName('CPF_CGC_F').AsString := buscas.FieldByName('CPFCGC').AsString;

    buscas.Close;
    buscas.SQL.Text := ' select p_contas.n_conta_plc, ' +
    	' p_contas.desc_plc, ' +
      ' p_contas.desc_padr, ' +
      ' grupos_ct.desc_gr, ' +
      ' depart_ct.desc_dep, ' +
      ' p_contas.tipo_ctp from p_contas_clientes ' +
      ' inner join clientes on clientes.cpfcgc = p_contas_clientes.cpfcgc and clientes.cod_empresa = ' + IntToStr(pCodEmpMult) + ' and clientes.ativo = 1 ' +
      ' inner join p_contas on p_contas_clientes.n_conta_plc = p_contas.n_conta_plc ' +
      ' inner join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct ' +
      ' inner join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep ' +
      ' where p_contas_clientes.cpfcgc = :cpfcgc ' +
      ' order by p_contas.desc_plc ';
    buscas.ParamByName('cpfcgc').AsString := dataSet.FieldByName('CPF_CGC_F').AsString;
    buscas.Open;
    buscas.FetchAll;

    buscas.FieldByName('n_conta_plc').DisplayLabel := 'Nº Conta';
    buscas.FieldByName('desc_plc').DisplayLabel := 'Descrição de Contas';
    buscas.FieldByName('desc_padr').DisplayLabel := 'Descrição Padrão';
    buscas.FieldByName('desc_gr').DisplayLabel := 'Grupo conta';
    buscas.FieldByName('desc_dep').DisplayLabel := 'Departamento conta';
    buscas.FieldByName('tipo_ctp').DisplayLabel := 'Tipo conta';

    vNConta := false;
    if (dataSet.FieldByName('N_CONTA_PLC').AsInteger <= 0) then
    	vNConta := true;
//    else
//    	vNConta := Application.MessageBox('Deseja alterar número da conta?', 'Atenção', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) = IDYES;

    if vNConta then
    begin
      try
        vDataSource := TDataSource.Create(nil);

        vDataSource.DataSet := buscas;

        FrmCadContasAPagar.DBGridContas.DataSource := vDataSource;

        if buscas.IsEmpty then
          exit;

        if buscas.RecordCount > 1 then
        begin
          Result := vDadosIni.abreForm('Selecione a conta', FrmCadContasAPagar.pnConta, [ofEscapeExit, ofAlignAllClientWinCtrl]);

          if not Result then
            exit;
        end
        else
        begin
          dataSet.FieldByName('N_CONTA_PLC').AsFloat := buscas.FieldByName('N_CONTA_PLC').AsFloat;
          if buscas.FieldByName('TIPO_CTP').AsString = 'F' then
            dataSet.FieldByName('TIPO_CTP').AsString := 'F'
          else
            dataSet.FieldByName('TIPO_CTP').AsString := 'D';
        end;
      finally
        if Assigned(vDataSource) then
      		FreeAndNil(vDataSource);
      end;
    end;
    result := true;
  end;
end;

function TContasAPagar._abreDetalhesPagamentoContrapartida(
  pLote_lanc: Integer; pData_lanc: TDateTime): Boolean;
var
  vValorLancamentos, vValorCheques, vValorCTP, vValorCreditos: Currency;
  formulario: TfrmPadrao;
  buscasLanc, buscasCH, buscasCR, buscasCTP: TIBQuery;
begin
{$REGION 'selects'}

  buscasLanc := TIBQuery.Create(Application);
  buscasLanc.Database := buscas.Database;
  buscasLanc.Transaction := buscas.Transaction;

  buscasCH := TIBQuery.Create(Application);
  buscasCH.Database := buscas.Database;
  buscasCH.Transaction := buscas.Transaction;

  buscasCR := TIBQuery.Create(Application);
  buscasCR.Database := buscas.Database;
  buscasCR.Transaction := buscas.Transaction;

  buscasCTP := TIBQuery.Create(Application);
  buscasCTP.Database := buscas.Database;
  buscasCTP.Transaction := buscas.Transaction;
   
  buscasLanc.Close;
  buscasLanc.SQL.Text :=
    ' select c.nome_ctrl "Controle",' +
    ' l.ndoc_l "Nº Doc.", '+
    ' l.valor_l "Valor",' +
    ' l.data "Data Lançamento",' +
    ' l.DTREFERENCIA "Data Referência",' +
    ' l.historico_l "Histórico",' +
    ' l.vl_contabil "Valor Contábil",' +
    ' l.n_conta_plc "Nº Conta"' +
    ' from lancamentos l' +
    ' inner join controles c on c.codigo_ctrl = l.codigo_ctrl and c.codigo_emp = l.codigo_emp and docs = ''N'' '+
    ' where l.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and l.cod_contrapartida_ctp = ' + IntToStr(pLote_lanc);
  buscasLanc.Open;

  buscasCH.Close;
  buscasCH.SQL.Text :=
    'select c.nome_ctrl "Controle",' +
    ' cc.valor_ch "Valor",' +
    ' cc.nome_ch "Cliente",' +
    ' cc.status_ch "Status",' +
    ' cc.data_venc "Vencimento",' +
    ' cc.historico_ch "Histórico",' +
    ' cc.n_ch "Nº Cheque",' +
    ' cc.data_rec "Data Cadastro",' +
    ' cc.n_conta_plc "Nº Conta"' +
    ' from controle_cheque cc' +
    ' inner join controles c on c.codigo_ctrl = cc.codigo_ctrl and c.codigo_emp = cc.codigo_emp' +
    ' where cc.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and cc.cod_contrapartida_ctp = ' + IntToStr(pLote_lanc);
  buscasCH.Open;

  buscasCR.Close;
  buscasCR.SQL.Text :=
    ' select c.NOME_CTRL "Controle", ' +
    ' cx.valor_c "Valor", ' +
    ' cx.nome_c "Cliente", ' +
    ' cx.status_c "Status", ' +
    '	cx.data_venc_c "Vencimento", ' +
    ' cx.historico_c "Histórico", ' +
    ' cx.n_doc_c "Nº Documento", ' +
    ' cx.data_rec_c "Data Cadastro", ' +
    ' cx.tipo_doc_c "Tipo documento", ' +
    ' cx.n_conta_plc "Nº Conta" ' +
    ' from controle_creditos cx ' +
    ' inner join controles c on c.codigo_ctrl = cx.codigo_ctrl and c.codigo_emp = cx.codigo_emp ' +
    ' where cx.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and cx.cod_contrapartida_ctp = ' + IntToStr(pLote_lanc) +
    ' union ' +
    ' select c.nome_ctrl "Controle",' +
    ' bc.valor_quitado "Valor",' +
    ' bc.nome_c "Cliente",' +
    ' ''QUITADO'' "Status",' +
    ' bc.data_venc_c "Vencimento",' +
    ' bc.historico_c "Histórico",' +
    ' bc.n_doc_c "Nº Documento",' +
    ' bc.data_rec_c "Data Cadastro",' +
    ' bc.TIPO_DOC_C "Tipo documento", ' +
    ' 0 "Nº Conta"' +
    ' from baixa_creditos bc ' +
    ' inner join controles c on c.codigo_ctrl = bc.codigo_ctrl and c.codigo_emp = bc.codigo_emp' +
    ' where bc.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and bc.cod_contrapartida_ctp = ' + IntToStr(pLote_lanc) +
    ' and bc.tip_baixa =''P'' ';
  buscasCR.Open;

  buscasCTP.Close;
  buscasCTP.SQL.Text :=
    'select c.NOME_CTRL "Controle",' +
    ' ctp.COD_CONTRP "Código Conta",' +
    ' ctp.VALOR_CTP "Valor",' +
    ' ctp.VALOR_PAGO "Valor Pago",' +
    ' ctp.status_ctp "Status",' +
    ' ctp.HISTORICO_CTP "Histórico",' +
    ' ctp.N_DOC_CTP "Nº Documento",' +
    ' ctp.DTREFERENCIA "Referência",' +
    ' ctp.DATA_VENC_CTP "Vencimento",' +
    ' ctp.DATQ_CTP "Data Quitação",' +
    ' ctp.US_BX "Usuario que Quitou",' +
    ' ctp.TIPO_CTP "Tipo de conta",' +
    ' ctp.N_CONTA_PLC "Nº Conta",' +
    ' ctp.NOME_FOR_CTP "Fornecedor",' +
    ' ctp.NOMINAL_CTP "Cliente do Cheque" ' +
    ' from contas_a_Pagar ctp' +
    ' inner join controles c on ctp.codigo_ctrl = c.codigo_ctrl and ctp.codigo_emp = c.codigo_emp' +
    ' where ctp.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and ctp.lote = ' + IntToStr(pLote_lanc);
  buscasCTP.Open;

  TFloatField(buscasLanc.FieldByName('Valor')).DisplayFormat := '##0.00';
  TFloatField(buscasCH.FieldByName('Valor')).DisplayFormat := '##0.00';
  TFloatField(buscasCR.FieldByName('Valor')).DisplayFormat := '##0.00';
  TFloatField(buscasCTP.FieldByName('Valor')).DisplayFormat := '##0.00';
  TFloatField(buscasCTP.FieldByName('Valor Pago')).DisplayFormat := '##0.00';

{$ENDREGION}

{$REGION 'somas'}

  vValorLancamentos := 0;
  buscasLanc.First;
  while not buscasLanc.Eof do
  begin
    vValorLancamentos := vValorLancamentos + buscasLanc.FieldByName('Valor').AsFloat;
    buscasLanc.Next;
  end;

  vValorCheques := 0;
  buscasCH.First;
  while not buscasCH.Eof do
  begin
    vValorCheques := vValorCheques + buscasCH.FieldByName('Valor').AsFloat;
    buscasCH.Next;
  end;

  vValorCreditos := 0;
  buscasCR.First;
  while not buscasCR.Eof do
  begin
    vValorCreditos := vValorCreditos + buscasCR.FieldByName('Valor').AsFloat;
    buscasCR.Next;
  end;

  vValorCTP := 0;
  buscasCTP.First;
  while not buscasCTP.Eof do
  begin
    vValorCTP := vValorCTP + buscasCTP.FieldByName('Valor').AsFloat;
    buscasCTP.Next;
  end;

{$ENDREGION}

{$REGION 'criando e apresentado formulario'}

  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 800;
    formulario.Height := 600;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Detalhes da contrapartida';
    FrmCadContasAPagar.pnLancContrapartida.Caption := 'Total: ' + Format('%n', [vValorLancamentos]);
    FrmCadContasAPagar.pnChContrapartida.Caption := 'Total: ' + Format('%n', [vValorCheques]);
    FrmCadContasAPagar.pnCrContrapartida.Caption := 'Total: ' + Format('%n', [vValorCreditos]);
    FrmCadContasAPagar.pnCTPContrapartida.Caption := 'Total: ' + Format('%n', [vValorCTP]);
    if dsLancTempCC = nil then
      dsLancTempCC := TDataSource.Create(nil);
    dsLancTempCC.DataSet := buscasLanc;
    if dsCHTempCC = nil then
      dsCHTempCC := TDataSource.Create(nil);
    dsCHTempCC.DataSet := buscasCH;
    if dsCrTempCC = nil then
    	dsCrTempCC := TDataSource.Create(nil);
    dsCrTempCC.DataSet := buscasCR;  
    if dsCTPTempCC = nil then
      dsCTPTempCC := TDataSource.Create(nil);
    dsCTPTempCC.DataSet := buscasCTP;
    FrmCadContasAPagar.gridLancamentoContrapartida.DataSource := dsLancTempCC;
    FrmCadContasAPagar.gridChequesContrapartida.DataSource := dsCHTempCC;
    FrmCadContasAPagar.gridCreditosContrapartida.DataSource := dsCrTempCC;
    FrmCadContasAPagar.gridCTPContrapartida.DataSource := dsCTPTempCC;

    FrmCadContasAPagar.pnDetalhesPagamentoContrapartida.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.KeyPreview := True;
    formulario.ShowHint := true;
    NumLoteLanc := pLote_lanc;
    DataLoteLanc := pData_lanc;
    result := (formulario.ShowModal = IDOK);

  finally
    dsLancTempCC.Free;
    dsLancTempCC := nil;
    dsCHTempCC.Free;
    dsCHTempCC := nil;
    dsCrTempCC.Free;
    dsCrTempCC := nil;
    dsCTPTempCC.Free;
    dsCTPTempCC := nil;
    buscasLanc.Close;
    buscasCH.Close;
    buscasCR.Close;
    buscasCTP.Close;

    FrmCadContasAPagar.pnDetalhesPagamentoContrapartida.Parent := FrmCadContasAPagar.tsDetalhesContrapartida;
    formulario.Free;
    formulario := nil;
  end;

{$ENDREGION}
end;

function TContasAPagar._abreDetalhesPagamentoModalidade(
  pLote_lanc: Integer; pData_Lanc: TDateTime): Boolean;
var
  vValorLancamentos, vValorCheques, vValorCreditos, vValorLancCTP, vValorCTP: Currency;
  vContrapartida: boolean;
  formulario: TfrmPadrao;
begin
  if not vDadosIni.PesqPros('CTP012', 'EXIBIR DETALHES', '', 'LOTE_LANC', loteLanc.dataSet.FieldByName('N_LOTE').AsString, buscas, true) then
    EXIT;
{$REGION 'selects'}

  lanc.buscas.Close;
  lanc.buscas.SQL.Text := ' select count(*) valor from contas_a_Pagar ctp ' +
    ' left join empresa emp on ctp.codigo_emp = emp.cod_empresa ' +
  	' where ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	' (case when (emp.financeiro_unificado = ''S'') then ' +
      '				  emp.codigo_unificadora ' +
      '				else ' +
      '					ctp.codigo_emp end) ',
    	'	ctp.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pData_Lanc > 0),
    	' and ctp.data_ent_ctp = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', pData_Lanc)), '') +
    ' and ctp.cod_contrapartida_ctp = ' + IntToStr(pLote_lanc);
  lanc.buscas.Open;

  vContrapartida := lanc.buscas.FieldByName('valor').AsInteger > 0;

  lanc.buscas.Close;
  lanc.buscas.SQL.Text := ' select c.nome_ctrl "Controle",' +
    ' l.ndoc_l "Nº Doc.", '+
    ' l.valor_l "Valor",' +
    ' l.data "Data Lançamento",' +
    ' l.DTREFERENCIA "Data Referência",' +
    ' l.historico_l "Histórico",' +
    ' l.vl_contabil "Valor Contábil",' +
    ' l.n_conta_plc "Nº Conta"' +
    ' from lancamentos l ' +
    ' left join empresa emp on l.codigo_emp = emp.cod_empresa ' +
    ' inner join controles c on c.codigo_ctrl = l.codigo_ctrl and c.codigo_emp = l.codigo_emp and docs = ''N'' '+
    ' where ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	' (case when (emp.financeiro_unificado = ''S'') then ' +
      '				  emp.codigo_unificadora ' +
      '				else ' +
      '					l.codigo_emp end) ',
    	'	l.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pData_Lanc > 0),
    	' and l.data = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', pData_Lanc)), '') +
    ' and l.lote = ' + IntToStr(pLote_lanc);
  lanc.buscas.Open;

  ch.buscas.Close;
  ch.buscas.SQL.Text := ' select c.nome_ctrl "Controle",' +
    ' cc.valor_ch "Valor",' +
    ' cc.nome_ch "Cliente",' +
    ' cc.status_ch "Status",' +
    ' cc.data_venc "Vencimento",' +
    ' cc.historico_ch "Histórico",' +
    ' cc.n_ch "Nº Cheque",' +
    ' cc.data_rec "Data Cadastro",' +
    ' cc.n_conta_plc "Nº Conta"' +
    ' from controle_cheque cc' +
    ' left join empresa emp on ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, ' cc.cod_emp_lote ', ' cc.codigo_emp ') + ' = emp.cod_empresa ' +
    ' inner join controles c on c.codigo_ctrl = cc.codigo_ctrl and c.codigo_emp = cc.codigo_emp' +
    ' where ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	' (case when (emp.financeiro_unificado = ''S'') then ' +
      '				  emp.codigo_unificadora ' +
      '				else ' +
      '					cc.cod_emp_lote end) ',
    	'	cc.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pData_Lanc > 0),
    	' and cc.datq_ch = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', pData_Lanc)), '') +
    ' and cc.lote = ' + IntToStr(pLote_lanc);
  ch.buscas.Open;

  cr.buscas.Close;
  cr.buscas.SQL.Text := ' select c.NOME_CTRL "Controle", ' +
    ' cx.valor_c "Valor", ' +
    ' cx.nome_c "Cliente", ' +
    ' cx.status_c "Status", ' +
    '	cx.data_venc_c "Vencimento", ' +
    ' cx.historico_c "Histórico", ' +
    ' cx.n_doc_c "Nº Documento", ' +
    ' cx.data_rec_c "Data Cadastro", ' +
    ' cx.tipo_doc_c "Tipo documento", ' +
    ' cx.n_conta_plc "Nº Conta" ' +
    ' from controle_creditos cx ' +
    ' left join empresa emp on ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, ' cx.cod_emp_lote ', ' cx.codigo_emp ') + ' = emp.cod_empresa ' +
    ' inner join controles c on c.codigo_ctrl = cx.codigo_ctrl and c.codigo_emp = cx.codigo_emp ' +
    ' where ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	' (case when (emp.financeiro_unificado = ''S'') then ' +
      '				  emp.codigo_unificadora ' +
      '				else ' +
      '					cx.cod_emp_lote end) ',
    	'	cx.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pData_Lanc > 0),
    	' and cx.datq_c = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', pData_Lanc)), '') +
    ' and cx.lote = ' + IntToStr(pLote_lanc) +
    ' union ' +
    ' select c.nome_ctrl "Controle",' +
    ' bc.valor_quitado "Valor",' +
    ' bc.nome_c "Cliente",' +
    ' ''QUITADO'' "Status",' +
    ' bc.data_venc_c "Vencimento",' +
    ' bc.historico_c "Histórico",' +
    ' bc.n_doc_c "Nº Documento",' +
    ' bc.data_rec_c "Data Cadastro",' +
    ' bc.TIPO_DOC_C "Tipo documento", ' +
    ' 0 "Nº Conta"' +
    ' from baixa_creditos bc ' +
    ' left join empresa emp on ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, ' bc.cod_emp_lote ', ' bc.codigo_emp ') + ' = emp.cod_empresa ' +
    ' inner join controles c on c.codigo_ctrl = bc.codigo_ctrl and c.codigo_emp = bc.codigo_emp' +
    ' where ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	' (case when (emp.financeiro_unificado = ''S'') then ' +
      '				  emp.codigo_unificadora ' +
      '				else ' +
      '					bc.cod_emp_lote end) ',
    	'	bc.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pData_Lanc > 0),
    	' and bc.datq_c = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', pData_Lanc)), '') +
    ' and bc.lote = ' + IntToStr(pLote_lanc) +
    ' and bc.tip_baixa =''P'' ';
  cr.buscas.Open;

  // Renegociadas e quitacao parcial
  cp.buscas.Close;
  cp.buscas.SQL.Text := ' select c.NOME_CTRL "Controle",' +
    ' ctp.COD_CONTRP "Código Conta",' +
    ' case when (coalesce(ctp.VALOR_CTP_ORIG, 0) > 0) then ' +
    '				 coalesce(ctp.VALOR_CTP_ORIG, 0) ' +
    '      else ' +
    '			   coalesce(ctp.VALOR_CTP, 0) ' +
    ' end "Valor",' +
    ' ctp.VALOR_PAGO "Valor Pago",' +
    ' ctp.status_ctp "Status",' +
    ' ctp.HISTORICO_CTP "Histórico",' +
    ' ctp.N_DOC_CTP "Nº Documento",' +
    ' ctp.DTREFERENCIA "Referência",' +
    ' ctp.DATA_VENC_CTP "Vencimento",' +
    ' ctp.DATQ_CTP "Data Quitação",' +
    ' ctp.US_BX "Usuario que Quitou",' +
    ' ctp.TIPO_CTP "Tipo de conta",' +
    ' ctp.N_CONTA_PLC "Nº Conta",' +
    ' ctp.NOME_FOR_CTP "Fornecedor",' +
    ' ctp.NOMINAL_CTP "Cliente do Cheque" ' +
    ' from contas_a_Pagar ctp ' +
    ' left join empresa emp on ctp.codigo_emp = emp.cod_empresa ' +
    ' inner join controles c on ctp.codigo_ctrl = c.codigo_ctrl and ctp.codigo_emp = c.codigo_emp' +
    ' where ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
      ' (case when (emp.financeiro_unificado = ''S'') then ' +
      '				  emp.codigo_unificadora ' +
      '				else ' +
      '					ctp.codigo_emp end) ',
    	'	ctp.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pData_Lanc > 0),
      ' and ctp.data_ent_ctp = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', pData_Lanc)), '') +
    ' and ctp.lote_ent = ' + IntToStr(pLote_lanc) +
    ' union all ' +
    ' select c.NOME_CTRL "Controle",' +
    ' ctp.COD_CONTRP "Código Conta",' +
    ' case when (coalesce(ctp.VALOR_CTP_ORIG, 0) > 0) then ' +
    '				 coalesce(ctp.VALOR_CTP_ORIG, 0) ' +
    '      else ' +
    '			   coalesce(ctp.VALOR_CTP, 0) ' +
    ' end "Valor",' +
    ' ctp.VALOR_PAGO "Valor Pago",' +
    ' ctp.status_ctp "Status",' +
    ' ctp.HISTORICO_CTP "Histórico",' +
    ' ctp.N_DOC_CTP "Nº Documento",' +
    ' ctp.DTREFERENCIA "Referência",' +
    ' ctp.DATA_VENC_CTP "Vencimento",' +
    ' ctp.DATQ_CTP "Data Quitação",' +
    ' ctp.US_BX "Usuario que Quitou",' +
    ' ctp.TIPO_CTP "Tipo de conta",' +
    ' ctp.N_CONTA_PLC "Nº Conta",' +
    ' ctp.NOME_FOR_CTP "Fornecedor",' +
    ' ctp.NOMINAL_CTP "Cliente do Cheque" ' +
    ' from contas_a_Pagar ctp ' +
    ' left join empresa emp on ctp.codigo_emp = emp.cod_empresa ' +
    ' inner join controles c on ctp.codigo_ctrl = c.codigo_ctrl and ctp.codigo_emp = c.codigo_emp' +
    ' where ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
      ' (case when (emp.financeiro_unificado = ''S'') then ' +
      '				  emp.codigo_unificadora ' +
      '				else ' +
      '					ctp.codigo_emp end) ',
    	'	ctp.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pData_Lanc > 0),
      ' and ctp.data_ent_ctp = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', pData_Lanc)), '') +
    ' and ctp.lote_quit_parc = ' + IntToStr(pLote_lanc);
  cp.buscas.Open;

  ctp.buscasCTP.Close;
  ctp.buscasCTP.SQL.Text := ' select c.NOME_CTRL "Controle",' +
    ' ctp.COD_CONTRP "Código Conta",' +
    ' ctp.VALOR_CTP "Valor",' +
    ' ctp.VALOR_PAGO "Valor Pago",' +
    ' ctp.status_ctp "Status",' +
    ' ctp.HISTORICO_CTP "Histórico",' +
    ' ctp.N_DOC_CTP "Nº Documento",' +
    ' ctp.DTREFERENCIA "Referência",' +
    ' ctp.DATA_VENC_CTP "Vencimento",' +
    ' ctp.DATQ_CTP "Data Quitação",' +
    ' ctp.US_BX "Usuario que Quitou",' +
    ' ctp.TIPO_CTP "Tipo de conta",' +
    ' ctp.N_CONTA_PLC "Nº Conta",' +
    ' ctp.NOME_FOR_CTP "Fornecedor",' +
    ' ctp.NOMINAL_CTP "Cliente do Cheque" ' +
    ' from contas_a_Pagar ctp' +
    ' left join empresa emp on ctp.codigo_emp = emp.cod_empresa ' +
    ' inner join controles c on ctp.codigo_ctrl = c.codigo_ctrl and ctp.codigo_emp = c.codigo_emp' +
    ' where ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	' (case when (emp.financeiro_unificado = ''S'') then ' +
      ' 			  emp.codigo_unificadora ' +
      '			  else ' +
      '				  ctp.codigo_emp end) ',
      ' ctp.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pData_Lanc > 0),
      ' and ctp.datq_ctp = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', pData_Lanc)), '') +
    ' and ctp.lote = ' + IntToStr(pLote_lanc);
  ctp.buscasCTP.Open;

  TFloatField(lanc.buscas.FieldByName('Valor')).DisplayFormat := '##0.00';
  TFloatField(ch.buscas.FieldByName('Valor')).DisplayFormat := '##0.00';
  TFloatField(cr.buscas.FieldByName('Valor')).DisplayFormat := '##0.00';
  TFloatField(cp.buscas.FieldByName('Valor')).DisplayFormat := '##0.00';
  TFloatField(cp.buscas.FieldByName('Valor Pago')).DisplayFormat := '##0.00';
  TFloatField(ctp.buscasCTP.FieldByName('Valor')).DisplayFormat := '##0.00';
  TFloatField(ctp.buscasCTP.FieldByName('Valor Pago')).DisplayFormat := '##0.00';

{$ENDREGION}

{$REGION 'somas'}

  vValorLancamentos := 0;
  lanc.buscas.First;
  while not lanc.buscas.Eof do
  begin
    vValorLancamentos := vValorLancamentos + lanc.buscas.FieldByName('Valor').AsFloat;
    lanc.buscas.Next;
  end;

  vValorCheques := 0;
  ch.buscas.First;
  while not ch.buscas.Eof do
  begin
    vValorCheques := vValorCheques + ch.buscas.FieldByName('Valor').AsFloat;
    ch.buscas.Next;
  end;

  vValorCreditos := 0;
  cr.buscas.First;
  while not cr.buscas.Eof do
  begin
    vValorCreditos := vValorCreditos + cr.buscas.FieldByName('Valor').AsFloat;
    cr.buscas.Next;
  end;

  vValorLancCTP := 0;
  cp.buscas.First;
  while not cp.buscas.Eof do
  begin
    vValorLancCTP := vValorLancCTP + cp.buscas.FieldByName('Valor').AsFloat;
    cp.buscas.Next;
  end;

  vValorCTP := 0;
  CTP.buscasCTP.First;
  while not CTP.buscasCTP.Eof do
  begin
    vValorCTP := vValorCTP + CTP.buscasCTP.FieldByName('Valor').AsFloat;
    CTP.buscasCTP.Next;
  end;

{$ENDREGION}

{$REGION 'criando e apresentado formulario'}

  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 800;
    formulario.Height := 600;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Detalhes das despesas pagas (Lote nº ' + IntToStr(pLote_lanc) + ')';
    FrmCadContasAPagar.pnLanc.Caption    := 'Total: ' + Format('%n', [vValorLancamentos]);
    FrmCadContasAPagar.pnCh.Caption      := 'Total: ' + Format('%n', [vValorCheques]);
    FrmCadContasAPagar.pnCr.Caption      := 'Total: ' + Format('%n', [vValorCreditos]);
    FrmCadContasAPagar.pnLancCTP.Caption := 'Total: ' + Format('%n', [vValorLancCTP]);
    FrmCadContasAPagar.pnCTP.Caption     := 'Total: ' + Format('%n', [vValorCTP]);

    if dsLancTemp = nil then
      dsLancTemp := TDataSource.Create(nil);
    dsLancTemp.DataSet := lanc.buscas;

    if dsCHTemp = nil then
      dsCHTemp := TDataSource.Create(nil);
    dsCHTemp.DataSet := ch.buscas;

    if dsCrTemp = nil then
    	dsCrTemp := TDataSource.Create(nil);
    dsCrTemp.DataSet := cr.buscas;

    if dsCTPTemp = nil then
      dsCTPTemp := TDataSource.Create(nil);
    dsCTPTemp.DataSet := CTP.buscasCTP;

    if dsLancCTPTemp = nil then
      dsLancCTPTemp := TDataSource.Create(nil);
    dsLancCTPTemp.DataSet := cp.buscas;

    FrmCadContasAPagar.gridLancamento.DataSource := dsLancTemp;

    FrmCadContasAPagar.gridCheques.DataSource := dsCHTemp;

    FrmCadContasAPagar.gridCreditos.DataSource := dsCrTemp;

    FrmCadContasAPagar.gridCTP.DataSource := dsCTPTemp;

    FrmCadContasAPagar.gridLancCTP.DataSource := dsLancCTPTemp;

    FrmCadContasAPagar.BitBtn35.Enabled := vContrapartida;

    FrmCadContasAPagar.pnDetalhesPagamento.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.KeyPreview := True;
    formulario.ShowHint := true;
    NumLoteLanc := pLote_lanc;
    DataLoteLanc := pData_lanc;
    result := (formulario.ShowModal = IDOK);

  finally
    dsLancTemp.Free;
    dsLancTemp := nil;
    dsCHTemp.Free;
    dsCHTemp := nil;
    dsCrTemp.Free;
    dsCrTemp := nil;
    dsCTPTemp.Free;
    dsCTPTemp := nil;
    lanc.buscas.Close;
    ch.buscas.Close;
    cr.buscas.Close;
    cp.buscas.Close;
    ctp.buscasCTP.Close;

    FrmCadContasAPagar.pnDetalhesPagamento.Parent := FrmCadContasAPagar.tsDetalhesPagamento;
    formulario.Free;
    formulario := nil;
  end;

{$ENDREGION}
end;

function TContasAPagar._abreFormAceitarContaCTP: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Aceitar as Contas a Pagar Selecionadas na Grade';

    FrmCadContasAPagar.edNomeBanco.text := '';
    FrmCadContasAPagar.pnAceitarContaCTP.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    result := (formulario.ShowModal = IDOK);

  finally
    vNomeBanco := FrmCadContasAPagar.edNomeBanco.text;
    FrmCadContasAPagar.pnAceitarContaCTP.Parent := FrmCadContasAPagar.tsAceitarContaCTP;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAPagar._abreFormAtualizarValorPagoCTP: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Atualizar Valor de Contas a Pagar';

    FrmCadContasAPagar.pnAtualizarValorPago.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    //     vDadosIni.definirDiaFinanceiroFechado(buscas);
    result := (formulario.ShowModal = IDOK);

  finally
    FrmCadContasAPagar.pnAtualizarValorPago.Parent := FrmCadContasAPagar.tsAtualizarValorPago;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAPagar._abreFormDadosParaBaixa: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Informe os dados para quitação';

    FrmCadContasAPagar.edValorBaixaParcial.AsValue := 0;
    FrmCadContasAPagar.MaskEdit4.Text  := DateToStr(vDadosIni.diaFFinanceiro + 1);

    if not baixaParcial then
    	FrmCadContasAPagar.pnDadosQuitacao.Height := 180 - FrmCadContasAPagar.Panel49.Height
    else
	    FrmCadContasAPagar.pnDadosQuitacao.Height := 180;

    FrmCadContasAPagar.Panel49.Visible := baixaParcial;

    if baixaParcial then
    begin
      FrmCadContasAPagar.Panel49.TabOrder := 0;
      FrmCadContasAPagar.Panel56.TabOrder := 1;
      FrmCadContasAPagar.Panel51.TabOrder := 2;
    end
    else
    begin
    	FrmCadContasAPagar.Panel56.TabOrder := 0;
      FrmCadContasAPagar.Panel51.TabOrder := 1;
    end;

    FrmCadContasAPagar.pnDadosQuitacao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    result := (formulario.ShowModal = IDOK);

  finally
    if result then
    begin
      rCTP.vDataBaixa     := StrToDate(FrmCadContasAPagar.MaskEdit4.Text);
      rCTP.vLancDiferenca := FrmCadContasAPagar.CheckBox7.Checked;
      if baixaParcial then
      begin
	      rCTP.vValorOperacao  := FrmCadContasAPagar.edValorBaixaParcial.AsValue;
        rCTP.vValorPrevisto  := FrmCadContasAPagar.edValorBaixaParcial.AsValue;
        rCTP.vValorAInformar := FrmCadContasAPagar.edValorBaixaParcial.AsValue;
      end;
    end
    else
    begin
      rCTP.vDataBaixa     := vDadosIni.diaFFinanceiro + 1;
      rCTP.vLancDiferenca := true;
      rCTP.vValorOperacao := 0;
    end;
    FrmCadContasAPagar.pnDadosQuitacao.Parent := FrmCadContasAPagar.tsDadosQuitacao;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAPagar._abreFormDetalhesLoteCTP: Boolean;
var
  formulario: TfrmPadrao;
begin
  if not vDadosIni.PesqPros('CTP006', 'EXIBIR', '', 'CONTAS_A_PAGAR', '', buscas, true) then
    EXIT;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 800;
    formulario.Height := 600;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Detalhamento recebimento da conta';
    detalhesConta._abreDetalhesConta(
    	vDadosIni.IfThen(dataSet.FieldByName('COD_CONTRP_ORIG').AsInteger > 0,
	    	dataSet.FieldByName('COD_CONTRP_ORIG').AsInteger, dataSet.FieldByName('COD_CONTRP').AsInteger),
      dataSet.FieldByName('CODIGO_EMP').AsInteger);
    FrmCadContasAPagar.pnDetalhes.Parent := formulario;
    FrmCadContasAPagar.Label64.Visible  := Trim(dataSet.FieldByName('STATUS_CTP').AsString) = '';
    FrmCadContasAPagar.BitBtn36.Enabled :=
    	(dataSet.FieldByName('LOTE').AsInteger > 0) or (dataSet.FieldByName('COD_CONTRP_ORIG').AsInteger > 0);
    FrmCadContasAPagar.BitBtn37.Enabled :=
    	(dataSet.FieldByName('LOTE').AsInteger > 0) or (dataSet.FieldByName('COD_CONTRP_ORIG').AsInteger > 0);
    FrmCadContasAPagar.BitBtn39.Enabled :=
    	(dataSet.FieldByName('LOTE').AsInteger > 0) or (dataSet.FieldByName('COD_CONTRP_ORIG').AsInteger > 0);
    FrmCadContasAPagar.Label67.Caption := FormatFloat('0.00', detalhesConta._somarTotalConta(
    	vDadosIni.IfThen(dataSet.FieldByName('COD_CONTRP_ORIG').AsInteger > 0,
	    	dataSet.FieldByName('COD_CONTRP_ORIG').AsInteger, dataSet.FieldByName('COD_CONTRP').AsInteger),
      dataSet.FieldByName('CODIGO_EMP').AsInteger));
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    result := (formulario.ShowModal = IDOK);
  finally
    FrmCadContasAPagar.pnDetalhes.Parent := FrmCadContasAPagar.tsDetalhes;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAPagar._abreFormImpressaoLoteCTP: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 800;
    formulario.Height := 600;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Imprimir Conteúdo do Lote de Movimento';
    loteLanc._abreLoteLanc;
    FrmCadContasAPagar.pnImpressaoLote.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    result := (formulario.ShowModal = IDOK);
  finally
    FrmCadContasAPagar.pnImpressaoLote.Parent := FrmCadContasAPagar.tsImpressaoLote;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAPagar._abreFormLancCTP(pState: TDataSetState): Boolean;
var
  formulario: TfrmPadrao;
  i: integer;
  vPanel29Visible: boolean;
begin
  //tá = N_S2 ainda tem que mudar tudo
  try
    formulario := TfrmPadrao.Create(Application);

    vPanel29Visible := FrmCadContasAPagar.Panel29.Visible;
    FrmCadContasAPagar.Panel29.Visible := False;

    FrmCadContasAPagar.Label42.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  	FrmCadContasAPagar.DBEdit23.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
  	FrmCadContasAPagar.DBLookupComboBox4.Visible := vDadosIni.vEmp.vFinanceiroUnificado;

    FrmCadContasAPagar.Edit3.Text := '';
    FrmCadContasAPagar.Edit4.Text := '';
    FrmCadContasAPagar.Edit5.Text := '';

    if FrmCadContasAPagar.WindowState = wsNormal then
    	FrmCadContasAPagar.pnPagLancCTP.Width := FrmCadContasAPagar.ScrollBox3.Width
    else
    	FrmCadContasAPagar.pnPagLancCTP.Width := 818;

    if FrmCadContasAPagar.WindowState = wsNormal then
    	FrmCadContasAPagar.pnPagLancCTP.Height := FrmCadContasAPagar.ScrollBox3.Height
    else
    	FrmCadContasAPagar.pnPagLancCTP.Height := 494;

    vEmpresasUnificadas._abreTodosEmpresas;
    vDadosIni.vDataHora := vDadosIni.getDataBanco(buscas);

    if pState = dsInsert then
    begin
    	dataSet.Insert;
    	dataSet.FieldByName('CODIGO_EMP').AsInteger := strToInt(vDadosIni.codEmpresa);
      dataSet.FieldByName('COD_EMP_MULT').AsInteger := strToInt(vDadosIni.codEmpresa);
      dataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
      dataSet.FieldByName('DATA_ENT_CTP').AsDateTime := vDadosIni.diaFFinanceiro+1; //_retornaDiaFinanceiroAberto(buscas);
      dataSet.FieldByName('VALOR_CTP').AsFloat := rCTP.vValorAInformar;
      dataSet.FieldByName('VL_CONTABIL').AsFloat := rCTP.vValorAInformar;
      vDadosIni.vInibeMensPesqPros := 'S';
      if vDadosIni.PesqPros('LANC034', 'HABILITAR', '', 'CONTAS_A_PAGAR', '', buscas, True) then
        dataSet.FieldByName('DTREFERENCIA').AsDateTime := dataSet.FieldByName('DATA_ENT_CTP').AsDateTime;
      dataSet.FieldByName('TIPO_CTP').AsString := 'D';
      vCodEmpMult := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
      vCodControle := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
      vDataReferencia := dataSet.FieldByName('DTREFERENCIA').AsDateTime;
    end
    else
      dataSet.Edit;

    _listaPContas;
    _listaControles(false, 0, dataSet.FieldByName('COD_EMP_MULT').AsInteger);

    formulario.Width := FrmCadContasAPagar.pnPagLancCTP.Width;
    formulario.Height := FrmCadContasAPagar.pnPagLancCTP.Height;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Efetuando lançamentos - Contas a pagar';

    //    if not cr.dataSet.Active then
    cr.vNumCtrlTemp := dtSetCtrlTemp.FieldByName('codigo_ctrl').AsInteger;
    cr._abreCreditosCTP;
    cr.vSaldoCreditosSelecionados := 0;
//    cr._atualizaValorCreditosSel(FrmCadContasAPagar.lbCreditosSel);
//    FrmCadContasAPagar.DBGrid4.Enabled := false;
		apagarContas;
  	ApagarContasPagarTemp(FrmCadContasAPagar.cdsDesp);
  	FrmCadContasAPagar.DBEdit1.Enabled := FrmCadContasAPagar.cdsDesp.IsEmpty;
		FrmCadContasAPagar.GroupBox1.Parent := FrmCadContasAPagar.Panel71;
    FrmCadContasAPagar.pnPagLancCTP.Parent := formulario;

    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    result := (formulario.ShowModal = IDOK);
  finally
    if result then
    begin
      _getTotalLancPorControle;
      FrmCadContasAPagar.lbDinheiro.Caption := Format('%0.2m', [rCTP.vSaldoDinheiro]);
      FrmCadContasAPagar.lbCreditos.Caption := Format('%0.2m', [rCTP.vSaldoCredito]);
      FrmCadContasAPagar.lbCheque.Caption := Format('%0.2m', [rCTP.vSaldoCheque]);
      FrmCadContasAPagar.lbAtingir.Caption := Format('%0.2m', [rCTP.vValorOperacao]);
      FrmCadContasAPagar.lbPrevisto.Visible := CTP.rCTP.vValorPrevisto > 0;
	  	FrmCadContasAPagar.lbPrevistoDesc.Visible := CTP.rCTP.vValorPrevisto > 0;
    	FrmCadContasAPagar.lbPrevisto.Caption := Format('%0.2m', [CTP.rCTP.vValorPrevisto]);

      rCTP.vValorAtingido := rCTP.vSaldoDinheiro + rCTP.vSaldoCredito + rCTP.vSaldoCheque;
      rCTP.vValorAInformar := rCTP.vValorOperacao - rCTP.vValorAtingido;
      FrmCadContasAPagar.lbInformar.Caption := Format('%0.2m', [rCTP.vValorAInformar]);
      FrmCadContasAPagar.lbAtingido.Caption := Format('%0.2m', [rCTP.vValorAtingido]);
    end;

  	FrmCadContasAPagar.GroupBox1.Parent := FrmCadContasAPagar.ScrollBox3;
    FrmCadContasAPagar.Panel29.Visible := vPanel29Visible;

    FrmCadContasAPagar.pnPagLancCTP.Parent := FrmCadContasAPagar.tsLancCTP;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAPagar._abreFormLancDiferencaCTP: Boolean;
var
  formulario: TfrmPadrao;
  i: integer;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 800;
    formulario.Height := 600;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Lançamento de Diferença';
    formulario.BorderIcons := [];
    formulario.ShowHint := true;

    for i := 0 to FrmCadContasAPagar.pnLancDiferenca.ControlCount - 1 do
      if FrmCadContasAPagar.pnLancDiferenca.Controls[i] is TDBEdit then
        TDBEdit(FrmCadContasAPagar.pnLancDiferenca.Controls[i]).DataSource := dsLancTemp
      else if FrmCadContasAPagar.pnLancDiferenca.Controls[i] is TDBLookupComboBox then
      begin
        TDBLookupComboBox(FrmCadContasAPagar.pnLancDiferenca.Controls[i]).DataSource := dsLancTemp;
//        if TDBLookupComboBox(FrmCadContasAPagar.pnLancDiferenca.Controls[i]).Name = 'DBLookupComboBoxPContas' then
//          TDBLookupComboBox(FrmCadContasAPagar.pnLancDiferenca.Controls[i]).KeyValue:= rCTP.vNumContaPadraoDif;
        //          TDBLookupComboBox(FrmCadContasAPagar.pnLancDiferenca.Controls[i]).ListSource := dsCtrltemp;
      end;
    FrmCadContasAPagar.DBLookupComboBoxControle.OnExit := _DBLookupComboBoxControleExit;
//    dtSetPContas.Filtered := false;
//    dtSetPContas.Filter := 'TIPO_PLC=''E''';
//    dtSetPContas.Filtered := true;
//    dtSetPContas.Locate('N_CONTA_PLC',rCTP.vNumContaPadraoDif,[loCaseInsensitive]);
    _listaPContas('E');
    if dtSetPContas.IsEmpty then
    begin
      Application.MessageBox('Nenhuma conta de entrada encontrada.' + chr(13) + 'Favor verificar no plano de contas da empresa.', 'Informação', MB_OK + MB_ICONINFORMATION);
      exit;
    end;
    vpermitir := false;
    vNumConta := 0;
    dtSetLancTemp.Append;
    dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat := dtSetPContas.FieldByName('N_CONTA_PLC').AsFloat;
    dtSetLancTemp.FieldByName('HISTORICO_L').AsString := 'LANÇAMENTO DE DIFERENÇA';
    dtSetLancTemp.FieldByName('TIPO_L').AsString := dtSetPContas.FieldByName('TIPO_PLC').AsString;
    dtSetLancTemp.FieldByName('VALOR_L').AsCurrency := -1 * (vDadosIni.StrToFloatFormat(rCTP.vValorAInformar,2));
    rCTP.vValorDiferenca := -1 * (vDadosIni.StrToFloatFormat(rCTP.vValorAInformar,2));

    FrmCadContasAPagar.pnLancDiferenca.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    result := (formulario.ShowModal = IDOK);
  finally
    _listaPContas;
    if result then
    begin
      //      dtSetLancTemp.FieldByName('NOME_CTRL').AsString := dtSetControles.FieldByName('NOME_CTRL').AsString;
      //      dtSetLancTemp.FieldByName('CODIGO_CTRL').AsInteger := dtSetControles.FieldByName('CODIGO_CTRL').AsInteger;

      dtSetLancTemp.Post;
      _getTotalLancPorControle;
      FrmCadContasAPagar.lbDinheiro.Caption := Format('%0.2m', [rCTP.vSaldoDinheiro]);
      FrmCadContasAPagar.lbCreditos.Caption := Format('%0.2m', [rCTP.vSaldoCredito]);
      FrmCadContasAPagar.lbCheque.Caption := Format('%0.2m', [rCTP.vSaldoCheque]);
      FrmCadContasAPagar.lbAtingir.Caption := Format('%0.2m', [rCTP.vValorOperacao]);
      FrmCadContasAPagar.lbPrevisto.Visible := CTP.rCTP.vValorPrevisto > 0;
	  	FrmCadContasAPagar.lbPrevistoDesc.Visible := CTP.rCTP.vValorPrevisto > 0;
    	FrmCadContasAPagar.lbPrevisto.Caption := Format('%0.2m', [CTP.rCTP.vValorPrevisto]);

      rCTP.vValorAtingido := rCTP.vSaldoDinheiro + rCTP.vSaldoCredito + rCTP.vSaldoCheque;
      rCTP.vValorAInformar := rCTP.vValorOperacao - rCTP.vValorAtingido - 2 * rCTP.vValorDiferenca;
      FrmCadContasAPagar.lbInformar.Caption := Format('%0.2m', [rCTP.vValorAInformar]);
      FrmCadContasAPagar.lbAtingido.Caption := Format('%0.2m', [rCTP.vValorAtingido]);
      rCTP.vValorDiferenca := 0;
    end
    else
      dtSetLancTemp.Cancel;
    dtSetPContas.Filtered := false;
    FrmCadContasAPagar.pnLancDiferenca.Parent := FrmCadContasAPagar.tsLancDiferenca;
    //
    for i := 0 to FrmCadContasAPagar.pnLancDiferenca.ControlCount - 1 do
      if FrmCadContasAPagar.pnLancDiferenca.Controls[i] is TDBEdit then
        TDBEdit(FrmCadContasAPagar.pnLancDiferenca.Controls[i]).DataSource := nil
      else
      if FrmCadContasAPagar.pnLancDiferenca.Controls[i] is TDBLookupComboBox then
      begin
        TDBLookupComboBox(FrmCadContasAPagar.pnLancDiferenca.Controls[i]).DataSource := nil;
        //        if TDBLookupComboBox(FrmCadContasAPagar.pnLancDiferenca.Controls[i]).Name = 'DBLookupComboBoxControle' then
        //          TDBLookupComboBox(FrmCadContasAPagar.pnLancDiferenca.Controls[i]).ListSource := dsCtrltemp;
      end;
    formulario.Free;
    formulario := nil;
  end;

end;

function TContasAPagar._abreFormLancN_S2(pState: TDataSetState): Boolean;
var
  formulario: TfrmPadrao;
  i: integer;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 800;
    formulario.Height := 600;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Efetuando lançamentos';

    for i := 0 to FrmCadContasAPagar.GroupBox8.ControlCount - 1 do
      if FrmCadContasAPagar.GroupBox8.Controls[i] is TDBEdit then
        TDBEdit(FrmCadContasAPagar.GroupBox8.Controls[i]).DataSource := dsLancTemp
      else if FrmCadContasAPagar.GroupBox8.Controls[i] is TDBLookupComboBox then
        TDBLookupComboBox(FrmCadContasAPagar.GroupBox8.Controls[i]).DataSource := dsLancTemp;
    if pState = dsInsert then
    begin
      dtSetLancTemp.Append;
      dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat :=rCTP.vNumContaPadrao;
//      rCTP.vNumContaPadraoCR;
      dtSetLancTemp.FieldByName('HISTORICO_L').AsString := rCTP.vHistoricoPadrao;
      dtSetLancTemp.FieldByName('CODIGO_CTRL').AsInteger := dtSetCtrlTemp.FieldByName('CODIGO_CTRL').AsInteger;
      dtSetLancTemp.FieldByName('NOME_CTRL').AsString := dtSetCtrlTemp.FieldByName('NOME_CTRL').AsString;
      dtSetLancTemp.FieldByName('TIPO_L').AsString := dtSetPContasTemp.FieldByName('TIPO_PLC').AsString;
      if FUsarValorAAtingir then
        dtSetLancTemp.FieldByName('VALOR_L').AsCurrency := rCTP.vValorAInformar;
    end
    else
      dtSetLancTemp.Edit;
    //    FrmCadContasAPagar.Edit1.Text := rCTP.vHistoricoPadrao;
    if dtSetCtrlTemp.FieldByName('CONTR_BANC').AsString = 'S' then
	    FrmCadContasAPagar.pnPagLancN_S2.Height := 230
    else
      FrmCadContasAPagar.pnPagLancN_S2.Height := 170;
    FrmCadContasAPagar.pnPagLancN_S2.Parent := formulario;
    FrmCadContasAPagar.DBEdit25.Visible := dtSetCtrlTemp.FieldByName('CONTR_BANC').AsString = 'S';
    FrmCadContasAPagar.DBEdit12.Visible := dtSetCtrlTemp.FieldByName('CONTR_BANC').AsString = 'S';
    FrmCadContasAPagar.DBEdit26.Visible := dtSetCtrlTemp.FieldByName('CONTR_BANC').AsString = 'S';
    FrmCadContasAPagar.SpeedButton59.Visible := dtSetCtrlTemp.FieldByName('CONTR_BANC').AsString = 'S';
    FrmCadContasAPagar.Label90.Caption := 'Nº Documento';

    rCTP.numContaTemp := dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat;

    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    result := (formulario.ShowModal = IDOK);
  finally
    if result then
    begin
//      dtSetLancTemp.FieldByName('NDOC_L').AsString:=dtSetLancTemp.FieldByName('N_CHEQ_L').AsString;
      dtSetLancTemp.FieldByName('NDOC_L').AsString:=dtSetLancTemp.FieldByName('NDOC_L').AsString;
      dtSetLancTemp.FieldByName('N_CHEQ_L').AsString:=dtSetLancTemp.FieldByName('N_CHEQ_L').AsString;
      dtSetLancTemp.FieldByName('NOMINAL_L').AsString:=dtSetLancTemp.FieldByName('NOMINAL_L').AsString;
      dtSetLancTemp.FieldByName('DATA_VENC_CHEQ_L').Value :=dtSetLancTemp.FieldByName('DATA_VENC_CHEQ_L').Value;
      dtSetLancTemp.Post;
      _getTotalLancPorControle;
      FrmCadContasAPagar.lbDinheiro.Caption := Format('%0.2m', [rCTP.vSaldoDinheiro]);
      FrmCadContasAPagar.lbCreditos.Caption := Format('%0.2m', [rCTP.vSaldoCredito]);
      FrmCadContasAPagar.lbCheque.Caption := Format('%0.2m', [rCTP.vSaldoCheque]);
      FrmCadContasAPagar.lbAtingir.Caption := Format('%0.2m', [rCTP.vValorOperacao]);
      FrmCadContasAPagar.lbPrevisto.Visible := CTP.rCTP.vValorPrevisto > 0;
		  FrmCadContasAPagar.lbPrevistoDesc.Visible := CTP.rCTP.vValorPrevisto > 0;
    	FrmCadContasAPagar.lbPrevisto.Caption := Format('%0.2m', [CTP.rCTP.vValorPrevisto]);

      rCTP.vValorAtingido := rCTP.vSaldoDinheiro + rCTP.vSaldoCredito + rCTP.vSaldoCheque;
      rCTP.vValorAInformar := rCTP.vValorOperacao - rCTP.vValorAtingido;
      FrmCadContasAPagar.lbInformar.Caption := Format('%0.2m', [rCTP.vValorAInformar]);
      FrmCadContasAPagar.lbAtingido.Caption := Format('%0.2m', [rCTP.vValorAtingido]);
    end
    else
      dtSetLancTemp.Cancel;

    for i := 0 to FrmCadContasAPagar.GroupBox8.ControlCount - 1 do
      if FrmCadContasAPagar.GroupBox8.Controls[i] is TDBEdit then
        TDBEdit(FrmCadContasAPagar.GroupBox8.Controls[i]).DataSource := nil
      else if FrmCadContasAPagar.GroupBox8.Controls[i] is TDBLookupComboBox then
        TDBLookupComboBox(FrmCadContasAPagar.GroupBox8.Controls[i]).DataSource := nil;

    FrmCadContasAPagar.pnPagLancN_S2.Parent := FrmCadContasAPagar.tsLancN_S2;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAPagar._abreFormLancS1(pState: TDataSetState): Boolean;
var
  formulario: TfrmPadrao;
  i: integer;
begin
  //tá = N_S2 ainda tem que mudar tudo
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 800;
    formulario.Height := 600;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Efetuando lançamentos - Cheques';

    //    if not ch.dataSet.Active then
    ch.vNumCtrlTemp := dtSetCtrlTemp.FieldByName('codigo_ctrl').AsInteger;
    ch._abreChequesCTP;
    ch.vSaldoChequesSelecionados := 0;
    ch._atualizaValorChequesSel(FrmCadContasAPagar.lbChequesSel);
    FrmCadContasAPagar.DBGrid2.Enabled := false;
    FrmCadContasAPagar.pnPagLancS1.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    for I := 0 to FrmCadContasAPagar.DBGrid2.FieldCount - 1 do
      if not vDadosIni.vEmp.vFinanceiroUnificado then
      begin
        if (FrmCadContasAPagar.DBGrid2.Columns[I].FieldName = 'COD_EMP_MULT') then
          FrmCadContasAPagar.DBGrid2.Columns[I].Visible := false;
      end
      else
      begin
       	if (FrmCadContasAPagar.DBGrid2.Columns[I].FieldName = 'COD_EMP_MULT') then
          FrmCadContasAPagar.DBGrid2.Columns[I].Visible := true;
      end;

    result := (formulario.ShowModal = IDOK);
  finally
    if result and (ch.vSaldoChequesSelecionados > 0) then
    begin
      ch.dataSet.Filtered := false;
      ch.dataSet.Filter := 'SEL=''S'' ';
      ch.dataSet.Filtered := true;
      try
      	ch.dataSet.DisableControls;
        ch.First;
        while not ch.Eof do
        begin
        	if ch.dataSet.FieldByName('SEL').AsString = 'S' then
          begin
            dtSetLancTemp.Append;
            dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat := rCTP.vNumContaPadrao;
            dtSetLancTemp.FieldByName('HISTORICO_L').AsString := rCTP.vHistoricoPadrao;
            dtSetLancTemp.FieldByName('CODIGO_CTRL').AsInteger := dtSetCtrlTemp.FieldByName('CODIGO_CTRL').AsInteger;
            dtSetLancTemp.FieldByName('NOME_CTRL').AsString := dtSetCtrlTemp.FieldByName('NOME_CTRL').AsString;
            dtSetLancTemp.FieldByName('TIPO_L').AsString := dtSetPContasTemp.FieldByName('TIPO_PLC').AsString;
            dtSetLancTemp.FieldByName('CODIGO_CH').AsCurrency := ch.dataSet.FieldByName('CODIGO_CH').AsCurrency;
            dtSetLancTemp.FieldByName('CODIGO_EMP').AsInteger := ch.dataSet.FieldByName('CODIGO_EMP').AsInteger;
            dtSetLancTemp.FieldByName('VALOR_L').AsCurrency := dtSetLancTemp.FieldByName('VALOR_L').AsCurrency + ch.dataSet.FieldByName('VALOR_CH').AsCurrency;
            dtSetLancTemp.Post;
          end;
          
          ch.Next;
        end;
      finally
        ch.dataSet.EnableControls;
      end;
      _getTotalLancPorControle;
      FrmCadContasAPagar.lbDinheiro.Caption := Format('%0.2m', [rCTP.vSaldoDinheiro]);
      FrmCadContasAPagar.lbCreditos.Caption := Format('%0.2m', [rCTP.vSaldoCredito]);
      FrmCadContasAPagar.lbCheque.Caption := Format('%0.2m', [rCTP.vSaldoCheque]);
      FrmCadContasAPagar.lbAtingir.Caption := Format('%0.2m', [rCTP.vValorOperacao]);
      FrmCadContasAPagar.lbPrevisto.Visible := CTP.rCTP.vValorPrevisto > 0;
	  	FrmCadContasAPagar.lbPrevistoDesc.Visible := CTP.rCTP.vValorPrevisto > 0;
    	FrmCadContasAPagar.lbPrevisto.Caption := Format('%0.2m', [CTP.rCTP.vValorPrevisto]);

      rCTP.vValorAtingido := rCTP.vSaldoDinheiro + rCTP.vSaldoCredito + rCTP.vSaldoCheque;
      rCTP.vValorAInformar := rCTP.vValorOperacao - rCTP.vValorAtingido;
      FrmCadContasAPagar.lbInformar.Caption := Format('%0.2m', [rCTP.vValorAInformar]);
      FrmCadContasAPagar.lbAtingido.Caption := Format('%0.2m', [rCTP.vValorAtingido]);
    end
    else
      dtSetLancTemp.Cancel;
    ch.dataSet.Filtered := false;
    //      ch.dataSet.Filter := 'SEL=''S'' ';
    //      ch.dataSet.Filtered := true;
//    ch.Refresh;
    FrmCadContasAPagar.pnPagLancS1.Parent := FrmCadContasAPagar.tsLancS1;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAPagar._abreFormLancS2(pState: TDataSetState): Boolean;
var
  formulario: TfrmPadrao;
  i: integer;
begin
  //tá = N_S2 ainda tem que mudar tudo
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 800;
    formulario.Height := 600;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Efetuando lançamentos - Crédtos';

    //    if not cr.dataSet.Active then
    cr.vNumCtrlTemp := dtSetCtrlTemp.FieldByName('codigo_ctrl').AsInteger;
    cr._abreCreditosCTP;
    cr.vSaldoCreditosSelecionados := 0;
    cr._atualizaValorCreditosSel(FrmCadContasAPagar.lbCreditosSel);
    FrmCadContasAPagar.DBGrid4.Enabled := false;
    FrmCadContasAPagar.pnPagLancS2.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    for I := 0 to FrmCadContasAPagar.DBGrid4.FieldCount - 1 do
      if not vDadosIni.vEmp.vFinanceiroUnificado then
      begin
        if (FrmCadContasAPagar.DBGrid4.Columns[I].FieldName = 'COD_EMP_MULT') then
          FrmCadContasAPagar.DBGrid4.Columns[I].Visible := false;
      end
      else
      begin
       	if (FrmCadContasAPagar.DBGrid4.Columns[I].FieldName = 'COD_EMP_MULT') then
          FrmCadContasAPagar.DBGrid4.Columns[I].Visible := true;
      end;

    result := (formulario.ShowModal = IDOK);
  finally
    if result and (cr.vSaldoCreditosSelecionados > 0) then
    begin
      cr.dataSet.Filtered := false;
      cr.dataSet.Filter := 'SEL=''S'' ';
      cr.dataSet.Filtered := true;
      try
      	cr.dataSet.DisableControls;
        cr.First;
        while not cr.Eof do
        begin
        	if cr.dataSet.FieldByName('SEL').AsString = 'S' then
          begin
            dtSetLancTemp.Append;
            dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat := rCTP.vNumContaPadrao;
            dtSetLancTemp.FieldByName('HISTORICO_L').AsString := rCTP.vHistoricoPadrao;
            dtSetLancTemp.FieldByName('CODIGO_CTRL').AsInteger := dtSetCtrlTemp.FieldByName('CODIGO_CTRL').AsInteger;
            dtSetLancTemp.FieldByName('NOME_CTRL').AsString := dtSetCtrlTemp.FieldByName('NOME_CTRL').AsString;
            dtSetLancTemp.FieldByName('TIPO_L').AsString := dtSetPContasTemp.FieldByName('TIPO_PLC').AsString;
            dtSetLancTemp.FieldByName('COD_CRED').AsCurrency := cr.dataSet.FieldByName('COD_CRED').AsCurrency;
            dtSetLancTemp.FieldByName('CODIGO_EMP').AsInteger := cr.dataSet.FieldByName('CODIGO_EMP').AsInteger;
            dtSetLancTemp.FieldByName('VALOR_L').AsCurrency := dtSetLancTemp.FieldByName('VALOR_L').AsCurrency + cr.dataSet.FieldByName('VALOR_C').AsCurrency;
            dtSetLancTemp.Post;
          end;
          
          cr.Next;
        end;
      finally
        cr.dataSet.EnableControls;
      end;
      _getTotalLancPorControle;
      FrmCadContasAPagar.lbDinheiro.Caption := Format('%0.2m', [rCTP.vSaldoDinheiro]);
      FrmCadContasAPagar.lbCreditos.Caption := Format('%0.2m', [rCTP.vSaldoCredito]);
      FrmCadContasAPagar.lbCheque.Caption := Format('%0.2m', [rCTP.vSaldoCheque]);
      FrmCadContasAPagar.lbAtingir.Caption := Format('%0.2m', [rCTP.vValorOperacao]);
      FrmCadContasAPagar.lbPrevisto.Visible := CTP.rCTP.vValorPrevisto > 0;
	  	FrmCadContasAPagar.lbPrevistoDesc.Visible := CTP.rCTP.vValorPrevisto > 0;
    	FrmCadContasAPagar.lbPrevisto.Caption := Format('%0.2m', [CTP.rCTP.vValorPrevisto]);

      rCTP.vValorAtingido := rCTP.vSaldoDinheiro + rCTP.vSaldoCredito + rCTP.vSaldoCheque;
      rCTP.vValorAInformar := rCTP.vValorOperacao - rCTP.vValorAtingido;
      FrmCadContasAPagar.lbInformar.Caption := Format('%0.2m', [rCTP.vValorAInformar]);
      FrmCadContasAPagar.lbAtingido.Caption := Format('%0.2m', [rCTP.vValorAtingido]);
    end
    else
      dtSetLancTemp.Cancel;
    cr.dataSet.Filtered := false;
    //      cr.dataSet.Filter := 'SEL=''S'' ';
    //      cr.dataSet.Filtered := true;
//    cr.Refresh;
    FrmCadContasAPagar.pnPagLancS2.Parent := FrmCadContasAPagar.tsLancS2;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAPagar._abreFormObservacoes: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Observações';

    FrmCadContasAPagar.pnObs.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    result := (formulario.ShowModal = IDOK);

  finally
    FrmCadContasAPagar.pnObs.Parent := FrmCadContasAPagar.tsObs;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAPagar._abreFormQuitarCTP: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 800;
    formulario.Height := 600;
    formulario.Position := poScreenCenter;
    formulario.BorderIcons := [];
    formulario.Caption := 'Pagando despesas';
    dtSetLancTemp.EmptyDataSet;
    FrmCadContasAPagar.DBGrid5.DataSource := dsCtrltemp;
    FrmCadContasAPagar.DBGrid6.DataSource := dsLancTemp;
    FrmCadContasAPagar.lbDinheiro.Caption := Format('%0.2m', [rCTP.vSaldoDinheiro]);
    FrmCadContasAPagar.lbCreditos.Caption := Format('%0.2m', [rCTP.vSaldoCredito]);
    FrmCadContasAPagar.lbCheque.Caption := Format('%0.2m', [rCTP.vSaldoCheque]);
    FrmCadContasAPagar.lbAtingir.Caption := Format('%0.2m', [rCTP.vValorOperacao]);
    FrmCadContasAPagar.lbPrevisto.Visible := rCTP.vValorPrevisto > 0;
	  FrmCadContasAPagar.lbPrevistoDesc.Visible := rCTP.vValorPrevisto > 0;
    FrmCadContasAPagar.lbPrevisto.Caption := Format('%0.2m', [rCTP.vValorPrevisto]);
    FrmCadContasAPagar.lbInformar.Caption := Format('%0.2m', [rCTP.vValorAInformar]);
    FrmCadContasAPagar.lbAtingido.Caption := Format('%0.2m', [rCTP.vValorAtingido]);

    FrmCadContasAPagar.Edit1.Text := rCTP.vHistoricoPadrao;
    FrmCadContasAPagar.pnPagar.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    result := (formulario.ShowModal = IDOK);

  finally
    FrmCadContasAPagar.pnPagar.Parent := FrmCadContasAPagar.tsPagando;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAPagar._abreFormReplicacaoContasCTP: Boolean;
var
  formulario: TfrmPadrao;
  vDataVencimento: TDateTime;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Replicação de Contas a Pagar';

    FrmCadContasAPagar.pnReplicar.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    FrmCadContasAPagar.MemoReplicar.Clear;
    FrmCadContasAPagar.MemoReplicar.Lines.Add('Replicar alterando o número e quantidade da parcela do documento atual informado (Exemplo 2 parcelas):');
    FrmCadContasAPagar.MemoReplicar.Lines.Add('Documento atual:');
    FrmCadContasAPagar.MemoReplicar.Lines.Add('   ' +
    																						' Num Doc: ' + trim(dataSet.FieldByName('N_DOC_CTP').AsString) + '-1' +
    																						' Data Venc: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_VENC_CTP').AsDateTime) +
                                                ' Valor: ' + formatfloat('0.00', dataSet.FieldByName('VALOR_CTP').AsFloat) +
                                                ' Num Parc: ' + IntToStr(1) +
                                                ' Qtde Parc: ' + IntToStr(3));

    vDataVencimento := dataSet.FieldByName('DATA_VENC_CTP').AsDateTime;

  	FrmCadContasAPagar.MemoReplicar.Lines.Add('Demais documentos:');
    
    vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
    if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), FDiaReplicacao) then
      vDataVencimento := StartOfTheMonth(vDataVencimento) + FDiaReplicacao - 1
    else
      vDataVencimento := EndOfTheMonth(vDataVencimento);

    FrmCadContasAPagar.MemoReplicar.Lines.Add('   ' +
    																						' Num Doc: ' + trim(dataSet.FieldByName('N_DOC_CTP').AsString) + '-2' +
    																						' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDataVencimento) +
                                                ' Valor: ' + formatfloat('0.00', dataSet.FieldByName('VALOR_CTP').AsFloat) +
                                                ' Num Parc: ' + IntToStr(2) +
                                                ' Qtde Parc: ' + IntToStr(3));

    vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
    if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), FDiaReplicacao) then
      vDataVencimento := StartOfTheMonth(vDataVencimento) + FDiaReplicacao - 1
    else
      vDataVencimento := EndOfTheMonth(vDataVencimento);

    FrmCadContasAPagar.MemoReplicar.Lines.Add('   ' +
    																						' Num Doc: ' + trim(dataSet.FieldByName('N_DOC_CTP').AsString) + '-3' +
    																						' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDataVencimento) +
                                                ' Valor: ' + formatfloat('0.00', dataSet.FieldByName('VALOR_CTP').AsFloat) +
                                                ' Num Parc: ' + IntToStr(3) +
                                                ' Qtde Parc: ' + IntToStr(3));
    FrmCadContasAPagar.MemoReplicar.Lines.Add('');
    FrmCadContasAPagar.MemoReplicar.Lines.Add('Replicar sem alterar o número e quantidade da parcela do documento atual informado (Exemplo 2 parcelas):');
    FrmCadContasAPagar.MemoReplicar.Lines.Add('Documento atual:');
    FrmCadContasAPagar.MemoReplicar.Lines.Add('   ' +
    																						' Num Doc: ' + trim(dataSet.FieldByName('N_DOC_CTP').AsString) + '-' + IntToStr(dataSet.FieldByName('NPARCELA').AsInteger) +
    																						' Data Venc: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_VENC_CTP').AsDateTime) +
                                                ' Valor: ' + formatfloat('0.00', dataSet.FieldByName('VALOR_CTP').AsFloat) +
                                                ' Num Parc: ' + IntToStr(dataSet.FieldByName('NPARCELA').AsInteger) +
                                                ' Qtde Parc: ' + IntToStr(dataSet.FieldByName('QTDE_PARC').AsInteger));

    vDataVencimento := dataSet.FieldByName('DATA_VENC_CTP').AsDateTime;

    FrmCadContasAPagar.MemoReplicar.Lines.Add('Demais documentos:');
    
    vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
    if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), FDiaReplicacao) then
      vDataVencimento := StartOfTheMonth(vDataVencimento) + FDiaReplicacao - 1
    else
      vDataVencimento := EndOfTheMonth(vDataVencimento);

    FrmCadContasAPagar.MemoReplicar.Lines.Add('   ' +
    																						' Num Doc: ' + trim(dataSet.FieldByName('N_DOC_CTP').AsString) + '-1' +
    																						' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDataVencimento) +
                                                ' Valor: ' + formatfloat('0.00', dataSet.FieldByName('VALOR_CTP').AsFloat) +
                                                ' Num Parc: ' + IntToStr(1) +
                                                ' Qtde Parc: ' + IntToStr(2));

    vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
    if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), FDiaReplicacao) then
      vDataVencimento := StartOfTheMonth(vDataVencimento) + FDiaReplicacao - 1
    else
      vDataVencimento := EndOfTheMonth(vDataVencimento);
      
    FrmCadContasAPagar.MemoReplicar.Lines.Add('   ' +
    																						' Num Doc: ' + trim(dataSet.FieldByName('N_DOC_CTP').AsString) + '-2' +
    																						' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDataVencimento) +
                                                ' Valor: ' + formatfloat('0.00', dataSet.FieldByName('VALOR_CTP').AsFloat) +
                                                ' Num Parc: ' + IntToStr(2) +
                                                ' Qtde Parc: ' + IntToStr(2));


    vDadosIni.definirDiaFinanceiroFechado(buscas);
    FrmCadContasAPagar.edQtdeRepl.AsValue := 1;
    FrmCadContasAPagar.edDiaVencReplicar.AsValue := FDiaReplicacao;

    FrmCadContasAPagar.ckbReplAlterarNumQdeParcela.Checked :=
    	_LerConfiguracoesRegistroBoolean(FrmCadContasAPagar.ckbReplAlterarNumQdeParcela.Name, False);

    vDadosIni.definirDiaFinanceiroFechado(buscas);
    FrmCadContasAPagar.edQtdeRepl.AsValue := 1;
    FrmCadContasAPagar.edDiaVencReplicar.AsValue := FDiaReplicacao;
    FrmCadContasAPagar.EditHwNumConta.AsValue := dataSet.FieldByName('N_CONTA_PLC').AsFloat;
    FrmCadContasAPagar.DBLookupComboBoxNumConta.KeyValue := dataSet.FieldByName('N_CONTA_PLC').AsFloat;
    _listaPContas;
    result := (formulario.ShowModal = IDOK);

  finally
  	if Result then
    begin
      _GravaConfiguracoesBoolean(FrmCadContasAPagar.ckbReplAlterarNumQdeParcela.Name,    FrmCadContasAPagar.ckbReplAlterarNumQdeParcela.Checked);
      _GravaConfiguracoesBoolean(FrmCadContasAPagar.ckbReplNaoAlterarNumQdeParcela.Name, FrmCadContasAPagar.ckbReplNaoAlterarNumQdeParcela.Checked);
    end;
    
    FrmCadContasAPagar.pnReplicar.Parent := FrmCadContasAPagar.tsReplicacao;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAPagar._aceitarContaCTP: Boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CTP009', 'ACEITAR', dataset.FieldByName('N_DOC_CTP').AsString+' '+dataSet.FieldByName('NOME_FOR_CTP').AsString,
    'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+dataSet.FieldByName('N_DOC_CTP').AsString, buscas, true) then
    Exit;

  try
    vNomeBanco := '';
    if not _abreFormAceitarContaCTP then
      exit;
    vDadosIni.abreStatusProcessamento('', 'Iniciando processo de aceite das contas a pagar selecionadas.');
    First;

    while not eof do
    begin
      if dataSet.FieldByName('SEL').AsString = 'S' then
      begin
        if dataSet.FieldByName('DATQ_CTP').IsNull then
        begin
          try
            vDadosIni.abreStatusProcessamento('', 'Aceite para a conta a pagar Código de Sequência = ' + dataSet.FieldByName('COD_CONTRP').AsString);

            if not ExecutaComandosSql('select ctp.cod_contrp from contas_a_pagar ctp ' +
              ' where ctp.codigo_emp=' + vDadosIni.codEmpresa +
              ' and ctp.cod_contrp =  ' + dataSet.FieldByName('COD_CONTRP').AsString +
              ' and (ctp.selec='''' or (ctp.selec is null))') then
            begin
              Application.MessageBox(pchar('Conta a pagar Código de Sequência = ' + dataSet.FieldByName('COD_CONTRP').AsString + ' já está sendo alterada por outro usuário'), 'Atenção', MB_OK + MB_ICONINFORMATION);
              next;
              Continue;
            end;

            dataSet.edit;
            dataSet.FieldByName('ACEITE_CTP').AsString := 'S';
            dataSet.FieldByName('NOME_BANCO_DUPL').AsString := vNomeBanco;
            Result := inherited Post;
            if Result then
              result := Apply;
            if result then
              Result := CommitaTransacao
            else
            begin
              //              dataSet.RevertRecord;   //desfaz todas as edições , inclusive desmarca o registro
              dataSet.UndoLastChange(true); //desfaz apenas a ultima edição
              RollBackTransacao;
            end;

            if Result then
              vDadosIni.GravaAuditoria('CTP009', 'ACEITAR', 'SUCESSO:',
                'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+trim(dataSet.FieldByName('N_DOC_CTP').AsString)+
                ' '+dataSet.FieldByName('NOME_FOR_CTP').AsString, buscas)
            else
              vDadosIni.GravaAuditoria('CTP009', 'ACEITAR', 'FALHA:',
                'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+trim(dataSet.FieldByName('N_DOC_CTP').AsString)+
                ' '+dataSet.FieldByName('NOME_FOR_CTP').AsString, buscas);
          except
            vDadosIni.GravaAuditoria('CTP009', 'ACEITAR', 'FALHA:',
              'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+trim(dataSet.FieldByName('N_DOC_CTP').AsString)+' '+
              dataSet.FieldByName('NOME_FOR_CTP').AsString, buscas);
            cancel;
          end;
        end;
      end;
      Next;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TContasAPagar._alterarLancamentoSelecionado: boolean;
begin
  result:=false;
  if dtSetLancTemp.IsEmpty then
    exit;
  if not vDadosIni.PesqPros('CTP015', 'ALTERAR', '', 'LANCAMENTOS', '', buscas, true) then
    Exit;
  buscas.Close;
  buscas.sql.Text := 'select ctrl.docs from controles ctrl ' +
    ' where ctrl.codigo_ctrl = ' + dtSetLancTemp.FieldByName('codigo_ctrl').AsString +
    ' and ctrl.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and ctrl.ativo = 1 ';
  buscas.Open;
  if dtSetLancTemp.FieldByName('NOME_CTRL').AsString = 'CONTAS A PAGAR' then
  begin
  	Application.MessageBox(Pchar('Alteração em lançamentos referentes a contas a pagar limita-se a inclusão de novas contas a pagar.' + chr(13) + 'Se necessário use a opção de excluir[F4] e faça novos lançamentos.'), 'Informação', MB_OK + MB_ICONINFORMATION);
    // result:=_abreFormLancCTP(dsiEdit);
    Exit;
  end
  else if buscas.FieldByName('DOCS').AsString = 'S1' then
  begin
    Application.MessageBox(Pchar('Alteração em lançamentos referentes a cheques limita-se a inclusão de novos cheques.' + chr(13) + 'Se necessário use a opção de excluir[F4] e faça novos lançamentos.'), 'Informação', MB_OK + MB_ICONINFORMATION);
    // result:=_abreFormLancS1(dsEdit);
    Exit;
  end
  else if buscas.FieldByName('DOCS').AsString = 'S2' then
  begin
    Application.MessageBox(Pchar('Alteração em lançamentos referentes a créditos limita-se a inclusão de novos créditos.' + chr(13) + 'Se necessário use a opção de excluir[F4] e faça novos lançamentos.'), 'Informação', MB_OK + MB_ICONINFORMATION);
    // result:=_abreFormLancS2(dsEdit);
    Exit;
  end
  else
  begin
    result:=_abreFormLancN_S2(dsEdit);
  end;
  buscas.Close;
end;

function TContasAPagar._atualizarValorPagoCTP: Boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CTP008', 'ATUALIZAR', dataset.FieldByName('N_DOC_CTP').AsString+' '+dataSet.FieldByName('NOME_FOR_CTP').AsString, 'CONTAS_A_PAGAR',
    dataSet.FieldByName('COD_CONTRP').AsString+'/'+dataset.FieldByName('N_DOC_CTP').AsString, buscas, true) then
    Exit;

  try
//    dataSet.DisableControls;
    storeRecNo;
    dataSet.First;
    while not dataSet.Eof do
    begin
      vDadosIni.abreStatusProcessamento('', 'Preparando para atualizar valores das contas selecionadas.');
      if dataSet.FieldByName('SEL').AsString = 'S' then
      begin
        if dataSet.FieldByName('DATQ_CTP').IsNull then
        begin
          try
            vDadosIni.abreStatusProcessamento('', 'Atualizando valor da Conta. ' + dataSet.FieldByName('N_DOC_CTP').AsString);

            if not ExecutaComandosSql('select ctp.cod_contrp from contas_a_pagar ctp ' +
              ' where ctp.codigo_emp=' + vDadosIni.codEmpresa +
              ' and ctp.cod_contrp =  ' + dataSet.FieldByName('COD_CONTRP').AsString +
              ' and (ctp.selec='''' or (ctp.selec is null))') then
            begin
              Application.MessageBox(pchar('Conta a pagar Código de Sequência = ' + dataSet.FieldByName('COD_CONTRP').AsString + ' já está sendo alterada por outro usuário'), 'Atenção', MB_OK + MB_ICONINFORMATION);
              dataSet.next;
              Continue;
            end;

            dataSet.edit;
            dataSet.FieldByName('VALOR_PAGO').AsFloat := dataSet.FieldByName('VALOR_CTP').AsFloat;
            if not _abreFormAtualizarValorPagoCTP then
            begin
              dataSet.cancel;
              break;
            end;
            Result := inherited Post;
            if Result then
              result := Apply;
            if result then
              Result := CommitaTransacao
            else
            begin
              //              dataSet.RevertRecord;   //desfaz todas as edições , inclusive desmarca o registro
              dataSet.UndoLastChange(true); //desfaz apenas a ultima edição
              RollBackTransacao;
            end;

            if Result then
              vDadosIni.GravaAuditoria('CTP008', 'ATUALIZAR', 'SUCESSO:',
                'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+trim(dataSet.FieldByName('N_DOC_CTP').AsString)+
                ' '+dataSet.FieldByName('NOME_FOR_CTP').AsString, buscas)
            else
              vDadosIni.GravaAuditoria('CTP008', 'ATUALIZAR', 'FALHA:',
                'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+trim(dataSet.FieldByName('N_DOC_CTP').AsString)+
                ' '+dataSet.FieldByName('NOME_FOR_CTP').AsString, buscas);
          except
            vDadosIni.GravaAuditoria('CTP008', 'ATUALIZAR', 'FALHA:',
              'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+trim(dataSet.FieldByName('N_DOC_CTP').AsString)+
              ' '+dataSet.FieldByName('NOME_FOR_CTP').AsString, buscas);
            dataSet.cancel;
          end;
        end;
      end;
      dataSet.Next;
    end;
  finally
    dataSet.First;
//    dataSet.EnableControls;
    restoreRecNo;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TContasAPagar._bandaDetalheBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
	FrmCadContasAPagar.QRLabel34.Caption := 'R$ ' + FormatFloat('#,##0.00', dataSet.FieldByName('VALOR_CTP').AsFloat);
  FrmCadContasAPagar.QRLabel35.Caption := 'R$ ' + FormatFloat('#,##0.00', dataSet.FieldByName('VALOR_PAGO').AsFloat);

  FrmCadContasAPagar.QRLabel36.Caption := 'R$ ' + FormatFloat('#,##0.00', dataSet.FieldByName('VALOR_CTP').AsFloat);
  FrmCadContasAPagar.QRLabel37.Caption := 'R$ ' + FormatFloat('#,##0.00', dataSet.FieldByName('VALOR_PAGO').AsFloat);
  if vRelSomenteSelecionado then
    PrintBand :=(dataSet.FieldByName('SEL').AsString = 'S');
//    vGridRel.SelectedRows.CurrentRowSelected;
  //  if Cliente.LEstado.buscas.Locate('CODIGO_UF', Cliente.dataset.FieldByName('CODIGO_UF').asinteger, []) then
  //    FrmCadClientes.QRLabel10.Caption := Cliente.LEstado.buscas.FieldByName('SIGLA_UF').asstring
  //  else
  //    FrmCadClientes.QRLabel10.Caption := '';
end;

function TContasAPagar._cancelarPagamento: boolean;
begin
  result:=false;
  if not vDadosIni.PesqPros('CTP019', 'CANCELAR QUITAÇÃO', '', 'CONTAS_A_PAGAR', '', buscas, TRUE) then
    Exit;

  if Application.MessageBox('Deseja mesmo cancelar o pagamento das contas', 'Atenção',
    MB_ICONQUESTION + MB_YESNO) = IDNO then
    exit;

  if baixaParcial then
  begin
  	if (dataSet.FieldByName('SEL').AsString = 'S') then
    begin
      dataSet.Edit;
      dataSet.FieldByName('SELEC').AsVariant := null;
      dataSet.FieldByName('OP_CX').AsVariant := null;
      dataSet.Post;
    end;
  end
  else
  begin
    try
      dataSet.DisableControls;
      dataSet.First;
      while not dataSet.eof do
      begin
        if (dataSet.FieldByName('SEL').AsString = 'S') then
        begin
          dataSet.Edit;
          dataSet.FieldByName('SELEC').AsVariant := null;
          dataSet.FieldByName('OP_CX').AsVariant := null;
          dataSet.Post;
        end;
        dataSet.next;
      end;
    finally
      dataSet.EnableControls;
    end;
  end;
  
  if dataSet.ChangeCount = 0 then
  begin
    result:=true;
    refresh;
    exit;
  end;

  result:= Apply;
  if Result then
    result:= CommitaTransacao;
  refresh;
end;

function TContasAPagar._confirmarPagamento: boolean;
var
	vCodCtp, vCodCtpOrg, vCodEmpresa: Integer;
  vCodCtpParc, vCodEmpresaParc: Integer;
  vValorCtp: Currency;
  vValorEnt: Currency;
  vValorRateioCtp: Currency;
  vLancarContasApagar: boolean;
  vListaCTP: TStringList;
  vNumLotePag, vCodMaxBaixaPag: Integer;
	I: Integer;
begin
	vCodCtp         := 0;
  vCodCtpOrg      := 0;
  vCodEmpresa     := 0;

  vCodCtpParc     := 0;
  vCodEmpresaParc := 0;

  vValorCtp       := 0;
  vValorEnt       := 0;
  vValorRateioCtp := 0;

  vLancarContasApagar := False;

  vListaCTP := TStringList.Create;
  vListaCTP.Clear;

  vDadosIni.vDtSetTmp := TClientDataSet.Create(nil);
  vDadosIni.vDtSetTmp.Close;
  vDadosIni.vDtSetTmp.FieldDefs.Clear;
  for I := 0 to dataSet.Fields.Count - 1 do
	  vDadosIni.vDtSetTmp.FieldDefs.Add(dataSet.Fields.Fields[I].FieldName, dataSet.Fields.Fields[I].DataType, dataSet.Fields.Fields[I].Size, false);
	vDadosIni.vDtSetTmp.CreateDataSet;
  vDadosIni.vDtSetTmp.EmptyDataSet;

  try
    result := false;
    vDadosIni.vContrapartidaCTPCanc := false;

    //lançar contas a pagar
    try
    	dtSetLancTemp.DisableControls;
      dtSetLancTemp.First;
      while not dtSetLancTemp.Eof do
      begin
      	if dtSetLancTemp.FieldByName('COD_CONTRP').AsInteger <= 0 then
      		vValorEnt := vValorEnt + dtSetLancTemp.FieldByName('VALOR_L').AsCurrency;

      	if dtSetLancTemp.FieldByName('COD_CONTRP').AsInteger <> 0 then
        begin
          if cp._abreContasCTP(
          	dtSetLancTemp.FieldByName('CODIGO_EMP').AsInteger) then
          begin
          	cp.Insert;
            for I := 0 to cp.dataSet.Fields.Count - 1 do
              if dtSetLancTemp.FindField(cp.dataSet.Fields[I].FieldName) <> nil then
                cp.dataSet.Fields[I].Value := dtSetLancTemp.FieldByName(cp.dataSet.Fields[I].FieldName).Value;
            cp.dataSet.FieldByName('COD_CONTRP').AsInteger := Gencodigo('CONTAS_A_PAGAR', dtmContasAPagar.SpIncCodigo, IntToStr(dtSetLancTemp.FieldByName('CODIGO_EMP').AsInteger));
            cp.dataSet.FieldByName('CODIGO_CTRL').AsInteger := dtSetLancTemp.FieldByName('CODIGO_CTRL_CONTRP').AsInteger;

            vListaCTP.Add(
              IntToStr(cp.dataSet.FieldByName('COD_CONTRP').AsInteger) + '|' +
              IntToStr(cp.dataSet.FieldByName('CODIGO_EMP').AsInteger) + '|');

            cp.Post;
            if cp.dataSet.ChangeCount > 0 then
              if not cp.Apply then
                raiseExceptionCreate('Não foi possivel lançar novos contas a pagar', '');
          end;
          vValorCtp := vValorCtp + dtSetLancTemp.FieldByName('VALOR_CTP').AsFloat;
          vLancarContasApagar := True;
        end;
        dtSetLancTemp.Next;
      end;
    finally
      dtSetLancTemp.EnableControls;
    end;

    //marcando cheques a serem lançados
    try
    	dtSetLancTemp.DisableControls;
      dtSetLancTemp.First;
      while not dtSetLancTemp.Eof do
      begin
        if dtSetLancTemp.FieldByName('CODIGO_CH').AsInteger <> 0 then
        begin
          //if ch.dataSet.Locate('CODIGO_CH;CODIGO_EMP', VarArrayOf([dtSetLancTemp.FieldByName('CODIGO_CH').AsInteger, strtoint(vDadosIni.codEmpresa)]), []) then
          if ch._abreChequesCTP(
          	dtSetLancTemp.FieldByName('CODIGO_CH').AsInteger,
            dtSetLancTemp.FieldByName('CODIGO_EMP').AsInteger) then
          begin
            if _efetuaValidacaoCH then
            begin
              ch.Edit;
              ch.dataSet.FieldByName('STATUS_CX').AsString := 'R';
              ch.dataSet.FieldByName('OP_CX').AsInteger := vDadosIni.vCodUsuario;
              ch.Post;
              if ch.dataSet.ChangeCount > 0 then
                if not ch.Apply then
                  raiseExceptionCreate('Não foi possivel usar os cheques selecionados', '');
            end
            else
            begin
              dtSetLancTemp.Delete;
              _getTotalLancPorControle;
              rCTP.vValorAtingido := rCTP.vSaldoDinheiro + rCTP.vSaldoCredito + rCTP.vSaldoCheque;
              rCTP.vValorAInformar := rCTP.vValorOperacao - rCTP.vValorAtingido;
              exit;
            end;
          end;
        end
        else if dtSetLancTemp.FieldByName('COD_CRED').AsInteger <> 0 then
        begin
          if cr._abreCreditosCTP(
          	dtSetLancTemp.FieldByName('COD_CRED').AsInteger,
            dtSetLancTemp.FieldByName('CODIGO_EMP').AsInteger) then
          begin
            if _efetuaValidacaoCr then
            begin
              cr.Edit;
              cr.dataSet.FieldByName('STATUS_CX').AsString := 'R';
              cr.dataSet.FieldByName('OP_CX').AsInteger := vDadosIni.vCodUsuario;
              cr.Post;
              if cr.dataSet.ChangeCount > 0 then
                if not cr.Apply then
                  raiseExceptionCreate('Não foi possivel usar os créditos selecionados', '');
            end
            else
            begin
              dtSetLancTemp.Delete;
              _getTotalLancPorControle;
              rCTP.vValorAtingido := rCTP.vSaldoDinheiro + rCTP.vSaldoCredito + rCTP.vSaldoCheque;
              rCTP.vValorAInformar := rCTP.vValorOperacao - rCTP.vValorAtingido;
              exit;
            end;
          end;
        end;
        dtSetLancTemp.Next;
      end;
    finally
      dtSetLancTemp.EnableControls;
    end;
    {
    if ch.Apply then
      CommitaTransacao;
    }
    if vDadosIni.StrToFloatFormat(rCTP.vValorAtingido,2) < vDadosIni.StrToFloatFormat(rCTP.vValorOperacao,2) then
    begin
      Application.MessageBox('Valor total a pagar maior que os lançamentos efetuados.' + chr(13)
        + 'Favor lançar a diferença antes continuar.', 'Informação', MB_OK + MB_ICONINFORMATION);
      exit;
    end;
    if vDadosIni.StrToFloatFormat(rCTP.vValorAtingido,2) <= 0 then
    begin
      Application.MessageBox('Nenhum lançamento para quitação foi realizado.', 'Informação', MB_OK + MB_ICONINFORMATION);
      exit;
    end;

    //    if rCTP.vValorAtingido > rCTP.vValorOperacao then
    //    begin
    //      if Application.MessageBox('Valor dos lançamentos efetuados é maior que o valor total a pagar.' + chr(13)
    //        + 'Deseja continuar assim mesmo?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_NO then
    //        exit;
    //    end;

    if (vDadosIni.StrToFloatFormat(rCTP.vValorAInformar,2) < 0) and rCTP.vLancDiferenca then
      _abreFormLancDiferencaCTP;

    {if not vDadosIni.PesqPros('CTP001', 'CONFIRMAR',
      'Nº LOTE: ' + IntToStr(buscas.FieldByName('N_LOTE').AsInteger + 1),
      'CONTAS_A_PAGAR', 'LOTE:' + IntToStr(buscas.FieldByName('N_LOTE').AsInteger + 1), buscas, true) then
      exit;}
    FNumLoteLanc := 0;
    FDataLoteLanc := 0;
    loteLanc._abreLoteLanc;

    vNumLotePag := Gencodigo('LOTE_LANC', dtmContasAPagar.SpIncCodigo, vDadosIni.codEmpresa);

    if not vDadosIni.vEmp.vFinanceiroUnificado then
    begin
    	buscas.close;
      buscas.SQL.Text := ' select emp.cod_empresa from empresa_fisica emp ' +
        ' where emp.cod_empresa > 0 ' +
        ' and emp.cod_empresa <> ' + vDadosIni.codEmpresa;
      buscas.Open;

      if not buscas.IsEmpty then
      begin
        buscas.close;
        buscas.SQL.Text := ' select max(lot.n_lote) from empresa_fisica emp ' +
          ' inner join lote_lanc lot on lot.codigo_emp = emp.cod_empresa ' +
          ' where emp.cod_empresa > 0 ';
        buscas.Open;
      end
      else
      begin
        buscas.close;
        buscas.SQL.Text := ' select max(lot.n_lote) from lote_lanc lot ' +
          ' where lot.codigo_emp = ' + vDadosIni.codEmpresa;
        buscas.Open;
      end;

      vCodMaxBaixaPag := buscas.FieldByName('max').AsInteger + 1;

      if (vCodMaxBaixaPag > vNumLotePag) then
      begin
        buscas.close;
        buscas.SQL.Text := ' update CODIGO set valor = ' + IntToStr(vCodMaxBaixaPag) +
        	' where tabela = ''LOTE_LANC'' ' +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.ExecSQL;

        vNumLotePag := vCodMaxBaixaPag;
      end;
    end
  	else
    begin
      buscas.close;
      buscas.SQL.Text := ' select max(lot.n_lote) from lote_lanc lot ' +
        ' where lot.codigo_emp in ' + vDadosIni.vEmp.vCodigoUnificadas;
      buscas.Open;

      vCodMaxBaixaPag := buscas.FieldByName('max').AsInteger + 1;

      if (vCodMaxBaixaPag > vNumLotePag) then
      begin
        buscas.close;
        buscas.SQL.Text := ' update CODIGO set valor = ' + IntToStr(vCodMaxBaixaPag) +
        	' where tabela = ''LOTE_LANC'' ' +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.ExecSQL;

        vNumLotePag := vCodMaxBaixaPag;
      end;
    end;

    loteLanc.Insert;
    loteLanc.dataSet.FieldByName('DATA_LOTE').AsDateTime := vDadosIni.diaFFinanceiro + 1;
    loteLanc.dataSet.FieldByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
    loteLanc.dataSet.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
    loteLanc.dataSet.FieldByName('N_LOTE').AsInteger := vNumLotePag;
    result:= loteLanc.post;
    if result then
      result := loteLanc.Apply;
    if not result then
      raiseExceptionCreate(Pchar('Ocorreu um erro ao gravar o número de lote de lançamento.' + chr(13) + 'Nenhum registro sofrerá alteração.'), '');

    FNumLoteLanc := loteLanc.dataSet.FieldByName('N_LOTE').AsInteger;
    FDataLoteLanc := loteLanc.dataSet.FieldByName('DATA_LOTE').AsDateTime;
    
    for I := 0 to vListaCTP.Count - 1 do
    begin
    	if cp._abreContasCTP(
      	StrToInt(vDadosIni.getCampoPipe(vListaCTP[I], 1)),
        StrToInt(vDadosIni.getCampoPipe(vListaCTP[I], 2))) then
      begin
      	cp.Edit;
        cp.dataSet.FieldByName('LOTE_ENT').AsInteger := FNumLoteLanc;
        cp.Post;
        if cp.dataSet.ChangeCount > 0 then
          if not cp.Apply then
            raiseExceptionCreate('Não foi possivel lançar novos contas a pagar', '');
      end;
    end;

    if result then
    begin
    	if (vListaCTP.Count > 0) and (dataSet.RecordCount > 1) then
      begin
        try
        	dataSet.DisableControls;
          dataSet.First;
          while not dataSet.EOF do
          begin
          	vValorRateioCtp := vValorRateioCtp +
            	RoundTo(
              	(dataSet.FieldByName('VALOR_CTP').AsCurrency / rCTP.vValorOperacao) *
              		(rCTP.vValorOperacao - vValorCtp), -2);

            dataSet.Next;
          end;

          vValorRateioCtp := vValorEnt - vValorRateioCtp;
        finally
          dataSet.First;
          dataSet.EnableControls;
        end;
      end;

    	try
      	dataSet.DisableControls;
        dataSet.First;
        while not dataSet.EOF do
        begin
        	if baixaParcial then
          begin
          	vCodCtp     := dataSet.FieldByName('COD_CONTRP').AsInteger;
            vCodCtpOrg  := dataSet.FieldByName('COD_CONTRP_ORIG').AsInteger;
            vCodEmpresa := dataSet.FieldByName('CODIGO_EMP').AsInteger;
            vValorCtp   := dataSet.FieldByName('VALOR_CTP').AsCurrency;

            vDadosIni.vDtSetTmp.Insert;
            for I := 0 to dataSet.Fields.Count - 1 do
              vDadosIni.vDtSetTmp.FieldByName(dataSet.Fields.Fields[I].FieldName).Value := dataSet.Fields.Fields[I].Value;
            vDadosIni.vDtSetTmp.Post;
          end;

          inherited edit;
          dataSet.FieldByName('STATUS_CTP').AsString := 'QUITADO';
          dataSet.FieldByName('DATQ_CTP').AsDateTime := vDadosIni.diaFFinanceiro + 1;
          dataSet.FieldByName('LOTE').AsInteger := FNumLoteLanc;
          dataSet.FieldByName('US_BX').AsInteger := vDadosIni.vCodUsuario;
          dataSet.FieldByName('DATA_BAIXA').AsDateTime := rCTP.vDataBaixa;
          if rCTP.vNumChequeCTP <> '' then
            dataSet.FieldByName('N_CHEQ_CTP').AsString := rCTP.vNumChequeCTP;

          if (vListaCTP.Count > 0) and (dataSet.RecordCount > 0) then
          begin
            dataSet.FieldByName('VALOR_CTP_ORIG').AsCurrency := dataSet.FieldByName('VALOR_CTP').AsCurrency;

            if dataSet.RecordCount > 1 then
            begin
              dataSet.FieldByName('VALOR_CTP').AsCurrency :=
                RoundTo((dataSet.FieldByName('VALOR_CTP').AsCurrency / rCTP.vValorOperacao) *
                  (rCTP.vValorOperacao - vValorCtp), -2) +
                vDadosIni.IfThen(dataSet.RecNo = 1, RoundTo(vValorRateioCtp, - 2), 0);
            end
            else
              dataSet.FieldByName('VALOR_CTP').AsCurrency := rCTP.vValorOperacao - vValorCtp;

            dataSet.FieldByName('VL_CONTABIL').AsCurrency := dataSet.FieldByName('VALOR_CTP').AsCurrency;

            dataSet.FieldByName('VALOR_PAGO').AsCurrency := dataSet.FieldByName('VALOR_CTP').AsCurrency;
          end
          else
          begin
            if dataSet.FieldByName('VALOR_PAGO').AsCurrency = 0 then
            begin
              if baixaParcial then
              begin
              	dataSet.FieldByName('VALOR_CTP_ORIG').AsCurrency := dataSet.FieldByName('VALOR_CTP').AsCurrency;

                dataSet.FieldByName('VALOR_CTP').AsCurrency := rCTP.vValorOperacao;

                dataSet.FieldByName('VL_CONTABIL').AsCurrency := rCTP.vValorOperacao;
              end;

              if baixaParcial then
                dataSet.FieldByName('VALOR_PAGO').AsCurrency := rCTP.vValorOperacao
              else
                dataSet.FieldByName('VALOR_PAGO').AsCurrency := dataSet.FieldByName('VALOR_CTP').AsCurrency;
            end;
          end;
          dataSet.FieldByName('SELEC').AsVariant := null;
          inherited post;

          if baixaParcial then
          begin
            dataSet.Insert;
            for I := 0 to vDadosIni.vDtSetTmp.Fields.Count - 1 do
            begin
              if UpperCase(trim(vDadosIni.vDtSetTmp.Fields.Fields[I].FieldName)) = 'COD_CONTRP' then
              begin
                  dataSet.FieldByName('COD_CONTRP').AsInteger   := Gencodigo('CONTAS_A_PAGAR', dtmContasAPagar.SpIncCodigo, vDadosIni.codEmpresa);

                  vCodCtpParc := dataSet.FieldByName('COD_CONTRP').AsInteger;
								  vCodEmpresaParc := vDadosIni.vDtSetTmp.FieldByName('CODIGO_EMP').AsInteger;
              end
              else if (UpperCase(trim(vDadosIni.vDtSetTmp.Fields.Fields[I].FieldName)) = 'VALOR_CTP')
              	or (UpperCase(trim(vDadosIni.vDtSetTmp.Fields.Fields[I].FieldName)) = 'VL_CONTABIL')
                or (UpperCase(trim(vDadosIni.vDtSetTmp.Fields.Fields[I].FieldName)) = 'VALOR_CTP_ORIG') then
              begin
              		dataSet.FieldByName(vDadosIni.vDtSetTmp.Fields.Fields[I].FieldName).Value := vValorCtp - rCTP.vValorOperacao;
              end
              else if (UpperCase(trim(vDadosIni.vDtSetTmp.Fields.Fields[I].FieldName)) = 'LOTE_QUIT_PARC') then
              begin
              		dataSet.FieldByName('LOTE_QUIT_PARC').AsInteger := FNumLoteLanc;
              end
              else if (UpperCase(trim(vDadosIni.vDtSetTmp.Fields.Fields[I].FieldName)) = 'COD_CONTRP_ORIG') then
              begin
                	if vCodCtpOrg > 0 then
                  	dataSet.FieldByName('COD_CONTRP_ORIG').AsInteger := vCodCtpOrg
                  else
		                dataSet.FieldByName('COD_CONTRP_ORIG').AsInteger := vCodCtp
              end
              else if (UpperCase(trim(vDadosIni.vDtSetTmp.Fields.Fields[I].FieldName)) <> 'STATUS_CTP')
                and (UpperCase(trim(vDadosIni.vDtSetTmp.Fields.Fields[I].FieldName)) <> 'DATQ_CTP')
                and (UpperCase(trim(vDadosIni.vDtSetTmp.Fields.Fields[I].FieldName)) <> 'LOTE')
                and (UpperCase(trim(vDadosIni.vDtSetTmp.Fields.Fields[I].FieldName)) <> 'US_BX')
                and (UpperCase(trim(vDadosIni.vDtSetTmp.Fields.Fields[I].FieldName)) <> 'DATA_BAIXA')
                and (UpperCase(trim(vDadosIni.vDtSetTmp.Fields.Fields[I].FieldName)) <> 'VALOR_PAGO')
                and (UpperCase(trim(vDadosIni.vDtSetTmp.Fields.Fields[I].FieldName)) <> 'SELEC') then
              begin
                  dataSet.FieldByName(vDadosIni.vDtSetTmp.Fields.Fields[I].FieldName).Value := vDadosIni.vDtSetTmp.Fields.Fields[I].Value;
              end
            end;
            dataSet.Post;
          end;

          if baixaParcial then
          	break;

          dataSet.Next;
        end;
      finally
      	dataSet.First;
        dataSet.EnableControls;
      end;
      result := Apply;

      if baixaParcial then
      begin
      	montaSelect(' select ' + Fsql_campos + ' from contas_a_pagar ' +
         Fsql_inner +
     		Fsql_inner_pag +
     		' where contas_a_pagar.cod_contrp = ' + IntToStr(vCodCtp) +
         ' and contas_a_pagar.codigo_emp = ' + IntToStr(vCodEmpresa));
      end;

      try
        vDadosIni.vContrapartidaCTP := false;
        vDadosIni.vCodContrapartidaCTP := FNumLoteLanc;
      if result then
        result := _gravaLancamentosCTP
      else
        raiseExceptionCreate(Pchar('Ocorreu um erro ao quitar as contas seleciondas.' + chr(13) + 'Nenhum registro sofrerá alteração.'), '');
      finally
      	 if vDadosIni.vContrapartidaCTP then //Atualizar código da contrapartida
         begin
         	 try
           	 dataSet.DisableControls;
             dataSet.First;
             while not dataSet.eof do
             begin
               if (dataSet.FieldByName('SEL').AsString = 'S') then
               begin
                 dataset.Edit;
                 dataSet.FieldByName('COD_CONTRAPARTIDA_CTP').AsInteger := vDadosIni.vCodContrapartidaCTP;
                 dataset.Post;
               end;
               dataSet.next;
             end;
           finally
             dataSet.First;
             dataSet.EnableControls;
           end;
           if Apply then
            CommitaTransacao;
         end;
         vDadosIni.vContrapartidaCTP := false;
         vDadosIni.vCodContrapartidaCTP := 0;
      end;

      if vDadosIni.vContrapartidaCTPCanc then
      begin
        Result := false;
        RollBackTransacao;
      end
      else if result then
        result := CommitaTransacao
      else
        RollBackTransacao;

      if result then
      begin
      	if (baixaParcial) and (vCodCtpParc > 0) and (vCodEmpresaParc > 0) then
        begin
          montaSelect(' select ' + Fsql_campos + ' from contas_a_pagar ' +
           Fsql_inner +
     		  Fsql_inner_pag +
     		  ' where contas_a_pagar.cod_contrp = ' + IntToStr(vCodCtpParc) +
           ' and contas_a_pagar.codigo_emp = ' + IntToStr(vCodEmpresaParc));
        end
        else
	        Refresh;
          
        vDadosIni.GravaAuditoria('CTP014', 'CONFIRMAR QUITAÇÃO', 'SUCESSO', 'CONTAS_A_PAGAR', IntToStr(FNumLoteLanc), buscas);
        Application.MessageBox(Pchar('Operação Concluída Com Sucesso, Nº do Lote: '+IntToStr(FNumLoteLanc)), 'Informação', MB_OK + MB_ICONINFORMATION);
      end
      else
      begin //aqui tira seleção do campo SELEC caso não grave
        vDadosIni.GravaAuditoria('CTP014', 'CONFIRMAR QUITAÇÃO', 'FALHA', 'CONTAS_A_PAGAR', IntToStr(FNumLoteLanc), buscas);
        try
        	dataSet.DisableControls;
          dataSet.First;
          while not dataSet.eof do
          begin
            if (dataSet.FieldByName('SEL').AsString = 'S') then
            begin
              buscas.Close;
              buscas.SQL.Text := ' update contas_a_pagar set selec = null, op_cx = null ' +
                ' where cod_contrp = :cod_contrp and codigo_emp = :codigo_emp ';
              buscas.ParamByName('cod_contrp').AsInteger := dataSet.FieldByName('cod_contrp').AsInteger;
              buscas.ParamByName('codigo_emp').AsInteger := StrToInt(vDadosIni.codEmpresa);
              buscas.ExecSQL;
  //            dataSet.Edit;
  //            dataSet.FieldByName('SELEC').AsVariant := null;
  //            dataSet.FieldByName('OP_CX').AsVariant := null;
  //            dataSet.Post;
            end;
            dataSet.next;
          end;
        finally
          dataSet.First;
          dataSet.EnableControls;
        end;
//        if Apply then
          CommitaTransacao;
        refresh;
      end;
    end;
  except
    on e: exception do
    begin
      RollBackTransacao;
      try
      	dtSetLancTemp.DisableControls;
        dtSetLancTemp.First;
        while not dtSetLancTemp.Eof do
        begin
          if dtSetLancTemp.FieldByName('CODIGO_CH').AsInteger <> 0 then
          begin
            //if ch.dataSet.Locate('CODIGO_CH;CODIGO_EMP', VarArrayOf([dtSetLancTemp.FieldByName('CODIGO_CH').AsInteger, strtoint(vDadosIni.codEmpresa)]), []) then
            if ch._abreChequesCTP(
            	dtSetLancTemp.FieldByName('CODIGO_CH').AsInteger,
              dtSetLancTemp.FieldByName('CODIGO_EMP').AsInteger) then
            begin
              ch.Edit;
              ch.dataSet.FieldByName('STATUS_CX').AsVariant := NULL;
              ch.dataSet.FieldByName('OP_CX').AsVariant := null;
              ch.Post;
              if ch.dataSet.ChangeCount > 0 then
                if not ch.Apply then
                  raiseExceptionCreate('Não foi possível usar os cheques selecionados', '')
                else
                  CommitaTransacao;
            end;
          end
          else if dtSetLancTemp.FieldByName('COD_CRED').AsInteger <> 0 then
          begin
            //if ch.dataSet.Locate('CODIGO_CH;CODIGO_EMP', VarArrayOf([dtSetLancTemp.FieldByName('CODIGO_CH').AsInteger, strtoint(vDadosIni.codEmpresa)]), []) then
            if cr._abreCreditosCTP(
            	dtSetLancTemp.FieldByName('COD_CRED').AsInteger,
              dtSetLancTemp.FieldByName('CODIGO_EMP').AsInteger) then
            begin
              cr.Edit;
              cr.dataSet.FieldByName('STATUS_CX').AsVariant := NULL;
              cr.dataSet.FieldByName('OP_CX').AsVariant := null;
              cr.Post;
              if cr.dataSet.ChangeCount > 0 then
                if not cr.Apply then
                  raiseExceptionCreate('Não foi possível usar os créditos selecionados', '')
                else
                  CommitaTransacao;
            end;
          end;
          dtSetLancTemp.Next;
        end;
      finally
        dtSetLancTemp.First;
        dtSetLancTemp.EnableControls;
      end;
      {
      if ch.Apply then
        CommitaTransacao;
      }
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      vDadosIni.GravaAuditoria('CTP014', 'QUITAR CONTAS', 'Erro: ' + e.Message, 'LOTE_LANC', inttostr(FNumLoteLanc), buscas);
      registraErro('CTP014' + e.Message);
    end;
  end;
end;

function TContasAPagar._ControleBancario(pCodCtrl: integer): boolean;
begin
  result := ExecutaComandosSql(' select CODIGO_CTRL from controles ' +
    ' where contr_banc = ''S'' ' +
    ' and codigo_ctrl = ' + inttostr(pCodCtrl) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa +
    ' and ativo = 1 ');
end;

function TContasAPagar._controlesTemp: boolean;
begin
  try
    result := true;
    _listaControles(True);

    dsCtrltemp := TDataSource.Create(nil);
    dtSetCtrlTemp := TClientDataSet.Create(nil);
    dtSetCtrlTemp.Close;
    dtSetCtrlTemp.FieldDefs.Clear;
    dtSetCtrlTemp.FieldDefs.Add('CODIGO_CTRL', ftInteger, 0, false);
    dtSetCtrlTemp.FieldDefs.Add('NOME_CTRL', ftString, 35, false);
    dtSetCtrlTemp.FieldDefs.Add('SALDO_CTRL', ftFloat, 0, false);
    dtSetCtrlTemp.FieldDefs.Add('DOCS', ftString, 2, false);
    dtSetCtrlTemp.FieldDefs.Add('CONTR_BANC', ftString, 1, false);

    dtSetCtrlTemp.CreateDataSet;
    dtSetCtrlTemp.LogChanges := False; //LogChanges = False, desabilita os logs de alteração e inserção dando performance na manipulação do ClientDataset
    (dtSetCtrlTemp.FieldByName('SALDO_CTRL') as TFloatField).currency := true;

    try
    	dtSetControles.DisableControls;
      dtSetControles.First;
      while not dtSetControles.Eof do
      begin
        dtSetCtrlTemp.Append;
        dtSetCtrlTemp.FieldByName('CODIGO_CTRL').AsInteger := dtSetControles.FieldByName('CODIGO_CTRL').AsInteger;
        dtSetCtrlTemp.FieldByName('NOME_CTRL').AsString := dtSetControles.FieldByName('NOME_CTRL').AsString;
        dtSetCtrlTemp.FieldByName('DOCS').AsString := dtSetControles.FieldByName('DOCS').AsString;
        dtSetCtrlTemp.FieldByName('CONTR_BANC').AsString := dtSetControles.FieldByName('CONTR_BANC').AsString;
        dtSetCtrlTemp.FieldByName('SALDO_CTRL').AsCurrency := 0;
        dtSetCtrlTemp.Post;

        dtSetControles.Next;
      end;
    finally
      dtSetControles.EnableControls;
    end;
    dsCtrltemp.DataSet := dtSetCtrlTemp;
  except
    result := false;
  end;
end;

function TContasAPagar._dadosNContaPlcValidos(pAbreHistPadrao: Boolean): boolean;
begin
  try
    Result := False;

    buscas.Close;
    buscas.SQL.Text := 'select gc.DESC_GR,dc.DESC_DEP, pc.TIPO_CTP from p_contas pc ' +
      ' inner join grupos_ct gc on pc.grup_ct = gc.grup_ct ' +
      ' inner join depart_ct dc on gc.cod_dep = dc.cod_dep ' +
      ' where pc.n_conta_plc = :Vncontaplc ' +
      ' and pc.ativo=1';
    buscas.ParamByName('Vncontaplc').AsFloat := dataSet.FieldByName('n_conta_plc').AsFloat;
    buscas.Open;
    rCTP.vDescricaoGR := buscas.fieldbyname('DESC_GR').asstring;
    rCTP.vDescricaoDEP := buscas.fieldbyname('DESC_DEP').asstring;
    rCTP.vTipoConta := vDadosIni.retornaDescricaoTipoNumConta('S', buscas.fieldbyname('TIPO_CTP').AsString);
    buscas.Close;

    if dtSetPContas.FieldByName('STHAB').AsString = 'N' then
    begin
      Application.MessageBox('Conta Desabilitada, Tente outra.', 'Informação', MB_OK + MB_ICONINFORMATION);
      vNomeCampoErro := 'DBLookupComboBox1';
      exit;
    end;
    if dtSetPContas.FieldByName('TIPO_CTP').AsString = 'F' then
      dataSet.FieldByName('TIPO_CTP').AsString := 'F'
    else
      dataSet.FieldByName('TIPO_CTP').AsString := 'D';

    if not _validaNum_conta_plc then
      exit;

    if pAbreHistPadrao then
    begin
      if vHistPConta = nil then
        vHistPConta := THistPContas.create;
      if dataSet.State in [dsInsert, dsEdit] then
        if vHistPConta.abreEscolhaHistoricoPadrao(dataSet.FieldByName('n_conta_plc').AsFloat) then
          dataSet.FieldByName('HISTORICO_CTP').AsString := vDadosIni.vPesquisa;
    end;

    Result := True;
  finally
    if vHistPConta <> nil then
    begin
      vHistPConta.Free;
      vHistPConta := nil;
    end;
  end;
end;

procedure TContasAPagar._DBLookupComboBoxControleExit(Sender: TObject);
begin
  dtSetLancTemp.FieldByName('CODIGO_CTRL').AsInteger := dtSetControles.FieldByName('CODIGO_CTRL').AsInteger;
end;

function TContasAPagar._defineSqlAdicional(pQuitados, pNaoquitados, pDespesas, pFornecedores: boolean): boolean;
var
  I, erro: Integer;
  //  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
  vCondicaoTemp, vCampoTemp: string;
begin
  rCTP.vValor   := Trim(rCTP.vValor);
  rCTP.vValorAd := Trim(rCTP.vValorAd);
  try
    result := true;
    rCTP.vSqlAdicional := '';

    if (trim(UpperCase(CTP.rCTP.vcampo)) = 'FORM PAG') then
    	// Nao fazer nada
    else if (trim(UpperCase(CTP.rCTP.vCampo)) = 'UNIFICADA')
    	or (trim(UpperCase(CTP.rCTP.vcampo)) = 'DESCRICAO CONTA')
      or (trim(UpperCase(CTP.rCTP.vcampo)) = 'DESCRICAO GRUPO CONTA')
      or (trim(UpperCase(CTP.rCTP.vcampo)) = 'DESCRICAO DEPARTAMENTO CONTA')
    	or (trim(UpperCase(CTP.rCTP.vcampo)) = 'DESCRICAO CONTA CONTABIL')
      or (trim(UpperCase(CTP.rCTP.vcampo)) = 'CODIGO CONTA CONTABIL')
      or (trim(UpperCase(CTP.rCTP.vcampo)) = 'CONTROLE') then
    begin
      if rCTP.vCondicao = 'Igual' then
         vCondicaoTemp := '='
      else if rCTP.vCondicao = 'Maior' then
        vCondicaoTemp := '>'
      else if rCTP.vCondicao = 'Maior ou Igual' then
        vCondicaoTemp := '>='
      else if rCTP.vCondicao = 'Menor' then
        vCondicaoTemp := '<'
      else if rCTP.vCondicao = 'Menor ou Igual' then
        vCondicaoTemp := '<='
      else if rCTP.vCondicao = 'Diferente' then
        vCondicaoTemp := '<>'
      else if (rCTP.vCondicao = 'Esta contido') then
        vCondicaoTemp := 'like'
      else if (rCTP.vCondicao = 'Começa') then
        vCondicaoTemp := 'Começa'
      else
        vCondicaoTemp := '=';

     if (trim(UpperCase(CTP.rCTP.vCampo)) = 'UNIFICADA') then
       vCampoTemp := 'empresa.identificacao_emp'
     else if (trim(UpperCase(CTP.rCTP.vcampo)) = 'DESCRICAO CONTA') then
       vCampoTemp := 'p_contas.desc_plc'
     else if (trim(UpperCase(CTP.rCTP.vcampo)) = 'DESCRICAO GRUPO CONTA') then
        vCampoTemp := 'grupos_ct.desc_gr'
     else if (trim(UpperCase(CTP.rCTP.vcampo)) = 'DESCRICAO DEPARTAMENTO CONTA') then
        vCampoTemp := 'depart_ct.desc_dep'
     else if (trim(UpperCase(CTP.rCTP.vcampo)) = 'DESCRICAO CONTA CONTABIL') then
       vCampoTemp := 'p_contas_contabil.nome_cta'
     else if (trim(UpperCase(CTP.rCTP.vcampo)) = 'CODIGO CONTA CONTABIL') then
       vCampoTemp := 'p_contas_contabil.cod_cta'
     else if (trim(UpperCase(CTP.rCTP.vcampo)) = 'CONTROLE') then
       vCampoTemp := 'controles.nome_ctrl';
     rCTP.vCampo := 'Todos';

     if vCondicaoTemp = 'like' then
       rCTP.vsqlAdicional := rCTP.vsqlAdicional + ' and ' + vCampoTemp + ' like ' + QuotedStr('%' + rCTP.vValor + '%')
     else if vCondicaoTemp = 'Começa' then
       rCTP.vsqlAdicional := rCTP.vsqlAdicional +  ' and ' + vCampoTemp + ' like ' + QuotedStr(rCTP.vValor + '%')
     else
       rCTP.vsqlAdicional := rCTP.vsqlAdicional +  ' and ' + vCampoTemp + ' ' + vCondicaoTemp + ' ' +QuotedStr(rCTP.vValor);
    end;
    if (pQuitados = pNaoquitados) then
    else
    begin
      if pNaoquitados then
        rCTP.vSqlAdicional := rCTP.vSqlAdicional + ' and (contas_a_pagar.status_CTP is null or contas_a_pagar.status_CTP = '''') '
      else
        rCTP.vSqlAdicional := rCTP.vSqlAdicional + ' and not contas_a_pagar.status_CTP is null ';
    end;
    if (pDespesas = pFornecedores) then
    else
    begin
      if pDespesas then
        rCTP.vSqlAdicional := rCTP.vSqlAdicional + ' and contas_a_pagar.tipo_ctp = ''D'' '
      else
        rCTP.vSqlAdicional := rCTP.vSqlAdicional + ' and contas_a_pagar.tipo_ctp = ''F'' ';
    end;

    if rCTP.vAdicional then
    begin
    	if (trim(UpperCase(rCTP.vCampoAd)) = 'FORM PAG') then
      	// Nao fazer nada
      else
      begin
        rCTP.vValorAd := UpperCase(rCTP.vValorAd);
        if rCTP.vPorDataAd then
        begin
          try
            erro := 0;
            StrToDate(rCTP.vDataIniAd);
          except
            rCTP.vDataIniAd := '';
            erro := erro + 1;
          end;
          try
            StrToDate(rCTP.vDataFimAd);
          except
            rCTP.vDataFimAd := '';
            erro := erro + 1;
          end;
          if erro = 2 then
          begin
            Application.MessageBox('Data adicional Inválida. Informe no mínimo uma data correta',
              'Atenção', MB_OK + MB_ICONINFORMATION);
          end
          else
          begin
            if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
              formatodata := 'mm/dd/yyyy'
            else if pos('.', ShortDateFormat) <> 0 then
              formatodata := 'dd.mm.yyyy';
            if rCTP.vDataIniAd <> '' then
              rCTP.vDataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(rCTP.vDataIniAd)));
            if rCTP.vDataFimAd <> '' then
              rCTP.vDataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(rCTP.vDataFimAd)));
          end;
        end
        else if rCTP.vValorAd = '' then
          exit;
        if rCTP.vCondicaoAd = 'Igual' then
          rCTP.vCondicaoAd := '='
        else if rCTP.vCondicaoAd = 'Maior' then
          rCTP.vCondicaoAd := '>'
        else if rCTP.vCondicaoAd = 'Maior ou Igual' then
          rCTP.vCondicaoAd := '>='
        else if rCTP.vCondicaoAd = 'Menor' then
          rCTP.vCondicaoAd := '<'
        else if rCTP.vCondicaoAd = 'Menor ou Igual' then
          rCTP.vCondicaoAd := '<='
        else if rCTP.vCondicaoAd = 'Diferente' then
          rCTP.vCondicaoAd := '<>'
        else if (rCTP.vCondicaoAd = 'Esta contido') then
          rCTP.vCondicaoAd := 'like'
        else if (rCTP.vCondicaoAd = 'Começa') then
          rCTP.vCondicaoAd := 'Começa'
        else
          rCTP.vCondicaoAd := '=';
        for I := 0 to dataSet.FieldCount - 1 do
        begin
          if Dataset.Fields[I].FieldKind = fkData then
          begin
            if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(rCTP.vCampoAd) then
            begin
              try
              rCTP.vCampoAd := DataSet.Fields[I].FieldName;
              if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
                (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
                ((rCTP.vCondicaoAd = 'Começa') or (rCTP.vCondicaoAd = 'Começa')) then
              begin
                if ((Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField)) then
                try
                  strtoint(rCTP.vValorAd);
                except
                  Application.MessageBox(PChar('Valor para consulta adicional inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
                  result := false;
                  exit;
                end
                else if ((Dataset.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField)) then
                try
                  strtofloat(rCTP.vValorAd);
                except
                  Application.MessageBox(PChar('Valor para consulta adicional inválido.' + chr(13) + 'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) + 'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
                  result := false;
                  exit;
                end;
                rCTP.vCondicaoAd := '=';
                rCTP.vValorAd := vDadosIni.trocaVirgulaPorPonto(rCTP.vValorAd);
              end
              else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
              begin
                if (rCTP.vDataIniAd <> '') and (rCTP.vDataFimAd <> '') then
                  rCTP.vSqlAdicional := rCTP.vsqlAdicional + ' and contas_a_pagar.' + rCTP.vCampoAd + ' >= ' + rCTP.vDataIniAd +
                    ' and ' +
                    rCTP.vCampoAd + ' <= ' + rCTP.vDataFimAd
                else if (rCTP.vDataFimAd <> '') then
                  rCTP.vsqlAdicional := rCTP.vsqlAdicional + ' and contas_a_pagar.' + rCTP.vCampoAd + ' <= ' + rCTP.vDataFimAd
                else if (rCTP.vDataIniAd <> '') and (rCTP.vDataFimAd <> '') then
                  rCTP.vsqlAdicional := rCTP.vsqlAdicional + ' and contas_a_pagar.' + rCTP.vCampoAd + ' >= ' + rCTP.vDataIniAd;
                Break;
              end;
              if rCTP.vCondicaoAd = 'like' then
                rCTP.vsqlAdicional := rCTP.vsqlAdicional + ' and contas_a_pagar.' + rCTP.vCampoAd + ' like ' + QuotedStr('%' +
                  rCTP.vValorAd +
                  '%')
              else if rCTP.vCondicaoAd = 'Começa' then
                rCTP.vsqlAdicional := rCTP.vsqlAdicional + ' and contas_a_pagar.' + rCTP.vCampoAd + ' like ' +
                  QuotedStr(rCTP.vValorAd + '%')
              else
                rCTP.vsqlAdicional := rCTP.vsqlAdicional + ' and contas_a_pagar.' + rCTP.vCampoAd + ' ' + rCTP.vCondicaoAd + ' ' +
                  QuotedStr(rCTP.vValorAd);
              finally
               if (UpperCase(rCTP.vCampoAd) = 'IDENTIFICACAO_EMP') then
                  rCTP.vsqlAdicional := StringReplace(rCTP.vsqlAdicional, 'contas_a_pagar.identificacao_emp', 'empresa.identificacao_emp', [rfIgnoreCase, rfReplaceAll])
               else if (UpperCase(rCTP.vCampoAd) = 'DESC_PLC') then
                  rCTP.vsqlAdicional := StringReplace(rCTP.vsqlAdicional, 'contas_a_pagar.desc_plc', 'p_contas.desc_plc', [rfIgnoreCase, rfReplaceAll])
               else if (UpperCase(rCTP.vCampoAd) = 'DESC_GR') then
                  rCTP.vsqlAdicional := StringReplace(rCTP.vsqlAdicional, 'contas_a_pagar.desc_gr', 'grupos_ct.desc_gr', [rfIgnoreCase, rfReplaceAll])
               else if (UpperCase(rCTP.vCampoAd) = 'DESC_DEP') then
                  rCTP.vsqlAdicional := StringReplace(rCTP.vsqlAdicional, 'contas_a_pagar.desc_dep', 'depart_ct.desc_dep', [rfIgnoreCase, rfReplaceAll])
               else if (UpperCase(rCTP.vCampoAd) = 'NOME_CTA') then
                  rCTP.vsqlAdicional := StringReplace(rCTP.vsqlAdicional, 'contas_a_pagar.nome_cta', 'p_contas_contabil.nome_cta', [rfIgnoreCase, rfReplaceAll])
               else if (UpperCase(rCTP.vCampoAd) = 'COD_CTA') then
                  rCTP.vsqlAdicional := StringReplace(rCTP.vsqlAdicional, 'contas_a_pagar.cod_cta', 'p_contas_contabil.cod_cta', [rfIgnoreCase, rfReplaceAll])
               else if (UpperCase(rCTP.vCampoAd) = 'NOME_CTRL') then
                  rCTP.vsqlAdicional := StringReplace(rCTP.vsqlAdicional, 'contas_a_pagar.nome_ctrl', 'controles.nome_ctrl', [rfIgnoreCase, rfReplaceAll]);
              end;
              Break;
            end;
          end;
        end;
      end;
    end; //adicional
  finally
    if Pos('and', Copy(trim(rCTP.vsqlAdicional), 1, 3)) > 0 then
      rCTP.vsqlAdicional := Copy(trim(rCTP.vsqlAdicional), 4, Length(trim(rCTP.vsqlAdicional)));
  end;
end;

function TContasAPagar._definirContasPadrao: boolean;
begin
  try
    result := true;
    buscas.Close;
    buscas.SQL.Text := 'select * from cont_lig cl where cod_emp = ' + vDadosIni.codEmpresa;
    buscas.Open;

    rCTP.vNumContaPadraoCH := buscas.FieldByName('ncon_s_chq').AsFloat;
    rCTP.vNumContaPadraoCR := buscas.FieldByName('ncon_s_crd').AsFloat;
    rCTP.vNumContaPadraoDif := buscas.FieldByName('NCON_LANCDIFCTP').AsFloat;
    rCTP.numContaCompraProd := buscas.FieldByName('ncon_c_prod').AsFloat;
    rCtp.numCtrlCompra:=buscas.FieldByName('CONTR_C_PROD').asinteger;
    rCTP.vnumcontaicm:=buscas.FieldByName('CONTA_ICM').AsFloat;
    rCTP.vnumcontapiscofins:=buscas.FieldByName('CONTA_PIS').AsFloat;
    rCTP.vnumcontacveic:=buscas.FieldByName('Ncon_C_Veic').AsFloat;
    buscas.Close;
    //  rCTP.numContaVendaProd := buscas.FieldByName('ncon_v_prod').AsFloat;

    //  rCTP.numContaJuros := buscas.FieldByName('ncon_j_prest').AsFloat;
    //  rCTP.numContaDesconto := buscas.FieldByName('ncon_d_prest').AsFloat;
  except
    result := false;
  end;
end;

function TContasAPagar._definirDataSetQuitacaoCTP: Boolean;
var
  I, J: Integer;
  vOK: Boolean;

begin
  Result := True;

  if fQuitacaoCTP <> nil then
    Exit;

  fQuitacaoCTP := TClientDataSet.Create(Application);
  fDsQuitacaoCTP := TDataSource.Create(Application);
  fDsQuitacaoCTP.DataSet := fQuitacaoCTP;
  fDsQuitacaoCTP.AutoEdit := False;

  fQuitacaoCTP.FieldDefs.Clear;
  fQuitacaoCTP.FieldDefs.Add('CADCTP', ftString, 1, false);
  fQuitacaoCTP.FieldDefs.Add('CADLANC', ftString, 1, false);
  fQuitacaoCTP.FieldDefs.Add('TIPO', ftString, 2, false);
  fQuitacaoCTP.FieldDefs.Add('VALOR_L', ftCurrency, 0, false);
  fQuitacaoCTP.FieldDefs.Add('NOMECTRL', ftString, 35, false);
  fQuitacaoCTP.FieldDefs.Add('HIST', ftString, 30, false);
  fQuitacaoCTP.FieldDefs.Add('NDOC_L', ftString, 20, false);
  fQuitacaoCTP.FieldDefs.Add('VENCIMENTO', ftDateTime, 0, false);
  fQuitacaoCTP.FieldDefs.Add('HISTORICO_L', ftString, 60, false);
  fQuitacaoCTP.FieldDefs.Add('NUMCONTASAIDA', ftFloat, 0, false);
  //Lancamentos
  fQuitacaoCTP.FieldDefs.Add('TIPO_L', ftString, 1, false);
  fQuitacaoCTP.FieldDefs.Add('DATA', ftDateTime, 0, false);
//  fQuitacaoCTP.FieldDefs.Add('DTREFERENCIA', ftDateTime, 0, false);
//  fQuitacaoCTP.FieldDefs.Add('VL_CONTABIL', ftCurrency, 0, false);
  fQuitacaoCTP.FieldDefs.Add('SAIDA_PROC_AUTO', ftString, 1, false); // S: Sim, para fazer as saidas dos cartoes; N: Nao faz lancamentos de saida, apenas os de entrada
//  fQuitacaoCTP.FieldDefs.Add('ARQ_EXTRATO_ADM', ftString, 255, false); // Para gravar o arquivo da conciliacao do cartao que possui o ajuste
//  fQuitacaoCTP.FieldDefs.Add('COD_ADM', ftInteger, 0, false);//Codigo da adm do cartao para usar junto do campo acima no estorno
  for I := 0 to dtmContasAPagar.cdsContaAPagar.FieldDefs.Count - 1 do
  try
    fQuitacaoCTP.FieldDefs.Add(
      dtmContasAPagar.cdsContaAPagar.FieldDefs[i].Name,
      dtmContasAPagar.cdsContaAPagar.FieldDefs[i].DataType,
      dtmContasAPagar.cdsContaAPagar.FieldDefs[i].Size, False);
  except
  end;

  try
    fQuitacaoCTP.CreateDataSet;
  except
  end;

  for I := 0 to fQuitacaoCTP.FieldCount - 1 do
    if fQuitacaoCTP.Fields[i] is TDateTimeField then
      TDateTimeField(fQuitacaoCTP.Fields[i]).EditMask := '!99/99/0000;1;_'
    else if fQuitacaoCTP.Fields[i] is TFloatField then
      TFloatField(fQuitacaoCTP.Fields[i]).DisplayFormat := '##0.00';

  TFloatField(fQuitacaoCTP.FindField('N_CONTA_PLC')).DisplayFormat := '';
  fQuitacaoCTP.IndexFieldNames := 'TIPO';
end;

function TContasAPagar._deletarLancTemp: boolean;
begin
  result := false;
  if dtSetLancTemp.IsEmpty then
    exit;
  if not vDadosIni.PesqPros('CTP016', 'EXCLUIR', '', 'LANCAMENTOS', '', buscas, true) then
    Exit;
  if Application.MessageBox('Deseja realmente apagar o lançamento selecionado?', 'Excluir Registro', MB_YESNO + MB_DEFBUTTON1 + MB_ICONQUESTION) = IDYES then
  begin
    dtSetLancTemp.Delete;
    _getTotalLancPorControle;
    rCTP.vValorAtingido := rCTP.vSaldoDinheiro + rCTP.vSaldoCredito + rCTP.vSaldoCheque;
    rCTP.vValorAInformar := rCTP.vValorOperacao - rCTP.vValorAtingido;
    result := true;
  end;
end;


procedure TContasAPagar._desmarcarDocumentoComoPagando;
var
  vDoc, vUsuario: string;
  vPointer: Pointer;
  vSelecionado: boolean;
begin
  try

    if Application.MessageBox(pchar(
      'Os documentos selecionados ainda não quitados serão desmarcados. Deseja mesmo continuar?'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

    if not vDadosIni.PesqPros('CTP023', 'ALTERAR', '' , 'CONTAS_A_PAGAR',
      '', buscas, True) then
        Exit;

    vPointer := dataSet.GetBookmark;

    vSelecionado := false;

    try
    	dataSet.DisableControls;
      dataSet.first;
      while not dataSet.Eof do
      begin

        if dataSet.FieldByName('selec').AsString = 'S' then
        begin
          vSelecionado := true;
          
          FCodigo := dataSet.FieldByName('cod_contrp').AsInteger;
          vDoc := Trim('Documento de número ' + dataSet.FieldByName('n_doc_ctp').AsString);

          dataSet.RefreshRecord;

          if (dataSet.FieldByName('OP_CX').AsInteger <> vDadosIni.vCodUsuario) and
             (trim(dataSet.FieldByName('Status_ctp').AsString) <> 'QUITADO') then
          begin  //jc
            vUsuario:= retornaValor('select col.nome_vendedor as valor from colaborador col '+
              ' where col.cod_vendedor='+IntToStr(dataSet.FieldByName('OP_CX').AsInteger)+
              ' and col.cod_empresa='+vDadosIni.codEmpresa);
            if Application.MessageBox(pchar(vDoc + ' já começou a ser quitado pelo usuário ' + #13 +
                IntToStr(dataSet.FieldByName('OP_CX').AsInteger) +' - '+vUsuario+chr(13)+
                'Deseja desmarcar este documento assim mesmo?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
            begin
              if vDadosIni.PesqPros('CTP025', 'ALTERAR', '' , 'CONTAS_A_PAGAR', '', buscas, True) then
              begin
                dataSet.Edit;
                dataSet.FieldByName('SELEC').Value := Null;
                dataSet.FieldByName('OP_CX').Value := Null;
                dataSet.FieldByName('DATA_DESM').AsDateTime := vDadosIni.getDataBanco(buscas);
                dataSet.FieldByName('OP_DESM').AsInteger := vDadosIni.vCodUsuario;
                dataSet.Post;
                vDadosIni.GravaAuditoria('CTP025', 'ALTERAR',vDoc, 'CONTAS_A_PAGAR', IntToStr(FCodigo)+'/'+vDoc, buscas);
              end;
            end;
          end
          else if trim(dataSet.FieldByName('Status_ctp').AsString) <> 'QUITADO' then
          begin
              dataSet.Edit;
              dataSet.FieldByName('SELEC').Value := Null;
              dataSet.FieldByName('OP_CX').Value := Null;
              dataSet.FieldByName('DATA_DESM').AsDateTime := vDadosIni.getDataBanco(buscas);
              dataSet.FieldByName('OP_DESM').AsInteger := vDadosIni.vCodUsuario;
              dataSet.Post;
              vDadosIni.GravaAuditoria('CTP023', 'ALTERAR', vDoc, 'CONTAS_A_PAGAR', IntToStr(FCodigo)+'/'+vDoc, buscas);
          end;
        end;
        dataSet.next;
      end;
    finally
      dataSet.first;
      dataSet.EnableControls;
    end;

    if not vSelecionado then
    begin
      Application.MessageBox(pchar('Nenhum documento selecionado, favor selecionar'), 'Atenção', 0 + 64);
      exit;
    end;

    if dataSet.ChangeCount = 0 then
      exit;

    if Apply then
    begin

      CommitaTransacao;

      vDadosIni.GravaAuditoria('CTP023', 'ALTERAR', 'CONFIRMADA MODIFICACOES', 'CONTAS_A_PAGAR', '', buscas);

      Application.MessageBox(pchar('Processo concluído'), 'Atenção', 0 + 64);


    end;

    dataSet.GotoBookmark(vPointer);

  except
    on e: exception do
    begin
      RollBackTransacao;
      dataSet.Refresh;
      Application.MessageBox(pchar('Erro: ' + e.Message + #13 + ' CONTAS_A_PAGAR'), 'Atenção', 0 + 64);
      registraErro('procedure TContasAPagar._desmarcarDocumentoComoPagando. Erro: ' + e.Message + ' CONTAS_A_PAGAR ');
    end;
  end;
end;

procedure TContasAPagar._desmarcaTodasAsLinhas;
begin
  try
    if IsEmpty then
      exit;
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desmarcando todos os registros');

    try
    	dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if dataSet.FieldByName('sel').AsString = 'S' then
        begin
          dataSet.Edit;
          dataSet.FieldByName('sel').AsString := '';
  //        dataSet.FieldByName('op_cx').AsVariant:=null;
          FTotalContasSelecionadas := FTotalContasSelecionadas - 1;
          dataSet.Post;
        end;
        dataSet.Next;
      end;
    finally
      dataSet.First;
      dataSet.EnableControls;
    end;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TContasAPagar._efetuarPagamentoCTP: Boolean;
var
  indexTemp: string;
  vUsuario: string;
  vCodCtp, vCodEmpresa: Integer;
  vRegSel: boolean;
	v2RegSel: boolean;
begin
  try
    result := false;
    CTP.rCTP.vNumChequeCTP := '';
    if not vDadosIni.PesqPros('CTP004', 'QUITAR', '', 'CONTAS_A_PAGAR', '', CTP.buscas, true) then
      exit;
    _definirContasPadrao;
    vDadosIni.definirDiaFinanceiroFechado(buscas);
    indexTemp := dataSet.IndexName;

    if baixaParcial then
    begin
    	vCodCtp     := dataSet.FieldByName('COD_CONTRP').AsInteger;
      vCodEmpresa := dataSet.FieldByName('CODIGO_EMP').AsInteger;
      
      try
      	vRegSel := false;
        v2RegSel := false;

      	dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
        	if (not vRegSel) and (dataSet.FieldByName('SEL').AsString = 'S') then
          begin
            vRegSel := true;
            vCodCtp     := dataSet.FieldByName('COD_CONTRP').AsInteger;
			      vCodEmpresa := dataSet.FieldByName('CODIGO_EMP').AsInteger;
          end
          else if (vRegSel) and (dataSet.FieldByName('SEL').AsString = 'S') then
          begin
            v2RegSel := true;
            break;
          end;

          dataSet.Next;
        end;
      finally
        dataSet.First;
      	dataSet.EnableControls;
      end;

      if v2RegSel then
      begin
        Application.MessageBox(PChar('Favor selecionar somente um registro para utilizar a quitação parcial.'), 'Aviso', MB_OK +
           MB_ICONWARNING + MB_DEFBUTTON1);
        exit;
      end;

    	dataSet.Filtered := false;
      dataSet.Filter := 'COD_CONTRP = ' + IntToStr(vCodCtp) +
      	' AND CODIGO_EMP = ' + IntToStr(vCodEmpresa);
      dataSet.Filtered := true;

    	dataSet.Edit;
    	dataSet.FieldByName('SEL').AsString   := 'S';
      dataSet.Post;

      dataSet.Filtered := false;
      dataSet.Filter := 'SEL = ''S'' ';
      dataSet.Filtered := true;

    	if trim(dataSet.FieldByName('Status_ctp').AsString) = 'QUITADO' then
      begin
        Application.MessageBox('Nenhuma conta ainda não quitada foi selecionada para pagamento', 'Informação', MB_OK + MB_ICONINFORMATION);
        exit;
      end
    	else if ExecutaComandosSql('select ctp.cod_contrp from contas_a_pagar ctp ' +
      	' where ctp.cod_contrp = ' + IntToStr(dataSet.FieldByName('cod_contrp').AsInteger) +
        ' and selec = ''S'' ' +
        ' and ctp.codigo_emp = ' + vDadosIni.codEmpresa) then
      begin
        vUsuario:= retornaValor('select ctp.OP_CX||'' - ''||col.nome_vendedor as valor from contas_a_pagar ctp '+
          ' inner join colaborador col on ctp.OP_CX = col.cod_vendedor and ctp.codigo_emp = col.cod_empresa' +
          ' where ctp.cod_contrp = ' + IntToStr(dataSet.FieldByName('cod_contrp').AsInteger) +
          ' and ctp.codigo_emp = ' + vDadosIni.codEmpresa);
        Application.MessageBox(Pchar('A conta código ' + IntToStr(dataSet.FieldByName('cod_contrp').AsInteger) +
        	', documento número ' + trim(dataSet.FieldByName('N_DOC_CTP').AsString) +
          ' já está sendo alterada por outro usuário.' + chr(13) + vUsuario + chr(13) +
          'A mesma será desmarcada.'), 'Informação', MB_OK + MB_ICONINFORMATION);
        exit;
      end;

      rCTP.vValorOperacao := 0;
      rCTP.vValorAtingido := 0;
      rCTP.vValorPrevisto := 0;
      rCTP.vSomaValorContabil := 0;

      if dataSet.FieldByName('VALOR_PAGO').AsCurrency = 0 then
        rCTP.vValorOperacao := rCTP.vValorOperacao + dataSet.FieldByName('Valor_ctp').AsCurrency
      else
        rCTP.vValorOperacao := rCTP.vValorOperacao + dataSet.FieldByName('VALOR_PAGO').AsCurrency;

      rCTP.vValorPrevisto := rCTP.vValorPrevisto + dataSet.FieldByName('Valor_ctp').AsCurrency;

      if trim(dataSet.FieldByName('N_CHEQ_CTP').AsString) <> '' then
        rCTP.vNumChequeCTP := trim(dataSet.FieldByName('N_CHEQ_CTP').AsString);
      rCTP.vSomaValorContabil := rCTP.vSomaValorContabil + dataSet.FieldByName('VL_CONTABIL').AsCurrency;

      rCTP.vValorAInformar := rCTP.vValorOperacao;

      if (dataSet.FieldByName('SEL').AsString = 'S') then
      begin
      	dataSet.Edit;
        dataSet.FieldByName('SELEC').AsString := 'S';
        dataSet.FieldByName('OP_CX').AsInteger:=vDadosIni.vCodUsuario;
        dataSet.Post;
      end;

      if Apply then
	      CommitaTransacao;
    end
    else
    begin
      dataSet.Filtered := false;
      dataSet.Filter := 'SEL=''S'' ';
      dataSet.Filtered := true;

      try
      	dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
          if trim(dataSet.FieldByName('Status_ctp').AsString) = 'QUITADO' then
            _marcaDesmarcaLinha //aqui pelo filtro já dá um next
          else if ExecutaComandosSql('select ctp.cod_contrp from contas_a_pagar ctp ' +
            ' where ctp.cod_contrp = ' + IntToStr(dataSet.FieldByName('cod_contrp').AsInteger) +
            ' and selec = ''S'' ' +
            ' and ctp.codigo_emp = ' + vDadosIni.codEmpresa) then
          begin
            vUsuario:= retornaValor('select ctp.OP_CX||'' - ''||col.nome_vendedor as valor from contas_a_pagar ctp '+
              ' inner join colaborador col on ctp.OP_CX = col.cod_vendedor and ctp.codigo_emp = col.cod_empresa' +
              ' where ctp.cod_contrp = ' + IntToStr(dataSet.FieldByName('cod_contrp').AsInteger) +
              ' and ctp.codigo_emp = ' + vDadosIni.codEmpresa);
            Application.MessageBox(Pchar('A conta código ' + dataSet.FieldByName('cod_contrp').AsString +
              ', documento número ' + trim(dataSet.FieldByName('N_DOC_CTP').AsString) +
              ' já está sendo alterada por outro usuário.' + chr(13) + vUsuario + chr(13) +
              'A mesma será desmarcada.'), 'Informação', MB_OK + MB_ICONINFORMATION);
            _marcaDesmarcaLinha;
          end
          else
            dataSet.Next;
        end;
      finally
      	dataSet.First;
        dataSet.EnableControls;
      end;

      if IsEmpty then
      begin
        Application.MessageBox('Nenhuma conta ainda não quitada foi selecionada para pagamento', 'Informação', MB_OK + MB_ICONINFORMATION);
        dataSet.Filtered := false;
        dataSet.CancelUpdates;
        Refresh;
        exit;
      end
      else
      begin
        rCTP.vValorOperacao := 0;
        rCTP.vValorAtingido := 0;
        rCTP.vValorPrevisto := 0;
        rCTP.vSomaValorContabil := 0;
        try
        	dataSet.DisableControls;
        	dataSet.First;
          while not dataSet.eof do
          begin
            if dataSet.FieldByName('VALOR_PAGO').AsCurrency = 0 then
              rCTP.vValorOperacao := rCTP.vValorOperacao + dataSet.FieldByName('Valor_ctp').AsCurrency
            else
              rCTP.vValorOperacao := rCTP.vValorOperacao + dataSet.FieldByName('VALOR_PAGO').AsCurrency;

            rCTP.vValorPrevisto := rCTP.vValorPrevisto + dataSet.FieldByName('Valor_ctp').AsCurrency;

            if trim(dataSet.FieldByName('N_CHEQ_CTP').AsString) <> '' then
              rCTP.vNumChequeCTP := trim(dataSet.FieldByName('N_CHEQ_CTP').AsString);
            rCTP.vSomaValorContabil := rCTP.vSomaValorContabil + dataSet.FieldByName('VL_CONTABIL').AsCurrency;
            dataSet.Next;
          end;
        finally
        	dataSet.First;
          dataSet.EnableControls;
        end;
        rCTP.vValorAInformar := rCTP.vValorOperacao;
      end;

      try
      	dataSet.DisableControls;
	      dataSet.First;
        while not dataSet.eof do
        begin
          if (dataSet.FieldByName('SEL').AsString = 'S') then
          begin
            dataSet.Edit;
            dataSet.FieldByName('SELEC').AsString := 'S';
            dataSet.FieldByName('OP_CX').AsInteger:=vDadosIni.vCodUsuario;
            dataSet.Post;
          end;
          dataSet.next;
        end;
      finally
      	dataSet.First;
        dataSet.EnableControls;
      end;
      if Apply then
        CommitaTransacao;
    end;

    if not _abreFormDadosParaBaixa then
     exit;
    _listaPContas;
    rCTP.vNumContaPadrao :=dataSet.FieldByName('N_CONTA_PLC').AsFloat;
    _listaPContas(FrmCadContasAPagar.DBLookupComboBox2, FrmCadContasAPagar.DBEdit21);

    if _controlesTemp and _lancamentosTemp then
    begin
      _getTotalLancPorControle;
      result := _abreFormQuitarCTP;
    end;
  finally
    dataSet.Filtered := false;
    dataSet.Filter := '';
    dataSet.Filtered := true;
    dataSet.IndexName := indexTemp;
    if (dtSetCtrlTemp <> nil) and not dtSetCtrlTemp.IsEmpty then
      dtSetCtrlTemp.EmptyDataSet;
    if (dtSetPContasTemp <> nil) and not dtSetPContasTemp.IsEmpty then
      dtSetPContasTemp.EmptyDataSet;
    if (dtSetLancTemp <> nil) and not dtSetLancTemp.IsEmpty then
      dtSetLancTemp.EmptyDataSet;

    dtSetCtrlTemp.Free;
    dtSetCtrlTemp:=nil;
    dsCtrltemp.Free;
    dsCtrltemp:=nil;
    dtSetPContasTemp.Free;
    dtSetPContasTemp:=nil;
    dsPContasTemp.Free;
    dsPContasTemp:=nil;
    rCTP.vTipoCNT := '';
  end;
end;

function TContasAPagar._efetuaValidacaoCH: boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select op_cx, STATUS_CX, datq_ch from controle_cheque' +
    ' where codigo_ch = ' + IntToStr(ch.dataSet.FieldByName('codigo_ch').AsInteger) +
    ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    IntToStr(ch.dataSet.FieldByName('codigo_emp').AsInteger), vDadosIni.codEmpresa);
  buscas.Open;
  Result := not (((buscas.FieldByName('STATUS_CX').AsString = 'R') or
    (Trim(buscas.FieldByName('datq_ch').AsString) <> '')) and
    (buscas.FieldByName('OP_CX').AsInteger<>vDadosIni.vCodUsuario));

  try

    if Result then
      Exit;

    if (Trim(buscas.FieldByName('datq_ch').AsString) <> '') then
      Application.MessageBox(PChar
        ('Cheque código ' + Trim(ch.dataset.FieldByName('codigo_ch').AsString) +
        ' já está quitado. Data: ' + buscas.FieldByName('datq_ch').AsString + chr(13) + 'O mesmo será excluído dos lançamentos feitos.' +
        chr(13) + 'Favor corrigir os lançamentos antes de continuar.'),
        'Atenção', 0 + 64)
    else if (buscas.FieldByName('op_cx').AsInteger > 0) then
      Application.MessageBox(PChar
        ('Cheque código ' + Trim(ch.dataset.FieldByName('codigo_ch').AsString) +
        ' já está sendo quitado ou modificado pelo Financeiro ' +
        'pelo usuário de código: ' + buscas.FieldByName('op_cx').AsString + chr(13) + 'O mesmo será excluído dos lançamentos feitos.' +
        chr(13) + 'Favor corrigir os lançamentos antes de continuar.'), 'Atenção', 0 + 64)
    else
      Application.MessageBox(PChar
        ('Cheque código ' + Trim(ch.dataset.FieldByName('codigo_ch').AsString) +
        ' já está sendo quitado ou modificado pelo Financeiro' + chr(13)
        + 'O mesmo será excluído dos lançamentos feitos.' +
        chr(13) + 'Favor corrigir os lançamentos antes de continuar.'), 'Atenção', 0 + 64);

  finally
    buscas.Close;
  end;
end;

function TContasAPagar._efetuaValidacaoCr: boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select op_cx, STATUS_CX, datq_c from controle_creditos' +
    ' where cod_cred = ' + IntToStr(cr.dataSet.FieldByName('cod_cred').AsInteger) +
    ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    IntToStr(cr.dataSet.FieldByName('codigo_emp').AsInteger), vDadosIni.codEmpresa);
  buscas.Open;
  Result := not (((buscas.FieldByName('STATUS_CX').AsString = 'R') or
    (Trim(buscas.FieldByName('datq_c').AsString) <> '')) and
    (buscas.FieldByName('OP_CX').AsInteger<>vDadosIni.vCodUsuario));

  try

    if Result then
      Exit;

    if (Trim(buscas.FieldByName('datq_c').AsString) <> '') then
      Application.MessageBox(PChar
        ('Crédito código ' + Trim(cr.dataset.FieldByName('cod_cred').AsString) +
        ' já está quitado. Data: ' + buscas.FieldByName('datq_c').AsString + chr(13) + 'O mesmo será excluído dos lançamentos feitos.' +
        chr(13) + 'Favor corrigir os lançamentos antes de continuar.'),
        'Atenção', 0 + 64)
    else if (buscas.FieldByName('op_cx').AsInteger > 0) then
      Application.MessageBox(PChar
        ('Crédito código ' + Trim(cr.dataset.FieldByName('cod_cred').AsString) +
        ' já está sendo quitado ou modificado pelo Financeiro ' +
        'pelo usuário de código: ' + buscas.FieldByName('op_cx').AsString + chr(13) + 'O mesmo será excluído dos lançamentos feitos.' +
        chr(13) + 'Favor corrigir os lançamentos antes de continuar.'), 'Atenção', 0 + 64)
    else
      Application.MessageBox(PChar
        ('Crédito código ' + Trim(cr.dataset.FieldByName('cod_cred').AsString) +
        ' já está sendo quitado ou modificado pelo Financeiro' + chr(13)
        + 'O mesmo será excluído dos lançamentos feitos.' +
        chr(13) + 'Favor corrigir os lançamentos antes de continuar.'), 'Atenção', 0 + 64);

  finally
    buscas.Close;
  end;
end;

function TContasAPagar._estornarPagamento(pLote_lanc: integer; pData_lanc: TDateTime): boolean;
begin
  result := false;

  if not vDadosIni.PesqPros('CTP013', 'ESTORNAR PAGAMENTO', '', 'LOTE_LANC', inttostr(pLote_lanc), FBuscas2, false) then
    Exit;

  if loteLanc.dataSet.FieldByName('STATUS').AsString = 'CANCELADO' then
  begin
    Application.MessageBox(Pchar('Lote número ' + inttostr(pLote_lanc) + ' já foi estornado.'), 'Informação', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  if Application.MessageBox(Pchar('Deseja mesmo estornar o pagamento referente ao lote de número: ' + inttostr(pLote_lanc) + '?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDNO then
    exit;

  if vDadosIni.vEmp.vFinanceiroUnificado then
  begin
    FBuscas2.Close;
    FBuscas2.SQL.Text := 'select lote_lanc.n_lote, lote_lanc.codigo_emp, lote_lanc.data_lote from lote_lanc ' +
    	' left join empresa on lote_lanc.codigo_emp = empresa.cod_empresa ' +
      ' where lote_lanc.n_lote = ' + inttostr(pLote_lanc) +
      ' and lote_lanc.data_lote = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', pData_lanc)) +
      ' and (case when(empresa.financeiro_unificado = ''S'') then empresa.codigo_unificadora else lote_lanc.codigo_emp end) = ' + vDadosIni.codEmpresa;
    FBuscas2.Open;

    if not FBuscas2.IsEmpty then
      if FBuscas2.FieldByName('codigo_emp').AsInteger <> vDadosIni.cod_empresa then
      begin
        Application.MessageBox(PChar('Estorno do pagamento não pode ser feito' + #13 +
          'Lote de pagamento foi gerado pela empresa ' + IntToStr(FBuscas2.FieldByName('codigo_emp').AsInteger)), 'Atenção', MB_OK + MB_ICONINFORMATION);
        exit;
      end;
  end;

  try
    vDadosIni.definirDiaFinanceiroFechado(FBuscas2);

    // Financeiro sendo fechado
    if vDadosIni.financeiroFechando(FBuscas2) then
      Exit;

    vDadosIni.abreStatusProcessamento('', 'Estornando Pagamento');
    try

      FBuscas2.Close;
      FBuscas2.SQL.Text := ' select count(*) valor from controle_cheque ' +
        ' where cod_contrapartida_ctp = ' + IntToStr(pLote_lanc) +
        ' and codigo_emp = ' + vDadosIni.codEmpresa +
        ' and not datq_ch is null';
      FBuscas2.Open;

      if FBuscas2.FieldByName('valor').AsInteger > 0 then
      begin
        Application.MessageBox(PChar('Estorno do pagamento não pode ser feito' + #13 +
          'Cheque(s) usado(s) na quitação da contrapartida já foi quitado ou devolvido'), 'Atenção', MB_OK + MB_ICONINFORMATION);
        exit;
      end;

      FBuscas2.Close;
      FBuscas2.SQL.Text := ' select count(*) valor from baixa_creditos ' +
        ' where cod_contrapartida_ctp = ' + IntToStr(pLote_lanc) +
        ' and codigo_emp = ' + vDadosIni.codEmpresa;
      FBuscas2.Open;

      if FBuscas2.FieldByName('valor').AsInteger > 0 then
      begin
        Application.MessageBox(PChar('Estorno do pagamento não pode ser feito' + #13 +
          'Crédito(s) usado(s) na quitação da contrapartida já foi quitado ou devolvido'), 'Atenção', MB_OK + MB_ICONINFORMATION);
        exit;
      end;

      FBuscas2.Close;
      FBuscas2.SQL.Text := ' select count(*) valor from controle_creditos ' +
        ' where cod_contrapartida_ctp = ' + IntToStr(pLote_lanc) +
        ' and codigo_emp = ' + vDadosIni.codEmpresa +
        ' and not datq_c is null';
      FBuscas2.Open;

      if FBuscas2.FieldByName('valor').AsInteger > 0 then
      begin
        Application.MessageBox(PChar('Estorno do pagamento não pode ser feito' + #13 +
          'Crédito(s) usado(s) na quitação da contrapartida já foi baixado ou devolvido'), 'Atenção', MB_OK + MB_ICONINFORMATION);
        exit;
      end;

      FBuscas2.Close;
      FBuscas2.SQL.Text := ' select count(*) valor from contas_a_pagar ' +
      	' where codigo_emp = ' + vDadosIni.codEmpresa +
        ' and lote_ent = ' + inttostr(pLote_lanc) +
        ' and not datq_ctp is null ';
      FBuscas2.Open;

      if FBuscas2.FieldByName('valor').AsInteger > 0 then
      begin
        Application.MessageBox(PChar('Estorno do pagamento não pode ser feito' + #13 +
          'A Conta a pagar gerada pela quitação já foi quitada, ' +
          'favor estornar a(s) quitação(ões) da(s) conta(s) gerada(s) através desta conta a pagar'), 'Atenção', MB_OK + MB_ICONINFORMATION);
        exit;
      end;

      FBuscas2.Close;
      FBuscas2.SQL.Text := ' select count(*) valor from contas_a_pagar ' +
      	' where codigo_emp = ' + vDadosIni.codEmpresa +
        ' and lote_quit_parc = ' + inttostr(pLote_lanc) +
        ' and not datq_ctp is null ';
      FBuscas2.Open;

      if FBuscas2.FieldByName('valor').AsInteger > 0 then
      begin
        Application.MessageBox(PChar('Estorno do pagamento não pode ser feito' + #13 +
          'A Conta a pagar gerada pela quitação parcial já foi quitada, ' +
          'favor estorna a última quitação parcial gerada desta conta a pagar'), 'Atenção', MB_OK + MB_ICONINFORMATION);
        exit;
      end;

      FBuscas2.Close;
      FBuscas2.SQL.Text := 'select data_lote from lote_lanc ' +
      	' where codigo_emp = ' + vDadosIni.codEmpresa +
        ' and n_lote = ' + inttostr(pLote_lanc);
      FBuscas2.Open;
      if FBuscas2.FieldByName('data_lote').AsDateTime < vDadosIni.diaFFinanceiro + 1 then
      begin
        Application.MessageBox(Pchar('Data ' + QuotedStr(FormatDateTime('dd/mm/yyyy', FBuscas2.FieldByName('data_lote').AsDateTime)) + ' do lote ' + inttostr(pLote_lanc) + ' não corresponde ao dia do financeiro aberto.' + chr(13) + 'O estorno não poderá ser realizado.'), 'Informação', MB_OK + MB_ICONINFORMATION);
        exit;
      end;

      // estornar renegociacao
      FBuscas2.Close;
      FBuscas2.SQL.Text := ' update contas_a_pagar ctp ' +
      	' set ' +
        '		ctp.valor_ctp = coalesce(ctp.valor_ctp_orig, 0),  ' +
        ' 	ctp.vl_contabil = coalesce(ctp.valor_ctp_orig, 0) ' +
        ' where ctp.codigo_emp = ' + vDadosIni.codEmpresa +
        ' and ctp.lote = ' + IntToStr(pLote_lanc) +
        ' and (select count(*) from contas_a_pagar ctp2 ' +
        '      where ctp2.codigo_emp = ' + vDadosIni.codEmpresa +
        '      and ctp2.lote_ent = ' + IntToStr(pLote_lanc) + ') > 0 ';
      FBuscas2.ExecSQL;

      // estornar quitacao parcial
      FBuscas2.Close;
      FBuscas2.SQL.Text := ' update contas_a_pagar ctp ' +
      	' set ' +
        '		ctp.valor_ctp = coalesce(ctp.valor_ctp_orig, 0),  ' +
        ' 	ctp.vl_contabil = coalesce(ctp.valor_ctp_orig, 0) ' +
        ' where ctp.codigo_emp = ' + vDadosIni.codEmpresa +
        ' and ctp.lote = ' + IntToStr(pLote_lanc) +
        ' and (select count(*) from contas_a_pagar ctp2 ' +
        '      where ctp2.codigo_emp = ' + vDadosIni.codEmpresa +
        '      and ctp2.lote_quit_parc = ' + IntToStr(pLote_lanc) + ') > 0 ';
      FBuscas2.ExecSQL;
//      FBuscas2.SQL.Text := ' update contas_a_pagar ctp ' +
//      	' set ' +
//        '		ctp.valor_ctp = coalesce(ctp.valor_ctp, 0) + ' +
//        ' 		coalesce(( ' +
//        '   		select sum(coalesce(ctp2.valor_ctp, 0)) from contas_a_pagar ctp2 ' +
//        '     	where ctp2.codigo_emp = ' + vDadosIni.codEmpresa +
//        '     	and ctp2.lote_quit_parc = ' + IntToStr(pLote_lanc) + '), 0),  ' +
//        ' 	ctp.vl_contabil = coalesce(ctp.vl_contabil, 0) + ' +
//        ' 		coalesce(( ' +
//        '   		select sum(coalesce(ctp2.vl_contabil, 0)) from contas_a_pagar ctp2 ' +
//        '     	where ctp2.codigo_emp = ' + vDadosIni.codEmpresa +
//        '     	and ctp2.lote_quit_parc = ' + IntToStr(pLote_lanc) + '), 0) ' +
//        ' where ctp.codigo_emp = ' + vDadosIni.codEmpresa +
//        ' and ctp.lote = ' + IntToStr(pLote_lanc);
//      FBuscas2.ExecSQL;

      FBuscas2.Close;
      FBuscas2.SQL.Text := ' delete from contas_a_pagar ' +
	      ' where codigo_emp = ' + vDadosIni.codEmpresa +
        ' and lote_ent = ' + IntToStr(pLote_lanc);
      FBuscas2.ExecSQL;

      FBuscas2.Close;
      FBuscas2.SQL.Text := ' delete from contas_a_pagar ' +
	      ' where codigo_emp = ' + vDadosIni.codEmpresa +
        ' and lote_quit_parc = ' + IntToStr(pLote_lanc);
      FBuscas2.ExecSQL;
      
      // estorno contrapartida
      buscas.Close;
      buscas.SQL.Text := 'select codigo_ch from controle_cheque ' +
      	' where codigo_emp = ' + vDadosIni.codEmpresa +
        ' and cod_contrapartida_ctp = ' + IntToStr(pLote_lanc);
      buscas.Open;

      buscas.First;
      while not buscas.Eof do
      begin
        FBuscas2.Close;
        FBuscas2.SQL.Text := ' delete from lanccheque' +
          ' where CODIGO_CH = ' + IntToStr(buscas.FieldByName('CODIGO_CH').AsInteger) +
          ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
        FBuscas2.ExecSQL;

	      buscas.Next;
      end;

      buscas.Close;
      buscas.SQL.Text := ' select cod_cred from controle_creditos ' +
      	' where codigo_emp = ' + vDadosIni.codEmpresa +
        ' and cod_contrapartida_ctp = ' + IntToStr(pLote_lanc);
      buscas.Open;

      buscas.First;
      while not buscas.Eof do
      begin
        FBuscas2.Close;
        FBuscas2.SQL.Text := ' delete from creditos_lanc ' +
          ' where COD_CRED = ' + IntToStr(buscas.FieldByName('COD_CRED').AsInteger) +
          ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
        FBuscas2.ExecSQL;

	      buscas.Next;
      end;

      FBuscas2.Close;
      FBuscas2.SQL.Text := ' delete from lancamentos ' +
      	' where codigo_emp = ' + vDadosIni.codEmpresa +
        ' and cod_contrapartida_ctp = ' + IntToStr(pLote_lanc);
      FBuscas2.ExecSQL;

      FBuscas2.Close;
      FBuscas2.SQL.Text := ' delete from controle_creditos ' +
      	' where codigo_emp = ' + vDadosIni.codEmpresa +
        ' and cod_contrapartida_ctp = ' + IntToStr(pLote_lanc);
      FBuscas2.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := ' delete from controle_cheque ' +
      	' where codigo_emp = ' + vDadosIni.codEmpresa +
        ' and cod_contrapartida_ctp = ' + IntToStr(pLote_lanc);
      buscas.ExecSQL;

      // estorno pagamento
      FBuscas2.Close;
      FBuscas2.SQL.Text := ' delete from lancamentos ' +
      	' where codigo_emp = ' + vDadosIni.codEmpresa +
        ' and lote = ' + IntToStr(pLote_lanc);
      FBuscas2.ExecSQL;

      FBuscas2.Close;
      FBuscas2.SQL.Text := ' update contas_a_pagar ' +
        ' set status_ctp = null, datq_ctp = null, lote = null, ' +
        ' data_baixa = null, op_cx = null, us_bx = null, valor_pago = null, ' +
        ' cod_contrapartida_ctp = null ' +
        ' where codigo_emp = ' + vDadosIni.codEmpresa +
        ' and lote = ' + IntToStr(pLote_lanc);
      FBuscas2.ExecSQL;
      
      FBuscas2.Close;
      FBuscas2.SQL.Text := ' update controle_cheque ' +
        ' set status_ch = null, datq_ch = null, cod_emp_lote = null, lote = null, us_bx = null, ' +
        ' obs_ch = :obs_ch, tip_baixa = null ' +
        ' where lote = ' + IntToStr(pLote_lanc) +
        ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_lote', 'codigo_emp') +
				' = ' + vDadosIni.codEmpresa;
      FBuscas2.ParamByName('obs_ch').AsString := Copy('CHEQUE ESTORNADO OPERADOR ' +
        IntToStr(vDadosIni.vCodUsuario) + ' LOTE_LANC ' + IntToStr(pLote_lanc), 1, 60);
      FBuscas2.ExecSQL;

      FBuscas2.Close;
      FBuscas2.SQL.Text := ' update controle_creditos ' +
        ' set status_c = null, datq_c = null, cod_emp_lote = null, lote = null, US_BX = null, ' +
        ' obs_c = :obs_c, tip_baixa = null ' +
        ' where lote = ' + IntToStr(pLote_lanc) +
        ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_lote', 'codigo_emp') +
				' = ' + vDadosIni.codEmpresa;
      FBuscas2.ParamByName('obs_c').AsString := Copy('CRÉDITO ESTORNADO OPERADOR ' +
        IntToStr(vDadosIni.vCodUsuario) + ' LOTE_LANC ' + IntToStr(pLote_lanc), 1, 60);
      FBuscas2.ExecSQL;

      buscas.Close;
      buscas.SQL.Text :=
        ' select bc.codigo_emp, bc.seq_bxcred, bc.cod_cred, bc.tp_operacao, cc.status_c, bc.valor_para_estorno, ' +
        ' bc.valor_c valor_c_bx, cc.valor_c valor_c_cc, cc.valor_liquido, c.barrar_automatico, ' +
        ' cc.vl_contabil vl_contabil_cc, bc.vl_contabil vl_contabil_bc, bc.valor_para_estorno_ctb ' +
        ' from baixa_creditos bc ' +
        ' inner join controle_creditos cc on cc.cod_cred = bc.cod_cred and cc.codigo_emp = bc.codigo_emp ' +
        ' left join controles c on bc.codigo_ctrl = c.codigo_ctrl and bc.codigo_emp = c.codigo_emp ' +
        ' where bc.lote = ' + IntToStr(pLote_lanc) +
        ' and bc.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_lote', 'codigo_emp') +
        ' = ' + vDadosIni.codEmpresa;
      buscas.Open;

      buscas.First;
      while not buscas.Eof do
      begin
        FBuscas2.Close;
        FBuscas2.SQL.Text := ' delete from baixa_creditos ' +
          ' where seq_bxcred = ' + IntToStr(buscas.FieldByName('seq_bxcred').AsInteger) +
          ' and cod_cred = ' + IntToStr(buscas.FieldByName('cod_cred').AsInteger) +
          ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_lote', 'codigo_emp') +
          ' = ' + vDadosIni.codEmpresa;
//          ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
//	        IntToStr(buscas.FieldByName('codigo_emp').AsInteger), vDadosIni.codEmpresa);
        FBuscas2.ExecSQL;

        buscas.Next;
      end;

      FBuscas2.Close;
      FBuscas2.SQL.Text := ' update lote_quit set status = ''CANCELADO'' ' +
        ' where n_lote_quit = ' + IntToStr(pLote_lanc) +
        ' and codigo_emp = ' + vDadosIni.codEmpresa;
      FBuscas2.ExecSQL;

      FBuscas2.Close;
      FBuscas2.SQL.Text := ' update lote_lanc set status = ''CANCELADO'' ' +
      	' where codigo_emp = ' + vDadosIni.codEmpresa +
        ' and n_lote = ' + inttostr(pLote_lanc);
      FBuscas2.ExecSQL;

      result := CommitaTransacao;
      if Result then
      begin
        lanc.buscas.Close;
        lanc.buscas.Open;
        ch.buscas.Close;
        ch.buscas.Open;
        cr.buscas.Close;
        cr.buscas.Open;
        cp.buscas.Close;
        cp.buscas.Open;
        ctp.buscasCTP.Close;
        ctp.buscasCTP.Open;
        buscas.Close;
        buscas.Open;
        loteLanc.Refresh;
        Refresh;
        FTotalContasSelecionadas := 0;
      end;
    except on e: exception do
      begin
      result := false;
      RollBackTransacao;
        Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
	      registraErro('function TEstornarRecibo.estornarValeCompra Erro: ' + e.Message);
    end;
    end;
  finally
    if result then
      vDadosIni.GravaAuditoria('CTP013', 'ESTORNAR PAGAMENTO', 'SUCESSO ', 'LOTE_LANC', inttostr(pLote_lanc), FBuscas2)
    else
      vDadosIni.GravaAuditoria('CTP013', 'ESTORNAR PAGAMENTO', 'FALHA ', 'LOTE_LANC', inttostr(pLote_lanc), FBuscas2);
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TContasAPagar._excluirCTP: boolean;
var
  codigoCTP,ndocctp,nomectp, vcodigosCTP:string;

  function validarExclusaoQuitacaoParcial: Boolean;
  begin
  	Result := False;
    if (dataSet.FieldByName('LOTE_QUIT_PARC').AsInteger > 0) then
    begin
    	if Application.MessageBox(Pchar('Deseja apagar contas a pagar gerada por quitação parcial!' +
      	#13 + #13 + 'Deseja continuar assim mesmo?'), 'Confirmação', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) <> IDYES then
        exit;

      if not vDadosIni.PesqPros('CTP041', 'EXCLUIR', 'COD_CONTRP: ' + dataSet.FieldByName('COD_CONTRP').AsString +
      	' NUM DOC: ' + dataSet.FieldByName('N_DOC_CTP').AsString+' '+dataSet.FieldByName('NOME_FOR_CTP').AsString,
      	'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+dataSet.FieldByName('N_DOC_CTP').AsString, buscas, true) then
      	exit;
    end;
  	Result := True;
  end;

  function validarExclusao: Boolean;
  begin
    Result := False;
    if trim(dataSet.FieldByName('Status_ctp').AsString) = 'QUITADO' then
    begin
      Application.MessageBox(Pchar('A conta código ' + dataSet.FieldByName('cod_contrp').AsString + ', ducumento número ' + trim(dataSet.FieldByName('N_DOC_CTP').AsString) + ' já está quitada.' + chr(13) + 'Este registro não será excluído'), 'Informação', MB_OK + MB_ICONINFORMATION);
      exit;
    end
    else if ExecutaComandosSql('select ctp.cod_contrp from contas_a_pagar ctp where ctp.cod_contrp=' + dataSet.FieldByName('cod_contrp').AsString + ' and selec=''S'' and ctp.codigo_emp=' + vDadosIni.codEmpresa) then
    begin
      Application.MessageBox(Pchar('A conta código ' + dataSet.FieldByName('cod_contrp').AsString + ', ducumento número ' + trim(dataSet.FieldByName('N_DOC_CTP').AsString) + ' já está sendo alterada por outro usuário.' + chr(13) + 'Este registro não será excluído.'), 'Informação', MB_OK + MB_ICONINFORMATION);
      exit;
    end
    else if dataSet.FieldByName('NUM_NOTA_NFE').AsInteger > 0 then
    begin
      if Application.MessageBox(Pchar('Deseja apagar contas a pagar vinculada a nota fiscal!' +
      	#13 + 'Num NF: ' + IntToStr(dataSet.FieldByName('NUM_NOTA_NFE').AsInteger) + ' Serie: ' + dataSet.FieldByName('SERIE').AsString +
      	#13 + #13 + 'Deseja continuar assim mesmo?'), 'Confirmação', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION) <> IDYES then
        exit;

      if not vDadosIni.PesqPros('CTP034', 'EXCLUIR', 'COD_CONTRP: ' + dataSet.FieldByName('COD_CONTRP').AsString +
        ' NUM DOC: ' + dataSet.FieldByName('N_DOC_CTP').AsString+' '+dataSet.FieldByName('NOME_FOR_CTP').AsString +
        ' NUM NF: ' + IntToStr(dataSet.FieldByName('NUM_NOTA_NFE').AsInteger) + ' SERIE: ' + dataSet.FieldByName('SERIE').AsString,
        'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+dataSet.FieldByName('N_DOC_CTP').AsString, buscas, true) then
        exit;

      if not validarExclusaoQuitacaoParcial then
      	exit;
    end
    else if (dataSet.FieldByName('LOTE_QUIT_PARC').AsInteger > 0) then
    begin
    	if not validarExclusaoQuitacaoParcial then
      	exit;
    end;
    Result := True;
  end;
begin
  try
    result := false;

    if Application.MessageBox(Pchar('Deseja apagar registros marcados?'), 'Confirmação', MB_YESNO + MB_DEFBUTTON1 + MB_ICONQUESTION) = IDYES then
    begin

      if not vDadosIni.PesqPros('CTP002', 'EXCLUIR', '', 'CONTAS_A_PAGAR', '', buscas, true) then
        Exit;
      try
        dataSet.Filter := 'SEL = ''S''';
        dataSet.Filtered := True;
        vcodigosCTP := '';

        while dataSet.FieldByName('sel').AsString = 'S' do
        begin
          if validarExclusao then
          begin
            vcodigosCTP := vcodigosCTP + IntToStr(dataSet.FieldByName('COD_CONTRP').AsInteger) + ',';
            vDadosIni.GravaAuditoria('CTP002', 'EXCLUIR', 'CONTA COD_CONTRP: ' +
              dataSet.FieldByName('COD_CONTRP').AsString +
              ' NUM DOC: ' + trim(dataSet.FieldByName('N_DOC_CTP').AsString) + ' ' +
              trim(dataSet.FieldByName('NOME_FOR_CTP').AsString),
              'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString + '/' + trim(dataSet.FieldByName('N_DOC_CTP').AsString)
              , buscas);
          end;
//          else
          begin
            dataSet.Edit;
            dataSet.FieldByName('sel').AsString := '';
            dataSet.Post;
          end;
        end;

        
        if vcodigosCTP = '' then
        begin
          Application.MessageBox('Nenhum registro marcado!', 'Atenção', 0 + 64 );
          Exit;
        end;

        if Application.MessageBox('Deseja mesmo continuar?', 'Confirmação', MB_YESNO + MB_DEFBUTTON1 + MB_ICONQUESTION) <> IDYES then
        begin
          vDadosIni.GravaAuditoria('CTP002', 'EXCLUIR', 'DESISTENCIA', 'CONTAS_A_PAGAR', '', buscas);
          Exit;
        end;

      finally
        dataSet.Filter := '';
        dataSet.Filtered := False;
      end;

      vcodigosCTP := Copy(vcodigosCTP, 1, Length(vcodigosCTP) - 1);

      buscas.Close;
      buscas.SQL.Text := ' delete from contas_a_pagar ' +
        ' where cod_contrp in (' + vcodigosCTP + ')' +
        ' and codigo_emp = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;

      Result := CommitaTransacao;
      if Result then
        vDadosIni.GravaAuditoria('CTP002', 'EXCLUIR', 'SUCESSO',
          'CONTAS_A_PAGAR', '', buscas)
      else
        vDadosIni.GravaAuditoria('CTP002', 'EXCLUIR', 'FALHA',
          'CONTAS_A_PAGAR', '', buscas);
//      dataSet.Refresh;
      Exit;
    end;

    if not vDadosIni.PesqPros('CTP002', 'EXCLUIR', 'COD_CONTRP: ' + dataSet.FieldByName('COD_CONTRP').AsString +
      ' NUM DOC: ' + dataSet.FieldByName('N_DOC_CTP').AsString+' '+dataSet.FieldByName('NOME_FOR_CTP').AsString,
      'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+dataSet.FieldByName('N_DOC_CTP').AsString, buscas, true) then
      Exit;

    codigoCTP := dataSet.FieldByName('COD_CONTRP').AsString;
    ndocctp := trim(dataSet.FieldByName('N_DOC_CTP').AsString);
    nomectp := trim(dataSet.FieldByName('NOME_FOR_CTP').AsString);
    Screen.Cursor := crHourGlass;
    if Application.MessageBox(Pchar('Deseja realmente apagar conta código ' + dataSet.FieldByName('cod_contrp').AsString + ', ducumento número ' + trim(dataSet.FieldByName('N_DOC_CTP').AsString)), 'Confirmação', MB_YESNO + MB_DEFBUTTON1 + MB_ICONQUESTION) = IDYES then
    begin
      if not validarExclusao then
        Exit;

      Result := delete;
      if Result then
        Result := Apply;
      if Result then
        Result := CommitaTransacao;
      if Result then
        vDadosIni.GravaAuditoria('CTP002', 'EXCLUIR', 'SUCESSO: COD_CONTRP: ' + codigoCTP +
          ' NUM DOC: ' + ndocctp + ' ' + nomectp,
          'CONTAS_A_PAGAR', codigoCTP+'/'+ndocctp, buscas)
      else
        vDadosIni.GravaAuditoria('CTP002', 'EXCLUIR', 'FALHA: COD_CONTRP: ' + codigoCTP +
          ' NUM DOC: ' + ndocctp + ' ' + nomectp,
          'CONTAS_A_PAGAR', codigoCTP + '/' + ndocctp, buscas)
    end;
  finally
    dataSet.Refresh;
    Screen.Cursor := crDefault;
  end;
end;

procedure TContasAPagar._exibriSomatorio(grid: TDBGrid);
var
  vSomaSelecionados, vSomaSelecionadosQt, vSomaSelecionadosNQt, vSomaNaoQuitados, vSomaQuitados: currency;
  vPointer: Pointer;
begin
  if dataSet.IsEmpty then
    exit;
  if vDadosIni.PesqPros('CTP005', 'SOMATORIO', '', 'CONTAS_A_PAGAR', '', buscas, true) then
  begin
    try
      vDadosIni.abreStatusProcessamento('', 'Realizando somatório das contas a pagar...');
      Screen.Cursor := crHourGlass;
      vPointer := dataSet.GetBookmark;
      vSomaNaoQuitados := 0.00;
      vSomaQuitados := 0.00;
      vSomaSelecionadosNQt := 0.00;
      vSomaSelecionadosQt := 0.00;
      vSomaSelecionados := 0.00;
      try
      	dataSet.DisableControls;
        dataSet.First;
        while not dataSet.EOF do
        begin
          if trim(dataSet.FieldByName('Status_ctp').AsString) = '' then
            vSomaNaoQuitados := vSomaNaoQuitados + dataSet.FieldByName('Valor_ctp').AsCurrency
          else
            vSomaQuitados := vSomaQuitados + dataSet.FieldByName('Valor_ctp').AsCurrency;
          //          if grid.SelectedRows.CurrentRowSelected then
          if dataSet.FieldByName('SEL').AsString = 'S' then
          begin
            if trim(dataSet.FieldByName('Status_ctp').AsString) = '' then
              vSomaSelecionadosNQt := vSomaSelecionadosNQt + dataSet.FieldByName('Valor_ctp').AsCurrency
            else
              vSomaSelecionadosQt := vSomaSelecionadosQt + dataSet.FieldByName('Valor_ctp').AsCurrency;
            vSomaSelecionados := vSomaSelecionados + dataSet.FieldByName('Valor_ctp').AsCurrency;
            //            else
            //              grid.SelectedRows.CurrentRowSelected := false;
          end;
          dataSet.next;
        end;
      finally
        dataSet.First;
        dataSet.EnableControls;
      end;
    finally
      Screen.Cursor := crDefault;
      dataSet.GotoBookmark(vPointer);
      vDadosIni.fechaStatusProcessamento;
      Application.MessageBox(Pchar(
        'Valor das Contas Não quitadas: ' + format('%m', [vSomaNaoQuitados]) + #13 +
        'Valor das Contas quitadas....: ' + format('%m', [vSomaQuitados]) + #13 +
        'Valor das Contas Selecionadas ainda não quitadas: ' + format('%m', [vSomaSelecionadosNQt]) + #13 +
        'Valor das Contas Selecionadas quitadas.............: ' + format('%m', [vSomaSelecionadosQt]) + #13 +
        'Valor das Contas Selecionadas........................: ' + format('%m', [vSomaSelecionados])),
        'Somatório das Contas', MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

function TContasAPagar._existeContasPagar: boolean;
begin
 Result := true;

 if dataSet.FieldByName('NUM_NOTA_NFE').AsInteger < 0 then
   exit;

 buscas.Close;
 buscas.SQL.Text:='select * from Contas_a_Pagar ' +
  ' WHERE COD_FORN_NFE = :COD_FORN_NFE ' +
  ' AND NUM_NOTA_NFE = :NUM_NOTA_NFE ' +
  ' AND N_DOC_CTP = :N_DOC_CTP ' +
  ' AND SERIE = :SERIE ' +
  ' AND CODIGO_EMP = :CODIGO_EMP ';
 buscas.Params.ParamByName('COD_FORN_NFE').AsInteger := dataSet.FieldByName('COD_FORN_NFE').Value;
 buscas.Params.ParamByName('NUM_NOTA_NFE').AsInteger := dataSet.FieldByName('NUM_NOTA_NFE').AsInteger;
 buscas.Params.ParamByName('N_DOC_CTP').AsString := dataSet.FieldByName('N_DOC_CTP').AsString;
 buscas.Params.ParamByName('SERIE').AsString := dataSet.FieldByName('SERIE').AsString;
 buscas.Params.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
 buscas.open;
 if not buscas.IsEmpty then
 begin
   if dataSet.State = dsInsert then
     Result := False
   else
   begin
     if dataSet.FieldByName('COD_CONTRP').AsInteger <> buscas.FieldByName('COD_CONTRP').AsInteger then
       Result := False;
   end;
 end;
end;

function TContasAPagar._existeControle(pControle: Integer; pCodEmpMult: Integer): Boolean;
var
  vControle: Integer;
begin
  Result := False;

  if pControle > 0 then
    vControle := pControle
  else if dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0 then
    vControle := dataSet.FieldByName('CODIGO_CTRL').AsInteger
  else
    vControle := 0;

  buscas.Close;
  buscas.SQL.Text := ' select codigo_ctrl from controles' +
    ' where codigo_ctrl = :codigo_ctrl ' +
    ' and codigo_emp = :codigo_emp ' +
    ' and ativo = 1 ' +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, ' and (coalesce(controle_visivel, ''S'') = ''S'') ', '');
  buscas.ParamByName('codigo_ctrl').AsInteger := vControle;
  buscas.ParamByName('codigo_emp').AsInteger := vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
  	pCodEmpMult, StrToInt(vDadosIni.codEmpresa));
  buscas.Open;

  Result := not buscas.IsEmpty;

  buscas.Close;
end;

function TContasAPagar._existePContas(pNContaPlc: Double;
  vtp: smallint): Boolean;
var
  vNContaPlc: Double;
begin
  Result := False;
  if pNContaPlc > 0 then
    vNContaPlc := pNContaPlc
  else if dataSet.FieldByName('n_conta_plc').AsFloat > 0 then
    vNContaPlc := dataSet.FieldByName('n_conta_plc').AsFloat
  else
    vNContaPlc := 0;

  if vNContaPlc = 0 then
    Exit;
  if vtp = 1 then
  begin
   buscas.Close;
   buscas.SQL.Text :=
     'SELECT n_conta_plc FROM p_contas WHERE n_conta_plc = :n_conta_plc';
   buscas.ParamByName('n_conta_plc').AsFloat := vNContaPlc;
   buscas.Open;
   Result := not buscas.IsEmpty;
  end
  else
  begin
   buscas.Close;
   buscas.SQL.Text :=
     'SELECT p.n_conta_plc,gr.tipo_gr,p.tipo_plc FROM p_contas p,grupos_ct gr WHERE p.n_conta_plc = :n_conta_plc and '+
     'p.grup_ct = gr.grup_ct' ;
   buscas.ParamByName('n_conta_plc').AsFloat := vNContaPlc;
   buscas.Open;
   if not buscas.IsEmpty then
   begin
    if (buscas.FieldByName('TIPO_GR').AsString = 'D') and (buscas.FieldByName('TIPO_PLC').AsString = 'S')  then
    begin
     if not vDadosIni.PesqPros('LANC030', 'INCLUIR', '', 'CONTAS_A_PAGAR', '',dtmContasAPagar.qrBuscas2, True) then
       result:=False
     else
      result:=true;
    end
    else
     result:=true;
   end
   else
    result:=false;
  end;
  buscas.Close;
end;

function TContasAPagar._getTotalLancPorControle: boolean;
var
  i: integer;
begin
	try
  	dtSetCtrlTemp.DisableControls;
    dtSetCtrlTemp.First;
    while not dtSetCtrlTemp.eof do
    begin
      dtSetCtrlTemp.Edit;
      dtSetCtrlTemp.FieldByName('SALDO_CTRL').AsCurrency := 0;
      dtSetCtrlTemp.Post;

      dtSetCtrlTemp.Next;
    end;
  finally
    dtSetCtrlTemp.EnableControls;
  end;
  rCTP.vSaldoDinheiro := 0;
  rCTP.vSaldoCredito := 0;
  rCTP.vSaldoCheque := 0;
  try
  	dtSetCtrlTemp.DisableControls;
    dtSetLancTemp.First;
    while not dtSetLancTemp.Eof do
    begin
      if dtSetCtrlTemp.Locate('CODIGO_CTRL', dtSetLancTemp.FieldByName('CODIGO_CTRL').AsInteger, []) then
      begin
        dtSetCtrlTemp.Edit;
        dtSetCtrlTemp.FieldByName('SALDO_CTRL').AsCurrency := dtSetCtrlTemp.FieldByName('SALDO_CTRL').AsCurrency + dtSetLancTemp.FieldByName('VALOR_L').AsCurrency;
        dtSetCtrlTemp.Post;
        if dtSetCtrlTemp.FieldByName('DOCS').AsString = 'N' then
          rCTP.vSaldoDinheiro := rCTP.vSaldoDinheiro + dtSetLancTemp.FieldByName('VALOR_L').AsCurrency
        else if dtSetCtrlTemp.FieldByName('DOCS').AsString = 'S1' then
          rCTP.vSaldoCheque := rCTP.vSaldoCheque + dtSetLancTemp.FieldByName('VALOR_L').AsCurrency
        else
          rCTP.vSaldoCredito := rCTP.vSaldoCredito + dtSetLancTemp.FieldByName('VALOR_L').AsCurrency;
      end;
      dtSetLancTemp.Next;
    end;
  finally
    dtSetCtrlTemp.First;
    dtSetCtrlTemp.EnableControls;
  end;
end;

function TContasAPagar._gravaLancamentosCTP(pProcessamentoAutomatico:boolean): boolean;
var
  vCampoLanc: string;
  vValorLanc: string;
  vQtdeCamposLanc: Integer;
  vCtrlTemp: integer;
  vLancL: TLancamentosImp;
  vContLigL: TContaLigacaoImp;
  vHistPadraoUnificadas: string;
  vValorAtingidoSemCreditos: double;///  o valor atingido sem créditos vai ser usado para o rateio do valor contabil,
                                   ///  pois os créditos ja possuem os valores contabeis deles, o valor contabil do cr é
                                   ///  diminuido do contabil da conta, a saida do crédito vai usar o contabil do crédito
                                   ///  a saida do resto será o que restou sem os créditos

  vValorAtingidoSemCheques: double;///  o valor atingido sem cheques vai ser usado para o rateio do valor contabil,
                                   ///  pois os cheques ja possuem os valores contabeis deles, o valor contabil do ch é
                                   ///  diminuido do contabil da conta, a saida do cheque vai usar o contabil do cheque
                                   ///  a saida do resto será o que restou sem os cheques
begin
  try
    result := false;
    vValorAtingidoSemCheques := 0;
    vValorAtingidoSemCreditos := 0;
    if not pProcessamentoAutomatico then
    begin
    	try
      	dtSetLancTemp.DisableControls;
        dtSetLancTemp.First;
        while not dtSetLancTemp.Eof do
        begin
          if dtSetLancTemp.FieldByName('CODIGO_CH').AsInteger <> 0 then
          begin
            vValorAtingidoSemCheques := vValorAtingidoSemCheques + dtSetLancTemp.FieldByName('VALOR_L').AsCurrency;
            //if ch.dataSet.Locate('CODIGO_CH;CODIGO_EMP', VarArrayOf([dtSetLancTemp.FieldByName('CODIGO_CH').AsInteger, strtoint(vDadosIni.codEmpresa)]), []) then
            if ch._abreChequesCTP(
            	dtSetLancTemp.FieldByName('CODIGO_CH').AsInteger,
              dtSetLancTemp.FieldByName('CODIGO_EMP').AsInteger) then
            begin
              ch.Edit;
              ch.dataSet.FieldByName('Status_ch').AsString := 'QUITADO';
              ch.dataSet.FieldByName('Datq_CH').AsDateTime := vDadosIni.diaFFinanceiro + 1;
              ch.dataSet.FieldByName('US_BX').AsInteger := vDadosIni.vCodUsuario;
              ch.dataSet.FieldByName('obs_ch').AsString := CTP.rCTP.vHistoricoPadrao;
              ch.dataSet.FieldByName('LOTE').AsInteger := FNumLoteLanc;
              ch.dataSet.FieldByName('STATUS_CX').AsVariant := null;
              ch.dataSet.FieldByName('COD_EMP_LOTE').AsInteger := StrToInt(vDadosIni.codEmpresa);
              ch.dataSet.FieldByName('OP_CX').AsVariant := null;
              ch.Post;
              if ch.Apply then
              begin
                if not vDadosIni.quitar_cheques(dtSetLancTemp.FieldByName('CODIGO_CH').AsInteger,
                FNumLoteLanc, ch.transacao) then
                  raiseExceptionCreate('Ocorreu um erro ao quitar os cheques que foram lançados' + chr(13) + 'Nenhum registro sofrerá alteração.', '');
              end
              else
                raiseExceptionCreate('Ocorreu um erro ao quitar os cheques que foram lançados' + chr(13) + 'Nenhum registro sofrerá alteração.', '');
            end
          end
          else if dtSetLancTemp.FieldByName('COD_CRED').AsInteger <> 0 then
          begin
            vValorAtingidoSemCreditos := vValorAtingidoSemCreditos + dtSetLancTemp.FieldByName('VALOR_L').AsCurrency;
            //if ch.dataSet.Locate('CODIGO_CH;CODIGO_EMP', VarArrayOf([dtSetLancTemp.FieldByName('CODIGO_CH').AsInteger, strtoint(vDadosIni.codEmpresa)]), []) then
            if cr._abreCreditosCTP(
            	dtSetLancTemp.FieldByName('COD_CRED').AsInteger,
              dtSetLancTemp.FieldByName('CODIGO_EMP').AsInteger) then
            begin
              cr.Edit;
              cr.dataSet.FieldByName('Status_c').AsString := 'QUITADO';
              cr.dataSet.FieldByName('Datq_C').AsDateTime := vDadosIni.diaFFinanceiro + 1;
              cr.dataSet.FieldByName('US_BX').AsInteger := vDadosIni.vCodUsuario;
              cr.dataSet.FieldByName('obs_c').AsString := CTP.rCTP.vHistoricoPadrao;
              cr.dataSet.FieldByName('LOTE').AsInteger := FNumLoteLanc;
              cr.dataSet.FieldByName('COD_EMP_LOTE').AsInteger := StrToInt(vDadosIni.codEmpresa);
              cr.dataSet.FieldByName('STATUS_CX').AsVariant := null;
              cr.dataSet.FieldByName('OP_CX').AsVariant := null;
              cr.Post;

              if cr.Apply then
              begin
                if not vDadosIni.quitar_creditos(dtSetLancTemp.FieldByName('COD_CRED').AsInteger,
                FNumLoteLanc, false, cr.transacao) then
                  raiseExceptionCreate('Ocorreu um erro ao quitar os cheques que foram lançados' + chr(13) + 'Nenhum registro sofrerá alteração.', '');
              end
              else
                raiseExceptionCreate('Ocorreu um erro ao quitar os créditos que foram lançados' + chr(13) + 'Nenhum registro sofrerá alteração.', '');

              buscas.Close;
              buscas.SQL.Text := 'update baixa_creditos set lote = :lote ' +
                ' where cod_cred = :cod_cred ' +
                ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_lote', 'codigo_emp') +
                ' = :codigo_emp ';
              buscas.ParamByName('cod_cred').AsInteger := dtSetLancTemp.FieldByName('COD_CRED').AsInteger;
              buscas.ParamByName('codigo_emp').AsInteger := StrToInt(vDadosIni.codEmpresa);
              buscas.ParamByName('lote').AsInteger := FNumLoteLanc;
              buscas.ExecSQL;
            end;
          end;
          dtSetLancTemp.Next;
        end;
      finally
      	dtSetLancTemp.EnableControls;
      end;
      vValorAtingidoSemCheques := rCTP.vValorAtingido - vValorAtingidoSemCheques;
      vValorAtingidoSemCreditos := rCTP.vValorAtingido - vValorAtingidoSemCreditos;
      {
      if (ch.DataSet.ChangeCount > 0) then
      begin
        result := ch.Apply;
        if not result then
          raiseExceptionCreate(Pchar('Ocorreu um erro ao quitar os cheques que foram lançados' + chr(13) + 'Nenhum registro sofrerá alteração.'), '');
      end
      else
        result := false;
      }
      try
        vLancL := TLancamentosImp.create;
        vContLigL := TContaLigacaoImp.create;

        vLancL._setTransactionComponentes(transacao);
        vContLigL._AbrirContadeLigacao(True);

        buscas.Close;
        buscas.SQL.Text := 'select codigo_ctrl, cod_emp_mult, sum(valor_ch) valor_ch, sum(vl_contabil) vl_contabil from CONTROLE_CHEQUE' +
          ' where datq_ch = :datq_ch and lote = :lote and status_ch = ''QUITADO''' +
          ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_lote', 'codigo_emp') +
          ' = ' + vDadosIni.codEmpresa +
          ' group by 1,2';
        buscas.ParamByName('datq_ch').AsDate := vDadosIni.diaFFinanceiro + 1;
        buscas.ParamByName('lote').AsInteger := FNumLoteLanc;
        buscas.Open;

        buscas.First;
        while not buscas.Eof do
        begin
          vHistPadraoUnificadas := '';
          if vDadosIni.vEmp.vFinanceiroUnificado then
            vHistPadraoUnificadas := ' CH EMP: ' + vDadosIni.StrZero(buscas.FieldByName('COD_EMP_MULT').AsInteger, 3);

          vLancL.N_CONTA_PLC := dtSetPContasTemp.FieldByName('N_conta_plc').AsFloat;
          if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
            raiseExceptionCreate('Corrija o cadastro para continuar', '');
          vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
          vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
          vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
          vLancL.HISTORICO_L := rCTP.vHistoricoPadrao + vHistPadraoUnificadas;
          //vLancL.TIP_CNT := rCTP.vTipoCNT;
          vLancL.LOTE := NumLoteLanc;
          vLancL.VALOR_L := buscas.FieldByName('VALOR_CH').AsFloat;
          vLancL.CODIGO_CTRL := buscas.FieldByName('codigo_ctrl').AsInteger;
          vLancL.COD_EMP_MULT := buscas.FieldByName('COD_EMP_MULT').AsInteger;
          vLancL.VL_CONTABIL := vDadosIni.StrToFloatFormat(buscas.FieldByName('VL_CONTABIL').AsFloat, 2);
          vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
          rCTP.vSomaValorContabil := rCTP.vSomaValorContabil - vLancL.VL_CONTABIL;
          vLancL._efetuarLancamento;
          buscas.Next;
        end;

        buscas.Close;
        buscas.SQL.Text := 'select codigo_ctrl, cod_emp_mult, sum(valor_c) valor_c, sum(vl_contabil) vl_contabil from CONTROLE_CREDITOS ' +
          ' where datq_c = :datq_c and lote = :lote and status_c = ''QUITADO''' +
          ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_lote', 'codigo_emp') +
          ' = ' + vDadosIni.codEmpresa +
          ' group by 1,2';
        buscas.ParamByName('datq_c').AsDate := vDadosIni.diaFFinanceiro + 1;
        buscas.ParamByName('lote').AsInteger := FNumLoteLanc;
        buscas.Open;

        buscas.First;
        while not buscas.Eof do
        begin
          vHistPadraoUnificadas := '';
          if vDadosIni.vEmp.vFinanceiroUnificado then
            vHistPadraoUnificadas := ' CR EMP: ' + vDadosIni.StrZero(buscas.FieldByName('COD_EMP_MULT').AsInteger, 3);

          vLancL.N_CONTA_PLC := dtSetPContasTemp.FieldByName('N_conta_plc').AsFloat;
          if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
            raiseExceptionCreate('Corrija o cadastro para continuar', '');
          vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
          vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
          vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
          vLancL.HISTORICO_L := rCTP.vHistoricoPadrao + vHistPadraoUnificadas;
          //vLancL.TIP_CNT := rCTP.vTipoCNT;
          vLancL.LOTE := NumLoteLanc;
          vLancL.VALOR_L := buscas.FieldByName('VALOR_C').AsFloat;
          vLancL.CODIGO_CTRL := buscas.FieldByName('codigo_ctrl').AsInteger;
          vLancL.COD_EMP_MULT := buscas.FieldByName('COD_EMP_MULT').AsInteger;
          vLancL.VL_CONTABIL := vDadosIni.StrToFloatFormat(buscas.FieldByName('VL_CONTABIL').AsFloat, 2);
          vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
          rCTP.vSomaValorContabil := rCTP.vSomaValorContabil - vLancL.VL_CONTABIL;
          vLancL._efetuarLancamento;
          buscas.Next;
        end;

        try
        	dtSetLancTemp.DisableControls;
          dtSetLancTemp.First;
          while not dtSetLancTemp.Eof do
          begin
            if ((dtSetLancTemp.FieldByName('CODIGO_CH').AsInteger = 0)
              and (dtSetLancTemp.FieldByName('COD_CRED').AsInteger = 0)
              and (dtSetLancTemp.FieldByName('COD_CONTRP').AsInteger = 0)) then
            begin
              vLancL.N_CONTA_PLC := dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat;
              if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
                raiseExceptionCreate('Corrija o cadastro para continuar', '');
              vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
              vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
              vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
              vLancL.LOTE := NumLoteLanc;
              vLancL.TIP_CNT := rCTP.vTipoCNT;
              vLancL.NDOC_L := dtSetLancTemp.FieldByName('NDOC_L').AsString;
              vLancL.N_CHEQ_L := dtSetLancTemp.FieldByName('N_CHEQ_L').AsString;
              vLancL.NOMINAL_L := dtSetLancTemp.FieldByName('NOMINAL_L').AsString;
              if dtSetLancTemp.FieldByName('DATA_VENC_CHEQ_L').AsDateTime > 0 then
                vLancL.DATA_VENC_CHEQ_L := dtSetLancTemp.FieldByName('DATA_VENC_CHEQ_L').AsDateTime;
              vLancL.VALOR_L := dtSetLancTemp.FieldByName('VALOR_L').AsCurrency;
              vLancL.CODIGO_CTRL := dtSetLancTemp.FieldByName('CODIGO_CTRL').AsInteger;
              vLancL.HISTORICO_L := dtSetLancTemp.FieldByName('HISTORICO_L').AsString;
              if rCTP.vNumChequeCTP <> '' then
                vLancL.N_CHEQ_L := rCTP.vNumChequeCTP;
              vLancL.CODIGO_EMP := StrToInt(vDadosIni.codEmpresa);
              vLancL.COD_EMP_MULT := StrToInt(vDadosIni.codEmpresa);
              if rCTP.vSomaValorContabil > 0 then
                vLancL.VL_CONTABIL := vDadosIni.StrToFloatFormat( rCTP.vSomaValorContabil / vValorAtingidoSemCheques * vLancL.VALOR_L, 2)
              else
                vLancL.VL_CONTABIL := 0;
              if vLancL.VL_CONTABIL > vLancL.VALOR_L then
                vLancL.VL_CONTABIL := vLancL.VALOR_L;
              vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
              vLancL._efetuarLancamento;
            end;
            dtSetLancTemp.Next;
          end;
        finally
          dtSetLancTemp.EnableControls;
        end;

        // Gerar contrapartida
        try
        	dtSetLancTemp.DisableControls;
          dtSetLancTemp.First;
          while not dtSetLancTemp.Eof do
          begin
            if ((dtSetLancTemp.FieldByName('CODIGO_CH').AsInteger = 0)
              and (dtSetLancTemp.FieldByName('COD_CRED').AsInteger = 0)
              and (dtSetLancTemp.FieldByName('COD_CONTRP').AsInteger = 0)) then
            begin
              buscas.Close;
              buscas.SQL.Text := ' select coalesce(gerar_contrapartida, ''N'') gerar_contrapartida from p_contas ' +
                ' where n_conta_plc = :n_conta_plc ';
              buscas.ParamByName('n_conta_plc').AsFloat := dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat;
              buscas.Open;
              if (buscas.FieldByName('GERAR_CONTRAPARTIDA').AsString = 'S') then
              begin
                vCampoLanc := '';
                vValorLanc := '';
                vQtdeCamposLanc := 0;

                vCampoLanc := vCampoLanc + 'N_CONTA_PLC|CODIGO_CTRL|VALOR_L|HISTORICO_L|' +
                  'DTREFERENCIA|NDOC_L|COD_EMP_MULT|';
                vValorLanc := vValorLanc + FloatToStr(dtSetLancTemp.FieldByName('N_CONTA_PLC').AsFloat) + '|' +
                  IntToStr(dtSetLancTemp.FieldByName('CODIGO_CTRL').AsInteger) + '|' +
                  FloatToStr(dtSetLancTemp.FieldByName('VALOR_L').AsCurrency) + '|' +
                  dtSetLancTemp.FieldByName('HISTORICO_L').AsString + '|' +
                  DateToStr(vDadosIni.diaFFinanceiro + 1) + '|' +
                  dtSetLancTemp.FieldByName('NDOC_L').AsString + '|' +
                  vDadosIni.codEmpresa + '|';
                vQtdeCamposLanc := 7;

                vDadosIni.vContrapartidaCTP := true;
                if not vDadosIni.gerar_contrapartida(vCampoLanc, vValorLanc, vQtdeCamposLanc, transacao) then
                begin
                  vDadosIni.vContrapartidaCTPCanc := true;
                  dataSet.Cancel;
                  RollBackTransacao;
                  Result := false;
                  exit;
                end;
              end;
            end;
            dtSetLancTemp.Next;
          end;
        finally
          dtSetLancTemp.EnableControls;
        end;

      finally
        vLancL._setTransactionComponentes(nil);
        vContLigL.Free;
        vLancL.Free;

        vContLigL:= nil;
        vLancL := nil;
      end;

      {
      try
        dtSetCtrlTemp.DisableControls;
        dtSetCtrlTemp.First;
        while not dtSetCtrlTemp.Eof do
        begin
          if not ((dtSetCtrlTemp.FieldByName('DOCS').AsString = 'S1') and
            (dtSetLancTemp.Locate('codigo_ctrl', dtSetCtrlTemp.FieldByName('codigo_ctrl').AsInteger, []))) then
          begin
            dtSetCtrlTemp.Next;
            Continue;
          end;
          lanc.Insert;
          lanc.dataSet.FieldByName('Data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
          lanc.dataSet.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
          lanc.dataSet.FieldByName('N_conta_plc').AsFloat := dtSetPContasTemp.FieldByName('N_conta_plc').AsFloat;
          lanc.dataSet.FieldByName('Tipo_l').AsString := dtSetPContasTemp.FieldByName('Tipo_plc').AsString;
          lanc.dataSet.FieldByName('codigo_ctrl').AsInteger := dtSetLancTemp.FieldByName('codigo_ctrl').AsInteger; //dtmc.QrControlesCodigo_ctrl.value;
          lanc.dataSet.FieldByName('Historico_l').AsString := rCTP.vHistoricoPadrao;
          lanc.dataSet.FieldByName('Lote').AsInteger := ctp.NumLoteLanc;
          lanc.dataSet.FieldByName('TIP_CNT').AsString := rCTP.vTipoCNT;
          lanc.dataSet.FieldByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
          lanc.dataSet.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
          dtSetLancTemp.First;
          while not dtSetLancTemp.Eof do
          begin
            if (dtSetLancTemp.FieldByName('CODIGO_CH').AsInteger <> 0)
              and (dtSetCtrlTemp.FieldByName('codigo_ctrl').AsInteger = dtSetLancTemp.FieldByName('codigo_ctrl').AsInteger) then
              lanc.dataSet.FieldByName('Valor_l').AsCurrency := lanc.dataSet.FieldByName('Valor_l').AsCurrency + dtSetLancTemp.FieldByName('VALOR_L').AsCurrency;
            dtSetLancTemp.Next;
          end;
          lanc.dataSet.FieldByName('COD_LANC').AsInteger := Gencodigo('LANCAMENTOS',
            dtmContasAPagar.SpIncCodigo, vDadosIni.codEmpresa);
          lanc.Post;
          dtSetCtrlTemp.Next;
        end;
      finally
        dtSetCtrlTemp.EnableControls;
      end;

      try
        dtSetLancTemp.DisableControls;
        dtSetLancTemp.First;
        while not dtSetLancTemp.Eof do
        begin
          if dtSetLancTemp.FieldByName('CODIGO_CH').AsInteger = 0 then
          begin
            lanc.Insert;
            lanc.dataSet.FieldByName('Data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
            lanc.dataSet.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
            lanc.dataSet.FieldByName('Valor_l').AsCurrency := dtSetLancTemp.FieldByName('VALOR_L').AsCurrency;
            lanc.dataSet.FieldByName('N_conta_plc').AsFloat := dtSetLancTemp.FieldByName('N_conta_plc').AsFloat;
            lanc.dataSet.FieldByName('Tipo_l').AsString := dtSetLancTemp.FieldByName('Tipo_l').AsString;
            lanc.dataSet.FieldByName('codigo_ctrl').AsInteger := dtSetLancTemp.FieldByName('Codigo_ctrl').AsInteger;
            lanc.dataSet.FieldByName('Historico_l').AsString := dtSetLancTemp.FieldByName('Historico_l').AsString;
            lanc.dataSet.FieldByName('Lote').AsInteger := NumLoteLanc;
            lanc.dataSet.FieldByName('TIP_CNT').AsString := rCTP.vTipoCNT;
            lanc.dataSet.FieldByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
            lanc.dataSet.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
            lanc.dataSet.FieldByName('NDOC_L').AsString:=dtSetLancTemp.FieldByName('NDOC_L').AsString;
            if rCTP.vNumChequeCTP <> '' then
              lanc.dataSet.FieldByName('N_CHEQ_L').AsString := rCTP.vNumChequeCTP;
            lanc.dataSet.FieldByName('COD_LANC').AsInteger := Gencodigo('LANCAMENTOS',
              dtmContasAPagar.SpIncCodigo, vDadosIni.codEmpresa);
            lanc.Post;
          end;
          dtSetLancTemp.Next;
        end;
      finally
        dtSetLancTemp.EnableControls;
      end;
      }
    end
    else
    begin
      try
        vLancL := TLancamentosImp.create;
        vContLigL := TContaLigacaoImp.create;

        vLancL._setTransactionComponentes(transacao);
        vContLigL._AbrirContadeLigacao(True);

        vLancL.N_CONTA_PLC := fQuitacaoCTP.FieldByName('N_conta_plc').AsFloat;
        if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
          raiseExceptionCreate('Corrija o cadastro para continuar', '');
        vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
        vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
        vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
        vLancL.HISTORICO_L := fQuitacaoCTP.FieldByName('Historico_l').AsString;
        //vLancL.TIP_CNT := rCTP.vTipoCNT;
        vLancL.LOTE := FNumLoteLanc;
        vLancL.NDOC_L := fQuitacaoCTP.FieldByName('NDOC_L').AsString;
        vLancL.VALOR_L := fQuitacaoCTP.FieldByName('VALOR_L').AsCurrency;
        vLancL.CODIGO_CTRL := fQuitacaoCTP.FieldByName('Codigo_ctrl').AsInteger;
        vLancL.CODIGO_EMP := StrToInt(vDadosIni.codEmpresa);
        vLancL.COD_EMP_MULT := StrToInt(vDadosIni.codEmpresa);
        vLancL.VL_CONTABIL := vLancL.VALOR_L;
        vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
        vLancL._efetuarLancamento;
      finally
        vLancL._setTransactionComponentes(nil);
        vContLigL.Free;
        vLancL.Free;

        vContLigL:= nil;
        vLancL := nil;
      end;

      {
      lanc.Insert;
      lanc.dataSet.FieldByName('Data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
      lanc.dataSet.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
      lanc.dataSet.FieldByName('Valor_l').AsCurrency := fQuitacaoCTP.FieldByName('VALOR_L').AsCurrency;
      lanc.dataSet.FieldByName('N_conta_plc').AsFloat := fQuitacaoCTP.FieldByName('N_conta_plc').AsFloat;
      lanc.dataSet.FieldByName('Tipo_l').AsString := fQuitacaoCTP.FieldByName('Tipo_l').AsString;
      lanc.dataSet.FieldByName('codigo_ctrl').AsInteger := fQuitacaoCTP.FieldByName('Codigo_ctrl').AsInteger;
      lanc.dataSet.FieldByName('Historico_l').AsString := fQuitacaoCTP.FieldByName('Historico_l').AsString;
      lanc.dataSet.FieldByName('Lote').AsInteger := FNumLoteLanc;
      lanc.dataSet.FieldByName('TIP_CNT').AsString := rCTP.vTipoCNT;
      lanc.dataSet.FieldByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
      lanc.dataSet.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
      lanc.dataSet.FieldByName('NDOC_L').AsString:=fQuitacaoCTP.FieldByName('NDOC_L').AsString;
      lanc.dataSet.FieldByName('COD_LANC').AsInteger := Gencodigo('LANCAMENTOS',
      dtmContasAPagar.SpIncCodigo, vDadosIni.codEmpresa);
      lanc.Post;
      }
    end;
    Result := True;
    {
    if (lanc.DataSet.ChangeCount > 0) then
    begin
      result := lanc.Apply;
      if not result then
        raiseExceptionCreate(Pchar('Ocorreu um erro ao gravar os lançamentos efetuados.' + chr(13) + 'Nenhum registro sofrerá alteração.'), '');
    end
    else
      result := false;
    }
  except
    on e: exception do
    begin
      RollBackTransacao;
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      //        vDadosIni.GravaAuditoria('VND046', 'SALVAR PEDIDO', 'Erro: ' + e.Message, 'PEDVENDA', dataSet.FieldByName('NPED').AsString, buscas);
      //        registraErro('VND046' + e.Message);
    end;

  end;
end;

procedure TContasAPagar._ImprimeRelatorioLoteCTP;
var
  vCodCtrl, vTitulo, vpag: integer;
  vtipctp: string;
  vtot: currency;
  vNumLote: Integer;
  vDataLote: TDateTime;
  vCodEmpLote: Integer;

  procedure CabNovaPagina;
  begin
  	if vpag > 0 then
     Rdp.Novapagina;
    vLinha := 2;
    Rdp.ImpF(vLinha, 1, vDadosIni.vEmp.vnomeEmpresa, [normal, negrito]);
    vLinha := vLinha + 1;
    Rdp.ImpF(vLinha, 1, 'RELATORIO DO LOTE DE MOVIMENTACAO', [normal, negrito]);
    vLinha := vLinha + 1;
    Rdp.ImpF(vLinha, 1, 'LOTE Nº ' + IntToStr(vNumLote) + ' DE: ' + datetostr(vDataLote), [normal, negrito]);
    vpag := vpag + 1;
    Rdp.ImpD(vLinha, 133, 'PAG: ' + vDadosIni.StrZero(vpag, 3), [normal, negrito]);
    vLinha := vLinha + 2;
  end;

begin
  if not vDadosIni.PesqPros('CTP011', 'IMPRIMIR', '', 'LOTE_LANC', loteLanc.dataSet.FieldByName('N_LOTE').AsString, buscas, true) then
    exit;

  if loteLanc.IsEmpty then
  begin
    Application.MessageBox('Nunhum lote para ser impresso!', 'Atenção', MB_OK);
    exit;
  end;

  vNumLote    := loteLanc.dataSet.FieldByName('N_LOTE').AsInteger;
  vDataLote   := loteLanc.dataSet.FieldByName('DATA_LOTE').AsDateTime;
  vCodEmpLote := loteLanc.dataSet.FieldByName('CODIGO_EMP').AsInteger;

  vpag := 0;
  //Inicia a Impressão.
  if not vDadosIni.ModImp(Rdp) then
    exit;
  Rdp.FonteTamanhoPadrao := S17cpp;
  Rdp.TamanhoQteColunas := 132;
  Rdp.TamanhoQteLinhas := 70;
  Rdp.CaptionSetup := 'Configurações de Impressão';
  rdp.OpcoesPreview.CaptionPreview := 'Relatório do Lote de Movimentação';
  rdp.TitulodoRelatorio := 'Relatorio do Lote de Movimentacao';
  vDadosIni._LimparVarSendEmail;
  rdp.OnSendMail := vDadosini._SendMailRdPrint;
  rdp.OpcoesPreview.Preview := true;
  if not Rdp.EstaAberto then
    Rdp.Abrir;
  try
    Screen.Cursor := crHourGlass;
    vtot := 0.00;
    CabNovaPagina;
    //  Rdp.PortaComunicacao := 'LPT1';
    //  if copy(dtmc.QrEmpresaTPIMPRE.value,1,1) = 'G' then
    //   Rdp.impressora:=Grafico;
    lanc.buscas.close;
    lanc.buscas.Sql.Text := ' select l.*, c.docs, c.nome_ctrl from Lancamentos l ' +
    	' left join empresa emp on l.codigo_emp = emp.cod_empresa ' +
      ' inner join controles c on l.codigo_ctrl = c.codigo_ctrl and l.codigo_emp = c.codigo_emp ' +
      ' where l.lote = ' + IntToStr(loteLanc.dataSet.FieldByName('N_LOTE').AsInteger) +
      ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    		' (case when (emp.financeiro_unificado = ''S'') then ' +
      	'				  emp.codigo_unificadora ' +
      	'				else ' +
      	'					l.codigo_emp end) ',
    		'	l.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
      vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (vDataLote > 0),
    		' and l.data = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', vDataLote)), '') +
      ' order by l.codigo_ctrl';
    lanc.buscas.open;
    lanc.buscas.first;
    vCodCtrl := 0;

    if not lanc.buscas.IsEmpty then
    begin
	    vLinha := vLinha + 1;
      Rdp.FonteEstiloPadrao := [Snegrito];
      Rdp.ImpD(vLinha, 1, 'LOTE Nº ' + loteLanc.dataSet.FieldByName('N_LOTE').asstring + ' DE: ' + datetostr(loteLanc.dataSet.FieldByName('DATA_LOTE').AsDateTime), [negrito]);
      vLinha := vLinha + 1;
      Rdp.ImpF(vLinha, 1, 'HISTORICO', []);
      Rdp.ImpF(vLinha, 53, 'Nº DOCUMENTO', []);
      Rdp.ImpF(vLinha, 67, 'Nº CHEQUE', []);
      Rdp.ImpF(vLinha, 82, 'NOMINAL', []);
      Rdp.ImpD(vLinha, 133, 'VALOR', []);
      Rdp.FonteEstiloPadrao := [];
      vLinha := vLinha + 1;
    end;

    while not lanc.buscas.EOF do
    begin
      //     if qrcontroles.Locate('codigo_ctrl',QrLancCODIGO_CTRL.value,[]) then
      //     begin
      if (lanc.buscas.FieldByName('DOCS').AsString <> 'S1') and (lanc.buscas.FieldByName('DOCS').AsString <> 'S2') then
      begin
        if vCodCtrl <> lanc.buscas.FieldByName('Codigo_ctrl').AsInteger then
        begin
          vLinha := vLinha + 1;
          Rdp.ImpD(vLinha, 1, '* * ' + lanc.buscas.FieldByName('Nome_ctrl').AsString + ' * * ', [negrito]);
          vCodCtrl := lanc.buscas.FieldByName('Codigo_ctrl').AsInteger;
        end;
        vLinha := vLinha + 1;
        Rdp.Imp(vLinha, 1, copy(trim(lanc.buscas.FieldByName('Historico_l').AsString), 1, 50));
        Rdp.Imp(vLinha, 53, lanc.buscas.FieldByName('Ndoc_l').AsString);
        Rdp.Imp(vLinha, 67, lanc.buscas.FieldByName('N_cheq_l').AsString);
        Rdp.Imp(vLinha, 82, copy(trim(lanc.buscas.FieldByName('Nominal_l').AsString), 1, 35));
        Rdp.ImpD(vLinha, 133, format('%n', [lanc.buscas.FieldByName('Valor_l').AsCurrency]), []);
        if lanc.buscas.FieldByName('TIPO_L').AsString = 'S' then
          vtot := vtot + lanc.buscas.FieldByName('Valor_l').AsCurrency
        else
          vtot := vtot - lanc.buscas.FieldByName('Valor_l').AsCurrency;
        if vLinha >= 60 then
          CabNovaPagina;
      end;
      //     end;
      lanc.buscas.next;
    end;
    vLinha := vLinha + 1;
    Rdp.Impd(vLinha, 133, 'TOTAL : ' + format('%m', [vtot]), [negrito]);
    vtot := 0.00;

    vLinha := vLinha + 2;
    Rdp.Imp(vLinha, 1, vDadosIni.Replicate('-', 132));
//    vLinha := vLinha + 1;

    ch.buscas.Close;
    ch.buscas.Sql.text := 'select ch.codigo_ch, ch.codigo_ctrl, ctr.nome_ctrl, ' +
    	' ch.nome_ch, ch.n_ch, ch.data_venc, ch.valor_ch from controle_cheque ch ' +
      ' left join empresa emp on ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'ch.cod_emp_lote', 'ch.codigo_emp') + ' = emp.cod_empresa ' +
    	' inner join controles ctr on ctr.codigo_ctrl = ch.codigo_ctrl and ctr.codigo_emp = ch.codigo_emp ' +
      ' where ch.lote = ' + IntToStr(loteLanc.dataSet.FieldByName('N_LOTE').AsInteger) +
      ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    		' (case when (emp.financeiro_unificado = ''S'') then ' +
      	'				  emp.codigo_unificadora ' +
      	'				else ' +
      	'					ch.cod_emp_lote end) ',
    		'	ch.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
      vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (vDataLote > 0),
    		' and ch.datq_ch = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', vDataLote)), '') +
      ' order by ch.codigo_ctrl';
    ch.buscas.open;
    ch.buscas.First;
//    vCodCtrl := 0;
    vTitulo := 0;
    while not ch.buscas.EOF do
    begin
      if vTitulo = 0 then
      begin
        vLinha := vLinha + 1;
        Rdp.FonteEstiloPadrao := [Snegrito];
//        vLinha := vLinha + 1;
        Rdp.Imp(vLinha, 1, '* * CHEQUES TERCEIROS * *');
        vLinha := vLinha + 1;
        Rdp.Imp(vLinha, 1, 'NOME CLIENTE');
        Rdp.Imp(vLinha, 40, 'CONTROLE');
        Rdp.Imp(vLinha, 81, 'Nº CHEQUE');
        Rdp.Imp(vLinha, 100, 'DATA VENC');
        Rdp.ImpD(vLinha, 133, 'VALOR', []);
        Rdp.FonteEstiloPadrao := [];
        vTitulo := 1;
      end;
      vLinha := vLinha + 1;
//      if vCodCtrl <> ch.buscas.FieldByName('Codigo_ctrl').AsInteger then
//      begin
//        Rdp.Imp(vLinha, 1, ch.buscas.FieldByName('nome_ctrl').AsString);
//        vCodCtrl := ch.buscas.FieldByName('Codigo_ctrl').AsInteger;
//        vLinha := vLinha + 1;
//      end;
      Rdp.Imp(vLinha, 1, ch.buscas.FieldByName('Nome_ch').AsString);
      Rdp.Imp(vLinha, 40, ch.buscas.FieldByName('nome_ctrl').AsString);
      Rdp.Imp(vLinha, 81, ch.buscas.FieldByName('N_ch').AsString);
      if not ch.buscas.FieldByName('data_venc').IsNull then
	      Rdp.Imp(vLinha, 100, FormatDateTime('dd/mm/yyyy', ch.buscas.FieldByName('data_venc').AsDateTime));

      Rdp.ImpD(vLinha, 133, format('%n', [ch.buscas.FieldByName('Valor_ch').AsCurrency]), []);
      vtot := vtot + ch.buscas.FieldByName('Valor_ch').AsCurrency;
      if vLinha >= 60 then
        CabNovaPagina;
      ch.buscas.next;
    end;
    vLinha := vLinha + 1;
    if ch.buscas.IsEmpty then
	  	Rdp.Imp(vLinha, 1, '* * CHEQUES TERCEIROS * *');
    Rdp.ImpD(vLinha, 133, 'TOTAL : ' + format('%m', [vtot]), [negrito]);
    vtot := 0.00;

    vLinha := vLinha + 2;
    Rdp.Imp(vLinha, 1, vDadosIni.Replicate('-', 132));
//    vLinha := vLinha + 1;

    cr.buscas.Close;
    cr.buscas.Sql.text := ' select cc.cod_cred, cc.codigo_ctrl, ctr.nome_ctrl, ' +
    	' cc.nome_c, cc.n_doc_c, cc.data_venc_c, cc.valor_c from controle_creditos cc ' +
      ' left join empresa emp on ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cc.cod_emp_lote', 'cc.codigo_emp') + ' = emp.cod_empresa ' +
   	  ' inner join controles ctr on ctr.codigo_ctrl = cc.codigo_ctrl and ctr.codigo_emp = cc.codigo_emp ' +
      ' where cc.lote = ' + IntToStr(loteLanc.dataSet.FieldByName('N_LOTE').AsInteger) +
      ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    		' (case when (emp.financeiro_unificado = ''S'') then ' +
      	'				  emp.codigo_unificadora ' +
      	'				else ' +
      	'					cc.cod_emp_lote end) ',
    		'	cc.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
      vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (vDataLote > 0),
    		' and cc.datq_c = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', vDataLote)), '') +
      ' union ' +
      ' select bx.seq_bxcred, bx.codigo_ctrl, ctr.nome_ctrl, ' +
      ' bx.nome_c, bx.n_doc_c, bx.data_venc_c, bx.valor_quitado valor_c from baixa_creditos bx ' +
      ' left join empresa emp on ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'bx.cod_emp_lote', 'bx.codigo_emp') + ' = emp.cod_empresa ' +
    	' inner join controles ctr on ctr.codigo_ctrl = bx.codigo_ctrl and ctr.codigo_emp = bx.codigo_emp ' +
      ' where bx.lote = ' + IntToStr(loteLanc.dataSet.FieldByName('N_LOTE').AsInteger) +
      ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    		' (case when (emp.financeiro_unificado = ''S'') then ' +
      	'				  emp.codigo_unificadora ' +
      	'				else ' +
      	'					bx.cod_emp_lote end) ',
    		'	bx.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
      vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (vDataLote > 0),
    		' and bx.datq_c = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', vDataLote)), '') +
      ' and bx.tip_baixa =''P'' ' +
      ' order by 2 ';
    cr.buscas.open;
    cr.buscas.First;
//    vCodCtrl := 0;
    vTitulo := 0;
    while not cr.buscas.EOF do
    begin
      if vTitulo = 0 then
      begin
        vLinha := vLinha + 1;
        Rdp.FonteEstiloPadrao := [Snegrito];
        vLinha := vLinha + 1;
        Rdp.Imp(vLinha, 1, '* * CREDITOS TERCEIROS * *');
        vLinha := vLinha + 1;
        Rdp.Imp(vLinha, 1, 'NOME CLIENTE');
        Rdp.Imp(vLinha, 40, 'CONTROLE');
        Rdp.Imp(vLinha, 81, 'Nº DOC');
        Rdp.Imp(vLinha, 100, 'DATA VENC');
        Rdp.ImpD(vLinha, 133, 'VALOR', []);
        Rdp.FonteEstiloPadrao := [];
        vTitulo := 1;
      end;
      vLinha := vLinha + 1;
//      if vCodCtrl <> cr.buscas.FieldByName('Codigo_ctrl').AsInteger then
//      begin
//        Rdp.Imp(vLinha, 1, cr.buscas.FieldByName('nome_ctrl').AsString);
//        vCodCtrl := cr.buscas.FieldByName('Codigo_ctrl').AsInteger;
//        vLinha := vLinha + 1;
//      end;
      Rdp.Imp(vLinha, 1, cr.buscas.FieldByName('Nome_c').AsString);
      Rdp.Imp(vLinha, 40, cr.buscas.FieldByName('nome_ctrl').AsString);
      Rdp.Imp(vLinha, 81, cr.buscas.FieldByName('N_doc_c').AsString);
      if not cr.buscas.FieldByName('data_venc_c').IsNull then
	      Rdp.Imp(vLinha, 100, FormatDateTime('dd/mm/yyyy', cr.buscas.FieldByName('data_venc_c').AsDateTime));

      Rdp.ImpD(vLinha, 133, format('%n', [cr.buscas.FieldByName('Valor_c').AsCurrency]), []);
      vtot := vtot + cr.buscas.FieldByName('Valor_c').AsCurrency;
      if vLinha >= 60 then
        CabNovaPagina;
      cr.buscas.next;
    end;
    vLinha := vLinha + 1;
    if cr.buscas.IsEmpty then
	    Rdp.Imp(vLinha, 1, '* * CREDITOS TERCEIROS * *');
    Rdp.ImpD(vLinha, 133, 'TOTAL : ' + format('%m', [vtot]), [negrito]);
    vtot := 0.00;

    vLinha := vLinha + 2;
    Rdp.Imp(vLinha, 1, vDadosIni.Replicate('-', 132));
//    vLinha := vLinha + 1;

    buscas.close;
    buscas.Sql.text := 'select ctp.*, c.desc_gr, ct.desc_dep from contas_a_pagar ctp ' +
    	' left join empresa emp on ctp.codigo_emp = emp.cod_empresa ' +
      ' inner join p_contas p on p.n_conta_plc =  ctp.n_conta_plc ' +
      ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
      ' left join sub_grup_ct s on p.cod_sub_ct = s.cod_sub_ct ' +
      ' left join depart_ct ct on ct.cod_dep = c.cod_dep ' +
    	' where ctp.lote = ' + IntToStr(loteLanc.dataSet.FieldByName('N_LOTE').AsInteger) +
      ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    		' (case when (emp.financeiro_unificado = ''S'') then ' +
      	' 			  emp.codigo_unificadora ' +
      	'			  else ' +
      	'				  ctp.codigo_emp end) = ' + vDadosIni.codEmpresa,
      	' ctp.codigo_emp = ' + vDadosIni.codEmpresa) +
      vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (vDataLote > 0),
      	' and ctp.datq_ctp = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', vDataLote)), '') +
      ' order by ctp.tipo_ctp, ctp.n_doc_ctp ';
    vtipctp := '';
    buscas.open;
    vLinha := vLinha + 1;
    Rdp.FonteEstiloPadrao := [Snegrito];
    Rdp.Imp(vLinha, 1, '* * CONTAS * *');
    vLinha := vLinha + 2;
    Rdp.Imp(vLinha, 1, 'NOME FORNECEDOR');
    Rdp.Imp(vLinha, 42, 'Nº DOC/REF');
    Rdp.Imp(vLinha, 68, 'DATA VENC.');
    Rdp.Imp(vLinha, 90, 'VALOR DUPL');
    Rdp.ImpD(vLinha, 133, 'VALOR PAGO', []);
    vlinha:=vlinha+1;
    Rdp.Imp(vLinha, 1, 'HISTORICO');
    Rdp.Imp(vLinha, 42, 'GRUPO');
    Rdp.Imp(vLinha, 68, 'DEPARTAMENTO');
    Rdp.FonteEstiloPadrao := [];
    while not buscas.EOF do
    begin
      if vtipctp <> buscas.fieldbyName('tipo_ctp').AsString then
      begin
        vLinha := vLinha + 1;
        Rdp.FonteEstiloPadrao := [Snegrito];
        vLinha := vLinha + 1;
        if vtipctp = 'D' then
          Rdp.Imp(vLinha, 1, buscas.fieldbyName('tipo_ctp').AsString + ' * * DESPESAS * *')
        else
          Rdp.Imp(vLinha, 1, buscas.fieldbyName('tipo_ctp').AsString + ' * * FORNECEDOR * *');
        Rdp.FonteEstiloPadrao := [];
        vCodCtrl := buscas.fieldbyName('Codigo_ctrl').value;
      end;
      vLinha := vLinha + 1;
      Rdp.Imp(vLinha, 1, copy(buscas.FieldByName('Nome_FOR_ctp').AsString, 1, 40));
      Rdp.Imp(vLinha, 42, copy(buscas.FieldByName('N_doc_ctp').AsString, 1, 10)+' REF:'+
      copy(buscas.fieldbyname('DTREFERENCIA').asstring,4,7));
      Rdp.Imp(vLinha, 68, buscas.FieldByName('Data_venc_ctp').AsString);
      Rdp.ImpD(vLinha, 100, format('%n', [buscas.FieldByName('Valor_ctp').ascurrency]), []);
      Rdp.ImpD(vLinha, 133, format('%n', [buscas.FieldByName('Valor_pago').ascurrency]), []);
      vtot := vtot + buscas.FieldByName('Valor_pago').ascurrency;

      vlinha := vlinha + 1;
      Rdp.Imp(vLinha, 1, Copy(buscas.FieldByName('historico_ctp').AsString, 1, 40));
      Rdp.Imp(vLinha, 42, Copy(buscas.FieldByName('desc_gr').AsString, 1, 21) );
      Rdp.Imp(vLinha, 68, buscas.FieldByName('desc_dep').AsString);

      if vLinha >= 60 then
        CabNovaPagina;
      buscas.next;
    end;
    vLinha := vLinha + 1;
    Rdp.ImpD(vLinha, 133, 'TOTAL: ' + format('%m', [vtot]), [negrito]);
    vtot := 0.00;

    // Renegocias e quitacao parcial
    if vDadosIni.vContasAPagar.vExibirRenociacoes then
    begin
      vLinha := vLinha + 2;
      Rdp.Imp(vLinha, 1, vDadosIni.Replicate('-', 132));
//      vLinha := vLinha + 1;

      cp.buscas.close;
      cp.buscas.Sql.text := ' select ctp.tipo_ctp, ctp.n_doc_ctp, ctp.*, c.desc_gr, ct.desc_dep from contas_a_pagar ctp ' +
      	' left join empresa emp on ctp.codigo_emp = emp.cod_empresa ' +
        ' inner join p_contas p on p.n_conta_plc =  ctp.n_conta_plc ' +
        ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
        ' left join sub_grup_ct s on p.cod_sub_ct = s.cod_sub_ct ' +
        ' left join depart_ct ct on ct.cod_dep = c.cod_dep ' +
        ' where ctp.lote_ent = ' + IntToStr(loteLanc.dataSet.FieldByName('N_LOTE').AsInteger) +
        ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          ' (case when (emp.financeiro_unificado = ''S'') then ' +
          '				  emp.codigo_unificadora ' +
          '				else ' +
          '					ctp.codigo_emp end) ',
          '	ctp.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
        vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (vDataLote > 0),
    			' and ctp.data_ent_ctp = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', vDataLote)), '') +
        ' union all ' +
        ' select ctp.tipo_ctp, ctp.n_doc_ctp, ctp.*, c.desc_gr, ct.desc_dep from contas_a_pagar ctp ' +
        ' left join empresa emp on ctp.codigo_emp = emp.cod_empresa ' +
        ' inner join p_contas p on p.n_conta_plc =  ctp.n_conta_plc ' +
        ' inner join grupos_ct c on p.grup_ct = c.grup_ct ' +
        ' left join sub_grup_ct s on p.cod_sub_ct = s.cod_sub_ct ' +
        ' left join depart_ct ct on ct.cod_dep = c.cod_dep ' +
        ' where ctp.lote_quit_parc = ' + IntToStr(loteLanc.dataSet.FieldByName('N_LOTE').AsInteger) +
        ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          ' (case when (emp.financeiro_unificado = ''S'') then ' +
          '				  emp.codigo_unificadora ' +
          '				else ' +
          '					ctp.codigo_emp end) ',
          '	ctp.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
        vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (vDataLote > 0),
    			' and ctp.data_ent_ctp = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', vDataLote)), '') +
        ' order by 1, 2 ';
      vtipctp := '';
      cp.buscas.open;

      if not cp.buscas.IsEmpty then
      begin
        vLinha := vLinha + 1;
        Rdp.FonteEstiloPadrao := [Snegrito];
        Rdp.Imp(vLinha, 1, '* * NEGOCIADAS * *');
        vLinha := vLinha + 2;
        Rdp.Imp(vLinha, 1, 'NOME FORNECEDOR');
        Rdp.Imp(vLinha, 42, 'Nº DOC/REF');
        Rdp.Imp(vLinha, 68, 'DATA VENC.');
        Rdp.ImpD(vLinha, 133, 'VALOR DUPL', []);
        vlinha:=vlinha+1;
        Rdp.Imp(vLinha, 1, 'HISTORICO');
        Rdp.Imp(vLinha, 42, 'GRUPO');
        Rdp.Imp(vLinha, 68, 'DEPARTAMENTO');
        Rdp.FonteEstiloPadrao := [];
      end;
      
      while not cp.buscas.EOF do
      begin
        if vtipctp <> cp.buscas.fieldbyName('tipo_ctp').AsString then
        begin
          vLinha := vLinha + 1;
          Rdp.FonteEstiloPadrao := [Snegrito];
          vLinha := vLinha + 1;
          if vtipctp = 'D' then
            Rdp.Imp(vLinha, 1, cp.buscas.fieldbyName('tipo_ctp').AsString + ' * * DESPESAS * *')
          else
            Rdp.Imp(vLinha, 1, cp.buscas.fieldbyName('tipo_ctp').AsString + ' * * FORNECEDOR * *');
          Rdp.FonteEstiloPadrao := [];
          vCodCtrl := cp.buscas.fieldbyName('Codigo_ctrl').value;
        end;
        vLinha := vLinha + 1;
        Rdp.Imp(vLinha, 1, copy(cp.buscas.FieldByName('Nome_FOR_ctp').AsString, 1, 40));
        Rdp.Imp(vLinha, 42, copy(cp.buscas.FieldByName('N_doc_ctp').AsString, 1, 10)+' REF:'+
        copy(cp.buscas.fieldbyname('DTREFERENCIA').asstring,4,7));
        Rdp.Imp(vLinha, 68, cp.buscas.FieldByName('Data_venc_ctp').AsString);
        if cp.buscas.FieldByName('Valor_ctp_orig').ascurrency > 0 then
          Rdp.ImpD(vLinha, 133, format('%n', [cp.buscas.FieldByName('Valor_ctp_orig').ascurrency]), [])
        else
          Rdp.ImpD(vLinha, 133, format('%n', [cp.buscas.FieldByName('Valor_ctp').ascurrency]), []);

        if cp.buscas.FieldByName('Valor_ctp_orig').ascurrency > 0 then
          vtot := vtot + cp.buscas.FieldByName('Valor_ctp_orig').ascurrency
        else
          vtot := vtot + cp.buscas.FieldByName('Valor_ctp').ascurrency;

        vlinha := vlinha + 1;
        Rdp.Imp(vLinha, 1, Copy(cp.buscas.FieldByName('historico_ctp').AsString, 1, 40));
        Rdp.Imp(vLinha, 42, Copy(cp.buscas.FieldByName('desc_gr').AsString, 1, 21) );
        Rdp.Imp(vLinha, 68, cp.buscas.FieldByName('desc_dep').AsString);

        if vLinha >= 60 then
          CabNovaPagina;
        cp.buscas.next;
      end;
      vLinha := vLinha + 1;
//      if cp.buscas.IsEmpty then
//        Rdp.Imp(vLinha, 1, '* * NEGOCIADAS * *');
    	if not cp.buscas.IsEmpty then
      	Rdp.ImpD(vLinha, 133, 'TOTAL : ' + format('%m', [vtot]), [negrito]);
      vtot := 0.00;
    end;

    if Rdp.EstaAberto then
      Rdp.Fechar;

  finally
    buscas.Close;
    ch.buscas.Close;
    lanc.buscas.Close;
    Screen.Cursor := crDefault;
  end;
end;

function TContasAPagar._informarObservacoes: Boolean;
begin
  vObs._selecionaObs(dataSet.FieldByName('cod_obs').AsInteger);
  _abreFormObservacoes;
end;

function TContasAPagar._lancamentosTemp: boolean;
var
  i, j: integer;
  camposLancTemp: array of string;
  vCampos: TStringList;
begin
  try
    result := true;

    vCampos := TStringList.Create;
    vCampos.Clear;

    lanc._abreLancamentos(0);
    if dsLancTemp = nil then
      dsLancTemp := TDataSource.Create(nil);
    dtSetLancTemp := TClientDataSet.Create(nil);
    dtSetLancTemp.Close;
    dtSetLancTemp.FieldDefs.Clear;
    SetLength(camposLancTemp, 10);
    camposLancTemp[0] := 'CODIGO_CTRL';
    camposLancTemp[1] := 'N_CONTA_PLC';
    camposLancTemp[2] := 'HISTORICO_L';
    camposLancTemp[3] := 'VALOR_L';
    camposLancTemp[4] := 'COD_LANC';
    camposLancTemp[5] := 'TIPO_L';
    camposLancTemp[6] := 'N_CHEQ_L';
    camposLancTemp[7] := 'NDOC_L';
    camposLancTemp[8] := 'NOMINAL_L';
    camposLancTemp[9] := 'CODIGO_EMP';

    vCampos.Add('SEL');
    dtSetLancTemp.FieldDefs.Add('SEL', ftString, 1, false);
    vCampos.Add('NOME_CTRL');
    dtSetLancTemp.FieldDefs.Add('NOME_CTRL', ftString, 35, false);
    vCampos.Add('CODIGO_CH');
    dtSetLancTemp.FieldDefs.Add('CODIGO_CH', ftInteger, 0, false);
    vCampos.Add('COD_CRED');
    dtSetLancTemp.FieldDefs.Add('COD_CRED', ftInteger, 0, false);
    vCampos.Add('COD_CONTRP');
    dtSetLancTemp.FieldDefs.Add('COD_CONTRP', ftInteger, 0, false);
    vCampos.Add('CODIGO_CTRL_CONTRP');
    dtSetLancTemp.FieldDefs.Add('CODIGO_CTRL_CONTRP', ftInteger, 0, false);
    vCampos.Add('NOME_CTRL_CONTRP');
    dtSetLancTemp.FieldDefs.Add('NOME_CTRL_CONTRP', ftString, 35, false);
    vCampos.Add('DATA_VENC_CHEQ_L');
    dtSetLancTemp.FieldDefs.Add('DATA_VENC_CHEQ_L', ftDateTime, 0, false);

    for I := 0 to lanc.dataset.FieldCount - 1 do
    begin
      for j := Low(camposLancTemp) to High(camposLancTemp) do
        if (lanc.dataSet.Fields[i].FieldName = camposLancTemp[j]) or (lanc.dataSet.Fields[i].FieldName = 'NOME_CTRL') then
        begin
          dtSetLancTemp.FieldDefs.Add(
            lanc.dataSet.FieldDefs[i].Name,
            lanc.dataSet.FieldDefs[i].DataType,
            lanc.dataSet.FieldDefs[i].Size,
            false);

          vCampos.Add(lanc.dataSet.FieldDefs[i].Name);
        end;
    end;

    for I := 0 to dataSet.Fields.Count - 1 do
    begin
    	if vCampos.IndexOf(dataSet.FieldDefs[i].Name) = -1 then
      begin
        dtSetLancTemp.FieldDefs.Add(
          dataSet.FieldDefs[i].Name,
          dataSet.FieldDefs[i].DataType,
          dataSet.FieldDefs[i].Size,
          false);

        vCampos.Add(dataSet.FieldDefs[i].Name);
      end;
    end;

    dtSetLancTemp.CreateDataSet;
    dtSetLancTemp.FieldByName('DATA_VENC_CHEQ_L').EditMask := '!99/99/0000;1;_';
    dtSetLancTemp.LogChanges := False; //LogChanges = False, desabilita os logs de alteração e inserção dando performance na manipulação do ClientDataset
    (dtSetLancTemp.FieldByName('VALOR_L') as TFloatField).currency := true;

    dsLancTemp.DataSet := dtSetLancTemp;
  except
    result := false;
  end;
end;


function TContasAPagar._listaControles(pQuitacao: Boolean; pCodControle: Integer; pCodEmpMult: Integer): boolean;
begin
  result := true;
  if dtSetControles = nil then
    dtSetControles := TClientDataSet(dtmContasAPagar.cdsControles);
  dtSetControles.Close;
  dtSetControles.CommandText := ' select codigo_ctrl, nome_ctrl, docs, contr_banc, nat_lanc from controles ' +
  	' where codigo_emp = ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
     	IntToStr(pCodEmpMult), vDadosIni.codEmpresa) +
    ' and ativo = 1 ' +
      vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,	' and (coalesce(controle_visivel, ''S'') = ''S'') ', '') +
    ' and coalesce(nao_gera_finan, '''') <> ''S''';
  if pCodControle > 0 then
    dtSetControles.CommandText := dtSetControles.CommandText + ' and codigo_ctrl <> :codigo_ctrl ';
  if pQuitacao then
    dtSetControles.CommandText := dtSetControles.CommandText + ' and ((docs <> ''S2'') or (docs = ''S2'' and receber_ctp = ''S'' )) ';

  if pCodControle > 0 then
  begin
    dtSetControles.CommandText := dtSetControles.CommandText +
      ' union ' +
    	' select codigo_ctrl, nome_ctrl, docs, contr_banc, nat_lanc from controles ' +
  		'	where codigo_emp = ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
    		IntToStr(pCodEmpMult), vDadosIni.codEmpresa) +
	    ' and codigo_ctrl = :codigo_ctrl ' +
      ' and coalesce(nao_gera_finan, '''') <> ''S''';

    if pQuitacao then
    	dtSetControles.CommandText := dtSetControles.CommandText + ' and ((docs <> ''S2'') or (docs = ''S2'' and receber_ctp = ''S'' )) ';
  end;

  if (pQuitacao) and (not baixaParcial) then
  begin
  	dtSetControles.CommandText := dtSetControles.CommandText +
    	' union ' +
      ' select 0 codigo_ctrl, ''CONTAS A PAGAR'' nome_ctrl, ''CP'' docs, null contr_banc, null nat_lanc from rdb$database ';
  end;  

  dtSetControles.CommandText := dtSetControles.CommandText + ' order by 1 ';

  if pCodControle > 0 then
  	dtSetControles.Params.ParamByName('codigo_ctrl').AsFloat := pCodControle;

//  dtSetControles.CommandText := 'select * from controles where CODIGO_EMP = ' + vDadosIni.codEmpresa +
//    ' and (docs=''N'' or docs=''S1'') and ativo=1 order by codigo_ctrl ';
  try
    dtSetControles.Open;
  except
    on E: Exception do
    begin
      Result := False;
      registraErro('E0003' + e.Message);
      if (pos('Unable to complete network request to host', e.Message) > 0) then
      begin
        if not reconectaNoServidor(e) then
        try
          dtSetControles.Open;
          Result := true;
        except
          raise exception.create('Rede inacessivel');
        end;
      end;
    end;
  end;
end;

function TContasAPagar._listaPContas(pDBLookupComboBox: TDBLookupComboBox; pDbEdit: TDBEdit): boolean;
begin
  result := false;
  if not _PContasTemp then
    exit;
  pDbEdit.DataField := 'N_CONTA_PLC';
  pDbEdit.DataSource := dsPContasTemp;
  pDBLookupComboBox.ListSource := nil;
  pDBLookupComboBox.ListField := 'DESC_PLC;N_CONTA_PLC';
  pDBLookupComboBox.KeyField := 'N_CONTA_PLC';
  pDBLookupComboBox.ListSource := dsPContasTemp;
  pDBLookupComboBox.KeyValue := rCTP.vNumContaPadrao;
  result := true;
end;

function TContasAPagar._listaPContas(pTipo: string; pCodPContas: Double): boolean;
begin
  result := true;
  if dtSetPContas = nil then
    dtSetPContas := TClientDataSet(dtmContasAPagar.cdsPContas);
  dtSetPContas.Close;
  dtSetPContas.CommandText := ' select pc.n_conta_plc,' +
    ' case when coalesce(pc.cod_cta_contabil,'''') <> '''' then rtrim(pc.desc_plc)||'' - ''||pc.cod_cta_contabil||'': ''||pcc.nome_cta ' +
    ' else pc.desc_plc end desc_plc, pc.*' +
    ' from P_Contas pc' +
    ' left join p_contas_contabil pcc on pcc.cod_cta = pc.cod_cta_contabil and pcc.cod_empresa = ' + vDadosIni.codEmpresa +
    ' where pc.ativo = 1 and pc.tipo_plc = ' + QuotedStr(pTipo);
  if pCodPContas > 0 then
    dtSetPContas.CommandText := dtSetPContas.CommandText +	' and pc.n_conta_plc <> :n_conta_plc ';

  if pCodPContas > 0 then
  	dtSetPContas.CommandText := dtSetPContas.CommandText +
      ' union ' +
    	' select pc.n_conta_plc,' +
   	  ' case when coalesce(pc.cod_cta_contabil,'''') <> '''' then rtrim(pc.desc_plc)||'' - ''||pc.cod_cta_contabil||'': ''||pcc.nome_cta ' +
    	' else pc.desc_plc end desc_plc, pc.*' +
    	' from P_Contas pc' +
  	  ' left join p_contas_contabil pcc on pcc.cod_cta = pc.cod_cta_contabil and pcc.cod_empresa = ' + vDadosIni.codEmpresa +
	    ' where pc.n_conta_plc = :n_conta_plc and pc.tipo_plc = ' + QuotedStr(pTipo);

  dtSetPContas.CommandText := dtSetPContas.CommandText +
    ' order by 2 ';
    //' order by pc.desc_plc ';
//  dtSetPContas.CommandText := 'select * from P_Contas where ativo = 1 and tipo_plc = ' + QuotedStr(pTipo) + ' order by desc_plc ';
	if pCodPContas > 0 then
	  dtSetPContas.Params.ParamByName('N_CONTA_PLC').AsFloat := pCodPContas;
  dtSetPContas.FieldByName('DESC_PLC').Size := 60;
  dtSetPContas.FieldByName('DESC_PLC').DisplayWidth := 60;
  try
    dtSetPContas.Open;
  except
    on E: Exception do
    begin
      Result := False;
      registraErro('E0003' + e.Message);
      if (pos('Unable to complete network request to host', e.Message) > 0) then
      begin
        if not reconectaNoServidor(e) then
        try
          dtSetPContas.Open;
          Result := true;
        except
          raise exception.create('Rede inacessivel');
        end;
      end;
    end;
  end;
end;

procedure TContasAPagar._marcaDesmarcaLinha;
begin
  if dataSet.IsEmpty then
    exit;
  if FTotalContasSelecionadas = 0 then
    rCTP.vTipoCNT := '';
  dataSet.Edit;
  if dataSet.FieldByName('sel').AsString = 'S' then
  begin
    dataSet.FieldByName('sel').AsString := '';
//    dataSet.FieldByName('op_cx').AsVariant:= null;
    FTotalContasSelecionadas := FTotalContasSelecionadas - 1;
  end
  else
  begin
    dataSet.FieldByName('sel').AsString := 'S';
//    dataSet.FieldByName('op_cx').AsInteger:=vDadosIni.vCodUsuario;

    FTotalContasSelecionadas := FTotalContasSelecionadas + 1;
    if vDadosIni.vEmp.vFiltrarCtpPorControle = 'S' then
    begin
      if rCTP.vTipoCNT = '' then
        rCTP.vTipoCNT := dataSet.FieldByName('TIP_CNT').AsString;
//      else
//      begin
//        if dataSet.FieldByName('TIP_CNT').AsString <> rCTP.vTipoCNT then
//        begin
//          Application.MessageBox(Pchar('Tipo de Conta não é: ''' + rCTP.vTipoCNT + ''' como as anteriores Selecionadas'), 'Informação', MB_OK + MB_ICONINFORMATION);
//          dataSet.FieldByName('sel').AsString := '';
//          FTotalContasSelecionadas := FTotalContasSelecionadas - 1;
//        end;
//      end;
    end;
  end;
  dataSet.Post;
end;

function TContasAPagar._marcarParaCancelarCTP: Boolean;
var
  vAcao: string;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;
  if not vDadosIni.PesqPros('CTP010', 'MARCAR CANCELAMENTO', trim(dataset.FieldByName('N_DOC_CTP').AsString)+' '+dataSet.FieldByName('NOME_FOR_CTP').AsString,
    'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+trim(dataset.FieldByName('N_DOC_CTP').AsString), buscas, true) then
    Exit;

  try
    vNomeBanco := '';
    vDadosIni.abreStatusProcessamento('', 'Iniciando processo de aceite das contas a pagar selecionadas.');
    First;

    while not eof do
    begin
      if dataSet.FieldByName('SEL').AsString = 'S' then
      begin
        try
          if dataSet.FieldByName('STATUS_HONDA').AsString <> 'CANCELADA' then
            vDadosIni.abreStatusProcessamento('', 'Marcando a conta a pagar Código de Sequência = ' + dataSet.FieldByName('COD_CONTRP').AsString)
          else
            vDadosIni.abreStatusProcessamento('', 'Desmarcando a conta a pagar Código de Sequência = ' + dataSet.FieldByName('COD_CONTRP').AsString);

          if not ExecutaComandosSql('select ctp.cod_contrp from contas_a_pagar ctp ' +
            ' where ctp.codigo_emp=' + vDadosIni.codEmpresa +
            ' and ctp.cod_contrp =  ' + dataSet.FieldByName('COD_CONTRP').AsString +
            ' and (ctp.selec='''' or (ctp.selec is null))') then
          begin
            Application.MessageBox(pchar('Conta a pagar Código de Sequência = ' + dataSet.FieldByName('COD_CONTRP').AsString + ' já está sendo alterada por outro usuário'), 'Atenção', MB_OK + MB_ICONINFORMATION);
            next;
            Continue;
          end;

          dataSet.edit;
          if dataSet.FieldByName('STATUS_HONDA').AsString <> 'CANCELADA' then
          begin
            vAcao := 'MARCAR';
            dataSet.FieldByName('STATUS_HONDA').AsString := 'CANCELADA';
          end
          else
          begin
            vAcao := 'DESMARCAR';
            dataSet.FieldByName('STATUS_HONDA').AsString := '';
          end;
          Result := inherited Post;
          if Result then
            result := Apply;
          if result then
            Result := CommitaTransacao
          else
          begin
            //              dataSet.RevertRecord;   //desfaz todas as edições , inclusive desmarca o registro
            dataSet.UndoLastChange(true); //desfaz apenas a ultima edição
            RollBackTransacao;
          end;

          if Result then
            vDadosIni.GravaAuditoria('CTP010', vAcao, 'SUCESSO:',
              'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+trim(dataSet.FieldByName('N_DOC_CTP').AsString)+
              ' '+dataSet.FieldByName('NOME_FOR_CTP').AsString, buscas)
          else
            vDadosIni.GravaAuditoria('CTP010', vAcao, 'FALHA:',
              'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+trim(dataSet.FieldByName('N_DOC_CTP').AsString)+
              ' '+dataSet.FieldByName('NOME_FOR_CTP').AsString, buscas);
        except
          vDadosIni.GravaAuditoria('CTP010', vAcao, 'FALHA:',
            'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+trim(dataSet.FieldByName('N_DOC_CTP').AsString)+
            ' '+dataSet.FieldByName('NOME_FOR_CTP').AsString, buscas);
          cancel;
          RollBackTransacao;
        end;
      end;
      Next;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;

end;

procedure TContasAPagar._marcaTodasAsLinhas;
var
  tipoCNTDiferente: boolean;
begin
  try
    if IsEmpty then
      exit;
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');
    tipoCNTDiferente := false;
    if FTotalContasSelecionadas = 0 then
      rCTP.vTipoCNT := '';

    try
    	dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if dataSet.FieldByName('sel').AsString = 'S' then
        begin
          dataSet.Next;
          Continue;
        end;

        if vDadosIni.vEmp.vFiltrarCtpPorControle = 'S' then
        begin
          if rCTP.vTipoCNT = '' then
            rCTP.vTipoCNT := dataSet.FieldByName('TIP_CNT').AsString;
          if dataSet.FieldByName('TIP_CNT').AsString = rCTP.vTipoCNT then
          begin
            dataSet.Edit;
            dataSet.FieldByName('sel').AsString := 'S';
  //          dataSet.FieldByName('op_cx').AsInteger:=vDadosIni.vCodUsuario;
            FTotalContasSelecionadas := FTotalContasSelecionadas + 1;
            dataSet.Post;
          end
          else
            tipoCNTDiferente := true;
        end
        else
        begin
          dataSet.Edit;
          dataSet.FieldByName('sel').AsString := 'S';
  //        dataSet.FieldByName('op_cx').AsInteger:=vDadosIni.vCodUsuario;
          FTotalContasSelecionadas := FTotalContasSelecionadas + 1;
          dataSet.Post;
        end;
        dataSet.Next;
      end;
    finally
      dataSet.First;
      dataSet.EnableControls;
    end;

    if tipoCNTDiferente then
      Application.MessageBox(Pchar('Uma ou mais linhas não foram marcadas devido ao Tipo de Conta : ''' + rCTP.vTipoCNT + ''' ser diferente das linhas selecionadas anteriormente'), 'Informação', MB_OK + MB_ICONINFORMATION);

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TContasAPagar._montaSqlAdicional(pQuitados, pNaoquitados, pDespesas,
  pFornecedores: boolean);
begin
  { sqlAdicional := '';
  if pQuitados and pNaoquitados then
  else
  begin
    if pNaoquitados then
      sqlAdicional := sqlAdicional + ' and (status_CTP is null or status_CTP = '''') '
    else
      sqlAdicional := sqlAdicional + ' and not status_CTP is null ';
  end;
  if pDespesas and pFornecedores then
  else
  begin
    if pDespesas then
      sqlAdicional := sqlAdicional + ' and tipo_ctp = ''D'' '
    else
      sqlAdicional := sqlAdicional + ' and tipo_ctp = ''F'' ';
  end;
  }
end;

function TContasAPagar._pagarComControleSelecionado(pState: TDataSetState): boolean;
begin
	if dtSetCtrlTemp.FieldByName('DOCS').AsString = 'CP' then
  begin
  	_abreFormLancCTP(pState);
  end
  else if dtSetCtrlTemp.FieldByName('DOCS').AsString = 'S1' then
  begin
    ch.vSaldoChequesSelecionados := 0;
    _abreFormLancS1(pState);
  end
  else if dtSetCtrlTemp.FieldByName('DOCS').AsString = 'S2' then
  begin
    cr.vSaldoCreditosSelecionados := 0;
    _abreFormLancS2(pState);
  end
  else
  begin
    _abreFormLancN_S2(pState);
  end;
end;

function TContasAPagar._PContasTemp: boolean;
begin
  try
    result := true;
    if dtSetPContas = nil then
      _listaPContas
    else
      dtSetPContas.Open;

    dsPContasTemp := TDataSource.Create(nil);
    dtSetPContasTemp := TClientDataSet.Create(nil);
    dtSetPContasTemp.Close;
    dtSetPContasTemp.FieldDefs.Clear;
    dtSetPContasTemp.FieldDefs.Add('N_CONTA_PLC', ftFloat, 0, false);
    dtSetPContasTemp.FieldDefs.Add('DESC_PLC', ftString, 60, false);
    dtSetPContasTemp.FieldDefs.Add('TIPO_PLC', ftString, 1, false);

    dtSetPContasTemp.CreateDataSet;
    dtSetPContasTemp.LogChanges := False; //LogChanges = False, desabilita os logs de alteração e inserção dando performance na manipulação do ClientDataset

    try
    	dtSetPContas.DisableControls;
      dtSetPContas.First;
      while not dtSetPContas.Eof do
      begin
        dtSetPContasTemp.Append;
        dtSetPContasTemp.FieldByName('N_CONTA_PLC').AsFloat := dtSetPContas.FieldByName('N_CONTA_PLC').AsFloat;
        dtSetPContasTemp.FieldByName('DESC_PLC').AsString := Copy(dtSetPContas.FieldByName('DESC_PLC').AsString,1,60);
        dtSetPContasTemp.FieldByName('TIPO_PLC').AsString := dtSetPContas.FieldByName('TIPO_PLC').AsString;
        dtSetPContasTemp.Post;
        dtSetPContas.Next;
      end;
    finally
      dtSetPContas.EnableControls;
    end;
    dsPContasTemp.DataSet := dtSetPContasTemp;
  except
    result := false;
  end;
end;

function TContasAPagar._procuraCheque(vnch: string;vcontrole: integer): boolean;
begin
  result := true;
  if vnch <> '' then
  begin

   if ExecutaComandosSql('select * from Contas_a_Pagar ' +
    ' where n_cheq_ctp = ''' +vnch+''' '+
    ' and codigo_ctrl = ' +inttostr(vcontrole)+
    ' and codigo_emp = ' + vDadosIni.codEmpresa+' and cod_contrp <> '+inttostr(dataSet.FieldByName('COD_CONTRP').asinteger)) then
    if Application.MessageBox(Pchar('Nº de Cheque já utilizado para este controle.' + chr(13) + 'Deseja continuar?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION +
      MB_DEFBUTTON2) = mrNo then
    begin
      vNomeCampoErro := 'DBEdit11';
      result := false;
    end;
  end;
end;

//procedure TContasAPagar._QRBand1BeforePrint(Sender: TQRCustomBand;
//  var PrintBand: Boolean);
//begin
//  vTotalVlConta := 0;
//  vTotalVlPago := 0;
//end;

procedure TContasAPagar._qrBandDetalheCTPAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
  if not vRelSomenteSelecionado then
  begin
    vSubTotDiaVlConta := vSubTotDiaVlConta + dataSet.FieldByName('Valor_ctp').AsFloat;
    vTotalVlConta := vTotalVlConta + dataSet.FieldByName('Valor_ctp').AsFloat;
    vSubTotDiaVlPago := vSubTotDiaVlPago + dataSet.FieldByName('VALOR_PAGO').AsFloat;
    vTotalVlPago := vTotalVlPago + dataSet.FieldByName('VALOR_PAGO').AsFloat;
    vltotalgeralconta:=vltotalgeralconta+dataSet.FieldByName('Valor_ctp').AsFloat;
    vltotalgeralvlpago:=vltotalgeralvlpago+dataSet.FieldByName('VALOR_PAGO').AsFloat;
  end
  else
  begin
    if BandPrinted then
    begin
      vSubTotDiaVlConta := vSubTotDiaVlConta + dataSet.FieldByName('Valor_ctp').AsFloat;
      vTotalVlConta := vTotalVlConta + dataSet.FieldByName('Valor_ctp').AsFloat;
      vSubTotDiaVlPago := vSubTotDiaVlPago + dataSet.FieldByName('VALOR_PAGO').AsFloat;
      vTotalVlPago := vTotalVlPago + dataSet.FieldByName('VALOR_PAGO').AsFloat;
      vltotalgeralconta:=vltotalgeralconta+dataSet.FieldByName('Valor_ctp').AsFloat;
      vltotalgeralvlpago:=vltotalgeralvlpago+dataSet.FieldByName('VALOR_PAGO').AsFloat;
    end;
  end;

end;

procedure TContasAPagar._qrBandPageFooterBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  FrmCadContasAPagar.qrLabel33.caption := format('%m', [vTotalVlConta]);
  FrmCadContasAPagar.QRLabel24.caption := format('%m', [vTotalVlConta]);

  FrmCadContasAPagar.QRLabel72.caption := format('%m', [vTotalVlPago]);
  FrmCadContasAPagar.QRLabel25.caption := format('%m', [vTotalVlPago]);
//  vTotalVlConta:=0;
//  vTotalVlPago:=0;
end;

procedure TContasAPagar._qrBandSubtotalBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if (vSubTotDiaVlConta = 0) and (vSubTotDiaVlPago = 0) then
    PrintBand := False
  else
  begin
    FrmCadContasAPagar.QrLabel59.Caption := 'TOTAL:';
    FrmCadContasAPagar.QRLabel26.Caption := 'TOTAL:';
    
    FrmCadContasAPagar.QrLabel66.Caption := format('%m', [vSubTotDiaVlConta]);
    FrmCadContasAPagar.QRLabel27.Caption := format('%m', [vSubTotDiaVlConta]);

    FrmCadContasAPagar.QrLabel71.Caption := format('%m', [vSubTotDiaVlPago]);
    FrmCadContasAPagar.QRLabel29.Caption := format('%m', [vSubTotDiaVlPago]);
  end;
  vSubTotDiaVlConta := 0;
  vSubTotDiaVlPago := 0;
end;

procedure TContasAPagar._qrpContasAPagarAfterPreview(Sender: TObject);
begin
    vTotalVlConta := 0;
    vTotalVlPago := 0;
end;

procedure TContasAPagar._qrpContasAPagarBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
    vTotalVlConta := 0;
    vTotalVlPago := 0;
end;

function TContasAPagar._quitarContasConciliacaoCartao(pLote: Integer;pCartaoCDS: TClientDataSet; pCodigoUnificada: Integer = 0): Boolean;
var
  I: Integer;
  vGravarErro: boolean;
  vErro, vTipCNT: string;
  vHistoricoAjuste: string;
  vCodAdm, vCodEmpresa: Integer;
  vCodFornec: Integer;
  vNomeFornec, vCpfCNPJFornec: string;
  vHistPadraoUnificadas: string;
  buscas2: TIBQuery;

  function gerarLoteQuit(pGerarLote:boolean):boolean;
  var
  	vNumLotePag, vCodMaxBaixaPag: Integer;
  begin
    result:=true;

    if not pGerarLote then
      exit;
     
    loteLanc._abreLoteLanc;

    vNumLotePag := Gencodigo('LOTE_LANC', dtmContasAPagar.SpIncCodigo, vDadosIni.codEmpresa);

    if not vDadosIni.vEmp.vFinanceiroUnificado then
    begin
      buscas2.close;
      buscas2.SQL.Text := ' select emp.cod_empresa from empresa_fisica emp ' +
        ' where emp.cod_empresa > 0 ' +
        ' and emp.cod_empresa <> ' + vDadosIni.codEmpresa;
      buscas2.Open;

      if not buscas2.IsEmpty then
      begin
        buscas2.close;
        buscas2.SQL.Text := ' select max(lot.n_lote) from empresa_fisica emp ' +
          ' inner join lote_lanc lot on lot.codigo_emp = emp.cod_empresa ' +
          ' where emp.cod_empresa > 0 ';
        buscas2.Open;
      end
      else
      begin
        buscas2.close;
        buscas2.SQL.Text := ' select max(lot.n_lote) from lote_lanc lot ' +
          ' where lot.codigo_emp = ' + vDadosIni.codEmpresa;
        buscas2.Open;
      end;

      vCodMaxBaixaPag := buscas2.FieldByName('max').AsInteger + 1;

      if (vCodMaxBaixaPag > vNumLotePag) then
      begin
        buscas2.close;
        buscas2.SQL.Text := ' update CODIGO set valor = ' + IntToStr(vCodMaxBaixaPag) +
          ' where tabela = ''LOTE_LANC'' ' +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas2.ExecSQL;

        vNumLotePag := vCodMaxBaixaPag;
      end;
    end
    else
    begin
      buscas2.close;
      buscas2.SQL.Text := ' select max(lot.n_lote) from lote_lanc lot ' +
        ' where lot.codigo_emp in ' + vDadosIni.vEmp.vCodigoUnificadas;
      buscas2.Open;

      vCodMaxBaixaPag := buscas2.FieldByName('max').AsInteger + 1;

      if (vCodMaxBaixaPag > vNumLotePag) then
      begin
        buscas2.close;
        buscas2.SQL.Text := ' update CODIGO set valor = ' + IntToStr(vCodMaxBaixaPag) +
          ' where tabela = ''LOTE_LANC'' ' +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas2.ExecSQL;

        vNumLotePag := vCodMaxBaixaPag;
      end;
    end;

    loteLanc.Insert;
    loteLanc.dataSet.FieldByName('DATA_LOTE').AsDateTime := vDadosIni.diaFFinanceiro + 1;
    loteLanc.dataSet.FieldByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
    loteLanc.dataSet.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
    loteLanc.dataSet.FieldByName('N_LOTE').AsInteger := vNumLotePag;
    result:= loteLanc.post;
    if result then
      result := loteLanc.Apply;
    if not result then
    begin
      vGravarErro :=true;
      vErro:='Ocorreu um erro ao gerar o número de lote para quitação de contas referentes a ajustes negativos.';
      Exit;
    end;

    FNumLoteLanc := loteLanc.dataSet.FieldByName('N_LOTE').AsInteger;
    FDataLoteLanc := loteLanc.dataSet.FieldByName('DATA_LOTE').AsDateTime;
  end;
begin
  Result := true;
  vGravarErro := false;

  vHistPadraoUnificadas := '';
  if vDadosIni.vEmp.vFinanceiroUnificado then
    vHistPadraoUnificadas := ' EMP: ' + vDadosIni.StrZero(pCodigoUnificada, 3);

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;
  
  try
    try
      if not vDadosIni.VerificarinicioFechFinan(buscas) then
        exit;
      vDadosIni.abreStatusProcessamento('', 'Processando ajustes negativos');
      if not dataSet.Active then
        montaSelect(' select ' + Fsql_campos + ' from contas_a_pagar ' +
         Fsql_inner +
     		Fsql_inner_pag +
     		' where contas_a_pagar.cod_contrp = -1 ' +
         ' and contas_a_pagar.codigo_emp = ' + vDadosIni.codEmpresa);
      _definirDataSetQuitacaoCTP;
      _lancamentosTemp;
      if vContLigL = nil then
        vContLigL := TContaLigacaoImp.create;
      FNumLoteLanc := 0;
      FDataLoteLanc := 0;
      //Ajustes
      try
        for I := 1 downto  0 do
        begin
          if i=1 then
            pCartaoCDS.Filter := ' STATUS_ADM = 1 and IND_OR_AJUSTE_ADM > 0 and VALORPARCELA < 0 ' //os pagos primeiro
          else
          	pCartaoCDS.Filter := ' STATUS_ADM = 0 and IND_OR_AJUSTE_ADM > 0 and VALORPARCELA < 0 '; //só inclui o agendado no dataset temporário se o pago não tiver sido incluido.
          pCartaoCDS.Filtered := True;
          pCartaoCDS.First;
          while not pCartaoCDS.Eof do
          begin
          	vCodAdm := pCartaoCDS.FieldByName('COD_ADM').AsInteger;
            if pCartaoCDS.FieldByName('CONFERE').AsString = 'S' then
            	vCodEmpresa := pCartaoCDS.FieldByName('COD_EMP_MULT').AsInteger
            else
              vCodEmpresa := StrToInt(vDadosIni.codEmpresa);

          	buscas2.Close;
            buscas2.SQL.Text := ' select coalesce(adm.cod_cliente, 0) cod_cliente, ' +
            	' coalesce(c.nome_cliente, '''') nome_cliente, ' +
              ' coalesce(c.cpfcgc, '''') cpfcgc from adm_cartao adm ' +
              ' inner join clientes c on adm.cod_cliente = c.cod_cliente and adm.cod_empresa = c.cod_empresa '+
              ' where adm.cod_adm = ' + IntToStr(vCodAdm) +
              ' and adm.cod_empresa = ' + IntToStr(vCodEmpresa);
            buscas2.Open;

            vCodFornec     := vDadosIni.IfThen(buscas2.IsEmpty, 0,  buscas2.FieldByName('cod_cliente').AsInteger);
            vNomeFornec    := vDadosIni.IfThen(buscas2.IsEmpty, '', trim(buscas2.FieldByName('nome_cliente').AsString));
            vCpfCNPJFornec := vDadosIni.IfThen(buscas2.IsEmpty, '', buscas2.FieldByName('cpfcgc').AsString);

          	if pCartaoCDS.FieldByName('CONFERE').AsString = 'S' then
            begin
         			buscas2.Close;
              buscas2.SQL.Text := ' select first 1 cod_contrp, codigo_emp, cod_emp_mult from contas_a_pagar ' +
              	' where id_financ_confere = ' + IntToStr(pCartaoCDS.FieldByName('ID_FINANC_CONFERE').AsInteger) +
                ' and cod_emp_mult = ' + IntToStr(pCartaoCDS.FieldByName('COD_EMP_MULT').AsInteger) +
                ' order by cod_contrp desc ';
              buscas2.Open;

              if buscas2.IsEmpty then
              begin
                fQuitacaoCTP.Insert;
                fQuitacaoCTP.FieldByName('CADCTP').AsString:='S';
                fQuitacaoCTP.FieldByName('CADLANC').AsString:='S';
              end
              else
              begin
                fQuitacaoCTP.Edit;
                fQuitacaoCTP.FieldByName('CADCTP').AsString:='N';
                fQuitacaoCTP.FieldByName('CADLANC').AsString:='S';
                fQuitacaoCTP.FieldByName('COD_CONTRP').AsInteger := buscas2.FieldByName('COD_CONTRP').AsInteger;
              end;
            end
            else
            begin
              try
                fQuitacaoCTP.Filter := ' NSU_RO_ADM = ' + trim(pCartaoCDS.FieldByName('NSU_RO_ADM').AsString);
                fQuitacaoCTP.Filtered:=true;
                if not fQuitacaoCTP.IsEmpty then
                begin
                  pCartaoCDS.Next;
                  Continue;
                end;
              finally
                fQuitacaoCTP.Filter:='';
                fQuitacaoCTP.Filtered:=false;
              end;


              buscas.Close;
              buscas.SQL.Text := ' select ctp.COD_CONTRP,ctp.nsu_ro_adm, ctp.status_ctp from contas_a_pagar ctp '+
                ' where ctp.nsu_ro_adm = ' + QuotedStr(pCartaoCDS.FieldByName('NSU_RO_ADM').AsString)+
                ' and ctp.codigo_emp = ' + vDadosIni.codEmpresa;
              buscas.Open;
              if not buscas.IsEmpty then
              begin
                if not (trim(buscas.FieldByName('STATUS_CTP').AsString) = 'QUITADO') and (pCartaoCDS.FieldByName('STATUS_ADM').AsInteger = 1) then
                begin
                  fQuitacaoCTP.Insert;
                  fQuitacaoCTP.FieldByName('CADCTP').AsString:='N';
                  fQuitacaoCTP.FieldByName('CADLANC').AsString:='S';
                  fQuitacaoCTP.FieldByName('COD_CONTRP').AsInteger := buscas.FieldByName('COD_CONTRP').AsInteger;
                end
                else
                begin
                  pCartaoCDS.Next;
                  Continue;
                end;
              end
              else if pCartaoCDS.FieldByName('STATUS_ADM').AsInteger = 1 then
              begin
                fQuitacaoCTP.Insert;
                fQuitacaoCTP.FieldByName('CADCTP').AsString:='S';
                fQuitacaoCTP.FieldByName('CADLANC').AsString:='S';
              end
              else
              begin
                fQuitacaoCTP.Insert;
                fQuitacaoCTP.FieldByName('CADCTP').AsString:='S';
                fQuitacaoCTP.FieldByName('CADLANC').AsString:='N';
              end;
            end;
            //jc
            vTipCNT:= retornaValor('select ctrl.nat_lanc as valor from controles ctrl ' +
              ' where ctrl.codigo_ctrl = ' + inttostr(pCartaoCDS.FieldByName('CODIGO_CTRL').AsInteger)+
              ' and ctrl.codigo_emp= ' + vDadosIni.codEmpresa);
            if vTipCNT='' then
              vTipCNT:='C';

            if (pCartaoCDS.FieldByName('CONFERE').AsString = 'S') then
            begin
            	vHistoricoAjuste := 'AJUSTES CONFORME ' + UpperCase(Trim(pCartaoCDS.FieldByName('DESCR_OCORRENCIA_CONFERE').AsString)) + vHistPadraoUnificadas;

              if trim(pCartaoCDS.FieldByName('COD_AJUSTE_COD').AsString) <> '' then
            	begin
              	buscas.Close;
                buscas.SQL.Text := ' select AJT.N_CONTA_PLC_S as N_CONTA_PLC_ADM, 0 N_CONTA_PLCE_ADM FROM CONCILIACAO_ADQUIRENTE ADQ ' +
                  ' INNER JOIN CONCILIACAO_COD_AJUSTE_ADQ AJT_ADQ ON AJT_ADQ.ID_ADQUIRENTE = ADQ.ID ' +
                  ' INNER JOIN CONCILIACAO_COD_AJUSTE AJT ON AJT.ID = AJT_ADQ.ID_COD_AJUSTE ' +
                  ' WHERE ADQ.ID = ' + IntToStr(pCartaoCDS.FieldByName('ACQUIRER_ID').AsInteger) +
                  ' AND AJT_ADQ.CODIGO = ' + QuotedStr(trim(pCartaoCDS.FieldByName('COD_AJUSTE_COD').AsString));
                buscas.Open;
              end
              else if trim(pCartaoCDS.FieldByName('TIPO_LANCAMENTO_COD').AsString) <> '' then
              begin
                buscas.Close;
                buscas.SQL.Text := ' select TLANC.N_CONTA_PLC_S N_CONTA_PLC_ADM, 0 N_CONTA_PLCE_ADM FROM CONCILIACAO_ADQUIRENTE ADQ ' +
                  ' INNER JOIN CONCILIACAO_TIPO_LANC_ADQ TLANC_ADQ ON TLANC_ADQ.ID_AQUIRENTE = ADQ.ID ' +
                  ' INNER JOIN CONCILIACAO_TIPO_LANC TLANC ON TLANC.ID = TLANC_ADQ.ID_TIPO_LANC ' +
                  ' WHERE ADQ.ID = ' + IntToStr(pCartaoCDS.FieldByName('ACQUIRER_ID').AsInteger) +
                  ' AND TLANC_ADQ.CODIGO = ' + QuotedStr(trim(pCartaoCDS.FieldByName('TIPO_LANCAMENTO_COD').AsString));
                buscas.Open;
              end
              else
            	begin
                buscas.Close;
                buscas.SQL.Text := ' select N_CONTA_PLC as N_CONTA_PLC_ADM, 0 N_CONTA_PLCE_ADM from CONCILIACAO_DESCR_TIPO ' +
                  ' where DESCRICAO = ' + QuotedStr(pCartaoCDS.FieldByName('DESCR_OCORRENCIA_CONFERE').AsString) +
                  ' and COD_EMPRESA = ' + vDadosIni.codEmpresa +
                  ' and NATUREZA = ''S'' ';
                buscas.Open;
              end;
            end
            else
            begin
            	vHistoricoAjuste := 'AJUSTES CONFORME ' + pCartaoCDS.FieldByName('IND_OR_DESC_AJUSTE').AsString + vHistPadraoUnificadas;

              buscas.Close;
              buscas.SQL.Text := 'select N_CONTA_PLC_ADM, N_CONTA_PLCE_ADM from OCORRENCIA_ADM' +
                ' where TIPO_TABELA_ADM = ''TABELAV''' +
                ' and IDTABELA_ADM = ' + IntToStr(pCartaoCDS.FieldByName('IND_OR_AJUSTE_ADM').AsInteger);
              buscas.Open;
            end;

            if not vContLigL.vPCont._abrirPContas(buscas.FieldByName('N_CONTA_PLC_ADM').AsFloat) then
            begin
              fQuitacaoCTP.cancel;
              raiseExceptionCreate('Conta de Ajuste de Cartões não encontrada' + #13 +
                'Conta: ' + buscas.FieldByName('N_CONTA_PLC_ADM').AsString, '');
            end
            else if vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString <> 'S' then
            begin
              fQuitacaoCTP.Cancel;
              raiseExceptionCreate('Conta de Ajuste de Cartões com tipo diferente de "S" de Saída', '');
            end;
            if (pCartaoCDS.FieldByName('CONFERE').AsString = 'S') then
	            fQuitacaoCTP.FieldByName('ID_FINANC_CONFERE').AsInteger := pCartaoCDS.FieldByName('ID_FINANC_CONFERE').AsInteger;
            fQuitacaoCTP.FieldByName('CODIGO_CTRL').AsInteger := pCartaoCDS.FieldByName('CODIGO_CTRL').AsInteger;
            fQuitacaoCTP.FieldByName('HISTORICO_L').AsString := UpperCase(trim(vHistoricoAjuste));
            fQuitacaoCTP.FieldByName('TIPO_L').AsString := 'S';
            fQuitacaoCTP.FieldByName('TIP_CNT').AsString := vTipCNT;
//            fQuitacaoCTP.FieldByName('TIP_CNT').AsString := 'N';
            fQuitacaoCTP.FieldByName('TIPO_CTP').AsString := 'D';
            fQuitacaoCTP.FieldByName('TIPO').AsString := 'N';
            fQuitacaoCTP.FieldByName('data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
            fQuitacaoCTP.FieldByName('DATA_ENT_CTP').AsDateTime := vDadosIni.diaFFinanceiro+1;
            fQuitacaoCTP.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro+1;
            fQuitacaoCTP.FieldByName('DATQ_CTP').AsDateTime := vDadosIni.diaFFinanceiro + 1;
            fQuitacaoCTP.FieldByName('US_BX').AsInteger := vDadosIni.vCodUsuario;
            fQuitacaoCTP.FieldByName('DT_COMPENS').AsDateTime := vDadosIni.diaFFinanceiro + 1;
            fQuitacaoCTP.FieldByName('DATA_VENC_CTP').AsDateTime := pCartaoCDS.FieldByName('DATA_PREV_PAG').AsDateTime;
            fQuitacaoCTP.FieldByName('DATA_BAIXA').AsDateTime := vDadosIni.diaFFinanceiro+1;//rCTP.vDataBaixa;
            fQuitacaoCTP.FieldByName('DATA_PREV_PG').AsDateTime := pCartaoCDS.FieldByName('DATA_PREV_PAG').AsDateTime;
            fQuitacaoCTP.FieldByName('N_CONTA_PLC').AsFloat := buscas.FieldByName('N_CONTA_PLC_ADM').AsFloat;
            fQuitacaoCTP.FieldByName('VALOR_L').AsFloat := Abs(pCartaoCDS.FieldByName('VALORPARCELA').AsFloat);
            fQuitacaoCTP.FieldByName('VALOR_CTP').AsFloat := Abs(pCartaoCDS.FieldByName('VALORPARCELA').AsFloat);
            fQuitacaoCTP.FieldByName('VALOR_PAGO').AsFloat := Abs(pCartaoCDS.FieldByName('VALORPARCELA').AsFloat);
            fQuitacaoCTP.FieldByName('SAIDA_PROC_AUTO').AsString := 'S';
            fQuitacaoCTP.FieldByName('ARQ_EXTRATO_ADM').AsString := pCartaoCDS.FieldByName('ARQ_EXTRATO_ADM').AsString;
            fQuitacaoCTP.FieldByName('DATA_ARQUIVO').AsDateTime := pCartaoCDS.FieldByName('DATA_ARQUIVO').AsDateTime;
            fQuitacaoCTP.FieldByName('COD_ADM').AsInteger := pCartaoCDS.FieldByName('COD_ADM').AsInteger;
    //          fQuitacaoCTP.FieldByName('COD_CONTRP').AsInteger :=
            fQuitacaoCTP.FieldByName('CODIGO_EMP').AsInteger:= StrToInt(vDadosIni.codEmpresa);
            fQuitacaoCTP.FieldByName('COD_EMP_MULT').AsInteger :=
            	vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodigoUnificada > 0), pCodigoUnificada, strToInt(vDadosIni.codEmpresa));
        //    fQuitacaoCTP.FieldByName('NUM_NOTA_NFE').AsInteger;
            fQuitacaoCTP.FieldByName('COD_FORN_NFE').AsInteger:= vCodFornec;
        //    fQuitacaoCTP.FieldByName('N_CONTA_PLC_OR: TFloatField;';
            fQuitacaoCTP.FieldByName('NOME_FOR_CTP').AsString:= vNomeFornec;
            fQuitacaoCTP.FieldByName('CPF_CGC_F').AsString:= vCpfCNPJFornec;
            fQuitacaoCTP.FieldByName('ENTRA_PREVISAO').AsString := 'S';

            if trim(pCartaoCDS.FieldByName('COD_AJUSTE_COD').AsString) <> '' then
            	fQuitacaoCTP.FieldByName('HISTORICO_CTP').AsString := 'AJUSTES CONFORME ' + UpperCase(Trim(pCartaoCDS.FieldByName('DESCR_OCORRENCIA_CONFERE').AsString)) + vHistPadraoUnificadas
            else if trim(pCartaoCDS.FieldByName('TIPO_LANCAMENTO_COD').AsString) <> '' then
            	fQuitacaoCTP.FieldByName('HISTORICO_CTP').AsString := 'AJUSTES CONFORME ' + UpperCase(Trim(pCartaoCDS.FieldByName('DESCR_OCORRENCIA_CONFERE').AsString)) + vHistPadraoUnificadas
            else
            	fQuitacaoCTP.FieldByName('HISTORICO_CTP').AsString := 'AJUSTES CONFORME ' + UpperCase(Trim(pCartaoCDS.FieldByName('IND_OR_DESC_AJUSTE').AsString)) + vHistPadraoUnificadas;

            if pCartaoCDS.FieldByName('STATUS_ADM').AsInteger=1then
              fQuitacaoCTP.FieldByName('STATUS_CTP').AsString := 'QUITADO';
            fQuitacaoCTP.FieldByName('NSU_RO_ADM').AsString:= trim(pCartaoCDS.FieldByName('NSU_RO_ADM').AsString);
            fQuitacaoCTP.FieldByName('RO_ADM').AsInteger:= pCartaoCDS.FieldByName('RO_ADM').AsInteger;
            fQuitacaoCTP.FieldByName('VL_CONTABIL').AsFloat:=Abs(pCartaoCDS.FieldByName('VALORPARCELA').AsFloat);
            fQuitacaoCTP.FieldByName('REF_FRETE').AsString:='N';
        //    fQuitacaoCTP.FieldByName('LOTE').AsInteger:= FNumLoteLanc;
        //    fQuitacaoCTP.FieldByName('COD_EQUIP').AsInteger;
        //    fQuitacaoCTP.FieldByName('DATA_CXL: TDateTimeField;' +
        //    fQuitacaoCTP.FieldByName('NATL_CTP: TStringField;
        //    fQuitacaoCTP.FieldByName('N_DOC_CTP: TStringField;
        //    fQuitacaoCTP.FieldByName('TIPO_FOR_DUP: TStringField;
        //    fQuitacaoCTP.FieldByName('SUBT_FOR_DUP: TStringField;
        //    fQuitacaoCTP.FieldByName('SELEC: TStringField;
        //    fQuitacaoCTP.FieldByName('N_CHEQ_CTP: TStringField;
        //    fQuitacaoCTP.FieldByName('NOMINAL_CTP: TStringField;
        //    fQuitacaoCTP.FieldByName('CHASSI_CONC: TStringField;
        //    fQuitacaoCTP.FieldByName('ACEITE_CTP: TStringField;' +
        //    fQuitacaoCTP.FieldByName('NOME_BANCO_DUPL: TStringField;
        //    fQuitacaoCTP.FieldByName('STATUS_HONDA: TStringField;
        //    fQuitacaoCTP.FieldByName('HISTRAT: TStringField;
        //    fQuitacaoCTP.FieldByName('TPRAT: TStringField;
        //    fQuitacaoCTP.FieldByName('SERIE: TStringField;
        //    fQuitacaoCTP.FieldByName('N_DOC_CTP_ORIG: TStringField;
        //    fQuitacaoCTP.FieldByName('VALOR_CTP_ORIG: TFloatField;
        //    fQuitacaoCTP.FieldByName('SEL: TStringField;
            fQuitacaoCTP.Post;
            pCartaoCDS.Next;
          end;
        end;
      finally
        pCartaoCDS.Filtered := False;
        pCartaoCDS.Filter := '';
      end;

      if fQuitacaoCTP.RecordCount>0 then
      begin
        fQuitacaoCTP.First;
        while not fQuitacaoCTP.EOF do
        begin
          if (fQuitacaoCTP.FieldByName('CADCTP').AsString='S') then
          begin
              buscas.Close;
              buscas.SQL.Text := 'insert into CONTAS_A_PAGAR (COD_CONTRP,NUM_NOTA_NFE, COD_FORN_NFE'+
                ', CODIGO_CTRL, N_CONTA_PLC, NOME_FOR_CTP, DATA_ENT_CTP, N_DOC_CTP, VALOR_CTP'+
                ', STATUS_CTP, DATQ_CTP, NATL_CTP,DATA_VENC_CTP, TIPO_CTP,LOTE, TIPO_FOR_DUP'+
                ', SUBT_FOR_DUP, SELEC, HISTORICO_CTP, DATA_CXL, TIP_CNT, N_CHEQ_CTP, NOMINAL_CTP'+
                ', DT_COMPENS, CHASSI_CONC, DATA_BAIXA, VALOR_PAGO, ACEITE_CTP, VL_CONTABIL, CODIGO_EMP'+
                ', CPF_CGC_F, COD_EMP_MULT, NOME_BANCO_DUPL, STATUS_HONDA, DATA_PREV_PG, COD_EQUIP'+
                ', HISTRAT, N_CONTA_PLC_OR, TPRAT, DTREFERENCIA, ENTRA_PREVISAO, SERIE, N_DOC_CTP_ORIG'+
                ', VALOR_CTP_ORIG, REF_FRETE, OP_CX, COD_OBS, NSU_RO_ADM'+
                ', ARQ_EXTRATO_ADM, DATA_ARQUIVO'+
                ',RO_ADM,COD_ADM,US_BX,ID_FINANC_CONFERE) '+
                'values (:COD_CONTRP , :NUM_NOTA_NFE, :COD_FORN_NFE'+
                ', :CODIGO_CTRL, :N_CONTA_PLC, :NOME_FOR_CTP, :DATA_ENT_CTP, :N_DOC_CTP, :VALOR_CTP'+
                ', :STATUS_CTP, :DATQ_CTP, :NATL_CTP, :DATA_VENC_CTP, :TIPO_CTP, :LOTE, :TIPO_FOR_DUP'+
                ', :SUBT_FOR_DUP, :SELEC, :HISTORICO_CTP, :DATA_CXL, :TIP_CNT, :N_CHEQ_CTP, :NOMINAL_CTP'+
                ', :DT_COMPENS,:CHASSI_CONC, :DATA_BAIXA, :VALOR_PAGO, :ACEITE_CTP, :VL_CONTABIL, :CODIGO_EMP'+
                ', :CPF_CGC_F, :COD_EMP_MULT, :NOME_BANCO_DUPL, :STATUS_HONDA, :DATA_PREV_PG, :COD_EQUIP'+
                ', :HISTRAT, :N_CONTA_PLC_OR, :TPRAT, :DTREFERENCIA, :ENTRA_PREVISAO, :SERIE, :N_DOC_CTP_ORIG' +
                ', :VALOR_CTP_ORIG, :REF_FRETE, :OP_CX, :COD_OBS, :NSU_RO_ADM' +
                ', :ARQ_EXTRATO_ADM, :DATA_ARQUIVO'+
                ',:RO_ADM,:COD_ADM,:US_BX,:ID_FINANC_CONFERE)';
              buscas.ParamByName('COD_CONTRP').AsInteger:=Gencodigo('CONTAS_A_PAGAR',dtmContasAPagar.SpIncCodigo, vDadosIni.codEmpresa);
              if (fQuitacaoCTP.FieldByName('ID_FINANC_CONFERE').AsInteger > 0) then
		            buscas.ParamByName('ID_FINANC_CONFERE').AsInteger := fQuitacaoCTP.FieldByName('ID_FINANC_CONFERE').AsInteger;
              buscas.ParamByName('NUM_NOTA_NFE').AsString:='';
              buscas.ParamByName('COD_FORN_NFE').AsInteger:=fQuitacaoCTP.FieldByName('COD_FORN_NFE').AsInteger;
              buscas.ParamByName('CODIGO_CTRL').AsInteger:=fQuitacaoCTP.FieldByName('CODIGO_CTRL').AsInteger;
              buscas.ParamByName('N_CONTA_PLC').AsFloat:=fQuitacaoCTP.FieldByName('N_CONTA_PLC').AsFloat;
              buscas.ParamByName('NOME_FOR_CTP').AsString:=fQuitacaoCTP.FieldByName('NOME_FOR_CTP').AsString;
              buscas.ParamByName('DATA_ENT_CTP').AsDateTime:=fQuitacaoCTP.FieldByName('DATA_ENT_CTP').AsDateTime;
              buscas.ParamByName('N_DOC_CTP').AsString:='';
              buscas.ParamByName('VALOR_CTP').AsFloat:=fQuitacaoCTP.FieldByName('VALOR_CTP').AsFloat;
              if fQuitacaoCTP.FieldByName('STATUS_CTP').AsString='QUITADO' then
              begin
                if not gerarLoteQuit(FNumLoteLanc=0) then
                  exit;
                buscas.ParamByName('STATUS_CTP').AsString:='QUITADO';
                buscas.ParamByName('DATQ_CTP').AsDateTime:=fQuitacaoCTP.FieldByName('DATQ_CTP').AsDateTime;
                buscas.ParamByName('LOTE').AsInteger:=FNumLoteLanc;
                buscas.ParamByName('US_BX').AsInteger:=vDadosIni.vCodUsuario;
                buscas.ParamByName('DATA_BAIXA').AsDate:=fQuitacaoCTP.FieldByName('DATA_BAIXA').AsDateTime;
                buscas.ParamByName('VALOR_PAGO').AsFloat:=fQuitacaoCTP.FieldByName('VALOR_PAGO').AsFloat ;
                buscas.ParamByName('DT_COMPENS').AsDate:=fQuitacaoCTP.FieldByName('DT_COMPENS').AsDateTime;
              end
              else
              begin
                buscas.ParamByName('STATUS_CTP').Value:=null;
                buscas.ParamByName('DATQ_CTP').Value:=null;
                buscas.ParamByName('LOTE').Value:=null;
                buscas.ParamByName('US_BX').Value:=null;
                buscas.ParamByName('DATA_BAIXA').Value:=null;
                buscas.ParamByName('VALOR_PAGO').Value:=null;
                buscas.ParamByName('DT_COMPENS').Value:=null;
              end;
              buscas.ParamByName('DTREFERENCIA').AsDate:=fQuitacaoCTP.FieldByName('DTREFERENCIA').AsDateTime;
              buscas.ParamByName('DATA_PREV_PG').AsDateTime:=fQuitacaoCTP.FieldByName('DATA_PREV_PG').AsDateTime;
              buscas.ParamByName('DATA_VENC_CTP').AsDateTime:=fQuitacaoCTP.FieldByName('DATA_VENC_CTP').AsDateTime;
              buscas.ParamByName('NATL_CTP').Value:=null;
              buscas.ParamByName('TIPO_CTP').AsString:=fQuitacaoCTP.FieldByName('TIPO_CTP').AsString;
              buscas.ParamByName('TIPO_FOR_DUP').AsString:='';
              buscas.ParamByName('SUBT_FOR_DUP').AsString:='';
              buscas.ParamByName('SELEC').Value:=null;
              buscas.ParamByName('HISTORICO_CTP').AsString:=fQuitacaoCTP.FieldByName('HISTORICO_CTP').AsString;
              buscas.ParamByName('DATA_CXL').Value:=null;
              buscas.ParamByName('TIP_CNT').AsString:=fQuitacaoCTP.FieldByName('TIP_CNT').AsString;
              buscas.ParamByName('N_CHEQ_CTP').Value:=null;
              buscas.ParamByName('NOMINAL_CTP').Value:=null;
              buscas.ParamByName('CHASSI_CONC').Value:=null;
              buscas.ParamByName('ACEITE_CTP').Value:=null;
              buscas.ParamByName('VL_CONTABIL').AsFloat:=fQuitacaoCTP.FieldByName('VL_CONTABIL').AsFloat;
              buscas.ParamByName('CODIGO_EMP').AsInteger:=fQuitacaoCTP.FieldByName('CODIGO_EMP').AsInteger;
              buscas.ParamByName('CPF_CGC_F').AsString:=fQuitacaoCTP.FieldByName('CPF_CGC_F').AsString;
              buscas.ParamByName('COD_EMP_MULT').AsInteger:=fQuitacaoCTP.FieldByName('COD_EMP_MULT').AsInteger;
              buscas.ParamByName('NOME_BANCO_DUPL').AsString:='';
              buscas.ParamByName('STATUS_HONDA').AsString:='';
              buscas.ParamByName('COD_EQUIP').AsString:='';
              buscas.ParamByName('HISTRAT').AsString:='';
              buscas.ParamByName('N_CONTA_PLC_OR').AsString:='';
              buscas.ParamByName('TPRAT').AsString:='';
              buscas.ParamByName('ENTRA_PREVISAO').AsString:=fQuitacaoCTP.FieldByName('ENTRA_PREVISAO').AsString;
              buscas.ParamByName('SERIE').AsString:='';
              buscas.ParamByName('N_DOC_CTP_ORIG').AsString:='';
              buscas.ParamByName('VALOR_CTP_ORIG').AsString:='';
              buscas.ParamByName('REF_FRETE').AsString:=fQuitacaoCTP.FieldByName('REF_FRETE').AsString;
              buscas.ParamByName('OP_CX').Value:=null;
              buscas.ParamByName('COD_OBS').Value:=null;
              buscas.ParamByName('NSU_RO_ADM').AsString:=fQuitacaoCTP.FieldByName('NSU_RO_ADM').AsString;
              buscas.ParamByName('ARQ_EXTRATO_ADM').AsString:=fQuitacaoCTP.FieldByName('ARQ_EXTRATO_ADM').AsString;
              buscas.ParamByName('DATA_ARQUIVO').AsDateTime:=fQuitacaoCTP.FieldByName('DATA_ARQUIVO').AsDateTime;
              buscas.ParamByName('RO_ADM').AsInteger:= fQuitacaoCTP.FieldByName('RO_ADM').AsInteger;
              buscas.ParamByName('COD_ADM').AsInteger:= fQuitacaoCTP.FieldByName('COD_ADM').AsInteger;
              buscas.ExecSQL;
              if fQuitacaoCTP.FieldByName('CADLANC').AsString='S' then
              begin
                result := _gravaLancamentosCTP(true);
                if not result then
                begin
                  vGravarErro:=true;
                  vErro:='Ocorreu um erro ao gravar o lançamento para a quitação de contas referentes a a ajustes negativos.';
                  exit;
                end;
              end;
          end
          else if not (fQuitacaoCTP.FieldByName('CADCTP').AsString='S') then
          begin
            if not gerarLoteQuit(FNumLoteLanc=0) then
              exit;
            buscas.Close;
            buscas.SQL.Text := 'update CONTAS_A_PAGAR set STATUS_CTP= :STATUS_CTP, DATQ_CTP= :DATQ_CTP, US_BX = :US_BX '+
              ',LOTE = :LOTE, DATA_BAIXA= :DATA_BAIXA, VALOR_PAGO= :VALOR_PAGO, DT_COMPENS= :DT_COMPENS'+
              ' where coalesce(selec,'''')<>''S'' and COD_CONTRP = '+inttostr(fQuitacaoCTP.FieldByName('COD_CONTRP').AsInteger)+
              ' and codigo_emp = '+vDadosIni.codEmpresa;
            buscas.ParamByName('STATUS_CTP').AsString:='QUITADO';
            buscas.ParamByName('DATQ_CTP').AsDateTime:=fQuitacaoCTP.FieldByName('DATQ_CTP').AsDateTime;
            buscas.ParamByName('LOTE').AsInteger:=FNumLoteLanc;
            buscas.ParamByName('US_BX').AsInteger:=vDadosIni.vCodUsuario;
            buscas.ParamByName('DATA_BAIXA').AsDate:=fQuitacaoCTP.FieldByName('DATA_BAIXA').AsDateTime;
            buscas.ParamByName('VALOR_PAGO').AsFloat:=fQuitacaoCTP.FieldByName('VALOR_PAGO').AsFloat ;
            buscas.ParamByName('DT_COMPENS').AsDate:=fQuitacaoCTP.FieldByName('DT_COMPENS').AsDateTime;
            buscas.ExecSQL;
            if buscas.RowsAffected = 1 then
            begin
              result := _gravaLancamentosCTP(true);
              if not result then
              begin
                vErro:='Ocorreu um erro ao gravar o lançamento para a quitação de contas referentes a a ajustes negativos.';
                vGravarErro:=true;
                exit;
              end;
            end;
          end;
          fQuitacaoCTP.next;
        end;
        if result then
          result := CommitaTransacao
        else
          RollBackTransacao;
        if result then
        begin
          vDadosIni.GravaAuditoria('CTP014', 'CONFIRMAR QUITAÇÃO', 'SUCESSO', 'CONTAS_A_PAGAR', IntToStr(FNumLoteLanc), buscas);
          if FNumLoteLanc>0 then
            Application.MessageBox(Pchar('Operação de cadastro/quitação de contas concluída com sucesso, Nº do Lote: '+IntToStr(FNumLoteLanc)), 'Informação', MB_OK + MB_ICONINFORMATION)
          else Application.MessageBox(Pchar('Operação de cadastro de contas a pagar concluída com sucesso.'), 'Informação', MB_OK + MB_ICONINFORMATION);
        end
        else
          vDadosIni.GravaAuditoria('CTP014', 'CONFIRMAR QUITAÇÃO', 'FALHA', 'CONTAS_A_PAGAR', IntToStr(FNumLoteLanc), buscas);
      end;
    except
      on e: exception do
      begin
        RollBackTransacao;
        Result := False;
        registraErro('function TContasAPagar._quitarContasConciliacaoCartao pLote: '+ IntToStr(pLote) + '. Erro: ' + e.Message);
        Application.MessageBox(pchar('Erro no processamento de baixa de cartão. Erro: ' + e.Message), 'Anteção', 0 + 64);
      end;
    end;
  finally
    if vGravarErro then
    begin
      lanc.CancelUpdates;
      loteLanc.CancelUpdates;
      RollBackTransacao;
      Result := False;
      registraErro('function TContasAPagar._quitarContasConciliacaoCartao : Erro: ' + vErro);
    end;
    vDadosIni.fechaStatusProcessamento;
    fQuitacaoCTP.EmptyDataSet;
    fQuitacaoCTP.Free;
    fQuitacaoCTP:=nil;
  end;
        (*
      DTPROCESSAMENTO
      COD_TIPOEXTRATO
      TIPOEXTRATO
      STATUS_PROC
      NUM_DOC_ADM
      NUM_DOC_CRED
      N_AUT_CART_CRED
      NPARCELA
      VALORPARCELA
      VALOR_C
      TAXA_CARTAO_CRED
      NOME_C
      STATUS_ADM
      DESC_STATUS_ADM
      DATA_PREV_PAG
      COD_TERMINAL_ADM
      PERCTXCARTAO
      TARIFA_CARTAO
      RO_ADM
      TIPO_PROD_ADM
      DESC_TIPO_PROD_ADM
      COD_BANDEIRA_ADM
      DESC_BANDEIRA
      IND_ANTEC_RO_ADM
      IND_OR_AJUSTE_ADM
      IND_OR_DESC_AJUSTE
      ARQ_EXTRATO_ADM
      DATA_ARQUIVO,
      COD_CRED
      COD_CONTROLE_CRED
      NOME_CONTROLE_CRED
      AGENCIA_BANCO
      N_CONTA_CTRL
      NSU_RO_ADM
      TIPO_TRANSACAO
      COD_TIPOTRANS
      *)
end;


procedure TContasAPagar._RelContasAPagar(Ordem: string; ASomenteSelecionados: Boolean; AAgruparEmpresaUnif: Boolean);
var
  indiceTemp, FieldName: string;
  I: Integer;
begin
  if not vDadosIni.PesqPros('CTP003', 'IMPRIMIR', '', 'CONTAS_A_PAGAR',
  	CTP.dataSet.FieldByName('COD_CONTRP').AsString+'/'+trim(CTP.dataSet.FieldByName('N_DOC_CTP').AsString), CTP.buscas, true) then
    exit;
  try
  	if AAgruparEmpresaUnif then
    	Ordem := 'COD_EMP_MULT';
      
    FrmCadContasAPagar.qrlNomeEmpresa.Caption := vDadosIni.vEmp.vnomeEmpresa;
    FrmCadContasAPagar.qrlNomeEmpresa2.Caption := vDadosIni.vEmp.vnomeEmpresa;
    if (FrmCadContasAPagar.CheckBox9.Checked) and (vDadosIni.vEmp.vFinanceiroUnificado) then
    	quickRep := TquickRep(FrmCadContasAPagar.qrpContasAPagar2)
    else
    	quickRep := TquickRep(FrmCadContasAPagar.qrpContasAPagar);
    indiceTemp := dataSet.IndexName;
//    dataSet.IndexName := 'IDXADATA_VENC_CTP';
		if (FrmCadContasAPagar.CheckBox9.Checked) and (vDadosIni.vEmp.vFinanceiroUnificado) then
    	FieldName := 'COD_EMP_MULT'
    else
    	FieldName := 'DATA_VENC_CTP';
    for I := 0 to dataSet.Fields.Count - 1 do
      if dataSet.Fields[i].DisplayLabel = Ordem then
        FieldName := dataSet.Fields[i].FieldName;
    FrmCadContasAPagar.QRGroup1.Expression  := dataSet.Name + '.' + FieldName;
  	FrmCadContasAPagar.QRGroup2.Expression  := dataSet.Name + '.' + FieldName;
    IndexFieldNames := FieldName;
    vGridRel := TDBGrid(FrmCadContasAPagar.DBGrid1);
    vGridRel.Columns.RestoreDefaults;
    vSubTotDiaVlConta := 0;
    vSubTotDiaVlPago := 0;
    vTotalVlConta := 0;
    vTotalVlPago := 0;
    vltotalgeralconta:=0;
    vltotalgeralvlpago:=0;
    vRelSomenteSelecionado := ASomenteSelecionados;// Application.MessageBox('Imprimir somente selecionados?',
//      'Confirmação', MB_YESNO +
//      MB_ICONQUESTION) = ID_YES;
    vDadosIni.abreStatusProcessamento('', 'Preparando para imprimir contas a pagar');
    FrmCadContasAPagar.qrBandDetalheCTP.BeforePrint := _bandaDetalheBeforePrint;
    FrmCadContasAPagar.qrBandDetalheCTP2.BeforePrint := _bandaDetalheBeforePrint;

    FrmCadContasAPagar.qrBandDetalheCTP.AfterPrint := _qrBandDetalheCTPAfterPrint;
    FrmCadContasAPagar.qrBandDetalheCTP2.AfterPrint := _qrBandDetalheCTPAfterPrint;

    FrmCadContasAPagar.qrBandSubtotal.BeforePrint := _qrBandSubtotalBeforePrint;
    FrmCadContasAPagar.qrBandSubtotal2.BeforePrint := _qrBandSubtotalBeforePrint;

    FrmCadContasAPagar.qrBandPageFooter.BeforePrint := _qrBandPageFooterBeforePrint;
    FrmCadContasAPagar.qrBandPageFooter2.BeforePrint := _qrBandPageFooterBeforePrint;

    FrmCadContasAPagar.qrpContasAPagar.BeforePrint:=_qrpContasAPagarBeforePrint;
    FrmCadContasAPagar.qrpContasAPagar2.BeforePrint:=_qrpContasAPagarBeforePrint;
//    QRBand1.BeforePrint:=_QRBand1BeforePrint;
    quickRep.Preview;
    dataSet.IndexName := indiceTemp;
    First;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TContasAPagar._replicarContasAPagar(pExibir: boolean): Boolean;
var
  I, J: Integer;
  vDataVencimento: TDate;
  vMensagem: string;
  vNumDocTemp: Double;
  vSql: string;
begin
  Result := False;
  vNumDocTemp := 0;

  if dataSet.IsEmpty then
    Exit;

  try
    if not vDadosIni.PesqPros('CTP007', 'REPLICAR', 'COD_CONTRP: ' + dataSet.FieldByName('COD_CONTRP').AsString +
      ' NUM DOC ' + dataSet.FieldByName('N_DOC_CTP').AsString+' '+dataSet.FieldByName('NOME_FOR_CTP').AsString,
      'CONTAS_A_PAGAR', dataSet.FieldByName('COD_CONTRP').AsString+'/'+trim(dataSet.FieldByName('N_DOC_CTP').AsString), buscas, True) then
      Exit;

    FDiaReplicacao := DayOf(dataSet.FieldByName('data_venc_ctp').AsDateTime);

    //    if dataSet.FieldByName('cod_cliente').AsInteger <= 0 then
    //      raiseExceptionCreate('Documento sem o código do cliente. Operação não permitida', '');

    if Trim(dataSet.FieldByName('n_doc_ctp').AsString) = '' then
      raiseExceptionCreate('Conta a pagar sem número de documento. Operação não permitida', '');

    vpermitir := false;
    vNumConta := 0;

    if pExibir then
    begin
      if not _abreFormReplicacaoContasCTP then
        Exit;
          vNumDocTemp := FrmCadContasAPagar.EditHwNumConta.AsValue;
    end
    else
    	vNumDocTemp := dataSet.FieldByName('N_CONTA_PLC').AsFloat;


    try
    	vSql := dataSet.CommandText;
      
      vDataVencimento := dataSet.FieldByName('data_venc_ctp').AsDateTime;
      vCodContaCtpRpl := dataSet.FieldByName('COD_CONTRP').AsInteger;

      vDadosIni.abreStatusProcessamento('', 'Armazenando dados em cache');

      if ReplAltNumQtdeReplicacao then
      begin
        montaSelect(' select ' + Fsql_campos + ' from contas_a_pagar  ' +
         Fsql_inner +
     		Fsql_inner_pag +
     		' where contas_a_pagar.cod_contrp = ' + IntToStr(vCodContaCtpRpl) +
         ' and contas_a_pagar.codigo_emp = ' + vDadosIni.codEmpresa);

        if not dataSet.IsEmpty then
        begin
        	dataSet.Edit;
          if Pos('-', Trim(dataSet.FieldByName('N_DOC_CTP').AsString)) > 0 then
            dataSet.FieldByName('N_DOC_CTP').AsString :=
              Copy(Trim(dataSet.FieldByName('N_DOC_CTP').AsString), 1, Pos('-', Trim(dataSet.FieldByName('N_DOC_CTP').AsString)) - 1) +
              '-' + intToStr(1)
          else
            dataSet.FieldByName('N_DOC_CTP').AsString :=
              Trim(dataSet.FieldByName('N_DOC_CTP').AsString) +
              '-' + intToStr(1);

          dataSet.FieldByName('NPARCELA').AsInteger := 1;
          dataSet.FieldByName('QTDE_PARC').AsInteger := FQtdeReplicacao + 1;
          dataSet.Post;
        end;
      end;

      buscas.Close;
      buscas.SQL.Text := 'select * from CONTAS_A_PAGAR' +
        ' where COD_CONTRP = ' + IntToStr(vCodContaCtpRpl) +
        ' and codigo_emp = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if buscas.IsEmpty then
        raiseExceptionCreate('Não encontrada a Conta a Pagar no banco de dados', '');

      for I := 1 to FQtdeReplicacao do
      begin
        vDadosIni.abreStatusProcessamento('', 'Replicando conta. ' + vDadosIni.StrZero(I, 2) + ' de ' + vDadosIni.StrZero(FQtdeReplicacao, 2));

        vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
        if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), FDiaReplicacao) then
          vDataVencimento := StartOfTheMonth(vDataVencimento) + FDiaReplicacao - 1
        else
          vDataVencimento := EndOfTheMonth(vDataVencimento);

        dataSet.Insert;
        for J := 0 to dataSet.FieldCount - 1 do
          if dataSet.Fields[J].FieldKind = fkData then
           if buscas.FindField(dataSet.Fields[J].FieldName) <> nil then
             dataSet.FieldByName(dataSet.Fields[J].FieldName).Value :=
               buscas.FieldByName(dataSet.Fields[J].FieldName).Value;

      	if ReplAltNumQtdeReplicacao then
        begin
          if Pos('-', Trim(buscas.FieldByName('N_DOC_CTP').AsString)) > 0 then
            dataSet.FieldByName('N_DOC_CTP').AsString :=
              Copy(Trim(buscas.FieldByName('N_DOC_CTP').AsString), 1, Pos('-', Trim(buscas.FieldByName('N_DOC_CTP').AsString)) - 1) +
              '-' + intToStr(I + 1)
          else
            dataSet.FieldByName('N_DOC_CTP').AsString :=
              Trim(buscas.FieldByName('N_DOC_CTP').AsString) +
              '-' + intToStr(I + 1);

          dataSet.FieldByName('NPARCELA').AsInteger := I + 1;
          dataSet.FieldByName('QTDE_PARC').AsInteger := FQtdeReplicacao + 1;
        end
        else
        begin
        	if Pos('-', Trim(buscas.FieldByName('N_DOC_CTP').AsString)) > 0 then
            dataSet.FieldByName('N_DOC_CTP').AsString :=
              Copy(Trim(buscas.FieldByName('N_DOC_CTP').AsString), 1, Pos('-', Trim(buscas.FieldByName('N_DOC_CTP').AsString)) - 1) +
              '-' + intToStr(I)
          else
            dataSet.FieldByName('N_DOC_CTP').AsString :=
              Trim(buscas.FieldByName('N_DOC_CTP').AsString) +
              '-' + intToStr(I);

          dataSet.FieldByName('NPARCELA').AsInteger := I;
          dataSet.FieldByName('QTDE_PARC').AsInteger := FQtdeReplicacao;
        end;
        
        dataSet.FieldByName('DATA_VENC_CTP').AsDateTime := StrToDate(DateToStr(vDataVencimento));
        dataSet.FieldByName('N_CONTA_PLC').AsFloat := vNumDocTemp;
        dataSet.FieldByName('DATA_ENT_CTP').AsDateTime := vDadosIni.diaFFinanceiro+1; 
        dataSet.FieldByName('STATUS_CTP').AsVariant := Null;
        dataSet.FieldByName('DATQ_CTP').AsVariant := Null;
        dataSet.FieldByName('LOTE').AsVariant:=Null;
        dataSet.FieldByName('US_BX').AsVariant:=Null;
        dataSet.FieldByName('SELEC').AsVariant := Null;
        dataSet.FieldByName('DATA_BAIXA').AsVariant := Null;
        dataSet.FieldByName('N_CHEQ_CTP').AsVariant := Null;
        dataSet.FieldByName('VALOR_PAGO').AsVariant := Null;
        dataSet.FieldByName('OP_CX').AsVariant := Null;

        dtmContasAPagar.SpIncCodigo.Transaction := buscas.Transaction;
        dataSet.FieldByName('COD_CONTRP').AsInteger := Gencodigo('CONTAS_A_PAGAR', dtmContasAPagar.SpIncCodigo, vDadosIni.codEmpresa);
        if ReferenciaMes then
          dataSet.FieldByName('DTREFERENCIA').AsDateTime := StartOfTheMonth(dataSet.FieldByName('DATA_VENC_CTP').AsDateTime) - 1
        else
	        dataSet.FieldByName('DTREFERENCIA').AsDateTime := StrToDate(DateToStr(vDataVencimento));
        dataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
        dataSet.Post;

        if not Apply then
          raiseExceptionCreate('Operação será abortada', '');

      end;

    finally
    	if ReplAltNumQtdeReplicacao then
	    	montaSelect(vSql);

      vDadosIni.fechaStatusProcessamento;
      vDadosIni.abreStatusProcessamento('', 'Confirmando transação em banco de dados');
      Result := CommitaTransacao;
      if Result then
      begin
        vDadosIni.GravaAuditoria('CTP007', 'REPLICAR', 'SUCESSO: COD_CONTRP ' + IntToStr(vCodContaCtpRpl) +
          ' QTDE ' + IntToStr(FQtdeReplicacao) + ' DIA ' + IntToStr(FDiaReplicacao),
          'CONTAS_A_PAGAR', IntToStr(vCodContaCtpRpl), buscas);
        Refresh;
        FTotalContasSelecionadas := 0;
      end
      else
        vDadosIni.GravaAuditoria('CTP007', 'REPLICAR', 'FALHA: COD_CONTRP ' + IntToStr(vCodContaCtpRpl) +
          ' QTDE ' + IntToStr(FQtdeReplicacao) + ' DIA ' + IntToStr(FDiaReplicacao),
          'CONTAS_A_PAGAR', IntToStr(vCodContaCtpRpl), buscas);
      vDadosIni.fechaStatusProcessamento;
    end;
  except
    on e: exception do
    begin
      RollBackTransacao;
      dataSet.Refresh;
      FTotalContasSelecionadas := 0;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_OK + MB_ICONINFORMATION);
      registraErro('function TContasAPagar._replicarContasAPagar. Erro: ' + e.Message);
    end;
  end;

end;

function TContasAPagar._selecionaHistoricoPadrao(pNumConta: double): string;
begin
  try
    if vHistPConta = nil then
      vHistPConta := THistPContas.create;
    if vHistPConta.abreEscolhaHistoricoPadrao(pNumConta) then
      result := vDadosIni.vPesquisa
    else
      result := '';
  except
    result := '';
  end;
end;

function TContasAPagar._validaControle: boolean;
begin
  result := true;
  if not ExecutaComandosSql('select codigo_ctrl from controles ' +
    ' where codigo_ctrl = ' + inttostr(dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa +
    ' and ativo = 1 ') then
  begin
    if dataSet.FieldByName('CODIGO_CTRL').IsNull then
      Application.MessageBox('Controle não Informado.' + chr(13) + 'Campo requerido.', 'Informação', MB_OK + MB_ICONINFORMATION)
    else
      Application.MessageBox('Controle não encontrado.' + chr(13) + 'Campo requerido.', 'Informação', MB_OK + MB_ICONINFORMATION);
    //    vNomeCampoErro := 'DBLookupComboBox3';
    result := false;
    exit;
  end;
  if dtSetControles.FieldByName('NAT_LANC').AsString = 'C' then
    dataSet.FieldByName('TIP_CNT').AsString := dtSetControles.FieldByName('NAT_LANC').AsString
  else
    dataSet.FieldByName('TIP_CNT').AsString := 'N';
end;

function TContasAPagar._validaNum_conta_plc: boolean;
begin
  result := false;
  if dataSet.FieldByName('n_conta_plc').IsNull then
  begin
    Application.MessageBox('Controle não Informado.' + chr(13) + 'Campo requerido.', 'Informação', MB_OK + MB_ICONINFORMATION);
    vNomeCampoErro := 'DBLookupComboBox1';
    Exit;
  end
  else if (dataSet.FieldByName('n_conta_plc').AsFloat = 0) then
  begin
    Application.MessageBox('Controle não encontrado.' + chr(13) + 'Campo requerido.', 'Informação', MB_OK + MB_ICONINFORMATION);
    vNomeCampoErro := 'DBLookupComboBox1';
    Exit;
  end
  else
  begin
    buscas.Close;
    buscas.SQL.Text := 'select * from P_Contas where ativo = 1 and tipo_plc = ''S'' and n_conta_plc = :n_conta_plc';
    buscas.ParamByName('n_conta_plc').AsFloat := dataSet.FieldByName('n_conta_plc').AsFloat;
    buscas.Open;
    if buscas.IsEmpty then
    begin
      Application.MessageBox('Conta do Plano de Contas não encontrado.' + chr(13) + 'Campo requerido.', 'Informação', MB_OK + MB_ICONINFORMATION);
      vNomeCampoErro := 'DBLookupComboBox1';
      Exit;
    end;
  end;
  result := true;
end;

function TContasAPagar._verificarMarcacaoLinha: boolean;
begin
  Result := True;
  if dataSet.IsEmpty then
    exit;

  rCTP.vTipoCNT := '';

  if vDadosIni.vEmp.vFiltrarCtpPorControle <> 'S' then
    Exit;

  try
    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('SEL').AsString = 'S' then
      begin
        if rCTP.vTipoCNT = '' then
          rCTP.vTipoCNT := dataSet.FieldByName('TIP_CNT').AsString
        else
        begin
          if dataSet.FieldByName('TIP_CNT').AsString <> rCTP.vTipoCNT then
          begin
            Application.MessageBox(Pchar('Tipo do Lançamento das contas selecionadas são difrentes:' + #13 + #13 +
            	'Tipo do Lançamento é ''' + rCTP.vTipoCNT + ''' diferente das anteriores Selecionadas'), 'Informação', MB_OK + MB_ICONINFORMATION);
            Result := False;
            Exit;
          end;
        end;
      end;

      dataSet.Next;
    end;
  finally
    dataSet.First;
    dataSet.EnableControls;
  end;
end;

{ TLancamentos }

constructor TLancamentosCTP.create;
begin
  if dtmContasAPagar = nil then
    dtmContasAPagar := TdtmContasAPagar.Create(dtmContasAPagar);
  DataSet := TClientDataSet(dtmContasAPagar.cdsLancamentos);
  transacao := TIBTransaction(dtmContasAPagar.transContaAPagar);
  Buscas := TIBQuery(dtmContasAPagar.qrBuscasLanc);
end;

destructor TLancamentosCTP.destroy;
begin
  Close;
  inherited;
end;

function TLancamentosCTP._abreLancamentos(pLoteLanc: integer): boolean;
begin
  result := montaSelect('select * from lancamentos l where l.lote=' + inttostr(pLoteLanc) +
    ' and l.codigo_emp=' + vDadosIni.codEmpresa);
end;

{ TChequesCTP }

constructor TChequesCTP.create;
begin
  if dtmContasAPagar = nil then
    dtmContasAPagar := TdtmContasAPagar.Create(dtmContasAPagar);
  DataSet := TClientDataSet(dtmContasAPagar.cdsControleCH);
  transacao := TIBTransaction(dtmContasAPagar.transContaAPagar);
  Buscas := TIBQuery(dtmContasAPagar.qrBuscasControleCH);
  vNumCtrlTemp:=0;
end;

destructor TChequesCTP.destroy;
begin
  Close;
  inherited;
end;

function TChequesCTP._abreChequesCTP: boolean;
var
  vSqlDataVencimento: string;
begin
  vDadosIni.vInibeMensPesqPros := 'S';
  vSqlDataVencimento := vDadosIni.retornoPorCondicao(
    vDadosIni.PesqPros('CTP026', 'HABILIRAR', '', 'CONTAS_A_PAGAR', '', buscas, True),
    '', ' and controle_cheque.data_venc <= ' + vDadosIni.FusoSqlDate);
  if vDadosIni.vEmp.vFinanceiroUnificado then
    result := montaSelect('select controle_cheque.* from controle_cheque ' +
      ' left join empresa on empresa.cod_empresa = controle_cheque.cod_emp_mult ' +
      ' where (controle_cheque.status_ch is null or controle_cheque.status_ch = '''')' + vSqlDataVencimento +
      ' and coalesce(controle_cheque.status_cx,'''')<>''R''  ' +
  //    ' and controle_cheque.codigo_emp=' + vDadosIni.codEmpresa +
      ' and (case when (empresa.financeiro_unificado = ''S'') then ' +
      ' empresa.codigo_unificadora else controle_cheque.codigo_emp end) = ' + vDadosIni.codEmpresa +
      ' and controle_cheque.cod_emp_mult in ' + vDadosIni.vEmp.vCodigoUnificadas +
      ' and controle_cheque.codigo_ctrl = '+inttostr(vNumCtrlTemp)+
      ' order by controle_cheque.Data_venc')
  else
    result := montaSelect('select controle_cheque.* from controle_cheque ' +
      ' left join empresa on empresa.cod_empresa = controle_cheque.cod_emp_mult ' +
      ' where (controle_cheque.status_ch is null or controle_cheque.status_ch = '''')' + vSqlDataVencimento +
      ' and coalesce(controle_cheque.status_cx,'''')<>''R''  ' +
      ' and controle_cheque.codigo_emp=' + vDadosIni.codEmpresa +
      ' and controle_cheque.codigo_ctrl = '+inttostr(vNumCtrlTemp)+
      ' order by controle_cheque.Data_venc');
end;

function TChequesCTP._abreChequesCTP(ACodigo: Integer; ACodigoEmpresa: Integer): boolean;
begin
  dataSet.Close;
  dataSet.Filter := '';
  dataSet.Filtered := False;

  if vDadosIni.vEmp.vFinanceiroUnificado then
    result := montaSelect('select controle_cheque.* from controle_cheque ' +
      ' left join empresa on empresa.cod_empresa = controle_cheque.cod_emp_mult ' +
      ' where controle_cheque.codigo_ch = ' + IntToStr(ACodigo) +
      ' and controle_cheque.codigo_emp=' +
      vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (ACodigoEmpresa > 0),
         IntToStr(ACodigoEmpresa), vDadosIni.codEmpresa) +
      ' and controle_cheque.cod_emp_mult in ' + vDadosIni.vEmp.vCodigoUnificadas)
  else
    result := montaSelect('select controle_cheque.* from controle_cheque ' +
      ' left join empresa on empresa.cod_empresa = controle_cheque.cod_emp_mult ' +
      ' where controle_cheque.codigo_ch = ' + IntToStr(ACodigo) +
      ' and controle_cheque.codigo_emp=' + vDadosIni.codEmpresa);
  Result := not dataSet.IsEmpty;
end;

procedure TChequesCTP._atualizaValorChequesSel(pLabel: TLabel);
begin
  pLabel.Caption := Format('%0.2m', [vSaldoChequesSelecionados]);
end;

procedure TChequesCTP._marcaDesmarcaLinha(pDataSetLanc: TClientDataSet);
begin
  if dataSet.IsEmpty then
    exit;
  dataSet.Edit;
  if dataSet.FieldByName('sel').AsString = 'S' then
  begin
    dataSet.FieldByName('sel').AsString := '';
    vSaldoChequesSelecionados := vSaldoChequesSelecionados - dataSet.FieldByName('VALOR_CH').AsCurrency;
  end
  else
  begin
    //    if not pDataSetLanc.Locate('CODIGO_CH;CODIGO_EMP',VarArrayOf([dataSet.FieldByName('CODIGO_CH').AsInteger,strtoint(vDadosIni.codEmpresa)]), []) then
    if not pDataSetLanc.Locate('CODIGO_CH', dataSet.FieldByName('CODIGO_CH').AsInteger, []) then
    begin
      dataSet.FieldByName('sel').AsString := 'S';
      vSaldoChequesSelecionados := vSaldoChequesSelecionados + dataSet.FieldByName('VALOR_CH').AsCurrency;
    end
    else
      Application.MessageBox('Já foi efetuado o lançamento deste Cheque', 'Informação', MB_OK + MB_ICONINFORMATION);
  end;
  dataSet.Post;
end;

{ TLotelancCTP }

constructor TLotelancCTP.create;
begin
  if dtmContasAPagar = nil then
    dtmContasAPagar := TdtmContasAPagar.Create(dtmContasAPagar);
  DataSet := TClientDataSet(dtmContasAPagar.cdsLoteLanc);
  transacao := TIBTransaction(dtmContasAPagar.transContaAPagar);
  Buscas := TIBQuery(dtmContasAPagar.qrLoteLanc);
end;

destructor TLotelancCTP.destroy;
begin
  Close;
  inherited;
end;

function TLotelancCTP._abreLoteLanc(pLote: Integer; pDatq: TDateTime): boolean;
var
	vCodEmpresa: Integer;
begin
	if (vDadosIni.vEmp.vFinanceiroUnificado) and (pDatq > 0) then
  begin
    buscas.Close;
    buscas.SQL.Text := ' select first 1 n_lote, codigo_emp from lote_lanc ' +
      ' WHERE N_LOTE = ' + IntToStr(pLote) +
      ' and DATA_LOTE = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', pDatq)) +
      ' order by n_lote desc ';
    buscas.Open;

    vCodEmpresa   := 0;
    if not buscas.IsEmpty then
      vCodEmpresa := buscas.FieldByName('codigo_emp').AsInteger;
  end;

	result := montaSelect(' select * from lote_lanc ' +
    ' WHERE N_LOTE = ' + IntToStr(pLote) +
    ' and CODIGO_EMP = ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (vCodEmpresa > 0),
    	IntToStr(vCodEmpresa), vDadosIni.codEmpresa) +
    ' order BY N_LOTE desc');
end;

function TLotelancCTP._abreLoteLanc: boolean;
begin
  result := montaSelect(' select * from lote_lanc ' +
    ' WHERE CODIGO_EMP = ' + vDadosIni.codEmpresa +
    ' order by N_LOTE desc');
end;


{ TObs_CTP }

constructor TObs_CTP.create;
begin
  if dtmContasAPagar = nil then
    dtmContasAPagar := TdtmContasAPagar.Create(dtmContasAPagar);

  DataSet := TClientDataSet(dtmContasAPagar.cdsObsCred);
  transacao := TIBTransaction(dtmContasAPagar.transContaAPagar);
//  Buscas := TIBQuery(dtmContasAPagar.qrBuscasCntAPagar);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmContasAPagar.qrObsCred.Database;
  buscas.Transaction := transacao;
end;

function TObs_CTP.insert: Boolean;
begin
  Result := False;
  if inherited insert then
  begin
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('data_obs').AsDateTime := Date;
    dataSet.FieldByName('hora_obs').AsDateTime := Time;                 
    dataSet.FieldByName('cod_usuario').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('NITEM').AsInteger := dataSet.FieldByName('NITEM').AsInteger;
    Result := True;
  end;
end;

function TObs_CTP.post: Boolean;
var
	vCOD_OBS: Integer;
begin
  Result := False;
  vCOD_OBS := fCOD_OBS;
  try

//    if not vDadosIni.PesqPros('CAR051', 'SALVAR', ' AG ' +
//      dataSet.FieldByName('AGENCIA').AsString +
//      ' CTA ' + dataSet.FieldByName('CONTA').AsString +
//      ' COD CL ' + dataSet.FieldByName('COD_CLIENTE').AsString, 'CONTASBANCARIAS', '', buscas, True) then
//      Exit;

    if Trim(dataSet.FieldByName('observacao').AsString) = '' then
      raiseExceptionCreate('Observação não preenchida', 'DBMemo1');

    if dataSet.State = dsInsert then
    begin
      if fCOD_OBS = 0 then
        fCOD_OBS := Gencodigo('OBSERVACAO', dtmContasAPagar.SpIncCodigo, vDadosIni.codEmpresa);
      dataSet.FieldByName('COD_OBS').AsInteger := fCOD_OBS;
    end;

    if vCOD_OBS = 0 then
    begin
      if verificarTabelaCodigo(fCOD_OBS) then
        if fCOD_OBS <> dataSet.FieldByName('COD_OBS').AsInteger then
        begin
          dataSet.FieldByName('COD_OBS').AsInteger := fCOD_OBS;

          SqlExec('update codigo set valor = ' + IntToStr(fCOD_OBS) +
            ' where tabela = ''OBSERVACAO'' ' +
            ' and cod_empresa = ' + vDadosIni.codEmpresa);
        end;
    end;

    Result := inherited post;

    Result := Apply;

    if Result then
      _selecionaObs(fCOD_OBS);

  except
    on e: exception do
    begin
      Result := False;
      registraErro('function TObs_Cred.post. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro ao salvar observação: ' + e.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

function TObs_CTP.verificarTabelaCodigo(var pCOD_OBS: Integer): boolean;
begin
	try
  	Result := true;
    SqlOpen(' select max(cod_obs) cod_obs from observacao ' +
      ' where cod_empresa = ' + vDadosIni.codEmpresa);

    if buscas.FieldByName('cod_obs').AsInteger + 1 > pCOD_OBS then
    	pCOD_OBS := buscas.FieldByName('cod_obs').AsInteger + 1;
  except
    on e: exception do
    begin
      Result := False;
      registraErro('TObs_CTP.verificarTabelaCodigo. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro ao verificar observação tabela código: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TObs_CTP._selecionaObs(pCOD_OBS: Integer): Boolean;
begin
  Result := montaSelect('select o.*, c.nome_vendedor from observacao o' +
    ' left join colaborador c on c.cod_vendedor = o.cod_usuario and c.cod_empresa = o.cod_empresa' +
    ' where o.cod_obs = ' + IntToStr(pCOD_OBS) +
    ' and o.cod_empresa = ' +vDadosIni.codEmpresa +
    ' order by o.data_obs, o.hora_obs');
  fCOD_OBS := pCOD_OBS;
end;

{ TEmpresasUnificadas }

constructor TEmpresasUnificadas.create;
begin
  DataSet := TClientDataSet(dtmContasAPagar.cdsEmpresasUnificadas);
  transacao := TIBTransaction(dtmContasAPagar.transContaAPagar);
  Buscas := TIBQuery(dtmContasAPagar.qrBuscasCntAPagar);
end;

function TEmpresasUnificadas._abreTodosEmpresas: Boolean;
begin
 Result := montaSelect(' select cod_empresa, (identificacao_emp ||'' - ''|| cgc_emp) identificacao_emp, cgc_emp from empresa ' +
  ' where codigo_unificadora = ' + vDadosIni.codEmpresa +
  ' and financeiro_unificado = ''S'' ' +
  ' order by cod_empresa');
end;

function TEmpresasUnificadas._BuscarEmpresas(vCodEmp: Integer): Boolean;
begin
 Result := False;

 buscas.Close;
 buscas.SQL.Text := ' select cod_empresa from empresa ' +
  ' where codigo_unificadora = ' + vDadosIni.codEmpresa +
  ' and financeiro_unificado = ''S'' ';
 buscas.Open;
 buscas.FetchAll;


 buscas.First;
 while not buscas.Eof do
 begin
   if buscas.FieldByName('COD_EMPRESA').AsInteger = vCodEmp then
   begin
     Result := True;
     Break;
   end;
   buscas.Next;
 end;
 buscas.Close;

end;

procedure TEmpresasUnificadas._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    dataset.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
  finally
  	dataSet.First;
  	dataset.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TEmpresasUnificadas._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TEmpresasUnificadas._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    dataset.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
      dataSet.Next;
    end;
  finally
  	dataSet.First;
  	dataset.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TInformacaoCTP }

constructor TInformacaoCTP.create;
begin
  FFornecedor := TInformacaoCTPCadBasico.Create;
  FCodPagto := TInformacaoCTPCadBasico.Create;
  FControlePgto := TInformacaoCTPCadBasico.Create;
  FObservacoes := TStringList.Create;
end;

destructor TInformacaoCTP.Destroy;
begin
  FreeAndNil(FFornecedor);
  FreeAndNil(FCodPagto);
  FreeAndNil(FControlePgto);
  FreeAndNil(FObservacoes);
  inherited;
end;

function TInformacaoCTP.GetImpressao(pAgruparEmpresaUnif: Boolean): TStrings;
var
  APrint: TStrings;
  AObsPrint: TStrings;
  ALinha: string;
  I, PosDelimiter: Integer;
begin
  APrint := TStringList.Create;
  AObsPrint := TStringList.Create;
  try
  	if (pAgruparEmpresaUnif) and (FCodEmpMult > 0) then
    begin
      APrint.Add('Emp: ' + vDadosIni.StrZero(FCodEmpMult, 3));
      APrint.Add('');
    end;

    APrint.Add(
      vDadosIni.Space(
        'Favorecido    : ' + vDadosIni.StrZero(IntToStr(Fornecedor.Codigo), 6) + ' - ' + Fornecedor.Descricao, 72) +
        vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (not pAgruparEmpresaUnif),
		      vDadosIni.Space('Emp: ' + vDadosIni.StrZero(FCodEmpMult, 3), 8), '')
    );
    APrint.Add(
      vDadosIni.Space('Nº Duplicata  : ' + FNumeroDocumento, 31) + ' ' +
      vDadosIni.Space('Valor : ' + Format('%0.2f', [FValor]), 23) + ' ' +
      vDadosIni.Space('Vencimento  : ' + FormatDateTime('dd/mm/yyyy', FDataVencimento), 24) 
    );
    APrint.Add(
      vDadosIni.Space('Tipo          : ' + FTipo, 31) + ' ' +
      vDadosIni.Space('Numero: ' + vDadosIni.StrZero(FNumeroNF, 6), 23) + ' ' +
      vDadosIni.Space('Data Entrada: ' + FormatDateTime('dd/mm/yyyy', FDataEmissao), 24)
    );
    APrint.Add(
      vDadosIni.Space(
        'Condição Pagto: ' + vDadosIni.StrZero(IntToStr(CodPagto.Codigo), 3) + ' - ' + CodPagto.Descricao, 55) + ' ' +
      vDadosIni.IfThen( FStatus = 'Quitada', vDadosIni.Space('Valor Pago  : ' + Format('%0.2f', [FValorPago] ), 24), '')
    );
    APrint.Add(
      vDadosIni.Space(
        'Controle      : ' + vDadosIni.StrZero(IntToStr(ControlePgto.Codigo), 3) + ' - ' + ControlePgto.Descricao, 55) + ' ' +
      vDadosIni.Space('Cheque      : ' + FCheque, 24)
    );
    APrint.Add(
      vDadosIni.Space('Banco Document: ' + FBancoDocumento, 31) + ' ' +
      vDadosIni.Space('Status: ' + vDadosIni.StrZero(FStatus, 6), 23) + ' ' +
      vDadosIni.Space('Dat.Quitacao: ' + vDadosIni.IfThen( FStatus = 'Quitada', FormatDateTime('dd/mm/yyyy', FDataQuitacao), ''), 24)
    );

    for I := 0 to FObservacoes.Count - 1 do
    begin
      ALinha := FObservacoes[I];

      while Length(ALinha) > 64 do
      begin
        ALinha := TrimLeft(ALinha);
        PosDelimiter := LastDelimiter(' ', Copy(ALinha, 1, 64));
        if PosDelimiter <= 0 then
          PosDelimiter := 64;

        AObsPrint.Add(Copy(ALinha, 1, PosDelimiter));
        Delete(ALinha, 1, PosDelimiter);
      end;

      if Trim(ALinha) <> '' then
        AObsPrint.Add(Copy(Trim(ALinha), 1, 64));
    end;
    
    for I := 0 to AObsPrint.Count - 1 do
      if I = 0 then
        APrint.Add('Observacao    : ' + AObsPrint[I])
      else
        APrint.Add('                ' + AObsPrint[I]);

    Result := APrint;
  finally
    FreeAndNil(AObsPrint);
  end;
end;

procedure TInformacaoCTP.SetBancoDocumento(const Value: string);
begin
  FBancoDocumento := Value;
end;

procedure TInformacaoCTP.SetCheque(const Value: string);
begin
  FCheque := Value;
end;
procedure TInformacaoCTP.SetCodEmpMult(const Value: Integer);
begin
	FCodEmpMult := Value;
end;

procedure TInformacaoCTP.SetCodPagto(const Value: TInformacaoCTPCadBasico);
begin
  FCodPagto := Value;
end;

procedure TInformacaoCTP.SetControlePgto(const Value: TInformacaoCTPCadBasico);
begin
  FControlePgto := Value;
end;

procedure TInformacaoCTP.SetDataEmissao(const Value: TDate);
begin
  FDataEmissao := Value;
end;

procedure TInformacaoCTP.SetDataQuitacao(const Value: TDate);
begin
  FDataQuitacao := Value;
end;

procedure TInformacaoCTP.SetDataVencimento(const Value: TDate);
begin
  FDataVencimento := Value;
end;

procedure TInformacaoCTP.SetFornecedor(const Value: TInformacaoCTPCadBasico);
begin
  FFornecedor := Value;
end;

procedure TInformacaoCTP.SetNumeroDocumento(const Value: string);
begin
  FNumeroDocumento := Value;
end;

procedure TInformacaoCTP.SetNumeroNF(const Value: string);
begin
  FNumeroNF := Value;
end;

procedure TInformacaoCTP.SetObservacoes(const Value: TStrings);
begin
  FObservacoes := Value;
end;

procedure TInformacaoCTP.SetStatus(const Value: string);
begin
  if Trim(Value) = '' then
    FStatus := 'Aberta'
  else
    FStatus := 'Quitada';
end;

procedure TInformacaoCTP.SetTipo(const Value: string);
begin
  FTipo := Value;
end;

procedure TInformacaoCTP.SetValor(const Value: Double);
begin
  FValor := Value;
end;

procedure TInformacaoCTP.SetValorPago(const Value: Double);
begin
  FValorPago := Value;
end;

{ TInformacaoCTPList }

function TInformacaoCTPList.GetItem(Index: integer): TInformacaoCTP;
begin
	Result := TInformacaoCTP(inherited Items[Index]);
end;

function TInformacaoCTPList.New: TInformacaoCTP;
begin
	Result := TInformacaoCTP.create;
  Add(Result);
end;

procedure TInformacaoCTPList.SetItem(Index: integer; const Value: TInformacaoCTP);
begin
	Put(Index, Value);
end;

{ TRelatorioInformacaoCTP }

constructor TRelatorioInformacaoCTP.create(AQueryBuscas: TIBQuery; ATitulo: string);
begin
  Buscas             := TIBQuery.Create(Application);
  Buscas.Database    := AQueryBuscas.Database;
  Buscas.Transaction := AQueryBuscas. Transaction;

  BuscasAux             := TIBQuery.Create(Application);
  BuscasAux.Database    := AQueryBuscas.Database;
  BuscasAux.Transaction := AQueryBuscas. Transaction;

  FDadosCTP      := TInformacaoCTPList.Create;
  FTipoDeFiltro  := TStringList.Create;
  FParametros    := TStringList.Create;
  FTitulo        := ATitulo;
  FComAssinatura := False;
  FSqlCampos := 'select ctp.cod_emp_mult, ctp.cod_forn_nfe, ctp.nome_for_ctp, ctp.n_doc_ctp, ctp.valor_ctp, ctp.data_venc_ctp, ctp.valor_pago,' +
                ' ctp.tipo_ctp, ctp.num_nota_nfe, ctp.data_ent_ctp, '' '' as condpag, ctp.codigo_ctrl, ctrl.nome_ctrl,' +
                ' ctp.n_cheq_ctp, ctp.nome_banco_dupl, ctp.status_ctp, ctp.datq_ctp, ctp.historico_ctp,' +
                ' ctp.cod_obs' +
                ' from contas_a_pagar ctp' +
                ' left join controles ctrl on ctrl.codigo_ctrl = ctp.codigo_ctrl and ctrl.codigo_emp = ctp.codigo_emp';
                //' left join observacao ob on ob.cod_obs = ctp.cod_obs and ob.cod_empresa = ctp.codigo_emp';
end;

destructor TRelatorioInformacaoCTP.Destroy;
begin
  FreeAndNil(Buscas);
  FreeAndNil(BuscasAux);
  FreeAndNil(FDadosCTP);
  FreeAndNil(FTipoDeFiltro);
  FreeAndNil(FParametros);
  inherited;
end;

procedure TRelatorioInformacaoCTP.EmitirRelatorioPor_ContasSelecionadas(
	ACodigoInterno: array of Integer;
	ACodEmpMult: array of Integer;
	AComAssinatura: Boolean;
  AAgruparEmpresaUnif: Boolean);
var
  I: Integer;
begin
  FTipoDeFiltro.Clear;
  FTipoDeFiltro.Add('Tipo de filtro: Contas selecionadas pelo usuário');
 try
    for I := Low(ACodigoInterno) to High(ACodigoInterno) do
    begin
      FParametros.Clear;
      FParametros.Add(' where ctp.cod_contrp = ' + IntToStr(ACodigoInterno[I]));
      FParametros.Add(' and ctp.codigo_emp = ' + IntToStr(StrToIntDef(vDadosIni.codEmpresa, 0)));

      obterDadosDoBanco('S', ACodEmpMult[I], AAgruparEmpresaUnif);
    end;

    FComAssinatura := AComAssinatura;

    VisualizarRelatorio(AAgruparEmpresaUnif);

  except on E: Exception do
    begin
      vDadosIni.registraErro('TRelatorioInformacaoCTP.EmitirRelatorioPor_ContasSelecionadas ' + e.Message);
      vDadosIni.ShowErro('Erro ao emitir relatorio ' + E.Message);
    end;
  end;
end;

procedure TRelatorioInformacaoCTP.EmitirRelatorioPor_NumeroDeNota(
  ANumero, AFornecedor: Integer;
  ASerie: string;
  AAgruparEmpresaUnif: Boolean;
  ADataLancamento: TDateTime);
var
  ADataIni, ADataFim: TDateTime;
begin
  FTipoDeFiltro.Clear;
  FTipoDeFiltro.Add('Tipo de filtro: Nota Fiscal número ' + IntToStr(ANumero) + ' série ' + ASerie +
    vDadosIni.IfThen(ADataLancamento > 0, ' data de lançamento ' + FormatDateTime('DD/MM/YYYY', ADataLancamento), ''));

  try
    FParametros.Clear;
    FParametros.Add(' where ctp.num_nota_nfe = ' + IntToStr(ANumero));
    FParametros.Add(' and ctp.cod_forn_nfe = ' + IntToStr(AFornecedor));
    FParametros.Add(' and ctp.serie = ' + QuotedStr(ASerie));
    FParametros.Add(' and ctp.codigo_emp = ' + IntToStr(StrToIntDef(vDadosIni.codEmpresa, 0)));
    if ADataLancamento > 0 then
    begin
      ADataIni := IncMonth(ADataLancamento, -1);
      ADataFim := IncMonth(ADataLancamento, +1);
      FParametros.Add(' and ctp.data_ent_ctp >= ' + QuotedStr(FormatDateTime('YYYY/MM/DD', ADataIni)));
      FParametros.Add(' and ctp.data_ent_ctp <= ' + QuotedStr(FormatDateTime('YYYY/MM/DD', ADataFim)));
    end;

    obterDadosDoBanco('N', 0, AAgruparEmpresaUnif);

    VisualizarRelatorio(AAgruparEmpresaUnif);

  except on E: Exception do
    begin
      vDadosIni.registraErro('TRelatorioInformacaoCTP.EmitirRelatorioPor_NumeroDeNota ' + e.Message);
      vDadosIni.ShowErro('Erro ao emitir relatorio ' + E.Message);
    end;
  end;
end;

procedure TRelatorioInformacaoCTP.EmitirRelatorioPor_Periodo(
	AQualData: string;
  ADataIni, ADataFim: TDateTime;
  AComAssinatura, AQuitados, AAbertos: Boolean;
  AAgruparEmpresaUnif: Boolean);
var
  AStatus: string;
begin
  if AQuitados = AAbertos then
    AStatus := 'Ambas'
  else if AQuitados then
    AStatus := 'Quitadas'
  else
    AStatus := 'Abertas';

  FTipoDeFiltro.Clear;
  FTipoDeFiltro.Add('Tipo de filtro: Data de ' + AQualData +
    ' de ' + FormatDateTime('DD/MM/YYYY', ADataIni) +
    ' até ' + FormatDateTime('DD/MM/YYYY', ADataFim));
  FTipoDeFiltro.Add(vDadosIni.IfThen(AStatus = 'Ambas', 'Contas quitadas e abertas', 'Contas ' + AStatus));

  if AQualData = 'Vencimento' then
    AQualData := 'DATA_VENC_CTP'
  else if AQualData = 'Entrada' then
    AQualData := 'DATA_ENT_CTP'
  else
    AQualData := 'DATQ_CTP';

  try
    FParametros.Clear;
    FParametros.Add(' where ctp.codigo_emp = ' + IntToStr(StrToIntDef(vDadosIni.codEmpresa, 0)));
    FParametros.Add(' and ctp.' + AQualData + ' >= ' + QuotedStr(FormatDateTime('YYYY/MM/DD', ADataIni)));
    FParametros.Add(' and ctp.' + AQualData + ' <= ' + QuotedStr(FormatDateTime('YYYY/MM/DD', ADataFim)));
    if AQuitados <> AAbertos then
      if AQuitados then
        FParametros.Add(' and ctp.datq_ctp is not null')
      else
        FParametros.Add(' and ctp.datq_ctp is null');
    if AAgruparEmpresaUnif then
    	FParametros.Add(' order by ctp.cod_emp_mult ');
  
    obterDadosDoBanco('N', 0, AAgruparEmpresaUnif);

    FComAssinatura := AComAssinatura;

    VisualizarRelatorio(AAgruparEmpresaUnif);

  except on E: Exception do
    begin
      vDadosIni.registraErro('TRelatorioInformacaoCTP.EmitirRelatorioPor_Periodo ' + e.Message);
      vDadosIni.ShowErro('Erro ao emitir relatorio ' + E.Message);
    end;
  end;
end;

procedure TRelatorioInformacaoCTP.VisualizarRelatorio(pAgruparEmpresaUnif: Boolean);
var
  rdp: TRDprint;
  ALinha, APagina :Integer;
  ADataHora: TDateTime;
  AText: TStrings;
  I: Integer;
  J: Integer;

  procedure ImpLinha(ACol: Integer; AValue: string);
  begin
    rdp.Imp(ALinha, ACol, Copy(AValue, 1, 80));
    ALinha := ALinha + 1;
  end;

  procedure ImprimeCabecalho;
  var
    ACont: Integer;
  begin
    ALinha := 1;
    APagina := APagina + 1;
    ImpLinha(001, vDadosIni.Space(vDadosIni.vEmp.vnomeEmpresa, 70) + ' Pag. ' + vDadosIni.StrZero(APagina, 4));//80
    ImpLinha(001, vDadosIni.Replicate('-', 80));
    ImpLinha(001, vDadosIni.Space(FTitulo, 51) + 'Emissão: ' + FormatDateTime('DD/MM/YYYY hh:mm:ss', ADataHora));//80
    for ACont := 0 to FTipoDeFiltro.Count - 1 do
      ImpLinha(001, FTipoDeFiltro[ACont]);
    ImpLinha(001, 'Quantidade de Contas a Pagar deste relatório: ' + IntToStr(FDadosCTP.Count));
    if pAgruparEmpresaUnif then
    	ImpLinha(001, 'Agrupar empresas unificadas');

    ImpLinha(001, vDadosIni.Replicate('-', 80));
  end;

begin
  rdp := TRDprint.Create(Application);
  try
    rdp.OpcoesPreview.CaptionPreview := FTitulo;
    rdp.CaptionSetup := 'Configurar impressão';
    rdp.TitulodoRelatorio := FTitulo;
    vDadosIni._LimparVarSendEmail;
    rdp.OnSendMail := vDadosini._SendMailRdPrint;
    rdp.OpcoesPreview.Preview := True;
    rdp.FonteTamanhoPadrao := S17cpp;
    rdp.TamanhoQteColunas := 80;
    rdp.TamanhoQteLinhas := 66;
    APagina := 0;
    if not vDadosIni.ModImp(rdp) then
      exit;
    rdp.Abrir;

    ADataHora := vDadosIni.getDataHoraBanco(Buscas);

    ImprimeCabecalho;

    ALinha := ALinha + 1;

    for I := 0 to FDadosCTP.Count - 1 do
    begin    
      AText := FDadosCTP.Items[I].GetImpressao(pAgruparEmpresaUnif);
      if Assigned(AText) then
      begin
        if (ALinha + AText.Count + 1) > 66 then
        begin
          rdp.Novapagina;
          ImprimeCabecalho;
        end;
        for J := 0 to AText.Count - 1 do
          ImpLinha(001, AText[J]);
        ImpLinha(001, vDadosIni.Space(38) + '----' + vDadosIni.Space(38));
      end;
    end;
    ImpLinha(001, vDadosIni.Replicate('-', 80));

    if FComAssinatura then
    begin
      if (ALinha + 3 ) > 66 then
      begin
        rdp.Novapagina;
        ImprimeCabecalho;
      end;
      ALinha := ALinha + 1;
      ImpLinha(001, vDadosIni.Space(vDadosIni.Space('Assinatura:___________________________________________', 67), 80, True));
    end;

    if rdp.EstaAberto then
      rdp.Fechar;
  finally
    rdp.Free;
  end;
end;

procedure TRelatorioInformacaoCTP.obterDadosDoBanco(
	pExibirEmp: string;
  pCodEmpMult: Integer;
  pAgruparEmpresaUnif: Boolean);
var
  AText: TStrings;
  I: Integer;
  vCodEmpMult: Integer;
begin
  try
    Buscas.Close;
    Buscas.SQL.Text := FSqlCampos + FParametros.Text;
    Buscas.Open;

    vCodEmpMult := 0;

    Buscas.First;
    while not Buscas.Eof do
    begin
      with FDadosCTP.New do
      begin
      	if pAgruparEmpresaUnif then
        begin
          if (pExibirEmp = 'S') then
            CodEmpMult := pCodEmpMult
          else
          begin
            if (vCodEmpMult <= 0) then
              CodEmpMult := Buscas.FieldByName('cod_emp_mult').AsInteger
            else if (vCodEmpMult <> Buscas.FieldByName('cod_emp_mult').AsInteger) then
              CodEmpMult := Buscas.FieldByName('cod_emp_mult').AsInteger
            else
              CodEmpMult := 0;
          end;
        end
        else
        	CodEmpMult := Buscas.FieldByName('cod_emp_mult').AsInteger;

        vCodEmpMult := Buscas.FieldByName('cod_emp_mult').AsInteger;

        NumeroDocumento  := Buscas.FieldByName('n_doc_ctp').AsString;
        Valor            := Buscas.FieldByName('valor_ctp').AsFloat;
        ValorPago        := Buscas.FieldByName('valor_pago').AsFloat;
        DataVencimento   := Buscas.FieldByName('data_venc_ctp').AsDateTime;
        Tipo             := Buscas.FieldByName('tipo_ctp').AsString;
        NumeroNF         := Buscas.FieldByName('num_nota_nfe').AsString;
        DataEmissao      := Buscas.FieldByName('data_ent_ctp').AsDateTime;
        Cheque           := Buscas.FieldByName('n_cheq_ctp').AsString;
        BancoDocumento   := Buscas.FieldByName('nome_banco_dupl').AsString;
        Status           := Buscas.FieldByName('status_ctp').AsString;
        DataQuitacao     := Buscas.FieldByName('datq_ctp').AsDateTime;

        Fornecedor.Codigo      := Buscas.FieldByName('cod_forn_nfe').AsInteger;
        Fornecedor.Descricao   := Buscas.FieldByName('nome_for_ctp').AsString;

        ControlePgto.Codigo    := Buscas.FieldByName('codigo_ctrl').AsInteger;
        ControlePgto.Descricao := Buscas.FieldByName('nome_ctrl').AsString;

        CodPagto.Codigo        := 0;
        CodPagto.Descricao     := IntToStr( Trunc(DateOf(DataVencimento) - (DataEmissao))) + ' Dias';

        BuscasAux.Close;
        BuscasAux.SQL.Text := 'select observacao from observacao ob' +
          ' where ob.cod_obs = ' + IntToStr(Buscas.FieldByName('cod_obs').AsInteger) +
          ' and ob.cod_empresa = ' + vDadosIni.codEmpresa;
        BuscasAux.Open;

        while not BuscasAux.Eof do
        begin
           AText := TStringList.Create;
           AText.Text := BuscasAux.FieldByName('observacao').AsString;
           for I := 0 to AText.Count - 1 do
            Observacoes.Add(AText[I]);
          BuscasAux.Next;
        end;
        BuscasAux.Close;
      end;
      Buscas.Next;
    end;
    Buscas.Close;
  except
    on E: Exception do
    begin
      vDadosIni.registraErro('obterDadosDoBanco ' + e.Message);
      raise Exception.Create('obterDadosDoBanco ' + e.Message);
    end;
  end;  
end;

{ TInformacaoCTPCadBasico }

procedure TInformacaoCTPCadBasico.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TInformacaoCTPCadBasico.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

{ TCreditosCTP }

constructor TCreditosCTP.create;
begin
  if dtmContasAPagar = nil then
    dtmContasAPagar := TdtmContasAPagar.Create(dtmContasAPagar);
  DataSet := TClientDataSet(dtmContasAPagar.cdsControleCR);
  transacao := TIBTransaction(dtmContasAPagar.transContaAPagar);
  Buscas := TIBQuery(dtmContasAPagar.qrBuscasControleCR);
  vNumCtrlTemp:=0;
end;

destructor TCreditosCTP.destroy;
begin
  Close;
  inherited;
end;

function TCreditosCTP._abreCreditosCTP: boolean;
var
  vSqlDataVencimento: string;
begin
  vDadosIni.vInibeMensPesqPros := 'S';
  vSqlDataVencimento := vDadosIni.retornoPorCondicao(
    vDadosIni.PesqPros('CTP030', 'HABILIRAR', '', 'CONTAS_A_PAGAR', '', buscas, True),
    '', ' and controle_creditos.data_venc_c <= ' + vDadosIni.FusoSqlDate);
  if vDadosIni.vEmp.vFinanceiroUnificado then
    result := montaSelect('select controle_creditos.* from controle_creditos ' +
      ' left join empresa on empresa.cod_empresa = controle_creditos.cod_emp_mult ' +
      ' where (controle_creditos.status_c is null or controle_creditos.status_c = '''')' + vSqlDataVencimento +
      ' and coalesce(controle_creditos.status_cx,'''')<>''R'' ' +
  //    ' and controle_creditos.codigo_emp=' + vDadosIni.codEmpresa +
      ' and (case when (empresa.financeiro_unificado = ''S'') then ' +
      ' empresa.codigo_unificadora else controle_creditos.codigo_emp end) = ' + vDadosIni.codEmpresa +
      ' and controle_creditos.cod_emp_mult in ' + vDadosIni.vEmp.vCodigoUnificadas +
      ' and controle_creditos.codigo_ctrl = '+inttostr(vNumCtrlTemp)+
      ' order by controle_creditos.data_venc_c')
  else
    result := montaSelect('select controle_creditos.* from controle_creditos ' +
      ' left join empresa on empresa.cod_empresa = controle_creditos.cod_emp_mult ' +
      ' where (controle_creditos.status_c is null or controle_creditos.status_c = '''')' + vSqlDataVencimento +
      ' and coalesce(controle_creditos.status_cx,'''')<>''R'' ' +
      ' and controle_creditos.codigo_emp=' + vDadosIni.codEmpresa +
      ' and controle_creditos.codigo_ctrl = '+inttostr(vNumCtrlTemp)+
      ' order by controle_creditos.data_venc_c');
end;

function TCreditosCTP._abreCreditosCTP(ACodigo: Integer; ACodigoEmpresa: Integer): boolean;
begin
  dataSet.Close;
  dataSet.Filter := '';
  dataSet.Filtered := False;

  if vDadosIni.vEmp.vFinanceiroUnificado then
    result := montaSelect('select controle_creditos.* from controle_creditos ' +
      ' left join empresa on empresa.cod_empresa = controle_creditos.cod_emp_mult ' +
      ' where controle_creditos.cod_cred = ' + IntToStr(ACodigo) +
      ' and controle_creditos.codigo_emp=' +
      vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (ACodigoEmpresa > 0),
         IntToStr(ACodigoEmpresa), vDadosIni.codEmpresa) +
      ' and controle_creditos.cod_emp_mult in ' + vDadosIni.vEmp.vCodigoUnificadas)
  else
    result := montaSelect('select controle_creditos.* from controle_creditos ' +
      ' left join empresa on empresa.cod_empresa = controle_creditos.cod_emp_mult ' +
      ' where controle_creditos.cod_cred = ' + IntToStr(ACodigo) +
      ' and controle_creditos.codigo_emp=' + vDadosIni.codEmpresa);
  Result := not dataSet.IsEmpty;
end;

procedure TCreditosCTP._atualizaValorCreditosSel(pLabel: TLabel);
begin
  pLabel.Caption := Format('%0.2m', [vSaldoCreditosSelecionados]);
end;

procedure TCreditosCTP._marcaDesmarcaLinha(pDataSetLanc: TClientDataSet);
begin
  if dataSet.IsEmpty then
    exit;
  dataSet.Edit;
  if dataSet.FieldByName('sel').AsString = 'S' then
  begin
    dataSet.FieldByName('sel').AsString := '';
    vSaldoCreditosSelecionados := vSaldoCreditosSelecionados - dataSet.FieldByName('VALOR_C').AsCurrency;
  end
  else
  begin
    //    if not pDataSetLanc.Locate('CODIGO_CH;CODIGO_EMP',VarArrayOf([dataSet.FieldByName('CODIGO_CH').AsInteger,strtoint(vDadosIni.codEmpresa)]), []) then
    if not pDataSetLanc.Locate('COD_CRED', dataSet.FieldByName('COD_CRED').AsInteger, []) then
    begin
      vSaldoCreditosSelecionados := vSaldoCreditosSelecionados + dataSet.FieldByName('VALOR_C').AsCurrency;
      dataSet.FieldByName('sel').AsString := 'S';
      if (vSaldoCreditosSelecionados > CTP.rCTP.vValorAInformar) then
      begin
         Application.MessageBox(PChar('Valor dos créditos maior que o valor a informar' + #13 +
	         'Valor dos créditos: R$ ' + FormatFloat('0.00', vSaldoCreditosSelecionados) + #13 +
         	'Valor a informar: R$ ' + FormatFloat('0.00', CTP.rCTP.vValorAInformar) + #13 +
            'Favor conferir'), 'Informação', MB_OK + MB_ICONINFORMATION);

         if not vDadosIni.PesqPros('CTP031', 'PERMITIR', '', 'CONTAS_A_PAGAR', '', buscas, False) then
         begin
           dataSet.FieldByName('sel').AsString := '';
           vSaldoCreditosSelecionados := vSaldoCreditosSelecionados - dataSet.FieldByName('VALOR_C').AsCurrency;
           exit;
         end;
      end;
    end
    else
      Application.MessageBox('Já foi efetuado o lançamento deste Crédito', 'Informação', MB_OK + MB_ICONINFORMATION);
  end;
  dataSet.Post;
end;

{ TDetalhesConta }

constructor TDetalhesConta.create;
begin
	if dtmContasAPagar = nil then
    dtmContasAPagar := TdtmContasAPagar.Create(dtmContasAPagar);
  DataSet := TClientDataSet(dtmContasAPagar.cdsDetalhesConta);
  transacao := TIBTransaction(dtmContasAPagar.transContaAPagar);
  Buscas := TIBQuery(dtmContasAPagar.qrDetalhesConta);
end;

function TDetalhesConta._abreDetalhesConta(
	pCodContrp, pCodigoEmp: Integer): boolean;
begin
	Result := montaSelect(
  	' select contas_a_pagar.*, controles.nome_ctrl, empresa.identificacao_emp, ' +
    ' p_contas.desc_plc, grupos_ct.desc_gr, depart_ct.desc_dep, ' +
    ' p_contas_contabil.cod_cta, p_contas_contabil.nome_cta, retorna_pag_ctp.form_pag from contas_a_pagar ' +
    ' left join controles on controles.codigo_ctrl = contas_a_pagar.codigo_ctrl and controles.codigo_emp = contas_a_pagar.codigo_emp ' +
  	' left join empresa on empresa.cod_empresa = contas_a_pagar.cod_emp_mult ' +
    ' left join p_contas on p_contas.n_conta_plc = contas_a_pagar.n_conta_plc ' +
    ' left join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct ' +
    ' left join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep ' +
    ' left join p_contas_contabil on p_contas_contabil.cod_cta = p_contas.cod_cta_contabil and p_contas_contabil.cod_empresa = contas_a_pagar.cod_emp_mult ' +
    ' left join retorna_pag_ctp (contas_a_pagar.lote, contas_a_pagar.datq_ctp, ' + vDadosIni.codEmpresa + ', 0, '''') on 1 = 1 ' +
  	' where contas_a_pagar.cod_contrp = ' + IntToStr(pCodContrp) +
    ' and contas_a_pagar.codigo_emp = ' + IntToStr(pCodigoEmp) +
    ' and not contas_a_pagar.datq_ctp is null ' +
    ' union ' +
    ' select contas_a_pagar.*, controles.nome_ctrl, empresa.identificacao_emp, ' +
    ' p_contas.desc_plc, grupos_ct.desc_gr, depart_ct.desc_dep, ' +
    ' p_contas_contabil.cod_cta, p_contas_contabil.nome_cta, retorna_pag_ctp.form_pag from contas_a_pagar ' +
    ' left join controles on controles.codigo_ctrl = contas_a_pagar.codigo_ctrl and controles.codigo_emp = contas_a_pagar.codigo_emp ' +
    ' left join empresa on empresa.cod_empresa = contas_a_pagar.cod_emp_mult ' +
    ' left join p_contas on p_contas.n_conta_plc = contas_a_pagar.n_conta_plc ' +
    ' left join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct ' +
    ' left join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep ' +
    ' left join p_contas_contabil on p_contas_contabil.cod_cta = p_contas.cod_cta_contabil and p_contas_contabil.cod_empresa = contas_a_pagar.cod_emp_mult ' +
    ' left join retorna_pag_ctp (contas_a_pagar.lote, contas_a_pagar.datq_ctp, ' + vDadosIni.codEmpresa + ', 0, '''') on 1 = 1 ' +
    ' where contas_a_pagar.cod_contrp_orig = ' + IntToStr(pCodContrp) +
    ' and contas_a_pagar.codigo_emp = ' + IntToStr(pCodigoEmp) +
    ' and not contas_a_pagar.datq_ctp is null ');
end;

function TDetalhesConta._somarTotalConta(pCodContrp,
  pCodigoEmp: Integer): Double;
var
	buscas2: TIBQuery;
begin
	Result := 0;
  
	buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;
  
	buscas2.Close;
  buscas2.SQL.Text :=
	  ' select sum(coalesce(ctp.valor_ctp, 0)) valor_ctp from contas_a_pagar ctp ' +
  	' where ctp.cod_contrp = ' + IntToStr(pCodContrp) +
    ' and ctp.codigo_emp = ' + IntToStr(pCodigoEmp) +
    ' union ' +
    ' select sum(coalesce(ctp.valor_ctp, 0)) valor_ctp from contas_a_pagar ctp ' +
    ' where ctp.cod_contrp_orig = ' + IntToStr(pCodContrp) +
    ' and ctp.codigo_emp = ' + IntToStr(pCodigoEmp);
  buscas2.Open;

  buscas2.First;
  while not buscas2.Eof do
  begin
    Result := Result + buscas2.FieldByName('valor_ctp').AsFloat;

  	buscas2.Next;
  end;
  buscas2.Close;
end;

{ TContasCTP }

constructor TContasCTP.create;
begin
	if dtmContasAPagar = nil then
    dtmContasAPagar := TdtmContasAPagar.Create(dtmContasAPagar);
  DataSet := TClientDataSet(dtmContasAPagar.cdsControleCTP);
  transacao := TIBTransaction(dtmContasAPagar.transContaAPagar);
  Buscas := TIBQuery(dtmContasAPagar.qrBuscasControleCTP);
end;

destructor TContasCTP.destroy;
begin
	Close;
  inherited;
end;

function TContasCTP._abreContasCTP(ACodContrp,
  ACodigoEmpresa: Integer): boolean;
begin
	result := montaSelect('select first 1 contas_a_pagar.* from contas_a_pagar ' +
    ' where contas_a_pagar.cod_contrp = ' + IntToStr(ACodContrp) +
    ' and contas_a_pagar.codigo_emp = ' + IntToStr(ACodigoEmpresa));
end;

function TContasCTP._abreContasCTP(ACodigoEmpresa: Integer): boolean;
begin
	result := montaSelect('select first 1 contas_a_pagar.* from contas_a_pagar ' +
    ' where contas_a_pagar.cod_contrp = 0 ' +
    ' and contas_a_pagar.codigo_emp = ' + IntToStr(ACodigoEmpresa));
end;

end.

