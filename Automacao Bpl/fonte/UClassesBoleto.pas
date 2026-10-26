unit UClassesBoleto;

interface

uses
  uDataSet_OOP, DBClient, uDtmAtivo, Db, Windows, Forms, Controls, Variants,
  ComObj, ComCtrls, ExtCtrls, RDprint, UDtmBoleto, IBQuery, IBStoredProc,
  uCadPadrao, IniFiles, FileCtrl, DateUtils, Classes, ShellAPI, jpeg, axCtrls, 
  StdCtrls, CheckLst, hw_strings, uDadosIni;

const
  ST_API_SALVO = 'SALVO'; // Esta situação indica que o boleto chegou até nossa API e ainda é necessário aguardar a finalização do processamento. Com esta Situação ainda não é possível imprimir, enviar e-mail ou gerar a remessa.
  ST_API_FALHA = 'FALHA';	// Diferente de SALVO esta situação indica que ocorreu algum problema ao validar o boleto em nosso servidor. Sendo necessário consultar o IDIntegracao para verificar a causa da falha, e em seguida realizar o descarte, para emitir novamente o boleto com a correção.
  ST_API_EMITIDO = 'EMITIDO';	// Esta situação indica que o boleto passou pelas primeiras validações e está pronto para seguir o fluxo de emissão. Com esta Situação já é possível imprimir, enviar e-mail ou gerar a remessa.
  ST_API_REJEITADO = 'REJEITADO'; // Esta situação irá ocorrer quando for feito o upload do retorno e nele o banco rejeitar o boleto. Será possível verificar a causa da rejeição consultando o boleto através do IDIntegracao e em seguida realizar o descarte, para emitir novamente o boleto com a correção.
  ST_API_REGISTRADO = 'REGISTRADO';	// Esta situação irá ocorrer quando for feito o upload do retorno, e indica que o processo solicitado de registro de boleto foi autorizado pelo banco.
  ST_API_LIQUIDADO = 'LIQUIDADO';	// Esta situação irá ocorrer quando for feito o upload do retorno, e indica que o sacado realizou o pagamento do boleto.
  ST_API_BAIXADO = 'BAIXADO';	// Esta situação irá ocorrer quando for feito o upload do retorno, e indica que o processo solicitado de baixa foi autorizado pelo banco.
  ST_API_PENDENTE_RETENTATIVA = 'PENDENTE_RETENTATIVA';	// Esta situação irá ocorrer quando houve alguma falha no momento de registrar o boleto, e será realizado uma nova tentativa de registro em 1 minuto.

type

  RConsultaCTP = record
    vSqlAdicional: AnsiString;
    vDataIni, vDataFim, vDataIniAd, vDataFimAd, vCondicao, vCondicaoAd, vCampo, vCampoAd, vValor, vValorAd: string;
    vPorData, vAdicional, vPorDataAd, vLancDiferenca: boolean;
  end;
  TTipoConvenio = (tcVazio, tcArquivoLicenca, tcAPI);

  TBoleto = class;
  TClienteBol = class;
  TConfigBol = class;
  TCamposBol = class;
  TBanco = class;
  TCobreBem = class;
  TControleBol = class;
  TRemessaBoleto = class;
  TBoletoNossoNumeroRepetido = class;
  TPesqBanco = class;
  TBoletosNFVenda = class;
  TControleCredito = class;
  TConteBol = class;
  TBoletosProtesto = class;
  TEmpresasUnificadas = class;
  TConfEmail = class;

  RLayout = record
    LayoutsArquivoRemessa, LayoutsArquivoRetorno, LayoutsBoleto,
      LayoutsBoletoEmail: array of string;
    TiposDocumentosCobranca: array[1..2] of array of string;
  end;

  TConfEmail = class(TDataSet_OOP)
  public
    constructor create;
  end;

  TEmpresasUnificadas = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTodosEmpresas: Boolean;
    function _BuscarEmpresas(vCodEmp: Integer): Boolean;
  end;

  TArqBoleto = class(TDataSet_OOP)
  private
  public
    constructor create;
    function edit: boolean; override;
    function abreArquivosBol: Boolean;
    procedure cadArqBoleto(TipoForm: Integer);
    function CarregaPacote(NomeBPL: string; var pNumPacote: THandle): boolean;
  end;

  RBoletosSelecionados = record
    lista: array of Integer;
    Erros: string;
    ConvenioId: Integer;
  end;

  TBoleto = class(TDataSet_OOP)
  private
    procedureCodigo: TIBStoredProc;
    FlocDemaisBoletos: TNotifyEvent;
    function _PegarProxNossoNumero(Cod_Cobrebem: string): string;
    procedure _PreencheCampos();
    function _abreFormRemessa: Boolean;
  public
  	Fsql_campos, Fsql_inner: string;
    destructor Destroy; override;
    constructor create;
    function insert: boolean; override;
    function delete: boolean; override;
    function edit: boolean; override;
    function post: boolean; override;
    function cancel: boolean; override;
    function abrelixeira: boolean;
    function abreBoletos(pNumDoc: Integer; pTipoDoc: string): Boolean;
    function restauralixeira: boolean;
    function statuslixeira: boolean;
    function ImprimeBoletoPreImpresso: boolean;
    function criaBoletoCobreBemX: boolean;
    function AlterDadosRemessa(arquivo: string; nomecedente: string; cpfcnpjcedente: string): boolean;
    function SalvarDadosRemessa(arquivo: string): boolean;
    function GerarArquivoRemessa: boolean;
    function EnviarBoletoEmail: boolean;
    procedure cadBoleto(TipoForm: Integer);
    function LimparCamposImpressaoBoleto(pNossoNum, pRemessaEnviada, pRetirarCredito, pRetirarCarne:
      boolean; pOutrosDados: Boolean = false): Boolean;
    function testarGerarRemessaSituacaoAPI: boolean;
    function testarLimparRemessaSituacaoAPI: boolean;
    function setNossoNumeroBoleto(vNossoNumero: string): boolean;
    function VerificarNOSSONUMERO(NOSSONUMERO: string): boolean;
    function _ValidaDados: boolean;
    function _ValidaDadosCredito: boolean;
    function _PassarConfiguracao(pDiretorioArquivoRemessa: string = ''): boolean;
    function _AdicionarBoleto(
    	pNumeroNFVenda: integer = 0;
      pSubSerieNF: integer = 0;
      pTipo_Emissao: string = '';
    	pImprimir: boolean = false;
      pEnviar: boolean = false;
      pArrayAplicativo: arrayaplicativo = [];
      pArrayContato: arraycontato = nil;
      pOrigem: TOrigemEnv = cBoleto;
      pConfEmailWhatsApp: boolean = false;
      pUnicoEmailWhatsApp: boolean = false;
      pExibirAnd: boolean = true;
      pExibirHint: boolean = true): boolean;
    function _escreverArquivoHtmlIni: boolean;
    function _CommitTransaction(PROCESSO, TABELA, CAMPO_CHAVE, ACAO: string; pGravarAud: boolean = true): boolean;
    function _GerarBoletosDLLCobrebem(
    	pNumeroNFVenda: integer = 0;
      pSubSerieNF: integer = 0;
      pTipo_Emissao: string = '';
    	pImprimir: boolean = True;
      pEnviar: boolean  = False;
      pArrayAplicativo: arrayaplicativo = [];
			pArrayContato: arraycontato = nil;
      pOrigem: TOrigemEnv = cBoleto;
      pConfEmailWhatsApp: boolean = false;
      pUnicoEmailWhatsApp: boolean = false;
      pExibirHint: boolean = true): boolean;
    function _GerarBoletosPlugBoletos(
    	pIds: array of integer;
      pNumeroNFVenda: integer = 0;
      pSubSerieNF: integer = 0;
      pTipo_Emissao: string = '';
    	pImprimir: boolean = true;
      pEnviar: boolean = false;
      pArrayAplicativo: arrayaplicativo = [];
      pArrayContato: arraycontato = nil;
      pOrigem: TOrigemEnv = cBoleto;
      pConfEmailWhatsApp: boolean = false;
      pUnicoEmailWhatsApp: boolean = false;
      pProcesso: string = '';
  		pAcao: string = '';
      pExibirHint: boolean = true): boolean;
    function _RetirarInativo: boolean;
    function _CancelarBoleto: boolean;
    function _AlteraFormaPagamento: boolean;
    procedure _SelecionaBoleto;
    procedure _SelecionaTodosBoletos;
    procedure _DesmarcaTodosBoletos;
    procedure _ImprimeFaturaNF(RDprint1: TRDprint);
    function _SelecionaCobrebem(
    	pImprimir: boolean;
      pEnviar: boolean;
      pOrigem: TOrigemEnv;
      pListBoletas: TStringList;
      pExibirPergunta: Boolean): Integer;
    function _BoletosNFOS(
    	pNumeroNFVenda: integer;
      pSubSerieNF: integer;
      pTipo_Emissao: string;
      pCodCliente: Integer;
      pNossoNumero: string = '';
      pImprimir: boolean = true;
      pEnviar: boolean = false;
      pArrayAplicativo: arrayaplicativo = [];
      pArrayContato: arraycontato = nil;
      pOrigem: TOrigemEnv = cBoleto;
      pConfEmailWhatsApp: boolean = false;
      pCodCobrebem: Integer = 0): boolean; overload;
    function _BoletosNFOS(
    	pImprimir: boolean;
      pEnviar: boolean;
      pArrayAplicativo: arrayaplicativo;
      pArrayContato: arraycontato;
      pOrigem: TOrigemEnv;
      pListBoletas: TStringList;
      pConfEmailWhatsApp: boolean;
      pExibirPergunta: boolean = True;
      pCodCobrebem: Integer = 0;
      pExibirHint: boolean = true): boolean; overload;
    procedure _RetirarSelecoesBoleto;
    function _AbreBoleto: boolean;
    procedure _marcaDesmarcaLinha;
    function _gerarCarne: Boolean;
    function _gerarImpressao: Boolean;
    procedure marcarImpressaoPeloBanco(pAtivarImpressaoPeloBanco: Boolean = True);
    function _defineSqlAdicional: boolean;
    function _marcaImprimirBoleto(n_seq_bol: Integer): boolean;
    procedure _efetuarSoma;
    function _validarDadosNota: boolean;
    function devolverBoleto: boolean;
    function removerStatusDevolvido: boolean;
    function _abreformEnvMensagem: boolean;
    function _enviarMensagem(
    	pEnviar: boolean;
      pArrayAplicativo: arrayaplicativo;
      pArrayContato: arraycontato;
      pOrigem: TOrigemEnv;
    	pConfEmailWhatsApp: boolean = false): boolean;
    function retornaEmail(
    	pCodCliente: Integer): string;
    procedure _atualizarDadosHtml(vHtmlBoleto: TStringList);
    function enviarBoletoPorEmailOS(
    	pNumDoc: Integer;
      pTipoDoc: string;
    	pImprimir: boolean;
      pEnviar: boolean;
      pArrayAplicativo: arrayaplicativo;
      pArrayContato: arraycontato;
      pOrigem: TOrigemEnv;
      pConfEmailWhatsApp: boolean): boolean;
    function GetBoletosMesmoDocumento: TDataSet_OOP;
    procedure SetBoletosMesmoDocumento(Aboletos: TDataSet_OOP; AfieldsChange: TStrings);
    function abreFormConfEmail(pArrayAplicativo: arrayaplicativo; var pArrayContato: arraycontato; var pEnviar: Boolean): Boolean;

    function HandleBoletos: RBoletosSelecionados;
    function TestarBoletos: Boolean;

    property OnLocDemaisBoletos: TNotifyEvent read FlocDemaisBoletos write FlocDemaisBoletos;
  var
    vCliente: TClienteBol;
    vConfigBol: TConfigBol;
    vCamposBol: TCamposBol;
    vBanco: TBanco;
    vCobreBem: TCobreBem;
    vAbortar: boolean;
    vRemessaBoleto: tRemessaBoleto;
    vVoltarImpressaoBoleto: boolean;
    vBoletoNossoNumeroRepetido: tboletoNossonumerorepetido;
    vVerificarComitar: boolean;
    vVerificarErro: boolean;
    vTemPath: string;
    vPesqBanco: tPesqBanco;
    vBoletosNFVenda: tboletosnfvenda;
    vImpressaoNF: boolean; {Varivavel que verifica se estar imprimindo boleto
    pela nota fiscal}
    vQueryFinanceiro: TIBQuery;
    vComitarFormaPagamento: boolean; {Verifica se tem que comitar a forma de pagamento}
    vControleCreditos: TControleCredito;
    _CreditoSelecionado: integer; {Pega qual o credito do boleto foi selecionado}
    vTipoImpressao: string;
    vIndicadorImpressao: Integer; //0: Pre configurado; 1: Empresa imprime; 2: banco imprime
    vDataIni, vDataFim, vDataIniAd, vDataFimAd, vCondicaoAd, vCampo, vCampoAd, vValorAd: string;
    vPorData, vAdicional, vPorDataAd, vLancDiferenca: boolean;
    rBOL: RConsultaCTP;
    ultimasql: string;
    vCodSeqBoleto: Integer;
  end;

  TControleCredito = class(TDataSet_OOP)
  private
  public
    constructor create;
    function _PreencherVinculoCreditoBoleto(CodCliente: integer; NossoNumero: string): boolean;
    function _VincularCreditoBoleto(NossoNumero: string; CodCobrebem: Integer): boolean;
  end;

  TBoletosNFVenda = class(TDataSet_OOP)
  private
  public
    constructor create;
    function _AbreNFVenda(NumNFVenda: string): boolean;
  end;

  TBoletoNossoNumeroRepetido = class(TDataSet_OOP)
  private
  public
  	Fsql_campos, Fsql_inner: string;
    constructor create;
    function _AbreBoletos(NOSSONUMERO: string): boolean;
  end;

  TRemessaBoleto = class(TDataSet_OOP)
  private
  public
    constructor create;
    function AbreRemessaBoleto: boolean;
  var
    _DataInicio, _DataFim: string;
    _ValidarDatas: boolean;
  end;

  TClienteBol = class(TDataSet_OOP)
  private
  public
    constructor create;
    function selecionaCliente(codigo: string): boolean;
  var
  end;

  TConfigBol = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreConfigBol: boolean;
  var
  end;

  TCamposBol = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreCamposBol: boolean;
  var
  end;

  TPesqBanco = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreBanco: boolean;
    function _PesquisaBanco(codigo: string): boolean;
  var
  end;

  TBanco = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreBanco: boolean;
  var
  end;

  TItemConvenio = record
    ConvenioId: Integer;
    Tipo: TTipoConvenio;
  end;

  TBancosHomologados = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreBancosHomologados: boolean;
  var
  end;

  TCobrebem = class(TDataSet_OOP)
  private
    FLayout: RLayout;
    FMascaraCodigoAgencia: string;
    FMascaraCodigoCedente: string;
    FMascaraNossoNumero: string;
    FMascaraContaCorrente: string;
    FNumeroBanco: string;
    FMascaraOutroDadoConfiguracao1: string;
    FMascaraOutroDadoConfiguracao2: string;
    FCabecalhoOutroDadoConfiguracao1: string;
    FCabecalhoOutroDadoConfiguracao2: string;
    FNomeBanco: string;
    function GetItem(convenioId: Integer): TItemConvenio;
  public
    destructor Destroy; override;
    constructor create;
    function insert: boolean; override;
    function delete: boolean; override;
    function edit: boolean; override;
    function post: boolean; override;
    function cancel: boolean; override;
    function abrelixeira: boolean;
    function restauralixeira: boolean;
    function statuslixeira: boolean;
    function abreCobreBem(CodigoControle: integer): Boolean; overload;
    function abreCobreBem(codigo: string): Boolean; overload;
    function abreCobreBemImpressao(CodigoControle: integer): Boolean; overload;
    function abreCobreBemImpressao(codigo: string): Boolean; overload;
    procedure cadCobreBem(TipoForm: Integer);
    procedure CriarCobrebemX;
    function selecionarDiretorio(diretorioInicial: string): string;
    function validaArquivoLicenca: boolean;
    procedure IncluirOutrosDados;
		function criarPastasTemporarias: boolean;
    procedure exportaLicencaCobrebem;
    procedure exportaLogotipoCobrebem;
    function abreFormOpcoes: boolean;
    function existeConfigPlugBoleto: boolean;
    function verificaBancoHomologado: boolean;
    function verificaConvenioExiste: boolean;
    procedure setarMascaraTipoPlugBoleto;
    procedure atualizarDadosContaCorrente;
    function obterDadosCertificado: Boolean;

    property MascaraCodigoCedente: string read FMascaraCodigoCedente;
    property MascaraCodigoAgencia: string read FMascaraCodigoAgencia;
    property MascaraContaCorrente: string read FMascaraContaCorrente;
    property MascaraNossoNumero: string read FMascaraNossoNumero;
    property MascaraOutroDadoConfiguracao1: string read FMascaraOutroDadoConfiguracao1;
    property MascaraOutroDadoConfiguracao2: string read FMascaraOutroDadoConfiguracao2;
    property CabecalhoOutroDadoConfiguracao1: string read FCabecalhoOutroDadoConfiguracao1;
    property CabecalhoOutroDadoConfiguracao2: string read FCabecalhoOutroDadoConfiguracao2;
    property NomeBanco: string read FNomeBanco;
    property NumeroBanco: string read FNumeroBanco;
    property Layout: RLayout read FLayout;

    property Items[convenioId: Integer]: TItemConvenio read GetItem;

  var
  	vAgencia: string;
  	vNumContaCorrente: string;
  	vNumeroConvenio: string;
  	vDiasProtesto: Integer;
  	vARQUIVOLICENCA, vIMAGENSLOGOTIPO, vIMAGENSBOLETO: string;
    Controle: TControleBol;
    ContBol: tcontebol;
    vModificarSenha: boolean;
    vBancosHomologados: TBancosHomologados;
    vEmpresasUnificadas: TEmpresasUnificadas;
  end;

  TControleBol = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreControle: boolean;
  end;

  TConteBol = class(TDataSet_OOP)
  private
  public
    constructor create;
    function abreControle: boolean;
  end;

	TBoletosProtesto = class(TBoleto)
  private
  public
  	constructor create;
    
    procedure cadBoletosProtesto(pExibeCheckBox: boolean = True);
    function abreBoletosProtesto: boolean;
    function existeBoletosProtesto: boolean;
  end;

var
  Tabela: string;
  vCadBoletosProtesto: TBoletosProtesto;

implementation

uses
  Dialogs, SysUtils, IBDatabase, UCadBoleto, UCadCobrebem,
  uSelecionaCobrebem, uPadrao, funcoes, uBoletosProtesto, uConfEmail, ShlObj,
  boletas_class, base_class, StrUtils, Contnrs, config_sistema_class, SHFolder,
  MaskUtils, hw_utils, uArquivosBoleto, Math, hw_win_utils, Query_OOP,
  hw_doc_utils;

procedure plugboleto_cedente(paramsList: WideString); stdcall; external 'hw.utils.dx.dll';
procedure plugboleto_conta(paramsList: WideString; idconvenio: integer); stdcall; external 'hw.utils.dx.dll';
procedure plugboleto_convenio(paramsList: WideString; idconvenio: integer); stdcall; external 'hw.utils.dx.dll';
procedure plugboleto_consultar(paramsList: WideString; ids: array of integer); stdcall; external 'hw.utils.dx.dll';
procedure plugboleto_emitir(paramsList: WideString; ids: array of integer); stdcall; external 'hw.utils.dx.dll';
procedure plugboleto_descartar(paramsList: WideString; ids: array of integer); stdcall; external 'hw.utils.dx.dll';
procedure plugboleto_remessa(paramsList: WideString; ids: array of integer; diretorio: WideString); stdcall; external 'hw.utils.dx.dll';

function cert_obter_dados(Parametros: WideString): WideString; stdcall; external 'hw.nfe.dx.dll';

function _strImagetoBase64(FileName: WideString): WideString; stdcall; external 'MD5XE3.dll';

function _strBase64toImage(Base64: WideString; FileName: WideString): WideString; stdcall; external 'MD5XE3.dll';

function limpardados_boleto(pNossoNumero, RemessaEnviada, pRetirarCredito, pCarne, pOutrosDados: boolean; pListBoletas: TStringList): boolean;
var
  ABoleto: TBoleto;
  ABuscas: TIBQuery;
  I: Integer;
  vTemp: string;
begin
    Result := false;
    ABoleto := TBoleto.create;

    ABuscas 																:= TIBQuery.Create(ABoleto.buscas);
    ABuscas.Database 												:= ABoleto.buscas.Database;
    ABuscas.Transaction											:= ABoleto.buscas.Transaction;
    ABoleto.buscas 													:= ABuscas;
    ABoleto.buscas.Database 								:= ABoleto.buscas.Database;
    ABoleto.transacao 											:= ABuscas.Transaction;

    for I := 0 to pListBoletas.Count - 1 do
    	vTemp := vTemp + pListBoletas[I] + ', ';
    vTemp := '(' + Copy(vTemp, 1, Length(vTemp) - 2) + ')';

    Result :=
      ABoleto.montaSelect('select ' + ABoleto.Fsql_campos + ' FROM BOLETAS ' +
        ABoleto.Fsql_inner +
        ' WHERE BOLETAS.COD_EMPRESA  = ' + vDadosIni.codEmpresa +
        ' and CLIENTES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
        ' and BOLETAS.N_SEQ_BOL IN ' + vTemp);


     if ABoleto.dataSet.IsEmpty then
       Exit;

     try
       ABoleto.dataSet.DisableControls;
       ABoleto.dataSet.First;
       while not (ABoleto.dataSet.Eof) do
       begin
         ABoleto.dataSet.Edit;
         ABoleto.dataSet.FieldByName('SelecionaBoleto').Value := 'S';
         ABoleto.dataSet.Post;
         ABoleto.dataSet.Next;
       end;
     finally
     	 ABoleto.dataSet.First;
       ABoleto.dataSet.EnableControls;
     end;

     Result := ABoleto.LimparCamposImpressaoBoleto(pNossoNumero,
        RemessaEnviada, pRetirarCredito, pCarne, pOutrosDados);

    if Result then
    begin
      ABoleto._CommitTransaction('BOL015', 'BOLETAS', '', 'INSERIR');
      Application.MessageBox('Dados de impressão do boleto apagados com sucesso.',
        'Confirmação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
    end;
end;

function selecionar_convenio(
	pImprimir: boolean;
  pEnviar: boolean;
  pOrigem: TOrigemEnv;
  pListBoletas: TStringList;
  pExibirPergunta: Boolean): Integer;
var
	ABoleto: TBoleto;
begin
	Result := 0;
	ABoleto := TBoleto.create;
	Result := ABoleto._SelecionaCobrebem(
  	pImprimir,
    pEnviar,
    pOrigem,
  	pListBoletas,
    pExibirPergunta);
end;

function gerar_boleto(
	pImprimir: boolean;
  pEnviar: boolean;
  pArrayAplicativo: arrayaplicativo;
  pArrayContato: arraycontato;
  pOrigem: TOrigemEnv;
  pListBoletas: TStringList;
  pConfEmailWhatsApp: boolean;
  pExibirPergunta: boolean = True;
  pCodCobrebem: Integer = 0;
  pExibirHint: boolean = True): boolean;
var
  ABoleto: TBoleto;
begin
  Result := false;
  ABoleto := TBoleto.create;
  Result := ABoleto._BoletosNFOS(
    pImprimir,
    pEnviar,
    pArrayAplicativo,
    pArrayContato,
    pOrigem,
    pListBoletas,
    pConfEmailWhatsApp,
    pExibirPergunta,
    pCodCobrebem,
    pExibirHint);
end;

function gerar_boletoNFOS(
	pNumeroNFVenda: integer;
  pSubSerieNF: integer;
  pTipo_Emissao: string;
  pCodCliente: Integer;
  pNossoNumero: string;
  pImprimir: boolean;
  pEnviar: boolean;
  pArrayAplicativo: arrayaplicativo;
  pArrayContato: arraycontato;
  pOrigem: TOrigemEnv;
  pConfEmailWhatsApp: Boolean = False;
  pCodCobrebem: Integer = 0): boolean;
var
  ABoleto: TBoleto;
begin
    Result := false;
    ABoleto := TBoleto.create;

    if not vDadosIni.sincronizarDadosContatoClienteAplicativo(
      pCodCliente) then
      	Exit;

    Result := ABoleto._BoletosNFOS(
    	pNumeroNFVenda,
      pSubSerieNF,
      pTipo_Emissao,
      pCodCliente,
      pNossoNumero,
      pImprimir,
      pEnviar,
      pArrayAplicativo,
      pArrayContato,
      pOrigem,
      pConfEmailWhatsApp,
      pCodCobrebem);
end;

exports selecionar_convenio, gerar_boleto, limpardados_boleto, gerar_boletoNFOS;

var
  CobreBemX: Variant;
  Boleto: Variant;
  EmailSacado: Variant;

const
  feeSMTPBoletoHTML = $00000000;
  feeSMTPMensagemBoletoHTMLAnexo = $00000001;
  feeSMTPMensagemBoletoPDFAnexo = $00000002;
  feeSMTPMensagemLinhaDigitavelURLCobreBemECommerce = $00000003;
  feeSMTPMensagemURLCobreBemECommerce = $00000004;
  feeSMTPMensagemLinhaDigitavel = $00000005;
  feeOutlookBoletoHTML = $00000006;
  feeOutlookMensagemBoletoHTMLAnexo = $00000007;
  feeOutlookMensagemBoletoPDFAnexo = $00000008;
  feeOutlookMensagemLinhaDigitavelURLCobreBemECommerce = $00000009;
  feeOutlookMensagemURLCobreBemECommerce = $0000000A;
  feeOutlookMensagemLinhaDigitavel = $0000000B;
  scpExecutar = $00000000;
  scpOK = $00000001;
  scpInvalido = $00000002;
  scpErro = $00000003;

  { TBoleto }

function TBoleto.abreBoletos(pNumDoc: Integer; pTipoDoc: string): Boolean;
begin
  result :=
  	montaSelect('select ' + Fsql_campos + ' FROM BOLETAS ' +
      Fsql_inner +
      ' WHERE BOLETAS.NUM_NF_VND = ' + IntToStr(pNumDoc) +
      ' and BOLETAS.TIPO_EMISSAO = ' + QuotedStr(pTipoDoc) +
      ' and BOLETAS.COD_EMPRESA  = ' + vDadosIni.codEmpresa +
      ' and BOLETAS.ATIVO = 1');

end;

function TBoleto.abreFormConfEmail(pArrayAplicativo: arrayaplicativo; var pArrayContato: arraycontato; var pEnviar: Boolean): Boolean;
var
	buscas2: TIBQuery;
  I, J: Integer;
begin
	Result := True;

  if vDadosIni.vHwCloudIA.vUsarServMensageria = 'S' then
  	Exit;

  if not pEnviar then
  	Exit;

  try
    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    Application.CreateForm(TfrmConfEmail, frmConfEmail);
    SqlOpen(' select cod_cliente, nome_cliente, contato from clientes ' +
      ' where cod_cliente = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa, buscas2);
    frmConfEmail.Caption := 'Confirmar cliente: ' + trim(buscas2.FieldByName('nome_cliente').AsString);
    frmConfEmail.unicoEmailWhatsApp := True;
    frmConfEmail.confEmailWhatsApp := False;
    frmConfEmail.codCliente := buscas2.FieldByName('cod_cliente').AsInteger;
    frmConfEmail.contato := trim(buscas2.FieldByName('contato').AsString);

    frmConfEmail.GroupBoxEmail.Visible := (cEmail in pArrayaplicativo);
    frmConfEmail.lbContatoEmail.Enabled := (cEmail in pArrayaplicativo);
    frmConfEmail.EditContatoEmail.Enabled := (cEmail in pArrayaplicativo);
    frmConfEmail.lbAssuntoEmail.Enabled := (cEmail in pArrayaplicativo);
    frmConfEmail.EditAssuntoEmail.Enabled := (cEmail in pArrayaplicativo);
    frmConfEmail.lbMensagemEmail.Enabled := (cEmail in pArrayaplicativo);
    frmConfEmail.MemoMensagemEmail.Enabled := (cEmail in pArrayaplicativo);
    frmConfEmail.ckEnviarEmail.Checked := (cEmail in pArrayaplicativo);

    frmConfEmail.GroupBoxWhatsApp.Visible := (cWhatsApp in pArrayaplicativo);
    frmConfEmail.lbContatoWhatsApp.Enabled := (cWhatsApp in pArrayaplicativo);
    frmConfEmail.CheckListContatoWhatsApp.Enabled := (cWhatsApp in pArrayaplicativo);
    frmConfEmail.SpeedButtonAdcWhatsApp.Enabled := (cWhatsApp in pArrayaplicativo);
    frmConfEmail.SpeedButtonRemWhatsApp.Enabled := (cWhatsApp in pArrayaplicativo);
    frmConfEmail.ckEnviarWhatsApp.Checked := (cWhatsApp in pArrayaplicativo);

    frmConfEmail.ckEnviarEmail.Enabled := False;
    frmConfEmail.ckEnviarWhatsApp.Enabled := False;

    if frmConfEmail.EditContatoEmail.Enabled then
      frmConfEmail.EditContatoEmail.Text := '';
    if frmConfEmail.EditAssuntoEmail.Enabled then
      frmConfEmail.EditAssuntoEmail.Text := vDadosIni.vBoletos.vAssunto_bol;
    if frmConfEmail.MemoMensagemEmail.Enabled then
      frmConfEmail.MemoMensagemEmail.Text := vDadosIni.vBoletos.vMsg_bol.Text;

    if frmConfEmail.CheckListContatoWhatsApp.Enabled then
      frmConfEmail.CheckListContatoWhatsApp.Clear;
    if frmConfEmail.EditAssuntoWhatsApp.Enabled then
      frmConfEmail.EditAssuntoWhatsApp.Text := vDadosIni.vBoletos.vAssuntoWhatsApp_bol;
    if frmConfEmail.MemoMensagemWhatsApp.Enabled then
      frmConfEmail.MemoMensagemWhatsApp.Text := vDadosIni.vBoletos.vMsgWhatsApp_bol.Text;

    frmConfEmail.Height :=
      frmConfEmail.GroupBoxOpcoes.Height +
      vDadosIni.IfThen(frmConfEmail.GroupBoxEmail.Visible,
        frmConfEmail.GroupBoxEmail.Height, 0) +
      vDadosIni.IfThen(frmConfEmail.GroupBoxWhatsApp.Visible,
        frmConfEmail.GroupBoxWhatsApp.Height, 0) +
      40 +
      frmConfEmail.Panel9.Height;

    Result := frmConfEmail.ShowModal = ID_OK;

    if Result then
    begin
    	vDadosIni.vBoletos.vAssunto_bol := frmConfEmail.EditAssuntoEmail.Text;
      vDadosIni.vBoletos.vMsg_bol.Text := frmConfEmail.MemoMensagemEmail.Text;

      vDadosIni.vBoletos.vAssuntoWhatsApp_bol := frmConfEmail.EditAssuntoWhatsApp.Text;
      vDadosIni.vBoletos.vMsgWhatsApp_bol.Text := frmConfEmail.MemoMensagemWhatsApp.Text;

      I := 0;
      if (frmConfEmail.ckEnviarEmail.Checked) and (trim(frmConfEmail.EditContatoEmail.Text) <> '') then
      	Inc(I);
      if (frmConfEmail.ckEnviarWhatsApp.Checked) and (frmConfEmail.CheckListContatoWhatsApp.Count > 0) then
      begin
        for J := 0 to frmConfEmail.CheckListContatoWhatsApp.Count - 1 do
        	if frmConfEmail.CheckListContatoWhatsApp.Checked[J] then
          	Inc(I);
      end;

      SetLength(pArrayContato, I);
      I := -1;
      if (frmConfEmail.ckEnviarEmail.Checked) and (trim(frmConfEmail.EditContatoEmail.Text) <> '') then
      begin
      	Inc(I);

      	pArrayContato[I].Aplicativo := cEmail;
        pArrayContato[I].Contato := '';
        pArrayContato[I].Identificacao := trim(frmConfEmail.EditContatoEmail.Text);
        pArrayContato[I].Sel := 'S';
      end;

      if (frmConfEmail.ckEnviarWhatsApp.Checked) and (frmConfEmail.CheckListContatoWhatsApp.Count > 0) then
      begin
        for J := 0 to frmConfEmail.CheckListContatoWhatsApp.Count - 1 do
        	if frmConfEmail.CheckListContatoWhatsApp.Checked[J] then
          begin
          	Inc(I);

         		pArrayContato[I].Aplicativo := cWhatsApp;
            pArrayContato[I].Contato := '';
            pArrayContato[I].Identificacao := vDadosIni.getCampoPipe(trim(frmConfEmail.CheckListContatoWhatsApp.Items[J]), 1);
            pArrayContato[I].Sel := 'S';
          end;
      end;
    end;
  finally
    if Assigned(buscas2) then
    	FreeAndNil(buscas2);
    frmSelecionaCobrebem.Free;
    frmSelecionaCobrebem := nil;
  end;
end;

function TBoleto.abrelixeira: boolean;
begin
  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    result := false;
  end
  else
    result :=
      montaSelect('select ' + Fsql_campos + ' FROM BOLETAS ' +
      Fsql_inner +
      ' WHERE BOLETAS.COD_EMPRESA  = ' + vDadosIni.codEmpresa +
      ' and CLIENTES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' and BOLETAS.ATIVO = 0');
end;

function TBoleto.AlterDadosRemessa(arquivo: string; nomecedente: string; cpfcnpjcedente: string): boolean;
var
  Arq, Arq2: TextFile;
  linha: string;
  vlista: TStringList;
  I, J: Integer;
  Aconf: TConfig_sistema_class;
  Akey: string;
  vAtivarConfiguracoesCNAB240, vCNPJEmpresaCNAB240, vCodigoConvenioSicoobCNAB240: string;
  vNumeroVersaoLayoutArquivoCNAB240, vDigitoVerificadorAgContaCNAB240: string;
  vNumeroVersaoLayoutLoteCNAB240, vAgenciaMantenedoraContaCNAB240, vCodigoCarteiraCNAB240, vCodigoJurosCNAB240, vCodigoProtestoCNAB240: string;
  vFormaCadastrTituloBancoCNAB240, vDataJurosMoraCNAB240, vDataMultaCNAB240: string;
  vDataJurosMoraXDiasCNAB240, vDataMultaXDiasCNAB240: string;
  vUsarDescontoBoleto: string;
  vdatavenc: string;
  vcodagencia: string;
  vcodcedente: string;
  vtamanhocedente: Integer;
  vdatalimdesconto: string;
  vvalordesconto: string;
begin
 try
 	 try
      Result := true;

      vUsarDescontoBoleto := 'N';
      if vCobreBem.dataSet.FieldByName('LAYOUTARQUIVOREMESSA').AsString = 'CNAB400' then
      begin
        try
          dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
          	if vUsarDescontoBoleto = 'S' then
              Break;

            if dataSet.FieldByName('SelecionaBoleto').Value = 'S' then
            begin
              for I := 0 to CobreBemX.DocumentosCobranca.Count - 1 do
              begin
                if CobreBemX.DocumentosCobranca[I].MinhaChave =
                  dataSet.FieldByName('N_SEQ_BOL').asString then
                begin
                  if (dataSet.FieldByName('VL_DESC_BOL').AsFloat > 0) then
                  begin
                    vUsarDescontoBoleto := 'S';
                    Break;
                  end;
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

      Aconf := TConfig_sistema_class.Create;
      Aconf.value1_b.Text := vCobreBem.dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString;
      vcodagencia := vCobreBem.dataSet.FieldByName('CODIGOAGENCIA').AsString;
      vcodcedente := vCobreBem.dataSet.FieldByName('CODIGOCEDENTE').AsString;
      vtamanhocedente := vCobreBem.dataSet.FieldByName('TAM_NOME_CEDENTE_GENERICO').AsInteger;
      nomecedente := trim(nomecedente);
      cpfcnpjcedente := trim(cpfcnpjcedente);

      if Assigned(Aconf) then
      begin
        vAtivarConfiguracoesCNAB240 			:= Aconf.ReadString('ConfRemessaCNAB240', 'Ativar configuracoes (S ou N)', '');
        vCNPJEmpresaCNAB240			          := Aconf.ReadString('ConfRemessaCNAB240', 'Header Arquivo/Lote - CNPJ da Empresa (14 digitos)', '');
        vCodigoConvenioSicoobCNAB240 		  := Aconf.ReadString('ConfRemessaCNAB240', 'Header Arquivo - Usar Codigo do Convenio (S ou N)', '');
        vNumeroVersaoLayoutArquivoCNAB240 := Aconf.ReadString('ConfRemessaCNAB240', 'Header Arquivo - Numero Versao do Layout Arquivo (3 digitos)', '');
        vDigitoVerificadorAgContaCNAB240  := Aconf.ReadString('ConfRemessaCNAB240', 'Header Arquivo - Digito Verificador da AgConta (1 digito)', '');
        vNumeroVersaoLayoutLoteCNAB240    := Aconf.ReadString('ConfRemessaCNAB240', 'Header Lote - Nº da Versao do Layout do Lote (3 digitos)', '');
        vAgenciaMantenedoraContaCNAB240   := Aconf.ReadString('ConfRemessaCNAB240', 'Segmento P - Usar Codigo da Agencia da Conta (S ou N)', '');
        vCodigoCarteiraCNAB240            := Aconf.ReadString('ConfRemessaCNAB240', 'Segmento P - Codigo da Carteira (1 digito)', '');
        vFormaCadastrTituloBancoCNAB240   := Aconf.ReadString('ConfRemessaCNAB240', 'Segmento P - Forma de Cadastr. Titulo no Banco (1 digito)', '');
        vDataJurosMoraCNAB240             := Aconf.ReadString('ConfRemessaCNAB240', 'Segmento P - Usar Data do Juros de Mora (S ou N)', '');
        vCodigoJurosCNAB240               := Aconf.ReadString('ConfRemessaCNAB240', 'Segmento P - Codigo do Juros de Mora (1 digito)', '');
        vCodigoProtestoCNAB240						:= Aconf.ReadString('ConfRemessaCNAB240', 'Segmento P - Codigo para Protesto (1 digito)', '');
        vDataMultaCNAB240                 := Aconf.ReadString('ConfRemessaCNAB240', 'Segmento R - Usar Data da Multa (S ou N)', '');
        vDataJurosMoraXDiasCNAB240				:= Aconf.ReadString('ConfRemessaCNAB240', 'Segmento P - Data do Juros de Mora sera considerada a Data de Vencimento mais x dias', '');
        vDataMultaXDiasCNAB240						:= Aconf.ReadString('ConfRemessaCNAB240', 'Segmento R - Data da Multa sera considerada data de vencimento mais x dias', '');
      end
      else
      begin
        vAtivarConfiguracoesCNAB240       := '';
        vCNPJEmpresaCNAB240							  := '';
        vCodigoConvenioSicoobCNAB240 		  := '';
        vNumeroVersaoLayoutArquivoCNAB240 := '';
        vDigitoVerificadorAgContaCNAB240  := '';
        vNumeroVersaoLayoutLoteCNAB240    := '';
        vAgenciaMantenedoraContaCNAB240   := '';
        vCodigoCarteiraCNAB240            := '';
        vFormaCadastrTituloBancoCNAB240   := '';
        vDataJurosMoraCNAB240             := '';
        vCodigoJurosCNAB240               := '';
        vCodigoProtestoCNAB240						:= '';
        vDataMultaCNAB240								  := '';
        vDataJurosMoraXDiasCNAB240				:= '';
        vDataMultaXDiasCNAB240						:= '';
      end;

      if (trim(vAtivarConfiguracoesCNAB240) <> 'S')
        and (vCobreBem.dataSet.FieldByName('LICENCA_GENERICA').AsString <> 'S')
        and (trim(vUsarDescontoBoleto) <> 'S') then
        exit;

      vCNPJEmpresaCNAB240 := vDadosIni.apenasNumeros(trim(vCNPJEmpresaCNAB240));

      if trim(vCNPJEmpresaCNAB240) <> '' then
        if Length(trim(vCNPJEmpresaCNAB240)) <> 14 then
           vCNPJEmpresaCNAB240 := '';

      if trim(vDigitoVerificadorAgContaCNAB240) <> '' then
      begin
        try
          StrToInt(vDigitoVerificadorAgContaCNAB240);
        except
          vDigitoVerificadorAgContaCNAB240 := '';
        end;
      end;

      if trim(vNumeroVersaoLayoutArquivoCNAB240) <> '' then
      begin
        try
          StrToInt(vNumeroVersaoLayoutArquivoCNAB240);
        except
          vNumeroVersaoLayoutArquivoCNAB240 := '';
        end;
      end;

      if trim(vNumeroVersaoLayoutLoteCNAB240) <> '' then
      begin
        try
          StrToInt(vNumeroVersaoLayoutLoteCNAB240);
        except
          vNumeroVersaoLayoutLoteCNAB240 := '';
        end;
      end;

      if trim(vCodigoCarteiraCNAB240) <> '' then
        if Length(trim(vCodigoCarteiraCNAB240)) <> 1 then
          vCodigoCarteiraCNAB240 := '';

      if trim(vFormaCadastrTituloBancoCNAB240) <> '' then
        if Length(trim(vFormaCadastrTituloBancoCNAB240)) <> 1 then
          vFormaCadastrTituloBancoCNAB240 := '';

      if trim(vDataJurosMoraXDiasCNAB240) = '' then
        vDataJurosMoraXDiasCNAB240 := '1';

      if trim(vDataMultaXDiasCNAB240) = '' then
        vDataMultaXDiasCNAB240 := '1';

      if trim(vDataJurosMoraXDiasCNAB240) <> '' then
      begin
        try
          StrToInt(vDataJurosMoraXDiasCNAB240);
        except
          vDataJurosMoraXDiasCNAB240 := '1';
        end;
      end;

      if trim(vDataMultaXDiasCNAB240) <> '' then
      begin
        try
          StrToInt(vDataMultaXDiasCNAB240);
        except
          vDataMultaXDiasCNAB240 := '1';
        end;
      end;

      // Alterar dados da remessa banco Sicoob ACCredi (CNAB240)
      vlista := TStringList.Create;
      vlista.Clear;

      // Lendo arquivo
      AssignFile(arq, arquivo);
      Reset(arq);
      while not System.Eof(arq) do
      begin
        Readln(arq, linha);
        vlista.Add(linha);
      end;
      closeFile(arq);

      // Apagando arquivo
      try
        AssignFile(arq, arquivo);
        Rewrite(arq)
      finally
        CloseFile(arq);
      end;

      // Reescrevendo arquivo
      if FileExists(arquivo) then
      begin
        AssignFile(Arq, arquivo);
        Reset(arq);
        for I := 0 to vlista.Count - 1 do
        begin
          append(arq);
          linha := vlista[I];

          if (vUsarDescontoBoleto = 'S') and (Copy(linha, 1, 1) = '1') then
          begin
          	vdatalimdesconto := Copy(linha, 121, 6);
            vvalordesconto := Copy(linha, 180, 13);

            if trim(vvalordesconto) <> '' then
            	if StrToFloat(trim(vvalordesconto)) > 0 then
              begin
                linha := Copy(linha, 1, 173) +
                  vdatalimdesconto +
                  Copy(linha, 180, 221);
              end;
          end;

          if (vCobreBem.dataSet.FieldByName('LICENCA_GENERICA').AsString = 'S')
          	and (vDadosIni.apenasNumeros(trim(CobreBemX.CnpjCpfCedente)) = '03530705000109') then 
          begin
            if (Pos(Copy(PadR(nomecedente, vtamanhocedente), 1, vtamanhocedente), linha) <> 0) then
              linha := StringReplace(linha,
                Copy(PadR(nomecedente, vtamanhocedente),	1, vtamanhocedente),
                Copy(PadR(vCobreBem.dataSet.FieldByName('NOME_EMP_GENERICO').AsString, vtamanhocedente),	1, vtamanhocedente),
                [rfReplaceAll]);

            if Length(trim(vDadosIni.vEmp.vCNPJ)) = 14 then
            begin
              if (Pos(FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, cpfcnpjcedente), linha) <> 0) then
                linha := StringReplace(linha,
                  FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, cpfcnpjcedente),
                  FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                  [rfReplaceAll]);
            end
            else
            begin
              if (Pos(FormatMaskText('999.999.999-99;0', cpfcnpjcedente), linha) <> 0) then
                linha := StringReplace(linha,
                  FormatMaskText('999.999.999-99;0', cpfcnpjcedente),
                  FormatMaskText('999.999.999-99;0', trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                  [rfReplaceAll]);
            end;
            if (Pos(cpfcnpjcedente, linha) <> 0) then
              linha := StringReplace(linha,
                cpfcnpjcedente,
                trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString),
                [rfReplaceAll]);
          end;

          if i = 0 then
          begin
          	if (vCobreBem.dataSet.FieldByName('LICENCA_GENERICA').AsString = 'S')
            	and (vDadosIni.apenasNumeros(trim(CobreBemX.CnpjCpfCedente)) <> '03530705000109') then
            begin
              if (Pos(Copy(PadR(nomecedente, vtamanhocedente), 1, vtamanhocedente), linha) <> 0) then
                linha := StringReplace(linha,
                  Copy(PadR(nomecedente, vtamanhocedente),	1, vtamanhocedente),
                  Copy(PadR(vCobreBem.dataSet.FieldByName('NOME_EMP_GENERICO').AsString, vtamanhocedente),	1, vtamanhocedente),
                  [rfIgnoreCase]);

              if Length(trim(vDadosIni.vEmp.vCNPJ)) = 14 then
              begin
                if (Pos(FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, cpfcnpjcedente), linha) <> 0) then
                  linha := StringReplace(linha,
                    FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, cpfcnpjcedente),
                    FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                    [rfIgnoreCase]);
              end
              else
              begin
                if (Pos(FormatMaskText('999.999.999-99;0', cpfcnpjcedente), linha) <> 0) then
                  linha := StringReplace(linha,
                    FormatMaskText('999.999.999-99;0', cpfcnpjcedente),
                    FormatMaskText('999.999.999-99;0', trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                    [rfIgnoreCase]);
              end;
              if (Pos(cpfcnpjcedente, linha) <> 0) then
                linha := StringReplace(linha,
                  cpfcnpjcedente,
                  trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString),
                  [rfIgnoreCase]);
            end;

            // CNPJ empresa
            if (trim(vAtivarConfiguracoesCNAB240) = 'S') then
              if trim(vCNPJEmpresaCNAB240) <> '' then
              linha := Copy(linha, 1, 18) +
                vDadosIni.StrZero(vDadosIni.apenasLetraseNumeros(trim(vCNPJEmpresaCNAB240)), 14) +
                Copy(linha, 33, length(linha) - 32);

            // Incluindo código do cedente
            if (trim(vAtivarConfiguracoesCNAB240) = 'S') then
              if UpperCase(trim(vCodigoConvenioSicoobCNAB240)) = 'S' then
              linha := Copy(linha, 1, 32) +
                Copy(vDadosIni.StrZero(vDadosIni.apenasLetraseNumeros(trim(vcodcedente)), 20), 1, 20) +
                Copy(linha, 53, length(linha) - 52);

            // Atualizando dígito verificador da ag/conta
            if (trim(vAtivarConfiguracoesCNAB240) = 'S') then
              if trim(vDigitoVerificadorAgContaCNAB240) <> '' then
                linha := Copy(linha, 1, 71) + Copy(vDigitoVerificadorAgContaCNAB240, 1, 1) +
                  Copy(linha, 73, length(linha) - 72);

            // Atualizando versão layout do arquivo
            if (trim(vAtivarConfiguracoesCNAB240) = 'S') then
              if trim(vNumeroVersaoLayoutArquivoCNAB240) <> '' then
                linha := Copy(linha, 1, 163) + Copy(vDadosIni.StrZero(StrToInt(vNumeroVersaoLayoutArquivoCNAB240), 3), 1, 3) +
                  Copy(linha, 167, length(linha) - 166);
          end
          else if i = 1 then
          begin
          	if (vCobreBem.dataSet.FieldByName('LICENCA_GENERICA').AsString = 'S')
            	and (vDadosIni.apenasNumeros(trim(CobreBemX.CnpjCpfCedente)) <> '03530705000109') 
            	and (vCobreBem.dataSet.FieldByName('LAYOUTARQUIVOREMESSA').AsString = 'FEBRABAN240') then
            begin
              if Length(trim(vDadosIni.vEmp.vCNPJ)) = 14 then
              begin
                if (Pos(FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, cpfcnpjcedente), linha) <> 0) then
                  linha := StringReplace(linha,
                    FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, cpfcnpjcedente),
                    FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                    [rfIgnoreCase]);
              end
              else
              begin
                if (Pos(FormatMaskText('999.999.999-99;0', cpfcnpjcedente), linha) <> 0) then
                  linha := StringReplace(linha,
                    FormatMaskText('999.999.999-99;0', cpfcnpjcedente),
                    FormatMaskText('999.999.999-99;0', trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                    [rfIgnoreCase]);
              end;
              if (Pos(cpfcnpjcedente, linha) <> 0) then
                linha := StringReplace(linha,
                  cpfcnpjcedente,
                  trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString),
                  [rfIgnoreCase]);
            end;

            // CNPJ empresa
            if (trim(vAtivarConfiguracoesCNAB240) = 'S') then
              if trim(vCNPJEmpresaCNAB240) <> '' then
              linha := Copy(linha, 1, 18) +
                vDadosIni.StrZero(vDadosIni.apenasLetraseNumeros(trim(vCNPJEmpresaCNAB240)), 15) +
                  Copy(linha, 34, length(linha) - 33);

            // Atualizando versão layout do lote
            if (trim(vAtivarConfiguracoesCNAB240) = 'S') then
              if trim(vNumeroVersaoLayoutLoteCNAB240) <> '' then
                linha := Copy(linha, 1, 13) + Copy(vNumeroVersaoLayoutLoteCNAB240, 1, 3) +
                	Copy(linha, 17, length(linha) - 16);
          end
          else if Copy(vlista[I], 14, 1) = 'P' then
          begin
            if (trim(vAtivarConfiguracoesCNAB240) = 'S') then
              if (trim(vDataJurosMoraCNAB240) = 'S') or (trim(vDataMultaCNAB240) = 'S') then
              	vdatavenc := Copy(linha, 78, 2) + '/' + Copy(linha, 80, 2) + '/' + Copy(linha, 82, 4);

            if (trim(vAtivarConfiguracoesCNAB240) = 'S') then
              if trim(vAgenciaMantenedoraContaCNAB240) = 'S' then
              	linha := Copy(linha, 1, 17) +
                	Copy(vDadosIni.StrZero(vDadosIni.apenasLetraseNumeros(trim(vcodagencia)), 5), 1, 5) +
                  Copy(linha, 23, length(linha) - 22);

            if (trim(vAtivarConfiguracoesCNAB240) = 'S') then
              if trim(vCodigoCarteiraCNAB240) <> '' then
                linha := Copy(linha, 1, 57) + Copy(vCodigoCarteiraCNAB240, 1, 1) +
                  Copy(linha, 59, length(linha) - 58);

            if (trim(vAtivarConfiguracoesCNAB240) = 'S') then
              if trim(vFormaCadastrTituloBancoCNAB240) <> '' then
                linha := Copy(linha, 1, 58) + Copy(vFormaCadastrTituloBancoCNAB240, 1, 1) +
                  Copy(linha, 60, length(linha) - 59);

            if (trim(vAtivarConfiguracoesCNAB240) = 'S') then
              if trim(vCodigoJurosCNAB240) <> ''then
                if Copy(linha, 118, 1) = '0' then
                  linha := Copy(linha, 1, 117) + Copy(vCodigoJurosCNAB240, 1, 1) +
                    Copy(linha, 119, length(linha) - 118);

            if (trim(vAtivarConfiguracoesCNAB240) = 'S') then
              if trim(vDataJurosMoraCNAB240) = 'S' then
                linha := Copy(linha, 1, 118) +
                  Copy(FormatDateTime('ddmmyyyy', StrToDate(vdatavenc) + StrToInt(vDataJurosMoraXDiasCNAB240)), 1, 8) +
                  Copy(linha, 127, length(linha) - 126);

            if (trim(vAtivarConfiguracoesCNAB240) = 'S') then
              if trim(vCodigoProtestoCNAB240) <> ''then
                if Copy(linha, 221, 1) = '0' then
                  linha := Copy(linha, 1, 220) + Copy(vCodigoProtestoCNAB240, 1, 1) +
                    Copy(linha, 222, length(linha) - 221);
          end
          else if Copy(vlista[I], 14, 1) = 'R' then
          begin
            if (trim(vAtivarConfiguracoesCNAB240) = 'S') then
              if trim(vDataMultaCNAB240) = 'S' then
                linha := Copy(linha, 1, 66) +
                  Copy(FormatDateTime('ddmmyyyy', StrToDate(vdatavenc) + StrToInt(vDataMultaXDiasCNAB240)), 1, 8) +
                  Copy(linha, 75, length(linha) - 74);
          end;

          WriteLn(arq, linha);
        end;

        closeFile(arq);
      end;
   finally
      if Assigned(Aconf) then
      	FreeAndNil(Aconf);
   end;
 except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar('Erro ao atualizar dados da remessa: ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('Erro ao atualizar dados da remessa: ' + e.Message);
    end;
 end;
end;

procedure TBoleto.cadBoleto(Tipoform: Integer);
begin
	vDadosIni.abreStatusProcessamento('', 'Abrindo Cadastro de boletas...');
  
  vDadosIni.vTipoForm := TipoForm;
  if DtmBoletos = nil then
    DtmBoletos := TDtmBoletos.Create(DtmBoletos);

  if frmCadBoletos = nil then
  begin
    if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';
    Application.CreateForm(TfrmCadBoletos, frmCadBoletos);
  end;

  if (TipoForm > 0) and (not frmCadBoletos.Visible) then
    frmCadBoletos.ShowModal
  else if (not frmCadBoletos.Visible) then
    frmCadBoletos.Show
  else if frmCadBoletos.FormStyle = fsMDIChild then
    frmCadBoletos.Show
  else
    frmCadBoletos.ShowModal;
end;

function TBoleto.cancel: boolean;
begin
  if (dataSet.State in [dsEdit, dsInsert]) then
  begin
    dataSet.Cancel;
    RollBackTransacao;
    result := true;
  end;
end;

constructor TBoleto.create;
begin
  vAbortar := false;
  if (DtmBoletos = nil) then
    DtmBoletos := TDtmBoletos.Create(DtmBoletos);
  dataSet := TClientDataSet(DtmBoletos.cdsBoletos);
  buscas := TIBQuery(DtmBoletos.qrBuscas);
  vQueryFinanceiro := TIBQuery(DtmBoletos.qrFinanceiro);
  transacao := TIBTransaction(DtmBoletos.IBTransBoletos);
  procedureCodigo := TIBStoredProc(DtmBoletos.SpCobrebem);

  vCliente := TClienteBol.create;

  vConfigBol := TConfigBol.create;
  vConfigBol.abreConfigBol;

  vCamposBol := TCamposBol.create;
  vCamposBol.abreCamposBol;

  vBanco := TBanco.create;
  vBanco.abreBanco;

  vPesqBanco := TPesqBanco.create;
  vPesqBanco.abreBanco;

  vCobreBem := TCobreBem.create;
  vCobreBem.dataSet := TClientDataSet(DtmBoletos.cdsCobreBemBol);
  vCobreBem.abreCobreBem(0);

  vRemessaBoleto := TRemessaBoleto.create;
  vBoletoNossoNumeroRepetido := TBoletoNossoNumeroRepetido.create;

  vBoletosNFVenda := TBoletosNFVenda.create;

  vControleCreditos := TControleCredito.create;

  Fsql_campos := ' BOLETAS.*, ' +
  							 ' CONTROLES.NOME_CTRL, ' +
                 ' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CPFCGC, CLIENTES.EMAIL, ' +
                 ' RETORNA_DATA_ENV_BOL.DATA_ENV_EMAIL, RETORNA_DATA_ENV_BOL.DATA_ENV_WHATSAPP, RETORNA_DATA_ENV_BOL.DATA_ENV_MENS ';
                 
  Fsql_inner  := ' INNER JOIN CLIENTES ON BOLETAS.COD_CLIENTE = CLIENTES.COD_CLIENTE AND BOLETAS.COD_EMPRESA = CLIENTES.COD_EMPRESA ' +
            		 ' LEFT JOIN CONTROLES ON BOLETAS.COD_CONTROLE_CX = CONTROLES.CODIGO_CTRL AND BOLETAS.COD_EMPRESA = CONTROLES.CODIGO_EMP ' +
                 ' LEFT JOIN RETORNA_DATA_ENV_BOL (BOLETAS.N_SEQ_BOL, BOLETAS.COD_EMPRESA) ON 1 = 1 ';
end;

function TBoleto.criaBoletoCobreBemX: boolean;
begin
  CobreBemX := CreateOleObject('CobreBemX.ContaCorrente');
end;

function TBoleto.delete: boolean;
var
	vApagar: boolean;
  vNSeqlBol: string;
  vNumDocBol: string;
  vTipoDocBol: string;
  vValorDocBol: Double;
  vNossoNumBol: string;
  vNomeCliente: string;
  vRazaoCliente: string;
  vCnpjCpfCliente: string;
  vtemp: string;
begin
	Result := false;
  if dataSet.IsEmpty then
    exit;

  try
    vApagar         := dataSet.FieldByName('ATIVO').AsInteger <> 1;
    vNSeqlBol       := dataSet.FieldByName('N_SEQ_BOL').AsString;
    vNumDocBol      := trim(dataSet.FieldByName('N_DOC_BOL').AsString);
    vTipoDocBol     := trim(dataSet.FieldByName('TIPO_EMISSAO').AsString);
    vValorDocBol    := dataSet.FieldByName('VL_DOC_BOL').AsFloat;
    vNossoNumBol    := trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString);
    vNomeCliente    := trim(dataSet.FieldByName('NOME_CLIENTE').AsString);
    vRazaoCliente   := trim(dataSet.FieldByName('RAZAO').AsString);
    vCnpjCpfCliente := trim(dataSet.FieldByName('CPFCGC').AsString);

    prepare_loop('SelecionaBoleto = ''S''');
    if not dataset.IsEmpty then
    begin
      vApagar         := dataSet.FieldByName('ATIVO').AsInteger <> 1;
      vNSeqlBol       := '';
      vNumDocBol      := '';
      vTipoDocBol     := '';
      vNossoNumBol    := '';
      vValorDocBol    := 0;
      vNomeCliente    := '';
      vRazaoCliente   := '';
      vCnpjCpfCliente := '';
    end;
  finally
    prepare_loop_done;
  end;

  try
    if (trim(vNSeqlBol) <> '') then
      prepare_loop('N_SEQ_BOL = ' + vNSeqlBol)
    else
      prepare_loop('SelecionaBoleto = ''S''');

    dataset.First;
    while not dataset.Eof do
    begin
		  if ((dataSet.FieldByName('REMESSA_ENVIADA').AsString = 'S') and (Trim(UpperCase(dataSet.FieldByName('STATUS').AsString)) <> 'DEVOLVIDO')) then
  		begin
				Application.MessageBox(PChar('Boleto com Remessa Enviada' + #13 +
        	'BOLETO' + #13 +
          'Código: ' + dataSet.FieldByName('N_SEQ_BOL').AsString + #13 +
          'Num Doc: ' + trim(dataSet.FieldByName('N_DOC_BOL').AsString) + #13 +
          'Tipo Doc: ' + trim(dataSet.FieldByName('TIPO_EMISSAO').AsString) + #13 +
          'Valor Doc: R$ ' + FormatFloat('0.00', dataSet.FieldByName('VL_DOC_BOL').AsFloat) + #13 +
          'Nosso Número: ' + trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString) + #13 +
          'Nome Fantasia: ' + trim(dataSet.FieldByName('NOME_CLIENTE').AsString) + #13 +
          'Razão Social: ' + trim(dataSet.FieldByName('RAZAO').AsString) + #13 +
          'CPNJ / CPF: ' + trim(dataSet.FieldByName('CPFCGC').AsString) + #13 + #13 +
	    		'Favor Devolver antes de Excluir!'), 'Informação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
	  	  Exit;
		  end;

      dataset.Next;
    end;
  finally
  	vDadosIni.fechaStatusProcessamento;
    prepare_loop_done;
  end;

  try
    if (trim(vNSeqlBol) <> '') then
      prepare_loop('N_SEQ_BOL = ' + vNSeqlBol)
    else
      prepare_loop('SelecionaBoleto = ''S''');

    if vApagar then
    begin
      vtemp := 'Tem certeza que deseja excluir este registro permanentemente?' + #13 + #13 +
        'BOLETO' + #13 +
        'Código: ' + vNSeqlBol + #13 +
        'Num Doc: ' + vNumDocBol + #13 +
        'Tipo Doc: ' + vTipoDocBol + #13 +
        'Valor Doc: R$ ' + FormatFloat('0.00', vValorDocBol) + #13 +
        'Nosso Número: ' + vNossoNumBol + #13 +
        'Nome Fantasia: ' + vNomeCliente + #13 +
        'Razão Social: ' + vRazaoCliente + #13 +
        'CNPJ / CPF: ' + vCnpjCpfCliente;

      if (trim(vNSeqlBol) = '') then
        vtemp := 'Tem certeza que deseja excluir os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados permanentemente?';

      if not vDadosIni.PesqPros('BOL004', 'EXCLUIR', '', 'BOLETAS',
        vDadosIni.IfThen(trim(vNSeqlBol) <> '', vNSeqlBol, ''), buscas, false) then
        exit;

      if Application.MessageBox(PChar(vtemp),
        'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
        exit;
    end
    else
    begin
      vtemp := 'Tem certeza que deseja mover este registro para a Lixeira?' + #13 + #13 +
        'BOLETO' + #13 +
        'Código: ' + vNSeqlBol + #13 +
        'Num Doc: ' + vNumDocBol + #13 +
        'Tipo Doc: ' + vTipoDocBol + #13 +
        'Valor Doc: R$ ' + FormatFloat('0.00', vValorDocBol) + #13 +
        'Nosso Número: ' + vNossoNumBol + #13 +
        'Nome Fantasia: ' + vNomeCliente + #13 +
        'Razão Social: ' + vRazaoCliente + #13 +
        'CNPJ / CPF: ' + vCnpjCpfCliente;

      if (trim(vNSeqlBol) = '') then
        vtemp := 'Tem certeza que deseja mover os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados para a lixeira?';

      if not vDadosIni.PesqPros('BOL005', 'EXCLUIR', '', 'BOLETAS',
        vDadosIni.IfThen(trim(vNSeqlBol) <> '', vNSeqlBol, ''), buscas, false) then
        exit;

      if Application.MessageBox(PChar(vtemp),
        'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
        exit;
    end;

    if vApagar then
      vDadosIni.abreStatusProcessamento('', 'Excluíndo boleto(s) permanentemente')
    else
      vDadosIni.abreStatusProcessamento('', 'Movendo boleto(s) para lixeira');

    dataset.First;
    while not dataset.Eof do
    begin
      if vApagar then
        vDadosIni.abreStatusProcessamento('', 'Excluíndo boleto(s) permanentemente (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')')
      else
        vDadosIni.abreStatusProcessamento('', 'Movendo boleto(s) para lixeira (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

      if vApagar then
      begin
        SqlExec(' delete from boletas ' +
          ' where n_seq_bol = %d and cod_empresa = %d ',
          [fint('n_seq_bol'), fint('cod_empresa')], buscas);

        if (trim(vNSeqlBol) = '') then
          vDadosIni.GravaAuditoria('BOL004', 'EXCLUIR', '', 'BOLETAS',
            dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);
      end
      else
      begin
      	SqlExec(' update boletas set ativo = 0 ' +
          ' where n_seq_bol = %d and cod_empresa = %d ',
          [fint('n_seq_bol'), fint('cod_empresa')], buscas);

        if (trim(vNSeqlBol) = '') then
          vDadosIni.GravaAuditoria('BOL003', 'EXCLUIR', '', 'BOLETAS',
            dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);
      end;

      dataset.Next;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
    prepare_loop_done;
  end;
  Result := CommitaTransacao;

  if Result then
  begin
    vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'BOL004', 'BOL005'),
      'EXCLUIR', 'SUCESSO', 'BOLETAS',
      vDadosIni.IfThen(trim(vNSeqlBol) <> '', vNSeqlBol, ''), buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria(vDadosIni.IfThen(vApagar, 'BOL004', 'BOL005'),
      'EXCLUIR', 'FALHA', 'BOLETAS',
      vDadosIni.IfThen(trim(vNSeqlBol) <> '', vNSeqlBol, ''), buscas);
  end;

  if Result then
    Refresh;
end;

destructor TBoleto.Destroy;
begin
  vCliente.Free;
  vConfigBol.Free;
  vCamposBol.Free;
  vBanco.Free;
  vCobreBem.Free;

  vCliente := nil;
  vConfigBol := nil;
  vCamposBol := nil;
  vBanco := nil;
  vCobreBem := nil;
  vAbortar := True;
  inherited;
end;

function TBoleto.devolverBoleto: boolean;
begin
	try
  	Result := False;
    
    if dataSet.IsEmpty then
    	Exit;

    if dataSet.FieldByName('STATUS').AsString = 'DEVOLVIDO' then
    begin
			Application.MessageBox('Boleto já se encontra Devolvido!', 'Informação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
      Exit;
    end;

    if dataSet.FieldByName('STATUS').AsString = 'QUITADO' then
    begin
			Application.MessageBox('Não é possível devolver Boleto Quitado!', 'Informação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
      Exit;
    end;

  	if not vDadosIni.PesqPros('BOL036', 'DEVOLVER', '', 'BOLETAS', dataSet.FieldByName('N_SEQ_BOL').AsString, buscas, True) then
    	Exit;

//    if not inherited Edit then
//    	Exit;
//
//    dataSet.FieldByName('STATUS').AsString := 'DEVOLVIDO';
//
//    Result := inherited Post;
//    Result := Apply;
    buscas.Close;
    buscas.SQL.Text := 'UPDATE BOLETAS SET STATUS = ''DEVOLVIDO'' ' +
    	' WHERE N_SEQ_BOL = ' + IntToStr(dataSet.FieldByName('N_SEQ_BOL').AsInteger) +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' AND TRIM(COALESCE(STATUS, '''')) = '''' ';
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
    	buscas.Transaction.Commit;
      
  	Result := true;
    if Result then
    	CommitaTransacao
    else
    	RollBackTransacao;
    Refresh;
      
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TBoleto.edit: boolean;
begin
  result := false;
  if (not dataSet.Active) or (dataSet.IsEmpty) then
  begin
    Result := false;
    Exit;
  end;
  vCliente.selecionaCliente(dataSet.FieldByName('cod_cliente').AsString);
  if inherited Edit then
  begin
    result := True;
    if dataSet.FieldByName('TRANSMISSAO_AUTOMATICA').IsNull then
      dataSet.FieldByName('TRANSMISSAO_AUTOMATICA').AsString := 'N';
  end;
end;

function TBoleto.EnviarBoletoEmail: boolean;
begin
  try
    _PassarConfiguracao;
    if (_AdicionarBoleto) then
    begin
      frmCadBoletos.DesabilitarHabilitarCampos(true);
      CobreBemX.EnviaBoletosPorEmail;
      Application.MessageBox('E-mail enviado com sucesso!', ' Confirmação!',
        MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
    end;
  except
    Result := false;
    Application.MessageBox('Falha no envio, verifique a configuração!', 'Erro',
      MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
    Cancel;
    exit;
  end;
  Result := true;
end;

function TBoleto.enviarBoletoPorEmailOS(
	pNumDoc: Integer;
  pTipoDoc: string;
  pImprimir: boolean;
  pEnviar: boolean;
  pArrayAplicativo: arrayaplicativo;
  pArrayContato: arraycontato;
  pOrigem: TOrigemEnv;
  pConfEmailWhatsApp: boolean): boolean;
var
  vListaAnexos: TStringList;
  separaboletos: Boolean;
  fone: string;
  vCodCliente: Integer;
  vNomeCliente: string;
  vContatoCliente: string;
  vFormId: Integer;
  I, J, K: Integer;
  vAssunto, vMensagem: string;
  vAssuntoEmail, vMensagemEmail: string;
  vAssuntoWhatsApp, vMensagemWhatsApp: string;
  vAplicativo: TAplicativoEnv;
  vArrayContato: arraycontato;
  vArrayClientes: ArrayInts;
  vCodClienteTmp: Integer;
begin
   Result := False;

   try
			separaboletos := TConfig_sistema_class.getConf('emp_unico_anexo_por_email', buscas, vDadosIni.cod_empresa)
       .ReadString('Conf_Boletos_Avulsos', 'Ativo') = 'S';

     vListaAnexos := TStringList.Create;
     vListaAnexos.Clear;

     try
       vArrayClientes := ObBoleto.GetArrayDistinctInts('cod_cliente', True, True, '');
       vCodClienteTmp := vDadosIni.IfThen(Length(vArrayClientes) > 1, 0, vArrayClientes[0]);
     finally
       SetLength(vArrayClientes, 0);
     end;
     
     try
       dataSet.DisableControls;
       dataSet.First;
       while not dataSet.Eof do
       begin
         vListaAnexos.Add(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + dataSet.FieldByName('N_SEQ_BOL').AsString + '.pdf');

         dataSet.Next;
       end;
     finally
       dataSet.First;
       dataSet.EnableControls;
     end;

     try
       vAssuntoEmail := vDadosIni.vBoletos.vAssunto_bol;
       vMensagemEmail := vDadosIni.vBoletos.vMsg_bol.Text;
       vAssuntoWhatsApp := vDadosIni.vBoletos.vAssuntoWhatsApp_bol;
       vMensagemWhatsApp := vDadosIni.vBoletos.vMsgWhatsApp_bol.Text;

       if pConfEmailWhatsApp then
         if not abreFormConfEmail(pArrayAplicativo, pArrayContato, pEnviar) then
          Exit;

       if (pEnviar) then
       begin
         if Length(pArrayContato) > 0 then
         begin
           for K := 0 to Length(pArrayContato) - 1 do
           begin
             vDadosIni.retornaMensagemEnv(pOrigem, pArrayContato[K].Aplicativo, vAssunto, vMensagem);
                                  
             try
               if not vDadosIni.EnvEmail(
                 vAssunto,
                 vMensagem,
                 vCodClienteTmp,
                 pArrayContato[K].Aplicativo,
                 IntToStr(pNumDoc),
                 pTipoDoc,
                 cBoleto,
                 vListaAnexos.Text,
                 vListaAnexos.Count,
                 True,
                 pArrayContato[K].Identificacao,
                 pArrayContato[K].Contato,
                 pArrayContato[K].Avulso,
                 separaboletos) then
               begin
                 Application.MessageBox(PChar('Falha ao enviar ' + LowerCase(AplicativoEnvStr[pArrayContato[K].Aplicativo]) + ' para ' + trim(pArrayContato[K].Identificacao) + '.'), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
               end;
             except
               Application.MessageBox(PChar('Falha ao enviar ' + LowerCase(AplicativoEnvStr[pArrayContato[K].Aplicativo]) + ' para ' + trim(pArrayContato[K].Identificacao) + '.'), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
             end;
           end;
         end
         else
         begin
           for vAplicativo in pArrayAplicativo do
           begin
             vDadosIni.retornaMensagemEnv(pOrigem, vAplicativo, vAssunto, vMensagem);

             vArrayContato := vDadosIni.retornaArrayContato(dataSet.FieldByName('COD_CLIENTE').AsInteger, vAplicativo, pOrigem, False);

             for K := 0 to Length(vArrayContato) - 1 do
             begin
               try
                 if not vDadosIni.EnvEmail(
                   vAssunto,
                   vMensagem,
                   vCodClienteTmp,
                   vArrayContato[K].Aplicativo,
                   IntToStr(pNumDoc),
                 	 pTipoDoc,
                   cBoleto,
                   vListaAnexos.Text,
                   vListaAnexos.Count,
                   True,
                   vArrayContato[K].Identificacao,
                   vArrayContato[K].Contato,
                   vArrayContato[K].Avulso,
                   separaboletos) then
                 begin
                   Application.MessageBox(PChar('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[K].Aplicativo]) + ' para ' + trim(vArrayContato[K].Identificacao) + '.'), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
                 end;
               except
                 Application.MessageBox(PChar('Falha ao enviar ' + LowerCase(AplicativoEnvStr[pArrayContato[K].Aplicativo]) + ' para ' + trim(vArrayContato[K].Identificacao) + '.'), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
               end;
             end;
           end;
         end;
       end;
     finally
       vDadosIni.vBoletos.vAssunto_bol := vAssuntoEmail;
       vDadosIni.vBoletos.vMsg_bol.Text := vMensagemEmail;
       vDadosIni.vBoletos.vAssuntoWhatsApp_bol := vAssuntoWhatsApp;
       vDadosIni.vBoletos.vMsgWhatsApp_bol.Text := vMensagemWhatsApp;
     end;

     Result := True;
   finally
     try
       dataSet.DisableControls;
       dataSet.First;
       while not dataSet.Eof do
       begin
         dataSet.Edit;

         for K := 0 to Length(pArrayContato) - 1 do
           if pArrayContato[I].Aplicativo = cEmail then
           begin
             dataSet.FieldByName('ENV_EMAIL_BOL').AsString := 'S';
             dataSet.FieldByName('DATA_EMAIL_BOL').AsDateTime := Date;
             dataSet.FieldByName('COD_US_EMAIL_BOL').AsInteger := vDadosIni.vCodUsuario;
             Break;
           end;

         for K := 0 to Length(pArrayContato) - 1 do
           if pArrayContato[I].Aplicativo = cWhatsApp then
           begin
             dataSet.FieldByName('ENV_WHATSAPP_BOL').AsString := 'S';
             dataSet.FieldByName('DATA_WHATSAPP_BOL').AsDateTime := Date;
             dataSet.FieldByName('COD_US_WHATSAPP_BOL').AsInteger := vDadosIni.vCodUsuario;
             Break;
           end;

         dataSet.Post;

         try
           if FileExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + dataSet.FieldByName('N_SEQ_BOL').AsString + '.pdf') then
             DeleteFile(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + dataSet.FieldByName('N_SEQ_BOL').AsString + '.pdf');
         except
         end;

         dataSet.Next;
       end;
     finally
       dataSet.First;
       dataSet.EnableControls;
     end;
//     Result := Apply;
   end;
end;

function TBoleto.GerarArquivoRemessa: boolean;
var
  vCodCBX, vCodCarga, I: integer;
  vSeqArquivo: Integer;
  vDataAtual: TDate;
  BoletoSelectionado: integer;
  vTmpCarga: string;
  vCorrRemessa: string;
  Aconf: TConfig_sistema_class;
  AtivarConfiguracoesImporRet: string;
  DesconsiderarDigVerImpBoletoR: string;
  vAtivarConfiguracoesRemessaGeral, vExtensaoArquivoRemessa: string;
  vOrigemArq, vDestinoArq: string;
  Arq: TextFile;
  linha: string;
  vlistaLicenca: TStringList;
  ImageLogo, ImageBanco: TImage;
	MemoryStreamLogo, MemoryStreamBanco: TMemoryStream;
  ids: array of Integer;
  ids2: array of Integer;
begin
  try
  	Result := False;

		vDadosIni.logsBoleto(Self.ClassName + '.GerarArquivoRemessa - begin', 'boleto');

    dataSet.Filter := 'SelecionaBoleto = ''S''';
    dataSet.Filtered := True;

  {Inicio - 1 Checagem dos campos para gerar a remessa}

    {1}if frmCadBoletos = nil then
      exit;

    vCodCBX := -1;
    vTmpCarga :='';

    vCorrRemessa := vCobreBem.dataSet.FieldByName('CORR_REMESSA').AsString;

    vTemPath := vCobreBem.dataSet.FieldByName('ENDERECOREMESSARETORNO').AsString;
    //vTemPath := StringReplace(vTemPath, '\\', '\', [rfReplaceAll]);

    {1}if DirectoryExists(vTemPath) then
    begin
      {2}if not DirectoryExists(vTemPath + 'REMESSA\') then
        CreateDir(vTemPath + 'REMESSA\')
    end
    else {1}
    begin
      Result := False;
      Application.MessageBox(pchar('Diretório não existe para gerar arquivo de remessa.' + #13 +
        vTemPath + #13 +
        'Favor verificar'), 'Atenção', 0 + 64);

      if Application.MessageBox('Diretório para arquivo de remessa não encontrado, deseja informar outro?',
      	'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
      	exit;
    
      vTemPath := '';
      SelectDirectory('Selecionar Pasta', '', vTemPath);

      if trim(vTemPath) = '' then
      begin
        Application.MessageBox(pchar('Diretório para arquivo de remessa não informado.' + #13 +
  	      'Favor verificar'), 'Atenção', 0 + 64);
        exit;
      end
      else if (Length(vTemPath) > 128) then
      begin
        Application.MessageBox(pchar('Diretório para arquivo de remessa está muito longo, selecione outro diretório.' + #13 +
	        vTemPath + #13 +
  	      'Favor verificar'), 'Atenção', 0 + 64);
        exit;
      end;
      vTemPath := vTemPath + '\';

    	if (Pos('\REMESSA\', UpperCase(vTemPath)) > 0) then
	      vTemPath := Copy(vTemPath, 1, Pos('\REMESSA\', UpperCase(vTemPath)));

      if not DirectoryExists(vTemPath) then
      begin
        Application.MessageBox(pchar('Diretório não existe para gerar arquivo de remessa.' + #13 +
	        vTemPath + #13 +
  	      'Favor verificar'), 'Atenção', 0 + 64);
        exit;
      end;

      if not DirectoryExists(vTemPath + 'REMESSA\') then
        CreateDir(vTemPath + 'REMESSA\');
    end; {1}
    BoletoSelectionado := 0;
    try
      dataSet.DisableControls;
      dataSet.First;
      {w - 1}while not dataSet.Eof do
      begin
        Application.ProcessMessages;
        if (vAbortar) then
        begin
          Application.MessageBox(pchar('Operação paralizada.' + #13 +
            ''), 'Atenção', 0 + 64);
          Result := false;
          exit;
        end;
        {2}if dataSet.FieldByName('SelecionaBoleto').Value = 'S' then
        begin
          BoletoSelectionado := 1;
          {3}if vCodCBX = -1 then
          begin
            vCodCBX := dataSet.FieldByName('COD_COBREBEM').AsInteger;
            {4}if not vCobreBem.abreCobreBem(dataSet.FieldByName('COD_COBREBEM').AsString) then
            begin
              Result := false;
              Application.MessageBox(pchar('Configuração de convênio não encontrada.' + #13 +
              	'Não pode gerar remessa deste boleto.' + #13 +
                'Favor verificar'), 'Atenção', 0 + 64);
              exit;
            end; {4}
          end; {3}

          {3}if dataSet.FieldByName('COD_COBREBEM').AsInteger = 0 then
          begin
            Result := false;
            Application.MessageBox(pchar('Existe(m) boleto(s) sem convênio definido.' + #13 +
              'A remessa só poderá ser gerada somente quando todos boletos forem definidos.' + #13 +
              'Favor verificar'), 'Atenção', 0 + 64);
            exit;
          end; {3}

          {4}if dataSet.FieldByName('COD_COBREBEM').AsInteger > 0 then
          begin
            if vCodCBX <> dataSet.FieldByName('COD_COBREBEM').AsInteger then
            begin
              Result := false;
              Application.MessageBox(pchar('Existem boletos que foram impressos em configurações de convênio diferentes.' + #13 +
                'A remessa só poderá ser gerada para boletos de mesma configuração de conta.' + #13 +
                'Favor verificar'), 'Atenção', 0 + 64);
              exit;
            end;
        	end; {4}

          {3}if trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').asString) = '' then
          begin
            vCobreBem.abreCobreBem(IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger));
            if vCobreBem.dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString <> 'S' then
            begin
              Result := false;
              Application.MessageBox(pchar('Existe(m) boleto(s) sem nosso número.' + #13 +
                'Não pode gerar remessa deste(s) boleto(s).' + #13 +
                'Favor verificar'), 'Atenção', 0 + 64);
              exit;
            end;
          end; {3}

          {3}if dataSet.FieldByName('VIA_WS').asString = 'S' then
          begin
            Application.MessageBox(pchar('Boleto(s) registrado(s) instantaneamente via web service.' + #13 +
              'Não é necessário gerar remessa deste boleto.' + #13 +
              'Favor verificar'), 'Atenção', 0 + 64);
            exit;
          end; {3}

          {3}if (trim(dataSet.FieldByName('remessa_enviada').asString) = 'S') then
          begin
            Result := false;
            Application.MessageBox(pchar('Boleto(s) com remessa enviada.' + #13 +
            	'Não pode gerar remessa deste boleto.' + #13 +
              'Favor verificar'), 'Atenção', 0 + 64);
            exit;
          end; {3}

          {3}if (trim(dataSet.FieldByName('data_remessa').asString) <> '') then
          begin
            Result := false;
            Application.MessageBox(pchar('Boleto(s) com remessa enviada.' + #13 +
            	'Não pode gerar remessa deste boleto.' + #13 +
              'Favor verificar'), 'Atenção', 0 + 64);
            exit;
          end; {3}

          if dataSet.FieldByName('cod_carga').AsInteger > 0 then
          begin
            if (Pos('(', vTmpCarga) = 0) then
              vTmpCarga := '(' + vTmpCarga + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) + ','
            else if ((Pos('(' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger), vTmpCarga) = 0) and
                    (Pos(',' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger), vTmpCarga) = 0)) then
              vTmpCarga := vTmpCarga + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) + ',';
          end;

          Result := true;
        end; {2}
        dataSet.Next;
      end; {w - 1}
    finally
    	dataSet.First;
    	dataSet.EnableControls;
    end;

    if Trim(vTmpCarga) <> '' then
    begin
      vTmpCarga := Copy(vTmpCarga, 1, length(vTmpCarga)- 1) +')';
      buscas.Close;
      buscas.SQL.Text := 'select cod_carga, status_fin from carga' +
        ' where cod_carga in ' + vTmpCarga +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and coalesce(status_fin, '''') <> ''FECHADA''';
      buscas.Open;
      vCodCarga := buscas.FieldByName('cod_carga').AsInteger;

      if not buscas.IsEmpty then
      begin
        Result := false;

        if not vDadosIni.PesqPros('BOL031', 'REMESSA', 'CARGA: ' + IntToStr(buscas.FieldByName('cod_carga').AsInteger),
          'BOLETAS', dataSet.FieldByName('N_SEQ_BOL').AsString, buscas, true) then
        begin
          Application.MessageBox(pchar('Carga: ' + IntToStr(vCodCarga) +
            ' ainda não fechada pelo Financeiro'), 'Atenção', 0 + 64);
          exit;
        end;

        if Application.MessageBox(pchar('Carga: ' + IntToStr(vCodCarga) +
          ' ainda não fechada pelo Financeiro. Deseja continuar mesmo assim?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
          Exit;
      end;
    end;


    {1}if (BoletoSelectionado = 0) then
    begin
      Result := false;
      Application.MessageBox('Selecione o(s) boleto(s) que deseja incluir no arquivo.',
        'Atenção', MB_ICONWARNING + MB_OK + MB_DEFBUTTON1);
      exit;
    end; {1}

    {Fim - 1 Checagem dos campos para gerar a remessa}

    if vCobreBem.dataSet.FieldByName('TIPO_API').AsString <> 'S' then
	    _PassarConfiguracao(vTemPath);

    vTipoImpressao := Trim(vCobreBem.dataSet.FieldByName('TIPOIMPRESSAO').AsString);

    try
      Aconf := TConfig_sistema_class.Create;
      Aconf.value1_b.Text := vCobreBem.dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString;

      if Assigned(Aconf) then
      begin
        AtivarConfiguracoesImporRet       := Aconf.ReadString('ConfImportacaoRetorno', 'Ativar configuracoes importacao retorno (S ou N)', '');
        DesconsiderarDigVerImpBoletoR     := Aconf.ReadString('ConfImportacaoRetorno', 'Desconsiderar digito verificar ao imprimir boleto e gerar remessa (S ou N)', '');
        vAtivarConfiguracoesRemessaGeral 	:= Aconf.ReadString('ConfRemessaGeral', 'Ativar configuracoes (S ou N)', '');
        vExtensaoArquivoRemessa 			    := Aconf.ReadString('ConfRemessaGeral', 'Extensao do arquivo de remessa', '');
      end
      else
      begin
        AtivarConfiguracoesImporRet      := 'N';
        DesconsiderarDigVerImpBoletoR    := 'N';
        vAtivarConfiguracoesRemessaGeral := 'N';
        vExtensaoArquivoRemessa          := 'REM';
      end;

      if not _abreFormRemessa then
      begin
        Result := false;
        Application.MessageBox('Operação cancelada', 'Atenção', 0 + 64);
        exit;
      end;

      if vCobreBem.dataSet.FieldByName('TIPO_API').AsString = 'S' then
      begin
      	SetLength(ids, 0);
        SetLength(ids2, 0);

        if not dataSet.IsEmpty then
        begin
          try
            dataSet.DisableControls;
            dataSet.Filter := 'SelecionaBoleto = ''S''';
            dataSet.Filtered := True;

            dataSet.First;
            {w - 1}while not dataSet.Eof do
            begin
              if (dataSet.FieldByName('SelecionaBoleto').AsString = 'S')
                and (dataSet.FieldByName('COD_COBREBEM').AsInteger > 0)
                and (dataSet.FieldByName('TIPO_API').AsString = 'S')
                and (trim(dataSet.FieldByName('API_IDINTEGRACAO').AsString) <> '') then
              begin
                SetLength(ids2, Length(ids2) + 1);
                ids2[High(ids2)] := fint('n_seq_bol');
              end;

              dataSet.Next;
            end; {w - 1}
          finally
            dataSet.EnableControls;
            dataSet.Filter := '';
            dataSet.Filtered := False;
            vDadosIni.fechaStatusProcessamento;
          end;

          if Length(ids2) > 0 then
          begin
            try
              Screen.Cursor := crHourGlass;
              vDadosIni.abreStatusProcessamento('Consultando dados boleto API', 'Processando informações...');

              vDadosIni.logsBoleto(Self.ClassName + '.GerarArquivoRemessa - plugboleto_consultar', 'boleto');

              plugboleto_consultar(
				        Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10',
			                 [vDadosIni.vBancoHW, vDadosIni.codEmpresa]), ids2);

            finally
              vDadosIni.fechaStatusProcessamento;
              Screen.Cursor := crDefault;
            end;
          end;
        end;

        if not testarGerarRemessaSituacaoAPI then
        begin
        	vDadosIni.logsBoleto(Self.ClassName + '.GerarArquivoRemessa - end', 'boleto');
		    	exit;
        end;

        try
          dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
          	if (dataSet.FieldByName('SelecionaBoleto').Value = 'S')
            	and (dataSet.FieldByName('COD_COBREBEM').AsInteger > 0)
              and (dataSet.FieldByName('TIPO_API').AsString = 'S')
              and (trim(dataSet.FieldByName('API_IDINTEGRACAO').AsString) <> '') then
            begin
              SetLength(ids, Length(ids) + 1);
              ids[High(ids)] := dataSet.FieldByName('N_SEQ_BOL').AsInteger;

              vDadosIni.GravaAuditoria(
                'BOL013',
                'REMESSA',
                dataSet.FieldByName('N_DOC_BOL').AsString + ' | ' +
                vDadosIni.IfThen(trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString) <> '',
                  trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString),
                  trim(dataSet.FieldByName('API_NOSSONUMERO').AsString)),
                'BOLETAS',
                dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);
            end;

            dataSet.Next;
          end;
        finally
        	dataSet.First;
		      dataSet.EnableControls;
        end;

        if Length(ids) > 0 then
        begin
        	try
          	Screen.Cursor := crHourGlass;
          	vDadosIni.abreStatusProcessamento('Gerando remessa', 'Processando informações...');

            vDadosIni.logsBoleto(Self.ClassName + '.GerarArquivoRemessa - plugboleto_remessa', 'boleto');

            plugboleto_remessa(
              Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10',
                     [vDadosIni.vBancoHW, vDadosIni.codEmpresa]), ids, vTemPath);
          finally
          	vDadosIni.fechaStatusProcessamento;
            Screen.Cursor := crDefault;
	        end;
        end;
      end
      else
      begin
      	try
          Screen.Cursor := crHourGlass;
          vDadosIni.abreStatusProcessamento('Gerando remessa', 'Processando informações...');
          {1}if _AdicionarBoleto then
          begin
            if vCobreBem.dataSet.FieldByName('MULTAS').AsFloat <= 0 then
              CobreBemX.ArquivoRemessa.NaoGerarRegistroDetalhe3 := true
            else
              CobreBemX.ArquivoRemessa.NaoGerarRegistroDetalhe3 := false;

            CobreBemX.ArquivoRemessa.Sequencia :=
              vCobreBem.dataSet.FieldByName('SEQUENCIA_REMESSA').AsInteger;

            if vIndicadorImpressao <> 1 then
              CobreBemX.ArquivoRemessa.TipoImpressao := vTipoImpressao;

            if (AtivarConfiguracoesImporRet = 'S') and (DesconsiderarDigVerImpBoletoR = 'S') then
              for I := 0 to CobreBemX.DocumentosCobranca.Count - 1 do
                CobreBemX.DocumentosCobranca[I].NossoNumero :=
                  Copy(CobreBemX.DocumentosCobranca[I].NossoNumero, 1 , Length(CobreBemX.DocumentosCobranca[I].NossoNumero) - 1);

            CobreBemX.GravaArquivoRemessa;

            vDataAtual := vDadosIni.getDataBanco(buscas);
            dataset.IndexFieldNames := '';
            try
              dataSet.DisableControls;
              dataSet.First;
              dataSet.RecordCount;
              {w - 1}while not dataSet.Eof do
              begin
                if (vAbortar) then
                begin
                  Application.MessageBox(pchar('Operação paralizada.' + #13 +
                    ''), 'Atenção', MB_ICONWARNING + MB_OK + MB_DEFBUTTON1);
                  Result := false;
                  exit;
                end;
                {2}if dataSet.FieldByName('SelecionaBoleto').Value = 'S' then
                begin
                  {3}for I := 0 to CobreBemX.DocumentosCobranca.Count - 1 do
                  begin
                    {4}if CobreBemX.DocumentosCobranca[I].MinhaChave =
                      dataSet.FieldByName('N_SEQ_BOL').asString then
                    begin
                      dataSet.Edit;
                      dataSet.FieldByName('COD_SEQ_REMESSA').AsInteger :=
                        vCobreBem.dataSet.FieldByName('SEQUENCIA_REMESSA').AsInteger;
                      dataSet.FieldByName('TIPOIMPRESSAO').AsString :=
                        vCobreBem.dataSet.FieldByName('TIPOIMPRESSAO').AsString;
                      dataSet.FieldByName('DATA_REMESSA').AsDateTime := vDataAtual;
                      dataSet.FieldByName('REMESSA_ENVIADA').AsString := 'S';
                      dataSet.Post;

                      vDadosIni.GravaAuditoria(
                        'BOL013',
                        'REMESSA',
                        dataSet.FieldByName('N_DOC_BOL').AsString + ' | ' +
                        vDadosIni.IfThen(trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString) <> '',
                          trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString),
                          trim(dataSet.FieldByName('API_NOSSONUMERO').AsString)),
                        'BOLETAS',
                        dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);
                      vVerificarComitar := true;
                      //  if Apply then
                       //   CommitaTransacao
                       // else
                      //  begin
                       //   Cancel;
                       //   RollBackTransacao;
                       // end;
                    end; {4}
                  end; {3}
                end; {2}
                dataSet.Next;
              end; {w - 1}
            finally
              dataSet.First;
              dataSet.EnableControls;
            end;
            vCobreBem.Edit;
            vCobreBem.dataSet.FieldByName('SEQUENCIA_REMESSA').AsInteger :=
              vCobreBem.dataSet.FieldByName('SEQUENCIA_REMESSA').AsInteger + 1;

            // Salvar licença cobrebem no BD
            if (trim(vCobreBem.dataSet.FieldByName('LICENCA').AsString) = '') then
            begin
              if (trim(vCobreBem.dataSet.FieldByName('ARQUIVOLICENCA').asString) <> '')
                and (FileExists(trim(vCobreBem.dataSet.FieldByName('ARQUIVOLICENCA').AsString))) then
              begin
                try
                  vlistaLicenca := TStringList.Create;
                  vlistaLicenca.Clear;
                  // Lendo arquivo
                  AssignFile(arq, trim(vCobreBem.dataSet.FieldByName('ARQUIVOLICENCA').asString));
                  Reset(arq);
                  while not System.Eof(arq) do
                  begin
                    Readln(arq, linha);
                    vlistaLicenca.Add(linha);
                  end;
                  vCobreBem.dataSet.FieldByName('LICENCA').AsString := vlistaLicenca.Text;
                finally
                  closeFile(arq);
                  if Assigned(vlistaLicenca) then
                    vlistaLicenca.Free;
                end;
              end;
            end;

            // Salvar logotipo do cobrebem no BD
            if (trim(vCobreBem.dataSet.FieldByName('LOGOTIPO').asString) = '') then
            begin
              if (trim(vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').asString) <> '')
                and (FileExists(trim(vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').AsString))) then
              begin
                vCobreBem.dataSet.FieldByName('LOGOTIPO').AsString :=
                  _strImagetoBase64(trim(vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').AsString));
              end;
            end;

            // Salvar logobanco do cobrebem no BD
            if (trim(vCobreBem.dataSet.FieldByName('LOGOBANCO').asString) = '') then
            begin
              if (trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').asString) <> '')
                and (FileExists(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\' + trim(vCobreBem.dataSet.FieldByName('BANCO').AsString) + '.jpg')) then
              begin
                vCobreBem.dataSet.FieldByName('LOGOBANCO').AsString :=
                  _strImagetoBase64(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\' +
                    trim(vCobreBem.dataSet.FieldByName('BANCO').AsString) + '.jpg');
              end;
            end;

            // Salvar codbarras_a do cobrebem no BD
            if (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_A').asString) = '') then
            begin
              if (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_A').AsString) = '')
                and (trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').asString) <> '')
                and (FileExists(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\a.gif')) then
              begin
                vCobreBem.dataSet.FieldByName('CODBARRAS_A').AsString :=
                  _strImagetoBase64(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\a.gif');
              end;
            end;

            // Salvar codbarras_b do cobrebem no BD
            if (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_B').asString) = '') then
            begin
              if (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_B').AsString) = '')
                and (trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').asString) <> '')
                and (FileExists(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\b.gif')) then
              begin
                vCobreBem.dataSet.FieldByName('CODBARRAS_B').AsString :=
                  _strImagetoBase64(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\b.gif');
              end;
            end;

            // Salvar codbarras_c do cobrebem no BD
            if (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_C').asString) = '') then
            begin
              if (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_C').AsString) = '')
                and (trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').asString) <> '')
                and (FileExists(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\c.gif')) then
              begin
                vCobreBem.dataSet.FieldByName('CODBARRAS_C').AsString :=
                  _strImagetoBase64(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\c.gif');
              end;
            end;

            // Salvar codbarras_d do cobrebem no BD
            if (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_D').asString) = '') then
            begin
              if (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_D').AsString) = '')
                and (trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').asString) <> '')
                and (FileExists(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\d.gif')) then
              begin
                vCobreBem.dataSet.FieldByName('CODBARRAS_D').AsString :=
                  _strImagetoBase64(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\d.gif');
              end;
            end;

            vCobreBem.dataset.Post;
            vCobreBem.Apply;

      //      if trim(vCorrRemessa) = 'S' then
            AlterDadosRemessa(
              vTemPath + 'REMESSA\' + CobreBemX.ArquivoRemessa.Arquivo,
              CobreBemX.NomeCedente,
              CobreBemX.CnpjCpfCedente);
            SalvarDadosRemessa(
              vTemPath + 'REMESSA\' + CobreBemX.ArquivoRemessa.Arquivo);

            try
              if (trim(vAtivarConfiguracoesRemessaGeral) = 'S') and (trim(vExtensaoArquivoRemessa) <> '')
                and (vDadosIni.apenasLetraseNumeros(UpperCase(trim(vExtensaoArquivoRemessa))) <> 'REM') then
              begin
                vOrigemArq := vCobreBem.dataSet.FieldByName('ENDERECOREMESSARETORNO').AsString + 'REMESSA\' + CobreBemX.ArquivoRemessa.Arquivo;
                vDestinoArq := vCobreBem.dataSet.FieldByName('ENDERECOREMESSARETORNO').AsString + 'REMESSA\' +
                  StringReplace(CobreBemX.ArquivoRemessa.Arquivo, ExtractFileExt(CobreBemX.ArquivoRemessa.Arquivo), '', [rfReplaceAll]) +
                  '.' + vDadosIni.apenasLetraseNumeros(trim(vExtensaoArquivoRemessa));

                if FileExists(vOrigemArq) then
                begin
                  RenameFile(vOrigemArq, vDestinoArq);

                  if not FileExists(vDestinoArq) then
                    Application.MessageBox(PChar('Não foi possível renomear a remessa.' + #13 +
                      'De: ' + vOrigemArq + #13 +
                      'Para:' + vDestinoArq), 'Atenção', MB_ICONERROR + MB_OK);
                end;
              end;
            except on E: Exception do
              begin
                Result := False;
                Application.MessageBox(PChar('Erro ao renomear arquivo de remessa.' + #13 +
                  'De: ' + vOrigemArq + #13 +
                  'Para: ' + vDestinoArq + ' ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
                registraErro('Erro ao renomear arquivo de remessa.' + #13 +
                  'De: ' + vOrigemArq + #13 +
                  'Para: ' + vDestinoArq + ' ' + e.Message);
              end;
            end;

            vVerificarComitar := true;
            Result := True;
          end
          else {1}
          begin
            Result := false;
            exit;
          end; {1}
        finally
          vDadosIni.fechaStatusProcessamento;
           Screen.Cursor := crDefault;
        end;
      end;
    finally
    	if Assigned(Aconf) then
      	FreeAndNil(Aconf);
    end;
  finally
    CobreBemX := Unassigned;
    criaBoletoCobreBemX;
    dataSet.Filter := '';
    dataSet.Filtered := False;
    vDadosIni.logsBoleto(Self.ClassName + '._GerarBoletosPlugBoletos - end', 'boleto');
  end;
end;

function TBoleto.GetBoletosMesmoDocumento: TDataSet_OOP;
begin
  Result := TDataSet_OOP.Create(dtmAtivo.bancoHw);

  if dataSet.State <> dsEdit then
    Exit;

  if str_empty('tipo_emissao') then
    Exit;

  Result.montaSelect('select data_ven_bol data_vencimento, n_doc_bol num_doc, vl_doc_bol valor,' +
                     ' data_em_bol data_emissao, cod_cliente, localpag local_pagamento, m_dia_bol mora,' +
                     ' mult_atr_bol multa, dias_protesto, obs_bol obs_demostrativo, obs_bol1 obs_instrucoes_caixa,' +
                     ' mensagem_adc mensagem_adicional, n_seq_bol id' +
                     ' from boletas' +
                     ' where num_nf_vnd = %d and sub_serie = %d and tipo_emissao = %s and cod_empresa = %d' +
                     ' and n_seq_bol <> %d and coalesce(status, '''') <> ''QUITADO''' +
                     ' order by data_ven_bol',
                     [fint('num_nf_vnd'), fint('sub_serie'), fstrq('tipo_emissao'), fint('cod_empresa'), fint('n_seq_bol')]);
end;

function TBoleto.HandleBoletos: RBoletosSelecionados;
var
  itemConvenio: TItemConvenio;
  I: Integer;
  JaExiste: Boolean;
  detalhes: string;
  convenioArquivos: array of Integer;
  convenioAPI: array of Integer;
begin
	try
    SetLength(Result.lista, 0);
    SetLength(convenioAPI, 0);
    SetLength(convenioArquivos, 0);
    Result.Erros := '';
    Result.ConvenioId := 0;

    try
      dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if fequals('SelecionaBoleto', 'S') then
        begin
          if fequals('NF_AUT', 'N') and fequals('TIPO_EMISSAO', 'NF') and (fint('NUM_NF_VND') > 0) then
            Result.Erros := Result.Erros + IfThen(Result.Erros <> '', sLineBreak + '--' + sLineBreak) +
                            Format('Nota Fiscal não autorizada, favor enviar antes de realizar a impressão do boleto!' + sLineBreak +
                                   'NF: %d - Num Doc: %s - Valor: %m' + sLineBreak +
                                   'Cliente: %s',
                                   [fint('NUM_NF_VND'), fstr('N_DOC_BOL'), ffloat('VL_DOC_BOL'), fstr('NOME_CLIENTE')])
          else
          begin
            if fint('cod_cobrebem') = 0 then
            begin
              SetLength(Result.lista, Length(Result.lista) + 1);
              Result.lista[High(Result.lista)] := fint('n_seq_bol');
            end
            else
            begin
              itemConvenio := vCobreBem.Items[fint('cod_cobrebem')];
              detalhes := Format('Boleto Num Doc: %s - Valor: %m' + sLineBreak +
                                 'Cliente: %s', [fstr('n_doc_bol'), ffloat('vl_doc_bol'), fstr('nome_cliente')]);

              if (itemConvenio.Tipo = tcVazio) then
                Result.Erros := Result.Erros + IfThen(Result.Erros <> '', sLineBreak + '--' + sLineBreak) + detalhes +
                                ' já foi emitido, porém sua configuração de Convênio está inativa'

              else if fequals('tipo_api', 'S') then// and fempty('api_situacao') then
              begin
                SetLength(convenioAPI, Length(convenioAPI) + 1);
                convenioAPI[High(convenioAPI)] := fint('n_seq_bol');
              end
              else
              begin
                SetLength(convenioArquivos, Length(convenioArquivos) + 1);
                convenioArquivos[High(convenioArquivos)] := fint('n_seq_bol');
                
                if Result.ConvenioId = 0 then
                  Result.ConvenioId := fint('cod_cobrebem')
                else if Result.ConvenioId <> fint('cod_cobrebem') then
                  Result.Erros := Result.Erros + IfThen(Result.Erros <> '', sLineBreak + '--' + sLineBreak) + detalhes +
                                  ' com configuração de convênio diferente. ' +
                                  'Seleciona boletos de mesma configuração';
              end;
            end;
          end;

        end;
        dataSet.Next;
      end;
    finally
      dataSet.First;
      dataSet.EnableControls;
    end;

    if (Length(convenioArquivos) > 0) and
      (Length(convenioAPI) > 0) then
      Result.Erros := Result.Erros + IfThen(Result.Erros <> '', sLineBreak + '--' + sLineBreak) +
                      'Existem boletos selecionados usando configuração de convênio via Arquivo e via API. ' +
                      'Por favor selecione 1 tipo de cada vez para continuar'
    else if (Length(convenioAPI) > 0) then
      for I := Low(convenioAPI) to High(convenioAPI) do
      begin
        SetLength(Result.lista, Length(Result.lista) + 1);
        Result.lista[High(Result.lista)] := convenioAPI[I];
      end;
  except on E: Exception do
    begin
      Application.MessageBox(PChar('Erro ao selecionar boletos: ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('function TBoleto.HandleBoletos. Erro: ' + e.Message);
    end;
  end;
end;

function TBoleto.ImprimeBoletoPreImpresso: boolean;
var
  vcoduf, I, ln, cont: integer;
  vValor: Currency;
begin
  try

    vConfigBol.buscas.close;
    vConfigBol.buscas.SQL.Clear;
    vConfigBol.buscas.SQL.Add('SELECT CB.Cod_Banco, CB.Ordem_Blt, CB.Cont_Int_Blt,' +
      'CB.Desc_Blt, CB.Linha_Blt, CB.Coluna_Blt,' +
      'CB.condensado,CB.negrito,B.Cod_Banco,' +
      'B.Desc_Banco FROM Config_Bol CB INNER JOIN ' +
      'Codigo_Banco B ON (B.Cod_Banco = CB.Cod_Banco) ' +
      'WHERE CB.COD_BANCO = ' + vBanco.dataSet.FieldByName('Cod_Banco').asString +
      'order by CB.Cod_Banco, CB.Ordem_Blt, CB.Cont_Int_Blt');
    vConfigBol.buscas.Open;

    if vCamposBol.dataSet.RecordCount = 0 then
    begin
      Application.MessageBox('Erro no Arquivo de Configuração' + chr(13) +
        'Configurações não Encontradas',
        'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      Abort;
    end
    else
    begin
      frmCadBoletos.RDprint1.TamanhoQteLinhas := 500;
      frmCadBoletos.RDprint1.PortaComunicacao :=
        vBanco.dataSet.FieldByName('PORTA_IMPRESSAO').AsString;

      DtmBoletos.qrBuscas.Close;
      DtmBoletos.qrBuscas.Sql.Clear;
      DtmBoletos.qrBuscas.Sql.Add('Select TAMANHOLETRA from Empresa where cod_Empresa = ' +
        vDadosIni.codEmpresa + '');
      DtmBoletos.qrBuscas.Open;
      if not DtmBoletos.qrBuscas.IsEmpty then
      begin
        if DtmBoletos.qrBuscas.FieldByName('TAMANHOLETRA').asString = 'S05cpp' then
          frmCadBoletos.RDprint1.FonteTamanhoPadrao := S05cpp;
        if DtmBoletos.qrBuscas.FieldByName('TAMANHOLETRA').AsString = 'S10cpp' then
          frmCadBoletos.RDprint1.FonteTamanhoPadrao := S10cpp;
        if DtmBoletos.qrBuscas.FieldByName('TAMANHOLETRA').AsString = 'S12cpp' then
          frmCadBoletos.RDprint1.FonteTamanhoPadrao := S12cpp;
        if DtmBoletos.qrBuscas.FieldByName('TAMANHOLETRA').AsString = 'S17cpp' then
          frmCadBoletos.RDprint1.FonteTamanhoPadrao := S17cpp;
        if DtmBoletos.qrBuscas.FieldByName('TAMANHOLETRA').AsString = 'S20cpp' then
          frmCadBoletos.RDprint1.FonteTamanhoPadrao := S20cpp;
      end;

      frmCadBoletos.RDprint1.Abrir;
      if vBanco.dataSet.FieldByName('ENTRELINHAS').AsString = 'Linha 1/8"' then
        frmCadBoletos.RDPrint1.Imp(1, 1, chr(27) + '0')
      else
        if vBanco.dataSet.FieldByName('ENTRELINHAS').AsString = 'Linha 7/72"' then
          frmCadBoletos.RDPrint1.Imp(1, 1, chr(27) + '1')
        else
          if vBanco.dataSet.FieldByName('ENTRELINHAS').AsString = 'Linha 1/6"' then
            frmCadBoletos.RDPrint1.Imp(1, 1, chr(27) + '2')
          else
            if vBanco.dataSet.FieldByName('ENTRELINHAS').AsString = '' then
              frmCadBoletos.RDprint1.Imp(1, 1, chr(27) + chr(64));

      ln := 0;
      try
      	dataSet.DisableControls;
        dataSet.First;
        while not dataSet.EOF do
        begin
          if dataSet.FieldByName('SelecionaBoleto').Value = 'S' then
          begin
            Tabela := '';
            vCamposBol.dataSet.First;
            while not vCamposBol.dataSet.Eof do
            begin
              if vConfigBol.dataSet.Locate('ORDEM_BLT',
                vCamposBol.dataSet.FieldByName('NORDEM_CAMP').asString, []) then
              begin
                if Copy(vCamposBol.dataSet.FieldByName('TABELA').asString, 1, 3) <> 'FK_' then
                begin
                  for I := 0 to dataSet.FieldCount - 1 do
                  begin
                    if dataSet.Fields[I].FieldName =
                      vCamposBol.dataSet.FieldByName('DESCRICAO_CAMP').asString then
                    begin
                      if (dataSet.Fields[I].FieldName = 'M_DIA_BOL') or (dataSet.Fields[I].FieldName =
                        'MULT_ATR_BOL') then
                      begin
                        if vConfigBol.dataSet.FieldByName('CONDENSADO').asInteger = 1 then
                          if dataSet.Fields[I].FieldName = 'M_DIA_BOL' then
                          begin
                            vValor := 0;
                            vValor := ((dataSet.FieldByName('M_DIA_BOL').Value *
                              dataSet.FieldByName('VL_DOC_BOL').Value) / 100);
                            frmCadBoletos.RDprint1.Imp(ln +
                              vConfigBol.dataSet.FieldByName('LINHA_BLT').Value,
                              vConfigBol.dataSet.FieldByName('COLUNA_BLT').Value, chr(15) +
                              'MORA DIARIA :' + format('%m', [vValor]) + chr(18));
                            ln := ln + vConfigBol.dataSet.FieldByName('LINHA_BLT').Value;
                          end
                          else
                          begin
                            vValor := 0;
                            vValor := ((dataSet.FieldByName('MULT_ATR_BOL').Value *
                              dataSet.FieldByName('VL_DOC_BOL').Value) / 100);
                            frmCadBoletos.RDprint1.Imp(ln +
                              vConfigBol.dataSet.FieldByName('LINHA_BLT').Value,
                              vConfigBol.dataSet.FieldByName('COLUNA_BLT').Value, chr(15) +
                              'MULTA POR ATRASO ' + format('%m', [vValor]) + chr(18));
                            ln := ln + vConfigBol.dataSet.FieldByName('LINHA_BLT').Value;
                          end
                        else
                          if dataSet.Fields[I].FieldName = 'M_DIA_BOL' then
                          begin
                            vvalor := 0;
                            vValor := ((dataSet.FieldByName('M_DIA_BOL').Value *
                              dataSet.FieldByName('VL_DOC_BOL').Value) / 100);
                            frmCadBoletos.RDprint1.Imp(ln +
                              vConfigBol.dataSet.FieldByName('LINHA_BLT').Value,
                              vConfigBol.dataSet.FieldByName('COLUNA_BLT').Value, 'MORA DIARIA :' +
                              format('%m', [vValor]));
                            ln := ln + vConfigBol.dataSet.FieldByName('LINHA_BLT').Value;
                          end
                          else
                          begin
                            vvalor := 0;
                            vvalor := ((dataSet.FieldByName('MULT_ATR_BOL').Value *
                              dataSet.FieldByName('VL_DOC_BOL').Value) / 100);
                            frmCadBoletos.RDprint1.Imp(ln +
                              vConfigBol.dataSet.FieldByName('LINHA_BLT').Value,
                              vConfigBol.dataSet.FieldByName('COLUNA_BLT').Value, 'MULTA POR ATRASO '
                              +
                              format('%m', [vvalor]));
                            ln := ln + vConfigBol.dataSet.FieldByName('LINHA_BLT').Value;
                          end;
                      end
                      else
                      begin
                        if vConfigBol.dataSet.FieldByName('CONDENSADO').asInteger = 1 then
                        begin
                          frmCadBoletos.RDprint1.Imp(ln +
                            vConfigBol.dataSet.FieldByName('LINHA_BLT').Value,
                            vConfigBol.dataSet.FieldByName('COLUNA_BLT').Value, chr(15) +
                            dataSet.Fields[I].Text + chr(18));
                          ln := ln + vConfigBol.dataSet.FieldByName('LINHA_BLT').Value;
                        end
                        else
                        begin

                          frmCadBoletos.RDprint1.Imp(ln +
                            vConfigBol.dataSet.FieldByName('LINHA_BLT').Value,
                            vConfigBol.dataSet.FieldByName('COLUNA_BLT').Value,
                            dataSet.Fields[I].Text);
                          ln := ln + vConfigBol.dataSet.FieldByName('LINHA_BLT').Value;
                        end;
                      end;
                    end;
                  end;
                end
                else
                begin

                  if Copy(vCamposBol.dataSet.FieldByName('TABELA').AsString, 1, 3) = 'FK_' then
                  begin
                    DtmBoletos.qrimpressao.Close;
                    DtmBoletos.qrimpressao.SQL.Text := '';
                    DtmBoletos.qrimpressao.SQL.Clear;
                    try
                      DtmBoletos.qrimpressao.SQL.Text := 'SELECT * FROM ' +
                        Copy(vCamposBol.dataSet.FieldByName('TABELA').asString, 4,
                        Length(vCamposBol.dataSet.FieldByName('TABELA').asString)) +
                        ' WHERE COD_EMPRESA = :COD_EMPRESA AND ATIVO = 1';

                      DtmBoletos.qrimpressao.Params[0].Text := vDadosIni.codEmpresa;

                      DtmBoletos.qrimpressao.Open;
                    except
                      begin
                        DtmBoletos.qrimpressao.SQL.Text := 'SELECT * FROM ' +
                          Copy(vCamposBol.dataSet.FieldByName('TABELA').asString, 4,
                          Length(vCamposBol.dataSet.FieldByName('TABELA').asString));
                        DtmBoletos.qrimpressao.Open;
                      end;
                    end;

                    if vCamposBol.dataSet.FieldByName('TABELA').asString = 'FK_CLIENTES' then
                    begin
                      DtmBoletos.qrimpressao.CLOSE;
                      DtmBoletos.qrimpressao.SQL.Text := 'SELECT * FROM ' +
                        Copy(vCamposBol.dataSet.FieldByName('TABELA').asString, 4,
                        Length(vCamposBol.dataSet.FieldByName('TABELA').asString)) +
                        ' where cod_cliente = :vcod and cod_empresa = :cod_empresa and ativo=1';
                      DtmBoletos.qrimpressao.Params[0].asstring :=
                        dataSet.fieldbyname('COD_CLIENTE').asString;
                      DtmBoletos.qrimpressao.Params[1].Text := vDadosIni.codEmpresa;
                      DtmBoletos.qrimpressao.open;
                      vcoduf := DtmBoletos.qrimpressao.fieldbyname('est_codigo_uf').asinteger;
                    end;

                    if vCamposBol.dataSet.FieldByName('TABELA').asString = 'FK_ESTADOS' then
                      DtmBoletos.qrimpressao.Locate('codigo_uf', vcoduf, []);

                    for I := 0 to DtmBoletos.qrimpressao.FieldCount - 1 do
                    begin
                      if DtmBoletos.qrimpressao.Fields[I].FieldName =
                        vCamposBol.dataSet.FieldByName('DESCRICAO_CAMP').AsString then
                      begin
                        if vConfigBol.dataSet.FieldByName('CONDENSADO').asInteger = 1 then
                        begin
                          frmCadBoletos.RDprint1.Imp(ln +
                            vConfigBol.dataSet.FieldByName('LINHA_BLT').Value,
                            vConfigBol.dataSet.FieldByName('COLUNA_BLT').Value, chr(15) +
                            DtmBoletos.qrImpressao.Fields[I].Text + chr(18));
                          ln := ln + vConfigBol.dataSet.FieldByName('LINHA_BLT').Value
                        end
                        else
                        begin
                          frmCadBoletos.RDprint1.Imp(ln +
                            vConfigBol.dataSet.FieldByName('LINHA_BLT').Value,
                            vConfigBol.dataSet.FieldByName('COLUNA_BLT').Value,
                            DtmBoletos.qrImpressao.Fields[I].Text);
                          ln := ln + vConfigBol.dataSet.FieldByName('LINHA_BLT').Value
                        end;
                      end;
                    end; // For J := 0 to QRYimpressao.FieldCount-1 do
                  end;
                end;
              end;
              vCamposBol.dataSet.next;
            end;

            frmCadBoletos.RDprint1.Imp(ln + vBanco.dataSet.FieldByName('QTLNBOL').Value,
              vConfigBol.dataSet.FieldByName('COLUNA_BLT').Value, '');
            ln := ln + vBanco.dataSet.FieldByName('QTLNBOL').Value;

            DtmBoletos.qrImpressao.Close;
            DtmBoletos.qrImpressao.SQL.Text := '';
            DtmBoletos.qrImpressao.SQL.Clear;
            try
              DtmBoletos.qrImpressao.SQL.Text :=
                'SELECT * FROM CLIENTES WHERE COD_EMPRESA = :COD_EMPRESA AND ATIVO = 1 and COD_CLIENTE = ' +
                dataSet.FieldByName('COD_CLIENTE').Text;
              DtmBoletos.qrImpressao.Params[0].Text := vDadosIni.codEmpresa;
              DtmBoletos.qrImpressao.Open;
            except
              Application.MessageBox('Cliente não encontrado!', 'Erro', MB_OK + MB_ICONERROR +
                MB_DEFBUTTON1);
              exit;
            end;
          end;
          dataSet.Next;
        end;
      finally
        dataSet.First;
        dataSet.EnableControls;
      end;
      frmCadBoletos.RDprint1.OpcoesPreview.Preview := True;
      frmCadBoletos.RDprint1.fechar;
    end;

  except
    ShowMessage('Verifique se a configuração da boleta está correta .');
    frmCadBoletos.RDprint1.fechar;

  end;
end;

function TBoleto.insert: boolean;
begin
  result := false;
  if not dataSet.Active then
    result :=
      montaSelect('select ' + Fsql_campos + ' from BOLETAS ' +
      	Fsql_inner +
      	' where BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
        ' and BOLETAS.N_SEQ_BOL = 0 ');
  if inherited Insert then
  begin
    result := true;
    _PreencheCampos();
  end;
end;

function TBoleto.LimparCamposImpressaoBoleto(pNossoNum, pRemessaEnviada, pRetirarCredito,
  pRetirarCarne: boolean; pOutrosDados: Boolean = false): Boolean;
var
  BoletoSelectionado, BoletoSelectionadoNossoNumero: Integer;
  vNumSeq, vOutros: string;
  vsql: string;
  vrecno: Integer;
  vnossonumero: string;
  vcodcobrebem: Integer;
  ids: array of Integer;
  ids2: array of Integer;

  vtemp: string;
begin
	try
    vDadosIni.logsBoleto(Self.ClassName + '.LimparCamposImpressaoBoleto - begin', 'boleto');

    try
      Result := false;

      SetLength(ids, 0);
      SetLength(ids2, 0);

      vsql := dataSet.CommandText;
      vrecno := dataSet.RecNo;

      if (not pNossoNum)
        and (not pOutrosDados)
        and (not pRemessaEnviada)
        and (not pRetirarCarne)
        and (not pRetirarCredito) then
      begin
        Application.MessageBox('Nenhuma opção selecionada.', 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        exit;
      end;

      if (pNossoNum) or (pRemessaEnviada) then
      begin
        if not dataSet.IsEmpty then
        begin
          try
            dataSet.DisableControls;
            dataSet.Filter := 'SelecionaBoleto = ''S''';
            dataSet.Filtered := True;

            dataSet.First;
            {w - 1}while not dataSet.Eof do
            begin
              if (dataSet.FieldByName('SelecionaBoleto').AsString = 'S')
                and (dataSet.FieldByName('COD_COBREBEM').AsInteger > 0)
                and (dataSet.FieldByName('TIPO_API').AsString = 'S')
                and (trim(dataSet.FieldByName('API_IDINTEGRACAO').AsString) <> '') then
              begin
                SetLength(ids2, Length(ids2) + 1);
                ids2[High(ids2)] := fint('n_seq_bol');
              end;

              dataSet.Next;
            end; {w - 1}
          finally
            dataSet.EnableControls;
            dataSet.Filter := '';
            dataSet.Filtered := False;
            vDadosIni.fechaStatusProcessamento;
          end;

          if Length(ids2) > 0 then
          begin
            try
              Screen.Cursor := crHourGlass;
              vDadosIni.abreStatusProcessamento('Consultando dados boleto API', 'Processando informações...');

              vDadosIni.logsBoleto(Self.ClassName + '.LimparCamposImpressaoBoleto - plugboleto_consultar', 'boleto');

              plugboleto_consultar(
                Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10',
                       [vDadosIni.vBancoHW, vDadosIni.codEmpresa]), ids2);

            finally
              vDadosIni.fechaStatusProcessamento;
              Screen.Cursor := crDefault;
            end;
          end;
        end;
      end;

      if (pNossoNum) or (pRemessaEnviada) then
        if not testarLimparRemessaSituacaoAPI then
          exit;

      if (pNossoNum) and (not pRemessaEnviada) then
      begin
        {1}if not dataSet.IsEmpty then
        begin
          try
            dataSet.DisableControls;
            dataSet.Filter := 'SelecionaBoleto = ''S''';
            dataSet.Filtered := True;

             dataSet.First;
            {w - 1}while not dataSet.Eof do
            begin
            	if dataSet.FieldByName('VIA_WS').asString = 'S' then
              begin
                Application.MessageBox('Um ou mais boletos selecionados foram registrados instantaneamente via web service.' + #13 + #13 +
                  'Não é necessário limpar dados da remessa.', 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
                Result := False;
                exit;
              end;

              if dataSet.FieldByName('REMESSA_ENVIADA').asString = 'S' then
              begin
                Application.MessageBox('Um ou mais boletos selecionados possuem remessa enviada.' + #13 + #13 +
                  'Favor limpar dados da remessa antes de limpar nosso número.', 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
                Result := False;
                exit;
              end;

              dataSet.Next;
            end; {w - 1}
          finally
            dataSet.EnableControls;
            dataSet.Filter := '';
            dataSet.Filtered := False;
            vDadosIni.fechaStatusProcessamento;
          end;
        end; {1}
      end;

      BoletoSelectionado := 0;
      BoletoSelectionadoNossoNumero := 0;
      {1}if not dataSet.IsEmpty then
      begin
        try
          dataSet.DisableControls;
          dataSet.Filter := 'SelecionaBoleto = ''S''';
          dataSet.Filtered := True;

          dataSet.First;
          {w - 1}while not dataSet.Eof do
          begin
            vNumSeq := '';
            vDadosIni.abreStatusProcessamento('Limpando dados boleto (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')', 'Processando informações...');

            {2}if (dataSet.FieldByName('SelecionaBoleto').AsString = 'S') then
            begin
              BoletoSelectionado := 1;
              {3}if (dataSet.FieldByName('NOSSO_NUMERO_BANCO').asString <> '')
                or (dataSet.FieldByName('COD_COBREBEM').AsInteger > 0) then
              begin
              BoletoSelectionadoNossoNumero := 1;
                vCodCobrebem := dataSet.FieldByName('COD_COBREBEM').asInteger;
                vNossoNumero := dataSet.FieldByName('NOSSO_NUMERO_BANCO').asString;
                vNumSeq := dataSet.FieldByName('N_SEQ_BOL').AsString;
                vOutros :=
                  dataSet.FieldByName('N_DOC_BOL').AsString + ' | ' +
                  vDadosIni.IfThen(trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString) <> '',
                    trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString),
                    trim(dataSet.FieldByName('API_NOSSONUMERO').AsString));
                {4}if Edit then
                begin
                  if pNossoNum then
                  begin
                    dataSet.FieldByName('NOSSO_NUMERO_BANCO').asString := '';
                    dataSet.FieldByName('COD_COBREBEM').asString := '';
                    dataSet.FieldByName('COD_CONTROLE_CX').asString := '';
                    dataSet.FieldByName('BANCOEMITEBOLETO').asString := '';
                    dataSet.FieldByName('HTMLBOLETO').asString := '';
                    dataSet.FieldByName('ENV_EMAIL_BOL').asString := 'N';
                    dataSet.FieldByName('DATA_EMAIL_BOL').Value := Null;
                    dataSet.FieldByName('COD_US_EMAIL_BOL').Value := Null;
                    dataSet.FieldByName('ENV_WHATSAPP_BOL').asString := 'N';
                    dataSet.FieldByName('DATA_WHATSAPP_BOL').Value := Null;
                    dataSet.FieldByName('COD_US_WHATSAPP_BOL').Value := Null;

                    if pOutrosDados then
                    begin
                      dataSet.FieldByName('PERMITE_PROTESTO').asString := '';
                      dataset.FieldByName('DIAS_PROTESTO').Value := Null;
                      dataSet.FieldByName('PERMITE_DESCONTO').asString := '';
                      dataSet.FieldByName('DATA_LIM_DESC').Value := Null;
                      dataSet.FieldByName('M_DIA_BOL').asString := '';
                      dataSet.FieldByName('MULT_ATR_BOL').asString := '';
                      dataSet.FieldByName('LOCALPAG').Value := Null;
                      dataSet.FieldByName('OBS_BOL').Value := Null;
                      dataSet.FieldByName('OBS_BOL1').Value := Null;
                      dataSet.FieldByName('MENSAGEM_BOL').Value := Null;
                      dataSet.FieldByName('MENSAGEM_ADC').Value := Null;
                      dataSet.FieldByName('MENSAGEM_DESC').Value := Null;
                      dataSet.FieldByName('QTD_DIAS_LIM_DESC').Value := Null;
                    end;
                  end;

                  if pRemessaEnviada then
                  begin
                    dataSet.FieldByName('REMESSA_ENVIADA').asString := 'N';
                    dataSet.FieldByName('DATA_REMESSA').asString := '';
                    dataSet.FieldByName('COD_SEQ_REMESSA').asString := '';
                    dataSet.FieldByName('API_IDREMINTEGRACAO').Value := Null;
                    dataSet.FieldByName('TRANSMISSAO_AUTOMATICA').asString := 'N';
                  end;

                  if pRetirarCredito then
                  begin
                    vQueryFinanceiro.Close;
                    vQueryFinanceiro.sql.text := 'select cc.cod_cred, cc.codigo_emp from controle_creditos cc ' +
                      ' where cc.nosso_numero_banco = ' + QuotedStr(vNossoNumero) +
                      vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
                        ' and cc.cod_emp_mult = ' + vDadosIni.codEmpresa,
                        ' and cc.codigo_emp = ' + vDadosIni.codEmpresa) +
                      ' and cc.cod_cobrebem = ' + IntToStr(vCodCobrebem);
                    vQueryFinanceiro.Open;

                    if not vQueryFinanceiro.IsEmpty then
                    begin
                      vQueryFinanceiro.Close;
                      vQueryFinanceiro.sql.text := 'update controle_creditos cc ' +
                        ' set cc.nosso_numero_banco = '''', cc.cod_cobrebem = null ' +
                        ' where cc.nosso_numero_banco = ' + QuotedStr(vNossoNumero) +
                        vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
                          ' and cc.cod_emp_mult = ' + vDadosIni.codEmpresa,
                          ' and cc.codigo_emp = ' + vDadosIni.codEmpresa) +
                        ' and cc.cod_cobrebem = ' + IntToStr(vCodCobrebem);
                      vQueryFinanceiro.Prepare;
                      vQueryFinanceiro.ExecSQL;
                    end
                    else
                    begin
                      vQueryFinanceiro.Close;
                      vQueryFinanceiro.sql.text := 'update controle_creditos cc ' +
                        ' set cc.nosso_numero_banco = '''', cc.cod_cobrebem = null ' +
                        ' where cc.nosso_numero_banco = ' + QuotedStr(vNossoNumero) +
                        vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
                          ' and cc.cod_emp_mult = ' + vDadosIni.codEmpresa,
                          ' and cc.codigo_emp = ' + vDadosIni.codEmpresa);
                      vQueryFinanceiro.Prepare;
                      vQueryFinanceiro.ExecSQL;
                    end;
                  end;

                  if pRetirarCarne then
                  begin
                    dataSet.FieldByName('NPARCELA').asString := '';
                    dataSet.FieldByName('TOTALPARCELAS').asString := '';
                    dataSet.FieldByName('IDCARNE').asString := '';
                  end;
      //            dataSet.FieldByName('SelecionaBoleto').AsString := '';
                  dataSet.Post;


                  vDadosIni.GravaAuditoria('BOL014', 'EDITAR', vOutros, 'BOLETAS', vNumSeq, buscas);
                  Result := True;
                end; {4}
              end; {3}
            end; {2}
            dataSet.Next;
          end; {w - 1}
        finally
          dataSet.EnableControls;
          dataSet.Filter := '';
          dataSet.Filtered := False;
          vDadosIni.fechaStatusProcessamento;
        end;
      end; {1}

      Result := Apply;

      if ((Result = False) and (pNossoNum = false) and (pOutrosDados = false) and (pRemessaEnviada = false) and (pRetirarCarne = false) and (pRetirarCredito) and (BoletoSelectionado = 1)) then
        Result := True;

      if Result then
      begin
        CommitaTransacao;
        vDadosIni.GravaAuditoria('BOL014', 'EDITAR', 'SUCESSO', 'BOLETAS',
          '', buscas);
      end
      else
      begin
        RollBackTransacao;
        vDadosIni.GravaAuditoria('BOL014', 'EDITAR', 'FALHA', 'BOLETO',
          '', buscas);
      end;

      {1}if pNossoNum then
      begin
        if not dataSet.IsEmpty then
        begin
          try
            dataSet.DisableControls;
            dataSet.Filter := 'SelecionaBoleto = ''S''';
            dataSet.Filtered := True;

            dataSet.First;
            {w - 1}while not dataSet.Eof do
            begin
              if (dataSet.FieldByName('SelecionaBoleto').AsString = 'S')
                and (dataSet.FieldByName('TIPO_API').asString = 'S') then
              begin
                SetLength(ids, Length(ids) + 1);
                ids[High(ids)] := fint('n_seq_bol');
              end;

              dataSet.Next;
            end;{w - 1}
          finally
            dataSet.EnableControls;
            dataSet.Filter := '';
            dataSet.Filtered := False;
            vDadosIni.fechaStatusProcessamento;
          end;

          if Length(ids) > 0 then
          begin
            try
              Screen.Cursor := crHourGlass;
              vDadosIni.abreStatusProcessamento('Limpando dados boleto', 'Processando informações...');

              vDadosIni.logsBoleto(Self.ClassName + '.LimparCamposImpressaoBoleto - plugboleto_descartar', 'boleto');

              plugboleto_descartar(
                Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10',
                       [vDadosIni.vBancoHW, vDadosIni.codEmpresa]), ids);
            finally
              vDadosIni.fechaStatusProcessamento;
              Screen.Cursor := crDefault;
            end;
          end;
        end;
      end;{1}

      dataSet.Close;
      dataSet.CommandText := vsql;
      dataSet.Open;

      if dataSet.RecordCount >= vrecno then
        dataSet.RecNo := vrecno;
      dataSet.Refresh;

      if Result then
        Refresh;

      if BoletoSelectionado = 0 then
      begin
        Result := false;
        Application.MessageBox('Selecione um Boleto.', 'Atenção',
          MB_ICONWARNING + MB_OK + MB_DEFBUTTON1);
        exit;
      end;

      if BoletoSelectionadoNossoNumero = 0 then
      begin
        Result := false;
        Application.MessageBox('Nenhum boleto selecionado com nosso número.', 'Atenção',
          MB_ICONWARNING + MB_OK + MB_DEFBUTTON1);
        exit;
      end;
    except on E: Exception do
      begin
        Result := False;
        Application.MessageBox(PChar('Erro ao limpar dados da impressão do boleto e dados do crédito: ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
        registraErro('Erro ao limpar dados da impressão do boleto e dados do crédito: ' + e.Message);
      end;
    end;
  finally
  	vDadosIni.logsBoleto(Self.ClassName + '.LimparCamposImpressaoBoleto - end', 'boleto');
  end;
end;

procedure TBoleto.marcarImpressaoPeloBanco(pAtivarImpressaoPeloBanco: Boolean = True);
begin
  dataSet.Edit;
  if pAtivarImpressaoPeloBanco then
    dataSet.FieldByName('BANCOEMITEBOLETO').AsString := 'S'
  else
    dataSet.FieldByName('BANCOEMITEBOLETO').AsString := 'N';
  dataSet.Post;
  if Apply then
    CommitaTransacao
  else
    RollBackTransacao;
end;

function TBoleto.post: boolean;
var
  acao: string;
begin
  try

    if not vDadosIni.PesqPros('BOL008', 'SALVAR', '', 'BOLETAS',
      dataSet.FieldByName('N_SEQ_BOL').AsString, buscas, true) then
      exit;

    if not (dataSet.state in [dsedit, dsinsert]) then
      exit;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if Trim(dataSet.FieldByName('DATA_EM_BOL').asString) = '' then
      raiseExceptionCreate('Campo Data Emissão não pode ser vazio.', 'DBEdit1');

    if Trim(dataSet.FieldByName('DATA_VEN_BOL').asString) = '' then
      raiseExceptionCreate('Campo Data Vencimento não pode ser vazio.', 'DBEdit3');

    if Trim(dataSet.FieldByName('N_DOC_BOL').asString) = '' then
      raiseExceptionCreate('Campo Número do Documento não pode ser vazio.', 'DBEdit_NumeroDocumento');

    if ((dataSet.FieldByName('VL_DOC_BOL').AsString = '') or (dataSet.FieldByName('VL_DOC_BOL').AsFloat < 0.01)) then
      raiseExceptionCreate('Campo Valor Líquido não pode ser menor ou igual a zero.', 'DBEdit_ValorTotal');

    if (dataSet.FieldByName('VL_DESC_BOL').AsFloat < 0) then
    	raiseExceptionCreate('Campo Valor Desconto não deve ser menor que zero.', 'DBEdit_ValorDesconto');

    if Trim(dataSet.FieldByName('COD_CLIENTE').asString) = '' then
      raiseExceptionCreate('Campo Código Cliente não informado.', 'DBEdit9');

//    if Trim(dataSet.FieldByName('M_DIA_BOL').asString) = '' then
//      dataSet.FieldByName('M_DIA_BOL').value := 0;
//    if Trim(dataSet.FieldByName('MULT_ATR_BOL').asString) = '' then
//      dataSet.FieldByName('MULT_ATR_BOL').value := 0;

    if not _validarDadosNota then
    begin
      Result := False;
      exit;
    end;

    if Assigned(FlocDemaisBoletos) then
      FlocDemaisBoletos(Self);

    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('VL_DOC_BOL').AsFloat   := Abs(dataSet.FieldByName('VL_DOC_BOL').AsFloat);
    dataSet.FieldByName('VL_DESC_BOL').AsFloat  := Abs(dataSet.FieldByName('VL_DESC_BOL').AsFloat);

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('N_SEQ_BOL').asInteger := Gencodigo('BOLETAS', DtmBoletos.SpIncCodigo, vDadosIni.codEmpresa);
    end;

    vCodSeqBoleto := dataSet.FieldByName('N_SEQ_BOL').asInteger;

    if dataSet.FieldByName('VL_DESC_BOL').AsFloat > 0 then
    	dataSet.FieldByName('PERMITE_DESCONTO').AsString := 'S';

  	if (dataSet.FieldByName('COD_COBREBEM').AsInteger > 0)
    	and (dataSet.FieldByName('VL_DESC_BOL').AsFloat > 0) then
    begin
      buscas.Close;
      buscas.SQL.Text := ' SELECT COD_COBREBEM, COD_EMPRESA, ' +
      	' QTD_DIAS_LIM_DESC, MENSAGEM_DESC FROM COBREBEM ' +
        ' WHERE COD_COBREBEM = :COD_COBREBEM ' +
        ' AND COD_EMPRESA = :COD_EMPRESA ';
      buscas.ParamByName('COD_COBREBEM').AsInteger := dataSet.FieldByName('COD_COBREBEM').AsInteger;
      buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
      buscas.Open;

      dataSet.FieldByName('PERMITE_DESCONTO').AsString := 'S';
      if trim(dataSet.FieldByName('MENSAGEM_DESC').AsString) = '' then
        dataSet.FieldByName('MENSAGEM_DESC').AsString := trim(vCobreBem.dataSet.FieldByName('MENSAGEM_DESC').asString)
      else
        dataSet.FieldByName('MENSAGEM_DESC').AsString := trim(dataSet.FieldByName('MENSAGEM_DESC').AsString);

      dataSet.FieldByName('MENSAGEM_DESC').AsString := StringReplace(dataSet.FieldByName('MENSAGEM_DESC').AsString,
        '#DESCONTO', 'R$ ' + FormatFloat('0.00', dataSet.FieldByName('VL_DESC_BOL').AsFloat), [rfReplaceAll]);

      if not dataSet.FieldByName('DATA_LIM_DESC').IsNull then
        dataSet.FieldByName('MENSAGEM_DESC').AsString := StringReplace(dataSet.FieldByName('MENSAGEM_DESC').AsString,
          '#DATA', FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_LIM_DESC').AsDateTime), [rfReplaceAll])
      else if dataSet.FieldByName('QTD_DIAS_LIM_DESC').AsInteger > 0 then
        dataSet.FieldByName('MENSAGEM_DESC').AsString := StringReplace(dataSet.FieldByName('MENSAGEM_DESC').AsString,
          '#DATA', FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_VEN_BOL').AsDateTime - dataSet.FieldByName('QTD_DIAS_LIM_DESC').AsInteger), [rfReplaceAll])   
      else
        dataSet.FieldByName('MENSAGEM_DESC').AsString := StringReplace(dataSet.FieldByName('MENSAGEM_DESC').AsString,
          '#DATA', FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_VEN_BOL').AsDateTime - buscas.FieldByName('QTD_DIAS_LIM_DESC').AsInteger), [rfReplaceAll]);
    end
    else
    begin
    	dataSet.FieldByName('MENSAGEM_DESC').AsString := '';
      if (dataSet.FieldByName('VL_DESC_BOL').AsFloat > 0) then
      	dataSet.FieldByName('PERMITE_DESCONTO').AsString := 'N';
    end;

    Result := inherited post;
    if dataSet.ChangeCount = 0 then
    begin
      result := true;
      exit;
    end;

    if Apply then
    begin
      CommitaTransacao;
      result := True;
    end
    else
    begin
      Cancel;
      RollBackTransacao;
      Result := False;
    end;

    if Result then
      vDadosIni.GravaAuditoria('BOL008', acao, 'SUCESSO', 'BOLETAS',
        dataSet.FieldByName('N_SEQ_BOL').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('BOL008', acao, 'FALHA', 'BOLETAS',
        dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);

    Refresh;

  except
    on e: Exception do
    begin
      RollBackTransacao;
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TBoleto.removerStatusDevolvido: boolean;
begin
	try
  	Result := False;
    
    if dataSet.IsEmpty then
    	Exit;

    if dataSet.FieldByName('STATUS').AsString <> 'DEVOLVIDO' then
    	Exit;    
    
  	if not vDadosIni.PesqPros('BOL037', 'DESMARCAR COMO DEVOLVIDO', '', 'BOLETAS', dataSet.FieldByName('N_SEQ_BOL').AsString, buscas, True) then
    	Exit;  
      
    if not inherited Edit then
    	Exit;

    dataSet.FieldByName('STATUS').AsString := '';

    Result := inherited Post;
    Result := Apply;

    if Result then
    	CommitaTransacao
    else
    	RollBackTransacao;
    Refresh;
      
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TBoleto.restauralixeira: boolean;
var
	vApagar: boolean;
  vNSeqlBol: string;
  vNumDocBol: string;
  vTipoDocBol: string;
  vValorDocBol: Double;
  vNossoNumBol: string;
  vNomeCliente: string;
  vRazaoCliente: string;
  vCnpjCpfCliente: string;
  vtemp: string;
begin
	try
    Result := false;
    if dataSet.IsEmpty then
    	exit;

    if dataSet.FieldByName('ATIVO').asinteger <> 0 then
    begin
      Application.MessageBox('Registro já está ativo' + chr(13) +
          'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      exit;
    end;

    try
      vNSeqlBol       := dataSet.FieldByName('N_SEQ_BOL').AsString;
      vNumDocBol      := dataSet.FieldByName('N_DOC_BOL').AsString;
      vTipoDocBol     := trim(dataSet.FieldByName('TIPO_EMISSAO').AsString);
      vValorDocBol    := dataSet.FieldByName('VL_DOC_BOL').AsFloat;
      vNossoNumBol    := trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString);
      vNomeCliente    := trim(dataSet.FieldByName('NOME_CLIENTE').AsString);
	    vRazaoCliente   := trim(dataSet.FieldByName('RAZAO').AsString);
      vCnpjCpfCliente := trim(dataSet.FieldByName('CPFCGC').AsString);

      prepare_loop('SelecionaBoleto = ''S''');
      if not dataset.IsEmpty then
      begin
        vNSeqlBol       := '';
	      vNumDocBol      := '';
        vTipoDocBol     := '';
        vValorDocBol    := 0;
        vNossoNumBol    := '';
        vNomeCliente    := '';
	      vRazaoCliente   := '';
        vCnpjCpfCliente := '';
      end;
    finally
    	prepare_loop_done;
    end;

    try
    	if (trim(vNSeqlBol) <> '') then
        prepare_loop('N_SEQ_BOL = ' + vNSeqlBol)
      else
        prepare_loop('SelecionaBoleto = ''S''');

      vtemp := 'Tem certeza que deseja restaurar este registro?' + #13 + #13 +
        'BOLETO' + #13 +
        'Código: ' + vNSeqlBol + #13 +
        'Num Doc: ' + vNumDocBol + #13 +
        'Tipo Doc: ' + vTipoDocBol + #13 +
        'Valor Doc: R$ ' + FormatFloat('0.00', vValorDocBol) + #13 +
        'Nosso Número: ' + vNossoNumBol + #13 +
        'Nome Fantasia: ' + vNomeCliente + #13 +
        'Razão Social: ' + vRazaoCliente + #13 +
        'CNPJ / CPF: ' + vCnpjCpfCliente;

    	if (trim(vNSeqlBol) = '') then
          vtemp := 'Tem certeza que deseja restaurar os ' + IntToStr(dataSet.RecordCount) + ' registros selecionados?';

      if not vDadosIni.PesqPros('BOL006', 'RESTAURAR', '', 'BOLETAS',
      	vDadosIni.IfThen(trim(vNSeqlBol) <> '', vNSeqlBol, ''), buscas, false) then
  				exit;

      if Application.MessageBox(PChar(vtemp),
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> IDYES then
        exit;

      vDadosIni.abreStatusProcessamento('', 'Restaurando boleto(s)');

      dataset.First;
      while not dataset.Eof do
      begin
      	vDadosIni.abreStatusProcessamento('', 'Restaurando boleto(s) (' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount) + ')');

        SqlExec(' update boletas set ativo = 1 ' +
          ' where n_seq_bol = %d and cod_empresa = %d ',
          [fint('n_seq_bol'), fint('cod_empresa')], buscas);

        if (trim(vNSeqlBol) = '') then
          vDadosIni.GravaAuditoria('BOL006', 'RESTAURAR', '', 'BOLETAS',
            dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);

        dataset.Next;
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
      prepare_loop_done;
    end;
    result := CommitaTransacao;
    if Result then
    begin
      vDadosIni.GravaAuditoria('BOL006', 'RESTAURAR REGISTRO', 'SUCESSO', 'BOLETAS',
        vDadosIni.IfThen(trim(vNSeqlBol) <> '', vNSeqlBol, ''), buscas);
    end
    else
    begin
    	RollBackTransacao;
      vDadosIni.GravaAuditoria('BOL006', 'RESTAURAR REGISTRO', 'FALHA', 'BOLETAS',
        vDadosIni.IfThen(trim(vNSeqlBol) <> '', vNSeqlBol, ''), buscas);
    end;

    if Result then
    	Refresh;
  except
    on E: Exception do
		begin
			RollBackTransacao;
      vDadosIni.fechaStatusProcessamento;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TBoleto.retornaEmail(pCodCliente: Integer): string;
begin
	buscas.Close;
  buscas.SQL.Text := ' select email from clientes ' +
  	' where cod_cliente = ' + IntToStr(pCodCliente) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  Result := trim(buscas.FieldByName('email').AsString);
end;

function TBoleto.SalvarDadosRemessa(arquivo: string): boolean;
var
	Arq: TextFile;
  linha: string;
	vlista: TStringList;
  vSeqId: Integer;
  vCodMax: Integer;
begin
	try
    Result := false;

    if not FileExists(arquivo) then
    begin
    	Application.MessageBox(PChar('Arquivo de remessa não encontrado, o mesmo não foi salvo no banco de dados' + #13 +
      	'Arquivo: ' + trim(arquivo)), 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
    	exit;
    end;
      
    // Salvando remessa no BD
    vlista := TStringList.Create;
    vlista.Clear;
    AssignFile(arq, arquivo);
    Reset(arq);
    while not System.Eof(arq) do
    begin
      Readln(arq, linha);
      vlista.Add(linha);
    end;
    closeFile(arq);

    vSeqId := Gencodigo('ARQ_BOLETO_REM', buscas, vDadosIni.codEmpresa);

    buscas.Close;
    buscas.SQL.Text := ' SELECT MAX(SEQID) CODMAX FROM ARQ_BOLETO ' +
      ' WHERE COD_EMPRESA = :COD_EMPRESA AND TIPO = :TIPO ';
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ParamByName('TIPO').AsString := 'REMESSA';
    buscas.Open;
    vCodMax := buscas.FieldByName('CODMAX').AsInteger;

    if (vCodMax + 1 > vSeqId) then
    begin
      vSeqId := vCodMax + 1;

      SqlExec(' update codigo set valor = ' + IntToStr(vCodMax + 1) +
        ' where tabela = ''ARQ_BOLETO_REM'' and cod_empresa = ' + vDadosIni.codEmpresa, buscas);
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;
    end;

    buscas.Close;
    buscas.SQL.Text := ' INSERT INTO ARQ_BOLETO (SEQID, COD_EMPRESA, COD_COBREBEM, DESCRICAO_ARQ, TIPO, DOC) ' +
      ' VALUES (:SEQID, :COD_EMPRESA, :COD_COBREBEM, :DESCRICAO_ARQ, :TIPO, :DOC)';
    buscas.ParamByName('SEQID').AsInteger := vSeqId;
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ParamByName('COD_COBREBEM').AsInteger := vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger;
    buscas.ParamByName('TIPO').AsString := 'REMESSA';
    buscas.ParamByName('DESCRICAO_ARQ').AsString := ExtractFileName(arquivo);
    buscas.ParamByName('DOC').AsString := vlista.Text;
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;
    Result := true;
  except on E: Exception do
		begin
  	  Result := False;
    	Application.MessageBox(PChar('Erro ao salvar dados da remessa: ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
     	registraErro('Erro ao salvar dados da remessa: ' + e.Message);
    end;
  end;
end;

procedure TBoleto.SetBoletosMesmoDocumento(Aboletos: TDataSet_OOP; AfieldsChange: TStrings);
var
  Aregistro: TBoletas_class;
  Aregistros: TBoletas_classList;
  Aids: string;
  I: Integer;
begin
  Aboletos.prepare_loop();
  try
    while not Aboletos.dataSet.Eof do
    begin
      Aids := Aids + IfThen(Aboletos.dataSet.RecNo > 1, ',') + Aboletos.fstr('id');
      Aboletos.dataSet.Next;
    end;

    Aregistros := TBoletas_classList.Create;
    Aregistros.SetValuesFrom( SqlOpen(' select n_seq_bol, cod_empresa, data_em_bol, cod_cliente, ' +
    																	' localpag, m_dia_bol, mult_atr_bol,' +
                                      ' dias_protesto, obs_bol, obs_bol1, mensagem_adc, mensagem_desc, data_lim_desc, ' +
                                      ' permite_protesto, permite_desconto, qtd_dias_lim_desc ' +
                                      ' from boletas ' +
                                      ' where n_seq_bol in (%s) and cod_empresa = %d', [Aids, fint('cod_empresa')]), True);
    for I := 0 to Aregistros.Count - 1 do
    begin

      Aregistro := Aregistros.Items[I];
      Aregistro.beginChanges();

      if AfieldsChange.IndexOf('data_em_bol'  ) >= 0 then Aregistro.data_em_bol   := fdate('data_em_bol');
      if AfieldsChange.IndexOf('cod_cliente'  ) >= 0 then Aregistro.cod_cliente   := fint('cod_cliente');
      if AfieldsChange.IndexOf('localpag'     ) >= 0 then Aregistro.localpag      := fstr('localpag');
      if AfieldsChange.IndexOf('m_dia_bol'    ) >= 0 then Aregistro.m_dia_bol     := ffloat('m_dia_bol');
      if AfieldsChange.IndexOf('mult_atr_bol' ) >= 0 then Aregistro.mult_atr_bol  := ffloat('mult_atr_bol');
      if AfieldsChange.IndexOf('dias_protesto') >= 0 then Aregistro.dias_protesto := fint('dias_protesto');
      if AfieldsChange.IndexOf('obs_bol'      ) >= 0 then Aregistro.obs_bol       := fstr('obs_bol');
      if AfieldsChange.IndexOf('obs_bol1'     ) >= 0 then Aregistro.obs_bol1      := fstr('obs_bol1');
      if AfieldsChange.IndexOf('mensagem_adc' ) >= 0 then Aregistro.mensagem_adc  := fstr('mensagem_adc');
      if AfieldsChange.IndexOf('mensagem_desc') >= 0 then Aregistro.mensagem_desc := fstr('mensagem_desc');
      if AfieldsChange.IndexOf('permite_protesto') >= 0 then Aregistro.permite_protesto := fstr('permite_protesto');
      if AfieldsChange.IndexOf('permite_desconto') >= 0 then Aregistro.permite_desconto := fstr('permite_desconto');
      if AfieldsChange.IndexOf('qtd_dias_lim_desc') >= 0 then Aregistro.qtd_dias_lim_desc := fint('qtd_dias_lim_desc');
      if not fnull('data_lim_desc') then
      	if AfieldsChange.IndexOf('data_lim_desc') >= 0 then Aregistro.data_lim_desc := fdate('data_lim_desc');

      with Aregistro.SQLMotor() do
      begin
        Options.FieldsInInsertUpdate := fsNewdifOldAndPropertySet;
        if HasChanges then
        begin
          SqlExec(SQLUpdate);
          vDadosIni.Auditoria('BOL008', 'ALTERAR', Aregistro.StrChanges, 'BOLETAS', IntToStr(Aregistro.n_seq_bol));
        end;
      end;

      Aboletos.dataSet.Next;
    end;
  finally
    Aboletos.prepare_loop_done();
  end;
end;

function TBoleto.setNossoNumeroBoleto(vNossoNumero: string): boolean;
begin
  try
    if (Length(Trim(vNossoNumero)) <> vCobreBem.dataSet.FieldByName('QTDEDIGNOSSONUMERO').AsInteger)
      and (Length(Trim(vNossoNumero)) <> vCobreBem.dataSet.FieldByName('QTDEDIGNOSSONUMERO').AsInteger + 1) then
    begin
      Application.MessageBox(pchar('Quantidade de digitos do nosso número inválida' + #13 +
        'A quanditade deve ser : ' + vCobreBem.dataSet.FieldByName('QTDEDIGNOSSONUMERO').AsString),
        'Informação', MB_OK + MB_ICONINFORMATION);
      result := false;
    end;
    //Edit;
    dataset.Edit;
    dataSet.FieldByName('NOSSO_NUMERO_BANCO').asString := Trim(vNossoNumero);
    dataSet.Post;
    Result := true;
    if Apply then
    begin
      CommitaTransacao;

      if Result then
        vDadosIni.GravaAuditoria('BOL015', 'INSERIR', 'SUCESSO', 'BOLETAS',
          Trim(vNossoNumero), buscas)
      else
        vDadosIni.GravaAuditoria('BOL015', 'INSERIR', 'FALHA', 'BOLETAS',
          Trim(vNossoNumero), buscas);
    end
    else
    begin
      Cancel;
      RollBackTransacao;
    end;
  except
    on e: exception do
    begin
      Application.MessageBox(pchar(e.Message), 'Atenção ... ERRO INESPERADO', MB_ICONERROR +
        MB_OK);
      Cancel;
      RollBackTransacao;
    end;
  end;
end;

function TBoleto.statuslixeira: boolean;
begin
  Result :=
    ExecutaComandosSql('Select first 1 n_seq_bol from BOLETAS where ativo = 0 and cod_empresa = ' +
    vDadosIni.codEmpresa + '');
end;

function TBoleto.TestarBoletos: Boolean;
var
	vmensagem: string;
  detalhes: string;
begin
	try
  	vmensagem := '';
    Result := True;
    try
      dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if fequals('SelecionaBoleto', 'S') then
        begin
          if fequals('NF_AUT', 'N') and fequals('TIPO_EMISSAO', 'NF') and (fint('NUM_NF_VND') > 0) then
            vmensagem := vmensagem + IfThen(vmensagem <> '', sLineBreak + '--' + sLineBreak) +
                            Format('Nota Fiscal não autorizada, favor enviar antes de realizar a impressão do boleto!' + sLineBreak +
                                   'NF: %d - Num Doc: %s - Valor: %m' + sLineBreak +
                                   'Cliente: %s',
                                   [fint('NUM_NF_VND'), fstr('N_DOC_BOL'), ffloat('VL_DOC_BOL'), fstr('NOME_CLIENTE')]);

        end;
        dataSet.Next;
      end;
    finally
      dataSet.First;
      dataSet.EnableControls;
    end;

    if trim(vmensagem) <> '' then
    begin
    	ShowAtencao(vmensagem);
      Result := False;
    end;
  except on E: Exception do
    begin
      Application.MessageBox(PChar('Erro ao selecionar boletos: ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('function TBoleto.TestarBoletos. Erro: ' + e.Message);
    end;
  end;
end;

function TBoleto.testarGerarRemessaSituacaoAPI: boolean;
var
	buscas2: TIBQuery;
  vtemp: string;
begin
	Result := True;

  if dataSet.IsEmpty then
  	exit;

  try
  	buscas2 := TIBQuery.Create(Application);
  	buscas2.Database := buscas.Database;
	  buscas2.Transaction := buscas.Transaction;

    dataSet.DisableControls;
    dataSet.Filter := 'SelecionaBoleto = ''S''';
    dataSet.Filtered := True;

    dataSet.First;
    {w - 1}while not dataSet.Eof do
    begin
      buscas2.Close;
      buscas2.SQL.Text := ' select cod_cobrebem, tipo_api, api_situacao, api_idintegracao from boletas ' +
        ' where n_seq_bol = :n_seq_bol ' +
        ' and cod_empresa = :cod_empresa ';
      buscas2.ParamByName('n_seq_bol').AsInteger := dataSet.FieldByName('N_SEQ_BOL').AsInteger;
      buscas2.ParamByName('cod_empresa').AsInteger := vDadosIni.cod_empresa;
      buscas2.Open;

      if (dataSet.FieldByName('SelecionaBoleto').AsString = 'S')
        and (buscas2.FieldByName('COD_COBREBEM').AsInteger > 0)
        and (buscas2.FieldByName('TIPO_API').AsString = 'S')
        and (buscas2.FieldByName('API_SITUACAO').AsString = ST_API_REGISTRADO)
        and (trim(buscas2.FieldByName('API_IDINTEGRACAO').AsString) <> '') then
      begin
        vtemp := 'Um ou mais boletos selecionados se encontram com a situação ' + ST_API_REGISTRADO + '.' + #13 + #13 +
          'Não é possível gerar remessa' +
          vDadosIni.IfThen(trim(dataSet.FieldByName('API_SITUACAO').AsString) <> trim(buscas2.FieldByName('API_SITUACAO').AsString),
            ', favor consultar os boletos novamente antes de continuar', '') + '.';

        Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        Result := False;
        exit;
      end
      else if (dataSet.FieldByName('SelecionaBoleto').AsString = 'S')
        and (buscas2.FieldByName('COD_COBREBEM').AsInteger > 0)
        and (buscas2.FieldByName('TIPO_API').AsString = 'S')
        and (buscas2.FieldByName('API_SITUACAO').AsString = ST_API_LIQUIDADO)
        and (trim(buscas2.FieldByName('API_IDINTEGRACAO').AsString) <> '') then
      begin
        vtemp := 'Um ou mais boletos selecionados se encontram com a situação ' + ST_API_LIQUIDADO + '.' + #13 + #13 +
          'Não é possível gerar remessa' +
          vDadosIni.IfThen(trim(dataSet.FieldByName('API_SITUACAO').AsString) <> trim(buscas2.FieldByName('API_SITUACAO').AsString),
            ', favor consultar os boletos novamente antes de continuar', '') + '.';

        Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        Result := False;
        exit;
      end
      else if (dataSet.FieldByName('SelecionaBoleto').AsString = 'S')
        and (buscas2.FieldByName('COD_COBREBEM').AsInteger > 0)
        and (buscas2.FieldByName('TIPO_API').AsString = 'S')
        and (buscas2.FieldByName('API_SITUACAO').AsString = ST_API_BAIXADO)
        and (trim(buscas2.FieldByName('API_IDINTEGRACAO').AsString) <> '') then
      begin
        vtemp := 'Um ou mais boletos selecionados se encontram com a situação ' + ST_API_BAIXADO + '.' + #13 + #13 +
          'Não é possível gerar remessa' +
          vDadosIni.IfThen(trim(dataSet.FieldByName('API_SITUACAO').AsString) <> trim(buscas2.FieldByName('API_SITUACAO').AsString),
            ', favor consultar os boletos novamente antes de continuar', '') + '.';

        Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        Result := False;
        exit;
      end;

      dataSet.Next;
    end; {w - 1}
  finally
    dataSet.EnableControls;
    dataSet.Filter := '';
    dataSet.Filtered := False;
    if Assigned(buscas2) then
      FreeAndNil(buscas2);
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TBoleto.testarLimparRemessaSituacaoAPI: boolean;
var
	buscas2: TIBQuery;
  vtemp: string;
begin
	Result := True;

  if dataSet.IsEmpty then
  	exit;

  try
  	buscas2 := TIBQuery.Create(Application);
  	buscas2.Database := buscas.Database;
	  buscas2.Transaction := buscas.Transaction;

    dataSet.DisableControls;
    dataSet.Filter := 'SelecionaBoleto = ''S''';
    dataSet.Filtered := True;

    dataSet.First;
    {w - 1}while not dataSet.Eof do
    begin
      buscas2.Close;
      buscas2.SQL.Text := ' select cod_cobrebem, tipo_api, api_situacao, api_idintegracao from boletas ' +
        ' where n_seq_bol = :n_seq_bol ' +
        ' and cod_empresa = :cod_empresa ';
      buscas2.ParamByName('n_seq_bol').AsInteger := dataSet.FieldByName('N_SEQ_BOL').AsInteger;
      buscas2.ParamByName('cod_empresa').AsInteger := vDadosIni.cod_empresa;
      buscas2.Open;

      if (dataSet.FieldByName('SelecionaBoleto').AsString = 'S')
        and (buscas2.FieldByName('COD_COBREBEM').AsInteger > 0)
        and (buscas2.FieldByName('TIPO_API').AsString = 'S')
        and (buscas2.FieldByName('API_SITUACAO').AsString = ST_API_REGISTRADO)
        and (trim(buscas2.FieldByName('API_IDINTEGRACAO').AsString) <> '') then
      begin
        vtemp := 'Um ou mais boletos selecionados se encontram com a situação ' + ST_API_REGISTRADO + '.' + #13 + #13 +
          'Não é possível limpar dados do boleto ou remover dados remessa' +
          vDadosIni.IfThen(trim(dataSet.FieldByName('API_SITUACAO').AsString) <> trim(buscas2.FieldByName('API_SITUACAO').AsString),
            ', favor consultar os boletos novamente antes de continuar', '') + '.';

        Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        Result := False;
        exit;
      end
      else if (dataSet.FieldByName('SelecionaBoleto').AsString = 'S')
        and (buscas2.FieldByName('COD_COBREBEM').AsInteger > 0)
        and (buscas2.FieldByName('TIPO_API').AsString = 'S')
        and (buscas2.FieldByName('API_SITUACAO').AsString = ST_API_LIQUIDADO)
        and (trim(buscas2.FieldByName('API_IDINTEGRACAO').AsString) <> '') then
      begin
        vtemp := 'Um ou mais boletos selecionados se encontram com a situação ' + ST_API_LIQUIDADO + '.' + #13 + #13 +
          'Não é possível limpar dados do boleto ou remover dados remessa' +
          vDadosIni.IfThen(trim(dataSet.FieldByName('API_SITUACAO').AsString) <> trim(buscas2.FieldByName('API_SITUACAO').AsString),
            ', favor consultar os boletos novamente antes de continuar', '') + '.';

        Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        Result := False;
        exit;
      end
      else if (dataSet.FieldByName('SelecionaBoleto').AsString = 'S')
        and (buscas2.FieldByName('COD_COBREBEM').AsInteger > 0)
        and (buscas2.FieldByName('TIPO_API').AsString = 'S')
        and (buscas2.FieldByName('API_SITUACAO').AsString = ST_API_BAIXADO)
        and (trim(buscas2.FieldByName('API_IDINTEGRACAO').AsString) <> '') then
      begin
        vtemp := 'Um ou mais boletos selecionados se encontram com a situação ' + ST_API_BAIXADO + '.' + #13 + #13 +
          'Não é possível limpar dados do boleto ou remover dados remessa' +
          vDadosIni.IfThen(trim(dataSet.FieldByName('API_SITUACAO').AsString) <> trim(buscas2.FieldByName('API_SITUACAO').AsString),
            ', favor consultar os boletos novamente antes de continuar', '') + '.';

        Application.MessageBox(PChar(vtemp), 'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        Result := False;
        exit;
      end;

      dataSet.Next;
    end; {w - 1}
  finally
    dataSet.EnableControls;
    dataSet.Filter := '';
    dataSet.Filtered := False;
    if Assigned(buscas2) then
      FreeAndNil(buscas2);
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TBoleto._ValidaDadosCredito: boolean;
begin
  _CreditoSelecionado := 0;

  Result := true;
  try
  	//dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin

      if (dataSet.FieldByName('SelecionaBoleto').AsString = 'S') then
      begin
        if ((dataSet.FieldByName('NF_AUT').AsString = 'N') and (Trim(dataSet.FieldByName('TIPO_EMISSAO').AsString) = 'NF') and (dataSet.FieldByName('NUM_NF_VND').AsInteger > 0)) then
        begin
          Application.MessageBox(pchar('Nota Fiscal não autorizada, favor enviar antes de realizar a impressão do boleto!'
            + #13 + ' NF: ' + dataSet.FieldByName('NUM_NF_VND').AsString + ', Num Doc.: ''' + dataSet.FieldByName('N_DOC_BOL').AsString + ''', Cliente: ''' + dataSet.FieldByName('NOME_CLIENTE').AsString + ''', Valor: R$ ' + Format('%0.2n', [dataSet.FieldByName('VL_DOC_BOL').AsFloat]) + ''), 'Atenção', 0 + 64);
          Result := false;
          Exit;
        end;

        if ((_CreditoSelecionado = 0) and (dataSet.FieldByName('COD_CONTROLE_CX').AsInteger <> 0))
          then
          _CreditoSelecionado := dataSet.FieldByName('COD_CONTROLE_CX').AsInteger
        else if ((_CreditoSelecionado <> dataSet.FieldByName('COD_CONTROLE_CX').AsInteger) and
          (dataSet.FieldByName('COD_CONTROLE_CX').AsInteger <> 0)) then
        begin
          _marcaDesmarcaLinha;
          if Application.MessageBox(pchar('Documento selecionado controle: ' +
            dataSet.FieldByName('COD_CONTROLE_CX').AsString +
            ' diferente dos demais selecionados: ' + IntToStr(_CreditoSelecionado) + #13 +
            'Se continuar o documento será desmarcado. Deseja continuar mesmo assim?'),
            'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          begin
            Result := false;
            Exit;
          end;
        end;
      end;

      dataSet.Next;
    end;
  finally
  	dataSet.First;
    //dataSet.EnableControls;
  end;

end;

function TBoleto._ValidaDados: boolean;
var
  BoletoSelectionado, CodCobrebem, Parcela: Integer;
begin
	try
    BoletoSelectionado := 0;
    CodCobrebem := -1;
    Parcela := -50;

    Result := true;
    try
      dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if dataSet.FieldByName('SelecionaBoleto').Value = 'S' then
        begin
          BoletoSelectionado := 1;

          if (dataSet.FieldByName('COD_COBREBEM').AsInteger <> 0)
            and (dataSet.FieldByName('COD_COBREBEM').AsInteger <> vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) then
          begin
            Result := false;
            Application.MessageBox('Existem boletos com configurações de convênio diferentes da selecionada',
              'Atenção', 0 + 64);
            exit;
          end
          else if (CodCobrebem > 0)
          	and (dataSet.FieldByName('COD_COBREBEM').AsInteger <> 0)
            and (dataSet.FieldByName('COD_COBREBEM').AsInteger <> CodCobrebem) then
          begin
            Result := false;
            Application.MessageBox('Existem boletos com configurações de convênio diferentes da selecionada',
              'Atenção', 0 + 64);
            exit;
          end;

          if (Parcela = -50) then
          begin
            if dataSet.FieldByName('IDCARNE').AsInteger <> 0 then
              Parcela := -3
            else
              Parcela := 0;
          end;

          if (((Parcela <> dataSet.FieldByName('IDCARNE').AsInteger) and (Parcela = 0))
            or ((dataSet.FieldByName('IDCARNE').AsInteger = 0) and (Parcela = -3))) then
          begin
            Result := false;
            Application.MessageBox('Existem boletos impressos como carnê e outros sem a utilização de carnê, selecione somente um tipo de impressão.',
              'Atenção', 0 + 64);
            exit;
          end;

          CodCobrebem := dataSet.FieldByName('COD_COBREBEM').AsInteger;
        end;
        dataSet.Next;
      end;
    finally
      dataSet.First;
      dataSet.EnableControls;
    end;
    if (BoletoSelectionado = 0) then
    begin
      Result := false;
      Application.MessageBox('Selecione o(s) boleto(s) que deseja imprimir.',
        'Atenção', 0 + 64);
    end;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar('Erro ao validar boletos: ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('function TBoleto._ValidaDados. Erro: ' + e.Message);
    end;
  end;
end;

function TBoleto._validarDadosNota: boolean;
var
 buscas2: TIBQuery;
begin
  Result := true;

  if dataSet.FieldByName('TIPO_EMISSAO').AsString <> 'NF' then
    exit;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;


if ((dataSet.FieldByName('COD_NF').AsInteger <= 0)
  and (dataSet.FieldByName('NUM_NF_VND').AsInteger <= 0)) then
    exit;

  buscas.Close;
  if ((dataSet.FieldByName('COD_NF').AsInteger <= 0) and
    (dataSet.FieldByName('NUM_NF_VND').AsInteger > 0)
    and (trim(dataSet.FieldByName('SUB_SERIE').AsString) <> '')) then
     buscas.SQL.Text := 'select cod_nf, num_nf, serie, situacao_nfe, modelo_nf, status, valor_total from notafiscal ' +
      ' where num_nf = ' + IntToStr(dataSet.FieldByName('NUM_NF_VND').AsInteger) +
      ' and serie = ' + QuotedStr(dataSet.FieldByName('SUB_SERIE').AsString) +
      ' and modelo_nf = ' + QuotedStr(vDadosIni.vEmp.vNfe.modeloNF) +
      ' and natureza_nf = ''S'' and cod_empresa = ' + vDadosIni.codEmpresa
  else if ((dataSet.FieldByName('COD_NF').AsInteger <= 0) and
    (dataSet.FieldByName('NUM_NF_VND').AsInteger > 0)
    and (trim(dataSet.FieldByName('SUB_SERIE').AsString) = '')) then
      buscas.SQL.Text := 'select cod_nf, num_nf, serie, situacao_nfe, modelo_nf, status, valor_total from notafiscal ' +
      ' where num_nf = ' + IntToStr(dataSet.FieldByName('NUM_NF_VND').AsInteger) +
      ' and serie = ' + QuotedStr(IntToStr(vDadosIni.vEmp.vSubSerieNotaFiscal)) +
      ' and modelo_nf = ' + QuotedStr(vDadosIni.vEmp.vNfe.modeloNF) +
      ' and natureza_nf = ''S'' and cod_empresa = ' + vDadosIni.codEmpresa
  else
     buscas.SQL.Text := 'select cod_nf, num_nf, serie, situacao_nfe, modelo_nf, status, valor_total from notafiscal ' +
      ' where cod_nf = ' + IntToStr(dataSet.FieldByName('COD_NF').AsInteger) +
      ' and natureza_nf = ''S'' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Prepare;
  buscas.Open;

  if buscas.IsEmpty then
  begin
    raiseExceptionCreate('Nota Fiscal não encontrada, favor conferir os dados informados para confirmar operação!','DBEdit7');
    Result := False;
    exit;
  end;

  if not ((trim(buscas.FieldByName('MODELO_NF').AsString) = '55')
   and (trim(buscas.FieldByName('SITUACAO_NFE').AsString) = 'Autorizada'))
   or ( (trim(buscas.FieldByName('MODELO_NF').AsString) <> '55')
   and (trim(buscas.FieldByName('STATUS').AsString) = 'Fechada')) then
   begin
    raiseExceptionCreate('Nota Fiscal encontrada não pode ser vínculada,' +
     ' favor conferir os dados informados para confirmar operação!' + #13 + #13 +
     ' Regras para vinculação:'+ #13 + #13 +
     ' 1ª Regra - Se o modelo for ''55'' a nota fiscal deve estar com a situação Autorizada.' + #13 +
     ' 2ª Regra - Se o modelo for diferente de ''55'' a nota fiscal deve estar com status ''Fechada''.','DBEdit7');
    Result := False;
    exit;
   end;


  if (dataSet.FieldByName('VL_DOC_BOL').AsFloat > buscas.FieldByName('VALOR_TOTAL').AsFloat) then
  begin
    if Application.MessageBox('NotaFiscal com valor menor que o boleto, deseja continuar assim mesmo?',
     'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
     begin
      Result := False;
      exit;
     end;

     if not vDadosIni.PesqPros('BOL035', 'PERMITIR', 'NOTAFISCAL COM VALOR MENOR QUE O BOLETO', 'BOLETAS',
     dataSet.FieldByName('N_SEQ_BOL').AsString, buscas2, true) then
     begin
       Result := False;
       exit;
     end;
  end;

  if ((buscas.FieldByName('SITUACAO_NFE').AsString = 'Autorizada')
  and (trim(buscas.FieldByName('MODELO_NF').AsString) = '55'))
  or  (trim(buscas.FieldByName('MODELO_NF').AsString) <> '55')  then
    dataSet.FieldByName('NF_AUT').AsString := 'S'
  else if (trim(buscas.FieldByName('MODELO_NF').AsString) = '55') then
    dataSet.FieldByName('NF_AUT').Value := Null;

  dataSet.FieldByName('COD_NF').AsInteger := buscas.FieldByName('COD_NF').AsInteger;
  dataSet.FieldByName('NUM_NF_VND').AsInteger := buscas.FieldByName('NUM_NF').AsInteger;
  dataSet.FieldByName('SUB_SERIE').AsString := buscas.FieldByName('SERIE').AsString;
  dataSet.FieldByName('TIPO_EMISSAO').AsString := 'NF';

end;

function TBoleto.VerificarNOSSONUMERO(NOSSONUMERO: string): boolean;
begin
  try
    if (ExecutaComandosSql('select * from boletas where NOSSO_NUMERO_BANCO LIKE' +
      QuotedStr('%' + NOSSONUMERO + '%') +
      ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND STATUS IS NULL')) then
    begin
      Result := true;
    end
    else
    begin
      Result := false;
    end;
  except
    on e: exception do
    begin
      Application.MessageBox(pchar(e.Message), 'Atenção ... ERRO INESPERADO', MB_ICONERROR +
        MB_OK);
      Result := false;
    end;

  end;

end;

function TBoleto._AbreBoleto: boolean;
begin
  result :=
    montaSelect(' select ' + Fsql_campos + ' FROM BOLETAS ' +
    	Fsql_inner +
    	' WHERE BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' and CLIENTES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' and BOLETAS.ATIVO = 1');
end;

function TBoleto._abreformEnvMensagem: boolean;
var
  formulario: TfrmPadrao;
  I, J: Integer;
  vEnvEmail, vEnvWhatsApp: Boolean;
  vHabKentro: Boolean;
  vCodClienteTmp: Integer;
begin
  try
  	vEnvEmail    := False;
   	vEnvWhatsApp := False;

    vHabKentro := trim(vDadosIni.retornaDadosKentro(buscas, false)) <> '';

    frmCadBoletos.pnEnvEmail.Width := 686;
    frmCadBoletos.pnEnvEmail.Height := vDadosIni.IfThen(vHabKentro, 418, 239);

    formulario := TfrmPadrao.Create(Application);
    formulario.Width := frmCadBoletos.pnEnvEmail.Width;
    formulario.Height := frmCadBoletos.pnEnvEmail.Height;

    formulario.Position := poScreenCenter;
    formulario.Caption := 'Opções de Envio';
    frmCadBoletos.pnEnvEmail.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.KeyPreview := True;
    formulario.ShowHint := True;
    formulario.BorderIcons := [];

    try
      dataSet.DisableControls;
      dataSet.Filter := 'SelecionaBoleto = ''S''';
      dataSet.Filtered := True;

      if (dataSet.IsEmpty) then
      begin
        Application.MessageBox(pchar('Nenhuma Boleta selecionada.'), 'Atenção', MB_ICONERROR + MB_OK);
        exit;
      end;

      vCodClienteTmp := 0;

      dataSet.First;
      while not dataSet.Eof do
      begin
        if dataSet.FieldByName('SelecionaBoleto').AsString = 'S' then
        begin
        	if vCodClienteTmp <= 0 then
          	vCodClienteTmp := dataSet.FieldByName('COD_CLIENTE').AsInteger;

          if vCodClienteTmp <> dataSet.FieldByName('COD_CLIENTE').AsInteger then
          begin
          	vCodClienteTmp := 0;
            Break;
          end;
           
        end;

        dataSet.Next;
      end;
    finally
      dataSet.EnableControls;
      dataSet.Filter := '';
      dataSet.Filtered := False;
    end;
    dataSet.First;

    frmCadBoletos.CheckListContatoWhatsApp.Clear;
    frmCadBoletos.MemoMensagemWhatsApp.Clear;

    if vCodClienteTmp > 0 then
    begin
    	vDadosIni.retornaEmail(
        vCodClienteTmp,
        frmCadBoletos.EditContatoEmail);

    	vDadosIni.retornaCheckListContato(
        vCodClienteTmp,
        cBoleto,
        frmCadBoletos.CheckListContatoWhatsApp);
    end
    else
      frmCadBoletos.EditContatoEmail.Text := '';

    frmCadBoletos.ckEnviarEmail.Checked := _LerConfiguracoesRegistroBoolean(frmCadBoletos.ckEnviarEmail.Name);
    if vHabKentro then
    	frmCadBoletos.ckEnviarWhatsApp.Checked := _LerConfiguracoesRegistroBoolean(frmCadBoletos.ckEnviarWhatsApp.Name)
    else
    	frmCadBoletos.ckEnviarWhatsApp.Checked := false;

    frmCadBoletos.EditAssuntoEmail.Text := vDadosIni.vBoletos.vAssunto_bol;
    frmCadBoletos.MemoMensagemEmail.Text := vDadosIni.vBoletos.vMsg_bol.Text;

    frmCadBoletos.EditAssuntoWhatsApp.Text := vDadosIni.vBoletos.vAssuntoWhatsApp_bol;
    frmCadBoletos.MemoMensagemWhatsApp.Text := vDadosIni.vBoletos.vMsgWhatsApp_bol.Text;

    frmCadBoletos.ckConfEmailAssunto.Caption :=
      vDadosIni.IfThen(vHabKentro,
        'Confirmar e-mail / whatsapp e assunto a cada boleto',
        'Confirmar e-mail e assunto a cada boleto');

    frmCadBoletos.ckConfEmailAssunto.Checked := _LerConfiguracoesRegistroBoolean(frmCadBoletos.ckConfEmailAssunto.Name);

    frmCadBoletos.GroupBoxEmail.Visible := true;

    frmCadBoletos.lbContatoEmail.Enabled := (frmCadBoletos.ckEnviarEmail.Checked) and (not frmCadBoletos.ckConfEmailAssunto.Checked);
    frmCadBoletos.EditContatoEmail.Enabled := (frmCadBoletos.ckEnviarEmail.Checked) and (not frmCadBoletos.ckConfEmailAssunto.Checked);
    frmCadBoletos.lbAssuntoEmail.Enabled := (frmCadBoletos.ckEnviarEmail.Checked) and (not frmCadBoletos.ckConfEmailAssunto.Checked);
    frmCadBoletos.EditAssuntoEmail.Enabled := (frmCadBoletos.ckEnviarEmail.Checked) and (not frmCadBoletos.ckConfEmailAssunto.Checked);
    frmCadBoletos.lbMensagemEmail.Enabled := (frmCadBoletos.ckEnviarEmail.Checked) and (not frmCadBoletos.ckConfEmailAssunto.Checked);
    frmCadBoletos.MemoMensagemEmail.Enabled := (frmCadBoletos.ckEnviarEmail.Checked) and (not frmCadBoletos.ckConfEmailAssunto.Checked);

    frmCadBoletos.lbContatoWhatsApp.Enabled := (frmCadBoletos.ckEnviarWhatsApp.Checked) and (not frmCadBoletos.ckConfEmailAssunto.Checked);
    frmCadBoletos.CheckListContatoWhatsApp.Enabled := (frmCadBoletos.ckEnviarWhatsApp.Checked) and (not frmCadBoletos.ckConfEmailAssunto.Checked);
    frmCadBoletos.lbAssuntoWhatsApp.Enabled := (frmCadBoletos.ckEnviarWhatsApp.Checked) and (not frmCadBoletos.ckConfEmailAssunto.Checked);
    frmCadBoletos.EditAssuntoWhatsApp.Enabled := (frmCadBoletos.ckEnviarWhatsApp.Checked) and (not frmCadBoletos.ckConfEmailAssunto.Checked);
    frmCadBoletos.lbMensagemWhatsApp.Enabled := (frmCadBoletos.ckEnviarWhatsApp.Checked) and (not frmCadBoletos.ckConfEmailAssunto.Checked);
    frmCadBoletos.MemoMensagemWhatsApp.Enabled := (frmCadBoletos.ckEnviarWhatsApp.Checked) and (not frmCadBoletos.ckConfEmailAssunto.Checked);
    frmCadBoletos.SpeedButtonAdcWhatsApp.Enabled := (frmCadBoletos.ckEnviarWhatsApp.Checked) and (not frmCadBoletos.ckConfEmailAssunto.Checked);
    frmCadBoletos.SpeedButtonRemWhatsApp.Enabled := (frmCadBoletos.ckEnviarWhatsApp.Checked) and (not frmCadBoletos.ckConfEmailAssunto.Checked);

    frmCadBoletos.GroupBoxWhatsApp.Visible := vHabKentro;

    frmCadBoletos.lbContatoWhatsApp.Visible := vHabKentro;
    frmCadBoletos.CheckListContatoWhatsApp.Visible := vHabKentro;
    frmCadBoletos.lbAssuntoWhatsApp.Visible := vHabKentro;
    frmCadBoletos.EditAssuntoWhatsApp.Visible := vHabKentro;
    frmCadBoletos.lbMensagemWhatsApp.Visible := vHabKentro;
    frmCadBoletos.MemoMensagemWhatsApp.Visible := vHabKentro;
    frmCadBoletos.SpeedButtonAdcWhatsApp.Visible := vHabKentro;
    frmCadBoletos.SpeedButtonRemWhatsApp.Visible := vHabKentro;

    frmCadBoletos.ckConfEmailAssunto.Caption :=
    	vDadosIni.IfThen(vHabKentro,
    		'Confirmar mensagem a cada e-mail e whatsapp',
      	'Confirmar assunto e mensagem a cada email');

    result := (formulario.ShowModal = IDOK);

    if Result then
    begin
      _GravaConfiguracoesBoolean(frmCadBoletos.ckEnviarEmail.Name, frmCadBoletos.ckEnviarEmail.Checked);
      if vHabKentro then
      	_GravaConfiguracoesBoolean(frmCadBoletos.ckEnviarWhatsApp.Name, frmCadBoletos.ckEnviarWhatsApp.Checked);
      _GravaConfiguracoesBoolean(frmCadBoletos.ckConfEmailAssunto.Name, frmCadBoletos.ckConfEmailAssunto.Checked);
    end;

  finally
    frmCadBoletos.pnEnvEmail.Parent := frmCadBoletos.TabSheet_EnvBol;
    formulario.Free;
    formulario := nil;
  end;
end;

function TBoleto._abreFormRemessa: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Gerar Remessa';
    frmCadBoletos.pnRemessa.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    frmCadBoletos.Edit2.Text := vTipoImpressao;

    frmCadBoletos.DBText1.Visible      := trim(vCobreBem.dataSet.FieldByName('TIPO_API').AsString) = '';
    frmCadBoletos.Label24.Visible      := trim(vCobreBem.dataSet.FieldByName('TIPO_API').AsString) = '';

    result := (formulario.ShowModal = IDOK);
    vTipoImpressao := Trim(frmCadBoletos.Edit2.Text);
  finally
    frmCadBoletos.pnRemessa.Parent := frmCadBoletos.tsRemessa;
    formulario.Free;
    formulario := nil;
  end;
end;

function TBoleto._AdicionarBoleto(
	pNumeroNFVenda: integer = 0;
  pSubSerieNF: integer = 0;
  pTipo_Emissao: string = '';
  pImprimir: boolean = false;
  pEnviar: boolean = false;
  pArrayAplicativo: arrayaplicativo = [];
  pArrayContato: arraycontato = nil;
  pOrigem: TOrigemEnv = cBoleto;
  pConfEmailWhatsApp: boolean = false;
  pUnicoEmailWhatsApp: boolean = false;
  pExibirAnd: boolean = true;
  pExibirHint: boolean = true): boolean;
var
  ContaBoletosDLLCobrebemX: integer; // Conta as boletas que foram adicionadas na DLL
  ValidaIncrementoBoleto: boolean; // Valida o Incrementa mais um valor no conta boleto
  NossoNumeroRepetido: string; //  Coloca o primeiro nosso numero repetido na variavel
  vlocal_pag, vobs, vobs1, vmensagem_bol, vmensagem_adc, vmensagem_desc: string;
  vqtd_dias_lim_desc: Integer;
  vpermiteprotesto, vpermitedesconto: string;
  vtxjuros, vmulta, vvalordesc: double;
  buscas2: TIBQuery;
  MeusDados: Variant;
  vHtmlBoleto: TStringList;
  vDiretorio: boolean;
  handleEmail: THandle;
  vtemp: string;
  vGerarHtml: boolean;
  vNomeCliente: string;
  Aconf: TConfig_sistema_class;
  AtivarConfiguracoesImporRet: string;
  DesconsiderarDigVerImpBoletoR: string;
  nomeCedente, cpfCnpjCedente: string;
  fone: string;
  vDadosKentro: string;
  I, J, K: Integer;
  vFormId: Integer;
  vEmpVia1, vEmpVia2: boolean;
  vCNPJVia1, vCNPJVia2: boolean;
  vVia2: boolean;
  vMens: string;
  vAssunto, vMensagem: string;
  vAplicativo: TAplicativoEnv;
  vArrayContato: arraycontato;
  vAssuntoEmail, vMensagemEmail: string;
  vAssuntoWhatsApp, vMensagemWhatsApp: string;
  vNumDoc: string;
  vTipoDoc: string;
  //              AImprimir
  //  no caso de inativação de boletos antigos que estiverem com o mesmo nosso numero,
  //  variavel é para verificar se o vencimento boletos que restam para inativar tem menos de 1 ano,
  //  se for ele para a operação e pede que seja configurado no Cobrebem}
  function VerificaNossoNumeroRepetido: boolean;
    //            1 - Verifica se o boleto não tem o nosso numero
    //            2 - Verifica se não tem mais boletos cadastrados com este nosso numero
    //                Se tiver
    //                2.1 - Checa se a variavel NossoNumeroRepetido é igual ao
    //                nosso numero que está na DLL do boleto, se for verdadeiro quer
    //                dizer que o metodo entrou em loop (obs:. A variavel
    //                NossoNumeroRepetido é preenchida mais a frente no item 2.2)
    //                2.2 - Se a varaiavel NossoNumeroRepetido for vazia salva o nosso
    //                numero repetido (ob: Utilizado no item 2.1)
    //                2.3 -Verifica se quita boleto pelo sistema e se a impressão não é pela nota fiscal variaveis da tabela empresa
    //                    2.3.1 - Se SIM - Exibe um formulário com o nosso numero antigo e
    //                    o usuário escolhe se ele quer passar para o proximo numero
    //                    ou inativar o antigo
    //                    2.3.2 - Se NÃO - Ele checa se a data do vencimento do boleto é
    //                    maior ou igual a 1 ano.
    //                          2.3.2.1 - Se Sim - Ele inativa o boleto antigo automaticamente
    //                          2.3.2.2 - Se Não - passa para o proximo nosso numero automaticamente

  begin
    try

      NossoNumeroRepetido := '';
      while (true) do
      begin
        if (dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString = '') then
        begin
          Boleto.NossoNumero :=
            _PegarProxNossoNumero(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsString);

          if (AtivarConfiguracoesImporRet = 'S') and (DesconsiderarDigVerImpBoletoR = 'S') then
            if Length(Boleto.NossoNumero) < (Length(CobreBemX.MascaraNossoNumero) + 1) then
            	Boleto.CalculaDacNossoNumero := True;
          CobreBemX.calculardadosboletos;
        end;

        buscas2.Close;
        buscas2.SQL.Text := ' SELECT BOL.NOSSO_NUMERO_BANCO, BOL.COD_COBREBEM, ' +
          ' COB.CODIGOCEDENTE, COB.CODIGOAGENCIA, COB.NUMEROCONTACORRENTE FROM BOLETAS BOL ' +
          ' LEFT JOIN COBREBEM COB ON COB.COD_COBREBEM = BOL.COD_COBREBEM AND COB.COD_EMPRESA = BOL.COD_EMPRESA ' +
          ' WHERE BOL.NOSSO_NUMERO_BANCO = :NOSSO_NUMERO_BANCO ' +
          ' AND BOL.COD_EMPRESA = :COD_EMPRESA AND BOL.STATUS IS NULL ';
        buscas2.ParamByName('NOSSO_NUMERO_BANCO').AsString := CobreBemX.DocumentosCobranca[ContaBoletosDLLCobrebemX].NossoNumero;
        buscas2.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
        buscas2.Open;
        buscas2.FetchAll;

        if not buscas2.IsEmpty then
        begin
          buscas2.First;
          while not buscas2.Eof do
          begin
            if ((trim(vCobreBem.dataSet.FieldByName('CODIGOCEDENTE').AsString) = trim(buscas2.FieldByName('CODIGOCEDENTE').AsString)) and
              (trim(vCobreBem.dataSet.FieldByName('CODIGOAGENCIA').AsString) = trim(buscas2.FieldByName('CODIGOAGENCIA').AsString)) and
              (trim(vCobreBem.dataSet.FieldByName('NUMEROCONTACORRENTE').AsString) = trim(buscas2.FieldByName('NUMEROCONTACORRENTE').AsString))) then
            begin
              if (NossoNumeroRepetido = CobreBemX.DocumentosCobranca[ContaBoletosDLLCobrebemX].NossoNumero) then
              begin

                Result := false;
                Application.MessageBox(pchar('Configure o convênio para que tenha uma faixa maior de Início do Nosso Numero ao Fim do Nosso Número. ' +
                														 'Se não existir contacte o administrador da rede.'),
													                   'Atenção ... ERRO INESPERADO', MB_ICONERROR + MB_OK);
                Cancel;
                exit;
              end;

              if (NossoNumeroRepetido = '') then
                NossoNumeroRepetido :=
                  CobreBemX.DocumentosCobranca[ContaBoletosDLLCobrebemX].NossoNumero;

              if (vDadosIni.vEmp.vQuitarBoletoPeloSistema = 'S') and (not vImpressaoNF) then
              begin

                vBoletoNossoNumeroRepetido._AbreBoletos(CobreBemX.DocumentosCobranca[ContaBoletosDLLCobrebemX].NossoNumero);

                if ( (frmCadBoletos.PageControl1.ActivePage = frmCadBoletos.TabSheet2)
                  or (frmCadBoletos.PageControl1.ActivePage = frmCadBoletos.TabSheet1)) then
                begin
                  frmCadBoletos.PageControl1.ActivePage := frmCadBoletos.TabSheet_Cobrebem;
                  frmCadBoletos.TabSheet_Cobrebem.Show;
                  frmCadBoletos.GroupBox_SelecionaContaBoleto.Visible := false;
                end;

                frmCadBoletos.GroupBox_NossoNumeroRepetido.Enabled := true;
                frmCadBoletos.GroupBox_NossoNumeroRepetido.Visible := true;
                vDadosIni.fechaStatusProcessamento;
//                Application.MessageBox(pchar('Nosso Número repetido, escolha uma das opções do formulário.  Ir para o proxímo número ou inativar.'),
                Application.MessageBox(pchar('Nosso Número repetido, escolha uma das opções do formulário.  Ir para o proxímo número ou cancelar impressão.'),
                  'Atenção', MB_ICONEXCLAMATION + MB_OK);
                while not vAbortar do
                  Application.ProcessMessages;
                vDadosIni.abreStatusProcessamento('Impressão de boletos', 'Processando informações...');
                vAbortar := false;

                if (frmCadBoletos.GroupBox_SelecionaContaBoleto.Visible = false) then
                begin
                  frmCadBoletos.PageControl1.ActivePage := frmCadBoletos.TabSheet2;
                  frmCadBoletos.GroupBox_SelecionaContaBoleto.Visible := true;
                end;

                //Se clicar no INATIVAR no GroupBox_NossoNumeroRepetido
                if (vVoltarImpressaoBoleto) then
                  break;
                vVoltarImpressaoBoleto := false;

                if (vVerificarErro) then
                begin
                  Result := false;
                  break;
                end;
                vVerificarErro := false;

              end
              else
              begin

                if (YearsBetween(StrToDateTime(retornaValor('SELECT FIRST 1 DATA_VEN_BOL AS VALOR FROM BOLETAS ' +
                    ' WHERE NOSSO_NUMERO_BANCO = ' + QuotedStr(CobreBemX.DocumentosCobranca[ContaBoletosDLLCobrebemX].NossoNumero) +
                    ' AND COD_EMPRESA = ' + vDadosIni.codempresa + ' AND STATUS IS NULL ORDER BY DATA_VEN_BOL DESC')),
                    vDadosIni.getDataHoraBanco(buscas)) >= 1) then
                  //confirir.Não é do boleto q eu selecionei, é dos outros que eu estou inativando
                begin

                  ExecutaComandosSql(
                    ' UPDATE BOLETAS SET STATUS = ''INATIVO'' WHERE NOSSO_NUMERO_BANCO = ' +
                    QuotedStr(CobreBemX.DocumentosCobranca[ContaBoletosDLLCobrebemX].NossoNumero) +
                    ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa);

                  break;
                end;
              end;
            end;
            buscas2.Next;
          end;
        end
        else
          break;
      end;
    except
      Result := false;
      exit;
    end;
    Result := true;
  end;

begin
  try

     ContaBoletosDLLCobrebemX := -1;
     vComitarFormaPagamento := false;
     vVerificarComitar := false;
     vVerificarErro := false;
     CobreBemX.DocumentosCobranca.Clear;

     buscas2 := TIBQuery.Create(Application);
     buscas2.Database := buscas.Database;
     buscas2.Transaction := buscas.Transaction;

     if pEnviar then
     begin
       if trim(pTipo_Emissao) = 'NF' then
       begin
         buscas2.Close;
         buscas2.SQL.Text := 'select cod_nf from notafiscal' +
           ' where num_nf = ' + IntToStr(pNumeroNFVenda) +
           ' and serie = ' + QuotedStr(IntToStr(pSubSerieNF)) +
           ' and natureza_nf = ''S'' ' +
           ' and cod_empresa = ' + vDadosIni.codEmpresa;
         buscas2.Open;

         vNumDoc := IntToStr(buscas2.FieldByName('cod_nf').AsInteger);
         vTipoDoc := 'NF';
       end
       else
       begin
         vNumDoc := IntToStr(pNumeroNFVenda);
         vTipoDoc := pTipo_Emissao;
       end;
     end;

     try
       Aconf := TConfig_sistema_class.Create;
       Aconf.value1_b.Text := vCobreBem.dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString;

       if Assigned(Aconf) then
       begin
         AtivarConfiguracoesImporRet   := Aconf.ReadString('ConfImportacaoRetorno', 'Ativar configuracoes importacao retorno (S ou N)', '');
         DesconsiderarDigVerImpBoletoR := Aconf.ReadString('ConfImportacaoRetorno', 'Desconsiderar digito verificar ao imprimir boleto e gerar remessa (S ou N)', '');
       end
       else
       begin
         AtivarConfiguracoesImporRet := 'N';
         DesconsiderarDigVerImpBoletoR := 'N';
       end;

       try
         dataSet.DisableControls;
         dataSet.First;
         while not dataSet.Eof do
         begin
           vGerarHtml := true;
           Application.ProcessMessages;
           if (vAbortar) then
           begin
             Application.MessageBox(pchar('Operação paralizada.' + #13 +
               ''), 'Atenção', 0 + 64);
             Result := false;
             exit;
           end;

           if pUnicoEmailWhatsApp then
           	 vMens := 'Processando Boletos - ' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount)
           else
           	 vMens := vDadosIni.IfThen(pImprimir, 'Imprimindo', '') +
                    	vDadosIni.IfThen(pImprimir and pEnviar, '/', '') +
             					vDadosIni.IfThen(pEnviar, 'Enviando', '') + ' ' +
                      OrigemEnvStr[pOrigem] + ' - ' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount);

           if pExibirHint then
             vDadosIni.abreStatusProcessamento('', vMens);

           Result := false;
           vHtmlBoleto := TStringList.Create;

           if dataSet.FieldByName('SelecionaBoleto').Value = 'S' then
           begin
             ValidaIncrementoBoleto := true;
             inc(ContaBoletosDLLCobrebemX);
             Boleto := CobreBemX.DocumentosCobranca.Add;
             Boleto.MinhaChave := dataSet.FieldByName('N_SEQ_BOL').asString;
             Boleto.NumeroDocumento := dataSet.FieldByName('N_DOC_BOL').asString;

             if trim(vCobreBem.dataSet.FieldByName('NUMPARC_CODBARRAS').AsString) = 'S' then
             begin
               Boleto.NumeroParcelaCarnet := 1;
               Boleto.TotalParcelasCarnet := 1;
             end;

             if trim(vCobreBem.dataSet.FieldByName('INSTRUCAO_COBRANCA3').AsString) = 'S' then
               Boleto.InstrucaoCobranca3 := '1';

//             if (dataSet.FieldByName('NPARCELA').AsInteger > 0) and
//               (dataSet.FieldByName('TOTALPARCELAS').AsInteger > 0) then
//             begin
//               Boleto.NumeroParcelaCarnet := dataSet.FieldByName('NPARCELA').AsInteger;
//               Boleto.TotalParcelasCarnet := dataSet.FieldByName('TOTALPARCELAS').AsInteger;
//             end;

             if (vCobreBem.dataSet.FieldByName('TIPO_COBRANCA').AsInteger > 0) then
             begin
               MeusDados := Boleto.MeusDados.Add;
               MeusDados.Nome := 'FuncionalidadeNaoDocumentadaNoManualDoSantander';
               MeusDados.Valor := IntToStr(vCobreBem.dataSet.FieldByName('TIPO_COBRANCA').AsInteger);
             end;
             //      try
             //        Boleto.NumeroParcelaCarnet := StrToInt(Trim(
             //          Copy(dataSet.FieldByName('N_DOC_BOL').asString,
             //          pos('-', dataSet.FieldByName('N_DOC_BOL').asString) + 1, 3)));
             //      except
             //      end;


             Boleto.TipoDocumentoCobranca :=
               vCobreBem.dataSet.FieldByName('TIPODOCUMENTOCOBRANCA').asString;

             //Busca as informações dos clintes

             if not vCliente.selecionaCliente(dataSet.FieldByName('COD_CLIENTE').asString) then
             begin
               Application.MessageBox('Cadastro de Cliente não encontrado, verifique!', 'Erro',
                 MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
               exit;
             end;

             Boleto.NomeSacado := vCliente.dataSet.FieldByName('RAZAO').asString;

             if trim(vCliente.dataSet.FieldByName('CPFCGC').asString) = '' then
             begin
               Application.MessageBox(Pchar('CPF/CNPJ não encontrado, Cliente = '+dataSet.FieldByName('COD_CLIENTE').asString+
                 ' - ' +trim(vCliente.dataSet.FieldByName('NOME_CLIENTE').AsString) +'.'), 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
               result := false;
               exit;
             end
             else
             begin
               if Length(vCliente.dataSet.FieldByName('CPFCGC').asString) > 11 then
                 Boleto.CNPJSacado := vCliente.dataSet.FieldByName('CPFCGC').asString
               else
                 Boleto.CPFSacado := vCliente.dataSet.FieldByName('CPFCGC').asString;
             end;

             if trim(vCliente.dataSet.FieldByName('END_COBRANCA').AsString) = '' then
             begin
               Application.MessageBox(Pchar('Endereço de Cobrança não encontrado, Cliente = '+dataSet.FieldByName('COD_CLIENTE').asString+
                 ' - ' +trim(vCliente.dataSet.FieldByName('NOME_CLIENTE').AsString) +'.'), 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
               result := false;
               exit;
             end
             else
               Boleto.EnderecoSacado := vCliente.dataSet.FieldByName('END_COBRANCA').AsString;

             if ((vCliente.dataSet.FieldByName('COD_BAIRRO_COBRANCA').AsInteger <= 0) or
                (trim(vCliente.dataSet.FieldByName('BAIRRO_COBRANCA').AsString) = '')) then
             begin
               Application.MessageBox(Pchar('Bairro de Cobrança não encontrado, Cliente = '+dataSet.FieldByName('COD_CLIENTE').asString+
               ' - ' +trim(vCliente.dataSet.FieldByName('NOME_CLIENTE').AsString) +'.'), 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
               result := false;
               exit;
             end
             else
               Boleto.BairroSacado := vCliente.dataSet.FieldByName('BAIRRO_COBRANCA').AsString;

             if ((vCliente.dataSet.FieldByName('COD_CIDADE_COBRANCA').AsInteger <= 0) or
                 (trim(vCliente.dataSet.FieldByName('CIDA_COBRANCA').AsString) = '')) then
             begin
               Application.MessageBox(Pchar('Cidade de Cobrança não encontrada, Cliente = '+dataSet.FieldByName('COD_CLIENTE').asString+
               ' - ' +trim(vCliente.dataSet.FieldByName('NOME_CLIENTE').AsString) +'.'), 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
               result := false;
               exit;
             end
             else
               Boleto.CidadeSacado := vCliente.dataSet.FieldByName('CIDA_COBRANCA').AsString;

             if (trim(vCliente.dataSet.FieldByName('CEP_COBRANCA').AsString) = '')
              or (trim(vCliente.dataSet.FieldByName('CEP_COBRANCA').AsString) = '00000000')
              or (trim(vCliente.dataSet.FieldByName('CEP_COBRANCA').AsString) = '000000000') then
             begin
               Application.MessageBox(Pchar('CEP de Cobrança não encontrado, Cliente = '+dataSet.FieldByName('COD_CLIENTE').asString+
               ' - ' +trim(vCliente.dataSet.FieldByName('NOME_CLIENTE').AsString) +'.'), 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
               result := false;
               exit;
             end
             else
               Boleto.CepSacado := vCliente.dataSet.FieldByName('CEP_COBRANCA').AsString;

              if not (vCliente.dataSet.FieldByName('EST_CODIGO_UF').IsNull) then
                Boleto.EstadoSacado :=
                  retornaValor('SELECT SIGLA_UF AS VALOR FROM ESTADOS WHERE CODIGO_UF = ' +
                  vCliente.dataSet.FieldByName('EST_CODIGO_UF').AsString);
              Boleto.DataDocumento := FormatDateTime('dd/mm/yyyy',
                dataSet.FieldByName('DATA_EM_BOL').AsDateTime);
              if not dataSet.FieldByName('DATA_VEN_BOL').IsNull then
                Boleto.DataVencimento := FormatDateTime('dd/mm/yyyy',
                  dataSet.FieldByName('DATA_VEN_BOL').AsDateTime);
              Boleto.DataProcessamento := FormatDateTime('dd/mm/yyyy', vDadosIni.getDataHoraBanco(buscas));
              if dataSet.FieldByName('VL_DESC_BOL').AsFloat > 0 then
              begin
              	Boleto.ValorDocumento := dataSet.FieldByName('VL_DOC_BOL').asFloat + dataSet.FieldByName('VL_DESC_BOL').AsFloat;
              	Boleto.ValorDesconto := dataSet.FieldByName('VL_DESC_BOL').AsFloat;
              end
              else
              begin
              	Boleto.ValorDocumento := dataSet.FieldByName('VL_DOC_BOL').asFloat;
              	Boleto.ValorDesconto := dataSet.FieldByName('VL_DESC_BOL').AsFloat;
              end;

              Boleto.PadroesBoleto.InstrucoesCaixa := '';
              vlocal_pag := '';
              vobs := '';
              vobs1 := '';
              vmensagem_bol := '';
              vmensagem_adc := '';
              vmensagem_desc := '';
              vmulta := 0;
              vtxjuros := 0;
              vvalordesc := 0;
              vpermiteprotesto := '';
              vpermitedesconto := '';
              vqtd_dias_lim_desc := 0;

              if vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger <= 0 then
              begin
                Boleto.PercentualMultaAtraso := dataSet.FieldByName('MULT_ATR_BOL').asFloat;

                Boleto.PercentualJurosDiaAtraso := dataSet.FieldByName('M_DIA_BOL').asFloat;

                vlocal_pag := trim(dataSet.FieldByName('LOCALPAG').AsString);

                vobs := trim(dataSet.FieldByName('OBS_BOL').AsString);

                vobs1 := trim(dataSet.FieldByName('OBS_BOL1').AsString);

                vmensagem_bol := trim(dataSet.FieldByName('MENSAGEM_BOL').asString);

                vmensagem_adc := trim(dataSet.FieldByName('MENSAGEM_ADC').asString);

                vtxjuros := dataSet.FieldByName('M_DIA_BOL').asFloat;

                vmulta := dataSet.FieldByName('MULT_ATR_BOL').asFloat;

                vvalordesc := dataSet.FieldByName('VL_DESC_BOL').asFloat;

                vpermiteprotesto := trim(dataSet.FieldByName('PERMITE_PROTESTO').AsString);

                if dataSet.FieldByName('VL_DESC_BOL').asFloat > 0 then
                	vpermitedesconto := 'S'
                else
                	vpermitedesconto := trim(dataSet.FieldByName('PERMITE_DESCONTO').AsString);

                vqtd_dias_lim_desc := dataSet.FieldByName('QTD_DIAS_LIM_DESC').AsInteger;

                if (trim(vpermitedesconto) = 'S') or (vvalordesc > 0) then
                begin
                	vmensagem_desc := trim(dataSet.FieldByName('MENSAGEM_DESC').asString);

                  vmensagem_desc := StringReplace(vmensagem_desc,
                  	'#DESCONTO', 'R$ ' + FormatFloat('0.00', vvalordesc), [rfReplaceAll]);

                  if not dataSet.FieldByName('DATA_LIM_DESC').IsNull then
                    vmensagem_desc := StringReplace(vmensagem_desc,
                      '#DATA', FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_LIM_DESC').AsDateTime), [rfReplaceAll])
                  else
                    vmensagem_desc := StringReplace(vmensagem_desc,
                      '#DATA', FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_VEN_BOL').AsDateTime), [rfReplaceAll]);
                end;

                // Instruções do Caixa
                Boleto.PadroesBoleto.InstrucoesCaixa := '';
                if trim(vobs) <> '' then
                begin
                  if trim(Boleto.PadroesBoleto.InstrucoesCaixa) <> '' then
                    Boleto.PadroesBoleto.InstrucoesCaixa := Boleto.PadroesBoleto.InstrucoesCaixa + ' <br> ';

                  Boleto.PadroesBoleto.InstrucoesCaixa := Boleto.PadroesBoleto.InstrucoesCaixa + trim(vobs);
                end;

                if trim(vmensagem_adc) <> '' then
                begin
                  if trim(Boleto.PadroesBoleto.InstrucoesCaixa) <> '' then
                    Boleto.PadroesBoleto.InstrucoesCaixa := Boleto.PadroesBoleto.InstrucoesCaixa + ' <br> ';

                  Boleto.PadroesBoleto.InstrucoesCaixa := Boleto.PadroesBoleto.InstrucoesCaixa + trim(vmensagem_adc);
                end;

                if trim(vobs1) <> '' then
                begin
                  if trim(Boleto.PadroesBoleto.InstrucoesCaixa) <> '' then
                    Boleto.PadroesBoleto.InstrucoesCaixa := Boleto.PadroesBoleto.InstrucoesCaixa + ' <br> ';

                  Boleto.PadroesBoleto.InstrucoesCaixa := Boleto.PadroesBoleto.InstrucoesCaixa + trim(vobs1);
                end;

                if trim(vmensagem_desc) <> '' then
                begin
                  if trim(Boleto.PadroesBoleto.InstrucoesCaixa) <> '' then
                    Boleto.PadroesBoleto.InstrucoesCaixa := Boleto.PadroesBoleto.InstrucoesCaixa + ' <br> ';

                  Boleto.PadroesBoleto.InstrucoesCaixa := Boleto.PadroesBoleto.InstrucoesCaixa + trim(vmensagem_desc);
                end;

                // Demonstrativo
                Boleto.PadroesBoleto.Demonstrativo := '';
                if trim(vmensagem_bol) <> '' then
                begin
                	if trim(Boleto.PadroesBoleto.Demonstrativo) <> '' then
                  	Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + ' <br> ';

                  Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + trim(vmensagem_bol);
                end;

                if trim(vobs) <> '' then
                begin
                	if trim(Boleto.PadroesBoleto.Demonstrativo) <> '' then
                  	Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + ' <br> ';

                  Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + trim(vobs);
                end;

                if trim(vlocal_pag) <> '' then
                begin
                	if trim(Boleto.PadroesBoleto.Demonstrativo) <> '' then
                  	Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + ' <br> ';

                  Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + trim(vlocal_pag);
                end;

                if trim(vmensagem_adc) <> '' then
                begin
                	if trim(Boleto.PadroesBoleto.Demonstrativo) <> '' then
                  	Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + ' <br> ';

                  Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + trim(vmensagem_adc);
                end;

                if trim(vobs1) <> '' then
                begin
                	if trim(Boleto.PadroesBoleto.Demonstrativo) <> '' then
                  	Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + ' <br> ';

                  Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + trim(vobs1);
                end;

                if trim(vmensagem_desc) <> '' then
                begin
                	if trim(Boleto.PadroesBoleto.Demonstrativo) <> '' then
                  	Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + ' <br> ';

                  Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + trim(vmensagem_desc);
                end;
              end
              else
              begin
                if dataSet.FieldByName('MULT_ATR_BOL').AsFloat > 0 then
                  Boleto.PercentualMultaAtraso := dataSet.FieldByName('MULT_ATR_BOL').asFloat
                else
                  Boleto.PercentualMultaAtraso := vCobreBem.dataSet.FieldByName('MULTAS').AsFloat;

                if dataSet.FieldByName('M_DIA_BOL').AsFloat > 0 then
                  Boleto.PercentualJurosDiaAtraso := dataSet.FieldByName('M_DIA_BOL').asFloat
                else
                  Boleto.PercentualJurosDiaAtraso := vCobreBem.dataSet.FieldByName('TX_JUROS').AsFloat / 30;

                if str_empty('LOCALPAG') then
                  vlocal_pag := trim(vCobreBem.dataSet.FieldByName('LOCAL_PAG').AsString)
                else
                  vlocal_pag := trim(dataSet.FieldByName('LOCALPAG').AsString);

                if str_empty('OBS_BOL') then
                  vobs := trim(vCobreBem.dataSet.FieldByName('OBS_BOL').asString)
                else
                  vobs := trim(dataSet.FieldByName('OBS_BOL').AsString);

                vobs1 := trim(dataSet.FieldByName('OBS_BOL1').AsString);

                if str_empty('MENSAGEM_BOL') then
                  vmensagem_bol := trim(vCobreBem.dataSet.FieldByName('MENSAGEM_BOL').asString)
                else
                  vmensagem_bol := trim(dataSet.FieldByName('MENSAGEM_BOL').AsString);

              	if str_empty('MENSAGEM_ADC') then
                  vmensagem_adc := trim(vCobreBem.dataSet.FieldByName('MENSAGEM_ADC').asString)
                else
                  vmensagem_adc := trim(dataSet.FieldByName('MENSAGEM_ADC').AsString);

                vtxjuros := Boleto.PercentualJurosDiaAtraso;

                vmulta   := Boleto.PercentualMultaAtraso;

                vvalordesc := dataSet.FieldByName('VL_DESC_BOL').asFloat;

                if str_empty('PERMITE_PROTESTO') then
                  vpermiteprotesto := trim(vCobreBem.dataSet.FieldByName('PERMITE_PROTESTO').asString)
                else
                  vpermiteprotesto := trim(dataSet.FieldByName('PERMITE_PROTESTO').AsString);

                if dataSet.FieldByName('VL_DESC_BOL').asFloat > 0 then
                	vpermitedesconto := 'S'
                else
                begin
                  if str_empty('PERMITE_DESCONTO') then
                    vpermitedesconto := trim(vCobreBem.dataSet.FieldByName('PERMITE_DESCONTO').asString)
                  else
                    vpermitedesconto := trim(dataSet.FieldByName('PERMITE_DESCONTO').AsString);
                end;

                if fint('qtd_dias_lim_desc') <= 0 then
                	vqtd_dias_lim_desc := vCobreBem.dataSet.FieldByName('QTD_DIAS_LIM_DESC').AsInteger
                else
                	vqtd_dias_lim_desc := dataSet.FieldByName('QTD_DIAS_LIM_DESC').AsInteger;

                if (trim(vpermitedesconto) = 'S') or (vvalordesc > 0) then
                begin
                	if str_empty('MENSAGEM_DESC') then
                    vmensagem_desc := trim(vCobreBem.dataSet.FieldByName('MENSAGEM_DESC').asString)
                  else
                    vmensagem_desc := trim(dataSet.FieldByName('MENSAGEM_DESC').AsString);

                  vmensagem_desc := StringReplace(vmensagem_desc,
                  	'#DESCONTO', 'R$ ' + FormatFloat('0.00', vvalordesc), [rfReplaceAll]);

                  if not dataSet.FieldByName('DATA_LIM_DESC').IsNull then
                    vmensagem_desc := StringReplace(vmensagem_desc,
                      '#DATA', FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_LIM_DESC').AsDateTime), [rfReplaceAll])
                  else
                    vmensagem_desc := StringReplace(vmensagem_desc,
                      '#DATA', FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_VEN_BOL').AsDateTime), [rfReplaceAll]);
                end;

                // Instruções do Caixa
                Boleto.PadroesBoleto.InstrucoesCaixa := '';
                if trim(vobs) <> '' then
                begin
                  if trim(Boleto.PadroesBoleto.InstrucoesCaixa) <> '' then
                    Boleto.PadroesBoleto.InstrucoesCaixa := Boleto.PadroesBoleto.InstrucoesCaixa + ' <br> ';

                  Boleto.PadroesBoleto.InstrucoesCaixa := Boleto.PadroesBoleto.InstrucoesCaixa + trim(vobs);
                end;

                if trim(vmensagem_adc) <> '' then
                begin
                  if trim(Boleto.PadroesBoleto.InstrucoesCaixa) <> '' then
                    Boleto.PadroesBoleto.InstrucoesCaixa := Boleto.PadroesBoleto.InstrucoesCaixa + ' <br> ';

                  Boleto.PadroesBoleto.InstrucoesCaixa := Boleto.PadroesBoleto.InstrucoesCaixa + trim(vmensagem_adc);
                end;

                if trim(vobs1) <> '' then
                begin
                  if trim(Boleto.PadroesBoleto.InstrucoesCaixa) <> '' then
                    Boleto.PadroesBoleto.InstrucoesCaixa := Boleto.PadroesBoleto.InstrucoesCaixa + ' <br> ';

                  Boleto.PadroesBoleto.InstrucoesCaixa := Boleto.PadroesBoleto.InstrucoesCaixa + trim(vobs1);
                end;

                if trim(vmensagem_desc) <> '' then
                begin
                  if trim(Boleto.PadroesBoleto.InstrucoesCaixa) <> '' then
                    Boleto.PadroesBoleto.InstrucoesCaixa := Boleto.PadroesBoleto.InstrucoesCaixa + ' <br> ';

                  Boleto.PadroesBoleto.InstrucoesCaixa := Boleto.PadroesBoleto.InstrucoesCaixa + trim(vmensagem_desc);
                end;

                // Demonstrativo
                Boleto.PadroesBoleto.Demonstrativo := '';
                if trim(vmensagem_bol) <> '' then
                begin
                	if trim(Boleto.PadroesBoleto.Demonstrativo) <> '' then
                  	Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + ' <br> ';

                  Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + trim(vmensagem_bol);
                end;

                if trim(vobs) <> '' then
                begin
                	if trim(Boleto.PadroesBoleto.Demonstrativo) <> '' then
                  	Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + ' <br> ';

                  Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + trim(vobs);
                end;

                if trim(vlocal_pag) <> '' then
                begin
                	if trim(Boleto.PadroesBoleto.Demonstrativo) <> '' then
                  	Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + ' <br> ';

                  Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + trim(vlocal_pag);
                end;

                if trim(vmensagem_adc) <> '' then
                begin
                	if trim(Boleto.PadroesBoleto.Demonstrativo) <> '' then
                  	Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + ' <br> ';

                  Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + trim(vmensagem_adc);
                end;

                if trim(vobs1) <> '' then
                begin
                	if trim(Boleto.PadroesBoleto.Demonstrativo) <> '' then
                  	Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + ' <br> ';

                  Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + trim(vobs1);
                end;

                if trim(vmensagem_desc) <> '' then
                begin
                	if trim(Boleto.PadroesBoleto.Demonstrativo) <> '' then
                  	Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + ' <br> ';

                  Boleto.PadroesBoleto.Demonstrativo := Boleto.PadroesBoleto.Demonstrativo + trim(vmensagem_desc);
                end;
              end;

              if (vCobreBem.dataSet.FieldByName('GERAR_REGISTRO_MULTA').AsString = 'S') then
              begin
              	MeusDados := Boleto.MeusDados.Add;
                MeusDados.Nome := 'GeraRegistroMulta';
                MeusDados.Valor := 'S';
              end;

              EmailSacado := Boleto.EnderecosEmailSacado.Add;
              EmailSacado.Nome := vCliente.dataSet.FieldByName('NOME_CLIENTE').asString;
              EmailSacado.Endereco := vCliente.dataSet.FieldByName('EMAIL').asString;

              //Busca as informações do Estado (UF)
              Boleto.EstadoSacado := vCliente.dataSet.FieldByName('SIGLA_UF').asString;

              Boleto.ControleProcessamentoDocumento.Imprime := scpExecutar;
              Boleto.ControleProcessamentoDocumento.EnviaEmail := scpExecutar;
              Boleto.ControleProcessamentoDocumento.GravaRemessa := scpExecutar;
              if vCobreBem.dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString = 'S' then
                Boleto.BancoGeraNossoNumero := True
              else
                Boleto.BancoGeraNossoNumero := False;
              if vCobreBem.dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString = 'S' then
                Boleto.BancoEmiteBoleto := True
              else
              begin
                Boleto.BancoEmiteBoleto := False;
                if (Trim(dataSet.FieldByName('BANCOEMITEBOLETO').AsString) <> '') then
                  Boleto.BancoEmiteBoleto := Trim(dataSet.FieldByName('BANCOEMITEBOLETO').AsString) = 'S'
                else if (Trim(vCobreBem.dataSet.FieldByName('BANCOEMITEBOLETO').AsString) <> '') then
                  Boleto.BancoEmiteBoleto := Trim(vCobreBem.dataSet.FieldByName('BANCOEMITEBOLETO').AsString)
                    = 'S';
                if vIndicadorImpressao = 1 then
                  Boleto.BancoEmiteBoleto := False
                else if vIndicadorImpressao = 2 then
                  Boleto.BancoEmiteBoleto := True;
              end;

              if (Trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString) <> '') then
              begin
                if vCobreBem.dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString <> 'S' then
                begin
                  Boleto.NossoNumero := dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString;

                  if (AtivarConfiguracoesImporRet = 'S') and (DesconsiderarDigVerImpBoletoR = 'S') then
                    Boleto.NossoNumero := Copy(Boleto.NossoNumero, 1, Length(Boleto.NossoNumero) -1)
                  else
                  begin
                    if Length(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString) < (Length(CobreBemX.MascaraNossoNumero) + 1) then
                      Boleto.CalculaDacNossoNumero := True;
                    CobreBemX.calculardadosboletos;
                  end;
                end;

                if (dataSet.FieldByName('COD_COBREBEM').AsInteger = 0) then
                begin
                  inherited Edit;
                  dataSet.FieldByName('COD_COBREBEM').AsInteger :=
                    vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger;
                  dataSet.FieldByName('COD_CONTROLE_CX').AsInteger :=
                    vCobreBem.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
                  dataSet.FieldByName('BANCOEMITEBOLETO').AsString :=
                    vCobreBem.dataSet.FieldByName('BANCOEMITEBOLETO').AsString;
                  if not inherited Post then
                  begin
                    Result := False;
                    exit
                  end
                  else
                    vVerificarComitar := true;
                end
                else if dataSet.FieldByName('COD_CONTROLE_CX').AsInteger = 0 then
                begin
                  dataSet.Edit;
                  dataSet.FieldByName('COD_CONTROLE_CX').AsInteger :=
                    vCobreBem.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
                  dataSet.Post;
                end;
                if vCobreBem.dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString = 'S' then
                  vVerificarComitar := true
                else
                begin
                  if not (_AlteraFormaPagamento) then
                  begin
                    Result := false;
                    exit;
                  end
                  else
                    vVerificarComitar := true;
                end;

              end
              else
              begin
                if vCobreBem.dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString <> 'S' then
                  if not (VerificaNossoNumeroRepetido) then
                  begin
                    Result := false;
                    Cancel;
                    exit;
                  end;

                if (CobreBemX.DocumentosCobranca[ContaBoletosDLLCobrebemX].MinhaChave =
                  dataSet.FieldByName('N_SEQ_BOL').asString) then
                begin
                  if (Trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').asString) <>
                    Trim(CobreBemX.DocumentosCobranca[ContaBoletosDLLCobrebemX].NossoNumero)) or
                    (vCobreBem.dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString = 'S') then
                  begin
                    inherited Edit;
                    if vCobreBem.dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString <> 'S' then
                      dataSet.FieldByName('NOSSO_NUMERO_BANCO').asString :=
                        CobreBemX.DocumentosCobranca[ContaBoletosDLLCobrebemX].NossoNumero;

                    if (AtivarConfiguracoesImporRet = 'S') and (DesconsiderarDigVerImpBoletoR = 'S') then
                      CobreBemX.DocumentosCobranca[ContaBoletosDLLCobrebemX].NossoNumero :=
                        Copy(CobreBemX.DocumentosCobranca[ContaBoletosDLLCobrebemX].NossoNumero, 1,
                          Length(CobreBemX.DocumentosCobranca[ContaBoletosDLLCobrebemX].NossoNumero) - 1);

                    if vCobreBem.dataSet.FieldByName('PERMITE_PROTESTO').AsString = 'S' then
                       if dataSet.FieldByName('DIAS_PROTESTO').IsNull then
                          if not vCliente.dataSet.FieldByName('DIASPROTESTO').IsNull then
	                          dataSet.FieldByName('DIAS_PROTESTO').AsInteger := vCliente.dataSet.FieldByName('DIASPROTESTO').AsInteger
	                        else
                            dataSet.FieldByName('DIAS_PROTESTO').AsInteger := vCobreBem.dataSet.FieldByName('DIASPROTESTO').AsInteger;
                    dataSet.FieldByName('COD_COBREBEM').AsInteger := vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger;
                    dataSet.FieldByName('COD_CONTROLE_CX').AsInteger := vCobreBem.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
                    dataSet.FieldByName('BANCOEMITEBOLETO').AsString := vCobreBem.dataSet.FieldByName('BANCOEMITEBOLETO').AsString;
                    dataSet.FieldByName('OBS_BOL').AsString := vobs;
                    dataSet.FieldByName('LOCALPAG').AsString := vlocal_pag;
                    dataSet.FieldByName('MENSAGEM_BOL').AsString := vmensagem_bol;
                    dataSet.FieldByName('MENSAGEM_ADC').AsString := vmensagem_adc;
                    dataSet.FieldByName('MENSAGEM_DESC').AsString := vmensagem_desc;
                    dataSet.FieldByName('MULT_ATR_BOL').asFloat := vmulta;
                    dataSet.FieldByName('M_DIA_BOL').asFloat := vtxjuros;
                    if not dataSet.FieldByName('DATA_VEN_BOL').IsNull then
                    	dataSet.FieldByName('DATA_LIM_DESC').AsDateTime := dataSet.FieldByName('DATA_VEN_BOL').AsDateTime;

                    dataSet.FieldByName('PERMITE_PROTESTO').AsString := IfThen(trim(vpermiteprotesto) = '', 'N', vpermiteprotesto);
                    dataSet.FieldByName('PERMITE_DESCONTO').AsString := IfThen(trim(vpermitedesconto) = '', 'N', vpermitedesconto);

                    dataSet.FieldByName('QTD_DIAS_LIM_DESC').AsInteger := vqtd_dias_lim_desc;

                    vHtmlBoleto.Text := CobreBemX.GeraHTMLBoleto[dataSet.RecNo - 1];

                    if (vCobreBem.dataSet.FieldByName('TESTAR_HTML').AsString <> 'N') then
                      if not vDadosIni.testarHtmlBoleto(
                        dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString,
                        dataSet.FieldByName('CPFCGC').AsString,
                        dataSet.FieldByName('DATA_VEN_BOL').AsDateTime,
                        dataSet.FieldByName('VL_DOC_BOL').AsFloat,
                        dataSet.FieldByName('VL_DESC_BOL').AsFloat,
                        vHtmlBoleto.Text,
                        'HTML') then
                      begin
                        Result := false;
                        Cancel;
                        exit;
                      end;

                    if (vCobreBem.dataSet.FieldByName('LICENCA_GENERICA').AsString = 'S')
                    	and (vDadosIni.apenasNumeros(trim(CobreBemX.CnpjCpfCedente)) = '03530705000109') then
                    begin
                      if (Pos(CobreBemX.NomeCedente, vHtmlBoleto.Text) <> 0) then
                        vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text,
                          CobreBemX.NomeCedente,
                          trim(vCobreBem.dataSet.FieldByName('NOME_EMP_GENERICO').AsString),
                          [rfReplaceAll]);

                      if Length(trim(vDadosIni.vEmp.vCNPJ)) = 14 then
                      begin
                        if (Pos(FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, CobreBemX.CnpjCpfCedente), vHtmlBoleto.Text) <> 0) then
                          vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text,
                            FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, CobreBemX.CnpjCpfCedente),
                            FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                            [rfReplaceAll]);
                      end
                      else
                      begin
                        if (Pos(FormatMaskText('999.999.999-99;0', CobreBemX.CnpjCpfCedente), vHtmlBoleto.Text) <> 0) then
                          vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text,
                            FormatMaskText('999.999.999-99;0', CobreBemX.CnpjCpfCedente),
                            FormatMaskText('999.999.999-99;0', trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                            [rfReplaceAll]);
                      end;

                      if (Pos(CobreBemX.CnpjCpfCedente, vHtmlBoleto.Text) <> 0) then
                        vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text,
                          CobreBemX.CnpjCpfCedente,
                          trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString),
                          [rfReplaceAll]);
                    end
                    else if (vCobreBem.dataSet.FieldByName('LICENCA_GENERICA').AsString = 'S') then
                    begin
                    	vEmpVia1  := false;
                      vEmpVia2  := false;
                    	vCNPJVia1 := false;
                      vCNPJVia2 := false;
                      vVia2     := false;

                    	for J := 0 to vHtmlBoleto.Count - 1 do
                      begin
                      	if (not vVia2)
                        	and (not vEmpVia1)
                        	and (Pos(CobreBemX.NomeCedente, vHtmlBoleto[J]) <> 0) then
                        begin
                        	vHtmlBoleto[J] := StringReplace(vHtmlBoleto[J],
                            CobreBemX.NomeCedente,
                            trim(vCobreBem.dataSet.FieldByName('NOME_EMP_GENERICO').AsString),
                            [rfIgnoreCase]);
                          vEmpVia1 := true;
                        end;

                        if (not vVia2)
                        	and (not vCNPJVia1)
                        	and (Length(trim(vDadosIni.vEmp.vCNPJ)) = 14) then
                        begin
                          if (not vVia2)
                          	and (not vCNPJVia1)
                          	and (Pos(FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, CobreBemX.CnpjCpfCedente), vHtmlBoleto[J]) <> 0) then
                          begin
                            vHtmlBoleto[J] := StringReplace(vHtmlBoleto[J],
                              FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, CobreBemX.CnpjCpfCedente),
                              FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                              [rfIgnoreCase]);
                            vCNPJVia1 := true;
                          end;
                        end
                        else
                        begin
                          if (not vVia2)
                          	and (not vCNPJVia1)
                          	and (Pos(FormatMaskText('999.999.999-99;0', CobreBemX.CnpjCpfCedente), vHtmlBoleto[J]) <> 0) then
                          begin
                            vHtmlBoleto[J] := StringReplace(vHtmlBoleto[J],
                              FormatMaskText('999.999.999-99;0', CobreBemX.CnpjCpfCedente),
                              FormatMaskText('999.999.999-99;0', trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                              [rfIgnoreCase]);
                            vCNPJVia1 := true;
                          end;
                        end;

                        if (not vVia2)
                        	and (not vCNPJVia1)
                          and (Pos(CobreBemX.CnpjCpfCedente, vHtmlBoleto[J]) <> 0) then
                        begin
                          vHtmlBoleto[J] := StringReplace(vHtmlBoleto[J],
                            CobreBemX.CnpjCpfCedente,
                            trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString),
                            [rfIgnoreCase]);
                          vCNPJVia1 := true;
                        end;

                        if (not vVia2)
                        	and (Pos('--- Corte Aqui ----', vHtmlBoleto[J]) <> 0) then
                        begin
                          vVia2 := true;
                        end;

                        if (vVia2)
                        	and (not vEmpVia2)
                        	and (Pos(CobreBemX.NomeCedente, vHtmlBoleto[J]) <> 0) then
                        begin
                        	vHtmlBoleto[J] := StringReplace(vHtmlBoleto[J],
                            CobreBemX.NomeCedente,
                            trim(vCobreBem.dataSet.FieldByName('NOME_EMP_GENERICO').AsString),
                            [rfIgnoreCase]);
                          vEmpVia2 := true;
                        end;

                        if (vVia2)
                        	and (not vCNPJVia2)
                          and (Length(trim(vDadosIni.vEmp.vCNPJ)) = 14) then
                        begin
                          if (vVia2)
                          	and (not vCNPJVia2)
                          	and (Pos(FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, CobreBemX.CnpjCpfCedente), vHtmlBoleto[J]) <> 0) then
                          begin
                            vHtmlBoleto[J] := StringReplace(vHtmlBoleto[J],
                              FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, CobreBemX.CnpjCpfCedente),
                              FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                              [rfIgnoreCase]);
                            vCNPJVia2 := true;
                          end;
                        end
                        else
                        begin
                          if (vVia2)
                          	and (not vCNPJVia2)
                            and (Pos(FormatMaskText('999.999.999-99;0', CobreBemX.CnpjCpfCedente), vHtmlBoleto[J]) <> 0) then
                          begin
                            vHtmlBoleto[J] := StringReplace(vHtmlBoleto[J],
                              FormatMaskText('999.999.999-99;0', CobreBemX.CnpjCpfCedente),
                              FormatMaskText('999.999.999-99;0', trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                              [rfIgnoreCase]);
                            vCNPJVia2 := true;
                          end;
                        end;

                        if (vVia2)
                        	and (not vCNPJVia2)
                          and (Pos(CobreBemX.CnpjCpfCedente, vHtmlBoleto[J]) <> 0) then
                        begin
                          vHtmlBoleto[J] := StringReplace(vHtmlBoleto[J],
                            CobreBemX.CnpjCpfCedente,
                            trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString),
                            [rfIgnoreCase]);
                          vCNPJVia2 := true;
                        end;
                      end;
                    end;
                    _atualizarDadosHtml(vHtmlBoleto);

                    dataSet.FieldByName('HTMLBOLETO').AsString := vHtmlBoleto.Text;
                    vGerarHtml := false;

                    if vCobreBem.dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString <> 'S' then
                      if not (_AlteraFormaPagamento) then
                      begin
                        Result := false;
                        exit;
                      end;

                    if not inherited Post then
                    begin
                      Result := False;
                      exit;
                    end
                    else
                      vVerificarComitar := true;
                  end;
                end;
              end;
          end;

    //      if dataSet.FieldByName('HTMLBOLETO').AsString = '' then
          if ((Trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString) <> '') and (vGerarHtml)) then
          begin
            if inherited Edit then
            begin
              vHtmlBoleto.Text := CobreBemX.GeraHTMLBoleto[dataSet.RecNo - 1];

              if (vCobreBem.dataSet.FieldByName('TESTAR_HTML').AsString <> 'N') then
                if not vDadosIni.testarHtmlBoleto(
                  dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString,
                  dataSet.FieldByName('CPFCGC').AsString,
                  dataSet.FieldByName('DATA_VEN_BOL').AsDateTime,
                  dataSet.FieldByName('VL_DOC_BOL').AsFloat,
                  dataSet.FieldByName('VL_DESC_BOL').AsFloat,
                  vHtmlBoleto.Text,
                  'HTML') then
                begin
                  Result := false;
                  Cancel;
                  exit;
                end;

              if (vCobreBem.dataSet.FieldByName('LICENCA_GENERICA').AsString = 'S')
              	and (vDadosIni.apenasNumeros(trim(CobreBemX.CnpjCpfCedente)) = '03530705000109') then
              begin
                if (Pos(CobreBemX.NomeCedente, vHtmlBoleto.Text) <> 0) then
                  vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text,
                    CobreBemX.NomeCedente,
                    trim(vCobreBem.dataSet.FieldByName('NOME_EMP_GENERICO').AsString),
                    [rfReplaceAll]);

                if Length(trim(vDadosIni.vEmp.vCNPJ)) = 14 then
                begin
                  if (Pos(FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, CobreBemX.CnpjCpfCedente), vHtmlBoleto.Text) <> 0) then
                    vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text,
                      FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, CobreBemX.CnpjCpfCedente),
                      FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                      [rfReplaceAll]);
                end
                else
                begin
                  if (Pos(FormatMaskText('999.999.999-99;0', CobreBemX.CnpjCpfCedente), vHtmlBoleto.Text) <> 0) then
                    vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text,
                      FormatMaskText('999.999.999-99;0', CobreBemX.CnpjCpfCedente),
                      FormatMaskText('999.999.999-99;0', trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                      [rfReplaceAll]);
                end;

                if (Pos(CobreBemX.CnpjCpfCedente, vHtmlBoleto.Text) <> 0) then
                  vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text,
                    CobreBemX.CnpjCpfCedente,
                    trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString),
                    [rfReplaceAll]);
              end
              else if (vCobreBem.dataSet.FieldByName('LICENCA_GENERICA').AsString = 'S') then
              begin
              	vEmpVia1  := false;
                vEmpVia2  := false;
                vCNPJVia1 := false;
                vCNPJVia2 := false;
                vVia2     := false;

                for J := 0 to vHtmlBoleto.Count - 1 do
								begin
                  if (not vVia2)
                    and (not vEmpVia1)
                    and (Pos(CobreBemX.NomeCedente, vHtmlBoleto[J]) <> 0) then
                  begin
                    vHtmlBoleto[J] := StringReplace(vHtmlBoleto[J],
                      CobreBemX.NomeCedente,
                      trim(vCobreBem.dataSet.FieldByName('NOME_EMP_GENERICO').AsString),
                      [rfIgnoreCase]);
                    vEmpVia1 := true;
                  end;

                  if (not vVia2)
                    and (not vCNPJVia1)
                    and (Length(trim(vDadosIni.vEmp.vCNPJ)) = 14) then
                  begin
                    if (not vVia2)
                    	and (not vCNPJVia1)
                      and (Pos(FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, CobreBemX.CnpjCpfCedente), vHtmlBoleto[J]) <> 0) then
                    begin
                      vHtmlBoleto[J] := StringReplace(vHtmlBoleto[J],
                        FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, CobreBemX.CnpjCpfCedente),
                        FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                        [rfIgnoreCase]);
                      vCNPJVia1 := true;
                    end;
                  end
                  else
                  begin
                    if (not vVia2)
                      and (not vCNPJVia1)
                      and (Pos(FormatMaskText('999.999.999-99;0', CobreBemX.CnpjCpfCedente), vHtmlBoleto[J]) <> 0) then
                    begin
                      vHtmlBoleto[J] := StringReplace(vHtmlBoleto[J],
                        FormatMaskText('999.999.999-99;0', CobreBemX.CnpjCpfCedente),
                        FormatMaskText('999.999.999-99;0', trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                        [rfIgnoreCase]);
                      vCNPJVia1 := true;
                    end;
                  end;

                  if (not vVia2)
                    and (not vCNPJVia1)
                    and (Pos(CobreBemX.CnpjCpfCedente, vHtmlBoleto[J]) <> 0) then
                  begin
                    vHtmlBoleto[J] := StringReplace(vHtmlBoleto[J],
                      CobreBemX.CnpjCpfCedente,
                      trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString),
                      [rfIgnoreCase]);
                    vCNPJVia1 := true;
                  end;

                  if (not vVia2)
                    and (Pos('--- Corte Aqui ----', vHtmlBoleto[J]) <> 0) then
                  begin
                    vVia2 := true;
                  end;

                  if (vVia2)
                    and (not vEmpVia2)
                    and (Pos(CobreBemX.NomeCedente, vHtmlBoleto[J]) <> 0) then
                  begin
                    vHtmlBoleto[J] := StringReplace(vHtmlBoleto[J],
                      CobreBemX.NomeCedente,
                      trim(vCobreBem.dataSet.FieldByName('NOME_EMP_GENERICO').AsString),
                      [rfIgnoreCase]);
                    vEmpVia2 := true;
                  end;

                  if (vVia2)
                    and (not vCNPJVia2)
                    and (Length(trim(vDadosIni.vEmp.vCNPJ)) = 14) then
                  begin
                    if (vVia2)
                      and (not vCNPJVia2)
                      and (Pos(FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, CobreBemX.CnpjCpfCedente), vHtmlBoleto[J]) <> 0) then
                    begin
                      vHtmlBoleto[J] := StringReplace(vHtmlBoleto[J],
                        FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, CobreBemX.CnpjCpfCedente),
                        FormatMaskText(HelperCNPJ.EditMask{'99.999.999/9999-99;0'}, trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                        [rfIgnoreCase]);
                      vCNPJVia2 := true;
                    end;
                  end
                  else
                  begin
                    if (vVia2)
                      and (not vCNPJVia2)
                      and (Pos(FormatMaskText('999.999.999-99;0', CobreBemX.CnpjCpfCedente), vHtmlBoleto[J]) <> 0) then
                    begin
                      vHtmlBoleto[J] := StringReplace(vHtmlBoleto[J],
                        FormatMaskText('999.999.999-99;0', CobreBemX.CnpjCpfCedente),
                        FormatMaskText('999.999.999-99;0', trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString)),
                        [rfIgnoreCase]);
                      vCNPJVia2 := true;
                    end;
                  end;

                  if (vVia2)
                    and (not vCNPJVia2)
                    and (Pos(CobreBemX.CnpjCpfCedente, vHtmlBoleto[J]) <> 0) then
                  begin
                    vHtmlBoleto[J] := StringReplace(vHtmlBoleto[J],
                      CobreBemX.CnpjCpfCedente,
                      trim(vCobreBem.dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString),
                      [rfIgnoreCase]);
                    vCNPJVia2 := true;
                  end;
                end;
              end;
               _atualizarDadosHtml(vHtmlBoleto);
              dataSet.FieldByName('HTMLBOLETO').AsString := vHtmlBoleto.Text;
              dataSet.Post;
            end;
          end;

          if vCobreBem.dataSet.FieldByName('PERMITE_PROTESTO').AsString <> 'S' then
            if inherited Edit then
            begin
              dataSet.FieldByName('DIAS_PROTESTO').Value := Null;
              dataSet.Post;
            end;
          Boleto.DiasProtesto := dataSet.FieldByName('DIAS_PROTESTO').AsInteger;
          Result := true;

        	if Result then
          	vDadosIni.GravaAuditoria('BOL010',
            	'IMPRIMIR',
            	dataSet.FieldByName('N_DOC_BOL').AsString + ' | ' + dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString,
              'BOLETAS',
              dataSet.FieldByName('N_SEQ_BOL').AsString,
              buscas);

          if (pOrigem = cBoleto) then
          begin
            vDiretorio := true;

            if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
              CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas');

            if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
              vDiretorio := false;

            if vDiretorio then
            begin
              if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp') then
                CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp');

              if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp') then
                vDiretorio := false;
            end;

            if vDiretorio then
            begin
              try
                if trim(dataSet.FieldByName('HTMLBOLETO').AsString) <> '' then
                   vHtmlBoleto.Text := dataSet.FieldByName('HTMLBOLETO').AsString;

                vHtmlBoleto.SaveToFile(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + dataSet.FieldByName('N_SEQ_BOL').AsString + '.html');
                _escreverArquivoHtmlIni;
                vtemp := 'htm2pdf "' + vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + dataSet.FieldByName('N_SEQ_BOL').AsString + '.html" ' +
                    '"' + vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + dataSet.FieldByName('N_SEQ_BOL').AsString + '.pdf" /silent';
                try
                  vDadosIni.CreateProcessSimple(vtemp, true);
                finally
                  if FileExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + dataSet.FieldByName('N_SEQ_BOL').AsString + '.html') then
                    DeleteFile(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + dataSet.FieldByName('N_SEQ_BOL').AsString + '.html');
                end;

                try
                  vAssuntoEmail := vDadosIni.vBoletos.vAssunto_bol;
                  vMensagemEmail := vDadosIni.vBoletos.vMsg_bol.Text;
                  vAssuntoWhatsApp := vDadosIni.vBoletos.vAssuntoWhatsApp_bol;
                  vMensagemWhatsApp := vDadosIni.vBoletos.vMsgWhatsApp_bol.Text;

                  if (pConfEmailWhatsApp) and (not pUnicoEmailWhatsApp) then
                    if not abreFormConfEmail(pArrayAplicativo, pArrayContato, pEnviar) then
                      Exit;

                  if (pEnviar) and (not pUnicoEmailWhatsApp) then
                  begin
                    if Length(pArrayContato) > 0 then
                    begin
                      for K := 0 to Length(pArrayContato) - 1 do
                      begin
                        vDadosIni.retornaMensagemEnv(pOrigem, pArrayContato[K].Aplicativo, vAssunto, vMensagem);

                        try
                          if not vDadosIni.EnvEmail(
                            vAssunto,
                            vMensagem,
                            dataSet.FieldByName('COD_CLIENTE').AsInteger,
                            pArrayContato[K].Aplicativo,
                            vNumDoc,
                            vTipoDoc,
                            cBoleto,
                            vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + dataSet.FieldByName('N_SEQ_BOL').AsString + '.pdf',
                            1,
                            True,
                            pArrayContato[K].Identificacao,
                            pArrayContato[K].Contato,
                            pArrayContato[K].Avulso) then
                          begin
                            Application.MessageBox(PChar('Falha ao enviar ' + LowerCase(AplicativoEnvStr[pArrayContato[K].Aplicativo]) + ' para ' + trim(pArrayContato[K].Identificacao) + '.'), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
                          end;
                        except
                          Application.MessageBox(PChar('Falha ao enviar ' + LowerCase(AplicativoEnvStr[pArrayContato[K].Aplicativo]) + ' para ' + trim(pArrayContato[K].Identificacao) + '.'), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
                        end;
                      end;
                    end
                    else
                    begin
                      for vAplicativo in pArrayAplicativo do
                      begin
                        vDadosIni.retornaMensagemEnv(pOrigem, vAplicativo, vAssunto, vMensagem);

                        vArrayContato := vDadosIni.retornaArrayContato(dataSet.FieldByName('COD_CLIENTE').AsInteger, vAplicativo, pOrigem, False);

                        for K := 0 to Length(vArrayContato) - 1 do
                        begin
                          try
                            if not vDadosIni.EnvEmail(
                              vAssunto,
                              vMensagem,
                              dataSet.FieldByName('COD_CLIENTE').AsInteger,
                              vArrayContato[K].Aplicativo,
                              vNumDoc,
                            	vTipoDoc,
                              cBoleto,
                              vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + dataSet.FieldByName('N_SEQ_BOL').AsString + '.pdf',
                              1,
                              True,
                              vArrayContato[K].Identificacao,
                              vArrayContato[K].Contato,
                              vArrayContato[K].Avulso) then
                            begin
                              Application.MessageBox(PChar('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[K].Aplicativo]) + ' para ' + trim(vArrayContato[K].Identificacao) + '.'), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
                            end;
                          except
                            Application.MessageBox(PChar('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[K].Aplicativo]) + ' para ' + trim(vArrayContato[K].Identificacao) + '.'), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
                          end;
                        end;
                      end;
                    end;
                  end;
                finally
                  vDadosIni.vBoletos.vAssunto_bol := vAssuntoEmail;
                  vDadosIni.vBoletos.vMsg_bol.Text := vMensagemEmail;
                  vDadosIni.vBoletos.vAssuntoWhatsApp_bol := vAssuntoWhatsApp;
                  vDadosIni.vBoletos.vMsgWhatsApp_bol.Text := vMensagemWhatsApp;
                end;

               finally
                 if not pUnicoEmailWhatsApp then
                   if FileExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + dataSet.FieldByName('N_SEQ_BOL').AsString + '.pdf') then
                     DeleteFile(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + dataSet.FieldByName('N_SEQ_BOL').AsString + '.pdf');
               end;
            end
            else if trim(vDadosIni.vProcessoEnviar) <> '' then
              vDadosIni.GravaAuditoria(vDadosIni.vProcessoEnviar, 'ENVIAR', 'FALHA', 'BOLETAS', dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);
          end;

           dataset.Next;
         end;
       finally
         dataset.First;
         dataset.EnableControls;
       end;
     finally
       if Assigned(Aconf) then
       	 FreeAndNil(Aconf)
     end;
  finally
     vDadosIni.fechaStatusProcessamento;
  end;
end;

function TBoleto._AlteraFormaPagamento: boolean;
var
  UsarBoleto: string;
  NumeroProcessamento: string;
  buscas2: TIBQuery;
begin
  //try
  result := true;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  vComitarFormaPagamento := true;
  if dataSet.FieldByName('cod_cred').AsInteger > 0 then
  begin
    vQueryFinanceiro.Close;
    vQueryFinanceiro.sql.text := 'update controle_creditos cc ' +
      ' set cc.nosso_numero_banco = ' + QuotedStr(dataSet.FieldByName('NOSSO_NUMERO_BANCO').asString) + ', ' +
      ' cc.cod_cobrebem = ' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) +
      ' where cc.cod_cred = ' + IntToStr(dataSet.FieldByName('COD_CRED').AsInteger) +
      vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
      	' and cc.cod_emp_mult = ' + vDadosIni.codEmpresa,
	      ' and cc.codigo_emp = ' + vDadosIni.codEmpresa);
    vQueryFinanceiro.Prepare;
    vQueryFinanceiro.ExecSQL;
  end
  else if Trim(dataSet.FieldByName('TIPO_EMISSAO').AsString) = 'NF' then
  begin
    UsarBoleto := '';
    NumeroProcessamento := '';

    UsarBoleto :=
    	Retornavalor('select ctr.usar_boleto as valor from formpagamento fp' +
      ' inner join controles ctr on ctr.codigo_ctrl = fp.cod_controle and ctr.codigo_emp = fp.cod_empresa ' +
      ' WHERE fp.COD_CLIENTE = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) +
      ' and fp.COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' and fp.NDOC = ' + QuotedStr(dataSet.FieldByName('N_DOC_BOL').AsString) +
      ' and fp.NUM_NOTA = ' + IntToStr(dataSet.FieldByName('NUM_NF_VND').AsInteger) +
      ' and fp.SUB_SERIE = ' + IntToStr(dataSet.FieldByName('SUB_SERIE').AsInteger) +
      ' and ctr.USAR_BOLETO = ''S'' ');

    if trim(UsarBoleto) = 'S' then
      NumeroProcessamento :=
        Retornavalor('select n_processamento as valor from formpagamento' +
        ' WHERE COD_CLIENTE = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) +
        ' and COD_EMPRESA = ' + vDadosIni.codEmpresa +
        ' and NDOC = ' + QuotedStr(dataSet.FieldByName('N_DOC_BOL').AsString) +
        ' and NUM_NOTA = ' + IntToStr(dataSet.FieldByName('NUM_NF_VND').AsInteger) +
        ' and SUB_SERIE = ' + IntToStr(dataSet.FieldByName('SUB_SERIE').AsInteger));

    if NumeroProcessamento <> '' then
    begin
      vQueryFinanceiro.Close;
      vQueryFinanceiro.sql.text := 'update controle_creditos cc ' +
        ' set cc.nosso_numero_banco = ' + QuotedStr(dataSet.FieldByName('NOSSO_NUMERO_BANCO').asString) + ', ' +
        ' cc.cod_cobrebem = ' + IntToStr(dataSet.FieldByName('COD_COBREBEM').asInteger) +
        ' where cc.cod_cred = ' + NumeroProcessamento +
        vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
	      	' and cc.cod_emp_mult = ' + vDadosIni.codEmpresa,
        	' and cc.codigo_emp = ' + vDadosIni.codEmpresa);
      vQueryFinanceiro.Prepare;
      vQueryFinanceiro.ExecSQL;
    end;
    //else
   // begin
    if trim(UsarBoleto) = 'S' then
    begin
      vQueryFinanceiro.Close;
      vQueryFinanceiro.sql.text := 'update formpagamento set' +
        ' nosso_numero_banco = ' + QuotedStr(dataSet.FieldByName('NOSSO_NUMERO_BANCO').asString) + ', ' +
        ' cod_cobrebem = ' + IntToStr(dataSet.FieldByName('COD_COBREBEM').asInteger) +
        ' where cod_cliente = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ndoc = ' + QuotedStr(dataSet.FieldByName('N_DOC_BOL').asString) +
        ' and num_nota = ' + IntToStr(dataSet.FieldByName('NUM_NF_VND').AsInteger) +
        ' and sub_serie = ' + IntToStr(dataSet.FieldByName('SUB_SERIE').AsInteger);
      if dataSet.FieldByName('cod_controle_cx').AsInteger > 0 then
        vQueryFinanceiro.sql.text := vQueryFinanceiro.sql.text + ' and cod_controle = ' + IntToStr(dataSet.FieldByName('cod_controle_cx').AsInteger);
      vQueryFinanceiro.Prepare;
      vQueryFinanceiro.ExecSQL;
    end;

    //end;
  end
  else if not (dataSet.FieldByName('NUM_NF_VND').isnull) then
  begin
    UsarBoleto := '';
    NumeroProcessamento := '';

    if dataSet.FieldByName('SEQFORM').AsInteger > 0 then
    begin
      buscas2.Close;
      buscas2.SQL.Text := ' select fp.seqform, fp.cod_empresa, ' +
        ' fp.n_processamento, ctr.usar_boleto from formpagamento fp ' +
        ' inner join controles ctr on ctr.codigo_ctrl = fp.cod_controle and ctr.codigo_emp = fp.cod_empresa ' +
        ' WHERE fp.SEQFORM = ' + IntToStr(dataSet.FieldByName('SEQFORM').AsInteger) +
        ' and fp.COD_EMPRESA = ' + vDadosIni.codEmpresa;
      buscas2.Open;

      UsarBoleto := buscas2.FieldByName('USAR_BOLETO').AsString;

      if trim(UsarBoleto) = 'S' then
      	NumeroProcessamento := buscas2.FieldByName('N_PROCESSAMENTO').AsString;
    end
    else
    begin
      buscas2.Close;
      buscas2.SQL.Text := ' select fp.seqform, fp.cod_empresa, ctr.usar_boleto from formpagamento fp ' +
        ' inner join controles ctr on ctr.codigo_ctrl = fp.cod_controle and ctr.codigo_emp = fp.cod_empresa ' +
        ' WHERE fp.COD_CLIENTE = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) +
        ' and fp.COD_EMPRESA = ' + vDadosIni.codEmpresa +
        ' and fp.NDOC = ' + QuotedStr(dataSet.FieldByName('N_DOC_BOL').asString) +
        ' AND fp.NREQUISICAO = ' + dataSet.FieldByName('NUM_NF_VND').asString +
        ' and fp.TPDOCS = ' + QuotedStr(dataSet.FieldByName('TIPO_EMISSAO').asString) +
        ' and ctr.USAR_BOLETO = ''S'' ';
      buscas2.Open;

      if buscas2.IsEmpty then
      begin
        buscas2.Close;
        buscas2.SQL.Text := ' select fp.seqform, fp.cod_empresa, ctr.usar_boleto from formpagamento fp ' +
          ' inner join controles ctr on ctr.codigo_ctrl = fp.cod_controle and ctr.codigo_emp = fp.cod_empresa ' +
          ' WHERE fp.COD_CLIENTE = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) +
          ' and fp.COD_EMPRESA = ' + vDadosIni.codEmpresa +
          ' and fp.NPARCELA = ' + IntToStr(dataSet.FieldByName('NPARCELA').AsInteger) +
          ' and fp.NREQUISICAO = ' + dataSet.FieldByName('NUM_NF_VND').asString +
          ' and fp.TPDOCS = ' + QuotedStr(dataSet.FieldByName('TIPO_EMISSAO').asString) +
          ' and ctr.USAR_BOLETO = ''S'' ';
        buscas2.Open;
      end;

      UsarBoleto := buscas2.FieldByName('USAR_BOLETO').AsString;

      if trim(UsarBoleto) = 'S' then
      begin
        buscas2.Close;
        buscas2.SQL.Text := ' select seqform, cod_empresa, n_processamento from formpagamento' +
          ' WHERE COD_CLIENTE = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) +
          ' and COD_EMPRESA = ' + vDadosIni.codEmpresa +
          ' and NDOC = ' + QuotedStr(dataSet.FieldByName('N_DOC_BOL').asString) +
          ' and NREQUISICAO = ' + dataSet.FieldByName('NUM_NF_VND').asString +
          ' and TPDOCS = ' + QuotedStr(dataSet.FieldByName('TIPO_EMISSAO').asString) +
          ' order by 3 desc ';
        buscas2.Open;

        if buscas2.IsEmpty then
        begin
          buscas2.Close;
          buscas2.SQL.Text := ' select seqform, cod_empresa, n_processamento from formpagamento ' +
            ' WHERE COD_CLIENTE = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) +
            ' and COD_EMPRESA = ' + vDadosIni.codEmpresa +
            ' and NPARCELA = ' + IntToStr(dataSet.FieldByName('NPARCELA').AsInteger) +
            ' and NREQUISICAO = ' + dataSet.FieldByName('NUM_NF_VND').asString +
            ' and TPDOCS = ' + QuotedStr(dataSet.FieldByName('TIPO_EMISSAO').asString) +
            ' order by 3 desc ';
          buscas2.Open;
        end;

        NumeroProcessamento := buscas2.FieldByName('N_PROCESSAMENTO').AsString;
      end;
    end;

    if NumeroProcessamento <> '' then
    begin
      vQueryFinanceiro.Close;
      vQueryFinanceiro.sql.text := 'update controle_creditos cc ' +
        ' set cc.nosso_numero_banco = ' + QuotedStr(dataSet.FieldByName('NOSSO_NUMERO_BANCO').asString) + ', ' +
        ' cc.cod_cobrebem = ' + IntToStr(dataSet.FieldByName('COD_COBREBEM').asInteger) +
        ' where cc.cod_cred = ' + NumeroProcessamento +
        vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
        	' and cc.cod_emp_mult = ' + vDadosIni.codEmpresa,
	        ' and cc.codigo_emp = ' + vDadosIni.codEmpresa);
      vQueryFinanceiro.Prepare;
      vQueryFinanceiro.ExecSQL;
    end;
    //else
   // begin
    if trim(UsarBoleto) = 'S' then
    begin
    	if dataSet.FieldByName('SEQFORM').AsInteger > 0 then
      begin
      	vQueryFinanceiro.Close;
        vQueryFinanceiro.sql.text := 'update formpagamento set' +
          ' nosso_numero_banco = ' + QuotedStr(dataSet.FieldByName('NOSSO_NUMERO_BANCO').asString) + ', ' +
          ' cod_cobrebem = ' + IntToStr(dataSet.FieldByName('COD_COBREBEM').asInteger) +
          ' where seqform = ' + IntToStr(dataSet.FieldByName('seqform').AsInteger) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        vQueryFinanceiro.Prepare;
        vQueryFinanceiro.ExecSQL;
      end
      else
      begin
        buscas2.Close;
        buscas2.SQL.Text := 'select seqform, cod_empresa, n_processamento from formpagamento ' +
          ' where cod_cliente = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa +
          ' and ndoc = ' + QuotedStr(dataSet.FieldByName('N_DOC_BOL').asString) +
          ' and nrequisicao = ' + dataSet.FieldByName('NUM_NF_VND').asString +
          ' and tpdocs = ' + QuotedStr(dataSet.FieldByName('TIPO_EMISSAO').asString);
        if dataSet.FieldByName('cod_controle_cx').AsInteger > 0 then
          buscas2.SQL.Text := buscas2.SQL.Text + ' and cod_controle = ' + IntToStr(dataSet.FieldByName('cod_controle_cx').AsInteger);
        buscas2.Open;

        if not buscas2.IsEmpty then
        begin
          vQueryFinanceiro.Close;
          vQueryFinanceiro.sql.text := 'update formpagamento set' +
            ' nosso_numero_banco = ' + QuotedStr(dataSet.FieldByName('NOSSO_NUMERO_BANCO').asString) + ', ' +
            ' cod_cobrebem = ' + IntToStr(dataSet.FieldByName('COD_COBREBEM').asInteger) +
            ' where cod_cliente = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa +
            ' and ndoc = ' + QuotedStr(dataSet.FieldByName('N_DOC_BOL').asString) +
            ' and nrequisicao = ' + dataSet.FieldByName('NUM_NF_VND').asString +
            ' and tpdocs = ' + QuotedStr(dataSet.FieldByName('TIPO_EMISSAO').asString);
          if dataSet.FieldByName('cod_controle_cx').AsInteger > 0 then
            vQueryFinanceiro.sql.text := vQueryFinanceiro.sql.text + ' and cod_controle = ' + IntToStr(dataSet.FieldByName('cod_controle_cx').AsInteger);
          vQueryFinanceiro.Prepare;
          vQueryFinanceiro.ExecSQL;
        end
        else
        begin
          vQueryFinanceiro.Close;
          vQueryFinanceiro.sql.text := 'update formpagamento set' +
            ' nosso_numero_banco = ' + QuotedStr(dataSet.FieldByName('NOSSO_NUMERO_BANCO').asString) + ', ' +
            ' cod_cobrebem = ' + IntToStr(dataSet.FieldByName('COD_COBREBEM').asInteger) +
            ' where cod_cliente = ' + IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa +
            ' and nparcela = ' + IntToStr(dataSet.FieldByName('NPARCELA').AsInteger) +
            ' and nrequisicao = ' + dataSet.FieldByName('NUM_NF_VND').asString +
            ' and tpdocs = ' + QuotedStr(dataSet.FieldByName('TIPO_EMISSAO').asString);
          if dataSet.FieldByName('cod_controle_cx').AsInteger > 0 then
            vQueryFinanceiro.sql.text := vQueryFinanceiro.sql.text + ' and cod_controle = ' + IntToStr(dataSet.FieldByName('cod_controle_cx').AsInteger);
          vQueryFinanceiro.Prepare;
          vQueryFinanceiro.ExecSQL;
        end;
      end;
    end;

    //end;
  end;



  //except
 //   result := false;
 // end;

end;

procedure TBoleto._atualizarDadosHtml(vHtmlBoleto: TStringList);
begin
//  // Carregar imagem a.gif, convertendo para base 64
//  vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text, 'class=n src="a.gif">', 'class=n src="data:image/gif;base64,R0lGODlhAQAyAIAAAAAAAP///ywAAAAAAQAyAAACBoSPqcudBQA7">', [rfReplaceAll]);
//  // Carregar imagem b.gif, convertendo para base 64
//  vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text, 'class=n src="b.gif">', 'class=n src="data:image/gif;base64,R0lGODlhAQAyAIAAAAAAAP///ywAAAAAAQAyAAACBoyPqcudBQA7">', [rfReplaceAll]);
//  // Carregar imagem c.gif, convertendo para base 64
//  vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text, 'class=w src="c.gif">', 'class=w src="data:image/gif;base64,R0lGODlhAwAyAIAAAAAAAP///ywAAAAAAwAyAAACCoSPqcvtD6OcVBYAOw==">', [rfReplaceAll]);
//  // Carregar imagem d.gif, convertendo para base 64
//  vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text, 'class=w src="d.gif">', 'class=w src="data:image/gif;base64,R0lGODlhAwAyAIAAAAAAAP///ywAAAAAAwAyAAACCoyPqcvtD6OcVBYAOw==">', [rfReplaceAll]);
//  // Carregar logo empresa (logo da empresa convertida para base 64 e salva no banco)
//  vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text, '<td width=40% valign=bottom height=60><p align=left>&nbsp;</td>', '<td valign=bottom width=149><p align=left><p align=left><img src="data:image/gif;base64,' + vCobreBem.dataSet.FieldByName('LOGOEMPBASE64').AsString+ '" width="149" height="38">&nbsp;</td>', [rfReplaceAll]);
//  // Carregar logo banco (logo do banco convertida para base 64 e salva no banco)
//  vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text, '<img src="'+vCobreBem.dataSet.FieldByName('BANCO').AsString+'.jpg"', '<img src="data:image/gif;base64,' + vCobreBem.dataSet.FieldByName('LOGOBANCOBASE64').AsString + '"', [rfReplaceAll]);

  // Carregar imagem a.gif, mudando diretório da imagem
  vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text, 'class=n src="a.gif">', 'class=n src="' + ExtractFileDir(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\a.gif">', [rfReplaceAll]);
  // Carregar imagem b.gif, mudando diretório da imagem
  vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text, 'class=n src="b.gif">', 'class=n src="' + ExtractFileDir(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\b.gif">', [rfReplaceAll]);
  // Carregar imagem c.gif, mudando diretório da imagem
  vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text, 'class=w src="c.gif">', 'class=w src="' + ExtractFileDir(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\c.gif">', [rfReplaceAll]);
  // Carregar imagem d.gif, mudando diretório da imagem
  vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text, 'class=w src="d.gif">', 'class=w src="' + ExtractFileDir(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\d.gif">', [rfReplaceAll]);
  // Carregar logo empresa (mudando diretório da imagem)
  if trim(vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').AsString) <> '' then
  	 vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text, '<td width=40% valign=bottom height=60><p align=left>&nbsp;</td>', '<td valign=bottom width=149><p align=left><p align=left><img src="' + vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').AsString + '" width="149" height="38">&nbsp;</td>', [rfReplaceAll]);
  // Carregar logo banco (mudando diretório da imagem)
  vHtmlBoleto.Text := StringReplace(vHtmlBoleto.Text, '<img src="'+vCobreBem.dataSet.FieldByName('BANCO').AsString+'.jpg"', '<img src="'+ ExtractFileDir(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\' + vCobreBem.dataSet.FieldByName('BANCO').AsString+'.jpg"', [rfReplaceAll]);
end;

function TBoleto._BoletosNFOS(
	pImprimir: boolean;
  pEnviar: boolean;
  pArrayAplicativo: arrayaplicativo;
  pArrayContato: arraycontato;
  pOrigem: TOrigemEnv;
  pListBoletas: TStringList;
  pConfEmailWhatsApp: boolean;
  pExibirPergunta: boolean = True;
  pCodCobrebem: Integer = 0;
  pExibirHint: boolean = True): boolean;
var
  Boleto: TBoleto;
  selecionados: RBoletosSelecionados;
  vMens, vMens2: string;
  vOOK: boolean;
  vListaControles: TStringList;
//  vListaControles: TStringList;
  I: Integer;
  vTemp: string;
begin
     Result := False;
     try
    {0}try
        vTemp := '';

        vListaControles := TStringList.Create;
        vListaControles.Sorted := True;
        vListaControles.Duplicates := dupIgnore;
        vListaControles.Clear;

        vMens := 'Deseja ' + vDadosIni.IfThen(pImprimir, 'Imprimir', '') +
                             vDadosIni.IfThen(pImprimir and pEnviar, '/', '') +
                             vDadosIni.IfThen(pEnviar, 'Enviar', '') + ' ' +
                             OrigemEnvStr[pOrigem] + '?';

        vMens2 := vDadosIni.IfThen(pImprimir, 'Imprimindo', '') +
                	vDadosIni.IfThen(pImprimir and pEnviar, '/', '') +
         					vDadosIni.IfThen(pEnviar, 'Enviando', '') + ' ' +
                  OrigemEnvStr[pOrigem];

        if pExibirHint then
        	vDadosIni.abreStatusProcessamento('', vMens2);

        if not pExibirPergunta then
        	vOOK := True
        else
        	vOOK := Application.MessageBox(pchar(vMens), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes;

        if Boleto = nil then
        begin
          Boleto := TBoleto.create;
          Boleto.criaBoletoCobreBemX;
        end;

        if vOOK then
        begin
          for I := 0 to pListBoletas.Count - 1 do
            vTemp := vTemp + pListBoletas[I] +', ';
          vTemp := '(' + Copy(vTemp, 1, Length(vTemp) - 2) + ')';

          Result :=
               Boleto.montaSelect('select ' + Fsql_campos + ' FROM BOLETAS ' +
                Fsql_inner +
               	' WHERE BOLETAS.cod_empresa = ' + vDadosIni.codEmpresa +
                ' and CLIENTES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
                ' and BOLETAS.ATIVO = 1 ' +
                ' and BOLETAS.N_SEQ_BOL IN ' + vTemp);
          if Boleto.dataSet.FieldByName('COD_CONTROLE_CX').AsInteger > 0 then
            Boleto.vCobreBem.abreCobreBemImpressao(Boleto.dataSet.FieldByName('COD_CONTROLE_CX').AsInteger);

         if Boleto.dataSet.IsEmpty then
           exit;

         {3}if (Boleto.vCobreBem.dataSet.IsEmpty) then
          begin
            Application.MessageBox('A empresa não possui configurações de convênio para impressão.',
              'Mensagem', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
            Result := false;
            exit;
          end; {3}

          try
            Boleto.dataSet.DisableControls;
            Boleto.dataSet.First;
            while not Boleto.dataSet.Eof do
            begin
              vListaControles.Add(IntToStr(Boleto.dataSet.FieldByName('cod_controle_cx').AsInteger));
              Boleto.dataSet.Next;
            end;
          finally
            Boleto.dataSet.First;
            Boleto.dataSet.EnableControls;
          end;
          if vListaControles.Count = 0 then
            vListaControles.Add('0')
          else if vListaControles.Count > 1 then
            Application.MessageBox('Foram gerados boletos em controles diferentes. O sistema vai abrir a impressão para cada controle diferente encontrado', 'Antenção', 0 + 64);

          for I := 0 to vListaControles.Count - 1 do
          begin
            try
              if vListaControles[i] = '0'  then
                Boleto.dataSet.Filter := 'cod_controle_cx = 0 or cod_controle_cx is null'
              else
                Boleto.dataSet.Filter := 'cod_controle_cx = ' + vListaControles[i];
              Boleto.dataSet.Filtered := True;
//              if Tipo_Emissao <> 'CRB' then
              begin
                Boleto.vCobreBem.abreCobreBemImpressao( StrToIntDef(vListaControles[i], 0));
                if (Boleto.vCobreBem.dataSet.IsEmpty) then
                begin
                  Application.MessageBox(PChar('Sem configuração de boletos para o controle: ' + vListaControles[i] + #13 +
                  'A impressão não pode continuar'),
                    'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
                  Result := false;
                  exit;
                end;
              end;

              if pCodCobrebem > 0 then
              begin
                Boleto.vCobreBem.dataSet.IndexFieldNames := 'COD_COBREBEM';
                Boleto.vCobreBem.dataSet.FindNearest([pCodCobrebem]);
              end
              else if (Boleto.dataSet.FieldByName('COD_COBREBEM').AsInteger > 0)
                and (pEnviar) then
              begin
                Boleto.vCobreBem.dataSet.IndexFieldNames := 'COD_COBREBEM';
                Boleto.vCobreBem.dataSet.FindNearest([Boleto.dataSet.FieldByName('COD_COBREBEM').AsInteger]);
              end
              else
              begin
                Application.CreateForm(TfrmSelecionaCobrebem, frmSelecionaCobrebem);
                frmSelecionaCobrebem.ckImprimirBoleto.Enabled := pImprimir;
                frmSelecionaCobrebem.ckEnviarBoleto.Enabled := pEnviar;

                frmSelecionaCobrebem.FrameCheckListaContato.CodCliente := 0;
                frmSelecionaCobrebem.FrameCheckListaContato.Origem := pOrigem;
                frmSelecionaCobrebem.FrameCheckListaContato.UnicoMens := False;

                try
                  frmSelecionaCobrebem.DBLookupComboBox_Cobrebem.KeyValue := 0;
                  if Boleto.dataSet.FieldByName('COD_COBREBEM').AsInteger > 0 then
                    frmSelecionaCobrebem.DBLookupComboBox_Cobrebem.KeyValue := Boleto.dataSet.FieldByName('COD_COBREBEM').AsInteger
                  else if Boleto.vCobreBem.dataSet.RecordCount = 1 then
                    frmSelecionaCobrebem.DBLookupComboBox_Cobrebem.KeyValue := Boleto.vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger;

                  if frmSelecionaCobrebem.ShowModal <> IDOK then
                  begin
                    Result := false;
                    Exit;
                  end;

                  pArrayAplicativo := vDadosIni.retornaArrayAplicativo(frmSelecionaCobrebem.FrameCheckListaContato.CheckListBoxAplicativo, True);
                  pArraycontato    := vDadosIni.retornaArrayContato(frmSelecionaCobrebem.FrameCheckListaContato.CheckListBoxContato, True);
                finally
                  frmSelecionaCobrebem.Free;
                  frmSelecionaCobrebem := nil;
                end;
              end;
              
              try
                Boleto.dataSet.DisableControls;
                Boleto.dataSet.First;
                while not (Boleto.dataSet.Eof) do
                begin
                  Boleto.dataSet.Edit;
                  Boleto.dataSet.FieldByName('SelecionaBoleto').Value := 'S';
                  Boleto.dataSet.Post;
                  Boleto.dataSet.Next;
                end;
              finally
                Boleto.dataSet.First;
                Boleto.dataSet.EnableControls;
              end;

              if not Boleto._validadados then
                exit;

              if Boleto.vCobreBem.dataSet.FieldByName('TIPO_API').AsString = 'S' then
              begin
                selecionados := Boleto.HandleBoletos;

                if selecionados.Erros <> '' then
                begin
                  ShowAtencao(selecionados.Erros);
                  Exit;
                end;

                if Length(selecionados.lista) > 0 then
                  Boleto._GerarBoletosPlugBoletos(
                    selecionados.lista,
                    0,
                    0,
                    '',
                    pImprimir,
                    pEnviar,
                    pArrayAplicativo,
                    pArrayContato,
                    pOrigem,
                    pConfEmailWhatsApp,
                    False,
                    '',
                    '',
                    pExibirHint);
              end
              else
              begin
                if not Boleto.TestarBoletos then
                  Exit;

                if not (Boleto._GerarBoletosDLLCobrebem(
                	0,
                  0,
                  '',
                  pImprimir,
                  pEnviar,
                  pArrayAplicativo,
                  pArrayContato,
                  pOrigem,
                  pConfEmailWhatsApp,
                  False,
                  pExibirHint)) then
                begin
                  Result := False;
                  exit;
                end;
              end;                               

            finally
              Boleto.dataSet.Filter := '';
              Boleto.dataSet.Filtered := False;
            end;
          end;
        end;

        if (Boleto <> nil) then
          Boleto.Cancel;
        Boleto.free;
        Boleto := nil;

    except on E: Exception do
    	begin
        Result := false;
        if (Boleto <> nil) then
          Boleto.Cancel;
        Boleto.free;
        Boleto := nil;
        Application.MessageBox('Erro ao gravar registro, verifique as configurações. Se o erro persistir contacte o administrador da rede.', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
        registraErro('function TBoleto._BoletosNFOS. Erro: ' + e.Message);
        exit;
	    end;
  	end;
   finally
     vDadosIni.fechaStatusProcessamento;
   end;

  Result := true;
end;

function TBoleto._BoletosNFOS(
	pNumeroNFVenda: integer;
  pSubSerieNF: integer;
  pTipo_Emissao: string;
  pCodCliente: Integer;
  pNossoNumero: string = '';
  pImprimir: boolean = true;
  pEnviar: boolean = false;
  pArrayAplicativo: arrayaplicativo = [];
  pArrayContato: arraycontato = nil;
  pOrigem: TOrigemEnv = cBoleto;
  pConfEmailWhatsApp: boolean = false;
  pCodCobrebem: Integer = 0): boolean;
var
  Boleto: TBoleto;
  selecionados: RBoletosSelecionados;
  vMens: string;
  vOOK: boolean;
  vListaControles: TStringList;
  I, J: Integer;
  vImprimir: boolean;
  vEnviar: boolean;
begin
     pTipo_Emissao := trim(pTipo_Emissao);
  {0}try

    {1}if ((((vDadosIni.vEmp.vImprimirBoletoNF = 'S') and (pTipo_Emissao = 'NF'))) or
      ((vDadosIni.vEmp.vImprimirBoletoOS = 'S') and ((pTipo_Emissao = 'REQ') or (pTipo_Emissao = 'OS') or (pTipo_Emissao = 'REC'))) or
      (pTipo_Emissao = 'CR') or (pTipo_Emissao = 'CRB') or (pTipo_Emissao = 'CRED')) then
    begin

      vMens := 'Deseja imprimir os boletos?';

      if (pTipo_Emissao = 'CR') then
        vMens := 'Gerar carne para o banco?';

      vListaControles := TStringList.Create;
      vListaControles.Sorted := True;
      vListaControles.Duplicates := dupIgnore;
      vListaControles.Clear;

      vImprimir := true;
      vEnviar := false;

      vOOK := true;

      if vOOK then
      begin

        if Boleto = nil then
        begin
          Boleto := TBoleto.create;
          Boleto.criaBoletoCobreBemX;
        end;

        if (pTipo_Emissao = 'NF') then
        begin
          Result :=
            Boleto.montaSelect('select ' + Fsql_campos + ' FROM BOLETAS ' +
              Fsql_inner +
              ' WHERE BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
              ' and CLIENTES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
              vDadosIni.IfThen(pCodCobrebem > 0, ' and BOLETAS.COD_COBREBEM = ' + IntToStr(pCodCobrebem), '') +
              ' and BOLETAS.NUM_NF_VND = ' + inttostr(pNumeroNFVenda) +
              ' and BOLETAS.SUB_SERIE = ' + inttostr(pSubSerieNF) +
              ' and BOLETAS.TIPO_EMISSAO = ' + QuotedStr(trim(pTipo_Emissao)) +
              ' and BOLETAS.ATIVO = 1');

          if (Boleto.dataSet.IsEmpty) and (pCodCobrebem > 0) then
          begin
          	Result :=
              Boleto.montaSelect('select ' + Fsql_campos + ' FROM BOLETAS ' +
                Fsql_inner +
                ' WHERE BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
                ' and CLIENTES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
                ' and BOLETAS.NUM_NF_VND = ' + inttostr(pNumeroNFVenda) +
                ' and BOLETAS.SUB_SERIE = ' + inttostr(pSubSerieNF) +
                ' and BOLETAS.TIPO_EMISSAO = ' + QuotedStr(trim(pTipo_Emissao)) +
                ' and BOLETAS.ATIVO = 1');
          end;

          if Boleto.dataSet.FieldByName('COD_CONTROLE_CX').AsInteger > 0 then
            Boleto.vCobreBem.abreCobreBemImpressao(Boleto.dataSet.FieldByName('COD_CONTROLE_CX').AsInteger);
        end
        else if (pTipo_Emissao = 'CR') then
        begin
          Result :=
            Boleto.montaSelect('select ' + Fsql_campos + ' FROM BOLETAS ' +
              Fsql_inner +
              ' WHERE BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
              ' and CLIENTES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
              vDadosIni.IfThen(pCodCobrebem > 0, ' and BOLETAS.COD_COBREBEM = ' + IntToStr(pCodCobrebem), '') +
              ' and BOLETAS.IDCARNE = ' + inttostr(pNumeroNFVenda) +
              ' and BOLETAS.TIPO_EMISSAO = ' + QuotedStr(trim(pTipo_Emissao)) +
              ' and BOLETAS.ATIVO = 1');

          if (Boleto.dataSet.IsEmpty) and (pCodCobrebem > 0) then
          begin
          	Result :=
              Boleto.montaSelect('select ' + Fsql_campos + ' FROM BOLETAS ' +
                Fsql_inner +
                ' WHERE BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
                ' and CLIENTES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
                ' and BOLETAS.IDCARNE = ' + inttostr(pNumeroNFVenda) +
                ' and BOLETAS.TIPO_EMISSAO = ' + QuotedStr(trim(pTipo_Emissao)) +
                ' and BOLETAS.ATIVO = 1');
          end;

          if Boleto.dataSet.FieldByName('COD_CONTROLE_CX').AsInteger > 0 then
            Boleto.vCobreBem.abreCobreBemImpressao(Boleto.dataSet.FieldByName('COD_CONTROLE_CX').AsInteger);
        end
        else if (pTipo_Emissao = 'CRB') then
        begin
          Result :=
            Boleto.montaSelect('select ' + Fsql_campos + ' FROM BOLETAS ' +
              Fsql_inner +
              ' WHERE BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
              ' and CLIENTES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
              vDadosIni.IfThen(pCodCobrebem > 0, ' and BOLETAS.COD_COBREBEM = ' + IntToStr(pCodCobrebem), '') +
              ' and BOLETAS.NOSSO_NUMERO_BANCO = ' + QuotedStr(trim(pNossoNumero)) +
              ' and BOLETAS.ATIVO = 1');

          if (Boleto.dataSet.IsEmpty) and (pCodCobrebem > 0) then
          begin
          	Result :=
              Boleto.montaSelect('select ' + Fsql_campos + ' FROM BOLETAS ' +
                Fsql_inner +
                ' WHERE BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
                ' and CLIENTES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
                ' and BOLETAS.NOSSO_NUMERO_BANCO = ' + QuotedStr(trim(pNossoNumero)) +
                ' and BOLETAS.ATIVO = 1');
          end;

          Boleto.vCobreBem.abreCobreBemImpressao(Boleto.dataSet.FieldByName('COD_COBREBEM').AsString);
          if Boleto.dataSet.FieldByName('COD_COBREBEM').AsInteger < 1 then
            exit;
        end
        else
        begin
          Result :=
            Boleto.montaSelect('select ' + Fsql_campos + ' FROM BOLETAS ' +
              Fsql_inner +
              ' WHERE BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
              ' and CLIENTES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
              vDadosIni.IfThen(pCodCobrebem > 0, ' and BOLETAS.COD_COBREBEM = ' + IntToStr(pCodCobrebem), '') +
              ' and BOLETAS.NUM_NF_VND = ' + inttostr(pNumeroNFVenda) +
              ' and BOLETAS.TIPO_EMISSAO = ' + QuotedStr(trim(pTipo_Emissao)) +
              ' and BOLETAS.ATIVO = 1');

          if (Boleto.dataSet.IsEmpty) and (pCodCobrebem > 0) then
          begin
         		Result :=
              Boleto.montaSelect('select ' + Fsql_campos + ' FROM BOLETAS ' +
                Fsql_inner +
                ' WHERE BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
                ' and CLIENTES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
                ' and BOLETAS.NUM_NF_VND = ' + inttostr(pNumeroNFVenda) +
                ' and BOLETAS.TIPO_EMISSAO = ' + QuotedStr(trim(pTipo_Emissao)) +
                ' and BOLETAS.ATIVO = 1');
          end;    

          if Boleto.dataSet.FieldByName('COD_CONTROLE_CX').AsInteger > 0 then
            Boleto.vCobreBem.abreCobreBemImpressao(Boleto.dataSet.FieldByName('COD_CONTROLE_CX').AsInteger);
        end;

        if Boleto.dataSet.IsEmpty then
          Exit;

        if pTipo_Emissao = 'CR' then
        	vOOK := True
        else if pTipo_Emissao = 'CRB' then
          vOOK := True
        else if pTipo_Emissao = 'CRED' then
        	vOOK := True
        else
          vOOK := Application.MessageBox(pchar(vMens), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes;

        if not vOOK then
          Exit;

        {3}if (Boleto.vCobreBem.dataSet.IsEmpty) then
        begin
          Application.MessageBox('A empresa não possui configurações de convênio para impressão.',
            'Mensagem', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
          Result := false;
          exit;
        end; {3}
        try
        	Boleto.dataSet.DisableControls;
          Boleto.dataSet.First;
          while not Boleto.dataSet.Eof do
          begin
            vListaControles.Add(IntToStr(Boleto.dataSet.FieldByName('cod_controle_cx').AsInteger));
            Boleto.dataSet.Next;
          end;
        finally
          Boleto.dataSet.First;
          Boleto.dataSet.EnableControls;
        end;
        if vListaControles.Count = 0 then
          vListaControles.Add('0')
        else if vListaControles.Count > 1 then
          Application.MessageBox('Foram gerados boletos em controles diferentes. O sistema vai abrir a impressão para cada controle diferente encontrado', 'Antenção', 0 + 64);

        for I := 0 to vListaControles.Count - 1 do
        begin
          try
            if vListaControles[i] = '0'  then
              Boleto.dataSet.Filter := 'cod_controle_cx = 0 or cod_controle_cx is null'
            else
              Boleto.dataSet.Filter := 'cod_controle_cx = ' + vListaControles[i];
            Boleto.dataSet.Filtered := True;
            if pTipo_Emissao <> 'CRB' then
            begin
              Boleto.vCobreBem.abreCobreBemImpressao( StrToIntDef(vListaControles[i], 0));
              if (Boleto.vCobreBem.dataSet.IsEmpty) then
              begin
                Application.MessageBox(PChar('Sem configuração de boletos para o controle: ' + vListaControles[i] + #13 +
                 'A impressão não pode continuar'), 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
                Result := false;
                exit;
              end;
            end;

            if (pTipo_Emissao <> 'CRB') then
            begin
              Application.CreateForm(TfrmSelecionaCobrebem, frmSelecionaCobrebem);
              frmSelecionaCobrebem.ckImprimirBoleto.Enabled := pImprimir;
              frmSelecionaCobrebem.ckEnviarBoleto.Enabled := pEnviar;

              frmSelecionaCobrebem.FrameCheckListaContato.CodCliente := pCodCliente;
              frmSelecionaCobrebem.FrameCheckListaContato.Origem := pOrigem;
              frmSelecionaCobrebem.FrameCheckListaContato.UnicoMens := False;

              try
               frmSelecionaCobrebem.DBLookupComboBox_Cobrebem.KeyValue := 0;
                if Boleto.dataSet.FieldByName('COD_COBREBEM').AsInteger > 0 then
                  frmSelecionaCobrebem.DBLookupComboBox_Cobrebem.KeyValue := Boleto.dataSet.FieldByName('COD_COBREBEM').AsInteger
                else if Boleto.vCobreBem.dataSet.RecordCount = 1 then
                  frmSelecionaCobrebem.DBLookupComboBox_Cobrebem.KeyValue := Boleto.vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger;

                if frmSelecionaCobrebem.ShowModal <> IDOK then
                begin
                  Result := false;
                  exit;
                end;

                pArrayAplicativo := vDadosIni.retornaArrayAplicativo(frmSelecionaCobrebem.FrameCheckListaContato.CheckListBoxAplicativo, True);
                pArrayContato    := vDadosIni.retornaArrayContato(frmSelecionaCobrebem.FrameCheckListaContato.CheckListBoxContato, True);

                vImprimir := false;
                vEnviar := false;

                if frmSelecionaCobrebem.ckImprimirBoleto.Checked then
                  vImprimir := True;

                if frmSelecionaCobrebem.ckEnviarBoleto.Checked then
                  vEnviar := True;
              finally
                frmSelecionaCobrebem.Free;
                frmSelecionaCobrebem := nil;
              end;
            end;

              try
                Boleto.dataSet.DisableControls;
                Boleto.dataSet.First;
                {w - 3}while not (Boleto.dataSet.Eof) do
                begin
                  Boleto.dataSet.Edit;
                  Boleto.dataSet.FieldByName('SelecionaBoleto').Value := 'S';
                  Boleto.dataSet.Post;
                  Boleto.dataSet.Next;
                end; {w - 3}
              finally
                Boleto.dataSet.First;
                Boleto.dataSet.EnableControls;
              end;

              {Informa para o método que a impressão é pela nota fiscal caso o nosso numero
              se repita não tenha interação com o formulário de boletos.}
              Boleto.vImpressaoNF := true;

              if not Boleto._validadados then
                exit;

              if Boleto.vCobreBem.dataSet.FieldByName('TIPO_API').AsString = 'S' then
              begin
                selecionados := Boleto.HandleBoletos;

                if selecionados.Erros <> '' then
                begin
                  ShowAtencao(selecionados.Erros);
                  Exit;
                end;
                         
                if Length(selecionados.lista) > 0 then
                  Boleto._GerarBoletosPlugBoletos(
                  	selecionados.lista,
                    pNumeroNFVenda,
                    pSubSerieNF,
                    pTipo_Emissao,
                    vImprimir,
                    vEnviar,
                    pArrayAplicativo,
                    pArrayContato,
                    pOrigem,
                    pConfEmailWhatsApp,
                    true);
              end
              else
              begin
              	if not Boleto.TestarBoletos then
                	Exit;

                if not (Boleto._GerarBoletosDLLCobrebem(
                	pNumeroNFVenda,
                  pSubSerieNF,
                  pTipo_Emissao,
                	vImprimir,
                  vEnviar,
                  pArrayAplicativo,
                  pArrayContato,
                  pOrigem,
                  pConfEmailWhatsApp,
                  true)) then
                begin
                  Result := False;
                  exit;
                end;
              end;

          finally
            Boleto.dataSet.Filter := '';
            Boleto.dataSet.Filtered := False;
          end;
        end;

      end {2}
      {2}else
      begin {2}
        Result := false;
        exit;
      end; {2}

    end {1}
    {1}else
    begin {1}
      Result := false;
      exit;

    end; {1}

    if (Boleto <> nil) then
      Boleto.Cancel;
    Boleto.free;
    Boleto := nil;

  except on E: Exception do
  	begin
      Result := false;
      if (Boleto <> nil) then
        Boleto.Cancel;
      Boleto.free;
      Boleto := nil;
      Application.MessageBox('Erro ao gravar registro, verifique as configurações. Se o erro persistir contacte o administrador da rede.', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      registraErro('function TBoleto._BoletosNFOS. Erro: ' + e.Message);
      exit;
    end;
  end;

  Result := true;
end;

function TBoleto._CancelarBoleto: boolean;
var
  BoletoSelecionado: integer;
  BoletosQuitados: Integer;
begin
  BoletosQuitados := 0;
  BoletoSelecionado := 0;
  vAbortar := false;
  try
  	dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      Application.ProcessMessages;
      if (vAbortar) then
      begin

        Application.MessageBox(pchar('Operação paralizada.' + #13 +
          ''), 'Atenção', 0 + 64);
        Result := false;
        exit;
      end;

      if dataSet.FieldByName('SelecionaBoleto').Value = 'S' then
      begin
        BoletoSelecionado := 1;
        if (trim(dataSet.FieldByName('STATUS').asstring) = 'QUITADO') then
          BoletosQuitados := 1;
      end;

      dataSet.Next;
    end;
  finally
    dataSet.First;
    dataSet.EnableControls;
  end;

  //-------------------

  if BoletoSelecionado = 0 then
  begin
    Result := false;
    Application.MessageBox('Selecione um Boleto.', 'Informação',
      MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
    exit;
  end;

  if BoletosQuitados = 1 then
  begin
    Result := false;
    Application.MessageBox('Existem boletos selecionados que estão quitados e não podem ser cancelados.', 'Informação',
      MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
    exit;
  end;

  //--------------------

  try
    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      Application.ProcessMessages;
      if (vAbortar) then
      begin

        Application.MessageBox(pchar('Operação paralizada.' + #13 +
          ''), 'Atenção', 0 + 64);
        Result := false;
        exit;
      end;

      if dataSet.FieldByName('SelecionaBoleto').Value = 'S' then
      begin
        try
          Edit;
          dataSet.FieldByName('STATUS').ASSTRING := 'CANCELADO';
          inherited Post;
        except
          Result := false;
          exit;
        end;
      end;
      dataSet.Next;
    end;
  finally
    dataSet.First;
    dataSet.EnableControls;
  end;

  Result := true;

end;

function TBoleto._CommitTransaction(PROCESSO, TABELA, CAMPO_CHAVE, ACAO: string; pGravarAud: boolean = true): boolean;
begin

  if (DataSet.ChangeCount = 0) and (not vComitarFormaPagamento) then
  begin
    Cancel;
    Result := true;
    exit;
  end
  else if (DataSet.ChangeCount = 0) and (vComitarFormaPagamento) then
  begin
    Result := true;
    CommitaTransacao;
    exit;
  end;

  Result := Apply;
  if Result or (vComitarFormaPagamento) then
    Result := CommitaTransacao;

  if pGravarAud then
    if Result then
      vDadosIni.GravaAuditoria(PROCESSO, ACAO, 'SUCESSO', TABELA,
        CAMPO_CHAVE, buscas)
    else
      vDadosIni.GravaAuditoria(PROCESSO, ACAO, 'FALHA', TABELA,
        CAMPO_CHAVE, buscas);
end;

function TBoleto._defineSqlAdicional: boolean;
var
  I, erro: Integer;
  //  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
begin
  result := true;
  rBOL.vSqlAdicional := '';
  rBOL.vValor   := Trim(rBOL.vValor);
  rBOL.vValorAd := Trim(rBOL.vValorAd);

  if rBOL.vAdicional then
  begin
    if rBOL.vPorDataAd then
    begin
      try
        erro := 0;
        StrToDate(rBOL.vDataIniAd);
      except
        rBOL.vDataIniAd := '';
        erro := erro + 1;
      end;
      try
        StrToDate(rBOL.vDataFimAd);
      except
        rBOL.vDataFimAd := '';
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
        if rBOL.vDataIniAd <> '' then
          rBOL.vDataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(rBOL.vDataIniAd)));
        if rBOL.vDataFimAd <> '' then
          rBOL.vDataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(rBOL.vDataFimAd)));
      end;
    end
    else if rBOL.vValorAd = '' then
      exit;
    if rBOL.vCondicaoAd = 'Igual' then
      rBOL.vCondicaoAd := '='
    else if rBOL.vCondicaoAd = 'Maior' then
      rBOL.vCondicaoAd := '>'
    else if rBOL.vCondicaoAd = 'Maior ou Igual' then
      rBOL.vCondicaoAd := '>='
    else if rBOL.vCondicaoAd = 'Menor' then
      rBOL.vCondicaoAd := '<'
    else if rBOL.vCondicaoAd = 'Menor ou Igual' then
      rBOL.vCondicaoAd := '<='
    else if rBOL.vCondicaoAd = 'Diferente' then
      rBOL.vCondicaoAd := '<>'
    else if (rBOL.vCondicaoAd = 'Esta contido') then
      rBOL.vCondicaoAd := 'like'
    else if (rBOL.vCondicaoAd = 'Começa') then
      rBOL.vCondicaoAd := 'Começa'
    else
      rBOL.vCondicaoAd := '=';
    for I := 0 to dataSet.FieldCount - 1 do
    begin
      if Dataset.Fields[I].FieldKind = fkData then
      begin
        if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(rBOL.vCampoAd) then
        begin
          rBOL.vValorAd := ajustar_consulta_incasesensitive(DataSet.Fields[I], '', rBOL.vValorAd);
//          if rBOL.vCampo = rBOL.vCampoAd then
//          begin
//            rBOL.vsqlAdicional := '';
//            exit;
//          end;
          rBOL.vCampoAd := DataSet.Fields[I].FieldName;
          if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
            (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
            ((rBOL.vCondicaoAd = 'Começa') or (rBOL.vCondicaoAd = 'Começa')) then
          begin
            if ((Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField)) then
            try
              strtoint(rBOL.vValorAd);
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
              strtofloat(rBOL.vValorAd);
            except
              Application.MessageBox(PChar('Valor para consulta adicional inválido.' + chr(13) +
                'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) +
                'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção',
                MB_ICONEXCLAMATION + MB_OK);
              result := false;
              exit;
            end;
            rBOL.vCondicaoAd := '=';
            rBOL.vValorAd := vDadosIni.trocaVirgulaPorPonto(rBOL.vValorAd);
          end
          else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
          begin
            if (rBOL.vDataIniAd <> '') and (rBOL.vDataFimAd <> '') then
              rBOL.vSqlAdicional := rBOL.vsqlAdicional + rBOL.vCampoAd +
                ' >= ' + rBOL.vDataIniAd + ' and ' + rBOL.vCampoAd + ' <= ' + rBOL.vDataFimAd
            else if (rBOL.vDataFimAd <> '') then
              rBOL.vsqlAdicional := rBOL.vsqlAdicional + rBOL.vCampoAd +
                ' <= ' + rBOL.vDataIniAd
            else if (rBOL.vDataIniAd <> '') and (rBOL.vDataFimAd <> '') then
              rBOL.vsqlAdicional := rBOL.vsqlAdicional + rBOL.vCampoAd +
                ' >= ' + rBOL.vDataIniAd;
            Break;
          end;
          if rBOL.vCondicaoAd = 'like' then
            rBOL.vsqlAdicional := rBOL.vsqlAdicional + rBOL.vCampoAd +
              ' like ' + QuotedStr('%' +
              rBOL.vValorAd +
              '%')
          else if rBOL.vCondicaoAd = 'Começa' then
            rBOL.vsqlAdicional := rBOL.vsqlAdicional + rBOL.vCampoAd +
              ' like ' +
              QuotedStr(rBOL.vValorAd + '%')
          else
            rBOL.vsqlAdicional := rBOL.vsqlAdicional + rBOL.vCampoAd + ' '
              + rBOL.vCondicaoAd + ' ' +
              QuotedStr(rBOL.vValorAd);

          if rBOL.vCondicaoAd <> 'Começa' then
          begin
            if rBOL.vCampoAd = 'NOME_CTRL' then
              rBOL.vsqlAdicional := 'CONTROLES.' + rBOL.vCampoAd + ' ' + rBOL.vCondicaoAd + ' ' + QuotedStr(rBOL.vValorAd)
            else if ((rBOL.vCampoAd = 'NOME_CLIENTE') or (rBOL.vCampoAd = 'RAZAO') or (rBOL.vCampoAd = 'CPFCGC') or (rBOL.vCampoAd = 'EMAIL')) then
              rBOL.vsqlAdicional := 'CLIENTES.' + rBOL.vCampoAd + ' ' + rBOL.vCondicaoAd + ' ' + QuotedStr(rBOL.vValorAd)
            else if ((rBOL.vCampoAd = 'DATA_ENV_EMAIL') or (rBOL.vCampoAd = 'DATA_ENV_WHATSAPP') or (rBol.vCampoAd = 'DATA_ENV_MENS')) then
            	rBOL.vsqlAdicional := 'RETORNA_DATA_ENV_BOL.' + rBOL.vCampoAd + ' ' + rBOL.vCondicaoAd + ' ' + QuotedStr(rBOL.vValorAd)
            else
              rBOL.vsqlAdicional := 'BOLETAS.' + rBOL.vCampoAd + ' ' + rBOL.vCondicaoAd + ' ' + QuotedStr(rBOL.vValorAd);
          end
          else
          begin
            if rBOL.vCampoAd = 'NOME_CTRL' then
              rBOL.vsqlAdicional := 'CONTROLES.' + rBOL.vCampoAd + ' LIKE ' + QuotedStr(rBOL.vValorAd + '%')
            else if ((rBOL.vCampoAd = 'NOME_CLIENTE') or (rBOL.vCampoAd = 'RAZAO') or (rBOL.vCampoAd = 'CPFCGC') or (rBOL.vCampoAd = 'EMAIL')) then
              rBOL.vsqlAdicional := 'CLIENTES.' + rBOL.vCampoAd + ' LIKE ' + QuotedStr(rBOL.vValorAd + '%')
            else if ((rBOL.vCampoAd = 'DATA_ENV_EMAIL') or (rBOL.vCampoAd = 'DATA_ENV_WHATSAPP') or (rBOL.vCampoAd = 'DATA_ENV_MENS')) then
            	rBOL.vsqlAdicional := 'RETORNA_DATA_ENV_BOL.' + rBOL.vCampoAd + ' LIKE ' + QuotedStr(rBOL.vValorAd + '%')
            else
              rBOL.vsqlAdicional := 'BOLETAS.' + rBOL.vCampoAd + ' LIKE ' + QuotedStr(rBOL.vValorAd + '%');
          end;

          Break;
        end;
      end;
    end;
  end;

  tempSql := '';

  if Trim(rBOL.vValor) <> '' then
    for I := 0 to dataSet.FieldCount - 1 do
      if Dataset.Fields[I].FieldKind = fkData then
        if ContainsText(dataset.Fields[I].DisplayName, rBOL.vCampo) then
        begin
          rBOL.vValor := ajustar_consulta_incasesensitive(DataSet.Fields[I], '', rBOL.vValor);
          Break;
        end;

  if rBOL.vCampo = 'Controle' then
    tempSql := 'CONTROLES.NOME_CTRL '
  else if rBOL.vCampo = 'Nome Cliente' then
    tempSql := 'CLIENTES.NOME_CLIENTE '
  else if rBOL.vCampo = 'Razao Social' then
    tempSql := 'CLIENTES.RAZAO '
  else if rBOL.vCampo = 'CPF / CNPJ' then
  	tempSql := 'CLIENTES.CPFCGC'
  else if rBOL.vCampo = 'Email Cliente' then
    tempSql := 'CLIENTES.EMAIL '
  else if rBOl.vCampo = 'Data Email Bol' then
  	tempSql := 'RETORNA_DATA_ENV_BOL.DATA_ENV_EMAIL'
  else if rBOL.vCampo = 'Data WhatsApp Bol' then
    tempSql := 'RETORNA_DATA_ENV_BOL.DATA_ENV_WHATSAPP'
  else if rBol.vCampo = 'Data Mens Bol' then
  	tempSql := 'RETORNA_DATA_ENV_BOL.DATA_ENV_MENS';

  if tempSql  <> '' then
  begin
    if rBOL.vCondicao = 'Igual' then
      tempTipo := ' = '
    else if rBOL.vCondicao = 'Maior' then
      tempTipo := ' > '
    else if rBOL.vCondicao = 'Maior ou Igual' then
      tempTipo := ' >= '
    else if rBOL.vCondicao = 'Menor' then
      tempTipo := ' < '
    else if rBOL.vCondicao = 'Menor ou Igual' then
      tempTipo := ' <= '
    else if rBOL.vCondicao = 'Diferente' then
      tempTipo := ' <> '
    else if (rBOL.vCondicao = 'Esta contido') then
      tempTipo := ' like '
    else if (rBOL.vCondicao = 'Começa') then
      tempTipo := ' Começa'
    else
      tempTipo := '= ';

    if (rBOl.vCampo = 'Data Email Bol') or (rBOL.vCampo = 'Data WhatsApp Bol') then
    begin
    	try
        erro := 0;
        StrToDate(rBOL.vDataIni);
      except
        rBOL.vDataIni := '';
        erro := erro + 1;
      end;
      try
        StrToDate(rBOL.vDataFim);
      except
        rBOL.vDataFim := '';
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
        if rBOL.vDataIni <> '' then
          rBOL.vDataIni := QuotedStr(FormatDateTime(formatodata, strtodate(rBOL.vDataIni)));
        if rBOL.vDataFim <> '' then
          rBOL.vDataFim := QuotedStr(FormatDateTime(formatodata, strtodate(rBOL.vDataFim)));
      end;

      if (rBOL.vDataIni <> '') and (rBOL.vDataFim <> '') then
        tempSql := tempSql + ' >= ' + rBOL.vDataIni + ' and ' + tempSql + ' <= ' + rBOL.vDataFim
      else if (rBOL.vDataFim <> '') then
        tempSql := tempSql + ' <= ' + rBOL.vDataIni
      else if (rBOL.vDataIni <> '') and (rBOL.vDataFim <> '') then
        tempSql := tempSql + ' >= ' + rBOL.vDataIni;
      rBOL.vValor := '';
      rBOL.vDataIni := '';
      rBOL.vDataFim := '';
      if Trim(rBOL.vSqlAdicional) <> '' then
        rBOL.vSqlAdicional := rBOL.vSqlAdicional + ' and ' + tempSql
      else
        rBOL.vSqlAdicional := tempSql;
    end
    else
    begin
      if trim(tempTipo) = 'like' then
        tempSql := tempSql + tempTipo + QuotedStr('%' + rBOL.vValor + '%')
      else if trim(tempTipo) = 'Começa' then
        tempSql := tempSql + ' like ' + QuotedStr(rBOL.vValor + '%')
      else
        tempSql := tempSql + tempTipo + QuotedStr(rBOL.vValor);
      rBOL.vValor := '';
      rBOL.vDataIni := '';
      rBOL.vDataFim := '';
      if Trim(rBOL.vSqlAdicional) <> '' then
        rBOL.vSqlAdicional := rBOL.vSqlAdicional + ' and ' + tempSql
      else
        rBOL.vSqlAdicional := tempSql;
    end;
  end;

end;

procedure TBoleto._DesmarcaTodosBoletos;
begin
	try
  	vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    if not dataSet.Active then
      Exit;

  	dataSet.DisableControls;
    dataSet.First;
    {w - 1}while not dataSet.Eof do
    begin
      inherited Edit;
      dataSet.fieldbyname('SelecionaBoleto').Value := Null;
      inherited Post;

      dataSet.Next;
    end;
    dataSet.First;
    
  finally
    dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TBoleto._efetuarSoma;
var
  vSomaComRemessa, vSomaSemRemessa, vSomaSelecionados: Extended;
  vPointer: Pointer;
begin
  if not vDadosIni.PesqPros('BOL032', 'SOMAR', '', 'BOLETAS', '', buscas, False) then
    Exit;

  vSomaComRemessa := 0;
  vSomaSemRemessa := 0;
  vSomaSelecionados := 0;

  vPointer := dataSet.GetBookmark;

  try
  	dataSet.DisableControls;
    dataSet.first;
    while not dataSet.Eof do
    begin
      if Trim(dataSet.FieldByName('remessa_enviada').AsString) <> 'S' then
        vSomaSemRemessa := vSomaSemRemessa + dataSet.FieldByName('VL_DOC_BOL').AsFloat
      else
        vSomaComRemessa := vSomaComRemessa + dataSet.FieldByName('VL_DOC_BOL').AsFloat;
      if Trim(dataSet.FieldByName('SelecionaBoleto').AsString) = 'S' then
        vSomaSelecionados := vSomaSelecionados + dataSet.FieldByName('VL_DOC_BOL').AsFloat;
      dataSet.next;
    end;
  finally
    dataSet.first;
    dataSet.EnableControls;
  end;

  Application.MessageBox(pchar('Valor dos Boletos sem Remessa..: ' + format('%m', [vSomaSemRemessa])
    + #13 + 'Valor dos Boletos com Remessa.: ' + format('%m', [vSomaComRemessa]) + #13 +
    'Valor dos Boletos Selecionados..: ' + format('%m', [vSomaSelecionados])), 'Anteção', 0 + 64);

  dataSet.GotoBookmark(vPointer);
end;

function TBoleto._enviarMensagem(
	pEnviar: boolean;
  pArrayAplicativo: arrayaplicativo;
  pArrayContato: arraycontato;
  pOrigem: TOrigemEnv;
  pConfEmailWhatsApp: boolean = false): boolean;
var
  vListaBoletas: TStringList;
  vDiretorio: boolean;
  BoletoSelectionado: Integer;
  vCodBoletos: string;
  vtemp: string;
  vsql: string;
  vrecno: integer;
begin
   try
     Result := false;

     vsql := dataSet.CommandText;
     vrecno := dataSet.RecNo;

     vListaBoletas := TStringList.Create;

    try
      dataSet.DisableControls;
      dataSet.Filter := 'SelecionaBoleto = ''S''';
      dataSet.Filtered := True;

      if (dataSet.IsEmpty) then
      begin
        Application.MessageBox(pchar('Nenhuma Boleta selecionada.'), 'Atenção', MB_ICONERROR + MB_OK);
        exit;
      end;

      dataSet.First;
      while not dataSet.Eof do
      begin
        if dataSet.FieldByName('SelecionaBoleto').AsString = 'S' then
          vListaBoletas.Add(IntToStr(dataSet.FieldByName('N_SEQ_BOL').AsInteger));
        dataSet.Next;
      end;
    finally
      dataSet.EnableControls;
      dataSet.Filter := '';
      dataSet.Filtered := False;
    end;
    dataSet.First;

    if not gerar_boleto(
      False,
      pEnviar,
      pArrayAplicativo,
      pArrayContato,
      pOrigem,
    	vListaBoletas,
      pConfEmailWhatsApp,
      false) then
      	exit;

    dataSet.Close;
    dataSet.CommandText := vsql;
    dataSet.Open;

    if dataSet.RecordCount >= vrecno then
      dataSet.RecNo := vrecno;

    dataSet.Refresh;
    Result := true;

    vDadosIni.fechaStatusProcessamento;
  except on E: Exception do
    begin
      vDadosIni.GravaAuditoria('BOL008', 'ENVIAR', 'FALHA', 'BOLETAS', '', buscas);
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TBoleto._enviarEmailWhatsApp. Erro: ' + e.Message);
    end;
  end;
end;

function TBoleto._escreverArquivoHtmlIni: boolean;
var
  vStringTemp: TStringList;
begin
   vStringTemp := TStringList.create;
   vStringTemp.Clear;
   vStringTemp.Add('[Settings]');
   vStringTemp.Add('HTML= ' + vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + dataSet.FieldByName('N_SEQ_BOL').AsString + '.html');
   vStringTemp.Add('PDF=' + vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + dataSet.FieldByName('N_SEQ_BOL').AsString + '.pdf');
   vStringTemp.Add('OpenAfterSave=0');
   vStringTemp.SaveToFile(ExtractFilePath(Application.Exename) + 'htm2pdf.ini');
end;

function TBoleto._GerarBoletosDLLCobrebem(
	pNumeroNFVenda: integer = 0;
  pSubSerieNF: integer = 0;
  pTipo_Emissao: string = '';
	pImprimir: boolean = True;
  pEnviar: boolean = False;
  pArrayAplicativo: arrayaplicativo = [];
  pArrayContato: arraycontato = nil;
  pOrigem: TOrigemEnv = cBoleto;
  pConfEmailWhatsApp: boolean = false;
  pUnicoEmailWhatsApp: boolean = false;
  pExibirHint: boolean = true): boolean;
var
  I: Integer;
  Aconf: TConfig_sistema_class;
  AtivarConfiguracoesImporRet: string;
  DesconsiderarDigVerImpBoletoR: string;
  vListaNossoNumero: TStringList;
  Arq: TextFile;
  linha: string;
  vlistaLicenca: TStringList;
  ImageLogo, ImageBanco: TImage;
	MemoryStreamLogo, MemoryStreamBanco: TMemoryStream;
begin
  try
  	vListaNossoNumero := TStringList.Create;
    
    // Salvar licença, logotipo, logobanco, codbarras_b, codbarras_c, codbarras_a, codbarras_d cobrebem no BD
    if (trim(vCobreBem.dataSet.FieldByName('LICENCA').AsString) = '')
    	or (trim(vCobreBem.dataSet.FieldByName('LOGOTIPO').asString) = '')
      or (trim(vCobreBem.dataSet.FieldByName('LOGOBANCO').asString) = '')
      or (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_A').asString) = '')
      or (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_B').asString) = '')
      or (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_C').asString) = '')
      or (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_D').asString) = '') then
    begin
      vCobreBem.Edit;
      // Salvar licença cobrebem no BD
      if (trim(vCobreBem.dataSet.FieldByName('LICENCA').AsString) = '') then
      begin
        if (trim(vCobreBem.dataSet.FieldByName('ARQUIVOLICENCA').asString) <> '')
          and (FileExists(trim(vCobreBem.dataSet.FieldByName('ARQUIVOLICENCA').AsString))) then
        begin
          try
            vlistaLicenca := TStringList.Create;
            vlistaLicenca.Clear;
            // Lendo arquivo
            AssignFile(arq, trim(vCobreBem.dataSet.FieldByName('ARQUIVOLICENCA').asString));
            Reset(arq);
            while not System.Eof(arq) do
            begin
              Readln(arq, linha);
              vlistaLicenca.Add(linha);
            end;
            vCobreBem.dataSet.FieldByName('LICENCA').AsString := vlistaLicenca.Text;
          finally
            closeFile(arq);
            if Assigned(vlistaLicenca) then
              vlistaLicenca.Free;
          end;
        end;
      end;

      // Salvar logotipo do cobrebem no BD
      if (trim(vCobreBem.dataSet.FieldByName('LOGOTIPO').asString) = '') then
      begin
        if (trim(vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').asString) <> '')
          and (FileExists(trim(vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').AsString))) then
        begin
        	vCobreBem.dataSet.FieldByName('LOGOTIPO').AsString :=
            _strImagetoBase64(trim(vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').AsString));
        end;
      end;

      // Salvar logobanco do cobrebem no BD
      if (trim(vCobreBem.dataSet.FieldByName('LOGOBANCO').asString) = '') then
      begin
        if (trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').asString) <> '')
          and (FileExists(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\' + trim(vCobreBem.dataSet.FieldByName('BANCO').AsString) + '.jpg')) then
        begin
        	vCobreBem.dataSet.FieldByName('LOGOBANCO').AsString :=
            _strImagetoBase64(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\' +
              trim(vCobreBem.dataSet.FieldByName('BANCO').AsString) + '.jpg');
        end;
      end;

      // Salvar codbarras_a do cobrebem no BD
      if (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_A').asString) = '') then
      begin
        if (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_A').AsString) = '')
          and (trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').asString) <> '')
          and (FileExists(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\a.gif')) then
        begin
          vCobreBem.dataSet.FieldByName('CODBARRAS_A').AsString :=
            _strImagetoBase64(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\a.gif');
        end;
      end;

      // Salvar codbarras_b do cobrebem no BD
      if (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_B').asString) = '') then
      begin
        if (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_B').AsString) = '')
          and (trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').asString) <> '')
          and (FileExists(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\b.gif')) then
        begin
          vCobreBem.dataSet.FieldByName('CODBARRAS_B').AsString :=
            _strImagetoBase64(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\b.gif');
        end;
      end;

      // Salvar codbarras_c do cobrebem no BD
      if (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_C').asString) = '') then
      begin
        if (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_C').AsString) = '')
          and (trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').asString) <> '')
          and (FileExists(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\c.gif')) then
        begin
          vCobreBem.dataSet.FieldByName('CODBARRAS_C').AsString :=
            _strImagetoBase64(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\c.gif');
        end;
      end;

      // Salvar codbarras_d do cobrebem no BD
      if (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_D').asString) = '') then
      begin
        if (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_D').AsString) = '')
          and (trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').asString) <> '')
          and (FileExists(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\d.gif')) then
        begin
          vCobreBem.dataSet.FieldByName('CODBARRAS_D').AsString :=
            _strImagetoBase64(trim(vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\d.gif');
        end;
      end;

      vCobreBem.dataset.Post;
      vCobreBem.Apply;
    end;

    dataSet.Filter := 'SelecionaBoleto = ''S''';
    dataSet.Filtered := True;

    try
      Aconf := TConfig_sistema_class.Create;
      Aconf.value1_b.Text := vCobreBem.dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString;

      if Assigned(Aconf) then
      begin
        AtivarConfiguracoesImporRet   := Aconf.ReadString('ConfImportacaoRetorno', 'Ativar configuracoes importacao retorno (S ou N)', '');
        DesconsiderarDigVerImpBoletoR := Aconf.ReadString('ConfImportacaoRetorno', 'Desconsiderar digito verificar ao imprimir boleto e gerar remessa (S ou N)', '');
      end
      else
      begin
        AtivarConfiguracoesImporRet := 'N';
        DesconsiderarDigVerImpBoletoR := 'N';
      end;

      Result := _passarconfiguracao;
      if Result then
        Result := _adicionarboleto(
        	pNumeroNFVenda,
          pSubSerieNF,
          pTipo_Emissao,
          pImprimir,
          pEnviar,
          pArrayAplicativo,
          pArrayContato,
          pOrigem,
        	pConfEmailWhatsApp,
          pUnicoEmailWhatsApp,
          True,
          pExibirHint);

      if Result and vVerificarComitar then
      begin
        if (pUnicoEmailWhatsApp) and (pEnviar) then
          enviarBoletoPorEmailOS(pNumeroNFVenda, pTipo_Emissao, False, pEnviar, pArrayAplicativo, pArrayContato, pOrigem, pConfEmailWhatsApp);

        Result := _CommitTransaction('BOL015', 'BOLETAS', '', 'INSERIR');

        if not Result then
        begin
          Cancel;
          Application.MessageBox('Erro ao gravar registro, verifique as configurações. Se o erro persistir contacte o administrador da rede.', 'Erro',
            MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
        end;
      end;

      if Result then
      begin
        if vCobreBem.dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString = 'S' then
          Application.MessageBox('Os boletos estão configurados para serem impressos pelo banco. Agora já pode gerar o arquivo de remessa', 'Atenção', 0 + 64)
        else if pImprimir then
        begin
          if vCobreBem.dataSet.FieldByName('BANCO').AsString = '104' then
            CobreBemX.LocalPagamento := vCobreBem.dataSet.FieldByName('LOCAL_PAG').AsString;

          // Gerar nosso número novamente para corrigir
          if (AtivarConfiguracoesImporRet = 'S') and (DesconsiderarDigVerImpBoletoR = 'S') then
          begin
            _adicionarboleto(
              pNumeroNFVenda,
              pSubSerieNF,
              pTipo_Emissao,
            	pImprimir,
              pEnviar,
              pArrayAplicativo,
              pArrayContato,
              pOrigem,
              pConfEmailWhatsApp,
              pUnicoEmailWhatsApp,
              false);

            _CommitTransaction('', '', '', '', false);
          end;

          if (AtivarConfiguracoesImporRet = 'S') and (DesconsiderarDigVerImpBoletoR = 'S') then
            for I := 0 to CobreBemX.DocumentosCobranca.Count - 1 do
              CobreBemX.DocumentosCobranca[I].NossoNumero :=
                Copy(CobreBemX.DocumentosCobranca[I].NossoNumero, 1 , Length(CobreBemX.DocumentosCobranca[I].NossoNumero) - 1);

          if vCobreBem.dataSet.FieldByName('LICENCA_GENERICA').AsString = 'S' then
          begin
            vListaNossoNumero.Clear;
            try
            	dataset.DisableControls;
              dataset.First;
              while not dataset.Eof do
              begin
                if trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').asString) <> '' then
                  if trim(dataSet.FieldByName('HTMLBOLETO').asString) <> '' then
                    vListaNossoNumero.Add(trim(dataSet.FieldByName('HTMLBOLETO').asString));

                dataset.Next;
              end;
            finally
              dataset.First;
              dataset.EnableControls;
            end;

            vDadosIni.PreviewBoletos(vListaNossoNumero);
          end
          else
            CobreBemX.ImprimeBoletos;
        end;
        dataSet.Refresh;
      end;
    finally
      if Assigned(Aconf) then
      	FreeAndNil(Aconf);
    end;
  finally
    CobreBemX := Unassigned;
    criaBoletoCobreBemX;
    dataSet.Filter := '';
    dataSet.Filtered := False;
  end;

end;

function TBoleto._GerarBoletosPlugBoletos(
	pIds: array of integer;
  pNumeroNFVenda: integer = 0;
  pSubSerieNF: integer = 0;
  pTipo_Emissao: string = '';
  pImprimir: boolean = true;
  pEnviar: boolean = false;
  pArrayAplicativo: arrayaplicativo = [];
  pArrayContato: arraycontato = nil;
  pOrigem: TOrigemEnv = cBoleto;
  pConfEmailWhatsApp: boolean = false;
  pUnicoEmailWhatsApp: boolean = false;
  pProcesso: string = '';
  pAcao: string = '';
  pExibirHint: boolean = true): boolean;
var
  vDataAvisoVenc: string;
	vNomeCliente: string;
	vListaAnexos: TStringList;
  deleteList: TStrings;
  separaboletos: Boolean;
	sqlIn: string;
  pathName, fileName: string;
  fone: string;
  vDadosKentro: string;
  I, J, K, Z: Integer;
  buscas2: TIBQuery;
  qry: TQuery_OOP;
  vFormId: Integer;
  vMens: string;
  vAssunto, vMensagem: string;
  vAssuntoEmail, vMensagemEmail: string;
  vAssuntoWhatsApp, vMensagemWhatsApp: string;
  vAplicativo: TAplicativoEnv;
  vArrayContato: arraycontato;
  vDataBanco: TDateTime;
  vNumDoc: string;
  vTipoDoc: string;
begin
	try
    vDadosIni.logsBoleto(Self.ClassName + '._GerarBoletosPlugBoletos - begin', 'boleto');

    sqlIn := '';

    Result := False;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    if pEnviar then
    begin
      if trim(pTipo_Emissao) = 'NF' then
      begin
        buscas2.Close;
        buscas2.SQL.Text := 'select cod_nf from notafiscal' +
          ' where num_nf = ' + IntToStr(pNumeroNFVenda) +
          ' and serie = ' + QuotedStr(IntToStr(pSubSerieNF)) +
          ' and natureza_nf = ''S'' ' +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas2.Open;

        vNumDoc := IntToStr(buscas2.FieldByName('cod_nf').AsInteger);
        vTipoDoc := 'NF';
      end
      else
      begin
        vNumDoc := IntToStr(pNumeroNFVenda);
        vTipoDoc := pTipo_Emissao;
      end;
    end;

    for I := Low(pIds) to High(pIds) do
      sqlIn := sqlIn + IfThen(I > Low(pIds), ',') + IntToStr(pIds[I]);

    // Gravar convenio nos boletos nao impressos
    dataSet.Filtered := False;
    Result := montaSelect('select ' + Fsql_campos + ' from BOLETAS ' +
      Fsql_inner +
      ' where BOLETAS.N_SEQ_BOL in (' + sqlIn + ') ' +
      ' and BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' and coalesce(BOLETAS.COD_COBREBEM, 0) = 0 ' +
      ' and BOLETAS.ATIVO = 1 ');


    if (not dataSet.IsEmpty) then
    begin
      if vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger <= 0 then
      begin
        Application.MessageBox('Convênio não informado, favor verificar antes de continuar.',
          'Atenção', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
        Result := False;
        exit;
      end;

      try
      	dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
        	if pUnicoEmailWhatsApp then
            vMens := 'Processando Boletos - ' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount)
          else
            vMens := vDadosIni.IfThen(pImprimir, 'Imprimindo', '') +
                    	vDadosIni.IfThen(pImprimir and pEnviar, '/', '') +
             					vDadosIni.IfThen(pEnviar, 'Enviando', '') + ' ' +
                      OrigemEnvStr[pOrigem] + ' - ' + IntToStr(dataSet.RecNo) + '/' + IntToStr(dataSet.RecordCount);

          if pExibirHint then
            vDadosIni.abreStatusProcessamento('', vMens);

          dataSet.Edit;
          dataSet.FieldByName('COD_COBREBEM').AsInteger := vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger;
          dataSet.FieldByName('COD_CONTROLE_CX').AsInteger := vCobreBem.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
          dataSet.FieldByName('BANCOEMITEBOLETO').AsString := vCobreBem.dataSet.FieldByName('BANCOEMITEBOLETO').AsString;
          dataSet.FieldByName('API_NOSSONUMERO').AsString :=
            retornaValor('select nossonumero valor from getproximonossonumero (' +
              vDadosIni.codEmpresa + ', ' +
              IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + ')');
          dataSet.FieldByName('TIPO_API').AsString := 'S';
          dataSet.FieldByName('BANCOEMITEBOLETO').AsString := vCobreBem.dataSet.FieldByName('BANCOEMITEBOLETO').AsString;

//          if dataSet.FieldByName('PERMITE_PROTESTO').IsNull then
            dataSet.FieldByName('PERMITE_PROTESTO').AsString := IfThen(trim(vCobreBem.dataSet.FieldByName('PERMITE_PROTESTO').asString) = '',
              'N', trim(vCobreBem.dataSet.FieldByName('PERMITE_PROTESTO').asString));

          if vCobreBem.dataSet.FieldByName('PERMITE_PROTESTO').AsString = 'S' then
            if dataSet.FieldByName('DIAS_PROTESTO').IsNull then
              if not vCliente.dataSet.FieldByName('DIASPROTESTO').IsNull then
                dataSet.FieldByName('DIAS_PROTESTO').AsInteger := vCliente.dataSet.FieldByName('DIASPROTESTO').AsInteger
              else
                dataSet.FieldByName('DIAS_PROTESTO').AsInteger := vCobreBem.dataSet.FieldByName('DIASPROTESTO').AsInteger;

          if dataSet.FieldByName('QTD_DIAS_LIM_DESC').AsInteger <= 0 then
            dataSet.FieldByName('QTD_DIAS_LIM_DESC').AsInteger := vCobreBem.dataSet.FieldByName('QTD_DIAS_LIM_DESC').AsInteger;

          if not dataSet.FieldByName('DATA_VEN_BOL').IsNull then
            dataSet.FieldByName('DATA_LIM_DESC').AsDateTime :=
              dataSet.FieldByName('DATA_VEN_BOL').AsDateTime - dataSet.FieldByName('QTD_DIAS_LIM_DESC').AsInteger;

          if (dataSet.FieldByName('OBS_BOL').IsNull) and (trim(vCobreBem.dataSet.FieldByName('OBS_BOL').asString) <> '') then
            dataSet.FieldByName('OBS_BOL').AsString := trim(vCobreBem.dataSet.FieldByName('OBS_BOL').asString);

          if (dataSet.FieldByName('LOCALPAG').IsNull) and (trim(vCobreBem.dataSet.FieldByName('LOCAL_PAG').AsString) <> '') then
            dataSet.FieldByName('LOCALPAG').AsString := trim(vCobreBem.dataSet.FieldByName('LOCAL_PAG').AsString);

          if (dataSet.FieldByName('MENSAGEM_BOL').IsNull) and (trim(vCobreBem.dataSet.FieldByName('MENSAGEM_BOL').asString) <> '') then
            dataSet.FieldByName('MENSAGEM_BOL').AsString := trim(vCobreBem.dataSet.FieldByName('MENSAGEM_BOL').asString);

          if (dataSet.FieldByName('MENSAGEM_ADC').IsNull) and (trim(vCobreBem.dataSet.FieldByName('MENSAGEM_ADC').asString) <> '') then
            dataSet.FieldByName('MENSAGEM_ADC').AsString := trim(vCobreBem.dataSet.FieldByName('MENSAGEM_ADC').asString);

          if (dataSet.FieldByName('MENSAGEM_DESC').IsNull) and (trim(vCobreBem.dataSet.FieldByName('MENSAGEM_DESC').asString) <> '') then
          begin
            dataSet.FieldByName('MENSAGEM_DESC').AsString := trim(vCobreBem.dataSet.FieldByName('MENSAGEM_DESC').asString);

            dataSet.FieldByName('MENSAGEM_DESC').AsString := StringReplace(dataSet.FieldByName('MENSAGEM_DESC').AsString,
              '#DESCONTO', 'R$ ' + FormatFloat('0.00', dataSet.FieldByName('VL_DESC_BOL').AsFloat), [rfReplaceAll]);

            if not dataSet.FieldByName('DATA_LIM_DESC').IsNull then
              dataSet.FieldByName('MENSAGEM_DESC').AsString := StringReplace(dataSet.FieldByName('MENSAGEM_DESC').AsString,
                '#DATA', FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_LIM_DESC').AsDateTime), [rfReplaceAll])
            else
              dataSet.FieldByName('MENSAGEM_DESC').AsString := StringReplace(dataSet.FieldByName('MENSAGEM_DESC').AsString,
                '#DATA', FormatDateTime('dd/mm/yyyy', dataSet.FieldByName('DATA_VEN_BOL').AsDateTime), [rfReplaceAll]);
          end;


          if dataSet.FieldByName('VL_DESC_BOL').AsFloat > 0 then
            dataSet.FieldByName('PERMITE_DESCONTO').AsString := 'S'
          else
          begin
            if dataSet.FieldByName('PERMITE_DESCONTO').IsNull then
              dataSet.FieldByName('PERMITE_DESCONTO').AsString := IfThen(trim(vCobreBem.dataSet.FieldByName('PERMITE_DESCONTO').asString) = '',
                'N', trim(vCobreBem.dataSet.FieldByName('PERMITE_DESCONTO').asString));
          end;

          if dataSet.FieldByName('MULT_ATR_BOL').IsNull then
            dataSet.FieldByName('MULT_ATR_BOL').AsFloat := vCobreBem.dataSet.FieldByName('MULTAS').AsFloat;
          if dataSet.FieldByName('M_DIA_BOL').IsNull then
            dataSet.FieldByName('M_DIA_BOL').AsFloat := vCobreBem.dataSet.FieldByName('TX_JUROS').AsFloat / 30;

          if dataSet.FieldByName('DATA_LIM_DESC').IsNull then
          begin
            if not dataSet.FieldByName('DATA_VEN_BOL').IsNull then
              dataSet.FieldByName('DATA_LIM_DESC').AsDateTime :=
                dataSet.FieldByName('DATA_VEN_BOL').AsDateTime - vCobreBem.dataSet.FieldByName('QTD_DIAS_LIM_DESC').AsInteger;
          end;

          dataSet.Post;

          dataSet.Next;
        end;
      finally
      	dataSet.First;
        dataSet.EnableControls;
      end;
      Result := Apply;

      if Result then
        CommitaTransacao
      else
        RollBackTransacao;
    end;

    if (vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger > 0)
    	and (vDadosIni.vBoletos.vDiasAvisoVencCertificado > 0)
      and (not vCobreBem.dataSet.FieldByName('DATA_VENC_CERT').IsNull) then
    begin
    	vDataBanco := vDadosIni.getDataBanco(buscas2);

      if (vDataBanco > vCobreBem.dataSet.FieldByName('DATA_VENC_CERT').AsDateTime) then
      begin
        vDataAvisoVenc := _LerConfiguracoesRegistroString('AvisoVencCert', FormatDateTime('dd/mm/yyyy', vDataBanco - 1));

        if trim(FormatDateTime('dd/mm/yyyy', vDataBanco)) <> trim(vDataAvisoVenc) then
        begin
        	Application.MessageBox(PChar('Cerificado digital do boleto vencido: ' + FormatDateTime('dd/mm/yyyy', vCobreBem.dataSet.FieldByName('DATA_VENC_CERT').AsDateTime)), 'Erro', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
        	_GravaConfiguracoesString('AvisoVencCert', FormatDateTime('dd/mm/yyyy', vDataBanco));
        end;
      end
      else if (vDataBanco + vDadosIni.vBoletos.vDiasAvisoVencCertificado >= vCobreBem.dataSet.FieldByName('DATA_VENC_CERT').AsDateTime) then
      begin
      	vDataAvisoVenc := _LerConfiguracoesRegistroString('AvisoVencCert', FormatDateTime('dd/mm/yyyy', vDataBanco - 1));

      	if trim(FormatDateTime('dd/mm/yyyy', vDataBanco)) <> trim(vDataAvisoVenc) then
        begin
          Application.MessageBox(PChar('Cerificado digital do boleto vencendo: ' + FormatDateTime('dd/mm/yyyy', vCobreBem.dataSet.FieldByName('DATA_VENC_CERT').AsDateTime)), 'Atenção', MB_ICONWARNING + MB_OK + MB_DEFBUTTON1);
          _GravaConfiguracoesString('AvisoVencCert', FormatDateTime('dd/mm/yyyy', vDataBanco));
        end;
      end;
    end;

    // Gravar auditoria
    if trim(pProcesso) <> '' then
    begin
      Result := montaSelect('select ' + Fsql_campos + ' from BOLETAS ' +
        Fsql_inner +
        ' where BOLETAS.N_SEQ_BOL in (' + sqlIn + ') ' +
        ' and BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
        ' and BOLETAS.ATIVO = 1 ');
      try
        dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
          vDadosIni.GravaAuditoria(
            trim(pProcesso),
            trim(pAcao),
            dataSet.FieldByName('N_DOC_BOL').AsString + ' | ' +
            vDadosIni.IfThen(trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString) <> '',
              trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString),
              trim(dataSet.FieldByName('API_NOSSONUMERO').AsString)),
            'BOLETAS',
            dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);

          dataSet.Next;
        end;
      finally
        dataSet.First;
        dataSet.EnableControls;
      end;
    end;

    if Length(pIds) > 0 then
    begin
      pathName := GetPathTemp('Temp\BOL');
      deleteList := NewStringList(True);
      prepare_loop();
      try
        Screen.Cursor := crHourGlass;

        if pUnicoEmailWhatsApp then
          vMens := 'Processando Boletos - ' + IntToStr(Length(pIds))
        else
          vMens := vDadosIni.IfThen(pImprimir, 'Imprimindo', '') +
                   vDadosIni.IfThen(pImprimir and pEnviar, '/', '') +
                   vDadosIni.IfThen(pEnviar, 'Enviando', '') + ' ' +
                   OrigemEnvStr[pOrigem] + ' - ' + IntToStr(Length(pIds));

        if pExibirHint then
          vDadosIni.abreStatusProcessamento('', vMens);

        vDadosIni.logsBoleto(Self.ClassName + '._GerarBoletosPlugBoletos - plugboleto_emitir', 'boleto');

        plugboleto_emitir(
          Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10;print=%s',
                 [vDadosIni.vBancoHW, vDadosIni.codEmpresa, BoolToStr(pImprimir, True)]), pIds);

        if trim(sqlIn) <> '' then
        begin
          Result := montaSelect('select ' + Fsql_campos + ' from BOLETAS ' +
            Fsql_inner +
            ' where BOLETAS.N_SEQ_BOL in (' + sqlIn + ') ' +
            ' and BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
            ' and BOLETAS.ATIVO = 1 ');

          try
            dataSet.DisableControls;
            dataSet.First;
            while not dataSet.Eof do
            begin
              if trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').asString) <> '' then
                if not (_AlteraFormaPagamento) then
                begin
                  Result := false;
                  exit;
                end;

              dataSet.Next;
            end;
          finally
            dataSet.First;
            dataSet.EnableControls;
          end;

          CommitaTransacao;
        end;

  //      Self.dataSet.Refresh;

        if (not pEnviar) and (pOrigem = cBoleto) then
          Exit;

        qry := QueryHelper.CreateObj(buscas2).Open('select n_seq_bol, htmlboleto from boletas' +
                                                   ' where n_seq_bol in (%s) and cod_empresa = %d and ativo = 1 and tipo_api = ''S''',
                                                   [sqlIn, vDadosIni.cod_empresa]).First;
        while not qry.Eof do
        begin
          fileName := pathName + qry.fstr('N_SEQ_BOL') + '.pdf';

          fileName := Base64Helper.DecodeFile(qry.fstr('htmlboleto', Pos('|', qry.fstr('htmlboleto')) + 1, Length(qry.fstr('htmlboleto'))), fileName);

          qry.Next;
        end;

        begin
          if (pEnviar) and (pUnicoEmailWhatsApp) and (pOrigem = cBoleto) then
          begin
            LogApp.Log('Bol', 'Unicoemail');

            separaboletos := TConfig_sistema_class.getConf('emp_unico_anexo_por_email', buscas, vDadosIni.cod_empresa)
              .ReadString('Conf_Boletos_Avulsos', 'Ativo') = 'S';

            buscas2.Close;
            buscas2.SQL.Text := ' select cod_cliente, nome_cliente, razao, email from clientes ' +
              ' where cod_cliente = :cod_cliente and cod_empresa = :cod_empresa ';
            buscas2.ParamByName('COD_CLIENTE').AsInteger := dataSet.FieldByName('COD_CLIENTE').AsInteger;
            buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
            buscas2.Open;

            vListaAnexos := TStringList.Create;
            vListaAnexos.Clear;

            try
              //dataSet.DisableControls;
              dataSet.First;
              while not dataSet.Eof do
              begin
                fileName := pathName + fstr('N_SEQ_BOL') + '.pdf';

                if FileExists(fileName) then
                begin
                  LogApp.Log('Bol', fileName + ' Existe');
                  deleteList.Add(fileName);
                  vListaAnexos.Add(fileName);
                end
                else
                //if not FileExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + dataSet.FieldByName('N_SEQ_BOL').AsString + '.pdf') then
                begin
                  LogApp.Log('Bol', fileName + ' Nom Existe');
                  Application.MessageBox('Boleto a ser anexado no e-mail não encontrado!', 'Informação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
                  Result := False;
                  exit;
                end;

                //vListaAnexos.Add(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + dataSet.FieldByName('N_SEQ_BOL').AsString + '.pdf');

                dataSet.Next;
              end;
            finally
              dataSet.First;
              //dataSet.EnableControls;
            end;

            try
              vAssuntoEmail := vDadosIni.vBoletos.vAssunto_bol;
              vMensagemEmail := vDadosIni.vBoletos.vMsg_bol.Text;
              vAssuntoWhatsApp := vDadosIni.vBoletos.vAssuntoWhatsApp_bol;
              vMensagemWhatsApp := vDadosIni.vBoletos.vMsgWhatsApp_bol.Text;

              if (pConfEmailWhatsApp) then
                if not abreFormConfEmail(pArrayAplicativo, pArrayContato, pEnviar) then
                  Exit;

              if (pEnviar) then
              begin
                if Length(pArrayContato) > 0 then
                begin
                  for K := 0 to Length(pArrayContato) - 1 do
                  begin
                    vDadosIni.retornaMensagemEnv(pOrigem, pArrayContato[K].Aplicativo, vAssunto, vMensagem);

                    try
                      if vDadosIni.EnvEmail(
                        vAssunto,
                        vMensagem,
                        dataSet.FieldByName('COD_CLIENTE').AsInteger,
                        pArrayContato[K].Aplicativo,
                        vNumDoc,
                        vTipoDoc,
                        cBoleto,
                        vListaAnexos.Text,
                        vListaAnexos.Count,
                        True,
                        pArrayContato[K].Identificacao,
                        pArrayContato[K].Contato,
                        pArrayContato[K].Avulso,
                        separaboletos) then
                      begin
                        try
                          dataSet.DisableControls;
                          dataSet.First;
                          while not dataSet.Eof do
                          begin
                            if inherited Edit then
                            begin
                              if pArrayContato[K].Aplicativo = cEmail then
                              begin
                                if dataSet.FieldByName('ENV_EMAIL_BOL').AsString <> 'S' then
                                  dataSet.FieldByName('ENV_EMAIL_BOL').AsString := 'S';
                                dataSet.FieldByName('DATA_EMAIL_BOL').AsDateTime := Date;
                                dataSet.FieldByName('COD_US_EMAIL_BOL').AsInteger := vDadosIni.vCodUsuario;
                              end
                              else if pArrayContato[K].Aplicativo = cWhatsApp then
                              begin
                                if dataSet.FieldByName('ENV_WHATSAPP_BOL').AsString <> 'S' then
                                  dataSet.FieldByName('ENV_WHATSAPP_BOL').AsString := 'S';
                                dataSet.FieldByName('DATA_WHATSAPP_BOL').AsDateTime := Date;
                                dataSet.FieldByName('COD_US_WHATSAPP_BOL').AsInteger := vDadosIni.vCodUsuario;
                              end;

                              if dataSet.FieldByName('ENV_MENS_BOL').AsString <> 'S' then
                                dataSet.FieldByName('ENV_MENS_BOL').AsString := 'S';
                              dataSet.FieldByName('DATA_MENS_BOL').AsDateTime := Date;
                              dataSet.FieldByName('COD_US_MENS_BOL').AsInteger := vDadosIni.vCodUsuario;
                              dataSet.Post;
                            end;

                            if trim(vDadosIni.vProcessoEnviar) <> '' then
                              vDadosIni.GravaAuditoria(vDadosIni.vProcessoEnviar,
                                'ENVIAR ' + UpperCase(AplicativoEnvStr[pArrayContato[K].Aplicativo]),
                                'SUCESSO - ' + trim(pArrayContato[K].Identificacao), 'BOLETAS', dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);

                            dataSet.Next;
                          end;
                        finally
                          dataSet.First;
                          dataSet.EnableControls;
                        end;
                      end
                      else
                      begin
                        Application.MessageBox(PChar('Falha ao enviar ' + LowerCase(AplicativoEnvStr[pArrayContato[K].Aplicativo]) + ' para ' + trim(pArrayContato[K].Identificacao) + '.'), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
                        if trim(vDadosIni.vProcessoEnviar) <> '' then
                          vDadosIni.GravaAuditoria(vDadosIni.vProcessoEnviar,
                          'ENVIAR ' + UpperCase(AplicativoEnvStr[pArrayContato[K].Aplicativo]),
                          'FALHA - ' + trim(pArrayContato[K].Identificacao), 'BOLETAS', dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);
                      end;
                    except
                      Application.MessageBox(PChar('Falha ao enviar ' + LowerCase(AplicativoEnvStr[pArrayContato[K].Aplicativo]) + ' para ' + trim(pArrayContato[K].Identificacao) + '.'), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
                      if trim(vDadosIni.vProcessoEnviar) <> '' then
                        vDadosIni.GravaAuditoria(vDadosIni.vProcessoEnviar,
                          'ENVIAR ' + UpperCase(AplicativoEnvStr[pArrayContato[K].Aplicativo]),
                          'FALHA - ' + trim(pArrayContato[K].Identificacao), 'BOLETAS', dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);
                    end;
                  end;
                end
                else
                begin
                	for vAplicativo in pArrayAplicativo do
           				begin
                  	vDadosIni.retornaMensagemEnv(pOrigem, pArrayContato[K].Aplicativo, vAssunto, vMensagem);

                    vArrayContato := vDadosIni.retornaArrayContato(dataSet.FieldByName('COD_CLIENTE').AsInteger, vAplicativo, pOrigem, False);

                    for K := 0 to Length(vArrayContato) - 1 do
                    begin
                      try
                        if vDadosIni.EnvEmail(
                          vAssunto,
                          vMensagem,
                          dataSet.FieldByName('COD_CLIENTE').AsInteger,
                          vArrayContato[K].Aplicativo,
                          vNumDoc,
                          vTipoDoc,
                          cBoleto,
                          vListaAnexos.Text,
                          vListaAnexos.Count,
                          True,
                          vArrayContato[K].Identificacao,
                          vArrayContato[K].Contato,
                          vArrayContato[K].Avulso,
                          separaboletos) then
                        begin
                          try
                            dataSet.DisableControls;
                            dataSet.First;
                            while not dataSet.Eof do
                            begin
                              if inherited Edit then
                              begin
                                if vArrayContato[K].Aplicativo = cEmail then
                                begin
                                  if dataSet.FieldByName('ENV_EMAIL_BOL').AsString <> 'S' then
                                    dataSet.FieldByName('ENV_EMAIL_BOL').AsString := 'S';
                                  dataSet.FieldByName('DATA_EMAIL_BOL').AsDateTime := Date;
                                  dataSet.FieldByName('COD_US_EMAIL_BOL').AsInteger := vDadosIni.vCodUsuario;
                                end
                                else if vArrayContato[K].Aplicativo = cWhatsApp then
                                begin
                                  if dataSet.FieldByName('ENV_WHATSAPP_BOL').AsString <> 'S' then
                                    dataSet.FieldByName('ENV_WHATSAPP_BOL').AsString := 'S';
                                  dataSet.FieldByName('DATA_WHATSAPP_BOL').AsDateTime := Date;
                                  dataSet.FieldByName('COD_US_WHATSAPP_BOL').AsInteger := vDadosIni.vCodUsuario;
                                end;

                                if dataSet.FieldByName('ENV_MENS_BOL').AsString <> 'S' then
                                  dataSet.FieldByName('ENV_MENS_BOL').AsString := 'S';
                                dataSet.FieldByName('DATA_MENS_BOL').AsDateTime := Date;
                                dataSet.FieldByName('COD_US_MENS_BOL').AsInteger := vDadosIni.vCodUsuario;
                                dataSet.Post;
                              end;

                              if trim(vDadosIni.vProcessoEnviar) <> '' then
                                vDadosIni.GravaAuditoria(vDadosIni.vProcessoEnviar,
                                  'ENVIAR ' + UpperCase(AplicativoEnvStr[vArrayContato[K].Aplicativo]),
                                  'SUCESSO - ' + trim(vArrayContato[K].Identificacao), 'BOLETAS', dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);

                              dataSet.Next;
                            end;
                          finally
                            dataSet.First;
                            dataSet.EnableControls;
                          end;
                        end
                        else
                        begin
                          Application.MessageBox(PChar('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[K].Aplicativo]) + ' para ' + trim(vArrayContato[K].Identificacao) + '.'), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
                          if trim(vDadosIni.vProcessoEnviar) <> '' then
                            vDadosIni.GravaAuditoria(vDadosIni.vProcessoEnviar,
                            'ENVIAR ' + UpperCase(AplicativoEnvStr[vArrayContato[K].Aplicativo]),
                            'FALHA - ' + trim(vArrayContato[K].Identificacao), 'BOLETAS', dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);
                        end;
                      except
                        Application.MessageBox(PChar('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[K].Aplicativo]) + ' para ' + trim(vArrayContato[K].Identificacao) + '.'), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
                        if trim(vDadosIni.vProcessoEnviar) <> '' then
                          vDadosIni.GravaAuditoria(vDadosIni.vProcessoEnviar,
                            'ENVIAR ' + UpperCase(AplicativoEnvStr[vArrayContato[K].Aplicativo]),
                            'FALHA - ' + trim(vArrayContato[K].Identificacao), 'BOLETAS', dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);
                      end;
                    end;
                  end;
                end;
              end;
            finally
            	vDadosIni.vBoletos.vAssunto_bol := vAssuntoEmail;
              vDadosIni.vBoletos.vMsg_bol.Text := vMensagemEmail;
              vDadosIni.vBoletos.vAssuntoWhatsApp_bol := vAssuntoWhatsApp;
              vDadosIni.vBoletos.vMsgWhatsApp_bol.Text := vMensagemWhatsApp;
            end;
          end
          else
          begin
            try
              for I := 0 to Length(pIds) - 1 do
              begin
                fileName := pathName + IntToStr(pIds[I]) + '.pdf';
                if FileExists(fileName) then
                  deleteList.Add(fileName)
                else
                //if not FileExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' +IntToStr(ids[I]) + '.pdf') then
                begin
                  Application.MessageBox('Boleto a ser anexado no e-mail não encontrado!', 'Informação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
                  Result := False;
                  exit;
                end;
              end;

              for I := 0 to Length(pIds) - 1 do
              begin
                fileName := pathName + IntToStr(pIds[I]) + '.pdf';

                Result := montaSelect('select ' + Fsql_campos + ' from BOLETAS ' +
                    Fsql_inner +
                    ' where BOLETAS.N_SEQ_BOL = ' + IntToStr(pIds[I]) +
                    ' and BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
                    ' and BOLETAS.ATIVO = 1 ');

                try
                  vAssuntoEmail := vDadosIni.vBoletos.vAssunto_bol;
                  vMensagemEmail := vDadosIni.vBoletos.vMsg_bol.Text;
                  vAssuntoWhatsApp := vDadosIni.vBoletos.vAssuntoWhatsApp_bol;
                  vMensagemWhatsApp := vDadosIni.vBoletos.vMsgWhatsApp_bol.Text;

                  if (pConfEmailWhatsApp) then
                    if not abreFormConfEmail(pArrayAplicativo, pArrayContato, pEnviar) then
                      Exit;

                  if (pEnviar) then
                  begin
                    if Length(pArrayContato) > 0 then
                    begin
                      for K := 0 to Length(pArrayContato) - 1 do
                      begin
                        vDadosIni.retornaMensagemEnv(pOrigem, pArrayContato[K].Aplicativo, vAssunto, vMensagem);

                        try
                          if vDadosIni.EnvEmail(
                            vAssunto,
                            vMensagem,
                            dataSet.FieldByName('COD_CLIENTE').AsInteger,
                            pArrayContato[K].Aplicativo,
                            vNumDoc,
                            vTipoDoc,
                            cBoleto,
                            filename,
                            1,
                            True,
                            pArrayContato[K].Identificacao,
                            pArrayContato[K].Contato,
                            pArrayContato[K].Avulso) then
                          begin
                            if not dataSet.IsEmpty then
                            begin
                              if inherited Edit then
                              begin
                                if pArrayContato[K].Aplicativo = cEmail then
                                begin
                                  if dataSet.FieldByName('ENV_EMAIL_BOL').AsString <> 'S' then
                                    dataSet.FieldByName('ENV_EMAIL_BOL').AsString := 'S';
                                  dataSet.FieldByName('DATA_EMAIL_BOL').AsDateTime := Date;
                                  dataSet.FieldByName('COD_US_EMAIL_BOL').AsInteger := vDadosIni.vCodUsuario;
                                end
                                else if pArrayContato[K].Aplicativo = cWhatsApp then
                                begin
                                  if dataSet.FieldByName('ENV_WHATSAPP_BOL').AsString <> 'S' then
                                    dataSet.FieldByName('ENV_WHATSAPP_BOL').AsString := 'S';
                                  dataSet.FieldByName('DATA_WHATSAPP_BOL').AsDateTime := Date;
                                  dataSet.FieldByName('COD_US_WHATSAPP_BOL').AsInteger := vDadosIni.vCodUsuario;
                                end;

                                if dataSet.FieldByName('ENV_MENS_BOL').AsString <> 'S' then
                                  dataSet.FieldByName('ENV_MENS_BOL').AsString := 'S';
                                dataSet.FieldByName('DATA_MENS_BOL').AsDateTime := Date;
                                dataSet.FieldByName('COD_US_MENS_BOL').AsInteger := vDadosIni.vCodUsuario;
                                dataSet.Post;
                              end;

                              if trim(vDadosIni.vProcessoEnviar) <> '' then
                                vDadosIni.GravaAuditoria(vDadosIni.vProcessoEnviar,
                                  'ENVIAR ' + UpperCase(AplicativoEnvStr[pArrayContato[K].Aplicativo]),
                                  'SUCESSO - ' + trim(pArrayContato[K].Identificacao), 'BOLETAS', dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);
                              Apply;
                            end;
                          end
                          else
                          begin
                            Application.MessageBox(PChar('Falha ao enviar ' + LowerCase(AplicativoEnvStr[pArrayContato[K].Aplicativo]) + ' para ' + trim(pArrayContato[K].Identificacao) + '.'), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
                            if trim(vDadosIni.vProcessoEnviar) <> '' then
                              vDadosIni.GravaAuditoria(vDadosIni.vProcessoEnviar,
                                'ENVIAR ' + UpperCase(AplicativoEnvStr[pArrayContato[K].Aplicativo]),
                                'FALHA - ' + trim(pArrayContato[K].Identificacao), 'BOLETAS', dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);
                          end;
                        except
                          Application.MessageBox(PChar('Falha ao enviar ' + LowerCase(AplicativoEnvStr[pArrayContato[K].Aplicativo]) + ' para ' + trim(pArrayContato[K].Identificacao) + '.'), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
                          if trim(vDadosIni.vProcessoEnviar) <> '' then
                            vDadosIni.GravaAuditoria(vDadosIni.vProcessoEnviar,
                              'ENVIAR ' + UpperCase(AplicativoEnvStr[pArrayContato[K].Aplicativo]),
                              'FALHA - ' + trim(pArrayContato[K].Identificacao), 'BOLETAS', dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);
                        end;
                      end
                    end
                    else
                    begin
                      for vAplicativo in pArrayAplicativo do
                      begin
                        vDadosIni.retornaMensagemEnv(pOrigem, vAplicativo, vAssunto, vMensagem);

                        vArrayContato := vDadosIni.retornaArrayContato(dataSet.FieldByName('COD_CLIENTE').AsInteger, vAplicativo, pOrigem, False);
                        
                        for K := 0 to Length(vArrayContato) - 1 do
                        begin
                          try
                            if vDadosIni.EnvEmail(
                              vAssunto,
                              vMensagem,
                              dataSet.FieldByName('COD_CLIENTE').AsInteger,
                              vArrayContato[K].Aplicativo,
                              vNumDoc,
                              vTipoDoc,
                              cBoleto,
                              filename,
                              1,
                              True,
                              vArrayContato[K].Identificacao,
                              vArrayContato[K].Contato,
                              vArrayContato[K].Avulso) then
                            begin
                              if not dataSet.IsEmpty then
                              begin
                                if inherited Edit then
                                begin
                                  if vArrayContato[K].Aplicativo = cEmail then
                                  begin
                                    if dataSet.FieldByName('ENV_EMAIL_BOL').AsString <> 'S' then
                                      dataSet.FieldByName('ENV_EMAIL_BOL').AsString := 'S';
                                    dataSet.FieldByName('DATA_EMAIL_BOL').AsDateTime := Date;
                                    dataSet.FieldByName('COD_US_EMAIL_BOL').AsInteger := vDadosIni.vCodUsuario;
                                  end
                                  else if vArrayContato[K].Aplicativo = cWhatsApp then
                                  begin
                                    if dataSet.FieldByName('ENV_WHATSAPP_BOL').AsString <> 'S' then
                                      dataSet.FieldByName('ENV_WHATSAPP_BOL').AsString := 'S';
                                    dataSet.FieldByName('DATA_WHATSAPP_BOL').AsDateTime := Date;
                                    dataSet.FieldByName('COD_US_WHATSAPP_BOL').AsInteger := vDadosIni.vCodUsuario;
                                  end;

                                  if dataSet.FieldByName('ENV_MENS_BOL').AsString <> 'S' then
                                    dataSet.FieldByName('ENV_MENS_BOL').AsString := 'S';
                                  dataSet.FieldByName('DATA_MENS_BOL').AsDateTime := Date;
                                  dataSet.FieldByName('COD_US_MENS_BOL').AsInteger := vDadosIni.vCodUsuario;
                                  dataSet.Post;
                                end;

                                if trim(vDadosIni.vProcessoEnviar) <> '' then
                                  vDadosIni.GravaAuditoria(vDadosIni.vProcessoEnviar,
                                    'ENVIAR ' + UpperCase(AplicativoEnvStr[vArrayContato[K].Aplicativo]),
                                    'SUCESSO - ' + trim(vArrayContato[K].Identificacao), 'BOLETAS', dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);
                                Apply;
                              end;
                            end
                            else
                            begin
                              Application.MessageBox(PChar('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[K].Aplicativo]) + ' para ' + trim(vArrayContato[K].Identificacao) + '.'), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
                              if trim(vDadosIni.vProcessoEnviar) <> '' then
                                vDadosIni.GravaAuditoria(vDadosIni.vProcessoEnviar,
                                  'ENVIAR ' + UpperCase(AplicativoEnvStr[vArrayContato[K].Aplicativo]),
                                  'FALHA - ' + trim(vArrayContato[K].Identificacao), 'BOLETAS', dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);
                            end;
                          except
                            Application.MessageBox(PChar('Falha ao enviar ' + LowerCase(AplicativoEnvStr[vArrayContato[K].Aplicativo]) + ' para ' + trim(vArrayContato[K].Identificacao) + '.'), 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
                            if trim(vDadosIni.vProcessoEnviar) <> '' then
                              vDadosIni.GravaAuditoria(vDadosIni.vProcessoEnviar,
                                'ENVIAR ' + UpperCase(AplicativoEnvStr[vArrayContato[K].Aplicativo]),
                                'FALHA - ' + trim(vArrayContato[K].Identificacao), 'BOLETAS', dataSet.FieldByName('N_SEQ_BOL').AsString, buscas);
                          end;
                        end;
                      end;
                    end;
                  end;
                finally
                  vDadosIni.vBoletos.vAssunto_bol := vAssuntoEmail;
                  vDadosIni.vBoletos.vMsg_bol.Text := vMensagemEmail;
                  vDadosIni.vBoletos.vAssuntoWhatsApp_bol := vAssuntoWhatsApp;
                  vDadosIni.vBoletos.vMsgWhatsApp_bol.Text := vMensagemWhatsApp;
                end;
              end;
              CommitaTransacao;
            finally
              {
              for I := 0 to Length(ids) - 1 do
                if FileExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + IntToStr(ids[I]) + '.pdf') then
                  DeleteFile(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\BOL' + IntToStr(ids[I]) + '.pdf');
              }
            end;
          end;
        end;
      finally
        for I := 0 to deleteList.Count - 1 do
          if FileExists(deleteList[I]) then
            DeleteFile(deleteList[I]);

        prepare_loop_done();
        dataSet.EnableControls;
        vDadosIni.fechaStatusProcessamento;
        Screen.Cursor := crDefault;
      end;
    end;

    if (pEnviar) and (not pUnicoEmailWhatsApp) then
    begin
      Result := montaSelect('select ' + Fsql_campos + ' from BOLETAS ' +
        Fsql_inner +
        ' where BOLETAS.N_SEQ_BOL in (' + sqlIn + ') ' +
        ' and BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
        ' and BOLETAS.ATIVO = 1 ');
    end;
  finally
  	vDadosIni.logsBoleto(Self.ClassName + '._GerarBoletosPlugBoletos - end', 'boleto');
  end;
end;

function TBoleto._gerarCarne: Boolean;
var
  vContTemp, vTotTemp, vIDCarne: Integer;
  vNDocCarne: string;
  vCodCl: Integer;
  vCodCB: Integer;
  vCodCtrl: Integer;
  vValor: Extended;
begin
  if dataSet.IsEmpty then
    Exit;

  if
    Application.MessageBox(pchar('Ao efetuar este processamento os documentos selecionados serão enviados' +
    ' ao banco como Carnê.' + #13 +
    'Os documentos selecionados devem ser do mesmo cliente e com mesmo valor' + #13 +
    'Deseja continuar mesmo assim?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  if not vDadosIni.PesqPros('BOL026', 'ALTERAR', '', 'BOLETAS', '', buscas, True) then
    Exit;

  try

    try

      vDadosIni.abreStatusProcessamento('', 'Validando registros selecionados');

      IndexFieldNames := 'DATA_VEN_BOL';
      dataSet.First;

      vContTemp := 0;

      while not dataSet.Eof do
      begin
        if dataSet.FieldByName('SelecionaBoleto').AsString = 'S' then
        begin
          vCodCl := dataSet.FieldByName('cod_cliente').AsInteger;
          vValor := dataSet.FieldByName('VL_DOC_BOL').AsFloat;
          vCodCB := dataSet.FieldByName('COD_COBREBEM').AsInteger;
          vCodCtrl := dataSet.FieldByName('COD_CONTROLE_CX').AsInteger;
          Break;
        end;
        dataSet.Next;
      end;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if dataSet.FieldByName('SelecionaBoleto').AsString = 'S' then
        begin
          if dataSet.FieldByName('idcarne').AsInteger <> 0 then
            raiseExceptionCreate('Boleto(s) selecionado(s) já pertence ao carnê ' +
              dataSet.FieldByName('idcarne').AsString, '');

          if Trim(dataSet.FieldByName('REMESSA_ENVIADA').AsString) = 'S' then
            raiseExceptionCreate('Boleto(s) selecionado(s) com remessa já enviada', '');

          if vCodCl <> dataSet.FieldByName('cod_cliente').AsInteger then
            raiseExceptionCreate('Boletos selecionados de clientes diferentes', '');

          if vDadosIni.StrToFloatFormat(vValor, 2) <>
            vDadosIni.StrToFloatFormat(dataSet.FieldByName('VL_DOC_BOL').AsFloat, 2) then
            raiseExceptionCreate('Valor das parcelas do carnê devem ser iguais', '');

          if (vCodCB = 0) and (vCodCB <> dataSet.FieldByName('COD_COBREBEM').AsInteger) then
            vCodCB := dataSet.FieldByName('COD_COBREBEM').AsInteger;

          if dataSet.FieldByName('COD_COBREBEM').AsInteger <> 0 then
            if (vCodCB <> dataSet.FieldByName('COD_COBREBEM').AsInteger) then
              raiseExceptionCreate('Configuração do Boleto (Cobrebem) devem ser iguais', '');

          if (vCodCtrl = 0) and (vCodCtrl <> dataSet.FieldByName('COD_CONTROLE_CX').AsInteger) then
            vCodCtrl := dataSet.FieldByName('COD_CONTROLE_CX').AsInteger;

          if dataSet.FieldByName('COD_CONTROLE_CX').AsInteger <> 0 then
            if (vCodCtrl <> dataSet.FieldByName('COD_CONTROLE_CX').AsInteger) then
              raiseExceptionCreate('Configuração do Boleto (Cobrebem) devem ser iguais', '');
          vContTemp := vContTemp + 1;
        end;
        dataSet.Next;
      end;

      vTotTemp := vContTemp;

      vDadosIni.abreStatusProcessamento('', 'Modificando registros');

      vContTemp := 0;
      vIDCarne := Gencodigo('CARNE', DtmBoletos.SpIncCodigo, vDadosIni.codEmpresa);
      vNDocCarne := vDadosIni.StrZero(vIDCarne, 6);
      CommitaTransacao;

      if not InputQuery('Número do documento',
        'Informe o número do documento do Carne', vNDocCarne) then
        Exit;

      if Trim(vNDocCarne) = '' then
        vNDocCarne := vDadosIni.StrZero(vIDCarne, 6);
      //        raiseExceptionCreate('Número do documento do Carne não informado', '');

      dataSet.First;
      while not dataSet.Eof do
      begin

        if (dataSet.FieldByName('SelecionaBoleto').AsString = 'S') then
        begin

          vContTemp := vContTemp + 1;

          dataSet.Edit;
          dataSet.FieldByName('NPARCELA').AsInteger := vContTemp;
          dataSet.FieldByName('TOTALPARCELAS').AsInteger := vTotTemp;
          dataSet.FieldByName('IDCARNE').AsInteger := vIDCarne;
          dataSet.Post;

        end;

        dataSet.Next;
      end;

      if (Apply) or (dataSet.ChangeCount = 0) then
      begin
        CommitaTransacao;
        Result := True;
        Application.MessageBox('Registros do carne gerados com sucesso', 'Atenção', 0 + 64);
        _BoletosNFOS(
        	vIDCarne,
          0,
          'CR',
          0);
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
      registraErro('function TBoleto._gerarCarne. Erro: ' + e.Message);
    end;
  end;
end;

function TBoleto._gerarImpressao: Boolean;
var
  vIDImpresssao: Integer;
begin
	Result := False;
  //  if not vDadosIni.PesqPros('BOL026', 'ALTERAR', '', 'BOLETAS', '', buscas, True) then
  //    Exit;

  try
    try
      //    dataSet.First;
      //    while not dataSet.Eof do
      //    begin

      if ((dataSet.FieldByName('SelecionaBoleto').AsString = 'S') and
        (Trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString) <> '')) then
      begin
        dataSet.Edit;
        //        dataSet.FieldByName('NPARCELA').AsInteger := vContTemp;
        //        dataSet.FieldByName('TOTALPARCELAS').AsInteger := vTotTemp;
        dataSet.FieldByName('IDIMPRESSAO').AsInteger := 1;
        dataSet.Post;
      end
      else
      begin
        dataSet.Edit;
        dataSet.FieldByName('IDIMPRESSAO').AsInteger := Null;
        dataSet.Post;
      end;

      //      dataSet.Next;
      //    end;

      if (Apply) or (dataSet.ChangeCount = 0) then
      begin
        CommitaTransacao;
        Result := True;
        //      Application.MessageBox('Registros do carne gerados com sucesso', 'Atenção', 0 + 64);
        _BoletosNFOS(
        	0,
          0,
          'CR',
          0,
          IntToStr(vIDImpresssao));
      end
      else
        RollBackTransacao;

    finally
      vDadosIni.fechaStatusProcessamento;
    end;
  except on E: Exception do
  	begin
    	Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
	   	registraErro('function TBoleto._gerarImpressao. Erro: ' + e.Message);
    end;
  end;

  //  except on E: Exception do
  //    begin
  //      RollBackTransacao;
  //      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
  //      registraErro('function TBoleto._gerarImpressao. Erro: ' + e.Message);
  //    end;
end;

procedure TBoleto._ImprimeFaturaNF(RDprint1: TRDprint);
var
  linha: integer;
  vdia, vmes, vano: word;
  endereco, ValorDocBolExtenso: string;
begin
  try
    vDadosIni.abreStatusProcessamento('Imprimindo fatura', 'Processando informações...');
    try
      if not vDadosIni.ModImp(RDprint1) then
        exit;
      //FrModImpG.showmodal;
      //ModImp(RDprint1, FrmodImpG.Combobox1.text);
      linha := 2;
      RDprint1.Abrir;
      // dtm1.QRYEstados.open;
       //if dtm02.QRYempresa.state = dsinactive then
        // dtm02.QRYempresa.open;
      with DtmBoletos do
      begin
        dataset.first;
        while not dataset.EOF do
        begin
          if dataSet.FieldByName('SelecionaBoleto').Value = 'S' then
          begin
            //QrprocNF.close;
            //QrprocNF.params[0].value := QrBoletasNUM_NF_VND.value;
            //QrProcNF.Params[1].Text := FRMPrincipal.CodEmpresa;
            //QrprocNF.open;
            if not (dataSet.FieldByName('NUM_NF_VND').IsNull) then
              vBoletosNFVenda._AbreNFVenda(dataSet.FieldByName('NUM_NF_VND').asstring);
            linha := linha + 5;
            Rdprint1.imp(linha, 49, datetostr(date));
            linha := linha + 5;
            Rdprint1.imp(linha, 11,
              vDadosIni.StrZero(vBoletosNFVenda.dataSet.FieldByName('NUM_NF_VND').AsString, 6));
            Rdprint1.imp(linha, 17, vDadosIni.AlnDir(format('%n',
              [vBoletosNFVenda.dataSet.FieldByName('VL_TOT_VND').asfloat]), 12));
            Rdprint1.imp(linha, 35, vDadosIni.StrZero(dataSet.FieldByName('N_DOC_BOL').AsString,
              8));
            Rdprint1.imp(linha, 43, vDadosIni.AlnDir(format('%n',
              [dataSet.FieldByName('VL_DOC_BOL').AsFloat]), 10));
            Rdprint1.imp(linha, 55, dataSet.FieldByName('DATA_VEN_BOL').asstring);
            linha := linha + 6;
            //QrProcCl.close;
            //QrProcCl.params[0].value := QrBoletasCOD_CLIENTE.value;
            //QrProcCl.Params[1].Text := FRMPrincipal.CodEmpresa;
            //QrProcCl.open;
            vCliente.selecionaCliente(dataSet.FieldByName('COD_CLIENTE').asstring);
            //  Dtm1.QRYEstados.locate('CODIGO_UF', QrProcClCOD_CLIENTE.value, []);
            Rdprint1.imp(linha, 35, copy(vCliente.dataSet.FieldByName('NOME_CLIENTE').value, 1,
              40));
            linha := linha + 1;
            endereco := trim(vCliente.dataSet.FieldByName('ENDERECO').AsString);
            if (vCliente.dataSet.FieldByName('NUM_END_CLIENTE').AsString) <> '' then
              endereco := endereco + ', ' +
                vCliente.dataSet.FieldByName('NUM_END_CLIENTE').AsString;
            if (vCliente.dataSet.FieldByName('COMPLEMENTO').AsString) <> '' then
              endereco := endereco + ', ' + vCliente.dataSet.FieldByName('COMPLEMENTO').AsString;
            Rdprint1.imp(linha, 35, copy((endereco + ' ' +
              vCliente.dataSet.FieldByName('BAIRRO').value), 1, 40));
            linha := linha + 1;
            Rdprint1.imp(linha, 35, copy((vCliente.dataSet.FieldByName('CIDADE').value + '-' +
              vCliente.dataSet.FieldByName('SIGLA_UF').value), 1, 40));
            Rdprint1.imp(linha, 64, vCliente.dataSet.FieldByName('CEP').value);
            Rdprint1.imp(linha, 76, vCliente.dataSet.FieldByName('SIGLA_UF').value);
            linha := linha + 1;
            Rdprint1.imp(linha, 35, vDadosIni.vEmp.vCidade);
            linha := linha + 1;

            if (Length(vCliente.dataSet.FieldByName('CPFCGC').AsString) = 11) then
              vCliente.dataSet.FieldByName('CPFCGC').EditMask := '999.999.999-99;0;'
            else
              vCliente.dataSet.FieldByName('CPFCGC').EditMask := HelperCNPJ.EditMask;// '99\.999\.999\/9999\-99;0;';

            Rdprint1.imp(linha, 35, vCliente.dataSet.FieldByName('CPFCGC').value);
            Rdprint1.imp(linha, 64, vCliente.dataSet.FieldByName('INSC_EST').value);
            linha := linha + 2;
            ValorDocBolExtenso := '';
            ValorDocBolExtenso := dataSet.FieldByName('VL_DOC_BOL').value;

            if length(ValorDocBolExtenso) < 43 then
            begin
              Rdprint1.imp(linha, 35, ValorDocBolExtenso +
                vDadosIni.Replicate('*', 43 - length(ValorDocBolExtenso)));
              linha := linha + 1;
              Rdprint1.imp(linha, 35, vDadosIni.Replicate('*', 43));
            end
            else
            begin
              Rdprint1.imp(linha, 35, copy(ValorDocBolExtenso, 1, 43));
              linha := linha + 1;
              Rdprint1.imp(linha, 35,
                copy(ValorDocBolExtenso, 44,
                length(ValorDocBolExtenso) - 43) +
                vDadosIni.Replicate('*', 43 - (length(ValorDocBolExtenso) - 43)));
            end;
            linha := linha + 7;
            decodedate(dataSet.FieldByName('DATA_EM_BOL').value, vano, vmes, vdia);
            Rdprint1.imp(linha, 28, vDadosIni.StrZero(vdia, 2));
            Rdprint1.imp(linha, 33, vDadosIni.StrZero(vmes, 2));
            Rdprint1.imp(linha, 37, vDadosIni.StrZero(vano, 2));
            linha := linha + 6;
          end;
          dataset.next;
        end
      end;
      RDprint1.Fechar;
    except on E: Exception do
    	begin
	      RDprint1.Fechar;
  	    Cancel;
    	  Application.MessageBox('Erro ao gravar registro, verifique as configurações. Se o erro persistir contacte o administrador da rede.', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
	      registraErro('function TBoleto._ImprimeFaturaNF. Erro: ' + e.Message);
  	  end;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TBoleto._marcaDesmarcaLinha;
begin
  if dataSet.IsEmpty then
    exit;

  dataSet.Edit;
  if dataSet.FieldByName('SelecionaBoleto').AsString = 'S' then
    dataSet.FieldByName('SelecionaBoleto').AsString := ''
  else
    dataSet.FieldByName('SelecionaBoleto').AsString := 'S';
  dataSet.Post;
end;

function TBoleto._marcaImprimirBoleto(n_seq_bol: Integer): boolean;
begin
  if dataSet.FieldByName('N_SEQ_BOL').AsInteger <> n_seq_bol then
  begin
   result :=
      montaSelect('select ' + Fsql_campos + ' from BOLETAS ' +
        Fsql_inner +
        ' where BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
        ' and BOLETAS.N_SEQ_BOL = '+ IntToStr(n_seq_bol));
  end;

  dataSet.Refresh;
  dataSet.Filter := 'N_SEQ_BOL = '+IntToStr(n_seq_bol)+'';
  dataSet.Filtered := true;

  dataSet.Edit;
  dataSet.FieldByName('SelecionaBoleto').AsString := 'S';
  dataSet.Post;
end;

function TBoleto._PassarConfiguracao(pDiretorioArquivoRemessa: string = ''): boolean;
var
  senha: string;
  vTemp: string;
  txt: textfile;
  ImageLogo, ImageBanco, ImageCodBarraA: TImage;
  StreamLogo, StreamBanco, StreamCodBarraA: TStream;
  JpgLogo, JpgBanco, JpgCodBarraA: TJpegImage;
begin
	Result := false;
	if not vCobreBem.criarPastasTemporarias then
  	exit;
  {Início dos parâmetros obrigatórios da conta corrente}
  if trim(vCobreBem.dataSet.FieldByName('LICENCA').asString) = '' then
    if (not (FileExists(vCobrebem.dataSet.FieldByName('ARQUIVOLICENCA').AsString))) then
      raise Exception.Create('O arquivo de licença de configurado do convênio não foi localizado.' +
        vCobrebem.dataSet.FieldByName('ARQUIVOLICENCA').AsString);

  //Salvar licença do cobrebem do computador
  if trim(vCobreBem.dataSet.FieldByName('LICENCA').asString) <> '' then
  begin
  	try
      AssignFile(txt, vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        ExtractFileName(vCobreBem.dataSet.FieldByName('ARQUIVOLICENCA').asString));
      Rewrite(txt, vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        ExtractFileName(vCobreBem.dataSet.FieldByName('ARQUIVOLICENCA').asString));
      Append(txt);
      Write(txt, trim(vCobreBem.dataSet.FieldByName('LICENCA').asString));
    finally
    	CloseFile(txt);
    end;

    if not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
    	'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
      ExtractFileName(vCobreBem.dataSet.FieldByName('ARQUIVOLICENCA').asString))) then
    begin
    	if (not (FileExists(vCobrebem.dataSet.FieldByName('ARQUIVOLICENCA').AsString))) then
      	raise Exception.Create('O arquivo de licença configurado do convênio não foi localizado.' +
        	vCobrebem.dataSet.FieldByName('ARQUIVOLICENCA').AsString);

    	CobreBemX.ArquivoLicenca := vCobreBem.dataSet.FieldByName('ARQUIVOLICENCA').asString;
    end
    else
    begin
    	CobreBemX.ArquivoLicenca := vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
      	'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
     	  ExtractFileName(vCobreBem.dataSet.FieldByName('ARQUIVOLICENCA').asString);
    end;
  end
  else
	  CobreBemX.ArquivoLicenca := vCobreBem.dataSet.FieldByName('ARQUIVOLICENCA').asString;
    
  CobreBemX.CodigoAgencia := vCobreBem.dataSet.FieldByName('CODIGOAGENCIA').asString;
  CobreBemX.NumeroContaCorrente := vCobreBem.dataSet.FieldByName('NUMEROCONTACORRENTE').asString;
  CobreBemX.CodigoCedente := vCobreBem.dataSet.FieldByName('CODIGOCEDENTE').asString;
  CobreBemX.InicioNossoNumero := vCobreBem.dataSet.FieldByName('INICIONOSSONUMERO').asString;
  CobreBemX.FimNossoNumero := vCobreBem.dataSet.FieldByName('FIMNOSSONUMERO').asString;
  CobreBemX.ProximoNossoNumero := vCobreBem.dataSet.FieldByName('PROXIMONOSSONUMERO').asString;
  if vCobreBem.dataSet.FieldByName('OUTRODADOCONFIGURACAO1').asString <> '' then
    CobreBemX.OutroDadoConfiguracao1 :=
      vCobreBem.dataSet.FieldByName('OUTRODADOCONFIGURACAO1').asString;
  if vCobreBem.dataSet.FieldByName('OUTRODADOCONFIGURACAO2').asString <> '' then
    CobreBemX.OutroDadoConfiguracao2 :=
      vCobreBem.dataSet.FieldByName('OUTRODADOCONFIGURACAO2').asString;

  {Parãmetros Arquivo Remessa}
{    vTemp := FormatDateTime('dd/mm/yyyy hh:mm:ss', vDadosIni.getDataHoraBanco(buscas));
  vtemp := StringReplace(vTemp, '/', '', [rfReplaceAll]);
  vtemp := StringReplace(vTemp, ':', '', [rfReplaceAll]);
  vtemp := StringReplace(vTemp, ' ', '_', [rfReplaceAll]);
  vTemp := vCobreBem.dataSet.FieldByName('BANCO').asString + '_' +
    vDadosIni.StrZero(vCobreBem.dataSet.FieldByName('SEQUENCIA_REMESSA').asInteger,7) + '_' + vTemp;
  CobreBemX.ArquivoRemessa.Arquivo := vTemp + '.REM'; }

//  vTemp := FormatDateTime('dd/mm/yy', vDadosIni.getDataHoraBanco(buscas));
//  vtemp := StringReplace(vTemp, '/', '', [rfReplaceAll]);
//  vtemp := StringReplace(vTemp, ':', '', [rfReplaceAll]);
//  vtemp := StringReplace(vTemp, ' ', '_', [rfReplaceAll]);
//  vTemp := vCobreBem.dataSet.FieldByName('BANCO').asString + '_' +
//    vDadosIni.StrZero(vCobreBem.dataSet.FieldByName('SEQUENCIA_REMESSA').asInteger, 7) + '_' +
//    vTemp;
  if vCobreBem.dataSet.FieldByName('BANCO').AsString = '341' then
    vTemp := RightStr(vCobreBem.fstr('BANCO') + vDadosIni.StrZero(vCobreBem.fint('SEQUENCIA_REMESSA'), 5), 8)
  else
  vTemp := vCobreBem.dataSet.FieldByName('BANCO').asString + '_' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '_' +
    vDadosIni.StrZero(vCobreBem.dataSet.FieldByName('SEQUENCIA_REMESSA').asInteger, 7);
  CobreBemX.ArquivoRemessa.Arquivo := vTemp + '.REM';
  CobreBemX.ArquivoRemessa.Layout := vCobreBem.dataSet.FieldByName('LAYOUTARQUIVOREMESSA').asString;
  CobreBemX.PadroesBoleto.PadroesBoletoImpresso.MargemSuperior :=
    vCobreBem.dataSet.FieldByName('MARGEMSUPERIOR').AsInteger;
  CobreBemX.PadroesBoleto.PadroesBoletoImpresso.PadroesVersoBoleto.Remetente :=
    vDadosIni.Space(vDadosIni.vEmp.vEndereco + ' N ' + vDadosIni.vEmp.vNumeroEnd, 60) +
    vDadosIni.vEmp.vCEP;
  if (trim(pDiretorioArquivoRemessa) <> '') then
  	vTemp := pDiretorioArquivoRemessa
  else
	  vTemp := vCobreBem.dataSet.FieldByName('ENDERECOREMESSARETORNO').AsString;
  // vTemp := StringReplace(vTemp, '\\', '\', [rfReplaceAll]);
  CobreBemX.ArquivoRemessa.Diretorio := vTemp + 'REMESSA\';
  CobreBemX.ArquivoRemessa.Sequencia :=
    vCobreBem.dataSet.FieldByName('SEQUENCIA_REMESSA').asInteger;
  {Parâmetro Arquivo Retorno}
  CobreBemX.ArquivoRetorno.Layout := vCobreBem.dataSet.FieldByName('LAYOUTARQUIVORETORNO').asString;
  CobreBemX.ArquivoRetorno.Diretorio := vTemp + 'RETORNO\';

  {Parâmetros Layout Boleto por Email}
  CobreBemX.PadroesBoleto.PadroesBoletoEmail.LayoutBoletoEmail :=
    vCobreBem.dataSet.FieldByName('LAYOUTBOLETOSEMAIL').asString;

  {Parâmetros do layout}
  CobreBemX.PadroesBoleto.PadroesBoletoImpresso.LayoutBoleto :=
    vCobreBem.dataSet.FieldByName('LAYOUTBOLETOIMPRESSO').asString;
  if Pos('Personalizado', vCobreBem.dataSet.FieldByName('LAYOUTBOLETOIMPRESSO').asString) <> 0 then
    CobreBemX.PadroesBoleto.PadroesBoletoImpresso.HTMLReciboPersonalizado :=
      vCobreBem.dataSet.FieldByName('HTMLBOLETO').asString;

  // Imagem existe (logotipo)
  if (trim(vCobreBem.dataSet.FieldByName('LOGOTIPO').asString) <> '') then
  begin
    if ((trim(vCobreBem.dataSet.FieldByName('LOGOTIPO').asString) <> '')
    	and	(not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
    		'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
      	ExtractFileName(vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').asString))))) then
    begin
    	_strBase64toImage(
          vCobreBem.dataSet.FieldByName('LOGOTIPO').AsString,
          vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
	          'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
  	        ExtractFileName(vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').asString));

      if not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        ExtractFileName(vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').asString))) then
      begin
        CobreBemX.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo :=
          vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').asString;
      end
      else
      begin
        CobreBemX.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo :=
          vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          ExtractFileName(vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').asString);
      end;
    end
    else
    begin
      CobreBemX.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo :=
        vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').asString;
    end;
  end
  else
  begin
    CobreBemX.PadroesBoleto.PadroesBoletoImpresso.ArquivoLogotipo :=
        vCobreBem.dataSet.FieldByName('IMAGENSLOGOTIPO').asString;
  end;

  // Imagens existem (logobanco, codigo de barras a, b, c, d)
  if ((trim(vCobreBem.dataSet.FieldByName('LOGOBANCO').asString) <> '')
  	or (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_A').asString) <> '')
    or (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_B').asString) <> '')
    or (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_C').asString) <> '')
    or (trim(vCobreBem.dataSet.FieldByName('CODBARRAS_D').asString) <> '')) then
  begin
    if ((trim(vCobreBem.dataSet.FieldByName('LOGOBANCO').asString) <> '')
        and (not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          'imagens\' + vCobreBem.dataSet.FieldByName('BANCO').asString + '.jpg'))))
      or ((trim(vCobreBem.dataSet.FieldByName('CODBARRAS_A').asString) <> '')
        and (not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          'imagens\a.gif'))))
      or ((trim(vCobreBem.dataSet.FieldByName('CODBARRAS_B').asString) <> '')
        and (not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          'imagens\b.gif'))))
      or ((trim(vCobreBem.dataSet.FieldByName('CODBARRAS_C').asString) <> '')
        and (not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          'imagens\c.gif'))))
      or ((trim(vCobreBem.dataSet.FieldByName('CODBARRAS_D').asString) <> '')
        and (not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          'imagens\d.gif')))) then
    begin
  	  if not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        'imagens\' + vCobreBem.dataSet.FieldByName('BANCO').asString + '.jpg')) then
      begin
        _strBase64toImage(
            vCobreBem.dataSet.FieldByName('LOGOBANCO').AsString,
            vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
              'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
              'imagens\' + vCobreBem.dataSet.FieldByName('BANCO').asString + '.jpg');
      end;

      // Criar imagem código de barras a no computador
      if not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        'imagens\a.gif')) then
      begin
        _strBase64toImage(
          vCobreBem.dataSet.FieldByName('CODBARRAS_A').AsString,
          vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
            'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
            'imagens\a.gif');
      end;

      // Criar imagem código de barras b no computador
      if not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        'imagens\b.gif')) then
      begin
        _strBase64toImage(
          vCobreBem.dataSet.FieldByName('CODBARRAS_B').AsString,
          vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
            'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
            'imagens\b.gif');
      end;

      // Criar imagem código de barras c no computador
      if not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        'imagens\c.gif')) then
      begin
        _strBase64toImage(
          vCobreBem.dataSet.FieldByName('CODBARRAS_C').AsString,
          vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
            'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
            'imagens\c.gif');
      end;

      // Criar imagem código de barras d no computador
      if not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        'imagens\d.gif')) then
      begin
        _strBase64toImage(
          vCobreBem.dataSet.FieldByName('CODBARRAS_D').AsString,
          vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
            'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
            'imagens\d.gif');
      end;

      // Imagens da logo e código de barras existem
      if (FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          'imagens\' + vCobreBem.dataSet.FieldByName('BANCO').asString + '.jpg')))
        and (FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          'imagens\a.gif')))
        and (FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          'imagens\b.gif')))
        and (FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          'imagens\c.gif')))
        and (FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          'imagens\d.gif'))) then
      begin
        CobreBemX.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras :=
          vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(vCobreBem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          'imagens\';
      end
      else
      begin
        CobreBemX.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras :=
          vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').asString;
      end;
    end
    else
    begin
    	CobreBemX.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras :=
      	vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').asString;
    end;
  end
  else
  begin
	  CobreBemX.PadroesBoleto.PadroesBoletoImpresso.CaminhoImagensCodigoBarras :=
      vCobreBem.dataSet.FieldByName('IMAGENSBOLETO').asString;
  end;

  CobreBemX.PadroesBoleto.IdentificacaoCedente :=
    (vCobreBem.dataSet.FieldByName('IDENTIFICACAOCEDENTE').asString);

  {Início da configuração dos dados do Cedente para envio de boletos por email}
  if Trim(vCobreBem.dataSet.FieldByName('EMAIL_ENDERECOCEDENTE').asString) <> '' then
  begin
    senha := vDadosIni.decodifica(vCobreBem.dataSet.FieldByName('EMAIL_SMTP_SENHA').asString);
    CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Servidor :=
      vCobreBem.dataSet.FieldByName('EMAIL_SMTP_SERVIDOR').AsString;
    CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Porta :=
      vCobreBem.dataSet.FieldByName('EMAIL_SMTP_PORTA').asString;
    CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Usuario :=
      vCobreBem.dataSet.FieldByName('EMAIL_SMTP_USUARIO').asString;
    CobreBemX.PadroesBoleto.PadroesBoletoEmail.SMTP.Senha :=
      vDadosIni.decodifica(vCobreBem.dataSet.FieldByName('EMAIL_SMTP_SENHA').asString);
    CobreBemX.PadroesBoleto.PadroesBoletoEmail.URLImagensCodigoBarras :=
      vCobreBem.dataSet.FieldByName('EMAIL_URLIMAGENSBOLETO').asString;
    CobreBemX.PadroesBoleto.PadroesBoletoEmail.URLLogotipo :=
      vCobreBem.dataSet.FieldByName('EMAIL_URLIMAGENSLOGOTIPO').asString;
    CobreBemX.PadroesBoleto.PadroesBoletoEmail.PadroesEmail.Assunto :=
      vCobreBem.dataSet.FieldByName('EMAIL_ASSUNTO').asString;
    CobreBemX.PadroesBoleto.PadroesBoletoEmail.PadroesEmail.EmailFrom.Endereco :=
      vCobreBem.dataSet.FieldByName('EMAIL_ENDERECOCEDENTE').asString;
    CobreBemX.PadroesBoleto.PadroesBoletoEmail.PadroesEmail.EmailFrom.Nome :=
      vCobreBem.dataSet.FieldByName('IDENTIFICACAOCEDENTE').asString;
  end;
  CobreBemX.PadroesBoleto.PadroesBoletoEmail.PadroesEmail.FormaEnvio := feeSMTPBoletoHTML;
  CobreBemX.DocumentosCobranca.Clear;

  Result := true;

end;

function TBoleto._PegarProxNossoNumero(Cod_Cobrebem: string): string;
begin
  while true do
  begin
    try
      procedureCodigo.Close;
      procedureCodigo.ParamByName('VCOD_EMPRESA').Text := vDadosIni.codEmpresa;
      procedureCodigo.ParamByName('VCOD_COBREBEM').Text := Cod_Cobrebem;
      procedureCodigo.ExecProc;
      Result := procedureCodigo.ParamByName('NOSSONUMERO').Value;
      procedureCodigo.Close;
      exit;
    except
      on E: Exception do
      begin
        if Application.MessageBox(pchar(
          'Erro ao buscar nosso numero do boleto. Configuração ' + Cod_Cobrebem + #13 +
          'Deseja abortar operação?'), 'Confirmação', MB_YESNO + MB_ICONQUESTION) = ID_YES then
        begin
          vAbortar := true;
          RollBackTransacao;
          Break;
        end;
        registraErro('E0005 ' + e.Message + ' ' + Tabela);
      end;
    end;
  end;
end;

procedure TBoleto._PreencheCampos;
begin
  dataSet.FieldByName('DATA_EM_BOL').Value := vDadosIni.getDataBanco(buscas);
  dataSet.FieldByName('DATA_VEN_BOL').value := vDadosIni.getDataBanco(buscas) + 30;
  dataSet.FieldByName('TRANSMISSAO_AUTOMATICA').AsString := 'N';
  //  dataSet.FieldByName('M_DIA_BOL').Value := vCobreBem.dataSet.FieldByName('TX_JUROS').Value / 30;//vDadosIni.vEmp.vTxJuros / 30;
//  dataSet.FieldByName('MULT_ATR_BOL').Value := vCobreBem.dataSet.FieldByName('MULTAS').Value;//vDadosIni.vEmp.vMultas;
//  dataSet.FieldByName('LOCALPAG').Value := vCobreBem.dataSet.FieldByName('LOCAL_PAG').Value;//vDadosIni.vEmp.vLocalPagBol;
//  dataSet.FieldByName('OBS_BOL').Value := vCobreBem.dataSet.FieldByName('OBS_BOL').Value//vDadosIni.vEmp.vObsBol;
end;

function TControleCredito._PreencherVinculoCreditoBoleto(CodCliente: integer; NossoNumero: string):
  boolean;
begin
  result := ExecutaComandosSql('select first 1 COD_CRED from controle_creditos ' +
    ' where COD_CLIENTE  = ' + inttostr(CodCliente) +
    ' and (prcss is null or prcss <> ''S'') and (' +
    ' ltrim(Status_C) <>  ''QUITADO'' and rtrim(Status_C) <>  ''QUITADO''  ' +
    ' or Status_C is null ) and cod_emp_mult = ' + vDadosIni.codEmpresa + ' order by data_venda desc');

  if not (result) then
    raise Exception.Create('Este cliente não contém créditos em aberto.');

  result := ExecutaComandosSql('select first 1 COD_CRED from controle_creditos ' +
    ' where nosso_numero_banco  = ' + QuotedStr(trim(NossoNumero)) +
    ' and (prcss is null or prcss <> ''S'') and (' +
    ' ltrim(Status_C) <>  ''QUITADO'' and rtrim(Status_C) <>  ''QUITADO''  ' +
    ' or Status_C is null ) and cod_emp_mult = ' + vDadosIni.codEmpresa + ' order by data_venda desc');

  if (result) then
    raise Exception.Create('O Nosso Número deste boleto está em outro crédito em aberto.')
  else
    Result := true;

  result := montaSelect('select cc.*, empresa.identificacao_emp from controle_creditos cc ' +
    ' left join empresa on empresa.cod_empresa = cc.cod_emp_mult ' +
    ' where cc.cod_cliente  = ' + inttostr(CodCliente) +
    ' and (cc.prcss is null or cc.prcss <> ''S'') ' +
    ' and (ltrim(cc.status_C) <>  ''QUITADO'' and rtrim(cc.status_C) <>  ''QUITADO'' or cc.status_C is null ) ' +
    ' and cc.cod_emp_mult = ' + vDadosIni.codEmpresa + ' order by cc.data_venda desc');

  if not (result) then
    raise Exception.Create('Pode ter outro usuário impedindo o acesso, ' +
      'se o problema persistir contacte o administrador da rede.');
end;

function TControleCredito._VincularCreditoBoleto(NossoNumero: string; CodCobrebem: Integer): boolean;
begin
  result := Edit;
  if not (result) then
    raise Exception.Create('Erro na tentativa de editar o crédito.');
  dataSet.FieldByName('nosso_numero_banco').AsString := trim(NossoNumero);
  dataSet.FieldByName('cod_cobrebem').AsInteger := CodCobrebem;
  Result := Post;
  if not (result) then
    raise Exception.Create('Erro na tentativa de inserir o crédito.');
  Result := inherited Apply;
  if not (result) then
    raise Exception.Create('Erro na tentativa de atualizar o crédito.');
  Result := CommitaTransacao;
  if not (result) then
    raise Exception.Create('Erro na tentativa de finalizar a atualização do crédito.');
end;

function TBoleto._RetirarInativo: boolean;
var
  BoletoSelecionado: integer;
  BoletosNaoInativo: Integer;
begin
  BoletosNaoInativo := 0;
  BoletoSelecionado := 0;
  vAbortar := false;
  dataSet.First;
  while not dataSet.Eof do
  begin
    Application.ProcessMessages;
    if (vAbortar) then
    begin

      Application.MessageBox(pchar('Operação paralizada.' + #13 +
        ''), 'Atenção', 0 + 64);
      Result := false;
      exit;
    end;

    if dataSet.FieldByName('SelecionaBoleto').Value = 'S' then
    begin
      BoletoSelecionado := 1;
      if ((not (trim(dataSet.FieldByName('STATUS').asstring) = 'INATIVO')) and
        (not (trim(dataSet.FieldByName('STATUS').asstring) = 'CANCELADO'))) then
        BoletosNaoInativo := 1;
    end;

    dataSet.Next;
  end;

  //-------------------

  if BoletoSelecionado = 0 then
  begin
    Result := false;
    Application.MessageBox('Selecione um Boleto.', 'Informação',
      MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
    exit;
  end;

  if BoletosNaoInativo = 1 then
  begin
    Result := false;
    Application.MessageBox('Existem boletos selecionados que não estão inativos.', 'Informação',
      MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
    exit;
  end;

  //--------------------

  dataSet.First;
  while not dataSet.Eof do
  begin
    Application.ProcessMessages;
    if (vAbortar) then
    begin

      Application.MessageBox(pchar('Operação paralizada.' + #13 +
        ''), 'Atenção', 0 + 64);
      Result := false;
      exit;
    end;

    if dataSet.FieldByName('SelecionaBoleto').Value = 'S' then
    begin
      try
        Edit;
        dataSet.FieldByName('STATUS').ASSTRING := '';
        inherited Post;
      except
        Result := false;
        exit;
      end;
    end;
    dataSet.Next;
  end;

  Result := true;
end;

procedure TBoleto._RetirarSelecoesBoleto;
begin
  dataSet.First;
  while not dataSet.Eof do
  begin
    inherited Edit;
    dataSet.fieldbyname('SelecionaBoleto').Value := Null;
    inherited Post;
    dataSet.Next;
  end;
  inherited Apply;
  inherited CommitaTransacao;
end;

procedure TBoleto._SelecionaBoleto;
begin
  inherited Edit;
  if dataSet.fieldbyname('\').Value = 'S' then
    dataSet.fieldbyname('SelecionaBoleto').Value := Null
  else
    dataSet.fieldbyname('SelecionaBoleto').Value := 'S';
  inherited Post;
end;

function TBoleto._SelecionaCobrebem(
  pImprimir: Boolean;
  pEnviar: Boolean;
  pOrigem: TOrigemEnv;
  pListBoletas: TStringList;
  pExibirPergunta: Boolean): Integer;
var
	vListaControles: TStringList;
  Boleto: TBoleto;
  I: Integer;
  vOOK: boolean;
  vMens, vMens2: string;
  vTemp: string;
begin
	Result := 0;
  vTemp := '';
  try
  	vListaControles := TStringList.Create;
    vListaControles.Sorted := True;
    vListaControles.Duplicates := dupIgnore;
    vListaControles.Clear;

    vMens := 'Deseja ' + vDadosIni.IfThen(pImprimir, 'Imprimir', '') +
                         vDadosIni.IfThen(pImprimir and pEnviar, '/', '') +
                         vDadosIni.IfThen(pEnviar, 'Enviar', '') + ' ' +
                         OrigemEnvStr[pOrigem] + '?';

    vMens2 := vDadosIni.IfThen(pImprimir, 'Imprimindo', '') +
              vDadosIni.IfThen(pImprimir and pEnviar, '/', '') +
              vDadosIni.IfThen(pEnviar, 'Enviando', '') + ' ' +
              OrigemEnvStr[pOrigem];

//    vDadosIni.abreStatusProcessamento('', vMens2);

    if not pExibirPergunta then
    	vOOK := True
    else
    	vOOK := Application.MessageBox(pchar(vMens), 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes;


    if Boleto = nil then
    begin
      Boleto := TBoleto.create;
      Boleto.criaBoletoCobreBemX;
    end;

    if vOOK then
    begin
      for I := 0 to pListBoletas.Count - 1 do
        vTemp := vTemp + pListBoletas[I] +', ';
      vTemp := '(' + Copy(vTemp, 1, Length(vTemp) - 2) + ')';

      Boleto.montaSelect('select ' + Fsql_campos + ' FROM BOLETAS ' +
        Fsql_inner +
        ' WHERE BOLETAS.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and CLIENTES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
        ' and BOLETAS.ATIVO = 1 ' +
        ' and BOLETAS.N_SEQ_BOL IN ' + vTemp);
      if Boleto.dataSet.FieldByName('COD_CONTROLE_CX').AsInteger > 0 then
        Boleto.vCobreBem.abreCobreBemImpressao(Boleto.dataSet.FieldByName('COD_CONTROLE_CX').AsInteger);

      if Boleto.dataSet.IsEmpty then
        exit;

      if (Boleto.vCobreBem.dataSet.IsEmpty) then
      begin
        Application.MessageBox('A empresa não possui configurações de convênio para impressão.',
          'Mensagem', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        Result := 0;
        exit;
      end;

      try
        Boleto.dataSet.DisableControls;
        Boleto.dataSet.First;
        while not Boleto.dataSet.Eof do
        begin
          vListaControles.Add(IntToStr(Boleto.dataSet.FieldByName('cod_controle_cx').AsInteger));
          Boleto.dataSet.Next;
        end;
      finally
        Boleto.dataSet.First;
        Boleto.dataSet.EnableControls;
      end;

      if vListaControles.Count = 0 then
        vListaControles.Add('0')
      else if vListaControles.Count > 1 then
        Application.MessageBox('Foram gerados boletos em controles diferentes. O sistema vai abrir a impressão para cada controle diferente encontrado', 'Antenção', 0 + 64);

      for I := 0 to vListaControles.Count - 1 do
      begin
        try
          if vListaControles[i] = '0'  then
            Boleto.dataSet.Filter := 'cod_controle_cx = 0 or cod_controle_cx is null'
          else
            Boleto.dataSet.Filter := 'cod_controle_cx = ' + vListaControles[i];
          Boleto.dataSet.Filtered := True;

    //              if Tipo_Emissao <> 'CRB' then
          begin
            Boleto.vCobreBem.abreCobreBemImpressao( StrToIntDef(vListaControles[i], 0));
            if (Boleto.vCobreBem.dataSet.IsEmpty) then
            begin
             Application.MessageBox(PChar('Sem configuração de boletos para o controle: ' + vListaControles[i] + #13 +
               'A impressão não pode continuar'),
               'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
             Result := 0;
             exit;
            end;
          end;

          Application.CreateForm(TfrmSelecionaCobrebem, frmSelecionaCobrebem);
          frmSelecionaCobrebem.GroupBoxAcoes.Visible := False;
          frmSelecionaCobrebem.ckImprimirBoleto.Checked := False;
          frmSelecionaCobrebem.ckEnviarBoleto.Checked := False;

          try
          	frmSelecionaCobrebem.DBLookupComboBox_Cobrebem.KeyValue := 0;
            if Boleto.dataSet.FieldByName('COD_COBREBEM').AsInteger > 0 then
              frmSelecionaCobrebem.DBLookupComboBox_Cobrebem.KeyValue := Boleto.dataSet.FieldByName('COD_COBREBEM').AsInteger
            else if Boleto.vCobreBem.dataSet.RecordCount = 1 then
              frmSelecionaCobrebem.DBLookupComboBox_Cobrebem.KeyValue := Boleto.vCobreBem.dataSet.FieldByName('COD_COBREBEM').AsInteger;

            if frmSelecionaCobrebem.ShowModal = IDOK then
            begin
              try
                Boleto.dataSet.DisableControls;
                Boleto.dataSet.First;
                while not (Boleto.dataSet.Eof) do
                begin
                  Boleto.dataSet.Edit;
                  Boleto.dataSet.FieldByName('SelecionaBoleto').Value := 'S';
                  Boleto.dataSet.Post;
                  Boleto.dataSet.Next;
                end;
              finally
                Boleto.dataSet.First;
                Boleto.dataSet.EnableControls;
              end;

              if not Boleto._validadados then
              begin
                Result := 0;
                exit;
              end;

              Result := frmSelecionaCobrebem.DBLookupComboBox_Cobrebem.KeyValue;
            end
            else
              Result := 0;
          finally
            frmSelecionaCobrebem.Free;
            frmSelecionaCobrebem := nil;
          end;
        finally
          Boleto.dataSet.Filter := '';
          Boleto.dataSet.Filtered := False;
        end;
      end;
    end;

    if (Boleto <> nil) then
      Boleto.Cancel;
    Boleto.free;
    Boleto := nil;
  except on E: Exception do
    begin
      Result := 0;
      if (Boleto <> nil) then
        Boleto.Cancel;
      Boleto.free;
      Boleto := nil;
      Application.MessageBox('Erro ao selecionar cobrebem, verifique as configurações. Se o erro persistir contacte o administrador da rede.', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
      registraErro('function TBoleto._SelecionaCobrebem. Erro: ' + e.Message);
      exit;
    end;
  end;
end;

procedure TBoleto._SelecionaTodosBoletos;
begin
	try
  	vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

	  if not dataSet.Active then
      Exit;

  	dataSet.DisableControls;
    dataSet.First;
    {w - 1}while not dataSet.Eof do
    begin
      inherited Edit;
      dataSet.fieldbyname('SelecionaBoleto').Value := 'S';
      inherited Post;

      dataSet.Next;
    end;
    dataSet.First;
    
  finally
    dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TClienteBol }

constructor TClienteBol.create;
begin
  dataSet := TClientDataSet(DtmBoletos.cdsClientes);
  buscas := TIBQuery(DtmBoletos.qrBuscas);
  transacao := TIBTransaction(DtmBoletos.IBTransBoletos);
end;

function TClienteBol.selecionaCliente(codigo: string): Boolean;
begin
  Result := montaSelect('select' +
    ' c.cod_cliente,' +
    ' c.nome_cliente,' +
    ' c.razao,' +
    ' c.cpfcgc,' +
    ' c.ENDERECO,' +
    ' c.END_COBRANCA,' +
    ' c.BAIRRO_COBRANCA,' +
    ' c.CIDA_COBRANCA,' +
    ' c.EST_CODIGO_UF,' +
    ' c.CEP_COBRANCA,' +
    ' c.bairro,' +
    ' c.cidade,' +
    ' c.cep,' +
    ' c.NUM_END_CLIENTE,' +
    ' c.COMPLEMENTO,' +
    ' c.INSC_EST,' +
    ' c.email,' +
    ' c.diasprotesto,' +
    ' es.sigla_uf,' +
    ' c.COD_BAIRRO_COBRANCA,' +
    ' c.COD_CIDADE_COBRANCA' +
    ' from clientes c' +
    ' inner join estados es on c.codigo_uf = es.codigo_uf' +
    ' where c.cod_cliente = ' + codigo +
    ' and c.cod_empresa = ' + vDadosIni.codEmpresa);
  Result := not dataSet.IsEmpty;
end;

{ TConfigBol }

function TConfigBol.abreConfigBol: boolean;
begin
  result := montaSelect('Select * from Config_Bol where Ativo = 1 ');
end;

constructor TConfigBol.create;
begin
  dataSet := TClientDataSet(DtmBoletos.cdsConfigBol);
  buscas := TIBQuery(DtmBoletos.qrBuscas);
  transacao := TIBTransaction(DtmBoletos.IBTransBoletos);
end;

{ TCamposBol }

function TCamposBol.abreCamposBol: boolean;
begin
  result := montaSelect('Select * from CamposBol ');
end;

constructor TCamposBol.create;
begin
  dataSet := TClientDataSet(DtmBoletos.cdsCamposBol);
  buscas := TIBQuery(DtmBoletos.qrBuscas);
  transacao := TIBTransaction(DtmBoletos.IBTransBoletos);
end;

{ TBancos }

function TBanco.abreBanco: boolean;
begin
  result := montaSelect(' Select * from CODIGO_BANCO where Ativo = 1');
end;

constructor TBanco.create;
begin
  dataSet := TClientDataSet(DtmBoletos.cdsBancos);
  buscas := TIBQuery(DtmBoletos.qrBuscas);
  transacao := TIBTransaction(DtmBoletos.IBTransBoletos);

end;

{ TCobrebem }

function TCobrebem.abreCobreBem(CodigoControle: integer): Boolean;
var
  controle: string;
  vUserIdConf, vUserId, vAmbiente: string;
begin
	SqlOpen(' select coalesce(user_id, 0) user_id from config_api where api = ''BOLETO_API'' and cod_empresa = ' + vDadosIni.codEmpresa, buscas);
	vUserIdConf := buscas.FieldByName('USER_ID').AsString;

  SqlOpen(' select hash(rdb$get_context(''SYSTEM'', ''DB_NAME'')) from rdb$database ', buscas);
  vUserId := buscas.FieldByName('HASH').AsString;

  if (vUserIdConf = vUserId) then
  	vAmbiente := 'Produção'
  else
  	vAmbiente := 'Homologação';

  controle := '';
  if (CodigoControle <> 0) then
    controle := ' AND COB.CODIGO_CTRL = ' + inttostr(CodigoControle);

  Result := montaSelect(' SELECT COB.*, EMP.IDENTIFICACAO_EMP FROM COBREBEM COB ' +
   ' LEFT JOIN EMPRESA EMP ON EMP.COD_EMPRESA = COB.COD_EMP_MULT ' +
   ' WHERE COB.COD_EMPRESA = ' + vDadosIni.codEmpresa +
   ' AND COB.ATIVO = 1 ' +
   ' AND COB.COD_EMPRESA = ' + vDadosIni.codEmpresa + controle +
   ' AND COB.TIPO_API IS NULL ' +
   ' UNION ' +
   ' SELECT COB.*, EMP.IDENTIFICACAO_EMP FROM COBREBEM COB ' +
   ' LEFT JOIN EMPRESA EMP ON EMP.COD_EMPRESA = COB.COD_EMP_MULT ' +
   ' WHERE COB.COD_EMPRESA = ' + vDadosIni.codEmpresa +
   ' AND COB.ATIVO = 1 ' +
   ' AND COB.COD_EMPRESA = ' + vDadosIni.codEmpresa + controle +
   ' AND COB.TIPO_API IS NOT NULL ' +
   ' AND COB.AMBIENTE = ' + QuotedStr(vAmbiente));
  Result := not dataSet.IsEmpty;
end;

function TCobrebem.abreCobreBemImpressao(CodigoControle: integer): Boolean;
var
  controle: string;
  vUserIdConf, vUserId, vAmbiente: string;
begin
	SqlOpen(' select coalesce(user_id, 0) user_id from config_api where api = ''BOLETO_API'' and cod_empresa = ' + vDadosIni.codEmpresa, buscas);
	vUserIdConf := buscas.FieldByName('USER_ID').AsString;

  SqlOpen(' select hash(rdb$get_context(''SYSTEM'', ''DB_NAME'')) from rdb$database ', buscas);
  vUserId := buscas.FieldByName('HASH').AsString;

  if (vUserIdConf = vUserId) then
  	vAmbiente := 'Produção'
  else
  	vAmbiente := 'Homologação';
    
  controle := '';
  if (CodigoControle <> 0) then
    controle := ' AND COB.CODIGO_CTRL = ' + inttostr(CodigoControle);

  Result := montaSelect(' SELECT COB.*, EMP.IDENTIFICACAO_EMP FROM COBREBEM COB ' +
   ' LEFT JOIN EMPRESA EMP ON EMP.COD_EMPRESA = COB.COD_EMP_MULT ' +
   ' WHERE COB.COD_EMPRESA = ' + vDadosIni.codEmpresa +
   ' AND COB.ATIVO = 1 ' +
   ' AND COB.COD_EMPRESA = ' + vDadosIni.codEmpresa +
   ' AND COB.COD_EMP_MULT = ' + vDadosIni.codEmpresa + controle +
   ' AND COB.TIPO_API IS NULL ' +
   ' UNION ' +
   ' SELECT COB.*, EMP.IDENTIFICACAO_EMP FROM COBREBEM COB ' +
   ' LEFT JOIN EMPRESA EMP ON EMP.COD_EMPRESA = COB.COD_EMP_MULT ' +
   ' WHERE COB.COD_EMPRESA = ' + vDadosIni.codEmpresa +
   ' AND COB.ATIVO = 1 ' +
   ' AND COB.COD_EMPRESA = ' + vDadosIni.codEmpresa +
   ' AND COB.COD_EMP_MULT = ' + vDadosIni.codEmpresa + controle +
   ' AND COB.TIPO_API IS NOT NULL ' +
   ' AND COB.AMBIENTE = ' + QuotedStr(vAmbiente));
  Result := not dataSet.IsEmpty;
end;


function TCobrebem.abreCobreBem(codigo: string): Boolean;
var
	vUserIdConf, vUserId, vAmbiente: string;
begin
  Result := false;

  SqlOpen(' select coalesce(user_id, 0) user_id from config_api where api = ''BOLETO_API'' and cod_empresa = ' + vDadosIni.codEmpresa, buscas);
	vUserIdConf := buscas.FieldByName('USER_ID').AsString;

  SqlOpen(' select hash(rdb$get_context(''SYSTEM'', ''DB_NAME'')) from rdb$database ', buscas);
  vUserId := buscas.FieldByName('HASH').AsString;

  if (vUserIdConf = vUserId) then
  	vAmbiente := 'Produção'
  else
  	vAmbiente := 'Homologação';

  if trim(codigo) = '' then
  	codigo := '0';

  try
    StrToInt(trim(codigo));
  except
    Exit;
  end;
  Result := montaSelect(' SELECT COB.*, EMP.IDENTIFICACAO_EMP FROM COBREBEM COB ' +
    ' LEFT JOIN EMPRESA EMP ON EMP.COD_EMPRESA = COB.COD_EMP_MULT ' +
    ' WHERE COB.COD_COBREBEM = ' + Trim(codigo) +
    ' AND COB.ATIVO = 1 ' +
    ' AND COB.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND COB.TIPO_API IS NULL ' +
    ' UNION ' +
    ' SELECT COB.*, EMP.IDENTIFICACAO_EMP FROM COBREBEM COB ' +
    ' LEFT JOIN EMPRESA EMP ON EMP.COD_EMPRESA = COB.COD_EMP_MULT ' +
    ' WHERE COB.COD_COBREBEM = ' + Trim(codigo) +
    ' AND COB.ATIVO = 1 ' +
    ' AND COB.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND COB.TIPO_API IS NOT NULL ' +
    ' AND COB.AMBIENTE = ' + QuotedStr(vAmbiente));
  Result := not dataSet.IsEmpty;
end;


function TCobrebem.abreCobreBemImpressao(codigo: string): Boolean;
var
	vUserIdConf, vUserId, vAmbiente: string;
begin
  Result := false;

  SqlOpen(' select coalesce(user_id, 0) user_id from config_api where api = ''BOLETO_API'' and cod_empresa = ' + vDadosIni.codEmpresa, buscas);
	vUserIdConf := buscas.FieldByName('USER_ID').AsString;

  SqlOpen(' select hash(rdb$get_context(''SYSTEM'', ''DB_NAME'')) from rdb$database ', buscas);
  vUserId := buscas.FieldByName('HASH').AsString;

  if (vUserIdConf = vUserId) then
  	vAmbiente := 'Produção'
  else
  	vAmbiente := 'Homologação';
    
  try
    StrToInt(trim(codigo));
  except
    Exit;
  end;
  Result := montaSelect(' SELECT COB.*, EMP.IDENTIFICACAO_EMP FROM COBREBEM COB ' +
    ' LEFT JOIN EMPRESA EMP ON EMP.COD_EMPRESA = COB.COD_EMP_MULT ' +
    ' WHERE COB.COD_COBREBEM = ' + Trim(codigo) +
    ' AND COB.ATIVO = 1 ' +
    ' AND COB.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND COB.COD_EMP_MULT = ' + vDadosIni.codEmpresa +
    ' AND COB.TIPO_API IS NULL ' +
    ' UNION ' +
    ' SELECT COB.*, EMP.IDENTIFICACAO_EMP FROM COBREBEM COB ' +
    ' LEFT JOIN EMPRESA EMP ON EMP.COD_EMPRESA = COB.COD_EMP_MULT ' +
    ' WHERE COB.COD_COBREBEM = ' + Trim(codigo) +
    ' AND COB.ATIVO = 1 ' +
    ' AND COB.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND COB.COD_EMP_MULT = ' + vDadosIni.codEmpresa +
    ' AND COB.TIPO_API IS NOT NULL ' +
    ' AND COB.AMBIENTE = ' + QuotedStr(vAmbiente));
  Result := not dataSet.IsEmpty;
end;

function TCobrebem.abreFormOpcoes: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    vDadosIni.atualizarVariaveisEmpresa(buscas);
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 505;
    formulario.Height := 168;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Selecione o tipo de configuração';
    frmCadCobreBem.pnTipoConfiguracoes.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.BorderIcons := [];
    result := (formulario.ShowModal = mrOk);
  finally
  	if Result then
    begin
      if frmCadCobreBem.RadioGroupOpcoes.ItemIndex = 0 then
      begin
      	dataSet.FieldByName('TIPO_API').Value := Null;

        frmCadCobreBem.PageControl1.ActivePage := frmCadCobreBem.TabSheet1;
        frmCadCobreBem.TabSheet1.Show;

        frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
        frmCadCobreBem.TabSheet3.Show;
      end
      else
      begin
      	dataSet.FieldByName('TIPO_API').AsString := 'S';

      	frmCadCobreBem.PageControl1.ActivePage := frmCadCobreBem.TabSheet4;
        frmCadCobreBem.TabSheet4.Show;

        frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
        frmCadCobreBem.TabSheet5.Show;
      end;
    end;
    frmCadCobreBem.pnTipoConfiguracoes.Parent := frmCadCobreBem.TabConfiguracoes;
    formulario.Free;
    formulario := nil;
  end;
end;

function TCobrebem.abrelixeira: boolean;
begin

  if not StatusLixeira then
  begin
    Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION +
      MB_DEFBUTTON1);
    result := false;
  end
  else
    result := montaSelect(' SELECT COB.*, EMP.IDENTIFICACAO_EMP FROM COBREBEM COB ' +
     ' LEFT JOIN EMPRESA EMP ON EMP.COD_EMPRESA = COB.COD_EMP_MULT ' +
     ' WHERE COB.ATIVO = 0 AND COB.COD_EMPRESA = ' + vDadosIni.codEmpresa);

end;

procedure TCobrebem.atualizarDadosContaCorrente;
var
	vNumConta: string;
  vMascara: string;
  vTamanho: Integer;
begin
//	if trim(dataset.FieldByName('BANCO').AsString) <> '' then
//  begin
//    SqlOpen(' select * from bancos_homologados ' +
//      ' where codbanco = ' + QuotedStr(vDadosIni.StrZero(dataset.FieldByName('BANCO').AsString, 3)), buscas);
//                                            
//    if not buscas.IsEmpty then
//      if trim(buscas.FieldByName('MASCARA_NUMEROCONVENIO').AsString) <> '' then
//      begin
//        vNumConta := StringReplace(trim(dataSet.FieldByName('NUMEROCONTACORRENTE').AsString), '-', '', [rfReplaceAll]);
//        vMascara  := StringReplace(buscas.FieldByName('MASCARA_NUMEROCONVENIO').AsString, ';1;_', '', [rfReplaceAll]);
//        vMascara  := StringReplace(vMascara, '-', '', [rfReplaceAll]);
//        vTamanho  := Length(vMascara);
//
//        if vNumConta <> '' then
//          if (dataSet.FieldByName('CODIGOCONVENIO').AsString) = '' then
//          begin
//            dataSet.FieldByName('CODIGOCONVENIO').AsString :=
//              vDadosIni.StrZero(copy(vDadosIni.RetirarZerosEsquerda(vNumConta), 1, vTamanho), vTamanho);
////              vDadosIni.StrZero(Copy(vDadosIni.StrZero(StrToInt64(vNumConta), vTamanho), 1, vTamanho), vTamanho);
//          end
//          else if vNumContaCorrente <> dataSet.FieldByName('NUMEROCONTACORRENTE').AsString then
//          begin
//            if Application.MessageBox(PChar('Número da conta corrente foi alterado, deseja alterar o número do convênio'),
//              'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
//            begin
//              dataSet.FieldByName('CODIGOCONVENIO').AsString :=
//              	vDadosIni.StrZero(copy(vDadosIni.RetirarZerosEsquerda(vNumConta), 1, vTamanho), vTamanho);
////                vDadosIni.StrZero(Copy(vDadosIni.StrZero(StrToInt64(vNumConta), vTamanho), 1, vTamanho), vTamanho);
//            end;
//          end;
//      end;
//  end;

  if dataSet.FieldByName('DIASPROTESTO').AsInteger > 0 then
    if (vDiasProtesto <> dataSet.FieldByName('DIASPROTESTO').AsInteger) then
  	begin
      if (dataSet.State in [dsInsert, dsEdit]) then
        dataSet.FieldByName('OBS_BOL').AsString :=
        	StringReplace(dataSet.FieldByName('OBS_BOL').AsString,
          	IntToStr(vDiasProtesto),
          	IntToStr(dataSet.FieldByName('DIASPROTESTO').AsInteger), [rfReplaceAll]);
  	  vDiasProtesto := dataSet.FieldByName('DIASPROTESTO').AsInteger;
 	  end;
end;

procedure TCobrebem.cadCobreBem(TipoForm: Integer);
begin
	vDadosIni.abreStatusProcessamento('', 'Abrindo Cadastro do Convênio...');
  
  vDadosIni.vTipoForm := TipoForm;
  if DtmBoletos = nil then
    DtmBoletos := TDtmBoletos.Create(DtmBoletos);

  if frmCadCobreBem = nil then
  begin
    if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';
    Application.CreateForm(TfrmCadCobreBem, frmCadCobreBem);
  end;
  
  if (TipoForm > 0) and (not frmCadCobreBem.Visible) then
    frmCadCobreBem.ShowModal
  else if (not frmCadCobreBem.Visible) then
    frmCadCobreBem.Show
  else if frmCadCobreBem.FormStyle = fsMDIChild then
    frmCadCobreBem.Show
  else
    frmCadCobreBem.ShowModal;
end;

function TCobrebem.cancel: boolean;
begin
  if (dataSet.State in [dsEdit, dsInsert]) then
  begin
    dataSet.Cancel;
    RollBackTransacao;
    result := true;
  end;
end;

constructor TCobrebem.create;
begin
  dataSet := TClientDataSet(DtmBoletos.cdsCobreBem);
  buscas := TIBQuery(DtmBoletos.qrBuscas);
  transacao := TIBTransaction(DtmBoletos.IBTransBoletos);

//  if vDadosIni.vEmp.vFinanceiroUnificado then
//  begin
//    dataSet.FieldByName('COD_EMP_MULT').Tag := 0;
//    dataSet.FieldByName('IDENTIFICACAO_EMP').Tag := 0;
//  end
//  else
//  begin
    dataSet.FieldByName('COD_EMP_MULT').Tag := 1;
    dataSet.FieldByName('IDENTIFICACAO_EMP').Tag := 1;
//  end;


  Controle := TControleBol.create;
  ContBol := TConteBol.create;
  vBancosHomologados := TBancosHomologados.create;
  vEmpresasUnificadas:= TEmpresasUnificadas.create;
end;

procedure TCobrebem.CriarCobrebemX;
begin
  CobreBemX := CreateOleObject('CobreBemX.ContaCorrente');
  CobreBemX.ArquivoLicenca := dataSet.FieldByName('ARQUIVOLICENCA').asString;

  {Atribuição de máscaras aos campos do vCobreBem}
  dataSet.FieldByName('CODIGOAGENCIA').EditMask := CobrebemX.MascaraCodigoAgencia;
  dataSet.FieldByName('NUMEROCONTACORRENTE').EditMask := CobrebemX.MascaraContaCorrente;
  dataSet.FieldByName('CODIGOCEDENTE').EditMask := CobrebemX.MascaraCodigoCedente;
  dataSet.FieldByName('INICIONOSSONUMERO').EditMask := CobrebemX.MascaraNossoNumero;
  dataSet.FieldByName('FIMNOSSONUMERO').EditMask := CobrebemX.MascaraNossoNumero;
  dataSet.FieldByName('OUTRODADOCONFIGURACAO1').EditMask := CobrebemX.MascaraOutroDadoConfiguracao1;
  dataSet.FieldByName('OUTRODADOCONFIGURACAO2').EditMask := CobrebemX.MascaraOutroDadoConfiguracao2;

end;

function TCobrebem.criarPastasTemporarias: boolean;
begin
	Result := false;

  //Criar pasta Hw Sistemas
	if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
  begin
    CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas');
  end;

  if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas') then
  begin
    Application.MessageBox(PChar('Erro ao _PassarConfiguracao.' + #13 + #13 +
    	'Não foi possível criar diretório ' + vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas'),
      'Confirmação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
    exit;
  end;

  //Criar pasta Licenca
  if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger)) then
  begin
    CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger));
  end;

  if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger)) then
  begin
    Application.MessageBox(PChar('Erro ao _PassarConfiguracao.' + #13 + #13 +
    	'Não foi possível criar diretório ' + vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger)),
      'Confirmação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
    exit;
  end;

  //Criar pasta cob
  if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
    'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger)) then
  begin
    CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
      'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger));
  end;

  if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger)) then
  begin
    Application.MessageBox(PChar('Erro ao _PassarConfiguracao.' + #13 + #13 +
    	'Não foi possível criar diretório ' + vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
      'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger)),
      'Confirmação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
    exit;
  end;

  //Criar pasta imagens
  if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
    'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
    'imagens') then
  begin
    CreateDir(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
      'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
      'imagens');
  end;

  if not DirectoryExists(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger)) then
  begin
    Application.MessageBox(PChar('Erro ao _PassarConfiguracao.' + #13 + #13 +
    	'Não foi possível criar diretório ' + vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
      'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
      'imagens'),
      'Confirmação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
    exit;
  end;

  // Licença
  if (trim(dataSet.FieldByName('ARQUIVOLICENCA').asString) <> '') then
  begin
    if FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
      'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
      ExtractFileName(dataSet.FieldByName('ARQUIVOLICENCA').asString))) then
    begin
      DeleteFile(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        ExtractFileName(dataSet.FieldByName('ARQUIVOLICENCA').asString)));
    end;

    if FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
      'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
      ExtractFileName(dataSet.FieldByName('ARQUIVOLICENCA').asString))) then
    begin
      Application.MessageBox(PChar('Erro ao _PassarConfiguracao.' + #13 + #13 + 'Não foi possível remover arquivo ' + vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        ExtractFileName(dataSet.FieldByName('ARQUIVOLICENCA').asString)),
        'Confirmação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
      exit;
    end;
  end;

  // Logotipo
  if (trim(dataSet.FieldByName('IMAGENSLOGOTIPO').asString) <> '') then
  begin
    if FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
      'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
      ExtractFileName(dataSet.FieldByName('IMAGENSLOGOTIPO').asString))) then
    begin
      DeleteFile(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        ExtractFileName(dataSet.FieldByName('IMAGENSLOGOTIPO').asString)));
    end;

    if FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
      'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
      ExtractFileName(dataSet.FieldByName('IMAGENSLOGOTIPO').asString))) then
    begin
      Application.MessageBox(PChar('Erro ao _PassarConfiguracao.' + #13 + #13 + 'Não foi possível remover arquivo ' + vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        ExtractFileName(dataSet.FieldByName('IMAGENSLOGOTIPO').asString)),
        'Confirmação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
      exit;
    end;
  end;

  // Logobanco
  if (trim(dataSet.FieldByName('LOGOBANCO').asString) <> '') then
  begin
    if (FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
      'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
      'imagens\' + dataSet.FieldByName('BANCO').asString + '.jpg'))) then
    begin
      DeleteFile(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
	      'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
  	    'imagens\' + dataSet.FieldByName('BANCO').asString + '.jpg'));
    end;

    if FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
      'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
      'imagens\' + dataSet.FieldByName('BANCO').asString + '.jpg')) then
    begin
      Application.MessageBox(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
     	  'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
     	  'imagens\' + dataSet.FieldByName('BANCO').asString + '.jpg'),
        'Confirmação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
      exit;
    end;
  end;

  // Codbarras a
  if (trim(dataSet.FieldByName('CODBARRAS_A').asString) <> '') then
  begin
    if FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
    	'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
      'imagens\a.gif')) then
    begin
      DeleteFile(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
	    	'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
  	    'imagens\a.gif'));
    end;

    if FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
	  	'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
  	  'imagens\a.gif')) then
    begin
      Application.MessageBox(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
		  	'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
  		  'imagens\a.gif'),
        'Confirmação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
      exit;
    end;
  end;

  // Codbarras b
  if (trim(dataSet.FieldByName('CODBARRAS_B').asString) <> '') then
  begin
    if FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
    	'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
      'imagens\b.gif')) then
    begin
      DeleteFile(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
	    	'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
  	    'imagens\b.gif'));
    end;

    if FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
	  	'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
  	  'imagens\b.gif')) then
    begin
      Application.MessageBox(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
		  	'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
  		  'imagens\b.gif'),
        'Confirmação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
      exit;
    end;
  end;

  // Codbarras c
  if (trim(dataSet.FieldByName('CODBARRAS_C').asString) <> '') then
  begin
    if FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
    	'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
      'imagens\c.gif')) then
    begin
      DeleteFile(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
	    	'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
  	    'imagens\c.gif'));
    end;

    if FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
	  	'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
  	  'imagens\c.gif')) then
    begin
      Application.MessageBox(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
		  	'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
  		  'imagens\c.gif'),
        'Confirmação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
      exit;
    end;
  end;

  // Codbarras d
  if (trim(dataSet.FieldByName('CODBARRAS_D').asString) <> '') then
  begin
    if FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
    	'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
      'imagens\d.gif')) then
    begin
      DeleteFile(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
	    	'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
  	    'imagens\d.gif'));
    end;

    if FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
	  	'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
  	  'imagens\d.gif')) then
    begin
      Application.MessageBox(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
		  	'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
  		  'imagens\d.gif'),
        'Confirmação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
      exit;
    end;
  end;

  Result := true;
end;

function TCobrebem.delete: boolean;
var
  codcob: string;
begin
  if dataSet.IsEmpty then
    exit;

  codcob := dataSet.FieldByName('COD_COBREBEM').AsString;

  if dataSet.FieldByName('Ativo').asInteger = 0 then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin
//      result := inherited Delete;

      buscas.Close;
      buscas.SQL.Text := 'delete from cobrebem ' +
       ' where cod_cobrebem = ' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) +
       ' and cod_empresa = ' + vDadosIni.codEmpresa;

      try
        buscas.ExecSQL;

        CommitaTransacao;
        vDadosIni.GravaAuditoria('COB004', 'EXCLUIR', 'SUCESSO', 'COBREBEM', codcob, buscas)
      except
        RollBackTransacao;
        vDadosIni.GravaAuditoria('COB004', 'EXCLUIR', 'FALHA', 'COBREBEM', codcob, buscas);
      end;
    end;
  end
  else
    if Application.MessageBox('Tem certeza que deseja mover este arquivo para a Lixeira ?',
      'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = idyes then
    begin
      if Edit then
      begin
        dataSet.FieldByName('Ativo').asString := '0';
        result := inherited Post;
        if Apply then
          if CommitaTransacao then
            if Result then
              vDadosIni.GravaAuditoria('COB003', 'ENVIAR REGISTRO PARA A LIXEIRA',
                'SUCESSO', 'COBREBEM', codcob, buscas)
            else
              vDadosIni.GravaAuditoria('COB003', 'ENVIAR REGISTRO PARA A LIXEIRA ',
                'FALHA', 'COBREBEM', codcob, buscas);
        Result := true
      end;
    end;
  Refresh;
end;

destructor TCobrebem.Destroy;
begin
	Controle.Free;
  Controle := nil;

  ContBol.Free;
  ContBol := nil;

  vBancosHomologados.Free;
  vBancosHomologados := nil;

  vEmpresasUnificadas.Free;
  vEmpresasUnificadas := nil;

  inherited;
end;

function TCobrebem.edit: boolean;
begin
  Result := False;

  if not dataSet.Active then
    exit;

  vModificarSenha := false;
  if inherited Edit then
  begin
  	if Length(trim(vDadosIni.vEmp.vCNPJ)) = 14 then
	  	dataSet.FieldByName('CPF_CNPJ_GENERICO').EditMask := HelperCNPJ.EditMask//'99.999.999/9999-99;0'
    else
    	dataSet.FieldByName('CPF_CNPJ_GENERICO').EditMask := '999.999.999-99;0';

    if dataSet.FieldByName('TIPO_API').IsNull then
      if trim(dataSet.FieldByName('TESTAR_HTML').AsString) = '' then
        dataSet.FieldByName('TESTAR_HTML').AsString := 'S';
        
    if trim(dataSet.FieldByName('GERAR_REGISTRO_MULTA').AsString) = '' then
	  	dataSet.FieldByName('GERAR_REGISTRO_MULTA').AsString := 'N';
  	if trim(dataSet.FieldByName('NOME_EMP_GENERICO').AsString) = '' then
	    dataSet.FieldByName('NOME_EMP_GENERICO').AsString := vDadosIni.vEmp.vnomeEmpresa;
    if trim(dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString) = '' then
	    dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString := vDadosIni.vEmp.vCNPJ;
  	if trim(dataset.FieldByName('LICENCA_GENERICA').AsString) = '' then
    	dataset.FieldByName('LICENCA_GENERICA').AsString := 'N';
    if dataset.FieldByName('TAM_NOME_CEDENTE_GENERICO').AsInteger <= 0 then
    	dataset.FieldByName('TAM_NOME_CEDENTE_GENERICO').AsInteger := 30;

    if dataSet.FieldByName('TIPO_API').AsString = 'S' then
    	if trim(dataset.FieldByName('TIPODOCUMENTOCOBRANCA').AsString) = '' then
		    dataset.FieldByName('TIPODOCUMENTOCOBRANCA').AsString := '01';

    if dataSet.FieldByName('TIPO_API').AsString = 'S' then
      if trim(dataSet.FieldByName('TITULOCODIGOJUROS').AsString) = '' then
        dataSet.FieldByName('TITULOCODIGOJUROS').AsString := '1';

    if dataSet.FieldByName('TIPO_API').AsString = 'S' then
      if trim(dataSet.FieldByName('TITULOCODIGOMULTA').AsString) = '' then
        dataSet.FieldByName('TITULOCODIGOMULTA').AsString := '2';

    if dataSet.FieldByName('TIPO_API').AsString = 'S' then
      if trim(dataSet.FieldByName('TITULOCODIGOPROTESTO').AsString) = '' then
        dataSet.FieldByName('TITULOCODIGOPROTESTO').AsString := '2';

    if trim(dataSet.FieldByName('TIPO_API').AsString) = '' then
	  	if trim(dataSet.FieldByName('AMBIENTE').AsString) = '' then
		  	dataSet.FieldByName('AMBIENTE').AsString := 'Produção';

  	if dataSet.FieldByName('BANCOGERANOSSONUMERO').IsNull then
	  	dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString := 'N';

    if dataSet.FieldByName('BANCOEMITEBOLETO').IsNull then
	  	dataSet.FieldByName('BANCOEMITEBOLETO').AsString := 'N';

    if dataSet.FieldByName('PERMITE_PROTESTO').IsNull then
	  	dataSet.FieldByName('PERMITE_PROTESTO').AsString := 'N';

    if dataSet.FieldByName('DIASPROTESTO').IsNull then
	  	dataSet.FieldByName('DIASPROTESTO').AsInteger := 0;

    if dataSet.FieldByName('PERMITE_DESCONTO').IsNull then
    	dataSet.FieldByName('PERMITE_DESCONTO').AsString := 'N';

    if dataSet.FieldByName('QTD_DIAS_LIM_DESC').IsNull then
    	dataSet.FieldByName('QTD_DIAS_LIM_DESC').AsInteger := 0;

    IncluirOutrosDados;
    setarMascaraTipoPlugBoleto;

    Controle.abreControle;
  	ContBol.abreControle;
  	vBancosHomologados.abreBancosHomologados;
    vEmpresasUnificadas._abreTodosEmpresas;

    vARQUIVOLICENCA := trim(dataSet.FieldByName('ARQUIVOLICENCA').AsString);
    vIMAGENSLOGOTIPO := trim(dataSet.FieldByName('IMAGENSLOGOTIPO').AsString);
    vIMAGENSBOLETO := trim(dataSet.FieldByName('IMAGENSBOLETO').AsString);

    vAgencia := dataSet.FieldByName('CODIGOAGENCIA').AsString;
    vNumContaCorrente := dataSet.FieldByName('NUMEROCONTACORRENTE').AsString;
    vNumeroConvenio := dataSet.FieldByName('CODIGOCONVENIO').AsString;
    vDiasProtesto := dataSet.FieldByName('DIASPROTESTO').AsInteger;
    
    result := True;
  end;

end;

function TCobrebem.existeConfigPlugBoleto: boolean;
begin
	SqlOpen(' select cf.api, cf.cod_empresa from config_api cf ' +
  	' where cf.api = ''BOLETO_API'' ' +
    ' and cf.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cf.ativo = 1 ');

  Result := not buscas.IsEmpty
end;

procedure TCobrebem.exportaLicencaCobrebem;
var
	txt: textfile;
  saveDialog: TSaveDialog;
begin
	if not criarPastasTemporarias then
  	exit;

  if not vDadosIni.PesqPros('COB010', 'EXPORTAR', '',
  	'COBREBEM', dataSet.FieldByName('COD_COBREBEM').asString, buscas, true) then
	  	exit;

	//Salvar licença do cobrebem do computador
  if trim(dataSet.FieldByName('LICENCA').asString) <> '' then
  begin
  	if Application.MessageBox('Deseja exportar licença do convênio salvo no banco de dados?',
      'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
      	exit;
    try
      saveDialog := TSaveDialog.Create(nil);
      saveDialog.FileName := ExtractFileName(vARQUIVOLICENCA);
//      saveDialog.DefaultExt := ExtractFileExt(vARQUIVOLICENCA);
      saveDialog.Filter := ExtractFileExt(vARQUIVOLICENCA);

      if not saveDialog.Execute then
        exit;

      if (FileExists(PChar(saveDialog.FileName))) then
        DeleteFile(PChar(saveDialog.FileName));

      try
        AssignFile(txt,
        	saveDialog.FileName);
        Rewrite(txt,
        	saveDialog.FileName);
				Append(txt);
        Write(txt, trim(dataSet.FieldByName('LICENCA').asString));

        vDadosIni.GravaAuditoria('COB010', 'EXPORTAR', 'SUCESSO - ' + trim(ExtractFileName(vARQUIVOLICENCA)),
        	'COBREBEM', dataSet.FieldByName('COD_COBREBEM').asString, buscas);
      finally
        CloseFile(txt);
      end;
    finally
      if Assigned(saveDialog) then
      	saveDialog.Free;
    end;
  end;
end;

procedure TCobrebem.exportaLogotipoCobrebem;
var
	ImageLogo: TImage;
  JpgLogo: TJpegImage;
  StreamLogo: TStream;
  saveDialog: TSaveDialog;
begin
	if not vDadosIni.PesqPros('COB011', 'EXPORTAR', '',
  	'COBREBEM', dataSet.FieldByName('COD_COBREBEM').asString, buscas, true) then
	  	exit;

	//Salvar logo do cobrebem do computador
  if (trim(dataSet.FieldByName('LOGOTIPO').asString) <> '') then
  begin
  	if Application.MessageBox('Deseja exportar logotipo salva no banco de dados?',
      'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
      	exit;

    try
      saveDialog := TSaveDialog.Create(nil);
      saveDialog.FileName := ExtractFileName(vIMAGENSLOGOTIPO);
//      saveDialog.DefaultExt := ExtractFileExt(vIMAGENSLOGOTIPO);
      saveDialog.Filter := ExtractFileExt(vIMAGENSLOGOTIPO);

      if not saveDialog.Execute then
        exit;

      _strBase64toImage(
      	dataSet.FieldByName('LOGOTIPO').AsString,
        saveDialog.FileName);

      vDadosIni.GravaAuditoria('COB011', 'EXPORTAR', 'SUCESSO - ' + ExtractFileName(vIMAGENSLOGOTIPO),
      	'COBREBEM', dataSet.FieldByName('COD_COBREBEM').asString, buscas);

    finally
      if Assigned(saveDialog) then
      	saveDialog.Free;
    end;
  end;
end;

function TCobrebem.GetItem(convenioId: Integer): TItemConvenio;
begin
  if dataSet.Active then
    abreCobreBem(0);

  Result.Tipo := tcVazio;

  if dataSet.Locate('COD_COBREBEM', convenioId, []) then
  begin

    Result.ConvenioId := fint('cod_cobrebem');
    Result.Tipo := TTipoConvenio(IfThen(fequals('tipo_api', 'S'), Ord(tcAPI), Ord(tcArquivoLicenca)));

  end;
end;

procedure TCobrebem.IncluirOutrosDados;
var
  vSemConf: Boolean;
  vDataJurosMora: string;
  Aconf: TConfig_sistema_class;
begin
	try
    Aconf := TConfig_sistema_class.Create;
    Aconf.value1_b.Text := dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString;

    vSemConf := dataSet.FieldByName('OUTRAS_CONFIG_BOL').IsNull;

    if trim(dataSet.FieldByName('TIPO_API').AsString) = '' then
    begin
      vDataJurosMora := trim(Aconf.ReadString('ConfRemessaCNAB240', 'Segmento P - Usar Data do Juros de Mora (S ou N)', ''));

      if not Aconf.GetIniFile.ValueExists('ConfRemessaCNAB240', 'Ativar configuracoes (S ou N)') then
        Aconf.InsertLineConf('ConfRemessaCNAB240',
          vDadosIni.IfThen((vSemConf) and (dataSet.FieldByName('CORR_REMESSA').AsString = 'S'), '', '#') +
            'Ativar configuracoes (S ou N)', 'S');

      if not Aconf.GetIniFile.ValueExists('ConfRemessaCNAB240', 'Header Arquivo/Lote - CNPJ da Empresa (14 digitos)') then
        Aconf.InsertLineConf('ConfRemessaCNAB240',	'#Header Arquivo/Lote - CNPJ da Empresa (14 digitos)', trim(vDadosIni.vEmp.vCNPJ));

      if not Aconf.GetIniFile.ValueExists('ConfRemessaCNAB240', 'Header Arquivo - Usar Codigo do Convenio (S ou N)') then
        Aconf.InsertLineConf('ConfRemessaCNAB240',
         vDadosIni.IfThen((vSemConf) and (dataSet.FieldByName('CORR_REMESSA').AsString = 'S'), '', '#') +
          'Header Arquivo - Usar Codigo do Convenio (S ou N)', 'S');

      if not Aconf.GetIniFile.ValueExists('ConfRemessaCNAB240', 'Header Arquivo - Numero Versao do Layout Arquivo (3 digitos)') then
        Aconf.InsertLineConf('ConfRemessaCNAB240',
         vDadosIni.IfThen((vSemConf) and (dataSet.FieldByName('CORR_REMESSA').AsString = 'S'), '', '#') +
          'Header Arquivo - Numero Versao do Layout Arquivo (3 digitos)', '087');

      if not Aconf.GetIniFile.ValueExists('ConfRemessaCNAB240', 'Header Arquivo - Digito Verificador da AgConta (1 digito)') then
        Aconf.InsertLineConf('ConfRemessaCNAB240',	'#Header Arquivo - Digito Verificador da AgConta (1 digito)', '0');

      if not Aconf.GetIniFile.ValueExists('ConfRemessaCNAB240', 'Header Lote - Nº da Versao do Layout do Lote (3 digitos)') then
        Aconf.InsertLineConf('ConfRemessaCNAB240',
         vDadosIni.IfThen((vSemConf) and (dataSet.FieldByName('CORR_REMESSA').AsString = 'S'), '', '#') +
          'Header Lote - Nº da Versao do Layout do Lote (3 digitos)', '045');

      if not Aconf.GetIniFile.ValueExists('ConfRemessaCNAB240', 'Segmento P - Usar Codigo da Agencia da Conta (S ou N)') then
        Aconf.InsertLineConf('ConfRemessaCNAB240',	'#Segmento P - Usar Codigo da Agencia da Conta (S ou N)', 'S');

      if not Aconf.GetIniFile.ValueExists('ConfRemessaCNAB240', 'Segmento P - Codigo da Carteira (1 digito)') then
        Aconf.InsertLineConf('ConfRemessaCNAB240',	'#Segmento P - Codigo da Carteira (1 digito)', '1');

      if not Aconf.GetIniFile.ValueExists('ConfRemessaCNAB240', 'Segmento P - Forma de Cadastr. Titulo no Banco (1 digito)') then
        Aconf.InsertLineConf('ConfRemessaCNAB240',	'#Segmento P - Forma de Cadastr. Titulo no Banco (1 digito)', '0');

      if not Aconf.GetIniFile.ValueExists('ConfRemessaCNAB240', 'Segmento P - Codigo do Juros de Mora (1 digito)') then
        Aconf.InsertLineConf('ConfRemessaCNAB240',	'#Segmento P - Codigo do Juros de Mora (1 digito)', '1');

      if not Aconf.GetIniFile.ValueExists('ConfRemessaCNAB240', 'Segmento P - Usar Data do Juros de Mora (S ou N)') then
        Aconf.InsertLineConf('ConfRemessaCNAB240',	'#Segmento P - Usar Data do Juros de Mora (S ou N)', 'S');

      if not Aconf.GetIniFile.ValueExists('ConfRemessaCNAB240', 'Segmento P - Data do Juros de Mora sera considerada a Data de Vencimento mais x dias') then
        Aconf.InsertLineConf('ConfRemessaCNAB240', '#Segmento P - Data do Juros de Mora sera considerada a Data de Vencimento mais x dias', '1');

      if not Aconf.GetIniFile.ValueExists('ConfRemessaCNAB240', 'Segmento P - Codigo para Protesto (1 digito)') then
        Aconf.InsertLineConf('ConfRemessaCNAB240',
          vDadosIni.IfThen(vDataJurosMora = 'S', '', '#') +
            'Segmento P - Codigo para Protesto (1 digito)', '1');

      if not Aconf.GetIniFile.ValueExists('ConfRemessaCNAB240', 'Segmento R - Usar Data da Multa (S ou N)') then
        Aconf.InsertLineConf('ConfRemessaCNAB240',
          vDadosIni.IfThen(vDataJurosMora = 'S', '', '#') +
            'Segmento R - Usar Data da Multa (S ou N)', 'S');

      if not Aconf.GetIniFile.ValueExists('ConfRemessaCNAB240', 'Segmento R - Data da Multa sera considerada data de vencimento mais x dias') then
        Aconf.InsertLineConf('ConfRemessaCNAB240', '#Segmento R - Data da Multa sera considerada data de vencimento mais x dias', '1');

      if not Aconf.GetIniFile.ValueExists('ConfImportacaoRetorno', 'Ativar configuracoes importacao retorno (S ou N)') then
        Aconf.InsertLineConf('ConfImportacaoRetorno',	'#Ativar configuracoes importacao retorno (S ou N)', 'S');

      if not Aconf.GetIniFile.ValueExists('ConfImportacaoRetorno', 'Nao Verificar Agencia e Conta Corrente (S ou N)') then
        Aconf.InsertLineConf('ConfImportacaoRetorno',	'#Nao Verificar Agencia e Conta Corrente (S ou N)', 'S');

      if not Aconf.GetIniFile.ValueExists('ConfImportacaoRetorno', 'Nao Verificar Agencia e Conta Corrente (S ou N)') then
        Aconf.InsertLineConf('ConfImportacaoRetorno',	'#Nao Verificar Agencia e Conta Corrente (S ou N)', 'S');

      if not Aconf.GetIniFile.ValueExists('ConfImportacaoRetorno', 'Desconsiderar digito verificar ao imprimir boleto e gerar remessa (S ou N)') then
        Aconf.InsertLineConf('ConfImportacaoRetorno',	'#Desconsiderar digito verificar ao imprimir boleto e gerar remessa (S ou N)', 'S');
    end;

    if not Aconf.GetIniFile.ValueExists('ConfRemessaGeral', 'Ativar configuracoes (S ou N)') then
      Aconf.InsertLineConf('ConfRemessaGeral',	'#Ativar configuracoes (S ou N)', 'S');

    if not Aconf.GetIniFile.ValueExists('ConfRemessaGeral', 'Extensao do arquivo de remessa') then
      Aconf.InsertLineConf('ConfRemessaGeral',	'#Extensao do arquivo de remessa', 'REM');

    if not Aconf.GetIniFile.ValueExists('ConfRemessaGeral', 'Nome do arquivo de remessa') then
      Aconf.InsertLineConf('ConfRemessaGeral',	'#Nome do arquivo de remessa', '12345mdd.001');

    dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString := Aconf.value1_b.Text;

  //  if Pos('[ConfRemessaCNAB240]', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //    dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString := '[ConfRemessaCNAB240]' + #13 + #13;

  //  if Pos('Ativar configuracoes (S ou N)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //    dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString := dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString +
  //      vDadosIni.IfThen((vSemConf) and (dataSet.FieldByName('CORR_REMESSA').AsString = 'S'), '', '#') +
  //        'Ativar configuracoes (S ou N)=' + 'S' + #13;

  //  if Pos('Header Arquivo/Lote - CNPJ da Empresa (14 digitos)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //    dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString := dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString +
  //      '#Header Arquivo/Lote - CNPJ da Empresa (14 digitos)=' + trim(vDadosIni.vEmp.vCNPJ) + #13;

  //  if Pos('Header Arquivo - Usar Codigo do Convenio (S ou N)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //    dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString := dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString +
  //      vDadosIni.IfThen((vSemConf) and (dataSet.FieldByName('CORR_REMESSA').AsString = 'S'), '', '#') +
  //        'Header Arquivo - Usar Codigo do Convenio (S ou N)=' + 'S' + #13;

  //  if Pos('Header Arquivo - Numero Versao do Layout Arquivo (3 digitos)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //    dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString := dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString +
  //      vDadosIni.IfThen((vSemConf) and (dataSet.FieldByName('CORR_REMESSA').AsString = 'S'), '', '#') +
  //      'Header Arquivo - Numero Versao do Layout Arquivo (3 digitos)=' + '087' + #13;

  //  if Pos('Header Arquivo - Digito Verificador da AgConta (1 digito)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //    dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString := dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString +
  //      '#Header Arquivo - Digito Verificador da AgConta (1 digito)=' + '0' + #13;

  //  if Pos('Header Lote - Nº da Versao do Layout do Lote (3 digitos)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //    dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString := dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString +
  //    vDadosIni.IfThen((vSemConf) and (dataSet.FieldByName('CORR_REMESSA').AsString = 'S'), '', '#') +
  //      'Header Lote - Nº da Versao do Layout do Lote (3 digitos)=' + '045' + #13;

  //  if Pos('Segmento P - Usar Codigo da Agencia da Conta (S ou N)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //   dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString :=	dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString +
  //      '#Segmento P - Usar Codigo da Agencia da Conta (S ou N)=' + 'S' + #13;

  //  if Pos('Segmento P - Codigo da Carteira (1 digito)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //   dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString :=	dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString +
  //      '#Segmento P - Codigo da Carteira (1 digito)=' + '1' + #13;

  //  if Pos('Segmento P - Forma de Cadastr. Titulo no Banco (1 digito)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //    dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString :=	dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString +
  //      '#Segmento P - Forma de Cadastr. Titulo no Banco (1 digito)=' + '0' + #13;

  //  if Pos('Segmento P - Usar Data do Juros de Mora (S ou N)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //    dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString :=	dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString +
  //      '#Segmento P - Usar Data do Juros de Mora (S ou N)=' + 'S' + #13;

  //  if Pos('Segmento P - Codigo para Protesto', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //  begin
  //   	if Pos('[ConfImportacaoRetorno]', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //    	dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString :=  dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString +
  //	      '#Segmento P - Codigo para Protesto=' + '1' + #13
  //    else
  //      dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString :=
  //        Copy(dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString, 1,
  //          Pos('[ConfImportacaoRetorno]', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) - 1 { +
  //          Length('[ConfImportacaoRetorno]')}
  //          ) +
  //            vDadosIni.IfThen(Pos('Segmento P - Usar Data do Juros de Mora (S ou N)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) > 0,
  //              '', '#') + 'Segmento R - Usar Data da Multa (S ou N)=' + 'S' + #13;
  //          Copy(dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString,
  //            Pos('[ConfImportacaoRetorno]', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString),
  //            Length(dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString));
  //  end;

  //  if Pos('Segmento R - Usar Data da Multa (S ou N)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //  begin
  //  	if Pos('[ConfImportacaoRetorno]', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //    	dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString := dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString +
  //      	vDadosIni.IfThen(Pos('Segmento P - Usar Data do Juros de Mora (S ou N)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) > 0,
  //        	'', '#') +
  //	      'Segmento R - Usar Data da Multa (S ou N)=' + 'S' + #13
  //    else
  //      dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString :=
  //        Copy(dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString, 1,
  //          Pos('[ConfImportacaoRetorno]', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) - 1 { +
  //          Length('[ConfImportacaoRetorno]')}
  //          ) +
  //            vDadosIni.IfThen(Pos('Segmento P - Usar Data do Juros de Mora (S ou N)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) > 0,
  //              '', '#') + 'Segmento R - Usar Data da Multa (S ou N)=' + 'S' + #13;
  //          Copy(dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString,
  //            Pos('[ConfImportacaoRetorno]', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString),
  //            Length(dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString));
  //  end;

  //  if Pos('[ConfImportacaoRetorno]', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //    dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString := dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString +
  //    	#13 + #13 + '[ConfImportacaoRetorno]' + #13 + #13;
  //
  //  if Pos('Ativar configuracoes importacao retorno (S ou N)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //    dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString := dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString +
  //      vDadosIni.IfThen((vSemConf) and (dataSet.FieldByName('CORR_REMESSA').AsString = 'S'), '', '#') +
  //        'Ativar configuracoes importacao retorno (S ou N)=' + 'S' + #13;
  //
  //  if Pos('Nao Verificar Agencia e Conta Corrente (S ou N)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //    dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString := dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString +
  //    	'#Nao Verificar Agencia e Conta Corrente (S ou N)=' + 'S' + #13;
  //
  //  if Pos('Desconsiderar digito verificar ao imprimir boleto e gerar remessa (S ou N)', dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString) <= 0 then
  //    dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString := dataSet.FieldByName('OUTRAS_CONFIG_BOL').AsString +
  //    	'#Desconsiderar digito verificar ao imprimir boleto e gerar remessa (S ou N)=' + 'S' + #13;

    dataSet.FieldByName('CORR_REMESSA').Value := Null;
  finally
    if Assigned(Aconf) then
    	FreeAndNil(Aconf);
  end;
end;

function TCobrebem.insert: boolean;
begin
  result := false;
  if not dataSet.Active then
    result := montaSelect(' SELECT COB.*, EMP.IDENTIFICACAO_EMP FROM COBREBEM COB ' +
     ' LEFT JOIN EMPRESA EMP ON EMP.COD_EMPRESA = COB.COD_EMP_MULT ' +
     ' WHERE COB.COD_EMPRESA=' + vDadosIni.codEmpresa + ' and COB.COD_COBREBEM = 0');
  Result := inherited Insert;

  if (not Result) then
    Exit;

  if not abreFormOpcoes then
  begin
    dataSet.Cancel;
    Result := false;
    exit;
  end;

  if Length(trim(vDadosIni.vEmp.vCNPJ)) = 14 then
    dataSet.FieldByName('CPF_CNPJ_GENERICO').EditMask := HelperCNPJ.EditMask//'99.999.999/9999-99;0'
  else
    dataSet.FieldByName('CPF_CNPJ_GENERICO').EditMask := '999.999.999-99;0';

  if dataSet.FieldByName('TIPO_API').IsNull then
    if trim(dataSet.FieldByName('TESTAR_HTML').AsString) = '' then
      dataSet.FieldByName('TESTAR_HTML').AsString := 'S';

  if trim(dataSet.FieldByName('GERAR_REGISTRO_MULTA').AsString) = '' then
    dataSet.FieldByName('GERAR_REGISTRO_MULTA').AsString := 'N';
    
  dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
  dataSet.FieldByName('COD_EMP_MULT').AsInteger := strToInt(vDadosIni.codEmpresa);
  dataSet.FieldByName('LOCAL_PAG').AsString := vDadosIni.vEmp.vLocalPagBol;
  dataSet.FieldByName('OBS_BOL').AsString := vDadosIni.vEmp.vObsBol;
  dataSet.FieldByName('MENSAGEM_BOL').AsString := vDadosIni.vEmp.vMensagem;
  dataSet.FieldByName('TX_JUROS').AsFloat := vDadosIni.vEmp.vTxJuros;
  dataSet.FieldByName('MULTAS').AsFloat := vDadosIni.vEmp.vMultas;
  if trim(dataSet.FieldByName('NOME_EMP_GENERICO').AsString) = '' then
    dataSet.FieldByName('NOME_EMP_GENERICO').AsString := vDadosIni.vEmp.vnomeEmpresa;
  if trim(dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString) = '' then
    dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString := vDadosIni.vEmp.vCNPJ;
  if trim(dataset.FieldByName('LICENCA_GENERICA').AsString) = '' then
    dataset.FieldByName('LICENCA_GENERICA').AsString := 'N';
  if dataset.FieldByName('TAM_NOME_CEDENTE_GENERICO').AsInteger <= 0 then
    dataset.FieldByName('TAM_NOME_CEDENTE_GENERICO').AsInteger := 30;

  if dataSet.FieldByName('TIPO_API').AsString = 'S' then
    if trim(dataset.FieldByName('TIPODOCUMENTOCOBRANCA').AsString) = '' then
		  dataset.FieldByName('TIPODOCUMENTOCOBRANCA').AsString := '01';

  if dataSet.FieldByName('TIPO_API').AsString = 'S' then
  	if trim(dataSet.FieldByName('TITULOCODIGOJUROS').AsString) = '' then
  		dataSet.FieldByName('TITULOCODIGOJUROS').AsString := '1';

  if dataSet.FieldByName('TIPO_API').AsString = 'S' then
  	if trim(dataSet.FieldByName('TITULOCODIGOMULTA').AsString) = '' then
  		dataSet.FieldByName('TITULOCODIGOMULTA').AsString := '2';

  if dataSet.FieldByName('TIPO_API').AsString = 'S' then
    if trim(dataSet.FieldByName('TITULOCODIGOPROTESTO').AsString) = '' then
      dataSet.FieldByName('TITULOCODIGOPROTESTO').AsString := '2';

  if trim(dataSet.FieldByName('TIPO_API').AsString) = '' then
  	if trim(dataSet.FieldByName('AMBIENTE').AsString) = '' then
	  	dataSet.FieldByName('AMBIENTE').AsString := 'Produção';

  if dataSet.FieldByName('BANCOGERANOSSONUMERO').IsNull then
  	dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString := 'N';

  if dataSet.FieldByName('BANCOEMITEBOLETO').IsNull then
    dataSet.FieldByName('BANCOEMITEBOLETO').AsString := 'N';

  if dataSet.FieldByName('PERMITE_PROTESTO').IsNull then
  	dataSet.FieldByName('PERMITE_PROTESTO').AsString := 'N';

  if dataSet.FieldByName('DIASPROTESTO').IsNull then
  	dataSet.FieldByName('DIASPROTESTO').AsInteger := 0;

  if dataSet.FieldByName('PERMITE_DESCONTO').IsNull then
  	dataSet.FieldByName('PERMITE_DESCONTO').AsString := 'N';

  if dataSet.FieldByName('QTD_DIAS_LIM_DESC').IsNull then
  	dataSet.FieldByName('QTD_DIAS_LIM_DESC').AsInteger := 0;

  IncluirOutrosDados;
  setarMascaraTipoPlugBoleto;

  Controle.abreControle;
  ContBol.abreControle;
  vBancosHomologados.abreBancosHomologados;
  vEmpresasUnificadas._abreTodosEmpresas;

  vARQUIVOLICENCA := '';
  vIMAGENSLOGOTIPO := '';
  vIMAGENSBOLETO := '';

  vAgencia := '';
  vNumContaCorrente := '';
  vNumeroConvenio := '';
  vDiasProtesto := 0;

  result := true;
end;

function TCobrebem.obterDadosCertificado: Boolean;
var
	vStringList: TStringList;
	vTexto: WideString;
  I: Integer;
begin
	try
    Result := True;

    if trim(dataSet.FieldByName('CAMINHO_CERT').AsString) = '' then
    begin
    	if (dataSet.State in [dsInsert, dsEdit]) then
    		dataSet.FieldByName('DATA_VENC_CERT').Value := Null;

      Result := False;
      Exit;
    end;

    if not FileExists(trim(dataSet.FieldByName('CAMINHO_CERT').AsString)) then
    begin
      Result := False;
      Exit;
    end;

    try
      vStringList := TStringList.Create;

      vStringList.Clear;
      vStringList.Values['FileName'] := trim(dataSet.FieldByName('CAMINHO_CERT').AsString);
      if trim(dataSet.FieldByName('SENHA_CERT').AsString) <> '' then
        vStringList.Values['Password'] := trim(dataSet.FieldByName('SENHA_CERT').AsString);

      vTexto := vStringList.Text;
      vTexto := cert_obter_dados(vTexto);

      if trim(vTexto) <> '' then
      begin
      	if (dataSet.State in [dsInsert, dsEdit]) then
    			dataSet.FieldByName('DATA_VENC_CERT').Value := Null;

        vStringList := vDadosIni.Split(vTexto, ';');

        vTexto := '';
        for I := 0 to vStringList.Count - 1 do
          if ContainsStr(UpperCase(StringReplace(vStringList[I], ' ', '', [rfReplaceAll])), 'DATAVENCIMENTO=') then
          begin
            vTexto := UpperCase(StringReplace(vStringList[I], ' ', '', [rfReplaceAll]));
            vTexto := StringReplace(vTexto, 'DATAVENCIMENTO=', '', [rfReplaceAll]);
            vTexto := StringReplace(vTexto, ';', '', [rfReplaceAll]);
            Break;
          end;

        if trim(vTexto) <> '' then
        begin
          try
            StrToDate(vTexto);

            if (dataSet.State in [dsInsert, dsEdit]) then
              dataSet.FieldByName('DATA_VENC_CERT').AsString := trim(vTexto);
          except
            Application.MessageBox(PChar('Falha ao obter data de vencimento do certificado'), 'Atenção', MB_ICONERROR + MB_OK);
          end;
        end;
      end;
    finally
      if Assigned(vStringList) then
        FreeAndNil(vStringList);
    end;
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar('Erro ao obter data de vencimento do certificado: ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('Erro ao obter data de vencimento do certificado: ' + e.Message);
    end;
 end;
end;

function TCobrebem.post: boolean;
var
  vSenha, acao, vtemp: string;
  vTempLogEmp: string;
  Arq: TextFile;
  linha: string;
  vlistaLicenca: TStringList;
  ImageLogo, ImageBanco: TImage;
	MemoryStreamLogo, MemoryStreamBanco: TMemoryStream;
  vCodCobrebem: Integer;
  vTipoAPI: string;
begin
	try
    vDadosIni.logsBoleto(Self.ClassName + '.post - begin', 'boleto');

    vCodCobrebem := 0;
    vTipoAPI     := '';
    try
      if not (dataSet.state in [dsedit, dsinsert]) then
        exit;

      if dataSet.State = dsEdit then
        acao := 'EDITAR'
      else
        acao := 'INSERIR';

  //    if vDadosIni.vEmp.vFinanceiroUnificado then
  //    begin
  //      if dataSet.FieldByName('COD_EMP_MULT').AsInteger <= 0 then
  //        raiseExceptionCreate('Código Empresa Unificada', 'DBEdit66');
  //
  //      if not vEmpresasUnificadas._BuscarEmpresas(dataSet.FieldByName('COD_EMP_MULT').AsInteger) then
  //        raiseExceptionCreate('Código Empresa Unificada não existe ou não encontrada!', 'DBEdit66');
  //    end
  //    else
        dataSet.FieldByName('COD_EMP_MULT').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;

      if Trim(dataSet.FieldByName('DESCRICAO').asString) = '' then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Descrição deve ser informado.', 'DBEdit32');
        end
        else
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
          raiseExceptionCreate('Campo Descrição deve ser informado.', 'DBEdit1');
        end;
      end;

      if dataSet.FieldByName('TIPO_API').AsString = 'S' then
      begin
      if Trim(dataSet.FieldByName('AMBIENTE').AsString) = '' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Ambiente deve ser informado.', 'DBComboBox9');
        end;
      end;

      if Trim(dataSet.FieldByName('CODIGOCEDENTE').asString) = '' then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          if (trim(dataSet.FieldByName('BANCO').AsString) = '237') then
          begin
            frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
            raiseExceptionCreate('Campo Código do Cedente deve ser informado.', 'DBEdit50');
          end;
        end
        else
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
          raiseExceptionCreate('Campo Código do Cedente deve ser informado.', 'DBEdit5');
        end;
      end;

      if (Trim(dataSet.FieldByName('BANCO').AsString) = '')
        or (Trim(dataSet.FieldByName('BANCO').AsString) = '000') then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Banco deve ser informado.', 'DBEdit40');
        end;
      end;

      if Trim(dataSet.FieldByName('BANCO').AsString) <> '' then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
          if not verificaBancoHomologado then
          begin
            frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
            raiseExceptionCreate('Campo Banco não encontrado.', 'DBEdit40');
          end;
      end;

      if Trim(dataSet.FieldByName('TIPO_CONTA').AsString) = '' then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Tipo de Conta deve ser informado.', 'DBComboBox11');
        end;
      end;

      if Trim(dataSet.FieldByName('CODIGOAGENCIA').asString) = '' then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Código da Agência deve ser informado.', 'DBEdit33');
        end
        else
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
          raiseExceptionCreate('Campo Código da Agência deve ser informado.', 'DBEdit3');
        end;
      end;

      if Trim(dataSet.FieldByName('NUMEROCONTACORRENTE').asString) = '' then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Número da Conta Corrente deve ser informado.', 'DBEdit34');
        end
        else
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
          raiseExceptionCreate('Campo Número da Conta Corrente deve ser informado.', 'DBEdit4');
        end;
      end;

      if dataSet.FieldByName('TIPO_API').AsString = 'S' then
      begin
        if Trim(dataSet.FieldByName('CODIGOCONVENIO').asString) = '' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Número do Convênio deve ser informado.', 'DBEdit31');
        end;
      end;

      if dataSet.FieldByName('TIPO_API').AsString = 'S' then
      begin
        if Trim(dataSet.FieldByName('OUTRODADOCONFIGURACAO1').asString) = '' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Carteira deve ser informado.', 'DBEdit52');
        end;
      end;

      if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        if dataSet.FieldByName('BANCO').AsString = '001' then
          if Trim(dataSet.FieldByName('OUTRODADOCONFIGURACAO2').asString) = '' then
          begin
            frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
            raiseExceptionCreate('Campo Variação da Carteira deve ser informado.', 'DBEdit51');
          end;

      if Trim(dataSet.FieldByName('INICIONOSSONUMERO').asString) = '' then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Início Nosso Número deve ser informado.', 'DBEdit47');
        end
        else
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
          raiseExceptionCreate('Campo Início nosso Número deve ser informado.', 'DBEdit6');
        end;
      end;

      if Length(Trim(dataSet.FieldByName('INICIONOSSONUMERO').asString)) <= 5 then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Início Nosso Número não deve ser menor ou igual a 5 dígitos.', 'DBEdit47');
        end;
      end;

      if Trim(dataSet.FieldByName('FIMNOSSONUMERO').asString) = '' then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Fim Nosso Número deve ser informado.', 'DBEdit48');
        end
        else
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
          raiseExceptionCreate('Campo Fim Nosso Número deve ser informado.', 'DBEdit7');
        end;
      end;

      if Length(Trim(dataSet.FieldByName('FIMNOSSONUMERO').asString)) <= 5 then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Fim Nosso Número não deve ser menor ou igual a 5 dígitos.', 'DBEdit48');
        end;
      end;

      if Trim(dataSet.FieldByName('PROXIMONOSSONUMERO').asString) = '' then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Próximo Nosso Número deve ser informado.', 'DBEdit35');
        end
        else
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
          raiseExceptionCreate('Campo Próximo Nosso Número deve ser informado.', 'DBEdit8');
        end;
      end;

      if Length(Trim(dataSet.FieldByName('PROXIMONOSSONUMERO').asString)) <= 5 then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Próximo Nosso Número não deve ser menor ou igual a 5 dígitos.', 'DBEdit35');
        end;
      end;

      if dataSet.FieldByName('SEQUENCIA_REMESSA').AsInteger <= 0 then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Número Sequêncial Remessa deve ser informado.', 'DBEdit38');
        end
        else
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
          raiseExceptionCreate('Campo Número Sequêncial Remessa deve ser informado.', 'DBEdit26');
        end;
      end;

      if dataSet.FieldByName('TIPO_API').AsString = '' then
        if Trim(dataSet.FieldByName('IDENTIFICACAOCEDENTE').asString) = '' then
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
          raiseExceptionCreate('Campo Identificação do Cedente deve ser informado.', 'DBEdit12');
        end;


      if Trim(dataSet.FieldByName('TIPODOCUMENTOCOBRANCA').asString) = '' then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Tipo Documento deve ser informado.', 'DBComboBox_TipoDocumento');
        end
        else
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
          raiseExceptionCreate('Campo Tipo Documento deve ser informado.', 'DBComboBox8');
        end;
      end;

      if dataSet.FieldByName('TIPO_API').AsString = '' then
        if Trim(dataSet.FieldByName('CODIGO_BAIXA').asString) = '' then
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
          raiseExceptionCreate('Campo Código Baixa deve ser informado.', 'DBEdit25');
        end;

      if Trim(dataSet.FieldByName('CODIGO_CTRL').asString) = '' then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Código Controle deve ser informado.', 'DBEdit2');
        end
        else
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
          raiseExceptionCreate('Campo Código Controle deve ser informado.', 'DBEdit2');
        end;
      end
      else
      begin
        if not Controle.ExecutaComandosSql(' Select CODIGO_CTRL from Controles ' +
          ' where CODIGO_CTRL = ' + IntToStr(dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
          ' AND CODIGO_EMP = ' + vDadosIni.codEmpresa)
          then
        begin
          Application.MessageBox('Código de Controle não encontrado.', 'Atenção', MB_ICONERROR + MB_OK + MB_DEFBUTTON1);
          exit;
        end;
      end;

      if dataSet.FieldByName('TIPO_API').AsString = '' then
        if not FileExists(dataSet.FieldByName('ARQUIVOLICENCA').asString) then
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
          raiseExceptionCreate('Caminho do Campo Arquivo Licença não encontrado.', 'DBEdit9');
        end;

      if not DirectoryExists(dataSet.FieldByName('ENDERECOREMESSARETORNO').asString) then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Caminho do Campo Endereço Remessa não encontrado.', 'DBEdit_EnderecoRemessaRetorno2');
        end
        else
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
          raiseExceptionCreate('Caminho do Campo Endereço Remessa não encontrado.', 'DBEdit_EnderecoRemessaRetorno');
        end;
      end
      else
      begin
        dataSet.FieldByName('ENDERECOREMESSARETORNO').AsString :=
          dataSet.FieldByName('ENDERECOREMESSARETORNO').AsString;
        // dataSet.FieldByName('ENDERECOREMESSARETORNO').AsString :=
         //  StringReplace(dataSet.FieldByName('ENDERECOREMESSARETORNO').AsString,
         //  '\\', '\', [rfReplaceAll]);
      end;

      if Trim(dataSet.FieldByName('LAYOUTARQUIVOREMESSA').asString) = '' then
      begin
        if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          raiseExceptionCreate('Campo Padrão CNAB deve ser informado.', 'DBComboBox10');
        end;
      end;


      if dataSet.FieldByName('TIPO_API').AsString = '' then
        if not DirectoryExists(dataSet.FieldByName('IMAGENSBOLETO').asString) then
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
          raiseExceptionCreate('Caminho do Campo Imagens Boleto não encontrado.', 'DBEdit_ImagemCodigoBarras');
        end;

      if dataSet.FieldByName('TIPO_API').AsString = '' then
        if not FileExists(dataSet.FieldByName('IMAGENSLOGOTIPO').asString) then
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet3;
          raiseExceptionCreate('Caminho do Campo Imagem logotipo não encontrado.', 'DBEdit_ImagemLogotipo');
        end;

      if dataSet.FieldByName('TIPO_API').AsString = '' then
        if Trim(dataSet.FieldByName('DIASPROTESTO').asString) = '' then
        begin
          frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabSheet6;
          raiseExceptionCreate('Campo Dias Protesto deve ser informado.', 'DBEdit24');
        end;

      if dataSet.FieldByName('TIPO_API').AsString = '' then
        if Trim(dataSet.FieldByName('EMAIL_ENDERECOCEDENTE').asString) <> '' then
        begin
          if Trim(dataSet.FieldByName('EMAIL_URLIMAGENSBOLETO').asString) = '' then
          begin
            frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabEnvioEmail;
            raiseExceptionCreate('Campo Imagens Código de Barras deve ser informado.', 'DBEdit14');
          end;
          if Trim(dataSet.FieldByName('EMAIL_URLIMAGENSLOGOTIPO').asString) = '' then
          begin
            frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabEnvioEmail;
            raiseExceptionCreate('Campo Imagem Logotipo deve ser informado.', 'DBEdit15');
          end;
          if Trim(dataSet.FieldByName('EMAIL_SMTP_SERVIDOR').asString) = '' then
          begin
            frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabEnvioEmail;
            raiseExceptionCreate('Campo Servidor SMTP deve ser informado.', 'DBEdit16');
          end;
          if Trim(dataSet.FieldByName('EMAIL_SMTP_PORTA').asString) = '' then
          begin
            frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabEnvioEmail;
            raiseExceptionCreate('Campo Porta SMTP deve ser informado.', 'DBEdit17');
          end;
          if Trim(dataSet.FieldByName('EMAIL_SMTP_USUARIO').asString) = '' then
          begin
            frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabEnvioEmail;
            raiseExceptionCreate('Campo Usuário SMTP deve ser informado.', 'DBEdit18');
          end;
          if Trim(dataSet.FieldByName('EMAIL_SMTP_SENHA').asString) = '' then
          begin
            frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabEnvioEmail;
            raiseExceptionCreate('Campo Senha SMTP deve ser informado.', 'DBEdit_SenhaSMTP');
          end;
          if Trim(dataSet.FieldByName('EMAIL_ASSUNTO').asString) = '' then
          begin
            frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabEnvioEmail;
            raiseExceptionCreate('Campo Assunto Email deve ser informado.', 'DBEdit20');
          end;
        end;

      if dataSet.FieldByName('TIPO_API').AsString = '' then
        if Trim(dataSet.FieldByName('LICENCA_GENERICA').asString) = 'S' then
        begin
          if Trim(dataSet.FieldByName('NOME_EMP_GENERICO').AsString) = '' then
          begin
            frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabLicencaGenerica;
            raiseExceptionCreate('Campo Nome do Cedente deve ser informado.', 'DBEditNomeCedente');
          end;
          if Trim(dataSet.FieldByName('CPF_CNPJ_GENERICO').AsString) = '' then
          begin
            frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabLicencaGenerica;
            raiseExceptionCreate('Campo CPF/CNPJ deve ser informado.', 'DBEditCPFCNPJ');
          end;
          if dataset.FieldByName('TAM_NOME_CEDENTE_GENERICO').AsInteger <= 0 then
          begin
            frmCadCobreBem.PageControl3.ActivePage := frmCadCobreBem.TabLicencaGenerica;
            raiseExceptionCreate('Tamanho Nome do Cedente (Arquivo de Remessa) deve ser informado.', 'DBEditTamanhoCedente');
          end;
        end;

      if dataSet.FieldByName('BANCOGERANOSSONUMERO').AsString = 'S' then
        dataSet.FieldByName('BANCOEMITEBOLETO').AsString := 'S';

      if dataSet.FieldByName('TIPO_API').AsString = 'S' then
      begin
        dataSet.FieldByName('QTDEDIGNOSSONUMERO').AsInteger := Length(Trim(dataSet.FieldByName('INICIONOSSONUMERO').asString));

        dataSet.FieldByName('TIPODOCUMENTOCOBRANCA').AsString :=
          Copy(trim(dataSet.FieldByName('TIPODOCUMENTOCOBRANCA').AsString), 1, 2);
      end;

      vSenha := dataSet.FieldByName('EMAIL_SMTP_SENHA').asString;

      if (dataSet.State = dsInsert) and (vSenha <> '') then
        dataSet.FieldByName('EMAIL_SMTP_SENHA').asString := vDadosIni.codifica(vSenha)
      else
      begin
        if (dataSet.State = dsEdit) and (vSenha <> '') then
        begin
          if (vModificarSenha) then
            dataSet.FieldByName('EMAIL_SMTP_SENHA').asString := vDadosIni.codifica(vSenha);
        end;
      end;

      // Salvar licença cobrebem no BD
      if (trim(vARQUIVOLICENCA) <> trim(dataSet.FieldByName('ARQUIVOLICENCA').asString))
        or (trim(dataSet.FieldByName('LICENCA').asString) = '') then
      begin
        if (trim(dataSet.FieldByName('ARQUIVOLICENCA').asString) <> '')
          and (FileExists(trim(dataSet.FieldByName('ARQUIVOLICENCA').AsString))) then
        begin
          try
            vlistaLicenca := TStringList.Create;
            vlistaLicenca.Clear;
            // Lendo arquivo
            AssignFile(arq, trim(dataSet.FieldByName('ARQUIVOLICENCA').asString));
            Reset(arq);
            while not System.Eof(arq) do
            begin
              Readln(arq, linha);
              vlistaLicenca.Add(linha);
            end;
            dataSet.FieldByName('LICENCA').AsString := vlistaLicenca.Text;
          finally
            closeFile(arq);
            if Assigned(vlistaLicenca) then
              vlistaLicenca.Free;
          end;
        end
        else if (trim(dataSet.FieldByName('ARQUIVOLICENCA').asString) = '') then
          dataSet.FieldByName('LICENCA').Value := Null;
      end;

      // Salvar logotipo do cobrebem no BD
      if (trim(vIMAGENSLOGOTIPO) <> trim(dataSet.FieldByName('IMAGENSLOGOTIPO').asString))
        or (trim(dataSet.FieldByName('LOGOTIPO').asString) = '') then
      begin
        if (trim(dataSet.FieldByName('IMAGENSLOGOTIPO').asString) <> '')
          and (FileExists(trim(dataSet.FieldByName('IMAGENSLOGOTIPO').AsString))) then
        begin
          dataSet.FieldByName('LOGOTIPO').AsString :=
            _strImagetoBase64(trim(dataSet.FieldByName('IMAGENSLOGOTIPO').AsString));
        end
        else if (trim(dataSet.FieldByName('IMAGENSLOGOTIPO').asString) = '') then
          dataSet.FieldByName('LOGOTIPO').Value := Null;
      end;

      // Salvar logobanco do cobrebem no BD
      if (trim(vIMAGENSBOLETO) <> trim(dataSet.FieldByName('IMAGENSBOLETO').asString))
        or (trim(dataSet.FieldByName('LOGOBANCO').asString) = '') then
      begin
        if (trim(dataSet.FieldByName('IMAGENSBOLETO').asString) <> '')
          and (FileExists(trim(dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\' + trim(dataSet.FieldByName('BANCO').AsString) + '.jpg')) then
        begin
          dataSet.FieldByName('LOGOBANCO').AsString :=
            _strImagetoBase64(trim(dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\' +
              trim(dataSet.FieldByName('BANCO').AsString) + '.jpg');
        end
        else if (trim(dataSet.FieldByName('IMAGENSBOLETO').asString) = '') then
          dataSet.FieldByName('LOGOBANCO').Value := Null;
      end;

      // Salvar codbarras_a do cobrebem no BD
      if (trim(vIMAGENSBOLETO) <> trim(dataSet.FieldByName('IMAGENSBOLETO').asString))
        or (trim(dataSet.FieldByName('CODBARRAS_A').asString) = '') then
      begin
        if (trim(dataSet.FieldByName('CODBARRAS_A').AsString) = '')
          and (trim(dataSet.FieldByName('IMAGENSBOLETO').asString) <> '')
          and (FileExists(trim(dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\a.gif')) then
        begin
          dataSet.FieldByName('CODBARRAS_A').AsString :=
            _strImagetoBase64(trim(dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\a.gif');
        end
        else if (trim(dataSet.FieldByName('IMAGENSBOLETO').asString) = '') then
          dataSet.FieldByName('CODBARRAS_A').Value := Null;
      end;

      // Salvar codbarras_b do cobrebem no BD
      if (trim(vIMAGENSBOLETO) <> trim(dataSet.FieldByName('IMAGENSBOLETO').asString))
        or (trim(dataSet.FieldByName('CODBARRAS_B').asString) = '') then
      begin
        if (trim(dataSet.FieldByName('CODBARRAS_B').AsString) = '')
          and (trim(dataSet.FieldByName('IMAGENSBOLETO').asString) <> '')
          and (FileExists(trim(dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\b.gif')) then
        begin
          dataSet.FieldByName('CODBARRAS_B').AsString :=
            _strImagetoBase64(trim(dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\b.gif');
        end
        else if (trim(dataSet.FieldByName('IMAGENSBOLETO').asString) = '') then
          dataSet.FieldByName('CODBARRAS_B').Value := Null;
      end;

      // Salvar codbarras_c do cobrebem no BD
      if (trim(vIMAGENSBOLETO) <> trim(dataSet.FieldByName('IMAGENSBOLETO').asString))
        or (trim(dataSet.FieldByName('CODBARRAS_C').asString) = '') then
      begin
        if (trim(dataSet.FieldByName('CODBARRAS_C').AsString) = '')
          and (trim(dataSet.FieldByName('IMAGENSBOLETO').asString) <> '')
          and (FileExists(trim(dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\c.gif')) then
        begin
          dataSet.FieldByName('CODBARRAS_C').AsString :=
            _strImagetoBase64(trim(dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\c.gif');
        end
        else if (trim(dataSet.FieldByName('IMAGENSBOLETO').asString) = '') then
          dataSet.FieldByName('CODBARRAS_C').Value := Null;
      end;

      // Salvar codbarras_d do cobrebem no BD
      if (trim(vIMAGENSBOLETO) <> trim(dataSet.FieldByName('IMAGENSBOLETO').asString))
        or (trim(dataSet.FieldByName('CODBARRAS_D').asString) = '') then
      begin
        if (trim(dataSet.FieldByName('CODBARRAS_D').AsString) = '')
          and (trim(dataSet.FieldByName('IMAGENSBOLETO').asString) <> '')
          and (FileExists(trim(dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\d.gif')) then
        begin
          dataSet.FieldByName('CODBARRAS_D').AsString :=
            _strImagetoBase64(trim(dataSet.FieldByName('IMAGENSBOLETO').AsString) + '\d.gif');
        end
        else if (trim(dataSet.FieldByName('IMAGENSBOLETO').asString) = '') then
          dataSet.FieldByName('CODBARRAS_D').Value := Null;
      end;

      if dataSet.FieldByName('TIPO_API').AsString = 'S' then
        if not verificaConvenioExiste then
        begin
          frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet5;
          if dataSet.FieldByName('BANCO').AsString = '001' then
            raiseExceptionCreate('Convênio já existe para mesmo Banco/Agência/Conta Corrente/Número Convênio/Carteira/Varianção Carteira.', 'DBEdit33')
          else
            raiseExceptionCreate('Convênio já existe para mesmo Banco/Agência/Conta Corrente/Número Convênio/Carteira.', 'DBEdit33');
        end;

      SqlOpen(' select ver_cert_dig from bancos_homologados ' +
        ' where codbanco = ' + QuotedStr(vDadosIni.StrZero(dataset.FieldByName('BANCO').AsString, 3)), buscas);
        
      if buscas.FieldByName('VER_CERT_DIG').AsString = 'S' then
      begin
        if trim(dataSet.FieldByName('CAMINHO_CERT').asString) = '' then
        begin
        	 frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet7;
          raiseExceptionCreate('Caminho do Certificado deve ser informado.', 'DBEdit_CaminhoCertificado');
        end;
   	end;

      if trim(dataSet.FieldByName('CAMINHO_CERT').asString) <> '' then
      begin
        if not FileExists(dataSet.FieldByName('CAMINHO_CERT').asString) then
        begin
        	 frmCadCobreBem.PageControl2.ActivePage := frmCadCobreBem.TabSheet7;
          raiseExceptionCreate('Caminho do Certificado não encontrado.', 'DBEdit_CaminhoCertificado');
        end;
      end;

      if vDadosIni.vModoTreino = 'S' then
        if dataSet.State in [dsEdit, dsInsert] then
          dataSet.FieldByName('ENDERECOREMESSARETORNO').AsString := 'C:\Treinamento\Hw\Remessa\';

      dataSet.FieldByName('QTD_DIAS_LIM_DESC').AsInteger := Abs(dataSet.FieldByName('QTD_DIAS_LIM_DESC').AsInteger);

      obterDadosCertificado;

      if dataSet.State = dsInsert then
        dataSet.FieldByName('COD_COBREBEM').AsInteger := Gencodigo('Cobrebem', DtmBoletos.SpIncCodigo, vDadosIni.codEmpresa);

      vCodCobrebem := dataSet.FieldByName('COD_COBREBEM').AsInteger;
      vTipoAPI     := dataSet.FieldByName('TIPO_API').AsString;

      Result := inherited post;
      if dataSet.ChangeCount = 0 then
      begin
        result := true;
        exit;
      end;

      if Apply then
      begin
        CommitaTransacao;
        result := True;
      end
      else
      begin
        Cancel;
        RollBackTransacao;
        Result := False;
      end;

      if Result then
        vDadosIni.GravaAuditoria('COB008', acao, 'SUCESSO', 'COBREBEM',
          dataSet.FieldByName('COD_COBREBEM').AsString, buscas)
      else
        vDadosIni.GravaAuditoria('COB008', acao, 'FALHA', 'COBREBEM',
          dataSet.FieldByName('COD_COBREBEM').AsString, buscas);

      if (Result)
        and (vCodCobrebem > 0)
        and (trim(vTipoAPI) = 'S') then
      begin
        vDadosIni.logsBoleto(Self.ClassName + '.post - plugboleto_cedente', 'boleto');

        plugboleto_cedente(
          Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10',
                [vDadosIni.vBancoHW, vDadosIni.codEmpresa]));

        vDadosIni.logsBoleto(Self.ClassName + '.post - plugboleto_conta', 'boleto');

        plugboleto_conta(
          Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10',
                [vDadosIni.vBancoHW, vDadosIni.codEmpresa]), vCodCobrebem);

        vDadosIni.logsBoleto(Self.ClassName + '.post - plugboleto_convenio', 'boleto');

        plugboleto_convenio(
          Format(';databaseName=%s;empresaid=%s;silent=true;userHW=HW;userLevel=10',
                [vDadosIni.vBancoHW, vDadosIni.codEmpresa]), vCodCobrebem);
      end;

      Refresh;

    except
      on e: Exception do
      begin
        Result := false;
        Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        registraErro(e.Message);
      end;
    end;
  finally
    vDadosIni.logsBoleto(Self.ClassName + '.post - end', 'boleto');
  end;
end;

function TCobrebem.restauralixeira: boolean;
begin
	Result := False;
  if not dataSet.IsEmpty then
    if dataSet.FieldByName('ATIVO').asinteger = 0 then
    begin
      if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
      begin
        Result := Edit;
        if Result then
        begin
          dataSet.FieldByName('ATIVO').asinteger := 1;
          dataSet.Post;
          //Result := Post;
          if Result then
            Result := Apply;
          if Result then
            Result := CommitaTransacao;

          if Result then
            vDadosIni.GravaAuditoria('COB006', 'RESTAURAR REGISTRO', 'SUCESSO',
              'COBREBEM', dataSet.FieldByName('COD_COBREBEM').AsString, buscas)
          else
            vDadosIni.GravaAuditoria('COB006', 'RESTAURAR REGISTRO', 'FALHA',
              'COBREBEM', dataSet.FieldByName('COD_COBREBEM').AsString, buscas);

        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + chr(13) +
        'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
  Refresh;
end;

function TCobrebem.selecionarDiretorio(diretorioInicial: string): string;
var
  S: string;
begin
  SelectDirectory('Selecionar Pasta', '', S);
  if Trim(S) = '' then
    Result := diretorioInicial
  else
  begin
    if (Length(S) > 128) then
    begin
      ShowMessage('Este caminho está muito longo, selecione outro caminho.');
      Result := '';
    end
    else
    begin
      Result := S + '\';
    end;
  end;
end;

procedure TCobrebem.setarMascaraTipoPlugBoleto;
begin
	if dataSet.FieldByName('TIPO_API').AsString = 'S' then
  begin
  	dataset.FieldByName('BANCO').EditMask                  := '';
  	dataset.FieldByName('CODIGOAGENCIA').EditMask          := '';
    dataset.FieldByName('NUMEROCONTACORRENTE').EditMask    := '';
    dataset.FieldByName('CODIGOCEDENTE').EditMask          := '';
    dataset.FieldByName('CODIGOCONVENIO').EditMask         := '';
    dataset.FieldByName('OUTRODADOCONFIGURACAO1').EditMask := '';
    dataset.FieldByName('OUTRODADOCONFIGURACAO2').EditMask := '';

    dataset.FieldByName('INICIONOSSONUMERO').EditMask      := '';
    dataset.FieldByName('FIMNOSSONUMERO').EditMask         := '';
    dataset.FieldByName('PROXIMONOSSONUMERO').EditMask     := '';
    if Assigned(frmCadCobreBem) then
	    frmCadCobreBem.DBComboBox10.Clear;

    if not (dataSet.State in [dsInsert, dsEdit]) then
    	exit;

    dataset.FieldByName('BANCO').EditMask        := '000;1;_';

    if trim(dataset.FieldByName('BANCO').AsString) <> '' then
    begin
      SqlOpen(' select * from bancos_homologados ' +
        ' where codbanco = ' + QuotedStr(vDadosIni.StrZero(dataset.FieldByName('BANCO').AsString, 3)), buscas);

      if not buscas.IsEmpty then
      begin
      	if trim(buscas.FieldByName('LAYOUT400').AsString) = 'S' then
        	if Assigned(frmCadCobreBem) then
				    frmCadCobreBem.DBComboBox10.Items.Add('400');

      	if trim(buscas.FieldByName('LAYOUT240').AsString) = 'S' then
        	if Assigned(frmCadCobreBem) then
				    frmCadCobreBem.DBComboBox10.Items.Add('240');
//
//        if trim(buscas.FieldByName('MASCARA_CODIGOAGENCIA').AsString) <> '' then
//          dataset.FieldByName('CODIGOAGENCIA').EditMask        := trim(buscas.FieldByName('MASCARA_CODIGOAGENCIA').AsString);
//
//        if trim(buscas.FieldByName('MASCARA_NUMEROCONTACORRENTE').AsString) <> '' then
//          dataset.FieldByName('NUMEROCONTACORRENTE').EditMask  := trim(buscas.FieldByName('MASCARA_NUMEROCONTACORRENTE').AsString);
//
//        if trim(buscas.FieldByName('MASCARA_NUMEROCONVENIO').AsString) <> '' then
//        	dataset.FieldByName('CODIGOCONVENIO').EditMask  := trim(buscas.FieldByName('MASCARA_NUMEROCONVENIO').AsString);
//
//        if trim(buscas.FieldByName('MASCARA_CODIGOEMPRESA').AsString) <> '' then
//        	dataset.FieldByName('CODIGOCEDENTE').EditMask  := trim(buscas.FieldByName('MASCARA_CODIGOEMPRESA').AsString);
//
//        if trim(buscas.FieldByName('MASCARA_CARTEIRA').AsString) <> '' then
//          dataset.FieldByName('OUTRODADOCONFIGURACAO1').EditMask := trim(buscas.FieldByName('MASCARA_CARTEIRA').AsString);
//
//        if trim(buscas.FieldByName('MASCARA_VARIACAOCARTEIRA').AsString) <> '' then
//          dataset.FieldByName('OUTRODADOCONFIGURACAO2').EditMask := trim(buscas.FieldByName('MASCARA_VARIACAOCARTEIRA').AsString);
//
//        if trim(buscas.FieldByName('MASCARA_NOSSONUMERO').AsString) <> '' then
//        begin
//        	dataset.FieldByName('INICIONOSSONUMERO').EditMask  := trim(buscas.FieldByName('MASCARA_NOSSONUMERO').AsString);
//          dataset.FieldByName('FIMNOSSONUMERO').EditMask  := trim(buscas.FieldByName('MASCARA_NOSSONUMERO').AsString);
//          dataset.FieldByName('PROXIMONOSSONUMERO').EditMask  := trim(buscas.FieldByName('MASCARA_NOSSONUMERO').AsString);
//        end;
      end;
    end;
  end;
end;

function TCobrebem.statuslixeira: boolean;
begin
  Result := ExecutaComandosSql(' SELECT COB.*, EMP.IDENTIFICACAO_EMP FROM COBREBEM COB ' +
   ' LEFT JOIN EMPRESA EMP ON EMP.COD_EMPRESA = COB.COD_EMP_MULT ' +
   ' WHERE COB.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND COB.ATIVO = 0 ' +
   ' AND COB.COD_EMPRESA = ' + vDadosIni.codEmpresa);
end;

function TCobrebem.validaArquivoLicenca: boolean;
var
  vCB: Variant;
  I: Integer;
  temp: integer;
  vArquivoLicencaEncontrada, vBancoLicencaEncontrada: boolean;
  txt: textfile;
begin
  Result := false;
  if not criarPastasTemporarias then
  	exit;
  vArquivoLicencaEncontrada := false;
  vBancoLicencaEncontrada := false;
  FMascaraCodigoAgencia := '';
  FMascaraCodigoCedente := '';
  FMascaraNossoNumero := '';
  FMascaraContaCorrente := '';
  FMascaraOutroDadoConfiguracao2 := '';
  FMascaraOutroDadoConfiguracao1 := '';
  FCabecalhoOutroDadoConfiguracao2 := '';
  FCabecalhoOutroDadoConfiguracao1 := '';
  FNomeBanco := '';
  FNumeroBanco := '';
  if (trim(dataSet.FieldByName('ARQUIVOLICENCA').asString) <> '') and (FileExists(dataSet.FieldByName('ARQUIVOLICENCA').asString)) then
  	vArquivoLicencaEncontrada := true
  else if (trim(dataSet.FieldByName('LICENCA').asString) <> '') then
  	vBancoLicencaEncontrada := true;

  if vBancoLicencaEncontrada then
  begin
    if Application.MessageBox('Arquivo de licença não encontrado, deseja carregar do banco de dados?',
      'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
      	vBancoLicencaEncontrada := false;
  end;

  if (vArquivoLicencaEncontrada) or (vBancoLicencaEncontrada) then
  begin
    try
      try
        vCB := CreateOleObject('CobreBemX.ContaCorrente');
        if vArquivoLicencaEncontrada then
	        vCB.ArquivoLicenca := dataSet.FieldByName('ARQUIVOLICENCA').AsString
        else
        begin
        	AssignFile(txt, vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
            'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
            ExtractFileName(dataSet.FieldByName('ARQUIVOLICENCA').asString));
          Rewrite(txt, vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
            'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
            ExtractFileName(dataSet.FieldByName('ARQUIVOLICENCA').asString));
          Append(txt);
          Write(txt, trim(dataSet.FieldByName('LICENCA').asString));
          CloseFile(txt);

          vCB.ArquivoLicenca := vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
            'Cob' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
            ExtractFileName(dataSet.FieldByName('ARQUIVOLICENCA').asString);
        end;	
        if vCB.MascaraCodigoAgencia <> '' then
          FMascaraCodigoAgencia := vCB.MascaraCodigoAgencia;
        if vCB.MascaraContaCorrente <> '' then
          FMascaraContaCorrente := vCB.MascaraContaCorrente;
        if vCB.MascaraCodigoCedente <> '' then
          FMascaraCodigoCedente := vCB.MascaraCodigoCedente;
        if vCB.MascaraNossoNumero <> '' then
          FMascaraNossoNumero := vCB.MascaraNossoNumero;
        if vCB.CabecalhoOutroDadoConfiguracao1 <> '' then
          FCabecalhoOutroDadoConfiguracao1 := vCB.CabecalhoOutroDadoConfiguracao1;
        if vCB.CabecalhoOutroDadoConfiguracao2 <> '' then
          FCabecalhoOutroDadoConfiguracao2 := vCB.CabecalhoOutroDadoConfiguracao2;
        if vCB.MascaraOutroDadoConfiguracao1 <> '' then
          FMascaraOutroDadoConfiguracao1 := vCB.MascaraOutroDadoConfiguracao1;
        if vCB.MascaraOutroDadoConfiguracao2 <> '' then
          FMascaraOutroDadoConfiguracao2 := vCB.MascaraOutroDadoConfiguracao2;
        if vCB.NomeBanco <> '' then
          FNomeBanco := vCB.NomeBanco;
        if vCB.NumeroBanco <> '' then
          FNumeroBanco := vCB.NumeroBanco;
        dataSet.FieldByName('CODIGOCEDENTE').EditMask := MascaraCodigoCedente;
        dataSet.FieldByName('CODIGOAGENCIA').EditMask := MascaraCodigoAgencia;
        dataSet.FieldByName('NUMEROCONTACORRENTE').EditMask := MascaraContaCorrente;
        dataSet.FieldByName('INICIONOSSONUMERO').EditMask := MascaraNossoNumero;
        dataSet.FieldByName('FIMNOSSONUMERO').EditMask := MascaraNossoNumero;
        dataSet.FieldByName('PROXIMONOSSONUMERO').EditMask := MascaraNossoNumero;
        dataSet.FieldByName('OUTRODADOCONFIGURACAO1').EditMask := MascaraOutroDadoConfiguracao1;
        dataSet.FieldByName('OUTRODADOCONFIGURACAO2').EditMask := MascaraOutroDadoConfiguracao2;
        if dataSet.State in [dsInsert, dsEdit] then
        begin
          dataSet.FieldByName('QTDEDIGNOSSONUMERO').AsInteger := Length(FMascaraNossoNumero);
          dataSet.FieldByName('BANCO').AsString := FNumeroBanco;
        end;

        temp := vCB.LayoutsArquivoRemessa.Count;
        SetLength(FLayout.LayoutsArquivoRemessa, temp);
        for I := 0 to vCB.LayoutsArquivoRemessa.Count - 1 do
          FLayout.LayoutsArquivoRemessa[I] := vCB.LayoutsArquivoRemessa[I];

        temp := vCB.LayoutsArquivoRetorno.Count;
        SetLength(FLayout.LayoutsArquivoRetorno, temp);
        for I := 0 to vCB.LayoutsArquivoRetorno.Count - 1 do
          FLayout.LayoutsArquivoRetorno[I] := vCB.LayoutsArquivoRetorno[I];

        temp := vCB.LayoutsBoleto.Count;
        SetLength(FLayout.LayoutsBoleto, temp);
        for I := 0 to vCB.LayoutsBoleto.Count - 1 do
          FLayout.LayoutsBoleto[I] := vCB.LayoutsBoleto[I];

        temp := vCB.LayoutsBoletoEmail.Count;
        SetLength(FLayout.LayoutsBoletoEmail, temp);
        for I := 0 to vCB.LayoutsBoletoEmail.Count - 1 do
          FLayout.LayoutsBoletoEmail[I] := vCB.LayoutsBoletoEmail[I];

        temp := vCB.TiposDocumentosCobranca.Count;
        SetLength(FLayout.TiposDocumentosCobranca[1], temp);
        SetLength(FLayout.TiposDocumentosCobranca[2], temp);
        for I := 0 to vCB.TiposDocumentosCobranca.Count - 1 do
        begin
          FLayout.TiposDocumentosCobranca[1, I] := vCB.TiposDocumentosCobranca[I].Codigo;
          FLayout.TiposDocumentosCobranca[2, I] := vCB.TiposDocumentosCobranca[I].Nome;
        end;
        //  ShowMessage(vCB.NomeCarteira);   ////@
        Result := true;
      except
        on e: exception do begin
          Application.MessageBox(pchar('Erro ao buscar dados do arquivo de configuração' + #13 +
            'Erro: ' + e.Message), 'Atenção', MB_OK + MB_ICONINFORMATION);
        end;
      end;
    finally
      vCB := Unassigned;
    end;
  end;
end;

function TCobrebem.verificaBancoHomologado: boolean;
begin
	Result := True;
//	Result := False;
//
//	SqlOpen(' select * from bancos_homologados ' +
//  	' where codbanco = ' + QuotedStr(dataSet.FieldByName('BANCO').AsString) +
//    ' and ativo = 1 ');
//
//
//  Result := not buscas.IsEmpty;
end;

function TCobrebem.verificaConvenioExiste: boolean;
begin
	Result := False;

  buscas.Close;
  if dataSet.FieldByName('BANCO').AsString = '001' then
  begin
  	buscas.SQL.Text := ' select cod_cobrebem, cod_empresa from cobrebem ' +
    	' where banco = ' + QuotedStr(dataSet.FieldByName('BANCO').AsString) +
      ' and codigoagencia = ' + QuotedStr(dataSet.FieldByName('CODIGOAGENCIA').AsString) +
      ' and numerocontacorrente = ' + QuotedStr(dataSet.FieldByName('NUMEROCONTACORRENTE').AsString) +
//      ' and codigocedente = ' + QuotedStr(dataSet.FieldByName('CODIGOCEDENTE').AsString) +
      ' and codigoconvenio = ' + QuotedStr(dataSet.FieldByName('CODIGOCONVENIO').AsString) +
      ' and outrodadoconfiguracao1 = ' + QuotedStr(dataSet.FieldByName('OUTRODADOCONFIGURACAO1').AsString) +
      ' and outrodadoconfiguracao2 = ' + QuotedStr(dataSet.FieldByName('OUTRODADOCONFIGURACAO2').AsString) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and tipo_api = ''S'' ' +
      ' and ambiente = ' + QuotedStr(dataSet.FieldByName('AMBIENTE').AsString) +
      ' and ativo = 1 ' +
      ' and inicionossonumero = ' + QuotedStr(dataSet.FieldByName('INICIONOSSONUMERO').AsString) +
      ' and cod_cobrebem <> ' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger);
  end
  else
  begin
  	buscas.SQL.Text := ' select cod_cobrebem, cod_empresa from cobrebem ' +
    	' where banco = ' + QuotedStr(dataSet.FieldByName('BANCO').AsString) +
      ' and codigoagencia = ' + QuotedStr(dataSet.FieldByName('CODIGOAGENCIA').AsString) +
      ' and numerocontacorrente = ' + QuotedStr(dataSet.FieldByName('NUMEROCONTACORRENTE').AsString) +
//      ' and codigocedente = ' + QuotedStr(dataSet.FieldByName('CODIGOCEDENTE').AsString) +
      ' and codigoconvenio = ' + QuotedStr(dataSet.FieldByName('CODIGOCONVENIO').AsString) +
      ' and outrodadoconfiguracao1 = ' + QuotedStr(dataSet.FieldByName('OUTRODADOCONFIGURACAO1').AsString) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and tipo_api = ''S'' ' +
      ' and ambiente = ' + QuotedStr(dataSet.FieldByName('AMBIENTE').AsString) +
      ' and ativo = 1 ' +
      ' and inicionossonumero = ' + QuotedStr(dataSet.FieldByName('INICIONOSSONUMERO').AsString) +
      ' and cod_cobrebem <> ' + IntToStr(dataSet.FieldByName('COD_COBREBEM').AsInteger);
  end;
  buscas.Open;

  Result := buscas.IsEmpty;
end;

{ TControleBol }

function TControleBol.abreControle: boolean;
begin
  Result := montaSelect('select * from Controles ' +
  	' where usar_boleto = ''S'' ' +
    ' and codigo_emp = ' + vdadosini.codempresa +
    ' and ativo = 1 ');
end;

constructor TControleBol.create;
begin
  dataSet := TClientDataSet(DtmBoletos.cdsControles);
  buscas := TIBQuery(DtmBoletos.qrBuscas);
  transacao := TIBTransaction(DtmBoletos.IBTransBoletos);
end;

{ TRemessaBoleto }

function TRemessaBoleto.AbreRemessaBoleto: boolean;

begin
  Result := montaselect('SELECT DISTINCT(COD_SEQ_REMESSA), DATA_REMESSA' +
    ' FROM BOLETAS WHERE COD_SEQ_REMESSA IS NOT NULL AND DATA_REMESSA between' +
    Quotedstr(FormatDateTime('dd.mm.yyyy', strtodate(_DataInicio))) +
    ' AND ' + Quotedstr(FormatDateTime('dd.mm.yyyy', strtodate(_DataFim))) +
    ' AND COD_EMPRESA =' + vDadosIni.codEmpresa);
end;

constructor TRemessaBoleto.create;
begin
  dataSet := TClientDataSet(DtmBoletos.cdsRemessaBoleto);
  buscas := TIBQuery(DtmBoletos.qrRemessaBoleto);
  transacao := TIBTransaction(DtmBoletos.IBTransBoletos);
end;

{ TBoletoNossoNumeroRepetido }

constructor TBoletoNossoNumeroRepetido.create;
begin
  dataSet := TClientDataSet(DtmBoletos.cdsboletonossonumerorepetido);
  buscas := TIBQuery(DtmBoletos.qrboletonossonumerorepetido);
  transacao := TIBTransaction(DtmBoletos.IBTransBoletos);

  Fsql_campos := ' BOLETAS.*, ' +
  							 ' CONTROLES.NOME_CTRL, ' +
                 ' CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.CPFCGC, CLIENTES.EMAIL, ' +
                 ' RETORNA_DATA_ENV_BOL.DATA_ENV_EMAIL, RETORNA_DATA_ENV_BOL.DATA_ENV_WHATSAPP, RETORNA_DATA_ENV_BOL.DATA_ENV_MENS ';
                 
  Fsql_inner  := ' INNER JOIN CLIENTES ON BOLETAS.COD_CLIENTE = CLIENTES.COD_CLIENTE AND BOLETAS.COD_EMPRESA = CLIENTES.COD_EMPRESA ' +
            		 ' LEFT JOIN CONTROLES ON BOLETAS.COD_CONTROLE_CX = CONTROLES.CODIGO_CTRL AND BOLETAS.COD_EMPRESA = CONTROLES.CODIGO_EMP ' +
                 ' LEFT JOIN RETORNA_DATA_ENV_BOL (BOLETAS.N_SEQ_BOL, BOLETAS.COD_EMPRESA) ON 1 = 1 ';
end;

function TBoletoNossoNumeroRepetido._AbreBoletos(NOSSONUMERO: string): boolean;
begin

  result :=
    montaselect('select ' + Fsql_campos + ' from BOLETAS ' +
    	Fsql_inner +
    	' where BOLETAS.NOSSO_NUMERO_BANCO = ' + QuotedStr(NOSSONUMERO) +
      ' and BOLETAS.COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' and CLIENTES.COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' and BOLETAS.STATUS IS NULL');

end;

{ TPesqBanco }

function TPesqBanco.abreBanco: boolean;
begin
  result := montaSelect(' Select * from CODIGO_BANCO where Ativo = 1');
end;

constructor TPesqBanco.create;
begin
  dataSet := TClientDataSet(DtmBoletos.cdsPesqBanco);
  buscas := TIBQuery(DtmBoletos.qrPesqBanco);
  transacao := TIBTransaction(DtmBoletos.IBTransBoletos);

end;

function TPesqBanco._PesquisaBanco(codigo: string): boolean;
begin
  ExecutaComandosSql('Select * from CODIGO_BANCO where COD_BANCO = ' + codigo + ' and Ativo = 1');
end;

{ TBoletosNFVenda }

constructor TBoletosNFVenda.create;
begin
  dataSet := TClientDataSet(DtmBoletos.cdsNFVenda);
  buscas := TIBQuery(DtmBoletos.qrNFVenda);
  transacao := TIBTransaction(DtmBoletos.IBTransBoletos);
end;

function TBoletosNFVenda._AbreNFVenda(NumNFVenda: string): boolean;
begin
  result := montaselect('select * from nf_venda ' +
    ' where num_nf_vnd = ' + NumNFVenda +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1');

end;

{ TControleCredito }

constructor TControleCredito.create;
begin
  if (DtmBoletos = nil) then
    DtmBoletos := TDtmBoletos.Create(DtmBoletos);
  DataSet := TClientDataSet(DtmBoletos.cdsControleCreditosBol);
  transacao := TIBTransaction(DtmBoletos.IBTransBoletos);
  Buscas := TIBQuery(DtmBoletos.qrBuscas);
  montaSelect('SELECT CC.*, EMPRESA.IDENTIFICACAO_EMP FROM CONTROLE_CREDITOS CC ' +
   ' LEFT JOIN EMPRESA ON EMPRESA.COD_EMPRESA = CC.COD_EMP_MULT ' +
   ' WHERE CC.COD_CRED=0');
  dataSet.Tag := 0;
end;

{ TConteBol }

function TConteBol.abreControle: boolean;
begin
  Result := montaSelect('select * from controles ' +
  	' where contr_banc = ''S'' ' +
    ' and docs = ''N'' ' +
    ' and codigo_emp = ' + vdadosini.codempresa +
    ' and ativo = 1 ');
end;

constructor TConteBol.create;
begin
  dataSet := TClientDataSet(DtmBoletos.cdsContBanc);
  buscas := TIBQuery(DtmBoletos.qrBuscas);
  transacao := TIBTransaction(DtmBoletos.IBTransBoletos);
end;

{TBoletosProtesto}

function TBoletosProtesto.abreBoletosProtesto: boolean;
begin
  Result := montaSelect(' select b.cod_cliente, c.nome_cliente, c.razao, c.cpfcgc, b.num_nf_vnd, b.data_em_bol, b.n_doc_bol, ' +
	' b.data_ven_bol, b.vl_doc_bol, co.nome_ctrl, b.nosso_numero_banco, b.data_remessa, b.cod_carga, ' +
	' (b.data_ven_bol + b.dias_protesto) data_protesto, b.n_seq_bol, ' +
  ' case when (trim(cc.status_c) = ''QUITADO'') then ''QUITADO'' else trim(b.status) end status from boletas b '+
	' left join clientes c on c.cod_cliente = b.cod_cliente and c.cod_empresa = b.cod_empresa ' +
	' left join controles co on co.codigo_ctrl = b.cod_controle_cx and co.codigo_emp = b.cod_empresa ' +
  ' left join controle_creditos cc on cc.nosso_numero_banco = b.nosso_numero_banco and cc.cod_emp_mult = b.cod_empresa ' +
	' where b.cod_empresa = ' + vDadosIni.codEmpresa +
  ' and b.remessa_enviada = ''S'' ' +
  ' and (case when (trim(cc.status_c) = ''QUITADO'') then ''QUITADO'' else trim(upper((coalesce(b.status, '''')))) end) = '''' '+
	' and coalesce(b.dias_protesto, 0) > 0 ' +
  ' and b.data_ven_bol < current_date '+
	' order by 12');
end;

procedure TBoletosProtesto.cadBoletosProtesto(pExibeCheckBox: boolean = True);
begin
	try
    if frmBoletosProtesto = nil then
      Application.CreateForm(TfrmBoletosProtesto, frmBoletosProtesto);

    frmBoletosProtesto.cbNaoExibirNovamente.Visible := pExibeCheckBox;

    if (vDadosIni.vPesquisa = 'BOLETOSPROTESTO|NAOABRIR') and (pExibeCheckBox) then
      Exit;

    if existeBoletosProtesto then
    	frmBoletosProtesto.ShowModal
  	else if not pExibeCheckBox then
			Application.MessageBox('Não Existem Boletos em protesto/ a protestar!!', 'Informação', MB_ICONINFORMATION + MB_OK + MB_DEFBUTTON1);
  finally
  	FreeAndNil(frmBoletosProtesto);
    FreeAndNil(vCadBoletosProtesto);
    vDadosIni.vPesquisa := '';
  end;
end;

constructor TBoletosProtesto.create;
begin
  if DtmBoletos = nil then
    DtmBoletos := TDtmBoletos.Create(DtmBoletos);

	transacao := TIBTransaction(DtmBoletos.IBTransBoletos);
  buscas := TIBQuery(DtmBoletos.qrBuscas);
  dataSet := TClientDataSet(DtmBoletos.cdsBoletosProtesto);
end;

function TBoletosProtesto.existeBoletosProtesto: boolean;
begin
	try
  	SqlOpen('select b.n_seq_bol from boletas b '+
      'where b.cod_empresa = %d and b.remessa_enviada = ''S'' '+
      'and trim(upper((coalesce(b.status, '''')))) = '''''+
      ' and coalesce(b.dias_protesto, 0) > 0 and b.data_ven_bol < %s',
      [vDadosIni.cod_empresa, vDadosIni.FusoSqlDate], buscas);

    Result := not buscas.IsEmpty;

  except on E: Exception do
  	Result := False;
  end;
end;

{ TEmpresasUnificadas }

constructor TEmpresasUnificadas.create;
begin
  DataSet := TClientDataSet(DtmBoletos.cdsEmpresasUnificadas);
  transacao := TIBTransaction(DtmBoletos.IBTransBoletos);
  Buscas := TIBQuery(DtmBoletos.qrBuscas);
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

{ TArqBoleto }

function TArqBoleto.abreArquivosBol: Boolean;
begin
	Result := montaSelect(' SELECT ARQ_BOLETO.*, ' +
  	' COBREBEM.BANCO, COBREBEM.CODIGOAGENCIA, COBREBEM.NUMEROCONTACORRENTE, COBREBEM.CODIGOCEDENTE, COBREBEM.DESCRICAO FROM ARQ_BOLETO ' +
  	' LEFT JOIN COBREBEM ON COBREBEM.COD_COBREBEM = ARQ_BOLETO.COD_COBREBEM AND COBREBEM.COD_EMPRESA = ARQ_BOLETO.COD_EMPRESA ' +
    ' WHERE ARQ_BOLETO.COD_EMPRESA = 0 ');
end;

procedure TArqBoleto.cadArqBoleto(TipoForm: Integer);
begin
	vDadosIni.vTipoForm := TipoForm;
  if DtmBoletos = nil then
    DtmBoletos := TDtmBoletos.Create(DtmBoletos);
  if frmArquivosBoleto = nil then
  begin
    vDadosIni.abreStatusProcessamento('', 'Abrindo Arquivos Remessa/Retorno');
    if TipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';
    Application.CreateForm(TfrmArquivosBoleto, frmArquivosBoleto);
  end;

  if (TipoForm > 0) and (not frmArquivosBoleto.Visible) then
    frmArquivosBoleto.ShowModal
  else if (not frmArquivosBoleto.Visible) then
    frmArquivosBoleto.Show
  else if frmArquivosBoleto.FormStyle = fsMDIChild then
    frmArquivosBoleto.Show
  else
    frmArquivosBoleto.ShowModal;
end;

function TArqBoleto.CarregaPacote(NomeBPL: string;
  var pNumPacote: THandle): boolean;
var
  sPacote: string;
  hPacote: THandle;
  aClass: TPersistentClass;
begin
  try
    result := true;
    sPacote := ExtractFilePath(ParamStr(0)) + NomeBPL + '.bpl';
    if not FileExists(sPacote) then
    begin
      raise Exception.Create('Arquivo bpl não existe.');
    end;
    hPacote := LoadPackage(sPacote);
    pNumPacote := hPacote;
    Result := true;
  except;
    result := false;
  end;
end;

constructor TArqBoleto.create;
begin
	dataSet := TClientDataSet(DtmBoletos.cdsArquivosBoleto);
  buscas := TIBQuery(DtmBoletos.qrBuscas);
  transacao := TIBTransaction(DtmBoletos.IBTransBoletos);
end;

function TArqBoleto.edit: boolean;
begin
 result := false;
  if (not dataSet.Active) or (dataSet.IsEmpty) then
  begin
    Result := false;
    Exit;
  end;

  if inherited Edit then
    result := True;
end;

{ TBancosHomologados }

function TBancosHomologados.abreBancosHomologados: boolean;
begin
	result := montaSelect(' select * from bancos_homologados ' +
  	' where ativo = 1 ' +
    ' order by codbanco ');
end;

constructor TBancosHomologados.create;
begin
	dataSet := TClientDataSet(DtmBoletos.cdsBancosHomologados);
  buscas := TIBQuery(DtmBoletos.qrBuscas);
  transacao := TIBTransaction(DtmBoletos.IBTransBoletos);
end;

{ TConfEmail }

constructor TConfEmail.create;
begin
	transacao := TIBTransaction(DtmBoletos.IBTransBoletos);
  Buscas := TIBQuery(DtmBoletos.qrConfEmail);
end;

end.

