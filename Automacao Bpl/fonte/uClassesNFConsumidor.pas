unit uClassesNFConsumidor;

interface

uses
  uDataSet_OOP, DB, DBClient, StdCtrls, IBQuery, Classes, uClassesMigRegistros, PedVendaOrc_Model,
  config_Sistema_class, uClassesNFConsumidor_ProdutoInput, hw_undconv_utils,
  ConfigGlobalNF_RTC, TributosDFePersistentHandler;

const
  strVerVazio = '';
  strVer310   = '3.10';
  strVer400   = '4.00';

  stsVazio           = '';
  stsAberta          = 'Aberta';
  stsFechada         = 'Fechada';
  stsFechando        = 'Fechando';
  stsCancelada       = 'Cancelada';
  stsACancelar       = 'A Cancelar';

  stsPedAberto       = '';
  stsPedFechada      = 'FECHADA';
  stsPedCancelado    = 'CANCELADO';

  sitVazio           = '';
  sitEnviando        = 'Enviando';
  sitEmProcessamento = 'Em Processamento';
  sitDuplicidade     = 'Duplicidade';
  sitAutorizada      = 'Autorizada';
  sitDenegada        = 'Denegada';
  sitCancelada       = 'Cancelada';
  sitInutilizada     = 'Inutilizada';
  sitRejeitada       = 'Rejeitada';
  sitAInutilizar     = 'A Inutilizar';
  sitEmEPEC          = 'Em EPEC';

  actAutorizar   = 'Autorizar';
  actCancelar    = 'Cancelar';
  actInutilizar  = 'Inutilizar';
  actImprimir    = 'Imprimir';
  actEnviarEmail = 'EnviarEmail';

type
  Tnfce_client_free                  = function: Longint; stdcall;
  Tnfce_client_retorna_ultimo_erro   = function : WideString; stdcall;
  Tnfce_client_autorizar             = function (ArrayNFCE: array of Integer; CodigoEmpresa: Longint; token, Adicional: WideString): Longint; stdcall;
  Tnfce_client_enviar                = function (CodigoNFCE, CodigoEmpresa: Longint; token, Adicional: WideString): Longint; stdcall;
  Tnfce_client_cancelar              = function (CodigoNFCE, CodigoEmpresa: Longint; token: WideString): Longint; stdcall;
  Tnfce_client_inutilizar            = function (CodigoNFCE, CodigoEmpresa: Longint; token: WideString): Longint; stdcall;
  Tnfce_client_enviar_email          = function (CodigoNFCE, CodigoEmpresa: Longint; token, Adicional: WideString; UsarServidor: Boolean): Longint; stdcall;
  Tnfce_client_enviar_email_lote     = function (ArrayNFCE: array of Integer; CodigoEmpresa: Longint; token, Email: WideString; UsarServidor: Boolean): Longint; stdcall;
  Tnfce_client_gerar_contingencia    = function (CodigoNFCE, CodigoEmpresa: Longint; token: WideString): Longint; stdcall;
  Tnfce_client_imprimir_danfe        = function (CodigoNFCE, CodigoEmpresa, TpImp: Longint; token, Adicional: WideString): Longint; stdcall;
  Tnfce_client_imprimir_inutilizacao = function (CodigoNFCE, CodigoEmpresa: Longint; token: WideString): Longint; stdcall;
  Tnfce_client_enviar_contingencias  = function (CodigoEmpresa: Longint; token: WideString): Longint; stdcall;
  Tnfce_cert_obterdadospfx           = function (FileName: WideString): WideString; stdcall;
  Tnfce_print_list                   = function : WideString; stdcall;
  Tnfce_abrir_gaveta                 = function (params: WideString): Longint; stdcall;
  Tdfe_dados_certificado             = function (cod_empresa: Longint; dbName, modelo: WideString; var Aerros: WideString): WideString; stdcall;

  Tformpag_pedvenda_gerarforma       = function  (ANumPed: Integer; ATipo: string): Double;
  Tformpag_pedvenda_detalhesforma    = procedure (ANumPed: Integer; ATipo: string);

  TEventProcedure = procedure of object;

  TOrigemNFCe = (onPedVenda, onAvulsa);
  TOperacaoNFCe = (opAutorizacao, opCancelamento, opInutilizacao);
  TLibSSLNFe = (sslCapicom, sslOpenSSL, sslWinCrypt);
  TStatusServ = (tsCancelamento, tsInutilizacao, tsAutorizacao, tsConsulta, tsStsatusServico);
  TStatusServs = set of TStatusServ;
  TSangSup = (ssSangria, ssSuprimento);
  TTipoDest = (tdNaoContribuinte, tdContribuinte);
      
  RLast_Cons = record
    Campo, Condicao, Conteudo, DataIni, DataFim, SqlAd: string;
  end;

  TNFConsumidor = class;
  TNFC_Emissor = class;
  TNFC_Transporta = class;
  TNFC_Produtos = class;
  TNFC_Servicos = class;
  TNFCe = class;
  TNFCe_Dest = class;
  TNFCe_Itens = class;
  TNFCe_Pagamentos = class;
  TNFCe_PagamentosForma = class;
  TNFCe_Config = class;

  RNFCe_Solicitacao_Contingencia = record
    Codigo   : Integer;
    Solicitar: Boolean;
    Mensagem : string;
  end;

  RNFCe_ValidacaoEmGeral = record
    Permitido: Boolean;
    Mensagem: string;
  end;

  RNFCe_Validacao = record
    Permitido: Boolean;
    Status   : string;
    Situacao : string;
    TpEmiss  : string;
  end;

  RNFCe_Processamento = record // variaveis usadas no formulario de emissao
    email: string;
    Acao: string;
    CodNFC, CodEmpresa, CountSelecao: Integer;
    EnviarEmail, ImpressaoResumida, ImpressoraNaoFiscal,
      ConsumidorSolicitaNaoImprimir: Boolean;
    ViaConsumidor, ViaEstabelecimento, ViaCancelamento, FormatoA4,
    AnexarPDF: Boolean;
    UsarServidor: Boolean;
    ArrayNFCE: array of Integer;
    RetornoDLL: Integer; 
  end;

  RNFCe_Regras = record
    PermitirNFCeContribuinteICMS, DescontoPadraoPorItem,
      PermitePrecoPromocao, InibirFormaDePagamento: Boolean;
    SequenciaDePreco: string;
    TimeOutContingencia: Smallint;
    ConverterEmContingencia: Boolean;
    RejeitarNcmNaoCadastradoNoIBPT: Boolean;
    RejeitarSemCestParaCSTs: string;
    QtdeParaAvisoNotasPendentes: Integer;
    QtdeDiasParaAvisoNotasPendentes: Integer;
    QtdeDiasACancelarNaoResolvidas: Integer;
    QtdeDiasEnviandoNaoResolvidas: Integer;
    ModoSimplificadoAtivo: Boolean;
    EmitirAposCompletarPagamentos: Boolean;
  end;

  RNFCe_Emissao_Padrao = record
    TipoDeImpressao, IndicadorDePresenca, ModalidadeDoFrete, NaturezaDeOperacao: string;
//    QtdeViasEmContingencia: Smallint;
    ImpressaoResumida, ImpressoraNaoFiscal, FormatoA4,
      ConsumidorSolicitaNaoImprimir, InibirImpressaoContingenciaQuandoConsumidorSolicitar: Boolean;
    ArquivoIniPosPrinterNaoFiscal, ArquivoIniImpressaoHWNFC: string;
  end;

  RNFCe_AgenteNaoFiscal = record
    AgenteId, ArquivoIniPosPrinterNaoFiscal, ArquivoIniImpressaoHWNFC: string;
  end;

  RNFCe_ISS = record
    PermitirServicos, UsarRetencaoDeISS: Boolean;
    IndicadorDaExigibilidade, IndicadorDeIncentivoFiscal: string;
  end;

  RNFCe_Item_Grades = record
    UsarDescricao1Ou2, CaracterSeparador: string;
  end;

  RNFCe_Item_Campos = record
    ValorUnitario, ValorTotal, DescontoPercentual,
    DescontoEmValor, ValorLiquido, UnidadeVenda: Boolean;
  end;

  RNFCe_Item = record
    DescricaoReduzida: Boolean;
    CasasDecimaisQtde: Integer;
    CasasDecimaisVlUnit: Integer;
    EansPrefixosInvalidos: string;
    Grades: RNFCe_Item_Grades;
    Campos: RNFCe_Item_Campos;
  end;

  RNFCe_Cartao = record
    HabCampoAdicional: Boolean;
    UsarPosTEFQuandoHabilitado: Boolean;
    TransacaoAvulsaDeVendaHabilitada: Boolean;
    TransacaoAvulsaDigitadaHabilitada: Boolean;
  end;

  RNFCe_Pedido = record
    SomarAcrecimoNoTotal: Boolean;
    SubtrairDescontoNoTotal : Boolean;
    AutorizarComPgtoAuto: Boolean;
    EmitirAuto: Boolean;
    ImprimirAuto: Boolean;
  end;

  RNFCe_Estoque = record
    Conferir: Boolean;
  end;

  RNFCe_FCP = record
    UsarFCPdoNCM    : Boolean;
    CalcularFCP     : Boolean;
    UsarFCPdoEstado : Boolean;
    UsarFCPdoProduto: Boolean;
    UsarFCPTribAdProd: Boolean;
  end;

  RNFCe_ICM = record
    CalcularICM_Efetivo: Boolean;
  end;

  RNFCe_Config = record
    tpemis: Smallint;
    UsarMensageriaAI: Boolean;
  end;

  RNFCe_MovOperador = record
    Ativo: Boolean;
  end;

  RNFCe_MovOperador_Valores = record
    Sangria: Double;
    Suprimento: Double;
    NFCe_Dinheiro: Double;
    NFCe_Outros: Double;
  end;

  RNFCe_NotasTecnicas = record
    //sinief_11_2025: TDateTime; // vedacao emissao nfce cnpj
  end;

  RNFCe = record
//    Regras_PermitirNFCeContribuinteICMS, Regras_DescontoPadraoPorItem,
//      Regras_PermitePrecoPromocao: Boolean;
//    Regras_SequenciaDePreco: string;
//    Regras_TimeOutContingencia: Smallint;
//    Padrao_TipoDeImpressao, Padrao_IndicadorDePresenca, Padrao_ModalidadeDoFrete,
//      Padrao_NaturezaDeOperacao: string;
//    ISS_PermitirServicos, ISS_UsarRetencaoDeISS: Boolean;
//    ISS_IndicadorDaExigibilidade, ISS_IndicadorDeIncentivoFiscal:string;
//    Item_DescricaoReduzida: Boolean;
//    Item_CasasDecimaisQtde: Integer;
//    Item_GR_UsarDescricao1Ou2, Item_GR_CaracterSeparador: string;
//    Item_Cam_ValorUnitario, Item_Cam_ValorTotal, Item_Cam_DescontoPercentual,
//      Item_Cam_DescontoEmValor, Item_Cam_ValorLiquido: Boolean;
//
//    Cartao_HabCampoAdicional: Boolean;
    Config: RNFCe_Config;
    Regras: RNFCe_Regras;
    Padrao: RNFCe_Emissao_Padrao;
    AgenteNF: RNFCe_AgenteNaoFiscal;
    ISS: RNFCe_ISS;
    Itens: RNFCe_Item;
    Cartao: RNFCe_Cartao;
    Pedido: RNFCe_Pedido;
    Estoque: RNFCe_Estoque;
    FCP: RNFCe_FCP;
    ICM: RNFCe_ICM;
    CodigoClientePadrao: Integer;
    ListSeqPreco: TStrings;
    ConsultaIBPT: Boolean;
    ConsultaOutrosEmissores: Boolean;
    MovimentoOperador: RNFCe_MovOperador;
    CstsIndefidos: TConfig_Sistema_class;
    NT: RNFCe_NotasTecnicas;
    Conf_RTC: TConfigGlobalNF_RTC;
    OpInternaPadrao: string;
  public
    function AgentValid: Boolean;
    function IsLocalAgent: Boolean;
    function GetAgentPrintParams(): string;
    function GetDefaultPrintParams(): string;
  end;

  TCfgNFCeCstsIndevidos = class(TConfig_Sistema_class)
  public
    function GetCstCorrelacionado(cst: string): string;
    function GetCsosnCorrelacionado(csosn: string): string;
  end;

  TCfgNFCeUtils = class
  private
    FCstsIndevidos: TCfgNFCeCstsIndevidos;
  public
//    constructor Create;
    destructor Destroy; override;

    property CstsIndevidos: TCfgNFCeCstsIndevidos read FCstsIndevidos write FCstsIndevidos;
  end;

  TNFCe_DLL = class
  private
    fHandleDLL: THandle;
    Fnfce_client_free                 : Tnfce_client_free;
    Fnfce_client_retorna_ultimo_erro: Tnfce_client_retorna_ultimo_erro;
    Fnfce_client_autorizar            : Tnfce_client_autorizar;
    Fnfce_client_enviar: Tnfce_client_enviar;
    Fnfce_client_cancelar: Tnfce_client_cancelar;
    Fnfce_client_inutilizar           : Tnfce_client_inutilizar;
    Fnfce_client_enviar_email: Tnfce_client_enviar_email;
    Fnfce_client_enviar_email_lote    : Tnfce_client_enviar_email_lote;
    Fnfce_client_gerar_contingencia   : Tnfce_client_gerar_contingencia;
    Fnfce_client_imprimir_inutilizacao: Tnfce_client_imprimir_inutilizacao;
    Fnfce_client_imprimir_danfe       : Tnfce_client_imprimir_danfe;
    Fnfce_client_enviar_contingencias: Tnfce_client_enviar_contingencias;
    Fnfce_cert_obterdadospfx          : Tnfce_cert_obterdadospfx;
    Fnfce_print_list                  : Tnfce_print_list;
    Fnfce_abrir_gaveta                : Tnfce_abrir_gaveta;
    Fdfe_dados_certificado            : Tdfe_dados_certificado;
  public
    constructor create;
    destructor Destroy; override;

    function LoadDLL: Boolean;
    procedure FreeDLL;

    property nfce_client_free                 : Tnfce_client_free                  read Fnfce_client_free                  write Fnfce_client_free;
    property nfce_client_retorna_ultimo_erro  : Tnfce_client_retorna_ultimo_erro   read Fnfce_client_retorna_ultimo_erro   write Fnfce_client_retorna_ultimo_erro;
    property nfce_client_autorizar            : Tnfce_client_autorizar             read Fnfce_client_autorizar             write Fnfce_client_autorizar;
    property nfce_client_enviar               : Tnfce_client_enviar                read Fnfce_client_enviar                write Fnfce_client_enviar;
    property nfce_client_cancelar             : Tnfce_client_cancelar              read Fnfce_client_cancelar              write Fnfce_client_cancelar;
    property nfce_client_inutilizar           : Tnfce_client_inutilizar            read Fnfce_client_inutilizar            write Fnfce_client_inutilizar;
    property nfce_client_enviar_email         : Tnfce_client_enviar_email          read Fnfce_client_enviar_email          write Fnfce_client_enviar_email;
    property nfce_client_enviar_email_lote    : Tnfce_client_enviar_email_lote     read Fnfce_client_enviar_email_lote     write Fnfce_client_enviar_email_lote;
    property nfce_client_gerar_contingencia   : Tnfce_client_gerar_contingencia    read Fnfce_client_gerar_contingencia    write Fnfce_client_gerar_contingencia;
    property nfce_client_imprimir_inutilizacao: Tnfce_client_imprimir_inutilizacao read Fnfce_client_imprimir_inutilizacao write Fnfce_client_imprimir_inutilizacao;
    property nfce_client_imprimir_danfe       : Tnfce_client_imprimir_danfe        read Fnfce_client_imprimir_danfe        write Fnfce_client_imprimir_danfe;
    property nfce_client_enviar_contingencias : Tnfce_client_enviar_contingencias  read Fnfce_client_enviar_contingencias  write Fnfce_client_enviar_contingencias;
    property nfce_cert_obterdadospfx          : Tnfce_cert_obterdadospfx           read Fnfce_cert_obterdadospfx           write Fnfce_cert_obterdadospfx;
    property nfce_print_list                  : Tnfce_print_list                   read Fnfce_print_list                   write Fnfce_print_list;
    property nfce_abrir_gaveta                : Tnfce_abrir_gaveta                 read Fnfce_abrir_gaveta                 write Fnfce_abrir_gaveta;
    property dfe_dados_certificado            : Tdfe_dados_certificado             read Fdfe_dados_certificado             write Fdfe_dados_certificado;
  end;

  TNFCe_Config = class(TDataSet_OOP)
  private
    procedure dataSetGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    function checkNumSerieCertificadoNFCe: Boolean;
  public
    destructor Destroy; override;
    constructor create;
    function post: boolean; override;
    procedure AbreRegistros;
    procedure AtivaDesativarContingencia;
    procedure ObterDadosPFX;
  end;

  TNFC_Clientes = class(TDataSet_OOP)
  public
    function Consultar(Opcao: Integer; Value: string): TNFC_Clientes;
  end;

  TNFC_Transporta = class(TDataSet_OOP)
  public
    constructor create;
    procedure SetTransportador(CodigoTransportador: Integer);
  end;

  TNFC_Produtos_Imagem = class
  private
    FOwner      : TNFC_Produtos;
    FFileName   : string;
    FFileNoImage: string;
    FFileLogo   : string;
    FDirPadrao  : string;
    function GetFileName: string;
  public
    constructor Create(AOwner:TNFC_Produtos);

    property FileName: string read GetFileName;
    property FileLogo: string read FFileLogo;
  end;

  TNFC_Produtos = class(TDataSet_OOP)
  private
    NFCeAOwer: TNFCe;
    Campos, InnerCodBarra, InnerGrade, InnerCFOP: string;
    FEstoqueDisponivel: Double;
    FEventoAfterScroll: TEventProcedure;
    FValorDeVenda: Double;
    FSequenciaPreco: string;
    FListRelCSOSNCST: TStrings;
    FImagemProd: TNFC_Produtos_Imagem;
    FUndVenda: TStrings;

    function GetUndVenda: TStrings;
    function GetSequenciaPreco: string;
    function GetValorDeVenda: Double;
    procedure SetValorDeVenda(const Value: Double);
    procedure SetEventoAfterScroll(const Value: TEventProcedure);
    function GetEstoqueDisponivel: Double;
    procedure SetEstoqueDisponivel(const Value: Double);
    procedure dataSetAfterScroll(DataSet: TDataSet);
  public
    constructor create(AOwer: TNFCe);
    destructor Destroy; override;

    function ValidaEAN(CodBar: string): Boolean;
    function getCSOSNPorCST(CST: string): string;
    function getCSTDevido(CST: string): string;
    function AjustaCSOSN(CSOSN: string): string;
    procedure buscaProduto(Pesquisa: string); overload;
    procedure buscaProduto(GrupoProd: Integer; CodProd: string; inativosTambem: Boolean = False); overload;

    property EstoqueDisponivel: Double read GetEstoqueDisponivel write SetEstoqueDisponivel;
    property EventoAfterScroll: TEventProcedure read FEventoAfterScroll write SetEventoAfterScroll;
    property ValorDeVenda: Double read GetValorDeVenda write SetValorDeVenda;
    property SequenciaPreco: string read GetSequenciaPreco;
    property ImagemProd: TNFC_Produtos_Imagem read FImagemProd;
    property UndVenda: TStrings read GetUndVenda write FUndVenda;

  end;

  TNFC_Servicos = class(TDataSet_OOP)
  private     
    NFCeAOwer: TNFCe;
    FCampos: string;
    FISSRetidoNoCliente: string;
  public
    constructor create(AOwer: TNFCe);
    procedure buscaServico(Pesquisa: string); overload;
    procedure buscaServico(CodServico: Integer); overload;
    procedure SetISSRetidoNoCliente;

    property ISSRetidoNoCliente: string read FISSRetidoNoCliente;
  end;

  TNFC_Emissor = class(TDataSet_OOP)
  private
    procedure dataSetEmissorGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    destructor Destroy; override;
    constructor create;
    function post: boolean; override;
    function delete: boolean; override;
    function insert: boolean; override;
    function edit: boolean; override;
    procedure DefinirIdentificador;
    procedure DefinirTipo(Client: Integer; ServidorProcessamento, ServidorImpressao: Boolean);
  end;

  TNFC_Base = class(TDataSet_OOP)
  private
    FConfigNFCe: RNFCe;
    FConfUtils: TCfgNFCeUtils;
  public
    procedure LerConfigNFCe; virtual;

    property ConfigNFCe: RNFCe         read FConfigNFCe write FConfigNFCe;
    property ConfUtils : TCfgNFCeUtils read FConfUtils  write FConfUtils;
  end;

  TNFConsumidor = class(TNFC_Base)
  private
    FEmissor: TNFC_Emissor;
    procedure SetEmissor(const Value: TNFC_Emissor);
  public
    property Emissor: TNFC_Emissor read FEmissor write SetEmissor;
  end;

  EspelhoValores = record
  private
    FDescontoPorIntem, FIgnorarTributosDFe: Boolean;
    FValorProdutos, FDesconto, FFrete, FSeguro, FOutros: Currency;
  public
    class function Create(
      DescontoPorIntem, IgnorarTributosDFe: Boolean;
      ValorProdutos, Desconto, Frete, Seguro, Outros: Currency
    ): EspelhoValores; static;

    // Testa difenca de valores, o que resulta no recalculo dos tributos
    function RecalcularIbsCbs(
      DescontoPorIntem, IgnorarTributosDFe: Boolean;
      ValorProdutos, Desconto, Frete, Seguro, Outros: Currency
    ): Boolean; overload;

    // Testa difenca de valores, o que resulta no recalculo dos tributos, exceto vprod
    function RecalcularIbsCbs(
      DescontoPorIntem, IgnorarTributosDFe: Boolean;
      Desconto, Frete, Seguro, Outros: Currency
    ): Boolean; overload;
  end;

  TNFCe = class(TNFConsumidor)
  private
    buscas1: TIBQuery;
    Orcamento: TPedVendaOrc_Model;
    FCampos: string;
    FCodNFCeMemorizada: Integer;
    FKeyBeforeEdit, FKeyBeforePost: string;
    FlkTipoImpressao: TDadosLookUp_OOP;
    FlkIndPresenca: TDadosLookUp_OOP;
    FlkModFrete: TDadosLookUp_OOP;
    FTransporta: TNFC_Transporta;
    FItens: TNFCe_Itens;
    FlkSeqPreco: TDadosLookUp_OOP;
    FPagamento: TNFCe_Pagamentos;
    FStatusChange: TEventProcedure;
    FlkVendedor: TDadosLookUp_OOP;
    FDest: TNFCe_Dest;
    FEmissaoRapida: Boolean;
    FConsultaCliente: TNFC_Clientes;
    FEspelho: EspelhoValores;
    FLastMessage: string;
    FLastMessageType: string;
    FLogMessage: TNotifyEvent;
    FLogRejeicao1: TNotifyEvent;
    FLastRejeicao: string;
    FLogRejeicao: TNotifyEvent;
    FObjetosInternosAusentes: Boolean;
    FEmEmissaoEx: Boolean;
    ProcessandoLote: Boolean;
    LastError: string;
    FhelperConv: TConversaoUnidadeUtils;
    FDadosCertificado: TStrings;
    FFieldsWithNotificationChange: TStrings;
    FFieldChangeEvnt: TFieldNotifyEvent;
    procedure SetFieldChangeEvnt(const Value: TFieldNotifyEvent);
    function GetDadosCertificado: TStrings;
    procedure SetLastError(const Value: string); overload;
    procedure SetLastError(const Value: string; const Args: array of const); overload;
    procedure SetLastRejeicao(const Value: string);
    function GetAudit_Codigo: string;
    function GetAudit_Dados: string;
    procedure dataSetNFCeGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure dataSetNFCeTransportaChange(Sender: TField);
    procedure dataSetNFCeChange(Sender: TField);
    procedure ClearProcessamento;
    procedure RecalcularTributosRTC(ForcarRecalculo: Boolean);
    procedure SomarTotaisTributosRTC();
    procedure CertificarPreenchimentoCamposCorretamente();

    function ValidarFecharNFC: Boolean;
    function CancelamentoVerificar(CodNFCe: Integer): Boolean;

    function ProcessarNFCe(Acao: string; var TempoLimiteAtingido, ServidorRecebeu: Boolean): Boolean;
    function AutorizarNFCe(UsuarioSolicitaContingencia: Boolean = False): Integer;//retorno o numero da NFCe autorizada, caso tpmis = 9 contingencia entao retorna o numero da nfc gerada
    function CancelarNFCe: Boolean;
    function InutilizarNFCe: Boolean;
    function ImprimirNFCe: Boolean;

    function MovimentaEstoqueExecutar(APedVenda: TReg_PedVenda; ABaixa: Boolean): Boolean; //ABaixa = False corresponde Volta estoque
    function PedVenda_GetFromPedVenda(ANPed: Integer; ATipo: string): TReg_PedVenda;
    function PedVenda_GetFromNFCe(ACodNFC: Integer): TReg_PedVenda;
    function PedVenda_PermiteCancelameto(APedVenda: TReg_PedVenda): Boolean;
    function PedVenda_CancelarPagamentos(APedVenda: TReg_PedVenda): Boolean;
  public
    destructor Destroy; override;
    constructor create;
    function post: boolean; override;
    function delete: boolean; override;
    function insert: boolean; override;
    function edit: boolean; override;
    function SetCodigoInterno: Boolean;
    function SetStatusFechando: Boolean;//?
    function SetStatusAberta: Boolean;//?
    function SalvarECalcular(RefazerRateiosETotais: Boolean; ForcarRecalculo: Boolean = False): Boolean;
    function HouveAlteracao: Boolean;
    function PermiteAlteracaoItens: Boolean;
    function PermiteAlteracaoPagamento: Boolean;
    function PermiteEmissao(var Astatus: string; var Asituacao: string): Boolean;
    function ValidacaoQualquerAlteracao: RNFCe_Validacao;
    function Emitir(UsuarioSolicitaContingencia: Boolean = False): Boolean;
    function EmitirRejeitadas(): Integer;
    function EmitirArray(ArrayNFCe: ArrayInts; enviarContingencias: Boolean): Integer;
    function CriarComplementar: Boolean;
    function CancelarInutilizarLote(): Integer;
    function Cancelar(Inutilizacao: Boolean = False): Boolean;
    function Imprimir(): Boolean;
    function EnviarEmail: Boolean;
    function Inutilizar: Boolean;
    function ContingenciaVerificar: Boolean;
    function ContingenciaVisualizar: Boolean;
    function PendenciasVerificar: RNFCe_ValidacaoEmGeral;
    procedure RegisterNotificationToField(const FieldName: string);
    procedure UnRegisterNotificationToField(const FieldName: string);

    function PedVenda_VerificarVinculo(ACommit: Boolean = False; AGerarPagto: Boolean = False): Boolean; overload;
    function PedVenda_VerificarVinculo(ACodNFC: Integer; ACommit: Boolean = False; AGerarPagto: Boolean = False): Boolean; overload;
    function PedVenda_SetNFCeFromPedVenda(APedVenda: TReg_PedVenda): Boolean;

    procedure ImprimirTransacaoCartao;
    procedure MemorizarRegistro;
    procedure LocateRegistroMemorizado;
    procedure AbreRegistros(Codigo: Integer; ChildTo: Boolean = False);
    procedure AtualizarValorTotalLiquido; // apenas atualizar na visualizacao do usuario
    procedure LerConfigNFCe; override;
    procedure SetDataEmissao(var Data, Hora: string);
    procedure SetNaturezaDeOperacao;
    procedure SetCliente(LocalizarCliente: Boolean; var ClienteConsumidor: Boolean);
    procedure SetTransportador(LocalizarTransporta: Boolean);
    procedure SetSeqPreco(IncPosition: Integer = 1; Value: string = '');
    procedure SetDescontoNoCabecalho(Value: Boolean);
    procedure AtualizarInformacoesFiscaisItens(Silent: Boolean = False);
    procedure ReabrirNFC;
    procedure AtualizarInfFrete(AModFreteOld: string);
    procedure VisualizaXML(AOperacao: TOperacaoNFCe);
    procedure SetLastMessage(Msg: string; Error: Boolean = True);
    procedure GetDatasApi;
    function SetArrayOfcod_nfce(): Integer;
    function Orcamento_getOrcamento(Aped: Integer; var ATextOut: string): Boolean;
    function ValidacaoObjetosInternos(): RNFCe_ValidacaoEmGeral;
    function ObterImpressoraPadrao: string;
    function ConfigurarImpressoraPadrao(Impressora: string): Boolean;
    procedure MontarDadosAdicionaisInteresseFisco;

    function GetXML(AOperacao: TOperacaoNFCe): string;
    property Transporta     : TNFC_Transporta  read FTransporta      write FTransporta;
    property Itens          : TNFCe_Itens      read FItens           write FItens;
    property Dest           : TNFCe_Dest       read FDest            write FDest;
    property Pagamento      : TNFCe_Pagamentos read FPagamento       write FPagamento;
    property lkTipoImpressao: TDadosLookUp_OOP read FlkTipoImpressao write FlkTipoImpressao;
    property lkIndPresenca  : TDadosLookUp_OOP read FlkIndPresenca   write FlkIndPresenca;
    property lkModFrete     : TDadosLookUp_OOP read FlkModFrete      write FlkModFrete;
    property lkSeqPreco     : TDadosLookUp_OOP read FlkSeqPreco      write FlkSeqPreco;
    property lkVendedor     : TDadosLookUp_OOP read FlkVendedor      write FlkVendedor;
    property StatusChange   : TEventProcedure  read FStatusChange    write FStatusChange;
    property FieldChangeEvnt: TFieldNotifyEvent read FFieldChangeEvnt write SetFieldChangeEvnt;
    property Audit_Codigo   : string           read GetAudit_Codigo;
    property Audit_Dados    : string           read GetAudit_Dados;
    property EmissaoRapida  : Boolean          read FEmissaoRapida   write FEmissaoRapida;
    property LastMessage    : string           read FLastMessage     write FLastMessage;
    property LastMessageType: string           read FLastMessageType write FLastMessageType;
    property LastRejeicao   : string           read FLastRejeicao    write SetLastRejeicao;
    property ConsultaCliente: TNFC_Clientes    read FConsultaCliente write FConsultaCliente;
    property OnLogMessage   : TNotifyEvent     read FLogMessage      write FLogMessage;
    property OnLogRejeicao  : TNotifyEvent     read FLogRejeicao     write FLogRejeicao;
    property EmEmissaoEx    : Boolean          read FEmEmissaoEx     write FEmEmissaoEx;
    property helperConv     : TConversaoUnidadeUtils     read FhelperConv       write FhelperConv;
    property DadosCertificado: TStrings        read GetDadosCertificado write FDadosCertificado;
    //property PedVenda_PermiteCanceçar
  var
    Processamento: RNFCe_Processamento;
    LastCons: RLast_Cons;
    SoliticacaoContingencia: RNFCe_Solicitacao_Contingencia;
  end;
  
  TNFCe_Dest = class(TNFConsumidor)
  private
    NFCeAOwer: TNFCe;
    FCampos: string;
    FlkCidades: TDadosLookUp_OOP;
  public
    destructor Destroy; override;
    constructor create(AOwer: TNFCe);

    function insert: boolean; override;
    function post: boolean; override;
    function delete: boolean; override;

    procedure AbreRegistros;

    function ConsultaCEP(Cep: string): TDataSet_OOP;

    property lkCidades: TDadosLookUp_OOP read FlkCidades write FlkCidades;
  end;

  TNFCe_Itens = class(TNFConsumidor)
  private
    NFCeAOwer: TNFCe;
    FCampos: string;
    FProd: TNFC_Produtos;
    FServ: TNFC_Servicos;
    FChange: TNotifyEvent;
    FUndVenda: TStrings;
    FTributos: ITributosPersistentHandler;
    function GetUndVenda: TStrings;
    function GetAudit_Codigo: string;
    function GetAudit_Dados: string;
    procedure SetProd(const Value: TNFC_Produtos);
    procedure SetServ(const Value: TNFC_Servicos);
    procedure AtualizarTotaisNFCe(Subtrair: Boolean = False);
    procedure SetTributosRTC();
    procedure SetValorAproximadosDosTributos();
    procedure SetDadosFiscaisProduto();
    procedure SetDadosFiscaisServico;
    procedure dataSetNFCeItemGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure CalcFieldsDataSet(DataSet: TDataSet);
    procedure AtualizarInfFrete;
  public
    destructor Destroy; override;
    constructor create(AOwer: TNFCe);

    function delete: boolean; override;
    function insert: boolean; override;
    function leituraEAN13_balanca(Pesquisa: string; var RecordCount: Integer): string;
    function buscaProduto(LocalizarProduto: Boolean; Pesquisa: string; var RecordCount: Integer): Boolean;
    function buscaServico(LocalizarServico: Boolean; Pesquisa: string; var RecordCount: Integer): Boolean;
    function SetProduto(input: TSetProdutoInput): Boolean; overload;
    function SetServico(Alteracao: Boolean; Codigo, Descricao: string; Qtde, ValorUn, ValorTot, Desconto: Double): Boolean;
    procedure AtualizarDadosFiscais();

    procedure AbreRegistros;
    procedure AtualizarInfRetencao(ISSRetido: string);
//    function

    property Prod: TNFC_Produtos read FProd write SetProd;
    property Serv: TNFC_Servicos read FServ write SetServ;
    // UndVenda somente na edição
    property UndVenda: TStrings read GetUndVenda write FUndVenda;
    property Audit_Codigo: string read GetAudit_Codigo;
    property Audit_Dados: string read GetAudit_Dados;

    property OnChange: TNotifyEvent read FChange write FChange;
  end;

  TNFCe_PagamentosForma = class(TDataSet_OOP)
  private
    procedure CalcFields(DataSet: TDataSet);
  public
    constructor create;
    procedure AbreRegistros(ModoSimplificado: Boolean = False);
    function IsTEF: Boolean;
  end;

  TNFCe_TransacaoCartao = class
  private
    FValorPago: Double;
    FNumAut: string;
    FNsuAdm: string;
    FBandeiraId: Integer;
    FTransacaoId: Integer;
    FCNPJ: string;
    FEfetuada: Boolean;
    FOperacao: string;
    FCarteiraId: string;
    FPspId: string;
    FControleId: Integer;
  public
    property Efetuada: Boolean read FEfetuada write FEfetuada;
    property ValorPago: Double read FValorPago write FValorPago;
    property NumAut: string read FNumAut write FNumAut;
    property NsuAdm: string read FNsuAdm write FNsuAdm;
    property BandeiraId: Integer read FBandeiraId write FBandeiraId;
    property TransacaoId: Integer read FTransacaoId write FTransacaoId;
    property CNPJ: string read FCNPJ write FCNPJ;
    property Operacao: string read FOperacao write FOperacao;
    property CarteiraId: string read FCarteiraId write FCarteiraId;
    property PspId: string read FPspId write FPspId;
    property ControleId: Integer read FControleId write FControleId; 
  end;

  TNFCe_Pagamentos = class(TNFConsumidor)
  strict private
    Secao: Integer;
    function TransacaoCartaoExecutar(Valor: Double): TNFCe_TransacaoCartao;
    procedure TransacaoCartaoVerificarRegistros;
  private
    NFCeAOwer: TNFCe;
    FlkTipoPagamento: TDadosLookUp_OOP;
    FlkBandeira: TDadosLookUp_OOP;
    FTipoPagamento: TNFCe_PagamentosForma;
    FValorTotal: Double;
    FPagamentoChange: TEventProcedure;
    function GetValorTroco: Double;
    function GetPagamentoConcluido: Boolean;
    function GetAudit_Codigo: string;
    function GetAudit_Dados: string;
    procedure SetPagamentoChange(const Value: TEventProcedure);
    procedure SetValorTotal(const Value: Double);
    procedure SetTipoPagamento(const Value: TNFCe_PagamentosForma);
    procedure SetlkBandeira(const Value: TDadosLookUp_OOP);
    procedure SetlkTipoPagamento(const Value: TDadosLookUp_OOP);
    procedure dataSetPagamentosGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure dataSetPagamentoAfterRefresh(DataSet: TDataSet);
  public
    destructor Destroy; override;
    constructor create(AOwer: TNFCe);
    function delete: Boolean; override;
    function SetPagamento(Alteracao: Boolean; Controle, Bandeira: Variant; TipoPag: Integer; Valor: Double; NumAutorizacao, IndPag: string): Boolean;

    procedure AbreRegistros;

    property lkTipoPagamento: TDadosLookUp_OOP read FlkTipoPagamento write SetlkTipoPagamento;
    property lkBandeira: TDadosLookUp_OOP read FlkBandeira write SetlkBandeira;
    property TipoPagamento: TNFCe_PagamentosForma read FTipoPagamento write SetTipoPagamento;
    property ValorTotal: Double read FValorTotal write SetValorTotal;
    property ValorTroco        : Double                read GetValorTroco;
    property PagamentoConcluido: Boolean               read GetPagamentoConcluido;
    property PagamentoChange: TEventProcedure read FPagamentoChange write SetPagamentoChange;
    property Audit_Codigo: string read GetAudit_Codigo;
    property Audit_Dados: string read GetAudit_Dados;
  end;

  TNFCe_Status_Servico = class(TDataSet_OOP)
  private
    Limit: Integer;
    FPage: Integer;
    procedure dataSetAfterOpen(DataSet: TDataSet);
    procedure dataSetGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    //destructor Destroy; override;
    constructor Create;

    function AbreRegistros(Args: TStatusServs; Apage: Integer): TNFCe_Status_Servico;

    property Page: Integer read FPage;

  end;

  TNFCe_SangSup = class(TNFC_Base)
  public
    constructor Create;
    function Inserir(Valor: Double; Operacao: TSangSup; var Msg: string): Boolean;
  end;

  TNFCe_MovimentoOperador = class(TDataSet_OOP)
  private
    FLastMessage      : string;
    FPlanoConsulta    : string;
    FCod_nfce_liberada: Integer;
    Limit             : Integer;
    FPage             : Integer;
    FonGetDiaMovimento: TNotifyEvent;
    function GetDiaEstaAberto: Boolean;
    function ClientMeiosPag: TDataSet_OOP;
    function ClientContadores: TDataSet_OOP;
  public
    constructor Create;

    function GetDiaAtualDoEmissor: TNFCe_MovimentoOperador;
    function GetDiaDoEmissor(Id: Integer): TNFCe_MovimentoOperador; overload;
    function GetDiaDoEmissor(Operador, Caixa, APage: Integer): TNFCe_MovimentoOperador; overload;
    function AbrirDia: Boolean;
    function FecharDia(Id: Integer; CheckOperador: Boolean = True): Boolean;
    function PermiteEmissao(id_movimento: Integer): Boolean;

    function TotaisDoDia: RNFCe_MovOperador_Valores;

    function RelatorioDoDia_PrintNaoFiscal: Boolean;
    function RelatorioDoDia_PrintQuickRep: Boolean;

    property LastMessage      : string       read FLastMessage       write FLastMessage;
    property DiaEstaAberto    : Boolean      read GetDiaEstaAberto;
    property Cod_nfce_liberada: Integer      read FCod_nfce_liberada write FCod_nfce_liberada;
    property Page             : Integer      read FPage;
    property OnGetDiaMovimento: TNotifyEvent read FonGetDiaMovimento write FonGetDiaMovimento;
  end;

  TNFCe_VendasSemEmit = class(TDataSet_OOP)
  private
    FDia      : TDateTime;
    FItens    : TDataSet_OOP;
    //FDayInc   : Integer;
    FTipoDest : TTipoDest;
    FDiaChange: TNotifyEvent;
    procedure ShowItens;
    procedure DataSetAfterScroll(DataSet: TDataSet);
  public
    constructor Create;
    destructor Destroy; override;

    function ShowDay(DayInc: Integer = 0): TNFCe_VendasSemEmit;

    property Dia        : TDateTime    read FDia       write FDia;
    property Itens      : TDataSet_OOP read FItens     write FItens;
    //property DayInc     : Integer      read FDayInc    write FDayInc;
    property TipoDest   : TTipoDest    read FTipoDest  write FTipoDest;
    property OnDiaChange: TNotifyEvent read FDiaChange write FDiaChange;
  end;

  TNFCe_VendaDiaria = class(TDataSet_OOP)
  private
    FDia      : TDateTime;
    FDiaChange: TNotifyEvent;
  public
    constructor Create;

    function ShowDay(DayInc: Integer = 0): TNFCe_VendaDiaria;

    function GetValorJaRecebidoEmCartao: Double;

    property Dia        : TDateTime    read FDia       write FDia;
    property OnDiaChange: TNotifyEvent read FDiaChange write FDiaChange;

  end;

var
  Emissor: TNFC_Emissor;
  NFCe: TNFCe;
  VendasSemEmit: TNFCe_VendasSemEmit;
  VendaDiaria: TNFCe_VendaDiaria;
  ConfNFCe: TNFCe_Config;
  DLLNFC: TNFCe_DLL;
  SangSup: TNFCe_SangSup;
  MovOperador: TNFCe_MovimentoOperador;

implementation

uses uDtmNFConsumidor, uDtmAtivo, IBDatabase, Forms, Windows, SysUtils,
  uCadNFC_Emissor, uCadNFCe, Variants, uDadosIni, IBCustomDataSet,
  Dialogs, DateUtils, uNFCeConfig, Controls, uNFCeDadosEmissao, StrUtils, Math,
  uClassesMig, uCadPadraoModal, leitura_balanca_peso, hw_utils,
  hw_naofiscal_utils, MaskUtils, uCadNFCe_RelMovOperador, gs1prefix, hw_win_utils,
  transacao_cartao_class, nfce_pagamento_class, hw_auditoria_class, Contnrs, Query_OOP,
  UnidadeVenda_Model, hw_strings, PedVendaProd_Model, PedVendaProdUndVenda_Model,
  nfc_class, nfc_item_class, basefb_class, nfc_pagamento_class, Types_OOP,
  ContainerUnit, TributoDFeOrigemEnumUnit, TributoDFeContextEtdUnit, TipoComunsUnit,
  RegraFiscalIbsCbsEtdUnit, ResolverRegraFiscalIbsCbsTypesUnit, StringServiceUnit,
  ImpostoSeletivoInputUnit, CalcularBaseCalculoModelUnit, TributacaoRegularInputUnit,
  ItemCalculoInputUnit, CalcularTributoInputUnit, EstadosServiceUnit, ROCDomainUnit,
  TributosDFeServiceTypes, TributosDFeSerivceUnit,
  StringNullableUnit, TipoRegraTributoDFeEnumUnit,
  IRegistrarAjusteRedBenefPcUseCaseUnit, LegacyDFeDLLAdapterUnit,
  hw_sped_inf_compl, sped_inf_compl, DFeTypesUnit, CriadorCompraGovernamentalUtilsUnit,
  uEnviarMensagem;

type
  TributoDFeOrquestradorInput = record
  private                 
    OpInternaId: string;
    TributoDFeId: string;
    GrupoFiscalId: string;
    NCMouNBS, Unidade: string;
    DhFatoGerador: TDateTime;
    CMunFBIbs, nItem: Integer;
    ValorLiquido, Acrescimos, Frete, ICMS, ISS, PIS, COFINS: Currency;
    Quantidade: Double;
  public
    class function Create(
      OpInternaId: string;
      TributoDFeId: string;
      GrupoFiscalId: string;
      NCMouNBS, Unidade: string;
      DhFatoGerador: TDateTime;
      CMunFBIbs, nItem: Integer;
      ValorLiquido, Acrescimos, Frete, ICMS, ISS, PIS, COFINS: Currency;
      Quantidade: Double
    ): TributoDFeOrquestradorInput; static;
  end;

  TributoDFeOrquestrador = class
  public
    class function Create(const Input: TributoDFeOrquestradorInput): TributoDFeContextEtd; static;
  end;

function hw_ibpt_produtos_get( Banco, Usuario, Senha: WideString; CodEmpresa: Integer;
  cnpj, ncm, uf: WideString; ex: Integer): Integer; stdcall; external 'hw.utils.dx.dll';
function hw_cep_consultar(banco, cep: WideString): Boolean; stdcall; external 'hw.utils.dx.dll';
function hw_utils_lasterror(): Widestring; stdcall; external 'hw.utils.dx.dll';
function HwPosPrintFromText(Text, ConfName: WideString; QtdeVias: Integer): Integer; stdcall; external 'HWPosPrinter.dll';
function HwPosUltimoErro: WideString; stdcall; external 'HWPosPrinter.dll';
procedure cloud_get_pedidos(paramsList: WideString); stdcall; external 'hw.utils.dx.dll';
procedure cloud_get_orcamento(paramsList: WideString); stdcall; external 'hw.utils.dx.dll';
function cloud_agente_last_error: WideString; stdcall; external 'hw.utils.dx.dll';
function cloud_agente_print_nfce(xmlAut, xmlCan, params: WideString): Boolean; stdcall; external 'hw.utils.dx.dll';
function cloud_agente_open_drawer(params: WideString): Boolean; stdcall; external 'hw.utils.dx.dll';
function cloud_agente_print_text(text: WideString; params: WideString): Boolean; stdcall; external 'hw.utils.dx.dll';

//Chamada para abrir o formulario de cadastro de emissores

procedure nfc_abreformEmissor(TipoForm: Integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Emissor Nota Fiscal Consumidor...');
    if dtmNFConsumidor = nil then
      dtmNFConsumidor := TdtmNFConsumidor.Create(dtmNFConsumidor);

    if Emissor = nil then
      Emissor := TNFC_Emissor.create;

    if not vDadosIni.PesqPros('NFC001', 'CONSULTA', '', 'NFC_EMISSOR', '',
      nil, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    vDadosIni.vTipoForm := TipoForm;

    if frmCadNFC_Emissor = nil then
    begin
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadNFC_Emissor, frmCadNFC_Emissor);
    end;

    if (TipoForm > 0) and (not frmCadNFC_Emissor.Visible) then
      frmCadNFC_Emissor.ShowModal
    else if (not frmCadNFC_Emissor.Visible) then
      frmCadNFC_Emissor.Show
    else if frmCadNFC_Emissor.FormStyle = fsMDIChild then
      frmCadNFC_Emissor.Show
    else
      frmCadNFC_Emissor.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure nfc_abreformNFCe(TipoForm: Integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo cadastro de NFCe...');
    if dtmNFConsumidor = nil then
      dtmNFConsumidor := TdtmNFConsumidor.Create(dtmNFConsumidor);

    if NFCe = nil then
      NFCe := TNFCe.create;

    if not vDadosIni.PesqPros('NFC007', 'CONSULTA', '', 'NFCE', '',
      nil, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    vDadosIni.vTipoForm := TipoForm;

    if frmCadNFCe = nil then
    begin
      vDadosIni.vModalOuChild := IfThen(TipoForm > 0, 'M', 'C');
      Application.CreateForm(TfrmCadNFCe, frmCadNFCe);
    end;

    if (TipoForm > 0) and (not frmCadNFCe.Visible) then
      frmCadNFCe.ShowModal
    else if (not frmCadNFCe.Visible) then
      frmCadNFCe.Show
    else if frmCadNFCe.FormStyle = fsMDIChild then
      frmCadNFCe.Show
    else
      frmCadNFCe.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure nfc_abreformNFCe_v2(Amodal: Boolean);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo NFCe...', True);
    if dtmNFConsumidor = nil then
      dtmNFConsumidor := TdtmNFConsumidor.Create(dtmNFConsumidor);

    if NFCe = nil then
      NFCe := TNFCe.create;
    NFCe.EmissaoRapida := True;

    if not vDadosIni.PesqPros('NFC007', 'CONSULTA', '', 'NFCE', '',
      nil, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    vDadosIni.vTipoForm := IfThen(Amodal, 1, 0);

    if frmCadNFCe = nil then
    begin
      if Amodal then
        vDadosIni.vModalOuChild := 'M';
      Application.CreateForm(TfrmCadNFCe, frmCadNFCe);
    end;

    if (Amodal) and (not frmCadNFCe.Visible) then
      frmCadNFCe.ShowModal
    else if (not frmCadNFCe.Visible) then
      frmCadNFCe.Show
    else if frmCadNFCe.FormStyle = fsMDIChild then
      frmCadNFCe.Show
    else
      frmCadNFCe.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure nfc_abreformConfigNFCe;
begin     
  vDadosIni.abreStatusProcessamento('','Abrindo Configuração da NFCe...');
  if dtmNFConsumidor = nil then
    dtmNFConsumidor := TdtmNFConsumidor.Create(dtmNFConsumidor);

  if ConfNFCe = nil then
    ConfNFCe := TNFCe_Config.create;

//  if not vDadosIni.PesqPros('NFC007', 'CONSULTA', '', 'NFCE', '',
//    nil, False) then
//  begin
//    vDadosIni.fechaStatusProcessamento;
//    Exit;
//  end;

  Application.CreateForm(TfrmNFCeConfig, frmNFCeConfig);
  ConfNFCe.AbreRegistros;
  frmNFCeConfig.ShowModal;
end;

procedure nfc_abreformNFCSat(TipoForm: Integer);
begin

end;

procedure nfce_definirEmissor;
var
  AssignedEmissor: Boolean;
  GenCodigo: Integer;
  Str, Sql: string;
  Aconf: TConfig_sistema_class;
begin
//  if vDadosIni.vNFConsumidor.UsLogin = vDadosIni.vCodUsuario then
//    if Trim(vDadosIni.vNFConsumidor.token) <> '' then
//      Exit;
  if vDadosIni.vNFConsumidor.UsLogin <> vDadosIni.vCodUsuario then
  begin
    vDadosIni.vNFConsumidor.UsLogin := 0;
    vDadosIni.vNFConsumidor.token := '';
    vDadosIni.vNFConsumidor.CodEmissor := 0;
  end;
  vDadosIni.vNFConsumidor.NFCeOffline := noNone;

  AssignedEmissor := False;
  if Assigned(Emissor) then
    AssignedEmissor := True
  else
    Emissor := TNFC_Emissor.create;
  try
    try
      case IndexText(Emissor.SqlScalar('select DADOS_OFFLINE from EMPDESVOLV where COD_EMPDES = 1').AsString,
         ['C', 'S']) of
        0 :
          vDadosIni.vNFConsumidor.NFCeOffline := noClient;
        1 :
          vDadosIni.vNFConsumidor.NFCeOffline := noServer;
        else                                              
          vDadosIni.vNFConsumidor.NFCeOffline := noNone;
      end;

      Emissor.buscas.Close;
      Emissor.buscas.SQL.Text := 'select COD_EMISSOR, TIPO, IDENTIFICADOR, TOKEN from NFC_EMISSOR' +
        ' where IDENTIFICADOR = ' + QuotedStr(Copy(vDadosIni.retornaSerialHd, 1, 8) + vDadosIni.StrZero(vDadosIni.vCodUsuario, 4)) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and CLIENT_OR_SERVER = ''C''';
      Emissor.buscas.Open;
      if Emissor.buscas.IsEmpty then
      begin
        Emissor.buscas.Close;
        Emissor.buscas.SQL.Text := 'select COD_EMISSOR, TIPO, IDENTIFICADOR, TOKEN from NFC_EMISSOR' +
          ' where IDENTIFICADOR = ' + QuotedStr(Copy(vDadosIni.retornaSerialHd, 1, 8) + vDadosIni.StrZero(9999, 4)) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa +
          ' and CLIENT_OR_SERVER = ''C''';
        Emissor.buscas.Open;
      end;
      Sql := 'select cod_emissor, identificador, token,' +
             ' coalesce(client_or_server,''C'') client_or_server,' +
             ' coalesce(server_autorizacao,''N'') server_autorizacao,' +
             ' coalesce(server_impressao,''N'') server_impressao,' +
             ' coalesce(server_email,''N'') server_email' +
             ' from nfc_emissor' +
             ' where identificador = %s and cod_empresa = %d' +
             ' and coalesce(client_or_server,''C'') = ''C''';
      Str := QuotedStr(Copy(vDadosIni.retornaSerialHd, 1, 8) + PadL(vDadosIni.vCodUsuario, 4));
      if Emissor.SqlOpen(Sql, [Str, vDadosIni.cod_empresa]).IsEmpty then
      begin
        Str := QuotedStr(Copy(vDadosIni.retornaSerialHd, 1, 8) + PadL(9999, 4));
        Emissor.SqlOpen(Sql, [Str, vDadosIni.cod_empresa]);
      end;      

      if Emissor.buscas.IsEmpty then
        vDadosIni.vNFConsumidor.token := ''
      {else if (Pos('|1|', Emissor.buscas.FieldByName('tipo').AsString) = 0) and
              (Pos('|5|', Emissor.buscas.FieldByName('tipo').AsString) = 0) and
              (Pos('|6|', Emissor.buscas.FieldByName('tipo').AsString) = 0) then
        vDadosIni.vNFConsumidor.token := ''}
      else
      begin
        vDadosIni.vNFConsumidor.CodEmissor := Emissor.buscas.FieldByName('cod_emissor').AsInteger;
        vDadosIni.vNFConsumidor.UsLogin := vDadosIni.vCodUsuario;
        vDadosIni.vNFConsumidor.token      := Trim(Copy(Emissor.buscas.FieldByName('identificador').AsString, 1, 12));
        vDadosIni.vNFConsumidor.UsaServidorAutorizacao := Emissor.buscas.FieldByName('server_autorizacao').AsString = 'S';
        vDadosIni.vNFConsumidor.UsaServidorImpressao   := Emissor.buscas.FieldByName('server_impressao').AsString = 'S';
        vDadosIni.vNFConsumidor.UsaServidorEmail       := Emissor.buscas.FieldByName('server_email').AsString = 'S';
        {vDadosIni.vNFConsumidor.StandAlone := (Pos('|5|', Emissor.buscas.FieldByName('tipo').AsString) > 0) or
                                              (Pos('|6|', Emissor.buscas.FieldByName('tipo').AsString) > 0);}
        //vDadosIni.vNFConsumidor.UseThread  := (Pos('|5|', Emissor.buscas.FieldByName('tipo').AsString) > 0);

        if vDadosIni.vNFConsumidor.UsaServidorAutorizacao then
        begin
          if Trim(Emissor.buscas.FieldByName('token').AsString) = '' then
          begin
            vDadosIni.vNFConsumidor.token := vDadosIni.vNFConsumidor.token + '0000';
            Emissor.buscas.Close;
            Emissor.buscas.SQL.Text := 'update NFC_EMISSOR set token = ' + QuotedStr(Copy(vDadosIni.vNFConsumidor.token, 1, 16)) +
              ' where cod_emissor = ' + IntToStr(vDadosIni.vNFConsumidor.CodEmissor) +
              ' and cod_empresa = ' + vDadosIni.codEmpresa;
            Emissor.buscas.ExecSQL;
            if Emissor.buscas.Transaction.InTransaction then
              Emissor.buscas.Transaction.Commit;
          end
          else
            vDadosIni.vNFConsumidor.token := Trim(Emissor.buscas.FieldByName('token').AsString);

          vDadosIni.PosVirtualGetConfsPrintNaoFiscal(Emissor.buscas);

          Exit;
        end
        else
        //if not vDadosIni.vNFConsumidor.UsaServidorAutorizacao then
        begin
          Aconf := TConfig_sistema_class.getConf('nfc_nfce_config_emissor_geral', Emissor.buscas, vDadosIni.cod_empresa);
          try
            vDadosIni.vNFConsumidor.UsarSessaoUsuario := Aconf.ReadString('Token', 'UsarSessaoUsuario', 'N') = 'S';
            vDadosIni.vNFConsumidor.SegundosCheckNotasPendentes :=
              StrToIntDef(Aconf.ReadString('ServiceLess', 'TempoEmSegundosVerificarNotasPendentes', '60'), 60);
          finally
            FreeAndNil(Aconf);
          end;

          vDadosIni.CreateProcessSimple(ExtractFilePath(Application.ExeName) +
                                        'HWNFCServiceLess.exe ' +
                                        'LESS ' +
                                        vDadosIni.codEmpresa + ' ' +
                                        IntToStr(vDadosIni.vNFConsumidor.CodEmissor) + ' ' +
                                        IntToStr(vDadosIni.vNFConsumidor.SegundosCheckNotasPendentes));
        end;

        if vDadosIni.vNFConsumidor.UsarSessaoUsuario then
        begin

          GenCodigo := Emissor.Gencodigo('NFC_EMISSOR_TK', Emissor.buscas, vDadosIni.codEmpresa);
          if GenCodigo > 9999 then
          begin
            Emissor.buscas.Close;
            Emissor.buscas.SQL.Text := 'update codigo set valor = 1' +
              ' where tabela = ''NFC_EMISSOR_TK'' and cod_empresa = ' + vDadosIni.codEmpresa;
            Emissor.buscas.ExecSQL;
            GenCodigo := 1;
          end;
          vDadosIni.vNFConsumidor.token := Copy(vDadosIni.vNFConsumidor.token + vDadosIni.StrZero(GenCodigo, 4), 1, 16);
          Emissor.buscas.Close;
          Emissor.buscas.SQL.Text := 'update NFC_EMISSOR set token = ' + QuotedStr(Copy(vDadosIni.vNFConsumidor.token, 1, 16)) +
            ' where cod_emissor = ' + IntToStr(vDadosIni.vNFConsumidor.CodEmissor) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa;
          Emissor.buscas.ExecSQL;
          if Emissor.buscas.Transaction.InTransaction then
            Emissor.buscas.Transaction.Commit;

        end
        else
        begin
          Emissor.SqlExec('update NFC_EMISSOR set token = ''%s'' where cod_emissor = %d and cod_empresa = %d',
                          [vDadosIni.vNFConsumidor.token, vDadosIni.vNFConsumidor.CodEmissor, vDadosIni.cod_empresa]);
          if Emissor.buscas.Transaction.InTransaction then
            Emissor.buscas.Transaction.Commit;
        end;

        vDadosIni.PosVirtualGetConfsPrintNaoFiscal(Emissor.buscas);

      end;
    except on E: Exception do
      begin
        vDadosIni.registraErro('uCLassesNFConsumidor.nfce_definirEmissor. Erro: ' + E.Message);
      end;
    end;
  finally
    if AssignedEmissor then
      FreeAndNil(Emissor);
  end;
end;

function nfce_emitir_from_pedvenda(ANPed: Integer; ATipo: string): Boolean;
var
  APedVenda: TReg_PedVenda;
  ACodNFCe, ANumNFCe: Integer;
  ARescueNFCe, ARescueForm: Boolean;
  ARescueConfNFCe, ANewConfNFCe: RNFCe;
  AStatus, ASituacao: string;
begin

  {$REGION 'Verificando estado do fomulario e objeto NFCe se instanciados'}

  if Assigned(NFCe) then
    ARescueNFCe := True
  else
  begin
    ARescueNFCe := False;
    NFCe := TNFCe.create;
  end;
  if Assigned(frmCadNFCe) then
  begin
    ARescueForm := True;
    frmCadNFCe.Form_Memoriza;
  end
  else
  begin
    ARescueForm := False;
    Application.CreateForm(TfrmCadNFCe, frmCadNFCe);
  end;

  if NFCe.HouveAlteracao then
    NFCe.SalvarECalcular(True);

  {$ENDREGION}

  try

    {$REGION 'Localizando NFCe e validando se pode prosseguir com a emissão'}

    ACodNFCe := NFCe.SqlOpen('select cod_nfce from nfce' +
      ' where ped_destino_num = ' + IntToStr(ANPed) +
      ' and ped_destino_tip = ' + QuotedStr(ATipo) +
      ' and cod_empresa = ' + vDadosIni.CodEmpresa  +
      ' and ativo = 1').FieldByName('cod_nfce').AsInteger;
    if ACodNFCe = 0 then
      ACodNFCe := NFCe.SqlOpen('select cod_nfce from nfce' +
        ' where ped_origem_num = ' + IntToStr(ANPed) +
        ' and ped_origem_tip = ' + QuotedStr(ATipo) +
        ' and cod_empresa = ' + vDadosIni.CodEmpresa +
        ' and ativo = 1').FieldByName('cod_nfce').AsInteger;

    NFCe.AbreRegistros(ACodNFCe);
    NFCe.EmEmissaoEx := True;

    AStatus      := Trim(NFCe.dataSet.FieldByName('status').AsString);
    ASituacao    := Trim(NFCe.dataSet.FieldByName('situacao_nfce').AsString);
    ANumNFCe     :=      NFCe.dataSet.FieldByName('num_nf').AsInteger;

    //Testes da situação da NFC-e

    //Documentos com número impossíveis de emitir mais
    if (AStatus = stsCancelada) or (vDadosIni.strIn( ASituacao, [sitDenegada, sitCancelada, sitInutilizada])) then
    begin
      NFCe.PedVenda_VerificarVinculo(ACodNFCe, True);
      vDadosIni.ShowAtencao('Encontrada NFC-e ' + sLineBreak + NFCe.Audit_Dados + sLineBreak + sLineBreak + 'O Sistema vai tentar liberar o Pedido, repita o processo');
      Exit;
    end;

    //Documentos com números marcados pelo sistema que não podem mais ser utilizados
    if (AStatus = stsFechada) and (vDadosIni.strIn( ASituacao, [sitAInutilizar])) then
    begin
      vDadosIni.ShowAtencao('Encontrada NFC-e ' + sLineBreak + NFCe.Audit_Dados + sLineBreak + sLineBreak + 'Favor verificar no modulo da NFC-e e proceder com o processo');
      Exit;
    end;

    //Documentos prontos ou em processo de emissão, aqui a tela pode ser aberta
    if (vDadosIni.strIn( ASituacao, [sitAutorizada, sitEnviando, sitEmProcessamento])) then
    begin
      //Chama o formulario pa o usuário efetuar as opções
      NFCe.Edit;
      with frmCadNFCe do
      begin
        Form_PreparaTela;
        vDadosIni.abreForm('Emissão da NFC-e', PanelLeft, opFormsDefCad);
        Form_PreparaTela_Voltar;
        Exit;
      end;
    end
    //Documento fechado com Situação não prevista acima, nao pode deixar prosseguir
    else if (AStatus = stsFechada) and (not vDadosIni.strIn(ASituacao, [sitVazio, sitRejeitada])) then
    begin
      vDadosIni.ShowAtencao('Encontrada NFC-e ' + sLineBreak + NFCe.Audit_Dados + sLineBreak + sLineBreak + 'Favor verificar no modulo da NFC-e e proceder com o processo');
      Exit;
    end;

    if NFCe.ConfigNFCe.MovimentoOperador.Ativo then
      if not MovOperador.PermiteEmissao(NFCe.fint('mov_id')) then
      begin
        ShowErro('NFCe não pode ser emitida' + sLineBreak + sLineBreak + MovOperador.LastMessage);
        Exit;
      end;

    if NFCe.dataSet.FieldByName('cod_nfce').AsInteger = 0 then
      with NFCe.PendenciasVerificar do
        if not Permitido then
        begin
          ShowAtencao(Mensagem, MB_ICONEXCLAMATION);
          Exit;
        end;

    {$ENDREGION}

    {$REGION 'Montando a NFCe a partir do Pedido e prosseguindo com a emissão'}

    if NFCe.dataSet.FieldByName('cod_nfce').AsInteger > 0 then
    begin
      NFCe.SqlExec('delete from nfce_item' +
        ' where cod_nfce = ' + IntToStr(ACodNFCe) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa);

      NFCe.SqlExec('delete from nfce_pagamento' +
        ' where cod_nfce = ' + IntToStr(ACodNFCe) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa);

      NFCe.SqlExec('delete from nfce_dest' +
        ' where cod_nfce = ' + IntToStr(ACodNFCe) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa);

      NFCe.SqlExec('update nfce set status = %s where cod_nfce = %d and cod_empresa = %d',
        [QuotedStr(stsAberta), ACodNFCe, vDadosIni.cod_empresa]);

      APedVenda := NFCe.PedVenda_GetFromPedVenda(ANPed, ATipo);
      NFCe.Refresh;
      NFCe.Edit;
    end
    else
    begin
      APedVenda := NFCe.PedVenda_GetFromPedVenda(ANPed, ATipo);
      NFCe.Insert;
      NFCe.dataSet.FieldByName('ped_origem_num').AsInteger := ANPed;
      NFCe.dataSet.FieldByName('ped_origem_tip').AsString := ATipo;

      if not NFCe.SetCodigoInterno then
        raise Exception.Create('Item não pode ser incluído por problemas ao gerar código interno da NFC-e: TNFCe_Itens.SetProduto');
    end;
    {
    if (Length(Trim(APedVenda.Cliente.cpfcnpj)) = 14)
      and (Date >= NFCe.ConfigNFCe.NT.sinief_11_2025)
    then
      raise Exception.Create('Cliente informado possui CNPJ. Emissão de NFC-e vedada de acordo Ajuste SINIEF Nº 11, 2025');
    }
    try
      ARescueConfNFCe := NFCe.ConfigNFCe;
      ANewConfNFCe    := NFCe.ConfigNFCe;
      ANewConfNFCe.Estoque.Conferir := True;
      ANewConfNFCe.Regras.EmitirAposCompletarPagamentos := NFCe.ConfigNFCe.Pedido.AutorizarComPgtoAuto;
      NFCe.ConfigNFCe := ANewConfNFCe;

      if NFCe.PedVenda_SetNFCeFromPedVenda(APedVenda) then
        with frmCadNFCe do
        begin
          Form_PreparaTela;
          vDadosIni.abreForm('Emissão da NFC-e', PanelLeft, opFormsDefCad);
          Form_PreparaTela_Voltar;
        end;
    finally
      NFCe.ConfigNFCe := ARescueConfNFCe;
    end;

    {$ENDREGION}

  finally

    {$REGION 'Voltando estado do formulário'}
    NFCe.EmEmissaoEx := False;

    if not ARescueNFCe then
      if Assigned(NFCe) then
        FreeAndNil(NFCe);

    if ARescueForm  then
      frmCadNFCe.Form_Memoriza_Voltar
    else
      if Assigned(frmCadNFCe) then
        FreeAndNil(frmCadNFCe);
    {$ENDREGION}

  end;
end;

procedure nfce_liberar_dll;
begin
  if DLLNFC <> nil then
    FreeAndNil(DLLNFC);
end;


exports
  nfc_abreformEmissor,
  nfc_abreformNFCe,
  nfc_abreformNFCe_v2,
  nfc_abreformNFCSat,
  nfc_abreformConfigNFCe,
  nfce_definirEmissor,
  nfce_emitir_from_pedvenda,
  nfce_liberar_dll;

{ TributoDFeOrquestrador }

class function TributoDFeOrquestrador.Create(
  const Input: TributoDFeOrquestradorInput
): TributoDFeContextEtd;
var
  regraFiscal  : RegraFiscalIbsCbsEtd;
  rfTribRegular: RegraFiscalIbsCbsEtd;
  rocResult    : ROCDomain;
  calcInput    : ItemCalculoInput;
  itensInput   : ItensCalculoInput;
  impSelInput  : ImpostoSeletivoInput;
  tribRegInput : TributacaoRegularInput;

  bcImpSeletivo, bcCbsIbs     : Currency;
  grupoFiscalId, regraFiscalId: string;
  I: Integer;
  erros: TArrayString;
begin
  Result := nil;
  regraFiscalId := '';

  // 1: Encontrando a regra fiscal
  with Container.GetInstance().ErpFeaturesFactory.CreateResolverRegraFiscalIbsCbsUseCase() do
  try
    regraFiscal := Executar(
      ResolverRegraFiscalIbsCbsInput.Create(
        Input.OpInternaId,
        Input.GrupoFiscalId,
        vDadosIni.cod_empresa, Input.DhFatoGerador
      )
    );
  finally
    FreeSafe();
  end;

  if regraFiscal = nil then
    raise Exception.Create('Regra fiscal do IBS e CBS não encontrada');

  // 2: Criando inputs e Calculando Base de calculo ImpostoSeletivo, CBS e IBS
  rocResult := nil;
  try
    // Falta implentar como configura o Imposto Seletivo, é pra 2027 ainda
    if True then 
    begin
      impSelInput := ImpostoSeletivoInput.NullInstance();
      bcImpSeletivo := 0;
    end
    else
    begin      
      bcImpSeletivo := Container.GetInstance().FiscalCalculosFactory.CreateCalcularBCImpostoSeletivoUseCase()
        .Executar(
            BaseCalculoISMercadoriasModel.Create(
              {AnoFatoGerador} YearOf(Input.DhFatoGerador),
              {ValorBem} Input.ValorLiquido,
              {AjusteAcrescimos} Input.Acrescimos,
              {Juros} 0,
              {Multas} 0,
              {Encargos} 0,
              {FreteCobrado} Input.Frete,
              {OutrosTributos} 0,
              {DemaisImportancias} 0,
              {ICMS}   Input.ICMS,
              {ISS}    Input.ISS,
              {IPI} 0,
              {DescontoIncondicional} 0,
              {Bonificacao} 0,
              {DevolucaoVendas} 0
          ));
      
      impSelInput := ImpostoSeletivoInput.Create( 
        {Cst} '', 
        {CClassTrib} '', 
        {BaseCalculo} bcImpSeletivo, 
        {Quantidade} 0, 
        {Unidade} '' ,
        {ImpostoInformado} 0  // É necessario verificar se esse valor Digitado ou é calculado ou ret
      );
    end;

    rfTribRegular := nil;
    if not regraFiscal.RegraFiscalTribRegularId.IsNull then
      with Container.GetInstance().ErpFeaturesFactory.CreateObterRegraFiscalIbsCbsPorIdUseCase() do
      try
        rfTribRegular := Executar( regraFiscal.RegraFiscalTribRegularId.Value );
      finally
        FreeSafe();
      end;

    if rfTribRegular = nil then
      tribRegInput := TributacaoRegularInput.NullInstance()
    else
    begin
      try
        tribRegInput := TributacaoRegularInput.Create(
          Copy(rfTribRegular.CClassTrib, 1, 3),
          rfTribRegular.CClassTrib
        );
      finally
        rfTribRegular.Free();
      end;
    end;

    bcCbsIbs := Container.GetInstance().FiscalCalculosFactory.CreateCalcularBCIbsCbsUseCase()
      .Executar(
          BaseCalculoIbsCbsModel.Create(    
              {AnoFatoGerador} YearOf(Input.DhFatoGerador),
              {ValorBem} Input.ValorLiquido,
              {AjusteAcrescimos} Input.Acrescimos,
              {Juros} 0,
              {Multas} 0,
              {Encargos} 0,
              {FreteCobrado} Input.Frete,
              {OutrosTributos} 0,
              {ImpostoSeletivo} 0,
              {DemaisImportancias} 0,
              {ICMS}   Input.ICMS,
              {ISS}    Input.ISS,
              {PIS}    Input.PIS,
              {COFINS} Input.COFINS,
              {IPI} 0,
              {DescontoIncondicional} 0
        ));

    calcInput := ItemCalculoInput.Create(
      Input.nItem,
      Input.NCMouNBS,
      regraFiscal.CClassTrib,
      Copy(regraFiscal.CClassTrib, 1, 3),
      impSelInput,
      tribRegInput,
      bcCbsIbs,
      Input.Quantidade,
      Input.Unidade
    );
    SetLength(itensInput, 1);
    itensInput[0] := calcInput;

    // 3: Chamada do calculo dos tributos
    with Container.GetInstance().FiscalCalculosFactory.CreateCalculaTributoUseCase() do
    try
      rocResult := Executar(
        CalcularTributoInput.Create(
          Input.DhFatoGerador,
          Input.CMunFBIbs,
          EstadosService.MunicipioIbgeToUF(Input.CMunFBIbs),
          itensInput,
          CriadorCompraGovernamentalUtils.CriarCompraGovernamentalInput(tgvNenhum, togNenhum)
        )
      );
    finally
      FreeSafe();
    end;

    if not rocResult.Validacoes.IsValid() then
    begin
      SetLength(erros, Length(rocResult.Validacoes.Validacoes) );
      for I := Low(rocResult.Validacoes.Validacoes) to High(rocResult.Validacoes.Validacoes) do
        erros[I] := rocResult.Validacoes.Validacoes[I].Detalhe;

      raise Exception.Create( StringService.Join( sLineBreak, erros ) );
    end
    else
      Result := TributosDFeSerivce.Create(
        TributoDFeContextInput.Create( Input.TributoDFeId, StringNullable.Create(regraFiscal.Id), tctAutomatica, False, tdfoNFCe ),
        rocResult.Objetos[0]
      );

  finally
    regraFiscal.Free();
    rocResult.Free();
  end;
end;

{ TNFC_Emissor }

constructor TNFC_Emissor.create;
begin
  if dtmNFConsumidor = nil then
    dtmNFConsumidor := TdtmNFConsumidor.Create(dtmNFConsumidor);

  dataSet := TClientDataSet(dtmNFConsumidor.cdsEmissor);
  transacao := TIBTransaction(dtmNFConsumidor.transacao);
  buscas := TIBQuery(dtmNFConsumidor.qrBuscas);

  dataSet.FieldByName('client_or_server').OnGetText   := dataSetEmissorGetText;
  dataSet.FieldByName('server_autorizacao').OnGetText := dataSetEmissorGetText;
  dataSet.FieldByName('server_impressao').OnGetText   := dataSetEmissorGetText;
  dataSet.FieldByName('server_email').OnGetText       := dataSetEmissorGetText;
  dataSet.FieldByName('lib_ssl').OnGetText            := dataSetEmissorGetText;
  dataSet.FieldByName('lib_sslcryptlib').OnGetText    := dataSetEmissorGetText;
  dataSet.FieldByName('lib_sslhttplib').OnGetText     := dataSetEmissorGetText;
  dataSet.FieldByName('lib_sslxmlsignlib').OnGetText  := dataSetEmissorGetText;
end;

procedure TNFC_Emissor.dataSetEmissorGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.FieldName = 'CLIENT_OR_SERVER' then
    Text := IfThen(fequals('CLIENT_OR_SERVER', 'S'), 'Server', 'Client')
  else if Sender.FieldName = 'SERVER_AUTORIZACAO' then
    Text := IfThen(fequals('SERVER_AUTORIZACAO', 'S'), 'Sim', 'Não')
  else if Sender.FieldName = 'SERVER_IMPRESSAO' then
    Text := IfThen(fequals('SERVER_IMPRESSAO', 'S'), 'Sim', 'Não')
  else if Sender.FieldName = 'SERVER_EMAIL' then
    Text := IfThen(fequals('SERVER_EMAIL', 'S'), 'Sim', 'Não')
  else if Sender.FieldName = 'LIB_SSL' then
    Text := IfThen(fint('LIB_SSL') = 0, 'Default') +
            IfThen(fint('LIB_SSL') = 1, 'libOpenSSL') +
            IfThen(fint('LIB_SSL') = 2, 'libCapicom') +
            IfThen(fint('LIB_SSL') = 3, 'libCapicomDelphiSoap') +
            IfThen(fint('LIB_SSL') = 4, 'libWinCrypt') +
            IfThen(fint('LIB_SSL') = 5, 'libCustom')
  else if Sender.FieldName = 'LIB_SSLCRYPTLIB' then
    Text := IfThen(fint('LIB_SSLCRYPTLIB') = 0, 'Default') +
            IfThen(fint('LIB_SSLCRYPTLIB') = 1, 'cryOpenSSL') +
            IfThen(fint('LIB_SSLCRYPTLIB') = 2, 'cryCapicom') +
            IfThen(fint('LIB_SSLCRYPTLIB') = 3, 'cryWinCrypt')
  else if Sender.FieldName = 'LIB_SSLHTTPLIB' then
    Text := IfThen(fint('LIB_SSLHTTPLIB') = 0, 'Default') +
            IfThen(fint('LIB_SSLHTTPLIB') = 1, 'httpWinINet') +
            IfThen(fint('LIB_SSLHTTPLIB') = 2, 'httpWinHttp') +
            IfThen(fint('LIB_SSLHTTPLIB') = 3, 'httpOpenSSL') +
            IfThen(fint('LIB_SSLHTTPLIB') = 4, 'httpIndy')
  else if Sender.FieldName = 'LIB_SSLXMLSIGNLIB' then
    Text := IfThen(fint('LIB_SSLXMLSIGNLIB') = 0, 'Default') +
            IfThen(fint('LIB_SSLXMLSIGNLIB') = 1, 'xsXmlSec') +
            IfThen(fint('LIB_SSLXMLSIGNLIB') = 2, 'xsMsXml') +
            IfThen(fint('LIB_SSLXMLSIGNLIB') = 3, 'xsMsXmlCapicom') +
            IfThen(fint('LIB_SSLXMLSIGNLIB') = 4, 'xsLibXml2');
end;

procedure TNFC_Emissor.DefinirIdentificador;
var
  Mobile, PCAutomacao, ServicoWindows, ConfigurarEste: Boolean;
  OitoPrimeiros, QuatroUltimos, Identificador: string;
begin
  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;
  try
    {
    PCAutomacao    := (Pos('1|', Trim(dataSet.FieldByName('tipo').AsString)) > 0) or
                      (Pos('5|', Trim(dataSet.FieldByName('tipo').AsString)) > 0) or
                      (Pos('6|', Trim(dataSet.FieldByName('tipo').AsString)) > 0);
    Mobile         := (Pos('2|', Trim(dataSet.FieldByName('tipo').AsString)) > 0);
    ServicoWindows := (Pos('3|', Trim(dataSet.FieldByName('tipo').AsString)) > 0) or
                      (Pos('4|', Trim(dataSet.FieldByName('tipo').AsString)) > 0);
    }
    Mobile         := False;
    ServicoWindows := fequals('client_or_server', 'S');
    PCAutomacao    := not ServicoWindows;

    if not (PCAutomacao or Mobile or ServicoWindows) then
      raiseExceptionCreate('Nenhum tipo de emissor selecionado', '');

    OitoPrimeiros := Copy(dataSet.FieldByName('identificador').AsString, 1, 8);
    QuatroUltimos := Copy(dataSet.FieldByName('identificador').AsString, 9, 4);
    ConfigurarEste := False;
    if PCAutomacao or ServicoWindows then
    begin
      ConfigurarEste := Application.MessageBox('O computador que irá ser configurado é este mesmo?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES;
      if not ConfigurarEste then
      begin
        if InputQuery('Serial HD', 'Informe o número de série( 8 dígitos ) do HD( Menu Ajuda -> Registro de Software )', OitoPrimeiros) then
        begin
          if Trim(OitoPrimeiros) = '' then
            raiseExceptionCreate('Serial HD não informado. Favor informar os 8 dígitos do serial', '');
          OitoPrimeiros := Copy(Trim(OitoPrimeiros), 1, 8);
          if Length(Trim(OitoPrimeiros)) <> 8 then
            raiseExceptionCreate('Serial HD deve possuir 8 dígitos', '');
        end;
      end;
    end;
    if PCAutomacao then
    begin
      if ConfigurarEste then
        OitoPrimeiros := Copy(vDadosIni.retornaSerialHd, 1, 8);
      if not InputQuery('Codigo de usuário', 'Por favor informe o código de usuário( 4 dígitos ) autorizado ou 9999 para autorizar todos os usuários', QuatroUltimos) then
        Exit;

      if Length(Trim(vDadosIni.apenasNumeros(QuatroUltimos))) <> Length(Trim(QuatroUltimos)) then
        raiseExceptionCreate('Favor informar apenas números', '');
      QuatroUltimos := vDadosIni.StrZero(Copy(Trim(QuatroUltimos), 1, 4), 4);
      Identificador := OitoPrimeiros + QuatroUltimos;
    end
    else if Mobile then
    begin
      Identificador := OitoPrimeiros + QuatroUltimos;
      if not InputQuery('Idenficador mobile', 'Por favor informe o código identificador do mobile autorizado', Identificador) then
        Exit;
      Identificador := Copy(Trim(Identificador), 1, 12);
    end
    else if ServicoWindows then
    begin
      if ConfigurarEste then
        OitoPrimeiros := Copy(vDadosIni.retornaSerialHd, 1, 8);
      Identificador := OitoPrimeiros;
    end;
    dataSet.FieldByName('IDENTIFICADOR').AsString := Copy(Identificador, 1, 12);
  except on E: Exception do
    begin
      Application.MessageBox(PChar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
    end;
  end;
end;

procedure TNFC_Emissor.DefinirTipo(Client: Integer;
  ServidorProcessamento, ServidorImpressao: Boolean);
begin
  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;
  try
    //if (ClientAutomacao or ServidorProcessamento or ServidorImpressao) and (Mobile) then
      //raiseExceptionCreate('Mobile não pode ser configurado junto de outro tipo', '');
       {
    dataSet.FieldByName('tipo').AsString :=
      IfThen(Client = 2           , '1|') +
      IfThen(Client = 3           , '2|') +
      IfThen(ServidorProcessamento, '3|') +
      IfThen(ServidorImpressao    , '4|') +
      IfThen(Client = 0           , '5|') +
      IfThen(Client = 1           , '6|');

    dataSet.FieldByName('tipo').AsString :=
      IfThen(Trim(dataSet.FieldByName('tipo').AsString) <> '', '|') +
      dataSet.FieldByName('tipo').AsString;
      }
  except on E: Exception do
    begin
      Application.MessageBox(PChar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
    end;
  end;
end;

function TNFC_Emissor.delete: boolean;
var
  vRno: integer;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('NFC006', 'EXCLUIR', 'EMISSOR ' + dataSet.FieldByName('NOME_EMISSOR').AsString,
    'NFC_EMISSOR', dataSet.FieldByName('COD_EMISSOR').AsString) then
    exit;

  if Application.MessageBox('Deseja mesmo excluir definitivamente o registro?', 'Confirmação',
    MB_ICONQUESTION + MB_YESNO) <> ID_YES then
    Exit;
  try
    buscas.Close;
    buscas.SQL.Text := 'delete from NFC_EMISSOR' +
      ' where COD_EMISSOR = ' + IntToStr(dataSet.FieldByName('COD_EMISSOR').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    vDadosIni.GravaAuditoria('NFC006', 'EXCLUIR', 'SUCESSO', 'NFC_EMISSOR', '', buscas);

    vRno := dataSet.RecNo;
    dataSet.Close;
    dataSet.Open;

    if dataSet.RecordCount >=  vRno then
      dataSet.RecNo := vRno;

  except
    on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao excluir registro. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('TNFC_Emissor.delete Erro: ' + e.Message);
    end;
  end;
end;

destructor TNFC_Emissor.Destroy;
begin
  //
  inherited;
end;

function TNFC_Emissor.edit: boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('NFC004', 'ALTERAR', '',
    'NFC_EMISSOR', dataSet.FieldByName('COD_EMISSOR').AsString) then
    exit;

  result := inherited edit;
  if Result then
  begin
    fdata('client_or_server').Put(IfThen(fequals('client_or_server', 'S'), 'S', 'C'));
    fdata('server_autorizacao').Put(IfThen(fequals('server_autorizacao', 'S'), 'S', 'N'));
    fdata('server_impressao').Put(IfThen(fequals('server_impressao', 'S'), 'S', 'N'));
    fdata('server_email').Put(IfThen(fequals('server_email', 'S'), 'S', 'N'));
    if fdata('lib_ssl').IsNull then
    begin
      fdata('lib_ssl').Put(0);
      fdata('lib_sslcryptlib').Put(0);
      fdata('lib_sslhttplib').Put(0);
      fdata('lib_sslxmlsignlib').Put(0);
end;
  end;
end;

function TNFC_Emissor.insert: boolean;
begin
  Result := False;

  if not vDadosIni.PesqPros('NFC003', 'INSERIR', '',
    'NFC_EMISSOR', '') then
    exit;

  if not dataSet.Active then
    montaSelect('select * from nfc_emissor' +
      ' where nfc_emissor.cod_emissor = 0 and nfc_emissor.cod_empresa = ' + vDadosIni.codEmpresa);

  result := inherited insert;
  if Result  then
    //dataSet.FieldByName('tipo').AsString := '|6|';
  begin
    fdata('client_or_server').Put('C');
    fdata('server_autorizacao').Put('N');
    fdata('server_impressao').Put('N');
    fdata('server_email').Put('N');
    fdata('lib_ssl').Put(0);
    fdata('lib_sslcryptlib').Put(0);
    fdata('lib_sslhttplib').Put(0);
    fdata('lib_sslxmlsignlib').Put(0);
end;
end;

function TNFC_Emissor.post: boolean;
var
  acao: string;
begin
  try

    Result := false;
    acao := vDadosIni.IfThen(dataSet.State = dsInsert, 'INSERIR', 'EDITAR');

    if not vDadosIni.PesqPros('NFC005', acao, 'EMISSOR ' + dataSet.FieldByName('NOME_EMISSOR').AsString,
      'NFC_EMISSOR', dataSet.FieldByName('COD_EMISSOR').AsString) then
      exit;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := True;
      exit;
    end;

    checkFieldEmpty('nome_emissor', 'Campo Nome Emissor de preenchimento obrigatorio', 'DBEdit2');
    checkFieldEmpty('serie_nfce', 'Campo Serie NFC-e de preenchimento obrigatorio', 'DBEdit3');
//    checkFieldEmpty('tipo', 'Campo Tipo Emissor de preenchimento obrigatorio', 'DBEdit2');
    checkFieldEmpty('identificador', 'Campo Identificador de preenchimento obrigatorio', 'DBEdit4');
//    checkFieldEmpty('token', 'Campo Token de preenchimento obrigatorio', 'DBEdit6');
    if not fempty('REFRESH_TOKEN') then
      checkFieldEmpty('serie_nfce_off', 'Campo "Serie NFC-e Offline" de preenchimento obrigatorio', 'DBEdit4');
    if fequals('serie_nfce_off', fstr('serie_nfce')) then
      raiseExceptionCreate('Campo "Serie NFC-e Offline" não pode ser igual campo "Serie NFC-e"', 'DBEdit4');
    if fint('serie_nfce_off') > 0 then
      if SqlScalar('select count(cod_emissor) from nfc_emissor where cod_empresa = %d and cod_emissor <> %d and serie_nfce_off = %d',
        [vDadosIni.cod_empresa, fint('cod_emissor'), fint('serie_nfce_off')]).AsInteger > 0 then
        raiseExceptionCreate('Já existe outro Emissor configurado configurado com mesmo valor para o campo "Serie NFC-e Offline"', 'DBEdit4');

    if fdif('client_or_server', 'S') then
    begin
    //if Pos('1|', dataSet.FieldByName('tipo').AsString) > 0 then
      if Length(vDadosIni.apenasNumeros(Copy(dataSet.FieldByName('identificador').AsString, 9, 4))) <> 4 then
        raiseExceptionCreate('Identificador incorreto. Informar 4 últimos dígitos apenas com números', '');
    end
    else
      fdata('token').Put(fstr('identificador'));

//    if vDadosIni.PosMult(['3|', '4|'], dataSet.FieldByName('tipo').AsString) > 0 then
//      if Length(vDadosIni.apenasLetras(Copy(dataSet.FieldByName('identificador').AsString, 9, 4))) <> 4 then
//        raiseExceptionCreate('Identificador incorreto. Informar 4 últimos dígitos apenas com letras', '');

    dataSet.FieldByName('DATA_MOD').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('US_MOD').AsInteger := vDadosIni.vCodUsuario;
    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('COD_EMISSOR').AsInteger := Gencodigo('NFC_EMISSOR', buscas, vDadosIni.codEmpresa);
      dataSet.FieldByName('DATA_CAD').AsDateTime := dataSet.FieldByName('DATA_MOD').AsDateTime;
      dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    end;

    dataSet.Post;

    if (dataSet.ChangeCount = 0) then
    begin
      Result := True;
      exit;
    end;

    Result := Apply;

    if not Result then
      Exit;

    CommitaTransacao;

    vDadosIni.GravaAuditoria('NFC005', acao, 'SUCESSO', 'NFC_EMISSOR', '', buscas);

    Refresh;
  except
    on E: Exception do
    begin
      Result := false;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro ao salvar: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('TNFC_Emissor.post Erro: ' + e.Message);
    end;
  end;
end; 

{ TNFC_Base }

procedure TNFC_Base.LerConfigNFCe;
var
  List: TStrings;
  AconfList: TConfig_sistema_classList;
  Aconf: TConfig_sistema_class;
  I, J: Integer;
begin
  SqlOpen('select tpemis from nfce_config where cod_empresa = %d', [vDadosIni.cod_empresa]);

  FConfigNFCe.Config.tpemis := buscas.FieldByName('tpemis').AsInteger;
  FConfigNFCe.Config.tpemis := IfThen(FConfigNFCe.Config.tpemis = 9, 9, 1);

  FConfigNFCe.CodigoClientePadrao := vDadosIni.getConfSisInt('cl_conf_codigo_cliente_padrao', buscas);
  FConfigNFCe.ConsultaIBPT        := vDadosIni.getConfSisBool('nf_ibpt_consulta_tributos', buscas);
  FConfigNFCe.ConsultaOutrosEmissores := vDadosIni.PesqPros('NFC031', 'VALIDAR', '', 'NFCE', '', nil, False, False, False);

  List := TStringList.Create;
//  List := vDadosIni.getConfSisBlob('nfc_nfce_config_emissor_cliente', buscas);
  Aconf := TConfig_sistema_class.getConf('nfc_nfce_config_emissor_cliente', buscas, vDadosIni.cod_empresa);
  List.Text := Aconf.value1_b.Text;
  Aconf.AtivarMapeamentoKeys;

  FConfigNFCe.Padrao.TipoDeImpressao         := Aconf.ReadString('NFCe_Emissao_Padrao', 'TipoDeImpressaoPadrao'    ,    '4');
  FConfigNFCe.Padrao.IndicadorDePresenca     := Aconf.ReadString('NFCe_Emissao_Padrao', 'IndicadorDePresencaPadrao',    '1');
  FConfigNFCe.Padrao.ModalidadeDoFrete       := Aconf.ReadString('NFCe_Emissao_Padrao', 'ModalidadeDoFrete'        ,    '9');
  FConfigNFCe.Padrao.NaturezaDeOperacao      := Aconf.ReadString('NFCe_Emissao_Padrao', 'NaturezaDeOperacaoPadrao' , '5102');
//  FConfigNFCe.Padrao.QtdeViasEmContingencia  := Aconf.ReadString('NFCe_Emissao_Padrao', 'NaturezaDeOperacaoPadrao' , '5102');
  FConfigNFCe.Padrao.ImpressaoResumida       := Aconf.ReadString('NFCe_Emissao_Padrao', 'ImpressaoResumida', 'N') = 'S';
  FConfigNFCe.Padrao.ImpressoraNaoFiscal     := Aconf.ReadString('NFCe_Emissao_Padrao', 'ImpressoraNaoFiscal', 'N') = 'S';
  FConfigNFCe.Padrao.FormatoA4               := Aconf.ReadString('NFCe_Emissao_Padrao', 'FormatoA4', 'N') = 'S';
  FConfigNFCe.Padrao.ConsumidorSolicitaNaoImprimir := Aconf.ReadString('NFCe_Emissao_Padrao', 'ConsumidorSolicitaNaoImprimir', 'N') = 'S';
  FConfigNFCe.Padrao.InibirImpressaoContingenciaQuandoConsumidorSolicitar := Aconf.ReadString('NFCe_Emissao_Padrao', 'InibirImpressaoContingenciaQuandoConsumidorSolicitar', 'N') = 'S';

  FConfigNFCe.Padrao.ArquivoIniPosPrinterNaoFiscal := Trim(Aconf.ReadString('NFCe_Emissao_Padrao', 'ArquivoIniPosPrinterNaoFiscal'));
  FConfigNFCe.Padrao.ArquivoIniImpressaoHWNFC      := Aconf.ReadString('NFCe_Emissao_Padrao', 'ArquivoIniImpressaoHWNFC');

  FConfigNFCe.Pedido.SomarAcrecimoNoTotal    := Aconf.ReadString('NFCe_Pedido', 'SomarAcrecimoNoTotal' , 'N') = 'S';
  FConfigNFCe.Pedido.SubtrairDescontoNoTotal := Aconf.ReadString('NFCe_Pedido', 'SubtrairDescontoNoTotal' , 'N') = 'S';
  FConfigNFCe.Pedido.AutorizarComPgtoAuto    := Aconf.ReadString('NFCe_Pedido', 'AutorizarComPagamentoAutomaticamente' , 'N') = 'S';
  FConfigNFCe.Pedido.EmitirAuto              := Aconf.ReadString('NFCe_Pedido', 'EmitirAutomaticamente' , 'N') = 'S';
  FConfigNFCe.Pedido.ImprimirAuto            := Aconf.ReadString('NFCe_Pedido', 'ImprimirAutomaticamente' , 'N') = 'S';

  FConfigNFCe.AgenteNF.AgenteId                      := Trim(Aconf.ReadString('AgenteNaoFiscal_Caixa_' + PadL(vDadosIni.vNFConsumidor.CodEmissor, 3), 'AgenteId'));
  FConfigNFCe.AgenteNF.ArquivoIniPosPrinterNaoFiscal := Trim(Aconf.ReadString('AgenteNaoFiscal_Caixa_' + PadL(vDadosIni.vNFConsumidor.CodEmissor, 3), 'ArquivoIniPosPrinterNaoFiscal'));
  FConfigNFCe.AgenteNF.ArquivoIniImpressaoHWNFC      := Aconf.ReadString('AgenteNaoFiscal_Caixa_' + PadL(vDadosIni.vNFConsumidor.CodEmissor, 3), 'ArquivoIniImpressaoHWNFC');

  FConfigNFCe.Regras.DescontoPadraoPorItem        := vDadosIni.GetIni('NFCe_Regras', 'DescontoPadraoPorItem' ,                           'S', List) = 'S';
  FConfigNFCe.Regras.PermitirNFCeContribuinteICMS := vDadosIni.GetIni('NFCe_Regras', 'PermitirEmissaoNFCeParaClienteContribuinteDeICMS', 'N', List) = 'S';
  FConfigNFCe.Regras.SequenciaDePreco             := vDadosIni.GetIni('NFCe_Regras', 'SequenciaDePreco' ,                              '0,1', List);
  FConfigNFCe.Regras.SequenciaDePreco             := StringReplace(FConfigNFCe.Regras.SequenciaDePreco, ' ', '', [rfReplaceAll]);
  FConfigNFCe.Regras.PermitePrecoPromocao         := Pos(',0,', ',' + FConfigNFCe.Regras.SequenciaDePreco + ',') > 0;
  FConfigNFCe.Regras.TimeOutContingencia          := StrToIntDef(vDadosIni.GetIni('NFCe_Regras', 'TimeOutParaEmitirEmContingencia' ,'10', List), 10);
  FConfigNFCe.Regras.ConverterEmContingencia        := Aconf.ReadString('NFCe_Regras', 'ConverterEmContingenciaAutomaticamente' , 'N') = 'S';
  FConfigNFCe.Regras.RejeitarNcmNaoCadastradoNoIBPT := Aconf.ReadString('NFCe_Regras', 'RejeitarNcmNaoCadastradoNoIBPT' , 'S') = 'S';
  FConfigNFCe.Regras.RejeitarSemCestParaCSTs        := Aconf.ReadString('NFCe_Regras', 'RejeitarSemCestParaCSTs' , 'S') + ',';
  FConfigNFCe.Regras.InibirFormaDePagamento         := Aconf.ReadString('NFCe_Regras', 'InibirFormaDePagamento' , 'S') = 'S';
  FConfigNFCe.Regras.QtdeParaAvisoNotasPendentes    := Aconf.ReadInteger('NFCe_Regras', 'QtdeParaAvisoNotasPendentes' , 15);
  FConfigNFCe.Regras.QtdeDiasParaAvisoNotasPendentes := Aconf.ReadInteger('NFCe_Regras', 'QtdeDiasParaAvisoNotasPendentes' , 15);
  FConfigNFCe.Regras.QtdeDiasACancelarNaoResolvidas := Aconf.ReadInteger('NFCe_Regras', 'QtdeDiasACancelarNaoResolvidas' , 3);
  FConfigNFCe.Regras.QtdeDiasEnviandoNaoResolvidas  := Aconf.ReadInteger('NFCe_Regras', 'QtdeDiasEnviandoNaoResolvidas' , 3);
  FConfigNFCe.Regras.ModoSimplificadoAtivo          := Aconf.ReadString('NFCe_Regras', 'ModoSimplificadoAtivo' , '') = 'S';
  FConfigNFCe.Regras.EmitirAposCompletarPagamentos  := Aconf.ReadString('NFCe_Regras', 'EmitirAposCompletarPagamentos' , 'S') = 'S';

  FConfigNFCe.ISS.PermitirServicos           := vDadosIni.GetIni('NFCe_Servicos', 'PermitirServicos' ,           'N', List) = 'S';
  FConfigNFCe.ISS.UsarRetencaoDeISS          := vDadosIni.GetIni('NFCe_Servicos', 'UsarRetencaoDeISS' ,          'N', List) = 'S';
  FConfigNFCe.ISS.IndicadorDaExigibilidade   := vDadosIni.GetIni('NFCe_Servicos', 'IndicadorDaExigibilidade' ,   '1', List);
  FConfigNFCe.ISS.IndicadorDeIncentivoFiscal := vDadosIni.GetIni('NFCe_Servicos', 'IndicadorDeIncentivoFiscal' , '2', List);

  FConfigNFCe.Itens.DescricaoReduzida        :=             vDadosIni.GetIni('NFCe_Regras_Itens', 'UsarDescricaoReduzida' , 'S', List) = 'S';
  FConfigNFCe.Itens.CasasDecimaisQtde        := StrToIntDef(vDadosIni.GetIni('NFCe_Regras_Itens', 'CasasDecimaisQtde' , '3', List), 3);
  FConfigNFCe.Itens.CasasDecimaisQtde        := Min(FConfigNFCe.Itens.CasasDecimaisQtde, 10);
  FConfigNFCe.Itens.CasasDecimaisQtde        := Max(FConfigNFCe.Itens.CasasDecimaisQtde, 0);

  FConfigNFCe.Itens.CasasDecimaisVlUnit      := Min(vDadosIni.vEmp.vCasasDecimais, 10);
  FConfigNFCe.Itens.CasasDecimaisVlUnit      := Max(FConfigNFCe.Itens.CasasDecimaisVlUnit, 0);

  FConfigNFCe.Itens.Campos.ValorUnitario      := vDadosIni.GetIni('NFCe_Itens_Campos_Habilitados', 'ValorUnitario'      , 'S', List) = 'S';
  FConfigNFCe.Itens.Campos.ValorTotal         := vDadosIni.GetIni('NFCe_Itens_Campos_Habilitados', 'ValorTotal'         , 'S', List) = 'S';
  FConfigNFCe.Itens.Campos.DescontoPercentual := vDadosIni.GetIni('NFCe_Itens_Campos_Habilitados', 'DescontoPercentual' , 'S', List) = 'S';
  FConfigNFCe.Itens.Campos.DescontoEmValor    := vDadosIni.GetIni('NFCe_Itens_Campos_Habilitados', 'DescontoEmValor'    , 'S', List) = 'S';
  FConfigNFCe.Itens.Campos.ValorLiquido       := vDadosIni.GetIni('NFCe_Itens_Campos_Habilitados', 'ValorLiquido'       , 'S', List) = 'S';
  FConfigNFCe.Itens.Campos.UnidadeVenda       := Aconf.ReadString('NFCe_Itens_Campos_Habilitados', 'UnidadeVenda'       , 'N') = 'S';

  FConfigNFCe.Itens.Grades.UsarDescricao1Ou2 :=      vDadosIni.GetIni('NFCe_Regras_Itens_Grade', 'UsarDescricao1Ou2' , '1', List);
  FConfigNFCe.Itens.Grades.CaracterSeparador := Copy(vDadosIni.GetIni('NFCe_Regras_Itens_Grade', 'CaracterSeparador' , '-', List), 1, 1);
  FConfigNFCe.Itens.Grades.CaracterSeparador := vDadosIni.IfThen(FConfigNFCe.Itens.Grades.CaracterSeparador = '|', '-', FConfigNFCe.Itens.Grades.CaracterSeparador);

  FConfigNFCe.Cartao.HabCampoAdicional                 := Aconf.ReadString('NFCe_Cartao', 'HabilitarCampoAdcional' , 'N') = 'S';
  FConfigNFCe.Cartao.UsarPosTEFQuandoHabilitado        := Aconf.ReadString('NFCe_Cartao', 'UsarPosTEFQuandoHabilitado' , 'N') = 'S';
  FConfigNFCe.Cartao.TransacaoAvulsaDeVendaHabilitada  := Aconf.ReadString('NFCe_Cartao', 'TransacaoAvulsaDeVendaHabilitada' , 'S') = 'S';
  FConfigNFCe.Cartao.TransacaoAvulsaDigitadaHabilitada := Aconf.ReadString('NFCe_Cartao', 'TransacaoAvulsaDigitadaHabilitada' , 'N') = 'S';

  FConfigNFCe.Estoque.Conferir := vDadosIni.GetIni('NFCe_Estoque', 'Conferir' , 'N', List) = 'S';

  if FConfigNFCe.Regras.TimeOutContingencia > 30 then
    FConfigNFCe.Regras.TimeOutContingencia := 30
  else if FConfigNFCe.Regras.TimeOutContingencia < 5 then
    FConfigNFCe.Regras.TimeOutContingencia := 5;

  if FConfigNFCe.ListSeqPreco = nil then
    FConfigNFCe.ListSeqPreco := TStringList.Create;

  List := TStringList.Create;
  List.LineBreak := ',';
  List.Text := FConfigNFCe.Regras.SequenciaDePreco + ',';
  FConfigNFCe.ListSeqPreco.Clear;
  for I := 0 to List.Count - 1 do
    if (vDadosIni.apenasNumeros(List[I]) = '1') then      FConfigNFCe.ListSeqPreco.Add('|1|1 - ' + ' A Vista|')
    else if (vDadosIni.apenasNumeros(List[I]) = '2') then FConfigNFCe.ListSeqPreco.Add('|2|2 - ' + ' Prazo 30 dias|')
    else if (vDadosIni.apenasNumeros(List[I]) = '3') then FConfigNFCe.ListSeqPreco.Add('|3|3 - ' + ' Prazo 60 dias|')
    else if (vDadosIni.apenasNumeros(List[I]) = '4') then FConfigNFCe.ListSeqPreco.Add('|4|4 - ' + ' Prazo 90 dias|');
  if FConfigNFCe.ListSeqPreco.Count = 0 then              FConfigNFCe.ListSeqPreco.Add('|1|1 - ' + ' A Vista|');

  if Aconf.KesyChanges then
    Aconf.SaveConfDB(buscas).Transaction.Commit;

  //FConfigNFCe.NT.sinief_11_2025 := EncodeDate(2026, 01, 05);
  FConfigNFCe.ICM.CalcularICM_Efetivo := False;
  FConfigNFCe.OpInternaPadrao := '';
  AconfList := TConfig_sistema_classList.Create
    .AddKey('nf_s_conf_fcp')
    .AddKey('nf_s_icms_efetivo')
    .AddKey('nfc_nfce_movimento_operador')
    .AddKey('prod_ean_prefixos_invalidos')
    .AddKey('nfc_nfce_correlacao_cst_indevido')
    //.AddKey('nfc_emissao_vedada_cnpj')
    .AddKey('pos_virtual_conf')
    .AddKey('rtc_config')
    .AddKey('nfc_op_internad_default')
    .AddKey('hw_cloud_ia_conf')
    .MakeAll(buscas, vDadosIni.cod_empresa);
  try
    if Assigned(FConfigNFCe.CstsIndefidos) then
      FConfigNFCe.CstsIndefidos.Free;

    for I := 0 to AconfList.Count - 1 do
    begin
      Aconf := AconfList.Items[I];
      if Aconf.chave = 'nf_s_conf_fcp' then
      begin
        FConfigNFCe.FCP.CalcularFCP       := vDadosIni.GetIni('FCP', 'CalcularFCP'                 , 'N', Aconf.value1_b) = 'S';
        FConfigNFCe.FCP.UsarFCPdoNCM      := vDadosIni.GetIni('FCP', 'UsarFCPdoNCM'                , 'N', Aconf.value1_b) = 'S';
        FConfigNFCe.FCP.UsarFCPdoProduto  := vDadosIni.GetIni('FCP', 'UsarFCPdoProduto'            , 'N', Aconf.value1_b) = 'S';
        FConfigNFCe.FCP.UsarFCPdoEstado   := vDadosIni.GetIni('FCP', 'UsarFCPdoEstado'             , 'S', Aconf.value1_b) = 'S';
        FConfigNFCe.FCP.UsarFCPTribAdProd := vDadosIni.GetIni('FCP', 'UsarFCPdaTributacaoAdiciona' , 'S', Aconf.value1_b) = 'S';

      end
      else if Aconf.chave = 'nf_s_icms_efetivo' then
      begin
        List := vDadosIni.SplitS(vDadosIni.GetIni('Texto', 'UFs', '', Aconf.value1_b), [',', ';', '|', ' ', '.']);
        for J := 0 to List.Count - 1 do
          if Trim(List[J]) <> '' then
            if (vDadosIni.strIn(Trim(List[J]), Const_UF)) or (Trim(List[J]) = 'EX') then
              if (Trim(List[J]) = vDadosIni.vEmp.vSiglaUF) then
              begin
                FConfigNFCe.ICM.CalcularICM_Efetivo := True;
                Break;
              end;
        if Assigned(List) then
          FreeAndNil(List);
      end
      else if Aconf.chave = 'nfc_nfce_movimento_operador' then
      begin
        FConfigNFCe.MovimentoOperador.Ativo := Aconf.value1_f = 1;
      end
      else if Aconf.chave = 'prod_ean_prefixos_invalidos' then
      begin
        FConfigNFCe.Itens.EansPrefixosInvalidos := vDadosIni.ReplaceMult(Aconf.value1_b.Text, [sLineBreak, '|', ';', '.', ' ', '-', ':'], ',', [rfReplaceAll]);
      end
      else if (Aconf.chave = 'nfc_nfce_correlacao_cst_indevido') and Assigned(FConfUtils) then
        FConfUtils.CstsIndevidos := TCfgNFCeCstsIndevidos(Aconf.Clone)
      else if Aconf.chave = 'rtc_config' then
        FConfigNFCe.Conf_RTC := TConfigGlobalNF_RTC.Create(
          StrToDateDef(Aconf.ReadString('Config', 'ExigirNovosCamposAPartirDe'), Now + 30),
          UpperCase(Copy(Trim(Aconf.ReadString('Config', 'SimplesNacionalOptanteRegimeRegular')), 1, 1)) = 'S'
        )
      else if Aconf.chave = 'hw_cloud_ia_conf' then
        FConfigNFCe.Config.UsarMensageriaAI := UpperCase(Trim(
        Copy(Aconf.ReadString('Configuracao', 'UsarServicoMensageria', 'N'), 1, 1)
      )) = 'S'
      else if Aconf.chave = 'nfc_op_internad_default' then
        FConfigNFCe.OpInternaPadrao := Aconf.value1_vc;
      //else if Aconf.chave = 'nfc_emissao_vedada_cnpj' then
        //FConfigNFCe.NT.sinief_11_2025 := StrToDateDef(Aconf.value1_vc, FConfigNFCe.NT.sinief_11_2025);
    end;
  finally
    if Assigned(AconfList) then
      FreeAndNil(AconfList);
  end;
end;

{ TNFConsumidor }

procedure TNFConsumidor.SetEmissor(const Value: TNFC_Emissor);
begin
  FEmissor := Value;
end;

{ TNFCe }

procedure TNFCe.AbreRegistros(Codigo: Integer; ChildTo: Boolean);
begin
  montaSelect('select' + fCampos + ' from nfce ' +
    ' where nfce.cod_nfce = ' + IntToStr(Codigo) + ' and nfce.cod_empresa = ' + vDadosIni.codEmpresa);

  if ChildTo then
  begin
    NFCe.Dest.AbreRegistros;
    NFCe.Itens.AbreRegistros;
    NFCe.Pagamento.AbreRegistros;
    NFCe.Itens.Serv.SetISSRetidoNoCliente;
    NFCe.Pagamento.TipoPagamento.AbreRegistros;
end;
end;

procedure TNFCe.AtualizarInfFrete(AModFreteOld: string);
begin
  if AModFreteOld <> dataSet.FieldByName('modfrete').AsString then
  begin
    if dataSet.FieldByName('modfrete').AsString = '9' then
    //begin
      //dataSet.FieldByName('frete_na_base').AsString := 'N';
      dataSet.FieldByName('vfrete').AsFloat := 0;
    //end;

    Itens.AtualizarInfFrete;

    if dataSet.ChangeCount > 0 then
      if Apply then
        SalvarECalcular(True);
  end;
end;

procedure TNFCe.AtualizarInformacoesFiscaisItens(Silent: Boolean);
var
  RecNo: Integer;
  ClienteConsumidor: Boolean;
begin
  RecNo := Itens.dataSet.RecNo;
  try
//    vDadosIni.abreStatusProcessamento('Aguarde', 'Atualizando...', True);
    Itens.dataSet.DisableControls;
    try
      if dataSet.IsEmpty then
        Exit;
      if Itens.dataSet.IsEmpty then
        Exit;

      buscas.Close;
      buscas.SQL.Text := 'select situacao_nfce from nfce' +
        ' where cod_nfce = ' + IntToStr(dataSet.FieldByName('cod_nfce').AsInteger) +
        ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);
      buscas.Open;

      if vDadosIni.strIn( Trim(buscas.FieldByName('situacao_nfce').AsString),
        [sitAutorizada, sitCancelada, sitDenegada, sitInutilizada, sitAInutilizar, sitEmProcessamento, sitEnviando]) then
      begin
        if not Silent then        
          ShowAtencao('NFC não permite mais alterações. Situação NFC-e: %s', [buscas.FieldByName('situacao_nfce').AsString]);
        Exit;
      end;

      if dataSet.State = dsBrowse then
        dataSet.Edit;

      if fint('COD_CLIENTE') > 0 then
        SetCliente(False, ClienteConsumidor);

      if fempty('dfe_trib_ignorar') then
        dataSet.FieldByName('dfe_trib_ignorar').AsInteger := IfThen( not FConfigNFCe.Conf_RTC.EmVigencia(vDadosIni.vEmp.vRegime), 1);
      if (YesNoEnum(fint('dfe_trib_ignorar')) = ynNo) and fempty('op_interna_id') then
        dataSet.FieldByName('op_interna_id').AsString := FConfigNFCe.OpInternaPadrao;
      if not fnull('op_interna_id') and fempty('op_interna_id') then
        dataSet.FieldByName('op_interna_id').Clear();

      Itens.dataSet.First;
      while not Itens.dataSet.Eof do
      begin
        Itens.AtualizarDadosFiscais();
        Itens.dataSet.Next;
      end;

      Itens.Apply;

      MontarDadosAdicionaisInteresseFisco;

      dataSet.Post;
      SalvarECalcular(True, True);

    except on E: Exception do
      begin
        if not Silent then
          ShowAtencao('Erro ao Atualizar Informações Fiscais dos Itens. Erro: %s', [e.Message]);
        registraErro('TNFCe.AtualizarInformacoesFiscaisItens Erro: ' + e.Message);
      end;
    end;
  finally
    Itens.dataSet.EnableControls;
    if Itens.dataSet.RecordCount >= RecNo  then
      Itens.dataSet.RecNo := RecNo;
//    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TNFCe.AtualizarValorTotalLiquido;
begin
  if not PermiteAlteracaoItens then
    Exit;

  if not (dataSet.State in [dsInsert, dsEdit]) then
    if (dataSet.State = dsBrowse) then
      dataSet.Edit;

  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  if dataSet.FieldByName('modfrete').AsString = '9' then
  //begin
    //dataSet.FieldByName('frete_na_base').AsString := 'N';
    dataSet.FieldByName('vfrete').AsFloat := 0;
  //end;

  dataSet.FieldByName('vnf').AsFloat :=
    dataSet.FieldByName('vprod').AsFloat +
    dataSet.FieldByName('vfrete').AsFloat +
    dataSet.FieldByName('vseg').AsFloat +
    dataSet.FieldByName('voutro').AsFloat -
    dataSet.FieldByName('vdesc').AsFloat;  
end;

function TNFCe.AutorizarNFCe(UsuarioSolicitaContingencia: Boolean): Integer;
var
  TimeOutNFCe: Smallint;
  TimeStart, TimeNow: TTime;
  Tentativas: Smallint;//aqui o sistema salva as tentativas, maximo 30
  EmitirEmContingencia: Boolean;
  NFCeAutorizada: Boolean;
  Retorno: Integer;
  ServidorRecebeu: Boolean;
  ContMSG: Smallint;
  MsgRetornoCA, TpEmis: string;
  I: Integer;
begin
  Result := 0;
  try
    vDadosIni.abreStatusProcessamento('Autorizando NFC', 'Validando dados', True);
    try
      buscas.Close;
      buscas.SQL.Text := 'select cod_nfce, status, situacao_nfce, tpemis from nfce' +
        ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
        ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa);
      buscas.Open;

      if buscas.FieldByName('status').AsString = stsCancelada then
        raiseExceptionCreate('NFC Cancelada', '');

      if buscas.FieldByName('status').AsString <> stsFechada then
        raiseExceptionCreate('NFC não Fechada', '');

      if vDadosIni.strIn(Trim(buscas.FieldByName('situacao_nfce').AsString),
        [sitDenegada, sitCancelada, sitInutilizada]) then
        raiseExceptionCreate('NFC-e ' + Trim(buscas.FieldByName('situacao_nfce').AsString), '');

      Result         :=      buscas.FieldByName('cod_nfce').AsInteger;
      NFCeAutorizada := Trim(buscas.FieldByName('situacao_nfce').AsString) = sitAutorizada;
      TpEmis         := Trim(buscas.FieldByName('tpemis').AsString);

      if NFCeAutorizada then
        Exit;

      if (TpEmis = '') and (ConfigNFCe.Config.tpemis = 9) then
       UsuarioSolicitaContingencia := True;      

      SoliticacaoContingencia.Codigo    := 0;
      SoliticacaoContingencia.Solicitar := False;
      SoliticacaoContingencia.Mensagem  := '';

      if not UsuarioSolicitaContingencia then
      begin
      EmitirEmContingencia := False;
      ServidorRecebeu      := False;
        NFCeAutorizada := ProcessarNFCe(actAutorizar, EmitirEmContingencia, ServidorRecebeu);
      if TpEmis = '9' then
        EmitirEmContingencia := False;
      end;

      if (not NFCeAutorizada) then
      begin
        if UsuarioSolicitaContingencia then//so vai entrar aqui quando o usuario na tela do v2 dar o comando da emissão
          EmitirEmContingencia := True
        else
        if (not EmitirEmContingencia) and (TpEmis <> '9') then
        begin
          buscas.Close;
          buscas.SQL.Text := 'select msgretorno from nfce' +
            ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
            ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa);
          buscas.Open;

          if Pos('ERRO HTTP:', UpperCase(buscas.FieldByName('msgretorno').AsString)) > 0 then
          begin
            SoliticacaoContingencia.Mensagem := 'Erro HTTP. Provavel problema com a Internet. Deseja gerar uma NFC em contingência?';
            if not EmissaoRapida then
              if ShowConfirmacao(SoliticacaoContingencia.Mensagem, MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
              EmitirEmContingencia := True;
          end;
        end
        else if (EmitirEmContingencia) then
        begin
          vDadosIni.abreStatusProcessamento('Autorizando NFC', 'Emissão em Contingência?', True);

          if not ConfigNFCe.Regras.ConverterEmContingencia then // caso a conversao seja automatica nao é necessario questionar o usuario
            if vDadosIni.vNFConsumidor.UsaServidorAutorizacao then
          begin
              SoliticacaoContingencia.Mensagem := 'NFC atingiu o limite de tentativas de envio. Deseja gerar uma NFC em contingência?';
              if not EmissaoRapida then
                if ShowConfirmacao(SoliticacaoContingencia.Mensagem, MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
              EmitirEmContingencia := False;
          end
          else if not ServidorRecebeu then
          begin
              SoliticacaoContingencia.Mensagem := 'Servidor de Envio de NFC não recebeu a solicitação' + sLineBreak + sLineBreak +
                                                  'Por favor contacte o suporte para solucionar o problema!' + sLineBreak + sLineBreak +
                                                  'Deseja gerar uma NFC em contingência?';
              if not EmissaoRapida then
                if ShowConfirmacao(SoliticacaoContingencia.Mensagem, MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
              EmitirEmContingencia := False;
          end
            else
            begin
              SoliticacaoContingencia.Mensagem := 'Servidor de Envio de NFC esta processando a sua solicitação, porém o webservice da SEFAZ não está respondendo' + sLineBreak + sLineBreak +
                                                  'Deseja gerar uma NFC em contingência?';
              if not EmissaoRapida then
                if ShowConfirmacao(SoliticacaoContingencia.Mensagem, MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
            EmitirEmContingencia := False;
            end;
        end
        else
        begin
          if vDadosIni.vNFConsumidor.UsaServidorAutorizacao then
            SetLastMessage('NFC atingiu o limite de tentativas de envio', False)
          else if not ServidorRecebeu then
            SetLastMessage('Servidor de Envio de NFC não recebeu a solicitação' + sLineBreak + sLineBreak +
                           'Por favor contacte o suporte para solucionar o problema!', False)
          else
            SetLastMessage('Servidor de Envio de NFC esta processando a sua solicitação, porém o webservice da SEFAZ não está respondendo', False);
        end;
        
        if (EmitirEmContingencia) and (EmissaoRapida) and (not UsuarioSolicitaContingencia) then
          if not ConfigNFCe.Regras.ConverterEmContingencia then // caso a conversao seja automatica então nao fazer nada e deixar emitir caso necessario
            EmitirEmContingencia := False;
        
        if EmitirEmContingencia then
        begin

          vDadosIni.abreStatusProcessamento('Emitindo NFC', 'Gerando NFC em Contingência', True);
          DLLNFC.LoadDLL;
          Retorno := DLLNFC.nfce_client_gerar_contingencia(Processamento.CodNFC, Processamento.CodEmpresa,
            PChar(vDadosIni.vNFConsumidor.token));
          if Retorno = 0 then
            raiseExceptionCreate(string(DLLNFC.nfce_client_retorna_ultimo_erro), '')
          else if Retorno > 0 then
          begin
            Result := Retorno;
            NFCeAutorizada := Retorno > 0;
          end;
        end;

      end;

      if not NFCeAutorizada then
        Result := 0;
    except
      on E: Exception do
      begin
        Result := 0;
        SetLastMessage('Erro ao Emitir NFC-e. Erro: ' + e.Message, False);
        registraErro('TNFCe.Emitir Erro: ' + e.Message);
      end;
    end;
  finally
    if SoliticacaoContingencia.Mensagem <> '' then
    begin
      SoliticacaoContingencia.Codigo    := Processamento.CodNFC;
      SoliticacaoContingencia.Solicitar := True;
    end;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TNFCe.CancelamentoVerificar(CodNFCe: Integer): Boolean;
var
  APedVenda: TReg_PedVenda;
  AOrigemNFCe: TOrigemNFCe;
  ASituacao, AStatus: string;
begin
  try

    SqlOpen('select status, situacao_nfce, ped_origem_num, ped_destino_num, ped_origem_tip, ped_destino_tip' +
            ' from nfce' +
            ' where cod_nfce = %d and cod_empresa = %d',
            [CodNFCe, vDadosIni.cod_empresa]);

    AStatus   := Trim(buscas.FieldByName('status').AsString);
    ASituacao := Trim(buscas.FieldByName('situacao_nfce').AsString);

    if (AStatus <> stsCancelada) and
       (StrIn(ASituacao, [sitDenegada, sitCancelada, sitInutilizada])) then
    begin

      if buscas.FieldByName('ped_origem_num').AsInteger > 0 then
        AOrigemNFCe := onPedVenda
      else
        AOrigemNFCe := onAvulsa;
      APedVenda := PedVenda_GetFromPedVenda(buscas.FieldByName(IfThen(AOrigemNFCe = onPedVenda, 'ped_origem_num', 'ped_destino_num')).AsInteger,
                                       Trim(buscas.FieldByName(IfThen(AOrigemNFCe = onPedVenda, 'ped_origem_tip', 'ped_destino_tip')).AsString));

      SqlExec('update nfce set status = %s where cod_nfce = %d and cod_empresa = %d ',
              [QuotedStr(stsCancelada), CodNFCe, vDadosIni.cod_empresa]);

      if AOrigemNFCe = onAvulsa then
        if not PedVenda_CancelarPagamentos(APedVenda) then
          Exit;

      if not PedVenda_VerificarVinculo(CodNFCe) then
        raiseExceptionCreate(vMensagemErro, '');

      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;
    end;

    Result := True;

  except
    on E: Exception do
    begin
      Result := false;
      registraErro('TNFCe.CancelamentoVerificar Erro: ' + e.Message);
    end;
  end;
end;

function TNFCe.Cancelar(Inutilizacao: Boolean): Boolean;
var
  Justificativa: string;
  ContMSG: SmallInt;
  ImprimirCancelamentoNFCe: Boolean;
  Retorno, CodNFCeOriginal: Integer;
  APedVenda: TReg_PedVenda;
  AOrigemNFCe: TOrigemNFCe;
  ASituacao, AStatus: string;
begin
  try
    try
      if (not Inutilizacao) and (not ProcessandoLote) then
        if not vDadosIni.PesqPros('NFC015', 'CANCELAR', Audit_Dados ,
          'NFCE', Audit_Codigo) then
          exit;

      if not Inutilizacao then
      begin
        ClearProcessamento;
        Processamento.Acao := actCancelar;
        Processamento.CodNFC := dataSet.FieldByName('cod_nfce').AsInteger;
        Processamento.CodEmpresa := dataSet.FieldByName('cod_empresa').AsInteger;
      end;

      SqlOpen('select status, situacao_nfce, tpemis,' +
        ' ped_origem_num, ped_origem_tip, ped_destino_num, ped_destino_tip, cod_nfce_original' +
        ' from nfce' +
        ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
        ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa));

      AStatus := Trim(buscas.FieldByName('status').AsString);
      ASituacao := Trim(buscas.FieldByName('situacao_nfce').AsString);
      CodNFCeOriginal := buscas.FieldByName('cod_nfce_original').AsInteger;

      if buscas.FieldByName('ped_origem_num').AsInteger > 0 then
        AOrigemNFCe := onPedVenda
      else
        AOrigemNFCe := onAvulsa;
      APedVenda := PedVenda_GetFromPedVenda(buscas.FieldByName(IfThen(AOrigemNFCe = onPedVenda, 'ped_origem_num', 'ped_destino_num')).AsInteger,
                                       Trim(buscas.FieldByName(IfThen(AOrigemNFCe = onPedVenda, 'ped_origem_tip', 'ped_destino_tip')).AsString));

      if (AStatus <> stsACancelar) then
        if (not Inutilizacao) and              // na inutilizacao já existe o teste
          (not vDadosIni.strIn(ASituacao, [sitCancelada, sitInutilizada, sitDenegada])) then //quando já cancelada não precisa testar mais
          if not PedVenda_PermiteCancelameto(APedVenda) then
            Exit;

      ImprimirCancelamentoNFCe := False;
      if (Inutilizacao) and (ASituacao = sitInutilizada) then
        Result := True
      else if vDadosIni.strIn(ASituacao, [sitCancelada, sitInutilizada, sitDenegada]) then
        Result := True
      else if not Inutilizacao then
      begin
        Result := CancelarNFCe;
        ImprimirCancelamentoNFCe := Result;

        Result := MatchText(SqlOpen('select situacao_nfce from nfce where cod_nfce = %d and cod_empresa = %d', [Processamento.CodNFC, Processamento.CodEmpresa]).FieldByName('situacao_nfce').AsString,
                            [sitCancelada, sitInutilizada, sitDenegada]);
      end;

      if not Result then
        Exit;

      SqlExec('update nfce set status = %s where cod_nfce = %d and cod_empresa = %d ',
              [QuotedStr(stsCancelada), Processamento.CodNFC, Processamento.CodEmpresa]);

      if (AStatus <> stsACancelar) and (AOrigemNFCe = onAvulsa) then
        if not PedVenda_CancelarPagamentos(APedVenda) then
          Exit;

      if not PedVenda_VerificarVinculo(Processamento.CodNFC) then
        raiseExceptionCreate(vMensagemErro, '');

      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;

     if (Result) and (not Inutilizacao) then
     begin
       vDadosIni.GravaAuditoria('NFC015', 'CANCELAR', Audit_Dados, 'NFCE', Audit_Codigo, buscas);

       if (not ProcessandoLote) and ImprimirCancelamentoNFCe then
       begin

         ClearProcessamento;
         Processamento.Acao := actImprimir;
         Processamento.CodNFC := dataSet.FieldByName('cod_nfce').AsInteger;
         Processamento.CodEmpresa := dataSet.FieldByName('cod_empresa').AsInteger;
         Processamento.ViaCancelamento := True;

         Application.CreateForm(TfrmNFCeDadosEmissao, frmNFCeDadosEmissao);
         frmNFCeDadosEmissao.ANFCe := Self;
         if frmNFCeDadosEmissao.ShowModal <> IDOK then
           Exit;

         ImprimirNFCe;
       end;
     end;

     dataSet.RefreshRecord;
    except
      on E: Exception do
      begin
        Result := False;
        if ProcessandoLote then
          SetLastError('Cancelamento NFCe codigo %d. %s', [Processamento.CodNFC, e.Message])
        else
          Application.MessageBox(pchar('Erro ao Cancelar NFC. Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('TNFCe.Cancelar Erro: ' + e.Message);
      end;
    end;
  finally
    if CodNFCeOriginal > 0 then
      CancelamentoVerificar(CodNFCeOriginal);
  end;
end;

function TNFCe.CancelarInutilizarLote: Integer;
var
  I, codigo          : Integer;
  ArrayNFCe_Canc     : array of Integer;
  ArrayNFCe_Inut     : array of Integer;
  CountSelecionadas  : Integer;
  CountCanceladas    : Integer;
  CountInutilizadas  : Integer;
  Just, Sql          : string;
  RescueCommand      : string;
  auditList          : THw_auditoria_classList;
begin
  LastError := '';
  auditList := THw_auditoria_classList.Create;

  RescueCommand := '';
  ProcessandoLote := True;
  try

    {$REGION 'inicializando'}

    vDadosIni.abreStatusProcessamento('Cancelando NFCe''s', 'Validando dados', True);

    Processamento.CodNFC := fint('cod_nfce');
    CountSelecionadas    := SetArrayOfcod_nfce;

    SetLength(ArrayNFCe_Canc, 0);
    SetLength(ArrayNFCe_Inut, 0);

//    dataSet.Refresh;
    prepare_loop();

    if (CountSelecionadas = 0) and (Processamento.CodNFC > 0) then
    begin
      SetLength(Processamento.ArrayNFCE, 1);
      Processamento.ArrayNFCE[High(Processamento.ArrayNFCE)] := Processamento.CodNFC;
    end;

    if CountSelecionadas = 0 then
    begin
      ShowAtencao('Nenhuma nota selecionada');
      Exit;
    end;

    {$ENDREGION}

    {$REGION 'selecionando notas passiveis de autorizacao e atualizando dados fiscais'}

    for I := Low(Processamento.ArrayNFCE) to High(Processamento.ArrayNFCE) do
    begin
      filterStr('cod_nfce = %d', [Processamento.ArrayNFCE[I]]);
      if not dataSet.IsEmpty then
      begin
        if (not fempty('cod_nfce_original')) and fequals('situacao_nfce', sitAutorizada) then
          auditList.New('NFC044', 'CANCELAR', '', TableName, fstr('cod_nfce'));

        if fequals('status', stsACancelar) or fstrin('situacao_nfce', [sitAutorizada]) then
        begin
          auditList.New('NFC015', 'CANCELAR', '', TableName, fstr('cod_nfce'));
          SetLength(ArrayNFCe_Canc, Length(ArrayNFCe_Canc) + 1);
          ArrayNFCe_Canc[High(ArrayNFCe_Canc)] := Processamento.ArrayNFCE[I];
        end
        else if not fstrin('situacao_nfce', [sitAutorizada, sitCancelada, sitDenegada, sitInutilizada, sitEmProcessamento]) then
        begin
          auditList.New('NFC016', 'INUTILIZAR', '', TableName, fstr('cod_nfce'));
          SetLength(ArrayNFCe_Inut, Length(ArrayNFCe_Inut) + 1);
          ArrayNFCe_Inut[High(ArrayNFCe_Inut)] := Processamento.ArrayNFCE[I];
        end;
      end;
    end;

    {$ENDREGION}

    if (Length(ArrayNFCe_Canc) = 0) and (Length(ArrayNFCe_Inut) = 0) then
    begin
      ShowErro('Nenhuma das notas selecionadas pode ser cancelada ou inutilizada' + sLineBreak + sLineBreak +
               'Condições para usar o Cancelamento/Inutilização em lote:' + sLineBreak + sLineBreak +
               'Para cancelar o status deve estar "A Cancelar" ou a situação "Autorizada"' + sLineBreak +
               'Para inutilizar a situação não pode estar "Autorizada", "Cancelada", "Denegada" ou "Inutilizada"'); //
      Exit;
    end;

    if auditList.Count > 0 then
      if not vDadosIni.PesqPros(auditList) then
      begin
        ShowAtencao(auditList.ProcessosNaoPermitidosToStr);
        Exit;
      end;

    {
    if Length(ArrayNFCe_Canc) > 0 then
      if not Auditor.Processo('NFC015', 'LOTE', '')
                    .Cancelar
                    .Permitido then
        exit;

    Auditor.Acao := 'INUTILIZAR';
    if Length(ArrayNFCe_Inut) > 0 then
      if not Auditor.Processo('NFC016', 'LOTE', '')
                    .Permitido then
        exit;
    }

    Sql := '';
    for I := Low(ArrayNFCe_Canc) to High(ArrayNFCe_Canc) do
      Sql := IfThen(Sql <> '', Sql + ',') + IntToStr(ArrayNFCe_Canc[I]);

    for I := Low(ArrayNFCe_Inut) to High(ArrayNFCe_Inut) do
      Sql := IfThen(Sql <> '', Sql + ',') + IntToStr(ArrayNFCe_Inut[I]);

    if SqlOpen('select sum(iif(coalesce(inut_xjust, '''') = '''', 1, 0) +' +
               '           iif(coalesce(canc_xjust, '''') = '''', 1, 0)) cont from nfce' +
               ' where cod_nfce in (%s) and cod_empresa = %d',
               [Sql, vDadosIni.cod_empresa, QuotedStr(stsACancelar)])
       .FieldByName('cont').AsInteger > 0 then
    begin
      Just := 'CLIENTE DESISTIU DA COMPRA';
      if not InputQuery('Cancelamento de NFCe em lote', 'Informe a Justificativa de Cancelamento/Inutilização para NFCe''s sem justificativa', Just) then
        Exit;

      Just := Trim(UpperCase(Just));
      if (StrLength(Just) < 15) or
         (StrLength(Just) > 255) then
      begin
        ShowErro('Justificativa deve conter de 15 a 255 caracteres');
        Exit;
      end;

      SqlExec('update nfce set canc_xjust = iif(coalesce(canc_xjust, '''') = '''', %s, canc_xjust), inut_xjust = iif(coalesce(inut_xjust, '''') = '''', %s, inut_xjust)' +
              ' where cod_nfce in (%s) and cod_empresa = %d',
              [QuotedStr(Just), QuotedStr(Just), Sql, vDadosIni.cod_empresa]).Transaction.Commit;
    end;

    RescueCommand := IfThen(Self.dataSet.Active, Self.dataSet.CommandText);
    prepare_loop_done;

    Auditor.Cancelar.CodProcesso := 'NFC015';

    for I := Low(ArrayNFCe_Canc) to High(ArrayNFCe_Canc) do
    begin
      codigo := ArrayNFCe_Canc[I];
      AbreRegistros(codigo);

      if fequals('status', stsACancelar) or fstrin('situacao_nfce', [sitAutorizada]) then
      begin
        Auditor.Key(Audit_Codigo).GravarMensagem('->' + Audit_Dados);

        if Cancelar(False) then
        begin
          dataSet.RefreshRecord;
          if fequals('situacao_nfce', sitCancelada) then
            CountCanceladas := CountCanceladas + 1
          else if fequals('situacao_nfce', sitInutilizada) then
            CountInutilizadas := CountInutilizadas + 1;
        end;
      end;
    end;

    Auditor.Acao := 'INUTILIZAR';
    Auditor.CodProcesso := 'NFC016';

    for I := Low(ArrayNFCe_Inut) to High(ArrayNFCe_Inut) do
    begin
      codigo := ArrayNFCe_Inut[I];
      AbreRegistros(codigo);

      if not fstrin('situacao_nfce', [sitAutorizada, sitCancelada, sitDenegada, sitInutilizada, sitEmProcessamento]) then
      begin
        Auditor.Key(Audit_Codigo).GravarMensagem('->' + Audit_Dados);

        if Inutilizar then
        begin
          dataSet.RefreshRecord;
          if fequals('situacao_nfce', sitCancelada) then
            CountCanceladas := CountCanceladas + 1
          else if fequals('situacao_nfce', sitInutilizada) then
            CountInutilizadas := CountInutilizadas + 1;
        end;
      end;
    end;

    LastError := Format('Resultado do processamento' + sLineBreak +
                        'Selecionadas: %d' + sLineBreak + sLineBreak +
                        'Canceladas: %d' + sLineBreak + sLineBreak +
                        'Inutilizadas: %d', [CountSelecionadas, CountCanceladas, CountInutilizadas]) +
                 IfThen(LastError <> '', sLineBreak + sLineBreak + LastError);

    if CountSelecionadas = (CountCanceladas + CountInutilizadas) then
      ShowAtencao(LastError)
    else
      ShowWarning(LastError);

  finally
    ProcessandoLote := False;
    if RescueCommand <> '' then
      Self.ClientOpen(RescueCommand);

    prepare_loop_done;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TNFCe.CancelarNFCe: Boolean;
var
  Justificativa: string;
  Retorno: Integer;
  ContMSG: SmallInt;
  ServidorRecebeu: Boolean;
  NFCeCancelada: Boolean;
  Tentativas: Integer;
  TimeStart: TTime;
  TimeNow: TTime;
  TimeOutAtingido: Boolean;
begin
  Result := False;
  try
    vDadosIni.abreStatusProcessamento('Cancelando NFC', 'Validando dados', True);

    try
      buscas.Close;
      buscas.SQL.Text := 'select status, situacao_nfce, tpemis, canc_xjust from nfce' +
        ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
        ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa);
      buscas.Open;


      if Trim(buscas.FieldByName('status').AsString) <> stsACancelar then
      begin
        if Trim(buscas.FieldByName('situacao_nfce').AsString) <> sitAutorizada then
        begin
          if ProcessandoLote then
            SetLastError('NFCe codigo %d não está autorizada', [Processamento.CodNFC])
          else
            Application.MessageBox('NFC-e não está autorizada', 'Confirmação', 0+ 64);
          Exit;
        end;

        Justificativa := buscas.FieldByName('canc_xjust').AsString;
        if not ProcessandoLote then
          if not InputQuery('Justificativa', 'Informe a justificativa para cancelamento. De 15 a 255 caracteres', Justificativa) then
            Exit;
        Justificativa:= Trim(UpperCase(Justificativa));

        if Length(Justificativa) < 15 then
          raiseExceptionCreate('Justificativa de cancelamento menor que 15 caracteres');
        if Length(Justificativa) > 255 then
          raiseExceptionCreate('Justificativa de cancelamento maior que 255 caracteres');

        buscas.Close;
        buscas.SQL.Text := 'update nfce set canc_xjust = ' + QuotedStr(Justificativa) +
          ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
          ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa);
        buscas.ExecSQL;
        if buscas.Transaction.InTransaction then
          buscas.Transaction.Commit;
      end;

      ServidorRecebeu := False;
      NFCeCancelada   := ProcessarNFCe(actCancelar, TimeOutAtingido, ServidorRecebeu);

      if not NFCeCancelada then
        if TimeOutAtingido then
          if ProcessandoLote then
          begin
            if vDadosIni.vNFConsumidor.UsaServidorAutorizacao then
              raiseExceptionCreate('Atingiu o limite de tentativas de envio de Cancelamento')
            else if not ServidorRecebeu then
              raiseExceptionCreate('Servidor de Envio de NFC não recebeu a solicitação' + sLineBreak + sLineBreak +
                                   'Por favor contacte o suporte para solucionar o problema!')
            else
              raiseExceptionCreate('Servidor de Envio de Cancelamento NFC esta processando a sua solicitação, porém o webservice da SEFAZ não está respondendo');
          end
          else
          if vDadosIni.vNFConsumidor.UsaServidorAutorizacao then
            Application.MessageBox('NFC atingiu o limite de tentativas de envio de Cancelamento', 'Atenção', 0 + 64)
          else if not ServidorRecebeu then
            Application.MessageBox(PChar('Servidor de Envio de NFC não recebeu a solicitação' + sLineBreak + sLineBreak +
              'Por favor contacte o suporte para solucionar o problema!'), 'Atenção', 0 + 64)
          else
            Application.MessageBox('Servidor de Envio de Cancelamento NFC esta processando a sua solicitação, porém o webservice da SEFAZ não está respondendo',
              'Atenção', 0 + 64);

      Result := NFCeCancelada;

    except
      on E: Exception do
      begin
        Result := False;
        if ProcessandoLote then
          SetLastError('Cancelamento NFCe codigo %d. %s', [Processamento.CodNFC, e.Message])
        else
          Application.MessageBox(pchar('Erro ao CancelarNFCe NFC-e. Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('TNFCe.CancelarNFCe Erro: ' + e.Message);
      end;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TNFCe.CertificarPreenchimentoCamposCorretamente;
begin
  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  if fstrin('indpres', ['2','3','4','9']) and fempty('indintermed') then
  begin
    dataSet.FieldByName('indintermed').AsString := '0';
    dataSet.Post;
  end
  else if not fstrin('indpres', ['2','3','4','9']) and not fempty('indintermed') then
  begin
    dataSet.FieldByName('indintermed').Clear();
    dataSet.Post;
  end;

  if not fempty('cmunfgibs') and fdif('indpres', '5') then
    dataSet.FieldByName('cmunfgibs').Clear()
  else if fempty('cmunfgibs') and fequals('indpres', '5') then
    dataSet.FieldByName('cmunfgibs').AsInteger := vDadosIni.vEmp.vNfe.ibgeCodCidade;

end;

procedure TNFCe.ClearProcessamento;
begin
  Processamento.CodNFC                        := 0;
  Processamento.CodEmpresa                    := 0;
  Processamento.CountSelecao                  := 0;
  Processamento.email                         := '';
  Processamento.Acao                          := '';
  Processamento.EnviarEmail                   := False;
  Processamento.ImpressaoResumida             := ConfigNFCe.Padrao.ImpressaoResumida;
  Processamento.ImpressoraNaoFiscal           := ConfigNFCe.Padrao.ImpressoraNaoFiscal;
  Processamento.ConsumidorSolicitaNaoImprimir := ConfigNFCe.Padrao.ConsumidorSolicitaNaoImprimir;
  Processamento.ViaConsumidor                 := True;
  Processamento.ViaEstabelecimento            := False;
  Processamento.ViaCancelamento               := False;
  Processamento.FormatoA4                     := ConfigNFCe.Padrao.FormatoA4;
  Processamento.AnexarPDF                     := True;
  Processamento.UsarServidor                  := False; 
end;

function TNFCe.ConfigurarImpressoraPadrao(Impressora: string): Boolean;
var
  Aconf: TConfig_sistema_class;
begin
  Aconf := TConfig_sistema_class.getConf('nfc_nfce_config_emissor_geral', buscas, vDadosIni.cod_empresa);
  try
    Aconf.WriteString('NFCe_Impressora_Sem_Preview', 'Caixa_' + PadL(vDadosIni.vNFConsumidor.CodEmissor, 3), Impressora);
    with Aconf.SaveConfDB(buscas).Transaction do
      if InTransaction then
        Commit
      else
        Rollback;

  finally
    FreeAndNil(Aconf);
  end;
end;

function TNFCe.ContingenciaVerificar: Boolean;
var
  ACount: Integer;
  ArrayInt: array of Integer;
  I: Integer;
begin
  try
    vDadosIni.abreStatusProcessamento('Verificando contingência. Processo pode demorar um pouco', 'Validando dados', True);
    try

      if not vDadosIni.PesqPros('NFC030', 'VERIFICAR', Audit_Dados ,
        'NFCE', Audit_Codigo) then
        exit;

      DLLNFC.LoadDLL;

      ACount := DLLNFC.nfce_client_enviar_contingencias(StrToInt(vDadosIni.CodEmpresa), vDadosIni.vNFConsumidor.token);

      if ACount > 0 then
        vDadosIni.ShowAtencao(IntToStr(ACount) + ' notas processadas');

      Result := ACount > 0;

      SqlOpen('select cod_nfce from nfce where cod_empresa = %d and' +
              ' situacao_nfce in (%s, %s, %s) and status <> %s',
              [vDadosIni.cod_empresa, QuotedStr(sitDenegada), QuotedStr(sitCancelada), QuotedStr(sitInutilizada),
               QuotedStr(stsCancelada)]).FetchAll;
      SetLength(ArrayInt, buscas.RecordCount);
      buscas.First;
      while not buscas.Eof do
      begin
        ArrayInt[buscas.RecNo - 1] := buscas.FieldByName('cod_nfce').AsInteger;
        buscas.Next;
      end;

    except
      on E: Exception do
      begin
        Result := false;
        Application.MessageBox(pchar('Erro ao Emitir NFC-e. Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('TNFCe.ContingenciaVerificar Erro: ' + e.Message);
      end;
    end;
  finally
    for I := Low(ArrayInt) to High(ArrayInt) do
      CancelamentoVerificar(ArrayInt[I]);

    dataSet.Refresh;

    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TNFCe.ContingenciaVisualizar: Boolean;
begin
  Result := montaSelect('select %s from nfce ' +
    ' where nfce.num_nf > 0' +
    ' and nfce.cod_empresa = %d' +
    ' and nfce.tpemis = ''9''' +
    ' and nfce.digval <> ''''' +
    ' and nfce.status = %s' +
    ' and coalesce(nfce.situacao_nfce, %s) in (%s, %s, %s, %s)' +
    ' order by nfce.dhemi',
    [FCampos, vDadosIni.cod_empresa, QuotedStr(stsFechada),
     QuotedStr(sitVazio), QuotedStr(sitVazio), QuotedStr(sitEnviando), QuotedStr(sitRejeitada), QuotedStr(sitEmProcessamento)]);
end;

constructor TNFCe.create;
begin
  if dtmNFConsumidor = nil then
    dtmNFConsumidor := TdtmNFConsumidor.Create(dtmNFConsumidor);

  dataSet          := TClientDataSet(dtmNFConsumidor.cdsNFCe);
  transacao        := TIBTransaction(dtmNFConsumidor.transacao);
  buscas           := TIBQuery(dtmNFConsumidor.qrBuscas);
  buscas1          := TIBQuery(dtmNFConsumidor.qrBuscas1);

  FItens           := TNFCe_Itens.create(Self);
  FDest            := TNFCe_Dest.create(Self);
  FPagamento       := TNFCe_Pagamentos.create(Self);
  FTransporta      := TNFC_Transporta.create;
  FConsultaCliente := TNFC_Clientes.Create(buscas.Database);

  FlkTipoImpressao := TDadosLookUp_OOP.create;
  FlkIndPresenca   := TDadosLookUp_OOP.create;
  FlkModFrete      := TDadosLookUp_OOP.create;
  FlkSeqPreco      := TDadosLookUp_OOP.create;
  FlkVendedor      := TDadosLookUp_OOP.create;
  FConfUtils       := TCfgNFCeUtils.Create;
  FDadosCertificado := NewStringList('', ';');
  if DLLNFC = nil then
    DLLNFC         := TNFCe_DLL.create;

  FhelperConv      := TConversaoUnidadeUtils.Create(buscas.Database, vDadosIni.vNomeUsuario, vDadosIni.cod_empresa);

  FFieldsWithNotificationChange := TStringList.Create;

  dataSet.FieldByName('TPIMP').OnGetText      := dataSetNFCeGetText;
  dataSet.FieldByName('TPEMIS').OnGetText     := dataSetNFCeGetText;
  dataSet.FieldByName('TPAMB').OnGetText      := dataSetNFCeGetText;
  dataSet.FieldByName('INDPRES').OnGetText    := dataSetNFCeGetText;
  dataSet.FieldByName('MODFRETE').OnGetText   := dataSetNFCeGetText;
  dataSet.FieldByName('INFADFISCO').OnGetText := dataSetNFCeGetText;
  dataSet.FieldByName('INFCPL').OnGetText     := dataSetNFCeGetText;
  dataSet.FieldByName('TR_CODIGO').OnChange   := dataSetNFCeTransportaChange;
  dataSet.FieldByName('VNF').OnChange         := dataSetNFCeChange;

  Self.TableName := 'NFCE';

  LerConfigNFCe;

  FEmissaoRapida := FConfigNFCe.Regras.ModoSimplificadoAtivo;
  ProcessandoLote := False;

  FCampos :=
    ' nfce.cod_nfce, nfce.cod_empresa, nfce.cod_cliente, nfce.serie, nfce.num_nf, nfce.modelo, nfce.dhemi, nfce.data_lanc,' +
    ' nfce.status, nfce.natop, nfce.tpimp, nfce.tpemis, nfce.tpamb, nfce.indpres, nfce.situacao_nfce, nfce.chave_nfce,' +
    ' nfce.nprot, nfce.vbc, nfce.vicms, nfce.vprod, nfce.vfrete, nfce.vseg, nfce.vdesc, nfce.vpis, nfce.vcofins, nfce.voutro,' +
    ' nfce.vnf, nfce.vtottrib, nfce.modfrete, nfce.tr_codigo, nfce.data_cad, nfce.data_mod, nfce.us_mod, nfce.desc_por_item,' +
    ' nfce.seqpreco, nfce.infadfisco, nfce.infcpl, nfce.ativo, nfce.cstat, nfce.xmotivo, nfce.digval, nfce.dhrecbto,' +
    ' nfce.msgretorno, nfce.cod_vendedor, nfce.cod_cond_pag, nfce.frete_na_base, nfce.ped_origem_num, nfce.ped_origem_tip,' +
    ' nfce.ped_destino_num, nfce.ped_destino_tip, nfce.vfcp, nfce.vfcpst, nfce.vfcpstret, nfce.vtroco, nfce.nfe_versao,' +
    ' nfce.cod_emissor, nfce.cod_nfce_conting, nfce.cod_nfce_original, nfce.norc, nfce.operador, nfce.mov_id,' +
    ' nfce.canc_dhrecbto, nfce.canc_xjust, nfce.inut_dhrecbto, nfce.inut_xjust, nfce.indintermed, nfce.infintermed_cnpj,' +
    ' nfce.infintermed_idcadinttran, nfce.cod_nfce_complementada, nfce.cmunfgibs, nfce.dfe_trib_ignorar, nfce.vnftot, ' +
    ' nfce.vbcibscbs, nfce.ibsuf_vdif, nfce.ibsuf_vdevtrib, nfce.vibsuf, nfce.ibsmun_vdif, nfce.ibsmun_vdevtrib, ' +
    ' nfce.vibsmun, nfce.vibs, nfce.cbs_vdif, nfce.cbs_vdevtrib, nfce.vcbs, nfce.vibsmono, nfce.vcbsmono, nfce.vibsmonoreten,' +
    ' nfce.vcbsmonoreten, nfce.vibsmonoret, nfce.vcbsmonoret, nfce.vis, nfce.op_interna_id ';
  FCodNFCeMemorizada := 0;
  FObjetosInternosAusentes := True;
  FEmEmissaoEx := False;
end;

function TNFCe.CriarComplementar: Boolean;
var
  nfcList: TnfcList;
  nfcOrig, nfcDest: Tnfc_class;
  nfcItList: Tnfc_itemList;
  nfcit: Tnfc_item_class;
  nfcpag: Tnfc_pagamento_class;
  iCod, iItCod, iTemp, iCodComplementada: Integer;
  picms, vbcicms, vicms, pfcp, vbcfcp, vfcp: Double;
  ArrayNFCe: ArrayInts;
  erros: TStrings;
  iCountNfsNaogeradas, iCountSelecionadas: Integer;
  utilsInfCompl: TSpedInfComplUtils;
  infCompl: TInfComplementarModel;
  txtInfCpl: string;
begin
  if dataSet.IsEmpty then
    Exit;
  try
    if not vDadosIni.PesqPros('NFC045', 'EMITIR', 'LOTE' ,
      'NFCE', '') then
      exit;

    if vDadosIni.vNFConsumidor.CodEmissor = 0 then
      raise Exception.Create('Sem emissor configurado para este usuário. Configure antes de continuar');

    nfcList := TnfcList.Create;
    nfcItList := Tnfc_itemList.Create;
    SetLength(ArrayNFCe, 0);
    iCountNfsNaogeradas := 0;
    iCountSelecionadas := 0;

    ClearProcessamento;
    Processamento.Acao := 'Complemetar';
    Processamento.CodNFC       := fint('cod_nfce');
    Processamento.CodEmpresa   := fint('cod_empresa');
    Processamento.CountSelecao := SetArrayOfcod_nfce;
    if Processamento.CountSelecao = 0 then
    begin
      SetLength(Processamento.ArrayNFCE, 1);
      Processamento.ArrayNFCE[High(Processamento.ArrayNFCE)] := fint('cod_nfce');
    end;
    iCountSelecionadas := Length(Processamento.ArrayNFCE);

    erros := NewStringList();
    for iCod := Low(Processamento.ArrayNFCE) to High(Processamento.ArrayNFCE) do
    begin
       queryCons.Table('nfce', 'cod_nfce, num_nf, data_lanc, status, situacao_nfce')
          .Equals('cod_nfce_complementada', Processamento.ArrayNFCE[iCod])
          .Equals('status', stsFechada)
          .Equals('cod_empresa', vDadosIni.cod_empresa)
          .Open;

        if (queryCons.fint('cod_nfce') > 0) and
          (queryCons.fequals('status', stsFechada)) then
          erros.Add(Format('Cod %d - Numero %d - Data %s - Situação %s',
                           [queryCons.fint('cod_nfce'), queryCons.fint('num_nf'), queryCons.fstr('data_lanc'), queryCons.fstr('situacao_nfce')]));
    end;

    if erros.Count > 0 then
      raiseExceptionCreate('Já existe NFCe complementar criada para um do(s) documento(s) selecionado(s). Abaixo a(s) nota(s) complementar(es)' + sLineBreak + erros.Text);

    {$REGION 'Info COmplementar'}

    utilsInfCompl := TSpedInfComplUtils.Create(buscas.Database, vDadosIni.cod_empresa);
    try
      infCompl := utilsInfCompl.Get(sInfCplCOMPLEMENTOONFC);
    finally
      utilsInfCompl.Free;
    end;

    {$ENDREGION}

    for iCod := Low(Processamento.ArrayNFCE) to High(Processamento.ArrayNFCE) do
    begin
      queryCons.Table('nfce', '*')
        .Equals('cod_nfce', Processamento.ArrayNFCE[iCod])
        .Equals('cod_empresa', vDadosIni.cod_empresa)
        .Open();

      if queryCons.fequals('situacao_nfce', sitAutorizada) then
        nfcList.New().CopyFrom(queryCons.query);
    end;

    try

      for iCod := 0 to nfcList.Count - 1 do
      begin
        nfcDest := nfcList.Items[iCod];
        nfcItList.Clear;

        nfcOrig := Tnfc_class.Create;
        nfcOrig.CopyFrom(nfcDest);

        iCodComplementada := nfcDest.cod_nfce;
        //nfcDest.cod_nfce_complementada := nfcDest.cod_nfce;
        nfcDest.cod_nfce := 0 - nfcDest.cod_nfce;
        nfcDest.ativo := 1;
  //      nfcDest.cod_nfce := queryCons.IncCodigo('NFCE', vDadosIni.cod_empresa);
        nfcDest.cod_nfce_conting := Null;
        nfcDest.cod_nfce_original := Null;
        nfcDest.situacao_nfce := '';
        nfcDest.status := stsAberta;
        nfcDest.chave_nfce := '';
        nfcDest.nprot := '';
        nfcDest.cstat := '';
        nfcDest.xmotivo := '';
        nfcDest.xml_nfce.Text := '';
        nfcDest.hashnfc := '';
        nfcDest.tpemis := '';
        nfcDest.ped_origem_tip := '';
        nfcDest.ped_destino_tip := '';
        nfcDest.ped_origem_num := Null;
        nfcDest.ped_destino_num := Null;
        nfcDest.num_nf := Null;
        nfcDest.serie := Null;
        nfcDest.cnf := Null;
        nfcDest.cont_alt := Null;
        nfcDest.data_lanc := Date;
        nfcDest.data_cad := Date;
        nfcDest.data_mod := Date;
        nfcDest.dhemi := Now;
        nfcDest.dfe_trib_ignorar := Ord(ynYes); // Complemento somente de ICMS, IBS e CBS é via NF

        queryCons.Table('nfce_item', '*')
          .Equals('cod_nfce', nfcOrig.cod_nfce)
          .Equals('cod_empresa', vDadosIni.cod_empresa)
          .Open();

        nfcItList.CopyFrom(Tnfc_item_class, queryCons.query);

        for iItCod := 0 to nfcItList.Count - 1 do
        begin
          nfcItList.Items[iItCod].cod_nfce := nfcDest.cod_nfce;
          //nfcItList.Items[iItCod].dfe_tri_id := null; nessa classe nao pode haver esse campo 
        end;

        with nfcDest.SQLMotor() do
        begin
          Options.UpdateFields := buAll;
          SqlExec( SQLInsert );
        end;

        for iItCod := 0 to nfcItList.Count - 1 do
          with nfcItList.Items[iItCod].SQLMotor() do
          begin
            Options.UpdateFields := buAll;
            SqlExec( SQLInsert );
          end;

        Self.ConsultaCampos('NFCE', IntToStr(nfcDest.cod_nfce), dataSet.FieldByName('cod_nfce').DisplayLabel,
          'Igual', 'NFCE.COD_NFCE', '', True, vDadosIni.codEmpresa);

        if fint('cod_nfce') <> nfcDest.cod_nfce then
          raise Exception.Create('NFC-e gerada não localizada');

        if not Self.Edit() then
          raise Exception.Create('NFC-e não ficou em modo de edição');

        Itens.dataSet.First;
        while not Itens.dataSet.Eof do
        begin
          nfcit := Tnfc_item_class.Create;
          nfcit.CopyFrom(Itens.dataSet);
          nfcit.beginChanges;
          Itens.AtualizarDadosFiscais();
          nfcit.CopyFrom(Itens.dataSet, False);
          if nfcit.FoundChanges() then
            SqlExec(nfcit.SQLMotor().SQLUpdate);

          Itens.dataSet.Next;
        end;

        vfcp := Itens.dataSet.FieldByName('fcp_vfcpstret').AsFloat;

        if Itens.dataSet.ChangeCount > 0 then
          Itens.dataSet.CancelUpdates;

  //      if Itens.dataSet.ChangeCount > 0 then
  //        if not Itens.Apply then
  //          raise Exception.Create('Itens NFC-e foram salvos para continuar');

        // Verificando se o icms foi calculado e superior ao anterior
        Itens.Refresh;
        Itens.dataSet.First;
        while not Itens.dataSet.Eof do
        begin
          for iItCod := 0 to nfcItList.Count - 1 do
            if Itens.fint('seqid') = VarToInt(nfcItList.Items[iItCod].seqid) then
            begin
              if Itens.ffloat('icm_vicms', -2) <= RoundTo(VarToFloat(nfcItList.Items[iItCod].icm_vicms), -2) then
              begin
                SqlExec(nfcItList.Items[iItCod].SQLMotor().SQLDelete);
                nfcItList.Delete(iItCod);
              end
              else
              begin

                {$REGION 'Ajustando ICMS e FCP'}

                vbcicms := Itens.ffloat('icm_vbc');//    - VarToFloat(nfcItList.Items[iItCod].icm_vbc); Sefaz validou BC * aliq, etao a base precisa ser completa
                picms   := Itens.ffloat('icm_picms')  - VarToFloat(nfcItList.Items[iItCod].icm_picms);
                vicms   := Itens.ffloat('icm_vicms')  - VarToFloat(nfcItList.Items[iItCod].icm_vicms);
                vbcfcp  := Itens.ffloat('fcp_vbcfcp');// - VarToFloat(nfcItList.Items[iItCod].fcp_vbcfcp); Sefaz validou BC * aliq, etao a base precisa ser completa
                pfcp    := Itens.ffloat('fcp_pfcp')   - VarToFloat(nfcItList.Items[iItCod].fcp_pfcp);
                vfcp    := Itens.ffloat('fcp_vfcp')   - VarToFloat(nfcItList.Items[iItCod].fcp_vfcp);

                nfcit := Tnfc_item_class.Create;
                nfcit.CopyFrom(SqlOpen('select * from nfce_item where cod_nfce = %d and seqid = %d and cod_empresa = %d',
                                       [Itens.fint('cod_nfce'), Itens.fint('seqid'), vDadosIni.cod_empresa]));

                nfcItList.Items[iItCod] := nfcit;

                //nfcItList.Items[iItCod].CopyFrom(Itens.dataSet, );
                nfcItList.Items[iItCod].beginChanges;
                nfcItList.Items[iItCod].qcom := 0;
                nfcItList.Items[iItCod].qtrib := 0;
                nfcItList.Items[iItCod].vuncom := 0;
                nfcItList.Items[iItCod].vprod := 0;
                nfcItList.Items[iItCod].vfrete := 0;
                nfcItList.Items[iItCod].vseg := 0;
                nfcItList.Items[iItCod].vdesc := 0;
                nfcItList.Items[iItCod].voutro := 0;
                nfcItList.Items[iItCod].prec_cus_prod := 0;
                nfcItList.Items[iItCod].prec_cusm_prod := 0;
                nfcItList.Items[iItCod].pis_vbc:= 0;
                nfcItList.Items[iItCod].pis_ppis:= 0;
                nfcItList.Items[iItCod].pis_vpis:= 0;
                nfcItList.Items[iItCod].pis_qbcprod:= 0;
                nfcItList.Items[iItCod].pis_valiqprod:= 0;
                nfcItList.Items[iItCod].cofins_vbc:= 0;
                nfcItList.Items[iItCod].cofins_pcofins:= 0;
                nfcItList.Items[iItCod].cofins_vcofins:= 0;
                nfcItList.Items[iItCod].cofins_qbcprod:= 0;
                nfcItList.Items[iItCod].cofins_valiqprod:= 0;
                nfcItList.Items[iItCod].comb_pglp:= 0;
                nfcItList.Items[iItCod].comb_pgnn:= 0;
                nfcItList.Items[iItCod].comb_pgni:= 0;
                nfcItList.Items[iItCod].comb_vpart:= 0;
                nfcItList.Items[iItCod].qbcmonoret:= 0;
                nfcItList.Items[iItCod].adremicmsret:= 0;
                nfcItList.Items[iItCod].vicmsmonoret:= 0;
                nfcItList.Items[iItCod].icm_predbcefet := 0;
                nfcItList.Items[iItCod].icm_vbcefet := 0;
                nfcItList.Items[iItCod].icm_picmsefet := 0;
                nfcItList.Items[iItCod].icm_vicmsefet := 0;
                nfcItList.Items[iItCod].fcp_vbcfcpst := 0;
                nfcItList.Items[iItCod].fcp_pfcpst := 0;
                nfcItList.Items[iItCod].fcp_vfcpst := 0;
                nfcItList.Items[iItCod].fcp_pst := 0;
                nfcItList.Items[iItCod].fcp_vbcfcpstret := 0;
                nfcItList.Items[iItCod].fcp_pfcpstret := 0;
                nfcItList.Items[iItCod].fcp_vfcpstret := 0;
                nfcItList.Items[iItCod].icm_vbcstret := 0;
                nfcItList.Items[iItCod].icm_vicmsstret := 0;
                nfcItList.Items[iItCod].icm_pcredsn := 0;
                nfcItList.Items[iItCod].icm_vcredicmssn := 0;
                nfcItList.Items[iItCod].vtottrib := 0;

                nfcItList.Items[iItCod].fcp_pfcp   := pfcp;
                nfcItList.Items[iItCod].fcp_vfcp   := vfcp;
                nfcItList.Items[iItCod].fcp_vbcfcp := vbcfcp;
                nfcItList.Items[iItCod].icm_picms  := picms;
                nfcItList.Items[iItCod].icm_vicms  := vicms;
                nfcItList.Items[iItCod].icm_vbc    := vbcicms;
              
                {$ENDREGION}

              end;

              Break;
            end;

          Itens.dataSet.Next;
        end;

        // Caso nao tenha itens com imposto a nota será excluida
        if nfcItList.Count = 0 then
        begin
          if nfcDest.cod_nfce < 0 then
            SqlExec(nfcDest.SQLMotor().SQLDelete);

          iCountNfsNaogeradas := iCountNfsNaogeradas + 1;
        end
        else
        begin
          // Aqui a trigger NFCE_ITEM_CALC_IMP vai desconsiderar essa nfce e não calcular o imposto novamente
          SqlOpen('select RDB$SET_CONTEXT(''USER_SESSION'', ''COD_NFCE_COMPL'', ''%d'') from RDB$DATABASE', [nfcDest.cod_nfce]);

          // Ajustando nitem já que itens podem ter sido removidos, e alterando os itens
          for iItCod := 0 to nfcItList.Count - 1 do
          begin
            nfcItList.Items[iItCod].nitem := iItCod + 1;

            SqlExec(nfcItList.Items[iItCod].SQLMotor().SQLUpdate);

          end;

          iTemp := nfcDest.cod_nfce;
          Randomize;
          nfcDest.beginChanges();
          nfcDest.cod_nfce_complementada := iCodComplementada;
          nfcDest.tpemis := '1';
          nfcDest.serie := queryCons
            .SQL('select SERIE_NFCE from nfc_emissor' +
                        ' where cod_emissor = :cod_emissor and cod_empresa = :cod_empresa')
            .ParamValue('cod_emissor', vDadosIni.vNFConsumidor.CodEmissor)
            .ParamValue('cod_empresa', vDadosIni.cod_empresa)
            .Scalar.AsInteger;
          nfcDest.cod_nfce := queryCons.IncCodigo('NFCE', vDadosIni.cod_empresa);
          nfcDest.num_nf := queryCons.IncCodigo('NFCE_SERIE_' + IntToStr(nfcDest.serie), vDadosIni.cod_empresa);
          nfcDest.status := stsFechada;
          nfcDest.situacao_nfce := sitRejeitada;
          nfcDest.cnf := Random(99999999);
          nfcDest.infadfisco.Text := infCompl.txt + StringReplace(infCompl.txt_compl, '[@chave_nfce]', nfcOrig.chave_nfce, [rfIgnoreCase, rfReplaceAll]);

          nfcDest.ativo := 1;
          SqlExec(nfcDest.SQLMotor().SQLUpdate);

          // Para prever qualquer disparo na trigger de calculo do imposto atualizando o valor do contexto
          SqlOpen('select RDB$SET_CONTEXT(''USER_SESSION'', ''COD_NFCE_COMPL'', ''%d'') from RDB$DATABASE', [nfcDest.cod_nfce]);
          // Abaixo altera o codigo, ja que o SQLMotor nao faz update na chave
          SqlExec('update nfce set cod_nfce = %d where cod_nfce = %d and cod_empresa = %d', [nfcDest.cod_nfce, iTemp, vDadosIni.cod_empresa]);

          queryCons.SQL('update nfce_item set seqid = (select cod from incrementa_codigo(:cod_empresa, :tabela))' +
                        ' where cod_nfce = :cod_nfce and cod_empresa = :cod_empresa')
            .ParamValue('cod_nfce', nfcDest.cod_nfce)
            .ParamValue('cod_empresa', vDadosIni.cod_empresa)
            .ParamValue('tabela', 'NFCE_ITEM').ExecSQL();

          // Esse metodo faz a soma dos totais
          if queryCons.SQL('select sucesso from sp_nfce_rec_rateios(:cod_nfce, :cod_empresa)')
            .ParamValue('cod_nfce', nfcDest.cod_nfce)
            .ParamValue('cod_empresa', vDadosIni.cod_empresa)
            .Scalar.AsInteger <> 1 then
            raise Exception.Create('NFC-e não ficou em modo de edição');

          nfcpag := Tnfc_pagamento_class.Create;
          nfcpag.cod_nfce := nfcDest.cod_nfce;
          nfcpag.cod_empresa := nfcDest.cod_empresa;
          nfcpag.seqid := queryCons.IncCodigo('NFCE_PAGAMENTO', vDadosIni.cod_empresa);
          nfcpag.tpag := 99;
          nfcpag.vpag := 0;
          nfcpag.xpag := 'NFCE COMPLEMENTAR';

          SqlExec(nfcpag.SQLMotor().SQLInsert);

          SetLength(ArrayNFCe, Length(ArrayNFCe) + 1);
          ArrayNFCe[High(ArrayNFCe)] := nfcDest.cod_nfce;

  //        Parece OK,
  //        Verificar para chamar Emitir()
  //        Verificar não modificar, reabrir, essas coisas
  //        Verificar a geração do SPED

  //        queryCons.Table('nfce_item', '*')
  //          .Equals('cod_nfce', nfcDest.cod_nfce)
  //          .Equals('cod_empresa', vDadosIni.cod_empresa)
  //          .Open();

        end;

      end;

      CommitaTransacao;

    finally
      with LastCons do if DataIni <> '' then
        Self.ConsultaCampos('NFCE', Campo, 'NFCE.COD_NFCE', DataIni, DataFim, SqlAd, vDadosIni.codEmpresa)
      else
        Self.ConsultaCampos('NFCE', Conteudo, Campo, Condicao, 'NFCE.COD_NFCE', SqlAd, True, vDadosIni.codEmpresa);
    end;

    if Length(ArrayNFCe) > 0 then
      EmitirArray(ArrayNFCe, False);

    ShowAtencao('Notas selecionadas: %d ' + sLineBreak + 'Notas "não" geradas: %d', [iCountSelecionadas, iCountNfsNaogeradas]);

    dataSet.Refresh;

  except
    on E: Exception do
    begin
      RollBackTransacao;
      Result := false;
      Application.MessageBox(pchar('Erro ao Criar NFC-e complementar. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('TNFCe.CriarComplementar Erro: ' + e.Message);
    end;
  end;
end;

procedure TNFCe.dataSetNFCeChange(Sender: TField);
begin
  if Sender.FieldName = 'DFE_TRIB_IGNORAR' then
  begin
    if (YesNoEnum(fint('dfe_trib_ignorar')) = ynNo) and fempty('op_interna_id') then
      dataSet.FieldByName('op_interna_id').AsString := FConfigNFCe.OpInternaPadrao;
  end;

  if Sender.FieldName = 'VNF' then
  begin
    if Assigned(Pagamento.PagamentoChange) then
      Pagamento.PagamentoChange;
  end
  else if (FFieldsWithNotificationChange.IndexOf(Sender.FieldName) > -1)
    and Assigned(FFieldChangeEvnt)
  then
    FFieldChangeEvnt(Sender);
end;

procedure TNFCe.dataSetNFCeGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Trim(Sender.AsString) = '' then
    Exit;

  if Sender.FieldName = 'TPIMP' then
    Text := vDadosIni.IfThen(Sender.AsString = '4', '4: DANFE NFC-e',
      vDadosIni.IfThen(Sender.AsString = '5', '5: DANFE NFC-e envio eletrônico', Sender.AsString))
  else if Sender.FieldName = 'TPEMIS' then
    Text := vDadosIni.IfThen(Sender.AsString = '1', '1: Emissão normal',
      vDadosIni.IfThen(Sender.AsString = '9', '9: Contingência off-line da NFC-e', Sender.AsString))
  else if Sender.FieldName = 'TPAMB' then
    Text := vDadosIni.IfThen(Sender.AsString = '1', '1: Produção',
      vDadosIni.IfThen(Sender.AsString = '2', '2: Homologação', Sender.AsString))
  else if Sender.FieldName = 'INDPRES' then
    Text := vDadosIni.IfThen(Sender.AsString = '1', '1: Operação presencial',
      vDadosIni.IfThen(Sender.AsString = '4', '4: Entrega domicílio', Sender.AsString))
  else if Sender.FieldName = 'MODFRETE' then
    Text := vDadosIni.IfThen(Sender.AsString = '0', '0: Por conta do emitente',
      vDadosIni.IfThen(Sender.AsString = '1', '1: Por conta do destinatário',
      vDadosIni.IfThen(Sender.AsString = '2', '2: Por conta de terceiros',
      vDadosIni.IfThen(Sender.AsString = '9', '9: Sem frete', Sender.AsString))))
  else if (Sender.FieldName = 'INFADFISCO') or (Sender.FieldName = 'INFCPL') then
    Text := Copy(Sender.AsString, 1, 24)
  else
    Text := Sender.AsString;
end;

procedure TNFCe.dataSetNFCeTransportaChange(Sender: TField);
begin
  Transporta.SetTransportador(Sender.AsInteger);
end;

function TNFCe.delete: boolean;
var
  vRno: integer;
  notas: ArrayInts;
  I, iCodig: Integer;
  sAuditDados: string;
  auditList: THw_auditoria_classList;
begin
  Result := False;
  if dataSet.IsEmpty then
    Exit;

  {
  if not vDadosIni.PesqPros('NFC012', 'EXCLUIR', Audit_Dados,
    'NFCE', Audit_Codigo) then
    exit;
  }

  if Application.MessageBox('Deseja mesmo excluir definitivamente o(s) registro(s)?', 'Confirmação',
    MB_ICONQUESTION + MB_YESNO) <> ID_YES then
    Exit;
      
  iCodig := fint('cod_nfce');
  sAuditDados := Audit_Dados;  
  SetLength(notas, 0);
  auditList := THw_auditoria_classList.Create('NFCE'); 

  prepare_loop('sel = ''S''');
  try
    try
      if dataSet.IsEmpty then
      begin
        SetLength(notas, 1);
        notas[High(notas)] := iCodig;

        auditList.NewRemove('NFC012', sAuditDados, '', IntToStr(iCodig));
      end
      else
      begin
        while not dataSet.Eof do
        begin       
          SetLength(notas, Length(notas) + 1);
          notas[High(notas)] := fint('cod_nfce');

          auditList.NewRemove('NFC012', Audit_Dados, '', Audit_Codigo);
          dataSet.Next;
        end;
      end;

      if not vDadosIni.PesqPros(auditList) then
        Exit;

      for I := Low(notas) to High(notas) do
      begin
        iCodig := notas[I];

        //colocar testes aquyi
        buscas.Close;
        buscas.SQL.Text := 'select num_nf, situacao_nfce, tpemis from nfce' +
          ' where cod_nfce = ' + IntToStr(iCodig) +// IntToStr(dataSet.FieldByName('cod_nfce').AsInteger) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa; //IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);
        buscas.Open;
        if buscas.FieldByName('num_nf').AsInteger > 0 then
        begin
          if Trim(buscas.FieldByName('situacao_nfce').AsString) = sitAutorizada then
            Application.MessageBox('NFC-e já Autorizada. É necessario cancelar', 'Atenção', 0 +64)
          else if Trim(buscas.FieldByName('situacao_nfce').AsString) <> '' then
            Application.MessageBox(PChar('NFC-e ' + Trim(buscas.FieldByName('situacao_nfce').AsString) +
              '. Não pode ser excluída'), 'Atenção', 0 +64)
          else
            Application.MessageBox('Numero de NFC já foi gerado. É necessario cancelar', 'Atenção', 0 +64);
          Exit;
        end
        else
        begin

          buscas.Close;
          buscas.SQL.Text := 'UPDATE NFCE SET ATIVO = 0' +
            ' where COD_NFCE = ' + IntToStr(iCodig) + // IntToStr(dataSet.FieldByName('COD_NFCE').AsInteger) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa;
          buscas.ExecSQL;
        
        end;
      end;

      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;

      for I := Low(notas) to High(notas) do
        vDadosIni.GravaAuditoria('NFC012', 'EXCLUIR', 'SUCESSO', 'NFCE', IntToStr(notas[I]), buscas);
      {
      vDadosIni.GravaAuditoria('NFC012', 'EXCLUIR', 'SUCESSO', 'NFCE', Audit_Codigo, buscas);

      vRno := dataSet.RecNo;
      dataSet.Close;
      dataSet.Open;

      if dataSet.RecordCount >=  vRno then
        dataSet.RecNo := vRno;
      }
      dataSet.Refresh;

    except
      on E: Exception do
      begin
        Result := false;
        Application.MessageBox(pchar('Erro ao excluir registro. Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('TNFCe.delete Erro: ' + e.Message);
      end;
    end;
    
  finally               
    prepare_loop_done;
  end;
end;

destructor TNFCe.Destroy;
begin
  if FTransporta <> nil then
    FreeAndNil(FTransporta);
  if FlkTipoImpressao <> nil then
    FreeAndNil(FlkTipoImpressao);
  if FlkIndPresenca <> nil then
    FreeAndNil(FlkIndPresenca);
  if FlkModFrete <> nil then
    FreeAndNil(FlkModFrete);
  if FlkSeqPreco <> nil then
    FreeAndNil(FlkSeqPreco);
  if FlkVendedor <> nil then
    FreeAndNil(FlkVendedor);
  if FItens <> nil then
    FreeAndNil(FItens);
  if FPagamento <> nil then
    FreeAndNil(FPagamento);
  if FDest <> nil then
    FreeAndNil(FDest);
  if Assigned(FConsultaCliente) then
  begin
    FConsultaCliente.FreeDbComponents(True);
    FreeAndNil(FConsultaCliente);
  end;
  FConfUtils.Free;
  FhelperConv.Free;
  FDadosCertificado.Free;
  FFieldsWithNotificationChange.Free();

  if vDadosIni.GetIni('MD', 'LDLLN', 'N') = 'S' then
    if DLLNFC <> nil then
      DLLNFC.FreeDLL;
  try
    inherited;
  except
  end;
end;

function TNFCe.edit: boolean;
var
  I: Integer;
  SeqPrecoPadrao, Str: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  LerConfigNFCe;

  if Assigned(Orcamento) then FreeAndNil(Orcamento);

  with ValidacaoObjetosInternos do
    if not Permitido then
    begin
      SetLastMessage(Format('Objetos Internos Ausentes(%s)', [Mensagem]));
      Exit;      
    end;

  if PermiteAlteracaoItens or PermiteAlteracaoPagamento then
  begin
    if not vDadosIni.PesqPros('NFC010', 'ALTERAR', Audit_Dados ,
      'NFCE', Audit_Codigo) then
      exit;

    result := inherited edit;
    FKeyBeforeEdit := '';

    if Result then
    begin
      MemorizarRegistro;
      Dest.AbreRegistros;
      Itens.AbreRegistros;
      Itens.Serv.SetISSRetidoNoCliente;
      Pagamento.AbreRegistros;
      Pagamento.TipoPagamento.AbreRegistros;
      Transporta.SetTransportador(dataSet.FieldByName('tr_codigo').AsInteger);
      FhelperConv.LoadUnidades;
      if fint('norc') > 0 then
        Orcamento_getOrcamento(fint('norc'), Str);

      SetSeqPreco(0, dataSet.FieldByName('seqpreco').AsString);

      for I := 0 to dataSet.FieldCount - 1 do
        FKeyBeforeEdit := FKeyBeforeEdit + dataSet.Fields[I].AsString + '|';

      if PedVenda_VerificarVinculo(True) then
        dataSet.RefreshRecord;

      FEspelho := EspelhoValores.Create(
        fequals('DESC_POR_ITEM', 'S'),
        YesNoEnum(fint('dfe_trib_ignorar')) = ynYes,
        ffloat('vprod'), ffloat('vdesc'), ffloat('vfrete'), ffloat('vseg'), ffloat('voutro')
      );
      if fempty('dfe_trib_ignorar') then
        dataSet.FieldByName('dfe_trib_ignorar').AsInteger := IfThen( not FConfigNFCe.Conf_RTC.EmVigencia(vDadosIni.vEmp.vRegime), 1);
      if (YesNoEnum(fint('dfe_trib_ignorar')) = ynNo) and fempty('op_interna_id') then
        dataSet.FieldByName('op_interna_id').AsString := FConfigNFCe.OpInternaPadrao;
      if not fnull('op_interna_id') and fempty('op_interna_id') then
        dataSet.FieldByName('op_interna_id').Clear();
    end;
  end
  else
  begin
    MemorizarRegistro;
    Result := True;
    Dest.AbreRegistros;
    Itens.AbreRegistros;
    Itens.Serv.SetISSRetidoNoCliente;
    Pagamento.AbreRegistros;
    Pagamento.TipoPagamento.AbreRegistros;
    Transporta.SetTransportador(dataSet.FieldByName('tr_codigo').AsInteger);
    FhelperConv.LoadUnidades;
    if PedVenda_VerificarVinculo(True) then
      dataSet.RefreshRecord;
  end;
  if Assigned(FStatusChange) then
    FStatusChange;
end;

function TNFCe.Emitir(UsuarioSolicitaContingencia: Boolean): Boolean;
var
  TimeOutNFCe: Smallint;
  TimeStart, TimeNow: TTime;
  Tentativas: Smallint;//aqui o sistema salva as tentativas, maximo 30
  EmitirEmContingencia: Boolean;
  NFCeAutorizada: Boolean;
  Retorno: Integer;
  ServidorRecebeu: Boolean;
  ContMSG: Smallint;
  MsgRetornoCA: string;
  CodNFCeAutorizada, CodNFCeOriginal: Integer;
  TipoImpressao: Integer;//0: Consumidor
  Adicional, Astatus, Asituacao: string;
  ContingEm2Vias, OkImprimir: Boolean;
begin
  FLastMessage := '';
  try
    vDadosIni.abreStatusProcessamento('Emitindo NFC', 'Validando dados', True);
    try
      if Pagamento.dataSet.IsEmpty then
      begin
        SetLastMessage('Nenhum pagamento informado');
        Exit;
      end
      else if RoundTo(Pagamento.ValorTotal, -2) < ffloat('vnf', -2) then
      begin
        SetLastMessage('Valor total dos pagamentos não pode ser inferior ao valor da NFC-e');
        Exit;
      end
      else
      begin
        if fequals('indpres', '4') and fempty('indintermed') then
        begin
          SetLastMessage('Indicador de presença igual a "4: Entrega domicílio" e indicador de Intermediador/Marketplace não preenchido');
          Exit;
        end
        else if fequals('indintermed', '1') and fempty('infintermed_cnpj') then
        begin
          SetLastMessage('Operação com Intermediador/Marketplace e cnpj do intermediador não informado');
          Exit;
        end
        else if fequals('indintermed', '1') and fempty('infintermed_idcadinttran') then
        begin
          SetLastMessage('Operação com Intermediador/Marketplace e identificação no intermediador não informada');
          Exit;
        end
        else if fequals('indintermed', '1') and (not cgc(fstr('infintermed_cnpj'))) then
        begin
          SetLastMessage('CNPJ do Intermediador/Marketplace inválido');
          Exit;
        end;
      end;

      if not PermiteEmissao(Astatus, Asituacao) then
      begin
        if Astatus = stsAberta then
          SetStatusFechando;

        if not PermiteEmissao(Astatus, Asituacao) then
        begin
          SetLastMessage(Format('NFC-e não permite a emissão' + sLineBreak +
                                'Status: %s' + sLineBreak +
                                'Situação: %s', [Astatus, Asituacao]));
          Exit;
        end;
      end;

      if not vDadosIni.PesqPros('NFC011', 'EMITIR', Audit_Dados ,
        'NFCE', Audit_Codigo) then
        exit;

      ClearProcessamento;
      Processamento.Acao := actAutorizar;
      Processamento.email := Dest.dataSet.FieldByName('email').AsString;
      Processamento.CodNFC := dataSet.FieldByName('cod_nfce').AsInteger;
      Processamento.CodEmpresa := dataSet.FieldByName('cod_empresa').AsInteger;

      if EmissaoRapida or  (FEmEmissaoEx and FConfigNFCe.Pedido.EmitirAuto) then
      begin
      //setar os valores de configuração para o objeto Processamento
        Processamento.EnviarEmail := True;
      end
      else
      begin
        Application.CreateForm(TfrmNFCeDadosEmissao, frmNFCeDadosEmissao);
        frmNFCeDadosEmissao.ANFCe := Self;
        if frmNFCeDadosEmissao.ShowModal <> IDOK then
          Exit;
      end;

      if not Processamento.EnviarEmail then
        Processamento.email := '';

      buscas.Close;
      buscas.SQL.Text := 'select situacao_nfce, tpemis, num_nf, cod_nfce_conting, cod_nfce_original from nfce' +
        ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
        ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa);
      buscas.Open;
      CodNFCeOriginal := buscas.FieldByName('cod_nfce_original').AsInteger;

      if buscas.FieldByName('cod_nfce_conting').AsInteger > 0 then
      begin
        SetLastMessage('Uma outra NFC-e já foi emitida em Contigência espelho desta' + sLineBreak +
                       IfThen(buscas.FieldByName('num_nf').AsInteger = 0,
                              'Número da NFC não foi gerado. Este registro pode ser excluído',
                              'Favor proceder com a Inutilização ou o Cancelamento'), False);
        Exit;
      end;
      NFCeAutorizada := Trim(buscas.FieldByName('situacao_nfce').AsString) = sitAutorizada;

      ContingEm2Vias := False;
      if NFCeAutorizada then
      begin
        SetLastMessage('NFC-e  já está Autorizada', False);
      end
      else if ValidarFecharNFC then
      begin
        CodNFCeAutorizada := AutorizarNFCe(UsuarioSolicitaContingencia);// ProcessarNFCe(actAutorizar, EmitirEmContingencia, ServidorRecebeu);
        NFCeAutorizada := CodNFCeAutorizada > 0;

        if NFCeAutorizada then
        begin
          PedVenda_VerificarVinculo(CodNFCeAutorizada, True, True);

          buscas.Close;
          buscas.SQL.Text := 'select situacao_nfce, tpemis, num_nf, cod_nfce_conting from nfce' +
            ' where cod_nfce = ' + IntToStr(CodNFCeAutorizada) +
            ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa);
          buscas.Open;

          if buscas.FieldByName('situacao_nfce').AsString = sitAutorizada then
          begin
            SetLastMessage('NFC-e Autorizada', False);
          end
          else if buscas.FieldByName('tpemis').AsString = '9' then
          begin
            SetLastMessage('NFC-e Emitida em Contingência!' + sLineBreak + sLineBreak +
                           'Uma via deve permanecer no estabelecimento até o envio desta NFC-e ao SEFAZ' + sLineBreak +
                           'Favor Autorizar assim que possível', False);
            if not ConfigNFCe.Padrao.InibirImpressaoContingenciaQuandoConsumidorSolicitar then
            begin
              Processamento.ConsumidorSolicitaNaoImprimir := False;
              ContingEm2Vias := True;
            end;
            Processamento.CodNFC := CodNFCeAutorizada;
          end;
        end;
      end;

      if (NFCeAutorizada) and (not Processamento.ConsumidorSolicitaNaoImprimir) then
      begin
        ClearProcessamento;
        Processamento.Acao := actImprimir;
        Processamento.email := Dest.dataSet.FieldByName('email').AsString;
        Processamento.CodNFC := CodNFCeAutorizada;
        Processamento.CodEmpresa := dataSet.FieldByName('cod_empresa').AsInteger;

        if EmissaoRapida or (FEmEmissaoEx and FConfigNFCe.Pedido.ImprimirAuto) then
          OkImprimir := True
        else
        begin
          Application.CreateForm(TfrmNFCeDadosEmissao, frmNFCeDadosEmissao);
          frmNFCeDadosEmissao.ANFCe := Self;
            OkImprimir := frmNFCeDadosEmissao.ShowModal = IDOK
        end;
        
        if ContingEm2Vias then
        begin
          Processamento.ViaConsumidor      := True;
          Processamento.ViaEstabelecimento := True;
        end;
        if OkImprimir then
          if ImprimirNFCe then
            ImprimirTransacaoCartao;
      end
      else
        Result := False;

     if Result  then
       vDadosIni.GravaAuditoria('NFC011', 'EMITIR', Audit_Dados, 'NFCE', Audit_Codigo, buscas);
     dataSet.RefreshRecord;

     Result := NFCeAutorizada;

    except
      on E: Exception do
      begin
        Result := false;
        SetLastMessage('Erro ao Emitir NFC-e. Erro: ' + e.Message);
        registraErro('TNFCe.Emitir Erro: ' + e.Message);
      end;
    end;
  finally
    if CodNFCeOriginal > 0 then
      CancelamentoVerificar(CodNFCeOriginal);
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TNFCe.EmitirArray(ArrayNFCe: ArrayInts;
  enviarContingencias: Boolean): Integer;
var
  I: Integer;
  MsgRetornoDLL      : string;
  Tentativas         : Smallint;//aqui o sistema salva as tentativas, maximo 30
  CountSelecionadas  : Integer;
  CountAutorizada    : Integer;
  ServidorRecebeu    : Boolean;
  ServidorProcessou  : Boolean;
  TempoLimiteAtingido: Boolean;
  TimeStart, TimeNow : TTime;
  Sql, Msg           : string;
begin
  try

    {$REGION 'enviando para processamento'}
    MsgRetornoDLL := '';
    ClearProcessamento;
    Processamento.Acao         := actAutorizar;
    Processamento.CodNFC       := 0;
    Processamento.CodEmpresa   := vDadosIni.cod_empresa;
    Processamento.CountSelecao := Length(ArrayNFCe);
    Processamento.UsarServidor := vDadosIni.vNFConsumidor.UsaServidorAutorizacao;

    SetLength(Processamento.ArrayNFCE, Length(ArrayNFCe));
    for I := Low(ArrayNFCe) to High(ArrayNFCe) do
      Processamento.ArrayNFCE[I] := ArrayNFCe[I];

    DLLNFC.LoadDLL;
    Processamento.RetornoDLL := DLLNFC.nfce_client_autorizar(ArrayNFCe, Processamento.CodEmpresa, PChar(vDadosIni.vNFConsumidor.token), PChar(Processamento.email));

    if Processamento.RetornoDLL <= 0 then
      MsgRetornoDLL := string(DLLNFC.nfce_client_retorna_ultimo_erro);

    if Processamento.UsarServidor then
      vDadosIni.abreStatusProcessamento('Autorizando lote NFC', 'Solicitação enviada para servidor de processamento', True);

    if (not Processamento.UsarServidor) then
    begin

    end
    else if Processamento.RetornoDLL > 0  then
    begin

      {$REGION 'Loop de processamento que aguarda o serviço ou a thread enviar a NFC-e'}

      ServidorRecebeu     := False;
      ServidorProcessou   := False;
      TempoLimiteAtingido := False;
      Tentativas := 0;
      TimeStart := Time;
      while (Tentativas < 60) do
      begin
        Tentativas := Tentativas + 1;

        if not ServidorRecebeu then
          ServidorRecebeu := SqlOpen('select cod_emiss_serv from NFC_CENTRAL_ACOES' +
                                     ' where seqid = ' + IntToStr(Processamento.RetornoDLL) +
                                     ' and cod_empresa =  ' + vDadosIni.codEmpresa).FieldByName('COD_EMISS_SERV').AsInteger > 0;

        if ServidorRecebeu then
        begin
          vDadosIni.abreStatusProcessamento('Autorizando lote NFC', 'Servidor está processando a sua solicitação', True);

          ServidorProcessou := SqlOpen('select data_prcss, coalesce(msgretorno, msgcompleta) msgretorno from NFC_CENTRAL_ACOES' +
                                       ' where seqid = ' + IntToStr(Processamento.RetornoDLL) +
                                       ' and cod_empresa =  ' + vDadosIni.codEmpresa).FieldByName('data_prcss').AsDateTime > 0;
          if ServidorProcessou then
          begin
            MsgRetornoDLL := Trim(buscas.FieldByName('msgretorno').AsString);
            Tentativas := 60;
          end;
        end;

        if Tentativas >= 60 then
          TempoLimiteAtingido := True
        else
        begin
          TimeNow := Time;
          if (TimeNow - TimeStart) >= StrToTime('00:00:59')  then
          begin
            TempoLimiteAtingido := True;
            Tentativas          := 60;
          end;
        end;
        if (Tentativas >= 60) and (not ServidorProcessou) then
        begin
          SqlExec('update NFC_CENTRAL_ACOES set abortar = ''S''' +
                  ' where seqid = ' + IntToStr(Processamento.RetornoDLL) +
                  ' and cod_empresa =  ' + vDadosIni.codEmpresa +
                  ' and data_prcss is null');
          if buscas.Transaction.InTransaction then
            buscas.Transaction.Commit;
        end
        else
          Sleep(500);
      end;

      if not ServidorRecebeu then
        MsgRetornoDLL := MsgRetornoDLL + IfThen(MsgRetornoDLL <> '', sLineBreak + sLineBreak) +
                         'Servidor de Envio de NFC não recebeu a solicitação' + sLineBreak + sLineBreak +
                         'Por favor contacte o suporte para solucionar o problema!'
      else if not ServidorProcessou then
        MsgRetornoDLL := MsgRetornoDLL + IfThen(MsgRetornoDLL <> '', sLineBreak + sLineBreak) +
                         'Servidor de Envio de NFC esta processando a sua solicitação, porém o webservice da SEFAZ não está respondendo' +
                         ' ou foi selecionadas muitas notas para processar';

      if not ServidorProcessou then
        Processamento.RetornoDLL := 0;

      {$ENDREGION}

    end;
      
    {$ENDREGION}


    {$REGION 'analisando retorno para mensagem ao usuário'}

    Sql := '';
    for I := Low(ArrayNFCe) to High(ArrayNFCe) do
      Sql := Sql + IfThen(Sql <> '', ',') + IntToStr(ArrayNFCe[I]);

    CountAutorizada := SqlOpen('select count(cod_nfce) as contador from nfce where cod_nfce in (%s) and cod_empresa = %d and situacao_nfce = %s',
                               [Sql, vDadosIni.cod_empresa, QuotedStr(sitAutorizada)]).FieldByName('contador').AsInteger;

    Msg := Format('Total de notas autorizadas: %d', [CountAutorizada]);
    if CountSelecionadas > CountAutorizada then
      Msg := Msg + sLineBreak + sLineBreak +
             'Exitem notas não autorizadas. Por favor consulte a rejeição delas e efetue as devidas correções';

    if MsgRetornoDLL <> '' then
      Msg := Msg + sLineBreak + sLineBreak + 'Mais detalhes:' + sLineBreak + MsgRetornoDLL;

    {$ENDREGION}

    vDadosIni.GravaAuditoria('NFC011', 'EMITIR', 'LOTE AUTORIZADAS ' +IntToStr(CountAutorizada), 'NFCE', '', buscas);

    if enviarContingencias then
      ContingenciaVerificar;

    Result := CountAutorizada;

    SetLastMessage(Msg, False);

  except
    on E: Exception do
    begin
      Result := 0;
      SetLastMessage('Erro ao Emitir Lote NFC-e. Erro: ' + e.Message);
      registraErro('TNFCe.EmitirArray Erro: ' + e.Message);
    end;
  end;
end;

function TNFCe.EmitirRejeitadas: Integer;
var
  I                  : Integer;
  ArrayNFCe          : ArrayInts;// array of Integer;
  ArrayNFCe_Cont     : array of Integer;
  Tentativas         : Smallint;//aqui o sistema salva as tentativas, maximo 30
  CountSelecionadas  : Integer;
  CountAutorizada    : Integer;
  TempoLimiteAtingido: Boolean;
  ServidorRecebeu    : Boolean;
  ServidorProcessou  : Boolean;
  TimeStart, TimeNow : TTime;
  MsgRetornoDLL      : string;
  Sql, Msg           : string;

begin
  FLastMessage := '';

  if not vDadosIni.PesqPros('NFC011', 'EMITIR', 'LOTE' ,
    'NFCE', '') then
    exit;

  try
    {$REGION 'inicializando'}
    
    vDadosIni.abreStatusProcessamento('Emitindo NFC', 'Validando dados', True);

    Processamento.CodNFC := fint('cod_nfce');
    CountSelecionadas    := SetArrayOfcod_nfce;

    SetLength(ArrayNFCe     , 0);
    SetLength(ArrayNFCe_Cont, 0);

    dataSet.Refresh;
    prepare_loop();

    if (CountSelecionadas = 0) and (Processamento.CodNFC > 0) then
    begin
      SetLength(Processamento.ArrayNFCE, 1);
      Processamento.ArrayNFCE[High(Processamento.ArrayNFCE)] := Processamento.CodNFC;
    end;

    if CountSelecionadas = 0 then
    begin
      ShowAtencao('Nenhuma nota selecionada');
      Exit;
    end;

    {$ENDREGION}


    {$REGION 'selecionando notas passiveis de autorizacao e atualizando dados fiscais'}

    for I := Low(Processamento.ArrayNFCE) to High(Processamento.ArrayNFCE) do
    begin
      filterStr('cod_nfce = %d', [Processamento.ArrayNFCE[I]]);
      if not dataSet.IsEmpty then
      begin

        if fstrin('situacao_nfce', [sitVazio, sitRejeitada]) and fequals('status', stsFechada) and
          (fint('cod_nfce_conting') = 0) then
        begin
          Itens.AbreRegistros;
          AtualizarInformacoesFiscaisItens;
          SetLength(ArrayNFCe, Length(ArrayNFCe) + 1);
          ArrayNFCe[High(ArrayNFCe)] := Processamento.ArrayNFCE[I];
          vDadosIni.GravaAuditoria('NFC011', 'EMITIR',  Audit_Dados, 'NFCE', Audit_Codigo, buscas);
        end
        else if fint('cod_nfce_conting') > 0 then
        begin
          SetLength(ArrayNFCe_Cont, Length(ArrayNFCe_Cont) + 1);
          ArrayNFCe_Cont[High(ArrayNFCe_Cont)] := Processamento.ArrayNFCe[I];
          //desmarcar e mensagem
        end
        else if fstrin('situacao_nfce',[sitEnviando, sitEmProcessamento]) then
        begin
          SetLength(ArrayNFCe, Length(ArrayNFCe) + 1);
          ArrayNFCe[High(ArrayNFCe)] := Processamento.ArrayNFCE[I];
          //desmarcar e mensagem
        end;
      end;
    end;

    {$ENDREGION}
    
    if Length(ArrayNFCe) = 0 then
    begin
      ShowErro('Nenhuma das notas selecionadas pode ser autorizadas' + sLineBreak + sLineBreak +
               'Condições para usar a autorização em lote das rejeições:' + sLineBreak + sLineBreak +
               'A nota de estar com status "Fechada" e situação "Rejeitada" e não existir uma contigência referenciada');
      Exit;
    end
    else if Length(ArrayNFCe_Cont) > 0 then
      ShowErro('Existem notas que originaram outras em Contingência. Utilize o cancelamento para elas' + sLineBreak + sLineBreak +
               'Condições para usar a autorização em lote:' + sLineBreak + sLineBreak +
               'A nota de estar com status "Fechada" e situação "", "Enviando", "Em Processamento" ou "Rejeitada" e não existir uma contigência referenciada');

    Result := EmitirArray(ArrayNFCe, True);

    (*
    try

      {$REGION 'enviando para processamento'}
      MsgRetornoDLL := '';
      ClearProcessamento;
      Processamento.Acao         := actAutorizar;
      Processamento.CodNFC       := 0;
      Processamento.CodEmpresa   := vDadosIni.cod_empresa;
      Processamento.CountSelecao := Length(ArrayNFCe);
      Processamento.UsarServidor := vDadosIni.vNFConsumidor.UsaServidorAutorizacao;

      SetLength(Processamento.ArrayNFCE, Length(ArrayNFCe));
      for I := Low(ArrayNFCe) to High(ArrayNFCe) do
        Processamento.ArrayNFCE[I] := ArrayNFCe[I];

      DLLNFC.LoadDLL;
      Processamento.RetornoDLL := DLLNFC.nfce_client_autorizar(ArrayNFCe, Processamento.CodEmpresa, PChar(vDadosIni.vNFConsumidor.token), PChar(Processamento.email));

      if Processamento.RetornoDLL <= 0 then
        MsgRetornoDLL := string(DLLNFC.nfce_client_retorna_ultimo_erro);

      if Processamento.UsarServidor then
        vDadosIni.abreStatusProcessamento('Autorizando lote NFC', 'Solicitação enviada para servidor de processamento', True);

      if (not Processamento.UsarServidor) then
      begin

      end
      else if Processamento.RetornoDLL > 0  then
      begin

        {$REGION 'Loop de processamento que aguarda o serviço ou a thread enviar a NFC-e'}

        ServidorRecebeu     := False;
        ServidorProcessou   := False;
        TempoLimiteAtingido := False;
        Tentativas := 0;
        TimeStart := Time;
        while (Tentativas < 60) do
        begin
          Tentativas := Tentativas + 1;

          if not ServidorRecebeu then
            ServidorRecebeu := SqlOpen('select cod_emiss_serv from NFC_CENTRAL_ACOES' +
                                       ' where seqid = ' + IntToStr(Processamento.RetornoDLL) +
                                       ' and cod_empresa =  ' + vDadosIni.codEmpresa).FieldByName('COD_EMISS_SERV').AsInteger > 0;

          if ServidorRecebeu then
          begin
            vDadosIni.abreStatusProcessamento('Autorizando lote NFC', 'Servidor está processando a sua solicitação', True);

            ServidorProcessou := SqlOpen('select data_prcss, coalesce(msgretorno, msgcompleta) msgretorno from NFC_CENTRAL_ACOES' +
                                         ' where seqid = ' + IntToStr(Processamento.RetornoDLL) +
                                         ' and cod_empresa =  ' + vDadosIni.codEmpresa).FieldByName('data_prcss').AsDateTime > 0;
            if ServidorProcessou then
            begin
              MsgRetornoDLL := Trim(buscas.FieldByName('msgretorno').AsString);
              Tentativas := 60;
            end;
          end;

          if Tentativas >= 60 then
            TempoLimiteAtingido := True
          else
          begin
            TimeNow := Time;
            if (TimeNow - TimeStart) >= StrToTime('00:00:59')  then
            begin
              TempoLimiteAtingido := True;
              Tentativas          := 60;
            end;
          end;
          if (Tentativas >= 60) and (not ServidorProcessou) then
          begin
            SqlExec('update NFC_CENTRAL_ACOES set abortar = ''S''' +
                    ' where seqid = ' + IntToStr(Processamento.RetornoDLL) +
                    ' and cod_empresa =  ' + vDadosIni.codEmpresa +
                    ' and data_prcss is null');
            if buscas.Transaction.InTransaction then
              buscas.Transaction.Commit;
          end
          else
            Sleep(500);
        end;

        if not ServidorRecebeu then
          MsgRetornoDLL := MsgRetornoDLL + IfThen(MsgRetornoDLL <> '', sLineBreak + sLineBreak) +
                           'Servidor de Envio de NFC não recebeu a solicitação' + sLineBreak + sLineBreak +
                           'Por favor contacte o suporte para solucionar o problema!'
        else if not ServidorProcessou then
          MsgRetornoDLL := MsgRetornoDLL + IfThen(MsgRetornoDLL <> '', sLineBreak + sLineBreak) +
                           'Servidor de Envio de NFC esta processando a sua solicitação, porém o webservice da SEFAZ não está respondendo' +
                           ' ou foi selecionadas muitas notas para processar';

        if not ServidorProcessou then
          Processamento.RetornoDLL := 0;

        {$ENDREGION}

      end;
      
      {$ENDREGION}


      {$REGION 'analisando retorno para mensagem ao usuário'}

      Sql := '';
      for I := Low(ArrayNFCe) to High(ArrayNFCe) do
        Sql := Sql + IfThen(Sql <> '', ',') + IntToStr(ArrayNFCe[I]);

      CountAutorizada := SqlOpen('select count(cod_nfce) as contador from nfce where cod_nfce in (%s) and cod_empresa = %d and situacao_nfce = %s',
                                 [Sql, vDadosIni.cod_empresa, QuotedStr(sitAutorizada)]).FieldByName('contador').AsInteger;

      Msg := Format('Total de notas autorizadas: %d', [CountAutorizada]);
      if CountSelecionadas > CountAutorizada then
        Msg := Msg + sLineBreak + sLineBreak +
               'Exitem notas não autorizadas. Por favor consulte a rejeição delas e efetue as devidas correções';

      if MsgRetornoDLL <> '' then
        Msg := Msg + sLineBreak + sLineBreak + 'Mais detalhes:' + sLineBreak + MsgRetornoDLL;

      {$ENDREGION}

      vDadosIni.GravaAuditoria('NFC011', 'EMITIR', 'LOTE AUTORIZADAS ' +IntToStr(CountAutorizada), 'NFCE', '', buscas);

      ContingenciaVerificar;

      Result := CountAutorizada;

      SetLastMessage(Msg, False);

    except
      on E: Exception do
      begin
        Result := 0;
        SetLastMessage('Erro ao Emitir Lote NFC-e. Erro: ' + e.Message);
        registraErro('TNFCe.EmitirRejeitadas Erro: ' + e.Message);
      end;
    end;
    *)
  finally
    dataSet.Refresh;
    prepare_loop_done;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TNFCe.EnviarEmail: Boolean;
var
  Retorno: Integer;
  TempoLimiteAtingido, ServidorRecebeu, TentarNovamente: Boolean;
  NFIds: ArrayInts;
  anexo: string;
  anexos: hw_utils.ArrayString;
  vAplicativo: TAplicativoEnv;
  vArrayAplicativo: arrayaplicativo;
  vArrayContato: arraycontato;
  vUtilizarArrayContato: Boolean;
  vClienteId: Integer;
  vAssunto, vMensagem: string;
  vArrayClientes: ArrayInts;
  vEnvUnicaMens, vAnexarPdfs: Boolean;
  vStringListErros: TStringList;
  I, J: Integer;
begin
  try
    if not vDadosIni.PesqPros('NFC014', 'EMAIL', Audit_Dados ,
      'NFCE', Audit_Codigo) then
      exit;

    if NFCe.ConfigNFCe.Config.UsarMensageriaAI then
    begin
    	try
      	try
          vArrayClientes := NFCe.GetArrayDistinctInts('cod_cliente', True, True);
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
        FrmEnviarMensagem.CheckListBoxOpcoes.Items.Add('Anexar PDFs');

        FrmEnviarMensagem.FrameCheckListaContato.CodCliente := vClienteId;
        FrmEnviarMensagem.FrameCheckListaContato.Origem := cNfce;
        FrmEnviarMensagem.FrameCheckListaContato.UnicoMens := False;

        if FrmEnviarMensagem.ShowModal <> ID_OK then
          Exit;

        vArrayAplicativo := vDadosIni.retornaArrayAplicativo(FrmEnviarMensagem.FrameCheckListaContato.CheckListBoxAplicativo, True);
        vArraycontato    := vDadosIni.retornaArrayContato(FrmEnviarMensagem.FrameCheckListaContato.CheckListBoxContato, True);

        vUtilizarArrayContato := Length(vArrayContato) > 0;

        vEnvUnicaMens  := FrmEnviarMensagem.EnvUnicaMens;
        vAnexarPdfs    := FrmEnviarMensagem.AnexarPdfs;

        try
      NFIds := NFCe.GetArrayInts('cod_nfce', True, True);

          for I := 0 to Length(NFIds) - 1 do
          begin
          	if vEnvUnicaMens then
            	anexo := LegacyDFeDLLAdapter.GeraArquivosNFCe(
              	NFIds, vDadosIni.cod_empresa, vAnexarPdfs
              )
            else
            	anexo := LegacyDFeDLLAdapter.GeraArquivosNFCe(
              	NFIds[I], vDadosIni.cod_empresa, vAnexarPdfs
              );

            anexos := NewArrayString(anexo, ';');

            if vUtilizarArrayContato then
         		begin
              for J := 0 to Length(vArrayContato) - 1 do
              begin
                vDadosIni.retornaMensagemEnv(cNfce, vArraycontato[J].Aplicativo, vAssunto, vMensagem);

      try
                  if not vDadosIni.EnvEmail(
                    vAssunto,
                    vMensagem,
                    vClienteId,
                    vArrayContato[J].Aplicativo,
                    vDadosIni.IfThen(vEnvUnicaMens, 0, NFIds[I]),
                    vDadosIni.IfThen(vEnvUnicaMens, '', OrigemEnvStr[cNfce]),
                    cNfce,
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
                vDadosIni.retornaMensagemEnv(cNfce, vAplicativo, vAssunto, vMensagem);

                SqlOpen(' select cod_cliente from nfce ' +
                	' where cod_nfce = ' + IntToStr(NFIds[I]) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa, buscas);
                vClienteId := buscas.FieldByName('cod_cliente').AsInteger;

                if not vDadosIni.sincronizarDadosContatoClienteAplicativo(vClienteId) then
                	Exit;

                vArrayContato := vDadosIni.retornaArrayContato(vClienteId, vAplicativo, cNfce, False);

                for J := 0 to Length(vArrayContato) - 1 do
                begin
                  try
                    if not vDadosIni.EnvEmail(
                      vAssunto,
                      vMensagem,
                      vClienteId,
                      vArrayContato[J].Aplicativo,
                      vDadosIni.IfThen(vEnvUnicaMens, 0, NFIds[I]),
                      vDadosIni.IfThen(vEnvUnicaMens, '', OrigemEnvStr[cNfce]),
                      cNfce,
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

    ClearProcessamento;
    Processamento.Acao := 'Email';
    Processamento.CodNFC       := fint('cod_nfce');
    Processamento.CodEmpresa   := fint('cod_empresa');
    Processamento.CountSelecao := SetArrayOfcod_nfce;
    if Processamento.CountSelecao = 0 then
    begin
      Dest.AbreRegistros;
      Processamento.email := Dest.fstr('email');
    end;

    Application.CreateForm(TfrmNFCeDadosEmissao, frmNFCeDadosEmissao);
    frmNFCeDadosEmissao.ANFCe := Self;
    if frmNFCeDadosEmissao.ShowModal <> IDOK then
      Exit;

    if not Processamento.EnviarEmail then
      Exit;

    if Trim(Processamento.email) = '' then
      Exit;

    Processamento.email := IfThen(not Processamento.AnexarPDF, '*') + Processamento.email;//* no inicio do email vai inibir o anexo do pdf

    DLLNFC.LoadDLL;
    if vDadosIni.vNFConsumidor.UsaServidorEmail then
    begin
      if Processamento.CountSelecao = 0 then
      Retorno := DLLNFC.nfce_client_enviar_email(Processamento.CodNFC, Processamento.CodEmpresa, PChar(vDadosIni.vNFConsumidor.token), PChar(Processamento.email), False)
    else
        Retorno := DLLNFC.nfce_client_enviar_email_lote(Processamento.ArrayNFCE, Processamento.CodEmpresa, PChar(vDadosIni.vNFConsumidor.token), PChar(Processamento.email), False);
    end
    else
    begin
      TempoLimiteAtingido := False;
      ServidorRecebeu := False;

      if ProcessarNFCe(actEnviarEmail, TempoLimiteAtingido, ServidorRecebeu) then
        Retorno := 1
      else
      begin
        if TempoLimiteAtingido then
        begin
          if not ServidorRecebeu then
            TentarNovamente := Application.MessageBox(PChar('Servidor de Envio de NFC não recebeu a solicitação' + sLineBreak + sLineBreak +
              'Por favor contacte o suporte para solucionar o problema!' +sLineBreak + sLineBreak +
              'Deseja enviar por este computador mesmo?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES
          else
            TentarNovamente := Application.MessageBox(PChar('Servidor de Envio de email esta processando a sua solicitação, porém ele não está respondendo' + sLineBreak + sLineBreak +
              'Deseja enviar por este computador mesmo?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES;
          if TentarNovamente then
          begin
            if Processamento.CountSelecao = 0 then
              Retorno := DLLNFC.nfce_client_enviar_email(Processamento.CodNFC, Processamento.CodEmpresa, PChar(vDadosIni.vNFConsumidor.token), PChar(Processamento.email), False)
            else
              Retorno := DLLNFC.nfce_client_enviar_email_lote(Processamento.ArrayNFCE, Processamento.CodEmpresa, PChar(vDadosIni.vNFConsumidor.token), PChar(Processamento.email), False);
            if Retorno = 0 then
              raiseExceptionCreate(string(DLLNFC.nfce_client_retorna_ultimo_erro), '');
          end;
        end;
      end;
    end;
    Result := Retorno = 1;

   if Result  then
     vDadosIni.GravaAuditoria('NFC014', 'EMAIL', Audit_Dados, 'NFCE', Audit_Codigo, buscas);

   dataSet.RefreshRecord;

  except
    on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao Enviar email NFC-e. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('TNFCe.EnviarEmail Erro: ' + e.Message);
    end;
  end;
end;

function TNFCe.GetAudit_Codigo: string;
begin
  Result := dataSet.FieldByName('cod_nfce').AsString;
end;

function TNFCe.GetAudit_Dados: string;
begin
  Result := 'COD:' + Audit_Codigo +
    vDadosIni.IfThen(Trim(dataSet.FieldByName('serie').AsString) <> '',
      ' SER:' + Trim(dataSet.FieldByName('serie').AsString), '') +
    vDadosIni.IfThen(Trim(dataSet.FieldByName('num_nf').AsString) <> '',
      ' NUM:' + Trim(dataSet.FieldByName('num_nf').AsString), '') +
    vDadosIni.IfThen(Trim(dataSet.FieldByName('status').AsString) <> '',
      ' STS:' + Trim(dataSet.FieldByName('status').AsString), '') +
    vDadosIni.IfThen(Trim(dataSet.FieldByName('situacao_nfce').AsString) <> '',
      ' SIT:' + Trim(dataSet.FieldByName('situacao_nfce').AsString), '');
end;

function TNFCe.GetDadosCertificado: TStrings;
var
  dados, erros: WideString;
  diasAv, diasVc: Integer;
begin
  Result := FDadosCertificado;

  if (FDadosCertificado.Count = 0)
    or (FDadosCertificado.Values['Error'] <> '') then
  begin
    DLLNFC.LoadDLL;

    dados := DLLNFC.dfe_dados_certificado(vDadosIni.cod_empresa, vDadosIni.vBancoHW, '65', erros);

    FDadosCertificado.Text := dados;

    if TryStrToInt(FDadosCertificado.Values['DiasAviso'], diasAv)
      and TryStrToInt(FDadosCertificado.Values['DiasVencimento'], diasVc) then
      if diasVc <= diasAv then
        if diasVc = 0 then
          FDadosCertificado.Values['Vencendo'] := 'Certificado vence hoje'
        else if diasVc < 0 then
          FDadosCertificado.Values['Vencendo'] := 'Certificado vencido'
        else if diasVc = 1 then
          FDadosCertificado.Values['Vencendo'] := 'Certificado vence amanhã '
        else
          FDadosCertificado.Values['Vencendo'] := Format('Certificado vence em %d dias ', [diasVc]);
  end;
end;

procedure TNFCe.GetDatasApi;
begin
  if vDadosIni.vNFConsumidor.NFCeOffline <> noClient then
    Exit;

  try
    SqlOpen('select data_api_online, data_api_error from nfc_emissor' +
            ' where cod_emissor = %d and cod_empresa = %d',
            [vDadosIni.vNFConsumidor.CodEmissor, vDadosIni.cod_empresa], buscas1);

    vDadosIni.vNFConsumidor.DataApiOnline := buscas1.FieldByName('data_api_online').AsDateTime;
    vDadosIni.vNFConsumidor.DataApiError := buscas1.FieldByName('data_api_error').AsDateTime;
  except on E: Exception do
  end;
end;

function TNFCe.GetXML(AOperacao: TOperacaoNFCe): string;
var
  ACampo, AFileName: string;
begin
  if AOperacao = opAutorizacao then
    ACampo := 'XML_NFCE'
  else if AOperacao = opCancelamento then
    ACampo := 'CANC_XML_NFCE'
  else
    ACampo := 'INUT_XML_NFCE';

  Result := SqlOpen('select ' + ACampo + ' from nfce' +
                    ' where cod_nfce = ' + IntToStr(dataSet.FieldByName('cod_nfce').AsInteger) +
                    ' and cod_empresa = ' + vDadosIni.codEmpresa).FieldByName(ACampo).AsString;
end;

function TNFCe.PedVenda_CancelarPagamentos(APedVenda: TReg_PedVenda): Boolean;
var
  I: Integer;
begin
  if (not Assigned(APedVenda)) or (vDadosIni.vEmp.vModoFaturamento = 'S') then
  begin
    Result := True;
    Exit;
  end
  else
    Result := False;

  if APedVenda.Pagamento.Count > 0 then
  begin
    vDadosIni.ShowAtencao('Venda com Forma de Pagamento. É necessário cancelar as formas!');
    if not vDadosIni.PesqPros('FPG023', 'CANCELAR', APedVenda.tipo + ':' +
      IntToStr(APedVenda.nped), 'FORMPAGAMENTO', IntToStr(APedVenda.nped), nil, True, True) then
      Exit;


    SqlExec('delete from formpagamento ' +
      ' where nrequisicao = ' + IntToStr(APedVenda.nped) +
      ' and tpdocs = ' + QuotedStr(APedVenda.tipo) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa);
  end;

  Result := True;
end;

function TNFCe.PedVenda_GetFromNFCe(ACodNFC: Integer): TReg_PedVenda;
var
  APedVenda: TReg_PedVenda;
  I, ACodVendedor: Integer;
  AFreteNaBase: Boolean;
  ANomeVend: string;
begin
  APedVenda := TReg_PedVenda.create;

  if SqlOpen('select nfce.*, clientes.cpfcgc, clientes.nome_cliente, colaborador.nome_vendedor from nfce' +
    ' left join colaborador on colaborador.cod_vendedor = nfce.cod_vendedor and colaborador.cod_empresa = nfce.cod_empresa' +
    ' left join clientes on clientes.cod_cliente = nfce.cod_cliente and clientes.cod_empresa = nfce.cod_empresa' +
    ' where nfce.cod_nfce = ' + IntToStr(ACodNFC) +
    ' and nfce.cod_empresa = ' + vDadosIni.codEmpresa).IsEmpty then
  begin
    FreeAndNil(APedVenda);
    Result := APedVenda;
    Exit;
  end;

  AFreteNaBase        := buscas.FieldByName('frete_na_base').AsString = 'S';
  ACodVendedor        := buscas.FieldByName('cod_vendedor').AsInteger;
  ANomeVend           := buscas.FieldByName('nome_vendedor').AsString;
  vDadosIni.vDataHora := vDadosIni.FusoDateTime;

  with APedVenda do
  begin
    cod_nfce         := ACodNFC;
    num_nfce         := buscas.FieldByName('num_nf').AsInteger;
    nped             := SqlOpen('select cod from incrementa_codigo(' + vDadosIni.codEmpresa + ', ' + QuotedStr('REQVENDA') + ')',buscas1).FieldByName('COD').AsInteger;
    tipo             := 'REQ';
    cod_cliente      := IfThen(buscas.FieldByName('cod_cliente').AsInteger > 0,
                               buscas.FieldByName('cod_cliente').AsInteger,
                               StrToIntDef(vDadosIni.vCliente.vCodClientePadrao, 0));
    if cod_cliente = 0 then
      raise Exception.Create('NFC-e sem cliente e código do cliente padrão não definido');
    cod_vendedor     := buscas.FieldByName('cod_vendedor').AsInteger;
    valor_total      := buscas.FieldByName('vnf').AsFloat;
    cod_cond_pag     := buscas.FieldByName('cod_cond_pag').AsInteger;
    data_ped         := DateOf(buscas.FieldByName('dhemi').AsDateTime);
    cod_us_fech      := buscas.FieldByName('cod_vendedor').AsInteger;
    data_fech        := vDadosIni.FusoDate(True);
    hora_fech        := FormatDateTime('hh:nn', vDadosIni.FusoDateTime(True));
    desconto         := buscas.FieldByName('vdesc').AsFloat;
    obs_ped          := vDadosIni.vEmp.vMensagem +
                        '; NFC-e ' + FormatDateTime('dd/mm/yyyy hh:nn', buscas.FieldByName('dhemi').AsDateTime) +
                        vDadosIni.StrZero(buscas.FieldByName('num_nf').AsInteger, 6) + '/' +
                        vDadosIni.StrZero(buscas.FieldByName('serie').AsInteger, 3);
    status_ped       := stsPedFechada;
    tipv             := 'V';
    horaabertura     := HourOf(buscas.FieldByName('dhemi').AsDateTime);
    minabertura      := MinuteOf(buscas.FieldByName('dhemi').AsDateTime);
    horafechamento   := HourOf(vDadosIni.FusoDateTime(True));
    minfechamento    := MinuteOf(vDadosIni.FusoDateTime(True));
    acrescimo        := buscas.FieldByName('vseg').AsFloat +
                        buscas.FieldByName('voutro').AsFloat +
                        buscas.FieldByName('vfrete').AsFloat;
    tot_prod         := buscas.FieldByName('vprod').AsFloat;
    cpfcgc           := buscas.FieldByName('cpfcgc').AsString;
    nome_clientedav  := buscas.FieldByName('nome_cliente').AsString;
    nome_cli_orc     := buscas.FieldByName('nome_cliente').AsString;
    data_estoque     := vDadosIni.FusoDate(True);

    ativo            := 1;
  end;

  if APedVenda.cod_cliente > 0 then
  begin
    with SqlOpen(
      'select cl.cod_cliente, cl.nome_cliente, cl.razao, cl.cpfcgc, cl.fone_cliente, cl.email, cl.endereco, ' +
      ' cl.num_end_cliente, cl.complemento, cl.bairro, cl.cidade, cl.cep, ' +
      ' cid.ibge_cod_cidade, es.sigla_uf, es.nome_uf, es.ibge_codigo_uf' +
      ' from clientes cl' +
      ' left join cidades cid on cid.cod_cidade = cl.cod_cidade' +
      //' left join cidades_ibge cib on cib.codigo_mun_ibge = cid.ibge_cod_cidade' +
      ' left join estados es on es.codigo_uf = cl.codigo_uf' +
      ' where cl.cod_cliente = ' + IntToStr(APedVenda.cod_cliente) +
      ' and cl.cod_empresa = ' + vDadosIni.codEmpresa) do
      with APedVenda.Cliente do
      begin
        Codigo                      := FieldByName('cod_cliente').AsInteger;
        NomeFantasia                := Trim(FieldByName('nome_cliente').AsString);
        RazaoSocial                 := Trim(FieldByName('razao').AsString);
        cpfcnpj                     := Trim(FieldByName('cpfcgc').AsString);
        endereco.Logradouro         := Trim(FieldByName('endereco').AsString);
        endereco.Numero             := Trim(FieldByName('num_end_cliente').AsString);
        endereco.Complemento        := Trim(FieldByName('complemento').AsString);
        endereco.Bairro             := Trim(FieldByName('bairro').AsString);
        endereco.Cidade.Nome        := Trim(FieldByName('cidade').AsString);
        endereco.Cidade.IBGE_Cidade := FieldByName('ibge_cod_cidade').AsInteger;
        endereco.Cidade.UF          := Trim(FieldByName('sigla_uf').AsString);
        endereco.Cidade.Estado      := Trim(FieldByName('nome_uf').AsString);
        endereco.Cidade.IBGE_Estado := FieldByName('ibge_codigo_uf').AsInteger;
        endereco.CEP                := Trim(FieldByName('cep').AsString);
        telefone                    := Trim(FieldByName('fone_cliente').AsString);
        email                       := Trim(FieldByName('email').AsString);
//        endereco := FieldByName('endereco').AsString +
//                    IfThen(Trim(FieldByName('endereco').AsString) <> '', ' ' + Trim(FieldByName('endereco').AsString)) +
//                    IfThen(Trim(FieldByName('complemento').AsString) <> '', ' ' + Trim(FieldByName('complemento').AsString)) +
//                    IfThen(Trim(FieldByName('bairro').AsString) <> '', ', ' + Trim(FieldByName('bairro').AsString)) +
//                    IfThen(Trim(FieldByName('cidade').AsString) <> '', ', ' + Trim(FieldByName('cidade').AsString)) +
//                    IfThen(Trim(FieldByName('cep').AsString) <> '', ' - ' + Trim(FieldByName('cep').AsString));
      end;
  end;

  queryCons
    .Open('select ni.*, pr.comissao_prod, pr.comissao_prod_ger, pr.isento_prod, pr.peso_liq_prod, pr.peso_brut_prod ' +
    ' from nfce_item ni' +
    ' left join produtos pr on pr.grupo_prod = ni.grupo_prod and pr.cod_prod = ni.cod_prod and pr.cod_empresa = ni.cod_empresa' +
    ' left join nat_op np on np.codigo_nop = ni.cfop' +
    ' where ni.cod_nfce = ' + IntToStr(ACodNFC) +
    ' and ni.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ni.tipo_item = ' + QuotedStr('P') +
    ' order by ni.seqid');

  buscas.First;
  while not buscas.Eof do
  begin
    if buscas.FieldByName('altera_estoque_cfop').AsString <> 'N' then
    with APedVenda.Prod.New do
    begin
      grupo_prod      := buscas.FieldByName('grupo_prod').AsInteger;
      cod_prod        := buscas.FieldByName('cod_prod').AsString;
      nitem           := buscas.FieldByName('nitem').AsInteger;
      cod_grade       := buscas.FieldByName('cod_grade').AsInteger;
      codigo_nop      := buscas.FieldByName('cfop').AsFloat;
      num_fab_prod    := buscas.FieldByName('num_fab_prod').AsString;
      descr_prod_ped  := buscas.FieldByName('xprod').AsString;
      quant_ped_item  := buscas.FieldByName('qcom').AsFloat;
      vlun_ped_item   := buscas.FieldByName('vuncom').AsFloat;
      vltot_ped_item  := RoundTo(buscas.FieldByName('vprod').AsFloat, -2);
      vlun_orig       := vlun_ped_item;
      vlun_ped_nf     := vlun_ped_item;
      rateio_desc     := RoundTo(buscas.FieldByName('vdesc').AsFloat, -2);
      rateio_acresc   := RoundTo(buscas.FieldByName('vseg').AsFloat +
                         buscas.FieldByName('voutro').AsFloat +
                         buscas.FieldByName('vfrete').AsFloat, -2);
      comiss_prod     := RoundTo((buscas.FieldByName('comissao_prod').AsFloat     * (vltot_ped_item - rateio_desc)) / 100, -2);// aqui nao entra seguro, frete, nem outras despesas
      comiss_prod_ger := RoundTo((buscas.FieldByName('comissao_prod_ger').AsFloat * (vltot_ped_item - rateio_desc)) / 100, -2);// aqui nao entra seguro, frete, nem outras despesas
      pcust_c         := buscas.FieldByName('prec_cus_prod').AsFloat;
      pcust_mc        := buscas.FieldByName('prec_cusm_prod').AsFloat;
      cod_vendedor    := ACodVendedor;
      data_transf     := vDadosIni.FusoDate();
      nome_vend       := ANomeVend;
      vlo_unitario    := vlun_ped_item;
      data_inclusao   := DateOf(vDadosIni.vDataHora);
      nitem_nf        := buscas.FieldByName('seqid').AsInteger;
      vl_desp_nf      := rateio_acresc;
      unidade         := buscas.FieldByName('ucom').AsString;
      icm_prod        := buscas.FieldByName('icm_picms').AsFloat;
      sit_trib        := IfThen((icm_prod > 0), 'T') +
                         IfThen((icm_prod = 0) and (buscas.FieldByName('ISENTO_PROD').AsString = 'S'), 'I', 'F');
      vltot_ped_nf    := vltot_ped_item;
      unidade_conv    := queryCons.fstr('uvnd');
      peso_liq_prod   := buscas.FieldByName('peso_liq_prod').AsFloat;
      peso_brut_prod  := buscas.FieldByName('peso_brut_prod').AsFloat;

      if queryCons.fstr('uvnd') <> queryCons.fstr('ucom') then
      begin
        operacao_conv := IfThen(queryCons.ffloat('uvnd_fator') > 1, 'M', 'D');
        if queryCons.ffloat('uvnd_fator') > 1 then
          fator_conv  := queryCons.ffloat('uvnd_fator')
        else if queryCons.ffloat('uvnd_fator') > 0 then
          fator_conv  := 1 / queryCons.ffloat('uvnd_fator')
        else
          fator_conv  := 1;
    	end;

      ativo           := 1;
    end;
    buscas.Next;
  end;


//  SqlOpen('select ni.*, pr.comissao_prod, pr.comissao_prod_ger, pr.isento_prod' +
//    ' from nfce_item ni' +
//    ' left join produtos pr on pr.grupo_prod = ni.grupo_prod and pr.cod_prod = ni.cod_prod and pr.cod_empresa = ni.cod_empresa' +
//    ' left join nat_op np on np.codigo_nop = ni.cfop' +
//    ' where ni.cod_nfce = ' + IntToStr(ACodNFC) +
//    ' and ni.cod_empresa = ' + vDadosIni.codEmpresa +
//    ' and ni.tipo_item = ' + QuotedStr('P') +
//    ' order by ni.seqid');

//  buscas.First;
//  while not buscas.Eof do
//  begin
//    if buscas.FieldByName('altera_estoque_cfop').AsString <> 'N' then
//    with APedVenda.Prod.New do
//    begin
//
//    end;
//    buscas.Next;
//  end;

  buscas.Close;

  Result := APedVenda;

end;

function TNFCe.PedVenda_GetFromPedVenda(ANPed: Integer; ATipo: string): TReg_PedVenda;
var
  APedVenda: TReg_PedVenda;
  ACampos: TStringList;
  slPP, slPF: TStringListHw;
  ASql: string;
  I: Integer;
begin
  if (ANPed = 0) or (not vDadosIni.strIn(ATipo, ['REQ', 'OS'])) then
  begin
    Result := nil;
    Exit;
  end;

  APedVenda := TReg_PedVenda.create;
  ACampos   := APedVenda.GetCamposDaTabela;
  ASql := '';
  for I := 0 to ACampos.Count - 1 do
    ASql := ASql + IfThen(I > 0, ', ', 'select ') + ACampos[I];

  if SqlOpen(ASql + ' from pedvenda' +
    ' where nped = ' + IntToStr(ANPed) +
    ' and tipo = ' + QuotedStr(ATipo) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa).IsEmpty then
  begin
    FreeAndNil(APedVenda);
    Result := APedVenda;
    Exit;
  end;

  with APedVenda do
  begin
    cod_nfce         := buscas.FieldByName('cod_nfce').AsInteger;
    num_nfce         := buscas.FieldByName('num_nfce').AsInteger;
    nped             := buscas.FieldByName('nped').AsInteger;
    tipo             := buscas.FieldByName('tipo').AsString;
    cod_cliente      := buscas.FieldByName('cod_cliente').AsInteger;
    cod_vendedor     := buscas.FieldByName('cod_vendedor').AsInteger;
    valor_total      := buscas.FieldByName('valor_total').AsFloat;
    cod_cond_pag     := buscas.FieldByName('cod_cond_pag').AsInteger;
    data_ped         := buscas.FieldByName('data_ped').AsDateTime;
    cod_us_fech      := buscas.FieldByName('cod_us_fech').AsInteger;
    data_fech        := buscas.FieldByName('data_fech').AsDateTime;
    hora_fech        := buscas.FieldByName('hora_fech').AsString;
    desc_p_prod      := buscas.FieldByName('desc_p_prod').AsFloat;
    desc_p_serv      := buscas.FieldByName('desc_p_serv').AsFloat;
    desconto         := buscas.FieldByName('desconto').AsFloat;
    obs_ped          := buscas.FieldByName('obs_ped').AsString;
    status_ped       := buscas.FieldByName('status_ped').AsString;
    tipv             := buscas.FieldByName('tipv').AsString;
    obs_cxl_rq       := buscas.FieldByName('obs_cxl_rq').AsString;
    vl_pago_cxl      := buscas.FieldByName('vl_pago_cxl').AsFloat;
    tipor            := buscas.FieldByName('tipor').AsString;
    horaabertura     := buscas.FieldByName('horaabertura').AsInteger;
    minabertura      := buscas.FieldByName('minabertura').AsInteger;
    horafechamento   := buscas.FieldByName('horafechamento').AsInteger;
    minfechamento    := buscas.FieldByName('minfechamento').AsInteger;
    vl_entrada       := buscas.FieldByName('vl_entrada').AsFloat;
    nprevenda        := buscas.FieldByName('nprevenda').AsInteger;
    acresc_p_prod    := buscas.FieldByName('acresc_p_prod').AsFloat;
    acresc_p_serv    := buscas.FieldByName('acresc_p_serv').AsFloat;
    acrescimo        := buscas.FieldByName('acrescimo').AsFloat;
    tot_prod         := buscas.FieldByName('tot_prod').AsFloat;
    tot_serv         := buscas.FieldByName('tot_serv').AsFloat;
    cpfcgc           := buscas.FieldByName('cpfcgc').AsString;
    libtrava         := buscas.FieldByName('libtrava').AsString;
    subtipo_os       := buscas.FieldByName('subtipo_os').AsString;
    aprovada_gerente := buscas.FieldByName('aprovada_gerente').AsString;
    nome_clientedav  := buscas.FieldByName('nome_clientedav').AsString;
    nome_cli_orc     := buscas.FieldByName('nome_cli_orc').AsString;
    data_libtrava    := buscas.FieldByName('data_libtrava').AsDateTime;
    md5              := buscas.FieldByName('md5').AsString;
    saveauto         := buscas.FieldByName('saveauto').AsString;
    calc             := buscas.FieldByName('calc').AsString;
    data_estoque     := buscas.FieldByName('data_estoque').AsDateTime;
    status_cxl_rq    := buscas.FieldByName('status_cxl_rq').AsString;
    op_cxl           := buscas.FieldByName('op_cxl').AsInteger;
    dia_cxl          := buscas.FieldByName('dia_cxl').AsDateTime;
    id_commerce      := buscas.FieldByName('id_commerce').AsInteger;
  end;
  FreeAndNil(ACampos);

  if APedVenda.cod_cliente > 0 then
  begin

    if APedVenda.cod_cliente = FConfigNFCe.CodigoClientePadrao then
      SqlOpen('select cod_cliente, nome_clientedav nome_cliente, nome_clientedav razao,' +
                 ' cpfcgc, '' '' fone_cliente, '' '' email, end_avl endereco, ' +
      ' '' '' num_end_cliente, '' '' complemento, bairro_avl bairro, cida_avl cidade, '' '' cep' +
      ' from pedvenda' +
      ' where nped = ' + IntToStr(ANPed) +
      ' and tipo = ' + QuotedStr(ATipo) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa)
    else
      SqlOpen(
        'select cod_cliente, nome_cliente, razao, cpfcgc, fone_cliente, email, endereco, ' +
        ' num_end_cliente, complemento, bairro, cidade, cep' +
        ' from clientes' +
        ' where cod_cliente = ' + IntToStr(APedVenda.cod_cliente) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa);

    if APedVenda.cod_cliente = FConfigNFCe.CodigoClientePadrao then
      SqlOpen('select pv.cod_cliente, pv.nome_clientedav nome_cliente, pv.nome_clientedav razao,' +
        ' pv.cpfcgc, '' '' fone_cliente, '' '' email, pv.end_avl endereco, ' +
        ' '' '' num_end_cliente, '' '' complemento, pv.bairro_avl bairro, pv.cida_avl cidade, pv.cep_avl cep,' +
        ' 9 nfe_indiedest, ''N'' iss_retido, cid.ibge_cod_cidade, pv.esta_avl sigla_uf,' +
        ' es.nome_uf, es.ibge_codigo_uf' +
        ' from pedvenda pv' +
        ' left join cidades cid on cid.nome_cidade = pv.cida_avl' +
        ' left join cidades_ibge cib on cib.codigo_mun_ibge = cid.ibge_cod_cidade' +
        ' left join estados es on es.ibge_codigo_uf = cib.codigo_uf_ibge' +
        ' where pv.nped = ' + IntToStr(ANPed) +
        ' and pv.tipo = ' + QuotedStr(ATipo) +
        ' and pv.cod_empresa = ' + vDadosIni.codEmpresa)
    else
      SqlOpen(
        'select cl.cod_cliente, cl.nome_cliente, cl.razao, cl.cpfcgc, cl.fone_cliente, cl.email, cl.endereco, ' +
        ' cl.num_end_cliente, cl.complemento, cl.bairro, cl.cidade, cl.cep, cl.nfe_indiedest, cl.iss_retido,' +
        ' cid.ibge_cod_cidade, es.sigla_uf, es.nome_uf, es.ibge_codigo_uf' +
        ' from clientes cl' +
        ' left join cidades cid on cid.cod_cidade = cl.cod_cidade' +
        ' left join estados es on es.codigo_uf = cl.codigo_uf' +
        ' where cl.cod_cliente = ' + IntToStr(APedVenda.cod_cliente) +
        ' and cl.cod_empresa = ' + vDadosIni.codEmpresa);

    with buscas do
      with APedVenda.Cliente do
      begin
        Codigo                      := FieldByName('cod_cliente').AsInteger;
        NomeFantasia                := Trim(FieldByName('nome_cliente').AsString);
        RazaoSocial                 := Trim(FieldByName('razao').AsString);
        cpfcnpj                     := Trim(FieldByName('cpfcgc').AsString);
        endereco.Logradouro         := Trim(FieldByName('endereco').AsString);
        endereco.Numero             := Trim(FieldByName('num_end_cliente').AsString);
        endereco.Complemento        := Trim(FieldByName('complemento').AsString);
        endereco.Bairro             := Trim(FieldByName('bairro').AsString);
        endereco.Cidade.Nome        := Trim(FieldByName('cidade').AsString);
        endereco.Cidade.IBGE_Cidade := FieldByName('ibge_cod_cidade').AsInteger;
        endereco.Cidade.UF          := Trim(FieldByName('sigla_uf').AsString);
        endereco.Cidade.Estado      := Trim(FieldByName('nome_uf').AsString);
        endereco.Cidade.IBGE_Estado := FieldByName('ibge_codigo_uf').AsInteger;
        endereco.CEP                := Trim(FieldByName('cep').AsString);
        telefone                    := Trim(FieldByName('fone_cliente').AsString);
        email                       := Trim(FieldByName('email').AsString);
        {
        Codigo := FieldByName('cod_cliente').AsInteger;
        NomeFantasia := FieldByName('nome_cliente').AsString;
        RazaoSocial := FieldByName('razao').AsString;
        cpfcnpj := FieldByName('cpfcgc').AsString;
        endereco := FieldByName('endereco').AsString +
                    IfThen(Trim(FieldByName('endereco').AsString) <> '', ' ' + Trim(FieldByName('endereco').AsString)) +
                    IfThen(Trim(FieldByName('complemento').AsString) <> '', ' ' + Trim(FieldByName('complemento').AsString)) +
                    IfThen(Trim(FieldByName('bairro').AsString) <> '', ', ' + Trim(FieldByName('bairro').AsString)) +
                    IfThen(Trim(FieldByName('cidade').AsString) <> '', ', ' + Trim(FieldByName('cidade').AsString)) +
                    IfThen(Trim(FieldByName('cep').AsString) <> '', ' - ' + Trim(FieldByName('cep').AsString));
        telefone := FieldByName('fone_cliente').AsString;
        email := FieldByName('email').AsString;
        }
      end;
  end;
  slPP := StringsUtils.New(TPedVendaProd_Model.GetFieldsSql(), ',');
  try
    slPF := StringsUtils.New(TPedVendaProdUndVenda_Model.GetFieldsSql(), ',').Except_(slPP);
    try

      queryCons.Table('pedvenda_prod_fator pf')
        .Fields(slPP.ToArray(), 'pp')
        .Fields(slPF.ToArray(), 'pf')
        .Join('pedvenda_prod pp',
              '(pf.nped = pp.nped) and (pf.tipo = pp.tipo) and (pf.grupo_prod = pp.grupo_prod) and (pf.cod_prod = pp.cod_prod) and (pf.nitem = pp.nitem) and (pf.cod_empresa = pp.cod_empresa) and (pf.cod_grade = pp.cod_grade) and (pf.codigo_nop = pp.codigo_nop)' +
              ' and (coalesce(pp.status, '''') <> ''CANCELADO'')',
              sqInner)
        .Equals('pf.nped', ANPed)
        .Equals('pf.tipo', ATipo)
        .Equals('pf.cod_empresa', vDadosIni.cod_empresa)
        .OrderBy('pf.nitem')
        .Open();

    finally
      slPF.Free;
    end;
  finally
    slpp.Free;
  end;

  APedVenda.Prod.CopyFrom(TPedVendaProdUndVenda_Model, queryCons.query, False);

  {
  ACampos   := APedVenda.Prod.GetCamposDaTabela;
  ASql := '';
  for I := 0 to ACampos.Count - 1 do
    ASql := ASql + IfThen(I > 0, ', ', 'select ') + ACampos[I];

  SqlOpen(ASql + ' from pedvenda_prod' +
    ' where nped = ' + IntToStr(ANPed) +
    ' and tipo = ' + QuotedStr(ATipo) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and coalesce(status, '''') <> ''CANCELADO'' ' +
    ' order by nitem');

  buscas.First;
  while not buscas.Eof do
  begin
    with APedVenda.Prod.New do
    begin
      grupo_prod      := buscas.FieldByName('grupo_prod').AsInteger;
      cod_prod        := buscas.FieldByName('cod_prod').AsString;
      nitem           := buscas.FieldByName('nitem').AsInteger;
      cod_grade       := buscas.FieldByName('cod_grade').AsInteger;
      codigo_nop      := buscas.FieldByName('codigo_nop').AsFloat;
      num_fab_prod    := buscas.FieldByName('num_fab_prod').AsString;
      descr_prod_ped  := buscas.FieldByName('descr_prod_ped').AsString;
      quant_ped_item  := buscas.FieldByName('quant_ped_item').AsFloat;
      vlun_ped_item   := buscas.FieldByName('vlun_ped_item').AsFloat;
      vltot_ped_item  := RoundTo(buscas.FieldByName('vltot_ped_item').AsFloat, -2);
      vlun_orig       := buscas.FieldByName('vlun_orig').AsFloat;
      vlun_ped_nf     := buscas.FieldByName('vlun_ped_nf').AsFloat;
      rateio_desc     := RoundTo(buscas.FieldByName('rateio_desc').AsFloat, -2);
      rateio_acresc   := RoundTo(buscas.FieldByName('rateio_acresc').AsFloat, -2);
      ratdsas         := buscas.FieldByName('ratdsas').AsFloat;
      comiss_prod     := buscas.FieldByName('comiss_prod').AsFloat;
      comiss_prod_ger := buscas.FieldByName('comiss_prod_ger').AsFloat;
      pcust_c         := buscas.FieldByName('pcust_c').AsFloat;
      pcust_mc        := buscas.FieldByName('pcust_mc').AsFloat;
      tp_nf_ped       := buscas.FieldByName('tp_nf_ped').AsString;
      sit_atd         := buscas.FieldByName('sit_atd').AsString;
      desc_item       := buscas.FieldByName('desc_item').AsFloat;
      acresc_item     := buscas.FieldByName('acresc_item').AsFloat;
      cod_vendedor    := buscas.FieldByName('cod_vendedor').AsInteger;
      data_transf     := buscas.FieldByName('data_transf').AsDateTime;
      nome_vend       := buscas.FieldByName('nome_vend').AsString;
      vlo_unitario    := buscas.FieldByName('vlo_unitario').AsFloat;
      data_inclusao   := buscas.FieldByName('data_inclusao').AsDateTime;
      tp_descacres    := buscas.FieldByName('tp_descacres').AsString;
      nat_descacres   := buscas.FieldByName('nat_descacres').AsString;
      valor_descacres := buscas.FieldByName('valor_descacres').AsFloat;
      nitem_nf        := buscas.FieldByName('nitem_nf').AsInteger;
      xped_compra     := buscas.FieldByName('xped_compra').AsString;
      nitemped_compra := buscas.FieldByName('nitemped_compra').AsInteger;
      vl_desp_nf      := buscas.FieldByName('vl_desp_nf').AsFloat;
      unidade         := buscas.FieldByName('unidade').AsString;
      icm_prod        := buscas.FieldByName('icm_prod').AsFloat;
      sit_trib        := buscas.FieldByName('sit_trib').AsString;
      md5             := buscas.FieldByName('md5').AsString;
      vltot_ped_nf    := buscas.FieldByName('vltot_ped_nf').AsFloat;
      tabpraticada    := buscas.FieldByName('tabpraticada').AsString;
      precoporqtde    := buscas.FieldByName('precoporqtde').AsString;
    end;

    buscas.Next;
  end;
  }

  SqlOpen(
    ' select fp.seqform, fp.ndoc, fp.tipdoc, fp.cod_controle, fp.n_aut_cart, fp.data_mov, fp.prcss,' +
    ' ctrl.nfce_tpag, ctrl.nfce_tband, ctrl.nome_ctrl, ctrl.docs,' +
    ' ctrl.cartao_sped_part, cl.cpfcgc, fp.guid_tr_cartao, tr.seqid idtrcartao,' +
    ' fp.valordoc' +
    ' from formpagamento fp' +
    ' left join controles ctrl on ctrl.codigo_ctrl = fp.cod_controle and ctrl.codigo_emp = fp.cod_empresa' +
    ' left join clientes cl on cl.cod_cliente = ctrl.cartao_sped_part and cl.cod_empresa = ctrl.codigo_emp' +
    ' left join transacao_cartao tr on tr.guidt = fp.guid_tr_cartao and tr.guidt is not null' +
    ' where fp.nrequisicao = ' + IntToStr(ANPed) +
    ' and fp.tpdocs = ' + QuotedStr(ATipo) +
    ' and fp.cod_empresa = ' + vDadosIni.codEmpresa +
    ' order by 1');

  buscas.First;
  while not buscas.Eof do
  begin
    with APedVenda.Pagamento.New do
    begin
      seqform                    := buscas.FieldByName('seqform').AsInteger;
      ndoc                       := buscas.FieldByName('ndoc').AsString;
      tipdoc                     := buscas.FieldByName('tipdoc').AsString;
      valordoc                   := RoundTo(buscas.FieldByName('valordoc').AsFloat, -2);
      n_aut_cart                 := buscas.FieldByName('n_aut_cart').AsString;
      data_mov                   := buscas.FieldByName('data_mov').AsDateTime;
      prcss                      := buscas.FieldByName('n_aut_cart').AsString;
      guidTrCartao               := buscas.FieldByName('guid_tr_cartao').AsString;
      idTrCartao                 := buscas.FieldByName('idtrcartao').AsInteger;
      Controle.codigo_ctrl       := buscas.FieldByName('cod_controle').AsInteger;
      Controle.nome_ctrl         := buscas.FieldByName('nome_ctrl').AsString;
      Controle.docs              := buscas.FieldByName('docs').AsString;
      Controle.nfce_tpag         := buscas.FieldByName('nfce_tpag').AsInteger;
      Controle.nfce_tband        := buscas.FieldByName('nfce_tband').AsInteger;
      Controle.AdmCartao.Codigo  := buscas.FieldByName('cartao_sped_part').AsInteger;
      Controle.AdmCartao.cpfcnpj := Trim(buscas.FieldByName('cpfcgc').AsString);
    end;
    buscas.Next;
  end;
  buscas.Close;

  Result := APedVenda;

end;

function TNFCe.PedVenda_PermiteCancelameto(APedVenda: TReg_PedVenda): Boolean;
var
  I: Integer;
  msg: string;
begin
  if not Assigned(APedVenda) then
  begin
    Result := True;
    Exit;
  end
  else
    Result := False;

  if (APedVenda.op_cxl > 0) then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select status_cxl from FECD_CXL' +
      ' where OP_CXL = ' + IntToStr(APedVenda.op_cxl) +
      ' and dia_f_cxl = :dia_f_cxl' +
      ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
    buscas.ParamByName('dia_f_cxl').AsDate := DateOf(APedVenda.dia_cxl);
    buscas.Open;

    if (Trim(buscas.FieldByName('STATUS_CXL').AsString) = 'FECHADO') or (buscas.IsEmpty) then
    begin
      vDadosIni.ShowAtencao(
        'Venda com recebimento no Caixa Auxiliar' + sLineBreak +
        'Dia movimento: ' + FormatDateTime('dd/mm/yyyy', APedVenda.dia_cxl) + sLineBreak +
        'Operador: ' + IntToStr(APedVenda.op_cxl) + ' - ' +
                       SqlOpen('select nome_vendedor from colaborador' +
                               ' where cod_vendedor = ' + IntToStr(APedVenda.op_cxl) +
                               ' and cod_empresa = ' + vDadosIni.codEmpresa
                               ).FieldByName('nome_vendedor').AsString,
        MB_ICONEXCLAMATION + MB_OK);
      if not vDadosIni.PesqPros('VND088', 'LIBERAR', APedVenda.tipo + ':' +
        IntToStr(APedVenda.nped), 'PEDVENDA', IntToStr(APedVenda.nped), nil, True, True) then
        Exit;
    end
    else
    begin
      msg := 'Venda com recebimento no Caixa Auxiliar' + sLineBreak +
             'Dia movimento: ' + FormatDateTime('dd/mm/yyyy', APedVenda.dia_cxl) + sLineBreak +
             'Operador: ' + IntToStr(APedVenda.op_cxl) + ' - ' +
                                     SqlOpen('select nome_vendedor from colaborador' +
                                     ' where cod_vendedor = ' + IntToStr(APedVenda.op_cxl) +
                                     ' and cod_empresa = ' + vDadosIni.codEmpresa
                                     ).FieldByName('nome_vendedor').AsString + sLineBreak + sLineBreak +
            'Peça ao operador para cancelar primeiro o recebimento';

      if ProcessandoLote then
        SetLastError(msg)
      else
        ShowAtencao(msg);
      Exit;
    end
  end;

  for I := 0 to APedVenda.Pagamento.Count - 1 do
    if APedVenda.Pagamento.Items[I].prcss = 'S' then
    begin
      vDadosIni.ShowAtencao('Forma de Pagamento da Venda já processada pelo Financeiro.');
      if not vDadosIni.PesqPros('VND126', 'LIBERAR', APedVenda.tipo + ':' +
        IntToStr(APedVenda.nped), 'PEDVENDA', IntToStr(APedVenda.nped), nil, True, True) then
        Exit;
    end;

  Result := True;
end;

procedure TNFCe.ImprimirTransacaoCartao;
var
  impressao: TStrings;
  txt: string;
begin
  SqlOpen('select distinct np.cod_nfce, tr.impressao from transacao_cartao tr' +
          ' inner join nfce_pagamento np on np.guid_tr_cartao = tr.guidt and np.cod_empresa = tr.cod_empresa and tr.status = ''A'' ' +
//          ' inner join nfce_pagamento np on np.id_tr_cartao = tr.seqid and np.cod_empresa = tr.cod_empresa and tr.status = ''A'' ' +
          ' where np.cod_nfce = %d and np.cod_empresa = %d order by tr.seqid', [fint('cod_nfce'), vDadosIni.cod_empresa]);

  if buscas.IsEmpty then
    Exit;

  impressao := NewStringList();
  try
    while not buscas.Eof do
    begin
      impressao.Text := impressao.Text + buscas.FieldByName('impressao').AsString;
      buscas.Next;
    end;

    if impressao.Count = 0 then
      Exit;

    //if Processamento.ImpressoraNaoFiscal and (vDadosIni.vModoImpressao.PosPrinter <> '') then
    if Processamento.ImpressoraNaoFiscal then
    begin
      txt := vdadosIni.PosVirtualGetComprovantes(impressao.Text, true);

      if ConfigNFCe.AgentValid then
      begin
        if not cloud_agente_print_text(WideString(txt), WideString(ConfigNFCe.GetAgentPrintParams)) then
          ShowErro(string(cloud_agente_last_error));
      end
      else
      begin
        if HwPosPrintFromText(WideString(txt),
                              WideString(IfThen(ConfigNFCe.IsLocalAgent, ConfigNFCe.AgenteNF.ArquivoIniPosPrinterNaoFiscal, ConfigNFCe.Padrao.ArquivoIniPosPrinterNaoFiscal)), 1) = 0 then
          ShowErro(string(HwPosUltimoErro));
      end
    end
    else
    begin

      try
        if vDadosIni.vModoImpressao.vLinhasImpressao = nil then
          vDadosIni.vModoImpressao.vLinhasImpressao := TStringList.Create;

        vDadosIni.vModoImpressao.vLinhasImpressao.Text := vdadosIni.PosVirtualGetComprovantes(impressao.Text);
        vDadosIni.vModoImpressao.TxtNaoFiscal := vdadosIni.PosVirtualGetComprovantes(impressao.Text, true);

        vDadosIni.abreFormCadastro('pkPedidoVenda', 'TfrmImpressaoNaECF');
      finally
        Auditor.Tabela := TableName;
      end;

    end;
  finally
    impressao.Free;
  end;
end;

function TNFCe.Imprimir(): Boolean;
var
  Retorno: Integer;
begin
  Result := False;
  try
    try
      if not vDadosIni.PesqPros('NFC013', 'IMPRIMIR', Audit_Dados ,
        'NFCE', Audit_Codigo) then
        exit;

      ClearProcessamento;
      Processamento.Acao := actImprimir;
      Processamento.CodNFC := dataSet.FieldByName('cod_nfce').AsInteger;
      Processamento.CodEmpresa := dataSet.FieldByName('cod_empresa').AsInteger;

      buscas.Close;
      buscas.SQL.Text := 'select situacao_nfce, tpemis from nfce' +
        ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
        ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa);
      buscas.Open;

      Processamento.ViaCancelamento := buscas.FieldByName('situacao_nfce').AsString = sitCancelada;

      if not vDadosIni.strIn(Trim(buscas.FieldByName('situacao_nfce').AsString), [sitAutorizada, sitCancelada]) then
        if (Trim(buscas.FieldByName('tpemis').AsString) <> '9') then
        begin
          if EmissaoRapida then
            raiseExceptionCreate('Sem impressão para NFCe %s %s', [fstr('status'), fstr('situacao_nfce')]);

          Application.MessageBox(PChar('Impressão não disponível para situação atual do documento' + sLineBreak +
            'A NFC-e deve estar Autorizada, Cancelada ou emitida em Contingência') , 'Confirmação', 0+ 64);
          Exit;
        end;

  //    if not vDadosIni.strIn(Trim(buscas.FieldByName('situacao_nfce').AsString), [sitAutorizada, sitCancelada, sitInutilizada]) then
  //      if Trim(buscas.FieldByName('tpemis').AsString) <> '9' then
  //      begin
  //        Application.MessageBox(PChar('Impressão não disponível para situação atual do documento' + sLineBreak +
  //          'A NFC-e deve estar Autorizada, Inutilizada, Cancelada ou emitida em Contingência') , 'Confirmação', 0+ 64);
  //        Exit;
  //      end;

      if not EmissaoRapida then
      begin
      Application.CreateForm(TfrmNFCeDadosEmissao, frmNFCeDadosEmissao);
      frmNFCeDadosEmissao.ANFCe := Self;
      if frmNFCeDadosEmissao.ShowModal <> IDOK then
        Exit;
      end;

      if (Trim(buscas.FieldByName('situacao_nfce').AsString) = sitAutorizada) or
      (Trim(buscas.FieldByName('situacao_nfce').AsString) = sitCancelada) or
        (Trim(buscas.FieldByName('tpemis').AsString) = '9') then
      begin
        Result := ImprimirNFCe;
      end
      else if Trim(buscas.FieldByName('situacao_nfce').AsString) = sitInutilizada then
      begin
        DLLNFC.LoadDLL;
        Retorno := DLLNFC.nfce_client_imprimir_inutilizacao(Processamento.CodNFC, Processamento.CodEmpresa, PChar(vDadosIni.vNFConsumidor.token));
        if Retorno = 0 then
          raiseExceptionCreate(string(DLLNFC.nfce_client_retorna_ultimo_erro), '')
        else
          Result := True;
      end;

     if Result  then
       vDadosIni.GravaAuditoria('NFC013', 'IMPRIMIR', Audit_Dados, 'NFCE', Audit_Codigo, buscas);

     dataSet.RefreshRecord;

    except
      on E: Exception do
      begin
        Result := false;
        SetLastMessage('Erro ao Imprimir NFC-e. Erro: ' + e.Message, False);
        registraErro('TNFCe.Imprimir Erro: ' + e.Message);
      end;
    end;
  finally
  end;
end;

function TNFCe.ImprimirNFCe: Boolean;
var
  Retorno: Integer;
  ServidorRecebeu: Boolean;
  NFCeImpressa: Boolean;
  TimeOutAtingido: Boolean;
begin
  Result := False;
  try
    vDadosIni.abreStatusProcessamento('Imprimindo NFC', 'Validando dados', True);

    try

      buscas.Close;
      buscas.SQL.Text := 'select situacao_nfce, tpemis from nfce' +
        ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
        ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa);
      buscas.Open;

      if not vDadosIni.strIn(Trim(buscas.FieldByName('situacao_nfce').AsString), [sitAutorizada, sitCancelada, sitInutilizada]) then
        if Trim(buscas.FieldByName('tpemis').AsString) <> '9' then
        begin
          Application.MessageBox(PChar('Impressão não disponível para situação atual do documento' + sLineBreak +
            'A NFC-e deve estar Autorizada, Inutilizada, Cancelada ou emitida em Contingência') , 'Confirmação', 0+ 64);
          Exit;
        end;

      ServidorRecebeu := False;
      TimeOutAtingido := False;
      NFCeImpressa   := ProcessarNFCe(actImprimir, TimeOutAtingido, ServidorRecebeu);

      if not NFCeImpressa then
        if TimeOutAtingido then
          if vDadosIni.vNFConsumidor.UsaServidorImpressao then
            Application.MessageBox('NFC atingiu o limite de tentativas de envio de Impressão', 'Atenção', 0 + 64)
          else if not ServidorRecebeu then
            Application.MessageBox(PChar('Servidor de Impressão da NFC não recebeu a solicitação' + sLineBreak + sLineBreak +
              'Por favor contacte o suporte para solucionar o problema!'), 'Atenção', 0 + 64)
          else
            Application.MessageBox('Servidor de Impressão da NFC esta processando a sua solicitação, porém a Impressora não está respondendo',
              'Atenção', 0 + 64);

      Result := NFCeImpressa;

    except
      on E: Exception do
      begin
        Result := false;
        Application.MessageBox(pchar('Erro ao ImprimirNFCe NFC-e. Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('TNFCe.ImprimirNFCe Erro: ' + e.Message);
      end;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TNFCe.insert: boolean;
var
  SeqPrecoPadrao: string;
begin
  Result := False;

  if not vDadosIni.PesqPros('NFC009', 'INSERIR', '',
    'NFCE', '') then
    exit;

  MemorizarRegistro;
  if not dataSet.Active then
    AbreRegistros(0);

  LerConfigNFCe;

  if SqlOpen('select cod_cliente from clientes' +
             ' where cod_cliente = ' + IntToStr(FConfigNFCe.CodigoClientePadrao) +
             ' and cod_empresa = ' + vDadosIni.codEmpresa).IsEmpty then
  begin
    SetLastMessage('Cliente padrão não configurado ou não encontrado' + sLineBreak +
                   'Código configurado: ' + IntToStr(FConfigNFCe.CodigoClientePadrao) + sLineBreak + sLineBreak +
                       'Configure antes de continuar');
    Exit;
  end;

  if SqlOpen('select SERIE_NFCE, SERIE_NFCE_OFF, TOKEN from nfc_emissor' +
             ' where cod_emissor = ' + IntToStr(vDadosIni.vNFConsumidor.CodEmissor) +
             ' and cod_empresa = ' + vDadosIni.codEmpresa).IsEmpty then
  begin
    SetLastMessage('Sem emissor configurado para este usuário. Configure antes de continuar');
    Exit;
  end;

  if (not vDadosIni.vNFConsumidor.UsaServidorAutorizacao) and
     (not vDadosIni.vNFConsumidor.UsaServidorImpressao) and
     (not vDadosIni.vNFConsumidor.UsaServidorEmail) and
     (vDadosIni.vNFConsumidor.UsarSessaoUsuario) then
    if Trim(buscas.FieldByName('token').AsString) <> Trim(vDadosIni.vNFConsumidor.token) then
    begin
      SetLastMessage('Token inválido. Necessário logar novamente!' + sLineBreak + sLineBreak +
                         'Isso normalmente ocorre quando se utiliza o mesmo usuario do sistema em computadores' +
                         ' diferentes ou mais de uma instancia do sistema');
      Exit;
    end;

  if Assigned(Orcamento) then FreeAndNil(Orcamento);

  result := inherited insert;
  if Result then
  begin

    if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
      dataSet.FieldByName('SERIE').AsInteger := buscas.FieldByName('serie_nfce_off').AsInteger
    else
      dataSet.FieldByName('SERIE').AsInteger := buscas.FieldByName('serie_nfce').AsInteger;
    dataSet.FieldByName('STATUS').AsString        := stsAberta;
    dataSet.FieldByName('MODELO').AsString := '65';
    dataSet.FieldByName('DHEMI').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
    dataSet.FieldByName('DATA_LANC').AsDateTime := DateOf(dataSet.FieldByName('DHEMI').AsDateTime);
    dataSet.FieldByName('COD_VENDEDOR').AsInteger := vDadosIni.vCodUsuario;
    dataSet.FieldByName('COD_EMISSOR').AsInteger  := vDadosIni.vNFConsumidor.CodEmissor;
    dataSet.FieldByName('OPERADOR').AsInteger     := vDadosIni.vCodUsuario;

    dataSet.FieldByName('TPIMP').AsString         := ConfigNFCe.Padrao.TipoDeImpressao;
    dataSet.FieldByName('INDPRES').AsString       := ConfigNFCe.Padrao.IndicadorDePresenca;
    dataSet.FieldByName('MODFRETE').AsString      := ConfigNFCe.Padrao.ModalidadeDoFrete;
    dataSet.FieldByName('NATOP').AsString         := ConfigNFCe.Padrao.NaturezaDeOperacao;
    dataSet.FieldByName('DESC_POR_ITEM').AsString := IfThen(ConfigNFCe.Regras.DescontoPadraoPorItem, 'S', 'N');
    dataSet.FieldByName('NFE_VERSAO').AsString    := strVer400;
    if StrToIntDef(Trim(dataSet.FieldByName('NATOP').AsString), -1) > 0 then
      dataSet.FieldByName('NATOP').AsString  := SqlOpen('select descricao_nop as nome from nat_op where codigo_nop = %d',
                                                        [fint('NATOP')]).FieldByName('nome').AsString;

    if ConfigNFCe.MovimentoOperador.Ativo then
      if MovOperador.dataSet.Active then
        fdata('mov_id').Put(MovOperador.fint('id'));
    try
      dataSet.FieldByName('dfe_trib_ignorar').AsInteger := IfThen( not FConfigNFCe.Conf_RTC.EmVigencia(vDadosIni.vEmp.vRegime), 1); 
    except on E: Exception do
      registraErro('TNFCe.insert set dfe_trib_ignorar');
    end;

    dataSet.FieldByName('op_interna_id').AsString := FConfigNFCe.OpInternaPadrao; 
    if not fnull('op_interna_id') and fempty('op_interna_id') then
      dataSet.FieldByName('op_interna_id').Clear();

    FEspelho := EspelhoValores.Create(
      fequals('DESC_POR_ITEM', 'S'),
      YesNoEnum(fint('dfe_trib_ignorar')) = ynYes,
      0, 0, 0, 0, 0
    );

    ///  Sobre o movimento de Operador
    ///  Lançamento de valores (Sangria e Suprimento) em Dinheiro
    ///      Tela quando chamada dar opção 1: Sangria; 2 Suprimento; 9: Outros () onde o usuário vai digitar o historico
    ///  Ver forma de ordenar os NFCE e estes lançamentos para apresentar no relatorio se for o caso, ai ficaria como um extrato
    ///      Talvez o campo de data hora, ou mais seguro um sequencial dentro do dia do movimento, talvez um campo na tabela de movimento que fosse usado
    ///  			como um incrementa codigo
    ///  Por Fim o Relatorio contemplando os valores da NFCe  com as sangsups
    ///      Uma View pode resolver ser criada para fazer o relatório, juntando as notas e os lancamentos
    ///      ai fica facil fazer um resumido e outro detalhado

    SetSeqPreco(0);

    Dest.AbreRegistros;
    Itens.AbreRegistros;
    Pagamento.AbreRegistros;
    Itens.Serv.SetISSRetidoNoCliente;
    Pagamento.TipoPagamento.AbreRegistros;
    FhelperConv.LoadUnidades;
  end;
end;

function TNFCe.Inutilizar: Boolean;
var
  Justificativa: string;
  ContMSG: SmallInt;
  ImprimirInutilizacaoNFCe: Boolean;
  Retorno: Integer;
begin
  try
    try
      if not ProcessandoLote then
        if not vDadosIni.PesqPros('NFC016', 'INUTILIZAR', Audit_Dados ,
          'NFCE', Audit_Codigo) then
          exit;

      ClearProcessamento;
      Processamento.Acao := actInutilizar;
      Processamento.CodNFC := dataSet.FieldByName('cod_nfce').AsInteger;
      Processamento.CodEmpresa := dataSet.FieldByName('cod_empresa').AsInteger;

      buscas.Close;
      buscas.SQL.Text := 'select situacao_nfce, tpemis from nfce' +
        ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
        ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa);
      buscas.Open;

      if MatchText(Trim(buscas.FieldByName('situacao_nfce').AsString), [sitAutorizada, sitDenegada, sitCancelada]) then
      begin
        if ProcessandoLote then
          SetLastError('NFC-e está %s', [Trim(buscas.FieldByName('situacao_nfce').AsString)])
        else
          Application.MessageBox(PChar('NFC-e está ' + Trim(buscas.FieldByName('situacao_nfce').AsString)), 'Confirmação', 0+ 64);
        Exit;
      end;

      ImprimirInutilizacaoNFCe := False;
      if Trim(dataSet.FieldByName('situacao_nfce').AsString) = sitInutilizada then
        Result := True
      else
      begin
        Result := InutilizarNFCe;
        ImprimirInutilizacaoNFCe := Result;

        Result := MatchText(SqlOpen('select situacao_nfce from nfce where cod_nfce = %d and cod_empresa = %d', [Processamento.CodNFC, Processamento.CodEmpresa]).FieldByName('situacao_nfce').AsString,
                            [sitCancelada, sitInutilizada, sitDenegada]);
      end;

      if not Result then
        Exit;

      Result := Cancelar(True);

     if Result then
     begin
       vDadosIni.GravaAuditoria('NFC016', 'INUTILIZAR', Audit_Dados, 'NFCE', Audit_Codigo, buscas);

       PedVenda_VerificarVinculo(Processamento.CodNFC, True);

       if (not ProcessandoLote) and ImprimirInutilizacaoNFCe then
       begin
         DLLNFC.LoadDLL;
         Retorno := DLLNFC.nfce_client_imprimir_inutilizacao(Processamento.CodNFC, Processamento.CodEmpresa, PChar(vDadosIni.vNFConsumidor.token));
         if Retorno <= 0 then
           raiseExceptionCreate(string(DLLNFC.nfce_client_retorna_ultimo_erro), '');
       end;
     end;

     dataSet.RefreshRecord;
    except
      on E: Exception do
      begin
        Result := false;
        if ProcessandoLote then
          SetLastError('Inutilização NFCe codigo %d. %s', [Processamento.CodNFC, e.Message])
        else
          Application.MessageBox(pchar('Erro ao Inutilizar NFC. Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('TNFCe.Inutilizar Erro: ' + e.Message);
      end;
    end;
  finally
  end;
end;

function TNFCe.InutilizarNFCe: Boolean;
var
  Justificativa: string;
  Retorno: Integer;
  ContMSG: SmallInt;
  ServidorRecebeu: Boolean;
  NFCeInutilizada: Boolean;
  Tentativas: Integer;
  TimeStart: TTime;
  TimeNow: TTime;
  TimeOutAtingido: Boolean;
begin
  Result := False;
  try
    vDadosIni.abreStatusProcessamento('Inutilizando NFC', 'Validando dados', True);

    try
      buscas.Close;
      buscas.SQL.Text := 'select situacao_nfce, tpemis, inut_xjust from nfce' +
        ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
        ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa);
      buscas.Open;

      if vDadosIni.strIn( Trim(buscas.FieldByName('situacao_nfce').AsString),
        [sitAutorizada, sitCancelada, sitDenegada, sitInutilizada, sitEmProcessamento]) then
      begin
        if ProcessandoLote then
          SetLastError('NFCe codigo %d não permite mais alterações. Situação %s', [Processamento.CodNFC, buscas.FieldByName('situacao_nfce').AsString])
        else
          ShowAtencao('NFC não permite mais alterações. Situação NFC-e: ' + Trim(buscas.FieldByName('situacao_nfce').AsString));
        Exit;
      end;

      Justificativa := buscas.FieldByName('inut_xjust').AsString;
      if not ProcessandoLote then
        if not InputQuery('Justificativa', 'Informe a justificativa para inutilização. De 15 a 255 caracteres', Justificativa) then
          Exit;
      Justificativa:= Trim(UpperCase(Justificativa));

      if Length(Justificativa) < 15 then
        raiseExceptionCreate('Justificativa de inutilização menor que 15 caracteres');
      if Length(Justificativa) > 255 then
        raiseExceptionCreate('Justificativa de inutilização maior que 255 caracteres');

      buscas.Close;
      buscas.SQL.Text := 'update nfce set inut_xjust = ' + QuotedStr(Justificativa) +
        ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
        ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa);
      buscas.ExecSQL;
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;

      ServidorRecebeu := False;
      NFCeInutilizada := ProcessarNFCe(actInutilizar, TimeOutAtingido, ServidorRecebeu);
      if not NFCeInutilizada then
        if TimeOutAtingido then
          if ProcessandoLote then
          begin
            if vDadosIni.vNFConsumidor.UsaServidorAutorizacao then
              raiseExceptionCreate('Atingiu o limite de tentativas de envio de Inutilização')
            else if not ServidorRecebeu then
              raiseExceptionCreate('Servidor de Envio de NFC não recebeu a solicitação' + sLineBreak + sLineBreak +
                                   'Por favor contacte o suporte para solucionar o problema!')
            else
              raiseExceptionCreate('Servidor de Envio de Inutilização NFC esta processando a sua solicitação, porém o webservice da SEFAZ não está respondendo');
          end
          else
          if vDadosIni.vNFConsumidor.UsaServidorAutorizacao then
            Application.MessageBox('NFC atingiu o limite de tentativas de envio de Inutilização', 'Atenção', 0 + 64)
          else if not ServidorRecebeu then
            Application.MessageBox(PChar('Servidor de Envio de NFC não recebeu a solicitação' + sLineBreak + sLineBreak +
              'Por favor contacte o suporte para solucionar o problema!'), 'Atenção', 0 + 64)
          else
            Application.MessageBox('Servidor de Envio de Inutilização NFC esta processando a sua solicitação, porém o webservice da SEFAZ não está respondendo',
              'Atenção', 0 + 64);

      Result := NFCeInutilizada;

    except
      on E: Exception do
      begin
        Result := false;
        if ProcessandoLote then
          SetLastError('Inutilização NFCe codigo %d. %s', [Processamento.CodNFC, e.Message])
        else
          Application.MessageBox(pchar('Erro ao Inutilizar NFC-e. Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('TNFCe.InutilizarNFCe Erro: ' + e.Message);
      end;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TNFCe.LerConfigNFCe;
var
  dMask: string;
begin
  inherited;

  dMask := DisplayNumber(vDadosIni.IfThen(vDadosIni.vEmp.vCasasDecimais > 0, vDadosIni.vEmp.vCasasDecimais, 3));

  TFloatField(Itens.Prod.dataSet.FieldByName('PREC_TAB_PROD')).DisplayFormat := dMask;
  TFloatField(Itens.Prod.dataSet.FieldByName('PRECO_PROMOCAO')).DisplayFormat := dMask;
  TFloatField(Itens.Prod.dataSet.FieldByName('PREC_30_PROD')).DisplayFormat := dMask;
  TFloatField(Itens.Prod.dataSet.FieldByName('PREC_60_PROD')).DisplayFormat := dMask;
  TFloatField(Itens.Prod.dataSet.FieldByName('PREC_90_PROD')).DisplayFormat := dMask;
  TFloatField(Itens.dataSet.FieldByName('VUNCOM')).DisplayFormat := dMask;
  TFloatField(Itens.dataSet.FieldByName('VVND')).DisplayFormat := dMask;

  dMask := DisplayNumber(vDadosIni.IfThen(FConfigNFCe.Itens.CasasDecimaisQtde > 0, FConfigNFCe.Itens.CasasDecimaisQtde, 3));

  TFloatField(Itens.dataSet.FieldByName('QCOM')).DisplayFormat := dMask;
  TFloatField(Itens.dataSet.FieldByName('QVND')).DisplayFormat := dMask;

  dMask := DisplayNumber(5);
  TFloatField(Itens.dataSet.FieldByName('UVND_FATOR')).DisplayFormat := dMask;
end;

procedure TNFCe.LocateRegistroMemorizado;
begin
  if FCodNFCeMemorizada > 0 then
    dataSet.Locate('COD_NFCE', FCodNFCeMemorizada, []);
end;

procedure TNFCe.MemorizarRegistro;
begin
  FCodNFCeMemorizada := dataSet.FieldByName('cod_nfce').AsInteger;
end;

procedure TNFCe.MontarDadosAdicionaisInteresseFisco;
begin
  if not (dataSet.State in [dsEdit, dsInsert]) then
    dataSet.Edit;
//    Exit;

  dataSet.FieldByName('infadfisco').AsString := '';
  buscas.Close;
  buscas.SQL.Text := 'select sped_informacao_complementar.cod_inf, sped_informacao_complementar.txt, sped_informacao_complementar.txt_compl from nfce_item' +
    ' inner join produtos on produtos.grupo_prod  = nfce_item.grupo_prod and produtos.cod_prod  = nfce_item.cod_prod' +
    ' and produtos.cod_empresa  = nfce_item.cod_empresa' +
    ' inner join sped_informacao_complementar on sped_informacao_complementar.cod_inf = produtos.cod_inf' +
    ' and sped_informacao_complementar.cod_empresa = nfce_item.cod_empresa and sped_informacao_complementar.ativo_em_nfce = ''S''' +
    ' where nfce_item.cod_nfce = :cod_nfce and nfce_item.cod_empresa = :cod_empresa' +
    ' union distinct' +
    ' select sped_informacao_complementar.cod_inf, sped_informacao_complementar.txt, sped_informacao_complementar.txt_compl from nfce_item' +
    ' inner join nat_op on nat_op.codigo_nop  = nfce_item.cfop' +
    ' inner join sped_informacao_complementar on sped_informacao_complementar.cod_inf = nat_op.cod_inf' +
    ' and sped_informacao_complementar.cod_empresa = nfce_item.cod_empresa and sped_informacao_complementar.ativo_em_nfce = ''S''' +
    ' where nfce_item.cod_nfce = :cod_nfce and nfce_item.cod_empresa = :cod_empresa' +
    ' union distinct' +
    ' select sped_informacao_complementar.cod_inf, sped_informacao_complementar.txt, sped_informacao_complementar.txt_compl from nfce_item' +
    ' inner join nbm on nbm.cod_ncm  = nfce_item.ncm' +
    ' inner join sped_informacao_complementar on sped_informacao_complementar.cod_inf = nbm.cod_inf' +
    ' and sped_informacao_complementar.cod_empresa = nfce_item.cod_empresa and sped_informacao_complementar.ativo_em_nfce = ''S''' +
    ' where nfce_item.cod_nfce = :cod_nfce and nfce_item.cod_empresa = :cod_empresa';
  buscas.ParamByName('cod_nfce').AsInteger := dataSet.FieldByName('cod_nfce').AsInteger;
  buscas.ParamByName('cod_empresa').AsInteger := dataSet.FieldByName('cod_empresa').AsInteger;
  buscas.Open;

  while  not buscas.Eof do
  begin
    dataSet.FieldByName('infadfisco').AsString := IfThen( not fempty('infadfisco'), ';') +
      IfThen(Trim(buscas.FieldByName('txt').AsString) <> '', Trim(buscas.FieldByName('txt').AsString)) +
      IfThen(Trim(buscas.FieldByName('txt_compl').AsString) <> '', ' ' + Trim(buscas.FieldByName('txt_compl').AsString));
    buscas.Next;
  end;
end;

function TNFCe.MovimentaEstoqueExecutar(APedVenda: TReg_PedVenda;
  ABaixa: Boolean): Boolean;
var
  I: Integer;
begin
  if not Assigned(APedVenda) then
    Exit;

  buscas.Close;
  buscas.SQL.Text := 'execute procedure movimenta_estoque(:GRUPO_PROD, :COD_PROD, ' + vDadosIni.codEmpresa + ', :COD_GRADE, :entrada, :saida, 1)';
  for I := 0 to APedVenda.Prod.Count - 1 do
  begin
    buscas.ParamByName('GRUPO_PROD').AsInteger := APedVenda.Prod.Items[I].grupo_prod;
    buscas.ParamByName('COD_PROD').AsString := APedVenda.Prod.Items[I].cod_prod;
    buscas.ParamByName('COD_GRADE').AsInteger := APedVenda.Prod.Items[I].cod_grade;
    if ABaixa then
    begin
      buscas.ParamByName('entrada').AsFloat := 0;
      buscas.ParamByName('saida').AsFloat := APedVenda.Prod.Items[I].quant_ped_item;
    end
    else
    begin
      buscas.ParamByName('saida').AsFloat := 0;
      buscas.ParamByName('entrada').AsFloat := APedVenda.Prod.Items[I].quant_ped_item;
    end;
    if not buscas.Prepared then
      buscas.Prepare;
    buscas.ExecSQL;
  end;
  Result := True;
end;

function TNFCe.ValidacaoObjetosInternos(): RNFCe_ValidacaoEmGeral;
const
  Triggers  : array[1..3] of string = ('NFCE_ITEM_CALC_IMP' , 'NFCE_BI_MOV_OPERADOR'   , 'NFCE_BU_NORC');
  Procedures: array[1..4] of string = ('SP_NFCE_REC_RATEIOS', 'SP_NFCE_RESET_PISCOFINS', 'SP_NFCE_SUM_TOTAIS_PISCOFINS', 'SP_NFCE_TAB_TPAG');
var
  I: Integer;
  StrObjs: string;
begin
  Result.Mensagem := '';
  if not FObjetosInternosAusentes then
  begin
    Result.Permitido := True; 
    Exit;
  end;

  for I := Low(Triggers) to High(Triggers) do
    if SqlOpen('select rt.rdb$trigger_name from rdb$triggers rt' +
               ' where rt.rdb$trigger_name = %s',
               [QuotedStr(Triggers[I])]).IsEmpty then
      Result.Mensagem := Result.Mensagem + IfThen(Result.Mensagem <> '', ',') + Triggers[I];

  for I := Low(Procedures) to High(Procedures) do
    if SqlOpen('select pr.rdb$procedure_name from rdb$procedures pr' +
               ' where pr.rdb$procedure_name = %s',
               [QuotedStr(Procedures[I])]).IsEmpty then
      Result.Mensagem := Result.Mensagem + IfThen(Result.Mensagem <> '', ',') + Procedures[I];

  Result.Permitido         := Trim(Result.Mensagem)  = '';
  FObjetosInternosAusentes := Trim(Result.Mensagem) <> '';
end;

function TNFCe.ObterImpressoraPadrao: string;
var
  Aconf: TConfig_sistema_class;
begin
  Aconf := TConfig_sistema_class.getConf('nfc_nfce_config_emissor_geral', buscas, vDadosIni.cod_empresa);
  try
    Result := Aconf.ReadString('NFCe_Impressora_Sem_Preview', 'Caixa_' + PadL(vDadosIni.vNFConsumidor.CodEmissor, 3), '');
  finally
    FreeAndNil(Aconf);
  end;
end;

function TNFCe.Orcamento_getOrcamento(Aped: Integer; var ATextOut: string): Boolean;
var
  Astr: string;
  AVenda: TPedVendaOrc_Model;
  ApedIgual: Boolean;
begin
  Result := False;
  ATextOut := '';
  ApedIgual := False;

  if (Itens.dataSet.RecordCount > 0) and (fint('norc') <> Aped) and (Aped > 0) then
  begin
    ATextOut := 'NFCe já possui itens';
    Exit;
  end;

  if Assigned(Orcamento) then
    ApedIgual := Aped = Orcamento.nped;

  if Aped = 0 then
  begin
    if fint('norc') > 0 then
    begin
      fdata('norc').SetNull;
      if fint('cod_nfce') > 0 then
        NFCe.SalvarECalcular(False);
    end;
    ATextOut := 'Seleção do Orçamento removida';
    Exit;
  end;

  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
    cloud_get_orcamento(WideString(Format(';empresaId=%d;caixaId=%d;id=%d',
      [vDadosIni.cod_empresa, vDadosIni.vNFConsumidor.CodEmissor, Aped])));

  Orcamento :=  TPedVendaOrc_Builder.GetOrcamento(Aped);
  if Orcamento.nped = 0 then
    FreeAndNil(Orcamento);

  if not Assigned(Orcamento) then
    ATextOut := 'Orçamento não encontrado'
  else if Orcamento.ncupom > 0 then
  begin
    ATextOut := 'Orçamento ' + IntToStr(Orcamento.nped) + ' já utilizado em cupom fiscal';
    FreeAndNil(Orcamento);
  end
  else if (Orcamento.cod_nfce > 0) and (Orcamento.cod_nfce <> fint('cod_nfce')) then
  begin
    ATextOut := 'Orçamento ' + IntToStr(Orcamento.nped) + ' já utilizado em outra NFCe';
    FreeAndNil(Orcamento);
  end
  else
  begin
    Result := True;
    fdata('cod_vendedor').Put(Orcamento.cod_vendedor);
    fdata('norc').Put(Orcamento.nped);
    ATextOut := 'Orçamento ' + IntToStr(Orcamento.nped) + IfThen(ApedIgual, ' atualizado', ' selecionado');
    //Orcamento_confereItens;

    Itens.prepare_loop();
    try
      while not Itens.dataSet.Eof do
      begin
        if Itens.fint('nitem_orc') > 0 then
          Orcamento.LocateAndUse(Itens.fint('nitem_orc'), Itens.fint('grupo_prod'), Itens.fstr('cod_prod'), Itens.ffloat('qcom'));
        Itens.Next;
      end;
    finally
      Itens.prepare_loop_done();
    end;
  end;
end;

function TNFCe.PermiteAlteracaoItens: Boolean;
begin
  if dataSet.FieldByName('cod_nfce_complementada').AsInteger > 0 then
    Result := False
  else
  if dataSet.FieldByName('cod_nfce').AsInteger > 0 then
  begin
    SqlOpen('select situacao_nfce from nfce' +
            ' where cod_nfce = ' + IntToStr(dataSet.FieldByName('cod_nfce').AsInteger) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa);
    Result := (Trim(dataSet.FieldByName('status').AsString) = stsAberta) and
              (vDadosIni.strIn(Trim(buscas.FieldByName('situacao_nfce').AsString), [sitVazio, sitRejeitada]));
  end
  else
    Result := Trim(dataSet.FieldByName('status').AsString) = stsAberta;
end;

function TNFCe.PermiteAlteracaoPagamento: Boolean;
begin
  Result := PermiteAlteracaoItens;
  if Result then
    Exit;

  if dataSet.FieldByName('cod_nfce').AsInteger > 0 then
  begin
    SqlOpen('select situacao_nfce from nfce' +
            ' where cod_nfce = ' + IntToStr(dataSet.FieldByName('cod_nfce').AsInteger) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa);
    Result := (Trim(dataSet.FieldByName('status').AsString) = stsFechando) and
              (vDadosIni.strIn(Trim(buscas.FieldByName('situacao_nfce').AsString), [sitVazio, sitRejeitada]));
  end
  else
    Result := Trim(dataSet.FieldByName('status').AsString) = stsFechando;
end;

function TNFCe.PermiteEmissao(var Astatus: string; var Asituacao: string): Boolean;
begin
  if dataSet.FieldByName('cod_nfce').AsInteger > 0 then
  begin
    SqlOpen('select situacao_nfce from nfce' +
            ' where cod_nfce = ' + IntToStr(dataSet.FieldByName('cod_nfce').AsInteger) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa);
    Result := ((Trim(dataSet.FieldByName('status').AsString) = stsFechando) or
               (Trim(dataSet.FieldByName('status').AsString) = stsFechada)) and
              (vDadosIni.strIn(Trim(buscas.FieldByName('situacao_nfce').AsString), [sitVazio, sitEnviando, sitRejeitada, sitDuplicidade, sitEmProcessamento]));
    Astatus   := Trim(dataSet.FieldByName('status').AsString);
    Asituacao := Trim(buscas.FieldByName('situacao_nfce').AsString);
  end
  else
  begin
    Result := (Trim(dataSet.FieldByName('status').AsString) = stsFechando) or
              (Trim(dataSet.FieldByName('status').AsString) = stsFechada);
    Astatus   := Trim(dataSet.FieldByName('status').AsString);
    Asituacao := Trim(dataSet.FieldByName('situacao_nfce').AsString);
  end;

end;

function TNFCe.post: boolean;
var
  acao: string;
begin
  try

    Result := false;
    acao := vDadosIni.IfThen(dataSet.State = dsInsert, 'INSERIR', 'EDITAR');

//    if not vDadosIni.PesqPros('NFC005', acao, 'EMISSOR ' + dataSet.FieldByName('NOME_EMISSOR').AsString,
//      'NFC_EMISSOR', dataSet.FieldByName('COD_EMISSOR').AsString) then
//      exit;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := True;
      exit;
    end;

//    checkFieldEmpty('nome_emissor', 'Campo Nome Emissor de preenchimento obrigatorio', 'DBEdit2');
//    checkFieldEmpty('serie_nfce', 'Campo Serie NFC-e de preenchimento obrigatorio', 'DBEdit3');
//    checkFieldEmpty('tipo', 'Campo Tipo Emissor de preenchimento obrigatorio', 'DBEdit2');
//    checkFieldEmpty('identificador', 'Campo Identificador de preenchimento obrigatorio', 'DBEdit4');
//    checkFieldEmpty('token', 'Campo Token de preenchimento obrigatorio', 'DBEdit6');

//    if Pos('1|', dataSet.FieldByName('tipo').AsString) > 0 then
//      if Length(vDadosIni.apenasNumeros(Copy(dataSet.FieldByName('identificador').AsString, 9, 4))) <> 4 then
//        raiseExceptionCreate('Identificador incorreto. Informar 4 últimos dígitos apenas com números', '');

//    if vDadosIni.PosMult(['3|', '4|'], dataSet.FieldByName('tipo').AsString) > 0 then
//      if Length(vDadosIni.apenasLetras(Copy(dataSet.FieldByName('identificador').AsString, 9, 4))) <> 4 then
//        raiseExceptionCreate('Identificador incorreto. Informar 4 últimos dígitos apenas com letras', '');

    dataSet.FieldByName('DATA_MOD').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('US_MOD').AsInteger := vDadosIni.vCodUsuario;
    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('COD_NFCE').AsInteger := Gencodigo('NFCE', buscas, vDadosIni.codEmpresa);
      dataSet.FieldByName('DATA_CAD').AsDateTime := dataSet.FieldByName('DATA_MOD').AsDateTime;
      dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    end;

    dataSet.Post;

    if (dataSet.ChangeCount = 0) then
    begin
      Result := True;
      exit;
    end;

    Result := Apply;

    if not Result then
      Exit;

    CommitaTransacao;

//    vDadosIni.GravaAuditoria('NFC005', acao, 'SUCESSO', 'NFC_EMISSOR', '', buscas);

    Refresh;
  except
    on E: Exception do
    begin
      Result := false;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro ao excluir registro. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('TNFCe.post Erro: ' + e.Message);
    end;
  end;
end;

function TNFCe.ProcessarNFCe(Acao: string;
  var TempoLimiteAtingido, ServidorRecebeu: Boolean): Boolean;
var
  TimeOutNFCe: Smallint;
  TimeStart, TimeNow: TTime;
  Tentativas: Smallint;//aqui o sistema salva as tentativas, maximo 30
  NFCeProcessada: Boolean;
  Retorno: Integer;
  //ServidorRecebeu: Boolean;
  ContMSG: Smallint;
  MsgRetornoCA, Situacao, StatusMensagem, Adicional, xmlAut, xmlCan: string;
  TipoImpressao: Integer;
  TestarSituacaoNFCe, ServidorProcessou: Boolean;
begin
  try
    try
      TestarSituacaoNFCe := True;
      if Acao = actAutorizar then
      begin
        Situacao       := sitAutorizada;
        StatusMensagem := 'Autorizando';
      end
      else if Acao = actCancelar then
      begin
        Situacao       := sitCancelada;
        StatusMensagem := 'Cancelando';
      end
      else if Acao = actInutilizar then
      begin
        Situacao       := sitInutilizada;
        StatusMensagem := 'Inutilizando';
      end
      else if Acao = actImprimir then
      begin
        Situacao       := '';
        StatusMensagem := 'Imprimindo';
        TestarSituacaoNFCe := False;
      end
      else if Acao = actEnviarEmail then
      begin
        Situacao       := '';
        StatusMensagem := 'Enviando email';
        TestarSituacaoNFCe := False;
      end
      else
        raiseExceptionCreate('Ação não definida corretamente: ' + Acao, '');

      vDadosIni.abreStatusProcessamento(StatusMensagem +  ' NFC', 'Validando dados', True);

      buscas.Close;
      buscas.SQL.Text := 'select situacao_nfce, tpemis from nfce' +
        ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
        ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa);
      buscas.Open;
      NFCeProcessada := Trim(buscas.FieldByName('situacao_nfce').AsString) = Situacao;

      if TestarSituacaoNFCe then
        if NFCeProcessada then
        begin
          Result := True;
          Exit;
        end;

      buscas.Close;
      buscas.SQL.Text := 'select cont_msg from nfce' +
        ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
        ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa);
      buscas.Open;
      ContMSG := buscas.FieldByName('cont_msg').AsInteger;
      {
      if vDadosIni.vNFConsumidor.StandAlone then
        vDadosIni.abreStatusProcessamento(StatusMensagem +  ' NFC', 'Processando', True)
      else
        vDadosIni.abreStatusProcessamento(StatusMensagem +  ' NFC', 'Enviando solicitação para servidor de processamento', True);
      }

      with vDadosIni.vNFConsumidor do
        Processamento.UsarServidor := (StrIn(Acao, [actAutorizar, actCancelar, actInutilizar]) and (UsaServidorAutorizacao)) or
                                      ((Acao = actImprimir)    and (UsaServidorImpressao)) or
                                      ((Acao = actEnviarEmail) and (UsaServidorEmail));
      if Processamento.UsarServidor then      
        vDadosIni.abreStatusProcessamento(StatusMensagem +  ' NFC', 'Enviando solicitação para servidor de processamento', True)
      else
        vDadosIni.abreStatusProcessamento(StatusMensagem +  ' NFC', 'Processando', True);

      DLLNFC.LoadDLL;
      if Acao = actAutorizar then
        Retorno := DLLNFC.nfce_client_enviar(Processamento.CodNFC, Processamento.CodEmpresa, PChar(vDadosIni.vNFConsumidor.token), PChar(Processamento.email))
      else if Acao = actCancelar then
        Retorno := DLLNFC.nfce_client_cancelar(Processamento.CodNFC, Processamento.CodEmpresa, PChar(vDadosIni.vNFConsumidor.token))
      else if Acao = actInutilizar then
        Retorno := DLLNFC.nfce_client_inutilizar(Processamento.CodNFC, Processamento.CodEmpresa, PChar(vDadosIni.vNFConsumidor.token))
      else if Acao = actEnviarEmail then
      begin
        if Processamento.CountSelecao = 0 then
        Retorno := DLLNFC.nfce_client_enviar_email(Processamento.CodNFC, Processamento.CodEmpresa, PChar(vDadosIni.vNFConsumidor.token), PChar(Processamento.email), True)
        else
          Retorno := DLLNFC.nfce_client_enviar_email_lote(Processamento.ArrayNFCE, Processamento.CodEmpresa, PChar(vDadosIni.vNFConsumidor.token), PChar(Processamento.email), True);
      end
      else if Acao = actImprimir then
      begin
        if Processamento.ImpressoraNaoFiscal then
          TipoImpressao := 1
        else
          TipoImpressao := 0;

        Adicional := '|';
        if Processamento.ViaCancelamento then
        begin
          Adicional := Adicional + 'viacanc|';
        end;
//        else
        begin
          if Processamento.ImpressaoResumida then
            Adicional := Adicional + 'res|';
          if (Processamento.ViaConsumidor) and (Processamento.ViaEstabelecimento) then
            Adicional := Adicional + 'viacon|viaest|'
          else if (Processamento.ViaEstabelecimento) then
            Adicional := Adicional + 'viaest|';
          if (not Processamento.ImpressoraNaoFiscal) and (Processamento.FormatoA4) then
            Adicional := Adicional + 'a4|';
        end;
        if Adicional = '|' then
          Adicional := '';

        if (Processamento.ImpressoraNaoFiscal) and (ConfigNFCe.AgentValid) then
//           (ConfigNFCe.AgenteNF.AgenteId <> '') and
//           (ConfigNFCe.AgenteNF.AgenteId <> 'Padrao') and
//           (ConfigNFCe.AgenteNF.ArquivoIniPosPrinterNaoFiscal <> '') and
//           (ConfigNFCe.AgenteNF.ArquivoIniImpressaoHWNFC <> '') then
        begin
          with ConfigNFCe.AgenteNF do
          begin
            SqlOpen('select situacao_nfce, xml_nfce, canc_xml_nfce from nfce' +
                    ' where cod_nfce = %d and cod_empresa = %d',
                    [Processamento.CodNFC, Processamento.CodEmpresa]);
            xmlAut := buscas.FieldByName('xml_nfce').AsString;
            if Processamento.ViaCancelamento and (buscas.FieldByName('situacao_nfce').AsString = sitCancelada) then
              xmlCan := buscas.FieldByName('canc_xml_nfce').AsString
            else
              xmlCan := '';

            if not cloud_agente_print_nfce(WideString(xmlAut), WideString(xmlCan), WideString(Format('%s;printParams=%s', [ConfigNFCe.GetAgentPrintParams, Adicional]))) then
            //if not cloud_agente_print_nfce(WideString(xmlAut), WideString(xmlCan), WideString(Format('agentId=%s;confName=%s;nfceConfName=%s;copies=1;printParams=%s', [AgenteId, ArquivoIniPosPrinterNaoFiscal, ArquivoIniImpressaoHWNFC, Adicional]))) then
            begin
              Processamento.RetornoDLL := 0;
              raiseExceptionCreate(string(cloud_agente_last_error));
            end
            else
              Retorno := 1;
          end
        end
        else
        begin
          Adicional := Adicional + ConfigNFCe.GetDefaultPrintParams;

          Retorno := DLLNFC.nfce_client_imprimir_danfe(Processamento.CodNFC, Processamento.CodEmpresa,
            TipoImpressao,
            PChar(vDadosIni.vNFConsumidor.token),
            PChar(Adicional));
        end;
      end;
      Processamento.RetornoDLL := Retorno;

      if Retorno <= 0 then
        raiseExceptionCreate(string(DLLNFC.nfce_client_retorna_ultimo_erro), '');

      if Processamento.UsarServidor then
        vDadosIni.abreStatusProcessamento(StatusMensagem +  ' NFC', 'Solicitação enviada para servidor de processamento', True);

      //if (vDadosIni.vNFConsumidor.StandAlone) and (not vDadosIni.vNFConsumidor.UseThread) then
      if (not Processamento.UsarServidor) then
      begin

      	{$REGION 'Processamento StandAlone sem threads'}
        SqlOpen('select situacao_nfce, cont_msg, msgretorno, tpemis from nfce' +
          ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
          ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa));

        if (Acao = actAutorizar) and
          (buscas.FieldByName('tpemis').AsString = '9') and  //contingencia
          (ContMSG <> buscas.FieldByName('cont_msg').AsInteger) and
          (Pos('gerada em contingencia', LowerCase(buscas.FieldByName('msgretorno').AsString)) > 0) then // retorno do pedido de envio
        begin
          NFCeProcessada     := True;
          TestarSituacaoNFCe := False;
        end
        else if (buscas.FieldByName('situacao_nfce').AsString = Situacao) and (TestarSituacaoNFCe) then
        begin
          Result := True;
          NFCeProcessada := True;
        end
        else if ContMSG <> buscas.FieldByName('cont_msg').AsInteger  then
          raiseExceptionCreate(Trim(buscas.FieldByName('msgretorno').AsString), '')
        else if (not TestarSituacaoNFCe) then
        begin
          Result := True;
          NFCeProcessada := True;
        end;

        {$ENDREGION}

      end
      else
      begin

        {$REGION 'Loop de processamento que aguarda o serviço ou a thread enviar a NFC-e'}

        MsgRetornoCA        := '';
        ServidorRecebeu     := False;
        NFCeProcessada      := False;
        TempoLimiteAtingido := False;
        Tentativas := 0;
        TimeStart := Time;
        while (Tentativas < 30) do
        begin
          Tentativas := Tentativas + 1;

          //if vDadosIni.vNFConsumidor.StandAlone then
          if (not Processamento.UsarServidor) then//quando usava threads caia aqui
          begin
            SqlOpen('select situacao_nfce, cont_msg, msgretorno from nfce' +
              ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
              ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa));

            if (buscas.FieldByName('situacao_nfce').AsString = Situacao) and (TestarSituacaoNFCe) then
            begin
              Result := True;
              NFCeProcessada := True;
            end
            else if ContMSG <> buscas.FieldByName('cont_msg').AsInteger  then
              raiseExceptionCreate(Trim(buscas.FieldByName('msgretorno').AsString), '')
            else if (not TestarSituacaoNFCe) then
            begin
              Result := True;
              NFCeProcessada := True;
            end;
          end
          else
          begin
            if not ServidorRecebeu then
              ServidorRecebeu := SqlOpen('select cod_emiss_serv from NFC_CENTRAL_ACOES' +
                ' where seqid = ' + IntToStr(Retorno) +
                ' and cod_empresa =  ' + vDadosIni.codEmpresa).FieldByName('COD_EMISS_SERV').AsInteger > 0;

            if ServidorRecebeu then
            begin
              vDadosIni.abreStatusProcessamento(StatusMensagem +  ' NFC', 'Servidor está processando a sua solicitação', True);

              ServidorRecebeu := SqlOpen('select data_prcss, coalesce(msgretorno, msgcompleta) msgretorno from NFC_CENTRAL_ACOES' +
                ' where seqid = ' + IntToStr(Retorno) +
                ' and cod_empresa =  ' + vDadosIni.codEmpresa).FieldByName('data_prcss').AsDateTime > 0;
              if ServidorRecebeu then
                MsgRetornoCA := Trim(buscas.FieldByName('msgretorno').AsString);

              SqlOpen('select situacao_nfce, cont_msg, msgretorno, tpemis from nfce' +
                ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
                ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa));
              if (ServidorRecebeu) and (Acao = actAutorizar) and
                (buscas.FieldByName('tpemis').AsString = '9') and  //contingencia
                (ContMSG <> buscas.FieldByName('cont_msg').AsInteger) and
                (Pos('gerada em contingencia', LowerCase(buscas.FieldByName('msgretorno').AsString)) > 0) then // retorno do pedido de envio
              begin
                NFCeProcessada     := True;
                TestarSituacaoNFCe := False;
                Break;
              end
              else if (buscas.FieldByName('situacao_nfce').AsString = Situacao) and (TestarSituacaoNFCe) then
              begin
                NFCeProcessada := True;
                Break;
              end
              else if MsgRetornoCA <> '' then // resposta da Central de acoes
                raiseExceptionCreate(MsgRetornoCA, '')
              else if ContMSG <> buscas.FieldByName('cont_msg').AsInteger then // resposta gravada na nota
                raiseExceptionCreate(Trim(buscas.FieldByName('msgretorno').AsString), '')
              else if (not TestarSituacaoNFCe) and (ServidorRecebeu) then
              begin
                NFCeProcessada := True;
                Break;
            end;
          end;
          end;

          if NFCeProcessada then
            Tentativas := 30
          else if Tentativas >= 30 then
            TempoLimiteAtingido := True
          else
          begin
            TimeNow := Time;
            if (TimeNow - TimeStart) >= StrToTime('00:00:' +vDadosIni.StrZero(ConfigNFCe.Regras.TimeOutContingencia, 2))  then
            begin
              TempoLimiteAtingido := True;
              Tentativas          := 30;
            end;
          end;
          if Tentativas >= 30 then
          begin
            SqlExec('update NFC_CENTRAL_ACOES set abortar = ''S''' +
              ' where seqid = ' + IntToStr(Retorno) +
              ' and cod_empresa =  ' + vDadosIni.codEmpresa +
              ' and data_prcss is null');
            if buscas.Transaction.InTransaction then
              buscas.Transaction.Commit;
          end
          else
            Sleep(500);
        end;
        {$ENDREGION}

      end;

      SqlOpen('select situacao_nfce, chave_nfce from nfce' +
        ' where cod_nfce = ' + IntToStr(Processamento.CodNFC) +
        ' and cod_empresa = ' + IntToStr(Processamento.CodEmpresa));

      if not TestarSituacaoNFCe then
        Result := NFCeProcessada
      else
        Result := Trim(buscas.FieldByName('situacao_nfce').AsString) = Situacao;

      if Result and (Acao = actAutorizar) and (Trim(buscas.FieldByName('chave_nfce').AsString) <> '') then
        Container.GetInstance().ErpFeaturesFactory.CreateRegistrarAjusteRedBenefPcUseCase()
          .Executar(RegistrarAjusteRedBenefPcUseCaseInput.Create(
            buscas.FieldByName('chave_nfce').AsString, vDadosIni.cod_empresa
          ));

    except
      on E: Exception do
      begin
        Result := false;
        if ProcessandoLote then
          SetLastError('Processar NFCe codigo %d %s. %s', [Processamento.CodNFC, Acao, e.Message])
        else
          SetLastMessage('Erro ao Processar NFC-e. Erro: ' + e.Message, False);
        registraErro('TNFCe.ProcessarNFCe Erro: ' + e.Message);
      end;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TNFCe.ReabrirNFC;
var
  Mensagem: TStrings;
  CodContingencia, CodComplementada: Integer;
begin
  try
    buscas.Close;
    buscas.SQL.Text := 'select situacao_nfce, cod_nfce_conting, tpemis, cod_nfce_original, digval,' +
      ' cod_nfce_complementada from nfce' +
      ' where cod_nfce = ' + IntToStr(dataSet.FieldByName('cod_nfce').AsInteger) +
      ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);
    buscas.Open;

    CodComplementada := buscas.FieldByName('cod_nfce_complementada').AsInteger;

    if vDadosIni.strIn( Trim(buscas.FieldByName('situacao_nfce').AsString),
      [sitAutorizada, sitCancelada, sitDenegada, sitInutilizada, sitAInutilizar, sitEnviando, sitDuplicidade, sitEmProcessamento]) then
    begin
      Application.MessageBox(PChar('NFC não pode ser reaberta. Situação NFC-e: ' + Trim(buscas.FieldByName('situacao_nfce').AsString)),
        'Atenção', 0 + 64);
      Exit;
    end;

    if (Trim(buscas.FieldByName('tpemis').AsString) = '9') and      // contingencia
      (buscas.FieldByName('cod_nfce_original').AsInteger > 0) then  // nota original
    begin
      Application.MessageBox('NFC não pode ser reaberta pois foi emitida em contingência a partir de outra NFC', 'Atenção', 0 + 64);
      Exit;
    end
    else if (Trim(buscas.FieldByName('tpemis').AsString) = '9') and      // contingencia
      (Trim(buscas.FieldByName('digval').AsString) <> '') then  // nota original
    begin
      Application.MessageBox('NFC não pode ser reaberta pois foi emitida em contingência, foi Validada, Assinada e o XML ' +
        ' já está pronto para envio', 'Atenção', 0 + 64);
      Exit;
    end;

    if buscas.FieldByName('cod_nfce_conting').AsInteger > 0 then
    begin
      Mensagem := TStringList.Create; Mensagem.Clear;
      Mensagem.Add('NFC não pode ser reaberta. Pois foi gerada outra outra NFC em Contingência' + sLineBreak);

      CodContingencia := buscas.FieldByName('cod_nfce_conting').AsInteger;

      buscas.Close;
      buscas.SQL.Text := 'select cod_nfce, num_nf, dhemi from nfce' +
        ' where cod_nfce = ' + IntToStr(CodContingencia) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;
      Mensagem.Add('Codigo: ' + buscas.FieldByName('cod_nfce').AsString);
      Mensagem.Add('Numero: ' + buscas.FieldByName('num_nf').AsString);
      Mensagem.Add('Data Emissao: ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', buscas.FieldByName('dhemi').AsDateTime));

      Application.MessageBox(PChar(Mensagem.Text), 'Atenção', 0 + 64);
      Exit;
    end;

    if (CodComplementada > 0) then  // nota complementar
    begin
      Application.MessageBox('NFC não pode ser reaberta, pois é uma nota complementar, voccê pode apenas corrigir os parametros de tributação e gerar uma nova,' +
                             ' caso tenha imposto a complementar o sistema vai criar esse complemeto automaticamente, caso contrário não cria nenhuma nota', 'Atenção', 0 + 64);
      Exit;
    end;

    if dataSet.State = dsBrowse then
      dataSet.Edit;

    if SetStatusAberta then
    begin
      if fempty('dfe_trib_ignorar') then
        dataSet.FieldByName('dfe_trib_ignorar').AsInteger := IfThen( not FConfigNFCe.Conf_RTC.EmVigencia(vDadosIni.vEmp.vRegime), 1);
      if (YesNoEnum(fint('dfe_trib_ignorar')) = ynNo) and fempty('op_interna_id') then
        dataSet.FieldByName('op_interna_id').AsString := FConfigNFCe.OpInternaPadrao;
      if not fnull('op_interna_id') and fempty('op_interna_id') then
        dataSet.FieldByName('op_interna_id').Clear();
    end;

  except on E: Exception do
    begin
      Application.MessageBox(PChar('Erro ao reabrir NFC. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('TNFCe.ReabrirNFC Erro: ' + e.Message);
    end;
  end;
end;

procedure TNFCe.RecalcularTributosRTC(ForcarRecalculo: Boolean);
var
  tributosRTC  : TributoDFeContextEtd;
  data: TDate;
  CMunFGIbs: Integer;
  OpInternaId: string;
  TributoDFeId: string;
begin
  // So calcula se necessário, vprod nao é considerado aqui, pois já foi considerado ao salvar, aqui só os rateios
  if not ForcarRecalculo
    and not FEspelho.RecalcularIbsCbs(
      fequals('DESC_POR_ITEM', 'S'),
      YesNoEnum(fint('dfe_trib_ignorar')) = ynYes,
      ffloat('vdesc'),
      ffloat('vfrete'),
      ffloat('vseg'),
      ffloat('voutro')
    )
  then
    Exit;

  if (YesNoEnum(fint('dfe_trib_ignorar')) = ynYes) then
  begin
    queryCons.SQL(
      'select ni.dfe_trib_id ' +
      ' from nfce_item ni ' +
      ' inner join DFE_TRIB_CONTEXTO c on c.id = ni.dfe_trib_id ' +
      ' where ni.cod_nfce = :cod_nfce and ni.cod_empresa = :cod_empresa')
      .ParamValue('cod_nfce', fint('cod_nfce'))
      .ParamValue('cod_empresa', fint('cod_empresa'))
      .Open();
    while not queryCons.Eof do
    begin
      Itens.FTributos.Delete( queryCons.fstr('dfe_trib_id'), tdfoNFCe );
      queryCons.Next();
    end;

    queryCons.SQL(
      'update nfce_item set dfe_trib_id = null, vitem = 0' +
      ' where cod_nfce = :cod_nfce and cod_empresa = :cod_empresa')
      .ParamValue('cod_nfce', fint('cod_nfce'))
      .ParamValue('cod_empresa', fint('cod_empresa'))
      .ExecSQL();
  end
  else
  begin
    queryCons.SQL(
      'update nfce_item set ' +
      ' dfe_trib_id = (select guid from spdb_guid)' +
      ' where (cod_nfce = :cod_nfce) and (cod_empresa = :cod_empresa) and (coalesce(dfe_trib_id, '''') = '''' )')
      .ParamValue('cod_nfce', fint('cod_nfce'))
      .ParamValue('cod_empresa', fint('cod_empresa'))
      .ExecSQL();
                                   
    OpInternaId := fstr('op_interna_id');
    data        := fdate('dhemi');
    CMunFGIbs   := fint('cmunfgibs');
    if CMunFGIbs = 0 then
      CMunFGIbs := vDadosIni.vEmp.vNfe.ibgeCodCidade;

    queryCons.SQL(
      'select ' +
      '   ni.nitem, ni.ucom, ni.qcom, ni.vprod, ni.vdesc, ni.vseg, ni.voutro, ni.vfrete, ' +
      '   ni.ncm, ni.icm_vicms, ni.iss_vissqn, ni.pis_vpis, ni.cofins_vcofins, ' +
      '   ni.dfe_trib_id, p.grupo_fiscal_ibscbs ' +
      ' from nfce_item ni ' +
      ' inner join produtos p on ni.tipo_item = ''P''' +
      '   and p.grupo_prod = ni.grupo_prod ' +
      '   and p.cod_prod = ni.cod_prod ' +
      '   and p.cod_empresa = ni.cod_empresa ' +
      ' where ni.cod_nfce = :cod_nfce and ni.cod_empresa = :cod_empresa')
      .ParamValue('cod_nfce', fint('cod_nfce'))
      .ParamValue('cod_empresa', fint('cod_empresa'))
      .Open();
    while not queryCons.Eof do
    begin
      TributoDFeId := queryCons.fstr('dfe_trib_id');

      tributosRTC := TributoDFeOrquestrador.Create( TributoDFeOrquestradorInput.Create(
        opInternaId,
        TributoDFeId,
        queryCons.fstr('grupo_fiscal_ibscbs'),
        queryCons.fstr('ncm'),
        queryCons.fstr('ucom'),
        data,
        CMunFGIbs,
        queryCons.fint('nitem'),
        {ValorLiquido} queryCons.ffloat('vprod') - queryCons.ffloat('vdesc'),
        {Acrescimos}   queryCons.ffloat('vseg') + queryCons.ffloat('voutro'),
        {Frete}        queryCons.ffloat('vfrete'),
        {ICMS}         queryCons.ffloat('icm_vicms'),
        {ISS}          queryCons.ffloat('iss_vissqn'),
        {PIS}          queryCons.ffloat('pis_vpis'),
        {COFINS}       queryCons.ffloat('cofins_vcofins'),
        {Quantidade}   queryCons.ffloat('qcom')
      ));
      try
        Itens.FTributos.SetItem( tributosRTC, tdfoNFCe );
      finally
        tributosRTC.Free()
      end;

      queryCons.Next();
    end;

    queryCons.SQL(
      'merge into nfce_item n ' +
      'using ' +
      '( ' +
      '  select ' +
      '    ni.cod_nfce, ni.cod_empresa, ni.seqid, ' +
      '    ( coalesce(ni.vprod, 0) ' +
      '      - coalesce(ni.vdesc, 0) ' +
      '      + coalesce(ni.vfrete, 0) ' +
      '      + coalesce(ni.voutro, 0) ' +
      '      + coalesce(ni.vseg, 0) ' +
      IfThen(fdate('dhemi') >= EncodeDate(2027, 01, 01),
        '      + coalesce(g.vibs, 0)  ' +
        '      + coalesce(g.vcbs, 0)  ' +
        '      + coalesce(s.vis, 0) ' +
        '      + coalesce(m.vtotibsmonoitem, 0) ' +
        '      + coalesce(m.vtotcbsmonoitem, 0) '
      ) +
      '     ) vitem ' + 
      '  from nfce_item ni ' + 
      '    inner join dfe_trib_contexto c on c.id = ni.dfe_trib_id and c.origem = 1 ' +
      '    left join dfe_trib_gibscbs g on g.id = c.id ' + 
      '    left join dfe_trib_monofasia m on m.id = c.id ' + 
      '    left join dfe_trib_is s on s.id = c.id ' + 
      '  where cod_nfce = :cod_nfce and cod_empresa = :cod_empresa ' +
      ') as ni ' +
      'on ' +
      '  (n.cod_nfce = ni.cod_nfce) and (n.cod_empresa = ni.cod_empresa) and (n.seqid = ni.seqid) ' +
      'when matched then ' +
      '  update set ' +
      '    vitem = ni.vitem '
    )
    .ParamValue('cod_nfce', fint('cod_nfce'))
    .ParamValue('cod_empresa', fint('cod_empresa'))
    .ExecSQL();
  end;
end;

procedure TNFCe.RegisterNotificationToField(const FieldName: string);
var
  S: string;
begin
  S := UpperCase(Trim(FieldName));
  if (S <> 'VNF') and (FFieldsWithNotificationChange.IndexOf(S) = -1) then
  begin
    dataSet.FieldByName(S).OnChange := dataSetNFCeChange;
    FFieldsWithNotificationChange.Add(S);
  end;
end;

function TNFCe.SalvarECalcular(RefazerRateiosETotais, ForcarRecalculo: Boolean): Boolean;
var
  Codigo: Integer;
  AvNF_Old: Double;
begin
  try
    Result := True;

    Codigo   := dataSet.FieldByName('cod_nfce').AsInteger;
    AvNF_Old := dataSet.FieldByName('vnf').AsFloat;
    try
      CertificarPreenchimentoCamposCorretamente();

      if dataSet.ChangeCount > 0 then
        Result := Apply;

      if (Result) and (Itens.dataSet.RecordCount > 0) then
        if RefazerRateiosETotais then
        begin
          buscas.Close;
          buscas.SQL.Text := 'select sucesso from sp_nfce_rec_rateios(:cod_nfce, :cod_empresa)';
          buscas.ParamByName('cod_nfce').AsInteger := dataSet.FieldByName('cod_nfce').AsInteger;
          buscas.ParamByName('cod_empresa').AsInteger := dataSet.FieldByName('cod_empresa').AsInteger;
          buscas.Open;
          if buscas.FieldByName('sucesso').AsInteger = 1 then
            Result := true
          else
            raiseExceptionCreate('sp_nfce_rec_rateios não retornou execução', '');
        end;

      if Result then
      begin
        RecalcularTributosRTC(ForcarRecalculo);
        SomarTotaisTributosRTC();

        SqlExec('update nfce set ativo = 1 where cod_nfce = %d and cod_empresa = %d and ativo <> 1', [Codigo, vDadosIni.cod_empresa]);

        CommitaTransacao;
        try
          dataSet.RefreshRecord;
        except
          dataSet.Refresh;
          if Codigo <> dataSet.FieldByName('COD_NFCE').AsInteger then
          begin
            if not dataSet.Locate('COD_NFCE', Codigo, []) then
              AbreRegistros(Codigo);
            if Codigo <> dataSet.FieldByName('COD_NFCE').AsInteger then
              raiseExceptionCreate('Erro ao localizar o registro. Por favor consulte novamente', '');
          end;
        end;
        dataSet.Edit;
        Itens.dataSet.Refresh;
        if AvNF_Old <> dataSet.FieldByName('vnf').AsFloat then
          if Assigned(Pagamento.PagamentoChange) then
            Pagamento.PagamentoChange;

        FEspelho := EspelhoValores.Create(
          fequals('DESC_POR_ITEM', 'S'),
          YesNoEnum(fint('dfe_trib_ignorar')) = ynYes,
          ffloat('vprod'),
          ffloat('vdesc'),
          ffloat('vfrete'),
          ffloat('vseg'),
          ffloat('voutro')
        );
      end;
    finally
      if Codigo <> dataSet.FieldByName('COD_NFCE').AsInteger then
      begin
        if not dataSet.Locate('COD_NFCE', Codigo, []) then
          AbreRegistros(Codigo);
        if Codigo <> dataSet.FieldByName('COD_NFCE').AsInteger then
          raiseExceptionCreate('Erro ao localizar o registro. Por favor consulte novamente', '');
      end;
    end;
  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      dataSet.RefreshRecord;
      dataSet.Edit;
      Itens.dataSet.Refresh;
      Application.MessageBox(pchar('Erro ao salvar e calcular totais. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('TNFCe.SalvarECalcular Erro: ' + e.Message);
    end;
  end;
end;

function TNFCe.HouveAlteracao: Boolean;
begin
  if dataSet.FieldByName('cod_nfce').AsInteger = 0 then
  begin
    Result := False;
    Exit;
  end;
  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  try
    dataSet.Post;
    Result := dataSet.ChangeCount > 0;
  finally
    if (dataSet.State = dsBrowse) and (not dataSet.IsEmpty) then
      dataSet.Edit;
  end;
end;

function TNFCe.SetArrayOfcod_nfce(): Integer;
begin
  Result := 0;
  SetLength(Processamento.ArrayNFCE, 0);
  try
    prepare_loop('sel = ''S''');
    while not dataSet.Eof do
    begin
      SetLength(Processamento.ArrayNFCE, Length(Processamento.ArrayNFCE) + 1);
      Processamento.ArrayNFCE[High(Processamento.ArrayNFCE)] := fint('cod_nfce');

      dataSet.Next;
    end;
  finally
    Result := Length(Processamento.ArrayNFCE);

    prepare_loop_done();
  end;
end;

procedure TNFCe.SetCliente(LocalizarCliente: Boolean; var ClienteConsumidor: Boolean);
var
  CodigoCliente: Integer;
  Aiss_retido: string;
begin
  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  try

    CodigoCliente := dataSet.FieldByName('COD_CLIENTE').AsInteger;
    if LocalizarCliente then //F3 chamado da tela
    begin
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES', '', 'Consulta de clientes');
      if StrToIntDef(Trim(vDadosIni.vPesquisa), -1) < 0 then
        Exit;
      CodigoCliente := StrToInt(vDadosIni.vPesquisa);
    end;

    if CodigoCliente = 0 then // cliente nao informado entao os campos serao liberados na tela
    begin
      ClienteConsumidor := True;
      dataSet.FieldByName('COD_CLIENTE').AsVariant := Null;
      Exit;
    end;

    if not SetCodigoInterno then
      raiseExceptionCreate('Cliente destinatário não pode ser definido por problemas ao gerar código interno da NFC-e: TNFCe.SetCliente', '');

    if (dataSet.FieldByName('ped_origem_num').AsInteger > 0) and
      (CodigoCliente = FConfigNFCe.CodigoClientePadrao) then
      SqlOpen('select pv.cod_cliente, pv.nome_clientedav nome_cliente, pv.nome_clientedav razao,' +
        ' pv.cpfcgc, '' '' fone_cliente, '' '' email, pv.end_avl endereco, ' +
        ' '' '' num_end_cliente, '' '' complemento, pv.bairro_avl bairro, pv.cida_avl cidade, pv.cep_avl cep,' +
        ' 9 nfe_indiedest, ''N'' iss_retido, cid.ibge_cod_cidade, pv.esta_avl sigla_uf' +
        ' from pedvenda pv' +
        ' left join cidades cid on cid.nome_cidade = pv.cida_avl' +
        ' where pv.nped = ' + IntToStr(dataSet.FieldByName('ped_origem_num').AsInteger) +
        ' and pv.tipo = ' + QuotedStr(dataSet.FieldByName('ped_origem_tip').AsString) +
        ' and pv.cod_empresa = ' + vDadosIni.codEmpresa)
    else
      SqlOpen(
        'select cl.cod_cliente, cl.nome_cliente, cl.razao, cl.cpfcgc, cl.fone_cliente, cl.email, cl.endereco, ' +
        ' cl.num_end_cliente, cl.complemento, cl.bairro, cl.cidade, cl.cep, cl.nfe_indiedest, cl.iss_retido,' +
        ' cid.ibge_cod_cidade, es.sigla_uf' +
        ' from clientes cl' +
        ' left join cidades cid on cid.cod_cidade = cl.cod_cidade' +
        ' left join estados es on es.codigo_uf = cl.codigo_uf' +
        ' where cl.cod_cliente = ' + IntToStr(CodigoCliente) +
        ' and cl.cod_empresa = ' + vDadosIni.codEmpresa);

  //  buscas.Close;
  //  buscas.SQL.Text := 'select COD_CLIENTE, TIPO, NOME_CLIENTE, RAZAO, CPFCGC, EMAIL, NFE_INDIEDEST, ISS_RETIDO from clientes' +
  //    ' where cod_cliente = ' + IntToStr(CodigoCliente) +
  //    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  //  buscas.Open;

    //cliente selecionado igual ao cliente consumidor configurado
    ClienteConsumidor := (buscas.FieldByName('COD_CLIENTE').AsInteger > 0) and
                         (buscas.FieldByName('COD_CLIENTE').AsInteger = FConfigNFCe.CodigoClientePadrao);
    Aiss_retido       := buscas.FieldByName('iss_retido').AsString;

    if not buscas.IsEmpty then
    begin
      {
      if (Length(Trim(buscas.FieldByName('cpfcgc').AsString)) = 14)
        and (Date >= ConfigNFCe.NT.sinief_11_2025) then
      begin
        dataSet.FieldByName('COD_CLIENTE').AsVariant := Null;
        ClienteConsumidor := True;

        Dest.Delete;
        Dest.Apply;
        SalvarECalcular(False);
        ShowErro('Cliente informado possui CNPJ. Emissão de NFC-e vedada de acordo Ajuste SINIEF Nº 11, 2025');
        Exit;
      end
      else
      }
      if (not ClienteConsumidor) then
        if buscas.FieldByName('NFE_INDIEDEST').AsInteger = 1 then
          if not ConfigNFCe.Regras.PermitirNFCeContribuinteICMS then
          begin
            Application.MessageBox('Cliente informado é Contribuinte de ICMS(Indicador de inscrição estadual = 1). NFC-e não permitida', 'Atenção', MB_ICONERROR + MB_OK);
            dataSet.FieldByName('COD_CLIENTE').AsVariant := Null;
  //          dataSet.FieldByName('XNOME').AsString        := '';
  //          dataSet.FieldByName('CPFCNPJ').AsString      := '';
  //          dataSet.FieldByName('EMAIL').AsString        := '';
            ClienteConsumidor := True;

            Dest.Delete;
            Dest.Apply;
            SalvarECalcular(False);

            Exit;
          end
          else
            Application.MessageBox('Cliente informado é Contribuinte de ICMS(Indicador de inscrição estadual = 1)', 'Atenção', MB_ICONEXCLAMATION + MB_OK);

      dataSet.FieldByName('COD_CLIENTE').AsInteger := CodigoCliente;
      if Dest.IsEmpty then
        Dest.Insert
      else
        Dest.Edit;
      with Dest.dataSet do
      begin
        FieldByName('cnpjcpf').AsString := IfThen(not ClienteConsumidor, buscas.FieldByName('cpfcgc').AsString);
        FieldByName('xnome').AsString   := buscas.FieldByName('razao').AsString;
        FieldByName('email').AsString   := buscas.FieldByName('email').AsString;
        FieldByName('xlgr').AsString    := buscas.FieldByName('endereco').AsString;
        FieldByName('nro').AsString     := buscas.FieldByName('num_end_cliente').AsString;
        FieldByName('xcpl').AsString    := buscas.FieldByName('complemento').AsString;
        FieldByName('xbairro').AsString := buscas.FieldByName('bairro').AsString;
        FieldByName('cmun').AsInteger   := buscas.FieldByName('ibge_cod_cidade').AsInteger;
        FieldByName('xmun').AsString    := buscas.FieldByName('cidade').AsString;
        FieldByName('uf').AsString      := buscas.FieldByName('sigla_uf').AsString;
        FieldByName('cep').AsString     := buscas.FieldByName('cep').AsString;
        FieldByName('fone').AsString    := buscas.FieldByName('fone_cliente').AsString;
      end;
      Dest.Post;
      Dest.Apply;
      SalvarECalcular(False);

      Itens.AtualizarInfRetencao(Aiss_retido);
      if ClienteConsumidor then
        dataSet.FieldByName('COD_CLIENTE').AsVariant := Null;
      //if HouveAlteracao or Dest.

    end;
  except on E: Exception do
    begin
      Application.MessageBox(pchar('Erro ao pesquisar/definir cliente destinatário. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('TNFCe.SetCliente Erro: ' + e.Message);
    end;
  end;
end;

function TNFCe.SetCodigoInterno: Boolean;
var
  Codigo: Integer;
begin
  try
    Result := False;
    if dataSet.FieldByName('cod_nfce').AsInteger > 0 then
    begin
      Result := True;
      Exit;
    end;

    if not (dataSet.State in [dsEdit, dsInsert]) then
      raiseExceptionCreate('DataSet não esta em modo de edição ou inserção: TNFCe.SetCodigoInterno', '');

    dataSet.FieldByName('data_mod').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('us_mod').AsInteger := vDadosIni.vCodUsuario;
    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('cod_nfce').AsInteger := Gencodigo('NFCE', buscas, vDadosIni.codEmpresa);
      dataSet.FieldByName('data_cad').AsDateTime := dataSet.FieldByName('data_mod').AsDateTime;
      dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      dataSet.FieldByName('ativo').AsInteger := 1;
    end;
    Codigo := dataSet.FieldByName('cod_nfce').AsInteger;

    dataSet.Post;

    if (dataSet.ChangeCount = 0) then
      raiseExceptionCreate('DataSet não localizaou alterações: TNFCe.SetCodigoInterno', '');

    Dest.AbreRegistros;
    Itens.AbreRegistros;
    Pagamento.AbreRegistros;

    Result := SalvarECalcular(False);
  except
    on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao gerar numero interno. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('TNFCe.SetCodigoInterno Erro: ' + e.Message);
    end;
  end;
end;

procedure TNFCe.SetDataEmissao(var Data, Hora: string);
var
  DataHora: TDateTime;
begin
  if not (dataSet.State in [dsInsert, dsEdit])  then
    Exit;

  DataHora := vDadosIni.getDataHoraBanco(buscas);
  try
    try
      if StrToDate(Data) > DateOf(DataHora) then
        raiseExceptionCreate('Data de emissão não pode ser maior que a data atual', 'MaskEdit5');

      if StrToDate(Data) = DateOf(DataHora) then
        if StrToTime(Hora) = TimeOf(DataHora) then
          raiseExceptionCreate('Hora de emissão não pode ser maior a hora atual quando a data de emissão igual a data atual', 'MaskEdit6');

      dataSet.FieldByName('dhemi').AsDateTime := StrToDate(Data) + StrToTime(Hora);
    finally
      Data := DateToStr(DateOf(dataSet.FieldByName('dhemi').AsDateTime));
      Hora := TimeToStr(TimeOf(dataSet.FieldByName('dhemi').AsDateTime));
    end;
  except on E: Exception do
    begin
      Application.MessageBox(PChar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
    end;
  end;
end;

procedure TNFCe.SetDescontoNoCabecalho(Value: Boolean);
var
  MaisDados: string;
begin
  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  MaisDados := ' ' + Trim(dataSet.FieldByName('DESC_POR_ITEM').AsString) + '->' + vDadosIni.IfThen(
    dataSet.FieldByName('DESC_POR_ITEM').AsString = 'S', 'N', 'S');

  if not vDadosIni.PesqPros('NFC024', 'ALTERAR', Audit_Dados + MaisDados, 'NFCE', Audit_Codigo) then
    Exit;

  dataSet.FieldByName('DESC_POR_ITEM').AsString := vDadosIni.IfThen(
    dataSet.FieldByName('DESC_POR_ITEM').AsString = 'S', 'N', 'S');
end;

procedure TNFCe.SetFieldChangeEvnt(const Value: TFieldNotifyEvent);
var
  I: Integer;
begin
  if not Assigned(Value) then
    for I := FFieldsWithNotificationChange.Count - 1 downto 0 do
      UnRegisterNotificationToField(FFieldsWithNotificationChange[I]);

  FFieldChangeEvnt := Value;
end;

procedure TNFCe.SetLastError(const Value: string; const Args: array of const);
begin
  SetLastError(Format(Value, Args));
end;

procedure TNFCe.SetLastError(const Value: string);
begin
  LastError := LastError + IfThen(LastError <> '', sLineBreak) + Value;
end;

procedure TNFCe.SetLastMessage(Msg: string; Error: Boolean);
begin
  FLastMessage := Msg;
  FLastMessageType := IfThen(Error, 'Erro', 'Atenção');
  if Assigned(FLogMessage) then
    FLogMessage(Self);


  if not EmissaoRapida then
    if Error then
      ShowErro(FLastMessage)
    else
      ShowAtencao(FLastMessage);
end;

procedure TNFCe.SetLastRejeicao(const Value: string);
begin
  FLastRejeicao := Value;
  if FLastRejeicao <> '' then
    if Assigned(FLogRejeicao) then
      FLogRejeicao(Self);
end;

procedure TNFCe.SetNaturezaDeOperacao;
begin
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('NAT_OP', 'AND CODIGO_NOP >= 5000', 'Consulta de Natureza de Operação');
  if StrToIntDef(Trim(vDadosIni.vPesquisa), -1) < 0 then
    Exit;

  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  dataSet.FieldByName('NATOP').AsFloat := StrToFloat(vDadosIni.vPesquisa);

  if StrToIntDef(Trim(dataSet.FieldByName('NATOP').AsString), -1) > 0 then
  begin
    dataSet.FieldByName('NATOP').AsString  := retornaValor('select descricao_nop as valor from nat_op' +
      ' where codigo_nop = ' + IntToStr(StrToIntDef(Trim(dataSet.FieldByName('NATOP').AsString), -1)));
  end;
end;

function TNFCe.PedVenda_SetNFCeFromPedVenda(APedVenda: TReg_PedVenda): Boolean;
var
  I, J: Integer;
  Asum: Double;
  AclienteConsumidor: Boolean;

  function CpfCnpjValid(CpfCnpj: string): string;
  var
    J: Integer;
  begin
    Result := CpfCnpj;
    if (StrLength(Result) = 11) or (StrLength(Result) = 14) then
      for J := 0 to 9 do
        if Result = PadL(I, StrLength(Result)) then
        begin
          Result := '';
          Exit;
        end;
  end;

begin
  if not Assigned(APedVenda) then
  begin
    Result := False;
    Exit;
  end;

  dataSet.FieldByName('vfrete').AsFloat := 0;
  dataSet.FieldByName('vseg').AsFloat   := 0;
  dataSet.FieldByName('vdesc').AsFloat  := 0;
  dataSet.FieldByName('voutro').AsFloat := 0;
  dataSet.FieldByName('vnf').AsFloat    := 0;

  dataSet.FieldByName('cod_vendedor').AsInteger := APedVenda.cod_vendedor;
  dataSet.FieldByName('cod_cond_pag').AsInteger := APedVenda.cod_cond_pag;
  if APedVenda.cod_cliente = FConfigNFCe.CodigoClientePadrao then
    dataSet.FieldByName('cod_cliente').Value := Null
  else
    dataSet.FieldByName('cod_cliente').AsInteger  := APedVenda.cod_cliente;

    if APedVenda.id_commerce > 0 then
    begin
      if not SqlOpen('select pv.id_commerce, pv.local_venda, ct.nome_ctrl, cl.nome_cliente, cl.cpfcgc, i.idcadinttran from pedvenda pv' +
                     ' left join intermediador_controle_ec i on i.local_venda = pv.local_venda and i.cod_empresa = pv.cod_empresa' +
                     ' left join controles ct on ct.codigo_ctrl = i.codigo_ctrl and ct.codigo_emp = i.cod_empresa' +
                     ' left join clientes cl on cl.cod_cliente = ct.cartao_sped_part and cl.cod_empresa = ct.codigo_emp' +
                     ' where pv.nped = %d and pv.tipo = %s and pv.cod_empresa = %d and pv.id_commerce > 0',
                     [APedVenda.nped, QuotedStr(APedVenda.tipo), vDadosIni.cod_empresa]).IsEmpty then
      begin
        dataSet.FieldByName('indpres').AsString := '4';
        if Trim(buscas.FieldByName('cpfcgc').AsString) = vDadosIni.vEmp.vCNPJ then
          dataSet.FieldByName('indintermed').AsString := '0'
        else
        begin
          if Trim(buscas.FieldByName('cpfcgc').AsString) <> '' then
          begin
            dataSet.FieldByName('indintermed').AsString := '1';
            dataSet.FieldByName('infintermed_cnpj').AsString := Trim(buscas.FieldByName('cpfcgc').AsString);
            dataSet.FieldByName('infintermed_idcadinttran').AsString := Trim(buscas.FieldByName('idcadinttran').AsString);
            dataSet.FieldByName('infintermed_idcadinttran').AsString := IfThen(fempty('infintermed_idcadinttran'), vDadosIni.vEmp.vnomeEmpresa, fstr('infintermed_idcadinttran'));
          end
          else
          begin
            ShowAtencao('Venda do ecommerce e não foi encontrado a ligação entre o Intermediador/Marketplace dessa venda com o cadastro de clientes/fornecedor' + sLineBreak +
                        'O vínculo é feito com o Controle, e no seu cadastro existe o campo usado para vincular as operações de pagamento(cartão e ecommerce)' + sLineBreak + sLineBreak +
                        'Informação do ecommerce: %s' + sLineBreak + sLineBreak +
                        'Por favor acesse a aba "Mais NFe" complete os dados que faltam ', [buscas.FieldByName('local_venda').AsString]);
            if vDadosIni.getDataBanco(buscas) >= EncodeDate(2021, 09, 01) then
              dataSet.FieldByName('indintermed').AsString := '1';
          end;
        end;
      end;
    end;

  Dest.Insert;

  AclienteConsumidor := (APedVenda.Cliente.Codigo > 0) and
                        (APedVenda.Cliente.Codigo = FConfigNFCe.CodigoClientePadrao);

  Dest.dataSet.FieldByName('cnpjcpf').AsString := CpfCnpjValid(APedVenda.Cliente.cpfcnpj);
  Dest.dataSet.FieldByName('xnome').AsString   := APedVenda.Cliente.NomeFantasia;
  Dest.dataSet.FieldByName('email').AsString   := APedVenda.Cliente.email;
  Dest.dataSet.FieldByName('xlgr').AsString    := APedVenda.Cliente.endereco.Logradouro;
  Dest.dataSet.FieldByName('nro').AsString     := APedVenda.Cliente.endereco.Numero;
  Dest.dataSet.FieldByName('xcpl').AsString    := APedVenda.Cliente.endereco.Complemento;
  Dest.dataSet.FieldByName('xbairro').AsString := APedVenda.Cliente.endereco.Bairro;
  Dest.dataSet.FieldByName('cmun').AsInteger   := APedVenda.Cliente.endereco.Cidade.IBGE_Cidade;
  Dest.dataSet.FieldByName('xmun').AsString    := APedVenda.Cliente.endereco.Cidade.Nome;
  Dest.dataSet.FieldByName('uf').AsString      := APedVenda.Cliente.endereco.Cidade.UF;
  Dest.dataSet.FieldByName('cep').AsString     := APedVenda.Cliente.endereco.CEP;
  Dest.dataSet.FieldByName('fone').AsString    := APedVenda.Cliente.telefone;
  Dest.dataSet.Post;

  SetStatusAberta;

  for I := 0 to APedVenda.Prod.Count - 1 do
    with APedVenda.Prod.Items[I] do
                                    
    begin
      Itens.Prod.buscaProduto(grupo_prod, cod_prod, True);

      if Itens.FProd.dataSet.RecordCount = 0 then
        raiseExceptionCreate('Nenhum produto encontrado para o grupo %d e código %s', [grupo_prod, cod_prod]);

      if not Itens.Insert then
        Exit;

      if FConfigNFCe.Pedido.SubtrairDescontoNoTotal and (rateio_desc > 0) then
        if (vltot_ped_item - rateio_desc) > 0 then
        begin
          vltot_ped_item := vltot_ped_item - rateio_desc;
          rateio_desc    := 0;
        end;

      if FConfigNFCe.Pedido.SomarAcrecimoNoTotal and (rateio_acresc > 0) then
      begin
        vltot_ped_item := vltot_ped_item + rateio_acresc;
        rateio_acresc    := 0;
      end;

      vlun_ped_item  := RoundTo(vltot_ped_item / quant_ped_item, 0 - FConfigNFCe.Itens.CasasDecimaisQtde);
      if RoundTo(vltot_ped_item, -2) <> RoundTo(vlun_ped_item * quant_ped_item, -2) then
        for J := FConfigNFCe.Itens.CasasDecimaisQtde + 1 to 10 do
        begin
          vlun_ped_item  := RoundTo(vltot_ped_item / quant_ped_item, 0 - J);
          if RoundTo(vltot_ped_item, -2) = RoundTo(vlun_ped_item * quant_ped_item, -2) then
            Break;
        end;

      Itens.dataSet.FieldByName('tipo_item').AsString := 'P';
      Itens.dataSet.FieldByName('grupo_prod').AsInteger := grupo_prod;
      Itens.dataSet.FieldByName('cod_prod').AsString := cod_prod;
      Itens.dataSet.FieldByName('cod_grade').AsInteger := cod_grade;
      Itens.dataSet.FieldByName('num_fab_prod').AsString := num_fab_prod;
      Itens.dataSet.FieldByName('xprod').AsString := descr_prod_ped;
      Itens.dataSet.FieldByName('qcom').AsFloat := quant_ped_item;
      Itens.dataSet.FieldByName('vuncom').AsFloat := vlun_ped_item;
      Itens.dataSet.FieldByName('vprod').AsFloat := vltot_ped_item;
      Itens.dataSet.FieldByName('vdesc').AsFloat := rateio_desc;
      Itens.dataSet.FieldByName('uvnd').AsString := uvnd;
      Itens.dataSet.FieldByName('uvnd_fator').AsFloat := uvnd_fator;

      dataSet.FieldByName('voutro').AsFloat :=  dataSet.FieldByName('voutro').AsFloat + rateio_acresc;

      Itens.SetDadosFiscaisProduto();

      Itens.dataSet.Post;
    end;

  if dataSet.State in [dsEdit, dsInsert] then
  begin
    dataSet.Post;
    if (dataSet.ChangeCount > 0) then
      Apply;
  end;

  if (Itens.dataSet.ChangeCount > 0) then
    Itens.Apply;

  SqlOpen('select sucesso from sp_nfce_rec_rateios(%d, %d)', [fint('cod_nfce'), fint('cod_empresa')]);
  dataSet.Refresh;
  dataSet.Edit;

  Asum := 0;

  for I := 0 to APedVenda.PagamentoNFCe.Count - 1 do
    with APedVenda.PagamentoNFCe.Items[I] do
      if Controle.nfce_tpag > 0 then
      begin

        buscas.Close;
        buscas.SQL.Text := 'insert into nfce_pagamento (cod_nfce, cod_empresa, seqid, tpag, vpag, cnpj, tband, caut, cod_controle, tpintegra, id_tr_cartao, guid_tr_cartao)' +
          ' values ' +
          ' (:cod_nfce, :cod_empresa, :seqid, :tpag, :vpag, :cnpj,' +
          ' :tband, :caut, :cod_controle, :tpintegra, :id_tr_cartao, :guid_tr_cartao)';
        buscas.ParamByName('seqid').AsInteger := SqlOpen('select cod from incrementa_codigo(' + vDadosIni.codEmpresa + ', ' + QuotedStr('NFCE_PAGAMENTO') + ')', buscas1).FieldByName('COD').AsInteger;
        buscas.ParamByName('cod_nfce').AsInteger := dataSet.FieldByName('cod_nfce').AsInteger;
        buscas.ParamByName('cod_empresa').AsInteger := dataSet.FieldByName('cod_empresa').AsInteger;
        buscas.ParamByName('tpag').AsInteger        := Controle.nfce_tpag;
        if (Asum + valordoc) >= ffloat('vnf') then
          buscas.ParamByName('vpag').AsFloat := ffloat('vnf') - Asum
        else
          buscas.ParamByName('vpag').AsFloat := valordoc;
        buscas.ParamByName('cnpj').AsString := IfThen(Length(Controle.AdmCartao.cpfcnpj) = 14, Controle.AdmCartao.cpfcnpj);
        if Controle.nfce_tband > 0 then
          buscas.ParamByName('tband').AsInteger := Controle.nfce_tband
        else
          buscas.ParamByName('tband').Value := Null;
        buscas.ParamByName('caut').AsString := n_aut_cart;
        if Controle.codigo_ctrl <> 0 then
          buscas.ParamByName('cod_controle').AsInteger := Controle.codigo_ctrl
        else
          buscas.ParamByName('cod_controle').AsInteger := Null;
        if idTrCartao > 0 then
        begin
          buscas.ParamByName('id_tr_cartao').AsInteger := idTrCartao;
          buscas.ParamByName('guid_tr_cartao').AsString := guidTrCartao;
          buscas.ParamByName('tpintegra').AsString := '1';
        end
        else
        begin                                                           
          buscas.ParamByName('id_tr_cartao').Value := Null;
          buscas.ParamByName('guid_tr_cartao').Value := Null;
          buscas.ParamByName('tpintegra').AsString := '2';
        end;
        buscas.ExecSQL;

        if (Asum + valordoc) >= ffloat('vnf') then
          Break;
        Asum := Asum + valordoc;
      end;

  Pagamento.Refresh;
  if Pagamento.dataSet.RecordCount > 0 then
  begin
    dataSet.FieldByName('vtroco').AsFloat := Pagamento.ValorTroco;
    SetStatusFechando;
  end;

  if (Itens.dataSet.ChangeCount > 0) or (Dest.dataSet.ChangeCount > 0) then
  begin
    if (Itens.dataSet.ChangeCount > 0) then
      if not Itens.Apply then
        Exit;

    if (Dest.dataSet.ChangeCount > 0) then
      if not Dest.Apply then
        Exit;

      Result := SalvarECalcular(True, True);
  end
  else
    Result := SalvarECalcular(True, True);
end;

procedure TNFCe.SetSeqPreco(IncPosition: Integer; Value: string);
var
  NewValue: Boolean;
  I, ProximoInt, AtualInt: Integer;
  Atual, Proximo: string;
  ArraySeqPreco: array[1..4] of string;
begin


  //IncPosition 0: Vai para o primeiro registro, 1: Ir para o proximo
  //Value: Quando chamado o metodo edit, este valor é chamado para que monte a lista com o item caso ele nao esteja presente
  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  if not vDadosIni.PesqPros('NFC023', 'ALTERAR', Audit_Dados ,
    'NFCE', Audit_Codigo) then
    exit;

  Value := Trim(Value);
  if not (vDadosIni.strIn(Value, ['1','2','3','4'])) then
    Value := '';

  if Value <> '' then
  begin
    NewValue := True;
    for I := 0 to FConfigNFCe.ListSeqPreco.Count - 1 do
      if vDadosIni.getValue(FConfigNFCe.ListSeqPreco[i], 1) = Value then
      begin
        NewValue := False;
        Break;
      end;
    if NewValue then
      if (Value = '1') then      FConfigNFCe.ListSeqPreco.Add('|1|1 - ' + ' A Vista|')
      else if (Value = '2') then FConfigNFCe.ListSeqPreco.Add('|2|2 - ' + ' Prazo 30 dias|')
      else if (Value = '3') then FConfigNFCe.ListSeqPreco.Add('|3|3 - ' + ' Prazo 60 dias|')
      else if (Value = '4') then FConfigNFCe.ListSeqPreco.Add('|4|4 - ' + ' Prazo 90 dias|');
    Exit;
  end;

  ArraySeqPreco[1] := vDadosIni.IfThen(Pos('|1|', FConfigNFCe.ListSeqPreco.Text) > 0, '1', '');
  ArraySeqPreco[2] := vDadosIni.IfThen(Pos('|2|', FConfigNFCe.ListSeqPreco.Text) > 0, '2', '');
  ArraySeqPreco[3] := vDadosIni.IfThen(Pos('|3|', FConfigNFCe.ListSeqPreco.Text) > 0, '3', '');
  ArraySeqPreco[4] := vDadosIni.IfThen(Pos('|4|', FConfigNFCe.ListSeqPreco.Text) > 0, '4', '');

  if (IncPosition = 0) then
  begin
    Proximo := vDadosIni.IfThen(FConfigNFCe.ListSeqPreco.Count > 0, vDadosIni.getValue(FConfigNFCe.ListSeqPreco[0], 1), '1');
    if not (vDadosIni.strIn(Proximo, ['1','2','3','4'])) then
      Proximo := '1';
  end
  else if IncPosition = 1 then
  begin
    Atual := vDadosIni.IfThen(Trim(dataSet.FieldByName('seqpreco').AsString) <> '', Trim(dataSet.FieldByName('seqpreco').AsString), '1');
    AtualInt := StrToIntDef(dataSet.FieldByName('seqpreco').AsString, 1);
    ProximoInt := AtualInt + 1;
    Proximo := '';
    I := 0;
    while (Proximo = '') and (Trim(Atual) <> '0') do
    begin
      if ProximoInt > 4 then
        ProximoInt := 1;
      Proximo := ArraySeqPreco[ProximoInt];
      ProximoInt := ProximoInt + 1;
      I := I + 1;
      if I >= 4 then
        Proximo := Atual;
    end;
  end;

  dataSet.FieldByName('seqpreco').AsString := Proximo;
  if not (fstrin('seqpreco', ['1','2','3','4'])) then
    dataSet.FieldByName('seqpreco').AsString := '1';
  if dataSet.FieldByName('ped_origem_num').AsInteger = 0 then
    if not SqlOpen(' select first 1 cond_pag.cod_cond_pag from cond_pag ' +
                	 ' inner join cond_pag_empresa on ' +
                   '   cond_pag_empresa.cod_cond_pag = cond_pag.cod_cond_pag ' +
                   '   and cond_pag_empresa.cod_empresa = ' + vDadosIni.codEmpresa +
                   ' where cond_pag.seqpreco = ' + QuotedStr(dataSet.FieldByName('seqpreco').AsString) +
                   ' and cond_pag.natureza_cp <> ''C''' +
                   ' order by cond_pag.cod_cond_pag ').IsEmpty then
      dataSet.FieldByName('cod_cond_pag').AsInteger := buscas.FieldByName('cod_cond_pag').AsInteger
    else if not SqlOpen(' select first 1 cond_pag.cod_cond_pag from cond_pag ' +
                	 ' inner join cond_pag_empresa on ' +
                   '   cond_pag_empresa.cod_cond_pag = cond_pag.cod_cond_pag ' +
                   '   and cond_pag_empresa.cod_empresa = ' + vDadosIni.codEmpresa +
                   ' where cond_pag.natureza_cp <> ''C''' +
                   ' order by cond_pag.cod_cond_pag ').IsEmpty then
      dataSet.FieldByName('cod_cond_pag').AsInteger := buscas.FieldByName('cod_cond_pag').AsInteger
    else
      dataSet.FieldByName('cod_cond_pag').AsInteger := SqlOpen(' select first 1 cond_pag.cod_cond_pag from cond_pag ' +
                                                               ' inner join cond_pag_empresa on ' +
                                                               '   cond_pag_empresa.cod_cond_pag = cond_pag.cod_cond_pag ' +
                                                               '   and cond_pag_empresa.cod_empresa = ' + vDadosIni.codEmpresa +
                                                               ' order by cond_pag.cod_cond_pag ').FieldByName('cod_cond_pag').AsInteger;
end;

function TNFCe.SetStatusAberta: Boolean;
begin
  Result := False;
  if dataSet.FieldByName('cod_nfce').AsInteger = 0 then
    Exit;

  if not (dataSet.State in [dsEdit, dsInsert]) then
    Exit;

  dataSet.FieldByName('status').AsString := stsAberta;

  if Assigned(FStatusChange) then
    FStatusChange;

  Result := True;
end;

function TNFCe.SetStatusFechando: Boolean;
begin
  Result := False;
  if dataSet.FieldByName('cod_nfce').AsInteger = 0 then
    Exit;

  if not (dataSet.State in [dsEdit, dsInsert]) then
    Exit;

  dataSet.FieldByName('status').AsString := stsFechando;
                  
  if Assigned(FStatusChange) then
    FStatusChange;

  Result := True;
end;

procedure TNFCe.SetTransportador(LocalizarTransporta: Boolean);
var
  CodigoTransporta: Integer;
begin
  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  CodigoTransporta := dataSet.FieldByName('TR_CODIGO').AsInteger;
  if LocalizarTransporta then //F3 chamado da tela
  begin
    vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES', '', 'Consulta de clientes');
    if StrToIntDef(Trim(vDadosIni.vPesquisa), -1) < 0 then
      Exit;
    CodigoTransporta := StrToInt(vDadosIni.vPesquisa);
  end;
  dataSet.FieldByName('TR_CODIGO').AsVariant := CodigoTransporta;

  if Transporta.IsEmpty then
    dataSet.FieldByName('TR_CODIGO').AsVariant := Null;
end;

procedure TNFCe.SomarTotaisTributosRTC;
begin
  queryCons.SQL(
    'merge into nfce n ' + 
    'using ' + 
    '( ' + 
    '  select ' + 
    '    ni.cod_nfce, ni.cod_empresa, ' + 
    '    sum(coalesce(ni.vitem, 0)) vitem, ' + 
    '    sum(coalesce(g.vbc, 0)) vbcibscbs, ' + 
    '    sum(coalesce(g.ibsuf_vdif, 0)) ibsuf_vdif, ' + 
    '    sum(coalesce(g.ibsuf_vdevtrib, 0)) ibsuf_vdevtrib, ' + 
    '    sum(coalesce(g.vibsuf, 0)) vibsuf, ' + 
    '    sum(coalesce(g.ibsmun_vdif, 0)) ibsmun_vdif, ' + 
    '    sum(coalesce(g.ibsmun_vdevtrib, 0)) ibsmun_vdevtrib, ' + 
    '    sum(coalesce(g.vibsmun, 0)) vibsmun, ' + 
    '    sum(coalesce(g.vibs, 0)) vibs,       ' + 
    '    sum(coalesce(g.cbs_vdif, 0)) cbs_vdif, ' + 
    '    sum(coalesce(g.cbs_vdevtrib, 0)) cbs_vdevtrib, ' + 
    '    sum(coalesce(g.vcbs, 0)) vcbs, ' + 
    '    sum(coalesce(m.vibsmono, 0)) vibsmono, ' + 
    '    sum(coalesce(m.vcbsmono, 0)) vcbsmono, ' + 
    '    sum(coalesce(m.vibsmonoreten, 0)) vibsmonoreten, ' + 
    '    sum(coalesce(m.vcbsmonoreten, 0)) vcbsmonoreten, ' + 
    '    sum(coalesce(m.vibsmonoret, 0)) vibsmonoret, ' + 
    '    sum(coalesce(m.vcbsmonoret, 0)) vcbsmonoret, ' + 
    '    sum(coalesce(s.vis, 0)) vis ' + 
    '  from nfce_item ni ' + 
    '    left join dfe_trib_contexto c on c.id = ni.dfe_trib_id and c.origem = 1 ' + 
    '    left join dfe_trib_gibscbs g on g.id = c.id ' + 
    '    left join dfe_trib_monofasia m on m.id = c.id ' + 
    '    left join dfe_trib_is s on s.id = c.id ' + 
    '  where cod_nfce = :cod_nfce and cod_empresa = :cod_empresa ' +
    '  group by cod_nfce, cod_empresa ' + 
    ') as ni ' + 
    'on ' + 
    '  (n.cod_nfce = ni.cod_nfce) and (n.cod_empresa = ni.cod_empresa) ' + 
    'when matched then ' + 
    '  update set ' + 
    '    vnftot = ni.vitem, ' + 
    '    vbcibscbs = ni.vbcibscbs, ' + 
    '    ibsuf_vdif = ni.ibsuf_vdif, ' + 
    '    ibsuf_vdevtrib = ni.ibsuf_vdevtrib, ' + 
    '    vibsuf = ni.vibsuf, ' + 
    '    ibsmun_vdif = ni.ibsmun_vdif, ' + 
    '    ibsmun_vdevtrib = ni.ibsmun_vdevtrib, ' + 
    '    vibsmun = ni.vibsmun, ' + 
    '    vibs = ni.vibs,      ' + 
    '    cbs_vdif = ni.cbs_vdif, ' + 
    '    cbs_vdevtrib = ni.cbs_vdevtrib, ' + 
    '    vcbs = ni.vcbs, ' + 
    '    vibsmono = ni.vibsmono,   ' + 
    '    vcbsmono = ni.vcbsmono, ' + 
    '    vibsmonoreten = ni.vibsmonoreten, ' + 
    '    vcbsmonoreten = ni.vcbsmonoreten, ' + 
    '    vibsmonoret = ni.vibsmonoret, ' + 
    '    vcbsmonoret = ni.vcbsmonoret, ' + 
    '    vis = ni.vis '
  )
  .ParamValue('cod_nfce', fint('cod_nfce'))
  .ParamValue('cod_empresa', fint('cod_empresa'))
  .ExecSQL();
end;

procedure TNFCe.UnRegisterNotificationToField(const FieldName: string);
var
  S: string;
  Idx: Integer;
begin
  S := UpperCase(Trim(FieldName));
  Idx := FFieldsWithNotificationChange.IndexOf(S);
  if Idx > -1 then
  begin
    dataSet.FieldByName(S).OnChange := nil;
    FFieldsWithNotificationChange.Delete( Idx );
  end;
end;

function TNFCe.ValidacaoQualquerAlteracao: RNFCe_Validacao;
begin
  with Result do
    if fint('cod_nfce') > 0 then
    begin
      SqlOpen('select status, situacao_nfce, tpemis from nfce' +
              ' where cod_nfce = ' + IntToStr(dataSet.FieldByName('cod_nfce').AsInteger) +
              ' and cod_empresa = ' + vDadosIni.codEmpresa);
      Status    := Trim(buscas.FieldByName('status').AsString);
      Situacao  := Trim(buscas.FieldByName('situacao_nfce').AsString);
      TpEmiss   := Trim(buscas.FieldByName('tpemis').AsString);
      if TpEmiss = '9' then
        Permitido := False
      else
        Permitido := (IndexText(Status  , [stsAberta, stsFechando, stsFechada]) >= 0) and
                     (IndexText(Situacao, [sitVazio , sitRejeitada]) >= 0);
    end
    else
    begin
      Status    := fstr('status');
      Situacao  := fstr('situacao_nfce');
      TpEmiss   := fstr('tpemis');
      Permitido := (IndexText(Status  , [stsAberta, stsFechada, stsFechando]) >= 0);
    end;
end;

function TNFCe.ValidarFecharNFC: Boolean;
var
  Diferenca: Double;
begin
  try
    buscas.Close;
    buscas.SQL.Text := 'select status, situacao_nfce from nfce' +
      ' where cod_nfce = ' + IntToStr(dataSet.FieldByName('cod_nfce').AsInteger) +
      ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger);
    buscas.Open;
    if buscas.FieldByName('status').AsString = stsFechada then
    begin
      dataSet.RefreshRecord;
      Result := True;
      Exit;
    end;

//    if buscas.FieldByName('status').AsString = stsCancelada then
//      raiseExceptionCreate('NFC Cancelada', '');
//
//    if vDadosIni.strIn(Trim(buscas.FieldByName('situacao_nfce').AsString),
//      [sitDenegada, sitCancelada, sitInutilizada]) then
//      raiseExceptionCreate('NFC-e ' + Trim(buscas.FieldByName('situacao_nfce').AsString), '');
//
    Pagamento.dataSet.Refresh;
    if vDadosIni.StrToFloatFormat(dataSet.FieldByName('vnf').AsFloat, 2) <= 0 then
      raiseExceptionCreate('Valor total da NFC menor ou igual a 0,00', '');
    if vDadosIni.StrToFloatFormat(Pagamento.ValorTotal, 2) <= 0 then
      raiseExceptionCreate('Total de pagamentos menor ou igual a 0,00', '');
    Diferenca := Pagamento.ValorTotal - dataSet.FieldByName('vnf').AsFloat;
    if RoundTo(Pagamento.ValorTotal, -2) < RoundTo(dataSet.FieldByName('vnf').AsFloat, -2) then
      raiseExceptionCreate('Valor total dos pagamentos menor que o valor da NFC', '')
    else if fstrin('NFE_VERSAO', [strVerVazio, strVer310]) then
      if RoundTo(Pagamento.ValorTotal, -2) > RoundTo(dataSet.FieldByName('vnf').AsFloat, -2) then
        raiseExceptionCreate('Valor total dos pagamentos maior que o valor da NFC', '');

    if (Dest.fempty('cnpjcpf')) and (ffloat('vnf') >= 10000) then
      raiseExceptionCreate('Valor maior ou igual a R$10.000,00 CPJ/CNPJ obrigatório');

    if (Dest.fempty('cnpjcpf')) and (fequals('indpres', '4')) then
      raiseExceptionCreate('Indicador de Presença "Entrega domicílio" CPJ/CNPJ obrigatório');

    if (fequals('indpres', '4')) and (Dest.fempty('xlgr')) then
      raiseExceptionCreate('Indicador de Presença "Entrega domicílio" Endereço obrigatório');


    dataSet.FieldByName('status').AsString := stsFechada;

    if HouveAlteracao then
    begin
      Result := Apply;
      if Result then
        Result:= CommitaTransacao;
    end
    else
      Result := CommitaTransacao;

    if Assigned(FStatusChange) then
      FStatusChange;

  except on E: Exception do
    begin
      Result := False;
      registraErro('TNFCe.ValidarFecharNFC Erro: ' + e.Message);
      SetLastMessage(e.Message);
    end;
  end;
end;

procedure TNFCe.VisualizaXML(AOperacao: TOperacaoNFCe);
var
  ACampo, AFileName: string;
  AXML: TStrings;
begin
  if AOperacao = opAutorizacao then
    ACampo := 'XML_NFCE'
  else if AOperacao = opCancelamento then
    ACampo := 'CANC_XML_NFCE'
  else
    ACampo := 'INUT_XML_NFCE';

  AXML := TStringList.Create;
  try
    AXML.Text := SqlOpen('select ' + ACampo + ' from nfce' +
                         ' where cod_nfce = ' + IntToStr(dataSet.FieldByName('cod_nfce').AsInteger) +
                         ' and cod_empresa = ' + vDadosIni.codEmpresa).FieldByName(ACampo).AsString;

    if Trim(AXML.Text) <> '' then
  finally
    FreeAndNil(AXML);
  end;
end;

function TNFCe.PedVenda_VerificarVinculo(ACommit, AGerarPagto: Boolean): Boolean;
begin
  if (fint('cod_nfce') <= 0) or (fint('cod_nfce_complementada') > 0)  then
  begin
    Result := True;
    Exit;
  end;

  try
    if not dataSet.Active then
      raiseExceptionCreate('DataSet não ativo', '');

    if dataSet.FieldByName('cod_nfce').AsInteger = 0 then
      raiseExceptionCreate('Sem NFC-e selecionada', '');

    Result := PedVenda_VerificarVinculo(dataSet.FieldByName('cod_nfce').AsInteger, ACommit);

  except on E: Exception do
    begin
      Result := False;
      vMensagemErro := E.Message;
    end;
  end;
end;

function TNFCe.PedVenda_VerificarVinculo(ACodNFC: Integer; ACommit, AGerarPagto: Boolean): Boolean;
var
  AStatus, ASituacao, ATpEmis: string;
  APedOrigTipo, APedDestTipo: string;
  APedOrigNum , APedDestNum : Integer;
  NOrc: Integer;
  ANumNF: Integer;
  APedCodNFCe: Integer;
  AGerarPedVenda, AUpdatePedVenda: Boolean;
  APedVenda: TReg_PedVenda;
  ARegistros: TGeraRegistros;
  Aformpag_pedvenda_gerarforma: Tformpag_pedvenda_gerarforma;
begin
  if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
  begin
    Result := True;
    Exit;
  end;

  try
    Result := False;

    SqlOpen( 'select cod_nfce, num_nf, status, situacao_nfce, tpemis, norc,' +
      ' ped_origem_num, ped_origem_tip, ped_destino_num, ped_destino_tip' +
      ' from nfce' +
      ' where cod_nfce = ' + IntToStr(ACodNFC) +
      ' and cod_empresa = ' + vDadosIni.CodEmpresa);
    if buscas.IsEmpty then
      raiseExceptionCreate('NFC-e informada não encontrada ' + IntToStr(ACodNFC), '');

    //Situacao da NFC-e
    AStatus      := Trim(buscas.FieldByName('status').AsString);
    ASituacao    := Trim(buscas.FieldByName('situacao_nfce').AsString);
    ATpEmis      := Trim(buscas.FieldByName('tpemis').AsString);
    APedCodNFCe  := buscas.FieldByName('cod_nfce').AsInteger;
    ANumNF       := buscas.FieldByName('num_nf').AsInteger;
    //Pedido de Origen = NFC-e a partir de uma PEDVENDA
    APedOrigTipo := Trim(buscas.FieldByName('ped_origem_tip').AsString);
    APedOrigNum  := buscas.FieldByName('ped_origem_num').AsInteger;
    //Pedido de Destino = NFC-e gerou uma PEDVENDA
    APedDestTipo := Trim(buscas.FieldByName('ped_destino_tip').AsString);
    APedDestNum  := buscas.FieldByName('ped_destino_num').AsInteger;
    NOrc         := buscas.FieldByName('norc').AsInteger;

    if (AStatus = stsCancelada) or
      (vDadosIni.strIn( ASituacao, [sitDenegada, sitCancelada, sitInutilizada])) then
    begin
      if APedOrigNum > 0 then
      begin
        SqlOpen('select COD_NFCE from pedvenda' +
          ' where nped = ' + IntToStr(APedOrigNum) +
          ' and tipo = ' + QuotedStr(APedOrigTipo) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa);

        if buscas.FieldByName('cod_nfce').AsInteger = ACodNFC then
          SqlExec('update pedvenda set cod_nfce = null, num_nfce = null' +
            ' where nped = ' + IntToStr(APedOrigNum) +
            ' and tipo = ' + QuotedStr(APedOrigTipo) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa +
            ' and cod_nfce = ' + IntToStr(ACodNFC));

        SqlExec('update nfce set ped_origem_num = null, ped_origem_tip = null' +
          ' where cod_nfce = ' + IntToStr(ACodNFC) +
          ' and cod_empresa = ' + vDadosIni.CodEmpresa +
          ' and ped_origem_num = ' + IntToStr(APedOrigNum) +
          ' and ped_origem_tip = ' + QuotedStr(APedOrigTipo));
      end
      else if APedDestNum > 0 then
      begin
        SqlOpen('select cod_nfce, nped, status_ped, tipo from pedvenda' +
          ' where nped = ' + IntToStr(APedDestNum) +
          ' and tipo = ' + QuotedStr(APedDestTipo) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa);

        if buscas.FieldByName('cod_nfce').AsInteger <> ACodNFC then
          Exit;

        //voltando estoque
        if Trim(buscas.FieldByName('status_ped').AsString) = stsPedFechada then
        begin
          APedVenda := PedVenda_GetFromPedVenda(APedDestNum, APedDestTipo);
          MovimentaEstoqueExecutar( APedVenda, False );

          //reabrindo a venda para gerar o historico de alteração de estoque cancelando pedvenda
          SqlExec('update pedvenda set status_ped = ' + QuotedStr(stsPedAberto) +
            ' where nped = ' + IntToStr(APedDestNum) +
            ' and tipo = ' + QuotedStr(APedDestTipo) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa +
            ' and cod_nfce = ' + IntToStr(ACodNFC) +
            ' and status_ped = ' + QuotedStr(stsPedFechada));

          //cancelando pedvenda
          SqlExec('update pedvenda set status_ped = ' + QuotedStr(stsPedCancelado) +
            ' where nped = ' + IntToStr(APedDestNum) +
            ' and tipo = ' + QuotedStr(APedDestTipo) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa +
            ' and cod_nfce = ' + IntToStr(ACodNFC) +
            ' and status_ped = ' + QuotedStr(stsPedAberto));

          //cancelando pedvenda_prod
          SqlExec('update pedvenda_prod set status = ' + QuotedStr(stsPedCancelado) +
            ' where nped = ' + IntToStr(APedDestNum) +
            ' and tipo = ' + QuotedStr(APedDestTipo) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa +
            ' and coalesce(status, '''') = ' + QuotedStr(stsPedAberto));
        end;
//        SqlExec('delete from pedvenda' +
//          ' where nped = ' + IntToStr(APedDestNum) +
//          ' and tipo = ' + QuotedStr(APedDestTipo) +
//          ' and cod_empresa = ' + vDadosIni.codEmpresa);
//        SqlExec('delete from pedvenda' +
//          ' where nped = ' + IntToStr(APedDestNum) +
//          ' and tipo = ' + QuotedStr(APedDestTipo) +
//          ' and cod_empresa = ' + vDadosIni.codEmpresa);
      end;

      SqlExec('update formpagamento fp set fp.ndoc = fp.ndoc_ant, fp.ndoc_ant = null, fp.cod_nfce = null' +
        ' where fp.cod_nfce = ' + IntToStr(ACodNFC) +
        ' and fp.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and fp.ndoc_ant is not null' +
        ' and fp.ndoc_ant <> ' + QuotedStr(''));
    end
    else
    begin
      if ((AStatus = stsFechada) and (ASituacao = sitAutorizada)) or
        ((AStatus = stsFechada) and (ATpEmis = '9')) then
      begin
        AGerarPedVenda  := (APedOrigNum = 0) and (APedDestNum = 0);
        AUpdatePedVenda := (APedOrigNum > 0) and (APedDestNum = 0);
      end
      else
      begin
        AGerarPedVenda  := False;
        AUpdatePedVenda := False;
      end;

      if AGerarPedVenda then
      begin
        SqlOpen('select COD_NFCE from pedvenda' +
          ' where nped = ' + IntToStr(APedOrigNum) +
          ' and tipo = ' + QuotedStr(APedOrigTipo) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa);
        AGerarPedVenda := buscas.FieldByName('COD_NFCE').AsInteger = 0;
      end;

      if AGerarPedVenda then
      begin

        //Gerando o registro do ped venda
        APedVenda := PedVenda_GetFromNFCe(ACodNFC);

        //Inserindo o pedvenda
        ARegistros := TGeraRegistros.create(buscas.Transaction);
        try
          APedVenda.status_ped := stsPedAberto;
          if not ARegistros.Inserir(APedVenda) then
            raiseExceptionCreate(ARegistros.LasError, '');

        finally
          FreeAndNil(ARegistros);
        end;

        //Baixando estoque
        MovimentaEstoqueExecutar(APedVenda, True);

        APedVenda.status_ped := stsPedFechada;
        SqlExec('update pedvenda set status_ped = ''%s'', cont_alt = cont_alt + 1' +
          ' where nped = %d and tipo = %s and cod_empresa = %d' +
          ' and cod_nfce = %d',
          [APedVenda.status_ped, APedVenda.nped, QuotedStr(APedVenda.tipo), vDadosIni.cod_empresa, ACodNFC]);

        //UPdate na nfce para criar o vinculo
        SqlExec('update nfce set ped_destino_num = ' + IntToStr(APedVenda.nped) +
          ' , ped_destino_tip = ' + QuotedStr(APedVenda.tipo) +
          ' where cod_nfce = ' + IntToStr(ACodNFC) +
          ' and cod_empresa = ' + vDadosIni.CodEmpresa +
          ' and ped_destino_num is null');

        if SqlOpen('select ped_destino_num, ped_destino_tip from nfce' +
          ' where cod_nfce = ' + IntToStr(ACodNFC) +
          ' and cod_empresa = ' + vDadosIni.CodEmpresa).IsEmpty then
          raiseExceptionCreate('NFC-e nao encontrada', '');

        if (buscas.FieldByName('ped_destino_num').AsInteger <> APedVenda.nped) or
          (Trim(buscas.FieldByName('ped_destino_tip').AsString) <> Trim(APedVenda.tipo)) then
          raiseExceptionCreate('Não foi concluir o processo. Registro gerado por outro processo', '');

        if ACommit and AGerarPagto and
          (vDadosIni.vEmp.vModoFaturamento <> 'S') and
          (not ConfigNFCe.Regras.InibirFormaDePagamento) then
        begin
          if ACommit then
            if buscas.Transaction.InTransaction then
              buscas.Transaction.Commit;

          if vDadosIni.vFormPag.AHandle = 0 then
            vDadosIni.LoadPackage('pkFormPag', vDadosIni.vFormPag.AHandle);

          @Aformpag_pedvenda_gerarforma := GetProcAddress(vDadosIni.vFormPag.AHandle, PChar('formpag_pedvenda_gerarforma'));
          if Assigned(Aformpag_pedvenda_gerarforma) then
            Aformpag_pedvenda_gerarforma(APedVenda.nped, APedVenda.tipo);
        end;

      end
      else if AUpdatePedVenda then
      begin
        SqlExec('update pedvenda set cod_nfce = %d, num_nfce = %d' +
          ' where nped = %d and tipo = %s and cod_empresa = %d' +
          ' and cod_nfce is null',
          [ACodNFC, ANumNF, APedOrigNum, QuotedStr(APedOrigTipo), vDadosIni.cod_empresa]);

        SqlExec('update formpagamento fp set fp.ndoc_ant = fp.ndoc, fp.cod_nfce = ' + IntToStr(ACodNFC) +
          ', fp.ndoc = ' +QuotedStr(vDadosIni.StrZero(ANumNF, 6))+
          '||substring(fp.ndoc from 7 for (char_length(fp.ndoc) - 6 ) )'+
          ' where  fp.nrequisicao = ' + IntToStr(APedOrigNum) +
          ' and fp.tpdocs = ' + QuotedStr(APedOrigTipo) +
          ' and fp.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and fp.ativo = 1 and fp.tipdoc = ''S2''' +
          ' and char_length(fp.ndoc) > 5' +
          ' and fp.cod_nfce is null');
      end;
    end;

    if NOrc > 0 then
      SqlExec('update pedvenda set cod_nfce = %d, num_nfce = %d where nped = %d and tipo = ''ORC'' and cod_empresa = %d',
              [ACodNFC, ANumNF, NOrc, vDadosIni.cod_empresa]);

    if ACommit then
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;

    Result := True;

  except on E: Exception do
    begin
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Rollback;
      vDadosIni.registraErro('TNFCe.VerificarVinculoPedVenda ' + IntToStr(ACodNFC) + '> ' + e.Message);
      vMensagemErro := e.Message;
      FLastMessage  := vMensagemErro;
    end;
  end;
end;

function TNFCe.PendenciasVerificar: RNFCe_ValidacaoEmGeral;
var
  AqtdePendente, AdatasPendente, qtdeACancEnv, qtdeAcanc, qtdeEnvi: Integer;
  sts: string;
  auditList: THw_auditoria_classList;
  I: Integer;
begin
  Result.Permitido := True;
  Result.Mensagem  := '';
  AqtdePendente    := 0;
  AdatasPendente   := 0;
  qtdeACancEnv     := 0;
  auditList        := THw_auditoria_classList.Create;

  if (ConfigNFCe.Regras.QtdeParaAvisoNotasPendentes <= 0) and
     (ConfigNFCe.Regras.QtdeDiasParaAvisoNotasPendentes <= 0) and
     (ConfigNFCe.Regras.QtdeDiasACancelarNaoResolvidas <= 0) and
     (ConfigNFCe.Regras.QtdeDiasEnviandoNaoResolvidas <= 0) then
    Exit;

  if (ConfigNFCe.Regras.QtdeParaAvisoNotasPendentes > 0) then
  begin
    SqlOpen('select coalesce(nf.situacao_nfce, '''') situacao_nfe, count(nf.cod_nfce) qtde from nfce nf' +
            ' where nf.cod_empresa = ' + vDadosIni.codEmpresa +
            ' and nf.ativo = 1' +
            ' and not coalesce(nf.situacao_nfce, '''') in (' + QuotedStr(sitEnviando) +
            ', ' + QuotedStr(sitEmProcessamento) + ', ' + QuotedStr(sitAutorizada) +
            ', ' + QuotedStr(sitDenegada) + ', ' + QuotedStr(sitCancelada) +
            ', ' + QuotedStr(sitInutilizada) + ', ' + QuotedStr(sitEmEPEC) + ')' +
            ' group by 1');
    while not buscas.Eof do
    begin
      if AqtdePendente = 0 then
        Result.Mensagem := Format('Quantidade de NFC-e pendentes acima do configurado %d' + sLineBreak, [ConfigNFCe.Regras.QtdeParaAvisoNotasPendentes]);
      AqtdePendente := AqtdePendente + buscas.FieldByName('qtde').AsInteger;
      Result.Mensagem := Result.Mensagem + sLineBreak + 'Quantidade pendente: ' + IntToStr(buscas.FieldByName('qtde').AsInteger) + ' - Situação: ' + buscas.FieldByName('situacao_nfe').AsString;
      buscas.Next;
    end;
    if (AqtdePendente <= ConfigNFCe.Regras.QtdeParaAvisoNotasPendentes ) then
      Result.Mensagem := '';
  end;

  if (ConfigNFCe.Regras.QtdeDiasParaAvisoNotasPendentes > 0) then
  begin
    SqlOpen('select coalesce(nf.situacao_nfce, '''') situacao_nfe, count(nf.cod_nfce) qtde from nfce nf' +
            ' where nf.cod_empresa = ' + vDadosIni.codEmpresa +
            ' and nf.ativo = 1' +
            ' and not coalesce(nf.situacao_nfce, '''') in (' + QuotedStr(sitEnviando) +
            ', ' + QuotedStr(sitEmProcessamento) + ', ' + QuotedStr(sitAutorizada) +
            ', ' + QuotedStr(sitDenegada) + ', ' + QuotedStr(sitCancelada) +
            ', ' + QuotedStr(sitInutilizada) + ', ' + QuotedStr(sitEmEPEC) + ')' +
            ' and nf.dhemi < ' + vDadosIni.FusoSqlDate + ' - ' + IntToStr(ConfigNFCe.Regras.QtdeDiasParaAvisoNotasPendentes) +
            ' group by 1');
    while not buscas.Eof do
    begin
      if AdatasPendente = 0 then
        Result.Mensagem := Result.Mensagem + sLineBreak + sLineBreak +
                          Format('Quantidade de NFC-e pendentes com data de emissão acima de %d dias como configurado' + sLineBreak, [ConfigNFCe.Regras.QtdeDiasParaAvisoNotasPendentes]);
      AdatasPendente := AdatasPendente + buscas.FieldByName('qtde').AsInteger;
      Result.Mensagem := Result.Mensagem + sLineBreak + 'Quantidade pendente: ' + IntToStr(buscas.FieldByName('qtde').AsInteger) + ' - Situação: ' + buscas.FieldByName('situacao_nfe').AsString;
      buscas.Next;
    end;
  end;

  if Result.Mensagem <> '' then
    auditList.New('NFC041', 'VALIDAR', Result.Mensagem, 'NFCE', '');

  if (ConfigNFCe.Regras.QtdeDiasACancelarNaoResolvidas > 0) or
     (ConfigNFCe.Regras.QtdeDiasEnviandoNaoResolvidas > 0) then
  begin
    vDadosIni.FusoDateTime;
    sts := stsACancelar;
    qtdeAcanc := 0;
    qtdeEnvi := 0;

    while sts <> '' do
    begin
      if ((sts = stsACancelar) and (ConfigNFCe.Regras.QtdeDiasACancelarNaoResolvidas > 0)) or
         ((sts = sitEnviando) and (ConfigNFCe.Regras.QtdeDiasEnviandoNaoResolvidas > 0)) then
      begin

        SqlOpen('select permitido from nfc_emissor_pendencias' +
                ' where cod_emissor = %d and cod_empresa = %d and data_cadastro = %s and tipo = ''%s''',
                [vDadosIni.vNFConsumidor.CodEmissor, vDadosIni.cod_empresa, vDadosIni.FusoSqlDate, sts]);
        if (buscas.FieldByName('permitido').AsString = 'N') or (Trim(buscas.FieldByName('permitido').AsString) = '') or
           ((buscas.FieldByName('permitido').AsString = 'D') and (TimeOf(vDadosIni.FusoDateTime(True)) > EncodeTime(14, 0, 0, 0))) then
        begin
          qtdeACancEnv := SqlScalar('select count(nf.cod_nfce) from nfce nf' +
                                    ' where nf.cod_empresa = %d' +
                                    ' and nf.ativo = 1' +
                                    ' and nf.cod_emissor = %d' +
                                    ' and nf.%s = ''%s''' +
                                    ' and nf.dhemi < (' + vDadosIni.FusoSqlDate + ' - ' +
                                      IntToStr(IfThen(sts = stsACancelar, ConfigNFCe.Regras.QtdeDiasACancelarNaoResolvidas, ConfigNFCe.Regras.QtdeDiasEnviandoNaoResolvidas)) + ')',
                                    [vDadosIni.cod_empresa, vDadosIni.vNFConsumidor.CodEmissor, IfThen(sts = stsACancelar, 'status', 'situacao_nfce'), sts]).AsInteger;

          if qtdeACancEnv <= 0 then
          begin
            try
              SqlExec('update or insert into nfc_emissor_pendencias (cod_emissor, cod_empresa, data_cadastro, tipo, quantidade, permitido)' +
                      ' values (%d, %d, %s, ''%s'', %d, ''S'') matching (cod_emissor, cod_empresa, data_cadastro, tipo)',
                      [vDadosIni.vNFConsumidor.CodEmissor, vDadosIni.cod_empresa, vDadosIni.FusoSqlDate, sts, qtdeACancEnv]).Transaction.Commit;
            except
              transacao.Rollback;
            end;
          end
          else
          begin
//            ShowWarning('Existe(m) %d NFCe(s) "%s"' + sLineBreak + sLineBreak +
//                        'Essa(s) NFCe(s) precisa(m) ser resolvida(s) com urgência!', [qtdeACancEnv, sts]);
            auditList.New(IfThen(sts = stsACancelar, 'NFC042', 'NFC043'), 'VALIDAR', Format('Qtde %d de NFCe(s) "%s"', [qtdeACancEnv, sts]), 'NFCE', '');
            if sts = stsACancelar then
              qtdeAcanc := qtdeACancEnv
            else
              qtdeEnvi := qtdeACancEnv;
          end;
        end;
      end;

      if sts = sitEnviando then
        sts := ''
      else
        sts := sitEnviando;
    end;
  end;

  if auditList.Count > 0 then
  begin
    sts := '';
    AqtdePendente := IfThen(Result.Mensagem <> '', 1);
    vDadosIni.PesqPros(auditList);

    for I := 0 to auditList.Count - 1 do
      if (auditList.Items[I].cod_processo = 'NFC041') and (auditList.Items[I].status = 'Liberado') then
        Result.Mensagem := ''
      else if (auditList.Items[I].cod_processo = 'NFC042') then
      begin
        if (auditList.Items[I].status = 'Liberado') then
          sts := 'S'
        else if TimeOf(vDadosIni.FusoDateTime(True)) > EncodeTime(14, 0, 0, 0) then
          sts := 'N'
        else if ShowConfirmacao('Existe(m) %d NFCe(s) "%s"' + sLineBreak + sLineBreak +
                                'Voce pode adiar agora apenas 1 vez essa validação. Adiar?', [qtdeAcanc, stsACancelar]) = IDYES then
          sts := 'D'
        else
          sts := 'N';

        try
          SqlExec('update or insert into nfc_emissor_pendencias (cod_emissor, cod_empresa, data_cadastro, tipo, quantidade, permitido)' +
                  ' values (%d, %d, %s, ''%s'', %d, ''%s'') matching (cod_emissor, cod_empresa, data_cadastro, tipo)',
                  [vDadosIni.vNFConsumidor.CodEmissor, vDadosIni.cod_empresa, vDadosIni.FusoSqlDate, stsACancelar, qtdeAcanc, sts]).Transaction.Commit;
        except
          transacao.Rollback;
        end;

        if sts <> 'S' then
          Result.Mensagem := Result.Mensagem + sLineBreak + sLineBreak +
                 Format('Existe(m) %d NFCe(s) "%s"' + sLineBreak +
                        'Essa(s) NFCe(s) precisa(m) ser resolvida(s) com urgência!', [qtdeAcanc, stsACancelar]);
      end
      else if (auditList.Items[I].cod_processo = 'NFC043') then
      begin
        if (auditList.Items[I].status = 'Liberado') then
          sts := 'S'
        else if TimeOf(vDadosIni.FusoDateTime(True)) > EncodeTime(14, 0, 0, 0) then
          sts := 'N'
        else if ShowConfirmacao('Existe(m) %d NFCe(s) "%s"' + sLineBreak + sLineBreak +
                                'Voce pode adiar agora apenas 1 vez essa validação. Adiar?', [qtdeAcanc, stsACancelar]) = IDYES then
          sts := 'D'
        else
          sts := 'N';

        try
          SqlExec('update or insert into nfc_emissor_pendencias (cod_emissor, cod_empresa, data_cadastro, tipo, quantidade, permitido)' +
                  ' values (%d, %d, %s, ''%s'', %d, ''%s'') matching (cod_emissor, cod_empresa, data_cadastro, tipo)',
                  [vDadosIni.vNFConsumidor.CodEmissor, vDadosIni.cod_empresa, vDadosIni.FusoSqlDate, sitEnviando, qtdeEnvi, sts]).Transaction.Commit;
        except
          transacao.Rollback;
        end;

        if sts <> 'S' then
          Result.Mensagem := Result.Mensagem + sLineBreak + sLineBreak +
               Format('Existe(m) %d NFCe(s) "%s"' + sLineBreak +
                      'Essa(s) NFCe(s) precisa(m) ser resolvida(s) com urgência!', [qtdeEnvi, sitEnviando]);        
      end;

    Result.Permitido := Result.Mensagem = '';
  end
  else
  begin
    Result.Mensagem := '';
    Result.Permitido := True;
  end;

//  if Result.Mensagem <> '' then
//    Result.Permitido := False;
end;

{ TNFC_Transporta }

constructor TNFC_Transporta.create;
begin
  if dtmNFConsumidor = nil then
    dtmNFConsumidor := TdtmNFConsumidor.Create(dtmNFConsumidor);

  dataSet := TClientDataSet(dtmNFConsumidor.cdsTransporta);
  transacao := TIBTransaction(dtmNFConsumidor.transacao);
  buscas := TIBQuery(dtmNFConsumidor.qrBuscas);
end;

procedure TNFC_Transporta.SetTransportador(CodigoTransportador: Integer);
begin
  montaSelect('select clientes.cod_cliente, clientes.nome_cliente, clientes.razao, clientes.cpfcgc from clientes' +
    ' where clientes.cod_cliente = ' + IntToStr(CodigoTransportador) +
    ' and clientes.cod_empresa = ' + vDadosIni.codEmpresa);
end;

{ TNFCe_Itens }

procedure TNFCe_Itens.AbreRegistros;
begin                 
  dataSet.FieldByName('icm_cst').OnGetText := nil;
  dataSet.FieldByName('uvnd').OnGetText := nil;
  dataSet.FieldByName('uvnd_fator').OnGetText := nil;

  montaSelect('select ' + FCampos + ' from nfce_item' +
    ' where nfce_item.cod_nfce = ' + IntToStr(NFCeAOwer.dataSet.FieldByName('cod_nfce').AsInteger) +
    ' and nfce_item.cod_empresa = ' + IntToStr(NFCeAOwer.dataSet.FieldByName('cod_empresa').AsInteger));
  IndexFieldNames := 'nitem';

  //dataSet.FieldByName('icm_csosn').Visible := vDadosIni.vEmp.vRegime = 'SIMPLES';
  //dataSet.FieldByName('icm_cst').Visible := True;//not(vDadosIni.vEmp.vRegime = 'SIMPLES');
  dataSet.FieldByName('icm_csosn').Visible := False;
  dataSet.FieldByName('icm_cst').OnGetText := dataSetNFCeItemGetText;
  dataSet.FieldByName('uvnd').OnGetText := dataSetNFCeItemGetText;
  dataSet.FieldByName('uvnd_fator').OnGetText := dataSetNFCeItemGetText;
end;

procedure TNFCe_Itens.AtualizarDadosFiscais();
begin
  if NFCeAOwer.fint('cod_nfce_complementada') > 0 then
    Exit;

  if dataSet.FieldByName('tipo_item').AsString = 'P' then
  begin
    dataSet.Edit;
    FProd.buscaProduto(
      dataSet.FieldByName('grupo_prod').AsInteger,
      dataSet.FieldByName('cod_prod').AsString, True);

    SetDadosFiscaisProduto();
    dataSet.Post;

  end
  else if dataSet.FieldByName('tipo_item').AsString = 'S' then
  begin
    dataSet.Edit;
    FServ.buscaServico(dataSet.FieldByName('cod_servico').AsInteger);

    SetDadosFiscaisServico;
    dataSet.Post;
  end
end;

procedure TNFCe_Itens.AtualizarInfFrete;
var
  RecNo: Integer;
  FreteNaBase: string;
begin
  RecNo := dataSet.RecNo;
  FreteNaBase := vDadosIni.IfThen(NFCeAOwer.dataSet.FieldByName('modfrete').AsString = '1', 'S', 'N');
  try
    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('frete_na_base').AsString <> FreteNaBase then
      begin
        dataSet.Edit;
        dataSet.FieldByName('frete_na_base').AsString := FreteNaBase;
        dataSet.Post;
      end;
      dataSet.Next;
    end;

    if dataSet.ChangeCount > 0 then
      if Apply then
        NFCeAOwer.SalvarECalcular(True);
  finally
    if RecNo > 0 then
      if RecNo <= dataSet.RecordCount then
        dataSet.RecNo := RecNo;
  end;
end;

procedure TNFCe_Itens.AtualizarInfRetencao(ISSRetido: string);
var
  RecNo: Integer;
  Alterar: Boolean;
begin
  RecNo := dataSet.RecNo;
  ISSRetido := vDadosIni.IfThen(ISSRetido = '1', 'C', 'N');//C: Cliente, N: Nao retido, S: Servico
  try
    dataSet.First;
    while not dataSet.Eof do
    begin
      Alterar := False;
      if (ISSRetido = 'C') and (dataSet.FieldByName('iss_retido').AsString = 'N') then
        Alterar := True
      else if (ISSRetido = 'N') and (dataSet.FieldByName('iss_retido').AsString = 'C') then
        Alterar := True;
      if Alterar then
      begin
        dataSet.Edit;
        dataSet.FieldByName('iss_retido').AsString := ISSRetido;
        dataSet.Post;
      end;
      dataSet.Next;
    end;

    if dataSet.ChangeCount > 0 then
      if Apply then
        NFCeAOwer.SalvarECalcular(False);
  finally
    if RecNo > 0 then
      if RecNo <= dataSet.RecordCount then
        dataSet.RecNo := RecNo;
  end;
end;

procedure TNFCe_Itens.AtualizarTotaisNFCe(Subtrair: Boolean);
var
  Fator: Integer;
begin
  try
    if not NFCeAOwer.PermiteAlteracaoItens then
      Exit;

    if not (NFCeAOwer.dataSet.State in [dsInsert, dsEdit]) then
      if (NFCeAOwer.dataSet.State = dsBrowse) then
        NFCeAOwer.dataSet.Edit;

    if not (NFCeAOwer.dataSet.State in [dsInsert, dsEdit]) then
      Exit;

    if Subtrair then
      Fator := -1
    else
      Fator := 1;

    NFCeAOwer.dataSet.FieldByName('vprod').AsFloat := NFCeAOwer.dataSet.FieldByName('vprod').AsFloat +
      (dataSet.FieldByName('vprod').AsFloat * Fator) ;
    NFCeAOwer.dataSet.FieldByName('vdesc').AsFloat := NFCeAOwer.dataSet.FieldByName('vdesc').AsFloat +
      (dataSet.FieldByName('vdesc').AsFloat * Fator);
    NFCeAOwer.dataSet.FieldByName('vtottrib').AsFloat := NFCeAOwer.dataSet.FieldByName('vtottrib').AsFloat +
      (dataSet.FieldByName('vtottrib').AsFloat * Fator);

    //base icms
    NFCeAOwer.dataSet.FieldByName('vbc').AsFloat := NFCeAOwer.dataSet.FieldByName('vbc').AsFloat +
      (dataSet.FieldByName('icm_vbc').AsFloat * Fator);
    //valor icms
    NFCeAOwer.dataSet.FieldByName('vicms').AsFloat := NFCeAOwer.dataSet.FieldByName('vicms').AsFloat +
      (dataSet.FieldByName('icm_vicms').AsFloat * Fator);
    //valor pis
    NFCeAOwer.dataSet.FieldByName('vpis').AsFloat := NFCeAOwer.dataSet.FieldByName('vpis').AsFloat +
      (dataSet.FieldByName('pis_vpis').AsFloat * Fator);
    //valor cofins
    NFCeAOwer.dataSet.FieldByName('vcofins').AsFloat := NFCeAOwer.dataSet.FieldByName('vcofins').AsFloat +
      (dataSet.FieldByName('cofins_vcofins').AsFloat * Fator);
    //valor total dos tributos
    NFCeAOwer.dataSet.FieldByName('vtottrib').AsFloat := NFCeAOwer.dataSet.FieldByName('vtottrib').AsFloat +
      (dataSet.FieldByName('vtottrib').AsFloat * Fator);
    //valor total liquido da nfce
    NFCe.AtualizarValorTotalLiquido;


//    NFCeAOwer.dataSet.Post;
//    if not NFCeAOwer.Apply then
//      raiseExceptionCreate('Totais não foram atualizados: TNFCe_Itens.AtualizarTotaisNFCe', '')
//    else
//      NFCeAOwer.dataSet.Edit;

  except on E: Exception do
    begin
      Application.MessageBox(PChar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('TNFCe_Itens.AtualizarTotaisNFCe Erro: ' + e.Message);
    end;
  end;
end;

function TNFCe_Itens.buscaProduto(LocalizarProduto: Boolean;
  Pesquisa: string; var RecordCount: Integer): Boolean;
begin
  try
    Result := False;
    if LocalizarProduto then
    begin
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('PRODUTOS');
      if Trim(vDadosIni.vPesquisa) = '' then
        Exit;

      FProd.buscaProduto(StrToIntDef(vDadosIni.vPesquisaGrupo_prod, 0), vDadosIni.vPesquisaCod_prod, True);
      RecordCount := FProd.dataSet.RecordCount;
      Result := RecordCount > 0;
      Exit;
    end;
    FProd.buscaProduto(Pesquisa);
    RecordCount := FProd.dataSet.RecordCount;
    Result := RecordCount > 0;
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
    end;
  end;
end;

function TNFCe_Itens.buscaServico(LocalizarServico: Boolean; Pesquisa: string;
  var RecordCount: Integer): Boolean;
begin
  try
    Result := False;
    if LocalizarServico then
    begin
      vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('SERVICOS_EMP', ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa, 'Tipo Contrato');
      if Trim(vDadosIni.vPesquisa) = '' then
        Exit;

      FServ.buscaServico(StrToIntDef(vDadosIni.vPesquisa, 0));
      RecordCount := FServ.dataSet.RecordCount;
      Result := RecordCount > 0;
      Exit;
    end;
    FServ.buscaServico(Pesquisa);
    RecordCount := FServ.dataSet.RecordCount;
    Result := RecordCount > 0;
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
    end;
  end;
end;

procedure TNFCe_Itens.CalcFieldsDataSet(DataSet: TDataSet);
var
  cDesc: Integer;
  fator: Double;
begin
  if (DataSet.State = dsInternalCalc) and (ffloat('uvnd_fator') > 0) then
  begin
    fator := ffloat('uvnd_fator');
    fator := IfThen(fator > 0, fator, 1);

    DataSet.FieldByName('qvnd').AsFloat := RoundTo(ffloat('qcom')   * fator        , 0 - NFCeAOwer.ConfigNFCe.Itens.CasasDecimaisQtde);
    DataSet.FieldByName('vvnd').AsFloat := RoundTo(ffloat('vprod') / ffloat('qvnd'), 0 - NFCeAOwer.ConfigNFCe.Itens.CasasDecimaisVlUnit);
  end;
end;

constructor TNFCe_Itens.create(AOwer: TNFCe);
begin
  if dtmNFConsumidor = nil then
    dtmNFConsumidor := TdtmNFConsumidor.Create(dtmNFConsumidor);

  dataSet := TClientDataSet(dtmNFConsumidor.cdsNFCe_It);
  transacao := TIBTransaction(dtmNFConsumidor.transacao);
  buscas := TIBQuery(dtmNFConsumidor.qrBuscas);
  FUndVenda := TStringList.Create;
  FTributos := TributosPersistentHandler.Create(
    transacao,
    Container.GetInstance().ErpFeaturesFactory.CreateSalvarTributoDFeUseCase(),
    Container.GetInstance().ErpFeaturesFactory.CreateRemoverTributoDFeUseCase()
  );

  if dataSet.FindField('QVND') = nil then
  begin
    AddFieldInternalCalc('QVND', ftFloat);
    AddFieldInternalCalc('VVND', ftFloat);
    DataSet.FieldByName('qvnd').DisplayLabel := 'Qtde';
    DataSet.FieldByName('vvnd').DisplayLabel := 'Vr Unit';
  end;
  dataSet.OnCalcFields := CalcFieldsDataSet;

  if AOwer = nil then
    raiseExceptionCreate('NFCeAOwer não referenciado', '');

  NFCeAOwer := TNFCe(AOwer);
  FProd      := TNFC_Produtos.create(AOwer);
  FServ      := TNFC_Servicos.create(AOwer);

  FCampos :=
    'nfce_item.cod_nfce, nfce_item.cod_empresa, nfce_item.seqid, nfce_item.nitem, nfce_item.tipo_item, nfce_item.grupo_prod,' +
    ' nfce_item.cod_prod, nfce_item.cod_grade, nfce_item.num_fab_prod, nfce_item.cean, nfce_item.ncm, nfce_item.cfop,' +
    ' nfce_item.xprod, nfce_item.ucom, nfce_item.qcom, nfce_item.vuncom, nfce_item.vprod, nfce_item.vfrete, nfce_item.vseg,' +
    ' nfce_item.vdesc, nfce_item.voutro, nfce_item.prec_cusm_prod, nfce_item.cest, nfce_item.nfci, nfce_item.vtottrib,' +
    ' nfce_item.icm_orig, nfce_item.icm_cst, nfce_item.icm_modbc, nfce_item.icm_predbc, nfce_item.icm_vbc,' +
    ' nfce_item.icm_picms, nfce_item.icm_vicms, nfce_item.icm_csosn,' +
    ' nfce_item.icm_pcredsn, nfce_item.icm_vcredicmssn, nfce_item.pis_cst, nfce_item.pis_vbc, nfce_item.pis_ppis,' +
    ' nfce_item.pis_vpis, nfce_item.pis_qbcprod, nfce_item.pis_valiqprod, nfce_item.cofins_cst, nfce_item.cofins_vbc,' +
    ' nfce_item.cofins_pcofins, nfce_item.cofins_vcofins, nfce_item.cofins_qbcprod, nfce_item.cofins_valiqprod,' +
    ' nfce_item.iss_vbc, nfce_item.iss_valiq, nfce_item.iss_vissqn, nfce_item.iss_cmunfg, nfce_item.iss_clistserv,' +
    ' nfce_item.iss_vdeducao, nfce_item.iss_voutro, nfce_item.iss_vdescincond, nfce_item.iss_vdesccond,' +
    ' nfce_item.iss_vissret, nfce_item.iss_indiss, nfce_item.iss_indincentivo, nfce_item.iss_retido, nfce_item.cod_servico,' +
    ' nfce_item.prec_cus_prod, nfce_item.frete_na_base, nfce_item.altera_estoque_cfop, nfce_item.nat_rec,' +
    ' nfce_item.comb_cprodanp, nfce_item.comb_descanp, nfce_item.comb_pglp, nfce_item.comb_pgnn, nfce_item.comb_pgni,' +
    ' nfce_item.comb_vpart, nfce_item.comb_codif, nfce_item.comb_ufcons, nfce_item.esc_indescala, nfce_item.esc_cnpjfab,' +
    ' nfce_item.icm_picmsefet, nfce_item.icm_predbcefet, nfce_item.fcp_pfcp, nfce_item.fcp_pfcpst, nfce_item.fcp_vbcfcpstret,' +
    ' nfce_item.fcp_pfcpstret, nfce_item.fcp_vbcfcp, nfce_item.fcp_vfcp, nfce_item.fcp_vfcpstret, nfce_item.nitem_orc,' +
    ' nfce_item.qbcmonoret, nfce_item.vicmsmonoret, nfce_item.adremicmsret, nfce_item.qtrib, nfce_item.utrib,' +
    ' nfce_item.uvnd, nfce_item.uvnd_fator, nfce_item.vitem, nfce_item.dfe_trib_id ';
end;

procedure TNFCe_Itens.dataSetNFCeItemGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  Text := Sender.AsString;
  if (Sender.FieldName = 'UVND') and (Text = '')  then
    Text := fstr('UCOM')
  else if (Sender.FieldName = 'UVND_FATOR') then
  begin
    if (Sender.AsFloat > 1) then // 6UND > 1CX ;
      Text := Format('%s %s = 1 %s', [ FloatToStr(RoundTo(Sender.AsFloat, -4)), ftext('UVND'), fstr('ucom')])
    else if (Sender.AsFloat > 0) then // 6UND > 1CX ;
      Text := Format('1 %s = %s %s', [ ftext('UVND'), FloatToStr(RoundTo(1 / Sender.AsFloat, -4)), fstr('ucom')])
    else
      Text := Format('1 %s = 1 %s', [fstr('ucom'), ftext('UVND')]);
  end
  else
  if Sender.FieldName = 'ICM_CST' then
    if not fempty('icm_csosn') then
      Text := fstr('icm_csosn') + '/' + fstr('icm_cst')
    else
      Text := fstr('icm_cst');
end;

function TNFCe_Itens.delete: boolean;
var
  RecNo: Integer;
  Processo: string;
begin
  try
    Result := False;

    if (dataSet.IsEmpty) or (dataSet.RecordCount = 0) then
      Exit;

    Processo := vDadosIni.IfThen(Trim(dataSet.FieldByName('tipo_item').AsString) = 'P', 'NFC019', 'NFC022');
    if not vDadosIni.PesqPros(Processo, 'EXCLUIR', Audit_Dados ,
      'NFCE_ITEM', Audit_Dados) then
      exit;

    //AtualizarTotaisNFCe(True);

    if vDadosIni.GetIni('MD', 'NCEIL', 'N') = 'S' then //NF COnsumidor Excluir Itens em Lote
    begin
      prepare_loop('sel = ''S''');
      try
        if dataSet.IsEmpty then
        begin
          prepare_loop_done;
          dataSet.Delete;
        end
        else
          while not dataSet.IsEmpty do
          begin
            if not fempty('DFE_TRIB_ID') then
              FTributos.Delete(fstr('DFE_TRIB_ID'), tdfoNFCe );

            dataSet.Delete;
          end;
      finally
        prepare_loop_done;
      end;
    end
    else
    begin
      if not fempty('DFE_TRIB_ID') then
        FTributos.Delete(fstr('DFE_TRIB_ID'), tdfoNFCe );

      dataSet.Delete;
    end;

    RecNo := dataSet.RecNo;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('nitem').AsInteger := dataSet.RecNo;
      dataSet.Post;
      dataSet.Next;
    end;
    if RecNo > 0 then
      dataSet.RecNo := RecNo;

    Result := Apply;

    if Result then
    begin

      NFCeAOwer.MontarDadosAdicionaisInteresseFisco();

      NFCeAOwer.SalvarECalcular(True, True);

      vDadosIni.GravaAuditoria(Processo, 'EXCLUIR', 'SUCESSO', 'NFCE_ITEM', '', buscas);

      if NFCeAOwer.fint('norc') > 0 then
        NFCeAOwer.Orcamento_getOrcamento(NFCeAOwer.fint('norc'), Processo);
    end;

  except on E: Exception do
    begin
      if not NFCeAOwer.EmissaoRapida then
      Application.MessageBox(PChar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('TNFCe_Itens.SetProduto Erro: ' + e.Message);
    end;
  end;
end;

destructor TNFCe_Itens.Destroy;
begin
  if FProd <> nil then
    FreeAndNil(FProd);
  if FServ <> nil then
    FreeAndNil(FServ);

  FreeAndNil(FUndVenda);
  FTributos.FreeSafe();
  inherited;
end;

function TNFCe_Itens.GetAudit_Codigo: string;
begin
  Result := Trim(NFCeAOwer.dataSet.FieldByName('cod_nfce').AsString) +
    vDadosIni.IfThen(Trim(dataSet.FieldByName('seqid').AsString) <> '',
      '-' + Trim(dataSet.FieldByName('seqid').AsString), '');
end;

function TNFCe_Itens.GetAudit_Dados: string;
begin
  Result := 'COD:' + Audit_Codigo + ' IT:' + Trim(dataSet.FieldByName('nitem').AsString) +
    vDadosIni.IfThen(Trim(dataSet.FieldByName('tipo_item').AsString) = 'S',
      ' S:' + Trim(dataSet.FieldByName('cod_servico').AsString),
      ' P:' + Trim(dataSet.FieldByName('grupo_prod').AsString) + '-' + Trim(dataSet.FieldByName('cod_prod').AsString)) +
    vDadosIni.IfThen(dataSet.FieldByName('cod_grade').AsInteger > 0,
      ' G:' + Trim(dataSet.FieldByName('cod_grade').AsString), '');
end;

function TNFCe_Itens.GetUndVenda: TStrings;
var
  convs: TUnidadeVendas_Model;
  conv: TUnidadeVenda_Model;
  sUndV, sUndP: string;
  I: Integer;
begin
  queryCons.SQL('select iif(ni.uvnd = c.unid_vnd, -2, c.ind) ind1, c.* from (' +
                '   select iif(p.unidade = ni.uvnd, 0, -1) ind, p.grupo_prod, p.cod_prod, p.cod_empresa, p.unidade unid_princ, ni.uvnd unid_vnd, ni.uvnd_fator fator' +
                '   from nfce_item ni' +
                '   inner join produtos p on p.grupo_prod = :grupo_prod and p.cod_prod = :cod_prod and p.cod_empresa = :cod_empresa' +
                '   where ni.cod_nfce = :cod_nfce and ni.cod_empresa = :cod_empresa and ni.seqid = :seqid' +
                '   union distinct' +
                '   select iif(pu.padrao_venda = ''S'', -1, 1) ind, pu.grupo_prod, pu.cod_prod, pu.cod_empresa, p.unidade unid_princ, pu.unidade unid_vnd,' +
                '     iif(pu.operacao = ''D'', 1 /  pu.quantidade,pu.quantidade) fator' +
                '   from produtos p' +
                '   inner join produtos_conversao_saida pu on pu.grupo_prod = p.grupo_prod and pu.cod_prod = p.cod_prod and pu.cod_empresa = p.cod_empresa' +
                '     and pu.unidade <> p.unidade and pu.disponivel_venda = ''S''' +
                '   inner join nfce_item ni on ni.cod_nfce = :cod_nfce and ni.cod_empresa = :cod_empresa and ni.seqid = :seqid' +
                '     and p.grupo_prod = :grupo_prod and p.cod_prod = :cod_prod and p.cod_empresa = :cod_empresa' +
                '     and pu.unidade <> ni.uvnd' +
                '   where p.grupo_prod = :grupo_prod and p.cod_prod = :cod_prod and p.cod_empresa = :cod_empresa' +
                '   union distinct' +
                '   select 0 ind, p.grupo_prod, p.cod_prod, p.cod_empresa, p.unidade unid_princ, p.unidade unid_vnd, 1 fator' +
                '   from produtos p where p.grupo_prod = :grupo_prod and p.cod_prod = :cod_prod and p.cod_empresa = :cod_empresa ) as c' +
                ' left join nfce_item ni on ni.cod_nfce = :cod_nfce and ni.cod_empresa = :cod_empresa and ni.seqid = :seqid' +
                ' order by ind1, unid_vnd')
    .ParamValue('grupo_prod', fint('grupo_prod'))
    .ParamValue('cod_prod', fstr('cod_prod'))
    .ParamValue('cod_empresa', vDadosIni.cod_empresa)
    .ParamValue('cod_prod', fstr('cod_prod'))
    .ParamValue('cod_nfce', fstr('cod_nfce'))
    .ParamValue('seqid', fstr('seqid'))
    .Open();

  convs := TUnidadeVendas_Model.Create;
  convs.CopyFrom(TUnidadeVenda_Model, queryCons.query, False);

  FUndVenda.Clear;

  for I := 0 to convs.Count - 1 do
    FUndVenda.AddObject(convs.Items[I].unid_vnd, convs.Items[I]);

  sUndV := fstrdef('uvnd', fstr('ucom'));
  sUndP := queryCons.fstr('unid_princ');

  if FUndVenda.IndexOf(sUndV) = -1 then
  begin
    conv := TUnidadeVenda_Model.Create;
    conv.unid_vnd := sUndV;
    conv.unid_princ := sUndP;
    conv.fator := 1;
    FUndVenda.InsertObject(0, sUndV, conv);
  end
  else if FUndVenda.IndexOf(sUndV) > 0 then
  begin
    FUndVenda.Move(FUndVenda.IndexOf(sUndV), 0);
  end;

  Result := FUndVenda;
end;

function TNFCe_Itens.insert: boolean;
begin
  Result := False;

  if (not dataSet.Active) or
    (dataSet.FieldByName('cod_nfce').AsInteger <> NFCeAOwer.dataSet.FieldByName('cod_nfce').AsInteger) then
    AbreRegistros;

  result := inherited insert;

  if Result then
  begin
    dataSet.FieldByName('cod_nfce').AsInteger := NFCeAOwer.dataSet.FieldByName('cod_nfce').AsInteger;
    dataSet.FieldByName('cod_empresa').AsInteger := NFCeAOwer.dataSet.FieldByName('cod_empresa').AsInteger;
    dataSet.FieldByName('seqid').AsInteger := Gencodigo('NFCE_ITEM', buscas, dataSet.FieldByName('cod_empresa').AsString);
    dataSet.FieldByName('nitem').AsInteger := dataSet.RecordCount + 1;
  end;
end;

function TNFCe_Itens.leituraEAN13_balanca(Pesquisa: string;
  var RecordCount: Integer): string;
begin
  try
    Result := vDadosIni.vProduto.LeituraPesoBalanca.leitura_executar(Pesquisa).vals.msg;

    with vDadosIni.vProduto.LeituraPesoBalanca do
    begin
      if Copy(UpperCase(vals.msg), 1, 4) = 'ERRO' then
        raiseExceptionCreate(vals.msg);

      if vals.msg = 'VALIDO' then
      begin
        if conf.pesquisarNoCodProd then
        begin
          if not SqlOpen('select grupo_prod, cod_prod from produtos where cod_prod = %s and cod_empresa = %s and ativo = 1',
                         [QuotedStr(vDadosIni.StrZero(vals.codigo, StrToIntDef(vDadosIni.vProduto.vDigitosProd, Length(vals.codigo)))),
                          vDadosIni.codEmpresa]).IsEmpty then
            FProd.buscaProduto(buscas.FieldByName('grupo_prod').AsInteger, buscas.FieldByName('cod_prod').AsString);
        end
        else
        begin
          Pesquisa := IfThen(vDadosIni.vSupermercado = 'S', vDadosIni.StrZero(vals.codigo, 13), vals.codigo);
          FProd.buscaProduto(Pesquisa);
        end;
        RecordCount := FProd.dataSet.RecordCount;
        if RecordCount <= 0 then
          vals.msg := 'Erro, Não encontrado mercadoria para o EAN informado ' + Pesquisa
        else
        begin
          if vals.peso > 0 then
            vals.preco := RoundTo(vals.peso * FProd.ffloat('prec_tab_prod'), -2)
          else
            vals.peso  := vals.preco / FProd.ffloat('prec_tab_prod');
        end;
      end;
    end;
  except on E: Exception do
    begin
      vDadosIni.ShowErro(e.Message);
      vDadosIni.vProduto.LeituraPesoBalanca.vals.preco := 0; 
    end;
  end;
end;

procedure TNFCe_Itens.SetDadosFiscaisProduto();
var
  cEAN, cEAN_Prefixo: string;
begin
  dataSet.FieldByName('ncm').AsString                 := FProd.fstr('nbm');
  dataSet.FieldByName('cest').AsString                := FProd.fstr('cest');
  dataSet.FieldByName('nfci').AsString                := FProd.fstr('nfci');
  dataSet.FieldByName('cfop').AsInteger               := Trunc(FProd.fint('codigo_nop'));
  dataSet.FieldByName('ucom').AsString                := FProd.fstr('unidade');
  dataSet.FieldByName('prec_cusm_prod').AsFloat       := FProd.ffloat('prec_cusm_prod');
  dataSet.FieldByName('prec_cus_prod').AsFloat        := FProd.ffloat('prec_cus_prod');
  dataSet.FieldByName('altera_estoque_cfop').AsString := IfThen(FProd.fequals('alt_est', 'N'), 'N', 'S');
  dataSet.FieldByName('esc_indescala').AsString       := FProd.fstr('nfe_indescala');
  dataSet.FieldByName('esc_cnpjfab').AsString         := FProd.fstr('nfe_cnpjfab');
  dataSet.FieldByName('icm_cst').AsString             := FProd.getCSTDevido(Copy(FProd.fstr('cst_prod'), 2, 2));
  dataSet.FieldByName('qtrib').AsFloat                := FProd.ffloat('nfe_qtrib');
  dataSet.FieldByName('utrib').AsString               := FProd.fstr('nfe_utrib');

  dataSet.FieldByName('icm_orig').AsString := IfThen(StrIn(Copy(FProd.fstr('cst_prod'), 1, 1),
                                                           ['1','2','3','4','5','6','7','8']), Copy(FProd.fstr('cst_prod'), 1, 1), '0');
  if fequals('icm_cst', '10') then
    dataSet.FieldByName('icm_cst').AsString := '00'
  else if fequals('icm_cst', '70') then
    dataSet.FieldByName('icm_cst').AsString := '20'
  else if fequals('icm_cst', '30') then
    dataSet.FieldByName('icm_cst').AsString := '41';

  dataSet.FieldByName('icm_csosn').AsString := IfThen(vDadosIni.vEmp.vRegime = 'SIMPLES', FProd.fstr('csosn'), '');
  if (vDadosIni.vEmp.vRegime = 'SIMPLES') and (not fequals('icm_cst', '61')) then
    if fempty('icm_csosn') then
      dataSet.FieldByName('icm_csosn').AsString := FProd.getCSOSNPorCST(fstr('icm_cst'))
    else
      dataSet.FieldByName('icm_csosn').AsString := FProd.AjustaCSOSN(fstr('icm_csosn'));

  dataSet.FieldByName('icm_modbc').AsString := '3';
  dataSet.FieldByName('pis_cst').AsString    := IfThen(not FProd.fempty('cst_pis'), FProd.fstr('cst_pis'), '01');
  dataSet.FieldByName('cofins_cst').AsString := fstr('pis_cst');
  dataSet.FieldByName('nat_rec').AsString    := FProd.fstr('nat_rec');

  if (vDadosIni.vEmp.vUsarReducaoInvertida = 'S') and (FProd.dataSet.FieldByName('perc_red_prod').AsFloat > 0) then
    dataSet.FieldByName('icm_predbc').AsFloat := 100 - FProd.ffloat('perc_red_prod')
  else
    dataSet.FieldByName('icm_predbc').AsFloat := FProd.ffloat('perc_red_prod');
  if vDadosIni.strIn(dataSet.FieldByName('icm_cst').AsString, ['00', '20', '51', '90']) then
    dataSet.FieldByName('icm_picms').AsFloat := FProd.ffloat('icm_prod')
  else
    dataSet.FieldByName('icm_picms').AsFloat := 0;

  if fequals('pis_cst', '01') then
  begin
    dataSet.FieldByName('pis_ppis').AsFloat       := vDadosIni.vEmp.vAliqPIS;
    dataSet.FieldByName('cofins_pcofins').AsFloat := vDadosIni.vEmp.vAliqCOFINS;
  end
  else if fstrin('pis_cst', ['02', '05']) then
  begin
    dataSet.FieldByName('pis_ppis').AsFloat       := FProd.ffloat('aliq_pis_diferenciada');
    dataSet.FieldByName('cofins_pcofins').AsFloat := FProd.ffloat('aliq_cofins_diferenciada');
  end
  else if fequals('pis_cst', '03') then
  begin
    dataSet.FieldByName('pis_valiqprod').AsFloat    := FProd.ffloat('aliq_pis_diferenciada');
    dataSet.FieldByName('cofins_valiqprod').AsFloat := FProd.ffloat('aliq_cofins_diferenciada');
  end;

  dataSet.FieldByName('cean').AsString := '';
  buscas.Close;
  buscas.SQL.Text := 'select cod_barra from cod_barra' +
    ' where grupo_prod = ' + IntToStr(FProd.dataSet.FieldByName('grupo_prod').AsInteger) +
    ' and cod_prod = ' + QuotedStr(FProd.dataSet.FieldByName('cod_prod').AsString) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  while not buscas.Eof do
  begin
    {
    cEAN := Trim(vDadosIni.apenasNumeros(buscas.FieldByName('cod_barra').AsString));
    cEAN_Prefixo := PadL( IfThen(Length(cEAN) = 14, Copy(cEAN, 2, 13), cEAN), 14, '0');
    cEAN_Prefixo := IfThen(Copy(cEAN_Prefixo, 1, 6) = '000000',
                           Copy(cEAN_Prefixo, 7, 3),
                           Copy(cEAN_Prefixo, 2, 3));

    if NewStringList(False, NFCeAOwer.ConfigNFCe.Itens.EansPrefixosInvalidos, ',').IndexOf(cEAN_Prefixo) = -1 then
    }
    cEAN := TGS1Prefix.GetEanValido(buscas.FieldByName('cod_barra').AsString, NFCeAOwer.ConfigNFCe.Itens.EansPrefixosInvalidos);

      if Length(cEAN) = Length(Trim(buscas.FieldByName('cod_barra').AsString)) then
        if FProd.ValidaEAN(cEAN) then
        begin
          dataSet.FieldByName('cean').AsString := cEAN;
          Break;
        end;
    buscas.Next;
  end;

  dataSet.FieldByName('comb_cprodanp').AsString := IfThen(vDadosIni.vEmp.vCombProduto = 'S', FProd.dataSet.FieldByName('comb_cprodanp').AsString);
  dataSet.FieldByName('comb_descanp').AsString  := IfThen(vDadosIni.vEmp.vCombProduto = 'S', FProd.dataSet.FieldByName('comb_descanp').AsString);
  dataSet.FieldByName('comb_pglp').AsFloat      := IfThen(vDadosIni.vEmp.vCombProduto = 'S', FProd.dataSet.FieldByName('comb_pglp').AsFloat);
  dataSet.FieldByName('comb_pgnn').AsFloat      := IfThen(vDadosIni.vEmp.vCombProduto = 'S', FProd.dataSet.FieldByName('comb_pgnn').AsFloat);
  dataSet.FieldByName('comb_pgni').AsFloat      := IfThen(vDadosIni.vEmp.vCombProduto = 'S', FProd.dataSet.FieldByName('comb_pgni').AsFloat);
  dataSet.FieldByName('comb_vpart').AsFloat     := IfThen(vDadosIni.vEmp.vCombProduto = 'S', FProd.dataSet.FieldByName('comb_vpart').AsFloat);
  dataSet.FieldByName('comb_codif').AsString    := IfThen(vDadosIni.vEmp.vCombProduto = 'S', FProd.dataSet.FieldByName('comb_codif').AsString);
  dataSet.FieldByName('comb_ufcons').AsString   := IfThen(vDadosIni.vEmp.vCombProduto = 'S',
                                                          IfThen(Trim(NFCeAOwer.Dest.dataSet.FieldByName('uf').AsString) <> '',
                                                                 Trim(NFCeAOwer.Dest.dataSet.FieldByName('uf').AsString),
                                                                 vDadosIni.vEmp.vSiglaUF)
                                                          );
  if not vDadosIni.strIn(NFCeAOwer.dataSet.FieldByName('NFE_VERSAO').AsString, [strVerVazio, strVer310]) then
  begin
    dataSet.FieldByName('fcp_vbcfcpstret').AsFloat := FProd.dataSet.FieldByName('fcp_vbcfcpstret').AsFloat;
    dataSet.FieldByName('fcp_pfcpstret').AsFloat   := FProd.dataSet.FieldByName('fcp_pfcpstret').AsFloat;
    dataSet.FieldByName('fcp_vfcpstret').AsFloat   := FProd.dataSet.FieldByName('fcp_vfcpstret').AsFloat;

    if not NFCeAOwer.ConfigNFCe.FCP.CalcularFCP then
    begin
      dataSet.FieldByName('fcp_pfcp').AsFloat   := 0;
      dataSet.FieldByName('fcp_pfcpst').AsFloat := 0;
    end
    else
    begin
      if NFCeAOwer.ConfigNFCe.FCP.UsarFCPdoEstado then
        dataSet.FieldByName('fcp_pfcp').AsFloat := SqlOpen('select pfcp from estados where codigo_uf = ' + IntToStr(vDadosIni.vEmp.vCodigo_Uf)).FieldByName('pfcp').AsFloat;

      if (NFCeAOwer.ConfigNFCe.FCP.UsarFCPdoNCM) and (Trim(dataSet.FieldByName('ncm').AsString) <> '') then
        dataSet.FieldByName('fcp_pfcp').AsFloat := SqlOpen('select FCP_ALIQ from nbm where cod_ncm = ' + QuotedStr(Trim(dataSet.FieldByName('ncm').AsString))).FieldByName('FCP_ALIQ').AsFloat;

      if (NFCeAOwer.ConfigNFCe.FCP.UsarFCPdoProduto) then
        dataSet.FieldByName('fcp_pfcp').AsFloat := FProd.dataSet.FieldByName('fcp_aliq').AsFloat;

      dataSet.FieldByName('fcp_pfcpst').AsFloat := dataSet.FieldByName('fcp_pfcp').AsFloat;
    end;

    if not NFCeAOwer.ConfigNFCe.ICM.CalcularICM_Efetivo then
    begin
      dataSet.FieldByName('icm_picmsefet').AsFloat  := 0;
      dataSet.FieldByName('icm_predbcefet').AsFloat := 0;
    end
    else if FProd.dataSet.FieldByName('icm_prod').AsFloat > 0 then
    begin
      dataSet.FieldByName('icm_picmsefet').AsFloat  := FProd.dataSet.FieldByName('icm_prod').AsFloat;
      dataSet.FieldByName('icm_predbcefet').AsFloat := dataSet.FieldByName('icm_predbc').AsFloat;
    end
    else
      dataSet.FieldByName('icm_picmsefet').AsFloat  := SqlOpen('select aliq_intra from estados where codigo_uf = ' + IntToStr(vDadosIni.vEmp.vCodigo_Uf)).FieldByName('aliq_intra').AsFloat;

    if fequals('icm_cst', '61') and (FProd.ffloat('vicmsmonoret') > 0) and (FProd.ffloat('adremicmsret') > 0)  then
    begin
      dataSet.FieldByName('qbcmonoret').AsFloat   := ffloat('qcom');
      dataSet.FieldByName('adremicmsret').AsFloat := FProd.ffloat('adremicmsret');
      dataSet.FieldByName('vicmsmonoret').AsFloat := ffloat('adremicmsret') * ffloat('qbcmonoret');
    end
    else
    begin
      dataSet.FieldByName('qbcmonoret').AsFloat   := 0;
      dataSet.FieldByName('vicmsmonoret').AsFloat := 0;
      dataSet.FieldByName('adremicmsret').AsFloat := 0;
    end;
  end;
  
  if fempty('cest') then
    if vDadosIni.SplitS(NFCeAOwer.ConfigNFCe.Regras.RejeitarSemCestParaCSTs, [',', ';', '-', '.', '|']).
       IndexOf(IfThen(not fempty('icm_csosn'), fstr('icm_csosn'), fstr('icm_cst'))) >= 0 then
         NFCeAOwer.LastRejeicao := Format('Item %d - %s: Sem CEST e CST de Substituição tributária',  [fint('nitem'), fstr('num_fab_prod')]);

  if (YesNoEnum(NFCeAOwer.fint('dfe_trib_ignorar')) = ynNo ) and fempty('dfe_trib_id') then // Com RTC e Id vazio
    dataSet.FieldByName('dfe_trib_id').AsString := NewGuid()
  else
  if (YesNoEnum(NFCeAOwer.fint('dfe_trib_ignorar')) = ynYes) and not fempty('dfe_trib_id') then // Sem RTC e Id preenchido
    dataSet.FieldByName('dfe_trib_id').Clear();

  SetValorAproximadosDosTributos();
end;

procedure TNFCe_Itens.SetDadosFiscaisServico;
begin
  dataSet.FieldByName('cfop').AsInteger := Trunc(FServ.dataSet.FieldByName('codigo_nop').AsFloat);
  dataSet.FieldByName('ucom').AsString := vDadosIni.IfThen( Trim(FServ.dataSet.FieldByName('unidade').AsString) <> '',
    Trim(FServ.dataSet.FieldByName('unidade').AsString), 'UN');
  dataSet.FieldByName('prec_cusm_prod').AsFloat := 0;
  dataSet.FieldByName('prec_cus_prod').AsFloat := 0;

  dataSet.FieldByName('iss_cmunfg').AsInteger      := vDadosIni.vEmp.vNfe.ibgeCodCidade;
  dataSet.FieldByName('iss_indiss').AsString       := NFCeAOwer.ConfigNFCe.ISS.IndicadorDaExigibilidade;
  dataSet.FieldByName('iss_indincentivo').AsString := NFCeAOwer.ConfigNFCe.ISS.IndicadorDeIncentivoFiscal;
  dataSet.FieldByName('iss_valiq').AsFloat         := FServ.dataSet.FieldByName('aliq_iss').AsFloat;
  dataSet.FieldByName('iss_clistserv').AsString    := FServ.dataSet.FieldByName('cod_tpservico').AsString;
  dataSet.FieldByName('iss_retido').AsString       := vDadosIni.IfThen( FServ.dataSet.FieldByName('iss_retido').AsInteger = 1, 'S', 'N');
  if (dataSet.FieldByName('iss_retido').AsString = 'N') then//and (FServ.ISSRetidoNoCliente = 'C') then// (NFCeAOwer.dataSet.FieldByName('cod_cliente').AsInteger > 0) then
    dataSet.FieldByName('iss_retido').AsString := FServ.ISSRetidoNoCliente; // sempre vai ser N ou C
//    begin
//      buscas.Close;
//      buscas.SQL.Text := 'select ISS_RETIDO from clientes' +
//        ' where cod_cliente = ' + IntToStr(NFCeAOwer.dataSet.FieldByName('cod_cliente').AsInteger) +
//        ' and cod_empresa = ' + vDadosIni.codEmpresa;
//      buscas.Open;
//      if buscas.FieldByName('iss_retido').AsInteger = 1 then
//        dataSet.FieldByName('iss_retido').AsString := 'C';
//    end;

  dataSet.FieldByName('pis_cst').AsString :=
    vDadosIni.IfThen( Trim(FServ.dataSet.FieldByName('cst_pis').AsString) <> '',
      FServ.dataSet.FieldByName('cst_pis').AsString, '01');
  dataSet.FieldByName('cofins_cst').AsString := dataSet.FieldByName('pis_cst').AsString;

  if dataSet.FieldByName('pis_cst').AsString = '01' then
    dataSet.FieldByName('pis_ppis').AsFloat := vDadosIni.vEmp.vAliqPIS;

  if dataSet.FieldByName('cofins_cst').AsString = '01' then
    dataSet.FieldByName('cofins_pcofins').AsFloat := vDadosIni.vEmp.vAliqCOFINS;

end;

procedure TNFCe_Itens.SetProd(const Value: TNFC_Produtos);
begin
  FProd := Value;
end;


function TNFCe_Itens.SetProduto(input: TSetProdutoInput): Boolean;
var
  Processo, Acao, AMensagemEstoque, Str: string;
  AQtdeEstoqueRequisitada: Double;
  AQtdeEstoqueDisponivel: Double;
  AQtdeEstoqueProduzir: Double;
  QtdeSobraOrcamento: Double;
  ItensOrcamento: TPedVendaProdOrcs_Model;
  I: Integer;
  UpdatedCodNFCeOrc: Boolean;
  rateioNecessario: Boolean;
begin
  try
    Result := False;

    if NFCeAOwer.EmissaoRapida then
    begin
      with NFCeAOwer.ValidacaoQualquerAlteracao do
        if not Permitido then
          raiseExceptionCreate('[NFCe está %s %s%s]', [Status, Situacao, IfThen(TpEmiss = '9', ' Em Contingência')]);
    end
    else if not NFCeAOwer.PermiteAlteracaoItens then
      Exit;

    if (input.Alteracao) and (dataSet.IsEmpty) then
      Exit;

    with NFCeAOwer.ValidacaoObjetosInternos do
      if not Permitido then
      begin
        NFCeAOwer.SetLastMessage(Format('Objetos Internos Ausentes(%s)', [Mensagem]));
        Exit;
      end;

    if not NFCeAOwer.SetCodigoInterno then
      raiseExceptionCreate('Item não pode ser incluído por problemas ao gerar código interno da NFC-e: TNFCe_Itens.SetProduto', '');

    {$REGION 'usando orçamento'}

    if (not input.Alteracao) and (NFCeAOwer.fint('norc') > 0) then
    begin
      if FProd.dataSet.RecordCount = 0 then
        raiseExceptionCreate('Nenhum produto encontrado', '');

      if not Assigned(NFCeAOwer.Orcamento) then
        NFCeAOwer.Orcamento_getOrcamento(NFCeAOwer.fint('norc'), Str);

      QtdeSobraOrcamento := input.QtdePrinc;
      with TPedVendaOrc_Builder.GetItensDisponiveis(NFCeAOwer.Orcamento, FProd.fint('grupo_prod'), FProd.fstr('cod_prod'), input.QtdePrinc) do
        if Count > 0 then
        begin
          UpdatedCodNFCeOrc := False;

          Processo := 'NFC017';
          Acao     := 'INCLUIR';
          if not vDadosIni.PesqPros(Processo, Acao, NFCeAOwer.fstr('cod_nfce') + ' * P:' + FProd.fstr('grupo_prod') + '-' + FProd.fstr('cod_prod') +
                                    IfThen(FProd.fint('cod_grade') > 0, ' G:' + FProd.fstr('cod_grade')),
                                    'NFCE_ITEM', NFCeAOwer.fstr('cod_nfce')) then
            Exit;

          for I := 0 to Count - 1 do with Items[I] do
          begin
            if not Self.Insert then
              Exit;

            fdata('tipo_item').Put('P');
            fdata('grupo_prod').Put(grupo_prod);
            fdata('cod_prod').Put(cod_prod);
            fdata('cod_grade').Put(cod_grade);
            fdata('nitem_orc').Put(nitem);
            fdata('num_fab_prod').Put(input.Codigo);
            fdata('xprod').Put(input.Descricao);
            fdata('qcom').Put(qtde_usada);
            fdata('vuncom').Put(vlun_ped_item);
            fdata('vprod').Put(qtde_usada * vlun_ped_item, -2);
            fdata('vdesc').Put( (rateio_desc / quant_ped_item) * qtde_usada, -2);
            fdata('vseg').Put( (rateio_acresc / quant_ped_item) * qtde_usada, -2);

            dataSet.FieldByName('uvnd').AsString := uvnd;
            dataSet.FieldByName('uvnd_fator').AsFloat := uvnd_fator;

            SetDadosFiscaisProduto();

            Result := inherited Post;

            if not Result then
              raiseExceptionCreate('Não foi possivel utilizar o item %d do Orçamento %d', [nitem, NFCeAOwer.fint('norc')]);

            QtdeSobraOrcamento := QtdeSobraOrcamento - qtde_usada;
            vDadosIni.Auditoria(Processo, Acao, '* ' + Audit_Dados, 'NFCE_ITEM', Audit_Codigo);

            if not UpdatedCodNFCeOrc then
            begin
              SqlExec('update pedvenda set cod_nfce = %d, num_nfce = %d where nped = %d and tipo = ''ORC'' and cod_empresa = %d',
                      [NFCeAOwer.fint('cod_nfce'), NFCeAOwer.fint('num_nf'), NFCeAOwer.fint('norc'), vDadosIni.cod_empresa]);
              UpdatedCodNFCeOrc := True;
            end;
          end;

          if QtdeSobraOrcamento <= 0 then
          begin
            Result := Apply;

            if Result then
            begin
              NFCeAOwer.SalvarECalcular(True, True);

              vDadosIni.GravaAuditoria(Processo, Acao, 'SUCESSO *', 'NFCE_ITEM', Audit_Codigo, buscas);

              Exit;
            end
            else
              raiseExceptionCreate('Não foi possivel utilizar o item %d-%s do Orçamento %d',
                                   [FProd.fint('grupo_prod'), FProd.fstr('cod_prod'), NFCeAOwer.fint('norc')]);
          end
          else
          begin
            input.Desconto  := RoundTo( (input.Desconto / input.QtdePrinc) * QtdeSobraOrcamento, -2);
            input.ValorTot  := RoundTo( input.ValorUnPrinc * QtdeSobraOrcamento, -2);
            input.QtdeVenda := (QtdeSobraOrcamento / input.QtdePrinc * input.QtdeVenda);
          end;
        end;
    end;

    {$ENDREGION}

    if not input.Alteracao then
    begin
      AQtdeEstoqueRequisitada := input.QtdePrinc; 

      Processo := 'NFC017';
      Acao := 'INCLUIR';
      if not vDadosIni.PesqPros(Processo, Acao, Trim(NFCeAOwer.dataSet.FieldByName('cod_nfce').AsString) +
        ' P:' + Trim(FProd.dataSet.FieldByName('grupo_prod').AsString) + '-' + Trim(FProd.dataSet.FieldByName('cod_prod').AsString) +
          vDadosIni.IfThen(FProd.dataSet.FieldByName('cod_grade').AsInteger > 0,
            ' G:' + Trim(FProd.dataSet.FieldByName('cod_grade').AsString), ''),
        'NFCE_ITEM', Trim(NFCeAOwer.dataSet.FieldByName('cod_nfce').AsString)) then
        exit;

      rateioNecessario := NFCeAOwer.FEspelho.RecalcularIbsCbs(
        NFCeAOwer.fequals('DESC_POR_ITEM', 'S'),
        YesNoEnum(NFCeAOwer.fint('dfe_trib_ignorar')) = ynYes,
        NFCeAOwer.ffloat('vprod') + input.ValorTot,
        NFCeAOwer.ffloat('vdesc'),
        NFCeAOwer.ffloat('vfrete'),
        NFCeAOwer.ffloat('vseg'),
        NFCeAOwer.ffloat('voutro')
      );

      if not Insert then
        Exit;

      if not (dataSet.State in [dsInsert, dsEdit]) then
        Exit;

      if FProd.dataSet.RecordCount = 0 then
        raiseExceptionCreate('Nenhum produto encontrado', '');

      dataSet.FieldByName('tipo_item').AsString := 'P';
      dataSet.FieldByName('grupo_prod').AsInteger := FProd.dataSet.FieldByName('grupo_prod').AsInteger;
      dataSet.FieldByName('cod_prod').AsString := FProd.dataSet.FieldByName('cod_prod').AsString;
      dataSet.FieldByName('cod_grade').AsInteger := FProd.dataSet.FieldByName('cod_grade').AsInteger;
    end
    else
    begin
      AQtdeEstoqueRequisitada := 0 - dataSet.FieldByName('qcom').AsFloat + input.QtdePrinc; 
      Processo := 'NFC018';
      Acao := 'ALTERAR';
      if not vDadosIni.PesqPros(Processo, Acao, Audit_Dados,
        'NFCE_ITEM', Audit_Codigo) then
        exit;

      AtualizarTotaisNFCe(True); // parece desnessario isso, o salvar e calcular ja atualiza os totais

      rateioNecessario := NFCeAOwer.FEspelho.RecalcularIbsCbs(
        NFCeAOwer.fequals('DESC_POR_ITEM', 'S'),
        YesNoEnum(NFCeAOwer.fint('dfe_trib_ignorar')) = ynYes,
        NFCeAOwer.ffloat('vprod') + input.ValorTot, // o metodo AtualizarTotaisNFCe(True) subttraiu seu proprio valor do total, e agora somase o novo valor
        NFCeAOwer.ffloat('vdesc'),
        NFCeAOwer.ffloat('vfrete'),
        NFCeAOwer.ffloat('vseg'),
        NFCeAOwer.ffloat('voutro')
      );

      dataSet.Edit;
      FProd.buscaProduto(
        dataSet.FieldByName('grupo_prod').AsInteger,
        dataSet.FieldByName('cod_prod').AsString, True);
    end;

    {$REGION 'Conferencia de estoque'}
    if NFCeAOwer.ConfigNFCe.Estoque.Conferir then
    begin
      AQtdeEstoqueRequisitada := AQtdeEstoqueRequisitada +
        SqlOpen('select sum(nfce_item.qcom) as soma from nfce_item' +
                ' where nfce_item.cod_nfce = ' + IntToStr(NFCeAOwer.dataSet.FieldByName('cod_nfce').AsInteger) +
                ' and nfce_item.cod_empresa = ' + IntToStr(NFCeAOwer.dataSet.FieldByName('cod_empresa').AsInteger) +
                ' and nfce_item.tipo_item = ' + QuotedStr('P') +
                ' and nfce_item.grupo_prod = ' + IntToStr(dataSet.FieldByName('grupo_prod').AsInteger) +
                ' and nfce_item.cod_prod = ' + QuotedStr(dataSet.FieldByName('cod_prod').AsString) +
                ' and nfce_item.cod_grade = ' + IntToStr(dataSet.FieldByName('cod_grade').AsInteger) +
                ' and nfce_item.seqid <> ' + IntToStr(dataSet.FieldByName('seqid').AsInteger)
                ).FieldByName('soma').AsFloat;

      AQtdeEstoqueDisponivel := vDadosIni.getEstoqueDisponivel(buscas,
                                                               dataSet.FieldByName('grupo_prod').AsInteger,
                                                               dataSet.FieldByName('cod_prod').AsString,
                                                               dataSet.FieldByName('cod_grade').AsInteger);
      AQtdeEstoqueProduzir   :=  vDadosIni.getEstoquePrima(buscas,
                                                               dataSet.FieldByName('grupo_prod').AsInteger,
                                                               dataSet.FieldByName('cod_prod').AsString,
                                                               dataSet.FieldByName('cod_grade').AsInteger);

      if AQtdeEstoqueRequisitada > AQtdeEstoqueDisponivel + AQtdeEstoqueProduzir then
      begin
        AMensagemEstoque := 'Estoque insuficiente! ' + sLineBreak +
                            'Disponível : ' + Format('%0.4n', [AQtdeEstoqueDisponivel + AQtdeEstoqueProduzir]) + sLineBreak +
                            'Requisitada: ' + Format('%0.4n', [AQtdeEstoqueRequisitada]);
        if (vDadosIni.vEstoqueNegativo <> 'S') then
          raiseExceptionCreate( AMensagemEstoque, '')
        else if vDadosIni.ShowConfirmacao(AMensagemEstoque + sLineBreak + 'Deseja continuar?') <> IDYES then
          raiseExceptionCreate(AMensagemEstoque + sLineBreak + 'Operação cancelada pelo usuário', '');
      end;
    end;

    {$ENDREGION}

    dataSet.FieldByName('num_fab_prod').AsString := input.Codigo;
    dataSet.FieldByName('xprod').AsString := input.Descricao;
    dataSet.FieldByName('qcom').AsFloat := input.QtdePrinc;
    dataSet.FieldByName('vuncom').AsFloat := input.ValorUnPrinc;
    dataSet.FieldByName('vprod').AsFloat := input.ValorTot;
    dataSet.FieldByName('vdesc').AsFloat := input.Desconto;

    dataSet.FieldByName('uvnd').AsString := input.UndVenda;
    dataSet.FieldByName('uvnd_fator').AsFloat := input.UndFator;
    dataSet.FieldByName('vitem').AsFloat := 0; // vai alterar no momento que calcular o tributo RTC se for o caso 

    SetDadosFiscaisProduto();

    Result := inherited Post;

    if Result then
      Result := Apply;
    dataSet.RefreshRecord;

    if Result then
    begin
      if not rateioNecessario then
        SetTributosRTC();

      NFCeAOwer.MontarDadosAdicionaisInteresseFisco();
      NFCeAOwer.SalvarECalcular(True, rateioNecessario);

      vDadosIni.GravaAuditoria(Processo, Acao, Audit_Dados, 'NFCE_ITEM', Audit_Codigo, buscas);
    end;

  except on E: Exception do
    begin
      if (dataSet.State in [dsInsert, dsEdit]) then
        dataSet.Cancel;
      dataSet.CancelUpdates;
//        NFCeAOwer.dataSet.Cancel;
      NFCeAOwer.RollBackTransacao;
      dataSet.Refresh;
//        NFCeAOwer.dataSet.Edit;
      NFCeAOwer.SetLastMessage('Erro: ' + e.Message);
      registraErro('TNFCe_Itens.SetProduto Erro: ' + e.Message);
    end;
  end;
end;

procedure TNFCe_Itens.SetServ(const Value: TNFC_Servicos);
begin
  FServ := Value;
end;

function TNFCe_Itens.SetServico(Alteracao: Boolean; Codigo, Descricao: string;
  Qtde, ValorUn, ValorTot, Desconto: Double): Boolean;
var
    Processo, Acao: string;
begin
  try
    Result := False;

    if (Alteracao) and (dataSet.IsEmpty) then
      Exit;

    if not NFCeAOwer.PermiteAlteracaoItens then
      Exit;

    if not NFCeAOwer.SetCodigoInterno then
      raiseExceptionCreate('Item não pode ser incluído por problemas ao gerar código interno da NFC-e: TNFCe_Itens.SetProduto', '');

    if not Alteracao then
    begin
      Processo := 'NFC020';
      Acao := 'INCLUIR';
      if not vDadosIni.PesqPros(Processo, Acao, Trim(NFCeAOwer.dataSet.FieldByName('cod_nfce').AsString) +
        ' S:' + Trim(FServ.dataSet.FieldByName('cod_servico').AsString),
        'NFCE_ITEM', Trim(NFCeAOwer.dataSet.FieldByName('cod_nfce').AsString)) then
        exit;

      if not Insert then
        Exit;

      if not (dataSet.State in [dsInsert, dsEdit]) then
        Exit;

      if FServ.dataSet.RecordCount = 0 then
        raiseExceptionCreate('Nenhum produto encontrado', '');

      dataSet.FieldByName('tipo_item').AsString := 'S';
      dataSet.FieldByName('cod_servico').AsInteger := FServ.dataSet.FieldByName('cod_servico').AsInteger;
      dataSet.FieldByName('cod_grade').AsInteger := 0;
    end
    else
    begin
      Processo := 'NFC021';
      Acao := 'ALTERAR';
      if not vDadosIni.PesqPros(Processo, Acao, Audit_Dados,
        'NFCE_ITEM', Audit_Codigo) then
        exit;

      AtualizarTotaisNFCe(True);
      dataSet.Edit;
      FServ.buscaServico(dataSet.FieldByName('cod_servico').AsInteger);
    end;

    dataSet.FieldByName('num_fab_prod').AsString := Codigo;
    dataSet.FieldByName('xprod').AsString := Descricao;
    dataSet.FieldByName('qcom').AsFloat := Qtde;
    dataSet.FieldByName('vuncom').AsFloat := ValorUn;
    dataSet.FieldByName('vprod').AsFloat := ValorTot;
    dataSet.FieldByName('vdesc').AsFloat := Desconto;

    SetDadosFiscaisServico;

    Result := inherited Post;

    if Result then
      Result := Apply;
    dataSet.RefreshRecord;

    if Result then
    begin
      NFCeAOwer.SalvarECalcular(True);

      vDadosIni.GravaAuditoria(Processo, Acao, Audit_Dados, 'NFCE_ITEM', Audit_Codigo, buscas);
    end;

  except on E: Exception do
    begin
      if (dataSet.State in [dsInsert, dsEdit]) then
        dataSet.Cancel;
//        NFCeAOwer.dataSet.Cancel;
//        NFCeAOwer.RollBackTransacao;
//        NFCeAOwer.dataSet.Edit;
      Application.MessageBox(PChar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('TNFCe_Itens.SetServico Erro: ' + e.Message);
    end;
  end;
end;

procedure TNFCe_Itens.SetTributosRTC();
var
  tributosRTC  : TributoDFeContextEtd;
  regraFiscal  : RegraFiscalIbsCbsEtd;
  rfTribRegular: RegraFiscalIbsCbsEtd;
  rocResult    : ROCDomain;
  calcInput    : ItemCalculoInput;
  itensInput   : ItensCalculoInput;
  impSelInput  : ImpostoSeletivoInput;
  tribRegInput : TributacaoRegularInput;

  bcImpSeletivo, bcCbsIbs     : Currency;
  ValorLiquido , Frete, Acrescimos, ICMS, ISS, PIS, COFINS: Double;
  grupoFiscalId, regraFiscalId, dfe_trib_id, tipo_item, ncm_nbs: string;
  data: TDate;
  I, cmunfgibs: Integer;
  erros: TArrayString;
begin
  dfe_trib_id := fstr('DFE_TRIB_ID');

  if (YesNoEnum(NFCeAOwer.fint('dfe_trib_ignorar')) = ynYes)
    and ( dfe_trib_id = '' )
  then
    Exit;

  if (YesNoEnum(NFCeAOwer.fint('dfe_trib_ignorar')) = ynYes)
    and ( dfe_trib_id <>  '' )
  then
  begin
    FTributos.Delete( dfe_trib_id, tdfoNFCe );
    Exit;
  end
  else if dfe_trib_id = '' then
    raise Exception.Create('SetTributosRTC dfe_trib_id empty');

  regraFiscalId := '';
  tipo_item := fstr('tipo_item');

  if tipo_item = 'P' then
  begin
    grupoFiscalId := FProd.fstr('grupo_fiscal_ibscbs');
    ncm_nbs := fstr('ncm');
  end
  else // a fazer
  begin
    grupoFiscalid := '';
    ncm_nbs := '';
  end;

  data      := NFCeAOwer.fdate('dhemi');
  cmunfgibs := NFCeAOwer.fint('cmunfgibs');
  if cmunfgibs = 0 then
    cmunfgibs := vDadosIni.vEmp.vNfe.ibgeCodCidade;

  tributosRTC := TributoDFeOrquestrador.Create( TributoDFeOrquestradorInput.Create(
    NFCeAOwer.fstr('op_interna_id'),
    dfe_trib_id,
    grupoFiscalId,
    ncm_nbs,
    fstr('ucom'),
    NFCeAOwer.fdate('dhemi'),
    cmunfgibs,
    fint('nitem'),
    {ValorLiquido} ffloat('vprod') - ffloat('vdesc'),
    {Acrescimos}   ffloat('vseg') + ffloat('voutro'),
    {Frete}        ffloat('vfrete'),
    {ICMS}         ffloat('icm_vicms'),
    {ISS}          ffloat('iss_vissqn'),
    {PIS}          ffloat('pis_vpis'),
    {COFINS}       ffloat('cofins_vcofins'),
    {Quantidade}   ffloat('qcom')
  ));
  try
    FTributos.SetItem( tributosRTC, tdfoNFCe );
  finally
    tributosRTC.Free()
  end;

  queryCons.SQL(
      'merge into nfce_item n ' +
      'using ' +
      '( ' +
      '  select ' +
      '    ni.cod_nfce, ni.cod_empresa, ni.seqid, ' +
      '    ( coalesce(ni.vprod, 0) ' +
      '      - coalesce(ni.vdesc, 0) ' +
      '      + coalesce(ni.vfrete, 0) ' +
      '      + coalesce(ni.voutro, 0) ' +
      '      + coalesce(ni.vseg, 0) ' +
      IfThen(NFCeAOwer.fdate('dhemi') >= EncodeDate(2027, 01,01),
        '      + coalesce(g.vibs, 0)  ' +
        '      + coalesce(g.vcbs, 0)  ' +
        '      + coalesce(s.vis, 0) ' +
        '      + coalesce(m.vtotibsmonoitem, 0) ' +
        '      + coalesce(m.vtotcbsmonoitem, 0) '
      ) +
      '     ) vitem ' + 
      '  from nfce_item ni ' +
      '    inner join dfe_trib_contexto c on c.id = ni.dfe_trib_id and c.origem = 1 ' +
      '    left join dfe_trib_gibscbs g on g.id = c.id ' +
      '    left join dfe_trib_monofasia m on m.id = c.id ' +
      '    left join dfe_trib_is s on s.id = c.id ' +
      '  where ni.cod_nfce = :cod_nfce and ni.cod_empresa = :cod_empresa and ni.seqid = :seqid ' +
      ') as ni ' +
      'on ' +
      '  (n.cod_nfce = ni.cod_nfce) and (n.cod_empresa = ni.cod_empresa) and (n.seqid = ni.seqid) ' +
      'when matched then ' +
      '  update set ' +
      '    vitem = ni.vitem '
    )
    .ParamValue('cod_nfce', fint('cod_nfce'))
    .ParamValue('cod_empresa', fint('cod_empresa'))
    .ParamValue('seqid', fint('seqid'))
    .ExecSQL();         

end;

procedure TNFCe_Itens.SetValorAproximadosDosTributos();
var
  vTotTrib: Double;
  AAliquota: Double;
  ANCM, AUF: string;
  AEX: Integer;
  AConsultaIBPT: Boolean;
begin
  AConsultaIBPT := NFCeAOwer.ConfigNFCe.ConsultaIBPT;
  if not fempty('NCM')  then
  begin
    ANCM := fstr('NCM');
    AUF := vDadosIni.vEmp.vSiglaUF;
    AEX := 0;

    SqlOpen('select DESCRICAO, NACIONAL, ESTADUAL, IMPORTADO, MUNICIPAL, VIGENCIAFIM from IBPT' +
            ' where CODIGO = %s and UF = %s and EX = %d', [QuotedStr(ANCM), QuotedStr(AUF), AEX]);

    if ((buscas.IsEmpty) or (Date > buscas.FieldByName('VIGENCIAFIM').AsDateTime)) and (Length(ANCM) = 8) then
      if AConsultaIBPT then
      begin
        hw_ibpt_produtos_get( vDadosIni.vBancoHW, vDadosIni.fdbUsuario, vDadosIni.fdbSenha, StrToInt(vDadosIni.codEmpresa),
          '03530705000109', ANCM, AUF, AEX);
        buscas.Close;
        buscas.Open;
      end;

    AAliquota := vDadosIni.vEmp.vAliqPadraoDeOlhoImpostoProduto;
    if not buscas.IsEmpty then
    begin
      if NFCeAOwer.ConfigNFCe.Regras.RejeitarNcmNaoCadastradoNoIBPT then
        if Trim(buscas.FieldByName('DESCRICAO').AsString) = 'Ncm não encontrado na api' then
          NFCeAOwer.LastRejeicao := Format('Item %d - %s: NCM inexistente', [fint('nitem'), fstr('num_fab_prod')]);

      if (Pos(fstr('icm_orig'), '03458') > 0) then
        AAliquota := buscas.FieldByName('NACIONAL').AsFloat +
                     buscas.FieldByName('ESTADUAL').AsFloat +
                     buscas.FieldByName('MUNICIPAL').AsFloat
      else if (Pos(fstr('icm_orig'), '03458') = 0) then
        AAliquota := buscas.FieldByName('IMPORTADO').AsFloat +
                     buscas.FieldByName('ESTADUAL').AsFloat +
                     buscas.FieldByName('MUNICIPAL').AsFloat;
    end
    else
    begin
      buscas.close;
      buscas.SQL.Text := 'select ALIQNAC, ALIQIMP from nbm' +
        ' where cod_ncm = '+ QuotedStr(Trim(dataSet.FieldByName('ncm').AsString));
      buscas.Open;

      if (Pos(fstr('icm_orig'), '03458') > 0) and
       (buscas.FieldByName('ALIQNAC').AsFloat > 0) then
        AAliquota := buscas.FieldByName('ALIQNAC').AsFloat
      else if (Pos(fstr('icm_orig'), '03458') = 0) and
        (buscas.FieldByName('ALIQIMP').AsFloat > 0) then
        AAliquota := buscas.FieldByName('ALIQIMP').AsFloat;
    end;

    dataSet.FieldByName('vtottrib').AsFloat := RoundTo(AAliquota * ffloat('vprod') / 100, -2);
  end;    
end;

{ TNFC_Produtos }

procedure TNFC_Produtos.buscaProduto(Pesquisa: string);
begin
  montaSelect( 'select * from ( ' +
    'select ' + StringReplace(Campos, 'cod_barra.cod_barra', 'produtos.num_fab_prod cod_barra', []) + ' from produtos ' + InnerGrade + InnerCFOP +
    ' where produtos.descr_prod like ' + QuotedStr(Trim(Pesquisa) + '%') +
    ' and produtos.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and produtos.ativo = 1' +
    ' union ' +
    'select ' + Campos + ' from produtos ' + InnerCodBarra + InnerGrade + InnerCFOP +
    ' where cod_barra.cod_barra = ' + QuotedStr(Trim(Pesquisa)) +
    ' and produtos.ativo = 1 and cod_barra.ativo = 1' +
    ' and produtos.cod_empresa = ' + vDadosIni.codEmpresa +
    ' ) order by descr_prod'
  );
end;

function TNFC_Produtos.AjustaCSOSN(CSOSN: string): string;
begin
  if vDadosIni.strIn( CSOSN, ['101', '201', '202']) then // caso o csosb permita credito ou tenha st cobrada do cliente entao 102
    CSOSN := '102'
  else if vDadosIni.strIn( CSOSN, ['203']) then // caso isento
    CSOSN := '103'
  else if not (vDadosIni.strIn( CSOSN, ['102', '103', '300', '400', '500', '900'])) then // caso nao seja nenhum dos permitidos
    CSOSN := '900';

  if not Assigned(NFCeAOwer.ConfUtils.CstsIndevidos)  then
    Result := CSOSN
  else
    Result := NFCeAOwer.ConfUtils.CstsIndevidos.GetCsosnCorrelacionado(CSOSN);
end;

procedure TNFC_Produtos.buscaProduto(GrupoProd: Integer; CodProd: string; inativosTambem: Boolean);
begin
  montaSelect(
    'select ' + StringReplace(Campos, 'cod_barra.cod_barra', ''' '' cod_barra', []) + ' from produtos ' + InnerGrade + InnerCFOP +
    ' where produtos.grupo_prod = ' + IntToStr(GrupoProd) +
    ' and produtos.cod_prod = ' + QuotedStr(CodProd) +
    ' and produtos.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and produtos.ativo in (%s)', [IfThen(inativosTambem, '0,1', '1')]);

  if dataSet.RecordCount > 0 then
  begin


end;
end;

constructor TNFC_Produtos.create(AOwer: TNFCe);
begin
  if dtmNFConsumidor = nil then
    dtmNFConsumidor := TdtmNFConsumidor.Create(dtmNFConsumidor);

  dataSet := TClientDataSet(dtmNFConsumidor.cdsProd);
  transacao := TIBTransaction(dtmNFConsumidor.transacao);
  buscas := TIBQuery(dtmNFConsumidor.qrBuscas);
  FUndVenda := TStringList.Create;

  if AOwer = nil then
    raiseExceptionCreate('NFCeAOwer não referenciado', '');

  FImagemProd := TNFC_Produtos_Imagem.Create(Self);

  NFCeAOwer := TNFCe(AOwer);

  //ALT_COD_CUPOM, ALT_DESC_CUPOM
  Campos := 'produtos.grupo_prod, produtos.cod_prod, produtos.num_fab_prod, cod_barra.cod_barra,' +
    ' produtos.unidade, produtos.descr_prod, produtos.descr_prod_red, produtos.nbm,' +
    ' coalesce(produtos.cfop_nfce, produtos.codigo_nop) codigo_nop, produtos.cst_prod, produtos.cst_pis, produtos.cst_cofins,' +
    ' produtos.prec_tab_prod, produtos.cest,  produtos.nfci, produtos.aliq_pis_diferenciada,' +
    ' produtos.aliq_cofins_diferenciada, produtos.perc_red_prod, produtos.icm_prod,' +
    ' produtos.marca_p, produtos.permitir_desconto, produtos.em_promocao, produtos.preco_promocao,' +
    ' produtos.prec_30_prod, produtos.prec_60_prod, produtos.prec_90_prod, produtos.prec_cusm_prod,' +
    ' produtos.prec_cus_prod, produtos.csosn, produtos.nat_rec,' +
    ' produtos.comb_cprodanp, produtos.comb_descanp, produtos.comb_pglp, produtos.comb_pgnn,' +
    ' produtos.comb_pgni, produtos.comb_vpart, produtos.comb_codif,' +
    ' produtos.fcp_aliq, produtos.nfe_indescala, produtos.nfe_cnpjfab,' +
    ' produtos.fcp_vbcfcpstret, produtos.fcp_pfcpstret, produtos.fcp_vfcpstret,' +
    ' produtos.alt_cod_cupom, produtos.alt_desc_cupom, produtos.lista_imagens,' +
    ' produtos.vicmsmonoret, produtos.adremicmsret, produtos.nfe_utrib, produtos.nfe_qtrib,' +
    ' produtos.grupo_fiscal_ibscbs, '+
    ' nat_op.alt_est, cod_grade_prod.cod_grade, grade.descricao, grade.descricao1';
  InnerCodBarra := 'inner join cod_barra on cod_barra.grupo_prod = produtos.grupo_prod and' +
                   ' cod_barra.cod_prod = produtos.cod_prod and cod_barra.cod_empresa = produtos.cod_empresa';
  InnerGrade    := ' left join cod_grade_prod on cod_grade_prod.grupo_prod = produtos.grupo_prod' +
                   ' and cod_grade_prod.cod_prod = produtos.cod_prod and cod_grade_prod.cod_empresa = produtos.cod_empresa' +
                   ' left join grade on grade.cod_grade = cod_grade_prod.cod_grade and grade.cod_empresa = cod_grade_prod.cod_empresa ';
  InnerCFOP     := ' left join nat_op on nat_op.codigo_nop = coalesce(produtos.cfop_nfce, produtos.codigo_nop)';
end;

procedure TNFC_Produtos.dataSetAfterScroll(DataSet: TDataSet);
begin
  if Assigned(FEventoAfterScroll) then
    FEventoAfterScroll;
end;

destructor TNFC_Produtos.Destroy;
begin
  FreeAndNil(FImagemProd);
  FreeAndNil(FUndVenda);
  inherited;
end;

function TNFC_Produtos.getCSOSNPorCST(CST: string): string;
var
  CSOSN: string;
  I: Integer;
begin
  if FListRelCSOSNCST = nil then
  begin
    FListRelCSOSNCST := TStringList.Create;
    FListRelCSOSNCST := vDadosIni.getConfSisBlob('prod_cad_relacao_cst_csosn', buscas);
  end;
  CSOSN := '';
  for I := 0 to FListRelCSOSNCST.Count - 1 do
  begin
    if CST = vDadosIni.getValue(FListRelCSOSNCST[i], 1) then //por padrao vai utilizar o primeiro csosn que encontrar
      CSOSN := vDadosIni.getValue(FListRelCSOSNCST[i], 2);
    if CSOSN <> '' then
      Break;
  end;

  Result := AjustaCSOSN(CSOSN);
  if CSOSN = '' then // caso na tenha configuracao o padrao é este abaixo
  begin
    if vDadosIni.strIn( CST, ['00', '10', '20', '70']) then
      CSOSN := '102'
    else if vDadosIni.strIn( CST, ['30', '50']) then
      CSOSN := '103'
    else if vDadosIni.strIn( CST, ['40']) then
      CSOSN := '400'
    else if vDadosIni.strIn( CST, ['41']) then
      CSOSN := '300'
    else if vDadosIni.strIn( CST, ['60']) then
      CSOSN := '500'
    else
      CSOSN := '900';
    CSOSN := AjustaCSOSN(CSOSN);
  end
  else
    CSOSN := AjustaCSOSN(CSOSN);

  Result := CSOSN;
end;

function TNFC_Produtos.getCSTDevido(CST: string): string;
begin
  if not Assigned(NFCeAOwer.ConfUtils.CstsIndevidos)  then
    Result := IfThen(MatchStr(CST, ['50', '51']), '90', CST)
  else
    Result := NFCeAOwer.ConfUtils.CstsIndevidos.GetCstCorrelacionado(CST);
end;

function TNFC_Produtos.GetEstoqueDisponivel: Double;
begin
  FEstoqueDisponivel :=
  	vDadosIni.getEstoqueDisponivel(buscas,
	    dataSet.FieldByName('grupo_prod').AsInteger,
  	  dataSet.FieldByName('cod_prod').AsString,
    	dataSet.FieldByName('cod_grade').AsInteger
	    );

  FEstoqueDisponivel := FEstoqueDisponivel +
  	vDadosIni.getEstoquePrima(buscas,
	    dataSet.FieldByName('grupo_prod').AsInteger,
	    dataSet.FieldByName('cod_prod').AsString,
	    dataSet.FieldByName('cod_grade').AsInteger
	    );

  Result := FEstoqueDisponivel;
end;

function TNFC_Produtos.GetSequenciaPreco: string;
begin
  FSequenciaPreco := NFCeAOwer.dataSet.FieldByName('seqpreco').AsString;
  Result := FSequenciaPreco;
end;

function TNFC_Produtos.GetUndVenda: TStrings;
var
  convs: TUnidadeVendas_Model;
  conv: TUnidadeVenda_Model;
  I: Integer;
begin
  queryCons.SQL('select iif(pu.padrao_venda = ''S'', -1, 1) ind,' +
                ' pu.grupo_prod, pu.cod_prod, pu.cod_empresa, p.unidade unid_princ, pu.unidade unid_vnd,' +
                ' iif(pu.operacao = ''D'', 1 /  pu.quantidade,pu.quantidade) fator' +
                ' from produtos p' +
                ' inner join produtos_conversao_saida pu on pu.grupo_prod = p.grupo_prod and pu.cod_prod = p.cod_prod and pu.cod_empresa = p.cod_empresa' +
                ' and pu.unidade <> p.unidade and pu.disponivel_venda = ''S''' +
                ' where p.grupo_prod = :grupo_prod and p.cod_prod = :cod_prod and p.cod_empresa = :cod_empresa' +
                ' union distinct' +
                ' select 0 ind, p.grupo_prod, p.cod_prod, p.cod_empresa, p.unidade unid_princ, p.unidade unid_vnd, 1 fator from produtos p' +
                ' where p.grupo_prod = :grupo_prod and p.cod_prod = :cod_prod and p.cod_empresa = :cod_empresa' +
                ' order by 1, 4')
    .ParamValue('grupo_prod', fint('grupo_prod'))
    .ParamValue('cod_prod', fstr('cod_prod'))
    .ParamValue('cod_empresa', vDadosIni.cod_empresa)
    .Open();

  convs := TUnidadeVendas_Model.Create;
  convs.CopyFrom(TUnidadeVenda_Model, queryCons.query, False);

  FUndVenda.Clear;

  for I := 0 to convs.Count - 1 do
    FUndVenda.AddObject(convs.Items[I].unid_vnd, convs.Items[I]);

  if FUndVenda.Count = 0 then
  begin
    conv := TUnidadeVenda_Model.Create;
    conv.unid_vnd := fstr('unidade');
    conv.unid_princ := conv.unid_vnd;
    conv.fator := 1;
    FUndVenda.AddObject(fstr('unidade'), conv);
  end;

  Result := FUndVenda;
end;

function TNFC_Produtos.GetValorDeVenda: Double;
begin
  GetSequenciaPreco;
  FValorDeVenda := 0;
  if NFCeAOwer.ConfigNFCe.Regras.PermitePrecoPromocao and (dataSet.FieldByName('preco_promocao').AsFloat > 0) then
    FValorDeVenda := dataSet.FieldByName('preco_promocao').AsFloat
  else if FSequenciaPreco = '4' then
  begin
    FValorDeVenda := dataSet.FieldByName('prec_90_prod').AsFloat;
    if FValorDeVenda <= 0 then
      FValorDeVenda :=
        vDadosIni.IfThen(dataSet.FieldByName('prec_60_prod').AsFloat > 0,
          dataSet.FieldByName('prec_60_prod').AsFloat,
          vDadosIni.IfThen( dataSet.FieldByName('prec_30_prod').AsFloat > 0,
            dataSet.FieldByName('prec_30_prod').AsFloat,
            dataSet.FieldByName('prec_tab_prod').AsFloat)
        );
  end
  else if FSequenciaPreco = '3' then
  begin
    FValorDeVenda := dataSet.FieldByName('prec_60_prod').AsFloat;
    if FValorDeVenda <= 0 then
      FValorDeVenda :=
        vDadosIni.IfThen(dataSet.FieldByName('prec_30_prod').AsFloat > 0,
          dataSet.FieldByName('prec_30_prod').AsFloat,
            dataSet.FieldByName('prec_tab_prod').AsFloat);
  end
  else if FSequenciaPreco = '2' then
  begin
    FValorDeVenda := dataSet.FieldByName('prec_30_prod').AsFloat;
    if FValorDeVenda <= 0 then
      FValorDeVenda := dataSet.FieldByName('prec_tab_prod').AsFloat;
  end
  else
    FValorDeVenda := dataSet.FieldByName('prec_tab_prod').AsFloat;

  Result := FValorDeVenda;
end;

procedure TNFC_Produtos.SetEstoqueDisponivel(const Value: Double);
begin
  FEstoqueDisponivel := Value;
end;

procedure TNFC_Produtos.SetEventoAfterScroll(const Value: TEventProcedure);
begin
  FEventoAfterScroll := Value;
  if not Assigned(FEventoAfterScroll) then
    dataSet.AfterScroll := nil
  else
    dataSet.AfterScroll := dataSetAfterScroll;

  if Assigned(FEventoAfterScroll) then
    FEventoAfterScroll;
end;

procedure TNFC_Produtos.SetValorDeVenda(const Value: Double);
begin
  FValorDeVenda := Value;
end;

function TNFC_Produtos.ValidaEAN(CodBar: string): Boolean;
var
  sl_CodIni: string;
  il_SeqSom, il_Soma, il_TodNum: Integer;

  function DUN14Valido: Boolean;
  var
    Codigo,converCalculo :string;
    imp2, imp1, imp3, imp4, imp5,imp6, imp7, par1, par2 ,par3, par4, par5,par6,TResult,Tamanho,TImpar, TPar, Calculo, Digito:integer;
  begin

    try
      Codigo := Copy(CodBar, 1, 13);

      imp1:= StrToInt(copy(Codigo,1,1));
      imp2:= StrToInt(copy(Codigo,3,1));
      imp3:= StrToInt(copy(Codigo,5,1));
      imp4:= StrToInt(copy(Codigo,7,1));
      imp5:= StrToInt(copy(Codigo,9,1));
      imp6:= StrToInt(copy(Codigo,11,1));
      imp7:= StrToInt(copy(Codigo,13,1));

      TImpar:= (imp1)+(imp2)+(imp3)+(imp4)+(imp5)+(imp6)+(imp7);
      TImpar:= TImpar * 3;

      par1:= StrToInt(copy(Codigo,2,1));
      par2:= StrToInt(copy(Codigo,4,1));
      par3:= StrToInt(copy(Codigo,6,1));
      par4:= StrToInt(copy(Codigo,8,1));
      par5:= StrToInt(copy(Codigo,10,1));
      par6:= StrToInt(copy(Codigo,12,1));

      TPar:= (par1)+(par2)+(par3)+(par4)+(par5)+(par6);

      Calculo:= TImpar + TPar;

      converCalculo:= IntToStr(Calculo);

      Tamanho:= length(converCalculo);

      case Tamanho of
      1 :begin
          TResult:= StrToInt(copy(converCalculo,1,1));
            if TResult= 0 then
             Digito:= 0
            else
             Digito:= TResult - 10;

            if Digito < 0 then
             Digito:= ABS(Digito);
         end;

      2 :begin
          TResult:= StrToInt(copy(converCalculo,2,1));
            if TResult = 0 then
             Digito:= 0
            else
             Digito:= 10 - TResult;

           if Digito < 0 then
             Digito:= ABS(Digito);
         end;

      3 :begin
          TResult:= StrToInt(copy(converCalculo,3,1));
            if TResult= 0 then
              Digito:= 0
            else
              Digito:= 10 -  TResult;

           if Digito < 0 then
             Digito:= ABS(Digito);
         end;
      end;

      Result := IntToStr(Digito) = Copy(CodBar, 14, 1);

    except
      Result := False;
    end;
  end;

begin
  Result := False;

  CodBar := Trim(CodBar);
  if CodBar <> OnlyNumber(CodBar) then
    Exit;

  if not (Length(CodBar) in [8, 12, 13, 14]) then
    Exit;

  if (Length(Trim(CodBar)) = 14) then
     Result := DUN14Valido
    // se codigo eh certo, entao continua
  else
  begin
    sl_CodIni := PadL(CodBar, 13, '0');

    sl_CodIni := Copy(Trim(sl_CodIni), 1, Length(sl_CodIni) - 1);
    il_Soma := 0;
    il_SeqSom := 1;

    // se for ean8 entao completa numeros
//    if Length(Trim(CodBar)) = 8 then
//      sl_CodIni := '00000' + sl_CodIni;

    // continua

    for il_TodNum := 1 to Length(sl_CodIni) do
    begin
      if il_SeqSom = 1 then
      begin
        il_Soma := il_Soma +
          (StrToInt(Copy(sl_CodIni, il_TodNum, 1)) * il_SeqSom);
        il_SeqSom := 3;
      end
      else
      begin
        il_Soma := il_Soma +
          (StrToInt(Copy(sl_CodIni, il_TodNum, 1)) * il_SeqSom);
        il_SeqSom := 1;
      end

    end;

    // calcula o restante

    // para numeros que nao sao zero no final
    if Copy(IntToStr(il_Soma), Length(IntToStr(il_Soma)), 1) <> '0' then
    begin
      if Copy(Trim(CodBar), Length(CodBar), 1) =
        IntToStr(10 - StrToInt(Copy(IntToStr(il_Soma),
        Length(IntToStr(il_Soma)), 1))) then
        Result := TRUE
      else
        Result := FALSE
    end
    else if StrToInt(Copy(Trim(CodBar), Length(CodBar), 1)) = 0 then
      Result := TRUE
    else
      Result := FALSE;
  end;
end;

{ TNFC_Servicos }

procedure TNFC_Servicos.buscaServico(Pesquisa: string);
begin
  montaSelect('select ' + FCampos + ' from tipo_servico' +
    ' inner join tipo_servico_empresa on tipo_servico_empresa.cod_servico = tipo_servico.cod_servico and tipo_servico_empresa.cod_empresa = ' + vDadosIni.codEmpresa +
    ' left join tiposerviconfse on tiposerviconfse.cod_tpservico = tipo_servico.nfs_servico' +
    ' where tipo_servico.desc_servico like '  + QuotedStr(Trim(Pesquisa) + '%') +
    ' union ' +
    ' select ' + FCampos + ' from tipo_servico' +
    ' inner join tipo_servico_empresa on tipo_servico_empresa.cod_servico = tipo_servico.cod_servico and tipo_servico_empresa.cod_empresa = ' + vDadosIni.codEmpresa +
    ' left join tiposerviconfse on tiposerviconfse.cod_tpservico = tipo_servico.nfs_servico' +
    ' where tipo_servico.cod_servico = '  + IntToStr(StrToIntDef(Pesquisa, -1))
  );
end;

procedure TNFC_Servicos.buscaServico(CodServico: Integer);
begin
  montaSelect('select ' + FCampos + ' from tipo_servico' +
  	' inner join tipo_servico_empresa on tipo_servico_empresa.cod_servico = tipo_servico.cod_servico and tipo_servico_empresa.cod_empresa = ' + vDadosIni.codEmpresa +
    ' left join tiposerviconfse on tiposerviconfse.cod_tpservico = tipo_servico.nfs_servico' +
    ' where tipo_servico.cod_servico = ' + IntToStr(CodServico));
end;

constructor TNFC_Servicos.create(AOwer: TNFCe);
begin
  if dtmNFConsumidor = nil then
    dtmNFConsumidor := TdtmNFConsumidor.Create(dtmNFConsumidor);

  dataSet := TClientDataSet(dtmNFConsumidor.cdsServ);
  transacao := TIBTransaction(dtmNFConsumidor.transacao);
  buscas := TIBQuery(dtmNFConsumidor.qrBuscas);

  if AOwer = nil then
    raiseExceptionCreate('NFCeAOwer não referenciado', '');

  NFCeAOwer := TNFCe(AOwer);

  FISSRetidoNoCliente := 'N';

  FCampos :=
    ' tipo_servico.cod_servico, tipo_servico.desc_servico, tipo_servico.valor_servico,' +
    ' tiposerviconfse.cod_tpservico, tiposerviconfse.desc_tpservico, tipo_servico.aliq_iss,' +
    ' tipo_servico.cst_pis, tipo_servico.cst_cofins, tipo_servico.codigo_nop,' +
    ' tipo_servico.isento_serv, tipo_servico.n_incidencia_serv, tipo_servico.iss_retido,' +
    ' tipo_servico.unidade ';
end;

procedure TNFC_Servicos.SetISSRetidoNoCliente;
begin
  FISSRetidoNoCliente := 'N';
  if (NFCeAOwer.dataSet.FieldByName('cod_cliente').AsInteger = 0) or
    (NFCeAOwer.dataSet.FieldByName('cod_cliente').AsInteger = NFCeAOwer.ConfigNFCe.CodigoClientePadrao) then
    Exit;

  buscas.Close;
  buscas.SQL.Text := 'select ISS_RETIDO from clientes' +
    ' where cod_cliente = ' + IntToStr(NFCeAOwer.dataSet.FieldByName('cod_cliente').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  if buscas.FieldByName('iss_retido').AsInteger = 1 then
    FISSRetidoNoCliente := 'C';
  buscas.Close;
end;

{ TNFCe_Pagamentos }

procedure TNFCe_Pagamentos.AbreRegistros;
begin
  dataSet.AfterRefresh := dataSetPagamentoAfterRefresh;
  dataSet.AfterOpen := dataSetPagamentoAfterRefresh;
  montaSelect('select' +
    ' nfce_pagamento.cod_nfce, nfce_pagamento.cod_empresa, nfce_pagamento.seqid,' +
    ' nfce_pagamento.tpag, nfce_pagamento.vpag, nfce_pagamento.cnpj, nfce_pagamento.tband,' +
    ' nfce_pagamento.caut, nfce_pagamento.cod_controle, nfce_pagamento.indpag,' +
    ' nfce_pagamento.id_tr_cartao, nfce_pagamento.guid_tr_cartao, controles.nome_ctrl' +
    ' from nfce_pagamento' +
    ' left join controles on controles.codigo_ctrl = nfce_pagamento.cod_controle and' +
    ' controles.codigo_emp = nfce_pagamento.cod_empresa' +
    ' where nfce_pagamento.cod_nfce = ' + IntToStr(NFCeAOwer.dataSet.FieldByName('cod_nfce').AsInteger) +
    ' and nfce_pagamento.cod_empresa = ' + IntToStr(NFCeAOwer.dataSet.FieldByName('cod_empresa').AsInteger)
  );
  IndexFieldNames := 'seqid';

  //removi pois na offline o codigo é diferente do codigo do tsplus
  //TransacaoCartaoVerificarRegistros;
end;

constructor TNFCe_Pagamentos.create(AOwer: TNFCe);
begin
  TableName := 'NFCE_PAGAMENTO';
  if dtmNFConsumidor = nil then
    dtmNFConsumidor := TdtmNFConsumidor.Create(dtmNFConsumidor);

  dataSet := TClientDataSet(dtmNFConsumidor.cdsNFCe_Pag);
  transacao := TIBTransaction(dtmNFConsumidor.transacao);
  buscas := TIBQuery(dtmNFConsumidor.qrBuscas);

  FTipoPagamento := TNFCe_PagamentosForma.create;

  FlkTipoPagamento := TDadosLookUp_OOP.create;
  FlkBandeira := TDadosLookUp_OOP.create;

  if AOwer = nil then
    raiseExceptionCreate('NFCeAOwer não referenciado', '');

  dataSet.FieldByName('nome_ctrl').OnGetText := dataSetPagamentosGetText;
  dataSet.FieldByName('tband').OnGetText := dataSetPagamentosGetText;

  NFCeAOwer := TNFCe(AOwer);
end;

procedure TNFCe_Pagamentos.dataSetPagamentoAfterRefresh(DataSet: TDataSet);
var
  RecNo: Integer;
begin
  FValorTotal := 0;
  if DataSet.IsEmpty then
    Exit;
  try
    RecNo := DataSet.RecNo;
    DataSet.First;
    while not DataSet.Eof do
    begin
      FValorTotal := FValorTotal + DataSet.FieldByName('vpag').AsFloat;
      DataSet.Next;
    end;
    if Assigned(FPagamentoChange) then
      FPagamentoChange;
  finally
    DataSet.RecNo := RecNo; 
  end;
end;

procedure TNFCe_Pagamentos.dataSetPagamentosGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := Trim(Sender.AsString);
  if Sender.FieldName = 'NOME_CTRL' then
  begin
    if Trim(Text) = '' then
    case dataSet.FieldByName('tpag').AsInteger of
      01: Text := '01 - Dinheiro - ' + Trim(Text);
      02: Text := '02 - Cheque - ' + Trim(Text);
      03: Text := '03 - Cartão de Crédito - ' + Trim(Text);
      04: Text := '04 - Cartão de Débito - ' + Trim(Text);
      05: Text := '05 - Crédito Loja - ' + Trim(Text);
      10: Text := '10 - Vale Alimentação - ' + Trim(Text);
      11: Text := '11 - Vale Refeição - ' + Trim(Text);
      12: Text := '12 - Vale Presente - ' + Trim(Text);
      13: Text := '13 - Vale Combustível - ' + Trim(Text);
      99: Text := '99 - Outros - ' + Trim(Text);
    end;
  end
  else if Sender.FieldName = 'TBAND' then
  begin 
    case dataSet.FieldByName('tband').AsInteger of
      01: Text := '01 - Visa';
      02: Text := '02 - Mastercard';
      03: Text := '03 - American Express';
      99: Text := '99 - Outros';
    end;
  end;
end;

function TNFCe_Pagamentos.delete: Boolean;
begin
  if dataSet.IsEmpty then
    Exit;
  try
    if not vDadosIni.PesqPros('NFC027', 'NFCE_PAGAMENTO', Audit_Dados ,
      'NFCE', Audit_Codigo) then
      exit;

    if not fempty('guid_tr_cartao') then
      if SqlOpen('select status from transacao_cartao where guidt = %s and cod_empresa = %d', [fstrq('guid_tr_cartao'), vDadosIni.cod_empresa])
        .FieldByName('status').AsString = 'A' then
      begin
        ShowAtencao('Pagamento em Cartão ou Carteira Digital já autorizado');
        if not Auditor.SetTabela(TableName).Processo('NFC039').Key(Audit_Codigo).Msg(Audit_Dados).
          Validar.Permitido then
          Exit;
      end;

    buscas.Close;
    buscas.SQL.Text := 'delete from nfce_pagamento' +
      ' where cod_nfce = ' + IntToStr(dataSet.FieldByName('cod_nfce').AsInteger) +
      ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger) +
      ' and seqid = ' + IntToStr(dataSet.FieldByName('seqid').AsInteger);
    buscas.ExecSQL;

    if NFCeAOwer.HouveAlteracao then
    begin
      NFCeAOwer.Apply;
      NFCeAOwer.CommitaTransacao;
      NFCeAOwer.dataSet.Edit;
    end
    else
      NFCeAOwer.CommitaTransacao;

    vDadosIni.GravaAuditoria('NFC027', 'EXCLUIR', 'SUCESSO', 'NFCE_PAGAMENTO', '', buscas);

    dataSet.Refresh;

    if dataSet.RecordCount = 0 then
    begin
      if NFCeAOwer.dataSet.FieldByName('status').AsString = stsFechando then
        NFCeAOwer.SetStatusAberta;

      if NFCeAOwer.HouveAlteracao then
      begin
        NFCeAOwer.Apply;
        NFCeAOwer.CommitaTransacao;
        NFCeAOwer.dataSet.Edit;
      end
      else
        NFCeAOwer.CommitaTransacao;
    end;
    
      if Assigned(FPagamentoChange) then
        FPagamentoChange;
  finally
    dataSet.Refresh;
  end;   
end;

destructor TNFCe_Pagamentos.Destroy;
begin
  if FlkTipoPagamento <> nil then
    FreeAndNil(FlkTipoPagamento);
  if FlkBandeira <> nil then
    FreeAndNil(FlkBandeira);
  inherited;
end;

function TNFCe_Pagamentos.GetAudit_Codigo: string;
begin
  Result := Trim(NFCeAOwer.dataSet.FieldByName('cod_nfce').AsString) +
    vDadosIni.IfThen(Trim(dataSet.FieldByName('seqid').AsString) <> '',
      '-' + Trim(dataSet.FieldByName('seqid').AsString), '');
end;

function TNFCe_Pagamentos.GetAudit_Dados: string;
begin
  Result := 'COD:' + Audit_Codigo +
    ' PAG:' + Trim(dataSet.FieldByName('tpag').AsString) +
    vDadosIni.IfThen(dataSet.FieldByName('cod_controle').AsInteger > 0,
      ' CTRL:' + Trim(dataSet.FieldByName('cod_controle').AsString), '');
    vDadosIni.IfThen(Trim(dataSet.FieldByName('tband').AsString) = 'S',
      ' BAND:' + Trim(dataSet.FieldByName('tband').AsString), '');
end;

function TNFCe_Pagamentos.GetPagamentoConcluido: Boolean;
begin
  Result := RoundTo(ValorTotal, -2) >= NFCeAOwer.ffloat('vnf',0 -2);
end;

function TNFCe_Pagamentos.GetValorTroco: Double;
begin
  Result := RoundTo(ValorTotal, -2) - NFCeAOwer.ffloat('vnf',0 -2);
  if Result < 0 then
    Result := 0;
end;

procedure TNFCe_Pagamentos.SetlkBandeira(const Value: TDadosLookUp_OOP);
begin
  FlkBandeira := Value;
end;

procedure TNFCe_Pagamentos.SetlkTipoPagamento(const Value: TDadosLookUp_OOP);
begin
  FlkTipoPagamento := Value;
end;

function TNFCe_Pagamentos.SetPagamento(Alteracao: Boolean; Controle, Bandeira: Variant;
  TipoPag: Integer; Valor: Double; NumAutorizacao, IndPag: string): Boolean;
var
  Processo, Acao, MsgAuditoria: string;
  Diferenca: Double;
  transacaoCartao: TNFCe_TransacaoCartao;
  tpIntegra, cnpjCartao, guidTrans: string;
  trId: Integer;
begin
  try
    Result := False;

    if (Alteracao) and (dataSet.IsEmpty) then
      Exit;

    if NFCeAOwer.dataSet.FieldByName('vnf').AsFloat <= 0 then
      raiseExceptionCreate('Pagamento não pode ser incluído. NFC-e sem valor', '');

    if NFCeAOwer.Itens.dataSet.RecordCount = 0 then
      raiseExceptionCreate('Pagamento não pode ser incluído. NFC-e sem itens', '');

    if not NFCeAOwer.SetCodigoInterno then
      raiseExceptionCreate('Pagamento não pode ser incluído por problemas ao gerar código interno da NFC-e: TNFCe_Pagamentos.SetPagamento', '');

    if not Alteracao then
    begin
      Diferenca := (ValorTotal + Valor) - NFCeAOwer.dataSet.FieldByName('vnf').AsFloat;
      if vDadosIni.strIn(NFCeAOwer.dataSet.FieldByName('NFE_VERSAO').AsString, [strVerVazio, strVer310]) then
        if RoundTo(Diferenca, -2) > 0 then
          raiseExceptionCreate('Valor total do pagamento não pode ser superior ao valor da NFC', 'edValorPagamento');

      Processo := 'NFC025';
      Acao := 'INCLUIR';
      if TipoPag <> 0    then  MsgAuditoria :=                  'PAG:' + IntToStr(Integer(TipoPag)) else MsgAuditoria := '';
      if Controle <> Null then MsgAuditoria := MsgAuditoria + ' CTRL:' + IntToStr(Integer(Controle));
      if Bandeira <> Null then MsgAuditoria := MsgAuditoria + ' BAND:' + IntToStr(Integer(Bandeira));

      if not vDadosIni.PesqPros(Processo, Acao, MsgAuditoria,
        'NFCE_PAGAMENTO', Trim(NFCeAOwer.dataSet.FieldByName('cod_nfce').AsString)) then
        exit;

      trId := 0;
      transacaoCartao := TransacaoCartaoExecutar(Valor);
      if Assigned(transacaoCartao) then
      begin
        if transacaoCartao.Efetuada then
        begin
          trId := transacaoCartao.TransacaoId;
          Valor := transacaoCartao.ValorPago;
          NumAutorizacao := transacaoCartao.NumAut;
          tpIntegra := '1';
          cnpjCartao := IfThen(Length(transacaoCartao.CNPJ) = 14, transacaoCartao.CNPJ);
          cnpjCartao := IfThen(cnpjCartao <> '', cnpjCartao, IfThen(TipoPagamento.fdata('cpfcgc').Length = 14, TipoPagamento.fstr('cpfcgc')));

          //TipoPag := IfThen(transacaoCartao.DebCred <> 'D', 3, 4);

          
          IndPag := '0';

          if (transacaoCartao.PspId <> '') then
            TipoPag := 17
          else if (transacaoCartao.CarteiraId <> '') then
            TipoPag := 18
          else if transacaoCartao.Operacao = 'D' then
            TipoPag := 4
          else
          begin
            TipoPag := 3;
            IndPag := '1';
          end;

          if (TipoPag = 17) or (TipoPag = 18) then
            Bandeira := Null
          else
            Bandeira := transacaoCartao.BandeiraId;

          if (transacaoCartao.CarteiraId <> '') and (transacaoCartao.ControleId > 0) then
            Controle := transacaoCartao.ControleId;

        end
        else if ShowConfirmacao('Transação TEF não efetuada. Registrar sem a transação TEF?') <> ID_YES then
          Exit
        else if not Auditor.SetTabela(TableName).Processo('NFC040').Key(Audit_Codigo)
          .Msg(Audit_Dados).Validar.Permitido then
          Exit;
      end
      else
      begin
        tpIntegra := '2';
        cnpjCartao := IfThen(TipoPagamento.fdata('cpfcgc').Length = 14, TipoPagamento.fstr('cpfcgc'));
      end;

      if trId > 0 then
        guidTrans := SqlScalar('select guidt from TRANSACAO_CARTAO where seqid = %d and cod_empresa = %d', [trId, vDadosIni.cod_empresa]).AsString
      else
        guidTrans := '';
      
      buscas.Close;
      buscas.SQL.Text := 'insert into nfce_pagamento (cod_nfce, cod_empresa, seqid, tpag, vpag, cnpj, tband, caut, cod_controle, tpintegra, indpag, id_tr_cartao, guid_tr_cartao)' +
        ' values ' +
        ' (:cod_nfce, :cod_empresa, :seqid, :tpag, :vpag, :cnpj,' +
        ' :tband, :caut, :cod_controle, :tpintegra, :indpag, :id_tr_cartao, :guid_tr_cartao)';
      buscas.ParamByName('seqid').AsInteger := Gencodigo('NFCE_PAGAMENTO', NFCeAOwer.buscas1, IntToStr(NFCeAOwer.dataSet.FieldByName('cod_empresa').AsInteger));
      if trId > 0 then
      begin
        buscas.ParamByName('id_tr_cartao').AsInteger := trId;
        buscas.ParamByName('guid_tr_cartao').AsString := guidTrans;
      end;
    end
    else
    begin
      if not fempty('guid_tr_cartao') then
        if SqlOpen('select status from transacao_cartao where guidt = %s and cod_empresa = %d', [fstrq('guid_tr_cartao'), vDadosIni.cod_empresa])
          .FieldByName('status').AsString = 'A' then
        begin
          ShowErro('Pagamento efetuado em Cartão TEF. Não permite alteração' + sLineBreak +
                   'Se necessário cancele a transação via Operação ADM e depois exclua o pagamento');
          Exit;
        end;

      Diferenca := ((ValorTotal + Valor) - dataSet.FieldByName('vpag').AsFloat ) -
        NFCeAOwer.dataSet.FieldByName('vnf').AsFloat;
      if vDadosIni.strIn(NFCeAOwer.dataSet.FieldByName('NFE_VERSAO').AsString, [strVerVazio, strVer310]) then
        if vDadosIni.StrToFloatFormat(Diferenca, 2) > 0 then
          raiseExceptionCreate('Valor total do pagamento não pode ser superior ao valor da NFC', 'edValorPagamento');

      Processo := 'NFC026';
      Acao := 'ALTERAR';
      if not vDadosIni.PesqPros(Processo, Acao, Audit_Dados, 'NFCE_PAGAMENTO', Audit_Codigo) then
        Exit;

      cnpjCartao := IfThen(TipoPagamento.fdata('cpfcgc').Length = 14, TipoPagamento.fstr('cpfcgc'));
      tpIntegra := '2';

      buscas.Close;
      buscas.SQL.Text := ' update nfce_pagamento set' +
        ' tpag = :tpag, vpag = :vpag,' +
        ' cnpj = :cnpj, tband = :tband, caut = :caut, cod_controle = :cod_controle,' +
        ' tpintegra = :tpintegra, indpag = :indpag' +
        ' where cod_nfce = :cod_nfce and cod_empresa = :cod_empresa and' +
        ' seqid = ' + IntToStr(dataSet.FieldByName('seqid').AsInteger);
    end;

    buscas.ParamByName('cod_nfce').AsInteger    := NFCeAOwer.fint('cod_nfce');
    buscas.ParamByName('cod_empresa').AsInteger := NFCeAOwer.fint('cod_empresa');
    buscas.ParamByName('tpag').AsInteger        := TipoPag;
    buscas.ParamByName('vpag').AsFloat := Valor;
    buscas.ParamByName('cnpj').AsString         := cnpjCartao;
    buscas.ParamByName('tband').Value           := Bandeira;
    buscas.ParamByName('caut').AsString         := NumAutorizacao;
    buscas.ParamByName('cod_controle').Value    := Controle;
    buscas.ParamByName('tpintegra').AsString    := tpIntegra;
    buscas.ParamByName('indpag').AsString       := IndPag;
    buscas.ExecSQL;

    if not MatchText(NFCeAOwer.fstr('NFE_VERSAO'), [strVerVazio, strVer310]) then
    begin
      if NFCeAOwer.dataSet.state = dsBrowse then
        NFCeAOwer.dataSet.edit;

      NFCeAOwer.dataSet.FieldByName('vtroco').AsFloat := IfThen(RoundTo(Diferenca, -2) > 0, RoundTo(Diferenca, -2), 0);
    end;

    if NFCeAOwer.dataSet.FieldByName('status').AsString = stsAberta then
      NFCeAOwer.SetStatusFechando;

    if NFCeAOwer.HouveAlteracao then
    begin
      NFCeAOwer.Apply;
      NFCeAOwer.CommitaTransacao;
      NFCeAOwer.dataSet.Edit;
    end
    else
      NFCeAOwer.CommitaTransacao;

    Result := True;

    vDadosIni.GravaAuditoria(Processo, Acao, 'SUCESSO', 'NFCE_PAGAMENTO', Audit_Codigo, buscas);

    dataSet.Refresh;

  except on E: Exception do
    begin
      if not NFCeAOwer.EmissaoRapida then
      Application.MessageBox(PChar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('TNFCe_Pagamentos.SetProduto Erro: ' + e.Message);
    end;
  end;
end;

procedure TNFCe_Pagamentos.SetPagamentoChange(const Value: TEventProcedure);
begin
  FPagamentoChange := Value;
end;

procedure TNFCe_Pagamentos.SetTipoPagamento(const Value: TNFCe_PagamentosForma);
begin
  FTipoPagamento := Value;
end;

procedure TNFCe_Pagamentos.SetValorTotal(const Value: Double);
begin
  FValorTotal := Value;
end;

function TNFCe_Pagamentos.TransacaoCartaoExecutar(
  Valor: Double): TNFCe_TransacaoCartao;
var
  //cartao
  secaoAtual: Integer;
  valorPendente: Double;
  terminalAdm: string;
  I: Integer;
  payload: TTEFOperacao;
begin
  Result := nil;

  if (not NFCeAOwer.ConfigNFCe.Cartao.UsarPosTEFQuandoHabilitado) or
    (not TipoPagamento.IsTEF) then
    Exit;

  {
  if (not NFCeAOwer.ConfigNFCe.Cartao.UsarPosTEFQuandoHabilitado) or
     (TipoPagamento.fdif('tp_plano', 'C')) or
     (IniConf.ReadStr('TEF', 'POSVirtual', 'N') <> 'S') then // POS Ativado
    Exit;
  }

  try
    if not Auditor.SetTabela('TRANSACAO_CARTAO')
      .Processo('FPG032', 'NFCE ' + NFCeAOwer.fstr('cod_nfce'), '')
      .Inserir.Permitido then
      Exit;

    secaoAtual := Self.dataSet.RecordCount + 1;
    valorPendente := IfThen(NFCeAOwer.ffloat('vnf', -2) > Self.ValorTotal, NFCeAOwer.ffloat('vnf', -2) - Self.ValorTotal);

    Result := TNFCe_TransacaoCartao.Create;
    Result.Efetuada := False;                            
    
    if TipoPagamento.fequals('docs', 'N') then
    begin
      payload.operacao := posCRTDIG;
      payload.textoParaUsuario := 'Carteira digital para a NFCe código: ' + NFCeAOwer.fstr('cod_nfce')
    end
    else
    begin
      payload.operacao := posCRT;
      payload.textoParaUsuario := 'Recebimento em cartão para a NFCe código: ' + NFCeAOwer.fstr('cod_nfce');
    end;
    payload.numeroDocumento := NFCeAOwer.fstr('cod_nfce');
    payload.valorOperacao := Valor;
    payload.valorMaximoFP := valorPendente;
    payload.hidePrint := True;
    payload.idCarteiraDigital := TipoPagamento.fstr('tef_id_cartdig');
    payload.idPSP := TipoPagamento.fstr('tef_id_psp');
    {
    if not vDadosIni.operacaoPosVirtual(posCartaoMaisCarteiras, 'Recebimento em cartão para a NFCe código: ' + NFCeAOwer.fstr('cod_nfce'),
      NFCeAOwer.fstr('cod_nfce'), Valor, buscas, valorPendente, False) then
    }
    if not vDadosIni.operacaoPosVirtual(payload, buscas) then
    begin
      Auditor.GravarMensagem('OPERACAO CANCELADA - NFCE ' + NFCeAOwer.fstr('cod_nfce'));
      Exit;
    end;

    if vDadosIni.vPOSV.retorno <> retSucesso then
    begin
      Auditor.GravarMensagem('FALHA - NFCE ' + NFCeAOwer.fstr('cod_nfce'));
      Exit;
    end;

    Result.Efetuada := True;
    Result.ValorPago := vDadosIni.vPOSV.valorOperacao;
    Result.NumAut := vDadosIni.vPOSV.retornoAUT;
    Result.NsuAdm := vDadosIni.vPOSV.retornoNSU;
    Result.Operacao := vDadosIni.vPOSV.debitoCreditoOutros;
    Result.CNPJ := vDadosIni.vPOSV.cnpjAdm;
    Result.BandeiraId := vDadosIni.vPOSV.tband;
    Result.CarteiraId := Trim(vDadosIni.vPOSV.idCarteiraDigital);
    Result.PspId := Trim(vDadosIni.vPOSV.IdPSP);
    Result.ControleId := TipoPagamento.fint('codigo_ctrl');

    if (((Result.PspId <> '') or (Result.CarteiraId <> '')) and TipoPagamento.fdif('docs', 'N')) or
       ((Result.PspId <> '') and TipoPagamento.fdif('tef_id_psp', Result.PspId)) or
       ((Result.CarteiraId <> '') and TipoPagamento.fdif('tef_id_cartdig', Result.CarteiraId)) then
    begin

      if ((Result.PspId <> '') and (TipoPagamento.filterStr('docs = ''N'' and tef_id_psp = ''%s'' '    , [Result.PspId]     ).fint('codigo_ctrl') > 0)) or
         ((Result.CarteiraId <> '') and (TipoPagamento.filterStr('docs = ''N'' and tef_id_cartdig = ''%s'' ', [Result.CarteiraId]).fint('codigo_ctrl') > 0)) then
        Result.ControleId := TipoPagamento.fint('codigo_ctrl')
      else
        Result.ControleId := TipoPagamento.filterStr('docs = ''N'' and codigo_ctrl <> 1').fint('codigo_ctrl');
      TipoPagamento.filterClear;
      TipoPagamento.dataSet.Locate('CODIGO_CTRL', Result.ControleId, []);
    end;

    Result.TransacaoId := vDadosIni.gravaTransacaoPosVirtual(0, 'NFCE', '', NFCeAOwer.fint('cod_nfce'), secaoAtual, TipoPagamento.fint('codigo_ctrl'), buscas);
    buscas.Transaction.Commit;

    Auditor.Key(IntToStr(Result.TransacaoId)).GravarMensagem('SUCESSO- NFCE ' + NFCeAOwer.fstr('cod_nfce') + '-' +
      'AUT:' + Trim(vDadosIni.vPOSV.retornoAUT) + '-NSU:' + Trim(vDadosIni.vPOSV.retornoNSU) +
      '-TERM:' + Trim(terminalAdm) + 'VL.OP:' + Format('0.2f', [vDadosIni.vPOSV.valorOperacao]));
  finally
    Auditor.Tabela := TableName;
  end;
end;

procedure TNFCe_Pagamentos.TransacaoCartaoVerificarRegistros;
var
  cnpj: string;
  trsCartao: TTransacao_cartoes_class;
  trCartao: TTransacao_cartao_class;
  pag: TNfce_pagamento_class;
  I: Integer;
begin
  //removi pois na offline o codigo é diferente do codigo do tsplus
  exit;


  trsCartao := TTransacao_cartoes_class.Create;
  trsCartao.CopyFrom(TTransacao_cartao_class,
                     SqlOpen('select np.cod_nfce, tr.* from transacao_cartao tr' +
                             ' left join nfce_pagamento np on np.cod_nfce = tr.nrequisicao and np.cod_empresa = tr.cod_empresa and tr.status = ''A'' and np.guid_tr_cartao = tr.guidt' +
//                             ' left join nfce_pagamento np on np.cod_nfce = tr.nrequisicao and np.cod_empresa = tr.cod_empresa and tr.status = ''A'' and np.id_tr_cartao = tr.seqid' +
                             ' where tr.tpdocs = ''NFCE'' and tr.nrequisicao = %d and tr.cod_empresa = %d and np.cod_nfce is null',
                            [NFCeAOwer.fint('cod_nfce'), vDadosIni.cod_empresa]));
  for I := 0 to trsCartao.Count - 1 do if (trsCartao.Items[I].seqid > 0) then
  begin
    trCartao := trsCartao.Items[I];

    pag := TNfce_pagamento_class.Create;
    pag.cod_nfce := NFCeAOwer.fint('cod_nfce');
    pag.cod_empresa := NFCeAOwer.fint('cod_empresa');
    pag.indpag := '0';
    if trCartao.id_psp = '' then
      pag.tpag := 17
    else if trCartao.id_cartdig = '' then
      pag.tpag := 18
    else if trCartao.operacao = 'D' then
      pag.tpag := 4
    else
    begin
      pag.tpag := 3;
      pag.indpag := '1';
    end;
    pag.vpag := VarToFloat(trCartao.valor_operacao);
    pag.caut := trCartao.n_aut_cart;
    pag.cod_controle := VarToInt(trCartao.cod_controle);
    pag.tpintegra := '1';
    pag.id_tr_cartao := trCartao.seqid;
    pag.guid_tr_cartao := trCartao.guidt;

    if trCartao.id_cartdig = '' then
    begin
      SqlOpen('select t.cod_term_adm, ar.tband, cl.cpfcgc from terminal_cartao t' +
              ' inner join adm_cartao a on t.cod_adm = a.cod_adm and t.cod_empresa = a.cod_empresa' +
              ' left join adm_cartao_redes ar on a.cod_adm = ar.cod_adm and a.cod_empresa = ar.cod_empresa and ar.rede = %s' +
              ' inner join clientes cl on cl.cod_cliente = a.cod_cliente and cl.cod_empresa = a.cod_empresa' +
              ' where t.cod_term_adm = %s and  t.cod_empresa = %d and t.tipo = ''D'' ',
              [QuotedStr(trCartao.rede), QuotedStr(trCartao.cod_terminal_adm), vDadosIni.cod_empresa]);

      pag.tband := buscas.FieldByName('tband').AsInteger;
      pag.cnpj := buscas.FieldByName('cpfcgc').AsString;
      if VarToInt(pag.tband) <= 0 then
        pag.tband := 99;

      pag.CNPJ := IfThen(Length(pag.CNPJ) <> 14, '', pag.CNPJ);
      if pag.cnpj = '' then
      begin
        try
          TipoPagamento.filterStr('codigo_ctrl = %d', [VarToInt(pag.cod_controle)]);
          pag.cnpj := TipoPagamento.fstr('cpfcgc');
        finally
          TipoPagamento.filterClear;
        end;
      end;
    end;

    with pag.SQLMotor('seqid') do
      SqlExec(SQLInsertAutoInc).Transaction.Commit;
  end;

  if trsCartao.Count > 0 then
    Self.dataSet.Refresh;
end;

{ TNFCe_PagamentosForma }

procedure TNFCe_PagamentosForma.AbreRegistros(ModoSimplificado: Boolean);
begin
  ClientOpen('select ''C''||controles.codigo_ctrl ID, controles.codigo_ctrl, controles.nome_ctrl,' +
    ' controles.nfce_tpag, clientes.cpfcgc, controles.cartao_sped, coalesce(controles.qseqperf, 900) qseqperf, controles.nat_ctrl,' +
    ' controles.tp_plano, controles.docs, controles.tef_tipo, controles.tef_id_cartdig, controles.tef_id_psp' +
    ' from controles' +
    ' inner join clientes on clientes.cod_cliente = controles.cartao_sped_part and clientes.cod_empresa = controles.codigo_emp' +
    ' where controles.cxent = ''S'' and controles.codigo_emp = ' + vDadosIni.codEmpresa + ' and controles.nfce_tpag not in(14)' +
    ' and controles.cartao_sped in (1, 2)' +
    ' union' +
    ' select ''C''||controles.codigo_ctrl ID, controles.codigo_ctrl, controles.nome_ctrl,' +
    ' controles.nfce_tpag, '' '' cpfcgc, controles.cartao_sped, coalesce(controles.qseqperf, 900) qseqperf, controles.nat_ctrl,' +
    ' controles.tp_plano, controles.docs, controles.tef_tipo, controles.tef_id_cartdig, controles.tef_id_psp' +
    ' from controles' +
    ' where controles.cxent = ''S'' and controles.codigo_emp = ' + vDadosIni.codEmpresa + ' and controles.nfce_tpag not in(14)' +
    ' and coalesce(controles.cartao_sped,0) not in (1, 2)' +
    ' union' +
    ' select ''N'' || lpad(tpag,2,''0'') id, 0 codigo_ctrl,' +
    '   lpad(tpag,2,''0'') || '' - '' || descricao, tpag, '' '' cpfcgc, 0 cartao_sped, cast((900 + tpag) as integer) qseqperf,' +
    ' ''A'', '' '' TP_PLANO, '' '' docs, 0 tef_tipo, '' '' tef_id_cartdig, '' '' tef_id_psp' +
    ' from sp_nfe_meios_pag where tpag not in (14, 99)' +
    ' order by 7');
end;

procedure TNFCe_PagamentosForma.CalcFields(DataSet: TDataSet);
begin
  dataSet.FieldByName('DISPLAYV2').AsString := fstr('nome_ctrl');
  if (dataSet.RecNo > 0) and (dataSet.RecNo < 10) and (fstr('id')[1] = 'C') then
    dataSet.FieldByName('DISPLAYV2').AsString := Format(' %d : %s', [DataSet.RecNo, fstr('DISPLAYV2')]);
end;

constructor TNFCe_PagamentosForma.create;
begin
  if dtmNFConsumidor = nil then
    dtmNFConsumidor := TdtmNFConsumidor.Create(dtmNFConsumidor);

  dataSet := TClientDataSet(dtmNFConsumidor.cdsCtrlFormPag);
  transacao := TIBTransaction(dtmNFConsumidor.transacao);
  buscas := TIBQuery(dtmNFConsumidor.qrBuscas);

  dataSet.OnCalcFields := CalcFields;
end;

function TNFCe_PagamentosForma.IsTEF: Boolean;
begin
  Result := False;
  if vDadosIni.GetIni('TEF', 'POSVirtual', 'N') <> 'S' then
    Exit;

  Result := (fempty('tef_tipo') and fequals('tp_plano', 'C')) or
            (fequals('tef_tipo', '1')); // 0 = Nenhum/Nao, 1 = Sim (Cartao ou Carteiras digitais)
end;

{ TNFCe_Config }

procedure TNFCe_Config.AbreRegistros;
begin
  dataSet.Cancel;
  montaSelect('select' +
    ' nfce_config.cod_empresa, nfce_config.usar_conf_nfe, nfce_config.cert_arquivopfx, nfce_config.cert_num_serie,' +
    ' nfce_config.cert_senha, nfce_config.csc_id1, nfce_config.csc_token1, nfce_config.csc_id2, nfce_config.csc_token2,' +
    ' nfce_config.ws_uf, nfce_config.ws_tbamb, nfce_config.ws_sinc_assinc, nfce_config.ws_aguardar,' +
    ' nfce_config.ws_tentativas, nfce_config.ws_intervalo, nfce_config.ws_proxy_host, nfce_config.ws_proxy_port,' +
    ' nfce_config.ws_proxy_user, nfce_config.ws_proxy_pass, nfce_config.ws_timeout, nfce_config.ws_visualizar,' +
    ' nfce_config.arq_path_salvar, nfce_config.arq_path_schema, nfce_config.arq_logo_emp, nfce_config.email_smpt_host,' +
    ' nfce_config.email_smtp_porta, nfce_config.email_username, nfce_config.email_password, nfce_config.email_usa_ssl,' +
    ' nfce_config.email_assunto, nfce_config.email_mensagem, nfce_config.tpemis, nfce_config.dhcont, nfce_config.xjust,' +
    ' nfce_config.email_usa_tls, nfce_config.ws_lib_ssl, nfce_config.xjust_auto, nfce_config.cert_dadospfx' +
    ' from nfce_config' +
    ' where nfce_config.cod_empresa = ' + vDadosIni.codEmpresa);
  if dataSet.IsEmpty then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select nfe_numserie_cert, webserv_uf, webserv_ambiente, nfe_logomarca,' +
      ' nfe_logpath, smtp_emp, porta_smtp, login_emp, email_senha, email_usassl, assunto_nfe' +
      ' from empresa' +
      ' where cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    dataSet.Insert;
    dataSet.FieldByName('usar_conf_nfe').AsString    := 'S';
    dataSet.FieldByName('ws_sinc_assinc').AsString   := 'S';
    dataSet.FieldByName('cert_num_serie').AsString   := buscas.FieldByName('nfe_numserie_cert').AsString;
    dataSet.FieldByName('ws_uf').AsString            := buscas.FieldByName('webserv_uf').AsString;
    dataSet.FieldByName('ws_tbamb').AsString         := vDadosIni.IfThen(Copy(buscas.FieldByName('webserv_ambiente').AsString, 1, 1) = 'H', '2', '1');
    dataSet.FieldByName('arq_logo_emp').AsString     := buscas.FieldByName('nfe_logomarca').AsString;
    dataSet.FieldByName('arq_path_salvar').AsString  := buscas.FieldByName('nfe_logpath').AsString;
    dataSet.FieldByName('email_smpt_host').AsString  := buscas.FieldByName('smtp_emp').AsString;
    dataSet.FieldByName('email_smtp_porta').AsString := buscas.FieldByName('porta_smtp').AsString;
    dataSet.FieldByName('email_username').AsString   := buscas.FieldByName('login_emp').AsString;
    dataSet.FieldByName('email_password').AsString   := buscas.FieldByName('email_senha').AsString;
    dataSet.FieldByName('email_usa_ssl').AsString    := buscas.FieldByName('email_usassl').AsString;
    dataSet.FieldByName('email_assunto').AsString    := buscas.FieldByName('assunto_nfe').AsString;

    fdata('ws_lib_ssl').Put(Integer(sslCapicom));
  end
  else
  begin
    dataSet.Edit;
    fdata('ws_lib_ssl').Put(IfThen(fempty('ws_lib_ssl'), Integer(sslCapicom), fint('ws_lib_ssl')));
end;
  fdata('usar_conf_nfe').Put('N');
end;

procedure TNFCe_Config.AtivaDesativarContingencia;
var
  Justificativa: string;
  Mensagem     : string;
begin
  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  Justificativa := dataSet.FieldByName('xjust').AsString;
  if dataSet.FieldByName('tpemis').AsInteger = 1 then
  begin
    Mensagem := 'Justificativa da entrada em contingência';

  if not InputQuery('Ativar/Desativar Contingência', Mensagem, Justificativa) then
    Exit;

  if (Length(Trim(Justificativa)) < 15) or (Length(Trim(Justificativa)) > 256) then
  begin
    Application.MessageBox('Justificativa inválida. Dever conter de 15 a 256 caracteres',
      'Atenção', 0 + 64);
    Exit;
  end;
  end
  else
  begin
    if ShowConfirmacao('Deseja mesmo desativa a contingência off-line?') <> IDYES then
      Exit;
  end;

  if dataSet.FieldByName('tpemis').AsInteger = 1 then
  begin
    dataSet.FieldByName('tpemis').AsInteger := 9;
    dataSet.FieldByName('dhcont').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
    dataSet.FieldByName('xjust').AsString    := Justificativa;
  end
  else
    dataSet.FieldByName('tpemis').AsInteger := 1;
end;

function TNFCe_Config.checkNumSerieCertificadoNFCe: Boolean;
var
  CertNFCe, CertNFeEmp: string;
  Substituir: Boolean;
begin
  Result := True;

  if fempty('CERT_NUM_SERIE') then
    Exit;

  CertNFCe := ReplaceStr(SqlOpen('select CERT_NUM_SERIE from NFCE_CONFIG where cod_empresa = %d',
                                 [fint('cod_empresa')]).FieldByName('CERT_NUM_SERIE').AsString,
                         ' ', '');

  if CertNFCe = ReplaceStr(fstr('CERT_NUM_SERIE'), ' ', '') then
    Exit;

  Substituir := False;

  CertNFeEmp := ReplaceStr(SqlOpen('select NFE_NUMSERIE_CERT from empresa where cod_empresa = %d',
                                   [fint('cod_empresa')]).FieldByName('NFE_NUMSERIE_CERT').AsString,
                           ' ', '');

  if CertNFCe <> CertNFeEmp then
    Exit;

  case ShowConfirmacao('Numero de série do certificado da NFCe igual ao da NFe' + sLineBreak +
                       'Deseja alterar também o número do certificado da NFe?',
                       MB_ICONQUESTION + MB_YESNOCANCEL) of
    ID_CANCEL :
      Result := False;

    ID_YES    :
      begin
        SqlExec('update empresa set NFE_NUMSERIE_CERT = %s where cod_empresa = %d',
            [fstrq('CERT_NUM_SERIE'), fint('cod_empresa')]);
      end;
  end;
end;

constructor TNFCe_Config.create;
begin
  if dtmNFConsumidor = nil then
    dtmNFConsumidor := TdtmNFConsumidor.Create(dtmNFConsumidor);

  dataSet := TClientDataSet(dtmNFConsumidor.cdsNFCe_Config);
  transacao := TIBTransaction(dtmNFConsumidor.transacao);
  buscas := TIBQuery(dtmNFConsumidor.qrBuscas);

  dataSet.FieldByName('cert_dadospfx').OnGetText := dataSetGetText;

end;

procedure TNFCe_Config.dataSetGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.FieldName = 'CERT_DADOSPFX' then
    Text := fstr('CERT_DADOSPFX');
end;

destructor TNFCe_Config.Destroy;
begin
  inherited;
end;

procedure TNFCe_Config.ObterDadosPFX;
var
  DadosPFX: string;
begin
  if DLLNFC = nil then
    DLLNFC         := TNFCe_DLL.create;

  DLLNFC.LoadDLL;
  DadosPFX := DLLNFC.nfce_cert_obterdadospfx(fstr('cert_arquivopfx'));

  if (Trim(DadosPFX) <> '') and (DadosPFX <> fstr('cert_dadospfx')) then
    fdata('cert_dadospfx').Put(DadosPFX);
end;

function TNFCe_Config.post: boolean;
var
  acao: string;
  DadosPFX: string;
begin
  try

    Result := false;
//    acao := vDadosIni.IfThen(dataSet.State = dsInsert, 'INSERIR', 'EDITAR');

//    if not vDadosIni.PesqPros('NFC005', acao, 'EMISSOR ' + dataSet.FieldByName('NOME_EMISSOR').AsString,
//      'NFC_EMISSOR', dataSet.FieldByName('COD_EMISSOR').AsString) then
//      exit;

    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := True;
      exit;
    end;

    if dataSet.FieldByName('usar_conf_nfe').AsString <> 'S' then
    begin
      if not str_empty('cert_arquivopfx') then
      begin
        if not FileExists(fstr('cert_arquivopfx'))  then
          if ShowConfirmacao('Arquivo do certificado digital inacessivel. Continuar mesmo assim?',
            MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
            raiseExceptionCreate('Arquivo do certificado digital inacessivel');
        checkFieldEmpty('cert_senha', 'Senha do certificado precisa ser preenchida quando informado arquivo PFX', 'DBEdit2')
      end
      else if not str_empty('cert_dadospfx') then
        checkFieldEmpty('cert_senha', 'Senha do certificado precisa ser preenchida quando informado Dados PFX', 'DBEdit2')
      else if not str_empty('cert_senha') then
        checkFieldEmpty('cert_arquivopfx', 'Arquivo PFX precisa ser informado quando informado a senha', 'DBEdit2');
    end;

    checkFieldEmpty('csc_id1', 'ID do Token 1 não informado', 'DBEdit2');
    checkFieldEmpty('csc_token1', 'Token 1 não informado', 'DBEdit2');
    if dataSet.FieldByName('usar_conf_nfe').AsString <> 'S' then
    begin
      checkFieldEmpty('ws_uf', 'UF do WebService precisa ser preenchida', 'DBEdit2');
      checkFieldEmpty('ws_tbamb', 'Tipo de ambiente precisa ser preenchido', 'DBEdit2');
      checkFieldEmpty('ws_sinc_assinc', 'Tipo de Envio precisa ser preenchido', 'DBEdit3');
    end;

    if dataSet.FieldByName('WS_AGUARDAR').AsInteger > 0 then
    begin // auguardar em segundos, maximo de 5s
      if dataSet.FieldByName('WS_AGUARDAR').AsInteger > 5 then
        dataSet.FieldByName('WS_AGUARDAR').AsInteger := 5;
    end
    else
      dataSet.FieldByName('WS_AGUARDAR').Value := Null;

    if dataSet.FieldByName('WS_TENTATIVAS').AsInteger > 0 then
    begin // maximo de tentativas 5
      if dataSet.FieldByName('WS_TENTATIVAS').AsInteger > 5 then
        dataSet.FieldByName('WS_TENTATIVAS').AsInteger := 5;
    end
    else
      dataSet.FieldByName('WS_TENTATIVAS').Value := Null;

    if dataSet.FieldByName('WS_INTERVALO').AsInteger > 0 then
    begin // intervalo entre tentativas de no maximo 5s
      if dataSet.FieldByName('WS_INTERVALO').AsInteger > 5 then
        dataSet.FieldByName('WS_INTERVALO').AsInteger := 5;
    end
    else
      dataSet.FieldByName('WS_INTERVALO').Value := Null;
    
    if not fempty('xjust_auto') then
      if (fdata('xjust_auto').Length < 15) or (fdata('xjust_auto').Length > 256) then
        raiseExceptionCreate('Justificativa automatica de entrada em contingência inválida. Dever conter de 15 a 256 caracteres');

    if dataSet.State = dsInsert then
      dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);


    if not str_empty('cert_arquivopfx') then
      if FileExists(fstr('cert_arquivopfx')) then
      begin
        if DLLNFC = nil then
          DLLNFC         := TNFCe_DLL.create;

        DLLNFC.LoadDLL;  
        DadosPFX := DLLNFC.nfce_cert_obterdadospfx(fstr('cert_arquivopfx'));

        if (Trim(DadosPFX) <> '') and (DadosPFX <> fstr('cert_dadospfx')) then
          fdata('cert_dadospfx').Put(DadosPFX);
      end
      else if ShowConfirmacao('Arquivo do certificado digital inacessivel. Continuar mesmo assim?',
        MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
        raiseExceptionCreate('Arquivo do certificado digital inacessivel')
      else
        Exit;

    if not checkNumSerieCertificadoNFCe then
      Exit;

    dataSet.Post;

    if (dataSet.ChangeCount = 0) then
    begin
      Result := True;
      exit;
    end;

    Result := Apply;

    if not Result then
      Exit;

    CommitaTransacao;

//    vDadosIni.GravaAuditoria('NFC005', acao, 'SUCESSO', 'NFC_EMISSOR', '', buscas);

    Refresh;
  except
    on E: Exception do
    begin
      Result := false;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro ao salvar registro. Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('TNFCe_Config.post Erro: ' + e.Message);
    end;
  end;

end;

{ TNFCe_DLL }

constructor TNFCe_DLL.create;
begin
  fHandleDLL := 0;
end;

destructor TNFCe_DLL.Destroy;
begin
  freeDLL;
end;

procedure TNFCe_DLL.FreeDLL;
begin
  if fHandleDLL <> 0 then
  begin
    try
      Fnfce_client_free;
    except
    end;
    FreeLibrary(fHandleDLL);
  end;
end;

function TNFCe_DLL.LoadDLL: Boolean;
begin
  try
    if fHandleDLL > 0 then
      Exit;

    if fHandleDLL = 0 then
      fHandleDLL := LoadLibrary(Pchar('hw.nfe.dx.dll'));//fHandleDLL := LoadLibrary(Pchar('HWNFC.dll'));

    if fHandleDLL = 0 then
      Exit;

    @Fnfce_client_free                  := GetProcAddress(fHandleDLL, PChar('nfce_client_free'));
    @Fnfce_client_retorna_ultimo_erro   := GetProcAddress(fHandleDLL, PChar('nfce_client_retorna_ultimo_erro'));
    @Fnfce_client_autorizar             := GetProcAddress(fHandleDLL, PChar('nfce_client_autorizar'));
    @Fnfce_client_enviar                := GetProcAddress(fHandleDLL, PChar('nfce_client_enviar'));
    @Fnfce_client_enviar_contingencias  := GetProcAddress(fHandleDLL, PChar('nfce_client_enviar_contingencias'));
    @Fnfce_client_cancelar              := GetProcAddress(fHandleDLL, PChar('nfce_client_cancelar'));
    @Fnfce_client_inutilizar            := GetProcAddress(fHandleDLL, PChar('nfce_client_inutilizar'));
    @Fnfce_client_enviar_email          := GetProcAddress(fHandleDLL, PChar('nfce_client_enviar_email'));
    @Fnfce_client_enviar_email_lote     := GetProcAddress(fHandleDLL, PChar('nfce_client_enviar_email_lote'));
    @Fnfce_client_gerar_contingencia    := GetProcAddress(fHandleDLL, PChar('nfce_client_gerar_contingencia'));
    @Fnfce_client_imprimir_inutilizacao := GetProcAddress(fHandleDLL, PChar('nfce_client_imprimir_inutilizacao'));
    @Fnfce_client_imprimir_danfe        := GetProcAddress(fHandleDLL, PChar('nfce_client_imprimir_danfe'));
    @Fnfce_cert_obterdadospfx           := GetProcAddress(fHandleDLL, PChar('nfce_cert_obterdadospfx'));
    @Fnfce_print_list                   := GetProcAddress(fHandleDLL, PChar('nfce_print_list'));
    @nfce_abrir_gaveta                  := GetProcAddress(fHandleDLL, PChar('nfce_abrir_gaveta'));
    @dfe_dados_certificado              := GetProcAddress(fHandleDLL, PChar('dfe_dados_certificado'));
    Result := True;
  finally
    Result := fHandleDLL > 0;
  end;
end;

{ TNFCe_Dest }

procedure TNFCe_Dest.AbreRegistros;
begin
  montaSelect('select ' + FCampos + ' from nfce_dest' +
    ' where nfce_dest.cod_nfce = ' + IntToStr(NFCeAOwer.dataSet.FieldByName('cod_nfce').AsInteger) +
    ' and nfce_dest.cod_empresa = ' + IntToStr(NFCeAOwer.dataSet.FieldByName('cod_empresa').AsInteger));
end;

function TNFCe_Dest.ConsultaCEP(Cep: string): TDataSet_OOP;
type
  TBuscarCEPWebService = function(Cep: PChar; CaminhoBanco: PChar): boolean; stdcall;
  Tws_cep_lasterror = procedure(var error: PChar); stdcall;

  function ConsultaWS: Boolean;
  var
    HandleCEP: THandle;
    BuscarCEP: TBuscarCEPWebService;
    ws_cep_lasterror: Tws_cep_lasterror;
    error: string;
    err: PChar;
  begin
    HandleCEP := 0;

    
    if hw_cep_consultar(vDadosIni.vBancoHW, Cep) then
    begin
      Result := True;
      Exit;
    end
    else
      error := hw_utils_lasterror;

    HandleCEP := LoadLibrary('WebServiceCEP.dll');
    Result    := False;
    try
      try
        if HandleCEP <> 0 then
        begin
          @BuscarCEP := GetProcAddress(HandleCEP, '_ConsultarWebService');  
          @ws_cep_lasterror := GetProcAddress(HandleCEP, 'ws_cep_lasterror');
        end;

        if BuscarCEP(Pchar(cep), Pchar(vDadosIni.vBancoHW)) then
        begin
          Result := True;
          Exit;
        end
        else
        begin
          ws_cep_lasterror(err);
          error := error + sLineBreak + sLineBreak + 'Serv Dev(old)' + string(err);
        end;  

        if ShowConfirmacao('Consulta CEP falhou, Verifique sua conexão com a Internet e repita a operação' + sLineBreak +
                           'Deseja ver mais detalhes do erro?', MB_YESNO + MB_ICONQUESTION) = ID_YES then
          ShowErro(error);

      except on E: Exception do
        begin
          raiseExceptionCreate('Erro na consulta do cep %s', [e.Message]);
        end;
      end;
    finally
      if HandleCEP <> 0 then
        FreeLibrary(HandleCEP);
    end;
  end;

var
  Sql: string;
begin
  Result := TDataSet_OOP.Create(buscas.Database);

  Cep := OnlyNumber(Cep);
  try
    if Length(Cep) <> 8 then
      raiseExceptionCreate('CEP inválido');

    Sql := 'select first 1 c.cod_correios cep, c.endereco xlgr, c.bairro xbairro, ci.ibge_cod_cidade cmun,' +
           ' coalesce(cg.nome_municipio, c.cidade) xmun, e.sigla_uf uf' +
           ' from cep c' +
           ' left join cidades ci on ci.cod_cidade = c.cod_cidade' +
           ' left join cidades_ibge cg on cg.codigo_mun_ibge = ci.ibge_cod_cidade' +
           ' left join estados e on e.codigo_uf = c.cod_estado' +
           ' where c.cod_correios = ' + QuotedStr(Cep);

    Result.montaSelect(Sql);
    if Result.IsEmpty then
      if ConsultaWS then
        Result.montaSelect(Sql);

  except on E: Exception do
    begin
      vMensagemErro := E.Message;
      if not NFCeAOwer.EmissaoRapida then
        ShowErro(vMensagemErro);
    end;
  end;
end;

constructor TNFCe_Dest.create(AOwer: TNFCe);
begin
  if dtmNFConsumidor = nil then
    dtmNFConsumidor := TdtmNFConsumidor.Create(dtmNFConsumidor);

  dataSet := TClientDataSet(dtmNFConsumidor.cdsNFCe_Dest);
  transacao := TIBTransaction(dtmNFConsumidor.transacao);
  buscas := TIBQuery(dtmNFConsumidor.qrBuscas);

  if AOwer = nil then
    raiseExceptionCreate('NFCeAOwer não referenciado', '');

  FlkCidades := TDadosLookUp_OOP.create;

  NFCeAOwer := TNFCe(AOwer);

  FCampos :=
    'nfce_dest.cod_nfce, nfce_dest.cod_empresa, nfce_dest.cnpjcpf, nfce_dest.xnome,' +
    ' nfce_dest.email, nfce_dest.xlgr, nfce_dest.nro, nfce_dest.xcpl, nfce_dest.xbairro,' +
    ' nfce_dest.cmun, nfce_dest.xmun, nfce_dest.uf, nfce_dest.cep, nfce_dest.fone';
end;

function TNFCe_Dest.delete: boolean;
begin
  Result := False;
  if not dataSet.IsEmpty then
    if inherited Delete then
      if Apply then
      begin
        NFCeAOwer.dataSet.FieldByName('cod_cliente').Value := Null; 
        Result := NFCeAOwer.SalvarECalcular(False);
      end;
end;

destructor TNFCe_Dest.Destroy;
begin
  if Assigned(FlkCidades) then
    FreeAndNil(FlkCidades);
  inherited;
end;

function TNFCe_Dest.insert: boolean;
begin
  Result := False;

  if not NFCeAOwer.SetCodigoInterno then
    raiseExceptionCreate('Cliente destinatário não pode ser definido por problemas ao gerar código interno da NFC-e: TNFCe_Dest.insert', '');

  if (not dataSet.Active) or
    (dataSet.FieldByName('cod_nfce').AsInteger <> NFCeAOwer.dataSet.FieldByName('cod_nfce').AsInteger) then
    AbreRegistros;

  result := inherited insert;

  if Result then
  begin
    dataSet.FieldByName('cod_nfce').AsInteger := NFCeAOwer.dataSet.FieldByName('cod_nfce').AsInteger;
    dataSet.FieldByName('cod_empresa').AsInteger := NFCeAOwer.dataSet.FieldByName('cod_empresa').AsInteger;
  end;
end;

function TNFCe_Dest.post: boolean;
var
  End_Vazios, End_Preenchidos: Boolean;
  Des_Vazios, Des_Preenchidos: Boolean;
begin
  Result := False;
  if not (dataSet.State in [dsInsert, dsEdit]) then
    Exit;

  try

    Des_Vazios      := fempty('cnpjcpf') and
                       fempty('xnome') and
                       fempty('email') and
                       fempty('fone');

    Des_Preenchidos := (not fempty('cnpjcpf')) or
                       (not fempty('xnome')) or
                       (not fempty('email')) or
                       (not fempty('fone'));

    if Des_Preenchidos then
      checkFieldEmpty('cnpjcpf', 'CPF ou CNPJ deve precisa ser preenchido');

    End_Vazios      := fempty('cep') and
                       fempty('xlgr') and
                       fempty('nro') and
                       fempty('xbairro') and
                       fempty('uf') and
                       (fint('cmun') <= 0);

    End_Preenchidos := (not fempty('cep')) or
                       (not fempty('xlgr')) or
                       (not fempty('nro')) or
                       (not fempty('xbairro')) or
                       (not fempty('xmun')) or
                       (fint('cmun') > 0);

    if fint('cmun') > 0 then
      fdata('xmun').Put(SqlOpen('select nome_municipio xmun from cidades_ibge where codigo_mun_ibge = %d', [fint('cmun')]).FieldByName('xmun').AsString);

    if End_Preenchidos then
    begin
      checkFieldEmpty('xlgr'   , 'Logradouro precisa ser preenchido');
      checkFieldEmpty('nro'    , 'Número precisa ser preenchido');
      checkFieldEmpty('xbairro', 'Bairro precisa ser preenchido');
      checkFieldEmpty('xmun'   , 'Cidade precisa ser preenchida');
      checkFieldEmpty('cmun'   , 'Cidade precisa ser preenchida');
      checkFieldEmpty('uf'     , 'UF precisa ser preenchida');
    end;

    if Des_Vazios and End_Vazios then
    begin
      dataSet.Cancel;

  if not dataSet.IsEmpty then
        Result := Delete
      else
        Result := True;
      Exit;
    end;

    if inherited Post then
      if Apply then
        Result := NFCeAOwer.SalvarECalcular(False);

    if not Result then
      vMensagemErro := 'NFCe-Dest: Erro não catalogado';

  except on E: Exception do
    begin
      registraErro('TNFCe_Dest.post %s', [vMensagemErro]);
      if not NFCeAOwer.EmissaoRapida then
        ShowErro(vMensagemErro);
end;
  end;
end;

{ TNFC_Clientes }

function TNFC_Clientes.Consultar(Opcao: Integer; Value: string): TNFC_Clientes;
begin  //Opcao 1: Nom; 2: Razao; 3: CPFCNPJ
  Result := Self;

  montaSelect('select cl.cod_cliente "Id", cpfcgc "CPF/CNPJ", cl.nome_cliente "Nome", cl.razao "Razao",' +
              ' cl.endereco' +
              ' || iif(Trim(cl.num_end_cliente) <> '''', '', ''||Trim(cl.num_end_cliente), '''')' +
              ' || iif(Trim(cl.complemento) <> '''', '' ''||Trim(cl.complemento), '''')' +
              ' || iif(Trim(cl.bairro) <> '''', '' - ''||Trim(cl.bairro), '''')' +
              ' || iif(Trim(cl.cidade) <> '''', '' - ''||Trim(cl.cidade), '''')' +
              ' || iif(Trim(cl.cep) <> '''', '' - ''||Trim(cl.cep), '''')' +
              ' || iif(Trim(es.sigla_uf) <> '''', '' - ''||Trim(es.sigla_uf), '''') "Endereco",' +
              ' cl.fone_cliente "Fone", cl.fone_celular "Celular", cl.email "email"' +
              ' from clientes cl' +
              ' left join estados es on es.codigo_uf = cl.codigo_uf' +
              ' where cl.cod_empresa = %d and cl.ativo = 1 and' +
              ' cl.%s %s %s',
              [vDadosIni.cod_empresa,
               IfThen(Opcao = 1, 'nome_cliente') + IfThen(Opcao = 2, 'razao') + IfThen(Opcao = 3, 'cpfcgc') ,
               IfThen(Opcao = 3, '=', 'like'),
               QuotedStr(IfThen(Opcao = 3, Value, '%' + Value + '%'))]);
end;

{ TNFCe_Status_Servico }

function TNFCe_Status_Servico.AbreRegistros(Args: TStatusServs; Apage: Integer): TNFCe_Status_Servico;
var
  Service: TStatusServ;
  servico, Sql: string;
  Skip: Integer;
begin
  Result := Self;
  FPage := Apage;

  Sql := '';
  for Service in Args do
  begin
    servico := '';
    case Service of
      tsCancelamento   : servico := 'Cancelamento';
      tsInutilizacao   : servico := 'Inutilizacao';
      tsAutorizacao    : servico := 'Autorizacao';
      tsConsulta       : servico := 'Consulta';
      tsStsatusServico : servico := 'StatusServico';
    end;
    if servico <> '' then
      Sql := Sql + IfThen(Sql <> '', ',') + QuotedStr(servico);    
  end;
  if Sql <> '' then
    Sql := Format(' and nss.servico in (%s)', [Sql]);

  Skip := Apage * Limit;

  montaSelect('select first %d skip %d nss.datahora, ne.NOME_EMISSOR, nss.servico, nss.mensagem, nss.status' +
              ' from nfce_status_servico nss' +
              ' left join nfc_emissor ne on ne.cod_emissor = nss.cod_emissor and ne.cod_empresa = nss.cod_empresa' +
              ' where nss.cod_empresa = %d' + Sql + 
              ' order by nss.datahora desc', [Limit, skip, vDadosIni.cod_empresa]);
end;

constructor TNFCe_Status_Servico.Create;
begin
  inherited Create(dtmAtivo.bancoHw);
  Limit := 30;
  dataSet.AfterOpen := dataSetAfterOpen;
end;

procedure TNFCe_Status_Servico.dataSetAfterOpen(DataSet: TDataSet);
begin
  if Assigned(DataSet.FieldByName('status').OnGetText) then
    Exit;

  DataSet.FieldByName('status').OnGetText := dataSetGetText;
  DataSet.FieldByName('status').Alignment := taCenter;
end;

procedure TNFCe_Status_Servico.dataSetGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.FieldName = 'STATUS' then
    Text := IfThen(Sender.AsString = '1', 'Sucesso', 'Falha');
end;

{ TNFCe_SangSup }

constructor TNFCe_SangSup.Create;
begin
  inherited Create(dtmAtivo.bancoHw);
//  Limit := 30;
//  dataSet.AfterOpen := dataSetAfterOpen;
end;

function TNFCe_SangSup.Inserir(Valor: Double; Operacao: TSangSup;
  var Msg: string): Boolean;
begin
  Result := False;
  try
    if Valor <= 0 then
      raiseExceptionCreate('Valor deve ser maior que zero');

    MovOperador.GetDiaAtualDoEmissor;
    if (MovOperador.dataSet.IsEmpty) or (not MovOperador.dataSet.FieldByName('dia_fech').IsNull) then
      raiseExceptionCreate('DIA DE MOVIMENTO FECHADO !');

    if MovOperador.fint('operador') <> vDadosIni.vCodUsuario then
      raiseExceptionCreate('CAIXA COM MOVIMENTO ABERTO PARA OUTRO USUÁRIO');

    Msg := IfThen(Operacao = ssSangria, 'Sangria', 'Suprimento');
    if Operacao = ssSangria then
      Valor := 0 - Valor;

    with SqlExec('insert into NFCE_MOVIMENTO_LANC (mov_id, cod_empresa, valor, historico)' +
                 ' values (%d, %d, %s, %s)',
                 [MovOperador.fint('id'), vDadosIni.cod_empresa, ffloat_fb(Valor), QuotedStr(Msg)]).Transaction do
      if InTransaction then
        Commit;

    if not Assigned(DLLNFC) then
      DLLNFC := TNFCe_DLL.create;

    DLLNFC.LoadDLL;

    LerConfigNFCe;
    if ConfigNFCe.AgentValid then
    begin
      if not cloud_agente_open_drawer(WideString(ConfigNFCe.GetAgentPrintParams)) then
       ShowAtencao(string(cloud_agente_last_error))
    end
    else
    begin
      DLLNFC.nfce_abrir_gaveta(WideString(ConfigNFCe.GetDefaultPrintParams));
    end;

    Msg := Msg + ' ' + Format('%0.2n', [Abs(Valor)]);

    Result := True;
  except on E: Exception do
    begin
      Msg := e.Message;
      vDadosIni.registraErro('TNFCe_SangSup.Inserir ' + E.Message );
      NFCe.SetLastMessage(Msg);
    end;
  end;
end;

{ TNFCe_MovimentoOperador }

function TNFCe_MovimentoOperador.AbrirDia: Boolean;
begin
  Result := False;

  try
    GetDiaAtualDoEmissor;

    if vDadosIni.vNFConsumidor.CodEmissor = 0 then
      FLastMessage := 'Caixa(Emissor) não configurado !!!'
    else if (GetDiaEstaAberto) then
    begin
      if fint('operador') <> vDadosIni.vCodUsuario then
        FLastMessage := 'Dia já está aberto para outro Operador !!!'
      else
        FLastMessage := 'Dia já está aberto !!!';
    end
    else
    begin
      if not SqlOpen('select operador, id, cod_emissor, dia_mov from nfce_movimento' +
                     ' where cod_empresa = %d and operador = %d and dia_fech is null',
                     [vDadosIni.cod_empresa, vDadosIni.vCodUsuario]).IsEmpty then
      begin
        FLastMessage := Format('Operador %s com dia %s já aberto. Caixa: %s',
                               [PadL(buscas.FieldByName('operador').AsInteger, 3),
                                FormatDateTime('dd/MM/yyyy', buscas.FieldByName('dia_mov').AsDateTime),
                                PadL(buscas.FieldByName('cod_emissor').AsInteger, 3)]);
        Exit;
      end;

      if ShowConfirmacao('Deseja abrir o dia?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
        Exit;

      SqlExec('insert into NFCE_MOVIMENTO (cod_empresa, dia_mov, cod_emissor, operador)' +
              ' values (%d, %s, %d, %d)',
              [vDadosIni.cod_empresa, vDadosIni.FusoSqlDate, vDadosIni.vNFConsumidor.CodEmissor, vDadosIni.vCodUsuario]);
      GetDiaAtualDoEmissor;

      if fint('operador') <> vDadosIni.vCodUsuario then
        FLastMessage := 'Dia não foi aberto para o Operador !!!'
      else if fint('cod_emissor') <> vDadosIni.vNFConsumidor.CodEmissor then
        FLastMessage := 'Dia não foi aberto para o Caixa !!!'
      else if not fnull('dia_fech') then
        FLastMessage := 'Dia não foi aberto !!!'
      else if dataSet.IsEmpty then
        FLastMessage := 'Dia não foi aberto !!!*'
      else
      begin
        if buscas.Transaction.InTransaction then
          buscas.Transaction.Commit;
        Result := True;
        dataSet.Refresh;
      end;

      if not Result then
        if buscas.Transaction.InTransaction then
          buscas.Transaction.Rollback;
      
    end;
  except on E: Exception do
    begin
      RollBackTransacao;
      FLastMessage := 'Erro ao abrir dia' + E.Message;
    end;
  end;
end;

function TNFCe_MovimentoOperador.ClientContadores: TDataSet_OOP;
var
  Sql: string;
begin
  Result := TDataSet_OOP.Create(dtmAtivo.bancoHw);
  Sql := Format('select mov.id, mov.cod_empresa, mov.count_sangria, mov.count_suprimento, mov.vsangria, mov.vsuprimento,' +
                '   sum(iif(nfce.situacao_nfce = ''%s'', 1, 0)) count_autorizadas,' +
                '   sum(iif(nfce.situacao_nfce = ''%s'', 1, 0)) count_canceladas,' +
                '   sum(iif(nfce.situacao_nfce = ''%s'', 1, 0)) count_inutilizadas,' +
                '   sum(iif(nfce.situacao_nfce = ''%s'', 1, 0)) count_denegadas,' +
                '   sum(iif(nfce.tpemis = 9, 1, 0)) count_contingencias,' +
                '   sum(iif(nfce.situacao_nfce in (''%s'', ''%s'', ''%s''), 1, 0)) count_enviando,' +
                '   sum(iif(nfce.situacao_nfce = ''%s'', 1, 0)) count_pendente,' +
                '   sum(iif(nfce.situacao_nfce = ''Autorizada'', coalesce(nfce.vprod , 0), 0)) vprod,' +
                '   sum(iif(nfce.situacao_nfce = ''Autorizada'', coalesce(nfce.vdesc , 0), 0)) vdesc,' +
                '   sum(iif(nfce.situacao_nfce = ''Autorizada'', coalesce(nfce.vfrete, 0), 0)) vfrete,' +
                '   sum(iif(nfce.situacao_nfce = ''Autorizada'', coalesce(nfce.vseg  , 0), 0)) vseg,' +
                '   sum(iif(nfce.situacao_nfce = ''Autorizada'', coalesce(nfce.voutro, 0), 0)) voutro,' +
                '   sum(iif(nfce.situacao_nfce = ''Autorizada'', coalesce(nfce.vnf   , 0), 0)) vnf,' +
                '   sum(iif(nfce.situacao_nfce = ''Autorizada'', coalesce(nfce.vtroco, 0), 0)) vtroco' +
                '   from (' +
                '     select mv.id, mv.cod_empresa,' +
                '       sum(iif(mv.tipo = ''Sangria'', 1, 0)) count_sangria,' +
                '       sum(iif(mv.tipo = ''Suprimento'', 1, 0)) count_suprimento,' +
                '       sum(iif(mv.tipo = ''Sangria'', mv.vpag, 0)) vsangria,' +
                '       sum(iif(mv.tipo = ''Suprimento'', mv.vpag, 0)) vsuprimento' +
                '       from vw_nfce_movimento mv' +
                '     where mv.id = %d and mv.cod_empresa = %d' +
                '       group by 1, 2' +
                '   ) as mov' +
                ' left join nfce on nfce.mov_id = mov.id and nfce.cod_empresa = mov.cod_empresa' +
                '   group by 1,2,3,4,5,6',
                [sitAutorizada, sitCancelada, sitInutilizada, sitDenegada,
                 sitEnviando, sitEmProcessamento, sitRejeitada,
                 sitVazio,
                 fint('id'), vDadosIni.cod_empresa]) +
                ' %s ';

  try
    Result.ClientOpen(Sql, [FPlanoConsulta])
  except
    Result.ClientOpen(Sql, ['']);
  end;
end;

function TNFCe_MovimentoOperador.ClientMeiosPag: TDataSet_OOP;
var
  Sql: string;
begin
  Result := TDataSet_OOP.Create(dtmAtivo.bancoHw);
  Sql := Format('select mv.cod_controle, mv.tpag, coalesce(mv.nome_ctrl, mv.xpag) nome_ctrl, mv.xpag, sum(mv.vpag) vpag' +
                ' from vw_nfce_movimento mv' +
                ' where mv.id = %d and mv.cod_empresa = %d and mv.vpag <> 0' +
                ' and coalesce(mv.situacao_nfce, '''') not in (%s, %s, %s)' +
                ' group by 1,2,3,4',
                [fint('id'), vDadosIni.cod_empresa, QuotedStr(sitCancelada),
                 QuotedStr(sitInutilizada), QuotedStr(sitDenegada)]) +
                ' %s order by mv.tpag';

  try
    Result.ClientOpen(Sql, [FPlanoConsulta])
  except
    Result.ClientOpen(Sql, ['']);
  end;
end;

constructor TNFCe_MovimentoOperador.Create;
begin
  inherited Create(dtmAtivo.bancoHw);
  FPlanoConsulta := 'PLAN JOIN (JOIN (JOIN (MV MOV INDEX (PK_NFCE_MOVIMENTO), MV NFC INDEX (FK_NFCE_MOVIMENTO), MV PAG INDEX (FK_NFCE_PAGAMENTO))), MV CTRL INDEX (PK_CONTROLES))';
  Limit          := 30;
  TableName      := 'NFCE_MOVIMENTO';
end;

function TNFCe_MovimentoOperador.FecharDia(Id: Integer; CheckOperador: Boolean): Boolean;
begin
  Result := False;

  try
    GetDiaDoEmissor(Id);

    try
      if dataSet.IsEmpty then
        FLastMessage := 'SEM DIA PARA FECHAR !!!'
      else if (not DiaEstaAberto) then
        FLastMessage := 'SEM DIA ABERTO !!!'
      else if (fint('operador') <> vDadosIni.vCodUsuario) and (CheckOperador) then
        FLastMessage := 'DIA ESTA ABERTO PARA OUTRO USUÁRIO !!!'
      else
      begin

        if ShowConfirmacao('Deseja Fechar o dia?', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
          Exit;

        Id := fint('id');

        SqlExec('update NFCE_MOVIMENTO set dia_fech = ' + vDadosIni.FusoSqlDate +
                ' where id = %d and cod_empresa = %d',
                [fint('id'), fint('cod_empresa')]);

        GetDiaDoEmissor(Id);


          if fnull('dia_fech') then
            FLastMessage := 'DIA NÃO FOI FECHADO PARA O CAIXA'
          else
          begin
            if buscas.Transaction.InTransaction then
              buscas.Transaction.Commit;
            Result := True;
            dataSet.Refresh;
          end;

          if not Result then
            if buscas.Transaction.InTransaction then
              buscas.Transaction.Rollback;
      end;

    finally
      if CheckOperador then
        GetDiaAtualDoEmissor
      else
        dataSet.Refresh;
    end;

  except on E: Exception do
    begin
      RollBackTransacao;
      FLastMessage := 'Erro ao abrir dia' + E.Message;
    end;
  end;
end;

function TNFCe_MovimentoOperador.GetDiaDoEmissor(Operador, Caixa,
  APage: Integer): TNFCe_MovimentoOperador;
var
  Sql: string;
  Skip: Integer;
begin
  Result := Self;
  FPage  := Apage;

  Sql := IfThen(Operador <> 0, Format(' and mov.operador = %d', [Operador]));
  Sql := Sql + IfThen(Caixa <> 0, Format(' and mov.cod_emissor = %d', [Caixa]));

  Skip := Apage * Limit;

  montaSelect('select first %d skip %d mov.*, col.nome_vendedor nome_operador, cast(' + vDadosIni.FusoDateTimeFb + ' as timestamp) datahora' +
              ' from nfce_movimento mov' +
              ' left join colaborador col on col.cod_vendedor = mov.operador and col.cod_empresa = mov.cod_empresa' +
              ' where mov.cod_empresa = %d %s order by mov.dia_mov desc, mov.id desc',
              [Limit, Skip, vDadosIni.cod_empresa, Sql]);
end;

function TNFCe_MovimentoOperador.GetDiaAtualDoEmissor: TNFCe_MovimentoOperador;
begin
  Result := Self;
  montaSelect('select first 1 mov.*, col.nome_vendedor nome_operador, cast(' + vDadosIni.FusoDateTimeFb + ' as timestamp) datahora' +
              ' from nfce_movimento mov' +
              ' left join colaborador col on col.cod_vendedor = mov.operador and col.cod_empresa = mov.cod_empresa' +
              ' where mov.cod_empresa = %d and mov.cod_emissor = %d order by mov.id desc',
              [vDadosIni.cod_empresa, vDadosIni.vNFConsumidor.CodEmissor]);

  if Assigned(FonGetDiaMovimento) then
    FonGetDiaMovimento(Self);  
end;

function TNFCe_MovimentoOperador.GetDiaDoEmissor(
  Id: Integer): TNFCe_MovimentoOperador;
begin
  Result := Self;
  montaSelect('select first 1 mov.*, col.nome_vendedor nome_operador, cast(' + vDadosIni.FusoDateTimeFb + ' as timestamp) datahora' +
              ' from nfce_movimento mov' +
              ' left join colaborador col on col.cod_vendedor = mov.operador and col.cod_empresa = mov.cod_empresa' +
              ' where mov.id = %d and mov.cod_empresa = %d order by mov.id desc',
              [Id, vDadosIni.cod_empresa]);
end;

function TNFCe_MovimentoOperador.GetDiaEstaAberto: Boolean;
begin
  if not dataSet.Active  then
    GetDiaAtualDoEmissor;

  if dataSet.IsEmpty then
    Result := False
  else
    Result := fnull('dia_fech');
end;

function TNFCe_MovimentoOperador.PermiteEmissao(id_movimento: Integer): Boolean;
begin
  Result := False;
  if id_movimento > 0 then
    GetDiaDoEmissor(id_movimento)
  else
    GetDiaAtualDoEmissor;

  FCod_nfce_liberada := 0;
  FLastMessage       := '';

  if dataSet.IsEmpty then
    FLastMessage := 'SEM DIA DE MOVIMENTO !!!'
  else if not dataSet.FieldByName('dia_fech').IsNull then
    FLastMessage := 'DIA DE MOVIMENTO FECHADO !!'
  else if fint('operador') <> vDadosIni.vCodUsuario then
    FLastMessage := 'CAIXA COM DIA ABERTO PARA OUTRO USUÁRIO'
  else if (vDadosIni.getDataBanco(buscas) <> fdate('dia_mov')) and
          (not Auditor.Validar.Processo('NFC038').Permitido) then
    FLastMessage := 'DIA DE MOVIMENTO DO CAIXA DIFERENTE DO DIA DO DOCUMENTO'
  else
    Result       := True;
end;

function TNFCe_MovimentoOperador.RelatorioDoDia_PrintNaoFiscal: Boolean;
const
  ModeloImpressao = 'MovOperador';
  ModeloMeiosPag  = 'MEIOS_DE_PAGAMENTO';

var
  Conf: TConfig_sistema_class;
  Colunas, ColunasCondensado: Integer;
  Relatorio, MeiosPag, ModelMeiosPag: TStrings;
  I, Resposta: Integer;
  Client: TDataSet_OOP;
  Linha, StrRel, ConfName: string;
  Condensado: Boolean;
  ConfClient: RNFCe;
begin
  Result        := False;
  Conf          := TConfig_sistema_class.getConf('nfc_nfce_rel_mov_operador', buscas, vDadosIni.cod_empresa);
  ModelMeiosPag := TStringList.Create;
  Relatorio     := TStringList.Create;
  try

    Colunas           := StrToIntDef(Conf.ReadString('Conf', 'Colunas'          , '48'), 48);
    ColunasCondensado := StrToIntDef(Conf.ReadString('Conf', 'ColunasCondensado', '56'), 56);
    ConfName          := Conf.ReadString('Conf', 'FileNameCofigPosPrinter', 'PosPrinter');

    Relatorio.Text := Copy(Conf.value1_b.Text,
                           Pos('[*' + ModeloImpressao + '*]', Conf.value1_b.Text),
                           Pos('[*/' + ModeloImpressao + '*]', Conf.value1_b.Text) -
                           Pos('[*' + ModeloImpressao + '*]', Conf.value1_b.Text) + Length(ModeloImpressao) + 5);

    if Relatorio.Text <> '' then
    begin
      if Relatorio.Count > 0 then
        Relatorio.Delete(Relatorio.Count - 1); //linha final
      if Relatorio.Count > 0 then
        Relatorio.Delete(0); //linha inicial
    end;

    ModelMeiosPag.Text := Copy(Conf.value1_b.Text,
                               Pos('[*' + ModeloMeiosPag + '*]', Conf.value1_b.Text),
                               Pos('[*/' + ModeloMeiosPag + '*]', Conf.value1_b.Text) -
                               Pos('[*' + ModeloMeiosPag + '*]', Conf.value1_b.Text) + Length(ModeloMeiosPag) + 5);

    if ModelMeiosPag.Text <> '' then
    begin
      if ModelMeiosPag.Count > 0 then
        ModelMeiosPag.Delete(ModelMeiosPag.Count - 1); //linha final
      if ModelMeiosPag.Count > 0 then
        ModelMeiosPag.Delete(0); //linha inicial
    end;

    MeiosPag := TStringList.Create;
    Client := ClientMeiosPag;
    while not Client.Eof do
    begin
      Linha := StringReplace(ModelMeiosPag.Text, sLineBreak, '', [rfReplaceAll]);
      Replace(Linha, 'cod_controle', PadL(Client.fint('cod_controle'), 3));
      Replace(Linha, 'tpag'        , PadL(Client.fint('tpag'), 2));
      Replace(Linha, 'nome_ctrl'   , Client.fstr('nome_ctrl'));
      Replace(Linha, 'xpag'        , Client.fstr('xpag'));
      Replace(Linha, 'vpag'        , StrNumber(Client.ffloat('vpag')));

      MeiosPag.Add(Linha);
      Client.Next;
    end;
    FreeAndNil(Client);

    StrRel := Relatorio.Text;
    Replace(StrRel, '[EMPRESA.CODIGO]'      , PadL(vDadosIni.cod_empresa, 3));
    Replace(StrRel, '[EMPRESA.NOME]'       , vDadosIni.vEmp.vnomeEmpresa);
    Replace(StrRel, '[EMPRESA.CNPJ]'       , FormatMaskText('00.000.000/0000-00;0;_', vDadosIni.vEmp.vCNPJ));
    Replace(StrRel, '[DATAHORAIMPRESSAO]'  , FormatDateTime('dd/MM/yyyy hh:mm:ss', Now));
    Replace(StrRel, '[MOV_ID]'             , fstr('id'));
    Replace(StrRel, '[MOV_STATUS]'         , IfThen(fempty('dia_fech'), 'ABERTO', 'FECHADO'));
    Replace(StrRel, '[DIA_MOV]'            , FormatDateTime('dd/MM/yyyy', fdate('dia_mov')));
    Replace(StrRel, '[DIA_FECH]'           , IfThen(not fempty('dia_fech'), FormatDateTime('dd/MM/yyyy', fdate('dia_fech'))));
    Replace(StrRel, '[COUNT_OP]'           , fstr('count_op'));
    Replace(StrRel, '[CAIXA.CODIGO]'       , PadL(fint('cod_emissor'), 3));
    Replace(StrRel, '[OPERADOR.CODIGO]'    , PadL(fint('operador'), 3));
    Replace(StrRel, '[OPERADOR.NOME]'      , fstr('nome_operador'));

    Client := ClientContadores;
    Replace(StrRel, '[COUNT_SUPRIMENTO]'   , Client.fstr('count_suprimento'));
    Replace(StrRel, '[COUNT_SANGRIA]'      , Client.fstr('count_sangria'));
    Replace(StrRel, '[COUNT_AUTORIZADAS]'  , Client.fstr('count_autorizadas'));
    Replace(StrRel, '[COUNT_CANCELADAS]'   , Client.fstr('count_canceladas'));
    Replace(StrRel, '[COUNT_INUTILIZADAS]' , Client.fstr('count_inutilizadas'));
    Replace(StrRel, '[COUNT_DENEGADAS]'    , Client.fstr('count_denegadas'));
    Replace(StrRel, '[COUNT_CONTINGENCIAS]', Client.fstr('count_contingencias'));
    Replace(StrRel, '[COUNT_ENVIANDO]'     , Client.fstr('count_enviando'));
    Replace(StrRel, '[COUNT_PENDENTE]'     , Client.fstr('count_pendente'));
    Replace(StrRel, '[VPROD]'              , StrNumber(Client.ffloat('vprod')));
    Replace(StrRel, '[VDESC]'              , StrNumber(0 - Client.ffloat('vdesc')));
    Replace(StrRel, '[VFRETE]'             , StrNumber(Client.ffloat('vfrete')));
    Replace(StrRel, '[VSEG]'               , StrNumber(Client.ffloat('vseg')));
    Replace(StrRel, '[VOUTRO]'             , StrNumber(Client.ffloat('voutro')));
    Replace(StrRel, '[VNF]'                , StrNumber(Client.ffloat('vnf')));
    Replace(StrRel, '[VSUPRIMENTO]'        , StrNumber(Client.ffloat('vsuprimento')));
    Replace(StrRel, '[VSANGRIA]'           , StrNumber(Client.ffloat('vsangria')));
    Replace(StrRel, '[VTOTALGERAL]'        , StrNumber(Client.ffloat('vnf') + Client.ffloat('vsuprimento') + Client.ffloat('vsangria')));
    FreeAndNil(Client);

    StrRel := StringReplace(StrRel, '[/MEIOS_DE_PAGAMENTO]' + sLineBreak, MeiosPag.Text, [rfReplaceAll, rfIgnoreCase]);
    StrRel := StringReplace(StrRel, '[/MEIOS_DE_PAGAMENTO]', MeiosPag.Text, [rfReplaceAll, rfIgnoreCase]);

    Relatorio.Text := StrRel;
    Condensado := False;
    for I := 0 to Relatorio.Count - 1 do
    begin
      if ContainsText(Relatorio[I], '<c>') then
        Condensado := True;

      if ContainsText(Relatorio[I], '|') then
        Relatorio[I] := ReplaceForSpace(Relatorio[I], IfThen(Condensado, ColunasCondensado, Colunas));

      if ContainsText(Relatorio[I], '</c>') then
        Condensado := False;
    end;

//    Relatorio.SaveToFile('movimentooperador.txt');
    Conf := TConfig_sistema_class.getConf('nfc_nfce_config_emissor_cliente', buscas, vDadosIni.cod_empresa);
    ConfClient.Padrao.ArquivoIniPosPrinterNaoFiscal := Conf.ReadString('NFCe_Emissao_Padrao', 'ArquivoIniPosPrinterNaoFiscal');
    ConfClient.Padrao.ArquivoIniImpressaoHWNFC      := Trim(Conf.ReadString('NFCe_Emissao_Padrao', 'ArquivoIniImpressaoHWNFC'));

    ConfClient.AgenteNF.AgenteId                      := Trim(Conf.ReadString('AgenteNaoFiscal_Caixa_' + PadL(vDadosIni.vNFConsumidor.CodEmissor, 3), 'AgenteId'));
    ConfClient.AgenteNF.ArquivoIniPosPrinterNaoFiscal := Trim(Conf.ReadString('AgenteNaoFiscal_Caixa_' + PadL(vDadosIni.vNFConsumidor.CodEmissor, 3), 'ArquivoIniPosPrinterNaoFiscal'));
    ConfClient.AgenteNF.ArquivoIniImpressaoHWNFC      := Conf.ReadString('AgenteNaoFiscal_Caixa_' + PadL(vDadosIni.vNFConsumidor.CodEmissor, 3), 'ArquivoIniImpressaoHWNFC');

    if ConfClient.AgentValid then
    begin
      if not cloud_agente_print_text(WideString(Relatorio.Text), WideString(ConfClient.GetAgentPrintParams)) then
        ShowErro(string(cloud_agente_last_error));
    end
    else
    begin
      Resposta := HwPosPrintFromText(WideString(Relatorio.Text),
                                     WideString(IfThen(ConfClient.IsLocalAgent, ConfClient.AgenteNF.ArquivoIniPosPrinterNaoFiscal, ConfClient.Padrao.ArquivoIniPosPrinterNaoFiscal)), 1);
      if Resposta = 0 then
        FLastMessage := string(HwPosUltimoErro)
      else
        Result := True;
    end;
//      NFCe.SetLastMessage(string(HwPosUltimoErro));

  finally
    FreeAndNil(Conf);
    FreeAndNil(Relatorio);
    FreeAndNil(ModelMeiosPag);
    FreeAndNil(MeiosPag);
    if Assigned(Client) then FreeAndNil(Client);
  end;
end;

function TNFCe_MovimentoOperador.RelatorioDoDia_PrintQuickRep: Boolean;
var
  DataMeiosPag, DataContadores: TDataSet_OOP;
  Valor: Double;
  I: Integer;
begin
  Result := False;
  try

    DataContadores := ClientContadores;
    DataMeiosPag   := ClientMeiosPag;

    for I := 0 to DataContadores.dataSet.Fields.Count - 1 do
      if DataContadores.dataSet.Fields[I] is TFloatField then
        TFloatField(DataContadores.dataSet.Fields[I]).DisplayFormat := '#,##0.00';

    for I := 0 to DataMeiosPag.dataSet.Fields.Count - 1 do
      if DataMeiosPag.dataSet.Fields[I] is TFloatField then
        TFloatField(DataMeiosPag.dataSet.Fields[I]).DisplayFormat := '#,##0.00';

    Application.CreateForm(TfrmCadNFCe_RelMovOperador, frmCadNFCe_RelMovOperador);
    with frmCadNFCe_RelMovOperador do
    begin
      qr_count_suprimento.DataSet    := DataContadores.dataSet;
      qr_count_sangria.DataSet       := DataContadores.dataSet;
      qr_count_autorizadas.DataSet   := DataContadores.dataSet;
      qr_count_canceladas.DataSet    := DataContadores.dataSet;
      qr_count_inutilizadas.DataSet  := DataContadores.dataSet;
      qr_count_denegadas.DataSet     := DataContadores.dataSet;
      qr_count_contingencias.DataSet := DataContadores.dataSet;
      qr_count_enviando.DataSet      := DataContadores.dataSet;
      qr_count_pendente.DataSet      := DataContadores.dataSet;
      qr_count_suprimento.DataSet    := DataContadores.dataSet;
      qr_vprod.DataSet               := DataContadores.dataSet;
      qr_vdesc.DataSet               := DataContadores.dataSet;
      qr_vfrete.DataSet              := DataContadores.dataSet;
      qr_vseg.DataSet                := DataContadores.dataSet;
      qr_voutro.DataSet              := DataContadores.dataSet;
      qr_vnf.DataSet                 := DataContadores.dataSet;
      qr_vsangria.DataSet            := DataContadores.dataSet;
      qr_vsuprimento.DataSet         := DataContadores.dataSet;
      qr_vsangria.DataSet            := DataContadores.dataSet;
      qr_vtroco.DataSet              := DataContadores.dataSet;
      qr_cod_controle.DataSet        := DataMeiosPag.dataSet;
      qr_tpag.DataSet                := DataMeiosPag.dataSet;
      qr_nome_ctrl.DataSet           := DataMeiosPag.dataSet;
      qr_cod_controle.DataSet        := DataMeiosPag.dataSet;
      qr_vpag.DataSet                := DataMeiosPag.dataSet;

      rel.ReportTitle                := 'RELATÓRIO DE MOVIMENTO DO OPERADOR';
      qr_empresa_nome.Caption        := Format('%s - %s', [PadL(vDadosIni.cod_empresa, 3), vDadosIni.vEmp.vnomeEmpresa]);
      qr_empresa_cnpj.Caption        := 'CNPJ: ' + FormatMaskText('00.000.000/0000-00;0;_', vDadosIni.vEmp.vCNPJ);
      qr_datahora.Caption            := FormatDateTime('dd/MM/yyyy hh:mm:ss', Now);
      qr_mov_id.Caption              := 'MOVIMENTO: ' + PadL(fint('id'), 3);
      qr_mov_status.Caption          := Format('MOVIMENTO DO OPERADOR - DIA %s', [IfThen(fempty('dia_fech'), 'ABERTO', 'FECHADO')]);
      qr_mov_diamov.Caption          := 'DIA ABERTO: ' + FormatDateTime('dd/MM/yyyy', fdate('dia_mov'));
      qr_mov_diafech.Caption         := 'DIA FECHADO: ' + IfThen(not fnull('dia_fech'), FormatDateTime('dd/MM/yyyy', fdate('dia_mov')), '__/__/____');
      qr_operador.Caption            := Format('OPERADOR: %s - %s', [PadL(fint('operador'), 3), fstr('nome_operador')]);
      qr_emissor.Caption             := Format('CAIXA: %s', [PadL(fint('cod_emissor'), 3)]);
      qr_total_geral.Caption         := StrNumber(DataContadores.ffloat('vnf') + DataContadores.ffloat('vsuprimento') + DataContadores.ffloat('vsangria'));
      Valor                          := DataMeiosPag.fdata('vpag').Sum;
      qr_meiopag_tot.Caption         := StrNumber(Valor);
      qr_dif.Caption                 := StrNumber(Valor - (DataContadores.ffloat('vnf') + DataContadores.ffloat('vsuprimento') + DataContadores.ffloat('vsangria') + DataContadores.ffloat('vtroco')));

      rel.DataSet                    := DataMeiosPag.dataSet;

      rel.Preview;
    end;
  finally
    if Assigned(DataContadores           ) then FreeAndNil(DataContadores);
    if Assigned(DataMeiosPag             ) then FreeAndNil(DataMeiosPag);
    if Assigned(frmCadNFCe_RelMovOperador) then FreeAndNil(frmCadNFCe_RelMovOperador);
  end;
end;

function TNFCe_MovimentoOperador.TotaisDoDia: RNFCe_MovOperador_Valores;
var
  Sql: string;
begin
  with Result do
  begin
    Sql := Format('select sum(iif((mv.tipo = ''NFC-e'') and (mv.tpag = 1), coalesce(mv.vpag, 0), 0)) NFCe_din,' +
                  ' sum(iif((mv.tipo = ''NFC-e'') and (mv.tpag <> 1), coalesce(mv.vpag, 0), 0)) NFCe_out,' +
                  ' sum(iif(mv.tipo = ''Suprimento'', coalesce(mv.vpag, 0), 0)) Suprimento,' +
                  ' sum(iif(mv.tipo = ''Sangria'', coalesce(mv.vpag, 0), 0)) Sangria' +
                  ' from vw_nfce_movimento mv' +
                  ' where mv.id = %d and mv.cod_empresa = %d' +
                  ' and coalesce(mv.situacao_nfce, '''') not in (%s, %s, %s)',
                  [fint('id'), vDadosIni.cod_empresa, QuotedStr(sitCancelada),
                   QuotedStr(sitInutilizada), QuotedStr(sitDenegada)]);

    try
      SqlOpen(Sql + ' PLAN JOIN (JOIN (JOIN (MV MOV INDEX (PK_NFCE_MOVIMENTO), MV NFC INDEX (FK_NFCE_MOVIMENTO), MV PAG INDEX (FK_NFCE_PAGAMENTO))), MV CTRL INDEX (PK_CONTROLES))');
    except
      SqlOpen(Sql);
    end;

    Sangria       := Abs(buscas.FieldByName('sangria').AsFloat);
    Suprimento    := buscas.FieldByName('suprimento').AsFloat;
    NFCe_Dinheiro := buscas.FieldByName('NFCe_din').AsFloat;
    NFCe_Outros   := buscas.FieldByName('NFCe_out').AsFloat;

    buscas.Close;
  end;
end;

{ TNFC_Produtos_Imagem }

constructor TNFC_Produtos_Imagem.Create;
begin
  FOwner := AOwner;

  FFileNoImage := ExtractFilePath(Application.ExeName) + 'imagemindisponivel.jpg';
  if not FileExists(FFileNoImage) then
    if not vDadosIni.saveResourceToFile('imagemindisponivel', 'jpg', FFileNoImage) then
      FFileNoImage := '';

  FFileLogo := ExtractFilePath(Application.ExeName) + 'logo.jpg';
  if not FileExists(FFileLogo) then
    FFileLogo := '';

  FDirPadrao := IncludeTrailingPathDelimiter(vDadosIni.getConfSisStr('prod_cad_diretorio_padrao_imagens', FOwner.buscas));
end;

function TNFC_Produtos_Imagem.GetFileName: string;
var
  Lista: TStrings;
begin
  if (FOwner.str_empty('lista_imagens'))
  	and (vDadosIni.retornaPrimeiraImagem(FOwner.buscas, FOwner.fint('grupo_prod'), FOwner.fstr('cod_prod')) = '') then
  begin
    FFileName := FFileLogo;
  end
  else
  begin
  	if (trim(FOwner.fstr('lista_imagens')) <> '') then
    	Lista := NewStringList(False, FOwner.fstr('lista_imagens'))
    else
      Lista := NewStringList(False, vDadosIni.retornaPrimeiraImagem(FOwner.buscas, FOwner.fint('grupo_prod'), FOwner.fstr('cod_prod')));

    try
      if Trim(FDirPadrao) = '' then
      begin
        if FileExists(Trim(Lista[0])) then
          FFileName := Trim(Lista[0])
        else
          FFileName := FFileNoImage;
      end
      else
      begin
        if FileExists(IncludeTrailingPathDelimiter(Trim(FDirPadrao)) + Trim(Lista[0])) then
          FFileName := IncludeTrailingPathDelimiter(Trim(FDirPadrao)) + Trim(Lista[0])
        else if FileExists(Trim(Lista[0])) then
          FFileName := Trim(Lista[0])
        else
          FFileName := FFileNoImage;
      end;
    finally
      FreeAndNil(Lista);
    end;
  end;

  Result := FFileName;
end;

{ TNFCe_VendasSemEmit }

constructor TNFCe_VendasSemEmit.Create;
begin
  inherited Create(dtmAtivo.bancoHw);
  FItens := TDataSet_OOP.Create(dtmAtivo.bancoHw);
  dataSet.AfterScroll := DataSetAfterScroll;
  FDia := Date;
end;

procedure TNFCe_VendasSemEmit.DataSetAfterScroll(DataSet: TDataSet);
begin
  ShowItens;
end;

destructor TNFCe_VendasSemEmit.Destroy;
begin
  dataSet.AfterScroll := nil;
  FreeAndNil(FItens);
  inherited;
end;

function TNFCe_VendasSemEmit.ShowDay(DayInc: Integer): TNFCe_VendasSemEmit;
var
  SqlDest: string;
begin
  Result := Self;

  Screen.Cursor := crHourGlass;
  try

    dataSet.AfterScroll := DataSetAfterScroll;

    Dia := Dia + DayInc;

    if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
      cloud_get_pedidos(WideString(Format(';empresaId=%d;caixaId=%d;date=%s',
        [vDadosIni.cod_empresa, vDadosIni.vNFConsumidor.CodEmissor,
          FormatDateTime('dd/mm/yyyy', Dia)])));

    SqlDest := Format(' and coalesce(cl.insc_est, '''') %s in (''ISENTO'', '''')',
                      [IfThen(FTipoDest = tdContribuinte, 'not')]);

    ClientOpen('select distinct pv.nprevenda Num_prevenda, pv.nped numero, pv.tipo, cl.nome_cliente Cliente,' +
               ' pv.valor_total valor_total, pv.data_ped data_abertura, pv.data_fech data_fechamento,' +
               ' pv.cod_empresa' +
               ' from pedvenda pv' +
               ' inner join pedvenda_prod pvp on pvp.nped = pv.nped and pvp.tipo = pv.tipo and pvp.cod_empresa = pv.cod_empresa' +
               ' inner join clientes cl on cl.cod_cliente = pv.cod_cliente and cl.cod_empresa = pv.cod_empresa %s' +
               ' where pv.data_fech = %s and pv.cod_empresa = %d and pv.tipo <> ''ORC''' +
               ' and pv.ncupom is null and pv.cod_nfce is null and pv.num_nf is null and pv.n_nfd is null and pvp.n_nf is null',
               [SqlDest, date_fb(Dia), vDadosIni.cod_empresa]);
    ShowItens;

    if Assigned(FDiaChange) then
      FDiaChange(Self);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TNFCe_VendasSemEmit.ShowItens;
begin
  FItens.ClientOpen('select ''P'' tipo, pp.num_fab_prod codigo, pf.uvnd Unidade, pf.qvnd qtde,' +
                    ' pp.vltot_ped_item total, pp.descr_prod_ped descricao, pp.nitem' +
                    ' from pedvenda_prod_fator pf' +
                    ' inner join pedvenda_prod pp on (pf.nped = pp.nped) and (pf.tipo = pp.tipo) and (pf.grupo_prod = pp.grupo_prod) and (pf.cod_prod = pp.cod_prod)' +
                    ' and (pf.nitem = pp.nitem) and (pf.cod_empresa = pp.cod_empresa) and (pf.cod_grade = pp.cod_grade) and (pf.codigo_nop = pp.codigo_nop)' +
                    ' where pf.nped = %d and pf.tipo = %s and pf.cod_empresa = %d' +
                    ' and coalesce(pp.status,'''') <> ''CANCELADO''' +
                    ' union' +
                    ' select ''S'' tipo, pvs.cod_servico codigo, ''UN'' unidade, pvs.quant_serv_ped qtde,' +
                    ' pvs.valor_tot_serv total, pvs.desc_serv_ped descricao, pvs.nitem' +
                    ' from pedvenda_serv pvs' +
                    ' where pvs.nped = %d and pvs.tipo = %s and pvs.cod_empresa = %d' +
                    ' and coalesce(pvs.status,'''') <> ''CANCELADO''' +
                    ' order by 1,6',
                    [fint('numero'), fstrq('tipo'), vDadosIni.cod_empresa,
                     fint('numero'), fstrq('tipo'), vDadosIni.cod_empresa]);

  TFloatField(FItens.dataSet.FieldByName('qtde')).DisplayFormat := DisplayNumber(3);
  TFloatField(FItens.dataSet.FieldByName('total')).DisplayFormat := DisplayNumber(2);
end;

{ TCfgNFCeUtils }

destructor TCfgNFCeUtils.Destroy;
begin
  if Assigned(FCstsIndevidos) then
    FreeAndNil(FCstsIndevidos);

  inherited;
end;

{ TCfgNFCeCstsIndevidos }

function TCfgNFCeCstsIndevidos.GetCsosnCorrelacionado(csosn: string): string;
begin
  Result := ReadString('Conf', 'Csosn_' + csosn, csosn);
  if Trim(Result) = '' then
    Result := csosn;
end;

function TCfgNFCeCstsIndevidos.GetCstCorrelacionado(cst: string): string;
begin
  Result := ReadString('Conf', 'Cst_' + cst, cst);
  if Trim(Result) = '' then
    Result := cst;  
end;

{ RNFCe }

function RNFCe.AgentValid: Boolean;
begin
  Result := (not MatchText(AgenteNF.AgenteId, ['', 'Padrao', 'Local'])) and
            (AgenteNF.ArquivoIniPosPrinterNaoFiscal <> '') and
            (AgenteNF.ArquivoIniImpressaoHWNFC <> '');
end;

function RNFCe.GetAgentPrintParams: string;
begin
  Result := Format('agentId=%s;confName=%s;nfceConfName=%s;copies=1;cnpj=%s', [AgenteNF.AgenteId, AgenteNF.ArquivoIniPosPrinterNaoFiscal, AgenteNF.ArquivoIniImpressaoHWNFC, vDadosIni.vEmp.vCNPJ]);
end;

function RNFCe.GetDefaultPrintParams: string;
begin
  if MatchText(AgenteNF.AgenteId, ['Local']) and
     (AgenteNF.ArquivoIniPosPrinterNaoFiscal <> '') and
     (AgenteNF.ArquivoIniImpressaoHWNFC <> '') then
    Result := Format('confName=%s;nfceConfName=%s;cnpj=%s', [AgenteNF.ArquivoIniPosPrinterNaoFiscal, AgenteNF.ArquivoIniImpressaoHWNFC, vDadosIni.vEmp.vCNPJ])
  else
  begin
    Result :=IfThen((Padrao.ArquivoIniPosPrinterNaoFiscal <> ''), Format('confName=%s;cnpj=%s', [Padrao.ArquivoIniPosPrinterNaoFiscal, vDadosIni.vEmp.vCNPJ]));
    if (Padrao.ArquivoIniImpressaoHWNFC <> '') then
      Result := Result + IfThen(Result <> '', ';') + Format('nfceConfName=%s', [Padrao.ArquivoIniImpressaoHWNFC]);
  end;
end;

function RNFCe.IsLocalAgent: Boolean;
begin
  Result := MatchText(AgenteNF.AgenteId, ['Local']) and
            (AgenteNF.ArquivoIniPosPrinterNaoFiscal <> '') ;
end;

{ TNFCe_VendaDiaria }

constructor TNFCe_VendaDiaria.Create;
begin
  inherited Create(dtmAtivo.bancoHw);
  FDia := Date;
end;

function TNFCe_VendaDiaria.GetValorJaRecebidoEmCartao: Double;
begin
  Result := SqlScalar('select sum(VALOR_OPERACAO) from TRANSACAO_CARTAO' +
                      ' where TPDOCS = %s and NREQUISICAO = %d and cod_empresa = %d and status = ''A''',
                      [fstrq('tipo'), fint('numero'), vDadosIni.cod_empresa]).AsFloat;
end;

function TNFCe_VendaDiaria.ShowDay(DayInc: Integer): TNFCe_VendaDiaria;
begin
  Result := Self;

  Screen.Cursor := crHourGlass;
  try
    Dia := Dia + DayInc;

    if vDadosIni.vNFConsumidor.NFCeOffline = noClient then
      cloud_get_pedidos(WideString(Format(';empresaId=%d;caixaId=%d;date=%s',
        [vDadosIni.cod_empresa, vDadosIni.vNFConsumidor.CodEmissor,
          FormatDateTime('dd/mm/yyyy', Dia)])));

    ClientOpen('select distinct pv.nprevenda Num_prevenda, pv.nped numero, pv.tipo, cl.nome_cliente Cliente,' +
               ' pv.valor_total valor_total, pv.data_ped data_abertura, pv.data_fech data_fechamento,' +
               ' pv.cod_empresa' +
               ' from pedvenda pv' +
               ' inner join clientes cl on cl.cod_cliente = pv.cod_cliente and cl.cod_empresa = pv.cod_empresa' +
               ' where pv.data_fech = %s and pv.cod_empresa = %d and pv.tipo <> ''ORC''',
               [date_fb(Dia), vDadosIni.cod_empresa]);

    if Assigned(FDiaChange) then
      FDiaChange(Self);
  finally
    Screen.Cursor := crDefault;
  end;
end;

{ EspelhoValores }

class function EspelhoValores.Create(DescontoPorIntem, IgnorarTributosDFe: Boolean;
  ValorProdutos, Desconto, Frete, Seguro, Outros: Currency): EspelhoValores;
begin
  Result.FValorProdutos := ValorProdutos;
  Result.FDescontoPorIntem := DescontoPorIntem;
  Result.FIgnorarTributosDFe := IgnorarTributosDFe;
  Result.FDesconto := Desconto;
  Result.FSeguro := Seguro;
  Result.FOutros := Outros;
  Result.FFrete := Frete;
end;

function EspelhoValores.RecalcularIbsCbs(DescontoPorIntem, IgnorarTributosDFe: Boolean;
  ValorProdutos, Desconto, Frete, Seguro, Outros: Currency): Boolean;
begin
  Result := True;

  // Teste dos campos de rateio
  if Self.RecalcularIbsCbs( DescontoPorIntem, IgnorarTributosDFe, Desconto, Frete, Seguro, Outros ) then
   Exit;

  // Alteracao no valor de produtos e algum campo de rateio preenchido
  if (FValorProdutos <> ValorProdutos)
    and (((Seguro + Frete + Outros) > 0) or (not DescontoPorIntem and (Desconto > 0)))
  then
    Exit;

  Result := False;
end;

function EspelhoValores.RecalcularIbsCbs(DescontoPorIntem,
  IgnorarTributosDFe: Boolean; Desconto, Frete, Seguro,
  Outros: Currency): Boolean;
var
  rateadosMudaram: Boolean;
begin
  Result := True;

  // Alteracao no campo indicador de calculo
  if (FIgnorarTributosDFe <> IgnorarTributosDFe) then
    Exit;

  // Qualquer alteracao nos campos que sao de rateio
  if (not DescontoPorIntem and (FDesconto <> Desconto)) // Desconto por item e o valor mudou
    or (FSeguro <> Seguro)                             // Seguro mudou
    or (FOutros <> Outros)                             // Outros mudou
    or (FFrete <> Frete)                              // Frete valor mudou
  then
    Exit;

  // Com desconto, desconto por item mudou, desconto por item = False, precisa recalcular
  if (Desconto > 0) and (DescontoPorIntem <> FDescontoPorIntem) and not DescontoPorIntem then
    Exit;

  Result := False;
end;

{ TributoDFeOrquestradorInput }

class function TributoDFeOrquestradorInput.Create(OpInternaId, TributoDFeId,
  GrupoFiscalId, NCMouNBS, Unidade: string; DhFatoGerador: TDateTime; CMunFBIbs,
  nItem: Integer; ValorLiquido, Acrescimos, Frete, ICMS, ISS, PIS,
  COFINS: Currency; Quantidade: Double): TributoDFeOrquestradorInput;
begin
  Result.OpInternaId := OpInternaId;
  Result.TributoDFeId := TributoDFeId;
  Result.GrupoFiscalId := GrupoFiscalId;
  Result.NCMouNBS := NCMouNBS;
  Result.Unidade := Unidade;
  Result.DhFatoGerador := DhFatoGerador;
  Result.CMunFBIbs := CMunFBIbs;
  Result.nItem := nItem;
  Result.ValorLiquido := ValorLiquido;
  Result.Acrescimos := Acrescimos;
  Result.Frete := Frete;
  Result.ICMS := ICMS;
  Result.ISS := ISS;
  Result.PIS := PIS;
  Result.COFINS := COFINS;
  Result.Quantidade := Quantidade;
end;

end.

OK - Consulta cliente gravar no registro a ultima opção usada
OK - Colocar o numero para funcionar no grid dos pagamentos
OK - Remover sangsub dos detalhes do relatorio
OK - Colocar o troco
OK - Painel de controle do Serv0iço(Install, Start, Stop, Configure, Atalho??)
OK - Remover o teste COnfigurações preenchidas no que diz respento a Envio, Impressao e Email
OK - Ver se consigo usar os DADOSPFX
OK - Nao gerar pdf nem imprimir nem email de DANFCe da notas Inutilizadas
OK - Erro no completo ao emitir e informar cliente somente na primeira vez
OK - Testar movimento do operador no botão de abrir dia, fechar
OK - Botao "cancel" no completo chama "Procurar", e se campo vazio apresenta mensagem e nao prossegue
agora nao - Impressão Fortes config para ir direto para a impressora
HwServiceLess em executavel diferente dos executaveis do serviço
