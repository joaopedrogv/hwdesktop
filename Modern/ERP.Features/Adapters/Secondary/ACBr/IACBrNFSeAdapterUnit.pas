unit IACBrNFSeAdapterUnit;

interface

uses
  ConfiguracaoNFSeModelUnit,
  WebServiceResponseTypesUnit,
  ACBrNFSeXNotasFiscais,
  ACBrNFSeAdapterTypes,
  EmpresaEtdUnit,
  NFSeResponseTypesUnit, TipoComunsUnit;

type
  IACBrNFSeAdapter = interface
    ['{AF22BA6E-F0B0-4F1F-BD8F-D3936103874C}']
    procedure Configurar(const Config: ConfiguracaoNFSeModel; const Empresa: EmpresaEtd);
    //procedure ConfigurarImpressao(const Config: ConfiguracaoNFSeModel; const Empresa: EmpresaEtd);
    function GetNotaFiscalRequest(): TNotaFiscal;
    function GetNotaFiscalResponse(): TNotaFiscal;

    function ObterXmlDPS(): string;
    function ObterXmlPedidoCanc(): string;
    function ListaRegimesEspecialTributacao(): string;

    // Chamadas WebService
    function Emitir(const NumeroLote: string): WSResposta;
    function Consutar(const Input: ACBrConsultarInput): WSResposta;
    function Cancelar(const Input: ACBrCancelarInput): WSResposta;
    function Substituir(const NumeroLote: string; const Input: ACBrSubstituirInput): WSResposta;
    // Impressao/PDF
    procedure Imprimir(const XMLNFSe: string; Cancelada, Producao: Boolean); overload;
    procedure Imprimir(const XMLsNFSe: TArrayString; Canceladas: TArrayBoolean); overload;
    function SalvarPDF(const XMLNFSe: string; Cancelada, Producao: Boolean; out PdfFile: string): WSResposta;
    function GerarPdfAtual(): string;
    // Retorno de objetos Response
    function GetAutorizacaoResponse(): NFSeResponseAutorizacaoModel;
    function GetCancelamentoResponse(): NFSeResponseCancelamentoModel;
    function GetSubstituicaoResponse(): NFSeResponseSubstituicaoModel;
    function GetCancPorSubstResponse(): NFSeResponseCancelamentoModel;

    property NotaFiscalRequest: TNotaFiscal read GetNotaFiscalRequest;
    property NotaFiscalResponse: TNotaFiscal read GetNotaFiscalResponse;

    property AutorizacaoResponse: NFSeResponseAutorizacaoModel read GetAutorizacaoResponse;
    property CancelamentoResponse: NFSeResponseCancelamentoModel read GetCancelamentoResponse;
    property SubstituicaoResponse: NFSeResponseSubstituicaoModel read GetSubstituicaoResponse;
    property CancPorSubstResponse: NFSeResponseCancelamentoModel read GetCancPorSubstResponse;
  end;

implementation

end.
