///  na nova conta a receber colocar o campo vl_coinbtabil no formulario - ok
///  mudanca de controle e voltar para o ativo - ok
///  tela de replicacao selecionar se vai replicar o valor contabil - ok
///  replicacao pelo cadastro????????
///  tirar o campo tip cnt ok
///  preencher o vl_contabil assim como nos lancamentos
///       testar  dentro do financeiro os valores contabeis OK
///       testar baixa parcial OK
///       testar estorno OK


unit uClassesContasAReceber;

interface

uses
  uDataSet_OOP, Messages, Controls, DB, DBGrids, DBClient, StdCtrls,
  UClassesCadastrosBasicosCx, uClassesImportacaoFinanceiro, IBQuery, CheckLst, RDPrint,
  ComCtrls, Classes, IdSMTP, IdMessage, IdText, IdAttachmentFile, IdSSLOpenSSL,
  IdExplicitTLSClientServerBase, IdIOHandler, IBStoredProc, IBDatabase, uDadosIni;

type
  CImpressao = (tiGrafico, tiMatricial );

  RContas = record
    parcelas, indice: Integer;
    NumConta: array of Double;
    CodCred, CodFornecedor, CodTpDespesa: array of Integer;
    dataReferencia, numeroDocumento, vencimentoDocumento: arraystring;
    NumDoc, NCHQ, NCHQNominal, tipoVenda, numVenda, historico, ContrBanc: arraystring;
    valorDocumento: arrayextended;
    Controle: array of Integer;
  end;

  RNotEnv = record
    vSqlAdicional: AnsiString;
    vDataIni, vDataFim, vDataIniAd, vDataFimAd, vCondicao, vCondicaoAd, vCampo, vCampoAd, vValor, vValorAd: string;
    vPorData, vAdicional, vPorDataAd, vAvancada: boolean;
    vAvisoVenc, vCreditosAtraso, vAgradecimento: boolean;
    vStatusNO, vStatusEP, vStatusAC, vStatusER, vStatusPP: boolean;
    vOrigemErp, vOrigemBot, vDestinoErp, vDestinoBot: boolean;
  end;

  RImpressao = record
    tpImpressao: CImpressao;
    vSomenteSel, vComEndereco, vComJuros, vBandAdmnParc, vCodVendNome, vExibirVenda, vAgruparEmpUnf: Boolean;
  end;

  T_enviarEmailCobranca = function (pPort,pPrioridade : Integer;
    pSMTP,pLogin, pSenha,pNomeRemetente,pListaEmail,pListaEmailCC,pListaEmailCCO,
    pAssunto, pCorpo , pAnexos: PChar;
    pUsarAtenticacao, pUsarAtenticacaoSSL : Boolean;pDate:TDateTime) : Boolean; stdcall;
  RConsultaReceber = record
    campo, ordem, condicao, valor, dataIni, dataFim: string;
    porData, porDataAd, quitados, naoQuitados, retornos: Boolean;
    //Opçoes Adicionais
    adicional: boolean;
    campoAd, valorAd, dataIniAd, dataFimAd, condicaoAd: string;
    tipoE: string;
    verFormas: boolean;
  end;

  RCDL = record
    dataVencimento, NumDocumento, NomeCliente, NumCheque, Agencia, NumBanco: string;
    valorSPC: Currency;
    vNegativar, vImprimirFichaSPC, vValorVenda, vEmLote, vCodigoMV: Boolean;
  end;

  RRecibo = record
    codClienteDoRecibo, qtde: Integer;
    docDoRecibo, nomeClienteRecibo, dataVencRecibos: string;
    valorRecibo: Currency;
    docDoReciboL, dataVencRecibosL: TStringList;
  end;

  RRecebimento = record
    referenteDevolucao, referenteCTP, usarValorCorrigido, acrescentarNomeHist, baixaParcial,
      lancarDesconto, lancarJuros, lancarTaxaCartao, processamentoAutomatico, processamentoAutomaticoDev: Boolean;
    valorPrevisto, valorOperacao, valorSaida, valorAtingido, valorAInformar: Currency;
    	valorDinheiro, valorCheque, valorCredito, valorRecibos, valorDescontos, valorJuros,
    	valorSaidaCartao, valorEntradaCartao: Currency;
    historicoSaida, historicoSaidaLancamento, nomeHistoricoSaida, numDoc, historicoDevolucao: string;
    codigoControleSelecionados, loteQuitacao, codigoControleTaxaCartao, loteBaixaAdm, codigoUnificada, codigoEmpresa: Integer;
    numContaSCh, numContaSCr, numContaVendaProd, numContaCompraProd, numContaSaidaJuros, numContaJuros,
    	numContaEntDesconto, numContaDesconto, numContaTaxaCartao: Double;
    codigoUnificadaBxCartao: Integer;
    numContaTemp: Double;
    valorSomaTaxaCartao: Extended;
    // Variavel usada para armazenar a soma do valor contabil das contas para ser rateada entre as demais
    somaValorContabil: Currency;
    dataBaixa, dataRef: TDate;
    codigosControleLanc: array of Integer;
    historicoLanc: array of String;
    valorLancSaida: array of Currency;
    historicoSaidaLancamentoIni: string;
  end;

  TNotEnvFinanc = class;
  TContasAReceber = class;
  TControleCheque = class;
  TControleCredito = class;
  TBaixaCreditos = class;
  TPContasCAR = class;
  TControlesCAR = class;
  TContasBancariasCAR = class;
  TClienteCAR = class;
  TRecebimento = class;
  TCartasCobranca = class;
  TCreditosCartas = class;
  TObs_Cred = class;
  TPendenciasCartao = class;
  TNotasRetornoMercadorias = class;
  TEmpresasUnificadas = class;

  TEmpresasUnificadas = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTodosEmpresas: Boolean;
    function _BuscarEmpresas(vCodEmp: Integer): Boolean;
  end;


  TClienteCAR = class(TDataSet_OOP)
  public
    constructor create;
    function _selecionaCliente(pCodigo: Integer; pCodigoUnificada: Integer): Boolean;
  end;

  TContasBancariasCAR = class(TDataSet_OOP)
  private
    FEmCadastroCAR: Boolean;
    fCodigoUnificada: Integer;
  public
    constructor create;
    function delete: Boolean;
    function insert: Boolean; override;
    function post: Boolean;
    function _abreContasBancarias(pCodigoCliente: Integer; pCodigoUnificada: Integer): Boolean;

    property EmCadastroCAR: Boolean read FEmCadastroCAR write FEmCadastroCAR;
  end;

  TPContasCAR = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTodosPContasLanc: Boolean;
    function _abrePContasLanc(pNatureza: string; pCodPContas: Double = 0): Boolean;
    function verificarConta(pNatureza: string; pNumConta: Double): boolean;
  end;

  TControlesCAR = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTodosControlesCAR(pContrapartida: boolean = false; pCodEmpMult: Integer = 0): Boolean; overload;
    function _abreTodosControlesCAR(pDocs: string; pCodEmpMult: Integer): Boolean; overload;
	  function _abreTodosControlesCAR(pDocs: string; pContrapartida: boolean = false; pCodControle: Integer = 0; pCodEmpMult: Integer = 0): Boolean; overload;
    function _abreTodosControlesCAR(pDocs: string; pBarramentoAutomatico: string; pCodEmpMult: Integer = 0): Boolean; overload;
    function _abreTodosControlesCAR(pDocs: string; pBarramentoAutomatico: string; pMudarControle: Boolean; pControle: Integer; pCodEmpMult: Integer = 0): Boolean; overload;
    function _abreTodosControlesBarramentoAutomaticoCAR(pCodEmpMult: Integer = 0): Boolean;
    function _selecionaControle(pCodigo: Integer; pCodEmpMult: Integer = 0): Boolean;
  end;

  TRecibosCAR = class(TDataSet_OOP)
  private
    fValorRecibo: Currency;
    buscasRec: TIBQuery;
  public

    function _abreFormValorBaixaRecibo: Boolean;

    constructor create(ATransaction: TIBTransaction = nil);
    function _selecionaRecibosAtencipados(pCodigoUnificada: Integer): Boolean;
    procedure _marcaLinha;
    procedure _marcaDesmarcaLinha;
    procedure _desmarcaLinha;
    function _somaRecibos: Currency;
    procedure _somaValor;
    procedure _informarValorRecibosSelecionados;
    procedure _demarcarTodos;

    property valorRecibo: Currency read fValorRecibo write fValorRecibo;
  end;

  TDocEletronicoNotEnvFinanc = class(TDataset_OOP)
  private
  public
    constructor create;
    function abreDocEletronicoMensMobile(
    	codmens: Integer;
      tipo: string): boolean;
  end;

  TNotEnvFinanc = class(TDataset_OOP)
  private
  public
  	destructor Destroy; override;
  	constructor create;
    procedure _abrirNotEnvFinanc(pTipoForm: Integer);
    function abreNotEnvFinanc: boolean; overload;
    function abreNotEnvFinanc(pCodigo: Integer; pCodEmpMult: Integer): boolean; overload;
    function _defineSqlAdicional: boolean;
    function lerDadosApiMensagem: Boolean;
  var
  	rNotEnv: RNotEnv;
    vDoc: TDocEletronicoNotEnvFinanc;
  end;

  TDocumentosOrigem = class(TDataset_OOP)
  private
  public
  	 constructor create;
    function abreDocumentosOrigem(pNdocV: Integer; pTipoDocV: string; pCodEmpresa: Integer): boolean; overload;
  end;

  TContasAReceber = class(TDataSet_OOP)
  private
    function _abreFormHistoricoCliente: Boolean;
    function _abreFormReceber: Boolean;
    function _abreFormReceberDinheiro: Boolean;
    function _abreFormReceberCheque: Boolean;
    function _abreFormReceberCredito(pEditar: boolean = false): Boolean;
    function _abreFormDiferenciaDoRecebimento: Boolean;
    function _abreFormLoteQuitacao: Boolean;
    procedure _beforePostRecebimento(pDataSet: TDataSet);
  protected
  	 Fsql_campos: string;
    Fsql_inner: string;
    Fsql_inner_pag: string;
    FDataSource, FDataSource2: TDataSource;
    FBuscas2,Fbuscas1,Fbuscas3, FbuscasCreditoCheque: TIBQuery;
    fRecebimento: TClientDataSet;
    fDsRecebimento: TDataSource;
    FDocs: string; //S1: Cheque; S2: Créditos
    FSequencial: Boolean;
    // Indica se o cadastro vai ser sequencial, fazendo apenas um lancamento para todos os cadastros
    FCodigoLancamento: Integer;
    // Recebe o valor do lancamento efetuado, para poder ser feito o lancamento sequencial
    FVale: Boolean; // Indica que o controle é Vale para ativar o codigo do funcionario
    FTable: string; //Armazena o nome da tabela que esta sendo mantida para gravar as auditorias
    FCodigo: Integer; //Armazena o codigo da tabela que esta sendo mantida para gravar as auditorias
    FDataPrevRec: TDate; //Guarda a data previsao recebimento informada pelo usuario
    FDataRealBaixa: TDate; //Guarda a data real da baixa informada pelo usuario
    FQtdeReplicacao, FDiaReplicacao: Integer;
    FReplVlContReplicacao: Boolean;
    FReplAltNumQtdeReplicacao: Boolean;
    FReplNaoAltNumQtdeReplicacao: Boolean;
    // Armazena os dados para replicação de contas a receber
    FDescontoAcrescimo: string;
    FDescontoValor, FDescontoPercentual, FValorPrevisto, FValorOperacao, FValorCorrigido: Real;
    // Armazena os valores de desconto para os registros selecionados
    FBaixaDevolucao: Boolean;
    // Variavel usada para definir que as contas selecionadas nao serão recebidas, apenas baixadas como devolucao
    FRecebendo: Boolean;
    // Variavel de controle para os creditos que estando sendo cadastrados no momento de receber contas
    fUsarValorAAtingir, fRemoverDesconto: Boolean;
    // Variavel usada para ativar o transporte do valor da comissao para o cheque que voltou para o ativo
    fTransportarValorComissao: Boolean;
    // Variavel usada para recalcular taxa do cartao
    FQtdeParcelaCartao, FCodBandeiraCartao, FCodAdmCartao, FNParcelaCartao: Integer;
  	FCodTermAdmCartao, FDescTermAdmCartao, FDescAdmCartao, FDesBandeiraCartao, FNAutCartao, FNDocNsuAdmCartao, FNsuRoAdmCartao, FRoAdmCartao: string;
  	FAdmConfCartao, FTerminalConfCartao: boolean;

    fBookMark: Pointer;
    linha, vpag: integer;
    vnomevend: string;
    Fhistdigdif: string;
    Fcontadigdif: Double;
    FvalorContabildigdif: Currency;

    vLancL: TLancamentosImp;
    vContLigL: TContaLigacaoImp;

    function _existeControle(pControle: Integer; pCodEmpMult: Integer = 0): Boolean;
    procedure _verificaDataVenda;
    function _existeColaborador(pCodigo, pCodigoUnificada: Integer): Boolean;
    function _existeVenda: Boolean;
    function _getValorVenda(pTipoVenda: string; pNumVenda: Integer; pValorDefault: Currency; pCodigoUnificada: Integer):
      Currency;
    procedure _imprimirFichaSPC;
    procedure _imprimirRecibo;
    function _definirDataSetRecebimento: Boolean;
    function _definirContasDeSaida: Boolean;
    procedure _somarLancamentoRecebimento;
    function _confirmarLancamentosRecebimento: Boolean;
    function _fazerLancamentoSaidaRecebimento: Boolean;
    function _fazerLancamentoJurosDescontoRecebimento: Boolean;

    function _quitarRegistrosSelecionados(ATransaction: TIBTransaction = nil): Boolean; virtual; abstract;
    procedure verificaErroDataSetOpen(pErro: string);
    procedure verificaRecibo;
  public
    vdata1, vdata2: TDate;
    function cancel: Boolean; override;

    procedure retornaTransaction;
    procedure cadContasAReceber(TipoForm: integer; pDocs: string);
    function _abreFormCadastroContasBancarias: Boolean;
    function _abreFormConsultaContasBancarias: Boolean;
    function _abreFormNegativarCliente: Boolean;
    function _abreFormMudarControleOuVoltarParaAtivo(pCaptionForm, pCaptionPanel: string; var
      pHistorio: string): Boolean;
    function _abreFormDetalhes(pReciboBaixa: Boolean): Boolean;
    function _abreFormComissao: Boolean;
    function _abreFormDataPrevRec(pQtdeReg: Integer): Boolean;
    function _abreFormDataRealBaixa: Boolean;
    function _abreFormReplicacaoContas: Boolean;
    function _abreFormDesconto(pValorOperacao: Real): Boolean;
    function _abreFormRecibos: Boolean;
    function _abreFormDadosParaBaixa: Boolean;
    function _abreFormObservacoes: Boolean;
    function _abreFormImpressao: Boolean;
    function _existePContas(pNContaPlc: Double): Boolean;
    function _clienteValido: boolean;
    function _clienteTerceiroValido: boolean;
    function _controleValido: Boolean;
    procedure _marcaLinha;
    procedure _marcaDesmarcaLinha;
    procedure _desmarcaLinha;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    function _imprimirBoleto(pGerarCarne: boolean = true; pUsarValorCorrigido: boolean = false; pExibirMensagemGerarBoleto: boolean = false): Boolean;
    function _obterHistoricoCliente: Boolean;
    procedure _enviarModuloTranf;
    procedure _marcarBaixaParaDevolucao;
    function _receberComControleSelecionado(pRecibo: Boolean): Boolean;
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
    function abreFormRecibo: boolean;
    function _alterarLancamentoRecebimento: Boolean;
    function _removerLancamentoRecebimento: Boolean;
    function _confereLancamentoRecebimento: Boolean;
//    function _desnegativaClienteRecebimento(pCodCliente: Integer; vtp: integer): Boolean;
    function _excluirDadosEstorno(pNumLoteQuitacao, pCodigoUnificada: Integer): Boolean;
    function _preenchecheck(vcheck: TchecklistBox): boolean;
    function _preencheCombovend(vcombobox: Tcombobox; pCodigoUnificada: Integer): boolean;
    function _emiteRelatorioDev(vcheck: TchecklistBox;
      vvend: string; vFiltroVend, pPorCarteira: boolean; pCodigoUnificada: Integer): boolean;
    procedure _rdSendMail(Sender: TObject);
    procedure cabrelDev(vrdp: TRdprint; vcomvend: boolean; pCodigoUnificada: Integer);
    function retornacodvendedor(vnome: string; pCodigoUnificada: Integer): integer;
    procedure _desmarcarDocumentoComoRecebendo;
    function testarNumConta(pNatureza: string; pNumConta: Double; var pMensagem: string): boolean;
    function verificarConta(pNatureza: string; pNumConta: Double): boolean;

    function _consulta: boolean; virtual; abstract;
    function _getDataUltimaVenda(pTipoVenda: string; pNumVenda: Integer): string; virtual; abstract;
    function _permitirAlterarDataVencimento: Boolean; virtual; abstract;
    function _dataRecebimentoValida: Boolean; virtual; abstract;
    procedure _efetuarSoma; virtual; abstract;
    procedure _relatorioMatricial; virtual; abstract;
    function _negativaDesnegativaCliente: Boolean; virtual; abstract;
    function _mudarControleOuVoltarParaAtivo: Boolean; virtual; abstract;
    function _detalhesRecebimento: Boolean; virtual; abstract;
    function _modificarDataValorComissao: Boolean; virtual; abstract;
    function _impressaoDeRecibo: Boolean; virtual; abstract;
    function _informarDataPrevRec: Boolean; virtual; abstract;
    function _informarDataRealBaixa: Boolean; virtual; abstract;
    function _informarObservacaoParaCxl(pObs: string = ''; pRegistroAtual: Boolean = False): Boolean; virtual; abstract;
    function _informarObservacoes: Boolean; virtual; abstract;
    function _replicarControleCredito: Boolean; virtual; abstract;
    function _corrigirValor(pSomenteSelecionados: Boolean; pConsDesAcres: Boolean = true; pExibirMensagem: boolean = true): Boolean; virtual; abstract;
    procedure _corrigir; virtual; abstract;
    function _concederAcrescimoDesconto: Boolean; virtual; abstract;
    function _altervalorcorrigido: Boolean; virtual; abstract;
    function _efetuarRecebimento: Boolean; virtual; abstract;
    function _estornarRecebimento: Boolean; virtual; abstract;
    function _visualizarLoteBaixa: Boolean; virtual; abstract;
    function _documentoRecebidoOuSendoRecebido: Boolean; virtual; abstract;
    function _gerarCarne(pGerarCarne: boolean = true; pUsarValorCorrigido: boolean = false; pExibirMensagemGerarBoleto: boolean = false): Boolean; virtual; abstract;
    function _gerarBoletoCreditos(pCodCreditos: string; pLoteBaixa: Integer): Boolean; virtual; abstract;
    function _gerarImpressao: Boolean; virtual; abstract;
    function _Emiterelatorioendiv: boolean; virtual; abstract;
    function _VerificaTpControle(vcontr: integer): boolean; virtual; abstract;
    function _baixaCreditosConciliacaoCartao(pLote: Integer; pCartaoCDS: TClientDataSet; pLancarTarifa, pLancarAjuste, pLancarComissao: Boolean; pCodigoUnificada: Integer): Boolean; virtual; abstract;
    function _baixaDevCreditosConciliacaoCartao(pLote: Integer; pCodigoUnificada: Integer; pLancarTarifa, pLancarComissao: Boolean): Boolean; virtual; abstract;
    function _informarDadosTransacaoCartao(pTipo: Integer = 0): Boolean; virtual; abstract;
    function _vicularTransacaoPendente: Boolean; virtual; abstract;
    function _removerPendenciaConciliacaoCartao: Boolean; virtual; abstract;
    procedure abreFormBoletosProtesto;
    procedure abreFormNegativarClienteCredVenc(pTipoForm: Integer; pVerificarConf: Boolean);
    procedure abreFormDocumentosOrigem(pTipoForm: Integer); virtual; abstract;
    function validarRegistrosParaQuitacao(pQuitarParc: boolean = false): boolean;
    function abreFormParcelamentoContas(var pContas: RContas; pAlter: boolean = false): Boolean; virtual; abstract;
    procedure GravarContasPagarTemp(var pContas: RContas; cdsDesp: TClientDataSet); virtual; abstract;
    procedure ApagarContasPagarTemp(cdsDesp: TClientDataSet); virtual; abstract;
    function gerarContas(var pContas: RContas; pAlter: boolean = false): boolean; virtual; abstract;
    function apagarContas: boolean; virtual; abstract;
    function verificarNSUnumAutorizacao(pNSU: string; pNumAut: string; pNumParc: Integer; pCodEmpMult: Integer; pCodCred: Integer): boolean; virtual; abstract;
    function visualizarComprovanteCartao: boolean; virtual; abstract;
    function _atualizarValorLiq: boolean; virtual; abstract;

    procedure dataSetNomeRazaoGetText(Sender: TField; var Text: string; DisplayText: Boolean);

    property Docs: string read FDocs write FDocs;
    property DataSource: TDataSource read FDataSource write FDataSource;
    property DataSource2: TDataSource read FDataSource2 write FDataSource2;
    property buscasCreditoCheque: TIBQuery read FbuscasCreditoCheque write FbuscasCreditoCheque;
    property Buscas2: TIBQuery read FBuscas2 write FBuscas2;
    property Buscas1: TIBQuery read FBuscas1 write FBuscas1;
    property Buscas3: TIBQuery read FBuscas3 write FBuscas3;
    property Sequencial: Boolean read FSequencial write FSequencial;
    property Vale: Boolean read FVale write FVale;
    property DataPrevRec: TDate read FDataPrevRec write FDataPrevRec;
    property DataRealBaixa: TDate read FDataRealBaixa write FDataRealBaixa;
    property QtdeReplicacao: Integer read FQtdeReplicacao write FQtdeReplicacao;
    property DiaReplicacao: Integer read FDiaReplicacao write FDiaReplicacao;
    property ReplVlContReplicacao: Boolean read FReplVlContReplicacao write FReplVlContReplicacao;
    property ReplAltNumQtdeReplicacao: boolean read FReplAltNumQtdeReplicacao write FReplAltNumQtdeReplicacao;
    property ReplNaoAltNumQtdeReplicacao: Boolean read FReplNaoAltNumQtdeReplicacao write FReplNaoAltNumQtdeReplicacao;
    property DescontoValor: Real read FDescontoValor write FDescontoValor;
    property DescontoPercentual: Real read FDescontoPercentual write FDescontoPercentual;
    property DescontoAcrescimo: string read FDescontoAcrescimo write FDescontoAcrescimo;
    property ValorOperacao: Real read FValorOperacao write FValorOperacao;
    property ValorPrevisto: Real read FValorPrevisto write FValorPrevisto;
    property Recebendo: Boolean read FRecebendo write FRecebendo;
    property UsarValorAAtingir: Boolean read fUsarValorAAtingir write fUsarValorAAtingir;

    property QtdeParcelaCartao: Integer read FQtdeParcelaCartao write FQtdeParcelaCartao;
    property NParcelaCartao: Integer read FNParcelaCartao write FNParcelaCartao;

    property CodTermAdmCartao: string read FCodTermAdmCartao write FCodTermAdmCartao;
    property DescTermAdmCartao: string read FDescTermAdmCartao write FDescTermAdmCartao;
    property CodAdmCartao: Integer read FCodAdmCartao write FCodAdmCartao;
    property DescAdmCartao: string read FDescAdmCartao write FDescAdmCartao;
    property CodBandeiraCartao: Integer read FCodBandeiraCartao write FCodBandeiraCartao;
    property DesBandeiraCartao: string read FDesBandeiraCartao write FDesBandeiraCartao;
    property NAutCartao: string read FNAutCartao write FNAutCartao;
    property NDocNsuAdmCartao: string read FNDocNsuAdmCartao write FNDocNsuAdmCartao;
    property NsuRoAdmCartao: string read FNsuRoAdmCartao write FNsuRoAdmCartao;
    property RoAdmCartao: string read FRoAdmCartao write FRoAdmCartao;

    property AdmConfCartao: boolean read FAdmConfCartao write FAdmConfCartao;
    property TerminalConfCartao: boolean read FTerminalConfCartao write FTerminalConfCartao;

    property Table: string read FTable;
    property sql_campos: string read Fsql_campos;
    property sql_inner: string read Fsql_inner;
    property sql_inner_pag: string read Fsql_inner_pag;
  var
    //Objetos
    vPCont: TPContasCAR;
    vCtrl: TControlesCAR;
    vHistPCont: THistPContas;
    vContabanc: TContasBancariasCAR;
    vCl: TClienteCAR;
    vBx: TBaixaCreditos;
    vReceb: TRecebimento; // Objeto usado apenas no recebimento
    vObs : TObs_Cred;  // Objeto usado apenas nos creditos
    vTerminalCartao: TTerminalCartao;
    vBandeiraCartao: TBandeiras_Cartao;
    vPendenciasCartao: TPendenciasCartao;
    vEmpresasUnificadas: TEmpresasUnificadas;
    vDocumentosOrigem: TDocumentosOrigem;

    //Variaveis
    vCons: RConsultaReceber;
    dadosCDL: RCDL;
    dadosRecibo: RRecibo;
    dadosReceber: RRecebimento;
    dadosImpressao: RImpressao;
    vCodEmpMult: Integer;
    vCodigoCtrl: Integer;
    FContas: RContas;
    ultimasql: string;
  end;  

  TControleCheque = class(TContasAReceber)
  private
    procedure _verificaContaBancaria;
    function _quitarRegistrosSelecionados(ATransaction: TIBTransaction = nil): Boolean; override;
    function _documentoRecebidoOuSendoRecebido: Boolean; override;
  public
    destructor Destroy; override;
    constructor create(ATransaction: TIBTransaction = nil);
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;
    function _consulta: boolean; override;
    function _getDataUltimaVenda(pTipoVenda: string; pNumVenda: Integer): string; override;
    function _permitirAlterarDataVencimento: Boolean; override;
    function _dataRecebimentoValida: Boolean; override;
    procedure _efetuarSoma; override;
    procedure _relatorioMatricial; override;
    function _negativaDesnegativaCliente: Boolean; override;
    function _mudarControleOuVoltarParaAtivo: Boolean; override;
    function _detalhesRecebimento: Boolean; override;
    function _modificarDataValorComissao: Boolean; override;
    function _impressaoDeRecibo: Boolean; override;
    function _informarDataPrevRec: Boolean; override;
    function _informarDataRealBaixa: Boolean; override;
    function _informarObservacaoParaCxl(pObs: string = ''; pRegistroAtual: Boolean = False): Boolean; override;
    function _informarObservacoes: Boolean; override;
    function _replicarControleCredito: Boolean; override;
    function _corrigirValor(pSomenteSelecionados: Boolean; pConsDesAcres: Boolean = true; pExibirMensagem: boolean = true): Boolean; override;
    procedure _corrigir; override;
    function _concederAcrescimoDesconto: Boolean; override;
    function _altervalorcorrigido: Boolean; override;
    function _efetuarRecebimento: Boolean; override;
    function _estornarRecebimento: Boolean; override;
    function _visualizarLoteBaixa: Boolean; override;
    function _gerarCarne(pGerarCarne: boolean = true; pUsarValorCorrigido: boolean = false; pExibirMensagemGerarBoleto: boolean = false): Boolean; override;
    function _gerarBoletoCreditos(pCodCreditos: string; pLoteBaixa: Integer): Boolean; override;
    function _VerificaTpControle(vcontr: integer): boolean; override;
    function _baixaCreditosConciliacaoCartao(pLote: Integer; pCartaoCDS: TClientDataSet; pLancarTarifa, pLancarAjuste, pLancarComissao: Boolean; pCodigoUnificada: Integer): Boolean; override;
    function _baixaDevCreditosConciliacaoCartao(pLote: Integer; pCodigoUnificada: Integer; pLancarTarifa, pLancarComissao: Boolean): Boolean; override;
    function _informarDadosTransacaoCartao(pTipo: Integer = 0): Boolean; override;
    function _vicularTransacaoPendente: Boolean; override;
    function _removerPendenciaConciliacaoCartao: Boolean; override;
    function verificarNSUnumAutorizacao(pNSU: string; pNumAut: string; pNumParc: Integer; pCodEmpMult: Integer; pCodCred: Integer): boolean; override;
    function _atualizarValorLiq: boolean; override;
    procedure abreFormDocumentosOrigem(pTipoForm: Integer); override;
  end;

  TControleCredito = class(TContasAReceber)
  private
    function _documentoRecebidoOuSendoRecebido: Boolean; override;
    function _descontoPermitido: Boolean;
    function _quitarRegistrosSelecionados(ATransaction: TIBTransaction = nil): Boolean; override;
    function _replicarCreditosPeloCadastro(var vCOD_CREDITOS: string): Boolean;
  public
    destructor Destroy; override;
    constructor create(ATransaction: TIBTransaction = nil);
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: boolean; override;
    function post: Boolean; override;
    function _consulta: boolean; override;
    function _getDataUltimaVenda(pTipoVenda: string; pNumVenda: Integer): string; override;
    function _permitirAlterarDataVencimento: Boolean; override;
    function _dataRecebimentoValida: Boolean; override;
    procedure _efetuarSoma; override;
    procedure _relatorioMatricial; override;
    function _negativaDesnegativaCliente: Boolean; override;
    function _mudarControleOuVoltarParaAtivo: Boolean; override;
    function _detalhesRecebimento: Boolean; override;
    function _modificarDataValorComissao: Boolean; override;
    function _impressaoDeRecibo: Boolean; override;
    function _informarDataPrevRec: Boolean; override;
    function _informarDataRealBaixa: Boolean; override;
    function _informarObservacaoParaCxl(pObs: string = ''; pRegistroAtual: Boolean = False): Boolean; override;
    function _informarObservacoes: Boolean; override;
    function _replicarControleCredito: Boolean; override;
    function _corrigirValor(pSomenteSelecionados: Boolean; pConsDesAcres: Boolean = true; pExibirMensagem: boolean = true): Boolean; override;
    procedure _corrigir; override;
    function _concederAcrescimoDesconto: Boolean; override;
    function _altervalorcorrigido: Boolean; override;
    function _efetuarRecebimento: Boolean; override;
    function _estornarRecebimento: Boolean; override;
    function _visualizarLoteBaixa: Boolean; override;
    function _gerarCarne(pGerarCarne: boolean = true; pUsarValorCorrigido: boolean = false; pExibirMensagemGerarBoleto: boolean = false): Boolean; override;
    function _gerarBoletoCreditos(pCodCreditosBol: string; pLoteBaixa: Integer): Boolean; override;
    function _Emiterelatorioendiv: boolean; override;
    function _VerificaTpControle(vcontr: integer): boolean; override;
    function _verificadocrecebidoparcial: boolean;

    function _baixaCreditosConciliacaoCartao(pLote: Integer; pCartaoCDS: TClientDataSet; pLancarTarifa, pLancarAjuste, pLancarComissao: Boolean; pCodigoUnificada: Integer): Boolean; override;
    function _baixaDevCreditosConciliacaoCartao(pLote: Integer; pCodigoUnificada: Integer; pLancarTarifa, pLancarComissao: Boolean): Boolean; override;
    function _informarDadosTransacaoCartao(pTipo: Integer = 0): Boolean; override;
    function _vicularTransacaoPendente: Boolean; override;
    function _removerPendenciaConciliacaoCartao: Boolean; override;
    function _validaValoresBaixaCartao: Boolean;
    function abreFormParcelamentoContas(var pContas: RContas; pAlter: boolean = false): Boolean; override;
    procedure GravarContasPagarTemp(var pContas: RContas; cdsDesp: TClientDataSet); override;
    procedure ApagarContasPagarTemp(cdsDesp: TClientDataSet); override;
    function gerarContas(var pContas: RContas; pAlter: boolean = false): boolean; override;
    function apagarContas: boolean; override;
    function verificarNSUnumAutorizacao(pNSU: string; pNumAut: string; pNumParc: Integer; pCodEmpMult: Integer; pCodCred: Integer): boolean; override;
    function visualizarComprovanteCartao: boolean; override;
    function _atualizarValorLiq: boolean; override;
    procedure abreFormDocumentosOrigem(pTipoForm: Integer); override;
  var
    vdepto: TClientDataSet;
  end;

  TBaixaCreditos = class(TContasAReceber)
  private
    fDocs: string;
  public
    constructor create(pDocs: string);
    function _selecionaBaixaCreditos(pCODIGO: Integer; pCOD_EMPRESA: Integer): boolean;
    function _selecionaBaixaCreditosPeloLoteQuit(pLoteQuit: Integer): boolean;
    function _selecionaUltimoBaixaCreditos(pCODIGO: Integer): boolean;
  end;

  TRecebimento = class(TObject)
  public
    destructor Destroy; override;
    constructor create(ATransaction: TIBTransaction = nil);
    //    procedure _setDataSet(pRecebendo:
  var
    /// Objetos usado no recebimento
    ///  Sao usados para poder fazer o recebimento simultaneo tanto em cheque
    ///  como em creditos
    vCh, vCr: TContasAReceber;
    ///  Recibos antecipados
    vRecibo: TRecibosCAR;
  end;

  TCartasCobranca = class(TDataSet_OOP)
  protected
    FdtSetControles, FdtSetModeloCartas: TClientDataSet;
    FdsControles, FdsModeloCartas: TDataSource;
    Fdatainicial, Fdatafinal: Tdate;
    FDiasAtraso, FCodControle, FCodCarta,FDiasEntreCartas: integer;
    FCartasSelec,FControlesSelec,FNomeCidade: string;
    FQtdCartasSelec,FCodCidade: integer;
    FqrAtrasoPagamento,FqrGravarCredAtraso: TIBQuery;
    FtextoCarta: TStringList;
    FPararProcessamento,FInibeItensCartasAfterScroll,FGerarCartasPorCidade:boolean;
  private
    procedure _ItensCartasAfterScroll(DataSet: TDataSet);
  public
    constructor create;
    destructor destroy; override;
    procedure _litaModelosCarta(var pCheckListBox: TCheckListBox; pSetarVariavel: boolean);
    procedure _litaControles(var pCheckListBox: TCheckListBox; pSetarVariavel: boolean);
    procedure _cadItensCartas(TipoForm: integer);
    procedure _marcaDesmarcaLinha;
    procedure _marcaTodasAsLinhas;
    procedure _desmarcaTodasAsLinhas;
    function _visualuzarCartas: boolean;
    function _gerarItensCarta(var pProgressBar: TProgressBar; pLabel: TLabel; pCodigoUnificada: Integer): boolean;
    function _excluirCarta: boolean;
    function _solucionarCartas: boolean;
    function _enviarCartas: boolean;
    function _enviarCartasViaEmail: boolean;
    function _gravarOBSCREDSobreEmailEnviado(pCodCarta:integer): boolean;
    function _listaCreditosCarta: boolean;


    function _EnviarEmail(Dominio, Porta, Usuario, Senha, DeNome, DeEmail, Para,
      Assunto, Corpo: string; CorpoMIME, AnexoMIME: Integer; AutoResposta: Boolean; Anexo: TStringList): Boolean;
    function _EmailTipoMIME(TipoMIME: Integer): string;
    function _ExibirItensEmDebito: boolean;

    property dtSetControles: TClientDataSet read FdtSetControles write FdtSetControles;
//    property dtSetCidades: TClientDataSet read FdtSetCidades write FdtSetCidades;
    property dtSetModeloCartas: TClientDataSet read FdtSetModeloCartas write FdtSetModeloCartas;
    property dsControles: TDataSource read FdsControles write FdsControles;
//	property dsCidades: TDataSource read FdsCidades write FdsCidades;
    property dsModeloCartas: TDataSource read FdsModeloCartas write FdsModeloCartas;
    property datainicial: Tdate read Fdatainicial write Fdatainicial;
    property datafinal: TDate read Fdatafinal write Fdatafinal;
    property vDiasAtraso: integer read FDiasAtraso write FDiasAtraso;
    property vDiasEntreCartas: integer read FDiasEntreCartas write FDiasEntreCartas;
    property vCodControle: integer read FCodControle write FCodControle;
    property vCodCarta: integer read FCodCarta write FCodCarta;
    property vCartasSelec: string read FCartasSelec write FCartasSelec;
    property vControlesSelec: string read FControlesSelec write FControlesSelec;
    property vQtdCartasSelec: integer read FQtdCartasSelec write FQtdCartasSelec;
    property vCodCidade: integer read FCodCidade write FCodCidade;
    property vNomeCidade: string read FNomeCidade write FNomeCidade;
    property qrAtrasoPagamento: TIBQuery read FqrAtrasoPagamento write FqrAtrasoPagamento;
    property qrGravarCredAtraso: TIBQuery read FqrGravarCredAtraso write FqrGravarCredAtraso;
    property vTextoCarta: TStringList read FTextoCarta;
    property vPararProcessamento: boolean read FPararProcessamento write FPararProcessamento;
    property vGerarCartasPorCidade: boolean read FGerarCartasPorCidade write FGerarCartasPorCidade;
    function _abreformSolucao(pCodcarta:integer): boolean;
    function _retirarSolucao: boolean;
    function _solucionar : boolean;
    function _definirWhereAdicional : boolean;
    function _LocalizarCidade : boolean;
  var
    obCredCartas:TCreditosCartas;
    vRConsAd: RConsultaReceber;
    vCondicaoWhereAd :  string;
    _vEnviarEmailCobranca : T_enviarEmailCobranca;
  end;

  TCreditosCartas = class(TDataSet_OOP)
  public
    constructor create;
    destructor destroy; override;
  var
  end;

  TObs_Cred = class(TDataSet_OOP)
  private
    fCOD_OBS: Integer;
    fCodigoUnificada: Integer;
  public
    constructor create;
    function post: Boolean; override;
    function insert: Boolean; override;
    function _selecionaObs(pCOD_OBS, pCodigoUnificada: Integer): Boolean;
    function verificarTabelaCodigo(var pCOD_OBS: Integer): boolean;
  end;

  TPendenciasCartao = class(TDataSet_OOP)
  public
    constructor create;
    function abrePendenciasCartao: Boolean;
  end;

  TNotasRetornoMercadorias = class(TDataSet_OOP)
  private
    fCodCredito: Integer;
  public
    constructor create;
//    procedure NotasRetornoAfterScroll(DataSet: TDataSet);
    function abreFormNotasRetornoMercadorias: Boolean;
    function abreNotasMercadorias(pCodCliente, pCodCred, pCodigoUnificada: Integer): Boolean;
    function removerDaLista: Boolean;
    function marcarMercadoriaParaBaixa(pAutomaticamente: Boolean; pValorCred: Extended): Boolean;
  end;

  TCredNegativarClienteCredVenc = class(TDataSet_OOP)
  private
  public
  	constructor create;
    function abreCredNegativarClienteCredVenc(pCodCliente: Integer; pCpfCnpj: string): Boolean;
  end;

  TCredDesnegativarClienteCredVenc = class(TDataSet_OOP)
  private
  public
  	constructor create;
    function abreCredDesnegativarClienteCredVenc(pCodCliente: Integer; pCpfCnpj: string): Boolean;
  end;

  TCredDesnegativarClienteSemCredVenc = class(TDataSet_OOP)
  private
  public
  	constructor create;
    function abreCredDesnegativarClienteSemCredVenc(pCodCliente: Integer; pCpfCnpj: string): Boolean;
  var
  	vStatus: string;
  end;

  TNegativarClienteCredVenc = class(TDataSet_OOP)
  private
  public
  	constructor create;
    destructor Destroy; override;
    function abreNegativarClienteCredVenc(pCodCliente: Integer; pCpfCnpj: string; pOrdem: string): Boolean;
    procedure _marcaDesmarcaLinha;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    function _negativaCliente: Boolean;
    procedure _CredNegativarClienteCredVencAfterScroll(DataSet: TDataSet);
  var
  	vCredNegativarClienteCredVenc: TCredNegativarClienteCredVenc;
  end;

  TDesnegativarClienteCredVenc = class(TDataSet_OOP)
  private
  public
  	constructor create;
    destructor Destroy; override;
    function abreDesnegativarClienteCredVenc(pCodCliente: Integer; pCpfCnpj: string; pOrdem: string): Boolean;
    procedure _marcaDesmarcaLinha;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    function _desnegativaCliente: Boolean;
    procedure _CredDesnegativarClienteCredVencAfterScroll(DataSet: TDataSet);
  var
  	vCredDesnegativarClienteCredVenc: TCredDesnegativarClienteCredVenc;
  end;

  TDesnegativarClienteSemCredVenc = class(TDataSet_OOP)
  private
  public
  	constructor create;
    destructor Destroy; override;
    function abreDesnegativarClienteSemCredVenc(pCodCliente: Integer; pCpfCnpj: string; pOrdem: string): Boolean;
    procedure _marcaDesmarcaLinha;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    function _desnegativaCliente: Boolean;
    procedure _CredDesnegativarClienteSemCredVencAfterScroll(DataSet: TDataSet);
  var
  	vCredDesnegativarClienteSemCredVenc: TCredDesnegativarClienteSemCredVenc;
  end;

var
  conta: TContasAReceber;
  obCarta: TCartasCobranca;
  vNotasRet: TNotasRetornoMercadorias;
  vNotEnvFinanc: TNotEnvFinanc;

  //  receber: TRecebimento;

implementation

uses
  uDtmContasAReceber, uDtmAtivo, Forms, SysUtils, Windows, uPadrao,
  uCadContasAReceber,
  Variants, Dialogs, DateUtils, URelClDev, UPnivelEndiv, funcoes,
  UCartasCobranca, IdEMailAddress, IdUserPassProvider, IdSASL_CRAM_MD5,
  IdSASLPlain, IdSASLLogin, IdSASLSKey, IdSASLOTP, uEditHw, ShlObj, StrUtils,
  ExtCtrls, Buttons, IBCustomDataSet, hw_utils, config_sistema_class,
  uNotEnvFinanc, Math, uNegativarDesnegativarCliente;

function SendMailByACBr(Host, Port, From, UserName, PassWord, FromName, Subject,
  Body, AttachmentList, AddressList, ReplyToList, CCList, BCCList, Priority: WideString;
  IsHTML, SetSSL, SetTLS, ReadingConfirmation, UseThread, ShowError, OnlyAttachmentByMail: LongBool): WideString; stdcall; external 'hw.nfe.dx.dll'

function gerar_contrapartida(ACamposLanc, AValoresLanc: string; AQtdeCampos: Integer; AUseTransactionIni: Boolean = False): boolean;
var
  AContasAReceber: TContasAReceber;
  ABuscas: TIBQuery;
  I: Integer;
  vTempCampo, vTempValor: string;
begin
  try
    Result := false;
  
    vDadosIni.vContrapartida := true;
    if dtmContasAReceber = nil then
      dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);
    vDadosIni.vPesquisa := 'S2';
    if frmCadContasAReceber = nil then
      frmCadContasAReceber := TfrmCadContasAReceber.Create(frmCadContasAReceber)
    else if not frmCadContasAReceber.Visible then
    	frmCadContasAReceber.Visible := True;

    if AUseTransactionIni then
    	AContasAReceber      := TControleCredito.create(vDadosIni.vTransactionTmp)
    else
    	AContasAReceber      := TControleCredito.create;

    ABuscas := TIBQuery.Create(AContasAReceber.buscas);
    ABuscas.Database := AContasAReceber.buscas.Database;
    if not AUseTransactionIni then
    ABuscas.Transaction := AContasAReceber.buscas.Transaction;
    AContasAReceber.buscas := ABuscas;
    if AUseTransactionIni then
      ABuscas.Transaction                				 		:= vDadosIni.vTransactionTmp;
    AContasAReceber.buscas.Database 								:= AContasAReceber.buscas.Database;
    AContasAReceber.transacao 										  := ABuscas.Transaction;
    AContasAReceber.buscasCreditoCheque.Transaction := ABuscas.Transaction;
    AContasAReceber.buscas.Transaction				    	:= ABuscas.Transaction;

    for I := 1 to AQtdeCampos do
    begin
      vTempCampo := vDadosIni.getCampoPipe(ACamposLanc, I);
      vTempValor := vDadosIni.getCampoPipe(AValoresLanc, I);
      if vTempCampo = 'VALOR_L' then
      begin
         AContasAReceber.dadosReceber.valorOperacao := StrToFloat(vTempValor);
         AContasAReceber.dadosReceber.valorSaida := StrToFloat(vTempValor);
      end
      else if vTempCampo = 'HISTORICO_L' then
      begin
      	AContasAReceber.dadosReceber.historicoSaida := vTempValor;
	      AContasAReceber.dadosReceber.historicoSaidaLancamento := vTempValor;
      end
      else if vTempCampo = 'N_CONTA_PLC' then
      	vDadosIni.vN_CONTA_PLCContrapartida := StrToFloat(vTempValor)
      else if vTempCampo = 'CODIGO_CTRL' then
	      AContasAReceber.dadosReceber.codigoControleSelecionados := StrToInt(vTempValor)
      else if vTempCampo = 'DTREFERENCIA' then
        AContasAReceber.dadosReceber.dataRef := StrToDate(vTempValor)
      else if vTempCampo = 'NDOC_L' then
        AContasAReceber.dadosReceber.numDoc := vTempValor
      else if (vTempCampo = 'COD_EMP_MULT')	and (vDadosIni.vEmp.vFinanceiroUnificado) then
      	AContasAReceber.dadosReceber.codigoUnificada := StrToInt(vTempValor);
    end;
    conta := AContasAReceber;
    Result := AContasAReceber._efetuarRecebimento;
  finally
    AContasAReceber.retornaTransaction;
    vDadosIni.vContrapartida := false;
    frmCadContasAReceber.fechar := True;
    PostMessage(frmCadContasAReceber.Handle, WM_CLOSE, 0, 0)
  end;
end;

function quitar_cheques(ACodCh, ALote: Integer; AUseTransactionIni: Boolean = False): boolean;
var
  AContasAReceber: TContasAReceber;
  ABuscas: TIBQuery;
begin
  try
    Result := false;

    vDadosIni.vPesquisa := 'S1';
    if AUseTransactionIni then
    	AContasAReceber 													      := TControleCheque.create(vDadosIni.vTransactionTmp)
    else
	   AContasAReceber 													      := TControleCheque.create;
    ABuscas 															        	:= TIBQuery.Create(AContasAReceber.buscas);
    ABuscas.Database 													      := AContasAReceber.buscas.Database;
    if not AUseTransactionIni then
	   ABuscas.Transaction												    := AContasAReceber.buscas.Transaction;
    AContasAReceber.buscas 											    := ABuscas;
    if AUseTransactionIni then
      ABuscas.Transaction                				 		:= vDadosIni.vTransactionTmp;
    AContasAReceber.buscas.Database 								:= AContasAReceber.buscas.Database;
    AContasAReceber.transacao 										  := ABuscas.Transaction;
    AContasAReceber.buscasCreditoCheque.Transaction := ABuscas.Transaction;
    AContasAReceber.buscas.Transaction				    	:= ABuscas.Transaction;

    AContasAReceber.montaSelect(' select ' + AContasAReceber.Fsql_campos + ' from controle_cheque ' +
      AContasAReceber.Fsql_inner +
      AContasAReceber.Fsql_inner_pag +
      ' where controle_cheque.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_lote', 'codigo_emp') + ' = ' + vDadosIni.codEmpresa +
      ' and controle_cheque.codigo_ch = ' + IntToStr(ACodCh));

    AContasAReceber.dataSet.Edit;
    AContasAReceber.dataSet.FieldByName('STATUS_CX').AsString := 'R';
    AContasAReceber.dataSet.FieldByName('OP_CX').AsInteger := vDadosIni.vCodUsuario;
    AContasAReceber.dataSet.FieldByName('SEL').AsString := 'S';
    AContasAReceber.dataSet.FieldByName('LOTE').AsInteger := ALote;
    AContasAReceber.dataSet.Post;

    if AContasAReceber.dataSet.ChangeCount > 0 then
    if not AContasAReceber.Apply then
      exit;

    AContasAReceber.dadosReceber.referenteCTP := true;
    if not AContasAReceber._quitarRegistrosSelecionados(ABuscas.Transaction) then
    begin
     if not AUseTransactionIni then
       AContasAReceber.RollBackTransacao;
     Application.MessageBox('Erro ao utilizar cheques para quitar uma conta a pagar' +
       chr(13) + 'Verifique as possíveis causas e tente novamente.', 'Aviso', MB_OK +
       MB_ICONERROR + MB_DEFBUTTON1);
    end
    else if not AUseTransactionIni then
      AContasAReceber.CommitaTransacao;

    AContasAReceber.dataSet.Edit;
    AContasAReceber.dataSet.FieldByName('STATUS_CX').Value := null;
    AContasAReceber.dataSet.FieldByName('OP_CX').Value := null;
    AContasAReceber.dataSet.Post;

    if AContasAReceber.dataSet.ChangeCount > 0 then
    if not AContasAReceber.Apply then
      exit;

    Result := true;
  finally
    AContasAReceber.retornaTransaction;
    AContasAReceber.dadosReceber.referenteCTP 	:= false;
  end;
end;

function quitar_creditos(ACodCred, ALote: Integer; AParcial: boolean; AUseTransactionIni: Boolean = False): boolean;
var
  AContasAReceber: TContasAReceber;
  ABuscas: TIBQuery;
begin
  try
    Result := false;

    vDadosIni.vPesquisa := 'S2';
    if AUseTransactionIni then
    	AContasAReceber 													    := TControleCredito.create(vDadosIni.vTransactionTmp)
    else
	   AContasAReceber 													      := TControleCredito.create;
    ABuscas 	 	  														      := TIBQuery.Create(AContasAReceber.buscas);
    ABuscas.Database 												      	:= AContasAReceber.buscas.Database;
    if not AUseTransactionIni then
    	ABuscas.Transaction												    := AContasAReceber.buscas.Transaction;
    AContasAReceber.buscas 											    := ABuscas;
    if AUseTransactionIni then
      ABuscas.Transaction                						:= vDadosIni.vTransactionTmp;
    AContasAReceber.buscas.Database 								:= AContasAReceber.buscas.Database;
    AContasAReceber.transacao 										  := ABuscas.Transaction;
    AContasAReceber.buscasCreditoCheque.Transaction := ABuscas.Transaction;
    AContasAReceber.buscas.Transaction							:= ABuscas.Transaction;

    AContasAReceber.montaSelect(' select ' + AContasAReceber.Fsql_campos + ' from controle_creditos ' +
      AContasAReceber.Fsql_inner +
      AContasAReceber.Fsql_inner_pag +
      ' where controle_creditos.' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_lote', 'codigo_emp') + ' = ' + vDadosIni.codEmpresa +
      ' and controle_creditos.cod_cred = ' + IntToStr(ACodCred));

    AContasAReceber.dataSet.Edit;
    AContasAReceber.dataSet.FieldByName('SEL').AsString := 'S';
    AContasAReceber.dataSet.FieldByName('STATUS_CX').AsString := 'R';
    AContasAReceber.dataSet.FieldByName('OP_CX').AsInteger := vDadosIni.vCodUsuario;
    AContasAReceber.dataSet.FieldByName('LOTE').AsInteger := ALote;
    AContasAReceber.dataSet.Post;

    if AContasAReceber.dataSet.ChangeCount > 0 then
    if not AContasAReceber.Apply then
      exit;

    if AParcial then
      AContasAReceber.dadosReceber.baixaParcial := true;
    AContasAReceber.dadosReceber.referenteCTP := true;
    if not AContasAReceber._quitarRegistrosSelecionados(ABuscas.Transaction) then
    begin
     if not AUseTransactionIni then
       AContasAReceber.RollBackTransacao;
     Application.MessageBox('Erro ao utilizar créditos para quitar uma conta a pagar' +
       chr(13) + 'Verifique as possíveis causas e tente novamente.', 'Aviso', MB_OK +
       MB_ICONERROR + MB_DEFBUTTON1);
    end
    else if not AUseTransactionIni then
      AContasAReceber.CommitaTransacao;

    AContasAReceber.dataSet.Edit;
    AContasAReceber.dataSet.FieldByName('STATUS_CX').Value := null;
    AContasAReceber.dataSet.FieldByName('OP_CX').Value := null;
    AContasAReceber.dataSet.Post;

    if AContasAReceber.dataSet.ChangeCount > 0 then
    if not AContasAReceber.Apply then
      exit;

    Result := true;
  finally
    AContasAReceber.retornaTransaction;
    AContasAReceber.dadosReceber.baixaParcial 	:= false;
    AContasAReceber.dadosReceber.referenteCTP 	:= false;
  end;
end;

procedure cartas_cobranca_show(Amodal: Boolean);
var
  obCartaTemp: TCartasCobranca;
  Temp: TDataSet_OOP;
begin
  Temp := TDataSet_OOP.Create(dtmAtivo.bancoHw);
  try
    Screen.Cursor := crHourGlass;
    if not vDadosIni.PesqPros('CAR065', 'VISUALIZAR', '', 'ITENS_CARTA', '', Temp.buscas) then
      Exit;

    obCartaTemp._cadItensCartas(0);
  finally
    FreeAndNil(Temp);
    Screen.Cursor := crDefault;
  end;
end;

exports
  gerar_contrapartida, quitar_creditos, quitar_cheques, cartas_cobranca_show;

{ TCredNegativarClienteCredVenc }

function TCredNegativarClienteCredVenc.abreCredNegativarClienteCredVenc(
	pCodCliente: Integer; pCpfCnpj: string): Boolean;
var
	vDataAtual: TDateTime;
begin
	vDataAtual := vDadosIni.getDataBanco(buscas);

  dataSet.Close;
  dataSet.CommandText :=
  	' select cred.* from sp_neg_desneg_cl_cred ' +
    ' (:pcpfcgc, :pcod_cliente, :pcod_empresa, :pfinanc_dia_atual, :pdata_atual, :pdia_financ, :pdata_venc_ini) cred ' +
    ' order by cred.cod_emp_mult ';

  dataSet.Params.ParamByName('pcpfcgc').AsString := pCpfCnpj;
  dataSet.Params.ParamByName('pcod_cliente').AsInteger := pCodCliente;
  dataSet.Params.ParamByName('pcod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  dataSet.Params.ParamByName('pfinanc_dia_atual').AsString := vDadosIni.vCliente.Barramento.vUsarDataAtualDataFinanceiro;
  dataSet.Params.ParamByName('pdata_atual').AsDateTime := vDataAtual;
  dataSet.Params.ParamByName('pdia_financ').AsDateTime := vDadosIni.diaFFinanceiro + 1;
  dataSet.Params.ParamByName('pdata_venc_ini').AsDateTime := StrToDate(vDadosIni.vCliente.Barramento.vDataVencimentoBase);
  dataSet.Open;

  Result := not dataSet.IsEmpty;
end;

constructor TCredNegativarClienteCredVenc.create;
begin
	if dtmContasAReceber = nil then
    dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

  DataSet := TClientDataSet(dtmContasAReceber.cdsCredNegativarCliente);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);

  if not vDadosIni.vEmp.vFinanceiroUnificado then
  	dataSet.FieldByName('COD_EMP_MULT').Tag     := 1;
  if not vDadosIni.vEmp.vFinanceiroUnificado then
  	dataSet.FieldByName('COD_EMP_MULT').Visible := False;
end;

{ TCredDesnegativarClienteCredVenc }

function TCredDesnegativarClienteCredVenc.abreCredDesnegativarClienteCredVenc(
  pCodCliente: Integer; pCpfCnpj: string): Boolean;
var
  vDataAtual: TDateTime;
begin
	vDataAtual := vDadosIni.getDataBanco(buscas);

	dataSet.Close;
  dataSet.CommandText :=
  	' select cred.* from sp_neg_desneg_cl_cred ' +
    ' (:pcpfcgc, :pcod_cliente, :pcod_empresa, :pfinanc_dia_atual, :pdata_atual, :pdia_financ, :pdata_venc_ini) cred ' +
    ' order by cred.cod_emp_mult ';

  dataSet.Params.ParamByName('pcpfcgc').AsString := pCpfCnpj;
  dataSet.Params.ParamByName('pcod_cliente').AsInteger := pCodCliente;
  dataSet.Params.ParamByName('pcod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  dataSet.Params.ParamByName('pfinanc_dia_atual').AsString := vDadosIni.vCliente.Barramento.vUsarDataAtualDataFinanceiro;
  dataSet.Params.ParamByName('pdata_atual').AsDateTime := vDataAtual;
  dataSet.Params.ParamByName('pdia_financ').AsDateTime := vDadosIni.diaFFinanceiro + 1;
  dataSet.Params.ParamByName('pdata_venc_ini').AsDateTime := StrToDate(vDadosIni.vCliente.Barramento.vDataVencimentoBase);
  dataSet.Open;

  Result := not dataSet.IsEmpty;
end;

constructor TCredDesnegativarClienteCredVenc.create;
begin
	if dtmContasAReceber = nil then
    dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

  DataSet := TClientDataSet(dtmContasAReceber.cdsCredDesNegativarCliente);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);

  if not vDadosIni.vEmp.vFinanceiroUnificado then
	  dataSet.FieldByName('COD_EMP_MULT').Tag     := 1;
 	if not vDadosIni.vEmp.vFinanceiroUnificado then
  	dataSet.FieldByName('COD_EMP_MULT').Visible := False;
end;

{ TNegativarClienteCredVenc }

function TNegativarClienteCredVenc.abreNegativarClienteCredVenc(pCodCliente: Integer; pCpfCnpj: string; pOrdem: string): Boolean;
var
	vDataAtual: TDateTime;
begin
	vDataAtual := vDadosIni.getDataBanco(buscas);

  try
  	vDadosIni.abreStatusProcessamento('', 'Aguarde. Consultando cliente(s) NÃO BARRADO(S) com crediário(s) vencido(s)');

    dataSet.Close;
    dataSet.CommandText :=
      ' select * from sp_negativar_desnegativar_cl ' +
      ' (:pcpfcgc, :pcod_cliente, :pcod_empresa, :pbarrado, :pfinanc_dia_atual, :pdata_atual, :pdia_financ, :pdata_venc_ini) ';

    if pOrdem = 'CPF' then
      dataSet.CommandText := dataSet.CommandText + ' order by cpfcgc '
    else if pOrdem = 'RAZAO' then
      dataSet.CommandText := dataSet.CommandText + ' order by razao '
    else
      dataSet.CommandText := dataSet.CommandText + ' order by nome_cliente ';

    dataSet.Params.ParamByName('pcpfcgc').AsString := pCpfCnpj;
    dataSet.Params.ParamByName('pcod_cliente').AsInteger := pCodCliente;
    dataSet.Params.ParamByName('pcod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.Params.ParamByName('pbarrado').AsInteger := 0;
    dataSet.Params.ParamByName('pfinanc_dia_atual').AsString := vDadosIni.vCliente.Barramento.vUsarDataAtualDataFinanceiro;
    dataSet.Params.ParamByName('pdata_atual').AsDateTime := vDataAtual;
    dataSet.Params.ParamByName('pdia_financ').AsDateTime := vDadosIni.diaFFinanceiro + 1;
    dataSet.Params.ParamByName('pdata_venc_ini').AsDateTime := StrToDate(vDadosIni.vCliente.Barramento.vDataVencimentoBase);
    dataSet.Open;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;

  Result := not dataSet.IsEmpty;
end;

constructor TNegativarClienteCredVenc.create;
begin
	if dtmContasAReceber = nil then
    dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

  DataSet := TClientDataSet(dtmContasAReceber.cdsNegativarCliente);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);

  if vDadosIni.vEmp.vFinanceiroUnificado then
  	dataSet.FieldByName('COD_CLIENTE').Tag     := 1;
  if vDadosIni.vEmp.vFinanceiroUnificado then
  	dataSet.FieldByName('COD_CLIENTE').Visible := False;

  vCredNegativarClienteCredVenc := TCredNegativarClienteCredVenc.create;

  DataSet.AfterScroll := nil;
end;

destructor TNegativarClienteCredVenc.Destroy;
begin
  vCredNegativarClienteCredVenc.Free;
  vCredNegativarClienteCredVenc := nil;

  inherited;
end;

procedure TNegativarClienteCredVenc._CredNegativarClienteCredVencAfterScroll(
  DataSet: TDataSet);
begin
	if DataSet.IsEmpty then
  begin
  	vCredNegativarClienteCredVenc.abreCredNegativarClienteCredVenc(
    	-1, '');
    Exit;
  end;

  if (dataSet.FieldByName('COD_CLIENTE').AsInteger <= 0)
  	and (trim(dataSet.FieldByName('CPFCGC').AsString) = '') then
  begin
  	vCredNegativarClienteCredVenc.abreCredNegativarClienteCredVenc(
    	-1, '');
    Exit;
  end;

	vCredNegativarClienteCredVenc.abreCredNegativarClienteCredVenc(
  	dataSet.FieldByName('COD_CLIENTE').AsInteger,
    dataSet.FieldByName('CPFCGC').AsString);
end;

procedure TNegativarClienteCredVenc._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    try
    	dataSet.DisableControls;
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
      dataSet.EnableControls;
    end;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TNegativarClienteCredVenc._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('sel').AsString = 'S' then
    dataSet.FieldByName('sel').AsString := ''
  else
    dataSet.FieldByName('sel').AsString := 'S';
  dataSet.Post;
end;

procedure TNegativarClienteCredVenc._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    try
    	dataSet.DisableControls;
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
      dataSet.EnableControls;
    end;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TNegativarClienteCredVenc._negativaCliente: Boolean;
var
	vcl_hab_faturamento_unico_entre_empresas: Boolean;
  vList: TStrings;
  buscas2: TIBQuery;
begin
	try
  	try
      Result := False;

      buscas2 := TIBQuery.Create(Application);
      buscas2.Database := buscas.Database;
      buscas2.Transaction := buscas.Transaction;

    	vcl_hab_faturamento_unico_entre_empresas := vDadosIni.getConfSisBool('cl_hab_faturamento_unico_entre_empresas', buscas);

      vList := TStringList.Create;
      vList := vDadosIni.getConfSisBlob('cl_hab_faturamento_unico_entre_empresas', buscas);

      Result := False;

      if vDadosIni.vCliente.Barramento.vCodigoBarrado = 0 then
      begin
        Application.MessageBox(
          'Campo "CodigoBarrado" deve ser informado na engrenagem do cadastro do cliente "cl_faturamento_conf"',
          'Atenção', 0 + 64);
        Exit;
      end;

      buscas.Close;
      buscas.SQL.Text := ' select codigo_faturamento, status_f, ativo from tipo_faturamento ' +
        ' where codigo_faturamento = :codigo_faturamento ';
      buscas.ParamByName('codigo_faturamento').AsInteger := vDadosIni.vCliente.Barramento.vCodigoBarrado;
      buscas.Open;

      if buscas.IsEmpty then
      begin
        Application.MessageBox(PChar(
          'Código ' + IntToStr(vDadosIni.vCliente.Barramento.vCodigoBarrado) + ' não encontrado no cadastro de tipo de faturamento'),
          'Atenção', 0 + 64);
        Exit;
      end;

      if UpperCase(trim(buscas.FieldByName('status_f').AsString)) <> 'BARRADO' then
      begin
        Application.MessageBox(PChar(
          'O status do código do tipo de faturamento ' + IntToStr(vDadosIni.vCliente.Barramento.vCodigoBarrado) + ' deve ser BARRADO'),
          'Atenção', 0 + 64);
        Exit;
      end;

      if buscas.FieldByName('ativo').AsInteger <> 1 then
      begin
        Application.MessageBox(PChar(
          'O código do tipo de faturamento  ' + IntToStr(vDadosIni.vCliente.Barramento.vCodigoBarrado) + ' esta na lixeira'),
          'Atenção', 0 + 64);
        Exit;
      end;

      vDadosIni.abreStatusProcessamento('', 'Barrar cliente (Negativar)');

      try
        dataSet.Filter := 'sel = ''S'' ';
        dataSet.Filtered := True;

        if dataSet.IsEmpty then
        begin
          Application.MessageBox(
            'Nenhum cliente selecionado',
            'Atenção', 0 + 64);
          Exit;
        end;

        if not vDadosIni.PesqPros('CLI276', 'BARRAR', '', 'CLIENTES', '', buscas, true) then
          Exit;

        try
        	vDadosIni.abreStatusProcessamento('', 'Barrar cliente(s) (Negativar)');

          dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
            if (dataSet.FieldByName('sel').AsString = 'S')
            	and ((dataSet.FieldByName('cod_cliente').AsInteger > 0) or (trim(dataSet.FieldByName('cpfcgc').AsString) <> '')) then
            begin
            	if UpperCase(trim(dataSet.FieldByName('status_f').AsString)) <> 'BARRADO' then
              begin
                vDadosIni.abreStatusProcessamento('', 'Barrar cliente(s) (Negativar) (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

                if ((vDadosIni.vEmp.vFinanceiroUnificado) and (trim(dataSet.FieldByName('cpfcgc').AsString) <> ''))
                  or ((not vDadosIni.vEmp.vFinanceiroUnificado) and (dataSet.FieldByName('cod_cliente').AsInteger > 0)) then
                begin
                  buscas.Close;
                  buscas.SQL.Text := ' update clientes set rep_int_active = 1, ' +
                    ' codigo_faturamento = ' + IntToStr(vDadosIni.vCliente.Barramento.vCodigoBarrado);

                  if vDadosIni.vEmp.vFinanceiroUnificado then
                    buscas.SQL.Text := buscas.SQL.Text +
                      ' where cpfcgc = ' + QuotedStr(trim(dataSet.FieldByName('cpfcgc').AsString))
                  else
                    buscas.SQL.Text := buscas.SQL.Text +
                      ' where cod_cliente = ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger);

                  if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(vDadosIni.vEmp.vCodigoUnificadas) <> '')  then
                    buscas.SQL.Text := buscas.SQL.Text +
                      ' and cod_empresa in ' + vDadosIni.vEmp.vCodigoUnificadas
                  else
                    buscas.SQL.Text := buscas.SQL.Text +
                      ' and cod_empresa = ' + vDadosIni.codEmpresa;

                  buscas.ExecSQL;
                end;

                if (not vDadosIni.vEmp.vFinanceiroUnificado) and (vcl_hab_faturamento_unico_entre_empresas) then
                begin
                  if trim(dataSet.FieldByName('cpfcgc').AsString) <> '' then
                  begin
                    if vList.Count > 1 then
                    begin
                      vList[2] := StringReplace(UpperCase(vList[2]), 'EMPRESAS:', '', [rfReplaceAll]);

                      buscas.Close;
                      buscas.SQL.Text := ' select cod_empresa from empresa ' +
                        ' where cod_empresa <> :cod_empresa ';
                      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
                      buscas.Open;
                      buscas.FetchAll;

                      buscas.First;
                      while not buscas.Eof do
                      begin
                        if ((Pos('|' + IntToStr(buscas.FieldByName('cod_empresa').AsInteger) + '|', trim(vList[2])) > 0)
                          or (trim(vList[2]) = '')) then
                        begin
                          vDadosIni.abreStatusProcessamento('', 'Replicando para outras empresas');

                          buscas2.Close;
                          buscas2.SQL.Text := ' update clientes set codigo_faturamento = :codigo_faturamento' +
                            ' where cpfcgc = :cpfcgc ' +
                            ' and cod_empresa = :cod_empresa ';
                          buscas2.ParamByName('cpfcgc').AsString := trim(dataSet.FieldByName('cpfcgc').AsString);
                          buscas2.ParamByName('cod_empresa').AsInteger := buscas.FieldByName('cod_empresa').AsInteger;
                          buscas2.ParamByName('codigo_faturamento').AsInteger := vDadosIni.vCliente.Barramento.vCodigoBarrado;
                          buscas2.ExecSQL;
                        end;

                        buscas.Next;
                      end;
                    end;
                  end;
                end;

                vDadosIni.GravaAuditoria(
                  'CLI276',
                  'BARRAR',
                  'Cpf/Cnpj: ' + trim(dataSet.FieldByName('cpfcgc').AsString),
                  'CLIENTES',
                  IntToStr(dataSet.FieldByName('cod_cliente').AsInteger),
                  buscas);
              end;
            end;

            dataSet.Next;
          end;

        finally
          dataSet.First;
          dataSet.EnableControls;
          vDadosIni.fechaStatusProcessamento;
        end;

      finally
        dataSet.Filtered := False;
      end;

      if transacao.InTransaction then
      begin
        transacao.Commit;
        vDadosIni.GravaAuditoria('CLI276', 'BARRAR', 'SUCESSO', 'CLIENTES', '', buscas);
        Result := True;
      end;
    finally
    	if Assigned(vList) then
    		FreeAndNil(vList);
      vDadosIni.fechaStatusProcessamento;
    end;
  except
    on E: exception do
    begin
      Result := False;
      vDadosIni.fechaStatusProcessamento;
      registraErro('function TNegativarClienteCredVenc._negativaCliente. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro na Negativação do cliente. Erro: ' + E.Message), 'Atenção', 0 + 64);
      vDadosIni.GravaAuditoria('CLI276', 'BARRAR', 'FALHA', 'CLIENTES', '', buscas);
    end;
  end;
end;

{ TDesnegativarClienteCredVenc }

function TDesnegativarClienteCredVenc.abreDesnegativarClienteCredVenc(pCodCliente: Integer; pCpfCnpj: string; pOrdem: string): Boolean;
var
	vDataAtual: TDateTime;
begin
	vDataAtual := vDadosIni.getDataBanco(buscas);

  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Consultando cliente(s) BARRADO(S) com crediário(s) vencido(s)');

    dataSet.Close;
    dataSet.CommandText :=
      ' select * from sp_negativar_desnegativar_cl ' +
      ' (:pcpfcgc, :pcod_cliente, :pcod_empresa, :pbarrado, :pfinanc_dia_atual, :pdata_atual, :pdia_financ, :pdata_venc_ini) ';

    if pOrdem = 'CPF' then
      dataSet.CommandText := dataSet.CommandText + ' order by cpfcgc '
    else if pOrdem = 'RAZAO' then
      dataSet.CommandText := dataSet.CommandText + ' order by razao '
    else
      dataSet.CommandText := dataSet.CommandText + ' order by nome_cliente ';

    dataSet.Params.ParamByName('pcpfcgc').AsString := pCpfCnpj;
    dataSet.Params.ParamByName('pcod_cliente').AsInteger := pCodCliente;
    dataSet.Params.ParamByName('pcod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.Params.ParamByName('pbarrado').AsInteger := 1;
    dataSet.Params.ParamByName('pfinanc_dia_atual').AsString := vDadosIni.vCliente.Barramento.vUsarDataAtualDataFinanceiro;
    dataSet.Params.ParamByName('pdata_atual').AsDateTime := vDataAtual;
    dataSet.Params.ParamByName('pdia_financ').AsDateTime := vDadosIni.diaFFinanceiro + 1;
    dataSet.Params.ParamByName('pdata_venc_ini').AsDateTime := StrToDate(vDadosIni.vCliente.Barramento.vDataVencimentoBase);
    dataSet.Open;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;

  Result := not dataSet.IsEmpty;
end;

constructor TDesnegativarClienteCredVenc.create;
var
	Config: TConfig_sistema_class;
begin
	if dtmContasAReceber = nil then
    dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

  DataSet := TClientDataSet(dtmContasAReceber.cdsDesNegativarCliente);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);

  if vDadosIni.vEmp.vFinanceiroUnificado then
  	dataSet.FieldByName('COD_CLIENTE').Tag     := 1;
  if vDadosIni.vEmp.vFinanceiroUnificado then
  	dataSet.FieldByName('COD_CLIENTE').Visible := False;

  vCredDesnegativarClienteCredVenc := TCredDesnegativarClienteCredVenc.create;

  DataSet.AfterScroll := nil;
end;

destructor TDesnegativarClienteCredVenc.Destroy;
begin
	vCredDesnegativarClienteCredVenc.Free;
  vCredDesnegativarClienteCredVenc := nil;

  inherited;
end;

procedure TDesnegativarClienteCredVenc._CredDesnegativarClienteCredVencAfterScroll(
  DataSet: TDataSet);
begin
	if DataSet.IsEmpty then
  begin
  	vCredDesnegativarClienteCredVenc.abreCredDesnegativarClienteCredVenc(
    	-1, '');
    Exit;
  end;

  if (dataSet.FieldByName('COD_CLIENTE').AsInteger <= 0)
  	and (trim(dataSet.FieldByName('CPFCGC').AsString) = '') then
  begin
  	vCredDesnegativarClienteCredVenc.abreCredDesnegativarClienteCredVenc(
    	-1, '');
    Exit;
  end;

	vCredDesnegativarClienteCredVenc.abreCredDesnegativarClienteCredVenc(
    dataSet.FieldByName('COD_CLIENTE').AsInteger,
    dataSet.FieldByName('CPFCGC').AsString);
end;

procedure TDesnegativarClienteCredVenc._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    try
    	dataSet.DisableControls;
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
      dataSet.EnableControls;
    end;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TDesnegativarClienteCredVenc._desnegativaCliente: Boolean;
var
	vcl_hab_faturamento_unico_entre_empresas: Boolean;
  vList: TStrings;
  buscas2: TIBQuery;
begin
	try
  	try
      Result := False;

      buscas2 := TIBQuery.Create(Application);
      buscas2.Database := buscas.Database;
      buscas2.Transaction := buscas.Transaction;

    	vcl_hab_faturamento_unico_entre_empresas := vDadosIni.getConfSisBool('cl_hab_faturamento_unico_entre_empresas', buscas);

      vList := TStringList.Create;
      vList := vDadosIni.getConfSisBlob('cl_hab_faturamento_unico_entre_empresas', buscas);

      if vDadosIni.vCliente.Barramento.vCodigoDesbarrado = 0 then
      begin
        Application.MessageBox(
          'Campo "CodigoDesbarrado" deve ser informado na engrenagem do cadastro do cliente "cl_faturamento_conf"',
          'Atenção', 0 + 64);
        Exit;
      end;

      buscas.Close;
      buscas.SQL.Text := ' select codigo_faturamento, status_f, ativo from tipo_faturamento ' +
        ' where codigo_faturamento = :codigo_faturamento ';
      buscas.ParamByName('codigo_faturamento').AsInteger := vDadosIni.vCliente.Barramento.vCodigoDesbarrado;
      buscas.Open;

      if buscas.IsEmpty then
      begin
        Application.MessageBox(PChar(
          'Código ' + IntToStr(vDadosIni.vCliente.Barramento.vCodigoDesbarrado) + ' não encontrado no cadastro de tipo de faturamento'),
          'Atenção', 0 + 64);
        Exit;
      end;

      if UpperCase(trim(buscas.FieldByName('status_f').AsString)) <> 'ATIVO' then
      begin
        Application.MessageBox(PChar(
          'O status do código do tipo de faturamento ' + IntToStr(vDadosIni.vCliente.Barramento.vCodigoDesbarrado) + ' deve ser ATIVO'),
          'Atenção', 0 + 64);
        Exit;
      end;

      if buscas.FieldByName('ativo').AsInteger <> 1 then
      begin
        Application.MessageBox(PChar(
          'O código do tipo de faturamento  ' + IntToStr(vDadosIni.vCliente.Barramento.vCodigoDesbarrado) + ' esta na lixeira'),
          'Atenção', 0 + 64);
        Exit;
      end;

      vDadosIni.abreStatusProcessamento('', 'Desbarrar cliente (Remover Negativação)');

      try
        dataSet.Filter := 'sel = ''S'' ';
        dataSet.Filtered := True;

        if dataSet.IsEmpty then
        begin
          Application.MessageBox(
            'Nenhum cliente selecionado',
            'Atenção', 0 + 64);
          Exit;
        end;

        if not vDadosIni.PesqPros('CLI277', 'DESBARRAR', '', 'CLIENTES', '', buscas, true) then
          Exit;

        try
        	vDadosIni.abreStatusProcessamento('', 'Desbarrar cliente(s) (Remover Negativação)');

          dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
            if (dataSet.FieldByName('sel').AsString = 'S')
            	and ((dataSet.FieldByName('cod_cliente').AsInteger > 0) or (trim(dataSet.FieldByName('cpfcgc').AsString) <> '')) then
            begin
            	if UpperCase(trim(dataSet.FieldByName('status_f').AsString)) = 'BARRADO' then
              begin
                vDadosIni.abreStatusProcessamento('', 'Desbarrar cliente(s) (Remover Negativação) (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

                if ((vDadosIni.vEmp.vFinanceiroUnificado) and (trim(dataSet.FieldByName('cpfcgc').AsString) <> ''))
                  or ((not vDadosIni.vEmp.vFinanceiroUnificado) and (dataSet.FieldByName('cod_cliente').AsInteger > 0)) then
                begin
                  buscas.Close;
                  buscas.SQL.Text := ' update clientes set rep_int_active = 1, ' +
                    ' codigo_faturamento = ' + IntToStr(vDadosIni.vCliente.Barramento.vCodigoDesbarrado);

                  if vDadosIni.vEmp.vFinanceiroUnificado then
                    buscas.SQL.Text := buscas.SQL.Text +
                      ' where cpfcgc = ' + QuotedStr(trim(dataSet.FieldByName('cpfcgc').AsString))
                  else
                    buscas.SQL.Text := buscas.SQL.Text +
                      ' where cod_cliente = ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger);

                  if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(vDadosIni.vEmp.vCodigoUnificadas) <> '')  then
                    buscas.SQL.Text := buscas.SQL.Text +
                      ' and cod_empresa in ' + vDadosIni.vEmp.vCodigoUnificadas
                  else
                    buscas.SQL.Text := buscas.SQL.Text +
                      ' and cod_empresa = ' + vDadosIni.codEmpresa;

                  buscas.ExecSQL;
                end;

                if (not vDadosIni.vEmp.vFinanceiroUnificado) and (vcl_hab_faturamento_unico_entre_empresas) then
                begin
                  if trim(dataSet.FieldByName('cpfcgc').AsString) <> '' then
                  begin
                    if vList.Count > 1 then
                    begin
                      vList[2] := StringReplace(UpperCase(vList[2]), 'EMPRESAS:', '', [rfReplaceAll]);

                      buscas.Close;
                      buscas.SQL.Text := ' select cod_empresa from empresa ' +
                        ' where cod_empresa <> :cod_empresa ';
                      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
                      buscas.Open;
                      buscas.FetchAll;

                      buscas.First;
                      while not buscas.Eof do
                      begin
                        if ((Pos('|' + IntToStr(buscas.FieldByName('cod_empresa').AsInteger) + '|', trim(vList[2])) > 0)
                          or (trim(vList[2]) = '')) then
                        begin
                          vDadosIni.abreStatusProcessamento('', 'Replicando para outras empresas');

                          buscas2.Close;
                          buscas2.SQL.Text := ' update clientes set codigo_faturamento = :codigo_faturamento' +
                            ' where cpfcgc = :cpfcgc ' +
                            ' and cod_empresa = :cod_empresa ';
                          buscas2.ParamByName('cpfcgc').AsString := trim(dataSet.FieldByName('cpfcgc').AsString);
                          buscas2.ParamByName('cod_empresa').AsInteger := buscas.FieldByName('cod_empresa').AsInteger;
                          buscas2.ParamByName('codigo_faturamento').AsInteger := vDadosIni.vCliente.Barramento.vCodigoDesbarrado;
                          buscas2.ExecSQL;
                        end;

                        buscas.Next;
                      end;
                    end;
                  end;
                end;

                vDadosIni.GravaAuditoria(
                  'CLI277',
                  'DESBARRAR',
                  'Cpf/Cnpj: ' + trim(dataSet.FieldByName('cpfcgc').AsString),
                  'CLIENTES',
                  IntToStr(dataSet.FieldByName('cod_cliente').AsInteger),
                  buscas);
              end;
            end;

            dataSet.Next;
          end;

        finally
          dataSet.First;
          dataSet.EnableControls;
          vDadosIni.fechaStatusProcessamento;
        end;

      finally
        dataSet.Filtered := False;
      end;

      if transacao.InTransaction then
      begin
        transacao.Commit;
        vDadosIni.GravaAuditoria('CLI277', 'DESBARRAR', 'SUCESSO', 'CLIENTES', '', buscas);
        Result := True;
      end;
    finally
    	if Assigned(vList) then
    		FreeAndNil(vList);
      vDadosIni.fechaStatusProcessamento;
    end;
  except
    on E: exception do
    begin
      Result := False;
      vDadosIni.fechaStatusProcessamento;
      registraErro('function TNegativarClienteCredVenc._desnegativaCliente. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro na Desnegativação do cliente. Erro: ' + E.Message), 'Atenção', 0 + 64);
      vDadosIni.GravaAuditoria('CLI277', 'DESBARRAR', 'FALHA', 'CLIENTES', '', buscas);
    end;
  end;
end;

procedure TDesnegativarClienteCredVenc._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('sel').AsString = 'S' then
    dataSet.FieldByName('sel').AsString := ''
  else
    dataSet.FieldByName('sel').AsString := 'S';
  dataSet.Post;
end;

procedure TDesnegativarClienteCredVenc._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    try
    	dataSet.DisableControls;
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
      dataSet.EnableControls;
    end;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TCredDesnegativarClienteSemCredVenc }

function TCredDesnegativarClienteSemCredVenc.abreCredDesnegativarClienteSemCredVenc(
  pCodCliente: Integer; pCpfCnpj: string): Boolean;
var
  vDataAtual: TDateTime;
begin
	vDataAtual := vDadosIni.getDataBanco(buscas);

	dataSet.Close;
  dataSet.CommandText :=
  	' select cred.* from sp_desneg_cl_cred ' +
    ' (:pcpfcgc, :pcod_cliente, :pcod_empresa, :pstatus, :pfinanc_dia_atual, :pdata_atual, :pdia_financ, :pdata_venc_ini) cred ' +
    ' order by cred.cod_emp_mult ';

  dataSet.Params.ParamByName('pcpfcgc').AsString := pCpfCnpj;
  dataSet.Params.ParamByName('pcod_cliente').AsInteger := pCodCliente;
  dataSet.Params.ParamByName('pcod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  dataSet.Params.ParamByName('pstatus').AsString := vStatus;
  dataSet.Params.ParamByName('pfinanc_dia_atual').AsString := vDadosIni.vCliente.Barramento.vUsarDataAtualDataFinanceiro;
  dataSet.Params.ParamByName('pdata_atual').AsDateTime := vDataAtual;
  dataSet.Params.ParamByName('pdia_financ').AsDateTime := vDadosIni.diaFFinanceiro + 1;
  dataSet.Params.ParamByName('pdata_venc_ini').AsDateTime := StrToDate(vDadosIni.vCliente.Barramento.vDataVencimentoBase);
  dataSet.Open;

  Result := not dataSet.IsEmpty;
end;

constructor TCredDesnegativarClienteSemCredVenc.create;
begin
	if dtmContasAReceber = nil then
    dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

  DataSet := TClientDataSet(dtmContasAReceber.cdsCredDesNegativarCliente2);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);

  if not vDadosIni.vEmp.vFinanceiroUnificado then
  	dataSet.FieldByName('COD_EMP_MULT').Tag     := 1;
  if not vDadosIni.vEmp.vFinanceiroUnificado then
  	dataSet.FieldByName('COD_EMP_MULT').Visible := False;
end;

{ TDesnegativarClienteSemCredVenc }

function TDesnegativarClienteSemCredVenc.abreDesnegativarClienteSemCredVenc(pCodCliente: Integer; pCpfCnpj: string; pOrdem: string): Boolean;
var
	vDataAtual: TDateTime;
begin
	vDataAtual := vDadosIni.getDataBanco(buscas);

  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Consultando cliente(s) BARRADO(S) sem crediário(s) vencido(s)');

    dataSet.Close;
    dataSet.CommandText :=
      ' select * from sp_desnegativar_cl ' +
      ' (:pcpfcgc, :pcod_cliente, :pcod_empresa, :pfinanc_dia_atual, :pdata_atual, :pdia_financ, :pdata_venc_ini) ';

    if pOrdem = 'CPF' then
      dataSet.CommandText := dataSet.CommandText + ' order by cpfcgc '
    else if pOrdem = 'RAZAO' then
      dataSet.CommandText := dataSet.CommandText + ' order by razao '
    else
      dataSet.CommandText := dataSet.CommandText + ' order by nome_cliente ';

    dataSet.Params.ParamByName('pcpfcgc').AsString := pCpfCnpj;
    dataSet.Params.ParamByName('pcod_cliente').AsInteger := pCodCliente;
    dataSet.Params.ParamByName('pcod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.Params.ParamByName('pfinanc_dia_atual').AsString := vDadosIni.vCliente.Barramento.vUsarDataAtualDataFinanceiro;
    dataSet.Params.ParamByName('pdata_atual').AsDateTime := vDataAtual;
    dataSet.Params.ParamByName('pdia_financ').AsDateTime := vDadosIni.diaFFinanceiro + 1;
    dataSet.Params.ParamByName('pdata_venc_ini').AsDateTime := StrToDate(vDadosIni.vCliente.Barramento.vDataVencimentoBase);
    dataSet.Open;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;

  Result := not dataSet.IsEmpty;
end;

constructor TDesnegativarClienteSemCredVenc.create;
begin
	if dtmContasAReceber = nil then
    dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

  DataSet := TClientDataSet(dtmContasAReceber.cdsDesNegativarCliente2);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);

  if vDadosIni.vEmp.vFinanceiroUnificado then
  	dataSet.FieldByName('COD_CLIENTE').Tag     := 1;
  if vDadosIni.vEmp.vFinanceiroUnificado then
  	dataSet.FieldByName('COD_CLIENTE').Visible := False;

  vCredDesnegativarClienteSemCredVenc := TCredDesnegativarClienteSemCredVenc.create;

  DataSet.AfterScroll := nil;
end;

destructor TDesnegativarClienteSemCredVenc.Destroy;
begin
	vCredDesnegativarClienteSemCredVenc.Free;
  vCredDesnegativarClienteSemCredVenc := nil;

  inherited;
end;

procedure TDesnegativarClienteSemCredVenc._CredDesnegativarClienteSemCredVencAfterScroll(
  DataSet: TDataSet);
begin
	if DataSet.IsEmpty then
  begin
  	vCredDesnegativarClienteSemCredVenc.abreCredDesnegativarClienteSemCredVenc(
    	-1, '');
    Exit;
  end;

  if (dataSet.FieldByName('COD_CLIENTE').AsInteger <= 0)
  	and (trim(dataSet.FieldByName('CPFCGC').AsString) = '') then
  begin
  	vCredDesnegativarClienteSemCredVenc.abreCredDesnegativarClienteSemCredVenc(
    	-1, '');
    Exit;
  end;

	vCredDesnegativarClienteSemCredVenc.abreCredDesnegativarClienteSemCredVenc(
    dataSet.FieldByName('COD_CLIENTE').AsInteger,
    dataSet.FieldByName('CPFCGC').AsString);
end;

procedure TDesnegativarClienteSemCredVenc._desmarcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    try
    	dataSet.DisableControls;
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
      dataSet.EnableControls;
    end;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TDesnegativarClienteSemCredVenc._desnegativaCliente: Boolean;
var
	vcl_hab_faturamento_unico_entre_empresas: Boolean;
  vList: TStrings;
  buscas2: TIBQuery;
begin
	try
  	try
      Result := False;

      buscas2 := TIBQuery.Create(Application);
      buscas2.Database := buscas.Database;
      buscas2.Transaction := buscas.Transaction;

    	vcl_hab_faturamento_unico_entre_empresas := vDadosIni.getConfSisBool('cl_hab_faturamento_unico_entre_empresas', buscas);

      vList := TStringList.Create;
      vList := vDadosIni.getConfSisBlob('cl_hab_faturamento_unico_entre_empresas', buscas);

      if vDadosIni.vCliente.Barramento.vCodigoDesbarrado = 0 then
      begin
        Application.MessageBox(
          'Campo "CodigoDesbarrado" deve ser informado na engrenagem do cadastro do cliente "cl_faturamento_conf"',
          'Atenção', 0 + 64);
        Exit;
      end;

      buscas.Close;
      buscas.SQL.Text := ' select codigo_faturamento, status_f, ativo from tipo_faturamento ' +
        ' where codigo_faturamento = :codigo_faturamento ';
      buscas.ParamByName('codigo_faturamento').AsInteger := vDadosIni.vCliente.Barramento.vCodigoDesbarrado;
      buscas.Open;

      if buscas.IsEmpty then
      begin
        Application.MessageBox(PChar(
          'Código ' + IntToStr(vDadosIni.vCliente.Barramento.vCodigoDesbarrado) + ' não encontrado no cadastro de tipo de faturamento'),
          'Atenção', 0 + 64);
        Exit;
      end;

      if UpperCase(trim(buscas.FieldByName('status_f').AsString)) <> 'ATIVO' then
      begin
        Application.MessageBox(PChar(
          'O status do código do tipo de faturamento ' + IntToStr(vDadosIni.vCliente.Barramento.vCodigoDesbarrado) + ' deve ser ATIVO'),
          'Atenção', 0 + 64);
        Exit;
      end;

      if buscas.FieldByName('ativo').AsInteger <> 1 then
      begin
        Application.MessageBox(PChar(
          'O código do tipo de faturamento  ' + IntToStr(vDadosIni.vCliente.Barramento.vCodigoDesbarrado) + ' esta na lixeira'),
          'Atenção', 0 + 64);
        Exit;
      end;

      vDadosIni.abreStatusProcessamento('', 'Desbarrar cliente (Remover Negativação)');

      try
        dataSet.Filter := 'sel = ''S'' ';
        dataSet.Filtered := True;

        if dataSet.IsEmpty then
        begin
          Application.MessageBox(
            'Nenhum cliente selecionado',
            'Atenção', 0 + 64);
          Exit;
        end;

        if not vDadosIni.PesqPros('CLI277', 'DESBARRAR', '', 'CLIENTES', '', buscas, true) then
          Exit;

        try
        	vDadosIni.abreStatusProcessamento('', 'Desbarrar cliente(s) (Remover Negativação)');

          dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
            if (dataSet.FieldByName('sel').AsString = 'S')
            	and ((dataSet.FieldByName('cod_cliente').AsInteger > 0) or (trim(dataSet.FieldByName('cpfcgc').AsString) <> '')) then
            begin
            	if UpperCase(trim(dataSet.FieldByName('status_f').AsString)) = 'BARRADO' then
              begin
                vDadosIni.abreStatusProcessamento('', 'Desbarrar cliente(s) (Remover Negativação) (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

                if ((vDadosIni.vEmp.vFinanceiroUnificado) and (trim(dataSet.FieldByName('cpfcgc').AsString) <> ''))
                  or ((not vDadosIni.vEmp.vFinanceiroUnificado) and (dataSet.FieldByName('cod_cliente').AsInteger > 0)) then
                begin
                  buscas.Close;
                  buscas.SQL.Text := ' update clientes set rep_int_active = 1, ' +
                    ' codigo_faturamento = ' + IntToStr(vDadosIni.vCliente.Barramento.vCodigoDesbarrado);

                  if vDadosIni.vEmp.vFinanceiroUnificado then
                    buscas.SQL.Text := buscas.SQL.Text +
                      ' where cpfcgc = ' + QuotedStr(trim(dataSet.FieldByName('cpfcgc').AsString))
                  else
                    buscas.SQL.Text := buscas.SQL.Text +
                      ' where cod_cliente = ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger);

                  if (vDadosIni.vEmp.vFinanceiroUnificado) and (trim(vDadosIni.vEmp.vCodigoUnificadas) <> '')  then
                    buscas.SQL.Text := buscas.SQL.Text +
                      ' and cod_empresa in ' + vDadosIni.vEmp.vCodigoUnificadas
                  else
                    buscas.SQL.Text := buscas.SQL.Text +
                      ' and cod_empresa = ' + vDadosIni.codEmpresa;

                  buscas.ExecSQL;
                end;

                if (not vDadosIni.vEmp.vFinanceiroUnificado) and (vcl_hab_faturamento_unico_entre_empresas) then
                begin
                  if trim(dataSet.FieldByName('cpfcgc').AsString) <> '' then
                  begin
                    if vList.Count > 1 then
                    begin
                      vList[2] := StringReplace(UpperCase(vList[2]), 'EMPRESAS:', '', [rfReplaceAll]);

                      buscas.Close;
                      buscas.SQL.Text := ' select cod_empresa from empresa ' +
                        ' where cod_empresa <> :cod_empresa ';
                      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
                      buscas.Open;
                      buscas.FetchAll;

                      buscas.First;
                      while not buscas.Eof do
                      begin
                        if ((Pos('|' + IntToStr(buscas.FieldByName('cod_empresa').AsInteger) + '|', trim(vList[2])) > 0)
                          or (trim(vList[2]) = '')) then
                        begin
                          vDadosIni.abreStatusProcessamento('', 'Replicando para outras empresas');

                          buscas2.Close;
                          buscas2.SQL.Text := ' update clientes set codigo_faturamento = :codigo_faturamento' +
                            ' where cpfcgc = :cpfcgc ' +
                            ' and cod_empresa = :cod_empresa ';
                          buscas2.ParamByName('cpfcgc').AsString := trim(dataSet.FieldByName('cpfcgc').AsString);
                          buscas2.ParamByName('cod_empresa').AsInteger := buscas.FieldByName('cod_empresa').AsInteger;
                          buscas2.ParamByName('codigo_faturamento').AsInteger := vDadosIni.vCliente.Barramento.vCodigoDesbarrado;
                          buscas2.ExecSQL;
                        end;

                        buscas.Next;
                      end;
                    end;
                  end;
                end;

                vDadosIni.GravaAuditoria(
                  'CLI277',
                  'DESBARRAR',
                  'Cpf/Cnpj: ' + trim(dataSet.FieldByName('cpfcgc').AsString),
                  'CLIENTES',
                  IntToStr(dataSet.FieldByName('cod_cliente').AsInteger),
                  buscas);
              end;
            end;

            dataSet.Next;
          end;

        finally
          dataSet.First;
          dataSet.EnableControls;
          vDadosIni.fechaStatusProcessamento;
        end;

      finally
        dataSet.Filtered := False;
      end;

      if transacao.InTransaction then
      begin
        transacao.Commit;
        vDadosIni.GravaAuditoria('CLI277', 'DESBARRAR', 'SUCESSO', 'CLIENTES', '', buscas);
        Result := True;
      end;
    finally
    	if Assigned(vList) then
    		FreeAndNil(vList);
      vDadosIni.fechaStatusProcessamento;
    end;
  except
    on E: exception do
    begin
      Result := False;
      vDadosIni.fechaStatusProcessamento;
      registraErro('function TDesnegativarClienteSemCredVenc._desnegativaCliente. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro na Desnegativação do cliente. Erro: ' + E.Message), 'Atenção', 0 + 64);
      vDadosIni.GravaAuditoria('CLI277', 'DESBARRAR', 'FALHA', 'CLIENTES', '', buscas);
    end;
  end;
end;

procedure TDesnegativarClienteSemCredVenc._marcaDesmarcaLinha;
begin
	if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('sel').AsString = 'S' then
    dataSet.FieldByName('sel').AsString := ''
  else
    dataSet.FieldByName('sel').AsString := 'S';
  dataSet.Post;
end;

procedure TDesnegativarClienteSemCredVenc._marcarTodos;
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    try
    	dataSet.DisableControls;
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
      dataSet.EnableControls;
    end;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TNotEnvFinanc }

function TNotEnvFinanc.abreNotEnvFinanc: boolean;
begin
	Result := montaSelect(' select NOTIFICACAO_CREDITOS.*, ' +
  	' CONTROLE_CREDITOS.N_DOC_C, CONTROLE_CREDITOS.DATA_REC_C, CONTROLE_CREDITOS.DATA_VENC_C, ' +
  	' CONTROLE_CREDITOS.VALOR_C, CONTROLE_CREDITOS.VALOR_CORR, CONTROLE_CREDITOS.STATUS_C, ' +
    ' CONTROLE_CREDITOS.DATQ_C, CONTROLE_CREDITOS.TIPO_DOC_C, ' +
    ' CONTROLE_CREDITOS.CODIGO_CTRL, CONTROLES.NOME_CTRL, CONTROLE_CREDITOS.NOSSO_NUMERO_BANCO, ' +
    ' CONTROLE_CREDITOS.NPARCELA, CONTROLE_CREDITOS.QTDE_PARC, ' +
    ' MSG_APLICATIVO.APLICATIVO, MSG_PLATAFORMA.PLATAFORMA, ' +
    ' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CPFCGC ' +
    ' from NOTIFICACAO_CREDITOS ' +
    ' INNER JOIN MSG_APLICATIVO ON ' +
    '			MSG_APLICATIVO.ID = NOTIFICACAO_CREDITOS.ID_MSG_APLICATIVO ' +
    ' INNER JOIN MSG_PLATAFORMA ON '  +
    '			MSG_PLATAFORMA.ID = NOTIFICACAO_CREDITOS.ID_MSG_PLATAFORMA ' +
    '			AND MSG_PLATAFORMA.COD_EMPRESA = NOTIFICACAO_CREDITOS.COD_EMPRESA ' +
    ' INNER JOIN CONTROLE_CREDITOS ON ' +
    '	    CONTROLE_CREDITOS.COD_CRED = NOTIFICACAO_CREDITOS.COD_CRED ' +
    '     AND CONTROLE_CREDITOS.CODIGO_EMP = NOTIFICACAO_CREDITOS.COD_EMPRESA ' +
    '     AND CONTROLE_CREDITOS.COD_EMP_MULT = NOTIFICACAO_CREDITOS.COD_EMP_MULT ' +
    ' INNER JOIN CLIENTES ON ' +
    '     CLIENTES.COD_CLIENTE = NOTIFICACAO_CREDITOS.COD_CLIENTE ' +
    '     AND CLIENTES.COD_EMPRESA = NOTIFICACAO_CREDITOS.COD_EMP_MULT ' +
    ' INNER JOIN CONTROLES ON ' +
    '     CONTROLES.CODIGO_CTRL = CONTROLE_CREDITOS.CODIGO_CTRL ' +
    '     AND CONTROLES.CODIGO_EMP = CONTROLE_CREDITOS.CODIGO_EMP ' +
  	' WHERE NOTIFICACAO_CREDITOS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND NOTIFICACAO_CREDITOS.ATIVO = 1');
end;

function TNotEnvFinanc.abreNotEnvFinanc(pCodigo: Integer; pCodEmpMult: Integer): boolean;
begin
	Result := montaSelect(' select NOTIFICACAO_CREDITOS.*, ' +
  	' CONTROLE_CREDITOS.N_DOC_C, CONTROLE_CREDITOS.DATA_REC_C, CONTROLE_CREDITOS.DATA_VENC_C, ' +
  	' CONTROLE_CREDITOS.VALOR_C, CONTROLE_CREDITOS.VALOR_CORR, CONTROLE_CREDITOS.STATUS_C, ' +
    ' CONTROLE_CREDITOS.DATQ_C, CONTROLE_CREDITOS.TIPO_DOC_C, ' +
    ' CONTROLE_CREDITOS.CODIGO_CTRL, CONTROLES.NOME_CTRL, CONTROLE_CREDITOS.NOSSO_NUMERO_BANCO, ' +
    ' CONTROLE_CREDITOS.NPARCELA, CONTROLE_CREDITOS.QTDE_PARC, ' +
    '	MSG_APLICATIVO.APLICATIVO, MSG_PLATAFORMA.PLATAFORMA, ' +
    ' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CPFCGC ' +
    ' from NOTIFICACAO_CREDITOS ' +
    ' INNER JOIN MSG_APLICATIVO ON ' +
    '			MSG_APLICATIVO.ID = NOTIFICACAO_CREDITOS.ID_MSG_APLICATIVO ' +
    ' INNER JOIN MSG_PLATAFORMA ON '  +
    '			MSG_PLATAFORMA.ID = NOTIFICACAO_CREDITOS.ID_MSG_PLATAFORMA ' +
    '			AND MSG_PLATAFORMA.COD_EMPRESA = NOTIFICACAO_CREDITOS.COD_EMPRESA ' +
    ' INNER JOIN CONTROLE_CREDITOS ON ' +
    '	    CONTROLE_CREDITOS.COD_CRED = NOTIFICACAO_CREDITOS.COD_CRED ' +
    '     AND CONTROLE_CREDITOS.CODIGO_EMP = NOTIFICACAO_CREDITOS.COD_EMPRESA ' +
    '     AND CONTROLE_CREDITOS.COD_EMP_MULT = NOTIFICACAO_CREDITOS.COD_EMP_MULT ' +
    ' INNER JOIN CLIENTES ON ' +
    '     CLIENTES.COD_CLIENTE = NOTIFICACAO_CREDITOS.COD_CLIENTE ' +
    '     AND CLIENTES.COD_EMPRESA = NOTIFICACAO_CREDITOS.COD_EMP_MULT ' +
    ' INNER JOIN CONTROLES ON ' +
    '     CONTROLES.CODIGO_CTRL = CONTROLE_CREDITOS.CODIGO_CTRL ' +
    '     AND CONTROLES.CODIGO_EMP = CONTROLE_CREDITOS.CODIGO_EMP ' +
  	' WHERE NOTIFICACAO_CREDITOS.CODIGO = ' + IntToStr(pCodigo) +
    ' AND NOTIFICACAO_CREDITOS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND NOTIFICACAO_CREDITOS.COD_EMP_MULT = ' + IntToStr(pCodEmpMult));
end;

constructor TNotEnvFinanc.create;
begin
	DataSet := TClientDataSet(dtmContasAReceber.cdsEnvNotFinanc);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);

  vDoc := TDocEletronicoNotEnvFinanc.create;
end;

destructor TNotEnvFinanc.Destroy;
begin
	vDoc.Free;
  vDoc := nil;

  inherited;
end;

function TNotEnvFinanc.lerDadosApiMensagem: Boolean;
begin
	try
    Result := False;

    if dataSet.IsEmpty then
      Exit;

    if frmNotEnvFinanc.PageControl4.ActivePage = frmNotEnvFinanc.TabSheet_Cad_Mensageria then
    	vDoc.abreDocEletronicoMensMobile(
      	dataSet.FieldByName('CODIGO').AsInteger,
      	'HWC_NOT_FIN_P_')
    else if frmNotEnvFinanc.PageControl4.ActivePage = frmNotEnvFinanc.TabSheet_Cad_Mensageria then
    	vDoc.abreDocEletronicoMensMobile(
      	dataSet.FieldByName('CODIGO').AsInteger,
      	'HWC_NOT_FIN_G_')
    else if frmNotEnvFinanc.PageControl4.ActivePage = frmNotEnvFinanc.TabSheet_Cad_Mensageria then
    	vDoc.abreDocEletronicoMensMobile(
      	dataSet.FieldByName('CODIGO').AsInteger,
      	'HWC_NOT_FIN_U_');

    Result := vDadosIni.abreForm('Dados API', frmNotEnvFinanc.pnDadosAPI, [ofEscapeExit, ofAlignAllClientWinCtrl]);
  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

procedure TNotEnvFinanc._abrirNotEnvFinanc(pTipoForm: Integer);
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Abrindo notificações enviadas pelo financeiro');
    if dtmContasAReceber = nil then
      dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('CAR102', 'ABRIR', '', 'NOTIFICACAO_CREDITOS', '',
      dtmContasAReceber.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmNotEnvFinanc = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmNotEnvFinanc, frmNotEnvFinanc);
    end;

    if (pTipoForm > 0) and (not frmNotEnvFinanc.Visible) then
      frmNotEnvFinanc.ShowModal
    else if (not frmNotEnvFinanc.Visible) then
      frmNotEnvFinanc.Show
    else if frmNotEnvFinanc.FormStyle = fsMDIChild then
      frmNotEnvFinanc.Show
    else
      frmNotEnvFinanc.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TNotEnvFinanc._defineSqlAdicional: boolean;
var
  I, erro: Integer;
  //  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
  vtempAvanc: string;
begin
  result := true;
  rNotEnv.vSqlAdicional := '';

  tempSql := '';
  if rNotEnv.vCampo = 'Num Documento' then
    tempSql := 'CONTROLE_CREDITOS.N_DOC_C '
  else if rNotEnv.vCampo = 'Data Cadastro' then
  	tempSql := 'CONTROLE_CREDITOS.DATA_REC_C '
  else if rNotEnv.vCampo = 'Data Vencimento' then
    tempSql := 'CONTROLE_CREDITOS.DATA_VENC_C '
  else if rNotEnv.vCampo = 'Valor Credito' then
    tempSql := 'CONTROLE_CREDITOS.VALOR_C '
  else if (rNotEnv.vCampo = 'Valor Corrigido') then
    tempSql := 'CONTROLE_CREDITOS.VALOR_CORR '
  else if (rNotEnv.vCampo = 'Status Cred') then
    tempSql := 'CONTROLE_CREDITOS.STATUS_C '
  else if (rNotEnv.vCampo = 'Data Quitação') then
    tempSql := 'CONTROLE_CREDITOS.DATQ_C '
  else if (rNotEnv.vCampo = 'Tipo Documento') then
    tempSql := 'CONTROLE_CREDITOS.TIPO_DOC_C '
  else if (rNotEnv.vCampo = 'Cod Controle') then
    tempSql := 'CONTROLE_CREDITOS.CODIGO_CTRL '
  else if (rNotEnv.vCampo = 'Controle') then
    tempSql := 'CONTROLES.NOME_CTRL '
  else if (rNotEnv.vCampo = 'Nosso Numero') then
  	tempSql := 'CONTROLE_CREDITOS.NOSSO_NUMERO_BANCO '
  else if (rNotEnv.vCampo = 'Num Parcela') then
  	tempSql := 'CONTROLE_CREDITOS.NPARCELA '
  else if (rNotEnv.vCampo = 'Qtde Parcela') then
  	tempSql := 'CONTROLE_CREDITOS.QTDE_PARC '
  else if (rNotEnv.vCampo = 'Nome do Cliente') then
  	tempSql := 'CLIENTES.NOME_CLIENTE '
  else if (rNotEnv.vCampo = 'Razao Social') then
  	tempSql := 'CLIENTES.RAZAO '
  else if (rNotEnv.vCampo = 'Razao Social') then
  	tempSql := 'CLIENTES.CPFCGC '
  else if (rNotEnv.vCampo = 'Aplicativo') then
  	tempSql := 'MSG_APLICATIVO.APLICATIVO '
  else if (rNotEnv.vCampo = 'Plataforma') then
  	tempSql := 'MSG_PLATAFORMA.PLATAFORMA ';

  if (rNotEnv.vPorData) then
  begin
    try
      erro := 0;
      StrToDateTime(rNotEnv.vDataIni);
    except
      rNotEnv.vDataIni := '';
      erro := erro + 1;
    end;
    try
      StrToDateTime(rNotEnv.vDataFim);
    except
      rNotEnv.vDataFim := '';
      erro := erro + 1;
    end;
    if erro = 2 then
    begin
      Application.MessageBox('Data inválida. Informe no mínimo uma data correta',
        'Atenção', MB_OK + MB_ICONINFORMATION);
    end
    else
    begin
      if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
        formatodata := 'mm/dd/yyyy'
      else if pos('.', ShortDateFormat) <> 0 then
        formatodata := 'dd.mm.yyyy';
      if rNotEnv.vDataIni <> '' then
        rNotEnv.vDataIni := QuotedStr(FormatDateTime(formatodata, strtodate(rNotEnv.vDataIni)) + ' 00:00:00');
      if rNotEnv.vDataFim <> '' then
        rNotEnv.vDataFim := QuotedStr(FormatDateTime(formatodata, strtodate(rNotEnv.vDataFim)) + ' 23:59:59');
    end;
  end;

  if tempSql  <> '' then
  begin
    if rNotEnv.vCondicao = 'Igual' then
      tempTipo := '= '
    else if rNotEnv.vCondicao = 'Maior' then
      tempTipo := '> '
    else if rNotEnv.vCondicao = 'Maior ou Igual' then
      tempTipo := '>= '
    else if rNotEnv.vCondicao = 'Menor' then
      tempTipo := '< '
    else if rNotEnv.vCondicao = 'Menor ou Igual' then
      tempTipo := '<= '
    else if rNotEnv.vCondicao = 'Diferente' then
      tempTipo := '<> '
    else if (rNotEnv.vCondicao = 'Esta contido') then
      tempTipo := 'like'
    else if (rNotEnv.vCondicao = 'Começa') then
      tempTipo := 'Começa'
    else
      tempTipo := '= ';

    if (rNotEnv.vPorData) and (rNotEnv.vDataIni <> '') and (rNotEnv.vDataFim <> '') then
    begin
    	for I := 0 to dataSet.FieldCount - 1 do
	      if Dataset.Fields[I].FieldKind = fkData then
  	      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(rNotEnv.vCampo) then
          begin
          	rNotEnv.vCampo := DataSet.Fields[I].FieldName;

            if (rNotEnv.vCampo = 'N_DOC_C') or (rNotEnv.vCampo = 'DATA_REC_C') or (rNotEnv.vCampo = 'DATA_VENC_C')
              or (rNotEnv.vCampo = 'VALOR_C') or (rNotEnv.vCampo = 'VALOR_CORR') or (rNotEnv.vCampo = 'STATUS_C')
              or (rNotEnv.vCampo = 'DATQ_C') or (rNotEnv.vCampo = 'TIPO_DOC_C')
              or (rNotEnv.vCampo = 'CODIGO_CTRL') or (rNotEnv.vCampo = 'NOSSO_NUMERO_BANCO')
              or (rNotEnv.vCampo = 'NPARCELA') or (rNotEnv.vCampo = 'QTDE_PARC') then
             	tempSql := 'CONTROLE_CREDITOS.' + rNotEnv.vCampo + ' >= ' + rNotEnv.vDataIni +
	             	' and CONTROLE_CREDITOS.' + rNotEnv.vCampo + ' <= ' + rNotEnv.vDataFim
            else if rNotEnv.vCampo = 'NOME_CTRL' then
              tempSql := 'CONTROLES.' + rNotEnv.vCampo + ' >= ' + rNotEnv.vDataIni +
              	' and CONTROLES.' + rNotEnv.vCampo + ' <= ' + rNotEnv.vDataFim
            else if (rNotEnv.vCampo = 'NOME_CLIENTE') or (rNotEnv.vCampo = 'RAZAO') or (rNotEnv.vCampo = 'CPFCGC') then
            	tempSql := 'CLIENTES.' + rNotEnv.vCampo + ' >= ' + rNotEnv.vDataIni +
              	' and CLIENTES.' + rNotEnv.vCampo + ' <= ' + rNotEnv.vDataFim
            else if (rNotEnv.vCampo = 'APLICATIVO') then
              tempSql := 'MSG_APLICATIVO.' + rNotEnv.vCampo + ' >= ' + rNotEnv.vDataIni +
              	' and MSG_APLICATIVO.' + rNotEnv.vCampo + ' <= ' + rNotEnv.vDataFim
            else if (rNotEnv.vCampo = 'PLATAFORMA') then
              tempSql := 'MSG_PLATAFORMA.' + rNotEnv.vCampo + ' >= ' + rNotEnv.vDataIni +
              	' and MSG_PLATAFORMA.' + rNotEnv.vCampo + ' <= ' + rNotEnv.vDataFim
            else
            	tempSql := 'NOTIFICACAO_CREDITOS.' + rNotEnv.vCampo + ' >= ' + rNotEnv.vDataIni +
              	' and NOTIFICACAO_CREDITOS.' + rNotEnv.vCampo + ' <= ' + rNotEnv.vDataFim;
            break;
          end;
    end
    else if tempTipo = 'like' then
      tempSql := tempSql + tempTipo + QuotedStr('%' + rNotEnv.vValor + '%')
    else if tempTipo = 'Começa' then
      tempSql := tempSql + 'like' + QuotedStr(rNotEnv.vValor + '%')
    else
      tempSql := tempSql + tempTipo + QuotedStr(rNotEnv.vValor);
    rNotEnv.vCampo := '';
    rNotEnv.vValor := '';
    rNotEnv.vDataIni := '';
    rNotEnv.vDataFim := '';
    if Trim(rNotEnv.vSqlAdicional) <> '' then
      rNotEnv.vSqlAdicional := rNotEnv.vSqlAdicional + ' and ' + tempSql
    else
      rNotEnv.vSqlAdicional := tempSql;
  end
  else
  begin
  	if (rNotEnv.vPorData) and (rNotEnv.vDataIni <> '') and (rNotEnv.vDataFim <> '') then
    begin
    	for I := 0 to dataSet.FieldCount - 1 do
	      if Dataset.Fields[I].FieldKind = fkData then
  	      if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(rNotEnv.vCampo) then
          begin
          	rNotEnv.vCampo := DataSet.Fields[I].FieldName;

           	tempSql := 'NOTIFICACAO_CREDITOS.' + rNotEnv.vCampo + ' >= ' + rNotEnv.vDataIni +
             	' and NOTIFICACAO_CREDITOS.' + rNotEnv.vCampo + ' <= ' + rNotEnv.vDataFim;
            break;
          end;
      rNotEnv.vCampo := '';
      rNotEnv.vValor := '';
	    rNotEnv.vDataIni := '';
  	  rNotEnv.vDataFim := '';
      if Trim(rNotEnv.vSqlAdicional) <> '' then
        rNotEnv.vSqlAdicional := rNotEnv.vSqlAdicional + ' and ' + tempSql
      else
        rNotEnv.vSqlAdicional := tempSql;
    end
  end;

  if rNotEnv.vAdicional then
  begin
    if rNotEnv.vPorDataAd then
    begin
      try
        erro := 0;
        StrToDateTime(rNotEnv.vDataIniAd);
      except
        rNotEnv.vDataIniAd := '';
        erro := erro + 1;
      end;
      try
        StrToDateTime(rNotEnv.vDataFimAd);
      except
        rNotEnv.vDataFimAd := '';
        erro := erro + 1;
      end;
      if erro = 2 then
      begin
        Application.MessageBox('Data adicional inválida. Informe no mínimo uma data correta',
          'Atenção', MB_OK + MB_ICONINFORMATION);
      end
      else
      begin
        if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
          formatodata := 'mm/dd/yyyy'
        else if pos('.', ShortDateFormat) <> 0 then
          formatodata := 'dd.mm.yyyy';
        if rNotEnv.vDataIniAd <> '' then
          rNotEnv.vDataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(rNotEnv.vDataIniAd)) + ' 00:00:00');
        if rNotEnv.vDataFimAd <> '' then
          rNotEnv.vDataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(rNotEnv.vDataFimAd)) + ' 23:59:59');
      end;
    end
    else if rNotEnv.vValorAd = '' then
      exit;
    if rNotEnv.vCondicaoAd = 'Igual' then
      rNotEnv.vCondicaoAd := '='
    else if rNotEnv.vCondicaoAd = 'Maior' then
      rNotEnv.vCondicaoAd := '>'
    else if rNotEnv.vCondicaoAd = 'Maior ou Igual' then
      rNotEnv.vCondicaoAd := '>='
    else if rNotEnv.vCondicaoAd = 'Menor' then
      rNotEnv.vCondicaoAd := '<'
    else if rNotEnv.vCondicaoAd = 'Menor ou Igual' then
      rNotEnv.vCondicaoAd := '<='
    else if rNotEnv.vCondicaoAd = 'Diferente' then
      rNotEnv.vCondicaoAd := '<>'
    else if (rNotEnv.vCondicaoAd = 'Esta contido') then
      rNotEnv.vCondicaoAd := 'like'
    else if (rNotEnv.vCondicaoAd = 'Começa') then
      rNotEnv.vCondicaoAd := 'Começa'
    else
      rNotEnv.vCondicaoAd := '=';
    for I := 0 to dataSet.FieldCount - 1 do
    begin
      if Dataset.Fields[I].FieldKind = fkData then
      begin
        if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(rNotEnv.vCampoAd) then
        begin
          if rNotEnv.vCampo = rNotEnv.vCampoAd then
          begin
            rNotEnv.vsqlAdicional := '';
            exit;
          end;
          rNotEnv.vCampoAd := DataSet.Fields[I].FieldName;
          if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
            (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
            ((rNotEnv.vCondicaoAd = 'Começa') or (rNotEnv.vCondicaoAd = 'Começa')) then
          begin
            if ((Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField)) then
            try
              strtoint(rNotEnv.vValorAd);
            except
              Application.MessageBox(PChar('Valor para consulta adicional inválido.' + chr(13) +
                'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) +
                'Informe um valor inteiro.'), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
              result := false;
              exit;
            end
            else if ((Dataset.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField))
              then
            try
              strtofloat(rNotEnv.vValorAd);
            except
              Application.MessageBox(PChar('Valor para consulta adicional inválido.' + chr(13) +
                'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) +
                'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção',
                MB_ICONEXCLAMATION + MB_OK);
              result := false;
              exit;
            end;
            rNotEnv.vCondicaoAd := '=';
            rNotEnv.vValorAd := vDadosIni.trocaVirgulaPorPonto(rNotEnv.vValorAd);
          end
          else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
          begin
            if Trim(rNotEnv.vSqlAdicional) <> '' then
		      		rNotEnv.vSqlAdicional := rNotEnv.vSqlAdicional + ' and ';

            if (rNotEnv.vCampoAd = 'N_DOC_C') or (rNotEnv.vCampoAd = 'DATA_REC_C') or (rNotEnv.vCampoAd = 'DATA_VENC_C')
            	or (rNotEnv.vCampoAd = 'VALOR_C') or (rNotEnv.vCampoAd = 'VALOR_CORR') or (rNotEnv.vCampoAd = 'STATUS_C')
              or (rNotEnv.vCampoAd = 'DATQ_C') or (rNotEnv.vCampoAd = 'TIPO_DOC_C')
              or (rNotEnv.vCampoAd = 'CODIGO_CTRL') or (rNotEnv.vCampoAd = 'NOSSO_NUMERO_BANCO')
              or (rNotEnv.vCampoAd = 'NPARCELA') or (rNotEnv.vCampoAd = 'QTDE_PARC') then
            begin
              if (rNotEnv.vDataIniAd <> '') and (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vSqlAdicional := rNotEnv.vsqlAdicional +
                	'CONTROLE_CREDITOS.' + rNotEnv.vCampoAd + ' >= ' + rNotEnv.vDataIniAd +
                  ' and CONTROLE_CREDITOS.' + rNotEnv.vCampoAd + ' <= ' + rNotEnv.vDataFimAd
              else if (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional +
                	'CONTROLE_CREDITOS.' + rNotEnv.vCampoAd + ' <= ' + rNotEnv.vDataIniAd
              else if (rNotEnv.vDataIniAd <> '') and (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional +
                	'CONTROLE_CREDITOS.' + rNotEnv.vCampoAd + ' >= ' + rNotEnv.vDataIniAd;
              rNotEnv.vCampoAd := '';
              rNotEnv.vValorAd := '';
              rNotEnv.vDataIniAd := '';
              rNotEnv.vDataFimAd := '';
            end
            else if rNotEnv.vCampoAd = 'NOME_CTRL' then
            begin
              if (rNotEnv.vDataIniAd <> '') and (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vSqlAdicional := rNotEnv.vsqlAdicional +
                	'CONTROLES.' + rNotEnv.vCampoAd + ' >= ' + rNotEnv.vDataIniAd +
                  ' and CONTROLES.' + rNotEnv.vCampoAd + ' <= ' + rNotEnv.vDataFimAd
              else if (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional +
                	'CONTROLES.' + rNotEnv.vCampoAd + ' <= ' + rNotEnv.vDataIniAd
              else if (rNotEnv.vDataIniAd <> '') and (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional +
                	'CONTROLES.' + rNotEnv.vCampoAd + ' >= ' + rNotEnv.vDataIniAd;
              rNotEnv.vCampoAd := '';
              rNotEnv.vValorAd := '';
              rNotEnv.vDataIniAd := '';
              rNotEnv.vDataFimAd := '';
            end
            else if (rNotEnv.vCampoAd = 'NOME_CLIENTE') or (rNotEnv.vCampoAd = 'RAZAO') or (rNotEnv.vCampoAd = 'CPFCGC') then
            begin
              if (rNotEnv.vDataIniAd <> '') and (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vSqlAdicional := rNotEnv.vsqlAdicional +
                	'CLIENTES.' + rNotEnv.vCampoAd + ' >= ' + rNotEnv.vDataIniAd +
                  ' and CLIENTES.' + rNotEnv.vCampoAd + ' <= ' + rNotEnv.vDataFimAd
              else if (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional +
                	'CLIENTES.' + rNotEnv.vCampoAd + ' <= ' + rNotEnv.vDataIniAd
              else if (rNotEnv.vDataIniAd <> '') and (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional +
                	'CLIENTES.' + rNotEnv.vCampoAd + ' >= ' + rNotEnv.vDataIniAd;
              rNotEnv.vCampoAd := '';
              rNotEnv.vValorAd := '';
              rNotEnv.vDataIniAd := '';
              rNotEnv.vDataFimAd := '';
            end
            else if (rNotEnv.vCampoAd = 'APLICATIVO') then
            begin
              if (rNotEnv.vDataIniAd <> '') and (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vSqlAdicional := rNotEnv.vsqlAdicional +
                	'MSG_APLICATIVO.' + rNotEnv.vCampoAd + ' >= ' + rNotEnv.vDataIniAd +
                  ' and MSG_APLICATIVO.' + rNotEnv.vCampoAd + ' <= ' + rNotEnv.vDataFimAd
              else if (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional +
                	'MSG_APLICATIVO.' + rNotEnv.vCampoAd + ' <= ' + rNotEnv.vDataIniAd
              else if (rNotEnv.vDataIniAd <> '') and (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional +
                	'MSG_APLICATIVO.' + rNotEnv.vCampoAd + ' >= ' + rNotEnv.vDataIniAd;
              rNotEnv.vCampoAd := '';
              rNotEnv.vValorAd := '';
              rNotEnv.vDataIniAd := '';
              rNotEnv.vDataFimAd := '';
            end
            else if (rNotEnv.vCampoAd = 'PLATAFORMA') then
            begin
              if (rNotEnv.vDataIniAd <> '') and (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vSqlAdicional := rNotEnv.vsqlAdicional +
                	'MSG_PLATAFORMA.' + rNotEnv.vCampoAd + ' >= ' + rNotEnv.vDataIniAd +
                  ' and MSG_PLATAFORMA.' + rNotEnv.vCampoAd + ' <= ' + rNotEnv.vDataFimAd
              else if (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional +
                	'MSG_PLATAFORMA.' + rNotEnv.vCampoAd + ' <= ' + rNotEnv.vDataIniAd
              else if (rNotEnv.vDataIniAd <> '') and (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional +
                	'MSG_PLATAFORMA.' + rNotEnv.vCampoAd + ' >= ' + rNotEnv.vDataIniAd;
              rNotEnv.vCampoAd := '';
              rNotEnv.vValorAd := '';
              rNotEnv.vDataIniAd := '';
              rNotEnv.vDataFimAd := '';
            end
            else
            begin
              if (rNotEnv.vDataIniAd <> '') and (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vSqlAdicional := rNotEnv.vsqlAdicional +
                	'NOTIFICACAO_CREDITOS.' + rNotEnv.vCampoAd + ' >= ' + rNotEnv.vDataIniAd +
                  ' and NOTIFICACAO_CREDITOS.' + rNotEnv.vCampoAd + ' <= ' + rNotEnv.vDataFimAd
              else if (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional +
                	'NOTIFICACAO_CREDITOS.' + rNotEnv.vCampoAd + ' <= ' + rNotEnv.vDataIniAd
              else if (rNotEnv.vDataIniAd <> '') and (rNotEnv.vDataFimAd <> '') then
                rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional +
                	'NOTIFICACAO_CREDITOS.' + rNotEnv.vCampoAd + ' >= ' + rNotEnv.vDataIniAd;
              rNotEnv.vCampoAd := '';
              rNotEnv.vValorAd := '';
              rNotEnv.vDataIniAd := '';
              rNotEnv.vDataFimAd := '';
            end;
            Break;
          end;
          if Trim(rNotEnv.vSqlAdicional) <> '' then
		      rNotEnv.vSqlAdicional := rNotEnv.vSqlAdicional + ' and ';

          if rNotEnv.vCondicaoAd = 'like' then
          begin
          	if (rNotEnv.vCampoAd = 'N_DOC_C') or (rNotEnv.vCampoAd = 'DATA_REC_C') or (rNotEnv.vCampoAd = 'DATA_VENC_C')
            	or (rNotEnv.vCampoAd = 'VALOR_C') or (rNotEnv.vCampoAd = 'VALOR_CORR') or (rNotEnv.vCampoAd = 'STATUS_C')
              or (rNotEnv.vCampoAd = 'DATQ_C') or (rNotEnv.vCampoAd = 'TIPO_DOC_C')
              or (rNotEnv.vCampoAd = 'CODIGO_CTRL') or (rNotEnv.vCampoAd = 'NOSSO_NUMERO_BANCO')
              or (rNotEnv.vCampoAd = 'NPARCELA') or (rNotEnv.vCampoAd = 'QTDE_PARC') then
	           rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'CONTROLE_CREDITOS.' + rNotEnv.vCampoAd + ' like ' + QuotedStr('%' + rNotEnv.vValorAd + '%')
            else if rNotEnv.vCampoAd = 'NOME_CTRL' then
              rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'CONTROLES.' + rNotEnv.vCampoAd + ' like ' + QuotedStr('%' + rNotEnv.vValorAd + '%')
            else if (rNotEnv.vCampoAd = 'NOME_CLIENTE') or (rNotEnv.vCampoAd = 'RAZAO') or (rNotEnv.vCampoAd = 'CPFCGC') then
              rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'CLIENTES.' + rNotEnv.vCampoAd + ' like ' + QuotedStr('%' + rNotEnv.vValorAd + '%')
            else if (rNotEnv.vCampoAd = 'APLICATIVO') then
            	rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'MSG_APLICATIVO.' + rNotEnv.vCampoAd + ' like ' + QuotedStr('%' + rNotEnv.vValorAd + '%')
            else if (rNotEnv.vCampoAd = 'PLATAFORMA') then
            	rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'MSG_PLATAFORMA.' + rNotEnv.vCampoAd + ' like ' + QuotedStr('%' + rNotEnv.vValorAd + '%')
            else
              rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'NOTIFICACAO_CREDITOS.' + rNotEnv.vCampoAd + ' like ' + QuotedStr('%' + rNotEnv.vValorAd + '%')
          end
          else if rNotEnv.vCondicaoAd = 'Começa' then
          begin
            if (rNotEnv.vCampoAd = 'N_DOC_C') or (rNotEnv.vCampoAd = 'DATA_REC_C') or (rNotEnv.vCampoAd = 'DATA_VENC_C')
            	or (rNotEnv.vCampoAd = 'VALOR_C') or (rNotEnv.vCampoAd = 'VALOR_CORR') or (rNotEnv.vCampoAd = 'STATUS_C')
              or (rNotEnv.vCampoAd = 'DATQ_C') or (rNotEnv.vCampoAd = 'TIPO_DOC_C')
              or (rNotEnv.vCampoAd = 'CODIGO_CTRL') or (rNotEnv.vCampoAd = 'NOSSO_NUMERO_BANCO')
              or (rNotEnv.vCampoAd = 'NPARCELA') or (rNotEnv.vCampoAd = 'QTDE_PARC') then
            	rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'CONTROLE_CREDITOS.' + rNotEnv.vCampoAd + ' like ' + QuotedStr(rNotEnv.vValorAd + '%')
            else if rNotEnv.vCampoAd = 'NOME_CTRL' then
            	rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'CONTROLES.' + rNotEnv.vCampoAd + ' like ' + QuotedStr(rNotEnv.vValorAd + '%')
            else if (rNotEnv.vCampoAd = 'NOME_CLIENTE') or (rNotEnv.vCampoAd = 'RAZAO') or (rNotEnv.vCampoAd = 'CPFCGC') then
            	rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'CLIENTES.' + rNotEnv.vCampoAd + ' like ' + QuotedStr(rNotEnv.vValorAd + '%')
            else if (rNotEnv.vCampoAd = 'APLICATIVO') then
            	rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'MSG_APLICATIVO.' + rNotEnv.vCampoAd + ' like ' + QuotedStr(rNotEnv.vValorAd + '%')
            else if (rNotEnv.vCampoAd = 'PLATAFORMA') then
            	rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'MSG_PLATAFORMA.' + rNotEnv.vCampoAd + ' like ' + QuotedStr(rNotEnv.vValorAd + '%')
            else
	            rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'NOTIFICACAO_CREDITOS.' + rNotEnv.vCampoAd + ' like ' + QuotedStr(rNotEnv.vValorAd + '%')
          end
          else //if rNotEnv.vCondicaoAd <> 'Começa' then
          begin
            if (rNotEnv.vCampoAd = 'N_DOC_C') or (rNotEnv.vCampoAd = 'DATA_REC_C') or (rNotEnv.vCampoAd = 'DATA_VENC_C')
            	or (rNotEnv.vCampoAd = 'VALOR_C') or (rNotEnv.vCampoAd = 'VALOR_CORR') or (rNotEnv.vCampoAd = 'STATUS_C')
              or (rNotEnv.vCampoAd = 'DATQ_C') or (rNotEnv.vCampoAd = 'TIPO_DOC_C')
              or (rNotEnv.vCampoAd = 'CODIGO_CTRL') or (rNotEnv.vCampoAd = 'NOSSO_NUMERO_BANCO')
              or (rNotEnv.vCampoAd = 'NPARCELA') or (rNotEnv.vCampoAd = 'QTDE_PARC') then
              rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'CONTROLE_CREDITOS.' + rNotEnv.vCampoAd + ' ' + rNotEnv.vCondicaoAd + ' ' + QuotedStr(rNotEnv.vValorAd)
            else if rNotEnv.vCampoAd = 'NOME_CTRL' then
              rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'CONTROLES.' + rNotEnv.vCampoAd + ' ' + rNotEnv.vCondicaoAd + ' ' + QuotedStr(rNotEnv.vValorAd)
            else if (rNotEnv.vCampoAd = 'NOME_CLIENTE') or (rNotEnv.vCampoAd = 'RAZAO') or (rNotEnv.vCampoAd = 'CPFCGC') then
              rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'CLIENTES.' + rNotEnv.vCampoAd + ' ' + rNotEnv.vCondicaoAd + ' ' + QuotedStr(rNotEnv.vValorAd)
            else if (rNotEnv.vCampoAd = 'APLICATIVO') then
            	rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'MSG_APLICATIVO.' + rNotEnv.vCampoAd + ' ' + rNotEnv.vCondicaoAd + ' ' + QuotedStr(rNotEnv.vValorAd)
            else if (rNotEnv.vCampoAd = 'PLATAFORMA') then
            	rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'MSG_PLATAFORMA.' + rNotEnv.vCampoAd + ' ' + rNotEnv.vCondicaoAd + ' ' + QuotedStr(rNotEnv.vValorAd)
            else
              rNotEnv.vsqlAdicional := rNotEnv.vsqlAdicional + 'NOTIFICACAO_CREDITOS.' + rNotEnv.vCampoAd + ' ' + rNotEnv.vCondicaoAd + ' ' + QuotedStr(rNotEnv.vValorAd);
          end;
          Break;
        end;
      end;
    end;
  end;

  if rNotEnv.vAvancada then
  begin
     if (rNotEnv.vAvisoVenc)
     	or (rNotEnv.vCreditosAtraso)
      or (rNotEnv.vAgradecimento) then
     begin
       if Trim(rNotEnv.vSqlAdicional) <> '' then
         rNotEnv.vSqlAdicional := rNotEnv.vSqlAdicional + ' and ';

       vtempAvanc := '';
       if rNotEnv.vAvisoVenc then
         vtempAvanc := vtempAvanc + vDadosIni.IfThen(trim(vtempAvanc) <> '', ', ', '') + '''AVISO DE VENCIMENTO''' ;
       if rNotEnv.vCreditosAtraso then
         vtempAvanc := vtempAvanc + vDadosIni.IfThen(trim(vtempAvanc) <> '', ', ', '') + '''CREDITOS EM ATRASO''' ;
       if rNotEnv.vAgradecimento then
         vtempAvanc := vtempAvanc + vDadosIni.IfThen(trim(vtempAvanc) <> '', ', ', '') + '''AGRADECIMENTO''' ;

       rNotEnv.vSqlAdicional := rNotEnv.vSqlAdicional +
       		' NOTIFICACAO_CREDITOS.TIPO_CONTRATO IN (' + vtempAvanc + ') ';
     end;

     if (rNotEnv.vStatusNO)
     	or (rNotEnv.vStatusEP)
      or (rNotEnv.vStatusAC)
      or (rNotEnv.vStatusER)
      or (rNotEnv.vStatusPP) then
     begin
     	 if Trim(rNotEnv.vSqlAdicional) <> '' then
         rNotEnv.vSqlAdicional := rNotEnv.vSqlAdicional + ' and ';
         
       vtempAvanc := '';
       if rNotEnv.vStatusNO then
         vtempAvanc := vtempAvanc + vDadosIni.IfThen(trim(vtempAvanc) <> '', ', ', '') + '''NO''' ;
       if rNotEnv.vStatusEP then
         vtempAvanc := vtempAvanc + vDadosIni.IfThen(trim(vtempAvanc) <> '', ', ', '') + '''EP''' ;
       if rNotEnv.vStatusAC then
         vtempAvanc := vtempAvanc + vDadosIni.IfThen(trim(vtempAvanc) <> '', ', ', '') + '''AC''' ;
       if rNotEnv.vStatusER then
         vtempAvanc := vtempAvanc + vDadosIni.IfThen(trim(vtempAvanc) <> '', ', ', '') + '''ER''' ;
       if rNotEnv.vStatusPP then
         vtempAvanc := vtempAvanc + vDadosIni.IfThen(trim(vtempAvanc) <> '', ', ', '') + '''PP''' ;

       rNotEnv.vSqlAdicional := rNotEnv.vSqlAdicional +
         ' NOTIFICACAO_CREDITOS.STATUS_ENV IN (' + vtempAvanc + ') ';
     end;

     if (rNotEnv.vOrigemErp)
       or (rNotEnv.vOrigemBot) then
     begin
       if Trim(rNotEnv.vSqlAdicional) <> '' then
         rNotEnv.vSqlAdicional := rNotEnv.vSqlAdicional + ' and ';

       vtempAvanc := '';
       if rNotEnv.vOrigemErp then
         vtempAvanc := vtempAvanc + vDadosIni.IfThen(trim(vtempAvanc) <> '', ', ', '') + '''erp''' ;
       if rNotEnv.vOrigemBot then
         vtempAvanc := vtempAvanc + vDadosIni.IfThen(trim(vtempAvanc) <> '', ', ', '') + '''bot''' ;

       rNotEnv.vSqlAdicional := rNotEnv.vSqlAdicional +
         ' NOTIFICACAO_CREDITOS.ORIGEM IN (' + vtempAvanc + ') ';
     end;

     if (rNotEnv.vDestinoErp)
       or (rNotEnv.vDestinoBot) then
     begin
       if Trim(rNotEnv.vSqlAdicional) <> '' then
         rNotEnv.vSqlAdicional := rNotEnv.vSqlAdicional + ' and ';

       vtempAvanc := '';
       if rNotEnv.vDestinoErp then
         vtempAvanc := vtempAvanc + vDadosIni.IfThen(trim(vtempAvanc) <> '', ', ', '') + '''erp''' ;
       if rNotEnv.vDestinoBot then
         vtempAvanc := vtempAvanc + vDadosIni.IfThen(trim(vtempAvanc) <> '', ', ', '') + '''bot''' ;

       rNotEnv.vSqlAdicional := rNotEnv.vSqlAdicional +
         ' NOTIFICACAO_CREDITOS.DESTINO IN (' + vtempAvanc + ') ';
     end;
  end;
end;

{ TDocumentosOrigem }

function TDocumentosOrigem.abreDocumentosOrigem(pNdocV: Integer; pTipoDocV: string; pCodEmpresa: Integer): boolean;
begin
  Result := montaSelect(
    ' select distinct * from ( ' +
    '   select ' +
  	 '   pedvenda.nped, ' +
    '   pedvenda.tipo, ' +
    '   pedvenda.cod_empresa, ' +
    '   pedvenda.data_ped, ' +
    '   pedvenda.data_fech, ' +
    '   pedvenda.valor_total, ' +
    '   coalesce(pedvenda.tot_prod, 0) tot_prod, ' +
    '   coalesce(pedvenda.tot_serv, 0) tot_serv, ' +
    '   coalesce(pedvenda.tot_prod_terc, 0) tot_prod_terc, ' +
    '   coalesce(pedvenda.tot_serv_terc, 0) tot_serv_terc, ' +
    '   clientes.nome_cliente, ' +
    '   clientes.razao, ' +
    '	  clientes.cpfcgc from pedvenda ' +
    '   inner join clientes on ' +
    '       clientes.cod_cliente = pedvenda.cod_cliente ' +
    '			and clientes.cod_empresa = pedvenda.cod_empresa ' +
  	 '   where pedvenda.nped = ' + IntToStr(vDadosIni.IfThen((trim(pTipoDocV) = 'REQ') or (trim(pTipoDocV) = 'OS'), pNdocV, 0)) +
    '   and pedvenda.tipo = ' + QuotedStr(vDadosIni.IfThen((trim(pTipoDocV) = 'REQ') or (trim(pTipoDocV) = 'OS'), pTipoDocV, '')) +
    '   and pedvenda.cod_empresa = ' + IntToStr(pCodEmpresa) +
    vDadosIni.IfThen(trim(pTipoDocV) = 'REC',
      '   union all ' +
      '   select pedvenda.nped, ' +
      '   pedvenda.tipo, ' +
      '   pedvenda.cod_empresa, ' +
      '   pedvenda.data_ped, ' +
      '   pedvenda.data_fech, ' +
      '   pedvenda.valor_total, ' +
      '   coalesce(pedvenda.tot_prod, 0) tot_prod, ' +
      '   coalesce(pedvenda.tot_serv, 0) tot_serv, ' +
      '   coalesce(pedvenda.tot_prod_terc, 0) tot_prod_terc, ' +
      '   coalesce(pedvenda.tot_serv_terc, 0) tot_serv_terc, ' +
      '   clientes.nome_cliente, ' +
      '   clientes.razao, ' +
      '   clientes.cpfcgc from hist_rec ' +
      '   inner join pedvenda on ' +
      '       pedvenda.nped = hist_rec.ndocant ' +
      '       and pedvenda.tipo = hist_rec.tp_doc_baixa ' +
      '       and pedvenda.cod_empresa = iif(coalesce(hist_rec.cod_unificada, 0) > 0, hist_rec.cod_unificada, hist_rec.cod_empresa) ' +
      '   inner join clientes on ' +
      '       clientes.cod_cliente = pedvenda.cod_cliente ' +
      '			and clientes.cod_empresa = pedvenda.cod_empresa ' +
      '   where hist_rec.nrecibo = ' + IntToStr(pNdocV) +
      '   and hist_rec.cod_unificada = ' + IntToStr(pCodEmpresa) +
      '   and hist_rec.tp_doc_baixa in (''REQ'', ''OS'') ',
      '') +
    ' ) ');
end;

constructor TDocumentosOrigem.create;
begin
  DataSet := TClientDataSet(dtmContasAReceber.cdsDocumentosOrigem);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  buscas := TIBQuery(dtmContasAReceber.qrBuscas);
end;

{ TControleCheque }

function TControleCheque._altervalorcorrigido: Boolean;
begin
  Result := False;
  Application.MessageBox('Opção não disponível para Cheques', 'Atenção', 0 + 64);
end;

function TControleCheque._atualizarValorLiq: boolean;
begin
	Result := False;
  Application.MessageBox('Opção não disponível para Cheques', 'Atenção', 0 + 64);
end;

function TControleCheque._baixaCreditosConciliacaoCartao(pLote: Integer;
  pCartaoCDS: TClientDataSet; pLancarTarifa, pLancarAjuste,
  pLancarComissao: Boolean; pCodigoUnificada: Integer): Boolean;
begin
  Result := False;
  Application.MessageBox('Opção não disponível para Cheques', 'Atenção', 0 + 64);
end;

function TControleCheque._baixaDevCreditosConciliacaoCartao(pLote, pCodigoUnificada: Integer;
	pLancarTarifa, pLancarComissao: Boolean): Boolean;
begin
	Result := False;
  Application.MessageBox('Opção não disponível para Cheques', 'Atenção', 0 + 64);
end;

function TControleCheque._concederAcrescimoDesconto: Boolean;
begin
  Result := False;
  Application.MessageBox('Opção não disponível para Cheques', 'Atenção', 0 + 64);
end;

function TControleCheque._consulta: boolean;
var
  I, erro: Integer;
  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  vCampoTemp, vCampoTempAd: string;
  tempSql: string;
  vTempCondicao: string;
  vFormPag: string;
begin
  try
  	vsqlAdicional := '';
    vCons.valor   := Trim(vCons.valor);
    vCons.valorAd := Trim(vCons.valorAd);

    vFormPag := '';
    if (trim(UpperCase(vCons.campo)) = 'FORM PAG') then
    begin
      if trim(vCons.condicao) = 'Começa' then
        vFormPag := vCons.valor + '%'
      else if trim(vCons.condicao) = 'Esta contido' then
        vFormPag := '%' + vCons.valor + '%'
      else
        vFormPag := vCons.valor;
      vCons.ordem := 'CODIGO_CH';
      vCons.campo := '';
      vCons.valor := '';
    end
    else if (vCons.adicional) and (trim(UpperCase(vCons.campoAd)) = 'FORM PAG') then
    begin
      if trim(vCons.condicaoAd) = 'Começa' then
        vFormPag := vCons.valorAd + '%'
      else if trim(vCons.condicaoAd) = 'Esta contido' then
        vFormPag := '%' + vCons.valorAd + '%'
      else
        vFormPag := vCons.valorAd;
      vCons.campoAd := '';
      vCons.valorAd := '';
      vCons.adicional := false;
    end;

    if (UpperCase(trim(vCons.campo)) = 'NUM DOC VND')
    	or (UpperCase(trim(vCons.campo)) = 'NOME CONTROLE')
      or (UpperCase(trim(vCons.campo)) =  'UNIFICADA')
      or (UpperCase(trim(vCons.campo)) = 'DESCRICAO CONTA')
      or (UpperCase(trim(vCons.campo)) = 'DESCRICAO GRUPO CONTA')
      or (UpperCase(trim(vCons.campo)) = 'DESCRICAO DEPARTAMENTO CONTA')
      or (UpperCase(trim(vCons.campo)) = 'COD CONTA CONTABIL')
      or (UpperCase(trim(vCons.campo)) = 'DESCRICAO CONTA CONTABIL')
      or (UpperCase(trim(vCons.campo)) = 'STATUS FATURAMENTO')
      or (UpperCase(trim(vCons.campo)) = 'CEP')
      or (UpperCase(trim(vCons.campo)) = 'ENDERECO')
      or (UpperCase(trim(vCons.campo)) = 'NUM END CLIENTE')
      or (UpperCase(trim(vCons.campo)) = 'COMPLEMENTO')
      or (UpperCase(trim(vCons.campo)) = 'FONE CLIENTE')
      or (UpperCase(trim(vCons.campo)) = 'CELULAR')
      or (UpperCase(trim(vCons.campo)) = 'EMAIL')
      or (UpperCase(trim(vCons.campo)) = 'COD LOCALIDADE')
      or (UpperCase(trim(vCons.campo)) = 'LOCALIDADE')
      or (UpperCase(trim(vCons.campo)) = 'COD SETOR')
      or (UpperCase(trim(vCons.campo)) = 'SETOR')
      or (UpperCase(trim(vCons.campo)) = 'ESTADO CLIENTE')
      or (UpperCase(trim(vCons.campo)) = 'CIDADE CLIENTE')
      or (UpperCase(trim(vCons.campo)) = 'BAIRRO CLIENTE') then
    begin
      if UpperCase(trim(vCons.campo)) = 'NUM DOC VND' then
      begin
        vCons.campo := 'NUM_REC_DEP';
        vCons.ordem := 'RECIBOS.NUM_REC_DEP';
        vCampoTemp := 'N_DOC_V';
      end
      else if UpperCase(trim(vCons.campo)) = 'NOME CONTROLE' then
      begin
        vCons.campo := 'CONTROLES.NOME_CTRL';
        vCons.ordem := 'CONTROLES.NOME_CTRL';
      end
      else if UpperCase(trim(vCons.campo)) =  'UNIFICADA' then
      begin
        vCons.campo := 'EMPRESA.IDENTIFICACAO_EMP';
        vCons.ordem := 'EMPRESA.IDENTIFICACAO_EMP';
      end
      else if UpperCase(trim(vCons.campo)) = 'DESCRICAO CONTA' then
      begin
        vCons.campo := 'P_CONTAS.DESC_PLC';
        vCons.ordem := 'P_CONTAS.DESC_PLC';
      end
      else if UpperCase(trim(vCons.campo)) = 'DESCRICAO GRUPO CONTA' then
      begin
        vCons.campo := 'GRUPOS_CT.DESC_GR';
        vCons.ordem := 'GRUPOS_CT.DESC_GR';
      end
      else if UpperCase(trim(vCons.campo)) = 'DESCRICAO DEPARTAMENTO CONTA' then
      begin
        vCons.campo := 'DEPART_CT.DESC_DEP';
        vCons.ordem := 'DEPART_CT.DESC_DEP';
      end
      else if UpperCase(trim(vCons.campo)) = 'COD CONTA CONTABIL' then
      begin
        vCons.campo := 'P_CONTAS.COD_CTA_CONTABIL';
        vCons.ordem := 'P_CONTAS.COD_CTA_CONTABIL';
      end
      else if UpperCase(trim(vCons.campo)) = 'DESCRICAO CONTA CONTABIL' then
      begin
        vCons.campo := 'P_CONTAS_CONTABIL.NOME_CTA';
        vCons.ordem := 'P_CONTAS_CONTABIL.NOME_CTA';
      end
      else if UpperCase(trim(vCons.campo)) = 'STATUS FATURAMENTO' then
      begin
        vCons.campo := 'TIPO_FATURAMENTO.STATUS_F';
        vCons.ordem := 'TIPO_FATURAMENTO.STATUS_F';
      end
      else if UpperCase(trim(vCons.campo)) = 'CEP' then
      begin
        vCons.campo := 'CLIENTES.CEP';
        vCons.ordem := 'CLIENTES.CEP';
      end
      else if UpperCase(trim(vCons.campo)) = 'ENDERECO' then
      begin
      	vCons.campo := 'CLIENTES.ENDERECO';
        vCons.ordem := 'CLIENTES.ENDERECO';
      end
      else if UpperCase(trim(vCons.campo)) = 'NUM END CLIENTE' then
      begin
        vCons.campo := 'CLIENTES.NUM_END_CLIENTE';
        vCons.ordem := 'CLIENTES.NUM_END_CLIENTE';
      end
      else if UpperCase(trim(vCons.campo)) = 'COMPLEMENTO' then
      begin
        vCons.campo := 'CLIENTES.COMPLEMENTO';
        vCons.ordem := 'CLIENTES.COMPLEMENTO';
      end
      else if UpperCase(trim(vCons.campo)) = 'FONE CLIENTE' then
      begin
        vCons.campo := 'CLIENTES.FONE_CLIENTE';
        vCons.ordem := 'CLIENTES.FONE_CLIENTE';
      end
      else if UpperCase(trim(vCons.campo)) = 'CELULAR' then
      begin
        vCons.campo := 'CLIENTES.FONE_CELULAR';
        vCons.ordem := 'CLIENTES.FONE_CELULAR';
      end
      else if UpperCase(trim(vCons.campo)) = 'EMAIL' then
      begin
        vCons.campo := 'CLIENTES.EMAIL';
        vCons.ordem := 'CLIENTES.EMAIL';
      end
      else if UpperCase(trim(vCons.campo)) = 'COD LOCALIDADE' then
      begin
        vCons.campo := 'CLIENTES.COD_LOCALIDADE';
        vCons.ordem := 'CLIENTES.COD_LOCALIDADE';
      end
      else if UpperCase(trim(vCons.campo)) = 'LOCALIDADE' then
      begin
        vCons.campo := 'LOCALIDADE.LOCALIDADE';
        vCons.ordem := 'LOCALIDADE.LOCALIDADE';
      end
       else if UpperCase(trim(vCons.campo)) = 'COD SETOR' then
      begin
        vCons.campo := 'LOCALIDADE.COD_SETOR';
        vCons.ordem := 'LOCALIDADE.COD_SETOR';
      end
      else if UpperCase(trim(vCons.campo)) = 'SETOR' then
      begin
        vCons.campo := 'SETOR.SETOR';
        vCons.ordem := 'SETOR.SETOR';
      end
      else if UpperCase(trim(vCons.campo)) = 'ESTADO CLIENTE' then
      begin
        vCons.campo := 'ESTADOS.SIGLA_UF';
        vCons.ordem := 'ESTADOS.SIGLA_UF';
      end
      else if UpperCase(trim(vCons.campo)) = 'CIDADE CLIENTE' then
      begin
        vCons.campo := 'CIDADES.NOME_CIDADE';
        vCons.ordem := 'CIDADES.NOME_CIDADE';
      end
      else if UpperCase(trim(vCons.campo)) = 'BAIRRO CLIENTE' then
      begin
        vCons.campo := 'BAIRROS.NOME_BAIRRO';
        vCons.ordem := 'BAIRROS.NOME_BAIRRO';
      end;

      if vCons.condicao = 'Igual' then
        vTempCondicao := '='
      else if vCons.condicao = 'Maior' then
        vTempCondicao := '>'
      else if vCons.condicao = 'Maior ou Igual' then
        vTempCondicao := '>='
      else if vCons.condicao = 'Menor' then
        vTempCondicao := '<'
      else if vCons.condicao = 'Menor ou Igual' then
        vTempCondicao := '<='
      else if vCons.condicao = 'Diferente' then
        vTempCondicao := '<>'
      else if (vCons.condicao = 'Esta contido') then
        vTempCondicao := 'like'
      else if (vCons.condicao = 'Começa') then
        vTempCondicao := 'Começa'
      else
        vTempCondicao := '=';

      if vCons.condicao = 'Esta contido' then
        vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
        	vCons.campo + ' like ' + QuotedStr('%' + vCons.valor + '%')
      else if vCons.condicao = 'Começa' then
        vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
        	vCons.campo + ' like ' + QuotedStr(vCons.valor + '%')
      else
        vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') + 
        	vCons.campo + ' ' + vTempCondicao + ' ' + QuotedStr(vCons.valor);

      vCons.campo := 'Todos';
    end;

    if vCons.porData then
    begin
      try
        erro := 0;
        StrToDate(vCons.dataIni);
      except
        vCons.dataIni := '';
        erro := erro + 1;
      end;
      try
        StrToDate(vCons.dataFim);
      except
        vCons.dataFim := '';
        erro := erro + 1;
      end;
      if erro = 2 then
      begin
        Application.MessageBox('Data Inválida. Informe no mínimo uma data correta', 'Atenção',
          MB_OK + MB_ICONINFORMATION);
      end;
    end; //porData

    if (vCons.quitados = vCons.naoQuitados) then
    else if vCons.naoQuitados then
      vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
        ' (controle_cheque.status_ch = '''' or controle_cheque.status_ch is null)'
    else if vCons.quitados then
      vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
        ' ((controle_cheque.status_ch <> '''') and (not controle_cheque.status_ch is null))';

    if Trim(vsqlAdicional) = '' then
      vsqlAdicional := vsqlAdicional + ' controle_cheque.codigo_ch <> -1';

    if vCons.condicao = 'Igual' then
      vTempCondicao := '='
    else if vCons.condicao = 'Maior' then
      vTempCondicao := '>'
    else if vCons.condicao = 'Maior ou Igual' then
      vTempCondicao := '>='
    else if vCons.condicao = 'Menor' then
      vTempCondicao := '<'
    else if vCons.condicao = 'Menor ou Igual' then
      vTempCondicao := '<='
    else if vCons.condicao = 'Diferente' then
      vTempCondicao := '<>'
    else if (vCons.condicao = 'Esta contido') then
      vTempCondicao := 'like'
    else if (vCons.condicao = 'Começa') then
      vTempCondicao := 'Começa'
    else
      vTempCondicao := '=';

    if (vCons.campo = 'NUM_REC_DEP') then
    begin
      if vCons.condicao = 'Esta contido' then
        vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
        	' ((recibos.' + vCons.campo + ' like ' + QuotedStr('%' + vCons.valor + '%') +
          ' and not recibos.nrecibo is null) or (controle_cheque.' + vCampoTemp + ' like ' +  QuotedStr('%' + vDadosIni.IfThen(vDadosIni.apenasNumeros(vCons.valor) = '', '0', vDadosIni.apenasNumeros(vCons.valor)) + '%') +
          ' and recibos.nrecibo is null))'
      else if vCons.condicao = 'Começa' then
        vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
        	' ((recibos.' + vCons.campo + ' like ' + QuotedStr(vCons.valor + '%') +
          ' and not recibos.nrecibo is null) or (controle_cheque.' + vCampoTemp + ' like ' +  QuotedStr(vDadosIni.IfThen(vDadosIni.apenasNumeros(vCons.valor) = '', '0', vDadosIni.apenasNumeros(vCons.valor)) + '%') +
          ' and recibos.nrecibo is null))'
      else
        vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
        	' ((recibos.' + vCons.campo + ' ' + vTempCondicao + ' ' + QuotedStr(vCons.valor)+
          ' and not recibos.nrecibo is null) or (controle_cheque.' + vCampoTemp + ' ' + vTempCondicao + ' ' + QuotedStr(vDadosIni.IfThen(vDadosIni.apenasNumeros(vCons.valor)= '', '0', vDadosIni.apenasNumeros(vCons.valor))) +
          ' and recibos.nrecibo is null))';
      vCons.campo := 'Todos';
    end;

    if vCons.adicional then
    begin
      vCons.valorAd := UpperCase(vCons.valorAd);
      if vCons.porDataAd then
      begin
        try
          erro := 0;
          StrToDate(vCons.dataIniAd);
        except
          vCons.dataIniAd := '';
          erro := erro + 1;
        end;
        try
          StrToDate(vCons.dataFimAd);
        except
          vCons.dataFimAd := '';
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
          if vCons.dataIniAd <> '' then
            vCons.dataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataIniAd)));
          if vCons.dataFimAd <> '' then
            vCons.dataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataFimAd)));
        end;
      end;
      if vCons.condicaoAd = 'Igual' then
        vCons.condicaoAd := '='
      else if vCons.condicaoAd = 'Maior' then
        vCons.condicaoAd := '>'
      else if vCons.condicaoAd = 'Maior ou Igual' then
        vCons.condicaoAd := '>='
      else if vCons.condicaoAd = 'Menor' then
        vCons.condicaoAd := '<'
      else if vCons.condicaoAd = 'Menor ou Igual' then
        vCons.condicaoAd := '<='
      else if vCons.condicaoAd = 'Diferente' then
        vCons.condicaoAd := '<>'
      else if (vCons.condicaoAd = 'Esta contido') then
        vCons.condicaoAd := 'like'
      else if (vCons.condicaoAd = 'Começa') then
        vCons.condicaoAd := 'Começa'
      else
        vCons.condicaoAd := '=';
      for I := 0 to dataSet.FieldCount - 1 do
      begin
        if Dataset.Fields[I].FieldKind = fkData then
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(vCons.campoAd) then
          begin
            vCons.campoAd := DataSet.Fields[I].FieldName;
            if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
              (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
              ((vCons.condicaoAd = 'Começa') or (vCons.condicaoAd = 'Começa')) then
            begin
              try
                vCons.condicaoAd := '=';
                if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
                  vCons.valorAd := IntToStr(StrToInt(Trim(vCons.valorAd)))
                else if (DataSet.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField) then
                  vCons.valorAd := FloatToStr(StrToFloat(Trim(vCons.valorAd)))
              except
                vCons.valorAd := '0';
                Application.MessageBox('Valor inválido', 'Atenção', 0 + 64);
              end;
            end
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
            begin
              if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
                	' controle_cheque.' + vCons.campoAd + ' >= ' + vCons.dataIniAd +
                  ' and controle_cheque.' + vCons.campoAd + ' <= ' + vCons.dataFimAd
              else if (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
                	' controle_cheque.' + vCons.campoAd + ' <= ' + vCons.dataFimAd
              else if (vCons.dataIniAd <> '') then
                vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
                	' controle_cheque.' + vCons.campoAd + ' >= ' + vCons.dataIniAd;
              Break;
            end;
            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' controle_cheque.' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' controle_cheque.' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' controle_cheque.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ' + QuotedStr(vCons.valorAd);
            Break;
          end
          else if UpperCase(trim(vCons.campoAd)) =  'NOME CONTROLE' then
          begin
            vCons.campoAd := 'NOME_CTRL';
            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' controles.' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' controles.' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' controles.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ';
            Break;
          end
          else if UpperCase(trim(vCons.campoAd)) =  'UNIFICADA' then
          begin
            vCons.campoAd := 'IDENTIFICACAO_EMP';
            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' empresa.' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' empresa.' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' empresa.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ';
            Break;
          end
          else if (UpperCase(trim(vCons.campoAd)) =  'DESCRICAO CONTA')
          	or (UpperCase(trim(vCons.campoAd)) =  'COD CONTA CONTABIL') then
          begin
          	if (UpperCase(trim(vCons.campoAd)) =  'COD CONTA CONTABIL') then
          		vCons.campoAd := 'COD_CTA_CONTABIL'
            else
            	vCons.campoAd := 'DESC_PLC';

            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' p_contas.' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' p_contas.' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' p_contas.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ';
            Break;
          end
          else if UpperCase(trim(vCons.campoAd)) =  'DESCRICAO CONTA CONTABIL' then
          begin
            vCons.campoAd := 'NOME_CTA';
            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' p_contas_contabil.' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' p_contas_contabil.' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' p_contas_contabil.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ';
            Break;
          end
          else if UpperCase(trim(vCons.campoAd)) = 'DESCRICAO GRUPO CONTA' then
          begin
            vCons.campoAd := 'DESC_GR';
            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' grupos_ct.' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' grupos_ct.' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' grupos_ct.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ';
            Break;
          end
          else if UpperCase(trim(vCons.campoAd)) = 'DESCRICAO DEPARTAMENTO CONTA' then
          begin
            vCons.campoAd := 'DESC_DEP';
            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' depart_ct.' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' depart_ct.' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' depart_ct.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ';
            Break;
          end
          else if UpperCase(trim(vCons.campoAd)) = 'STATUS FATURAMENTO' then
          begin
            vCons.campoAd := 'STATUS_F';
            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' tipo_faturamento.' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' tipo_faturamento.' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' tipo_faturamento.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ';
            Break;
          end
        	else if (UpperCase(trim(vCons.campoAd)) = 'CEP')
            or (UpperCase(trim(vCons.campoAd)) = 'ENDERECO')
            or (UpperCase(trim(vCons.campoAd)) = 'NUM END CLIENTE')
            or (UpperCase(trim(vCons.campoAd)) = 'COMPLEMENTO')
            or (UpperCase(trim(vCons.campoAd)) = 'FONE CLIENTE')
            or (UpperCase(trim(vCons.campoAd)) = 'CELULAR')
            or (UpperCase(trim(vCons.campoAd)) = 'EMAIL')
            or (UpperCase(trim(vCons.campoAd)) = 'COD LOCALIDADE') then
          begin
          	if (UpperCase(trim(vCons.campoAd)) = 'CEP') then
          		vCons.campoAd := 'CEP'
            else if (UpperCase(trim(vCons.campoAd)) = 'ENDERECO') then
          		vCons.campoAd := 'ENDERECO'
            else if (UpperCase(trim(vCons.campoAd)) = 'NUM END CLIENTE') then
          		vCons.campoAd := 'NUM_END_CLIENTE'
            else if (UpperCase(trim(vCons.campoAd)) = 'COMPLEMENTO') then
          		vCons.campoAd := 'COMPLEMENTO'
            else if (UpperCase(trim(vCons.campoAd)) = 'FONE CLIENTE') then
          		vCons.campoAd := 'FONE_CLIENTE'
            else if (UpperCase(trim(vCons.campoAd)) = 'CELULAR') then
          		vCons.campoAd := 'FONE_CELULAR'
            else if (UpperCase(trim(vCons.campoAd)) = 'EMAIL') then
          		vCons.campoAd := 'EMAIL'
            else if (UpperCase(trim(vCons.campoAd)) = 'COD LOCALIDADE') then
          		vCons.campoAd := 'COD_LOCALIDADE';

            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' clientes.' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' clientes.' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' clientes.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ';
            Break;
          end
          else if (UpperCase(trim(vCons.campoAd)) = 'COD SETOR')
          	or (UpperCase(trim(vCons.campoAd)) = 'LOCALIDADE')  then
          begin
          	if (UpperCase(trim(vCons.campoAd)) = 'COD SETOR') then
            	vCons.campoAd := 'COD_SETOR'
            else if (UpperCase(trim(vCons.campoAd)) = 'LOCALIDADE') then
            	vCons.campoAd := 'LOCALIDADE';

            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' localidade.' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' localidade.' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' localidade.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ';
            Break;
          end
          else if (UpperCase(trim(vCons.campoAd)) = 'SETOR') then
          begin
            vCons.campoAd := 'SETOR';

            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' setor.' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' setor.' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' setor.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ';
            Break;
          end
          else if UpperCase(trim(vCons.campoAd)) = 'ESTADO CLIENTE' then
          begin
            vCons.campoAd := 'SIGLA_UF';
            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' estados.' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' estados.' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' estados.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ';
            Break;
          end
          else if UpperCase(trim(vCons.campoAd)) = 'CIDADE CLIENTE' then
          begin
            vCons.campoAd := 'NOME_CIDADE';
            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' cidades.' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' cidades.' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' cidades.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ';
            Break;
          end
          else if UpperCase(trim(vCons.campoAd)) = 'BAIRRO CLIENTE' then
          begin
            vCons.campoAd := 'NOME_BAIRRO';
            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' bairros.' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%')
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' bairros.' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
            else
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' bairros.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ';
            Break;
          end
          else if UpperCase(trim(vCons.campoAd)) = 'NUM DOC VND' then
          begin
            vCons.campoAd := 'NUM_REC_DEP';
            vCampoTempAd := 'N_DOC_V';
            if vCons.condicaoAd = 'like' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' ((recibos.' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%') +
                ' and not recibos.nrecibo is null) or (controle_cheque.' + vCampoTempAd + ' like ' +  QuotedStr('%' +  vDadosIni.IfThen(vDadosIni.apenasNumeros(vCons.valorAd) = '', '0', vDadosIni.apenasNumeros(vCons.valorAd)) + '%') +
                ' and recibos.nrecibo is null))'
            else if vCons.condicaoAd = 'Começa' then
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' ((recibos.' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%') +
                ' and not recibos.nrecibo is null) or (controle_cheque.' + vCampoTempAd + ' like ' +  QuotedStr(vDadosIni.IfThen(vDadosIni.apenasNumeros(vCons.valorAd) = '', '0', vDadosIni.apenasNumeros(vCons.valorAd)) + '%') +
                ' and recibos.nrecibo is null))'
            else
              vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
              	' ((recibos.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ' + QuotedStr(vCons.valorAd)+
                ' and not recibos.nrecibo is null) or (controle_cheque.' + vCampoTempAd + ' ' + vCons.condicaoAd + ' ' + QuotedStr(vDadosIni.IfThen(vDadosIni.apenasNumeros(vCons.valorAd) = '', '0', vDadosIni.apenasNumeros(vCons.valorAd))) +
                ' and recibos.nrecibo is null))';
          end;
        end;
      end;
    end; //adicional

  if trim(vTipoE) <> '' then
    vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
        ' coalesce(p_contas.tipo_ctp, '''') not in (' + vTipoE + ')';

  if FRecebendo then
    dataSet.PacketRecords := -1
  else
    dataSet.PacketRecords := 1000;

  if vCons.porData then
    Result := ConsultaCampos('CONTROLE_CHEQUE', vCons.Campo, vCons.Ordem, vCons.dataIni, vCons.dataFim, vDadosIni.codEmpresa, 1,
      Fsql_campos,
      Fsql_inner +
      ' left join retorna_pag_ch (controle_cheque.lote_quit, controle_cheque.datq_ch, ' + vDadosIni.codEmpresa + ',' +
      	vDadosIni.IfThen((vCons.verFormas) or (trim(vFormPag) <> ''), '1,', '0,') + QuotedStr(vFormPag) + ') on 1 = 1 ',
      vsqlAdicional +
      vDadosIni.IfThen(trim(vFormPag) <> '',
        vDadosIni.IfThen(trim(vSqlAdicional) <> '',
          ' and ', '') + ' retorna_pag_ch.encontrou > 0 ', ''),
      vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
        ' (case when (empresa.financeiro_unificado = ''S'') then ' +
        '         empresa.codigo_unificadora ' +
        '		 else ' +
        '		   controle_cheque.codigo_emp ' +
        ' end) ',
        ''))
  else
    Result := ConsultaCampos('CONTROLE_CHEQUE', vCons.valor, vCons.Campo, vCons.Condicao, vCons.Ordem, True, vDadosIni.codEmpresa,
      Fsql_campos,
      Fsql_inner +
      ' left join retorna_pag_ch (controle_cheque.lote_quit, controle_cheque.datq_ch, ' + vDadosIni.codEmpresa + ',' +
      	vDadosIni.IfThen((vCons.verFormas) or (trim(vFormPag) <> ''), '1,', '0,') + QuotedStr(vFormPag) + ') on 1 = 1 ',
      vsqlAdicional +
      vDadosIni.IfThen(trim(vFormPag) <> '',
        vDadosIni.IfThen(trim(vSqlAdicional) <> '',
          ' and ', '') + ' retorna_pag_ch.encontrou > 0 ', ''),
      vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
        ' (case when (empresa.financeiro_unificado = ''S'') then ' +
        ' 		   empresa.codigo_unificadora ' +
        '		 else ' +
        '			controle_cheque.codigo_emp ' +
        ' end) ',
        ''));

  finally

  end;
end;

procedure TControleCheque._corrigir;
var
  vTxJuros: Real;
begin
  vTxJuros := (vDadosIni.getDataBanco(buscas) - dataSet.FieldByName('data_venc').AsDateTime) *
    (vDadosIni.vEmp.vTxJuros / 30);
  dataSet.Edit;
  dataSet.FieldByName('VALOR_CORR').AsFloat :=
    dataSet.FieldByName('VALOR_CH').AsFloat + (((dataSet.FieldByName('VALOR_CH').AsFloat *
    vTxJuros) / 100) +
    ((dataSet.FieldByName('VALOR_CH').AsFloat * vDadosIni.vEmp.vMultas) / 100));
  dataSet.FieldByName('VALOR_DESC').AsFloat := 0;
  dataSet.FieldByName('VALOR_ACRESC').AsFloat := 0;
  dataSet.FieldByName('VALOR_CORR').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VALOR_CORR').AsFloat, 2);
  dataSet.Post;

  vDadosIni.GravaAuditoria('CAR037', 'ALTERAR',
  	' COD CH' + dataSet.FieldByName('CODIGO_CH').AsString +
    ' NUM CH' + Trim(dataSet.FieldByName('N_CH').AsString) +
    ' VALOR ' + Format('%0.2f', [dataSet.FieldByName('VALOR_CH').AsFloat]) +
    ' CORRIGIDO ' + Format('%0.2f', [dataSet.FieldByName('VALOR_CORR').AsFloat]), FTable,
    dataSet.FieldByName('CODIGO_CH').AsString + '/' + Trim(dataSet.FieldByName('N_CH').AsString),
    FBuscas2);
end;

function TControleCheque._corrigirValor(pSomenteSelecionados: Boolean; pConsDesAcres: Boolean = true; pExibirMensagem: boolean = true): Boolean;
var
  vPointer: Pointer;
  vSomenteSelecionado: Boolean;

begin
	Result := false;
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CAR037', 'ALTERAR', '', FTable, '', FBuscas2, True) then
    Exit;

  if not pSomenteSelecionados then
  begin
    if (dataSet.FieldByName('DATA_VENC').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros) <
      vDadosIni.getDataBanco(buscas) then
      _corrigir
    else if vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_CH').AsFloat, 2) > 0 then
    begin
      dataSet.Edit;
      dataSet.FieldByName('VALOR_CORR').AsFloat :=
        vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_CH').AsFloat, 2);
      dataSet.Post;
    end;
  end
  else
  begin
  	vSomenteSelecionado := false;
  	if not pExibirMensagem then
    	vSomenteSelecionado := true
    else if (dataSet.Filtered) and (Pos('SEL = ''S''', dataSet.Filter) > 0) then
	  	vSomenteSelecionado := true
    else
      vSomenteSelecionado := Application.MessageBox('Somente cheques selecionados?', 'Confirmação',
        MB_ICONQUESTION + MB_YESNO) = IDYES;

    try
    	vPointer := dataSet.GetBookmark;
    	dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if (dataSet.FieldByName('SEL').AsString = 'S') or (not vSomenteSelecionado) then
          if (dataSet.FieldByName('DATA_VENC').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros) <
            vDadosIni.getDataBanco(buscas) then
          begin
            if (_documentoRecebidoOuSendoRecebido) then
            begin
              _desmarcaLinha;
              if pExibirMensagem then
                Application.MessageBox(pchar('Correção de valor para este documento não será efetuada.'),
                  'Atenção', 0 + 64);
            end
            else
              _corrigir
          end
          else if vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_CH').AsFloat, 2) > 0 then
          begin
            if (_documentoRecebidoOuSendoRecebido) then
            begin
              _desmarcaLinha;
              if pExibirMensagem then
                Application.MessageBox(pchar('Correção de valor para este documento não será efetuada.'),
                  'Atenção', 0 + 64);
            end
            else
            begin
              dataSet.Edit;
              dataSet.FieldByName('VALOR_CORR').AsFloat :=
                vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_CH').AsFloat, 2);
              dataSet.Post;
            end;
          end;

        dataSet.Next;
      end;
    finally
    	dataSet.First;
      dataSet.GotoBookmark(vPointer);
    	dataSet.EnableControls;
    end;
  end;
  if dataSet.ChangeCount = 0 then
  begin
    Result := False;
    vDadosIni.GravaAuditoria('CAR037', 'ALTERAR', 'SEM REGISTROS MODIFICADOS', FTable, '', buscas);
  end
  else if Apply then
  begin
    CommitaTransacao;
    Result := True;
    vDadosIni.GravaAuditoria('CAR037', 'ALTERAR', 'SUCESSO MODIFICACOES', FTable, '', buscas);
  end
  else
  begin
    RollBackTransacao;
    Result := False;
    vDadosIni.GravaAuditoria('CAR037', 'ALTERAR', 'FALHA MODIFICACOES', FTable, '', buscas);
  end;
end;

function TControleCheque._gerarBoletoCreditos(pCodCreditos: string; pLoteBaixa: Integer): Boolean;
begin
	Result := False;
  Application.MessageBox('Opção não disponível para Cheques', 'Atenção', 0 + 64);
end;

function TControleCheque._gerarCarne(pGerarCarne: boolean; pUsarValorCorrigido: boolean; pExibirMensagemGerarBoleto: boolean): Boolean;
begin
  Result := False;
  Application.MessageBox('Opção não disponível para Cheques', 'Atenção', 0 + 64);
end;

function TControleCheque._getDataUltimaVenda(pTipoVenda: string;
  pNumVenda: Integer): string;
begin
  Result := '';
  if Trim(pTipoVenda) = '' then
    Exit;

  if pNumVenda = 0 then
    Exit;

  Result := retornaValor('select first 1 data_venda as valor from controle_cheque' +
    ' where tp_doc_v = ' + QuotedStr(Trim(pTipoVenda)) +
    ' and n_doc_v = ' + IntToStr(pNumVenda) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa);
end;

function TControleCheque._impressaoDeRecibo: Boolean;
begin
  Result := False;
  Application.MessageBox('Sem impressão de recibos para cheques', 'Atenção', 0 + 64);
end;

function TControleCheque._informarDadosTransacaoCartao(pTipo: Integer): Boolean;
begin
  Result := False;
  Application.MessageBox('Opção não disponível para Cheques', 'Atenção', 0 + 64);
end;

function TControleCheque._informarDataPrevRec: Boolean;
var
  vDtAnt: string;
  vCodigoCH: string;
  vListaClBarrarDesbarrar: TStringList;
  vQtdeReg: Integer;
  I: Integer;
  vDataPrevRecMenor: Boolean;
begin
  try
    vListaClBarrarDesbarrar := TStringList.Create;
    vListaClBarrarDesbarrar.Sorted := True;
    vListaClBarrarDesbarrar.Duplicates := dupIgnore;
    vListaClBarrarDesbarrar.Clear;

    Result := False;

    if dataSet.IsEmpty then
      Exit;

    if not vDadosIni.PesqPros('CAR111', 'ALTERAR', '',
      FTable, '', buscas, True) then
      exit;

    try
      try
        vCodigoCH := dataSet.FieldByName('CODIGO_CH').AsString;

        vQtdeReg := 1;

        prepare_loop('Sel = ''S''');
        if not dataset.IsEmpty then
        begin
          vQtdeReg := dataSet.RecordCount;

          vCodigoCH := '';
        end;

      finally
        prepare_loop_done;
      end;

      if not _abreFormDataPrevRec(vQtdeReg) then
        Exit;

      try
        if (trim(vCodigoCH) <> '') then
          prepare_loop('CODIGO_CH = ' + vCodigoCH)
        else
          prepare_loop('Sel = ''S''');

        vDataPrevRecMenor := False;
        dataSet.first;
        while not dataSet.EOF do
        begin
        	if FDataPrevRec > 0 then
      	  	if dataSet.FieldByName('data_venc').AsDateTime > FDataPrevRec then
            begin
            	vDataPrevRecMenor := True;
              Break;
            end;

        	dataSet.Next;
        end;

      	if vDataPrevRecMenor then
        begin
          if not vDadosIni.PesqPros('CAR109', 'PERMITIR', '',
            'CONTROLE_CHEQUE', '', buscas, True) then
              Exit;
        end;


        dataSet.first;
        while not dataSet.EOF do
        begin
          vDtAnt := dataSet.FieldByName('DATA_PREV_REC').AsString;

          if ((vDadosIni.vCliente.Barramento.vBarraAutomaticamenteAposVencCrediario = 'S')
              and (vDadosIni.vCliente.Barramento.vCodigoBarrado > 0))
            or ((vDadosIni.vCliente.Barramento.vDesbarraAutomaticamenteAposQuitCrediario = 'S')
              and (vDadosIni.vCliente.Barramento.vCodigoDesbarrado > 0)) then
          begin
          	if (dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
            begin
              if (vDadosIni.vEmp.vFinanceiroUnificado)
                and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
              begin
                if trim(dataSet.FieldByName('CPFCGC').AsString) <> '' then
                  vListaClBarrarDesbarrar.Add(trim(dataSet.FieldByName('CPFCGC').AsString));
              end
              else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
                vListaClBarrarDesbarrar.Add(IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger));
            end;
          end;

          dataSet.Edit;
          if FDataPrevRec = 0 then
          	dataSet.FieldByName('DATA_PREV_REC').Value := Null
          else
          	dataSet.FieldByName('DATA_PREV_REC').AsDateTime := FDataPrevRec;
          dataSet.Post;

          if not dataSet.FieldByName('data_prev_rec').IsNull then
            if dataSet.FieldByName('data_venc').AsDateTime > dataSet.FieldByName('data_prev_rec').AsDateTime then
            begin
            	vDadosIni.GravaAuditoria('CAR109', 'PERMITIR', ' NUM CH' + Trim(dataSet.FieldByName('N_CH').AsString),
              	'CONTROLE_CHEQUE',
                IntToStr(dataSet.FieldByName('CODIGO_CH').AsInteger) + '/' + Trim(dataSet.FieldByName('N_CH').AsString), buscas);
            end;

          vDadosIni.GravaAuditoria('CAR111', 'ALTERAR',
          	' CODIGO: ' + IntToStr(dataSet.FieldByName('CODIGO_CH').AsInteger) +
            ' DATA PREV REC ANT: ' + vDtAnt +
            ' DATA PREV REC AT: ' + dataSet.FieldByName('DATA_PREV_REC').AsString, FTable,
            IntToStr(dataSet.FieldByName('CODIGO_CH').AsInteger) + '/' + Trim(dataSet.FieldByName('N_CH').AsString), buscas);

          dataSet.next;
        end;
      finally
        vDadosIni.fechaStatusProcessamento;
        prepare_loop_done;
      end;

      if dataSet.ChangeCount = 0 then
        exit;

      Apply;
      CommitaTransacao;
      Result := True;

      vDadosIni.GravaAuditoria('CAR111', 'ALTERAR', 'CONFIRMADA MODIFICACOES', FTable, '', buscas);

    except
      on e: exception do
      begin
        RollBackTransacao;
        dataSet.Refresh;
        Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('function TControleCheque._informarDataPrevRec. Erro: ' + e.Message);
      end;
    end;
  finally
  	if vListaClBarrarDesbarrar.Count > 0 then
    begin
      for I := 0 to vListaClBarrarDesbarrar.Count - 1 do
      begin
        if trim(vListaClBarrarDesbarrar[I]) <> '' then
        begin
          if vDadosIni.vEmp.vFinanceiroUnificado then
            vDadosIni.negativarClientes(0, trim(vListaClBarrarDesbarrar[I]))
          else
            vDadosIni.negativarClientes(StrToInt(vListaClBarrarDesbarrar[I]), '');
        end;
      end;
    end;

    if Assigned(vListaClBarrarDesbarrar) then
      FreeAndNil(vListaClBarrarDesbarrar);
  end;
end;

function TControleCheque._informarDataRealBaixa: Boolean;
begin
  Result := False;
  Application.MessageBox('Opção não disponível para Cheques', 'Atenção', 0 + 64);
end;

function TControleCheque._informarObservacaoParaCxl(pObs: string = ''; pRegistroAtual: Boolean = False): Boolean;
begin
  Result := False;
  Application.MessageBox('Opção não disponível para Cheques', 'Atenção', 0 + 64);
end;

function TControleCheque._informarObservacoes: Boolean;
begin
  Result := False;
  Application.MessageBox('Opção não disponível para Cheques', 'Atenção', 0 + 64);
end;

function TControleCheque._efetuarRecebimento: Boolean;
var
  I, vIntegerTemp: Integer;
  vOK: Boolean;
  vdtSetTemp: TClientDataSet;
  vDocsTemp: string;
  vNegCliente: TNegativacaoCliente;
  vListaDemarcados: TStringList;
  idConta: Integer;
  vListaClBarrarDesbarrar: TStringList;

{$REGION '_validarMarcarItemParaRecebimento'}
  function _validarMarcarItemParaRecebimento: Boolean;
  var
  	vOKValidacao: Boolean;
    vExisteCtrl: Boolean;
    Z: Integer;
  begin
    Result := False;
//    dataSet.RefreshRecord;
    _marcaLinha;
    vOKValidacao := True;

    if (dataSet.FieldByName('SEL').AsString = 'S') and (vOKValidacao) then
    begin
      if dadosReceber.codigoUnificada = 0 then
        dadosReceber.codigoUnificada := dataSet.FieldByName('cod_emp_mult').AsInteger
      else if dadosReceber.codigoUnificada <> dataSet.FieldByName('cod_emp_mult').AsInteger then
      begin
      	vOKValidacao := False;
      	vListaDemarcados.Add(IntToStr(dataSet.FieldByName('CODIGO_CH').AsInteger));
//        _desmarcaLinha;
        if Application.MessageBox(pchar('Documento selecionado pertence a Unificada: ' +
          dataSet.FieldByName('cod_emp_mult').AsString +
          ' diferente dos demais selecionados: ' + IntToStr(dadosReceber.codigoUnificada)
          + #13 +
          'Se continuar o documento será desmarcado. Deseja continuar mesmo assim?'),
          'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          Exit;
      end;
    end;

//    if (dataSet.FieldByName('SEL').AsString = 'S') and (vOKValidacao) then
//    begin
//      if dadosReceber.codigoControleSelecionados = 0 then
//        dadosReceber.codigoControleSelecionados := dataSet.FieldByName('codigo_ctrl').AsInteger
//      else if dadosReceber.codigoControleSelecionados <> dataSet.FieldByName('codigo_ctrl').AsInteger then
//      begin
//      	vOKValidacao := False;
//        vListaDemarcados.Add(IntToStr(dataSet.FieldByName('CODIGO_CH').AsInteger));
////        _desmarcaLinha;
//        if Application.MessageBox(pchar('Documento selecionado controle: ' +
//          dataSet.FieldByName('codigo_ctrl').AsString +
//          ' diferente dos demais selecionados: ' + IntToStr(dadosReceber.codigoControleSelecionados)
//          + #13 +
//          'Se continuar o documento será desmarcado. Deseja continuar mesmo assim?'),
//          'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
//          Exit;
//      end;
//    end;

  	if (dataSet.FieldByName('SEL').AsString = 'S') and (vOKValidacao) then
    begin
    	if dadosReceber.codigoControleSelecionados = 0 then
        dadosReceber.codigoControleSelecionados := dataSet.FieldByName('codigo_ctrl').AsInteger;

      vExisteCtrl := False;
      for Z := Low(dadosReceber.codigosControleLanc) to High(dadosReceber.codigosControleLanc) do
        if (dadosReceber.codigosControleLanc[Z] = dataSet.FieldByName('codigo_ctrl').AsInteger) then
        begin
        	dadosReceber.historicoLanc[Z] :=
          	dadosReceber.historicoLanc[Z] + ' ' + Trim(dataSet.FieldByName('n_ch').AsString) + ' ';

          dadosReceber.valorLancSaida[Z] :=
            dadosReceber.valorLancSaida[Z] + dataSet.FieldByName('valor_ch').AsCurrency;

          vExisteCtrl := True;
          Break;
        end;

      if not vExisteCtrl then
      begin
        SetLength(dadosReceber.codigosControleLanc, Length(dadosReceber.codigosControleLanc) + 1);
        SetLength(dadosReceber.historicoLanc, Length(dadosReceber.codigosControleLanc));
        SetLength(dadosReceber.valorLancSaida, Length(dadosReceber.codigosControleLanc));

        dadosReceber.codigosControleLanc[High(dadosReceber.codigosControleLanc)] :=
        	dataSet.FieldByName('codigo_ctrl').AsInteger;

        dadosReceber.historicoLanc[High(dadosReceber.historicoLanc)]             :=
        	dadosReceber.historicoSaidaLancamentoIni + ' ' + Trim(dataSet.FieldByName('n_ch').AsString) + ' ';

        dadosReceber.valorLancSaida[High(dadosReceber.valorLancSaida)]           :=
        	dataSet.FieldByName('valor_ch').AsCurrency;
      end;
    end;

    if (_documentoRecebidoOuSendoRecebido) and (vOKValidacao) then
    begin
      vOKValidacao := False;
    	vListaDemarcados.Add(IntToStr(dataSet.FieldByName('CODIGO_CH').AsInteger));
//      _desmarcaLinha;
      if
        Application.MessageBox(pchar('Se continuar o documento será desmarcado. Deseja continuar mesmo assim?'),
        'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;
    end;

    if (dataSet.FieldByName('SEL').AsString = 'S') and (vOKValidacao) then
    begin

      fRemoverDesconto := False;
      _corrigirValor(False);

      if (not dadosReceber.referenteDevolucao) then
      begin
        if (dadosReceber.usarValorCorrigido) and (dataSet.FieldByName('valor_corr').AsCurrency <= 0) then
        begin
        	vOKValidacao := False;
          vListaDemarcados.Add(IntToStr(dataSet.FieldByName('CODIGO_CH').AsInteger));
//          _desmarcaLinha;
          if
            Application.MessageBox(pchar('Valor para recebimento menor ou igual a zero (Valor Corrigido). Documento: ' +
            Trim(dataSet.FieldByName('n_ch').AsString) + #13 +
            'Se continuar o documento será desmarcado. Deseja continuar mesmo assim?'),
            'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
            Exit;
        end
        else if (not dadosReceber.usarValorCorrigido) and (dataSet.FieldByName('valor_ch').AsCurrency
          <= 0) then
        begin
      	  vOKValidacao := False;
        	vListaDemarcados.Add(IntToStr(dataSet.FieldByName('CODIGO_CH').AsInteger));
//          _desmarcaLinha;
          if
            Application.MessageBox(pchar('Valor para recebimento menor ou igual a zero (Valor Crédito). Documento: ' +
            Trim(dataSet.FieldByName('n_ch').AsString) + #13 +
            'Se continuar o documento será desmarcado. Deseja continuar mesmo assim?'),
            'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
            Exit;
        end;
      end;

    end;

    if (dataSet.FieldByName('SEL').AsString = 'S') and (vOKValidacao) then
    begin

      dataSet.Edit;
      dataSet.FieldByName('STATUS_CX').AsString := 'R';
      dataSet.FieldByName('OP_CX').AsInteger := vDadosIni.vCodUsuario;
      dataSet.Post;

      if Apply then
      begin
        CommitaTransacao;

        if (dadosReceber.usarValorCorrigido) and (dataSet.FieldByName('valor_corr').AsCurrency > 0) then
          dadosReceber.valorOperacao := dadosReceber.valorOperacao +
            dataSet.FieldByName('valor_corr').AsCurrency
        else
          dadosReceber.valorOperacao := dadosReceber.valorOperacao +
            dataSet.FieldByName('valor_ch').AsCurrency;

        dadosReceber.valorPrevisto := dadosReceber.valorPrevisto +
        	dataSet.FieldByName('valor_ch').AsCurrency;

        dadosReceber.valorSaida := dadosReceber.valorSaida +
          dataSet.FieldByName('valor_ch').AsCurrency;

        dadosReceber.historicoSaidaLancamento := dadosReceber.historicoSaidaLancamento + ' ' +
          Trim(dataSet.FieldByName('n_ch').AsString) + ' ';

        dadosReceber.somaValorContabil := dadosReceber.somaValorContabil +
          dataSet.FieldByName('vl_contabil').AsCurrency;
      end
      else
      begin

        dataSet.Cancel;
				vOKValidacao := False;
      	vListaDemarcados.Add(IntToStr(dataSet.FieldByName('CODIGO_CH').AsInteger));
//        _desmarcaLinha;
        if
          Application.MessageBox(pchar('Erro ao tentar marcar documento para recebimento. Documento: '
          +
          Trim(dataSet.FieldByName('n_ch').AsString) + #13 +
          'Se continuar o documento será desmarcado. Deseja continuar mesmo assim?'),
          'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          Exit;
      end;

    end;
    Result := True;

  end;
{$ENDREGION}

begin
  try
    vListaClBarrarDesbarrar := TStringList.Create;
    vListaClBarrarDesbarrar.Sorted := True;
    vListaClBarrarDesbarrar.Duplicates := dupIgnore;
    vListaClBarrarDesbarrar.Clear;

    if dataSet.IsEmpty then
      Exit;

    if dadosReceber.baixaParcial then
    begin
      Application.MessageBox(pchar('Operação inválida para cheques'), 'Atenção', 0 + 64);
      Result := False;
      Exit;
    end;

    if not vDadosIni.PesqPros('CAR034', 'RECEBER', '', FTable, '', FBuscas2, True) then
      Exit;

    if ((vDadosIni.vCliente.Barramento.vBarraAutomaticamenteAposVencCrediario = 'S')
    		and (vDadosIni.vCliente.Barramento.vCodigoBarrado > 0))
    	or ((vDadosIni.vCliente.Barramento.vDesbarraAutomaticamenteAposQuitCrediario = 'S')
      	and (vDadosIni.vCliente.Barramento.vCodigoDesbarrado > 0)) then
    begin
      try
        dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
          if (dataSet.FieldByName('SEL').AsString = 'S')
          	and (dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
          begin
            if (vDadosIni.vEmp.vFinanceiroUnificado)
            	and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
            begin
            	if trim(dataSet.FieldByName('CPFCGC').AsString) <> '' then
              	vListaClBarrarDesbarrar.Add(trim(dataSet.FieldByName('CPFCGC').AsString));
            end
            else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
              vListaClBarrarDesbarrar.Add(IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger));
          end;

          dataSet.Next;
        end;
      finally
        dataSet.EnableControls;
      end;
    end;

    dadosReceber.valorOperacao := 0;
    dadosReceber.valorPrevisto := 0;
    dadosReceber.valorSaida := 0;
    dadosReceber.historicoSaida := '';
    dadosReceber.codigoControleSelecionados := 0;
    dadosReceber.codigoEmpresa := 0;
    dadosReceber.codigoUnificada := 0;
    dadosReceber.valorAtingido := 0;
    dadosReceber.valorDinheiro := 0;
    dadosReceber.valorCheque := 0;
    dadosReceber.valorCredito := 0;
    dadosReceber.valorRecibos := 0;
    dadosReceber.valorAtingido := 0;
    dadosReceber.baixaParcial := False;
    dadosReceber.lancarTaxaCartao := False;
    dadosReceber.somaValorContabil := 0;
    dadosReceber.referenteCTP := False;

    SetLength(dadosReceber.codigosControleLanc, 0);
    SetLength(dadosReceber.historicoLanc, 0);
    SetLength(dadosReceber.valorLancSaida, 0);

    dadosReceber.referenteDevolucao := Application.MessageBox('Baixa Ref. Devolucao de Mercadoria?',
      'Confirmação',
      MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES;
    if not dadosReceber.referenteDevolucao then
    begin

      dadosReceber.historicoSaidaLancamentoIni := 'SAIDA CHQ/CREDITOS ';
      dadosReceber.historicoSaidaLancamento    := dadosReceber.historicoSaidaLancamentoIni;

      try
        dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
          if dataSet.FieldByName('sel').AsString = 'S' then
          begin
            dadosReceber.nomeHistoricoSaida := Trim(dataSet.FieldByName('NOME_CH').AsString);
            Break;
          end;
          dataSet.Next;
        end;
      finally
        dataSet.EnableControls;
      end;

      vDadosIni.definirDiaFinanceiroFechado(buscas);
      if not _abreFormDadosParaBaixa then
      begin
        Result := False;
        Exit;
      end;
    end
    else
    begin
      try
        dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
          if dataSet.FieldByName('sel').AsString = 'S' then
          begin
            dadosReceber.nomeHistoricoSaida := Trim(dataSet.FieldByName('NOME_CH').AsString);
            Break;
          end;
          dataSet.Next;
        end;
      finally
        dataSet.EnableControls;
      end;

      dadosReceber.historicoSaidaLancamentoIni := 'DEVOLUCAO VENDA ';
      dadosReceber.historicoSaidaLancamento    := dadosReceber.historicoSaidaLancamentoIni;

      vDadosIni.abreForm('Selecione os dados para saída', frmCadContasAReceber.pnDadosBaixaDevolv, frmCadContasAReceber.tsDesconto);

      if not vDadosIni.PesqPros('CAR064', 'RECEBER', '', FTable, '', FBuscas2, True) then
        Exit;
    end;

    vDadosIni.abreStatusProcessamento('', 'Iniciando variaveis');

    if vReceb = nil then
      vReceb := TRecebimento.create;

    _definirDataSetRecebimento;
    fRecebimento.EmptyDataSet;

    vReceb.vCh.dataSet := TClientDataSet(fRecebimento);
    vReceb.vCr.dataSet := TClientDataSet(fRecebimento);

    _definirContasDeSaida;
    conta.dadosReceber.historicoSaida := 'ENTRADA DINHEIRO CONFORME CREDITO ACIMA';

    try

      try
        vdtSetTemp := dataSet;

        vDadosIni.abreStatusProcessamento('', 'Somando valores e marcando registros');

  {$REGION 'soma e validacao dos registros'}
        //if not dadosReceber.referenteDevolucao then
        begin
          vListaDemarcados := TStringList.Create;
          vListaDemarcados.Clear;

          try
            dataSet.DisableControls;
            dataSet.First;
            while not dataSet.Eof do
            begin
              if (dataSet.FieldByName('SEL').AsString = 'S') then
                if not _validarMarcarItemParaRecebimento then
                  Exit;

              dataSet.Next;
            end;
          finally
            dataSet.EnableControls;
          end;

          try
            for I := 0 to vListaDemarcados.Count - 1 do
              if (Trim(vListaDemarcados[i]) <> '') and (TryStrToInt(vListaDemarcados[i], vIntegerTemp)) then
              begin
                dataSet.Filter := 'CODIGO_CH = ' + Trim(vListaDemarcados[i]);
                dataSet.Filtered := true;

                _desmarcaLinha;

              end;
          finally
            dataSet.Filtered := False;
            dataSet.Filter := '';
          end;
        end;

        dadosReceber.valorAInformar := dadosReceber.valorOperacao;

        if not dadosReceber.referenteDevolucao then
          if dadosReceber.valorOperacao <= 0 then
            raiseExceptionCreate('Nenhum registro foi selecionado!', '');

  {$ENDREGION}

        if not dadosReceber.referenteDevolucao then
        begin
          idConta := fint('CODIGO_CH');
          verificaRecibo;
          dataSet.Locate('CODIGO_CH', idConta, []);
        end;
        vReceb.vRecibo._selecionaRecibosAtencipados(dadosReceber.codigoUnificada);

        vDadosIni.fechaStatusProcessamento;

        vReceb.vCh.dadosReceber.codigoUnificada := dadosReceber.codigoUnificada;
        vReceb.vCr.dadosReceber.codigoUnificada := dadosReceber.codigoUnificada;

  {$REGION 'abertura do formulario'}


        if not dadosReceber.referenteDevolucao then
        begin
          vCtrl._abreTodosControlesCAR(false, dadosReceber.codigoUnificada);
          vCtrl.dataSet.First;
          vPCont._abrePContasLanc('S');

          vReceb.vCh.DataSource.DataSet := fRecebimento;
          vReceb.vCr.DataSource.DataSet := fRecebimento;
          FDataSource.DataSet := fRecebimento;
          dataSet := fRecebimento;

          vOK := _abreFormReceber;
        end
        else
          vOK := True;

  {$ENDREGION}

        vDadosIni.abreStatusProcessamento('', 'Quitando documentos selecionados');

  {$REGION 'chamada de metodos para baixa dos documentos'}

        if not vOK then
          Exit;

        vDadosIni.abreStatusProcessamento('', 'Quitando documentos selecionados');

        dataSet := vdtSetTemp;

        vReceb.create;
        Self.create;

        vDadosIni.definirDiaFinanceiroFechado(buscas);

        try
          vLancL := TLancamentosImp.create;
          vContLigL := TContaLigacaoImp.create;

          vLancL._setTransactionComponentes(transacao);
          vContLigL._AbrirContadeLigacao(True);

          if not _quitarRegistrosSelecionados then
          begin
            RollBackTransacao;
            Exit;
          end;

          vDadosIni.abreStatusProcessamento('', 'Incluíndo entradas geradas pela quitação');

          if not _confirmarLancamentosRecebimento then
          begin
            RollBackTransacao;
            Exit;
          end;

          CommitaTransacao;
          Result := True;

          vDadosIni.GravaAuditoria('CAR034', 'RECEBER', 'SUCESSO NA QUITACAO', FTable, '', buscas);

        finally
          vLancL._setTransactionComponentes(nil);
          vContLigL.Free;
          vLancL.Free;

          vContLigL:= nil;
          vLancL := nil;
        end;

  {$ENDREGION}

        vDadosIni.abreStatusProcessamento('', 'Verificando remoção de negativação');

  {$REGION 'desnegativação de cliente'}

        if vDadosIni.vEmp.vUsarBarramento = 'S' then
        begin

          FBuscas2.Close;
          FBuscas2.SQL.Text := 'select distinct cod_cliente, cod_emp_mult from controle_cheque cc' +
            ' inner join controles c on cc.codigo_ctrl = c.codigo_ctrl and cc.codigo_emp = c.codigo_emp' +
            ' and c.barrar_automatico = ''S''' +
            ' where cc.codigo_emp = ' + vDadosIni.codEmpresa +
            ' and cc.datq_ch = :datq_c' +
            ' and cc.status_ch = ''QUITADO''' +
            ' union' +
            ' select distinct cod_cliente, cod_emp_mult from controle_creditos cc' +
            ' inner join controles c on cc.codigo_ctrl = c.codigo_ctrl and cc.codigo_emp = c.codigo_emp' +
            ' and c.barrar_automatico = ''S''' +
            ' where cc.codigo_emp = ' + vDadosIni.codEmpresa +
            ' and cc.datq_c = :datq_c' +
            ' and cc.status_c = ''QUITADO''';
          FBuscas2.ParamByName('datq_c').AsDate := vDadosIni.diaFFinanceiro + 1;
          FBuscas2.Open;

          while not FBuscas2.Eof do
          begin
            vNegCliente := TNegativacaoCliente.create(buscas.Transaction, FDocs);
            vNegCliente.dados.acao := naDesnegativa;
            vNegCliente.dados.alterarConta := False;
            vNegCliente.dados.codCliente := FBuscas2.FieldByName('cod_cliente').AsInteger; // cliente do cheque
            vNegCliente.dados.codigoUnificada := FBuscas2.FieldByName('cod_emp_mult').AsInteger;
            if not vNegCliente.executar then
              raiseExceptionCreate(vNegCliente.MsgErro, '');
            FBuscas2.Next;
          end;
          CommitaTransacao;

        end;

        try
          vLancL := TLancamentosImp.create;
          vLancL._setTransactionComponentes(transacao);
          if vDadosIni.vEmp.vFinanceiroUnificado then
          begin
            FBuscas2.Close;
            FBuscas2.SQL.Text := 'select cod_empresa from empresa';
            FBuscas2.Open;

            FBuscas2.First;
            while not FBuscas2.Eof do
            begin
              if vDadosIni.empresaEstaUnificada(FBuscas2.FieldByName('cod_empresa').AsInteger) then
                vLancL._verificarDesbarramentoCliente(FBuscas2.FieldByName('cod_empresa').AsInteger);
              FBuscas2.Next;
            end;
          end
          else
            vLancL._verificarDesbarramentoCliente(StrToInt(vDadosIni.codEmpresa));

          CommitaTransacao;

        finally
          vLancL._setTransactionComponentes(nil);
          vLancL.Free;
          vLancL := nil;
        end;

  {$ENDREGION}

        vDadosIni.fechaStatusProcessamento;

      finally

  {$REGION 'codigo finally'}

        vDadosIni.abreStatusProcessamento('', 'Finalizando. Aguarde');

        dataSet := vdtSetTemp;
        FDataSource.DataSet := dataSet;
        fRecebimento.Free;
        fRecebimento := nil;
        //remover o status de recebimento
        try
          dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
            if (dataSet.FieldByName('SEL').AsString = 'S') then
            begin
              dataSet.Edit;
              dataSet.FieldByName('STATUS_CX').Value := Null;
              dataSet.FieldByName('OP_CX').Value := Null;
              dataSet.Post;

              if Apply then
                CommitaTransacao
              else
              begin

                dataSet.Cancel;

                Application.MessageBox(pchar('Não foi possível desmarcar o documento do recebimento.'
                  + #13 +
                  'Efetue o estorno para desmarcar o documento'),
                  'Atenção', 0 + 64);
              end;

            end;

            dataSet.Next;
          end;
        finally
          dataSet.EnableControls;
        end;

        _consulta;

        vDadosIni.fechaStatusProcessamento;

  {$ENDREGION}

      end;
    except on E: Exception do
      begin
        RollBackTransacao;
        vDadosIni.GravaAuditoria('CAR034', 'RECEBER', 'FALHA NAS QUITACOES', FTable, '', buscas);
        Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('function TControleCheque._efetuarRecebimento. Erro: ' + e.Message);
        verificaErroDataSetOpen(E.Message);
      end;
    end;

  finally
    if vListaClBarrarDesbarrar.Count > 0 then
    begin
      for I := 0 to vListaClBarrarDesbarrar.Count - 1 do
      begin
        if trim(vListaClBarrarDesbarrar[I]) <> '' then
        begin
          if vDadosIni.vEmp.vFinanceiroUnificado then
            vDadosIni.negativarClientes(0, trim(vListaClBarrarDesbarrar[I]))
          else
            vDadosIni.negativarClientes(StrToInt(vListaClBarrarDesbarrar[I]), '');
        end;
      end;
    end;

    if Assigned(vListaClBarrarDesbarrar) then
      FreeAndNil(vListaClBarrarDesbarrar);
  end;
end;

function TControleCheque._modificarDataValorComissao: Boolean;
begin

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CAR052', 'ALTERAR', ' COD CH' +
    dataSet.FieldByName('CODIGO_CH').AsString +
    ' DATA ' + dataSet.FieldByName('DT_BAIXA_COMISSAO').AsString +
    ' VALOR ' + Format('%0.2f', [dataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat]), FTable,
    dataSet.FieldByName('CODIGO_CH').AsString + '/' + dataSet.FieldByName('N_CH').AsString,
    FBuscas2, True) then
    Exit;

  try

    dataSet.Edit;

    if dataSet.State = dsEdit then
      if _abreFormComissao then
      begin

        dataSet.Post;
        Apply;
        CommitaTransacao;

        vDadosIni.GravaAuditoria('CAR052', 'ALTERAR', 'SUCESSO' +
        	' COD CH' + dataSet.FieldByName('CODIGO_CH').AsString +
          ' DATA ' + dataSet.FieldByName('DT_BAIXA_COMISSAO').AsString +
          ' VALOR ' + Format('%0.2f', [dataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat]), FTable,
          dataSet.FieldByName('CODIGO_CH').AsString + '/' + dataSet.FieldByName('N_CH').OldValue,
          FBuscas2);

      end;
    dataSet.Cancel;

    vBx.dataSet.RefreshRecord;

  except
    on E: Exception do
    begin
      RollBackTransacao;
      Result := False;
      Application.MessageBox(pchar('Erro na operação. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TControleCheque._modificarDataValorComissao. Erro: ' + e.Message);
      verificaErroDataSetOpen(E.Message);
    end;
  end;

end;

function TControleCheque._mudarControleOuVoltarParaAtivo: Boolean;
var
  vMudarControle, vVoltarParaAtivo: Boolean;
  vHistorico, vCaptionForm, vCaptionPanel, vNomeControle, vOperacao: string;
  vCodEmpMult, I, vCodigoGenCodigo, vNumLoteQuitacao: Integer;
  vCodigoControleOr, vCodigoControleDest: Integer;
  vValorComissao, vValorComissaoGer: Extended;
  vNegCliente: TNegativacaoCliente;
  vCodMaxBaixaCred: Integer;
  vListaClBarrarDesbarrar: TStringList;
begin
  try
    vListaClBarrarDesbarrar := TStringList.Create;
    vListaClBarrarDesbarrar.Sorted := True;
    vListaClBarrarDesbarrar.Duplicates := dupIgnore;
    vListaClBarrarDesbarrar.Clear;

    Result := False;

    if dataSet.IsEmpty then
      Exit;


    if not vDadosIni.PesqPros('CAR017', 'INCLUIR', 'NUM CH ' +
      Trim(dataSet.FieldByName('N_CH').AsString) +
      ' ' + dataSet.FieldByName('NOME_CH').AsString + ' AG ' + dataSet.FieldByName('AGENCIA').AsString +
      ' CTA ' + dataSet.FieldByName('CONTA').AsString, FTable,
      dataSet.FieldByName('CODIGO_CH').AsString + '/' + dataSet.FieldByName('N_CH').AsString,
      FBuscas2, True) then
      Exit;

    if not vDadosIni.VerificarinicioFechFinan(buscas) then
      exit;

    if ((vDadosIni.vCliente.Barramento.vBarraAutomaticamenteAposVencCrediario = 'S')
    		and (vDadosIni.vCliente.Barramento.vCodigoBarrado > 0))
    	or ((vDadosIni.vCliente.Barramento.vDesbarraAutomaticamenteAposQuitCrediario = 'S')
      	and (vDadosIni.vCliente.Barramento.vCodigoDesbarrado > 0)) then
    begin
    	if (dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
      begin
        if (vDadosIni.vEmp.vFinanceiroUnificado)
          and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
        begin
        	if trim(dataSet.FieldByName('CPFCGC').AsString) <> '' then
          	vListaClBarrarDesbarrar.Add(trim(dataSet.FieldByName('CPFCGC').AsString));
        end
        else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
          vListaClBarrarDesbarrar.Add(IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger));
      end;
    end;

    vMudarControle := Trim(dataSet.FieldByName('STATUS_CH').AsString) = '';
    vVoltarParaAtivo := not vMudarControle;

    if vVoltarParaAtivo then
      if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'I', buscas) then
        Exit;

    if not vVoltarParaAtivo then
      if not vDadosIni.validarAcessoCadastrosEmpresas('CHEQUES', 'A', conta.buscas) then
        Exit;

    if vVoltarParaAtivo then
    begin
      if Application.MessageBox('Deseja Voltar Controle para o Ativo?', 'Confirmação',
        MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;
    end
    else if _documentoRecebidoOuSendoRecebido then
      Exit;

    vHistorico := '';
    if vMudarControle then
    begin
      vCaptionForm := 'Mudar Cheque para outro Controle';
      vCaptionPanel := 'Selecione o controle e informe o Histórico';
      vOperacao := 'MUDAR CONTROLE';
    end
    else
    begin
      vCaptionForm := 'Voltar Cheque para o Ativo';
      vCaptionPanel := 'Selecione o controle e informe o Histórico';
      vOperacao := 'VOLTAR PARA ATIVO';
    end;

    vDadosIni.definirDiaFinanceiroFechado(buscas);

    vCtrl._selecionaControle(dataSet.FieldByName('codigo_ctrl').AsInteger,
      dataSet.FieldByName('cod_emp_mult').AsInteger);

    vCodigoControleOr := dataSet.FieldByName('codigo_ctrl').AsInteger;
    vNomeControle := Trim(vCtrl.dataSet.FieldByName('nome_ctrl').AsString);
    vCodEmpMult := dataSet.FieldByName('cod_emp_mult').AsInteger;

    vCtrl._abreTodosControlesCAR(FDocs, 'S', vMudarControle, vCodigoControleOr, vCodEmpMult);

    if not _abreFormMudarControleOuVoltarParaAtivo(vCaptionForm, vCaptionPanel, vHistorico) then
      Exit;

    vHistorico := Trim(vHistorico + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, ' EMP: ' + vDadosIni.StrZero(dataSet.FieldByName('cod_emp_mult').AsInteger, 3), ''));

    // Variavel para selecionar o controle depois da desnegativacao
    vCodigoControleDest := vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger;

    if vCtrl.dataSet.FieldByName('barrar_automatico').AsString = 'S' then
      if dataSet.FieldByName('cod_cliente').AsInteger <= 0 then
      begin
        Application.MessageBox('Controle selecionado configurado para barramento automático. Cheque não possui cliente vinculado',
          'Atenção', 0 + 64);
        Exit;
      end;

    if vMudarControle then
      if vCodigoControleOr = vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger then
      begin
        Application.MessageBox('Esta operação só pode ser realizada entre controles diferentes',
          'Atenção',
          0 + 64);
        Exit;
      end;

    try

      if vCodigoControleDest = 0 then
        raiseExceptionCreate('Controle de destino não encontrado', '');

      try

        vLancL := TLancamentosImp.create;
        vContLigL := TContaLigacaoImp.create;

        vLancL._setTransactionComponentes(transacao);
        vContLigL._AbrirContadeLigacao(True);

        if vMudarControle then
        begin

          // Gerando numero de lote
          buscas.Close;
          buscas.SQL.Text := 'SELECT GEN_ID(INC_L_QUIT, 1) lote FROM rdb$Database';
          buscas.Open;

          vNumLoteQuitacao := buscas.FieldByName('lote').AsInteger;
          vCodMaxBaixaCred := 0;

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
              buscas.SQL.Text := ' select max(lot.n_lote_quit) from empresa_fisica emp ' +
                ' inner join lote_quit lot on lot.codigo_emp = emp.cod_empresa ' +
                ' where emp.cod_empresa > 0 ';
              buscas.Open;
            end
            else
            begin
              buscas.close;
              buscas.SQL.Text := ' select max(lot.n_lote_quit) from lote_quit lot ' +
                ' where lot.codigo_emp = ' + vDadosIni.codEmpresa;
              buscas.Open;
            end;

            vCodMaxBaixaCred := buscas.FieldByName('max').AsInteger + 1;

            if (vCodMaxBaixaCred > vNumLoteQuitacao) then
            begin
              buscas.close;
              buscas.SQL.Text := ' set generator INC_L_QUIT to ' + IntToStr(vCodMaxBaixaCred);
              buscas.ExecSQL;

              vNumLoteQuitacao := vCodMaxBaixaCred;
            end;
          end
          else
          begin
            buscas.close;
            buscas.SQL.Text := ' select max(lot.n_lote_quit) from lote_quit lot ' +
              ' where lot.codigo_emp in ' + vDadosIni.vEmp.vCodigoUnificadas;
            buscas.Open;

            vCodMaxBaixaCred := buscas.FieldByName('max').AsInteger + 1;

            if (vCodMaxBaixaCred > vNumLoteQuitacao) then
            begin
              buscas.close;
              buscas.SQL.Text := ' set generator INC_L_QUIT to ' + IntToStr(vCodMaxBaixaCred);
              buscas.ExecSQL;

              vNumLoteQuitacao := vCodMaxBaixaCred;
            end;
          end;

          buscas.Close;
          buscas.SQL.Text := 'INSERT INTO LOTE_QUIT (N_LOTE_QUIT, DATA_L_QUIT, CODIGO_EMP)' +
            ' VALUES (:N_LOTE_QUIT, :DATA_L_QUIT, :CODIGO_EMP)';
          buscas.ParamByName('N_LOTE_QUIT').AsInteger := vNumLoteQuitacao;
          buscas.ParamByName('DATA_L_QUIT').AsDate := vDadosIni.diaFFinanceiro + 1;
          buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ExecSQL;

          // Efetuando o lancamento na tabela de lancamentos. Lancamento de saida

          vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_S_CHQ').AsFloat;

          //        vContLigL.vPCont.dataSet.Locate('N_CONTA_PLC', vLancL.N_CONTA_PLC, []);
          if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
            raiseExceptionCreate('Corrija o cadastro para continuar', '');

          vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
          vLancL.CODIGO_CTRL := vCodigoControleOr;
          vLancL.NOME_CTRL := Trim(vNomeControle);
          vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
          vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
          vLancL.HISTORICO_L := vHistorico;
          vLancL.VALOR_L := dataSet.FieldByName('VALOR_CH').AsCurrency;
          vLancL.NDOC_L := Trim(dataSet.FieldByName('n_ch').AsString);
          vLancL.LOTE_QUIT := vNumLoteQuitacao;
          if vMudarControle then
            vLancL.TP_MOD := 'S'
          else
            vLancL.TP_MOD := '';
          vLancL.COD_EMP_MULT := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
          vLancL.VL_CONTABIL := dataSet.FieldByName('vl_contabil').AsFloat;
          vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
          vLancL._efetuarLancamento;

          //Efetuando a baixa do cheque

          dataSet.Edit;
          dataSet.FieldByName('STATUS_CH').AsString := 'QUITADO';
          dataSet.FieldByName('DATQ_CH').AsDateTime := vDadosIni.diaFFinanceiro + 1;
          dataSet.FieldByName('US_BX').AsInteger := vDadosIni.vCodUsuario;
          dataSet.FieldByName('OBS_CH').AsString := vHistorico;
          dataSet.FieldByName('lote_quit').AsInteger := vNumLoteQuitacao;
          dataSet.FieldByName('TIP_BAIXA').AsString := 'M';

          dataSet.Post;
          if not Apply then
            raiseExceptionCreate('Operação será abortada', '');

        end
        else
        begin
          if dataSet.FieldByName('TIP_BAIXA').AsString <> 'A' then
          begin
            dataSet.Edit;
            dataSet.FieldByName('TIP_BAIXA').AsString := 'A';
            if fTransportarValorComissao then
            begin
              vValorComissao := dataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat;
              vValorComissaoGer := dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').AsFloat;
              dataSet.FieldByName('VL_BAIXA_COMISSAO').Value := Null;
              dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').value := Null;
              dataSet.FieldByName('DT_BAIXA_COMISSAO').value := Null;
            end;
            dataSet.Post;
            if not Apply then
              raiseExceptionCreate('Operação será abortada', '');
          end;
        end;

        //Efetuando o lanchamento no controle_cheque

        buscas.Close;
        buscas.SQL.Text := ' select controle_cheque.* from controle_cheque ' +
          ' left join empresa on empresa.cod_empresa = controle_cheque.cod_emp_mult ' +
          ' where controle_cheque.codigo_ch = ' + IntToStr(dataSet.FieldByName('codigo_ch').AsInteger) +
          ' and controle_cheque.codigo_emp = ' + vDadosIni.codEmpresa;
        buscas.Open;

        if (buscas.IsEmpty) and (vDadosIni.vEmp.vFinanceiroUnificado) then
        begin
          buscas.Close;
          buscas.SQL.Text := ' select controle_cheque.* from controle_cheque ' +
            ' left join empresa on empresa.cod_empresa = controle_cheque.cod_emp_mult ' +
            ' where controle_cheque.codigo_ch = ' + IntToStr(dataSet.FieldByName('codigo_ch').AsInteger) +
            ' and (case when (empresa.financeiro_unificado = ''S'') then ' +
            '      empresa.codigo_unificadora else controle_cheque.codigo_emp end) = ' + vDadosIni.codEmpresa;
          buscas.Open;
        end;

        if buscas.IsEmpty then
          raiseExceptionCreate('Não encontrado o cheque no banco de dados', '');

        dataSet.Insert;
        for I := 0 to dataSet.FieldCount - 1 do
          if dataSet.Fields[I].FieldKind = fkData then
            if buscas.FindField(dataSet.Fields[I].FieldName) <> nil then
              dataSet.FieldByName(dataSet.Fields[I].FieldName).Value :=
                buscas.FieldByName(dataSet.Fields[I].FieldName).Value;

        dataSet.FieldByName('STATUS_CH').Value := Null;
        dataSet.FieldByName('DTORIGINAL_CH').AsDateTime := dataSet.FieldByName('DATA_REC').Value;
        dataSet.FieldByName('DATA_REC').Value := vDadosIni.diaFFinanceiro + 1;
        dataSet.FieldByName('DATQ_CH').Value := Null;
        dataSet.FieldByName('US_BX').Value := Null;
        dataSet.FieldByName('LOTE_QUIT').Value := Null;
        dataSet.FieldByName('TIP_BAIXA').value := Null;
        if vMudarControle then
          dataSet.FieldByName('LOTE_ENT').AsInteger := vNumLoteQuitacao
        else
        begin
          dataSet.FieldByName('LOTE_ENT').Value := Null;
          dataSet.FieldByName('DT_BAIXA_COMISSAO').value := Null;
          if fTransportarValorComissao then
          begin
            dataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat := vValorComissao;
            dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').AsFloat := vValorComissaoGer;
          end
          else
          begin
            dataSet.FieldByName('VL_BAIXA_COMISSAO').Value := Null;
            dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').value := Null;
          end;
        end;
        dataSet.FieldByName('CODIGO_CTRL').AsInteger := vCodigoControleDest;
        FCodigo := Gencodigo('CONTROLE_CHEQUE', dtmContasAReceber.SpIncCodigo, vDadosIni.codEmpresa);
        vDadosIni.hw_registra_estatistica('CONTROLE_CHEQUE');
        dataSet.FieldByName('CODIGO_CH').AsInteger := FCodigo;
        dataSet.Post;

        //Efetuando lancamento de entrada do cheque em novo controle

        vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_V_PROD').AsFloat;

        //      vContLigL.vPCont.dataSet.Locate('N_CONTA_PLC', vLancL.N_CONTA_PLC, []);
        if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
          raiseExceptionCreate('Corrija o cadastro para continuar', '');

        vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
        vLancL.CODIGO_CTRL := vCodigoControleDest;
        vLancL.NOME_CTRL := Trim(vCtrl.dataSet.FieldByName('nome_ctrl').AsString);
        vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
        vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
        vLancL.HISTORICO_L := vHistorico;
        vLancL.VALOR_L := dataSet.FieldByName('VALOR_CH').AsCurrency;
        vLancL.NDOC_L := Trim(dataSet.FieldByName('n_ch').AsString);
        if vMudarControle then
          vLancL.LOTE_ENT := vNumLoteQuitacao;
        if vMudarControle then
          vLancL.TP_MOD := 'S'
        else
          vLancL.TP_MOD := '';
        vLancL.COD_EMP_MULT := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
        vLancL.VL_CONTABIL := dataSet.FieldByName('vl_contabil').AsFloat;
        vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
        vLancL._efetuarLancamento;

        if not Apply then
          raiseExceptionCreate('Operação será abortada', '');

        //Efetuando lancamento na tabela lanccheque

        buscas.Close;
        buscas.SQL.Text := 'INSERT INTO LANCCHEQUE (COD_LANC, CODIGO_CH, CODIGO_EMP)' +
          ' VALUES (:COD_LANC, :CODIGO_CH, :CODIGO_EMP)';
        buscas.ParamByName('COD_LANC').AsInteger := vLancL.COD_LANC;
        buscas.ParamByName('CODIGO_CH').AsInteger := FCodigo;
        buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.ExecSQL;

        // Efetuando a negaticação/desnegativação do cliente
        if vMudarControle then
        begin

          vCtrl._selecionaControle(vCodigoControleOr);

          if vCtrl.dataSet.FieldByName('barrar_automatico').AsString = 'S' then
          begin

            vCtrl._selecionaControle(vCodigoControleDest);
            if vCtrl.dataSet.FieldByName('barrar_automatico').AsString <> 'S' then
            begin
              vNegCliente := TNegativacaoCliente.create(buscas.Transaction, FDocs);
              vNegCliente.dados.acao := naDesnegativa; //desnegativar
              vNegCliente.dados.alterarConta := False; // nao alterar conta pois no cheque nao grava nada
              vNegCliente.dados.codCliente := dataSet.FieldByName('cod_cliente').AsInteger; // cliente do cheque
              vNegCliente.dados.codigoUnificada := dataSet.FieldByName('cod_emp_mult').AsInteger;
              if not vNegCliente.executar then
                raiseExceptionCreate(vNegCliente.MsgErro, '');
            end;

          end;

          vCtrl._selecionaControle(vCodigoControleDest);
          if vCtrl.dataSet.FieldByName('barrar_automatico').AsString = 'S' then
          begin
            vNegCliente := TNegativacaoCliente.create(buscas.Transaction, FDocs);
            vNegCliente.dados.acao := naNegativar; //negativar
            vNegCliente.dados.alterarConta := False; // nao alterar conta pois no cheque nao grava nada
            vNegCliente.dados.codCliente := dataSet.FieldByName('cod_cliente').AsInteger; // cliente do cheque
            vNegCliente.dados.codigoUnificada := dataSet.FieldByName('cod_emp_mult').AsInteger;
            if not vNegCliente.executar then
              raiseExceptionCreate(vNegCliente.MsgErro, '');
          end;

        end
        else
        begin

          vCtrl._selecionaControle(vCodigoControleDest);
          if vCtrl.dataSet.FieldByName('barrar_automatico').AsString = 'S' then
          begin
            vNegCliente := TNegativacaoCliente.create(buscas.Transaction, FDocs);
            vNegCliente.dados.acao := naNegativar; //desnegativar
            vNegCliente.dados.alterarConta := False; // nao alterar conta pois no cheque nao grava nada
            vNegCliente.dados.codCliente := dataSet.FieldByName('cod_cliente').AsInteger; // cliente do cheque
            vNegCliente.dados.codigoUnificada := dataSet.FieldByName('cod_emp_mult').AsInteger;
            if not vNegCliente.executar then
              raiseExceptionCreate(vNegCliente.MsgErro, '');
          end;

        end;

        CommitaTransacao;

        vDadosIni.GravaAuditoria('CAR017', 'INCLUIR', 'SUCESSO ' + vOperacao, FTable, '', FBuscas2);

      finally
        vLancL._setTransactionComponentes(nil);
        vContLigL.Free;
        vLancL.Free;

        vContLigL:= nil;
        vLancL := nil;
      end;

      Result := True;

      dataSet.Refresh;

    except
      on E: Exception do
      begin
        RollBackTransacao;
        Result := False;
        Application.MessageBox(pchar('Erro na operação. Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('function TControleCheque._mudarControleOuVoltarParaAtivo. Erro: ' + e.Message);
        verificaErroDataSetOpen(E.Message);
      end;
    end;
  finally
  	if vListaClBarrarDesbarrar.Count > 0 then
    begin
      for I := 0 to vListaClBarrarDesbarrar.Count - 1 do
      begin
        if trim(vListaClBarrarDesbarrar[I]) <> '' then
        begin
          if vDadosIni.vEmp.vFinanceiroUnificado then
            vDadosIni.negativarClientes(0, trim(vListaClBarrarDesbarrar[I]))
          else
            vDadosIni.negativarClientes(StrToInt(vListaClBarrarDesbarrar[I]), '');
        end;
      end;
    end;

    if Assigned(vListaClBarrarDesbarrar) then
      FreeAndNil(vListaClBarrarDesbarrar);
  end;
end;

function TControleCheque._negativaDesnegativaCliente: Boolean;
var
  vTemp: string;
  vTemMarcado: Boolean;
  buscas2: TIBQuery;
  vCpf: string;
  vList: TStrings;
begin
  try
    if vDadosIni.vEmp.vCodigoBarrado = 0 then
    begin
      Application.MessageBox(
        'Barramento automático ativado. Campo "Código Barrado" no Cadastro da empresa sem valor válido',
        'Atenção', 0 + 64);
      Exit;
    end;

    if vDadosIni.vEmp.vCodigoDesbarrado = 0 then
    begin
      Application.MessageBox(
        'Barramento automático ativado. Campo "Código Liberado" no Cadastro da empresa sem valor válido',
        'Atenção', 0 + 64);
      Exit;
    end;

    if dadosCDL.vNegativar then
      vTemp := 'BARRAR'
    else
      vTemp := 'DESBARRAR';

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    try
    	dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if (dataSet.FieldByName('sel').AsString = 'S') and (dataSet.FieldByName('cod_cliente').AsInteger > 0) then
        begin
          if not vTemMarcado then
          begin
            vTemMarcado := True;
            Break;
          end;
        end;
        dataSet.Next;
      end;
    finally
      dataSet.EnableControls;
    end;

    if not vTemMarcado then
    begin
      Application.MessageBox(pchar(
        'Nenhum registro foi selecionado para negativação'), 'Atenção', 0 + 64);
      RollBackTransacao;
      Exit;
    end;

    try
    	dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if (dataSet.FieldByName('sel').AsString = 'S') and (dataSet.FieldByName('cod_cliente').AsInteger > 0) then
        begin
          buscas.Close;
          buscas.SQL.Text := ' update clientes set REP_INT_ACTIVE = 1, CODIGO_FATURAMENTO = :CODIGO_FATURAMENTO' +
            ' where COD_CLIENTE = :COD_CLIENTE ' +
            ' and COD_EMPRESA = :COD_EMPRESA ';
          buscas.ParamByName('COD_CLIENTE').AsInteger := dataSet.FieldByName('COD_CLIENTE').AsInteger;
          if vDadosIni.vEmp.vFinanceiroUnificado then
          	buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMP_MULT').AsInteger
          else
          	buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);

          if dadosCDL.vNegativar then
            buscas.ParamByName('CODIGO_FATURAMENTO').AsInteger := vDadosIni.vEmp.vCodigoBarrado
          else
            buscas.ParamByName('CODIGO_FATURAMENTO').AsInteger := vDadosIni.vEmp.vCodigoDesbarrado;
          buscas.ExecSQL;

          if vDadosIni.getConfSisBool('cl_hab_faturamento_unico_entre_empresas', buscas) then
          begin
            buscas.Close;
            buscas.SQL.Text := ' select CPFCGC from CLIENTES ' +
              ' where COD_CLIENTE = :COD_CLIENTE ' +
              ' and COD_EMPRESA = :COD_EMPRESA ';
            buscas.ParamByName('cod_cliente').AsInteger := dataSet.FieldByName('cod_cliente').AsInteger;
            buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
            buscas.Open;

            vCpf := buscas.FieldByName('cpfcgc').AsString;

            if trim(vCpf) <> '' then
            begin
              try
                vList := TStringList.Create;
                vList := vDadosIni.getConfSisBlob('cl_hab_faturamento_unico_entre_empresas', buscas);
                if vList.Count > 1 then
                begin
                  vList[2] := StringReplace(UpperCase(vList[2]), 'EMPRESAS:', '', [rfReplaceAll]);

                  buscas2.Close;
                  buscas2.SQL.Text := ' select COD_EMPRESA from EMPRESA ' +
                    ' where COD_EMPRESA <> :COD_EMPRESA ';
                  buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
                  buscas2.Open;
                  buscas2.FetchAll;

                  buscas2.First;
                  while not buscas2.Eof do
                  begin
                    if ((Pos('|' + IntToStr(buscas2.FieldByName('COD_EMPRESA').AsInteger) + '|', trim(vList[2])) > 0)
                      or (trim(vList[2]) = '')) then
                    begin
                      vDadosIni.abreStatusProcessamento('', 'Replicando para outras empresas');

                      buscas.Close;
                      buscas.SQL.Text := ' update CLIENTES set CODIGO_FATURAMENTO = :CODIGO_FATURAMENTO' +
                        ' where CPFCGC = :CPFCGC ' +
                        '	and COD_EMPRESA = :COD_EMPRESA ';
                      buscas.ParamByName('CPFCGC').AsString := vCpf;
                      buscas.ParamByName('COD_EMPRESA').AsInteger := buscas2.FieldByName('COD_EMPRESA').AsInteger;
                      if dadosCDL.vNegativar then
                        buscas.ParamByName('CODIGO_FATURAMENTO').AsInteger := vDadosIni.vEmp.vCodigoBarrado
                      else
                        buscas.ParamByName('CODIGO_FATURAMENTO').AsInteger := vDadosIni.vEmp.vCodigoDesbarrado;
                      buscas.ExecSQL;
                    end;

                    buscas2.Next;
                  end;
                end;
              finally
                FreeAndNil(vList);
              end;
            end;
          end;

          vDadosIni.GravaAuditoria('CAR015', vTemp, vTemp + ' TIPO ' + FDocs +
            ' CLIENTE CODIGO ' + dataSet.FieldByName('cod_cliente').AsString, FTable, '', buscas);
        end;

        dataSet.Next;
      end;
    finally
      dataSet.EnableControls;
    end;

    CommitaTransacao;

    vDadosIni.GravaAuditoria('CAR015', vTemp, 'SUCESSO ' + vTemp + ' TIPO ' + FDocs, FTable, '', buscas);

    if dadosCDL.vImprimirFichaSPC then
    begin
    	try
      	dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
          if (dataSet.FieldByName('sel').AsString = 'S') and (dataSet.FieldByName('cod_cliente').AsInteger > 0) then
          begin
            dadosCDL.dataVencimento := dataSet.FieldByName('DATA_VENC').AsString;
            dadosCDL.NumCheque := Trim(dataSet.FieldByName('N_CH').AsString);
            dadosCDL.NumBanco := Trim(dataSet.FieldByName('id_banco').AsString);
            dadosCDL.Agencia := Trim(dataSet.FieldByName('agencia').AsString);
            dadosCDL.NumDocumento := Trim(dataSet.FieldByName('conta').AsString);
            if not dadosCDL.vValorVenda then
              dadosCDL.valorSPC := dataSet.FieldByName('VALOR_CH').AsFloat
            else
              dadosCDL.valorSPC := _getValorVenda(Trim(dataSet.FieldByName('TP_DOC_V').AsString),
                dataSet.FieldByName('N_DOC_V').AsInteger, dataSet.FieldByName('VALOR_CH').AsFloat,
                dataSet.FieldByName('COD_EMP_MULT').AsInteger);
            vCl._selecionaCliente(dataSet.FieldByName('cod_cliente').AsInteger, dataSet.FieldByName('COD_EMP_MULT').AsInteger);
            _imprimirFichaSPC;
          end;
          dataSet.Next;
        end;
      finally
        dataSet.EnableControls;
      end;
    end;

    vTemp := 'Negativação';
    if not dadosCDL.vNegativar then
      vTemp := 'Desnegativação';

    vDadosIni.fechaStatusProcessamento;
    Application.MessageBox(pchar(vTemp + ' concluída'), 'Atenção', 0 + 64);

  except
    on E: exception do
    begin
      Result := False;
      vDadosIni.fechaStatusProcessamento;
      registraErro('function TControleCheque._negativaDesnegativaCliente. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro na Negativação/Desnegativação do cliente. Erro: ' +
        E.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

function TControleCheque._dataRecebimentoValida: Boolean;
begin

  Result := False;
  if dataSet.FieldByName('data_rec').AsDateTime > (vDadosIni.diaFFinanceiro + 1) then
  begin
    Application.MessageBox('Data ainda não programada', 'Atenção', 0 + 64);
    Exit;
  end;

  if dataSet.State = dsEdit then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select data_rec from controle_cheque' +
      ' where codigo_ch = ' + IntToStr(dataSet.FieldByName('codigo_ch').AsInteger) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if not buscas.IsEmpty then
      if buscas.FieldByName('data_rec').AsDateTime <> dataSet.FieldByName('data_rec').AsDateTime then
        if not vDadosIni.PesqPros('CAR040', 'VALIDAR', 'DE ' +
          buscas.FieldByName('data_rec').AsString +
          ' PARA ' + dataSet.FieldByName('data_rec').AsString +
          ' NUM CH ' + Trim(dataSet.FieldByName('N_CH').AsString), FTable, IntToStr(FCodigo) + '/' +
          Trim(dataSet.FieldByName('N_CH').AsString), FBuscas2, True) then
        begin
          dataSet.FieldByName('data_rec').AsDateTime :=
            buscas.FieldByName('data_rec').AsDateTime;
          Exit;
        end;
  end;
  Result := True;
end;

function TControleCheque._detalhesRecebimento: Boolean;
begin

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CAR023', 'DETALHES', 'NUM CH ' +
    Trim(dataSet.FieldByName('N_CH').AsString), FTable,
    dataSet.FieldByName('CODIGO_CH').AsString + '/' + Trim(dataSet.FieldByName('N_CH').AsString),
    FBuscas2, True) then
    Exit;

  vBx._selecionaBaixaCreditos(dataSet.FieldByName('codigo_ch').AsInteger,
  	dataSet.FieldByName('codigo_emp').AsInteger);

  _abreFormDetalhes(False);

end;

function TControleCheque._documentoRecebidoOuSendoRecebido: Boolean;
begin

  buscas.Close;
  buscas.SQL.Text := 'select cc.op_cx, cc.status_cx, cc.datq_ch, col.nome_vendedor from controle_cheque cc ' +
    ' left join colaborador col on col.cod_vendedor = cc.op_cx and col.cod_empresa = cc.codigo_emp ' +
    ' where cc.codigo_ch = ' + IntToStr(dataset.FieldByName('codigo_ch').AsInteger) +
    ' and cc.codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	IntToStr(dataset.FieldByName('CODIGO_EMP').AsInteger), vDadosIni.codEmpresa);
  buscas.Open;

  Result := (buscas.FieldByName('STATUS_CX').AsString = 'R') or
    (Trim(buscas.FieldByName('datq_ch').AsString) <> '');

  try

    if not Result then
      Exit;

    if (Trim(buscas.FieldByName('datq_ch').AsString) <> '') then
      Application.MessageBox(PChar
        ('Cheque já esta quitado. Data ' + buscas.FieldByName('datq_ch').AsString + #13 + #13 +
        'Código: ' + IntToStr(dataset.FieldByName('codigo_ch').AsInteger) + #13 +
        'Número: ' + Trim(dataset.FieldByName('n_ch').AsString) + #13 +
        'Data Venc: ' + FormatDateTime('dd/mm/yyyy', dataset.FieldByName('data_venc').AsDateTime) + #13 +
        'Cliente: ' + IntToStr(dataset.FieldByName('cod_cliente').AsInteger) + ' - ' +
        trim(dataSet.FieldByName('nome_ch').AsString)),
        'Atenção', 0 + 64)

    else if (buscas.FieldByName('op_cx').AsInteger > 0) then
      Application.MessageBox(PChar
        ('Cheque já esta sendo recebido ou modificado pelo Financeiro. ' +
        'Usuário ' + buscas.FieldByName('op_cx').AsString + ' - ' + trim(buscas.FieldByName('NOME_VENDEDOR').AsString) + #13 + #13 +
        'Código: ' + IntToStr(dataset.FieldByName('codigo_ch').AsInteger) + #13 +
        'Número: ' + Trim(dataset.FieldByName('n_ch').AsString) + #13 +
        'Data Venc: ' + FormatDateTime('dd/mm/yyyy', dataset.FieldByName('data_venc').AsDateTime) + #13 +
        'Cliente: ' + IntToStr(dataset.FieldByName('cod_cliente').AsInteger) + ' - ' +
        trim(dataSet.FieldByName('nome_ch').AsString)),
        'Atenção', 0 + 64)
    else
      Application.MessageBox(PChar
        ('Cheque já esta sendo recebido ou modificado pelo Financeiro: ' + #13 + #13 +
        'Código: ' + IntToStr(dataset.FieldByName('codigo_ch').AsInteger) + #13 +
        'Número: ' + Trim(dataset.FieldByName('n_ch').AsString) + #13 +
        'Data Venc: ' + FormatDateTime('dd/mm/yyyy', dataset.FieldByName('data_venc').AsDateTime) + #13 +
        'Cliente: ' + IntToStr(dataset.FieldByName('cod_cliente').AsInteger) + ' - ' +
        trim(dataSet.FieldByName('nome_ch').AsString)),
        'Atenção', 0 + 64);

  finally
    buscas.Close;
  end;
end;

procedure TControleCheque._efetuarSoma;
var
  vSomaQuitados, vSomaNaoQuitados, vSomaSelecionados: Extended;
  vPointer: Pointer;
begin
	if dataSet.IsEmpty then
    exit;
    
  if not vDadosIni.PesqPros('CAR013', 'SOMAR', '', FTable, '', buscas, False) then
    Exit;

  try
  	vDadosIni.abreStatusProcessamento('', 'Realizando somatório dos cheques...');
    vSomaQuitados := 0;
    vSomaNaoQuitados := 0;
    vSomaSelecionados := 0;

    try
    	vPointer := dataSet.GetBookmark;
      dataSet.DisableControls;
      dataSet.first;
      while not dataSet.Eof do
      begin
        if Trim(dataSet.FieldByName('status_ch').AsString) = '' then
          vSomaNaoQuitados := vSomaNaoQuitados + dataSet.FieldByName('VALOR_CH').AsFloat
        else
          vSomaQuitados := vSomaQuitados + dataSet.FieldByName('VALOR_CH').AsFloat;
        if Trim(dataSet.FieldByName('sel').AsString) = 'S' then
          vSomaSelecionados := vSomaSelecionados + dataSet.FieldByName('VALOR_CH').AsFloat;
        dataSet.next;
      end;
    finally
      dataSet.first;
      dataSet.GotoBookmark(vPointer);
      dataSet.EnableControls;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  	Application.MessageBox(pchar('Valor dos Cheques Não quitados: ' + format('%m', [vSomaNaoQuitados]) + #13 +
	    'Valor dos Cheques quitados....: ' + format('%m', [vSomaQuitados]) + #13 +
  	  'Valor dos Cheques Selecionados: ' + format('%m', [vSomaSelecionados])),
      'Somatório das Cheques', MB_OK + MB_ICONINFORMATION);
  end;
end;

function TControleCheque._estornarRecebimento: Boolean;
var
  I, vCodEmpresaQuitacao, vNumLoteQuitacao, vCodControleParaSaida: Integer;
  vDataLoteQuitacao: TDateTime;
  vNegCliente: TNegativacaoCliente;
  vLoteDev: boolean;
  vListaClBarrarDesbarrar: TStringList;
begin
  try
    vListaClBarrarDesbarrar := TStringList.Create;
    vListaClBarrarDesbarrar.Sorted := True;
    vListaClBarrarDesbarrar.Duplicates := dupIgnore;
    vListaClBarrarDesbarrar.Clear;

    Result := False;
    try

      if not vDadosIni.PesqPros('CAR047', 'ESTORNO', ' NUM CH ' +
        Trim(vBx.dataSet.FieldByName('N_CH').AsString) +
        ' CLIENTE ' + vBx.dataSet.FieldByName('COD_CLIENTE').AsString +
        ' OPERADOR ' + IntToStr(vDadosIni.vCodUsuario), 'CONTROLE_CHEQUE',
        IntToStr(vBx.dataSet.FieldByName('CODIGO_CH').AsInteger) + '/' +
        Trim(vBx.dataSet.FieldByName('N_CH').AsString), buscas, True) then
        Exit;

      if not vDadosIni.VerificarinicioFechFinan(buscas) then
        exit;

      vDadosIni.abreStatusProcessamento('', 'Validando dados');

      vDadosIni.definirDiaFinanceiroFechado(buscas);

      // Financeiro sendo fechado
      if vDadosIni.financeiroFechando(buscas) then
        exit;

      vBx.dataSet.RefreshRecord;

      ///  Validando cheques em aberto ou sem numero de lote
      if Trim(vBx.dataSet.FieldByName('status_ch').AsString) = '' then
        raiseExceptionCreate('Cheque em aberto', '');

      if (vBx.dataSet.FieldByName('DATQ_CH').AsDateTime <> (vDadosIni.diaFFinanceiro + 1)) then
        raiseExceptionCreate('Data de quitação do cheque não corresponde a data do Financeiro' + #13 +
          'Data de quitação..: ' + DateToStr(vBx.dataSet.FieldByName('DATQ_CH').AsDateTime) + #13 +
          'Data do Financeiro: ' + DateToStr(vDadosIni.diaFFinanceiro + 1), '');

      buscas.Close;
      buscas.SQL.Text := 'select codigo_emp, status_ch, datq_ch, lote_quit from controle_cheque' +
        ' where codigo_ch = ' + IntToStr(vBx.dataSet.FieldByName('codigo_ch').AsInteger) +
        ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
            IntToStr(vBx.dataSet.FieldByName('codigo_emp').AsInteger), vDadosIni.codEmpresa);
      buscas.Open;

      if Trim(buscas.FieldByName('status_ch').AsString) = '' then
        raiseExceptionCreate('Cheque ja se encontra em aberto', '');

      if buscas.FieldByName('lote_quit').AsInteger <= 0 then
        raiseExceptionCreate('Lote de quitação não encontrado', '');

      vCodEmpresaQuitacao := buscas.FieldByName('codigo_emp').AsInteger;
      vNumLoteQuitacao := buscas.FieldByName('lote_quit').AsInteger;
      vDataLoteQuitacao := buscas.FieldByName('datq_ch').AsDateTime;

      if ((vDadosIni.vCliente.Barramento.vBarraAutomaticamenteAposVencCrediario = 'S')
          and (vDadosIni.vCliente.Barramento.vCodigoBarrado > 0))
        or ((vDadosIni.vCliente.Barramento.vDesbarraAutomaticamenteAposQuitCrediario = 'S')
          and (vDadosIni.vCliente.Barramento.vCodigoDesbarrado > 0)) then
      begin
      	buscas.Close;
        buscas.SQL.Text := 'select distinct cpfcgc, cod_cliente from controle_cheque' +
          ' where lote_quit = ' + IntToStr(vNumLoteQuitacao) +
          ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
            IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa) +
          ' and cod_cliente > 0';
        buscas.Open;

        buscas.First;
        while not buscas.Eof do
     	  begin
        	if (buscas.FieldByName('COD_CLIENTE').AsInteger > 0) then
          begin
            if (vDadosIni.vEmp.vFinanceiroUnificado)
              and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
            begin
            	if trim(buscas.FieldByName('CPFCGC').AsString) <> '' then
              	vListaClBarrarDesbarrar.Add(trim(buscas.FieldByName('CPFCGC').AsString));
            end
            else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
              vListaClBarrarDesbarrar.Add(IntToStr(buscas.FieldByName('COD_CLIENTE').AsInteger));
          end;

        	buscas.Next;
        end;
      end;

      if vDadosIni.vEmp.vFinanceiroUnificado then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select lote_quit.n_lote_quit, lote_quit.codigo_emp, lote_quit.data_l_quit from lote_quit ' +
          ' left join empresa on lote_quit.codigo_emp = empresa.cod_empresa ' +
          ' where lote_quit.n_lote_quit = ' + inttostr(vNumLoteQuitacao) +
          ' and lote_quit.data_l_quit = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDataLoteQuitacao)) +
          ' and (case when(empresa.financeiro_unificado = ''S'') then empresa.codigo_unificadora else lote_quit.codigo_emp end) = ' + vDadosIni.codEmpresa;
        buscas.Open;

        if not buscas.IsEmpty then
          if buscas.FieldByName('codigo_emp').AsInteger <> vDadosIni.cod_empresa then
          begin
            Application.MessageBox(PChar('Estorno do recebimento não pode ser feito' + #13 +
              'Lote de recebimento foi gerado pela empresa ' + IntToStr(buscas.FieldByName('codigo_emp').AsInteger)), 'Atenção', MB_OK + MB_ICONINFORMATION);
            exit;
          end;
      end;

      ///  Validando se os creditos ou cheques gerados na quitação ja foram baixados
      ///  Caso algum ja tenha sido baixado o estorno nao sera efetuado
      vLoteDev := false;
      buscas.Close;
      buscas.SQL.Text := 'select tip_baixa from controle_cheque ' +
        ' where lote_quit = ' + IntToStr(vNumLoteQuitacao) +
        '	and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
            IntToStr(vBx.dataSet.FieldByName('codigo_emp').AsInteger), vDadosIni.codEmpresa) +
        ' and not datq_ch is null';
      buscas.Open;
      if not buscas.IsEmpty then
        vLoteDev := trim(buscas.FieldByName('tip_baixa').AsString) = 'D';

      if not vLoteDev then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select count(*) valor from lancamentos' +
          ' where lote_ent = ' + IntToStr(vNumLoteQuitacao) +
          ' and codigo_emp = ' + vDadosIni.codEmpresa;
        buscas.Open;

        if buscas.FieldByName('valor').AsInteger = 0 then
          raiseExceptionCreate('Estorno não pode ser feito' + #13 +
            'Registros usados para quitar o Lote não foram encontrados', '');
      end;

      buscas.Close;
      buscas.SQL.Text := 'select count(*) valor from controle_cheque' +
        ' where lote_ent = ' + IntToStr(vNumLoteQuitacao) +
        ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
            IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa) +
        ' and not datq_ch is null';
      buscas.Open;

      if buscas.FieldByName('valor').AsInteger > 0 then
        raiseExceptionCreate('Estorno não pode ser feito' + #13 +
          'Cheque(s) usado(s) na quitação do lote já foi quitado ou devolvido', '');

      buscas.Close;
      buscas.SQL.Text := 'select count(*) valor from baixa_creditos' +
        ' where lote_ent = ' + IntToStr(vNumLoteQuitacao) +
        ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
            IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa);
      buscas.Open;

      if buscas.FieldByName('valor').AsInteger > 0 then
        raiseExceptionCreate('Estorno não pode ser feito' + #13 +
          'Crédito(s) usado(s) na quitação do lote já foi quitado', '');

      //// Este teste verifica se o credito foi devolvido
      buscas.Close;
      buscas.SQL.Text := 'select count(*) valor from controle_creditos' +
        ' where lote_ent = ' + IntToStr(vNumLoteQuitacao) +
        ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
            IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa) +
        ' and not datq_c is null';
      buscas.Open;

      if buscas.FieldByName('valor').AsInteger > 0 then
        raiseExceptionCreate('Estorno não pode ser feito' + #13 +
          'Crédito(s) usado(s) na quitação do lote já foi baixado', '');

      vDadosIni.abreStatusProcessamento('', 'Verificando barramento de clientes');

      // Aqui o sistema verifica se os controle deverão barrar novamente o cliente
      FBuscas2.Close;
      FBuscas2.SQL.Text := 'select distinct cod_cliente, cod_emp_mult from controle_cheque' +
        ' where lote_quit = ' + IntToStr(vNumLoteQuitacao) +
        ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa) +
        ' and cod_cliente > 0';
      FBuscas2.Open;

      FBuscas2.First;
      while not FBuscas2.Eof do
      begin
        vNegCliente := TNegativacaoCliente.create(FBuscas2.Transaction, FDocs);
        vNegCliente.dados.acao := naNegativar;
        vNegCliente.dados.alterarConta := False; //nao alterar conta pois no cheque nao grava nada
        vNegCliente.dados.codCliente := FBuscas2.FieldByName('cod_cliente').AsInteger; // cliente do credito
        vNegCliente.dados.codigoUnificada := FBuscas2.FieldByName('cod_emp_mult').AsInteger;
        if not vNegCliente.executar then
          raiseExceptionCreate(vNegCliente.MsgErro, '');
        FBuscas2.Next;
      end;

      vDadosIni.abreStatusProcessamento('', 'Voltando cheques');

      ///  Aqui reabre os cheques e coloca na obs do cheque que ele foi estornado pelo operador x
      buscas.Close;
      buscas.SQL.Text := ' select codigo_ch, codigo_emp from controle_cheque' +
        ' where lote_quit = ' + IntToStr(vNumLoteQuitacao) +
        ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa);
      buscas.Open;

      buscas.First;
      while not buscas.Eof do
      begin

        FBuscas2.Close;
        FBuscas2.SQL.Text := 'update controle_cheque' +
          ' set status_ch = null, tip_baixa = null, datq_ch = null, lote_quit = null, us_bx = null, ' +
          ' data_baixa = null, obs_ch = :obs_ch' +
          ' where codigo_ch = :codigo_ch ' +
          ' and codigo_emp = :codigo_emp ';

        FBuscas2.ParamByName('codigo_ch').AsInteger := buscas.FieldByName('codigo_ch').AsInteger;
        FBuscas2.ParamByName('codigo_emp').AsInteger := buscas.FieldByName('codigo_emp').AsInteger;
        FBuscas2.ParamByName('obs_ch').AsString := Copy('CHEQUE ESTORNADO OPERADOR ' +
          IntToStr(vDadosIni.vCodUsuario) + ' LOTEQUIT ' + IntToStr(vNumLoteQuitacao), 1, 60);
        FBuscas2.ExecSQL;

        buscas.Next;
      end;

      /// Apagando lançamentos de saida do cheque e juros ou descontos se existir
      _excluirDadosEstorno(vNumLoteQuitacao, dataSet.FieldByName('COD_EMP_MULT').AsInteger);

      CommitaTransacao;
      Result := True;
      vDadosIni.GravaAuditoria('CAR047', 'ESTORNO', 'ESTORNO CONFIRMADO' +
      	' LOTE ' + IntToStr(vNumLoteQuitacao) +
        ' OPERADOR ' + IntToStr(vDadosIni.vCodUsuario), 'LOTE_QUIT', IntToStr(vNumLoteQuitacao),
        FBuscas2);

      vBx._selecionaBaixaCreditos(dataSet.FieldByName('codigo_ch').AsInteger,
        dataSet.FieldByName('codigo_emp').AsInteger);

      dataSet.Refresh;

    except on E: Exception do
      begin
        RollBackTransacao;
        Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('function TControleCheque._estornarRecebimento. Erro: ' + e.Message);
        verificaErroDataSetOpen(E.Message);
      end;
    end;
  finally
  	if vListaClBarrarDesbarrar.Count > 0 then
    begin
      for I := 0 to vListaClBarrarDesbarrar.Count - 1 do
      begin
        if trim(vListaClBarrarDesbarrar[I]) <> '' then
        begin
          if vDadosIni.vEmp.vFinanceiroUnificado then
            vDadosIni.negativarClientes(0, trim(vListaClBarrarDesbarrar[I]))
          else
            vDadosIni.negativarClientes(StrToInt(vListaClBarrarDesbarrar[I]), '');
        end;
      end;
    end;

    if Assigned(vListaClBarrarDesbarrar) then
      FreeAndNil(vListaClBarrarDesbarrar);
  end;
end;

function TControleCheque._permitirAlterarDataVencimento: Boolean;
begin
  Result := False;
  if dataSet.State = dsEdit then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select data_venc from controle_cheque' +
      ' where codigo_ch = ' + IntToStr(dataSet.FieldByName('codigo_ch').AsInteger) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if not buscas.IsEmpty then
      if buscas.FieldByName('data_venc').AsDateTime <> dataSet.FieldByName('data_venc').AsDateTime then
        if not vDadosIni.PesqPros('CAR040', 'VALIDAR', 'DE ' +
          buscas.FieldByName('data_venc').AsString +
          ' PARA ' + dataSet.FieldByName('data_venc').AsString +
          ' NUM CH ' + Trim(dataSet.FieldByName('N_CH').AsString), FTable, IntToStr(FCodigo) + '/' +
          Trim(dataSet.FieldByName('N_CH').AsString), FBuscas2, True) then
        begin
          dataSet.FieldByName('data_venc').AsDateTime :=
            buscas.FieldByName('data_venc').AsDateTime;
          Exit;
        end;
  end;
  Result := True;
end;

function TControleCheque._quitarRegistrosSelecionados(ATransaction: TIBTransaction): Boolean;
var
  vTxJuros: Real;
  vCodMaxBaixaCred: Integer;

begin
  Result := True;

  try

    buscas.Close;
    buscas.SQL.Text := 'SELECT GEN_ID(INC_L_QUIT, 1) lote FROM rdb$Database';
    buscas.Open;
    
    dadosReceber.loteQuitacao := buscas.FieldByName('lote').AsInteger;
    vCodMaxBaixaCred := 0;

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
  	    buscas.SQL.Text := ' select max(lot.n_lote_quit) from empresa_fisica emp ' +
    	  	' inner join lote_quit lot on lot.codigo_emp = emp.cod_empresa ' +
          ' where emp.cod_empresa > 0 ';
        buscas.Open;
      end
      else
      begin
     		buscas.close;
  	    buscas.SQL.Text := ' select max(lot.n_lote_quit) from lote_quit lot ' +
        	' where lot.codigo_emp = ' + vDadosIni.codEmpresa;
        buscas.Open;
      end;

      vCodMaxBaixaCred := buscas.FieldByName('max').AsInteger + 1;

      if (vCodMaxBaixaCred > dadosReceber.loteQuitacao) then
      begin
        buscas.close;
        buscas.SQL.Text := ' set generator INC_L_QUIT to ' + IntToStr(vCodMaxBaixaCred);
        buscas.ExecSQL;

        dadosReceber.loteQuitacao := vCodMaxBaixaCred;
      end;
    end
    else
    begin
      buscas.close;
      buscas.SQL.Text := ' select max(lot.n_lote_quit) from lote_quit lot ' +
				' where lot.codigo_emp in ' + vDadosIni.vEmp.vCodigoUnificadas;
      buscas.Open;

      vCodMaxBaixaCred := buscas.FieldByName('max').AsInteger + 1;

      if (vCodMaxBaixaCred > dadosReceber.loteQuitacao) then
      begin
        buscas.close;
        buscas.SQL.Text := ' set generator INC_L_QUIT to ' + IntToStr(vCodMaxBaixaCred);
        buscas.ExecSQL;

        dadosReceber.loteQuitacao := vCodMaxBaixaCred;
      end;
    end;

    buscas.Close;
    buscas.SQL.Text := 'INSERT INTO LOTE_QUIT (N_LOTE_QUIT, DATA_L_QUIT, CODIGO_EMP)' +
      ' VALUES (:N_LOTE_QUIT, :DATA_L_QUIT, :CODIGO_EMP)';
    buscas.ParamByName('N_LOTE_QUIT').AsInteger := dadosReceber.loteQuitacao;
    buscas.ParamByName('DATA_L_QUIT').AsDate := vDadosIni.diaFFinanceiro + 1;
    buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ExecSQL;

    if not _fazerLancamentoSaidaRecebimento then
      Exit;

    dadosReceber.valorDescontos := 0;
    dadosReceber.valorJuros := 0;

    try
    	dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if dataSet.FieldByName('sel').AsString = 'S' then
        begin
          dataSet.Edit;

          if dataSet.FieldByName('valor_corr').AsFloat = 0 then
            dataSet.FieldByName('valor_corr').AsFloat :=
              dataSet.FieldByName('valor_ch').AsFloat;

          if dadosReceber.referenteDevolucao then
          begin
            dataSet.FieldByName('TIP_BAIXA').AsString := 'D';
            if dadosReceber.historicoDevolucao <> '' then
              dataSet.FieldByName('historico_ch').AsString := dadosReceber.historicoDevolucao;
          end
          else if dadosReceber.referenteCTP then
            dataSet.FieldByName('TIP_BAIXA').AsString := 'C';

          dataSet.FieldByName('STATUS_CH').AsString := 'QUITADO';
          dataSet.FieldByName('DATQ_CH').AsDateTime := vDadosIni.diaFFinanceiro + 1;
          dataSet.FieldByName('US_BX').AsInteger := vDadosIni.vCodUsuario;
          if Trim(dataSet.FieldByName('DATA_BAIXA').AsString) = '' then
		        dataSet.FieldByName('DATA_BAIXA').AsDateTime := dadosReceber.dataBaixa;

          buscas.Close;
          buscas.SQL.Text := 'select GERAR_COMISSAO from controles' +
            ' where codigo_ctrl = ' + IntToStr(dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
            ' and codigo_emp = ' + vDadosIni.codEmpresa;
          buscas.Open;

          if Trim(buscas.FieldByName('GERAR_COMISSAO').AsString) <> 'N' then
          begin
            dataSet.FieldByName('DT_BAIXA_COMISSAO').AsDateTime :=
              dataSet.FieldByName('DATQ_CH').AsDateTime;
            if vDadosIni.vEmp.vUsarComissaoPorRecebimentoProporcional <> 'S' then
              dataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat := dataSet.FieldByName('valor_ch').AsFloat;
          end
          else
          begin
            dataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat := 0;
            dataSet.FieldByName('DT_BAIXA_COMISSAO').Value := Null;
          end;

          dataSet.FieldByName('obs_ch').AsString :=
            'RECEBIMENTO DE CHEQUE CONFORME LOTE ' + IntToStr(dadosReceber.loteQuitacao);
          dataSet.FieldByName('lote_quit').AsInteger := dadosReceber.loteQuitacao;

          dadosReceber.valorDescontos := 0;
          if (dadosReceber.usarValorCorrigido) and
            (dataSet.FieldByName('VALOR_CORR').AsCurrency > dataSet.FieldByName('VALOR_CH').AsCurrency) then
            dadosReceber.valorJuros := dadosReceber.valorJuros +
              (dataSet.FieldByName('VALOR_CORR').AsCurrency -
              dataSet.FieldByName('VALOR_CH').AsCurrency);

          vDadosIni.GravaAuditoria('CAR034', 'ALTERAR', ' BAIXANDO' +
          	' LOTE '+ IntToStr(dadosReceber.loteQuitacao) +
            ' COD CH' + dataSet.FieldByName('CODIGO_CH').AsString +
            ' NUM CH' + Trim(dataSet.FieldByName('N_CH').AsString), FTable,
            dataSet.FieldByName('CODIGO_CH').AsString + '/' + Trim(dataSet.FieldByName('N_CH').AsString),
            buscas);

          dataSet.Post;
          if not Apply then
            raiseExceptionCreate('Operação será abortada', '');

        end;

        dataSet.Next;
      end;
    finally
     	dataSet.EnableControls;
    end;

    Result := True;

    if Result then
      _fazerLancamentoJurosDescontoRecebimento;

  except on E: Exception do
    begin
      Result := False;
      registraErro('function TControleCheque._quitarRegistrosSelecionados. Erro: ' + e.Message + ' ' +
        Trim(dataSet.FieldByName('n_ch').AsString));
      Application.MessageBox(pchar('Erro ao quitar cheque. Erro: ' + E.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

procedure TControleCheque._relatorioMatricial;
begin
  Application.MessageBox('Relatório não disponível para Cheques', 'Atenção', 0 + 64);
end;

function TControleCheque._removerPendenciaConciliacaoCartao: Boolean;
begin
  Result := False;
  Application.MessageBox('Opção não disponível para Cheques', 'Atenção', 0 + 64);
end;

function TControleCheque._replicarControleCredito: Boolean;
begin
  Result := False;
  Application.MessageBox('Opção não disponível para Cheques', 'Atenção', 0 + 64);
end;

procedure TControleCheque._verificaContaBancaria;
begin
  if (dataSet.FieldByName('cod_cliente').AsInteger = 0) or
    (Trim(dataSet.FieldByName('agencia').AsString) = '') or
    (Trim(dataSet.FieldByName('conta').AsString) = '') or
    (Trim(dataSet.FieldByName('banco').AsString) = '') then
    Exit;

  try

    buscas.Close;
    buscas.SQL.Text := 'select cod_cliente from CONTASBANCARIAS' +
      ' where AGENCIA = ' + QuotedStr(dataSet.FieldByName('agencia').AsString) +
      ' and CONTA = ' + QuotedStr(dataSet.FieldByName('conta').AsString) +
      ' and COD_CLIENTE = ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger) +
      ' and COD_EMPRESA = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger), vDadosIni.codEmpresa);
//      ' and BANCO = ' + QuotedStr(dataSet.FieldByName('banco').AsString);
    buscas.Open;

    if buscas.IsEmpty then
    begin

      buscas.Close;
      buscas.SQL.Text :=
        'INSERT INTO CONTASBANCARIAS (AGENCIA, CONTA, COD_CLIENTE, COD_EMPRESA, CODBANCO, BANCO, ATIVO)' +
        ' VALUES (:AGENCIA, :CONTA, :COD_CLIENTE, ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger), vDadosIni.codEmpresa) +
        ', :CODBANCO, :BANCO, 1)';
      buscas.ParamByName('AGENCIA').Value := dataSet.FieldByName('AGENCIA').Value;
      buscas.ParamByName('CONTA').Value := dataSet.FieldByName('CONTA').Value;
      buscas.ParamByName('COD_CLIENTE').Value := dataSet.FieldByName('COD_CLIENTE').Value;
      buscas.ParamByName('CODBANCO').Value := dataSet.FieldByName('ID_BANCO').Value;
      buscas.ParamByName('BANCO').Value := dataSet.FieldByName('BANCO').Value;
      buscas.ExecSQL;

    end;
  except on e: exception do
      registraErro('procedure TControleCheque._verificaContaBancaria. Erro: ' + e.Message);
  end;
end;

function TControleCheque._VerificaTpControle(vcontr: integer): boolean;
begin
  buscas.close;
  buscas.sql.text := 'SELECT DOCS FROM CONTROLES ' +
    ' where codigo_ctrl = ' + inttostr(vcontr) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa;
  buscas.open;
  if buscas.FieldByName('DOCS').AsString = 'S1' then
    result := true
  else
    result := false;
end;

function TControleCheque._vicularTransacaoPendente: Boolean;
begin
  Result := False;
  Application.MessageBox('Opção não disponível para Cheques', 'Atenção', 0 + 64);
end;

function TControleCheque._visualizarLoteBaixa: Boolean;
begin
  Result := False;
  try

    if vBx.dataSet.IsEmpty then
      Exit;

    if not vDadosIni.PesqPros('CAR045', 'VISUALIZAR', ' NUM CH ' +
      Trim(vBx.dataSet.FieldByName('N_CH').AsString) +
      ' CLIENTE ' + vBx.dataSet.FieldByName('COD_CLIENTE').AsString +
      ' OPERADOR ' + IntToStr(vDadosIni.vCodUsuario), 'CONTROLE_CHEQUE',
      IntToStr(vBx.dataSet.FieldByName('CODIGO_CH').AsInteger) + '/' +
      Trim(vBx.dataSet.FieldByName('N_CH').AsString), buscas, True) then
      Exit;

    vBx.dataSet.RefreshRecord;

    if Trim(vBx.dataSet.FieldByName('status_ch').AsString) = '' then
      raiseExceptionCreate('Cheque em aberto. Não existe lote de baixa para documentos abertos',
        '');

    if vBx.dataSet.FieldByName('lote_quit').AsInteger <= 0 then
      raiseExceptionCreate('Lote de quitação não encontrado', '');

    buscas.Close;
    buscas.SQL.Text :=
      'select c.nome_ctrl "Controle",' +
      ' cc.n_conta_plc "Nº da Conta",' +
      ' cc.nome_ch "Nome do Cliente",' +
      ' cc.n_ch "Nº do Documento",' +
      ' cc.historico_ch "Histórico",' +
      ' cc.data_rec "Data Recebimento",' +
      ' cc.data_venc "Data Vencimento",' +
      ' cc.valor_ch "Valor",' +
      ' ''Cheque'' "Tipo",' +
      ' cc.codigo_ch "Número"' +
      ' from controle_cheque cc' +
      ' inner join controles c on c.codigo_ctrl = cc.codigo_ctrl and c.codigo_emp = cc.codigo_emp' +
      ' where c.codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
	    		IntToStr(vBx.dataSet.FieldByName('codigo_emp').AsInteger), vDadosIni.codEmpresa) +
      ' and cc.lote_quit = ' + IntToStr(vBx.dataSet.FieldByName('lote_quit').AsInteger) +
      ' union ' +
      ' select c.NOME_CTRL "Controle",' +
      ' ccc.N_CONTA_PLC "Nº da Conta",' +
      ' cc.NOME_C "Nome do Cliente",' +
      ' cc.N_DOC_C "Nº do Documento",' +
      ' cc.HISTORICO_C "Histórico",' +
      ' cc.DATA_REC_C "Data Recebimento",' +
      ' cc.DATA_VENC_C "Data Vencimento",' +
      ' cc.VALOR_C "Valor",' +
      ' ''Crédito'' "Tipo",' +
      ' cc.cod_cred "Número"' +
      ' from baixa_creditos cc' +
      ' inner join controles c on c.codigo_ctrl = cc.codigo_ctrl and c.codigo_emp = cc.codigo_emp' +
      ' inner join controle_creditos ccc on ccc.cod_cred = cc.cod_cred and ccc.codigo_emp = cc.codigo_emp' +
      ' where c.codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
      		IntToStr(vBx.dataSet.FieldByName('codigo_emp').AsInteger), vDadosIni.codEmpresa) +
      ' and cc.lote_quit = ' + IntToStr(vBx.dataSet.FieldByName('lote_quit').AsInteger);
    buscas.Open;

    TFloatField(buscas.FieldByName('Valor')).DisplayFormat   := '#,##0.00';

    _abreFormLoteQuitacao;

    Result := True;

  except on E: Exception do
    begin
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TControleCheque._visualizarLoteBaixa. Erro: ' + e.Message);
      verificaErroDataSetOpen(E.Message);
    end;
  end;

end;

procedure TControleCheque.abreFormDocumentosOrigem(pTipoForm: Integer);
begin
  vDocumentosOrigem.abreDocumentosOrigem(
  	 dataSet.FieldByName('N_DOC_V').AsInteger,
    dataSet.FieldByName('TP_DOC_V').AsString,
    dataSet.FieldByName('COD_EMP_MULT').AsInteger);

  if not vDadosIni.abreForm('Documentos de Origem',
    frmCadContasAReceber.pnDocumentosOrigem, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
      Exit;
end;

constructor TControleCheque.create(ATransaction: TIBTransaction);
var
 vTemp: string;
begin
  vTemp := ' '' '' n_doc_v_temp, ';
  if vDadosIni.vRecibo.HabRecPorDepart then
  	 vTemp := ' case when (controle_cheque.tp_doc_v = ''REC'') then ' +
             ' 	    recibos.num_rec_dep ' +
             ' 	  else ' +
             '		    controle_cheque.n_doc_v ' +
             '	end n_doc_v_temp,';
       	
  Fsql_campos := ' controle_cheque.*, ' + vTemp +
                 vDadosIni.IfThen(vDadosIni.vContasAReceber.vExibirValorFormasPag,  ' retorna_pag_ch.form_pag2 as form_pag, ', ' retorna_pag_ch.form_pag, ') +
                 ' controles.nome_ctrl, empresa.identificacao_emp, ' +
                 ' p_contas.desc_plc, grupos_ct.desc_gr, depart_ct.desc_dep, p_contas.cod_cta_contabil, p_contas_contabil.nome_cta, ' +
                 ' clientes.nome_cliente, clientes.razao razao_cliente, clientes.cpfcgc cpfcgc_cliente, ' +
                 ' clientes.cep, clientes.endereco, clientes.num_end_cliente, clientes.complemento, ' +
                 ' clientes.fone_cliente, clientes.fone_celular, clientes.email, ' +
                 ' clientes.cod_localidade, localidade.localidade, localidade.cod_setor, setor.setor, ' +
                 ' tipo_faturamento.status_f, estados.sigla_uf, cidades.nome_cidade, bairros.nome_bairro ';

  Fsql_inner :=  ' left join empresa on empresa.cod_empresa = controle_cheque.cod_emp_mult ' +
                 ' left join controles on controles.codigo_ctrl = controle_cheque.codigo_ctrl and controles.codigo_emp = controle_cheque.cod_emp_mult ' +
                 ' left join p_contas on p_contas.n_conta_plc = controle_cheque.n_conta_plc ' +
                 ' left join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct ' +
                 ' left join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep ' +
                 ' left join p_contas_contabil on p_contas_contabil.cod_cta = p_contas.cod_cta_contabil and p_contas_contabil.cod_empresa = controle_cheque.cod_emp_mult ' +
                 ' left join recibos on recibos.nrecibo = controle_cheque.n_doc_v and recibos.cod_empresa = controle_cheque.codigo_emp and controle_cheque.tp_doc_v = ''REC''' +
                 ' left join clientes on clientes.cod_cliente = controle_cheque.cod_cliente and clientes.cod_empresa = controle_cheque.cod_emp_mult ' +
                 ' left join localidade on localidade.cod_localidade = clientes.cod_localidade and localidade.cod_empresa = clientes.cod_empresa ' +
                 ' left join setor on setor.cod_setor = localidade.cod_setor and setor.cod_empresa = localidade.cod_empresa ' +
                 ' left join tipo_faturamento on tipo_faturamento.codigo_faturamento = clientes.codigo_faturamento ' +
                 ' left join estados on estados.codigo_uf = clientes.codigo_uf ' +
                 ' left join cidades on cidades.cod_cidade = clientes.cod_cidade ' +
                 ' left join bairros on bairros.cod_bairro = clientes.cod_bairro ';
  
  Fsql_inner_pag :=
  					  ' left join retorna_pag_ch (controle_cheque.lote_quit, controle_cheque.datq_ch, ' + vDadosIni.codEmpresa + ', 0, '''') on 1 = 1 ';

  TableName := 'CONTROLE_CHEQUE';

  if dtmContasAReceber = nil then
    dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);
  if Assigned(ATransaction) then
  begin
    transacao := ATransaction;
    buscasCreditoCheque := TIBQuery(dtmContasAReceber.qrCtrlCh3);
    DataSet := TClientDataSet(dtmContasAReceber.cdsCtrlCh3);
  end
  else
  begin
  	 transacao := TIBTransaction(dtmContasAReceber.transacao);
	 buscasCreditoCheque := TIBQuery(dtmContasAReceber.qrCtrlCh);
    DataSet := TClientDataSet(dtmContasAReceber.cdsCtrlCh);
  end;
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);
  FBuscas2 := TIBQuery(dtmContasAReceber.qrBuscas2);
  FDataSource := TDataSource(dtmContasAReceber.dsCtrlCh);
  FDataSource2 := TDataSource(dtmContasAReceber.dsCtrlCh2);
  FDataSource.DataSet := dataSet;
  
  buscas.Close;
  Buscas2.Close;
  buscasCreditoCheque.Close;

  buscas.Transaction					 := transacao;
  Buscas2.Transaction				 := transacao;
  buscasCreditoCheque.Transaction := transacao;

  if not vDadosIni.vRecibo.HabRecPorDepart then
    dataSet.FieldByName('N_DOC_V_TEMP').Tag := 1
  else
    dataSet.FieldByName('N_DOC_V').Tag := 1;
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

  //Arqui ele abre o dataset apenas para deixar as colunas definidas
  if not dataSet.Active then
    montaSelect(' select ' + Fsql_campos + ' from controle_cheque ' +
      Fsql_inner +
      Fsql_inner_pag +
      ' where controle_cheque.codigo_ch = 0 ' +
      ' and controle_cheque.codigo_emp = 0 ');

  //  FDocs := vDadosIni.vPesquisa;
  FDocs := 'S1';
  FCodigoLancamento := 0;

  vPCont := TPContasCAR.create;
  vCtrl := TControlesCAR.create;
  vHistPCont := THistPContas.create;
  vContabanc := TContasBancariasCAR.create;
  vCl := TClienteCAR.create;
  vBx := TBaixaCreditos.create(FDocs);
  vTerminalCartao := TTerminalCartao.create;
  vBandeiraCartao := TBandeiras_Cartao.create;
  vPendenciasCartao := TPendenciasCartao.create;
  vEmpresasUnificadas:= TEmpresasUnificadas.create;
  vDocumentosOrigem := TDocumentosOrigem.create;

  FTable := 'CONTROLE_CHEQUE';
  FRecebendo := False;

  dadosRecibo.qtde := 0;
  dadosRecibo.codClienteDoRecibo := 0;
  dadosRecibo.docDoRecibo := '';
  dadosRecibo.nomeClienteRecibo := '';
  dadosRecibo.dataVencRecibos := '';
  dadosRecibo.valorRecibo := 0;
  dadosRecibo.docDoReciboL := TStringList.Create;
  dadosRecibo.docDoReciboL.Clear;
  dadosRecibo.dataVencRecibosL := TStringList.Create;
  dadosRecibo.dataVencRecibosL.Clear;

end;

function TControleCheque.delete: Boolean;
begin
  Result := False;

  try
    Screen.Cursor := crHourGlass;

    if dataSet.IsEmpty then
      Exit;

    if not vDadosIni.VerificarinicioFechFinan(buscas) then
      exit;

    if _documentoRecebidoOuSendoRecebido then
      Exit;

    FCodigo := dataSet.FieldByName('CODIGO_CH').AsInteger;

    if not vDadosIni.PesqPros('CAR009', 'EXCLUIR', ' NUM CH ' +
      Trim(dataSet.FieldByName('N_CH').AsString) +
      ' ' + dataSet.FieldByName('NOME_CH').AsString + ' AG ' +
      dataSet.FieldByName('AGENCIA').AsString +
      ' CTA ' + dataSet.FieldByName('CONTA').AsString,
      FTable, IntToStr(FCodigo) + '/' + Trim(dataSet.FieldByName('N_CH').AsString), buscas, True) then
      Exit;

    if Application.MessageBox(pchar('Tem Certeza que deseja Apagar este Registro?'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

    try

      dataSet.RefreshRecord;

      if Trim(dataSet.FieldByName('DATQ_CH').AsString) <> '' then
        raiseExceptionCreate('Cheque Não Pode Ser apagado. Já foi quitado', '');

      buscas.Close;
      buscas.SQL.Text := 'select * from LANCCHEQUE' +
        ' where CODIGO_CH = ' + IntToStr(FCodigo) +
        ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if buscas.IsEmpty then
      begin

        buscas.Close;
        buscas.SQL.Text := 'delete from CONTROLE_CHEQUE' +
          ' where CODIGO_CH = ' + IntToStr(FCodigo) +
          ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
        buscas.ExecSQL;

//        dataSet.Delete;
//        Apply;

        CommitaTransacao;
        Result := True;

        vDadosIni.GravaAuditoria('CAR009', 'EXCLUIR', 'COD CH ' + IntToStr(FCodigo) +
          ' SEM LANCCHEQUE',
          FTable, IntToStr(FCodigo), FBuscas2);

        Application.MessageBox(
          'Não foi possível localizar o lançamento correspondente (LANCCHEQUE). O Cheque foi apagado porém o lançamento não foi alterado',
          'Atenção', 0 + 64);
        Exit;
      end;

      FBuscas2.Close;
      FBuscas2.SQL.Text := 'select cod_lanc, status_l, valor_l from lancamentos' +
        ' where cod_lanc = ' + IntToStr(buscas.FieldByName('cod_lanc').AsInteger) +
        ' and codigo_emp = ' + vDadosIni.codEmpresa;
      FBuscas2.Open;

      if FBuscas2.IsEmpty then
      begin

        buscas.Close;
        buscas.SQL.Text := 'delete from LANCCHEQUE' +
          ' where CODIGO_CH = ' + IntToStr(FCodigo) +
          ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
        buscas.ExecSQL;

        buscas.Close;
        buscas.SQL.Text := 'delete from CONTROLE_CHEQUE' +
          ' where CODIGO_CH = ' + IntToStr(FCodigo) +
          ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
        buscas.ExecSQL;

//        dataSet.Delete;
//        Apply;

        CommitaTransacao;
        Result := True;

        vDadosIni.GravaAuditoria('CAR009', 'EXCLUIR', 'COD CH ' + IntToStr(FCodigo) +
          ' SEM LANCAMENTO',
          FTable, IntToStr(FCodigo), FBuscas2);

        Application.MessageBox(
          'Não foi possível localizar o lançamento correspondente (LANCAMENTOS). O Cheque foi apagado porém o lançamento não foi encontrado',
          'Atenção', 0 + 64);
        Exit;

      end;

      if Trim(FBuscas2.FieldByName('status_l').AsString) <> '' then
        raiseExceptionCreate('Cheque Não pode ser Apagado, entrou em data já fechada', '');

      if (dataSet.FieldByName('valor_ch').AsFloat < FBuscas2.FieldByName('valor_l').AsFloat) then
      begin
        FBuscas2.Close;
        FBuscas2.SQL.Text := 'update lancamentos set valor_l = valor_l - :valor_l' +
          ' where cod_lanc = ' + IntToStr(buscas.FieldByName('cod_lanc').AsInteger) +
          ' and codigo_emp = ' + vDadosIni.codEmpresa;
        FBuscas2.ParamByName('valor_l').AsFloat := dataSet.FieldByName('valor_ch').AsFloat;
      end
      else
      begin
        FBuscas2.Close;
        FBuscas2.SQL.Text := 'delete from lancamentos' +
          ' where cod_lanc = ' + IntToStr(buscas.FieldByName('cod_lanc').AsInteger) +
          ' and codigo_emp = ' + vDadosIni.codEmpresa;
      end;
      FBuscas2.ExecSQL;

      FBuscas2.Close;
      FBuscas2.SQL.Text := 'delete from LANCCHEQUE' +
        ' where CODIGO_CH = ' + IntToStr(FCodigo) +
        ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
      FBuscas2.ExecSQL;

      FBuscas2.Close;
      FBuscas2.SQL.Text := 'delete from controle_cheque' +
        ' where CODIGO_CH = ' + IntToStr(FCodigo) +
        ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
      FBuscas2.ExecSQL;

//      dataSet.Delete;
//
//      if not Apply then
//        raiseExceptionCreate('Não foi possivel excluir o registro', '');

      CommitaTransacao;
      Result := True;

      dataSet.Close;
      dataSet.Open;

      vDadosIni.GravaAuditoria('CAR009', 'EXCLUIR', 'COD CH ' + IntToStr(FCodigo) + ' SUCESSO',
        FTable, IntToStr(FCodigo), FBuscas2);

      FBuscas2.Close;
      buscas.Close;

    except
      on e: exception do
      begin
        RollBackTransacao;
        registraErro('function TControleCheque.delete. Erro: ' + e.Message);
        Application.MessageBox(pchar('Erro ao excluir cheque. Erro: ' + e.Message),
          'Atenção', 0 + 64);
        verificaErroDataSetOpen(E.Message);
      end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

destructor TControleCheque.Destroy;
begin

  vPCont.Free;
  vPCont := nil;

  vCtrl.Free;
  vCtrl := nil;

  vHistPCont.Free;
  vHistPCont := nil;

  vContabanc.Free;
  vContabanc := nil;

  vCl.Free;
  vCl := nil;

  vBx.Free;
  vBx := nil;

  vEmpresasUnificadas.Free;
  vEmpresasUnificadas := nil;

  vDocumentosOrigem.Free;
  vDocumentosOrigem := nil;
  
  inherited;
end;

function TControleCheque.edit: Boolean;
begin

  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CAR007', 'ALTERAR', '', FTable,
    dataSet.FieldByName('codigo_ch').AsString + '/' + dataSet.FieldByName('n_ch').AsString,
    buscas, True) then
    exit;

  if not vDadosIni.definirDiaFinanceiroFechado(buscas) then
    Exit;

  if _documentoRecebidoOuSendoRecebido then
    Exit;

  fbookMark := dataSet.GetBookmark;

  if (dataSet.FieldByName('status_ch').AsString) <> '' then
    Result := True
  else if inherited Edit then
  begin
    FCodigo := dataSet.FieldByName('codigo_ch').AsInteger;
    vCodEmpMult := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
    vCodigoCtrl := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
    Result := True;
  end;

  if Result then
  begin
    vPCont._abrePContasLanc('E', dataSet.FieldByName('N_CONTA_PLC').AsFloat);
    vCtrl._abreTodosControlesCAR(
    	FDocs,
      false,
      dataSet.FieldByName('CODIGO_CTRL').AsInteger,
      dataSet.FieldByName('COD_EMP_MULT').AsInteger);
    vEmpresasUnificadas._abreTodosEmpresas;
  end;

end;

function TControleCheque.insert: Boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('CAR005', 'INCLUIR', '', FTable, '',
    buscas, True) then
    exit;

  if not vDadosIni.VerificarinicioFechFinan(buscas) then
    exit;

  if not vDadosIni.definirDiaFinanceiroFechado(buscas) then
    Exit;

  //if _documentoRecebidoOuSendoRecebido then
    //Exit;

  if not dataSet.Active then
   montaSelect(' select ' + Fsql_campos + ' from controle_cheque ' +
     Fsql_inner +
     Fsql_inner_pag +
     ' where controle_cheque.codigo_ch = 0 ' +
     ' and controle_cheque.codigo_emp = 0 ');

  fbookMark := dataSet.GetBookmark;

  if inherited insert then
  begin
    dataSet.FieldByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
    if (vDadosIni.vEmp.vFinanceiroUnificado) and (Recebendo) then
      dataSet.FieldByName('COD_EMP_MULT').AsInteger := dadosReceber.codigoUnificada
    else
      dataSet.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('DATA_REC').AsDateTime := vDadosIni.diaFFinanceiro + 1;
    dataSet.FieldByName('DTORIGINAL_CH').AsDateTime := vDadosIni.diaFFinanceiro + 1;
    dataSet.FieldByName('TIP_CNT').AsString := 'N';
    dataSet.FieldByName('HISTORICO_CH').AsString := 'RECEBIMENTO DE CHQ PREDATADO';
    dataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('TIP_CNT').AsString := 'N';
    dataSet.FieldByName('VALOR_DESC').AsFloat := 0;
    dataSet.FieldByName('VALOR_ACRESC').AsFloat := 0;
    vCodEmpMult := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
    vCodigoCtrl := 0;
    FCodigo := 0;

    vPCont._abrePContasLanc('E');
    vCtrl._abreTodosControlesCAR(
    	FDocs,
      dataSet.FieldByName('COD_EMP_MULT').AsInteger);
    vEmpresasUnificadas._abreTodosEmpresas;

    Result := True;
  end;
end;

function TControleCheque.post: Boolean;
var
  acao: string;
  vTemp: string;
  vCodigoControle: Integer;
  vCodigoGenCodigo: Integer;
  vNegCliente: TNegativacaoCliente;
  vListaClBarrarDesbarrar: TStringList;
  I: Integer;
begin
  try
    vListaClBarrarDesbarrar := TStringList.Create;
    vListaClBarrarDesbarrar.Sorted := True;
    vListaClBarrarDesbarrar.Duplicates := dupIgnore;
    vListaClBarrarDesbarrar.Clear;

    try
      Result := false;

      if dataSet.State = dsInsert then
        acao := 'INSERIR'
      else
        acao := 'EDITAR';

      if not vDadosIni.PesqPros('CAR030', acao, ' NUM CH' +
        Trim(dataSet.FieldByName('N_CH').AsString),
        FTable, IntToStr(FCodigo) + '/' + Trim(dataSet.FieldByName('N_CH').AsString), buscas, True) then
        exit;

      if not (dataSet.State in [dsEdit, dsInsert]) then
      begin
        Result := True;
        exit;
      end;

      if vDadosIni.vEmp.vFinanceiroUnificado then
      begin
        if dataSet.FieldByName('COD_EMP_MULT').AsInteger <= 0 then
          raiseExceptionCreate('Código Empresa Unificada', 'DBEdit65');

        if not vEmpresasUnificadas._BuscarEmpresas(dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
          raiseExceptionCreate('Código Empresa Unificada não existe ou não encontrada!', 'DBEdit65');
      end
      else
        dataSet.FieldByName('COD_EMP_MULT').AsInteger := dataSet.FieldByName('CODIGO_EMP').AsInteger;

      if dataSet.FieldByName('N_CONTA_PLC').AsFloat <= 0 then
        raiseExceptionCreate('Nº da Conta deve ser preenchido', 'DBEdit1');

      if not _existePContas(0) then
        raiseExceptionCreate('Nº da Conta não encontrado no Plano de Contas ou não é de entrada', 'DBEdit1');

      if (vPCont.dataSet.FieldByName('sthab').AsString) = 'N' then
        raiseExceptionCreate('Nº da Conta Desabilitada, tente outra', 'DBEdit1');

      if (vPCont.dataSet.FieldByName('tipo_plc').AsString) <> 'E' then
        raiseExceptionCreate('Nº da Conta não é de entrada, use outra', 'DBEdit1');

      if dataSet.FieldByName('data_rec').AsDateTime > (vDadosIni.diaFFinanceiro + 1) then
        raiseExceptionCreate('Data ainda não programada', 'DBEdit3');

      if vCtrl.dataSet.FieldByName('qperf').AsInteger = 4 then
        if dataSet.FieldByName('data_venda').AsString = '' then
          raiseExceptionCreate('Data da Venda Obrigatória', 'DBEdit4');

      if vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_CH').AsFloat,2) <= 0 then
        raiseExceptionCreate('Valor do cheque deve ser maior que zero', 'DBEdit12');

      if not _existeControle(
        dataSet.FieldByName('codigo_ctrl').AsInteger,
        vDadosIni.IfThen(dataSet.State = dsEdit, 0, dataSet.FieldByName('COD_EMP_MULT').AsInteger)) then
          raiseExceptionCreate('Controle não encontrado ou não informado', 'DBEdit18');

      if Trim(dataSet.FieldByName('nome_ch').AsString) = '' then
        raiseExceptionCreate('Nome do Cliente Inválido', 'DBEdit13');

      if Trim(dataSet.FieldByName('data_venc').AsString) = '' then
        raiseExceptionCreate('Data vencimento inválida', 'DBEdit11');

      if not dataSet.FieldByName('data_prev_rec').IsNull then
        if dataSet.FieldByName('data_venc').AsDateTime > dataSet.FieldByName('data_prev_rec').AsDateTime then
        begin
          if not vDadosIni.PesqPros('CAR109', 'PERMITIR', ' NUM CH' +
            Trim(dataSet.FieldByName('N_CH').AsString),
            FTable, IntToStr(FCodigo) + '/' + Trim(dataSet.FieldByName('N_CH').AsString), buscas, True) then
              raiseExceptionCreate('Data previsão recebimento menor que data vencimento', 'DBEdit70');
        end;

      try
        vCtrl._selecionaControle(
          dataSet.FieldByName('codigo_ctrl').AsInteger,
          vDadosIni.IfThen(dataSet.State = dsEdit, dataSet.FieldByName('COD_EMP_MULT').AsInteger, 0));
        if (vCtrl.dataSet.FieldByName('BARRAR_AUTOMATICO').AsString <> 'S') or (vDadosIni.vEmp.vUsarBarramento <> 'S') then
          if not _VerificaTpControle(dataSet.FieldByName('codigo_ctrl').AsInteger) then
            raiseExceptionCreate('Tipo do controle não é para cheque(S1)', 'DBEdit18');

        if vDadosIni.vEmp.vUsarBarramento = 'S' then
          if vCtrl.dataSet.FieldByName('BARRAR_AUTOMATICO').AsString = 'S' then
            if dataSet.FieldByName('COD_CLIENTE').AsInteger = 0 then
              raiseExceptionCreate('Para controles cujo o barramento de cliente é automático o código do cliente é obrigatório. Favor informá-lo',
                'DBEdit13');
      finally
        vCtrl._abreTodosControlesCAR(FDocs, dataSet.FieldByName('COD_EMP_MULT').AsInteger);
      end;

      if not _clienteValido then
        exit;

      if not _clienteTerceiroValido then
        exit;

      _verificaDataVenda;

      vDadosIni.vInibeMensPesqPros:='S';
      if not vDadosIni.PesqPros('CAR077', acao, ' NUM CH' +
        Trim(dataSet.FieldByName('N_CH').AsString),
        FTable, IntToStr(FCodigo) + '/' + Trim(dataSet.FieldByName('N_CH').AsString), buscas, True) then
        if not _existeColaborador(dataSet.FieldByName('CODIGO_VEND').AsInteger,
          dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
          raiseExceptionCreate('Colaborador não encontrado no cadastro', 'DBEdit21')
      else
       if dataSet.FieldByName('CODIGO_VEND').AsInteger > 0 then
        if not _existeColaborador(dataSet.FieldByName('CODIGO_VEND').AsInteger,
          dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
          raiseExceptionCreate('Colaborador não encontrado no cadastro', 'DBEdit21');

      if not _existeVenda then
      begin
        Exit;
        vNomeCampoErro := 'DBComboBox1';
      end;

      if dataSet.FieldByName('cod_cliente').AsInteger = 0 then
        dataSet.FieldByName('razao').AsString := '';

      vCodigoGenCodigo := 0;
      if not Recebendo then
        if dataSet.State = dsInsert then
        begin
          if dataSet.FieldByName('cod_cliente').AsInteger > 0 then
            try
              vCtrl._selecionaControle(dataSet.FieldByName('codigo_ctrl').AsInteger, dataSet.FieldByName('COD_EMP_MULT').AsInteger);
              if vCtrl.dataSet.FieldByName('barrar_automatico').AsString = 'S' then
              begin
                vNegCliente := TNegativacaoCliente.create(buscas.Transaction, FDocs);
                vNegCliente.dados.acao := naNegativar;
                vNegCliente.dados.alterarConta := False;
                vNegCliente.dados.codCliente := dataSet.FieldByName('cod_cliente').AsInteger; // cliente do cheque
                vNegCliente.dados.codigoUnificada := dataSet.FieldByName('cod_emp_mult').AsInteger;
                if not vNegCliente.executar then
                  raiseExceptionCreate(vNegCliente.MsgErro, '');
              end;
            finally
              vCtrl._abreTodosControlesCAR(FDocs, dataSet.FieldByName('COD_EMP_MULT').AsInteger);
            end;
          // ver a paradinha da negativacao aqui
          vCodigoGenCodigo := Gencodigo('CONTROLE_CHEQUE', dtmContasAReceber.SpIncCodigo,
            vDadosIni.codEmpresa);
          vDadosIni.hw_registra_estatistica('CONTROLE_CHEQUE');
          dataSet.FieldByName('CODIGO_CH').AsInteger := vCodigoGenCodigo;
          FCodigo := vCodigoGenCodigo;

        end;
      {else
      begin
      if (dataSet.FieldByName('DATA_VENC').AsDateTime+vDadosIni.vEmp.vDiasCarenciaJuros) <
        vDadosIni.getDataBanco(buscas) then
        begin
         dadosCDL.vNegativar := True;
         dadosCDL.vImprimirFichaSPC := False;
         dadosCDL.vValorVenda := False;
         dadosCDL.vCadastro := True;
         _negativaDesnegativaCliente;
        end
        else
        begin
          if _desnegativaClienteRecebimento(dataset.FieldByName('COD_CLIENTE').asinteger,2) then
          begin
           dadosCDL.vNegativar  := false;
           dadosCDL.vImprimirFichaSPC := False;
           dadosCDL.vValorVenda := False;
           dadosCDL.vCadastro := True;
           _negativaDesnegativaCliente;
          end;
        end;
      end;}

      vCodigoControle := dataSet.FieldByName('codigo_ctrl').AsInteger;
      dataSet.FieldByName('TIP_CNT').AsString := vDadosIni.retornoPorCondicao(dataSet.FieldByName('VL_CONTABIL').AsFloat > 0, 'C', 'N');

      dataSet.Post;

      if not Recebendo then
      begin
      	if ((vDadosIni.vCliente.Barramento.vBarraAutomaticamenteAposVencCrediario = 'S')
            and (vDadosIni.vCliente.Barramento.vCodigoBarrado > 0))
          or ((vDadosIni.vCliente.Barramento.vDesbarraAutomaticamenteAposQuitCrediario = 'S')
            and (vDadosIni.vCliente.Barramento.vCodigoDesbarrado > 0)) then
        begin
          if (dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
          begin
            if (vDadosIni.vEmp.vFinanceiroUnificado)
              and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
            begin
              if trim(dataSet.FieldByName('CPFCGC').AsString) <> '' then
                vListaClBarrarDesbarrar.Add(trim(dataSet.FieldByName('CPFCGC').AsString));
            end
            else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
              vListaClBarrarDesbarrar.Add(IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger));
          end;
        end;
      end;

      if dataSet.ChangeCount = 0 then
      begin
        if not Recebendo then
          Result := True;
        exit;
      end;

      if Recebendo then
      begin
        Result := True;
        Exit;
      end;

      Apply;

      try
        vLancL := TLancamentosImp.create;
        vContLigL := TContaLigacaoImp.create;

        vLancL._setTransactionComponentes(transacao);
        //vLancL.queryLanc.Transaction := transacao;

        if vCodigoGenCodigo > 0 then
        begin

          vContLigL._AbrirContadeLigacao(True);

          vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_V_PROD').AsFloat;

          //        vContLigL.vPCont.dataSet.Locate('N_CONTA_PLC', vLancL.N_CONTA_PLC, []);
          if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
            raiseExceptionCreate('Corrija o cadastro para continuar', '');

          vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
          vLancL.CODIGO_CTRL := dataSet.FieldByName('codigo_ctrl').AsInteger;
          vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
          vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
          vLancL.HISTORICO_L := dataSet.FieldByName('HISTORICO_CH').AsString;
          vLancL.VALOR_L := dataSet.FieldByName('VALOR_CH').AsCurrency;
          vLancL.NDOC_L := Trim(dataSet.FieldByName('n_ch').AsString);
          vLancL.COD_EMP_MULT := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
          vLancL.VL_CONTABIL := dataSet.FieldByName('vl_contabil').AsFloat;
          vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
          vLancL._efetuarLancamentoSequencial(FCodigoLancamento, vCodigoControle, 'E');
          //MAIS PARAMETROS, CONTROLE, NATUREZA
          FCodigoLancamento := vLancL.COD_LANC;

          buscas.Close;
          buscas.SQL.Text := 'INSERT INTO LANCCHEQUE (COD_LANC, CODIGO_CH, CODIGO_EMP)' +
            ' VALUES (:COD_LANC, :CODIGO_CH, :CODIGO_EMP)';
          buscas.ParamByName('COD_LANC').AsInteger := FCodigoLancamento;
          buscas.ParamByName('CODIGO_CH').AsInteger := vCodigoGenCodigo;
          buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ExecSQL;

        end;

      finally
        vLancL._setTransactionComponentes(nil);
        vContLigL.Free;
        vLancL.Free;

        vContLigL:= nil;
        vLancL := nil;
      end;

      _verificaContaBancaria;

      CommitaTransacao;

      vDadosIni.GravaAuditoria('CAR030', acao, ' NUM CH ' + Trim(dataSet.FieldByName('N_CH').AsString) +
        ' SALVO COM SUCESSO', FTable, IntToStr(FCodigo) + '/' +
        Trim(dataSet.FieldByName('N_CH').AsString), buscas);

      Result := true;

      if not FSequencial then
        FCodigoLancamento := 0;

      try
        dataSet.Refresh;
        dataSet.GotoBookmark(fBookMark);
      except
      end;

    except
      on e: exception do
      begin
        transacao.Rollback;
        Result := false;
        Application.MessageBox(pchar('Erro ao salvar cheque. Erro: ' + e.Message), 'Atenção', 0
          + 64);
        registraErro('function TControleCheque.post. Erro: ' + e.Message);
        verificaErroDataSetOpen(E.Message);
      end;
    end;
  finally
  	if vListaClBarrarDesbarrar.Count > 0 then
    begin
      for I := 0 to vListaClBarrarDesbarrar.Count - 1 do
      begin
        if trim(vListaClBarrarDesbarrar[I]) <> '' then
        begin
          if vDadosIni.vEmp.vFinanceiroUnificado then
            vDadosIni.negativarClientes(0, trim(vListaClBarrarDesbarrar[I]))
          else
            vDadosIni.negativarClientes(StrToInt(vListaClBarrarDesbarrar[I]), '');
        end;
      end;
    end;

    if Assigned(vListaClBarrarDesbarrar) then
      FreeAndNil(vListaClBarrarDesbarrar);
  end;
end;

function TControleCheque.verificarNSUnumAutorizacao(pNSU, pNumAut: string;
  pNumParc, pCodEmpMult, pCodCred: Integer): boolean;
begin
  Result := True;
end;

{ TContasAReceber }

function TContasAReceber.cancel: Boolean;
begin
  Result := inherited Cancel;
  FCodigoLancamento := 0;
end;

procedure TContasAReceber.dataSetNomeRazaoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
 try
   if Sender.FieldName = 'CPFCGC' then
     if dataSet.FindField('CPFCGC_CLIENTE') <> nil then
       if (Trim(dataSet.FieldByName('CPFCGC_CLIENTE').AsString) <> '') then
         Text := Trim(dataSet.FieldByName('CPFCGC_CLIENTE').AsString)
       else
         Text := Trim(dataSet.FieldByName(Sender.FieldName).AsString);
         
   if Sender.FieldName = 'RAZAO' then
     if dataSet.FindField('RAZAO_CLIENTE') <> nil then
       if (Trim(dataSet.FieldByName('RAZAO_CLIENTE').AsString) <> '') then
         Text := Trim(dataSet.FieldByName('RAZAO_CLIENTE').AsString)
       else
         Text := Trim(dataSet.FieldByName(Sender.FieldName).AsString);

   if Sender.FieldName = 'NOME_C' then
     if dataSet.FindField('NOME_CLIENTE') <> nil then
       if (Trim(dataSet.FieldByName('NOME_CLIENTE').AsString) <> '') then
         Text := Trim(dataSet.FieldByName('NOME_CLIENTE').AsString)
       else
         Text := Trim(dataSet.FieldByName(Sender.FieldName).AsString);
  except
  end;
end;

function TContasAReceber.retornacodvendedor(vnome: string; pCodigoUnificada: Integer): integer;
begin
  buscas.close;
  if vDadosIni.vEmp.vFinanceiroUnificado then
  begin
    if pCodigoUnificada > 0 then
      buscas.sql.text := 'select cod_vendedor from colaborador where nome_vendedor = ''' +
        Trim(vnome) + ''' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa) + ' and ativo = 1'
    else
      buscas.sql.text := 'select cod_vendedor from colaborador where nome_vendedor = ''' +
        Trim(vnome) + ''' and cod_empresa in ' + vDadosIni.vEmp.vCodigoUnificadas + ' and ativo = 1';
  end
  else
    buscas.sql.text := 'select cod_vendedor from colaborador where nome_vendedor = ''' +
      Trim(vnome) + ''' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa) + ' and ativo = 1';
  buscas.open;
  if not buscas.isempty then
    result := buscas.FieldByName('COD_VENDEDOR').AsInteger
  else
    Result := 0;
  buscas.Close;
end;

procedure TContasAReceber.retornaTransaction;
begin
  dtmContasAReceber.qrBuscas.Close;
  dtmContasAReceber.qrBuscas1.Close;
  dtmContasAReceber.qrBuscas2.Close;
  dtmContasAReceber.qrBuscas3.Close;

  dtmContasAReceber.qrRec.Close;
  dtmContasAReceber.qrRec3.Close;

  dtmContasAReceber.qrCtrlCr.Close;
  dtmContasAReceber.qrCtrlCr3.Close;

  dtmContasAReceber.qrCtrlCh.Close;
  dtmContasAReceber.qrCtrlCh3.Close;

  dtmContasAReceber.qrBuscas.Transaction := TIBTransaction(dtmContasAReceber.transacao);
  dtmContasAReceber.Qrbuscas1.Transaction := TIBTransaction(dtmContasAReceber.transacao);
  dtmContasAReceber.qrBuscas2.Transaction := TIBTransaction(dtmContasAReceber.transacao);
  dtmContasAReceber.Qrbuscas3.Transaction := TIBTransaction(dtmContasAReceber.transacao);

  dtmContasAReceber.qrRec.Transaction := TIBTransaction(dtmContasAReceber.transacao);
  dtmContasAReceber.qrRec3.Transaction := TIBTransaction(dtmContasAReceber.transacao);

  dtmContasAReceber.qrCtrlCr.Transaction := TIBTransaction(dtmContasAReceber.transacao);
  dtmContasAReceber.qrCtrlCr3.Transaction := TIBTransaction(dtmContasAReceber.transacao);

  dtmContasAReceber.qrCtrlCh.Transaction := TIBTransaction(dtmContasAReceber.transacao);
  dtmContasAReceber.qrCtrlCh3.Transaction := TIBTransaction(dtmContasAReceber.transacao);
end;

function TContasAReceber.testarNumConta(pNatureza: string; pNumConta: Double;
  var pMensagem: string): boolean;
begin
  try
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
//    
//    if buscas.IsEmpty then
//      Exit;
//
//    if buscas.FieldByName('GERAR_CONTRAPARTIDA').AsString = 'S' then
//    begin
//      Result := false;
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
//   	 	  Exit;
//    end
//    else
//    begin
//      if buscas.FieldByName('TIPO_PLC').AsString = 'S' then //Conta de saída
//   	 	  Exit
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

function TContasAReceber.validarRegistrosParaQuitacao(
  pQuitarParc: boolean): boolean;
var
 vcodigoUnificada: Integer;
 vcodigo_emp: Integer;
 vcod_credcheque: Integer;
 vcampo, vcampoquit, vcampodtquit, vcamponum_credcheque, vcampodtvenc, vcamponomecliente: string;
 vCredCheques: TStringList;
 I: Integer;
 vRegSel: boolean;
 v2RegSel: boolean;

 procedure _marcaRetirarSelecao(pRetira: boolean = false);
 begin
 	 if dataSet.IsEmpty then
    exit;

   dataSet.Edit;
   if pRetira then
     dataSet.FieldByName('sel').AsString := ''
   else
     dataSet.FieldByName('sel').AsString := 'S';
   dataSet.Post;
 end;

 begin
 try
    result := false;
    if FDocs = 'S1' then
    begin
    	vcampo := 'CODIGO_CH';
      vcampoquit := 'STATUS_CH';
      vcampodtquit := 'DATQ_CH';
      vcampodtvenc := 'DATA_VENC';
      vcamponum_credcheque := 'N_CH';
      vcamponomecliente := 'NOME_CH';
    end
    else
    begin
      vcampo := 'COD_CRED';
    	vcampoquit := 'STATUS_C';
      vcampodtquit := 'DATQ_C';
      vcampodtvenc := 'DATA_VENC_C';
      vcamponum_credcheque := 'N_DOC_C';
      vcamponomecliente := 'NOME_C';
    end;

    vCredCheques := TStringList.Create;
    vCredCheques.Clear;

    if pQuitarParc then
    begin
    	try
	      vcod_credcheque := dataSet.FieldByName(vcampo).AsInteger;
  	    vcodigo_emp := dataSet.FieldByName('codigo_emp').AsInteger;

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
              vcod_credcheque := dataSet.FieldByName(vcampo).AsInteger;
		    	    vcodigo_emp := dataSet.FieldByName('codigo_emp').AsInteger;
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
        dataSet.Filter := vcampo + ' = ' + IntToStr(vcod_credcheque) +
        	' and codigo_emp = ' + IntToStr(vcodigo_emp);
        dataSet.Filtered := true;
        
        Refresh;

        if trim(dataSet.FieldByName(vcampoquit).AsString) = 'QUITADO' then
        begin
          Application.MessageBox(PChar('Documento já esta quitado. Data ' + FormatDateTime('dd/mm/yyyy', dataset.FieldByName(vcampodtquit).AsDateTime) + #13 + #13 +
		        'Código: ' + IntToStr(dataset.FieldByName(vcampo).AsInteger) + #13 +
    		    'Número: ' + Trim(dataset.FieldByName(vcamponum_credcheque).AsString) + #13 +
        		'Data Venc: ' + FormatDateTime('dd/mm/yyyy', dataset.FieldByName(vcampodtvenc).AsDateTime) + #13 +
        		'Cliente: ' + IntToStr(dataset.FieldByName('cod_cliente').AsInteger) + ' - ' +
		        trim(dataSet.FieldByName(vcamponomecliente).AsString)), 'Informação', MB_OK + MB_ICONINFORMATION);
          exit;
        end;

        if IsEmpty then
        begin
          Application.MessageBox(PChar('Nenhum documento ainda não quitado foi selecionado para recebimento'),
            'Informação', MB_OK + MB_ICONINFORMATION);
          dataSet.Filtered := false;
          dataSet.CancelUpdates;
          Refresh;
          exit;
        end;

      finally
        dataSet.Filtered := false;
      end;

      dataSet.Locate(vcampo +';CODIGO_EMP', VarArrayOf([vcod_credcheque, vcodigo_emp]), []);

      if (dataSet.FieldByName(vcampo).AsInteger <> vcod_credcheque)
        or (dataSet.FieldByName('codigo_emp').AsInteger <> vcodigo_emp) then
      begin
        Application.MessageBox(PChar('Nenhum documento ainda não quitado foi informado para recebimento'), 'Informação', MB_OK + MB_ICONINFORMATION);
        dataSet.Filtered := false;
        dataSet.CancelUpdates;
        Refresh;
        exit;
      end;
      Result := true;  
    end
    else
    begin
    	try
        dataSet.Filtered := false;
        dataSet.Filter := 'SEL=''S'' ';
        dataSet.Filtered := true;
        
        vcodigoUnificada := 0;

        try
        	dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
            if (dataSet.FieldByName('SEL').AsString = 'S') then
            begin
              vCredCheques.Add(IntToStr(dataSet.FieldByName(vcampo).AsInteger));

              if vcodigoUnificada = 0 then
                vcodigoUnificada := dataSet.FieldByName('cod_emp_mult').AsInteger
              else if vcodigoUnificada <> dataSet.FieldByName('cod_emp_mult').AsInteger then
              begin
                _desmarcaLinha;
                if Application.MessageBox(pchar('Documento selecionado pertence a Unificada: ' +
                  dataSet.FieldByName('cod_emp_mult').AsString +
                  ' diferente dos demais selecionados: ' + IntToStr(vcodigoUnificada)
                  + #13 +
                  'Se continuar o documento será desmarcado. Deseja continuar mesmo assim?'),
                  'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
                  Exit;
              end;
            end;
            dataSet.Next;
          end;
        finally
          dataSet.EnableControls;
        end;

        dataSet.Filtered := false;
        dataSet.Filter := vcampo + ' in (';

        for I := 0 to vCredCheques.Count - 1 do
        	if I = 0 then
            dataSet.Filter := dataSet.Filter + vCredCheques[i]
          else
          	dataSet.Filter := dataSet.Filter + ', '+ vCredCheques[i];
        dataSet.Filter := dataSet.Filter + ')';
        dataSet.Filtered := true;

        Refresh;

        try
        	dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
            if trim(dataSet.FieldByName(vcampoquit).AsString) = 'QUITADO' then
              _marcaRetirarSelecao(true) //aqui pelo filtro já dá um next
            else
              _marcaRetirarSelecao;
            dataSet.Next;
          end;
        finally
          dataSet.EnableControls;
        end;

        dataSet.Filter := 'SEL = ''S'' ';

        if IsEmpty then
        begin
          Application.MessageBox(PChar('Nenhum documento ainda não quitado foi selecionado para recebimento'), 'Informação', MB_OK + MB_ICONINFORMATION);
          dataSet.Filtered := false;
          dataSet.CancelUpdates;
          Refresh;
          exit;
        end;
      finally
        dataSet.Filtered := false;
      end;
    end;
    Result := true;
 except
   on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
 end;
end;

procedure TContasAReceber.verificaErroDataSetOpen(pErro: string);
begin
  if (Pos('Dataset open', pErro) > 0)
    or (Pos('Unable to complete network', pErro) > 0)
    or (Pos('shutdown', pErro) > 0) then
  begin
    Application.MessageBox('Falha de conexão com o banco de dados. O sistema vai tentar recuperar a conexão', 'Atenção', 0 + 64);
    if not vDadosIni.conectaBanco(dtmAtivo.bancoHw, vDadosIni.vBancoHW, True) then
      Application.MessageBox('O sistema não recuperou a conexão. Favor entre novamente no sistema', 'Atenção', 0 + 64);
  end;
end;

function TContasAReceber.verificarConta(pNatureza: string;
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

procedure TContasAReceber.verificaRecibo;
var
  StrCodCliente: string;
begin
 try
   if TConfig_sistema_class.getConf('rec_exibicao_recebimento', buscas, vDadosIni.cod_empresa).
     ReadString('Onde', 'ContasAReceber', '') <> 'S' then
     Exit;

   prepare_loop('SEL = ''S''');
   try
     StrCodCliente := '';
     try
     	 dataSet.DisableControls;
       while not dataSet.Eof do
       begin
         if fint('cod_cliente') > 0 then
           StrCodCliente := StrCodCliente + IfThen(StrCodCliente <> '', ',') + IntToStr(fint('cod_cliente'));
         dataSet.Next;
       end;
     finally
       dataSet.EnableControls;
     end;

     if StrCodCliente = '' then
       Exit;

   finally
     prepare_loop_done;
   end;

   if SqlOpen('select sum(valor) soma from recibos' +
              ' where cod_benef in (%s) and ((RECANT = ''S'') or (RECANT = ''O'')) and COD_EMPRESA = %d' +
              ' and ativo = 1 and ((status_rec is null) or (status_rec <> ''RECEBIDO''))',
              [StrCodCliente, vDadosIni.cod_empresa]).
              FieldByName('soma').AsFloat > 0 then
     ShowAtencao('Cliente possui Vale Compra / Recibos');

 except
    on e: exception do
    begin
      ShowErro('Erro: ' + e.Message);
      registraErro('TContasAReceber.verificaRecibo ' + e.Message);
    end;
  end;
end;

function TContasAReceber._abreFormCadastroContasBancarias: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Contas Bancárias';

    frmCadContasAReceber.pnCadastroContasBancarias.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnCadastroContasBancarias.Parent := frmCadContasAReceber.tsContasBancarias;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormComissao: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Data e valor pago para cálculo de comissão';

    frmCadContasAReceber.pnComissao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnComissao.Parent := frmCadContasAReceber.tsComissao;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormConsultaContasBancarias: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Contas Bancárias';

    frmCadContasAReceber.pnConsultaContasBancarias.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnConsultaContasBancarias.Parent := frmCadContasAReceber.tsContasBancarias;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormDadosParaBaixa: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Informe dados para baixa';

    frmCadContasAReceber.pnDadosBaixa.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnDadosBaixa.Parent := frmCadContasAReceber.tsDesconto;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormDataPrevRec(pQtdeReg: Integer): Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption :=
      'Data Previsão de Recebimento ' +
      	vDadosIni.IfThen(pQtdeReg > 1, '(' + IntToStr(pQtdeReg) + ')', '');

    frmCadContasAReceber.pnDataPrevRec.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    vDadosIni.definirDiaFinanceiroFechado(buscas);
    frmCadContasAReceber.edDataPrevRec.Text := DateToStr(vDadosIni.diaFFinanceiro + 1);
    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnDataPrevRec.Parent := frmCadContasAReceber.tsDataPrevRec;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormDataRealBaixa: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption :=
      'Data Real da Baixa de CréditosData e valor pago para cálculo de comissão';

    frmCadContasAReceber.pnDataRealBaixa.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    vDadosIni.definirDiaFinanceiroFechado(buscas);
    frmCadContasAReceber.edDataRealBaixa.Text := DateToStr(vDadosIni.diaFFinanceiro + 1);
    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnDataRealBaixa.Parent := frmCadContasAReceber.tsDataRealBaixa;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormDesconto(pValorOperacao: Real): Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Desconto/Acréscimo em valor corrigido';

    frmCadContasAReceber.pnDesconto.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    frmCadContasAReceber.pnValorDaOperacao.Caption := Format('%0.2n', [pValorOperacao]);
    frmCadContasAReceber.edDescPerc.AsValue := 0;
    frmCadContasAReceber.edDescValor.AsValue := 0;
    frmCadContasAReceber.RadioGroupDescontoAcrescimo.ItemIndex := _LerConfiguracoesRegistroInteger(frmCadContasAReceber.RadioGroupDescontoAcrescimo.Name);
    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnDesconto.Parent := frmCadContasAReceber.tsDesconto;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormDetalhes(pReciboBaixa: Boolean): Boolean;
var
  formulario: TfrmPadrao;
  I: Integer;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    if FDocs = 'S1' then
      formulario.Caption := 'Detalhamento do Cheque'
    else
      formulario.Caption := 'Detalhamento do recebimento de prestação';

    frmCadContasAReceber.pnDetalhes.Parent := formulario;
    frmCadContasAReceber.BitBtn23.Enabled := not pReciboBaixa;
    frmCadContasAReceber.BitBtn44.Enabled := not pReciboBaixa;
    frmCadContasAReceber.SpeedButton44.Enabled := not pReciboBaixa;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    
    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnDetalhes.Parent := frmCadContasAReceber.tsDetalhes;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormDiferenciaDoRecebimento: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Lançamento de Diferença';
    formulario.ShowHint := true;

    frmCadContasAReceber.pnDiferenca.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    formulario.BorderIcons := [];

    result := (formulario.ShowModal = IDOK);
    Fhistdigdif := frmCadContasAReceber.edHistoricoDiferenca.Text;
    FvalorContabildigdif := frmCadContasAReceber.edVlContDif.AsValue;

  finally
    frmCadContasAReceber.pnDiferenca.Parent := frmCadContasAReceber.tsDesconto;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormHistoricoCliente: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Histórico';

    frmCadContasAReceber.pnHistorico.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnHistorico.Parent := frmCadContasAReceber.tsHistorico;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormImpressao: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Impressão';

    frmCadContasAReceber.pnImpressao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnImpressao.Parent := frmCadContasAReceber.tsImpressao;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormLoteQuitacao: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Lote de Quitação';

    frmCadContasAReceber.pnLoteQuit.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnLoteQuit.Parent := frmCadContasAReceber.tsLoteQuit;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormMudarControleOuVoltarParaAtivo(
  pCaptionForm, pCaptionPanel: string; var pHistorio: string): Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := pCaptionForm;
    frmCadContasAReceber.pnCaptionOperacao.Caption := pCaptionPanel;
    frmCadContasAReceber.edhistorico.Text := Trim(pHistorio);

    frmCadContasAReceber.pnMudaControleOuVoltaParaAtivo.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    frmCadContasAReceber.ckTranspComissao.Visible := False;
    frmCadContasAReceber.ckTranspComissao.Checked := False;
    if (FDocs = 'S1') and (vDadosIni.vEmp.vUsarComissaoPorRecebimentoProporcional = 'S') and (pos('Voltar Cheque', pCaptionForm) > 0) and (dataSet.FieldByName('vl_baixa_comissao').AsFloat > 0) then
      frmCadContasAReceber.ckTranspComissao.Visible := True;

    result := (formulario.ShowModal = IDOK);
    pHistorio := Trim(frmCadContasAReceber.edhistorico.Text);
    fTransportarValorComissao := false;
    if vDadosIni.vEmp.vUsarComissaoPorRecebimentoProporcional = 'S' then
      fTransportarValorComissao := frmCadContasAReceber.ckTranspComissao.Checked;

  finally
    frmCadContasAReceber.pnMudaControleOuVoltaParaAtivo.Parent :=
      frmCadContasAReceber.tsMudaControleOuVoltaParaAtivo;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormNegativarCliente: Boolean;
var
  formulario: TfrmPadrao;
begin
  // entrar no metodo que negativa e gravar auditoria de confirmacao de negativacao
  if not vDadosIni.PesqPros('CAR015', 'CONSULTA', 'TIPO ' + FDocs +
    ' CLIENTE CODIGO ' + dataSet.FieldByName('cod_cliente').AsString,
    FTable, '', buscas, True) then
    Exit;

  buscas.Close;
  buscas.SQL.Text := 'select cod_cliente, codigo_faturamento from clientes' +
    ' where cod_cliente = ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger), vDadosIni.codEmpresa);
  buscas.Open;

  if (dataSet.FieldByName('cod_cliente').AsInteger = 0) or (dataSet.IsEmpty) then
  begin
    Application.MessageBox('Cliente não encontrado para o contas a receber selecionado',
      'Atenção', 0 + 64);
    Exit;
  end;

  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Faturamento';

    frmCadContasAReceber.pnNegativar.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    if buscas.FieldByName('codigo_faturamento').AsInteger = vDadosIni.vEmp.vCodigoBarrado then
      frmCadContasAReceber.RadioGroup1.ItemIndex := 1
    else
      frmCadContasAReceber.RadioGroup1.ItemIndex := 0;

    result := (formulario.ShowModal = IDOK);

    if Result then
      _negativaDesnegativaCliente;

  finally
    frmCadContasAReceber.pnNegativar.Parent := frmCadContasAReceber.tsAvancado;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormObservacoes: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Observações';

    frmCadContasAReceber.pnObs.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnObs.Parent := frmCadContasAReceber.tsObs;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormReceber: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Recebimento de Contas';
    if vDadosIni.vContrapartida then
	    formulario.Caption := formulario.Caption + ' (Lançar contrapartida)'; 

    frmCadContasAReceber.pnReceber.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    frmCadContasAReceber.DBGrid6.DataSource := fDsRecebimento;
    frmCadContasAReceber.SpeedButton10.Visible := not vDadosIni.vContrapartida;

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnReceber.Parent := frmCadContasAReceber.tsReceberIni;
    if (not Result) and (vDadosIni.vContrapartida) then
   	Application.MessageBox('Operação cancelada pelo usuário', 'Atenção', 0 + 64);
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormReceberCheque: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 800;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Recebendo em Cheque';

    frmCadContasAReceber.pnRecCheque.Parent := formulario;
    frmCadContasAReceber.grupoCheque.Parent := frmCadContasAReceber.pnRecCheque;
    frmCadContasAReceber.grupoCheque.TabOrder := 0;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    frmCadContasAReceber.Label129.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    frmCadContasAReceber.DBEdit66.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    frmCadContasAReceber.DBLookupComboBox14.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    formulario.BorderIcons := [];

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnRecCheque.Parent := frmCadContasAReceber.tsRecCheque;
    frmCadContasAReceber.grupoCheque.Parent := frmCadContasAReceber.tsCadastroCheque;
    frmCadContasAReceber.grupoCheque.TabOrder := 0;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormReceberCredito(pEditar: boolean): Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 800;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Recebendo em Créditos';

    frmCadContasAReceber.pnRecCredito.Parent := formulario;
    frmCadContasAReceber.grupoCredito.Parent := frmCadContasAReceber.pnRecCredito;
    frmCadContasAReceber.grupoCredito.TabOrder := 0;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    frmCadContasAReceber.Label128.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    frmCadContasAReceber.DBEdit65.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    frmCadContasAReceber.DBLookupComboBox13.Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    frmCadContasAReceber.GroupBox5.Enabled := not vDadosIni.vContrapartida;
    frmCadContasAReceber.GroupBox17.Visible := true;
    frmCadContasAReceber.GroupBox17.Enabled := not pEditar;
  	 frmCadContasAReceber.GroupBox17.Height := vDadosIni.IfThen(frmCadContasAReceber.GroupBox17.Enabled, 59, 0);
    formulario.BorderIcons := [];

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnRecCredito.Parent := frmCadContasAReceber.tsRecCredito;
    frmCadContasAReceber.grupoCredito.Parent := frmCadContasAReceber.tsCadastroCredito;
    frmCadContasAReceber.grupoCredito.TabOrder := 0;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormReceberDinheiro: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Lançamentos';

    frmCadContasAReceber.pnRecLanc.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    formulario.BorderIcons := [];

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnRecLanc.Parent := frmCadContasAReceber.tsRecLanc;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormRecibos: Boolean;
var
  formulario: TfrmPadrao;
  I: Integer;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Utilizando recibos';

    frmCadContasAReceber.pnRecibos.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    formulario.BorderIcons := [];

    for I := 0 to frmCadContasAReceber.DBGrid7.FieldCount - 1 do
    begin
      if not vDadosIni.vRecibo.HabRecPorDepart then
      begin
        if (frmCadContasAReceber.DBGrid7.Columns[I].FieldName = 'NUM_REC_DEP') then
	        frmCadContasAReceber.DBGrid7.Columns[I].Visible := false;
      end
      else
      begin
        if (frmCadContasAReceber.DBGrid7.Columns[I].FieldName = 'NRECIBO') then
	        frmCadContasAReceber.DBGrid7.Columns[I].Visible := false;
      end;
      if (frmCadContasAReceber.DBGrid7.Columns[I].FieldName = 'COD_EMP_MULT') then
      	frmCadContasAReceber.DBGrid7.Columns[I].Visible := vDadosIni.vEmp.vFinanceiroUnificado;
    end;

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnRecibos.Parent := frmCadContasAReceber.tsRecRecibo;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._abreFormReplicacaoContas: Boolean;
var
  formulario: TfrmPadrao;
  vDataVencimento: TDateTime;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Replicação de Contas';

    frmCadContasAReceber.pnReplicar.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    frmCadContasAReceber.MemoReplicar.Clear;
    frmCadContasAReceber.MemoReplicar.Lines.Add('Replicar alterando o número e quantidade da parcela do documento atual informado (Exemplo 2 parcelas):');
    frmCadContasAReceber.MemoReplicar.Lines.Add('Documento atual:');
    frmCadContasAReceber.MemoReplicar.Lines.Add('   ' +
    																						' Num Doc: ' + trim(dataSet.FieldByName('N_DOC_C').AsString) + '-1' +
    																						' Data Venc: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_VENC_C').AsDateTime) +
                                                ' Valor: ' + formatfloat('0.00', dataSet.FieldByName('VALOR_C').AsFloat) +
                                                ' Num Parc: ' + IntToStr(1) +
                                                ' Qtde Parc: ' + IntToStr(3));

    vDataVencimento := dataSet.FieldByName('DATA_VENC_C').AsDateTime;

  	frmCadContasAReceber.MemoReplicar.Lines.Add('Demais documentos:');
    
    vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
    if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), FDiaReplicacao) then
      vDataVencimento := StartOfTheMonth(vDataVencimento) + FDiaReplicacao - 1
    else
      vDataVencimento := EndOfTheMonth(vDataVencimento);

    frmCadContasAReceber.MemoReplicar.Lines.Add('   ' +
    																						' Num Doc: ' + trim(dataSet.FieldByName('N_DOC_C').AsString) + '-2' +
    																						' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDataVencimento) +
                                                ' Valor: ' + formatfloat('0.00', dataSet.FieldByName('VALOR_C').AsFloat) +
                                                ' Num Parc: ' + IntToStr(2) +
                                                ' Qtde Parc: ' + IntToStr(3));

    vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
    if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), FDiaReplicacao) then
      vDataVencimento := StartOfTheMonth(vDataVencimento) + FDiaReplicacao - 1
    else
      vDataVencimento := EndOfTheMonth(vDataVencimento);

    frmCadContasAReceber.MemoReplicar.Lines.Add('   ' +
    																						' Num Doc: ' + trim(dataSet.FieldByName('N_DOC_C').AsString) + '-3' +
    																						' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDataVencimento) +
                                                ' Valor: ' + formatfloat('0.00', dataSet.FieldByName('VALOR_C').AsFloat) +
                                                ' Num Parc: ' + IntToStr(3) +
                                                ' Qtde Parc: ' + IntToStr(3));
    frmCadContasAReceber.MemoReplicar.Lines.Add('');
    frmCadContasAReceber.MemoReplicar.Lines.Add('Replicar sem alterar o número e quantidade da parcela do documento atual informado (Exemplo 2 parcelas):');
    frmCadContasAReceber.MemoReplicar.Lines.Add('Documento atual:');
    frmCadContasAReceber.MemoReplicar.Lines.Add('   ' +
    																						' Num Doc: ' + trim(dataSet.FieldByName('N_DOC_C').AsString) + '-' + IntToStr(dataSet.FieldByName('NPARCELA').AsInteger) +
    																						' Data Venc: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_VENC_C').AsDateTime) +
                                                ' Valor: ' + formatfloat('0.00', dataSet.FieldByName('VALOR_C').AsFloat) +
                                                ' Num Parc: ' + IntToStr(dataSet.FieldByName('NPARCELA').AsInteger) +
                                                ' Qtde Parc: ' + IntToStr(dataSet.FieldByName('QTDE_PARC').AsInteger));

    vDataVencimento := dataSet.FieldByName('DATA_VENC_C').AsDateTime;

    frmCadContasAReceber.MemoReplicar.Lines.Add('Demais documentos:');
    
    vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
    if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), FDiaReplicacao) then
      vDataVencimento := StartOfTheMonth(vDataVencimento) + FDiaReplicacao - 1
    else
      vDataVencimento := EndOfTheMonth(vDataVencimento);

    frmCadContasAReceber.MemoReplicar.Lines.Add('   ' +
    																						' Num Doc: ' + trim(dataSet.FieldByName('N_DOC_C').AsString) + '-1' +
    																						' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDataVencimento) +
                                                ' Valor: ' + formatfloat('0.00', dataSet.FieldByName('VALOR_C').AsFloat) +
                                                ' Num Parc: ' + IntToStr(1) +
                                                ' Qtde Parc: ' + IntToStr(2));

    vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
    if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), FDiaReplicacao) then
      vDataVencimento := StartOfTheMonth(vDataVencimento) + FDiaReplicacao - 1
    else
      vDataVencimento := EndOfTheMonth(vDataVencimento);
      
    frmCadContasAReceber.MemoReplicar.Lines.Add('   ' +
    																						' Num Doc: ' + trim(dataSet.FieldByName('N_DOC_C').AsString) + '-2' +
    																						' Data Venc: ' + FormatDateTime('dd/mm/yyyy', vDataVencimento) +
                                                ' Valor: ' + formatfloat('0.00', dataSet.FieldByName('VALOR_C').AsFloat) +
                                                ' Num Parc: ' + IntToStr(2) +
                                                ' Qtde Parc: ' + IntToStr(2));


    vDadosIni.definirDiaFinanceiroFechado(buscas);
    frmCadContasAReceber.edQtdeRepl.AsValue := 1;
    frmCadContasAReceber.edDiaVencReplicar.AsValue := FDiaReplicacao;
    frmCadContasAReceber.ckbReplVlContabil.Enabled := dataSet.FieldByName('vl_contabil').AsFloat > 0;
    frmCadContasAReceber.ckbReplVlContabil.Checked := dataSet.FieldByName('vl_contabil').AsFloat > 0;

    frmCadContasAReceber.ckbReplAlterarNumQdeParcela.Checked :=
    	_LerConfiguracoesRegistroBoolean(frmCadContasAReceber.ckbReplAlterarNumQdeParcela.Name, False);

    result := (formulario.ShowModal = IDOK);

  finally
  	if Result then
    begin
      _GravaConfiguracoesBoolean(frmCadContasAReceber.ckbReplAlterarNumQdeParcela.Name,    frmCadContasAReceber.ckbReplAlterarNumQdeParcela.Checked);
      _GravaConfiguracoesBoolean(frmCadContasAReceber.ckbReplNaoAlterarNumQdeParcela.Name, frmCadContasAReceber.ckbReplNaoAlterarNumQdeParcela.Checked);
    end;
    frmCadContasAReceber.pnReplicar.Parent := frmCadContasAReceber.tsReplicacao;
    formulario.Free;
    formulario := nil;
  end;
end;

function TContasAReceber._alterarLancamentoRecebimento: Boolean;
var
  vValorRecibos: Currency;
begin
  Result := False;
  try
    if Trim(dataSet.FieldByName('tipo').AsString) = 'RA' then
      result := _receberComControleSelecionado(True)
    else if Trim(dataSet.FieldByName('tipo').AsString) = 'N' then
    begin

      if inherited edit then
      begin
        vDadosIni.definirDiaFinanceiroFechado(buscas);
        vPCont._abrePContasLanc('E');
        vCtrl._abreTodosControlesCAR('N', vDadosIni.vContrapartida);
        dadosReceber.numContaTemp := dataSet.FieldByName('n_conta_plc').AsFloat;
        Result := _abreFormReceberDinheiro;
      end;

      {if not Result then
      begin
        Cancel;
        Exit;
      end;
      dataSet.FieldByName('TIP_CNT').AsString := 'N';
      dataSet.FieldByName('VALOR_L').AsFloat := dataSet.FieldByName('valor_l').AsFloat;
      dataSet.Post;  }

    end
    else if Trim(vCtrl.dataSet.FieldByName('DOCS').AsString) = 'S1' then
    begin

      if vReceb.vCh.Edit then
      begin
        vPCont._abrePContasLanc('E');
        Result := _abreFormReceberCheque;
      end;

      {if not Result then
      begin
        Cancel;
        Exit;
      end;
      dataSet.Edit;
      dataSet.FieldByName('VALOR_L').AsFloat := dataSet.FieldByName('valor_ch').AsFloat;
      dataSet.FieldByName('HIST').AsString := dataSet.FieldByName('historico_ch').AsString;
      dataSet.FieldByName('NDOC_L').AsString := dataSet.FieldByName('n_ch').AsString;
      dataSet.FieldByName('VENCIMENTO').AsDateTime := dataSet.FieldByName('data_venc').AsDateTime;
      dataSet.FieldByName('HISTORICO_L').AsString := dadosReceber.historicoSaida;
      dataSet.FieldByName('NUMCONTASAIDA').AsFloat := dadosReceber.numContaSCh;
      dataSet.Post;    }

    end
    else if Trim(conta.vCtrl.dataSet.FieldByName('DOCS').AsString) = 'S2' then
    begin
      if vReceb.vCr.Edit then
      begin
        vPCont._abrePContasLanc('E');
        Result := _abreFormReceberCredito(true);
      end;

      {if not Result then
      begin
        Cancel;
        Exit;
      end;
      dataSet.Edit;
      dataSet.FieldByName('VALOR_L').AsFloat := dataSet.FieldByName('valor_c').AsFloat;
      dataSet.FieldByName('HIST').AsString := dataSet.FieldByName('historico_c').AsString;
      dataSet.FieldByName('NDOC_L').AsString := dataSet.FieldByName('n_doc_c').AsString;
      dataSet.FieldByName('VENCIMENTO').AsDateTime := dataSet.FieldByName('data_venc_c').AsDateTime;
      dataSet.FieldByName('HISTORICO_L').AsString := dadosReceber.historicoSaida;
      dataSet.FieldByName('NUMCONTASAIDA').AsFloat := dadosReceber.numContaSCr;
      dataSet.Post;      }
    end;

    if not Result then
      dataSet.Cancel;

    _somarLancamentoRecebimento;

  finally
    vCtrl._abreTodosControlesCAR(vDadosIni.vContrapartida);
  end;
end;

procedure TContasAReceber._beforePostRecebimento(pDataSet: TDataSet);
begin
  if Trim(pDataSet.FieldByName('tipo').AsString) = 'N' then
  begin

    pDataSet.FieldByName('TIP_CNT').AsString := 'N';
    pDataSet.FieldByName('VALOR_L').AsFloat := pDataSet.FieldByName('valor_l').AsFloat;
    pDataSet.FieldByName('NOMECTRL').AsString := vCtrl.DataSet.FieldByName('nome_ctrl').AsString;

  end
  else if Trim(pDataSet.FieldByName('tipo').AsString) = 'S1' then
  begin

    pDataSet.FieldByName('VALOR_L').AsFloat := pDataSet.FieldByName('valor_ch').AsFloat;
    pDataSet.FieldByName('NOMECTRL').AsString := vCtrl.DataSet.FieldByName('nome_ctrl').AsString;
    pDataSet.FieldByName('HIST').AsString := pDataSet.FieldByName('historico_ch').AsString;
    pDataSet.FieldByName('NDOC_L').AsString := Trim(pDataSet.FieldByName('n_ch').AsString);
    pDataSet.FieldByName('VENCIMENTO').AsDateTime := pDataSet.FieldByName('data_venc').AsDateTime;
    pDataSet.FieldByName('HISTORICO_L').AsString := dadosReceber.historicoSaida;
    pDataSet.FieldByName('NUMCONTASAIDA').AsFloat := dadosReceber.numContaSCh;

  end
  else if Trim(pDataSet.FieldByName('tipo').AsString) = 'S2' then
  begin

    pDataSet.FieldByName('VALOR_L').AsFloat := pDataSet.FieldByName('valor_c').AsFloat;
    pDataSet.FieldByName('NOMECTRL').AsString := vCtrl.DataSet.FieldByName('nome_ctrl').AsString;
    pDataSet.FieldByName('HIST').AsString := pDataSet.FieldByName('historico_c').AsString;
    pDataSet.FieldByName('NDOC_L').AsString := Trim(pDataSet.FieldByName('n_doc_c').AsString);
    pDataSet.FieldByName('VENCIMENTO').AsDateTime := pDataSet.FieldByName('data_venc_c').AsDateTime;
    pDataSet.FieldByName('HISTORICO_L').AsString := dadosReceber.historicoSaida;
    pDataSet.FieldByName('NUMCONTASAIDA').AsFloat := dadosReceber.numContaSCr;

  end;

end;

function TContasAReceber._clienteTerceiroValido: boolean;
begin
  Result := False;
  try
    if dataSet.State in [dsinsert, dsEdit] then
    begin
      if dataSet.FieldByName('COD_CLI_TERC').AsInteger = 0 then
        Result := true
      else
      begin

        vCl._selecionaCliente(dataSet.FieldByName('COD_CLI_TERC').AsInteger, dataSet.FieldByName('COD_EMP_MULT').AsInteger);

        if vCl.dataSet.IsEmpty then
        begin
          Application.MessageBox('Cliente Terceiro não encontrado', 'Atenção', 0 + 64);
          exit;
        end;

        dataSet.FieldByName('NOME_TERC').AsString :=
          vCl.dataSet.FieldByName('nome_cliente').AsString;

        Result := True;

      end;
    end
    else
      Result := true;
  finally
    if not Result then
    begin
      if FDocs = 'S1' then
        vNomeCampoErro := 'DBEdit16'
      else
        vNomeCampoErro := 'DBEdit41';
    end;
  end;
end;

function TContasAReceber._clienteValido: boolean;
begin
  Result := False;
  try
    if dataSet.State in [dsinsert, dsEdit] then
    begin
      if dataSet.FieldByName('cod_cliente').AsString = '' then
      begin
        Result := true;
        dataSet.FieldByName('razao').AsString := '';
      end
      else
      begin

        vCl._selecionaCliente(dataSet.FieldByName('cod_cliente').AsInteger, dataSet.FieldByName('COD_EMP_MULT').AsInteger);

        if vCl.dataSet.IsEmpty then
        begin
          Application.MessageBox('Cliente não encontrado', 'Atenção', 0 + 64);
          exit;
        end;

        if (FDocs = 'S1') or (FRecebendo) then
          dataSet.FieldByName('nome_ch').AsString :=
            vCl.dataSet.FieldByName('nome_cliente').AsString;
        if (FDocs = 'S2') or (FRecebendo) then
          dataSet.FieldByName('nome_c').AsString :=
            vCl.dataSet.FieldByName('nome_cliente').AsString;
        dataSet.FieldByName('razao').AsString :=
          vCl.dataSet.FieldByName('razao').AsString;
        dataSet.FieldByName('cpfcgc').AsString :=
          vCl.dataSet.FieldByName('cpfcgc').AsString;

        Result := True;

      end;
    end
    else
      Result := true;
  finally
    if not Result then
    begin
      if FDocs = 'S1' then
        vNomeCampoErro := 'DBEdit13'
      else
        vNomeCampoErro := 'DBEdit38';
    end;
  end;
end;

function TContasAReceber._confereLancamentoRecebimento: Boolean;
var
  vOK: Boolean;
begin
  Result := True;
  if fRecebimento.IsEmpty then
  begin
    Application.MessageBox(pchar('Nenhum registro efetuado. Operação não pode ser concluída!'), 'Atenção', 0 + 64);
    Result := False;
    Exit;
  end;
  if vDadosIni.StrToFloatFormat(dadosReceber.valorAtingido, 2) <
    vDadosIni.StrToFloatFormat(dadosReceber.valorOperacao,2) then
  begin
    Application.MessageBox(pchar('Valor informado ' + Format('%0.2n', [dadosReceber.valorAtingido]) +
      ' menor que o valor esperado ' + Format('%0.2n', [dadosReceber.valorOperacao])), 'Atenção', 0 + 64);
    if not vDadosIni.PesqPros('CAR078', 'ALTERAR', 'TIPO ' + FDocs, FTable,
      '', buscas, True) then
    begin
      Result := False;
      Exit;
    end
    else if Application.MessageBox('Deseja continuar mesmo assim?', 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) <> IDYES then
    begin
      Result := False;
      Exit;
    end;
  end;

  if dadosReceber.valorAtingido > dadosReceber.valorOperacao then
  begin
    vPCont._abrePContasLanc('E');
    vCtrl._selecionaControle(0);
    dadosReceber.historicoSaida := 'JUROS COBRADO NO RECEBIMENTO';
    if vDadosIni.vEmp.vFinanceiroUnificado then
      dadosReceber.historicoSaida := dadosReceber.historicoSaida + ' EMP: ' + vDadosIni.StrZero(dadosReceber.codigoUnificada, 3);
    vOK := _abreFormDiferenciaDoRecebimento;
  end
  else if dadosReceber.valorOperacao > dadosReceber.valorAtingido then
  begin
    vPCont._abrePContasLanc('S');
    vCtrl._selecionaControle(0);
    dadosReceber.historicoSaida := 'DESCONTO CONCEDIDO NO RECEBIMENTO';
    if vDadosIni.vEmp.vFinanceiroUnificado then
      dadosReceber.historicoSaida := dadosReceber.historicoSaida + ' EMP: ' + vDadosIni.StrZero(dadosReceber.codigoUnificada, 3);
    vOK := _abreFormDiferenciaDoRecebimento;
  end
  else
  begin
    Result := True;
    Exit;
  end;
  if vOK then
  begin
    vDadosIni.definirDiaFinanceiroFechado(buscas);
    if (inherited Insert) then
    begin
      dataSet.FieldByName('codigo_ctrl').AsInteger :=
        vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger;
      dataSet.FieldByName('HISTORICO_L').AsString := Fhistdigdif;
      //dadosReceber.historicoSaida;
      dataSet.FieldByName('HIST').AsString := dataSet.FieldByName('HISTORICO_L').AsString;
      dataSet.FieldByName('TIPO_L').AsString := vPCont.dataSet.FieldByName('tipo_plc').AsString;
      dataSet.FieldByName('TIP_CNT').AsString := 'N';
      dataSet.FieldByName('data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
      dataSet.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
      dataSet.FieldByName('valor_l').AsFloat := Abs(dadosReceber.valorOperacao -
        dadosReceber.valorAtingido);
      dataSet.FieldByName('vl_contabil').AsFloat := FvalorContabildigdif;
      if dadosReceber.valorAtingido > dadosReceber.valorOperacao then
      begin
        dataSet.FieldByName('TIPO').AsString := 'JU';
        dataSet.FieldByName('NOMECTRL').AsString := 'Juros Cobrados';
        dataSet.FieldByName('n_conta_plc').AsFloat :=
          vPCont.dataSet.FieldByName('N_CONTA_PLC').AsFloat;
        //dadosReceber.numContaJuros
      end
      else
      begin
        dataSet.FieldByName('TIPO').AsString := 'DE';
        dataSet.FieldByName('NOMECTRL').AsString := 'Desconto Concedido';
        dataSet.FieldByName('n_conta_plc').AsFloat :=
          vPCont.dataSet.FieldByName('N_CONTA_PLC').AsFloat;
        //        dadosReceber.numContaDesconto;
      end;
      dataSet.Post;

    end;

    if (inherited Insert) then
    begin
      dataSet.FieldByName('codigo_ctrl').AsInteger :=
        vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger;
      dataSet.FieldByName('HISTORICO_L').AsString := Fhistdigdif;
      //dadosReceber.historicoSaida;
      dataSet.FieldByName('HIST').AsString := dataSet.FieldByName('HISTORICO_L').AsString;
      dataSet.FieldByName('TIP_CNT').AsString := 'N';
      dataSet.FieldByName('data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
      dataSet.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
      dataSet.FieldByName('n_conta_plc').AsFloat := dadosReceber.numContaVendaProd;
      dataSet.FieldByName('valor_l').AsFloat := Abs(dadosReceber.valorOperacao -
        dadosReceber.valorAtingido);
      dataSet.FieldByName('vl_contabil').AsFloat := 0;
      if dadosReceber.valorAtingido > dadosReceber.valorOperacao then
      begin
        dataSet.FieldByName('TIPO').AsString := 'JU';
        dataSet.FieldByName('NOMECTRL').AsString := 'Juros Cobrados';
        dataSet.FieldByName('n_conta_plc').AsFloat := vDadosIni.IfThen(dadosReceber.numContaSaidaJuros > 0,
        	dadosReceber.numContaSaidaJuros, dadosReceber.numContaSCr);
        //dadosReceber.numContaCompraProd;
        dataSet.FieldByName('TIPO_L').AsString := 'S';
      end
      else
      begin
        dataSet.FieldByName('TIPO').AsString := 'DE';
        dataSet.FieldByName('NOMECTRL').AsString := 'Desconto Concedido';
        dataSet.FieldByName('TIPO_L').AsString := 'E';
        
        buscas.Close;
        buscas.SQL.Text := ' select count(*) from p_contas ' +
        	' inner join grupos_ct on grupos_ct.grup_ct = p_contas.grup_ct ' +
          ' where p_contas.n_conta_plc = :n_conta_plc ' +
          ' and grupos_ct.tipo_gr = ''S'' ';
        buscas.ParamByName('n_conta_plc').AsFloat := vPCont.dataSet.FieldByName('N_CONTA_PLC').AsFloat;
        buscas.Open;

        if buscas.FieldByName('count').AsInteger > 0 then
        begin
          SqlOpen(' select cont_lig.ncon_ent_descdesp from cont_lig ' +
          	' where cont_lig.cod_emp = ' + vDadosIni.codEmpresa);
            
          dataSet.FieldByName('n_conta_plc').AsFloat := vDadosIni.IfThen(
          	buscas.FieldByName('ncon_ent_descdesp').AsFloat > 0,
            	buscas.FieldByName('ncon_ent_descdesp').AsFloat,
              	vDadosIni.IfThen(dadosReceber.numContaEntDesconto > 0,
			            dadosReceber.numContaEntDesconto, dadosReceber.numContaVendaProd));
        end
        else
          dataSet.FieldByName('n_conta_plc').AsFloat := vDadosIni.IfThen(dadosReceber.numContaEntDesconto > 0,
            dadosReceber.numContaEntDesconto, dadosReceber.numContaVendaProd);
      end;
      dataSet.Post;

    end;

    Result := True;
  end;

end;

function TContasAReceber._confirmarLancamentosRecebimento: Boolean;
var
  I: Integer;
  vValorTemp: Currency;
  vRecAnt, vTpBaixa: string;
  vHistPadraoUnificadas: string;
  vSeqIDTransacao: Integer;
  buscas2: TIBQuery;
  vCodCreditosBol: string;
  vLoteBaixaCreditos: Integer;
begin
  Result := True;
  vCodCreditosBol := '';
  vLoteBaixaCreditos := 0;

  buscas2 												:= TIBQuery.Create(Application);
  buscas2.Database 									:= buscas.Database;
  buscas2.Transaction 								:= buscas.Transaction;
  try
    vHistPadraoUnificadas := '';
    if vDadosIni.vEmp.vFinanceiroUnificado then
      vHistPadraoUnificadas := ' EMP: ' + vDadosIni.StrZero(dadosReceber.codigoUnificada, 3);

    fRecebimento.First;
    while not fRecebimento.Eof do
    begin

      if fRecebimento.FieldByName('tipo').AsString = 'S1' then
      begin

{$REGION 'cadastro dos cheques'}

        vReceb.vCh.dataSet.Insert;
        for I := 0 to vReceb.vCh.dataSet.FieldCount - 1 do
          if vReceb.vCh.dataSet.Fields[I].FieldKind = fkData then
            if(vReceb.vCh.dataSet.Fields[I].FieldName <> 'FORM_PAG') and
            	(vReceb.vCh.dataSet.Fields[I].FieldName <> 'NOME_CTRL') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'IDENTIFICACAO_EMP') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'DESC_PLC') and
            	(vReceb.vCh.dataSet.Fields[I].FieldName <> 'DESC_GR') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'DESC_DEP') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'COD_CTA_CONTABIL') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'NOME_CTA') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'NOME_CLIENTE') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'RAZAO_CLIENTE') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'CPFCGC_CLIENTE') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'STATUS_F') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'CEP') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'ENDERECO') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'NUM_END_CLIENTE') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'COMPLEMENTO') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'FONE_CLIENTE') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'FONE_CELULAR') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'EMAIL') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'COD_LOCALIDADE') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'LOCALIDADE') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'COD_SETOR') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'SETOR') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'SIGLA_UF') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'NOME_CIDADE') and
              (vReceb.vCh.dataSet.Fields[I].FieldName <> 'NOME_BAIRRO') then
              	vReceb.vCh.dataSet.FieldByName(vReceb.vCh.dataSet.Fields[I].FieldName).Value :=
                	fRecebimento.FieldByName(vReceb.vCh.dataSet.Fields[I].FieldName).Value;

        vReceb.vCh.dataSet.FieldByName('DATA_REC').AsDateTime := vDadosIni.diaFFinanceiro + 1;
        vReceb.vCh.dataSet.FieldByName('LOTE_ENT').AsInteger := dadosReceber.loteQuitacao;
        vReceb.vCh.dataSet.FieldByName('TIP_CNT').AsString := 'N';
        
        FCodigo := Gencodigo('CONTROLE_CHEQUE', buscas2, vDadosIni.codEmpresa);
//        FCodigo := Gencodigo('CONTROLE_CHEQUE', dtmContasAReceber.SpIncCodigo, vDadosIni.codEmpresa);
        vDadosIni.hw_registra_estatistica('CONTROLE_CHEQUE');
        vReceb.vCh.dataSet.FieldByName('CODIGO_CH').AsInteger := FCodigo;
        vReceb.vCh.dataSet.FieldByName('vl_contabil').AsFloat := vDadosIni.StrToFloatFormat(
          dadosReceber.somaValorContabil / dadosReceber.valorAtingido *
            vReceb.vCh.dataSet.FieldByName('valor_ch').AsFloat, 2);
        if vDadosIni.vContrapartidaCTP then
        	vReceb.vCh.dataSet.FieldByName('COD_CONTRAPARTIDA_CTP').AsInteger := vDadosIni.vCodContrapartidaCTP
        else if vDadosIni.vContrapartida then
          vReceb.vCh.dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger := vDadosIni.vCodContrapartida;
        vReceb.vCh.dataSet.Post;
        if not vReceb.vCh.Apply then
          raiseExceptionCreate('Erro ao salvar novo cheque','');

        vLancL.N_CONTA_PLC := vReceb.vCh.dataSet.FieldByName('N_CONTA_PLC').AsFloat;
        vLancL.TIPO_L := 'E';
        vLancL.CODIGO_CTRL := vReceb.vCh.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
        vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
        vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
        vLancL.HISTORICO_L := fRecebimento.FieldByName('HISTORICO_L').AsString;
        vLancL.ID_FINANC_CONFERE := fRecebimento.FieldByName('ID_FINANC_CONFERE').AsInteger;
        vLancL.VALOR_L := fRecebimento.FieldByName('VALOR_CH').AsCurrency;
        vLancL.NDOC_L := 'CHQS';
        vLancL.LOTE_ENT := dadosReceber.loteQuitacao;

        if dadosReceber.referenteDevolucao then
          vLancL.TP_MOD := ''
        else
          vLancL.TP_MOD := 'S';
        vLancL.COD_EMP_MULT := dadosReceber.codigoUnificada;
        vLancL.VL_CONTABIL := vReceb.vCh.dataSet.FieldByName('vl_contabil').AsFloat;
        vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
        vLancL._efetuarLancamento(vDadosIni.vContrapartida);
        FCodigoLancamento := vLancL.COD_LANC;

        buscas.Close;
        buscas.SQL.Text := 'INSERT INTO LANCCHEQUE (COD_LANC, CODIGO_CH, CODIGO_EMP)' +
          ' VALUES (:COD_LANC, :CODIGO_CH, :CODIGO_EMP)';
        buscas.ParamByName('COD_LANC').AsInteger := FCodigoLancamento;
        buscas.ParamByName('CODIGO_CH').AsInteger := FCodigo;
        buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.ExecSQL;

{$ENDREGION}

      end
      else if fRecebimento.FieldByName('tipo').AsString = 'S2' then
      begin

{$REGION 'cadastro dos creditos'}

        vReceb.vCr.dataSet.Insert;
        for I := 0 to vReceb.vCr.dataSet.FieldCount - 1 do
          if vReceb.vCr.dataSet.Fields[I].FieldKind = fkData then
            if(vReceb.vCr.dataSet.Fields[I].FieldName <> 'FORM_PAG') and 
            	(vReceb.vCr.dataSet.Fields[I].FieldName <> 'NOME_CTRL') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'IDENTIFICACAO_EMP') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'DESC_PLC') and
            	(vReceb.vCr.dataSet.Fields[I].FieldName <> 'DESC_GR') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'DESC_DEP') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'COD_CTA_CONTABIL') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'NOME_CTA') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'NOME_CLIENTE') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'RAZAO_CLIENTE') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'CPFCGC_CLIENTE') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'STATUS_F') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'CEP') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'ENDERECO') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'NUM_END_CLIENTE') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'COMPLEMENTO') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'FONE_CLIENTE') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'FONE_CELULAR') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'EMAIL') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'COD_LOCALIDADE') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'LOCALIDADE') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'COD_SETOR') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'SETOR') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'SIGLA_UF') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'NOME_CIDADE') and
              (vReceb.vCr.dataSet.Fields[I].FieldName <> 'NOME_BAIRRO') then
              	vReceb.vCr.dataSet.FieldByName(vReceb.vCr.dataSet.Fields[I].FieldName).Value :=
                	fRecebimento.FieldByName(vReceb.vCr.dataSet.Fields[I].FieldName).Value;

        vReceb.vCr.dataSet.FieldByName('DATA_REC_C').AsDateTime := vDadosIni.diaFFinanceiro + 1;
        vReceb.vCr.dataSet.FieldByName('LOTE_ENT').AsInteger := dadosReceber.loteQuitacao;
        vReceb.vCr.dataSet.FieldByName('TIP_CNT').AsString := 'N';
        
        FCodigo := Gencodigo('CONTROLE_CREDITOS', buscas2, vDadosIni.codEmpresa);

        buscas2.Close;
        buscas2.SQL.Text := ' SELECT * FROM CONTROLES WHERE CXENT = ''S''' +
          ' AND USAR_BOLETO = ''S'' ' +
          ' AND CODIGO_CTRL = ' + IntToStr(vReceb.vCr.dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
          ' AND ATIVO = 1 AND CODIGO_EMP = ' + vDadosIni.codEmpresa +
          ' AND COALESCE(NAO_GERA_FINAN, '''') <> ''S''' +
          ' AND COALESCE(BAIXA_AUTOMATICA, '''') <> ''S''' +
          ' ORDER BY QSEQPERF ';
        buscas2.Open;
        if not buscas2.IsEmpty then
        begin
          if trim(vCodCreditosBol) = '' then
            vCodCreditosBol := IntToStr(FCodigo)
          else
            vCodCreditosBol := vCodCreditosBol + ', ' + IntToStr(FCodigo);
          vLoteBaixaCreditos := dadosReceber.loteQuitacao;
        end;

//        FCodigo := Gencodigo('CONTROLE_CREDITOS', dtmContasAReceber.SpIncCodigo, vDadosIni.codEmpresa);
        vDadosIni.hw_registra_estatistica('CONTROLE_CREDITOS');
        vReceb.vCr.dataSet.FieldByName('COD_CRED').AsInteger := FCodigo;
        vReceb.vCr.dataSet.FieldByName('vl_contabil').AsFloat := vDadosIni.StrToFloatFormat(
          dadosReceber.somaValorContabil / dadosReceber.valorAtingido *
            vReceb.vCr.dataSet.FieldByName('valor_c').AsFloat, 2);
        if vDadosIni.vContrapartidaCTP then
        	vReceb.vCr.dataSet.FieldByName('COD_CONTRAPARTIDA_CTP').AsInteger := vDadosIni.vCodContrapartidaCTP
        else if vDadosIni.vContrapartida then
          vReceb.vCr.dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger := vDadosIni.vCodContrapartida;
        vReceb.vCr.dataSet.Post;
        if not vReceb.vCr.Apply then
          raiseExceptionCreate('Erro ao salvar novo crédito','');

        vLancL.N_CONTA_PLC := vReceb.vCr.dataSet.FieldByName('N_CONTA_PLC').AsFloat;
        vLancL.TIPO_L := 'E';
        vLancL.CODIGO_CTRL := vReceb.vCr.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
        vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
        vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
        vLancL.HISTORICO_L := Trim(fRecebimento.FieldByName('HISTORICO_C').AsString) + vHistPadraoUnificadas + ' ' +
          Trim(fRecebimento.FieldByName('TIPO_DOC_C').AsString);
        vLancL.ID_FINANC_CONFERE := fRecebimento.FieldByName('ID_FINANC_CONFERE').AsInteger;
        vLancL.VALOR_L := fRecebimento.FieldByName('VALOR_C').AsCurrency;
        vLancL.NDOC_L := 'CREDITOS';
        vLancL.LOTE_ENT := dadosReceber.loteQuitacao;
        if dadosReceber.referenteDevolucao then
          vLancL.TP_MOD := ''
        else
          vLancL.TP_MOD := 'S';
        //        vLancL.TP_MOD := 'S';
        vLancL.COD_EMP_MULT := dadosReceber.codigoUnificada;
        vLancL.VL_CONTABIL := vReceb.vCr.dataSet.FieldByName('vl_contabil').AsFloat;
        vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
        vLancL._efetuarLancamento(vDadosIni.vContrapartida);
        FCodigoLancamento := vLancL.COD_LANC;

        buscas.Close;
        buscas.SQL.Text := 'INSERT INTO CREDITOS_LANC ( COD_LANC, COD_CRED, CODIGO_EMP)' +
          ' VALUES ( :COD_LANC, :COD_CRED, :CODIGO_EMP)';
        buscas.ParamByName('COD_LANC').AsInteger := FCodigoLancamento;
        buscas.ParamByName('COD_CRED').AsInteger := FCodigo;
        buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.ExecSQL;
        
{$ENDREGION}

      end
      else
      begin

{$REGION 'demais lancamentos e recibos antecipados'}

        vLancL.N_CONTA_PLC := fRecebimento.FieldByName('n_conta_plc').AsFloat;
        vLancL.TIPO_L := fRecebimento.FieldByName('tipo_l').AsString;
        vLancL.CODIGO_CTRL := fRecebimento.FieldByName('CODIGO_CTRL').AsInteger;
        vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
        vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
        vLancL.HISTORICO_L := fRecebimento.FieldByName('HISTORICO_L').AsString;
        vLancL.ID_FINANC_CONFERE := fRecebimento.FieldByName('ID_FINANC_CONFERE').AsInteger;
        vLancL.VALOR_L := fRecebimento.FieldByName('VALOR_L').AsCurrency;
        vLancL.NDOC_L := fRecebimento.FieldByName('NDOC_L').AsString;
        vLancL.TIP_CNT := Trim(fRecebimento.FieldByName('TIP_CNT').AsString);
        if dadosReceber.processamentoAutomatico then
        begin
          if Trim(fRecebimento.FieldByName('ARQ_EXTRATO_ADM').AsString) <> '' then
            vLancL.ARQ_EXTRATO_ADM := Trim(fRecebimento.FieldByName('ARQ_EXTRATO_ADM').AsString);
          if fRecebimento.FieldByName('DATA_ARQUIVO').AsFloat > 0 then
            vLancL.DATA_ARQUIVO := fRecebimento.FieldByName('DATA_ARQUIVO').AsDateTime;
          if fRecebimento.FieldByName('COD_ADM').AsInteger > 0 then
            vLancL.COD_ADM := fRecebimento.FieldByName('COD_ADM').AsInteger;
          if fRecebimento.FieldByName('SAIDA_PROC_AUTO').AsString = 'S' then
            vLancL.LOTE_QUIT := dadosReceber.loteQuitacao
          else
            vLancL.LOTE_ENT := dadosReceber.loteQuitacao;
        end
        else if vDadosIni.strEstaContidoEm(fRecebimento.FieldByName('tipo').AsString, ['JU', 'DE']) then
          vLancL.LOTE_QUIT := dadosReceber.loteQuitacao
        else
          vLancL.LOTE_ENT := dadosReceber.loteQuitacao;
        vLancL.TP_MOD := 'S';
        vLancL.COD_EMP_MULT := dadosReceber.codigoUnificada;
        if dadosReceber.processamentoAutomatico then
          vLancL.VL_CONTABIL := vLancL.VALOR_L
        else
        vLancL.VL_CONTABIL := vDadosIni.StrToFloatFormat(
          dadosReceber.somaValorContabil / dadosReceber.valorAtingido *
            vLancL.VALOR_L, 2);
        if vDadosIni.strEstaContidoEm(fRecebimento.FieldByName('tipo').AsString, ['JU', 'DE']) then
          if fRecebimento.FieldByName('vl_contabil').AsFloat > 0 then
            vLancL.VL_CONTABIL := fRecebimento.FieldByName('vl_contabil').AsFloat
          else
            vLancL.VL_CONTABIL := 0;
        vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
        vLancL._efetuarLancamento(vDadosIni.vContrapartida);

        if fRecebimento.FieldByName('tipo').AsString = 'RA' then
        begin

          vLancL.N_CONTA_PLC := dadosReceber.numContaSCr;
          //dadosReceber.numContaCompraProd;
          vLancL.TIPO_L := 'S';
          vLancL.CODIGO_CTRL := fRecebimento.FieldByName('CODIGO_CTRL').AsInteger;
          vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
          vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
          vLancL.HISTORICO_L := fRecebimento.FieldByName('HISTORICO_L').AsString;
          vLancL.VALOR_L := fRecebimento.FieldByName('VALOR_L').AsCurrency;
          vLancL.NDOC_L := fRecebimento.FieldByName('NDOC_L').AsString;
          vLancL.TIP_CNT := Trim(fRecebimento.FieldByName('TIP_CNT').AsString);
          vLancL.LOTE_ENT := dadosReceber.loteQuitacao;
          vLancL.TP_MOD := 'S';
          vLancL.COD_EMP_MULT := dadosReceber.codigoUnificada;
          vLancL.VL_CONTABIL := vDadosIni.StrToFloatFormat(
            dadosReceber.somaValorContabil / dadosReceber.valorAtingido *
              vLancL.VALOR_L, 2);
          vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
          vLancL._efetuarLancamento;

{$REGION 'baixa de recibos'}

        	try
          	vReceb.vRecibo.dataSet.DisableControls;
            vReceb.vRecibo.dataSet.First;
            while not vReceb.vRecibo.dataSet.Eof do
            begin
              if (vReceb.vRecibo.dataSet.FieldByName('selec').AsString = 'S') and
                (vReceb.vRecibo.dataSet.FieldByName('valor_ut').AsFloat > 0) then
              begin
                buscas.Close;
                buscas.SQL.Text := ' select valor, status_rec from recibos' +
                  ' where nrecibo = ' + IntToStr(vReceb.vRecibo.dataSet.FieldByName('nrecibo').AsInteger) +
                  ' and cod_empresa = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
                    IntToStr(vReceb.vRecibo.dataSet.FieldByName('cod_empresa').AsInteger),
                  vDadosIni.codEmpresa);
  //                ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(dadosReceber.codigoUnificada), vDadosIni.codEmpresa);
                buscas.Open;

                if Trim(buscas.FieldByName('status_rec').AsString) = 'RECEBIDO' then
                  raiseExceptionCreate('Recibo numero ' +
                    vReceb.vRecibo.dataSet.FieldByName('nrecibo').AsString +
                    ' já recebido por outro usuário e foi usado no recebimento', '');

                if (vDadosIni.StrToFloatFormat(
                  vReceb.vRecibo.dataSet.FieldByName('valor_ut').AsFloat, 2) >
                  vDadosIni.StrToFloatFormat(
                  buscas.FieldByName('valor').AsFloat, 2)) then
                  raiseExceptionCreate('Recibo numero ' +
                    vReceb.vRecibo.dataSet.FieldByName('nrecibo').AsString +
                    ' com valor menor que o esperado. Provavelmente foi baixado por outro usuário.' + #13 +
                    'Valor do Recibo..: ' + Format('%0.2n', [buscas.FieldByName('valor').AsFloat]) + #13 +
                    'Valor do Esperado: ' + Format('%0.2n',
                    [vReceb.vRecibo.dataSet.FieldByName('valor_ut').AsFloat]), '');

                vValorTemp := buscas.FieldByName('valor').AsFloat;
                if (vReceb.vRecibo.dataSet.FieldByName('data_rec').AsDateTime =
                  vDadosIni.getDataBanco(buscas)) and
                  (vReceb.vRecibo.dataSet.FieldByName('deprec').AsString = 'E') and
                  (vReceb.vRecibo.dataSet.FieldByName('recant').AsString = 'S') then
                  vRecAnt := 'O'
                else
                  vRecAnt := vReceb.vRecibo.dataSet.FieldByName('recant').AsString;

                if (vDadosIni.StrToFloatFormat(
                  vReceb.vRecibo.dataSet.FieldByName('valor_ut').AsFloat, 2) <
                  vDadosIni.StrToFloatFormat(
                  vValorTemp, 2)) then
                begin

                  buscas.Close;
                  buscas.SQL.Text := 'update recibos set valor = :valor, recant = :recant' +
                    ' where nrecibo = ' + IntToStr(vReceb.vRecibo.dataSet.FieldByName('nrecibo').AsInteger) +
                    ' and cod_empresa = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
                    IntToStr(vReceb.vRecibo.dataSet.FieldByName('cod_empresa').AsInteger),
                    vDadosIni.codEmpresa);
                    //vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(dadosReceber.codigoUnificada), vDadosIni.codEmpresa);
                  buscas.ParamByName('recant').AsString := vRecAnt;
                  buscas.ParamByName('valor').AsFloat := vDadosIni.StrToFloatFormat(
                    vValorTemp - vReceb.vRecibo.dataSet.FieldByName('valor_ut').AsFloat, 2);
                  buscas.ExecSQL;

                  vTpBaixa := 'P';

                end
                else
                begin

                  buscas.Close;
                  buscas.SQL.Text := 'update recibos set status_rec = :status_rec, ' +
                    ' data_baixa = :data_baixa, ndocant = :ndocant, historico_rec = :historico_rec' +
                    ' where nrecibo = ' + IntToStr(vReceb.vRecibo.dataSet.FieldByName('nrecibo').AsInteger) +
                    ' and cod_empresa = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
                    IntToStr(vReceb.vRecibo.dataSet.FieldByName('cod_empresa').AsInteger),
                    vDadosIni.codEmpresa);
                    //vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(dadosReceber.codigoUnificada), vDadosIni.codEmpresa);
                  buscas.ParamByName('status_rec').AsString := 'RECEBIDO';
                  //                buscas.ParamByName('valor').AsFloat := vDadosIni.StrToFloatFormat( vValorTemp, 2);
                  buscas.ParamByName('data_baixa').AsDate := vDadosIni.getDataBanco(FBuscas2);
                  buscas.ParamByName('ndocant').AsInteger := dadosReceber.loteQuitacao;
                  buscas.ParamByName('historico_rec').AsString :=
                    'RECIBO QUITADO FINANCEIRO CONF. LOTE Nº ' + IntToStr(dadosReceber.loteQuitacao);
                  buscas.ExecSQL;

                  vTpBaixa := 'T';

                end;

                buscas.Close;
                buscas.SQL.Text := ' INSERT INTO HIST_REC (SEQCAD_REC, COD_EMPRESA, NRECIBO, ' +
                  ' VALOR_BAIXA, VALOR_RECIBO, DATA_REC, ' +
                  ' RECANT, NDOCANT, DATA_BAIXA, HISTORICO_REC, '+
                  ' COD_US, TP_DOC_BAIXA, TP_BAIXA, LOTE_QUIT, COD_UNIFICADA)' +
                  ' VALUES (:SEQCAD_REC, :COD_EMPRESA, :NRECIBO, ' +
                  ' :VALOR_BAIXA, :VALOR_RECIBO, :DATA_REC, ' +
                  ' :RECANT, :NDOCANT, :DATA_BAIXA, :HISTORICO_REC, ' +
                  ' :COD_US, :TP_DOC_BAIXA, :TP_BAIXA, :LOTE_QUIT, :COD_UNIFICADA)';
                buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
                buscas.ParamByName('COD_UNIFICADA').AsInteger :=
                  vReceb.vRecibo.dataSet.FieldByName('cod_empresa').AsInteger;
  //              buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(dadosReceber.codigoUnificada), vDadosIni.codEmpresa);
                buscas.ParamByName('NRECIBO').AsInteger :=
                  vReceb.vRecibo.dataSet.FieldByName('NRECIBO').AsInteger;
                buscas.ParamByName('VALOR_BAIXA').AsCurrency :=
                  vReceb.vRecibo.dataSet.FieldByName('valor_ut').AsCurrency;
                if vTpBaixa = 'P' then
                  buscas.ParamByName('VALOR_RECIBO').AsCurrency := vValorTemp
                else
                  buscas.ParamByName('VALOR_RECIBO').AsCurrency := 0;
                buscas.ParamByName('DATA_REC').AsDateTime :=
                  vReceb.vRecibo.dataSet.FieldByName('DATA_REC').AsDateTime;
                buscas.ParamByName('RECANT').AsString := vRecAnt;
                buscas.ParamByName('NDOCANT').AsInteger := dadosReceber.loteQuitacao;
                buscas.ParamByName('DATA_BAIXA').AsDate := vDadosIni.getDataBanco(FBuscas2);
                if vTpBaixa = 'P' then
                  buscas.ParamByName('HISTORICO_REC').AsString := 'BAIXA PARCIAL FINANCEIRO LOTE Nº '
                    + IntToStr(dadosReceber.loteQuitacao)
                else
                  buscas.ParamByName('HISTORICO_REC').AsString := 'BAIXA TOTAL FINANCEIRO LOTE Nº ' +
                    IntToStr(dadosReceber.loteQuitacao);
                buscas.ParamByName('COD_US').AsInteger := vDadosIni.vCodUsuario;
                buscas.ParamByName('SEQCAD_REC').AsInteger := GenCodigo('HIST_REC', buscas2, vDadosIni.codEmpresa);
  //              buscas.ParamByName('SEQCAD_REC').AsInteger := GenCodigo('HIST_REC', dtmContasAReceber.SpIncCodigo, vDadosIni.codEmpresa);
                buscas.ParamByName('TP_DOC_BAIXA').AsString := 'PRE';
                buscas.ParamByName('TP_BAIXA').AsString := vTpBaixa;
                if vTpBaixa = 'T' then
                  buscas.ParamByName('VALOR_RECIBO').AsCurrency := 0;
                buscas.ParamByName('LOTE_QUIT').AsCurrency := dadosReceber.loteQuitacao;

                buscas.ExecSQL;

              end;
              vReceb.vRecibo.dataSet.Next;
            end;
          finally
            vReceb.vRecibo.dataSet.EnableControls;
          end;

{$ENDREGION}

        end;

{$ENDREGION}

      end;

      fRecebimento.Next;
    end;

{$REGION 'taxa cartao'}
    if (dadosReceber.lancarTaxaCartao) and (dadosReceber.valorSomaTaxaCartao > 0) and
      (dadosReceber.codigoControleTaxaCartao > 0) and (dadosReceber.numContaTaxaCartao > 0) and
      (not dadosReceber.processamentoAutomatico) then
    begin
      vLancL.N_CONTA_PLC := dadosReceber.numContaTaxaCartao;

      //    vContLigL.vPCont.dataSet.Locate('N_CONTA_PLC', vLancL.N_CONTA_PLC, []);
      if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
        raiseExceptionCreate('Corrija o cadastro para continuar', '');

      vLancL.HISTORICO_L := 'SAIDA TAXA DE CARTAO DE CREDITO';
      vLancL.VALOR_L := dadosReceber.valorSomaTaxaCartao;
      vLancL.CODIGO_CTRL := dadosReceber.codigoControleTaxaCartao;
      vLancL.TIPO_L := vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString;
      vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
      vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
      vLancL.LOTE_QUIT := dadosReceber.loteQuitacao;
      vLancL.COD_EMP_MULT := dadosReceber.codigoUnificada;
      vLancL.VL_CONTABIL := 0;
      vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
      vLancL._efetuarLancamento;
    end;

{$ENDREGION}

  	if (trim(vCodCreditosBol) <> '') then
    	vReceb.vCr._gerarBoletoCreditos(vCodCreditosBol, vLoteBaixaCreditos);

  except on E: Exception do
    begin
      Result := False;
      registraErro('function TContasAReceber._confirmarLancamentosRecebimento. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro ao incluir registros a receber. Erro: ' + E.Message),
        'Atenção', 0 + 64);
    end;
  end;

end;

function TContasAReceber._controleValido: Boolean;
var
  vTemp: string;
begin
  Result := False;
  if not _existeControle(dataSet.FieldByName('codigo_ctrl').AsInteger, dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
  begin
    Application.MessageBox('Controle não encontrado ou não informado', 'Atenção', 0 + 64);
    Exit;
  end;

  FVale := Pos('VALE', UpperCase(vCtrl.dataSet.FieldByName('nome_ctrl').AsString)) > 0;

  {if Trim(vCtrl.dataSet.FieldByName('docs').AsString) <> FDocs then
  begin

    vTemp := 'Cheque';
    if FDocs = 'S2' then
      vTemp := 'Crédito';

    if Application.MessageBox(pchar(
      'Controle não é para Cadastro de ' + vTemp + ', Continua?'),
      'Atenção', MB_ICONQUESTION + MB_YESNO ) <> IDYES then
    Exit;
  end;}

//                     Com o valor contabil não será mais necessario esta configuracao
//  if dataSet.State in [dsEdit, dsInsert] then
//    if Trim(vCtrl.dataSet.FieldByName('NAT_LANC').AsString) = 'C' then
//      dataSet.FieldByName('TIP_CNT').AsString := 'C'
//    else
//      dataSet.FieldByName('TIP_CNT').AsString := 'N';

  Result := True;

end;

function TContasAReceber._definirContasDeSaida: Boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select ncon_s_chq, ncon_s_crd, ncon_v_prod, ncon_c_prod,' +
    ' ncon_j_prest, ncon_d_prest, ncon_ed_prest, ncon_sj_prest from cont_lig cl where cod_emp = ' + vDadosIni.codEmpresa;
  buscas.Open;

  dadosReceber.numContaSCh := buscas.FieldByName('ncon_s_chq').AsFloat;
  dadosReceber.numContaSCr := buscas.FieldByName('ncon_s_crd').AsFloat;
  dadosReceber.numContaVendaProd := buscas.FieldByName('ncon_v_prod').AsFloat;
  dadosReceber.numContaCompraProd := buscas.FieldByName('ncon_c_prod').AsFloat;
  dadosReceber.numContaJuros := buscas.FieldByName('ncon_j_prest').AsFloat;
  dadosReceber.numContaDesconto := buscas.FieldByName('ncon_d_prest').AsFloat;
  dadosReceber.numContaEntDesconto := buscas.FieldByName('ncon_ed_prest').AsFloat;
  dadosReceber.numContaSaidaJuros := buscas.FieldByName('ncon_sj_prest').AsFloat;
end;

function TContasAReceber._definirDataSetRecebimento: Boolean;
var
  I, J: Integer;
  vOK: Boolean;

begin
  Result := True;

  if fRecebimento <> nil then
    Exit;

  fRecebimento := TClientDataSet.Create(Application);
  fDsRecebimento := TDataSource.Create(Application);
  fDsRecebimento.DataSet := fRecebimento;
  fDsRecebimento.AutoEdit := False;

  fRecebimento.FieldDefs.Clear;
  fRecebimento.FieldDefs.Add('TIPO', ftString, 2, false);
  fRecebimento.FieldDefs.Add('VALOR_L', ftCurrency, 0, false);
  fRecebimento.FieldDefs.Add('NOMECTRL', ftString, 35, false);
  fRecebimento.FieldDefs.Add('HIST', ftString, 30, false);
  fRecebimento.FieldDefs.Add('NDOC_L', ftString, 20, false);
  fRecebimento.FieldDefs.Add('VENCIMENTO', ftDateTime, 0, false);
  fRecebimento.FieldDefs.Add('HISTORICO_L', ftString, 60, false);
  fRecebimento.FieldDefs.Add('NUMCONTASAIDA', ftFloat, 0, false);
  //Lancamentos
  fRecebimento.FieldDefs.Add('TIPO_L', ftString, 1, false);
  fRecebimento.FieldDefs.Add('DATA', ftDateTime, 0, false);
  fRecebimento.FieldDefs.Add('DTREFERENCIA', ftDateTime, 0, false);
  fRecebimento.FieldDefs.Add('VL_CONTABIL', ftCurrency, 0, false);
  fRecebimento.FieldDefs.Add('SAIDA_PROC_AUTO', ftString, 1, false); // S: Sim, para fazer as saidas dos cartoes; N: Nao faz lancamentos de saida, apenas os de entrada
//  fRecebimento.FieldDefs.Add('ARQ_EXTRATO_ADM', ftString, 255, false); // Para gravar o arquivo da conciliacao do cartao que possui o ajuste
//  fRecebimento.FieldDefs.Add('COD_ADM', ftInteger, 0, false);//Codigo da adm do cartao para usar junto do campo acima no estorno
  for I := 0 to dtmContasAReceber.cdsCtrlCh.FieldDefs.Count - 1 do
  begin
    vOK := False;
    for J := 0 to fRecebimento.FieldDefs.Count - 1 do
    begin
      vOK := (Trim(dtmContasAReceber.cdsCtrlCh.FieldDefs[i].Name) =
        Trim(fRecebimento.FieldDefs[J].Name));
      if vOK then
        Break;
    end;
    if not vOK then
    try
      if fRecebimento.FindField(dtmContasAReceber.cdsCtrlCh.FieldDefs[i].Name) = nil then
      fRecebimento.FieldDefs.Add(
        dtmContasAReceber.cdsCtrlCh.FieldDefs[i].Name,
        dtmContasAReceber.cdsCtrlCh.FieldDefs[i].DataType,
        dtmContasAReceber.cdsCtrlCh.FieldDefs[i].Size, False);
    except
    end;
  end;

  vOK := False;
  for I := 0 to dtmContasAReceber.cdsCtrlCr.FieldDefs.Count - 1 do
  begin
    for J := 0 to dtmContasAReceber.cdsCtrlCh.FieldDefs.Count - 1 do
    begin
      vOK := (Trim(dtmContasAReceber.cdsCtrlCr.FieldDefs[i].Name) =
        Trim(dtmContasAReceber.cdsCtrlCh.FieldDefs[J].Name));
      if vOK then
        Break;
    end;
    if not vOK then
    try
      fRecebimento.FieldDefs.Add(
        dtmContasAReceber.cdsCtrlCr.FieldDefs[i].Name,
        dtmContasAReceber.cdsCtrlCr.FieldDefs[i].DataType,
        dtmContasAReceber.cdsCtrlCr.FieldDefs[i].Size, False);
    except
    end;
  end;

  //    try if (fRecebimento.FindField(dtmContasAReceber.cdsCtrlCr.FieldDefs[i].Name) = nil) then
  //        fRecebimento.FieldDefs.Add( dtmContasAReceber.cdsCtrlCr.FieldDefs[i].Name,
  //          dtmContasAReceber.cdsCtrlCr.FieldDefs[i].DataType,
  //          dtmContasAReceber.cdsCtrlCr.FieldDefs[i].Size, False); except end;

  try
    fRecebimento.CreateDataSet;
  except
  end;

  //  TFloatField(fRecebimento.FindField('VALORL')).DisplayFormat := '##0.00';
  //  TDateTimeField(fRecebimento.FindField('VENCIMENTO')).EditMask := '!99/99/0000;1;_';

  for I := 0 to fRecebimento.FieldCount - 1 do
    if fRecebimento.Fields[i] is TDateTimeField then
      TDateTimeField(fRecebimento.Fields[i]).EditMask := '!99/99/0000;1;_'
    else if fRecebimento.Fields[i] is TFloatField then
      TFloatField(fRecebimento.Fields[i]).DisplayFormat := '##0.00';

  TFloatField(fRecebimento.FindField('N_CONTA_PLC')).DisplayFormat := '';
  fRecebimento.IndexFieldNames := 'TIPO';

end;

procedure TContasAReceber._desmarcaLinha;
begin
  dataSet.Edit;
  dataSet.FieldByName('sel').AsString := '';
  dataSet.Post;
end;

procedure TContasAReceber._desmarcarDocumentoComoRecebendo;
var
  vDoc, vUsuario: string;
  vPointer: Pointer;
  vSelecionado: boolean;
begin
  try

    if Application.MessageBox(pchar(
      'Os documentos selecionados serão desmarcados do recebimento. Deseja mesmo continuar?'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

    if not vDadosIni.PesqPros('CAR061', 'ALTERAR', 'TIPO ' + FDocs, FTable,
      '', buscas, True) then
      Exit;

    vPointer := dataSet.GetBookmark;

    vSelecionado := false;

    try
    	dataSet.DisableControls;
      dataSet.first;
      while not dataSet.Eof do
      begin
        if dataSet.FieldByName('sel').AsString = 'S' then
        begin
          vSelecionado := true;
          if FDocs = 'S1' then
          begin
            FCodigo := dataSet.FieldByName('codigo_ch').AsInteger;
            vDoc := Trim('Cheque de número ' + dataSet.FieldByName('n_ch').AsString);
          end
          else
          begin
            FCodigo := dataSet.FieldByName('cod_cred').AsInteger;
            vDoc := Trim('Documento de número ' + dataSet.FieldByName('n_doc_c').AsString);
          end;

//          if FDocs = 'S1' then
//            dataSet.RefreshRecord;

          if dataSet.FieldByName('status_cx').AsString = 'R' then
          begin
            if dataSet.FieldByName('OP_CX').AsInteger <> vDadosIni.vCodUsuario then
            begin
            	vUsuario:= retornaValor('select col.nome_vendedor as valor from colaborador col '+
                ' where col.cod_vendedor='+IntToStr(dataSet.FieldByName('OP_CX').AsInteger)+
                ' and col.cod_empresa='+vDadosIni.codEmpresa);
              if Application.MessageBox(pchar(vDoc + ' já começou a ser quitado pelo usuário ' + #13 +
                  IntToStr(dataSet.FieldByName('OP_CX').AsInteger) +' - '+vUsuario+chr(13)+
                  'Deseja desmarcar este documento assim mesmo?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
              begin
                if vDadosIni.PesqPros('CAR113', 'ALTERAR', 'TIPO ' + FDocs +
                	' ' + vDoc, FTable, IntToStr(FCodigo), buscas, True) then
                begin
                	dataSet.Edit;
                  dataSet.FieldByName('STATUS_CX').Value := Null;
                  dataSet.FieldByName('OP_CX').Value := Null;
                  dataSet.FieldByName('DATA_DESM').AsDateTime := vDadosIni.getDataBanco(buscas);
                  dataSet.FieldByName('OP_DESM').AsInteger := vDadosIni.vCodUsuario;
                  dataSet.Post;

                  vDadosIni.GravaAuditoria('CAR113', 'ALTERAR', 'TIPO ' + FDocs +
                    ' ' + vDoc, FTable, IntToStr(FCodigo) + '/' + vDoc, buscas);
                end;
              end;
            end
            else
            begin
              dataSet.Edit;
              dataSet.FieldByName('STATUS_CX').Value := Null;
              dataSet.FieldByName('OP_CX').Value := Null;
              dataSet.FieldByName('DATA_DESM').AsDateTime := vDadosIni.getDataBanco(buscas);
              dataSet.FieldByName('OP_DESM').AsInteger := vDadosIni.vCodUsuario;
              dataSet.Post;

              vDadosIni.GravaAuditoria('CAR061', 'ALTERAR', 'TIPO ' + FDocs +
                ' ' + vDoc, FTable, IntToStr(FCodigo) + '/' + vDoc, buscas);

            end;
          end;
        end;
        dataSet.next;
      end;
    finally
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

      vDadosIni.GravaAuditoria('CAR061', 'ALTERAR', 'CONFIRMADA MODIFICACOES', FTable, '', buscas);

      Application.MessageBox(pchar('Processo concluído'), 'Atenção', 0 + 64);

    end;

    dataSet.GotoBookmark(vPointer);

  except
    on e: exception do
    begin
      RollBackTransacao;
      dataSet.Refresh;
      Application.MessageBox(pchar('Erro: ' + e.Message + #13 + ' Tipo Doc ' + FDocs), 'Atenção', 0 + 64);
      registraErro('procedure TContasAReceber._desmarcarDocumentoComoRecebendo. Erro: ' + e.Message + ' Tipo Doc ' + FDocs);
    end;
  end;
end;

procedure TContasAReceber._desmarcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    try
    	dataSet.DisableControls;
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
      dataSet.EnableControls;
    end;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

//COMENTEI POIS NAO ESTAVA SENDO MAIS USADO - CASO VENHA A USAR VERIFICAR O CODIGO DA EMPRESA
//function TContasAReceber._desnegativaClienteRecebimento(
//  pCodCliente: Integer; vtp: integer): Boolean;
//var
//  vSqlTxt: string;
//  vflagch, vflagc: integer;
//  vdatadia: Tdate;
//begin
//  if vtp = 1 then
//  begin
//    if vDadosIni.vEmp.vUsarBarramento <> 'S' then
//      exit;
//    buscas.Close;
//    buscas.SQL.Text := 'select first 1 cc.codigo_ch from controle_cheque cc' +
//      ' inner join controles c on cc.codigo_ctrl = c.codigo_ctrl and cc.codigo_emp = c.codigo_emp' +
//      ' and c.barrar_automatico = ''S''' +
//      ' where ((cc.status_ch is null) or (rtrim(cc.status_ch) = ''''))' +
//      ' and cc.cod_cliente = ' + IntToStr(pCodCliente) +
//      ' and cc.codigo_emp = ' + vDadosIni.codEmpresa;
//    buscas.Open;
//
//    if not buscas.IsEmpty then
//      Exit;
//
//    buscas.Close;
//    buscas.SQL.Text := 'select first 1 cc.cod_cred from controle_creditos cc' +
//      ' inner join controles c on cc.codigo_ctrl = c.codigo_ctrl and cc.codigo_emp = c.codigo_emp' +
//      ' and c.barrar_automatico = ''S''' +
//      ' where ((cc.status_c is null) or (rtrim(cc.status_c) = ''''))' +
//      ' and cc.cod_faturamento = ' + IntToStr(vDadosIni.vEmp.vCodigoBarrado) +
//      ' and cc.cod_cliente = ' + IntToStr(pCodCliente) +
//      ' and cc.codigo_emp = ' + vDadosIni.codEmpresa;
//    buscas.Open;
//
//    if not buscas.IsEmpty then
//      Exit;
//
//    buscas.Close;
//    buscas.SQL.Text := 'update clientes set CODIGO_FATURAMENTO = :CODIGO_FATURAMENTO' +
//      ' where cod_cliente = ' + IntToStr(pCodCliente) +
//      ' and cod_empresa = ' + vDadosIni.codEmpresa;
//    buscas.ParamByName('CODIGO_FATURAMENTO').AsInteger := vDadosIni.vEmp.vCodigoDesbarrado;
//    buscas.ExecSQL;
//
//    vCtrl._abreTodosControlesBarramentoAutomaticoCAR;
//
//    vSqlTxt := 'update controle_creditos set COD_FATURAMENTO = ' +
//      IntToStr(vDadosIni.vEmp.vCodigoDesbarrado) +
//      ', DATA_DESBARRAMENTO = afdsfadf' +
//      ' where codigo_emp = ' + vDadosIni.codEmpresa +
//      ' and COD_FATURAMENTO = ' + IntToStr(vDadosIni.vEmp.vCodigoBarrado) +
//      ' and cod_cliente = ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger);
//
//    vCtrl.dataSet.First;
//    while not vCtrl.dataSet.Eof do
//    begin
//
//      if pos('(', vSqlTxt) = 0 then
//        vSqlTxt := vSqlTxt + ' and codigo_ctrl in (' +
//          IntToStr(vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger)
//      else
//        vSqlTxt := vSqlTxt + ', ' + IntToStr(vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger);
//
//      vCtrl.dataSet.Next;
//    end;
//    if pos('(', vSqlTxt) > 0 then
//      vSqlTxt := vSqlTxt + ')';
//
//    buscas.Close;
//    buscas.SQL.Text := vSqlTxt + ' and ((status_c is null) or (status_c = ''''))';
//    buscas.ExecSQL;
//
//    Result := True;
//  end
//  else
//  begin
//    vflagch := 0;
//    vflagc := 0;
//    vdatadia := vDadosIni.getDataBanco(buscas);
//    buscas.Close;
//    buscas.SQL.Text := 'select first 1 cc.codigo_ch from controle_cheque cc' +
//      ' inner join controles c on cc.codigo_ctrl = c.codigo_ctrl and cc.codigo_emp = c.codigo_emp' +
//      ' and c.barrar_automatico = ''S''' +
//      ' where ((cc.status_ch is null) or (rtrim(cc.status_ch) = ''''))' +
//      ' and cc.cod_cliente = ' + IntToStr(pCodCliente) +
//      ' and cc.codigo_emp = ' + vDadosIni.codEmpresa + ' and (cc.data_venc+' +
//      inttostr(vDadosIni.vEmp.vDiasCarenciaJuros) + ' < ' +
//      QuotedStr(FormatDateTime('mm/dd/yyyy', vdatadia)) + ')';
//    if (self is TControleCheque) then
//    begin
//      buscas.SQL.Text := buscas.SQL.Text + ' and cc.codigo_ch <> ' + (self as
//        TControleCheque).dataSet.FieldByName('CODIGO_CH').AsString;
//    end;
//    buscas.Open;
//
//    if not buscas.IsEmpty then
//      vflagch := 1;
//
//    buscas.Close;
//    buscas.SQL.Text := 'select first 1 cc.cod_cred from controle_creditos cc' +
//      ' inner join controles c on cc.codigo_ctrl = c.codigo_ctrl and cc.codigo_emp = c.codigo_emp' +
//      ' and c.barrar_automatico = ''S''' +
//      ' where ((cc.status_c is null) or (rtrim(cc.status_c) = ''''))' +
//      ' and cc.cod_cliente = ' + IntToStr(pCodCliente) +
//      ' and cc.codigo_emp = ' + vDadosIni.codEmpresa + ' and (cc.data_venc_c+' +
//      inttostr(vDadosIni.vEmp.vDiasCarenciaJuros) + ' < ' +
//      QuotedStr(FormatDateTime('mm/dd/yyyy', vdatadia)) + ') ';
//    if (self is TControleCredito) then
//    begin
//      buscas.SQL.Text := buscas.SQL.Text + ' and cc.cod_cred <> ' + (self as
//        TControleCredito).dataSet.FieldByName('COD_CRED').AsString;
//    end;
//    buscas.Open;
//
//    if not buscas.IsEmpty then
//      vflagc := 1;
//
//    if (vflagch = 1) or (vflagc = 1) then
//      Result := false
//    else
//      Result := true;
//  end;
//end;

function TContasAReceber._emiteRelatorioDev(vcheck: TchecklistBox; vvend: string;
  vFiltroVend, pPorCarteira: boolean; pCodigoUnificada: Integer): boolean;
var
  vlcjuros, vvlrcbcl, vvlRcb: currency;
  vtsmjuros,vtcmjuros: currency;
  txj: real;
  vvlrcbclc, vvlRcbc: currency;
  vcodcl: integer;
  vdias, vano: integer;
  vvtanos, vvalano: currency;
  vvtanosc, vvalanoc: currency;
  i,vauxvnd,vitx: integer;
  RdCreditos: TRDprint;
  vcontr, controles, vTmp, vTmp2,vteste: string;
  vCodigoUnificada, vUnificadaColab, vCodigoCol: Integer;
  vDataBanco: TDateTime;
begin
  vDataBanco := vDadosIni.getDataBanco(Fbuscas3);

  controles := '';
  for i := 0 to vCheck.Items.Count - 1 do
  begin
    if vCheck.Checked[i] then
    begin
      if controles = '' then
        controles := controles + copy(vCheck.Items[i], 0, pos('-', vCheck.Items[i]) - 1)
      else
        controles := controles + ',' + copy(vCheck.Items[i], 0, pos('-', vCheck.Items[i]) - 1)
    end;
  end;
  vcontr := controles;
  controles := '(' + controles + ')';
  if controles = '()' then
  begin
    messagedlg('Selecione no mínimo um controle.', mtinformation, [mbOK], 0);
    Result := false;
    exit;
  end;
  vvlRcb := 0;
//  buscas.close;
  if pPorCarteira then
  begin
    vTmp := 'cl';
    vTmp2 := 'cl.cod_vendedor';
  end
  else
  begin
    vTmp := 'vnd';
    vTmp2 := 'cr.codigo_vend';
  end;

  pCodigoUnificada := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, pCodigoUnificada, StrToInt(vDadosIni.codEmpresa));

  fbuscas3.Close;
  if vFiltroVend then
  begin
    if Pos(' EMP: ', vvend) > 0 then
    begin
      vteste := vvend;
      System.Delete(vteste, 1, Pos(' EMP: ', vvend) + 5);
      vteste := Copy(vteste, 1, Pos(' COL: ', vteste));
      vUnificadaColab := StrToInt(Trim(vteste));
      vteste := vvend;
      System.Delete(vteste, 1, Pos(' COL: ', vvend) + 5);
      vCodigoCol := StrToInt(Trim(vteste));
    end
    else
    begin
      vUnificadaColab := StrToInt(vDadosIni.codEmpresa);
      vCodigoCol := retornacodvendedor(vvend, vUnificadaColab);
    end;

    fbuscas3.SQL.text := 'select distinct coalesce('+vTmp+'.cod_vendedor,0) as cod_vendedor, ' +
      ' coalesce(cr.cod_emp_mult, cr.codigo_emp) unificada from cred_jur cr ' +
      ' left join empresa emp on cr.codigo_emp = emp.cod_empresa ' +
      ' left join clientes cl on cr.cod_cliente = cl.cod_cliente '+
      ' and cr.'+vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
      ' = cl.cod_empresa ' +
      ' left join colaborador vnd on '+vTmp2+' = vnd.cod_vendedor ' +
      ' and cr.'+vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
      ' = vnd.cod_empresa '+
      ' where cr.data_venc >= :vdat1 and cr.data_venc <= :vdat2 ' +
      ' and cr.controle in ' + controles +
      ' and (status_c is null or status_c = ' + quotedstr('') + ') ' +
//      ' and cr.codigo_emp ' +
  	  ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cr.codigo_emp end) ' +
      ' = :cod_empresa ' +
      'and '+vTmp2+' = ' + inttostr(vCodigoCol) +
      vDadosIni.retornoPorCondicao((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodigoUnificada > 0),
        ' and cr.cod_emp_mult = ' + IntToStr(vUnificadaColab), '') +
      ' order by 2, vnd.nome_vendedor, cl.cidade,cl.nome_cliente,cl.bairro,cl.endereco, cr.data_venc';
  end
  else
    fbuscas3.SQL.text := 'select distinct coalesce('+vTmp+'.cod_vendedor,0) as cod_vendedor, ' +
      ' coalesce(cr.cod_emp_mult, cr.codigo_emp) unificada from cred_jur cr ' +
      ' left join empresa emp on cr.codigo_emp = emp.cod_empresa ' + 
      ' left join clientes cl on cr.cod_cliente = cl.cod_cliente ' +
      ' and cr.'+vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
      ' = cl.cod_empresa '+
      ' left join colaborador vnd on '+vTmp2+' = vnd.cod_vendedor ' +
      ' and cr.'+vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
      ' = vnd.cod_empresa '+
      ' where cr.data_venc >= :vdat1 and cr.data_venc <= :vdat2 ' +
      ' and cr.controle in ' + controles +
      ' and (status_c is null or status_c = ' + quotedstr('') + ') ' +
//      ' and cr.codigo_emp ' +
      ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cr.codigo_emp end) ' +
      ' = :cod_empresa ' +
      vDadosIni.retornoPorCondicao((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodigoUnificada > 0),
        ' and cr.cod_emp_mult = ' + IntToStr(pCodigoUnificada), '') +
      ' order by 2, vnd.nome_vendedor, cod_vendedor,cl.cidade,cl.nome_cliente,cl.bairro,cl.endereco, cr.data_venc';
//    fbuscas3.params[0].ParamType := ptInput;
//    fbuscas3.params[0].DataType := ftDate;
//    fbuscas3.params[1].ParamType := ptInput;
//    fbuscas3.params[1].DataType := ftDate;
//    fbuscas3.params[2].ParamType := ptInput;
//    fbuscas3.params[2].DataType := ftInteger;
//    fbuscas3.params[0].value := vdata1;
//    fbuscas3.params[1].value := vdata2;
//    fbuscas3.params[2].value := vDadosIni.codEmpresa;
  fbuscas3.ParamByName('vdat1').AsDate := vdata1;
  fbuscas3.ParamByName('vdat2').AsDate := vdata2;
  fbuscas3.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  fbuscas3.open;
  fbuscas3.FetchAll;
//

//
  linha := 1;
  vpag := 0;
  RdCreditos := TRDprint.Create(Application);
  if not vDadosIni.ModImp(RdCreditos) then
    exit;
  RdCreditos.FonteTamanhoPadrao := S17cpp;
  RdCreditos.TamanhoQteColunas := 132;
  RdCreditos.CaptionSetup := 'Configurações de Impressão';
  RdCreditos.OpcoesPreview.CaptionPreview := 'Clientes Devedores';
  RdCreditos.TitulodoRelatorio := 'Clientes Devedores';
  vDadosIni._LimparVarSendEmail;
  RdCreditos.OnSendMail := vDadosini._SendMailRdPrint;
  RdCreditos.OpcoesPreview.Preview := true;
  RdCreditos.OnSendMail :=nil;
  vDadosIni._LimparVarSendEmail;
  RdCreditos.OnSendMail := _rdSendMail;
  if not RdCreditos.EstaAberto then
    RdCreditos.Abrir;
//  vnomevend:=buscas.FieldByName('VENDEDOR').AsString;
  cabrelDev(RdCreditos, vFiltroVend, pCodigoUnificada);
  vtsmjuros:=0;
  vtcmjuros:=0;
  Fbuscas3.First;
  while not Fbuscas3.eof do
  begin
    vauxvnd:=fbuscas3.FieldByName('COD_VENDEDOR').AsInteger;
    buscas.close;
    buscas.SQL.text := 'select cl.nome_cliente,cl.endereco,cl.NUM_END_CLIENTE,cl.bairro,cl.cidade,cl.fone_cliente,' +
    'cl.cep,cr.data_venc as data_venc_c,cr.valor as valor_c,cr.historico as historico_c,cr.controle as codigo_ctrl,cl.cod_cliente,' +
    'cr.valor_corr,cr.codseq as cod_cred,cl.cod_empresa,coalesce(vnd.nome_vendedor,''SEM VENDEDOR VINCULADO'') '+
    ' as vendedor,tpdoc from cred_jur cr ' +
    ' left join empresa emp on cr.codigo_emp = emp.cod_empresa ' +
    ' left join clientes cl on cr.cod_cliente = cl.cod_cliente '+
    ' and cr.'+vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
    ' = cl.cod_empresa ' +
    ' left join colaborador vnd on '+vTmp2+' = vnd.cod_vendedor ' +
    ' and cr.'+vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
    ' = vnd.cod_empresa '+
    ' where cr.data_venc >= :vdat1 and cr.data_venc <= :vdat2 ' +
    ' and cr.controle in ' + controles +
    ' and (status_c is null or status_c = ' + quotedstr('') + ') ' +
//    ' and cr.codigo_emp ' +
    ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cr.codigo_emp end) ' +
    ' = :cod_empresa ' +
    ' and coalesce('+vTmp2+',0) = ' + inttostr(vauxvnd) + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
      ' and cr.cod_emp_mult = ' + IntToStr(fbuscas3.FieldByName('unificada').AsInteger), '') +
    ' order by cl.cidade,cl.nome_cliente,cl.bairro,cl.endereco,cr.data_venc';
//    buscas.params[0].ParamType := ptInput;
//    buscas.params[0].DataType := ftDate;
//    buscas.params[1].ParamType := ptInput;
//    buscas.params[1].DataType := ftDate;
//    buscas.params[2].ParamType := ptInput;
//    buscas.params[2].DataType := ftInteger;
//    buscas.params[0].value := vdata1;
//    buscas.params[1].value := vdata2;
//    buscas.params[2].value := vDadosIni.codEmpresa;
    buscas.ParamByName('vdat1').AsDate := vdata1;
    buscas.ParamByName('vdat2').AsDate := vdata2;
    buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.open;
    buscas.FetchAll;
    vDadosIni.abreStatusProcessamento('', 'Atualizando Valor Corrigido dos Creditos Vencidos');
    FBuscas2.close;
    try
      try
        FBuscas2 := TIBQuery(dtmContasAReceber.qrOutra);
        if not FBuscas2.Transaction.InTransaction then
          FBuscas2.Transaction.StartTransaction;

        FBuscas2.close;
        buscas.First;
        while not buscas.eof do
        begin
          if buscas.fieldbyname('TPDOC').asstring = 'CRED' then
           FBuscas2.sql.text := 'UPDATE CONTROLE_CREDITOS SET valor_corr = :vvalor ' +
           'where cod_cred = :vcodcred and codigo_emp = :cod_empresa'
          else
           FBuscas2.sql.text := 'UPDATE CONTROLE_CHEQUE SET valor_corr = :vvalor ' +
           'where codigo_ch = :vcodcred and codigo_emp = :cod_empresa';
          if (vDataBanco - (buscas.FieldByName('data_venc_c').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros)) > 0 then
            vdias := trunc(vDataBanco - (buscas.FieldByName('data_venc_c').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros))
          else
            vdias := 0;
          txj := vdias * (vDadosIni.vEmp.vTxJuros / 30);
          vlcjuros := buscas.FieldByName('valor_c').AsCurrency +
            (((buscas.FieldByName('VALOR_C').ascurrency * txj) / 100) +
            ((buscas.FieldByName('VALOR_C').AsCurrency * vDadosIni.vEmp.vMultas) / 100));
//          FBuscas2.params[0].value := vlcjuros;
//          FBuscas2.params[1].asinteger := buscas.FieldByName('cod_cred').AsInteger;
//          FBuscas2.params[2].asinteger := StrToInt(vDadosIni.codEmpresa);
      	  FBuscas2.ParamByName('vvalor').AsFloat := vlcjuros;
          FBuscas2.ParamByName('vcodcred').AsInteger := buscas.FieldByName('cod_cred').AsInteger;
          FBuscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
          FBuscas2.Prepare;
          FBuscas2.ExecSQL;
          buscas.next;
        end;
        if FBuscas2.Transaction.InTransaction then
          FBuscas2.Transaction.Commit;

      finally
        FBuscas2 := TIBQuery(dtmContasAReceber.qrBuscas2);
      end;

    except
      on e: exception do
      begin
        RollBackTransacao;
        Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('Erro ao atualizar valor corrigido Relatório de Vencidos. Erro: ' + e.Message);
      end;
    end;
    vDadosIni.fechaStatusProcessamento;
    buscas.close;
    buscas.open;
    buscas.FetchAll;
// buscas.first;
    linha := linha + 1;
    vDadosIni.abreStatusProcessamento('', 'Buscando Informações Vendedor: '+buscas.FieldByName('VENDEDOR').AsString);
    RdCreditos.Imp(linha, 1, 'Vendedor: ' + Trim(buscas.FieldByName('VENDEDOR').AsString) +
      vDadosIni.retornoPorCondicao( vDadosIni.vEmp.vFinanceiroUnificado,
      ' EMP: ' + vDadosIni.StrZero(Fbuscas3.FieldByName('unificada').AsInteger, 3) +
      ' COL: ' + vDadosIni.StrZero(Fbuscas3.FieldByName('cod_vendedor').AsInteger, 3), ''));
    vlcjuros:=0;
    vvlrcbcl:=0;
    vvlRcb:=0;
    txj:=0;
    vvlrcbclc:=0;
    vvlRcbc:=0;
    vcodcl := buscas.FieldByName('cod_cliente').asinteger;
    linha := linha + 2;
    RdCreditos.Imp(linha, 1, copy(buscas.FieldByName('nome_cliente').AsString, 1, 24));
    RdCreditos.Imp(linha, 26, copy(buscas.FieldByName('endereco').asstring,1,38)+' '+
    copy(buscas.FieldByName('NUM_END_CLIENTE').asstring,1,12));
    RdCreditos.Imp(linha, 78, copy(buscas.FieldByName('bairro').AsString, 1, 30));
    RdCreditos.Imp(linha, 115, copy(buscas.FieldByName('cidade').AsString, 1, 17));
    linha := linha + 1;
    RdCreditos.Imp(linha, 1, buscas.FieldByName('fone_cliente').AsString);
    RdCreditos.Imp(linha, 26, vdadosini.strzero(buscas.FieldByName('cod_cliente').asinteger, 5));
    vvlrcbcl := 0;
    vitx:=1;
    buscas.First;
    while not buscas.eof do
    begin
      Application.ProcessMessages;
      vDadosIni.abreStatusProcessamento('', 'Buscando Informações Vendedor: '+copy(buscas.FieldByName('VENDEDOR').AsString,1,10)+' '+
      vDadosIni.StrZero(vitx,4)+'/'+vDadosIni.StrZero(Buscas.RecordCount,4));
      vCtrl._selecionaControle(buscas.FieldByName('CODIGO_CTRL').AsInteger);
      linha := linha + 1;
      if vcodcl <> buscas.FieldByName('cod_cliente').AsInteger then
      begin
        RdCreditos.Imp(linha, 80, vDadosIni.Replicate('-', 10));
        RdCreditos.Imp(linha, 95, vDadosIni.Replicate('-', 10));
        linha := linha + 1;
        RdCreditos.Imp(linha, 80, vDadosIni.alndir(format('%n', [vvlrcbcl]), 10));
        RdCreditos.Imp(linha, 95, vDadosIni.alndir(format('%n', [vvlrcbclc]), 10));
        linha := linha + 1;
        RdCreditos.Imp(linha, 1, copy(buscas.FieldByName('nome_cliente').AsString, 1, 24));
        RdCreditos.Imp(linha, 26,copy(buscas.FieldByName('endereco').asstring,1,38)+' '+
        copy(buscas.FieldByName('NUM_END_CLIENTE').asstring,1,12));
        //buscas.FieldByName('endereco').AsString);
        RdCreditos.Imp(linha, 78, copy(buscas.FieldByName('bairro').AsString, 1, 30));
        RdCreditos.Imp(linha, 115, copy(buscas.FieldByName('cidade').AsString, 1, 17));
        linha := linha + 1;
        RdCreditos.Imp(linha, 1, buscas.FieldByName('fone_cliente').AsString);
        RdCreditos.Imp(linha, 26, vdadosini.strzero(buscas.FieldByName('cod_cliente').AsInteger, 5));
        vcodcl := buscas.FieldByName('cod_cliente').AsInteger;
        vvlrcbcl := 0;
        vvlrcbclc := 0;
      end;
      RdCreditos.Imp(linha, 60, buscas.FieldByName('DATA_VENC_C').asstring);
      RdCreditos.Imp(linha, 80, vDadosIni.alndir(format('%n',
        [buscas.FieldByName('VALOR_C').Ascurrency]), 10));
      vdias := 0;

      if (vDataBanco - (buscas.FieldByName('data_venc_c').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros)) > 0 then
        vdias := trunc(vDataBanco - (buscas.FieldByName('data_venc_c').AsDateTime +
          vDadosIni.vEmp.vDiasCarenciaJuros))
      else
        vdias := 0;

      txj := vdias * (vDadosIni.vEmp.vTxJuros / 30);
      vlcjuros := buscas.FieldByName('valor_c').ascurrency +
        (((buscas.FieldByName('VALOR_C').ascurrency * txj) / 100) +
        ((buscas.FieldByName('VALOR_C').AsCurrency * vDadosIni.vEmp.vMultas) / 100));
      RdCreditos.Imp(linha, 95, vDadosIni.alndir(format('%n', [vlcjuros]), 10));
      RdCreditos.Imp(linha, 107, copy(vCtrl.dataSet.fieldbyname('NOME_CTRL').asstring, 1, 20));
      VvlRcb := vvlrcb + buscas.FieldByName('Valor_c').AsCurrency;
      vvlrcbcl := vvlrcbcl + buscas.FieldByName('Valor_c').AsCurrency;
      VvlRcbc := vvlrcbc + vlcjuros;
      vvlrcbclc := vvlrcbclc + vlcjuros;
      buscas.next;
      vitx:=vitx+1;
      if linha >= 60 then
      begin
        linha := 1;
        RdCreditos.Novapagina;
        cabrelDev(RdCreditos, vFiltroVend, pCodigoUnificada);
      end;
      if buscas.eof then
      begin
        if vvlrcbcl <> 0 then
        begin
          linha := linha + 1;
          RdCreditos.Imp(linha, 80, vDadosIni.Replicate('-', 10));
          RdCreditos.Imp(linha, 95, vDadosIni.Replicate('-', 10));
          linha := linha + 1;
          RdCreditos.Imp(linha, 80, vDadosIni.alndir(format('%n', [vvlrcbcl]), 10));
          RdCreditos.Imp(linha, 95, vDadosIni.alndir(format('%n', [vvlrcbclc]), 10));
        end;
      end;
    end;

    linha := linha + 1;
    RdCreditos.Imp(linha, 1, vDadosIni.replicate('=', 132));
    linha := linha + 1;
    
    if linha >= 53 then
    begin
      linha := 1;
      RdCreditos.Novapagina;
      cabrelDev(RdCreditos, vFiltroVend, pCodigoUnificada);
    end;
    RdCreditos.Imp(linha, 1, 'TOTAL DE CREDITO IMPRESSO');
    RdCreditos.Imp(linha, 80, vDadosIni.alndir(format('%n', [VvlRcb]), 10));
    RdCreditos.Imp(linha, 95, vDadosIni.alndir(format('%n', [VvlRcbc]), 10));
    vtsmjuros:=vtsmjuros+VvlRcb;
    vtcmjuros:=vtcmjuros+VvlRcbc;

    linha := linha + 2;
    if linha >= 57 then
    begin
      linha := 1;
      RdCreditos.Novapagina;
      cabrelDev(RdCreditos, vFiltroVend, pCodigoUnificada);
    end;
    RdCreditos.Impf(linha, 1, 'TOTAL DE VENCIDOS POR ANO', [negrito]);
    linha := linha + 2;
    RdCreditos.Impf(linha, 1, 'ANO', [negrito]);
    RdCreditos.Impf(linha, 15, 'VALOR', [negrito]);
    RdCreditos.Impf(linha, 30, 'VALOR CORR', [negrito]);
    linha := linha + 1;
    fbuscas2.close;
    if linha >= 60 then
    begin
     linha := 1;
     RdCreditos.Novapagina;
     cabrelDev(RdCreditos, vFiltroVend, pCodigoUnificada);
    end;
//    if vFiltroVend then
//    begin
      fbuscas2.SQL.text := 'select extract(year from cr.data_venc) as ano,cr.valor as valor_c,cr.valor_corr ' +
        ' from cred_jur cr ' +
        ' left join empresa emp on cr.codigo_emp = emp.cod_empresa ' +
        ' left join clientes cl on cr.cod_cliente = cl.cod_cliente' +
        ' and cr.'+vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') +
        ' = cl.cod_empresa ' +
        ' where cr.controle in ' + controles +
        ' and cr.data_venc >= :vdat1 and cr.data_venc <= :vdat2 ' +
        ' and (cr.status_c is null or cr.status_c = ' + quotedstr('') + ') ' +
//        ' and cr.codigo_emp ' +
        ' and (case when(emp.financeiro_unificado = ''S'') then emp.codigo_unificadora else cr.codigo_emp end) ' +
        ' = :cod_empresa ' +
        'and coalesce('+vTmp2+',0) = '+inttostr(vauxvnd)+
        vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
          ' and cr.cod_emp_mult = ' + IntToStr(fbuscas3.FieldByName('unificada').AsInteger), '') +
        ' order by 1';
//      fbuscas2.params[3].ParamType := ptInput;
//      fbuscas2.params[3].DataType := ftInteger;
//      fbuscas2.params[3].AsInteger :=Fbuscas3.FieldByName('COD_VENDEDOR').AsInteger;
      //retornacodvendedor(vvend);
//    end
//    else
//      fbuscas2.SQL.text := 'select extract(year from data_venc_c) as ano,valor_c,valor_corr ' +
//        'from ' +
//        'controle_creditos where codigo_ctrl in ' + controles + ' and data_venc_c >= :vdat1 and ' +
//        'data_venc_c <= :vdat2 and (status_c is null or status_c = ' + quotedstr('') +
//        ') and codigo_emp = :cod_empresa ' +
//        'order by 1';
//    fbuscas2.params[0].ParamType := ptInput;
//    fbuscas2.params[0].DataType := ftDate;
//    fbuscas2.params[1].ParamType := ptInput;
//    fbuscas2.params[1].DataType := ftDate;
//    fbuscas2.params[2].ParamType := ptInput;
//    fbuscas2.params[2].DataType := ftInteger;
//
//    fbuscas2.Params[0].value := vdata1;
//    fbuscas2.Params[1].value := vdata2;
//    fbuscas2.params[2].value := vDadosIni.codEmpresa;
    fbuscas2.ParamByName('vdat1').AsDate := vdata1;
    fbuscas2.ParamByName('vdat2').AsDate := vdata2;
    fbuscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    fbuscas2.open;
    fbuscas2.FetchAll;
    vano := fbuscas2.FieldByName('ANO').AsInteger;
    vvtanos := 0.00;
    vvalano := 0.00;
    vvtanosc := 0.00;
    vvalanoc := 0.00;

    vvalano := vvalano + fbuscas2.FieldByName('VALOR_C').AsCurrency;
    vvalanoc := vvalanoc + fbuscas2.FieldByName('VALOR_CORR').AsCurrency;
    fbuscas2.First;
    while not fbuscas2.eof do
    begin
      fbuscas2.next;
      if (vano <> fbuscas2.FieldByName('ANO').value) or (fbuscas2.eof) then
      begin
        RdCreditos.Impf(linha, 1, vDadosIni.strzero(vano, 4), [negrito]);
        RdCreditos.Impf(linha, 15, vDadosIni.alndir(format('%n', [vvalano]), 10), [negrito]);
        RdCreditos.Impf(linha, 30, vDadosIni.alndir(format('%n', [vvalanoC]), 10), [negrito]);
        linha := linha + 1;
        if linha >= 58 then
        begin
          linha := 1;
          RdCreditos.novapagina;
          cabrelDev(RdCreditos, vFiltroVend, pCodigoUnificada);
          linha := linha + 1;
          RdCreditos.Impf(linha, 1, 'ANO', [negrito]);
          RdCreditos.Impf(linha, 15, 'VALOR', [negrito]);
          RdCreditos.Impf(linha, 30, 'VALOR CORR', [negrito]);
          linha := linha + 1;
        end;
        vvtanos := vvtanos + vvalano;
        vvtanosc := vvtanosc + vvalanoc;
        vvalano := 0;
        vvalanoC := 0;
        vano := fbuscas2.FieldByName('ANO').AsInteger;
      end;
      vvalano := vvalano + fbuscas2.FieldByName('VALOR_C').AsCurrency;
      vvalanoc := vvalanoc + fbuscas2.FieldByName('VALOR_CORR').AsCurrency;
    end;
    linha := linha + 1;
    RdCreditos.Impf(linha, 1, 'TOTAL GERAL: ', [negrito]);
    RdCreditos.Impf(linha, 15, vDadosIni.alndir(format('%n', [vvtanos]), 10), [negrito]);
    RdCreditos.Impf(linha, 30, vDadosIni.alndir(format('%n', [vvtanosc]), 10), [negrito]);
    linha:=linha+2;
    RdCreditos.Imp(linha, 1, vDadosIni.replicate('=', 132));
    Fbuscas3.next;
    if linha >= 60 then
    begin
     linha := 1;
     RdCreditos.Novapagina;
     cabrelDev(RdCreditos, vFiltroVend, pCodigoUnificada);
    end;
  end;
  vDadosIni.fechaStatusProcessamento;
  linha:=linha+1;
  RdCreditos.Imp(linha, 80, vDadosIni.alndir(format('%n', [vtsmjuros]), 10));
  RdCreditos.Imp(linha, 95, vDadosIni.alndir(format('%n', [vtcmjuros]), 10));
  RdCreditos.Fechar;
  buscas.close;
end;

procedure TContasAReceber._enviarModuloTranf;
var
  vDataMaxFecCxl: TDate;
  vOperacao, vProcesso: string;
begin

  if FDocs = 'S1' then
    vProcesso := 'CAR019'
  else
    vProcesso := 'CAR020';

  if not vDadosIni.PesqPros(vProcesso, 'ALTERAR', '', FTable, '',
    buscas, True) then
    Exit;

  try

    if not vDadosIni.definirDiaFinanceiroFechado(buscas) then
      Exit;

    if vDadosIni.vTipoProc <> 'Loja2' then
    begin
      buscas.Close;
      buscas.Sql.Text := 'select max(dia_f_cxl) dia_f_cxl from fecd_cxl WHERE CODIGO_EMP = ' +
        vDadosIni.codEmpresa;
      buscas.Open;

      if not buscas.IsEmpty then
        vDataMaxFecCxl := buscas.FieldByName('dia_f_cxl').AsDateTime;
    end;

    try
    	dataSet.DisableControls;
      dataSet.first;
      while not dataSet.EOF do
      begin
        if dataSet.FieldByName('sel').AsString = 'S' then
        begin
          if FDocs = 'S1' then
            FCodigo := dataSet.FieldByName('codigo_ch').AsInteger
          else
            FCodigo := dataSet.FieldByName('cod_cred').AsInteger;

          if dataSet.FieldByName('data_cxl').IsNull then
          begin
            dataSet.Edit;
            if vDadosIni.vTipoProc <> 'Loja2' then
              dataSet.FieldByName('data_cxl').AsDateTime := vDataMaxFecCxl
            else
              dataSet.FieldByName('data_cxl').AsDateTime := vDadosIni.diaFFinanceiro + 1;

            dataSet.Post;

            vDadosIni.GravaAuditoria(vProcesso, 'ALTERAR', 'TIPO ' + FDocs +
              ' CODIGO ' + IntToStr(FCodigo) +
              ' INC DT: ' + dataSet.FieldByName('data_cxl').AsString, FTable,
              IntToStr(FCodigo), buscas);
          end
          else
          begin
            if Application.MessageBox('Deseja Retirar Data Caixa Auxiliar?',
              'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
            begin
              vDadosIni.GravaAuditoria(vProcesso, 'ALTERAR', 'TIPO ' + FDocs +
                ' CODIGO ' + IntToStr(FCodigo) +
                ' DEL DT: ' + dataSet.FieldByName('data_cxl').AsString, FTable,
                IntToStr(FCodigo), buscas);

              dataSet.Edit;
              dataSet.FieldByName('data_cxl').AsString := '';
              dataSet.Post;
            end;
          end;
        end;
        dataSet.next;
      end;
    finally
      dataSet.EnableControls;
    end;

    if dataSet.ChangeCount = 0 then
      exit;

    Apply;
    CommitaTransacao;

    vDadosIni.GravaAuditoria(vProcesso, 'ALTERAR', 'CONFIRMADA MODIFICACOES', FTable, '', buscas);

  except
    on e: exception do
    begin
      RollBackTransacao;
      dataSet.Refresh;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('procedure TContasAReceber._enviarModuloTranf. Erro: ' + e.Message);
    end;
  end;
end;

function TContasAReceber._excluirDadosEstorno(
  pNumLoteQuitacao, pCodigoUnificada: Integer): Boolean;
var
  vNumLoteQuitacao: Integer;
  vStatusRecibo, vTemp: string;
  vValorRecibo, vValorBaixaRecibo: Currency;
begin
  vNumLoteQuitacao := pNumLoteQuitacao;

  vDadosIni.abreStatusProcessamento('', 'Excluíndo lançamentos');

  FBuscas2.Close;
  FBuscas2.SQL.Text := 'delete from lancamentos' +
    ' where lote_quit = ' + IntToStr(vNumLoteQuitacao) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa;
  FBuscas2.ExecSQL;

  ///  Apagando as entradas feitas na quitacao do lote
  FBuscas2.Close;
  FBuscas2.SQL.Text := 'delete from lanccheque lc' +
    ' where lc.codigo_ch in ( select cc.codigo_ch from controle_cheque cc' +
    ' where cc.lote_ent = ' + IntToStr(vNumLoteQuitacao) +
    ' and cc.codigo_emp = ' + vDadosIni.codEmpresa + ')' +
    ' and lc.codigo_emp = ' + vDadosIni.codEmpresa;
  FBuscas2.ExecSQL;

  vDadosIni.abreStatusProcessamento('', 'Excluíndo entradas');

  FBuscas2.Close;
  FBuscas2.SQL.Text := 'delete from controle_cheque' +
    ' where lote_ent = ' + IntToStr(vNumLoteQuitacao) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa;
  FBuscas2.ExecSQL;

  FBuscas2.Close;
  FBuscas2.SQL.Text := 'delete from creditos_lanc cl' +
    ' where cl.cod_cred in ( select cc.cod_cred from controle_creditos cc' +
    ' where cc.lote_ent = ' + IntToStr(vNumLoteQuitacao) +
    ' and cc.codigo_emp = ' + vDadosIni.codEmpresa + ')' +
    ' and cl.codigo_emp = ' + vDadosIni.codEmpresa;
  FBuscas2.ExecSQL;

  FBuscas2.Close;
  FBuscas2.SQL.Text := 'delete from controle_creditos' +
    ' where lote_ent = ' + IntToStr(vNumLoteQuitacao) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa;
  FBuscas2.ExecSQL;

  FBuscas2.Close;
  FBuscas2.SQL.Text := 'delete from lancamentos' +
    ' where lote_ent = ' + IntToStr(vNumLoteQuitacao) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa;
  FBuscas2.ExecSQL;

  vDadosIni.abreStatusProcessamento('', 'Cancelando lote');

  FBuscas2.Close;
  FBuscas2.SQL.Text := 'update lote_quit' +
    ' set status = ''CANCELADO''' +
    ' where n_lote_quit = ' + IntToStr(vNumLoteQuitacao) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa;
  FBuscas2.ExecSQL;

  vDadosIni.abreStatusProcessamento('', 'Verificando uso de recibos');

  ///  Voltando os valores de recibos caso tenha sido utilizados
  buscas.Close;
  buscas.SQL.Text := 'select * from hist_rec' +
    ' where lote_quit = ' + IntToStr(vNumLoteQuitacao) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
//    ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa);
  buscas.Open;
  buscas.FetchAll;

  buscas.First;
  while not buscas.Eof do
  begin
    vDadosIni.abreStatusProcessamento('', 'Cancelando baixas de recibos');

    FBuscas2.Close;
    FBuscas2.SQL.Text := 'select valor, status_rec, historico_rec from recibos' +
      ' where nrecibo = ' + IntToStr(buscas.FieldByName('nrecibo').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
      IntToStr(buscas.FieldByName('cod_unificada').AsInteger), vDadosIni.codEmpresa);
//      ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa);
    FBuscas2.Open;

    ///  Caso o recibo ja tenha sido recebido totalmente o valor do recibo fica sendo o valor que
    ///  que esta sendo estornado, caso contrario o valor fica sendo o valor atual + o valor esternado

    vStatusRecibo := Trim(FBuscas2.FieldByName('STATUS_REC').AsString);
    vValorRecibo := FBuscas2.FieldByName('valor').AsFloat;
    vValorBaixaRecibo := buscas.FieldByName('valor_baixa').AsFloat;

    vTemp := FBuscas2.FieldByName('historico_rec').AsString;

    ///  Reabrindo o recibo e acertando os valores
    FBuscas2.Close;
    FBuscas2.SQL.Text := 'update recibos' +
      ' set valor = :valor, status_rec = null, data_baixa = null,' +
      ' historico_rec = :historico_rec' +
      ' where nrecibo = ' + IntToStr(buscas.FieldByName('nrecibo').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
      IntToStr(buscas.FieldByName('cod_unificada').AsInteger), vDadosIni.codEmpresa);
      //vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa);
    if buscas.FieldByName('tp_baixa').AsString = 'P' then
    begin
      if Trim(vStatusRecibo) = 'RECEBIDO' then
        FBuscas2.ParamByName('VALOR').AsFloat := vValorBaixaRecibo
      else
        FBuscas2.ParamByName('VALOR').AsFloat := vValorRecibo + vValorBaixaRecibo;
    end
    else
      FBuscas2.ParamByName('valor').AsFloat := vValorRecibo;

    FBuscas2.ParamByName('historico_rec').AsString := Copy('ESTORNO OP ' +
      IntToStr(vDadosIni.vCodUsuario) + ' ' + vTemp, 1, 50);
    FBuscas2.ExecSQL;

    ///  Acertando os valores no hist_rec, Caso o registro do lote nao seja o ultimo este update
    ///  acerta o valor do recibo para o valor correspondente
    FBuscas2.Close;
    FBuscas2.SQL.Text := 'update hist_rec' +
      ' set valor_recibo = (valor_recibo + :valor_baixa)' +
      ' where seqcad_rec > ' + IntToStr(buscas.FieldByName('seqcad_rec').AsInteger) +
      ' and nrecibo = ' + IntToStr(buscas.FieldByName('nrecibo').AsInteger) +
      ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_unificada', 'cod_empresa') +
      ' = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
      IntToStr(buscas.FieldByName('cod_unificada').AsInteger), vDadosIni.codEmpresa) +
      ' and tp_baixa = ''P''';
//      ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa) + ' and tp_baixa = ''P''';
    FBuscas2.ParamByName('valor_baixa').AsFloat := vValorBaixaRecibo;
    FBuscas2.ExecSQL;

    FBuscas2.Close;
    FBuscas2.SQL.Text := 'update hist_rec' +
      ' set valor_recibo = (valor_baixa + :valor_baixa)' +
      ' where seqcad_rec > ' + IntToStr(buscas.FieldByName('seqcad_rec').AsInteger) +
      ' and nrecibo = ' + IntToStr(buscas.FieldByName('nrecibo').AsInteger) +
      ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_unificada', 'cod_empresa') +
      ' = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
      IntToStr(buscas.FieldByName('cod_unificada').AsInteger), vDadosIni.codEmpresa) +
      ' and tp_baixa = ''T''';
//      ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa) + ' and tp_baixa = ''T''';
    FBuscas2.ParamByName('valor_baixa').AsFloat := vValorBaixaRecibo;
    FBuscas2.ExecSQL;

    ///  Como o recibo esta sendo reaberto ele marca as baixa como P (Parcial)
    FBuscas2.Close;
    FBuscas2.SQL.Text := 'update hist_rec' +
      ' set tp_baixa = ''P''' +
      ' where nrecibo = ' + IntToStr(buscas.FieldByName('nrecibo').AsInteger) +
      ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_unificada', 'cod_empresa') +
      ' = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
      IntToStr(buscas.FieldByName('cod_unificada').AsInteger), vDadosIni.codEmpresa);
//      ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa);
    FBuscas2.ExecSQL;

    ///  Removendo o hist_rec
    FBuscas2.Close;
    FBuscas2.SQL.Text := 'delete from hist_rec' +
      ' where seqcad_rec = ' + IntToStr(buscas.FieldByName('seqcad_rec').AsInteger) +
      ' and ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_unificada', 'cod_empresa') +
      ' = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
      IntToStr(buscas.FieldByName('cod_unificada').AsInteger), vDadosIni.codEmpresa);
//      ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa);
    FBuscas2.ExecSQL;

    buscas.Next;
  end;

end;

function TContasAReceber._existeColaborador(pCodigo, pCodigoUnificada: Integer): Boolean;
var
  vCodigo: Integer;
begin
  Result := False;

  if pCodigo > 0 then
    vCodigo := pCodigo
  else if dataSet.FieldByName('CODIGO_VEND').AsInteger > 0 then
    vCodigo := dataSet.FieldByName('CODIGO_VEND').AsInteger
  else
    vCodigo := 0;

  buscas.Close;
  buscas.SQL.Text := 'select COD_VENDEDOR from COLABORADOR' +
    ' where COD_VENDEDOR = :COD_VENDEDOR and COD_EMPRESA = :COD_EMPRESA AND ATIVO = 1';
  buscas.ParamByName('COD_VENDEDOR').AsInteger := vCodigo;
  buscas.ParamByName('COD_EMPRESA').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, pCodigoUnificada, StrToInt(vDadosIni.codEmpresa));
  buscas.Open;

  Result := not buscas.IsEmpty;

  buscas.Close;
end;

function TContasAReceber._existeControle(pControle: Integer; pCodEmpMult: Integer): Boolean;
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
  buscas.SQL.Text := ' select codigo_ctrl from controles ' +
    ' where codigo_ctrl = :codigo_ctrl ' +
    ' and codigo_emp = :codigo_emp ' +
    ' and ativo = 1 ' +
    vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
    	' and (coalesce(controle_visivel, ''S'') = ''S'') ', '');
  buscas.ParamByName('codigo_ctrl').AsInteger := vControle;
  buscas.ParamByName('codigo_emp').AsInteger := vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
  	pCodEmpMult, StrToInt(vDadosIni.codEmpresa));
  buscas.Open;

  Result := not buscas.IsEmpty;

  buscas.Close;
end;

function TContasAReceber._existePContas(pNContaPlc: Double): Boolean;
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

  buscas.Close;
  buscas.SQL.Text :=
    ' SELECT n_conta_plc FROM p_contas ' +
    '	WHERE n_conta_plc = :n_conta_plc and tipo_plc = ''E'' and ativo = 1';
  buscas.ParamByName('n_conta_plc').AsFloat := vNContaPlc;
  buscas.Open;

  Result := not buscas.IsEmpty;

  buscas.Close;
end;

function TContasAReceber._existeVenda: Boolean;
begin
  Result := true;

  if (Trim(dataSet.FieldByName('TP_DOC_V').AsString) = '') or
    (dataSet.FieldByName('N_DOC_V').AsInteger = 0) then
    Exit;

  if (Trim(dataSet.FieldByName('TP_DOC_V').AsString) = 'REQ') or
    (Trim(dataSet.FieldByName('TP_DOC_V').AsString) = 'OS') then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select nped from pedvenda' +
      ' where nped = ' + IntToStr(dataSet.FieldByName('N_DOC_V').AsInteger) +
      ' and tipo = ' + QuotedStr(Trim(dataSet.FieldByName('TP_DOC_V').AsString)) +
      ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger), vDadosIni.codEmpresa);
    buscas.Open;

    Result := not buscas.IsEmpty;

  end
  else if (Trim(dataSet.FieldByName('TP_DOC_V').AsString) = 'MOT') then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select n_comando from com_fat' +
      ' where n_comando = ' + IntToStr(dataSet.FieldByName('N_DOC_V').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger), vDadosIni.codEmpresa);
    buscas.Open;

    Result := not buscas.IsEmpty;

  end
  else if (Trim(dataSet.FieldByName('TP_DOC_V').AsString) = 'NF') then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select num_nf from notafiscal' +
      ' where num_nf = ' + IntToStr(dataSet.FieldByName('N_DOC_V').AsInteger) +
      ' and natureza_nf = ''S''' +
      ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger), vDadosIni.codEmpresa);
    buscas.Open;

    Result := not buscas.IsEmpty;

  end
  else if (Trim(dataSet.FieldByName('TP_DOC_V').AsString) = 'REC') then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select nrecibo from recibos' +
      ' where nrecibo = ' + IntToStr(dataSet.FieldByName('N_DOC_V').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger), vDadosIni.codEmpresa);
    buscas.Open;

    Result := not buscas.IsEmpty;

  end
  else if (Trim(dataSet.FieldByName('TP_DOC_V').AsString) = 'CUP') then
  begin
    Result := True;
  end
  else if (Trim(dataSet.FieldByName('TP_DOC_V').AsString) = 'PRE') then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select nrequisicao from formpagamento' +
      ' where nrequisicao = ' + IntToStr(dataSet.FieldByName('N_DOC_V').AsInteger) +
      ' and tpdocs = ''PRE''' +
      ' and COD_EMPRESA = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger), vDadosIni.codEmpresa);
    buscas.Open;

    Result := not buscas.IsEmpty;

  end
  else
  begin
    Application.MessageBox('Tipo de Documento de Venda Inválido', 'Atenção', 0 + 64);
    Result := False;
    Exit;
  end;

  if not Result then
  begin

    Application.MessageBox(pchar('Venda não encontrada!'),
      'Confirmação', 0 + 64);

    vDadosIni.vInibeMensPesqPros := 'S';
    //Processo para deixar cadastrar contas a receber sem venda existente
    if not vDadosIni.PesqPros('CAR054', 'VALIDAR', 'TIPO ' + dataSet.FieldByName('TP_DOC_V').AsString
      +
      ' NUM ' + dataSet.FieldByName('N_DOC_V').AsString, FTable, IntToStr(FCodigo), buscas, True) then
      Exit
    else if Application.MessageBox(pchar('Continuar mesmo assim?'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
      Exit;

    if dataSet.State in [dsInsert, dsEdit] then
    begin
      dataSet.FieldByName('TP_DOC_V').AsString := '';
      dataSet.FieldByName('N_DOC_V').AsString := '';
    end;

    Result := True;
  end;

  buscas.Close;

end;

function TContasAReceber._fazerLancamentoJurosDescontoRecebimento: Boolean;
begin

  if (dadosReceber.valorDescontos > 0) and (dadosReceber.lancarDesconto) then
  begin

    vLancL.N_CONTA_PLC := vDadosIni.IfThen(vContLigL.dataSet.FieldByName('NCON_ED_PREST').AsFloat > 0,
     vContLigL.dataSet.FieldByName('NCON_ED_PREST').AsFloat, vContLigL.dataSet.FieldByName('NCON_V_PROD').AsFloat);

    //    vContLigL.vPCont.dataSet.Locate('N_CONTA_PLC', vLancL.N_CONTA_PLC, []);
    if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
      raiseExceptionCreate('Corrija o cadastro para continuar', '');

    vLancL.HISTORICO_L := 'ENTRADA DN P/CONCESSÃO DESCONTO OPERADOR ' +
      IntToStr(vDadosIni.vCodUsuario);
    vLancL.VALOR_L := dadosReceber.valorDescontos;
    vLancL.CODIGO_CTRL := vContLigL.dataSet.FieldByName('CONTR_V_PROD').AsInteger;
    vLancL.TIPO_L := vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString;
    vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
    vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
    vLancL.LOTE_QUIT := dadosReceber.loteQuitacao;
    vLancL.COD_EMP_MULT := dadosReceber.codigoUnificada;
    //vLancL.TP_MOD := 'S';
    vLancL.VL_CONTABIL := 0;
    vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
    vLancL._efetuarLancamento;

    vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_D_PREST').AsFloat;

    //    vContLigL.vPCont.dataSet.Locate('N_CONTA_PLC', vLancL.N_CONTA_PLC, []);
    if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
      raiseExceptionCreate('Corrija o cadastro para continuar', '');

    vLancL.HISTORICO_L := 'DESCONTOS CONCEDIDOS OPERADOR ' + IntToStr(vDadosIni.vCodUsuario);
    vLancL.VALOR_L := dadosReceber.valorDescontos;
    vLancL.CODIGO_CTRL := vContLigL.dataSet.FieldByName('CONTR_V_PROD').AsInteger;
    vLancL.TIPO_L := vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString;
    vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
    vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
    vLancL.LOTE_QUIT := dadosReceber.loteQuitacao;
    vLancL.COD_EMP_MULT := dadosReceber.codigoUnificada;
    //vLancL.TP_MOD := 'S';
//    vLancL.VL_CONTABIL := 0;
    vLancL.VL_CONTABIL := vDadosIni.StrToFloatFormat(
          dadosReceber.somaValorContabil / dadosReceber.valorSaida *
            vLancL.VALOR_L, 2);
    if vLancL.VL_CONTABIL > vLancL.VALOR_L then
      vLancL.VL_CONTABIL := vLancL.VALOR_L;
    vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
    vLancL._efetuarLancamento;

  end;

  if (dadosReceber.valorJuros > 0) and (dadosReceber.lancarJuros) then
  begin

    vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_J_PREST').AsFloat;

    //    vContLigL.vPCont.dataSet.Locate('N_CONTA_PLC', vLancL.N_CONTA_PLC, []);
    if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
      raiseExceptionCreate('Corrija o cadastro para continuar', '');

    vLancL.HISTORICO_L := 'ENTRADA DN COBRANCA DE JUROS OPERADOR ' +
      IntToStr(vDadosIni.vCodUsuario);
    vLancL.VALOR_L := dadosReceber.valorJuros;
    vLancL.CODIGO_CTRL := vContLigL.dataSet.FieldByName('CONTR_V_PROD').AsInteger;
    vLancL.TIPO_L := vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString;
    vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
    vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
    vLancL.LOTE_QUIT := dadosReceber.loteQuitacao;
    vLancL.COD_EMP_MULT := dadosReceber.codigoUnificada;
//    vLancL.VL_CONTABIL := 0;
    vLancL.VL_CONTABIL := vDadosIni.StrToFloatFormat(
          dadosReceber.somaValorContabil / dadosReceber.valorSaida *
            vLancL.VALOR_L, 2);
    if vLancL.VL_CONTABIL > vLancL.VALOR_L then
      vLancL.VL_CONTABIL := vLancL.VALOR_L;
    vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
    vLancL._efetuarLancamento;

    vLancL.N_CONTA_PLC := vDadosIni.IfThen(vContLigL.dataSet.FieldByName('NCON_SJ_PREST').AsFloat > 0,
     vContLigL.dataSet.FieldByName('NCON_SJ_PREST').AsFloat, vContLigL.dataSet.FieldByName('NCON_S_CRD').AsFloat);

    //    vContLigL.vPCont.dataSet.Locate('N_CONTA_PLC', vLancL.N_CONTA_PLC, []);
    if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
      raiseExceptionCreate('Corrija o cadastro para continuar', '');

    vLancL.HISTORICO_L := 'JUROS COBRADOS NAS PRESTAÇOES OPERADOR ' +
      IntToStr(vDadosIni.vCodUsuario);
    vLancL.VALOR_L := dadosReceber.valorJuros;
    vLancL.CODIGO_CTRL := vContLigL.dataSet.FieldByName('CONTR_V_PROD').AsInteger;
    vLancL.TIPO_L := vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString;
    vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
    vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
    vLancL.LOTE_QUIT := dadosReceber.loteQuitacao;
    vLancL.COD_EMP_MULT := dadosReceber.codigoUnificada;
    vLancL.VL_CONTABIL := 0;
    vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
    vLancL._efetuarLancamento;

  end;

end;

function TContasAReceber._fazerLancamentoSaidaRecebimento: Boolean;
var
	Z: Integer;
begin
  Result := False;

  if (dadosReceber.valorSaida > 0) and (not dadosReceber.processamentoAutomatico) then
  begin
  	if Length(dadosReceber.codigosControleLanc) > 1 then
    begin
      for Z := Low(dadosReceber.codigosControleLanc) to High(dadosReceber.codigosControleLanc) do
      begin
        if vDadosIni.vContrapartida then
          vLancL.N_CONTA_PLC := vDadosIni.vN_CONTA_PLCContrapartida
        else
          vLancL.N_CONTA_PLC := dadosReceber.numContaSCr;

        //    vContLigL.vPCont.dataSet.Locate('N_CONTA_PLC', vLancL.N_CONTA_PLC, []);
        if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
          raiseExceptionCreate('Corrija o cadastro para continuar', '');

        vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
        vLancL.CODIGO_CTRL := dadosReceber.codigosControleLanc[Z];
        vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
        if vDadosIni.vContrapartida then
        begin
           vLancL.DTREFERENCIA := dadosReceber.dataRef;
           vLancL.NDOC_L := dadosReceber.numDoc;
        end
        else
          vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
        vLancL.HISTORICO_L := dadosReceber.historicoLanc[Z];
        if vDadosIni.vEmp.vFinanceiroUnificado then
          vLancL.HISTORICO_L := vLancL.HISTORICO_L + ' EMP: ' + vDadosIni.StrZero(dadosReceber.codigoUnificada, 3);
        vLancL.VALOR_L := dadosReceber.valorLancSaida[Z];
        vLancL.TP_MOD := 'S';
        vLancL.LOTE_QUIT := dadosReceber.loteQuitacao;

        if dadosReceber.referenteDevolucao then
          vLancL.TP_MOD := ''
        else
          vLancL.TP_MOD := 'S';
        vLancL.COD_EMP_MULT := dadosReceber.codigoUnificada;
        vLancL.VL_CONTABIL := vDadosIni.StrToFloatFormat(dadosReceber.somaValorContabil, 2);
        vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
        vLancL._efetuarLancamento(vDadosIni.vContrapartida);
      end;
    end
    else
    begin
      if vDadosIni.vContrapartida then
        vLancL.N_CONTA_PLC := vDadosIni.vN_CONTA_PLCContrapartida
      else
        vLancL.N_CONTA_PLC := dadosReceber.numContaSCr;

      //    vContLigL.vPCont.dataSet.Locate('N_CONTA_PLC', vLancL.N_CONTA_PLC, []);
      if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
        raiseExceptionCreate('Corrija o cadastro para continuar', '');

      vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
      vLancL.CODIGO_CTRL := dadosReceber.codigoControleSelecionados;
      vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
      if vDadosIni.vContrapartida then
      begin
         vLancL.DTREFERENCIA := dadosReceber.dataRef;
         vLancL.NDOC_L := dadosReceber.numDoc;
      end
      else
        vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
      vLancL.HISTORICO_L := dadosReceber.historicoSaidaLancamento;
      if vDadosIni.vEmp.vFinanceiroUnificado then
        vLancL.HISTORICO_L := vLancL.HISTORICO_L + ' EMP: ' + vDadosIni.StrZero(dadosReceber.codigoUnificada, 3);
      vLancL.VALOR_L := dadosReceber.valorSaida;
      vLancL.TP_MOD := 'S';
      vLancL.LOTE_QUIT := dadosReceber.loteQuitacao;

      if dadosReceber.referenteDevolucao then
        vLancL.TP_MOD := ''
      else
        vLancL.TP_MOD := 'S';
      vLancL.COD_EMP_MULT := dadosReceber.codigoUnificada;
      vLancL.VL_CONTABIL := vDadosIni.StrToFloatFormat(dadosReceber.somaValorContabil, 2);
      vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
      vLancL._efetuarLancamento(vDadosIni.vContrapartida);
    end;

    Result := True;

  end
  else
    Result := True;

end;

function TContasAReceber._getValorVenda(pTipoVenda: string;
  pNumVenda: Integer; pValorDefault: Currency; pCodigoUnificada: Integer): Currency;
var
  vTipDoc: string;
  vNumDoc: Integer;
begin

  vTipDoc := Trim(pTipoVenda);
  if (vTipDoc = 'O') or (vTipDoc = 'ZO') then
    vTipDoc := 'OS'
  else if (vTipDoc = 'R') or (vTipDoc = 'ZR') then
    vTipDoc := 'REQ'
  else if (vTipDoc = 'M') or (vTipDoc = 'ZM') then
    vTipDoc := 'MOT';

  vNumDoc := pNumVenda;

  if (vTipDoc = '') or
    (vNumDoc = 0) then
  begin
    Result := pValorDefault;
    Exit;
  end;

  if (vTipDoc = 'REQ') or
    (vTipDoc = 'OS') then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select valor_total from pedvenda' +
      ' where nped = ' + IntToStr(vNumDoc) +
      ' and tipo = ' + QuotedStr(vTipDoc) +
      ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa);
    buscas.Open;

    if buscas.FieldByName('valor_total').AsFloat > 0 then
      Result := buscas.FieldByName('valor_total').AsFloat
    else
      Result := pValorDefault;

  end
  else if (vTipDoc) = 'MOT' then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select VALOR_A_REC from com_fat' +
      ' where n_comando = ' + IntToStr(vNumDoc) +
      ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa);
    buscas.Open;

    if buscas.FieldByName('VALOR_A_REC').AsFloat > 0 then
      Result := buscas.FieldByName('VALOR_A_REC').AsFloat
    else
      Result := pValorDefault;

  end
  else if (vTipDoc) = 'NF' then
  begin

    buscas.Close;
    buscas.SQL.Text := 'select valor_total from notafiscal' +
      ' where num_nf = ' + IntToStr(vNumDoc) +
      ' and natureza_nf = ''S''' +
      ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa);
    buscas.Open;

    if buscas.FieldByName('valor_total').AsFloat > 0 then
      Result := buscas.FieldByName('valor_total').AsFloat
    else
      Result := pValorDefault;

  end
  else if (vTipDoc) = 'REC' then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select valor from recibos' +
      ' where nrecibo = ' + IntToStr(vNumDoc) +
      ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa);
    buscas.Open;

    if buscas.FieldByName('valor').AsFloat > 0 then
      Result := buscas.FieldByName('valor').AsFloat
    else
      Result := pValorDefault;

  end
  else
    Result := pValorDefault;

end;

function TContasAReceber._imprimirBoleto(pGerarCarne: boolean; pUsarValorCorrigido: boolean; pExibirMensagemGerarBoleto: boolean): Boolean;
var
  hdTemp: THandle;
  formulario: TForm;
  vCodClienteTemp, vCodControleTemp: Integer;
  vImprimir: boolean;
  vdatabanco: TDate;
  vtemp: string;
  vboletoimpresso: boolean;
begin
  try
    vImprimir := false;
    vboletoimpresso := false;

    try
    	dataSet.DisableControls;
      dataSet.Filter := 'SEL = ''S'' AND TRIM(NOSSO_NUMERO_BANCO) <> '''' ';
      dataSet.Filtered := true;

      dataSet.First;
      while not dataSet.Eof do
      begin
        if (Trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString) <> '') then
        begin
          vboletoimpresso := true;

          SqlOpen('select bol.n_seq_bol, bol.nosso_numero_banco, bol.data_ven_bol, ' +
            ' bol.ativo, bol.cod_cliente, cl.nome_cliente from boletas bol ' +
            ' left join clientes cl on cl.cod_cliente = bol.cod_cliente and cl.cod_empresa = bol.cod_empresa ' +
            ' where bol.nosso_numero_banco = ' + QuotedStr(Trim(dataSet.FieldByName('nosso_numero_banco').AsString)) +
            vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
              ' and bol.cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_emp_mult').AsInteger),
              ' and bol.cod_empresa = ' + vDadosIni.codEmpresa) +
            vDadosIni.IfThen(dataSet.FieldByName('COD_COBREBEM').AsInteger > 0,
              ' and bol.cod_cobrebem = ' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger),
              ''), buscas);

          if buscas.IsEmpty then
          begin
            SqlOpen('select bol.n_seq_bol, bol.nosso_numero_banco, bol.data_ven_bol, ' +
              ' bol.ativo, bol.cod_cliente, cl.nome_cliente from boletas bol ' +
              ' left join clientes cl on cl.cod_cliente = bol.cod_cliente and cl.cod_empresa = bol.cod_empresa ' +
              ' where bol.nosso_numero_banco = ' + QuotedStr(Trim(dataSet.FieldByName('nosso_numero_banco').AsString)) +
              vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
                ' and bol.cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_emp_mult').AsInteger),
                ' and bol.cod_empresa = ' + vDadosIni.codEmpresa), buscas);
          end;

          if buscas.IsEmpty then
          begin
            Application.MessageBox(PChar('Boleto selecionado não encontrado no cadastro: ' + #13 +
              'Nosso número ' + dataSet.FieldByName('nosso_numero_banco').AsString + #13 +
              'Data Vencimento ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('data_venc_c').AsDateTime) + #13 +
              'Cliente ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger) + ' - ' + dataSet.FieldByName('nome_c').AsString + #13 + #13 +
              'Favor verificar!'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
          end
          else if buscas.FieldByName('ativo').AsInteger <> 1 then
            Application.MessageBox(PChar('Boleto selecionado esta na lixeira: ' + #13 +
              'Num Seq Boleto ' + IntToStr(buscas.FieldByName('n_seq_bol').AsInteger) + #13 +
              'Nosso Número ' + buscas.FieldByName('nosso_numero_banco').AsString + #13 +
              'Data Vencimento ' + FormatDateTime('dd/mm/yyyy', buscas.FieldByName('data_ven_bol').AsDateTime) + #13 +
              'Cliente ' + IntToStr(buscas.FieldByName('cod_cliente').AsInteger) + ' - ' + buscas.FieldByName('nome_cliente').AsString + #13 + #13 +
              'Favor verificar!'), 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1)
          else
          begin
            try
              if vDadosIni.codEmpresa <> IntToStr(dataSet.FieldByName('cod_emp_mult').AsInteger) then
              begin
                SqlOpen('select bol.n_seq_bol, bol.nosso_numero_banco, bol.data_ven_bol, ' +
                  ' bol.ativo, bol.cod_cliente, cl.nome_cliente from boletas bol ' +
                  ' left join clientes cl on cl.cod_cliente = bol.cod_cliente and cl.cod_empresa = bol.cod_empresa ' +
                  ' where bol.nosso_numero_banco = ' + QuotedStr(Trim(dataSet.FieldByName('nosso_numero_banco').AsString)) +
                  vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
                    ' and bol.cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_emp_mult').AsInteger),
                    ' and bol.cod_empresa = ' + vDadosIni.codEmpresa) +
                  vDadosIni.IfThen(dataSet.FieldByName('COD_COBREBEM').AsInteger > 0,
                    ' and bol.cod_cobrebem = ' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger),
                    ''), buscas);

                if buscas.IsEmpty then
                begin
                  SqlOpen('select bol.n_seq_bol, bol.nosso_numero_banco, bol.data_ven_bol, ' +
                    ' bol.ativo, bol.cod_cliente, cl.nome_cliente from boletas bol ' +
                    ' left join clientes cl on cl.cod_cliente = bol.cod_cliente and cl.cod_empresa = bol.cod_empresa ' +
                    ' where bol.nosso_numero_banco = ' + QuotedStr(Trim(dataSet.FieldByName('nosso_numero_banco').AsString)) +
                    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
                      ' and bol.cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_emp_mult').AsInteger),
                      ' and bol.cod_empresa = ' + vDadosIni.codEmpresa), buscas);
                end;

                SqlOpen(' select empf.*, emp.identificacao_emp, emp.cgc_emp from empresa_fisica empf ' +
                  ' inner join empresa emp on emp.cod_empresa = empf.cod_empresa ' +
                  ' where empf.cod_empresa = ' + IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger) +
                  ' and emp.ativo = 1 ', buscas2);

                if buscas2.IsEmpty then
                begin
                  SqlOpen(' select emp.cod_empresa, emp.identificacao_emp, emp.cgc_emp from empresa emp ' +
                    ' where emp.cod_empresa = ' + IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger) +
                    ' and emp.ativo = 1 ', buscas2);

                  vtemp := 'Crédito selecionado pertence a outra empresa, não é possível ' +
	                  vDadosIni.IfThen(pGerarCarne, 'gerar carnê', 'imprimir boletos') + ' de outra empresa:' + #13 + #13 +
                    'CRÉDITO' + #13 +
                    'Cod Cred: ' + IntToStr(dataSet.FieldByName('cod_cred').AsInteger) + #13 +
                    'Data Vencimento: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('data_venc_c').AsDateTime) + #13 +
                    'Nosso Número: ' + trim(dataSet.FieldByName('nosso_numero_banco').AsString) + #13 +
                    'Valor: ' +  format('%n', [dataSet.FieldByName('valor_c').AsFloat]) + #13 +
                    vDadosIni.IfThen(dataSet.FieldByName('cod_cliente').AsInteger > 0,
                      'Cliente: ' + trim(dataSet.FieldByName('cod_cliente').AsString) + ' - ' + trim(dataSet.FieldByName('nome_c').AsString),
                      'Cliente: ' + trim(dataSet.FieldByName('nome_c').AsString)) + #13 + #13 +
                    'EMPRESA' + #13 +
                    'Codigo: ' + IntToStr(buscas2.FieldByName('cod_empresa').AsInteger) + #13 +
                    'Nome: ' + trim(buscas2.FieldByName('identificacao_emp').AsString) + #13 +
                    'CNPJ/CPF: ' + trim(buscas2.FieldByName('cgc_emp').AsString);

                  Application.MessageBox(PChar(vtemp), 'Atenção', MB_OK + MB_ICONWARNING);
                  Result := false;
                  exit;
                end;
              end;

              vDadosIni.vPesquisa := 'CRB|' +
                dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString + '|' +
                IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '|' +
                IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) + '|';

              vDadosIni.vPesquisaCodEmpresa := StrToInt(vDadosIni.codEmpresa);
              vDadosIni.codEmpresa := IntToStr(dataSet.FieldByName('cod_emp_mult').AsInteger);

              formulario := Funcoes.AbreForm('pkBoletos', 'TfrmSelecionaCobrebem', hdTemp);
            finally
              vDadosIni.codEmpresa := IntToStr(vDadosIni.vPesquisaCodEmpresa);
              vDadosIni.vPesquisaCodEmpresa := 0;
            end;
          end;
        end;
        dataSet.Next;
      end;
    finally
      dataSet.Filtered := false;
      dataSet.EnableControls;
    end;

    if not pGerarCarne then
    begin
      vCodClienteTemp := 0;
      vCodControleTemp := 0;

      try
        dataSet.Filter := 'SEL = ''S'' AND ((TRIM(NOSSO_NUMERO_BANCO) = '''') OR (NOSSO_NUMERO_BANCO IS NULL))  ';
        dataSet.Filtered := true;

        _gerarCarne(false, pUsarValorCorrigido, pExibirMensagemGerarBoleto);
      finally
      	dataSet.Filtered := false;
      end;
    end
    else if pGerarCarne then
    begin
			vCodClienteTemp := 0;
      vCodControleTemp := 0;

      try
      	dataSet.Filter := 'SEL = ''S'' AND ((TRIM(NOSSO_NUMERO_BANCO) = '''') OR (NOSSO_NUMERO_BANCO IS NULL))  ';
	      dataSet.Filtered := true;

	      _gerarCarne(true, false, pExibirMensagemGerarBoleto);
      finally
      	dataSet.Filtered := false;
      end;
    end;

//    if (pGerarCarne) and (not vboletoimpresso) then
//    	Application.MessageBox('Favor gerar carnê antes de imprimir o mesmo.', 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
  finally
    dataSet.Filtered := false;
    if (Trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString) <> '') then
    begin
    	if formulario <> nil then
      begin
        formulario.Free;
        formulario := nil;
        unLoadPackage(hdTemp);
      end;
    end;
  end;
end;

procedure TContasAReceber._imprimirFichaSPC;
var
  relCred: TRDprint;
  vLinha: Integer;
begin

  vLinha := 0;

  relCred := TRDprint.Create(Application);

  relCred.OpcoesPreview.CaptionPreview := 'Ficha SPC';
  relCred.TitulodoRelatorio := relCred.OpcoesPreview.CaptionPreview;
  vDadosIni._LimparVarSendEmail;
  relCred.OnSendMail := vDadosini._SendMailRdPrint;

  relCred.CaptionSetup := 'Opções de Impressão';
  if not vDadosIni.ModImp(relCred) then
    exit;

  relCred.OpcoesPreview.Remalina := True;
  relCred.TamanhoQteColunas := 80;
  relCred.TamanhoQteLinhas := 66;
  relCred.FonteTamanhoPadrao := S10cpp;
  relCred.OpcoesPreview.Preview := True;

  relCred.Abrir;

  vLinha := vLinha + 1;

  buscas.Close;
  buscas.SQL.Text :=
    'select UF_CDL, FONE_CDL, ENDERECO_CDL, BAIRRO_CDL, COD_EMP_CDL, NOME_CDL from empresa' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  relCred.ImpF(vLinha, 1, buscas.FieldByName('NOME_CDL').AsString + '-' +
    buscas.FieldByName('UF_CDL').AsString + '/' +
    'Fone: ' + buscas.FieldByName('FONE_CDL').AsString + '/' +
    buscas.FieldByName('ENDERECO_CDL').AsString + ' - ' +
    buscas.FieldByName('BAIRRO_CDL').AsString, [comp17]);
  vLinha := vLinha + 1;
  relCred.ImpF(vLinha, 1, 'FICHA DE REGISTRO/CANCELAMENTO NA PRACA/CIDADES INTERLIGADAS',
    [negrito]);
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, vDadosIni.Replicate('-', 80));
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, '|');
  relCred.Imp(vLinha, 2, 'USUARIO.: ' + vDadosIni.vEmp.vnomeEmpresa);
  relCred.Imp(vLinha, 60, 'CODIGO: ' +
    vDadosIni.StrZero(buscas.FieldByName('COD_EMP_CDL').AsInteger, 5));
  relCred.Imp(vLinha, 80, '|');
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, vDadosIni.Replicate('-', 80));
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, '|');
  if dadosCDL.vNegativar then
  begin
    relCred.imp(vLinha, 3, '( X ) INCLUSAO ' + datetostr(date));
    relCred.imp(vLinha, 33, '(   ) EXCLUSAO    /   /   ');
  end
  else
  begin
    relCred.imp(vLinha, 3, '(   ) INCLUSAO    /   /   ');
    relCred.imp(vLinha, 33, '( X ) EXCLUSAO ' + datetostr(date));
  end;
  relCred.Imp(vLinha, 80, '|');
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, vDadosIni.Replicate('-', 80));
  vLinha := vLinha + 1;
  relCred.imp(vLinha, 1, 'NOME....: ' + vCl.dataSet.FieldByName('NOME_CLIENTE').AsString);

  relCred.imp(vLinha, 48, 'D.NASC.: ' + vCl.dataSet.FieldByName('DATA_NASC').AsString);
  relCred.impF(vLinha, 68, 'Fone: ' + vCl.dataSet.FieldByName('FONE_CLIENTE').AsString, [comp17]);
  vLinha := vLinha + 2;
  relCred.imp(vLinha, 1, 'ENDERECO: ' + vCl.dataSet.FieldByName('ENDERECO').AsString);
  relCred.imp(vLinha, 45, 'BAIRRO: ' + copy(vCl.dataSet.FieldByName('BAIRRO').AsString, 1, 12));
  relCred.imp(vLinha, 66, 'CEP: ' + vCl.dataSet.FieldByName('CEP').AsString);
  vLinha := vLinha + 1;
  relCred.imp(vLinha, 1, 'FILIACAO: ');
  relCred.impF(vLinha, 12, vCl.dataSet.FieldByName('PAI').AsString + ' / ' +
    vCl.dataSet.FieldByName('MAE').AsString, [comp17]);
  vLinha := vLinha + 1;
  relCred.imp(vLinha, 1, 'CPF.....: ' + vCl.dataSet.FieldByName('CPFCGC').AsString);
  relCred.imp(vLinha, 27, 'C.I: ' + vCl.dataSet.FieldByName('RG').AsString);
  relCred.imp(vLinha, 53, 'CTPS: ' + vCl.dataSet.FieldByName('CTPS').AsString);
  vLinha := vLinha + 1;
  relCred.imp(vLinha, 1, 'CIDADE..: ' + Copy(vCl.dataSet.FieldByName('CIDADE').AsString, 1, 15));
  relCred.impF(vLinha, 27, '(X)COMPRADOR / ( )FIADOR  (X)P.FISICA / ( )P.JURIDICA ', [comp17]);
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, vDadosIni.Replicate('-', 80));
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, '|');
  relCred.Imp(vLinha, 2, 'DATA VENC.');
  relCred.Imp(vLinha, 12, '|');
  relCred.Imp(vLinha, 14, 'VALOR DEBITO');
  relCred.Imp(vLinha, 27, '|');
  relCred.Imp(vLinha, 29, 'CONTA/CARNE');
  relCred.Imp(vLinha, 41, '|');
  relCred.Imp(vLinha, 43, 'Nº CHEQUE');
  relCred.Imp(vLinha, 53, '|');
  relCred.Imp(vLinha, 54, 'ALINEA');
  relCred.Imp(vLinha, 60, '|');
  relCred.Imp(vLinha, 62, 'BANCO');
  relCred.Imp(vLinha, 68, '|');
  relCred.Imp(vLinha, 70, 'AGENCIA');
  relCred.Imp(vLinha, 80, '|');
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, '|');
  relCred.Imp(vLinha, 2, dadosCDL.dataVencimento);
  relCred.Imp(vLinha, 12, '|');
  // aqui tem que ser o valor da venda
  relCred.Imp(vLinha, 14, format('%n', [dadosCDL.valorSPC]));
  relCred.Imp(vLinha, 27, '|');
  relCred.Imp(vLinha, 29, dadosCDL.NumDocumento);
  // Gambiarra
  relCred.Imp(vLinha, 41, '|');
  relCred.Imp(vLinha, 43, dadosCDL.NumCheque);
  relCred.Imp(vLinha, 53, '|');
  relCred.Imp(vLinha, 60, '|');
  relCred.Imp(vLinha, 62, dadosCDL.NumBanco);
  relCred.Imp(vLinha, 68, '|');
  relCred.Imp(vLinha, 70, dadosCDL.Agencia);
  relCred.Imp(vLinha, 80, '|');
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, vDadosIni.Replicate('-', 80));
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, '|');
  relCred.ImpF(vLinha, 29, 'A R T 14o.', [comp17]);
  relCred.Imp(vLinha, 49, '|');
  relCred.Imp(vLinha, 80, '|');
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, '|');
  relCred.Imp(vLinha, 49, '|');
  relCred.Imp(vLinha, 80, '|');
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, '|');
  relCred.ImpF(vLinha, 2,
    'AS USUARIAS DA RIPC ASSUMEM, PERANTE A RIPC E TERCEIROS, A RESPONSABILIDADE', [comp17]);
  relCred.Imp(vLinha, 49, '|');
  relCred.Imp(vLinha, 80, '|');
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, '|');
  relCred.ImpF(vLinha, 2,
    'TOTAL PELOS SEUS REGISTROS, DEMAIS OCORRENCIAS E RESPECTIVOS CANCELAMENTOS.', [comp17]);
  relCred.Imp(vLinha, 49, '|');
  relCred.Imp(vLinha, 80, '|');
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, '|');
  relCred.Impf(vLinha, 2, vDadosIni.Replicate('-', 82), [comp17]);
  relCred.Imp(vLinha, 49, '|');
  relCred.Imp(vLinha, 80, '|');
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, '|');
  relCred.ImpF(vLinha, 2,
    'FICA DECLARADO QUE O SPCBRASIL E'' RESPONSAVEL PELO ENVIO AO CLIENTE DE COMUNI-', [comp17]);
  relCred.Imp(vLinha, 49, '|');
  relCred.Imp(vLinha, 80, '|');
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, '|');
  relCred.ImpF(vLinha, 2, 'CACAO DE INCLUSAO DE REGISTRO.', [comp17]);
  relCred.Imp(vLinha, 49, '|');
  relCred.ImpF(vLinha, 55, 'Carimbo e Assinatura da Empresa', [comp17]);
  relCred.Imp(vLinha, 80, '|');
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, vDadosIni.Replicate('-', 80));
  dadosCDL.NumDocumento := '';
  dadosCDL.NumCheque := '';
  dadosCDL.NumBanco := '';
  dadosCDL.Agencia := '';

  relCred.Fechar;

end;

procedure TContasAReceber._imprimirRecibo;
var
  relRec: TRDprint;
  vLinha: Integer;
  I: Integer;
begin

{$REGION 'TContasAReceber._imprimirRecibo'}

{$REGION 'configurando rdprint'}

  vLinha := 0;

  relRec := TRDprint.Create(Application);

  relRec.OpcoesPreview.CaptionPreview := 'Recibo';
  relRec.TitulodoRelatorio := relRec.OpcoesPreview.CaptionPreview;
  vDadosIni._LimparVarSendEmail;
  relRec.OnSendMail := vDadosini._SendMailRdPrint;

  relRec.CaptionSetup := 'Opções de Impressão';
  if not vDadosIni.ModImp(relRec) then
    exit;

  relRec.OpcoesPreview.Remalina := True;
  relRec.TamanhoQteColunas := 80;
  relRec.TamanhoQteLinhas := strtoint(vDadosIni.vLinhasRecibo);
  relRec.FonteTamanhoPadrao := S10cpp;
  relRec.OpcoesPreview.Preview := True;

  relRec.Abrir;

{$ENDREGION}

  try

{$REGION 'montando recibo'}

    vLinha := vLinha + 1;

    relRec.Imp(vlinha, 1, vDadosIni.Replicate('_', 75));
    vlinha := vlinha + 1;

    if dadosRecibo.qtde > 1 then
      relRec.ImpC(vlinha, 40, 'RECIBO : ' + dadosRecibo.docDoRecibo, [normal])
    else
      relRec.ImpC(vlinha, 40, 'RECIBO : ' + copy(dadosRecibo.docDoRecibo, 1,
        length(dadosRecibo.docDoRecibo) - 2), [normal]);
    vlinha := vlinha + 1;
    relRec.ImpC(vlinha, 40, 'CLIENTE: ' + vDadosIni.StrZero(dadosRecibo.codClienteDoRecibo, 6),
      [normal]);
    vlinha := vlinha + 1;
    relRec.Imp(vlinha, 10, 'Recebemos de: ' + copy(dadosRecibo.nomeClienteRecibo, 1, 27) +
      ' a  quantia supra de ' + format('%m', [dadosRecibo.valorRecibo]));
    vlinha := vlinha + 1;

    if length(vDadosIni.Extenso(dadosRecibo.valorRecibo)) < 70 then
    begin
      relRec.imp(vlinha, 1, vDadosIni.Extenso(dadosRecibo.valorRecibo) +
        vDadosIni.Replicate('*', 70 - length(vDadosIni.Extenso(dadosRecibo.valorRecibo))));
      vlinha := vlinha + 1;
      relRec.imp(vlinha, 1, vDadosIni.Replicate('*', 70));
      vlinha := vlinha + 1;
    end
    else
    begin
      relRec.imp(vlinha, 1, copy(vDadosIni.Extenso(dadosRecibo.valorRecibo), 1, 70));
      vlinha := vlinha + 1;
      relRec.imp(vlinha, 1,
        copy(vDadosIni.Extenso(dadosRecibo.valorRecibo), 71,
        length(vDadosIni.Extenso(dadosRecibo.valorRecibo)) - 70) +
        vDadosIni.Replicate('*', 70 - (length(vDadosIni.Extenso(dadosRecibo.valorRecibo)) - 70)));
      vlinha := vlinha + 1;
    end;

    if dadosRecibo.qtde > 1 then
    begin
      relRec.Imp(vlinha, 1, 'Referente as notas promissorias: ');// + copy(dadosRecibo.docDoRecibo, 1, length(dadosRecibo.docDoRecibo) - 2));
      vlinha := vlinha + 1;
      for I := 0 to dadosRecibo.docDoReciboL.Count - 1 do
      begin
        relRec.Imp(vlinha, 1, dadosRecibo.docDoReciboL[I]);
        vlinha := vlinha + 1;
      end;

      relRec.Imp(vlinha, 1, 'Com respectivos Vencimentos em: ');// + copy(dadosRecibo.dataVencRecibos, 1, length(dadosRecibo.dataVencRecibos) - 2));
      vlinha := vlinha + 1;
      for I := 0 to dadosRecibo.dataVencRecibosL.Count - 1 do
      begin
        relRec.Imp(vlinha, 1, dadosRecibo.dataVencRecibosL[I]);
        vlinha := vlinha + 1;
      end;

    end
    else
    begin
      relRec.Imp(vlinha, 1, 'Referente a nota promissoria: ' + dadosRecibo.docDoRecibo +
        ' Com Vencimento em: ' + dadosRecibo.dataVencRecibos);
      vlinha := vlinha + 1;
    end;

    vlinha := vlinha + 1;
    relRec.Imp(vlinha, 30, trim(vDadosIni.vEmp.vCidade) + ', ' + datetostr(date));
    vlinha := vlinha + 3;
    relRec.Imp(vlinha, 30, vDadosIni.Replicate('_', length(vDadosIni.vEmp.vnomeEmpresa)));
    vlinha := vlinha + 1;
    relRec.Imp(vlinha, 30, vDadosIni.vEmp.vnomeEmpresa);
    vlinha := vlinha + 2;
    relRec.Imp(vlinha, 1, vDadosIni.Replicate('_', 75));
    vlinha := vlinha + 1;
    relRec.ImpC(vlinha, 40, vDadosIni.vEmp.vEndereco + ', ' + vDadosIni.vEmp.vBairro + ' CEP: ' +
      vDadosIni.vEmp.vCEP, [normal]);
    vlinha := vlinha + 1;
    relRec.ImpC(vlinha, 40, vDadosIni.vEmp.vCidade + ' - ' + vDadosIni.vEmp.vSiglaUF, [normal]);
    vlinha := vlinha + 1;
    relRec.ImpC(vlinha, 40, 'Inscr. Estadual: ' + vDadosIni.vEmp.vIE + ' - CNPJ: ' +
      vDadosIni.vEmp.vCNPJ, [normal]);
    vlinha := vlinha + 1;
    relRec.Imp(vlinha, 1, vDadosIni.Replicate('_', 75));

{$ENDREGION}

  finally
    relRec.Fechar;
    dadosRecibo.qtde := 0;
    dadosRecibo.codClienteDoRecibo := 0;
    dadosRecibo.docDoRecibo := '';
    dadosRecibo.nomeClienteRecibo := '';
    dadosRecibo.dataVencRecibos := '';
    dadosRecibo.valorRecibo := 0;
    dadosRecibo.docDoReciboL.Clear;
    dadosRecibo.dataVencRecibosL.Clear;
  end;

{$ENDREGION}

end;

procedure TContasAReceber._marcaDesmarcaLinha;
begin
  if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('sel').AsString = 'S' then
    dataSet.FieldByName('sel').AsString := ''
  else
    dataSet.FieldByName('sel').AsString := 'S';
  dataSet.Post;
end;

procedure TContasAReceber._marcaLinha;
begin
  dataSet.Edit;
  dataSet.FieldByName('sel').AsString := 'S';
  dataSet.Post;
end;

procedure TContasAReceber._marcarBaixaParaDevolucao;
var
  vProcesso: string;
begin

  if FDocs = 'S1' then
    vProcesso := 'CAR021'
  else
    vProcesso := 'CAR022';

  if not vDadosIni.PesqPros(vProcesso, 'ALTERAR', '', FTable, '',
    buscas, True) then
    exit;

  try
  	try
    	dataSet.DisableControls;
      dataSet.first;
      while not dataSet.EOF do
      begin
        if dataSet.FieldByName('sel').AsString = 'S' then
        begin
          if FDocs = 'S1' then
          begin
            if Trim(dataSet.FieldByName('status_ch').AsString) = '' then
              raiseExceptionCreate('Cheque não está quitado!', '');
            FCodigo := dataSet.FieldByName('codigo_ch').AsInteger;
          end
          else
          begin
            if Trim(dataSet.FieldByName('status_c').AsString) = '' then
              raiseExceptionCreate('Documento não está quitado!', '');
            FCodigo := dataSet.FieldByName('cod_cred').AsInteger;
          end;

          if Trim(dataSet.FieldByName('TIP_BAIXA').AsString) = '' then
          begin
            dataSet.Edit;
            dataSet.FieldByName('TIP_BAIXA').AsString := 'D';
            dataSet.Post;

            vDadosIni.GravaAuditoria(vProcesso, 'ALTERAR', 'TIPO ' + FDocs +
              ' CODIGO ' + IntToStr(FCodigo) + ' MARCADO', FTable,
              IntToStr(FCodigo), buscas);
          end
          else
          begin
            if Application.MessageBox('Deseja Retirar Status de Devolução?',
              'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
            begin
              dataSet.Edit;
              dataSet.FieldByName('TIP_BAIXA').AsString := '';
              dataSet.Post;

              vDadosIni.GravaAuditoria(vProcesso, 'ALTERAR', 'TIPO ' + FDocs +
                ' CODIGO ' + IntToStr(FCodigo) + ' DESMARCADO', FTable,
                IntToStr(FCodigo), buscas);
            end;
          end;
        end;
        dataSet.next;
      end;
    finally
      dataSet.EnableControls;
    end;

    if dataSet.ChangeCount = 0 then
      exit;

    Apply;
    CommitaTransacao;

    vDadosIni.GravaAuditoria(vProcesso, 'ALTERAR', 'CONFIRMADA MODIFICACOES', FTable, '', buscas);

  except
    on e: exception do
    begin
      RollBackTransacao;
      dataSet.Refresh;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('procedure TContasAReceber._marcarBaixaParaDevolucao. Erro: ' + e.Message);
    end;
  end;
end;

procedure TContasAReceber._marcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    try
    	dataSet.DisableControls;
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
      dataSet.EnableControls;
    end;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TContasAReceber._mdiAberto(pNomeFormMDI, pMensagem: string): Boolean;
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
        if trim(pMensagem) <> '' then
          Application.MessageBox(PChar(pMensagem), 'Atenção', 64)
        else
          Application.MessageBox('Formulário se encontra aberto!', 'Atenção', 64);
        Exit;
      end;
end;

function TContasAReceber._obterHistoricoCliente: Boolean;
begin

  Result := False;

  if not vDadosIni.PesqPros('CAR016', 'CONSULTA', 'TIPO ' + FDocs +
    ' CLIENTE CODIGO ' + dataSet.FieldByName('cod_cliente').AsString,
    FTable, '', buscas, True) then
    Exit;

  if not SqlOpen('select fp.data_mov,fp.tpdocs,fp.nrequisicao,fp.ndoc,ctr.nome_ctrl,fp.cliente,'+
                 ' fp.historico,fp.valordoc,fp.data_venc,fp.terceiros' +
                 ' from formpagamento fp' +
                 ' inner join controles ctr on ctr.codigo_ctrl = fp.cod_controle and ctr.codigo_emp = fp.cod_empresa' +
                 ' where tpdocs = %s and nrequisicao = %d and fp.cod_empresa = %d',
                 [fstrq('tp_doc_v'), fint('n_doc_v'), fint('cod_emp_mult')]).IsEmpty then
    Result := _abreFormHistoricoCliente;

  buscas.Close;

end;

function TContasAReceber._preenchecheck(vcheck: TchecklistBox): boolean;
begin
  buscas.close;
  buscas.sql.text := 'select * from controles ' +
  	' where codigo_emp = ' + vDadosIni.codEmpresa +
    ' and docs <> ''N'' ';
  buscas.open;
  vcheck.Items.Clear;
  while not buscas.eof do
  begin
    vCheck.Items.Add(buscas.FieldByName('CODIGO_CTRL').AsString + ' - ' +
      buscas.FieldByName('NOME_CTRL').Text);
    buscas.next;
  end;
  buscas.close;
  Result := true;
end;

function TContasAReceber._preencheCombovend(vcombobox: Tcombobox;
  pCodigoUnificada: Integer): boolean;
begin
  buscas.close;
  if vDadosIni.vEmp.vFinanceiroUnificado then
  begin
    if pCodigoUnificada = 0 then  // codigo 0 entao sao todoso os colaboradores de todas as empresas
      Buscas.sql.text := 'SELECT * FROM COLABORADOR WHERE COD_EMPRESA in ' + vDadosIni.vEmp.vCodigoUnificadas + ' AND ATIVO = 1 order by cod_empresa, nome_vendedor'
    else  // se nao apenas colaborador da unificada
      Buscas.sql.text := 'SELECT * FROM COLABORADOR WHERE COD_EMPRESA = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa) + ' AND ATIVO = 1 order by cod_empresa, nome_vendedor'
  end
  else
    Buscas.sql.text := 'SELECT * FROM COLABORADOR WHERE COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND ATIVO = 1 order by cod_empresa, nome_vendedor';
  buscas.Open;
  vcombobox.Items.clear;
  while not buscas.Eof do
  begin
    vcombobox.Items.Add(buscas.FieldByName('NOME_VENDEDOR').AsString +
      vDadosIni.retornoPorCondicao((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodigoUnificada = 0),
        ' EMP: ' + vDadosIni.StrZero(buscas.FieldByName('cod_empresa').AsInteger, 3) +
        ' COL: ' + vDadosIni.StrZero(buscas.FieldByName('cod_vendedor').AsInteger, 3), ''));
    buscas.next;
  end;
  buscas.close;
  Result := true;
end;

procedure TContasAReceber._rdSendMail(Sender: TObject);
var
 pTipo: string;
begin
  try
     pTipo := 'CLIENTESDEVEDORESPORPERIODO';

     Screen.Cursor := crHourGlass;

     if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
        CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas');

     if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
      exit;

     if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp') then
        CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp');

     if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp') then
      exit;

      TRdprint(Sender).gerarPDF(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf');

      vDadosIni.EnvEmail(
      	vDadosIni.getConfSisStr('clientes_devedores_por_periodo_assunto_email', buscas),
      	vDadosIni.getConfSisBlob('clientes_devedores_por_periodo_assunto_email', buscas).Text,
        0,
        cEmail,
        '',
        '',
        cNenhum,
      	vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf');

     DeleteFile(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf'));
  finally
     Screen.Cursor := crDefault;
  end;
end;

function TContasAReceber._receberComControleSelecionado(
  pRecibo: Boolean): Boolean;
var
  vValorRecibos: Currency;
  vCodControleTemp: Integer;
  vDocTmp: string;
begin
  Result  := False;
  vDocTmp := Docs;
  try
    dataSet.BeforePost := _beforePostRecebimento;
    vCodControleTemp := vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger;
    if pRecibo then
    begin
      Result := True;

      if _abreFormRecibos then
        vReceb.vRecibo._informarValorRecibosSelecionados;

      vValorRecibos := vReceb.vRecibo._somaRecibos;

      try
      	dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
          if (dataSet.FieldByName('TIPO').AsString = 'RA') then
          begin
            if (vValorRecibos <= 0) then
              dataSet.Delete
            else
            begin
              dataSet.Edit;
              dataSet.FieldByName('valor_l').AsFloat := vValorRecibos;
              dataSet.Post;
            end;
            vValorRecibos := 0;
            Break;
          end;
          dataSet.Next;
        end;
      finally
        dataSet.EnableControls;
      end;

      if (vValorRecibos > 0) then
        if (inherited Insert) then
        begin
          vDadosIni.definirDiaFinanceiroFechado(buscas);
          vPCont._abrePContasLanc('E');
          vCtrl._abreTodosControlesCAR('N');
          dataSet.FieldByName('codigo_ctrl').AsInteger :=
            vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger;
          dataSet.FieldByName('HISTORICO_L').AsString := 'RECIBOS ANTECIPADOS NUM';

          try
          	vReceb.vRecibo.dataSet.DisableControls;
            vReceb.vRecibo.dataSet.First;
            while not vReceb.vRecibo.dataSet.Eof do
            begin
              if (vReceb.vRecibo.dataSet.FieldByName('selec').AsString = 'S') and
                (vReceb.vRecibo.dataSet.FieldByName('valor_ut').AsFloat > 0) then
                dataSet.FieldByName('HISTORICO_L').AsString :=
                  dataSet.FieldByName('HISTORICO_L').AsString + ' ' +
                  vDadosIni.IfThen(vDadosIni.vRecibo.HabRecPorDepart,
                   vReceb.vRecibo.dataSet.FieldByName('num_rec_dep').AsString,
                   vReceb.vRecibo.dataSet.FieldByName('nrecibo').AsString);
              vReceb.vRecibo.dataSet.Next;
            end;
          finally
            vReceb.vRecibo.dataSet.EnableControls;
          end;

          if vDadosIni.vEmp.vFinanceiroUnificado then
            dataSet.FieldByName('HISTORICO_L').AsString := dataSet.FieldByName('HISTORICO_L').AsString + ' EMP: ' + vDadosIni.StrZero(dadosReceber.codigoUnificada, 3);
          dataSet.FieldByName('HIST').AsString := dataSet.FieldByName('HISTORICO_L').AsString;
          dataSet.FieldByName('TIPO_L').AsString := 'E';
          dataSet.FieldByName('TIP_CNT').AsString := 'N';
          dataSet.FieldByName('data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
          dataSet.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
          dataSet.FieldByName('n_conta_plc').AsFloat := dadosReceber.numContaVendaProd;
          dataSet.FieldByName('valor_l').AsFloat := vValorRecibos;
          dataSet.FieldByName('TIPO').AsString := 'RA';
          dataSet.FieldByName('NOMECTRL').AsString := 'Recibos Antecipados';
          dataSet.Post;
          dadosReceber.numContaTemp := dataSet.FieldByName('n_conta_plc').AsFloat;
        end;

    end
    else if Trim(vCtrl.dataSet.FieldByName('DOCS').AsString) = 'N' then
    begin
      if inherited Insert then
      begin
        vDadosIni.definirDiaFinanceiroFechado(buscas);
        vPCont._abrePContasLanc('E');
        vCtrl._abreTodosControlesCAR('N', vDadosIni.vContrapartida);

        dataSet.FieldByName('codigo_ctrl').AsInteger := vCodControleTemp;
        dataSet.FieldByName('HISTORICO_L').AsString := 'ENTRADA DINHEIRO CONFORME CREDITO ACIMA';
        if vDadosIni.vEmp.vFinanceiroUnificado then
          dataSet.FieldByName('HISTORICO_L').AsString := dataSet.FieldByName('HISTORICO_L').AsString + ' EMP: ' + vDadosIni.StrZero(dadosReceber.codigoUnificada, 3);
        dataSet.FieldByName('TIPO_L').AsString := 'E';
        dataSet.FieldByName('TIP_CNT').AsString := 'N';
        dataSet.FieldByName('data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
        dataSet.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
        dataSet.FieldByName('n_conta_plc').AsFloat := dadosReceber.numContaVendaProd;
        dataSet.FieldByName('TIPO').AsString := 'N';
        if vDadosIni.vContrapartidaCTP then
        	dataSet.FieldByName('COD_CONTRAPARTIDA_CTP').AsInteger := vDadosIni.vCodContrapartidaCTP
        else if vDadosIni.vContrapartida then
	       dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger := vDadosIni.vCodContrapartida;
        if fUsarValorAAtingir then
          dataSet.FieldByName('valor_l').AsFloat := dadosReceber.valorAInformar;
        dadosReceber.numContaTemp := dataSet.FieldByName('n_conta_plc').AsFloat;  
        Result := _abreFormReceberDinheiro;
      end;

    end
    else if Trim(vCtrl.dataSet.FieldByName('DOCS').AsString) = 'S1' then
    begin
//      if vDadosIni.vContrapartida then
        Docs := 'S1';
        
      if not vDadosIni.PesqPros('CAR089', 'HABILITAR',
        vCtrl.dataSet.FieldByName('codigo_ctrl').AsString + ' ' + vCtrl.dataSet.FieldByName('nome_ctrl').AsString,
        FTable, '', buscas, True) then
        Exit;

      if vReceb.vCh.Insert then
      begin
        vPCont._abrePContasLanc('E');

        dataSet.FieldByName('codigo_ctrl').AsInteger := vCodControleTemp;
        dataSet.FieldByName('n_conta_plc').AsFloat := dadosReceber.numContaVendaProd;
        dataSet.FieldByName('TIPO').AsString := 'S1';
        if fUsarValorAAtingir then
          dataSet.FieldByName('valor_ch').AsFloat := dadosReceber.valorAInformar;
        dadosReceber.historicoSaida := 'ENTRADA DE CHEQUE CONFORME CREDITO ACIMA';
        if vDadosIni.vEmp.vFinanceiroUnificado then
          dadosReceber.historicoSaida := dadosReceber.historicoSaida + ' EMP: ' + vDadosIni.StrZero(dadosReceber.codigoUnificada, 3);
        dadosReceber.numContaTemp := dataSet.FieldByName('n_conta_plc').AsFloat;  
        Result := _abreFormReceberCheque;
        if not Result then
          Cancel;
      end;

    end
    else if Trim(conta.vCtrl.dataSet.FieldByName('DOCS').AsString) = 'S2' then
    begin
//      if vDadosIni.vContrapartida then
        Docs := 'S2';

      if not vDadosIni.PesqPros('CAR090', 'HABILITAR',
        vCtrl.dataSet.FieldByName('codigo_ctrl').AsString + ' ' + vCtrl.dataSet.FieldByName('nome_ctrl').AsString,
        FTable, '', buscas, True) then
        Exit;
      if vCtrl.dataSet.FieldByName('taxa_cartao').AsFloat > 0 then
        if not vDadosIni.PesqPros('CAR091', 'HABILITAR',
          vCtrl.dataSet.FieldByName('codigo_ctrl').AsString + ' ' + vCtrl.dataSet.FieldByName('nome_ctrl').AsString,
          FTable, '', buscas, True) then
          Exit;
      if vReceb.vCr.Insert then
      begin
        vPCont._abrePContasLanc('E');

        dataSet.FieldByName('codigo_ctrl').AsInteger := vCodControleTemp;
        dataSet.FieldByName('n_conta_plc').AsFloat := dadosReceber.numContaVendaProd;
        dataSet.FieldByName('TIPO').AsString := 'S2';
        if vCodControleTemp > 0 then
        begin
          SqlOpen(' select codigo_ctrl, codigo_emp, nome_ctrl, tp_plano from controles ' +
            ' where codigo_ctrl = ' + IntToStr(vCodControleTemp) +
            ' and codigo_emp = ' + vDadosIni.codEmpresa);

  		    if not buscas.IsEmpty then
          begin
			    	dataSet.FieldByName('TIPO_DOC_C').AsString := Copy(trim(buscas.FieldByName('NOME_CTRL').AsString), 1, 15);

            if trim(buscas.FieldByName('TP_PLANO').AsString) = 'C' then
            begin
            	vTerminalCartao.montaSelect('select tc.*, ac.descricao_adm from terminal_cartao tc' +
                ' inner join adm_cartao ac on ac.cod_adm = tc.cod_adm and ac.cod_empresa = tc.cod_empresa and ac.ativo = 1' +
                ' where tc.cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
                  IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger), vDadosIni.codEmpresa) +
                ' and tc.ativo = 1');

              if vTerminalCartao.dataSet.RecordCount = 1 then
	              dataSet.FieldByName('cod_terminal_adm').AsString := vTerminalCartao.dataSet.FieldByName('cod_term_adm').AsString;

              vBandeiraCartao.montaSelect(' select bd.* from bandeiras_cartao bd' +
                ' where bd.cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
                  IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger), vDadosIni.codEmpresa) +
                ' and bd.ativo = 1 ');

              if vBandeiraCartao.dataSet.RecordCount = 1 then
								dataSet.FieldByName('cod_bandeira_adm').AsInteger := vBandeiraCartao.dataSet.FieldByName('cod_bandeira').AsInteger;
            end;
          end;
        end;
        if fUsarValorAAtingir then
          dataSet.FieldByName('valor_c').AsFloat := dadosReceber.valorAInformar;
        dadosReceber.historicoSaida := 'ENTRADA CONFORME CREDITO ACIMA';
        if vDadosIni.vEmp.vFinanceiroUnificado then
          dadosReceber.historicoSaida := dadosReceber.historicoSaida + ' EMP: ' + vDadosIni.StrZero(dadosReceber.codigoUnificada, 3);
        dadosReceber.numContaTemp := dataSet.FieldByName('n_conta_plc').AsFloat;  
        Result := _abreFormReceberCredito;
      end;

      {if not Result then
      begin
        Cancel;
        Exit;
      end;

      dataSet.Edit;
      dataSet.FieldByName('VALOR_L').AsFloat := dataSet.FieldByName('valor_c').AsFloat;
      dataSet.FieldByName('NOMECTRL').AsString := vCtrl.dataSet.FieldByName('nome_ctrl').AsString;
      dataSet.FieldByName('HIST').AsString := dataSet.FieldByName('historico_c').AsString;
      dataSet.FieldByName('NDOC_L').AsString := dataSet.FieldByName('n_doc_c').AsString;
      dataSet.FieldByName('VENCIMENTO').AsDateTime := dataSet.FieldByName('data_venc_c').AsDateTime;
      dataSet.FieldByName('HISTORICO_L').AsString := dadosReceber.historicoSaida;
      dataSet.FieldByName('NUMCONTASAIDA').AsFloat := dadosReceber.numContaSCr;
      dataSet.Post;   }
    end;

    if not Result then
      Cancel;

    _somarLancamentoRecebimento;

  finally
  	Docs := vDocTmp;
    dataSet.BeforeOpen := nil;
    vCtrl._abreTodosControlesCAR(vDadosIni.vContrapartida);
  end;

end;

function TContasAReceber._removerLancamentoRecebimento: Boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    exit;
  if Trim(dataSet.FieldByName('tipo').AsString) = 'RA' then
    vReceb.vRecibo._demarcarTodos;
  dataSet.Delete;

  Result := True;

  _somarLancamentoRecebimento;

end;

procedure TContasAReceber._somarLancamentoRecebimento;
begin
  dadosReceber.valorAtingido := 0;
  dadosReceber.valorAInformar := 0;
  dadosReceber.valorDinheiro := 0;
  dadosReceber.valorCheque := 0;
  dadosReceber.valorCredito := 0;
  dadosReceber.valorRecibos := 0;
  try
  	dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dadosReceber.valorAtingido := dadosReceber.valorAtingido +
        dataSet.FieldByName('VALOR_L').AsFloat;
      if Trim(dataSet.FieldByName('TIPO').AsString) = 'N' then
        dadosReceber.valorDinheiro := dadosReceber.valorDinheiro +
          dataSet.FieldByName('VALOR_L').AsFloat
      else if Trim(dataSet.FieldByName('TIPO').AsString) = 'S1' then
        dadosReceber.valorCheque := dadosReceber.valorCheque +
          dataSet.FieldByName('VALOR_L').AsFloat
      else if Trim(dataSet.FieldByName('TIPO').AsString) = 'S2' then
        dadosReceber.valorCredito := dadosReceber.valorCredito +
          dataSet.FieldByName('VALOR_L').AsFloat
      else if Trim(dataSet.FieldByName('TIPO').AsString) = 'RA' then
        dadosReceber.valorRecibos := dadosReceber.valorRecibos +
          dataSet.FieldByName('VALOR_L').AsFloat;
      dataSet.Next;
    end;
  finally
  	dataSet.First;
    dataSet.EnableControls;
  end;

  dadosReceber.valorAInformar :=
    dadosReceber.valorOperacao -
    dadosReceber.valorAtingido;
  if dadosReceber.valorAInformar < 0 then
    dadosReceber.valorAInformar := 0;

end;

procedure TContasAReceber._verificaDataVenda;
var
  vTemp: string;
begin
  vTemp := Trim(_getDataUltimaVenda(
    dataSet.FieldByName('TP_DOC_V').AsString,
    dataSet.FieldByName('N_DOC_V').AsInteger));
  if vTemp <> '' then
    if StrToDate(vTemp) <> StrToDate(dataSet.FieldByName('data_venda').AsString) then
    begin
      if Application.MessageBox(pchar('Data da Venda ' + dataSet.FieldByName('data_venda').AsString
        +
        '  diferente da ultima registrada ' + vTemp +
        ', atualizar?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
        dataSet.FieldByName('data_venda').AsDateTime := StrToDate(vTemp);
    end;
end;

procedure TContasAReceber.abreFormBoletosProtesto;
var
  vFormulario: TForm;
  hdTemp: THandle;
begin
	try
		vFormulario := Funcoes.AbreForm('pkBoletos', 'TfrmBoletosProtesto', hdTemp);
    if vDadosIni.vPesquisa <> 'BOLETOSPROTESTO|NAOABRIR' then
    	vFormulario.ShowModal;
  finally
  	FreeAndNil(vFormulario);
    unLoadPackage(hdTemp);
  end;
end;

procedure TContasAReceber.abreFormNegativarClienteCredVenc(pTipoForm: Integer; pVerificarConf: Boolean);
var
	Config: TConfig_sistema_class;
  vAbrirTelaBarramentoUmaVezPorDia: string;
  vUsarDataAtualDataFinanceiro: string;
  vDataUltimaConsulta: string;
  vDataAtual: TDateTime;
begin
//	if vDadosIni.vEmp.vUsarBarramento = 'S' then
//  begin
//  	if not pVerificarConf then
//  		Application.MessageBox('Barramento automático da empresa habilitado, favor verificar antes de abrir  de continuar.', 'Atenção', MB_ICONWARNING + MB_OK);
//  	Exit;
//  end;

	if dtmContasAReceber = nil then
    dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

	if pVerificarConf then
  begin
  	if trim(vDadosIni.vCliente.Barramento.vAbrirTelaUmaVezPorDia) <> 'S' then
    	Exit;

    try
    	vDataAtual := vDadosIni.getDataBanco(buscas);

      Config := TConfig_sistema_class.getConf('cl_faturamento_conf', buscas, vDadosIni.cod_empresa);

      try
        vDataUltimaConsulta := trim(Config.value1_vc);

        if trim(vDataUltimaConsulta) = '' then
          vDataUltimaConsulta := '01/01/2000';

        StrToDate(vDataUltimaConsulta);
      except
        vDataUltimaConsulta := '01/01/2000';
      end;

      if trim(vDadosIni.vCliente.Barramento.vUsarDataAtualDataFinanceiro) = 'F' then
      begin
        if vDadosIni.diaFFinanceiro + 1 = StrToDate(vDataUltimaConsulta) then
          Exit;

        Config.value1_vc := FormatDateTime('dd/mm/yyyy', vDadosIni.diaFFinanceiro + 1);
      end
      else
      begin
        if vDataAtual = StrToDate(vDataUltimaConsulta) then
          Exit;

        Config.value1_vc := FormatDateTime('dd/mm/yyyy', vDataAtual);
      end;

      Config.SaveConfDB(buscas);

      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;
    finally
    	if Assigned(Config) then
      	FreeAndNil(Config);
    end;
  end;

	try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Negativar / Desnegativar Cliente');

    if vDadosIni.vCliente.Barramento.vCodigoBarrado = 0 then
    begin
      Application.MessageBox(
        'Campo "CodigoBarrado" deve ser informado na engrenagem do cadastro do cliente "cl_faturamento_conf"',
        'Atenção', 0 + 64);
      Exit;
    end;

    if vDadosIni.vCliente.Barramento.vCodigoDesbarrado = 0 then
    begin
      Application.MessageBox(
        'Campo "CodigoDesbarrado" deve ser informado na engrenagem do cadastro do cliente "cl_faturamento_conf"',
        'Atenção', 0 + 64);
      Exit;
    end;

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('CLI275', 'ABRIR', '', 'CLIENTES', '',
      dtmContasAReceber.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmNegativarDesnegativarCl = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmNegativarDesnegativarCl, frmNegativarDesnegativarCl);
    end;

    frmNegativarDesnegativarCl.Tag := vDadosIni.IfThen((pVerificarConf) and (pTipoForm > 0), 99, 0);

    if (pTipoForm > 0) and (not frmNegativarDesnegativarCl.Visible) then
      frmNegativarDesnegativarCl.ShowModal
    else if (not frmNegativarDesnegativarCl.Visible) then
      frmNegativarDesnegativarCl.Show
    else if frmNegativarDesnegativarCl.FormStyle = fsMDIChild then
      frmNegativarDesnegativarCl.Show
    else
      frmNegativarDesnegativarCl.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TContasAReceber.abreFormRecibo: boolean;
var
  hdTemp: THandle;
  formulario: TForm;
begin
   formulario := Funcoes.AbreForm('pkRecibo','TFrmCadRecibo', hdTemp);
  try
//    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

procedure TContasAReceber.cabrelDev(vrdp: TRdprint; vcomvend: boolean; pCodigoUnificada: Integer);
begin
  vpag := vpag + 1;
  vrdp.Impf(linha, 1, vDadosIni.vEmp.vnomeEmpresa, [normal]);
  linha := linha + 1;
  vrdp.Impf(linha, 1, 'RELATORIO DE CONTROLE DE CREDITOS VENCIDOS' +
    vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
    	' EMP: ' + vDadosIni.IfThen(pCodigoUnificada > 0, IntToStr(pCodigoUnificada),	vDadosIni.vEmp.vCodigoUnificadas), ''), [normal]);
  linha := linha + 1;
  vrdp.Impf(linha, 1, 'DE ' + DateToStr(vdata1) + ' A ' + DateToStr(vdata2), [normal]);
  linha := linha + 2;
  vrdp.Impf(linha, 1, datetostr(date), [normal]);
  vrdp.Impf(linha, 115, 'Pag: ' + inttostr(vpag), [normal]);
  linha := linha + 1;
  vrdp.Imp(linha, 1, vdadosini.replicate('=', 132));
  linha := linha + 1;
  vrdp.Imp(linha, 1, 'NOME REF');
  vrdp.Imp(linha, 26, 'ENDERECO');
  vrdp.Imp(linha, 78, 'BAIRRO');
  vrdp.Imp(linha, 115, 'CIDADE');
  linha := linha + 1;
  vrdp.Imp(linha, 1, 'FONE');
  vrdp.Imp(linha, 26, 'COD. CLIENTE');
  // vrdp.Imp(linha,26,'HISTORICO');
  vrdp.Imp(linha, 60, 'DATA VEN.');
  vrdp.Imp(linha, 80, 'VALOR');
  vrdp.Imp(linha, 95, 'VALOR CORR.');
  vrdp.Imp(linha, 107, 'CONTROLE');
  linha := linha + 1;
  vrdp.Imp(linha, 1, vdadosini.replicate('=', 132));
  linha := linha + 1;
end;

procedure TContasAReceber.cadContasAReceber(TipoForm: integer; pDocs: string);
var
  vTable: string;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Contas a Receber');

    if dtmContasAReceber = nil then
      dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

    if TipoForm = 1 then
    begin
      if not vDadosIni.PesqPros('CAR057', 'EMITIR', '', 'CONTROLE_CREDITOS', '',
        dtmContasAReceber.qrBuscas, True) then
        Exit;
      Application.CreateForm(TFrmPRelClDev, FrmPRelClDev);
      vDadosIni.fechaStatusProcessamento;
      FrmPRelClDev.ShowModal;
    end;
    if TipoForm = 2 then
    begin
      if not vDadosIni.PesqPros('CAR059', 'EMITIR', '', 'CONTROLE_CREDITOS', '',
        dtmContasAReceber.qrBuscas, True) then
        Exit;
      Application.CreateForm(TFrmPNivelEndiv, FrmPNivelEndiv);
      vDadosIni.fechaStatusProcessamento;
      FrmPNivelEndiv.ShowModal;
    end;

    vDadosIni.vPesquisa := pDocs;
    if ((TipoForm = 3) and (pDocs = 'S2'))
      or ((TipoForm = 4) and (pDocs = 'S1')) then
    begin
      if frmCadContasAReceber = nil then
      begin
        if pDocs = 'S1' then
          vTable := 'CONTROLE_CHEQUE'
        else
          vTable := 'CONTROLE_CREDITOS';

        if pDocs = 'S1' then
          if not vDadosIni.PesqPros('CAR001', 'CONSULTA', '', vTable, '', dtmContasAReceber.qrBuscas,
            True) then
            Exit;

        if pDocs = 'S2' then
          if not vDadosIni.PesqPros('CAR002', 'CONSULTA', '', vTable, '', dtmContasAReceber.qrBuscas,
            True) then
            Exit;

        vDadosIni.vTipoForm := TipoForm;

        if TipoForm > 0 then
          vDadosIni.vModalOuChild := 'M';

        Application.CreateForm(TfrmCadContasAReceber, frmCadContasAReceber);
      end
      else
        vDadosIni.fechaStatusProcessamento;

      if (TipoForm > 0) and (not frmCadContasAReceber.Visible) then
        frmCadContasAReceber.ShowModal
      else if (not frmCadContasAReceber.Visible) then
        frmCadContasAReceber.Show
      else if frmCadContasAReceber.FormStyle = fsMDIChild then
        frmCadContasAReceber.Show
      else
        frmCadContasAReceber.ShowModal;
    end;
    if TipoForm = 0 then
    begin
      if frmCadContasAReceber = nil then
      begin

        if pDocs = 'S1' then
          vTable := 'CONTROLE_CHEQUE'
        else
          vTable := 'CONTROLE_CREDITOS';

        if pDocs = 'S1' then
          if not vDadosIni.PesqPros('CAR001', 'CONSULTA', '', vTable, '', dtmContasAReceber.qrBuscas,
            True) then
            Exit;

        if pDocs = 'S2' then
          if not vDadosIni.PesqPros('CAR002', 'CONSULTA', '', vTable, '', dtmContasAReceber.qrBuscas,
            True) then
            Exit;

        vDadosIni.vTipoForm := TipoForm;

        if TipoForm > 0 then
          vDadosIni.vModalOuChild := 'M';

        vDadosIni.vPesquisa := pDocs;
        Application.CreateForm(TfrmCadContasAReceber, frmCadContasAReceber);
      end
      else
        vDadosIni.fechaStatusProcessamento;

      if (TipoForm > 0) and (not frmCadContasAReceber.Visible) then
        frmCadContasAReceber.ShowModal
      else if (not frmCadContasAReceber.Visible) then
        frmCadContasAReceber.Show
      else if frmCadContasAReceber.FormStyle = fsMDIChild then
        frmCadContasAReceber.Show
      else
        frmCadContasAReceber.ShowModal;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TControleCredito }

function TControleCredito._altervalorcorrigido: Boolean;
var
  vMensagem: string;
  vPercApurado: Real;
  vOK: Boolean;
  vSumDescPrest: Double;
  vvalorcorr: string;
begin
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CAR096', 'ALTERAR', '', FTable, '', FBuscas2, True) then
    Exit;

  try

    FValorCorrigido := 0;
    if _documentoRecebidoOuSendoRecebido then
      raiseExceptionCreate('Alteração do valor corrigido não foi realizada, favor verificar', '');

    fRemoverDesconto := True;
    _corrigirValor(False, False);

    vvalorcorr := FloatToStr(dataSet.FieldByName('VALOR_CORR').AsFloat);
    if not InputQuery('Atenção', ' Informe o novo valor corrigido do crédito.', vvalorcorr) then
      exit;

    try
      StrToFloat(vvalorcorr);
    except
      raiseExceptionCreate('Valor informado do crédito não inválido', '');
    end;

    if StrToFloat(vvalorcorr) <= 0 then
      raiseExceptionCreate('Valor corrigido do crédito não informado', '');

    FValorOperacao := dataSet.FieldByName('VALOR_CORR').AsFloat;
    FValorCorrigido := StrToFloat(vvalorcorr);

    if FValorOperacao > FValorCorrigido then
    begin
      if not vDadosIni.PesqPros('CAR039', 'DESCONTO', '', FTable,
      dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), FBuscas2, True) then
        Exit;
    end
    else
    begin
      if not vDadosIni.PesqPros('CAR096', 'ACRESCIMO', '', FTable,
      dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), FBuscas2, True) then
        Exit;
    end;

    if FValorOperacao > FValorCorrigido then
    begin
      FDescontoValor := FValorOperacao - FValorCorrigido;
      vPercApurado := vDadosIni.StrToFloatFormat((((FValorOperacao - FValorCorrigido) * 100) / FValorOperacao), 2);

      vMensagem := 'Percentual máximo de desconto permitido = ' +
        FloatToStr(vDadosIni.vEmp.vMaxDescontoParcela) + '%' + #13 +
        'Percentual apurado de desconto = ' + formatfloat('0.00', vPercApurado) + '%' + #13 +
        'Valor da Prestação = R$' + formatfloat('0.00', FValorOperacao) + #13 +
        'Valor do desconto = R$' + formatfloat('0.00', (FValorOperacao - FValorCorrigido)) + #13 +
        'Valor da Prestação com desconto = R$' + formatfloat('0.00', FValorCorrigido) + #13 + #13 +
        'Deseja permitir este desconto?';

      vOK := Application.MessageBox(pchar(vMensagem), 'Confirmar Desconto?', MB_ICONQUESTION +
        MB_YESNO) = IDYES;

      if (not vOK) then
        exit;
      if (not _descontoPermitido) then
        if not vDadosIni.PesqPros('CAR062', 'PERMITIR', 'N.DOC: ' +
          dataSet.fieldbyname('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
          dataSet.fieldbyname('COD_CRED').AsString + '/' + dataSet.fieldbyname('N_DOC_C').AsString,
          Buscas, True) then
          exit;
    end
    else
    begin
      FDescontoValor := FValorCorrigido - FValorOperacao;
      vPercApurado := vDadosIni.StrToFloatFormat((((FValorCorrigido - FValorOperacao) * 100) / FValorOperacao), 2);
    end;

    if (dataSet.FieldByName('VALOR_CORR').AsFloat > 0) and (not _documentoRecebidoOuSendoRecebido) then
    begin
      dataSet.Edit;
      if FValorOperacao > FValorCorrigido then
      begin
        dataSet.FieldByName('VALOR_DESC').AsFloat := FDescontoValor;
        dataSet.FieldByName('VALOR_ACRESC').AsFloat := 0;
        dataSet.FieldByName('VALOR_CORR').AsFloat := FValorCorrigido;
      end
      else
      begin
        dataSet.FieldByName('VALOR_DESC').AsFloat := 0;
        dataSet.FieldByName('VALOR_ACRESC').AsFloat := FDescontoValor;
        dataSet.FieldByName('VALOR_CORR').AsFloat := FValorCorrigido;
      end;

      if dataSet.FieldByName('VALOR_CORR').AsFloat <= 0 then
        raiseExceptionCreate('Valor corrigido menor ou igual a zero, Operação não permitida', '')
      else if (FValorOperacao > FValorCorrigido) // É Desconto
       and (FValorCorrigido < dataSet.FieldByName('VALOR_C').AsFloat) then
      begin
        Application.MessageBox(pchar('Valor corrigido menor que valor da Parcela.'),
          'Atenção', MB_ICONEXCLAMATION + MB_OK);
        if not vDadosIni.PesqPros('CAR039', 'DESCONTO', 'N.DOC ' +
          Trim(dataSet.FieldByName('N_DOC_C').AsString) +
          ' VALOR_CORR ' + dataSet.FieldByName('VALOR_CORR').AsString +
          ' MENOR QUE VALOR_C ' + dataSet.FieldByName('VALOR_C').AsString, FTable,
          dataSet.FieldByName('cod_cred').AsString + '/' +
          Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas, True) then
        begin
          //vDadosIni.GravaAuditoria('CAR039', 'DESCONTO', 'NAO PERMITIDO N.DOC ' + Trim(dataSet.FieldByName('N_DOC_C').AsString) + ' DESCONTO ' + dataSet.FieldByName('VALOR_DESC').AsString + ' LIQUIDO ' + dataSet.FieldByName('VALOR_CORR').AsString, FTable, dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas);
          raiseExceptionCreate('Valor corrigido menor que valor da Parcela, Operação não permitida para este Caixa', '');
        end;
      end;

      dataSet.Post;
    end;

    if dataSet.ChangeCount > 0 then
    begin
      if Apply then
      begin
        CommitaTransacao;
        if FValorOperacao > FValorCorrigido then
          vDadosIni.GravaAuditoria('CAR039', 'DESCONTO', 'SUCESSO', FTable,
            dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas)
        else
          vDadosIni.GravaAuditoria('CAR096', 'ACRESCIMO', 'SUCESSO', FTable,
            dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas);
        vDadosIni.GravaAuditoria('CAR096', 'ALTERAR', 'SUCESSO', FTable,
          dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas);
      end;
    end;
  except on E: Exception do
    begin
      dataSet.Cancel;
      dataSet.CancelUpdates;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TControleCredito._altervalorcorrigido. Erro: ' + e.Message);
      verificaErroDataSetOpen(E.Message);
    end;
  end;
end;

function TControleCredito._atualizarValorLiq: boolean;
var
	vPointer: Pointer;
  vNovoValorLiquido: Double;
  vSomenteSelecionado: Boolean;
begin
	try
    Result := false;
    if dataSet.IsEmpty then
      Exit;

    if not vDadosIni.PesqPros('CAR106', 'ALTERAR', '', FTable, '', FBuscas2, True) then
      Exit;

    vSomenteSelecionado := false;
    if (dataSet.Filtered) and (Pos('SEL = ''S''', dataSet.Filter) > 0) then
      vSomenteSelecionado := true
    else
      vSomenteSelecionado := Application.MessageBox('Somente créditos selecionados', 'Confirmação',
        MB_ICONQUESTION + MB_YESNO) = IDYES;

    try
    	vPointer := dataSet.GetBookmark;
    	dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if (dataSet.FieldByName('SEL').AsString = 'S') or (not vSomenteSelecionado) then
        begin
          SqlOpen(' select tp_plano, taxa_cartao, cartao_sped from controles' +
            ' where codigo_ctrl = ' + IntToStr(dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
            ' and tp_plano = ''C'' ' +
            ' and codigo_emp = ' + vDadosIni.codEmpresa, buscas2);

          if not buscas2.IsEmpty then
          begin
            if (vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_C').AsFloat, 2) > 0) then
            begin
              if (_documentoRecebidoOuSendoRecebido) then
              begin
                _desmarcaLinha;
                Application.MessageBox(pchar('Atualização do valor líquido para este documento não será efetuada.'),
                  'Atenção', 0 + 64);
              end
              else
              begin
                dataSet.Edit;
                dataSet.FieldByName('VALOR_LIQUIDO').AsFloat := dataSet.FieldByName('VALOR_C').AsFloat;

                vDadosIni.CalcularTaxaCartao(buscas2,
                  vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, dataSet.FieldByName('COD_EMP_MULT').AsInteger, 0),
                   dataSet.FieldByName('N_DOC_V').AsInteger,
                   dataSet.FieldByName('TP_DOC_V').AsString,
                   dataSet.FieldByName('CODIGO_CTRL').AsInteger,
                   '',
                   dataSet.FieldByName('COD_TERMINAL_ADM').AsString,
                   dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger,
                   dataSet.FieldByName('DEB_CRED').AsString,
                   dataSet.FieldByName('QTDE_PARC').AsInteger,
                   dataSet.FieldByName('VALOR_LIQUIDO').AsFloat,
                   dataSet.FieldByName('VALOR_C').AsFloat,
                   0,
                   true,
                   vNovoValorLiquido);
                 dataSet.FieldByName('VALOR_LIQUIDO').AsFloat := vNovoValorLiquido;

                 dataSet.Post;
              end;
            end;
          end;
        end;

        dataSet.Next;
      end;
    finally
    	dataSet.First;
      dataSet.GotoBookmark(vPointer);
      dataSet.EnableControls;
    end;

    if dataSet.ChangeCount = 0 then
    begin
      Result := False;
      vDadosIni.GravaAuditoria('CAR106', 'ALTERAR', 'SEM REGISTROS MODIFICADOS', FTable, '', buscas);
    end
    else if Apply then
    begin
      CommitaTransacao;
      Result := True;
      vDadosIni.GravaAuditoria('CAR106', 'ALTERAR', 'SUCESSO MODIFICACOES', FTable, '', buscas);
    end
    else
    begin
      RollBackTransacao;
      Result := False;
      vDadosIni.GravaAuditoria('CAR106', 'ALTERAR', 'FALHA MODIFICACOES', FTable, '', buscas);
    end;
  except on E: Exception do
    begin
      dataSet.Cancel;
      dataSet.CancelUpdates;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TControleCredito._atualizarValorLiq. Erro: ' + e.Message);
      verificaErroDataSetOpen(E.Message);
    end;
  end;
end;

function TControleCredito._baixaCreditosConciliacaoCartao(
  pLote: Integer; pCartaoCDS: TClientDataSet; pLancarTarifa, pLancarAjuste,
  pLancarComissao: Boolean; pCodigoUnificada: Integer): Boolean;
var
  vSomaTarifa, vSomaComissao, vSomaEntrada: Extended;
  vLista: TStringList;
  vContaRecebendo: Boolean;
  vHistoricoAjuste: string;
  I, Z: Integer;
  _dataSetTmp: TClientDataSet;
  vHistPadraoUnificadas: string;
  vTemp: string;
begin

  Result := False;

  if not vDadosIni.VerificarinicioFechFinan(conta.buscas) then
    exit;

  try

    //criando objetos necessários para o recebimento e setando variaveis
    if vReceb = nil then
      vReceb := TRecebimento.create;
    _definirDataSetRecebimento;
    fRecebimento.EmptyDataSet;
    vDadosIni.definirDiaFinanceiroFechado(buscas);
    _definirContasDeSaida;
    if vContLigL = nil then
      vContLigL := TContaLigacaoImp.create;

    dadosReceber.valorSaidaCartao := 0;
    dadosReceber.valorEntradaCartao := 0;

    vHistPadraoUnificadas := '';
    if vDadosIni.vEmp.vFinanceiroUnificado then
      vHistPadraoUnificadas := ' EMP: ' + vDadosIni.StrZero(pCodigoUnificada, 3);

    // Percorrento a lista para efetuar o recebimento de acordo
    // Saídas
    buscas.Close;
    buscas.SQL.Text := ' select cc.idbaixa_cartao, cc.codigo_ctrl, ' +
    	' sum(coalesce(cc.valor_c, 0)) valor_c from controle_creditos cc ' +
      ' where cc.idbaixa_cartao = ' + IntToStr(pLote) + ' and cc.status_adm = 1' +
      vDadosIni.retornoPorCondicao((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodigoUnificada > 0),
      	' and cc.cod_emp_mult = ' + IntToStr(pCodigoUnificada), ' and cc.codigo_emp = ' + vDadosIni.codEmpresa) +
      ' group by 1, 2 ';
    buscas.Open;

    buscas.First;
    while not buscas.Eof do
    begin
      fRecebimento.Insert;
      fRecebimento.FieldByName('CODIGO_CTRL').AsInteger := buscas.FieldByName('codigo_ctrl').AsInteger;
      fRecebimento.FieldByName('HISTORICO_L').AsString := 'SAIDA CREDITOS CONCILIACAO CARTAO' + vHistPadraoUnificadas;
      fRecebimento.FieldByName('TIPO_L').AsString := 'S';
      fRecebimento.FieldByName('TIP_CNT').AsString := 'N';
      fRecebimento.FieldByName('data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
      fRecebimento.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
      fRecebimento.FieldByName('N_CONTA_PLC').AsFloat := dadosReceber.numContaSCr;
      fRecebimento.FieldByName('TIPO').AsString := 'N';
      fRecebimento.FieldByName('VALOR_L').AsFloat := buscas.FieldByName('valor_c').AsFloat;
      fRecebimento.FieldByName('SAIDA_PROC_AUTO').AsString := 'S';
      fRecebimento.Post;

      dadosReceber.valorSaidaCartao := dadosReceber.valorSaidaCartao + buscas.FieldByName('valor_c').AsFloat;

      buscas.Next;
    end;

    //Entradas
    buscas.Close;
    buscas.SQL.Text := ' select cc.idbaixa_cartao, cc.codigo_ctrl_cred, c.codigo_ctrl, ' +
      ' sum(coalesce(cc.valor_c, 0)) valor_c from controle_creditos cc' +
      ' left join controles c on c.codigo_ctrl = cc.codigo_ctrl_cred and c.codigo_emp = cc.codigo_emp ' +
      ' where cc.idbaixa_cartao = ' + IntToStr(pLote) + ' and cc.status_adm = 1 ' +
      vDadosIni.retornoPorCondicao((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodigoUnificada > 0),
	      ' and cc.cod_emp_mult = ' + IntToStr(pCodigoUnificada), ' and cc.codigo_emp = ' + vDadosIni.codEmpresa) +
      ' group by 1, 2, 3 ';
    buscas.Open;

    buscas.First;
    while not buscas.Eof do
    begin

      if buscas.FieldByName('codigo_ctrl').AsInteger = 0 then
        raiseExceptionCreate('Controle Bancário para crédito não encontrado' + #13 +
          'Preencha os campos de "Agência" e "Número da Conta" no cadastro do Controle Bancário' + #13 +
          'Verifique no processamento de arquivos os dados da conta', '');

      fRecebimento.Insert;
      fRecebimento.FieldByName('CODIGO_CTRL').AsInteger := buscas.FieldByName('codigo_ctrl_cred').AsInteger;
      fRecebimento.FieldByName('HISTORICO_L').AsString := 'ENTRADA CONCILIACAO CARTAO' + vHistPadraoUnificadas;
      fRecebimento.FieldByName('TIPO_L').AsString := 'E';
      fRecebimento.FieldByName('TIP_CNT').AsString := 'N';
      fRecebimento.FieldByName('data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
      fRecebimento.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
      fRecebimento.FieldByName('N_CONTA_PLC').AsFloat := dadosReceber.numContaVendaProd;
      fRecebimento.FieldByName('TIPO').AsString := 'N';
      fRecebimento.FieldByName('VALOR_L').AsFloat := buscas.FieldByName('valor_c').AsFloat;
      fRecebimento.FieldByName('SAIDA_PROC_AUTO').AsString := 'E';
      fRecebimento.Post;

      dadosReceber.valorEntradaCartao := dadosReceber.valorEntradaCartao + buscas.FieldByName('valor_c').AsFloat;

      buscas.Next;
    end;

    //Comissões
    buscas.Close;
    buscas.SQL.Text := ' select cc.idbaixa_cartao, cc.codigo_ctrl_cred, c.n_conta_plc_tx_cartao, c.n_conta_plc_tarifa_cartao,' +
      ' sum(coalesce(cc.taxa_cartao_cred, 0)) taxa_cartao_cred, ' +
      ' sum(coalesce(cc.tarifa_cartao_cred, 0)) tarifa_cartao_cred' +
      ' from controle_creditos cc' +
      ' inner join controles c on c.codigo_ctrl = cc.codigo_ctrl and c.codigo_emp = cc.codigo_emp' +
      ' where cc.idbaixa_cartao = ' + IntToStr(pLote) + ' and cc.status_adm = 1' +
      vDadosIni.retornoPorCondicao((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodigoUnificada > 0),
      	' and cc.cod_emp_mult = ' + IntToStr(pCodigoUnificada), ' and cc.codigo_emp = ' + vDadosIni.codEmpresa) +
      ' group by 1, 2, 3, 4 ';
    buscas.Open;

    buscas.First;
    while not buscas.Eof do
    begin
      if Abs(buscas.FieldByName('taxa_cartao_cred').AsFloat) > 0 then
      begin
        if not vContLigL.vPCont._abrirPContas(buscas.FieldByName('n_conta_plc_tx_cartao').AsFloat) then
          raiseExceptionCreate('Conta de saída para Comissão dos Cartões não encontrada' + #13 +
            'Conta: ' + buscas.FieldByName('n_conta_plc_tx_cartao').AsString, '')
        else if vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString <> 'S' then
          raiseExceptionCreate('Conta de saída para Comissão dos Cartões com tipo diferente de "S" de Saída', '');

        fRecebimento.Insert;
        fRecebimento.FieldByName('CODIGO_CTRL').AsInteger := buscas.FieldByName('codigo_ctrl_cred').AsInteger;
        fRecebimento.FieldByName('HISTORICO_L').AsString := 'COMISSAO CONCILIACAO CARTAO' + vHistPadraoUnificadas;
        fRecebimento.FieldByName('TIPO_L').AsString := 'S';
        fRecebimento.FieldByName('TIP_CNT').AsString := 'N';
        fRecebimento.FieldByName('data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
        fRecebimento.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
        fRecebimento.FieldByName('N_CONTA_PLC').AsFloat := buscas.FieldByName('n_conta_plc_tx_cartao').AsFloat;
        fRecebimento.FieldByName('TIPO').AsString := 'N';
        fRecebimento.FieldByName('VALOR_L').AsFloat := Abs(buscas.FieldByName('taxa_cartao_cred').AsFloat);
        fRecebimento.FieldByName('SAIDA_PROC_AUTO').AsString := 'S';
        fRecebimento.Post;
      end;

      buscas.Next;
    end;

    //Tarifas
    buscas.First;
    while not buscas.Eof do
    begin
      if Abs(buscas.FieldByName('tarifa_cartao_cred').AsFloat) > 0 then
      begin
        if not vContLigL.vPCont._abrirPContas(buscas.FieldByName('n_conta_plc_tarifa_cartao').AsFloat) then
          raiseExceptionCreate('Conta de saída para Tarifas dos Cartões não encontrada' + #13 +
            'Conta: ' + FloatToStr(buscas.FieldByName('n_conta_plc_tarifa_cartao').AsFloat), '')
        else if vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString <> 'S' then
          raiseExceptionCreate('Conta de saída para Tarifas dos Cartões com tipo diferente de "S" de Saída', '');

        fRecebimento.Insert;
        fRecebimento.FieldByName('CODIGO_CTRL').AsInteger := buscas.FieldByName('codigo_ctrl_cred').AsInteger;
        fRecebimento.FieldByName('HISTORICO_L').AsString := 'TARIFAS CONCILIACAO CARTAO' + vHistPadraoUnificadas;
        fRecebimento.FieldByName('TIPO_L').AsString := 'S';
        fRecebimento.FieldByName('TIP_CNT').AsString := 'N';
        fRecebimento.FieldByName('data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
        fRecebimento.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
        fRecebimento.FieldByName('N_CONTA_PLC').AsFloat := buscas.FieldByName('n_conta_plc_tarifa_cartao').AsFloat;
        fRecebimento.FieldByName('TIPO').AsString := 'N';
        fRecebimento.FieldByName('VALOR_L').AsFloat := Abs(buscas.FieldByName('tarifa_cartao_cred').AsFloat);
        fRecebimento.FieldByName('SAIDA_PROC_AUTO').AsString := 'S';
        fRecebimento.Post;
      end;

      buscas.Next;
    end;

    //Ajustes
    pCartaoCDS.Filter := 'STATUS_ADM = 1 and IND_OR_AJUSTE_ADM > 0 and VALORPARCELA > 0';
    pCartaoCDS.Filtered := True;
    try
      pCartaoCDS.First;
      while not pCartaoCDS.Eof do
      begin
        if Abs(pCartaoCDS.FieldByName('VALORPARCELA').AsFloat) > 0 then
        begin
        	if (pCartaoCDS.FieldByName('CONFERE').AsString = 'S') then
          begin
          	vHistoricoAjuste := 'AJUSTES CONFORME ' + UpperCase(Trim(pCartaoCDS.FieldByName('DESCR_OCORRENCIA_CONFERE').AsString)) + vHistPadraoUnificadas;

          	if trim(pCartaoCDS.FieldByName('COD_AJUSTE_COD').AsString) <> '' then
            begin
              buscas.Close;
              buscas.SQL.Text := ' select 0 N_CONTA_PLC_ADM, AJT.N_CONTA_PLC_E as N_CONTA_PLCE_ADM FROM CONCILIACAO_ADQUIRENTE ADQ ' +
              	' INNER JOIN CONCILIACAO_COD_AJUSTE_ADQ AJT_ADQ ON AJT_ADQ.ID_ADQUIRENTE = ADQ.ID ' +
                ' INNER JOIN CONCILIACAO_COD_AJUSTE AJT ON AJT.ID = AJT_ADQ.ID_COD_AJUSTE ' +
                ' WHERE ADQ.ID = ' + IntToStr(pCartaoCDS.FieldByName('ACQUIRER_ID').AsInteger) +
                ' AND AJT_ADQ.CODIGO = ' + QuotedStr(trim(pCartaoCDS.FieldByName('COD_AJUSTE_COD').AsString));
              buscas.Open;
            end
            else if trim(pCartaoCDS.FieldByName('TIPO_LANCAMENTO_COD').AsString) <> '' then
            begin
              buscas.Close;
              buscas.SQL.Text := ' select 0 N_CONTA_PLC_ADM, TLANC.N_CONTA_PLC_E as N_CONTA_PLCE_ADM FROM CONCILIACAO_ADQUIRENTE ADQ ' +
              	' INNER JOIN CONCILIACAO_TIPO_LANC_ADQ TLANC_ADQ ON TLANC_ADQ.ID_AQUIRENTE = ADQ.ID ' +
                ' INNER JOIN CONCILIACAO_TIPO_LANC TLANC ON TLANC.ID = TLANC_ADQ.ID_TIPO_LANC ' +
                ' WHERE ADQ.ID = ' + IntToStr(pCartaoCDS.FieldByName('ACQUIRER_ID').AsInteger) +
                ' AND TLANC_ADQ.CODIGO = ' + QuotedStr(trim(pCartaoCDS.FieldByName('TIPO_LANCAMENTO_COD').AsString));
              buscas.Open;
            end
            else
            begin
              buscas.Close;
              buscas.SQL.Text := ' select 0 N_CONTA_PLC_ADM, N_CONTA_PLC as N_CONTA_PLCE_ADM from CONCILIACAO_DESCR_TIPO ' +
                ' where DESCRICAO = ' + QuotedStr(pCartaoCDS.FieldByName('DESCR_OCORRENCIA_CONFERE').AsString) +
                ' and COD_EMPRESA = ' + vDadosIni.codEmpresa +
                ' and NATUREZA = ''E'' ';
              buscas.Open;
            end;
          end
          else
          begin
          	vHistoricoAjuste := 'AJUSTES CONFORME ' + Trim(pCartaoCDS.FieldByName('IND_OR_DESC_AJUSTE').AsString) + vHistPadraoUnificadas;

            buscas.Close;
            buscas.SQL.Text := ' select N_CONTA_PLC_ADM, N_CONTA_PLCE_ADM from OCORRENCIA_ADM' +
              ' where TIPO_TABELA_ADM = ''TABELAV''' +
              ' and IDTABELA_ADM = ' + IntToStr(pCartaoCDS.FieldByName('IND_OR_AJUSTE_ADM').AsInteger);
            buscas.Open;
          end;

          if not vContLigL.vPCont._abrirPContas(buscas.FieldByName('N_CONTA_PLCE_ADM').AsFloat) then
            raiseExceptionCreate('Conta de Ajuste de Cartões não encontrada' + #13 +
              'Conta: ' + buscas.FieldByName('N_CONTA_PLCE_ADM').AsString, '')
          else if vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString <> 'E' then
            raiseExceptionCreate('Conta de Ajuste de Cartões com tipo diferente de "E" de Entrada', '');
        
          fRecebimento.Insert;
          fRecebimento.FieldByName('CODIGO_CTRL').AsInteger := pCartaoCDS.FieldByName('CODIGO_CTRL').AsInteger;
          fRecebimento.FieldByName('HISTORICO_L').AsString := UpperCase(trim(vHistoricoAjuste));
          fRecebimento.FieldByName('TIPO_L').AsString := 'E';
          fRecebimento.FieldByName('TIP_CNT').AsString := 'N';
          fRecebimento.FieldByName('data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
          fRecebimento.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
          fRecebimento.FieldByName('N_CONTA_PLC').AsFloat := buscas.FieldByName('N_CONTA_PLCE_ADM').AsFloat;
          fRecebimento.FieldByName('TIPO').AsString := 'N';
          fRecebimento.FieldByName('VALOR_L').AsFloat := Abs(pCartaoCDS.FieldByName('VALORPARCELA').AsFloat);
          fRecebimento.FieldByName('SAIDA_PROC_AUTO').AsString := 'E';
          fRecebimento.FieldByName('ARQ_EXTRATO_ADM').AsString := pCartaoCDS.FieldByName('ARQ_EXTRATO_ADM').AsString;
          fRecebimento.FieldByName('DATA_ARQUIVO').AsDateTime := pCartaoCDS.FieldByName('DATA_ARQUIVO').AsDateTime;
          fRecebimento.FieldByName('COD_ADM').AsInteger := pCartaoCDS.FieldByName('COD_ADM').AsInteger;
          if (pCartaoCDS.FieldByName('CONFERE').AsString = 'S') then
          	fRecebimento.FieldByName('ID_FINANC_CONFERE').AsInteger := pCartaoCDS.FieldByName('ID_FINANC_CONFERE').AsInteger;
          fRecebimento.Post;
        end;

        pCartaoCDS.Next;
      end;
    finally
      pCartaoCDS.Filtered := False;
      pCartaoCDS.Filter := '';
    end;

    dataSet.FieldByName('RAZAO').OnGetText := dataSetNomeRazaoGetText;
    dataSet.FieldByName('NOME_C').OnGetText := dataSetNomeRazaoGetText;
    dataSet.FieldByName('CPFCGC').OnGetText := dataSetNomeRazaoGetText;

    vTemp := ' '' '' n_doc_c_temp, '' '' n_doc_v_temp, ';
    if vDadosIni.vRecibo.HabRecPorDepart then
      vTemp := ' case when ((cc.tp_doc_v = ''REC'') and (cc.nparcela > 0)) then ' +
          '     (recibos.num_rec_dep ||''-''||cc.nparcela) ' +
          ' else cc.n_doc_c end n_doc_c_temp, ' +
          ' case when ((cc.tp_doc_v = ''REC'') and (cc.nparcela > 0)) then ' +
          '     recibos.num_rec_dep ' +
          ' else cc.n_doc_v end n_doc_v_temp,';

    montaSelect(' select cc.*, ' + vTemp +
    	' retorna_pag_cr.form_pag, controles.nome_ctrl, empresa.identificacao_emp, ' +
      ' p_contas.desc_plc, grupos_ct.desc_gr, depart_ct.desc_dep, p_contas.cod_cta_contabil, p_contas_contabil.nome_cta, ' +
      ' c.nome_cliente, c.razao razao_cliente, c.cpfcgc cpfcgc_cliente, ' +
      ' c.cep, c.endereco, c.num_end_cliente, c.complemento, ' +
      ' c.fone_cliente, c.fone_celular, c.email, ' +
      ' c.cod_localidade, l.localidade, l.cod_setor, s.setor, ' +
      ' tf.status_f, est.sigla_uf, cid.nome_cidade, bai.nome_bairro from controle_creditos cc ' +
      ' left join empresa on empresa.cod_empresa = cc.cod_emp_mult ' +
      ' left join controles on controles.codigo_ctrl = cc.codigo_ctrl and controles.codigo_emp = cc.cod_emp_mult ' +
      ' left join p_contas on p_contas.n_conta_plc = cc.n_conta_plc ' +
      ' left join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct ' +
      ' left join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep ' +
      ' left join p_contas_contabil on p_contas_contabil.cod_cta = p_contas.cod_cta_contabil and p_contas_contabil.cod_empresa = cc.cod_emp_mult ' +
      ' left join recibos on recibos.nrecibo = cc.n_doc_v and recibos.cod_empresa = cc.codigo_emp and cc.tp_doc_v = ''REC'' ' +
      ' left join clientes c on c.cod_cliente = cc.cod_cliente and c.cod_empresa = cc.cod_emp_mult ' +
      ' left join localidade l on l.cod_localidade = c.cod_localidade and l.cod_empresa = c.cod_empresa ' +
      ' left join setor s on s.cod_setor = l.cod_setor and s.cod_empresa = l.cod_empresa ' +
      ' left join tipo_faturamento tf on tf.codigo_faturamento = c.codigo_faturamento ' +
      ' left join estados est on est.codigo_uf = c.codigo_uf ' +
      ' left join cidades cid on cid.cod_cidade = c.cod_cidade ' +
      ' left join bairros bai on bai.cod_bairro = c.cod_bairro ' +
      ' left join retorna_pag_cr (cc.lote_quit, cc.datq_c, ' + vDadosIni.codEmpresa + ', 0, '''') on 1 = 1 ' +
      ' where cc.idbaixa_cartao = ' + IntToStr(pLote) + ' and cc.status_adm = 1' +
      vDadosIni.retornoPorCondicao((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodigoUnificada > 0),
	      ' and cc.cod_emp_mult = ' + IntToStr(pCodigoUnificada), ' and cc.codigo_emp = ' + vDadosIni.codEmpresa));

    if (dataSet.IsEmpty) and (fRecebimento.IsEmpty) then
    begin
      Result := True;
      Exit;
    end;

    dataSet.IndexName := '';
    try
    	dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        dataSet.Edit;
        dataSet.FieldByName('sel').AsString := 'S';
        dataSet.Post;

        dataSet.Next;
      end;
    finally
      dataSet.EnableControls;
    end;
    IndexFieldNames:= 'SEL';
    dadosReceber.baixaParcial := False;
    dadosReceber.usarValorCorrigido := False;
    dadosReceber.acrescentarNomeHist := False;
    dadosReceber.lancarDesconto := False;
    dadosReceber.lancarJuros := False;
    dadosReceber.lancarTaxaCartao := False;
    dadosReceber.historicoSaidaLancamento := '';
    dadosReceber.historicoSaidaLancamentoIni := '';
    dadosReceber.dataBaixa := vDadosIni.diaFFinanceiro + 1;
    dadosReceber.lancarDesconto := False;
    dadosReceber.lancarJuros := False;
    dadosReceber.loteBaixaAdm := pLote;
    dadosReceber.codigoUnificada := pCodigoUnificada;

    SetLength(dadosReceber.codigosControleLanc, 0);
    SetLength(dadosReceber.historicoLanc, 0);
    SetLength(dadosReceber.valorLancSaida, 0);

    vContaRecebendo := Recebendo;
    Recebendo := True;
    try
      dadosReceber.processamentoAutomatico := True;

      if not fRecebimento.IsEmpty then
        Result := _efetuarRecebimento;

    finally
      Recebendo := vContaRecebendo;
      dadosReceber.processamentoAutomatico := False;
    end;

  except
    on e: exception do begin
      Result := False;
      registraErro('function TControleCredito._baixaCreditosConciliacaoCartao pLote: '+ IntToStr(pLote) + '. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro no processamento de baixa de cartão. Erro: ' + e.Message), 'Anteção', 0 + 64);
    end;
  end;
end;

function TControleCredito._baixaDevCreditosConciliacaoCartao(pLote, pCodigoUnificada: Integer;
  pLancarTarifa, pLancarComissao: Boolean): Boolean;
var
	vContaRecebendo: Boolean;
  vHistPadraoUnificadas: string;
	vTemp: string;
  Z: Integer;
begin

  Result := False;

  if not vDadosIni.VerificarinicioFechFinan(conta.buscas) then
    exit;

  try
  
  	//criando objetos necessários para o recebimento e setando variaveis
    if vReceb = nil then
      vReceb := TRecebimento.create;
    _definirDataSetRecebimento;
    fRecebimento.EmptyDataSet;
    vDadosIni.definirDiaFinanceiroFechado(buscas);
    _definirContasDeSaida;
    if vContLigL = nil then
      vContLigL := TContaLigacaoImp.create;

    dadosReceber.valorSaidaCartao := 0;

    vHistPadraoUnificadas := '';
    if vDadosIni.vEmp.vFinanceiroUnificado then
      vHistPadraoUnificadas := ' EMP: ' + vDadosIni.StrZero(pCodigoUnificada, 3);

		//Comissões
    buscas.Close;
    buscas.SQL.Text := ' select cc.idbaixa_cartao, cc.codigo_ctrl_cred, c.n_conta_plc_tx_cartao, c.n_conta_plc_tarifa_cartao,' +
      ' sum(coalesce(cc.taxa_cartao_cred, 0)) taxa_cartao_cred, ' +
      ' sum(coalesce(cc.tarifa_cartao_cred, 0)) tarifa_cartao_cred' +
      ' from controle_creditos cc' +
      ' inner join controles c on c.codigo_ctrl = cc.codigo_ctrl and c.codigo_emp = cc.codigo_emp' +
      ' where cc.iddev_cartao = ' + IntToStr(pLote) + ' and cc.status_adm = 1' +
      vDadosIni.retornoPorCondicao((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodigoUnificada > 0),
      	' and cc.cod_emp_mult = ' + IntToStr(pCodigoUnificada), ' and cc.codigo_emp = ' + vDadosIni.codEmpresa) +
      ' group by 1, 2, 3, 4 ';
    buscas.Open;

    buscas.First;
    while not buscas.Eof do
    begin
      if Abs(buscas.FieldByName('taxa_cartao_cred').AsFloat) > 0 then
      begin
        if not vContLigL.vPCont._abrirPContas(buscas.FieldByName('n_conta_plc_tx_cartao').AsFloat) then
          raiseExceptionCreate('Conta de saída para Comissão dos Cartões não encontrada' + #13 +
            'Conta: ' + buscas.FieldByName('n_conta_plc_tx_cartao').AsString, '')
        else if vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString <> 'S' then
          raiseExceptionCreate('Conta de saída para Comissão dos Cartões com tipo diferente de "S" de Saída', '');

        fRecebimento.Insert;
        fRecebimento.FieldByName('CODIGO_CTRL').AsInteger := buscas.FieldByName('codigo_ctrl_cred').AsInteger;
        fRecebimento.FieldByName('HISTORICO_L').AsString := 'COMISSAO CONCILIACAO CANC CARTAO' + vHistPadraoUnificadas;
        fRecebimento.FieldByName('TIPO_L').AsString := 'S';
        fRecebimento.FieldByName('TIP_CNT').AsString := 'N';
        fRecebimento.FieldByName('data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
        fRecebimento.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
        fRecebimento.FieldByName('N_CONTA_PLC').AsFloat := buscas.FieldByName('n_conta_plc_tx_cartao').AsFloat;
        fRecebimento.FieldByName('TIPO').AsString := 'N';
        fRecebimento.FieldByName('VALOR_L').AsFloat := Abs(buscas.FieldByName('taxa_cartao_cred').AsFloat);
        fRecebimento.FieldByName('SAIDA_PROC_AUTO').AsString := 'S';
        fRecebimento.Post;
      end;

      buscas.Next;
    end;

    //Tarifas
    buscas.First;
    while not buscas.Eof do
    begin
      if Abs(buscas.FieldByName('tarifa_cartao_cred').AsFloat) > 0 then
      begin
        if not vContLigL.vPCont._abrirPContas(buscas.FieldByName('n_conta_plc_tarifa_cartao').AsFloat) then
          raiseExceptionCreate('Conta de saída para Tarifas dos Cartões não encontrada' + #13 +
            'Conta: ' + FloatToStr(buscas.FieldByName('n_conta_plc_tarifa_cartao').AsFloat), '')
        else if vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString <> 'S' then
          raiseExceptionCreate('Conta de saída para Tarifas dos Cartões com tipo diferente de "S" de Saída', '');

        fRecebimento.Insert;
        fRecebimento.FieldByName('CODIGO_CTRL').AsInteger := buscas.FieldByName('codigo_ctrl_cred').AsInteger;
        fRecebimento.FieldByName('HISTORICO_L').AsString := 'TARIFAS CONCILIACAO CANC CARTAO' + vHistPadraoUnificadas;
        fRecebimento.FieldByName('TIPO_L').AsString := 'S';
        fRecebimento.FieldByName('TIP_CNT').AsString := 'N';
        fRecebimento.FieldByName('data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
        fRecebimento.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
        fRecebimento.FieldByName('N_CONTA_PLC').AsFloat := buscas.FieldByName('n_conta_plc_tarifa_cartao').AsFloat;
        fRecebimento.FieldByName('TIPO').AsString := 'N';
        fRecebimento.FieldByName('VALOR_L').AsFloat := Abs(buscas.FieldByName('tarifa_cartao_cred').AsFloat);
        fRecebimento.FieldByName('SAIDA_PROC_AUTO').AsString := 'S';
        fRecebimento.Post;
      end;

      buscas.Next;
    end;

    buscas.Close;
    buscas.SQL.Text := ' select cc.idbaixa_cartao, cc.codigo_ctrl, ' +
    	' sum(coalesce(cc.valor_c, 0)) valor_c from controle_creditos cc ' +
      ' where cc.iddev_cartao = ' + IntToStr(pLote) + ' and cc.status_adm = 1' +
      vDadosIni.retornoPorCondicao((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodigoUnificada > 0),
      	' and cc.cod_emp_mult = ' + IntToStr(pCodigoUnificada), ' and cc.codigo_emp = ' + vDadosIni.codEmpresa) +
      ' group by 1, 2 ';
    buscas.Open;

    buscas.First;
    while not buscas.Eof do
    begin
    	fRecebimento.Insert;
      fRecebimento.FieldByName('CODIGO_CTRL').AsInteger := buscas.FieldByName('codigo_ctrl').AsInteger;
      fRecebimento.FieldByName('HISTORICO_L').AsString := 'DEVOLUCAO VENDA' + vHistPadraoUnificadas;
      fRecebimento.FieldByName('TIPO_L').AsString := 'S';
      fRecebimento.FieldByName('TIP_CNT').AsString := 'N';
      fRecebimento.FieldByName('data').AsDateTime := vDadosIni.diaFFinanceiro + 1;
      fRecebimento.FieldByName('DTREFERENCIA').AsDateTime := vDadosIni.diaFFinanceiro + 1;
      fRecebimento.FieldByName('N_CONTA_PLC').AsFloat := dadosReceber.numContaSCr;
      fRecebimento.FieldByName('TIPO').AsString := 'N';
      fRecebimento.FieldByName('VALOR_L').AsFloat := buscas.FieldByName('valor_c').AsFloat;
      fRecebimento.FieldByName('SAIDA_PROC_AUTO').AsString := 'S';
      fRecebimento.Post;
      
      dadosReceber.valorSaidaCartao := dadosReceber.valorSaidaCartao + buscas.FieldByName('valor_c').AsFloat;

      buscas.Next;
    end;

    dataSet.FieldByName('RAZAO').OnGetText := dataSetNomeRazaoGetText;
    dataSet.FieldByName('NOME_C').OnGetText := dataSetNomeRazaoGetText;
    dataSet.FieldByName('CPFCGC').OnGetText := dataSetNomeRazaoGetText;
    
    vTemp := ' '' '' n_doc_c_temp, '' '' n_doc_v_temp, ';
    if vDadosIni.vRecibo.HabRecPorDepart then
      vTemp := ' case when ((cc.tp_doc_v = ''REC'') and (cc.nparcela > 0)) then ' +
          '     (recibos.num_rec_dep ||''-''||cc.nparcela) ' +
          ' else cc.n_doc_c end n_doc_c_temp, ' +
          ' case when ((cc.tp_doc_v = ''REC'') and (cc.nparcela > 0)) then ' +
          '     recibos.num_rec_dep ' +
          ' else cc.n_doc_v end n_doc_v_temp,';

    montaSelect(' select cc.*, ' + vTemp +
      ' retorna_pag_cr.form_pag, controles.nome_ctrl, empresa.identificacao_emp, ' +
      ' p_contas.desc_plc, grupos_ct.desc_gr, depart_ct.desc_dep, p_contas.cod_cta_contabil, p_contas_contabil.nome_cta, ' +
      ' c.nome_cliente, c.razao razao_cliente, c.cpfcgc cpfcgc_cliente, ' +
      ' c.cep, c.endereco, c.num_end_cliente, c.complemento, ' +
      ' c.fone_cliente, c.fone_celular, c.email, ' +
      ' c.cod_localidade, l.localidade, l.cod_setor, s.setor, ' +
      ' tf.status_f, est.sigla_uf, cid.nome_cidade, bai.nome_bairro from controle_creditos cc ' +
      ' left join empresa on empresa.cod_empresa = cc.cod_emp_mult ' +
      ' left join controles on controles.codigo_ctrl = cc.codigo_ctrl and controles.codigo_emp = cc.cod_emp_mult ' +
      ' left join p_contas on p_contas.n_conta_plc = cc.n_conta_plc ' +
      ' left join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct ' +
      ' left join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep ' +
      ' left join p_contas_contabil on p_contas_contabil.cod_cta = p_contas.cod_cta_contabil and p_contas_contabil.cod_empresa = cc.cod_emp_mult ' +
      ' left join recibos on recibos.nrecibo = cc.n_doc_v and recibos.cod_empresa = cc.codigo_emp and cc.tp_doc_v = ''REC'' ' +
      ' left join clientes c on c.cod_cliente = cc.cod_cliente and c.cod_empresa = cc.cod_emp_mult ' +
      ' left join localidade l on l.cod_localidade = c.cod_localidade and l.cod_empresa = c.cod_empresa ' +
      ' left join setor s on s.cod_setor = l.cod_setor and s.cod_empresa = l.cod_empresa ' +
      ' left join tipo_faturamento tf on tf.codigo_faturamento = c.codigo_faturamento ' +
      ' left join estados est on est.codigo_uf = c.codigo_uf ' +
      ' left join cidades cid on cid.cod_cidade = c.cod_cidade ' +
      ' left join bairros bai on bai.cod_bairro = c.cod_bairro ' +
      ' left join retorna_pag_cr (cc.lote_quit, cc.datq_c, ' + vDadosIni.codEmpresa + ', 0, '''') on 1 = 1 ' +
      ' where cc.iddev_cartao = ' + IntToStr(pLote) + ' and cc.status_adm = 1' +
      vDadosIni.retornoPorCondicao((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodigoUnificada > 0),
        ' and cc.cod_emp_mult = ' + IntToStr(pCodigoUnificada), ' and cc.codigo_emp = ' + vDadosIni.codEmpresa));

    if (dataSet.IsEmpty) and (fRecebimento.IsEmpty) then
    begin
      Result := True;
      Exit;
    end;

    dataSet.IndexName := '';
    try
    	dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        dataSet.Edit;
        dataSet.FieldByName('sel').AsString := 'S';
        dataSet.Post;
        dataSet.Next;
      end;
    finally
      dataSet.EnableControls;
    end;
    IndexFieldNames:= 'SEL';
    dadosReceber.baixaParcial := False;
    dadosReceber.usarValorCorrigido := False;
    dadosReceber.acrescentarNomeHist := False;
    dadosReceber.lancarDesconto := False;
    dadosReceber.lancarJuros := False;
    dadosReceber.lancarTaxaCartao := False;
    dadosReceber.historicoSaidaLancamento := '';
    dadosReceber.historicoSaidaLancamentoIni := '';
    dadosReceber.dataBaixa := vDadosIni.diaFFinanceiro + 1;
    dadosReceber.lancarDesconto := False;
    dadosReceber.lancarJuros := False;
    dadosReceber.loteBaixaAdm := pLote;
    dadosReceber.codigoUnificada := pCodigoUnificada;

    SetLength(dadosReceber.codigosControleLanc, 0);
    SetLength(dadosReceber.historicoLanc, 0);
    SetLength(dadosReceber.valorLancSaida, 0);

    vContaRecebendo := Recebendo;
    Recebendo := True;
    try
      dadosReceber.codigoUnificadaBxCartao :=
      	vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodigoUnificada > 0),
        	pCodigoUnificada, vDadosIni.codEmpresa);
      dadosReceber.processamentoAutomatico := True;
      dadosReceber.processamentoAutomaticoDev := True;

//      if not validarRegistrosParaQuitacao then
//	   	 exit;
//
//      if not fRecebimento.IsEmpty then
        Result := _efetuarRecebimento;

    finally
      Recebendo := vContaRecebendo;
      dadosReceber.codigoUnificadaBxCartao    := 0;
      dadosReceber.processamentoAutomatico    := False;
      dadosReceber.processamentoAutomaticoDev := False;
    end;
  except
    on e: exception do begin
      Result := False;
      registraErro('function TControleCredito._baixaDevCreditosConciliacaoCartao pLote: '+ IntToStr(pLote) + '. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro no processamento de devolução baixa de cartão. Erro: ' + e.Message), 'Anteção', 0 + 64);
    end;
  end;
end;

function TControleCredito._concederAcrescimoDesconto: Boolean;
var
  vMensagem: string;
  vPercApurado: Real;
  vOK, vSelecao: Boolean;
  vSumDescPrest, vDifDesc: Double;
  vSomenteSelecionado: Boolean;
begin
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CAR097', 'ALTERAR', '', FTable, '', FBuscas2, True) then
    Exit;

  vSomenteSelecionado := false;
  if (dataSet.Filtered) and (Pos('SEL = ''S''', dataSet.Filter) > 0) then
  	vSomenteSelecionado := true
  else
    vSomenteSelecionado := Application.MessageBox('Somente créditos selecionados', 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = IDYES;

  try

    FValorCorrigido := 0;
    vSelecao := False;
    try
    	dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if (dataSet.FieldByName('SEL').AsString = 'S') or (not vSomenteSelecionado) then
        begin
          if _documentoRecebidoOuSendoRecebido then
            raiseExceptionCreate('Desconto/Acréscimo para este documento não será efetuada', '');

          fRemoverDesconto := True;
          _corrigirValor(False, False);

          if (dataSet.FieldByName('VALOR_CORR').AsFloat > 0) then
            FValorCorrigido := FValorCorrigido + dataSet.FieldByName('VALOR_CORR').AsFloat;

          vSelecao := true;
        end;

        dataSet.Next;
      end;
    finally
      dataSet.EnableControls;
    end;
    if not vSelecao then
      raiseExceptionCreate('Nenhum registro selecionado','');

    FValorOperacao := FValorCorrigido;

    if _abreFormDesconto(FValorOperacao) then
    begin
      if DescontoAcrescimo = 'D' then
      begin
        if FDescontoValor > 0 then
          FValorCorrigido := FValorOperacao - FDescontoValor
        else if FDescontoPercentual > 0 then
          FValorCorrigido := vDadosIni.StrToFloatFormat(FValorOperacao - (FValorOperacao * FDescontoPercentual / 100), 2);//
        FDescontoValor := FValorOperacao - FValorCorrigido;
        vPercApurado := vDadosIni.StrToFloatFormat((((FValorOperacao - FValorCorrigido) * 100) / FValorOperacao), 2);

        vMensagem := 'Percentual máximo de desconto permitido = ' +
          FloatToStr(vDadosIni.vEmp.vMaxDescontoParcela) + '%' + #13 +
          'Percentual apurado de desconto = ' + formatfloat('0.00', vPercApurado) + '%' + #13 +
          'Valor da Prestação = R$' + formatfloat('0.00', FValorOperacao) + #13 +
          'Valor do desconto = R$' + formatfloat('0.00', (FValorOperacao - FValorCorrigido)) + #13 +
          'Valor da Prestação com desconto = R$' + formatfloat('0.00', FValorCorrigido) + #13 + #13 +
          'Deseja permitir este desconto?';

        vOK := Application.MessageBox(pchar(vMensagem), 'Confirmar Desconto?', MB_ICONQUESTION +
          MB_YESNO) = IDYES;

        if (not vOK) then
          exit;
        if (not _descontoPermitido) then
          if not vDadosIni.PesqPros('CAR062', 'PERMITIR', 'N.DOC: ' +
            dataSet.fieldbyname('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
            dataSet.fieldbyname('COD_CRED').AsString + '/' + dataSet.fieldbyname('N_DOC_C').AsString,
            Buscas, True) then
            exit;
      end
      else
      begin
        if FDescontoValor > 0 then
          FValorCorrigido := FValorOperacao + FDescontoValor
        else if FDescontoPercentual > 0 then
          FValorCorrigido := vDadosIni.StrToFloatFormat(FValorOperacao + (FValorOperacao * FDescontoPercentual / 100), 2);//
        FDescontoValor := FValorCorrigido - FValorOperacao;
        vPercApurado := vDadosIni.StrToFloatFormat((((FValorCorrigido - FValorOperacao) * 100) / FValorOperacao), 2);
      end;

      vSumDescPrest := 0;
      try
      	dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
          if (dataSet.FieldByName('SEL').AsString = 'S') and (dataSet.FieldByName('VALOR_CORR').AsFloat > 0) and
            (not _documentoRecebidoOuSendoRecebido) then
          begin

            dataSet.Edit;
            if DescontoAcrescimo = 'D' then
            begin
              dataSet.FieldByName('VALOR_DESC').AsFloat := vDadosIni.StrToFloatFormat(
                (dataSet.FieldByName('VALOR_CORR').AsFloat * vPercApurado / 100), 2);
              dataSet.FieldByName('VALOR_ACRESC').AsFloat := 0;
              dataSet.FieldByName('VALOR_CORR').AsFloat := vDadosIni.StrToFloatFormat(
                (dataSet.FieldByName('VALOR_CORR').AsFloat -
                dataSet.FieldByName('VALOR_DESC').AsFloat), 2);
              vSumDescPrest := vSumDescPrest + vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_DESC').AsFloat, 2);
            end
            else
            begin
              dataSet.FieldByName('VALOR_DESC').AsFloat := 0;
              dataSet.FieldByName('VALOR_ACRESC').AsFloat := vDadosIni.StrToFloatFormat(
                (dataSet.FieldByName('VALOR_CORR').AsFloat * vPercApurado / 100), 2);
              dataSet.FieldByName('VALOR_CORR').AsFloat := vDadosIni.StrToFloatFormat(
                (dataSet.FieldByName('VALOR_CORR').AsFloat +
                dataSet.FieldByName('VALOR_ACRESC').AsFloat), 2);
              vSumDescPrest := vSumDescPrest + vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_ACRESC').AsFloat, 2);
            end;

            if dataSet.FieldByName('VALOR_CORR').value <= 0 then
              raiseExceptionCreate('Valor corrigido menor ou igual a zero, Operação não permitida', '')
            else if (DescontoAcrescimo = 'D')
             and (dataSet.FieldByName('VALOR_CORR').value < dataSet.FieldByName('VALOR_C').value) then
            begin
              Application.MessageBox(pchar('Valor corrigido menor que valor da Parcela.'),
                'Atenção', MB_ICONEXCLAMATION + MB_OK);
              if not vDadosIni.PesqPros('CAR039', 'DESCONTO', 'N.DOC ' +
                Trim(dataSet.FieldByName('N_DOC_C').AsString) + ' VALOR_CORR ' +
                dataSet.FieldByName('VALOR_CORR').AsString +
                ' MENOR QUE VALOR_C ' + dataSet.FieldByName('VALOR_C').AsString, FTable,
                dataSet.FieldByName('cod_cred').AsString + '/' +
                Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas, True) then
              begin
                //vDadosIni.GravaAuditoria('CAR039', 'DESCONTO', 'NAO PERMITIDO N.DOC ' + Trim(dataSet.FieldByName('N_DOC_C').AsString) + ' DESCONTO ' + dataSet.FieldByName('VALOR_DESC').AsString + ' LIQUIDO ' + dataSet.FieldByName('VALOR_CORR').AsString, FTable, dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas);
                raiseExceptionCreate('Valor corrigido menor que valor da Parcela, Operação não permitida para este Caixa', '');
              end;
            end;

            dataSet.Post;
            if DescontoAcrescimo = 'D' then
              vDadosIni.GravaAuditoria('CAR039', 'DESCONTO',
              	'N.DOC ' + Trim(dataSet.FieldByName('N_DOC_C').AsString) +
                ' DESCONTO ' + dataSet.FieldByName('VALOR_DESC').AsString +
                ' LIQUIDO ' + dataSet.FieldByName('VALOR_CORR').AsString, FTable,
                dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas)
            else
              vDadosIni.GravaAuditoria('CAR096', 'ACRESCIMO',
              	'N.DOC ' + Trim(dataSet.FieldByName('N_DOC_C').AsString) +
                ' ACRESCIMO ' + dataSet.FieldByName('VALOR_ACRESC').AsString +
                ' LIQUIDO ' + dataSet.FieldByName('VALOR_CORR').AsString, FTable,
                dataSet.FieldByName('cod_cred').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas);
          end;

          dataSet.Next;
        end;
      finally
        dataSet.EnableControls;
      end;

      vDifDesc := vDadosIni.StrToFloatFormat(FDescontoValor, 2) - vDadosIni.StrToFloatFormat(vSumDescPrest, 2);

      if vDifDesc <> 0 then
      begin
      	try
        	dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
            if (dataSet.FieldByName('SEL').AsString = 'S') and (dataSet.FieldByName('VALOR_CORR').AsFloat > 0) then
            begin
              if DescontoAcrescimo = 'D' then
              begin
                if (dataSet.FieldByName('VALOR_CORR').AsFloat - vDifDesc) > 0 then
                begin
                  dataSet.Edit;
                  dataSet.FieldByName('VALOR_CORR').AsFloat := dataSet.FieldByName('VALOR_CORR').AsFloat - vDifDesc;
                  dataSet.FieldByName('VALOR_DESC').AsFloat := dataSet.FieldByName('VALOR_DESC').AsFloat + vDifDesc;
                  dataSet.FieldByName('VALOR_ACRESC').AsFloat := 0;
                  dataSet.Post;
                  Break;
                end;
              end
              else
              begin
                if (dataSet.FieldByName('VALOR_CORR').AsFloat + vDifDesc) > 0 then
                begin
                  dataSet.Edit;
                  dataSet.FieldByName('VALOR_CORR').AsFloat := dataSet.FieldByName('VALOR_CORR').AsFloat + vDifDesc;
                  dataSet.FieldByName('VALOR_DESC').AsFloat := 0;
                  dataSet.FieldByName('VALOR_ACRESC').AsFloat := dataSet.FieldByName('VALOR_ACRESC').AsFloat + vDifDesc;
                  dataSet.Post;
                  Break;
                end;
              end;
            end;
            dataSet.Next;
          end;
        finally
          dataSet.EnableControls;
        end;
      end;

      if dataSet.ChangeCount > 0 then
      begin
        if Apply then
        begin
          CommitaTransacao;

          if DescontoAcrescimo = 'D' then
            vDadosIni.GravaAuditoria('CAR039', 'DESCONTO', 'SUCESSO', FTable, '', buscas)
          else
            vDadosIni.GravaAuditoria('CAR096', 'ACRESCIMO', 'SUCESSO', FTable, '', buscas);
          if frmCadContasAReceber <> nil then
            _GravaConfiguracoesInteger(frmCadContasAReceber.RadioGroupDescontoAcrescimo.Name, frmCadContasAReceber.RadioGroupDescontoAcrescimo.ItemIndex);
        end;
      end;

    end;
  except on E: Exception do
    begin
      dataSet.Cancel;
      dataSet.CancelUpdates;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TControleCredito._concederAcrescimoDesconto. Erro: ' + e.Message);
      verificaErroDataSetOpen(E.Message);
    end;
  end;
end;

function TControleCredito._consulta: boolean;
var
  I, erro: Integer;
  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
  vCampoTemp, vCondicaoTemp: string;
  vTempCondicao: string;
  vFormPag: string;
begin
  try
  	vsqlAdicional := '';
    vCons.valor   := Trim(vCons.valor);
    vCons.valorAd := Trim(vCons.valorAd);

    vFormPag := '';
    if (trim(UpperCase(vCons.campo)) = 'FORM PAG') then
    begin
      if trim(vCons.condicao) = 'Começa' then
        vFormPag := vCons.valor + '%'
      else if trim(vCons.condicao) = 'Esta contido' then
        vFormPag := '%' + vCons.valor + '%'
      else
        vFormPag := vCons.valor;
      vCons.ordem := 'COD_CRED';
      vCons.campo := '';
      vCons.valor := '';
    end
    else if (vCons.adicional) and (trim(UpperCase(vCons.campoAd)) = 'FORM PAG') then
    begin
      if trim(vCons.condicaoAd) = 'Começa' then
        vFormPag := vCons.valorAd + '%'
      else if trim(vCons.condicaoAd) = 'Esta contido' then
        vFormPag := '%' + vCons.valorAd + '%'
      else
        vFormPag := vCons.valorAd;
      vCons.campoAd := '';
      vCons.valorAd := '';
      vCons.adicional := false;
    end;

    if (UpperCase(trim(vCons.campo)) = 'NUM DOC VND')
    	or (UpperCase(trim(vCons.campo)) = 'NOME CONTROLE')
      or (UpperCase(trim(vCons.campo)) =  'UNIFICADA')
      or (UpperCase(trim(vCons.campo)) = 'DESCRICAO CONTA')
      or (UpperCase(trim(vCons.campo)) = 'DESCRICAO GRUPO CONTA')
      or (UpperCase(trim(vCons.campo)) = 'DESCRICAO DEPARTAMENTO CONTA')
      or (UpperCase(trim(vCons.campo)) = 'COD CONTA CONTABIL')
      or (UpperCase(trim(vCons.campo)) = 'DESCRICAO CONTA CONTABIL')
      or (UpperCase(trim(vCons.campo)) = 'STATUS FATURAMENTO')
      or (UpperCase(trim(vCons.campo)) = 'CEP')
      or (UpperCase(trim(vCons.campo)) = 'ENDERECO')
      or (UpperCase(trim(vCons.campo)) = 'NUM END CLIENTE')
      or (UpperCase(trim(vCons.campo)) = 'COMPLEMENTO')
      or (UpperCase(trim(vCons.campo)) = 'FONE CLIENTE')
      or (UpperCase(trim(vCons.campo)) = 'CELULAR')
      or (UpperCase(trim(vCons.campo)) = 'EMAIL')
      or (UpperCase(trim(vCons.campo)) = 'COD LOCALIDADE')
      or (UpperCase(trim(vCons.campo)) = 'LOCALIDADE')
      or (UpperCase(trim(vCons.campo)) = 'COD SETOR')
      or (UpperCase(trim(vCons.campo)) = 'SETOR')
      or (UpperCase(trim(vCons.campo)) = 'ESTADO CLIENTE')
      or (UpperCase(trim(vCons.campo)) = 'CIDADE CLIENTE')
      or (UpperCase(trim(vCons.campo)) = 'BAIRRO CLIENTE') then
    begin
      if UpperCase(trim(vCons.campo)) = 'NUM DOC VND' then
      begin
        vCons.campo := 'NUM_REC_DEP';
        vCons.ordem := 'RECIBOS.NUM_REC_DEP';
        vCampoTemp := 'N_DOC_V';
      end
      else if UpperCase(trim(vCons.campo)) = 'NOME CONTROLE' then
      begin
        vCons.campo := 'CONTROLES.NOME_CTRL';
        vCons.ordem := 'CONTROLES.NOME_CTRL';
      end
      else if UpperCase(trim(vCons.campo)) =  'UNIFICADA' then
      begin
        vCons.campo := 'EMPRESA.IDENTIFICACAO_EMP';
        vCons.ordem := 'EMPRESA.IDENTIFICACAO_EMP';
      end
      else if UpperCase(trim(vCons.campo)) = 'DESCRICAO CONTA' then
      begin
        vCons.campo := 'P_CONTAS.DESC_PLC';
        vCons.ordem := 'P_CONTAS.DESC_PLC';
      end
      else if UpperCase(trim(vCons.campo)) = 'DESCRICAO GRUPO CONTA' then
      begin
        vCons.campo := 'GRUPOS_CT.DESC_GR';
        vCons.ordem := 'GRUPOS_CT.DESC_GR';
      end
      else if UpperCase(trim(vCons.campo)) = 'DESCRICAO DEPARTAMENTO CONTA' then
      begin
        vCons.campo := 'DEPART_CT.DESC_DEP';
        vCons.ordem := 'DEPART_CT.DESC_DEP';
      end
      else if UpperCase(trim(vCons.campo)) = 'COD CONTA CONTABIL' then
      begin
        vCons.campo := 'P_CONTAS.COD_CTA_CONTABIL';
        vCons.ordem := 'P_CONTAS.COD_CTA_CONTABIL';
      end
      else if UpperCase(trim(vCons.campo)) = 'DESCRICAO CONTA CONTABIL' then
      begin
        vCons.campo := 'P_CONTAS_CONTABIL.NOME_CTA';
        vCons.ordem := 'P_CONTAS_CONTABIL.NOME_CTA';
      end
      else if UpperCase(trim(vCons.campo)) = 'STATUS FATURAMENTO' then
      begin
        vCons.campo := 'TIPO_FATURAMENTO.STATUS_F';
        vCons.ordem := 'TIPO_FATURAMENTO.STATUS_F';
      end
      else if UpperCase(trim(vCons.campo)) = 'CEP' then
      begin
        vCons.campo := 'CLIENTES.CEP';
        vCons.ordem := 'CLIENTES.CEP';
      end
      else if UpperCase(trim(vCons.campo)) = 'ENDERECO' then
      begin
        vCons.campo := 'CLIENTES.ENDERECO';
        vCons.ordem := 'CLIENTES.ENDERECO';
      end
      else if UpperCase(trim(vCons.campo)) = 'NUM END CLIENTE' then
      begin
        vCons.campo := 'CLIENTES.NUM_END_CLIENTE';
        vCons.ordem := 'CLIENTES.NUM_END_CLIENTE';
      end
      else if UpperCase(trim(vCons.campo)) = 'COMPLEMENTO' then
      begin
        vCons.campo := 'CLIENTES.COMPLEMENTO';
        vCons.ordem := 'CLIENTES.COMPLEMENTO';
      end
      else if UpperCase(trim(vCons.campo)) = 'FONE CLIENTE' then
      begin
        vCons.campo := 'CLIENTES.FONE_CLIENTE';
        vCons.ordem := 'CLIENTES.FONE_CLIENTE';
      end
      else if UpperCase(trim(vCons.campo)) = 'CELULAR' then
      begin
        vCons.campo := 'CLIENTES.FONE_CELULAR';
        vCons.ordem := 'CLIENTES.FONE_CELULAR';
      end
      else if UpperCase(trim(vCons.campo)) = 'EMAIL' then
      begin
        vCons.campo := 'CLIENTES.EMAIL';
        vCons.ordem := 'CLIENTES.EMAIL';
      end
      else if UpperCase(trim(vCons.campo)) = 'COD LOCALIDADE' then
      begin
        vCons.campo := 'CLIENTES.COD_LOCALIDADE';
        vCons.ordem := 'CLIENTES.COD_LOCALIDADE';
      end
      else if UpperCase(trim(vCons.campo)) = 'LOCALIDADE' then
      begin
        vCons.campo := 'LOCALIDADE.LOCALIDADE';
        vCons.ordem := 'LOCALIDADE.LOCALIDADE';
      end
      else if UpperCase(trim(vCons.campo)) = 'COD SETOR' then
      begin
        vCons.campo := 'LOCALIDADE.COD_SETOR';
        vCons.ordem := 'LOCALIDADE.COD_SETOR';
      end
      else if UpperCase(trim(vCons.campo)) = 'SETOR' then
      begin
        vCons.campo := 'SETOR.SETOR';
        vCons.ordem := 'SETOR.SETOR';
      end
      else if UpperCase(trim(vCons.campo)) = 'ESTADO CLIENTE' then
      begin
        vCons.campo := 'ESTADOS.SIGLA_UF';
        vCons.ordem := 'ESTADOS.SIGLA_UF';
      end
      else if UpperCase(trim(vCons.campo)) = 'CIDADE CLIENTE' then
      begin
        vCons.campo := 'CIDADES.NOME_CIDADE';
        vCons.ordem := 'CIDADES.NOME_CIDADE';
      end
      else if UpperCase(trim(vCons.campo)) = 'BAIRRO CLIENTE' then
      begin
        vCons.campo := 'BAIRROS.NOME_BAIRRO';
        vCons.ordem := 'BAIRROS.NOME_BAIRRO';
      end;

      if vCons.condicao = 'Igual' then
        vTempCondicao := '='
      else if vCons.condicao = 'Maior' then
        vTempCondicao := '>'
      else if vCons.condicao = 'Maior ou Igual' then
        vTempCondicao := '>='
      else if vCons.condicao = 'Menor' then
        vTempCondicao := '<'
      else if vCons.condicao = 'Menor ou Igual' then
        vTempCondicao := '<='
      else if vCons.condicao = 'Diferente' then
        vTempCondicao := '<>'
      else if (vCons.condicao = 'Esta contido') then
        vTempCondicao := 'like'
      else if (vCons.condicao = 'Começa') then
        vTempCondicao := 'Começa'
      else
        vTempCondicao := '=';

      if vCons.condicao = 'Esta contido' then
        vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
        	vCons.campo + ' like ' + QuotedStr('%' + vCons.valor + '%')
      else if vCons.condicao = 'Começa' then
        vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
        	vCons.campo + ' like ' + QuotedStr(vCons.valor + '%')
      else
        vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
        	vCons.campo + ' ' + vTempCondicao + ' ' + QuotedStr(vCons.valor);

      vCons.campo := 'Todos';
    end;

    if vCons.porData then
    begin
      try
        erro := 0;
        StrToDate(vCons.dataIni);
      except
        vCons.dataIni := '';
        erro := erro + 1;
      end;
      try
        StrToDate(vCons.dataFim);
      except
        vCons.dataFim := '';
        erro := erro + 1;
      end;
      if erro = 2 then
      begin
        Application.MessageBox('Data Inválida. Informe no mínimo uma data correta', 'Atenção',
          MB_OK + MB_ICONINFORMATION);
      end;
    end; //porData
    
    if vCons.adicional then
    begin
      vCons.valorAd := UpperCase(vCons.valorAd);
      if vCons.porDataAd then
      begin
        try
          erro := 0;
          StrToDate(vCons.dataIniAd);
        except
          vCons.dataIniAd := '';
          erro := erro + 1;
        end;
        try
          StrToDate(vCons.dataFimAd);
        except
          vCons.dataFimAd := '';
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
          if vCons.dataIniAd <> '' then
            vCons.dataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataIniAd)));
          if vCons.dataFimAd <> '' then
            vCons.dataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(vCons.dataFimAd)));
        end;
      end;
      if vCons.condicaoAd = 'Igual' then
        vCons.condicaoAd := '='
      else if vCons.condicaoAd = 'Maior' then
        vCons.condicaoAd := '>'
      else if vCons.condicaoAd = 'Maior ou Igual' then
        vCons.condicaoAd := '>='
      else if vCons.condicaoAd = 'Menor' then
        vCons.condicaoAd := '<'
      else if vCons.condicaoAd = 'Menor ou Igual' then
        vCons.condicaoAd := '<='
      else if vCons.condicaoAd = 'Diferente' then
        vCons.condicaoAd := '<>'
      else if (vCons.condicaoAd = 'Esta contido') then
        vCons.condicaoAd := 'like'
      else if (vCons.condicaoAd = 'Começa') then
        vCons.condicaoAd := 'Começa'
      else
        vCons.condicaoAd := '=';
      for I := 0 to dataSet.FieldCount - 1 do
      begin
        if Dataset.Fields[I].FieldKind = fkData then
        begin
          if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(vCons.campoAd) then
          begin
            vCons.valorAd := ajustar_consulta_incasesensitive(dataSet.Fields[I], '', vCons.valorAd);
            try
              vCons.campoAd := DataSet.Fields[I].FieldName;
              if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
                (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
                ((vCons.condicaoAd = 'Começa') or (vCons.condicaoAd = 'like')) then
              begin              
                try              
                  vCons.condicaoAd := '=';
                  if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
                    vCons.valorAd := IntToStr(StrToInt(Trim(vCons.valorAd)))
                  else if (DataSet.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField) then
                    vCons.valorAd := FloatToStr(StrToFloat(Trim(vCons.valorAd)))
                except
                  vCons.valorAd := '0';
                  Application.MessageBox('Valor inválido', 'Atenção', 0 + 64);
                end;
              end
              else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
              begin
                if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                  vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
                    ' controle_creditos.' + vCons.campoAd + ' >= ' + vCons.dataIniAd +
                    ' and controle_creditos.' + vCons.campoAd + ' <= ' + vCons.dataFimAd
                else if (vCons.dataFimAd <> '') then
                  vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
                  	' controle_creditos.' + vCons.campoAd + ' <= ' + vCons.dataFimAd
                else if (vCons.dataIniAd <> '') then
                  vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
                  	' controle_creditos.' + vCons.campoAd + ' >= ' + vCons.dataIniAd;
                Break;
              end;
              if vCons.condicaoAd = 'like' then
                vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
                	' controle_creditos.' + vCons.campoAd + ' like ' + QuotedStr('%' + vCons.valorAd + '%')
              else if vCons.condicaoAd = 'Começa' then
                vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
                	' controle_creditos.' + vCons.campoAd + ' like ' + QuotedStr(vCons.valorAd + '%')
              else
                vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') + 
                	' controle_creditos.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ' + QuotedStr(vCons.valorAd);

            finally
              if (UpperCase(vCons.campoAd) = 'NOME_CLIENTE') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.nome_c', 'clientes.nome_cliente', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'RAZAO') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.razao', 'clientes.razao', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'CPFCGC') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.cpfcgc', 'clientes.cpfcgc', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'STATUS_F') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.status_f', 'tipo_faturamento.status_f', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'CEP') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.cep', 'clientes.cep', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'ENDERECO') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.endereco', 'clientes.endereco', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'NUM_END_CLIENTE') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.num_end_cliente', 'clientes.num_end_cliente', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'COMPLEMENTO') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.complemento', 'clientes.complemento', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'FONE_CLIENTE') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.fone_cliente', 'clientes.fone_cliente', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'FONE_CELULAR') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.fone_celular', 'clientes.fone_celular', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'EMAIL') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.email', 'clientes.email', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'COD_LOCALIDADE') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.cod_localidade', 'clientes.cod_localidade', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'LOCALIDADE') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.localidade', 'localidade.localidade', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'COD_SETOR') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.cod_setor', 'localidade.cod_setor', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'SETOR') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.setor', 'setor.setor', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'SIGLA_UF') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.sigla_uf', 'estados.sigla_uf', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'NOME_CIDADE') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.nome_cidade', 'cidades.nome_cidade', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'NOME_BAIRRO') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.nome_bairro', 'cidades.nome_bairro', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'DESC_PLC') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.desc_plc', 'p_contas.desc_plc', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'DESC_GR') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.desc_gr', 'grupos_ct.desc_gr', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'DESC_DEP') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.desc_dep', 'depart_ct.desc_dep', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'COD_CTA_CONTABIL') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.cod_cta_contabil', 'p_contas.cod_cta_contabil', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'NOME_CTA') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.nome_cta', 'p_contas_contabil.nome_cta', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'NOME_CTRL') then
              	vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.nome_ctrl', 'controles.nome_ctrl', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'IDENTIFICACAO_EMP') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.identificacao_emp', 'empresa.identificacao_emp', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'N_DOC_C_TEMP') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.n_doc_c_temp', 'recibos.num_rec_dep', [rfIgnoreCase, rfReplaceAll])
              else if (UpperCase(vCons.campoAd) = 'N_DOC_V_TEMP') then
                vsqlAdicional := StringReplace(vsqlAdicional, 'controle_creditos.n_doc_v_temp', 'recibos.num_rec_dep', [rfIgnoreCase, rfReplaceAll]);
            end;
            Break;
          end;
        end;
      end;
    end; //adicional

  	if trim(vTipoE) <> '' then
    	vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
        ' coalesce(p_contas.tipo_ctp, '''') not in (' + vTipoE + ')';

    if vCons.retornos then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select codigo_ctrl from controles' +
        ' where retornos = ''S'' ' +
        ' and codigo_emp = ' + vDadosIni.codEmpresa +
        ' and ativo = 1 ';
      buscas.Open;
      tempSql := '';
      while not buscas.eof do
      begin
        tempSql := tempSql + ', ' + IntToStr(buscas.FieldByName('codigo_ctrl').AsInteger);
        buscas.Next;
      end;
      if Trim(tempSql) <> '' then
      begin
        vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
        	' controle_creditos.codigo_ctrl in (' + Copy(tempSql, 3, Length(tempSql)) + ')';
      end
      else // Nao vai exibir nenhum registro caso nao tenha controle configurado
      begin
        vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
        	' controle_creditos.codigo_ctrl in (0,0)';
      end;
    end;

    if (vCons.quitados = vCons.naoQuitados) then
    else if vCons.naoQuitados then
      vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
        ' (controle_creditos.status_c = '''' or controle_creditos.status_c is null)'
    else if vCons.quitados then
      vsqlAdicional := vsqlAdicional + vDadosIni.IfThen(trim(vsqlAdicional) <> '', ' and ', '') +
        ' ((controle_creditos.status_c <> '''') and (not controle_creditos.status_c is null))';

    if Trim(vsqlAdicional) = '' then
      vsqlAdicional := vsqlAdicional + ' controle_creditos.cod_cred <> -1';

    if Trim(vCons.valor) <> '' then
      for I := 0 to dataSet.FieldCount - 1 do
        if Dataset.Fields[I].FieldKind = fkData then
          if ContainsText(dataset.Fields[I].DisplayName, vCons.campo) then
          begin
            vCons.valor := ajustar_consulta_incasesensitive(DataSet.Fields[I], '', vCons.valor);
            Break;
          end;

    if FRecebendo then
      dataSet.PacketRecords := -1
    else
      dataSet.PacketRecords := 1000;

    if vCons.porData then
      Result := ConsultaCampos('CONTROLE_CREDITOS', vCons.campo, vCons.ordem, vCons.dataIni, vCons.dataFim, vDadosIni.codEmpresa, 1,
        Fsql_campos,
        Fsql_inner +
        ' left join retorna_pag_cr (controle_creditos.lote_quit, controle_creditos.datq_c, ' + vDadosIni.codEmpresa + ',' +
          vDadosIni.IfThen((vCons.verFormas) or (trim(vFormPag) <> ''), '1,', '0,') + QuotedStr(vFormPag) + ') on 1 = 1 ',
        vsqlAdicional +
        vDadosIni.IfThen(trim(vFormPag) <> '',
          vDadosIni.IfThen(trim(vsqlAdicional) <> '',
            ' and ', '') + ' retorna_pag_cr.encontrou > 0 ', ''),
        vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          ' (case when (empresa.financeiro_unificado = ''S'') then ' +
          ' 		  empresa.codigo_unificadora ' +
          '			else ' +
          '			  controle_creditos.codigo_emp ' +
          ' end) ',
          ''))
    else
      result := ConsultaCampos('CONTROLE_CREDITOS', vCons.valor, vCons.campo, vCons.condicao, vCons.ordem, True, vDadosIni.codEmpresa,
        Fsql_campos,
        Fsql_inner +
        ' left join retorna_pag_cr (controle_creditos.lote_quit, controle_creditos.datq_c, ' + vDadosIni.codEmpresa + ',' +
        	vDadosIni.IfThen((vCons.verFormas) or (trim(vFormPag) <> ''), '1,', '0,') + QuotedStr(vFormPag) + ') on 1 = 1 ',
        vsqlAdicional +
        vDadosIni.IfThen(trim(vFormPag) <> '',
          vDadosIni.IfThen(trim(vsqlAdicional) <> '',
            ' and ', '') + ' retorna_pag_cr.encontrou > 0 ', ''),
        vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          ' (case when (empresa.financeiro_unificado = ''S'') then ' +
          ' 		  empresa.codigo_unificadora ' +
          '			else ' +
          '			  controle_creditos.codigo_emp ' +
          ' end) ',
          ''));

  finally

  end;
end;

procedure TControleCredito._corrigir;
var
  vTxJuros, vDesconto, vAcrescimo: Real;
  vDtTemp: TDate;
begin
  vTxJuros := (vDadosIni.getDataBanco(buscas) - dataSet.FieldByName('data_venc_c').AsDateTime) *
    (vDadosIni.vEmp.vTxJuros / 30);

  vBx._selecionaUltimoBaixaCreditos(dataSet.FieldByName('cod_cred').AsInteger);

  vDesconto := dataSet.FieldByName('VALOR_DESC').AsFloat;
  vAcrescimo := dataSet.FieldByName('VALOR_ACRESC').AsFloat;
  if fRemoverDesconto then
  begin
    vDesconto := 0;
    vAcrescimo := 0;
  end;

  dataSet.Edit;
  if vBx.dataSet.IsEmpty then
    dataSet.FieldByName('VALOR_CORR').AsFloat :=
      dataSet.FieldByName('VALOR_C').AsFloat + (((dataSet.FieldByName('VALOR_C').AsFloat *
      vTxJuros) / 100) + ((dataSet.FieldByName('VALOR_C').AsFloat * vDadosIni.vEmp.vMultas) / 100))
  else if dataSet.FieldByName('VALOR_C').AsFloat = 0 then
    dataSet.FieldByName('VALOR_CORR').AsFloat :=
      vBx.dataSet.FieldByName('VALOR_CORR').AsFloat +
      (((vBx.dataSet.FieldByName('VALOR_CORR').AsFloat * vTxJuros) / 100) +
      ((vBx.dataSet.FieldByName('VALOR_CORR').AsFloat * vDadosIni.vEmp.vMultas) / 100))
  else
    dataSet.FieldByName('VALOR_CORR').AsFloat :=
      vBx.dataSet.FieldByName('VALOR_CORR').AsFloat + (((dataSet.FieldByName('VALOR_C').AsFloat *
      vTxJuros) / 100) +
      ((dataSet.FieldByName('VALOR_C').AsFloat * vDadosIni.vEmp.vMultas) / 100));

  buscas.Close;
  buscas.SQL.Text := 'select tp_plano, taxa_cartao from controles' +
    ' where codigo_ctrl = ' + IntToStr(dataSet.FieldByName('codigo_ctrl').AsInteger) +
    ' and tp_plano = ''C'' ' +
    ' and codigo_emp = ' + vDadosIni.codEmpresa;
  buscas.Open;

  if not buscas.IsEmpty then
  begin
    dataSet.FieldByName('VALOR_CORR').AsFloat := dataSet.FieldByName('VALOR_C').AsFloat;

    if buscas.FieldByName('TAXA_CARTAO').AsFloat > 0 then
        if dataSet.FieldByName('VALOR_LIQUIDO').AsFloat = dataSet.FieldByName('VALOR_C').AsFloat then
          dataSet.FieldByName('VALOR_LIQUIDO').AsFloat := vDadosIni.StrToFloatFormat(
            dataSet.FieldByName('VALOR_C').AsFloat - (dataSet.FieldByName('VALOR_C').AsFloat *
            buscas.FieldByName('TAXA_CARTAO').AsFloat / 100), 2);

    vDesconto := 0;
    vAcrescimo := 0;
  end;

  dataSet.FieldByName('VALOR_CORR').AsFloat := dataSet.FieldByName('VALOR_CORR').AsFloat - vDesconto + vAcrescimo;
  dataSet.FieldByName('VALOR_DESC').AsFloat := vDesconto;
  dataSet.FieldByName('VALOR_ACRESC').AsFloat := vAcrescimo;
  dataSet.FieldByName('VALOR_CORR').AsFloat := vDadosIni.StrToFloatFormat(
    dataSet.FieldByName('VALOR_CORR').AsFloat, 2);
  dataSet.Post;

  vDadosIni.GravaAuditoria('CAR038', 'ALTERAR',
  	' COD CRED ' + dataSet.FieldByName('COD_CRED').AsString +
    ' NUM DOC ' + Trim(dataSet.FieldByName('N_DOC_C').AsString) +
    ' VALOR ' + Format('%0.2f', [dataSet.FieldByName('VALOR_C').AsFloat]) +
    ' CORRIGIDO ' + Format('%0.2f', [dataSet.FieldByName('VALOR_CORR').AsFloat]), FTable,
    dataSet.FieldByName('COD_CRED').AsString + '/' +
    Trim(dataSet.FieldByName('N_DOC_C').AsString), FBuscas2);
end;

function TControleCredito._corrigirValor(
  pSomenteSelecionados: Boolean; pConsDesAcres: boolean = true; pExibirMensagem: boolean = true): Boolean;
var
  vPointer: Pointer;
  vSomenteSelecionado: Boolean;
  buscas2: TIBQuery;
  vNovoValorLiquido: Double;
begin
	Result := false;
  if dataSet.IsEmpty then
    Exit;

  buscas2 := TIBQuery.Create(Application);
 	buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  if not vDadosIni.PesqPros('CAR038', 'ALTERAR', '', FTable, '', FBuscas2, True) then
    Exit;

  if not pSomenteSelecionados then
  begin
    if (dataSet.FieldByName('DATA_VENC_C').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros) <
      vDadosIni.getDataBanco(buscas) then
      _corrigir
    else if vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_C').AsFloat, 2) > 0 then
    begin
      dataSet.Edit;
      if pConsDesAcres then
        dataSet.FieldByName('VALOR_CORR').AsFloat :=
          vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_C').AsFloat
          - dataSet.FieldByName('VALOR_DESC').AsFloat + dataSet.FieldByName('VALOR_ACRESC').AsFloat, 2)
      else
      begin
        dataSet.FieldByName('VALOR_CORR').AsFloat := dataSet.FieldByName('VALOR_C').AsFloat;
        dataSet.FieldByName('VALOR_DESC').AsFloat := 0;
        dataSet.FieldByName('VALOR_ACRESC').AsFloat := 0;
      end;

      vDadosIni.CalcularTaxaCartao(buscas2,
      	vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, dataSet.FieldByName('COD_EMP_MULT').AsInteger, 0),
        dataSet.FieldByName('N_DOC_V').AsInteger,
        dataSet.FieldByName('TP_DOC_V').AsString,
      	dataSet.FieldByName('CODIGO_CTRL').AsInteger,
        '',
        dataSet.FieldByName('COD_TERMINAL_ADM').AsString,
        dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger,
        dataSet.FieldByName('DEB_CRED').AsString,
        dataSet.FieldByName('QTDE_PARC').AsInteger,
        dataSet.FieldByName('VALOR_LIQUIDO').AsFloat,
        dataSet.FieldByName('VALOR_C').AsFloat,
        0,
        true,
        vNovoValorLiquido);
      dataSet.FieldByName('VALOR_LIQUIDO').AsFloat := vNovoValorLiquido;

      dataSet.Post;
    end;
  end
  else
  begin
  	vSomenteSelecionado := false;
    if not pExibirMensagem then
      vSomenteSelecionado := true
    else if (dataSet.Filtered) and (Pos('SEL = ''S''', dataSet.Filter) > 0) then
	  	vSomenteSelecionado := true
    else
      vSomenteSelecionado := Application.MessageBox('Somente créditos selecionados', 'Confirmação',
        MB_ICONQUESTION + MB_YESNO) = IDYES;

    fRemoverDesconto := True;

    try
      vPointer := dataSet.GetBookmark;
      dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if (dataSet.FieldByName('SEL').AsString = 'S') or (not vSomenteSelecionado) then
          if not _documentoRecebidoOuSendoRecebido then
            if (dataSet.FieldByName('DATA_VENC_C').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros) <
              vDadosIni.getDataBanco(buscas) then
            begin
              if (_documentoRecebidoOuSendoRecebido) then
              begin
                _desmarcaLinha;
                if pExibirMensagem then
                  Application.MessageBox(pchar('Correção de valor para este documento não será efetuada.'),
                    'Atenção', 0 + 64);
              end
              else
                _corrigir;
            end
            else if vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_C').AsFloat, 2) > 0 then
            begin
              if (_documentoRecebidoOuSendoRecebido) then
              begin
                _desmarcaLinha;
                if pExibirMensagem then
                  Application.MessageBox(pchar('Correção de valor para este documento não será efetuada.'),
                    'Atenção', 0 + 64);
              end
              else
              begin
                dataSet.Edit;
                dataSet.FieldByName('VALOR_CORR').AsFloat :=
                  vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_C').AsFloat, 2);
                dataSet.FieldByName('VALOR_DESC').AsFloat := 0;
                dataSet.FieldByName('VALOR_ACRESC').AsFloat := 0;

                vDadosIni.CalcularTaxaCartao(buscas2,
                  vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, dataSet.FieldByName('COD_EMP_MULT').AsInteger, 0),
                  dataSet.FieldByName('N_DOC_V').AsInteger,
                  dataSet.FieldByName('TP_DOC_V').AsString,
                  dataSet.FieldByName('CODIGO_CTRL').AsInteger,
                  '',
                  dataSet.FieldByName('COD_TERMINAL_ADM').AsString,
                  dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger,
                  dataSet.FieldByName('DEB_CRED').AsString,
                  dataSet.FieldByName('QTDE_PARC').AsInteger,
                  dataSet.FieldByName('VALOR_LIQUIDO').AsFloat,
                  dataSet.FieldByName('VALOR_C').AsFloat,
                  0,
                  true,
                  vNovoValorLiquido);
                dataSet.FieldByName('VALOR_LIQUIDO').AsFloat := vNovoValorLiquido;

                dataSet.Post;
              end;
            end;

        dataSet.Next;
      end;
    finally
    	dataSet.First;
      dataSet.GotoBookmark(vPointer);
      dataSet.EnableControls;
    end;
  end;
  if dataSet.ChangeCount = 0 then
  begin
    Result := False;
    vDadosIni.GravaAuditoria('CAR038', 'ALTERAR', 'SEM REGISTROS MODIFICADOS', FTable, '', buscas);
  end
  else if Apply then
  begin
    CommitaTransacao;
    Result := True;
    vDadosIni.GravaAuditoria('CAR038', 'ALTERAR', 'SUCESSO MODIFICACOES', FTable, '', buscas);
  end
  else
  begin
    RollBackTransacao;
    Result := False;
    vDadosIni.GravaAuditoria('CAR038', 'ALTERAR', 'FALHA MODIFICACOES', FTable, '', buscas);
  end;
end;

function TControleCredito._gerarBoletoCreditos(pCodCreditosBol: string; pLoteBaixa: Integer): Boolean;
var
 formulario: TForm;
 hdTemp: THandle;
 buscasCred, buscas2: TIBQuery;
 vdatabanco: TDate;
 vIDCred: Integer;
 vNDocCred: string;
 vMensagem: string;
 vSemCliente: boolean;
 vDifCliente: boolean;
 vGerarBoletos: boolean;
 vCodCliente: Integer;
begin
	try
  	Result := true;
    vGerarBoletos := false;
    vSemCliente := false;
    vDifCliente := false;

    if not vDadosIni.vBoletos.ExisteConvenio then
  		exit;

    vDadosIni.vInibeMensPesqPros := 'S';
    if not vDadosIni.PesqPros('CAR100', 'ABRIR',
	    'LOTE BAIXA: ' + IntToStr(pLoteBaixa),
	    'CONTROLE_CREDITOS', '', dtmContasAReceber.qrBuscas, True) then
      Exit;

    if (vDadosIni.vEmp.vImprimirBoletoOS <> 'S') then
	    Exit;

    buscasCred := TIBQuery.Create(Application);
    buscasCred.Database := buscas.Database;
    buscasCred.Transaction := buscas.Transaction;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    buscasCred.Close;
    buscasCred.SQL.Text := ' select cc.*, empresa.identificacao_emp, c.nome_cliente, c.razao razao_cliente, cid.nome_cidade, tf.status_f from controle_creditos cc' +
      ' left join empresa on empresa.cod_empresa = cc.cod_emp_mult ' +
      ' left join clientes c on c.cod_cliente = cc.cod_cliente and c.cod_empresa = cc.cod_emp_mult' +
      ' left join recibos on recibos.nrecibo = cc.n_doc_v and recibos.cod_empresa = cc.codigo_emp and cc.tp_doc_v = ''REC'' ' +
      ' left join cidades cid on cid.cod_cidade = c.cod_cidade' +
      ' left join tipo_faturamento tf on tf.codigo_faturamento = c.codigo_faturamento' +
      ' where cc.cod_cred in (' + pCodCreditosBol + ') ' +
      ' and cc.codigo_emp = ' + vDadosIni.codEmpresa;
    buscasCred.Open;
    buscasCred.FetchAll;

    if buscasCred.IsEmpty then
    	exit;

    if Application.MessageBox('Deseja gerar boleto(s)?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    	exit;

    vCodCliente := 0;

    buscasCred.First;
    while not buscasCred.Eof do
    begin
       if vCodCliente <= 0 then
         vCodCliente := buscasCred.FieldByName('COD_CLIENTE').AsInteger;

       if buscasCred.FieldByName('COD_CLIENTE').AsInteger <= 0 then
       	 vSemCliente := true
       else
       	 vGerarBoletos := true;

       if (vCodCliente <> 0) and (vCodCliente <> buscasCred.FieldByName('COD_CLIENTE').AsInteger) then
       	 vDifCliente := true;

       buscasCred.Next;
    end;

    if vSemCliente then
    begin
      Application.MessageBox(PChar(IfThen(not vGerarBoletos, 'Os ', 'Alguns ') +
      	' créditos gerados estão sem o código do cliente, os boletos para os mesmos não serão gerados' + #13 + #13 +
      	'Favor verificar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    end;

    if not vGerarBoletos then // Todos créditos sem cliente
    	exit;

    InputQuery('Observação do boleto',
      'Informe a Observação a ser impressa no boleto', vMensagem);

    vdatabanco := vDadosIni.getDataBanco(buscas2);

    vIDCred := Gencodigo('CRED_BOL', dtmContasAReceber.SpIncCodigo, vDadosIni.codEmpresa);
    vNDocCred := vDadosIni.StrZero(vIDCred, 6);

    buscasCred.First;
    while not buscasCred.Eof do
    begin
    	if buscasCred.FieldByName('COD_CLIENTE').AsInteger > 0 then
      begin
      	vNDocCred := Copy(trim(buscasCred.FieldByName('N_DOC_C').AsString), 1, 10);

        buscas2.Close;
        buscas2.SQL.Text := 'INSERT INTO BOLETAS (N_SEQ_BOL, COD_EMPRESA, COD_CRED, DATA_EM_BOL,' +
          ' DATA_VEN_BOL, N_DOC_BOL, VL_DOC_BOL, VL_DESC_BOL, OBS_BOL, M_DIA_BOL, MULT_ATR_BOL,' +
          ' COD_CLIENTE, LOCALPAG, OBS_BOL1, SUB_SERIE, COD_CONTROLE_CX, ' +
          ' NUM_NF_VND, TIPO_EMISSAO, NPARCELA, TOTALPARCELAS, IDCARNE)' +
          ' VALUES' +
          ' (:N_SEQ_BOL, :COD_EMPRESA, :COD_CRED, :DATA_EM_BOL,' +
          ' :DATA_VEN_BOL, :N_DOC_BOL, :VL_DOC_BOL, :VL_DESC_BOL, :OBS_BOL, :M_DIA_BOL, :MULT_ATR_BOL,' +
          ' :COD_CLIENTE, :LOCALPAG, :OBS_BOL1, :SUB_SERIE, :COD_CONTROLE_CX, ' +
          ' :NUM_NF_VND, :TIPO_EMISSAO, :NPARCELA, :TOTALPARCELAS, :IDCARNE)';
        buscas2.ParamByName('N_SEQ_BOL').AsInteger := Gencodigo('BOLETAS',
          dtmContasAReceber.SpIncCodigo, vDadosIni.codEmpresa);
        buscas2.ParamByName('COD_EMPRESA').AsInteger := buscasCred.FieldByName('COD_EMP_MULT').AsInteger;
        buscas2.ParamByName('NPARCELA').AsInteger := buscasCred.FieldByName('NPARCELA').AsInteger;
        buscas2.ParamByName('TOTALPARCELAS').AsInteger := buscasCred.FieldByName('QTDE_PARC').AsInteger;
        buscas2.ParamByName('COD_CRED').AsInteger := buscasCred.FieldByName('COD_CRED').AsInteger;
        buscas2.ParamByName('SUB_SERIE').AsInteger := 0;
        buscas2.ParamByName('OBS_BOL1').AsString := copy(vMensagem, 1, 45);
        buscas2.ParamByName('COD_CLIENTE').AsInteger := buscasCred.FieldByName('COD_CLIENTE').AsInteger;
        buscas2.ParamByName('DATA_EM_BOL').AsDate := Date;
        if vdatabanco > buscasCred.FieldByName('DATA_VENC_C').AsDateTime then
          buscas2.ParamByName('DATA_VEN_BOL').AsDate := vdatabanco + 1
        else
          buscas2.ParamByName('DATA_VEN_BOL').AsDate := buscasCred.FieldByName('DATA_VENC_C').AsDateTime;
        buscas2.ParamByName('COD_CONTROLE_CX').AsInteger := buscasCred.FieldByName('CODIGO_CTRL').AsInteger;
        buscas2.ParamByName('N_DOC_BOL').AsString := vNDocCred;
        buscas2.ParamByName('VL_DOC_BOL').AsCurrency := buscasCred.FieldByName('VALOR_C').AsCurrency;
        buscas2.ParamByName('VL_DESC_BOL').AsCurrency := 0;
    //    	vDadosIni.IfThen((pUsarValorCorrigido) and (buscasCred.FieldByName('VALOR_CORR').AsCurrency > 0),
    //      buscasCred.FieldByName('VALOR_CORR').AsCurrency, buscasCred.FieldByName('VALOR_C').AsCurrency);
        buscas2.ParamByName('NUM_NF_VND').AsInteger := vIDCred;
        buscas2.ParamByName('TIPO_EMISSAO').AsString := 'CRED';
        buscas2.Prepare;
        buscas2.ExecSQL;
      end;

      buscasCred.Next;
    end;

    if ((not buscasCred.IsEmpty) and (vGerarBoletos)) then
    begin
      CommitaTransacao;
      Result := True;

      if not vDadosIni.PesqPros('CAR101', 'ABRIR',
       'LOTE BAIXA: ' + IntToStr(pLoteBaixa),
       'CONTROLE_CREDITOS', '', dtmContasAReceber.qrBuscas, True) then
        Exit;

      vDadosIni.vPesquisa := 'CRED|' + IntToStr(vIDCred) + '|0|' +
      	IfThen(vSemCliente, '0', IfThen(vDifCliente, '0', IntToStr(vCodCliente))) + '|';
      formulario := Funcoes.AbreForm('pkBoletos', 'TfrmSelecionaCobrebem', hdTemp);
      try
      finally
        formulario.Free;
        unLoadPackage(hdTemp);
      end;
    end;
  except on E: Exception do
    begin
      RollBackTransacao;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TControleCredito._gerarBoletoCreditos. Erro: ' + e.Message);
      verificaErroDataSetOpen(E.Message);
    end;
  end;
end;

function TControleCredito._gerarCarne(pGerarCarne: boolean; pUsarValorCorrigido: boolean; pExibirMensagemGerarBoleto: boolean): Boolean;
var
  vCodControleTemp, vCodClienteTemp, vContTemp, vTotTemp, vIDCarne, vIDCred: Integer;
  vValorTemp: Double;
  vCodEmpresaTemp: Integer;
  vNDocCarne, vNDocCred: string;
  hdTemp: THandle;
  formulario: TForm;
  vboletosVenc: boolean;
  vdatabanco: TDate;
  vtempIdCarne: Integer;
  vMensagem: string;
  vtemp: string;
begin
	Result := False;
  if dataSet.IsEmpty then
    Exit;

  if pGerarCarne then
  begin
    if Application.MessageBox(pchar('Ao gerar carnê dos documentos selecionados os mesmos serão enviados para' +
      ' o cadastro de boletas, posteriormente enviados para o banco pelo arquivo de remessa.' +
      ' O processo não poderá ser desfeito, o cancelamento do carne somente poderá ser efetuado pelo cadastro de boletos.' + #13 +
      'Deseja continuar mesmo assim?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;
  end
  else
  begin
  	if pExibirMensagemGerarBoleto then
    begin
      if Application.MessageBox(pchar('Deseja gerar boleto(s)?'),
      	'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;
    end
    else
    begin
      if Application.MessageBox(pchar('Ao gerar boletos dos documentos selecionados os mesmos serão enviados para' +
        ' o cadastro de boletas, posteriormente enviados para o banco pelo arquivo de remessa.' +
        ' O processo não poderá ser desfeito, o cancelamento da impressão somente poderá ser efetuado pelo cadastro de boletos.' + #13 +
        'Deseja continuar mesmo assim?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;
    end;
  end;

  if not vDadosIni.PesqPros(vDadosIni.IfThen(pGerarCarne, 'CAR063', 'CAR099'), 'GERAR', '', FTable, '', FBuscas2, True) then
    Exit;

  try

    try
      vDadosIni.abreStatusProcessamento('', 'Efetuando ' +
      	vDadosIni.IfThen(pGerarCarne,
        	'Lançamentos do Carnê',
          'Geração dos boletos'));

      vdatabanco := vDadosIni.getDataBanco(buscas);    
      vCodControleTemp := 0;
      vCodClienteTemp := 0;
      vContTemp := 0;
      vValorTemp := 0;
      vCodEmpresaTemp := 0;
      vIDCarne := 0;
      vIDCred := 0;
      vboletosVenc := false;
      vdatabanco := vDadosIni.getDataBanco(buscas);

      try
      	dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin

          if (dataSet.FieldByName('SEL').AsString = 'S') then
          begin
            if (dataSet.FieldByName('cod_cliente').AsInteger = 0) then
              raiseExceptionCreate('Sem Código do cliente. ' +
                vDadosIni.IfThen(pGerarCarne, 'Carnê', 'Boleto') +
                  ' não poderá ser gerado');

            if (vCodEmpresaTemp <> 0) and (dataSet.FieldByName('cod_emp_mult').AsInteger <> vCodEmpresaTemp) then
              raiseExceptionCreate('Foram selecionados registros de empresas diferentes. ' +
                vDadosIni.IfThen(pGerarCarne, 'Carnê', 'Boleto') +
                  ' não poderá ser gerado, pois os documentos devem ser da mesma empresa', '');

            if (vCodClienteTemp <> 0) and (dataSet.FieldByName('cod_cliente').AsInteger <> vCodClienteTemp) then
              raiseExceptionCreate('Foram selecionados registros de clientes diferentes. ' +
                vDadosIni.IfThen(pGerarCarne, 'Carnê', 'Boleto') +
                  ' não poderá ser gerado, pois os documentos devem ser do mesmo cliente');

            if (vCodControleTemp <> 0) and (dataSet.FieldByName('codigo_ctrl').AsInteger <> vCodControleTemp) then
              raiseExceptionCreate('Foram selecionados registros de controles diferentes. ' +
                vDadosIni.IfThen(pGerarCarne, 'Carnê', 'Boleto') +
                  ' não poderá ser gerado, pois os documentos devem ser do mesmo controle');

            if pGerarCarne then
              if (vValorTemp <> 0) and (dataSet.FieldByName('valor_c').AsFloat <> vValorTemp) then
                raiseExceptionCreate('Foram selecionados registros de valores diferentes. ' +
                  vDadosIni.IfThen(pGerarCarne, 'Carnê', 'Boleto') +
                		' não poderá ser gerado, pois os documentos devem ser do mesmo valor', '');

            if pGerarCarne then
              if (dataSet.FieldByName('IDCARNE').AsInteger > 0) then
                if Application.MessageBox(pchar('Registro selecionado já foi enviado para o carnê número: ' + IntToStr(dataSet.FieldByName('IDCARNE').AsInteger) + #13 +
                   'Deseja continuar mesmo assim?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
                    raiseExceptionCreate('Operação cancelada', '');

            if not vboletosVenc then
              if vdatabanco > dataSet.FieldByName('data_venc_c').AsDateTime then
                vboletosVenc := true;

            vContTemp := vContTemp + 1;
            vCodEmpresaTemp := dataSet.FieldByName('cod_emp_mult').AsInteger;
            vCodClienteTemp := dataSet.FieldByName('cod_cliente').AsInteger;
            vCodControleTemp := dataSet.FieldByName('codigo_ctrl').AsInteger;
            vValorTemp := dataSet.FieldByName('valor_c').AsFloat;

            if vDadosIni.codEmpresa <> IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
            begin
              SqlOpen(' select empf.*, emp.identificacao_emp, emp.cgc_emp from empresa_fisica empf ' +
                ' inner join empresa emp on emp.cod_empresa = empf.cod_empresa ' +
                ' where empf.cod_empresa = ' + IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger) +
                ' and emp.ativo = 1 ', buscas2);

              if buscas2.IsEmpty then
              begin
                SqlOpen(' select emp.cod_empresa, emp.identificacao_emp, emp.cgc_emp from empresa emp ' +
                  ' where emp.cod_empresa = ' + IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger) +
                  ' and emp.ativo = 1 ', buscas2);

                vtemp := 'Crédito selecionado pertence a outra empresa, não é possível ' +
                  vDadosIni.IfThen(pGerarCarne, 'gerar carnê', 'imprimir boletos') + ' de outra empresa:' + #13 + #13 +
                  'CRÉDITO:' + #13 +
                  'Cod Cred: ' + IntToStr(dataSet.FieldByName('cod_cred').AsInteger) + #13 +
                  'Data Vencimento: ' + FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('data_venc_c').AsDateTime) + #13 +
                  'Valor: ' +  format('%n', [dataSet.FieldByName('valor_c').AsFloat]) + #13 +
                  vDadosIni.IfThen(dataSet.FieldByName('cod_cliente').AsInteger > 0,
                    'Cliente: ' + trim(dataSet.FieldByName('cod_cliente').AsString) + ' - ' + trim(dataSet.FieldByName('nome_c').AsString),
                    'Cliente: ' + trim(dataSet.FieldByName('nome_c').AsString)) + #13 + #13 +
                  'EMPRESA' + #13 +
                  'Codigo: ' + IntToStr(buscas2.FieldByName('cod_empresa').AsInteger) + #13 +
                  'Nome: ' + trim(buscas2.FieldByName('identificacao_emp').AsString) + #13 +
                  'CNPJ/CPF: ' + trim(buscas2.FieldByName('cgc_emp').AsString);

                Application.MessageBox(PChar(vtemp), 'Atenção', MB_OK + MB_ICONWARNING);
                exit;
              end;
            end;
          end;

          dataSet.Next;
        end;
      finally
        dataSet.EnableControls;
      end;

      if vboletosVenc then
        Application.MessageBox('Alguns créditos estão vencidos, a data de vencimentos destes boletos será atualizada para o próximo dia',
        	'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);

     if pGerarCarne then
     begin
        buscas.Close;
        buscas.SQL.Text := 'select USAR_BOLETO from controles' +
          ' where codigo_ctrl = ' + IntToStr(vCodControleTemp) +
          ' and codigo_emp = ' + IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger);
        buscas.Open;
        if buscas.FieldByName('USAR_BOLETO').AsString <> 'S' then
          raiseExceptionCreate('Registro selecionado não corresponde a um controle definido como boleto bancário', '');

        vIDCarne := Gencodigo('CARNE', dtmContasAReceber.SpIncCodigo, IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger));
        vNDocCarne := vDadosIni.StrZero(vIDCarne, 6);
        CommitaTransacao;

        if not InputQuery('Número do documento',
          'Informe o número do documento do Carne', vNDocCarne) then
          Exit;

        if Trim(vNDocCarne) = '' then
          raiseExceptionCreate('Número do documento do Carne não informado', '');
      end
      else
      begin
      	vIDCred := Gencodigo('CRED_BOL', dtmContasAReceber.SpIncCodigo, IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger));
        vNDocCred := vDadosIni.StrZero(vIDCred, 6);
        CommitaTransacao;

        InputQuery('Observação do boleto',
		      'Informe a Observação a ser impressa no boleto', vMensagem);
      end;

      if (not pGerarCarne) and (pUsarValorCorrigido) then
         _corrigirValor(true, true, false);
         
      vTotTemp := vContTemp;
      vContTemp := 0;

      try
      	dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
          if (dataSet.FieldByName('SEL').AsString = 'S') then
          begin
            if (pGerarCarne)
              or ((not pGerarCarne) and (trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString) = '')) then
            begin
              vContTemp := vContTemp + 1;
              vDadosIni.abreStatusProcessamento('', 'Gerando ' +
                 vDadosIni.IfThen(pGerarCarne, 'carnê', 'boletos') + '. ' + vDadosIni.StrZero(vContTemp, 2) +
                ' de ' + vDadosIni.StrZero(vTotTemp, 2));

              vNDocCred := Copy(trim(dataSet.FieldByName('N_DOC_C').AsString), 1, 10);

              buscas.Close;
              buscas.SQL.Text := ' SELECT BOL.N_SEQ_BOL, BOL.COD_EMPRESA, ' +
                ' BOL.NOSSO_NUMERO_BANCO, BOL.DATA_VEN_BOL, BOL.COD_CLIENTE, CL.NOME_CLIENTE, ' +
                ' BOL.IDCARNE, BOL.ATIVO FROM BOLETAS BOL ' +
                ' LEFT JOIN CLIENTES CL ON CL.COD_CLIENTE = BOL.COD_CLIENTE AND CL.COD_EMPRESA = BOL.COD_EMPRESA ' +
                ' WHERE BOL.COD_CRED = :COD_CRED AND BOL.COD_EMPRESA = :COD_EMPRESA ';
              buscas.ParamByName('COD_CRED').AsInteger := dataSet.FieldByName('COD_CRED').AsInteger;
              buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
              buscas.Open;

              if not buscas.IsEmpty then
              begin
                vtempIdCarne := buscas.FieldByName('IDCARNE').AsInteger;

                if buscas.FieldByName('ativo').AsInteger <> 1 then
                  Application.MessageBox(PChar('Boleto selecionado esta na lixeira: ' + #13 +
                    'Num Seq Boleto ' + IntToStr(buscas.FieldByName('n_seq_bol').AsInteger) + #13 +
                    'Nosso Número ' + buscas.FieldByName('nosso_numero_banco').AsString + #13 +
                    'Data Vencimento ' + FormatDateTime('dd/mm/yyyy', buscas.FieldByName('data_ven_bol').AsDateTime) + #13 +
                    'Cliente ' + IntToStr(buscas.FieldByName('cod_cliente').AsInteger) + ' - ' + buscas.FieldByName('nome_cliente').AsString + #13 + #13 +
                    'Favor verificar!'), 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);

                buscas.Close;
                buscas.SQL.Text := ' UPDATE BOLETAS SET N_DOC_BOL = :N_DOC_BOL, ' +
                  ' VL_DOC_BOL = :VL_DOC_BOL, TIPO_EMISSAO = :TIPO_EMISSAO, ' +
                  ' NUM_NF_VND = :NUM_NF_VND, IDCARNE = :IDCARNE ' +
                  ' WHERE COD_CRED = :COD_CRED AND COD_EMPRESA = :COD_EMPRESA ';
                buscas.ParamByName('COD_CRED').AsInteger := dataSet.FieldByName('COD_CRED').AsInteger;
                buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMP_MULT').AsInteger;

                if (pGerarCarne) then
                begin
                  buscas.ParamByName('N_DOC_BOL').AsString := vNDocCarne;
                  buscas.ParamByName('VL_DOC_BOL').AsCurrency := vValorTemp;
                  buscas.ParamByName('TIPO_EMISSAO').AsString := 'CR';
                  buscas.ParamByName('IDCARNE').AsInteger := vIDCarne;
                end
                else
                begin
                  buscas.ParamByName('N_DOC_BOL').AsString := vNDocCred;
                  buscas.ParamByName('VL_DOC_BOL').AsCurrency := vDadosIni.IfThen((pUsarValorCorrigido) and (dataSet.FieldByName('VALOR_CORR').AsCurrency > 0),
                    dataSet.FieldByName('VALOR_CORR').AsCurrency, dataSet.FieldByName('VALOR_C').AsCurrency);
                  buscas.ParamByName('NUM_NF_VND').AsInteger := vIDCred;
                  buscas.ParamByName('TIPO_EMISSAO').AsString := 'CRED';
                  if vtempIdCarne > 0 then
                    buscas.ParamByName('IDCARNE').AsInteger := vtempIdCarne;
                end;
                buscas.ExecSQL;
              end
              else
              begin
                buscas.Close;
                buscas.SQL.Text := 'INSERT INTO BOLETAS (N_SEQ_BOL, COD_EMPRESA, COD_CRED, DATA_EM_BOL,' +
                  ' DATA_VEN_BOL, N_DOC_BOL, VL_DOC_BOL, VL_DESC_BOL, OBS_BOL, M_DIA_BOL, MULT_ATR_BOL,' +
                  ' COD_CLIENTE, LOCALPAG, OBS_BOL1, SUB_SERIE, COD_CONTROLE_CX, ' +
                  ' NUM_NF_VND, TIPO_EMISSAO, NPARCELA, TOTALPARCELAS, IDCARNE)' +
                  ' VALUES' +
                  ' (:N_SEQ_BOL, :COD_EMPRESA, :COD_CRED, :DATA_EM_BOL,' +
                  ' :DATA_VEN_BOL, :N_DOC_BOL, :VL_DOC_BOL, :VL_DESC_BOL, :OBS_BOL, :M_DIA_BOL, :MULT_ATR_BOL,' +
                  ' :COD_CLIENTE, :LOCALPAG, :OBS_BOL1, :SUB_SERIE, :COD_CONTROLE_CX, ' +
                  ' :NUM_NF_VND, :TIPO_EMISSAO, :NPARCELA, :TOTALPARCELAS, :IDCARNE)';
                buscas.ParamByName('N_SEQ_BOL').AsInteger := Gencodigo('BOLETAS', dtmContasAReceber.SpIncCodigo, IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger));
                buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
                buscas.ParamByName('NPARCELA').AsInteger := vContTemp;
        				buscas.ParamByName('TOTALPARCELAS').AsInteger := vTotTemp;
                buscas.ParamByName('COD_CRED').AsInteger := dataSet.FieldByName('COD_CRED').AsInteger;
                buscas.ParamByName('SUB_SERIE').AsInteger := 0;
      //          buscas.ParamByName('M_DIA_BOL').AsFloat :=
      //            vDadosIni.StrToFloatFormat(vDadosIni.vEmp.vTxJuros / 30, 2);
      //          buscas.ParamByName('MULT_ATR_BOL').AsFloat := vDadosIni.vEmp.vMultas;
      //          buscas.ParamByName('LOCALPAG').AsString := copy(vDadosIni.vEmp.vLocalPagBol, 1, 40);
      //          buscas.ParamByName('OBS_BOL').AsString := copy(vDadosIni.vEmp.vObsBol, 1, 45);
                if pGerarCarne then
                  buscas.ParamByName('OBS_BOL1').AsString := 'Parcela ' + vDadosIni.StrZero(vContTemp, 2) +
                    ' de ' + vDadosIni.StrZero(vTotTemp, 2)
                else
                  buscas.ParamByName('OBS_BOL1').AsString := copy(vMensagem, 1, 45);
                buscas.ParamByName('COD_CLIENTE').AsInteger := vCodClienteTemp;
                buscas.ParamByName('DATA_EM_BOL').AsDate := Date;
                if vdatabanco > dataSet.FieldByName('DATA_VENC_C').AsDateTime then
                  buscas.ParamByName('DATA_VEN_BOL').AsDate := vdatabanco + 1
                else
                  buscas.ParamByName('DATA_VEN_BOL').AsDate := dataSet.FieldByName('DATA_VENC_C').AsDateTime;
                buscas.ParamByName('COD_CONTROLE_CX').AsInteger := vCodControleTemp;

                if pGerarCarne then
                begin
                  buscas.ParamByName('NPARCELA').AsInteger := vContTemp;
                  buscas.ParamByName('TOTALPARCELAS').AsInteger := vTotTemp;
                  buscas.ParamByName('N_DOC_BOL').AsString := vNDocCarne;
                  buscas.ParamByName('VL_DOC_BOL').AsCurrency := vValorTemp;
                  buscas.ParamByName('VL_DESC_BOL').AsCurrency := 0;
                  buscas.ParamByName('TIPO_EMISSAO').AsString := 'CR';
                  buscas.ParamByName('IDCARNE').AsInteger := vIDCarne;
                end
                else
                begin
                  buscas.ParamByName('N_DOC_BOL').AsString := vNDocCred;
                  buscas.ParamByName('VL_DOC_BOL').AsCurrency := vDadosIni.IfThen((pUsarValorCorrigido) and (dataSet.FieldByName('VALOR_CORR').AsCurrency > 0),
                    dataSet.FieldByName('VALOR_CORR').AsCurrency, dataSet.FieldByName('VALOR_C').AsCurrency);
                  buscas.ParamByName('VL_DESC_BOL').AsCurrency := 0;
                  buscas.ParamByName('NUM_NF_VND').AsInteger := vIDCred;
                  buscas.ParamByName('TIPO_EMISSAO').AsString := 'CRED';
                end;
                buscas.Prepare;
                buscas.ExecSQL;

                dataSet.Edit;
                if pGerarCarne then
                  dataSet.FieldByName('IDCARNE').AsInteger := vIDCarne;
                dataSet.Post;
              end;
            end;
          end;

          dataSet.Next;
        end;
      finally
        dataSet.EnableControls;
      end;

      if (Apply) or (dataSet.ChangeCount = 0) then
      begin
        CommitaTransacao;
        Result := True;
        if pGerarCarne then
	        Application.MessageBox('Registros do carnê gerados com sucesso.', 'Atenção', 0 + 64);
        vDadosIni.vPesquisa := vDadosIni.IfThen(pGerarCarne,
        	'CR|' + IntToStr(vIDCarne) + '|0|' + IntToStr(vCodClienteTemp) + '|',
          'CRED|' + IntToStr(vIDCred) + '|0|'+ IntToStr(vCodClienteTemp) + '|');

        try
        	vDadosIni.vPesquisaCodEmpresa := StrToInt(vDadosIni.codEmpresa);
        	vDadosIni.codEmpresa := IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger);

        	formulario := Funcoes.AbreForm('pkBoletos', 'TfrmSelecionaCobrebem', hdTemp);
        finally
        	vDadosIni.codEmpresa := IntToStr(vDadosIni.vPesquisaCodEmpresa);
          vDadosIni.vPesquisaCodEmpresa := 0;

          formulario.Free;
          unLoadPackage(hdTemp);
        end;
      end
      else
        RollBackTransacao;

    finally
      vDadosIni.fechaStatusProcessamento;
    end;

  except on E: Exception do
    begin
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TControleCredito._gerarCarne. Erro: ' + e.Message);
      verificaErroDataSetOpen(E.Message);
    end;
  end;
end;

function TControleCredito._getDataUltimaVenda(pTipoVenda: string;
  pNumVenda: Integer): string;
begin
  Result := '';
  if Trim(pTipoVenda) = '' then
    Exit;

  if pNumVenda = 0 then
    Exit;

  Result := retornaValor('select first 1 data_venda as valor from controle_creditos' +
    ' where tp_doc_v = ' + QuotedStr(pTipoVenda) +
    ' and n_doc_v = ' + IntToStr(pNumVenda) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa);
end;

function TControleCredito._impressaoDeRecibo: Boolean;
begin

  if vBx.dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CAR042', 'ALTERAR', ' COD CRED' +
    vBx.dataSet.FieldByName('SEQ_BXCRED').AsString, 'BAIXA_CREDITOS',
    vBx.dataSet.FieldByName('SEQ_BXCRED').AsString, FBuscas2, True) then
    Exit;

  dadosRecibo.qtde := 1;
  dadosRecibo.codClienteDoRecibo := vBx.dataSet.FieldByName('cod_cliente').AsInteger;
  dadosRecibo.docDoRecibo := Trim(vBx.dataSet.FieldByName('N_DOC_C').AsString);
  dadosRecibo.nomeClienteRecibo := Trim(vBx.dataSet.FieldByName('NOME_C').AsString);
  dadosRecibo.dataVencRecibos := vBx.dataSet.FieldByName('DATA_VENC_C').AsString;
  dadosRecibo.valorRecibo := vBx.dataSet.FieldByName('VL_RECIBO').AsFloat;
  _imprimirRecibo;

end;

function TControleCredito._informarDadosTransacaoCartao(pTipo: Integer): Boolean;
var
  formulario: TfrmPadrao;
  vOK: Boolean;
  buscas2: TIBQuery;
  vNovoValorLiquido: Double;
  vCodBandeira: Integer;
begin
  FAdmConfCartao := false;
  FTerminalConfCartao := false;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  if not vDadosIni.PesqPros('CAR079', 'ALTERAR', 'NUM CRED ' +
    dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
    dataSet.FieldByName('COD_CRED').AsString, buscas, True) then
    Exit;

  if dataSet.IsEmpty then
    Exit;

  if pTipo = 0 then
	  vCtrl._selecionaControle(dataSet.FieldByName('codigo_ctrl').AsInteger);

  if vCtrl.dataSet.FieldByName('TP_PLANO').AsString <> 'C' then
    raiseExceptionCreate('Controle de crédito selecionado não é do Tipo Plano = "C - Cartao"', '');

  if pTipo = 0 then
	  dataSet.Edit;

  if (dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger <= 0) then
  begin
    vCodBandeira := vDadosIni.retornaDadosBandeira(
      '',
      vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
      	IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger),
        StrToInt(vDadosIni.codEmpresa)),
      dataSet.FieldByName('N_DOC_V').AsInteger,
      dataSet.FieldByName('TP_DOC_V').AsString,
      buscas);

    if not (dataSet.State in [dsInsert, dsEdit]) then
	  	dataSet.Edit;

    if vCodBandeira > 0 then
    begin
      SqlOpen(' select COD_BANDEIRA, DESCRICAO from BANDEIRAS_CARTAO ' +
        ' where COD_BANDEIRA = ' + IntToStr(vCodBandeira) +
        ' and COD_EMPRESA = ' + vDadosIni.codEmpresa, buscas);

      dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger := vCodBandeira;
      if not buscas.IsEmpty then
       	DataSet.FieldByName('DESC_BANDEIRA').AsString := Copy(trim(buscas.FieldByName('DESCRICAO').AsString), 1, 50);
    end;
  end;

  vTerminalCartao.montaSelect('select tc.*, ac.descricao_adm from terminal_cartao tc' +
    ' inner join adm_cartao ac on ac.cod_adm = tc.cod_adm and ac.cod_empresa = tc.cod_empresa and ac.ativo = 1' +
    ' where tc.cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
    	IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger), vDadosIni.codEmpresa) +
    ' and tc.ativo = 1');

  vBandeiraCartao.montaSelect(' select bd.* from bandeiras_cartao bd ' +
  	' where bd.cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
    	IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger), vDadosIni.codEmpresa) +
    ' and bd.ativo = 1 ');

//  if Trim(dataSet.FieldByName('DATQ_C').AsString) <> '' then
//    raiseExceptionCreate('Crédito não pode ser alterado. Já foi quitado', '');

  SqlOpen('select ac.taxa_por_controle_bandeira from adm_cartao ac ' +
  	' where ac.cod_adm = ' + IntToStr(vTerminalCartao.dataSet.FieldByName('cod_adm').AsInteger) +
    ' and ac.cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
    	IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger), vDadosIni.codEmpresa) +
    ' and ac.ativo = 1 ', buscas2);

   if (buscas2.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').AsString = 'B') then
  	FAdmConfCartao := true;

  SqlOpen('select codigo_ctrl, nome_ctrl, tp_plano, cartao_sped from controles ' +
  	' where codigo_ctrl = ' + IntToStr(vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa, buscas2);

  if (FAdmConfCartao) and (buscas2.FieldByName('TP_PLANO').AsString = 'C') then
    if (buscas2.FieldByName('CARTAO_SPED').AsInteger <> 1)
    	and (buscas2.FieldByName('CARTAO_SPED').AsInteger <> 2) then
    begin
      Application.MessageBox(pchar('Controle ' +
        IntToStr(buscas2.FieldByName('CODIGO_CTRL').AsInteger) +
        ' - ' + trim(buscas2.FieldByName('NOME_CTRL').AsString) +
        ' definido como cartão, favor informar se é Débito ou Crédito'),
        'Atenção', 0 + 64);
      exit;

    end;
  if (buscas2.FieldByName('TP_PLANO').AsString = 'C')
  	and (buscas2.FieldByName('CARTAO_SPED').AsInteger <> 0) then
  begin
    if trim(dataSet.FieldByName('DEB_CRED').AsString) = '' then
    begin
    	if (buscas2.FieldByName('CARTAO_SPED').AsInteger = 1)
      	or (buscas2.FieldByName('CARTAO_SPED').AsInteger = 2) then
			    dataSet.FieldByName('DEB_CRED').AsString := vDadosIni.IfThen(buscas2.FieldByName('CARTAO_SPED').AsInteger = 1, 'D', 'C')
      else
        	dataSet.FieldByName('DEB_CRED').Value := Null;
    end;
  	FTerminalConfCartao := true;
  end;

  FCodTermAdmCartao := dataSet.FieldByName('COD_TERMINAL_ADM').AsString;
  FDescTermAdmCartao := dataSet.FieldByName('DESC_TERMINAL_ADM').AsString;
  FCodAdmCartao := dataSet.FieldByName('COD_ADM').AsInteger;
  FDescAdmCartao := dataSet.FieldByName('DESC_ADM').AsString;
  FCodBandeiraCartao := dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger;
  FDesBandeiraCartao := dataSet.FieldByName('DESC_BANDEIRA').AsString;
  FQtdeParcelaCartao := dataSet.FieldByName('QTDE_PARC').AsInteger;
  FNAutCartao := dataSet.FieldByName('N_AUT_CART').AsString;
  FNDocNsuAdmCartao := dataSet.FieldByName('N_DOCNSU_ADM').AsString;
  FNParcelaCartao := dataSet.FieldByName('NPARCELA').AsInteger;
  FNsuRoAdmCartao := dataSet.FieldByName('NSU_RO_ADM').AsString;
  FRoAdmCartao := dataSet.FieldByName('RO_ADM').AsString;

  {$REGION 'abreFormDadosTransacaoCartao'}

  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    if Trim(dataSet.FieldByName('DATQ_C').AsString) = '' then
    	formulario.Caption := 'Informar dados da transação do Cartão'
    else
    	formulario.Caption := 'Informar dados da transação do Cartão (Quitado)';
    
    frmCadContasAReceber.pnNSU.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    frmCadContasAReceber.BitBtn51.Enabled := Trim(dataSet.FieldByName('DATQ_C').AsString) = '';

    frmCadContasAReceber.btVisualizarComprovante.Visible := false;
    if (dataSet.FieldByName('N_DOC_V').AsInteger > 0) and (Trim(dataSet.FieldByName('TP_DOC_V').AsString) <> '') then
      frmCadContasAReceber.btVisualizarComprovante.Visible := vDadosIni.existeReciboPagamento(
        dataSet.FieldByName('N_DOC_V').AsInteger,
        trim(dataSet.FieldByName('TP_DOC_V').AsString),
        dataSet.FieldByName('COD_EMP_MULT').AsInteger,
        buscas);

    vOK := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnNSU.Parent := frmCadContasAReceber.tsNSU;
    formulario.Free;
    formulario := nil;
  end;

  {$ENDREGION}

  if vOK then
  begin
  	dataSet.FieldByName('COD_ADM').AsInteger := vTerminalCartao.dataSet.FieldByName('COD_ADM').AsInteger;

    if dataSet.FieldByName('COD_ADM').AsInteger > 0 then
	    dataSet.FieldByName('DESC_ADM').AsString := vTerminalCartao.dataSet.FieldByName('DESCRICAO_ADM').AsString
    else
    	dataSet.FieldByName('DESC_ADM').Value := Null;

    if trim(dataSet.FieldByName('COD_TERMINAL_ADM').AsString) <> '' then
    	dataSet.FieldByName('DESC_TERMINAL_ADM').AsString := vTerminalCartao.dataSet.FieldByName('DESC_TERM_ADM').AsString
    else
      dataSet.FieldByName('DESC_TERMINAL_ADM').Value := Null;

    if dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger > 0 then
	    dataSet.FieldByName('DESC_BANDEIRA').AsString := vBandeiraCartao.dataSet.FieldByName('DESCRICAO').AsString
    else
    	dataSet.FieldByName('DESC_BANDEIRA').Value := null;

    if (FAdmConfCartao) and (FTerminalConfCartao) then
    if (trim(FCodTermAdmCartao) <> trim(dataSet.FieldByName('COD_TERMINAL_ADM').AsString))
    	or (FCodBandeiraCartao <> dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger)
      or (FQtdeParcelaCartao <> dataSet.FieldByName('QTDE_PARC').AsInteger) then
    begin
       vDadosIni.CalcularTaxaCartao(buscas2,
       	vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, dataSet.FieldByName('COD_EMP_MULT').AsInteger, 0),
        dataSet.FieldByName('N_DOC_V').AsInteger,
        dataSet.FieldByName('TP_DOC_V').AsString,
      	dataSet.FieldByName('CODIGO_CTRL').AsInteger,
        '',
        dataSet.FieldByName('COD_TERMINAL_ADM').AsString,
        dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger,
        dataSet.FieldByName('DEB_CRED').AsString,
        dataSet.FieldByName('QTDE_PARC').AsInteger,
        dataSet.FieldByName('VALOR_LIQUIDO').AsFloat,
        dataSet.FieldByName('VALOR_C').AsFloat,
        0,
        false,
        vNovoValorLiquido);
      dataSet.FieldByName('VALOR_LIQUIDO').AsFloat := vNovoValorLiquido;
    end;
    if pTipo = 0 then
    begin
      dataSet.Post;
      Result := Apply;
      CommitaTransacao;
    end;
  end
  else
  begin
    if pTipo = 0 then
      dataSet.Cancel
    else
    begin
      dataSet.FieldByName('COD_TERMINAL_ADM').AsString := FCodTermAdmCartao;
      dataSet.FieldByName('DESC_TERMINAL_ADM').AsString := FDescTermAdmCartao;
      dataSet.FieldByName('COD_ADM').AsInteger := FCodAdmCartao;
      dataSet.FieldByName('DESC_ADM').AsString := FDescAdmCartao;
      dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger := FCodBandeiraCartao;
      dataSet.FieldByName('DESC_BANDEIRA').AsString := FDesBandeiraCartao;
      dataSet.FieldByName('QTDE_PARC').AsInteger := FQtdeParcelaCartao;
      dataSet.FieldByName('N_AUT_CART').AsString := FNAutCartao;
      dataSet.FieldByName('N_DOCNSU_ADM').AsString := FNDocNsuAdmCartao;
      dataSet.FieldByName('NPARCELA').AsInteger := FNParcelaCartao;
      dataSet.FieldByName('NSU_RO_ADM').AsString := FNsuRoAdmCartao;
      dataSet.FieldByName('RO_ADM').AsString := FRoAdmCartao;
    end;  
  end;
end;

function TControleCredito._informarDataPrevRec: Boolean;
var
  vDtAnt: string;
  vCodigoCR: string;
  vListaClBarrarDesbarrar: TStringList;
  vQtdeReg: Integer;
  I: Integer;
  vDataPrevRecMenor: Boolean;
begin
  try
    vListaClBarrarDesbarrar := TStringList.Create;
    vListaClBarrarDesbarrar.Sorted := True;
    vListaClBarrarDesbarrar.Duplicates := dupIgnore;
    vListaClBarrarDesbarrar.Clear;

    Result := False;

    if dataSet.IsEmpty then
      Exit;

    if not vDadosIni.PesqPros('CAR112', 'ALTERAR', '',
      FTable, '', buscas, True) then
      exit;

    try
      try
        vCodigoCR := dataSet.FieldByName('COD_CRED').AsString;

        vQtdeReg := 1;

        prepare_loop('Sel = ''S''');
        if not dataset.IsEmpty then
        begin
        	vQtdeReg := dataSet.RecordCount;
          
          vCodigoCR := '';
        end;

      finally
        prepare_loop_done;
      end;

      if not _abreFormDataPrevRec(vQtdeReg) then
        Exit;

      try
        if (trim(vCodigoCR) <> '') then
          prepare_loop('COD_CRED = ' + vCodigoCR)
        else
          prepare_loop('Sel = ''S''');

        vDataPrevRecMenor := False;
        dataSet.first;
        while not dataSet.EOF do
        begin
        	if FDataPrevRec > 0 then
      	  	if dataSet.FieldByName('data_venc_c').AsDateTime > FDataPrevRec then
            begin
            	vDataPrevRecMenor := True;
              Break;
            end;

        	dataSet.Next;
        end;

        if vDataPrevRecMenor then
        begin
          if not vDadosIni.PesqPros('CAR110', 'PERMITIR', '',
            'CONTROLE_CREDITOS', '', buscas, True) then
              Exit;
        end;

        dataSet.first;
        while not dataSet.EOF do
        begin
          vDtAnt := dataSet.FieldByName('DATA_PREV_REC').AsString;

          if ((vDadosIni.vCliente.Barramento.vBarraAutomaticamenteAposVencCrediario = 'S')
              and (vDadosIni.vCliente.Barramento.vCodigoBarrado > 0))
            or ((vDadosIni.vCliente.Barramento.vDesbarraAutomaticamenteAposQuitCrediario = 'S')
              and (vDadosIni.vCliente.Barramento.vCodigoDesbarrado > 0)) then
          begin
          	if (dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
            begin
              if (vDadosIni.vEmp.vFinanceiroUnificado)
                and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
              begin
                if trim(dataSet.FieldByName('CPFCGC').AsString) <> '' then
                  vListaClBarrarDesbarrar.Add(trim(dataSet.FieldByName('CPFCGC').AsString));
              end
              else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
                vListaClBarrarDesbarrar.Add(IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger));
            end;
          end;

          dataSet.Edit;
          if FDataPrevRec = 0 then
          	dataSet.FieldByName('DATA_PREV_REC').Value := Null
          else
          	dataSet.FieldByName('DATA_PREV_REC').AsDateTime := FDataPrevRec;
          dataSet.Post;

        	if not dataSet.FieldByName('data_prev_rec').IsNull then
            if dataSet.FieldByName('data_venc_c').AsDateTime > dataSet.FieldByName('data_prev_rec').AsDateTime then
            begin
              vDadosIni.GravaAuditoria('CAR110', 'PERMITIR', ' NUM DOC' + Trim(dataSet.FieldByName('N_DOC_C').AsString),
              	'CONTROLE_CREDITOS',
                IntToStr(dataSet.FieldByName('COD_CRED').AsInteger) + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas);
            end;

          vDadosIni.GravaAuditoria('CAR112', 'ALTERAR',
          	' CODIGO: ' + IntToStr(dataSet.FieldByName('COD_CRED').AsInteger) +
            ' DATA PREV REC ANT: ' + vDtAnt +
            ' DATA PREV REC AT: ' + dataSet.FieldByName('DATA_PREV_REC').AsString, FTable,
            IntToStr(dataSet.FieldByName('COD_CRED').AsInteger) + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas);

          dataSet.next;
        end;
      finally
        vDadosIni.fechaStatusProcessamento;
        prepare_loop_done;
      end;

      if dataSet.ChangeCount = 0 then
        exit;

      Apply;
      CommitaTransacao;
      Result := True;

      vDadosIni.GravaAuditoria('CAR112', 'ALTERAR', 'CONFIRMADA MODIFICACOES', FTable, '', buscas);

    except
      on e: exception do
      begin
        RollBackTransacao;
        dataSet.Refresh;
        Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('function TControleCredito._informarDataPrevRec. Erro: ' + e.Message);
      end;
    end;
  finally
  	if vListaClBarrarDesbarrar.Count > 0 then
    begin
      for I := 0 to vListaClBarrarDesbarrar.Count - 1 do
      begin
        if trim(vListaClBarrarDesbarrar[I]) <> '' then
        begin
          if vDadosIni.vEmp.vFinanceiroUnificado then
            vDadosIni.negativarClientes(0, trim(vListaClBarrarDesbarrar[I]))
          else
            vDadosIni.negativarClientes(StrToInt(vListaClBarrarDesbarrar[I]), '');
        end;
      end;
    end;

    if Assigned(vListaClBarrarDesbarrar) then
      FreeAndNil(vListaClBarrarDesbarrar);
  end;
end;

function TControleCredito._informarDataRealBaixa: Boolean;
var
  vDtAnt: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CAR026', 'ALTERAR', '',
    FTable, '', buscas, True) then
    exit;

  try
    if not _abreFormDataRealBaixa then
      Exit;

    try
    	dataSet.DisableControls;
      dataSet.first;
      while not dataSet.EOF do
      begin
        if (dataSet.FieldByName('sel').AsString = 'S') and
          (Trim(dataSet.FieldByName('status_c').AsString) = 'QUITADO') then
        begin
          FCodigo := dataSet.FieldByName('cod_cred').AsInteger;
          vDtAnt := dataSet.FieldByName('DATA_BAIXA').AsString;

          dataSet.Edit;
          dataSet.FieldByName('DATA_BAIXA').AsDateTime := FDataRealBaixa;
          dataSet.Post;

          vDadosIni.GravaAuditoria('CAR026', 'ALTERAR',
          	' CODIGO: ' + IntToStr(FCodigo) +
            ' DATA BAIXA ANT: ' + vDtAnt +
            ' DATA BAIXA AT: ' + dataSet.FieldByName('DATA_BAIXA').AsString, FTable,
            IntToStr(FCodigo), buscas);
        end;
        dataSet.next;
      end;
    finally
    	dataSet.EnableControls;
    end;

    if dataSet.ChangeCount = 0 then
      exit;

    Apply;
    CommitaTransacao;
    Result := True;

    vDadosIni.GravaAuditoria('CAR026', 'ALTERAR', 'CONFIRMADA MODIFICACOES', FTable, '', buscas);

  except
    on e: exception do
    begin
      RollBackTransacao;
      dataSet.Refresh;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TControleCredito._informarDataRealBaixa. Erro: ' + e.Message);
    end;
  end;
end;

function TControleCredito._informarObservacaoParaCxl(pObs: string = ''; pRegistroAtual: Boolean = False): Boolean;
var
  vObsTemp: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CAR027', 'ALTERAR', '',
    FTable, '', buscas, True) then
    exit;

  try
    if Trim(pObs) = '' then
    begin
      vObsTemp := '';
      if not InputQuery('Observação do crédito para o CXL',
        'Informação para o Caixa Auxiliar', vObsTemp) then
        Exit;
    end
    else
      vObsTemp := Trim(pObs);

    if pRegistroAtual then
    begin
      dataSet.Edit;
      dataSet.FieldByName('OBS_PARACREDITO').AsString := vObsTemp;
      dataSet.Post;

      vDadosIni.GravaAuditoria('CAR027', 'ALTERAR', ' CODIGO ' + IntToStr(FCodigo) +
        ' OBS PARACREDITO: ' + dataSet.FieldByName('OBS_PARACREDITO').AsString, FTable,
        IntToStr(FCodigo), buscas);
    end
    else
    begin
    	try
      	dataSet.DisableControls;
        dataSet.first;
        while not dataSet.EOF do
        begin
          if dataSet.FieldByName('sel').AsString = 'S' then
          begin
            FCodigo := dataSet.FieldByName('cod_cred').AsInteger;

            dataSet.Edit;
            dataSet.FieldByName('OBS_PARACREDITO').AsString := vObsTemp;
            dataSet.Post;

            vDadosIni.GravaAuditoria('CAR027', 'ALTERAR', ' CODIGO ' + IntToStr(FCodigo) +
              ' OBS PARACREDITO: ' + dataSet.FieldByName('OBS_PARACREDITO').AsString, FTable,
              IntToStr(FCodigo), buscas);
          end;
          dataSet.next;
        end;
      finally
        dataSet.EnableControls;
      end;
    end;

    if dataSet.ChangeCount = 0 then
      exit;

    Apply;
    CommitaTransacao;
    Result := True;

    vDadosIni.GravaAuditoria('CAR027', 'ALTERAR', 'CONFIRMADA MODIFICACOES', FTable, '', buscas);

    Application.MessageBox('Operação concluída com sucesso', 'Atenção', 0 + 64);

  except
    on e: exception do
    begin
      RollBackTransacao;
      dataSet.Refresh;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TControleCredito._informarDataRealBaixa. Erro: ' + e.Message);
    end;
  end;
end;

function TControleCredito._informarObservacoes: Boolean;
begin
  vObs._selecionaObs(dataSet.FieldByName('cod_obs').AsInteger, dataSet.FieldByName('codigo_emp').AsInteger);
  _abreFormObservacoes;

end;

function TControleCredito._efetuarRecebimento: Boolean;
var
  vOK: Boolean;
  vdtSetTemp: TClientDataSet;
  vDocsTemp, vProcesso, vPrestacoesMarcadas: string;
  vlnListDoc: Integer;
  vlnListData: Integer;
  vListaDemarcados, vListaClientes: TStringList;
  I, vIntegerTemp: Integer;
  vNegCliente: TNegativacaoCliente;
  vHistPadraoUnificadas: string;
  vNaoRepetirMensagem: boolean;
  idConta: Integer;
  vListaClBarrarDesbarrar: TStringList;

{$REGION '_validarOutrosCreditosVencidos'}
  function _validarOutrosCreditosVencidos(pPrestacoesMarcadas: string; var pNaoRepetirMensagem: boolean): Boolean;
  var
    vMensagemUS, vHistAuditoria: string;
    vOK: Boolean;
    AMensagem: TStrings;
    frmConfCol: TForm;
    PanelAllClient: TPanel;
    MemoL: TMemo;
    PanelBottom: TPanel;
    BotaoSair: TBitBtn;
    CheckBoxNaoRepetirMens: TCheckBox;
  begin
    Result := True;
    pNaoRepetirMensagem := false;

    if dataSet.FieldByName('COD_CLIENTE').AsInteger = 0 then
      Exit;

    pPrestacoesMarcadas := StringReplace(pPrestacoesMarcadas, '||', ',', [rfReplaceAll]);
    pPrestacoesMarcadas := StringReplace(pPrestacoesMarcadas, '|', '', [rfReplaceAll]);
    pPrestacoesMarcadas := ' and not cr.cod_cred in ( ' + pPrestacoesMarcadas + ')';

    buscas.Close;
    buscas.SQL.Text := 'select cr.selec,cr.cod_cred,cr.n_doc_c,cr.cod_cliente,cr.Nome_c,cr.Valor_c,cr.data_venc_c,' +
      ' cr.vl_rq_pg_cxl,cr.status_cxl_rq,cr.dia_cxl,cr.op_cxl,cr.valor_corr,cr.valor_desc,cr.LOTE_CXL,' +
      ' cr.tp_rec_cxl,cr.cpfcgc,cr.juros_cob,cr.tp_doc_v,cr.N_doc_v,cr.CODIGO_EMP,cr.COD_EMP_MULT,cr.CODIGO_CTRL,' +
      ' cr.COONAOFISCAL,cr.US_CANCELOU,cr.DT_US_CANCELOU,cr.OBS_PARACREDITO,cr.CODIGO_VEND,cr.TIP_CNT,cr.NSERIEECF,cr.COD_TERMINAL' +
      ' from CONTROLE_CREDITOS cr inner join controles ctrl on cr.codigo_ctrl = ctrl.codigo_ctrl and cr.codigo_emp = ctrl.codigo_emp' +
      ' Where cr.dia_cxl is null and coalesce(ctrl.TP_PLANO, '''') <> ''C'' and coalesce(ctrl.TP_PLANO, '''') <> ''B'' and' +
      ' (cr.status_c is null or cr.status_c = '''') and' +
      ' (cr.op_cxl is null or cr.op_cxl = 0) ' +
      ' and cr.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = :cod_empresa' +
      ' and cr.data_venc_c < ' + QuotedStr(FormatDateTime('mm/dd/yyyy', dataSet.FieldByName('data_venc_c').AsDateTime)) +
      ' and cr.cod_cliente = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) + pPrestacoesMarcadas +
      ' order by cr.data_venc_c';
    buscas.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, dadosReceber.codigoUnificada, StrToInt(vDadosIni.codEmpresa));
    buscas.Open;

    if buscas.IsEmpty then
      Exit;

    buscas.FetchAll;

    AMensagem := TStringList.Create;
    AMensagem.Add('Prestação selecionada para baixa: ');
    AMensagem.Add('Doc: ' + Trim(dataSet.fieldbyname('N_DOC_C').AsString) + ' - Vencimento: ' + dataSet.fieldbyname('data_venc_c').AsString);
    AMensagem.Add('');
    AMensagem.Add('Cliente ' + Trim(dataSet.FieldByName('nome_c').AsString)  + ' selecionado possui' +
      IfThen(buscas.RecordCount > 1, ' prestações', ' prestação' +
      ' com vencimento anterior a prestação selecionada'));
    AMensagem.Add(IfThen(buscas.RecordCount > 1, 'Prestações Vencidas:', 'Prestação Vencida:'));

    vHistAuditoria := '';
    buscas.First;
    while not buscas.Eof do
    begin
      vMensagemUS := 'Doc: ' + Trim(buscas.fieldbyname('N_DOC_C').AsString) + ' - Vencimento: ' +buscas.fieldbyname('data_venc_c').AsString;
      AMensagem.Add(vMensagemUS);
      vHistAuditoria := vHistAuditoria + Trim(buscas.fieldbyname('N_DOC_C').AsString) + ',';
      buscas.Next;
    end;

    frmConfCol := TForm.Create(Application);
    frmConfCol.Width := 600;
    frmConfCol.Height := 400;
    frmConfCol.Position := poScreenCenter;
    frmConfCol.Caption := 'Atenção';

    PanelAllClient := TPanel.Create(frmConfCol);
    PanelAllClient.Parent := frmConfCol;
    PanelAllClient.Align := alClient;
    PanelAllClient.Caption := '';
    PanelAllClient.BevelOuter := bvNone;
    PanelAllClient.BorderWidth := 6;
    PanelAllClient.Name := 'ContentPanelListCreds999';
    
    MemoL := TMemo.Create(PanelAllClient);
    MemoL.Parent := PanelAllClient;
    MemoL.ReadOnly := True;
    MemoL.Align := alClient;
    MemoL.ScrollBars := ssVertical;
    MemoL.Name := 'Memo999';
    
    PanelBottom := TPanel.Create(PanelAllClient);
    PanelBottom.Parent := PanelAllClient;
    PanelBottom.Align := alBottom;
    PanelBottom.Caption := '';
    PanelBottom.BevelOuter := bvNone;
    PanelBottom.BevelKind := bkTile;
    PanelBottom.BorderWidth := 7;
    
    BotaoSair := TBitBtn.Create(PanelBottom);
    BotaoSair.Parent := PanelBottom;
    BotaoSair.Caption := '&Sair';
    BotaoSair.Align := alRight;
    BotaoSair.ModalResult := mrAbort;

    CheckBoxNaoRepetirMens := TCheckBox.Create(PanelBottom);
    CheckBoxNaoRepetirMens.Parent := PanelBottom;
    CheckBoxNaoRepetirMens.Caption := 'Não repetir mensagem para o mesmo cliente';
    CheckBoxNaoRepetirMens.Width := 233;
    CheckBoxNaoRepetirMens.Align := alLeft;
    CheckBoxNaoRepetirMens.Checked := _LerConfiguracoesRegistroBoolean('CheckBoxNaoRepetirMens');

    MemoL.Lines := AMensagem;

    frmConfCol.ShowModal;

    pNaoRepetirMensagem := CheckBoxNaoRepetirMens.Checked;
    _GravaConfiguracoesBoolean('CheckBoxNaoRepetirMens', CheckBoxNaoRepetirMens.Checked);

    FreeAndNil(BotaoSair);
    FreeAndNil(PanelBottom);
    FreeAndNil(MemoL);
    FreeAndNil(PanelAllClient);
    FreeAndNil(frmConfCol);

    //Application.MessageBox(PChar(AMensagem.Text), 'Atenção', MB_ICONEXCLAMATION + MB_OK);

    if not vDadosIni.PesqPros('CXL075', 'PERMITIR', 'N.DOC: '+ vHistAuditoria, 'CONTROLE_CREDITOS', vHistAuditoria, Buscas, True, True) then
      Result := False;
  end;

{$ENDREGION}

{$REGION '_validarMarcarItemParaRecebimento'}
  function _validarMarcarItemParaRecebimento: Boolean;
  var
    vOKValidacao: Boolean;
    vExisteCtrl: Boolean;
    Z: Integer;
  begin
    Result := False;
//    dataSet.RefreshRecord;
    _marcaLinha;
    vOKValidacao := True;

    if (dataSet.FieldByName('SEL').AsString = 'S') and (vOKValidacao) then
    begin
      if dadosReceber.codigoUnificada = 0 then
        dadosReceber.codigoUnificada := dataSet.FieldByName('cod_emp_mult').AsInteger
      else if (dadosReceber.codigoUnificada <> dataSet.FieldByName('cod_emp_mult').AsInteger) and
        (not dadosReceber.processamentoAutomatico) then
      begin
        vOKValidacao := False;
        vListaDemarcados.Add(IntToStr(dataSet.FieldByName('COD_CRED').AsInteger));
//        _desmarcaLinha;
        if Application.MessageBox(pchar('Documento selecionado pertence a Unificada: ' +
          dataSet.FieldByName('cod_emp_mult').AsString +
          ' diferente dos demais selecionados: ' + IntToStr(dadosReceber.codigoUnificada)
          + #13 +
          'Se continuar o documento será desmarcado. Deseja continuar mesmo assim?'),
          'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          Exit;
      end;
    end;

//  	if (dataSet.FieldByName('SEL').AsString = 'S') and (vOKValidacao) then
//    begin
//    	if dadosReceber.codigoControleSelecionados = 0 then
//        dadosReceber.codigoControleSelecionados := dataSet.FieldByName('codigo_ctrl').AsInteger;
//      else if (dadosReceber.codigoControleSelecionados <> dataSet.FieldByName('codigo_ctrl').AsInteger) and
//        (not dadosReceber.processamentoAutomatico) then
//      begin
//        vOKValidacao := False;
//        vListaDemarcados.Add(IntToStr(dataSet.FieldByName('COD_CRED').AsInteger));
////        _desmarcaLinha;
//        if Application.MessageBox(pchar('Documento selecionado controle: ' +
//          dataSet.FieldByName('codigo_ctrl').AsString +
//          ' diferente dos demais selecionados: ' + IntToStr(dadosReceber.codigoControleSelecionados)
//          + #13 +
//          'Se continuar o documento será desmarcado. Deseja continuar mesmo assim?'),
//          'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
//          Exit;
//      end;
//    end;

    if (dataSet.FieldByName('SEL').AsString = 'S') and (vOKValidacao) then
    begin
    	if dadosReceber.codigoControleSelecionados = 0 then
        dadosReceber.codigoControleSelecionados := dataSet.FieldByName('codigo_ctrl').AsInteger;

    	vExisteCtrl := False;
      for Z := Low(dadosReceber.codigosControleLanc) to High(dadosReceber.codigosControleLanc) do
      	if (dadosReceber.codigosControleLanc[Z] = dataSet.FieldByName('codigo_ctrl').AsInteger) then
        begin
        	dadosReceber.historicoLanc[Z] :=
          	dadosReceber.historicoLanc[Z] + ' ' + Trim(dataSet.FieldByName('n_doc_c').AsString) + ' ';

        	dadosReceber.valorLancSaida[Z] :=
          	dadosReceber.valorLancSaida[Z] + dataSet.FieldByName('valor_c').AsCurrency;

        	vExisteCtrl := True;
        	Break;
        end;

      if not vExisteCtrl then
      begin
        SetLength(dadosReceber.codigosControleLanc, Length(dadosReceber.codigosControleLanc) + 1);
        SetLength(dadosReceber.historicoLanc, Length(dadosReceber.codigosControleLanc));
        SetLength(dadosReceber.valorLancSaida, Length(dadosReceber.codigosControleLanc));

        dadosReceber.codigosControleLanc[High(dadosReceber.codigosControleLanc)] :=
        	dataSet.FieldByName('codigo_ctrl').AsInteger;

        dadosReceber.historicoLanc[High(dadosReceber.historicoLanc)]             :=
        	dadosReceber.historicoSaidaLancamentoIni + ' ' + Trim(dataSet.FieldByName('n_doc_c').AsString) + ' ';

        dadosReceber.valorLancSaida[High(dadosReceber.valorLancSaida)]           :=
        	dataSet.FieldByName('valor_c').AsCurrency;
      end;
    end;

    if (_documentoRecebidoOuSendoRecebido) and (vOKValidacao) then
    begin
      if dadosReceber.processamentoAutomatico then
        exit;
      vOKValidacao := False;
      vListaDemarcados.Add(IntToStr(dataSet.FieldByName('COD_CRED').AsInteger));
//      _desmarcaLinha;
      if
        Application.MessageBox(pchar('Se continuar o documento será desmarcado. Deseja continuar mesmo assim?'),
        'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;
    end;

    {if (not dadosReceber.usarValorCorrigido) and (dataSet.FieldByName('valor_c').AsCurrency <= 0) then
    begin

      _desmarcaLinha;
      if Application.MessageBox(pchar('Valor do Crédito menor ou igual a zero. Não pode ser recebido. Use o valor corrigido' + #13 +
        'Se continuar o documento será desmarcado. Deseja continuar mesmo assim?'),
        'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;

    end;}

    if (dataSet.FieldByName('SEL').AsString = 'S') and (not dadosReceber.processamentoAutomatico) and (vOKValidacao) then
    begin

      fRemoverDesconto := False;
      _corrigirValor(False);

      if (not dadosReceber.baixaParcial) and (not dadosReceber.referenteDevolucao) then
      begin
        if (dadosReceber.usarValorCorrigido) and (dataSet.FieldByName('valor_corr').AsCurrency <= 0) then
        begin
          vOKValidacao := False;
          vListaDemarcados.Add(IntToStr(dataSet.FieldByName('COD_CRED').AsInteger));
//          _desmarcaLinha;
          if
            Application.MessageBox(pchar('Valor para recebimento menor ou igual a zero (Valor Corrigido). Documento: ' +
            Trim(dataSet.FieldByName('n_doc_c').AsString) + #13 +
            'Se continuar o documento será desmarcado. Deseja continuar mesmo assim?'),
            'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
            Exit;
        end
        else if (not dadosReceber.usarValorCorrigido) and (dataSet.FieldByName('valor_c').AsCurrency
          <= 0) then
        begin
          vOKValidacao := False;
          vListaDemarcados.Add(IntToStr(dataSet.FieldByName('COD_CRED').AsInteger));
//          _desmarcaLinha;
          if
            Application.MessageBox(pchar('Valor para recebimento menor ou igual a zero (Valor Crédito). Documento: ' +
            Trim(dataSet.FieldByName('n_doc_c').AsString) + #13 +
            'Se continuar o documento será desmarcado. Deseja continuar mesmo assim?'),
            'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
            Exit;
        end;
      end;

    end;


    if (dataSet.FieldByName('SEL').AsString = 'S') and (vOKValidacao) then
    begin

      dataSet.Edit;
      dataSet.FieldByName('STATUS_CX').AsString := 'R';
      dataSet.FieldByName('OP_CX').AsInteger := vDadosIni.vCodUsuario;
      dataSet.Post;

      if Apply then
      begin
        CommitaTransacao;

        if dadosReceber.processamentoAutomatico then
        begin
          dadosReceber.valorOperacao := dadosReceber.valorOperacao +
            dataSet.FieldByName('valor_c').AsCurrency;
          dadosReceber.valorSaida := dadosReceber.valorSaida +
            dataSet.FieldByName('valor_c').AsCurrency;
          dadosReceber.somaValorContabil := dadosReceber.somaValorContabil +
            dataSet.FieldByName('valor_c').AsCurrency;
        end
        else if not dadosReceber.baixaParcial then
        begin

          if (dadosReceber.usarValorCorrigido) and (dataSet.FieldByName('valor_corr').AsCurrency > 0) then
            dadosReceber.valorOperacao := dadosReceber.valorOperacao +
              dataSet.FieldByName('valor_corr').AsCurrency
          else
            dadosReceber.valorOperacao := dadosReceber.valorOperacao +
              dataSet.FieldByName('valor_c').AsCurrency;

          dadosReceber.valorPrevisto := dadosReceber.valorPrevisto +
		        	dataSet.FieldByName('valor_c').AsCurrency;    

          dadosReceber.valorSaida := dadosReceber.valorSaida +
            dataSet.FieldByName('valor_c').AsCurrency;

          dadosReceber.somaValorContabil := dadosReceber.somaValorContabil +
            dataSet.FieldByName('vl_contabil').AsCurrency;
        end
        else if (dadosReceber.valorOperacao > dataSet.FieldByName('valor_c').AsFloat) then
        begin
          dadosReceber.valorSaida := dataSet.FieldByName('valor_c').AsFloat;
          if (dadosReceber.valorOperacao > dataSet.FieldByName('vl_contabil').AsFloat) then
            dadosReceber.somaValorContabil := dataSet.FieldByName('vl_contabil').AsCurrency
          else
            dadosReceber.somaValorContabil := dadosReceber.valorOperacao;
        end
        else
        begin
          dadosReceber.valorSaida := dadosReceber.valorOperacao;
          if (dadosReceber.valorOperacao > dataSet.FieldByName('vl_contabil').AsFloat) then
            dadosReceber.somaValorContabil := dataSet.FieldByName('vl_contabil').AsCurrency
          else
            dadosReceber.somaValorContabil := dadosReceber.valorOperacao;
        end;

        dadosReceber.historicoSaidaLancamento := dadosReceber.historicoSaidaLancamento + ' ' +
          Trim(dataSet.FieldByName('n_doc_c').AsString) + ' ';

        if (dadosReceber.lancarTaxaCartao) and (not dadosReceber.processamentoAutomatico) then
          if (vDadosIni.StrToFloatFormat(dataSet.FieldByName('valor_liquido').AsFloat,2) <
             vDadosIni.StrToFloatFormat(dataSet.FieldByName('valor_c').AsCurrency,2)) and
            (dataSet.FieldByName('valor_liquido').AsFloat > 0) then
          begin
            dadosReceber.valorSomaTaxaCartao := dadosReceber.valorSomaTaxaCartao +
              (dataSet.FieldByName('valor_c').AsCurrency - dataSet.FieldByName('valor_liquido').AsFloat);

            if dadosReceber.codigoControleTaxaCartao = 0 then
            begin
              buscas.Close;
              buscas.SQL.Text := 'select TAXA_CARTAO, N_CONTA_PLC_TX_CARTAO, CTRL_SAIDA_TX_CARTAO from controles' +
                ' where codigo_ctrl = ' + IntToStr(dadosReceber.codigoControleSelecionados) +
                ' and codigo_emp = ' + vDadosIni.codEmpresa;
              buscas.Open;

              dadosReceber.codigoControleTaxaCartao := buscas.FieldByName('CTRL_SAIDA_TX_CARTAO').AsInteger;
              dadosReceber.numContaTaxaCartao := buscas.FieldByName('N_CONTA_PLC_TX_CARTAO').AsFloat;

              if dadosReceber.codigoControleTaxaCartao = 0 then
              begin
                dadosReceber.lancarTaxaCartao := False;
                Application.MessageBox(pchar(
                  'Existem valores a serem lançados como taxa de cartão de crédito!' + #13 +
                  'Falta informar no cadastro do contole em qual banco será descontado o valor'),
                  'Atenção', 0 + 64);
                Exit;
              end;

              if dadosReceber.numContaTaxaCartao = 0 then
              begin
                dadosReceber.lancarTaxaCartao := False;
                Application.MessageBox(pchar(
                  'Existem valores a serem lançados como taxa de cartão de crédito!' + #13 +
                  'Falta informar no cadastro do contole em qual conta será descontado o valor'),
                  'Atenção', 0 + 64);
                Exit;
              end;

            end;
          end;

      end
      else
      begin

        dataSet.Cancel;

        vOKValidacao := False;
        vListaDemarcados.Add(IntToStr(dataSet.FieldByName('COD_CRED').AsInteger));
//        _desmarcaLinha;
        if dadosReceber.processamentoAutomatico then
        begin
          Application.MessageBox(pchar('Erro ao tentar marcar documento para recebimento. Documento: ' +
            Trim(dataSet.FieldByName('n_doc_c').AsString) + #13 +
            'O Processamento será cancelado. Verifique e tente novamente'),
            'Atenção', 0 + 64);
          exit;
        end;
        if
          Application.MessageBox(pchar('Erro ao tentar marcar documento para recebimento. Documento: '
          +
          Trim(dataSet.FieldByName('n_doc_c').AsString) + #13 +
          'Se continuar o documento será desmarcado. Deseja continuar mesmo assim?'),
          'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          Exit;
      end;

    end;

    if dadosReceber.processamentoAutomatico then
      Result := True
    else if dadosReceber.baixaParcial then
      Result := (dataSet.FieldByName('SEL').AsString = 'S') and (vOKValidacao)
    else
      Result := True;

  end;
{$ENDREGION}

begin
  try
    vListaClBarrarDesbarrar := TStringList.Create;
    vListaClBarrarDesbarrar.Sorted := True;
    vListaClBarrarDesbarrar.Duplicates := dupIgnore;
    vListaClBarrarDesbarrar.Clear;

    Result := False;

    if dadosReceber.baixaParcial then
      vProcesso := 'CAR036'
    else
      vProcesso := 'CAR035';

    if not vDadosIni.PesqPros(vProcesso, 'RECEBER', '', FTable, '', FBuscas2, True) then
      Exit;

    if ((vDadosIni.vCliente.Barramento.vBarraAutomaticamenteAposVencCrediario = 'S')
        and (vDadosIni.vCliente.Barramento.vCodigoBarrado > 0))
      or ((vDadosIni.vCliente.Barramento.vDesbarraAutomaticamenteAposQuitCrediario = 'S')
        and (vDadosIni.vCliente.Barramento.vCodigoDesbarrado > 0)) then
    begin
      try
        dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
          if (dataSet.FieldByName('SEL').AsString = 'S')
          	and (dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
          begin
            if (vDadosIni.vEmp.vFinanceiroUnificado)
              and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
            begin
              if trim(dataSet.FieldByName('CPFCGC').AsString) <> '' then
            	  vListaClBarrarDesbarrar.Add(trim(dataSet.FieldByName('CPFCGC').AsString));
            end
            else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
              vListaClBarrarDesbarrar.Add(IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger));
          end;

          dataSet.Next;
        end;
      finally
        dataSet.EnableControls;
      end;
    end;

    if not vDadosIni.vContrapartida then
    begin
      if not dadosReceber.processamentoAutomatico then
        if dataSet.IsEmpty then
          Exit;

      dadosReceber.valorOperacao := 0;
      dadosReceber.valorPrevisto := 0;
      dadosReceber.valorSaida := 0;
      dadosReceber.historicoSaida := '';
      dadosReceber.codigoControleSelecionados := 0;
      dadosReceber.codigoUnificada := 0;
      dadosReceber.codigoEmpresa := 0;
      dadosReceber.valorAtingido := 0;
      dadosReceber.valorDinheiro := 0;
      dadosReceber.valorCheque := 0;
      dadosReceber.valorCredito := 0;
      dadosReceber.valorRecibos := 0;
      dadosReceber.valorAtingido := 0;
      dadosReceber.valorSomaTaxaCartao := 0;
      dadosReceber.numContaTaxaCartao := 0;
      dadosReceber.codigoControleTaxaCartao := 0;
      dadosReceber.somaValorContabil := 0;
      dadosReceber.referenteDevolucao := False;

      SetLength(dadosReceber.codigosControleLanc, 0);
      SetLength(dadosReceber.historicoSaida, 0);
      SetLength(dadosReceber.valorLancSaida, 0);

      if dadosReceber.codigoUnificadaBxCartao > 0 then
        dadosReceber.codigoUnificada := dadosReceber.codigoUnificadaBxCartao;
      if dadosReceber.processamentoAutomaticoDev then
        dadosReceber.referenteDevolucao := dadosReceber.processamentoAutomaticoDev;
      dadosReceber.referenteCTP := False;
      if not dadosReceber.processamentoAutomatico then
        if not dadosReceber.baixaParcial then
         dadosReceber.referenteDevolucao := Application.MessageBox('Baixa Ref. Devolucao de Mercadoria?',
           'Confirmação',
           MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES;

      vDadosIni.abreStatusProcessamento('', 'Iniciando variaveis');

      if (not dadosReceber.referenteDevolucao) and (not dadosReceber.processamentoAutomatico) then
      begin
        if dadosReceber.baixaParcial then
        begin
          dadosReceber.historicoSaidaLancamentoIni := 'PAGAMENTO PARCIAL - ' +
            Trim(dataSet.FieldByName('tipo_doc_c').AsString) + ' ';
          dadosReceber.historicoSaidaLancamento    := dadosReceber.historicoSaidaLancamentoIni;

          dadosReceber.nomeHistoricoSaida := Trim(dataSet.FieldByName('Nome_c').AsString);
          fRemoverDesconto := False;
          _corrigirValor(False);
        end
        else
        begin
          dadosReceber.historicoSaidaLancamentoIni := 'SAIDA CHQ/CREDITOS ';
          dadosReceber.historicoSaidaLancamento    := dadosReceber.historicoSaidaLancamentoIni;

          try
            dataSet.DisableControls;
            dataSet.First;
            while not dataSet.Eof do
            begin
              if dataSet.FieldByName('sel').AsString = 'S' then
              begin
                dadosReceber.nomeHistoricoSaida := Trim(dataSet.FieldByName('Nome_c').AsString);
                Break;
              end;
              dataSet.Next;
            end;
          finally
            dataSet.EnableControls;
          end;
        end;
        vDadosIni.definirDiaFinanceiroFechado(buscas);
        vDadosIni.fechaStatusProcessamento;
        if not _abreFormDadosParaBaixa then
        begin
          Result := False;
          Exit;
        end;
        if dadosReceber.baixaParcial then
        begin
          dadosReceber.usarValorCorrigido := True;
          dadosReceber.lancarDesconto := False;
          dadosReceber.lancarJuros := False;
        end;

      end
      else if (not dadosReceber.processamentoAutomatico) then
      begin
        try
          dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
            if dataSet.FieldByName('sel').AsString = 'S' then
            begin
              dadosReceber.nomeHistoricoSaida := Trim(dataSet.FieldByName('Nome_c').AsString);
              Break;
            end;
            dataSet.Next;
          end;
        finally
          dataSet.EnableControls;
        end;

        dadosReceber.historicoSaidaLancamentoIni := 'DEVOLUCAO VENDA ';
        dadosReceber.historicoSaidaLancamento    := dadosReceber.historicoSaidaLancamentoIni;

        vDadosIni.abreForm('Selecione os dados para saída', frmCadContasAReceber.pnDadosBaixaDevolv, frmCadContasAReceber.tsDesconto);

        if not vDadosIni.PesqPros('CAR064', 'RECEBER', '', FTable, '', FBuscas2, True) then
          Exit;
      end
      else if (dadosReceber.processamentoAutomatico) and (dadosReceber.referenteDevolucao) then
      begin
        try
          dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
            if dataSet.FieldByName('sel').AsString = 'S' then
            begin
              dadosReceber.nomeHistoricoSaida := Trim(dataSet.FieldByName('Nome_c').AsString);
              Break;
            end;
            dataSet.Next;
          end;
        finally
          dataSet.EnableControls;
        end;

        dadosReceber.historicoSaidaLancamentoIni := 'DEVOLUCAO VENDA ';
        dadosReceber.historicoSaidaLancamento    := dadosReceber.historicoSaidaLancamentoIni;
      end;
    end;

    vDadosIni.abreStatusProcessamento('', 'Iniciando variaveis');

    if vReceb = nil then
      vReceb := TRecebimento.create;

    if not dadosReceber.processamentoAutomatico then
    begin
      _definirDataSetRecebimento;
      fRecebimento.EmptyDataSet;
    end;

    vReceb.vCh.dataSet := TClientDataSet(fRecebimento);
    vReceb.vCr.dataSet := TClientDataSet(fRecebimento);

    if not dadosReceber.processamentoAutomatico then
      _definirContasDeSaida;

    conta.dadosReceber.historicoSaida := 'ENTRADA DINHEIRO CONFORME CREDITO ACIMA';


    try

      try
        dataSet.FieldByName('RAZAO').OnGetText := nil;
        dataSet.FieldByName('NOME_C').OnGetText := nil;
        vdtSetTemp := dataSet;

        if not vDadosIni.vContrapartida then
        begin
          vDadosIni.abreStatusProcessamento('', 'Somando valores e marcando registros');

    {$REGION 'soma e validacao dos registros'}
          if (not dadosReceber.baixaParcial) or (dadosReceber.processamentoAutomatico) then
          begin
            //if not dadosReceber.referenteDevolucao then
            begin
              vListaDemarcados := TStringList.Create;
              vListaDemarcados.Clear;

              try
                dataSet.DisableControls;
                dataSet.First;
                while not dataSet.Eof do
                begin
                  if (dataSet.FieldByName('SEL').AsString = 'S') then
                    if not _validarMarcarItemParaRecebimento then
                    begin
      //                if dadosReceber.processamentoAutomatico then
      //                begin
                        dataSet.CancelUpdates;
                        RollBackTransacao;
      //                end;
                      Exit;
                    end;

                  dataSet.Next;
                end;
              finally
                dataSet.EnableControls;
              end;

              try
                for I := 0 to vListaDemarcados.Count - 1 do
                  if (Trim(vListaDemarcados[i]) <> '') and (TryStrToInt(vListaDemarcados[i], vIntegerTemp)) then
                  begin
                    dataSet.Filter := 'COD_CRED = ' + Trim(vListaDemarcados[i]);
                    dataSet.Filtered := true;

                    _desmarcaLinha;

                  end;

                if not dadosReceber.processamentoAutomatico then
                begin
                  dataSet.Filter := 'SEL = ''S'' ';
                  dataSet.Filtered := true;
                  vListaClientes := TStringList.Create;
                  vListaClientes.Sorted := True;
                  vListaClientes.Duplicates := dupIgnore;
                  vPrestacoesMarcadas := '';
                  try
                    dataSet.DisableControls;
                    dataSet.First;
                    while not dataSet.Eof do
                    begin
                      vPrestacoesMarcadas := vPrestacoesMarcadas + '|' + IntToStr(dataSet.FieldByName('cod_cred').AsInteger) + '|';
                      if dataSet.FieldByName('cod_cliente').AsInteger > 0 then
                        vListaClientes.Add(IntToStr(dataSet.FieldByName('cod_cliente').AsInteger));
                      dataSet.Next;
                    end;
                  finally
                    dataSet.EnableControls;
                  end;

                  for I := 0 to vListaClientes.Count - 1 do
                  begin
                    dataSet.Filter := 'SEL = ''S'' and COD_CLIENTE = ' + vListaClientes[I];
                    dataSet.Filtered := true;
                    vNaoRepetirMensagem := false;

                    try
                      dataSet.DisableControls;
                      dataSet.First;
                      while not dataSet.Eof do
                      begin
                        if not _validarOutrosCreditosVencidos(vPrestacoesMarcadas, vNaoRepetirMensagem) then
                        begin
                          dataSet.CancelUpdates;
                          RollBackTransacao;
                          Exit;
                        end;
                        if vNaoRepetirMensagem then
                          Break;
                        dataSet.Next;
                      end;
                    finally
                      dataSet.EnableControls;
                    end;
                  end;
                end;

              finally
                dataSet.Filtered := False;
                dataSet.Filter := '';
              end;
            end;
          end
          else if not _validarMarcarItemParaRecebimento then
            Exit;
        end;

        dadosReceber.valorAInformar := dadosReceber.valorOperacao;

        if not dadosReceber.processamentoAutomatico then
          if not dadosReceber.referenteDevolucao then
            if dadosReceber.valorOperacao <= 0 then
              raiseExceptionCreate('Nenhum registro foi selecionado!', '');

    {$ENDREGION}
          if not dadosReceber.processamentoAutomatico then
          begin
            if (not dadosReceber.referenteDevolucao) and (not vDadosIni.vContrapartida) then
            begin
              idConta := fint('COD_CRED');
              verificaRecibo;
              dataSet.Locate('COD_CRED', idConta, []);
            end;

            vReceb.vRecibo._selecionaRecibosAtencipados(dadosReceber.codigoUnificada);
          end;

          vDadosIni.fechaStatusProcessamento;

          vReceb.vCh.dadosReceber.codigoUnificada := dadosReceber.codigoUnificada;
          vReceb.vCr.dadosReceber.codigoUnificada := dadosReceber.codigoUnificada;


  {$REGION 'abertura do formulario'}
        if (not dadosReceber.referenteDevolucao) and (not dadosReceber.processamentoAutomatico) then
        begin
          vCtrl._abreTodosControlesCAR(vDadosIni.vContrapartida, dadosReceber.codigoUnificada);
          if vDadosIni.vContrapartida then
             if vCtrl.IsEmpty then
              Application.MessageBox('Nenhum controle configurado para exibir na contrapartida', 'Atenção', 0 + 64);

          vCtrl.dataSet.First;
          vPCont._abrePContasLanc('S');
        
          vReceb.vCh.DataSource.DataSet := fRecebimento;
          vReceb.vCr.DataSource.DataSet := fRecebimento;
          FDataSource.DataSet := fRecebimento;
          dataSet := fRecebimento;

          vOK := _abreFormReceber;
        end
        else if dadosReceber.processamentoAutomatico then
        begin                     
          vCtrl._abreTodosControlesCAR;
          vCtrl.dataSet.First;
          vPCont._abrePContasLanc('S');

          vReceb.vCh.DataSource.DataSet := fRecebimento;
          vReceb.vCr.DataSource.DataSet := fRecebimento;
          FDataSource.DataSet := fRecebimento;
          dataSet := fRecebimento;

          vOK := True;
        end
        else
          vOK := True;

  {$ENDREGION}

        vDadosIni.abreStatusProcessamento('', 'Quitando documentos selecionados');

  {$REGION 'chamada de metodos para baixa dos documentos'}

        dataSet := vdtSetTemp;

        if not vOK then
          Exit;

        if vDadosIni.vContrapartida then
        begin
          vReceb.create(transacao);
          Self.create(transacao);
        end
        else
        begin
          vReceb.create;
          Self.create;
        end;

        vDadosIni.definirDiaFinanceiroFechado(buscas);

        try
          vLancL := TLancamentosImp.create;
          vContLigL := TContaLigacaoImp.create;

          vLancL._setTransactionComponentes(transacao);
          vContLigL._AbrirContadeLigacao(True);

          if not _quitarRegistrosSelecionados then
          begin
            RollBackTransacao;
            Exit;
          end;

          vDadosIni.abreStatusProcessamento('', 'Incluíndo entradas geradas pela quitação');

          if not _confirmarLancamentosRecebimento then
          begin
            RollBackTransacao;
            Exit;
          end;

          if not _validaValoresBaixaCartao then
          begin
            RollBackTransacao;
            Exit;
          end;

          CommitaTransacao;
          Result := True;

          if (dadosReceber.baixaParcial) and
            (Trim(dataSet.FieldByName('STATUS_C').AsString) <> 'QUITADO') and
            (not dadosReceber.processamentoAutomatico) then
          begin
            _corrigirValor(False);
            CommitaTransacao;
            Application.MessageBox(pchar('Valor da parcela para recebimento parcial foi corrigido para:' + #13 +
              format('%m', [dataSet.FieldByName('VALOR_CORR').AsFloat])), 'Atenção', 0 + 64);
          end;

          vDadosIni.GravaAuditoria(vProcesso, 'ALTERAR', 'SUCESSO NAS QUITACOES', FTable, '', buscas);

        finally
          vLancL._setTransactionComponentes(nil);
          vContLigL.Free;
          vLancL.Free;

          vContLigL:= nil;
          vLancL := nil;
        end;

  {$ENDREGION}
        if not vDadosIni.vContrapartida then
        begin
          vDadosIni.abreStatusProcessamento('', 'Verificando remoção de negativação');

    {$REGION 'desnegativação de cliente'}

          if (vDadosIni.vEmp.vUsarBarramento = 'S') and (not dadosReceber.processamentoAutomatico) then
          begin

            FBuscas2.Close;
            FBuscas2.SQL.Text := 'select distinct cod_cliente, cod_emp_mult from controle_cheque cc' +
              ' inner join controles c on cc.codigo_ctrl = c.codigo_ctrl and cc.codigo_emp = c.codigo_emp' +
              ' and c.barrar_automatico = ''S''' +
              ' where cc.codigo_emp = ' + vDadosIni.codEmpresa +
              ' and cc.datq_ch = :datq_c' +
              ' and cc.status_ch = ''QUITADO''' +
              ' union' +
              ' select distinct cod_cliente, cod_emp_mult from controle_creditos cc' +
              ' inner join controles c on cc.codigo_ctrl = c.codigo_ctrl and cc.codigo_emp = c.codigo_emp' +
              ' and c.barrar_automatico = ''S''' +
              ' where cc.codigo_emp = ' + vDadosIni.codEmpresa +
              ' and cc.datq_c = :datq_c' +
              ' and cc.status_c = ''QUITADO''';
            FBuscas2.ParamByName('datq_c').AsDate := vDadosIni.diaFFinanceiro + 1;
            FBuscas2.Open;

            while not FBuscas2.Eof do
            begin
              vNegCliente := TNegativacaoCliente.create(buscas.Transaction, FDocs);
              vNegCliente.dados.acao := naDesnegativa;
              vNegCliente.dados.alterarConta := True;
              vNegCliente.dados.alterarContaStatus := nacsAmbos; // contas quitadas pois os creditos ja foram quitados neste momento
              vNegCliente.dados.codConta := 0; // 0 pois o importante aqui é o cliente
              vNegCliente.dados.loteQuit := 0; // 0 pois o importante aqui é o cliente
              vNegCliente.dados.codCliente := FBuscas2.FieldByName('cod_cliente').AsInteger; // cliente do credito
              vNegCliente.dados.codigoUnificada := FBuscas2.FieldByName('cod_emp_mult').AsInteger;
              if not vNegCliente.executar then
                raiseExceptionCreate(vNegCliente.MsgErro, '');
              FBuscas2.Next;
            end;
            CommitaTransacao;

          end;

          try
            vLancL := TLancamentosImp.create;
            vLancL._setTransactionComponentes(transacao);
            if vDadosIni.vEmp.vFinanceiroUnificado then
            begin
              FBuscas2.Close;
              FBuscas2.SQL.Text := 'select cod_empresa from empresa';
              FBuscas2.Open;

              FBuscas2.First;
              while not FBuscas2.Eof do
              begin
                if vDadosIni.empresaEstaUnificada(FBuscas2.FieldByName('cod_empresa').AsInteger) then
                  vLancL._verificarDesbarramentoCliente(FBuscas2.FieldByName('cod_empresa').AsInteger);
                FBuscas2.Next;
              end;
            end
            else
              vLancL._verificarDesbarramentoCliente(StrToInt(vDadosIni.codEmpresa));

            CommitaTransacao;

          finally
            vLancL._setTransactionComponentes(nil);
            vLancL.Free;
            vLancL := nil;
          end;

    {$ENDREGION}

          vDadosIni.fechaStatusProcessamento;
        end;

  {$REGION 'impressão de recibos'}
        if not dadosReceber.processamentoAutomatico then
        begin
          if vDadosIni.vContrapartida then
            vOK := false
          else if not dadosReceber.referenteDevolucao then
            vOK := Application.MessageBox('Imprimir Recibo?', 'Confirmação', MB_ICONQUESTION +
              MB_YESNO) = IDYES
          else
            vOK := false;

          if not vOK then
            Exit;

          vReceb.vCr.vBx._selecionaBaixaCreditosPeloLoteQuit(dadosReceber.loteQuitacao);

          vOK := False;

          if not vReceb.vCr.vBx.dataSet.IsEmpty then
            vOK := Application.MessageBox('Imprimir em um único Recibo por Cliente?', 'Confirmação',
              MB_ICONQUESTION + MB_YESNO) = IDYES;

          if vOK then
          begin

            //vReceb.vCr.dadosRecibo.codClienteDoRecibo := 0;
            vReceb.vCr.dadosRecibo.qtde := 0;
            vReceb.vCr.dadosRecibo.valorRecibo := 0;
            vReceb.vCr.dadosRecibo.codClienteDoRecibo :=
              vReceb.vCr.vBx.dataSet.FieldByName('cod_cliente').AsInteger;
            vlnListDoc := 0;
            vlnListData := 0;
            vReceb.vCr.dadosRecibo.docDoReciboL.Add('');
            vReceb.vCr.dadosRecibo.dataVencRecibosL.Add('');
            vReceb.vCr.dadosRecibo.docDoRecibo := '';

            try
              vReceb.vCr.vBx.dataSet.DisableControls;
              vReceb.vCr.vBx.dataSet.First;
              while not vReceb.vCr.vBx.dataSet.Eof do
              begin
                //          if vReceb.vCr.dadosRecibo.codClienteDoRecibo = 0 then
                //            vReceb.vCr.dadosRecibo.codClienteDoRecibo := vReceb.vCr.vBx.dataSet.FieldByName('cod_cliente').AsInteger;

                if vReceb.vCr.dadosRecibo.codClienteDoRecibo <>
                  vReceb.vCr.vBx.dataSet.FieldByName('cod_cliente').AsInteger then
                begin
                  vReceb.vCr._imprimirRecibo;
                  vlnListDoc := 0;
                  vlnListData := 0;
                  vReceb.vCr.dadosRecibo.qtde := 0;
                  vReceb.vCr.dadosRecibo.valorRecibo := 0;
                  vReceb.vCr.dadosRecibo.docDoReciboL.Add('');
                  vReceb.vCr.dadosRecibo.dataVencRecibosL.Add('');
                  vReceb.vCr.dadosRecibo.docDoRecibo := '';
                end;
                //else
                begin
                  vReceb.vCr.dadosRecibo.qtde := vReceb.vCr.dadosRecibo.qtde + 1;
                  if vReceb.vCr.dadosRecibo.qtde = 1 then
                    vReceb.vCr.dadosRecibo.docDoRecibo := 'Lote ' + Trim(vReceb.vCr.vBx.dataSet.FieldByName('lote_quit').AsString);

                  vReceb.vCr.dadosRecibo.codClienteDoRecibo :=
                    vReceb.vCr.vBx.dataSet.FieldByName('cod_cliente').AsInteger;
                  vReceb.vCr.dadosRecibo.nomeClienteRecibo :=
                    Trim(vReceb.vCr.vBx.dataSet.FieldByName('NOME_C').AsString);

                  vReceb.vCr.dadosRecibo.docDoReciboL[vlnListDoc] := vReceb.vCr.dadosRecibo.docDoReciboL[vlnListDoc] + Trim(vReceb.vCr.vBx.dataSet.FieldByName('N_DOC_C').AsString) + ' / ';
                  vReceb.vCr.dadosRecibo.dataVencRecibosL[vlnListData] := vReceb.vCr.dadosRecibo.dataVencRecibosL[vlnListData] + vReceb.vCr.vBx.dataSet.FieldByName('DATA_VENC_C').AsString + ' - ';
                  if Length(vReceb.vCr.dadosRecibo.docDoReciboL[vlnListDoc]) >= 75 then
                  begin
                    vReceb.vCr.dadosRecibo.docDoReciboL[vlnListDoc] := Copy(vReceb.vCr.dadosRecibo.docDoReciboL[vlnListDoc], 1, Length(vReceb.vCr.dadosRecibo.docDoReciboL[vlnListDoc]) - 3);
                    vReceb.vCr.dadosRecibo.docDoReciboL.Add('');
                    vlnListDoc := vlnListDoc + 1;
                  end;
                  if Length(vReceb.vCr.dadosRecibo.dataVencRecibosL[vlnListData]) >= 75 then
                  begin
                    vReceb.vCr.dadosRecibo.dataVencRecibosL[vlnListData] := Copy(vReceb.vCr.dadosRecibo.dataVencRecibosL[vlnListData], 1, Length(vReceb.vCr.dadosRecibo.dataVencRecibosL[vlnListData]) - 3);
                    vReceb.vCr.dadosRecibo.dataVencRecibosL.Add('');
                    vlnListData := vlnListData + 1;
                  end;

      //            vReceb.vCr.dadosRecibo.docDoRecibo :=
      //              vReceb.vCr.dadosRecibo.docDoRecibo +
      //              Trim(vReceb.vCr.vBx.dataSet.FieldByName('N_DOC_C').AsString) + ' / ';
      //            vReceb.vCr.dadosRecibo.dataVencRecibos := vReceb.vCr.dadosRecibo.dataVencRecibos +
      //              vReceb.vCr.vBx.dataSet.FieldByName('DATA_VENC_C').AsString + ' - ';
                  vReceb.vCr.dadosRecibo.valorRecibo := vReceb.vCr.dadosRecibo.valorRecibo +
                    vReceb.vCr.vBx.dataSet.FieldByName('VL_RECIBO').AsFloat;
                end;
                vReceb.vCr.vBx.dataSet.Next;
              end;
            finally
              vReceb.vCr.vBx.dataSet.EnableControls;
            end;
          
            if copy(vReceb.vCr.dadosRecibo.docDoReciboL[vReceb.vCr.dadosRecibo.docDoReciboL.Count- 1],
              Length(vReceb.vCr.dadosRecibo.docDoReciboL[vReceb.vCr.dadosRecibo.docDoReciboL.Count- 1]) - 1, 1) = '/' then
    //        if Length(vReceb.vCr.dadosRecibo.docDoReciboL[vReceb.vCr.dadosRecibo.docDoReciboL.Count- 1]) >= 75 then
              vReceb.vCr.dadosRecibo.docDoReciboL[vReceb.vCr.dadosRecibo.docDoReciboL.Count- 1] :=
                Copy(vReceb.vCr.dadosRecibo.docDoReciboL[vReceb.vCr.dadosRecibo.docDoReciboL.Count- 1], 1,
                Length(vReceb.vCr.dadosRecibo.docDoReciboL[vReceb.vCr.dadosRecibo.docDoReciboL.Count- 1]) - 3);
            if copy(vReceb.vCr.dadosRecibo.dataVencRecibosL[vReceb.vCr.dadosRecibo.dataVencRecibosL.Count- 1],
              Length(vReceb.vCr.dadosRecibo.dataVencRecibosL[vReceb.vCr.dadosRecibo.dataVencRecibosL.Count- 1]) - 1, 1) = '-' then
    //        if Length(vReceb.vCr.dadosRecibo.dataVencRecibosL[vReceb.vCr.dadosRecibo.dataVencRecibosL.Count - 1]) >= 75 then
              vReceb.vCr.dadosRecibo.dataVencRecibosL[vReceb.vCr.dadosRecibo.dataVencRecibosL.Count - 1] :=
                Copy(vReceb.vCr.dadosRecibo.dataVencRecibosL[vReceb.vCr.dadosRecibo.dataVencRecibosL.Count - 1], 1,
                Length(vReceb.vCr.dadosRecibo.dataVencRecibosL[vReceb.vCr.dadosRecibo.dataVencRecibosL.Count - 1]) - 3);
            vReceb.vCr._imprimirRecibo;

          end
          else
          begin
            try
              vDocsTemp := FDocs;
              FDocs := 'S2';
              _abreFormDetalhes(True);
            finally
              FDocs := vDocsTemp;
            end;
          end;
        end;

  {$ENDREGION}

      finally

  {$REGION 'codigo finally'}

        vDadosIni.abreStatusProcessamento('', 'Finalizando. Aguarde');

        dataSet := TClientDataSet(dtmContasAReceber.cdsCtrlCr); //vdtSetTemp;
        FDataSource.DataSet := dataSet;
        fRecebimento.Free;
        fRecebimento := nil;

        dataSet.FieldByName('RAZAO').OnGetText := dataSetNomeRazaoGetText;
        dataSet.FieldByName('NOME_C').OnGetText := dataSetNomeRazaoGetText;
        dataSet.FieldByName('CPFCGC').OnGetText := dataSetNomeRazaoGetText;

        if not vDadosIni.vContrapartida then
        begin
          //remover o status de recebimento
          try
            dataSet.DisableControls;
            dataSet.First;
            while not dataSet.Eof do
            begin
              if (dataSet.FieldByName('SEL').AsString = 'S') and
              (Trim(dataSet.FieldByName('STATUS_CX').AsString) <> '') and
              (Trim(dataSet.FieldByName('OP_CX').AsString) <> '') then
              begin
                dataSet.Edit;
                dataSet.FieldByName('STATUS_CX').Value := Null;
                dataSet.FieldByName('OP_CX').Value := Null;
                dataSet.Post;

                if Apply then
                  CommitaTransacao
                else
                begin

                  dataSet.Cancel;

                  Application.MessageBox(pchar('Não foi possível desmarcar o documento do recebimento.'
                    + #13 +
                    'Efetue o estorno para desmarcar o documento'),
                    'Atenção', 0 + 64);
                end;

              end;

              dataSet.Next;
            end;
          finally
            dataSet.EnableControls;
          end;

          if not dadosReceber.processamentoAutomatico then
          begin
            dataSet.Close;
            dataSet.Open;
    //        _consulta;
          end;
        end;

        vDadosIni.fechaStatusProcessamento;

  {$ENDREGION}

      end;

    except on E: Exception do
      begin
        RollBackTransacao;
        vDadosIni.GravaAuditoria(vProcesso, 'ALTERAR', 'FALHA NAS QUITACOES', FTable, '', buscas);
        Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('function TControleCredito._iniciaRecebimento. Erro: ' + e.Message);
        verificaErroDataSetOpen(E.Message);
      end;
    end;
  finally
  	if vListaClBarrarDesbarrar.Count > 0 then
    begin
      for I := 0 to vListaClBarrarDesbarrar.Count - 1 do
      begin
        if trim(vListaClBarrarDesbarrar[I]) <> '' then
        begin
          if vDadosIni.vEmp.vFinanceiroUnificado then
            vDadosIni.negativarClientes(0, trim(vListaClBarrarDesbarrar[I]))
          else
            vDadosIni.negativarClientes(StrToInt(vListaClBarrarDesbarrar[I]), '');
        end;
      end;
    end;

    if Assigned(vListaClBarrarDesbarrar) then
      FreeAndNil(vListaClBarrarDesbarrar);
  end;
end;

function TControleCredito._modificarDataValorComissao: Boolean;
begin

  if vBx.dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CAR053', 'ALTERAR', ' COD CRED' +
    vBx.dataSet.FieldByName('SEQ_BXCRED').AsString +
    ' DATA ' + vBx.dataSet.FieldByName('DT_BAIXA_COMISSAO').AsString +
    ' VALOR ' + Format('%0.2f', [vBx.dataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat]),
    'BAIXA_CREDITOS',
    vBx.dataSet.FieldByName('SEQ_BXCRED').AsString, FBuscas2, True) then
    Exit;

  try

    vBx.dataSet.Edit;
    if vBx.dataSet.State = dsEdit then
      if _abreFormComissao then
      begin

        vBx.dataSet.Post;
        vBx.Apply;
        CommitaTransacao;

        vDadosIni.GravaAuditoria('CAR053', 'ALTERAR', ' SUCESSO' +
        	' COD CRED' + vBx.dataSet.FieldByName('SEQ_BXCRED').AsString +
          ' DATA ' + vBx.dataSet.FieldByName('DT_BAIXA_COMISSAO').AsString +
          ' VALOR ' + Format('%0.2f', [vBx.dataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat]),
          'BAIXA_CREDITOS',
          vBx.dataSet.FieldByName('SEQ_BXCRED').AsString, FBuscas2);
      end;

    vBx.dataSet.Cancel;

  except
    on E: Exception do
    begin
      RollBackTransacao;
      Result := False;
      Application.MessageBox(pchar('Erro na operação. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TControleCredito._modificarDataValorComissao. Erro: ' + e.Message);
    end;
  end;

end;

function TControleCredito._mudarControleOuVoltarParaAtivo: Boolean;
var
  vMudarControle, vVoltarParaAtivo: Boolean;
  vHistorico, vCaptionForm, vCaptionPanel, vOperacao: string;
  vCodEmpMult, I, vCodigoGenCodigo: Integer;
  vCodigoControleOr, vCodigoControleDest: Integer;
  vNomeControleOr, vNomeControleDest: string;
  vTipoPlanoOr, vTipoPlanoDest: string;
  vCartaoSpedOr, vCartaoSpedDest: Integer;
  vNumLoteQuitacao: Integer;
  vNegCliente: TNegativacaoCliente;
  vCodMaxBaixaCred: Integer;
  vListaClBarrarDesbarrar: TStringList;
begin
  try
  	vListaClBarrarDesbarrar := TStringList.Create;
    vListaClBarrarDesbarrar.Sorted := True;
    vListaClBarrarDesbarrar.Duplicates := dupIgnore;
    vListaClBarrarDesbarrar.Clear;

    Result := False;

    if dataSet.IsEmpty then
      Exit;

    if not vDadosIni.PesqPros('CAR018', 'INCLUIR', 'NUM DOC ' +
      Trim(dataSet.FieldByName('N_DOC_C').AsString) +
      ' ' + dataSet.FieldByName('NOME_C').AsString, FTable,
      dataSet.FieldByName('COD_CRED').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString),
      FBuscas2, True) then
      Exit;

    if not vDadosIni.VerificarinicioFechFinan(buscas) then
      exit;

    if ((vDadosIni.vCliente.Barramento.vBarraAutomaticamenteAposVencCrediario = 'S')
        and (vDadosIni.vCliente.Barramento.vCodigoBarrado > 0))
      or ((vDadosIni.vCliente.Barramento.vDesbarraAutomaticamenteAposQuitCrediario = 'S')
        and (vDadosIni.vCliente.Barramento.vCodigoDesbarrado > 0)) then
    begin
    	if (dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
      begin
        if (vDadosIni.vEmp.vFinanceiroUnificado)
          and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
        begin
        	if trim(dataSet.FieldByName('CPFCGC').AsString) <> '' then
          	vListaClBarrarDesbarrar.Add(trim(dataSet.FieldByName('CPFCGC').AsString));
        end
        else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
          vListaClBarrarDesbarrar.Add(IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger));
      end;
    end;

    vMudarControle := Trim(dataSet.FieldByName('STATUS_C').AsString) = '';
    vVoltarParaAtivo := not vMudarControle;

    if vVoltarParaAtivo then
    begin
      if Application.MessageBox('Deseja Voltar Controle para o Ativo?', 'Confirmação',
        MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;
    end
    else if _documentoRecebidoOuSendoRecebido then
      Exit;

    vHistorico := '';
    if vMudarControle then
    begin
      if _verificadocrecebidoparcial then
      begin
        Application.MessageBox('Crédito já possui baixa parcial. Não permitido mudar de controle','Atenção', 0 + 64);
        exit;
      end;

      vCaptionForm := 'Mudar Crédito para outro Controle';
      vCaptionPanel := 'Selecione o controle e informe o Histórico';
      vOperacao := 'MUDAR CONTROLE';
    end
    else
    begin
      vCaptionForm := 'Voltar Crédito para o Ativo';
      vCaptionPanel := 'Selecione o controle e informe o Histórico';
      vOperacao := 'VOLTAR PARA ATIVO';
    end;

    vDadosIni.definirDiaFinanceiroFechado(buscas);

    vCtrl._selecionaControle(dataSet.FieldByName('codigo_ctrl').AsInteger,
      dataSet.FieldByName('cod_emp_mult').AsInteger);

    vCodigoControleOr := dataSet.FieldByName('codigo_ctrl').AsInteger;
    vNomeControleOr := Trim(vCtrl.dataSet.FieldByName('nome_ctrl').AsString);
    vTipoPlanoOr := Trim(vCtrl.dataSet.FieldByName('tp_plano').AsString);
    vCartaoSpedOr := vCtrl.dataSet.FieldByName('cartao_sped').AsInteger;
    vCodEmpMult := dataSet.FieldByName('cod_emp_mult').AsInteger;

    vCtrl._abreTodosControlesCAR(FDocs, 'S', vMudarControle, vCodigoControleOr, vCodEmpMult);

    if not _abreFormMudarControleOuVoltarParaAtivo(vCaptionForm, vCaptionPanel, vHistorico) then
      Exit;

    vHistorico := Trim(vHistorico + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, ' EMP: ' + vDadosIni.StrZero(dataSet.FieldByName('cod_emp_mult').AsInteger, 3), ''));

    // Variavel para selecionar o controle depois da desnegativacao
    vCodigoControleDest := vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger;
    vNomeControleDest := Trim(vCtrl.dataSet.FieldByName('nome_ctrl').AsString);
    vTipoPlanoDest := Trim(vCtrl.dataSet.FieldByName('tp_plano').AsString);
    vCartaoSpedDest := vCtrl.dataSet.FieldByName('cartao_sped').AsInteger;

    if vCtrl.dataSet.FieldByName('barrar_automatico').AsString = 'S' then
      if dataSet.FieldByName('cod_cliente').AsInteger <= 0 then
      begin
        Application.MessageBox('Controle selecionado configurado para barramento automático. Crédito não possui cliente vinculado',
          'Atenção', 0 + 64);
        Exit;
      end;

    if vMudarControle then
      if vCodigoControleOr = vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger then
      begin
        Application.MessageBox('Esta operação só pode ser realizada entre controles diferentes',
          'Atenção',
          0 + 64);
        Exit;
      end;

    try

      if vCodigoControleDest = 0 then
        raiseExceptionCreate('Controle de destino não encontrado', '');

      try

        vLancL := TLancamentosImp.create;
        vContLigL := TContaLigacaoImp.create;

        vLancL._setTransactionComponentes(transacao);
        vContLigL._AbrirContadeLigacao(True);

        if vMudarControle then
        begin

          // Gerando numero de lote
          buscas.Close;
          buscas.SQL.Text := 'SELECT GEN_ID(INC_L_QUIT, 1) lote FROM rdb$Database';
          buscas.Open;

          vNumLoteQuitacao := buscas.FieldByName('lote').AsInteger;
          vCodMaxBaixaCred := 0;

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
              buscas.SQL.Text := ' select max(lot.n_lote_quit) from empresa_fisica emp ' +
                ' inner join lote_quit lot on lot.codigo_emp = emp.cod_empresa ' +
                ' where emp.cod_empresa > 0 ';
              buscas.Open;
            end
            else
            begin
              buscas.close;
              buscas.SQL.Text := ' select max(lot.n_lote_quit) from lote_quit lot ' +
                ' where lot.codigo_emp = ' + vDadosIni.codEmpresa;
              buscas.Open;
            end;

            vCodMaxBaixaCred := buscas.FieldByName('max').AsInteger + 1;

            if (vCodMaxBaixaCred > vNumLoteQuitacao) then
            begin
              buscas.close;
              buscas.SQL.Text := ' set generator INC_L_QUIT to ' + IntToStr(vCodMaxBaixaCred);
              buscas.ExecSQL;

              vNumLoteQuitacao := vCodMaxBaixaCred;
            end;
          end
          else
          begin
            buscas.close;
            buscas.SQL.Text := ' select max(lot.n_lote_quit) from lote_quit lot ' +
              ' where lot.codigo_emp in ' + vDadosIni.vEmp.vCodigoUnificadas;
            buscas.Open;

            vCodMaxBaixaCred := buscas.FieldByName('max').AsInteger + 1;

            if (vCodMaxBaixaCred > vNumLoteQuitacao) then
            begin
              buscas.close;
              buscas.SQL.Text := ' set generator INC_L_QUIT to ' + IntToStr(vCodMaxBaixaCred);
              buscas.ExecSQL;

              vNumLoteQuitacao := vCodMaxBaixaCred;
            end;
          end;

          buscas.Close;
          buscas.SQL.Text := 'INSERT INTO LOTE_QUIT (N_LOTE_QUIT, DATA_L_QUIT, CODIGO_EMP)' +
            ' VALUES (:N_LOTE_QUIT, :DATA_L_QUIT, :CODIGO_EMP)';
          buscas.ParamByName('N_LOTE_QUIT').AsInteger := vNumLoteQuitacao;
          buscas.ParamByName('DATA_L_QUIT').AsDate := vDadosIni.diaFFinanceiro + 1;
          buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ExecSQL;

          // Efetuando o lancamento na tabela de lancamentos. Lancamento de saida

          vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_S_CRD').AsFloat;

          //        vContLigL.vPCont.dataSet.Locate('N_CONTA_PLC', vLancL.N_CONTA_PLC, []);
          if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
            raiseExceptionCreate('Corrija o cadastro para continuar', '');

          vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
          vLancL.CODIGO_CTRL := vCodigoControleOr;
          vLancL.NOME_CTRL := Trim(vNomeControleOr);
          vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
          vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
          vLancL.HISTORICO_L := vHistorico;
          vLancL.VALOR_L := dataSet.FieldByName('VALOR_C').AsCurrency;
          vLancL.NDOC_L := Trim(dataSet.FieldByName('N_DOC_C').AsString);
          vLancL.LOTE_QUIT := vNumLoteQuitacao;

          if vMudarControle then
            vLancL.TP_MOD := 'S'
          else
            vLancL.TP_MOD := '';
          vLancL.COD_EMP_MULT := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
          vLancL.VL_CONTABIL := dataSet.FieldByName('vl_contabil').AsFloat;
          vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
          vLancL._efetuarLancamento;

          //Efetuando a baixa do credito

          dataSet.Edit;
          dataSet.FieldByName('STATUS_C').AsString := 'QUITADO';
          dataSet.FieldByName('DATQ_C').AsDateTime := vDadosIni.diaFFinanceiro + 1;
          dataSet.FieldByName('US_BX').AsInteger := vDadosIni.vCodUsuario;
          dataSet.FieldByName('DATA_BAIXA').AsDateTime := vDadosIni.getDataBanco(buscas);
          dataSet.FieldByName('OBS_C').AsString := vHistorico;
          dataSet.FieldByName('lote_quit').AsInteger := vNumLoteQuitacao;
          dataSet.FieldByName('TIP_BAIXA').AsString := 'M';
          dataSet.Post;
          if not Apply then
            raiseExceptionCreate('Operação será abortada', '');

        end
        else
        begin
          if dataSet.FieldByName('TIP_BAIXA').AsString <> 'A' then
          begin
            dataSet.Edit;
            dataSet.FieldByName('TIP_BAIXA').AsString := 'A';
            dataSet.Post;
            if not Apply then
              raiseExceptionCreate('Operação será abortada', '');
          end;
        end;

        //Efetuando o lanchamento no controle_creditos

        buscas.Close;
        buscas.SQL.Text := ' select controle_creditos.* from controle_creditos' +
          ' left join empresa on empresa.cod_empresa = controle_creditos.cod_emp_mult ' +
          ' where controle_creditos.cod_cred = ' + IntToStr(dataSet.FieldByName('cod_cred').AsInteger) +
          ' and controle_creditos.codigo_emp = ' + vDadosIni.codEmpresa;
        buscas.Open;

        if (buscas.IsEmpty) and (vDadosIni.vEmp.vFinanceiroUnificado) then
        begin
          buscas.Close;
          buscas.SQL.Text := ' select controle_creditos.* from controle_creditos' +
            ' left join empresa on empresa.cod_empresa = controle_creditos.cod_emp_mult ' +
            ' where controle_creditos.cod_cred = ' + IntToStr(dataSet.FieldByName('cod_cred').AsInteger) +
            ' and (case when (empresa.financeiro_unificado = ''S'') then ' +
            '      empresa.codigo_unificadora else controle_creditos.codigo_emp end) = ' + vDadosIni.codEmpresa;
          buscas.Open;
        end;

        if buscas.IsEmpty then
          raiseExceptionCreate('Não encontrado o crédito no banco de dados', '');

        dataSet.Insert;
        for I := 0 to dataSet.FieldCount - 1 do
          if dataSet.Fields[I].FieldKind = fkData then
            if buscas.FindField(dataSet.Fields[I].FieldName) <> nil then
            dataSet.FieldByName(dataSet.Fields[I].FieldName).Value :=
              buscas.FieldByName(dataSet.Fields[I].FieldName).Value;

        dataSet.FieldByName('STATUS_C').Value := Null;
        dataSet.FieldByName('DTORIGINAL_C').AsDateTime := dataSet.FieldByName('DATA_REC_C').AsDateTime;
        dataSet.FieldByName('DATA_REC_C').AsDateTime := vDadosIni.diaFFinanceiro + 1;
        dataSet.FieldByName('DATQ_C').Value := Null;
        dataSet.FieldByName('US_BX').Value := Null;
        dataSet.FieldByName('LOTE_QUIT').Value := Null;
        if vMudarControle then
          dataSet.FieldByName('LOTE_ENT').AsInteger := vNumLoteQuitacao
        else
        begin
          dataSet.FieldByName('LOTE_ENT').Value := Null;
          dataSet.FieldByName('VL_BAIXA_COMISSAO').Value := Null;
          dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').value := Null;
        end;
        dataSet.FieldByName('DIA_CXL').Value := Null;
        dataSet.FieldByName('STATUS_CXL_RQ').Value := Null;
        dataSet.FieldByName('VL_RQ_PG_CXL').Value := Null;
        dataSet.FieldByName('OP_CXL').Value := Null;
        dataSet.FieldByName('LOTE_CXL').Value := Null;
        dataSet.FieldByName('TP_REC_CXL').Value := Null;
        dataSet.FieldByName('PRCSS').Value := Null;
        dataSet.FieldByName('COONAOFISCAL').Value := Null;
        dataSet.FieldByName('NSERIEECF').Value := Null;
        dataSet.FieldByName('COD_TERMINAL').Value := Null;
        dataSet.FieldByName('VALOR_LIQUIDO').Value := Null;
        dataSet.FieldByName('TIP_BAIXA').value := Null;
        dataSet.FieldByName('DATA_DESBARRAMENTO').Value := Null;
        dataSet.FieldByName('DATA_LOTE_NEG').Value := Null;
        dataSet.FieldByName('LOTE_NEG').Value := Null;
        dataSet.FieldByName('COD_FATURAMENTO').Value := Null;
        dataSet.FieldByName('HISTORICO_C').AsString :=
          dataSet.FieldByName('HISTORICO_C').AsString + ' ' + DateToStr(vDadosIni.diaFFinanceiro + 1);
        dataSet.FieldByName('CODIGO_CTRL').AsInteger := vCodigoControleDest;
        dataSet.FieldByName('TIPO_DOC_C').AsString := vNomeControleDest;

        if (trim(vTipoPlanoDest) = 'C') and ((vCartaoSpedDest = 1) or (vCartaoSpedDest = 2)) then
          dataSet.FieldByName('DEB_CRED').AsString := vDadosIni.IfThen(vCartaoSpedDest = 1, 'D', 'C')
        else
          dataSet.FieldByName('DEB_CRED').Value := Null;

        FCodigo := Gencodigo('CONTROLE_CREDITOS', dtmContasAReceber.SpIncCodigo,
          vDadosIni.codEmpresa);
        vDadosIni.hw_registra_estatistica('CONTROLE_CREDITOS');
        dataSet.FieldByName('COD_CRED').AsInteger := FCodigo;
        dataSet.Post;

        //Efetuando lancamento de entrada do credito em novo controle

        vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_V_PROD').AsFloat;

        //      vContLigL.vPCont.dataSet.Locate('N_CONTA_PLC', vLancL.N_CONTA_PLC, []);
        if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
          raiseExceptionCreate('Corrija o cadastro para continuar', '');

        vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
        vLancL.CODIGO_CTRL := vCodigoControleDest;
        vLancL.NOME_CTRL := Trim(vNomeControleDest);
        vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
        vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
        vLancL.HISTORICO_L := vHistorico;
        vLancL.VALOR_L := dataSet.FieldByName('VALOR_C').AsCurrency;
        vLancL.NDOC_L := Trim(dataSet.FieldByName('N_DOC_C').AsString);
        if vMudarControle then
          vLancL.LOTE_ENT := vNumLoteQuitacao;

        if vMudarControle then
          vLancL.TP_MOD := 'S'
        else
          vLancL.TP_MOD := '';
        vLancL.COD_EMP_MULT := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
        vLancL.VL_CONTABIL := dataSet.FieldByName('vl_contabil').AsFloat;
        vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
        vLancL._efetuarLancamento;
        if not Apply then
          raiseExceptionCreate('Operação será abortada', '');

        //Efetuando lancamento na tabela lanccheque

        buscas.Close;
        buscas.SQL.Text := 'INSERT INTO CREDITOS_LANC ( COD_LANC, COD_CRED, CODIGO_EMP)' +
          ' VALUES ( :COD_LANC, :COD_CRED, :CODIGO_EMP)';
        buscas.ParamByName('COD_LANC').AsInteger := vLancL.COD_LANC;
        buscas.ParamByName('COD_CRED').AsInteger := FCodigo;
        buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.ExecSQL;

        // Efetuando a negaticação/desnegativação do cliente
        if vMudarControle then
        begin

          vCtrl._selecionaControle(vCodigoControleOr);

          if vCtrl.dataSet.FieldByName('barrar_automatico').AsString = 'S' then
          begin

            vCtrl._selecionaControle(vCodigoControleDest);
            if vCtrl.dataSet.FieldByName('barrar_automatico').AsString <> 'S' then
            begin
              vNegCliente := TNegativacaoCliente.create(buscas.Transaction, FDocs);
              vNegCliente.dados.acao := naDesnegativa; //desnegativar
              vNegCliente.dados.alterarConta := True; // alterar credito
              vNegCliente.dados.alterarContaStatus := nacsQuitadas; // contas quitadas pois o credito anterior neste momento esta quitado
              vNegCliente.dados.codConta := 0; // 0 pois vai desnegativar todos os creditos que estao negativados se nao existirem creditos com barramento automatico em aberto
              vNegCliente.dados.loteQuit := 0; // 0
              vNegCliente.dados.codCliente := dataSet.FieldByName('cod_cliente').AsInteger; // cliente do credito
              vNegCliente.dados.codigoUnificada := dataSet.FieldByName('cod_emp_mult').AsInteger;
              if not vNegCliente.executar then
                raiseExceptionCreate(vNegCliente.MsgErro, '');
            end;

          end;

          vCtrl._selecionaControle(vCodigoControleDest);
          if vCtrl.dataSet.FieldByName('barrar_automatico').AsString = 'S' then
          begin
            vNegCliente := TNegativacaoCliente.create(buscas.Transaction, FDocs);
            vNegCliente.dados.acao := naNegativar;  // Negativar o cliente
            vNegCliente.dados.alterarConta := True; // Alterar o novo credito pois o controle é de barramento automatico
            vNegCliente.dados.alterarContaStatus := nacsAbertas; // Apenas a nova conta que esta aberta
            vNegCliente.dados.codConta := dataSet.FieldByName('cod_cred').AsInteger; // Alterar apenas a nova conta em questao
            vNegCliente.dados.loteQuit := 0; // 0
            vNegCliente.dados.codCliente := dataSet.FieldByName('cod_cliente').AsInteger; // cliente
            vNegCliente.dados.codigoUnificada := dataSet.FieldByName('cod_emp_mult').AsInteger;
            if not vNegCliente.executar then
              raiseExceptionCreate(vNegCliente.MsgErro, '');
          end;

        end
        else
        begin

          vCtrl._selecionaControle(vCodigoControleDest);
          if vCtrl.dataSet.FieldByName('barrar_automatico').AsString = 'S' then
          begin
            vNegCliente := TNegativacaoCliente.create(buscas.Transaction, FDocs);
            vNegCliente.dados.acao := naNegativar;  // Negativar o cliente
            vNegCliente.dados.alterarConta := True; // Alterar o novo credito pois o controle é de barramento automatico
            vNegCliente.dados.alterarContaStatus := nacsAbertas; // Apenas a nova conta que esta aberta
            vNegCliente.dados.codConta := dataSet.FieldByName('cod_cred').AsInteger; // Alterar apenas a nova conta em questao
            vNegCliente.dados.loteQuit := 0; // 0
            vNegCliente.dados.codCliente := dataSet.FieldByName('cod_cliente').AsInteger; // cliente
            vNegCliente.dados.codigoUnificada := dataSet.FieldByName('cod_emp_mult').AsInteger;
            if not vNegCliente.executar then
              raiseExceptionCreate(vNegCliente.MsgErro, '');
          end;

        end;

        CommitaTransacao;

        vDadosIni.GravaAuditoria('CAR018', 'INCLUIR', 'SUCESSO ' + vOperacao, FTable, '', FBuscas2);

      finally
        vLancL._setTransactionComponentes(nil);
        vContLigL.Free;
        vLancL.Free;

        vContLigL:= nil;
        vLancL := nil;
      end;

      Result := True;

      dataSet.Refresh;

    except
      on E: Exception do
      begin
        RollBackTransacao;
        Result := False;
        Application.MessageBox(pchar('Erro na operação. Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('function TControleCredito._mudarControleOuVoltarParaAtivo. Erro: ' + e.Message);
      end;
    end;
  finally
  	if vListaClBarrarDesbarrar.Count > 0 then
    begin
      for I := 0 to vListaClBarrarDesbarrar.Count - 1 do
      begin
        if trim(vListaClBarrarDesbarrar[I]) <> '' then
        begin
          if vDadosIni.vEmp.vFinanceiroUnificado then
            vDadosIni.negativarClientes(0, trim(vListaClBarrarDesbarrar[I]))
          else
            vDadosIni.negativarClientes(StrToInt(vListaClBarrarDesbarrar[I]), '');
        end;
      end;
    end;

    if Assigned(vListaClBarrarDesbarrar) then
      FreeAndNil(vListaClBarrarDesbarrar);
  end;
end;

function TControleCredito._negativaDesnegativaCliente: Boolean;
var
  vTemp: string;
  vCodCliente, vCodVenda, vLoteNeg: Integer;
  vTemNegativacao, vTemMarcado: Boolean;
  buscas2: TIBQuery;
  vCpf: string;
  vList: TStrings;
begin
  try
    if vDadosIni.vEmp.vCodigoBarrado = 0 then
    begin
      Application.MessageBox(
        'Barramento automático ativado. Campo "Código Barrado" no Cadastro da empresa sem valor válido',
        'Atenção', 0 + 64);
      Exit;
    end;

    if vDadosIni.vEmp.vCodigoDesbarrado = 0 then
    begin
      Application.MessageBox(
        'Barramento automático ativado. Campo "Código Liberado" no Cadastro da empresa sem valor válido',
        'Atenção', 0 + 64);
      Exit;
    end;

    if dadosCDL.vNegativar then
      vTemp := 'BARRAR'
    else
      vTemp := 'DESBARRAR';

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;  

      // Condicao atendida apenas quando o usuario clicar no Botao de Negativacao;

      //------------ Variaveis usadas para validar vendas/clientes.
    vCodCliente := 0;
    vCodVenda := 0;
    vTemNegativacao := False;
    vTemMarcado := False;
    //------------

    dadosCDL.dataVencimento := '';
    dadosCDL.NumDocumento := '';
    dadosCDL.valorSPC := 0;

    dadosCDL.NumDocumento := '';
    try
    	dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if (dataSet.FieldByName('sel').AsString = 'S') and (dataSet.FieldByName('cod_cliente').AsInteger > 0) then
        begin
          if not vTemMarcado then
            vTemMarcado := True;

          if dadosCDL.vEmLote then
          begin
            // Validação de mesma venda e mesmo cliente, e se ja houve lote de negativacao
            if vCodCliente = 0 then
            begin
              vCodCliente := dataSet.FieldByName('cod_cliente').AsInteger;
              vCodVenda := dataSet.FieldByName('n_doc_v').AsInteger;
            end
            else if (vCodCliente <> dataSet.FieldByName('cod_cliente').AsInteger) and
              (vCodVenda <> dataSet.FieldByName('n_doc_v').AsInteger) then
            begin
              Application.MessageBox('Os documentos selecionados não são do mesmo cliente e mesma venda',
                'Atenção', 0 + 64);
              RollBackTransacao;
              exit;
            end
            else if dataSet.FieldByName('LOTE_NEG').AsInteger > 0 then
              vTemNegativacao := True;
          end;

          if (dataSet.FieldByName('sel').AsString = 'S') and
            (dadosCDL.NumDocumento = '') then
          begin
            if (dadosCDL.vCodigoMV) and (Pos('-', dataSet.FieldByName('n_doc_c').AsString) > 0) then
              dadosCDL.NumDocumento := copy(dataSet.FieldByName('n_doc_c').AsString, 1,
                Pos('-', dataSet.FieldByName('n_doc_c').AsString) - 1)
            else
              dadosCDL.NumDocumento := Trim(dataSet.FieldByName('n_doc_c').AsString);
            dadosCDL.valorSPC := dadosCDL.valorSPC + dataSet.FieldByName('VALOR_C').AsFloat;
            dadosCDL.dataVencimento := dataSet.FieldByName('data_venc_c').AsString;
          end
          else if (dataSet.FieldByName('sel').AsString = 'S') then
            dadosCDL.valorSPC := dadosCDL.valorSPC + dataSet.FieldByName('VALOR_C').AsFloat;
        end;

        dataSet.Next;
      end;
    finally
      dataSet.EnableControls;
    end;

    if dadosCDL.vEmLote then
      if (vTemNegativacao) and (dadosCDL.vNegativar) then
        if Application.MessageBox(pchar(
          'Já existe lote para um ou mais itens selecionados e será sobrescrito ' + #13 +
          'pelo lote atual, continua?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        begin
          RollBackTransacao;
          Exit;
        end;

    if not vTemMarcado then
    begin
      Application.MessageBox(pchar(
        'Nenhum registro foi selecionado para negativação'), 'Atenção', 0 + 64);
      RollBackTransacao;
      Exit;
    end;

    if dadosCDL.vEmLote then
      if dadosCDL.vNegativar then
      begin
        buscas.Close;
        buscas.SQL.Text := 'SELECT GEN_ID(INC_COD_LOTENEG, 1) codigo FROM rdb$Database';
        buscas.Open;
        vLoteNeg := buscas.FieldByName('codigo').AsInteger
      end;

    try
    	dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if (dataSet.FieldByName('sel').AsString = 'S') and (dataSet.FieldByName('cod_cliente').AsInteger > 0) then
        begin
          buscas.Close;
          buscas.SQL.Text := 'update clientes set REP_INT_ACTIVE = 1, CODIGO_FATURAMENTO = :CODIGO_FATURAMENTO' +
            ' where cod_cliente = ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger) +
            ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger), vDadosIni.codEmpresa);
          if dadosCDL.vNegativar then
            buscas.ParamByName('CODIGO_FATURAMENTO').AsInteger := vDadosIni.vEmp.vCodigoBarrado
          else
            buscas.ParamByName('CODIGO_FATURAMENTO').AsInteger := vDadosIni.vEmp.vCodigoDesbarrado;
          buscas.ExecSQL;

          if vDadosIni.getConfSisBool('cl_hab_faturamento_unico_entre_empresas', buscas) then
          begin
            buscas.Close;
            buscas.SQL.Text := ' select cpfcgc from clientes ' +
              ' where cod_cliente = :cod_cliente and cod_empresa = :cod_empresa ';
            buscas.ParamByName('cod_cliente').AsInteger := dataSet.FieldByName('cod_cliente').AsInteger;
            buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
            buscas.Open;

            vCpf := buscas.FieldByName('cpfcgc').AsString;

            if trim(vCpf) <> '' then
            begin
              try
                vList := TStringList.Create;
                vList := vDadosIni.getConfSisBlob('cl_hab_faturamento_unico_entre_empresas', buscas);
                if vList.Count > 1 then
                begin
                  vList[2] := StringReplace(UpperCase(vList[2]), 'EMPRESAS:', '', [rfReplaceAll]);

                  buscas2.Close;
                  buscas2.SQL.Text := ' select cod_empresa from empresa ' +
                    ' where cod_empresa <> :cod_empresa ';
                  buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
                  buscas2.Open;
                  buscas2.FetchAll;

                  buscas2.First;
                  while not buscas2.Eof do
                  begin
                    if ((Pos('|' + IntToStr(buscas2.FieldByName('COD_EMPRESA').AsInteger) + '|', trim(vList[2])) > 0)
                      or (trim(vList[2]) = '')) then
                    begin
                      vDadosIni.abreStatusProcessamento('', 'Replicando para outras empresas');

                      buscas.Close;
                      buscas.SQL.Text := ' update clientes set CODIGO_FATURAMENTO = :CODIGO_FATURAMENTO' +
                        ' where cpfcgc = :cpfcgc and cod_empresa = :cod_empresa ';
                      buscas.ParamByName('cpfcgc').AsString := vCpf;
                      buscas.ParamByName('cod_empresa').AsInteger := buscas2.FieldByName('COD_EMPRESA').AsInteger;
                      if dadosCDL.vNegativar then
                        buscas.ParamByName('CODIGO_FATURAMENTO').AsInteger := vDadosIni.vEmp.vCodigoBarrado
                      else
                        buscas.ParamByName('CODIGO_FATURAMENTO').AsInteger := vDadosIni.vEmp.vCodigoDesbarrado;
                      buscas.ExecSQL;
                    end;

                    buscas2.Next;
                  end;
                end;
              finally
                FreeAndNil(vList);
              end;
            end;
          end;

          dataSet.Edit;
          if dadosCDL.vNegativar then
          begin
            dataSet.FieldByName('COD_FATURAMENTO').AsInteger := vDadosIni.vEmp.vCodigoBarrado;
            if dadosCDL.vEmLote then
            begin
              dataSet.FieldByName('LOTE_NEG').AsInteger := vLoteNeg;
              dataSet.FieldByName('DATA_LOTE_NEG').AsDateTime := vDadosIni.getDataBanco(FBuscas2);
            end;
          end
          else
          begin
            dataSet.FieldByName('COD_FATURAMENTO').AsInteger := vDadosIni.vEmp.vCodigoDesbarrado;
            if dadosCDL.vEmLote then
              dataSet.FieldByName('DATA_DESBARRAMENTO').AsDateTime := vDadosIni.getDataBanco(FBuscas2);
          end;
          dataSet.Post;
        end;

        dataSet.Next;
      end;
    finally
      dataSet.EnableControls;
    end;

    Apply;
    CommitaTransacao;

    vDadosIni.GravaAuditoria('CAR015', vTemp, 'SUCESSO ' + vTemp + ' TIPO ' + FDocs +
      ' CLIENTE CODIGO ' + dataSet.FieldByName('cod_cliente').AsString, FTable, '', buscas);

    if dadosCDL.vImprimirFichaSPC then
      if not dadosCDL.vEmLote then
      begin
      	try
        	dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
            if (dataSet.FieldByName('sel').AsString = 'S') and (dataSet.FieldByName('cod_cliente').AsInteger > 0) then
            begin
              dadosCDL.dataVencimento := dataSet.FieldByName('DATA_VENC_C').AsString;
              dadosCDL.NumDocumento := Trim(dataSet.FieldByName('N_DOC_C').AsString);
              if not dadosCDL.vValorVenda then
                dadosCDL.valorSPC := dataSet.FieldByName('VALOR_C').AsFloat
              else
                dadosCDL.valorSPC := _getValorVenda(Trim(dataSet.FieldByName('TP_DOC_V').AsString),
                  dataSet.FieldByName('N_DOC_V').AsInteger, dataSet.FieldByName('VALOR_C').AsFloat,
                  dataSet.FieldByName('COD_EMP_MULT').AsInteger);
              vCl._selecionaCliente(dataSet.FieldByName('cod_cliente').AsInteger, dataSet.FieldByName('COD_EMP_MULT').AsInteger);
              _imprimirFichaSPC;
            end;
            dataSet.Next;
          end;
        finally
          dataSet.EnableControls;
        end;
      end
      else
      begin
        vCl._selecionaCliente(dataSet.FieldByName('cod_cliente').AsInteger, dataSet.FieldByName('COD_EMP_MULT').AsInteger);
        _imprimirFichaSPC;
      end;

    vTemp := 'Negativação';
    if not dadosCDL.vNegativar then
      vTemp := 'Desnegativação';

    dataSet.Refresh;

    vDadosIni.fechaStatusProcessamento;
    Application.MessageBox(pchar(vTemp + ' concluída'), 'Atenção', 0 + 64);

  except
    on E: exception do
    begin
      Result := False;
      vDadosIni.fechaStatusProcessamento;
      registraErro('function TControleCredito._negativaDesnegativaCliente. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro na Negativação/Desnegativação do cliente. Erro: ' +
        E.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

function TControleCredito._dataRecebimentoValida: Boolean;
begin
  Result := False;
  if dataSet.FieldByName('data_rec_c').AsDateTime > (vDadosIni.diaFFinanceiro + 1) then
  begin
    Application.MessageBox('Data ainda não programada', 'Atenção', 0 + 64);
    Exit;
  end;

  if dataSet.State = dsEdit then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select data_rec_c from controle_creditos' +
      ' where cod_cred = ' + IntToStr(dataSet.FieldByName('cod_cred').AsInteger) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if not buscas.IsEmpty then
      if buscas.FieldByName('data_rec_c').AsDateTime <> dataSet.FieldByName('data_rec_c').AsDateTime then
        if not vDadosIni.PesqPros('CAR041', 'VALIDAR', 'DE ' +
          buscas.FieldByName('data_rec_c').AsString +
          ' PARA ' + dataSet.FieldByName('data_rec_c').AsString +
          ' NUM DOC ' + Trim(dataSet.FieldByName('N_DOC_C').AsString), FTable, IntToStr(FCodigo) +
          '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), FBuscas2, True) then
        begin
          dataSet.FieldByName('data_rec_c').AsDateTime :=
            buscas.FieldByName('data_rec_c').AsDateTime;
          Exit;
        end;
  end;
  Result := True;
end;

function TControleCredito._descontoPermitido: Boolean;
begin
  Result := True;
  if vDadosIni.vEmp.vMaxDescontoParcela > 0 then
  begin
    FDescontoPercentual := vDadosIni.StrToFloatFormat((((FValorOperacao - FValorCorrigido) * 100) /
      FValorOperacao), 2);
    if (FDescontoPercentual > vDadosIni.vEmp.vMaxDescontoParcela) then
    begin
      Result := False;
      Application.MessageBox(pchar('Percentual apurado de desconto maior que o permitido de: ' +
        FloatToStr(vDadosIni.vEmp.vMaxDescontoParcela) + '%'), 'Atenção', 0 + 64);
    end;
  end
  else
  begin
    Result := False;
    Application.MessageBox('Nenhum desconto é permitido pela empresa', 'Atenção', 0 + 64);
  end;
end;

function TControleCredito._detalhesRecebimento: Boolean;
begin
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CAR024', 'DETALHES', 'NUM DOC ' +
    Trim(dataSet.FieldByName('N_DOC_C').AsString) +
    ' ' + dataSet.FieldByName('NOME_C').AsString, FTable,
    dataSet.FieldByName('COD_CRED').AsString + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString),
    FBuscas2, True) then
    Exit;

  vBx._selecionaBaixaCreditos(dataSet.FieldByName('cod_cred').AsInteger,
  	dataSet.FieldByName('codigo_emp').AsInteger);

  vBx.dataSet.Last;

  _abreFormDetalhes(False);

end;

function TControleCredito._documentoRecebidoOuSendoRecebido: Boolean;
begin
  buscas.Close;
  buscas.SQL.Text :=
    ' select cc.op_cxl, cc.op_cx, cc.status_cxl_rq, cc.status_cx, cc.datq_c, cc.vl_rq_pg_cxl, cc.datq_c, col2.nome_vendedor nome_vendedor2, col.nome_vendedor from controle_creditos cc ' +
    ' left join colaborador col on col.cod_vendedor = cc.op_cx and col.cod_empresa = cc.codigo_emp ' +
    ' left join colaborador col2 on col2.cod_vendedor = cc.op_cxl and col2.cod_empresa = cc.codigo_emp ' +
    ' where cc.cod_cred = ' + IntToStr(dataset.FieldByName('COD_CRED').AsInteger) +
    ' and cc.codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	IntToStr(dataset.FieldByName('CODIGO_EMP').AsInteger), vDadosIni.codEmpresa);
  buscas.Open;

  Result := (buscas.FieldByName('STATUS_CXL_RQ').AsString = 'R') or
    (buscas.FieldByName('STATUS_CX').AsString = 'R') or
    (Trim(buscas.FieldByName('datq_C').AsString) <> '');

  try

    if not Result then
      Exit;

    if (Trim(buscas.FieldByName('datq_C').AsString) <> '') then
      Application.MessageBox(PChar
        ('Documento já esta quitado. Data ' + buscas.FieldByName('datq_C').AsString + #13 + #13 +
        'Código: ' + IntToStr(dataset.FieldByName('cod_cred').AsInteger) + #13 +
        'Número: ' + Trim(dataset.FieldByName('n_doc_c').AsString) + #13 +
        'Data Venc: ' + FormatDateTime('dd/mm/yyyy', dataset.FieldByName('data_venc_c').AsDateTime) + #13 +
        'Cliente: ' + IntToStr(dataset.FieldByName('cod_cliente').AsInteger) + ' - ' +
        trim(dataSet.FieldByName('nome_c').AsString)),
        'Atenção', 0 + 64)

    else if (buscas.FieldByName('STATUS_CXL_RQ').AsString = 'R') then
    begin
      if (buscas.FieldByName('op_cxl').AsInteger > 0) then
        Application.MessageBox(PChar
          ('Documento já esta sendo recebido ou modificado pelo Caixa Auxiliar. ' +
          'Usuário ' + buscas.FieldByName('op_cxl').AsString + ' - '+ trim(buscas.FieldByName('NOME_VENDEDOR2').AsString) + #13 + #13 +
	        'Código: ' + IntToStr(dataset.FieldByName('cod_cred').AsInteger) + #13 +
  	      'Número: ' + Trim(dataset.FieldByName('n_doc_c').AsString) + #13 +
          'Data Venc: ' + FormatDateTime('dd/mm/yyyy', dataset.FieldByName('data_venc_c').AsDateTime) + #13 +
    	    'Cliente: ' + IntToStr(dataset.FieldByName('cod_cliente').AsInteger) + ' - ' +
      	  trim(dataSet.FieldByName('nome_c').AsString)),
          'Atenção', 0 + 64)
      else
        Application.MessageBox(PChar
          ('Documento está marcado que esta sendo recebido ou modificado pelo Caixa Auxiliar' + #13 + #13 +
	        'Código: ' + IntToStr(dataset.FieldByName('cod_cred').AsInteger) + #13 +
  	      'Número: ' + Trim(dataset.FieldByName('n_doc_c').AsString) + #13 +
          'Data Venc: ' + FormatDateTime('dd/mm/yyyy', dataset.FieldByName('data_venc_c').AsDateTime) + #13 +
    	    'Cliente: ' + IntToStr(dataset.FieldByName('cod_cliente').AsInteger) + ' - ' +
      	  trim(dataSet.FieldByName('nome_c').AsString)),
          'Atenção', 0 + 64);
    end

    else if (buscas.FieldByName('STATUS_CX').AsString = 'R') then
    begin
      if (buscas.FieldByName('op_cx').AsInteger > 0) then
        Application.MessageBox(PChar
          ('Documento já esta sendo recebido ou modificado pelo Financeiro. ' + 
          'Usuário ' + buscas.FieldByName('op_cx').AsString + ' - '+ trim(buscas.FieldByName('NOME_VENDEDOR').AsString) + #13 + #13 +
          'Código: ' + IntToStr(dataset.FieldByName('cod_cred').AsInteger) + #13 +
  	      'Número: ' + Trim(dataset.FieldByName('n_doc_c').AsString) + #13 +
          'Data Venc: ' + FormatDateTime('dd/mm/yyyy', dataset.FieldByName('data_venc_c').AsDateTime) + #13 +
    	    'Cliente: ' + IntToStr(dataset.FieldByName('cod_cliente').AsInteger) + ' - ' +
      	  trim(dataSet.FieldByName('nome_c').AsString)),
          'Atenção', 0 + 64)
      else
        Application.MessageBox(PChar
          ('Documento está marcado que esta sendo recebido ou modificado pelo Financeiro' + #13 + #13 +
          'Código: ' + IntToStr(dataset.FieldByName('cod_cred').AsInteger) + #13 +
  	      'Número: ' + Trim(dataset.FieldByName('n_doc_c').AsString) + #13 +
          'Data Venc: ' + FormatDateTime('dd/mm/yyyy', dataset.FieldByName('data_venc_c').AsDateTime) + #13 +
    	    'Cliente: ' + IntToStr(dataset.FieldByName('cod_cliente').AsInteger) + ' - ' +
      	  trim(dataSet.FieldByName('nome_c').AsString)),
          'Atenção', 0 + 64);
    end
    else

  finally
    buscas.Close;
  end;

end;

procedure TControleCredito._efetuarSoma;
var
  vSomaQuitados, vSomaNaoQuitados, vSomaSelecionados,vsomaliqsel: Extended;
  vPointer: Pointer;
begin
	if dataSet.IsEmpty then
    exit;
    
  if not vDadosIni.PesqPros('CAR014', 'SOMAR', '', FTable, '', buscas, True) then
    Exit;

  try
  	vDadosIni.abreStatusProcessamento('', 'Realizando somatório dos créditos...');
    vSomaQuitados := 0;
    vSomaNaoQuitados := 0;
    vSomaSelecionados := 0;
    vsomaliqsel := 0;

    try
    	vPointer := dataSet.GetBookmark;
      dataSet.DisableControls;
      dataSet.first;
      while not dataSet.Eof do
      begin
        if Trim(dataSet.FieldByName('status_c').AsString) = '' then
          vSomaNaoQuitados := vSomaNaoQuitados + dataSet.FieldByName('VALOR_C').AsFloat
        else
          vSomaQuitados := vSomaQuitados + dataSet.FieldByName('VALOR_C').AsFloat;
        if Trim(dataSet.FieldByName('sel').AsString) = 'S' then
        begin
          vSomaSelecionados := vSomaSelecionados + dataSet.FieldByName('VALOR_C').AsFloat;
          vsomaliqsel:=vsomaliqsel+dataSet.FieldByName('VALOR_LIQUIDO').AsFloat;
        end;
        dataSet.next;
      end;
    finally
      dataSet.first;
      dataSet.GotoBookmark(vPointer);
      dataSet.EnableControls;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
    Application.MessageBox(pchar('Valor dos Creditos Não quitados: ' + format('%m', [vSomaNaoQuitados]) + #13 +
	    'Valor dos Creditos quitados....: ' + format('%m', [vSomaQuitados]) + #13 +
  	  'Valor dos Creditos Selecionados: ' + format('%m', [vSomaSelecionados])+#13+
    	'Vl.Liq.Creditos Selecionados...: ' + format('%m', [vsomaliqsel])),
      'Somatório das Créditos', MB_OK + MB_ICONINFORMATION);
  end;
end;

function TControleCredito._Emiterelatorioendiv: boolean;
var
  Rdendiv: TRDprint;
begin
  linha := 1;
  vpag := 0;
  Rdendiv := TRDprint.Create(Application);
  if not vDadosIni.ModImp(Rdendiv) then
    exit;
  Rdendiv.FonteTamanhoPadrao := S17cpp;
  Rdendiv.TamanhoQteColunas := 132;
  Rdendiv.CaptionSetup := 'Configurações de Impressão';
  Rdendiv.OpcoesPreview.CaptionPreview := 'Niveis de Endividamento';
  Rdendiv.TitulodoRelatorio := 'Niveis de Endividamento por Tipo de Venda';
  vDadosIni._LimparVarSendEmail;
  Rdendiv.OnSendMail := vDadosini._SendMailRdPrint;
  Rdendiv.OpcoesPreview.Preview := true;
  if not Rdendiv.EstaAberto then
    Rdendiv.Abrir;
  //    cabrelDev(RdCreditos,vFiltroVend);

end;

function TControleCredito._estornarRecebimento: Boolean;
var
  I, vCodEmpresaQuitacao, vNumLoteQuitacao, vCodControleParaSaida: Integer;
  vDataLoteQuitacao: TDateTime;
  vListaArquivosCartao: TStringList;
  vNegCliente: TNegativacaoCliente;
  vTmp: string;
  vLoteDev: boolean;
  vListaClBarrarDesbarrar: TStringList;

  procedure _voltarArquivosCartao;
  var
    vListaAdm: TStringList;
    I, vCodADM, vCodigoUnificada: Integer;
    vNomeArquivo, vPath: string;
    J: Integer;
  begin
    if vListaArquivosCartao.Count = 0 then
      Exit;

    vListaAdm := TStringList.Create;
    vListaAdm.Clear;

    for I := 0 to vListaArquivosCartao.Count - 1 do
    begin
      vCodADM := StrToInt(vDadosIni.getCampoPipe(vListaArquivosCartao[i],1));
      vCodigoUnificada := StrToInt(vDadosIni.getCampoPipe(vListaArquivosCartao[i],2));
      vNomeArquivo := vDadosIni.getCampoPipe(vListaArquivosCartao[i],3);

      vPath := '';
      for J := 0 to vListaAdm.Count - 1 do
        if (Trim(vDadosIni.getCampoPipe(vListaAdm[J],1)) = IntToStr(vCodADM)) and
          (Trim(vDadosIni.getCampoPipe(vListaAdm[J],2)) = IntToStr(vCodigoUnificada)) then
        begin
          vPath := Trim(vDadosIni.getCampoPipe(vListaAdm[J],3));
          Break;
        end;
      if Trim(vPath) = '' then
      begin
        vPath := Trim(retornaValor('select END_ARQUIVO_ADM as valor from ADM_CARTAO' +
          ' where COD_ADM = ' + IntToStr(vCodADM) +
          ' and COD_EMPRESA = ' + IntToStr(vCodigoUnificada) +
          ' and ATIVO = 1 '));
        if Trim(vPath) <> '' then
          vListaAdm.Add( IntToStr(vCodADM) + '|' + IntToStr(vCodigoUnificada) + '|' + Trim(vPath) + '|');
      end;

      if FileExists(vPath + '\PROCESSADOS\' + vNomeArquivo) then
        if CopyFile(
          pchar(vPath + '\PROCESSADOS\' + vNomeArquivo),
          pchar(vPath + '\' + vNomeArquivo), False) then
          DeleteFile(pchar(vPath + '\PROCESSADOS\' + vNomeArquivo));

    end;
  end;

begin
	try
  	vListaClBarrarDesbarrar := TStringList.Create;
    vListaClBarrarDesbarrar.Sorted := True;
    vListaClBarrarDesbarrar.Duplicates := dupIgnore;
    vListaClBarrarDesbarrar.Clear;

    Result := False;
    try

      if not vDadosIni.PesqPros('CAR048', 'ESTORNO', 'NUM CRED ' +
        Trim(vBx.dataSet.FieldByName('N_DOC_C').AsString) +
        ' CLIENTE ' + vBx.dataSet.FieldByName('COD_CLIENTE').AsString +
        ' OPERADOR ' + IntToStr(vDadosIni.vCodUsuario), 'CONTROLE_CREDITOS',
        IntToStr(vBx.dataSet.FieldByName('COD_CRED').AsInteger) + '/' +
        Trim(vBx.dataSet.FieldByName('N_DOC_C').AsString), buscas, True) then
        Exit;

      if not vDadosIni.VerificarinicioFechFinan(buscas) then
        exit;

      dataSet.RefreshRecord;
      if Trim(dataSet.FieldByName('status_c').AsString) <> 'QUITADO' then
        if _documentoRecebidoOuSendoRecebido then
          Exit;

      vDadosIni.abreStatusProcessamento('', 'Validando dados');

      vDadosIni.definirDiaFinanceiroFechado(buscas);

      vBx.dataSet.RefreshRecord;

      if (vBx.dataSet.FieldByName('DATQ_C').AsDateTime <> (vDadosIni.diaFFinanceiro + 1)) then
        raiseExceptionCreate('Data de quitação do crédito não corresponde a data do Financeiro' + #13 +
          'Data de quitação..: ' + DateToStr(vBx.dataSet.FieldByName('DATQ_C').AsDateTime) + #13 +
          'Data do Financeiro: ' + DateToStr(vDadosIni.diaFFinanceiro + 1), '');

      if (Trim(vBx.dataSet.FieldByName('status_cxl_rq').AsString) <> '') and
        (vBx.dataSet.FieldByName('vl_rq_pg_cxl').AsFloat > 0) then
        raiseExceptionCreate('Recebimento feito pelo Caixa Auxiliar, não pode ser estornado', '');

      if vBx.dataSet.FieldByName('lote_quit').AsInteger <= 0 then
        raiseExceptionCreate('Lote de quitação não encontrado', '');

      vCodEmpresaQuitacao := vBx.dataSet.FieldByName('codigo_emp').AsInteger;
      vNumLoteQuitacao := vBx.dataSet.FieldByName('lote_quit').AsInteger;
      vDataLoteQuitacao := vBx.dataSet.FieldByName('datq_c').AsDateTime;

      if ((vDadosIni.vCliente.Barramento.vBarraAutomaticamenteAposVencCrediario = 'S')
          and (vDadosIni.vCliente.Barramento.vCodigoBarrado > 0))
        or ((vDadosIni.vCliente.Barramento.vDesbarraAutomaticamenteAposQuitCrediario = 'S')
          and (vDadosIni.vCliente.Barramento.vCodigoDesbarrado > 0)) then
      begin
     		buscas.Close;
        buscas.SQL.Text := 'select distinct cpfcgc, cod_cliente from baixa_creditos' +
          ' where lote_quit = ' + IntToStr(vNumLoteQuitacao) +
          ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
            IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa) +
          ' and cod_cliente > 0';
        buscas.Open;

        buscas.First;
        while not buscas.Eof do
     	  begin
        	if (buscas.FieldByName('COD_CLIENTE').AsInteger > 0) then
          begin
            if (vDadosIni.vEmp.vFinanceiroUnificado)
              and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
            begin
            	if trim(buscas.FieldByName('CPFCGC').AsString) <> '' then
              	vListaClBarrarDesbarrar.Add(trim(buscas.FieldByName('CPFCGC').AsString));
            end
            else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
              vListaClBarrarDesbarrar.Add(IntToStr(buscas.FieldByName('COD_CLIENTE').AsInteger));
          end;

        	buscas.Next;
        end;
      end;

      if vDadosIni.vEmp.vFinanceiroUnificado then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select lote_quit.n_lote_quit, lote_quit.codigo_emp, lote_quit.data_l_quit from lote_quit ' +
          ' left join empresa on lote_quit.codigo_emp = empresa.cod_empresa ' +
          ' where lote_quit.n_lote_quit = ' + inttostr(vNumLoteQuitacao) +
          ' and lote_quit.data_l_quit = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDataLoteQuitacao)) +
          ' and (case when(empresa.financeiro_unificado = ''S'') then empresa.codigo_unificadora else lote_quit.codigo_emp end) = ' + vDadosIni.codEmpresa;
        buscas.Open;

        if not buscas.IsEmpty then
          if buscas.FieldByName('codigo_emp').AsInteger <> vDadosIni.cod_empresa then
          begin
            Application.MessageBox(PChar('Estorno do recebimento não pode ser feito' + #13 +
              'Lote de recebimento foi gerado pela empresa ' + IntToStr(buscas.FieldByName('codigo_emp').AsInteger)), 'Atenção', MB_OK + MB_ICONINFORMATION);
            exit;
          end;
      end;

      ///  Validando se os creditos ou cheques gerados na quitação ja foram baixados
      ///  Caso algum ja tenha sido baixado o estorno nao sera efetuado
      vLoteDev := false;
      buscas.Close;
      buscas.SQL.Text := 'select tip_baixa from controle_creditos ' +
        ' where lote_quit = ' + IntToStr(vNumLoteQuitacao) +
        '	and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
            IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa) +
        ' and not datq_c is null';
      buscas.Open;
      if not buscas.IsEmpty then
        vLoteDev := trim(buscas.FieldByName('tip_baixa').AsString) = 'D';

      if not vLoteDev then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select count(*) valor from lancamentos' +
          ' where lote_ent = ' + IntToStr(vNumLoteQuitacao) +
          ' and codigo_emp = ' + vDadosIni.codEmpresa;
        buscas.Open;

        if buscas.FieldByName('valor').AsInteger = 0 then
          raiseExceptionCreate('Estorno não pode ser feito' + #13 +
            'Registros usados para quitar o Lote não foram encontrados', '');
      end;

      buscas.Close;
      buscas.SQL.Text := ' select cc.cod_cred, cc.codigo_emp, cc.cod_emp_mult from controle_creditos cc ' +
        ' inner join empresa emp on emp.cod_empresa = cc.codigo_emp ' +
        ' inner join boletas bol on bol.cod_cred = cc.cod_cred and bol.cod_empresa = cc.cod_emp_mult ' +
        ' where cc.lote_ent = ' + IntToStr(vNumLoteQuitacao) +
        ' and (case when (emp.financeiro_unificado = ''S'') then ' +
        '					emp.codigo_unificadora else cc.codigo_emp end) = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if not buscas.IsEmpty then
        Application.MessageBox('Foram gerados boletos para os créditos que serão estornados ' + #13 + #13 +
          'Favor verificar.', 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);

      buscas.Close;
      buscas.SQL.Text := 'select count(*) valor from controle_cheque' +
        ' where lote_ent = ' + IntToStr(vNumLoteQuitacao) +
        ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
            IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa) +
        ' and not datq_ch is null';
      buscas.Open;

      if buscas.FieldByName('valor').AsInteger > 0 then
        raiseExceptionCreate('Estorno não pode ser feito' + #13 +
          'Cheque(s) usado(s) na quitação do lote já foi quitado ou devolvido', '');

      buscas.Close;
      buscas.SQL.Text := 'select count(*) valor from baixa_creditos' +
        ' where lote_ent = ' + IntToStr(vNumLoteQuitacao) +
        ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
            IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa);
      buscas.Open;

      if buscas.FieldByName('valor').AsInteger > 0 then
        raiseExceptionCreate('Estorno não pode ser feito' + #13 +
          'Crédito(s) usado(s) na quitação do lote já foi quitado', '');

      //// Este teste verifica se o credito foi devolvido
      buscas.Close;
      buscas.SQL.Text := 'select count(*) valor from controle_creditos' +
        ' where lote_ent = ' + IntToStr(vNumLoteQuitacao) +
        ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
            IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa) +
        ' and not datq_c is null';
      buscas.Open;

      if buscas.FieldByName('valor').AsInteger > 0 then
        raiseExceptionCreate('Estorno não pode ser feito' + #13 +
          'Crédito(s) usado(s) na quitação do lote já foi baixado', '');

      // Financeiro sendo fechado
      if vDadosIni.financeiroFechando(buscas) then
        exit;

      vDadosIni.abreStatusProcessamento('', 'Verificando barramento de clientes');

      // Aqui o sistema verifica se os controle deverão barrar novamente o cliente
      FBuscas2.Close;
      FBuscas2.SQL.Text :=
        'select distinct bc.codigo_ctrl, bc.cod_cliente, bc.cod_emp_mult' +
        ' from baixa_creditos bc' +
        ' inner join controles c on bc.codigo_ctrl = c.codigo_ctrl and bc.codigo_emp = c.codigo_emp' +
        ' and c.barrar_automatico = ''S''' +
        ' where bc.lote_quit = ' + IntToStr(vNumLoteQuitacao) +
        ' and bc.codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa);
      FBuscas2.Open;

      FBuscas2.First;
      while not FBuscas2.Eof do
      begin
        vNegCliente := TNegativacaoCliente.create(FBuscas2.Transaction, FDocs);
        vNegCliente.dados.acao := naNegativar;
        vNegCliente.dados.alterarConta := True;
        vNegCliente.dados.alterarContaStatus := nacsQuitadas; // contas quitadas pois os creditos ainda nao foram estornados
        vNegCliente.dados.codConta := 0; // 0 pois o importante aqui é o lote
        vNegCliente.dados.loteQuit := vNumLoteQuitacao; // Numero do lote que vai ser estornado
        vNegCliente.dados.codCliente := FBuscas2.FieldByName('cod_cliente').AsInteger; // cliente do credito
        vNegCliente.dados.codigoUnificada := FBuscas2.FieldByName('cod_emp_mult').AsInteger;
        if not vNegCliente.executar then
          raiseExceptionCreate(vNegCliente.MsgErro, '');
        FBuscas2.Next;
      end;
      //Verificando arquivos da conciliação de cartao de credito
      vDadosIni.abreStatusProcessamento('', 'Verificando arquivos conciliação cartão');
      buscas.Close;
      buscas.SQL.Text :=
        'select distinct COD_ADM, COD_EMP_MULT, ARQ_EXTRATO_ADM from controle_creditos cc' +
        ' where cc.lote_quit = ' + IntToStr(vNumLoteQuitacao) +
        ' and cc.codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa) +
        ' and cc.cod_adm > 0' +
        ' union' +
        ' select distinct COD_ADM, COD_EMP_MULT, ARQ_EXTRATO_ADM from lancamentos l' +
        ' where l.lote_ent = ' + IntToStr(vNumLoteQuitacao) +
        ' and l.codigo_emp = ' + vDadosIni.codEmpresa +
        ' and l.cod_adm > 0';
      buscas.Open;
      vListaArquivosCartao := TStringList.Create;
      vListaArquivosCartao.Clear;

      buscas.First;
      while not buscas.Eof do
      begin
        if (Trim(buscas.FieldByName('ARQ_EXTRATO_ADM').AsString) <> '') and (buscas.FieldByName('cod_adm').AsInteger > 0) then
          vListaArquivosCartao.Add(
            IntToStr(buscas.FieldByName('cod_adm').AsInteger) + '|' +
            IntToStr(buscas.FieldByName('COD_EMP_MULT').AsInteger) + '|' +
            Trim(buscas.FieldByName('ARQ_EXTRATO_ADM').AsString) + '|');
        buscas.Next;
      end;

      vDadosIni.abreStatusProcessamento('', 'Voltando créditos');

      buscas.Close;
      buscas.SQL.Text := ' select bc.seq_bxcred, bc.codigo_emp, bc.cod_cred, bc.tp_operacao, cc.status_c, bc.valor_para_estorno, ' +
        ' bc.valor_c valor_c_bx, cc.valor_c valor_c_cc, cc.valor_liquido, c.barrar_automatico, ' +
        ' cc.vl_contabil vl_contabil_cc, bc.vl_contabil vl_contabil_bc, bc.valor_para_estorno_ctb ' +
        ' from baixa_creditos bc' +
        ' inner join controle_creditos cc on cc.cod_cred = bc.cod_cred and cc.codigo_emp = bc.codigo_emp ' +
        ' left join controles c on bc.codigo_ctrl = c.codigo_ctrl and bc.codigo_emp = c.codigo_emp ' +
        ' where bc.lote_quit = ' + IntToStr(vNumLoteQuitacao) +
        ' and bc.codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa);
      buscas.Open;

      buscas.First;
      while not buscas.Eof do
      begin
        vTmp := '';
        if buscas.FieldByName('barrar_automatico').AsString = 'S' then
          vTmp := ', data_desbarramento = null';
        ///  Aqui reabre os creditos e coloca na obs do mesmo que ele foi estornado pelo operador x
        ///  Tambem é feita a exclusao e alteracoes do baixa_creditos
        FBuscas2.Close;
        FBuscas2.SQL.Text := 'update controle_creditos' +
          ' set status_c = null, tip_baixa = null, datq_c = null, lote_quit = null, US_BX = NULL,' +
          ' data_baixa = null, juros_cob = 0, obs_c = :obs_c, valor_c = :valor_c, prcss = null,' +
          ' valor_liquido = :valor_liquido, vl_contabil = :vl_contabil' + vTmp +
          ' where cod_cred = :cod_cred ' +
          ' and codigo_emp = :codigo_emp ';
        FBuscas2.ParamByName('cod_cred').AsInteger := buscas.FieldByName('cod_cred').AsInteger;
        FBuscas2.ParamByName('codigo_emp').AsInteger := buscas.FieldByName('codigo_emp').AsInteger;
        FBuscas2.ParamByName('obs_c').AsString := Copy('CREDITO ESTORNADO OPERADOR ' +
          IntToStr(vDadosIni.vCodUsuario) + ' LOTEQUIT ' + IntToStr(vNumLoteQuitacao), 1, 60);

        if Trim(buscas.FieldByName('status_c').AsString) = 'QUITADO' then
        begin
          FBuscas2.ParamByName('valor_c').AsFloat := buscas.FieldByName('valor_para_estorno').AsFloat;
          FBuscas2.ParamByName('valor_liquido').AsFloat := FBuscas2.ParamByName('valor_c').AsFloat -
            (buscas.FieldByName('valor_c_cc').AsFloat - buscas.FieldByName('valor_liquido').AsFloat);
        end
        else
        begin
          FBuscas2.ParamByName('valor_c').AsFloat := buscas.FieldByName('valor_c_cc').AsFloat +
            buscas.FieldByName('valor_para_estorno').AsFloat;
          FBuscas2.ParamByName('valor_liquido').AsFloat := FBuscas2.ParamByName('valor_c').AsFloat -
            (buscas.FieldByName('valor_c_cc').AsFloat - buscas.FieldByName('valor_liquido').AsFloat);
        end;
        if Trim(buscas.FieldByName('tp_operacao').AsString) = 'P' then
          FBuscas2.ParamByName('vl_contabil').AsFloat := buscas.FieldByName('vl_contabil_cc').AsFloat +
            buscas.FieldByName('valor_para_estorno_ctb').AsFloat
        else
          FBuscas2.ParamByName('vl_contabil').AsFloat := buscas.FieldByName('vl_contabil_cc').AsFloat;
        FBuscas2.ExecSQL;

        if Trim(buscas.FieldByName('tp_operacao').AsString) = 'P' then
        begin
          FBuscas2.Close;
          FBuscas2.SQL.Text := 'update baixa_creditos' +
            ' set valor_c = (valor_c + :valor_quitado),' +
            ' vl_contabil = (vl_contabil + :vl_contabil)' +
            ' where seq_bxcred > ' + IntToStr(buscas.FieldByName('seq_bxcred').AsInteger) +
            ' and cod_cred = ' + IntToStr(buscas.FieldByName('cod_cred').AsInteger) +
            ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
            IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa);
          FBuscas2.ParamByName('valor_quitado').AsFloat :=
            buscas.FieldByName('valor_para_estorno').AsFloat;
          FBuscas2.ParamByName('vl_contabil').AsFloat :=
            buscas.FieldByName('valor_para_estorno_ctb').AsFloat;
          FBuscas2.ExecSQL;
        end;

        FBuscas2.Close;
        FBuscas2.SQL.Text := 'delete from baixa_creditos' +
          ' where seq_bxcred = ' + IntToStr(buscas.FieldByName('seq_bxcred').AsInteger) +
          ' and cod_cred = ' + IntToStr(buscas.FieldByName('cod_cred').AsInteger) +
          ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa);
        FBuscas2.ExecSQL;

        FBuscas2.Close;
        FBuscas2.SQL.Text := 'update baixa_creditos' +
          ' set tp_operacao = ''P''' +
          ' where cod_cred = ' + IntToStr(buscas.FieldByName('cod_cred').AsInteger) +
          ' and codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          IntToStr(vCodEmpresaQuitacao), vDadosIni.codEmpresa);
        FBuscas2.ExecSQL;

        buscas.Next;
      end;

      /// Apagando lançamentos de saida do credito e juros ou descontos se existir
      _excluirDadosEstorno(vNumLoteQuitacao, dataSet.FieldByName('COD_EMP_MULT').AsInteger);

      CommitaTransacao;
      Result := True;
      vDadosIni.GravaAuditoria('CAR048', 'ESTORNO', 'ESTORNO CONFIRMADO' +
      	' LOTE ' + IntToStr(vNumLoteQuitacao) +
        ' OPERADOR ' + IntToStr(vDadosIni.vCodUsuario), 'LOTE_QUIT', IntToStr(vNumLoteQuitacao),
        FBuscas2);

      _voltarArquivosCartao;

      vBx._selecionaBaixaCreditos(dataSet.FieldByName('cod_cred').AsInteger,
        dataSet.FieldByName('codigo_emp').AsInteger);

      vBx.dataSet.Last;

      dataSet.CancelUpdates;  //caso os registros tem sido marcados.
      dataSet.Refresh;

    except on E: Exception do
      begin
        RollBackTransacao;
        Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('function TControleCredito._estornarRecebimento. Erro: ' + e.Message);
        verificaErroDataSetOpen(E.Message);
      end;
    end;
  finally
  	if vListaClBarrarDesbarrar.Count > 0 then
    begin
      for I := 0 to vListaClBarrarDesbarrar.Count - 1 do
      begin
        if trim(vListaClBarrarDesbarrar[I]) <> '' then
        begin
          if vDadosIni.vEmp.vFinanceiroUnificado then
            vDadosIni.negativarClientes(0, trim(vListaClBarrarDesbarrar[I]))
          else
            vDadosIni.negativarClientes(StrToInt(vListaClBarrarDesbarrar[I]), '');
        end;
      end;
    end;
  end;
end;

function TControleCredito._permitirAlterarDataVencimento: Boolean;
begin
  Result := False;
  if dataSet.State = dsEdit then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select data_venc_c from controle_creditos' +
      ' where cod_cred = ' + IntToStr(dataSet.FieldByName('cod_cred').AsInteger) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if not buscas.IsEmpty then
      if buscas.FieldByName('data_venc_c').AsDateTime <>
        dataSet.FieldByName('data_venc_c').AsDateTime then
        if not vDadosIni.PesqPros('CAR041', 'VALIDAR', 'DE ' +
          buscas.FieldByName('data_venc_c').AsString +
          ' PARA ' + dataSet.FieldByName('data_venc_c').AsString +
          ' NUM CH ' + Trim(dataSet.FieldByName('N_DOC_C').AsString), FTable, IntToStr(FCodigo) + '/'
          + Trim(dataSet.FieldByName('N_DOC_C').AsString), FBuscas2, True) then
        begin
          dataSet.FieldByName('data_venc_c').AsDateTime :=
            buscas.FieldByName('data_venc_c').AsDateTime;
          Exit;
        end;
  end;
  Result := True;
end;

function TControleCredito._quitarRegistrosSelecionados(ATransaction: TIBTransaction): Boolean;
var
  vCredImp: TControleCreditosImp;
  vTxJuros: Real;
  vCodMaxBaixaCred: Integer;

  function _quitarCredito: Boolean;
  begin

    vCredImp.dataSet.Edit;

    if vCredImp.dataSet.FieldByName('valor_corr').AsFloat = 0 then
      vCredImp.dataSet.FieldByName('valor_corr').AsFloat :=
        vCredImp.dataSet.FieldByName('valor_c').AsFloat;

    if (dadosReceber.baixaParcial) and
      ((vDadosIni.StrToFloatFormat(dadosReceber.valorOperacao, 2)) <
      (vDadosIni.StrToFloatFormat(vCredImp.dataSet.FieldByName('VALOR_CORR').AsFloat, 2))) then
    begin
      vCredImp.dataSet.FieldByName('VALOR_CORR').AsFloat := vDadosIni.StrToFloatFormat(
        vCredImp.dataSet.FieldByName('VALOR_CORR').AsFloat - dadosReceber.valorOperacao, 2);
      if (dadosReceber.valorOperacao > vCredImp.dataSet.FieldByName('valor_c').AsFloat) then
        vCredImp.dataSet.FieldByName('JUROS_COB').AsFloat := dadosReceber.valorOperacao -
          vCredImp.dataSet.FieldByName('VALOR_C').AsFloat
      else
        vCredImp.dataSet.FieldByName('JUROS_COB').AsFloat := 0;

      vCredImp.vValor_C_Anterior_Parcial := vCredImp.dataSet.FieldByName('valor_c').AsFloat;
      vCredImp.vValor_C_Anterior_Parcial_Zerado := vCredImp.dataSet.FieldByName('valor_c').AsFloat <= 0;

      vCredImp.dataSet.FieldByName('valor_c').AsFloat := vDadosIni.StrToFloatFormat(
        vCredImp.dataSet.FieldByName('valor_c').AsFloat - dadosReceber.valorOperacao, 2);

      if vDadosIni.StrToFloatFormat(dadosReceber.valorOperacao,2) <=
        vDadosIni.StrToFloatFormat(vCredImp.vValor_C_Anterior_Parcial,2) then
        vCredImp.dataSet.FieldByName('valor_liquido').AsFloat := vDadosIni.StrToFloatFormat(
          vCredImp.dataSet.FieldByName('valor_liquido').AsFloat - dadosReceber.valorOperacao, 2)
      else
        vCredImp.dataSet.FieldByName('valor_liquido').AsFloat := vDadosIni.StrToFloatFormat(
          vCredImp.dataSet.FieldByName('valor_liquido').AsFloat - vCredImp.vValor_C_Anterior_Parcial, 2);
//        dadosReceber.valorOperacao, 2);

      vCredImp.vValor_Contabil_BX := vDadosIni.StrToFloatFormat(vCredImp.dataSet.FieldByName('VL_CONTABIL').AsFloat, 2);
      if vDadosIni.StrToFloatFormat(vCredImp.dataSet.FieldByName('vl_contabil').AsFloat, 2) <
        vDadosIni.StrToFloatFormat(dadosReceber.valorOperacao, 2) then
        vCredImp.dataSet.FieldByName('VL_CONTABIL').AsCurrency := 0
      else
        vCredImp.dataSet.FieldByName('VL_CONTABIL').AsCurrency := vDadosIni.StrToFloatFormat(vCredImp.dataSet.FieldByName('VL_CONTABIL').AsCurrency - dadosReceber.valorOperacao,2);

      if vCredImp.dataSet.FieldByName('valor_c').AsFloat < 0 then
        vCredImp.dataSet.FieldByName('valor_c').AsFloat := 0
      else
        vCredImp.vValor_C_Anterior_Parcial := 0;
    end
    else
    begin
      if dadosReceber.referenteDevolucao then
      begin
        vCredImp.dataSet.FieldByName('TIP_BAIXA').AsString := 'D';
        if dadosReceber.historicoDevolucao <> '' then
          vCredImp.dataSet.FieldByName('historico_c').AsString := dadosReceber.historicoDevolucao;
        buscas.Close;
        buscas.SQL.Text := 'UPDATE NOTAFISCAL_ITEM SET BX_RETORNO_FIN = ''C''' +
          ' WHERE COD_CRED_RET_FIN = ' + IntToStr(vCredImp.dataSet.FieldByName('COD_CRED').AsInteger) +
          ' AND BX_RETORNO_FIN = ''S''' +
          ' AND COD_EMPRESA = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(vCredImp.dataSet.FieldByName('COD_EMP_MULT').AsInteger), vDadosIni.codEmpresa);
        buscas.ExecSQL;
      end
      else if dadosReceber.referenteCTP then
        vCredImp.dataSet.FieldByName('TIP_BAIXA').AsString := 'C';
      vCredImp.dataSet.FieldByName('STATUS_C').AsString := 'QUITADO';
      vCredImp.dataSet.FieldByName('DATQ_C').AsDateTime := vDadosIni.diaFFinanceiro + 1;
      vCredImp.dataSet.FieldByName('US_BX').AsInteger := vDadosIni.vCodUsuario;
      if Trim(vCredImp.dataSet.FieldByName('DATA_BAIXA').AsString) = '' then
        vCredImp.dataSet.FieldByName('DATA_BAIXA').AsDateTime := dadosReceber.dataBaixa;
      vCredImp.dataSet.FieldByName('obs_c').AsString :=
        'RECEBIMENTO DE CONTAS CONFORME LOTE ' + IntToStr(dadosReceber.loteQuitacao);
      vCredImp.dataSet.FieldByName('lote_quit').AsInteger := dadosReceber.loteQuitacao;
      if not dadosReceber.processamentoAutomatico then
        if vCredImp.dataSet.FieldByName('idbaixa_cartao').AsInteger > 0 then
        begin
          buscas.Close;
          buscas.SQL.Text := 'select idbaixa_cartao from controle_creditos' +
            ' where cod_cred = ' + IntToStr(vCredImp.dataSet.FieldByName('cod_cred').AsInteger) +
            ' and codigo_emp = ' + IntToStr(vCredImp.dataSet.FieldByName('codigo_emp').AsInteger);
          buscas.Open;

          if vCredImp.dataSet.FieldByName('idbaixa_cartao').AsInteger = buscas.FieldByName('idbaixa_cartao').AsInteger then
            vCredImp.dataSet.FieldByName('idbaixa_cartao').Value := Null;
        end;

      if (vCredImp.dataSet.FieldByName('valor_corr').AsFloat >
        vCredImp.dataSet.FieldByName('valor_c').AsFloat) then
        vCredImp.dataSet.FieldByName('juros_cob').AsFloat :=
          vCredImp.dataSet.FieldByName('valor_corr').AsFloat -
          vCredImp.dataSet.FieldByName('valor_c').AsFloat;
      vCredImp.vValor_Contabil_BX := vCredImp.dataSet.FieldByName('vl_contabil').AsFloat;
    end;

    vCredImp.DATQ_C := vDadosIni.diaFFinanceiro + 1;
    vCredImp.LOTE_QUIT := dadosReceber.loteQuitacao;
    if (dadosReceber.baixaParcial) and
      (Trim(vCredImp.dataSet.FieldByName('STATUS_C').AsString) <> 'QUITADO') then
    begin
      vCredImp._registrarBaixaCredito(
        dadosReceber.valorOperacao,
        dadosReceber.valorOperacao,
        'P',
        nil);

      vDadosIni.GravaAuditoria('CAR036', 'ALTERAR', ' BAIXANDO' +
      	' LOTE '+ IntToStr(dadosReceber.loteQuitacao) +
        ' COD CRED' + vCredImp.dataSet.FieldByName('COD_CRED').AsString +
        ' NUM DOC' + Trim(vCredImp.dataSet.FieldByName('N_DOC_C').AsString), FTable,
        vCredImp.dataSet.FieldByName('COD_CRED').AsString + '/' +
        Trim(vCredImp.dataSet.FieldByName('N_DOC_C').AsString), vCredImp.buscas);
    end
    else if dadosReceber.usarValorCorrigido then
    begin
      vCredImp._registrarBaixaCredito(
        vCredImp.dataSet.FieldByName('VALOR_CORR').AsFloat,
        vCredImp.dataSet.FieldByName('VALOR_CORR').AsFloat, //dadosReceber.valorOperacao,
        'T',
        nil);

      vDadosIni.GravaAuditoria('CAR035', 'ALTERAR', ' BAIXANDO' +
      	' LOTE '+ IntToStr(dadosReceber.loteQuitacao) +
        ' COD CRED' + vCredImp.dataSet.FieldByName('COD_CRED').AsString +
        ' NUM DOC' + Trim(vCredImp.dataSet.FieldByName('N_DOC_C').AsString), FTable,
        vCredImp.dataSet.FieldByName('COD_CRED').AsString + '/' +
        Trim(vCredImp.dataSet.FieldByName('N_DOC_C').AsString), vCredImp.buscas);
    end
    else
    begin
      vCredImp._registrarBaixaCredito(
        vCredImp.dataSet.FieldByName('VALOR_C').AsFloat,
        vCredImp.dataSet.FieldByName('VALOR_C').AsFloat, //dadosReceber.valorOperacao,
        'T',
        nil);
        
      vDadosIni.GravaAuditoria('CAR035', 'ALTERAR', ' BAIXANDO' +
      	' LOTE ' + IntToStr(dadosReceber.loteQuitacao) +
        ' COD CRED' + vCredImp.dataSet.FieldByName('COD_CRED').AsString +
        ' NUM DOC' + Trim(vCredImp.dataSet.FieldByName('N_DOC_C').AsString), FTable,
        vCredImp.dataSet.FieldByName('COD_CRED').AsString + '/' +
        Trim(vCredImp.dataSet.FieldByName('N_DOC_C').AsString), vCredImp.buscas);
    end;

    dadosReceber.valorDescontos := dadosReceber.valorDescontos +
      vCredImp.dataSet.FieldByName('VALOR_DESC').AsCurrency;
    dadosReceber.valorJuros := dadosReceber.valorJuros +
      vCredImp.dataSet.FieldByName('JUROS_COB').AsCurrency;

    vCredImp.dataSet.Post;
    vCredImp.dataSet.ApplyUpdates(-1);
    Result := True;
  end;

begin
  Result := True;

  try

    buscas.Close;
    buscas.SQL.Text := 'SELECT GEN_ID(INC_L_QUIT, 1) lote FROM rdb$Database';
    buscas.Open;

    dadosReceber.loteQuitacao := buscas.FieldByName('lote').AsInteger;
    vCodMaxBaixaCred := 0;

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
  	    buscas.SQL.Text := ' select max(lot.n_lote_quit) from empresa_fisica emp ' +
    	  	' inner join lote_quit lot on lot.codigo_emp = emp.cod_empresa ' +
          ' where emp.cod_empresa > 0 ';
        buscas.Open;
      end
      else
      begin
     		buscas.close;
  	    buscas.SQL.Text := ' select max(lot.n_lote_quit) from lote_quit lot ' +
        	' where lot.codigo_emp = ' + vDadosIni.codEmpresa;
        buscas.Open;
      end;

      vCodMaxBaixaCred := buscas.FieldByName('max').AsInteger + 1;

      if (vCodMaxBaixaCred > dadosReceber.loteQuitacao) then
      begin
        buscas.close;
        buscas.SQL.Text := ' set generator INC_L_QUIT to ' + IntToStr(vCodMaxBaixaCred);
        buscas.ExecSQL;

        dadosReceber.loteQuitacao := vCodMaxBaixaCred;
      end;
    end
    else 
    begin
      buscas.close;
      buscas.SQL.Text := ' select max(lot.n_lote_quit) from lote_quit lot ' +
				' where lot.codigo_emp in ' + vDadosIni.vEmp.vCodigoUnificadas;
      buscas.Open;

      vCodMaxBaixaCred := buscas.FieldByName('max').AsInteger + 1;

      if (vCodMaxBaixaCred > dadosReceber.loteQuitacao) then
      begin
        buscas.close;
        buscas.SQL.Text := ' set generator INC_L_QUIT to ' + IntToStr(vCodMaxBaixaCred);
        buscas.ExecSQL;

        dadosReceber.loteQuitacao := vCodMaxBaixaCred;
      end;
    end;

    buscas.Close;
    buscas.SQL.Text := 'INSERT INTO LOTE_QUIT (N_LOTE_QUIT, DATA_L_QUIT, CODIGO_EMP)' +
      ' VALUES (:N_LOTE_QUIT, :DATA_L_QUIT, :CODIGO_EMP)';
    buscas.ParamByName('N_LOTE_QUIT').AsInteger := dadosReceber.loteQuitacao;
    buscas.ParamByName('DATA_L_QUIT').AsDate := vDadosIni.diaFFinanceiro + 1;
    buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ExecSQL;

    if not _fazerLancamentoSaidaRecebimento then
      Exit;

    vCredImp := TControleCreditosImp.create;
    if Assigned(ATransaction) then
    begin
       vCredImp.transacao 								 	:= vDadosIni.vTransactionTmp;
       vCredImp.buscasControleCreditos.Transaction := vCredImp.transacao;
       buscas.Transaction                        	:= vCredImp.transacao;
    end
    else
    begin
	     vCredImp.transacao 									:= transacao;
       vCredImp.buscasControleCreditos.Transaction := vCredImp.transacao;
    end;
    vCredImp.dataSet := TClientDataSet(dataSet);
    vCredImp.buscas := TIBQuery(buscas);
    vCredImp.buscas.Transaction := vCredImp.transacao;
    

    dadosReceber.valorDescontos := 0;
    dadosReceber.valorJuros := 0;

    if dadosReceber.baixaParcial then
      Result := _quitarCredito
    else
    begin
    	try
      	vCredImp.dataSet.DisableControls;
        vCredImp.dataSet.First;
        while not vCredImp.dataSet.Eof do
        begin
          if vCredImp.dataSet.FieldByName('sel').AsString = 'S' then
            _quitarCredito;

          vCredImp.dataSet.Next;
        end;
      finally
        vCredImp.dataSet.EnableControls;
      end;

      Result := True;
    end;

    if Result then
      _fazerLancamentoJurosDescontoRecebimento;

  except on E: Exception do
    begin
      Result := False;
      registraErro('function TControleCredito._quitarRegistrosSelecionados. Erro: ' + e.Message + ' ' +
        Trim(dataSet.FieldByName('n_doc_c').AsString));
      Application.MessageBox(pchar('Erro ao quitar creditos. Erro: ' + E.Message),
        'Atenção', 0 + 64);
    end;
  end;
end;

procedure TControleCredito._relatorioMatricial;
var
  relCred: TRDprint;
  vCodEmpUnf: Integer;
  vLinha, vPagina: Integer;
  vEnd: Boolean;
  vSomenteSel: Boolean;
  vAgruparEmpUnf: Boolean;
  vValorCr: Currency;
  vValorCorr: Currency;
  vValorLiq: Currency;
  vValorJuros, vValorDesconto: Currency;
  buscasTmp: TIBQuery;

  procedure _cabecalho;
  begin
    vLinha := 1;
    vPagina := vPagina + 1;
    relCred.Impf(vlinha, 1, Trim(vDadosIni.vEmp.vnomeEmpresa), [normal]);
    vlinha := vlinha + 1;
    relCred.Impf(vlinha, 1, 'RELATORIO DE CONTROLE DE CREDITOS', [normal]);
    vlinha := vlinha + 2;
    relCred.Impf(vlinha, 1, DateToStr(Date), [normal]);
    relCred.Impf(vlinha, 115, 'Pag: ' + IntToStr(vPagina), [normal]);
    vlinha := vlinha + 1;
    if dadosImpressao.vExibirVenda then
    	relCred.Imp(vlinha, 1, vDadosIni.Replicate('=', vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf), 156, 152)))
    else if dadosImpressao.vBandAdmnParc then
    	relCred.Imp(vlinha, 1, vDadosIni.Replicate('=', 152))
    else if (vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf) then
	  	relCred.Imp(vlinha, 1, vDadosIni.Replicate('=', 135))
    else
	    relCred.Imp(vlinha, 1, vDadosIni.Replicate('=', vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf), 145, 135)));
    vlinha := vlinha + 1;

    relCred.Imp(vlinha, 1, 'NOME REF');
    relCred.Imp(vlinha, 20, 'DATA REC');
    relCred.Imp(vlinha, 32, 'TIPO DOC');
    relCred.Imp(vlinha, 47, 'N. DOC.');
    relCred.Imp(vlinha, 58, 'HISTORICO');
    relCred.Imp(vlinha, 85, 'DATA VEN.');
    relCred.Imp(vlinha, 102, 'VALOR');
    relCred.Imp(vlinha, 110, 'VALOR LIQ');
    relCred.Imp(vlinha, 121, 'VALOR CORR');

    if (not dadosImpressao.vExibirVenda) and (vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf) then
    begin
    	if dadosImpressao.vBandAdmnParc then
      	relCred.Imp(vlinha, 150, 'EMP')
      else
	    	relCred.Imp(vlinha, 132, 'EMP');
    end
    else if dadosImpressao.vExibirVenda then
    begin
    	relCred.Imp(vlinha, 132, 'DATA VND');
      relCred.Imp(vlinha, 143, 'DOC');
      relCred.Imp(vlinha, 150, 'TIP');
    end;

    if dadosImpressao.vExibirVenda then
      if (vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf) then
         relCred.Imp(vlinha, 154, 'EMP');

    if dadosImpressao.vBandAdmnParc then
    begin
    	vlinha := vlinha + 1;
      relCred.Imp(vlinha,   1, 'NUM AUTORIZACAO');
      relCred.Imp(vlinha,  22, 'NUM DOC/NSU/CV');
      relCred.Imp(vlinha,  40, 'TERMINAL CARTAO');
      relCred.Imp(vlinha,  62, 'ADM CARTAO');
      relCred.Imp(vlinha, 84, 'BANDEIRA');
      relCred.Imp(vlinha, 106, 'NUM PARC');
      relCred.Imp(vlinha, 117, 'QTD PARC');
      relCred.Imp(vlinha, 128, 'TAXA CAD(%)');
      relCred.Imp(vlinha, 140, 'TAXA APLIC(%)');
    end;

    if (dadosImpressao.vCodVendNome) or (dadosImpressao.vComJuros) then
    begin
      vlinha := vlinha + 1;
      if dadosImpressao.vCodVendNome then
      begin
        relCred.Imp(vlinha,  1, 'COD. VENDEDOR');
        relCred.Imp(vlinha, 22, 'NOME VENDEDOR');
      end;
      
      if dadosImpressao.vComJuros then
      begin
        relCred.Imp(vlinha, 65, 'STATUS');
        relCred.Imp(vlinha, 97, 'DATA QUIT');
        relCred.Imp(vlinha, 113, 'JUROS');
        relCred.Imp(vlinha, 120, 'DESCONTO');
      end;
    end;

    if vend then
    begin
    	vlinha := vlinha + 1;
      relCred.Imp(vlinha, 1, 'ENDERECO');
      relCred.Imp(vlinha, 40, 'CPF/CNPJ');
      relCred.Imp(vlinha, 55, 'BAIRRO');
      relCred.Imp(vlinha, 76, 'CIDADE');
      relCred.Imp(vlinha, 102, 'FONE');
      relCred.Imp(vlinha, 117, 'COD. CLIENTE');
    end;

    vlinha := vlinha + 1;
    if dadosImpressao.vExibirVenda then
    	relCred.Imp(vlinha, 1, vDadosIni.Replicate('=', vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf), 156, 152)))
    else if dadosImpressao.vBandAdmnParc then
    	relCred.Imp(vlinha, 1, vDadosIni.Replicate('=', 152))
    else if (vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf) then
	  	relCred.Imp(vlinha, 1, vDadosIni.Replicate('=', 135))
    else
	    relCred.Imp(vlinha, 1, vDadosIni.Replicate('=', vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf), 145, 135)));
  end;
begin

	buscasTmp := TIBQuery.Create(Application);
  buscasTmp.Database := buscas.Database;
  buscasTmp.Transaction := buscas.Transaction;

	vCodEmpUnf := 0;
  vPagina := 0;
  vValorJuros := 0;
  vValorDesconto := 0;
  vValorLiq := 0;
  vSomenteSel := dadosImpressao.vSomenteSel;
  vAgruparEmpUnf := dadosImpressao.vAgruparEmpUnf;
//  Application.MessageBox('Imprime somente selecionados?', 'Confirmação',
//    MB_ICONQUESTION + MB_YESNO) = IDYES;
  vEnd := dadosImpressao.vComEndereco;
//  Application.MessageBox('Imprime Com Endereço?', 'Confirmação', MB_ICONQUESTION +
//    MB_YESNO) = IDYES;
  relCred := TRDprint.Create(Application);

  relCred.OpcoesPreview.CaptionPreview := 'Relatório Créditos';
  relCred.TitulodoRelatorio := relCred.OpcoesPreview.CaptionPreview;
  vDadosIni._LimparVarSendEmail;
  relCred.OnSendMail := vDadosini._SendMailRdPrint;

  relCred.CaptionSetup := 'Opções de Impressão';
  if not vDadosIni.ModImp(relCred) then
    exit;

  relCred.OpcoesPreview.Remalina := True;
  if conta.dadosImpressao.vExibirVenda then
  	relCred.TamanhoQteColunas := vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf), 156, 152)
  else if dadosImpressao.vBandAdmnParc then
  	relCred.TamanhoQteColunas := 152
  else if (vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf) then
  	relCred.TamanhoQteColunas := 135
  else
	  relCred.TamanhoQteColunas := vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf), 145, 135);
  relCred.TamanhoQteLinhas := 69;
  relCred.FonteTamanhoPadrao := S17cpp;
  relCred.OpcoesPreview.Preview := True;

  relCred.Abrir;
  _cabecalho;

  try
  	if vAgruparEmpUnf then
    	dataSet.IndexFieldNames := 'COD_EMP_MULT';

    try
    	dataSet.DisableControls;
      restoreRecNo;
      dataSet.First;
      while not dataSet.eof do
      begin
        if (not vSomenteSel) or (dataSet.FieldByName('sel').AsString = 'S') then
        begin
        	if (dataSet.FieldByName('DATA_VENC_C').AsDateTime + vDadosIni.vEmp.vDiasCarenciaJuros) < vDadosIni.getDataBanco(buscas) then
        	  _corrigir
          else if dataSet.FieldByName('VALOR_CORR').AsFloat <= 0 then
          begin
          	dataSet.Edit;
						dataSet.FieldByName('VALOR_CORR').AsFloat := dataSet.FieldByName('VALOR_C').AsFloat;
          	dataSet.Post;
          end;

          if dataSet.RecNo > 1 then
          	if dadosImpressao.vBandAdmnParc then
            	vLinha := vLinha + 1
            else if dadosImpressao.vComJuros then
            	vLinha := vLinha + 1
            else if vend then
            	vLinha := vLinha + 1;

          if vAgruparEmpUnf then
            if (vCodEmpUnf <= 0) 
              or ((vCodEmpUnf > 0) and (vCodEmpUnf <> dataSet.FieldByName('COD_EMP_MULT').AsInteger)) then
            begin
              if ((vCodEmpUnf > 0) and (vCodEmpUnf <> dataSet.FieldByName('COD_EMP_MULT').AsInteger)) then
              begin
                if vLinha >= 56 then
                begin
                  vLinha := 1;
                  relCred.Novapagina;
                  _cabecalho;
                end;
              
                vLinha := vLinha + 1;
                if not vAgruparEmpUnf then
                begin
                  if dadosImpressao.vExibirVenda then
                    relCred.Imp(vlinha, 1, vDadosIni.Replicate('=', vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf), 153, 149)))
                  else
                    relCred.Imp(vLinha, 1, vDadosIni.replicate('=', 132));
                  vLinha := vLinha + 1;
                end;
                relCred.Imp(vLinha, 1, 'TOTAL DE CREDITO IMPRESSO');
                if vAgruparEmpUnf then
                begin
                  relCred.ImpF(vLinha, 97, vDadosIni.AlnDir(format('%n', [vValorCr]), 10), [negrito]);
                  relCred.ImpF(vLinha, 109, vDadosIni.AlnDir(format('%n', [vValorLiq]), 10), [negrito]);
                  relCred.ImpF(vLinha, 121, vDadosIni.AlnDir(format('%n', [vValorCorr]), 10), [negrito]);
                  vLinha := vLinha + 1;
                end
                else
                begin
                  relCred.Imp(vLinha, 97, vDadosIni.AlnDir(format('%n', [vValorCr]), 10));
                  relCred.Imp(vLinha, 109, vDadosIni.AlnDir(format('%n', [vValorLiq]), 10));
                  relCred.Imp(vLinha, 121, vDadosIni.AlnDir(format('%n', [vValorCorr]), 10));
                  vLinha := vLinha + 1;
                end;
                relCred.Imp(vLinha, 1, 'TOTAL JUROS RECEBIDOS: ');
                if vAgruparEmpUnf then
                  relCred.ImpF(vLinha, 24, vDadosIni.AlnDir(format('%n', [vValorJuros]), 10), [negrito])
                else
                  relCred.Imp(vLinha, 24, vDadosIni.AlnDir(format('%n', [vValorJuros]), 10));
                relCred.Imp(vLinha, 46, 'TOTAL DESCONTOS CONCEDIDOS: ');
                if vAgruparEmpUnf then
                  relCred.ImpF(vLinha, 74, vDadosIni.AlnDir(format('%n', [vValorDesconto]), 10), [negrito])
                else
                  relCred.Imp(vLinha, 74, vDadosIni.AlnDir(format('%n', [vValorDesconto]), 10));
              
                vValorCr := 0;
                vValorLiq := 0;
                vValorCorr := 0;
                vValorJuros := 0;
                vValorDesconto := 0;

                if vAgruparEmpUnf then
                begin
                  vLinha := vLinha + 1;
                  if dadosImpressao.vExibirVenda then
                    relCred.Imp(vlinha, 1, vDadosIni.Replicate('=', vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf), 153, 149)))
                  else
                    relCred.Imp(vLinha, 1, vDadosIni.replicate('=', 132));
                end;
              end;

              vLinha := vLinha + 1;
              relCred.ImpF(vLinha, 1, 'EMP: ' + vDadosIni.StrZero(dataSet.FieldByName('COD_EMP_MULT').AsInteger, 3), [negrito]);
              vLinha := vLinha + 1;
            end;

          vCodEmpUnf := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
        
          vLinha := vLinha + 1;
          relCred.Imp(vLinha, 1, Copy(dataSet.FieldByName('NOME_C').AsString, 1, 18));
          relCred.Imp(vLinha, 20, dataSet.FieldByName('DATA_REC_C').AsString);
          relCred.Imp(vLinha, 32, copy(dataSet.FieldByName('TIPO_DOC_C').AsString, 1, 13));
          relCred.Imp(vLinha, 47, Copy(dataSet.FieldByName('N_DOC_C').AsString, 1, 10));
          relCred.Imp(vLinha, 58, Copy(dataSet.FieldByName('HISTORICO_C').AsString, 1, 26));
          relCred.Imp(vLinha, 85, dataSet.FieldByName('DATA_VENC_C').AsString);
          relCred.Imp(vLinha, 097, vDadosIni.AlnDir(format('%n', [dataSet.FieldByName('VALOR_C').AsFloat]), 10));
          relCred.Imp(vLinha, 109, vDadosIni.alndir(format('%n', [dataSet.FieldByName('VALOR_LIQUIDO').AsFloat]), 10));
          relCred.Imp(vLinha, 121, vDadosIni.alndir(format('%n', [dataSet.FieldByName('VALOR_CORR').AsFloat]), 10));

          if (not dadosImpressao.vExibirVenda) and (vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf) then
          begin
          	if dadosImpressao.vBandAdmnParc then
            	relCred.Imp(vLinha, 150, vDadosIni.StrZero(dataSet.FieldByName('COD_EMP_MULT').AsInteger, 3))
            else
	            relCred.Imp(vLinha, 132, vDadosIni.StrZero(dataSet.FieldByName('COD_EMP_MULT').AsInteger, 3));
          end
          else if conta.dadosImpressao.vExibirVenda then
          begin
            relCred.Imp(vLinha, 132, FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_VENDA').AsDateTime));
            if dataSet.FieldByName('N_DOC_V').AsInteger > 0 then
	            relCred.Imp(vLinha, 143, vDadosIni.StrZero(dataSet.FieldByName('N_DOC_V').AsInteger, 6));
            if trim(dataSet.FieldByName('TP_DOC_V').AsString) <> '' then
	            relCred.Imp(vLinha, 150, vDadosIni.IfThen(Length(trim(dataSet.FieldByName('TP_DOC_V').AsString)) > 3,
  	            Copy(trim(dataSet.FieldByName('TP_DOC_V').AsString), 3), trim(dataSet.FieldByName('TP_DOC_V').AsString)));
          end;

          if (dadosImpressao.vExibirVenda) and (vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf) then
              relCred.Imp(vLinha, 154, vDadosIni.StrZero(dataSet.FieldByName('COD_EMP_MULT').AsInteger, 3));


          if ((dadosImpressao.vBandAdmnParc)
              and ((trim(dataSet.FieldByName('N_AUT_CART').AsString) <> '')
                   or (trim(dataSet.FieldByName('N_DOCNSU_ADM').AsString) <> '')
                   or (trim(dataSet.FieldByName('COD_TERMINAL_ADM').AsString) <> '')
                   or	(trim(dataSet.FieldByName('DESC_TERMINAL_ADM').AsString) <> '')
                   or (dataSet.FieldByName('COD_ADM').AsInteger > 0)
                   or (trim(dataSet.FieldByName('DESC_ADM').AsString) <> '')
                   or (dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger > 0)
                   or (trim(dataSet.FieldByName('DESC_BANDEIRA').AsString) <> ''))) then
          begin
          	vLinha := vLinha + 1;
            
            relCred.Imp(vLinha, 1, Copy(dataSet.FieldByName('N_AUT_CART').AsString, 1, 20));
            relCred.Imp(vLinha, 22, Copy(dataSet.FieldByName('N_DOCNSU_ADM').AsString, 1, 10));

            if trim(dataSet.FieldByName('DESC_TERMINAL_ADM').AsString) = '' then
            begin
              buscasTmp.Close;
	            buscasTmp.SQL.Text := ' select cod_term_adm, desc_term_adm from terminal_cartao ' +
              	' where cod_term_adm = ' + QuotedStr(dataSet.FieldByName('COD_TERMINAL_ADM').AsString) +
                ' and cod_empresa = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
	                IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger),
                  vDadosIni.codEmpresa);
              buscasTmp.Open;

              if not buscasTmp.IsEmpty then
                relCred.Imp(vLinha, 40, Copy(buscasTmp.FieldByName('DESC_TERM_ADM').AsString, 1, 20));
            end
            else
            	relCred.Imp(vLinha, 40, Copy(dataSet.FieldByName('DESC_TERMINAL_ADM').AsString, 1, 20));

            if trim(dataSet.FieldByName('DESC_ADM').AsString) = '' then
            begin
            	buscasTmp.Close;
	            buscasTmp.SQL.Text := ' select cod_adm, descricao_adm from adm_cartao ' +
              	' where cod_adm = ' + IntToStr(dataSet.FieldByName('COD_ADM').AsInteger) +
                ' and cod_empresa = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
                	IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger),
                  vDadosIni.codEmpresa);
              buscasTmp.Open;

              if not buscasTmp.IsEmpty then
                relCred.Imp(vLinha, 62, Copy(buscasTmp.FieldByName('DESCRICAO_ADM').AsString, 1, 20));
            end
            else
            	relCred.Imp(vLinha, 62, Copy(dataSet.FieldByName('DESC_ADM').AsString, 1, 20));

            if trim(dataSet.FieldByName('DESC_BANDEIRA').AsString) = '' then
            begin
            	buscasTmp.Close;
	            buscasTmp.SQL.Text := ' select cod_bandeira, descricao from bandeiras_cartao ' +
              	' where cod_bandeira = ' + IntToStr(dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger) +
                ' and cod_empresa = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
                	IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger),
                  vDadosIni.codEmpresa);
              buscasTmp.Open;

              if not buscasTmp.IsEmpty then
                relCred.Imp(vLinha, 84, Copy(buscasTmp.FieldByName('DESCRICAO').AsString, 1, 20));
            end
            else
	            relCred.Imp(vLinha, 84, Copy(dataSet.FieldByName('DESC_BANDEIRA').AsString, 1, 20));
              
            relCred.Imp(vLinha, 106, vDadosIni.StrZero(dataSet.FieldByName('NPARCELA').AsInteger, 3));
            relCred.Imp(vLinha, 117, vDadosIni.StrZero(dataSet.FieldByName('QTDE_PARC').AsInteger, 3));

            buscasTmp.Close;
            buscasTmp.SQL.Text := ' select first 1 tax.taxa from adm_cartao_taxas_bandeiras tax ' +
            	' where tax.cod_bandeira = ' + IntToStr(dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger) +
              ' and tax.cod_adm = ' + IntToStr(dataSet.FieldByName('COD_ADM').AsInteger) +
              ' and tax.cod_empresa = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
              	IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger),
                vDadosIni.codEmpresa) +
              ' and ' + IntToStr(dataSet.FieldByName('QTDE_PARC').AsInteger) + ' >= tax.parcelas_de ' +
              ' and ' + IntToStr(dataSet.FieldByName('QTDE_PARC').AsInteger) + ' <= tax.parcelas_ate ';
            buscasTmp.Open;

            if not buscasTmp.IsEmpty then
              relCred.Imp(vLinha, 133, vDadosIni.AlnDir(format('%n', [buscasTmp.FieldByName('TAXA').AsFloat]), 5))
            else
            	relCred.Imp(vLinha, 133, vDadosIni.AlnDir(format('%n', [0.00]), 5));

            if dataSet.FieldByName('VALOR_LIQUIDO').AsFloat <> dataSet.FieldByName('VALOR_C').AsFloat then
              relCred.Imp(vLinha, 148, vDadosIni.AlnDir(format('%n', [
               (1 - (dataSet.FieldByName('VALOR_LIQUIDO').AsFloat / dataSet.FieldByName('VALOR_C').AsFloat)) * 100]), 5))
            else
              relCred.Imp(vLinha, 148, vDadosIni.AlnDir(format('%n', [0.00]), 5));
          end;

          if (dadosImpressao.vCodVendNome)
          	or ((dadosImpressao.vComJuros)
          		and ((Trim(dataSet.FieldByName('STATUS_C').AsString) <> '')
            		 	or (dataSet.FieldByName('JUROS_COB').AsFloat > 0)
		              or (dataSet.FieldByName('VALOR_DESC').AsFloat > 0))) then
          begin
            vLinha := vLinha + 1;
            if (dadosImpressao.vCodVendNome) then
            begin
            	buscasTmp.Close;
              buscasTmp.SQL.Text := ' select nome_vendedor from colaborador ' +
                ' where cod_vendedor = ' + IntToStr(dataSet.FieldByName('CODIGO_VEND').AsInteger) +
                ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger);
              buscasTmp.Open;

            	relCred.Imp(vLinha, 1, vDadosIni.StrZero(dataSet.FieldByName('CODIGO_VEND').AsInteger, 5));
              if not buscasTmp.IsEmpty then
	              relCred.Imp(vLinha, 22, Copy(trim(buscasTmp.FieldByName('nome_vendedor').AsString), 1, 40));
            end;

            if ((dadosImpressao.vComJuros)
          		and ((Trim(dataSet.FieldByName('STATUS_C').AsString) <> '')
            		 	or (dataSet.FieldByName('JUROS_COB').AsFloat > 0)
		              or (dataSet.FieldByName('VALOR_DESC').AsFloat > 0))) then
            begin
              relCred.Imp(vLinha, 65, Copy(dataSet.FieldByName('STATUS_C').AsString, 1, 30));
              relCred.Imp(vLinha, 97, dataSet.FieldByName('DATQ_C').AsString);
              relCred.Imp(vLinha, 108, vDadosIni.AlnDir(format('%n',
                [dataSet.FieldByName('JUROS_COB').AsFloat]), 10));
              relCred.Imp(vLinha, 118, vDadosIni.alndir(format('%n',
                [dataSet.FieldByName('VALOR_DESC').AsFloat]), 10));
              if Trim(dataSet.FieldByName('STATUS_C').AsString) <> '' then
              begin
                vValorJuros := vValorJuros + dataSet.FieldByName('JUROS_COB').AsFloat;
                vValorDesconto := vValorDesconto + dataSet.FieldByName('valor_desc').AsFloat;
              end;
            end;
          end;

          if vEnd then
          begin
            buscasTmp.Close;
            buscasTmp.SQL.Text := 'select endereco, bairro, cidade, fone_cliente, cod_cliente,' +
              ' num_end_cliente, cpfcgc from clientes' +
              ' where cod_cliente = ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger) +
              ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
              	IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger),
                vDadosIni.codEmpresa);
            buscasTmp.Open;
            if not buscasTmp.IsEmpty then
            begin
              vLinha := vLinha + 1;

              relCred.Imp(vLinha, 1, Copy(Trim(buscasTmp.FieldByName('ENDERECO').AsString), 1, 30) + ', ' +
                Copy(Trim(buscasTmp.FieldByName('NUM_END_CLIENTE').AsString), 1, 6));
              relCred.Imp(vLinha, 40, Copy(buscasTmp.FieldByName('cpfcgc').AsString, 1, 14));
              relCred.Imp(vLinha, 55, Copy(buscasTmp.FieldByName('BAIRRO').AsString, 1, 20));
              relCred.Imp(vLinha, 76, Copy(buscasTmp.FieldByName('CIDADE').AsString, 1, 25));
              relCred.Imp(vLinha, 102, buscasTmp.FieldByName('FONE_CLIENTE').AsString);
              relCred.Imp(vLinha, 117, vDadosIni.StrZero(buscasTmp.FieldByName('COD_CLIENTE').AsInteger, 5));
            end;
          end;
          vValorCr := vValorCr + dataSet.FieldByName('VALOR_C').AsCurrency;
          vValorLiq := vValorLiq + dataSet.FieldByName('VALOR_LIQUIDO').AsCurrency;
          if (dataSet.FieldByName('VALOR_CORR').AsCurrency > 0) then
            vValorCorr := vValorCorr + dataSet.FieldByName('VALOR_CORR').AsCurrency
          else
            vValorCorr := vValorCorr + dataSet.FieldByName('VALOR_C').AsCurrency;
        end;
        dataSet.next;
        if vLinha >= 60 then
        begin
          vLinha := 1;
          relCred.Novapagina;
          _cabecalho;
        end;
      end;
    finally
    	dataSet.First;
      dataSet.EnableControls;
    	restoreRecNo;
    end;
  finally
  	if vAgruparEmpUnf then
    	dataSet.IndexFieldNames := '';
  end;

  vLinha := vLinha + 1;
  if dadosImpressao.vExibirVenda then
    relCred.Imp(vlinha, 1, vDadosIni.Replicate('=', vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf), 156, 152)))
  else if dadosImpressao.vBandAdmnParc then
	  relCred.Imp(vlinha, 1, vDadosIni.Replicate('=', 152))
  else if (vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf) then
    relCred.Imp(vlinha, 1, vDadosIni.Replicate('=', 135))
  else if not vAgruparEmpUnf then
	  relCred.Imp(vLinha, 1, vDadosIni.replicate('=', vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (not vAgruparEmpUnf), 145, 135)));
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, 'TOTAL DE CREDITO IMPRESSO');
  relCred.Imp(vLinha, 097, vDadosIni.AlnDir(format('%n', [vValorCr]), 10));
  relCred.Imp(vLinha, 109, vDadosIni.AlnDir(format('%n', [vValorLiq]), 10));
  relCred.Imp(vLinha, 121, vDadosIni.AlnDir(format('%n', [vValorCorr]), 10));
  vLinha := vLinha + 1;
  relCred.Imp(vLinha, 1, 'TOTAL JUROS RECEBIDOS: ');
  if vAgruparEmpUnf then
    relCred.ImpF(vLinha, 24, vDadosIni.AlnDir(format('%n', [vValorJuros]), 10), [negrito])
  else
    relCred.Imp(vLinha, 24, vDadosIni.AlnDir(format('%n', [vValorJuros]), 10));
  relCred.Imp(vLinha, 46, 'TOTAL DESCONTOS CONCEDIDOS: ');
  if vAgruparEmpUnf then
    relCred.ImpF(vLinha, 74, vDadosIni.AlnDir(format('%n', [vValorDesconto]), 10), [negrito])
  else
    relCred.Imp(vLinha, 74, vDadosIni.AlnDir(format('%n', [vValorDesconto]), 10));
  relCred.Fechar;

  if dataSet.ChangeCount > 0 then
  begin
  	Apply;
    CommitaTransacao;
  end;
end;

function TControleCredito._removerPendenciaConciliacaoCartao: Boolean;
begin

  Result := False;
  try
    if vPendenciasCartao.dataSet.FieldByName('seqid').AsInteger = 0 then
      raiseExceptionCreate('Nenhuma pendencia selecionada', '');

    buscas.Close;
    buscas.SQL.Text := 'select * from controle_creditos ' +
      ' where RO_ADM = ' + IntToStr(vPendenciasCartao.dataSet.FieldByName('RO_ADM').AsInteger) +
      ' and NSU_RO_ADM = ' + QuotedStr(Trim(vPendenciasCartao.dataSet.FieldByName('NSU_RO_ADM').AsString)) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa +
      ' and DATQ_C is null';

    buscas.Open;
    if not buscas.IsEmpty then
      raiseExceptionCreate('Pendência não pode ser excluída pois está vinculada a um crédito não quitado' + #13 +
      'Num Doc: ' + buscas.FieldByName('N_DOC_C').AsString + #13 +
      'Valor: ' + Format('%0.2n', [buscas.FieldByName('VALOR_C').AsFloat]) + #13 +
      'Vencimento: ' + FormatDateTime('dd/mm/yyyy', buscas.FieldByName('DATA_VENC_C').AsDateTime) + #13 +
      'Tipo: ' + Trim(buscas.FieldByName('TIPO_DOC_C').AsString) + #13 +
      'Cod Cred: ' + buscas.FieldByName('COD_CRED').AsString + #13 +
      'Histórico: ' + buscas.FieldByName('HISTORICO_C').AsString, '');

    buscas.Close;
    buscas.SQL.Text := 'delete from PENDENCIAS_CARTAO' +
                       ' where seqid = ' + IntToStr(vPendenciasCartao.dataSet.FieldByName('seqid').AsInteger) +
                       ' and cod_empresa =  ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
    begin
      buscas.Transaction.Commit;
      vDadosIni.GravaAuditoria('CAR082', 'EXCLUIR', 'SUCESSO', 'PENDENCIAS_CARTAO', '', conta.buscas);
    end;


  except on E: Exception do
    begin
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Rollback;
      vDadosIni.GravaAuditoria('CAR082', 'EXCLUIR', 'FALHA', 'PENDENCIAS_CARTAO', '', conta.buscas);
      Application.MessageBox(pchar('Erro: ' +E.Message), 'Atenção', 0 + 64);
      registraErro('function TControleCredito._removerPendenciaConciliacaoCartao. Erro: ' + e.Message);
      verificaErroDataSetOpen(E.Message);
    end;
  end;
end;

function TControleCredito._replicarControleCredito: Boolean;
var
  I, J, vCodCreditoRepl: Integer;
  vDataVencimento: TDate;
  vCOD_CREDITOS: string;
  vGerarBoleto: boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  try
    if not vDadosIni.PesqPros('CAR028', 'REPLICAR', 'COD_CRED ' +
      dataSet.FieldByName('COD_CRED').AsString +
      ' NUM DOC ' + Trim(dataSet.FieldByName('N_DOC_C').AsString),
      FTable, dataSet.FieldByName('COD_CRED').AsString + '/' +
      Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas, True) then
      Exit;

    if not vDadosIni.VerificarinicioFechFinan(buscas) then
      exit;

    if _documentoRecebidoOuSendoRecebido then
      Exit;

    FDiaReplicacao := DayOf(dataSet.FieldByName('data_venc_c').AsDateTime);

    if dataSet.FieldByName('cod_cliente').AsInteger <= 0 then
      raiseExceptionCreate('Documento sem o código do cliente. Operação não permitida', '');

    if Trim(dataSet.FieldByName('n_doc_c').AsString) = '' then
      raiseExceptionCreate('Crédito sem número de documento. Operação não permitida', '');

    if not _abreFormReplicacaoContas then
      Exit;

    vGerarBoleto := false;
    if not Recebendo then
    begin
      SqlOpen(' SELECT * FROM CONTROLES WHERE CXENT = ''S''' +
        ' AND USAR_BOLETO = ''S'' ' +
        ' AND CODIGO_CTRL = ' + IntToStr(dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
        ' AND ATIVO = 1 AND CODIGO_EMP = ' + vDadosIni.codEmpresa +
        ' AND COALESCE(NAO_GERA_FINAN, '''') <> ''S''' +
        ' AND COALESCE(BAIXA_AUTOMATICA, '''') <> ''S''' +
        ' ORDER BY QSEQPERF ');
      if not buscas.IsEmpty then
        vGerarBoleto := true;
    end;

    try
      vDadosIni.abreStatusProcessamento('', 'Efetuando Lançamento de Entrada');

{$REGION 'lancamento de entrada'}

      vLancL := TLancamentosImp.create;
      vContLigL := TContaLigacaoImp.create;

      vLancL._setTransactionComponentes(transacao);
      vLancL.N_CONTA_PLC := dataSet.FieldByName('N_CONTA_PLC').AsFloat;

      vContLigL._AbrirContadeLigacao(True);

      //      vContLigL.vPCont.dataSet.Locate('N_CONTA_PLC', vLancL.N_CONTA_PLC, []);
      if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
        raiseExceptionCreate('Corrija o cadastro para continuar', '');

      vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
      vLancL.CODIGO_CTRL := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
      vLancL.NOME_CTRL := '';
      vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
      vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
      vLancL.HISTORICO_L := 'REPLICAÇÃO DO CRÉDITO ' + dataSet.FieldByName('COD_CRED').AsString;
      vLancL.VALOR_L := dataSet.FieldByName('VALOR_C').AsCurrency * FQtdeReplicacao;
      vLancL.NDOC_L := Trim(dataSet.FieldByName('N_DOC_C').AsString);
      //vLancL.TIP_CNT := Trim(dataSet.FieldByName('TIP_CNT').AsString);
      vLancL.COD_EMP_MULT := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
      if FReplVlContReplicacao then
        vLancL.VL_CONTABIL := dataSet.FieldByName('vl_contabil').AsFloat
      else
        vLancL.VL_CONTABIL := 0;
      vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
      vLancL._efetuarLancamento;

{$ENDREGION}

{$REGION 'lancamento creditos'}

      vDataVencimento := dataSet.FieldByName('data_venc_c').AsDateTime;
      vCodCreditoRepl := dataSet.FieldByName('COD_CRED').AsInteger;

      vDadosIni.abreStatusProcessamento('', 'Armazenando dados em cache');

      buscas.Close;
      buscas.SQL.Text := 'select * from CONTROLE_CREDITOS' +
        ' where cod_cred = ' + IntToStr(vCodCreditoRepl) +
        ' and codigo_emp = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if buscas.IsEmpty then
        raiseExceptionCreate('Não encontrado o Crédito no banco de dados', '');

      if ReplAltNumQtdeReplicacao then
      begin
      	vDadosIni.abreStatusProcessamento('', 'Replicando conta. ' +
        	vDadosIni.StrZero(1, 2) + ' de ' + vDadosIni.StrZero(FQtdeReplicacao + 1, 2));
          
      	dataSet.Edit;
        dataSet.FieldByName('N_DOC_C').AsString := Trim(buscas.FieldByName('N_DOC_C').AsString) + '-' + intToStr(1);
        dataSet.FieldByName('NPARCELA').AsInteger := 1;
        dataSet.FieldByName('QTDE_PARC').AsInteger := FQtdeReplicacao + 1;
      	dataSet.Post;

//        if not Apply then
//          raiseExceptionCreate('Operação será abortada', '');
      end;

      for I := 1 to FQtdeReplicacao do
      begin
        if ReplAltNumQtdeReplicacao then
        begin
	        vDadosIni.abreStatusProcessamento('', 'Replicando conta. ' +
  	      	vDadosIni.StrZero(I + 1, 2) + ' de ' + vDadosIni.StrZero(FQtdeReplicacao + 1, 2));
        end
        else
        begin
        	vDadosIni.abreStatusProcessamento('', 'Replicando conta. ' +
  	      	vDadosIni.StrZero(I, 2) + ' de ' + vDadosIni.StrZero(FQtdeReplicacao, 2));
        end;

        vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;

        if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), FDiaReplicacao) then
          vDataVencimento := StartOfTheMonth(vDataVencimento) + FDiaReplicacao - 1
        else
          vDataVencimento := EndOfTheMonth(vDataVencimento);

        dataSet.Insert;
        for J := 0 to dataSet.FieldCount - 1 do
        begin
          if dataSet.Fields[J].FieldKind = fkData then
            if buscas.FindField(dataSet.Fields[J].FieldName) <> nil then
            begin
              if (UpperCase(trim(dataSet.Fields[J].FieldName)) <> 'N_AUT_CART')
		          	and (UpperCase(trim(dataSet.Fields[J].FieldName)) <> 'N_DOCNSU_ADM') then
              begin
                dataSet.FieldByName(dataSet.Fields[J].FieldName).Value :=
                  buscas.FieldByName(dataSet.Fields[J].FieldName).Value;
              end;
            end;
        end;

        if ReplAltNumQtdeReplicacao then
        begin
        	dataSet.FieldByName('N_DOC_C').AsString := Trim(buscas.FieldByName('N_DOC_C').AsString) + '-' + intToStr(I + 1);
        	dataSet.FieldByName('NPARCELA').AsInteger := I + 1;
  	      dataSet.FieldByName('QTDE_PARC').AsInteger := FQtdeReplicacao + 1;
        end
        else
        begin
        	dataSet.FieldByName('N_DOC_C').AsString := Trim(buscas.FieldByName('N_DOC_C').AsString) + '-' + intToStr(I);
	        dataSet.FieldByName('NPARCELA').AsInteger := I;
  	      dataSet.FieldByName('QTDE_PARC').AsInteger := FQtdeReplicacao;
        end;
        dataSet.FieldByName('DATA_VENC_C').AsDateTime := StrToDate(DateToStr(vDataVencimento));

        dataSet.FieldByName('STATUS_C').Value := Null;
        dataSet.FieldByName('SELEC').Value := Null;
        dataSet.FieldByName('DATQ_C').Value := Null;
        dataSet.FieldByName('US_BX').Value := Null;
        //dataSet.FieldByName('DTORIGINAL_C').AsDateTime := vDadosIni.diaFFinanceiro + 1;
        dataSet.FieldByName('LOTE_QUIT').Value := Null;
        dataSet.FieldByName('LOTE_ENT').Value := Null;
        dataSet.FieldByName('DIA_CXL').Value := Null;
        dataSet.FieldByName('STATUS_CXL_RQ').Value := Null;
        dataSet.FieldByName('VL_RQ_PG_CXL').Value := Null;
        dataSet.FieldByName('OP_CXL').Value := Null;
        dataSet.FieldByName('LOTE_CXL').Value := Null;
        dataSet.FieldByName('TP_REC_CXL').Value := Null;
        dataSet.FieldByName('PRCSS').Value := Null;
        dataSet.FieldByName('COONAOFISCAL').Value := Null;
        dataSet.FieldByName('NSERIEECF').Value := Null;
        dataSet.FieldByName('COD_TERMINAL').Value := Null;
        dataSet.FieldByName('NOSSO_NUMERO_BANCO').Value := Null;
        dataSet.FieldByName('DATA_REC_C').AsDateTime := vDadosIni.diaFFinanceiro + 1;

        FCodigo := Gencodigo('CONTROLE_CREDITOS', dtmContasAReceber.SpIncCodigo, vDadosIni.codEmpresa);

        if trim(vCOD_CREDITOS) = '' then
           vCOD_CREDITOS := IntToStr(FCodigo)
        else
           vCOD_CREDITOS := vCOD_CREDITOS + ', ' + IntToStr(FCodigo);

        vDadosIni.hw_registra_estatistica('CONTROLE_CREDITOS');
        dataSet.FieldByName('COD_CRED').AsInteger := FCodigo;

        if not FReplVlContReplicacao then
          dataSet.FieldByName('VL_CONTABIL').AsFloat := 0;
        dataSet.FieldByName('TIP_CNT').AsString := vDadosIni.retornoPorCondicao(dataSet.FieldByName('VL_CONTABIL').AsFloat > 0, 'C', 'N');
        dataSet.Post;

        if not Apply then
          raiseExceptionCreate('Operação será abortada', '');

        //Efetuando lancamento na tabela lanccheque

        FBuscas2.Close;
        FBuscas2.SQL.Text := 'INSERT INTO CREDITOS_LANC ( COD_LANC, COD_CRED, CODIGO_EMP)' +
          ' VALUES ( :COD_LANC, :COD_CRED, :CODIGO_EMP)';
        FBuscas2.ParamByName('COD_LANC').AsInteger := vLancL.COD_LANC;
        FBuscas2.ParamByName('COD_CRED').AsInteger := FCodigo;
        FBuscas2.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
        FBuscas2.ExecSQL;

      end;

{$ENDREGION}

    finally
      vDadosIni.fechaStatusProcessamento;
      vLancL._setTransactionComponentes(nil);
      vContLigL.Free;
      vLancL.Free;
        
      vContLigL:= nil;
      vLancL := nil;
    end;

    try
      vDadosIni.abreStatusProcessamento('', 'Confirmando transação em banco de dados');

      CommitaTransacao;

      Result := True;

      vDadosIni.GravaAuditoria('CAR028', 'REPLICAR', 'COD_CRED ' + IntToStr(vCodCreditoRepl) +
        ' QTDE ' + IntToStr(FQtdeReplicacao) + ' DIA ' + IntToStr(FDiaReplicacao),
        FTable, IntToStr(vCodCreditoRepl), buscas);

      dataSet.Refresh;

      if (vGerarBoleto) and (trim(vCOD_CREDITOS) <> '') then
      begin
        montaSelect(' select ' + Fsql_campos + ' from controle_creditos ' +
          Fsql_inner +
          Fsql_inner_pag +
          ' where controle_creditos.codigo_emp = ' + vDadosIni.codEmpresa +
          ' and controle_creditos.cod_cred in (' + vCOD_CREDITOS + ')');
        if not dataSet.IsEmpty then
        begin
        	try
          	dataSet.DisableControls;
            dataSet.First;
            while not dataSet.Eof do
            begin
              dataSet.Edit;
              dataSet.FieldByName('SEL').AsString := 'S';
              dataSet.Post;

              dataSet.Next;
            end;
          finally
            dataSet.First;
            dataSet.EnableControls;
          end;

          _imprimirBoleto(false, true, true);
        end;
      end;

    finally
      vDadosIni.fechaStatusProcessamento;
    end;

  except
    on e: exception do
    begin
      RollBackTransacao;
      dataSet.Refresh;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TControleCredito._replicarControleCredito. Erro: ' + e.Message);
    end;
  end;

end;

function TControleCredito._replicarCreditosPeloCadastro(var vCOD_CREDITOS: string): Boolean;
var
  I: Integer;
  vDataVencimento: TDate;
  J: Integer;
  vCopia: TClientDataSet;
begin
  Result := False;
  vDataVencimento := dataSet.FieldByName('data_venc_c').AsDateTime;

  vCopia := TClientDataSet.Create(Application);
  try
    vCopia.FieldDefs.Clear;
    buscas.Close;
    buscas.SQL.Text := 'select * from controle_creditos where cod_cred = 0  and codigo_emp = 0';
    buscas.Open;

    for I := 0 to buscas.FieldDefs.Count - 1 do
    try
      vCopia.FieldDefs.Add(
        buscas.FieldDefs[i].Name,
        buscas.FieldDefs[i].DataType,
        buscas.FieldDefs[i].Size, False);
    except
    end;

    try
      vCopia.CreateDataSet;
    except
    end;
    vCopia.EmptyDataSet;
    vCopia.Insert;
    for I := 0 to dataSet.FieldCount - 1 do
      if dataSet.Fields[I].FieldKind = fkData then
        if vCopia.FindField(dataSet.Fields[I].FieldName) <> nil then
          vCopia.FieldByName(dataSet.Fields[I].FieldName).Value :=
            dataSet.FieldByName(dataSet.Fields[I].FieldName).Value;
    vCopia.Post;

    for I := 1 to FQtdeReplicacao do
    begin

      vDadosIni.abreStatusProcessamento('', 'Replicando conta. ' + vDadosIni.StrZero(I, 2) + ' de '
        + vDadosIni.StrZero(FQtdeReplicacao, 2));

      vDataVencimento := EndOfTheMonth(vDataVencimento) + 1;
      if IsValidDate(YearOf(vDataVencimento), MonthOf(vDataVencimento), FDiaReplicacao) then
        vDataVencimento := StartOfTheMonth(vDataVencimento) + FDiaReplicacao - 1
      else
        vDataVencimento := EndOfTheMonth(vDataVencimento);

      dataSet.Insert;
      for J := 0 to dataSet.FieldCount - 1 do
      begin
        if dataSet.Fields[J].FieldKind = fkData then
          if vCopia.FindField(dataSet.Fields[J].FieldName) <> nil then
          begin
//          	if (UpperCase(trim(dataSet.Fields[J].FieldName)) <> 'N_AUT_CART')
//	          	and (UpperCase(trim(dataSet.Fields[J].FieldName)) <> 'N_DOCNSU_ADM') then
//            begin
              dataSet.FieldByName(dataSet.Fields[J].FieldName).Value :=
                vCopia.FieldByName(dataSet.Fields[J].FieldName).Value;
//            end;
          end;
      end;

      if not FRecebendo then
      begin
        FCodigo := Gencodigo('CONTROLE_CREDITOS', dtmContasAReceber.SpIncCodigo,
          vDadosIni.codEmpresa);
        vDadosIni.hw_registra_estatistica('CONTROLE_CREDITOS');
      end
      else
        FCodigo := 0;
      if trim(vCOD_CREDITOS) = '' then
      	vCOD_CREDITOS := IntToStr(FCodigo)
      else
      	vCOD_CREDITOS := vCOD_CREDITOS + ', ' + IntToStr(FCodigo);

      dataSet.FieldByName('COD_CRED').AsInteger := FCodigo;

      if ReplAltNumQtdeReplicacao then
      begin
      	if Pos('-', Trim(vCopia.FieldByName('N_DOC_C').AsString)) > 0 then
		      dataSet.FieldByName('N_DOC_C').AsString :=
  	      	Copy(Trim(vCopia.FieldByName('N_DOC_C').AsString), 1, Pos('-', Trim(vCopia.FieldByName('N_DOC_C').AsString)) - 1) +
    	      '-' + intToStr(I + 1)
        else
        	dataSet.FieldByName('N_DOC_C').AsString :=
          	Trim(vCopia.FieldByName('N_DOC_C').AsString) +
            '-' + intToStr(I + 1);

        dataSet.FieldByName('NPARCELA').AsInteger := I + 1;
        dataSet.FieldByName('QTDE_PARC').AsInteger := FQtdeReplicacao + 1;
      end
      else
      begin
      	if Pos('-', Trim(vCopia.FieldByName('N_DOC_C').AsString)) > 0 then
          dataSet.FieldByName('N_DOC_C').AsString :=
            Copy(Trim(vCopia.FieldByName('N_DOC_C').AsString), 1, Pos('-', Trim(vCopia.FieldByName('N_DOC_C').AsString)) - 1) +
            '-' + intToStr(I)
        else
        	dataSet.FieldByName('N_DOC_C').AsString :=
          	Trim(vCopia.FieldByName('N_DOC_C').AsString) +
            '-' + intToStr(I);
            
        dataSet.FieldByName('NPARCELA').AsInteger := I;
        dataSet.FieldByName('QTDE_PARC').AsInteger := FQtdeReplicacao;
      end;
      
      dataSet.FieldByName('DATA_VENC_C').AsDateTime := StrToDate(DateToStr(vDataVencimento));
      if not FReplVlContReplicacao then
        dataSet.FieldByName('VL_CONTABIL').AsFloat := 0;
      dataSet.FieldByName('TIP_CNT').AsString := vDadosIni.retornoPorCondicao(dataSet.FieldByName('VL_CONTABIL').AsFloat > 0, 'C', 'N');
      dataSet.Post;

      if not FRecebendo then
      begin

        if not Apply then
          raiseExceptionCreate('Operação será abortada', '');

        //Efetuando lancamento na tabela creditos_lanc

        FBuscas2.Close;
        FBuscas2.SQL.Text := 'INSERT INTO CREDITOS_LANC ( COD_LANC, COD_CRED, CODIGO_EMP)' +
          ' VALUES ( :COD_LANC, :COD_CRED, :CODIGO_EMP)';
        FBuscas2.ParamByName('COD_LANC').AsInteger := vLancL.COD_LANC;
        FBuscas2.ParamByName('COD_CRED').AsInteger := FCodigo;
        FBuscas2.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
        FBuscas2.ExecSQL;
      end;

    end;

    Result := True;

  finally
    vCopia.EmptyDataSet;
    vCopia.Free;
    vCopia := nil;
  end;

end;

function TControleCredito._validaValoresBaixaCartao: Boolean;
var
  vValorSoma: Extended;
begin
  Result := True;

  if not dadosReceber.processamentoAutomatico then
    Exit;

  buscas.Close;
  buscas.SQL.Text := 'select cc.idbaixa_cartao, cc.codigo_ctrl,' +
    ' sum(cc.valor_c) valor_c' +
    ' from controle_creditos cc' +
    ' where ' + vDadosIni.IfThen(dadosReceber.processamentoAutomaticoDev,
    		'cc.iddev_cartao', 'cc.idbaixa_cartao') +
    ' = ' + IntToStr(dadosReceber.loteBaixaAdm) +
    ' and cc.status_adm = 1' +
    ' and cc.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and cc.lote_quit = ' + IntToStr(dadosReceber.loteQuitacao) +
    ' group by 1,2';
  buscas.Open;

  vValorSoma := 0;

  buscas.First;
  while not buscas.Eof do
  begin
    vValorSoma := vValorSoma + buscas.FieldByName('valor_c').AsFloat;
    buscas.Next;
  end;

  if vDadosIni.StrToFloatFormat(vValorSoma, 2) <> vDadosIni.StrToFloatFormat(dadosReceber.valorSaidaCartao, 2) then
  begin
    Result := False;
    Application.MessageBox( PChar(
      'Valores de saída não conferem. Por favor tente novamente!'), 'Atenção', 0 + 64);
    Exit;
  end;

  buscas.Close;
  buscas.SQL.Text := 'select cc.idbaixa_cartao, cc.codigo_ctrl_cred, c.codigo_ctrl,' +
    ' sum(cc.valor_c) valor_c' +
    ' from controle_creditos cc' +
    ' left join controles c on c.codigo_ctrl = cc.codigo_ctrl_cred and c.codigo_emp = cc.codigo_emp' +
    ' where ' + vDadosIni.IfThen(dadosReceber.processamentoAutomaticoDev,
    		'cc.iddev_cartao', 'cc.idbaixa_cartao') +
    ' = ' + IntToStr(dadosReceber.loteBaixaAdm) +
    ' and cc.status_adm = 1' +
    ' and cc.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and cc.lote_quit = ' + IntToStr(dadosReceber.loteQuitacao) +
    ' group by 1,2,3';
  buscas.Open;

  vValorSoma := 0;

  buscas.First;
  while not buscas.Eof do
  begin
    vValorSoma := vValorSoma + buscas.FieldByName('valor_c').AsFloat;
    buscas.Next;
  end;

  if vDadosIni.StrToFloatFormat(vValorSoma, 2) <> vDadosIni.StrToFloatFormat(dadosReceber.valorSaidaCartao, 2) then
  begin
    Result := False;
    Application.MessageBox( PChar(
      'Valores de entrada não conferem. Por favor tente novamente!'), 'Atenção', 0 + 64);
    Exit;
  end;
end;

function TControleCredito._verificadocrecebidoparcial: boolean;
begin
  buscas.Close;
  buscas.SQL.Text :=
  'select count(*) soma from baixa_creditos bx where bx.cod_cred = '+
  IntToStr(dataset.FieldByName('COD_CRED').AsInteger)+
  ' and bx.codigo_emp = '+vDadosIni.codEmpresa+' and tp_operacao = ''P''';
  buscas.Open;

  Result :=(buscas.FieldByName('soma').AsInteger > 0)
end;

function TControleCredito._VerificaTpControle(vcontr: integer): boolean;
begin
  buscas.close;
  buscas.sql.text := 'SELECT DOCS FROM CONTROLES ' +
  	' where codigo_ctrl = ' + inttostr(vcontr) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa;
  buscas.open;
  if buscas.FieldByName('DOCS').AsString = 'S2' then
    result := true
  else
    result := false;
end;

function TControleCredito._vicularTransacaoPendente: Boolean;
var
  formulario: TfrmPadrao;
  vOK: Boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('CAR081', 'ALTERAR', 'NUM CRED ' +
    dataSet.FieldByName('N_DOC_C').AsString, 'CONTROLE_CREDITOS',
    dataSet.FieldByName('COD_CRED').AsString, buscas, True) then
    Exit;

  if dataSet.IsEmpty then
    Exit;

  vCtrl._selecionaControle(dataSet.FieldByName('codigo_ctrl').AsInteger);

  if vCtrl.dataSet.FieldByName('TP_PLANO').AsString <> 'C' then
    raiseExceptionCreate('Controle de crédito selecionado não é do Tipo Plano = "C - Cartao"', '');
  

  if Trim(dataSet.FieldByName('DATQ_C').AsString) <> '' then
    raiseExceptionCreate('Crédito não pode ser vinculado. Já foi quitado', '');

  vPendenciasCartao.dataSet.Filter := '';
  vPendenciasCartao.dataSet.Filtered := True;
  vPendenciasCartao.abrePendenciasCartao;

  if vPendenciasCartao.dataSet.IsEmpty then
    raiseExceptionCreate('Sem registros na tabela de Pendências', '');

  {$REGION 'abreFormDadosPendeciaCartao'}

  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Vincular pendências de Cartão de Crédito';

    frmCadContasAReceber.pnPendenciasCartao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;

    vOK := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnPendenciasCartao.Parent := frmCadContasAReceber.tsPendencias;
    formulario.Free;
    formulario := nil;
  end;
  {$ENDREGION}

  if vOK then
  begin
    dataSet.edit;
    dataSet.FieldByName('N_AUT_CART').AsString := vPendenciasCartao.dataSet.FieldByName('N_AUT_CART_CRED').AsString;
    dataSet.FieldByName('N_DOCNSU_ADM').AsString := vPendenciasCartao.dataSet.FieldByName('NUM_DOC_ADM').AsString;
    dataSet.FieldByName('STATUS_ADM').AsInteger := vPendenciasCartao.dataSet.FieldByName('STATUS_ADM').AsInteger;
    dataSet.FieldByName('DESC_STATUS_ADM').AsString := vPendenciasCartao.dataSet.FieldByName('DESC_STATUS_ADM').AsString;
    dataSet.FieldByName('NSU_RO_ADM').AsString := vPendenciasCartao.dataSet.FieldByName('NSU_RO_ADM').AsString;
    dataSet.FieldByName('RO_ADM').AsInteger := vPendenciasCartao.dataSet.FieldByName('RO_ADM').AsInteger;
    dataSet.FieldByName('COD_TERMINAL_ADM').AsString := vPendenciasCartao.dataSet.FieldByName('COD_TERMINAL_ADM').AsString;
    dataSet.FieldByName('TIPO_PROD_ADM').AsInteger := vPendenciasCartao.dataSet.FieldByName('TIPO_PROD_ADM').AsInteger;
    dataSet.FieldByName('DESC_TIPO_PROD_ADM').AsString := vPendenciasCartao.dataSet.FieldByName('DESC_TIPO_PROD_ADM').AsString;
    dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger := vPendenciasCartao.dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger;
    dataSet.FieldByName('DESC_BANDEIRA').AsString := vPendenciasCartao.dataSet.FieldByName('DESC_BANDEIRA').AsString;
    dataSet.FieldByName('IND_ANTEC_RO_ADM').AsString := vPendenciasCartao.dataSet.FieldByName('IND_ANTEC_RO_ADM').AsString;
    dataSet.FieldByName('IND_OR_AJUSTE_ADM').AsInteger := vPendenciasCartao.dataSet.FieldByName('IND_OR_AJUSTE_ADM').AsInteger;
    dataSet.FieldByName('IND_OR_DESC_AJUSTE').AsString := vPendenciasCartao.dataSet.FieldByName('IND_OR_DESC_AJUSTE').AsString;
    dataSet.FieldByName('ARQ_EXTRATO_ADM').AsString := vPendenciasCartao.dataSet.FieldByName('ARQ_EXTRATO_ADM').AsString;
    dataSet.FieldByName('TAXA_CARTAO_CRED').AsCurrency := vPendenciasCartao.dataSet.FieldByName('TAXA_CARTAO_CRED').AsCurrency;
    dataSet.FieldByName('TARIFA_CARTAO_CRED').AsCurrency := vPendenciasCartao.dataSet.FieldByName('TARIFA_CARTAO').AsCurrency;
    dataset.FieldByName('CODIGO_CTRL_CRED').AsInteger := vPendenciasCartao.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
    dataset.FieldByName('COD_ADM').AsInteger := vPendenciasCartao.dataSet.FieldByName('COD_ADM').AsInteger;
    if vPendenciasCartao.dataSet.FieldByName('NPARCELA').AsInteger > 0 then
      dataset.FieldByName('NPARCELA').AsInteger := vPendenciasCartao.dataSet.FieldByName('NPARCELA').AsInteger;
    dataset.Post;

    Result := Apply;
    CommitaTransacao;
  end;

end;

function TControleCredito._visualizarLoteBaixa: Boolean;
begin
  Result := False;
  try

    if vBx.dataSet.IsEmpty then
      Exit;

    if not vDadosIni.PesqPros('CAR046', 'VISUALIZAR', 'NUM CRED ' +
      Trim(vBx.dataSet.FieldByName('N_DOC_C').AsString) +
      ' CLIENTE ' + vBx.dataSet.FieldByName('COD_CLIENTE').AsString +
      ' OPERADOR ' + IntToStr(vDadosIni.vCodUsuario), 'CONTROLE_CREDITOS',
      IntToStr(vBx.dataSet.FieldByName('COD_CRED').AsInteger) + '/' +
      Trim(vBx.dataSet.FieldByName('N_DOC_C').AsString), buscas, True) then
      Exit;

    vBx.dataSet.RefreshRecord;

    if vBx.dataSet.FieldByName('lote_quit').AsInteger <= 0 then
      raiseExceptionCreate('Lote de quitação não encontrado', '');

    buscas.Close;
    buscas.SQL.Text :=
      'select c.nome_ctrl "Controle",' +
      ' cc.n_conta_plc "Nº da Conta",' +
      ' cc.nome_ch "Nome do Cliente",' +
      ' cc.n_ch "Nº do Documento",' +
      ' cc.historico_ch "Histórico",' +
      ' cc.data_rec "Data Recebimento",' +
      ' cc.data_venc "Data Vencimento",' +
      ' cc.valor_ch "Valor",' +
      ' ''Cheque'' "Tipo",' +
      ' cc.codigo_ch "Número"' +
      ' from controle_cheque cc' +
      ' inner join controles c on c.codigo_ctrl = cc.codigo_ctrl and c.codigo_emp = cc.codigo_emp' +
      ' where cc.lote_quit = ' + IntToStr(vBx.dataSet.FieldByName('lote_quit').AsInteger) +
      ' and cc.codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
      		IntToStr(vBx.dataSet.FieldByName('codigo_emp').AsInteger), vDadosIni.codEmpresa) +
      ' union ' +
      ' select c.NOME_CTRL "Controle",' +
      ' ccc.N_CONTA_PLC "Nº da Conta",' +
      ' cc.NOME_C "Nome do Cliente",' +
      ' cc.N_DOC_C "Nº do Documento",' +
      ' cc.HISTORICO_C "Histórico",' +
      ' cc.DATA_REC_C "Data Recebimento",' +
      ' cc.DATA_VENC_C "Data Vencimento",' +
      ' cc.VALOR_C "Valor",' +
      ' ''Crédito'' "Tipo",' +
      ' cc.cod_cred "Número"' +
      ' from baixa_creditos cc' +
      ' inner join controles c on c.codigo_ctrl = cc.codigo_ctrl and c.codigo_emp = cc.codigo_emp' +
      ' inner join controle_creditos ccc on ccc.cod_cred = cc.cod_cred and ccc.codigo_emp = cc.codigo_emp' +
      ' where cc.lote_quit = ' + IntToStr(vBx.dataSet.FieldByName('lote_quit').AsInteger) +
      ' and cc.codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
	      IntToStr(vBx.dataSet.FieldByName('codigo_emp').AsInteger), vDadosIni.codEmpresa);
    buscas.Open;

    TFloatField(buscas.FieldByName('Valor')).DisplayFormat   := '#,##0.00';

    _abreFormLoteQuitacao;

  except on E: Exception do
    begin
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TControleCredito._visualizarLoteBaixa. Erro: ' + e.Message);
      verificaErroDataSetOpen(E.Message);
    end;
  end;
end;

procedure TControleCredito.abreFormDocumentosOrigem(pTipoForm: Integer);
begin
  vDocumentosOrigem.abreDocumentosOrigem(
  	 dataSet.FieldByName('N_DOC_V').AsInteger,
    dataSet.FieldByName('TP_DOC_V').AsString,
    dataSet.FieldByName('COD_EMP_MULT').AsInteger);
    
  if not vDadosIni.abreForm('Documentos de Origem',
    frmCadContasAReceber.pnDocumentosOrigem, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
      Exit;
end;

function TControleCredito.abreFormParcelamentoContas(var pContas: RContas; pAlter: boolean): Boolean;
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
    formulario.Caption := 'Contas a receber';
    frmCadContasAReceber.pnFaturaRec.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := True;
    formulario.BorderIcons := [];

    frmCadContasAReceber.Edit14.Text := dataSet.FieldByName('N_DOC_C').AsString;
    frmCadContasAReceber.EditHw3.AsValue := dataSet.FieldByName('VALOR_C').AsFloat;
    if not frmCadContasAReceber.cdsDesp.IsEmpty then
    	frmCadContasAReceber.edcreditoQtdeParcelas.Value := frmCadContasAReceber.cdsDesp.RecordCount
    else
	   frmCadContasAReceber.edcreditoQtdeParcelas.Value := 1;

    frmCadContasAReceber.BitBtn66.Enabled := true;
    frmCadContasAReceber.BitBtn67.Enabled := true;
    frmCadContasAReceber.btGerar.Enabled := true;
    frmCadContasAReceber.btApagarDesp.Enabled := true;

    if pAlter then
    begin
      frmCadContasAReceber.ListBox3.Clear;
      frmCadContasAReceber.ListBox1.Clear;
      frmCadContasAReceber.Edit14.Enabled := False;
      frmCadContasAReceber.EditHw3.Enabled := False;

      gerarContas(pContas, pAlter);
    end;

    result := (formulario.ShowModal = mrOk);
  finally
    frmCadContasAReceber.DBEdit1.Enabled := frmCadContasAReceber.cdsDesp.IsEmpty;
    frmCadContasAReceber.pnFaturaRec.Parent := frmCadContasAReceber.tsFaturaRec;
    formulario.Free;
    formulario := nil;
  end;
end;

function TControleCredito.apagarContas: boolean;
begin
  try
    Result := True;
    frmCadContasAReceber.ListBox3.Clear;
    frmCadContasAReceber.ListBox1.Clear;
  except
    Result := False;
  end;
end;

procedure TControleCredito.ApagarContasPagarTemp(cdsDesp: TClientDataSet);
begin
   while not cdsDesp.IsEmpty do
    cdsDesp.Delete;
end;

constructor TControleCredito.create(ATransaction: TIBTransaction);
var
 vTemp: string;
begin
  vTemp := ' '' '' n_doc_c_temp, '' '' n_doc_v_temp, ';
  if vDadosIni.vRecibo.HabRecPorDepart then
    vTemp := ' case when ((cc.tp_doc_v = ''REC'') and (cc.nparcela > 0)) then ' +
             '        (recibos.num_rec_dep ||''-''||cc.nparcela) ' +
             ' 	  else ' +
             '			 cc.n_doc_c ' +
             ' end n_doc_c_temp, ' +
             ' case when ((cc.tp_doc_v = ''REC'') and (cc.nparcela > 0)) then ' +
             '        recibos.num_rec_dep ' +
             '      else ' +
             '		    cc.n_doc_v ' +
             ' end n_doc_v_temp,';
        	
  Fsql_campos := ' controle_creditos.*, ' + vTemp +
                 vDadosIni.IfThen(vDadosIni.vContasAReceber.vExibirValorFormasPag,  ' retorna_pag_cr.form_pag2 as form_pag, ', ' retorna_pag_cr.form_pag, ') +
                 ' controles.nome_ctrl, empresa.identificacao_emp, ' +
                 ' p_contas.desc_plc, grupos_ct.desc_gr, depart_ct.desc_dep, p_contas.cod_cta_contabil, p_contas_contabil.nome_cta, ' +
                 ' clientes.nome_cliente, clientes.razao razao_cliente, clientes.cpfcgc cpfcgc_cliente, ' +
                 ' clientes.cep, clientes.endereco, clientes.num_end_cliente, clientes.complemento, ' +
                 ' clientes.fone_cliente, clientes.fone_celular, clientes.email, ' +
                 ' clientes.cod_localidade, localidade.localidade, localidade.cod_setor, setor.setor, ' +
                 ' tipo_faturamento.status_f, estados.sigla_uf, cidades.nome_cidade, bairros.nome_bairro ';

  Fsql_inner :=  ' left join empresa on empresa.cod_empresa = controle_creditos.cod_emp_mult ' +
                 ' left join controles on controles.codigo_ctrl = controle_creditos.codigo_ctrl and controles.codigo_emp = controle_creditos.cod_emp_mult ' +
                 ' left join p_contas on p_contas.n_conta_plc = controle_creditos.n_conta_plc ' +
                 ' left join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct ' +
                 ' left join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep ' +
                 ' left join p_contas_contabil on p_contas_contabil.cod_cta = p_contas.cod_cta_contabil and p_contas_contabil.cod_empresa = controle_creditos.cod_emp_mult ' +
                 ' left join recibos on recibos.nrecibo = controle_creditos.n_doc_v and recibos.cod_empresa = controle_creditos.codigo_emp and controle_creditos.tp_doc_v = ''REC'' ' +
                 ' left join clientes on clientes.cod_cliente = controle_creditos.cod_cliente and clientes.cod_empresa = controle_creditos.cod_emp_mult ' +
                 ' left join localidade on localidade.cod_localidade = clientes.cod_localidade and localidade.cod_empresa = clientes.cod_empresa ' +
                 ' left join setor on setor.cod_setor = localidade.cod_setor and setor.cod_empresa = localidade.cod_empresa ' +
                 ' left join tipo_faturamento on tipo_faturamento.codigo_faturamento = clientes.codigo_faturamento ' +
                 ' left join estados on estados.codigo_uf = clientes.codigo_uf ' +
                 ' left join cidades on cidades.cod_cidade = clientes.cod_cidade ' +
                 ' left join bairros on bairros.cod_bairro = clientes.cod_bairro ';

  Fsql_inner_pag :=
                 ' left join retorna_pag_cr (controle_creditos.lote_quit, controle_creditos.datq_c, ' + vDadosIni.codEmpresa + ', 0, '''') on 1 = 1 ';

  TableName := 'CONTROLE_CREDITOS';

  if dtmContasAReceber = nil then
    dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);
  if Assigned(ATransaction) then
  begin
    transacao := ATransaction;
    buscasCreditoCheque := TIBQuery(dtmContasAReceber.qrCtrlCr3);
    DataSet := TClientDataSet(dtmContasAReceber.cdsCtrlCr3);
  end
  else
  begin
	 transacao := TIBTransaction(dtmContasAReceber.transacao);
    buscasCreditoCheque := TIBQuery(dtmContasAReceber.qrCtrlCr);
    DataSet := TClientDataSet(dtmContasAReceber.cdsCtrlCr);
  end;
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);
  FBuscas2 := TIBQuery(dtmContasAReceber.qrBuscas2);
  Fbuscas1 := TIBQuery(dtmContasAReceber.qrBuscas1);
  Fbuscas3 := TIBQuery(dtmContasAReceber.qrBuscas3);
  FDataSource := TDataSource(dtmContasAReceber.dsCtrlCr);
  FDataSource2 := TDataSource(dtmContasAReceber.dsCtrlCr2);
  FDataSource.DataSet := dataSet;
  vdepto := TClientDataSet(dtmContasAReceber.CdsDeptoEndiv);

  buscas.Close;
  Fbuscas1.Close;
  Fbuscas2.Close;
  Fbuscas3.Close;
  buscasCreditoCheque.Close;

  buscas.Transaction 						   := transacao;
  Fbuscas1.Transaction 					   := transacao;
  Fbuscas2.Transaction 					   := transacao;
  Fbuscas3.Transaction 					   := transacao;
  buscasCreditoCheque.Transaction	 := transacao;

  dataSet.FieldByName('RAZAO').OnGetText := dataSetNomeRazaoGetText;
  dataSet.FieldByName('NOME_C').OnGetText := dataSetNomeRazaoGetText;
  dataSet.FieldByName('CPFCGC').OnGetText := dataSetNomeRazaoGetText;

  if not vDadosIni.vRecibo.HabRecPorDepart then
  begin
    dataSet.FieldByName('N_DOC_C_TEMP').Tag := 1;
    dataSet.FieldByName('N_DOC_V_TEMP').Tag := 1;
  end
  else
  begin
    dataSet.FieldByName('N_DOC_C').Tag := 1;
    dataSet.FieldByName('N_DOC_V').Tag := 1;
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

  //Arqui ele abre o dataset apenas para deixar as colunas definidas
  if not dataSet.Active then
    montaSelect(' select ' + Fsql_campos + ' from controle_creditos ' +
      Fsql_inner +
      Fsql_inner_pag +
      ' where controle_creditos.cod_cred = 0 ' +
      ' and controle_creditos.codigo_emp = 0 ');

  //  FDocs := vDadosIni.vPesquisa;
  FDocs := 'S2';
  FCodigoLancamento := 0;

  vPCont := TPContasCAR.create;
  vCtrl := TControlesCAR.create;
  vHistPCont := THistPContas.create;
  vContabanc := TContasBancariasCAR.create;
  vCl := TClienteCAR.create;
  vBx := TBaixaCreditos.create(FDocs);
  vObs := TObs_Cred.create;
  vTerminalCartao := TTerminalCartao.create;
  vTerminalCartao.dataSet:= TClientDataSet(dtmContasAReceber.cdstermCart);
  vBandeiraCartao := TBandeiras_Cartao.create;
  vBandeiraCartao.dataSet:= TClientDataSet(dtmContasAReceber.cdsBandeiraCartao);
  vPendenciasCartao := TPendenciasCartao.create;
  vEmpresasUnificadas:= TEmpresasUnificadas.create;
  vDocumentosOrigem := TDocumentosOrigem.create;

  FTable := 'CONTROLE_CREDITOS';
  FRecebendo := False;

  dadosRecibo.qtde := 0;
  dadosRecibo.codClienteDoRecibo := 0;
  dadosRecibo.docDoRecibo := '';
  dadosRecibo.nomeClienteRecibo := '';
  dadosRecibo.dataVencRecibos := '';
  dadosRecibo.valorRecibo := 0;
  dadosRecibo.docDoReciboL := TStringList.Create;
  dadosRecibo.docDoReciboL.Clear;
  dadosRecibo.dataVencRecibosL := TStringList.Create;
  dadosRecibo.dataVencRecibosL.Clear;
end;

function TControleCredito.delete: boolean;
var
  vRecNo: Integer;
begin
  Result := False;

  try
    Screen.Cursor := crHourGlass;

    if dataSet.IsEmpty then
      Exit;

    if not vDadosIni.VerificarinicioFechFinan(buscas) then
      exit;

    if _documentoRecebidoOuSendoRecebido then
      Exit;

    FCodigo := dataSet.FieldByName('COD_CRED').AsInteger;

    if not vDadosIni.PesqPros('CAR010', 'EXCLUIR', 'NUM DOC ' +
      Trim(dataSet.FieldByName('N_DOC_C').AsString) +
      ' ' + dataSet.FieldByName('NOME_C').AsString,
      FTable, IntToStr(FCodigo) + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas, True) then
      Exit;

    if Application.MessageBox(pchar('Tem Certeza que deseja Apagar este Registro?'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

    try

      dataSet.RefreshRecord;

      if Trim(dataSet.FieldByName('DATQ_C').AsString) <> '' then
        raiseExceptionCreate('Crédito Não Pode Ser apagado. Já foi quitado', '');

      buscas.Close;
      buscas.SQL.Text := 'select * from CREDITOS_LANC' +
        ' where COD_CRED = ' + IntToStr(FCodigo) +
        ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if buscas.IsEmpty then
      begin

        buscas.Close;
        buscas.SQL.Text := 'delete from CONTROLE_CREDITOS' +
          ' where COD_CRED = ' + IntToStr(FCodigo) +
          ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
        buscas.ExecSQL;

//        dataSet.Delete;
//        Apply;

        CommitaTransacao;
        Result := True;

        vDadosIni.GravaAuditoria('CAR010', 'EXCLUIR', 'COD CRED ' + IntToStr(FCodigo) +
          ' SEM CREDITOS_LANC',
          FTable, IntToStr(FCodigo), FBuscas2);

        Application.MessageBox(
          'Não foi possível localizar o lançamento correspondente (CREDITOS_LANC). O Crédito foi apagado porém o lançamento não foi alterado',
          'Atenção', 0 + 64);

        dataSet.Close;
        dataSet.Open;

        Exit;
      end;

      FBuscas2.Close;
      FBuscas2.SQL.Text := 'select cod_lanc, status_l, valor_l from lancamentos' +
        ' where cod_lanc = ' + IntToStr(buscas.FieldByName('cod_lanc').AsInteger) +
        ' and codigo_emp = ' + vDadosIni.codEmpresa;
      FBuscas2.Open;

      if FBuscas2.IsEmpty then
      begin

        buscas.Close;
        buscas.SQL.Text := 'delete from CREDITOS_LANC' +
          ' where COD_CRED = ' + IntToStr(FCodigo) +
          ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
        buscas.ExecSQL;

        buscas.Close;
        buscas.SQL.Text := 'delete from CONTROLE_CREDITOS' +
          ' where COD_CRED = ' + IntToStr(FCodigo) +
          ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
        buscas.ExecSQL;

//        dataSet.Delete;
//        Apply;

        CommitaTransacao;
        Result := True;

        vDadosIni.GravaAuditoria('CAR010', 'EXCLUIR', 'COD CRED ' + IntToStr(FCodigo) +
          ' SEM LANCAMENTO',
          FTable, IntToStr(FCodigo), FBuscas2);

        Application.MessageBox(
          'Não foi possível localizar o lançamento correspondente (LANCAMENTOS). O Crédito foi apagado porém o lançamento não foi encontrado',
          'Atenção', 0 + 64);
        dataSet.Close;
        dataSet.Open;
        Exit;

      end;

      if Trim(FBuscas2.FieldByName('status_l').AsString) <> '' then
        raiseExceptionCreate('Credito Não pode ser Apagado, entrou em data já fechada', '');

      if (dataSet.FieldByName('valor_c').AsFloat < FBuscas2.FieldByName('valor_l').AsFloat) then
      begin
        FBuscas2.Close;
        FBuscas2.SQL.Text := 'update lancamentos set valor_l = valor_l - :valor_l' +
          ' where cod_lanc = ' + IntToStr(buscas.FieldByName('cod_lanc').AsInteger) +
          ' and codigo_emp = ' + vDadosIni.codEmpresa;
        FBuscas2.ParamByName('valor_l').AsFloat := dataSet.FieldByName('valor_c').AsFloat;
      end
      else
      begin
        FBuscas2.Close;
        FBuscas2.SQL.Text := 'delete from lancamentos' +
          ' where cod_lanc = ' + IntToStr(buscas.FieldByName('cod_lanc').AsInteger) +
          ' and codigo_emp = ' + vDadosIni.codEmpresa;
      end;
      FBuscas2.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := 'delete from CREDITOS_LANC' +
        ' where COD_CRED = ' + IntToStr(FCodigo) +
        ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := 'delete from CONTROLE_CREDITOS' +
        ' where COD_CRED = ' + IntToStr(FCodigo) +
        ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;

//      dataSet.Delete;

//      if not Apply then
//        raiseExceptionCreate('Não foi possivel excluir o registro', '');

      CommitaTransacao;
      Result := True;

      vDadosIni.GravaAuditoria('CAR010', 'EXCLUIR', 'COD CRED ' + IntToStr(FCodigo) + ' SUCESSO',
        FTable, IntToStr(FCodigo), FBuscas2);

      FBuscas2.Close;
      buscas.Close;

      dataSet.Close;
      dataSet.Open;

    except
      on e: exception do
      begin
        RollBackTransacao;
        registraErro('function TControleCredito.delete. Erro: ' + e.Message);
        Application.MessageBox(pchar('Erro ao excluir crédito. Erro: ' + e.Message),
          'Atenção', 0 + 64);
      end;
    end;

  finally
    Screen.Cursor := crDefault;
  end;
end;

destructor TControleCredito.Destroy;
begin

  vPCont.Free;
  vPCont := nil;

  vCtrl.Free;
  vCtrl := nil;

  vHistPCont.Free;
  vHistPCont := nil;

  vContabanc.Free;
  vContabanc := nil;

  vCl.Free;
  vCl := nil;

  vBx.Free;
  vBx := nil;

  vObs.Free;
  vObs := nil;

  vEmpresasUnificadas.Free;
  vEmpresasUnificadas := nil;

  vDocumentosOrigem.Free;
  vDocumentosOrigem := nil;

  inherited;
end;

function TControleCredito.edit: Boolean;
begin

  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CAR008', 'ALTERAR', '', FTable, dataSet.FieldByName('cod_cred').AsString
    + '/' + trim(dataSet.FieldByName('n_doc_c').AsString),
    buscas, True) then
    exit;

  if not vDadosIni.definirDiaFinanceiroFechado(buscas) then
    Exit;

  fbookMark := dataSet.GetBookmark;

  if (dataSet.FieldByName('status_c').AsString) <> '' then
    Result := True
  else if inherited Edit then
  begin
    FCodigo := dataSet.FieldByName('cod_cred').AsInteger;
    vCodEmpMult := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
    vCodigoCtrl := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
    Result := True;
  end;

  if Result then
  begin
    vPCont._abrePContasLanc('E', dataSet.FieldByName('N_CONTA_PLC').AsFloat);
    vCtrl._abreTodosControlesCAR(
    	FDocs,
      false,
      dataSet.FieldByName('CODIGO_CTRL').AsInteger,
      dataSet.FieldByName('COD_EMP_MULT').AsInteger);
    vTerminalCartao.abreTerminalCartao;
    vEmpresasUnificadas._abreTodosEmpresas;
    FDiaReplicacao := 0;
    FQtdeReplicacao := 0;
  end;

end;

function TControleCredito.gerarContas(var pContas: RContas; pAlter: boolean): boolean;
var
  I, K: Integer;
  dias: array of integer;
  vCond: string;
begin
 Result := False;
 K:=0;
 I := 0;
 SetLength(dias, 100);
 SetLength(pContas.vencimentoDocumento, 100);
 SetLength(pContas.CodCred, 100);
 SetLength(pContas.dataReferencia, 100);
 SetLength(pContas.numeroDocumento, 100);
 SetLength(pContas.CodFornecedor, 100);
 SetLength(pContas.CodTpDespesa, 100);
 SetLength(pContas.Controle, 100);
 SetLength(pContas.NumConta, 100);
 SetLength(pContas.NCHQ, 100);
 SetLength(pContas.NCHQNominal, 100);
 SetLength(pContas.valorDocumento, 100);
 SetLength(pContas.numVenda, 100);
 SetLength(pContas.tipoVenda, 100);
 SetLength(pContas.historico, 100);

 pContas.parcelas := 0;
  try
    frmCadContasAReceber.ListBox3.Clear;
    frmCadContasAReceber.ListBox1.Clear;

    if frmCadContasAReceber.cdsDesp.IsEmpty then
    begin                                                                   
       vCond := IntToStr(frmCadContasAReceber.edcreditoQtdeParcelas.Value) + 'X';

      if not vDadosIni.montarParcelamento(buscas, pContas.numeroDocumento, pContas.vencimentoDocumento, pContas.valorDocumento,
       trim(frmCadContasAReceber.Edit14.Text), vDadosIni.StrToFloatFormat(frmCadContasAReceber.EditHw3.AsValue, 2),
      dataSet.FieldByName('COD_CLIENTE').AsInteger, vCond,
      vDadosIni.IfThen(frmCadContasAReceber.edcreditoQtdeParcelas.Value > 0,	frmCadContasAReceber.edcreditoQtdeParcelas.Value, 1),
      'N', dataSet.FieldByName('DATA_VENC_C').AsString) then
      begin
       SetLength(pContas.vencimentoDocumento, 100);
       SetLength(pContas.numeroDocumento, 100);
       SetLength(pContas.valorDocumento, 100);
       pContas.NumConta[I] := dataSet.FieldByName('N_CONTA_PLC').AsFloat;
       pContas.numeroDocumento[I] := vDadosIni.StrZero(frmCadContasAReceber.Edit14.Text, 6) + '-1';
       pContas.CodFornecedor[I] := dataSet.FieldByName('COD_CLIENTE').AsInteger;
       pContas.Controle[I] := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
       pContas.vencimentoDocumento[I] := DateToStr(vDadosIni.getDataBanco(buscas));
       pContas.dataReferencia[I] := DateToStr(vDadosIni.getDataBanco(buscas));
       pContas.valorDocumento[I] := frmCadContasAReceber.EditHw3.AsValue;
       pContas.parcelas := pContas.parcelas + 1;
       frmCadContasAReceber.ListBox3.Items.Add(pContas.numeroDocumento[I] + '   ' + pContas.vencimentoDocumento[I] + '    ' + Format('%m', [pContas.valorDocumento[I]]));
       frmCadContasAReceber.ListBox1.Items.Add(pContas.numeroDocumento[I] + '   ' + pContas.vencimentoDocumento[I] + '    ' + Format('%m', [pContas.valorDocumento[I]]));
      end
      else
      begin
        for I := 0 to Length(pContas.numeroDocumento) - 1 do
        begin
         frmCadContasAReceber.ListBox3.Items.Add(pContas.numeroDocumento[I] + '   ' + pContas.vencimentoDocumento[I] + '    ' + Format('%m', [pContas.valorDocumento[I]]));
         frmCadContasAReceber.ListBox1.Items.Add(pContas.numeroDocumento[I] + '   ' + pContas.vencimentoDocumento[I] + '    ' + Format('%m', [pContas.valorDocumento[I]]));
         pContas.NumConta[I] := dataSet.FieldByName('N_CONTA_PLC').AsFloat;
         pContas.CodFornecedor[I] := dataSet.FieldByName('COD_CLIENTE').AsInteger;
//         pContas.historico[I] := 'DESPESA VEICULO ' + QuotedStr(vEstMoto.dataSet.FieldByName('chassi_c').AsString);
         pContas.Controle[I] := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
         pContas.dataReferencia[I] := DateToStr(vDadosIni.getDataBanco(buscas));
         pContas.parcelas := pContas.parcelas + 1;
        end;
      end;
    end
    else
    begin
       frmCadContasAReceber.cdsDesp.IndexFieldNames := 'NumConta;NumDoc';
       frmCadContasAReceber.cdsDesp.First;
       if not frmCadContasAReceber.cdsDesp.IsEmpty then
       begin
         while not frmCadContasAReceber.cdsDesp.Eof do
         begin
            pContas.NumConta[I] := frmCadContasAReceber.cdsDesp.FieldByName('NumConta').AsFloat;
	          pContas.historico[I] := frmCadContasAReceber.cdsDesp.FieldByName('Historico').AsString;
            pContas.numeroDocumento[I] :=  frmCadContasAReceber.cdsDesp.FieldByName('NumDoc').AsString;
            pContas.CodFornecedor[I] := frmCadContasAReceber.cdsDesp.FieldByName('CodFornecedor').AsInteger;
            pContas.Controle[I] := frmCadContasAReceber.cdsDesp.FieldByName('Controles').AsInteger;
            pContas.vencimentoDocumento[I] := frmCadContasAReceber.cdsDesp.FieldByName('DataVenc').AsString;
            pContas.dataReferencia[I] := frmCadContasAReceber.cdsDesp.FieldByName('DataReferencia').AsString;
            pContas.valorDocumento[I] := frmCadContasAReceber.cdsDesp.FieldByName('Valor').AsFloat;
            pContas.NCHQ[I] := frmCadContasAReceber.cdsDesp.FieldByName('NChq').AsString;
            pContas.NCHQNominal[I] := frmCadContasAReceber.cdsDesp.FieldByName('NominalChq').AsString;
            frmCadContasAReceber.ListBox3.Items.Add(trim(frmCadContasAReceber.cdsDesp.FieldByName('NumDoc').AsString) + '   '
             + trim(frmCadContasAReceber.cdsDesp.FieldByName('DataVenc').AsString) + '    ' + Format('%m', [frmCadContasAReceber.cdsDesp.FieldByName('Valor').AsFloat]));
            frmCadContasAReceber.ListBox1.Items.Add(trim(frmCadContasAReceber.cdsDesp.FieldByName('NumDoc').AsString) + '   '
             + trim(frmCadContasAReceber.cdsDesp.FieldByName('DataVenc').AsString) + '    ' + Format('%m', [frmCadContasAReceber.cdsDesp.FieldByName('Valor').AsFloat])); 
            pContas.parcelas := pContas.parcelas + 1;
            Inc(I);
            
            frmCadContasAReceber.cdsDesp.Next;
         end;
       end;
       frmCadContasAReceber.cdsDesp.First;
    end;
    Result := True;
 except
   Result := False;
 end;
end;

procedure TControleCredito.GravarContasPagarTemp(var pContas: RContas; cdsDesp: TClientDataSet);
var
 I, vParcela: Integer;
 vNomeCtr, vContrBanco: string;
begin
  vParcela := 0;
  while not cdsDesp.IsEmpty do
    cdsDesp.Delete;
  for I := 0 to pContas.parcelas - 1 do
  begin
    Inc(vParcela);
    cdsDesp.Insert;
    cdsDesp.FieldByName('NumConta').AsFloat := pContas.NumConta[I];
//    cdsDesp.FieldByName('Departamento').AsString := trim(vPlanoC.dataset.FieldByName('desc_dep').AsString);
    cdsDesp.FieldByName('CodCred').AsInteger := pContas.CodCred[I];
    cdsDesp.FieldByName('DataReferencia').AsString := pContas.dataReferencia[I];
    cdsDesp.FieldByName('DataVenc').AsString := pContas.vencimentoDocumento[I];
    cdsDesp.FieldByName('NumDoc').AsString := pContas.numeroDocumento[I];
    cdsDesp.FieldByName('Historico').AsString := pContas.historico[I];
    cdsDesp.FieldByName('TipoDespesa').AsInteger := pContas.CodTpDespesa[I];
    cdsDesp.FieldByName('Valor').AsFloat := pContas.valorDocumento[I];
    cdsDesp.FieldByName('CodFornecedor').AsInteger := pContas.CodFornecedor[I];
    cdsDesp.FieldByName('Controles').AsInteger := pContas.Controle[I];
    cdsDesp.FieldByName('NChq').AsString := pContas.NCHQ[I];
    cdsDesp.FieldByName('NominalChq').AsString := pContas.NCHQNominal[I];
    cdsDesp.FieldByName('Parcela').AsInteger := vParcela;

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
  cdsDesp.First;
end;

function TControleCredito.insert: Boolean;
var
 vTemp: string;
begin

  Result := False;

  if not vDadosIni.PesqPros('CAR006', 'INCLUIR', '', FTable, '',
    buscas, True) then
    exit;

  if not vDadosIni.VerificarinicioFechFinan(buscas) then
    exit;

  if not vDadosIni.definirDiaFinanceiroFechado(buscas) then
    Exit;

  //if _documentoRecebidoOuSendoRecebido then
    //Exit;

  dataSet.FieldByName('RAZAO').OnGetText := dataSetNomeRazaoGetText;
  dataSet.FieldByName('NOME_C').OnGetText := dataSetNomeRazaoGetText;
  dataSet.FieldByName('CPFCGC').OnGetText := dataSetNomeRazaoGetText;

  vTemp := ' '' '' n_doc_c_temp, '' '' n_doc_v_temp, ';
  if vDadosIni.vRecibo.HabRecPorDepart then
    vTemp := ' case when ((cc.tp_doc_v = ''REC'') and (cc.nparcela > 0)) then ' +
        '     (recibos.num_rec_dep ||''-''||cc.nparcela) ' +
        ' else cc.n_doc_c end n_doc_c_temp, ' +
        ' case when ((cc.tp_doc_v = ''REC'') and (cc.nparcela > 0)) then ' +
        '     recibos.num_rec_dep ' +
        ' else cc.n_doc_v end n_doc_v_temp,';

  if not dataSet.Active then
    montaSelect(' select cc.*, ' + vTemp +
    	' retorna_pag_cr.form_pag, controles.nome_ctrl, empresa.identificacao_emp, ' +
    	' p_contas.desc_plc, grupos_ct.desc_gr, depart_ct.desc_dep, p_contas.cod_cta_contabil, p_contas_contabil.nome_cta, ' +
      ' c.nome_cliente, c.razao razao_cliente, c.cpfcgc cpfcgc_cliente, ' +
      ' c.cep, c.endereco, c.num_end_cliente, c.complemento, ' +
      ' c.fone_cliente, c.fone_celular, c.email, ' +
      ' c.cod_localidade, l.localidade, l.cod_setor, s.setor, ' +
      ' tf.status_f, est.sigla_uf, cid.nome_cidade, bai.nome_bairro from controle_creditos cc ' +
      ' left join empresa on empresa.cod_empresa = cc.cod_emp_mult ' +
      ' left join controles on controles.codigo_ctrl = cc.codigo_ctrl and controles.codigo_emp = cc.cod_emp_mult  ' +
      ' left join p_contas on p_contas.n_conta_plc = cc.n_conta_plc ' +
      ' left join grupos_ct on p_contas.grup_ct = grupos_ct.grup_ct ' +
      ' left join depart_ct on grupos_ct.cod_dep = depart_ct.cod_dep ' +
      ' left join p_contas_contabil on p_contas_contabil.cod_cta = p_contas.cod_cta_contabil and p_contas_contabil.cod_empresa = cc.cod_emp_mult ' +
      ' left join clientes c on c.cod_cliente = cc.cod_cliente and c.cod_empresa = cc.cod_emp_mult ' +
      ' left join localidade l on l.cod_localidade = c.cod_localidade and l.cod_empresa = c.cod_empresa ' +
      ' left join setor s on s.cod_setor = l.cod_setor and s.cod_empresa = l.cod_empresa ' +
      ' left join tipo_faturamento tf on tf.codigo_faturamento = c.codigo_faturamento ' +
      ' left join recibos on recibos.nrecibo = cc.n_doc_v and recibos.cod_empresa = cc.codigo_emp and cc.tp_doc_v = ''REC'' ' +
      ' left join estados est on est.codigo_uf = c.codigo_uf ' +
      ' left join cidades cid on cid.cod_cidade = c.cod_cidade ' +
      ' left join bairros bai on bai.cod_bairro = c.cod_bairro ' +
      ' left join retorna_pag_cr (cc.lote_quit, cc.datq_c, ' + vDadosIni.codEmpresa + ', 0, '''') on 1 = 1 ' +
      ' where cc.cod_cred = 0 and cc.codigo_emp = 0 ');

  fbookMark := dataSet.GetBookmark;

  if inherited insert then
  begin
    dataSet.FieldByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
    if (vDadosIni.vEmp.vFinanceiroUnificado) and (Recebendo) then
      dataSet.FieldByName('COD_EMP_MULT').AsInteger := dadosReceber.codigoUnificada
    else
      dataSet.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
    dataSet.FieldByName('DATA_REC_C').AsDateTime := vDadosIni.diaFFinanceiro + 1;
    dataSet.FieldByName('DTORIGINAL_C').AsDateTime := vDadosIni.diaFFinanceiro + 1;
    dataSet.FieldByName('TIP_CNT').AsString := 'N';
    dataSet.FieldByName('HISTORICO_C').AsString := 'RECEBIMENTO DE CREDITOS';
    if dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0 then
    begin
    	SqlOpen(' select nome_ctrl from controles ' +
      	' where codigo_ctrl = ' + IntToStr(dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
        ' and codigo_emp = ' + vDadosIni.codEmpresa);

      if not buscas.IsEmpty then
	    	dataSet.FieldByName('TIPO_DOC_C').AsString := Copy(trim(buscas.FieldByName('NOME_CTRL').AsString), 1, 15);
    end;
    dataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('TIP_CNT').AsString := 'N';
    dataSet.FieldByName('VALOR_DESC').AsFloat := 0;
    dataSet.FieldByName('VALOR_ACRESC').AsFloat := 0;
    FCodigo := 0;
    FDiaReplicacao := 0;
    FQtdeReplicacao := 0;
    vCodEmpMult := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
    vCodigoCtrl := 0;

    vPCont._abrePContasLanc('E');
    vCtrl._abreTodosControlesCAR(FDocs, dataSet.FieldByName('COD_EMP_MULT').AsInteger);
    vTerminalCartao.abreTerminalCartao;
    vEmpresasUnificadas._abreTodosEmpresas;

    Result := True;
  end;
end;

function TControleCredito.post: Boolean;
var
  acao: string;
  vTemp: string;
  vCodigoControle: Integer;
  vCodigoGenCodigo: Integer;
  vNegCliente: TNegativacaoCliente;
  vValorParcelas: Double;
  buscas2: TIBQuery;
  I, J: Integer;
  vCamposStringList, vValoresStringList: TStringList;
  vNovoValorLiquido: Double;
  vCOD_EMP_MULT, vN_DOC_V, vCODIGO_CTRL, vCOD_BANDEIRA_ADM: Integer;
  vTP_DOC_V, vN_AUT_CART, vN_DOCNSU_ADM, vCOD_TERMINAL_ADM, vDEB_CRED: string;
  vCOD_CREDITOS: string;
  vGerarBoleto: boolean;
  vCampoNsuObtrig: string;
  vCampoNumAutObrig: string;
  vListaClBarrarDesbarrar: TStringList;
begin
  try
    vListaClBarrarDesbarrar := TStringList.Create;
    vListaClBarrarDesbarrar.Sorted := True;
    vListaClBarrarDesbarrar.Duplicates := dupIgnore;
    vListaClBarrarDesbarrar.Clear;

    try
      Result := false;

      vCOD_CREDITOS := '';

      if dataSet.State = dsInsert then
        acao := 'INSERIR'
      else
        acao := 'EDITAR';

      vCOD_EMP_MULT := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
      vN_DOC_V := dataSet.FieldByName('N_DOC_V').AsInteger;
      vTP_DOC_V := dataSet.FieldByName('TP_DOC_V').AsString;
      vCODIGO_CTRL := dataSet.FieldByName('CODIGO_CTRL').AsInteger;
      vN_AUT_CART := dataSet.FieldByName('N_AUT_CART').AsString;
      vN_DOCNSU_ADM := dataSet.FieldByName('N_DOCNSU_ADM').AsString;
      vCOD_TERMINAL_ADM := dataSet.FieldByName('COD_TERMINAL_ADM').AsString;
      vCOD_BANDEIRA_ADM := dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger;
      vDEB_CRED := dataSet.FieldByName('DEB_CRED').AsString;

      buscas2 := TIBQuery.Create(Application);
      buscas2.Database := buscas.Database;
      buscas2.Transaction := buscas.Transaction;

      if not vDadosIni.PesqPros('CAR031', acao, ' NUM DOC ' +
        Trim(dataSet.FieldByName('N_DOC_C').AsString),
        FTable, IntToStr(FCodigo) + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas, True) then
        exit;

      if not (dataSet.State in [dsEdit, dsInsert]) then
      begin
        if not Recebendo then
          Result := True;
        exit;
      end;

      if vDadosIni.vEmp.vFinanceiroUnificado then
      begin
        if dataSet.FieldByName('COD_EMP_MULT').AsInteger <= 0 then
          raiseExceptionCreate('Código Empresa Unificada', 'DBEdit65');

        if not vEmpresasUnificadas._BuscarEmpresas(dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
          raiseExceptionCreate('Código Empresa Unificada não existe ou não encontrada!', 'DBEdit65');
      end
      else
        dataSet.FieldByName('COD_EMP_MULT').AsInteger := dataSet.FieldByName('CODIGO_EMP').AsInteger;

      if dataSet.FieldByName('N_CONTA_PLC').AsFloat <= 0 then
        raiseExceptionCreate('Nº da Conta deve ser preenchido', 'DBEdit24');

      if not _existePContas(0) then
        raiseExceptionCreate('Nº da Conta não encontrado no Plano de Contas ou não é de entrada', 'DBEdit24');

      if (vPCont.dataSet.FieldByName('sthab').AsString) = 'N' then
        raiseExceptionCreate('Nº da Conta Desabilitada, tente outra', 'DBEdit24');

      if dataSet.FieldByName('data_rec_c').AsDateTime > (vDadosIni.diaFFinanceiro + 1) then
        raiseExceptionCreate('Data ainda não programada', 'DBEdit27');

      if vDadosIni.vEmp.vUsarBarramento = 'S' then
        if vCtrl.dataSet.FieldByName('BARRAR_AUTOMATICO').AsString = 'S' then
          if dataSet.FieldByName('COD_CLIENTE').AsInteger = 0 then
            raiseExceptionCreate('Para controles cujo o barramento de cliente é automático o código do cliente é obrigatório. Favor informá-lo', 'DBEdit13');

      if Trim(dataSet.FieldByName('nome_c').AsString) = '' then
        raiseExceptionCreate('Nome do Cliente Inválido', 'DBEdit39');

      if Trim(dataSet.FieldByName('data_venc_c').AsString) = '' then
        raiseExceptionCreate('Data vencimento inválida', 'DBEdit36');

      if vCtrl.dataSet.FieldByName('qperf').AsInteger = 4 then
        if dataSet.FieldByName('data_venda').AsString = '' then
          raiseExceptionCreate('Data da Venda Obrigatória', 'DBEdit30');

      if vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_C').AsFloat,2) <= 0 then
        raiseExceptionCreate('Valor do crédito deve ser maior que zero', 'DBEdit37');

      if not _existeControle(
        dataSet.FieldByName('codigo_ctrl').AsInteger,
        vDadosIni.IfThen(dataSet.State = dsEdit, 0, dataSet.FieldByName('COD_EMP_MULT').AsInteger)) then
          raiseExceptionCreate('Controle não encontrado ou não informado', 'DBEdit43');

      if not dataSet.FieldByName('data_prev_rec').IsNull then
        if dataSet.FieldByName('data_venc_c').AsDateTime > dataSet.FieldByName('data_prev_rec').AsDateTime then
        begin
          if not vDadosIni.PesqPros('CAR110', 'PERMITIR', ' NUM DOC ' +
            Trim(dataSet.FieldByName('N_DOC_C').AsString),
            FTable, IntToStr(FCodigo) + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas, True) then
              raiseExceptionCreate('Data previsão recebimento menor que data vencimento', 'DBEdit70');
        end;

      try
        vCtrl._selecionaControle(
          dataSet.FieldByName('codigo_ctrl').AsInteger,
          vDadosIni.IfThen(dataSet.State = dsEdit, dataSet.FieldByName('COD_EMP_MULT').AsInteger, 0));
        if (vCtrl.dataSet.FieldByName('BARRAR_AUTOMATICO').AsString <> 'S') or (vDadosIni.vEmp.vUsarBarramento <> 'S') then
          if not _VerificaTpControle(dataSet.FieldByName('codigo_ctrl').AsInteger) then
          	raiseExceptionCreate('Tipo do controle não é para créditos(S2)', 'DBEdit18');

        if vDadosIni.vEmp.vUsarBarramento = 'S' then
          if vCtrl.dataSet.FieldByName('BARRAR_AUTOMATICO').AsString = 'S' then
            if dataSet.FieldByName('COD_CLIENTE').AsInteger = 0 then
              raiseExceptionCreate('Para controles cujo o barramento de cliente é automático o código do cliente é obrigatório. Favor informá-lo',
                'DBEdit13');
      finally
        vCtrl._abreTodosControlesCAR(FDocs, dataSet.FieldByName('COD_EMP_MULT').AsInteger);
      end;

      if not _clienteValido then
        exit;

      if not _clienteTerceiroValido then
        exit;

      _verificaDataVenda;
      vDadosIni.vInibeMensPesqPros:='S';
      if not vDadosIni.PesqPros('CAR077', acao, ' NUM DOC ' + Trim(dataSet.FieldByName('N_DOC_C').AsString),
        FTable, IntToStr(FCodigo) + '/' + Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas, True) then
          if not _existeColaborador(dataSet.FieldByName('CODIGO_VEND').AsInteger,
            dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
            raiseExceptionCreate('Colaborador não encontrado no cadastro', 'DBEdit32')
         else
           if dataSet.FieldByName('CODIGO_VEND').AsInteger > 0 then
             if not _existeColaborador(dataSet.FieldByName('CODIGO_VEND').AsInteger,
               dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
               raiseExceptionCreate('Colaborador não encontrado no cadastro', 'DBEdit32');

      if dataSet.FieldByName('CODIGO_FUNC').AsInteger > 0 then
        if not _existeColaborador(dataSet.FieldByName('CODIGO_FUNC').AsInteger,
          dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
          raiseExceptionCreate('Funcionário não encontrado no cadastro', 'DBEdit46');

     vCampoNsuObtrig   := 'N';
     vCampoNumAutObrig := 'N';
     if (Trim(vCtrl.dataSet.FieldByName('TP_PLANO').AsString) = 'C')
       and (vTerminalCartao.dataSet.RecordCount > 0)
       and (Trim(vCOD_TERMINAL_ADM) <> '') then
     begin
       buscas.Close;
       buscas.SQL.Text := ' select cod_adm, cod_empresa, ' +
         ' coalesce(campo_nsu_obrig, ''S'') campo_nsu_obrig, ' +
         ' coalesce(campo_num_aut_obrig, ''S'') campo_num_aut_obrig from adm_cartao ' +
         ' where cod_adm = ' + IntToStr(vTerminalCartao.dataSet.FieldByName('cod_adm').AsInteger) +
         ' and cod_empresa = ' + IntToStr(vTerminalCartao.dataSet.FieldByName('cod_empresa').AsInteger);
       buscas.Open;

       vCampoNsuObtrig := buscas.FieldByName('campo_nsu_obrig').AsString;
       vCampoNumAutObrig := buscas.FieldByName('campo_num_aut_obrig').AsString;

       if trim(vCampoNsuObtrig) <> 'N' then
         vCampoNsuObtrig   := 'S';
       if trim(vCampoNumAutObrig) <> 'N' then
         vCampoNumAutObrig := 'S';
     end;

     if trim(vCtrl.dataSet.FieldByName('TP_PLANO').AsString) = 'C' then
       if vTerminalCartao.dataSet.RecordCount <= 0 then
         if Trim(vN_AUT_CART) = '' then
           raiseExceptionCreate('Número da Autorização do cartão deve ser informado', 'DadosCartao');

     if trim(vCtrl.dataSet.FieldByName('TP_PLANO').AsString) = 'C' then
       if vTerminalCartao.dataSet.RecordCount > 0 then
       begin
         if (trim(vCampoNumAutObrig) = 'S') then
           if Trim(vN_AUT_CART) = '' then
             raiseExceptionCreate('Número da Autorização do cartão deve ser informado', 'DadosCartao');

         if (trim(vCampoNsuObtrig) = 'S') then
           if Trim(vN_DOCNSU_ADM) = '' then
             raiseExceptionCreate('Num Doc/NSU/CV do Cartão não informado', 'DadosCartao');

         if trim(vCOD_TERMINAL_ADM) = '' then
           raiseExceptionCreate('Terminal da Administradora de Cartão não informado', 'DadosCartao');

         SqlOpen(' select first 1 tc.cod_term_adm, ac.taxa_por_controle_bandeira from terminal_cartao tc ' +
           ' inner join adm_cartao ac on ac.cod_adm = tc.cod_adm ' +
           ' 	and ac.cod_empresa = tc.cod_empresa and ac.ativo = 1 ' +
           ' where tc.cod_term_adm = ' + QuotedStr(vCOD_TERMINAL_ADM) +
           ' and tc.cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
               IntToStr(dataSet.FieldByName('COD_EMP_MULT').AsInteger), vDadosIni.codEmpresa) +
           ' and tc.ativo = 1 ');

         if buscas.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').AsString = 'B' then
         begin
           SqlOpen('select cartao_sped from controles' +
             ' where codigo_ctrl = ' + IntToStr(dataSet.FieldByName('codigo_ctrl').AsInteger) +
             ' and tp_plano = ''C'' ' +
             ' and codigo_emp = ' + vDadosIni.codEmpresa);

           if (buscas.FieldByName('CARTAO_SPED').AsInteger = 1) or (buscas.FieldByName('CARTAO_SPED').AsInteger = 2) then
             if vCOD_BANDEIRA_ADM <= 0 then
               raiseExceptionCreate('Bandeira do Cartão não informado', 'DadosCartao');
         end;
       end;

      if Recebendo then
      begin
        vValorParcelas := 0;
        vDadosIni.vDtSetTmp.First;
        while not vDadosIni.vDtSetTmp.Eof do
        begin
          vValorParcelas := vValorParcelas + vDadosIni.vDtSetTmp.FieldByName('VALOR').AsFloat;
           vDadosIni.vDtSetTmp.Next;
        end;

      if not vDadosIni.vDtSetTmp.IsEmpty then
          if (vDadosIni.StrToFloatFormat(vValorParcelas, 2) > 0) and (vDadosIni.StrToFloatFormat(vValorParcelas, 2) <>  vDadosIni.StrToFloatFormat(dataSet.FieldByName('VALOR_C').AsFloat, 2)) then
          begin
            Application.MessageBox(Pchar('Valor total das parcelas difere do valor do crédito' + #13 +
              'Valor total do parcelamento = '''+ 'R$ ' + FormatFloat('0.00', vValorParcelas) + '''' + #13 +
              'Valor do crédito = '''+ 'R$ ' +FormatFloat('0.00', dataSet.FieldByName('VALOR_C').AsFloat) + '''' + #13 +
              'Favor conferir!'), 'Aviso', MB_OK +  MB_ICONEXCLAMATION + MB_DEFBUTTON1);
             exit;
          end;
      end;

      if not _existeVenda then
      begin
        vNomeCampoErro := 'DBComboBox3';
        Exit;
      end;

      if dataSet.FieldByName('COD_CLIENTE').AsInteger = 0 then
        dataSet.FieldByName('RAZAO').AsString := '';

      if dataSet.State = dsInsert then
      begin
        if dataSet.FieldByName('NPARCELA').IsNull then
          dataSet.FieldByName('NPARCELA').AsInteger := 1;
        if dataSet.FieldByName('QTDE_PARC').IsNull then
          dataSet.FieldByName('QTDE_PARC').AsInteger := 1;
      end;

      if (Recebendo)
        and (FQtdeReplicacao > 0)
        and (FReplAltNumQtdeReplicacao) then
      begin
        dataSet.FieldByName('N_DOC_C').AsString := Trim(dataSet.FieldByName('N_DOC_C').AsString) + '-' + intToStr(1);
        dataSet.FieldByName('NPARCELA').AsInteger := 1;
        dataSet.FieldByName('QTDE_PARC').AsInteger := FQtdeReplicacao + 1;
      end
      else if (not Recebendo) and (dataSet.State = dsInsert)
        and (FQtdeReplicacao > 0)
        and (ReplAltNumQtdeReplicacao) then
      begin
        dataSet.FieldByName('N_DOC_C').AsString := Trim(dataSet.FieldByName('N_DOC_C').AsString) + '-' + intToStr(1);
        dataSet.FieldByName('NPARCELA').AsInteger := 1;
        dataSet.FieldByName('QTDE_PARC').AsInteger := FQtdeReplicacao + 1;
      end;

  //    dataSet.FieldByName('TIPO_DOC_C').AsString := vCtrl.dataSet.FieldByName('nome_ctrl').AsString;
      if dataSet.State = dsInsert then
        if vCtrl.dataSet.FieldByName('TAXA_CARTAO').AsFloat > 0 then
          dataSet.FieldByName('VALOR_LIQUIDO').AsFloat := vDadosIni.StrToFloatFormat(
            dataSet.FieldByName('VALOR_C').AsFloat - (dataSet.FieldByName('VALOR_C').AsFloat *
            vCtrl.dataSet.FieldByName('TAXA_CARTAO').AsFloat / 100), 2);

      vCodigoGenCodigo := 0;
      if not Recebendo then
        if dataSet.State = dsInsert then
        begin
          vCodigoGenCodigo := Gencodigo('CONTROLE_CREDITOS', dtmContasAReceber.SpIncCodigo, vDadosIni.codEmpresa);
          vDadosIni.hw_registra_estatistica('CONTROLE_CREDITOS');
          dataSet.FieldByName('COD_CRED').AsInteger := vCodigoGenCodigo;
          FCodigo := vCodigoGenCodigo;
        end;

      vCodigoControle := dataSet.FieldByName('codigo_ctrl').AsInteger;
      dataSet.FieldByName('TIP_CNT').AsString := vDadosIni.retornoPorCondicao(dataSet.FieldByName('VL_CONTABIL').AsFloat > 0, 'C', 'N');

      vGerarBoleto := false;
      if not Recebendo then
      begin
        SqlOpen(' SELECT * FROM CONTROLES WHERE CXENT = ''S''' +
          ' AND USAR_BOLETO = ''S'' ' +
          ' AND CODIGO_CTRL = ' + IntToStr(vCtrl.dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
          ' AND ATIVO = 1 AND CODIGO_EMP = ' + vDadosIni.codEmpresa +
          ' AND COALESCE(NAO_GERA_FINAN, '''') <> ''S''' +
          ' AND COALESCE(BAIXA_AUTOMATICA, '''') <> ''S''' +
          ' ORDER BY QSEQPERF ');
        if not buscas.IsEmpty then
          vGerarBoleto := true;
      end;

      if (not vDadosIni.vDtSetTmp.IsEmpty) then
      begin
         try
           vCamposStringList 	:= TStringList.Create;
           vValoresStringList   := TStringList.Create;

           vCamposStringList.Clear;
           vValoresStringList.Clear;
           for I := 0 to dataSet.FieldCount - 1 do
           begin
             vCamposStringList.Add(dataSet.Fields[I].FieldName);
             vValoresStringList.Add(vDadosIni.IfThen(dataSet.FieldByName(dataSet.Fields[I].FieldName).Value = Null,
              'NULO', dataSet.FieldByName(dataSet.Fields[I].FieldName).Value));
           end;

           vDadosIni.vDtSetTmp.IndexFieldNames := 'Parcela';
           vDadosIni.vDtSetTmp.First;
           while not vDadosIni.vDtSetTmp.Eof do
           begin
             if not (dataSet.State in [dsEdit, dsInsert]) then
               dataSet.Insert;
             for I := 0 to vValoresStringList.Count - 1 do
             begin
  //	           	if (UpperCase(trim(dataSet.FieldByName(vCamposStringList[I]).FieldName)) <> 'N_AUT_CART')
  //              	and (UpperCase(trim(dataSet.FieldByName(vCamposStringList[I]).FieldName)) <> 'N_DOCNSU_ADM') then
  //              begin
                   if vValoresStringList[I] <> 'NULO'  then
                     dataSet.FieldByName(vCamposStringList[I]).Value := vValoresStringList[I];
  //              end;
             end;
             dataSet.FieldByName('COD_CRED').AsInteger := vDadosIni.vDtSetTmp.FieldByName('CodCred').AsInteger;
             dataSet.FieldByName('N_DOC_C').AsString := copy(vDadosIni.vDtSetTmp.FieldByName('NumDoc').AsString, 1, 20);
             dataSet.FieldByName('DATA_VENC_C').AsDateTime := vDadosIni.vDtSetTmp.FieldByName('DataVenc').AsDateTime;
             dataSet.FieldByName('VALOR_C').AsCurrency := vDadosIni.vDtSetTmp.FieldByName('Valor').AsCurrency;
             dataSet.FieldByName('VL_CONTABIL').AsCurrency := vDadosIni.vDtSetTmp.FieldByName('Valor').AsCurrency;
             dataSet.FieldByName('NPARCELA').AsInteger := vDadosIni.vDtSetTmp.RecNo;
             dataSet.FieldByName('QTDE_PARC').AsInteger := vDadosIni.vDtSetTmp.RecordCount;

             vDadosIni.CalcularTaxaCartao(buscas2,
               vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, vCOD_EMP_MULT, 0),
               vN_DOC_V,
               vTP_DOC_V,
               vCODIGO_CTRL,
               '',
               vCOD_TERMINAL_ADM,
               vCOD_BANDEIRA_ADM,
               vDEB_CRED,
               vDadosIni.vDtSetTmp.RecordCount,
               vDadosIni.vDtSetTmp.FieldByName('Valor').AsFloat,
               vDadosIni.vDtSetTmp.FieldByName('Valor').AsFloat,
               0,
               false,
               vNovoValorLiquido);
             dataSet.FieldByName('VALOR_LIQUIDO').AsFloat := vNovoValorLiquido;

             dataSet.Post;

             if trim(vCOD_CREDITOS) = '' then
               vCOD_CREDITOS := IntToStr(vDadosIni.vDtSetTmp.FieldByName('CodCred').AsInteger)
             else
               vCOD_CREDITOS := vCOD_CREDITOS + ', ' + IntToStr(vDadosIni.vDtSetTmp.FieldByName('CodCred').AsInteger);

             vDadosIni.vDtSetTmp.Next;
           end;

         finally
           FreeAndNil(vCamposStringList);
           FreeAndNil(vValoresStringList);
         end;
      end
      else
      begin
        if vGerarBoleto then
          vCOD_CREDITOS := IntToStr(dataSet.FieldByName('COD_CRED').AsInteger);
        dataSet.Post;
      end;

      if not Recebendo then
      begin
      	if ((vDadosIni.vCliente.Barramento.vBarraAutomaticamenteAposVencCrediario = 'S')
            and (vDadosIni.vCliente.Barramento.vCodigoBarrado > 0))
          or ((vDadosIni.vCliente.Barramento.vDesbarraAutomaticamenteAposQuitCrediario = 'S')
            and (vDadosIni.vCliente.Barramento.vCodigoDesbarrado > 0)) then
        begin
          if (dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
          begin
            if (vDadosIni.vEmp.vFinanceiroUnificado)
              and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
            begin
              if trim(dataSet.FieldByName('CPFCGC').AsString) <> '' then
                vListaClBarrarDesbarrar.Add(trim(dataSet.FieldByName('CPFCGC').AsString));
            end
            else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
              vListaClBarrarDesbarrar.Add(IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger));
          end;
        end;
      end;

      if dataSet.ChangeCount = 0 then
      begin
        if not Recebendo then
          Result := True;
        exit;
      end;

      if Recebendo then
      begin
        if FQtdeReplicacao > 0 then
          _replicarCreditosPeloCadastro(vCOD_CREDITOS);

        Result := True;
        Exit;
      end;

      Apply;

      if not Recebendo then
        if dataSet.FieldByName('cod_cliente').AsInteger > 0 then
          try//
            vCtrl._selecionaControle(dataSet.FieldByName('codigo_ctrl').AsInteger);
            if vCtrl.dataSet.FieldByName('barrar_automatico').AsString = 'S' then
            begin
              vNegCliente := TNegativacaoCliente.create(buscas.Transaction, FDocs);
              vNegCliente.dados.acao := naNegativar;
              vNegCliente.dados.alterarConta := True;
              vNegCliente.dados.alterarContaStatus := nacsAbertas; // contas abertas pois o credito acaba de ser cadastrado
              vNegCliente.dados.codConta := dataSet.FieldByName('COD_CRED').AsInteger; // codigo da conta para alterar
              vNegCliente.dados.loteQuit := 0; // 0 pois o importante aqui é o credito e o cliente
              vNegCliente.dados.codCliente := dataSet.FieldByName('cod_cliente').AsInteger; // cliente do credito
              vNegCliente.dados.codigoUnificada := dataSet.FieldByName('cod_emp_mult').AsInteger;
              if not vNegCliente.executar then
                raiseExceptionCreate(vNegCliente.MsgErro, '');
            end;
          finally
            vCtrl._abreTodosControlesCAR(FDocs, dataSet.FieldByName('COD_EMP_MULT').AsInteger);
          end;

      try
        vLancL := TLancamentosImp.create;
        vContLigL := TContaLigacaoImp.create;

        vLancL._setTransactionComponentes(transacao);
        //vLancL.queryLanc.Transaction := transacao;


        if vCodigoGenCodigo > 0 then
        begin

          vContLigL._AbrirContadeLigacao(True);

          vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_V_PROD').AsFloat;

          //        vContLigL.vPCont.dataSet.Locate('N_CONTA_PLC', vLancL.N_CONTA_PLC, []);
          if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
            raiseExceptionCreate('Corrija o cadastro para continuar', '');

          vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
          vLancL.CODIGO_CTRL := dataSet.FieldByName('codigo_ctrl').AsInteger;
          vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
          vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
          vLancL.HISTORICO_L := Trim(dataSet.FieldByName('HISTORICO_C').AsString) + ' ' +
            Trim(dataSet.FieldByName('TIPO_DOC_C').AsString);
          if FQtdeReplicacao > 0 then
            vLancL.VALOR_L := (dataSet.FieldByName('VALOR_C').AsCurrency * (FQtdeReplicacao + 1))
          else
            vLancL.VALOR_L := dataSet.FieldByName('VALOR_C').AsCurrency;
          vLancL.NDOC_L := Trim(dataSet.FieldByName('N_DOC_C').AsString);
          vLancL.COD_EMP_MULT := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
          vLancL.VL_CONTABIL := dataSet.FieldByName('vl_contabil').AsFloat;
          vLancL.TIP_CNT := vDadosIni.retornoPorCondicao(vLancL.VL_CONTABIL > 0, 'C', 'N');
          vLancL._efetuarLancamentoSequencial(FCodigoLancamento, vCodigoControle, 'E');
          //MAIS PARAMETROS, CONTROLE, NATUREZA
          FCodigoLancamento := vLancL.COD_LANC;

          buscas.Close;
          buscas.SQL.Text := 'INSERT INTO CREDITOS_LANC ( COD_LANC, COD_CRED, CODIGO_EMP)' +
            ' VALUES ( :COD_LANC, :COD_CRED, :CODIGO_EMP)';
          buscas.ParamByName('COD_LANC').AsInteger := FCodigoLancamento;
          buscas.ParamByName('COD_CRED').AsInteger := vCodigoGenCodigo;
          buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ExecSQL;

          if FQtdeReplicacao > 0 then
          begin
            FReplVlContReplicacao := dataSet.FieldByName('vl_contabil').AsFloat > 0;
            _replicarCreditosPeloCadastro(vCOD_CREDITOS);
          end;

        end;

        CommitaTransacao;

        if not Recebendo then
          if (acao = 'INSERIR') and (vGerarBoleto) and (trim(vCOD_CREDITOS) <> '') then
          begin
            montaSelect(' select ' + Fsql_campos + ' from controle_creditos ' +
              Fsql_inner +
              Fsql_inner_pag +
              ' where controle_creditos.codigo_emp = ' + vDadosIni.codEmpresa +
              ' and controle_creditos.cod_cred in (' + vCOD_CREDITOS + ')');
            if not dataSet.IsEmpty then
            begin
              try
                dataSet.DisableControls;
                dataSet.First;
                while not dataSet.Eof do
                begin
                  dataSet.Edit;
                  dataSet.FieldByName('SEL').AsString := 'S';
                  dataSet.Post;

                  dataSet.Next;
                end;
              finally
                dataSet.First;
                dataSet.EnableControls;
              end;

              _imprimirBoleto(false, true, true);
            end;
        end;

      finally
        vLancL._setTransactionComponentes(nil);
        vContLigL.Free;
        vLancL.Free;

        vContLigL:= nil;
        vLancL := nil;
      end;

      vDadosIni.GravaAuditoria('CAR031', acao,
      	' NUM DOC ' + Trim(dataSet.FieldByName('N_DOC_C').AsString) +
        ' SALVO COM SUCESSO', FTable, IntToStr(FCodigo) + '/' +
        Trim(dataSet.FieldByName('N_DOC_C').AsString), buscas);

      Result := true;

      if not FSequencial then
        FCodigoLancamento := 0;

      try
        dataSet.Refresh;
        dataSet.GotoBookmark(fBookMark);
      except
      end;

    except
      on e: exception do
      begin
        transacao.Rollback;
        Result := false;
        Application.MessageBox(pchar('Erro ao salvar controle de Credito. Erro: ' + e.Message),
          'Atenção', 0
          + 64);
        registraErro('function TControleCredito.post. Erro: ' + e.Message);
      end;
    end;
  finally
  	if vListaClBarrarDesbarrar.Count > 0 then
    begin
      for I := 0 to vListaClBarrarDesbarrar.Count - 1 do
      begin
        if trim(vListaClBarrarDesbarrar[I]) <> '' then
        begin
          if vDadosIni.vEmp.vFinanceiroUnificado then
            vDadosIni.negativarClientes(0, trim(vListaClBarrarDesbarrar[I]))
          else
            vDadosIni.negativarClientes(StrToInt(vListaClBarrarDesbarrar[I]), '');
        end;
      end;
    end;

    if Assigned(vListaClBarrarDesbarrar) then
      FreeAndNil(vListaClBarrarDesbarrar);
  end;
end;

function TControleCredito.verificarNSUnumAutorizacao(pNSU, pNumAut: string;
  pNumParc: Integer; pCodEmpMult: Integer; pCodCred: Integer): boolean;
begin
	Result := true;

	if trim(pNSU) = '' then
  	exit;

  if trim(pNumAut) = '' then
  	exit;

  if pNumParc <= 0 then
  	exit;

	SqlOpen('	select cod_cred, codigo_emp, cod_emp_mult, ' +
  	' n_docnsu_adm, n_aut_cart, nparcela from controle_creditos ' +
    ' where n_docnsu_adm = ' + QuotedStr(trim(pNSU)) +
    ' and n_aut_cart = ' + QuotedStr(trim(pNumAut)) +
    ' and nparcela = ' + IntToStr(pNumParc) +
    ' and cod_emp_mult = ' + IntToStr(pCodEmpMult) +
    ' and cod_cred <> ' + IntToStr(pCodCred) +
    ' and datq_c is null ', buscas);

  Result := buscas.IsEmpty;
end;

function TControleCredito.visualizarComprovanteCartao: boolean;
var
	vCodNFCE: Integer;
	vTpVND: string;
  vNumVND: string;
  vNSU: string;
  vAUT: string;
  vComprovante: string;
  vStatus: string;
begin
	try
    Result := true;

    buscas.Close;
    buscas.SQL.Text := ' select tr.seqid, tr.nrequisicao, tr.tpdocs, tr.cod_empresa,  ' +
    	' tr.n_docnsu_adm, tr.n_aut_cart, tr.status, tr.impressao from formpagamento fp ' +
      ' inner join transacao_cartao tr on tr.guidt = fp.guid_tr_cartao and tr.cod_empresa = fp.cod_empresa ' +
      ' where fp.n_processamento = :seqform ' +
      ' and fp.cod_empresa = :cod_empresa ';
    buscas.ParamByName('seqform').AsInteger := dataSet.FieldByName('COD_CRED').AsInteger;
    buscas.ParamByName('cod_empresa').AsInteger := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
    buscas.Open;

    if (buscas.IsEmpty) then
    begin
      buscas.Close;
      buscas.SQL.Text := ' select tr.seqid, tr.nrequisicao, tr.tpdocs, tr.cod_empresa, ' +
        ' tr.n_docnsu_adm, tr.n_aut_cart, tr.status, tr.impressao from formpagamento fp ' +
        ' inner join transacao_cartao tr on ' +
        ' 	tr.nrequisicao = fp.nrequisicao ' +
        '   and tr.tpdocs = fp.tpdocs ' +
        '   and tr.n_docnsu_adm = fp.n_docnsu_adm ' +
        '   and tr.n_aut_cart = fp.n_aut_cart ' +
        '   and tr.cod_empresa = fp.cod_empresa ' +
        ' where fp.n_processamento = :seqform ' +
        ' and fp.cod_empresa = :cod_empresa ';
      buscas.ParamByName('seqform').AsInteger := dataSet.FieldByName('COD_CRED').AsInteger;
      buscas.ParamByName('cod_empresa').AsInteger := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
      buscas.Open;
    end;

    if (buscas.IsEmpty) and ((Trim(dataSet.FieldByName('TP_DOC_V').AsString) = 'REQ') or (Trim(dataSet.FieldByName('TP_DOC_V').AsString) = 'OS')) then
    begin
    	buscas.Close;
      buscas.SQL.Text := ' select COD_NFCE FROM PEDVENDA ' +
        ' where NPED = :NDOC ' +
        ' and TIPO = :TIPO ' +
        ' and COD_EMPRESA = :COD_EMPRESA ';
      buscas.ParamByName('NDOC').AsInteger := dataSet.FieldByName('N_DOC_V').AsInteger;
      buscas.ParamByName('TIPO').AsString := Trim(dataSet.FieldByName('TP_DOC_V').AsString);
      buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
      buscas.Open;

      if buscas.FieldByName('COD_NFCE').AsInteger > 0 then
      begin
	      vCodNFCE := buscas.FieldByName('COD_NFCE').AsInteger;

        buscas.Close;
        buscas.SQL.Text := ' select SEQID, NREQUISICAO, TPDOCS, COD_EMPRESA, ' +
          ' N_DOCNSU_ADM, N_AUT_CART, STATUS, IMPRESSAO, REDE from TRANSACAO_CARTAO ' +
          ' where NREQUISICAO = :NDOC and TPDOCS = :TIPO and COD_EMPRESA = :COD_EMPRESA ';
        buscas.ParamByName('NDOC').AsInteger := vCodNFCE;
        buscas.ParamByName('TIPO').AsString := 'NFCE';
        buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
        buscas.Open;

        if buscas.IsEmpty then
        begin
          buscas.Close;
          buscas.SQL.Text := ' select SEQID, NREQUISICAO, TPDOCS, COD_EMPRESA, ' +
            ' N_DOCNSU_ADM, N_AUT_CART, STATUS, IMPRESSAO, REDE from TRANSACAO_CARTAO ' +
            ' where NREQUISICAO = :NDOC and TPDOCS = :TIPO and COD_EMPRESA = :COD_EMPRESA ';
          buscas.ParamByName('NDOC').AsInteger := dataSet.FieldByName('N_DOC_V').AsInteger;
          buscas.ParamByName('TIPO').AsString := Trim(dataSet.FieldByName('TP_DOC_V').AsString);
          buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
          buscas.Open;
        end;
      end
      else
      begin
        buscas.Close;
        buscas.SQL.Text := ' select seqid, nrequisicao, tpdocs, cod_empresa, ' +
          ' n_docnsu_adm, n_aut_cart, status, impressao from transacao_cartao ' +
          '	where nrequisicao = :nped and tpdocs = :tipo and cod_empresa = :cod_empresa ';
        buscas.ParamByName('nped').AsInteger := dataSet.FieldByName('N_DOC_V').AsInteger;
        buscas.ParamByName('tipo').AsString := Trim(dataSet.FieldByName('TP_DOC_V').AsString);
        buscas.ParamByName('cod_empresa').AsInteger := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
        buscas.Open;
      end;
    end
    else if buscas.IsEmpty then
    begin
      buscas.Close;
      buscas.SQL.Text := ' select seqid, nrequisicao, tpdocs, cod_empresa, ' +
        ' n_docnsu_adm, n_aut_cart, status, impressao from transacao_cartao ' +
        '	where nrequisicao = :nped and tpdocs = :tipo and cod_empresa = :cod_empresa ';
      buscas.ParamByName('nped').AsInteger := dataSet.FieldByName('N_DOC_V').AsInteger;
      buscas.ParamByName('tipo').AsString := Trim(dataSet.FieldByName('TP_DOC_V').AsString);
      buscas.ParamByName('cod_empresa').AsInteger := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
      buscas.Open;
    end;

    if buscas.IsEmpty then
    begin
    	Application.MessageBox(pchar('Comprovante de pagamento não encontrado para este documento'), 'Informação', MB_OK + MB_ICONINFORMATION);
      Result := false;
      exit;
    end;

    if not buscas.IsEmpty then
    begin
    	vTpVND := conta.dataSet.FieldByName('TP_DOC_V').AsString;
      vNumVND := conta.dataSet.FieldByName('N_DOC_V').AsString;
      vNSU := Trim(buscas.FieldByName('N_DOCNSU_ADM').AsString);
      vAUT := Trim(buscas.FieldByName('N_AUT_CART').AsString);
      vComprovante := Trim(buscas.FieldByName('IMPRESSAO').AsString);
      vStatus := Trim(buscas.FieldByName('STATUS').AsString);

      if (Trim(vComprovante) <> '') then
      begin
        if not vDadosIni.PesqPros('POSV007', 'VISUALIZAR', vTpVND + ' ' + vNumVND +
          '-AUT:' + vAUT + '-NSU:' + vNSU, 'TRANSACAO_CARTAO',
          '', conta.buscas, True) then
          Exit;

        if vDadosIni.vModoImpressao.vLinhasImpressao = nil then
          vDadosIni.vModoImpressao.vLinhasImpressao := TStringList.Create;
        vDadosIni.vModoImpressao.vLinhasImpressao.Clear;
        if trim(vStatus) = 'C' then
        begin
          vDadosIni.vModoImpressao.vLinhasImpressao.Add('  TRANSACAO CANCELADA NO SISTEMA  ');
          vDadosIni.vModoImpressao.vLinhasImpressao.Add('**********************************');
        end;
        vDadosIni.vModoImpressao.vLinhasImpressao.Text := vDadosIni.vModoImpressao.vLinhasImpressao.Text +
          vdadosIni.PosVirtualGetComprovantes(Trim(vComprovante));
        vDadosIni.vModoImpressao.TxtNaoFiscal := vDadosIni.vModoImpressao.vLinhasImpressao.Text +
          vdadosIni.PosVirtualGetComprovantes(Trim(vComprovante), true);

        vDadosIni.abreFormCadastro('pkPedidoVenda', 'TfrmImpressaoNaECF');
      end;
    end;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao visualizar comprovante. Erro: ' + e.Message), 'Atenção', 0 + 64);
      vDadosIni.registraErro('function TControleCredito.visualizarComprovanteCartao. Erro: ' + e.Message);
    end;
  end;
end;

{ TRecebimento }

constructor TRecebimento.create(ATransaction: TIBTransaction);
begin

  vCh := TControleCheque.create(ATransaction);
  vCr := TControleCredito.create(ATransaction);
  vRecibo := TRecibosCAR.create(ATransaction);

  vCh.Recebendo := True;
  vCr.Recebendo := True;

end;

destructor TRecebimento.Destroy;
begin
  vCh.Free;
  vCh := nil;

  vCr.Free;
  vCr := nil;

  vRecibo.Free;
  vRecibo := nil;

  inherited;
end;

{ TPContasCAR }

constructor TPContasCAR.create;
begin
  DataSet := TClientDataSet(dtmContasAReceber.cdsPCont);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);
end;

function TPContasCAR.verificarConta(pNatureza: string;
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

function TPContasCAR._abrePContasLanc(pNatureza: string; pCodPContas: Double): Boolean;
begin
  dataSet.Close;
  dataSet.CommandText := ' select pc.n_conta_plc, pc.desc_plc, pc.sthab, pc.tipo_plc, g.desc_gr, d.desc_dep, pc.tipo_ctp from p_contas pc' +
    ' left join grupos_ct g on g.grup_ct = pc.grup_ct' +
    ' left join depart_ct d on d.cod_dep = g.cod_dep' +
    ' where pc.tipo_plc = ' + QuotedStr(pNatureza) + ' and pc.ativo = 1';
  if pCodPContas > 0 then
  	dataSet.CommandText := dataSet.CommandText + ' and n_conta_plc <> :n_conta_plc ';

  if pCodPContas > 0 then
  	dataSet.CommandText := dataSet.CommandText + 
      ' union ' +
      ' select pc.n_conta_plc, pc.desc_plc, pc.sthab, pc.tipo_plc, g.desc_gr, d.desc_dep, pc.tipo_ctp from p_contas pc' +
      ' left join grupos_ct g on g.grup_ct = pc.grup_ct' +
      ' left join depart_ct d on d.cod_dep = g.cod_dep' +
      ' where pc.tipo_plc = ' + QuotedStr(pNatureza) + ' and n_conta_plc = :n_conta_plc ';

  dataSet.CommandText := dataSet.CommandText + ' order by 2 ';

  if pCodPContas > 0 then
	  dataSet.Params.ParamByName('N_CONTA_PLC').AsFloat := pCodPContas;
  Result := Open;
end;

function TPContasCAR._abreTodosPContasLanc: Boolean;
begin
  Result := montaSelect(
    'select pc.n_conta_plc, pc.desc_plc, pc.sthab, pc.tipo_plc, g.desc_gr, d.desc_dep, pc.tipo_ctp from p_contas pc' +
    ' left join grupos_ct g on g.grup_ct = pc.grup_ct' +
    ' left join depart_ct d on d.cod_dep = g.cod_dep' +
    ' where pc.ativo = 1' +
    ' order by pc.desc_plc');
end;

{ TControlesCAR }

constructor TControlesCAR.create;
begin
  DataSet := TClientDataSet(dtmContasAReceber.cdsCtrl);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);
end;

function TControlesCAR._abreTodosControlesCAR(pContrapartida: boolean; pCodEmpMult: Integer): Boolean;
begin
  Result := montaSelect(' select c.codigo_ctrl, c.nome_ctrl, c.contr_banc, c.nat_lanc, c.nat_ctrl, c.qperf, ' +
    ' c.saldo_at_ctrl, c.barrar_automatico, c.docs, c.taxa_cartao, c.tp_plano, c.cartao_sped from controles c ' +
    ' where c.codigo_emp = ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
    	IntToStr(pCodEmpMult), vDadosIni.codEmpresa) +
    ' and c.ativo = 1 ' +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,	' and (coalesce(c.controle_visivel, ''S'') = ''S'') ', '') +
    ' and coalesce(c.nao_gera_finan, '''') <> ''S'' ' +
    vDadosIni.IfThen(pContrapartida, ' and c.contrapartida = ''S'' and trim(c.docs) <> ''N'' ', '') +
    ' order by c.codigo_ctrl');
end;


function TControlesCAR._abreTodosControlesBarramentoAutomaticoCAR(pCodEmpMult: Integer): Boolean;
begin
  Result := montaSelect(' select c.codigo_ctrl, c.nome_ctrl, c.contr_banc, c.nat_lanc, c.nat_ctrl, c.qperf, ' +
    ' c.saldo_at_ctrl, c.barrar_automatico, c.docs, c.taxa_cartao, c.tp_plano, c.cartao_sped from controles c ' +
    ' where c.codigo_emp = ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
    	IntToStr(pCodEmpMult), vDadosIni.codEmpresa) +
    ' and c.ativo = 1' +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,	' and (coalesce(c.controle_visivel, ''S'') = ''S'') ', '') +
    ' and c.barrar_automatico = ''S'' ' +
    ' and coalesce(c.nao_gera_finan, '''') <> ''S'' ' +
    ' order by c.codigo_ctrl');
end;

function TControlesCAR._abreTodosControlesCAR(pDocs: string;
  pBarramentoAutomatico: string; pMudarControle: Boolean;
  pControle: Integer; pCodEmpMult: Integer): Boolean;
var
  vTmp: string;
begin
  if pMudarControle then
    vTmp := ' and c.codigo_ctrl <> ' + IntToStr(pControle)
  else
    vTmp := ' and c.codigo_ctrl = ' + IntToStr(pControle);
  Result := montaSelect(' select c.codigo_ctrl, c.nome_ctrl, c.contr_banc, c.nat_lanc, c.nat_ctrl, c.qperf, ' +
    ' c.saldo_at_ctrl, c.barrar_automatico, c.docs, c.taxa_cartao, c.tp_plano, c.cartao_sped from controles c ' +
    ' where c.codigo_emp = ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
    	IntToStr(pCodEmpMult), vDadosIni.codEmpresa) +
    ' and c.ativo = 1 ' + vTmp +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,	' and (coalesce(c.controle_visivel, ''S'') = ''S'') ', '') +
    ' and ((docs = ' + QuotedStr(pDocs) + ') or (c.barrar_automatico = ' + QuotedStr(pBarramentoAutomatico) + '))' +
    ' and coalesce(c.nao_gera_finan, '''') <> ''S'' ' +
    ' order by c.codigo_ctrl');
end;

function TControlesCAR._abreTodosControlesCAR(pDocs: string;
  pCodEmpMult: Integer): Boolean;
begin
	dataSet.Close;
  dataSet.CommandText := ' select c.codigo_ctrl, c.nome_ctrl, c.contr_banc, c.nat_lanc, c.nat_ctrl, c.qperf, ' +
    ' c.saldo_at_ctrl, c.barrar_automatico, c.docs, c.taxa_cartao, c.tp_plano, c.cartao_sped from controles c ' +
    ' where c.codigo_emp = ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
    	IntToStr(pCodEmpMult), vDadosIni.codEmpresa) +
    ' and c.ativo = 1 ' +
    ' and docs = ' + QuotedStr(pDocs) +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,	' and (coalesce(c.controle_visivel, ''S'') = ''S'') ', '') +
    ' and coalesce(c.nao_gera_finan, '''') <> ''S'' ';
  dataSet.CommandText := dataSet.CommandText + ' order by 1 ';

  Result := Open;
end;

function TControlesCAR._abreTodosControlesCAR(pDocs,
  pBarramentoAutomatico: string; pCodEmpMult: Integer): Boolean;
begin
  Result := montaSelect(' select c.codigo_ctrl, c.nome_ctrl, c.contr_banc, c.nat_lanc, c.nat_ctrl, c.qperf, ' +
    ' c.saldo_at_ctrl, c.barrar_automatico, c.docs, c.taxa_cartao, c.tp_plano, c.cartao_sped from controles c ' +
    ' where c.codigo_emp = ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
    	IntToStr(pCodEmpMult), vDadosIni.codEmpresa) +
    ' and c.ativo = 1 ' +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,	' and (coalesce(c.controle_visivel, ''S'') = ''S'') ', '') +
    ' and ((docs = ' + QuotedStr(pDocs) + ') or (c.barrar_automatico = ' + QuotedStr(pBarramentoAutomatico) + '))' +
    ' and coalesce(c.nao_gera_finan, '''') <> ''S'' ' +
    ' order by c.codigo_ctrl');
end;

function TControlesCAR._abreTodosControlesCAR(pDocs: string; pContrapartida: boolean; pCodControle: Integer; pCodEmpMult: Integer): Boolean;
begin
  dataSet.Close;
  dataSet.CommandText := ' select c.codigo_ctrl, c.nome_ctrl, c.contr_banc, c.nat_lanc, c.nat_ctrl, c.qperf, ' +
    ' c.saldo_at_ctrl, c.barrar_automatico, c.docs, c.taxa_cartao, c.tp_plano, c.cartao_sped from controles c ' +
    ' where c.codigo_emp = ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
    	IntToStr(pCodEmpMult), vDadosIni.codEmpresa) +
    ' and c.ativo = 1 ' +
    ' and docs = ' + QuotedStr(pDocs) +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,	' and (coalesce(c.controle_visivel, ''S'') = ''S'') ', '') +
    ' and coalesce(c.nao_gera_finan, '''') <> ''S'' ' +
    vDadosIni.IfThen(pContrapartida, ' and c.contrapartida = ''S'' and trim(c.docs) <> ''N'' ', '');
  if pCodControle > 0 then
    dataSet.CommandText := dataSet.CommandText + ' and c.codigo_ctrl <> :codigo_ctrl ';

  if pCodControle > 0 then
   	dataSet.CommandText := dataSet.CommandText +
    	' union ' +
    	' select c.codigo_ctrl, c.nome_ctrl, c.contr_banc, c.nat_lanc, c.nat_ctrl, c.qperf, ' +
      ' c.saldo_at_ctrl, c.barrar_automatico, c.docs, c.taxa_cartao, c.tp_plano, c.cartao_sped from controles c ' +
      ' where c.codigo_emp = ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
      	IntToStr(pCodEmpMult), vDadosIni.codEmpresa) +
      ' and c.codigo_ctrl = :codigo_ctrl' +
      ' and docs = ' + QuotedStr(pDocs) +
//      vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,	' and (coalesce(c.controle_visivel, ''S'') = ''S'') ', '') +
      ' and coalesce(c.nao_gera_finan, '''') <> ''S''' +
      vDadosIni.IfThen(pContrapartida, ' and c.contrapartida = ''S'' and trim(c.docs) <> ''N'' ', '');

  dataSet.CommandText := dataSet.CommandText + ' order by 1 ';

  if pCodControle > 0 then
  	dataSet.Params.ParamByName('codigo_ctrl').AsFloat := pCodControle;

  Result := Open;
end;


function TControlesCAR._selecionaControle(pCodigo: Integer; pCodEmpMult: Integer): Boolean;
begin
  if pcodigo = 0 then
    Result := montaSelect(' select c.codigo_ctrl, c.nome_ctrl, c.contr_banc, c.nat_lanc, c.nat_ctrl, c.qperf, ' +
      ' c.saldo_at_ctrl, c.barrar_automatico, c.docs, c.taxa_cartao, c.tp_plano, c.cartao_sped from controles c ' +
      ' where c.codigo_emp = ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
    		IntToStr(pCodEmpMult), vDadosIni.codEmpresa) +
      ' and c.ativo = 1 ' +
      vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,	' and (coalesce(c.controle_visivel, ''S'') = ''S'') ', '') +
      ' and coalesce(c.nao_gera_finan, '''') <> ''S'' ' +
      ' and c.docs = ''N'' order by c.codigo_ctrl')
  else
    Result := montaSelect(' select c.codigo_ctrl, c.nome_ctrl, c.contr_banc, c.nat_lanc, c.nat_ctrl, c.qperf, ' +
      ' c.saldo_at_ctrl, c.barrar_automatico, c.docs, c.taxa_cartao, c.tp_plano, c.cartao_sped from controles c ' +
      ' where c.codigo_emp = ' + vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pCodEmpMult > 0),
    		IntToStr(pCodEmpMult), vDadosIni.codEmpresa) +
      ' and c.ativo = 1 ' +
      ' and c.codigo_ctrl = ' + IntToStr(pCodigo) +
//      vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,	' and (coalesce(c.controle_visivel, ''S'') = ''S'') ', '') +
      ' and coalesce(c.nao_gera_finan, '''') <> ''S'' ' +
      ' order by c.codigo_ctrl');
end;

{ TContasBancariasCAR }

constructor TContasBancariasCAR.create;
begin
  DataSet := TClientDataSet(dtmContasAReceber.cdsContasBanc);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);
end;

function TContasBancariasCAR.delete: Boolean;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CAR050', 'EXCLUIR', ' AG ' +
    dataSet.FieldByName('AGENCIA').AsString +
    ' CTA ' + dataSet.FieldByName('CONTA').AsString +
    ' COD CL ' + dataSet.FieldByName('COD_CLIENTE').AsString, 'CONTASBANCARIAS', '', buscas, True) then
    Exit;

  try
    buscas.Close;
    buscas.SQL.Text := 'delete from contasbancarias' +
      ' WHERE AGENCIA = :AGENCIA AND CONTA = :CONTA AND COD_CLIENTE = :COD_CLIENTE AND' +
      ' COD_EMPRESA = ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger);
    buscas.ParamByName('AGENCIA').Value := dataSet.FieldByName('AGENCIA').Value;
    buscas.ParamByName('CONTA').Value := dataSet.FieldByName('CONTA').Value;
    buscas.ParamByName('COD_CLIENTE').Value := dataSet.FieldByName('COD_CLIENTE').Value;
    buscas.ExecSQL;

    if not FEmCadastroCAR then
      CommitaTransacao;

    dataSet.Refresh;
  except
    on e: exception do
    begin
      Result := False;
      registraErro('function TContasBancariasCAR.delete. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro ao apagar conta bancária selecionada. Erro: ' +
        e.Message),
        'Atenção', 0 + 64);
    end;
  end;

end;

function TContasBancariasCAR.insert: Boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('CAR049', 'ALTERAR', '', 'CONTASBANCARIAS', '', buscas, True) then
    Exit;

  if inherited insert then
  begin
    dataSet.FieldByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, fCodigoUnificada, StrToInt(vDadosIni.codEmpresa));
    Result := true;
  end;
end;

function TContasBancariasCAR.post: Boolean;
begin

  Result := False;

  try

    if not vDadosIni.PesqPros('CAR051', 'SALVAR', ' AG ' +
      dataSet.FieldByName('AGENCIA').AsString +
      ' CTA ' + dataSet.FieldByName('CONTA').AsString +
      ' COD CL ' + dataSet.FieldByName('COD_CLIENTE').AsString, 'CONTASBANCARIAS', '', buscas, True) then
      Exit;

    if dataSet.FieldByName('COD_CLIENTE').AsFloat <= 0 then
      raiseExceptionCreate('Cliente não informado', 'DBEdit33');

    if not ExecutaComandosSql('select cod_cliente from clientes where' +
      ' cod_cliente = ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger) +
      ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger)) then
      raiseExceptionCreate('Cliente não encontrado no cadastro', 'DBEdit33');

    if Trim(dataSet.FieldByName('AGENCIA').AsString) = '' then
      raiseExceptionCreate('Agência não informada', 'DBEdit47');

    if Trim(dataSet.FieldByName('CONTA').AsString) = '' then
      raiseExceptionCreate('Conta não informada', 'DBEdit48');

    try
      buscas := TIBQuery(dtmContasAReceber.qrOutra);

      if not buscas.Transaction.InTransaction then
        buscas.Transaction.StartTransaction;

      buscas.Close;
      buscas.SQL.Text :=
        'INSERT INTO CONTASBANCARIAS (AGENCIA, CONTA, COD_CLIENTE, COD_EMPRESA, CODBANCO, BANCO, ATIVO)' +
        ' VALUES (:AGENCIA, :CONTA, :COD_CLIENTE, ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(fCodigoUnificada), vDadosIni.codEmpresa) +
        ', :CODBANCO, :BANCO, 1)';
      buscas.ParamByName('AGENCIA').Value := dataSet.FieldByName('AGENCIA').Value;
      buscas.ParamByName('CONTA').Value := dataSet.FieldByName('CONTA').Value;
      buscas.ParamByName('COD_CLIENTE').Value := dataSet.FieldByName('COD_CLIENTE').Value;
      buscas.ParamByName('CODBANCO').Value := dataSet.FieldByName('CODBANCO').Value;
      buscas.ParamByName('BANCO').Value := dataSet.FieldByName('BANCO').Value;
      buscas.ExecSQL;

      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;

      Result := True;

      dataSet.Cancel;
    finally
      buscas := TIBQuery(dtmContasAReceber.qrBuscas);
    end;

    if not FEmCadastroCAR then
      CommitaTransacao;

    dataSet.Refresh;

  except
    on e: exception do
    begin
      Result := False;
      registraErro('function TContasBancariasCAR.delete. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro ao cadastrar conta bancária selecionada. Erro: ' +
        e.Message),
        'Atenção', 0 + 64);
    end;
  end;

end;

function TContasBancariasCAR._abreContasBancarias(
  pCodigoCliente: Integer; pCodigoUnificada: Integer): Boolean;
begin
  Result := montaSelect('select cb.*, c.nome_cliente from contasbancarias cb' +
    ' inner join clientes c on c.cod_cliente = cb.cod_cliente and c.cod_empresa = cb.cod_empresa' +
    ' where cb.cod_cliente = ' + IntToStr(pCodigoCliente) + ' and cb.cod_empresa = ' +
    vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada) , vDadosIni.codEmpresa));
  fCodigoUnificada := pCodigoUnificada;
end;

{ TClienteCAR }

constructor TClienteCAR.create;
begin
  DataSet := TClientDataSet(dtmContasAReceber.cdsCl);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);
end;

function TClienteCAR._selecionaCliente(pCodigo: Integer; pCodigoUnificada: Integer): Boolean;
begin
  Result := montaSelect('select cod_cliente, nome_cliente, razao, cpfcgc,' +
   ' data_nasc, fone_cliente, bairro, cep, endereco, pai, mae, rg, ctps, cidade' +
   ' from clientes' +
   ' where cod_cliente = ' + IntToStr(pCodigo) +
   ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
   InttoStr(pCodigoUnificada) , vDadosIni.codEmpresa));
end;

{ TBaixaCreditos }

constructor TBaixaCreditos.create(pDocs: string);
begin
  if dtmContasAReceber = nil then
    dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

  fDocs := pDocs;
  if fDocs = 'S1' then
    DataSet := TClientDataSet(dtmContasAReceber.cdsBxCh)
  else
    DataSet := TClientDataSet(dtmContasAReceber.cdsBxCred);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);
end;

function TBaixaCreditos._selecionaBaixaCreditos(pCODIGO: Integer; pCOD_EMPRESA: Integer): boolean;
var
 vTemp: string;
begin

  vTemp := ' '' '' n_doc_v_temp, ';
  if vDadosIni.vRecibo.HabRecPorDepart then
  begin
    dataSet.FieldByName('N_DOC_V').Visible := false;
    if fDocs = 'S1' then
	    vTemp := ' case when (cc.tp_doc_v = ''REC'') then ' +
        '     recibos.num_rec_dep ' +
        ' else cc.n_doc_v end n_doc_v_temp,'
    else
    	vTemp := ' case when (bc.tp_doc_v = ''REC'') then ' +
        '     recibos.num_rec_dep ' +
        ' else bc.n_doc_v end n_doc_v_temp,';
  end
  else
  	dataSet.FieldByName('N_DOC_V_TEMP').Visible := false;

  if fDocs = 'S1' then
    montaSelect(' select ' + vTemp+ ' cc.* from controle_cheque cc ' +
			' left join recibos on recibos.nrecibo = cc.n_doc_v and recibos.cod_empresa = cc.codigo_emp and cc.tp_doc_v = ''REC'' ' +
      ' where cc.codigo_ch = ' + IntToStr(pCODIGO) +
      ' and cc.codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
      	IntToStr(pCOD_EMPRESA), vDadosIni.codEmpresa))
  else
    montaSelect('select ' + vTemp + ' bc.* from baixa_creditos bc' +
      ' left join recibos on recibos.nrecibo = bc.n_doc_v and recibos.cod_empresa = bc.codigo_emp and bc.tp_doc_v = ''REC'' ' +
      ' where bc.cod_cred = ' + IntToStr(pCODIGO) +
      ' and bc.codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
      	IntToStr(pCOD_EMPRESA), vDadosIni.codEmpresa) +
      ' order by bc.seq_bxcred');
end;

function TBaixaCreditos._selecionaBaixaCreditosPeloLoteQuit(
  pLoteQuit: Integer): boolean;
var
 vTemp: string;
begin
  vTemp := ' '' '' n_doc_v_temp, ';
  if vDadosIni.vRecibo.HabRecPorDepart then
  begin
    dataSet.FieldByName('N_DOC_V').Visible := false;
    if fDocs = 'S1' then
	    vTemp := ' case when (cc.tp_doc_v = ''REC'') then ' +
        '     recibos.num_rec_dep ' +
        ' else cc.n_doc_v end n_doc_v_temp,'
    else
    	vTemp := ' case when (bc.tp_doc_v = ''REC'') then ' +
        '     recibos.num_rec_dep ' +
        ' else bc.n_doc_v end n_doc_v_temp,';
  end
  else
  	dataSet.FieldByName('N_DOC_V_TEMP').Visible := false;

  if fDocs = 'S1' then
    montaSelect('select ' + vTemp + ' cc.* from controle_cheque cc ' +
      ' left join recibos on recibos.nrecibo = cc.n_doc_v and recibos.cod_empresa = cc.codigo_emp and cc.tp_doc_v = ''REC'' ' +
      ' where cc.lote_quit = ' + IntToStr(pLoteQuit) +
      ' and cc.codigo_emp = ' + vDadosIni.codEmpresa +
      ' order by cc.cod_cliente')
  else
    montaSelect('select ' + vTemp + ' bc.* from baixa_creditos bc' +
      ' left join recibos on recibos.nrecibo = bc.n_doc_v and recibos.cod_empresa = bc.codigo_emp and bc.tp_doc_v = ''REC'' ' +
      ' where bc.lote_quit = ' + IntToStr(pLoteQuit) +
      ' and bc.codigo_emp = ' + vDadosIni.codEmpresa +
      ' order by bc.cod_cliente, bc.seq_bxcred');
end;

function TBaixaCreditos._selecionaUltimoBaixaCreditos(
  pCODIGO: Integer): boolean;
var
 vTemp: string;
begin
  vTemp := ' '' '' n_doc_v_temp, ';
  if vDadosIni.vRecibo.HabRecPorDepart then
  begin
    dataSet.FieldByName('N_DOC_V').Visible := false;
    if fDocs = 'S1' then
	    vTemp := ' case when (cc.tp_doc_v = ''REC'') then ' +
        '     recibos.num_rec_dep ' +
        ' else cc.n_doc_v end n_doc_v_temp,'
    else
    	vTemp := ' case when (bc.tp_doc_v = ''REC'') then ' +
        '     recibos.num_rec_dep ' +
        ' else bc.n_doc_v end n_doc_v_temp,';
  end
  else
  	dataSet.FieldByName('N_DOC_V_TEMP').Visible := false;

  if fDocs = 'S1' then
    montaSelect('select first 1 ' + vTemp + ' cc.* from controle_cheque cc' +
      ' left join recibos on recibos.nrecibo = cc.n_doc_v and recibos.cod_empresa = cc.codigo_emp and cc.tp_doc_v = ''REC'' ' +
      ' where cc.codigo_ch = ' + IntToStr(pCODIGO) +
      ' and cc.codigo_emp = ' + vDadosIni.codEmpresa +
      ' and cast(cc.valor_corr as decimal(10,2)) > 0' +
      ' order by cc.codigo_ch desc')
  else
    montaSelect('select first 1 ' + vTemp + ' bc.* from baixa_creditos bc' +
      ' left join recibos on recibos.nrecibo = bc.n_doc_v and recibos.cod_empresa = bc.codigo_emp and bc.tp_doc_v = ''REC'' ' +
      ' where bc.cod_cred = ' + IntToStr(pCODIGO) +
      ' and bc.codigo_emp = ' + vDadosIni.codEmpresa +
      ' and cast(bc.valor_corr as decimal(10,2)) > 0' +
      ' order by bc.seq_bxcred desc');
end;

{ TRecibosCAR }

constructor TRecibosCAR.create(ATransaction: TIBTransaction);
begin
  if Assigned(ATransaction) then
  begin
   transacao := ATransaction;
   buscasRec := TIBQuery(dtmContasAReceber.qrRec3);
   DataSet := TClientDataSet(dtmContasAReceber.cdsRec3);
  end
  else
  begin
	 transacao := TIBTransaction(dtmContasAReceber.transacao);
   buscasRec := TIBQuery(dtmContasAReceber.qrRec);
   DataSet := TClientDataSet(dtmContasAReceber.cdsRec);
  end;
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);

  buscas.Close;
  buscasRec.Close;

  buscas.Transaction 				:= transacao;
  buscasRec.Transaction				:= transacao;
end;

function TRecibosCAR._abreFormValorBaixaRecibo: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Informar valor de baixa de Recibos';

    frmCadContasAReceber.pnReciboValor.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    formulario.BorderIcons := [];

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnReciboValor.Parent := frmCadContasAReceber.tsRecRecibo;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TRecibosCAR._demarcarTodos;
begin
	try
  	dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('selec').AsString = 'S' then
        _desmarcaLinha;
      dataSet.Next;
    end;
  finally
    dataSet.First;
    dataSet.EnableControls;
  end;
end;

procedure TRecibosCAR._desmarcaLinha;
begin
  dataSet.Edit;
  dataSet.FieldByName('selec').AsString := '';
  dataSet.Post;
end;

procedure TRecibosCAR._informarValorRecibosSelecionados;
begin
  try
  	dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      if (dataSet.FieldByName('selec').AsString = 'S') and
        (dataSet.FieldByName('valor_ut').AsFloat <= 0) then
        if _abreFormValorBaixaRecibo then
          _somaValor;
      dataSet.Next;
    end;
  finally
    dataSet.EnableControls;
  end;

  Application.MessageBox(pchar('Valor informado nos recibos selecionados. ' + #13 +
    'Valor: ' + Format('%0.2n', [_somaRecibos])), 'Atenção', 0 + 64);
end;

procedure TRecibosCAR._marcaDesmarcaLinha;
begin
  if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('selec').AsString = 'S' then
    dataSet.FieldByName('selec').AsString := ''
  else
    dataSet.FieldByName('selec').AsString := 'S';
  dataSet.Post;
end;

procedure TRecibosCAR._marcaLinha;
begin
  if dataSet.IsEmpty then
  	exit;

  dataSet.Edit;
  dataSet.FieldByName('selec').AsString := 'S';
  dataSet.Post;
end;

function TRecibosCAR._selecionaRecibosAtencipados(
  pCodigoUnificada: Integer): Boolean;
begin
  result := montaSelect(' select recibos.* from recibos ' +
    ' where ((recibos.recant = ''S'') or (recibos.recant = ''O'')) ' +
    ' and ((recibos.status_rec is null) or (recibos.status_rec = '''')) ' +
    vDadosIni.IfThen((not vDadosIni.vEmp.vFinanceiroUnificado),
    ' and recibos.cod_empresa = ' +  vDadosIni.codEmpresa,
    ' and recibos.cod_empresa in ' + vDadosIni.vEmp.vCodigoUnificadas) +
    ' and recibos.ativo = 1 ' +
    ' order by recibos.nome_dev, recibos.data_rec desc, recibos.cod_emp_mult ');
  // não serão mais utilizados os recibos das unificadas, pois os registros na tabela hist_rec ficam dificeis de tratar por causa do codigo
  // portanto deverao aparecer apenas os recibos da unificadora quando quitando contas da propria unificadora
end;

function TRecibosCAR._somaRecibos: Currency;
var
  vSoma: Currency;
begin
  try
    prepare_loop;
    vSoma := 0;
    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('selec').AsString = 'S' then
        vSoma := vSoma + dataSet.FieldByName('valor_ut').AsFloat;
      dataSet.Next;
    end;

    dataSet.First;

    Result := vSoma;
  finally
    prepare_loop_done;
  end;

end;

procedure TRecibosCAR._somaValor;
begin
  if dataSet.IsEmpty then
    Exit;

  dataSet.Edit;
  if fValorRecibo < 0 then
  begin
    Application.MessageBox(pchar('Valor informado inválido' + #13 +
      'Será atribuído o valor do recibo'), 'Atenção', 0 + 64);
    dataSet.FieldByName('valor_ut').AsFloat :=
      dataSet.FieldByName('valor').AsFloat;
  end
  else if vDadosIni.StrToFloatFormat(fValorRecibo, 2) >
    vDadosIni.StrToFloatFormat(dataSet.FieldByName('valor').AsFloat, 2) then
  begin
    Application.MessageBox(pchar('Valor informado maior que o valor do recibo.' + #13 +
      'Será atribuído o valor do recibo'), 'Atenção', 0 + 64);
    dataSet.FieldByName('valor_ut').AsFloat :=
      dataSet.FieldByName('valor').AsFloat;
  end
  else
    dataSet.FieldByName('valor_ut').AsFloat := fValorRecibo;

  dataSet.Post;

end;

{ TCartasCobranca }

constructor TCartasCobranca.create;
begin
  if dtmContasAReceber = nil then
    dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

  DataSet := TClientDataSet(dtmContasAReceber.cdsItensCarta);
  transacao := TIBTransaction(dtmContasAReceber.IBTransCartas);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmContasAReceber.qrItensCarta.Database;
  buscas.Transaction := transacao;

  FqrAtrasoPagamento := TIBQuery.Create(nil);
  FqrAtrasoPagamento.Database := dtmContasAReceber.qrItensCarta.Database;
  FqrAtrasoPagamento.Transaction := transacao;

  FqrGravarCredAtraso := TIBQuery.Create(nil);
  FqrGravarCredAtraso.Database := dtmContasAReceber.qrItensCarta.Database;
  FqrGravarCredAtraso.Transaction := transacao;
  //
  //  FqrAtrasoPagamento := TIBQuery.Create(nil);
  //  FqrAtrasoPagamento.Database := dtmContasAReceber.qrItensCarta.Database;
  //  FqrAtrasoPagamento.Transaction := transacao;

  FdtSetControles := TClientDataSet.Create(nil);
  FdtSetControles.Close;
  FdtSetControles.FieldDefs.Clear;
  FdtSetControles.FieldDefs.Add('CODIGO_CTRL', ftInteger, 0, false);
  FdtSetControles.FieldDefs.Add('NOME_CTRL', ftString, 35, false);
  FdtSetControles.CreateDataSet;
  FdtSetControles.Open;
  buscas.Close;
  buscas.SQL.Text := 'select ctrl.codigo_ctrl,ctrl.nome_ctrl from controles ctrl ' +
    ' where docs = ''S2'' ' +
    ' and ctrl.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and ctrl.ativo = 1 ' +
    ' order by ctrl.nome_ctrl desc';
  buscas.Open;
  while not buscas.eof do
  begin
    FdtSetControles.Insert;
    FdtSetControles.FieldByName('CODIGO_CTRL').AsInteger :=
      buscas.FieldByName('CODIGO_CTRL').AsInteger;
    FdtSetControles.FieldByName('NOME_CTRL').AsString :=
      trim(buscas.FieldByName('NOME_CTRL').AsString);
    FdtSetControles.Post;
    buscas.Next;
  end;

  FdtSetModeloCartas := TClientDataSet.Create(nil);
  FdtSetModeloCartas.Close;
  FdtSetModeloCartas.FieldDefs.Clear;
  FdtSetModeloCartas.FieldDefs.Add('COD_CARTA', ftInteger, 0, false);
  FdtSetModeloCartas.FieldDefs.Add('DESCRICAO', ftString, 25, false);
  FdtSetModeloCartas.CreateDataSet;
  FdtSetModeloCartas.Open;
  buscas.Close;
  buscas.SQL.Text := 'select mc.cod_carta,mc.descricao from modcartas mc ' +
    ' where mc.cod_empresa=' + vDadosIni.codEmpresa +
    ' and mc.ativo=1 and mc.TIPO=''CAR'' order by mc.descricao asc';
  buscas.Open;
  while not buscas.eof do
  begin
    FdtSetModeloCartas.Append;
    FdtSetModeloCartas.FieldByName('COD_CARTA').AsInteger :=
      buscas.FieldByName('COD_CARTA').AsInteger;
    FdtSetModeloCartas.FieldByName('DESCRICAO').AsString :=
      buscas.FieldByName('DESCRICAO').AsString;
    FdtSetModeloCartas.Post;
    buscas.Next;
  end;

  buscas.Close;
  dsControles := TDataSource.Create(nil);
  dsControles.DataSet := FdtSetControles;
  dsModeloCartas := TDataSource.Create(nil);
  dsModeloCartas.DataSet := FdtSetModeloCartas;
//  dsCidades := TDataSource.Create(nil);
//  dsCidades.DataSet := FdsCidades;

  FPararProcessamento:=false;
  if obCredCartas=nil then
    obCredCartas := TCreditosCartas.create;
  dataSet.AfterScroll := _ItensCartasAfterScroll;
  FInibeItensCartasAfterScroll :=false;
end;

destructor TCartasCobranca.destroy;
begin

  inherited;
end;

function TCartasCobranca._EnviarEmail(Dominio, Porta, Usuario, Senha, DeNome,
  DeEmail, Para, Assunto, Corpo: string; CorpoMIME, AnexoMIME: Integer;
  AutoResposta: Boolean; Anexo: TStringList): Boolean;
var
  i: Integer;
  IdSMTP1: TIdSMTP;
  IdMessage: TIdMessage;
  IdCorpo: TIdText;
  IdAnexo: TIdAttachmentFile;
  IdSSL: TIdSSLIOHandlerSocketOpenSSL;
begin
  try
    IdMessage := TIdMessage.Create(nil);
    try
      // Cria a Estrutura da Mensagem:
      IdMessage.Clear;
      IdMessage.IsEncoded := True;
      IdMessage.AttachmentEncoding := 'MIME';
      IdMessage.Encoding := meMIME; // meDefault;
      IdMessage.ConvertPreamble := True;
      IdMessage.Priority := mpNormal;
      IdMessage.ContentType := 'multipart / mixed'; // obrigatoriamente!
      IdMessage.CharSet := 'ISO - 8859 - 1';
      IdMessage.Date := Now;
      // Define o Remetente e Destinatário:
      IdMessage.From.Address := DeEmail; // ou '[EMAIL PROTECTED]'
      IdMessage.From.Text := DeNome;
      // IdMessage.CCList.EMailAddresses := lista de com cópia
         // IdMessage.BccList.EMailAddresses := lista de com cópia oculta
      IdMessage.ReplyTo.EMailAddresses := DeEmail;
      IdMessage.Recipients.EMailAddresses := Trim(Para);
      if AutoResposta then
        IdMessage.ReceiptRecipient.Text := DeEmail; // auto-resposta (confirmação de leitura!)
      IdMessage.Subject := Trim(Assunto);
      // Adiciona o CORPO da Mensagem:
      IdCorpo := TIdText.Create(IdMessage.MessageParts, nil);
      IdCorpo.ContentType := _EmailTipoMIME(CorpoMIME);
      IdCorpo.ContentDescription := 'multipart - 1';
      IdCorpo.CharSet := 'ISO - 8859 - 1'; // NOSSA LINGUAGEM PT-BR (Latin-1)!!!!
      IdCorpo.ContentTransfer := '16bit'; // para SAIR ACENTUADO !!!! Pois, 8bit SAI SEM ACENTO !!!!
      IdCorpo.ContentDescription := 'Corpo da Mensagem';
      IdCorpo.Body.Clear;
      IdCorpo.Body.Add(Corpo);
      // Define o ANEXO: (pode haver looping para vários anexos)
      for i := 0 to Pred(Anexo.Count) do
      begin
        if FileExists(Anexo.Strings[i]) then
        begin
          try
            IdAnexo := TIdAttachmentFile.Create(IdMessage.MessageParts, Anexo.Strings[i]);
            IdAnexo.ContentType := _EmailTipoMIME(AnexoMIME) +
              ' name = ' + ExtractFileName(Anexo.Strings[i]);
            IdAnexo.ContentDescription := 'Arquivo Anexo: ' + ExtractFileName(Anexo.Strings[i]);
          except
          end;
        end;
      end;
      IdSMTP1 := TIdSMTP.Create(nil);
      // Se a porta for diferente de 25 então abre o SSL para autenticação segura!
      // Gmail e Globo usam a porta 465 (smtp) e 995 (pop3) com SSL!!!
      // Hotmail usam a porta 25 (smpt.live.com) e 995 (pop3.live.com) sem SSL!
      // Bol usa a porta 25 (smtp.bol.com.br) e 110 (pop3.bol.com.br) sem SSL!
      if trim(Porta) = '25' then
        //(Se Porta DIFERENTE de '25' … o sinal de diferente está sumido aqui)
      begin
        with IdSMTP1 do
        try
          IdSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
          IdSMTP1.IOHandler := IdSSL;
          UseTLS := utUseImplicitTLS;
        except
          on E: Exception do
          begin
            IOHandler := TIdIOHandler.MakeDefaultIOHandler(nil);
            UseTLS := utNoTLSSupport;
            ShowMessage('SSL da Autenticação Segura Falhou.' + #13 + #13 +
              'Pode ser uma instabilidade temporária na ' + #13 +
              'conexão de sua Internet.' + #13 + #13 +
              'Tente de novo agora ou mais tarde.');
            result := False;
          end;
        end;
        IdSSL.SSLOptions.Method := sslvSSLv2;
        IdSSL.SSLOptions.Mode := sslmClient;
      end;

      with IdSMTP1 do
      try
        AuthType := atDefault;
        ReadTimeout := 10000; // Leitura da Conexão em 10 segundos!
        Host := Dominio; // 'smtp.dominio.com.br';
        Port := StrToInt(Porta); // padrão seria 25 ou autenticada 465;
        UserName := Usuario; // 'usuario';
        Password := Senha; // 'senha';

        try
          Connect;
          Authenticate;
        except
          on E: Exception do
          begin
            ShowMessage('Autenticação Falhou.' + #13 + #13 +
              'Verifique seu Nome de Usuário e Senha ou ' + #13 +
              'Tente de novo agora ou mais tarde.');
            result := False;
          end;
        end;

        if Connected then
        begin
          Send(IdMessage);
          result := True;
        end
        else
        begin
          raise Exception.Create('A conexão com o Provedor foi interrompida.' + #13 + #13 +
            'Verifique se a sua Internet está ativa.');
          result := False;
        end;
      finally
        Disconnect;
      end;
    except
      result := false;
    end;
  finally
    FreeAndNil(IdMessage);
    FreeAndNil(IdSMTP1);
  end;

end;

function TCartasCobranca._excluirCarta: boolean;
var
  codcarta: string;
begin
  try
    Result := False;
    if not vDadosIni.PesqPros('CAR066', 'EXCLUIR', 'INICIANDO EXCLUSÃO', 'ITENS_CARTA', '', buscas, True) then
      exit;
    try
      dataSet.Filter := 'SEL = ''S''';
      dataSet.Filtered := true;
      if dataSet.IsEmpty then
        exit;
      if Application.MessageBox('Tem certeza que deseja excluir o(s) registro(s) selecionado(s) permanentemente?',
        'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
      begin
      	try
        	dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
            codcarta := dataSet.FieldByName('CODIGO').AsString;

            result := ExecutaComandosSqlExec('delete from ITENS_CARTA where codigo = ' +
              dataSet.FieldByName('CODIGO').AsString + ' and cod_empresa = ' + vDadosIni.codEmpresa);
            if result then
              result := CommitaTransacao
            else
              RollBackTransacao;

            if Result then
              vDadosIni.GravaAuditoria('CAR066', 'EXCLUIR', 'SUCESSO', 'ITENS_CARTA', codcarta, buscas)
            else
              vDadosIni.GravaAuditoria('CAR066', 'EXCLUIR', 'FALHA', 'ITENS_CARTA', codcarta, buscas);
            next;  
          end;
        finally
          dataSet.EnableControls;
        end;
      end;
      Refresh;
    finally
      dataSet.Filter := 'SEL = '''' ';
      dataSet.Filtered := false;
    end;
  except
    Result := False;
  end;
end;

function TCartasCobranca._ExibirItensEmDebito: boolean;
var
  msg:AnsiString;
begin
 result:= false;
 if not vDadosIni.PesqPros('CAR076', 'EXIBIR ITENS DA CARTA', 'EXIBIR CRÉDITOS DA CARTA DE COBRANÇA', 'ITENS_CARTA', dataSet.FieldByName('CODIGO').AsString, buscas, True) then
   exit;

 buscas.Close;
 buscas.SQL.Text:= 'select mc.descricao,ic.nome_cliente, itc.cod_cred,'+
   ' case when coalesce(cc.status_c,'''')=''QUITADO'' '+
   ' then ''QUITADO'' else ''NÃO QUITADO'' end as solucionado,'+
   ' itc.dt_solucao_cred,cc.n_doc_c from itens_carta_cred itc inner join itens_carta ic '+
   ' on itc.cod_itemcarta=ic.codigo and itc.cod_empresa=ic.cod_empresa '+
   ' inner join controle_creditos cc '+
   ' on itc.cod_cred=cc.cod_cred and itc.cod_empresa=cc.codigo_emp '+
   ' inner join modcartas mc '+
   ' on ic.cod_carta=mc.cod_carta and ic.cod_empresa=mc.cod_empresa '+
   ' where ic.cod_empresa='+vDadosIni.codEmpresa +
   ' and itc.cod_itemcarta = '+ inttostr(dataSet.FieldByName('CODIGO').asinteger);
 buscas.Open;
 if not buscas.IsEmpty then
 begin
   result:=true;
   buscas.First;
   msg:='Cliente: '+buscas.FieldByName('NOME_CLIENTE').AsString+chr(13)+'Carta: '+buscas.FieldByName('descricao').AsString+chr(13);
   while not buscas.Eof do
   begin
     msg:=msg+'Créd: '+buscas.FieldByName('COD_CRED').AsString+ '| DOC: '+ trim(buscas.FieldByName('n_doc_c').AsString)+
     ' | Status: '+ buscas.FieldByName('solucionado').AsString+' | Data Solução: '+buscas.FieldByName('dt_solucao_cred').AsString+chr(13);
     buscas.Next;
   end;
   Application.MessageBox(Pchar(msg),'Relação de itens da carta selecionada',MB_OK+MB_ICONINFORMATION);
 end;
end;

function TCartasCobranca._abreformSolucao(pCodcarta: integer): boolean;
var
  formulario: TfrmPadrao;
begin
  result:=false;
  if obCarta.IsEmpty then
    exit;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Solucionar/Retirar solução de cartas de cobrança';
    if obCredCartas=nil then
      obCredCartas := TCreditosCartas.create;
//    obCredCartas.montaSelect('select * from itens_carta_cred where cod_itemcarta='+inttostr(pCodcarta)+' and cod_empresa='+vDadosIni.codEmpresa);
    obCredCartas.montaSelect('select itc.*,mc.descricao,'+
     ' case when coalesce(cc.status_c,'''')=''QUITADO'' '+
     ' then ''QUITADO'' else ''NÃO QUITADO'' end as status_c,'+
     ' cc.n_doc_c from itens_carta_cred itc inner join itens_carta ic '+
     ' on itc.cod_itemcarta=ic.codigo and itc.cod_empresa=ic.cod_empresa '+
     ' inner join controle_creditos cc '+
     ' on itc.cod_cred=cc.cod_cred and itc.cod_empresa=cc.codigo_emp '+
     ' inner join modcartas mc '+
     ' on ic.cod_carta=mc.cod_carta and ic.cod_empresa=mc.cod_empresa '+
     ' where ic.cod_empresa='+vDadosIni.codEmpresa +
     ' and itc.cod_itemcarta = '+ inttostr(pCodcarta));

    frmCartasCobranca.pnSolucinar.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
//    frmCartasCobranca.DBGrid2.DataSource := ;

    result := (formulario.ShowModal = IDOK);

  finally
    frmCartasCobranca.pnSolucinar.Parent := frmCartasCobranca.tsSolucionar;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TCartasCobranca._cadItensCartas(TipoForm: integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Cartas de Cobrança');

    if dtmContasAReceber = nil then
      dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

    vDadosIni.vTipoForm := TipoForm;
    if FrmCartasCobranca = nil then
    begin
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';
      Application.CreateForm(TFrmCartasCobranca, FrmCartasCobranca);
    end
    else
      vDadosIni.fechaStatusProcessamento;

    if (TipoForm > 0) and (not FrmCartasCobranca.Visible) then
      FrmCartasCobranca.ShowModal
    else if (not FrmCartasCobranca.Visible) then
      FrmCartasCobranca.Show
    else if FrmCartasCobranca.FormStyle = fsMDIChild then
      FrmCartasCobranca.Show
    else
      FrmCartasCobranca.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;                                 
end;

function TCartasCobranca._definirWhereAdicional: boolean;
var
  I, erro: Integer;
  vTabela: string;
  formatodata: string;
begin
  result:=true;
  vCondicaoWhereAd := '';
  if vRConsAd.adicional then
  begin
    if vRConsAd.porDataAd then
    begin
      try
        erro := 0;
        StrToDate(vRConsAd.dataIniAd);
      except
        vRConsAd.dataIniAd := '';
        erro := erro + 1;
      end;
      try
        StrToDate(vRConsAd.dataFimAd);
      except
        vRConsAd.dataFimAd := '';
        erro := erro + 1;
      end;
      if erro = 2 then
      begin
        Application.MessageBox('Data adicional Inválida. Informe no mínimo uma data correta',
          'Atenção', MB_OK + MB_ICONINFORMATION);
        result:=false;  
      end
      else
      begin
        if (pos('/', ShortDateFormat) <> 0) or (pos('-', ShortDateFormat) <> 0) then
          formatodata := 'mm/dd/yyyy'
        else if pos('.', ShortDateFormat) <> 0 then
          formatodata := 'dd.mm.yyyy';
        if vRConsAd.dataIniAd <> '' then
          vRConsAd.dataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(vRConsAd.dataIniAd)));
        if vRConsAd.dataFimAd <> '' then
          vRConsAd.dataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(vRConsAd.dataFimAd)));
      end;
    end;
    if vRConsAd.condicaoAd = 'Igual' then
      vRConsAd.condicaoAd := '='
    else if vRConsAd.condicaoAd = 'Maior' then
      vRConsAd.condicaoAd := '>'
    else if vRConsAd.condicaoAd = 'Maior ou Igual' then
      vRConsAd.condicaoAd := '>='
    else if vRConsAd.condicaoAd = 'Menor' then
      vRConsAd.condicaoAd := '<'
    else if vRConsAd.condicaoAd = 'Menor ou Igual' then
      vRConsAd.condicaoAd := '<='
    else if vRConsAd.condicaoAd = 'Diferente' then
      vRConsAd.condicaoAd := '<>'
    else if (vRConsAd.condicaoAd = 'Esta contido') then
      vRConsAd.condicaoAd := 'like'
    else if (vRConsAd.condicaoAd = 'Começa') then
      vRConsAd.condicaoAd := 'Começa'
    else
      vRConsAd.condicaoAd := '=';

    for I := 0 to dataSet.FieldCount - 1 do
    begin
      if Dataset.Fields[I].FieldKind = fkData then
      begin
        if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(vRConsAd.campoAd) then
        begin
          if (DataSet.Fields[I].FieldName='EMAIL') or (DataSet.Fields[I].FieldName='CIDADE') then
            vTabela := 'CLIENTES'
          else vTabela := 'ITENS_CARTA';
          vRConsAd.campoAd := DataSet.Fields[I].FieldName;
          if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
            (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) then
          begin
            if vRConsAd.condicaoAd = 'like' then
              vCondicaoWhereAd := vTabela+'.' + vRConsAd.campoAd +
                ' like ' + QuotedStr('%' + vDadosIni.trocaVirgulaPorPonto(vRConsAd.valorAd) + '%')
            else if vRConsAd.condicaoAd = 'Começa' then
              vCondicaoWhereAd := vTabela+'.' + vRConsAd.campoAd +
                ' like ' + QuotedStr(vDadosIni.trocaVirgulaPorPonto(vRConsAd.valorAd) + '%')
            else
              vCondicaoWhereAd := vTabela+'.' + vRConsAd.campoAd +' '+ vRConsAd.condicaoAd
                + ' ' + vDadosIni.trocaVirgulaPorPonto(vRConsAd.valorAd);
          end
          else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
          begin
            if (vRConsAd.dataIniAd <> '') and (vRConsAd.dataFimAd <> '') then
              vCondicaoWhereAd := vTabela+'.' + vRConsAd.campoAd + ' >= ' + vRConsAd.dataIniAd + ' and ' +
                vRConsAd.campoAd + ' <= ' + vRConsAd.dataFimAd
            else if (vRConsAd.dataFimAd <> '') then
              vCondicaoWhereAd := vTabela+'.'+ vRConsAd.campoAd + ' <= ' + vRConsAd.dataFimAd
            else if (vRConsAd.dataIniAd <> '') then
              vCondicaoWhereAd := vTabela+'.'+ vRConsAd.campoAd + ' >= ' + vRConsAd.dataIniAd;
            Break;
          end else if (DataSet.Fields[i] is TStringField) or (DataSet.Fields[i] is TMemoField) then
          begin
            if vRConsAd.condicaoAd = 'like' then
              vCondicaoWhereAd := 'Upper('+vTabela+'.' + vRConsAd.campoAd + ') like ' + QuotedStr('%'+vRConsAd.valorAd +'%')
            else if vRConsAd.condicaoAd = 'Começa' then
               vCondicaoWhereAd := 'Upper('+vTabela+'.' + vRConsAd.campoAd + ') like ' +QuotedStr(vRConsAd.valorAd + '%')
            else
               vCondicaoWhereAd := 'Upper('+vTabela+'.' + vRConsAd.campoAd + ') ' + vRConsAd.condicaoAd +' ' +QuotedStr(vRConsAd.valorAd);
            Break;
          end;

        end;
      end;
    end;
  end;
end;

procedure TCartasCobranca._desmarcaTodasAsLinhas;
begin
  try
    if not vDadosIni.PesqPros('CAR068', 'DESMARCAR', '', 'ITENS_CARTA', '', buscas, True) then
      exit;
    if IsEmpty then
      exit;
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desmarcando todos os registros');
    dataSet.Filter := 'SEL = ''S''';
    dataSet.Filtered := true;
    FInibeItensCartasAfterScroll := true;
    try
    	dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        dataSet.Edit;
        dataSet.FieldByName('sel').AsString := '';
        dataSet.Post;
        //Aqui o filter já funciona como next
      end;
    finally
    	dataSet.First;
      dataSet.EnableControls;
    end;
  finally    
    FInibeItensCartasAfterScroll :=false;
    dataSet.Filter := 'SEL = '''' ';
    dataSet.Filtered := false;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TCartasCobranca._EmailTipoMIME(TipoMIME: Integer): string;
begin
  case TipoMIME of
    0: result := 'text / plain';
    1: result := 'text / html';
    2: result := 'text / richtext';
    3: result := 'text / x - aiff';
    4: result := 'audio / basic';
    5: result := 'audio / wav';
    6: result := 'image / gif';
    7: result := 'image / jpeg';
    8: result := 'image / pjpeg';
    9: result := 'image / tiff';
    10: result := 'image / x - png';
    11: result := 'image / x - xbitmap';
    12: result := 'image / bmp';
    13: result := 'image / x - jg';
    14: result := 'image / x - emf';
    15: result := 'image / x - wmf';
    16: result := 'video / avi';
    17: result := 'video / mpeg';
    18: result := 'application / postscript';
    19: result := 'application / base64';
    20: result := 'application / macbinhex40';
    21: result := 'application / pdf'; // arquivos PDF !!!
    22: result := 'application / x - compressed';
    23: result := 'application / x - zip - compressed';
    24: result := 'application / x - gzip - compressed';
    25: result := 'application / java';
    26: result := 'application / x - msdownload';
    27: result := 'application / octet - stream'; // arquivos .dat !!!!
    28: result := 'multipart / mixed';
    29: result := 'multipart / relative';
    30: result := 'multipart / digest';
    31: result := 'multipart / alternative';
    32: result := 'multipart / related';
    33: result := 'multipart / report';
    34: result := 'multipart / signed';
    35: result := 'multipart / encrypted';
  end;
end;

function TCartasCobranca._enviarCartas: boolean;
var
  vCodOBS : integer;
begin
  try
    Result := false;
    if not vDadosIni.PesqPros('CAR074', 'ENVIAR CARTA DE COBRANÇA', 'INICIANDO PROCESSO', 'ITENS_CARTA', '', buscas, True) then
      exit;

    dataSet.Filtered := false;
    dataSet.Filter := 'SEL=''S''';
    dataSet.Filtered := true;
    
    if IsEmpty then
    begin
      Application.MessageBox('Nenhuma carta selecionada para ser enviada', 'Informação', MB_OK + MB_ICONEXCLAMATION);
      dataSet.Filtered := false;
      dataSet.CancelUpdates;
      Refresh;
      exit;
    end;

    try
    	dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        try
          if dataSet.FieldByName('CONDICAO').AsInteger = 0 then
          begin
            vDadosIni.abreStatusProcessamento('', 'Carta número ' + dataSet.FieldByName('CODIGO').Asstring + ' já enviada anteriormente para o cliente ' +
              trim(dataSet.FieldByName('NOME_CLIENTE').Asstring));
          end
          else if (dataSet.FieldByName('CONDICAO').AsInteger = 1) and (not dataSet.FieldByName('DT_SOLUCAO').IsNull) then
          begin
            vDadosIni.abreStatusProcessamento('', 'Carta número ' + dataSet.FieldByName('CODIGO').Asstring + ' já está solucionada, portanto não há necessidade de envia-la.')
          end
          else
          begin
            try
              dataSet.Edit;
              dataSet.FieldByName('CONDICAO').AsInteger := 0;
              dataSet.Post;
  //            if obCredCartas=nil then
  //              obCredCartas := TCreditosCartas.create;
  //            obCredCartas.montaSelect('select * from itens_carta_cred where cod_itemcarta='+inttostr(dataSet.FieldByName('CODIGO').AsInteger)+' and cod_empresa='+vDadosIni.codEmpresa+
  //              ' and ((solucionado=''N'')  or (solucionado is null))');

              //aqui update em controle_creditos somente para a versão HW4.0
              try
              	obCredCartas.dataSet.DisableControls;
                while not obCredCartas.dataSet.Eof do
                begin
                  buscas.close;
                  buscas.SQL.Text:= 'select cod_obs from controle_creditos '+
                  ' where codigo_emp ='+vDadosIni.codEmpresa+
                  ' and cod_cred = '+IntToStr(obCredCartas.dataSet.FieldByName('cod_cred').AsInteger);
                  buscas.Open;

                  if buscas.FieldByName('COD_OBS').AsInteger = 0 then
                    vCodOBS := Gencodigo('OBSERVACAO', dtmContasAReceber.SpIncCodigo, vDadosIni.codEmpresa)
                  else 
                  	vCodOBS := buscas.FieldByName('COD_OBS').AsInteger;

                  buscas.Close;
                  buscas.SQL.Text := 'insert into observacao(COD_OBS, COD_EMPRESA,'+
                  ' DATA_OBS,HORA_OBS,OBSERVACAO,COD_USUARIO,NITEM) '+
                    ' Values('+inttostr(vCodOBS)+
                    ' ,'+vDadosIni.codEmpresa+
                    ' , :pDATA_OBS, :pHORA_OBS'+
                    ' , '+QuotedStr('ITEM DE CARTA DE COBRANÇA COM O CODIGO '+inttostr(dataSet.FieldByName('CODIGO').AsInteger)+' ENVIADO COM SUCESSO')+
                    ' ,'+IntToStr(vDadosIni.vCodUsuario)+',1) ';
                  buscas.ParamByName('pDATA_OBS').AsDate := date;
                  buscas.ParamByName('pHORA_OBS').AsTime := time;
                  buscas.Prepare;
                  buscas.ExecSQL;

                  buscas.Close;
                  buscas.SQL.Text := 'update controle_creditos set ' +
                    ' COD_IT_CARTAS = ' + dataSet.FieldByName('CODIGO').AsString +
                    ',DT_REG_CARTAS = :pDataEnviu' +
                    ',cod_carta = ' + dataSet.FieldByName('COD_CARTA').AsString +
                    ',COD_OBS = ' +inttostr(vCodOBS)+
                    ' where cod_cliente = ' + inttostr(dataSet.FieldByName('COD_CLIENTE').Asinteger) +
                    ' and coalesce(status_c,'''')= '''' ' +
                    ' and cod_cred = ' + inttostr(obCredCartas.dataSet.FieldByName('COD_CRED').Asinteger) +
                    ' and codigo_emp =  ' + vDadosIni.codEmpresa;
                  buscas.ParamByName('pDataEnviu').AsDateTime := dataSet.FieldByName('DATA').AsDateTime;
                  buscas.Prepare;
                  buscas.ExecSQL;

                  vDadosIni.abreStatusProcessamento('', 'Carta número ' + dataSet.FieldByName('CODIGO').Asstring + ' enviada com sucesso para o cliente ' +
                    trim(dataSet.FieldByName('NOME_CLIENTE').Asstring));
                  vDadosIni.GravaAuditoria('CAR074', 'ENVIO DE CARTA', 'SUCESSO' + dataSet.FieldByName('CODIGO').AsString,'ITENS_CARTA',dataSet.FieldByName('CODIGO').AsString,buscas);
                  obCredCartas.dataSet.Next;
                end;
              finally
                obCredCartas.dataSet.EnableControls;
              end;
            except
              vDadosIni.abreStatusProcessamento('', 'Falha ao enviar carta número ' + dataSet.FieldByName('CODIGO').Asstring + ' para o cliente ' +
                trim(dataSet.FieldByName('NOME_CLIENTE').Asstring));
              vDadosIni.GravaAuditoria('CAR074', 'ENVIO DE CARTA', 'FALHA' + dataSet.FieldByName('CODIGO').AsString,'ITENS_CARTA',dataSet.FieldByName('CODIGO').AsString,buscas);
              dataSet.Edit;
              dataSet.FieldByName('CONDICAO').AsInteger := 1;
              dataSet.Post;
            end;
          end;
        finally
          vDadosIni.fechaStatusProcessamento;
        end;
        dataSet.Next;
      end;
    finally
      dataSet.EnableControls;
    end;
  finally
    result := Apply;
    if Result then
      Result := CommitaTransacao
    else
      RollBackTransacao;
    dataSet.Filtered := false;
  end;
  Refresh;
end;

function TCartasCobranca._enviarCartasViaEmail: boolean;
var
  formulario: TfrmPadrao;
  xAnexo, i: Integer;
  IdAnexo: TIdAttachmentFile;
  htmpart : TIdText;
  html : ansistring;
  AuthSSL: TIdSSLIOHandlerSocketOpenSSL;
  IdSMTP : TIdSMTP;
  IdMessage : TIdMessage;
  IdUserPassProvider: TIdUserPassProvider;
  IdSASLCRAMMD5 : TIdSASLCRAMMD5;
  IdSASLPlain : TIdSASLPlain;
  IdSASLLogin : TIdSASLLogin;
  IdSASLSKey : TIdSASLSKey;
  IdSASLOTP : TIdSASLOTP;
  AdressList: TStrings;
  CCList: TStrings;
  BCCList: TStrings;
  RetornoDll: string;
begin
  result:=false;
  if not vDadosIni.PesqPros('CAR075', 'ENVIAR CARTA POR E-MAIL', 'INICIANDO PROCESSO', 'ITENS_CARTA', dataSet.FieldByName('CODIGO').AsString, buscas, True) then
    exit;
  if not dataset.FieldByName('DT_SOLUCAO').IsNull then
  begin
    Application.MessageBox(Pchar('Carta número '+dataSet.FieldByName('CODIGO').Asstring + ' já se encontra solucionada.'+chr(13)+'A mesma não poderá ser enviada.'),'Informação',MB_OK);
    exit;
  end
  else if dataset.FieldByName('CONDICAO').AsInteger = 1 then
  begin
    Application.MessageBox(Pchar('Status da carta número '+dataSet.FieldByName('CODIGO').Asstring + ' igual a SEM ENVIAR.'+chr(13)+'Antes de enviar a carta por e-mail, marque a carta como enviada'),'Informação',MB_OK);
    exit;
  end;

  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Enviar Carta de Cobrança Via E-mail';
    frmCartasCobranca.labelremetente.caption := 'Remetente : "' + vDadosIni.vEmp.vRemetente_email_cobranca + '"' + '  <' + vDadosIni.vEmp.vEmail_cobranca + '>';
    frmCartasCobranca.RichEditMsg.Clear;
    frmCartasCobranca.EditAssunto.Text := vDadosIni.vEmp.vAssunto_cobranca;
    frmCartasCobranca.EditCC.Text := '';
    frmCartasCobranca.EditCCO.Text := '';
    frmCartasCobranca.MemoAnexos.Clear;

    frmCartasCobranca.RichEditMsg.Text :=
    	vDadosIni._TrocaTAGsDaCarta(
        cCartaCobranca,
      	dataSet.FieldByName('COD_CARTA').AsInteger,
        dataSet.FieldByName('COD_CLIENTE').AsInteger,
        '',
        '',
        dataSet.FieldByName('DATA').AsDateTime,
        dataSet.FieldByName('DIAS_ATRASO_PED').AsInteger,
        dataSet.FieldByName('COD_CONTROLE').Asstring,
        vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, dataSet.FieldByName('cod_emp_mult').AsInteger, 0)
      );

    frmCartasCobranca.MemoAnexos.text:=GetEnvironmentVariable('TEMP')+'\CartaCod-'+dataSet.FieldByName('COD_CARTA').Asstring+'-Emp'+vDadosIni.codEmpresa+'.rtf';
    frmCartasCobranca.RichEditMsg.Lines.SaveToFile(GetEnvironmentVariable('TEMP')+'\CartaCod-'+dataSet.FieldByName('COD_CARTA').Asstring+'-Emp'+vDadosIni.codEmpresa+'.rtf');

    frmCartasCobranca.RichEditMsg.Lines.Add('');
    frmCartasCobranca.RichEditMsg.Lines.Add('');
    frmCartasCobranca.RichEditMsg.Lines.Add(vDadosIni.vEmp.vMsg_cobranca);
    frmCartasCobranca.EditPara.Text := dataSet.FieldByName('email').AsString;

    frmCartasCobranca.pnEnviarCartaViaEmail.Parent := formulario;
    buscas.Close;
//    formulario.AutoSize := True;
//    formulario.AutoScroll := False;
//    formulario.ShowHint := true;
//    formulario.KeyPreview := True;
//
//    result := (formulario.ShowModal = IDOK);

    result := vDadosIni.abreForm('Enviar Carta de Cobrança Via Email', frmCartasCobranca.pnEnviarCartaViaEmail, [ofEscapeExit, ofAlignAllClientWinCtrl]);

  finally
    if result then
    begin
      try
        vDadosIni.abreStatusProcessamento('', 'Enviando e-mail para: '+frmCartasCobranca.EditPara.Text);
        IdSMTP := TIdSMTP.Create(nil);
        IdMessage := TIdMessage.Create(nil);
        IdMessage.Recipients.EMailAddresses := frmCartasCobranca.EditPara.Text;
        IdMessage.CCList.EMailAddresses := frmCartasCobranca.EditCC.Text;
        IdMessage.BccList.EMailAddresses := frmCartasCobranca.EditCCO.Text;
        IdMessage.Subject := frmCartasCobranca.EditAssunto.Text + ' - ' + DateTimeToStr(vDadosIni.getDataHoraBanco(buscas));
        IdMessage.CharSet := 'ISO-8859-1';
        IdMessage.Date := vDadosIni.getDataHoraBanco(buscas);
        IdMessage.From.Address := vDadosIni.vEmp.vEmail_cobranca;
        IdMessage.From.Name := vDadosIni.vEmp.vRemetente_email_cobranca;
        IdMessage.ContentType := 'multipart/mixed';
        IdMessage.MessageParts.Clear;

        if frmCartasCobranca.checkBoxConfirmaLeitura.Checked then
        begin
          IdMessage.ReceiptRecipient.Text := IdMessage.From.Text; // Auto Resposta
        end;
        //Trata a Prioridade da mensagem
        case frmCartasCobranca.ComboBoxPrioridade.ItemIndex of
          0: IdMessage.Priority := mpHigh;
          1: IdMessage.Priority := mpNormal;
          2: IdMessage.Priority := mpLow;
        end;
        IdSMTP.Host := vDadosIni.vEmp.vSmtp_cobranca;
        IdSMTP.Username := vDadosIni.vEmp.vLogin_cobranca;
        IdSMTP.Password := vDadosIni.vEmp.vSenha_email_cobranca;

        if vDadosIni.vEmp.vEmailUsaSegurancaSSL then
        begin
          AuthSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
          IdSMTP.IOHandler := AuthSSL;
          IdSMTP.UseTLS := utUseImplicitTLS;
          AuthSSL.SSLOptions.Method := sslvSSLv3;
          AuthSSL.SSLOptions.Mode   := sslmClient;
          if vDadosIni.vEmp.vSmtpporta_cobranca = 0 then
            IdSMTP.Port := 465  //ou 587 em alguns servidores
          else
          	IdSMTP.Port := vDadosIni.vEmp.vSmtpporta_cobranca;
        end
        else
        begin
          if vDadosIni.vEmp.vSmtpporta_cobranca = 0 then
            IdSMTP.Port := 25  //ou 587 em alguns servidores
          else
          	IdSMTP.Port := vDadosIni.vEmp.vSmtpporta_cobranca;
        end;

        if vDadosIni.vEmp.vEmailUsaAutenticacao then
        begin
          IdSMTP.AuthType := atSASL;
          IdUserPassProvider := TIdUserPassProvider.Create(IdSMTP);
          IdUserPassProvider.Username := vDadosIni.vEmp.vLogin_cobranca;
          IdUserPassProvider.Password := vDadosIni.vEmp.vSenha_email_cobranca;
          IdSASLCRAMMD5 := TIdSASLCRAMMD5.Create(IdSMTP);
          IdSASLCRAMMD5.UserPassProvider := IdUserPassProvider;
          IdSASLPlain := TIdSASLPlain.Create(IdSMTP);
          IdSASLPlain.UserPassProvider := IdUserPassProvider;
          IdSASLLogin := TIdSASLLogin.Create(IdSMTP);  // same as sasDefault
          IdSASLLogin.UserPassProvider := IdUserPassProvider;
          IdSASLSKey := TIdSASLSKey.Create(IdSMTP);
          IdSASLSKey.UserPassProvider := IdUserPassProvider;
          IdSASLOTP := TIdSASLOTP.Create(IdSMTP);
          IdSASLOTP.UserPassProvider := IdUserPassProvider;
          IdSMTP.SASLMechanisms.Clear;
          with IdSMTP.SASLMechanisms.Add do  //Mecanismos de autenticação
          begin
            SASL := IdSASLCRAMMD5;
            SASL := IdSASLPlain;
            SASL := IdSASLSKey;
            SASL := IdSASLOTP;
            SASL := IdSASLLogin;
          end;
        end
        else
          IdSMTP.AuthType := atNone;

        html := vDadosIni._RichTextTOHTML(frmCartasCobranca.RichEditMsg);
        htmpart := TIdText.Create(IdMessage.MessageParts);
        htmpart.Body.Text:= html;
        htmpart.ContentType := 'text/html';
        htmpart.CharSet := 'ISO-8859-1';
        htmpart.ContentTransfer := '16bit';


        //Tratando os arquivos anexos
        for xAnexo := 0 to frmCartasCobranca.MemoAnexos.Lines.Count - 1 do
        begin
          if FileExists(frmCartasCobranca.MemoAnexos.Lines[xAnexo]) then
          begin
            try
              TIdAttachmentFile.create(IdMessage.MessageParts, TFileName(frmCartasCobranca.MemoAnexos.Lines.Strings[xAnexo]));
            except
            end;
          end;
        end;

        AdressList := TStringList.Create;
        CCList := TStringList.Create;
        BCCList := TStringList.Create;

        frmCartasCobranca.EditPara.Text := StringReplace(frmCartasCobranca.EditPara.Text, ',', ';', [rfReplaceAll]);
        AdressList := vDadosIni.Split(frmCartasCobranca.EditPara.Text, ';');

        frmCartasCobranca.EditCC.Text := StringReplace(frmCartasCobranca.EditCC.Text, ',', ';', [rfReplaceAll]);
        CCList := vDadosIni.Split(frmCartasCobranca.EditCC.Text, ';');

        frmCartasCobranca.EditCCO.Text := StringReplace(frmCartasCobranca.EditCCO.Text, ',', ';', [rfReplaceAll]);
        BCCList := vDadosIni.Split(frmCartasCobranca.EditCCO.Text, ';');

        try
          RetornoDll := Trim(string(SendMailByACBr(
                  PChar(vDadosIni.vEmp.vSmtp_cobranca),
                  PChar(IntToStr(vDadosIni.vEmp.vSmtpporta_cobranca)),
                  PChar(vDadosIni.vEmp.vEmail_cobranca),
                  PChar(vDadosIni.vEmp.vLogin_cobranca),
                  PChar(vDadosIni.vEmp.vSenha_email_cobranca),
                  PChar(vDadosIni.vEmp.vRemetente_email_cobranca),
                  PChar(frmCartasCobranca.EditAssunto.Text + ' - ' + DateTimeToStr(vDadosIni.getDataHoraBanco(buscas))),
                  PChar(html),
                  PChar(frmCartasCobranca.MemoAnexos.Lines.Text),
                  PChar(AdressList.Text),
                  PChar(''),
                  PChar(CCList.Text),
                  PChar(BCCList.Text),
                  PChar(IntToStr(frmCartasCobranca.ComboBoxPrioridade.ItemIndex)),
                  True,
                  vDadosIni.vEmp.vEmailUsaSegurancaSSL,
                  True,
                  False,
                  False,
                  True,
                  False)));

        if RetornoDll <> 'OK' then
          raise Exception.Create(RetornoDll);

        {
        try
          IdSMTP.ReadTimeout := 10000;
          if not IdSMTP.Connected then
            IdSMTP.Connect;
        except
          //às vezes falha ao conectar pela primeira vez... neste caso tenta-se uma segunda vez.
          try
            IdSMTP.Disconnect;
            IdSMTP.Connect;
          finally
          end;
        end;
        }

//        try
          {
          if vDadosIni.vEmp.vEmailUsaAutenticacao and IdSMTP.Connected then
            IdSMTP.Authenticate;
          IdSMTP.Send(IdMessage);
          }
          if _gravarOBSCREDSobreEmailEnviado(dataSet.FieldByName('CODIGO').AsInteger) then
            CommitaTransacao
          else RollBackTransacao;
          Application.MessageBox(Pchar('E-mail enviado com sucesso para: '+frmCartasCobranca.EditPara.Text),'Informação',MB_OK+MB_ICONINFORMATION);
        except
          Application.MessageBox(Pchar('Falha ao enviar e-mail para: '+frmCartasCobranca.EditPara.Text),'Informação',MB_OK+MB_ICONINFORMATION);
        end;
      finally
        IdSMTP.Disconnect;
        if IdSASLCRAMMD5 <> nil then
          FreeAndNil(IdSASLCRAMMD5);
        if IdSASLLogin <> nil then
          FreeAndNil(IdSASLLogin);
        if IdSASLPlain <> nil then
          FreeAndNil(IdSASLPlain);
        if IdSASLSKey <> nil then
          FreeAndNil(IdSASLSKey);
        if IdSASLOTP <> nil then
          FreeAndNil(IdSASLOTP);
        if IdUserPassProvider <> nil then
        begin
          IdUserPassProvider.Free;
          IdUserPassProvider:=nil;
        end;
        if IdSMTP.SASLMechanisms<>nil then
          IdSMTP.SASLMechanisms.Clear;
         FreeAndNil(htmpart);
        if IdMessage <> nil then
        begin
          IdMessage.Destroy;
          IdMessage := nil;
        end;
        if AuthSSL <> nil then
        begin
          if AuthSSL.SSLContext <> nil then
          begin
            AuthSSL.SSLContext.Destroy;
            AuthSSL.SSLContext := nil;
          end;
          if AuthSSL.SSLSocket <> nil then
          begin
            AuthSSL.SSLSocket.Destroy;
            AuthSSL.SSLSocket := nil;
          end;
          if AuthSSL.SSLOptions <> nil then
          begin
            AuthSSL.SSLOptions.Destroy;
            AuthSSL.SSLOptions := nil;
          end;
          AuthSSL.free;
          AuthSSL := nil;
        end;
        if IdSMTP <> nil then
        begin
          IdSMTP.Destroy;
          IdSMTP := nil;
        end;
        vDadosIni.fechaStatusProcessamento;
      end;
    end;
    DeleteFile(Pchar(GetEnvironmentVariable('TEMP')+'\CartaCod-'+dataSet.FieldByName('COD_CARTA').Asstring+'-Emp'+vDadosIni.codEmpresa+'.rtf'));
    frmCartasCobranca.pnEnviarCartaViaEmail.Parent := frmCartasCobranca.tsEnviarCarta;
    if Assigned(formulario) then
    begin
      formulario.Free;
      formulario := nil;
    end;
  end;
end;

function TCartasCobranca._gerarItensCarta(var pProgressBar: TProgressBar; pLabel: Tlabel;
  pCodigoUnificada: Integer): boolean;
var
  vQtdDiasAtraso,vCodItemCartaTemp: integer;
  databanco,vReprocessamentocarta: TDateTime;
  vConfirmarInclusao: boolean;
  vCont,vContCarta,vContCartaR,vCodItCartaTemp,i,vCodFaturamentoCli,vCodOBS: integer;
  vNomeCliente:string;
  vCodCartaAnt_Processamento,vCodCartaAnt_ReProcessamento,vNumReprocessamentocarta :integer;
  buscas2: TIBQuery;
begin
  result := false;
  if not vDadosIni.PesqPros('CAR069', 'GERAR', '', 'ITENS_CARTA', '', buscas, True) then
    exit;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;
   
  try
//    if FCodControle < 0 then
//      raiseExceptionCreate('Controle não informado.', 'DBLookupComboBoxControles');
    if FControlesSelec ='' then
      raiseExceptionCreate('Controle não informado.', 'CheckListBoxControles');
    if FCodCarta < 0 then
      raiseExceptionCreate('Carta não informada.', 'DBLookupComboBoxModCarta');
    databanco := vDadosIni.getDataBanco(buscas);
    FqrAtrasoPagamento.Close;
    if FGerarCartasPorCidade then
      FqrAtrasoPagamento.SQL.Text := 'select distinct cc.cod_cliente,c.NOME_CLIENTE, c.codigo_faturamento '+
        ' from controle_creditos cc inner join clientes c ' +
        ' on cc.cod_cliente=c.cod_cliente and cc.'+vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP')+'=c.cod_empresa '+
        ' where coalesce(cc.status_c,'''')= '''' ' +
        ' and cc.data_rec_c >=:pDataInicial and cc.data_rec_c <=:pDataFinal ' +
        ' and cc.CODIGO_EMP =' + vDadosIni.codEmpresa +
        vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
          ' and cc.COD_EMP_MULT = ' + IntToStr(pCodigoUnificada), '') +
        ' and cc.codigo_ctrl in ('+FControlesSelec+') '+
        ' and cc.cod_cliente is not null '+
        ' and c.cod_cidade = '+inttostr(FCodCidade)
    else
      FqrAtrasoPagamento.SQL.Text := 'select distinct cc.cod_cliente,c.NOME_CLIENTE, c.codigo_faturamento '+
        ' from controle_creditos cc inner join clientes c ' +
        ' on cc.cod_cliente=c.cod_cliente and cc.'+vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP')+'=c.cod_empresa '+
        ' where coalesce(cc.status_c,'''')= '''' ' +
        ' and cc.data_rec_c >=:pDataInicial and cc.data_rec_c <=:pDataFinal ' +
        ' and cc.CODIGO_EMP =' + vDadosIni.codEmpresa +
        vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
          ' and cc.COD_EMP_MULT = ' + IntToStr(pCodigoUnificada), '') +
        ' and cc.codigo_ctrl in ('+FControlesSelec+') '+
        ' and cc.cod_cliente is not null';
    FqrAtrasoPagamento.ParamByName('pDataInicial').AsDate := Fdatainicial;
    FqrAtrasoPagamento.ParamByName('pDataFinal').AsDate := Fdatafinal;
    FqrAtrasoPagamento.Open;
    FqrAtrasoPagamento.FetchAll;

    pLabel.Caption := '';
    vCont := 0;
    vContCarta:=0;
    vContCartaR:=0;
    pProgressBar.min := 0;
    pProgressBar.position := 0;
    pProgressBar.max := FqrAtrasoPagamento.recordcount;
    try
    	FqrAtrasoPagamento.DisableControls;
      FqrAtrasoPagamento.First;
      while not FqrAtrasoPagamento.Eof do
      begin
        Application.ProcessMessages;
        vConfirmarInclusao:=false;
        pProgressBar.position := pProgressBar.position + 1;
        vCodFaturamentoCli:= FqrAtrasoPagamento.FieldByName('CODIGO_FATURAMENTO').AsInteger;
        vNomeCliente := trim(FqrAtrasoPagamento.FieldByName('NOME_CLIENTE').Asstring);

        buscas.Close;
        buscas.SQL.Text := 'select first 1 cod_cred from controle_creditos ' +
          ' where codigo_emp =' + vDadosIni.codEmpresa +
          vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
            ' and COD_EMP_MULT = ' + IntToStr(pCodigoUnificada), '') +
          ' and cod_cliente = ' + IntToStr(FqrAtrasoPagamento.FieldByName('COD_CLIENTE').AsInteger) +
          ' and coalesce(status_c,'''')='''' and data_venc_c <= :pData ' +
          ' and codigo_ctrl in ('+FControlesSelec+') '+
          ' order by data_venc_c';
        buscas.ParamByName('pData').AsDate := databanco - FDiasAtraso;
        buscas.Open;
        if buscas.IsEmpty then
        begin
          FqrAtrasoPagamento.Next;
          Continue;
        end; 

        buscas.close;
        buscas.SQL.Text:='select ic.*,rcar.codant_processamento,rcar.codant_reprocessamento from regradecartas rcar '+
          ' inner join Itens_Carta ic' +
          ' on rcar.cod_carta=ic.cod_carta and rcar.cod_empresa=ic.cod_empresa '+
          ' where ic.cod_cliente = ' + inttostr(FqrAtrasoPagamento.FieldByName('COD_CLIENTE').AsInteger)+
          ' and ic.cod_carta = ' + inttostr(FCodCarta) +
          ' and ((ic.cod_controle like ''%'+StringReplace(FControlesSelec,',','%'') or (ic.cod_controle like ''%',[])+'%''))'+
          ' and coalesce(ic.dt_solucao,'''')='''' and ic.COD_EMPRESA = ' + vDadosIni.codEmpresa +
          vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
            ' and ic.COD_EMP_MULT = ' + IntToStr(pCodigoUnificada), '') +
          ' and ic.ativo =1';
        buscas.open;
        if buscas.IsEmpty then
        begin
          buscas.Close;
          buscas.SQL.Text := 'select rcar.codant_processamento from regradecartas rcar '+
            ' where rcar.cod_carta='+ inttostr(FCodCarta) +
            ' and rcar.cod_empresa='+ vDadosIni.codEmpresa;
          buscas.Open;

          if buscas.FieldByName('codant_processamento').AsInteger<>0 then
          begin
            vCodCartaAnt_Processamento := buscas.FieldByName('codant_processamento').AsInteger;
            buscas.close;
            buscas.SQL.Text:='select ic.data from Itens_Carta ic ' +
              ' where ic.cod_cliente = ' + inttostr(FqrAtrasoPagamento.FieldByName('COD_CLIENTE').AsInteger)+
              ' and ic.cod_carta = ' + inttostr(vCodCartaAnt_Processamento) +
              ' and ((ic.cod_controle like ''%'+StringReplace(FControlesSelec,',','%'') or (ic.cod_controle like ''%',[])+'%''))'+
              ' and coalesce(ic.dt_solucao,'''')='''' and ic.COD_EMPRESA = ' + vDadosIni.codEmpresa +
              vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
                ' and ic.COD_EMP_MULT = ' + IntToStr(pCodigoUnificada), '') +
              ' and ic.ativo =1';
            buscas.open;
            if not((databanco - buscas.FieldByName('DATA').AsDateTime) > FDiasEntreCartas) or buscas.IsEmpty then
            begin
              FqrAtrasoPagamento.Next;
              Continue;
            end;
          end;
          buscas.Close;
          buscas.SQL.Text := 'insert into Itens_carta(Codigo, Data, Condicao, ' +
            'Cod_Carta, Cod_Cliente, Nome_Cliente,dias_atraso_ped,' +
            'cod_faturamento,cod_controle,cod_empresa,cod_cred,versaocarta,cod_emp_mult)' +
            ' Values(:Codigo, :Data, 1, ' +
            ':Cod_Carta, :Cod_Cliente, :Nome_Cliente,:dias_atraso_ped,' +
            ':cod_faturamento,:cod_controle,' + vDadosIni.codEmpresa + ',:cod_cred,1,:cod_emp_mult)';
          buscas.ParamByName('Codigo').AsInteger := Gencodigo('ITENS_CARTA',
            buscas2, vDadosIni.codEmpresa);
          vCodItCartaTemp:= buscas.ParamByName('Codigo').AsInteger;
          buscas.ParamByName('Data').AsDateTime := databanco;
          buscas.ParamByName('Cod_Carta').AsInteger := FCodCarta;
          buscas.ParamByName('Cod_Cliente').AsInteger :=
            FqrAtrasoPagamento.FieldByName('COD_CLIENTE').AsInteger;
          buscas.ParamByName('Nome_Cliente').AsString := vNomeCliente;
  //          trim(FqrAtrasoPagamento.FieldByName('NOME_C').AsString);
  //        buscas.ParamByName('dias_atraso').AsInteger := vQtdDiasAtraso;
          buscas.ParamByName('dias_atraso_ped').AsInteger := FDiasAtraso;
          buscas.ParamByName('cod_faturamento').AsInteger := vCodFaturamentoCli;
          buscas.ParamByName('cod_controle').AsString := FControlesSelec;
          buscas.ParamByName('cod_emp_mult').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, pCodigoUnificada, StrToInt(vDadosIni.codEmpresa));
          buscas.Prepare;
          buscas.ExecSQL;

          FqrGravarCredAtraso.Close;
          FqrGravarCredAtraso.SQL.Text := 'select cod_cred,DATA_VENC_C,codigo_ctrl from controle_creditos ' +
            ' where codigo_emp =' + vDadosIni.codEmpresa +
            vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
              ' and COD_EMP_MULT = ' + IntToStr(pCodigoUnificada), '') +
            ' and cod_cliente = ' + IntToStr(FqrAtrasoPagamento.FieldByName('COD_CLIENTE').AsInteger) +
            ' and coalesce(status_c,'''')='''' and data_venc_c <= :pData ' +
            ' and codigo_ctrl in ('+FControlesSelec+') '+//= ' + inttostr(FCodControle) +
            ' order by data_venc_c';
          FqrGravarCredAtraso.ParamByName('pData').AsDate := databanco - FDiasAtraso;
          FqrGravarCredAtraso.Open;
          FqrGravarCredAtraso.First;
          while not FqrGravarCredAtraso.Eof do
          begin
            vQtdDiasAtraso := trunc(databanco - FqrGravarCredAtraso.FieldByName('DATA_VENC_C').AsDateTime);
            buscas.Close;
            buscas.SQL.Text := 'insert into itens_carta_cred(COD_ITEMCARTA, COD_EMPRESA, COD_CRED,SOLUCIONADO,DIAS_ATRASO,CODIGO_CTRL) '+
              ' Values('+inttostr(vCodItCartaTemp)+
              ' ,'+vDadosIni.codEmpresa+
              ' ,'+IntToStr(FqrGravarCredAtraso.FieldByName('cod_cred').AsInteger)+' ,''N'','+inttostr(vQtdDiasAtraso)+
              ' ,'+IntToStr(FqrGravarCredAtraso.FieldByName('codigo_ctrl').AsInteger)+') ';
            buscas.Prepare;
            buscas.ExecSQL;

            buscas.close;
            buscas.SQL.Text:= 'select cod_obs from controle_creditos '+
              ' where codigo_emp ='+vDadosIni.codEmpresa+
              ' and cod_cred = '+IntToStr(FqrGravarCredAtraso.FieldByName('cod_cred').AsInteger);
            buscas.Open;
            if buscas.FieldByName('cod_obs').AsInteger=0 then
            begin
              vCodOBS := Gencodigo('OBSERVACAO', buscas2, vDadosIni.codEmpresa);

              SqlOpen(' select max(cod_obs) cod_obs from observacao ' +
                ' where cod_empresa = ' + vDadosIni.codEmpresa);

              if buscas.FieldByName('cod_obs').AsInteger + 1 > vCodOBS then
              begin
                vCodOBS := buscas.FieldByName('cod_obs').AsInteger + 1;

                SqlExec('update codigo set valor = ' + IntToStr(vCodOBS) +
                  ' where tabela = ''OBSERVACAO'' ' +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa, buscas2);
              end;

              buscas.Close;
              buscas.SQL.Text :='UPDATE CONTROLE_CREDITOS SET '+
                ' COD_OBS = '+inttostr(vCodOBS) +
                ' WHERE COD_CRED = '+IntToStr(FqrGravarCredAtraso.FieldByName('cod_cred').AsInteger)+
                ' AND CODIGO_EMP = '+vDadosIni.codEmpresa;
              buscas.Prepare;
              buscas.ExecSQL;
            end
            else
              vCodOBS := buscas.FieldByName('COD_OBS').AsInteger;

            buscas.Close;
            buscas.SQL.Text := 'insert into observacao(COD_OBS, COD_EMPRESA,'+
            ' DATA_OBS,HORA_OBS,OBSERVACAO,COD_USUARIO,NITEM) '+
              ' Values('+inttostr(vCodOBS)+
              ' ,'+vDadosIni.codEmpresa+
              ' , :pDATA_OBS, :pHORA_OBS'+
              ' , '+QuotedStr('ITEM DE CARTA GERADO COM O CODIGO '+inttostr(vCodItCartaTemp))+
              ' ,'+IntToStr(vDadosIni.vCodUsuario)+',1) ';
            buscas.ParamByName('pDATA_OBS').AsDate := date;
            buscas.ParamByName('pHORA_OBS').AsTime := time;
            buscas.Prepare;
            buscas.ExecSQL;

            if FPararProcessamento then
              break;
            FqrGravarCredAtraso.Next;
          end;
          inc(vCont);
          inc(vContCarta);
          pLabel.Caption := 'Cliente: ' + vNomeCliente;//trim(FqrAtrasoPagamento.FieldByName('NOME_C').AsString);
          pLabel.Caption := inttostr(vCont) + ' cartas geradas';
        end 
        else if vDadosIni.vEmp.vReprocessarCartaCobranca then
        begin
          vCodItemCartaTemp := buscas.FieldByName('CODIGO').AsInteger;
          buscas.close;
          buscas.SQL.Text:='select ic.reprocessamento, coalesce(ic.reprocessamento, ic.data) as datamaior,'+
            ' ic.NUMREPROCESSAMENTO,rcar.codant_processamento,rcar.codant_reprocessamento '+
            ' from regradecartas rcar inner join Itens_Carta ic' +
            ' on rcar.cod_carta=ic.cod_carta and rcar.cod_empresa=ic.cod_empresa '+
            ' where ic.cod_cliente = ' + inttostr(FqrAtrasoPagamento.FieldByName('COD_CLIENTE').AsInteger)+
            ' and ic.cod_carta = ' + inttostr(FCodCarta) +
            ' and ((ic.cod_controle like ''%'+StringReplace(FControlesSelec,',','%'') or (ic.cod_controle like ''%',[])+'%''))'+
            ' and coalesce(ic.dt_solucao,'''')='''' and ic.COD_EMPRESA = ' + vDadosIni.codEmpresa +
            vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
              ' and ic.COD_EMP_MULT = ' + IntToStr(pCodigoUnificada), '') +
            ' and ic.ativo =1';
          buscas.open;

          vCodCartaAnt_ReProcessamento := buscas.FieldByName('codant_reprocessamento').AsInteger;
          vCodCartaAnt_Processamento :=  buscas.FieldByName('codant_processamento').AsInteger;
          vReprocessamentocarta :=  buscas.FieldByName('reprocessamento').AsDateTime;
          vNumReprocessamentocarta := buscas.FieldByName('NUMREPROCESSAMENTO').AsInteger;
          buscas.close;
          buscas.SQL.Text:='select ic.reprocessamento, coalesce(ic.reprocessamento, ic.data) as datamaior,ic.NUMREPROCESSAMENTO, '+
            ' rcar.codant_processamento,rcar.codant_reprocessamento '+
            ' from regradecartas rcar inner join Itens_Carta ic' +
            ' on rcar.cod_carta=ic.cod_carta and rcar.cod_empresa=ic.cod_empresa '+
            ' where ic.cod_cliente = ' + inttostr(FqrAtrasoPagamento.FieldByName('COD_CLIENTE').AsInteger)+
            ' and ic.cod_carta = ' + inttostr(vCodCartaAnt_ReProcessamento) +
            ' and ((ic.cod_controle like ''%'+StringReplace(FControlesSelec,',','%'') or (ic.cod_controle like ''%',[])+'%''))'+
            ' and coalesce(ic.dt_solucao,'''')='''' and ic.COD_EMPRESA = ' + vDadosIni.codEmpresa +
            vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
              ' and ic.COD_EMP_MULT = ' + IntToStr(pCodigoUnificada), '') +
            ' and ic.ativo =1';
          buscas.open;
          if vCodCartaAnt_Processamento = 0 then
          begin
            if (vReprocessamentocarta=0) then
            begin
              if not((databanco - buscas.FieldByName('datamaior').AsDateTime) > FDiasEntreCartas)
              or buscas.IsEmpty then
              begin
                FqrAtrasoPagamento.Next;
                Continue;
              end;
            end 
            else if (vNumReprocessamentocarta = buscas.FieldByName('NUMREPROCESSAMENTO').AsInteger) then
            begin
                if not((databanco - buscas.FieldByName('reprocessamento').AsDateTime) > FDiasEntreCartas)
                	or buscas.IsEmpty or (buscas.FieldByName('reprocessamento').AsDateTime=0) then
                begin
                  FqrAtrasoPagamento.Next;
                  Continue;
                end;
            end 
            else 
            begin
              FqrAtrasoPagamento.Next;
              Continue;
            end;
          end 
          else 
          begin
            if (buscas.FieldByName('NUMREPROCESSAMENTO').AsInteger=0) then
            begin
              FqrAtrasoPagamento.Next;
              Continue;
            end 
            else if (vNumReprocessamentocarta < buscas.FieldByName('NUMREPROCESSAMENTO').AsInteger) then
            begin
              if not((databanco - buscas.FieldByName('reprocessamento').AsDateTime) > FDiasEntreCartas)
              	or buscas.IsEmpty or (buscas.FieldByName('reprocessamento').AsDateTime=0) then
              begin
                FqrAtrasoPagamento.Next;
                Continue;
              end;
            end 
            else 
            begin
              FqrAtrasoPagamento.Next;
              Continue;
            end;
          end;

          buscas.Close;
          buscas.SQL.Text := 'update Itens_carta set REPROCESSAMENTO = :pREPROCESSAMENTO, '+
            ' NUMREPROCESSAMENTO = coalesce(NUMREPROCESSAMENTO,0)+1'  +
            ' where codigo = '+ inttostr(vCodItemCartaTemp) + ' and cod_empresa='+vDadosIni.codEmpresa;
          buscas.ParamByName('pREPROCESSAMENTO').AsDateTime :=  databanco;
          buscas.Prepare;
          buscas.ExecSQL;

          FqrGravarCredAtraso.Close;
          FqrGravarCredAtraso.SQL.Text := 'select cod_cred,DATA_VENC_C,codigo_ctrl from controle_creditos ' +
            ' where codigo_emp =' + vDadosIni.codEmpresa +
            vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
              ' and COD_EMP_MULT = ' + IntToStr(pCodigoUnificada), '') +
            ' and cod_cliente = ' + IntToStr(FqrAtrasoPagamento.FieldByName('COD_CLIENTE').AsInteger) +
            ' and coalesce(status_c,'''')='''' and data_venc_c <= :pData ' +
            ' and codigo_ctrl in ('+FControlesSelec+') '+//= ' + inttostr(FCodControle) +
            ' order by data_venc_c';
          FqrGravarCredAtraso.ParamByName('pData').AsDate := databanco - FDiasAtraso;
          FqrGravarCredAtraso.Open;
          FqrGravarCredAtraso.First;
          while not FqrGravarCredAtraso.Eof do
          begin
            vQtdDiasAtraso := trunc(databanco - FqrGravarCredAtraso.FieldByName('DATA_VENC_C').AsDateTime);
            if not ExecutaComandosSql('select COD_ITEMCARTA, COD_EMPRESA, COD_CRED from itens_carta_cred '+
                ' where COD_ITEMCARTA='+inttostr(vCodItemCartaTemp)+
                ' and COD_EMPRESA='+vDadosIni.codEmpresa+
                ' and COD_CRED='+IntToStr(FqrGravarCredAtraso.FieldByName('cod_cred').AsInteger)) then
            begin
              buscas.Close;
              buscas.SQL.Text := 'insert into itens_carta_cred(COD_ITEMCARTA, COD_EMPRESA, COD_CRED,SOLUCIONADO,DIAS_ATRASO,CODIGO_CTRL) '+
                ' Values('+inttostr(vCodItemCartaTemp)+
                ' ,'+vDadosIni.codEmpresa+
                ' ,'+IntToStr(FqrGravarCredAtraso.FieldByName('cod_cred').AsInteger)+' ,''N'','+inttostr(vQtdDiasAtraso)+
                ' ,'+IntToStr(FqrGravarCredAtraso.FieldByName('codigo_ctrl').AsInteger)+') ';
              buscas.Prepare;
              buscas.ExecSQL;
            end 
            else 
            begin
              buscas.Close;
              buscas.SQL.Text := 'update itens_carta_cred set DIAS_ATRASO = '+ inttostr(vQtdDiasAtraso)+
                ' where COD_ITEMCARTA='+inttostr(vCodItemCartaTemp)+
                ' and COD_EMPRESA='+vDadosIni.codEmpresa+
                ' and COD_CRED='+IntToStr(FqrGravarCredAtraso.FieldByName('cod_cred').AsInteger);
              buscas.Prepare;
              buscas.ExecSQL;
            end;

            buscas.close;
            buscas.SQL.Text:= 'select cod_obs from controle_creditos '+
            ' where codigo_emp ='+vDadosIni.codEmpresa+
            ' and cod_cred = '+IntToStr(FqrGravarCredAtraso.FieldByName('cod_cred').AsInteger);
            buscas.Open;
            if buscas.FieldByName('cod_obs').AsInteger=0 then
            begin
              vCodOBS := Gencodigo('OBSERVACAO', buscas2, vDadosIni.codEmpresa);
              buscas.Close;
              buscas.SQL.Text :='UPDATE CONTROLE_CREDITOS SET '+
                ' COD_OBS = '+inttostr(vCodOBS) +
                ' WHERE COD_CRED = '+IntToStr(FqrGravarCredAtraso.FieldByName('cod_cred').AsInteger)+
                ' AND CODIGO_EMP = '+vDadosIni.codEmpresa;
              buscas.Prepare;
              buscas.ExecSQL;
            end
            else 
            	vCodOBS := buscas.FieldByName('COD_OBS').AsInteger;

            buscas.Close;
            buscas.SQL.Text := 'insert into observacao(COD_OBS, COD_EMPRESA,'+
            ' DATA_OBS,HORA_OBS,OBSERVACAO,COD_USUARIO,NITEM) '+
              ' Values('+inttostr(vCodOBS)+
              ' ,'+vDadosIni.codEmpresa+
              ' , :pDATA_OBS, :pHORA_OBS'+
              ' , '+QuotedStr('ITEM DE CARTA GERADO COM O CODIGO '+inttostr(vCodItemCartaTemp))+
              ' ,'+IntToStr(vDadosIni.vCodUsuario)+',1) ';
            buscas.ParamByName('pDATA_OBS').AsDate := date;
            buscas.ParamByName('pHORA_OBS').AsTime := time;
            buscas.Prepare;
            buscas.ExecSQL;

            if FPararProcessamento then
              break;
            FqrGravarCredAtraso.Next;
          end;
          inc(vCont);
          inc(vContCartaR);
          pLabel.Caption := 'Cliente: ' + vNomeCliente;
          pLabel.Caption := inttostr(vCont) + ' cartas geradas';
        end;

        if FPararProcessamento then
          break;
        FqrAtrasoPagamento.Next;
      end;
    finally
      FqrAtrasoPagamento.EnableControls;
    end;
    
    if FPararProcessamento then
    begin
      result:=false;
      RollBackTransacao;
    end
    else
    	result := CommitaTransacao;

    if result then
    begin
      if vCont = 0 then
        montaSelect('select ITENS_CARTA.*,' +
          ' clientes.email,clientes.cidade from itens_carta ' +
          ' left join clientes ' +
          ' on ITENS_CARTA.cod_cliente=clientes.cod_cliente and ITENS_CARTA.'+vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'COD_EMPRESA')+'=clientes.cod_empresa ' +
          ' where ITENS_CARTA.cod_empresa = ' + vDadosIni.codEmpresa +
          vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
            ' and ITENS_CARTA.COD_EMP_MULT = ' + IntToStr(pCodigoUnificada), '') +
          ' and ((ITENS_CARTA.data =' + QuotedStr(FormatDateTime('yyyy-mm-dd', databanco)) +
          ' ) or (ITENS_CARTA.reprocessamento =' + QuotedStr(FormatDateTime('yyyy-mm-dd', databanco)) +'))'+
          ' and ITENS_CARTA.cod_carta = -1')
      else if vDadosIni.vEmp.vReprocessarCartaCobranca then
        montaSelect('select ITENS_CARTA.*,' +
          ' clientes.email,clientes.cidade from itens_carta ' +
          ' left join clientes ' +
          ' on ITENS_CARTA.cod_cliente=clientes.cod_cliente and ITENS_CARTA.'+vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'COD_EMPRESA')+'=clientes.cod_empresa ' +
          ' where ITENS_CARTA.cod_empresa = ' + vDadosIni.codEmpresa +
          vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
            ' and ITENS_CARTA.COD_EMP_MULT = ' + IntToStr(pCodigoUnificada), '') +
          ' and ((ITENS_CARTA.data =' + QuotedStr(FormatDateTime('yyyy-mm-dd', databanco)) +
          ' ) or (ITENS_CARTA.reprocessamento =' + QuotedStr(FormatDateTime('yyyy-mm-dd', databanco)) +'))'+
          ' and ITENS_CARTA.cod_carta = ' + IntToStr(FCodCarta))
      else  montaSelect('select ITENS_CARTA.*,' +
          ' clientes.email,clientes.cidade from itens_carta ' +
          ' left join clientes ' +
          ' on ITENS_CARTA.cod_cliente=clientes.cod_cliente and ITENS_CARTA.'+vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'COD_EMPRESA')+'=clientes.cod_empresa ' +
          ' where ITENS_CARTA.cod_empresa = ' + vDadosIni.codEmpresa +
          vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
            ' and ITENS_CARTA.COD_EMP_MULT = ' + IntToStr(pCodigoUnificada), '') +
          ' and ITENS_CARTA.data =' + QuotedStr(FormatDateTime('yyyy-mm-dd', databanco)) +
          ' and ITENS_CARTA.cod_carta = ' + IntToStr(FCodCarta));
      if vCont = 0 then
        Application.MessageBox(Pchar('Nenhuma carta foi gerada de acordo com os parâmentros informados!'), 'Informação', MB_OK + MB_ICONEXCLAMATION)
      else begin
        if (vContCarta>0) and (vContCartaR>0) then
          Application.MessageBox(Pchar(inttostr(vCont) + ' cartas foram geradas/reprocessadas com sucesso!'),
            'Informação', MB_OK + MB_ICONINFORMATION)
        else  if (vContCartaR>0) then
          Application.MessageBox(Pchar(inttostr(vCont) + ' cartas foram reprocessadas com sucesso!'),
            'Informação', MB_OK + MB_ICONINFORMATION)
        else  Application.MessageBox(Pchar(inttostr(vCont) + ' cartas foram geradas com sucesso!'),
            'Informação', MB_OK + MB_ICONINFORMATION);
      end;
    end
    else if not FPararProcessamento then
      Application.MessageBox(Pchar('Erro ao geras cartas de cobrança.' + chr(13) +
        'Nenhuma carta foi gerada de acordo com os parâmentros informados.'),
        'Informação', MB_OK + MB_ICONWARNING);
    FPararProcessamento:=false;
    pProgressBar.position := 0;
  except
    on e: Exception do
    begin
      Result := False;
      RollBackTransacao;
      pProgressBar.position := 0;
      FPararProcessamento:=false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;

end;

function TCartasCobranca._gravarOBSCREDSobreEmailEnviado(pCodCarta: integer): boolean;
var
//  vCodOBS : integer;
  vBuscas:TIBQuery;
begin
  result:=false;
  try
    vBuscas := TIBQuery.Create(nil);
    vBuscas.Database := Buscas.Database;
    vBuscas.Transaction := Buscas.Transaction;

    vBuscas.close;
    vBuscas.SQL.Text:= 'select icc.cod_itemcarta,icc.cod_cred,cc.cod_obs from itens_carta_cred icc '+
      ' inner join controle_creditos cc '+
      ' on icc.cod_cred=cc.cod_cred and icc.cod_empresa=cc.codigo_emp '+
      ' where cod_itemcarta='+inttostr(pCodCarta)+' and cod_empresa='+vDadosIni.codEmpresa+
      ' and ((solucionado=''N'')  or (solucionado is null))';
    vBuscas.Open;

    while not vBuscas.eof do
    begin
      if vBuscas.FieldByName('COD_OBS').AsInteger <> 0 then
      begin
        buscas.Close;
        buscas.SQL.Text := 'insert into observacao(COD_OBS, COD_EMPRESA,'+
        ' DATA_OBS,HORA_OBS,OBSERVACAO,COD_USUARIO,NITEM) '+
          ' Values('+inttostr(vBuscas.FieldByName('COD_OBS').AsInteger)+
          ' ,'+vDadosIni.codEmpresa+
          ' , :pDATA_OBS, :pHORA_OBS'+
          ' , '+QuotedStr('E-MAIL DE COBRANÇA REFERENTE AO ITEM DE CARTA COM O CODIGO '+inttostr(vBuscas.FieldByName('COD_ITEMCARTA').AsInteger)+' ENVIADO COM SUCESSO')+
          ' ,'+IntToStr(vDadosIni.vCodUsuario)+',1) ';
        buscas.ParamByName('pDATA_OBS').AsDate := date;
        buscas.ParamByName('pHORA_OBS').AsTime := time;
        buscas.Prepare;
        buscas.ExecSQL;
        result:= true;
      end;
      vBuscas.Next;
    end;
  finally
    vBuscas.Free;
    vBuscas:=nil;
  end;
end;

procedure TCartasCobranca._ItensCartasAfterScroll(DataSet: TDataSet);
begin
  if not FInibeItensCartasAfterScroll then
    obCredCartas.montaSelect('select itc.*,mc.descricao,'+
     ' case when coalesce(cc.status_c,'''')=''QUITADO'' '+
     ' then ''QUITADO'' else ''NÃO QUITADO'' end as status_c,'+
     ' cc.n_doc_c from itens_carta_cred itc inner join itens_carta ic '+
     ' on itc.cod_itemcarta=ic.codigo and itc.cod_empresa=ic.cod_empresa '+
     ' inner join controle_creditos cc '+
     ' on itc.cod_cred=cc.cod_cred and itc.cod_empresa=cc.codigo_emp '+
     ' inner join modcartas mc '+
     ' on ic.cod_carta=mc.cod_carta and ic.cod_empresa=mc.cod_empresa '+
     ' where ic.cod_empresa='+vDadosIni.codEmpresa +
     ' and itc.cod_itemcarta = '+ inttostr(dataSet.FieldByName('CODIGO').asinteger));
//  if queryCred.Active then
//    queryCred.Locate('NPED',DataSet.FieldByName('NPED').Asinteger,[]);
end;

function TCartasCobranca._listaCreditosCarta: boolean;
begin
  _ItensCartasAfterScroll(dataset);
end;

procedure TCartasCobranca._litaControles(var pCheckListBox: TCheckListBox;
  pSetarVariavel: boolean);
var
  i: integer;
begin
  FControlesSelec := '';
  if pSetarVariavel then
  begin
    for I := 0 to pCheckListBox.Items.Count - 1 do
      if pCheckListBox.Checked[i] then
      begin
        if FControlesSelec = '' then
          FControlesSelec := copy(pCheckListBox.Items[i], 1, pos('|', pCheckListBox.Items[i]) - 1)
        else
          FControlesSelec := FControlesSelec + ',' + copy(pCheckListBox.Items[i], 1, pos('|', pCheckListBox.Items[i]) - 1);
      end;
    FControlesSelec := trim(StringReplace(FControlesSelec,' ','',[]));
    exit;
  end;

  buscas.Close;
  buscas.SQL.Text := 'select ctrl.codigo_ctrl,ctrl.nome_ctrl from controles ctrl ' +
    ' where docs = ''S2'' ' +
    ' and ctrl.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and ctrl.ativo = 1 ' +
    ' order by ctrl.nome_ctrl';
  buscas.Open;
  pCheckListBox.Items.Clear;
  while not buscas.eof do
  begin
    pCheckListBox.Items.Add(vDadosIni.StrZero(buscas.FieldByName('codigo_ctrl').AsString,2) + ' | ' +
      trim(buscas.FieldByName('nome_ctrl').AsString));
    buscas.Next;
  end;
  buscas.Close;
end;

procedure TCartasCobranca._litaModelosCarta(var pCheckListBox: TCheckListBox; pSetarVariavel:
  boolean);
var
  i: integer;
begin
  FCartasSelec := '';
  FQtdCartasSelec:=0;
  if pSetarVariavel then
  begin
    for I := 0 to pCheckListBox.Items.Count - 1 do
      if pCheckListBox.Checked[i] then
      begin
        if FCartasSelec = '' then
        begin
          FCartasSelec := copy(pCheckListBox.Items[i], 1, pos('|', pCheckListBox.Items[i]) - 1);
          inc(FQtdCartasSelec);
        end
        else begin
          FCartasSelec := FCartasSelec + ',' + copy(pCheckListBox.Items[i], 1, pos('|', pCheckListBox.Items[i]) - 1);
          inc(FQtdCartasSelec);
        end;
      end;
    exit;
  end;

  buscas.Close;
  buscas.SQL.Text := 'select mc.cod_carta,mc.descricao from modcartas mc ' +
    ' where mc.cod_empresa=' + vDadosIni.codEmpresa +
    ' and mc.ativo=1 and mc.TIPO=''CAR'' order by mc.descricao asc';
  buscas.Open;
  pCheckListBox.Items.Clear;
  while not buscas.eof do
  begin
    pCheckListBox.Items.Add(buscas.FieldByName('COD_CARTA').AsString + ' | ' +
      buscas.FieldByName('DESCRICAO').AsString);
    buscas.Next;
  end;
  buscas.Close;
end;

function TCartasCobranca._LocalizarCidade: boolean;
begin
  result := true;
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CIDADES');
  if vDadosIni.vPesquisa <> '' then
  begin
    FCodCidade := strtoint(vDadosIni.vPesquisa);
    buscas.Close;
    buscas.Sql.text := 'select cid.nome_cidade from cidades cid where cid.cod_cidade ='+vDadosIni.vPesquisa;
    buscas.Open;
    FNomeCidade:= trim(buscas.fieldByName('nome_cidade').asstring);
  end
  else result:=false;
end;

procedure TCartasCobranca._marcaDesmarcaLinha;
begin
  if dataSet.IsEmpty then
    exit;
  dataSet.Edit;
  if dataSet.FieldByName('sel').AsString = 'S' then
    dataSet.FieldByName('sel').AsString := ''
  else
    dataSet.FieldByName('sel').AsString := 'S';
  dataSet.Post;
end;

procedure TCartasCobranca._marcaTodasAsLinhas;
begin
  try
    if not vDadosIni.PesqPros('CAR067', 'MARCAR', '', 'ITENS_CARTA', '', buscas, True) then
      exit;
    if IsEmpty then
      exit;
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');    
    FInibeItensCartasAfterScroll:=true;
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
        dataSet.Edit;
        dataSet.FieldByName('sel').AsString := 'S';
        dataSet.Post;
        dataSet.Next;
      end;
      FInibeItensCartasAfterScroll:=false;    
    finally
			dataSet.First;
      dataSet.EnableControls;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TCartasCobranca._retirarSolucao: boolean;
begin
  if not vDadosIni.PesqPros('CAR073', 'RETIRAR SOLUÇÃO', 'INICIANDO PROCESSO', 'ITENS_CARTA_CRED', obCredCartas.dataSet.FieldByName('COD_ITEMCARTA').AsString+'/'+obCredCartas.dataSet.FieldByName('COD_CRED').AsString, buscas, True) then
    exit;

  if obCredCartas.IsEmpty then
  begin
    inherited edit;
    dataSet.FieldByName('DT_SOLUCAO').AsVariant := null;
    inherited post;
    result := Apply;
    if result then
      Result:= CommitaTransacao;
    if result then
      vDadosIni.GravaAuditoria('CAR073', 'RETIRAR SOLUÇÃO',
        'SUCESSO' + obCredCartas.dataSet.FieldByName('COD_ITEMCARTA').AsString + '/' + obCredCartas.dataSet.FieldByName('COD_CRED').AsString,
        'ITENS_CARTA_CRED',
        obCredCartas.dataSet.FieldByName('COD_ITEMCARTA').AsString + '/' + obCredCartas.dataSet.FieldByName('COD_CRED').AsString,
        buscas)
    else
    	vDadosIni.GravaAuditoria('CAR073', 'RETIRAR SOLUÇÃO',
      	'FALHA' + obCredCartas.dataSet.FieldByName('COD_ITEMCARTA').AsString + '/' + obCredCartas.dataSet.FieldByName('COD_CRED').AsString,
        'ITENS_CARTA_CRED',
        obCredCartas.dataSet.FieldByName('COD_ITEMCARTA').AsString + '/' + obCredCartas.dataSet.FieldByName('COD_CRED').AsString,
        buscas);
    exit;
  end;

  if (obCredCartas.dataSet.FieldByName('SOLUCIONADO').AsString = 'S') or
   (not(obCredCartas.dataSet.FieldByName('DT_SOLUCAO_CRED').IsNull)) then
  begin
    obCredCartas.Edit;
    obCredCartas.dataSet.FieldByName('SOLUCIONADO').AsString:='N';
    obCredCartas.dataSet.FieldByName('DT_SOLUCAO_CRED').AsVariant:=null;
    result:= obCredCartas.Post;
    if result then
      result:= obCredCartas.Apply;
    if result then
      result := obCredCartas.CommitaTransacao;

    if result then
    begin
      vDadosIni.GravaAuditoria('CAR073', 'RETIRAR SOLUÇÃO ITEM DA CARTA',
      	'SUCESSO' + obCredCartas.dataSet.FieldByName('COD_ITEMCARTA').AsString + '/' + obCredCartas.dataSet.FieldByName('COD_CRED').AsString,
        'ITENS_CARTA_CRED',
        obCredCartas.dataSet.FieldByName('COD_ITEMCARTA').AsString + '/' + obCredCartas.dataSet.FieldByName('COD_CRED').AsString,
        buscas);
      try
      	obCredCartas.dataset.DisableControls;
        while not obCredCartas.dataset.Eof do
        begin
          obCredCartas.dataset.Next;
          if obCredCartas.dataset.FieldByName('SOLUCIONADO').AsString='S' then
            break;
        end;
      finally
        obCredCartas.dataset.EnableControls;
      end;
//      if not ExecutaComandosSql('select cod_itemcarta from itens_carta '+
//      ' where codigo='+inttostr(dataSet.FieldByName('CODIGO').AsInteger)+
//      ' and cod_empresa='+vDadosIni.codEmpresa+
//      ' and DT_SOLUCAO is not null))') then
//      begin
      if not dataSet.FieldByName('DT_SOLUCAO').IsNull then
      begin
        inherited edit;
        dataSet.FieldByName('DT_SOLUCAO').AsVariant := null;
        inherited post;
        result := Apply;
        if result then
          Result:= CommitaTransacao;
        if result then
        begin
          vDadosIni.GravaAuditoria('CAR073', 'RETIRAR SOLUÇÃO DA CARTA',
          	'SUCESSO' + dataSet.FieldByName('CODIGO').AsString,
            'ITENS_CARTA', dataSet.FieldByName('CODIGO').AsString, buscas);
//          Refresh;
        end
        else
        	vDadosIni.GravaAuditoria('CAR073', 'RETIRAR SOLUÇÃO DA CARTA',
          	'SUCESSO' + dataSet.FieldByName('CODIGO').AsString,
            'ITENS_CARTA', dataSet.FieldByName('CODIGO').AsString, buscas);
      end;
    end
    else
      vDadosIni.GravaAuditoria('CAR073', 'RETIRAR SOLUÇÃO ITEM DA CARTA',
      'FALHA' + obCredCartas.dataSet.FieldByName('COD_ITEMCARTA').AsString + '/' + obCredCartas.dataSet.FieldByName('COD_CRED').AsString,
      'ITENS_CARTA_CRED', obCredCartas.dataSet.FieldByName('COD_ITEMCARTA').AsString + '/' + obCredCartas.dataSet.FieldByName('COD_CRED').AsString, buscas);
  end 
  else 
  begin
  	try
    	obCredCartas.dataset.DisableControls;
      while not obCredCartas.dataSet.Eof do
      begin
        obCredCartas.dataset.Next;
        if obCredCartas.dataset.FieldByName('SOLUCIONADO').AsString='S' then
          break;
      end;
    finally
      obCredCartas.dataset.EnableControls;
    end;
  end;
end;

function TCartasCobranca._solucionar: boolean;
begin
  result:=false;
  if not vDadosIni.PesqPros('CAR072', 'SOLUCIONAR CARTA', 'INICIANDO PROCESSO', 'ITENS_CARTA_CRED', obCredCartas.dataSet.FieldByName('COD_ITEMCARTA').AsString+'/'+obCredCartas.dataSet.FieldByName('COD_CRED').AsString, buscas, True) then
    exit;

  if obCredCartas.IsEmpty then
  begin
    inherited edit;
    dataSet.FieldByName('DT_SOLUCAO').AsDateTime := StrToDate(frmCartasCobranca.MaskEdit4.Text);
    inherited post;
    result := Apply;
    if result then
      Result:= CommitaTransacao;
    if result then
      vDadosIni.GravaAuditoria('CAR072', 'SOLUCINAR CARTA',
      	'SUCESSO' + dataSet.FieldByName('CODIGO').AsString,
        'ITENS_CARTA', dataSet.FieldByName('CODIGO').AsString, buscas)
    else
    	vDadosIni.GravaAuditoria('CAR072', 'SOLUCIONA CARTA',
      	'FALHA' + dataSet.FieldByName('CODIGO').AsString,
        'ITENS_CARTA', dataSet.FieldByName('CODIGO').AsString, buscas);

    exit;
  end;

  if (obCredCartas.dataSet.FieldByName('SOLUCIONADO').AsString = 'N') or
   (obCredCartas.dataSet.FieldByName('DT_SOLUCAO_CRED').IsNull) then
  begin
    obCredCartas.Edit;
    obCredCartas.dataSet.FieldByName('SOLUCIONADO').AsString:='S';
    obCredCartas.dataSet.FieldByName('DT_SOLUCAO_CRED').AsDateTime := StrToDate(frmCartasCobranca.MaskEdit4.Text);
    result:= obCredCartas.Post;
    if result then
      result:= obCredCartas.Apply;
    if result then
      result := obCredCartas.CommitaTransacao;
    if result then
    begin
      vDadosIni.GravaAuditoria('CAR072', 'SOLUCINAR ITEM CARTA',
      	'SUCESSO' + obCredCartas.dataSet.FieldByName('COD_ITEMCARTA').AsString + '/' + obCredCartas.dataSet.FieldByName('COD_CRED').AsString,
        'ITENS_CARTA_CRED', obCredCartas.dataSet.FieldByName('COD_ITEMCARTA').AsString + '/' + obCredCartas.dataSet.FieldByName('COD_CRED').AsString, buscas);
      try
      	obCredCartas.dataset.DisableControls;
        while not obCredCartas.dataset.Eof do
        begin
          obCredCartas.dataset.Next;
          if obCredCartas.dataset.FieldByName('SOLUCIONADO').AsString='N' then
            break;
        end;
      finally
        obCredCartas.dataset.EnableControls;
      end;
    end
    else
    	vDadosIni.GravaAuditoria('CAR072', 'SOLUCINAR ITEM CARTA',
      	'FALHA' + obCredCartas.dataSet.FieldByName('COD_ITEMCARTA').AsString + '/' + obCredCartas.dataSet.FieldByName('COD_CRED').AsString,
        'ITENS_CARTA_CRED', obCredCartas.dataSet.FieldByName('COD_ITEMCARTA').AsString + '/' + obCredCartas.dataSet.FieldByName('COD_CRED').AsString, buscas);

    if not ExecutaComandosSql('select cod_itemcarta from itens_carta_cred '+
      ' where cod_itemcarta='+inttostr(dataSet.FieldByName('CODIGO').AsInteger)+
      ' and cod_empresa='+vDadosIni.codEmpresa+
      ' and (solucionado=''N'' or (solucionado is null))') then
    begin
      inherited edit;
      dataSet.FieldByName('DT_SOLUCAO').AsDateTime := StrToDate(frmCartasCobranca.MaskEdit4.Text);
      inherited post;
      result := Apply;
      if result then
        Result:= CommitaTransacao;
      if result then
      begin
        vDadosIni.GravaAuditoria('CAR072', 'SOLUCINAR CARTA',
        	'SUCESSO' + dataSet.FieldByName('CODIGO').AsString,
          'ITENS_CARTA', dataSet.FieldByName('CODIGO').AsString, buscas);
//        Refresh;
      end
      else
      	vDadosIni.GravaAuditoria('CAR072', 'SOLUCIONA CARTA',
        'FALHA' + dataSet.FieldByName('CODIGO').AsString,
        'ITENS_CARTA', dataSet.FieldByName('CODIGO').AsString, buscas);
    end;
  end 
  else 
  begin
  	try
    	obCredCartas.dataset.DisableControls;
      while not obCredCartas.dataset.Eof do
      begin
        obCredCartas.dataset.Next;
        if obCredCartas.dataset.FieldByName('SOLUCIONADO').AsString='N' then
          break;
      end;
    finally
      obCredCartas.dataset.EnableControls;
    end;
  end;
end;

function TCartasCobranca._solucionarCartas: boolean;
begin
  if not vDadosIni.PesqPros('CAR072', 'SOLUCIONAR', 'INICIANDO PROCESSO', 'ITENS_CARTA', '', buscas, True) then
    exit;

  try
    try
      result := true;
//      dataSet.Filtered := false;
//      dataSet.Filter := 'SEL=''S'' and STATUS_C=''QUITADO''';
//      dataSet.Filtered := true;

      First;
      if IsEmpty then
      begin
        Application.MessageBox('Nenhuma carta referente a crédito já QUITADO foi selecionada para dar uma solução', 'Informação',
          MB_OK + MB_ICONINFORMATION);
//        dataSet.Filtered := false;
        dataSet.CancelUpdates;
        Refresh;
        exit;
      end;

      //      vData := vDadosIni.getDataBanco(buscas);
      try
      	dataSet.DisableControls;
        while not dataSet.Eof do
        begin
          if not dataSet.FieldByName('DT_SOLUCAO').IsNull then
          begin
            if Application.MessageBox(Pchar('Carta de código '+dataSet.FieldByName('CODIGO').asstring+' já se encontra solucionada. Deseja retirar a solução?'), 'Confirmação', MB_YESNO + MB_DEFBUTTON1) = mrYes then
            begin
              dataSet.edit;
              dataSet.FieldByName('DT_SOLUCAO').AsVariant := null;
              dataSet.post;
              vDadosIni.GravaAuditoria('CAR072', 'SOLUCINANDO',
              	'RETIRANDO DATA SOLUÇÃO', 'ITENS_CARTA', dataSet.FieldByName('CODIGO').AsString, buscas);
            end;
          end
          else
          begin
            dataSet.edit;
            if dataSet.FieldByName('DATA_BAIXA').IsNull then
              dataSet.FieldByName('DT_SOLUCAO').AsDateTime := dataSet.FieldByName('DATQ_C').AsDateTime
            else
              dataSet.FieldByName('DT_SOLUCAO').AsDateTime := dataSet.FieldByName('DATA_BAIXA').AsDateTime;
            dataSet.post;
            vDadosIni.GravaAuditoria('CAR072', 'SOLUCINANDO',
            	'GRAVANDO DATA SOLUÇÃO', 'ITENS_CARTA', dataSet.FieldByName('CODIGO').AsString, buscas);
          end;
          dataSet.Next;
        end;
      finally
        dataSet.EnableControls;
      end;
      result := Apply;
      if Result then
        result := CommitaTransacao
      else
        RollBackTransacao;
      if Result then
        vDadosIni.GravaAuditoria('CAR072', 'SOLUCINAR', 'SUCESSO ', 'ITENS_CARTA', '', buscas)
      else
        vDadosIni.GravaAuditoria('CAR072', 'SOLUCINAR', 'FALHA ', 'ITENS_CARTA', '', buscas);
      Refresh;
    except
      on E: Exception do
      begin
        Application.MessageBox('Nenhuma carta foi solucionada. Ocorreu erro ao solucionar as cartas.', 'Informação de erro', MB_ICONEXCLAMATION + MB_OK);
        vDadosIni.GravaAuditoria('CAR072', 'SOLUCINAR', 'FALHA ', 'ITENS_CARTA', '', buscas);
        registraErro(E.Message);
      end;
    end;
  finally
    dataSet.Filtered := false;
  end;
end;


function TCartasCobranca._visualuzarCartas: boolean;
var
  //  textoCarta: TStringList;
  textoTemp: string;
  formatacaoIni: string;
//  vData: TDate;
begin
  if not vDadosIni.PesqPros('CAR071', 'EXPORTANDO', '', 'ITENS_CARTA', '', buscas, True) then
    exit;
  try
    try
      result := true;
      if dataSet.IsEmpty then
      begin
        Application.MessageBox('Não existe nenhuma carta para visualizar!', 'Informação', MB_OK + MB_ICONINFORMATION);
        Exit;
      end;
      if vDadosIni.vUnicoWord then
      begin
        FtextoCarta := TStringList.Create;
        //      textoCarta.parent := FrmCartaCobranca;
        //      textoCarta.Visible := false;
        //      textoCarta.Clear;
      end;

      dataSet.Filtered := false;
      dataSet.Filter := 'SEL=''S'' ';
      dataSet.Filtered := true;
      
      if IsEmpty then
      begin
        Application.MessageBox('Nenhuma carta foi selecionada para visualização', 'Informação',
          MB_OK + MB_ICONINFORMATION);
        dataSet.Filtered := false;
        dataSet.CancelUpdates;
        Refresh;
        exit;
      end;

//      vData := vDadosIni.getDataBanco(buscas);
			try
      	dataSet.DisableControls;
      	dataSet.First;
        while not dataSet.Eof do
        begin
          textoTemp := '';
          if vDadosIni.vUnicoWord then
          begin
            textoTemp :=
            	vDadosIni._TrocaTAGsDaCarta(
                cCartaCobranca,
                dataSet.FieldByName('COD_CARTA').AsInteger,
                dataSet.FieldByName('COD_CLIENTE').AsInteger,
                '',
                '',
                dataSet.FieldByName('DATA').AsDateTime,
                dataSet.FieldByName('DIAS_ATRASO_PED').AsInteger,
                dataSet.FieldByName('COD_CONTROLE').Asstring,
                vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, dataSet.FieldByName('cod_emp_mult').AsInteger, 0)
              );
            
            if FtextoCarta.Text = '' then
              formatacaoIni := copy(textoTemp, pos('}}', textoTemp) + 2, pos('\INI', textoTemp) - 1)
            else
              textoTemp := copy(textoTemp, pos('}}', textoTemp) + 2, length(textoTemp));
          end
          else
            vDadosIni.WriteToMSWord(
            	vDadosIni._TrocaTAGsDaCarta(
              	cCartaCobranca,
                dataSet.FieldByName('COD_CARTA').AsInteger,
                dataSet.FieldByName('COD_CLIENTE').AsInteger,
                '',
                '',
                dataSet.FieldByName('DATA').AsDateTime,
                dataSet.FieldByName('DIAS_ATRASO_PED').AsInteger,
                dataSet.FieldByName('COD_CONTROLE').Asstring,
                vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, dataSet.FieldByName('cod_emp_mult').AsInteger, 0)
              )
          	);
          
          vDadosIni.GravaAuditoria('CAR071', 'EXPORTADO', '', 'ITENS_CARTA', dataSet.FieldByName('CODIGO').AsString, buscas);

          dataSet.Next;
          if vDadosIni.vUnicoWord then
          begin
            if not dataSet.Eof then
            begin
              if FtextoCarta.Text = '' then
                FtextoCarta.Text := FtextoCarta.Text + copy(textoTemp, 1,
                  vDadosIni.pos_a_direita(textoTemp, '}') - 1)
              else
                FtextoCarta.Text := FtextoCarta.Text + ' \page ' + copy(textoTemp, 1,
                  vDadosIni.pos_a_direita(textoTemp, '}') - 1)
            end
            else
            begin
              if FtextoCarta.Text = '' then
                FtextoCarta.Text := FtextoCarta.Text + copy(textoTemp, 1,
                  vDadosIni.pos_a_direita(textoTemp, '}'))
              else
                FtextoCarta.Text := FtextoCarta.Text + ' \page ' + copy(textoTemp, 1,
                  vDadosIni.pos_a_direita(textoTemp, '}'))
            end;
          end;
          //      Next;
        end;
      finally
        dataSet.EnableControls;
      end;
      
      if vDadosIni.vUnicoWord then
      begin
        if copy(FtextoCarta.Text, length(FtextoCarta.Text), 1) <> '}' then
          FtextoCarta.Text := FtextoCarta.Text + '}';
        FtextoCarta.Text := copy(FtextoCarta.Text, 1, vDadosIni.pos_a_direita(FtextoCarta.Text, '}'));
        vDadosIni.WriteToMSWord(FtextoCarta.text);
        FtextoCarta.Free;
        FtextoCarta := nil;
      end;
    except
      on E: Exception do
      begin
        if Application.MessageBox(Pchar('Erro na visualização das cartas.' + chr(13) + 'Mostrar Erro?'),
          'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          Application.MessageBox(Pchar(E.Message), 'Informação', MB_ICONERROR + MB_OK);
        vDadosIni.registraErro(E.Message);
      end;
    end;
  finally
    dataSet.Filtered := false;
  end;

end;

{ TCreditosCartas }

constructor TCreditosCartas.create;
begin
  if dtmContasAReceber = nil then
    dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

  DataSet := TClientDataSet(dtmContasAReceber.cdsCredCartas);
  transacao := TIBTransaction(dtmContasAReceber.IBTransCartas);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmContasAReceber.qrCredCartas.Database;
  buscas.Transaction := transacao;
end;

destructor TCreditosCartas.destroy;
begin

  inherited;
end;

{ TObs_Cred }

constructor TObs_Cred.create;
begin
  if dtmContasAReceber = nil then
    dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

  DataSet := TClientDataSet(dtmContasAReceber.cdsObsCred);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);
end;

function TObs_Cred.insert: Boolean;
begin
  Result := False;
  if inherited insert then
  begin
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);
    dataSet.FieldByName('data_obs').AsDateTime := Date;
    dataSet.FieldByName('hora_obs').AsDateTime := Time;
    dataSet.FieldByName('cod_usuario').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('NITEM').AsInteger := dataSet.FieldByName('NITEM').AsInteger;
//    dataSet.FieldByName('NITEM').AsInteger := dataset.RecordCount;  //ao gravar é atribuído o máx nitem Pela trigger  OBSERVACAO_BI_DATAHORA
    Result := True;
  end;
end;

function TObs_Cred.post: Boolean;
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
        fCOD_OBS := Gencodigo('OBSERVACAO', dtmContasAReceber.SpIncCodigo, vDadosIni.codEmpresa);
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
      _selecionaObs(fCOD_OBS, fCodigoUnificada);

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

function TObs_Cred.verificarTabelaCodigo(var pCOD_OBS: Integer): boolean;
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
      registraErro('TObs_Cred.verificarTabelaCodigo. Erro: ' + e.Message);
      Application.MessageBox(pchar('Erro ao verificar observação tabela código: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

function TObs_Cred._selecionaObs(pCOD_OBS, pCodigoUnificada: Integer): Boolean;
begin
  Result := montaSelect('select o.*, c.nome_vendedor from observacao o' +
    ' left join colaborador c on c.cod_vendedor = o.cod_usuario and c.cod_empresa = o.cod_empresa' +
    ' where o.cod_obs = ' + IntToStr(pCOD_OBS) +
    ' and c.cod_empresa = ' +vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa) +
    ' order by o.data_obs, o.hora_obs');
  fCOD_OBS := pCOD_OBS;
  fCodigoUnificada := pCodigoUnificada;
end;

{ TPendenciasCartao }

function TPendenciasCartao.abrePendenciasCartao: Boolean;
begin
  Result := montaSelect('select * from PENDENCIAS_CARTAO' +
                        ' where cod_empresa = ' + vDadosIni.codEmpresa);

end;

constructor TPendenciasCartao.create;
begin
  if dtmContasAReceber = nil then
    dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

  DataSet := TClientDataSet(dtmContasAReceber.CdsPendencias_adm);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);
end;

{ TNotasRetornoMercadorias }

function TNotasRetornoMercadorias.abreFormNotasRetornoMercadorias: Boolean;
var
  formulario: TfrmPadrao;
begin
  if not vDadosIni.PesqPros('CAR083', 'VISUALIZAR', '', 'LISTA_RETORNADAS', '', buscas, True) then
    Exit;
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;

    formulario.Caption := 'Relação de Mercadorias em Notas que Retornaram que estão na lista para serem baixadas';

    frmCadContasAReceber.pnListaRetornos.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    formulario.BorderIcons := [biSystemMenu];

    result := (formulario.ShowModal = IDOK);

  finally
    frmCadContasAReceber.pnListaRetornos.Parent := frmCadContasAReceber.tsListaRetornos;
    formulario.Free;
    formulario := nil;
  end;
end;

function TNotasRetornoMercadorias.abreNotasMercadorias(pCodCliente, pCodCred,
  pCodigoUnificada: Integer): Boolean;
var
  vsql: string;
begin
  fCodCredito := pCodCred;
                                                                    //COD_CRED_RET_FIN is null and
  if vDadosIni.vEmp.vFinanceiroUnificado then
  begin
    if pCodigoUnificada > 0 then
      vsql := ' where nf.cod_empresa = ' + IntToStr(pCodigoUnificada) + ' and BX_RETORNO_FIN = ''S'''
    else
      vsql := ' where nf.cod_empresa in ' + vDadosIni.vEmp.vCodigoUnificadas + ' and BX_RETORNO_FIN = ''S''';
  end
  else
    vsql := ' where nf.cod_empresa = ' + vDadosIni.codEmpresa + ' and BX_RETORNO_FIN = ''S''';
  if pCodCliente > 0 then
    vsql := vsql + ' and nf.cod_cliente = ' + IntToStr(pCodCliente);

  Result := montaSelect('select nf.num_nf, nf.serie, nf.modelo_nf, nf.data_lanc, nfi.num_fab_prod, nfi.grupo_prod, nfi.cod_prod, nfi.descricao_item, nfi.quantidade, nfi.valor_unitario, nfi.valor_total,' +
    ' nfi.cod_nf, nfi.nitem, nfi.cod_cred_ret_fin, nfi.cod_empresa' +
    ' from notafiscal nf' +
    ' inner join notafiscal_item nfi on nfi.cod_nf = nf.cod_nf and nfi.cod_empresa = nf.cod_empresa' + vsql
//    ' inner join nat_op n on n.codigo_nop = nfi.codigo_nop and n.usa_bx_retorno_fin = ''S'''
    );
  dataSet.FieldByName('cod_empresa').Visible := vDadosIni.vEmp.vFinanceiroUnificado;
end;

constructor TNotasRetornoMercadorias.create;
begin
  if dtmContasAReceber = nil then
    dtmContasAReceber := TdtmContasAReceber.Create(dtmContasAReceber);

  DataSet := TClientDataSet(dtmContasAReceber.cdsNFRet);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);
end;

function TNotasRetornoMercadorias.marcarMercadoriaParaBaixa(pAutomaticamente: Boolean; pValorCred: Extended): Boolean;
var
  vValorTemp: Currency;
begin
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CAR087', 'MARCAR', '', 'LISTA_RETORNADAS', '', buscas, True) then
    Exit;

  try
    if pAutomaticamente then
    begin
      vValorTemp := pValorCred;

      try
      	dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
          if vDadosIni.StrToFloatFormat(vValorTemp, 2) >= vDadosIni.StrToFloatFormat(dataSet.FieldByName('valor_total').AsFloat,2) then
          begin
            buscas.Close;
            if fCodCredito = 0 then
              buscas.SQL.Text := 'update notafiscal_item set COD_CRED_RET_FIN = NULL'
            else
              buscas.SQL.Text := 'update notafiscal_item set COD_CRED_RET_FIN = ' + IntToStr(fCodCredito);

            buscas.SQL.Text := buscas.SQL.Text + ' where cod_nf = ' + IntToStr(dataSet.FieldByName('cod_nf').AsInteger) +
              ' and nitem = ' + IntToStr(dataSet.FieldByName('nitem').AsInteger) +
              ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);
            buscas.ExecSQL;

            vDadosIni.GravaAuditoria('CAR087', 'MARCAR',
            'COD CRED ' + IntToStr(fCodCredito) +
            ' NUM NF ' + IntToStr(dataSet.FieldByName('NUM_NF').AsInteger) +
            ' COD NF ' + IntToStr(dataSet.FieldByName('COD_NF').AsInteger) +
            ' NITEM ' + IntToStr(dataSet.FieldByName('NITEM').AsInteger) +
            ' GRUPO-CODIGO ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger) + '-' +
            Trim(dataSet.FieldByName('COD_PROD').AsString) +
            ' NUM FAB ' + Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString),'LISTA_RETORNADAS', '', buscas);

            vValorTemp := vValorTemp - dataSet.FieldByName('valor_total').AsFloat;

          end;
          dataSet.Next;
        end;
      finally
        dataSet.EnableControls;
      end;
    end
    else
    begin
      buscas.Close;
      if fCodCredito = 0 then
        buscas.SQL.Text := 'update notafiscal_item set COD_CRED_RET_FIN = NULL'
      else
        buscas.SQL.Text := 'update notafiscal_item set COD_CRED_RET_FIN = ' + IntToStr(fCodCredito);

      buscas.SQL.Text := buscas.SQL.Text + ' where cod_nf = ' + IntToStr(dataSet.FieldByName('cod_nf').AsInteger) +
        ' and nitem = ' + IntToStr(dataSet.FieldByName('nitem').AsInteger) +
        ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);
      buscas.ExecSQL;

      vDadosIni.GravaAuditoria('CAR087', 'MARCAR',
      'COD CRED ' + IntToStr(fCodCredito) +
      ' NUM NF ' + IntToStr(dataSet.FieldByName('NUM_NF').AsInteger) +
      ' COD NF ' + IntToStr(dataSet.FieldByName('COD_NF').AsInteger) +
      ' NITEM ' + IntToStr(dataSet.FieldByName('NITEM').AsInteger) +
      ' GRUPO-CODIGO ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger) + '-' +
      Trim(dataSet.FieldByName('COD_PROD').AsString) +
      ' NUM FAB ' + Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString),'LISTA_RETORNADAS', '', buscas);
    end;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    vDadosIni.GravaAuditoria('CAR087', 'MARCAR', 'SUCESSO', 'LISTA_RETORNADAS', '', buscas);

    Result := True;

    dataSet.Refresh;

  except
    on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      vDadosIni.GravaAuditoria('CAR087', 'MARCAR', 'FALHA', 'LISTA_RETORNADAS', '', buscas);
      Application.MessageBox(pchar('Erro ao remover mercadoria da lista. Erro: ' + E.Message), 'Atenção', 0 + 64);
      registraErro('function TNotasRetornoMercadorias.removerDaLista. Erro: ' + e.Message);
    end;
  end;
end;

function TNotasRetornoMercadorias.removerDaLista: Boolean;
begin
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('CAR084', 'EXCLUIR',
    'NUM NF ' + IntToStr(dataSet.FieldByName('NUM_NF').AsInteger) +
    ' COD NF ' + IntToStr(dataSet.FieldByName('COD_NF').AsInteger) +
    ' NITEM ' + IntToStr(dataSet.FieldByName('NITEM').AsInteger) +
    ' GRUPO-CODIGO ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger) + '-' +
    Trim(dataSet.FieldByName('COD_PROD').AsString) +
    ' NUM FAB ' + Trim(dataSet.FieldByName('NUM_FAB_PROD').AsString),'LISTA_RETORNADAS', '', buscas, True) then
    Exit;

  try

    buscas.Close;
    buscas.SQL.Text := 'update notafiscal_item set BX_RETORNO_FIN = ''N'', COD_CRED_RET_FIN = NULL' +
      ' where cod_nf = ' + IntToStr(dataSet.FieldByName('cod_nf').AsInteger) +
      ' and nitem = ' + IntToStr(dataSet.FieldByName('nitem').AsInteger) +
      ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    Result := True;

    dataSet.Refresh;

  except
    on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro ao remover mercadoria da lista. Erro: ' + E.Message), 'Atenção', 0 + 64);
      registraErro('function TNotasRetornoMercadorias.removerDaLista. Erro: ' + e.Message);
    end;
  end;
end;

{ TEmpresasUnificadas }

constructor TEmpresasUnificadas.create;
begin
  DataSet := TClientDataSet(dtmContasAReceber.cdsEmpresasUnificadas);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  Buscas := TIBQuery(dtmContasAReceber.qrBuscas);
end;

function TEmpresasUnificadas._abreTodosEmpresas: Boolean;
begin
 Result := montaSelect(' select cod_empresa, (identificacao_emp ||'' - ''|| cgc_emp) identificacao_emp from empresa ' +
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

{ TDocEletronicoNotEnvFinanc }

function TDocEletronicoNotEnvFinanc.abreDocEletronicoMensMobile(
  codmens: Integer; tipo: string): boolean;
begin
	Result := montaSelect(
  	' select doc_eletronico.seqid, doc_eletronico.doc, doc_eletronico.data from doc_eletronico ' +
    ' where doc_eletronico.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and doc_eletronico.id_doc = ' + QuotedStr(tipo + IntToStr(codmens)) +
    ' order by doc_eletronico.seqid desc ');
end;

constructor TDocEletronicoNotEnvFinanc.create;
begin
	dataSet := TClientDataSet(dtmContasAReceber.cdsDocEletronicoNot);
  transacao := TIBTransaction(dtmContasAReceber.transacao);
  buscas := TIBQuery(dtmContasAReceber.qrBuscas);
end;

end.

