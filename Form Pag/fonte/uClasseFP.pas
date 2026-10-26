unit uClasseFP;

interface

uses Forms, Classes, uDataSet_OOP, Controls, StdCtrls, DBClient, IBQuery, funcoes,
  QuickRpt, DB;

type
  Tcl_abreExtrato_form = function(ACodCliente: Integer): boolean;
  
  RConsultas = record
    vSqlAdicional: AnsiString;
    vDataIniAd, vDataFimAd, vCondicao, vCondicaoAd, vCampo, vCampoAd, vValor, vValorAd, statusAv: string;
    vPorData, vAdicional, vPorDataAd, vLancDiferenca, avancada: boolean;
  end;

  RTaxas = record
    txCartao, txCartaoComEnt, txCheque, txChequeComEnt,
      txBoleta, txBoletaComEnt, txCrediario, txCrediarioComEnt: Double;
  end;

  RDadosPlano = record
    codigo_controle, numero_prestacoes, numero_venda, codigo_cliente,
      codigo_vendedor: integer;
    valor_operacao, valor_desconto, valor_entrada, valor_com_desconto,
      valor_aplicado, valor_parcela, percentual_maximo_desconto, mot_valoroperacao,
      mot_valor_nf, mot_valorMotUsada, mot_Valor_frete, mot_Valor_Contabil_Dinheiro,
      mot_Valor_retorno, mot_Valor_Interm: Currency;
    taxaAplicada: Double;
    mot_OS_montada, mot_OS_Inter: Boolean;
    mot_NumPedVenda: integer;
    textoEdit, tipo_venda: string;
  end;

  TOperacaoRecibo = (orNormal, orValeDevolucao, orValeLocacao, orAntecipado, orValeProgFid, orValeCashback);

  TControleIntermPag = class;
  TVincIntermPag = class;
  TIntermPag = class;
  TBancoFP = class;
  TCondPagFP = class;
  TControleFP = class;
  THistRecFP = class;
  TJurosFP = class;
  TFuncionarios = class;
  TReciboFP = class;
  TFechDiaCxlFP = class;
  TLancamentoCxlFP = class;
  TEmpresaPlano = class;
  TPlanoPagamento = class;
  TJurosPlano_2 = class;
  TPlanoPagamento_2 = class;
  TContasBancariasForPag = class;
  TECommerce = class;

  RClientes = record
    AHandle: THandle;
  end;

//  TComunicFormPag = class
//  public
//    function iniciaFormaPagamento(nVenda, codCondPag, subSerie, codCliente, codVendedor: integer;
//      tipoDoc: string; valorDoc: Currency): boolean;
//  end;

  TCondPagIntermPag  = class(TDataset_OOP)
  private
  public
    constructor create;
    function _abreVincIntermPag: Boolean;
  end;

  TControleIntermPag = class(TDataset_OOP)
  private
  public
    constructor create;
    function _abreVincIntermPag: Boolean;
  end;

  TValeCupomPrgFid = class(TDataset_OOP)
  private
  public
    constructor create;
    function _abreValeCupomPrgFid(pCodCliente: Integer; pUtilizados: boolean = false): Boolean; overload;
    function _abreValeCupomPrgFid(pNdoc: Integer; pTipoDoc: string; pUtilizados: boolean = false): Boolean; overload;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure _marcaDesmarcaLinha;
  end;

  TVincIntermPag = class(TDataset_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
    procedure _cadVincIntermPag(pTipoForm: Integer; idcadinttran: string);
    function _abreVincIntermPag: Boolean;
    function retornaControleIntermediador(pLocalVnd: string; pInter: string): Integer;
    function retornaCondPagIntermediador(pLocalVnd: string; pInter: string): Integer;
    function vincularIntermediadorControle(idMetodoPag: Integer; localvendaEC, intermediadorEC, idcadinttran: string; codControleEC: Integer; codCondPagEC: Integer): boolean;
  var
    vControleIntermPag: TControleIntermPag;
    vCondPagIntermPag: TCondPagIntermPag;
  end;

  TIntermPag = class(TDataset_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
    procedure _cadIntermPag(pTipoForm: Integer);
    function _abreIntermPag: Boolean;
    function _defineSqlAdicional: boolean;
  var
    vVincIntermPag: TVincIntermPag;
    rConsultas: RConsultas;
  end;

  TComunicacaoFormaPagamento = class
  private
    buscas: TIBQuery;
  public
    constructor create;
    function iniciaFormaPagamentoIntegracao(pNumeroDaVenda: integer; pSerie, pTipoDoc: string): boolean;
    function iniciaPlanoPagamentoIntegracao(pNumeroDaVenda: integer; pSerie, pTipoDoc: string): boolean;
    function cancelaFormaPagamentoIntegracao(pNumeroDaVenda: integer; pSerie, pTipoDoc: string): boolean;
    function iniciaFormaPagamento(numeroDaVenda, codigoDaCondicaoPagamento, subSerie,
      codigoDoCliente, codigoDoVendedor: integer; tipoDoc: string; valorDaVenda: Currency): boolean;
    function iniciaPlanoDePagamento(numeroDaVenda, codigoDoCliente, codigoDoVendedor: integer;
      valorBruto, maxPercDesc, percentualDesconto: Currency; tipoVarAta, tipoVenda: string;
      var valorPlano: Currency;pTipoOS:string): boolean; overload;
    function iniciaPlanoDePagamento: boolean; overload;
    function visualizarComprovanteCartao(pNumeroDaVenda: integer; pTipoDoc: string; pSeqForm: Integer): boolean; overload;
  var
    valorpago: currency;
  end;

  TJurosPlano_2 = class(TDataSet_OOP)
  private
    procedure TaxaJurosPlano2BeforePost(DataSet: TDataSet);
  public
    taxas: RTaxas;
    constructor create;
    function selecionaJuros(nPrestacoes: integer): boolean;
    function abreTodas: boolean;
    function salvaTaxas(nPrestacoes: integer): boolean;
  end;

  TPlanoPagamento_2 = class(TDataSet_OOP)
  private
    FValor: array of Currency;
    FData: array of string;
    procedure calcDesconto;
    function verificaLimiteDeCredito: boolean;
    function abreFormEntrada(valorParcela: Currency): Currency;
  public
    vDadosPlano: RDadosPlano;
    vJuros: TJurosPlano_2;
    vCont: TControleFP;
    constructor create;
    destructor destroy; override;
    function gerarPlanoPagamento2(valorDaOperacao, valorDesconto,
      percentual_desconto_maximo: Currency; pNumero_venda,
      pCodigo_cliente, pCodigo_vendedor: integer; pTipo_venda: string): Boolean;
    function getTaxa: Double;

    function calcularDesconto: boolean;
    function gerarParcelas(listaBox: TListBox): boolean; overload;
    function gerarParcelas(valor_da_parcela: Currency; listaBox: TListBox): boolean; overload;
    function alterarParcela(indice: integer; valor: Currency; data: string): boolean;
    function salvarPlanoPagamento: boolean;
  end;

  TBoletasFP = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaBoletasFp(pNumNf, pSerie: integer): boolean;
    function selecionaBoletasOSFp(pNumOS: integer): boolean;
  end;

  TPlanoPagamento = class(TDataSet_OOP)
  private
    FempValorAdicionalFinanceira: Currency;
    FnumeroDeParcelas: Integer;
    FempTaxaCartao: Currency;
    FempPrazoMedioVenda: Integer;
    FempPercentualVendaCartao: Double;
    FvalorVendaBruto: Currency;
    FpercentualDesconto: Currency;
    FvalorDesconto: Currency;
    FempCustoBoleto: Currency;
    FvalorEntrada: Currency;
    FintervaloParcelas: Integer;
    FempDiasRecebimentoFinanceira: Integer;
    FmaximoPercentualDesconto: Double;
    FempTaxaCartaoParcelado: Currency;
    FempDiasPrecoTabela: Integer;
    FprazoEntrada: Integer;
    FnumeroVenda: Integer;
    FnumeroVendaEcommerce: Integer;
    FprazoPrimeiraParcela: Integer;
    FcodigoCliente: Integer;
    FtipoDocVenda: string;
    FempValorVendaMinimoParaFinanciamento: Currency;
    FvalorVendaLiquido: Currency;
    FcodigoVendedor: Integer;
    FvalorDaParcela: Currency;
    FtipoVarejoAtacado: string;
    FcontNomeControle: string;
    FcontCodigoControle: Integer;
    FcontTipoDePlano: string;
    FcontDocumentos: string;
    FformasCliente: string;

    FModoVenda: Boolean;
    FempTaxaJuros: Double;
    FnumParc: integer;
    FvalorCalculo, FvalorTotalGerado, FvalorDaEmpresa: Currency;
    FtextoPlano: TStringList;
    FempCasasDecimais: Integer;
    FempMaximoDescontoVarejo: Double;
    FempMaximoDescontoAtacado: Double;
    FDescricaotipoVnd:string;
  public
    vDadosPlano: RDadosPlano;
    property numeroVenda: Integer read FnumeroVenda;
    property numeroVendaEcommerce: Integer read FnumeroVendaEcommerce;
    property codigoCliente: Integer read FcodigoCliente;
    property codigoVendedor: Integer read FcodigoVendedor;
    property valorVendaBruto: Currency read FvalorVendaBruto;
    property percentualDesconto: Currency read FpercentualDesconto;
    property valorDesconto: Currency read FvalorDesconto;
    property maximoPercentualDesconto: Double read FmaximoPercentualDesconto;
    property tipoVarejoAtacado: string read FtipoVarejoAtacado;
    property tipoDocVenda: string read FtipoDocVenda;
    property valorVendaLiquido: Currency read FvalorVendaLiquido;
    property numeroDeParcelas: Integer read FnumeroDeParcelas;
    property prazoPrimeiraParcela: Integer read FprazoPrimeiraParcela;
    property intervaloParcelas: Integer read FintervaloParcelas;
    property valorEntrada: Currency read FvalorEntrada;
    property prazoEntrada: Integer read FprazoEntrada;
    property valorDaParcela: Currency read FvalorDaParcela;

    property empDiasPrecoTabela: Integer read FempDiasPrecoTabela;
    property empPrazoMedioVenda: Integer read FempPrazoMedioVenda;
    property empCustoBoleto: Currency read FempCustoBoleto;
    property empTaxaCartao: Currency read FempTaxaCartao;
    property empPercentualVendaCartao: Double read FempPercentualVendaCartao;
    property empTaxaCartaoParcelado: Currency read FempTaxaCartaoParcelado;
    property empDiasRecebimentoFinanceira: Integer read FempDiasRecebimentoFinanceira;
    property empValorAdicionalFinanceira: Currency read FempValorAdicionalFinanceira;
    property empValorVendaMinimoParaFinanciamento: Currency read
      FempValorVendaMinimoParaFinanciamento;
    property empTaxaJuros: Double read FempTaxaJuros;
    property empCasasDecimais: Integer read FempCasasDecimais;
    property empMaximoDescontoVarejo: Double read FempMaximoDescontoVarejo;
    property empMaximoDescontoAtacado: Double read FempMaximoDescontoAtacado;
    property DescricaotipoVnd : string read FDescricaotipoVnd;

    property contCodigoControle: Integer read FcontCodigoControle;
    property contNomeControle: string read FcontNomeControle;
    property contTipoDePlano: string read FcontTipoDePlano;
    property contDocumentos: string read FcontDocumentos;

    property textoPlano: TStringList read FtextoPlano;
    //

    constructor Create;
    function iniciaAtributos(numeroDaVenda, codigoDoCliente, codigoDoVendedor: integer;
      valorBruto, percentualDoDesconto, maxPercDesc: Currency; tipoVarAta, tipoVenda,pTipoOS: string):
      boolean;
    function atribuirDadosDoFormularioParaAtributos: boolean;
    procedure atribuirAtributosParaFormulario;
    procedure habilitarControlePlanoPagamento;
    function gerarPlano: boolean;
    function gerarPlanoPeloValorDaParcela: boolean;
    function confirmarPlano: boolean;
    function verificaPrazo: boolean;
    function getValorPlano: Currency;
    function selecionaPlanoPagamento(numDaVenda: integer; tipoDaVenda: string): boolean;
  var
    vEmp: TEmpresaPlano;
    vControle: TControleFP;
    vJuros: TJurosFP;
    vCondPag: TCondPagFP;
  end;

  TEmpresaPlano = class(TDataSet_OOP)
  public
    constructor create;
    function abreEmpresa: boolean;
  end;

  TTerminalAdmCartao_FP = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTerminais: boolean;
  end;

  TBandeiraCartao_FP = class(TDataSet_OOP)
  public
  	constructor create;
    function _abreBandeiraCartao: boolean;
  end;

  TFormPag2 = class(TDataSet_OOP)
  private
  	FnumRecibo: Integer;
  	FlocalvendaEC: string;
    FintermediadorEC: string;
    FcodControleEC: Integer;
    FcreditoCondicaoPagamento: string;
    FreciboNumeroRecibo: Integer;
    FvalorTotalRecibos: Currency;
    Fcontabil: Boolean;
    FcreditoQtdeParcelas: Integer;
    FvalorTotalCreditos: Currency;
    FvalorTotalCheques: Currency;
    FvalorVenda: Currency;
    FchequeDataVencimento: TDate;
    FvalorTotalCarteira: Currency;
    FvalorTroco: Currency;        
    FvalorTotalDinheiro: Currency;
    FchequeNumeroCheque: string;
    FcreditoNomeTerceiro: string;
    FchequeNomeTerceiro: string;
    FchequeNumeroBanco: string;
    FchequeNomeBanco: string;
    FcreditoJurosUtil: Currency;
    FcreditoImprimirCarne: Boolean;
    FvalorInformado: Currency;
    FchequeConta: string;
    FchequeAgencia: string;
    FcarteiraHistorico: string;
    FreciboValorRecibo: Currency;
    FcreditoCodigoTerceiro: integer;
    FcarteiraValorDinheiro: Currency;
    FchequeCodigoTerceiro: Integer;
    FcreditoHistorico: string;
    FchequeHistorico: string;
    FvalorQueFaltaInformar: Currency;
    FcreditoValorCredito: Currency;
    FcreditoValorCreditoLiq: Currency;
    FchequeValorCheque: Currency;
    FnumeroVenda: Integer;
    FnumeroVendaEcommerce: Integer;
    FcodigoCondicaoPagamento: Integer;
    Fsub_Serie: Integer;
    FcodigoCliente: Integer;
    FcodigoVendedor: Integer;
    FtipoVenda: string;
    FnomeCliente: string;
    FformasCliente: string;
    FcondicoesCliente: string;
    Falteracao: Boolean;
    FCodLocacoes: string;
    FNumFatura, FNum_Nf, FSerie_Nf, FCod_ClienteNf, FCtrlVND, FCondPagVND, fCarga, fCodNF, FNCupom: integer;
    fValorDescAVista: Extended;
    fValorValeCompraAutomatico: Extended;
    fReimprimirBoletosAlterados: Boolean;
    FRegrasDescontos,FCtrlRegrasDescontos :string;
    FMaxDataParcela:double;
    fSecao: Integer;// variavel utilizada para agrupar as parcelas para o cartao
    fControlesBoleto: string;//armazena os controles configurados como boleto, variavel usada para definir uma sequencia de numero de documento para todas as boletas
    fDataBase: TDate; //data base vindo das prestações, maior data de venda das prestações selecionadas

    vDocumento: array of string;
    vValor: array of Currency;
    vValorLiq: array of Currency;
    vValorMin, vValorMax: Currency;
    vData: array of string;
    vQtde: integer;
    vDtSet: TClientDataSet;
    FcreditoAutCartao: string;
    fcreditoNSUTransacao: string;
    fcreditoCodTermAdmCartao: string;
    fcreditoTermAdmCartao: string;
    fcreditoCodBandeiraAdmCartao: Integer;
    fcreditoBandeiraAdmCartao: string;

    FStringPlano: TStringList;

    vseqform: Integer;
    vPlano: TPlanoPagamento;

    FRef_Frete, FRef_MTUsadas, fGerouFormaBoleto: Boolean;
    buscas2: TIBQuery;
    fCtrl: TClientDataSet;
    vCountRel_1, vCountRel_2: Integer;
    FlkCondPag: TDadosLookUp_OOP;
    Fcod_nfce, Fnfce_num_nf: Integer;
    FbotaoTefAtivo: Boolean;
    procedure limpaParcelamento;
    procedure ArredondaParcela(Valor: Currency; Quant: Integer);
    function BuildHistorico(ndocVenda: string = ''; emptyCampos: Boolean = False): string;

    function insert: boolean; override;
    procedure somarDocumentos;
    function selecionaFormaPagamento: boolean; overload;
    function selecionaFormaPagamento(nVenda, subSerie: integer; tipoDoc: string): boolean; overload;
    function getHistorico: string;
    function getDadosBancarios(codigoCliente: integer): boolean;
    function existeRecebimentoDinheiro: boolean;
    procedure cadastraContas;
    function VerificarReciboDevolucao(codigoCliente: integer; tipoDoc: string): boolean;
    function VerificarValeProgFid: boolean;
    function PlanoValeProgFid: boolean;

    function receberEmCarteira(pFormasEC: boolean = false): boolean;
    function receberEmCheque(pFormasEC: boolean = false): boolean;
    function receberEmCredito(pFormasEC: boolean = false): boolean;

    procedure verificaPlano;
    procedure verificaPlanoNF;
    function verificaBoletos: Boolean;
    function verificaPedidoCanceladoEcommerce: Boolean;
    function verificaLocacao: boolean;
    function verificaValeContaCorrente: Boolean;
    function verificaIssRetidoNFSe: boolean;
    function verificaRetencaoTributosFederais: boolean;
    function verificaCartao: Boolean;
    function atualizarPlanoPag: boolean;
    procedure verificaNF;
    function verificaValeCompraDevolucao: Boolean;
    function verificaReciboAntecipadoNotaFiscal: Boolean;

    function getCampoPipe(plinha: string; pOrdem: integer): string;
    function validaPlanoVeiculos: Boolean;
    function montarLancamentoMTUsadas: Boolean;
    function montarOSLancamentoRetorno: Boolean;
    function montarOSLancamentoInterm: Boolean;
    procedure cliquePromissoriasFormDetalhe(Sender: TObject);
    procedure cliqueCarneFormDetalhe(Sender: TObject);
    procedure cliqueReciboFormDetalhe(Sender: TObject);
    function _verificaBoletosOS: Boolean;
    procedure _verificaComissaoRecebimento_Proporcional;
    procedure removerRecibodoLancamento(pRecibo: Integer);
    function confirmaRecibosEHistorico: Boolean;
    function usarTransacaoPOSVirtualComoFormaPagamento(pTerminalAdm: string): Boolean;
    function validaInclusaoNovosBoletos: Boolean;
    procedure refazerNumDocumentoBoletos;
    function getCountParcelasBoleto: Integer;
    function validarPossivelTroco(DuranteConfirmacao: Boolean = False): Boolean;
    procedure limparCamposFormulario;
  public
    constructor create;
    destructor Destroy; override;
    function delete: boolean; override;
    procedure dtSetCalcFields(DataSet: TDataSet);
    function cancelUpdates: boolean; override;
    function removerLancamentoValeProgFid: boolean;
    procedure atribuirDadosDoFormularioParaAtributos;
    procedure atribuirAtributosParaFormulario;
    procedure detalhamentoVenda(numeroVenda: integer; tipVenda: string; codigoUnificada: Integer = 0); overload;
    procedure detalhamentoVenda(numeroVenda: integer; serieNf, tipVenda: string; codigoUnificada: Integer = 0); overload;
    procedure apagaFormaDePagamento(numeroVenda: integer; tipVenda: string); overload;
    procedure apagaFormaDePagamento(numeroNf: integer; serieNf, tipVenda: string); overload;

    function iniciaAtributos(numeroDaVenda, codigoDaCondicaoPagamento, subSerie,
      codigoDoCliente, codigoDoVendedor: integer; tipoDoc: string; valorDaVenda: Currency): boolean;
    function _mdiAberto(pNomeFormMDI: string; pMensagem: string = ''): Boolean;
    function abreFormRecibo: boolean;
    function montarParcelamento(pECommerce: boolean = false): boolean;
    procedure alterarParcelamentos;
    procedure cancelar;
    procedure verificaTerceiro;
    function _validaPoliticasDescontos(pCreditoCH_Valor: Currency;pQtdParcelas:integer;pDataVencimento:TDate=0;pDeletar:boolean=false): boolean;

    function habilitaControlesFormaPagamento(chamarTEF: Boolean; pFormasEC: boolean = false; pUtilizarVale: boolean = false): Boolean;
    function habilitaControlesFormaPagamentoEC: Boolean;
    function habilitaControlesFormaPagamentoValeProgFid(AOperacao: TOperacaoRecibo; pValorVale: Double): Boolean;
    procedure habilitaControleRecibos;
    procedure habilitaControleEcommerce;
    procedure habilitaControleProgFid;
    function salvarDadosInformados(pFormasEC: boolean = false): boolean;
    function confirmaFormaPagamento: boolean;
    function setarPontosProgFidelidade(pDebito: boolean = false): boolean;
    function atualizarNumDocRecProgFid(pCancelar: boolean = false): boolean;
    function imprimirReciboPontosProgFidelidade(pNumeroVenda: Integer; pTipoVenda: string; pDebito: boolean = false): boolean;
    function receberRecibo(AOperacao: TOperacaoRecibo = orNormal): boolean;
    function lancarTarifaInterm(AOperacao: TOperacaoRecibo = orNormal): boolean;
    function utilizarCreditoEC(AOperacao: TOperacaoRecibo = orNormal; pLancarTarifa: boolean = false): boolean;
    function utilizarValePrgFid(AOperacao: TOperacaoRecibo = orNormal): boolean;
    function retornaControleIntermediador(pLocalVnd: string; pInter: string): Integer;
    function vincularIntermediadorControle: boolean;
    function _abreValeFuncionario: Boolean;

    procedure TitleBandPromissoriaBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure TitleBandPromissoriaDetBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure TitleBandCarneDetBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  	procedure TitleBandReciboDetBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
    procedure imprimePromissoria;
    procedure imprimeCarne;
    procedure GeraBoleta(NumBoletas: Integer);
    procedure imprimePromissoriaFormDetalhe;
    procedure imprimeCarneFormDetalhe;
    procedure imprimeReciboFormDetalhe;

    function cancelaVenda(pNumeroVenda: integer; tipVenda: string; pSerieNF: string = '';
    	ReaberturaVenda: Boolean = False; GravarRegApag: Boolean = False): boolean;
    function deletarFormPag(pBuscas: TIBQuery): Boolean;
    function verificaOSRetorno(pTipoVenda: string; pNumVenda: integer): boolean;
    function incluirLancamentoAvulso(valor: Currency; codControle: integer; nplanoContas:
      Double; ptpDocs, ptipDocs, historico, tipLanc, entSaida, troco: string; ndoc: integer):
      boolean;
    function cancelarLancamento(codLancamento: integer): boolean;
    function _abreFormContasBancarias: Boolean;
    function _selecionaControles: Boolean;
    function _abreFormPesquisa: Boolean;
    procedure gravaConfiguracoesRegistro(Consulta: TClientDataSet);
    procedure leConfiguracoesRegistro(Consulta: TClientDataSet);
    function efetuarTransacaoCartaoPOSVirtual: Boolean;
    function usarTransacaAvulsaPOSVirtual: Boolean;
    function cl_abreExtrato_form(ACodCliente: Integer): boolean;
    procedure HandleBotaoTefAtivo;
    function _existeControlesPadrao: boolean;
    function _existeCondPagPadrao(pTipo: string): boolean;

    property alteracao: Boolean read Falteracao write Falteracao;
    property contabil: Boolean read Fcontabil;
    property sub_Serie: Integer read Fsub_Serie;
    property codigoCondicaoPagamento: Integer read FcodigoCondicaoPagamento;
    property codigoCliente: Integer read FcodigoCliente;
    property nomeCliente: string read FnomeCliente;
    property formasCliente: string read FformasCliente;
    property condicoesCliente: string read FcondicoesCliente;
    property codigoVendedor: Integer read FcodigoVendedor;
    property numeroVenda: Integer read FnumeroVenda;
    property numeroVendaEcommerce: Integer read FnumeroVendaEcommerce;
    property tipoVenda: string read FtipoVenda;
    property valorVenda: Currency read FvalorVenda;
    property valorInformado: Currency read FvalorInformado;
    property valorQueFaltaInformar: Currency read FvalorQueFaltaInformar;
    property valorTroco: Currency read FvalorTroco;
    property valorTotalCarteira: Currency read FvalorTotalCarteira;
    property valorTotalCheques: Currency read FvalorTotalCheques;
    property valorTotalCreditos: Currency read FvalorTotalCreditos;
    property valorTotalRecibos: Currency read FvalorTotalRecibos;
    property regrasDesconto : string read FRegrasDescontos;
    property ctrlregrasDesconto : string read FCtrlRegrasDescontos;
    property MaxDataParcela : double read FMaxDataParcela;
    property cod_nfce: Integer read Fcod_nfce write Fcod_nfce;

    property carteiraValorDinheiro: Currency read FcarteiraValorDinheiro;
    property carteiraHistorico: string read FcarteiraHistorico;

    property chequeNumeroCheque: string read FchequeNumeroCheque;
    property chequeValorCheque: Currency read FchequeValorCheque;
    property chequeDataVencimento: TDate read FchequeDataVencimento;
    property chequeNumeroBanco: string read FchequeNumeroBanco;
    property chequeNomeBanco: string read FchequeNomeBanco;
    property chequeAgencia: string read FchequeAgencia;
    property chequeConta: string read FchequeConta;
    property chequeCodigoTerceiro: Integer read FchequeCodigoTerceiro;
    property chequeNomeTerceiro: string read FchequeNomeTerceiro;
    property chequeHistorico: string read FchequeHistorico;

    property numRecibo: Integer read FnumRecibo write FnumRecibo;
    property localvendaEC: string read FlocalvendaEC write FlocalvendaEC;
    property intermediadorEC: string read FintermediadorEC write FintermediadorEC;
    property codControleEC: Integer read FcodControleEC write FcodControleEC;

    property creditoValorCredito: Currency read FcreditoValorCredito;
    property creditoValorCreditoLiq: Currency read FcreditoValorCreditoLiq;
    property creditoQtdeParcelas: Integer read FcreditoQtdeParcelas;
    property creditoCondicaoPagamento: string read FcreditoCondicaoPagamento;
    property creditoCodigoTerceiro: integer read FcreditoCodigoTerceiro;
    property creditoNomeTerceiro: string read FcreditoNomeTerceiro;
    property creditoHistorico: string read FcreditoHistorico;
    property creditoImprimirCarne: Boolean read FcreditoImprimirCarne;
    property creditoJurosUtil: Currency read FcreditoJurosUtil;
    property creditoAutCartao: string read FcreditoAutCartao;
    property nsuTransacao: string read fcreditoNSUTransacao;
    property CodTermAdmCartao: string read fcreditoCodTermAdmCartao;
    property TermAdmCartao: string read fcreditoTermAdmCartao;
    property CodBandeiraAdmCartao: Integer read fcreditoCodBandeiraAdmCartao;
    property BandeiraAdmCartao: string read fcreditoBandeiraAdmCartao;

    property reciboNumeroRecibo: Integer read FreciboNumeroRecibo;
    property reciboValorRecibo: Currency read FreciboValorRecibo;

    property lkCondPag: TDadosLookUp_OOP read FlkCondPag write FlkCondPag;
    property botaoTefAtivo: Boolean read FbotaoTefAtivo;
  var
    vRecibo: TReciboFP;
    vEcommerce: TECommerce;
    vControle: TControleFP;
    vBanco: TBancoFP;
    vJuros: TJurosFP;
    vCondPag: TCondPagFP;
    //    vFecDiaCxl: TFechDiaCxlFP;
    vLancCxl: TLancamentoCxlFP;
    vFunc: TFuncionarios;
    vContabanc: TContasBancariasForPag;
    vTermCartao: TTerminalAdmCartao_FP;
    vBandCartao: TBandeiraCartao_FP;
    vVincIntermPag: TVincIntermPag;
    vValeCupomPrgFid: TValeCupomPrgFid;
    vClienteFPG: RClientes; //Variaveis de configuracao do cliente
  end;

  TBancoFP = class(TDataSet_OOP)
  public
    constructor create;
    function getTodos: boolean;
  end;

  TCondPagFP = class(TDataSet_OOP)
    constructor create;
    function getTodos(numeroVenda: Integer; tipoVenda: string): boolean;
    function existeCondicao(codigo: integer): boolean; overload;
    function existeCondicao(descricao: string): boolean; overload;
    function insereNovaCondicao(descricao: string): boolean;
    function selecionaCondicao(codigo: integer): boolean;
    function montaCondPag(lista: TComboBox; codigoCondicao: integer; numeroVenda: Integer; tipoVenda: string): string;
  end;

  TControleFP = class(TDataSet_OOP)
  private
    changedSql: Boolean;
    comandControlesFP: string;
    procedure onCalcFields(DataSet: TDataSet);
  public
    constructor create;
    function selecionaControlesFormPag(pControlesCliente: string; pControleVenda: Integer = 0;
      pMostrarNaoGeraFinanEBxAuto: Boolean = True;pCtrlRegrasDescontos:string=''): boolean; overload;
    function selecionaControlesFormPag(codigoFinalizador: integer): boolean; overload;
    function selecionaControlesBoleto(pCodigoControle: integer): boolean;
    function selecionaControlesEntrada: boolean;

    procedure HandleBoletoTEF(controleId: Integer; idCarteiraDigital, idPSP, titulo: string);
    procedure RestoreComandFP;

    function IsTEF: Boolean;
  end;

  TFuncionarios = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTodosFuncionarios: boolean; overload;
    function _verificarFuncionarios(pcod_vendedor: Integer): boolean;
  end;

  TJurosFP = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaJuros(numeroPrestacoes: integer; jurosPraticado: double): boolean; overload;
    function selecionaJuros(numeroPrestacoes: integer): boolean; overload;
  end;

  THistRecFP = class(TDataSet_OOP)
  private
    Fseqid: Integer;
  public
    constructor create;
    function selecionaHistRec(codigo: integer): boolean; overload;
    function selecionaHistRec: boolean; overload;
    function gravaHistorico(numRecibo, numVenda: integer; valorRecibo, valorBaixa: Currency;
      dataRecebimento: TDate; recAnt, tpDoc, historico, tpBaixa: string; CodUnificada: Integer): boolean;
  end;

  TECommerce = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaFormasEcommerce(pNped: Integer; pTipo: string): boolean;
    function somatorioEcommerce (
    	pNped: Integer;
  		pTipo: string): Currency; overload;
    function somatorioEcommerce(
    	pNped: Integer;
  		pTipo: string;
      localVnd: string;
      intermPag: string): Currency; overload;
    function retornaTipoDocCtrl(localVnd: string; intermPag: string): string;
    procedure marcaEcommerce;
  var
  	vSQL: string;
  end;

  TReciboFP = class(TDataSet_OOP)
  private
    valorPendenteRecibo: Currency;
  public
    fTempPesquisa: TClientDataSet;
    constructor create;
    destructor destroy; override;
    function marcaRecibo: boolean;
    function desmarcaRecibo: boolean;
    function selecionaRecibosAntecipados: boolean; overload;
    function selecionaRecibosAntecipados(pWhereSql: string): boolean; overload;
    function somatorioRecibos: Currency;
    function baixaRecibo(nVenda: integer; tpDoc: string; vrRestante: Currency; pCodCliente: Integer; pFP: TFormPag2; AOperacao: TOperacaoRecibo): Currency;
    function getValorRecibo: Currency;
    function getValorPendenteRecibo: Currency;
    function emitirValeCredito: boolean;
    procedure removerRecibodoLancamento(pRecibo, pNDocAnt: Integer; pValor: Extended; pTipoNDocAnt: string);
    function defineCampos(vDtSet: TClientDataSet): boolean;
    procedure Pesquisar(Vcamp: string; Vcond: string; Pardata: string; Vexata: boolean; vquery: TclientDataSet; vOrdenar: boolean = false; pOrdem: string = '');
  var
    vHistRec: THistRecFP;
    vCampoPesq: string; //Conteúdo do campo de pesquisa selecionado (Atributo utilizado para pesquisa de prestações)
    vFimSql: string; //Fim do select (Atributo utilizado para pesquisa de prestações)
  end;

  TFechDiaCxlFP = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaDiaCxl: boolean;
    function alteraSaldo(tipo: string; valor: Currency): boolean;
  end;

  TLancamentoCxlFP = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaLancamento: boolean; overload;
    function selecionaLancamento(codLancamento: integer): boolean; overload;
    function insereLancamento(tipoDoc, entSaida, troco, historico: string; valor: Currency; ndoc:
      integer; pNRecibo: Integer = 0; taxaInterm: string = ''): boolean;
    function cancelarLancamento(codLancamento: integer): boolean;
  end;

  TContasBancariasForPag = class(TDataSet_OOP)
  public
    constructor create;
    function _selecionaContasBancarias(pCodigoCliente: Integer): Boolean;
  end;

  TMontarPacelamentoStr = function (ACodCP: Integer; ADescrCP: string; AValor: Currency; ANumDoc: string;
    ATipoParcelamento: string = ''; AModalidade: string = ''; ACondiderarDiaUtil: string = '';
    ADiaBase: string = ''; ACodCliente: Integer = 0; AJurosPrat: Double = 0 ;
    ADiaSimulacao: TDate = 0; ACodCtrl: Integer = 0; Asilent: Boolean = False): string;

implementation

uses uDtmFormPag, uFormPag2, Dialogs, DateUtils, uValorRecibo,
  uEditMoeda, uDadosIni, IBDatabase, uDetalhamento, IBCustomDataSet, uDtmAtivo,
  Windows, uParcela, Spin, uPlanoPag, Math, SysUtils, uGerarPlanoV2,
  UClassesBoleto, uPadrao, Variants, Registry, StrUtils, MaskUtils,
  uCadIntermediadoresPag, uVincIntermPag, ExtCtrls, DBCtrls, config_sistema_class,
  uSelectControle, conf_historicos_class, hw_utils, Query_OOP;

function formpag_pedvenda_gerarforma(ANumPed: Integer; ATipo: string): Double;
var
  AForma: TComunicacaoFormaPagamento;
begin
  Result := -1;
  AForma := TComunicacaoFormaPagamento.create;
  try
    try
      Application.CreateForm(TfrmFormPag2, frmFormPag2);
      try
        obFormPag2.SqlOpen('select nped, tipo, cod_cond_pag, cod_cliente, cod_vendedor, valor_total, cod_nfce' +
          ' from pedvenda' +
          ' where nped = ' + IntToStr(ANumPed) +
          ' and tipo = ' + QuotedStr(Trim(ATipo)) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa);

        with frmFormPag2 do
        begin
          Form_PreparaTela;
          obFormPag2.cod_nfce := obFormPag2.buscas.FieldByName('cod_nfce').AsInteger;
          if obFormPag2.iniciaAtributos(ANumPed,
                                        obFormPag2.buscas.FieldByName('cod_cond_pag').AsInteger,
                                        0,
                                        obFormPag2.buscas.FieldByName('cod_cliente').AsInteger,
                                        obFormPag2.buscas.FieldByName('cod_vendedor').AsInteger,
                                        Trim(ATipo),
                                        RoundTo(obFormPag2.buscas.FieldByName('valor_total').AsFloat, -2)) then
            if ShowModal = mrOk then
              Result := obFormPag2.valorInformado;
        end;
      finally
        if Assigned(frmFormPag2) then
          FreeAndNil(frmFormPag2);
      end;
    except
    	on E: Exception do
      begin
      	Application.MessageBox(pchar('Erro ao gerar forma. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
        vDadosIni.registraErro('uClasseFP.formpag_gerarforma_pedvenda ' + e.Message);
      end;
    end;

  finally
    FreeAndNil(AForma);
  end;
end;

procedure formpag_pedvenda_detalhesforma(ANumPed: Integer; ATipo: string);
var
  AFormPag: TFormPag2;
begin
  AFormPag:= TFormPag2.Create;
  try
    AFormPag.detalhamentoVenda(ANumPed, '', ATipo);
  finally
    FreeAndNil(AFormPag);
  end;
end;

exports
  formpag_pedvenda_gerarforma,
  formpag_pedvenda_detalhesforma;

{ TJurosFP }

constructor TJurosFP.create;
begin
//  if vDadosIni.vSistema = 'Fiscal' then
//  begin
//    buscas := TIBQuery(dtmFP.qrBuscasHwF);
//    DataSet := TClientDataSet(dtmFP.cdsJurosF);
//    transacao := TIBTransaction(dtmFP.transacaoHwF);
//  end
//  else
  begin
    buscas := TIBQuery(dtmFP.qrBuscas);
    DataSet := TClientDataSet(dtmFP.cdsJuros);
    transacao := TIBTransaction(dtmFP.transacao);
  end;
end;

function TJurosFP.selecionaJuros(numeroPrestacoes: integer; jurosPraticado: double): boolean;
begin
  result := montaSelect('SELECT * FROM TABJUROS WHERE NPREST_J = ' + IntToStr(numeroPrestacoes) +
    ' and JUROS_J = ' + StringReplace(StringReplace(FloatToStr(jurosPraticado), '.', '',
    [rfReplaceAll]), ',', '.', []) + ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo=1');
end;

function TJurosFP.selecionaJuros(numeroPrestacoes: integer): boolean;
begin
  result := montaSelect('SELECT * FROM TABJUROS WHERE NPREST_J = ' + IntToStr(numeroPrestacoes) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1');
end;

{ TBancoFP }

constructor TBancoFP.create;
begin
//  if vDadosIni.vSistema = 'Fiscal' then
//  begin
//    buscas := TIBQuery(dtmFP.qrBuscasHwF);
//    DataSet := TClientDataSet(dtmFP.cdsBancoF);
//    transacao := TIBTransaction(dtmFP.transacaoHwF);
//  end
//  else
  begin
    buscas := TIBQuery(dtmFP.qrBuscas);
    DataSet := TClientDataSet(dtmFP.cdsBanco);
    transacao := TIBTransaction(dtmFP.transacao);
  end;
end;

function TBancoFP.getTodos: boolean;
begin
  result := montaSelect('select * from CODIGO_BANCO');
end;

{ TControleFP }

constructor TControleFP.create;
begin
//  if vDadosIni.vSistema = 'Fiscal' then
//  begin
//    buscas := TIBQuery(dtmFP.qrBuscasHwF);
//    DataSet := TClientDataSet(dtmFP.cdsControleF);
//    transacao := TIBTransaction(dtmFP.transacaoHwF);
//  end
//  else
  begin
    buscas := TIBQuery(dtmFP.qrBuscas);
    DataSet := TClientDataSet(dtmFP.cdsControle);
    transacao := TIBTransaction(dtmFP.transacao);
    dataSet.OnCalcFields := onCalcFields;
    changedSql := False;
  end;
end;

function TControleFP.selecionaControlesFormPag(
  pControlesCliente: string; pControleVenda: Integer; pMostrarNaoGeraFinanEBxAuto: Boolean;pCtrlRegrasDescontos:string): boolean;
var
  vSql, vSql2: string;
  ConfigPoliticaPag: TConfig_sistema_class;
  vUsarControlesVenda: string;
begin
  try
  	ConfigPoliticaPag := TConfig_sistema_class.getConf('ped_vnd_definir_politica_pagamento', buscas, vDadosIni.cod_empresa);
  	vUsarControlesVenda := UpperCase(ConfigPoliticaPag.ReadString('CONTROLE', 'Usar'));
    
    try
      vSql2 :='';
      vSql := ' SELECT * FROM CONTROLES ' +
        ' WHERE CXENT = ''S'' ' +
        ' AND ATIVO = 1 ' +
        ' AND CODIGO_EMP = ' + vDadosIni.codEmpresa;

      if (pControleVenda > 0) and (vUsarControlesVenda = 'S') then
        vSql2 := ' AND CODIGO_CTRL = ' + IntToStr(pControleVenda)
      else if (Trim(pControlesCliente) <> '') and (vDadosIni.vEmp.vUsarControlesCliente = 'S') then
        vSql2 := ' AND CODIGO_CTRL IN ' + pControlesCliente;

      if vDadosIni.vEmp.vUsarPoliticasDesc and (trim(pCtrlRegrasDescontos)<>'') then
         vSql2 := vSql2 + ' AND CODIGO_CTRL IN ' + pCtrlRegrasDescontos;

      if vDadosIni.vEmp.vFinanceiroUnificado then
        vSql2 := vSql2 + ' AND (COALESCE(CONTROLE_VISIVEL, ''S'') = ''S'') ';

      if pMostrarNaoGeraFinanEBxAuto then
      begin
        vSql := vSql + ' AND COALESCE(NAO_GERA_FINAN, '''') <> ''S''' +
          ' AND COALESCE(BAIXA_AUTOMATICA, '''') <> ''S''';
      end;

      Result := montaSelect(vSql + vSql2 + ' ORDER BY QSEQPERF');

    except
      result := montaSelect(vSql + ' ORDER BY QSEQPERF');
    end;

    Result := (not DataSet.IsEmpty);
  finally
    if Assigned(ConfigPoliticaPag) then
      FreeAndNil(ConfigPoliticaPag);
  end;
end;

procedure TControleFP.HandleBoletoTEF(controleId: Integer;
  idCarteiraDigital, idPSP, titulo: string);
var
  showForm: Boolean;
begin

  comandControlesFP := dataSet.CommandText;
  idCarteiraDigital := Trim(idCarteiraDigital);
  idPSP := Trim(idPSP);
  showForm := False;

  if idCarteiraDigital <> '' then
  begin

    // Validando o controle do parametro
    if controleId > 0 then
    begin
      if idPSP <> '' then
      begin
        if Self.filterStr('codigo_ctrl = %d and docs = ''N'' and tef_tipo = 1 and tef_id_psp = ''%s''',
                          [controleId, idPSP])
                          .dataSet.RecordCount = 1 then
          Exit;
      end
      else
      if Self.filterStr('codigo_ctrl = %d and docs = ''N'' and tef_tipo = 1 and tef_id_cartdig = ''%s''',
                         [controleId, idCarteiraDigital]).dataSet.RecordCount = 1 then
          Exit;
    end;

    if idPSP <> '' then
    begin
      if Self.filterStr('docs = ''N'' and tef_tipo = 1 and tef_id_psp = ''%s''', [idPSP])
        .dataSet.RecordCount = 1 then
        Exit;
    end;

    // Caso o controle acima não corresponda então vai selecionar o proximo que tenha os parametros iguais
    Self.filterStr('docs = ''N'' and tef_tipo = 1 and tef_id_cartdig = ''%s''', [idCarteiraDigital]);

    if dataSet.RecordCount = 1 then
      Exit
    else if dataSet.RecordCount > 1 then
      showForm := True
    else
    begin
      // abre todos os controles disponiveis e seleciona
      ClientOpen('select * from controles' +
                 ' where cxent = ''S'' and ativo = 1 and codigo_emp = %d',
                 [vDadosIni.cod_empresa]);
      changedSql := True;

      if idPSP <> '' then
      begin
        if Self.filterStr('docs = ''N'' and tef_tipo = 1 and tef_id_psp = ''%s''', [idPSP])
          .dataSet.RecordCount = 1 then
          Exit;
      end;

      // procurando a carteira de pagamento configurada
      Self.filterStr('docs = ''N'' and tef_tipo = 1 and tef_id_cartdig = ''%s''', [idCarteiraDigital]);

      if dataSet.RecordCount = 1 then
        Exit
      else if dataSet.RecordCount > 1 then
        showForm := True
      else // nao encontrou entao deixa todos tipo N
        Self.filterStr('docs = ''N''');

      if dataSet.RecordCount = 1 then
        Exit
      else if dataSet.RecordCount > 1 then
        showForm := True;
    end;
  end
  else
  begin
    // Validando o tipo de campo TEF
    Self.filterStr('codigo_ctrl = %d and docs = ''S2'' and tef_tipo = 1', [controleId]);

    if dataSet.RecordCount = 1 then
      Exit;

    // Caso nao tenha o TIPO definido valida da forma antiga
    Self.filterStr('codigo_ctrl = %d and docs = ''S2'' and tp_plano = ''C''', [controleId]);

    if dataSet.RecordCount = 1 then
      Exit;

    // Caso o controle acima não corresponda então vai selecionar o proximo que tenha os parametros iguais
    Self.filterStr('docs = ''S2'' and tef_tipo = 1');

    if dataSet.RecordCount = 1 then
      Exit
    else if dataSet.RecordCount > 1 then
      showForm := True
    else
    begin   
      // abre todos os controles disponiveis e seleciona
      ClientOpen('select * from controles' +
                 ' where cxent = ''S'' and ativo = 1 and codigo_emp = %d',
                 [vDadosIni.cod_empresa]);
      changedSql := True;

      Self.filterStr('docs = ''S2'' and tef_tipo = 1');

      if dataSet.RecordCount = 1 then
        Exit
      else if dataSet.RecordCount > 1 then
        showForm := True
      else // nao encontrou entao deixa todos tipo N
        Self.filterStr('docs = ''S2''');

      if dataSet.RecordCount = 1 then
        Exit
      else if dataSet.RecordCount > 1 then
        showForm := True;
    end;
  end;

  if showForm then
  begin
    Application.CreateForm(TfrmSelectControle, frmSelectControle);
    frmSelectControle.pnValorTransacao.Caption := titulo;

    frmSelectControle.ShowModal;// = IDOK;
  end;

end;

function TControleFP.IsTEF: Boolean;
begin
  Result := False;

  if vDadosIni.GetIni('TEF', 'POSVirtual', 'N') <> 'S' then
    Exit;

  Result := (fempty('tef_tipo') and fequals('tp_plano', 'C')) or
            (fequals('tef_tipo', '1')); // 0 = Nenhum/Nao, 1 = Sim (Cartao ou Carteiras digitais)
end;

procedure TControleFP.onCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('QSEQPERF_TEMP').AsInteger := DataSet.FieldByName('QSEQPERF').AsInteger;
  if DataSet.FieldByName('QSEQPERF_TEMP').AsInteger = 0 then
    DataSet.FieldByName('QSEQPERF_TEMP').AsInteger := 9999;
end;

procedure TControleFP.RestoreComandFP;
begin                           
  Self.filterClear;
  if changedSql then
  begin
    ClientOpen(comandControlesFP);
    changedSql := False;
  end;
end;

function TControleFP.selecionaControlesBoleto(pCodigoControle: integer): boolean;
begin
  result := montaSelect(' SELECT * FROM CONTROLES ' +
  	' WHERE CXENT = ''S''' +
    ' AND USAR_BOLETO = ''S'' ' +
    ' AND CODIGO_CTRL = ' + IntToStr(pCodigoControle) +
    ' AND ATIVO = 1 ' +
    ' AND CODIGO_EMP = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, ' AND (COALESCE(CONTROLE_VISIVEL, ''S'') = ''S'') ', '') +
    ' AND COALESCE(NAO_GERA_FINAN, '''') <> ''S''' +
    ' AND COALESCE(BAIXA_AUTOMATICA, '''') <> ''S''' +
    ' ORDER BY QSEQPERF');
  Result := (not DataSet.IsEmpty);
end;

function TControleFP.selecionaControlesEntrada: boolean;
begin
  result := montaSelect(' SELECT * FROM CONTROLES ' +
  	' WHERE CXENT = ''S'' ' +
    ' AND DOCS = ''N'' ' +
    ' AND ATIVO = 1 ' +
    ' AND CODIGO_EMP = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, ' AND (COALESCE(CONTROLE_VISIVEL, ''S'') = ''S'') ', '') +
    ' AND COALESCE(NAO_GERA_FINAN, '''') <> ''S''' +
    ' AND COALESCE(BAIXA_AUTOMATICA, '''') <> ''S''' +
    ' ORDER BY QSEQPERF');
end;

function TControleFP.selecionaControlesFormPag(
  codigoFinalizador: integer): boolean;
begin
  result := montaSelect(' SELECT * FROM CONTROLES ' +
  	' WHERE CXENT = ''S'' ' +
    ' AND COD_FINALIZADOR = ' + IntToStr(codigoFinalizador) +
    ' AND ATIVO = 1 ' +
    ' AND CODIGO_EMP = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, ' AND (COALESCE(CONTROLE_VISIVEL, ''S'') = ''S'') ', '') +
    ' AND COALESCE(NAO_GERA_FINAN, '''') <> ''S''' +
    ' AND COALESCE(BAIXA_AUTOMATICA, '''') <> ''S''' +
    ' ORDER BY QSEQPERF');
  Result := (not IsEmpty);
end;

{ THistRecFP }

constructor THistRecFP.create;
begin
  DataSet := TClientDataSet(dtmFP.cdsHistRec);
  transacao := TIBTransaction(dtmFP.transacao);
  buscas := TIBQuery(dtmFP.qrBuscas);
  Fseqid := 0;
end;

function THistRecFP.gravaHistorico(numRecibo, numVenda: integer; valorRecibo,
  valorBaixa: Currency; dataRecebimento: TDate; recAnt, tpDoc,
  historico, tpBaixa: string; CodUnificada: Integer): boolean;
begin
  try
    if not dataSet.Active then
      selecionaHistRec;

    dataSet.Filter :=  'RECANT = ' + QuotedStr(recAnt) + ' and NDOCANT = ' + IntToStr(numVenda) +
     	' and NRECIBO = ' + IntToStr(numRecibo);

    if (vDadosIni.vEmp.vFinanceiroUnificado) and (CodUnificada > 0) then
	    dataSet.Filter := dataSet.Filter + ' and COD_EMPRESA = ' + IntToStr(CodUnificada);

    try
      dataSet.Filtered := True;
      if (dataSet.FieldByName('RECANT').AsString = recAnt) and
        (dataSet.FieldByName('NDOCANT').AsInteger = numVenda) then
      begin
        dataSet.Edit;
        dataSet.FieldByName('COD_UNIFICADA').AsInteger := CodUnificada;
        dataSet.FieldByName('VALOR_BAIXA').AsCurrency := dataSet.FieldByName('VALOR_BAIXA').AsCurrency + valorBaixa;
        dataSet.FieldByName('TP_DOC_BAIXA').AsString := tpDoc;
        dataSet.FieldByName('TP_BAIXA').AsString := tpBaixa;
        if tpBaixa = 'T' then
          dataSet.FieldByName('VALOR_RECIBO').AsCurrency := 0;
        dataSet.Post;
        result := True;
        Exit;
      end;
    finally
      dataSet.Filtered := False;
    end;
    
    Insert;
    dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('COD_UNIFICADA').AsInteger := CodUnificada;
    dataSet.FieldByName('NRECIBO').AsInteger := numRecibo;
    dataSet.FieldByName('VALOR_BAIXA').AsCurrency := valorBaixa;
    dataSet.FieldByName('VALOR_RECIBO').AsCurrency := valorRecibo;
    dataSet.FieldByName('DATA_REC').AsDateTime := dataRecebimento;
    dataSet.FieldByName('RECANT').AsString := recAnt;
    dataSet.FieldByName('NDOCANT').AsInteger := numVenda;

    if vDadosIni.vEmp.vModoFaturamento = 'S' then
      dataSet.FieldByName('DATA_BAIXA').AsDateTime := vDadosIni.diaAbertoCxl
    else
      dataSet.FieldByName('DATA_BAIXA').AsDateTime := vDadosIni.getDataBanco(buscas); //vDadosIni.diaFFinanceiro;

    dataSet.FieldByName('HISTORICO_REC').AsString := historico;
    dataSet.FieldByName('COD_US').AsInteger := vDadosIni.vCodUsuario;
    if vDadosIni.vSistema = 'Cxl' then
	    dataSet.FieldByName('OP_CXL').AsInteger := vDadosIni.vCodUsuario;
    Inc(Fseqid);
    dataSet.FieldByName('SEQCAD_REC').AsInteger := Fseqid;//GenCodigo('HIST_REC', dtmFP.SpIncCodigo,
      //vDadosIni.codEmpresa);
    dataSet.FieldByName('TP_DOC_BAIXA').AsString := tpDoc;
    dataSet.FieldByName('TP_BAIXA').AsString := tpBaixa;
    if tpBaixa = 'T' then
      dataSet.FieldByName('VALOR_RECIBO').AsCurrency := 0;
    Result := Post;
  except
    on e: exception do
    begin
      result := false;
      Application.MessageBox(pchar('EFPG0021 Erro ao gravar historico do recibo. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('EFPG0021 ' + e.Message);
    end;
  end;
end;

function THistRecFP.selecionaHistRec: boolean;
var
  vDt: TDate;
begin
  vDt := vDadosIni.getDataBanco(buscas);
  result := montaSelect('select * from hist_rec where data_baixa = :data and data_baixa = :data1' +
    vDadosIni.IfThen((not vDadosIni.vEmp.vFinanceiroUnificado),
      ' and cod_empresa = ' + vDadosIni.codEmpresa,
      ' and cod_empresa in ' + vDadosIni.vEmp.vCodigoUnificadas) +
    ' and ativo = 1', vDt, vDt);
end;

function THistRecFP.selecionaHistRec(codigo: integer): boolean;
begin
  result := montaSelect('select * from hist_rec where nrecibo = ' + IntToStr(codigo) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 1');
end;

{ TReciboFP }

function TReciboFP.baixaRecibo(nVenda: integer; tpDoc: string;
  vrRestante: Currency; pCodCliente: Integer; pFP: TFormPag2; AOperacao: TOperacaoRecibo): Currency;
var
  valorBaixado: Currency;
  valorTemp: Currency;
  valorInformado: Currency;
  valorRecibo: Currency;
  pRecibo: Integer;
  pCodEmpresa: Integer;
  vOK: Boolean;
  vTemp: string;
begin
  valorBaixado := 0;
  vTemp := 'Confirma Baixa de Recibo numero ' +
      vDadosIni.IfThen(dataSet.FieldByName('num_rec_dep').AsString = '',
      dataSet.FieldByName('nrecibo').AsString,
      dataSet.FieldByName('num_rec_dep').AsString) + '?';

  if AOperacao <> orNormal then
    vOK := True
  else
    vOK := Application.MessageBox(pchar(vTemp),
      'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES;

  if AOperacao = orNormal then
  if pCodCliente <> dataSet.FieldByName('COD_DEVEDOR').AsInteger then
  begin
    if not vDadosIni.PesqPros('FPG027', 'VALIDAR',
    tpDoc + ' ' + IntToStr(nVenda) + ' CLIENTE ' +IntToStr(pCodCliente) +
    ' CLIENTE REC ' +IntToStr(dataSet.FieldByName('COD_DEVEDOR').AsInteger),
     'FORMPAGAMENTO', '', dtmFP.qrBuscas, True) then
    begin
     Result := 0;
     Exit;
    end;
  end;

  if vOK then
  begin
    if AOperacao = orNormal then
      Application.CreateForm(TfrmValorRecibo, frmValorRecibo);
    try
      if (DataSet.FieldByName('selec').AsString = 'S') then
      begin
        valorPendenteRecibo := RoundTo(vrRestante, -2); //- valorBaixado;
        if (RoundTo(DataSet.FieldByName('valor').AsFloat, -2) > RoundTo(valorPendenteRecibo, -2))
          and (AOperacao <> orValeDevolucao) then
          valorTemp := RoundTo(valorPendenteRecibo, -2)
        else
          valorTemp := RoundTo(DataSet.FieldByName('valor').AsFloat, -2);

        if AOperacao = orNormal then
        begin
          frmValorRecibo.edValor.Valor := valorTemp;
          frmValorRecibo.Label1.Caption := 'Recibo Nº ' +
          vDadosIni.IfThen(dataSet.FieldByName('num_rec_dep').AsString = '',
          DataSet.FieldByName('nrecibo').AsString,
          dataSet.FieldByName('num_rec_dep').AsString);
          if frmValorRecibo.ShowModal  <> mrOk then
          	Exit;
        end;

        pRecibo := DataSet.FieldByName('nrecibo').AsInteger;
        pCodEmpresa := DataSet.FieldByName('cod_empresa').AsInteger;

        if AOperacao = orNormal then
          try
            pFP.dataSet.Filter := 'REC_NUMVEND = ' + IntToStr(DataSet.FieldByName('nrecibo').AsInteger) + ' and REC_TIPVEND = ''REC''';
            pFP.dataSet.Filtered := True;

            if (pFP.dataSet.FieldByName('recibo').AsString = 'S') and
              (pFP.dataSet.FieldByName('REC_NUMVEND').AsInteger = DataSet.FieldByName('nrecibo').AsInteger) then
            begin
              frmValorRecibo.edValor.Valor := frmValorRecibo.edValor.Valor +
              		RoundTo(pFP.dataSet.FieldByName('VALORDOC').AsFloat, -2);
              pFP.removerRecibodoLancamento(DataSet.FieldByName('nrecibo').AsInteger);//,
  //              pFP.dataSet.FieldByName('VALORDOC').AsFloat);
            end;
          finally
            pFP.dataSet.Filtered := False;
            pFP.dataSet.Filter := '';
          end;

        if vDadosIni.vEmp.vFinanceiroUnificado then
          DataSet.IndexFieldNames := 'NRECIBO;COD_EMPRESA'
        else
	        DataSet.IndexFieldNames := 'NRECIBO';
        if vDadosIni.vEmp.vFinanceiroUnificado then
          FindNearest([pRecibo, pCodEmpresa])
        else
	        FindNearest([pRecibo]);

        if AOperacao = orNormal then
          valorInformado := RoundTo(frmValorRecibo.edValor.Valor, -2)
        else if (AOperacao = orAntecipado) then
          valorInformado := RoundTo(vrRestante, -2)
        else if (AOperacao = orValeLocacao)
         and (RoundTo(DataSet.FieldByName('valor').AsCurrency, -2) > RoundTo(vrRestante, -2))  then
           valorInformado := RoundTo(vrRestante, -2)
        else
          valorInformado := RoundTo(DataSet.FieldByName('valor').AsCurrency, -2);
        valorRecibo := RoundTo(DataSet.FieldByName('valor').AsCurrency, -2);
        if RoundTo(valorInformado, -2) = RoundTo(valorRecibo, -2) then
        begin
          valorBaixado := valorBaixado + RoundTo(valorInformado, -2);
          dataSet.Edit;
          if vHistRec.gravaHistorico(DataSet.FieldByName('nrecibo').AsInteger,
            nVenda,
            RoundTo(DataSet.FieldByName('valor').AsCurrency, -2),
            RoundTo(valorInformado, -2),
            DataSet.FieldByName('data_rec').AsDateTime, DataSet.FieldByName('recant').AsString,
            tpDoc, 'BAIXA TOTAL CONF. ' + tpDoc + ' Nº ' +
            vDadosIni.StrZero(nVenda, 5), 'T',
            DataSet.FieldByName('cod_empresa').AsInteger) then
          begin
            DataSet.FieldByName('status_rec').AsString := 'RECEBIDO';
            if vDadosIni.vEmp.vModoFaturamento = 'S' then
              DataSet.FieldByName('DATA_BAIXA').AsDateTime := vDadosIni.diaAbertoCxl
            else
              DataSet.FieldByName('DATA_BAIXA').AsDateTime := vDadosIni.getDataBanco(buscas); //vDadosIni.diaFFinanceiro;
            DataSet.FieldByName('valor').AsCurrency :=
              RoundTo(DataSet.FieldByName('valor').AsCurrency, -2);
            DataSet.FieldByName('NDOCANT').AsInteger := nVenda;
            DataSet.FieldByName('HISTORICO_REC').AsString := 'RECIBO QUITADO CONF. ' + tpDoc +
              ' Nº ' + vDadosIni.strzero(nVenda, 5);
            DataSet.FieldByName('SELEC').AsString := '';
          end;
        end
        else
        begin
          if AOperacao = orNormal then
          if vDadosIni.vRecibo.ParcMinRestFormpag > 0  then
            if (RoundTo(vDadosIni.vRecibo.ParcMinRestFormpag, -2) >
            	RoundTo(dataSet.FieldByName('VALOR').AsCurrency, -2) - RoundTo(valorInformado, -2)) then
            begin
              Application.MessageBox(pchar('Valor restante do recibo ao realizar baixa parcial não deve ser menor que R$ ' +
              	Format('%0.2n', [vDadosIni.vRecibo.ParcMinRestFormpag]) + '!' + #13 +
	              'Valor restante R$ ' + Format('%0.2n', [dataSet.FieldByName('VALOR').AsCurrency - valorInformado]) + '.'),
                'Informação', MB_OK + MB_ICONINFORMATION);

              if not vDadosIni.PesqPros('REC020', 'PERMITIR - R$ ' + Format('%0.2n', [vDadosIni.vRecibo.ParcMinRestFormpag]),
               'PERMITIR ' + tpDoc + ' ' + IntToStr(nVenda), 'RECIBOS', dataSet.FieldByName('NRECIBO').AsString, buscas, true) then
              begin
                Result := 0;
                exit;
              end;
            end;

          dataSet.Edit;
          if vHistRec.gravaHistorico(DataSet.FieldByName('nrecibo').AsInteger, nVenda,
            RoundTo(DataSet.FieldByName('valor').AsCurrency, -2),
            RoundTo(valorInformado, -2),
            DataSet.FieldByName('data_rec').AsDateTime, DataSet.FieldByName('recant').AsString,
            tpDoc, 'BAIXA PARCIAL CONF. ' + tpDoc + ' Nº ' + vDadosIni.StrZero(nVenda, 5), 'P',
            DataSet.FieldByName('cod_empresa').AsInteger) then
            DataSet.FieldByName('VALOR').AsCurrency := DataSet.FieldByName('VALOR').AsCurrency -
              RoundTo(valorInformado, -2);
        end;
        DataSet.FieldByName('SELEC').AsString := '';
        if (dataSet.FieldByName('data_rec').AsDateTime = vDadosIni.getDataBanco(buscas)) and
          (dataSet.FieldByName('deprec').AsString = 'E') and
          (dataSet.FieldByName('recant').AsString = 'S') then
          dataSet.FieldByName('recant').AsString := 'O';
        dataSet.post;
      end;
      Result := RoundTo(valorBaixado, -2);
      if AOperacao = orNormal then
      begin
        frmValorRecibo.Free;
        frmValorRecibo := nil;
      end;
    except
      on e: exception do
      begin
        result := 0;
        CancelUpdates;
        Application.MessageBox(pchar('EFPG0022 Erro ao efetuar baixa de recibos. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
        registraErro('EFPG0022 ' + e.Message);
      end;
    end;
  end; // if MessageDlg
  Result := RoundTo(valorInformado, -2);
end;

constructor TReciboFP.create;
begin
  DataSet := TClientDataSet(dtmFP.cdsRecibo);
  transacao := TIBTransaction(dtmFP.transacao);
  buscas := TIBQuery(dtmFP.qrBuscas);
  vHistRec := THistRecFP.create;
  IndexFieldNames := 'NRECIBO';

  dataSet.FieldByName('COD_EMP_MULT').Tag := IfThen(vDadosIni.vEmp.vFinanceiroUnificado, 0, 1);
  dataSet.FieldByName('NUM_REC_DEP').Tag := IfThen(vDadosIni.vRecibo.HabRecPorDepart, 0, 1);
end;

function TReciboFP.marcaRecibo: boolean;
begin

  if vDadosIni.vLocacao.vHabilitarLoc then
    if DataSet.FieldByName('cod_locacao').AsInteger > 0 then
    begin
      if trim(DataSet.FieldByName('selec').AsString) = '' then
      begin
        if not vDadosIni.PesqPros('FPG040', 'PERMITIR', '',
          'RECIBOS', DataSet.FieldByName('NRECIBO').AsString, buscas) then
        begin
          Application.MessageBox(pchar('Recibo antecipado gerado por locação. Não é permitido utilizar'), 'Informação', MB_OK + MB_ICONINFORMATION);
          exit;
        end;
      end;
    end;
  
  if (trim(DataSet.FieldByName('selec').AsString) = '') and (DataSet.FieldByName('NRECIBO').AsInteger < 100000) then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select * from formpagamento' +
      ' where nrequisicao = ' + IntToStr(DataSet.FieldByName('NRECIBO').AsInteger) +
      ' and tpdocs = ''REC'' ' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;
    if buscas.IsEmpty then
      if not vDadosIni.PesqPros('FPG035', 'VALIDAR', 'REC:' + DataSet.FieldByName('NRECIBO').AsString + ' SEM FORMAS',
        'RECIBOS', DataSet.FieldByName('NRECIBO').AsString, buscas) then
        Exit;
  end;

  if not IsEmpty then
  begin
    Edit;
    if DataSet.FieldByName('selec').AsString = 'S' then
      DataSet.FieldByName('selec').AsString := ''
    else
      DataSet.FieldByName('selec').AsString := 'S';
    post;
  end;
end;

procedure TReciboFP.Pesquisar(Vcamp: string; Vcond: string; Pardata: string; Vexata: boolean; vquery: TclientDataSet; vOrdenar: boolean = false; pOrdem: string = '');
begin
  if Vexata then
    dataset.Locate(vcamp, pardata, [])
  else
    dataset.Locate(vcamp, pardata, [loCaseInsensitive, loPartialKey]);
  if vOrdenar then
   dataset.IndexFieldNames := pOrdem;
end;

procedure TReciboFP.removerRecibodoLancamento(pRecibo, pNDocAnt: Integer;
  pValor: Extended; pTipoNDocAnt: string);
begin
  vHistRec.dataSet.Filter := 'nrecibo = ' + IntToStr(pRecibo) + ' and ndocant = ' + IntToStr(pNDocAnt) +' and tp_doc_baixa = ' + QuotedStr(pTipoNDocAnt);
  vHistRec.dataSet.Filtered := True;
  try
    while (pRecibo =  vHistRec.dataSet.FieldByName('nrecibo').AsInteger) and
      (pNDocAnt =  vHistRec.dataSet.FieldByName('ndocant').AsInteger) and
      (Trim(pTipoNDocAnt) =  Trim(vHistRec.dataSet.FieldByName('tp_doc_baixa').AsString)) do
      vHistRec.dataSet.Delete;
  finally
    vHistRec.dataSet.Filtered := False;
  end;

  dataSet.Filter := 'nrecibo = ' + IntToStr(pRecibo);
  dataSet.Filtered := True;
  try
    if pRecibo =  dataSet.FieldByName('nrecibo').AsInteger then
    begin
      dataSet.Edit;
      if DataSet.FieldByName('status_rec').AsString = 'RECEBIDO' then
      begin
        dataSet.FieldByName('status_rec').Value := Null;
        dataSet.FieldByName('DATA_BAIXA').Value := Null;
        dataSet.FieldByName('valor').AsCurrency := RoundTo(dataSet.FieldByName('valor').AsCurrency, -2);
        dataSet.FieldByName('NDOCANT').Value := Null;
        dataSet.FieldByName('HISTORICO_REC').Value := Null;
      end
      else
        dataSet.FieldByName('valor').AsCurrency := RoundTo(dataSet.FieldByName('valor').AsCurrency +
          pValor, -2);
      dataSet.Post;
    end;
  finally
    dataSet.Filtered := False;
  end;
end;

destructor TReciboFP.destroy;
begin
  vHistRec.Free;
  inherited;
end;

function TReciboFP.emitirValeCredito: boolean;
var
  Arquivo: TextFile;
  NumDocumento, CodCliente, NomeCliente, NomeVendedor, vopera, ValorNota, Cidade: string;
  NomeEmpresa, EndEmpresa, CEPEmpresa, CidadeEmpresa, UFEmpresa, InscEstadual, CNPJ, FoneEmpresa:
  string;
begin
  buscas.Close;
  buscas.SQL.Text := 'select cidade_emp, nome_emp, endreco_emp, cep_emp, sigla_uf, ie_emp, cgc_emp,'
    +
    ' telefone_emp from empresa inner join estados on estados.codigo_uf = empresa.uf_emp' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  NumDocumento := vDadosIni.strzero(dataSet.FieldByName('NRECIBO').AsInteger, 5);
  CodCliente := vDadosIni.strzero(dataSet.FieldByName('COD_BENEF').AsInteger, 5);
  NomeCliente := dataSet.FieldByName('BENEF_CLIENT').AsString;
  NomeVendedor := vDadosIni.vNomeFuncionario;
  //  vopera
  ValorNota := format('%n', [dataSet.FieldByName('VALOR').AsFloat]);
  Cidade := buscas.FieldByName('CIDADE_EMP').AsString;
  NomeEmpresa := buscas.FieldByName('NOME_EMP').AsString;
  EndEmpresa := buscas.FieldByName('ENDRECO_EMP').AsString;
  CEPEmpresa := buscas.FieldByName('CEP_EMP').AsString;
  CidadeEmpresa := buscas.FieldByName('CIDADE_EMP').AsString;
  UFEmpresa := buscas.FieldByName('SIGLA_UF').AsString;
  InscEstadual := buscas.FieldByName('IE_EMP').AsString;
  CNPJ := buscas.FieldByName('CGC_EMP').AsString;
  FoneEmpresa := buscas.FieldByName('TELEFONE_EMP').AsString;
  buscas.close;

  AssignFile(Arquivo, vDadosIni.vPortaImpressora); // este parâmetro
  //  AssignFile(Arquivo, '\\AUXILIAR1\EasyCode');
  Rewrite(Arquivo);
  WriteLn(Arquivo, 'N');
  WriteLn(Arquivo, 'q560');
  WriteLn(Arquivo, 'Q0,0');
  WriteLn(Arquivo, 'ON');
  WriteLn(Arquivo, 'D8');
  WriteLn(Arquivo, 'JF');
  WriteLn(Arquivo, 'A540,15,1,3,1,1,N,"VALE NUMERO: ' + NumDocumento + '"');
  WriteLn(Arquivo, 'A500,15,1,3,1,1,N,"DATA: ' + FormatDateTime('dd/mm/yyyy', Date) +
    ' - VENCIMENTO: SEM LIMITE"');
  WriteLn(Arquivo, 'A460,15,1,3,1,1,N,"CLIENTE: ' + CodCliente + '-' + NomeCliente + '"');
  WriteLn(Arquivo, 'A420,15,1,3,1,1,N,"VENDEDOR(A): ' + NomeVendedor + '"');
  WriteLn(Arquivo, 'A380,15,1,2,1,1,N,"ESTE VALE E INTRANSFERIVEL, PODENDO SER "');
  WriteLn(Arquivo, 'A360,15,1,2,1,1,N,"USADO EM NOVAS COMPRAS ATE O SEU VENCIMENTO!"');
  //  WriteLn(Arquivo, 'A340,15,1,2,1,1,N,"O SEU VENCIMENTO!"');
  WriteLn(Arquivo, 'A320,15,1,3,1,1,N,"VALOR: ' + Format('%m', [StrToFloat(ValorNota)]) + '"');
  WriteLn(Arquivo, 'A300,15,1,2,1,1,N,"' + UpperCase(Copy(vDadosIni.Extenso(StrToFloat(ValorNota)),
    1, 50)) + '"');
  WriteLn(Arquivo, 'A280,15,1,2,1,1,N,"' + UpperCase(Copy(vDadosIni.Extenso(StrToFloat(ValorNota)),
    51, 100)) + '"');

  WriteLn(Arquivo, 'A240,15,1,2,1,1,N,"' + Cidade + ', ' + FormatDateTime('dd/mm/yyyy', Date) +
    '"');
  WriteLn(Arquivo,
    'A180,15,1,1,1,1,N,"_____________________________________________________________"');
  WriteLn(Arquivo, 'A160,15,1,3,1,1,N,"' + NomeVendedor + '"');

  WriteLn(Arquivo, 'A120,15,1,2,1,1,N,"' + NomeEmpresa + '"');
  WriteLn(Arquivo, 'A100,15,1,2,1,1,N,"' + EndEmpresa + '  CEP: ' + CEPEmpresa + '"');
  WriteLn(Arquivo, 'A80,15,1,2,1,1,N,"' + CidadeEmpresa + ' - ' + UFEmpresa + '"');
  WriteLn(Arquivo, 'A60,15,1,2,1,1,N,"INSC. ESTADUAL: ' + InscEstadual + ' - CNPJ: ' + CNPJ + '"');
  WriteLn(Arquivo, 'A40,15,1,2,1,1,N,"FONE: ' + FoneEmpresa + '"');
  WriteLn(Arquivo, 'LO20,695,520,3'); //Linha invisível
  WriteLn(Arquivo, 'P1');
  CloseFile(Arquivo);
end;

function TReciboFP.getValorPendenteRecibo: Currency;
begin
  Result := valorPendenteRecibo;
end;

function TReciboFP.getValorRecibo: Currency;
begin
  result := DataSet.FieldByName('valor').AsCurrency;
end;

function TReciboFP.defineCampos(vDtSet: TClientDataSet): boolean;
var
 I: Integer;
begin
  if fTempPesquisa = nil then
    fTempPesquisa := TClientDataSet.Create(nil);

  fTempPesquisa.Close;
  fTempPesquisa.FieldDefs.Clear;
  frmFormPag2.ComboBox1.Clear;
  for I := 0 to vDtSet.FieldDefs.Count - 1 do
  begin
     fTempPesquisa.FieldDefs.Add(
       vDtSet.FieldDefs[i].Name,
       vDtSet.FieldDefs[i].DataType,
       vDtSet.FieldDefs[i].Size,
       false);
  end;
  fTempPesquisa.CreateDataSet;
  fTempPesquisa.EmptyDataSet;
  for I := 0 to vDtSet.FieldCount -1 do
  begin
     if vDtSet.Fields[i].Visible then
     begin
       fTempPesquisa.FieldByName(vDtSet.Fields[i].FieldName).DisplayLabel :=
         vDtSet.Fields[i].DisplayLabel;
       frmFormPag2.ComboBox1.Items.Add(vDtSet.Fields[i].DisplayLabel);
     end;
  end;
  frmFormPag2.ComboBox1.ItemIndex := 0;
end;

function TReciboFP.desmarcaRecibo: boolean;
begin
  if not dataSet.IsEmpty then
  begin
    Edit;
    DataSet.FieldByName('selec').AsString := '';
    post;
  end;
end;

function TReciboFP.selecionaRecibosAntecipados: boolean;
begin
  if vDadosIni.vRecibo.HabRecPorDepart then
    result := montaSelect('select ' +
      ' case when (trim(coalesce(r.num_rec_dep, '''')) <> '''') then r.num_rec_dep ' +
      ' 		  else r.nrecibo end num_rec_dep, r.* from recibos r ' +
      ' where ((r.recant = ''S'') or (r.recant = ''O'')) ' +
      ' and ((r.status_rec is null) or (r.status_rec = '''')) ' +
      vDadosIni.IfThen((not vDadosIni.vEmp.vFinanceiroUnificado),
      ' and r.cod_empresa = ' + vDadosIni.codEmpresa,
      ' and r.cod_empresa in ' + vDadosIni.vEmp.vCodigoUnificadas) +
      ' and r.ativo = 1 ' +
      ' order by r.nome_dev, r.data_rec desc, r.cod_emp_mult ')
  else
    result := montaSelect(' select * from recibos ' +
    	' where ((recant = ''S'') or (recant = ''O'')) ' +
      ' and ((status_rec is null) or (status_rec = '''')) ' +
      vDadosIni.IfThen((not vDadosIni.vEmp.vFinanceiroUnificado),
      ' and cod_empresa = ' + vDadosIni.codEmpresa,
      ' and cod_empresa in ' + vDadosIni.vEmp.vCodigoUnificadas) +
      ' and ativo = 1 ' +
      ' order by nome_dev, data_rec desc, cod_emp_mult ');
end;

function TReciboFP.selecionaRecibosAntecipados(pWhereSql: string): boolean;
begin
  if vDadosIni.vRecibo.HabRecPorDepart then
 		 result := montaSelect('select ' +
      ' case when (trim(coalesce(r.num_rec_dep, '''')) <> '''') then r.num_rec_dep ' +
      ' else r.nrecibo end num_rec_dep, r.* from recibos r ' +
      ' where ((r.recant = ''S'') or (r.recant = ''O'')) ' +
      ' and ((r.status_rec is null) or (r.status_rec = '''')) ' +
      vDadosIni.IfThen((not vDadosIni.vEmp.vFinanceiroUnificado),
      ' and r.cod_empresa = ' + vDadosIni.codEmpresa,
      ' and r.cod_empresa in ' + vDadosIni.vEmp.vCodigoUnificadas) +
      ' and r.ativo = 1' + pWhereSql +
      IfThen(ContainsText(pWhereSql, 'order by'), ',', ' order by') +
      ' r.nome_dev, r.data_rec desc, r.cod_emp_mult ')
  else
    result := montaSelect(' select * from recibos ' +
    	' where ((recant = ''S'') or (recant = ''O'')) ' +
      ' and ((status_rec is null) or (status_rec = '''')) ' +
      vDadosIni.IfThen((not vDadosIni.vEmp.vFinanceiroUnificado),
      ' and cod_empresa = ' + vDadosIni.codEmpresa,
      ' and cod_empresa in ' + vDadosIni.vEmp.vCodigoUnificadas) +
      ' and ativo = 1' + pWhereSql +                                 
      IfThen(ContainsText(pWhereSql, 'order by'), ',', ' order by') +
      ' nome_dev, data_rec desc, cod_emp_mult ');
end;

function TReciboFP.somatorioRecibos: Currency;
var
  valorTemp: Currency;
begin
	try
    valorTemp := 0;
    DataSet.DisableControls;
    DataSet.First;
    while not DataSet.eof do
    begin
      if DataSet.FieldByName('selec').AsString = 'S' then
        valorTemp := valorTemp + RoundTo(DataSet.FieldByName('valor').AsFloat, -2);
      DataSet.Next;
    end;
  finally
  	DataSet.EnableControls;
  end;
  Result := valorTemp;
end;

{ TCondPagFP }

constructor TCondPagFP.create;
begin
//  if vDadosIni.vSistema = 'Fiscal' then
//  begin
//    buscas := TIBQuery(dtmFP.qrBuscasHwF);
//    DataSet := TClientDataSet(dtmFP.cdsCondPagF);
//    transacao := TIBTransaction(dtmFP.transacaoHwF);
//  end
//  else
  begin
    buscas := TIBQuery(dtmFP.qrBuscas);
    DataSet := TClientDataSet(dtmFP.cdsCondPag);
    transacao := TIBTransaction(dtmFP.transacao);
  end;
end;

function TCondPagFP.existeCondicao(codigo: integer): boolean;
begin
  result := ExecutaComandosSql(' select cond_pag.cod_cond_pag from cond_pag ' +
  	' where cond_pag.cod_cond_pag = ' + IntToStr(codigo));
end;

function TCondPagFP.existeCondicao(descricao: string): boolean;
begin
  result := ExecutaComandosSql(' select cond_pag.cod_cond_pag from cond_pag ' +
  	' where cond_pag.cod_cond_pag = ' + QuotedStr(descricao));
end;

function TCondPagFP.getTodos(numeroVenda: Integer; tipoVenda: string): boolean;
var
	ConfigPoliticaPag: TConfig_sistema_class;
  vUsarControlesVenda: string;
begin
	try
  	ConfigPoliticaPag := TConfig_sistema_class.getConf('ped_vnd_definir_politica_pagamento', buscas, vDadosIni.cod_empresa);
 		vUsarControlesVenda := UpperCase(ConfigPoliticaPag.ReadString('COND_PAG', 'Usar'));

    if (vUsarControlesVenda = 'S')
    	and ((trim(tipoVenda) = 'REQ') or (trim(tipoVenda) = 'OS')) then
    begin
      buscas.Close;
      buscas.SQL.Text := ' select cod_cond_pag from pedvenda ' +
      	' where nped = ' + IntToStr(numeroVenda) +
        ' and tipo = ' + QuotedStr(trim(tipoVenda)) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if buscas.FieldByName('COD_COND_PAG').AsInteger > 0 then
        Result := montaSelect(' SELECT COND_PAG.* FROM COND_PAG ' +
        	' where COND_PAG.COD_COND_PAG = ' + IntToStr(buscas.FieldByName('COD_COND_PAG').AsInteger))
      else
      	Result := montaSelect(' SELECT COND_PAG.* from COND_PAG ' +
                            	' INNER JOIN COND_PAG_EMPRESA on ' +
                              '   COND_PAG_EMPRESA.COD_COND_PAG = COND_PAG.COD_COND_PAG ' +
                              '	  AND COND_PAG_EMPRESA.COD_EMPRESA = ' + vDadosIni.codEmpresa +
        											' WHERE COND_PAG.ATIVO = 1 ');
    end
    else
			result := montaSelect(' SELECT COND_PAG.* from COND_PAG ' +
                          	' INNER JOIN COND_PAG_EMPRESA on ' +
                            '   COND_PAG_EMPRESA.COD_COND_PAG = COND_PAG.COD_COND_PAG ' +
                            '	  AND COND_PAG_EMPRESA.COD_EMPRESA = ' + vDadosIni.codEmpresa +
      											' WHERE COND_PAG.ATIVO = 1 ');
  finally
  	if Assigned(ConfigPoliticaPag) then
      FreeAndNil(ConfigPoliticaPag);
  end;
end;

function TCondPagFP.insereNovaCondicao(descricao: string): boolean;
begin
  try
    if not Active then
      selecionaCondicao(0);
    insert;
    DataSet.FieldByName('desc_cond_pag').AsString := descricao;
    DataSet.FieldByName('cod_cond_pag').AsInteger := Gencodigo('COND_PAG', dtmFP.SpIncCodigo,
      vDadosIni.codEmpresa);
    if Post then
      result := Apply;
  except
    on e: exception do
    begin
      result := false;
      Application.MessageBox(pchar('EFPG0020 Erro ao incluir nova Condição de Pagamento. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('EFPG0020 ' + e.Message);
    end;
  end;
end;

function TCondPagFP.montaCondPag(
	lista: TComboBox;
  codigoCondicao: integer;
  numeroVenda: Integer;
  tipoVenda: string): string;
var
  I: Integer;
begin
  result := 'NENHUMA';
  getTodos(numeroVenda, tipoVenda);
  lista.Clear;
  lista.Items.Add('NENHUMA');
  try
  	dataSet.DisableControls;
    dataSet.First;
    while not dataSet.eof do
    begin
      lista.Items.Add(DataSet.FieldByName('desc_cond_pag').AsString);
      if codigoCondicao = DataSet.FieldByName('cod_cond_pag').asinteger then
        result := Trim(DataSet.FieldByName('desc_cond_pag').AsString);
      dataSet.Next;
    end;
  finally
    dataSet.EnableControls;
  end;
  for I := 0 to lista.Items.Count - 1 do
    if Trim(Result) = Trim(lista.Items[I]) then
      lista.ItemIndex := I;
  dataSet.Close;
end;

function TCondPagFP.selecionaCondicao(codigo: integer): boolean;
begin
  result := montaSelect(' SELECT COND_PAG.* from COND_PAG ' +
  	' WHERE COND_PAG.COD_COND_PAG = ' + IntToStr(codigo));
end;

{ TFechDiaCxlFP }

function TFechDiaCxlFP.alteraSaldo(tipo: string; valor: Currency): boolean;
begin
  try
    if vDadosIni.vSistema <> 'Cxl' then
      Exit;
    if not active then
      selecionaDiaCxl;
    if not IsEmpty then
    begin
      edit;
      if tipo = 'E' then
      begin
        DataSet.FieldByName('TOT_E_CXL').AsCurrency := DataSet.FieldByName('TOT_E_CXL').AsCurrency +
          valor;
        DataSet.FieldByName('SALDO_CXL').AsCurrency := DataSet.FieldByName('SALDO_CXL').AsCurrency +
          valor;
      end
      else if tipo = 'S' then
      begin
        DataSet.FieldByName('TOT_S_CXL').AsCurrency := DataSet.FieldByName('TOT_S_CXL').AsCurrency +
          valor;
        DataSet.FieldByName('SALDO_CXL').AsCurrency := DataSet.FieldByName('SALDO_CXL').AsCurrency -
          valor;
      end;
      Post;
    end;
  except
    on e: exception do
    begin
      result := false;
      Application.MessageBox(pchar('EFPG0025 Erro ao alterar Saldo. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('EFPG0025 ' + e.Message);
    end;
  end;
end;

constructor TFechDiaCxlFP.create;
begin
  DataSet := TClientDataSet(dtmFP.cdsFDCxl);
  transacao := TIBTransaction(dtmFP.transacao);
  buscas := TIBQuery(dtmFP.qrBuscas);
end;

function TFechDiaCxlFP.selecionaDiaCxl: boolean;
begin
  if vDadosIni.vSistema <> 'Cxl' then
    Exit;
  result := montaSelect('select FIRST 1 * from fecd_cxl where op_cxl = ' + IntToStr(vDadosIni.vCodOpCxl) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa + ' order by dia_f_cxl DESC');
end;

{ TLancamentoCxlFP }

function TLancamentoCxlFP.cancelarLancamento(codLancamento: integer): boolean;
begin
  if selecionaLancamento(codLancamento) then
  begin
    if not IsEmpty then
    begin
      Delete;
      Apply;
      Result := true;
    end;
  end;
end;

constructor TLancamentoCxlFP.create;
begin
  DataSet := TClientDataSet(dtmFP.cdsLancCxl);
  transacao := TIBTransaction(dtmFP.transacao);
  buscas := TIBQuery(dtmFP.qrBuscas);
end;

function TLancamentoCxlFP.insereLancamento(tipoDoc, entSaida, troco, historico: string; valor:
  Currency; ndoc: integer; pNRecibo: Integer = 0; taxaInterm: string = ''): boolean;
begin
  try
    if not Active then
      selecionaLancamento;
    insert;
    DataSet.FieldByName('TIPO_LANC_CXL').AsString := entSaida;
    DataSet.FieldByName('SDD').AsString := 'S';
    DataSet.FieldByName('DATA_LC_CXL').AsDateTime := vDadosIni.diaAbertoCxl;
    DataSet.FieldByName('HISTORICO_CXL').AsString := historico;
    DataSet.FieldByName('VALOR_CXL').AsFloat := valor;
    DataSet.FieldByName('OP_CXL').AsInteger := vDadosIni.vCodOpCxl;
    DataSet.FieldByName('COD_LANCXL').AsInteger := Gencodigo('LANCCXL', dtmFP.SpIncCodigo,
      vDadosIni.codEmpresa);
    DataSet.FieldByName('CODIGO_EMP').AsString := vDadosIni.codEmpresa;
    if tipoDoc <> '' then
      DataSet.FieldByName('TIPO_DOC_CXL').AsString := tipoDoc;
    DataSet.FieldByName('N_DOC_CXL').AsInteger := ndoc;
    if troco <> '' then
      DataSet.FieldByName('TR').AsString := troco;
    DataSet.FieldByName('N_REC').AsInteger := pNRecibo;
    if taxaInterm <> '' then
      DataSet.FieldByName('TAXA_INTERMEDIADOR').AsString := taxaInterm;
    if pNRecibo > 0 then
      DataSet.FieldByName('REFRECIBO').AsString := 'S';    
    Result := post;
  except
    on e: exception do
    begin
      result := false;
      Application.MessageBox(pchar('EFPG0024 Erro ao incluir Lançamento. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('EFPG0024 ' + e.Message);
    end;
  end;
end;

function TLancamentoCxlFP.selecionaLancamento(codLancamento: integer): boolean;
begin
  result :=
    montaSelect('select * from lanccxl where data_lc_cxl >= :vdata1 and data_lc_cxl <= :vdata2 and op_cxl = '
    + IntToStr(vDadosIni.vCodOpCxl) + ' and codigo_emp = ' + vDadosIni.codEmpresa +
    ' and cod_lancxl = ' + IntToStr(codLancamento), vDadosIni.diaAbertoCxl, vDadosIni.diaAbertoCxl)
end;

function TLancamentoCxlFP.selecionaLancamento: boolean;
begin
  result :=
    montaSelect('select * from lanccxl where data_lc_cxl >= :vdata1 and data_lc_cxl <= :vdata2 and op_cxl = '
    + IntToStr(vDadosIni.vCodOpCxl) + ' and codigo_emp = ' + vDadosIni.codEmpresa,
    vDadosIni.diaAbertoCxl, vDadosIni.diaAbertoCxl)
end;

{ TComunicFormPag }

//function TComunicFormPag.iniciaFormaPagamento(nVenda, codCondPag, subSerie, codCliente,
//  codVendedor: integer; tipoDoc: string; valorDoc: Currency): boolean;
//begin
//  if dtmFP = nil then
//    dtmFP := TdtmFP.Create(dtmFP);
//
//  //if obFormPag = nil then
//  //  obFormPag.create;
//  result := obFormPag.iniciaFormaPagamento(nVenda, codCondPag, subSerie, codCliente,
//    codVendedor, tipoDoc, valorDoc);
//end;

{ TFormPag2 }

function TFormPag2.abreFormRecibo: boolean;
var
  hdTemp: THandle;
  formulario: TForm;
begin
   formulario := Funcoes.AbreForm('pkRecibo','TFrmCadRecibo', hdTemp);
  try
    formulario.ShowModal;
  finally
    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

procedure TFormPag2.alterarParcelamentos;
  procedure corrigeParcelamento(pAnteriores: Boolean);
  var
    I, nParcAlt, quant: Integer;
    vTipoParcelamento: string;
    resto, vr, valor: Currency;
  begin
    nParcAlt := frmFormPag2.ListBox1.ItemIndex;
    if (vDadosIni.strEstaContidoEm(Trim(vControle.dataSet.FieldByName('TIPO_PARCELAMENTO').AsString),
      ['I1', 'IN', 'T1', 'TN'] )) then // Valores validos contidos no cadastro do controle
      vTipoParcelamento := Trim(vControle.dataSet.FieldByName('TIPO_PARCELAMENTO').AsString)
    else
      vTipoParcelamento := vDadosIni.vTipoParcelamento;

    if pAnteriores then
    begin
      quant := Length(vValor) - 1;
      valor := frmFormPag2.edCreditoValorCredito.Valor - frmParcela.mValorParcelaCr.Valor;

      for I := quant - 1 downto 0 do
      begin
        if (vTipoParcelamento = 'T1') or (vTipoParcelamento = 'TN') then
          vValor[i] := Trunc(valor / quant)
        else
          vValor[i] := vDadosIni.StrToFloatFormat(
         ( 0.01 * Trunc((valor / quant)*100) ) , 2);
      end;

      if vTipoParcelamento = 'T1' then
        vValor[0] := vDadosIni.StrToFloatFormat(vValor[0] + (valor - (vValor[0] * quant)), 2)
      else if (vTipoParcelamento = 'TN') and (vValor[0] > 0) then //Caso a primeira parcela fique zerado o valor vai pra ela para ser o proximo vencimento
        vValor[quant - 1] := vDadosIni.StrToFloatFormat(vValor[quant - 1] + (valor - (vValor[quant - 1] * quant)), 2)
      else if (vTipoParcelamento = 'IN') then
        vValor[quant - 1] := vDadosIni.StrToFloatFormat(vValor[0] + (valor - (vValor[0] * quant)), 2)
      else
        vValor[0] := vDadosIni.StrToFloatFormat(vValor[0] + (valor - (vValor[0] * quant)), 2);
    end
    else
    begin
      quant := Length(vValor) - (nParcAlt + 1);
      valor := frmFormPag2.edCreditoValorCredito.Valor;
      for I := 0 to Length(vValor) - 1 do
        if I < nParcAlt then
          valor := valor - vValor[i]
        else if I = nParcAlt then
          valor := valor - frmParcela.mValorParcelaCr.Valor
        else
          Break;

      for i := (nParcAlt + 1) to Length(vValor) - 1 do
      begin
        if (vTipoParcelamento = 'T1') or (vTipoParcelamento = 'TN') then
          vValor[i] := Trunc(valor / quant)
        else
          vValor[i] := vDadosIni.StrToFloatFormat(
         ( 0.01 * Trunc((valor / quant)*100) ) , 2);
      end;

      if vTipoParcelamento = 'T1' then
        vValor[nParcAlt + 1] := vDadosIni.StrToFloatFormat(vValor[nParcAlt + 1] + (valor - (vValor[nParcAlt + 1] * quant)), 2)
      else if (vTipoParcelamento = 'TN') and (vValor[nParcAlt + 1] > 0) then //Caso a primeira parcela fique zerado o valor vai pra ela para ser o proximo vencimento
        vValor[Length(vValor) - 1] := vDadosIni.StrToFloatFormat(vValor[Length(vValor) - 1] + (valor - (vValor[Length(vValor) - 1] * quant)), 2)
      else if (vTipoParcelamento = 'IN') then
        vValor[Length(vValor) - 1] := vDadosIni.StrToFloatFormat(vValor[nParcAlt + 1] + (valor - (vValor[nParcAlt + 1] * quant)), 2)
      else
        vValor[nParcAlt + 1] := vDadosIni.StrToFloatFormat(vValor[nParcAlt + 1] + (valor - (vValor[nParcAlt + 1] * quant)), 2);
    end;
    frmFormPag2.ListBox1.Clear;
    for I := 0 to Length(vValor) - 1 do
      frmFormPag2.ListBox1.Items.Add(vDocumento[I] + '    ' + vData[I] + '           ' +
        Format('%m',
        [vValor[I]]));
  end;
var
  vCorrigirParcelamento: Boolean;

begin
  if frmFormPag2.ListBox1.Items.Count > 0 then
  begin
    if not vDadosIni.PesqPros('FPG028', 'ALTERAR',
    'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda +
    ' PARCELA: ' +  frmFormPag2.ListBox1.Items[frmFormPag2.ListBox1.ItemIndex], 'FORMPAGAMENTO', '', buscas, True) then
      Exit;
    Application.CreateForm(TfrmParcela, frmParcela);
    frmParcela.edCrDoc.Enabled := vControle.dataSet.FieldByName('USAR_BOLETO').AsString <> 'S';
    frmParcela.edCrDoc.Text := vDocumento[frmFormPag2.ListBox1.ItemIndex];
    frmParcela.edCrVenc.Text := vData[frmFormPag2.ListBox1.ItemIndex];
    frmParcela.mValorParcelaCr.Valor := vValor[frmFormPag2.ListBox1.ItemIndex];
    try
      if frmParcela.ShowModal <> mrOk then
        Exit;

      if not _validaPoliticasDescontos(frmParcela.mValorParcelaCr.Valor,1,strtodate(frmParcela.edCrVenc.Text)) then
      begin
//        cancelar;
//        frmFormPag2.grupoControle.Enabled := True;
        Exit;
      end;
//      if vDadosIni.vemp.vUsarPoliticasDesc then
//        if vDadosIni.StrToFloatFormat(frmParcela.mValorParcelaCr.Valor,2)< vValorMin then
//        begin
//          Application.MessageBox(Pchar('Parcela mínima deve ser maior ou igual a '+format('%m', [vValorMin])), 'Atenção', 0 + 64);
//          exit;
//        end;

      vCorrigirParcelamento := vDadosIni.StrToFloatFormat(vValor[frmFormPag2.ListBox1.ItemIndex], 2) <>
          vDadosIni.StrToFloatFormat(frmParcela.mValorParcelaCr.Valor, 2);

      vValor[frmFormPag2.ListBox1.ItemIndex] := frmParcela.mValorParcelaCr.Valor;
      vDocumento[frmFormPag2.ListBox1.ItemIndex] := frmParcela.edCrDoc.Text;
      vData[frmFormPag2.ListBox1.ItemIndex] := frmParcela.edCrVenc.Text;
      frmFormPag2.ListBox1.Items[frmFormPag2.ListBox1.ItemIndex] := frmParcela.edCrDoc.Text + '    ' +
        frmParcela.edCrVenc.Text + '           ' + Format('%m', [frmParcela.mValorParcelaCr.Valor]);
      vDadosIni.GravaAuditoria('FPG028', 'ALTERAR',
      'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda +
      ' MODIFICADA: ' +  frmFormPag2.ListBox1.Items[frmFormPag2.ListBox1.ItemIndex],
      'FORMPAGAMENTO', '', buscas);

      if vCorrigirParcelamento then
        vCorrigirParcelamento := ((frmFormPag2.edCreditoValorCredito.Valor - frmParcela.mValorParcelaCr.Valor) / (Length(vValor) - 1)) >= 1;

      if Length(vValor) > 1 then
        if vCorrigirParcelamento then
          if (frmFormPag2.ListBox1.ItemIndex + 1) = Length(vValor) then
          begin
            if Application.MessageBox(PChar('Deseja corrigir a(s) parcela(s) anterior(es) até completar o valor ' +
              Format('%0.2n', [frmFormPag2.edCreditoValorCredito.Valor]) + '?'), 'Confirmação',
              MB_ICONQUESTION + MB_YESNO ) = IDYES then
              corrigeParcelamento(True)
          end
          else if Application.MessageBox(PChar('Deseja corrigir a(s) parcela(s) senguinte(s) até completar o valor ' +
            Format('%0.2n', [frmFormPag2.edCreditoValorCredito.Valor]) + '?'), 'Confirmação',
            MB_ICONQUESTION + MB_YESNO ) = IDYES then
            corrigeParcelamento(False);
    finally
      FreeAndNil(frmParcela);
    end;
  end;
end;

procedure TFormPag2.apagaFormaDePagamento(numeroVenda: integer;
  tipVenda: string);
begin
  ExecutaComandosSqlExec('delete FROM FORMPAGAMENTO ' +
    ' WHERE NREQUISICAO = ' + IntToStr(numeroVenda) + ' AND' +
    ' TPDOCS = ' + QuotedStr(tipVenda) + ' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa);
  CommitaTransacao;
end;

procedure TFormPag2.apagaFormaDePagamento(numeroNf: integer; serieNf,
  tipVenda: string);
begin
  ExecutaComandosSqlExec('delete FROM FORMPAGAMENTO ' +
    ' WHERE  num_nota = ' + IntToStr(numeroNf) + ' AND' +
    ' sub_serie = ' + Trim(serieNf) + ' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa);
  CommitaTransacao;
end;

procedure TFormPag2.ArredondaParcela(Valor: Currency; Quant: Integer);
var
  resto, vr: Currency;
  i: Integer;
  vTipoParcelamento: string;
begin
  if (vDadosIni.strEstaContidoEm(Trim(vControle.dataSet.FieldByName('TIPO_PARCELAMENTO').AsString),
    ['I1', 'IN', 'T1', 'TN'] )) then // Valores validos contidos no cadastro do controle
    vTipoParcelamento := Trim(vControle.dataSet.FieldByName('TIPO_PARCELAMENTO').AsString)
  else
    vTipoParcelamento := vDadosIni.vTipoParcelamento;
  vr := 0;
  for i := 0 to Length(vValor) - 1 do
  begin
    if (vTipoParcelamento = 'T1') or (vTipoParcelamento = 'TN') then
      vValor[i] := Trunc(valor / quant)
    else
      vValor[i] := vDadosIni.StrToFloatFormat(
     ( 0.01 * Trunc((valor / quant)*100) ) , 2);
    //    vr := vr + Trunc(valor / quant);
  end;
  if vTipoParcelamento = 'T1' then
    vValor[0] := vDadosIni.StrToFloatFormat(vValor[0] + (valor - (vValor[0] * quant)), 2)
  else if (vTipoParcelamento = 'TN') and (vValor[0] > 0) then //Caso a primeira parcela fique zerado o valor vai pra ela para ser o proximo vencimento
    vValor[Length(vValor) - 1] := vDadosIni.StrToFloatFormat(vValor[Length(vValor) - 1] + (valor - (vValor[Length(vValor) - 1] * quant)), 2)
  else if (vTipoParcelamento = 'IN') then
    vValor[Length(vValor) - 1] := vDadosIni.StrToFloatFormat(vValor[0] + (valor - (vValor[0] * quant)), 2)
  else
    vValor[0] := vDadosIni.StrToFloatFormat(vValor[0] + (valor - (vValor[0] * quant)), 2);
  //  VR := vValor[0] * quant;
  //  if vr < valor then
  //    vValor[0] := vValor[0] + (Valor - vr);
end;

procedure TFormPag2.atribuirAtributosParaFormulario;
begin
  if frmFormPag2 = nil then
    exit;

  frmFormPag2.ckContabil.Checked := Fcontabil;

  frmFormPag2.edValorVenda.Valor := FvalorVenda;
  frmFormPag2.edValorInformado.Valor := FvalorInformado;
  frmFormPag2.edValorQueFaltaInformar.Valor := FvalorQueFaltaInformar;
  frmFormPag2.edValorTroco.Valor := FvalorTroco;

  frmFormPag2.edTotalCarteira.Valor := FvalorTotalCarteira;
  frmFormPag2.edTotalCheque.Valor := FvalorTotalCheques;
  frmFormPag2.edTotalCreditos.Valor := FvalorTotalCreditos;
  frmFormPag2.edTotalRecibos.Valor := FvalorTotalRecibos;

  if (frmFormPag2.PageControl1.ActivePage = frmFormPag2.tabRecibos) or
    (frmFormPag2.PageControl1.ActivePage = frmFormPag2.tabDadosRecibos) then
  begin
    frmFormPag2.edReciboNumeroRecibo.Text := IntToStr(FreciboNumeroRecibo);
    frmFormPag2.edReciboValorRecibo.Valor := FreciboValorRecibo;
    exit;
  end;

  if trim(vControle.DataSet.FieldByName('docs').AsString) = 'N' then
  begin
    frmFormPag2.edCarteiraValorCarteira.Valor := FcarteiraValorDinheiro;
    frmFormPag2.edCarteiraHistorico.Text := FcarteiraHistorico;
  end
  else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
  begin
    frmFormPag2.edChequeAgencia.Text := FchequeAgencia;
    frmFormPag2.edChequeConta.Text := FchequeConta;
    frmFormPag2.edChequeHistorico.Text := FchequeHistorico;
    frmFormPag2.edChequeNomeTerceiro.Text := FchequeNomeTerceiro;
    frmFormPag2.edChequeNumeroCheque.Text := FchequeNumeroCheque;
    frmFormPag2.edChequeNomeBanco.Text := FchequeNomeBanco;
    frmFormPag2.edChequeValorCheque.Valor := FchequeValorCheque;
    frmFormPag2.edChequeDataVencimento.Text := DateToStr(FchequeDataVencimento);
    frmFormPag2.edChequeNumBanco.Text := FchequeNumeroBanco;
    frmFormPag2.edChequeCodigoTerceiro.Valor := FchequeCodigoTerceiro;
  end
  else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S2' then
  begin
    frmFormPag2.edcreditoQtdeParcelas.Value := FcreditoQtdeParcelas;
    frmFormPag2.edcreditoCondicaoPagamento.Text := FcreditoCondicaoPagamento;
    frmFormPag2.edCreditoNomeTerceiro.Text := FcreditoNomeTerceiro;
    frmFormPag2.edCreditoHistorico.Text := FcreditoHistorico;
    frmFormPag2.edCreditoValorCredito.Valor := FcreditoValorCredito;
    frmFormPag2.edCreditoJurosUtil.Valor := FcreditoJurosUtil;
    frmFormPag2.edCreditoCodigoTerceiro.Valor := FcreditoCodigoTerceiro;

    if (trim(vControle.DataSet.FieldByName('tp_plano').AsString) = 'C') and (vTermCartao.dataSet.active) then
    begin
	    if vTermCartao.dataSet.RecordCount = 1 then
      	frmFormPag2.edcreditoCodTermAdmCartao.KeyValue := vTermCartao.dataSet.FieldByName('COD_TERM_ADM').AsString;
      if vBandCartao.dataSet.RecordCount = 1 then
      	frmFormPag2.edcreditoCodBandeiraAdmCartao.KeyValue := vBandCartao.dataSet.FieldByName('COD_BANDEIRA').AsInteger;
    end;

    frmFormPag2.edcreditoNumAutoCartao.Text := FcreditoAutCartao;
    frmFormPag2.edCreditoNSUTransacao.Text := fcreditoNSUTransacao;
    if Trim(fcreditoCodTermAdmCartao) <> '' then
      frmFormPag2.edcreditoCodTermAdmCartao.KeyValue := fcreditoCodTermAdmCartao;
    if fcreditoCodBandeiraAdmCartao > 0 then
    	frmFormPag2.edcreditoCodBandeiraAdmCartao.KeyValue := fcreditoCodBandeiraAdmCartao;
    frmFormPag2.ckCreditoImprimirCarne.Checked := FcreditoImprimirCarne;
  end;
end;

procedure TFormPag2.atribuirDadosDoFormularioParaAtributos;
begin
  if frmFormPag2 = nil then
    exit;

  Fcontabil := frmFormPag2.ckContabil.Checked;

  if (frmFormPag2.PageControl1.ActivePage = frmFormPag2.tabRecibos) or
    (frmFormPag2.PageControl1.ActivePage = frmFormPag2.tabDadosRecibos) then
  begin
    FreciboNumeroRecibo := trunc(StrToInt(frmFormPag2.edReciboNumeroRecibo.Text));
    FreciboValorRecibo := vDadosIni.StrToFloatFormat(frmFormPag2.edReciboValorRecibo.Valor, 2);
  end;
  if trim(vControle.DataSet.FieldByName('docs').AsString) = 'N' then
  begin
    FcarteiraHistorico := frmFormPag2.edCarteiraHistorico.Text;
    FcarteiraValorDinheiro := vDadosIni.StrToFloatFormat(frmFormPag2.edCarteiraValorCarteira.Valor, 2);
    exit;
  end
  else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
  begin
    FchequeDataVencimento := StrToDate(frmFormPag2.edChequeDataVencimento.Text);
    FchequeNumeroCheque := frmFormPag2.edChequeNumeroCheque.Text;
    FchequeNomeTerceiro := frmFormPag2.edChequeNomeTerceiro.Text;
    FchequeNumeroBanco := frmFormPag2.edChequeNumBanco.Text;
    FchequeNomeBanco := frmFormPag2.edChequeNomeBanco.Text;
    FchequeConta := frmFormPag2.edChequeConta.Text;
    FchequeAgencia := frmFormPag2.edChequeAgencia.Text;
    FchequeCodigoTerceiro := Trunc(frmFormPag2.edChequeCodigoTerceiro.Valor);
    FchequeHistorico := frmFormPag2.edChequeHistorico.Text;
    FchequeValorCheque := vDadosIni.StrToFloatFormat(frmFormPag2.edChequeValorCheque.Valor, 2);
  end
  else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S2' then
  begin
    FcreditoNomeTerceiro := frmFormPag2.edCreditoNomeTerceiro.Text;
    FcreditoJurosUtil := frmFormPag2.edCreditoJurosUtil.Valor;
    FcreditoImprimirCarne := frmFormPag2.ckCreditoImprimirCarne.Checked;
    FcreditoCodigoTerceiro := Trunc(frmFormPag2.edCreditoCodigoTerceiro.Valor);
    FcreditoHistorico := frmFormPag2.edCreditoHistorico.Text;
    FcreditoValorCredito := vDadosIni.StrToFloatFormat(frmFormPag2.edCreditoValorCredito.Valor, 2);
    FcreditoCondicaoPagamento := frmFormPag2.edcreditoCondicaoPagamento.Text;
    FcreditoQtdeParcelas := frmFormPag2.edcreditoQtdeParcelas.Value;

    FcreditoAutCartao := frmFormPag2.edcreditoNumAutoCartao.Text;
    fcreditoNSUTransacao := frmFormPag2.edCreditoNSUTransacao.Text;
    if frmFormPag2.edcreditoCodTermAdmCartao.KeyValue <> null then
    begin
      fcreditoCodTermAdmCartao := frmFormPag2.edcreditoCodTermAdmCartao.KeyValue;
      fcreditoTermAdmCartao := trim(frmFormPag2.edcreditoCodTermAdmCartao.Text);
    end;
    if frmFormPag2.edcreditoCodBandeiraAdmCartao.KeyValue <> null then
    begin
    	fcreditoCodBandeiraAdmCartao := frmFormPag2.edcreditoCodBandeiraAdmCartao.KeyValue;
      fcreditoBandeiraAdmCartao := trim(frmFormPag2.edcreditoCodBandeiraAdmCartao.Text);
	  end;
	end;
end;

function TFormPag2.atualizarNumDocRecProgFid(pCancelar: boolean = false): boolean;
var
  vvaletroca: boolean;
begin
  try
     Result := true;

     vvaletroca := false;

     if not vDadosIni.vProgFid.vHabilitarProgFid then
       exit;

     if (trim(FtipoVenda) <> 'REQ') and (trim(FtipoVenda) <> 'OS') and (trim(FtipoVenda) <> 'MOT') then
       exit;

     if trim(FtipoVenda) = 'REQ' then
     begin
       buscas2.Close;
       buscas2.SQL.Text := ' select vale_troca from pedvenda ' +
          ' where nped = :ndoc and tipo = :tipodoc and cod_empresa = :cod_empresa ';
       buscas2.ParamByName('ndoc').AsInteger := FnumeroVenda;
       buscas2.ParamByName('tipodoc').AsString := FtipoVenda;
       buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas2.Open;

       vvaletroca := trim(buscas2.FieldByName('VALE_TROCA').AsString) = 'S';

       if vvaletroca then
         exit;
     end;

     buscas2.Close;
     buscas2.SQL.Text := ' select codigo, erp_api, cod_empresa from vale_cupons ' +
        ' where ndoc = :ndoc and tipodoc = :tipodoc and cod_emp_tipodoc = :cod_emp_tipodoc ';
//        ' and erp_api = ''A'' ';
     buscas2.ParamByName('ndoc').AsInteger := FnumeroVenda;
     buscas2.ParamByName('tipodoc').AsString := FtipoVenda;
     buscas2.ParamByName('cod_emp_tipodoc').AsInteger := StrToInt(vDadosIni.codEmpresa);
     buscas2.Open;
     buscas2.First;
     while not buscas2.Eof do
     begin
       buscas.Close;
       buscas.SQL.Text := ' update conta_corrente_prog_fidelidade set ndoc = :ndoc, tipodoc = :tipodoc, cod_emp_tipodoc = :cod_emp_tipodoc ' +
          ' where nvalecupom = :nvalecupom and erp_api = :erp_api and cod_empresa = :cod_empresa ';
       buscas.ParamByName('nvalecupom').AsString :=
          buscas2.FieldByName('codigo').AsString;
       buscas.ParamByName('erp_api').AsString :=
          buscas2.FieldByName('erp_api').AsString;
       buscas.ParamByName('cod_empresa').AsInteger :=
       		buscas2.FieldByName('cod_empresa').AsInteger;

       if pCancelar then
         buscas.ParamByName('ndoc').Value := null
       else
	       buscas.ParamByName('ndoc').AsInteger := FnumeroVenda;

       if pCancelar then
         buscas.ParamByName('tipodoc').Value := null
       else
         buscas.ParamByName('tipodoc').AsString := FtipoVenda;

       if pCancelar then
       	 buscas.ParamByName('cod_emp_tipodoc').Value := null
       else
       	 buscas.ParamByName('cod_emp_tipodoc').AsInteger := StrToInt(vDadosIni.codEmpresa);
         
       buscas.ExecSQL;

       buscas.Close;
       buscas.SQL.Text := ' update vale_cupons set ndoc = :ndoc, tipodoc = :tipodoc, cod_emp_tipodoc = :cod_emp_tipodoc ' +
          ' where codigo = :codigo and erp_api = :erp_api and cod_empresa = :cod_empresa ';
       buscas.ParamByName('codigo').AsString :=
          buscas2.FieldByName('codigo').AsString;
       buscas.ParamByName('erp_api').AsString :=
          buscas2.FieldByName('erp_api').AsString;
       buscas.ParamByName('cod_empresa').AsInteger :=
       		buscas2.FieldByName('cod_empresa').AsInteger;
          
       if pCancelar then
         buscas.ParamByName('ndoc').Value := null
       else
         buscas.ParamByName('ndoc').AsInteger := FnumeroVenda;

       if pCancelar then
         buscas.ParamByName('tipodoc').Value := null
       else
         buscas.ParamByName('tipodoc').AsString := FtipoVenda;

       if pCancelar then
       	 buscas.ParamByName('cod_emp_tipodoc').Value := null
       else
       	 buscas.ParamByName('cod_emp_tipodoc').AsInteger := StrToInt(vDadosIni.codEmpresa);

       buscas.ExecSQL;

       buscas2.Next;
     end;
  except
    on e: exception do
    begin
      Result := false;
      RollBackTransacao;
      Application.MessageBox(pchar(e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

function TFormPag2.atualizarPlanoPag: boolean;
var
	vExisteIssRet: Boolean;
  vValorRat, vValorRatTot, vValorRest: Double;
  vControleCartao: Boolean;
  vTempPlanoPag: TClientDataSet;
begin
	Result := True;

  if dataSet.RecordCount <= 0 then
  	Exit
  else if FvalorTroco <= 0 then
  	Exit;

  vPlano := TPlanoPagamento.Create;
  vPlano.selecionaPlanoPagamento(FnumeroVenda, FtipoVenda);

  if vPlano.dataSet.isempty then
    Exit;

  try
    vTempPlanoPag := TClientDataSet.Create(nil);
    vTempPlanoPag.Close;
    vTempPlanoPag.FieldDefs.Clear;
    vTempPlanoPag.FieldDefs.Add('COD_CONTROLE', ftInteger, 0, false);
    vTempPlanoPag.FieldDefs.Add('QTDE', ftInteger, 0, false);
    vTempPlanoPag.FieldDefs.Add('VALORDOC', ftFloat, 0, false);

    if vTempPlanoPag.Tag = 0 then
    try
      vTempPlanoPag.CreateDataSet;
      vTempPlanoPag.Tag := 1;
    except
    end;

    try
      vValorRest := 0;
      vControleCartao := False;

      try
        dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
          if dataSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'R' then
            vExisteIssRet := True
          else if dataSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'I' then
            vExisteIssRet := True
          else
          begin
            vTempPlanoPag.Filter := ' COD_CONTROLE =	' + IntToStr(dataSet.FieldByName('COD_CONTROLE').AsInteger);
						vTempPlanoPag.Filtered := True;

            if vTempPlanoPag.IsEmpty then
            begin
            	vTempPlanoPag.Insert;
              vTempPlanoPag.FieldByName('COD_CONTROLE').AsInteger :=
              	dataSet.FieldByName('COD_CONTROLE').AsInteger;
              vTempPlanoPag.FieldByName('QTDE').AsInteger :=
              	1;
              vTempPlanoPag.FieldByName('VALORDOC').AsFloat :=
              	dataSet.FieldByName('VALORDOC').AsFloat;
            end
            else
            begin
            	vTempPlanoPag.Edit;
              vTempPlanoPag.FieldByName('QTDE').AsInteger :=
              	vTempPlanoPag.FieldByName('QTDE').AsInteger + 1;
              vTempPlanoPag.FieldByName('VALORDOC').AsFloat :=
              	vTempPlanoPag.FieldByName('VALORDOC').AsFloat + dataSet.FieldByName('VALORDOC').AsFloat;
            end;
            vTempPlanoPag.Post;

            if not vControleCartao then
            begin
              buscas.Close;
              buscas.SQL.Text := ' select TP_PLANO from controles ' +
                ' where codigo_ctrl = ' + IntToStr(dataSet.FieldByName('COD_CONTROLE').AsInteger) +
                ' and codigo_emp = ' + vDadosIni.codEmpresa;
              buscas.Open;

              if buscas.FieldByName('TP_PLANO').AsString = 'C' then
                vControleCartao := True;
            end;
          end;

          dataSet.Next;
        end;

        if not vExisteIssRet then
          Exit;

        if vControleCartao then
        begin
          Application.MessageBox(pchar('Houve lançamento do Valor de Retenção, foi utilizado um controle configurado como cartão para montar o plano de pagamento, favor ajustar os lançamentos e continuar.'),
            'Informação', MB_OK + MB_ICONINFORMATION);
          Exit;
        end;

        vValorRatTot := 0;

        vTempPlanoPag.Filtered := False;
        vTempPlanoPag.First;
        while not vTempPlanoPag.Eof do
        begin
        	vValorRest := 0;

          if vTempPlanoPag.RecordCount > 1 then
            vValorRat := vDadosIni.StrToFloatFormat(
              ((vTempPlanoPag.FieldByName('VALORDOC').AsFloat / FvalorVenda) * FvalorTroco) / vTempPlanoPag.FieldByName('QTDE').AsInteger, 2)
          else
          	vValorRat := vDadosIni.StrToFloatFormat(
          		FvalorTroco / vTempPlanoPag.FieldByName('QTDE').AsInteger, 2);

          dataSet.DisableControls;
          dataSet.First;
          while not dataSet.Eof do
          begin
          	if vTempPlanoPag.FieldByName('COD_CONTROLE').AsInteger = dataSet.FieldByName('COD_CONTROLE').AsInteger then
            begin
              if (dataSet.FieldByName('PERMITIR_EXCLUIR').AsString <> 'R')
                and (dataSet.FieldByName('PERMITIR_EXCLUIR').AsString <> 'I') then
              begin
                dataSet.Edit;
                dataSet.FieldByName('VALORDOC').AsFloat :=
                  dataSet.FieldByName('VALORDOC').AsFloat - vValorRat;
                dataSet.Post;
              end;

              vValorRest := vValorRest + dataSet.FieldByName('VALORDOC').AsFloat;
            end;

            dataSet.Next;
          end;

          vValorRatTot := vValorRatTot + (vValorRat * vTempPlanoPag.FieldByName('QTDE').AsInteger);

          vTempPlanoPag.Next;
        end;

		    // Lancar diferença do rateio
        if (vDadosIni.StrToFloatFormat(FvalorTroco, 2) <> vDadosIni.StrToFloatFormat(vValorRatTot, 2)) then
        begin
        	if (vDadosIni.StrToFloatFormat(FvalorTroco, 2) < vDadosIni.StrToFloatFormat(vValorRatTot, 2)) then
        	begin
            dataSet.First;
            while not dataSet.Eof do
            begin
              if (dataSet.FieldByName('PERMITIR_EXCLUIR').AsString <> 'R')
                and (dataSet.FieldByName('PERMITIR_EXCLUIR').AsString <> 'I') then
              begin
                dataSet.Edit;
                dataSet.FieldByName('VALORDOC').AsFloat :=
                  dataSet.FieldByName('VALORDOC').AsFloat +
                    (vDadosIni.StrToFloatFormat(vValorRatTot, 2) -
                      vDadosIni.StrToFloatFormat(FvalorTroco, 2));
                dataSet.Post;

                Break;
              end;

              dataSet.Next;
            end;
          end
          else if (vDadosIni.StrToFloatFormat(FvalorTroco, 2) > vDadosIni.StrToFloatFormat(vValorRatTot, 2)) then
        	begin
            dataSet.Last;
            while not dataSet.Bof do
            begin
              if (dataSet.FieldByName('PERMITIR_EXCLUIR').AsString <> 'R')
                and (dataSet.FieldByName('PERMITIR_EXCLUIR').AsString <> 'I') then
              begin
                dataSet.Edit;
                dataSet.FieldByName('VALORDOC').AsFloat :=
                  dataSet.FieldByName('VALORDOC').AsFloat -
                    (vDadosIni.StrToFloatFormat(FvalorTroco, 2) -
                      vDadosIni.StrToFloatFormat(vValorRatTot, 2));
                dataSet.Post;

                Break;
              end;

              dataSet.Prior;
            end;
          end;
        end;

      finally
        dataSet.First;
        dataSet.EnableControls;
      end;

    except
      on e: exception do
      begin
        Result := false;
        Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
        registraErro(e.Message);
      end;
    end;
  finally
  	if Assigned(vTempPlanoPag) then
      FreeAndNil(vTempPlanoPag);
  end;
end;

procedure TFormPag2.cadastraContas;
var
  codDoClienteConta: integer;
begin
	try
  	dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      if DataSet.FieldByName('tipdoc').AsString = 'S1' then
      begin
        codDoClienteConta := FcodigoCliente;
        if dataSet.FieldByName('COD_CLI_TERC').AsInteger > 0 then
          codDoClienteConta := dataSet.FieldByName('COD_CLI_TERC').AsInteger;

        if not ExecutaComandosSql('select cod_cliente from contasbancarias where cod_cliente = ' +
          IntToStr(codDoClienteConta) + ' and agencia = ' +
          QuotedStr(DataSet.FieldByName('agencia').AsString) +
          ' and conta = ' + QuotedStr(DataSet.FieldByName('conta').AsString) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa) then
        begin
          buscas.Close;
          buscas.SQL.Text := ' insert into contasbancarias(agencia, conta, cod_cliente,' +
            'cod_empresa, codbanco, banco)values(' +
            QuotedStr(DataSet.FieldByName('agencia').AsString) + ',' +
            QuotedStr(DataSet.FieldByName('conta').AsString) + ',' +
            IntToStr(codDoClienteConta) + ',' +
            vDadosIni.codEmpresa + ',' +
            QuotedStr(DataSet.FieldByName('cod_banco_str').AsString) + ',' +
            QuotedStr(DataSet.FieldByName('banco').AsString) + ')';
          buscas.Prepare;
          buscas.ExecSQL;
        end;
      end;
      dataSet.Next;
    end;
  finally
    dataSet.EnableControls;
  end;
end;

procedure TFormPag2.cancelar;
begin
  if frmFormPag2 = nil then
    exit;

  Falteracao := false;

  frmFormPag2.ckContabil.Checked := false;

  frmFormPag2.edValorVenda.Valor := FvalorVenda;
  frmFormPag2.edValorInformado.Valor := FvalorInformado;
  frmFormPag2.edValorQueFaltaInformar.Valor := FvalorQueFaltaInformar;
  frmFormPag2.edValorTroco.Valor := FvalorTroco;

  frmFormPag2.edTotalCarteira.Valor := FvalorTotalCarteira;
  frmFormPag2.edTotalCheque.Valor := FvalorTotalCheques;
  frmFormPag2.edTotalCreditos.Valor := FvalorTotalCreditos;
  frmFormPag2.edTotalRecibos.Valor := FvalorTotalRecibos;
  {
  frmFormPag2.edReciboNumeroRecibo.Text := '0';
  frmFormPag2.edReciboValorRecibo.Valor := 0;

  frmFormPag2.edCarteiraValorCarteira.Valor := 0;
  frmFormPag2.edCarteiraHistorico.Text := '';
  frmFormPag2.edChequeAgencia.Text := '';
  frmFormPag2.edChequeConta.Text := '';
  frmFormPag2.edChequeHistorico.Text := '';
  frmFormPag2.edChequeNomeTerceiro.Text := '';
  frmFormPag2.edChequeNumeroCheque.Text := '';
  frmFormPag2.edChequeValorCheque.Valor := 0;
  frmFormPag2.edChequeDataVencimento.Text := '';
  frmFormPag2.edChequeNumBanco.Text := '';
  frmFormPag2.edChequeCodigoTerceiro.Valor := 0;
  frmFormPag2.edcreditoQtdeParcelas.Value := 0;
  frmFormPag2.edcreditoCondicaoPagamento.Text := '';
  frmFormPag2.edCreditoNomeTerceiro.Text := '';
  frmFormPag2.edCreditoHistorico.Text := '';
  frmFormPag2.edCreditoValorCredito.Valor := 0;
  frmFormPag2.edCreditoJurosUtil.Valor := 0;
  frmFormPag2.edCreditoCodigoTerceiro.Valor := 0;
  frmFormPag2.edcreditoNumAutoCartao.Text := '';
  frmFormPag2.edCreditoNSUTransacao.Clear;
  frmFormPag2.edcreditoCodTermAdmCartao.KeyValue := Null;
  frmFormPag2.ckCreditoImprimirCarne.Checked := false;
  frmFormPag2.ListBox1.Clear;
  }
  limparCamposFormulario;
  _selecionaControles;
  limpaParcelamento;
  somarDocumentos;
  atribuirAtributosParaFormulario;
  if frmFormPag2 <> nil then
  begin
    if not dataset.IsEmpty then
      frmFormPag2.PageControl1.ActivePage := frmFormPag2.tabLancamentos
    else
      frmFormPag2.PageControl1.ActivePage := frmFormPag2.tabInicial;
    frmFormPag2.grupoControle.Enabled := true;
    if (frmFormPag2.Enabled) and (frmFormPag2.Visible) and (frmFormPag2.gridControle.CanFocus) then
      frmFormPag2.gridControle.SetFocus;
    vControle.IndexFieldNames := 'QSEQPERF_TEMP';
  end;
end;

function TFormPag2.cancelarLancamento(codLancamento: integer): boolean;
begin
  try
    buscas.Close;
    buscas.SQL.Text := ' DELETE FROM LANCCXL ' +
    	' WHERE COD_LANCXL = :COD_LANCXL ' +
      ' AND CODIGO_EMP = :CODIGO_EMP ';
    buscas.ParamByName('COD_LANCXL').AsInteger := codLancamento;
    buscas.ParamByName('CODIGO_EMP').AsString := vDadosIni.codEmpresa;
    buscas.ExecSQL;

    buscas.Close;
    buscas.SQL.Text := ' DELETE FROM FORMPAGAMENTO ' +
      ' WHERE NREQUISICAO = :NREQUISICAO ' +
      ' AND TPDOCS = :TPDOCS ' +
      ' AND COD_EMPRESA = :COD_EMPRESA ';
    buscas.ParamByName('NREQUISICAO').AsInteger := codLancamento;
    buscas.ParamByName('TPDOCS').AsString := 'LCS';
    buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    buscas.ExecSQL;

    CommitaTransacao;
    Result := True;
//    if vLancCxl.cancelarLancamento(codLancamento) then
//    begin
//      selecionaFormaPagamento(codLancamento, 0, 'LCS');
//      if not dataset.IsEmpty then
//      begin
//        dataset.Delete;
//        Apply;
//      end;
//      CommitaTransacao;
//      result := true;
//    end;
  except
    on e: exception do
    begin
      Result := false;
    	RollBackTransacao;
      Application.MessageBox(pchar(e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

function TFormPag2.cancelaVenda(pNumeroVenda: integer;
  tipVenda: string; pSerieNF: string;
  ReaberturaVenda: Boolean; GravarRegApag: Boolean): boolean;
var
  vcodlanc: integer;
  vValorRecibo: Double;
  nValorRecibo, nTpBaixa: string;
  vBol: TBoletasFP;
  vnumeroVenda: Integer;
  vtipoVenda: string;
  vFinanceiroUnificado: boolean;
begin
  vnumeroVenda := pNumeroVenda;
  vtipoVenda := tipVenda;
  IniciaTransacao;
  try
    Result := false;
    if pNumeroVenda <= 0 then
      raise exception.create('Numero da Venda não pode ser Zero');
    if Trim(tipVenda) = '' then
      raise exception.create('Tipo de venda não informada');

    if (((Trim(tipVenda) = 'REQ') or (Trim(tipVenda) = 'OS')) and (vDadosIni.vPedVnd.ReceberPeloFinanceiro))
    	or ((Trim(tipVenda) = 'MOT') and (vDadosIni.vVeic.ReceberPeloFinanceiro))
    	or ((Trim(tipVenda) = 'REC') and (vDadosIni.vRecibo.ReceberPeloFinanceiro)) then
    begin
    	buscas.Close;
      buscas.SQL.Text := ' select formpagamento.seqform, ' +
      	' case when (trim(formpagamento.tpdocs) = ''REQ'') then ' +
        '					coalesce(pedvenda.cxl, ''N'') ' +
        '      when (trim(formpagamento.tpdocs) = ''OS'') then ' +
        '         coalesce(pedvenda.cxl, ''N'') ' +
        '      when (trim(formpagamento.tpdocs) = ''REC'') then ' +
        '         coalesce(recibos.cxl, ''N'') ' +
        '      when (trim(formpagamento.tpdocs) = ''MOT'') then ' +
        '         coalesce(com_fat.cxl, ''N'') ' +
        '      else ' +
        '        ''N'' ' +
        ' end cxl from formpagamento ' +
        ' left join recibos on recibos.nrecibo = formpagamento.nrequisicao ' +
        ' 	and recibos.cod_empresa = formpagamento.cod_empresa ' +
        ' left join pedvenda on pedvenda.nped = formpagamento.nrequisicao ' +
        ' 	and pedvenda.tipo = trim(formpagamento.tpdocs) ' +
        '   and pedvenda.cod_empresa = formpagamento.cod_empresa ' +
      	' left join com_fat on com_fat.n_comando = formpagamento.nrequisicao ' +
        '   and com_fat.cod_empresa = formpagamento.cod_empresa ' +
        ' where formpagamento.nrequisicao = ' + IntToStr(pNumeroVenda) +
        ' and formpagamento.tpdocs = ' + QuotedStr(Trim(tipVenda)) +
        ' and formpagamento.cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if not buscas.IsEmpty then
        if (vDadosIni.vSistema <> 'Cxl') and (buscas.FieldByName('cxl').AsString = 'S') then
          raise Exception.Create('Documento recebido pelo Caixa Auxiliar. Não é permitido cancelar pelo Financeiro')
        else if (vDadosIni.vSistema = 'Cxl') and (buscas.FieldByName('cxl').AsString <> 'S') then
          raise Exception.Create('Documento recebido pelo Financeiro. Não é permitido cancelar pelo Caixa Auxiliar');
    end;

    if Trim(tipVenda) = 'NF' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'update FORMPAGAMENTO set md5 = null WHERE TPDOCS = ''NF'' and cod_empresa = ' +
        vDadosIni.CodEmpresa + ' and ativo = 1 AND NREQUISICAO = ' +
        IntToStr(pNumeroVenda) + ' and sub_serie = ' + IntToStr(StrToIntDef(pSerieNF, 0)) ;
      buscas.Prepare;
      buscas.ExecSQL;
    end;

    buscas.Close;
    buscas.SQL.Text := 'select prcss from formpagamento ' +
    	' where nrequisicao = ' + IntToStr(pNumeroVenda) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and tpdocs = ' + QuotedStr(tipVenda) +
      ' and prcss = ''S''';
    buscas.Open;

    if (buscas.FieldByName('prcss').AsString = 'S') and (not ReaberturaVenda) then
      raise Exception.Create('Forma de pagamento já processada pelo Financeiro. Não é permitido cancelar mais');

    if montaSelect('select fp.*, '' '' num_rec_dep, '' '' num_rec_parc from formpagamento fp ' +
    	' where fp.nrequisicao = ' + IntToStr(pNumeroVenda) +
      ' and fp.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and fp.tpdocs = ' + QuotedStr(tipVenda)) then
    begin
      if not ReaberturaVenda then
      if not verificaOSRetorno(tipVenda, pNumeroVenda) then
        exit;
      Result := true;
      vcodlanc := 0;
      nValorRecibo :='0';

      dataSet.First;
      while not dataSet.Eof do
      begin
        vFinanceiroUnificado := false;
			  if (vDadosIni.vEmp.vFinanceiroUnificado)
        	and (dataSet.FieldByName('COD_UNIFICADA').AsInteger > 0) then
			   		vFinanceiroUnificado := true;

        if ((not dataSet.IsEmpty) and (dataSet.FieldByName('INTERM_NUMVEND').AsInteger > 0)) then
        begin
          buscas2.close;
          buscas2.sql.text := 'select * from lanccxl ' +
          	' where tipo_doc_cxl = ''' + tipVenda + ''' ' +
            ' and n_doc_cxl = ' + IntToStr(pNumeroVenda) +
            ' and codigo_emp = ' + vDadosIni.codEmpresa;
          buscas2.Open;

          if buscas2.IsEmpty then
          begin
          	if GravarRegApag then
            begin
              buscas.close;
              buscas.SQL.Text := 'select * from formpagamento ' +
                ' where nrequisicao = ' + IntToStr(dataSet.FieldByName('NREQUISICAO').AsInteger) +
                ' and cod_empresa = ' + vDadosIni.codEmpresa +
                ' and tpdocs = ''INTERM'' ';
              buscas.Open;
              if not deletarFormPag(buscas) then
              begin
                RollBackTransacao;
                Result := false;
                exit;
              end;
            end;

            buscas.close;
            buscas.SQL.Text := 'delete from formpagamento ' +
            	' where nrequisicao = ' + IntToStr(dataSet.FieldByName('NREQUISICAO').AsInteger) +
              ' and cod_empresa = ' + vDadosIni.codEmpresa +
              ' and tpdocs = ''INTERM'' ';
            buscas.Prepare;
            buscas.ExecSQL;

            buscas.Close;
            buscas.SQL.Text := ' select nrequisicao, tpdocs from formpagamento ' +
              ' where interm_numvend = ' + IntToStr(dataSet.FieldByName('INTERM_NUMVEND').AsInteger) +
              ' and cod_empresa = ' + vDadosIni.codEmpresa +
              ' and tpdocs = ''INTERM'' ';
            buscas.Open;

            if not buscas.IsEmpty then
            begin
            	if GravarRegApag then
              begin
              	buscas.close;
                buscas.SQL.Text := ' select * from formpagamento ' +
                  ' where interm_numvend = ' + IntToStr(dataSet.FieldByName('INTERM_NUMVEND').AsInteger) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa +
                  ' and tpdocs = ''INTERM'' ';
                buscas.Open;
                if not deletarFormPag(buscas) then
                begin
                  RollBackTransacao;
                  Result := false;
                  exit;
                end;
              end;

              buscas.close;
              buscas.SQL.Text := ' delete from formpagamento ' +
              	' where interm_numvend = ' + IntToStr(dataSet.FieldByName('INTERM_NUMVEND').AsInteger) +
                ' and cod_empresa = ' + vDadosIni.codEmpresa +
                ' and tpdocs = ''INTERM'' ';
              buscas.Prepare;
              buscas.ExecSQL;
            end;
          end
          else
          begin
            buscas2.First;
            while not buscas2.Eof do
            begin
              vcodlanc := buscas2.FieldByName('COD_LANCXL').AsInteger;

              if Trim(buscas2.FieldByName('TAXA_INTERMEDIADOR').AsString) = 'S' then
              begin
                buscas.close;
                buscas.sql.text := ' delete from lanccxl ' +
                	' where tipo_doc_cxl = ''' + tipVenda + ''' ' +
                  ' and n_doc_cxl = ' + IntToStr(pNumeroVenda) +
                  ' and cod_lancxl = ' + IntToStr(vcodlanc) +
                  ' and taxa_intermediador = ''S'' ' +
                  ' and codigo_emp = ' + vDadosIni.codEmpresa;
                buscas.Prepare;
                buscas.ExecSQL;

              	if GravarRegApag then
                begin
                  buscas.close;
                  buscas.sql.text := 'select * from formpagamento ' +
                    ' where tpdocs = ''INTERM'' ' +
                    ' and nrequisicao = ' + IntToStr(vcodlanc) +
                    ' and cod_empresa = ' + vDadosIni.codEmpresa;
                  buscas.Open;
                  if not deletarFormPag(buscas) then
                  begin
                    RollBackTransacao;
                    Result := false;
                    exit;
                  end;
                end;

                buscas.close;
                buscas.sql.text := 'delete from formpagamento ' +
                	' where tpdocs = ''INTERM'' ' +
                  ' and nrequisicao = ' + IntToStr(vcodlanc) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa;
                buscas.Prepare;
                buscas.ExecSQL;
              end;
              buscas2.Next;
            end;
          end;
        end
        else if ((not dataSet.IsEmpty) and (dataSet.FieldByName('REC_TIPVEND').AsString = 'REC')
          and (dataSet.FieldByName('REC_NUMVEND').AsInteger > 0)) then
        begin

          buscas.Close;
          buscas.SQL.Text := ' select r.nrecibo, h.ndocant, h.valor_baixa, r.valor, tp_baixa, r.status_rec ' +
            ' from hist_rec h ' +
            ' inner join recibos r on r.nrecibo = h.nrecibo ' +
            '		and r.cod_empresa = h.' + vDadosIni.IfThen(vFinanceiroUnificado, 'cod_unificada', 'cod_empresa') +
            ' where h.nrecibo = ' + IntToStr(dataSet.FieldByName('REC_NUMVEND').AsInteger) +
            ' and h.ndocant =' + IntToStr(pNumeroVenda) +
            ' and h.cod_empresa = ' + vDadosIni.codEmpresa;
          buscas.Open;

          if not buscas.IsEmpty then
          begin
            nTpBaixa := buscas.FieldByName('TP_BAIXA').AsString;

            if nTpBaixa = 'P' then
            begin
              if (trim(buscas.FieldByName('STATUS_REC').AsString) = 'RECEBIDO') then
                vValorRecibo := buscas.FieldByName('VALOR_BAIXA').AsFloat
              else
                vValorRecibo := buscas.FieldByName('VALOR_BAIXA').AsFloat + buscas.FieldByName('VALOR').AsFloat;

              nValorRecibo := StringReplace(FloatToStr(vValorRecibo), ',', '.', [rfReplaceAll]);
            end;
          end;

          buscas.Close;
          buscas.SQL.Text := ' update hist_rec' +
            ' set tp_baixa = ''P''' +
            ' where nrecibo = ' + IntToStr(dataSet.FieldByName('REC_NUMVEND').AsInteger) +
            ' and ' + vDadosIni.IfThen(vFinanceiroUnificado,
            	'cod_unificada', 'cod_empresa') +
            ' = ' + vDadosIni.IfThen(vFinanceiroUnificado,
            	IntToStr(dataSet.FieldByName('COD_UNIFICADA').AsInteger), vDadosIni.codEmpresa);
          buscas.ExecSQL;

          buscas2.close;
          buscas2.sql.text := ' select * from lanccxl ' +
            ' where tipo_doc_cxl = ''' + tipVenda + ''' ' +
            ' and n_doc_cxl = ' + IntToStr(pNumeroVenda) +
            ' AND CODIGO_EMP = ' + vDadosIni.codEmpresa;
          buscas2.Open;
          buscas2.FetchAll;

          if not buscas2.IsEmpty then
          begin
            buscas2.First;
            while not buscas2.Eof do
            begin
              vcodlanc := buscas2.FieldByName('COD_LANCXL').AsInteger;

              if ((not buscas2.isempty) and (buscas2.FieldByName('TR').IsNull)) then
              begin
                buscas.close;
                buscas.sql.text := ' delete from lanccxl ' +
                	' where tipo_doc_cxl = ''' + tipVenda + ''' ' +
                  ' and n_doc_cxl = ' + IntToStr(pNumeroVenda) +
                  ' and cod_lancxl = ' + IntToStr(vcodlanc) +
                  ' and tr is null ' +
                  ' and codigo_emp = ' + vDadosIni.codEmpresa;
                buscas.Prepare;
                buscas.ExecSQL;

                if GravarRegApag then
                begin
                	buscas.close;
                  buscas.sql.text := ' select * from formpagamento ' +
                    ' where tpdocs = ''LCS'' ' +
                    ' and nrequisicao = ' + IntToStr(vcodlanc) +
                    ' and cod_empresa = ' + vDadosIni.codEmpresa;
                  buscas.Open;
                  if not deletarFormPag(buscas) then
                  begin
                    RollBackTransacao;
                    Result := false;
                    exit;
                  end;
                end;

                buscas.close;
                buscas.sql.text := ' delete from formpagamento ' +
                	' where tpdocs = ''LCS'' ' +
                  ' and nrequisicao = ' + IntToStr(vcodlanc) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa;
                buscas.Prepare;
                buscas.ExecSQL;
              end
              else if ((not buscas2.isempty) and (buscas2.FieldByName('TR').AsString = 'S')) then
              begin
                buscas.close;
                buscas.sql.text := ' delete from lanccxl ' +
                	' where tipo_doc_cxl = ''' + tipVenda + ''' ' +
                  ' and n_doc_cxl = ' + IntToStr(pNumeroVenda) +
                  ' and cod_lancxl = ' + IntToStr(vcodlanc) +
                  ' and tr = ''S'' ' +
                  ' and codigo_emp = ' + vDadosIni.codEmpresa;
                buscas.Prepare;
                buscas.ExecSQL;

                if GravarRegApag then
                begin
                	buscas.close;
                  buscas.sql.text := ' select * from formpagamento ' +
                	  ' where tpdocs = ''TRC'' ' +
                    ' and nrequisicao = ' + IntToStr(vcodlanc) +
                    ' and cod_empresa = ' + vDadosIni.codEmpresa;
                	buscas.Open;
                  if not deletarFormPag(buscas) then
                  begin
                    RollBackTransacao;
                    Result := false;
                    exit;
                  end;
                end;

                buscas.close;
                buscas.sql.text := ' delete from formpagamento ' +
                	' where tpdocs = ''TRC'' ' +
                  ' and nrequisicao = ' + IntToStr(vcodlanc) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa;
                buscas.Prepare;
                buscas.ExecSQL;
              end;
              buscas2.Next;
            end;
          end
          else if vcodlanc = 0 then
          begin
          	if GravarRegApag then
            begin
              buscas.close;
              buscas.sql.text := ' select * from formpagamento ' +
                ' where nrequisicao = ' + IntToStr(dataSet.FieldByName('REC_NUMVEND').AsInteger) +
                ' and cod_empresa = ' + vDadosIni.codEmpresa +
                ' and tpdocs = ''LCS'' ';
              buscas.Open;
              if not deletarFormPag(buscas) then
              begin
                RollBackTransacao;
                Result := false;
                exit;
              end;
            end;

            buscas.Close;
            buscas.SQL.Text := ' delete from formpagamento ' +
            	' where nrequisicao = ' + IntToStr(dataSet.FieldByName('REC_NUMVEND').AsInteger) +
              ' and cod_empresa = ' + vDadosIni.codEmpresa +
              ' and tpdocs = ''LCS'' ';
            buscas.Prepare;
            buscas.ExecSQL;

            if GravarRegApag then
            begin
              buscas.close;
              buscas.sql.text := ' select * from formpagamento ' +
                ' where nrequisicao = ' + IntToStr(dataSet.FieldByName('NREQUISICAO').AsInteger) +
                ' and cod_empresa = ' + vDadosIni.codEmpresa +
                ' and tpdocs = ''TRC'' ' +
                ' and rec_tipvend = '+ QuotedStr(dataSet.FieldByName('TPDOCS').AsString);
              buscas.Open;
              if not deletarFormPag(buscas) then
              begin
                RollBackTransacao;
                Result := false;
                exit;
              end;
            end;

            buscas.close;
            buscas.SQL.Text := ' delete from formpagamento ' +
            	' where nrequisicao = ' + IntToStr(dataSet.FieldByName('NREQUISICAO').AsInteger) +
              ' and cod_empresa = ' + vDadosIni.codEmpresa +
              ' and tpdocs = ''TRC'' ' +
              ' and rec_tipvend = '+ QuotedStr(dataSet.FieldByName('TPDOCS').AsString);
            buscas.Prepare;
            buscas.ExecSQL;
          end;

          buscas.Close;
          buscas.SQL.Text := ' delete from hist_rec ' +
            ' where nrecibo =' + IntToStr(dataSet.FieldByName('REC_NUMVEND').AsInteger) +
            ' and tp_doc_baixa = ' + QuotedStr(dataSet.FieldByName('TPDOCS').AsString) +
            ' and ndocant =' + IntToStr(pNumeroVenda) +
            ' and ' + vDadosIni.IfThen(vFinanceiroUnificado,
            	'cod_unificada', 'cod_empresa') +
            ' = ' + vDadosIni.IfThen(vFinanceiroUnificado,
            	IntToStr(dataSet.FieldByName('COD_UNIFICADA').AsInteger),
            vDadosIni.codEmpresa);
          buscas.Prepare;
          buscas.ExecSQL;

          buscas.Close;
          if nTpBaixa ='P' then
            buscas.SQL.Text := ' update recibos set status_rec = null, data_baixa = null, valor = ' + nValorRecibo + ' ' +
              ' where nrecibo =' + IntToStr(dataSet.FieldByName('REC_NUMVEND').AsInteger) +
              ' and cod_empresa = ' + vDadosIni.IfThen(vFinanceiroUnificado,
              	IntToStr(dataSet.FieldByName('COD_UNIFICADA').AsInteger),
              vDadosIni.codEmpresa)
          else
            buscas.SQL.Text := ' update recibos set status_rec = null, data_baixa = null ' +
              ' where nrecibo =' + IntToStr(dataSet.FieldByName('REC_NUMVEND').AsInteger) +
              ' and cod_empresa = ' + vDadosIni.IfThen(vFinanceiroUnificado,
              	IntToStr(dataSet.FieldByName('COD_UNIFICADA').AsInteger),
              vDadosIni.codEmpresa);
          buscas.Prepare;
          buscas.ExecSQL;
        end
        else
        begin
          buscas2.close;
          buscas2.sql.text := ' select * from lanccxl ' +
          	' where tipo_doc_cxl = ''' + tipVenda + ''' ' +
            ' and n_doc_cxl = ' + IntToStr(pNumeroVenda) +
            ' and codigo_emp = ' + vDadosIni.codEmpresa;
          buscas2.Open;

          if buscas2.IsEmpty then
          begin
          	if GravarRegApag then
            begin
              buscas.close;
              buscas.sql.text := ' select * from formpagamento ' +
                ' where nrequisicao = ' + IntToStr(dataSet.FieldByName('NREQUISICAO').AsInteger) +
                ' and cod_empresa = ' + vDadosIni.codEmpresa +
                ' and tpdocs = ''TRC'' ' +
                ' and rec_tipvend = ' + QuotedStr(dataSet.FieldByName('TPDOCS').AsString);
              buscas.Open;
              if not deletarFormPag(buscas) then
              begin
                RollBackTransacao;
                Result := false;
                exit;
              end;
            end;

            buscas.close;
            buscas.SQL.Text := ' delete from formpagamento ' +
              ' where nrequisicao = ' + IntToStr(dataSet.FieldByName('NREQUISICAO').AsInteger) +
              ' and cod_empresa = ' + vDadosIni.codEmpresa +
              ' and tpdocs = ''TRC'' ' +
              ' and rec_tipvend = ' + QuotedStr(dataSet.FieldByName('TPDOCS').AsString);
            buscas.Prepare;
            buscas.ExecSQL;
          end
          else
          begin
            buscas2.First;
            while not buscas2.Eof do
            begin
              vcodlanc := buscas2.FieldByName('COD_LANCXL').AsInteger;

              if Trim(buscas2.FieldByName('TR').AsString) = 'S' then
              begin
                buscas.close;
                buscas.sql.text := ' delete from lanccxl ' +
                	' where tipo_doc_cxl = ''' + tipVenda + ''' ' +
                  ' and n_doc_cxl = ' + IntToStr(pNumeroVenda) +
                  ' and cod_lancxl = ' + IntToStr(vcodlanc) +
                  ' and tr = ''S'' ' +
                  ' and codigo_emp = ' + vDadosIni.codEmpresa;
                buscas.Prepare;
                buscas.ExecSQL;

                if GravarRegApag then
                begin
                  buscas.close;
                  buscas.sql.text := ' select * from formpagamento ' +
                    ' where tpdocs = ''TRC'' ' +
                    ' and nrequisicao = ' + IntToStr(vcodlanc) +
                    ' and cod_empresa = ' + vDadosIni.codEmpresa;
                  buscas.Open;
                  if not deletarFormPag(buscas) then
                  begin
                    RollBackTransacao;
                    Result := false;
                    exit;
                  end;
                end;
                
                buscas.close;
                buscas.sql.text := ' delete from formpagamento ' +
                  ' where tpdocs = ''TRC'' ' +
                  ' and nrequisicao = ' + IntToStr(vcodlanc) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa;
                buscas.Prepare;
                buscas.ExecSQL;
              end;
              buscas2.Next;
            end;
          end;

        end;
//        dataSet.Delete;
        dataSet.Next;
      end;
//      Apply;

    	if GravarRegApag then
      begin
        buscas.close;
        buscas.sql.text := ' select * from formpagamento ' +
          ' where nrequisicao = ' + IntToStr(pNumeroVenda) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa +
          ' and tpdocs = ' + QuotedStr(tipVenda);
        buscas.Open;
        if not deletarFormPag(buscas) then
        begin
          RollBackTransacao;
          Result := false;
          exit;
        end;
      end;

      buscas.Close;
      buscas.SQL.Text := ' update vale_cupons set ndoc = null, tipodoc = null, cod_emp_tipodoc = null ' +
      	' where ndoc = ' + IntToStr(pNumeroVenda) +
        ' and cod_emp_tipodoc = ' + vDadosIni.codEmpresa +
        ' and tipodoc = ' + QuotedStr(tipVenda);
      buscas.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := ' delete from formpagamento ' +
      	' where nrequisicao = ' + IntToStr(pNumeroVenda) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and tpdocs = ' + QuotedStr(tipVenda);
      buscas.ExecSQL;

      FtipoVenda := tipVenda;
      FnumeroVenda := pNumeroVenda;

      verificaNF;

      if (FtipoVenda = 'NF') or ((FNum_Nf > 0) and (FtipoVenda = 'REC')) then
      else
      begin
        if (FtipoVenda <> 'REQ') and (FtipoVenda <> 'OS') then
        else
        begin

          vBol := TBoletasFP.create;
          vBol.selecionaBoletasFp(FNum_Nf, FSerie_Nf);
          if not vBol.dataSet.IsEmpty then
          begin
          	try
            	vBol.dataSet.DisableControls;
              vBol.dataSet.First;
              while not vBol.dataSet.Eof do
              begin

                buscas.Close;
                buscas.SQL.Text := 'update boletas b set VL_DOC_BOL = VL_ORIG, VL_ORIG = 0' +
                  ' where N_SEQ_BOL = ' + IntToStr(vBol.dataSet.FieldByName('N_SEQ_BOL').AsInteger) +
                  ' and COD_EMPRESA = ' + vDadosIni.codEmpresa +
                  ' and VL_ORIG > 0';
                buscas.ExecSQL;

                vBol.dataSet.Next;
              end;
            finally
              vBol.dataSet.EnableControls;
            end;
          end;
        end;
      end;

      if (trim(FtipoVenda) = 'REQ') or (trim(FtipoVenda) = 'OS') then
      begin
        buscas.Close;
        buscas.SQL.Text := 'update pedvenda set cxl = null ' +
          ' where nped = ' + IntToStr(FnumeroVenda) +
          ' and tipo = ' + QuotedStr(trim(FtipoVenda)) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.ExecSQL;
      end
      else if (trim(FtipoVenda) = 'MOT') then
      begin
        buscas.Close;
        buscas.SQL.Text := 'update com_fat set cxl = null ' +
          ' where n_comando = ' + IntToStr(FnumeroVenda) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.ExecSQL;
      end
      else if (trim(FtipoVenda) = 'REC') then
      begin
        buscas.Close;
        buscas.SQL.Text := 'update recibos set cxl = null ' +
          ' where nrecibo = ' + IntToStr(pNumeroVenda) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.ExecSQL;
      end;

      buscas.close;
      buscas.sql.text := 'select * from lanccxl where tipo_doc_cxl = ''' + tipVenda +
        ''' and n_doc_cxl = ' + IntToStr(pNumeroVenda) +
        ' and tr = ''S'' AND CODIGO_EMP = ' + vDadosIni.codEmpresa;
      buscas.open;
      vcodlanc := buscas.FieldByName('COD_LANCXL').AsInteger;
      if not buscas.isempty then
      begin
        buscas.close;
        buscas.sql.text := ' delete from lanccxl ' +
        	' where tipo_doc_cxl = ''' + tipVenda + ''' ' +
          ' and n_doc_cxl = ' + IntToStr(pNumeroVenda) +
          ' and tr = ''S'' ' +
          ' and codigo_emp = ' + vDadosIni.codEmpresa;
        buscas.Prepare;
        buscas.ExecSQL;
        
        if GravarRegApag then
      	begin
          buscas.close;
          buscas.sql.text := ' select * from formpagamento ' +
            ' where tpdocs = ''TRC'' ' +
            ' and nrequisicao = ' + IntToStr(vcodlanc) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa;
          buscas.Open;
          if not deletarFormPag(buscas) then
          begin
            RollBackTransacao;
            Result := false;
            exit;
          end;
        end;

        buscas.close;
        buscas.sql.text := ' delete from formpagamento ' +
        	' where tpdocs = ''TRC'' ' +
          ' and nrequisicao = ' + IntToStr(vcodlanc) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.Prepare;
        buscas.ExecSQL;
      end;
    end
    else
      Result := false;
    // Atualizar pontos programa de fidelidade
    if not setarPontosProgFidelidade(true) then
    begin
      RollBackTransacao;
      Result := false;
      exit;
    end;

    if not atualizarNumDocRecProgFid(true) then
    begin
      RollBackTransacao;
      Result := false;
      exit;
    end;

    CommitaTransacao;
    imprimirReciboPontosProgFidelidade(vnumeroVenda, vtipoVenda, true);
  except
    on e: exception do
    begin
      RollBackTransacao;
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

function TFormPag2.cancelUpdates: boolean;
begin
  inherited CancelUpdates;
  vRecibo.CancelUpdates;
  vRecibo.vHistRec.CancelUpdates;
  //  vFecDiaCxl.CancelUpdates;
  vLancCxl.CancelUpdates;
  vValeCupomPrgFid.CancelUpdates;
end;

procedure TFormPag2.cliqueCarneFormDetalhe(Sender: TObject);
begin
  if not vDadosIni.PesqPros('FPG006', 'ABRIR',
   'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
   'FORMPAGAMENTO', '', buscas, True) then
    Exit;
  imprimeCarneFormDetalhe;
end;

procedure TFormPag2.cliquePromissoriasFormDetalhe(Sender: TObject);
begin
  if not vDadosIni.PesqPros('FPG006', 'ABRIR',
   'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
   'FORMPAGAMENTO', '', buscas, True) then
    Exit;
  imprimePromissoriaFormDetalhe;
end;

procedure TFormPag2.cliqueReciboFormDetalhe(Sender: TObject);
begin
	if frmDetalhamento.DBGrid1.DataSource.DataSet.IsEmpty then
  begin
  	Application.MessageBox(pchar('Selecione um recibo antecipado.'), 'Informação', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  numRecibo := frmDetalhamento.DBGrid1.DataSource.DataSet.FieldByName('REC_NUMVEND').AsInteger;

  if numRecibo <= 0 then
  begin
  	Application.MessageBox(pchar('Selecione um recibo antecipado.'), 'Informação', MB_OK + MB_ICONINFORMATION);
    exit;
  end;

  if not vDadosIni.PesqPros('REC006', 'IMPRIMIR',
   '', 'RECIBOS', IntToStr(numRecibo), buscas, True) then
    Exit;

  imprimeReciboFormDetalhe;
end;

function TFormPag2.cl_abreExtrato_form(ACodCliente: Integer): boolean;
var
  AProcedure: Tcl_abreExtrato_form;
  AQueryRescue: TIBQuery;
  AUseQueryIni: Boolean;
begin
  try
  	if not vDadosIni._mdiAberto('TFrmCadClientes', 'Cadastro do cliente ja esta aberto, feche o cadastro para utilizar esta funcionalidade') then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if vClienteFPG.AHandle = 0 then
      CarregaPacote('pkClientes', vClienteFPG.AHandle);

    if vClienteFPG.AHandle = 0 then
    begin
      Application.MessageBox('Pacote Cliente não carregado', 'Anteção', 0 + 64);
      Exit;
    end;
    @AProcedure := GetProcAddress(vClienteFPG.AHandle, 'cl_abreExtrato_form');

    if Assigned(AProcedure) then
      Result := AProcedure(ACodCliente);
  finally
  end;
end;

function TFormPag2.confirmaFormaPagamento: boolean;
var
  vTemp: string;
  vImpBol: TBoleto;
  vnumeroVenda: Integer;
  vtipoVenda: string;
  vincjuros, vincdesconto, vvalorjuros, vvalordesconto: Double;
  vtroco: boolean;
  vformasEC: boolean;
  vintertemp: string;
  vvalorecommerce: Double;
  vPermReceberValorMenor: boolean;
begin
  vtroco := false;
  vnumeroVenda := FnumeroVenda;
  vtipoVenda := FtipoVenda;

  Result := False;
  try
  	vPermReceberValorMenor := false;
    vvalorecommerce := 0;
    if (FnumeroVendaEcommerce > 0) then
      vvalorecommerce := vEcommerce.somatorioEcommerce(FnumeroVenda, FtipoVenda);

    if not vDadosIni.PesqPros('FPG002', 'CONFIRMAR',
      'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda +
      ' VALOR INFORMADO: ' + Format('%0.2f', [FvalorInformado]) +
      ' VALOR DA VENDA: ' + Format('%0.2f', [FvalorVenda]), 'FORMPAGAMENTO', '', buscas, True) then
      Exit;

    if not validarPossivelTroco(True) then
      Exit;

    if FnumeroVendaEcommerce > 0 then
    begin
      vformasEC := true;
      vintertemp := '';
      try
      	vEcommerce.dataSet.DisableControls;
        vEcommerce.dataSet.First;
        while not vEcommerce.dataSet.Eof do
        begin
           if vEcommerce.dataSet.FieldByName('UTILIZADO').AsString <> 'S' then
           begin
             vintertemp := vintertemp + trim(vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString) +
               IfThen(dataSet.RecNo + 1 = dataSet.RecordCount, '', #13);
             vformasEC := false;
           end;

           vEcommerce.dataSet.Next;
        end;
      finally
        vEcommerce.dataSet.First;
        vEcommerce.dataSet.EnableControls;
      end;

      if not vformasEC then
      begin
        if Application.MessageBox(PChar('Alguns intermediadores de pagamento do E-Commerce não foram utilizadas, deseja continuar assim mesmo? ' + #13 + #13 +
          'Intermediadores: ' + #13 +
          vintertemp), 'Confirmação',
           MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
           exit;

        if not vDadosIni.PesqPros('FPG046', 'RECEBER',
          'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda +
          ' VALOR INFORMADO: ' + Format('%0.2f', [FvalorInformado]) +
          ' VALOR DA VENDA: ' + Format('%0.2f', [FvalorVenda]), 'FORMPAGAMENTO', '', buscas, True) then
          exit;
      end;
    end;

    if (vDadosIni.StrToFloatFormat(FvalorInformado - valorTroco, 2) < vDadosIni.StrToFloatFormat(FvalorVenda, 2))
    	and (vDadosIni.vSistema = 'Cxl') then
    begin
    	if Application.MessageBox(pchar('Valor recebido menor que o valor esperado.' + #13 +
        'Valor esperado: ' + Format('%0.2f', [FvalorVenda]) +
        ' Valor recebido: ' + Format('%0.2f', [FvalorInformado - valorTroco]) + #13 + #13 +
        'Deseja continuar assim mesmo?'),
        'Atenção', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
        exit;

    	if not vDadosIni.PesqPros('CXL085', 'RECEBER',
        'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda +
        ' VALOR INFORMADO: ' + Format('%0.2f', [FvalorInformado]) +
        ' VALOR ESPERADO: ' + Format('%0.2f', [FvalorVenda]), 'FORMPAGAMENTO', '', buscas, True) then
      begin
      	raise exception.Create('Valor recebido menor que o valor esperado.' +
          'Valor esperado: ' + Format('%0.2f', [FvalorVenda]) +
          ' Valor recebido: ' + Format('%0.2f', [FvalorInformado - valorTroco]));
      end
      else
        vPermReceberValorMenor := true;
    end;

    if FtipoVenda = 'MOT' then
    begin
      montarLancamentoMTUsadas;
      if not validaPlanoVeiculos then
        Exit;
      if (Format('%0.2f', [FvalorInformado])) <> Format('%0.2f', [FvalorVenda]) then
      begin
      	if not vPermReceberValorMenor then
          if vDadosIni.StrToFloatFormat(FvalorInformado, 2) < vDadosIni.StrToFloatFormat(FvalorVenda, 2) then
            raise exception.Create('Valor recebido menor que o valor esperado.' +
              'Valor esperado: ' + Format('%0.2f', [FvalorVenda]) +
              ' Valor recebido: ' + Format('%0.2f', [FvalorInformado]));

        if vDadosIni.StrToFloatFormat(FvalorInformado, 2) > vDadosIni.StrToFloatFormat(FvalorVenda, 2) then
        begin
          Application.ProcessMessages;
          Application.MessageBox('Valor informado maior que o esperado', 'Atenção', 0 + 64);
          vDadosIni.vInibeMensPesqPros := 'S';
          if not vDadosIni.PesqPros('FPG010', 'CONFIRMAR',
            'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda +
            ' VALOR INFORMADO: ' + Format('%0.2f', [FvalorInformado]) +
            ' VALOR DA VENDA: ' + Format('%0.2f', [FvalorVenda]), 'FORMPAGAMENTO', '', buscas, True) then
          begin
            Result := False;
            exit;
          end;
          if Application.MessageBox('Deseja continuar assim mesmo?', 'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          begin
            Result := False;
            exit;
          end;
        end;
      end;
      if not montarOSLancamentoRetorno then
        Exit;

      if not montarOSLancamentoInterm then
        Exit;
      //OK - Jogar o valor contabil nos campos, tambem no dinheiro fazer a diferenca
      //ok - Identificar o lacamento quando for frete
      //ok - Fazer o lancamento do MT usadas
      //Montar a OS.
    end;

    if (FnumeroVendaEcommerce > 0)
     and (vDadosIni.StrToFloatFormat(FvalorVenda, 2) > vDadosIni.StrToFloatFormat(vvalorecommerce, 2)) then
    begin
      	vEcommerce.dataSet.First;
        while not vEcommerce.dataSet.Eof do
        begin
        	if (vDadosIni.vEcommerce.vLancarTaxaIntermPag = 'DINHEIRO')
            or (trim(vEcommerce.dataSet.FieldByName('DOCS').AsString) = 'N') then
          begin
            try
              dataSet.Filter := ' LOCAL_VENDA = ' + QuotedStr(vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString) +
                ' AND INTERMEDIADOR = ' + QuotedStr(vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString) +
                ' AND INTERM_NUMVEND > 0 ';

              dataSet.Filtered := True;

              if not dataSet.IsEmpty then
              begin
                vvalorecommerce := vDadosIni.StrToFloatFormat(DataSet.FieldByName('valordoc').AsFloat, 2);

                vControle.DataSet.IndexFieldNames := 'NOME_CTRL';

                if (vDadosIni.vEcommerce.vLancarTaxaIntermPag <> 'DINHEIRO') then
                  vControle.FindNearest([trim(vEcommerce.dataSet.FieldByName('NOME_CTRL').AsString)])
                else
                  vControle.FindNearest(['DINHEIRO']);

                if vDadosIni.vSistema = 'Cxl' then
                begin
                  vLancCxl.insereLancamento(FtipoVenda, 'S', '', 'BX TAXA INTERMEDIADOR PAG E-COMMERCE ' +
                    FtipoVenda + ': ' + inttostr(numeroVenda), vvalorecommerce, numeroVenda, 0, 'S');
                  //          vFecDiaCxl.alteraSaldo('S', FvalorInformado - FvalorVenda);
                end;
                if not (DataSet.state in [dsInsert, dsEdit]) then
                  Insert;

                if (vDadosIni.vEcommerce.vLancarTaxaIntermPag <> 'DINHEIRO') then
                  DataSet.FieldByName('cod_controle').AsInteger := vEcommerce.dataSet.FieldByName('COD_CONTROLE').AsInteger
                else
                  DataSet.FieldByName('cod_controle').AsInteger := 1;

                //        if valorRecebimento <= 0 then
                DataSet.FieldByName('metodo_pag_id').AsInteger :=
                  vEcommerce.dataSet.FieldByName('metodo_pag_id').AsInteger;
                DataSet.FieldByName('local_venda').AsString :=
                  vEcommerce.dataSet.FieldByName('local_venda').AsString;
                DataSet.FieldByName('intermediador').AsString :=
                  vEcommerce.dataSet.FieldByName('intermediador').AsString;

                DataSet.FieldByName('tpdocs').AsString := 'INTERM';

                if (vDadosIni.vEcommerce.vLancarTaxaIntermPag <> 'DINHEIRO') then
                  DataSet.FieldByName('tipdoc').AsString := vEcommerce.dataSet.FieldByName('DOCS').AsString
                else
                  DataSet.FieldByName('tipdoc').AsString := 'N';

                if vDadosIni.vSistema = 'Cxl' then
                  DataSet.FieldByName('historico').AsString :=
                    vLancCxl.DataSet.FieldByName('HISTORICO_CXL').AsString
                else
                  DataSet.FieldByName('historico').AsString :=
                    'BX TAXA INTERMEDIADOR PAG E-COMMERCE ' + 'CLIENTE: ' + nomeCliente;
                DataSet.FieldByName('valordoc').AsFloat := vDadosIni.StrToFloatFormat((-1) * vvalorecommerce, 2);
                DataSet.FieldByName('valor_contabil').AsFloat := vDadosIni.StrToFloatFormat(DataSet.FieldByName('valordoc').AsFloat, 2);
                DataSet.FieldByName('recibo').AsString := 'N';
                //DataSet.FieldByName('REC_TIPVEND').AsString := FtipoVenda;
                //DataSet.FieldByName('REC_NUMVEND').AsInteger := FnumeroVenda;
                DataSet.FieldByName('interm_numvend').AsInteger := FnumeroVendaEcommerce;
                if vLancCxl.dataSet.Active then
                begin
                  if vLancCxl.DataSet.FieldByName('COD_LANCXL').AsInteger > 0 then
                    DataSet.FieldByName('nrequisicao').AsInteger := vLancCxl.DataSet.FieldByName('COD_LANCXL').AsInteger
                  else
                    DataSet.FieldByName('nrequisicao').AsInteger := FnumeroVendaEcommerce;
                end
                else
                  DataSet.FieldByName('nrequisicao').AsInteger := FnumeroVendaEcommerce;
                  
                Inc(vseqform);
                if DataSet.State = dsInsert then
                  DataSet.FieldByName('SEQFORM').AsInteger := vseqform;//GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);

                DataSet.FieldByName('TIP_CNT').Value := Null;//no recibo este registro não pode ser contabil, apenas a entrada
        //        DataSet.FieldByName('N_REC').AsInteger := FnumeroVendaEcommerce;
                dataSet.Post;
              end;
            finally
              DataSet.Filtered := False;
              DataSet.IndexFieldNames := 'SEQFORM';
            end;
          end;

          vEcommerce.dataSet.Next;
      end;
    end;

    if (trim(FtipoVenda) = 'MOT') and (FvalorVenda = 0) and (FvalorInformado = FvalorVenda)
    and (vDadosIni.vEmp.vVersaoVeiculos = '4') then
    //  Quando o valor do plano de veículos for zerado, deixar confirmar o recebimento sem informar nenhuma forma de pagamento
    else if FvalorInformado > FvalorVenda then
    begin
      if Application.MessageBox(pchar('Troco: ' + format('%m', [FvalorInformado - FvalorVenda]) +
        ' Lançar?'),
        'Confirmáção', MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        vtroco := true;
        vControle.DataSet.IndexFieldNames := 'NOME_CTRL';
        vControle.FindNearest(['DINHEIRO']);
        if vDadosIni.vSistema = 'Cxl' then
        begin
          vLancCxl.insereLancamento(FtipoVenda, 'S', 'S', 'TROCO NO RECEBIMENTO ' +
            FtipoVenda + ': ' + inttostr(numeroVenda), FvalorInformado - FvalorVenda, numeroVenda);
          //          vFecDiaCxl.alteraSaldo('S', FvalorInformado - FvalorVenda);
        end;
        if not (DataSet.state in [dsInsert, dsEdit]) then
          Insert;

        DataSet.FieldByName('tpdocs').AsString := 'TRC';
        DataSet.FieldByName('tipdoc').AsString := 'N';

        DataSet.FieldByName('REC_TIPVEND').AsString := FtipoVenda;
        DataSet.FieldByName('REC_NUMVEND').AsInteger := FnumeroVenda;

        DataSet.FieldByName('historico').AsString := 'TROCO NO RECEBIMENTO ' +
          FtipoVenda + ': ' + inttostr(numeroVenda);
        DataSet.FieldByName('valordoc').AsFloat := (-1) * (FvalorInformado - FvalorVenda);
        DataSet.FieldByName('valor_contabil').AsFloat := DataSet.FieldByName('valordoc').AsFloat;
        if vLancCxl.dataSet.Active then
          if vLancCxl.DataSet.FieldByName('COD_LANCXL').AsInteger > 0 then
            DataSet.FieldByName('nrequisicao').AsInteger := vLancCxl.DataSet.FieldByName('COD_LANCXL').AsInteger;
        Inc(vseqform);    
        if DataSet.State = dsInsert then
          DataSet.FieldByName('SEQFORM').AsInteger := vseqform;//GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
        vControle.DataSet.IndexFieldNames := 'CODIGO_CTRL';
        vDadosIni.GravaAuditoria('FPG002', 'CONFIRMAR',
          'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda +
          ' LANCAMENTO DE TROCO: ' + Format('%0.2f', [(FvalorInformado - FvalorVenda)]), 'FORMPAGAMENTO', '', buscas);
      end;
    end
    else if (FvalorInformado = 0) and (vDadosIni.vSistema <> 'Cxl') then
      raise exception.Create('Forma de pagamento não informada');
    if ((FvalorInformado - valorTroco) < (FvalorVenda)) and (vDadosIni.vSistema <> 'Cxl') then
      raise exception.Create('Valor informado menor que o valor esperado');
  except
    on e: exception do
    begin
      result := false;
      registraErro(E.Message);
      Application.MessageBox(pchar(e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      vDadosIni.GravaAuditoria('FPG002', 'CONFIRMAR',
        'ERRO AO GRAVAR FORMA DE PAGAMENTO', 'FORMPAGAMENTO', '', buscas);
      exit;
    end;
  end;
  if ((FvalorVenda) <= (FvalorInformado - valorTroco)) or (vDadosIni.vSistema = 'Cxl') then
  begin
    if vDadosIni.vEmp.vUsarComissaoPorRecebimentoProporcional = 'S' then
      _verificaComissaoRecebimento_Proporcional;

    buscas.Close;
    buscas.SQL.Text := ' select case when (ndoc > 0) then 1 else 0 end formas, prcss from existe_formas(:pndoc, :ptipodoc, :pcod_empresa) ';
    buscas.ParamByName('pndoc').AsInteger := FnumeroVenda;
    buscas.ParamByName('ptipodoc').AsString := FtipoVenda;
    buscas.ParamByName('pcod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.Open;

    if ((buscas.FieldByName('formas').AsInteger > 0) and (buscas.FieldByName('prcss').AsString = 'N')) then
    	raise exception.Create('Documento já recebido, favor verificar!');

    vincjuros := 0;
    vincdesconto := 0;
    vvalorjuros := Abs(FvalorInformado - FvalorVenda);
    vvalordesconto := Abs(FvalorVenda - FvalorInformado);

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('SEQUENCIA').AsInteger := dataSet.FieldByName('SEQFORM').AsInteger;
      if (not vtroco) and (FvalorInformado > FvalorVenda) then //Lançar juros nos desconto
      begin
        dataSet.FieldByName('VL_JUROS').AsFloat := RoundTo(vvalorjuros / dataSet.RecordCount, -2);
        vincjuros := vincjuros + RoundTo(vvalorjuros / dataSet.RecordCount, -2);
      end;
//      else if (FvalorInformado < FvalorVenda) then // Lançar desconto nos recebimentos
//      begin
//        dataSet.FieldByName('VL_DESCONTO').AsFloat := RoundTo(vvalordesconto / dataSet.RecordCount, -2);
//        vincdesconto := vincdesconto + RoundTo(vvalordesconto / dataSet.RecordCount, -2);
//      end;
      dataSet.Post;

      dataSet.Next;
    end;

    if (not vtroco) and (FvalorInformado > FvalorVenda)
    	and (vincjuros > 0) and (vvalorjuros <> vincjuros) then //Lançar juros nos desconto
    begin
      dataSet.Edit;
      dataSet.FieldByName('VL_JUROS').AsFloat := dataSet.FieldByName('VL_JUROS').AsFloat +
        (vvalorjuros - vincjuros);
      dataset.Post;
    end;
//    else if (FvalorInformado < FvalorVenda)
//     and (vincdesconto > 0) and (vvalordesconto <> vincdesconto) then // Lançar desconto nos recebimentos
//    begin
//      dataSet.Edit;
//      dataSet.FieldByName('VL_DESCONTO').AsFloat := dataSet.FieldByName('VL_DESCONTO').AsFloat +
//        (vvalordesconto - vincdesconto);
//      dataset.Post;
//    end;

    IndexFieldNames := 'SEQUENCIA';

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
       dataSet.Edit;
       dataSet.FieldByName('SEQFORM').AsInteger := GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
       dataSet.FieldByName('CXL').AsString := vDadosIni.IfThen(vDadosIni.vSistema <> 'Cxl', 'N', 'S');
       dataSet.Post;

       dataSet.Next;
    end;
    dataSet.First;

    // Documento sem forma de pagamento
    if (dataSet.ChangeCount = 0) and (FvalorVenda = 0) and (FvalorInformado = FvalorVenda) then
      Result := True
    else
    	Result := Apply;
    if not Result then
    begin
      if vRecibo.vHistRec.dataSet.Active then
        vRecibo.vHistRec.dataSet.CancelUpdates;
      vRecibo.dataSet.CancelUpdates;
      if vLancCxl.dataSet.Active then
        vLancCxl.dataSet.CancelUpdates;
      dataSet.CancelUpdates;
//      if buscas.Transaction.InTransaction then
//     	  buscas.Transaction.Rollback;
      RollBackTransacao;
      Result := False;
      Exit;
    end;
    if vRecibo.dataSet.ChangeCount > 0 then
      if not vRecibo.Apply then
      begin
         if vRecibo.vHistRec.dataSet.Active then
           vRecibo.vHistRec.dataSet.CancelUpdates;
         vRecibo.dataSet.CancelUpdates;
         if vLancCxl.dataSet.Active then
           vLancCxl.dataSet.CancelUpdates;
         dataSet.CancelUpdates;
//         if buscas.Transaction.InTransaction then
//        	  buscas.Transaction.Rollback;
         RollBackTransacao;
         Result := False;
         Exit;
      end;
    confirmaRecibosEHistorico;
//    vRecibo.vHistRec.Apply;
    if vLancCxl.dataSet.ChangeCount > 0 then
      if not vLancCxl.Apply then
      begin
        if vRecibo.vHistRec.dataSet.Active then
           vRecibo.vHistRec.dataSet.CancelUpdates;
         vRecibo.dataSet.CancelUpdates;
         if vLancCxl.dataSet.Active then
           vLancCxl.dataSet.CancelUpdates;
         dataSet.CancelUpdates;
//         if buscas.Transaction.InTransaction then
//        	  buscas.Transaction.Rollback;
         RollBackTransacao;
         Result := False;
         Exit;
      end;
    //    vFecDiaCxl.dataSet.CancelUpdates;
    //    vFecDiaCxl.Apply;
        //    if (FcreditoCondicaoPagamento <> '') then
        //      vCondPag.insereNovaCondicao(FcreditoCondicaoPagamento);
    cadastraContas;
    // Atualizar pontos programa de fidelidade 
    if not setarPontosProgFidelidade then
    begin
      RollBackTransacao;
      Result := false;
      exit;
    end;

    if (trim(FtipoVenda) = 'REQ') or (trim(FtipoVenda) = 'OS') then
    begin
      buscas.Close;
      buscas.SQL.Text := 'update pedvenda set ' +
      	' cxl = ' + vDadosIni.IfThen(vDadosIni.vSistema <> 'Cxl', QuotedStr('N'), QuotedStr('S')) +
        ' where nped = ' + IntToStr(FnumeroVenda) +
        ' and tipo = ' + QuotedStr(trim(FtipoVenda)) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;
    end
    else if (trim(FtipoVenda) = 'MOT') then
    begin
      buscas.Close;
      buscas.SQL.Text := 'update com_fat set ' +
      	' cxl = ' + vDadosIni.IfThen(vDadosIni.vSistema <> 'Cxl', QuotedStr('N'), QuotedStr('S')) +
        ' where n_comando = ' + IntToStr(FnumeroVenda) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;
    end
    else if (trim(FtipoVenda) = 'REC') then
    begin
      buscas.Close;
      buscas.SQL.Text := 'update recibos set ' +
      	' cxl = ' + vDadosIni.IfThen(vDadosIni.vSistema <> 'Cxl', QuotedStr('N'), QuotedStr('S')) +
        ' where nrecibo = ' + IntToStr(FnumeroVenda) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;
    end;
    
    if not atualizarNumDocRecProgFid then
    begin
      RollBackTransacao;
      Result := false;
      exit;
    end;

    CommitaTransacao;

    if Trim(FtipoVenda) = 'NF' then
    begin
      dataSet.First;
      while not dataSet.Eof do
      begin
        if Trim(DataSet.FieldByName('tpdocs').AsString) = 'NF' then
        begin
          DataSet.Edit;
          DataSet.FieldByName('md5').AsString := vDadosIni.Sign_RSA_MD5_SomenteTexto(
            Trim(dataSet.FieldByName('data_mov').AsString) + '|' +
            Trim(dataSet.FieldByName('cod_controle').AsString) + '|' +
            dataSet.FieldByName('valordoc').AsString + '|');
          DataSet.Post;
        end;
        dataSet.Next;
      end;
      if dataSet.ChangeCount > 0 then
      begin
        Apply;
        CommitaTransacao;
      end;
    end;

    // Para veiculos em demostração onde o valor é 0.
    if (FvalorInformado = FvalorVenda) and ((FtipoVenda = 'MOT') or (FtipoVenda = 'OS')) and (FvalorInformado = 0) then
      Result := True;
    if FtipoVenda = 'MOT' then
      if vPlano.vDadosPlano.mot_Valor_retorno > 0 then
      begin
        if vPlano.vDadosPlano.mot_OS_montada then
        begin
          vTemp := 'ORDEM_SERV';
        end;
      end
      else if vPlano.vDadosPlano.mot_Valor_Interm > 0 then
      begin
        if vPlano.vDadosPlano.mot_OS_Inter then
        begin
          vTemp := 'ORDEM_SERV';
        end;
      end;

    if (fReimprimirBoletosAlterados) and (FNum_Nf > 0) then
    begin
      Application.MessageBox('Os valores dos boletos foram alterados, favor reimprimir!', 'Atenção', 0 + 64);
      vImpBol := TBoleto.Create;
      try
      	vImpBol._BoletosNFOS(
        	FNum_Nf,
          FSerie_Nf,
          'NF',
          FCod_ClienteNf,
          '',
          true,
          true,
          vDadosIni.retornaArrayAplicativo,
          vDadosIni.retornaArrayContato(FCod_ClienteNf, cBoleto),
          cBoleto
        );
      finally
      	vImpBol.Free;
        vImpBol := nil;
      end;
    end;

    if ((Trim(FtipoVenda) = 'REQ') or (Trim(FtipoVenda) = 'OS') or (Trim(FtipoVenda) = 'REC')) then
      if _verificaBoletosOS then
      begin
        CommitaTransacao;
        if not vDadosIni.vBoletos.ExisteConvenio then
          exit;

        if (Trim(FtipoVenda) = 'REQ') then
        begin
          if not vDadosIni.PesqPros('FPG037', 'ABRIR',
          'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
          'FORMPAGAMENTO', '', dtmFP.qrBuscas, True) then
            Exit;
        end
        else if (Trim(FtipoVenda) = 'OS') then
        begin
          if not vDadosIni.PesqPros('FPG020', 'ABRIR',
           'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
           'FORMPAGAMENTO', '', dtmFP.qrBuscas, True) then
            Exit;
        end
        else if (Trim(FtipoVenda) = 'REC') then
        begin
          if not vDadosIni.PesqPros('FPG039', 'ABRIR',
          'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
          'FORMPAGAMENTO', '', dtmFP.qrBuscas, True) then
            Exit;
        end;

        vImpBol := TBoleto.Create;
        try
        	vImpBol._BoletosNFOS(
          	FnumeroVenda,
            0,
            Trim(FtipoVenda),
            FcodigoCliente,
            '',
            true,
            true,
            vDadosIni.retornaArrayAplicativo,
            vDadosIni.retornaArrayContato(FcodigoCliente, cBoleto),
          	cBoleto
          );
        finally
        	vImpBol.Free;
          vImpBol := nil;
        end;
      end
      else
        RollBackTransacao;
  end;
//  if (vDadosIni.vSistema = 'Cxl') then
//  begin
//    //ShowMessage('1');
//    if FvalorInformado = 0 then
//    begin //ShowMessage('2');
//      try
//        if not (DataSet.state in [dsInsert, dsEdit]) then
//          Insert;
//        DataSet.FieldByName('tpdocs').AsString := FtipoVenda;
//        DataSet.FieldByName('tipdoc').AsString := '0';
//        DataSet.FieldByName('historico').AsString := 'APAGAR';
//        DataSet.FieldByName('valordoc').AsFloat := 0;
//        DataSet.FieldByName('valor_contabil').AsFloat := DataSet.FieldByName('valordoc').AsFloat;
//        DataSet.FieldByName('nrequisicao').AsInteger := FnumeroVenda;
//        if DataSet.State = dsInsert then
//          DataSet.FieldByName('SEQFORM').AsInteger := GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo,
//            vDadosIni.codEmpresa);
//        dataSet.Post;
//        Apply;
//        CommitaTransacao;
//      except
//        on e: exception do
//        begin
//          Application.MessageBox(pchar('Erro ao gerar registro para o Cxl. Erro: ' + e.Message), 'Atenção', 0 + 64);
//        end;
//      end;
//    end;
//    Result := True;
//  end;
	imprimirReciboPontosProgFidelidade(vnumeroVenda, vtipoVenda);
end;

function TFormPag2.confirmaRecibosEHistorico: Boolean;
var
  I: Integer;
begin
  dataSet.First;
  while not dataSet.Eof do
  begin
    if (dataSet.FieldByName('n_rec').AsInteger > 0) and
      (dataSet.FieldByName('REC_TIPVEND').AsString = 'REC') then
    begin
      if vRecibo.vHistRec.dataSet.Active then
      begin
        vRecibo.vHistRec.dataSet.Filtered := False;
        vRecibo.vHistRec.dataSet.Filter := 'nrecibo = ' + dataSet.FieldByName('n_rec').AsString + ' and ndocant = ' + IntToStr(FnumeroVenda) +' and tp_doc_baixa = ' + QuotedStr(FtipoVenda);
        vRecibo.vHistRec.dataSet.Filtered := True;

        vRecibo.vHistRec.dataSet.First;
        while not vRecibo.vHistRec.dataSet.Eof do
        begin
          buscas.Close;
          buscas.SQL.Text := 'insert into HIST_REC (SEQCAD_REC, COD_EMPRESA, ' +
          	' NRECIBO, VALOR_BAIXA, VALOR_RECIBO, DATA_REC, ' +
            ' RECANT, NDOCANT, DATA_BAIXA, HISTORICO_REC, COD_US, OP_CXL, TP_DOC_BAIXA, TP_BAIXA, COD_UNIFICADA)' +
            Format(' values ((select cod from incrementa_codigo(%s, %s)), :COD_EMPRESA, ' +
            ' :NRECIBO, :VALOR_BAIXA, :VALOR_RECIBO, :DATA_REC, ' +
            ' :RECANT, :NDOCANT, :DATA_BAIXA, :HISTORICO_REC, :COD_US, :OP_CXL, :TP_DOC_BAIXA, :TP_BAIXA, :COD_UNIFICADA)',
            [vDadosIni.codEmpresa, QuotedStr('HIST_REC')]);
          for I := 0 to buscas.ParamCount - 1 do
            buscas.Params[I].Value := vRecibo.vHistRec.dataSet.FieldByName(buscas.Params[I].Name).Value;
          buscas.ExecSQL;
          vRecibo.vHistRec.dataSet.Next;
        end;
      end;
    end;
    dataSet.Next;
  end;
  if vRecibo.vHistRec.dataSet.Active then
    vRecibo.vHistRec.dataSet.CancelUpdates;
end;

constructor TFormPag2.create;
begin
  if dtmFP = nil then
    dtmFP := TdtmFP.Create(dtmFP);
  DataSet := TClientDataSet(dtmFP.cdsFormPag);
  vDtSet := TClientDataSet(dtmFP.cdsFormPag2);

  DataSet.OnCalcFields := dtSetCalcFields;

  transacao := TIBTransaction(dtmFP.transacao);
  buscas := TIBQuery(dtmFP.qrBuscas);
  buscas2 := TIBQuery(dtmFP.qrBuscas2);
  fCtrl := TClientDataSet(dtmFP.cdsCtrl);

  vEcommerce := TECommerce.Create;
  vRecibo := TReciboFP.Create;
  vBanco := TBancoFP.create;
  vControle := TControleFP.Create;
  vJuros := TJurosFP.create;
  vCondPag := TCondPagFP.create;
  vLancCxl := TLancamentoCxlFP.create;
  vFunc := TFuncionarios.create;
  vContabanc := TContasBancariasForPag.create;
  vTermCartao := TTerminalAdmCartao_FP.create;
  vBandCartao := TBandeiraCartao_FP.create;
  //  vFecDiaCxl := TFechDiaCxlFP.create;
  FlkCondPag := TDadosLookUp_OOP.create;
  vVincIntermPag := TVincIntermPag.create;
  vValeCupomPrgFid := TValeCupomPrgFid.create;

  FcreditoCondicaoPagamento := '';
  FreciboNumeroRecibo := 0;
  FvalorTotalRecibos := 0;
  Fcontabil := False;
  FcreditoQtdeParcelas := 0;
  FvalorTotalCreditos := 0;
  FvalorTotalCheques := 0;
  FvalorVenda := 0;
  FchequeDataVencimento := date;
  FvalorTotalCarteira := 0;
  FvalorTroco := 0;
  FvalorTotalDinheiro := 0;
  FchequeNumeroCheque := '';
  FcreditoNomeTerceiro := '';
  FchequeNomeTerceiro := '';
  FchequeNumeroBanco := '';
  FcreditoJurosUtil := 0;
  FcreditoImprimirCarne := False;
  FvalorInformado := 0;
  FchequeConta := '';
  FchequeAgencia := '';
  FcarteiraHistorico := '';
  FreciboValorRecibo := 0;
  FcreditoCodigoTerceiro := 0;
  FcarteiraValorDinheiro := 0;
  FchequeCodigoTerceiro := 0;
  FcreditoHistorico := '';
  FchequeHistorico := '';
  FvalorQueFaltaInformar := 0;
  FcreditoValorCredito := 0;
  FcreditoValorCreditoLiq := 0;
  FchequeValorCheque := 0;
end;

function TFormPag2.deletarFormPag(pBuscas: TIBQuery): Boolean;
var
  buscasCampos, buscasExec: TIBQuery;
begin
	try
    Result := True;
    if pBuscas.IsEmpty then
      Exit;

    buscasCampos := TIBQuery.Create(Application);
    buscasCampos.Database := pBuscas.Database;
    buscasCampos.Transaction := pBuscas.Transaction;

    buscasExec := TIBQuery.Create(Application);
    buscasExec.Database := pBuscas.Database;
    buscasExec.Transaction := pBuscas.Transaction;

    buscasCampos.Close;
    buscasCampos.SQL.Text := '	select rdb$field_name campo from rdb$relation_fields ' +
      ' where rdb$relation_name = ''FORMPAGAMENTO_DELPRCSS'' ';
    buscasCampos.Open;

    pBuscas.First;
    while not pBuscas.Eof do
    begin
      buscasExec.Close;
      buscasExec.SQL.Text := 'INSERT INTO FORMPAGAMENTO_DELPRCSS (';

      buscasCampos.First;
      while not buscasCampos.Eof do
      begin
        if buscasCampos.RecNo = 1 then
          buscasExec.SQL.Text := buscasExec.SQL.Text + trim(buscasCampos.FieldByName('CAMPO').AsString)
        else
          buscasExec.SQL.Text := buscasExec.SQL.Text + ', ' + trim(buscasCampos.FieldByName('CAMPO').AsString);

        buscasCampos.Next;
      end;

      buscasExec.SQL.Text := buscasExec.SQL.Text + ') VALUES (';

      buscasCampos.First;
      while not buscasCampos.Eof do
      begin
        if buscasCampos.RecNo = 1 then
          buscasExec.SQL.Text := buscasExec.SQL.Text + ':' + trim(buscasCampos.FieldByName('CAMPO').AsString)
        else
          buscasExec.SQL.Text := buscasExec.SQL.Text + ', ' + ':' + trim(buscasCampos.FieldByName('CAMPO').AsString);

        buscasCampos.Next;
      end;

      buscasExec.SQL.Text := buscasExec.SQL.Text + ');';

      buscasCampos.First;
      while not buscasCampos.Eof do
      begin
      	if pBuscas.FindField(trim(buscasCampos.FieldByName('CAMPO').AsString)) <> nil then
          buscasExec.ParamByName(trim(buscasCampos.FieldByName('CAMPO').AsString)).Value :=
            pBuscas.FieldByName(trim(buscasCampos.FieldByName('CAMPO').AsString)).Value;

        buscasCampos.Next;
      end;

      buscasExec.ExecSQL;


      pBuscas.Next;
    end
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      vDadosIni.registraErro('TFormPag2.deletarFormPag ' + e.Message);
    end;
  end;
end;

function TFormPag2.delete: boolean;
var
  vNRec, vRecNo: Integer;
begin
  if vDtSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'B' then
  begin
    Application.MessageBox('Forma de pagamento gerada por boletos bancários. Não é permitido alterar ou excluir', 'Atenção', 0 + 64);
    Exit;
  end
  else if vDtSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'V' then
  begin
    Application.MessageBox('Forma de pagamento gerada por Vale Compra de Devoluções ou Recibo Antecipado. Não é permitido alterar ou excluir', 'Atenção', 0 + 64);
    Exit;
  end
  else if vDtSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'C' then
  begin
    Application.MessageBox('Forma de pagamento eletrônica(Cartões ou Carteiras digitais). Não é permitido alterar ou excluir', 'Atenção', 0 + 64);
    Exit;
  end
  else if vDtSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'P' then
  begin
    Application.MessageBox('Forma de pagamento gerada por Vale Resgate. Não é permitido alterar ou excluir', 'Atenção', 0 + 64);
    Exit;
  end
  else if vDtSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'L' then
  begin
    Application.MessageBox('Forma de pagamento gerada por Locação. Não é permitido alterar ou excluir', 'Atenção', 0 + 64);
    Exit;
  end
  else if vDtSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'F' then
  begin
    Application.MessageBox('Forma de pagamento gerada por Vale - Programa de Fidelidade. Não é permitido alterar ou excluir', 'Atenção', 0 + 64);
    Exit;
  end
  else if vDtSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'R' then
  begin
    Application.MessageBox('Forma de pagamento gerada pelos valores de Retenção em Documentos Fiscais. Não é permitido alterar ou excluir', 'Atenção', 0 + 64);
    Exit;
  end
  else if vDtSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'I' then
  begin
    Application.MessageBox('Forma de pagamento gerada pelos valores de Retenção em Documentos Fiscais. Não é permitido alterar ou excluir', 'Atenção', 0 + 64);
    Exit;
  end;
  vRecNo := vDtSet.RecNo;
  try

//  FindNearest([vDtSet.FieldByName('SEQFORM').AsInteger]);

  vControle.DataSet.IndexFieldNames := 'CODIGO_CTRL';
//  vControle.FindNearest([DataSet.FieldByName('cod_controle').AsInteger]);
//  if vDtSet.FieldByName('SEQFORM').AsInteger = dataSet.FieldByName('SEQFORM').AsInteger then
  if dataSet.Locate('SEQFORM', vDtSet.FieldByName('SEQFORM').AsInteger, []) then
  if vDtSet.FieldByName('SEQFORM').AsInteger = dataSet.FieldByName('SEQFORM').AsInteger then
  if vControle.dataSet.Locate('CODIGO_CTRL', dataSet.FieldByName('cod_controle').AsInteger, []) then
  begin
    if not _validaPoliticasDescontos(FcreditoValorCredito,0,0,true) then
    begin
      Result := False;
      Exit;
    end;
    if not vDadosIni.PesqPros('FPG008', 'EXCLUIR',
      'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda +
      ' NDOC/CH: ' + DataSet.FieldByName('ndoc').AsString +
      ' TP: ' + DataSet.FieldByName('tipdoc').AsString +
      ' VALOR: '+ Format('%m', [DataSet.FieldByName('valorDoc').AsFloat]),
      'FORMPAGAMENTO', '', buscas, True) then
      Exit;
    vNRec:=0;
    if DataSet.FieldByName('recibo').AsString = 'S' then
    begin
      vRecibo.removerRecibodoLancamento(dataSet.FieldByName('REC_NUMVEND').AsInteger, FnumeroVenda,
        dataSet.FieldByName('VALORDOC').AsFloat,  FtipoVenda);
      vNRec := dataSet.FieldByName('REC_NUMVEND').AsInteger;
    end;

    if not dataSet.FieldByName('metodo_pag_id').IsNull then
    begin
      try
        vEcommerce.dataSet.Filter :=  'METODO_PAG_ID = ' + IntToStr(dataSet.FieldByName('metodo_pag_id').AsInteger);
        vEcommerce.DataSet.Filtered := True;

        try
        	vEcommerce.dataSet.DisableControls;
          vEcommerce.dataSet.First;
          while not vEcommerce.dataSet.Eof do
          begin
            vEcommerce.dataSet.Edit;
            vEcommerce.dataSet.FieldByName('UTILIZADO').Value := Null;
            vEcommerce.dataSet.FieldByName('COD_CONTROLE').Value := Null;
            vEcommerce.dataSet.FieldByName('NOME_CTRL').Value := Null;
            vEcommerce.dataSet.FieldByName('DOCS').Value := Null;
            vEcommerce.dataSet.Post;

            vEcommerce.dataSet.Next;
          end;
        finally
          vEcommerce.dataSet.EnableControls;
        end;
      finally
        vEcommerce.DataSet.Filtered := False;
        vEcommerce.DataSet.IndexFieldNames := 'METODO_PAG_ID';
      end;
    end;

    if not removerLancamentoValeProgFid then
      exit;

    Result := inherited delete;

    if vNRec > 0 then
      try
        dataSet.Filter := 'n_rec = ' + IntToStr(vNRec);
        dataSet.Filtered := True;

        while dataSet.FieldByName('n_rec').AsInteger = vNRec do
          dataSet.Delete;

      finally
        dataSet.Filtered := False;
        dataSet.Filter := '';
      end;
    if Result then
      refazerNumDocumentoBoletos;
  end;
  cancelar;
  finally
    if vRecNo <= vDtSet.RecordCount then
      vDtSet.RecNo := vRecNo
    else if not vDtSet.IsEmpty then
      vDtSet.RecNo := vDtSet.RecordCount;
  end;
end;

destructor TFormPag2.Destroy;
begin
  if Assigned(vEcommerce) then FreeAndNil(vEcommerce);
  if Assigned(vRecibo) then FreeAndNil(vRecibo);
  if Assigned(vControle) then FreeAndNil(vControle);
  if Assigned(vBanco) then FreeAndNil(vBanco);
  if Assigned(vJuros) then FreeAndNil(vJuros);
  if Assigned(vCondPag) then FreeAndNil(vCondPag);

  if Assigned(vLancCxl) then FreeAndNil(vLancCxl);
  if Assigned(vFunc) then FreeAndNil(vFunc);
  if Assigned(vContabanc) then FreeAndNil(vContabanc);
  if Assigned(vTermCartao) then FreeAndNil(vTermCartao);
  if Assigned(vBandCartao) then FreeAndNil(vBandCartao);
  if Assigned(FlkCondPag) then FreeAndNil(FlkCondPag);
  if Assigned(vVincIntermPag) then FreeAndNil(vVincIntermPag);
  if Assigned(vValeCupomPrgFid) then FreeAndNil(vValeCupomPrgFid);

  inherited;
end;

procedure TFormPag2.detalhamentoVenda(numeroVenda: integer; serieNf,
  tipVenda: string; codigoUnificada: Integer = 0);
var
  vSqlTemp: WideString;
  vCodCondPag, vCodCliente, vCodVendedor: integer;
  vValorTotal: Currency;
  vTemp: string;
begin
  try
    vCodCondPag := 0;
    vCodCliente := 0;
    vCodVendedor := 0;
    vValorTotal := 0;

    dataSet := TClientDataSet(dtmFP.cdsDetalhes);
    if Trim(tipVenda) = 'NF' then
    begin
      vTemp := ' select fp.seqform, fp.data_mov, fp.tpdocs, fp.nrequisicao, fp.ndoc,ctr.nome_ctrl, fp.cod_cliente, fp.cliente,' +
        ' fp.historico, fp.valordoc, fp.data_venc, fp.terceiros, fp.tipdoc, fp.cod_controle,' +
        ' fp.cod_empresa,';
      if vDadosIni.vRecibo.HabRecPorDepart then
      begin
         vTemp := vTemp +
           ' case when fp.rec_tipvend = ''REC'' then ' +
           '     case when (trim(coalesce(rc.num_rec_dep, '''')) <> '''') then ' +
           '        ''RECIBO ANTECIPADO Nº ''||rc.num_rec_dep ' +
           '     else ' +
           '        ''RECIBO ANTECIPADO Nº ''||fp.rec_numvend ' +
           '     end ' +
           ' else ' +
           '   ctr.nome_ctrl ';
      end
      else
	      vTemp := vTemp +
	        ' case when fp.rec_tipvend = ''REC'' then ''RECIBO ANTECIPADO Nº ''||fp.rec_numvend else ctr.nome_ctrl ';
      vTemp := vTemp +
        ' end formaDePagamento, fp.n_processamento, fp.nosso_numero_banco, ' +
        ' fp.n_aut_cart, fp.n_docnsu_adm, fp.nparcela, fp.qtde_parc, ' +
        ' fp.cod_terminal_adm, fp.desc_terminal_adm, fp.cod_adm, fp.desc_adm, fp.cod_bandeira_adm, fp.desc_bandeira, '  +
        ' fp.rec_numvend, fp.rec_tipvend, fp.recibo, ';
      if vDadosIni.vRecibo.HabRecPorDepart then
      begin
        vTemp := vTemp +
          ' case when(fp.tpdocs = ''REC'') then ' +
    		  '   case when (trim(coalesce(rc.num_rec_dep, '''')) <> '''') then rc.num_rec_dep ' +
     		  '   else fp.nrequisicao end ' +
     		  ' else fp.nrequisicao ' +
    		  ' end num_rec_dep, ' +
     		  ' case when (fp.tpdocs = ''REC'') then ' +
    		  '   case when (trim(coalesce(rc.num_rec_dep, '''')) <> '''') then (rc.num_rec_dep||''-''||fp.nparcela) ' +
   		    '     else fp.ndoc end ' +
     		  ' else fp.ndoc ' +
    		  ' end num_rec_parc ';
      end
      else
         vTemp := vTemp + ''' '' num_rec_dep, '' '' num_rec_parc ';
      vTemp := vTemp +                                       
        ' from formpagamento fp ';
      if vDadosIni.vRecibo.HabRecPorDepart then
        vTemp := vTemp + ' left join recibos rc on rc.nrecibo = ' + vDadosIni.IfThen(Trim(tipVenda) = 'REC', ' fp.nrequisicao ', ' fp.rec_numvend ') +
         ' and rc.cod_empresa = fp.cod_empresa ';
      vTemp := vTemp +
        ' inner join controles ctr on ctr.codigo_ctrl = fp.cod_controle and ctr.codigo_emp = fp.cod_empresa ' +
        ' where fp.num_nota = ' + IntToStr(numeroVenda) +
        ' and fp.sub_serie = ' + Trim(serieNf) +
        ' and fp.tpdocs <> ''LCS'' ' +
        ' and fp.cod_empresa = ' + vDadosIni.retornoPorCondicao(
        (vDadosIni.vEmp.vFinanceiroUnificado) and (codigoUnificada > 0),
        IntToStr(codigoUnificada), vDadosIni.codEmpresa) +
        ' and fp.ativo = 1';
      montaSelect(vTemp);

      if (dataSet.IsEmpty) and (vDadosIni.vEmp.vModoFaturamento <> 'S') then
      begin
        buscas.Close;
        buscas.Sql.Text := 'select cod_cond_pag, cod_cliente, cod_vendedor, valor_total from notafiscal ' +
          ' where num_nf = ' + IntToStr(numeroVenda) + ' and natureza_nf = ''S'' ' +
          ' and serie = ' + QuotedStr(serieNf) +
          ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(
        	(vDadosIni.vEmp.vFinanceiroUnificado) and (codigoUnificada > 0),
          IntToStr(codigoUnificada), vDadosIni.codEmpresa) +
          ' and ativo = 1' +
          ' and status = ''Fechada''';
        buscas.Open;
        if not buscas.IsEmpty then
        begin
          vCodCondPag := buscas.FieldByName('cod_cond_pag').AsInteger;
          vCodCliente := buscas.FieldByName('cod_cliente').AsInteger;
          vCodVendedor := buscas.FieldByName('cod_vendedor').AsInteger;
          vValorTotal := buscas.FieldByName('valor_total').AsCurrency;
        end;
      end;

    end
    else
    begin
      if (vDadosIni.vEmp.vConfFormPagamento = 'PED') then
      begin
        vTemp := ' select fp.seqform, fp.data_mov, fp.tpdocs, fp.nrequisicao, fp.ndoc, ctr.nome_ctrl, fp.cod_cliente, fp.cliente, ' +
         ' fp.historico, fp.valordoc, fp.data_venc, fp.terceiros, fp.tipdoc, fp.cod_controle, ' +
         ' fp.cod_empresa, ';
        if vDadosIni.vRecibo.HabRecPorDepart then
        begin
           vTemp := vTemp +
             ' case when fp.rec_tipvend = ''REC'' then ' +
             '     case when (trim(coalesce(rc.num_rec_dep, '''')) <> '''') then ' +
             '        ''RECIBO ANTECIPADO Nº ''||rc.num_rec_dep ' +
             '     else ' +
             '        ''RECIBO ANTECIPADO Nº ''||fp.rec_numvend ' +
             '     end ' +
             ' else ' +
             '   ctr.nome_ctrl ';
        end
        else
          vTemp := vTemp +
            ' case when fp.rec_tipvend = ''REC'' then ''RECIBO ANTECIPADO Nº ''||fp.rec_numvend else ctr.nome_ctrl ';
        vTemp := vTemp +
         ' end formaDePagamento, fp.n_processamento, fp.nosso_numero_banco, ' +
         ' fp.n_aut_cart, fp.n_docnsu_adm, fp.nparcela, fp.qtde_parc, ' +
         ' fp.cod_terminal_adm, fp.desc_terminal_adm, fp.cod_adm, fp.desc_adm, fp.cod_bandeira_adm, fp.desc_bandeira, ' +
         ' fp.rec_numvend, fp.rec_tipvend, fp.recibo, ';
        if vDadosIni.vRecibo.HabRecPorDepart then
        begin
          vTemp := vTemp +
     	   	  ' case when(fp.tpdocs = ''REC'') then ' +
   			 	  '   case when (trim(coalesce(rc.num_rec_dep, '''')) <> '''') then rc.num_rec_dep ' +
   			 	  '   else fp.nrequisicao end ' +
   			    ' else fp.nrequisicao ' +
  		      ' end num_rec_dep, ' +
   			    ' case when (fp.tpdocs = ''REC'') then ' +
   			    '   case when (trim(coalesce(rc.num_rec_dep, '''')) <> '''') then (rc.num_rec_dep||''-''||fp.nparcela) ' +
  	 	      '     else fp.ndoc end ' +
   			    ' else fp.ndoc ' +
   			    ' end num_rec_parc ';
        end
        else
           vTemp := vTemp + ''' '' num_rec_dep, '' '' num_rec_parc ';
        vTemp := vTemp +   
          ' from formpagamento fp ';
        if vDadosIni.vRecibo.HabRecPorDepart then
          vTemp := vTemp + ' left join recibos rc on rc.nrecibo = ' + vDadosIni.IfThen(Trim(tipVenda) = 'REC', ' fp.nrequisicao ', ' fp.rec_numvend ') +
           ' and rc.cod_empresa = fp.cod_empresa ';
        vTemp := vTemp +
         ' inner join controles ctr on ctr.codigo_ctrl = fp.cod_controle and ctr.codigo_emp = fp.cod_empresa ' +
         ' where fp.nrequisicao = ' + IntToStr(numeroVenda) +
         ' and fp.tpdocs = ' + QuotedStr(tipVenda) +
         ' and fp.cod_empresa = ' + vDadosIni.retornoPorCondicao(
         (vDadosIni.vEmp.vFinanceiroUnificado) and (codigoUnificada > 0),
         IntToStr(codigoUnificada), vDadosIni.codEmpresa) +
         ' and fp.ativo = 1';
        montaSelect(vTemp);

        if (dataSet.IsEmpty)
        	and ((vDadosIni.vEmp.vModoFaturamento <> 'S')
          	or ((Trim(tipVenda) = 'REQ') and (vDadosIni.vPedVnd.ReceberPeloFinanceiro))
            or ((Trim(tipVenda) = 'OS') and (vDadosIni.vPedVnd.ReceberPeloFinanceiro))
            or ((Trim(tipVenda) = 'MOT') and (vDadosIni.vVeic.ReceberPeloFinanceiro))
          	or ((Trim(tipVenda) = 'REC') and (vDadosIni.vRecibo.ReceberPeloFinanceiro))
            ) then
        begin
          if ((Trim(tipVenda) = 'REQ') or (Trim(tipVenda) = 'OS'))
          	and ((vDadosIni.vPedVnd.ReceberPeloFinanceiro) or (vDadosIni.vEmp.vModoFaturamento <> 'S')) then
          begin
            buscas.Close;
            buscas.Sql.Text := 'select cod_cond_pag, cod_cliente, cod_vendedor, valor_total from pedvenda ' +
              ' where nped = ' + IntToStr(numeroVenda) +
              ' and tipo = ' + QuotedStr(tipVenda) +
              ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(
           	  (vDadosIni.vEmp.vFinanceiroUnificado) and (codigoUnificada > 0),
              IntToStr(codigoUnificada), vDadosIni.codEmpresa) +
              ' and ativo = 1' +
              ' and status_ped = ''FECHADA'' ';
            buscas.Open;
            if not buscas.IsEmpty then
            begin
              vCodCondPag := buscas.FieldByName('cod_cond_pag').AsInteger;
              vCodCliente := buscas.FieldByName('cod_cliente').AsInteger;
              vCodVendedor := buscas.FieldByName('cod_vendedor').AsInteger;
              vValorTotal := buscas.FieldByName('valor_total').AsCurrency;
            end;
          end
          else if (Trim(tipVenda) = 'REC')
          	and ((vDadosIni.vRecibo.ReceberPeloFinanceiro) or (vDadosIni.vEmp.vModoFaturamento <> 'S')) then
          begin
            buscas.Close;
            buscas.Sql.Text := 'select 1 cod_cond_pag, cod_devedor, cod_us, valor_orig' +
            //' from recibos where nrecibo = ' + IntToStr(FnumeroVenda) +
              ' from recibos ' +
              ' where nrecibo = ' + IntToStr(numeroVenda) +
              ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(
        	    (vDadosIni.vEmp.vFinanceiroUnificado) and (codigoUnificada > 0),
              IntToStr(codigoUnificada), vDadosIni.codEmpresa) +
              ' and ativo = 1'; // and ((recant = ''S'') or (recant = ''O'') or (recant is null))';
            buscas.Open;
            if not buscas.IsEmpty then
            begin
              vCodCondPag := buscas.FieldByName('cod_cond_pag').AsInteger;
              vCodCliente := buscas.FieldByName('cod_devedor').AsInteger;
              vCodVendedor := buscas.FieldByName('cod_us').AsInteger;
              vValorTotal := buscas.FieldByName('valor_orig').AsCurrency;
            end;
          end
          else if (Trim(tipVenda) = 'MOT')
          	and ((vDadosIni.vVeic.ReceberPeloFinanceiro) or (vDadosIni.vEmp.vModoFaturamento <> 'S')) then
          begin
            buscas.Close;
            buscas.Sql.Text := 'select condpag_v, clientes_v, codigo_us, valor_a_rec from com_fat ' +
              ' where n_comando = ' + IntToStr(numeroVenda) +
              ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(
            	(vDadosIni.vEmp.vFinanceiroUnificado) and (codigoUnificada > 0),
              IntToStr(codigoUnificada), vDadosIni.codEmpresa) +
              ' and natureza = ''S'' ' +
              ' and status_v = ''FECHADO'' ' +
              ' and ativo = 1'; // and ((recant = ''S'') or (recant = ''O'') or (recant is null))';
            buscas.Open;
            if not buscas.IsEmpty then
            begin
              vCodCondPag := buscas.FieldByName('condpag_v').AsInteger;
              vCodCliente := buscas.FieldByName('clientes_v').AsInteger;
              vCodVendedor := buscas.FieldByName('codigo_us').AsInteger;
              vValorTotal := buscas.FieldByName('valor_a_rec').AsCurrency;
            end;
          end;
        end;
      end
      else
      begin
        if (Trim(tipVenda) <> 'REC') then
        begin
          if (Trim(tipVenda) = 'MOT') then
          begin
          	buscas.Close;
            buscas.SQL.Text := ' select cf.num_nota_v as n_nf, cf.sub_serie as serie from com_fat cf ' +
              ' where cf.n_comando = ' + IntToStr(numeroVenda) +
              ' and cf.cod_empresa = ' + vDadosIni.retornoPorCondicao(
             	(vDadosIni.vEmp.vFinanceiroUnificado) and (codigoUnificada > 0),
              IntToStr(codigoUnificada), vDadosIni.codEmpresa);
            buscas.Open;  
          end
          else
          begin
            buscas.Close;
            buscas.SQL.Text := 'select pp.n_nf, pp.serie from pedvenda_prod pp' +
              ' where pp.nped = ' + IntToStr(numeroVenda) + ' and pp.tipo = ' + QuotedStr(tipVenda) +
              ' and pp.cod_empresa = ' + vDadosIni.retornoPorCondicao(
      		  	(vDadosIni.vEmp.vFinanceiroUnificado) and (codigoUnificada > 0),
			        IntToStr(codigoUnificada), vDadosIni.codEmpresa) +
              ' and pp.ativo = 1' +
              ' and ((pp.status is null) or (pp.status <> ''CANCELADO'')) and pp.n_nf > 0 and pp.serie <> ''''' +
              ' union' +
              ' select ps.n_nf, ps.serie from pedvenda_serv ps' +
              ' where ps.nped = ' + IntToStr(numeroVenda) + ' and ps.tipo = ' + QuotedStr(tipVenda) +
              ' and ps.cod_empresa = ' + vDadosIni.retornoPorCondicao(
      		  	(vDadosIni.vEmp.vFinanceiroUnificado) and (codigoUnificada > 0),
			        IntToStr(codigoUnificada), vDadosIni.codEmpresa) +
              ' and ps.ativo = 1' +
              ' and ((ps.status is null) or (ps.status <> ''CANCELADO'')) and ps.n_nf > 0 and ps.serie <> ''''' +
              ' group by 1,2';
            buscas.Open;
          end;

          vSqlTemp := '';
          buscas.First;
          while not buscas.Eof do
          begin
            if vSqlTemp = '' then
              vSqlTemp := '((fp.num_nota = ' + buscas.FieldByName('n_nf').AsString +
                ' and fp.sub_serie = ' + Trim(buscas.FieldByName('serie').AsString) + ')'
            else
              vSqlTemp := vSqlTemp + ' or (fp.num_nota = ' + buscas.FieldByName('n_nf').AsString +
                ' and fp.sub_serie = ' + Trim(buscas.FieldByName('serie').AsString) + ')';
            buscas.Next;
          end;
          vSqlTemp := vSqlTemp + ')';
          if buscas.IsEmpty then
            vSqlTemp := '(fp.num_nota = 0 and fp.sub_serie = 0)';

          vTemp := ' select fp.seqform, fp.data_mov, fp.tpdocs, fp.nrequisicao, fp.ndoc, ctr.nome_ctrl, fp.cod_cliente, fp.cliente, ' +
            ' fp.historico, fp.valordoc, fp.data_venc, fp.terceiros, fp.tipdoc, fp.cod_controle, ' +
            ' fp.cod_empresa, ';
          if vDadosIni.vRecibo.HabRecPorDepart then
          begin
             vTemp := vTemp +
               ' case when fp.rec_tipvend = ''REC'' then ' +
               '     case when (trim(coalesce(rc.num_rec_dep, '''')) <> '''') then ' +
               '        ''RECIBO ANTECIPADO Nº ''||rc.num_rec_dep ' +
               '     else ' +
               '        ''RECIBO ANTECIPADO Nº ''||fp.rec_numvend ' +
               '     end ' +
               ' else ' +
               '   ctr.nome_ctrl ';
          end
          else
            vTemp := vTemp +
              ' case when fp.rec_tipvend = ''REC'' then ''RECIBO ANTECIPADO Nº ''||fp.rec_numvend else ctr.nome_ctrl ';
          vTemp := vTemp +
            ' end formaDePagamento, fp.n_processamento, fp.nosso_numero_banco, ' +
            ' fp.n_aut_cart, fp.n_docnsu_adm, fp.nparcela, fp.qtde_parc, ' +
            ' fp.cod_terminal_adm, fp.desc_terminal_adm, fp.cod_adm, fp.desc_adm, fp.cod_bandeira_adm, fp.desc_bandeira, ' +
            ' fp.rec_numvend, fp.rec_tipvend, fp.recibo, ';
          if vDadosIni.vRecibo.HabRecPorDepart then
          begin
            vTemp := vTemp +
     		   	  ' case when(fp.tpdocs = ''REC'') then ' +
   				 	  '   case when (trim(coalesce(rc.num_rec_dep, '''')) <> '''') then rc.num_rec_dep ' +
   				 	  '   else fp.nrequisicao end ' +
   				    ' else fp.nrequisicao ' +
  		   		  ' end num_rec_dep, ' +
   				    ' case when (fp.tpdocs = ''REC'') then ' +
   				    '   case when (trim(coalesce(rc.num_rec_dep, '''')) <> '''') then (rc.num_rec_dep||''-''||fp.nparcela) ' +
  	 	 	      '     else fp.ndoc end ' +
   				    ' else fp.ndoc ' +
   				    ' end num_rec_parc ';
          end
          else
             vTemp := vTemp + ''' '' num_rec_dep, '' '' num_rec_parc ';
          vTemp := vTemp +
            ' from formpagamento fp ';
          if vDadosIni.vRecibo.HabRecPorDepart then
		        vTemp := vTemp + ' left join recibos rc on rc.nrecibo = ' + vDadosIni.IfThen(Trim(tipVenda) = 'REC', ' fp.nrequisicao ', ' fp.rec_numvend ') +
    		     ' and rc.cod_empresa = fp.cod_empresa ';
          vTemp := vTemp +      
            ' inner join controles ctr on ctr.codigo_ctrl = fp.cod_controle and ctr.codigo_emp = fp.cod_empresa ' +
            ' where ' + vSqlTemp +
            ' and fp.tpdocs <> ''LCS'' ' +
            ' and fp.cod_empresa = ' + vDadosIni.retornoPorCondicao(
      		  (vDadosIni.vEmp.vFinanceiroUnificado) and (codigoUnificada > 0),
			      IntToStr(codigoUnificada), vDadosIni.codEmpresa) +
            ' and fp.ativo = 1 ';
          montaSelect(vTemp);
        end
        else
        begin
          vTemp := ' select fp.seqform, fp.data_mov, fp.tpdocs, fp.nrequisicao, fp.ndoc, ctr.nome_ctrl, fp.cod_cliente,fp.cliente, ' +
            ' fp.historico, fp.valordoc, fp.data_venc, fp.terceiros, fp.tipdoc, fp.cod_controle, ' +
            ' fp.cod_empresa, ';
          if vDadosIni.vRecibo.HabRecPorDepart then
          begin
             vTemp := vTemp +
               ' case when fp.rec_tipvend = ''REC'' then ' +
               '     case when (trim(coalesce(rc.num_rec_dep, '''')) <> '''') then ' +
               '        ''RECIBO ANTECIPADO Nº ''||rc.num_rec_dep ' +
               '     else ' +
               '        ''RECIBO ANTECIPADO Nº ''||fp.rec_numvend ' +
               '     end ' +
               ' else ' +
               '   ctr.nome_ctrl ';
          end
          else
            vTemp := vTemp +
              ' case when fp.rec_tipvend = ''REC'' then ''RECIBO ANTECIPADO Nº ''||fp.rec_numvend else ctr.nome_ctrl ';
          vTemp := vTemp +
            '   else ctr.nome_ctrl ' +
            ' end formaDePagamento, fp.n_processamento, fp.nosso_numero_banco, ' +
            ' fp.n_aut_cart, fp.n_docnsu_adm, fp.nparcela, fp.qtde_parc, ' +
            ' fp.cod_terminal_adm, fp.desc_terminal_adm, fp.cod_adm, fp.desc_adm, fp.cod_bandeira_adm, fp.desc_bandeira, ' +
            ' fp.rec_numvend, fp.rec_tipvend, fp.recibo, ';
          if vDadosIni.vRecibo.HabRecPorDepart then
          begin
            vTemp := vTemp +
     	   	   ' case when(fp.tpdocs = ''REC'') then ' +
   			 	   '   case when (trim(coalesce(rc.num_rec_dep, '''')) <> '''') then rc.num_rec_dep ' +
   			 	   '   else fp.nrequisicao end ' +
   			 	   ' else fp.nrequisicao ' +
  		   	   ' end num_rec_dep, ' +
   			 	   ' case when (fp.tpdocs = ''REC'') then ' +
   			 	   '   case when (trim(coalesce(rc.num_rec_dep, '''')) <> '''') then (rc.num_rec_dep||''-''||fp.nparcela) ' +
  	 	   	   '     else fp.ndoc end ' +
   			 	   ' else fp.ndoc ' +
   			 	   ' end num_rec_parc ';
          end
          else
             vTemp := vTemp + ''' '' num_rec_dep, '' '' num_rec_parc ';
          vTemp := vTemp +     
            '  from formpagamento fp ';
          if vDadosIni.vRecibo.HabRecPorDepart then
		        vTemp := vTemp + ' left join recibos rc on rc.nrecibo = ' + vDadosIni.IfThen(Trim(tipVenda) = 'REC', ' fp.nrequisicao ', ' fp.rec_numvend ') +
    		     ' and rc.cod_empresa = fp.cod_empresa ';
          vTemp := vTemp +
            ' inner join controles ctr on ctr.codigo_ctrl = fp.cod_controle and ctr.codigo_emp = fp.cod_empresa ' +
            ' where fp.nrequisicao = ' + IntToStr(numeroVenda) +
            ' and fp.tpdocs = ' + QuotedStr(tipVenda) +
            ' and fp.cod_empresa = ' + vDadosIni.retornoPorCondicao(
      		  (vDadosIni.vEmp.vFinanceiroUnificado) and (codigoUnificada > 0),
			      IntToStr(codigoUnificada), vDadosIni.codEmpresa) +
            ' and fp.ativo = 1 ';
          montaSelect(vTemp);

          if ((dataSet.IsEmpty) and (vDadosIni.vEmp.vModoFaturamento <> 'S') and (Trim(tipVenda) = 'REC')) then
          begin
            buscas.Close;
            buscas.Sql.Text := ' select 1 cod_cond_pag, cod_devedor, cod_us, valor_orig ' +
            //' from recibos where nrecibo = ' + IntToStr(FnumeroVenda) +
              ' from recibos ' +
              ' where nrecibo = ' + IntToStr(numeroVenda) +
              ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(
      		  	(vDadosIni.vEmp.vFinanceiroUnificado) and (codigoUnificada > 0),
			        IntToStr(codigoUnificada), vDadosIni.codEmpresa) +
              ' and ativo = 1'; //and ((recant = ''S'') or (recant = ''O''))';
            buscas.Open;
            if not buscas.IsEmpty then
            begin
              vCodCondPag := buscas.FieldByName('cod_cond_pag').AsInteger;
              vCodCliente := buscas.FieldByName('cod_devedor').AsInteger;
              vCodVendedor := buscas.FieldByName('cod_us').AsInteger;
              vValorTotal := buscas.FieldByName('valor_orig').AsCurrency;
            end;
          end;
        end;
      end;
    end;
    Application.CreateForm(TfrmDetalhamento, frmDetalhamento);
    if (vDadosIni.vEmp.vModoFaturamento = 'S') and (trim(tipVenda) = 'REQ') and (vDadosIni.vPedVnd.ReceberPeloFinanceiro) then
    begin
      if (vDadosIni.vSistema = 'Cxl') then
        frmDetalhamento.BitBtn3.Visible := false
      else
        frmDetalhamento.BitBtn3.Visible := (dataSet.IsEmpty) and (vValorTotal > 0)
    end
    else if (vDadosIni.vEmp.vModoFaturamento = 'S') and (trim(tipVenda) = 'OS') and (vDadosIni.vPedVnd.ReceberPeloFinanceiro) then
    begin
      if (vDadosIni.vSistema = 'Cxl') then
        frmDetalhamento.BitBtn3.Visible := false
      else
        frmDetalhamento.BitBtn3.Visible := (dataSet.IsEmpty) and (vValorTotal > 0)
    end
    else if (vDadosIni.vEmp.vModoFaturamento = 'S') and (trim(tipVenda) = 'MOT') and (vDadosIni.vVeic.ReceberPeloFinanceiro) then
    begin
      if (vDadosIni.vSistema = 'Cxl') then
        frmDetalhamento.BitBtn3.Visible := false
      else
        frmDetalhamento.BitBtn3.Visible := (dataSet.IsEmpty) and (vValorTotal > 0)
    end
    else if (vDadosIni.vEmp.vModoFaturamento = 'S') and (trim(tipVenda) = 'REC') and (vDadosIni.vRecibo.ReceberPeloFinanceiro) then
    begin
      if (vDadosIni.vSistema = 'Cxl') then
        frmDetalhamento.BitBtn3.Visible := false
      else
        frmDetalhamento.BitBtn3.Visible := (dataSet.IsEmpty) and (vValorTotal > 0)
    end
    else if vDadosIni.vEmp.vModoFaturamento <> 'S' then
      if (vDadosIni.vEmp.vConfFormPagamento = 'NF') then
        frmDetalhamento.BitBtn3.Visible := ((trim(tipVenda) = 'REC') or (trim(tipVenda) = 'NF')) and (dataSet.IsEmpty) and (vValorTotal > 0)
      else
        frmDetalhamento.BitBtn3.Visible := (trim(tipVenda) <> 'NF') and (dataSet.IsEmpty) and (vValorTotal > 0);

    if frmDetalhamento.BitBtn3.Visible then
    begin
      frmDetalhamento.numeroVenda := numeroVenda;
      frmDetalhamento.serieNf := serieNf;
      if Trim(frmDetalhamento.serieNf) = '' then
        frmDetalhamento.serieNf := '0';
      frmDetalhamento.tipVenda := tipVenda;
      frmDetalhamento.vCodCondPag := vCodCondPag;
      frmDetalhamento.vCodCliente := vCodCliente;
      frmDetalhamento.vCodVendedor := vCodVendedor;
      frmDetalhamento.vValorTotal := vValorTotal;
      //frmDetalhamento.BitBtn3.OnClick := cliqueNovaForma;
    end
    else
    begin
      frmDetalhamento.numeroVenda := numeroVenda;
      frmDetalhamento.tipVenda := tipVenda;
      frmDetalhamento.serieNf := serieNf;
      if Trim(frmDetalhamento.serieNf) = '' then
        frmDetalhamento.serieNf := '0';
    end;
    if (vDadosIni.vEmp.vFinanceiroUnificado) and (codigoUnificada > 0)
    	and (codigoUnificada <> StrToInt(vDadosIni.codEmpresa)) then
        frmDetalhamento.Tag := 99;
    frmDetalhamento.DBGrid1.DataSource := dtmFP.dsDestalhes;
    frmDetalhamento.BitBtn2.OnClick := cliquePromissoriasFormDetalhe;
    frmDetalhamento.BitBtn4.OnClick := cliqueCarneFormDetalhe;
    frmDetalhamento.BitBtn7.OnClick := cliqueReciboFormDetalhe;

    frmDetalhamento.ShowModal;
  finally
    buscas.Close;
    dataSet := TClientDataSet(dtmFP.cdsFormPag);
  end;
end;

procedure TFormPag2.dtSetCalcFields(DataSet: TDataSet);
begin
	if vDadosIni.vRecibo.HabRecPorDepart then
  begin
  	if DataSet.FieldByName('REC_TIPVEND').AsString = 'REC' then
    begin
    	if trim(DataSet.FieldByName('NUM_REC_DEP').AsString) <> '' then
      	DataSet.FieldByName('CONTROLE_TEMP').AsString := 'RECIBO ANTECIPADO Nº ' + trim(DataSet.FieldByName('NUM_REC_DEP').AsString)
      else
      	DataSet.FieldByName('CONTROLE_TEMP').AsString := 'RECIBO ANTECIPADO Nº ' +  trim(DataSet.FieldByName('REC_NUMVEND').AsString);
    end
    else
    	DataSet.FieldByName('CONTROLE_TEMP').AsString := DataSet.FieldByName('CONTROLE').AsString;
  end
  else
  begin
    if DataSet.FieldByName('REC_TIPVEND').AsString = 'REC' then
      DataSet.FieldByName('CONTROLE_TEMP').AsString := 'RECIBO ANTECIPADO Nº ' + trim(DataSet.FieldByName('REC_NUMVEND').AsString)
    else
    	DataSet.FieldByName('CONTROLE_TEMP').AsString := DataSet.FieldByName('CONTROLE').AsString;
  end;
end;

procedure TFormPag2.detalhamentoVenda(numeroVenda: integer; tipVenda: string; codigoUnificada: Integer = 0);
begin
  dataSet := TClientDataSet(dtmFP.cdsDetalhes);
  montaSelect(' select fp.seqform, fp.data_mov, fp.tpdocs, fp.nrequisicao, fp.ndoc, ctr.nome_ctrl, fp.cliente, ' +
    ' fp.historico, fp.valordoc, fp.data_venc, fp.terceiros, fp.tipdoc, fp.cod_controle, ' +
    ' fp.cod_empresa, fp.n_processamento, fp.nosso_numero_banco, fp.n_aut_cart, fp.n_docnsu_adm, fp.nparcela, fp.qtde_parc, ' +
    ' fp.cod_terminal_adm, fp.desc_terminal_adm, fp.cod_adm, fp.desc_adm, fp.cod_bandeira_adm, fp.desc_bandeira, ' +
    ' fp.rec_numvend, fp.rec_tipvend, fp.recibo, ' +
    ' '' '' num_rec_dep, '' '' num_rec_parc from formpagamento fp ' +
    ' inner join controles ctr on fp.cod_controle = ctr.codigo_ctrl and fp.cod_empresa = ctr.codigo_emp ' +
    ' where fp.nrequisicao = ' + IntToStr(numeroVenda) +
    ' and fp.tpdocs = ' + QuotedStr(tipVenda) +
    ' and fp.cod_empresa = '+ vDadosIni.retornoPorCondicao(
	    (vDadosIni.vEmp.vFinanceiroUnificado) and (codigoUnificada > 0),
	    IntToStr(codigoUnificada), vDadosIni.codEmpresa) +
    ' and fp.ativo = 1 ');
  Application.CreateForm(TfrmDetalhamento, frmDetalhamento);
  frmDetalhamento.DBGrid1.DataSource := dtmFP.dsDestalhes;
  frmDetalhamento.ShowModal;
  dataSet := TClientDataSet(dtmFP.cdsFormPag);
end;

function TFormPag2.efetuarTransacaoCartaoPOSVirtual: Boolean;
var
  vTIPVND, vTerminalAdm: string;
  vNumVND, vSecao, vTerminalF, vSeqIDTransacao, vCtrl: Integer;

  vVlPrimeira, vVlDemais: Extended;
  I: Integer;
  vDiaVencimento: TDate;
  vID: Integer;
  payload: TTEFOperacao;
begin
  try
    Result := False;
    buscas2 := TIBQuery(dtmFP.qrBuscas2);

    if not vDadosIni.PesqPros('FPG032', 'INCLUIR', FtipoVenda + ' ' + IntToStr(FnumeroVenda), 'TRANSACAO_CARTAO',
      '', buscas, True) then
      Exit;

    if StrToIntDef(vDadosIni.vCodTerminal, 0) > 0 then
      vTerminalF := StrToIntDef(vDadosIni.vCodTerminal, 0)
    else
      vTerminalF := StrToIntDef(Trim(vDadosIni.GetIni('TEF', 'TerminalF', '0')), 0);

    if vTerminalF <= 0 then
      raiseExceptionCreate('Código inválido ou sem configuração para o codigo o terminal no Config: "[TEF] TerminalF=1"!', '');

    fSecao := fSecao + 1;

    vTIPVND := FtipoVenda;
    vNumVND := FnumeroVenda;
    vSecao := fSecao;
    vCtrl := vControle.dataSet.FieldByName('codigo_ctrl').AsInteger;

    if vControle.fequals('docs', 'N') then
    begin
      payload.operacao := posCRTDIG;
      payload.textoParaUsuario := 'Carteira digital para a ' + FtipoVenda + ': ' + IntToStr(FnumeroVenda);
    end
    else
    begin
      payload.operacao := posCRT;
      payload.textoParaUsuario := 'Recebimento em cartão para a ' + FtipoVenda + ': ' + IntToStr(FnumeroVenda);
    end;
    payload.numeroDocumento := IntToStr(FnumeroVenda);
    payload.valorOperacao := 0;
    payload.valorMaximoFP := FvalorQueFaltaInformar;
    payload.hidePrint := False;
    payload.idCarteiraDigital := vControle.dataSet.FieldByName('tef_id_cartdig').asString;
    payload.idPSP := vControle.dataSet.FieldByName('tef_id_psp').asString;
//    payload.idCarteiraDigital := vControle.fstr('tef_id_cartdig');

    if not vDadosIni.operacaoPosVirtual(payload, buscas) then
    begin
      vDadosIni.GravaAuditoria('FPG032', 'CARTAO', 'OPERACAO CANCELADA - ' + FtipoVenda + ' ' + IntToStr(FnumeroVenda), 'TRANSACAO_CARTAO', '', buscas);
      Result := False;
      Exit;
    end;
    {
    if not vDadosIni.operacaoPosVirtual(posCRT,
      'Recebimento em cartão para a ' + FtipoVenda + ': ' + IntToStr(FnumeroVenda),
      IntToStr(FnumeroVenda), 0, buscas, FvalorQueFaltaInformar) then
    begin
      vDadosIni.GravaAuditoria('FPG032', 'CARTAO', 'OPERACAO CANCELADA - ' + FtipoVenda + ' ' + IntToStr(FnumeroVenda), 'TRANSACAO_CARTAO',
        '', buscas);
      Result := False;
      Exit;
    end;
    }
    if vDadosIni.vPOSV.retorno <> retSucesso then
    begin
      vDadosIni.GravaAuditoria('FPG032', 'INICIAR', 'FALHA - ' + FtipoVenda + ' ' + IntToStr(FnumeroVenda), 'TRANSACAO_CARTAO', '', buscas);
      Exit;
    end;

    vSeqIDTransacao := vDadosIni.gravaTransacaoPosVirtual(0, vTIPVND, '', vNumVND, vSecao, vCtrl, buscas);

    //metodo para pegar o terminal adm
    vTerminalAdm := vDadosIni.vPOSV.terminalAdm;//vDadosIni.getTerminalADM(buscas);

    try
      vcontrole.HandleBoletoTEF(vCtrl, vDadosIni.vPOSV.idCarteiraDigital, vDadosIni.vPOSV.IdPSP, vDadosIni.vPOSV.CaptionRedeValor);

      usarTransacaoPOSVirtualComoFormaPagamento(vTerminalAdm);

    finally
      vControle.RestoreComandFP;
    end;

    vID:= vDadosIni.gravaTransacaoPosVirtual(vSeqIDTransacao, vTIPVND, vTerminalAdm, vNumVND, vSecao, vCtrl, buscas);

    buscas.Transaction.Commit;

    Result := True;

    vDadosIni.GravaAuditoria('FPG032', 'CARTAO', 'SUCESSO - ' + FtipoVenda + ' ' + IntToStr(FnumeroVenda) + '-' +
      'AUT:' + Trim(vDadosIni.vPOSV.retornoAUT) + '-NSU:' + Trim(vDadosIni.vPOSV.retornoNSU) +
      '-TERM:' + Trim(vTerminalAdm) + 'VL.OP:' + Format('0.2f', [vDadosIni.vPOSV.valorOperacao]),
      'TRANSACAO_CARTAO', IntToStr(vID), buscas);

  except
  	on E: Exception do
    begin
      buscas.Transaction.Rollback;

      vDadosIni.GravaAuditoria('FPG032', 'CARTAO', 'FALHA - '+ FtipoVenda + ' ' + IntToStr(FnumeroVenda), 'TRANSACAO_CARTAO',
        '', buscas);

      Result := False;
      registraErro('function TFormPag2.efetuarTransacaoCartaoPOSVirtual. Erro: ' + e.Message);
      Application.MessageBox(PChar('Erro: ' + e.Message), 'Erro', MB_ICONEXCLAMATION + MB_OK);
    end;
  end;
end;

function TFormPag2.existeRecebimentoDinheiro: boolean;
var
  temp: string;
  vControleInt: Integer;
begin
  result := false;
  vControleInt := vControle.dataSet.FieldByName('codigo_ctrl').AsInteger;
  dataSet.First;
  while not dataSet.Eof do
  begin
    temp := DataSet.FieldByName('tipdoc').AsString;
    if (temp = 'N') and (Trim(DataSet.FieldByName('rec_tipvend').AsString) = '')
      and (Trim(DataSet.FieldByName('TPDOCS').AsString) <> 'LCS')
      and (vControleInt = DataSet.FieldByName('cod_controle').AsInteger)
      and (Trim(DataSet.FieldByName('ref_frete').AsString) = '') then
    begin
      temp := temp;
      result := true;
      Break;
    end;
    dataSet.Next;
  end;
end;

procedure TFormPag2.GeraBoleta(NumBoletas: Integer);
var
  Arquivo: TextFile;
  I, cont, j, b, a1, a2, k: Integer;
  msgStrTemp, vMensagemEmp: string;
begin
  AssignFile(Arquivo, vDadosIni.vPortaImpressora);
  try
    Buscas.Close;
    Buscas.SQL.Text := 'SELECT NPREVENDA FROM REQVENDA WHERE NREQ = ' + dataSet.FieldByName('NREQUISICAO').Asstring + ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and ATIVO = 1';
    //    Buscas.SQL.Text := 'SELECT NPREVENDA FROM REQVENDA WHERE NREQ = ' + dataSet.FieldByName('N_DOC_V').Asstring + ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and ATIVO = 1';
    Buscas.Open;
    First;
    k := 1;
    while not Eof do
    begin
      Rewrite(Arquivo);

      WriteLn(Arquivo, 'N'); //Limpa o buffer de impressão
      WriteLn(Arquivo, 'ZT'); //Direção da impressçao (de baixo pra cima)

      WriteLn(Arquivo, 'Q15,0'); //Comprimento (ou altura) da fita
      WriteLn(Arquivo, 'D15'); //Densidade da impressão - 1 a 15
      WriteLn(Arquivo, 'q565'); //Largura da cabeça de impressão (largura da fita)
      WriteLn(Arquivo, 'S4'); //Velocidade de impressão;
      WriteLn(Arquivo, 'ON');
      WriteLn(Arquivo, 'JF'); //Volta a fita para começar a imprimir;

      WriteLn(Arquivo, 'FK"CANHOTO"'); //Apaga o Form se ele já existir
      WriteLn(Arquivo, 'FS"CANHOTO"'); //Cria um novo Form
      WriteLn(Arquivo, 'V00,30,N,"prompt:"'); //Variável onde entra: NOME_CLIENTE
      WriteLn(Arquivo, 'V01,10,C,"prompt:"'); //Variável onde entra: PRESTACAO
      WriteLn(Arquivo, 'V02,13,N,"prompt:"'); //Variável onde entra: VENCIMENTO
      WriteLn(Arquivo, 'V03,13,C,"prompt:"'); //Variável onde entra: VALOR PREST.
      WriteLn(Arquivo, 'V04,10,C,"prompt:"'); //Variável onde entra: COD_CLIENTE
      WriteLn(Arquivo, 'V05,13,C,"prompt:"'); //Variável onde entra: APROVACAO
      WriteLn(Arquivo, 'V06,13,C,"prompt:"'); //Variável onde entra: CONTRATO
      WriteLn(Arquivo, 'V07,12,C,"prompt:"'); //Variável onde entra: GARANTIA
      WriteLn(Arquivo, 'V08,36,C,"prompt:"'); //Variável onde entra: NOME_EMPRESA

      //################# IMPRESSÃO DAS LINHAS DA TABELA ##############################

      WriteLn(Arquivo, 'LO20,10,3,620'); //Primeira vertical - lateral esquerda
      WriteLn(Arquivo, 'LO175,160,3,160'); //Segunda Vertical
      WriteLn(Arquivo, 'LO350,160,3,160'); //Terceira Vertical
      WriteLn(Arquivo, 'LO540,10,3,620'); //Última vertical - lateral direita

      WriteLn(Arquivo, 'LO20,10,520,3'); //Primeira Horizontal
      WriteLn(Arquivo, 'LO20,80,520,3'); //Segunda horizontal
      WriteLn(Arquivo, 'LO20,160,520,3'); //Terceira horizontal
      WriteLn(Arquivo, 'LO20,240,520,3'); //Quarta horizontal
      WriteLn(Arquivo, 'LO20,320,520,3'); //Quinta horizontal

      WriteLn(Arquivo, 'LO20,480,520,3'); //Sexta horizontal
      WriteLn(Arquivo, 'LO20,630,525,3'); //Sétima horizontal autenticacao

      WriteLn(Arquivo, 'LO20,705,520,3'); //Linha invisível

      //################# IMPRESSÃO DOS TÍTULOS DOS CAMPOS ##############################

      WriteLn(Arquivo, 'A30,40,0,3,1,1,N,""V08'); //Variável NOME_EMPRESA

      WriteLn(Arquivo, 'A25,90,0,1,1,1,N,"NOME CLIENTE"'); //1 campo Horiz.
      WriteLn(Arquivo, 'A30,135,0,2,1,1,N,""V00'); //Variável NOME_CLIENTE

      WriteLn(Arquivo, 'A25,170,0,1,1,1,N,"PRESTACAO"'); //2 linha Horiz. 1 vert.
      WriteLn(Arquivo, 'A30,215,0,3,1,1,N,""V01'); //Variável PRESTACAO

      WriteLn(Arquivo, 'A185,170,0,1,1,1,N,"VENCIMENTO"'); //2 linha Horiz. 2 vert.
      WriteLn(Arquivo, 'A190,215,0,3,1,1,N,""V02'); //Variável VENCIMENTO.

      WriteLn(Arquivo, 'A360,170,0,1,1,1,N,"VALOR PREST."'); //2 linha Horiz. 3 vert.
      WriteLn(Arquivo, 'A365,215,0,3,1,1,N,""V03'); //Variável VALOR PREST.

      WriteLn(Arquivo, 'A25,250,0,1,1,1,N,"COD. CLIENTE"'); //3 linha Horiz. 1 vert.
      WriteLn(Arquivo, 'A30,295,0,2,1,1,N,""V04'); //Variável COD_CLIENTE

      WriteLn(Arquivo, 'A185,250,0,1,1,1,N,"COD. VENDEDOR"'); //3 linha Horiz. 2 vert.
      WriteLn(Arquivo, 'A190,295,0,2,1,1,N,""V05'); //Variável COD. VENDEDOR

      WriteLn(Arquivo, 'A360,250,0,1,1,1,N,"CONTRATO"'); //3 linha Horiz. 3 vert.
      WriteLn(Arquivo, 'A365,295,0,2,1,1,N,""V06'); //Variável CONTRATO

      WriteLn(Arquivo, 'A30,375,0,2,1,1,N,""V07'); //Variável GARANTIA

      //No campo OBS_DECL_OS da empresa cada linha deve ter no máximo 36 caracteres para não cortar na impressão dos carnês da impressora térmica INTERMEC.
      vMensagemEmp := vDadosIni.vEmp.vObservOS;
      cont := 355;
      for i := 0 to 5 do
      begin
        if pos(#13, vMensagemEmp) = 0 then
          msgStrTemp := copy(vMensagemEmp, 1, length(vMensagemEmp))
        else
          msgStrTemp := copy(vMensagemEmp, 1, pos(#13, vMensagemEmp) - 1);
        vMensagemEmp := copy(vMensagemEmp, length(msgStrTemp) + 3, length(vMensagemEmp));
        //      WriteLn(Arquivo, 'A30,' + IntToStr(cont) + ',0,3,1,1,N,"' + Centraliza(msgStrTemp, 35) + '"'); //Entrada da variável:  MENSAGEM_EMPRESA
        WriteLn(Arquivo, 'A30,' + IntToStr(cont) + ',0,3,1,1,N,"' + msgStrTemp + '"'); //Entrada da variável:  MENSAGEM_EMPRESA - OBS_DECL_OS
        cont := cont + 20;
      end;

      WriteLn(Arquivo, 'A25,500,0,1,1,1,N,"AUTENTICACAO"'); //5 linha Horiz. 1 vert.
      WriteLn(Arquivo, 'FE'); //Salva o Form acima na memória da impressora

      WriteLn(Arquivo, 'N');
      WriteLn(Arquivo, 'FR"CANHOTO"'); //Abre o Form para receber as variáveis
      WriteLn(Arquivo, '?'); //Pega as variáveis para q elas sejam preenchidas abaixo
      WriteLn(Arquivo, '' + dataSet.FieldByName('CLIENTE').Text + ''); //Entrada da variável:  NOME_C
      WriteLn(Arquivo, '' + IntToStr(k) + '/' + IntToStr(NumBoletas) + ''); //Entrada da variável:  PRESTACAO
      //    WriteLn(Arquivo, '' + dataSet.FieldByName('DATA_VENC_C').Text + ''); //Entrada da variável:  VENCIMENTO
      WriteLn(Arquivo, '' + dataSet.FieldByName('DATA_VENC').Text + ''); //Entrada da variável:  VENCIMENTO
      //    WriteLn(Arquivo, '' + Format('%m', [dataSet.FieldByName('VALOR_C').AsCurrency]) + ''); //Entrada da variável:  VALOR PREST.
      WriteLn(Arquivo, '' + Format('%m', [dataSet.FieldByName('VALORDOC').AsCurrency]) + ''); //Entrada da variável:  VALOR PREST.
      WriteLn(Arquivo, '' + dataSet.FieldByName('COD_CLIENTE').Text + ''); //Entrada da variável:  COD_CLIENTE
      WriteLn(Arquivo, '' + dataSet.FieldByName('OP_CXL').Text + ''); //Entrada da variável:  APROVACAO
      if not Buscas.IsEmpty then
        if not Buscas.FieldByName('NPREVENDA').isnull then
          WriteLn(Arquivo, '' + vDadosIni.strZero(Buscas.FieldByName('NPREVENDA').AsInteger, 7) + '') //Entrada da variável:  CONTRATO
        else
          WriteLn(Arquivo, '' + dataSet.FieldByName('NREQUISICAO').Asstring + '') //Entrada da variável:  CONTRATO
          //        WriteLn(Arquivo, '' + dataSet.FieldByName('N_DOC_V').Asstring + '') //Entrada da variável:  CONTRATO
      else
        WriteLn(Arquivo, '' + dataSet.FieldByName('NREQUISICAO').Asstring + ''); //Entrada da variável:  CONTRATO
      //      WriteLn(Arquivo, '' + dataSet.FieldByName('N_DOC_V').Asstring + ''); //Entrada da variável:  CONTRATO
      WriteLn(Arquivo, ''); //Entrada da variável:  GARANTIA
      //  WriteLn(Arquivo, ''); //Entrada da variável:  MENSAGEM_EMPRESA
      WriteLn(Arquivo, '' + vDadosIni.vEmp.vRazaoSocial + ''); //Entrada da variável:  NOME_EMPRESA
      WriteLn(Arquivo, 'P1'); //Imprime o Form

      //-----------------------------BOLETA------------------------------------------------------------

      WriteLn(Arquivo, 'FK"BOLETA"'); //Apaga o Form da memória da impressora se ele já existir
      WriteLn(Arquivo, 'FS"BOLETA"'); //Abre e cria um novo Form na memória da impressora
      WriteLn(Arquivo, 'V00,30,N,"prompt:"'); //Variável onde entra: NOME_CLIENTE
      WriteLn(Arquivo, 'V01,10,C,"prompt:"'); //Variável onde entra: PRESTACAO
      WriteLn(Arquivo, 'V02,13,N,"prompt:"'); //Variável onde entra: VENCIMENTO
      WriteLn(Arquivo, 'V03,13,C,"prompt:"'); //Variável onde entra: VALOR PREST.
      WriteLn(Arquivo, 'V04,10,C,"prompt:"'); //Variável onde entra: COD_CLIENTE
      WriteLn(Arquivo, 'V05,13,C,"prompt:"'); //Variável onde entra: APROVACAO
      WriteLn(Arquivo, 'V06,13,C,"prompt:"'); //Variável onde entra: CONTRATO
      WriteLn(Arquivo, 'V07,12,C,"prompt:"'); //Variável onde entra: GARANTIA
      WriteLn(Arquivo, 'V08,13,C,"prompt:"'); //Variável onde entra: EMISSAO
      WriteLn(Arquivo, 'V09,13,C,"prompt:"'); //Variável onde entra: JUROS
      WriteLn(Arquivo, 'V10,36,C,"prompt:"'); //Variável onde entra: NOME_EMPRESA

      //################# IMPRESSÃO DAS LINHAS DA TABELA ##############################

      WriteLn(Arquivo, 'LO20,10,3,540'); //Primeira vertical - lateral esquerda
      WriteLn(Arquivo, 'LO175,80,3,240'); //Segunda Vertical
      WriteLn(Arquivo, 'LO350,80,3,240'); //Terceira Vertical
      WriteLn(Arquivo, 'LO540,10,3,540'); //Última vertical - lateral direita

      WriteLn(Arquivo, 'LO20,10,520,3'); //Primeira Horizontal
      WriteLn(Arquivo, 'LO20,80,520,3'); //Segunda horizontal
      WriteLn(Arquivo, 'LO20,160,520,3'); //Terceira horizontal
      WriteLn(Arquivo, 'LO20,240,520,3'); //Quarta horizontal
      WriteLn(Arquivo, 'LO20,320,520,3'); //Quinta horizontal
      WriteLn(Arquivo, 'LO20,400,520,3'); //Sexta horizontal
      WriteLn(Arquivo, 'LO20,550,525,3'); //Sétima horizontal autenticacao

      WriteLn(Arquivo, 'LO20,705,520,3'); //Linha invisível

      //################# IMPRESSÃO DOS TÍTULOS DOS CAMPOS ##############################

      WriteLn(Arquivo, 'A25,20,0,1,1,1,N,"NOME CLIENTE"'); //1 campo Horiz.
      WriteLn(Arquivo, 'A30,60,0,2,1,1,N,""V00'); //Variável NOME_CLIENTE

      WriteLn(Arquivo, 'A25,90,0,1,1,1,N,"PRESTACAO"'); //2 linha Horiz. 1 vert.
      WriteLn(Arquivo, 'A30,135,0,3,1,1,N,""V01'); //Variável PRESTACAO

      WriteLn(Arquivo, 'A185,90,0,1,1,1,N,"VENCIMENTO"'); //2 linha Horiz. 2 vert.
      WriteLn(Arquivo, 'A190,135,0,3,1,1,N,""V02'); //Variável VENCIMENTO.

      WriteLn(Arquivo, 'A360,90,0,1,1,1,N,"VALOR PREST."'); //2 linha Horiz. 3 vert.
      WriteLn(Arquivo, 'A365,135,0,3,1,1,N,""V03'); //Variável VALOR PREST.

      WriteLn(Arquivo, 'A25,170,0,1,1,1,N,"COD. CLIENTE"'); //3 linha Horiz. 1 vert.
      WriteLn(Arquivo, 'A30,215,0,2,1,1,N,""V04'); //Variável COD_CLIENTE

      WriteLn(Arquivo, 'A185,170,0,1,1,1,N,"COD. VENDEDOR"'); //3 linha Horiz. 2 vert.
      WriteLn(Arquivo, 'A190,215,0,2,1,1,N,""V05'); //Variável APROVACAO

      WriteLn(Arquivo, 'A360,170,0,1,1,1,N,"CONTRATO"'); //3 linha Horiz. 3 vert.
      WriteLn(Arquivo, 'A365,215,0,2,1,1,N,""V06'); //Variável CONTRATO

      WriteLn(Arquivo, 'A25,250,0,1,1,1,N,"GARANTIA"'); //4 linha Horiz. 1 vert.
      WriteLn(Arquivo, 'A30,295,0,2,1,1,N,""V07'); //Variável GARANTIA

      WriteLn(Arquivo, 'A185,250,0,1,1,1,N,"EMISSAO"'); //4 linha Horiz. 1 vert.
      WriteLn(Arquivo, 'A190,295,0,2,1,1,N,""V08'); //Variável EMISSAO

      WriteLn(Arquivo, 'A360,250,0,1,1,1,N,"JUROS"'); //4 linha Horiz. 1 vert.
      WriteLn(Arquivo, 'A365,295,0,2,1,1,N,""V09'); //Variável JUROS

      WriteLn(Arquivo, 'A30,355,0,3,1,1,N,""V10'); //Variável NOME_EMPRESA

      WriteLn(Arquivo, 'A25,420,0,1,1,1,N,"AUTENTICACAO"'); //5 linha Horiz. 1 vert.

      //################# IMPRESSÃO DAS VARIÁVEIS NOS CAMPOS ##############################

      WriteLn(Arquivo, 'FE'); //Fecha e Salva o Form na memória da impressora

      WriteLn(Arquivo, 'N');
      WriteLn(Arquivo, 'FR"BOLETA"'); //Abre o Form para receber as variáveis
      WriteLn(Arquivo, '?'); //Pega as variáveis para q elas sejam preenchidas abaixo
      WriteLn(Arquivo, '' + dataSet.FieldByName('CLIENTE').Text + ''); //Entrada da variável:  NOME_CLIENTE
      //    WriteLn(Arquivo, '' + dataSet.FieldByName('NOME_C').Text + ''); //Entrada da variável:  NOME_CLIENTE
      WriteLn(Arquivo, '' + IntToStr(k) + '/' + IntToStr(NumBoletas) + ''); //Entrada da variável:  PRESTACAO
      WriteLn(Arquivo, '' + dataSet.FieldByName('DATA_VENC').Text + ''); //Entrada da variável:  VENCIMENTO
      //    WriteLn(Arquivo, '' + dataSet.FieldByName('DATA_VENC_C').Text + ''); //Entrada da variável:  VENCIMENTO
      WriteLn(Arquivo, '' + Format('%m', [dataSet.FieldByName('VALORDOC').AsCurrency]) + ''); //Entrada da variável:  VALOR PREST.
      //    WriteLn(Arquivo, '' + Format('%m', [dataSet.FieldByName('VALOR_C').AsCurrency]) + ''); //Entrada da variável:  VALOR PREST.
      WriteLn(Arquivo, '' + dataSet.FieldByName('COD_CLIENTE').Text + ''); //Entrada da variável:  COD_CLIENTE
      WriteLn(Arquivo, '' + dataSet.FieldByName('OP_CXL').AsString + ''); //Entrada da variável:  APROVACAO
      if not Buscas.IsEmpty then
        if not Buscas.FieldByName('NPREVENDA').isnull then
          WriteLn(Arquivo, '' + vDadosIni.strZero(Buscas.FieldByName('NPREVENDA').AsInteger, 7) + '') //Entrada da variável:  CONTRATO
        else
          WriteLn(Arquivo, '' + dataSet.FieldByName('NREQUISICAO').Asstring + '') //Entrada da variável:  CONTRATO
          //        WriteLn(Arquivo, '' + dataSet.FieldByName('N_DOC_V').Asstring + '') //Entrada da variável:  CONTRATO
      else
        WriteLn(Arquivo, '' + dataSet.FieldByName('NREQUISICAO').Asstring + ''); //Entrada da variável:  CONTRATO
      //      WriteLn(Arquivo, '' + dataSet.FieldByName('N_DOC_V').Asstring + ''); //Entrada da variável:  CONTRATO
      WriteLn(Arquivo, ''); //Entrada da variável:  GARANTIA
      WriteLn(Arquivo, '' + DateToStr(Date) + ''); //Entrada da variável:  EMISSAO
      WriteLn(Arquivo, ''); //Entrada da variável:  JUROS
      WriteLn(Arquivo, '' + vDadosIni.vEmp.vRazaoSocial + ''); //Entrada da variável:  NOME_EMPRESA
      //if not dtmc.qrBuscas1.IsEmpty then
      //  WriteLn(Arquivo, '' + strZero(dtmc.qrBuscas1.FieldByName('NPREVENDA').Asinteger,7) + '')
      //else
      WriteLn(Arquivo, 'B120,570,0,3,2,5,75,B,"' + trim(dataSet.FieldByName('NDOC').Asstring) + '"'); //Variável COD_BARRA
      //    WriteLn(Arquivo, 'B120,570,0,3,2,5,75,B,"' + trim(dataSet.FieldByName('N_DOC_C').Asstring) + '"'); //Variável COD_BARRA
      WriteLn(Arquivo, 'P1');
      next;
      sleep(500);
      inc(k);
      CloseFile(Arquivo);
    end;
  except
    CloseFile(Arquivo);
  end;
end;

function TFormPag2.getCampoPipe(plinha: string; pOrdem: integer): string;
var
  vTemp: string;
  vInc: Smallint;
begin
  vTemp := plinha;
  vInc := 0;
  while pos('|', vTemp) > 0 do
  begin
    inc(vInc);
    if pOrdem = vInc then
    begin
      vTemp := Copy(vTemp, 1, pos('|', vTemp) - 1);
      Result := Trim(vTemp);
      exit;
    end;
    vTemp := Copy(vTemp, pos('|', vTemp) + 1, length(vTemp));
  end;
  Result := '';
end;

function TFormPag2.BuildHistorico(ndocVenda: string; emptyCampos: Boolean): string;
var
  sValues: TStrings;
begin
  ndocVenda := IfThen(ndocVenda <> '', ndocVenda, IntToStr(FnumeroVenda));
  sValues := HistoricoHelperStrings.New('')
    .AddValue('NREQUISICAO', ndocVenda)
    .AddValue('TPDOCS', FtipoVenda);

  Result := HistoricoHelper.Build(Fpgto, dataSet, '', sValues, emptyCampos);
end;

function TFormPag2.getCountParcelasBoleto: Integer;
var
  vtmp: string;
begin
  Result := 0;
  if Trim(vControle.dataSet.FieldByName('usar_boleto').AsString) <> 'S' then
    Exit;

  vtmp := Copy(fControlesBoleto, 2, Length(fControlesBoleto) -2);
  if (Trim(vtmp) = '') or (Trim(fControlesBoleto) = '|') then
    Exit;

  vtmp := StringReplace(vtmp, '|', ' or cod_controle = ', [rfReplaceAll]);

//  vtmp := StringReplace(fControlesBoleto, '|', ',', [rfReplaceAll]);
//  vtmp := '('+ Copy(vtmp,2,Length(vtmp)-2) + ')';
  try
    dataSet.Filter := 'cod_controle = ' + vtmp;
    dataSet.Filtered := True;

    Result := dataSet.RecordCount;
  finally
    dataSet.Filter := '';
    dataSet.Filtered := False;
  end;
end;

function TFormPag2.getDadosBancarios(codigoCliente: integer): boolean;
begin
  if not vContabanc.dataSet.Active then
    vContabanc._selecionaContasBancarias(codigoCliente);
  if vContabanc.dataSet.RecordCount > 1 then
    if not _abreFormContasBancarias then
      Exit;



//  buscas.Close;
//  buscas.SQL.Text := 'select * from CONTASBANCARIAS where cod_cliente = ' +
//    IntToStr(codigoCliente)
//    + ' and ativo = 1';
//  buscas.Open;
  result := not vContabanc.dataSet.IsEmpty;
  try
    if not result then
      exit;
    FchequeNumeroBanco := '';
    try
      FchequeNumeroBanco := vContabanc.dataSet.FieldByName('codbanco').AsString;
    except
    end;
    FchequeNomeBanco := vContabanc.dataSet.FieldByName('banco').AsString;
    FchequeConta := vContabanc.dataSet.FieldByName('conta').AsString;
    FchequeAgencia := vContabanc.dataSet.FieldByName('agencia').AsString;
  finally
//    vContabanc.dataSet.Close;
  end;
end;

function TFormPag2.getHistorico: string;
begin
  if (trim(FtipoVenda) = 'REC') then
  begin
    if vDadosIni.vRecibo.HabRecPorDepart then
    begin
      buscas.Close;
      buscas.SQL.Text := ' select num_rec_dep from recibos  ' +
       ' where nrecibo = :nrecibo and cod_empresa = :cod_empresa ';
      buscas.ParamByName('nrecibo').AsInteger := FnumeroVenda;
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.Open;

      if not buscas.IsEmpty then
        if trim(buscas.FieldByName('num_rec_dep').AsString) <> '' then
        begin
          {
          Result := 'CRÉDITOS A RECEBER CONFORME ' + FtipoVenda + ' Nº ' + trim(buscas.FieldByName('num_rec_dep').AsString);
          }
          Result := BuildHistorico(trim(buscas.FieldByName('num_rec_dep').AsString));
          exit;
        end;
    end;
  end;
  //Result := 'CRÉDITOS A RECEBER CONFORME ' + FtipoVenda + ' Nº ' + IntToStr(FnumeroVenda);
  Result := BuildHistorico();
end;

procedure TFormPag2.gravaConfiguracoesRegistro(Consulta: TClientDataSet);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName + '\' + Consulta.ClassName, True);
      // Grava as informações do form
      Registro.WriteString(frmFormPag2.ComboBox1.Name, frmFormPag2.ComboBox1.Text);
      Registro.WriteString(frmFormPag2.MaskEdit1.Name, frmFormPag2.MaskEdit1.Text);
      Registro.WriteString(frmFormPag2.MaskEdit2.Name, frmFormPag2.MaskEdit2.Text);
      Registro.WriteBool(frmFormPag2.CheckBox1.Name, frmFormPag2.CheckBox1.Checked);
      Registro.WriteBool(frmFormPag2.RadioButton1.Name, frmFormPag2.RadioButton1.Checked);
      Registro.WriteBool(frmFormPag2.RadioButton2.Name, frmFormPag2.RadioButton2.Checked);

      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TFormPag2.habilitaControleEcommerce;
begin
 //  if FvalorQueFaltaInformar <= 0 then
  //    Exit;
  frmFormPag2.PageControl1.ActivePage := frmFormPag2.tsFormasEC;
  atribuirAtributosParaFormulario;
  frmFormPag2.Label29.Caption := Format('%m', [vEcommerce.somatorioEcommerce(FnumeroVenda, FtipoVenda)]);
  if (frmFormPag2.Enabled) and (frmFormPag2.Visible) and (frmFormPag2.gridEcommerce.CanFocus) then
    frmFormPag2.gridEcommerce.SetFocus;

  try
  	vEcommerce.dataSet.DisableControls;
    vEcommerce.dataSet.First;
    while not vEcommerce.dataSet.Eof do
    begin
      if vEcommerce.dataSet.FieldByName('UTILIZADO').AsString <> 'S' then
      begin
        vEcommerce.dataSet.Edit;
        vEcommerce.dataSet.FieldByName('SEL').AsString := 'S';
        vEcommerce.dataSet.Post;
      end;

      vEcommerce.dataSet.Next;
    end;
  finally
    vEcommerce.dataSet.First;
    vEcommerce.dataSet.EnableControls;
  end;
end;

procedure TFormPag2.habilitaControleProgFid;
var
  vHab: boolean;
  I: Integer;
begin
   //  if FvalorQueFaltaInformar <= 0 then
  //    Exit;
  vValeCupomPrgFid._abreValeCupomPrgFid(FcodigoCliente);
  try
  	vValeCupomPrgFid.dataSet.DisableControls;
    vValeCupomPrgFid.dataSet.First;
    while not vValeCupomPrgFid.dataSet.Eof do
    begin
    	if vDadosIni.vProgFid.vHabilitarProgFid then
      begin
        if (vDadosIni.vProgFid.vHabilitarValidacaoValeAPI)
          and (vValeCupomPrgFid.dataSet.FieldByName('ndoc').AsInteger <= 0) // Recibo não utilizados
          and (not vValeCupomPrgFid.dataSet.FieldByName('validado').IsNull) then // Apenas recibo validados
        begin
            vValeCupomPrgFid.dataSet.Edit;
            vValeCupomPrgFid.dataSet.FieldByName('sel').AsString := 'S';
            vValeCupomPrgFid.dataSet.Post;
        end
        else if (not vDadosIni.vProgFid.vHabilitarValidacaoValeAPI)
          and (vValeCupomPrgFid.dataSet.FieldByName('ndoc').AsInteger <= 0) then // Recibo não utilizados
        begin
           vValeCupomPrgFid.dataSet.Edit;
           vValeCupomPrgFid.dataSet.FieldByName('sel').AsString := 'S';
           vValeCupomPrgFid.dataSet.Post;
        end;
      end
      else if vDadosIni.vCashback.vHabilitarCashback then
      begin
      	if (vValeCupomPrgFid.dataSet.FieldByName('ndoc').AsInteger <= 0) then // Recibo não utilizados
        begin
           vValeCupomPrgFid.dataSet.Edit;
           vValeCupomPrgFid.dataSet.FieldByName('sel').AsString := 'S';
           vValeCupomPrgFid.dataSet.Post;
        end;
      end;

      vValeCupomPrgFid.dataSet.Next;
    end;
  finally
    vValeCupomPrgFid.dataSet.EnableControls;
  end;
  frmFormPag2.pnValeCupom.Align := alNone;
  frmFormPag2.pnValeCupom.Height := 310;
  frmFormPag2.pnValeCupom.Width := 814;
  frmFormPag2.RadioGroupVales.ItemIndex := 0;
  frmFormPag2.BitBtnOKResgatarVale.Enabled := frmFormPag2.RadioGroupVales.ItemIndex = 0;

	for I := 0 to frmFormPag2.DBGridResgatarVale.Columns.Count - 1 do
  	if frmFormPag2.DBGridResgatarVale.Columns[i].FieldName = 'PONTOS' then
    begin
      frmFormPag2.DBGridResgatarVale.Columns[i].Visible := False;
      Break;
    end;

  try
    vHab := frmFormPag2.edCarteiraValorCarteira.Enabled;
    frmFormPag2.edCarteiraValorCarteira.Enabled := false;
    vDadosIni.abreForm('Vales do Cliente - Programa de ' +
    	vDadosIni.IfThen(vDadosIni.vProgFid.vHabilitarProgFid, 'Fidelidade', 'Cashback'), frmFormPag2.pnValeCupom, [ofEscapeExit, ofAlignAllClientWinCtrl]);
  //  frmFormPag2.PageControl1.ActivePage := frmFormPag2.tsValesCupom;
    atribuirAtributosParaFormulario;
  finally
     frmFormPag2.edCarteiraValorCarteira.Enabled := vHab;
  end;
end;

procedure TFormPag2.habilitaControleRecibos;
begin
  //  if FvalorQueFaltaInformar <= 0 then
  //    Exit;
  frmFormPag2.PageControl1.ActivePage := frmFormPag2.tabRecibos;
 //if not vRecibo.dataSet.Active then
  if frmFormPag2.edTotalRecibos.Valor <= 0 then
    vRecibo.selecionaRecibosAntecipados;
  atribuirAtributosParaFormulario;

  frmFormPag2.Label27.Caption := Format('%m', [vRecibo.somatorioRecibos]);
  if (frmFormPag2.Enabled) and (frmFormPag2.Visible) and (frmFormPag2.gridRecibos.CanFocus) then
    frmFormPag2.gridRecibos.SetFocus;
  if not vRecibo.IsEmpty then
     vRecibo.dataSet.Locate('COD_DEVEDOR', FcodigoCliente, [loCaseInsensitive]);
end;

function TFormPag2.habilitaControlesFormaPagamento(
  chamarTEF, pFormasEC, pUtilizarVale: boolean): Boolean;
var
  vOK: Boolean;
begin
  Result := False;

  try
    if FvalorVenda <= 0 then
    begin
      Application.MessageBox('Valor para receber é igual a Zero. Apenas clique em Confirmar', 'Atenção', 0 + 64);
      Exit;
    end;
    
    if not Falteracao then
    begin
      limparCamposFormulario;
      frmFormPag2.grupoControle.Enabled := false;
      frmFormPag2.ckContabil.Checked := Fcontabil;

      if not vDadosIni.verificarControlesFormasPagBarrados(buscas,
        FnumeroVenda, FcodigoCliente, trim(vControle.dataSet.FieldByName('NOME_CTRL').AsString), FtipoVenda, true)  then
         exit;

      if (not pUtilizarVale) and (vDadosIni.vProgFid.vHabilitarProgFid) then
      begin
        if vDadosIni.vProgFid.vCodControle > 0 then
          if vControle.DataSet.FieldByName('codigo_ctrl').AsInteger = vDadosIni.vProgFid.vCodControle then
          begin

            habilitaControleProgFid;
		        Exit;
          end;
      end
      else if (not pUtilizarVale) and (vDadosIni.vCashback.vHabilitarCashback) then
      begin
        if vDadosIni.vCashback.vCodControle > 0 then
          if vControle.DataSet.FieldByName('codigo_ctrl').AsInteger = vDadosIni.vCashback.vCodControle then
          begin

            habilitaControleProgFid;
		        Exit;
          end;
      end;

      if trim(vControle.DataSet.FieldByName('docs').AsString) = 'N' then
      begin
        if not vDadosIni.PesqPros('FPG003', 'INCLUIR',
         'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
         'FORMPAGAMENTO', '', buscas, True) then
          Exit;
          
        if chamarTEF and vControle.IsTEF then
          if efetuarTransacaoCartaoPOSVirtual then // se conseguir efetuar a transacao
          begin
            cancelar; // reseta o formulario e refaz a soma
            Result := False; // retorna falso para nao mudar de aba
            Exit;
          end
          else if FbotaoTefAtivo then
            Exit;

        FcarteiraHistorico := getHistorico;
        FcarteiraValorDinheiro := FvalorQueFaltaInformar;
        atribuirAtributosParaFormulario;

       if not pFormasEC then
       begin
         frmFormPag2.pnBotoesN.Visible := false;
         frmFormPag2.pnDinheiro.Align := alClient;
         frmFormPag2.PageControl1.ActivePage := frmFormPag2.tabDinheiro;
         if (frmFormPag2.Enabled) and (frmFormPag2.Visible) and (frmFormPag2.edCarteiraValorCarteira.CanFocus) then
           frmFormPag2.edCarteiraValorCarteira.SetFocus;
         //        frmFormPag2.edCarteiraValorCarteira.SelectAll;
       end;
      end
      else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
      begin
        if not vDadosIni.PesqPros('FPG004', 'INCLUIR',
        'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
        'FORMPAGAMENTO', '', buscas, True) then
          Exit;
        FchequeDataVencimento := Date;
        FchequeNumeroCheque := '';
        FchequeNomeTerceiro := '';
        if not Falteracao then
          getDadosBancarios(fcodigoCliente);
//        frmFormPag2.DBLookupComboBox1.KeyValue := FchequeNumeroBanco;
        FchequeCodigoTerceiro := 0;
        FchequeHistorico := getHistorico;
        FchequeValorCheque := FvalorQueFaltaInformar;
        atribuirAtributosParaFormulario;

        if not pFormasEC then
        begin
          frmFormPag2.pnBotoesS1.Visible := false;
          frmFormPag2.PageControl1.ActivePage := frmFormPag2.tabCheque;
          if (frmFormPag2.Enabled) and (frmFormPag2.Visible) and (frmFormPag2.edChequeNumeroCheque.CanFocus) then
            frmFormPag2.edChequeNumeroCheque.SetFocus;
          //        frmFormPag2.edChequeValorCheque.SelectAll;
        end;
      end
      else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S2' then
      begin
        if not validaInclusaoNovosBoletos then
          Exit;

        if not vDadosIni.PesqPros('FPG005', 'INCLUIR',
        'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
        'FORMPAGAMENTO', '', buscas, True) then
          Exit;

//        if trim(vControle.DataSet.FieldByName('tp_plano').AsString) = 'C' then
//          if (vControle.DataSet.FieldByName('CARTAO_SPED').AsInteger <> 1)
//          	and (vControle.DataSet.FieldByName('CARTAO_SPED').AsInteger <> 2) then
//          begin
//            if (Pos('DEBITO', trim(vControle.dataSet.FieldByName('NOME_CTRL').AsString)) <= 0)
//              and (Pos('DÉBITO', trim(vControle.dataSet.FieldByName('NOME_CTRL').AsString)) <= 0)
//              and (Pos('CREDITO', trim(vControle.dataSet.FieldByName('NOME_CTRL').AsString)) <= 0)
//              and (Pos('CRÉDITO', trim(vControle.dataSet.FieldByName('NOME_CTRL').AsString)) <= 0) then
//            begin
//              Application.MessageBox(pchar('Controle ' +
//	            	IntToStr(vControle.dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
//                ' - ' + trim(vControle.dataSet.FieldByName('NOME_CTRL').AsString) +
//               	' definido como cartão, favor informar se é Débito ou Crédito'),
//                'Atenção', MB_OK + MB_ICONWARNING);
//              cancelar; // reseta o formulario e refaz a soma
//              Result := False; // retorna falso para nao mudar de aba
//              Exit;
//            end;  
//          end;

        {
        if trim(vControle.DataSet.FieldByName('tp_plano').AsString) = 'C' then
          if vDadosIni.GetIni('TEF', 'POSVirtual', 'N') = 'S' then // POS Ativado
        }
          if chamarTEF and vControle.IsTEF then
            if efetuarTransacaoCartaoPOSVirtual then // se conseguir efetuar a transacao
            begin
              cancelar; // reseta o formulario e refaz a soma
              Result := False; // retorna falso para nao mudar de aba
              Exit;
            end
            else if FbotaoTefAtivo then
              Exit;

        FcreditoCondicaoPagamento := retornaValor(
        	' select cond_pag.desc_cond_pag as valor from cond_pag ' +
          ' where cond_pag.cod_cond_pag = ' + IntToStr(FcodigoCondicaoPagamento));
        vTermCartao._abreTerminais;
        vBandCartao._abreBandeiraCartao;
        FcreditoQtdeParcelas := 0;
        FcreditoNomeTerceiro := '';
        FcreditoJurosUtil := 0;
        FcreditoImprimirCarne := false;
        FcreditoCodigoTerceiro := 0;
        FcreditoAutCartao := '';
        fcreditoNSUTransacao := '';
        fcreditoCodTermAdmCartao := '';
        fcreditoTermAdmCartao := '';
        fcreditoCodBandeiraAdmCartao := 0;
        fcreditoBandeiraAdmCartao := '';
        FcreditoHistorico := getHistorico;
        FcreditoValorCredito := FvalorQueFaltaInformar;
        FcreditoValorCreditoLiq := 0;
        atribuirAtributosParaFormulario;
        if not pFormasEC then
        begin
          frmFormPag2.pnBotoesS2.Visible := false;
          frmFormPag2.PageControl1.ActivePage := frmFormPag2.tabCreditos;
          if (frmFormPag2.Enabled) and (frmFormPag2.Visible) and (frmFormPag2.edCreditoValorCredito.CanFocus) then
            frmFormPag2.edCreditoValorCredito.SetFocus;
          //        frmFormPag2.edCreditoValorCredito.SelectAll;
        end;
      end;
    end
    else
    begin

      if vDtSet.FieldByName('recibo').AsString = 'S' then
      begin
        Falteracao := False;
        Application.MessageBox('Lançamento feito utilizando um Recibo Antecipado! Não permite alteração', 'Atenção', 64);
        Exit;
      end;

      if vDtSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'B' then
      begin
        Falteracao := False;
        Application.MessageBox('Forma de pagamento gerada por boletos bancários. Não é permitido alterar ou excluir', 'Atenção', 0 + 64);
        Exit;
      end
      else if vDtSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'V' then
      begin
        Falteracao := False;
        Application.MessageBox('Forma de pagamento gerada por Vale Compra de Devoluções. Não é permitido alterar ou excluir', 'Atenção', 0 + 64);
        Exit;
      end
      else if vDtSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'C' then
      begin
        Falteracao := False;
        Application.MessageBox('Forma de pagamento eletrônica(Cartões ou Carteiras digitais). Não é permitido alterar ou excluir', 'Atenção', 0 + 64);
        Exit;
      end
      else if vDtSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'P' then
      begin
        Application.MessageBox('Forma de pagamento gerada por Vale Resgate. Não é permitido alterar ou excluir', 'Atenção', 0 + 64);
        Exit;
      end
      else if vDtSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'L' then
      begin
        Application.MessageBox('Forma de pagamento gerada por Locação. Não é permitido alterar ou excluir', 'Atenção', 0 + 64);
        Exit;
      end
      else if vDtSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'F' then
      begin
        Application.MessageBox('Forma de pagamento gerada por Vale - Programa de Fidelidade. Não é permitido alterar ou excluir', 'Atenção', 0 + 64);
        Exit;
      end
      else if vDtSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'R' then
      begin
        Application.MessageBox('Forma de pagamento gerada pelos valores de Retenção em Documentos Fiscais. Não é permitido alterar ou excluir', 'Atenção', 0 + 64);
        Exit;
      end
      else if vDtSet.FieldByName('PERMITIR_EXCLUIR').AsString = 'I' then
      begin
        Application.MessageBox('Forma de pagamento gerada pelos valores de Retenção em Documentos Fiscais. Não é permitido alterar ou excluir', 'Atenção', 0 + 64);
        Exit;
      end;

      frmFormPag2.grupoControle.Enabled := false;

      _selecionaControles;
      FindNearest([vDtSet.FieldByName('SEQFORM').AsInteger]);
      vControle.DataSet.IndexFieldNames := 'CODIGO_CTRL';
      vControle.FindNearest([DataSet.FieldByName('cod_controle').AsInteger]);
      frmFormPag2.ckContabil.Checked := DataSet.FieldByName('TIP_CNT').AsString = 'C';
      if trim(vControle.DataSet.FieldByName('docs').AsString) = 'N' then
      begin
        if not vDadosIni.PesqPros('FPG003', 'ALTERAR',
          'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda +
          'VALOR: '+ Format('%m', [DataSet.FieldByName('valorDoc').AsFloat]), 'FORMPAGAMENTO',
          '', buscas, True) then
          Exit;
        FcarteiraHistorico := DataSet.FieldByName('historico').AsString;
        FcarteiraValorDinheiro := DataSet.FieldByName('valordoc').AsCurrency;
        atribuirAtributosParaFormulario;
        frmFormPag2.PageControl1.ActivePage := frmFormPag2.tabDinheiro;
        //        frmFormPag2.edCarteiraValorCarteira.SelectAll;
        if (frmFormPag2.Enabled) and (frmFormPag2.Visible) and (frmFormPag2.edCarteiraValorCarteira.CanFocus) then
          frmFormPag2.edCarteiraValorCarteira.SetFocus;
      end
      else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
      begin
        if not vDadosIni.PesqPros('FPG004', 'ALTERAR',
          'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda +
          ' CH: ' + Trim(DataSet.FieldByName('ndoc').AsString) +
          ' VENC: ' +DataSet.FieldByName('data_venc').AsString +
          ' VALOR: '+ Format('%m', [DataSet.FieldByName('valorDoc').AsFloat]),
          'FORMPAGAMENTO', '', buscas, True) then
          Exit;
        FchequeDataVencimento := DataSet.FieldByName('data_venc').AsDateTime;
        FchequeNumeroCheque := DataSet.FieldByName('ndoc').AsString;
        FchequeNomeTerceiro := DataSet.FieldByName('terceiros').AsString;
        FchequeNumeroBanco := DataSet.FieldByName('cod_banco_str').AsString;
        FchequeNomeBanco := DataSet.FieldByName('banco').AsString;
        FchequeConta := DataSet.FieldByName('conta').AsString;
        FchequeAgencia := DataSet.FieldByName('agencia').AsString;
//        FchequeNumeroBanco := DataSet.FieldByName('cod_banco').AsInteger;
//        frmFormPag2.DBLookupComboBox1.KeyValue := FchequeNumeroBanco;
        FchequeCodigoTerceiro := DataSet.FieldByName('cod_cli_terc').AsInteger;
        FchequeHistorico := DataSet.FieldByName('historico').AsString;
        FchequeValorCheque := DataSet.FieldByName('valordoc').AsCurrency;
        atribuirAtributosParaFormulario;
        frmFormPag2.PageControl1.ActivePage := frmFormPag2.tabCheque;
        frmFormPag2.edChequeValorCheque.Enabled := True;
        vDadosIni.vInibeMensPesqPros := 'S';
        vOK := vDadosIni.PesqPros('FPG001', 'HABILITAR',
        'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
        'FORMPAGAMENTO', '', buscas, False);
        if (dataSet.FieldByName('PLANO').AsString = 'S') and (not vOK) then
        begin
          frmFormPag2.edChequeValorCheque.Enabled := False;
          if (frmFormPag2.Enabled) and (frmFormPag2.Visible) and (frmFormPag2.edChequeNumeroCheque.CanFocus) then
            frmFormPag2.edChequeNumeroCheque.SetFocus;
        end
        else if (frmFormPag2.Enabled) and (frmFormPag2.Visible) and (frmFormPag2.edChequeValorCheque.CanFocus) then
          frmFormPag2.edChequeValorCheque.SetFocus;
        //        frmFormPag2.edChequeValorCheque.SelectAll;
      end
      else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S2' then
      begin
        if not vDadosIni.PesqPros('FPG029', 'ALTERAR',
          'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda +
          ' PARCELA: ' + Trim(DataSet.FieldByName('ndoc').AsString) + ' ' + DataSet.FieldByName('data_venc').AsString + ' ' +
          Format('%0.2f', [DataSet.FieldByName('valorDoc').AsFloat]),
          'FORMPAGAMENTO', '', buscas, True) then
          Exit;

        frmFormPag2.ListBox1.Clear;
        Application.CreateForm(TfrmParcela, frmParcela);
        frmParcela.edCrDoc.Text := DataSet.FieldByName('ndoc').AsString;
        frmParcela.edCrDoc.Enabled := Trim(vControle.DataSet.FieldByName('usar_boleto').AsString) <> 'S';
        frmParcela.edCrVenc.Text := DateToStr(DataSet.FieldByName('data_venc').AsDateTime);
        frmParcela.mValorParcelaCr.Valor := DataSet.FieldByName('valorDoc').AsFloat;
        if frmParcela.ShowModal = mrOk then
        begin
          if not _validaPoliticasDescontos(frmParcela.mValorParcelaCr.Valor,1,strtodate(frmParcela.edCrVenc.Text)) then
          begin
            Result := False;
            cancelar;
            frmFormPag2.grupoControle.Enabled := True;
            Exit;
          end;
          dataSet.Edit;
          DataSet.FieldByName('ndoc').AsString := frmParcela.edCrDoc.Text;
          DataSet.FieldByName('data_venc').AsDateTime := StrToDate(frmParcela.edCrVenc.Text);
          DataSet.FieldByName('valorDoc').AsFloat := frmParcela.mValorParcelaCr.Valor;
          DataSet.FieldByName('valor_contabil').AsFloat := DataSet.FieldByName('valordoc').AsFloat;
          dataSet.Post;
          vDadosIni.GravaAuditoria('FPG029', 'SALVAR',
            'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda +
            ' MODIFICADA: ' + Trim(DataSet.FieldByName('ndoc').AsString) + ' ' + DataSet.FieldByName('data_venc').AsString + ' ' +
            Format('%0.2f', [DataSet.FieldByName('valorDoc').AsFloat]),
            'FORMPAGAMENTO', '', buscas);
          somarDocumentos;
          atribuirAtributosParaFormulario;
        end;
        cancelar;
        frmFormPag2.grupoControle.Enabled := True;
      end;
    end;
    Result := true;
  finally

  end;
end;

function TFormPag2.habilitaControlesFormaPagamentoEC: Boolean;
var
	vTerminal: string;
	vARP: string;
  vNSU: string;
	vBR: string;
  vListaTerminalTemp: TStringList;
	vnumAutCartao: string;
  vNSUtransacao: string;
  vNumTerminal: string;
  vTemp: string;
  I: Integer;
begin
   Result := False;

   if trim(vControle.DataSet.FieldByName('docs').AsString) = 'N' then
   begin
		 FcarteiraValorDinheiro := vDadosIni.StrToFloatFormat(vEcommerce.dataSet.FieldByName('valordoc').AsFloat, 2);
   end
   else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
   begin
     FchequeValorCheque := vDadosIni.StrToFloatFormat(vEcommerce.dataSet.FieldByName('valordoc').AsFloat, 2);
   end
   else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S2' then
   begin
     if (vDadosIni.vEcommerce.vLancarTaxaIntermPag <> 'DINHEIRO') then
     begin
       FcreditoValorCreditoLiq := vDadosIni.StrToFloatFormat(vEcommerce.dataSet.FieldByName('valordoc').AsFloat, 2);

       FcreditoValorCredito := vDadosIni.StrToFloatFormat(
         FcreditoValorCreditoLiq *
          (FvalorVenda /
            vDadosIni.StrToFloatFormat(vEcommerce.somatorioEcommerce(FnumeroVenda, FtipoVenda), 2)), 2);
     end
     else
     begin
     	 FcreditoValorCreditoLiq := 0;

       FcreditoValorCredito := vDadosIni.StrToFloatFormat(vEcommerce.dataSet.FieldByName('valordoc').AsFloat, 2);
     end;

     if Trim(vControle.dataSet.FieldByName('TP_PLANO').AsString) = 'C' then
     begin
       SqlOpen(' select historico from formpagamento_ec ' +
        ' where nrequisicao = ' + IntToStr(numeroVenda) +
        ' and tpdocs = ' + QuotedStr(tipoVenda) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
//        ' and local_venda = ' + QuotedStr(vEcommerce.dataSet.FieldByName('local_venda').AsString) +
        ' and intermediador = ' + QuotedStr(vEcommerce.dataSet.FieldByName('intermediador').AsString) +
        ' order by seqform ');

       if not buscas.IsEmpty then
       begin
       	 vTerminal := 'NÚMERO DO COMPROVANTE:';
         vARP := '<BR/>ARP:';
         vNSU := '<BR/>NSU:';
         vBR  := '<BR/>';

         vListaTerminalTemp := TStringList.Create;
       	 vListaTerminalTemp.Clear;

         vnumAutCartao := '';
         vNSUtransacao := '';

         if Pos(vARP, buscas.FieldByName('historico').AsString) > 0 then
         begin
           vnumAutCartao := buscas.FieldByName('historico').AsString;

           System.Delete(vnumAutCartao,
             1,
             Pos(vARP, buscas.FieldByName('historico').AsString) + Length(vARP));

           if Pos(vBR, vnumAutCartao) > 0 then
             System.Delete(vnumAutCartao,
               Pos(vBR, vnumAutCartao),
                Length(vnumAutCartao) - Pos(vBR, vnumAutCartao));
         end;

         if Pos(vNSU, buscas.FieldByName('historico').AsString) > 0 then
         begin
           vNSUtransacao := buscas.FieldByName('historico').AsString;

           System.Delete(vNSUtransacao,
             1,
             Pos(vNSU, buscas.FieldByName('historico').AsString) + Length(vNSU));

           if Pos(vBR, vNSUtransacao) > 0 then
             System.Delete(vNSUtransacao,
               Pos(vBR, vNSUtransacao),
                Length(vNSUtransacao) - Pos(vBR, vNSUtransacao));
         end;

         if not vTermCartao.dataSet.IsEmpty then
         begin
           if Pos(vTerminal, buscas.FieldByName('historico').AsString) > 0 then
           begin
              vNumTerminal := buscas.FieldByName('historico').AsString;

              System.Delete(vNumTerminal,
               1,
               Pos(vTerminal, buscas.FieldByName('historico').AsString) + Length(vTerminal));

              if Pos(vBR, vNumTerminal) > 0 then
               System.Delete(vNumTerminal,
                 Pos(vBR, vNumTerminal),
                  Length(vNumTerminal) - Pos(vBR, vNumTerminal));

              vTemp := vNumTerminal;
              if Length(vNumTerminal) > 6 then
              begin
                for I := 0 to Length(vNumTerminal) - 1 do
                begin
                  vTemp := Copy(vNumTerminal, 1, Length(vNumTerminal) - I);

                  vListaTerminalTemp.Add(vTemp);

                  if Length(vTemp) <= 6 then
                    break;
                end;
                for I := 0 to vListaTerminalTemp.Count - 1 do
                begin
                  vTemp := vDadosIni.IfThen(I  > 0, vTemp + ' union ', '') +
                    ' select ' + IntToStr(I) + ' ordem, cod_term_adm, desc_term_adm from terminal_cartao ' +
                    ' where cod_term_adm = ' + QuotedStr(trim(vListaTerminalTemp[I])) +
                    ' and cod_empresa = ' + vDadosIni.codEmpresa;
                end;
                vTemp := vTemp + ' order by 1'
              end
              else
              begin
                vTemp :=
                  ' select 1 ordem, cod_term_adm, desc_term_adm from terminal_cartao ' +
                  ' where cod_term_adm = ' + QuotedStr(trim(vNumTerminal)) +
                  ' and cod_empresa = ' + vDadosIni.codEmpresa;
              end;
              buscas.Close;
              buscas.SQL.Text := vTemp;
              buscas.Open;

              if not buscas.IsEmpty then
              begin
                fcreditoCodTermAdmCartao := buscas.FieldByName('cod_term_adm').AsString;
                fcreditoTermAdmCartao := trim(buscas.FieldByName('desc_term_adm').AsString);
              end;
           end;
         end;

	       FcreditoAutCartao := vnumAutCartao;
         fcreditoNSUTransacao := vNSUtransacao;
       end;

       if not vBandCartao.dataSet.IsEmpty then
       begin
       	 SqlOpen(' select cod_bandeira, descricao from bandeiras_cartao ' +
          ' where descricao = ' + QuotedStr(trim(vEcommerce.dataSet.FieldByName('intermediador').AsString)) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa);

         if buscas.IsEmpty then
         begin
           SqlOpen(' select cod_bandeira, descricao from bandeiras_cartao ' +
            ' where descricao = ' + QuotedStr(trim(StringReplace(trim(vEcommerce.dataSet.FieldByName('intermediador').AsString), 'CARTÃO', '', [rfReplaceAll]))) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa);
         end;

         if buscas.IsEmpty then
         begin
           SqlOpen(' select cod_bandeira, descricao from bandeiras_cartao ' +
            ' where descricao = ' + QuotedStr(trim(StringReplace(trim(vEcommerce.dataSet.FieldByName('intermediador').AsString), 'CARTAO', '', [rfReplaceAll]))) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa);
         end;

         if not buscas.IsEmpty then
         begin
           fcreditoCodBandeiraAdmCartao := buscas.FieldByName('cod_bandeira').AsInteger;
           fcreditoBandeiraAdmCartao := trim(buscas.FieldByName('descricao').AsString);
         end;
       end;
     end;

     if vEcommerce.dataSet.FieldByName('qtde').AsInteger > 1 then
       FcreditoQtdeParcelas := vEcommerce.dataSet.FieldByName('qtde').AsInteger
     else
     begin
     	 FcreditoQtdeParcelas := vEcommerce.dataSet.FieldByName('qtde').AsInteger;
       
       SqlOpen(' select inter.cod_cond_pag from intermediador_controle_ec inter ' +
        ' inner join cond_pag on cond_pag.cod_cond_pag = inter.cod_cond_pag and cond_pag.ativo = 1 ' +
        ' where inter.local_venda = ' + QuotedStr(vEcommerce.dataSet.FieldByName('local_venda').AsString) +
        ' and inter.intermediador = ' + QuotedStr(vEcommerce.dataSet.FieldByName('intermediador').AsString) +
        ' and inter.cod_empresa = ' + vDadosIni.codEmpresa);
       if not buscas.IsEmpty then
         if buscas.FieldByName('COD_COND_PAG').AsInteger > 0 then
           frmFormPag2.lkedcreditoCondicaoPagamento.KeyValue := buscas.FieldByName('COD_COND_PAG').AsInteger;
     end;
   end;
   atribuirAtributosParaFormulario;

   if trim(vControle.DataSet.FieldByName('docs').AsString) = 'N' then
   begin
     frmFormPag2.pnBotoesN.Visible := true;
     frmFormPag2.pnDinheiro.Align := alNone;
     frmFormPag2.pnDinheiro.Height := 95;
     if not vDadosIni.abreForm('Dinheiro - Interm: ' + vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString,
       frmFormPag2.pnDinheiro, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]) then
       exit;
   end
   else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
   begin
     frmFormPag2.pnBotoesS1.Visible := true;
     if not vDadosIni.abreForm('Cheque - Interm: ' + vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString,
       frmFormPag2.pnCheque, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]) then
       exit;
   end
   else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S2' then
   begin
     frmFormPag2.pnBotoesS2.Visible := true;
     if not vDadosIni.abreForm('Créditos - Interm: ' + vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString,
       frmFormPag2.pnCreditos, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]) then
       exit;
   end;
   Result := True;
end;

function TFormPag2.habilitaControlesFormaPagamentoValeProgFid(AOperacao: TOperacaoRecibo; pValorVale: Double): Boolean;
begin
   Result := False;
   if trim(vControle.DataSet.FieldByName('docs').AsString) = 'N' then
     FcarteiraValorDinheiro := pValorVale
   else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
     FchequeValorCheque := pValorVale
   else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S2' then
   begin
     FcreditoValorCredito := pValorVale;
     FcreditoValorCreditoLiq := 0;
     FcreditoQtdeParcelas := 1;
   end;
   atribuirAtributosParaFormulario;

   if trim(vControle.DataSet.FieldByName('docs').AsString) = 'N' then
   begin
     frmFormPag2.pnBotoesN.Visible := true;
     frmFormPag2.pnDinheiro.Align := alNone;
     frmFormPag2.pnDinheiro.Height := 95;
     if AOperacao = orNormal then
     begin
       if not vDadosIni.abreForm('Dinheiro',
         frmFormPag2.pnDinheiro, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]) then
         exit;
     end
     else
     	obFormPag2.salvarDadosInformados(obFormPag2.numeroVendaEcommerce > 0);
   end
   else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
   begin
     frmFormPag2.pnBotoesS1.Visible := true;
     if AOperacao = orNormal then
     begin
       if not vDadosIni.abreForm('Cheque',
         frmFormPag2.pnCheque, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]) then
         exit;
     end
     else
     	 obFormPag2.salvarDadosInformados(obFormPag2.numeroVendaEcommerce > 0);
   end
   else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S2' then
   begin
     frmFormPag2.pnBotoesS2.Visible := true;
     if AOperacao = orNormal then
     begin
       if not vDadosIni.abreForm('Créditos',
         frmFormPag2.pnCreditos, [ofEscapeExit, ofBISystemMenuOff, ofAlignAllClientWinCtrl]) then
         exit;
     end
     else
       obFormPag2.salvarDadosInformados(obFormPag2.numeroVendaEcommerce > 0);
   end;
   Result := True;
end;

procedure TFormPag2.HandleBotaoTefAtivo;
begin
  FbotaoTefAtivo := (vDadosIni.GetIni('TEF', 'POSVirtual', 'N') = 'S') and
                    (TConfig_sistema_class.getConf('pos_virtual_conf', buscas, vDadosIni.cod_empresa)
                    .ReadString('Conf', 'HabilitarBotaoTEF') = 'S');
end;

function TFormPag2.salvarDadosInformados(pFormasEC: boolean = false): boolean;
begin
  try
    Result := False;

    if (trim(vControle.DataSet.FieldByName('docs').AsString) = 'S2')
      and (Length(vValor) <= 0) then
    begin
      Application.MessageBox(pchar('Favor gerar as parcelas antes de salvar!'), 'Atenção', MB_OK + MB_ICONWARNING);
      exit;
    end;

    if frmFormPag2 <> nil then
      atribuirDadosDoFormularioParaAtributos;

    FRef_Frete := False;
    if (FtipoVenda = 'MOT') and (not alteracao) then
      if vPlano.vDadosPlano.mot_Valor_frete > 0 then
      begin
        Application.ProcessMessages;
        FRef_Frete := Application.MessageBox('Lançamento referente a Frete/Seguro/Outras Despesas?',
          'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES;
      end;

    if not validarPossivelTroco  then
    begin
      Result := False;
      Exit;
    end;

    if trim(vControle.DataSet.FieldByName('docs').AsString) = 'N' then
      Result := receberEmCarteira(pFormasEC)
    else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
      Result := receberEmCheque(pFormasEC)
    else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S2' then
    begin
//      FcreditoAutCartao := '';
      Result := False;
//      if Trim(vControle.dataSet.FieldByName('TP_PLANO').AsString) = 'C' then
//        if not InputQuery('Numero da Autorização ', ' Nº Autorização Cartão:', FcreditoAutCartao) then
//          exit;
      Result := receberEmCredito(pFormasEC);
    end;
    if Result then
    begin
      atribuirAtributosParaFormulario;
      frmFormPag2.grupoControle.Enabled := True;
      frmFormPag2.PageControl1.ActivePage := frmFormPag2.tabLancamentos;
      if (frmFormPag2.Enabled) and (frmFormPag2.Visible) and (frmFormPag2.gridControle.CanFocus) then
        frmFormPag2.gridControle.SetFocus;
      cancelar;
      Falteracao := false;
    end;
  finally
    FRef_Frete := False;
    FRef_MTUsadas := False;
  end;
end;

function TFormPag2.selecionaFormaPagamento(nVenda, subSerie: integer;
  tipoDoc: string): boolean;
var
  temp: string;
begin
  if (nVenda = 0) and (trim(tipoDoc) <> '') then
  begin
    Result := false;
    exit;
  end;
  temp := '';
  if tipoDoc = 'NF' then
    temp := ' and fp.sub_serie = ' + IntToStr(subSerie);
  Result := montaSelect('select fp.*, '' '' num_rec_dep, '' '' num_rec_parc from formpagamento fp ' +
  	 ' where fp.nrequisicao = ' + IntToStr(nVenda) +
    temp +
    ' and fp.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and fp.tpdocs = ' + QuotedStr(tipoDoc));
end;

function TFormPag2.setarPontosProgFidelidade(pDebito: boolean = false): boolean;
var
  buscasTemp: TIBQuery;
begin
   try
     Result := true;

     if (not vDadosIni.vProgFid.vHabilitarProgFid) and (not vDadosIni.vCashback.vHabilitarCashback) then
       exit;

     buscasTemp := TIBQuery.Create(Application);
     buscasTemp.Database := buscas.Database;
     buscasTemp.Transaction := buscas.Transaction;

     if trim(FtipoVenda) = 'PRE' then
     begin
       buscasTemp.Close;
       buscasTemp.SQL.Text := ' select cr.cod_cred ndoc, cr.lote_cxl, ''PRE'' tipo  from controle_creditos cr ' +
         ' where cr.lote_cxl = :lote_cxl and cr.codigo_emp = :cod_empresa ';
       buscasTemp.ParamByName('lote_cxl').AsInteger := FnumeroVenda;
       buscasTemp.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscasTemp.Open;
       buscasTemp.FetchAll;

       buscasTemp.First;
       while not buscasTemp.Eof  do
       begin
          // Atualizar pontos programa de fidelidade
          if not vDadosIni.setarPontosProgFidelidade(buscasTemp.FieldByName('ndoc').AsInteger, 'PRE', buscas, pDebito) then
          begin
            RollBackTransacao;
            Result := false;
            exit;
          end;

          buscasTemp.Next;
       end;
     end
     else
     begin
       // Atualizar pontos programa de fidelidade
       if not vDadosIni.setarPontosProgFidelidade(FnumeroVenda, FtipoVenda, buscas, pDebito) then
       begin
         RollBackTransacao;
         Result := false;
         exit;
       end;
     end;
   except
    on e: exception do
    begin
      Result := false;
      RollBackTransacao;
      Application.MessageBox(pchar(e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

function TFormPag2.selecionaFormaPagamento: boolean;
var
  temp: string;
begin
  if (FnumeroVenda = 0) and (trim(FtipoVenda) <> '') then
  begin
    Result := false;
    exit;
  end;

  fCtrl.Close;
  fCtrl.CommandText := 'SELECT * FROM CONTROLES '+//WHERE CXENT = ''S''' +
    ' where ATIVO = 1 AND CODIGO_EMP = ' + vDadosIni.codEmpresa + ' ORDER BY QSEQPERF';
  fCtrl.Open;

  temp := '';
  if FtipoVenda = 'NF' then
    temp := ' and fp.sub_serie = ' + IntToStr(Fsub_Serie);
  Result := montaSelect('select fp.*, '' '' num_rec_dep, '' '' num_rec_parc from formpagamento fp ' +
    ' WHERE fp.nrequisicao = ' + IntToStr(FnumeroVenda) + ' and fp.tpdocs = ' + QuotedStr(FtipoVenda) +
    ' and fp.ativo = 1 and fp.cod_empresa = ' + vDadosIni.codEmpresa + temp);
  IndexFieldNames := 'SEQFORM';
  vDtSet.IndexFieldNames := 'SEQFORM';

end;

procedure TFormPag2.imprimePromissoria;
begin
  if not vDadosIni.PesqPros('FPG009', 'IMRPIMIR',
    'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
    'FORMPAGAMENTO', '', buscas, True) then
    Exit;
  frmFormPag2.TitleBand1.BeforePrint := TitleBandPromissoriaBeforePrint;
  frmFormPag2.QuickRep1.DataSet := dataSet;
  frmFormPag2.QuickRep1.ReportTitle := 'Promissórias';
  frmFormPag2.QuickRep1.PreviewInitialState := wsMaximized;
  frmFormPag2.QuickRep1.Preview;
  frmFormPag2.TitleBand1.BeforePrint := nil;
end;

procedure TFormPag2.imprimeCarne;
begin
  if not vDadosIni.PesqPros('FPG009', 'IMPRIMIR',
  'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
  'FORMPAGAMENTO', '', buscas, True) then
    Exit;
  try
    Application.CreateForm(TfrmDetalhamento, frmDetalhamento);
    frmDetalhamento.QuickRep2.Tag := 0;
    frmDetalhamento.QRLabel60.Tag := 0;
    dataSet.First;
    while not dataSet.Eof do
    begin
      if Trim(dataSet.FieldByName('tipdoc').AsString) = 'S2' then
        frmDetalhamento.QuickRep2.Tag := frmDetalhamento.QuickRep2.Tag + 1;
      dataSet.Next;
    end;
    dataSet.First;

    frmDetalhamento.QRBand1.BeforePrint := TitleBandCarneDetBeforePrint;
    frmDetalhamento.QuickRep2.DataSet := dataSet;
    frmDetalhamento.QuickRep2.ReportTitle := 'Promissórias';
    frmDetalhamento.QuickRep2.PreviewInitialState := wsMaximized;
    frmDetalhamento.QuickRep2.Preview;
    frmDetalhamento.QRBand1.BeforePrint := nil;
  finally
    frmDetalhamento.Free;
    frmDetalhamento := nil;
  end;
end;

procedure TFormPag2.imprimeCarneFormDetalhe;
begin
  if not vDadosIni.PesqPros('FPG009', 'IMPRIMIR',
  'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
  'FORMPAGAMENTO', '', buscas, True) then
    Exit;

  vCountRel_1 := 0;
  vCountRel_2 := 0;
  dataSet.First;
  while not dataSet.Eof do
  begin
    if Trim(dataSet.FieldByName('tipdoc').AsString) = 'S2' then
      vCountRel_1 := vCountRel_1 + 1;
    dataSet.Next;
  end;
  dataSet.First;

  frmDetalhamento.QRBand1.BeforePrint := TitleBandCarneDetBeforePrint;
  frmDetalhamento.QuickRep2.DataSet := dataSet;
  frmDetalhamento.QuickRep2.ReportTitle := 'Promissórias';
  frmDetalhamento.QuickRep2.PreviewInitialState := wsMaximized;
  frmDetalhamento.QuickRep2.Preview;
  frmDetalhamento.QRBand1.BeforePrint := nil;
end;

procedure TFormPag2.imprimePromissoriaFormDetalhe;
begin
  if not vDadosIni.PesqPros('FPG009', 'IMPRIMIR',
  'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
  'FORMPAGAMENTO', '', buscas, True) then
    Exit;
  frmDetalhamento.TitleBand1.BeforePrint := TitleBandPromissoriaDetBeforePrint;
  frmDetalhamento.QuickRep1.DataSet := dataSet;
  frmDetalhamento.QuickRep1.ReportTitle := 'Promissórias';
  frmDetalhamento.QuickRep1.PreviewInitialState := wsMaximized;
  frmDetalhamento.QuickRep1.Preview;
  frmDetalhamento.TitleBand1.BeforePrint := nil;
end;

procedure TFormPag2.imprimeReciboFormDetalhe;
begin
 if Application.MessageBox('Deseja imprimir 2 cópias na mesma página?', 'Atenção.',  MB_ICONQUESTION + MB_YESNO) = IDNO then
  begin
  	frmDetalhamento.QRShape21.Left := 0;
    frmDetalhamento.QRShape21.Height := 409;
    frmDetalhamento.QRShape24.Left := 0;
    frmDetalhamento.QRShape24.Height := 409;
  end
  else
  begin
  	frmDetalhamento.QRShape21.Left := 0;
    frmDetalhamento.QRShape21.Height := 0;
    frmDetalhamento.QRShape24.Left := 0;
    frmDetalhamento.QRShape24.Height := 0;
  end;

  if vDadosIni.vRecibo.HabRecPorDepart then
  begin
    frmDetalhamento.TitleBand4.BeforePrint := TitleBandReciboDetBeforePrint;
    frmDetalhamento.QuickRep4.DataSet := dataSet;
	  frmDetalhamento.QuickRep4.ReportTitle := 'Recibo';
  	frmDetalhamento.QuickRep4.PreviewInitialState := wsMaximized;
	  frmDetalhamento.QuickRep4.Preview;
  	frmDetalhamento.TitleBand4.BeforePrint := nil;
  end
  else
  begin
	  frmDetalhamento.TitleBand3.BeforePrint := TitleBandReciboDetBeforePrint;
    frmDetalhamento.QuickRep3.DataSet := dataSet;
	  frmDetalhamento.QuickRep3.ReportTitle := 'Recibo';
  	frmDetalhamento.QuickRep3.PreviewInitialState := wsMaximized;
	  frmDetalhamento.QuickRep3.Preview;
  	frmDetalhamento.TitleBand3.BeforePrint := nil;
  end;
end;

function TFormPag2.imprimirReciboPontosProgFidelidade(pNumeroVenda: Integer; pTipoVenda: string; pDebito: boolean = false): boolean;
var
  buscasTemp: TIBQuery;
begin
   try
     Result := true;

     if not vDadosIni.vProgFid.vHabilitarProgFid then
       exit;

     buscasTemp := TIBQuery.Create(Application);
     buscasTemp.Database := buscas.Database;
     buscasTemp.Transaction := buscas.Transaction;

     if trim(pTipoVenda) = 'PRE' then
     begin
       buscasTemp.Close;
       buscasTemp.SQL.Text := ' select cr.cod_cred ndoc, cr.lote_cxl, ''PRE'' tipo  from controle_creditos cr ' +
         ' where cr.lote_cxl = :lote_cxl and cr.codigo_emp = :cod_empresa ';
       buscasTemp.ParamByName('lote_cxl').AsInteger := pNumeroVenda;
       buscasTemp.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscasTemp.Open;
       buscasTemp.FetchAll;

       buscasTemp.First;
       while not buscasTemp.Eof  do
       begin
          vDadosIni.ImprimirRecProgFid(buscas, buscasTemp.FieldByName('ndoc').AsInteger, 'PRE', IfThen(pDebito, 'DÉBITO', 'CRÉDITO')); //Imprimir recibo programa de fidelidade

          buscasTemp.Next;
       end;
     end
     else
       vDadosIni.ImprimirRecProgFid(buscas, pNumeroVenda, trim(pTipoVenda), IfThen(pDebito, 'DÉBITO', 'CRÉDITO')); //Imprimir recibo programa de fidelidade
   except
    on e: exception do
    begin
      Result := false;
      RollBackTransacao;
      Application.MessageBox(pchar(e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

function TFormPag2.incluirLancamentoAvulso(valor: Currency;
  codControle: integer; nplanoContas: Double; ptpDocs, ptipDocs, historico,
  tipLanc, entSaida, troco: string; ndoc: integer): boolean;
var
  vCodLanc: Integer;
  vCodFp: Integer;
  vCodMax: Integer;
begin
  try
    vCodLanc := Gencodigo('LANCCXL', buscas, vDadosIni.codEmpresa);

    buscas.Close;
    buscas.SQL.Text := ' SELECT MAX(COD_LANCXL) CODMAX FROM LANCCXL ' +
    	' WHERE CODIGO_EMP = ' + vDadosIni.codEmpresa;
    buscas.Open;
    vCodMax := buscas.FieldByName('CODMAX').AsInteger;

    if (vCodMax + 1 > vCodLanc) then
    begin
      vCodLanc := vCodMax + 1;

      SqlExec(' update codigo set valor = ' + IntToStr(vCodMax + 1) +
        ' where tabela = ''LANCCXL'' and cod_empresa = ' + vDadosIni.codEmpresa, buscas);
      CommitaTransacao;
    end;

    if (vCodLanc <= 0) then
    begin
    	Result := false;
      raise exception.create('Falha ao gerar código tabela ' + QuotedStr('LANCCXL'));
      Exit;
    end;

    vCodFp := Gencodigo('FORMPAGAMENTO', buscas, vDadosIni.codEmpresa);

    buscas.Close;
    buscas.SQL.Text := ' SELECT MAX(SEQFORM) CODMAX FROM FORMPAGAMENTO ' +
    	' WHERE COD_EMPRESA = ' + vDadosIni.codEmpresa;
    buscas.Open;
    vCodMax := buscas.FieldByName('CODMAX').AsInteger;

    if (vCodMax + 1 > vCodFp) then
    begin
      vCodFp := vCodMax + 1;

      SqlExec(' update codigo set valor = ' + IntToStr(vCodMax + 1) +
        ' where tabela = ''FORMPAGAMENTO'' and cod_empresa = ' + vDadosIni.codEmpresa, buscas);
      CommitaTransacao;
    end;

    if (vCodFp <= 0) then
    begin
    	Result := false;
      raise exception.create('Falha ao gerar código tabela ' + QuotedStr('FORMPAGAMENTO'));
      Exit;
    end;

    buscas.Close;
    buscas.SQL.Text := ' INSERT INTO LANCCXL ' +
      ' (COD_LANCXL, CODIGO_EMP, TIPO_DOC_CXL, DATA_LC_CXL, N_DOC_CXL, TIPO_LANC_CXL, HISTORICO_CXL, ' +
      '  VALOR_CXL, SDD, TR, OP_CXL, N_CONTA_PLC, REFRECIBO, TAXA_INTERMEDIADOR) ' +
      ' VALUES (:COD_LANCXL, :CODIGO_EMP, :TIPO_DOC_CXL, :DATA_LC_CXL, :N_DOC_CXL, :TIPO_LANC_CXL, :HISTORICO_CXL, ' +
      '  :VALOR_CXL, :SDD, :TR, :OP_CXL, :N_CONTA_PLC, :REFRECIBO, :TAXA_INTERMEDIADOR); ';
    buscas.ParamByName('COD_LANCXL').AsInteger := vCodLanc;
    buscas.ParamByName('CODIGO_EMP').AsString := vDadosIni.codEmpresa;
    buscas.ParamByName('TIPO_LANC_CXL').AsString := entSaida;
    buscas.ParamByName('SDD').AsString := 'S';
    buscas.ParamByName('DATA_LC_CXL').AsDateTime := vDadosIni.diaAbertoCxl;
    buscas.ParamByName('HISTORICO_CXL').AsString := historico;
    buscas.ParamByName('VALOR_CXL').AsFloat := valor;
    buscas.ParamByName('OP_CXL').AsInteger := vDadosIni.vCodOpCxl;
//    if tipoDoc <> '' then
//      buscas.ParamByName('TIPO_DOC_CXL').AsString := tipoDoc;
    buscas.ParamByName('N_DOC_CXL').AsInteger := ndoc;
    if troco <> '' then
      buscas.ParamByName('TR').AsString := troco;
//    buscas.ParamByName('N_REC').AsInteger := pNRecibo;
//    if taxaInterm <> '' then
//      buscas.ParamByName('TAXA_INTERMEDIADOR').AsString := taxaInterm;
//    if pNRecibo > 0 then
//      buscas.ParamByName('REFRECIBO').AsString := 'S';
    buscas.ExecSQL;

    buscas.Close;
    buscas.SQL.Text := ' INSERT INTO FORMPAGAMENTO ' +
    	' (SEQFORM, COD_EMPRESA, COD_CONTROLE, TIPDOC, US_CAD, OP_CXL, SUB_SERIE, NREQUISICAO, TPDOCS, ' +
      '  DATA_MOV, N_CONTA_PLC, HISTORICO, VALORDOC, VALOR_CONTABIL) ' +
      ' VALUES (:SEQFORM, :COD_EMPRESA, :COD_CONTROLE, :TIPDOC, :US_CAD, :OP_CXL, :SUB_SERIE, :NREQUISICAO, :TPDOCS, ' +
      ' :DATA_MOV, :N_CONTA_PLC, :HISTORICO, :VALORDOC, :VALOR_CONTABIL); ' ;
    buscas.ParamByName('SEQFORM').AsInteger := vCodFp;
    buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
    buscas.ParamByName('COD_CONTROLE').AsInteger := codControle;
    buscas.ParamByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
    buscas.ParamByName('OP_CXL').AsInteger := vDadosIni.vCodOpCxl;
    buscas.ParamByName('SUB_SERIE').AsInteger := 0;
    buscas.ParamByName('NREQUISICAO').AsInteger := vCodLanc;
    buscas.ParamByName('TPDOCS').AsString := ptpDocs;
    if buscas.ParamByName('OP_CXL').AsInteger > 0 then
      buscas.ParamByName('DATA_MOV').AsDateTime := vDadosIni.diaAbertoCxl
    else
      buscas.ParamByName('DATA_MOV').AsDateTime := vDadosIni.getDataBanco(dtmFP.qrBuscas);
    //      if tpDocs = 'NF' then
    //        buscas.ParamByName('num_nota').AsInteger := nreq;
    buscas.ParamByName('N_CONTA_PLC').AsFloat := nplanoContas;
    buscas.ParamByName('TIPDOC').AsString := ptipDocs;
    buscas.ParamByName('HISTORICO').AsString := historico;
    if tipLanc = 'S' then
      buscas.ParamByName('VALORDOC').AsCurrency := valor * (-1)
    else
      buscas.ParamByName('VALORDOC').AsCurrency := valor;
    buscas.ParamByName('VALOR_CONTABIL').AsFloat := buscas.ParamByName('VALORDOC').AsFloat;
    buscas.ExecSQL;

    CommitaTransacao;
    Result := True;

//    IniciaTransacao;
//    if not vLancCxl.insereLancamento('', entSaida, troco, historico, valor, ndoc) then
//    begin
//      result := false;
//      RollBackTransacao;
//      exit;
//    end;
//    if not selecionaFormaPagamento(vLancCxl.dataSet.FieldByName('COD_LANCXL').AsInteger, 0, ptpDocs) then
//      raise exception.create('Erro ao selecionar forma da pagamento');
//
//    if inherited insert then
//    begin
//      DataSet.FieldByName('cod_controle').AsInteger := codControle;
//      DataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
//      DataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
//      DataSet.FieldByName('op_cxl').AsInteger := vDadosIni.vCodOpCxl;
//      DataSet.FieldByName('sub_serie').AsInteger := 0;
//      DataSet.FieldByName('nrequisicao').AsInteger := vLancCxl.dataSet.FieldByName('COD_LANCXL').AsInteger;
//      if DataSet.FieldByName('op_cxl').AsInteger > 0 then
//        DataSet.FieldByName('data_mov').AsDateTime := vDadosIni.diaAbertoCxl
//      else
//        DataSet.FieldByName('data_mov').AsDateTime := vDadosIni.getDataBanco(dtmFP.qrBuscas);
//      DataSet.FieldByName('tpdocs').AsString := ptpDocs;
//      //      if tpDocs = 'NF' then
//      //        DataSet.FieldByName('num_nota').AsInteger := nreq;
//      dataSet.FieldByName('n_conta_plc').AsFloat := nplanoContas;
//      dataSet.FieldByName('tipdoc').AsString := ptipDocs;
//      dataSet.FieldByName('historico').AsString := historico;
//      if tipLanc = 'S' then
//        dataSet.FieldByName('valorDoc').AsCurrency := valor * (-1)
//      else
//        dataSet.FieldByName('valorDoc').AsCurrency := valor;
//      DataSet.FieldByName('valor_contabil').AsFloat := DataSet.FieldByName('valordoc').AsFloat;
//      dataSet.FieldByName('seqform').AsInteger := Gencodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo,
//        vDadosIni.codEmpresa);
//
//      if post then
//      begin
//        Apply;
//        vLancCxl.Apply;
//      end;
//      CommitaTransacao;
//      vLancCxl.Close;
//      close;
//      result := true;
//    end
//    else
//      RollBackTransacao;
  except
    on e: exception do
    begin
      Result := false;
      RollBackTransacao;
      Application.MessageBox(pchar(e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

function TFormPag2.iniciaAtributos(numeroDaVenda, codigoDaCondicaoPagamento,
  subSerie, codigoDoCliente, codigoDoVendedor: integer; tipoDoc: string;
  valorDaVenda: Currency): boolean;
var
  AList: TStringList;
  ACondicoesCliente: string;
  I: Integer;
  vtemp, vtemp2: string;
  ConfigPoliticaPag: TConfig_sistema_class;
  vUsarControlesVenda: string;
begin
  try
  	try
      Result := true;

      ConfigPoliticaPag := TConfig_sistema_class.getConf('ped_vnd_definir_politica_pagamento', buscas, vDadosIni.cod_empresa);
  		vUsarControlesVenda := UpperCase(ConfigPoliticaPag.ReadString('CONTROLE', 'Usar'));

      vseqform := 0;
      if vDtSet.Tag <> 22 then
        vDtSet.CreateDataSet;
      vDtSet.Tag := 22;
      vDtSet.EmptyDataSet;
      FvalorVenda := valorDaVenda;
      FnumeroVenda := numeroDaVenda;
      if (tipoDoc = 'PRE') and (codigoDaCondicaoPagamento > 1) then
      begin
        FcodigoCondicaoPagamento := 1;
        fDataBase := DateOf(codigoDaCondicaoPagamento);
      end
      else
      begin
        FcodigoCondicaoPagamento := codigoDaCondicaoPagamento;
        fDataBase := 0;
      end;
      Fsub_Serie := subSerie;
      FcodigoCliente := codigoDoCliente;
      FcodigoVendedor := codigoDoVendedor;
      FtipoVenda := tipoDoc;
      Fcontabil := FtipoVenda = 'NF';
      fSecao := 0;
      FnumeroVendaEcommerce := 0;

      vBanco.getTodos;

      if (((Trim(tipoDoc) = 'REQ') or (Trim(tipoDoc) = 'OS')) and (vDadosIni.vPedVnd.ReceberPeloFinanceiro))
        or ((Trim(tipoDoc) = 'MOT') and (vDadosIni.vVeic.ReceberPeloFinanceiro))
        or ((Trim(tipoDoc) = 'REC')	and (vDadosIni.vRecibo.ReceberPeloFinanceiro)) then
      begin
        buscas.Close;
        buscas.SQL.Text := ' select formpagamento.seqform, ' +
          ' case when (trim(formpagamento.tpdocs) = ''REQ'') then ' +
          '					coalesce(pedvenda.cxl, ''N'') ' +
          '      when (trim(formpagamento.tpdocs) = ''OS'') then ' +
          '         coalesce(pedvenda.cxl, ''N'') ' +
          '      when (trim(formpagamento.tpdocs) = ''REC'') then ' +
          '         coalesce(recibos.cxl, ''N'') ' +
          '      when (trim(formpagamento.tpdocs) = ''MOT'') then ' +
          '         coalesce(com_fat.cxl, ''N'') ' +
          '      else ' +
          '        ''N'' ' +
          ' end cxl from formpagamento ' +
          ' left join recibos on recibos.nrecibo = formpagamento.nrequisicao ' +
          ' 	and recibos.cod_empresa = formpagamento.cod_empresa ' +
          ' left join pedvenda on pedvenda.nped = formpagamento.nrequisicao ' +
          ' 	and pedvenda.tipo = trim(formpagamento.tpdocs) ' +
          '   and pedvenda.cod_empresa = formpagamento.cod_empresa ' +
          ' left join com_fat on com_fat.n_comando = formpagamento.nrequisicao ' +
          '   and com_fat.cod_empresa = formpagamento.cod_empresa ' +
          ' where formpagamento.nrequisicao = ' + IntToStr(numeroDaVenda) +
          ' and formpagamento.tpdocs = ' + QuotedStr(Trim(tipoDoc)) +
          ' and formpagamento.cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.Open;

        if not buscas.IsEmpty then
          if (vDadosIni.vSistema <> 'Cxl') and (buscas.FieldByName('cxl').AsString = 'S') then
          begin
            Application.MessageBox('Documento recebido pelo Caixa Auxiliar. Não é permitido receber pelo Financeiro', 'Atenção', MB_OK + MB_ICONWARNING);
            Result := false;
            exit;
          end
          else if (vDadosIni.vSistema = 'Cxl') and (buscas.FieldByName('cxl').AsString <> 'S') then
          begin
            Application.MessageBox('Documento recebido pelo Financeiro. Não é permitido receber pelo Caixa Auxiliar', 'Atenção', MB_OK + MB_ICONWARNING);
            Result := false;
            exit;
          end;
      end;

    	vDadosIni.baixarRecAntValeCompra(codigoDoCliente);

      if (vDadosIni.vEmp.vModoFaturamento = 'S') then
        VerificarReciboDevolucao(codigoCliente, tipoDoc);

      if (vDadosIni.vProgFid.vHabilitarProgFid) or (vDadosIni.vCashback.vHabilitarCashback) then
        VerificarValeProgFid;

      if (vDadosIni.vEcommerce.vHabilitarEcommerce) then
        if (FtipoVenda = 'REQ') or (FtipoVenda = 'OS') then
        begin
          FnumeroVendaEcommerce := StrToInt(retornaValor('select coalesce(id_commerce, 0) as valor from pedvenda  ' +
             ' where nped = ' + IntToStr(numeroDaVenda) +
             ' and tipo = ' + QuotedStr(tipoDoc) +
             ' and cod_empresa = ' + vDadosIni.codEmpresa));

          if FnumeroVendaEcommerce > 0 then
        end;

      if vDadosIni.vEmp.vUsarPoliticasDesc then
      begin
        if (FtipoVenda = 'REQ') or (FtipoVenda = 'OS') then
          FRegrasDescontos:= retornaValor(' select regras_descontos as valor from pedvenda  ' +
             ' where nped = ' + IntToStr(numeroDaVenda) +
             ' and tipo = ' + QuotedStr(tipoDoc) +
             ' and cod_empresa = ' + vDadosIni.codEmpresa+ ' and ativo = 1 ');
        if (trim(FRegrasDescontos) <> '') and (trim(FRegrasDescontos) <> '()') then
        begin
          buscas.close;
          buscas.SQL.Text := ' select distinct rc.codigo_ctrl from regras_vendas rv ' +
            ' inner join regravnd_controle rc on ' +
            '		rc.cod_regravnd = rv.cod_regravnd ' +
            '		and rc.cod_empresa = rv.cod_empresa ' +
            '	where rv.cod_regravnd in ' + FRegrasDescontos +
            ' and rv.cod_empresa = ' + vDadosIni.codEmpresa +
            ' and rv.ativo = 1';
          buscas.open;
          FCtrlRegrasDescontos:='';
          while not buscas.eof do
          begin
            FCtrlRegrasDescontos := FCtrlRegrasDescontos+ buscas.fieldbyname('codigo_ctrl').asstring+',';
            buscas.next;
          end;
        end;
        if not(FCtrlRegrasDescontos = '') then
        begin
          System.delete(FCtrlRegrasDescontos,vDadosIni.pos_a_direita(FCtrlRegrasDescontos,','), length(FCtrlRegrasDescontos));
          FCtrlRegrasDescontos := '('+FCtrlRegrasDescontos+')';
        end;
      end;

      buscas.Close;
      buscas.SQL.Text := ' select nome_cliente, controles_fp, cond_pag_vnd, cond_pag_pre from clientes' +
        ' where cod_cliente = ' + IntToStr(codigoCliente) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;
      FnomeCliente      := Trim(buscas.FieldByName('nome_cliente').AsString);
      FformasCliente    := Trim(buscas.FieldByName('controles_fp').AsString);
      FcondicoesCliente := Trim(buscas.FieldByName(IfThen(FtipoVenda = 'PRE', 'cond_pag_pre', 'cond_pag_vnd')).AsString);

      if trim(FformasCliente) <> '' then
        if ContainsStr(trim(FformasCliente), ',')
          and (Copy(trim(FformasCliente), 1, 1) = '(')
          and (Copy(trim(FformasCliente), Length(trim(FformasCliente)), 1) <> ')') then
        begin
          vtemp := '';
          vtemp2 := '';
          for I := 1 to Length(trim(FformasCliente)) do
          begin
            vtemp := vtemp + trim(FformasCliente[I]);
            if trim(FformasCliente[I]) = ',' then
              vtemp2 := vtemp;
          end;
          FformasCliente := Copy(vtemp2, 1, Length(vtemp2) - 1) + ')';
        end;

      if trim(FcondicoesCliente) <> '' then
        if ContainsStr(trim(FcondicoesCliente), ',')
          and (Copy(trim(FcondicoesCliente), 1, 1) = '(')
          and (Copy(trim(FcondicoesCliente), Length(trim(FcondicoesCliente)), 1) <> ')') then
        begin
          vtemp := '';
          vtemp2 := '';
          for I := 1 to Length(trim(FcondicoesCliente)) do
          begin
            vtemp := vtemp + trim(FcondicoesCliente[I]);
            if trim(FcondicoesCliente[I]) = ',' then
              vtemp2 := vtemp;
          end;
          FcondicoesCliente := Copy(vtemp2, 1, Length(vtemp2) - 1) + ')';
        end;

      if (vDadosIni.vEmp.vUsarControlesCliente = 'S')
        and ((trim(FformasCliente) <> '') or (_existeControlesPadrao)) then
      begin
        buscas.Close;
        buscas.SQL.Text := '';
        if trim(FformasCliente) <> '' then
        begin
          buscas.SQL.Text := buscas.SQL.Text +
            ' SELECT CONTROLES.CODIGO_CTRL FROM CONTROLES ' +
            ' WHERE CONTROLES.CXENT = ''S'' ' +
            ' AND CONTROLES.ATIVO = 1 ' +
            ' AND CONTROLES.CODIGO_EMP = ' + vDadosIni.codEmpresa +
            ' AND CONTROLES.CODIGO_CTRL IN ' + FformasCliente +
            ' UNION ';
        end;

        buscas.SQL.Text := buscas.SQL.Text +
          ' SELECT CONTROLES.CODIGO_CTRL FROM CONTROLES ' +
          ' WHERE CONTROLES.CXENT = ''S'' ' +
          ' AND CONTROLES.ATIVO = 1 ' +
          ' AND CONTROLES.CODIGO_EMP = ' + vDadosIni.codEmpresa +
          ' AND COALESCE(CONTROLES.FP_PADRAO_CL, ''N'') = ''T'' ';
        buscas.Open;

        if buscas.RecordCount > 0 then
        begin
          FformasCliente := '(';
          buscas.First;
          while not buscas.Eof do
          begin
            if buscas.RecNo = 1 then
              FformasCliente := FformasCliente + IntToStr(buscas.FieldByName('CODIGO_CTRL').AsInteger)
            else
              FformasCliente := FformasCliente + ', ' + IntToStr(buscas.FieldByName('CODIGO_CTRL').AsInteger);

            buscas.Next;
          end;
          FformasCliente := FformasCliente + ')';
        end;
      end;

      if (vDadosIni.vCliente.vCondPagPorCliente)
        and ((trim(FcondicoesCliente) <> '') or (_existeCondPagPadrao(FtipoVenda)))  then
      begin
        buscas.Close;
        buscas.SQL.Text := '';
        if trim(FcondicoesCliente) <> '' then
        begin
          buscas.SQL.Text := buscas.SQL.Text +
          	' SELECT COND_PAG.COD_COND_PAG FROM COND_PAG ' +
            ' INNER JOIN COND_PAG_EMPRESA ON ' +
            '		COND_PAG_EMPRESA.COD_COND_PAG = COND_PAG.COD_COND_PAG ' +
            '   AND COND_PAG_EMPRESA.COD_EMPRESA = ' + vDadosIni.codEmpresa +
            ' WHERE COND_PAG.COD_COND_PAG IN ' + FcondicoesCliente +
            ' AND COND_PAG.ATIVO = 1 ' +
            ' UNION ';
        end;

        buscas.SQL.Text := buscas.SQL.Text +
          ' SELECT COND_PAG.COD_COND_PAG FROM COND_PAG ' +
          ' INNER JOIN COND_PAG_EMPRESA ON ' +
          '		COND_PAG_EMPRESA.COD_COND_PAG = COND_PAG.COD_COND_PAG ' +
          '   AND COND_PAG_EMPRESA.COD_EMPRESA = ' + vDadosIni.codEmpresa +
          ' WHERE COALESCE(COND_PAG.' + IfThen(FtipoVenda = 'PRE', 'COND_PADRAO_CL_PREST', 'COND_PADRAO_CL_VND') + ', ''N'') = ''T'' ' +
          ' AND COND_PAG.ATIVO = 1 ';
        buscas.Open;

        if buscas.RecordCount > 0 then
        begin
          FcondicoesCliente := '(';
          buscas.First;
          while not buscas.Eof do
          begin
            if buscas.RecNo = 1 then
              FcondicoesCliente := FcondicoesCliente + IntToStr(buscas.FieldByName('COD_COND_PAG').AsInteger)
            else
              FcondicoesCliente := FcondicoesCliente + ', ' + IntToStr(buscas.FieldByName('COD_COND_PAG').AsInteger);

            buscas.Next;
          end;
          FcondicoesCliente := FcondicoesCliente + ')';
        end;
      end;

      if (vDadosIni.vCliente.vCondPagPorCliente) and (FcondicoesCliente <> '') then
      begin
        ACondicoesCliente := StringReplace(FcondicoesCliente, '(', ',', [rfIgnoreCase]);
        ACondicoesCliente := StringReplace(ACondicoesCliente, ')', ',', [rfIgnoreCase]);
        ACondicoesCliente := StringReplace(ACondicoesCliente, ' ', '', [rfIgnoreCase]);
        AList := TStringList.Create;
        try
          AList := vDadosIni.Split(ACondicoesCliente, ',');
          if AList.IndexOf(IntToStr(FcodigoCondicaoPagamento)) = -1 then
            for I := 0 to AList.Count - 1 do
              if StrToIntDef(AList[I], -1) > 0 then
              begin
                FcodigoCondicaoPagamento := StrToIntDef(AList[I], -1);
                Break;
              end;
        finally
          FreeAndNil(AList);
        end;
      end;

      if not selecionaFormaPagamento then
      begin
        result := false;
        exit;
      end;
      verificaPlano;
      verificaPlanoNF;
      verificaNF;

      Fcontabil := (FtipoVenda = 'NF') or (FNumFatura > 0) or (FNum_Nf > 0) or (FNCupom > 0) or (Fcod_nfce > 0);

      somarDocumentos;
      fGerouFormaBoleto := False;

      vRecibo.selecionaRecibosAntecipados;

      verificaValeCompraDevolucao;

      verificaReciboAntecipadoNotaFiscal;

      if not verificaPedidoCanceladoEcommerce then
      begin
        if vRecibo.vHistRec.dataSet.Active then
          vRecibo.vHistRec.dataSet.CancelUpdates;
        vRecibo.dataSet.CancelUpdates;
        if vLancCxl.dataSet.Active then
          vLancCxl.dataSet.CancelUpdates;
        dataSet.CancelUpdates;
        RollBackTransacao;
        Result := False;
        Exit;
      end;

      if not verificaBoletos then
      begin
        if vRecibo.vHistRec.dataSet.Active then
          vRecibo.vHistRec.dataSet.CancelUpdates;
        vRecibo.dataSet.CancelUpdates;
        if vLancCxl.dataSet.Active then
          vLancCxl.dataSet.CancelUpdates;
        dataSet.CancelUpdates;
        RollBackTransacao;
        Result := False;
        Exit;
      end;

      if not verificaLocacao then
      begin
        if vRecibo.vHistRec.dataSet.Active then
          vRecibo.vHistRec.dataSet.CancelUpdates;
        vRecibo.dataSet.CancelUpdates;
        if vLancCxl.dataSet.Active then
          vLancCxl.dataSet.CancelUpdates;
        dataSet.CancelUpdates;
        RollBackTransacao;
        Result := False;
        Exit;
      end;

      if not verificaValeContaCorrente then
      begin
        if vRecibo.vHistRec.dataSet.Active then
          vRecibo.vHistRec.dataSet.CancelUpdates;
        vRecibo.dataSet.CancelUpdates;
        if vLancCxl.dataSet.Active then
          vLancCxl.dataSet.CancelUpdates;
        dataSet.CancelUpdates;
        RollBackTransacao;
        Result := False;
        Exit;
      end;

      if not verificaCartao then
      begin
        Result := False;
        Exit;
      end;

      if not verificaIssRetidoNFSe then
      begin
        Result := False;
        Exit;
      end;
      
      if not verificaRetencaoTributosFederais then
      begin
        Result := False;
        Exit;
      end;

      if not atualizarPlanoPag then
      begin
        Result := False;
        Exit;
      end;

      somarDocumentos;

      FCtrlVND    := 0;
      FCondPagVND := 0;
      if (vUsarControlesVenda = 'S')
      	and ((trim(FtipoVenda) = 'REQ') or (trim(FtipoVenda) = 'OS')) then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select cod_cond_pag, cod_controle from pedvenda' +
          ' where nped = ' + IntToStr(FnumeroVenda) +
          ' and tipo = ' + QuotedStr(trim(FtipoVenda)) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.Open;
        FCtrlVND    := buscas.FieldByName('cod_controle').AsInteger;
        FCondPagVND := buscas.FieldByName('cod_cond_pag').AsInteger;
        if fValorDescAVista > 0 then
          if FCtrlVND <> 1 then
          begin
            buscas.Close;
            buscas.SQL.Text := 'update pedvenda set cod_controle = 1' +
              ' where nped = ' + IntToStr(FnumeroVenda) +
              ' and tipo = ' + QuotedStr(trim(FtipoVenda)) +
              ' and cod_empresa = ' + vDadosIni.codEmpresa;
            buscas.ExecSQL;
            FCtrlVND := 1;
          end;
      end;

      if not vControle.selecionaControlesFormPag(FformasCliente, FCtrlVND, ((FtipoVenda = 'PRE') or (FtipoVenda = 'REC')),FCtrlRegrasDescontos) then
      begin
        Result := false;
        Application.MessageBox('Sem controles configurados para efetuar a forma de pagamento.', 'Informação', MB_OK + MB_ICONWARNING);
        exit;
      end;

      HandleBotaoTefAtivo;

      fControlesBoleto := '|';
      try
        vControle.dataSet.Filter := 'usar_boleto = ''S''' ;
        vControle.dataSet.Filtered := True;
        vControle.dataSet.DisableControls;
        vControle.dataSet.First;
        while not vControle.dataSet.Eof do
        begin
          fControlesBoleto := fControlesBoleto + IntToStr(vControle.dataSet.FieldByName('codigo_ctrl').AsInteger) + '|';
          vControle.dataSet.Next;
        end;
  //      fControlesBoleto := Copy(fControlesBoleto, 1, Length(fControlesBoleto) - 1) + ')';

      finally
        vControle.dataSet.Filter := '';
        vControle.dataSet.Filtered := False;
        vControle.dataSet.EnableControls;
      end;

      PlanoValeProgFid;

      buscas.close;
    finally
      if Assigned(ConfigPoliticaPag) then
        FreeAndNil(ConfigPoliticaPag);
    end;
  except
  	on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro ao inciar atributos. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('TFormPag2.iniciaAtributos. %s', [e.Message]);
    end;
  end;
end;

function TFormPag2.insert: boolean;
begin
  if inherited insert then
  begin
    DataSet.FieldByName('cod_controle').AsInteger :=
      vControle.DataSet.FieldByName('codigo_ctrl').AsInteger;
    DataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    DataSet.FieldByName('cod_cliente').AsInteger := FcodigoCliente;
    DataSet.FieldByName('cliente').AsString := FnomeCliente;
    DataSet.FieldByName('OPERADOR').AsInteger := FcodigoVendedor;
   // DataSet.FieldByName('codigo_func').AsInteger := vDadosIni.vCodUsuario;
    DataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
    DataSet.FieldByName('op_cxl').AsInteger := vDadosIni.vCodOpCxl;
    DataSet.FieldByName('nrequisicao').AsInteger := FnumeroVenda;

    if (trim(FtipoVenda) = 'REQ') and (vDadosIni.vPedVnd.ReceberPeloFinanceiro)
	   and (vDadosIni.vEmp.vModoFaturamento = 'S') and (vDadosIni.vSistema <> 'Cxl') then
      DataSet.FieldByName('data_mov').AsDateTime := vDadosIni.diaFFinanceiro + 1
    else if (trim(FtipoVenda) = 'OS') and (vDadosIni.vPedVnd.ReceberPeloFinanceiro)
	   and (vDadosIni.vEmp.vModoFaturamento = 'S') and (vDadosIni.vSistema <> 'Cxl') then
      DataSet.FieldByName('data_mov').AsDateTime := vDadosIni.diaFFinanceiro + 1
    else if (trim(FtipoVenda) = 'MOT') and (vDadosIni.vVeic.ReceberPeloFinanceiro)
	   and (vDadosIni.vEmp.vModoFaturamento = 'S') and (vDadosIni.vSistema <> 'Cxl') then
      DataSet.FieldByName('data_mov').AsDateTime := vDadosIni.diaFFinanceiro + 1
    else if (trim(FtipoVenda) = 'REC') and (vDadosIni.vRecibo.ReceberPeloFinanceiro)
	   and (vDadosIni.vEmp.vModoFaturamento = 'S') and (vDadosIni.vSistema <> 'Cxl') then
      DataSet.FieldByName('data_mov').AsDateTime := vDadosIni.diaFFinanceiro + 1
    else if DataSet.FieldByName('op_cxl').AsInteger > 0 then
      DataSet.FieldByName('data_mov').AsDateTime := vDadosIni.diaAbertoCxl
    else
      DataSet.FieldByName('data_mov').AsDateTime := vDadosIni.getDataBanco(dtmFP.qrBuscas);
    DataSet.FieldByName('tpdocs').AsString := FtipoVenda;
    DataSet.FieldByName('sub_serie').AsInteger := Fsub_Serie;
    if FtipoVenda = 'NF' then
      DataSet.FieldByName('num_nota').AsInteger := FnumeroVenda
    else if FNum_Nf > 0 then
    begin
      DataSet.FieldByName('num_nota').AsInteger := FNum_Nf;
      DataSet.FieldByName('sub_serie').AsInteger := FSerie_Nf;
      dataSet.FieldByName('TIP_CNT').AsString := 'C';
    end
    else if FNCupom > 0 then
      dataSet.FieldByName('TIP_CNT').AsString := 'C';
    if Fcod_nfce > 0 then
    begin
      dataSet.FieldByName('TIP_CNT').AsString := 'C';
      dataSet.FieldByName('cod_nfce').AsInteger := Fcod_nfce;
    end;
    if FRef_Frete then
      DataSet.FieldByName('ref_frete').AsString := 'F'
    else if FRef_MTUsadas then
      DataSet.FieldByName('ref_frete').AsString := 'M';
    DataSet.FieldByName('md5').AsString := 'SISTEMA';
    DataSet.FieldByName('secao').AsInteger := fSecao;
    result := true;
  end
  else
    result := false;
end;

function TFormPag2.lancarTarifaInterm(AOperacao: TOperacaoRecibo): boolean;
var
  vvalorecommerce: Double;
  vvalortarifainterm: Double;
begin
   Result := true;
   try
      if (FnumeroVendaEcommerce <= 0) then
        exit;

      vvalorecommerce := vDadosIni.StrToFloatFormat(vEcommerce.somatorioEcommerce(FnumeroVenda, FtipoVenda), 2);
      //Valor da venda menor que o valor dos intermediadores de pag
      if (vDadosIni.StrToFloatFormat(FvalorVenda, 2) <= vDadosIni.StrToFloatFormat(vvalorecommerce, 2)) then
        exit;
      //Valor restante é igual ao valor da taxa do intermediador de pag

//      if (vDadosIni.vEcommerce.vLancarTaxaIntermPag = 'DINHEIRO') then
//        if (vDadosIni.StrToFloatFormat(FvalorVenda - vvalorecommerce, 2) <> vDadosIni.StrToFloatFormat(FvalorQueFaltaInformar, 2)) then
//          exit;

      vEcommerce.dataSet.First;
      while not vEcommerce.dataSet.Eof do
      begin
      	if (vEcommerce.dataSet.FieldByName('COD_CONTROLE').AsInteger > 0) 
					and ((vDadosIni.vEcommerce.vLancarTaxaIntermPag = 'DINHEIRO')
        		or (trim(vEcommerce.dataSet.FieldByName('DOCS').AsString) = 'N')) then
        begin
          vvalortarifainterm := (vDadosIni.StrToFloatFormat(
            vDadosIni.StrToFloatFormat(vEcommerce.dataSet.FieldByName('valordoc').AsFloat, 2) *
              (FvalorVenda /
                vDadosIni.StrToFloatFormat(vEcommerce.somatorioEcommerce(FnumeroVenda, FtipoVenda), 2)), 2)) -
                  vDadosIni.StrToFloatFormat(vEcommerce.dataSet.FieldByName('valordoc').AsFloat, 2);

          try
            dataSet.Filter := ' LOCAL_VENDA = ' + QuotedStr(vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString) +
              ' AND INTERMEDIADOR = ' + QuotedStr(vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString) +
              ' AND INTERM_NUMVEND > 0 ';

            dataSet.Filtered := True;

            if dataSet.IsEmpty then
            begin
            	vControle.DataSet.IndexFieldNames := 'NOME_CTRL';

            	if (vDadosIni.vEcommerce.vLancarTaxaIntermPag <> 'DINHEIRO') then
                vControle.FindNearest([trim(vEcommerce.dataSet.FieldByName('NOME_CTRL').AsString)])
              else
                vControle.FindNearest(['DINHEIRO']);

              dataSet.Filter := '';

              if not (DataSet.state in [dsInsert, dsEdit]) then
                Insert;

              if (vDadosIni.vEcommerce.vLancarTaxaIntermPag <> 'DINHEIRO') then
              	DataSet.FieldByName('cod_controle').AsInteger := vEcommerce.dataSet.FieldByName('COD_CONTROLE').AsInteger
              else
              	DataSet.FieldByName('cod_controle').AsInteger := 1;

              if DataSet.state in [dsBrowse] then
              begin
                Result := false;
                vControle.DataSet.IndexFieldNames := 'CODIGO_CTRL';
                exit;
              end;

              DataSet.FieldByName('metodo_pag_id').AsInteger :=
                vEcommerce.dataSet.FieldByName('metodo_pag_id').AsInteger;
              DataSet.FieldByName('local_venda').AsString :=
                vEcommerce.dataSet.FieldByName('local_venda').AsString;
              DataSet.FieldByName('intermediador').AsString :=
                vEcommerce.dataSet.FieldByName('intermediador').AsString;

              if (vDadosIni.vEcommerce.vLancarTaxaIntermPag <> 'DINHEIRO') then
              	DataSet.FieldByName('tipdoc').AsString := vEcommerce.dataSet.FieldByName('DOCS').AsString
              else
              	DataSet.FieldByName('tipdoc').AsString := 'N';

              DataSet.FieldByName('historico').AsString := 'PAGAMENTO CONFORME TAXA INTEMEDIADOR E-COMMERCE';
              DataSet.FieldByName('valordoc').AsFloat := vDadosIni.StrToFloatFormat(vvalortarifainterm, 2); //FvalorVenda - vvalorecommerce, 2);
              DataSet.FieldByName('valor_contabil').AsFloat := vDadosIni.StrToFloatFormat(DataSet.FieldByName('valordoc').AsFloat, 2);
              DataSet.FieldByName('recibo').AsString := 'N';
              //        DataSet.FieldByName('REC_TIPVEND').AsString := FtipoVenda;
        //              DataSet.FieldByName('REC_NUMVEND').AsInteger := FnumeroVenda;
              //        DataSet.FieldByName('nrequisicao').AsInteger := vRecibo.dataSet.FieldByName('nrecibo').AsInteger;
              //        DataSet.FieldByName('tpdocs').AsString := 'REC';
        //      DataSet.FieldByName('REC_TIPVEND').AsString := 'REC';
        //      DataSet.FieldByName('REC_NUMVEND').AsInteger := nRecibo;
              DataSet.FieldByName('recibo').AsString := 'N';
              DataSet.FieldByName('nrequisicao').AsInteger := FnumeroVenda;
              DataSet.FieldByName('tpdocs').AsString := FtipoVenda;
              DataSet.FieldByName('interm_numvend').AsInteger := FnumeroVendaEcommerce;
              Inc(vseqform);
              if DataSet.State = dsInsert then
                DataSet.FieldByName('SEQFORM').AsInteger :=  vseqform;//GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
        //      DataSet.FieldByName('N_REC').AsInteger := FnumeroVendaEcommerce;
              if AOperacao <> orNormal then
                dataSet.FieldByName('PERMITIR_EXCLUIR').AsString := 'V';// Nao permite excluir ou alterar Vale Compra
              Post;
        //      if vDadosIni.vSistema = 'Cxl' then
        //      begin
        //        vLancCxl.insereLancamento(FtipoVenda, 'S', '',
        //          'BX TAXA INTERM ' + IntToStr(FnumeroVendaEcommerce) + ' ' + FtipoVenda + ' ' + IntToStr(FnumeroVenda),
        //         // 'BAIXA CONF. VALECOMPRA(S) ' + vNRecibos + FtipoVenda + ' ' + IntToStr(FnumeroVenda),
        //          FvalorVenda - vvalorecommerce, numeroVenda, 0);
        //      //          vFecDiaCxl.alteraSaldo('S', valorRecebimento);
        //      end;

              if Result then
              begin
                if AOperacao = orNormal then
                begin
                atribuirAtributosParaFormulario;
                frmFormPag2.grupoControle.Enabled := True;
                frmFormPag2.PageControl1.ActivePage := frmFormPag2.tabLancamentos;
                if (frmFormPag2.Enabled) and (frmFormPag2.Visible) and (frmFormPag2.gridControle.CanFocus) then
                  frmFormPag2.gridControle.SetFocus;
                end;
              end;
            end;
          finally
            DataSet.Filtered := False;
            DataSet.IndexFieldNames := 'SEQFORM';
          end;
        end;

        vEcommerce.dataSet.Next;
      end;
  except
    on e: exception do
    begin
      vControle.DataSet.IndexFieldNames := 'CODIGO_CTRL';
      result := false;
      Application.MessageBox(pchar('EFPG0023 Erro ao lançar tarifa e-commerce. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('EFPG0023 ' + e.Message);
    end;
  end;
end;

procedure TFormPag2.leConfiguracoesRegistro(Consulta: TClientDataSet);
const
  Conf: string = 'Software\Hw\Configuracao\Telas\';
var
  Registro: TRegistry;
  vTemp: string;
  vTempBol: boolean;
begin
  try
    // Chama o construtor do objeto
    Registro := TRegistry.Create;
    try
      { Abre a chave (se o 2°. Parâmetro for True, ele cria a chave caso ela ainda não exista. }
      Registro.OpenKey(Conf + Self.ClassName+'\'+Consulta.ClassName, True);
      // Grava as informações do form
      vTemp := Registro.ReadString(frmFormPag2.ComboBox1.Name);
      if (vTemp <> '') then
        frmFormPag2.ComboBox1.Text := vTemp;
      vTemp := Registro.ReadString(frmFormPag2.MaskEdit1.Name);
      if vTemp <> '' then
        frmFormPag2.MaskEdit1.Text := vTemp;
      vTemp := Registro.ReadString(frmFormPag2.MaskEdit2.Name);
      if vTemp <> '' then
        frmFormPag2.MaskEdit2.Text := vTemp;
      if frmFormPag2.CheckBox1.Enabled then
        frmFormPag2.CheckBox1.Checked := Registro.ReadBool(frmFormPag2.CheckBox1.Name);

      if frmFormPag2.edTotalRecibos.Valor <= 0 then
      begin
         frmFormPag2.RadioButton1.Checked := Registro.ReadBool(frmFormPag2.RadioButton1.Name);
         frmFormPag2.RadioButton2.Checked := Registro.ReadBool(frmFormPag2.RadioButton2.Name);
         frmFormPag2.RadioButton2.Enabled := True;
      end
      else
      begin
        frmFormPag2.RadioButton1.Checked := True;
        frmFormPag2.RadioButton2.Checked := False;
        frmFormPag2.RadioButton2.Enabled := False;
      end;

      Registro.CloseKey;
    finally
      Registro.Free;
    end;
  except
  end;
end;

procedure TFormPag2.limpaParcelamento;
begin
	SetLength(vDocumento, 0);
  SetLength(vData, 0);
  SetLength(vValor, 0);
  SetLength(vValorLiq, 0);
end;

procedure TFormPag2.limparCamposFormulario;
begin
  with frmFormPag2 do
  begin
    edReciboNumeroRecibo.Text := '0';
    edReciboValorRecibo.Valor := 0;

    edCarteiraValorCarteira.Valor := 0;
    edCarteiraHistorico.Text := '';
    edChequeAgencia.Text := '';
    edChequeConta.Text := '';
    edChequeHistorico.Text := '';
    edChequeNomeTerceiro.Text := '';
    edChequeNumeroCheque.Text := '';
    edChequeValorCheque.Valor := 0;
    edChequeDataVencimento.Text := '';
    edChequeNumBanco.Text := '';
    edChequeCodigoTerceiro.Valor := 0;
    edcreditoQtdeParcelas.Value := 0;
    edcreditoCondicaoPagamento.Text := '';
    edCreditoNomeTerceiro.Text := '';
    edCreditoHistorico.Text := '';
    edCreditoValorCredito.Valor := 0;
    edCreditoJurosUtil.Valor := 0;
    edCreditoCodigoTerceiro.Valor := 0;
    edcreditoNumAutoCartao.Text := '';
    edCreditoNSUTransacao.Clear;
    edcreditoCodTermAdmCartao.KeyValue := Null;
    edcreditoCodBandeiraAdmCartao.KeyValue := Null;
    ckCreditoImprimirCarne.Checked := false;
    ListBox1.Clear;
  end;
end;

function TFormPag2.montarLancamentoMTUsadas: Boolean;
var
  vOK: Boolean;
begin
  if vPlano.vDadosPlano.mot_valorMotUsada <= 0 then
    exit;
  vOK := True;
  dataSet.First;
  while not dataSet.Eof do
  begin
    if (Trim(DataSet.FieldByName('tipdoc').AsString) = 'N') and
      (Trim(DataSet.FieldByName('rec_tipvend').AsString) = '') and
      (Trim(DataSet.FieldByName('TPDOCS').AsString) <> 'LCS') and
      (Trim(DataSet.FieldByName('ref_frete').AsString) = 'M') then
    begin
      vOK := False;
      Break;
    end;
    dataSet.Next;
  end;
  if vOK then
  begin
    FRef_MTUsadas := True;
    Insert;
    dataSet.FieldByName('DATA_VENC').AsString := '';
    dataSet.FieldByName('VALORDOC').AsCurrency := vPlano.vDadosPlano.mot_valorMotUsada;
    DataSet.FieldByName('valor_contabil').AsFloat := DataSet.FieldByName('valordoc').AsFloat;
    if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
      dataSet.FieldByName('COD_CONTROLE').AsInteger := vDadosIni.vEmp.vCodCtrlMtUsadas
    else
      dataSet.FieldByName('COD_CONTROLE').AsInteger := 1;
    dataSet.FieldByName('TIPDOC').AsString := 'N';
    dataSet.FieldByName('HISTORICO').AsString := 'MOTO USADA ' + FtipoVenda + ' Nº ' + inttostr(FnumeroVenda);
    if Fcontabil then
      dataSet.FieldByName('TIP_CNT').AsString := 'C';
    Inc(vseqform);
    dataSet.FieldByName('SEQFORM').AsInteger := vseqform;//GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
    dataSet.Post;
    FRef_MTUsadas := False;
    somarDocumentos;
  end;
end;

function TFormPag2.montarOSLancamentoInterm: Boolean;
var
  vNPed, vNPreVenda, vCod_Vendedor, vCodCliente, vCod_Servico: Integer;
  vDataNow: TDate;
  vObsLivroRegistro, vMod, vChassi, vPlaca, vTipoVenda, vModelo, vTipVeiculo: string;
  vOK: Boolean;
  vNumOs, vNumComando, vCFOPServ, vCodEstMoto: Integer;
begin
  if vPlano.vDadosPlano.mot_Valor_Interm > 0 then
  begin
    try
      if vPlano.vDadosPlano.mot_OS_Inter then
      begin
        Result := True;
        exit;
      end;
      buscas.close;
      buscas.SQL.Text := 'select N_OS_RETORNO from plano_pag' +
        ' where nrequisicao = ' + IntToStr(FnumeroVenda) +
        ' and tpdocs = ' + QuotedStr(FtipoVenda) +
        ' and nome_ctrl = ''INTERMEDIACAO''' +
        ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
      buscas.Open;
      vNumOs := buscas.fieldbyname('N_OS_RETORNO').AsInteger;
      if vNumOs > 0 then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select nped, valor_total from pedvenda where nped = ' + IntToStr(vNumOs) +
          ' and tipo = ''OS'' and cod_empresa = ' + vDadosIni.codEmpresa +
          ' and ((status_ped is null) or (status_ped = ''''))';
        buscas.Open;
        if ((buscas.FieldByName('nped').AsInteger = vNumOs) and
          (vDadosIni.StrToFloatFormat(buscas.FieldByName('valor_total').AsFloat, 2) <>
          vDadosIni.StrToFloatFormat(vPlano.vDadosPlano.mot_Valor_Interm, 2))) or
          (buscas.FieldByName('nped').AsInteger = 0) then
        begin
          buscas.Close;
          buscas.SQL.Text := 'update pedvenda set valor_total = :valor_total,' +
            ' TOT_SERV = :valor_total' +
            ' where nped = ' + IntToStr(vNumOs) +
            ' and tipo = ''OS'' and cod_empresa = ' + vDadosIni.codEmpresa;
          buscas.ParamByName('valor_total').AsCurrency :=
            vDadosIni.StrToFloatFormat(vPlano.vDadosPlano.mot_Valor_Interm, 2);
          buscas.ExecSQL;

          buscas.Close;
          buscas.SQL.Text := 'update pedvenda_serv set VALOR_UN_SERV = :valor_total,' +
            ' VALOR_TOT_SERV = :valor_total, VLUN_ORIG = :valor_total' +
            ' where nped = ' + IntToStr(vNumOs) +
            ' and tipo = ''OS'' and cod_empresa = ' + vDadosIni.codEmpresa;
          buscas.ParamByName('valor_total').AsCurrency :=
            vDadosIni.StrToFloatFormat(vPlano.vDadosPlano.mot_Valor_Interm, 2);
          buscas.ExecSQL;

          vPlano.vDadosPlano.mot_OS_Inter := True;
          vPlano.vDadosPlano.mot_NumPedVenda := vNumOs;

          Result := True;
          exit;

        end
        else if (buscas.FieldByName('nped').AsInteger = vNumOs) then
        begin
          vPlano.vDadosPlano.mot_OS_Inter := True;
          vPlano.vDadosPlano.mot_NumPedVenda := vNumOs;
          Result := True;
          exit;
        end;

      end;
      vDataNow := vDadosIni.getDataBanco(buscas);
      buscas.close;
      buscas.SQL.Text := 'select cf.n_comando, cf.covend_v, ' +
        ' case when(coalesce(cf.tipo_venda_v, ''N'') = ''N'') then cf.cod_concess else cf.cod_cli_vende end clientes_v, ' +
        ' cf.modelo, cf.tipv_veiculo, cf.chassiv, cf.cod_estmoto, ' +
        ' coalesce(cf.tipo_venda_v, ''N'') tipo_venda_v, cf.cod_estmoto, cf.placav from com_fat cf' +
        ' where cf.n_comando = ' + IntToStr(FnumeroVenda) + ' and cf.cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.open;
      if buscas.FieldByName('covend_v').AsInteger = 0 then
        raise Exception.Create('Vendedor não encontrada para a venda de Veículo número ' + IntToStr(FnumeroVenda))
      else
        vCod_Vendedor := buscas.FieldByName('covend_v').AsInteger;
      vPlaca := '';
      vChassi := '';
      vCodEstMoto := 0;
      vNumComando := 0;
      vTipoVenda := '';
      vTipVeiculo := '';
      vModelo := '';

      if Trim(buscas.FieldByName('placav').AsString) <> '' then
        vPlaca := Trim(buscas.FieldByName('placav').AsString);
      if Trim(buscas.FieldByName('chassiv').AsString) <> '' then
        vChassi := Trim(buscas.FieldByName('chassiv').AsString);
      if buscas.FieldByName('cod_estmoto').AsInteger > 0 then
        vCodEstMoto := buscas.FieldByName('cod_estmoto').AsInteger;
      if Trim(buscas.FieldByName('tipo_venda_v').AsString) <> '' then
        vTipoVenda := Trim(buscas.FieldByName('tipo_venda_v').AsString);
      if Trim(buscas.FieldByName('tipv_veiculo').AsString) <> '' then
        vTipVeiculo := Trim(buscas.FieldByName('tipv_veiculo').AsString);
      if Trim(buscas.FieldByName('modelo').AsString) <> '' then
        vModelo := Trim(buscas.FieldByName('modelo').AsString);
      if buscas.FieldByName('clientes_v').AsInteger > 0 then
        vCodCliente := buscas.FieldByName('clientes_v').AsInteger;
      if buscas.FieldByName('n_comando').AsInteger > 0 then
        vNumComando := buscas.FieldByName('n_comando').AsInteger;

      if vDadosIni.vEmp.vCodServInterm = 0 then
        raise Exception.Create('Código de Serviço Padrão para Intermediação não encontrado nas configurações')
      else
        vCod_Servico := vDadosIni.vEmp.vCodServInterm;

      buscas.Close;
      buscas.SQL.Text := 'select desc_servico, codigo_nop from tipo_servico where cod_servico = ' + IntToStr(vCod_Servico);
      buscas.Open;

      if Trim(buscas.FieldByName('desc_servico').AsString) = '' then
        raise Exception.Create('Descrição de Serviço Padrão para Intermediação não informada ou não encontrada no cadastro' + IntToStr(FnumeroVenda))
      else
        vObsLivroRegistro := Trim(buscas.FieldByName('desc_servico').AsString);

      if buscas.FieldByName('codigo_nop').AsFloat <= 0 then
        raise Exception.Create('Natureza de Operação do Serviço Padrão para Intermediação não informada ou não encontrada no cadastro' + IntToStr(FnumeroVenda))
      else
        vCFOPServ := Trunc(buscas.FieldByName('codigo_nop').AsInteger);

      buscas.Close;
      buscas.SQL.Text := 'INSERT INTO PEDVENDA (NPED, COD_EMPRESA, COD_VENDEDOR, HORAABERTURA, MINABERTURA, TIPV,' +
        ' TIPOR, TIPO, OBS_PED, OBS_OS, TIPO_OS, COD_CLIENTE, COD_US_FECH, DATA_FECH, STATUS_PED, DATA_PED,' +
        ' HORAFECHAMENTO, MINFECHAMENTO, TOT_SERV, VALOR_TOTAL, NPREVENDA, OBS_LIVRO_REG, PLACA, SEQ_FECH, OBS_RED_OS, CHASSI, N_COMANDO)' +
        ' VALUES (:NPED, :COD_EMPRESA, :COD_VENDEDOR, :HORAABERTURA, :MINABERTURA, :TIPV,' +
        ' :TIPOR, :TIPO, :OBS_PED, :OBS_OS, :TIPO_OS, :COD_CLIENTE, :COD_US_FECH, :DATA_FECH, :STATUS_PED, :DATA_PED,' +
        ' :HORAFECHAMENTO, :MINFECHAMENTO, :TOT_SERV, :VALOR_TOTAL, :NPREVENDA, :OBS_LIVRO_REG, :PLACA, :SEQ_FECH, :OBS_RED_OS, :CHASSI, :N_COMANDO)';
      vNPed := Gencodigo('ORDEM_SERV', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
      vNPreVenda := Gencodigo('PREVENDA', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
      buscas.ParamByName('NPED').AsInteger := vNPed;
      buscas.ParamByName('SEQ_FECH').AsInteger := Gencodigo('SEQ_FECH', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
      buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
      buscas.ParamByName('COD_VENDEDOR').AsInteger := vCod_Vendedor;
      buscas.ParamByName('HORAABERTURA').AsString := copy(timetostr(time), 1, 2);
      buscas.ParamByName('MINABERTURA').AsString := copy(timetostr(time), 4, 2);
      buscas.ParamByName('TIPV').AsString := 'V';
      buscas.ParamByName('TIPOR').AsString := 'V';
      buscas.ParamByName('TIPO').AsString := 'OS';
      buscas.ParamByName('OBS_PED').AsString := COPY(vDadosIni.vEmp.vMensagem, 1, 130);
      buscas.ParamByName('OBS_OS').AsString := vDadosIni.vEmp.vObservOS + ' INTERMEDIAÇÃO COMANDO DE FATURAMENTO NUM ' + IntToStr(FnumeroVenda);
      buscas.ParamByName('TIPO_OS').AsString := 'OUTROS';
      buscas.ParamByName('COD_CLIENTE').AsInteger := vCodCliente;
      buscas.ParamByName('DATA_PED').AsDate := vDataNow;
      buscas.ParamByName('CHASSI').AsString := vChassi;
      if trim(vTipoVenda) = 'N' then
        buscas.ParamByName('PLACA').AsString := copy(vChassi, 10, 8)
      else
        buscas.ParamByName('PLACA').AsString := vPlaca;
      buscas.ParamByName('N_COMANDO').AsInteger := vNumComando;
      if vDadosIni.vEmp.vModoFaturamento = 'S' then
      begin
      	buscas.ParamByName('COD_US_FECH').AsInteger := vDadosIni.vCodUsuario;
        buscas.ParamByName('DATA_FECH').AsDate := vDataNow;
        buscas.ParamByName('STATUS_PED').AsString := 'FECHADA';
        buscas.ParamByName('HORAFECHAMENTO').AsString := copy(timetostr(vdataNow), 1, 2);
        buscas.ParamByName('MINFECHAMENTO').AsString := copy(timetostr(vdataNow), 4, 2);
      end;
      buscas.ParamByName('TOT_SERV').AsFloat := vPlano.vDadosPlano.mot_Valor_Interm;
      buscas.ParamByName('VALOR_TOTAL').AsFloat := vPlano.vDadosPlano.mot_Valor_Interm;
      buscas.ParamByName('NPREVENDA').AsInteger := vNPreVenda;
      buscas.ParamByName('OBS_LIVRO_REG').AsString := COPY(vObsLivroRegistro, 1, 32);
      buscas.ParamByName('OBS_RED_OS').AsString := COPY(vObsLivroRegistro, 1, 32);
      buscas.ExecSQL;

      buscas.close;
      buscas.SQL.Text := 'INSERT INTO PEDVENDA_SERV (COD_EMPRESA, NITEM, TIPO, NPED, COD_SERVICO, COD_VENDEDOR,' +
        ' CODIGO_NOP, QUANT_SERV_PED, VALOR_UN_SERV, VALOR_TOT_SERV, VLUN_ORIG, DESC_SERV_PED,' +
        ' COD_VENDEDOR1, N_COMANDO)' +
        ' VALUES (:COD_EMPRESA, :NITEM, :TIPO, :NPED, :COD_SERVICO, :COD_VENDEDOR,' +
        ' :CODIGO_NOP, :QUANT_SERV_PED, :VALOR_UN_SERV, :VALOR_TOT_SERV, :VLUN_ORIG, :DESC_SERV_PED,' +
        ' :COD_VENDEDOR1, :N_COMANDO);';
      buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
      buscas.ParamByName('NITEM').AsInteger := 1;
      buscas.ParamByName('TIPO').AsString := 'OS';
      buscas.ParamByName('NPED').AsInteger := vNPed;
      buscas.ParamByName('COD_SERVICO').AsInteger := vCod_Servico;
      buscas.ParamByName('COD_VENDEDOR').AsInteger := vCod_Vendedor;
      buscas.ParamByName('CODIGO_NOP').AsFloat := vCFOPServ;
      buscas.ParamByName('QUANT_SERV_PED').AsInteger := 1;
      buscas.ParamByName('VALOR_UN_SERV').AsFloat := vPlano.vDadosPlano.mot_Valor_Interm;
      buscas.ParamByName('VALOR_TOT_SERV').AsFloat := vPlano.vDadosPlano.mot_Valor_Interm;
      buscas.ParamByName('VLUN_ORIG').AsFloat := vPlano.vDadosPlano.mot_Valor_Interm;
      buscas.ParamByName('DESC_SERV_PED').AsString := vObsLivroRegistro;
      buscas.ParamByName('COD_VENDEDOR1').AsInteger := vCod_Vendedor;
      buscas.ParamByName('N_COMANDO').AsInteger := vNumComando;
      buscas.ExecSQL;
      vPlano.vDadosPlano.mot_NumPedVenda := vNPed;
      vPlano.vDadosPlano.mot_OS_Inter := True;
      Result := True;

      buscas.Close;
      buscas.SQL.Text := 'update est_moto set N_OS = ' + IntToStr(vNPed) +
        ' where chassi_c = ' + QuotedStr(trim(vChassi)) +
        ' and codigo = ' + IntToStr(vCodEstMoto) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := 'update plano_pag set N_OS_RETORNO = ' + IntToStr(vPlano.vDadosPlano.mot_NumPedVenda) +
        ' where nrequisicao = ' + IntToStr(FnumeroVenda) +
        ' and tpdocs = ' + QuotedStr(FtipoVenda) +
        ' and nome_ctrl = ''INTERMEDIACAO''' +
        ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
      buscas.ExecSQL;
      if (vDadosIni.vEmp.vVersaoVeiculos = '4') then
      begin
        vDadosIni.vHistV.vChassi := vChassi;
        vDadosIni.vHistV.vCodigo := vCodEstMoto;
        vDadosIni.vHistV.vNatureza := 'S';
        vDadosIni.vHistV.vNumDoc := vNPed;
        vDadosIni.vHistV.vPlaca := vPlaca;
        vDadosIni.vHistV.vTipo := 'OS';
        vDadosIni.vHistV.vModelo := vModelo;
        vDadosIni.vHistV.vValorOP := vPlano.vDadosPlano.mot_Valor_Interm;
        vDadosIni.vHistV.vData := DateToStr(vDataNow);
        vDadosIni.vHistV.vNatOP := vCFOPServ;
        vDadosIni.vHistV.vTipoVenda := vTipoVenda;
        vDadosIni.vHistV.vCodCliente := vCodCliente;
        vDadosIni.vHistV.vCodVendedor := vCod_Vendedor;
        vDadosIni.vHistV.vTipvVeiculo := vTipVeiculo;
        vDadosIni.vHistV.vStatusDemonst := 'N';
        vDadosIni.vHistV.vStatusEstoque := 'N';
        vDadosIni.vHistV.vStatusRes := 'N';
        vDadosIni.vHistV.vStatusTransD := 'N';
        vDadosIni.vHistV.vStatusUso := vTipoVenda;
        vDadosIni.vHistV.vAlteraEstoqueCFOP := 'N';
        vDadosIni.vHistV.vPosicao := 'MORTO';
        if vDadosIni.vEmp.vModoFaturamento = 'S' then
          vDadosIni.vHistV.vStatusV := 'FECHADA'
        else
          vDadosIni.vHistV.vStatusV := 'ABERTA';
        vDadosIni.GravarHistEstMoto(buscas, dtmFP.SpIncCodigo, vDadosIni.vHistV);
      end;

      if vDadosIni.vEmp.vModoFaturamento = 'S' then
        Application.MessageBox(PChar('A Ordem de serviço número ' + IntToStr(vNPed) +
          ' agora está fechada para que se proceda com seu RECEBIMENTO.'), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)
      else
        Application.MessageBox(PChar('A Ordem de serviço número ' + IntToStr(vNPed) +
          ' agora está aberta para que se proceda com seu FECHAMENTO.'), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      Result := True;
    except
      on e: exception do
      begin
        Result := False;
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
      end;
    end;
  end
  else
    Result := True;
end;

function TFormPag2.montarOSLancamentoRetorno: Boolean;
var
  vNPed, vNPreVenda, vCod_Vendedor, vCodCliente, vCod_Servico: Integer;
  vDataNow: TDate;
  vObsLivroRegistro, vPlaca: string;
  vOK: Boolean;
  vNumOs, vCFOPServ: Integer;
begin
  if vPlano.vDadosPlano.mot_Valor_retorno > 0 then
  begin
    try
      if vPlano.vDadosPlano.mot_OS_montada then
      begin
        Result := True;
        exit;
      end;
      buscas.close;
      buscas.SQL.Text := 'select N_OS_RETORNO from plano_pag' +
        ' where nrequisicao = ' + IntToStr(FnumeroVenda) +
        ' and tpdocs = ' + QuotedStr(FtipoVenda) +
        ' and nome_ctrl = ''RETORNO''' +
        ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
      buscas.Open;
      vNumOs := buscas.fieldbyname('N_OS_RETORNO').AsInteger;
      if vNumOs > 0 then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select nped, valor_total from pedvenda where nped = ' + IntToStr(vNumOs) +
          ' and tipo = ''OS'' and cod_empresa = ' + vDadosIni.codEmpresa +
          ' and ((status_ped is null) or (status_ped = ''''))';
        buscas.Open;
        if ((buscas.FieldByName('nped').AsInteger = vNumOs) and
          (vDadosIni.StrToFloatFormat(buscas.FieldByName('valor_total').AsFloat, 2) <>
          vDadosIni.StrToFloatFormat(vPlano.vDadosPlano.mot_Valor_retorno, 2))) or
          (buscas.FieldByName('nped').AsInteger = 0) then
        begin
          buscas.Close;
          buscas.SQL.Text := 'update pedvenda set valor_total = :valor_total,' +
            ' TOT_SERV = :valor_total' +
            ' where nped = ' + IntToStr(vNumOs) +
            ' and tipo = ''OS'' and cod_empresa = ' + vDadosIni.codEmpresa;
          buscas.ParamByName('valor_total').AsCurrency :=
            vDadosIni.StrToFloatFormat(vPlano.vDadosPlano.mot_Valor_retorno, 2);
          buscas.ExecSQL;

          buscas.Close;
          buscas.SQL.Text := 'update pedvenda_serv set VALOR_UN_SERV = :valor_total,' +
            ' VALOR_TOT_SERV = :valor_total, VLUN_ORIG = :valor_total' +
            ' where nped = ' + IntToStr(vNumOs) +
            ' and tipo = ''OS'' and cod_empresa = ' + vDadosIni.codEmpresa;
          buscas.ParamByName('valor_total').AsCurrency :=
            vDadosIni.StrToFloatFormat(vPlano.vDadosPlano.mot_Valor_retorno, 2);
          buscas.ExecSQL;

          vPlano.vDadosPlano.mot_OS_montada := True;
          vPlano.vDadosPlano.mot_NumPedVenda := vNumOs;

          Result := True;
          exit;

        end
        else if (buscas.FieldByName('nped').AsInteger = vNumOs) then
        begin
          Result := True;
          exit;
        end;

      end;
      vDataNow := vDadosIni.getDataBanco(buscas);
      buscas.close;
      buscas.SQL.Text := 'select cf.covend_v, mv.placav from com_fat cf' +
        ' left join mot_ven mv on mv.n_comando = cf.n_comando and mv.chassiv = cf.chassiv and' +
        ' mv.cod_empresa = cf.cod_empresa where cf.n_comando = ' + IntToStr(FnumeroVenda) +
        ' and cf.cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.open;
      if buscas.FieldByName('covend_v').AsInteger = 0 then
        raise Exception.Create('Vendedor não encontrada para a venda de Veículo número ' + IntToStr(FnumeroVenda))
      else
        vCod_Vendedor := buscas.FieldByName('covend_v').AsInteger;
      vPlaca := '';

      if Trim(buscas.FieldByName('placav').AsString) <> '' then
        vPlaca := Trim(buscas.FieldByName('placav').AsString);
      while True do
      begin
        vOK := Application.MessageBox(pchar('Existe Retorno de Banco. Por favor selecione o Cliente (Banco) para continuar com o Processo.'), 'Atenção', 0 + MB_OKCANCEL) = IDOK;
        if not vOK then
        begin
          result := False;
          Exit;
        end;
        vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
        if Trim(vDadosIni.vPesquisa) <> '' then
        begin
          vCodCliente := StrToInt(Trim(vDadosIni.vPesquisa));
          Break;
        end;
      end;

      buscas.close;
      buscas.SQL.Text := 'select COD_SERV_PAD_RETORNO, PLACA_PAD_RETORNO from empresa where cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if buscas.FieldByName('COD_SERV_PAD_RETORNO').AsInteger = 0 then
        raise Exception.Create('Código de Serviço Padrão para retorno não encontrado nas configurações')
      else
        vCod_Servico := buscas.FieldByName('COD_SERV_PAD_RETORNO').AsInteger;

      if vPlaca = '' then
      begin
        if Trim(buscas.FieldByName('PLACA_PAD_RETORNO').AsString) = '' then
          raise Exception.Create('Placa padrão não encontrada nas configurações')
        else
          vPlaca := buscas.FieldByName('PLACA_PAD_RETORNO').AsString;
      end;

      buscas.Close;
      buscas.SQL.Text := 'select desc_servico, codigo_nop from tipo_servico where cod_servico = ' + IntToStr(vCod_Servico);
      buscas.Open;

      if Trim(buscas.FieldByName('desc_servico').AsString) = '' then
        raise Exception.Create('Descrição de Serviço Padrão para retorno não informada ou não encontrada no cadastro' + IntToStr(FnumeroVenda))
      else
        vObsLivroRegistro := Trim(buscas.FieldByName('desc_servico').AsString);

      if buscas.FieldByName('codigo_nop').AsFloat <= 0 then
        raise Exception.Create('Natureza de Operação do Serviço Padrão para retorno não informada ou não encontrada no cadastro' + IntToStr(FnumeroVenda))
      else
        vCFOPServ := Trunc(buscas.FieldByName('codigo_nop').AsInteger);

      buscas.Close;
      buscas.SQL.Text := 'INSERT INTO PEDVENDA (NPED, COD_EMPRESA, COD_VENDEDOR, HORAABERTURA, MINABERTURA, TIPV,' +
        ' TIPOR, TIPO, OBS_PED, OBS_OS, TIPO_OS, COD_CLIENTE, COD_US_FECH, DATA_FECH, STATUS_PED, DATA_PED,' +
        ' HORAFECHAMENTO, MINFECHAMENTO, TOT_SERV, VALOR_TOTAL, NPREVENDA, OBS_LIVRO_REG, PLACA, SEQ_FECH, OBS_RED_OS)' +
        ' VALUES (:NPED, :COD_EMPRESA, :COD_VENDEDOR, :HORAABERTURA, :MINABERTURA, :TIPV,' +
        ' :TIPOR, :TIPO, :OBS_PED, :OBS_OS, :TIPO_OS, :COD_CLIENTE, :COD_US_FECH, :DATA_FECH, :STATUS_PED, :DATA_PED,' +
        ' :HORAFECHAMENTO, :MINFECHAMENTO, :TOT_SERV, :VALOR_TOTAL, :NPREVENDA, :OBS_LIVRO_REG, :PLACA, :SEQ_FECH, :OBS_RED_OS)';
      vNPed := Gencodigo('ORDEM_SERV', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
      vNPreVenda := Gencodigo('PREVENDA', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
      buscas.ParamByName('NPED').AsInteger := vNPed;
      buscas.ParamByName('SEQ_FECH').AsInteger := Gencodigo('SEQ_FECH', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
      buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
      buscas.ParamByName('COD_VENDEDOR').AsInteger := vCod_Vendedor;
      buscas.ParamByName('HORAABERTURA').AsString := copy(timetostr(time), 1, 2);
      buscas.ParamByName('MINABERTURA').AsString := copy(timetostr(time), 4, 2);
      buscas.ParamByName('TIPV').AsString := 'V';
      buscas.ParamByName('TIPOR').AsString := 'V';
      buscas.ParamByName('TIPO').AsString := 'OS';
      buscas.ParamByName('OBS_PED').AsString := COPY(vDadosIni.vEmp.vMensagem, 1, 130);
      buscas.ParamByName('OBS_OS').AsString := vDadosIni.vEmp.vObservOS + ' RETORNO COMANDO DE FATURAMENTO NUM ' + IntToStr(FnumeroVenda);
      buscas.ParamByName('TIPO_OS').AsString := 'OUTROS';
      buscas.ParamByName('COD_CLIENTE').AsInteger := vCodCliente;
      buscas.ParamByName('DATA_PED').AsDate := vDataNow;
      if vDadosIni.vEmp.vModoFaturamento = 'S' then
      begin
      	buscas.ParamByName('COD_US_FECH').AsInteger := vDadosIni.vCodUsuario;
        buscas.ParamByName('DATA_FECH').AsDate := vDataNow;
        buscas.ParamByName('STATUS_PED').AsString := 'FECHADA';
        buscas.ParamByName('HORAFECHAMENTO').AsString := copy(timetostr(vdataNow), 1, 2);
        buscas.ParamByName('MINFECHAMENTO').AsString := copy(timetostr(vdataNow), 4, 2);
      end;
      buscas.ParamByName('TOT_SERV').AsFloat := vPlano.vDadosPlano.mot_Valor_retorno;
      buscas.ParamByName('VALOR_TOTAL').AsFloat := vPlano.vDadosPlano.mot_Valor_retorno;
      buscas.ParamByName('NPREVENDA').AsInteger := vNPreVenda;
      buscas.ParamByName('OBS_LIVRO_REG').AsString := COPY(vObsLivroRegistro, 1, 32);
      buscas.ParamByName('OBS_RED_OS').AsString := COPY(vObsLivroRegistro, 1, 32);
      buscas.ParamByName('PLACA').AsString := vPlaca;
      buscas.ExecSQL;

      buscas.close;
      buscas.SQL.Text := 'INSERT INTO PEDVENDA_SERV (COD_EMPRESA, NITEM, TIPO, NPED, COD_SERVICO, COD_VENDEDOR,' +
        ' CODIGO_NOP, QUANT_SERV_PED, VALOR_UN_SERV, VALOR_TOT_SERV, VLUN_ORIG, DESC_SERV_PED,' +
        ' COD_VENDEDOR1)' +
        ' VALUES (:COD_EMPRESA, :NITEM, :TIPO, :NPED, :COD_SERVICO, :COD_VENDEDOR,' +
        ' :CODIGO_NOP, :QUANT_SERV_PED, :VALOR_UN_SERV, :VALOR_TOT_SERV, :VLUN_ORIG, :DESC_SERV_PED,' +
        ' :COD_VENDEDOR1);';
      buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
      buscas.ParamByName('NITEM').AsInteger := 1;
      buscas.ParamByName('TIPO').AsString := 'OS';
      buscas.ParamByName('NPED').AsInteger := vNPed;
      buscas.ParamByName('COD_SERVICO').AsInteger := vCod_Servico;
      buscas.ParamByName('COD_VENDEDOR').AsInteger := vCod_Vendedor;
      buscas.ParamByName('CODIGO_NOP').AsFloat := vCFOPServ;
      buscas.ParamByName('QUANT_SERV_PED').AsInteger := 1;
      buscas.ParamByName('VALOR_UN_SERV').AsFloat := vPlano.vDadosPlano.mot_Valor_retorno;
      buscas.ParamByName('VALOR_TOT_SERV').AsFloat := vPlano.vDadosPlano.mot_Valor_retorno;
      buscas.ParamByName('VLUN_ORIG').AsFloat := vPlano.vDadosPlano.mot_Valor_retorno;
      buscas.ParamByName('DESC_SERV_PED').AsString := vObsLivroRegistro;
      buscas.ParamByName('COD_VENDEDOR1').AsInteger := vCod_Vendedor;
      buscas.ExecSQL;
      vPlano.vDadosPlano.mot_NumPedVenda := vNPed;
      vPlano.vDadosPlano.mot_OS_montada := True;
      Result := True;
      buscas.Close;
      buscas.SQL.Text := 'update plano_pag set N_OS_RETORNO = ' + IntToStr(vPlano.vDadosPlano.mot_NumPedVenda) +
        ' where nrequisicao = ' + IntToStr(FnumeroVenda) +
        ' and tpdocs = ' + QuotedStr(FtipoVenda) +
        ' and nome_ctrl = ''RETORNO''' +
        ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
      buscas.ExecSQL;

      if vDadosIni.vEmp.vModoFaturamento = 'S' then
        Application.MessageBox(PChar('A Ordem de serviço número ' + IntToStr(vNPed) +
          ' agora está fechada para que se proceda com seu RECEBIMENTO.'), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)
      else
        Application.MessageBox(PChar('A Ordem de serviço número ' + IntToStr(vNPed) +
          ' agora está aberta para que se proceda com seu FECHAMENTO.'), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      Result := True;
    except
      on e: exception do
      begin
        Result := False;
        Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
      end;
    end;
  end
  else
    Result := True;
end;

function TFormPag2.montarParcelamento(pECommerce: boolean = false): boolean;
const
  numeros = ['0'..'9'];
var
  temp: string;
  diaVenc, i, j, k, incDias: integer;
  dias: array of integer;
  dataTemp: TDate;
  condicaoPagamento: string;
  vCountParcBol: Integer;
  vNCupom: Integer;
  MontarPacelamentoStr: TMontarPacelamentoStr;
  ACodigoCondPag: Integer;
  ADescrCondPag: string;
  ANumDocParcelas: string;
  AParcelas: TStrings;
  vDataBase: TDate;
begin
  try
    try
        if pECommerce then
        begin
          vDataBase := fDataBase;
          fDataBase := vEcommerce.dataSet.FieldByName('data_cad').AsDateTime;
        end;

        atribuirDadosDoFormularioParaAtributos;

        //----- novo parcelamento da condicao de pagamento

        Result := False;

        if FcreditoQtdeParcelas > 0 then
        begin
          ACodigoCondPag := 0;
          ADescrCondPag := IntToStr(FcreditoQtdeParcelas) + 'X';
        end
        else
        begin
          ACodigoCondPag := lkCondPag.dataSet.FieldByName('cod_cond_pag').AsInteger;
          ADescrCondPag := lkCondPag.dataSet.FieldByName('desc_cond_pag').AsString;
        end;

        if FNum_Nf > 0 then
          ANumDocParcelas:= IntToStr(FNum_Nf)
        else if Fnfce_num_nf > 0 then
          ANumDocParcelas := IntToStr(Fnfce_num_nf)
        else if FNumFatura > 0 then
          ANumDocParcelas := IntToStr(FNumFatura)
        else
          ANumDocParcelas:= IntToStr(FnumeroVenda);

        if vDadosIni.getConfSisBool('paf_ecf_form_pag_num_doc_cupom', buscas) then
        begin
          buscas.Close;
          buscas.SQL.Text := ' select ncupom from pedvenda' +
            ' where nped = :nped and tipo = :tipo and cod_empresa = :cod_empresa ';
          buscas.ParamByName('nped').AsInteger := FnumeroVenda;
          buscas.ParamByName('tipo').AsString := FtipoVenda;
          buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.Open;

          if buscas.FieldByName('ncupom').AsInteger > 0 then
            ANumDocParcelas := IntToStr(buscas.FieldByName('ncupom').AsInteger);
        end;

        if vDadosIni.vCadBasicos.AHandle = 0 then
          CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);

        if vDadosIni.vCadBasicos.AHandle = 0 then
        begin
          Application.MessageBox('Pacote de Cadastros básicos não carregado', 'Anteção', 0 + 64);
          Exit;
        end;

        @MontarPacelamentoStr := GetProcAddress(vDadosIni.vCadBasicos.AHandle, PChar('MontarPacelamentoStr'));
        if Assigned(MontarPacelamentoStr) then
        begin
          AParcelas := TStringList.Create;
          try
            AParcelas.Text := MontarPacelamentoStr(
            	ACodigoCondPag,
              ADescrCondPag,
              IfThen((FnumeroVendaEcommerce > 0) and (FcreditoValorCreditoLiq > 0) and (vDadosIni.vEcommerce.vLancarTaxaIntermPag <> 'DINHEIRO'),
              	FcreditoValorCreditoLiq, FcreditoValorCredito),
              ANumDocParcelas,
              '',
              '',
              '',
              '',
              FcodigoCliente,
              FcreditoJurosUtil,
              fDataBase,
              vControle.dataSet.FieldByName('codigo_ctrl').AsInteger,
              False);

            vQtde := AParcelas.Count;
            SetLength(vDocumento, AParcelas.Count);
            SetLength(vData     , AParcelas.Count);
            SetLength(vValor    , AParcelas.Count);
            SetLength(vValorliq , AParcelas.Count);

            for I := 0 to AParcelas.Count - 1 do
            begin
              vDocumento[I] := vDadosIni.getValue(AParcelas[I], 1);
              vData[I]      := vDadosIni.getValue(AParcelas[I], 2);

              if (FnumeroVendaEcommerce > 0) and (FcreditoValorCreditoLiq > 0) and (vDadosIni.vEcommerce.vLancarTaxaIntermPag <> 'DINHEIRO') then
              begin
              	vValorLiq[I]  := StrToFloat(vDadosIni.getValue(AParcelas[I], 3));
                vValor[I]     := 0;
              end
              else
              begin
              	vValor[I]     := StrToFloat(vDadosIni.getValue(AParcelas[I], 3));
                vValorLiq[I]  := 0;
              end;
            end;

            if (FnumeroVendaEcommerce > 0) and (FcreditoValorCreditoLiq > 0) and (vDadosIni.vEcommerce.vLancarTaxaIntermPag <> 'DINHEIRO') then
            begin
            	AParcelas.Text := MontarPacelamentoStr(
                ACodigoCondPag,
                ADescrCondPag,
                FcreditoValorCredito,
                ANumDocParcelas,
                '',
                '',
                '',
                '',
                FcodigoCliente,
                FcreditoJurosUtil,
                fDataBase,
                vControle.dataSet.FieldByName('codigo_ctrl').AsInteger,
                False);

            	for I := 0 to AParcelas.Count - 1 do
              begin
                vValor[I]  := StrToFloat(vDadosIni.getValue(AParcelas[I], 3));
              end;
            end;

            if High(vData) > -1 then
            begin
              vCountParcBol := getCountParcelasBoleto;
              FMaxDataParcela := StrToDateDef(vData[High(vData)], 0);

              if not _validaPoliticasDescontos(FcreditoValorCredito,vQtde) then
                Exit;

              if vCountParcBol > 0 then
                for I := Low(vDocumento) to High(vDocumento)  do
                  vDocumento[I] := vDadosIni.StrZero(ANumDocParcelas, 6) + '-' + IntToStr(vCountParcBol + I + 1);

              frmFormPag2.ListBox1.Clear;
              for I := 0 to vQtde - 1 do
                frmFormPag2.ListBox1.Items.Add(vDocumento[I] + '    ' + vData[I] + '           ' +
                  Format('%m', [vValor[I]]));

              Result := True;
            end;

          finally
            FreeAndNil(AParcelas);
          end;
        end
        else
        begin
          Application.MessageBox('Não foi possível efetuar o parcelamento', 'Anteção', 0 + 64);
          Exit;
        end;

        //--
        Exit;

        condicaoPagamento := '';
        limpaParcelamento;
        SetLength(dias, 0);
        SetLength(dias, 99);

        if Pos('X', UpperCase(FcreditoCondicaoPagamento)) > 0 then
        begin
          try
            J := StrToInt(Trim(copy(FcreditoCondicaoPagamento, 1, Pos('X', UpperCase(FcreditoCondicaoPagamento)) - 1)));
            FcreditoQtdeParcelas := J;
          except
          end;
        end;

        if FcreditoQtdeParcelas > 0 then
          FcreditoCondicaoPagamento := 'NENHUMA';

        if UpperCase(trim(FcreditoCondicaoPagamento)) = 'A VISTA' then
        begin
          result := false;
          Application.MessageBox('Condição A Vista!', 'Informação', MB_OK + MB_ICONINFORMATION);
          exit;
        end;

        if FcreditoQtdeParcelas > 0 then
        begin
          condicaoPagamento := IntToStr(FcreditoQtdeParcelas) + 'X';
          temp := '';
          if (Trim(vControle.dataSet.FieldByName('DIA_BASE_PARCELAMENTO').AsString) = 'D5') then // quando for D5 serao 30 dias corridos
            temp := IntToStr(DayOf(vDadosIni.getDataBanco(buscas)+30))//D+30
          else if (Trim(vControle.dataSet.FieldByName('DIA_BASE_PARCELAMENTO').AsString) = 'D6') then // quando for D6 serao 30 dias corridos
            temp := IntToStr(DayOf(vDadosIni.getDataBanco(buscas)))//D+0
          else if (vDadosIni.strEstaContidoEm(Trim(vControle.dataSet.FieldByName('DIA_BASE_PARCELAMENTO').AsString),
            ['D1', 'D2', 'D3', 'D4'] )) then // Valores validos contidos no cadastro do controle
          begin
            if (vDadosIni.strEstaContidoEm(Trim(vControle.dataSet.FieldByName('DIA_BASE_PARCELAMENTO').AsString), ['D1', 'D2'] )) then
            begin  // D1 ou D2 usa o dia de vencimento no cadastro do cliente
              temp := retornaValor('select dia_venc as valor from clientes where cod_cliente  = ' +
                IntToStr(codigoCliente) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
              if (StrToIntDef(temp, 0) = 0) then  // caso o cadastro do cliente nao tenha o dia de vencimento
                if Trim(vControle.dataSet.FieldByName('DIA_BASE_PARCELAMENTO').AsString) = 'D1' then  // D1 quando o cliente nao tem o dia usa automaticamente o dia atual
                  temp := IntToStr(DayOf(vDadosIni.getDataBanco(buscas)))
                else if not InputQuery('Todo Dia', 'Dia de Vencimento:', temp) then // no caso sobra o D2 quando o cliente nao tem o dia no cadastro pede ao usuário para digitar o dia de vencimento
                begin
                  result := false;
                  exit;
                end
                else if (StrToIntDef(temp, 0) = 0) then  // caso o dia digitado seja inválido
                begin
                  result := false;
                  exit;
                end;
            end
            else if Trim(vControle.dataSet.FieldByName('DIA_BASE_PARCELAMENTO').AsString) = 'D3' then  // D3 quando o sistema atribui automaticamente o dia atual
              temp := IntToStr(DayOf(vDadosIni.getDataBanco(buscas)))
            else if not InputQuery('Todo Dia', 'Dia de Vencimento:', temp) then // no caso sobra o D4 quando o usuário deve digitar o dia de vencimento
            begin
              result := false;
              exit;
            end
            else if (StrToIntDef(temp, 0) = 0) then  // caso o dia digitado seja inválido
            begin
              result := false;
              exit;
            end;
          end
          else
          begin
            //      if vDadosIni.vSistema = 'Fiscal' then
            //        buscas := TIBQuery(dtmFP.qrBuscasHwF);
            temp := retornaValor('select dia_venc as valor from clientes where cod_cliente  = ' +
              IntToStr(codigoCliente) + ' and cod_empresa = ' + vDadosIni.codEmpresa);
            if (temp = '') or (temp = '0') then
            begin
              if vDadosIni.vParcelamentoDiaBase <> 'S' then
                temp := IntToStr(DayOf(date))
              else
                if not InputQuery('Todo Dia', 'Dia de Vencimento:', temp) then
                begin
                  result := false;
                  exit;
                end;
            end;
          end;
          diaVenc := StrToInt(temp);
          //for I := 1 to parcelas do
          //  dias[I] := IntToStr(I * 30);
          vQtde := FcreditoQtdeParcelas;
        end
        else if UpperCase(trim(FcreditoCondicaoPagamento)) = 'NENHUMA' then
        begin
          result := false;
          Application.MessageBox('Nenhuma condição de pagamento informada!', 'Informação', MB_OK + MB_ICONINFORMATION);
          exit;
        end
        else if trim(FcreditoCondicaoPagamento) <> '' then
        begin
          incDias := 0;
          temp := '';
          i := 0;
          k := Length(FcreditoCondicaoPagamento);
          while i <> k do
          begin
            temp := '';
            inc(i);
            for j := i to k do
            begin
              if FcreditoCondicaoPagamento[j] in numeros then
                temp := temp + FcreditoCondicaoPagamento[j]
              else
                break;
            end; //fim for j
            i := j;

            try
              if temp <> '' then
              begin
                if StrToInt(temp) > 0 then
                begin
                  dias[incDias] := StrToInt(temp);
                  Inc(incDias);
                end;
              end;
            except
            end;
            if (i - 1) = k then
              Break;
          end; //fim for i
          vQtde := incDias;
        end; //fim else

        if (FcreditoValorCredito / vQtde) < 0.01 then
        begin
          Application.MessageBox('Parcela gerada menor que 0,01 com o valor informado e a quantidade de parcelas!', 'Atenção', 0 + 64);
          Result := False;
          Exit;
        end;      
        SetLength(vDocumento, vQtde);
        SetLength(vData, vQtde);
        SetLength(vValor, vQtde);
        SetLength(vValorLiq, vQtde);
        ArredondaParcela(FcreditoValorCredito, vQtde);

        vCountParcBol := getCountParcelasBoleto;

        vNCupom := 0;

        if vDadosIni.getConfSisBool('paf_ecf_form_pag_num_doc_cupom', buscas) then
        begin
          buscas.Close;
          buscas.SQL.Text := ' select ncupom from pedvenda' +
            ' where nped = :nped and tipo = :tipo and cod_empresa = :cod_empresa ';
          buscas.ParamByName('nped').AsInteger := FnumeroVenda;
          buscas.ParamByName('tipo').AsString := FtipoVenda;
          buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.Open;

          vNCupom := buscas.FieldByName('ncupom').AsInteger;
        end;

        for i := 0 to vQtde - 1 do
          vDocumento[I] := vDadosIni.StrZero(
            Integer(vDadosIni.retornoPorCondicao(vNCupom > 0, vNCupom, vDadosIni.retornoPorCondicao(FNum_Nf > 0, FNum_Nf, FnumeroVenda))), 6) + '-' + IntToStr(vCountParcBol + I + 1);
        if FcreditoJurosUtil > 0 then
        begin
          vJuros.selecionaJuros(vQtde, FcreditoJurosUtil);
          if not vJuros.dataSet.IsEmpty then
            for i := 0 to vQtde - 1 do
              vValor[I] := (FcreditoValorCredito *
                StrToFloat(vJuros.DataSet.FieldByName('COEF_J').AsString));
          vJuros.Close;
        end;
        dataTemp := vDadosIni.getDataBanco(buscas);
        FMaxDataParcela:=dataTemp;
        if FcreditoQtdeParcelas > 0 then
        begin
          for i := 0 to vQtde - 1 do
          begin
            if (Trim(vControle.dataSet.FieldByName('DIA_BASE_PARCELAMENTO').AsString) = 'D5') then
              vData[i] := DateToStr(dataTemp + ((i+1) * 30))//D+30
            else if (Trim(vControle.dataSet.FieldByName('DIA_BASE_PARCELAMENTO').AsString) = 'D6') then
              vData[i] := DateToStr(dataTemp + (i * 30))//D+0
            else if (vDadosIni.strEstaContidoEm(Trim(vControle.dataSet.FieldByName('DIA_BASE_PARCELAMENTO').AsString),
              ['D1', 'D2', 'D3', 'D4'] )) then // Valores validos contidos no cadastro do controle
            begin
              if IsValidDate(YearOf(IncMonth(dataTemp, I + 1)), MonthOf(IncMonth(dataTemp, I + 1)), diaVenc) then
                vData[i] := DateToStr(StartOfTheMonth(IncMonth(dataTemp, I + 1)) + diaVenc - 1)
              else
                vData[i] := DateToStr(EndOfTheMonth(IncMonth(dataTemp, I + 1)));
              IncMonth(dataTemp, 1);
            end
            else if vDadosIni.vParcelamentoDiaBase = 'S' then
            begin
              if IsValidDate(YearOf(IncMonth(dataTemp, I + 1)), MonthOf(IncMonth(dataTemp, I + 1)), diaVenc) then
                vData[i] := DateToStr(StartOfTheMonth(IncMonth(dataTemp, I + 1)) + diaVenc - 1)
              else
                vData[i] := DateToStr(EndOfTheMonth(IncMonth(dataTemp, I + 1)));
              IncMonth(dataTemp, 1);
            end
            else
              vData[i] := DateToStr(dataTemp + (i * 30));
            if StrToDate(vData[i])> FMaxDataParcela then
              FMaxDataParcela := StrToDate(vData[i]);

    //        dataTemp := IncMonth(date, i + 1);
    //        if vDadosIni.vParcelamentoDiaBase <> 'S' then
    //        begin
    //          vData[i] := DateToStr(dataTemp);
    //        end
    //        else if IsValidDate(YearOf(dataTemp), MonthOf(dataTemp), diaVenc) then
    //          vData[i] := DateToStr(StartOfTheMonth(dataTemp) + diaVenc - 1)
    //        else
    //          vData[i] := DateToStr(EndOfTheMonth(dataTemp));
          end;
        end
        else
        begin
          for i := 0 to vQtde - 1 do
          begin
            vData[i] := DateToStr(dataTemp + dias[i]);
            if StrToDate(vData[i])> FMaxDataParcela then
              FMaxDataParcela := StrToDate(vData[i]);
          end;
        end;

        if not _validaPoliticasDescontos(FcreditoValorCredito,vQtde) then
        begin
          Result := False;
          Exit;
        end;

        frmFormPag2.ListBox1.Clear;
        for I := 0 to vQtde - 1 do
          frmFormPag2.ListBox1.Items.Add(vDocumento[I] + '    ' + vData[I] + '           ' +
            Format('%m',
            [vValor[I]]));
        result := true;
    finally
        if pECommerce then
          fDataBase := vDataBase;
    end;
  except
    on e: exception do
    begin
      result := false;
      Application.MessageBox(pchar('EFPG0019 Erro ao gerar parcelas. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('EFPG0019 ' + e.Message);
    end;
  end;
end;

function TFormPag2.PlanoValeProgFid: boolean;
begin
  try
    Result := False;

    if not vDadosIni.vCashback.vHabilitarCashback then
    begin
      Result := True;
      Exit;
    end;

    if vDadosIni.vCashback.vCodControle <= 0 then
    begin
      Result := True;
      Exit;
    end;

    buscas.Close;
    buscas.SQL.Text := ' select controles.codigo_ctrl, controles.codigo_emp from controles ' +
    	' where controles.codigo_ctrl = :codigo_ctrl ' +
      ' and controles.codigo_emp = :codigo_emp ' +
      ' and controles.ativo = 1 ';
    buscas.ParamByName('codigo_ctrl').AsInteger := vDadosIni.vCashback.vCodControle;
    buscas.ParamByName('codigo_emp').AsInteger := vDadosIni.cod_empresa;
    buscas.Open;

    if buscas.IsEmpty then
      Exit;

    vValeCupomPrgFid.dataSet.Filtered := False;
    vValeCupomPrgFid._abreValeCupomPrgFid(FnumeroVenda, FtipoVenda);

    if vValeCupomPrgFid.dataSet.RecordCount > 0 then
    begin
      vControle.dataSet.Locate('CODIGO_CTRL', vDadosIni.vCashback.vCodControle, []);

      if vDadosIni.vCashback.vCodControle <> vControle.dataSet.FieldByName('CODIGO_CTRL').AsInteger then
        Exit;

      vValeCupomPrgFid.dataSet.First;
      while not vValeCupomPrgFid.dataSet.Eof do
      begin
        vValeCupomPrgFid.dataSet.Edit;
        vValeCupomPrgFid.dataSet.FieldByName('SEL').AsString := 'S';
        vValeCupomPrgFid.dataSet.Post;

        vValeCupomPrgFid.dataSet.Next;
      end;

      if vValeCupomPrgFid.dataSet.ChangeCount > 0 then
        if not vValeCupomPrgFid.Apply then
          CancelUpdates;

      if not utilizarValePrgFid(orValeCashback) then
        Exit;
    end;

    Result := True;
  except
    on e: exception do
    begin
      result := false;
      Application.MessageBox(pchar('EFPG0015 Erro ao montar plano cashback. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('EFPG0015 ' + e.Message);
    end;
  end;
end;

function TFormPag2.receberEmCarteira(pFormasEC: boolean = false): boolean;
var
  vrTemp: Currency;
begin
  try
    fSecao := fSecao + 1;
    if alteracao then
      dataSet.edit;
    if (DataSet.State <> dsEdit) and (not FRef_Frete) then
      if existeRecebimentoDinheiro then
      begin
        FcarteiraValorDinheiro := DataSet.FieldByName('valordoc').AsFloat + FcarteiraValorDinheiro;
        dataSet.Edit;
      end;

    if FcarteiraValorDinheiro <= 0 then
      raise exception.Create('O valor deve ser maior que zero');
    if trim(FcarteiraHistorico) = '' then
      raise exception.create('O Lançamento deve ter um histórico');

    if not (DataSet.state in [dsInsert, dsEdit]) then
      Insert;

    if DataSet.state in [dsBrowse] then
    begin
      Result := false;
      exit;
    end;

    if pFormasEC then
      if (not vEcommerce.dataSet.IsEmpty) and (FnumeroVendaEcommerce > 0) then
      begin
        DataSet.FieldByName('metodo_pag_id').AsInteger :=
         vEcommerce.dataSet.FieldByName('metodo_pag_id').AsInteger;
        DataSet.FieldByName('local_venda').AsString :=
         vEcommerce.dataSet.FieldByName('local_venda').AsString;
        DataSet.FieldByName('intermediador').AsString :=
         vEcommerce.dataSet.FieldByName('intermediador').AsString;
      end;

    if vDadosIni.vProgFid.vHabilitarProgFid then
    begin
      if vDadosIni.vProgFid.vCodControle > 0 then
        if vControle.DataSet.FieldByName('codigo_ctrl').AsInteger = vDadosIni.vProgFid.vCodControle then
        begin
          DataSet.FieldByName('prg_fid').AsString := 'S';
          DataSet.FieldByName('PERMITIR_EXCLUIR').AsString := 'F';
        end;
    end
    else if vDadosIni.vCashback.vHabilitarCashback then
    begin
      if vDadosIni.vCashback.vCodControle > 0 then
        if vControle.DataSet.FieldByName('codigo_ctrl').AsInteger = vDadosIni.vCashback.vCodControle then
        begin
          DataSet.FieldByName('prg_fid').AsString := 'S';
          DataSet.FieldByName('PERMITIR_EXCLUIR').AsString := 'F';
        end;
    end;

    DataSet.FieldByName('tipdoc').AsString := 'N';
    DataSet.FieldByName('historico').AsString := FcarteiraHistorico;
    if Fcontabil then
      DataSet.FieldByName('TIP_CNT').AsString := 'C';
    DataSet.FieldByName('valordoc').AsFloat := FcarteiraValorDinheiro;
    DataSet.FieldByName('valordoc_liq').AsFloat := 0;
    vrTemp := FcarteiraValorDinheiro;
    DataSet.FieldByName('data_venc').AsString := '';
    if (Trim(DataSet.FieldByName('ref_frete').AsString) = '') and (FtipoVenda = 'MOT') then
      DataSet.FieldByName('valor_contabil').AsFloat := vPlano.vDadosPlano.mot_Valor_Contabil_Dinheiro
    else
      DataSet.FieldByName('valor_contabil').AsFloat := DataSet.FieldByName('valordoc').AsFloat;

    {if (vDadosIni.vSistema = 'Fiscal') and (DataSet.State = dsInsert) then
    begin
      dtmFP.SpIncCodigo.Database := dtmFP.qrFormPagF.Database;
      dtmFP.SpIncCodigo.Transaction := dtmFP.qrFormPagF.Transaction;
      dataSet.FieldByName('seqform').AsInteger := Gencodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo,
        vDadosIni.codEmpresa);
      dataSet.FieldByName('ncoo_ecf').AsInteger := numeroVenda;
      dataSet.FieldByName('secao').AsInteger := vSecao;
      dataSet.FieldByName('registro').AsInteger := vRegistro;
      dataSet.FieldByName('cod_terminal').AsString := vDadosIni.vCodTerminal;
      dataSet.FieldByName('nserieecf').AsString := vDadosIni.codifica(vDadosIni.vNumSerieEcf);
    end
    else}
    Inc(vseqform);
    if DataSet.State = dsInsert then
      dataSet.FieldByName('seqform').AsInteger :=  vseqform;//Gencodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);

    dataSet.FieldByName('historico').AsString := HistoricoHelper.Build(Fpgto, dataSet, fstr('historico'));
    dataSet.Post;
    //    if (vDadosIni.vSistema = 'Fiscal') then
    //      Apply;
    somarDocumentos;

    result := true;
    vDadosIni.GravaAuditoria('FPG003', 'SALVAR',
     'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda +
      ' VALOR: ' + Format('%0.2f', [vrTemp]), 'FORMPAGAMENTO', '', buscas);
  except
    on e: exception do
    begin
      result := false;
      Application.MessageBox(pchar('EFPG0015 Erro ao efetuar recebimento em dinheiro. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('EFPG0015 ' + e.Message);
    end;
  end;
end;

function TFormPag2.receberEmCheque(pFormasEC: boolean = false): boolean;
var
  vrTemp: Currency;
begin
  try
    if falteracao then
      dataSet.edit;

    fSecao := fSecao + 1;

    if FchequeValorCheque <= 0 then
      raise exception.Create('O valor deve ser maior que zero');
    if trim(FchequeHistorico) = '' then
      raise exception.create('O Lançamento deve ter um histórico');
    if not _validaPoliticasDescontos(FchequeValorCheque,0) then
    begin
      Result := False;
      Exit;
    end;

    if not (DataSet.state in [dsInsert, dsEdit]) then
      Insert;

    if DataSet.state in [dsBrowse] then
    begin
      Result := false;
      exit;
    end;

    if pFormasEC then
      if (not vEcommerce.dataSet.IsEmpty) and (FnumeroVendaEcommerce > 0) then
      begin
        DataSet.FieldByName('metodo_pag_id').AsInteger :=
         vEcommerce.dataSet.FieldByName('metodo_pag_id').AsInteger;
        DataSet.FieldByName('local_venda').AsString :=
         vEcommerce.dataSet.FieldByName('local_venda').AsString;
        DataSet.FieldByName('intermediador').AsString :=
         vEcommerce.dataSet.FieldByName('intermediador').AsString; 
      end;

    if vDadosIni.vProgFid.vHabilitarProgFid then
    begin
      if vDadosIni.vProgFid.vCodControle > 0 then
        if vControle.DataSet.FieldByName('codigo_ctrl').AsInteger = vDadosIni.vProgFid.vCodControle then
        begin
          DataSet.FieldByName('prg_fid').AsString := 'S';
          DataSet.FieldByName('PERMITIR_EXCLUIR').AsString := 'F';
        end;
    end
    else if vDadosIni.vCashback.vHabilitarCashback then
    begin
      if vDadosIni.vCashback.vCodControle > 0 then
        if vControle.DataSet.FieldByName('codigo_ctrl').AsInteger = vDadosIni.vCashback.vCodControle then
        begin
          DataSet.FieldByName('prg_fid').AsString := 'S';
          DataSet.FieldByName('PERMITIR_EXCLUIR').AsString := 'F';
        end;
    end;

    DataSet.FieldByName('tipdoc').AsString := 'S1';
    DataSet.FieldByName('historico').AsString := FchequeHistorico;
    DataSet.FieldByName('valordoc').AsFloat := FchequeValorCheque;
    DataSet.FieldByName('valordoc_liq').AsFloat := 0;
    DataSet.FieldByName('valor_contabil').AsFloat := DataSet.FieldByName('valordoc').AsFloat;
    vrTemp := FchequeValorCheque;
    DataSet.FieldByName('ndoc').AsString := FchequeNumeroCheque;
    DataSet.FieldByName('data_venc').AsDateTime := FchequeDataVencimento;
    DataSet.FieldByName('cod_banco_str').AsString := FchequeNumeroBanco;
    DataSet.FieldByName('cod_cli_terc').AsInteger := FchequeCodigoTerceiro;
    DataSet.FieldByName('agencia').AsString := FchequeAgencia;
    DataSet.FieldByName('conta').AsString := FchequeConta;
    DataSet.FieldByName('banco').AsString := FchequeNomeBanco; // vBanco.DataSet.FieldByName('desc_banco').AsString;
    DataSet.FieldByName('terceiros').AsString := FchequeNomeTerceiro;
    if Fcontabil then
      DataSet.FieldByName('TIP_CNT').AsString := 'C';
    {if (vDadosIni.vSistema = 'Fiscal') and (DataSet.State = dsInsert) then
    begin
      dtmFP.SpIncCodigo.Database := dtmFP.qrFormPagF.Database;
      dtmFP.SpIncCodigo.Transaction := dtmFP.qrFormPagF.Transaction;
      dataSet.FieldByName('seqform').AsInteger := Gencodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo,
        vDadosIni.codEmpresa);
      dataSet.FieldByName('ncoo_ecf').AsInteger := numeroVenda;
      dataSet.FieldByName('secao').AsInteger := vSecao;
      dataSet.FieldByName('registro').AsInteger := vRegistro;
      dataSet.FieldByName('cod_terminal').AsString := vDadosIni.vCodTerminal;
      dataSet.FieldByName('nserieecf').AsString := vDadosIni.codifica(vDadosIni.vNumSerieEcf);
    end
    else }
    Inc(vseqform);
    if DataSet.State = dsInsert then
      dataSet.FieldByName('seqform').AsInteger := vseqform;//Gencodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);

    dataSet.FieldByName('historico').AsString := HistoricoHelper.Build(Fpgto, dataSet, fstr('historico'));
    Post;
    //    if (vDadosIni.vSistema = 'Fiscal') then
    //      Apply;
    somarDocumentos;
    result := true;

    vDadosIni.GravaAuditoria('FPG004', 'SALVAR',
      'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda +
      ' CH: ' + Trim(DataSet.FieldByName('ndoc').AsString) +
      ' VENC: ' + DataSet.FieldByName('data_venc').AsString +
      ' VALOR: ' + Format('%0.2f', [vrTemp]), 'FORMPAGAMENTO', '', buscas);
  except
    on e: exception do
    begin
      result := false;
      Application.MessageBox(pchar('EFPG0016 Erro ao efetuar recebimento em cheque. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('EFPG0016 ' + e.Message);
    end;
  end;
end;

function TFormPag2.receberEmCredito(pFormasEC: boolean = false): boolean;
var
  i: integer;
  vrTemp: Currency;
  vCampoNsuObtrig: string;
  vCampoNumAutObrig: string;
begin
  Result := False;

  vCampoNsuObtrig   := 'N';
  vCampoNumAutObrig := 'N';
  if (Trim(vControle.dataSet.FieldByName('TP_PLANO').AsString) = 'C')
  	and (vTermCartao.dataSet.RecordCount > 0)
    and (Trim(fcreditoCodTermAdmCartao) <> '') then
  begin
  	buscas.Close;
	  buscas.SQL.Text := ' select cod_adm, cod_empresa, ' +
    	' coalesce(campo_nsu_obrig, ''S'') campo_nsu_obrig, ' +
      ' coalesce(campo_num_aut_obrig, ''S'') campo_num_aut_obrig from adm_cartao ' +
			' where cod_adm = ' + IntToStr(vTermCartao.dataSet.FieldByName('cod_adm').AsInteger) +
			' and cod_empresa = ' + IntToStr(vTermCartao.dataSet.FieldByName('cod_empresa').AsInteger);
    buscas.Open;

    vCampoNsuObtrig := buscas.FieldByName('campo_nsu_obrig').AsString;
    vCampoNumAutObrig := buscas.FieldByName('campo_num_aut_obrig').AsString;

    if trim(vCampoNsuObtrig) <> 'N' then
    	vCampoNsuObtrig   := 'S';
    if trim(vCampoNumAutObrig) <> 'N' then
    	vCampoNumAutObrig := 'S';
  end;

  if Trim(vControle.dataSet.FieldByName('TP_PLANO').AsString) = 'C' then
  	if vTermCartao.dataSet.RecordCount <= 0 then
      if Trim(FcreditoAutCartao) = '' then
      begin
        Application.MessageBox('Número da Autorização do Cartão deve ser informado', 'Atenção', 0 + 64);
        exit;
      end;

  if Trim(vControle.dataSet.FieldByName('TP_PLANO').AsString) = 'C' then
  begin
    if vTermCartao.dataSet.RecordCount > 0 then
    begin
      if (trim(vCampoNumAutObrig) = 'S') then
        if Trim(FcreditoAutCartao) = '' then
        begin
          Application.MessageBox('Número da Autorização do Cartão deve ser informado', 'Atenção', 0 + 64);
          exit;
        end;

      if (trim(vCampoNsuObtrig) = 'S') then
        if fcreditoNSUTransacao = '' then
        begin
          Application.MessageBox('Num Doc/NSU/CV do Cartão não informado', 'Atenção', 0 + 64);
          exit;
        end;

      if fcreditoCodTermAdmCartao = '' then
      begin
        Application.MessageBox('Terminal da Administradora do Cartão não informado', 'Atenção', 0 + 64);
        exit;
      end;

      if vTermCartao.dataSet.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').AsString = 'B' then
        if (vControle.DataSet.FieldByName('CARTAO_SPED').AsInteger = 1) or (vControle.DataSet.FieldByName('CARTAO_SPED').AsInteger = 2) then
          if fcreditoCodBandeiraAdmCartao <= 0 then
          begin
            Application.MessageBox('Bandeira do Cartão não informado', 'Atenção', 0 + 64);
            exit;
          end;

      if vTermCartao.dataSet.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').AsString = 'B' then
        if (vControle.DataSet.FieldByName('CARTAO_SPED').AsInteger <> 1)
          and (vControle.DataSet.FieldByName('CARTAO_SPED').AsInteger <> 2) then
        begin
          Application.MessageBox(pchar('Controle ' +
            IntToStr(vControle.dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
            ' - ' + trim(vControle.dataSet.FieldByName('NOME_CTRL').AsString) +
            ' definido como cartão, favor informar se é Débito ou Crédito'),
            'Atenção', 0 + 64);
          exit;
        end;
    end;
  end;

  fSecao := fSecao + 1;

  try
    for i := 0 to vQtde - 1 do
    begin
      if vDadosIni.StrToFloatFormat(vValor[i], 2) > 0 then
      begin
        if trim(FcreditoHistorico) = '' then
          raise exception.create('O Lançamento deve ter um histórico');

        if not (DataSet.state in [dsInsert, dsEdit]) then
          Insert;

        if DataSet.state in [dsBrowse] then
        begin
          Result := false;
          exit;
        end;

        if pFormasEC then
          if (not vEcommerce.dataSet.IsEmpty) and (FnumeroVendaEcommerce > 0) then
          begin
            DataSet.FieldByName('metodo_pag_id').AsInteger :=
             vEcommerce.dataSet.FieldByName('metodo_pag_id').AsInteger;
            DataSet.FieldByName('local_venda').AsString :=
             vEcommerce.dataSet.FieldByName('local_venda').AsString;
            DataSet.FieldByName('intermediador').AsString :=
             vEcommerce.dataSet.FieldByName('intermediador').AsString;
          end;

        if vDadosIni.vProgFid.vHabilitarProgFid then
        begin
          if vDadosIni.vProgFid.vCodControle > 0 then
            if vControle.DataSet.FieldByName('codigo_ctrl').AsInteger = vDadosIni.vProgFid.vCodControle then
            begin
              DataSet.FieldByName('prg_fid').AsString := 'S';
              DataSet.FieldByName('PERMITIR_EXCLUIR').AsString := 'F';
            end;
        end
        else if vDadosIni.vCashback.vHabilitarCashback then
        begin
          if vDadosIni.vCashback.vCodControle > 0 then
            if vControle.DataSet.FieldByName('codigo_ctrl').AsInteger = vDadosIni.vCashback.vCodControle then
            begin
              DataSet.FieldByName('prg_fid').AsString := 'S';
              DataSet.FieldByName('PERMITIR_EXCLUIR').AsString := 'F';
            end;
        end;

        DataSet.FieldByName('tipdoc').AsString := 'S2';
        DataSet.FieldByName('historico').AsString := FcreditoHistorico;
        if contabil then
          DataSet.FieldByName('TIP_CNT').AsString := 'C';
        DataSet.FieldByName('valordoc').AsFloat := vValor[i];
        DataSet.FieldByName('valordoc_liq').AsFloat := vValorLiq[i];
        DataSet.FieldByName('valor_contabil').AsFloat := DataSet.FieldByName('valordoc').AsFloat;
        vrTemp := DataSet.FieldByName('valordoc').AsFloat;
        DataSet.FieldByName('data_venc').AsDateTime := StrToDate(vData[i]);
        DataSet.FieldByName('ndoc').AsString := vDocumento[i];
        DataSet.FieldByName('cod_cli_terc').AsInteger := FcreditoCodigoTerceiro;
        DataSet.FieldByName('terceiros').AsString := FcreditoNomeTerceiro;
        DataSet.FieldByName('N_AUT_CART').AsString := FcreditoAutCartao;
        DataSet.FieldByName('NPARCELA').AsInteger := I + 1;
        DataSet.FieldByName('QTDE_PARC').AsInteger := vQtde;
        DataSet.FieldByName('N_DOCNSU_ADM').AsString := fcreditoNSUTransacao;
        if trim(fcreditoCodTermAdmCartao) <> '' then
        begin
	        DataSet.FieldByName('COD_TERMINAL_ADM').AsString := fcreditoCodTermAdmCartao;
          DataSet.FieldByName('DESC_TERMINAL_ADM').AsString := fcreditoTermAdmCartao;
        end;
        if (trim(fcreditoCodTermAdmCartao) <> '') then
        begin
          buscas.Close;
          buscas.SQL.Text := ' select cod_adm, descricao_adm from adm_cartao ' +
            ' where cod_adm = ' + IntToStr(vTermCartao.dataSet.FieldByName('cod_adm').AsInteger) +
            ' and cod_empresa = ' + IntToStr(vTermCartao.dataSet.FieldByName('cod_empresa').AsInteger);
          buscas.Open;

          if not buscas.IsEmpty then
          begin
	          DataSet.FieldByName('COD_ADM').AsInteger := buscas.FieldByName('COD_ADM').AsInteger;
  	        DataSet.FieldByName('DESC_ADM').AsString := trim(buscas.FieldByName('DESCRICAO_ADM').AsString);
          end;
        end;
        if fcreditoCodBandeiraAdmCartao > 0 then
        begin
	        DataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger := fcreditoCodBandeiraAdmCartao;
          DataSet.FieldByName('DESC_BANDEIRA').AsString := fcreditoBandeiraAdmCartao;
        end;

        if (trim(vControle.DataSet.FieldByName('TP_PLANO').AsString) = 'C')
        	and ((vControle.DataSet.FieldByName('CARTAO_SPED').AsInteger = 1)	or (vControle.DataSet.FieldByName('CARTAO_SPED').AsInteger = 2)) then
            DataSet.FieldByName('DEB_CRED').AsString :=
              vDadosIni.IfThen(vControle.DataSet.FieldByName('CARTAO_SPED').AsInteger = 1, 'D', 'C')
        else
          DataSet.FieldByName('DEB_CRED').Value := null;

        if Pos('VALE', vControle.dataSet.FieldByName('NOME_CTRL').AsString) > 0 then
          DataSet.FieldByName('codigo_func').AsInteger := vFunc.dataSet.FieldByName('cod_vendedor').AsInteger;
        {if (vDadosIni.vSistema = 'Fiscal') and (DataSet.State = dsInsert) then
        begin
          dtmFP.SpIncCodigo.Database := dtmFP.qrFormPagF.Database;
          dtmFP.SpIncCodigo.Transaction := dtmFP.qrFormPagF.Transaction;
          dataSet.FieldByName('seqform').AsInteger := Gencodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo,
            vDadosIni.codEmpresa);
          dataSet.FieldByName('ncoo_ecf').AsInteger := numeroVenda;
          dataSet.FieldByName('secao').AsInteger := vSecao;
          dataSet.FieldByName('registro').AsInteger := vRegistro;
          dataSet.FieldByName('cod_terminal').AsString := vDadosIni.vCodTerminal;
          dataSet.FieldByName('nserieecf').AsString := vDadosIni.codifica(vDadosIni.vNumSerieEcf);
        end
        else}
        Inc(vseqform);
        if DataSet.State = dsInsert then
          dataSet.FieldByName('seqform').AsInteger := vseqform;//Gencodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);

        dataSet.FieldByName('historico').AsString := HistoricoHelper.Build(Fpgto, dataSet, fstr('historico'));
        dataSet.Post;
        vDadosIni.GravaAuditoria('FPG005', 'SALVAR',
          'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda +
          ' ' + Trim(DataSet.FieldByName('ndoc').AsString) + ' ' + DataSet.FieldByName('data_venc').AsString + ' ' +
          Format('%0.2f', [DataSet.FieldByName('valorDoc').AsFloat]),
          'FORMPAGAMENTO', '', buscas);
      end;
    end;
    somarDocumentos;

    //    if (vDadosIni.vSistema = 'Fiscal') then
    //      Apply;
    result := true;
  except
    on e: exception do
    begin
      result := false;
      Application.MessageBox(pchar('EFPG0018 Erro ao efetuar recebimento em Outros. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('EFPG0018 ' + e.Message);
    end;
  end;
end;

function TFormPag2.receberRecibo(AOperacao: TOperacaoRecibo): boolean;
var
  valorRecebimento: Currency;
  valorRecebimentolocacao: Currency;
  valorTemp: Currency;
  vNRecibos: string;
  nRecibo: integer;
  nreciboTemp: string;
  ControleRec: Integer;
  buscas2: TIBQuery;
begin
  try
    result := false;

    buscas2 := TIBQuery.Create(Application);
 	  buscas2.Database := buscas.Database;
	  buscas2.Transaction := buscas.Transaction;

    fSecao := fSecao + 1;

    if AOperacao = orNormal then
      if not vDadosIni.PesqPros('FPG007', 'QUITAR',
      'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
      'FORMPAGAMENTO', '', buscas, True) then
        Exit;

    valorTemp := vRecibo.somatorioRecibos;
    valorRecebimento := 0;
    valorRecebimentolocacao := 0;
    frmFormPag2.Label27.Caption := Format('%m', [valorTemp]);
    if valorTemp = 0 then
    begin
      result := false;
      if AOperacao = orNormal then
        Application.MessageBox('Nenhum recibo foi selecionado ou a soma esta sendo zero!',
          'Informação', MB_OK + MB_ICONINFORMATION);
      exit;
    end;

    buscas2.Close;
    buscas2.SQL.Text := 'select * from Cont_Lig where COD_EMP = ' + vDadosIni.codEmpresa;
    buscas2.Open;

    ControleRec := buscas2.FieldByName('CONTR_REC').AsInteger;
    if (ControleRec > 0) then
    begin
     	buscas2.Close;
      buscas2.SQL.Text := ' select codigo_ctrl, docs from controles ' +
      	' where codigo_ctrl = :codigo_ctrl ' +
        ' and codigo_emp = :codigo_emp ';
     	buscas2.ParamByName('codigo_ctrl').AsInteger := ControleRec;
      buscas2.ParamByName('codigo_emp').AsInteger := StrToInt(vDadosIni.codEmpresa);
    	buscas2.Open;

      if trim(buscas2.FieldByName('DOCS').AsString) <> 'N' then
      begin
      	Application.MessageBox(pchar('Controle para Lançamento de Recibo informado no cadastro da empresa deve ser do tipo "N - DINHEIRO"'), pchar('Erro'), MB_ICONERROR + MB_OK);
        Exit;
      end;
    end;


    try
      vNRecibos := '';
      nRecibo := 0;
      vRecibo.dataSet.DisableControls;
      vRecibo.dataSet.First;
      while not vRecibo.dataSet.Eof do
      begin
        if vRecibo.DataSet.FieldByName('selec').AsString <> 'S' then
        begin
          vRecibo.dataSet.Next;
          Continue;
        end;

        if vDadosIni.vLocacao.vHabilitarLoc then
          if valorRecebimentolocacao >= FvalorQueFaltaInformar then
            break;

        if vRecibo.DataSet.FieldByName('status_rec').AsString = 'RECEBIDO' then
        begin
          nreciboTemp := vRecibo.DataSet.FieldByName('nrecibo').AsString;
          if vDadosIni.vRecibo.HabRecPorDepart then
            if trim(vRecibo.dataSet.FieldByName('NUM_REC_DEP').AsString) <> '' then
              nreciboTemp := vRecibo.dataSet.FieldByName('NUM_REC_DEP').AsString;
          Application.MessageBox(pchar('Recibo Nº ' + nreciboTemp +
          ' quitado integralmente nesta forma de pagamento. Não é possível utilizá-lo novamente!'), 'Informação', MB_OK + MB_ICONINFORMATION);
          vRecibo.dataSet.Next;
          Continue;
        end;

       // valorRecebimento := valorRecebimento + vRecibo.baixaRecibo(numeroVenda, FtipoVenda, FvalorQueFaltaInformar - valorRecebimento);
        valorRecebimento := vRecibo.baixaRecibo(numeroVenda, FtipoVenda, FvalorQueFaltaInformar - valorRecebimento, FcodigoCliente, Self, AOperacao);
        if vDadosIni.vLocacao.vHabilitarLoc then
          if vRecibo.dataSet.FieldByName('cod_locacao').AsInteger > 0 then
            valorRecebimentolocacao := valorRecebimentolocacao + valorRecebimento;

        vDadosIni.GravaAuditoria('FPG007', 'QUITAR',
          'N REC:' + vRecibo.dataSet.FieldByName('nrecibo').AsString +
          ' VALOR: ' + Format('%0.2f', [valorRecebimento]),
          'FORMPAGAMENTO', '', buscas);

        vNRecibos := vNRecibos + vRecibo.dataSet.FieldByName('nrecibo').AsString + ', ';
        nRecibo := vRecibo.dataSet.FieldByName('nrecibo').AsInteger;
        vControle.DataSet.IndexFieldNames := 'CODIGO_CTRL';

        try
          FRef_Frete := False;
          if (FtipoVenda = 'MOT') and (vPlano.vDadosPlano.mot_Valor_frete > 0) then
          begin
            Application.ProcessMessages;
            FRef_Frete := Application.MessageBox('Lançamento referente a Frete/Seguro/Outras Despesas?',
              'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES;
          end;

          if valorRecebimento > 0 then
          begin
            vControle.DataSet.IndexFieldNames := 'NOME_CTRL';
            vControle.FindNearest(['DINHEIRO']);

            dataSet.Filter := '';

            if not (DataSet.state in [dsInsert, dsEdit]) then
              Insert;

            if vDadosIni.vEmp.vFinanceiroUnificado then
              DataSet.FieldByName('cod_unificada').AsInteger :=
               vRecibo.dataSet.FieldByName('cod_empresa').AsInteger;

            DataSet.FieldByName('cod_controle').AsInteger := vDadosIni.IfThen(ControleRec > 0, ControleRec, 1);

            if DataSet.state in [dsBrowse] then
            begin
              Result := false;
              vControle.DataSet.IndexFieldNames := 'CODIGO_CTRL';
              exit;
            end;
            if valorRecebimento <= 0 then
              raise exception.Create('O valor deve ser maior que zero');
            DataSet.FieldByName('tipdoc').AsString := 'N';
            if nRecibo < 100000 then
              DataSet.FieldByName('historico').AsString := 'PAGAMENTO CONFORME RECIBO ANTECIPADO'
            else
              DataSet.FieldByName('historico').AsString := 'PAGAMENTO CONFORME VALECOMPRA';
            DataSet.FieldByName('valordoc').AsFloat := valorRecebimento;
            DataSet.FieldByName('valor_contabil').AsFloat := DataSet.FieldByName('valordoc').AsFloat;
            DataSet.FieldByName('recibo').AsString := 'S';
            //        DataSet.FieldByName('REC_TIPVEND').AsString := FtipoVenda;
            //        DataSet.FieldByName('REC_NUMVEND').AsInteger := FnumeroVenda;
            //        DataSet.FieldByName('nrequisicao').AsInteger := vRecibo.dataSet.FieldByName('nrecibo').AsInteger;
            //        DataSet.FieldByName('tpdocs').AsString := 'REC';
            DataSet.FieldByName('REC_TIPVEND').AsString := 'REC';
            DataSet.FieldByName('REC_NUMVEND').AsInteger := nRecibo;
            DataSet.FieldByName('nrequisicao').AsInteger := FnumeroVenda;
            DataSet.FieldByName('tpdocs').AsString := FtipoVenda;
            Inc(vseqform);
            if DataSet.State = dsInsert then
              DataSet.FieldByName('SEQFORM').AsInteger :=  vseqform;//GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
            DataSet.FieldByName('N_REC').AsInteger := nRecibo;
            if AOperacao <> orNormal then
              dataSet.FieldByName('PERMITIR_EXCLUIR').AsString := 'V';// Nao permite excluir ou alterar Vale Compra
            Post;
            if vDadosIni.vSistema = 'Cxl' then
            begin
              //          vFecDiaCxl.selecionaDiaCxl;
              //          if vDadosIni.diaAbertoCxl = 0 then
              //            vDadosIni.diaAbertoCxl := vFecDiaCxl.dataSet.FieldByName('dia_f_cxl').AsDateTime;
              if (vDadosIni.vRecibo.HabRecPorDepart) then
              begin
                buscas2.Close;
                buscas2.SQL.Text := ' select trim(num_rec_dep) num_rec_dep from recibos ' +
                  ' where nrecibo = :nrecibo and cod_empresa = :cod_empresa ';
                buscas2.ParamByName('NRECIBO').AsInteger := NRecibo;
                buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
                buscas2.Open;

                vLancCxl.insereLancamento(FtipoVenda, 'S', '',
                  IfThen(nRecibo < 100000, 'BX REC ANT ', 'BX VALECOM ') +
                  vDadosIni.IfThen(buscas2.IsEmpty, IntToStr(NRecibo), buscas2.FieldByName('NUM_REC_DEP').AsString) +
                  ' ' + FtipoVenda + ' ' + IntToStr(FnumeroVenda),
                 // 'BAIXA CONF. VALECOMPRA(S) ' + vNRecibos + FtipoVenda + ' ' + IntToStr(FnumeroVenda),
                  valorRecebimento, numeroVenda, nRecibo);
              end
              else
              begin
                vLancCxl.insereLancamento(FtipoVenda, 'S', '',
                  IfThen(nRecibo < 100000, 'BX REC ANT ', 'BX VALECOM ') +
                  IntToStr(NRecibo) + ' ' + FtipoVenda + ' ' + IntToStr(FnumeroVenda),
                 // 'BAIXA CONF. VALECOMPRA(S) ' + vNRecibos + FtipoVenda + ' ' + IntToStr(FnumeroVenda),
                  valorRecebimento, numeroVenda, nRecibo);
              //          vFecDiaCxl.alteraSaldo('S', valorRecebimento);
              end;
            end;

            if not (DataSet.state in [dsInsert, dsEdit]) then
              Insert;

            DataSet.FieldByName('cod_controle').AsInteger := vDadosIni.IfThen(ControleRec > 0, ControleRec, 1);

            //        if valorRecebimento <= 0 then
            DataSet.FieldByName('tpdocs').AsString := 'LCS';
            DataSet.FieldByName('tipdoc').AsString := 'N';
            if vDadosIni.vSistema = 'Cxl' then
              DataSet.FieldByName('historico').AsString :=
                vLancCxl.DataSet.FieldByName('HISTORICO_CXL').AsString
            else
              DataSet.FieldByName('historico').AsString :=
                IfThen(nRecibo < 100000, 'BAIXA CONF. REC ANTECIPADO(S) ',
                'BAIXA CONF. VALECOMPRA ') + 'CLIENTE: ' +
                nomeCliente;
            DataSet.FieldByName('valordoc').AsFloat := (-1) * valorRecebimento;
            DataSet.FieldByName('valor_contabil').AsFloat := DataSet.FieldByName('valordoc').AsFloat;
            DataSet.FieldByName('recibo').AsString := 'S';
            //DataSet.FieldByName('REC_TIPVEND').AsString := FtipoVenda;
            //DataSet.FieldByName('REC_NUMVEND').AsInteger := FnumeroVenda;
            if vLancCxl.dataSet.Active then
            begin
              if vLancCxl.DataSet.FieldByName('COD_LANCXL').AsInteger > 0 then
                DataSet.FieldByName('nrequisicao').AsInteger := vLancCxl.DataSet.FieldByName('COD_LANCXL').AsInteger
              else
                DataSet.FieldByName('nrequisicao').AsInteger := vRecibo.dataSet.FieldByName('nrecibo').AsInteger;
            end
            else
              DataSet.FieldByName('nrequisicao').AsInteger := vRecibo.dataSet.FieldByName('nrecibo').AsInteger;

            Inc(vseqform);
            if DataSet.State = dsInsert then
              DataSet.FieldByName('SEQFORM').AsInteger := vseqform;//GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);

            DataSet.FieldByName('TIP_CNT').Value := Null;//no recibo este registro não pode ser contabil, apenas a entrada
            DataSet.FieldByName('N_REC').AsInteger := nRecibo;
            dataSet.Post;

          end
          else
          begin
            Result := false;
            Application.MessageBox('Nenhum valor informado para quitação!', 'Informação', MB_OK +
              MB_ICONINFORMATION);
          end;

        finally
          FRef_Frete := False;
        end;
        vRecibo.dataSet.Next; //testar os recibos
      end;
    finally
      vRecibo.dataSet.EnableControls;
    end;

    somarDocumentos;
    result := true;
//    vDadosIni.GravaAuditoria('FPG007', 'QUITAR',
//      'QUITADOS: ' + vNRecibos + ' VALOR : ' + Format('%0.2f', [valorRecebimento]), 'FORMPAGAMENTO', '', buscas);
    vControle.DataSet.IndexFieldNames := 'CODIGO_CTRL';
    if Result then
    begin
      if AOperacao = orNormal then
      begin
      atribuirAtributosParaFormulario;
      frmFormPag2.grupoControle.Enabled := True;
      frmFormPag2.PageControl1.ActivePage := frmFormPag2.tabLancamentos;
      if (frmFormPag2.Enabled) and (frmFormPag2.Visible) and (frmFormPag2.gridControle.CanFocus) then
        frmFormPag2.gridControle.SetFocus;
      end;
      if (AOperacao <> orAntecipado) and (AOperacao <> orValeLocacao) then
        cancelar;
    end;
  except
    on e: exception do
    begin
      vControle.DataSet.IndexFieldNames := 'CODIGO_CTRL';
      result := false;
      Application.MessageBox(pchar('EFPG0023 Erro ao gravar historico do recibo. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('EFPG0023 ' + e.Message);
    end;
  end;
end;

procedure TFormPag2.refazerNumDocumentoBoletos;
var
  vInc: Integer;
  vtmp: string;
begin
  try
    vtmp := Copy(fControlesBoleto, 2, Length(fControlesBoleto) -2);
    if (Trim(vtmp) = '') or (Trim(fControlesBoleto) = '|') then
      Exit;

    vtmp := StringReplace(vtmp, '|', ' or cod_controle = ', [rfReplaceAll]);

    dataSet.Filter := 'cod_controle = ' + vtmp;
    dataSet.Filtered := True;

    if dataSet.IsEmpty then
      Exit;

    IndexFieldNames := 'SEQFORM';
    vInc := 0;
    dataSet.First;
    while not dataSet.Eof do
    begin
      Inc(vInc);
      dataSet.Edit;
      dataSet.FieldByName('ndoc').AsString := vDadosIni.StrZero(
        Integer(vDadosIni.retornoPorCondicao(FNum_Nf > 0, FNum_Nf, FnumeroVenda)), 6) + '-' + IntToStr(vInc);
      dataSet.Post;
      dataSet.Next;
    end;
  finally
    dataSet.Filter := '';
    dataSet.Filtered := False;
  end;
end;

function TFormPag2.removerLancamentoValeProgFid: boolean;
begin
  try
    Result := true;

    if vDadosIni.vProgFid.vHabilitarProgFid then
      if not vValeCupomPrgFid.IsEmpty then
      begin
        if (vDtSet.FieldByName('cod_controle').AsInteger = vDadosIni.vProgFid.vCodControle) then 
        try
          vValeCupomPrgFid.dataSet.Filter := 'ndoc = ' + IntToStr(FnumeroVenda) +
            ' and tipodoc = ' + QuotedStr(FtipoVenda);// +
//            ' and erp_api = ''A'' ';
          vValeCupomPrgFid.dataSet.Filtered := True;

          try
          	vValeCupomPrgFid.dataSet.DisableControls;
            vValeCupomPrgFid.dataSet.First;
            while not vValeCupomPrgFid.dataSet.Eof do
            begin
              vValeCupomPrgFid.dataSet.Edit;
              vValeCupomPrgFid.dataSet.FieldByName('ndoc').Value := Null;
              vValeCupomPrgFid.dataSet.FieldByName('tipodoc').Value := Null;
              vValeCupomPrgFid.dataSet.FieldByName('cod_emp_tipodoc').Value := Null;
              vValeCupomPrgFid.dataSet.Post;

              vValeCupomPrgFid.dataSet.Next;
            end;
          finally
            vValeCupomPrgFid.dataSet.EnableControls;
          end;
          vValeCupomPrgFid.Apply;
        finally
          vValeCupomPrgFid.dataSet.Filtered := false;
          vValeCupomPrgFid.dataSet.IndexFieldNames := 'DATAHORA';
          vValeCupomPrgFid.dataSet.First;
        end;
      end;
  except
    on e: exception do
    begin
      Result := false;
      RollBackTransacao;
      Application.MessageBox(pchar(e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

procedure TFormPag2.removerRecibodoLancamento(pRecibo: Integer);
var
  vSeq: Integer;
  vVal: Extended;
begin
  try
    dataSet.Filter := 'N_REC = ' + IntToStr(pRecibo) + ' and tpdocs <> ''LCS''';
    dataSet.Filtered := True;

    vSeq := dataSet.FieldByName('SEQFORM').AsInteger;
    vVal := dataSet.FieldByName('VALORDOC').AsFloat;
  
    vRecibo.vHistRec.dataSet.Filter := 'nrecibo = ' + IntToStr(pRecibo) + ' and ndocant = ' + IntToStr(FnumeroVenda) +' and tp_doc_baixa = ' + QuotedStr(FtipoVenda);
    vRecibo.vHistRec.dataSet.Filtered := True;
    try
      while pRecibo =  vRecibo.vHistRec.dataSet.FieldByName('nrecibo').AsInteger do
        vRecibo.vHistRec.dataSet.Delete;
    finally
      vRecibo.vHistRec.dataSet.Filtered := False;
    end;

    vRecibo.dataSet.Filter := 'nrecibo = ' + IntToStr(pRecibo);
    vRecibo.dataSet.Filtered := True;
    try
      if pRecibo =  vRecibo.dataSet.FieldByName('nrecibo').AsInteger then
      begin
        vRecibo.dataSet.Edit;
        if vRecibo.DataSet.FieldByName('status_rec').AsString = 'RECEBIDO' then
        begin
          vRecibo.dataSet.FieldByName('status_rec').Value := Null;
          vRecibo.dataSet.FieldByName('DATA_BAIXA').Value := Null;
          vRecibo.dataSet.FieldByName('valor').AsCurrency := vDadosIni.StrToFloatFormat(vRecibo.dataSet.FieldByName('valor').AsCurrency, 2);
          vRecibo.dataSet.FieldByName('NDOCANT').Value := Null;
          vRecibo.dataSet.FieldByName('HISTORICO_REC').Value := Null;
        end
        else
          vRecibo.dataSet.FieldByName('valor').AsCurrency := vDadosIni.StrToFloatFormat(vRecibo.dataSet.FieldByName('valor').AsCurrency + 
            dataSet.FieldByName('valordoc').AsFloat, 2);          
        vRecibo.dataSet.Post;
      end;
    finally
      vRecibo.dataSet.Filtered := False;
    end;
  finally
    dataSet.Filtered := False;
    dataSet.Filter := '';
  end;

  try
    dataSet.Filter := 'N_REC = ' + IntToStr(pRecibo) + ' and tpdocs = ''LCS''';// AND valordoc = (-' +
//      StringReplace(vDadosIni.trocaVirgulaPorPonto(Format('%n', [pVal])),',','',[rfReplaceAll]) + ')';
    dataSet.Filtered := True;

    if dataSet.FieldByName('recibo').AsString = 'S' then
    begin
      if (vDadosIni.vSistema = 'Cxl') and (vLancCxl.dataSet.Active) then
        try
          vLancCxl.dataSet.Filter := 'N_REC = ' + IntToStr(pRecibo);
          vLancCxl.dataSet.Filtered := True;
          while vLancCxl.dataSet.FieldByName('n_rec').AsInteger = pRecibo do
            vLancCxl.dataSet.Delete;
        finally
          vLancCxl.dataSet.Filtered := True;
          vLancCxl.dataSet.Filter := '';
        end;
    end;
    dataSet.Filtered := False;
    dataSet.Filter := 'N_REC = ' + IntToStr(pRecibo);
    dataSet.Filtered := True;
    while dataSet.FieldByName('n_rec').AsInteger = pRecibo do
      dataSet.Delete;

  finally
    dataSet.Filtered := False;
    dataSet.Filter := '';
  end;
end;

function TFormPag2.retornaControleIntermediador(pLocalVnd: string; pInter: string): Integer;
var
  vtemp: string;
begin
  vtemp := retornaValor('select coalesce(codigo_ctrl, 0) as valor from intermediador_controle_ec ' +
     ' where local_venda = ' + QuotedStr(pLocalVnd) +
     ' and intermediador = ' + QuotedStr(pInter) +
     ' and cod_empresa = ' + vDadosIni.codEmpresa);
  Result := StrToInt(vDadosIni.IfThen(trim(vtemp) = '', 0, vtemp));
end;

procedure TFormPag2.somarDocumentos;
var
  I: Integer;
begin
  FvalorQueFaltaInformar := 0;
  FvalorInformado := 0;
  fvalorTroco := 0;
  FvalorTotalCarteira := 0;
  FvalorTotalDinheiro := 0;
  FvalorTotalCreditos := 0;
  FvalorTotalCheques := 0;
  FvalorTotalRecibos := 0;
  while not vDtSet.IsEmpty do
    vDtSet.Delete;
  dataSet.First;
  while not dataset.Eof do
  begin
    if (trim(DataSet.FieldByName('tpdocs').AsString) <> 'LCS') then
    begin
      vDtSet.Insert;
      for I := 0 to dataSet.FieldCount - 1 do
        if vDtSet.FindField(dataSet.Fields[i].FieldName) <> nil then
          vDtSet.FieldByName(dataSet.Fields[i].FieldName).Value :=
            dataSet.FieldByName(dataSet.Fields[i].FieldName).Value;
      vDtSet.Post;

      FvalorInformado := FvalorInformado + DataSet.FieldByName('valordoc').AsFloat;
      if (DataSet.FieldByName('cod_controle').AsInteger = 1) and (DataSet.FieldByName('recibo').AsString <> 'S') then
        FvalorTotalDinheiro := FvalorTotalDinheiro + DataSet.FieldByName('valordoc').AsFloat;
      if (trim(DataSet.FieldByName('tipdoc').AsString) = 'N') and
        (DataSet.FieldByName('recibo').AsString <> 'S') then
        FvalorTotalCarteira := FvalorTotalCarteira + DataSet.FieldByName('valordoc').AsFloat;
      if DataSet.FieldByName('tipdoc').AsString = 'S1' then
        FvalorTotalCheques := FvalorTotalCheques + DataSet.FieldByName('valordoc').AsFloat;
      if DataSet.FieldByName('tipdoc').AsString = 'S2' then
        FvalorTotalCreditos := FvalorTotalCreditos + DataSet.FieldByName('valordoc').AsFloat;
      if (DataSet.FieldByName('tipdoc').AsString = 'N') and (DataSet.FieldByName('recibo').AsString
        = 'S') then
        FvalorTotalRecibos := FvalorTotalRecibos + DataSet.FieldByName('valordoc').AsFloat;
    end;
    dataset.Next;
  end;
  if FvalorInformado >= FvalorVenda then
    FvalorTroco := FvalorInformado - FvalorVenda
  else if FvalorInformado < FvalorVenda then
    FvalorQueFaltaInformar := FvalorVenda - FvalorInformado;
end;

procedure TFormPag2.TitleBandCarneDetBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := Trim(dataSet.FieldByName('tipdoc').AsString) = 'S2';
  if not PrintBand then
    exit;

  if frmDetalhamento.QuickRep2.DataSet.Bof then
    vCountRel_2 := 0;

  vCountRel_2 := vCountRel_2 + 1;

  frmDetalhamento.QRLabel60.Caption := IntToStr(vCountRel_1);
  frmDetalhamento.QRLabel61.Caption := IntToStr(vCountRel_2);

  buscas.close;
  buscas.SQL.Text := 'select cod_cliente, RAZAO, CPFCGC, ENDERECO,NUM_END_CLIENTE from clientes where cod_cliente  = ' +
    dataSet.FieldByName('cod_cliente').AsString + ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.open;

  frmDetalhamento.Qrlabel62.caption := Trim(buscas.FieldByName('cod_cliente').AsString);
  frmDetalhamento.QRLabel63.caption := format('%n', [dataSet.FieldByName('valordoc').AsFloat]);
  frmDetalhamento.QRLabel64.Caption := dataSet.FieldByName('data_venc').AsString;
  frmDetalhamento.Qrlabel65.caption := Trim(buscas.FieldByName('cod_cliente').AsString);
  frmDetalhamento.Qrlabel66.caption := Trim(buscas.FieldByName('razao').AsString);
  frmDetalhamento.QRLabel67.caption := format('%n', [dataSet.FieldByName('valordoc').AsFloat]);
  frmDetalhamento.QRLabel68.Caption := dataSet.FieldByName('data_venc').AsString;
  frmDetalhamento.QRLabel69.Caption := vDadosIni.vEmp.vMensagem;
end;

procedure TFormPag2.TitleBandPromissoriaBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := Trim(dataSet.FieldByName('tipdoc').AsString) = 'S2';
  if not PrintBand then
    exit;
  if (vDadosIni.vRecibo.HabRecPorDepart) and (Trim(dataSet.FieldByName('tpdocs').AsString) = 'REC') then
  begin
     buscas.Close;
     buscas.SQL.Text := ' select num_rec_dep from recibos  ' +
      ' where nrecibo = :nrecibo and cod_empresa = :cod_empresa ';
     buscas.ParamByName('nrecibo').AsInteger := dataSet.FieldByName('nrequisicao').AsInteger;
     buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
     buscas.Open;

    if not buscas.IsEmpty then
       frmFormPag2.Qrlabel44.caption := vDadosIni.IfThen(trim(buscas.FieldByName('num_rec_dep').AsString) <> '',
         trim(buscas.FieldByName('num_rec_dep').AsString) + '-' + IntToStr(dataSet.FieldByName('nparcela').AsInteger),
         Trim(dataSet.FieldByName('ndoc').AsString))
    else
	    frmFormPag2.Qrlabel44.caption := Trim(dataSet.FieldByName('ndoc').AsString);
  end
  else
  	frmFormPag2.Qrlabel44.caption := Trim(dataSet.FieldByName('ndoc').AsString);
  frmFormPag2.QRLabel45.caption := format('%n', [dataSet.FieldByName('valordoc').AsFloat]);
  frmFormPag2.QRLabel46.caption := vDadosIni.vEmp.vRazaoSocial;
  if length(trim(vDadosIni.vEmp.vCNPJ)) = 11 then
    frmFormPag2.QRLabel47.caption := copy(vDadosIni.vEmp.vCNPJ, 1, 3) + '.' +
      copy(vDadosIni.vEmp.vCNPJ, 4, 3) + '.' +
      copy(vDadosIni.vEmp.vCNPJ, 7, 3) + '-' +
      copy(vDadosIni.vEmp.vCNPJ, 10, 2)
  else
    frmFormPag2.QRLabel47.caption := copy(vDadosIni.vEmp.vCNPJ, 1, 2) + '.' +
      copy(vDadosIni.vEmp.vCNPJ, 3, 3) + '.' +
      copy(vDadosIni.vEmp.vCNPJ, 6, 3) + '/' +
      copy(vDadosIni.vEmp.vCNPJ, 9, 4) + '-' +
      copy(vDadosIni.vEmp.vCNPJ, 13, 2);
  buscas.close;
  buscas.SQL.Text := ' select cl.RAZAO, cl.CPFCGC, cl.ENDERECO, cl.NUM_END_CLIENTE, cl.COMPLEMENTO, ' +
     ' coalesce(cd.nome_cidade, cl.cidade) CIDADE, ' +
     ' coalesce(bd.nome_bairro, cl.bairro) BAIRRO, ' +
     ' coalesce(est.sigla_uf, '''') SIGLA_UF, ' +
     ' cl.CEP from clientes cl ' +
     ' left join cidades cd on cd.cod_cidade = cl.cod_cidade ' +
     ' left join bairros bd on bd.cod_bairro = cl.cod_bairro ' +
     ' left join estados est on est.codigo_uf = cl.codigo_uf ' +
  	  ' where cl.cod_cliente  = ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger) +
     ' and cl.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.open;
  frmFormPag2.QRLabel51.caption := Copy(trim(buscas.FieldByName('RAZAO').AsString), 1, 39);
  if length(trim(buscas.FieldByName('CPFCGC').AsString)) = 11 then
    frmFormPag2.QRLabel52.caption := copy(buscas.FieldByName('CPFCGC').AsString, 1, 3) + '.' +
      copy(buscas.FieldByName('CPFCGC').AsString, 4, 3) + '.' +
      copy(buscas.FieldByName('CPFCGC').AsString, 7, 3) + '-' +
      copy(buscas.FieldByName('CPFCGC').AsString, 10, 2)
  else
    frmFormPag2.QRLabel52.caption := copy(buscas.FieldByName('CPFCGC').AsString, 1, 2) + '.' +
      copy(buscas.FieldByName('CPFCGC').AsString, 3, 3) + '.' +
      copy(buscas.FieldByName('CPFCGC').AsString, 6, 3) + '/' +
      copy(buscas.FieldByName('CPFCGC').AsString, 9, 4) + '-' +
      copy(buscas.FieldByName('CPFCGC').AsString, 13, 2);
  frmFormPag2.QRLabel53.caption := trim(buscas.FieldByName('ENDERECO').AsString) + ', ' +
    trim(buscas.FieldByName('NUM_END_CLIENTE').AsString) +
    IfThen(trim(buscas.FieldByName('COMPLEMENTO').AsString) <> '',
      ' - ' + trim(buscas.FieldByName('COMPLEMENTO').AsString), '');
  frmFormPag2.QRLabel31.caption := trim(buscas.FieldByName('BAIRRO').AsString) +  ' - ' +
    FormatMaskText('00000\-999;0;', trim(buscas.FieldByName('CEP').AsString)) + ' - ' +
    trim(buscas.FieldByName('CIDADE').AsString) + ' / ' +
    trim(buscas.FieldByName('SIGLA_UF').AsString);
  if length(vDadosIni.extenso(dataSet.FieldByName('valordoc').AsFloat)) < 54 then
  begin
    frmFormPag2.QRLabel42.caption := vDadosIni.extenso(dataSet.FieldByName('valordoc').AsFloat) +
      vDadosIni.replicate('*', 54 - length(vDadosIni.extenso(dataSet.FieldByName('valordoc').AsFloat)));
    frmFormPag2.QRLabel43.caption := vDadosIni.replicate('*', 78);
  end
  else
  begin
    frmFormPag2.QRLabel42.caption := copy(vDadosIni.extenso(dataSet.FieldByName('valordoc').AsFloat), 1, 54);
    frmFormPag2.QRLabel43.caption := copy(vDadosIni.extenso(dataSet.FieldByName('valordoc').AsFloat), 55,
      length(vDadosIni.extenso(dataSet.FieldByName('valordoc').AsFloat)) - 54) +
      vDadosIni.replicate('*', 78 - (length(vDadosIni.extenso(dataSet.FieldByName('valordoc').AsFloat)) - 54));
  end;
  frmFormPag2.QRLabel3.Caption := vDadosIni.DataPorExtenso(dataSet.FieldByName('data_venc').AsDateTime);
end;

procedure TFormPag2.TitleBandPromissoriaDetBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := Trim(dataSet.FieldByName('tipdoc').AsString) = 'S2';
  if not PrintBand then
    exit;
  if (vDadosIni.vRecibo.HabRecPorDepart) and (Trim(dataSet.FieldByName('tpdocs').AsString) = 'REC') then
  begin
     buscas.Close;
     buscas.SQL.Text := ' select num_rec_dep from recibos  ' +
      ' where nrecibo = :nrecibo and cod_empresa = :cod_empresa ';
     buscas.ParamByName('nrecibo').AsInteger := dataSet.FieldByName('nrequisicao').AsInteger;
     buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
     buscas.Open;

    if not buscas.IsEmpty then
       frmDetalhamento.Qrlabel44.caption := vDadosIni.IfThen(trim(buscas.FieldByName('num_rec_dep').AsString) <> '',
         trim(buscas.FieldByName('num_rec_dep').AsString) + '-' + IntToStr(dataSet.FieldByName('nparcela').AsInteger),
         Trim(dataSet.FieldByName('ndoc').AsString))
    else
	    frmDetalhamento.Qrlabel44.caption := Trim(dataSet.FieldByName('ndoc').AsString);
  end
  else
  	frmDetalhamento.Qrlabel44.caption := Trim(dataSet.FieldByName('ndoc').AsString);
  frmDetalhamento.QRLabel45.caption := format('%n', [dataSet.FieldByName('valordoc').AsFloat]);
  frmDetalhamento.QRLabel46.caption := vDadosIni.vEmp.vRazaoSocial;
  if length(trim(vDadosIni.vEmp.vCNPJ)) = 11 then
    frmDetalhamento.QRLabel47.caption := copy(vDadosIni.vEmp.vCNPJ, 1, 3) + '.' +
      copy(vDadosIni.vEmp.vCNPJ, 4, 3) + '.' +
      copy(vDadosIni.vEmp.vCNPJ, 7, 3) + '-' +
      copy(vDadosIni.vEmp.vCNPJ, 10, 2)
  else
    frmDetalhamento.QRLabel47.caption := copy(vDadosIni.vEmp.vCNPJ, 1, 2) + '.' +
      copy(vDadosIni.vEmp.vCNPJ, 3, 3) + '.' +
      copy(vDadosIni.vEmp.vCNPJ, 6, 3) + '/' +
      copy(vDadosIni.vEmp.vCNPJ, 9, 4) + '-' +
      copy(vDadosIni.vEmp.vCNPJ, 13, 2);
  buscas.close;
  buscas.SQL.Text := ' select cl.RAZAO, cl.CPFCGC, cl.ENDERECO, cl.NUM_END_CLIENTE, cl.COMPLEMENTO, ' +
     ' coalesce(cd.nome_cidade, cl.cidade) CIDADE, ' +
     ' coalesce(bd.nome_bairro, cl.bairro) BAIRRO, ' +
     ' coalesce(est.sigla_uf, '''') SIGLA_UF, ' +
     ' cl.CEP from clientes cl ' +
     ' left join cidades cd on cd.cod_cidade = cl.cod_cidade ' +
     ' left join bairros bd on bd.cod_bairro = cl.cod_bairro ' +
     ' left join estados est on est.codigo_uf = cl.codigo_uf ' +
  	  ' where cl.cod_cliente  = ' + IntToStr(dataSet.FieldByName('cod_cliente').AsInteger) +
     ' and cl.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.open;
  frmDetalhamento.QRLabel51.caption := Copy(trim(buscas.FieldByName('RAZAO').AsString), 1, 39);
  if length(trim(buscas.FieldByName('CPFCGC').AsString)) = 11 then
    frmDetalhamento.QRLabel52.caption := copy(buscas.FieldByName('CPFCGC').AsString, 1, 3) + '.' +
      copy(buscas.FieldByName('CPFCGC').AsString, 4, 3) + '.' +
      copy(buscas.FieldByName('CPFCGC').AsString, 7, 3) + '-' +
      copy(buscas.FieldByName('CPFCGC').AsString, 10, 2)
  else
    frmDetalhamento.QRLabel52.caption := copy(buscas.FieldByName('CPFCGC').AsString, 1, 2) + '.' +
      copy(buscas.FieldByName('CPFCGC').AsString, 3, 3) + '.' +
      copy(buscas.FieldByName('CPFCGC').AsString, 6, 3) + '/' +
      copy(buscas.FieldByName('CPFCGC').AsString, 9, 4) + '-' +
      copy(buscas.FieldByName('CPFCGC').AsString, 13, 2);
  frmDetalhamento.QRLabel53.caption := trim(buscas.FieldByName('ENDERECO').AsString) + ', ' +
    trim(buscas.FieldByName('NUM_END_CLIENTE').AsString) +
    IfThen(trim(buscas.FieldByName('COMPLEMENTO').AsString) <> '',
      ' - ' + trim(buscas.FieldByName('COMPLEMENTO').AsString), '');
  frmDetalhamento.QRLabel31.caption := trim(buscas.FieldByName('BAIRRO').AsString) +  ' - ' +
    FormatMaskText('00000\-999;0;', trim(buscas.FieldByName('CEP').AsString)) + ' - ' +
    trim(buscas.FieldByName('CIDADE').AsString) + ' / ' +
    trim(buscas.FieldByName('SIGLA_UF').AsString);
  if length(vDadosIni.extenso(dataSet.FieldByName('valordoc').AsFloat)) < 54 then
  begin
    frmDetalhamento.QRLabel42.caption := vDadosIni.extenso(dataSet.FieldByName('valordoc').AsFloat) +
      vDadosIni.replicate('*', 54 - length(vDadosIni.extenso(dataSet.FieldByName('valordoc').AsFloat)));
    frmDetalhamento.QRLabel43.caption := vDadosIni.replicate('*', 75);
  end
  else
  begin
    frmDetalhamento.QRLabel42.caption := copy(vDadosIni.extenso(dataSet.FieldByName('valordoc').AsFloat), 1, 54);
    frmDetalhamento.QRLabel43.caption := copy(vDadosIni.extenso(dataSet.FieldByName('valordoc').AsFloat), 55,
      length(vDadosIni.extenso(dataSet.FieldByName('valordoc').AsFloat)) - 54) +
      vDadosIni.replicate('*', 78 - (length(vDadosIni.extenso(dataSet.FieldByName('valordoc').AsFloat)) - 54));
  end;
  frmDetalhamento.QRLabel3.Caption := vDadosIni.DataPorExtenso(dataSet.FieldByName('data_venc').AsDateTime);
end;

procedure TFormPag2.TitleBandReciboDetBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  buscas.close;
  buscas.SQL.Text := ' SELECT CLIENTES.COD_CLIENTE, CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.FONE_CLIENTE,  ' +
  	' CLIENTES.CPFCGC, CLIENTES.CEP, CLIENTES.ENDERECO, CLIENTES.NUM_END_CLIENTE, CLIENTES.COMPLEMENTO, ' +
    ' CLIENTES.COD_CIDADE, CASE WHEN (CIDADES.NOME_CIDADE IS NOT NULL) THEN CIDADES.NOME_CIDADE ELSE CLIENTES.CIDADE END CIDADE, ' +
    ' CLIENTES.COD_BAIRRO, CASE WHEN (BAIRROS.NOME_BAIRRO IS NOT NULL) THEN BAIRROS.NOME_BAIRRO ELSE CLIENTES.BAIRRO END BAIRRO, ' +
    ' CLIENTES.CODIGO_UF, ESTADOS.SIGLA_UF, ' +  
  	' RECIBOS.NRECIBO, RECIBOS.NUM_REC_DEP, RECIBOS.RECANT, ' +
    ' RECIBOS.DATA_REC, RECIBOS.COD_DEVEDOR, ' +
  	' RECIBOS.COD_BENEF, CIDADES.NOME_CIDADE, ' +
  	' RECIBOS.NOME_DEV, RECIBOS.VALOR, ' +
    ' RECIBOS.ATRAVES1, RECIBOS.ATRAVES2, RECIBOS.ATRAVES3, ' +
    ' RECIBOS.OBSERVACAO1, RECIBOS.OBSERVACAO2, RECIBOS.OBSERVACAO3, ' +
    ' RECIBOS.REFERENCIA1, RECIBOS.REFERENCIA2, RECIBOS.REFERENCIA3, RECIBOS.REFERENCIA4 FROM RECIBOS ' +
    ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = RECIBOS.COD_BENEF AND CLIENTES.COD_EMPRESA = RECIBOS.COD_EMPRESA ' +  
    ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
    ' LEFT JOIN BAIRROS ON BAIRROS.COD_BAIRRO = CLIENTES.COD_BAIRRO ' + 
    ' INNER JOIN ESTADOS ON ESTADOS.CODIGO_UF = CLIENTES.CODIGO_UF ' +
  	' WHERE RECIBOS.NRECIBO = ' + IntToStr(numRecibo) +
    ' AND RECIBOS.COD_EMPRESA = ' + vDadosIni.codEmpresa;
  buscas.Open;

  frmDetalhamento.qrl_nrecibo.Caption  := IntToStr(buscas.FieldByName('nrecibo').AsInteger);
  frmDetalhamento.qrl_nrecibo2.Caption := IntToStr(buscas.FieldByName('nrecibo').AsInteger);
  frmDetalhamento.qrl_nrecibo3.Caption := trim(buscas.FieldByName('num_rec_dep').AsString);
  frmDetalhamento.qrl_nrecibo4.Caption := trim(buscas.FieldByName('num_rec_dep').AsString);

  if trim(buscas.FieldByName('recant').AsString) = 'S' then
  begin
    frmDetalhamento.qrl_tiporec.Caption  := 'RECIBO ATENCIPADO';
    frmDetalhamento.qrl_tiporec2.Caption := 'RECIBO ATENCIPADO';
    frmDetalhamento.qrl_tiporec3.Caption := 'RECIBO ATENCIPADO';
    frmDetalhamento.qrl_tiporec4.Caption := 'RECIBO ATENCIPADO';
  end
  else
  begin
    frmDetalhamento.qrl_tiporec.Caption  := '';
    frmDetalhamento.qrl_tiporec2.Caption := '';
    frmDetalhamento.qrl_tiporec3.Caption := '';
    frmDetalhamento.qrl_tiporec4.Caption := '';
  end;

  frmDetalhamento.qrl_nome_cliente.caption  := Trim(buscas.FieldByName('nome_cliente').AsString);
  frmDetalhamento.qrl_nome_cliente2.caption := Trim(buscas.FieldByName('nome_cliente').AsString);
  frmDetalhamento.qrl_nome_cliente3.caption := Trim(buscas.FieldByName('nome_cliente').AsString);
  frmDetalhamento.qrl_nome_cliente4.caption := Trim(buscas.FieldByName('nome_cliente').AsString);

  frmDetalhamento.qrl_cpfcgc.caption  := 'CPF: ' + Trim(buscas.FieldByName('cpfcgc').AsString);
  frmDetalhamento.qrl_cpfcgc2.caption := 'CPF: ' + Trim(buscas.FieldByName('cpfcgc').AsString);
  frmDetalhamento.qrl_cpfcgc3.caption := 'CPF: ' + Trim(buscas.FieldByName('cpfcgc').AsString);
  frmDetalhamento.qrl_cpfcgc4.caption := 'CPF: ' + Trim(buscas.FieldByName('cpfcgc').AsString);

  frmDetalhamento.qrl_fone_cliente3.Caption := Trim(buscas.FieldByName('fone_cliente').AsString);
  frmDetalhamento.qrl_fone_cliente4.Caption := Trim(buscas.FieldByName('fone_cliente').AsString);

  frmDetalhamento.qrl_endereco.caption := Trim(buscas.FieldByName('endereco').AsString) + ', ' +
  	Trim(buscas.FieldByName('num_end_cliente').AsString) + ' ' +
    Trim(buscas.FieldByName('complemento').AsString) + ' - ' +
    Trim(buscas.FieldByName('bairro').AsString);
  frmDetalhamento.qrl_endereco2.caption := Trim(buscas.FieldByName('endereco').AsString) + ', ' +
	  Trim(buscas.FieldByName('num_end_cliente').AsString) + ' ' +
    Trim(buscas.FieldByName('complemento').AsString) + ' - ' +
    Trim(buscas.FieldByName('bairro').AsString);
  frmDetalhamento.qrl_endereco3.caption := Trim(buscas.FieldByName('endereco').AsString) + ', ' +
	  Trim(buscas.FieldByName('num_end_cliente').AsString) + ' ' +
    Trim(buscas.FieldByName('complemento').AsString) + ' - ' +
    Trim(buscas.FieldByName('bairro').AsString);
  frmDetalhamento.qrl_endereco4.caption := Trim(buscas.FieldByName('endereco').AsString) + ', ' +
	  Trim(buscas.FieldByName('num_end_cliente').AsString) + ' ' +
    Trim(buscas.FieldByName('complemento').AsString) + ' - ' +
    Trim(buscas.FieldByName('bairro').AsString);

  frmDetalhamento.qrl_cep_cidade_uf.caption :=
  	Trim(buscas.FieldByName('cep').AsString) + ' - ' +
  	Trim(buscas.FieldByName('cidade').AsString) + ' - ' +
    Trim(buscas.FieldByName('sigla_uf').AsString);
  frmDetalhamento.qrl_cep_cidade_uf2.caption :=
  	Trim(buscas.FieldByName('cep').AsString) + ' - ' +
  	Trim(buscas.FieldByName('cidade').AsString) + ' - ' +
    Trim(buscas.FieldByName('sigla_uf').AsString);
  frmDetalhamento.qrl_cep_cidade_uf3.caption :=
  	Trim(buscas.FieldByName('cep').AsString) + ' - ' +
  	Trim(buscas.FieldByName('cidade').AsString) + ' - ' +
    Trim(buscas.FieldByName('sigla_uf').AsString);
  frmDetalhamento.qrl_cep_cidade_uf4.caption :=
  	Trim(buscas.FieldByName('cep').AsString) + ' - ' +
  	Trim(buscas.FieldByName('cidade').AsString) + ' - ' +
    Trim(buscas.FieldByName('sigla_uf').AsString);
  
  frmDetalhamento.qrl_nome_dev.caption := Trim(buscas.FieldByName('nome_dev').AsString);
  frmDetalhamento.qrl_nome_dev2.caption := Trim(buscas.FieldByName('nome_dev').AsString);
  frmDetalhamento.qrl_nome_dev3.caption := Trim(buscas.FieldByName('nome_dev').AsString);
  frmDetalhamento.qrl_nome_dev4.caption := Trim(buscas.FieldByName('nome_dev').AsString);
  
  frmDetalhamento.qrl_valor.Caption := FormatFloat('##,##0.00', buscas.FieldByName('valor').AsFloat) + '  ' +
    vDadosIni.Extenso(buscas.FieldByName('valor').AsFloat);
  frmDetalhamento.qrl_valor2.Caption := FormatFloat('##,##0.00', buscas.FieldByName('valor').AsFloat) + '  ' +
    vDadosIni.Extenso(buscas.FieldByName('valor').AsFloat);
  frmDetalhamento.qrl_valor3.Caption := FormatFloat('##,##0.00', buscas.FieldByName('valor').AsFloat) + '  ' +
    vDadosIni.Extenso(buscas.FieldByName('valor').AsFloat);
  frmDetalhamento.qrl_valor4.Caption := FormatFloat('##,##0.00', buscas.FieldByName('valor').AsFloat) + '  ' +
    vDadosIni.Extenso(buscas.FieldByName('valor').AsFloat);

  frmDetalhamento.qrl_atraves1_3.Caption := Trim(buscas.FieldByName('atraves1').AsString);
  frmDetalhamento.qrl_atraves1_4.Caption := Trim(buscas.FieldByName('atraves1').AsString);

  frmDetalhamento.qrl_atraves2_3.Caption := Trim(buscas.FieldByName('atraves2').AsString);
  frmDetalhamento.qrl_atraves2_4.Caption := Trim(buscas.FieldByName('atraves2').AsString);

  frmDetalhamento.qrl_atraves3_3.Caption := Trim(buscas.FieldByName('atraves3').AsString);
  frmDetalhamento.qrl_atraves3_4.Caption := Trim(buscas.FieldByName('atraves3').AsString);

  frmDetalhamento.qrl_observacao1_3.Caption := Trim(buscas.FieldByName('observacao1').AsString);
  frmDetalhamento.qrl_observacao1_4.Caption := Trim(buscas.FieldByName('observacao1').AsString);

  frmDetalhamento.qrl_observacao2_3.Caption := Trim(buscas.FieldByName('observacao2').AsString);
  frmDetalhamento.qrl_observacao2_4.Caption := Trim(buscas.FieldByName('observacao2').AsString);

  frmDetalhamento.qrl_observacao3_3.Caption := Trim(buscas.FieldByName('observacao3').AsString);
  frmDetalhamento.qrl_observacao3_4.Caption := Trim(buscas.FieldByName('observacao3').AsString);

  frmDetalhamento.qrl_referencia1.Caption   := Trim(buscas.FieldByName('referencia1').AsString);
  frmDetalhamento.qrl_referencia1_2.Caption := Trim(buscas.FieldByName('referencia1').AsString);
  frmDetalhamento.qrl_referencia1_3.Caption := Trim(buscas.FieldByName('referencia1').AsString);
  frmDetalhamento.qrl_referencia1_4.Caption := Trim(buscas.FieldByName('referencia1').AsString);

  frmDetalhamento.qrl_referencia2.Caption   := Trim(buscas.FieldByName('referencia2').AsString);
  frmDetalhamento.qrl_referencia2_2.Caption := Trim(buscas.FieldByName('referencia2').AsString);
  frmDetalhamento.qrl_referencia2_3.Caption := Trim(buscas.FieldByName('referencia2').AsString);
  frmDetalhamento.qrl_referencia2_4.Caption := Trim(buscas.FieldByName('referencia2').AsString);

  frmDetalhamento.qrl_referencia3.Caption   := Trim(buscas.FieldByName('referencia3').AsString);
  frmDetalhamento.qrl_referencia3_2.Caption := Trim(buscas.FieldByName('referencia3').AsString);
  frmDetalhamento.qrl_referencia3_3.Caption := Trim(buscas.FieldByName('referencia3').AsString);
  frmDetalhamento.qrl_referencia3_4.Caption := Trim(buscas.FieldByName('referencia3').AsString);

  frmDetalhamento.qrl_referencia4.Caption   := Trim(buscas.FieldByName('referencia4').AsString);
  frmDetalhamento.qrl_referencia4_2.Caption := Trim(buscas.FieldByName('referencia4').AsString);
  frmDetalhamento.qrl_referencia4_3.Caption := Trim(buscas.FieldByName('referencia4').AsString);
  frmDetalhamento.qrl_referencia4_4.Caption := Trim(buscas.FieldByName('referencia4').AsString);

  frmDetalhamento.qrl_cidade_datarec.Caption := trim(buscas.FieldByName('nome_cidade').AsString) + ', ' +
    vDadosIni.DataPorExtenso(buscas.FieldByName('data_rec').AsDateTime);
  frmDetalhamento.qrl_cidade_datarec2.Caption := trim(buscas.FieldByName('nome_cidade').AsString) + ', ' +
    vDadosIni.DataPorExtenso(buscas.FieldByName('data_rec').AsDateTime);
  frmDetalhamento.qrl_cidade_datarec3.Caption := trim(buscas.FieldByName('nome_cidade').AsString) + ', ' +
    vDadosIni.DataPorExtenso(buscas.FieldByName('data_rec').AsDateTime);
  frmDetalhamento.qrl_cidade_datarec4.Caption := trim(buscas.FieldByName('nome_cidade').AsString) + ', ' +
    vDadosIni.DataPorExtenso(buscas.FieldByName('data_rec').AsDateTime);
end;

function TFormPag2.usarTransacaAvulsaPOSVirtual: Boolean;
var
  vRetorno: string;
  vAUT_, vNSU_, vTpVND_, vNumVND_, vTermADM_, vID_: string;
  vVl_: Extended;
  transacaoId: Integer;
  controleId: Integer;
begin
  Result := False;

  if not vDadosIni.PesqPros('FPG033', 'ALTERAR', FtipoVenda + ' ' + IntToStr(FnumeroVenda), 'TRANSACAO_CARTAO',
    '', buscas, True) then
    Exit;

  vRetorno := vDadosIni.getTransacaoAvulsaSelecaoPOSVirtual;
  if Trim(vRetorno) = '' then
    Exit;

  if getCampoPipe(vRetorno, 1) = 'VAZIO' then
    raiseExceptionCreate('Nenhuma transação selecionada', '');

  if getCampoPipe(vRetorno, 1) <> 'OK' then
    Exit;

  buscas.Close;
  buscas.SQL.Text := 'select * from TRANSACAO_CARTAO' +
    ' where SEQID = ' + IntToStr(StrToIntDef(getCampoPipe(vRetorno, 2), 0)) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and status = ''A''';
  buscas.Open;

  vTpVND_ := Trim(buscas.FieldByName('TPDOCS').AsString);
  vNumVND_ := Trim(buscas.FieldByName('NREQUISICAO').AsString);
  vAUT_ := Trim(buscas.FieldByName('N_AUT_CART').AsString);
  vNSU_ := Trim(buscas.FieldByName('N_DOCNSU_ADM').AsString);
  vVl_ := buscas.FieldByName('VALOR_OPERACAO').AsFloat;
  vTermADM_ := Trim(buscas.FieldByName('COD_TERMINAL_ADM').AsString);
  vID_:= IntToStr(buscas.FieldByName('SEQID').AsInteger);
  transacaoId := buscas.FieldByName('SEQID').AsInteger;
  controleId := buscas.FieldByName('COD_CONTROLE').AsInteger;

  vDadosIni.GravaAuditoria('FPG033', 'ALTERAR', 'VND SEL ' + vTpVND_ + ' ' + vNumVND_ + 'VL: ' + Format('%0.2n', [vVl_]) +
    '-AUT:' + vAUT_ + '-NSU:' + vNSU_, 'TRANSACAO_CARTAO', vID_, buscas2);

  if vDadosIni.StrToFloatFormat(buscas.FieldByName('VALOR_OPERACAO').AsFloat,2) >
    vDadosIni.StrToFloatFormat(FvalorQueFaltaInformar, 2) then
    if Application.MessageBox(PChar('Valor da operação avulsa maior que o valor pendente de recebimento' + #13 + #13 +
      'Valor da operação avulsa: ' + Format('%0.2f', [buscas.FieldByName('valor_operacao').AsFloat]) + #13 +
      'Valor pendente de recebimento: ' + Format('%0.2f', [FvalorQueFaltaInformar]) + #13 +
      'Deseja continuar mesmo assim?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

  vDadosIni.vPOSV.parcelas := buscas.FieldByName('PARCELAS').AsInteger;
  vDadosIni.vPOSV.retornoAUT := buscas.FieldByName('N_AUT_CART').AsString;
  vDadosIni.vPOSV.retornoNSU := buscas.FieldByName('N_DOCNSU_ADM').AsString;
  vDadosIni.vPOSV.retornoREDE := buscas.FieldByName('REDE').AsString;
  vDadosIni.vPOSV.retornoDataTransacao := FormatDateTime('dd/mm/yyyy', buscas.FieldByName('DATA_TRANSACAO').AsDateTime);
  vDadosIni.vPOSV.valorOperacao := buscas.FieldByName('VALOR_OPERACAO').AsFloat;
  vDadosIni.vPOSV.debitoCreditoOutros := buscas.FieldByName('operacao').AsString;
  vDadosIni.vPOSV.diasParaCredito := buscas.FieldByName('DIAS_PARA_CRED').AsInteger;
  vDadosIni.vPOSV.guidTrCartao := buscas.FieldByName('GUIDT').AsString;
  vDadosIni.vPOSV.idCarteiraDigital := buscas.FieldByName('ID_CARTDIG').AsString;

  if Application.MessageBox(PChar('Uma vez utilizada uma transação avulsa, não será mais possível utiliza-la novamente.' + #13 +
    'A transação selecionada será vinculada aos dados deste recebimento' + #13 + #13 +
    'Data da transação: ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', buscas.FieldByName('DATA_TRANSACAO').AsDateTime) + #13 +
    'Valor da operação: ' + Format('%0.2f', [buscas.FieldByName('valor_operacao').AsFloat]) + #13 +
    'Parcelas: ' + IntToStr(buscas.FieldByName('parcelas').AsInteger) + #13 +
    'Número de autorização: ' + buscas.FieldByName('N_AUT_CART').AsString + #13 +
    'Número do Documento Adm: ' + buscas.FieldByName('N_DOCNSU_ADM').AsString + #13 +
    'Terminal Adm: ' + buscas.FieldByName('COD_TERMINAL_ADM').AsString + #13 + #13 +
    'Deseja continuar mesmo assim?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  try
    vcontrole.HandleBoletoTEF(controleId, vDadosIni.vPOSV.idCarteiraDigital, vDadosIni.vPOSV.IdPSP, vDadosIni.vPOSV.CaptionRedeValor);

    if usarTransacaoPOSVirtualComoFormaPagamento(buscas.FieldByName('COD_TERMINAL_ADM').AsString) then
    begin

      fSecao := fSecao + 1;

      transacaoId := vDadosIni.gravaTransacaoPosVirtual(
        transacaoId,
        FtipoVenda,
        vTermADM_,
        FnumeroVenda,
        fSecao, vControle.DataSet.FieldByName('codigo_ctrl').AsInteger, buscas);

      if transacaoId > 0 then
      begin
        buscas.Transaction.Commit;

        buscas.Close;
        buscas.SQL.Text := 'select * from TRANSACAO_CARTAO' +
          ' where SEQID = ' + IntToStr(transacaoId) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.Open;

        vTpVND_ := Trim(buscas.FieldByName('TPDOCS').AsString);
        vNumVND_ := Trim(buscas.FieldByName('NREQUISICAO').AsString);
        vAUT_ := Trim(buscas.FieldByName('N_AUT_CART').AsString);
        vNSU_ := Trim(buscas.FieldByName('N_DOCNSU_ADM').AsString);
        vVl_ := buscas.FieldByName('VALOR_OPERACAO').AsFloat;
        vTermADM_ := Trim(buscas.FieldByName('COD_TERMINAL_ADM').AsString);
        vID_:= IntToStr(buscas.FieldByName('SEQID').AsInteger);

        vDadosIni.GravaAuditoria('FPG033', 'ALTERAR', 'SUCESSO - ' + vTpVND_ + ' ' + vNumVND_ + 'VL: ' + Format('%0.2n', [vVl_]) +
          '-AUT:' + vAUT_ + '-NSU:' + vNSU_, 'TRANSACAO_CARTAO', vID_, buscas2);
        buscas.Close;
        buscas2.Close;
      end;

      cancelar;
      Falteracao := False;
      Result := True;
    end;
  finally
    vControle.RestoreComandFP;
  end;
end;

function TFormPag2.usarTransacaoPOSVirtualComoFormaPagamento(pTerminalAdm: string): Boolean;
var
  vrTmp: string;
  vDiaVencimento: TDate;
  vVlDemais: Currency;
  vVlPrimeira: Currency;
  vCodBandeira: Integer;
  I: Integer;
begin
  try
    Result := True;

    FRef_Frete := False;
    if (FtipoVenda = 'MOT') then
      if vPlano.vDadosPlano.mot_Valor_frete > 0 then
      begin
        Application.ProcessMessages;
        FRef_Frete := Application.MessageBox('Este valor informado no cartão é referente a Frete/Seguro/Outras Despesas?',
          'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES;
      end;

    if vControle.fequals('docs', 'N') then //(vDadosIni.vPOSV.idCarteiraDigital) <> '' then
    begin

      Insert;

      DataSet.FieldByName('tipdoc').AsString := 'N';
      DataSet.FieldByName('tip_cnt').AsString := 'C';
      DataSet.FieldByName('data_venc').AsString := '';
      DataSet.FieldByName('historico').AsString := getHistorico;
      DataSet.FieldByName('valordoc').AsFloat := RoundTo(vDadosIni.vPOSV.valorOperacao, -2);
      DataSet.FieldByName('valor_contabil').AsFloat := RoundTo(vDadosIni.vPOSV.valorOperacao, -2);

      DataSet.FieldByName('TEF').AsString := 'S';
      DataSet.FieldByName('GUID_TR_CARTAO').AsString := vDadosIni.vPOSV.guidTrCartao;
      dataSet.FieldByName('PERMITIR_EXCLUIR').AsString := 'C';// Nao permite excluir ou alterar cartoes
      DataSet.FieldByName('N_AUT_CART').AsString := vDadosIni.vPOSV.retornoAUT;
      DataSet.FieldByName('N_DOCNSU_ADM').AsString := vDadosIni.vPOSV.retornoNSU;

      Inc(vseqform);
      dataSet.FieldByName('seqform').AsInteger :=  vseqform;

      DataSet.FieldByName('HISTORICO').AsString := BuildHistorico('', True);
      dataSet.Post;

    end
    else
    begin

      if Pos('/', vDadosIni.vPOSV.retornoDataTransacao) = 0 then
        vDadosIni.vPOSV.retornoDataTransacao := Copy(vDadosIni.vPOSV.retornoDataTransacao, 1, 2) + '/' +
          Copy(vDadosIni.vPOSV.retornoDataTransacao, 3, 2) + '/' +
          Copy(vDadosIni.vPOSV.retornoDataTransacao, 5, 4);

      vDiaVencimento := StrToDateDef(vDadosIni.vPOSV.retornoDataTransacao, Date) + vDadosIni.vPOSV.diasParaCredito;
      vVlDemais := (vDadosIni.vPOSV.valorOperacao / vDadosIni.vPOSV.parcelas) * 100; // antes de truncar acrescenta-se 2 casas decimais
      vVlDemais := vDadosIni.StrToFloatFormat(( 0.01 * Trunc( vVlDemais ) ) , 2);
      vVlPrimeira := vVlDemais + ( vDadosIni.vPOSV.valorOperacao - (vVlDemais * vDadosIni.vPOSV.parcelas));
      vVlPrimeira := vDadosIni.StrToFloatFormat( vVlPrimeira, 2);
      for I := 0 to vDadosIni.vPOSV.parcelas - 1 do
      begin

        Insert;
        dataSet.FieldByName('DATA_VENC').AsDateTime := vDiaVencimento;
        dataSet.FieldByName('NDOC').AsString := vDadosIni.StrZero(
          Integer(vDadosIni.retornoPorCondicao(FNum_Nf > 0, FNum_Nf, FnumeroVenda)), 6) + '-' + IntToStr( i + 1);
        if I = 0 then
        begin
          dataSet.FieldByName('VALORDOC').AsFloat := vVlPrimeira;
          DataSet.FieldByName('valor_contabil').AsFloat := vVlPrimeira;
        end
        else
        begin
          dataSet.FieldByName('VALORDOC').AsFloat := vVlDemais;
          DataSet.FieldByName('valor_contabil').AsFloat := vVlDemais;
        end;
        //if pControle > 0 then
          //dataSet.FieldByName('COD_CONTROLE').AsInteger := pControle;
        DataSet.FieldByName('COD_CLIENTE').AsInteger := FcodigoCliente;
        DataSet.FieldByName('CLIENTE').AsString := FnomeCliente;
        dataSet.FieldByName('TIPDOC').AsString := 'S2';
        //dataSet.FieldByName('HISTORICO').AsString := 'CREDITOS A RECEBER CONFORME ' + FtipoVenda + ' Nº ' + inttostr(FnumeroVenda);
        dataSet.FieldByName('TIP_CNT').AsString := 'C';
        Inc(vseqform);
        dataSet.FieldByName('SEQFORM').AsInteger := vseqform;//GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
        dataSet.FieldByName('PERMITIR_EXCLUIR').AsString := 'C';// Nao permite excluir ou alterar cartoes

        DataSet.FieldByName('N_AUT_CART').AsString := vDadosIni.vPOSV.retornoAUT;
        DataSet.FieldByName('NPARCELA').AsInteger := I + 1;
        DataSet.FieldByName('QTDE_PARC').AsInteger := vDadosIni.vPOSV.parcelas;
        DataSet.FieldByName('N_DOCNSU_ADM').AsString := vDadosIni.vPOSV.retornoNSU;

        if (DataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger <= 0) then
        begin
          vCodBandeira := vDadosIni.retornaDadosBandeira(
            vDadosIni.vPOSV.retornoREDE,
            StrToInt(vDadosIni.codEmpresa),
            0,
            '',
            buscas);

          if vCodBandeira > 0 then
          begin
          	DataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger := vCodBandeira;
            
          	SqlOpen(' select COD_BANDEIRA, DESCRICAO from BANDEIRAS_CARTAO ' +
            	' where COD_BANDEIRA = ' + IntToStr(vCodBandeira) +
				      ' and COD_EMPRESA = ' + vDadosIni.codEmpresa, buscas);

            if not buscas.IsEmpty then
            	DataSet.FieldByName('DESC_BANDEIRA').AsString := Copy(trim(buscas.FieldByName('DESCRICAO').AsString), 1, 50);
          end;
        end;

        if trim(pTerminalAdm) <> '' then
        begin
	        DataSet.FieldByName('COD_TERMINAL_ADM').AsString := pTerminalAdm;

          SqlOpen(' select TERM.COD_TERM_ADM, TERM.DESC_TERM_ADM, ' +
            ' ADM.COD_ADM, ADM.DESCRICAO_ADM from TERMINAL_CARTAO TERM ' +
          	' LEFT JOIN ADM_CARTAO ADM ON ADM.COD_ADM = TERM.COD_ADM AND ADM.COD_EMPRESA = TERM.COD_EMPRESA ' +
            ' where TERM.COD_TERM_ADM = ' + QuotedStr(pTerminalAdm) +
				    ' and TERM.COD_EMPRESA = ' + vDadosIni.codEmpresa, buscas);

          if not buscas.IsEmpty then
          begin
          	DataSet.FieldByName('DESC_TERMINAL_ADM').AsString := Copy(trim(buscas.FieldByName('DESC_TERM_ADM').AsString), 1, 30);
            DataSet.FieldByName('COD_ADM').AsInteger := buscas.FieldByName('COD_ADM').AsInteger;
          	DataSet.FieldByName('DESC_ADM').AsString := Copy(trim(buscas.FieldByName('DESCRICAO_ADM').AsString), 1, 30);
          end;
        end;
        DataSet.FieldByName('TEF').AsString := 'S';
        DataSet.FieldByName('GUID_TR_CARTAO').AsString := vDadosIni.vPOSV.guidTrCartao;
        DataSet.FieldByName('HISTORICO').AsString := BuildHistorico('', True);

        dataSet.Post;

        vDiaVencimento := vDiaVencimento + 30;

      end;
    end;
  except
    Result := False;
  end;
end;

function TFormPag2.utilizarCreditoEC(AOperacao: TOperacaoRecibo = orNormal; pLancarTarifa: boolean = false): boolean;
var
  vcodcontrole: Integer;
  vdocs: string;
  vnomecontrole: string;
  vcancelar: boolean;
  vUsarControlesVenda: string;
  ConfigPoliticaPag: TConfig_sistema_class;
begin
  try
    Result := True;

    if vEcommerce.dataSet.IsEmpty then
      exit;

    if AOperacao = orNormal then
      if not vDadosIni.PesqPros('FPG042', 'UTILIZAR',
       'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
       'FORMPAGAMENTO', '', buscas, True) then
        Exit;

    try
      vEcommerce.dataSet.Filter :=  'SEL = ''S'' ';
      vEcommerce.DataSet.Filtered := True;

      if vEcommerce.IsEmpty then
      begin
        Application.MessageBox(pchar('Nenhuma Formas de Pagamento E-Commerce selecionada!'),
          'Atenção', MB_OK + MB_ICONWARNING);
        exit;
      end;

      ConfigPoliticaPag := TConfig_sistema_class.getConf('ped_vnd_definir_politica_pagamento', buscas, vDadosIni.cod_empresa);
  		vUsarControlesVenda := UpperCase(ConfigPoliticaPag.ReadString('CONTROLE', 'Usar'));

      // Testar controles vinculados
      try
      	vEcommerce.dataSet.DisableControls;
        vEcommerce.dataSet.First;
        while not vEcommerce.dataSet.Eof do
        begin
          vcodcontrole := 0;
          vdocs := '';
          vnomecontrole := '';

          buscas.Close;
          buscas.SQL.Text := ' select inter.codigo_ctrl, ctrl.docs, ctrl.nome_ctrl from intermediador_controle_ec inter ' +
            ' inner join controles ctrl on ctrl.codigo_ctrl = inter.codigo_ctrl ' +
            '		and ctrl.codigo_emp = inter.cod_empresa ' +
            ' where inter.local_venda = ' + QuotedStr(trim(vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString)) +
            ' and inter.intermediador = ' + QuotedStr(trim(vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString)) +
            ' and inter.cod_empresa = ' + vDadosIni.codEmpresa;
          buscas.Open;

          if not buscas.IsEmpty then
          begin
            vcodcontrole := buscas.FieldByName('codigo_ctrl').AsInteger;
            vdocs := trim(buscas.FieldByName('docs').AsString);
            vnomecontrole := trim(buscas.FieldByName('nome_ctrl').AsString);
          end;

          if (vcodcontrole > 0) and (FCtrlVND > 0) and (vUsarControlesVenda = 'S') then
          begin
            buscas.Close;
            buscas.SQL.Text := ' select inter.codigo_ctrl, ctrl.docs, ctrl.nome_ctrl from intermediador_controle_ec inter ' +
              ' inner join controles ctrl on ctrl.codigo_ctrl = inter.codigo_ctrl ' +
              '		and ctrl.codigo_emp = inter.cod_empresa ' +
              ' where inter.local_venda = ' + QuotedStr(trim(vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString)) +
              ' and inter.intermediador = ' + QuotedStr(trim(vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString)) +
              ' and inter.cod_empresa = ' + vDadosIni.codEmpresa +
              ' and ctrl.codigo_ctrl = ' + IntToStr(FCtrlVND);
            buscas.Open;

            if buscas.IsEmpty then
            begin
              SqlOpen(' select ctrl.nome_ctrl from controles ctrl ' +
                ' where ctrl.codigo_ctrl = ' + IntToStr(FCtrlVND) +
                ' and ctrl.codigo_emp = ' + vDadosIni.codEmpresa, buscas);

              Application.MessageBox(pchar(
                'Controle vinculado ao intermediador de pagamento: ' + IntToStr(vcodcontrole) + ' - ' + trim(vnomecontrole) + #13 +
                'Controle definido(s) na venda: ' + IntToStr(FCtrlVND) + ' - ' + trim(buscas.FieldByName('NOME_CTRL').AsString) + #13 +
                'Local de Venda: ' + vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString + #13 +
                'Intermediador: ' + vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString),
                'Atenção', MB_OK + MB_ICONWARNING);
              exit;
            end;
          end
          else if (vcodcontrole > 0) and (trim(FformasCliente) <> '') and (vDadosIni.vEmp.vUsarControlesCliente = 'S') then
          begin
            buscas.Close;
            buscas.SQL.Text := ' select inter.codigo_ctrl, ctrl.docs, ctrl.nome_ctrl from intermediador_controle_ec inter ' +
              ' inner join controles ctrl on ctrl.codigo_ctrl = inter.codigo_ctrl ' +
              '		and ctrl.codigo_emp = inter.cod_empresa ' +
              ' where inter.local_venda = ' + QuotedStr(trim(vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString)) +
              ' and inter.intermediador = ' + QuotedStr(trim(vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString)) +
              ' and inter.cod_empresa = ' + vDadosIni.codEmpresa +
              ' and ctrl.codigo_ctrl in ' + FformasCliente;
            buscas.Open;

            if buscas.IsEmpty then
            begin
              Application.MessageBox(pchar('Controle vinculado ao intermediador de pagamento: ' + IntToStr(vcodcontrole) + ' - ' + trim(vnomecontrole) + #13 +
                'Controle(s) definido(s) no cliente: ' + trim(StringReplace(StringReplace(FformasCliente, '(', '', [rfReplaceAll]), ')', '', [rfReplaceAll])) + #13 +
                'Local de Venda: ' + vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString + #13 +
                'Intermediador: ' + vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString + #13 + #13 +
                'Favor verificar antes de continuar.'),
                'Atenção', MB_OK + MB_ICONWARNING);
              exit;
            end;
          end;

          if (vcodcontrole <= 0) then
          begin
            Application.MessageBox(pchar('Local de Venda e Intermediador não esta vinculado a nenhum controle, favor vincular antes de continuar ' +  #13 + #13 +
        	    'Local de Venda: ' + vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString + #13 +
              'Intermediador: ' + vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString),
              'Atenção', MB_OK + MB_ICONWARNING);

            vDadosIni.vPesquisaInterPag := vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString;
            vDadosIni.vPesquisaMetodoId := vEcommerce.dataSet.FieldByName('METODO_PAG_ID').AsInteger;
            vVincIntermPag._cadVincIntermPag(0, '');

            buscas.Close;
            buscas.SQL.Text := ' select inter.codigo_ctrl, ctrl.docs, ctrl.nome_ctrl from intermediador_controle_ec inter ' +
              ' inner join controles ctrl on ctrl.codigo_ctrl = inter.codigo_ctrl ' +
              '		and ctrl.codigo_emp = inter.cod_empresa ' +
              ' where inter.local_venda = ' + QuotedStr(trim(vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString)) +
              ' and inter.intermediador = ' + QuotedStr(trim(vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString)) +
              ' and inter.cod_empresa = ' + vDadosIni.codEmpresa;
            buscas.Open;

            if not buscas.IsEmpty then
            begin
              vcodcontrole := buscas.FieldByName('codigo_ctrl').AsInteger;
              vdocs := trim(buscas.FieldByName('docs').AsString);
              vnomecontrole := trim(buscas.FieldByName('nome_ctrl').AsString);
            end;

            if (vcodcontrole > 0) and (FCtrlVND > 0) and (vUsarControlesVenda = 'S') then
            begin
            	buscas.Close;
              buscas.SQL.Text := ' select inter.codigo_ctrl, ctrl.docs, ctrl.nome_ctrl from intermediador_controle_ec inter ' +
                ' inner join controles ctrl on ctrl.codigo_ctrl = inter.codigo_ctrl ' +
                '		and ctrl.codigo_emp = inter.cod_empresa ' +
                ' where inter.local_venda = ' + QuotedStr(trim(vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString)) +
                ' and inter.intermediador = ' + QuotedStr(trim(vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString)) +
                ' and inter.cod_empresa = ' + vDadosIni.codEmpresa +
                ' and ctrl.codigo_ctrl = ' + IntToStr(FCtrlVND);
              buscas.Open;

              if buscas.IsEmpty then
              begin
              	SqlOpen(' select ctrl.nome_ctrl from controles ctrl ' +
                	' where ctrl.codigo_ctrl = ' + IntToStr(FCtrlVND) +
                  ' and ctrl.codigo_emp = ' + vDadosIni.codEmpresa, buscas);

              	Application.MessageBox(pchar(
                	'Controle vinculado ao intermediador de pagamento: ' + IntToStr(vcodcontrole) + ' - ' + trim(vnomecontrole) + #13 +
                	'Controle definido(s) na venda: ' + IntToStr(FCtrlVND) + ' - ' + trim(buscas.FieldByName('NOME_CTRL').AsString) + #13 +
						    	'Local de Venda: ' + vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString + #13 +
                  'Intermediador: ' + vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString),
                  'Atenção', MB_OK + MB_ICONWARNING);
                exit;
              end;
            end
            else if (vcodcontrole > 0) and (trim(FformasCliente) <> '') and (vDadosIni.vEmp.vUsarControlesCliente = 'S') then
            begin
            	buscas.Close;
              buscas.SQL.Text := ' select inter.codigo_ctrl, ctrl.docs, ctrl.nome_ctrl from intermediador_controle_ec inter ' +
                ' inner join controles ctrl on ctrl.codigo_ctrl = inter.codigo_ctrl ' +
                '		and ctrl.codigo_emp = inter.cod_empresa ' +
                ' where inter.local_venda = ' + QuotedStr(trim(vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString)) +
                ' and inter.intermediador = ' + QuotedStr(trim(vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString)) +
                ' and inter.cod_empresa = ' + vDadosIni.codEmpresa +
                ' and ctrl.codigo_ctrl in ' + FformasCliente;
              buscas.Open;

              if buscas.IsEmpty then
              begin
              	Application.MessageBox(pchar('Controle vinculado ao intermediador de pagamento: ' + IntToStr(vcodcontrole) + ' - ' + trim(vnomecontrole) + #13 +
                	'Controle(s) definido(s) no cliente: ' + trim(StringReplace(StringReplace(FformasCliente, '(', '', [rfReplaceAll]), ')', '', [rfReplaceAll])) + #13 +
                  'Local de Venda: ' + vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString + #13 +
                  'Intermediador: ' + vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString + #13 + #13 +
                  'Favor verificar antes de continuar.'),
                  'Atenção', MB_OK + MB_ICONWARNING);
                exit;
              end;
            end;
          end;

          if (vcodcontrole <= 0) then
          begin
            Application.MessageBox(pchar('Local de Venda e Intermediador não esta vinculado a nenhum controle favor vincular: ' +  #13 + #13 +
            	'Local de Venda: ' + vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString + #13 +
              'Intermediador: ' + vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString),
              'Atenção', MB_OK + MB_ICONWARNING);
            exit;
          end
          else
          begin
          	try
              vControle.dataSet.Filter :=  'CODIGO_CTRL = ' + IntToStr(vcodcontrole);
              vControle.DataSet.Filtered := True;

              if vControle.dataSet.FieldByName('CODIGO_CTRL').AsInteger <= 0 then
              begin
                Application.MessageBox(pchar('Controle ' + IntToStr(vcodcontrole) + ' - ' + Trim(vnomecontrole) +
                  ' foi vinculado ao local de venda ' + trim(vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString) +
                  ' e intermediador ' + trim(vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString) + ':' + #13 + #13 +
                  ' O controle não listado nas opções de recebimento, favor verificar antes de continuar.'),
                  'Erro', MB_OK + MB_ICONERROR);
                exit;
              end;
            finally
              vControle.DataSet.Filtered := False;
            end;
          end;

          vEcommerce.dataSet.Next;
        end;
      finally
        vEcommerce.dataSet.EnableControls;
      end;

      try
      	vEcommerce.dataSet.DisableControls;
        vEcommerce.dataSet.First;
        while not vEcommerce.dataSet.Eof do
        begin
           vcancelar := false;

           vcodcontrole := 0;
           vdocs := '';
           vnomecontrole := '';

           buscas.Close;
           buscas.SQL.Text := ' select inter.codigo_ctrl, ctrl.docs, ctrl.nome_ctrl from intermediador_controle_ec inter ' +
             ' inner join controles ctrl on ctrl.codigo_ctrl = inter.codigo_ctrl ' +
             '		and ctrl.codigo_emp = inter.cod_empresa ' +
             ' where inter.local_venda = ' + QuotedStr(trim(vEcommerce.dataSet.FieldByName('LOCAL_VENDA').AsString)) +
             ' and inter.intermediador = ' + QuotedStr(trim(vEcommerce.dataSet.FieldByName('INTERMEDIADOR').AsString)) +
             ' and inter.cod_empresa = ' + vDadosIni.codEmpresa;
           buscas.Open;

           if not buscas.IsEmpty then
           begin
             vcodcontrole := buscas.FieldByName('codigo_ctrl').AsInteger;
             vdocs := trim(buscas.FieldByName('docs').AsString);
             vnomecontrole := trim(buscas.FieldByName('nome_ctrl').AsString);
           end;

           try
             vControle.dataSet.Filter :=  'CODIGO_CTRL = ' + IntToStr(vcodcontrole);
             vControle.DataSet.Filtered := True;

             if not vcancelar then
               if not habilitaControlesFormaPagamento(true, true) then
                 vcancelar := true;

             if not vcancelar then
               if not habilitaControlesFormaPagamentoEC then
                 vcancelar := true;

             if not vcancelar then
             begin
               vEcommerce.dataSet.Edit;
               vEcommerce.dataSet.FieldByName('UTILIZADO').AsString := 'S';
               vEcommerce.dataSet.FieldByName('COD_CONTROLE').AsInteger := vcodcontrole;
               vEcommerce.dataSet.FieldByName('NOME_CTRL').AsString := vnomecontrole;
               vEcommerce.dataSet.FieldByName('DOCS').AsString := vdocs;
               vEcommerce.dataSet.Post;
             end
             else
               cancelar;
           finally
             vControle.DataSet.Filtered := False;
           end;

           vEcommerce.dataSet.Next;
        end;
      finally
        vEcommerce.dataSet.EnableControls;
      end;

      if pLancarTarifa then
        if not lancarTarifaInterm then
          exit;

      vEcommerce.dataSet.Filter :=  'UTILIZADO = ''S'' ';
      vEcommerce.DataSet.Filtered := True;

      try
      	vEcommerce.dataSet.DisableControls;
        vEcommerce.dataSet.First;
        while not vEcommerce.dataSet.Eof do
        begin
          vEcommerce.dataSet.Edit;
          vEcommerce.dataSet.FieldByName('SEL').AsString := '';
          vEcommerce.dataSet.Post;

          vEcommerce.dataSet.Next;
        end;
      finally
        vEcommerce.dataSet.EnableControls;
      end;
    finally
      vControle.DataSet.Filtered := False;
      vEcommerce.DataSet.Filtered := False;
      vControle.DataSet.IndexFieldNames := 'CODIGO_CTRL';
      vEcommerce.DataSet.IndexFieldNames := 'METODO_PAG_ID';
      cancelar;
    end;

    Result := true;
  except
    on e: exception do
    begin
      vControle.DataSet.IndexFieldNames := 'CODIGO_CTRL';
      result := false;
      Application.MessageBox(pchar('Erro ao utilizar formas E-Commerce. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('EFPG0023 ' + e.Message);
    end;
  end;
end;

function TFormPag2.utilizarValePrgFid(AOperacao: TOperacaoRecibo): boolean;
var
  vvalorvale: Double;
begin
  try
    try
      Result := false;
      vvalorvale := 0;
      
      if AOperacao = orNormal then
        if not vDadosIni.PesqPros('FPG049', 'UTILIZAR',
         'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
         'FORMPAGAMENTO', '', buscas, True) then
          Exit;

      vValeCupomPrgFid.dataSet.Filter := 'sel = ''S'' ';
      vValeCupomPrgFid.dataSet.Filtered := True;

      if vValeCupomPrgFid.dataSet.IsEmpty then
      begin
        Application.MessageBox(pchar('Nenhum vale selecionado!'), 'Atenção', MB_ICONERROR + MB_OK);
        exit;
      end;

      try
      	vValeCupomPrgFid.dataSet.DisableControls;
        vValeCupomPrgFid.dataSet.First;
        while not vValeCupomPrgFid.dataSet.Eof do
        begin
          if (vValeCupomPrgFid.dataSet.FieldByName('valor').AsFloat > 0) then
            vvalorvale := vvalorvale + vValeCupomPrgFid.dataSet.FieldByName('valor').AsFloat
          else
          begin
            SqlOpen('select coalesce(r.valor, 0) valor from vale_cupons vl ' +
              ' inner join regras_vale_troca_prog_fid r on ' +
              ' 	vl.pontos = r.pontos and vl.cod_empresa = vl.cod_empresa ' +
              ' left join empresa_prog_fid empg on vl.cod_empresa = empg.cod_empresa ' +
              ' where vl.codigo = ' + QuotedStr(vValeCupomPrgFid.dataSet.FieldByName('codigo').AsString) +
              ' and vl.cod_empresa in ' +
              '		(case when (empg.cod_empresa > 0) then empg.cod_empresa else ' + vDadosIni.codEmpresa + ' end) ');

            if buscas.IsEmpty then
            begin
              Application.MessageBox(pchar('Nenhuma regra definida para pontuação do vale selecionado: ' + #13 +
                'Valor de pontos: ' + IntToStr(Trunc(vValeCupomPrgFid.dataSet.FieldByName('pontos').AsFloat))),
                'Atenção', MB_ICONERROR + MB_OK);
              exit;
            end;
            vvalorvale := vvalorvale + buscas.FieldByName('valor').AsFloat;
          end;

          vValeCupomPrgFid.dataSet.Next;
        end;
      finally
        vValeCupomPrgFid.dataSet.EnableControls;
      end;

      if (vvalorvale > FvalorQueFaltaInformar) then
      begin
        Application.MessageBox(pchar('Valor dos vales selecionados é maior que o valor a informar, favor verificar: ' + #13 +
					'Valor dos vales: R$ ' + FormatFloat('0.00', vvalorvale) + #13 +
          'Valor a informar: R$ ' + FormatFloat('0.00', FvalorQueFaltaInformar)), 'Atenção', MB_ICONERROR + MB_OK);
        exit;
      end;

      if not habilitaControlesFormaPagamento(false, false, true) then
       exit;
       
      if not habilitaControlesFormaPagamentoValeProgFid(AOperacao, vvalorvale) then
        exit;

      try
      	vValeCupomPrgFid.dataSet.DisableControls;
        vValeCupomPrgFid.dataSet.First;
        while not vValeCupomPrgFid.dataSet.Eof do
        begin
          vValeCupomPrgFid.dataSet.Edit;
          vValeCupomPrgFid.dataSet.FieldByName('ndoc').AsInteger := FnumeroVenda;
          vValeCupomPrgFid.dataSet.FieldByName('tipodoc').AsString := FtipoVenda;
          vValeCupomPrgFid.dataSet.FieldByName('cod_emp_tipodoc').AsInteger := StrToInt(vDadosIni.codEmpresa);
          vValeCupomPrgFid.dataSet.Post;

          vValeCupomPrgFid.dataSet.Next;
        end;
      finally
        vValeCupomPrgFid.dataSet.EnableControls;
      end;
      if not vValeCupomPrgFid.Apply then
      	CancelUpdates;
    finally
      vValeCupomPrgFid.dataSet.Filtered := false;
      vValeCupomPrgFid.dataSet.IndexFieldNames := 'DATAHORA';
      vValeCupomPrgFid.dataSet.First;

      try
      	vValeCupomPrgFid.dataSet.DisableControls;
        vValeCupomPrgFid.dataSet.First;
        while not vValeCupomPrgFid.dataSet.Eof do
        begin
          vValeCupomPrgFid.dataSet.Edit;
          vValeCupomPrgFid.dataSet.FieldByName('sel').AsString := '';
          vValeCupomPrgFid.dataSet.Post;

          vValeCupomPrgFid.dataSet.Next;
        end;
      finally
        vValeCupomPrgFid.dataSet.EnableControls;
      end;
    end;

    Result := true;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TFormPag2.validaInclusaoNovosBoletos: Boolean;
begin
  Result := True;
  if Trim(vControle.dataSet.FieldByName('usar_boleto').AsString) <> 'S' then
    Exit;

  try
    dataSet.Filter := 'COD_CONTROLE  = ' + IntToStr(vControle.dataSet.FieldByName('CODIGO_CTRL').AsInteger);
    dataSet.Filtered := True;

    if dataSet.IsEmpty then
      Exit;

    Result := False;
    Application.MessageBox(PChar('Controle configurado como boleto bancário!' + #13 +
      'Já foi gerado registro(s) para este controle.' + #13 +
      'Somente pode ser gerado uma vez as parcelas para cada controle configurado como boleto' + #13 + #13 +
      'Por favor, informe todo o valor de uma só vez e se necessário altere o valor das parcelas'),
      'Atenção', 0 + 64);
  finally
    dataSet.Filter := '';
    dataSet.Filtered := False;
  end;
end;

function TFormPag2.validaPlanoVeiculos: boolean;
var
  vStringPlano: TStringList;
  vOK: Boolean;
  vInd: string;
  I: Integer;
  J: Integer;
  vValorTemp: Currency;
begin
  vStringPlano := TStringList.Create;
  vStringPlano.Clear;

  vDtSet.First;
  while not vDtSet.Eof do
  begin
    vOK := True;
    vInd := 'C';
    if Trim(vDtSet.FieldByName('ref_frete').AsString) = 'F' then
      vInd := 'F'
    else if Trim(vDtSet.FieldByName('rec_tipvend').AsString) <> '' then
      vInd := 'RA'
    else if Trim(vDtSet.FieldByName('ref_frete').AsString) = 'M' then
      vInd := 'MT'
    else if (Trim(vDtSet.FieldByName('tipdoc').AsString) = 'N') and
      (vDtSet.FieldByName('cod_controle').AsInteger = 1) and
      (Trim(vDtSet.FieldByName('ref_frete').AsString) = '') then
      vInd := 'D';
    for I := 0 to vStringPlano.Count - 1 do
    begin
      if (vInd <> 'C') then
      begin
        if (getCampoPipe(vStringPlano[i], 1) = vInd) then
        begin
          vStringPlano[I] :=
            getCampoPipe(vStringPlano[i], 1) + '|' +
            getCampoPipe(vStringPlano[i], 2) + '|' +
            StringReplace(FloatToStr(
            vDtSet.FieldByName('valordoc').AsFloat +
            StrToFloat(getCampoPipe(vStringPlano[i], 3)))
            , '.', '', [rfReplaceAll]) + '|';
          vOK := False;
          break;
        end;
      end
      else
      begin
        if (getCampoPipe(vStringPlano[i], 1) = 'C') and
          (getCampoPipe(vStringPlano[i], 2) = vDtSet.FieldByName('cod_controle').AsString) then
        begin
          vStringPlano[I] :=
            getCampoPipe(vStringPlano[i], 1) + '|' +
            getCampoPipe(vStringPlano[i], 2) + '|' +
            StringReplace(FloatToStr(
            vDtSet.FieldByName('valordoc').AsFloat +
            StrToFloat(getCampoPipe(vStringPlano[i], 3)))
            , '.', '', [rfReplaceAll]) + '|';
          vOK := False;
          Break;
        end;
      end;

      {if (getCampoPipe(vStringPlano[i],1) = vInd) then
      begin
        if (getCampoPipe(vStringPlano[i],1) = 'C') AND
          (getCampoPipe(vStringPlano[i],2) = vDtSet.FieldByName('cod_controle').AsString) then
        begin
          vStringPlano[I] :=
            getCampoPipe(vStringPlano[i],1)+'|'+
            getCampoPipe(vStringPlano[i],2)+'|'+
            StringReplace( FloatToStr(
              vDtSet.FieldByName('valordoc').AsFloat +
              StrToFloat(getCampoPipe(vStringPlano[i],3)))
              ,'.','',[rfReplaceAll])+'|';
          vOK := False;
        end
        else
        begin
          vStringPlano[I] :=
            getCampoPipe(vStringPlano[i],1)+'|'+
            getCampoPipe(vStringPlano[i],2)+'|'+
            StringReplace( FloatToStr(
              vDtSet.FieldByName('valordoc').AsFloat +
              StrToFloat(getCampoPipe(vStringPlano[i],3)))
              ,'.','',[rfReplaceAll])+'|';
          vOK := False;
        end;
      end;}
    end;
    if vOK then
    begin
      vStringPlano.Add(
        vInd + '|' +
        vDtSet.FieldByName('cod_controle').AsString + '|' +
        StringReplace(vDtSet.FieldByName('valordoc').AsString, '.', '', [rfReplaceAll]) + '|');
    end;
    vDtSet.Next;
  end;

  for I := 0 to FStringPlano.Count - 1 do
  begin
    vValorTemp := 0;
    if getCampoPipe(FStringPlano[i], 1) = 'C' then
    begin
      for J := 0 to vStringPlano.Count - 1 do
      begin
        if getCampoPipe(vStringPlano[j], 1) = 'C' then
        begin
          if getCampoPipe(vStringPlano[j], 2) = getCampoPipe(FStringPlano[I], 2) then
            vValorTemp := vValorTemp + StrToFloat(getCampoPipe(vStringPlano[j], 3));
        end;
      end;
      //      if Format('%0.2f',[vValorTemp]) <>
      //        Format('%0.2f',[StrToFloat(getCampoPipe(FStringPlano[i],6))]) then
      if vDadosIni.StrToFloatFormat(vValorTemp, 2) <
        vDadosIni.StrToFloatFormat(StrToFloat(getCampoPipe(FStringPlano[i], 6)), 2) then
      begin
        Application.MessageBox(pchar('Valor recebido menor do que o valor exigido.' + #13 +
          'Controle ' + getCampoPipe(FStringPlano[i], 2) + ' ' + getCampoPipe(FStringPlano[i], 4) + #13 +
          'Valor esperado: ' + getCampoPipe(FStringPlano[i], 6) + #13 +
          'Valor recebido: ' + Format('%0.2f', [vValorTemp])), 'Atenção', 0 + 64);
        Result := False;
        Exit;
      end;
    end
    else if getCampoPipe(FStringPlano[i], 1) = 'F' then
    begin
      for J := 0 to vStringPlano.Count - 1 do
        if getCampoPipe(vStringPlano[j], 1) = 'F' then
          vValorTemp := vValorTemp + StrToFloat(getCampoPipe(vStringPlano[j], 3));
      //      if Format('%0.2f',[vValorTemp]) <>
      //        Format('%0.2f',[StrToFloat(getCampoPipe(FStringPlano[i],6))]) then
      if vDadosIni.StrToFloatFormat(vValorTemp, 2) <
        vDadosIni.StrToFloatFormat(StrToFloat(getCampoPipe(FStringPlano[i], 6)), 2) then
      begin
        Application.MessageBox(pchar('Valor recebido para Frete/Seguro/Outras Despesas menor que o valor exigido.' + #13 +
          'Valor esperado: ' + getCampoPipe(FStringPlano[i], 6) + #13 +
          'Valor recebido: ' + Format('%0.2f', [vValorTemp])), 'Atenção', 0 + 64);
        Result := False;
        Exit;
      end;
    end
    else if getCampoPipe(FStringPlano[i], 1) = 'RA' then
    begin
      for J := 0 to vStringPlano.Count - 1 do
        if getCampoPipe(vStringPlano[j], 1) = 'RA' then
          vValorTemp := vValorTemp + StrToFloat(getCampoPipe(vStringPlano[j], 3));
      //      if Format('%0.2f',[vValorTemp]) <>
      //        Format('%0.2f',[StrToFloat(getCampoPipe(FStringPlano[i],6))]) then
      if vDadosIni.StrToFloatFormat(vValorTemp, 2) <
        vDadosIni.StrToFloatFormat(StrToFloat(getCampoPipe(FStringPlano[i], 6)), 2) then
      begin
        Application.MessageBox(pchar('Valor recebido para Recibo Antecipado menor que o valor exigido.' + #13 +
          'Valor esperado: ' + getCampoPipe(FStringPlano[i], 6) + #13 +
          'Valor recebido: ' + Format('%0.2f', [vValorTemp])), 'Atenção', 0 + 64);
        Result := False;
        Exit;
      end;
    end
    else if getCampoPipe(FStringPlano[i], 1) = 'D' then
    begin
      for J := 0 to vStringPlano.Count - 1 do
        if getCampoPipe(vStringPlano[j], 1) = 'D' then
          vValorTemp := vValorTemp + StrToFloat(getCampoPipe(vStringPlano[j], 3));
      //      if Format('%0.2f',[vValorTemp]) <>
      //        Format('%0.2f',[StrToFloat(getCampoPipe(FStringPlano[i],6))]) then
      if vDadosIni.StrToFloatFormat(vValorTemp, 2) <
        vDadosIni.StrToFloatFormat(StrToFloat(getCampoPipe(FStringPlano[i], 6)), 2) then
      begin
        Application.MessageBox(pchar('Valor recebido para Dinheiro menor que o valor exigido.' + #13 +
          'Valor esperado: ' + getCampoPipe(FStringPlano[i], 6) + #13 +
          'Valor recebido: ' + Format('%0.2f', [vValorTemp])), 'Atenção', 0 + 64);
        Result := False;
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TFormPag2.validarPossivelTroco(DuranteConfirmacao: Boolean): Boolean;
var
  vPossivelTroco, vSomaDinheiro, vValorDigitado, vTrocoCalculado, vValorAlteracao: Double;
  I: Integer;
begin
  Result := False;
  if DuranteConfirmacao then
  begin
    if vDadosIni.StrToFloatFormat(FvalorTroco, 2) > vDadosIni.StrToFloatFormat(FvalorTotalDinheiro, 2) then
    begin
      Application.MessageBox(PChar('Valor de Troco maior que o disponível em dinheiro no recebimento' + #13 +
        'Calculado ' + Format('%0.2n', [FvalorTroco]) + #13 +
        'Permitido ' + Format('%0.2n', [FvalorTotalDinheiro])), 'Erro', MB_ICONEXCLAMATION + MB_OK);
      if not vDadosIni.PesqPros('FPG034', 'VALIDAR', FtipoVenda + ' ' + IntToStr(FnumeroVenda) +
        ' TRC: ' + Format('%0.2n', [FvalorTroco]) + ' DIN: ' + Format('%0.2n', [FvalorTotalDinheiro]),
        'FORMPAGAMENTO', '', buscas, True, True) then
        Exit;
    end;
    Result := True;
    Exit;
  end;
  Result := True;

  vPossivelTroco := FvalorTotalDinheiro;
  if vControle.DataSet.FieldByName('codigo_ctrl').AsInteger = 1 then
  begin
    vValorDigitado := FcarteiraValorDinheiro;
    vPossivelTroco := vPossivelTroco + vValorDigitado;
    if alteracao then
      vPossivelTroco := vPossivelTroco - DataSet.FieldByName('valordoc').AsFloat;
  end
  else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'N' then
    vValorDigitado := FcarteiraValorDinheiro
  else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
    vValorDigitado := FchequeValorCheque
  else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S2' then
  begin
    vValorDigitado := 0;
     for i := 0 to vQtde - 1 do
       if Length(vValor) > 0 then
         if vDadosIni.StrToFloatFormat(vValor[i], 2) > 0 then
           vValorDigitado := vValorDigitado + vValor[i];
  end;

  if alteracao then
    vValorAlteracao := dataSet.FieldByName('valordoc').AsFloat
  else
    vValorAlteracao := 0;

  vTrocoCalculado := ((FvalorInformado - vValorAlteracao) + vValorDigitado - FvalorVenda);

  if vDadosIni.StrToFloatFormat(vTrocoCalculado, 2) > vDadosIni.StrToFloatFormat(vPossivelTroco, 2) then
    if vTrocoCalculado > 0 then
      Application.MessageBox(PChar('Valor de Troco maior que o disponível em dinheiro no recebimento' + #13 +
        'Calculado ' + Format('%0.2n', [vTrocoCalculado]) + #13 +
        'Permitido ' + Format('%0.2n', [vPossivelTroco])), 'Atenção', MB_ICONINFORMATION + MB_OK);
end;

function TFormPag2.verificaBoletos: Boolean;
var
  vBol: TBoletasFP;
  vSeq, vQtdeBol: Integer;
  vDif, vValorAbater, vSomaBol: Extended;
  vGerouRemessa: Boolean;
begin
  Result := True;
  fReimprimirBoletosAlterados := False;
  if (FvalorInformado >= FvalorVenda) and (fValorValeCompraAutomatico = 0) then
    Exit;
  //  if (FtipoVenda <> 'NF') and ((FNum_Nf = 0) and (FtipoVenda <> 'REC')) then
  if (FtipoVenda = 'NF') or ((FNum_Nf > 0) and (FtipoVenda = 'REC')) then
  begin
    if (FvalorInformado >= FvalorVenda) then
      Exit;
  end
  else
  begin
    if (FtipoVenda <> 'REQ') and (FtipoVenda <> 'OS') and (FtipoVenda <> 'MOT') then
      Exit;

    vBol := TBoletasFP.create;
    vBol.selecionaBoletasFp(FNum_Nf, FSerie_Nf);
    if vBol.dataSet.IsEmpty then
    begin
      if Trim(FtipoVenda) = 'OS' then
      begin
        vBol.selecionaBoletasOSFp(FnumeroVenda);
        if vBol.dataSet.IsEmpty then
          Exit;
      end
      else
        Exit;
    end;

    vSomaBol := 0;
    vGerouRemessa := False;
    try
    	vBol.dataSet.DisableControls;
      vBol.dataSet.First;
      while not vBol.dataSet.Eof do
      begin
        vSomaBol := vSomaBol + vBol.dataSet.FieldByName('VL_DOC_BOL').AsFloat;
        if (vBol.dataSet.FieldByName('remessa_enviada').AsString = 'S') and (not vGerouRemessa) then
          vGerouRemessa := True;
        vBol.dataSet.Next;
      end;
    finally
      vBol.dataSet.EnableControls;
    end;

    if (FtipoVenda = 'REQ') then
      if fCarga > 0 then
        if vDadosIni.StrToFloatFormat(fValorDescAVista,2) > 0 then
        begin
//        testar aqui
          if vGerouRemessa then
          begin
            Application.MessageBox(pchar('Boletos com remessa já enviada para este Pedido' + #13 +
              'Foi concedido o desconto para o pagamento à vista!' + #13 +
              'Para continuar os boletos devem ser desativados' + #13 +
              'Informe o setor de cobrança para corrigir a situação!' + #13 +
              'O sistema irá desativar os botelas agora') ,'Atenção', 0 + 64);

            if not vDadosIni.PesqPros('FPG025', 'VALIDAR', 'NUM ' + IntToStr(FnumeroVenda) + ' TIPO ' + FtipoVenda ,
              'FORMPAGAMENTO', '', dtmFP.qrBuscas, True) then
            begin
              Result := False;
              Exit;
            end;

            if Application.MessageBox('Deseja continuar mesmo assim?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
            begin
              Result := False;
              Exit;
            end;

          end
          else if Application.MessageBox(pchar('Foram encontrados boletos para nota fiscal emitida desta venda' + #13 +
            'Porém foi concedido o desconto para o pagamento à vista' + #13 +
            'Os boletos encontrados serão excluídos para efetuar o recebimento à vista' + #13 +
            'Deseja continuar mesmo assim?'), 'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          begin
            Result := False;
            Exit;
          end;
          buscas.Close;
          buscas.SQL.Text := 'update boletas b set ativo = 0' +
            ' where b.num_nf_vnd = ' + IntToStr(FNum_Nf) +
            ' and b.sub_serie = ' + IntToStr(FSerie_Nf) +
            ' and b.cod_empresa = ' + vDadosIni.codEmpresa +
            ' and b.cod_nf = ' + IntToStr(fCodNF) +
            ' and b.ativo = 1';
          buscas.ExecSQL;
          Exit;
        end;
    if (vDadosIni.StrToFloatFormat(fValorValeCompraAutomatico,2) > 0) and (FtipoVenda = 'REQ') then
    begin
      vDif := 0;
      vValorAbater :=  vDadosIni.StrToFloatFormat( (fValorValeCompraAutomatico / vBol.dataSet.RecordCount),2);
      if vDadosIni.StrToFloatFormat(fValorValeCompraAutomatico, 2) >
        vDadosIni.StrToFloatFormat(vValorAbater * vBol.dataSet.RecordCount, 2) then
        vDif := vDadosIni.StrToFloatFormat(fValorValeCompraAutomatico, 2) - vDadosIni.StrToFloatFormat(vValorAbater * vBol.dataSet.RecordCount, 2)
      else
        vDif := vDadosIni.StrToFloatFormat(fValorValeCompraAutomatico, 2) - vDadosIni.StrToFloatFormat(vValorAbater * vBol.dataSet.RecordCount, 2);

      if (vGerouRemessa) then
      begin
        if vRecibo.vHistRec.dataSet.Active then
          vRecibo.vHistRec.dataSet.CancelUpdates;
        vRecibo.dataSet.CancelUpdates;
        if vLancCxl.dataSet.Active then
          vLancCxl.dataSet.CancelUpdates;
        dataSet.CancelUpdates;
        somarDocumentos;
        Application.MessageBox(pchar('Boletos com remessa já enviada para este Pedido' + #13 +
          'Houve devolução de mercadorias para abater neste recebimento!' + #13 +
          'O valor da devolução não será abatido neste recebimento por causa das boletas') ,'Atenção', 0 + 64);

        if not vDadosIni.PesqPros('FPG024', 'VALIDAR', 'NUM ' + IntToStr(FnumeroVenda) + ' TIPO ' + FtipoVenda ,
          'FORMPAGAMENTO', '', dtmFP.qrBuscas, True) then
        begin
          Result := False;
          Exit;
        end;

        if Application.MessageBox('Deseja continuar mesmo assim?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        begin
          Result := False;
          Exit;
        end;
      end;

      if (vDadosIni.StrToFloatFormat(vSomaBol,2) > vDadosIni.StrToFloatFormat(fValorValeCompraAutomatico,2)) and (not vGerouRemessa) then
      begin
      	try
        	vBol.dataSet.DisableControls;
          vBol.dataSet.First;
          while not vBol.dataSet.Eof do
          begin

            fReimprimirBoletosAlterados := True;
            buscas.Close;
            buscas.SQL.Text := 'update boletas b set VL_ORIG = VL_DOC_BOL, VL_DOC_BOL = VL_DOC_BOL - :VL_DOC_BOL' +
              ' where N_SEQ_BOL = ' + IntToStr(vBol.dataSet.FieldByName('N_SEQ_BOL').AsInteger) +
              ' and COD_EMPRESA = ' + vDadosIni.codEmpresa;
            buscas.ParamByName('VL_DOC_BOL').AsFloat := vValorAbater + vDif;
            if vDif <> 0 then
              vDif := 0;
            buscas.ExecSQL;

            vBol.dataSet.Next;
          end;
        finally
          vBol.dataSet.EnableControls;
        end;
      end
      else if (not vGerouRemessa) then
      begin
        if Application.MessageBox(pchar('Foram encontrados boletos para nota fiscal emitida desta venda' + #13 +
          'Porém foram feitas Devoluções de mercadorias com valor maior que o valor dos boletos' + #13 +
          'Os boletos encontrados serão excluídos para continuar o processo' + #13 +
          'Deseja continuar mesmo assim?'), 'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        begin
          if vRecibo.vHistRec.dataSet.Active then
            vRecibo.vHistRec.dataSet.CancelUpdates;
          vRecibo.dataSet.CancelUpdates;
          if vLancCxl.dataSet.Active then
            vLancCxl.dataSet.CancelUpdates;
          dataSet.CancelUpdates;
          somarDocumentos;
          Result := False;
          Exit;
        end;
        buscas.Close;
        buscas.SQL.Text := 'update boletas b set ativo = 0' +
          ' where b.num_nf_vnd = ' + IntToStr(FNum_Nf) +
          ' and b.sub_serie = ' + IntToStr(FSerie_Nf) +
          ' and b.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and b.cod_nf = ' + IntToStr(fCodNF) +
          ' and b.ativo = 1';
        buscas.ExecSQL;
        Exit;

      end;
    end;
    if Application.MessageBox(pchar('Foram encontrados boletos para nota fiscal emitida desta venda' + #13 +
      'Deseja carregar as parcelas do cadastro do boleto?'), 'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    begin
      if vDadosIni.PesqPros('FPG030', 'VALIDAR', FtipoVenda + ' ' + IntToStr(FnumeroVenda) + ' QTDE BOLETOS ' + IntToStr(vBol.dataSet.RecordCount) +
        ' VL: ' + Format('%n', [vSomaBol]) , 'FORMPAGAMENTO', '', buscas, True) then
        Exit;
    end;
  end;

  vBol := TBoletasFP.create;
  if (FtipoVenda = 'NF') then
    vBol.selecionaBoletasFp(FnumeroVenda, Fsub_Serie)
  else
    vBol.selecionaBoletasFp(FNum_Nf, FSerie_Nf);

  if vBol.dataSet.IsEmpty then
    if Trim(FtipoVenda) = 'OS' then
      vBol.selecionaBoletasOSFp(FnumeroVenda);

  fSecao := fSecao + 1;

  FRef_Frete := False;
  if (FtipoVenda = 'MOT') and (not alteracao) then
    if vPlano.vDadosPlano.mot_Valor_frete > 0 then
    begin
      Application.ProcessMessages;
      FRef_Frete := Application.MessageBox('O valor dos boletos é referente a Frete/Seguro/Outras Despesas?',
        'Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES;
    end;

  try
  	vBol.dataSet.DisableControls;
    vBol.dataSet.First;
    while not vBol.dataSet.Eof do
    begin
      Insert;
      dataSet.FieldByName('DATA_VENC').AsDateTime := vBol.dataSet.FieldByName('DATA_VEN_BOL').AsDateTime;
      dataSet.FieldByName('NDOC').AsString := vBol.dataSet.FieldByName('N_DOC_BOL').AsString;
      dataSet.FieldByName('VALORDOC').AsCurrency := vBol.dataSet.FieldByName('VL_DOC_BOL').AsCurrency;
      DataSet.FieldByName('valor_contabil').AsFloat := DataSet.FieldByName('valordoc').AsFloat;
      dataSet.FieldByName('COD_CONTROLE').AsInteger := vBol.dataSet.FieldByName('codigo_ctrl').AsInteger;
      DataSet.FieldByName('cod_cliente').AsInteger := vBol.dataSet.FieldByName('cod_cliente').AsInteger;
      DataSet.FieldByName('cliente').AsString := vBol.dataSet.FieldByName('nome_cliente').AsString;
      DataSet.FieldByName('nosso_numero_banco').AsString := vBol.dataSet.FieldByName('nosso_numero_banco').AsString;
      dataSet.FieldByName('TIPDOC').AsString := 'S2';
      //dataSet.FieldByName('HISTORICO').AsString := 'CREDITOS A RECEBER CONFORME ' + FtipoVenda + ' Nº ' + inttostr(FnumeroVenda);
      dataSet.FieldByName('TIP_CNT').AsString := 'C';
      Inc(vseqform);
      dataSet.FieldByName('SEQFORM').AsInteger := vseqform;//GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
      dataSet.FieldByName('PERMITIR_EXCLUIR').AsString := 'B';// Nao permite excluir ou alterar Boletos
      DataSet.FieldByName('HISTORICO').AsString := BuildHistorico('', True);
      dataSet.Post;
      fGerouFormaBoleto := True;
      vBol.dataSet.Next;
      somarDocumentos;
  //    if FvalorInformado >= FvalorVenda then
  //      Exit;
    end;
  finally
    vBol.dataSet.EnableControls;
  end;
  vBol.dataSet.Close;

  //ver aqui problema da leste pan de arredondamento, usar vdadosini.strtofloatformat
  if (vDadosIni.StrToFloatFormat(FvalorInformado, 2) > vDadosIni.StrToFloatFormat(FvalorVenda,2)) then
  begin
    Application.MessageBox(pchar('O valor encontrado pela forma de pagamento somado aos boletos ultrapassa o valor da venda' + #13 +
      'O valor que ultrapassar o valor da venda deverá ser lançado como troco') ,'Atenção', 0 + 64);

    if not vDadosIni.PesqPros('FPG026', 'VALIDAR', 'NUM ' + IntToStr(FnumeroVenda) + ' TIPO ' + FtipoVenda ,
      'FORMPAGAMENTO', '', dtmFP.qrBuscas, True) then
    begin
      Result := False;
      Exit;
    end;

    if Application.MessageBox('Deseja continuar mesmo assim?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
    begin
      Result := False;
      Exit;
    end;
  end;

end;

function TFormPag2.verificaCartao: Boolean;
var
  vVlPrimeira, vVlDemais: Extended;
  I, controleId: Integer;
  vDiaVencimento: TDate;
  Q: TIBQuery;
begin
  Result := True;
  if (FvalorInformado >= FvalorVenda) and (fValorValeCompraAutomatico = 0) then
    Exit;
  if (FtipoVenda = 'NF') or ((FNum_Nf > 0) and (FtipoVenda = 'REC')) then
    if (FvalorInformado >= FvalorVenda) then
      Exit;
  // testes acima apenas foram copiados do teste que verifica boletos

  //1° teste, cartoes passados na nota fiscal usando o POS Virtual

  if not vDadosIni.strEstaContidoEm(Trim(FtipoVenda), ['REQ', 'OS', 'MOT']) then
    Exit;

  Q := TIBQuery.Create(nil);
  try
    Q.Database := buscas.Database;
    Q.Transaction := buscas.Transaction;

    Q.Close;
    Q.SQL.Text := 'select * from TRANSACAO_CARTAO' +
      ' where TPDOCS = ' + QuotedStr(Trim(FtipoVenda)) +
      ' and NREQUISICAO = ' + IntToStr(FnumeroVenda) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and status = ''A''';
    Q.Open;

    if Q.IsEmpty and (Fcod_nfce > 0)then
    begin
      SqlOpen('select * from TRANSACAO_CARTAO' +
              ' where tpdocs = ''NFCE'' and nrequisicao = %d and cod_empresa = %d' +
              ' and status = ''A''', [Fcod_nfce, vDadosIni.cod_empresa]);
    end;

    if not Q.IsEmpty then
    begin
      vVlDemais := 0;
      Q.First;
      while not Q.Eof do
      begin
        vVlDemais := vVlDemais + Q.FieldByName('VALOR_OPERACAO').AsFloat;
        Q.Next;
      end;

      if Application.MessageBox(pchar('Foram encontrados cartões para esta venda' + #13 +
        'Deseja carregar as parcelas do cartão?'), 'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
        if vDadosIni.PesqPros('FPG031', 'VALIDAR',
          FtipoVenda + ' ' + IntToStr(FnumeroVenda) + ' NF QTDE CARTOES ' + IntToStr(Q.RecordCount) +
          ' VL: ' + Format('%n', [vVlDemais]) , 'FORMPAGAMENTO', '', buscas2, True) then
          Exit;

      vVlPrimeira := 0;
      vVlDemais := 0;
      Q.First;
      while not Q.Eof do
      begin
        fSecao := fSecao + 1;

        vDadosIni.vPOSV.parcelas := Q.FieldByName('PARCELAS').AsInteger;
        vDadosIni.vPOSV.retornoAUT := Q.FieldByName('N_AUT_CART').AsString;
        vDadosIni.vPOSV.retornoNSU := Q.FieldByName('N_DOCNSU_ADM').AsString;
        vDadosIni.vPOSV.retornoREDE := Q.FieldByName('REDE').AsString;
        vDadosIni.vPOSV.retornoDataTransacao := FormatDateTime('dd/mm/yyyy', Q.FieldByName('DATA_TRANSACAO').AsDateTime);
        vDadosIni.vPOSV.valorOperacao := Q.FieldByName('VALOR_OPERACAO').AsFloat;
        vDadosIni.vPOSV.debitoCreditoOutros := Q.FieldByName('operacao').AsString;
        vDadosIni.vPOSV.diasParaCredito := Q.FieldByName('DIAS_PARA_CRED').AsInteger;
        vDadosIni.vPOSV.guidTrCartao := Q.FieldByName('GUIDT').AsString;
        vDadosIni.vPOSV.idCarteiraDigital := Q.FieldByName('ID_CARTDIG').AsString;

        try
          vControle.selecionaControlesFormPag('');
          vcontrole.HandleBoletoTEF(controleId, vDadosIni.vPOSV.idCarteiraDigital, vDadosIni.vPOSV.IdPSP, vDadosIni.vPOSV.CaptionRedeValor);

          usarTransacaoPOSVirtualComoFormaPagamento(Q.FieldByName('COD_TERMINAL_ADM').AsString);

        finally
          vControle.RestoreComandFP;
        end;

        Q.Next;
      end;
      somarDocumentos;
      Exit;
    end;
  finally
    Q.Close();
    Q.Free();
  end;



  exit;//testar a duplicidade por conta de dos terminais

  // 2° teste, cartao passado no paf ecf
  // adaptar para chamar o metodo de gravacao

  if not vDadosIni.strEstaContidoEm(Trim(FtipoVenda), ['REQ', 'OS']) then
    Exit;

  buscas.Close;
  buscas.SQL.Text :=
    ' select cp.ped, fc.parcelas_tef, fc.n_aut_cart, fc.n_docnsu_adm, c.codigo_ctrl, ' +
    ' t.cod_term_adm, t.desc_term_adm, adm.cod_adm, adm.descricao_adm, sum(fc.valor) soma from pedvenda pv ' +
    ' inner join cupom cp on cp.ped = pv.nped and coalesce(cp.prevenda, 0) = coalesce(pv.nprevenda,0) ' +
    ' and coalesce(cp.paf_num_prevenda, 0) = coalesce(pv.paf_num_prevenda, 0) and cp.cod_empresa = pv.cod_empresa ' +
    ' inner join fincupom fc on fc.cod_terminal = cp.cod_terminal and fc.nserieecf = cp.nserieecf ' +
    ' and fc.cod_empresa = cp.cod_empresa and fc.ordem = cp.registro and fc.cupom = cp.cupom ' +
    ' inner join controles c on c.codigo_emp = fc.cod_empresa and c.cod_finalizador = fc.finalizador and c.docs = ''S2'' ' +
    ' inner join terminal_cartao t on t.cod_empresa = c.codigo_emp and t.cod_terminalf = fc.cod_terminal ' +
    ' left join adm_cartao adm on adm.cod_adm = t.cod_adm and adm.cod_empresa = t.cod_empresa ' +
    ' where pv.nped = ' + IntToStr(FnumeroVenda) +
    ' and pv.tipo = ' + QuotedStr(Trim(FtipoVenda)) +
    ' and cp.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and fc.parcelas_tef > 0 ' +
    ' and coalesce(fc.n_aut_cart, '''') <> '''' ' +
    ' and coalesce(fc.n_docnsu_adm, '''') <> '''' ' +
    ' group by 1, 2, 3, 4, 5, 6, 7, 8, 9 ';
  buscas.Open;
  buscas.FetchAll;

  if not buscas.IsEmpty then
  begin
    vVlDemais := 0;
    buscas.First;
    while not buscas.Eof do
    begin
      vVlDemais := vVlDemais + buscas.FieldByName('soma').AsFloat;
      buscas.Next;
    end;

    if Application.MessageBox(pchar('Foram encontrados cartões para o cupom emitido desta venda' + #13 +
      'Deseja carregar as parcelas do cartão?'), 'Atenção', MB_ICONQUESTION + MB_YESNO) <> IDYES then
      if vDadosIni.PesqPros('FPG031', 'VALIDAR',
        FtipoVenda + ' ' + IntToStr(FnumeroVenda) + ' CP QTDE CARTOES ' + IntToStr(buscas.RecordCount) +
        ' VL: ' + Format('%n', [vVlDemais]) , 'FORMPAGAMENTO', '', buscas2, True) then
        Exit;

    vVlPrimeira := 0;
    vVlDemais := 0;
    vDiaVencimento := Date;
    buscas.First;
    while not buscas.Eof do
    begin
      vVlDemais := (buscas.FieldByName('soma').AsFloat / buscas.FieldByName('parcelas_tef').AsInteger) * 100; // antes de truncar acrescenta-se 2 casas decimais
      vVlDemais := vDadosIni.StrToFloatFormat(( 0.01 * Trunc( vVlDemais ) ) , 2);
      vVlPrimeira := vVlDemais +
        ( buscas.FieldByName('soma').AsFloat - (vVlDemais * buscas.FieldByName('parcelas_tef').AsInteger));
      vVlPrimeira := vDadosIni.StrToFloatFormat( vVlPrimeira, 2);
      for I := 0 to buscas.FieldByName('parcelas_tef').AsInteger - 1 do
      begin
        vDiaVencimento := vDiaVencimento + 30;
        Insert;
        dataSet.FieldByName('DATA_VENC').AsDateTime := vDiaVencimento;
        dataSet.FieldByName('NDOC').AsString := vDadosIni.StrZero(FnumeroVenda, 6) + '-' + IntToStr( i + 1);
        if I = 0 then
        begin
          dataSet.FieldByName('VALORDOC').AsFloat := vVlPrimeira;
          DataSet.FieldByName('VALOR_CONTABIL').AsFloat := vVlPrimeira;
        end
        else
        begin
          dataSet.FieldByName('VALORDOC').AsFloat := vVlDemais;
          DataSet.FieldByName('VALOR_CONTABIL').AsFloat := vVlDemais;
        end;
        dataSet.FieldByName('COD_CONTROLE').AsInteger := buscas.FieldByName('codigo_ctrl').AsInteger;
        DataSet.FieldByName('COD_CLIENTE').AsInteger := FcodigoCliente;
        DataSet.FieldByName('CLIENTE').AsString := FnomeCliente;
        dataSet.FieldByName('TIPDOC').AsString := 'S2';
        //dataSet.FieldByName('HISTORICO').AsString := 'CREDITOS A RECEBER CONFORME ' + FtipoVenda + ' Nº ' + inttostr(FnumeroVenda);
        dataSet.FieldByName('TIP_CNT').AsString := 'C';
        Inc(vseqform);
        dataSet.FieldByName('SEQFORM').AsInteger := vseqform;//GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
        dataSet.FieldByName('PERMITIR_EXCLUIR').AsString := 'C';// Nao permite excluir ou alterar cartoes

        DataSet.FieldByName('N_AUT_CART').AsString := buscas.FieldByName('N_AUT_CART').AsString;
        DataSet.FieldByName('NPARCELA').AsInteger := I + 1;
        DataSet.FieldByName('QTDE_PARC').AsInteger := buscas.FieldByName('PARCELAS_TEF').AsInteger;
        DataSet.FieldByName('N_DOCNSU_ADM').AsString := buscas.FieldByName('N_DOCNSU_ADM').AsString;
        DataSet.FieldByName('COD_TERMINAL_ADM').AsString := buscas.FieldByName('COD_TERM_ADM').AsString;
        DataSet.FieldByName('DESC_TERMINAL_ADM').AsString := buscas.FieldByName('DESC_TERM_ADM').AsString;
        DataSet.FieldByName('COD_ADM').AsInteger := buscas.FieldByName('COD_ADM').AsInteger;
        DataSet.FieldByName('DESC_ADM').AsString := buscas.FieldByName('DESCRICAO_ADM').AsString;
        DataSet.FieldByName('HISTORICO').AsString := BuildHistorico('', True);

        dataSet.Post;

      end;
      buscas.Next;
    end;
    somarDocumentos;
  end;
end;

function TFormPag2.verificaIssRetidoNFSe: boolean;
	{                                               
var
	buscasTemp, buscasTemp2: TIBQuery;
  vCodControle: Integer;
  vDocs: string;
  }
begin
	Result := True;
  Exit;
  {
	if (trim(FtipoVenda) <> 'OS') then
    exit;

	buscasTemp := TIBQuery.Create(Application);
  buscasTemp.Database := buscas.Database;
  buscasTemp.Transaction := buscas.Transaction;

  buscasTemp2 := TIBQuery.Create(Application);
  buscasTemp2.Database := buscas.Database;
  buscasTemp2.Transaction := buscas.Transaction;

  buscasTemp.Close;
  buscasTemp.SQL.Text := ' select sum(coalesce(pedvenda_serv.valor_tot_serv, 0)) valor_tot_serv, ' +
    ' sum(coalesce(pedvenda_serv.valor_nfse, 0)) valor_nfse, ' +
    ' sum(coalesce(pedvenda_serv.issret_servico, 0)) issret_servico from pedvenda_serv ' +
    ' where pedvenda_serv.nped = ' + IntToStr(FnumeroVenda) +
    ' and pedvenda_serv.tipo = ' + QuotedStr(FtipoVenda) +
    ' and pedvenda_serv.cod_empresa = ' + vDadosIni.codEmpresa;
  buscasTemp.Open;

  if buscasTemp.FieldByName('ISSRET_SERVICO').AsCurrency > 0 then
  begin
  	if vDadosIni.vPedVnd.ctrlIssRetidoNFSe <= 0 then
    begin
    	Application.MessageBox(pchar('Controle não informado "ped_vnd_os_ctrl_iss_retido_nfse",' +
      	' favor informar controle configurado como baixa automática' +
      	' ou controle configurado para não gerar financeiro.' + #13 + #13 +
        'Para realizar o lançamento do Valor do ISS Retido da NFSe'), 'Atenção', MB_ICONERROR + MB_OK);
      Result := False;
      exit;
    end;

    buscasTemp2.Close;
    buscasTemp2.SQL.Text := ' select codigo_ctrl, codigo_emp, docs, ' +
      ' coalesce(nao_gera_finan, ''N'') nao_gera_finan, ' +
    	' coalesce(baixa_automatica, ''N'') baixa_automatica, ' +
      ' coalesce(n_conta_bx_auto, 0) n_conta_bx_auto from controles ' +
    	' where codigo_ctrl = ' + IntToStr(vDadosIni.vPedVnd.ctrlIssRetidoNFSe) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa;
    buscasTemp2.Open;

    if buscasTemp2.IsEmpty then
    begin
    	Application.MessageBox(pchar('Controle não encontrado "ped_vnd_os_ctrl_iss_retido_nfse",' +
      	' favor informar controle configurado como baixa automática' +
      	' ou controle configurado para não gerar financeiro.' + #13 + #13 +
        'Para realizar o lançamento do Valor do ISS Retido da NFSe.'), 'Atenção', MB_ICONERROR + MB_OK);
      Result := False;
      exit;
    end;

    if (buscasTemp2.FieldByName('NAO_GERA_FINAN').AsString <> 'S')
    	and (buscasTemp2.FieldByName('BAIXA_AUTOMATICA').AsString <> 'S') then
    begin
      Application.MessageBox(pchar('Controle deve ser como baixa automática' +
      	' ou configurado para não gerar financeiro "ped_vnd_os_ctrl_iss_retido_nfse".' + #13 + #13 +
        'Para realizar o lançamento do Valor do ISS Retido da NFSe.'), 'Atenção', MB_ICONERROR + MB_OK);
      Result := False;
      exit;
    end;

    if (buscasTemp2.FieldByName('BAIXA_AUTOMATICA').AsString = 'S')
    	and (buscasTemp2.FieldByName('N_CONTA_BX_AUTO').AsFloat <= 0) then
    begin
    	Application.MessageBox(pchar('Favor informar o número da conta de saída plc para baixa automática "ped_vnd_os_ctrl_iss_retido_nfse".' +
     	'Para realizar o lançamento do Valor do ISS Retido da NFSe.'), 'Atenção', MB_ICONERROR + MB_OK);
      Result := False;
      exit;
    end;

    vCodControle := buscasTemp2.FieldByName('CODIGO_CTRL').AsInteger;
    vDocs        := buscasTemp2.FieldByName('DOCS').AsString;

    buscasTemp.First;
    while not buscasTemp.Eof do
    begin
      Insert;
      dataSet.FieldByName('VALORDOC').AsCurrency := buscasTemp.FieldByName('ISSRET_SERVICO').AsCurrency;
      dataSet.FieldByName('valor_contabil').AsFloat := buscasTemp.FieldByName('ISSRET_SERVICO').AsFloat;
      dataSet.FieldByName('cod_controle').AsInteger := vCodControle;
      DataSet.FieldByName('cod_cliente').AsInteger := FcodigoCliente;
      DataSet.FieldByName('cliente').AsString := FnomeCliente;
  //    DataSet.FieldByName('nosso_numero_banco').AsString := vBol.dataSet.FieldByName('nosso_numero_banco').AsString;
      dataSet.FieldByName('tipdoc').AsString := vDocs;
      dataSet.FieldByName('HISTORICO').AsString := 'VALOR DO ISS RETIDO DA NFSe DE SERVICOS';
      dataSet.FieldByName('TIP_CNT').AsString := 'C';
      Inc(vseqform);
      dataSet.FieldByName('SEQFORM').AsInteger := vseqform;//GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
      dataSet.FieldByName('PERMITIR_EXCLUIR').AsString := 'R';// Nao permite excluir ou alterar vale resgate
  //    DataSet.FieldByName('HISTORICO').AsString := BuildHistorico('', True);
      dataSet.Post;
  //    fGerouFormaBoleto := True;
      buscasTemp.Next;
      somarDocumentos;
    end;
  end;
  }
end;

function TFormPag2.verificaLocacao: boolean;
var
  vRecibos: string;
begin
  Result := True;
  vRecibos := '';
  exit;   //nao será utilizado, pois no recibo nao tem o vinculo com a locacao

  fValorValeCompraAutomatico := 0;

  if not vDadosIni.vLocacao.vHabilitarLoc then
    exit;

  if trim(FtipoVenda) <> 'OS' then
    exit;

  buscas.Close;
  buscas.SQL.Text := ' select rec.*, cl.nome_cliente from pedvenda pd ' +
   ' inner join loc_fatura loc on loc.cod_fatura = pd.cod_fatura and loc.cod_empresa = pd.cod_empresa ' +
   ' inner join recibos rec on rec.cod_locacao = loc.cod_locacao and rec.cod_empresa = loc.cod_empresa ' +
   ' inner join clientes cl on cl.cod_cliente = rec.cod_devedor and cl.cod_empresa = rec.cod_empresa ' +
   ' where pd.nped = ' + IntToStr(FnumeroVenda) + ' and pd.tipo = ''' + FtipoVenda + ''' ' +
   ' and pd.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  buscas.FetchAll;

  if buscas.IsEmpty then
    exit;

  buscas.First;
  while not buscas.Eof do
  begin
    vRecibos := vRecibos + ' or (nrecibo = ' + IntToStr(buscas.FieldByName('nrecibo').AsInteger) + ')';

    buscas.Next;
  end;
  vRecibos := Copy(vRecibos, 5, Length(vRecibos) - 1);

  vControle.selecionaControlesFormPag('', 1);

  if (buscas.FieldByName('nrecibo').AsInteger > 0) then
  begin
    try
      fValorValeCompraAutomatico := FvalorVenda; //fValorValeCompraAutomatico + buscas.FieldByName('valor').AsFloat;
      vRecibo.dataSet.Filter := '( ' + vRecibos + ')';
      vRecibo.dataSet.Filtered := True;

      try
      	vRecibo.dataSet.DisableControls;
        vRecibo.dataSet.First;
        while not vRecibo.dataSet.Eof do
        begin
          vRecibo.dataSet.Edit;
          vRecibo.dataSet.FieldByName('selec').AsString := 'S';
          vRecibo.Post;

          vRecibo.dataSet.Next;
        end;
        vRecibo.First;
      finally
        vRecibo.dataSet.EnableControls;
      end;

      Result := receberRecibo(orValeLocacao);

    finally
      vRecibo.dataSet.Filter := '';
      vRecibo.dataSet.Filtered := False;
    end;
  end;

//  buscas.First;
//  while not buscas.Eof do
//  begin
//     Insert;
//     DataSet.FieldByName('cod_controle').AsInteger := 1;
//
//     if DataSet.state in [dsBrowse] then
//     begin
//       Result := false;
//       vControle.DataSet.IndexFieldNames := 'CODIGO_CTRL';
//       exit;
//     end;
//
//     DataSet.FieldByName('historico').AsString := 'PAGAMENTO CONFORME VALECOMPRA';
//
//     DataSet.FieldByName('valordoc').AsFloat :=
//       IfThen(buscas.FieldByName('valor').AsFloat > FvalorVenda, FvalorVenda, buscas.FieldByName('valor').AsFloat);
//     DataSet.FieldByName('valor_contabil').AsFloat :=
//     	 IfThen(buscas.FieldByName('valor').AsFloat > FvalorVenda, buscas.FieldByName('valor').AsFloat - FvalorVenda,
//       buscas.FieldByName('valor').AsFloat);       
//     DataSet.FieldByName('recibo').AsString := 'S';
//     //        DataSet.FieldByName('REC_TIPVEND').AsString := FtipoVenda;
//     //        DataSet.FieldByName('REC_NUMVEND').AsInteger := FnumeroVenda;
//     //        DataSet.FieldByName('nrequisicao').AsInteger := vRecibo.dataSet.FieldByName('nrecibo').AsInteger;
//     //        DataSet.FieldByName('tpdocs').AsString := 'REC';
//     DataSet.FieldByName('REC_TIPVEND').AsString := 'REC';
//     DataSet.FieldByName('REC_NUMVEND').AsInteger := buscas.FieldByName('nrecibo').AsInteger;
//     DataSet.FieldByName('nrequisicao').AsInteger := FnumeroVenda;
//     DataSet.FieldByName('tpdocs').AsString := FtipoVenda;
//     Inc(vseqform);
//     if DataSet.State = dsInsert then
//       DataSet.FieldByName('SEQFORM').AsInteger := vseqform;//GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
//     DataSet.FieldByName('N_REC').AsInteger := buscas.FieldByName('nrecibo').AsInteger;
//     dataSet.FieldByName('PERMITIR_EXCLUIR').AsString := 'L';// Nao permite excluir ou alterar Locação
//     dataSet.Post;
////    fGerouFormaBoleto := True;
//    buscas.Next;
//    somarDocumentos;
//  end;
end;

procedure TFormPag2.verificaNF;
var
  vNumNf: integer;
  vDataNf: TDate;
  vSerieNF: string;
  buscasTmp: TIBQuery;
begin
  if (FtipoVenda = 'NF') then //and ((FNum_Nf = 0) and (FtipoVenda <> 'REC')) then
    exit;

  FNum_Nf := 0;
  FSerie_Nf := 0;
  FCod_ClienteNf := 0;
  fCarga := 0;
  fValorDescAVista :=0;
  fCodNF := 0;
  FNCupom := 0;
  Fcod_nfce := 0;
  Fnfce_num_nf := 0;
  FNumFatura := 0;
  FCodLocacoes := '';

  buscasTmp := TIBQuery.Create(Application);
  buscasTmp.Database := buscas.Database;
  buscasTmp.Transaction := buscas.Transaction;

  if (FtipoVenda = 'REQ') or (Trim(FtipoVenda) = 'OS') then
  begin
    if not vDadosIni.vLocacao.vHabilitarLoc then
    begin
      buscas.close;
      buscas.Sql.Text := 'select num_nf, data_nf, serie_nf, cod_carga, valor_desc_avista, ' +
      	' ncupom, cod_nfce, cod_fatura, 0 num_fatura, 0 cod_locacao from pedvenda ' +
        ' where nped = ' + IntToStr(FnumeroVenda) + ' and tipo = ' + QuotedStr(FtipoVenda) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1' +
        ' and (status_ped = ''FECHADA'')';
      buscas.Open;
    end
    else
    begin
      buscas.close;
      buscas.Sql.Text := 'select pd.num_nf, pd.data_nf, pd.serie_nf, pd.cod_carga, pd.valor_desc_avista, ' +
      	' pd.ncupom, pd.cod_nfce, pd.cod_fatura, loc.num_fatura from pedvenda pd ' +
        ' left join loc_fatura loc on loc.cod_fatura = pd.cod_fatura and loc.cod_empresa = pd.cod_empresa ' +
        ' where pd.nped = ' + IntToStr(FnumeroVenda) + ' and pd.tipo = ' + QuotedStr(FtipoVenda) +
        ' and pd.cod_empresa = ' + vDadosIni.codEmpresa + ' and pd.ativo = 1' +
        ' and (pd.status_ped = ''FECHADA'')';
      buscas.Open;
    end;
    FNCupom := buscas.FieldByName('ncupom').AsInteger;
    Fcod_nfce := buscas.FieldByName('cod_nfce').AsInteger;
    if buscas.FieldByName('num_nf').AsInteger > 0 then
    begin
      if (FtipoVenda = 'REQ') then
        if buscas.FieldByName('cod_carga').AsInteger > 0 then
        begin
          fCarga := buscas.FieldByName('cod_carga').AsInteger;
          fValorDescAVista := buscas.FieldByName('valor_desc_avista').AsFloat;
        end;
      vNumNf := buscas.FieldByName('num_nf').AsInteger;
      vDataNf := DateOf(buscas.FieldByName('data_nf').AsDateTime);
      vSerieNF := Trim(buscas.FieldByName('serie_nf').AsString);
      buscas.close;
      buscas.SQL.Text := 'select cod_nf, num_nf, serie, cod_cliente, cod_carga from notafiscal where ' +
        ' num_nf = ' + IntToStr(vNumNf) + ' and data_lanc = ' + QuotedStr(FormatDateTime('mm/dd/yyyy',
        vDataNf)) + ' and natureza_nf = ''S'' and ativo = 1 and cod_empresa = ' +
        vDadosIni.codEmpresa;
      buscas.Open;
      if not buscas.IsEmpty then
      begin
        FNum_Nf := buscas.FieldByName('num_nf').AsInteger;
        FCodNF := buscas.FieldByName('cod_nf').AsInteger;
        FCod_ClienteNf := buscas.FieldByName('cod_cliente').AsInteger;
        try
          FSerie_Nf := StrToInt(Trim(buscas.FieldByName('serie').AsString));
        except
        end;
      end;
    end
    else if (buscas.FieldByName('cod_fatura').AsInteger > 0) then
    begin
    	FNumFatura := buscas.FieldByName('num_fatura').AsInteger;

      buscasTmp.Close;
      buscasTmp.SQL.Text := ' select distinct loc.cod_locacao from loc_locacao_item loc ' +
      	' where loc.cod_fatura = :cod_fatura and loc.cod_empresa = :cod_empresa ';
      buscasTmp.ParamByName('cod_fatura').AsInteger := buscas.FieldByName('cod_fatura').AsInteger;
      buscasTmp.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscasTmp.Open;

      buscasTmp.First;
      while not buscasTmp.Eof do
      begin
        if buscasTmp.RecNo >= 11 then
        begin
        	FCodLocacoes := FCodLocacoes + ', ...';
          Break;
        end;

        if trim(FCodLocacoes) = '' then
        	FCodLocacoes := vDadosIni.StrZero(IntToStr(buscasTmp.FieldByName('cod_locacao').AsInteger), 6)
        else
        	FCodLocacoes := FCodLocacoes + ', ' + vDadosIni.StrZero(IntToStr(buscasTmp.FieldByName('cod_locacao').AsInteger), 6);

        buscasTmp.Next;
      end;
      buscasTmp.First;
    end
    else if (FtipoVenda = 'REQ') then
      if buscas.FieldByName('cod_carga').AsInteger > 0 then
      begin
        fCarga := buscas.FieldByName('cod_carga').AsInteger;
        fValorDescAVista := buscas.FieldByName('valor_desc_avista').AsFloat;
      end;

    if (Fcod_nfce > 0) then
      Fnfce_num_nf := SqlOpen('select num_nf from nfce' +
                              ' where cod_nfce = ' + IntToStr(Fcod_nfce) +
                              ' and cod_empresa = ' + vDadosIni.codEmpresa).FieldByName('num_nf').AsInteger;
  end
  else if (Trim(FtipoVenda) = 'REC') then
  begin
    buscas.close;
    buscas.Sql.Text := 'select num_nf, serie_nf, cod_benef ' +
      ' from recibos where nrecibo = ' + IntToStr(FnumeroVenda) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
    buscas.Open;
    if buscas.FieldByName('num_nf').AsInteger > 0 then
    begin
      FNum_Nf := buscas.FieldByName('num_nf').AsInteger;
      FCod_ClienteNf := buscas.FieldByName('cod_benef').AsInteger;
      try
        FSerie_Nf := StrToInt(Trim(buscas.FieldByName('serie_nf').AsString));
      except
      end;
    end;
  end
  else if (Trim(FtipoVenda) = 'MOT') then
  begin
    buscas.close;
    buscas.Sql.Text := 'select num_nf, serie, clientes_v ' +
      ' from notafiscal where n_comando = ' + IntToStr(FnumeroVenda) +
      ' and natureza_nf = ''S'' and tipo_nf = ''V'' ' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
    buscas.Open;
    if buscas.FieldByName('num_nf').AsInteger > 0 then
    begin
      FNum_Nf := buscas.FieldByName('num_nf').AsInteger;
      FCod_ClienteNf := buscas.FieldByName('clientes_v').AsInteger;
      try
        FSerie_Nf := StrToInt(Trim(buscas.FieldByName('serie').AsString));
      except
      end;
    end;
  end;
  buscas.close;
end;

function TFormPag2.verificaOSRetorno(pTipoVenda: string;
  pNumVenda: integer): boolean;
var
  vNumOs: Integer;

begin
  Result := true;
  if pTipoVenda <> 'MOT' then
    exit;
  buscas.close;
  buscas.SQL.Text := 'select N_OS_RETORNO from plano_pag' +
    ' where nrequisicao = ' + IntToStr(pNumVenda) +
    ' and tpdocs = ' + QuotedStr(pTipoVenda) +
    ' and nome_ctrl = ''RETORNO''' +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
  buscas.Open;
  vNumOs := buscas.fieldbyname('N_OS_RETORNO').AsInteger;
  if vNumOs > 0 then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select STATUS_CXL_RQ from pedvenda where nped = ' + IntToStr(vNumOs) +
      ' and tipo = ''OS'' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ((status_ped is null) or (status_ped = ''''))';
    buscas.Open;
    if (buscas.FieldByName('STATUS_CXL_RQ').AsString) <> '' then
    begin
      Application.MessageBox(pchar('Para este documento existe um retorno de banco (O.S.), e este documento está, ou já foi recebido por outro usuário no Caixa Auxiliar. Para continuar cancele o recebimento da O.S.: ' + IntToStr(vNumOs)),
        'Atenção', 0 + 64);
      Result := False;
      Exit;
    end;
    //    buscas.close;
    //    buscas.SQL.Text := 'delete from pedvenda where nped = '+IntToStr(vNumOs)+
    //      ' and tipo = ''OS'' and cod_empresa = '+vDadosIni.codEmpresa;
    try
      //      buscas.ExecSQL;
      Result := True;
    except
      on e: exception do
      begin
        Result := False;
        Application.MessageBox(pchar('Erro ao tentar excluir O.S gerada para o Retorno. Erro: ' + e.Message),
          'Atenção', 0 + 64);
      end;
    end;
  end;
end;

function TFormPag2.verificaPedidoCanceladoEcommerce: Boolean;
begin
	Result := true;
  
	if not vDadosIni.vEcommerce.vHabilitarEcommerce then
  	exit;

  buscas.Close;
  buscas.SQL.Text := ' select id_commerce, status_ec from pedvenda ' +
    ' where nped = ' + IntToStr(FnumeroVenda) +
    ' and tipo = ' + QuotedStr(FtipoVenda) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  if (buscas.FieldByName('id_commerce').AsInteger > 0) then
    if (ContainsText(buscas.FieldByName('status_ec').AsString, 'CANCELADO')) then
    begin
    	if Application.MessageBox(pchar('Pedido cancelado no E-Commerce, deseja receber assim mesmo?'), 'Atenção',
        MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2) = IDNO then
      begin
        Result := False;
        Exit;
      end;

      if not vDadosIni.PesqPros('FPG050', 'PERMITIR', 'NUM ' + IntToStr(FnumeroVenda) + ' TIPO ' + FtipoVenda ,
        'FORMPAGAMENTO', '', dtmFP.qrBuscas, True) then
      begin
        Result := False;
        Exit;
      end;
    end;
end;

procedure TFormPag2.verificaPlano;
var
  i: Integer;
  vOK: Boolean;
  vValorTemp: Currency;
  vIdentPlano: string;
begin
  FStringPlano := TStringList.Create;
  vPlano := TPlanoPagamento.Create;
  vPlano.selecionaPlanoPagamento(FnumeroVenda, FtipoVenda);

  vPlano.vDadosPlano.mot_valoroperacao := 0;
  vPlano.vDadosPlano.mot_valor_nf := 0;

  i := 1;

  if vPlano.dataSet.isempty then
    Exit
  else if (IndexText(vDadosIni.vUsarPlano, ['S', '2']) < 0) and (FtipoVenda = 'REQ') then
    Exit;

  Application.MessageBox('Houve uso de Plano de Pagamento', 'Informação', MB_OK +
    MB_ICONINFORMATION);
  if FtipoVenda = 'MOT' then
  begin
    vPlano.vDadosPlano.mot_valoroperacao := vPlano.dataSet.FieldByName('valoroperacao').AsFloat;
    vPlano.vDadosPlano.mot_valor_nf := vPlano.dataSet.FieldByName('valor_nf').AsFloat;
    FStringPlano.Clear;
    try
    	vPlano.dataSet.DisableControls;
      vPlano.dataSet.First;
      while not vPlano.dataSet.Eof do
      begin
        vOK := True;
        vIdentPlano := 'C';
        if Trim(vPlano.dataSet.FieldByName('tipdoc').AsString) = '' then
        begin
          if Trim(vPlano.dataSet.FieldByName('nome_ctrl').AsString) = 'RETORNO' then
            vIdentPlano := 'RE'
          else if Trim(vPlano.dataSet.FieldByName('nome_ctrl').AsString) = 'INTERMEDIACAO' then
            vIdentPlano := 'IN'
          else if Trim(vPlano.dataSet.FieldByName('nome_ctrl').AsString) = 'FRETE' then
            vIdentPlano := 'F'
          else if Trim(vPlano.dataSet.FieldByName('nome_ctrl').AsString) = 'RECIBOSANT' then
            vIdentPlano := 'RA'
          else if Trim(vPlano.dataSet.FieldByName('nome_ctrl').AsString) = 'OUTROS' then
            vIdentPlano := 'O'
          else if Trim(vPlano.dataSet.FieldByName('nome_ctrl').AsString) = 'MTUSADAS' then
            vIdentPlano := 'MT';
        end
        else if Trim(vPlano.dataSet.FieldByName('tipdoc').AsString) <> '' then
          if (vPlano.dataSet.FieldByName('cod_controle').AsInteger = 1) and
            (Trim(vPlano.dataSet.FieldByName('nome_ctrl').AsString) = 'DINHEIRO') then
            vIdentPlano := 'D';
        for I := 0 to FStringPlano.Count - 1 do
        begin
          if (Trim(getCampoPipe(FStringPlano[I], 1)) = Trim(vIdentPlano)) and
            (Trim(getCampoPipe(FStringPlano[I], 2)) = Trim(vPlano.dataSet.FieldByName('cod_controle').AsString)) and
            (Trim(getCampoPipe(FStringPlano[I], 4)) = Trim(vPlano.dataSet.FieldByName('nome_ctrl').AsString)) then
          begin
            vValorTemp := StrToFloat(Trim(getCampoPipe(FStringPlano[I], 6)));
            vValorTemp := vValorTemp + vPlano.dataSet.FieldByName('valordoc').AsFloat;
            FStringPlano[i] :=
              vIdentPlano + '|' +
              vPlano.dataSet.FieldByName('cod_controle').AsString + '|' +
              vPlano.dataSet.FieldByName('tipdoc').AsString + '|' +
              vPlano.dataSet.FieldByName('nome_ctrl').AsString + '|' +
              vPlano.dataSet.FieldByName('entrvalor').AsString + '|' +
              StringReplace(FloatToStr(vValorTemp), '.', '', [rfReplaceAll]) + '|0|';
            vOK := False;
            Break;
          end;
        end;
        if vOK then
        begin
          FStringPlano.Add(
            vIdentPlano + '|' +
            vPlano.dataSet.FieldByName('cod_controle').AsString + '|' +
            vPlano.dataSet.FieldByName('tipdoc').AsString + '|' +
            vPlano.dataSet.FieldByName('nome_ctrl').AsString + '|' +
            vPlano.dataSet.FieldByName('entrvalor').AsString + '|' +
            StringReplace(FloatToStr(vPlano.dataSet.FieldByName('valordoc').AsFloat), '.', '', [rfReplaceAll]) + '|0|');
        end;
        vPlano.dataSet.Next;
      end;
    finally
      vPlano.dataSet.EnableControls;
    end;
    vValorTemp := 0;
    vPlano.vDadosPlano.mot_valorMotUsada := 0;
    vPlano.vDadosPlano.mot_Valor_frete := 0;
    vPlano.vDadosPlano.mot_Valor_retorno := 0;
    vPlano.vDadosPlano.mot_Valor_Interm := 0;
    vPlano.vDadosPlano.mot_Valor_Contabil_Dinheiro := 0;
    for I := 0 to FStringPlano.Count - 1 do
    begin
      if (Trim(getCampoPipe(FStringPlano[I], 1)) = 'MT') then
        vPlano.vDadosPlano.mot_valorMotUsada := StrToFloat(trim(getCampoPipe(FStringPlano[i], 6)))
      else if (Trim(getCampoPipe(FStringPlano[I], 1)) = 'F') then
        vPlano.vDadosPlano.mot_Valor_frete := StrToFloat(trim(getCampoPipe(FStringPlano[i], 6)))
      else if (Trim(getCampoPipe(FStringPlano[I], 1)) = 'RE') then
        vPlano.vDadosPlano.mot_Valor_retorno := StrToFloat(trim(getCampoPipe(FStringPlano[i], 6)))
      else if (Trim(getCampoPipe(FStringPlano[I], 1)) = 'IN') then
        vPlano.vDadosPlano.mot_Valor_Interm := StrToFloat(trim(getCampoPipe(FStringPlano[i], 6)));
      if (Trim(getCampoPipe(FStringPlano[I], 1)) = 'D') then
        vPlano.vDadosPlano.mot_Valor_Contabil_Dinheiro := Abs(
          (FvalorVenda - vPlano.vDadosPlano.mot_valor_nf)
          - StrToFloat(trim(getCampoPipe(FStringPlano[i], 6))));
    end;
    vPlano.vDadosPlano.mot_OS_montada := False;
    vPlano.vDadosPlano.mot_OS_Inter := False;
    montarLancamentoMTUsadas;
  end
  else
  begin
  	try
      vPlano.dataSet.DisableControls;
      vPlano.dataSet.First;
      while not vPlano.dataSet.eof do
      begin
        if vPlano.dataSet.FieldByName('TIP_CNT').AsString <> 'E' then
        begin
          Insert;
          dataSet.FieldByName('TIPDOC').AsString := vPlano.dataSet.FieldByName('TIPDOC').AsString;
          dataSet.FieldByName('COD_CONTROLE').AsInteger :=
            vPlano.dataSet.FieldByName('COD_CONTROLE').AsInteger;
          //dataSet.FieldByName('HISTORICO').AsString := 'CREDITOS A RECEBER CONFORME ' + FtipoVenda + ' Nº ' + inttostr(FnumeroVenda);
          dataSet.FieldByName('VALORDOC').AsCurrency :=
          	vPlano.dataSet.FieldByName('VALORDOC').AsCurrency;
//            vDadosIni.StrToFloatFormat(vPlano.dataSet.FieldByName('VALORDOC').AsCurrency, 2);
          DataSet.FieldByName('valor_contabil').AsFloat := DataSet.FieldByName('valordoc').AsFloat;
          dataSet.FieldByName('TPDOCS').AsString := vPlano.dataSet.FieldByName('TPDOCS').AsString;
          dataSet.FieldByName('DATA_VENC').AsDateTime :=
            vPlano.dataSet.FieldByName('DATA_VENC').AsDateTime;
          dataSet.FieldByName('PLANO').AsString := 'S';
          if vPlano.dataSet.FieldByName('TIPDOC').AsString <> 'S1' then
          begin
            dataSet.FieldByName('NDOC').AsString := vDadosIni.StrZero(FnumeroVenda, 5) + '-' +
              IntToStr(I);
            i := i + 1;
          end;
          Inc(vseqform);
          DataSet.FieldByName('SEQFORM').AsInteger := vseqform;//GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
          DataSet.FieldByName('HISTORICO').AsString := BuildHistorico('', True);
          dataSet.Post;
        end
        else
        begin
          if vPlano.dataSet.FieldByName('TIPDOC').AsString = 'S1' then
          begin
            Insert;
            dataSet.FieldByName('TIPDOC').AsString := vPlano.dataSet.FieldByName('TIPDOC').AsString;
            dataSet.FieldByName('COD_CONTROLE').AsInteger :=
              vPlano.dataSet.FieldByName('COD_CONTROLE').AsInteger;
            //dataSet.FieldByName('HISTORICO').AsString := 'CREDITOS A RECEBER CONFORME ' + FtipoVenda + ' Nº ' + inttostr(FnumeroVenda);
            dataSet.FieldByName('VALORDOC').AsCurrency :=
            	vPlano.dataSet.FieldByName('VALORDOC').AsCurrency;
//              vDadosIni.StrToFloatFormat(vPlano.dataSet.FieldByName('VALORDOC').AsCurrency, 2);
            DataSet.FieldByName('valor_contabil').AsFloat := DataSet.FieldByName('valordoc').AsFloat;
            dataSet.FieldByName('TPDOCS').AsString := vPlano.dataSet.FieldByName('TPDOCS').AsString;
            dataSet.FieldByName('DATA_VENC').AsDateTime :=
              vPlano.dataSet.FieldByName('DATA_VENC').AsDateTime;
            dataSet.FieldByName('PLANO').AsString := 'S';
            Inc(vseqform);
            DataSet.FieldByName('SEQFORM').AsInteger := vseqform;//GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
            DataSet.FieldByName('HISTORICO').AsString := BuildHistorico('', True);

            dataSet.Post;
          end;
        end;
        vPlano.dataSet.next;
      end;
    finally
			vPlano.dataSet.EnableControls;
    end;
    vPlano.close;
  end;
end;

procedure TFormPag2.verificaPlanoNF;
const
  Cnumber = ['0'..'9'];
var
  i: Integer;
  vOK: Boolean;
  vValorTemp: Currency;
  vIdentPlano: string;
  ACodigoCondPag: Integer;
  ADescrCondPag: string;
  AParcelas: TStrings;
  vDataBanco: TDateTime;
  MontarPacelamentoStr: TMontarPacelamentoStr;
  vCountParcBol: Integer;
  ACodAdm: Integer;
  ADescAdm: string;
  ACodTerminalAdm: string;
  ADescTerminalAdm: string;
  ACodBandeiraAdm: Integer;
  ADescBandeiraAdm: string;
  ANumAutCartao: string;
  ANumDocParcelas: Integer;
  vParcelas: RParcelamentos;
  vInfDadosCartao: boolean;
  AStr: string;
  buscasTmp: TIBQuery;
begin
	if not dataSet.IsEmpty then
  	exit;

	vDataBanco := vDadosIni.getDataBanco(buscas);

  buscasTmp := TIBQuery.Create(Application);
  buscasTmp.Database := buscas.Database;
  buscasTmp.Transaction := buscas.Transaction;

  buscas.Close;
  buscas.SQL.Text := ' select nf.cod_cond_pag, cond.desc_cond_pag, ' +
  	' nfp.tband, band.descricao as desc_bandeira, nfp.caut, ' +
    ' nfp.cod_controle, ctr.nome_ctrl, ctr.tp_plano, ctr.docs, ctr.cartao_sped, nfp.vpag from nfce_pagamento nfp ' +
    ' inner join controles ctr on ' +
    '    ctr.codigo_ctrl = nfp.cod_controle ' +
    '    and ctr.codigo_emp = nfp.cod_empresa ' +
    ' inner join nfce nf on ' +
    '    nf.cod_nfce = nfp.cod_nfce ' +
    '    and nf.cod_empresa = nfp.cod_empresa ' +
    ' left join cond_pag cond on cond.cod_cond_pag = nf.cod_cond_pag ' +
    ' left join bandeiras_cartao band on band.cod_bandeira = nfp.tband and band.cod_empresa = nfp.cod_empresa ' +
    ' where nfp.cod_nfce = (select pd.cod_nfce from pedvenda pd ' +
    '                       where pd.nped = ' + IntToStr(FnumeroVenda) +
    '                       and pd.tipo = ' + QuotedStr(FtipoVenda) +
    '                       and pd.cod_empresa = ' + vDadosIni.codEmpresa + ')' +
    ' and nfp.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  if buscas.IsEmpty then
  begin
    buscas.Close;
    buscas.SQL.Text := ' select nf.cod_cond_pag, cond.desc_cond_pag,  ' +
      ' nfp.tband, band.descricao as desc_bandeira, nfp.caut, ' +
      ' nfp.cod_controle, ctr.nome_ctrl, ctr.tp_plano, ctr.docs, ctr.cartao_sped, nfp.vpag from notafiscal_pag nfp ' +
      ' inner join controles ctr on ' +
      '    ctr.codigo_ctrl = nfp.cod_controle ' +
      '    and ctr.codigo_emp = nfp.cod_empresa ' +
      '	inner join notafiscal nf on ' +
      '    nf.cod_nf = nfp.cod_nf ' +
      '    and nf.cod_empresa = nfp.cod_empresa ' +
      ' left join cond_pag cond on cond.cod_cond_pag = nf.cod_cond_pag ' +
      ' left join bandeiras_cartao band on band.cod_bandeira = nfp.tband and band.cod_empresa = nfp.cod_empresa ' +
      '	where nfp.cod_nf = (select pd.cod_nf from pedvenda pd ' +
      '                     where pd.nped = ' + IntToStr(FnumeroVenda) +
      '                     and pd.tipo = ' + QuotedStr(FtipoVenda) +
      '                     and pd.cod_empresa = ' + vDadosIni.codEmpresa + ')' +
      ' and nfp.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;
  end;

  if buscas.isempty then
    Exit;

  buscas.First;
  while not buscas.eof do
  begin
  	if (trim(buscas.FieldByName('DOCS').AsString) = 'N')
    	or (trim(buscas.FieldByName('DOCS').AsString) = 'S1') then
    begin
      Insert;
      dataSet.FieldByName('TIPDOC').AsString := buscas.FieldByName('DOCS').AsString;
      dataSet.FieldByName('COD_CONTROLE').AsInteger := buscas.FieldByName('COD_CONTROLE').AsInteger;
      //dataSet.FieldByName('HISTORICO').AsString := 'CREDITOS A RECEBER CONFORME ' + FtipoVenda + ' Nº ' + inttostr(FnumeroVenda);
      dataSet.FieldByName('VALORDOC').AsCurrency := buscas.FieldByName('VPAG').AsCurrency;
      DataSet.FieldByName('VALOR_CONTABIL').AsFloat := buscas.FieldByName('VPAG').AsCurrency;
      dataSet.FieldByName('TPDOCS').AsString := FtipoVenda;

      if trim(buscas.FieldByName('DOCS').AsString) = 'S1' then
			  dataSet.FieldByName('DATA_VENC').AsDateTime := vDataBanco;

      Inc(vseqform);
      DataSet.FieldByName('SEQFORM').AsInteger := vseqform;//GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
      DataSet.FieldByName('HISTORICO').AsString := BuildHistorico('', True);
      dataSet.Post;
    end
    else if trim(buscas.FieldByName('DOCS').AsString) = 'S2' then
    begin
    	vInfDadosCartao  := False;
    	ACodAdm          := 0;
      ADescAdm         := '';
      ACodTerminalAdm  := '';
      ADescTerminalAdm := '';
      ACodBandeiraAdm  := 0;
      ADescBandeiraAdm := '';
    	if trim(buscas.FieldByName('TP_PLANO').AsString) = 'C' then
      begin
      	ACodBandeiraAdm  := buscas.FieldByName('TBAND').AsInteger;
        ADescBandeiraAdm := buscas.FieldByName('DESC_BANDEIRA').AsString;
        ANumAutCartao   := trim(buscas.FieldByName('CAUT').AsString);
        
      	buscasTmp.Close;
        buscasTmp.SQL.Text :=  ' select tc.cod_term_adm, tc.desc_term_adm, ' +
        	' ac.cod_adm, ac.descricao_adm, ' +
        	' ac.taxa_por_controle_bandeira, ' +
          ' coalesce(ac.campo_nsu_obrig, ''N'') campo_nsu_obrig, ' +
          ' coalesce(ac.campo_num_aut_obrig, ''N'') campo_num_aut_obrig from terminal_cartao tc ' +
		    	' inner join adm_cartao ac on ac.cod_adm = tc.cod_adm and ac.cod_empresa = tc.cod_empresa and ac.ativo = 1' +
	    		' where tc.cod_empresa = ' + vDadosIni.codEmpresa +
  			  ' and tc.ativo = 1 ';
        buscasTmp.Open;
        buscasTmp.FetchAll;

        if buscasTmp.RecordCount = 1 then
        begin
	        ACodAdm          := buscasTmp.FieldByName('cod_adm').AsInteger;
          ADescAdm         := buscasTmp.FieldByName('descricao_adm').AsString;
          ACodTerminalAdm  := buscasTmp.FieldByName('cod_term_adm').AsString;
          ADescTerminalAdm := buscasTmp.FieldByName('desc_term_adm').AsString;
        end
        else
        begin
        	vInfDadosCartao := True;
          Application.MessageBox('Terminal da Administradora do Cartão não informado', 'Atenção', 0 + 64);
        end;

        if not vInfDadosCartao then
	        if trim(buscasTmp.FieldByName('CAMPO_NSU_OBRIG').AsString) = 'S' then
          begin
          	vInfDadosCartao := True;
            Application.MessageBox('Num Doc/NSU/CV do Cartão não informado', 'Atenção', 0 + 64);
          end;

        if not vInfDadosCartao then
        	if trim(buscasTmp.FieldByName('CAMPO_NUM_AUT_OBRIG').AsString) = 'S' then
	       		if trim(buscas.FieldByName('CAUT').AsString) = '' then
            begin
            	vInfDadosCartao := True;
              Application.MessageBox('Número da Autorização do Cartão deve ser informado', 'Atenção', 0 + 64);
            end;

        if not vInfDadosCartao then
        	if trim(ACodTerminalAdm) = '' then
          begin
          	vInfDadosCartao := True;
            Application.MessageBox('Terminal da Administradora do Cartão não informado', 'Atenção', 0 + 64);
          end;

        if not vInfDadosCartao then
	        if trim(buscasTmp.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').AsString) = 'B' then
          	if buscas.FieldByName('TBAND').AsInteger <= 0 then
            begin
            	vInfDadosCartao := True;
              Application.MessageBox('Bandeira do Cartão não informado', 'Atenção', 0 + 64);
            end;

        if not vInfDadosCartao then
	        if trim(buscasTmp.FieldByName('TAXA_POR_CONTROLE_BANDEIRA').AsString) = 'B' then
          begin
  	        if (buscas.FieldByName('CARTAO_SPED').AsInteger <> 1)
    	        and (buscas.FieldByName('CARTAO_SPED').AsInteger <> 2) then
      	    begin
        	  	vInfDadosCartao := True;
          	  Application.MessageBox(pchar('Controle ' +
            	  IntToStr(buscas.FieldByName('COD_CONTROLE').AsInteger) +
	              ' - ' + trim(buscas.FieldByName('NOME_CTRL').AsString) +
  	            ' definido como cartão, favor informar se é Débito ou Crédito'),
    	          'Atenção', 0 + 64);
      	    end;
          end;
      end;

      if not vInfDadosCartao then
      begin
        ACodigoCondPag := buscas.FieldByName('cod_cond_pag').AsInteger;
        ADescrCondPag := buscas.FieldByName('desc_cond_pag').AsString;

        if UpperCase(Trim(ADescrCondPag)) = 'A VISTA' then
        begin
          ACodigoCondPag := 0;
          ADescrCondPag := '1X';
        end
        else
        begin
          SetLength(vParcelas, 0);

          for I := 1 to Length(ADescrCondPag) do
            if ADescrCondPag[I] in Cnumber then
              AStr := AStr + ADescrCondPag[I]
            else if AStr <> '' then
            begin
              SetLength(vParcelas, Length(vParcelas) + 1);
              AStr := '';
            end;

          if Length(vParcelas) <= 0 then
          begin
            ACodigoCondPag := 0;
            ADescrCondPag := '1X';
          end;
        end;

        if vDadosIni.vCadBasicos.AHandle = 0 then
          CarregaPacote('pkCadastrosBasicos', vDadosIni.vCadBasicos.AHandle);

        if vDadosIni.vCadBasicos.AHandle = 0 then
        begin
          Application.MessageBox('Pacote de Cadastros básicos não carregado', 'Anteção', 0 + 64);
          Exit;
        end;

        @MontarPacelamentoStr := GetProcAddress(vDadosIni.vCadBasicos.AHandle, PChar('MontarPacelamentoStr'));
        if Assigned(MontarPacelamentoStr) then
        begin
          AParcelas := TStringList.Create;
          try
            AParcelas.Text := MontarPacelamentoStr(ACodigoCondPag, ADescrCondPag, buscas.FieldByName('VPAG').AsCurrency, IntToStr(FnumeroVenda),
              '', '', '', '', FcodigoCliente, 0, vDataBanco, buscas.FieldByName('cod_controle').AsInteger);

            vQtde := AParcelas.Count;
            SetLength(vDocumento, AParcelas.Count);
            SetLength(vData     , AParcelas.Count);
            SetLength(vValor    , AParcelas.Count);
            SetLength(vValorLiq , AParcelas.Count);

            for I := 0 to AParcelas.Count - 1 do
            begin
              vDocumento[I] := vDadosIni.getValue(AParcelas[I], 1);
              vData[I]      := vDadosIni.getValue(AParcelas[I], 2);
              vValor[I]     := StrToFloat(vDadosIni.getValue(AParcelas[I], 3));
              vValorLiq[I]  := 0;
            end;
            if High(vData) > -1 then
            begin
              vCountParcBol := getCountParcelasBoleto;
              FMaxDataParcela := StrToDateDef(vData[High(vData)], 0);

              if vCountParcBol > 0 then
                for I := Low(vDocumento) to High(vDocumento)  do
                  vDocumento[I] := vDadosIni.StrZero(ANumDocParcelas, 6) + '-' + IntToStr(vCountParcBol + I + 1);

              for I := 0 to vQtde - 1 do
              begin
                Insert;
                dataSet.FieldByName('TIPDOC').AsString := buscas.FieldByName('DOCS').AsString;
                dataSet.FieldByName('COD_CONTROLE').AsInteger := buscas.FieldByName('COD_CONTROLE').AsInteger;
                //dataSet.FieldByName('HISTORICO').AsString := 'CREDITOS A RECEBER CONFORME ' + FtipoVenda + ' Nº ' + inttostr(FnumeroVenda);

                dataSet.FieldByName('NDOC').AsString := vDocumento[I];
                dataSet.FieldByName('TPDOCS').AsString := FtipoVenda;
                dataSet.FieldByName('DATA_VENC').AsString := vData[I];

                dataSet.FieldByName('VALORDOC').AsCurrency := vValor[I];
                DataSet.FieldByName('VALOR_CONTABIL').AsFloat := vValor[I];

                if trim(buscas.FieldByName('TP_PLANO').AsString) = 'C' then
                begin
                	dataSet.FieldByName('COD_ADM').AsInteger          := ACodAdm;
                  dataSet.FieldByName('DESC_ADM').AsString          := ADescAdm;
                  dataSet.FieldByName('COD_TERMINAL_ADM').AsString  := ACodTerminalAdm;
                  dataSet.FieldByName('DESC_TERMINAL_ADM').AsString := ADescTerminalAdm;
                  dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger := ACodBandeiraAdm;
                  dataSet.FieldByName('DESC_BANDEIRA').AsString     := ADescBandeiraAdm;
                end;

                dataSet.FieldByName('NPARCELA').AsInteger := I + 1;
  			        dataSet.FieldByName('QTDE_PARC').AsInteger := vQtde;

                Inc(vseqform);
                DataSet.FieldByName('SEQFORM').AsInteger := vseqform;//GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
                DataSet.FieldByName('HISTORICO').AsString := BuildHistorico('', True);
                dataSet.Post;
              end;
            end;
          finally
            FreeAndNil(AParcelas);
          end;
        end;
      end;
    end
    else
    begin
      Application.MessageBox('Não foi possível efetuar o parcelamento', 'Anteção', 0 + 64);
      Exit;
    end;

    buscas.next;
  end;
end;

function TFormPag2.verificaReciboAntecipadoNotaFiscal: Boolean;
var
  I: Integer;
begin
  Result := False;

  if FtipoVenda = 'REC' then
    Exit;

  if (FvalorInformado >= FvalorVenda) then
    Exit;

  if (vDadosIni.vEmp.vModoFaturamento = 'S') and (fCodNF > 0) and (FNum_Nf > 0) then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select r.nrecibo, r.valor from recibos r' +
      ' where r.num_nf  = ' + IntToStr(FNum_Nf) +
      ' and r.cod_nf = ' + IntToStr(fCodNF) +
      ' and ((recant = ''S'') or (recant = ''O'')) ' +
      ' and coalesce(r.status_rec, '''') = '''' ' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if (buscas.FieldByName('nrecibo').AsInteger > 0) and (buscas.FieldByName('valor').AsFloat > 0) then
    begin
      try
        //fValorValeCompraAutomatico := fValorValeCompraAutomatico + buscas.FieldByName('valor').AsFloat;
        vRecibo.dataSet.Filter := 'nrecibo = ' + IntToStr(buscas.FieldByName('nrecibo').AsInteger);
        vRecibo.dataSet.Filtered := True;
        if vRecibo.dataSet.FieldByName('nrecibo').AsInteger = buscas.FieldByName('nrecibo').AsInteger then
        begin
          vRecibo.dataSet.Edit;
          vRecibo.dataSet.FieldByName('selec').AsString := 'S';
          vRecibo.Post;

          Result := receberRecibo(orAntecipado);
        end;
      finally
        vRecibo.dataSet.Filter := '';
        vRecibo.dataSet.Filtered := False;
      end;
    end;
  end;
end;

function TFormPag2.verificaRetencaoTributosFederais: boolean;
var
  totRet, retAtual, vretir, vretiss, vretcsll, vretpis, vretcofins, vretcp: Currency;
  controles: TStrings;
  conf: TConfig_sistema_class;
  messages: TStrings;
  I: Integer;
  txtRet: string;
begin
  Result := True;

  messages := TStringList.Create;
  conf := TCfg_sis.getConf('nf_s_retencoes_federais', queryCons.query, vDadosIni.cod_empresa);
  try
    vretiss    := 0;
    vretir     := 0;
    vretcsll   := 0;
    vretpis    := 0;
    vretcofins := 0;
    vretcp     := 0;

    if fCodNF > 0 then
    begin
      queryCons.Table('notafiscal', 'valor_irrf, vretcsll, vretpis, vretcofins, cod_cliente')
        .Equals('cod_nf', fCodNF)
        .Equals('cod_empresa', vDadosIni.cod_empresa)
        .Open();

      vretir     := vretir + queryCons.ffloat('valor_irrf');
      vretcsll   := vretcsll + queryCons.ffloat('vretcsll');
      vretpis    := vretpis + queryCons.ffloat('vretpis');
      vretcofins := vretcofins + queryCons.ffloat('vretcofins');
    end;

    if (trim(FtipoVenda) = 'OS') then
    begin
      queryCons.SQL(
        ' select ' +
        ' sum(coalesce(issret_servico, 0)) issret_servico, ' +
        ' sum(coalesce(irrf_servico, 0)) irrf_servico, ' +
        ' sum(coalesce(pisrf_servico, 0)) pisrf_servico, ' +
        ' sum(coalesce(cofinsrf_servico, 0)) cofinsrf_servico, ' +
        ' sum(coalesce(csslrf_servico, 0)) csslrf_servico from pedvenda_serv ' +
        ' where nped = ' + IntToStr(numeroVenda) +
        ' and tipo = ' + QuotedStr(FtipoVenda) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and nfse_id is null '+
        ' and (status is null or status = '''') ')
        .Open;

      vretiss    := vretiss + queryCons.ffloat('issret_servico');
      vretir     := vretir + queryCons.ffloat('irrf_servico');
      vretcsll   := vretcsll + queryCons.ffloat('csslrf_servico');
      vretpis    := vretpis + queryCons.ffloat('pisrf_servico');
      vretcofins := vretcofins + queryCons.ffloat('cofinsrf_servico');

      queryCons.SQL(
        'select sum(ns.vretirrf) vretirrf, sum(ns.vretcp) vretcp, sum(ns.vretpis) vretpis, ' +
        'sum(ns.vretcofins) vretcofins, sum(ns.vretcsll) vretcsll, sum(ns.vretiss) vretiss ' +
        'from nfse_os ns ' +
        'inner join nfse n on n.id = ns.nfse_id and n.situacao <> 0 ' +
        'where ns.nped = :nped and ns.tipo = :tipo and ns.cod_empresa = :cod_empresa')
        .ParamValue('nped', numeroVenda)
        .ParamValue('tipo', FtipoVenda)
        .ParamValue('cod_empresa', vDadosIni.cod_empresa)
        .Open();

      vretiss    := vretiss + queryCons.ffloat('vretiss');
      vretir     := vretir + queryCons.ffloat('vretirrf');
      vretcsll   := vretcsll + queryCons.ffloat('vretcsll');
      vretpis    := vretpis + queryCons.ffloat('vretpis');
      vretcofins := vretcofins + queryCons.ffloat('vretcofins');
      vretcp     := vretcp + queryCons.ffloat('vretcp');
    end;


    if (vretiss > 0) and (vDadosIni.vPedVnd.ctrlIssRetidoNFSe <= 0) then
      messages.Add( '-' + sLineBreak +
        'Habilite o controle referente a Retenção do ISS "ped_vnd_os_ctrl_iss_retido_nfse"'
      );

    if (vretir > 0) or (vretcsll > 0) or (vretpis > 0) or (vretcofins > 0) or (vretcp > 0) then
      if not conf.AsBoolean then
        messages.Add( '-' + sLineBreak + 'Habilite o uso da retenções federais "nf_s_retencoes_federais" = "Sim"');

    if (vretir > 0) and (conf.ReadInteger('Controles', 'Retencao_IRRF', 0) <= 0) then
      messages.Add( '-' + sLineBreak + Format('%n retido de IRRF (Retencao_IRRF) - não configurado', [vretir]));

    if (vretcsll > 0) and (conf.ReadInteger('Controles', 'Retencao_CSLL', 0) <= 0) then
      messages.Add( '-' + sLineBreak + Format('%n retido de CSLL (Retencao_CSLL) - não configurado', [vretcsll]));

    if (vretpis > 0) and (conf.ReadInteger('Controles', 'Retencao_PIS', 0) <= 0) then
      messages.Add( '-' + sLineBreak + Format('%n retido de PIS (Retencao_PIS) - não configurado', [vretpis]));

    if (vretcofins > 0) and (conf.ReadInteger('Controles', 'Retencao_COFINS', 0) <= 0) then
      messages.Add( '-' + sLineBreak + Format('%n retido de COFINS (Retencao_COFINS) - não configurado', [vretcofins]));

    if (vretcp > 0) and (conf.ReadInteger('Controles', 'Retencao_CP', 0) <= 0) then
      messages.Add( '-' + sLineBreak +
        Format('%n retido de Contribuição Previdenciária (Retencao_CP) - não configurado', [vretcp])
       );

    if messages.Count > 0 then
    begin
      messages.Insert(0, 'Configurações incompletas');
      messages.Add( IfThen(messages.Count > 0, '-' + sLineBreak) +
        'Todos os controles configuradors devem ser configurados como baixa automática ' +
        'ou controle configurado para não gerar financeiro.' + sLineBreak + '-' + sLineBreak +
        'Efetue as configurações necessárias para o sistema realizar o lançamento de retenção das Notas.' + sLineBreak + sLineBreak +
        'Global: nf_s_retencoes_federais'
      );
      ShowErro( messages.Text );
      Result := False;
      Exit;
    end;

    totRet := vretir + vretcsll + vretpis + vretcofins + vretcp + vretiss;

    if totRet <= 0 then
      Exit;

    controles := NewStringList(True);

    if not conf.AsBoolean and (vretiss <= 0) then// Para manter compativel com antes
      Exit;

    controles.Add(IntToStr(vDadosIni.vPedVnd.ctrlIssRetidoNFSe));
    controles.Add(IntToStr(conf.ReadInteger('Controles', 'Retencao_IRRF', 0)));
    controles.Add(IntToStr(conf.ReadInteger('Controles', 'Retencao_CSLL', 0)));
    controles.Add(IntToStr(conf.ReadInteger('Controles', 'Retencao_PIS', 0)));
    controles.Add(IntToStr(conf.ReadInteger('Controles', 'Retencao_COFINS', 0)));
    controles.Add(IntToStr(conf.ReadInteger('Controles', 'Retencao_CP', 0)));

    for I := 0 to controles.Count - 1 do
      if controles[I] <> '0' then
      begin
        queryCons.SQL(' select codigo_ctrl, codigo_emp, docs, ' +
          ' coalesce(nao_gera_finan, ''N'') nao_gera_finan, ' +
          ' coalesce(baixa_automatica, ''N'') baixa_automatica, ' +
          ' coalesce(n_conta_bx_auto, 0) n_conta_bx_auto from controles ' +
          ' where codigo_ctrl = ' + controles[I] +
          ' and codigo_emp = ' + vDadosIni.codEmpresa)
          .Open;

        if queryCons.IsEmpty then
        begin
          ShowErro('Controle configurado %s não encontrado,' +
            ' favor informar controle configurado como baixa automática' +
            ' ou controle configurado para não gerar financeiro.' + #13 + #13 +
            'Para realizar o lançamento do Valor das Retenções de Nota',
            [controles[I]]
          );
          Result := False;
          exit;
        end;

        if queryCons.fdif('NAO_GERA_FINAN', 'S')
          and queryCons.fdif('BAIXA_AUTOMATICA', 'S') then
        begin
          ShowErro(
            'Controle %s deve ser como baixa automática ou configurado para não gerar financeiro.' + #13 + #13 +
            'Para realizar o lançamento das Retenções de Nota',
            [controles[I]]
          );
          Result := False;
          exit;
        end;

        if queryCons.fequals('BAIXA_AUTOMATICA', 'S')
          and (queryCons.ffloat('N_CONTA_BX_AUTO') <= 0) then
        begin
          ShowErro(
            'Favor informar o número da conta de saída plc para baixa automática.' +
            'Para realizar o lançamento das Retenções de Nota',
            [controles[I]]
          );
          Result := False;
          exit;
        end;

        retAtual := IfThen(conf.ReadString('Controles', 'Retencao_IRRF'  , '0') = controles[I], vretir) +
                    IfThen(conf.ReadString('Controles', 'Retencao_CSLL'  , '0') = controles[I], vretcsll) +
                    IfThen(conf.ReadString('Controles', 'Retencao_PIS'   , '0') = controles[I], vretpis) +
                    IfThen(conf.ReadString('Controles', 'Retencao_COFINS', '0') = controles[I], vretcofins) +
                    IfThen(conf.ReadString('Controles', 'Retencao_CP'    , '0') = controles[I], vretcp) +
                    IfThen(IntToStr(vDadosIni.vPedVnd.ctrlIssRetidoNFSe)        = controles[I], vretiss);

        if retAtual > 0 then
        begin
          txtRet := '';
          if (conf.ReadString('Controles', 'Retencao_IRRF', '0') = controles[I]) then
            txtRet := IfThen(vretir > 0, 'IR');

          if (conf.ReadString('Controles', 'Retencao_CSLL', '0') = controles[I]) and (vretcsll > 0) then
            txtRet := txtRet + IfThen(txtRet <> '', ', ') + 'CSLL';

          if (conf.ReadString('Controles', 'Retencao_PIS', '0') = controles[I]) and (vretpis > 0) then
            txtRet := txtRet + IfThen(txtRet <> '', ', ') + 'PIS';

          if (conf.ReadString('Controles', 'Retencao_COFINS', '0') = controles[I]) and (vretcofins > 0) then
            txtRet := txtRet + IfThen(txtRet <> '', ', ') + 'COFINS';

          if (conf.ReadString('Controles', 'Retencao_CP', '0') = controles[I]) and (vretcp > 0) then
            txtRet := txtRet + IfThen(txtRet <> '', ', ') + 'CP';

          if (IntToStr(vDadosIni.vPedVnd.ctrlIssRetidoNFSe) = controles[I]) and (vretiss > 0) then
            txtRet := txtRet + IfThen(txtRet <> '', ', ') + 'ISS';

          Insert;
          dataSet.FieldByName('VALORDOC').AsCurrency := retAtual;
          dataSet.FieldByName('valor_contabil').AsFloat := retAtual;
          dataSet.FieldByName('cod_controle').AsInteger := queryCons.fint('codigo_ctrl');
          DataSet.FieldByName('cod_cliente').AsInteger := FcodigoCliente;
          DataSet.FieldByName('cliente').AsString := FnomeCliente;
          dataSet.FieldByName('tipdoc').AsString := queryCons.fstr('docs');
          dataSet.FieldByName('HISTORICO').AsString := 'RETENCAO DOC FISCAL ' + txtRet;
          dataSet.FieldByName('TIP_CNT').AsString := 'C';
          Inc(vseqform);
          dataSet.FieldByName('SEQFORM').AsInteger := vseqform;
          dataSet.FieldByName('PERMITIR_EXCLUIR').AsString := 'R';
          dataSet.Post;
        end;
      end;

    somarDocumentos;
  finally
    conf.Free();
    messages.Free();
  end;
end;

function TFormPag2.VerificarReciboDevolucao(codigoCliente: integer; tipoDoc: string): boolean;
var
 possuiVale: boolean;
begin
 try
   possuiVale := false;
   Result := true;

   if not ((tipoDoc = 'REQ') or (tipoDoc = 'OS') or (tipoDoc = 'MOT') or (tipoDoc = 'PRE')) then
     exit;

   if TConfig_sistema_class.getConf('rec_exibicao_recebimento', buscas, vDadosIni.cod_empresa).
     ReadString('Onde', 'FormaDePagamento', 'S') <> 'S' then
     Exit;

   buscas.Close;
   buscas.SQL.Text := 'select sum(valor) as TotalRecibosEmAberto from recibos where cod_benef = ' +
     inttostr(codigoCliente) + ' and ((RECANT = ''S'') or (RECANT = ''O'')) and COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and ativo = 1 ' +
     ' and ((status_rec is null) or (status_rec <> ''RECEBIDO''))';
   buscas.open;

   if buscas.FieldByName('TOTALRECIBOSEMABERTO').AsFloat > 0 then
     possuiVale := true;

   buscas.Close;
   buscas.sql.text := 'Select * from recibos where cod_benef = ' +
       inttostr(codigoCliente) + ' and ((RECANT = ''S'') or (RECANT = ''O'')) and COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and ativo = 1';
   buscas.open;

    if ((possuiVale) and (not buscas.IsEmpty)) then
     Application.MessageBox('Cliente possui Vale Compra / Recibos', 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
 except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TFormPag2.VerificarValeProgFid: boolean;
var
  vcpf: string;
  vvales: Integer;
  vtemp: string;
begin
 try
   Result := true;

   vtemp := 'Cliente possui Vale - Programa de ' +
   	 vDadosIni.IfThen(vDadosIni.vProgFid.vHabilitarProgFid, 'Fidelidade', 'Cashback');
   
   if (not vDadosIni.vProgFid.vHabilitarProgFid) and (not vDadosIni.vCashback.vHabilitarCashback) then
     exit;

   if (vDadosIni.vProgFid.vHabilitarProgFid) and (vDadosIni.vProgFid.vCodControle <= 0) then
     exit
   else if (vDadosIni.vCashback.vHabilitarCashback) and (vDadosIni.vCashback.vCodControle <= 0) then
     exit;

   if not ((FtipoVenda = 'REQ') or (FtipoVenda = 'OS') or (FtipoVenda = 'MOT')) then
     exit;

   vvales := 0;

   SqlOpen(' select cpfcgc from clientes ' +
      ' where cod_cliente = ' + IntToStr(FcodigoCliente) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa);
   vcpf := buscas.FieldByName('cpfcgc').AsString;

   buscas.Close;
   buscas.SQL.Text := ' select count(*) from vale_cupons vl ' +
    ' where vl.ndoc = :ndoc and vl.tipodoc = :tipodoc ' +
    ' and vl.cod_emp_tipodoc = :cod_empresa ' +
    ' union ' +
    ' select count(*) from vale_cupons vl ' +
    ' left join empresa_prog_fid empg on empg.cod_empresa = vl.cod_empresa ' +
    ' where vl.cpf = :cpf ' +
    ' and vl.cod_empresa in (case when (empg.cod_empresa > 0) then empg.cod_empresa else :cod_empresa end) ' +
    ' and coalesce(vl.ndoc, 0) = 0 ';
//    ' select count(*) from vale_cupons vl ' +
//    ' inner join conta_corrente_prog_fidelidade cc on ' +
//    '   vl.codigo = cc.nvalecupom and vl.erp_api = cc.erp_api ' +
//    ' 	and vl.cod_empresa = cc.cod_empresa and vl.erp_api = ''E'' ' +
//    ' where cc.ndoc = :ndoc and cc.tipodoc = :tipodoc ' +
//    ' 	and cc.cod_empresa = :cod_empresa and cc.vale = ''S'' ' +
//    ' select count(*) from vale_cupons vl ' +
//    ' inner join conta_corrente_prog_fidelidade cc on ' +
//    '    vl.codigo = cc.nvalecupom and vl.erp_api = cc.erp_api ' +
//    '		 and vl.cod_empresa = cc.cod_empresa ' + //and vl.erp_api = ''A'' ' +
//    ' left join empresa_prog_fid empg on empg.cod_empresa = vl.cod_empresa ' +
//    ' where vl.cpf = :cpf ' +
//    ' and vl.cod_empresa in (case when (empg.cod_empresa > 0) then empg.cod_empresa else :cod_empresa end) ' +
//    ' and cc.vale = ''S'' ' +
//    ' and coalesce(cc.ndoc, 0) = 0 ';
   buscas.ParamByName('ndoc').AsInteger := FnumeroVenda;
   buscas.ParamByName('tipodoc').AsString := FtipoVenda;
   buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
   buscas.ParamByName('cpf').AsString := vcpf;
   buscas.open;

   buscas.First;
   while not buscas.Eof do
   begin
     vvales := vvales + buscas.FieldByName('count').AsInteger;

     buscas.Next;
   end;

   if (not buscas.IsEmpty) then
     if (vvales > 0) then
       Application.MessageBox(PChar(vtemp),
         'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
 except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TFormPag2.verificaTerceiro;
begin
  if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
  begin
    if frmFormPag2.edChequeCodigoTerceiro.Valor <> 0 then
    begin
      frmFormPag2.edChequeNomeTerceiro.Text :=
        retornaValor('select nome_cliente as valor from clientes where cod_cliente = ' +
        IntToStr(trunc(frmFormPag2.edChequeCodigoTerceiro.Valor)) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa);
      if frmFormPag2.edChequeNomeTerceiro.Text = '' then
      begin
        Application.MessageBox('Terceiro não encontrado', 'Informação', MB_OK +
          MB_ICONINFORMATION);
        frmFormPag2.edChequeCodigoTerceiro.Valor := 0;
      end
      else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
      begin
        if not Falteracao then
        begin
          if getDadosBancarios(trunc(frmFormPag2.edChequeCodigoTerceiro.Valor)) then
          begin
            frmFormPag2.edChequeAgencia.Text := FchequeAgencia;
            frmFormPag2.edChequeConta.Text := FchequeConta;
            frmFormPag2.edChequeNumBanco.Text := FchequeNumeroBanco;
            frmFormPag2.edChequeNomeBanco.Text := FchequeNomeBanco;
          end;
        end;
      end;
    end;
  end
  else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S2' then
  begin
    if frmFormPag2.edCreditoCodigoTerceiro.Valor <> 0 then
    begin
      frmFormPag2.edCreditoNomeTerceiro.Text :=
        obFormPag2.retornaValor('select nome_cliente as valor from clientes where cod_cliente = ' +
        IntToStr(trunc(frmFormPag2.edCreditoCodigoTerceiro.Valor)) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa);
      if frmFormPag2.edCreditoNomeTerceiro.Text = '' then
      begin
        Application.MessageBox('Terceiro não encontrado', 'Informação', MB_OK +
          MB_ICONINFORMATION);
        frmFormPag2.edCreditoCodigoTerceiro.Valor := 0;
      end;
    end;
  end;
end;

function TFormPag2.verificaValeCompraDevolucao: Boolean;
var
  vlista: TStringList;
  I: Integer;
  vSeq: Integer;
begin
  Result := False;
  fValorValeCompraAutomatico := 0;
  if vDadosIni.vEmp.vUsarValorDEVFormPag <> 'S' then
    Exit;
  if (FtipoVenda = 'REQ') then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select distinct d.sequencia from devolucao d' +
      ' where d.cod_venda = ' + IntToStr(FnumeroVenda) +
      ' and d.tipo_venda = ''REQ'' and d.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    vlista := TStringList.Create;
    vlista.Clear;
    buscas.First;
    while not buscas.Eof do
    begin
      vlista.Add(IntToStr(buscas.FieldByName('SEQUENCIA').AsInteger));
      buscas.Next;
    end;

    vControle.selecionaControlesFormPag('', 1);

    for I := 0 to vlista.Count - 1 do
    begin
      vSeq:= StrToInt(vlista[i]);
      buscas.Close;
      buscas.SQL.Text := 'select r.nrecibo, r.valor from recibos r' +
        ' where r.nrecibo = ' + IntToStr(vSeq) +
        ' and ((recant = ''S'') or (recant = ''O'')) ' +
        ' and coalesce(r.status_rec, '''') = '''' ' +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;

      if (buscas.FieldByName('nrecibo').AsInteger > 0) and (buscas.FieldByName('valor').AsFloat > 0) then
      begin
        try
          fValorValeCompraAutomatico := fValorValeCompraAutomatico + buscas.FieldByName('valor').AsFloat;
          vRecibo.dataSet.Filter := 'nrecibo = ' + IntToStr(buscas.FieldByName('nrecibo').AsInteger);
          vRecibo.dataSet.Filtered := True;
          vRecibo.dataSet.Edit;
          vRecibo.dataSet.FieldByName('selec').AsString := 'S';
          vRecibo.Post;

          Result := receberRecibo(orValeDevolucao);

        finally
          vRecibo.dataSet.Filter := '';
          vRecibo.dataSet.Filtered := False;
        end;
      end;
    end;

    if vDadosIni.StrToFloatFormat(fValorValeCompraAutomatico,2) > vDadosIni.StrToFloatFormat(FvalorVenda,2) then
    begin
      vRecibo.dataSet.CancelUpdates;
      if vRecibo.vHistRec.dataSet.Active then
        vRecibo.vHistRec.dataSet.CancelUpdates;
      dataSet.CancelUpdates;
      somarDocumentos;
      Application.MessageBox(pchar('Valor das devoluções maior que o valor da venda. Verifique!' + #13 +
      'Valor das devoluções: ' + Format('%0.2n', [fValorValeCompraAutomatico]) + #13 +
      'Valor da venda: ' + Format('%0.2n', [FvalorVenda])), 'Atenção', 0 + 64);
      fValorValeCompraAutomatico := 0;
    end;

  end;
end;

function TFormPag2.verificaValeContaCorrente: Boolean;
var
  buscasTemp: TIBQuery;
begin
  Result := True;

  if not vDadosIni.vProgFid.vHabilitarProgFid then
    exit;

  if not vDadosIni.testarControleProgFid(buscas) then
  begin
    Result := false;
    exit;
  end;

  buscasTemp := TIBQuery.Create(Application);
  buscasTemp.Database := buscas.Database;
  buscasTemp.Transaction := buscas.Transaction;

  buscasTemp.Close;
  buscasTemp.SQL.Text := ' select cc.*, cl.nome_cliente from vale_cupons vl ' +
    ' inner join conta_corrente_prog_fidelidade cc on ' +
    ' 		vl.ndoc = cc.ndoc and vl.tipodoc = cc.tipodoc and vl.cod_emp_tipodoc = cc.cod_emp_tipodoc ' +
    ' inner join clientes cl on cl.cod_cliente = cc.cod_cliente and cl.cod_empresa = cc.cod_empresa ' +
    ' where vl.ndoc = ' + IntToStr(FnumeroVenda) + ' and vl.tipodoc = ' + QuotedStr(FtipoVenda) +
    ' and vl.cod_emp_tipodoc = ' + vDadosIni.codEmpresa +
    ' and cc.tipo = ''DÉBITO'' and cc.vale = ''S'' ' +
    ' and vl.erp_api = ''E'' ';
//    ' select cc.*, cl.nome_cliente from vale_cupons vl ' +
//    ' inner join conta_corrente_prog_fidelidade cc on ' +
//    ' 		vl.codigo = cc.nvalecupom and vl.erp_api = cc.erp_api and vl.cod_empresa = cc.cod_empresa ' +
//    ' inner join clientes cl on cl.cod_cliente = cc.cod_cliente and cl.cod_empresa = cc.cod_empresa ' +
//    ' where cc.ndoc = ' + IntToStr(FnumeroVenda) + ' and cc.tipodoc = ' + QuotedStr(FtipoVenda) +
//    ' and cc.cod_empresa = ' + vDadosIni.codEmpresa +
//    ' and cc.tipo = ''DÉBITO'' and cc.vale = ''S'' ' +
//    ' and vl.erp_api = ''E'' ';
  buscasTemp.Open;
  buscasTemp.FetchAll;

  buscasTemp.First;
  while not buscasTemp.Eof do
  begin
    Insert;
//    dataSet.FieldByName('DATA_VENC').AsDateTime := buscasTemp.FieldByName('DATA_VENC_PROG').AsDateTime;
//    dataSet.FieldByName('NDOC').AsString := buscasTemp.FieldByName('NDOC').AsString;
    dataSet.FieldByName('VALORDOC').AsCurrency := buscasTemp.FieldByName('valor').AsCurrency;
    dataSet.FieldByName('valor_contabil').AsFloat := buscasTemp.FieldByName('valor').AsFloat;
    dataSet.FieldByName('COD_CONTROLE').AsInteger := vDadosIni.vProgFid.vCodControle;
    DataSet.FieldByName('cod_cliente').AsInteger := FcodigoCliente;
    DataSet.FieldByName('cliente').AsString := FnomeCliente;
//    DataSet.FieldByName('nosso_numero_banco').AsString := vBol.dataSet.FieldByName('nosso_numero_banco').AsString;
    dataSet.FieldByName('TIPDOC').AsString := 'N';
    //dataSet.FieldByName('HISTORICO').AsString := 'CREDITOS A RECEBER CONFORME ' + FtipoVenda + ' Nº ' + inttostr(FnumeroVenda);
    dataSet.FieldByName('TIP_CNT').AsString := 'C';
    Inc(vseqform);
    dataSet.FieldByName('SEQFORM').AsInteger := vseqform;//GenCodigo('FORMPAGAMENTO', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
    dataSet.FieldByName('PERMITIR_EXCLUIR').AsString := 'P';// Nao permite excluir ou alterar vale resgate
    dataSet.FieldByName('PRG_FID').AsString := 'S';
    DataSet.FieldByName('HISTORICO').AsString := BuildHistorico('', True);
    dataSet.Post;
//    fGerouFormaBoleto := True;
    buscasTemp.Next;
    somarDocumentos;
  end;
end;

function TFormPag2.vincularIntermediadorControle: boolean;
var
  buscas2: TIBQuery;
begin
  try
    Result := false;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    buscas2.Close;
    buscas2.SQL.Text := 'SELECT FIRST 1 SEQID FROM INTERMEDIADOR_CONTROLE_EC ' +
       ' WHERE LOCAL_VENDA = :LOCAL_VENDA ' +
       ' AND INTERMEDIADOR = :INTERMEDIADOR ' +
       ' AND COD_EMPRESA = :COD_EMPRESA ';
    buscas2.ParamByName('LOCAL_VENDA').AsString := localvendaEC;
    buscas2.ParamByName('INTERMEDIADOR').AsString := intermediadorEC;
    buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas2.Open;

    if not vDadosIni.PesqPros(IfThen(buscas2.IsEmpty, 'FPG043', 'FPG044'), 'VINCULAR',
    	'LOCAL VND ' + IfThen(Length(trim(localvendaEC)) > 20, Copy(localvendaEC, 1, 20), localvendaEC) +
    	'INTERM: ' + IfThen(Length(trim(intermediadorEC)) > 20, Copy(intermediadorEC, 1, 20), intermediadorEC),
      'INTERMEDIADOR_CONTROLE_EC', '', buscas, true) then
      Exit;

     if trim(localvendaEC) = '' then
     begin
       Application.MessageBox(pchar('Local de Venda deve ser informado!'),
        'Informação', MB_OK + MB_ICONERROR);
       exit;
     end;

     if trim(intermediadorEC) = '' then
     begin
       Application.MessageBox(pchar('Intermediador deve ser informado!'),
        'Informação', MB_OK + MB_ICONERROR);
       exit;
     end;

     if codControleEC <= 0 then
     begin
       Application.MessageBox(pchar('Controle deve ser informado!'),
        'Informação', MB_OK + MB_ICONERROR);
       exit;
     end;

//     if not buscas2.IsEmpty then
//     begin
//       Application.MessageBox(pchar('Intermediador já vinculado a um controle'),
//        'Informação', MB_OK + MB_ICONERROR);
//       exit;
//     end;

     if buscas2.IsEmpty then
     begin
       buscas.Close;
       buscas.SQL.Text := ' INSERT INTO INTERMEDIADOR_CONTROLE_EC ' +
          ' (SEQID, COD_EMPRESA, LOCAL_VENDA, INTERMEDIADOR, CODIGO_CTRL, METODO_PAG_ID) ' +
          ' VALUES (:SEQID, :COD_EMPRESA, :LOCAL_VENDA, :INTERMEDIADOR, :CODIGO_CTRL, :METODO_PAG_ID); ';
       buscas.ParamByName('SEQID').AsInteger := Gencodigo('INTERMEDIADOR_CONTROLE_EC', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
       buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas.ParamByName('LOCAL_VENDA').AsString := localvendaEC;
       buscas.ParamByName('INTERMEDIADOR').AsString := intermediadorEC;
       buscas.ParamByName('CODIGO_CTRL').AsInteger := codControleEC;
       buscas.ParamByName('METODO_PAG_ID').AsInteger := IfThen(vEcommerce.dataSet.FieldByName('METODO_PAG_ID').AsInteger >= 0,
          vEcommerce.dataSet.FieldByName('METODO_PAG_ID').AsInteger, 0);
       buscas.ExecSQL;
     end
     else
     begin
       buscas.Close;
       buscas.SQL.Text := ' UPDATE INTERMEDIADOR_CONTROLE_EC SET ' +
          ' CODIGO_CTRL = :CODIGO_CTRL ' +
          ' WHERE LOCAL_VENDA = :LOCAL_VENDA AND INTERMEDIADOR = :INTERMEDIADOR AND COD_EMPRESA = :COD_EMPRESA ';
       buscas.ParamByName('LOCAL_VENDA').AsString := localvendaEC;
       buscas.ParamByName('INTERMEDIADOR').AsString := intermediadorEC;
       buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas.ParamByName('CODIGO_CTRL').AsInteger := codControleEC;
       buscas.ExecSQL;
     end;

     if buscas.Transaction.InTransaction then
       buscas.Transaction.Commit;

     vDadosIni.GravaAuditoria(IfThen(buscas2.IsEmpty, 'FPG043', 'FPG044'), 'VINCULAR',
     'SUCESSO - ' + localvendaEC + ' ' + intermediadorEC + ' CODCONTROLE: ' + IntToStr(codControleEC),
     'INTERMEDIADOR_CONTROLE_EC', '', buscas);

     Result := True;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TFormPag2._abreFormContasBancarias: Boolean;
var
  formulario: Tform;
  vCodCnt: Integer;
begin
  try
    vContabanc._selecionaContasBancarias(FcodigoCliente);
    formulario := TForm.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Selecione a conta bancária do cheque';
    frmFormPag2.pnConsultaContasBancarias.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    Result := (formulario.ShowModal = mrOk);
  finally
    frmFormPag2.pnConsultaContasBancarias.Parent := frmFormPag2.tsContasBacarias;
    formulario.Free;
    formulario := nil;
  end;
end;

function TFormPag2._abreFormPesquisa: Boolean;
var
  formulario: TfrmPadrao;
  I:integer;
  pfkTipo: string;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 400;
    formulario.Height := 182;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Localizar Recibo';
    frmFormPag2.pnPesquisa.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.BorderIcons := [];
    formulario.Position := poScreenCenter;
    vRecibo.defineCampos(vRecibo.dataSet);
    leConfiguracoesRegistro(vRecibo.dataSet);
    result := (formulario.ShowModal = IDOK);
  finally
    if Result then
    begin
       if frmFormPag2.radiobutton2.Checked then
       begin
         for I := 0 to vRecibo.dataset.FieldCount - 1 do
         begin
           if vRecibo.dataset.Fields[I].DisplayLabel = frmFormPag2.ComboBox1.Text then
             vRecibo.vCampoPesq := vRecibo.dataSet.Fields[I].FieldName;
         end;
         vRecibo.vFimSql := '';
         if vRecibo.vCampoPesq <> 'TODOS' then
         begin
           if frmFormPag2.CheckBox1.Checked then
             vRecibo.vFimSql := vRecibo.vFimSql + ' and ' + vRecibo.vCampoPesq + ' = ' + quotedstr(trim(frmFormPag2.maskedit1.text))
           else
             vRecibo.vFimSql := vRecibo.vFimSql + ' and ' + vRecibo.vCampoPesq + ' like ' + quotedstr(trim(frmFormPag2.maskedit1.text) + '%');
           vRecibo.vFimSql := vRecibo.vFimSql + ' order by ' + vRecibo.vCampoPesq;
         end;
         if vRecibo.vCampoPesq<>'' then
           vRecibo.selecionaRecibosAntecipados(vRecibo.vFimSql);
//            vRecibo.Pesquisar(vRecibo.vCampoPesq, '', frmFormPag2.maskedit1.Text, vRecibo.CdsPesq);
       end;
       gravaConfiguracoesRegistro(vRecibo.dataSet);
    end;
    frmFormPag2.pnPesquisa.Parent := frmFormPag2.tsPesquisa;
    formulario.Free;
    formulario := nil;
  end;
end;

function TFormPag2._abreValeFuncionario: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 409;
    formulario.Height := 113;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Informe o Colaborador: ';
    vFunc.Close;
    vFunc._abreTodosFuncionarios;

    frmFormPag2.pnVale.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.BorderIcons := formulario.BorderIcons - [biMinimize, biMaximize, biHelp];
    result := (formulario.ShowModal = mrOk);

  finally
    frmFormPag2.pnVale.Parent := frmFormPag2.tsVale;
    formulario.Free;
    formulario := nil;
  end;
end;

function TFormPag2._existeCondPagPadrao(pTipo: string): boolean;
var
	vSql: string;
  buscas2: TIBQuery;
begin
	Result := False;

  if not vDadosIni.vCliente.vCondPagPorCliente then
  	exit;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;
                                                                                    
  vSql  := ' SELECT FIRST 1 COND_PAG.COD_COND_PAG, COND_PAG.DESC_COND_PAG, COND_PAG.SEQPRECO FROM COND_PAG ' +
  	' INNER JOIN COND_PAG_EMPRESA ON ' +
    '	  COND_PAG_EMPRESA.COD_COND_PAG = COND_PAG.COD_COND_PAG ' +
    '   AND COND_PAG_EMPRESA.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' WHERE COND_PAG.NATUREZA_CP <> ''C'' ' +
    ' AND COND_PAG.ATIVO = 1 ';

  if trim(pTipo) = 'PRE' then
  	vSql := vSql + ' AND COALESCE(COND_PAG.COND_PADRAO_CL_PREST, ''N'') = ''T'' '
  else
	  vSql := vSql + ' AND COALESCE(COND_PAG.COND_PADRAO_CL_VND, ''N'') = ''T'' ';

  buscas2.Close;
  buscas2.SQL.Text := vSql;
  buscas2.Open;

  Result := buscas2.RecordCount > 0;
end;

function TFormPag2._existeControlesPadrao: boolean;
var
	vSql: string;
  buscas2: TIBQuery;
begin
	Result := False;

  if vDadosIni.vEmp.vUsarControlesCliente <> 'S' then
  	exit;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;
                                                                                    
  vSql  := 'SELECT FIRST 1 CODIGO_CTRL, NOME_CTRL, QSEQPERF FROM CONTROLES' +
    ' WHERE CXENT = ''S'' ' +
    ' AND ATIVO = 1 ' +
    ' AND CODIGO_EMP = ' + vDadosIni.codEmpresa;

  vSql := vSql + ' AND COALESCE(FP_PADRAO_CL, ''N'') = ''T'' ';
  
  if vDadosIni.vEmp.vFinanceiroUnificado then
		vSql := vSql + ' AND (COALESCE(CONTROLE_VISIVEL, ''S'') = ''S'') ';

  buscas2.Close;
  buscas2.SQL.Text := vSql;
  buscas2.Open;

  Result := buscas2.RecordCount > 0;
end;

function TFormPag2._mdiAberto(pNomeFormMDI, pMensagem: string): Boolean;
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

function TFormPag2._selecionaControles: Boolean;
begin
  if alteracao then
    Result := vControle.selecionaControlesFormPag('')
  else
    Result := vControle.selecionaControlesFormPag(FformasCliente, FCtrlVND, ((FtipoVenda = 'PRE') or (FtipoVenda = 'REC')),FCtrlRegrasDescontos);
end;

function TFormPag2._validaPoliticasDescontos(pCreditoCH_Valor: Currency;pQtdParcelas:integer;pDataVencimento:TDate=0;pDeletar:boolean=false): boolean;
var
  vdatavenc:string;
  vTotalDias,vQtdParcelas:integer;
//  vMaxData:double;
  vValorParcela,vVRestoValorParcela: Currency;
  vDataChAlterada:boolean;
  vDataTemp,vChequeDtVencimento: TDateTime;
begin
  result:= true;
  if (not vDadosIni.vemp.vUsarPoliticasDesc) or (trim(FRegrasDescontos)='') then
    exit;
  begin
    vdatavenc:='';
    vQtdParcelas:=0;
    vValorParcela:= 0;
    vVRestoValorParcela:=0;
    vDataChAlterada:=false;
    if pDataVencimento>0 then
      FMaxDataParcela:= pDataVencimento
    else if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
    begin
      FMaxDataParcela:= FchequeDataVencimento;
      vChequeDtVencimento := FchequeDataVencimento;
      if vDtSet.Locate('cod_controle;SEQFORM',VarArrayOf([vControle.dataSet.FieldByName('codigo_ctrl').AsInteger,
        dataSet.FieldByName('SEQFORM').AsInteger]),[]) then
      begin
        if pDeletar then
          vChequeDtVencimento := vDtSet.FieldByName('data_venc').AsDateTime;
        if Falteracao then
          if (datetostr(vDtSet.FieldByName('data_venc').AsDateTime)<>datetostr(vChequeDtVencimento)) then
          begin
            vDataChAlterada:=true;
            vDataTemp:= vDtSet.FieldByName('data_venc').AsDateTime
          end;
      end;
    end;
    vDtSet.first;
    while not vDtSet.eof do
    begin
      if vDtSet.FieldByName('cod_controle').AsInteger=vControle.dataSet.FieldByName('codigo_ctrl').AsInteger then
      begin
         if Falteracao or pDeletar then
         begin
           if dataSet.FieldByName('SEQFORM').AsInteger=vDtSet.FieldByName('SEQFORM').AsInteger then
           begin
             if pos(datetostr(FMaxDataParcela),vdatavenc)=0 then
               inc(vQtdParcelas);
             vdatavenc:=vdatavenc+ datetostr(FMaxDataParcela)+'|';      
             vValorParcela:= vValorParcela+pCreditoCH_Valor
           end
           else
           begin
             if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
             begin
               if datetostr(vDtSet.FieldByName('data_venc').AsDateTime)=datetostr(vChequeDtVencimento) then
                  vValorParcela:= vValorParcela+vDtSet.FieldByName('valordoc').AsFloat;
               if (vDataChAlterada or pDeletar) and (vDataTemp= vDtSet.FieldByName('data_venc').AsDateTime) then
                 vVRestoValorParcela:= vVRestoValorParcela + vDtSet.FieldByName('valordoc').AsFloat;
             end
             else
             	 vValorParcela:= vValorParcela+vDtSet.FieldByName('valordoc').AsFloat;
             if pos(datetostr(vDtSet.FieldByName('data_venc').AsDateTime),vdatavenc)=0 then
             begin
               inc(vQtdParcelas);
               vdatavenc:=vdatavenc+ datetostr(vDtSet.FieldByName('data_venc').AsDateTime)+'|';
               if vDtSet.FieldByName('data_venc').AsDateTime>FMaxDataParcela then
                 FMaxDataParcela:=vDtSet.FieldByName('data_venc').AsDateTime;
             end;
           end;
         end
         else
         begin
           if pos(datetostr(vDtSet.FieldByName('data_venc').AsDateTime),vdatavenc)=0 then
             inc(vQtdParcelas);
           vdatavenc:=vdatavenc+ datetostr(vDtSet.FieldByName('data_venc').AsDateTime)+'|';
           if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
           begin
             if datetostr(vDtSet.FieldByName('data_venc').AsDateTime)=datetostr(vChequeDtVencimento) then
                vValorParcela:= vValorParcela+vDtSet.FieldByName('valordoc').AsFloat;
           end
           else
           	 vValorParcela:= vValorParcela+vDtSet.FieldByName('valordoc').AsFloat;
           if vDtSet.FieldByName('data_venc').AsDateTime>FMaxDataParcela then
             FMaxDataParcela:=vDtSet.FieldByName('data_venc').AsDateTime;
         end;
      end;
      vDtSet.Next;
    end;
    if (not Falteracao) then
    begin
      if trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1' then
      begin
        if (pos(datetostr(vChequeDtVencimento),vdatavenc)=0) then
          inc(vQtdParcelas);
      end
      else
      	inc(vQtdParcelas);
      vValorParcela:= pCreditoCH_Valor + vValorParcela;
    end;
    if vValorParcela=0 then
      vValorParcela:=pCreditoCH_Valor;
    if vQtdParcelas>pQtdParcelas then
      pQtdParcelas:= vQtdParcelas;
    vTotalDias:= DaysBetween(vDadosIni.getDataBanco(buscas),FMaxDataParcela);
  end;
  vValorMin := 0;
  vValorMax := 0;
  if pQtdParcelas > 0 then
  begin
    buscas.close;
    buscas.sql.Text:= ' select first 1 rv.cod_regravnd, ' +
    	' rv.parcelamin, rv.parcelamax, ' +
      ' rv.maxparcelas, rv.prazomax from regras_vendas rv ' +
    	' inner join regravnd_controle rc on ' +
			'		rc.cod_regravnd = rv.cod_regravnd ' +
      '		and rc.cod_empresa = rv.cod_empresa ' +
      ' where rv.cod_regravnd in ' + FRegrasDescontos +
      ' and rc.codigo_ctrl = ' + inttostr(vControle.dataSet.FieldByName('codigo_ctrl').asInteger)+
      ' order by rv.maxparcelas desc ';
    buscas.open;
    if (buscas.FieldByName('maxparcelas').AsInteger < pQtdParcelas) and not pDeletar then
    begin
      Application.MessageBox(Pchar('Número de parcelas igual a ' + inttostr(pQtdParcelas) + ' excede o máximo permitido de '+inttostr(buscas.FieldByName('maxparcelas').AsInteger)+' de acordo com as políticas de pagamento da empresa.'), 'Atenção', 0 + 64);
      Result := False;
      Exit;
    end;

    buscas.close;
    buscas.sql.Text:= ' select first 1 rv.cod_regravnd, ' +
    	' rv.parcelamin, rv.parcelamax, ' +
      ' rv.maxparcelas, rv.prazomax from regras_vendas rv ' +
      ' inner join regravnd_controle rc on ' +
			'		rc.cod_regravnd = rv.cod_regravnd ' +
      '		and rc.cod_empresa = rv.cod_empresa ' +
      ' where rv.cod_regravnd in ' + FRegrasDescontos +
      ' and rc.codigo_ctrl = ' + inttostr(vControle.dataSet.FieldByName('codigo_ctrl').asInteger) +
      ' and (coalesce(rv.maxparcelas,0) >= :pMaxparcelas) ' +
      ' order by rv.parcelamin desc ';
    buscas.ParamByName('pMaxparcelas').AsInteger:= pQtdParcelas;
    buscas.open;

    vValorMin := vDadosIni.StrToFloatFormat(buscas.FieldByName('parcelamin').AsCurrency, 2);
    vValorMax := vDadosIni.StrToFloatFormat(buscas.FieldByName('parcelamax').AsCurrency, 2);

    if (trim(vControle.DataSet.FieldByName('docs').AsString) = 'S1') and (vValorParcela > 0) then
    begin
      if (vDadosIni.StrToFloatFormat(vValorParcela, 2) < vValorMin)  then
      begin
        Application.MessageBox(Pchar('Valor total dos cheques lançados com mesma data de vencimento' +
        	' deve ser maior ou igual a ' + format('%m', [vValorMin]) + ', de acordo com as políticas de pagamento da empresa.'),
          'Atenção', 0 + 64);
        Result := False;
        Exit;
      end
      else if (vDadosIni.StrToFloatFormat(vValorParcela, 2) > vValorMax)  then
      begin
        Application.MessageBox(Pchar('Valor total dos cheques lançados com mesma data de vencimento' +
        	' deve ser menor ou igual a ' + format('%m', [vValorMax]) + ', de acordo com as políticas de pagamento da empresa.'),
          'Atenção', 0 + 64);
        Result := False;
        Exit;
      end
      else if (vVRestoValorParcela > 0) and (vDadosIni.StrToFloatFormat(vVRestoValorParcela, 2) < vValorMin)then
      begin
        Application.MessageBox(Pchar('Valor total de outros cheques lançados com mesma data de vencimento' +
        	' tem valor inferior ao mínimo de ' + format('%m', [vValorMin]) + ' de acordo com as políticas de pagamento da empresa.'),
          'Atenção', 0 + 64);
        Result := False;
        Exit;
      end
      else if (vVRestoValorParcela > 0) and (vDadosIni.StrToFloatFormat(vVRestoValorParcela, 2) > vValorMax)then
      begin
        Application.MessageBox(Pchar('Valor total de outros cheques lançados com mesma data de vencimento' +
        	' tem valor superior ao máximo de ' + format('%m', [vValorMax]) + ' de acordo com as políticas de pagamento da empresa.'),
          'Atenção', 0 + 64);
        Result := False;
        Exit;
      end;
    end
    else if ((vDadosIni.StrToFloatFormat((vValorParcela / pQtdParcelas), 2) < vValorMin)
    	or (vDadosIni.StrToFloatFormat(pCreditoCH_Valor, 2) < vValorMin)) and (vValorParcela > 0) then
    begin
      Application.MessageBox(Pchar('Parcela mínima deve ser maior ou igual a ' + format('%m', [vValorMin]) +
      	' de acordo com as políticas de pagamento da empresa.'),
        'Atenção', 0 + 64);
      Result := False;
      Exit;
    end
    else if (vDadosIni.StrToFloatFormat((vValorParcela / pQtdParcelas), 2) > vValorMax) and (vValorParcela > 0) then
    begin
      Application.MessageBox(Pchar('Parcela máxima deve ser menor ou igual a ' + format('%m', [vValorMax]) +
      	' de acordo com as políticas de pagamento da empresa.'),
        'Atenção', 0 + 64);
      Result := False;
      Exit;
    end;

    if (vTotalDias > buscas.FieldByName('prazomax').AsInteger) and not pDeletar then
    begin
      Application.MessageBox(Pchar('Prazo total de ' + inttostr(vTotalDias) + ' dias' +
      	' para pagamento ultrapassa o limite máximo de ' + inttostr(buscas.FieldByName('prazomax').AsInteger) +
        ' dias, de acordo com as políticas de pagamento da empresa.'),
        'Atenção', 0 + 64);
      Result := False;
      Exit;
    end;
  end;
end;

function TFormPag2._verificaBoletosOS: Boolean;
var
  vOK: Boolean;
  vMensagem: string;
  vseqformtmp: array of Integer;
  vvalortmp: array of Currency;
  vdescontotmp: array of Currency;
  vqtdetmp: Integer;
  vvalorboletostmp: Currency;
  vvalorDescontoVenda: Currency;
  I: Integer;
begin
  Result := False;
  vOK := False;
  if fGerouFormaBoleto then
    Exit;

  vDadosIni.vInibeMensPesqPros := 'S';
  if (Trim(FtipoVenda) = 'REQ') then
  begin
    if not vDadosIni.PesqPros('FPG036', 'ABRIR',
    'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
    'FORMPAGAMENTO', '', dtmFP.qrBuscas, True) then
      Exit;
  end
  else if (Trim(FtipoVenda) = 'OS') then
  begin
    if not vDadosIni.PesqPros('FPG019', 'ABRIR',
    'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
    'FORMPAGAMENTO', '', dtmFP.qrBuscas, True) then
      Exit;
  end
  else if (Trim(FtipoVenda) = 'REC') then
  begin
    if not vDadosIni.PesqPros('FPG038', 'ABRIR',
    'NDOC: ' + IntToStr(FnumeroVenda) + ' TP: ' + FtipoVenda,
    'FORMPAGAMENTO', '', dtmFP.qrBuscas, True) then
      Exit;
  end;

  if (vDadosIni.vEmp.vImprimirBoletoOS <> 'S') then
    Exit;
  buscas.Close;
  buscas.SQL.Text := 'select n_seq_bol from boletas' +
    ' where num_nf_vnd = ' + IntToStr(FnumeroVenda) +
    ' and tipo_emissao = ''' + Trim(FtipoVenda) + ''' ' +
    ' and cod_cliente = ' + IntToStr(FcodigoCliente) +
    //' and n_doc_bol = ' + QuotedStr(dataSet.FieldByName('ndoc').AsString) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 1 ';
  buscas.Open;

  if (not buscas.IsEmpty) then
    exit;

  I := 0;
  vqtdetmp := 0;
  vvalorboletostmp := 0;
  try
  	vvalorDescontoVenda := 0;
    if (trim(FtipoVenda) = 'REQ') or (trim(FtipoVenda) = 'OS') then
    begin
      buscas.Close;
      buscas.SQL.Text := ' select coalesce(cl.inf_desc_bol, ''N'') inf_desc_bol, ' +
      	' sum(coalesce(pp.rateio_desc, 0)) rateio_desc from pedvenda pd ' +
        ' inner join pedvenda_prod pp on ' +
        '		pp.nped = pd.nped ' +
        '		and pp.tipo = pd.tipo ' +
        '		and pp.cod_empresa = pd.cod_empresa ' +
        ' inner join clientes cl on ' +
        '		pd.cod_cliente = cl.cod_cliente ' +
        '		and pd.cod_empresa = cl.cod_empresa ' +
        ' where pp.nped = :nped ' +
        ' and pp.tipo = :tipo ' +
        ' and pp.cod_empresa = :cod_empresa ' +
        ' and ((pp.status is null) or (pp.status <> ''CANCELADO'')) ' +
        ' group by 1 ';
      buscas.ParamByName('nped').AsInteger := FnumeroVenda;
      buscas.ParamByName('tipo').AsString := FtipoVenda;
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.Open;

    	if buscas.FieldByName('inf_desc_bol').AsString = 'S' then
      	vvalorDescontoVenda := buscas.FieldByName('rateio_desc').AsFloat;
    end;

    try
      dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if Trim(dataSet.FieldByName('TIPDOC').AsString) = 'S2' then
        begin
          if vControle.selecionaControlesBoleto(dataSet.FieldByName('cod_controle').AsInteger) then
          begin
            if not vOK then
            begin
              vOK := Application.MessageBox('Deseja gerar boleto(s)?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES;
              vMensagem := FtipoVenda + ' ' + vDadosIni.StrZero(FnumeroVenda, 6);
              if vOK then
                if not InputQuery('Observação do boleto',
                  'Informe a Observação a ser impressa no boleto', vMensagem) then
                  vMensagem := FtipoVenda + ' ' + vDadosIni.StrZero(FnumeroVenda, 6);
              if FNumFatura > 0 then
                vMensagem := vMensagem +  ' FAT ' + vDadosIni.StrZero(FNumFatura, 6);
              if trim(FCodLocacoes) <> '' then
                vMensagem := vMensagem + ' LOC ' + FCodLocacoes;
            end;

            if not vOK then
              Exit;

            Inc(vqtdetmp);

            vvalorboletostmp := vvalorboletostmp + dataSet.FieldByName('valordoc').AsFloat;
          end;
        end;

        dataSet.Next;
      end;
    finally
      dataSet.EnableControls;
    end;

    if not vOK then
      Exit;

    if vvalorDescontoVenda > 0 then
    begin
      SetLength(vseqformtmp, vqtdetmp);
      SetLength(vvalortmp, vqtdetmp);
      SetLength(vdescontotmp, vqtdetmp);

      try
        dataSet.DisableControls;
        dataSet.First;
        while not dataSet.Eof do
        begin
          if Trim(dataSet.FieldByName('TIPDOC').AsString) = 'S2' then
          begin
            if vControle.selecionaControlesBoleto(dataSet.FieldByName('cod_controle').AsInteger) then
            begin
              vseqformtmp[I]  := dataSet.FieldByName('seqform').AsInteger;
              vvalortmp[I]    := dataSet.FieldByName('valordoc').AsFloat;
              vdescontotmp[I] := 0;

              Inc(I);
            end;
          end;

          dataSet.Next;
        end;
      finally
        dataSet.EnableControls;
      end;

      vDadosIni.atualizarValorDesconto(FvalorVenda, vvalorDescontoVenda, vvalorboletostmp, vvalortmp, vdescontotmp);
    end;

    try
    	dataSet.DisableControls;
      dataSet.First;
      while not dataSet.Eof do
      begin
        if Trim(dataSet.FieldByName('TIPDOC').AsString) = 'S2' then
        begin
          if vControle.selecionaControlesBoleto(dataSet.FieldByName('cod_controle').AsInteger) then
          begin
            if not vOK then
              Exit;

            vDadosIni.vdataGeral := vDadosIni.getDataBanco(buscas);

            buscas.Close;
            buscas.SQL.Text := 'INSERT INTO BOLETAS (N_SEQ_BOL, COD_EMPRESA, NUM_NF_VND, DATA_EM_BOL,' +
              ' DATA_VEN_BOL, N_DOC_BOL, VL_DOC_BOL, VL_DESC_BOL, OBS_BOL, M_DIA_BOL, MULT_ATR_BOL,' +
              ' COD_CLIENTE, LOCALPAG, OBS_BOL1, SUB_SERIE, COD_CONTROLE_CX, TIPO_EMISSAO, SEQFORM, NPARCELA, TOTALPARCELAS)' +
              ' VALUES' +
              ' (:N_SEQ_BOL, :COD_EMPRESA, :NUM_NF_VND, :DATA_EM_BOL,' +
              ' :DATA_VEN_BOL, :N_DOC_BOL, :VL_DOC_BOL, :VL_DESC_BOL, :OBS_BOL, :M_DIA_BOL, :MULT_ATR_BOL,' +
              ' :COD_CLIENTE, :LOCALPAG, :OBS_BOL1, :SUB_SERIE, :COD_CONTROLE_CX, :TIPO_EMISSAO, :SEQFORM, :NPARCELA, :TOTALPARCELAS)';

            buscas.ParamByName('N_SEQ_BOL').AsInteger := Gencodigo('BOLETAS', dtmFP.SpIncCodigo,
              vDadosIni.codEmpresa); ;
            buscas.ParamByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
            buscas.ParamByName('NPARCELA').AsInteger := dataSet.FieldByName('NPARCELA').AsInteger;
            buscas.ParamByName('TOTALPARCELAS').AsInteger := dataSet.FieldByName('QTDE_PARC').AsInteger;
            buscas.ParamByName('NUM_NF_VND').AsInteger := dataSet.FieldByName('nrequisicao').AsInteger;
            buscas.ParamByName('TIPO_EMISSAO').AsString := Trim(FtipoVenda);
            buscas.ParamByName('SUB_SERIE').AsInteger := 0;
            //buscas.ParamByName('M_DIA_BOL').AsFloat := vDadosIni.StrToFloatFormat(vDadosIni.vEmp.vTxJuros / 30,2);
            //buscas.ParamByName('MULT_ATR_BOL').AsFloat := vDadosIni.vEmp.vMultas;
            //buscas.ParamByName('LOCALPAG').AsString := copy(vDadosIni.vEmp.vLocalPagBol,1,40);
            //buscas.ParamByName('OBS_BOL').AsString := copy(vDadosIni.vEmp.vObsBol,1,45);
            buscas.ParamByName('OBS_BOL1').AsString := copy(vMensagem, 1, 128);
            buscas.ParamByName('COD_CLIENTE').AsInteger := dataSet.FieldByName('cod_cliente').AsInteger;
            buscas.ParamByName('DATA_EM_BOL').AsDate := vDadosIni.vdataGeral; //dataSet.FieldByName('data_mov').AsDateTime;
            buscas.ParamByName('DATA_VEN_BOL').AsDate := dataSet.FieldByName('data_venc').AsDateTime;
            buscas.ParamByName('N_DOC_BOL').AsString := dataSet.FieldByName('ndoc').AsString;

            if vvalorDescontoVenda > 0 then
            begin
            	buscas.ParamByName('VL_DOC_BOL').AsCurrency := dataSet.FieldByName('valordoc').AsFloat;
              buscas.ParamByName('VL_DESC_BOL').AsCurrency := 0;

              for I := 0 to Length(vseqformtmp) - 1 do
                if vseqformtmp[I] = dataSet.FieldByName('SEQFORM').AsInteger then
                begin
                  buscas.ParamByName('VL_DOC_BOL').AsCurrency := vvalortmp[I];
                  buscas.ParamByName('VL_DESC_BOL').AsCurrency := vdescontotmp[I];

                  break;
                end;

            end
            else
            begin
              buscas.ParamByName('VL_DOC_BOL').AsCurrency := dataSet.FieldByName('valordoc').AsFloat;
              buscas.ParamByName('VL_DESC_BOL').AsCurrency := 0;
            end;
            buscas.ParamByName('COD_CONTROLE_CX').AsInteger := dataSet.FieldByName('cod_controle').AsInteger;
            buscas.ParamByName('SEQFORM').AsInteger := dataSet.FieldByName('SEQFORM').AsInteger;
            buscas.Prepare;
            buscas.ExecSQL;
            Result := true;
          end;

        end;
        dataSet.Next;
      end;
    finally
      dataSet.EnableControls;
    end;

  except
  	on e: exception do
  	begin
      Result := false;
      Application.MessageBox(pchar('Erro ao verificar boletos. Erro: ' + e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('function _verificaBoletosOS. Erro: ' + e.Message);
    end;
  end;
end;

procedure TFormPag2._verificaComissaoRecebimento_Proporcional;
var
  vSoma, vSomaComissao, vSomaComissaoGer: Extended;
begin

  buscas.close;
  if (Trim(FtipoVenda) = 'REQ') or (Trim(FtipoVenda) = 'OS') then
  begin

    buscas.Close;
    buscas.SQL.Text := 'select sum(coalesce(pp.comiss_prod,0)) comiss_prod,' +
      ' sum(coalesce(pp.comiss_prod_ger,0)) comiss_prod_ger' +
      ' from pedvenda_prod pp' +
      ' where pp.nped = ' + IntToStr(FnumeroVenda) +
      ' and pp.tipo = ' + QuotedStr(FtipoVenda) +
      ' and pp.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    vSomaComissao := buscas.FieldByName('comiss_prod').AsFloat;
    vSomaComissaoGer := buscas.FieldByName('comiss_prod_ger').AsFloat;

    vSoma := 0;
    dataSet.First;
    while not dataSet.Eof do
    begin
      if DataSet.FieldByName('tpdocs').AsString = FtipoVenda then
        vSoma := vSoma + Abs(dataSet.FieldByName('valordoc').AsFloat);

      dataSet.Next;
    end;

    dataSet.First;
    while not dataSet.Eof do
    begin

      dataSet.Edit;
      dataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat := 0;
      dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').AsFloat := 0;
      if DataSet.FieldByName('tpdocs').AsString = FtipoVenda then
      begin
        dataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat :=
          Abs(dataSet.FieldByName('valordoc').AsFloat) / vSoma * vSomaComissao;
        dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').AsFloat :=
          Abs(dataSet.FieldByName('valordoc').AsFloat) / vSoma * vSomaComissaoGer;
      end;

      dataSet.Post;

      dataSet.Next;
    end;
  end;
end;

{ TComunicacaoFormaPagamento }

function TComunicacaoFormaPagamento.iniciaPlanoDePagamento(numeroDaVenda, codigoDoCliente,
  codigoDoVendedor: integer; valorBruto, maxPercDesc, percentualDesconto: Currency; tipoVarAta,
  tipoVenda: string; var valorPlano: Currency;pTipoOS:string): boolean;
var
  vPl2: TPlanoPagamento_2;
  vValorDesconto: Currency;
begin
  try
    if dtmFP = nil then
      dtmFP := TdtmFP.Create(dtmFP);
    if vDadosIni.vUsarPlano = 'S' then
    begin
      Result := false;
      if not vDadosIni.PesqPros('FPG011', 'ABRIR', 'VENDA ' + tipoVenda + ' NUM ' + IntToStr(numeroDaVenda),
        'PLANO_PAG', '', buscas, False) then
        Exit;

      Application.CreateForm(TfrmPlanoPagamento, frmPlanoPagamento);
      try
        if obPlano.iniciaAtributos(numeroDaVenda, codigoDoCliente, codigoDoVendedor,
          valorBruto, percentualDesconto, maxPercDesc, tipoVarAta, tipoVenda,pTipoOS) then
        begin
          Result := frmPlanoPagamento.ShowModal = mrOk;
          if Result then
            valorPlano := obPlano.getValorPlano;
        end;
      finally
        frmPlanoPagamento.Free;
        frmPlanoPagamento := nil;
      end;
    end
    else if vDadosIni.vUsarPlano = '2' then
    begin
      Result := False;

      if not vDadosIni.PesqPros('FPG011', 'ABRIR', 'VENDA ' + tipoVenda + ' NUM ' + IntToStr(numeroDaVenda),
        'PLANO_PAG', '', buscas, False) then
        Exit;

      vValorDesconto := 0;
      if percentualDesconto > 0 then
        vValorDesconto := vDadosIni.StrToFloatFormat(
          valorBruto * percentualDesconto / 100, 2);

      vPl2 := TPlanoPagamento_2.create;
      try

        Result := vPl2.gerarPlanoPagamento2(valorBruto, vValorDesconto, maxPercDesc, numeroDaVenda,
          codigoDoCliente, codigoDoVendedor, tipoVenda);
        if Result then
          valorPlano := vPl2.vDadosPlano.valor_aplicado;

      finally
        FreeAndNil(vPl2);
      end;

    end
    else
    begin
      Application.MessageBox('Plano de Pagamento não configurado no arquivo de inicialização(Config.Ini).',
        'Atenção', 0 + 64);
    end;
  except
    result := false;
  end;
end;

function TComunicacaoFormaPagamento.cancelaFormaPagamentoIntegracao(
  pNumeroDaVenda: integer; pSerie, pTipoDoc: string): boolean;
var
  vCodCliente: integer;
  vFp2: TFormPag2;
begin
  Result := False;
  if dtmFP = nil then
    dtmFP := TdtmFP.Create(dtmFP);
  vFp2 := TFormPag2.create;
  if (pTipoDoc = 'NF') then
    vFp2.apagaFormaDePagamento(pNumeroDaVenda, pSerie, pTipoDoc)
  else
    vFp2.apagaFormaDePagamento(pNumeroDaVenda, pTipoDoc);
end;

constructor TComunicacaoFormaPagamento.create;
begin
  if dtmFP = nil then
    dtmFP := TdtmFP.Create(dtmFP);
  buscas := TIBQuery(dtmFP.qrBuscas);
end;

function TComunicacaoFormaPagamento.iniciaFormaPagamento(numeroDaVenda,
  codigoDaCondicaoPagamento, subSerie, codigoDoCliente,
  codigoDoVendedor: integer; tipoDoc: string; valorDaVenda: Currency): boolean;
begin
  try
    if dtmFP = nil then
      dtmFP := TdtmFP.Create(dtmFP);
    Result := false;
    Application.CreateForm(TfrmFormPag2, frmFormPag2);
    try
      frmFormPag2.tabDinheiro.TabVisible := false;
      frmFormPag2.tabCheque.TabVisible := false;
      frmFormPag2.tabCreditos.TabVisible := false;
      frmFormPag2.tabRecibos.TabVisible := false;
      frmFormPag2.tabInicial.TabVisible := false;
      frmFormPag2.tabLancamentos.TabVisible := false;
      frmFormPag2.tabDadosRecibos.TabVisible := false;
      frmFormPag2.tabPromissoria.TabVisible := false;
      frmFormPag2.PageControl1.ActivePage := frmFormPag2.tabInicial;
      if obFormPag2.iniciaAtributos(numeroDaVenda, codigoDaCondicaoPagamento, subSerie,
        codigoDoCliente, codigoDoVendedor, tipoDoc, vDadosIni.StrToFloatFormat(valorDaVenda, 2)) then
        Result := frmFormPag2.ShowModal = mrOk
    finally
      valorpago := obFormPag2.valorInformado;
      frmFormPag2.Free;
      frmFormPag2 := nil;
    end;
  except
    result := false;
  end;
end;

function TComunicacaoFormaPagamento.iniciaFormaPagamentoIntegracao(
  pNumeroDaVenda: integer; pSerie, pTipoDoc: string): boolean;
var
  vCodCliente: integer;
begin
  Result := False;
  if (pTipoDoc = 'REQ') or (pTipoDoc = 'OS') then
  begin
    buscas.close;
    buscas.Sql.Text := 'select nped, cod_cond_pag, cod_cliente, cod_vendedor, tipo, valor_total ' +
      ' from pedvenda where nped = ' + IntToStr(pNumeroDaVenda) + ' and tipo = ' + QuotedStr(pTipoDoc) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
    if vDadosIni.vSistema = 'Cxl' then
      buscas.Sql.Text := buscas.Sql.Text + ' and status_ped = ''FECHADA'''
    else
      buscas.Sql.Text := buscas.Sql.Text + ' and ((status_ped is null) or (status_ped = ''''))';
    buscas.Open;
    if buscas.IsEmpty then
      exit;
    Result := iniciaFormaPagamento(buscas.FieldByName('nped').AsInteger,
      buscas.FieldByName('cod_cond_pag').AsInteger,
      0,
      buscas.FieldByName('cod_cliente').AsInteger,
      buscas.FieldByName('cod_vendedor').AsInteger,
      Trim(buscas.FieldByName('tipo').AsString),
      buscas.FieldByName('valor_total').AsFloat);
  end
  else if (pTipoDoc = 'NF') then
  begin
    buscas.close;
    buscas.Sql.Text := 'select num_nf, serie, cod_cond_pag, cod_cliente, cod_usuario, valor_total ' +
      ' from notafiscal where num_nf = ' + IntToStr(pNumeroDaVenda) + ' and serie = ' + QuotedStr(pSerie) +
      ' and naturesa_nf = ''S'' ' +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
    buscas.Open;
    if buscas.IsEmpty then
      exit;
    Result := iniciaFormaPagamento(buscas.FieldByName('num_nf').AsInteger,
      buscas.FieldByName('cod_cond_pag').AsInteger,
      StrToInt(Trim(buscas.FieldByName('serie').AsString)),
      buscas.FieldByName('cod_cliente').AsInteger,
      buscas.FieldByName('cod_usuario').AsInteger,
      'NF',
      buscas.FieldByName('valor_total').AsFloat);
  end
  else if (pTipoDoc = 'REC') then
  begin
    buscas.close;
    buscas.Sql.Text := 'select nrecibo, COD_BENEF, COD_DEVEDOR, VALOR ' +
      ' from RECIBOS where nrecibo = ' + IntToStr(pNumeroDaVenda) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
    buscas.Open;
    if buscas.IsEmpty then
      exit;
    if buscas.FieldByName('COD_DEVEDOR').AsInteger > 0 then
      vCodCliente := buscas.FieldByName('COD_DEVEDOR').AsInteger
    else
      vCodCliente := buscas.FieldByName('COD_BENEF').AsInteger;
    Result := iniciaFormaPagamento(buscas.FieldByName('nrecibo').AsInteger,
      1, 0, vCodCliente, 0, 'REC', buscas.FieldByName('valor').AsFloat);
  end
  else if (pTipoDoc = 'MOT') then
  begin
    buscas.close;
    buscas.Sql.Text := 'SELECT N_COMANDO, CLIENTES_V, COVEND_V, CONDPAG_V, VALOR_A_REC' +
      ' from COM_FAT where N_COMANDO = ' + IntToStr(pNumeroDaVenda) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1';
    buscas.Open;
    if buscas.IsEmpty then
      exit;
    Result := iniciaFormaPagamento(buscas.FieldByName('N_COMANDO').AsInteger,
      buscas.FieldByName('CONDPAG_V').AsInteger, 0,
      buscas.FieldByName('CLIENTES_V').AsInteger,
      buscas.FieldByName('COVEND_V').AsInteger, 'MOT',
      buscas.FieldByName('VALOR_A_REC').AsFloat);
  end;
end;

function TComunicacaoFormaPagamento.iniciaPlanoDePagamento: boolean;
var
  vPl2: TPlanoPagamento_2;
begin
  try
    if dtmFP = nil then
      dtmFP := TdtmFP.Create(dtmFP);
    if vDadosIni.vUsarPlano = 'S' then
    begin
      Result := false;
      if not vDadosIni.PesqPros('FPG011', 'ABRIR', 'APENAS CONSULTA',
        'PLANO_PAG', '', buscas, False) then
        Exit;

      Application.CreateForm(TfrmPlanoPagamento, frmPlanoPagamento);
      try
        if obPlano.iniciaAtributos(0, 0, 0, 0, 0, 0, '', '','') then
          Result := frmPlanoPagamento.ShowModal = mrOk;
      finally
        frmPlanoPagamento.Free;
        frmPlanoPagamento := nil;
      end;
    end
    else if vDadosIni.vUsarPlano = '2' then
    begin
      Result := False;

      if not vDadosIni.PesqPros('FPG011', 'ABRIR', 'APENAS CONSULTA',
        'PLANO_PAG', '', buscas, False) then
        Exit;

      vPl2 := TPlanoPagamento_2.create;
      try

        Result := vPl2.gerarPlanoPagamento2(0, 0, 0, 0, 0, 0, '');

      finally
        FreeAndNil(vPl2);
      end;

    end;
  except
    result := false;
  end;
end;

function TComunicacaoFormaPagamento.iniciaPlanoPagamentoIntegracao(
  pNumeroDaVenda: integer; pSerie, pTipoDoc: string): boolean;
var
  vCodCliente, vCodVendedor, vCodCondPag: integer;
  vValorTotal, vMaxDesconto, vPercDesc: Currency;
begin
  //
end;

function TComunicacaoFormaPagamento.visualizarComprovanteCartao(pNumeroDaVenda: integer; pTipoDoc: string;
	pSeqForm: Integer): boolean;
var
	vTpVND: string;
  vNumVND: string;
  vNSU: string;
  vAUT: string;
  vComprovante: string;
  vStatus: string;
  vCodNFCE: Integer;
begin
	try
    Result := true;

    buscas.Close;
    buscas.SQL.Text := ' select tr.seqid, tr.nrequisicao, tr.tpdocs, tr.cod_empresa,  ' +
    	' tr.n_docnsu_adm, tr.n_aut_cart, tr.status, tr.impressao from formpagamento fp ' +
      ' inner join transacao_cartao tr on tr.guidt = fp.guid_tr_cartao and tr.cod_empresa = fp.cod_empresa ' +
      ' where fp.seqform = :seqform ' +
      ' and fp.cod_empresa = :cod_empresa ';
    buscas.ParamByName('seqform').AsInteger := pSeqForm;
    buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
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
        ' where fp.seqform = :seqform ' +
        ' and fp.cod_empresa = :cod_empresa ';
      buscas.ParamByName('seqform').AsInteger := pSeqForm;
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.Open;
    end;

    if (buscas.IsEmpty) and ((Trim(pTipoDoc) = 'REQ') or (Trim(pTipoDoc) = 'OS')) then
    begin
      buscas.Close;
      buscas.SQL.Text := ' select COD_NFCE from PEDVENDA ' +
        ' where NPED = :NDOC ' +
        ' and TIPO = :TIPO ' +
        ' and COD_EMPRESA = :COD_EMPRESA ';
      buscas.ParamByName('NDOC').AsInteger := pNumeroDaVenda;
      buscas.ParamByName('TIPO').AsString := Trim(pTipoDoc);
      buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
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
        buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.Open;

        if buscas.IsEmpty then
        begin
          buscas.Close;
          buscas.SQL.Text := ' select SEQID, NREQUISICAO, TPDOCS, COD_EMPRESA, ' +
            ' N_DOCNSU_ADM, N_AUT_CART, STATUS, IMPRESSAO, REDE from TRANSACAO_CARTAO ' +
            ' where NREQUISICAO = :NDOC and TPDOCS = :TIPO and COD_EMPRESA = :COD_EMPRESA ';
          buscas.ParamByName('NDOC').AsInteger := pNumeroDaVenda;
          buscas.ParamByName('TIPO').AsString := Trim(pTipoDoc);
          buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.Open;
        end;
      end
      else
      begin
        buscas.Close;
        buscas.SQL.Text := ' select SEQID, NREQUISICAO, TPDOCS, COD_EMPRESA, ' +
          ' N_DOCNSU_ADM, N_AUT_CART, STATUS, IMPRESSAO, REDE from TRANSACAO_CARTAO ' +
          ' where NREQUISICAO = :NDOC and TPDOCS = :TIPO and COD_EMPRESA = :COD_EMPRESA ';
        buscas.ParamByName('NDOC').AsInteger := pNumeroDaVenda;
        buscas.ParamByName('TIPO').AsString := Trim(pTipoDoc);
        buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.Open;
      end;
    end
    else if buscas.IsEmpty then
    begin
      buscas.Close;
      buscas.SQL.Text := ' select SEQID, NREQUISICAO, TPDOCS, COD_EMPRESA, ' +
        ' N_DOCNSU_ADM, N_AUT_CART, STATUS, IMPRESSAO, REDE from TRANSACAO_CARTAO ' +
        '	where NREQUISICAO = :NPED and TPDOCS = :TIPO and COD_EMPRESA = :COD_EMPRESA ';
      buscas.ParamByName('nped').AsInteger := pNumeroDaVenda;
      buscas.ParamByName('tipo').AsString := Trim(pTipoDoc);
      buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.Open;
    end;

    if buscas.IsEmpty then
    begin
    	Application.MessageBox(pchar('Comprovante de pagamento não encontrado para esta venda'), 'Informação', MB_OK + MB_ICONINFORMATION);
      Result := false;
      exit;
    end;

    if not buscas.IsEmpty then
    begin
    	vTpVND := pTipoDoc;
      vNumVND := IntToStr(pNumeroDaVenda);
      vNSU := Trim(buscas.FieldByName('N_DOCNSU_ADM').AsString);
      vAUT := Trim(buscas.FieldByName('N_AUT_CART').AsString);
      vComprovante := Trim(buscas.FieldByName('IMPRESSAO').AsString);
      vStatus := Trim(buscas.FieldByName('STATUS').AsString);

      if (Trim(vComprovante) <> '') then
      begin
        if not vDadosIni.PesqPros('POSV007', 'VISUALIZAR', vTpVND + ' ' + vNumVND +
          '-AUT:' + vAUT + '-NSU:' + vNSU, 'TRANSACAO_CARTAO',
          '', buscas, True) then
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
      vDadosIni.registraErro('function TComunicacaoFormaPagamento.visualizarComprovanteCartao. Erro: ' + e.Message);
    end;
  end;
end;

{ TPlanoPagamento }

procedure TPlanoPagamento.atribuirAtributosParaFormulario;
begin
  if frmPlanoPagamento = nil then
    exit;
  frmPlanoPagamento.rbAtacado.Checked := FtipoVarejoAtacado = 'A';
  frmPlanoPagamento.rbVarejo.Checked := FtipoVarejoAtacado = 'V';
  frmPlanoPagamento.edValorDaParcela.Valor := FvalorDaParcela;
  frmPlanoPagamento.edValorVendaLiquido.Valor := FvalorVendaLiquido;
  if FpercentualDesconto > 0 then
    frmPlanoPagamento.edValorDesconto.Valor := FpercentualDesconto;
  //frmPlanoPagamento.edValorDesconto.Valor := FvalorDesconto;
  frmPlanoPagamento.edValorVendaBruto.Valor := FvalorVendaBruto;
  frmPlanoPagamento.Memo1.Lines.Text := textoPlano.Text;
  frmPlanoPagamento.edIntervaloParcelas.Valor := FintervaloParcelas;
  frmPlanoPagamento.edPrazoPrimeiraParcela.Valor := FprazoPrimeiraParcela;
  if FModoVenda then
  begin
    frmPlanoPagamento.edValorVendaBruto.Enabled := false;
    frmPlanoPagamento.edValorDesconto.Enabled := false;
    frmPlanoPagamento.edValorVendaLiquido.Enabled := false;
    frmPlanoPagamento.rbVarejo.Enabled := false;
    frmPlanoPagamento.labelTipoVnd.Caption := 'Tipo de Venda: '+chr(13)+FDescricaotipoVnd;
    frmPlanoPagamento.rbAtacado.Enabled := false;
    frmPlanoPagamento.labelTipoVnd.Visible:=true;
  end
  else
  begin
    frmPlanoPagamento.edValorVendaBruto.Enabled := True;
    frmPlanoPagamento.edValorDesconto.Enabled := True;
    //    frmPlanoPagamento.edValorVendaLiquido.Enabled := True;
    frmPlanoPagamento.rbVarejo.Enabled := True;
    frmPlanoPagamento.rbAtacado.Enabled := True;
    frmPlanoPagamento.labelTipoVnd.Visible:=false;
  end;
end;

function TPlanoPagamento.atribuirDadosDoFormularioParaAtributos: boolean;
var
  vrTemp: Currency;
begin
  Result := true;
  if frmPlanoPagamento = nil then
    exit;
  FcontCodigoControle := vControle.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
  FcontNomeControle := vControle.dataSet.FieldByName('NOME_CTRL').AsString;
  FcontTipoDePlano := vControle.dataSet.FieldByName('TP_PLANO').AsString;
  FcontDocumentos := vControle.dataSet.FieldByName('DOCS').AsString;

  FnumeroDeParcelas := Trunc(frmPlanoPagamento.edNumeroDeParcelas.Valor);
  FprazoPrimeiraParcela := Trunc(frmPlanoPagamento.edPrazoPrimeiraParcela.Valor);
  FintervaloParcelas := Trunc(frmPlanoPagamento.edIntervaloParcelas.Valor);
  FvalorEntrada := frmPlanoPagamento.edValorEntrada.Valor;
  FprazoEntrada := Trunc(frmPlanoPagamento.edPrazoEntrada.Valor);
  FvalorDaParcela := frmPlanoPagamento.edValorDaParcela.Valor;
  if frmPlanoPagamento.rbAtacado.Checked then
    FtipoVarejoAtacado := 'A'
  else
    FtipoVarejoAtacado := 'V';

  if not FModoVenda then
  begin
    if FtipoVarejoAtacado = 'A' then
      FmaximoPercentualDesconto := FempMaximoDescontoAtacado
    else
      FmaximoPercentualDesconto := FempMaximoDescontoVarejo;
    vrTemp := frmPlanoPagamento.edValorDesconto.Valor;
    if vrTemp > FmaximoPercentualDesconto then
    begin
      Application.MessageBox('Desconto maior que o Permitido', 'Atenção', MB_OK +
        MB_ICONEXCLAMATION);
      Result := False;
      exit;
    end;
    FvalorVendaBruto := frmPlanoPagamento.edValorVendaBruto.Valor;
    //if frmPlanoPagamento.edValorDesconto.Valor < 0 then
    //  frmPlanoPagamento.edValorDesconto.Valor := 0;

    //FvalorDesconto := frmPlanoPagamento.edValorDesconto.Valor;

    //if FvalorDesconto > 0 then
    //  FpercentualDesconto := ( FvalorDesconto / FvalorVendaBruto ) * 100  ;

    FpercentualDesconto := frmPlanoPagamento.edValorDesconto.Valor;
    FvalorVendaLiquido := vDadosIni.StrToFloatFormat(
      FvalorVendaBruto - ((FvalorVendaBruto * FpercentualDesconto) / 100), 2);
  end;
end;

function TPlanoPagamento.confirmarPlano: boolean;
var
  iprest, itx: integer;
begin
  Result := False;

  if not vDadosIni.PesqPros('FPG014', 'INCLUIR', 'VENDA ' + FtipoDocVenda + ' NUM ' + IntToStr(FnumeroVenda),
    'PLANO_PAG', '', buscas, False) then
    Exit;

  Result := montaSelect('select * from plano_pag where ' +
    ' nrequisicao = ' + IntToStr(FnumeroVenda) +
    ' and tpdocs = ' + QuotedStr(FtipoDocVenda) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1');

  if not dataSet.IsEmpty then
  begin
    if Application.MessageBox('Deseja apagar o que já está gravado', 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      dataSet.first;
      while not dataSet.eof do
        dataSet.delete;
    end
    else
    begin
      dataSet.Close;
      exit;
    end;
  end;
  if Application.MessageBox('Confirma o registro do plano', 'Confirmação', MB_ICONQUESTION +
    MB_YESNO) = IDYES then
  begin
    //apagar a forma de pagamento
    if (FcontTipoDePlano = 'F') and (FvalorEntrada > 0) then
    begin
      dataSet.append;
      dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
      dataSet.FieldByName('SEQPLANO').AsInteger := Gencodigo('PLANO_PAG', dtmFP.SpIncCodigo,
        vDadosIni.codEmpresa);
      dataSet.FieldByName('NREQUISICAO').AsInteger := numeroVenda;
      dataSet.FieldByName('TIPDOC').AsString := contDocumentos;
      dataSet.FieldByName('COD_CONTROLE').AsInteger := contCodigoControle;
      dataSet.FieldByName('COD_CLIENTE').AsInteger := codigoCliente;
      dataSet.FieldByName('DATA_MOV').AsDateTime := vDadosIni.getDataBanco(buscas);
      dataSet.FieldByName('VALORDOC').AsCurrency := valorEntrada;
      dataSet.FieldByName('TPDOCS').AsString := tipoDocVenda;
      dataSet.FieldByName('DATA_VENC').AsDateTime := vDadosIni.getDataBanco(buscas) +
        empDiasRecebimentoFinanceira;
      dataSet.FieldByName('OPERADOR').AsInteger := codigoVendedor;
      dataSet.FieldByName('TIP_CNT').AsString := 'P';
      dataSet.FieldByName('TEXTO_PLANO').AsString := textoPlano.Text;
      dataSet.post;
    end
    else
    begin
      if valorEntrada > 0 then
      begin
        dataSet.append;
        dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
        dataSet.FieldByName('SEQPLANO').AsInteger := Gencodigo('PLANO_PAG', dtmFP.SpIncCodigo,
          vDadosIni.codEmpresa);
        dataSet.FieldByName('NREQUISICAO').AsInteger := numeroVenda;
        dataSet.FieldByName('TIPDOC').AsString := contDocumentos;
        dataSet.FieldByName('COD_CONTROLE').AsInteger := contCodigoControle;
        dataSet.FieldByName('COD_CLIENTE').AsInteger := codigoCliente;
        dataSet.FieldByName('DATA_MOV').AsDateTime := vDadosIni.getDataBanco(buscas);
        dataSet.FieldByName('VALORDOC').AsCurrency := valorEntrada;
        dataSet.FieldByName('TPDOCS').AsString := tipoDocVenda;
        if prazoEntrada > 0 then
          dataSet.FieldByName('DATA_VENC').AsDateTime := vDadosIni.getDataBanco(buscas) +
            prazoEntrada
        else
          dataSet.FieldByName('DATA_VENC').AsDateTime := vDadosIni.getDataBanco(buscas) + 1;
        dataSet.FieldByName('OPERADOR').AsInteger := codigoVendedor;
        dataSet.FieldByName('TIP_CNT').AsString := 'E';
        dataSet.FieldByName('TEXTO_PLANO').AsString := textoPlano.Text;
        dataSet.post;
      end;
      if numeroDeParcelas > 0 then
      begin
        if FcontTipoDePlano = 'C' then
        begin
          FprazoPrimeiraParcela := 31;
          FintervaloParcelas := 30;
        end;
        for itx := 1 to numeroDeParcelas do
        begin
          dataSet.append;
          dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
          dataSet.FieldByName('SEQPLANO').AsInteger := Gencodigo('PLANO_PAG', dtmFP.SpIncCodigo,
            vDadosIni.codEmpresa);
          dataSet.FieldByName('NREQUISICAO').AsInteger := numeroVenda;
          dataSet.FieldByName('TIPDOC').AsString := contDocumentos;
          dataSet.FieldByName('COD_CONTROLE').AsInteger := contCodigoControle;
          dataSet.FieldByName('COD_CLIENTE').AsInteger := codigoCliente;
          dataSet.FieldByName('DATA_MOV').AsDateTime := vDadosIni.getDataBanco(buscas);
          dataSet.FieldByName('VALORDOC').AsCurrency :=
            StrToCurr(vDadosIni.tirapontos(format('%8.' + IntToStr(empCasasDecimais) + 'n',
            [valorDaParcela]), empCasasDecimais));
          dataSet.FieldByName('TPDOCS').AsString := tipoDocVenda;
          if FcontTipoDePlano = 'C' then
          begin
            if itx = 1 then
              dataSet.FieldByName('DATA_VENC').AsDateTime := vDadosIni.getDataBanco(buscas) +
                prazoPrimeiraParcela
            else
              dataSet.FieldByName('DATA_VENC').AsDateTime := vDadosIni.getDataBanco(buscas) +
                prazoPrimeiraParcela + ((itx - 1) * intervaloParcelas);
          end
          else
          if itx = 1 then
            dataSet.FieldByName('DATA_VENC').AsDateTime := vDadosIni.getDataBanco(buscas) +
              prazoPrimeiraParcela
          else
            dataSet.FieldByName('DATA_VENC').AsDateTime := vDadosIni.getDataBanco(buscas) +
              prazoPrimeiraParcela + ((itx - 1) * intervaloParcelas);
          dataSet.FieldByName('OPERADOR').AsInteger := codigoVendedor;
          dataSet.FieldByName('TIP_CNT').AsString := 'P';
          dataSet.FieldByName('TEXTO_PLANO').AsString := textoPlano.Text;
          dataSet.post;
        end;
      end;
    end;
    Result := Apply;
    CommitaTransacao;
    Application.MessageBox('Plano cadastrado com sucesso', 'Informação', MB_ICONINFORMATION +
      MB_OK);
  end else result := false;
end;

constructor TPlanoPagamento.Create;
begin
  DataSet := TClientDataSet(dtmFP.CdsPlano);
  transacao := TIBTransaction(dtmFP.transacao);
  Buscas := TIBQuery(dtmFP.qrBuscas);
  vEmp := TEmpresaPlano.create;
  vControle := TControleFP.create;
  vJuros := TJurosFP.create;
  vCondPag := TCondPagFP.create;
  FnumeroVenda := 0;
  FcodigoCliente := 0;
  FcodigoVendedor := 0;
  FvalorVendaBruto := 0;
  FpercentualDesconto := 0;
  FmaximoPercentualDesconto := 0;
  FtipoVarejoAtacado := '';
  FtipoDocVenda := '';
  FvalorVendaLiquido := 0;
  FModoVenda := false;
end;

function TPlanoPagamento.gerarPlano: boolean;
var
  avista, aux, diaria: real;
  vPM, i: integer;
  vlinha: string;
begin
  Result := false;

  if not vDadosIni.PesqPros('FPG012', 'GERAR', 'VENDA ' + FtipoDocVenda + ' NUM ' + IntToStr(FnumeroVenda),
    'PLANO_PAG', '', buscas, False) then
    Exit;

  if frmPlanoPagamento <> nil then
    atribuirDadosDoFormularioParaAtributos;
  if not verificaPrazo then
    Exit;
  //////////////////////////////////////////////////
  try
    if FnumeroDeParcelas = 0 then
      raise exception.create('Numero de parcelas não informado');
    if (FcontTipoDePlano <> 'C') and (FcontTipoDePlano <> 'F') and
      (FintervaloParcelas = 0) and (FnumeroDeParcelas > 1) then
      raise exception.create('Intervalo de parcelas deve ser maior que zero');

    FvalorDaEmpresa := 0;
    if FtipoVarejoAtacado = 'A' then
      diaria := Power((1 + (0 / 100)), (1 / FempDiasPrecoTabela))
    else
      diaria := Power((1 + (FempTaxaJuros / 100)), (1 / FempDiasPrecoTabela));
    avista := FvalorVendaLiquido;

    if FcontTipoDePlano = 'C' then
    begin
      FvalorCalculo := round(100 * (avista - FvalorEntrada / Power(diaria, FprazoEntrada))) / 100;
      if FnumeroDeParcelas = 1 then
      begin
        FnumParc := round(FnumeroDeParcelas);
        if FtipoVarejoAtacado = 'A' then
        begin
          FvalorCalculo := FvalorCalculo / (1 - 0 / 100);
          FvalorDaParcela := round(FvalorCalculo * (100 + 0)) / 100;
        end
        else
        begin
          FvalorCalculo := FvalorCalculo / (1 - FempPercentualVendaCartao / 100);
          FvalorDaParcela := round(FvalorCalculo * (100 + FempTaxaCartao)) / 100;
        end;
      end
      else
      begin
        if FtipoVarejoAtacado = 'A' then
        begin
          FvalorCalculo := FvalorCalculo / (1 - 0 / 100);
          FnumParc := round(FnumeroDeParcelas);
          aux := 0;
          for i := 1 to FnumParc do
            aux := aux + Power(1 + 0 / 100, -i);
          FvalorDaParcela := round(100 * FvalorCalculo / aux) / 100;
        end
        else
        begin
          FvalorCalculo := FvalorCalculo / (1 - FempTaxaCartaoParcelado / 100);
          FnumParc := round(FnumeroDeParcelas);
          aux := 0;
          for i := 1 to FnumParc do
            aux := aux + Power(1 + FempTaxaCartao / 100, -i);
          FvalorDaParcela := round(100 * FvalorCalculo / aux) / 100;
        end;
      end;
      textoPlano.Clear;
      vlinha := 'Entrada de : ' + format('%n', [FvalorEntrada]);
      if FprazoEntrada > 0 then
        vlinha := vlinha + ' com ' + IntToStr(FprazoEntrada) + ' dias de prazo';
      vlinha := vlinha + ', mais ' + IntToStr(FnumeroDeParcelas) + ' X de ' + format('%n',
        [FvalorDaParcela]);
      vlinha := vlinha + ' no ' + copy(FcontNomeControle, 1, 11);
      textoPlano.Add(vlinha);
      vlinha := 'TOTAL: ' + format('%n', [FvalorEntrada + (FnumeroDeParcelas * FvalorDaParcela)]);
      FvalorTotalGerado := vDadosIni.StrToFloatFormat(FvalorEntrada + (FnumeroDeParcelas * FvalorDaParcela), 2);
      textoPlano.Add(vlinha);
    end;
    if FcontTipoDePlano = 'F' then
    begin
      if FtipoVarejoAtacado = 'A' then
        FvalorCalculo := avista * Power(diaria, 0)
      else
        FvalorCalculo := avista * Power(diaria, FempDiasRecebimentoFinanceira);
      if FvalorCalculo < FempValorVendaMinimoParaFinanciamento then
      begin
        Application.MessageBox('Valor menor que o mínimo permitido pela Financeira, Tente outros Planos',
          'Atenção', MB_ICONWARNING + MB_OK);
        exit;
      end
      else
      begin
        avista := avista - round(100 * FvalorEntrada / Power(diaria, FprazoEntrada)) / 100;
        if FtipoVarejoAtacado = 'A' then
          FvalorCalculo := round(100 * avista * Power(diaria, 0)) / 100
        else
          FvalorCalculo := round(100 * avista * Power(diaria, FempDiasRecebimentoFinanceira)) / 100;
        if FvalorCalculo < FempValorVendaMinimoParaFinanciamento then
        begin
          Application.MessageBox('Valor menor que o mínimo permitido pela Financeira, Tente outros Planos',
            'Atenção', MB_ICONWARNING + MB_OK);
          exit;
        end;
        vJuros.selecionaJuros(FnumeroDeParcelas);
        if not vJuros.dataSet.IsEmpty then
        begin
          if FtipoVarejoAtacado = 'A' then
            FvalorDaParcela := round(100 * (FvalorCalculo + 0) * 1) / 100
          else
            FvalorDaParcela := round(100 * (FvalorCalculo + FempValorAdicionalFinanceira) *
              vJuros.dataSet.FieldByName('COEF_J').AsFloat) / 100
        end
        else
        begin
          Application.MessageBox('Taxa de Juros para Prestação não encontrado, verifique em empresas',
            'Atenção', MB_ICONWARNING + MB_OK);
          exit;
        end;

        textoPlano.clear;
        vlinha := 'Entrada de : ' + format('%n', [FvalorEntrada]);
        if FprazoEntrada > 0 then
          vlinha := vlinha + ' com ' + IntToStr(FprazoEntrada) + ' dias de prazo';
        vlinha := vlinha + ', mais ' + IntToStr(FnumeroDeParcelas) + ' X de ' + format('%n',
          [FvalorDaParcela]);
        vlinha := vlinha + ' no ' + copy(FcontNomeControle, 1, 11);
        textoPlano.Add(vlinha);
        vlinha := 'TOTAL FINANCEIRA: ' + format('%n', [FvalorEntrada + (FnumeroDeParcelas *
            FvalorDaParcela)]);
        FvalorTotalGerado := vDadosIni.StrToFloatFormat(FvalorEntrada + (FnumeroDeParcelas * FvalorDaParcela), 2);
        textoPlano.Add(vlinha);
        vlinha := 'TOTAL EMPRESA   : ' + format('%n', [FvalorEntrada + FvalorCalculo]);
        FvalorDaEmpresa := vDadosIni.StrToFloatFormat(FvalorEntrada + FvalorCalculo, 2);
        textoPlano.Add(vlinha);
      end;

    end;
    if (FcontTipoDePlano = 'B') or (FcontTipoDePlano = 'E') then
    begin
      vPM := (round((2 * FprazoPrimeiraParcela + FintervaloParcelas * (FnumeroDeParcelas - 1))) div
        2);
      if vPM > FempPrazoMedioVenda then
      begin
        Application.MessageBox('Plano não Aceito, Prazo médio muito longo',
          'Atenção', MB_ICONWARNING + MB_OK);
        exit;
      end;
      if FvalorEntrada > 0 then
        avista := avista - round(100 * FvalorEntrada / Power(diaria, FprazoEntrada)) / 100;

      FnumParc := round(FnumeroDeParcelas);
      aux := 0;
      for i := 1 to FnumParc do
        aux := aux + Power(diaria, (1 - i) * FintervaloParcelas - FprazoPrimeiraParcela);
      FvalorDaParcela := round(100 * avista / aux) / 100;
      if FtipoVarejoAtacado = 'A' then
      else if (FcontTipoDePlano = 'B') then
        FvalorDaParcela := FvalorDaParcela + FempCustoBoleto;

      if (FnumeroDeParcelas = 1) and (FprazoPrimeiraParcela = 0) then
      begin
        vlinha := 'Valor a Vista: ' + format('%n', [FvalorDaParcela]);
        textoPlano.Add(vlinha);
      end
      else
      begin
        textoPlano.clear;
        vlinha := 'Entrada de : ' + format('%n', [FvalorEntrada]);
        if FprazoEntrada > 0 then
          vlinha := vlinha + ' com ' + IntToStr(FprazoEntrada) + ' dias de prazo';
        vlinha := vlinha + ', mais ' + IntToStr(FnumeroDeParcelas) + ' X de ' + format('%n',
          [FvalorDaParcela]);
        vlinha := vlinha + ' no ' + copy(FcontNomeControle, 1, 11);
        textoPlano.Add(vlinha);
        vlinha := 'em : ' + IntToStr(FprazoPrimeiraParcela);
        for i := 1 to FnumParc - 1 do
          vlinha := vlinha + '/' + IntToStr(FprazoPrimeiraParcela + i * FintervaloParcelas);
        vlinha := vlinha + ' DIAS';
        textoPlano.Add(vlinha);
        vlinha := 'TOTAL: ' + format('%n', [FvalorEntrada + FvalorDaParcela * FnumeroDeParcelas]);
        FvalorTotalGerado := vDadosIni.StrToFloatFormat(FvalorEntrada + FvalorDaParcela * FnumeroDeParcelas, 2);
        textoPlano.Add(vlinha);
      end;
    end;
    atribuirAtributosParaFormulario;
    Result := true;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    end;
  end;
end;

function TPlanoPagamento.gerarPlanoPeloValorDaParcela: boolean;
var
  vlinha: string;
  i: integer;
  VValFinal: currency;
  diaria: real;
begin
  Result := False;

  if not vDadosIni.PesqPros('FPG013', 'GERAR', 'VENDA ' + FtipoDocVenda + ' NUM ' + IntToStr(FnumeroVenda),
    'PLANO_PAG', '', buscas, False) then
    Exit;

  // Fazer os testes de retroativos
  if frmPlanoPagamento <> nil then
    atribuirDadosDoFormularioParaAtributos;
  if not verificaPrazo then
    Exit;
  try
    if FvalorDaParcela = 0 then
      raise exception.create('Valor da parcela não foi informado');
    diaria := power((1 + (FempTaxaJuros / 100)), (1 / FempDiasPrecoTabela));
    if (FcontTipoDePlano = 'B') or (FcontTipoDePlano = 'E') then
    begin
      VValFinal := 0;
      for i := 1 to FnumParc do
        VValFinal := VValFinal + power(diaria, (1 - i) * FintervaloParcelas -
          FprazoPrimeiraParcela);
      if (FcontTipoDePlano = 'B') then
        VValFinal := (VValFinal * (FvalorDaParcela - FempCustoBoleto) + FvalorEntrada /
          power(diaria,
          FprazoEntrada))
      else
        VValFinal := (VValFinal * FvalorDaParcela + FvalorEntrada / power(diaria, FprazoEntrada));
    end;
    if FcontTipoDePlano = 'C' then
    begin
      if (FnumParc = 1) then
        VValFinal := FvalorDaParcela * (1 - FempPercentualVendaCartao / 100)
      else
      begin
        VValFinal := 0;
        for i := 1 to FnumParc do
          VValFinal := VValFinal + power(1 + FempTaxaCartao / 100, -i);
        VValFinal := (VValFinal * FvalorDaParcela * (1 - FempTaxaCartaoParcelado / 100) +
          FvalorEntrada
          / power(diaria, FprazoEntrada));
      end;
    end;
    if FcontTipoDePlano = 'F' then
    begin
      vJuros.selecionaJuros(FnumeroDeParcelas);
      VValFinal := (FvalorDaParcela / vJuros.dataSet.fieldByName('COEF_J').asfloat -
        FempValorAdicionalFinanceira) /
        power(diaria, FempDiasRecebimentoFinanceira) + FvalorEntrada / power(diaria, FprazoEntrada);
    end;
    FpercentualDesconto := (1 - vvalfinal / FvalorVendaBruto) * 100;
    if FmaximoPercentualDesconto <> 0 then
    begin
      FpercentualDesconto := (1 - vvalfinal / FvalorVendaBruto) * 100;
      if (FpercentualDesconto) > FmaximoPercentualDesconto then
      begin
        Application.MessageBox('Desconto na parcela ultrapassa o limite de desconto para a empresa',
          'Atenção', MB_ICONWARNING + MB_OK);
        Result := false;
        //      FvalorDaParcela := valorfinal;
        //      reValorFinal.setfocus;
        //      vflgfech := 1;  ver issu daqui
        exit;
      end;
    end;
    FvalorTotalGerado := vDadosIni.StrToFloatFormat(FvalorEntrada + (FnumeroDeParcelas * FvalorDaParcela), 2);
    //  FvalorDaParcela :=  VvalFinal;
    if FcontTipoDePlano = 'C' then
    begin
      textoPlano.clear;
      vlinha := 'Entrada de : ' + format('%n', [FvalorEntrada]);
      if FprazoEntrada > 0 then
        vlinha := vlinha + ' com ' + IntToStr(FprazoEntrada) + ' dias de prazo';
      vlinha := vlinha + ', mais ' + IntToStr(FnumeroDeParcelas) + ' X de ' + format('%n',
        [FvalorDaParcela]);
      vlinha := vlinha + ' no ' + copy(FcontNomeControle, 1, 11);
      textoPlano.Add(vlinha);
      vlinha := 'TOTAL: ' + format('%n', [FvalorEntrada + (FnumeroDeParcelas * FvalorDaParcela)]);
      textoPlano.Add(vlinha);
    end;
    if FcontTipoDePlano = 'F' then
    begin
      textoPlano.clear;
      vlinha := 'Entrada de : ' + format('%n', [FvalorEntrada]);
      if FprazoEntrada > 0 then
        vlinha := vlinha + ' com ' + IntToStr(FprazoEntrada) + ' dias de prazo';
      vlinha := vlinha + ', mais ' + IntToStr(FnumeroDeParcelas) + ' X de ' + format('%n',
        [FvalorDaParcela]);
      vlinha := vlinha + ' no ' + copy(FcontNomeControle, 1, 11);
      textoPlano.Add(vlinha);
      vlinha := 'TOTAL FINANCEIRA: ' + format('%n', [FvalorEntrada + (FnumeroDeParcelas *
          FvalorDaParcela)]);
      textoPlano.Add(vlinha);
      vlinha := 'TOTAL EMPRESA   : ' + format('%n', [(FvalorEntrada + FvalorCalculo)]);
      textoPlano.Add(vlinha);
    end;
    if (FcontTipoDePlano = 'B') or (FcontTipoDePlano = 'E') then
    begin
      if (FnumeroDeParcelas = 1) and (FprazoPrimeiraParcela = 0) then
      begin
        vlinha := 'Valor a Vista: ' + format('%n', [FvalorDaParcela]);
        textoPlano.Add(vlinha);
      end
      else
      begin
        textoPlano.clear;
        vlinha := 'Entrada de : ' + format('%n', [FvalorEntrada]);
        if FprazoEntrada > 0 then
          vlinha := vlinha + ' com ' + IntToStr(FprazoEntrada) + ' dias de prazo';
        vlinha := vlinha + ', mais ' + IntToStr(FnumeroDeParcelas) + ' X de ' + format('%n',
          [FvalorDaParcela]);
        vlinha := vlinha + ' no ' + copy(FcontNomeControle, 1, 11);
        textoPlano.Add(vlinha);
        vlinha := 'em : ' + IntToStr(FprazoPrimeiraParcela);
        for i := 1 to FnumParc - 1 do
          vlinha := vlinha + '/' + IntToStr(FprazoPrimeiraParcela + i * FintervaloParcelas);
        vlinha := vlinha + ' DIAS';
        textoPlano.Add(vlinha);
        vlinha := 'TOTAL: ' + format('%n', [FvalorEntrada + FvalorDaParcela * FnumeroDeParcelas]);
        textoPlano.Add(vlinha);
      end;
    end;
    atribuirAtributosParaFormulario;
    Result := true;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    end;
  end;
end;

function TPlanoPagamento.getValorPlano: Currency;
begin
  if FcontTipoDePlano = 'F' then
    Result := FvalorDaEmpresa
  else
    Result := FvalorTotalGerado;
end;

procedure TPlanoPagamento.habilitarControlePlanoPagamento;
begin
  atribuirDadosDoFormularioParaAtributos;
  if FcontTipoDePlano = 'C' then
  begin
    frmPlanoPagamento.edNumeroDeParcelas.enabled := true;
    frmPlanoPagamento.edPrazoPrimeiraParcela.Enabled := false;
    frmPlanoPagamento.edIntervaloParcelas.Enabled := false;
    frmPlanoPagamento.edValorEntrada.Enabled := true;
    frmPlanoPagamento.edPrazoEntrada.Enabled := true;
    FprazoPrimeiraParcela := 0;
    FintervaloParcelas := 0;
  end
  else
  begin
    if FcontTipoDePlano = 'F' then
    begin
      frmPlanoPagamento.edNumeroDeParcelas.enabled := true;
      frmPlanoPagamento.edPrazoPrimeiraParcela.Enabled := false;
      frmPlanoPagamento.edIntervaloParcelas.Enabled := false;
      frmPlanoPagamento.edValorEntrada.Enabled := true;
      frmPlanoPagamento.edPrazoEntrada.Enabled := true;
      FprazoPrimeiraParcela := 0;
      FintervaloParcelas := 0;
    end
    else
    begin
      frmPlanoPagamento.edNumeroDeParcelas.enabled := true;
      frmPlanoPagamento.edPrazoPrimeiraParcela.Enabled := true;
      frmPlanoPagamento.edIntervaloParcelas.Enabled := true;
      frmPlanoPagamento.edValorEntrada.Enabled := true;
      frmPlanoPagamento.edPrazoEntrada.Enabled := true;
    end;
  end;
  if trim(FcontNomeControle) = 'DINHEIRO' then
  begin
    FprazoPrimeiraParcela := 0;
    FintervaloParcelas := 0;
    FprazoEntrada := 0;
    FvalorEntrada := 0;
    frmPlanoPagamento.grupoCalculo.enabled := false;
    frmPlanoPagamento.edValorDaParcela.Enabled := false;
    frmPlanoPagamento.btVer.enabled := false;

    FvalorDaParcela := FvalorVendaLiquido;
    FnumeroDeParcelas := 1;
    //    vnparc:=round(frmPlanoPagamento.edNumeroDeParcelas.AsValue); ver issu daqui
    if FModoVenda then
    begin
      frmPlanoPagamento.btConfirmar.enabled := true;
      if (frmPlanoPagamento.Enabled) and (frmPlanoPagamento.Visible) and (frmPlanoPagamento.btConfirmar.CanFocus) then
        frmPlanoPagamento.btConfirmar.setfocus;
    end;
    //    atribuirAtributosParaFormulario;
  end
  else
  begin
    frmPlanoPagamento.grupoCalculo.enabled := true;
    frmPlanoPagamento.edValorDaParcela.Enabled := true;
    frmPlanoPagamento.btVer.enabled := true;
    frmPlanoPagamento.btConfirmar.enabled := false;
    if (frmPlanoPagamento.Enabled) and (frmPlanoPagamento.Visible) and (frmPlanoPagamento.edNumeroDeParcelas.CanFocus) then
      frmPlanoPagamento.edNumeroDeParcelas.setfocus;
  end;
  atribuirAtributosParaFormulario;
end;

function TPlanoPagamento.iniciaAtributos(numeroDaVenda, codigoDoCliente,
  codigoDoVendedor: integer; valorBruto, percentualDoDesconto, maxPercDesc: Currency;
  tipoVarAta, tipoVenda, pTipoOS: string): boolean;
var
  vCtrlVND, vCondPagVND: Integer;
  vtemp, vtemp2: string;
  I: Integer;
  ConfigPoliticaPag: TConfig_sistema_class;
  vUsarControlesVenda: string;
begin
  try
  	try
      Result := false;

      ConfigPoliticaPag := TConfig_sistema_class.getConf('ped_vnd_definir_politica_pagamento', buscas, vDadosIni.cod_empresa);
  		vUsarControlesVenda := UpperCase(ConfigPoliticaPag.ReadString('CONTROLE', 'Usar'));

      FnumeroVenda := numeroDaVenda;
      FcodigoCliente := codigoDoCliente;
      FcodigoVendedor := codigoDoVendedor;
      FvalorVendaBruto := valorBruto;
      FpercentualDesconto := percentualDoDesconto;
      FmaximoPercentualDesconto := maxPercDesc;
      FtipoVarejoAtacado := tipoVarAta;
      FtipoDocVenda := tipoVenda;
      FvalorVendaLiquido := FvalorVendaBruto - ((FvalorVendaBruto * FpercentualDesconto) / 100);
      FnumeroDeParcelas := 0;
      FvalorEntrada := 0;
      FintervaloParcelas := 0;
      FprazoEntrada := 0;
      FprazoPrimeiraParcela := 0;
      FvalorDaParcela := 0;
      FtipoVarejoAtacado := tipoVarAta;
      if FnumeroVenda > 0 then
        FModoVenda := true;

      vEmp.abreEmpresa;
      FempDiasPrecoTabela := vEmp.dataSet.FieldByName('DIAS_PREC_TAB').AsInteger;
      FempPrazoMedioVenda := vEmp.dataSet.FieldByName('PRAZO_MED_VND').AsInteger;
      FempCustoBoleto := vEmp.dataSet.FieldByName('CUSTO_BOLETA').AsCurrency;
      FempTaxaCartao := vEmp.dataSet.FieldByName('TX_CARTAO').AsFloat;
      FempPercentualVendaCartao := vEmp.dataSet.FieldByName('PERC_VND_CARTAO').AsFloat;
      FempTaxaCartaoParcelado := vEmp.dataSet.FieldByName('TX_CARTAO_PARC').AsFloat;
      FempDiasRecebimentoFinanceira := vEmp.dataSet.FieldByName('DIAS_REC_FIN').AsInteger;
      FempValorAdicionalFinanceira := vEmp.dataSet.FieldByName('ADIC_FIN').AsCurrency;
      FempValorVendaMinimoParaFinanciamento := vEmp.dataSet.FieldByName('VND_MIN_FIN').AsCurrency;
      FempTaxaJuros := vEmp.dataSet.FieldByName('TX_JUROS').AsFloat;
      FempCasasDecimais := vEmp.dataSet.FieldByName('CASAS_DECIMAIS').AsInteger;
  //    FempMaximoDescontoVarejo := vEmp.dataSet.FieldByName('TOTDESC_EMP').AsFloat;
  //    FempMaximoDescontoAtacado := vEmp.dataSet.FieldByName('TOTDESC_EMPA').AsFloat;

      if (trim(tipoVarAta)='') and (trim(pTipoOS)='') then
      begin
        buscas.close;
        buscas.SQL.Text:= 'select ptv.maxdescontotv from tipo_vendas tv inner join percentuaistipovnd ptv '+
          ' on tv.cod_tipo=ptv.cod_tipo where tv.tipo=''REQ'' and tv.sigla=''V'' '+
          ' and ptv.cod_empresa = '+vDadosIni.codEmpresa;
        buscas.Open;
        FempMaximoDescontoVarejo:= buscas.FieldByName('maxdescontotv').AsFloat;
        buscas.close;
        buscas.SQL.Text:= 'select ptv.maxdescontotv from tipo_vendas tv inner join percentuaistipovnd ptv '+
          ' on tv.cod_tipo=ptv.cod_tipo where tv.tipo=''REQ'' and tv.sigla=''A'' '+
          ' and ptv.cod_empresa = '+vDadosIni.codEmpresa;
        buscas.Open;
        FempMaximoDescontoAtacado:= buscas.FieldByName('maxdescontotv').AsFloat;
        FDescricaotipoVnd := 'V - VAREJO';
      end
      else
      begin
        buscas.close;
        buscas.SQL.Text:= 'select ptv.maxdescontotv,tv.descricao  from tipo_vendas tv '+
          ' inner join percentuaistipovnd ptv on tv.cod_tipo=ptv.cod_tipo '+
          ' where tv.tipo='+ QuotedStr(tipoVenda)+
          ' and ((tv.sigla='+QuotedStr(tipoVarAta)+
          ' and coalesce(tv.sigla,'''')<>'''') or (tv.tipo_os='+QuotedStr(pTipoOS)+
          ' and coalesce(tv.tipo_os,'''')<>''''))';
        buscas.Open;
        FempMaximoDescontoVarejo:= buscas.FieldByName('maxdescontotv').AsFloat;
        FempMaximoDescontoAtacado:= buscas.FieldByName('maxdescontotv').AsFloat;
        FDescricaotipoVnd := trim(buscas.FieldByName('descricao').AsString);
      end;

      FformasCliente := Trim(retornaValor('select controles_fp as valor from clientes ' +
        ' where cod_cliente = ' + IntToStr(codigoCliente) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa));

      if trim(FformasCliente) <> '' then
        if (Copy(trim(FformasCliente), 1, 1) = '(')
          and (Copy(trim(FformasCliente), Length(trim(FformasCliente)), 1) <> ')') then
        begin
          vtemp := '';
          vtemp2 := '';
          for I := 1 to Length(trim(FformasCliente)) do
          begin
            vtemp := vtemp + trim(FformasCliente[I]);
            if trim(FformasCliente[I]) = ',' then
              vtemp2 := vtemp;
          end;
          FformasCliente := Copy(vtemp2, 1, Length(vtemp2) - 1) + ')';
        end;

      vCtrlVND    := 0;
      vCondPagVND := 0;
      if (vUsarControlesVenda = 'S')
      	and ((trim(FtipoDocVenda) = 'REQ') or (trim(FtipoDocVenda) = 'OS')) then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select cod_cond_pag, cod_controle from pedvenda' +
          ' where nped = ' + IntToStr(FnumeroVenda) +
          ' and tipo = ' + QuotedStr(trim(FtipoDocVenda)) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.Open;
        vCtrlVND    := buscas.FieldByName('cod_controle').AsInteger;
        vCondPagVND := buscas.FieldByName('cod_cond_pag').AsInteger;
      end;

      vControle.selecionaControlesFormPag(FformasCliente, vCtrlVND, ((FtipoDocVenda = 'PRE') or (FtipoDocVenda = 'REC')));
      FtextoPlano := TStringList.create;
      Result := true;
    finally
      if Assigned(ConfigPoliticaPag) then
        FreeAndNil(ConfigPoliticaPag);
    end;
  except
    Result := false;
  end;
end;

function TPlanoPagamento.selecionaPlanoPagamento(numDaVenda: integer;
  tipoDaVenda: string): boolean;
begin
  FnumeroVenda := numDaVenda;
  FtipoDocVenda := tipoDaVenda;
  Result := montaSelect('select * from plano_pag where ' +
    ' nrequisicao = ' + IntToStr(FnumeroVenda) +
    ' and tpdocs = ' + QuotedStr(FtipoDocVenda) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 1');
end;

function TPlanoPagamento.verificaPrazo: boolean;
begin
  Result := true;
  if FcontTipoDePlano = 'C' then
  begin
    if FprazoEntrada > FempDiasPrecoTabela then
    begin
      Application.MessageBox('Prazo de entrada extrapola limite ', 'Atenção', MB_OK +
        MB_ICONEXCLAMATION);
      Result := false;
    end;
  end;
  if FcontTipoDePlano = 'F' then
  begin
    if FprazoEntrada > (FempDiasRecebimentoFinanceira - 1) then
    begin
      Application.MessageBox('Prazo de entrada extrapola limite para Financeira', 'Atenção', MB_OK
        + MB_ICONEXCLAMATION);
      Result := false;
    end;
  end;
end;

{ TEmpresaPlano }

function TEmpresaPlano.abreEmpresa: boolean;
begin
  result := montaSelect('SELECT DIAS_PREC_TAB,PRAZO_MED_VND,CUSTO_BOLETA,TX_CARTAO,' +
    ' PERC_VND_CARTAO,DIAS_REC_FIN,ADIC_FIN,VND_MIN_FIN,TX_JUROS,CASAS_DECIMAIS,' +
    ' TX_CARTAO_PARC,TOTDESC_EMP,TOTDESC_EMPA FROM EMPRESA ' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1');
end;

constructor TEmpresaPlano.create;
begin
  DataSet := TClientDataSet(dtmFP.CdsEmpresa);
  transacao := TIBTransaction(dtmFP.transacao);
  Buscas := TIBQuery(dtmFP.qrBuscas);
end;

{ TBoletasFP }

constructor TBoletasFP.create;
begin
  dataSet := TClientDataSet(dtmFP.CdsBolFp);
  transacao := TIBTransaction(dtmFP.transacao);
  Buscas := TIBQuery(dtmFP.qrBuscas);
end;

function TBoletasFP.selecionaBoletasFp(pNumNf, pSerie: integer): boolean;
begin
  Result := montaSelect('select b.n_seq_bol,b.data_ven_bol, b.n_doc_bol, b.vl_doc_bol, ct.codigo_ctrl,' +
    ' c.cod_cliente, c.nome_cliente, b.nosso_numero_banco, b.remessa_enviada from boletas b' +
    ' left join controles ct on ct.codigo_ctrl = b.cod_controle_cx and ct.codigo_emp = b.cod_empresa' +
    ' left join clientes c on c.cod_cliente = b.cod_cliente and c.cod_empresa = b.cod_empresa' +
    ' where b.num_nf_vnd = ' + IntToStr(pNumNf) +
    ' and b.sub_serie = ' + IntToStr(pSerie) +
    ' and b.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and b.ativo = 1 and b.cod_controle_cx > 0');
end;

function TBoletasFP.selecionaBoletasOSFp(pNumOS: integer): boolean;
begin
  Result := montaSelect('select b.n_seq_bol,b.data_ven_bol, b.n_doc_bol, b.vl_doc_bol, ct.codigo_ctrl,' +
    ' c.cod_cliente, c.nome_cliente, b.nosso_numero_banco, b.remessa_enviada from boletas b' +
    ' left join controles ct on ct.codigo_ctrl = b.cod_controle_cx and ct.codigo_emp = b.cod_empresa' +
    ' left join clientes c on c.cod_cliente = b.cod_cliente and c.cod_empresa = b.cod_empresa' +
    ' where b.num_nf_vnd = ' + IntToStr(pNumOS) +
    ' and b.tipo_emissao = ''OS''' +
    ' and b.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and b.ativo = 1');
end;

{ TJurosPlano_2 }

function TJurosPlano_2.abreTodas: boolean;
begin
  Result := montaSelect('select * from tabjuros_plano where cod_empresa = ' + vDadosIni.CodEmpresa);
end;

constructor TJurosPlano_2.create;
begin
  DataSet := TClientDataSet(dtmFP.cdsJurosPl2);
  transacao := TIBTransaction(dtmFP.transacao);
  Buscas := TIBQuery(dtmFP.qrBuscas);
  dataSet.BeforePost := TaxaJurosPlano2BeforePost;
end;

function TJurosPlano_2.salvaTaxas(nPrestacoes: integer): boolean;
begin
  try
    Result := true;
    selecionaJuros(nPrestacoes);
    if DataSet.IsEmpty then
    begin
      DataSet.Insert;
      DataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.CodEmpresa;
    end
    else
      DataSet.Edit;
    DataSet.FieldByName('JUROS_CARTAO').AsFloat := taxas.txCartao;
    DataSet.FieldByName('JUROS_CARTAO_COM_ENTRADA').AsFloat := taxas.txCartaoComEnt;
    DataSet.FieldByName('JUROS_CHEQUE').AsFloat := taxas.txCheque;
    DataSet.FieldByName('JUROS_CHEQUE_COM_ENTRADA').AsFloat := taxas.txChequeComEnt;
    DataSet.FieldByName('JUROS_BOLETA').AsFloat := taxas.txBoleta;
    DataSet.FieldByName('JUROS_BOLETA_COM_ENTRADA').AsFloat := taxas.txBoletaComEnt;
    DataSet.FieldByName('JUROS_CREDIARIO').AsFloat := taxas.txCrediario;
    DataSet.FieldByName('JUROS_CREDIARIO_COM_ENTRADA').AsFloat := taxas.txCrediarioComEnt;
    if inherited post then
      Apply;
    Result := true;
  except
    on e: exception do
    begin
      result := false;
      MessageDlg('Erro ao salvar dados. Erro: ' + e.Message, mtInformation, [mbOK], 0);
    end;
  end;
end;

function TJurosPlano_2.selecionaJuros(nPrestacoes: integer): boolean;
begin
  Result := montaSelect('select * from tabjuros_plano where numero_prestacoes = ' +
    IntToStr(nPrestacoes) + ' and cod_empresa = ' + vDadosIni.CodEmpresa);
end;

procedure TJurosPlano_2.TaxaJurosPlano2BeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.CodEmpresa;
end;

{ TPlanoPagamento_2 }

function TPlanoPagamento_2.abreFormEntrada(valorParcela: Currency): Currency;
var
  formulario: Tform;
  vCodCnt: Integer;
begin
  try
    Result := 0;
    vCodCnt := 1;
    formulario := TForm.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Forma de Pagamento da Entrada';
    frmPlanoPagamentoV2.Panel2.Parent := formulario;
    frmPlanoPagamentoV2.Panel2.Visible := True;
    frmPlanoPagamentoV2.Panel2.Refresh;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    if Trim(vCont.dataSet.FieldByName('DOCS').AsString) = 'N' then
      vCodCnt := vCont.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
    vCont.selecionaControlesEntrada;
    frmPlanoPagamentoV2.DBLookupComboBox2.KeyValue := vCodCnt;
    frmPlanoPagamentoV2.RealEdit8.AsValue := valorParcela;
    if (formulario.ShowModal = mrOk) then
      if frmPlanoPagamentoV2.RealEdit8.AsValue > 0 then
        Result := frmPlanoPagamentoV2.RealEdit8.AsValue;
  finally
    frmPlanoPagamentoV2.Panel2.Visible := False;
    frmPlanoPagamentoV2.Panel2.Parent := frmPlanoPagamentoV2;
    formulario.Free;
    formulario := nil;
  end;
end;

function TPlanoPagamento_2.alterarParcela(indice: integer; valor: Currency;
  data: string): boolean;
begin
  FData[indice] := data;
  FValor[indice] := valor;
end;

procedure TPlanoPagamento_2.calcDesconto;
begin
  vDadosPlano.valor_com_desconto := vDadosPlano.valor_operacao - vDadosPlano.valor_desconto;
end;

function TPlanoPagamento_2.calcularDesconto: boolean;
var
  vPercentual: Double;
begin
  Result := true;
  calcDesconto;
  if vDadosPlano.percentual_maximo_desconto <> 0 then
  begin
    vPercentual := (1 - vDadosPlano.valor_com_desconto / vDadosPlano.valor_operacao) * 100;
    if vPercentual > vDadosPlano.percentual_maximo_desconto then
    begin
      Application.MessageBox('Desconto na parcela ultrapassa o limite de desconto para a empresa',
        'Atenção', MB_ICONWARNING + MB_OK);
      Result := false;
      exit;
    end;
  end;
end;

constructor TPlanoPagamento_2.create;
begin
  DataSet := TClientDataSet(dtmFP.cdsPlano2);
  transacao := TIBTransaction(dtmFP.transacao);
  Buscas := TIBQuery(dtmFP.qrBuscas);
  vJuros := TJurosPlano_2.create;
  vCont := TControleFP.create;
  vDadosPlano.numero_prestacoes := 0; //vDadosPlano.valor_operacao := 0;
  //vDadosPlano.valor_desconto := 0;
  vDadosPlano.valor_entrada := 0;
  vDadosPlano.valor_com_desconto := 0;
  vDadosPlano.valor_aplicado := 0;
  vDadosPlano.taxaAplicada := 0;
  SetLength(FValor, 0);
  SetLength(FData, 0);
end;

destructor TPlanoPagamento_2.destroy;
begin
  inherited;
  vJuros.free;
  vCont.free;
  vJuros := nil;
  vCont := nil;
end;

function TPlanoPagamento_2.gerarParcelas(listaBox: TListBox): boolean;
var
  valor1, valor2, vDatatemp, vDiaBase: string;
  I: integer;
  vData: TDate;
begin
  try
    Result := False;

    if not vDadosIni.PesqPros('FPG012', 'GERAR', 'VENDA ' + vDadosPlano.tipo_venda + ' NUM ' + IntToStr(vDadosPlano.numero_venda),
      'PLANO_PAG', '', buscas, False) then
      Exit;

    try
      SetLength(FValor, 0);
      SetLength(FData, 0);
    except
    end;
    calcularDesconto;
    if (vDadosPlano.numero_prestacoes = 0) and (vDadosPlano.valor_entrada = 0) then
      raise exception.create('Numero de parcelas não informado');
    valor1 := Trim(Format('%10.2f', [vDadosPlano.valor_entrada]));
    valor2 := Trim(Format('%10.2f', [vDadosPlano.valor_com_desconto]));
    if (vDadosPlano.numero_prestacoes = 0) and (valor1 <> valor2) then
      raise exception.create('Valor a vista diferente do valor da operação');

    if valor1 = valor2 then
    begin
      vDadosPlano.textoEdit := 'Pagamento a vista';
      vDadosPlano.valor_aplicado := vDadosPlano.valor_entrada;
      vDadosPlano.valor_parcela := vDadosPlano.valor_entrada;
      vDadosPlano.numero_prestacoes := 0;
      SetLength(FData, 1);
      fData[0] := DateToStr(vDadosIni.getDataBanco(buscas));
      listaBox.Clear;
      Result := true;
      exit;
    end;

    vDadosPlano.valor_aplicado := vDadosPlano.valor_com_desconto - vDadosPlano.valor_entrada;
    vDadosPlano.valor_parcela := round(100 * (vDadosPlano.valor_aplicado) *
      vDadosPlano.taxaAplicada) / 100;
    vDadosPlano.valor_aplicado := (vDadosPlano.valor_parcela * vDadosPlano.numero_prestacoes) +
      vDadosPlano.valor_entrada;

    SetLength(FValor, vDadosPlano.numero_prestacoes);
    SetLength(FData, vDadosPlano.numero_prestacoes);
    listaBox.Clear;
    vData := vDadosIni.getDataBanco(buscas);
    ShortDateFormat := 'dd/mm/yyyy';
    vDiaBase := copy(DateToStr(vData), 1, 2);
    for i := 1 to vDadosPlano.numero_prestacoes do
    begin
      if vDadosIni.vPlanoDiaBase = 'S' then
        FData[i - 1] := DateToStr(IncMonth(vData, I))
      else
        FData[i - 1] := DateToStr(vData + (i * 30));
      FValor[i - 1] := vDadosPlano.valor_parcela;
      listaBox.Items.Add(
        FData[i - 1] + '   -   ' + //10
        Trim(format('%10.2f', [vDadosPlano.valor_parcela])));
    end;
    vDadosPlano.textoEdit := '';
    if vDadosPlano.valor_entrada > 0 then
      vDadosPlano.textoEdit := 'Entrada de ' + Trim(Format('%10.2f', [vDadosPlano.valor_entrada])) + '. ';
    if vDadosPlano.numero_prestacoes = 1 then
      vDadosPlano.textoEdit := vDadosPlano.textoEdit + '1 Parcela de '
    else
      vDadosPlano.textoEdit := vDadosPlano.textoEdit + IntToStr(vDadosPlano.numero_prestacoes) + ' Parcelas de ';
    vDadosPlano.textoEdit := vDadosPlano.textoEdit + Trim(Format('%10.2f', [vDadosPlano.valor_parcela])) +
      ' no ' + trim(vCont.DataSet.fieldbyname('nome_ctrl').AsString);
    vDadosPlano.textoEdit := vDadosPlano.textoEdit + '. Total ' + Trim(Format('%10.2f', [vDadosPlano.valor_aplicado]));
    Result := true;
  except
    on e: exception do
    begin
      Result := false;
      MessageDlg(e.Message, mtError, [mbOK], 0);
    end;
  end;
end;

function TPlanoPagamento_2.gerarParcelas(valor_da_parcela: Currency;
  listaBox: TListBox): boolean;
var
  valor1, valor2, vDatatemp, vDiaBase: string;
  I: integer;
  vData: Tdate;
begin
  try
    Result := False;

    if not vDadosIni.PesqPros('FPG013', 'GERAR', 'VENDA ' + vDadosPlano.tipo_venda + ' NUM ' + IntToStr(vDadosPlano.numero_venda),
      'PLANO_PAG', '', buscas, False) then
      Exit;

    try
      SetLength(FValor, 0);
      SetLength(FData, 0);
    except
    end;
    calcularDesconto;
    if (vDadosPlano.numero_prestacoes = 0) and (vDadosPlano.valor_entrada = 0) then
      raise exception.create('Numero de parcelas não informado');
    valor1 := Trim(Format('%10.2f', [vDadosPlano.valor_entrada]));
    valor2 := Trim(Format('%10.2f', [vDadosPlano.valor_com_desconto]));
    if (vDadosPlano.numero_prestacoes = 0) and (valor1 <> valor2) then
      raise exception.create('Valor a vista diferente do valor da operação');

    if valor1 = valor2 then
    begin
      vDadosPlano.textoEdit := 'Pagamento a vista';
      vDadosPlano.valor_aplicado := vDadosPlano.valor_entrada;
      vDadosPlano.valor_parcela := vDadosPlano.valor_entrada;
      vDadosPlano.numero_prestacoes := 0;
      SetLength(FData, 1);
      fData[0] := DateToStr(vDadosIni.getDataBanco(buscas));
      listaBox.Clear;
      Result := true;
      exit;
    end;

    //
    vDadosPlano.valor_aplicado := valor_da_parcela / vDadosPlano.taxaAplicada;
    vDadosPlano.valor_desconto := (1 - (vDadosPlano.valor_aplicado + vDadosPlano.valor_entrada) / vDadosPlano.valor_operacao) * 100;
    vDadosPlano.valor_desconto := (vDadosPlano.valor_operacao * vDadosPlano.valor_desconto) / 100;
    if not calcularDesconto then
      exit;
    vDadosPlano.valor_parcela := valor_da_parcela;
    vDadosPlano.valor_aplicado := (vDadosPlano.valor_parcela * vDadosPlano.numero_prestacoes) +
      vDadosPlano.valor_entrada;

    SetLength(FValor, vDadosPlano.numero_prestacoes);
    SetLength(FData, vDadosPlano.numero_prestacoes);
    listaBox.Clear;
    vData := vDadosIni.getDataBanco(buscas);
    ShortDateFormat := 'dd/mm/yyyy';
    vDiaBase := copy(DateToStr(vData), 1, 2);
    for i := 1 to vDadosPlano.numero_prestacoes do
    begin
      if vDadosIni.vPlanoDiaBase = 'S' then
        FData[i - 1] := DateToStr(IncMonth(vData, I))
      else
        FData[i - 1] := DateToStr(vData + (i * 30));
      FValor[i - 1] := vDadosPlano.valor_parcela;
      listaBox.Items.Add(
        FData[i - 1] + '   -   ' + //10
        Trim(format('%10.2f', [vDadosPlano.valor_parcela])));
    end;
    vDadosPlano.textoEdit := '';
    if vDadosPlano.valor_entrada > 0 then
      vDadosPlano.textoEdit := 'Entrada de ' + Trim(Format('%10.2f', [vDadosPlano.valor_entrada])) + '. ';
    if vDadosPlano.numero_prestacoes = 1 then
      vDadosPlano.textoEdit := vDadosPlano.textoEdit + '1 Parcela de '
    else
      vDadosPlano.textoEdit := vDadosPlano.textoEdit + IntToStr(vDadosPlano.numero_prestacoes) + ' Parcelas de ';
    vDadosPlano.textoEdit := vDadosPlano.textoEdit + Trim(Format('%10.2f', [vDadosPlano.valor_parcela])) +
      ' no ' + trim(vCont.DataSet.fieldbyname('nome_ctrl').AsString);
    vDadosPlano.textoEdit := vDadosPlano.textoEdit + '. Total ' + Trim(Format('%10.2f', [vDadosPlano.valor_aplicado]));
    Result := true;
  except
    on e: exception do
    begin
      Result := false;
      MessageDlg(e.Message, mtError, [mbOK], 0);
    end;
  end;
end;

function TPlanoPagamento_2.gerarPlanoPagamento2(
  valorDaOperacao, valorDesconto, percentual_desconto_maximo: Currency;
  pNumero_venda, pCodigo_cliente, pCodigo_vendedor: integer; pTipo_venda: string): Boolean;
var
  FformasCliente: string;
  vtemp, vtemp2: string;
  vCtrlVND, vCondPagVND: Integer;
  I: Integer;
  ConfigPoliticaPag: TConfig_sistema_class;
  vUsarControlesVenda: string;
begin
  try
  	ConfigPoliticaPag := TConfig_sistema_class.getConf('ped_vnd_definir_politica_pagamento', buscas, vDadosIni.cod_empresa);
		vUsarControlesVenda := UpperCase(ConfigPoliticaPag.ReadString('CONTROLE', 'Usar'));

    Application.CreateForm(TfrmPlanoPagamentoV2, frmPlanoPagamentoV2);
    cadPlano.vDadosPlano.valor_operacao := valorDaOperacao;
    cadPlano.vDadosPlano.valor_desconto := valorDesconto;
    cadPlano.vDadosPlano.percentual_maximo_desconto := percentual_desconto_maximo;
    cadPlano.vDadosPlano.numero_venda := pNumero_venda;
    cadPlano.vDadosPlano.codigo_cliente := pCodigo_cliente;
    cadPlano.vDadosPlano.codigo_vendedor := pCodigo_vendedor;
    cadPlano.vDadosPlano.tipo_venda := pTipo_venda;
    cadPlano.calcularDesconto;

    FformasCliente := Trim(retornaValor('select controles_fp as valor from clientes ' +
      ' where cod_cliente = ' + IntToStr(cadPlano.vDadosPlano.codigo_cliente) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa));

    if trim(FformasCliente) <> '' then
    	if (Copy(trim(FformasCliente), 1, 1) = '(') 
      	and (Copy(trim(FformasCliente), Length(trim(FformasCliente)), 1) <> ')') then
      begin
      	vtemp := '';
        vtemp2 := '';
      	for I := 1 to Length(trim(FformasCliente)) do
        begin
          vtemp := vtemp + trim(FformasCliente[I]);
          if trim(FformasCliente[I]) = ',' then
          	vtemp2 := vtemp;
        end;
        FformasCliente := Copy(vtemp2, 1, Length(vtemp2) - 1) + ')';
      end;

    vCtrlVND    := 0;
    vCondPagVND := 0;
    if (vUsarControlesVenda = 'S')
    	and ((trim(cadPlano.vDadosPlano.tipo_venda) = 'REQ') or (trim(cadPlano.vDadosPlano.tipo_venda) = 'OS')) then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select cod_controle from pedvenda' +
        ' where nped = ' + IntToStr(cadPlano.vDadosPlano.numero_venda) +
        ' and tipo = ' + QuotedStr(trim(cadPlano.vDadosPlano.tipo_venda)) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;
      vCtrlVND    := buscas.FieldByName('cod_controle').AsInteger;
      vCondPagVND := buscas.FieldByName('cod_cond_pag').AsInteger;
    end;

    cadPlano.vCont.selecionaControlesFormPag(FformasCliente, vCtrlVND, ((pTipo_venda = 'PRE') or (pTipo_venda = 'REC')));
    if pNumero_venda = 0 then
      frmPlanoPagamentoV2.RealEdit1.OnEnter := nil;
    if frmPlanoPagamentoV2.ShowModal = mrOK then
    begin
      vDadosPlano.valor_aplicado := cadPlano.vDadosPlano.valor_aplicado;
      vDadosPlano.valor_entrada := cadPlano.vDadosPlano.valor_entrada;
      result := true;
    end
    else
      Result := false;
  finally
  	if Assigned(ConfigPoliticaPag) then
    	FreeAndNil(ConfigPoliticaPag);
      
    frmPlanoPagamentoV2.free;
    frmPlanoPagamentoV2 := nil;
  end;
end;

function TPlanoPagamento_2.getTaxa: Double;
begin
  if vDadosPlano.numero_prestacoes = 0 then
  begin
    Result := 0;
    vDadosPlano.taxaAplicada := Result;
    exit;
  end;
  vJuros.selecionaJuros(vDadosPlano.numero_prestacoes);
  if vJuros.DataSet.IsEmpty then
  begin
    Result := -1;
    MessageDlg('Taxa não encontrada com dados informados', mtInformation, [mbOK], 0);
    exit;
  end;

  if vDadosPlano.valor_entrada = 0 then
  begin
    if vCont.DataSet.fieldbyname('tp_plano').asstring = 'C' then
      Result := vJuros.DataSet.fieldbyname('JUROS_CARTAO').AsFloat
    else if vCont.DataSet.fieldbyname('tp_plano').asstring = 'F' then
      Result := vJuros.DataSet.fieldbyname('JUROS_CREDIARIO').AsFloat
    else if vCont.DataSet.fieldbyname('tp_plano').asstring = 'B' then
      Result := vJuros.DataSet.fieldbyname('JUROS_BOLETA').AsFloat
    else if vCont.DataSet.fieldbyname('tp_plano').asstring = 'E' then
      Result := vJuros.DataSet.fieldbyname('JUROS_CHEQUE').AsFloat;
  end
  else
  begin
    if vCont.DataSet.fieldbyname('tp_plano').asstring = 'C' then
      Result := vJuros.DataSet.fieldbyname('JUROS_CARTAO_COM_ENTRADA').AsFloat
    else if vCont.DataSet.fieldbyname('tp_plano').asstring = 'F' then
      Result := vJuros.DataSet.fieldbyname('JUROS_CREDIARIO_COM_ENTRADA').AsFloat
    else if vCont.DataSet.fieldbyname('tp_plano').asstring = 'B' then
      Result := vJuros.DataSet.fieldbyname('JUROS_BOLETA_COM_ENTRADA').AsFloat
    else if vCont.DataSet.fieldbyname('tp_plano').asstring = 'E' then
      Result := vJuros.DataSet.fieldbyname('JUROS_CHEQUE_COM_ENTRADA').AsFloat;
  end;
  vDadosPlano.taxaAplicada := Result;
end;

function TPlanoPagamento_2.salvarPlanoPagamento: boolean;
var
  iprest, itx: integer;
  vdtBanco: TDate;
  vValorRestante, vrTemp, valorJaGravado: Currency;
begin

  Result := False;

  if not vDadosIni.PesqPros('FPG014', 'INCLUIR', 'VENDA ' + vDadosPlano.tipo_venda + ' NUM ' + IntToStr(vDadosPlano.numero_venda),
    'PLANO_PAG', '', buscas, False) then
    Exit;

  if not verificaLimiteDeCredito then
  begin
    Result := false;
    exit;
  end;

  Result := montaSelect(' select * from plano_pag ' +
  	' where nrequisicao = ' + IntToStr(vDadosPlano.numero_venda) +
    ' and tpdocs = ' + QuotedStr(vDadosPlano.tipo_venda) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ativo = 1');

  if not DataSet.IsEmpty then
  begin
    valorJaGravado := Self.fsum('valordoc');
    if ShowConfirmacao('Já existe um plano de pagamento no valor de "R$ %0.2f".' + sLineBreak + sLineBreak +
                       'Deseja continuar e apagar os valores já gravados?', [valorJaGravado]) = IDYES then
    begin
      dataSet.first;
      while not dataSet.eof do
        dataSet.delete;
    end
    else
    begin
      Self.vDadosPlano.valor_aplicado := valorJaGravado;
      dataSet.Close;
      exit;
    end;
  end;
  if Application.MessageBox('Confirma o registro do plano', 'Confirmação', MB_ICONQUESTION +
    MB_YESNO) = IDYES then
  begin
    ExecutaComandosSqlExec(' delete from FORMPAGAMENTO ' +
    	' where NREQUISICAO = ' + IntToSTr(vDadosPlano.numero_venda) +
      ' and TPDOCS = ' + QuotedStr(Trim(vDadosPlano.tipo_venda)) +
      ' and COD_EMPRESA = ' + vDadosIni.CodEmpresa +
      ' and ATIVO = 1 ');
    vdtBanco := vDadosIni.getDataBanco(buscas);
    if vDadosPlano.numero_prestacoes > 0 then
    begin
      for itx := 1 to vDadosPlano.numero_prestacoes do
      begin
        dataSet.append;
        dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
        dataSet.FieldByName('SEQPLANO').AsInteger := Gencodigo('PLANO_PAG', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
        dataSet.FieldByName('NREQUISICAO').AsInteger := vDadosPlano.numero_venda;
        dataSet.FieldByName('TIPDOC').AsString := vCont.dataSet.FieldByName('DOCS').AsString;
        dataSet.FieldByName('COD_CONTROLE').AsInteger := vCont.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
        dataSet.FieldByName('COD_CLIENTE').AsInteger := vDadosPlano.codigo_Cliente;
        dataSet.FieldByName('DATA_MOV').AsDateTime := vdtBanco;
        dataSet.FieldByName('VALORDOC').AsCurrency := vDadosPlano.valor_parcela;
        dataSet.FieldByName('TPDOCS').AsString := vDadosPlano.tipo_venda;
        dataSet.FieldByName('DATA_VENC').AsDateTime := StrToDate(fdata[itx - 1]);
        dataSet.FieldByName('OPERADOR').AsInteger := vDadosPlano.codigo_vendedor;
        dataSet.FieldByName('TIP_CNT').AsString := 'P';
        dataSet.FieldByName('TEXTO_PLANO').AsString := vDadosPlano.textoEdit;
        dataSet.post;
      end;
    end;
    vValorRestante := vDadosPlano.valor_entrada;
    while vValorRestante > 0 do
    begin
      if vDadosPlano.valor_entrada > 0 then
      begin
        //vCont.First;
        dataSet.append;
        dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
        dataSet.FieldByName('SEQPLANO').AsInteger := Gencodigo('PLANO_PAG', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
        dataSet.FieldByName('NREQUISICAO').AsInteger := vDadosPlano.numero_venda;
        dataSet.FieldByName('TIPDOC').AsString := 'N';
        vrTemp := abreFormEntrada(vValorRestante);
        if vrTemp > 0 then
          //if Trim(vCont.dataSet.FieldByName('DOCS').AsString) = 'N' then
        begin
          dataSet.FieldByName('COD_CONTROLE').AsInteger :=
            vCont.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
          dataSet.FieldByName('VALORDOC').AsCurrency := vrTemp;
          vValorRestante := vValorRestante - vrTemp;
        end
        else
        begin
          dataSet.FieldByName('COD_CONTROLE').AsInteger := 1;
          dataSet.FieldByName('VALORDOC').AsCurrency := vValorRestante;
          vValorRestante := 0;
        end;
        dataSet.FieldByName('COD_CLIENTE').AsInteger := vDadosPlano.codigo_Cliente;
        dataSet.FieldByName('DATA_MOV').AsDateTime := vdtBanco;
        dataSet.FieldByName('TPDOCS').AsString := vDadosPlano.tipo_venda;
        dataSet.FieldByName('DATA_VENC').AsDateTime := vdtBanco;
        dataSet.FieldByName('OPERADOR').AsInteger := vDadosPlano.codigo_vendedor;
        dataSet.FieldByName('TIP_CNT').AsString := 'P';
        dataSet.FieldByName('TEXTO_PLANO').AsString := vDadosPlano.textoEdit;
        dataSet.post;
      end;
    end;
    //vCont.selecionaControles;
    Result := Apply;
    CommitaTransacao;

    Application.MessageBox('Plano cadastrado com sucesso', 'Informação', MB_ICONINFORMATION +
      MB_OK);
  end
  else
  	result := false;
end;

function TPlanoPagamento_2.verificaLimiteDeCredito: boolean;
var
  limiteDeCredito, valorCredito, valorCheque: Currency;
begin
  Result := false;
  buscas.Close;
  buscas.SQL.Text := 'select limite_credito from clientes where cod_cliente = ' +
    IntToStr(vDadosPlano.codigo_cliente) + ' and cod_empresa = ' + vDadosIni.CodEmpresa;
  buscas.Open;
  limiteDeCredito := buscas.fieldbyname('limite_credito').AsFloat;
  buscas.close;
  try
    if (limiteDeCredito > 0) then
    begin
      buscas.close;
      buscas.SQL.Text := 'select sum(coalesce(VALOR_C, 0)) soma from controle_creditos ' +
        ' where cod_cliente = :vcod ' +
        ' and (status_c is null or status_c = '''')' +
        ' and codigo_emp = :cod_empresa';
      buscas.Params[0].AsInteger := vDadosPlano.codigo_cliente;
      buscas.Params[1].AsString := vDadosIni.CodEmpresa;
      buscas.open;
      valorCredito := buscas.FieldByName('soma').AsFloat;

      buscas.close;
      buscas.SQL.Text := 'Select sum(coalesce(VALOR_CH, 0)) soma from ' +
        ' controle_cheque where cod_cliente = :vcod' +
        ' and (status_ch is null or status_ch = '''') ' +
        ' and codigo_emp = :cod_empresa';
      buscas.Params[0].AsInteger := vDadosPlano.codigo_cliente;
      buscas.Params[1].AsString := vDadosIni.CodEmpresa;
      buscas.open;
      valorCheque := buscas.FieldByName('soma').AsFloat;
      buscas.close;

      if ((valorCredito + valorCheque) + vDadosPlano.valor_aplicado - vDadosPlano.valor_entrada) > limiteDeCredito then
      begin
        MessageDlg('Cliente com Limite Estourado' + chr(13) +
          'Valor do Limite: ' + format('%n', [limiteDeCredito]) + chr(13) +
          'Valor do debito: ' + format('%n', [valorCredito + valorCheque]) + chr(13) +
          'Valor da Parcelado: ' + format('%n', [vDadosPlano.valor_aplicado - vDadosPlano.valor_entrada]), mtError, [mbOk], 0);

        if not vDadosIni.PesqPros('HW344', 'VALIDAR', IntToStr(vDadosPlano.numero_venda), 'PLANO_PAG', '', buscas, True) then
          exit;
        Application.ProcessMessages;
        if Application.MessageBox('Deseja continuar a venda?', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDNO then
          Exit;
        Result := True;
      end
      else
        Result := true;
    end
    else
      Result := true;
  finally
    buscas.close;
  end;
end;

{ TFuncionarios }

constructor TFuncionarios.create;
begin
  dataSet := TClientDataSet(dtmFP.cdsColaborador);
  transacao := TIBTransaction(dtmFP.transacao);
  buscas := TIBQuery(dtmFP.qrBuscas);
end;

function TFuncionarios._abreTodosFuncionarios: boolean;
begin
  Result := montaSelect('select cod_vendedor, nome_vendedor from colaborador ' +
    ' where cod_vendedor > 0 and ativo = 1 and cod_empresa =' + vDadosIni.codEmpresa);
end;

function TFuncionarios._verificarFuncionarios(pcod_vendedor: Integer): boolean;
begin
  Result := false;

  buscas.Close;
  buscas.SQL.Text := ' select cod_vendedor, nome_vendedor from colaborador '
    + ' where ativo = 1 and cod_vendedor =' + IntToStr(pcod_vendedor) + ' and cod_empresa=' + vDadosIni.codEmpresa;
  buscas.Open;

  if not buscas.IsEmpty then
    Result := true;
end;

{ TContasBancariasForPag }

constructor TContasBancariasForPag.create;
begin
  DataSet := TClientDataSet(dtmFP.cdsContasBanc);
  transacao := TIBTransaction(dtmFP.transacao);
  Buscas := TIBQuery(dtmFP.qrBuscas);
end;

function TContasBancariasForPag._selecionaContasBancarias(
  pCodigoCliente: Integer): Boolean;
begin
  Result := montaSelect('select cb.*, c.nome_cliente from contasbancarias cb' +
    ' inner join clientes c on c.cod_cliente = cb.cod_cliente and c.cod_empresa = cb.cod_empresa' +
    ' where cb.cod_cliente = ' + IntToStr(pCodigoCliente) + ' and cb.cod_empresa = ' +
    vDadosIni.codEmpresa);
end;

{ TTerminalAdmCartao_FP }

constructor TTerminalAdmCartao_FP.create;
begin
  dataSet := TClientDataSet(dtmFP.cdsTermCartao);
  buscas := TIBQuery(dtmFP.qrBuscas);
  transacao := TIBTransaction(dtmFP.transacao);
end;

function TTerminalAdmCartao_FP._abreTerminais: boolean;
begin
  Result := montaSelect('select tc.*, ac.taxa_por_controle_bandeira from terminal_cartao tc' +
    ' inner join adm_cartao ac on ac.cod_adm = tc.cod_adm and ac.cod_empresa = tc.cod_empresa and ac.ativo = 1' +
    ' where tc.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and tc.ativo = 1');
end;

{ TECommerce }

constructor TECommerce.create;
begin
  DataSet := TClientDataSet(dtmFP.cdsEcommerce);
  transacao := TIBTransaction(dtmFP.transacao);
  buscas := TIBQuery(dtmFP.qrBuscas);
  IndexFieldNames := 'SEQFORM';

  vSQL :=
  	' select 0 seqform, fe.cod_empresa, pd.local_venda, fe.intermediador, ' +
    ' fe.cliente, fe.cod_cliente, fe.metodo_pag_id, fe.data_cad,' +
    ' sum(coalesce(fe.valordoc, 0)) valordoc, ' +
    ' coalesce(max(fe.qtde_parc), count(*)) qtde ' +
    ' from formpagamento_ec fe ' +
    ' inner join pedvenda pd on pd.nped = fe.nrequisicao and pd.tipo = fe.tpdocs and pd.cod_empresa = fe.cod_empresa ' +
  	' where fe.nrequisicao = :nrequisicao ' +
    ' and fe.tpdocs = :tpdocs ' +
    ' and fe.cod_empresa = :cod_empresa ' +
    ' group by 1, 2, 3, 4, 5, 6, 7, 8' +
    ' order by fe.metodo_pag_id ';
end;

procedure TECommerce.marcaEcommerce;
begin
  if not IsEmpty then
  begin
    if dataSet.FieldByName('utilizado').AsString = 'S' then
    begin
      Application.MessageBox(pchar('Intermediador de Pagamento do E-Commerce já utilizado neste recebimento: ' + #13 + #13 +
      	'Interm: '+ dataSet.FieldByName('INTERMEDIADOR').AsString),
        'Atenção', MB_OK + MB_ICONWARNING);
      exit;
    end;
    
    dataSet.Edit;
    if dataSet.FieldByName('sel').AsString = 'S' then
      dataSet.FieldByName('sel').AsString := ''
    else
      dataSet.FieldByName('sel').AsString := 'S';
    dataSet.post;
  end;
end;

function TECommerce.retornaTipoDocCtrl(localVnd, intermPag: string): string;
begin
  Result := '';
  
	buscas.Close;
  buscas.SQL.Text := ' select inter.codigo_ctrl, ctrl.nome_ctrl, ctrl.docs from intermediador_controle_ec inter ' +
    ' inner join controles ctrl on ctrl.codigo_ctrl = inter.codigo_ctrl ' +
    '		and ctrl.codigo_emp = inter.cod_empresa ' +
    ' where inter.local_venda = ' + QuotedStr(trim(localVnd)) +
    ' and inter.intermediador = ' + QuotedStr(trim(intermPag)) +
    ' and inter.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  if not buscas.IsEmpty then
  	Result := trim(buscas.FieldByName('docs').AsString);
end;

function TECommerce.selecionaFormasEcommerce(
	pNped: Integer;
  pTipo: string): boolean;
begin
	dataSet.Close;
  dataSet.CommandText := vSQL;
  dataSet.Params.ParamByName('nrequisicao').AsInteger := pNped;
  dataSet.Params.ParamByName('tpdocs').AsString := pTipo;
  dataSet.Params.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  dataSet.Open;

  result := not dataSet.IsEmpty;
end;

function TECommerce.somatorioEcommerce(
	pNped: Integer;
  pTipo: string;
	localVnd: string;
  intermPag: string): Currency;
var
  valorTemp: Currency;
begin
	valorTemp := 0;

  buscas.Close;
  buscas.SQL.Text := vSQL;
  buscas.ParamByName('nrequisicao').AsInteger := pNped;
  buscas.ParamByName('tpdocs').AsString := pTipo;
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  buscas.First;
  while not buscas.eof do
  begin
//    if buscas.FieldByName('selec').AsString = 'S' then
    if (trim(localVnd) = trim(buscas.FieldByName('local_venda').AsString))
      and (trim(intermPag) = trim(buscas.FieldByName('intermediador').AsString)) then
    begin
      valorTemp := valorTemp + RoundTo(buscas.FieldByName('valordoc').AsFloat, -2);
    end;
    buscas.Next;
  end;

  Result := valorTemp;

end;

function TECommerce.somatorioEcommerce (
	pNped: Integer;
  pTipo: string): Currency;
var
  valorTemp: Currency;
begin
	valorTemp := 0;

  buscas.Close;
  buscas.SQL.Text := vSQL;
  buscas.ParamByName('nrequisicao').AsInteger := pNped;
  buscas.ParamByName('tpdocs').AsString := pTipo;
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  buscas.First;
  while not buscas.eof do
  begin
//    if buscas.FieldByName('selec').AsString = 'S' then
      valorTemp := valorTemp + RoundTo(buscas.FieldByName('valordoc').AsFloat, -2);
    buscas.Next;
  end;

  Result := valorTemp;
end;

{ TIntermPag }

constructor TIntermPag.create;
begin
  if dtmFP = nil then
    dtmFP := TdtmFP.Create(dtmFP);
  DataSet := TClientDataSet(dtmFP.cdsIntermediadorPag);
  transacao := TIBTransaction(dtmFP.transacao);
  buscas := TIBQuery(dtmFP.qrBuscas);

  vVincIntermPag := TVincIntermPag.create;
end;

destructor TIntermPag.destroy;
begin
  if Assigned(vVincIntermPag) then FreeAndNil(vVincIntermPag);
  inherited;
end;

function TIntermPag._abreIntermPag: Boolean;
begin
  Result := montaSelect(' select inter.*, ctr.nome_ctrl, cond.desc_cond_pag from intermediador_controle_ec inter ' +
  	' left join controles ctr on ctr.codigo_ctrl = inter.codigo_ctrl ' +
    '    and ctr.codigo_emp = inter.cod_empresa ' +
    ' left join cond_pag cond on cond.cod_cond_pag = inter.cod_cond_pag ' +
    ' where inter.cod_empresa = ' + vDadosIni.codEmpresa);
end;

procedure TIntermPag._cadIntermPag(pTipoForm: Integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo Intermediadores de Pagamento');
    if dtmFP = nil then
      dtmFP := TdtmFP.Create(dtmFP);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('FPG045', 'ABRIR', '', 'INTERMEDIADOR_CONTROLE_EC', '',
      dtmFP.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadIntermediadoresPag = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadIntermediadoresPag, frmCadIntermediadoresPag);
    end;

    if (pTipoForm > 0) and (not frmCadIntermediadoresPag.Visible) then
      frmCadIntermediadoresPag.ShowModal
    else if (not frmCadIntermediadoresPag.Visible) then
      frmCadIntermediadoresPag.Show
    else if frmCadIntermediadoresPag.FormStyle = fsMDIChild then
      frmCadIntermediadoresPag.Show
    else
      frmCadIntermediadoresPag.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TIntermPag._defineSqlAdicional: boolean;
var
  I, erro: Integer;
  //  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
begin
  result := true;
  rConsultas.vSqlAdicional := '';

  tempSql := '';
  if rConsultas.vCampo = 'Controle' then
    tempSql := 'CONTROLES.NOME_CTRL '
  else if rConsultas.vCampo = 'Cond Pag' then
    tempSql := 'COND_PAG.DESC_COND_PAG ';

  if tempSql  <> '' then
  begin
    if rConsultas.vCondicao = 'Igual' then
      tempTipo := '= '
    else if rConsultas.vCondicao = 'Maior' then
      tempTipo := '> '
    else if rConsultas.vCondicao = 'Maior ou Igual' then
      tempTipo := '>= '
    else if rConsultas.vCondicao = 'Menor' then
      tempTipo := '< '
    else if rConsultas.vCondicao = 'Menor ou Igual' then
      tempTipo := '<= '
    else if rConsultas.vCondicao = 'Diferente' then
      tempTipo := '<> '
    else if (rConsultas.vCondicao = 'Esta contido') then
      tempTipo := 'like'
    else if (rConsultas.vCondicao = 'Começa') then
      tempTipo := 'Começa'
    else
      tempTipo := '= ';

    if tempTipo = 'like' then
      tempSql := tempSql + tempTipo + QuotedStr('%' + rConsultas.vValor + '%')
    else if tempTipo = 'Começa' then
      tempSql := tempSql + 'like' + QuotedStr(rConsultas.vValor + '%')
    else
      tempSql := tempSql + tempTipo + QuotedStr(rConsultas.vValor);
    rConsultas.vValor := '';
    if Trim(rConsultas.vSqlAdicional) <> '' then
      rConsultas.vSqlAdicional := rConsultas.vSqlAdicional + ' and ' + tempSql
    else
      rConsultas.vSqlAdicional := tempSql;
  end;

  if rConsultas.vAdicional then
  begin
    if rConsultas.vPorDataAd then
    begin
      try
        erro := 0;
        StrToDate(rConsultas.vDataIniAd);
      except
        rConsultas.vDataIniAd := '';
        erro := erro + 1;
      end;
      try
        StrToDate(rConsultas.vDataFimAd);
      except
        rConsultas.vDataFimAd := '';
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
        if rConsultas.vDataIniAd <> '' then
          rConsultas.vDataIniAd := QuotedStr(FormatDateTime(formatodata, strtodate(rConsultas.vDataIniAd)));
        if rConsultas.vDataFimAd <> '' then
          rConsultas.vDataFimAd := QuotedStr(FormatDateTime(formatodata, strtodate(rConsultas.vDataFimAd)));
      end;
    end
    else if rConsultas.vValorAd = '' then
      exit;
    if rConsultas.vCondicaoAd = 'Igual' then
      rConsultas.vCondicaoAd := '='
    else if rConsultas.vCondicaoAd = 'Maior' then
      rConsultas.vCondicaoAd := '>'
    else if rConsultas.vCondicaoAd = 'Maior ou Igual' then
      rConsultas.vCondicaoAd := '>='
    else if rConsultas.vCondicaoAd = 'Menor' then
      rConsultas.vCondicaoAd := '<'
    else if rConsultas.vCondicaoAd = 'Menor ou Igual' then
      rConsultas.vCondicaoAd := '<='
    else if rConsultas.vCondicaoAd = 'Diferente' then
      rConsultas.vCondicaoAd := '<>'
    else if (rConsultas.vCondicaoAd = 'Esta contido') then
      rConsultas.vCondicaoAd := 'like'
    else if (rConsultas.vCondicaoAd = 'Começa') then
      rConsultas.vCondicaoAd := 'Começa'
    else
      rConsultas.vCondicaoAd := '=';
    for I := 0 to dataSet.FieldCount - 1 do
    begin
      if Dataset.Fields[I].FieldKind = fkData then
      begin
        if UpperCase(dataset.Fields[I].DisplayName) = UpperCase(rConsultas.vCampoAd) then
        begin
          if rConsultas.vCampo = rConsultas.vCampoAd then
          begin
            rConsultas.vsqlAdicional := '';
            exit;
          end;
          rConsultas.vCampoAd := DataSet.Fields[I].FieldName;
          if ((Dataset.Fields[I] is TIntegerField) or (Dataset.Fields[I] is TFloatField) or
            (Dataset.Fields[I] is TCurrencyField) or (DataSet.Fields[I] is TSmallintField)) and
            ((rConsultas.vCondicaoAd = 'Começa') or (rConsultas.vCondicaoAd = 'Começa')) then
          begin
            if ((Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField)) then
            try
              strtoint(rConsultas.vValorAd);
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
              strtofloat(rConsultas.vValorAd);
            except
              Application.MessageBox(PChar('Valor para consulta adicional inválido.' + chr(13) +
                'Verifique os dados de sua pesquisa e tente novamente.' + chr(13) +
                'Não digite pontos e utilize como separador de decimais a vígula.'), 'Atenção',
                MB_ICONEXCLAMATION + MB_OK);
              result := false;
              exit;
            end;
            rConsultas.vCondicaoAd := '=';
            rConsultas.vValorAd := vDadosIni.trocaVirgulaPorPonto(rConsultas.vValorAd);
          end
          else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
          begin
            if Trim(rConsultas.vSqlAdicional) <> '' then
		      	rConsultas.vSqlAdicional := rConsultas.vSqlAdicional + ' and ';

            if (rConsultas.vDataIniAd <> '') and (rConsultas.vDataFimAd <> '') then
              rConsultas.vSqlAdicional := rConsultas.vsqlAdicional + rConsultas.vCampoAd +
                ' >= ' + rConsultas.vDataIniAd + ' and ' + rConsultas.vCampoAd + ' <= ' + rConsultas.vDataFimAd
            else if (rConsultas.vDataFimAd <> '') then
              rConsultas.vsqlAdicional := rConsultas.vsqlAdicional + rConsultas.vCampoAd +
                ' <= ' + rConsultas.vDataIniAd
            else if (rConsultas.vDataIniAd <> '') and (rConsultas.vDataFimAd <> '') then
              rConsultas.vsqlAdicional := rConsultas.vsqlAdicional + rConsultas.vCampoAd +
                ' >= ' + rConsultas.vDataIniAd;
            Break;
          end;
          if Trim(rConsultas.vSqlAdicional) <> '' then
		      rConsultas.vSqlAdicional := rConsultas.vSqlAdicional + ' and ';

          if rConsultas.vCondicaoAd = 'like' then
          begin
          	if rConsultas.vCampoAd = 'NOME_CTRL' then
	           rConsultas.vsqlAdicional := rConsultas.vsqlAdicional + 'CONTROLES.' + rConsultas.vCampoAd + ' like ' + QuotedStr('%' + rConsultas.vValorAd + '%')
            else if rConsultas.vCampoAd = 'DESC_COND_PAG' then
              rConsultas.vsqlAdicional := rConsultas.vsqlAdicional + 'COND_PAG.' + rConsultas.vCampoAd + ' like ' + QuotedStr('%' + rConsultas.vValorAd + '%')
            else
              rConsultas.vsqlAdicional := rConsultas.vsqlAdicional + 'INTERMEDIADOR_CONTROLE_EC.' + rConsultas.vCampoAd + ' like ' + QuotedStr('%' + rConsultas.vValorAd + '%')
          end
          else if rConsultas.vCondicaoAd = 'Começa' then
          begin
            if rConsultas.vCampoAd = 'NOME_CTRL' then
            	rConsultas.vsqlAdicional := rConsultas.vsqlAdicional + 'CONTROLES.' + rConsultas.vCampoAd + ' like ' + QuotedStr(rConsultas.vValorAd + '%')
            else if rConsultas.vCampoAd = 'DESC_COND_PAG' then
            	rConsultas.vsqlAdicional := rConsultas.vsqlAdicional + 'COND_PAG.' + rConsultas.vCampoAd + ' like ' + QuotedStr(rConsultas.vValorAd + '%')
            else
	            rConsultas.vsqlAdicional := rConsultas.vsqlAdicional + 'INTERMEDIADOR_CONTROLE_EC.' + rConsultas.vCampoAd + ' like ' + QuotedStr(rConsultas.vValorAd + '%')
          end
          else //if rConsultas.vCondicaoAd <> 'Começa' then
          begin
            if rConsultas.vCampoAd = 'NOME_CTRL' then
              rConsultas.vsqlAdicional := rConsultas.vsqlAdicional + 'CONTROLES.' + rConsultas.vCampoAd + ' ' + rConsultas.vCondicaoAd + ' ' + QuotedStr(rConsultas.vValorAd)
            else if rConsultas.vCampoAd = 'DESC_COND_PAG' then
              rConsultas.vsqlAdicional := rConsultas.vsqlAdicional + 'COND_PAG.' + rConsultas.vCampoAd + ' ' + rConsultas.vCondicaoAd + ' ' + QuotedStr(rConsultas.vValorAd)
            else
              rConsultas.vsqlAdicional := rConsultas.vsqlAdicional + 'INTERMEDIADOR_CONTROLE_EC.' + rConsultas.vCampoAd + ' ' + rConsultas.vCondicaoAd + ' ' + QuotedStr(rConsultas.vValorAd);
          end;
          Break;
        end;
      end;
    end;
  end;
end;

{ TVincIntermPag }

constructor TVincIntermPag.create;
begin
 if dtmFP = nil then
    dtmFP := TdtmFP.Create(dtmFP);
  DataSet := TClientDataSet(dtmFP.cdsVincIntermediadorPag);
  transacao := TIBTransaction(dtmFP.transacao);
  buscas := TIBQuery(dtmFP.qrBuscas);

  vControleIntermPag := TControleIntermPag.create;
  vCondPagIntermPag := TCondPagIntermPag.create;
end;

destructor TVincIntermPag.destroy;
begin
  if Assigned(vControleIntermPag) then FreeAndNil(vControleIntermPag);
  if Assigned(vCondPagIntermPag) then FreeAndNil(vCondPagIntermPag);
  inherited;
end;

function TVincIntermPag.retornaCondPagIntermediador(pLocalVnd: string; pInter: string): Integer;
var
  vtemp: string;
begin
  vtemp := retornaValor('select coalesce(cod_cond_pag, 0) as valor from intermediador_controle_ec ' +
  	 ' where local_venda = ' + QuotedStr(pLocalVnd) +
     ' and intermediador = ' + QuotedStr(pInter) +
     ' and cod_empresa = ' + vDadosIni.codEmpresa);
  Result := StrToInt(vDadosIni.IfThen(trim(vtemp) = '', 0, vtemp));
end;

function TVincIntermPag.retornaControleIntermediador(pLocalVnd: string; pInter: string): Integer;
var
  vtemp: string;
begin
  vtemp := retornaValor('select coalesce(codigo_ctrl, 0) as valor from intermediador_controle_ec ' +
     ' where local_venda = ' + QuotedStr(pLocalVnd) +
     ' and intermediador = ' + QuotedStr(pInter) +
     ' and cod_empresa = ' + vDadosIni.codEmpresa);
  Result := StrToInt(vDadosIni.IfThen(trim(vtemp) = '', 0, vtemp));
end;

function TVincIntermPag.vincularIntermediadorControle(idMetodoPag: Integer; localvendaEC, intermediadorEC, idcadinttran: string; codControleEC: Integer; codCondPagEC: Integer): boolean;
var
  buscas2: TIBQuery;
begin
  try
    Result := false;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    buscas2.Close;
    buscas2.SQL.Text := 'SELECT FIRST 1 SEQID FROM INTERMEDIADOR_CONTROLE_EC ' +
       ' WHERE LOCAL_VENDA = :LOCAL_VENDA ' + 
       ' AND INTERMEDIADOR = :INTERMEDIADOR ' +
       ' AND COD_EMPRESA = :COD_EMPRESA ';
    buscas2.ParamByName('LOCAL_VENDA').AsString := localvendaEC;
    buscas2.ParamByName('INTERMEDIADOR').AsString := intermediadorEC;
    buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas2.Open;

    if not vDadosIni.PesqPros(IfThen(buscas2.IsEmpty, 'FPG043', 'FPG044'), 'VINCULAR',
    	'LOCAL VND: ' + localvendaEC +
    	' INTERM: ' + intermediadorEC,
      'INTERMEDIADOR_CONTROLE_EC', '', buscas, true) then
      Exit;

//     if not buscas2.IsEmpty then
//     begin
//       Application.MessageBox(pchar('Intermediador já vinculado a um controle'),
//        'Informação', MB_OK + MB_ICONERROR);
//       exit;
//     end;

     if buscas2.IsEmpty then
     begin
       buscas.Close;
       buscas.SQL.Text := ' INSERT INTO INTERMEDIADOR_CONTROLE_EC ' +
          ' (SEQID, COD_EMPRESA, LOCAL_VENDA, INTERMEDIADOR, CODIGO_CTRL, METODO_PAG_ID, COD_COND_PAG, IDCADINTTRAN) ' +
          ' VALUES (:SEQID, :COD_EMPRESA, :LOCAL_VENDA, :INTERMEDIADOR, :CODIGO_CTRL, :METODO_PAG_ID, :COD_COND_PAG, :IDCADINTTRAN); ';
       buscas.ParamByName('SEQID').AsInteger := Gencodigo('INTERMEDIADOR_CONTROLE_EC', dtmFP.SpIncCodigo, vDadosIni.codEmpresa);
       buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas.ParamByName('LOCAL_VENDA').AsString := localvendaEC;
       buscas.ParamByName('INTERMEDIADOR').AsString := intermediadorEC;
       buscas.ParamByName('CODIGO_CTRL').AsInteger := codControleEC;
       buscas.ParamByName('COD_COND_PAG').AsInteger := codCondPagEC;
       buscas.ParamByName('METODO_PAG_ID').AsInteger := idMetodoPag;
       buscas.ParamByName('IDCADINTTRAN').AsString := idcadinttran;
       buscas.ExecSQL;
     end
     else
     begin
       buscas.Close;
       buscas.SQL.Text := ' UPDATE INTERMEDIADOR_CONTROLE_EC SET ' +
          ' CODIGO_CTRL = :CODIGO_CTRL, COD_COND_PAG = :COD_COND_PAG, IDCADINTTRAN = :IDCADINTTRAN ' +
          ' WHERE LOCAL_VENDA = :LOCAL_VENDA AND INTERMEDIADOR = :INTERMEDIADOR AND COD_EMPRESA = :COD_EMPRESA ';
       buscas.ParamByName('LOCAL_VENDA').AsString := localvendaEC;
       buscas.ParamByName('INTERMEDIADOR').AsString := intermediadorEC;
       buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas.ParamByName('CODIGO_CTRL').AsInteger := codControleEC;
       buscas.ParamByName('COD_COND_PAG').AsInteger := codCondPagEC;
       buscas.ParamByName('IDCADINTTRAN').AsString := idcadinttran;
       buscas.ExecSQL;
     end;

     if buscas.Transaction.InTransaction then
       buscas.Transaction.Commit;

     vDadosIni.GravaAuditoria(IfThen(buscas2.IsEmpty, 'FPG043', 'FPG044'), 'VINCULAR',
     'SUCESSO - ' + localvendaEC + ' ' + intermediadorEC + ' CODCONTROLE: ' + IntToStr(codControleEC),
     'INTERMEDIADOR_CONTROLE_EC', '', buscas);

     Result := True;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TVincIntermPag._abreVincIntermPag: Boolean;
begin
 Result := montaSelect(' select inter.*, ctr.nome_ctrl from intermediador_controle_ec inter ' +
  	' left join controles ctr on ctr.codigo_ctrl = inter.codigo_ctrl ' +
    '    and ctr.codigo_emp = inter.cod_empresa ' +
    ' where inter.cod_empresa = ' + vDadosIni.codEmpresa);
end;

procedure TVincIntermPag._cadVincIntermPag(pTipoForm: Integer; idcadinttran: string);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Vincular Intermediadores de Pagamento');
    if dtmFP = nil then
      dtmFP := TdtmFP.Create(dtmFP);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('FPG045', 'ABRIR', '', 'INTERMEDIADOR_CONTROLE_EC', '',
      dtmFP.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmVincIntermPag = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmVincIntermPag, frmVincIntermPag);
    end;
    frmVincIntermPag.idcadinttran := idcadinttran;

    if (pTipoForm > 0) and (not frmVincIntermPag.Visible) then
      frmVincIntermPag.ShowModal
    else if (not frmVincIntermPag.Visible) then
      frmVincIntermPag.Show
    else if frmVincIntermPag.FormStyle = fsMDIChild then
      frmVincIntermPag.Show
    else
      frmVincIntermPag.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TControleIntermPag }

constructor TControleIntermPag.create;
begin
  if dtmFP = nil then
    dtmFP := TdtmFP.Create(dtmFP);
  DataSet := TClientDataSet(dtmFP.cdsCtrlIntermediadorPag);
  transacao := TIBTransaction(dtmFP.transacao);
  buscas := TIBQuery(dtmFP.qrBuscas);
end;

function TControleIntermPag._abreVincIntermPag: Boolean;
begin
 result := montaSelect('SELECT * FROM CONTROLES ' +
 	  ' WHERE CXENT = ''S'' ' +
    ' AND ATIVO = 1 ' +
    ' AND CODIGO_EMP = ' +  vDadosIni.codEmpresa +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, ' AND (COALESCE(CONTROLE_VISIVEL, ''S'') = ''S'') ', '') +
    ' AND COALESCE(NAO_GERA_FINAN, '''') <> ''S''' +
    ' AND COALESCE(BAIXA_AUTOMATICA, '''') <> ''S''' +
    ' ORDER BY QSEQPERF');
  Result := (not DataSet.IsEmpty);
end;

{ TCondPagIntermPag }

constructor TCondPagIntermPag.create;
begin
 if dtmFP = nil then
    dtmFP := TdtmFP.Create(dtmFP);
  DataSet := TClientDataSet(dtmFP.cdsCondPagIntermediadorPag);
  transacao := TIBTransaction(dtmFP.transacao);
  buscas := TIBQuery(dtmFP.qrBuscas);
end;

function TCondPagIntermPag._abreVincIntermPag: Boolean;
begin
  result := montaSelect(' SELECT COND_PAG.* FROM COND_PAG ' +
  	' INNER JOIN COND_PAG_EMPRESA ON ' +
    '   COND_PAG_EMPRESA.COD_COND_PAG = COND_PAG.COD_COND_PAG ' +
    '   AND COND_PAG_EMPRESA.COD_EMPRESA = ' + vDadosIni.codEmpresa +
  	' WHERE COND_PAG.ATIVO = 1 ');
end;

{ TValeCupomPrgFid }

constructor TValeCupomPrgFid.create;
begin
  if dtmFP = nil then
    dtmFP := TdtmFP.Create(dtmFP);
  DataSet := TClientDataSet(dtmFP.cdsValeCupom);
  transacao := TIBTransaction(dtmFP.transacao);
  buscas := TIBQuery(dtmFP.qrBuscas);
end;

function TValeCupomPrgFid._abreValeCupomPrgFid(pCodCliente: Integer; pUtilizados: boolean = false): Boolean;
var
  vcpf: string;
begin
   vcpf := retornaValor('select cpfcgc valor from clientes ' +
  	' where cod_cliente = ' + IntToStr(pCodCliente) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa);

   Result := montaSelect(' select vl.* from vale_cupons vl ' +
    ' left join empresa_prog_fid empg on empg.cod_empresa = vl.cod_empresa ' +
		' where vl.cpf = ' + QuotedStr(vcpf) +
    ' and vl.cod_empresa in (case when (empg.cod_empresa > 0) then empg.cod_empresa else ' + vDadosIni.codEmpresa + ' end) ' +
//    ' and cc.vale = ''S'' ' +
    IfThen(pUtilizados, ' and vl.ndoc > 0  ',  ' and coalesce(vl.ndoc, 0) = 0 ') +
    ' order by vl.datahora ');
   TFloatField(dataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';   
end;

function TValeCupomPrgFid._abreValeCupomPrgFid(pNdoc: Integer; pTipoDoc: string;
  pUtilizados: boolean): Boolean;
begin
	Result := montaSelect(' select vl.* from vale_cupons vl ' +
    ' where vl.num_doc = ' + IntToStr(pNdoc) +
    ' and vl.tipo_doc = ' + QuotedStr(pTipoDoc) +
    ' and vl.cod_emp_doc = ' + vDadosIni.codEmpresa +
//    ' and cc.vale = ''S'' ' +
    IfThen(pUtilizados, ' and vl.ndoc > 0  ',  ' and coalesce(vl.ndoc, 0) = 0 ') +
    ' order by vl.datahora ');
   TFloatField(dataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00';   
end;

procedure TValeCupomPrgFid._desmarcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');
    
    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := '';
      dataSet.Post;
      dataSet.Next;
    end;
    dataSet.First;

  finally
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TValeCupomPrgFid._marcaDesmarcaLinha;
var
 vsel: boolean;
begin
  if dataSet.IsEmpty then
    exit;

  vsel := true;
  if (dataSet.FieldByName('SEL').AsString = '') then
  begin
    if vDadosIni.vProgFid.vHabilitarValidacaoValeAPI then
    begin
	    if (dataSet.FieldByName('ndoc').AsInteger > 0)
    		or (dataSet.FieldByName('validado').IsNull) then //or (dataSet.FieldByName('erp_api').AsString = 'E')
       vsel := false;
    end
    else if (dataSet.FieldByName('ndoc').AsInteger > 0) then
    	vsel := false;

    if not vsel then    
    begin
      dataSet.Edit;
      dataSet.FieldByName('SEL').AsString := 'S';
      if (dataSet.FieldByName('ndoc').AsInteger > 0) then
        Application.MessageBox(pchar('Vale selecionado já utilizado!'), 'Atenção', MB_ICONWARNING + MB_OK)
      else if (dataSet.FieldByName('validado').IsNull) then
        Application.MessageBox(pchar('Vale selecionado não foi validado!'), 'Atenção', MB_ICONWARNING + MB_OK);
//      else if (dataSet.FieldByName('erp_api').AsString = 'E') then
//        Application.MessageBox(pchar('Vale selecionado não é de origem da API!'), 'Atenção', MB_ICONWARNING + MB_OK);
      dataSet.FieldByName('SEL').AsString := '';
      dataSet.Post;
      exit;
    end;
  end;
  
  dataSet.Edit;
  if dataSet.FieldByName('SEL').AsString = 'S' then
    dataSet.FieldByName('SEL').AsString := ''
  else
    dataSet.FieldByName('SEL').AsString := 'S';
  dataSet.Post;
end;

procedure TValeCupomPrgFid._marcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      if (vDadosIni.vProgFid.vHabilitarValidacaoValeAPI)
       and (dataSet.FieldByName('ndoc').AsInteger <= 0) // nao foi utilizado
       and (not dataSet.FieldByName('validado').IsNull) then // tem que estar validado //and (dataSet.FieldByName('erp_api').AsString = 'A') then // recibos na API
      begin
        dataSet.Edit;
        dataSet.FieldByName('sel').AsString := 'S';
        dataSet.Post;
      end
      else if (not vDadosIni.vProgFid.vHabilitarValidacaoValeAPI)
      	and (dataSet.FieldByName('ndoc').AsInteger <= 0) then // nao foi utilizado
      begin
        dataSet.Edit;
        dataSet.FieldByName('sel').AsString := 'S';
        dataSet.Post;
      end;
      dataSet.Next;
    end;
    dataSet.First;

  finally
  	dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TBandeiraCartao_FP }

constructor TBandeiraCartao_FP.create;
begin
  dataSet := TClientDataSet(dtmFP.cdsBandeiraCartao);
  buscas := TIBQuery(dtmFP.qrBuscas);
  transacao := TIBTransaction(dtmFP.transacao);
end;

function TBandeiraCartao_FP._abreBandeiraCartao: boolean;
begin
  Result := montaSelect(' select bd.* from bandeiras_cartao bd ' +
  	' where bd.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and bd.ativo = 1 ');
end;

end.

