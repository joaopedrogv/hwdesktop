///  Funcionamento do Financeiro Unificado
///
///  Ver variaveis no vDadosIni: vCodigoUnificadora, vCodigoUnificadas, vFinanceiroUnificado
///
///  Quando as vendas forem formadas na tabela de forma de pagamento vai continuar com o codigo normal,
///  porém, quando gerar registros nas tabelas o sistema atribuir os valores conforme abaixo
///
///  No Creditos, cheques, lancamento e contas a pagar
///  *  O Campo codigo_emp vai receber o codigo da unificadora
///  *  O campo cod_emp_mult vai receber o codigo da unificada
///
///  Os processamentos dos ECF's deverao gerar apenas as formas de pagamento, a partir disto o financeiro processa as formas
///
///
///
///  Outras tarefas
///
///  * Criar campos de valor contabil e valor de servicos - (valor_contabil = (valor NF ou valor CP) + (valor nf servico) ) valor_nfserv = (valor da nf de servicos)
///    - Atribuir estes valores no final da emissao dos documentos, (NFPED, NFMOT, CUPOMPED), cuidado caso a forma de pagamento ja tenha sido processado, alterar no credito ou cheque correspondente
///    - Fazer o rateio destes valores entre os registros posteriores ( Prestações e Recebimentos )
///  * Criar campos de numero de NF (parece q ja tem), serie NF, numero de CUPOM e numero da NF_servicos


unit uClassesImportacaoFinanceiro;

interface

uses
  uDataSet_OOP, Controls, DBClient, StdCtrls, Classes, DB, ComObj, ComCtrls,
  IBQuery, IBDatabase,FileCtrl, Gauges, IBStoredProc;

type
  CNegativacaoAcao= (naNegativar, naDesnegativa);
  CNegativacaoAcaoContasStatus = (nacsAbertas, nacsQuitadas, nacsAmbos);
//  CNegativacaoTipoConta = (ntcCreditos, ntcCheques);

  RNegativacao = record
    acao: CNegativacaoAcao;
    alterarConta: Boolean;
    alterarContaStatus: CNegativacaoAcaoContasStatus;
    codConta, codCliente, loteQuit, codigoUnificada: Integer;
  end;

  TGenericoFechamentoPDV = class;
  TFechamentoPDV = class;
  TPdvs = class;
  TMeiosPag = class;
  TControles_FPDV = class;
  TRetorno = class;
  TCobrebemPesq = class;
  TControle_Busca = class;
  TEmpresasUnificadas = class;
  TConvenioOcorrenciaBancaria = class;
  TCBX = class;
  TLoteQuitImp = class;
  TFechCaixaImp = class;
  TBaixaCreditoImp = class;
  TLancamentosImp = class;
  TControleCreditosImp = class;
  TControleChequeImp = class;
  TPContasImp = class;
  TContaLigacaoImp = class;
  TBoletosImp = class;
  TQuitacaoCreditos = class;
  TRelQuitacaoCreditos = class;

  TImportacaoAutomacao = class;
  TFormPagImpAuto = class;
  TSomaFormPagImpAuto = class;
  TPrestacoesImpAuto = class;
  TFechDiaCxlImpAuto = class;
  TDetalhesRecebimentoCX = class;
  TContasBancariasImpPDV = class;
  TNegativacaoCliente = class;
  TUnificarEmpresa = class;

  TGenericoFechamentoPDV = class(TDataSet_OOP)
  var
    vNumeroPDV: integer;
    vOperador: integer;
    vNumeroSerieECF: string;
    vDataMovimento: TDate;
    vAgruparDinheiro: Boolean;
    vLisBox: TListBox;
    vLabelSomaMeiosPag: TLabel;

    vNumeroPDV_Rel: integer;
    vOperador_Rel: integer;
    vNumeroSerieECF_Rel: string;
    vDataMovimento_Rel: TDate;
  end;

  TControles_FPDV = class(TGenericoFechamentoPDV)
  private

  public
    constructor create;
    function _abrirTodosControles(pOrdem: string; pCodEmpresa: Integer = 0): boolean;
    function _abrirControles: boolean; overload;
    function _abrirControles(pCodControle: integer): boolean; overload;
    function _abrirControlePrazo: boolean;
    function _abreTodosControlesBarramentoAutomaticoCAR: Boolean;
    function getCamposSQL: string;
    function buscaControles(pCodControle: integer): boolean;
  end;

  TRetorno = class(TDataSet_OOP)
  private
    fHistPadraoUnificadas: string;
    function _Space(Tam: integer): string;
    procedure _MontaLinha(Pos: Integer; const Dado: string);
  public
  	_TitulosNaoEncontrados: TClientDataSet;
  	_TitulosNaoEncontradosDtSource: TDataSource;
    _CreditosVincular: TClientDataSet;
    _CreditosVincularDtSource: TDataSource;
    constructor create;
    function _AbrirRetorno(NumeroDocumento: string; CodCobrebem: Integer; CodEmpresa: Integer): boolean;
    function _AbrirTodosRetorno(NumeroDocumento: string; CodCobrebem: Integer; CodEmpresa: Integer): boolean;
    function Insert: boolean; override;
    destructor Destroy; override;
    procedure _BaixaBoletosContCreditos(NumeroDocumento: string;
      DataBaixa: Tdate; vl_pg, vl_cred, vl_juros, vl_desc, tx_cob: double; var TotalparaQuitar,
      TotalQuitados: integer);
    procedure _LogArqRetorno(nome, vdados: string);
    procedure _AbreFormRetorno;
    procedure _RegBaixaCredito(ValorBaixa, VLdoRecibo: currency; _BaixaTotalouParcial: string);
    procedure _FazLancamentosSaida(_TotalValorCredito: Currency; _CodControle: integer);
    // Faz lançamento da tarifa bancaria do arquivo de retorno
    procedure _FazLancamentoTarifaBancariaRetorno
      (_TotalValorDebito: Currency; _CodControle, _CodOcorrencia: integer; _DataOcorrencia: string);
    procedure _LogArqRetornoproc(nome, vdados, linha: string);
    procedure _FazLancamentosEntrada(_TotalValorPago: Currency; _CodControle: integer);
    procedure _LancaJuros(_ValorJuros: Currency);
    procedure _LancaDesconto(_ValorDesconto: Currency);
    procedure _CobrebemX_RecebeDados;
    procedure _QuitarContoroleCredito;
    function _UpperCaseAcentuados(const S: string): string;
    function _InserirOcorrenciaBancariaControleCredito(NumeroDocumento: string; Sequencia: string; MotivoOcorrencia: TStringList): boolean;
    function _InserirOcorrenciaBancariaBoletosCreditosCobrebem(PosicaoBoleto: integer; NumeroDocumento: string; CodCobrebem: Integer; CodEmpresa: Integer): boolean;
    function _InserirOcorrenciaBancariaBoletosCreditosConvenio(pDatasetCobrancaBancaria: TDataSet; NumeroDocumento: string;  CodCobrebem: Integer; CodEmpresa: Integer): boolean;
    function VincularTituloNaoEncontrado(
    	pNumDoc: string; pValorDoc: Double; pValorPago: Double;
      pDataBase: TDateTime; pDataVenc: TDateTime;
      pNossoNumero: string; pCodCobrebem: Integer; pCodEmpresa: Integer): boolean;

    function finalizarProcessamento(pCodigoUnificada: Integer;
    	pLancarTaxa: boolean; pLancarJuros: boolean; pLancarDesconto: boolean;
      pValorTaxa: Double; pTarifaLancada: boolean; var pCreditoEnc: boolean): Boolean;
    function SalvarDadosRetorno(arquivo: string): boolean;
    function RetornaProtocoloRet(pCodconvenio: Integer; pCodEmpresa: Integer; pDiretorioArquivo: string): string;
    procedure RetornaDadosArqRet;

    procedure _marcaDesmarcaLinhaTemp(pDataset: TDataSet);
    procedure _marcarTodosTemp(pDataset: TDataSet);
    procedure _desmarcarTodosTemp(pDataset: TDataSet);
    function verificarContasLigacao: boolean;
  var
    _StrAux: ANSIstring;
    _NomeArquivoRetorno, _DiretorioRetorno: string;
    _LoteCriado: Boolean; {Verifica se foi realizado o processamento
    para quitar os créditos selecionados}
    _Empresas: TEmpresasUnificadas;
    _Cobrebem: tcobrebemPesq;
    _Controle: TControle_Busca;
    _OcorrenciaBancaria: TConvenioOcorrenciaBancaria;
    _CBX: TCBX;
    _LoteQuit: TLoteQuitImp;
    _FechCaixa: TFechCaixaImp;
    _BaixaCredito: TBaixaCreditoImp;
    _Lancamentos: TLancamentosImp;
    _ContaLigacao: TContaLigacaoImp;
    _Boletos: TBoletosImp;
    CobreBemX: Variant;
    _TotalValorCredito: currency;
    _TotalValorPago: Currency;
    _TotalTarifasBancarias: Currency;
    _ValorJuros: Currency;
    _vQuitacaoCredito: tQuitacaoCreditos;
    _vRelQuitacaoCredito: TRelQuitacaoCreditos;
    vTeste: Integer;
    vstatusitem, vVerificaControle: string;
    codigoUnificada: Integer;
    stringlistEmpUnif: TStringList;
    vCreditosNaoEncontrados: boolean;
    vCodCobrebem: Integer;
    vCodEmpresa: Integer;
    vProcoloRet: string;
    vQtdecorrenciasCobranca: Integer;
    vDataGravacaoArqRet: TDateTime;
    vSequenciaArqRet: string;
  end;

  TQuitacaoCreditos = class(TDataSet_OOP)
  public
    constructor create;
    function _AbrirQuitCredito: boolean;
  var
    _DataInicio, _DataFim: string;
    _ValidarDatas: boolean;
  end;

  TRelQuitacaoCreditos = class(TDataSet_OOP)
  public
    constructor create;
    function _AbrirRelQuitCredito: boolean;
  var
    _DataInicio, _DataFim: string;
    _ValidarDatas: boolean;
  end;

  TBoletosImp = class(TDataSet_OOP)
    constructor create;
    function _AbrirBoletos(NossoNumero: string; CodCliente: integer; CodCobrebem: Integer; CodEmpresa: Integer): boolean;
    function _BaixarBoleto(NossoNumero: string; CodCliente: integer; CodCobrebem: Integer; CodEmpresa: Integer): boolean;
    function _InserirOcorrenciaBancariaBoletos(
    	NumeroDocumento: string; Sequencia: string;
    	MotivoOcorrencia: TStringList; ExisteCredito: boolean;
      CodCobrebem: Integer; CodEmpresa: Integer): boolean;
  end;



  TPContasImp = class(TDataSet_OOP)
  public
    constructor create;
    function _abrirPContas(pNumerosIn: string): Boolean; overload;
    function _abrirPContas(pNContaPLC: Real): Boolean; overload;
  end;

  TContaLigacaoImp = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function _AbrirContadeLigacao: boolean; overload;
    function _AbrirContadeLigacao(vConst: boolean): boolean; overload;
  var
    vPCont: TPContasImp;
  end;

  TControleChequeImp = class(TDataSet_OOP)
  private
    fN_CONTA_PLC: Double;
    fCODIGO_CTRL, fCOD_CLIENTE, fN_DOC_V, fCOD_CLI_TERC, fCODIGO_VEND, fCODIGO_CH,
      fLOTE_ENT, fUS_CAD, fCOD_EMP_MULT: Integer;
    fNOME_CH, fRAZAO, fHISTORICO_CH, fTP_DOC_V, fN_CH, fAGENCIA, fCONTA, fBANCO, fID_BANCO,
      fNOME_TERC, fTIP_CNT, fCPFCGC: string;
    fDATA_REC, fDTORIGINAL_CH, fDATA_VENC, fDATA_VENDA: TDate;
    fVALOR_CH, fVL_BAIXA_COMISSAO, fVL_BAIXA_COMISSAO_GER, fVL_CONTABIL: Currency;

  public
    constructor create;

    function _efetuarLancamento(pListaClBarrarDesbarrar: TStringList): boolean;

    function _abreControleCheque: boolean;

    property N_CONTA_PLC: Double read fN_CONTA_PLC write fN_CONTA_PLC;
    property CODIGO_CTRL: Integer read fCODIGO_CTRL write fCODIGO_CTRL;
    property COD_CLIENTE: Integer read fCOD_CLIENTE write fCOD_CLIENTE;
    property N_DOC_V: Integer read fN_DOC_V write fN_DOC_V;
    property COD_CLI_TERC: Integer read fCOD_CLI_TERC write fCOD_CLI_TERC;
    property CODIGO_VEND: Integer read fCODIGO_VEND write fCODIGO_VEND;
    property US_CAD: Integer read fUS_CAD write fUS_CAD;
    property COD_EMP_MULT: Integer read fCOD_EMP_MULT write fCOD_EMP_MULT;
    property NOME_CH: string read fNOME_CH write fNOME_CH;
    property RAZAO: string read fRAZAO write fRAZAO;
    property HISTORICO_CH: string read fHISTORICO_CH write fHISTORICO_CH;
    property TP_DOC_V: string read fTP_DOC_V write fTP_DOC_V;
    property N_CH: string read fN_CH write fN_CH;
    property AGENCIA: string read fAGENCIA write fAGENCIA;
    property CONTA: string read fCONTA write fCONTA;
    property BANCO: string read fBANCO write fBANCO;
    property ID_BANCO: string read fID_BANCO write fID_BANCO;
    property NOME_TERC: string read fNOME_TERC write fNOME_TERC;
    property TIP_CNT: string read fTIP_CNT write fTIP_CNT;
    property CPFCGC: string read fCPFCGC write fCPFCGC;
    property DATA_REC: TDate read fDATA_REC write fDATA_REC;
    property DTORIGINAL_CH: TDate read fDTORIGINAL_CH write fDTORIGINAL_CH;
    property DATA_VENC: TDate read fDATA_VENC write fDATA_VENC;
    property DATA_VENDA: TDate read fDATA_VENDA write fDATA_VENDA;
    property VALOR_CH: Currency read fVALOR_CH write fVALOR_CH;
    property LOTE_ENT: Integer read fLOTE_ENT write fLOTE_ENT;
    property CODIGO_CH: Integer read fCODIGO_CH;
    property VL_BAIXA_COMISSAO: Currency read fVL_BAIXA_COMISSAO write fVL_BAIXA_COMISSAO;
    property VL_BAIXA_COMISSAO_GER: Currency read fVL_BAIXA_COMISSAO_GER write fVL_BAIXA_COMISSAO_GER;
    property VL_CONTABIL: Currency read fVL_CONTABIL write fVL_CONTABIL;

  end;

  TControleCreditosImp = class(TDataSet_OOP)
  private
    fN_CONTA_PLC: Double;
    fCODIGO_CTRL, fCOD_CLIENTE, fCODIGO_VEND, fCODIGO_FUNC, fCOD_CLI_TERC,
      fN_DOC_V, fCOD_CRED, fLOTE_QUIT, fLOTE_ENT, fUS_CAD, fNPARCELA, fQTDE_PARC, fCOD_ADM, fCOD_EMP_MULT: Integer;
    fNOSSO_NUMERO_BANCO, fNOME_C, fRAZAO, fTIPO_DOC_C, fHISTORICO_C, fTP_DOC_V,
      fDEPENDENTE, fN_DOC_C, fTIP_CNT, fN_AUT_CART, fNOME_TERC, fCPFCGC, fN_DOCNSU_ADM, fCOD_TERMINAL_ADM: string;
    fDATA_REC_C, fDTORIGINAL_C, fDATA_VENC_C, fDATA_VENDA, fDATQ_C: TDate;
    fVALOR_C, fVALOR_LIQUIDO, fVL_BAIXA_COMISSAO, fVL_BAIXA_COMISSAO_GER, fVL_CONTABIL: Currency;
    fCOD_COBREBEM, fCOD_BANDEIRA_ADM: Integer;
    fDEB_CRED, fDESC_TERMINAL_ADM, fDESC_ADM, fDESC_BANDEIRA: string;
  public
    buscasControleCreditos: TIBQuery;
    constructor create;

    function _efetuarLancamento(pListaClBarrarDesbarrar: TStringList): boolean;

    procedure _registrarBaixaCredito(
    	pValorBaixa: Currency;
      pValorDoRecibo: Currency;
      pBaixaTotalouParcial: string;
      pListaClBarrarDesbarrar: TStringList);

    function _abreControleCreditos(pCodCred: Integer): boolean;

    property N_CONTA_PLC: Double read fN_CONTA_PLC write fN_CONTA_PLC;
    property CODIGO_CTRL: Integer read fCODIGO_CTRL write fCODIGO_CTRL;
    property COD_CLIENTE: Integer read fCOD_CLIENTE write fCOD_CLIENTE;
    property CODIGO_VEND: Integer read fCODIGO_VEND write fCODIGO_VEND;
    property CODIGO_FUNC: Integer read fCODIGO_FUNC write fCODIGO_FUNC;
    property COD_CLI_TERC: Integer read fCOD_CLI_TERC write fCOD_CLI_TERC;
    property US_CAD: Integer read fUS_CAD write fUS_CAD;
    property COD_EMP_MULT: Integer read fCOD_EMP_MULT write fCOD_EMP_MULT;
    property COD_COBREBEM: Integer read fCOD_COBREBEM write fCOD_COBREBEM;
    property NOSSO_NUMERO_BANCO: string read fNOSSO_NUMERO_BANCO write fNOSSO_NUMERO_BANCO;
    property NOME_C: string read fNOME_C write fNOME_C;
    property RAZAO: string read fRAZAO write fRAZAO;
    property TIPO_DOC_C: string read fTIPO_DOC_C write fTIPO_DOC_C;
    property HISTORICO_C: string read fHISTORICO_C write fHISTORICO_C;
    property TP_DOC_V: string read fTP_DOC_V write fTP_DOC_V;
    property N_DOC_V: Integer read fN_DOC_V write fN_DOC_V;
    property NPARCELA: Integer read fNPARCELA write fNPARCELA;
    property QTDE_PARC: Integer read fQTDE_PARC write fQTDE_PARC;
    property DEB_CRED: string read fDEB_CRED write fDEB_CRED;
    property COD_TERMINAL_ADM: string read fCOD_TERMINAL_ADM write fCOD_TERMINAL_ADM;
    property DESC_TERMINAL_ADM: string read fDESC_TERMINAL_ADM write fDESC_TERMINAL_ADM;
    property COD_BANDEIRA_ADM: Integer read fCOD_BANDEIRA_ADM write fCOD_BANDEIRA_ADM;
    property DESC_BANDEIRA: string read fDESC_BANDEIRA write fDESC_BANDEIRA;
    property COD_ADM: Integer read fCOD_ADM write fCOD_ADM;
    property DESC_ADM: string read fDESC_ADM write fDESC_ADM; 
    property DEPENDENTE: string read fDEPENDENTE write fDEPENDENTE;
    property N_DOC_C: string read fN_DOC_C write fN_DOC_C;
    property TIP_CNT: string read fTIP_CNT write fTIP_CNT;
    property N_AUT_CART: string read fN_AUT_CART write fN_AUT_CART;
    property N_DOCNSU_ADM: string read fN_DOCNSU_ADM write fN_DOCNSU_ADM;
    property NOME_TERC: string read fNOME_TERC write fNOME_TERC;
    property CPFCGC: string read fCPFCGC write fCPFCGC;
    property DATA_REC_C: TDate read fDATA_REC_C write fDATA_REC_C;
    property DTORIGINAL_C: TDate read fDTORIGINAL_C write fDTORIGINAL_C;
    property DATA_VENC_C: TDate read fDATA_VENC_C write fDATA_VENC_C;
    property DATA_VENDA: TDate read fDATA_VENDA write fDATA_VENDA;
    property VALOR_C: Currency read fVALOR_C write fVALOR_C;
    property VALOR_LIQUIDO: Currency read fVALOR_LIQUIDO write fVALOR_LIQUIDO;
    property LOTE_ENT: Integer read fLOTE_ENT write fLOTE_ENT;   
    property VL_BAIXA_COMISSAO: Currency read fVL_BAIXA_COMISSAO write fVL_BAIXA_COMISSAO;
    property VL_BAIXA_COMISSAO_GER: Currency read fVL_BAIXA_COMISSAO_GER write fVL_BAIXA_COMISSAO_GER;
    property VL_CONTABIL: Currency read fVL_CONTABIL write fVL_CONTABIL;

    property COD_CRED: Integer read fCOD_CRED;
    property DATQ_C: TDate write fDATQ_C;
    property LOTE_QUIT: Integer write fLOTE_QUIT;
  var
    vValor_C_Anterior_Parcial: Currency;
    vValor_C_Anterior_Parcial_Zerado: boolean;
    vValor_Contabil_BX: Extended;

  end;

  TLancamentosImp = class(TDataSet_OOP)
  private
    fN_CONTA_PLC: Double;
    fHISTORICO_L, fTIPO_L, fNDOC_L, fNOMINAL_L, fTIP_CNT, fLANC_VENDA, fNOME_CTRL, fTP_MOD, fARQ_EXTRATO_ADM, fN_CHEQ_L, fSTATUS_L: string;
    fDATA_ARQUIVO: TDateTime;
    fVALOR_L, fVL_CONTABIL: Currency;
    fCODIGO_CTRL, fLOTE_ENT, fCOD_LANC, fLOTE_QUIT, fCOD_ADM, fCOD_EMP_MULT, fCODIGO_EMP, fLOTE, fID_FINANC_CONFERE: Integer;
    fDATA, fDTREFERENCIA, fDATQ_L, fDATA_VENC_CHEQ_L: TDate;
    FLancamentos: TStringList;

  public
    queryLanc: TIBQuery;
    spIncCodigo: TIBStoredProc;
    constructor create;

    function _efetuarLancamentoSequencial(pCOD_LANC, pCODIGO_CTRL: Integer; pTIPO_L: string): boolean;
    function _efetuarLancamento(pContrapartida: boolean = false): boolean;
    function _AbreLancamentos: boolean;
    procedure _clearFlancamentos;
    procedure _setTransactionComponentes(pTransacao: TIBTransaction);
    function _verificarDesbarramentoCliente(pCodigoUnificada: Integer): Boolean;

    procedure _addFLancamentos(pCodigo, pControle: integer; pCredCh: string);
    function _getCodigoLancamento(pControle: integer): integer;

    property N_CONTA_PLC: Double read fN_CONTA_PLC write fN_CONTA_PLC;
    property HISTORICO_L: string read fHISTORICO_L write fHISTORICO_L;
    property TIPO_L: string read fTIPO_L write fTIPO_L;
    property NDOC_L: string read fNDOC_L write fNDOC_L;
    property TIP_CNT: string read fTIP_CNT write fTIP_CNT;
    property LANC_VENDA: string read fLANC_VENDA write fLANC_VENDA;
    property NOME_CTRL: string read fNOME_CTRL write fNOME_CTRL;
    property TP_MOD: string read fTP_MOD write fTP_MOD;
    property ARQ_EXTRATO_ADM: string read fARQ_EXTRATO_ADM write fARQ_EXTRATO_ADM;
    property DATA_ARQUIVO: TDateTime read fDATA_ARQUIVO write fDATA_ARQUIVO;
    property N_CHEQ_L: string read fN_CHEQ_L write fN_CHEQ_L;
    property NOMINAL_L: string read fNOMINAL_L write fNOMINAL_L;
    property DATA_VENC_CHEQ_L: TDate read fDATA_VENC_CHEQ_L write fDATA_VENC_CHEQ_L;
    property STATUS_L: string read fSTATUS_L write fSTATUS_L;
    property VALOR_L: Currency read fVALOR_L write fVALOR_L;
    property CODIGO_CTRL: Integer read fCODIGO_CTRL write fCODIGO_CTRL;
    property LOTE_ENT: Integer read fLOTE_ENT write fLOTE_ENT;
    property LOTE_QUIT: Integer read fLOTE_QUIT write fLOTE_QUIT;
    property LOTE: Integer read fLOTE write fLOTE;
    property COD_ADM: Integer read fCOD_ADM write fCOD_ADM;
    property COD_EMP_MULT: Integer read fCOD_EMP_MULT write fCOD_EMP_MULT;
    property CODIGO_EMP: Integer read fCODIGO_EMP write fCODIGO_EMP;
    property DATA: TDate read fDATA write fDATA;
    property DTREFERENCIA: TDate read fDTREFERENCIA write fDTREFERENCIA;
    property DATQ_L: TDate read fDATQ_L write fDATQ_L;
    property VL_CONTABIL: Currency read fVL_CONTABIL write fVL_CONTABIL;
    property ID_FINANC_CONFERE: Integer read fID_FINANC_CONFERE write fID_FINANC_CONFERE;
    property COD_LANC: Integer read fCOD_LANC;

  end;

  TBaixaCreditoImp = class(TDataSet_OOP)
    constructor create;
    function Insert: boolean; override;
  end;

  TFechCaixaImp = class(TDataSet_OOP)
    constructor create;
    {_Abre o dataset e posiciona no último campo}
    function _AbrirFechCaixa: boolean;
  end;

  TCBX = class(TDataSet_OOP)
    {Dataset temporário para exibir informações do processamento}
    constructor create;
    procedure _marcaDesmarcaLinha;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
  var
    _dtsource: TDataSource;
  end;

  TLoteQuitImp = class(TDataSet_OOP)
  private
    constructor create;
    function _AbrirLoteQuit: boolean;
    function Insert: boolean; override;
    procedure _VerificarCodigoAutoIncremento(generator, campo, tabela: string);
  public
    procedure _CriarLote;
  end;

  TCobrebemPesq = class(TDataSet_OOP)
    constructor create;
    function _AbrirCobrebem(pCodEmpresa: Integer = 0): boolean;
    function _PesquisaCobrebem(CodControle: integer; pCodEmpresa: Integer = 0): boolean;
  end;

  TControle_Busca = class(TDataSet_OOP)
  public
    constructor create;
    function _AbrirControle(pCodEmpresa: Integer = 0): boolean;
    function _AbrirControleCobrebem(pCodEmpresa: Integer = 0): boolean;
  end;

  TEmpresasUnificadas = class(TDataSet_OOP)
  public
  	constructor create;
    function _AbrirEmpresaUnif: boolean;
  end;

  TConvenioOcorrenciaBancaria = class(TDataSet_OOP)
  public
    constructor create;
    function _AbrirOcorrenciaBancaria(pCodigoCobrebem: Integer; pCodigoEmpresa: Integer; pProtocolo: string): boolean;
  end;

  TPdvs = class(TGenericoFechamentoPDV)
  public
    constructor create;
    function _abrirPDVs: boolean;
  end;

  TMeiosPag = class(TGenericoFechamentoPDV)
  public
    constructor create;
    function _somaMeiosPagamento: boolean;
    function _somaMeiosPagamento_Rel: boolean;
    function getFinalizadorPrazo: integer;
  end;

  TPrazosPDV = class(TGenericoFechamentoPDV)
  private
    FEnderecoBanco: string;
  public
    constructor create(vEndereco: string);
    function _terminalOnLine: boolean;
    function _concectaBanco: boolean;
    function _desconcectaBanco: boolean;
    function _abrePrazos: boolean;

    function _abreFormEscolhaControles(pTexto: string = ''): Boolean;

  end;

  TTerminalAdmCartao_Imp = class(TGenericoFechamentoPDV)
  public
    constructor create;
    function _abreTerminais: boolean;
  end;

  RCampos = record
    Cupom, NumeroCheque, CodCliente, CodTerceiro, Parcelas, DiaVencimento, Finalizador, vQtde:
    integer;
    Agencia, Conta, Banco, NomeBanco, Historico, NomeCliente, NomeTerceiro, OutrasFormas,
    NumAutCartao, NSUTransacao, CodTerminalCartao: string;
    Valor: Currency;
    Vencimento: TDate;
    Documentos: array of string;
    Valores: array of Currency;
    Datas: array of string;
  end;

  TFechamentoPDV = class(TGenericoFechamentoPDV)
  private
    FLancamentos: TStringList;
    function _movimentoProntoParaFechamento: boolean;
    function _validasCamposPadrao: boolean;
    procedure _limpaCampos;
    procedure _atualizaSomaMeiosPag;
    procedure _addFLancamentos(pCodigo, pControle: integer; pCredCh: string);
    function _getCodigoLancamento(pControle: integer): integer;
    function _imprimirRelatorio: boolean;
  public
    constructor create;
    destructor Destroy; override;
    function _setAtributos: boolean;
    function _setAtributos_Rel: boolean;
    function _existeMovimentoFechado: boolean;
    function _salvarDinheiro: boolean;
    function _salvarCheque: boolean;
    function _salvarCreditos: boolean;
    function _gerarParcelas: boolean;
    function _insereHistoricoConsolidacao: boolean;
    function _abreFormManutencaoLancamento: boolean;
    function _abreFormManutencaoLancamentoCadastro: boolean;
    function _abreFormRelatorio: boolean;
    function _abreFormContasBancarias: Boolean;
    function _iniciarRecebimento: boolean;
    function _novoLancamento: boolean;
    function _removerLancamento: boolean;

    function _existeCupom: boolean;
    function _existeFinCupom: boolean;
    function _existeCliente(pCodigo: integer; var pNomeCliente: string): boolean;
    function _existeDadosBancarios(pCodigo: integer): boolean;
    function _existeBanco(pCodigo: integer; var pNome: string): boolean;

    procedure _irParaRegistro(pCampoIndice: string);
    procedure _abreTelaInicial;
    procedure _montaCondPag(var pLista: TComboBox);

    function _confirmarConsolidacao: boolean;

    function _liberarMovimentoPDV: boolean;
  var
    vPdv: TPdvs;
    vMeioPg: TMeiosPag;
    vCtrl: TControles_FPDV;
    vPrazoPDV: TPrazosPDV;
    vContabanc: TContasBancariasImpPDV;
    vLancamentos: TClientDataSet;
    vLancConsolidados: TClientDataSet;
    vTermCartao: TTerminalAdmCartao_Imp;
    vCampos: RCampos;
  end;

  TImportacaoAutomacao = class(TDataSet_OOP)
  private
    fDataInicial, fDataFinal, fModoFaturamento: string;
    fReceberPeloFinanceiroReqOs: Boolean;
    fReceberPeloFinanceiroComfat: Boolean;
    fReceberPeloFinanceiroRecibo: Boolean;
    fTipoDoc, fCodigoUsuario, fCodigoOperadorCxl, fCodigoUnificada: Integer;
    fValorTotalPrestacoes, fValorTotalVendasPrest,
      fValorTotalTroco, fValorTotalLiquido, fValorTotalCreditos, fValorTotalLancamentosAvulso,
      fValorTotalLancamentosOutrasE, fValorTotalLancamentosOutrasS,
      fValorTotalDiferenca, fValorTotalJuros: Currency;

    fValorReqOS, fValorReqOSJuros: Currency;
    fValorComFat, fValorComFatJuros: Currency;
    fValorPrestacoesReceb, fValorPrestacoesRecebJuros: Currency;
    fValorRecibo, fValorLancamentos, fValorLancamentosAvulsos, fValorBaixaRecibos, fValorTaxaInterPagEC: Currency;

    fVenda: string;
    fRelTipo: string;
    fHistPadraoUnificadas: string;

    fSomaDinheiro, fSomaCheque, fSomaCreditos, fSomaDinheiroContabil: Currency;

    fVendas: TIBquery;

    fAgruparValoresEmDinheiro, fAgruparValoresBaixaAutomatica: Boolean;

    procedure _somaVendaReqOS;
    procedure _somaVendaVeiculos;
    procedure _somaRecibosRecebidos;
    procedure _somaPrestacoesRecebidas;
    procedure _somaLancamentosCxl;
    procedure _somaRecibosUsadosFormaPag;
    procedure _somaTaxaIntermPagEC;

//    function _desnegativaClienteRecebimento(pCodCliente: Integer; vtp: integer): Boolean;

    function _abreFormDataBaixa(pDiaDefault: TDate): TDate;
    function _abreFormOpcoesImportacao: Boolean;

  public
    FBuscas2 : TIBQuery;
    destructor Destroy; override;
    constructor create;

    function _abreFormaPagamento: Boolean;
    function _abrePrestacoesRecebidas: boolean;
    function _processarCreditosSelecionados: boolean;
    function _processarPrestacoes: boolean;
    function _efetuarSomaConferencia: boolean;

    procedure _selecionarItem;
    procedure _selecionarTodos;
    procedure _desfazerSelecaoTodos;

    procedure _relatorioVendedor;
    function retornaModFaturamentoMatrizFiliais: string;
    function retornaReceberReqOsMatrizFiliais: Boolean;
    function retornaReceberComfatMatrizFiliais: Boolean;
    function retornaReceberRecibosMatrizFiliais: Boolean;

    procedure abreImpAuto;

    property DataInicial: string read fDataInicial write fDataInicial;
    property DataFinal: string read fDataFinal write fDataFinal;
    property CodigoUsuario: Integer read fCodigoUsuario write fCodigoUsuario;
    property ModoFaturamento: string read fModoFaturamento write fModoFaturamento;
    property ReceberPeloFinanceiroReqOs: Boolean read fReceberPeloFinanceiroReqOs write fReceberPeloFinanceiroReqOs;
    property ReceberPeloFinanceiroComfat: Boolean read fReceberPeloFinanceiroComfat write fReceberPeloFinanceiroComfat;
    property ReceberPeloFinanceiroRecibo: Boolean read fReceberPeloFinanceiroRecibo write fReceberPeloFinanceiroRecibo;

    property TipoDoc: Integer read fTipoDoc write fTipoDoc;
    property CodigoOperadorCxl: Integer read fCodigoOperadorCxl write fCodigoOperadorCxl;
    property CodigoUnificada: Integer read fCodigoUnificada write fCodigoUnificada;
    property ValorTotalPrestacoes: Currency read fValorTotalPrestacoes;
    property ValorTotalVendasPrest: Currency read fValorTotalVendasPrest;
    property ValorTotalCreditos: Currency read fValorTotalCreditos;
    property ValorTotalLiquido: Currency read fValorTotalLiquido;
    property ValorTotalTroco: Currency read fValorTotalTroco;
    property ValorTotalLancamentosAvulso: Currency read fValorTotalLancamentosAvulso;
    property ValorTotalLancamentosOutrasE: Currency read fValorTotalLancamentosOutrasE;
    property ValorTotalLancamentosOutrasS: Currency read fValorTotalLancamentosOutrasS;
    property ValorTotalJuros: Currency read fValorTotalJuros;
    property ValorTotalDiferenca: Currency read fValorTotalDiferenca;
    property vVenda: string read fVenda write fVenda;
    property ValorBaixaRecibos: Currency read fValorBaixaRecibos write fValorBaixaRecibos;
    property ValorTaxaInterPagEC: Currency read fValorTaxaInterPagEC write fValorTaxaInterPagEC;
    property RelTipo: string read fRelTipo write fRelTipo;
    property AgruparValoresEmDinheiro: Boolean read fAgruparValoresEmDinheiro write fAgruparValoresEmDinheiro;
    property AgruparValoresBaixaAutomatica: Boolean read fAgruparValoresBaixaAutomatica write fAgruparValoresBaixaAutomatica;

  var
    //objetos
    vFp: TFormPagImpAuto;
    vSomaFp: TSomaFormPagImpAuto;
    vPrest: TPrestacoesImpAuto;
    vFecDCxl: TFechDiaCxlImpAuto;
    vContLig: TContaLigacaoImp;
    vlanc: TLancamentosImp;
    vCtrl: TControles_FPDV;
    vCred: TControleCreditosImp;
    vCh: TControleChequeImp;

    //Variaveis
    vProgresso: TProgressBar;
    vTipoRel: string;
  end;

  TFormPagImpAuto = class(TDataSet_OOP)
  public
    constructor create;
    function _abreFormPag(pDataIni, pDataFim: string; pCodigoOpCxl, pCodigoUsuario, pCodigoUnificada: Integer;
    	pModoFaturamento: string; pReceberPeloFinanceiroReqOs, pReceberPeloFinanceiroComfat, pReceberPeloFinanceiroRecibo: Boolean; pTipoDoc: Integer): Boolean; overload;
    function _abreFormPag(pLoteCxl, pCodigoUnificada: Integer): Boolean; overload;
    function _abreFormPagAnalitico(pLoteCxl, pCodigoUnificada: Integer): Boolean;
  end;

  TSomaFormPagImpAuto = class(TDataSet_OOP)
  public
    constructor create;
    function _abreSomaFormPag(pDataIni, pDataFim: string;
    	pCodigoOpCxl, pCodigoUsuario, pCodigoUnificada: Integer; pModoFaturamento: string;
      pReceberPeloFinanceiroReqOs, pReceberPeloFinanceiroComfat, pReceberPeloFinanceiroRecibo: Boolean;
      pTipoDoc: Integer): Boolean;
  end;

  TLoteCxlImp = class(TDataSet_OOP)
    constructor create;
    function _abreLoteCxl(pDataIni, pDataFim: string; pCodigoOpCxl, pCodigoUnificada: Integer): Boolean;
  end;

  TPrestacoesImpAuto = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function _abrePrestacoes(pDataIni, pDataFim: string; pCodigoOpCxl, pCodigoUnificada: Integer): Boolean; overload;
    function _abrePrestacoes(pLoteCxl, pCodigoUnificada: Integer): Boolean; overload;
  var
    vLoteCxl: TLoteCxlImp;
  end;

  TFechDiaCxlImpAuto = class(TDataSet_OOP)
  public
    constructor create;
    function _abreDiaCxl(pDataIni, pDataFim: string; pCodigoOpCxl, pCodigoUnificada: Integer): Boolean;
    function _verificarCaixaAberto(pDataIni, pDataFim: string; pCodigoOpCxl, pCodigoUnificada: Integer): Boolean;
  end;

  TDetalhesRecebimentoCX = class(TDataSet_OOP)
  private
    fLancamentos, fCheques, fCreditos: TIBQuery;
    fTransacao: TIBTransaction;
    fDSLancamentos, fDSCheques, fDSCreditos: TDataSource;
  public
    destructor Destroy; override;
    constructor Create;
    function _abreDetalhesRecebimentosModalidade(pLOTE_QUIT: Integer; pDATA_LOTE: TDateTime): Boolean;
  end;

  TContasBancariasImpPDV = class(TDataSet_OOP)
  public
    constructor create;
    function _selecionaContasBancarias(pCodigoCliente: Integer): Boolean;
  end;

  TNegativacaoCliente = class(TDataSet_OOP)
  private
    fMsgErro: string;
    fDocs, fTable: string;
  public
    constructor create(pTransacao: TIBTransaction; pDocs: string);
    function executar: boolean;

    property MsgErro: string read fMsgErro;
  var
    dados : RNegativacao;
  end;

  vOP = (Unificar, Desunificar);

  TUnificarEmpresa = class(TDataSet_OOP)
  private
  public
    Buscas2: TIBQuery;
    fTempLancamentos, fTempControles: TClientDataSet;
    fTempLancamentosDataSource, fTempControlesDataSource: TDataSource;
    constructor create;
    destructor Destroy; override;
    function abreEmpresasUnificadas: Boolean;
    procedure ExibirLancamento;
    procedure MudarControles(pCodControle: Integer);
    procedure _marcaDesmarcaLinha;
    procedure _marcaDesmarcaTodos(pTip: Integer);
    procedure _marcaTodosControles;
    function DesunificarFinanceiro: boolean;
    function UnificarFinanceiro: boolean;
    function AplicarLancamentos(pTipo: vOP): boolean;
    function buscarDiaFinanceiroFechado(pCodEmpresa: Integer): boolean;
    function Split(const Str: string; Delimiter: Char): TStringList;
    procedure AtualizarCampoAlterado(pTipo: vOP);
  var
    vCtrl: TControles_FPDV;
    vLancL: TLancamentosImp;
    vContLig: TContaLigacaoImp;
    diaFFinanceiroUnificada: TDateTime;
    vUnificar: boolean;
  end;

implementation

uses
  uDtmImportPDVFinan, uDtmAtivo, SysUtils,
  Forms, Windows, uImportFinanceiro, uPadrao, uDadosIni, DateUtils,
  Dialogs, uEditHw, RDprint, uimportRetorno, uverificacontrole, IBCustomDataSet,
  uImpAuto, Variants, uDetalhesRecebimentoModalidade, UUnificarEmpresas,
  ImageHlp, Registry, config_sistema_class, hw_utils, SHFolder;

function __getSenhaFDB: PChar; stdcall; external 'cons40.dll';
function __getUsuarioFDB: PChar; stdcall; external 'cons40.dll';
function __descriptografaTextoFDB(pTexto: PChar): PChar; stdcall; external 'cons40.dll';
function _strBase64toImage(Base64: WideString; FileName: WideString): WideString; stdcall; external 'MD5XE3.dll';

{ TPdvs }

constructor TPdvs.create;
begin
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsPDV);
  buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TPdvs._abrirPDVs: boolean;
begin
  Result := montaSelect('select tf.cod_terminal, tf.nome_terminal, ti.num_serie_ecf, tf.end_terminal'
    +
    ' from terminalf tf' +
    ' inner join terminal_impressoras ti on ti.cod_terminal = tf.cod_terminal and' +
    ' ti.cod_empresa = tf.cod_empresa and ti.atual = ''S'' order by tf.cod_terminal');
end;

{ TMeiosPag }

constructor TMeiosPag.create;
begin
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsSomaPDV);
  buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TMeiosPag.getFinalizadorPrazo: integer;
begin
  Result := 0;
  dataSet.First;
  while not dataSet.eof do
  begin
    if pos('PRAZO', UpperCase(Trim(dataSet.FieldByName('descricao').AsString))) > 0 then
    begin
      Result := dataSet.FieldByName('finalizador').AsInteger;
      Break;
    end;
    dataSet.Next;
  end;
  dataSet.First;
end;

function TMeiosPag._somaMeiosPagamento: boolean;
var
  vTempSql: string;
  vTempCurrency: Currency;
begin
  vTempSql :=
    //'select fc.finalizador, fi.descricao, sum(' +
//    ' case when fc.tipo_doc = ''SAN'' then (-1 * fc.valor)' +
//    '   else fc.valor' +
//    ' end ) Valor from fincupom fc' +
  'select fc.finalizador, fi.descricao,' +
    ' sum( case when fc.tipo_doc = ''SAN'' then (fc.valor)   else 0 end ) Sangria,' +
    ' sum( case when fc.tipo_doc = ''SUP'' then (fc.valor)   else 0 end ) Suprimento,' +
    ' sum( case when fc.tipo_doc = ''REC'' then (fc.valor)   else 0 end ) Prestacao,' +
    ' sum( case when fc.tipo_doc = ''CUP'' then (fc.valor)   else 0 end ) Valor,' +
    ' sum( case when fc.tipo_doc = ''SAN'' then (-1 * fc.valor)   else fc.valor end ) Total' +
    ' from fincupom fc' +
    //' fc.valor) Valor from fincupom fc'+
  ' inner join finalizadores fi on fi.cod_terminal = fc.cod_terminal and' +
    ' fi.nserieecf = fc.nserieecf and fi.cod_empresa = fc.cod_empresa and' +
    ' fi.cod_finalizador = fc.finalizador' +
    ' where fc.cod_terminal = ' + IntToStr(vNumeroPDV) +
    ' and fc.nserieecf = ' + QuotedStr(vNumeroSerieECF) +
    ' and fc.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and fc.data = :data1 and fc.data = :data2 ' +
    ' and coalesce(fc.status_fc, '''') <> ''CANCELADO''';
  if vOperador > 0 then
    vTempSql := vTempSql + ' and fc.operador = ' + IntToStr(vOperador);
  vTempSql := vTempSql + ' group by 1,2';
  Result := montaSelect(vTempSql, vDataMovimento, vDataMovimento);
  Result := (not dataSet.IsEmpty);

  vTempCurrency := 0;
  dataSet.First;
  while not dataSet.Eof do
  begin
    vTempCurrency := vTempCurrency +
      vDadosIni.StrToFloatFormat(dataSet.FieldByName('valor').AsCurrency, 2);
    dataSet.Next;
  end;

  vLabelSomaMeiosPag.Caption := Format('%0.2m', [vTempCurrency]);

end;

function TMeiosPag._somaMeiosPagamento_Rel: boolean;
var
  vTempSql: string;
begin
  vTempSql :=
    'select fc.finalizador, fi.descricao,' +
    ' sum( case when fc.tipo_doc = ''SAN'' then (fc.valor)   else 0 end ) Sangria,' +
    ' sum( case when fc.tipo_doc = ''SUP'' then (fc.valor)   else 0 end ) Suprimento,' +
    ' sum( case when fc.tipo_doc = ''REC'' then (fc.valor)   else 0 end ) Prestacao,' +
    ' sum( case when fc.tipo_doc = ''CUP'' then (fc.valor)   else 0 end ) Valor,' +
    ' sum( case when fc.tipo_doc = ''SAN'' then (-1 * fc.valor)   else fc.valor end ) Total' +
    ' from fincupom fc' +
    ' inner join finalizadores fi on fi.cod_terminal = fc.cod_terminal and' +
    ' fi.nserieecf = fc.nserieecf and fi.cod_empresa = fc.cod_empresa and' +
    ' fi.cod_finalizador = fc.finalizador' +
    ' where fc.cod_terminal = ' + IntToStr(vNumeroPDV_Rel) +
    ' and fc.nserieecf = ' + QuotedStr(vNumeroSerieECF_Rel) +
    ' and fc.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and fc.data = :data1 and fc.data = :data2 ';
  if vOperador_Rel > 0 then
    vTempSql := vTempSql + ' and fc.operador = ' + IntToStr(vOperador_Rel);
  vTempSql := vTempSql + ' group by 1,2';
  Result := montaSelect(vTempSql, vDataMovimento_Rel, vDataMovimento_Rel);
  Result := (not dataSet.IsEmpty);
end;

{ TFechamentoPDV }

constructor TFechamentoPDV.create;
begin
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsMov);
  buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
  vLancamentos := TClientDataSet(dtmImportPDVFinan.cdsFP);
  vLancConsolidados := TClientDataSet(dtmImportPDVFinan.cdsCons);
  vContabanc := TContasBancariasImpPDV.Create;
  FLancamentos := TStringList.Create;

  if vLancamentos.Tag <> 22 then
    vLancamentos.CreateDataSet;
  vLancamentos.Tag := 22;
  while not vLancamentos.IsEmpty do
    vLancamentos.Delete;

  if vLancConsolidados.Tag <> 22 then
    vLancConsolidados.CreateDataSet;
  vLancConsolidados.Tag := 22;
  while not vLancConsolidados.IsEmpty do
    vLancConsolidados.Delete;

  vLancamentos.IndexFieldNames := 'NREQUISICAO';
  vLancConsolidados.IndexFieldNames := 'COD_CONTROLE';

  vPdv := TPdvs.create;
  vMeioPg := TMeiosPag.create;
  vCtrl := TControles_FPDV.create;
  vTermCartao := TTerminalAdmCartao_Imp.create;
end;

destructor TFechamentoPDV.Destroy;
begin
  FreeAndNil(vPdv);
  FreeAndNil(vMeioPg);
  FreeAndNil(vCtrl);
  FreeAndNil(vContabanc);
  FreeAndNil(vTermCartao);
  if vPrazoPDV <> nil then
    FreeAndNil(vPrazoPDV);
  inherited;
end;

function TFechamentoPDV._abreFormContasBancarias: Boolean;
var
  formulario: Tform;
  vCodCnt: Integer;
begin
  try
    formulario := TForm.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Selecione a conta bancária do cheque';
    frmImportacaoFinanceiro.pnConsultaContasBancarias.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    Result := (formulario.ShowModal = mrOk);
  finally
    frmImportacaoFinanceiro.pnConsultaContasBancarias.Parent := frmImportacaoFinanceiro.tsContasBacarias;
    formulario.Free;
    formulario := nil;
  end;
end;

function TFechamentoPDV._abreFormManutencaoLancamento: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Manutenção dos Lançamentos';
    frmImportacaoFinanceiro.pnLancamentos.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    frmImportacaoFinanceiro.pnLancamentos.Visible := True;

    result := (formulario.ShowModal = IDOK);

  finally
    frmImportacaoFinanceiro.pnLancamentos.Visible := False;
    frmImportacaoFinanceiro.pnLancamentos.Parent := frmImportacaoFinanceiro.tsLancamentos;
    formulario.Free;
    formulario := nil;
  end;
end;

function TFechamentoPDV._abreFormManutencaoLancamentoCadastro: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Lançamentos';
    frmImportacaoFinanceiro.pnCadastroLancamento.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    frmImportacaoFinanceiro.pnCadastroLancamento.Visible := True;

    result := (formulario.ShowModal = IDOK);

  finally
    frmImportacaoFinanceiro.pnCadastroLancamento.Visible := False;
    frmImportacaoFinanceiro.pnCadastroLancamento.Parent := frmImportacaoFinanceiro.tsCadastro;
    formulario.Free;
    formulario := nil;
  end;
end;

function TFechamentoPDV._abreFormRelatorio: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Informa os dados para o relatório';
    frmImportacaoFinanceiro.pnRelatorio.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    frmImportacaoFinanceiro.pnRelatorio.Visible := True;
    frmImportacaoFinanceiro.EditHw21.AsValue := vOperador;
    if vDataMovimento = 0 then
      frmImportacaoFinanceiro.MaskEdit4.Text := DateToStr(Date)
    else
      frmImportacaoFinanceiro.MaskEdit4.Text := DateToStr(vDataMovimento);

    result := (formulario.ShowModal = IDOK);

    if Result then
    begin
      vOperador_Rel := frmImportacaoFinanceiro.EditHw21.AsInteger;
      vDataMovimento_Rel := StrToDate(frmImportacaoFinanceiro.MaskEdit4.Text);
      if not _setAtributos_Rel then
        exit;
      _imprimirRelatorio;
    end;

  finally
    vPdv.IndexFieldNames := 'COD_TERMINAL';
    vPdv.FindNearest([vNumeroPDV]);
    frmImportacaoFinanceiro.pnRelatorio.Visible := False;
    frmImportacaoFinanceiro.pnRelatorio.Parent := frmImportacaoFinanceiro.tsRelatorio;
    formulario.Free;
    formulario := nil;
  end;
end;

procedure TFechamentoPDV._abreTelaInicial;
begin
  if dtmImportPDVFinan = nil then
    dtmImportPDVFinan := TdtmImportPDVFinan.Create(dtmImportPDVFinan);
  if not vDadosIni.PesqPros('IMPFIN001', 'CONSULTA', '', 'MOVIMENTO_PDV_FINAN', '',
    dtmImportPDVFinan.qrBuscas, False) then
    Exit;
  Application.CreateForm(TfrmImportacaoFinanceiro, frmImportacaoFinanceiro);
  frmImportacaoFinanceiro.ShowModal;
end;

procedure TFechamentoPDV._addFLancamentos(pCodigo, pControle: integer;
  pCredCh: string);
var
  I: Integer;
begin
  for I := 0 to FLancamentos.Count - 1 do
    if vDadosIni.getCampoPipe(FLancamentos[i], 2) = IntToStr(pControle) then
      Exit;
  FLancamentos.Add(IntToStr(pCodigo) + '|' + IntToStr(pControle) + '|' + pCredCh + '|');
end;

procedure TFechamentoPDV._atualizaSomaMeiosPag;
var
  vTemControle: Boolean;
begin
  vMeioPg.dataSet.First;
  while not vMeioPg.dataSet.Eof do
  begin
    vMeioPg.dataSet.Edit;
    vMeioPg.dataSet.FieldByName('valor_informado').AsCurrency := 0;
    vMeioPg.dataSet.Post;
    vMeioPg.dataSet.Next;
  end;

  while not vLancConsolidados.IsEmpty do
    vLancConsolidados.Delete;

  vLancConsolidados.First;
  while not vLancConsolidados.Eof do
  begin
    vLancConsolidados.Edit;
    vLancConsolidados.FieldByName('valor').AsCurrency := 0;
    vLancConsolidados.Post;
    vLancConsolidados.Next;
  end;

  vLancamentos.First;
  while not vLancamentos.Eof do
  begin
    //Atualizando a soma dos meios de pagamento
    vMeioPg.dataSet.First;
    while not vMeioPg.dataSet.Eof do
    begin
      if vLancamentos.FieldByName('finalizador').AsInteger =
        vMeioPg.dataSet.FieldByName('finalizador').AsInteger then
      begin
        vMeioPg.dataSet.Edit;
        vMeioPg.dataSet.FieldByName('valor_informado').AsCurrency :=
          vMeioPg.dataSet.FieldByName('valor_informado').AsCurrency +
          vLancamentos.FieldByName('valordoc').AsCurrency;
        vMeioPg.dataSet.Post;
        Break;
      end;
      vMeioPg.dataSet.Next;
    end;
    //Atualizando a soma dos controles
    vTemControle := False;
    vLancConsolidados.First;
    while not vLancConsolidados.Eof do
    begin
      if vLancamentos.FieldByName('cod_controle').AsInteger =
        vLancConsolidados.FieldByName('cod_controle').AsInteger then
      begin
        vLancConsolidados.Edit;
        vLancConsolidados.FieldByName('valor').AsCurrency :=
          vLancConsolidados.FieldByName('valor').AsCurrency +
          vLancamentos.FieldByName('valordoc').AsCurrency;
        vLancConsolidados.Post;
        vTemControle := True;
      end;
      vLancConsolidados.Next;
    end;
    if not vTemControle then
    begin
      vLancConsolidados.Insert;
      vLancConsolidados.FieldByName('cod_controle').AsInteger :=
        vLancamentos.FieldByName('cod_controle').AsInteger;
      vLancConsolidados.FieldByName('valor').AsCurrency :=
        vLancamentos.FieldByName('valordoc').AsCurrency;
      vCtrl.dataSet.IndexFieldNames := 'CODIGO_CTRL';
      vCtrl.dataSet.FindNearest([vLancamentos.FieldByName('cod_controle').AsInteger]);
      vLancConsolidados.FieldByName('nome_ctrl').AsString :=
        vCtrl.dataSet.FieldByName('nome_ctrl').AsString;
      vLancConsolidados.Post;
    end;
    vLancamentos.Next;
  end;

end;

function TFechamentoPDV._confirmarConsolidacao: boolean;
var
  vSqlLancamentos, vSqlCreditos, vSqlCheques, vSqlMovimentoPDV: string;
  vNumContaVendaProdutos: Double;
  vTipoPLC, vCPFCGCCliente, vNomeControle, vMensagemErro: string;
  vDiaFinanceiroFechado: TDate;
  vValorDinheiroAcumulado: Currency;
  vCodLancamentoCheque, vCodLancamentoCreditos, vCodigoTemp: Integer;
  I: Integer;
  vCOD_ADM: Integer;
  vDESC_ADM: string;
  buscas2: TIBQuery;
  vNovoValorLiquido: Double;
begin
  try
    try
      Result := False;

      buscas2 := TIBQuery.Create(Application);
  		buscas2.Database := buscas.Database;
		  buscas2.Transaction := buscas.Transaction;

      if Application.MessageBox(pchar('Confirma o fechamento do movimento informado?'),
        'Confirmação', MB_YESNO +
        MB_ICONQUESTION) = IDNO then
        Exit;

      vMeioPg.dataSet.First;
      while not vMeioPg.dataSet.Eof do
      begin
        if vDadosIni.StrToFloatFormat(vMeioPg.dataSet.FieldByName('valor_informado').AsFloat, 2) <>
          vDadosIni.StrToFloatFormat(vMeioPg.dataSet.FieldByName('valor').AsFloat, 2) then
        begin
          Application.MessageBox(pchar('Valor obtido difere do esperado para esta forma de pagamento'
            + #13 +
            'Forma de Pagamento: ' + vMeioPg.dataSet.FieldByName('descricao').AsString + #13 +
            'Valor dos Cupons: ' + Format('%0.2f', [vMeioPg.dataSet.FieldByName('valor').AsFloat]) +
            #13 +
            'Valor Obtido: ' + Format('%0.2f',
            [vMeioPg.dataSet.FieldByName('valor_informado').AsFloat])),
            'Atenção', 0 + 64);
          if not vDadosIni.PesqPros('IMPFIN026', 'VALIDACAO',
            Trim(vMeioPg.dataSet.FieldByName('descricao').AsString) + ' ' +
            Format('%0.2f', [vMeioPg.dataSet.FieldByName('valor').AsFloat]) + ' <> ' +
            Format('%0.2f', [vMeioPg.dataSet.FieldByName('valor_informado').AsFloat]),
            'MOVIMENTO_PDV_FINAN', '',
            dtmImportPDVFinan.qrBuscas, True) then
            Exit;
          if Application.MessageBox('Deseja continuar mesmo assim?', 'Confirmação', MB_ICONQUESTION
            + MB_YESNO) <> IDYES then
          begin
            vDadosIni.GravaAuditoria('IMPFIN026', 'VALIDACAO', 'CANCELADO', 'MOVIMENTO_PDV_FINAN',
              '',
              dtmImportPDVFinan.qrBuscas);
            Exit;
          end;
          vDadosIni.GravaAuditoria('IMPFIN026', 'VALIDACAO', 'CONFIRMADO', 'MOVIMENTO_PDV_FINAN',
            '',
            dtmImportPDVFinan.qrBuscas);
        end;
        vMeioPg.dataSet.Next;
      end;

      vDadosIni.progressoFuncao('Fechamento financeiro dos PDV''s ',
        'Processo de fechamento financeiro. 7 Etapas',
        'Verificando Movimento existente');
      vSqlLancamentos :=
        'INSERT INTO LANCAMENTOS (N_CONTA_PLC, HISTORICO_L, VALOR_L, CODIGO_CTRL,' +
        ' TIPO_L, DATA, DTREFERENCIA, NDOC_L, TIP_CNT, CODIGO_EMP, COD_EMP_MULT,' +
        ' LANC_VENDA, LOTE_ENT, COD_LANC)' +
        ' VALUES (:N_CONTA_PLC, :HISTORICO_L, :VALOR_L, :CODIGO_CTRL, :TIPO_L,' +
        ' :DATA, :DTREFERENCIA, :NDOC_L, :TIP_CNT, :CODIGO_EMP, :COD_EMP_MULT,' +
        ' :LANC_VENDA, :LOTE_ENT, :COD_LANC)';
      vSqlCreditos :=
        'INSERT INTO CONTROLE_CREDITOS (N_CONTA_PLC, CODIGO_CTRL, COD_CLIENTE,' +
        ' NOME_C, DATA_REC_C, DTORIGINAL_C, TIPO_DOC_C, HISTORICO_C, DATA_VENC_C,' +
        ' VALOR_C, TP_DOC_V, N_DOC_V, N_DOC_C, CODIGO_VEND, CODIGO_FUNC, TIP_CNT,' +
        ' CODIGO_EMP, COD_EMP_MULT, DATA_VENDA, CPFCGC, N_AUT_CART, COD_CRED,' +
        ' COD_CLI_TERC, NOME_TERC, VALOR_LIQUIDO, US_CAD, N_DOCNSU_ADM, COD_TERMINAL_ADM, DESC_TERMINAL_ADM, ' +
        ' NPARCELA, QTDE_PARC, COD_ADM, DESC_ADM, DEB_CRED, COD_BANDEIRA_ADM, DESC_BANDEIRA)' +
        ' VALUES (:N_CONTA_PLC, :CODIGO_CTRL, :COD_CLIENTE, :NOME_C, :DATA_REC_C,' +
        ' :DTORIGINAL_C, :TIPO_DOC_C, :HISTORICO_C, :DATA_VENC_C, :VALOR_C,' +
        ' :TP_DOC_V, :N_DOC_V, :N_DOC_C, :CODIGO_VEND, :CODIGO_FUNC, :TIP_CNT,' +
        ' :CODIGO_EMP, :COD_EMP_MULT, :DATA_VENDA, :CPFCGC, :N_AUT_CART, :COD_CRED,' +
        ' :COD_CLI_TERC, :NOME_TERC, :VALOR_LIQUIDO, :US_CAD, :N_DOCNSU_ADM, :COD_TERMINAL_ADM, :DESC_TERMINAL_ADM, ' +
        ' :NPARCELA, :QTDE_PARC, :COD_ADM, :DESC_ADM, :DEB_CRED, :COD_BANDEIRA_ADM, :DESC_BANDEIRA)';
      vSqlCheques :=
        'INSERT INTO CONTROLE_CHEQUE (N_CONTA_PLC, CODIGO_CTRL, COD_CLIENTE,' +
        ' NOME_CH, DATA_REC, DTORIGINAL_CH, HISTORICO_CH, DATA_VENC, VALOR_CH,' +
        ' TP_DOC_V, N_DOC_V, N_CH, AGENCIA, CONTA, BANCO, COD_CLI_TERC, NOME_TERC,' +
        ' CODIGO_VEND, TIP_CNT, CODIGO_EMP, COD_EMP_MULT, DATA_VENDA, LOTE_ENT, CPFCGC, CODIGO_CH, ID_BANCO, US_CAD)' +
        ' VALUES (:N_CONTA_PLC, :CODIGO_CTRL, :COD_CLIENTE, :NOME_CH, :DATA_REC,' +
        ' :DTORIGINAL_CH, :HISTORICO_CH, :DATA_VENC, :VALOR_CH, :TP_DOC_V, :N_DOC_V,' +
        ' :N_CH, :AGENCIA, :CONTA, :BANCO, :COD_CLI_TERC, :NOME_TERC, :CODIGO_VEND,' +
        ' :TIP_CNT, :CODIGO_EMP, :COD_EMP_MULT, :DATA_VENDA, :LOTE_ENT, :CPFCGC, :CODIGO_CH, :ID_BANCO, :US_CAD)';
      vSqlMovimentoPDV :=
        'INSERT INTO MOVIMENTO_PDV_FINAN (COD_TERMINAL, NSERIEECF, COD_EMPRESA,' +
        ' DATA_MOVIMENTO, OPERADOR, TIPO_MOV, CODIGO_TAB, DESCRICAO_TAB, VALOR_OPERACAO, COD_USUARIO)' +
        ' VALUES (:COD_TERMINAL, :NSERIEECF, :COD_EMPRESA, :DATA_MOVIMENTO,' +
        ' :OPERADOR, :TIPO_MOV, :CODIGO_TAB, :DESCRICAO_TAB, :VALOR_OPERACAO, :COD_USUARIO)';

      vMensagemErro := 'Erro ao Gravar movimento do Terminal . Verificando Movimento do PDV ';

      buscas.Close;
      buscas.SQL.Text := 'select * from movimento_pdv_finan mf' +
        ' where mf.cod_terminal = ' + IntToStr(vNumeroPDV) +
        ' and mf.nserieecf = ' + QuotedStr(vNumeroSerieECF) +
        ' and mf.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and mf.data_movimento = :data' +
        ' and mf.tipo_mov = ''FEC'' ';
      if vOperador > 0 then
        buscas.SQL.Text := buscas.SQL.Text +
          ' and mf.operador = ' + IntToStr(vOperador);
      buscas.ParamByName('data').AsDate := vDataMovimento;
      buscas.Open;

      if buscas.FieldByName('TIPO_MOV').AsString = 'FEC' then
      begin
        //if (vOperador = 0) then
        //  raiseExceptionCreate('Já existe movimento com o operador: '+
        //    buscas.FieldByName('COD_USUARIO').AsString+#13+
        //    'A importação deverá ser efetuada operador por operador' ,'');

        if Trim(buscas.FieldByName('DESCRICAO_TAB').AsString) = 'FECHADO' then
          raiseExceptionCreate('Movimento já foi recebido. Usuário código: ' +
            buscas.FieldByName('COD_USUARIO').AsString, '');

        if Trim(buscas.FieldByName('DESCRICAO_TAB').AsString) = 'RECEBENDO' then
          raiseExceptionCreate('Movimento já esta sendo recebido. Usuário código: ' +
            buscas.FieldByName('COD_USUARIO').AsString, '');
      end
      else
      begin
        vDadosIni.progressoFuncao('', '', 'Iniciando Movimento');

        buscas.Close;
        buscas.SQL.Text := vSqlMovimentoPDV;
        buscas.ParamByName('COD_TERMINAL').AsInteger := vNumeroPDV;
        buscas.ParamByName('NSERIEECF').AsString := vNumeroSerieECF;
        buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.ParamByName('DATA_MOVIMENTO').AsDate := vDataMovimento;
        buscas.ParamByName('OPERADOR').AsInteger := vOperador;
        buscas.ParamByName('TIPO_MOV').AsString := 'FEC';
        buscas.ParamByName('CODIGO_TAB').AsInteger := 0;
        buscas.ParamByName('DESCRICAO_TAB').AsString := 'RECEBENDO';
        buscas.ParamByName('VALOR_OPERACAO').AsFloat := 0;
        buscas.ParamByName('COD_USUARIO').AsInteger := vDadosIni.vCodUsuario;
        buscas.ExecSQL;
        CommitaTransacao;
      end;

      //Definindo variaveis usadas no processo
      buscas.Close;
      buscas.SQL.Text := ' select * from Cont_Lig ' +
      	' where cod_emp = ' + vDadosIni.codEmpresa;
      buscas.Open;
      vNumContaVendaProdutos := buscas.FieldByName('NCON_V_PROD').AsFloat;

      buscas.Close;
      buscas.SQL.Text := ' select * from P_Contas ' +
      	' where ativo = 1 ' +
        ' and n_conta_plc = :n_conta_plc ' +
        ' order by desc_plc ';
      buscas.ParamByName('N_CONTA_PLC').AsFloat := vNumContaVendaProdutos;
      buscas.Open;
      vTipoPLC := buscas.FieldByName('TIPO_PLC').AsString;

      buscas.Close;
      buscas.SQL.Text := ' select max(fd.dia_fcd) dia_fcd from fech_Dia fd ' +
      	' where fd.codigo_emp = ' + vDadosIni.codEmpresa;
      buscas.Open;
      vDiaFinanceiroFechado := buscas.FieldByName('dia_fcd').AsDateTime;

      vValorDinheiroAcumulado := 0;
      //Fim

      vDadosIni.progressoFuncao('', '', 'Efetuando Lançamentos consolidados');

      vLancConsolidados.First;
      while not vLancConsolidados.Eof do
      begin
        vCtrl._abrirControles(vLancConsolidados.FieldByName('cod_controle').AsInteger);
        if (Trim(vCtrl.dataSet.FieldByName('docs').AsString) = 'N') and (vAgruparDinheiro) and
         (vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger = 1) then
        begin
          vValorDinheiroAcumulado := vValorDinheiroAcumulado +
            vLancConsolidados.FieldByName('VALOR').AsFloat;
        end
        else if Trim(vCtrl.dataSet.FieldByName('docs').AsString) = 'S1' then
        begin
          //Definindo mensagem de erro caso ocorra
          vMensagemErro := 'Erro ao processar Créditos. Lançamento controle' +
            vLancConsolidados.FieldByName('cod_controle').AsString;
          //Insert lancamentos
          buscas.close;
          buscas.SQL.Text := vSqlLancamentos;
          vCodLancamentoCheque := Gencodigo('LANCAMENTOS', dtmImportPDVFinan.SpIncCodigo,
            vDadosIni.codEmpresa);
          buscas.ParamByName('COD_LANC').AsInteger := vCodLancamentoCheque;
          buscas.ParamByName('N_CONTA_PLC').AsFloat := vNumContaVendaProdutos;
          buscas.ParamByName('CODIGO_CTRL').AsInteger :=
            vLancConsolidados.FieldByName('cod_controle').AsInteger;
          buscas.ParamByName('DATA').AsDate := vDiaFinanceiroFechado + 1;
          buscas.ParamByName('DTREFERENCIA').AsDate := vDiaFinanceiroFechado + 1;
          if (vOperador > 0) then
            buscas.ParamByName('HISTORICO_L').AsString :=
              Trim(copy('CHEQUES REF. A VENDAS CONF OPERADOR ' + IntToStr(vOperador), 1, 100))
          else
            buscas.ParamByName('HISTORICO_L').AsString :=
              Trim(copy('ENTRADA DE CHEQUES REF. A VENDAS', 1, 100));
          buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ParamByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ParamByName('TIPO_L').AsString := copy(vTipoPLC, 1, 1);
          buscas.ParamByName('VALOR_L').AsFloat := vLancConsolidados.FieldByName('VALOR').AsFloat;
          buscas.ParamByName('LANC_VENDA').AsString := 'S';
          buscas.ParamByName('TIP_CNT').AsString := 'C';
          //buscas.ParamByName('NDOC_L').AsString:=vLancamentos.FieldByName('NDOC').AsString;
          //buscas.ParamByName('LOTE_ENT').as:=vLancamentos.FieldByName('TIPDOC').As;
          buscas.ExecSQL;
          _addFLancamentos(vCodLancamentoCheque,
            vLancConsolidados.FieldByName('cod_controle').AsInteger, 'CH');
        end
        else if Trim(vCtrl.dataSet.FieldByName('docs').AsString) = 'S2' then
        begin
          //Definindo mensagem de erro caso ocorra
          vMensagemErro := 'Erro ao processar Créditos. Lançamento controle' +
            vLancConsolidados.FieldByName('cod_controle').AsString;
          //Insert lancamentos
          buscas.close;
          buscas.SQL.Text := vSqlLancamentos;
          vCodLancamentoCreditos := Gencodigo('LANCAMENTOS', dtmImportPDVFinan.SpIncCodigo,
            vDadosIni.codEmpresa);
          buscas.ParamByName('COD_LANC').AsInteger := vCodLancamentoCreditos;
          buscas.ParamByName('N_CONTA_PLC').AsFloat := vNumContaVendaProdutos;
          buscas.ParamByName('CODIGO_CTRL').AsInteger :=
            vLancConsolidados.FieldByName('cod_controle').AsInteger;
          buscas.ParamByName('DATA').AsDate := vDiaFinanceiroFechado + 1;
          buscas.ParamByName('DTREFERENCIA').AsDate := vDiaFinanceiroFechado + 1;
          if (vOperador > 0) then
            buscas.ParamByName('HISTORICO_L').AsString :=
              Trim(copy(trim(vLancConsolidados.FieldByName('NOME_CTRL').AsString) +
              ' VENDAS CONF. OPERADOR ' + IntToStr(vOperador), 1, 100))
          else
            buscas.ParamByName('HISTORICO_L').AsString :=
              Trim(copy('ENTRADA DE CREDITOS REF. A VENDAS CUPOM', 1, 100));
          buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ParamByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ParamByName('TIPO_L').AsString := copy(vTipoPLC, 1, 1);
          buscas.ParamByName('VALOR_L').AsFloat := vLancConsolidados.FieldByName('VALOR').AsFloat;
          buscas.ParamByName('LANC_VENDA').AsString := 'S';
          buscas.ParamByName('TIP_CNT').AsString := 'C';
          //buscas.ParamByName('NDOC_L').AsString:=vLancamentos.FieldByName('NDOC').AsString;
          //buscas.ParamByName('LOTE_ENT').as:=vLancamentos.FieldByName('TIPDOC').As;
          buscas.ExecSQL;
          _addFLancamentos(vCodLancamentoCreditos,
            vLancConsolidados.FieldByName('cod_controle').AsInteger, 'C');
        end;
        vLancConsolidados.Next;
      end;

      if vAgruparDinheiro then
      begin
        //Definindo mensagem de erro caso ocorra
        vMensagemErro := 'Erro ao processar Créditos. Agrupamento em Dinheiro';
        //Insert lancamentos
        buscas.close;
        buscas.SQL.Text := vSqlLancamentos;
        buscas.ParamByName('COD_LANC').AsInteger :=
          Gencodigo('LANCAMENTOS', dtmImportPDVFinan.SpIncCodigo, vDadosIni.codEmpresa);
        buscas.ParamByName('N_CONTA_PLC').AsFloat := vNumContaVendaProdutos;
        if vOperador > 0 then
          buscas.ParamByName('HISTORICO_L').AsString :=
            Trim(copy('ENTRADA DINHEIRO VENDAS CONF OPERADOR ' + IntToStr(vOperador), 1, 100))
        else
          buscas.ParamByName('HISTORICO_L').AsString :=
            Trim(copy('ENTRADA DINHEIRO VENDAS ', 1, 100));
        buscas.ParamByName('VALOR_L').AsFloat := vValorDinheiroAcumulado;
        buscas.ParamByName('CODIGO_CTRL').AsInteger := 1;
        buscas.ParamByName('TIPO_L').AsString := 'E';
        buscas.ParamByName('DATA').AsDate := vDiaFinanceiroFechado + 1;
        buscas.ParamByName('DTREFERENCIA').AsDate := vDiaFinanceiroFechado + 1;
        buscas.ParamByName('NDOC_L').AsString := '';
        buscas.ParamByName('TIP_CNT').AsString := 'C';
        buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.ParamByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.ParamByName('LANC_VENDA').AsString := 'S';
        //buscas.ParamByName('LOTE_ENT').as:=vLancamentos.FieldByName('TIPDOC').As;
        buscas.ExecSQL;
      end;

      vDadosIni.progressoFuncao('', '', 'Efetuando Lançamentos dos Documentos');

      vLancamentos.First;
      while not vLancamentos.Eof do
      begin
        if Trim(vLancamentos.FieldByName('TIPDOC').AsString) = 'N' then
        begin
          if (vAgruparDinheiro) and (vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger = 1) then
            vValorDinheiroAcumulado := vValorDinheiroAcumulado +
              vLancamentos.FieldByName('VALORDOC').AsFloat
          else
          begin
            //Definindo mensagem de erro caso ocorra
            vMensagemErro := 'Erro ao processar Créditos. Cupom ' +
              vLancamentos.FieldByName('nrequisicao').AsString;
            //Insert lancamentos
            buscas.close;
            buscas.SQL.Text := vSqlLancamentos;
            buscas.ParamByName('COD_LANC').AsInteger :=
              Gencodigo('LANCAMENTOS', dtmImportPDVFinan.SpIncCodigo, vDadosIni.codEmpresa);
            if vLancamentos.FieldByName('N_CONTA_PLC').AsFloat > 0 then
              buscas.ParamByName('N_CONTA_PLC').AsFloat :=
                vLancamentos.FieldByName('N_CONTA_PLC').AsFloat
            else
              buscas.ParamByName('N_CONTA_PLC').AsFloat := vNumContaVendaProdutos;
            buscas.ParamByName('HISTORICO_L').AsString :=
              Trim(copy('ENTRADA DINHEIRO VENDAS CONF. ' +
              vLancamentos.FieldByName('TPDOCS').AsString + ' ' +
              vDadosIni.StrZero(vLancamentos.FieldByName('NREQUISICAO').AsInteger, 6), 1, 100));
            buscas.ParamByName('VALOR_L').AsFloat := vLancamentos.FieldByName('VALORDOC').AsFloat;
            buscas.ParamByName('CODIGO_CTRL').AsInteger :=
              vLancamentos.FieldByName('COD_CONTROLE').AsInteger;
            buscas.ParamByName('TIPO_L').AsString := copy(vTipoPLC, 1, 1);
            buscas.ParamByName('DATA').AsDate := vDiaFinanceiroFechado + 1;
            buscas.ParamByName('DTREFERENCIA').AsDate := vDiaFinanceiroFechado + 1;
            buscas.ParamByName('NDOC_L').AsString :=
              Trim(copy(vLancamentos.FieldByName('NDOC').AsString, 1, 10));
            buscas.ParamByName('TIP_CNT').AsString :=
              copY(vLancamentos.FieldByName('TIP_CNT').AsString, 1, 1);
            buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
            buscas.ParamByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
            buscas.ParamByName('LANC_VENDA').AsString := 'S';
            //buscas.ParamByName('LOTE_ENT').as:=vLancamentos.FieldByName('TIPDOC').As;
            vCodigoTemp := buscas.ParamByName('COD_LANC').AsInteger;
            buscas.ExecSQL;
            //            vLancamentos.Edit;
            //            vLancamentos.FieldByName('n_processamento').AsInteger := vCodigoTemp;
            //            vLancamentos.Post;
          end;
        end
        else if Trim(vLancamentos.FieldByName('TIPDOC').AsString) = 'S1' then
        begin
          //Definindo mensagem de erro caso ocorra
          vMensagemErro := 'Erro ao processar Créditos. Cheque Número: ' +
            vLancamentos.FieldByName('NDOC').AsString;
          //Atribuindo variaveis
          buscas.Close;
          buscas.SQL.Text := 'select cpfcgc from clientes where cod_cliente = ' +
            IntToStr(vLancamentos.FieldByName('cod_cliente').AsInteger) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa;
          buscas.Open;
          vCPFCGCCliente := buscas.FieldByName('cpfcgc').AsString;

          //Insert Cheques
          buscas.close;
          buscas.SQL.Text := vSqlCheques;
          vCodigoTemp := Gencodigo('CONTROLE_CHEQUE', dtmImportPDVFinan.SpIncCodigo,
            vDadosIni.codEmpresa);
          vDadosIni.hw_registra_estatistica('CONTROLE_CHEQUE');
          buscas.ParamByName('CODIGO_CH').AsInteger := vCodigoTemp;
          if vLancamentos.FieldByName('N_CONTA_PLC').AsFloat > 0 then
            buscas.ParamByName('N_CONTA_PLC').AsFloat :=
              vLancamentos.FieldByName('N_CONTA_PLC').AsFloat
          else
            buscas.ParamByName('N_CONTA_PLC').AsFloat := vNumContaVendaProdutos;
          buscas.ParamByName('CODIGO_CTRL').AsInteger :=
            vLancamentos.FieldByName('COD_CONTROLE').AsInteger;
          buscas.ParamByName('COD_CLIENTE').AsInteger :=
            vLancamentos.FieldByName('COD_CLIENTE').AsInteger;
          buscas.ParamByName('NOME_CH').AsString :=
            Trim(copy(vLancamentos.FieldByName('CLIENTE').AsString, 1, 35));
          buscas.ParamByName('DATA_REC').AsDate := vDiaFinanceiroFechado + 1;
          buscas.ParamByName('DTORIGINAL_CH').AsDate := vDiaFinanceiroFechado + 1;

          if ((vDadosIni.vRecibo.HabRecPorDepart) and (trim(vLancamentos.FieldByName('TPDOCS').AsString) = 'REC')) then
          begin
            buscas2.Close;
            buscas2.SQL.Text := ' select trim(num_rec_dep) num_rec_dep from recibos ' +
            	' where nrecibo = :nrecibo and cod_empresa = :cod_empresa ';
            buscas2.ParamByName('NRECIBO').AsInteger := vLancamentos.FieldByName('NREQUISICAO').AsInteger;
          	buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
            buscas2.Open;

          	buscas.ParamByName('HISTORICO_CH').AsString := Trim(copy('VENDAS CHQ CONF. ' +
              vLancamentos.FieldByName('TPDOCS').AsString + ' ' +
              vDadosIni.IfThen(buscas2.IsEmpty,
              vDadosIni.StrZero(vLancamentos.FieldByName('NREQUISICAO').AsInteger, 6),
              buscas2.FieldByName('NUM_REC_DEP').AsString), 1, 100));
          end
          else
          begin
            buscas.ParamByName('HISTORICO_CH').AsString := Trim(copy('VENDAS CHQ CONF. ' +
              vLancamentos.FieldByName('TPDOCS').AsString + ' ' +
              vDadosIni.StrZero(vLancamentos.FieldByName('NREQUISICAO').AsInteger, 6), 1, 100));
          end;
          buscas.ParamByName('DATA_VENC').AsDate :=
            vLancamentos.FieldByName('DATA_VENC').AsDateTime;
          buscas.ParamByName('VALOR_CH').AsFloat := vLancamentos.FieldByName('VALORDOC').AsFloat;
          buscas.ParamByName('TP_DOC_V').AsString := 'CUP';
          buscas.ParamByName('N_DOC_V').AsInteger :=
            vLancamentos.FieldByName('NREQUISICAO').AsInteger;
          buscas.ParamByName('N_CH').AsString :=
            Trim(copy(vLancamentos.FieldByName('NDOC').AsString, 1, 20));
          buscas.ParamByName('AGENCIA').AsString :=
            Trim(copy(vLancamentos.FieldByName('AGENCIA').AsString, 1, 10));
          buscas.ParamByName('CONTA').AsString :=
            Trim(copy(vLancamentos.FieldByName('CONTA').AsString, 1, 15));
          buscas.ParamByName('BANCO').AsString :=
            Trim(copy(vLancamentos.FieldByName('BANCO').AsString, 1, 35));
          buscas.ParamByName('ID_BANCO').AsString :=
            Trim(copy(vLancamentos.FieldByName('COD_BANCO_STR').AsString, 1, 11));
          buscas.ParamByName('COD_CLI_TERC').AsInteger :=
            vLancamentos.FieldByName('COD_CLI_TERC').AsInteger;
          buscas.ParamByName('NOME_TERC').AsString := Trim(copy(
            vLancamentos.FieldByName('TERCEIROS').AsString, 1, 35));
          buscas.ParamByName('CODIGO_VEND').AsInteger :=
            vLancamentos.FieldByName('OPERADOR').AsInteger;
          buscas.ParamByName('TIP_CNT').AsString :=
            copy(vLancamentos.FieldByName('TIP_CNT').AsString, 1, 1);
          buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ParamByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ParamByName('DATA_VENDA').AsDate :=
            vLancamentos.FieldByName('DATA_MOV').AsDateTime;
          //buscas.ParamByName('LOTE_ENT').AsValue := vLancamentos.FieldByName('LOTE_ENT').AsValue;
          buscas.ParamByName('CPFCGC').AsString := vCPFCGCCliente;
          buscas.ParamByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
          buscas.ExecSQL;

          buscas.Close;
          buscas.SQL.Text := 'INSERT INTO LANCCHEQUE (COD_LANC, CODIGO_CH, CODIGO_EMP)' +
            ' VALUES (:COD_LANC, :CODIGO_CH, :CODIGO_EMP)';
          buscas.ParamByName('COD_LANC').AsInteger :=
            _getCodigoLancamento(vLancamentos.FieldByName('COD_CONTROLE').AsInteger);
          buscas.ParamByName('CODIGO_CH').AsInteger := vCodigoTemp;
          buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ExecSQL;

          vLancamentos.Edit;
          vLancamentos.FieldByName('n_processamento').AsInteger := vCodigoTemp;
          vLancamentos.Post;
        end
        else if Trim(vLancamentos.FieldByName('TIPDOC').AsString) = 'S2' then
        begin
          //Definindo mensagem de erro caso ocorra
          vMensagemErro := 'Erro ao processar Créditos. Documento Número: ' +
            vLancamentos.FieldByName('NDOC').AsString;
          //Atribucao de variaveis
          vCtrl._abrirControles(vLancamentos.FieldByName('cod_controle').AsInteger);
          vNomeControle := Trim(vCtrl.dataSet.FieldByName('nome_ctrl').AsString);
          buscas.Close;
          buscas.SQL.Text := 'select cpfcgc from clientes where cod_cliente = ' +
            IntToStr(vLancamentos.FieldByName('cod_cliente').AsInteger) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa;
          buscas.Open;
          vCPFCGCCliente := buscas.FieldByName('cpfcgc').AsString;

          vCOD_ADM := 0;
          vDESC_ADM := '';
          if Trim(vLancamentos.FieldByName('COD_TERMINAL_ADM').AsString) <> '' then
          begin
            buscas.Close;
            buscas.SQL.Text := ' select tc.cod_adm, ac.descricao_adm from terminal_cartao tc ' +
              ' left join adm_cartao ac on ac.cod_adm = tc.cod_adm and ac.cod_empresa = tc.cod_empresa ' +
              ' where tc.cod_term_adm = ' + QuotedStr(Trim(vLancamentos.FieldByName('COD_TERMINAL_ADM').AsString)) +
              ' and tc.cod_empresa = ' + vDadosIni.codEmpresa;
            buscas.Open;
            vCOD_ADM := buscas.FieldByName('COD_ADM').AsInteger;
            vDESC_ADM := trim(Copy(buscas.FieldByName('DESCRICAO_ADM').AsString, 1, 30));
          end;

          //Insert's creditos
          buscas.close;
          buscas.SQL.Text := vSqlCreditos;
          vCodigoTemp := Gencodigo('CONTROLE_CREDITOS', dtmImportPDVFinan.SpIncCodigo,
            vDadosIni.codEmpresa);
          vDadosIni.hw_registra_estatistica('CONTROLE_CREDITOS');
          buscas.ParamByName('COD_CRED').AsInteger := vCodigoTemp;
          if vLancamentos.FieldByName('N_CONTA_PLC').AsFloat > 0 then
            buscas.ParamByName('N_CONTA_PLC').AsFloat :=
              vLancamentos.FieldByName('N_CONTA_PLC').AsFloat
          else
            buscas.ParamByName('N_CONTA_PLC').AsFloat := vNumContaVendaProdutos;
          buscas.ParamByName('CODIGO_CTRL').AsInteger :=
            vLancamentos.FieldByName('COD_CONTROLE').AsInteger;
          buscas.ParamByName('COD_CLIENTE').AsInteger :=
            vLancamentos.FieldByName('COD_CLIENTE').AsInteger;
          buscas.ParamByName('NOME_C').AsString :=
            Trim(copy(vLancamentos.FieldByName('CLIENTE').AsString, 1, 35));
          buscas.ParamByName('DATA_REC_C').AsDate := vDiaFinanceiroFechado + 1;
          buscas.ParamByName('DTORIGINAL_C').AsDate := vDiaFinanceiroFechado + 1;
          buscas.ParamByName('TIPO_DOC_C').AsString := Trim(copy(vNomeControle, 1, 15));

          if ((vDadosIni.vRecibo.HabRecPorDepart) and (trim(vLancamentos.FieldByName('TPDOCS').AsString) = 'REC')) then
          begin
            buscas2.Close;
            buscas2.SQL.Text := ' select trim(num_rec_dep) num_rec_dep from recibos ' +
            	' where nrecibo = :nrecibo and cod_empresa = :cod_empresa ';
            buscas2.ParamByName('NRECIBO').AsInteger := vLancamentos.FieldByName('NREQUISICAO').AsInteger;
          	buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
            buscas2.Open;

          	buscas.ParamByName('HISTORICO_C').AsString := Trim(copy(
            	'VENDAS CONF. ' + vLancamentos.FieldByName('TPDOCS').AsString + ' ' +
              vDadosIni.IfThen(buscas2.IsEmpty,
              vDadosIni.StrZero(vLancamentos.FieldByName('NREQUISICAO').AsInteger, 6),
              buscas2.FieldByName('NUM_REC_DEP').AsString), 1, 30));
          end
          else
          begin
            buscas.ParamByName('HISTORICO_C').AsString := Trim(copy(
              'VENDAS CONF. ' + vLancamentos.FieldByName('TPDOCS').AsString + ' ' +
              vDadosIni.strzero(vLancamentos.FieldByName('NREQUISICAO').AsString, 6), 1, 30));
          end;
          buscas.ParamByName('DATA_VENC_C').AsDate :=
            vLancamentos.FieldByName('DATA_VENC').AsDateTime;
          buscas.ParamByName('VALOR_C').AsFloat := vLancamentos.FieldByName('VALORDOC').AsFloat;

          vDadosIni.CalcularTaxaCartao(buscas2,
           0,
           vLancamentos.FieldByName('NREQUISICAO').AsInteger,
           vLancamentos.FieldByName('TPDOCS').AsString,
           vLancamentos.FieldByName('COD_CONTROLE').AsInteger,
           vCtrl.dataSet.FieldByName('TP_PLANO').AsString,
           vLancamentos.FieldByName('COD_TERMINAL_ADM').AsString,
           vLancamentos.FieldByName('COD_BANDEIRA_ADM').AsInteger,
           vLancamentos.FieldByName('DEB_CRED').AsString,
           vLancamentos.FieldByName('QTDE_PARC').AsInteger,
           vDadosIni.IfThen(vLancamentos.FieldByName('VALORDOC_LIQ').AsFloat > 0,
           	 vLancamentos.FieldByName('VALORDOC_LIQ').AsFloat,
             vLancamentos.FieldByName('VALORDOC').AsFloat),
           vLancamentos.FieldByName('VALORDOC').AsFloat,
           vCtrl.dataSet.FieldByName('TAXA_CARTAO').AsFloat,
           false,
           vNovoValorLiquido);
          buscas.ParamByName('VALOR_LIQUIDO').AsFloat := vNovoValorLiquido;

          buscas.ParamByName('TP_DOC_V').AsString := 'CUP';
          buscas.ParamByName('N_DOC_V').AsInteger :=
            vLancamentos.FieldByName('NREQUISICAO').AsInteger;
          buscas.ParamByName('N_DOC_C').AsString :=
            Trim(copy(vLancamentos.FieldByName('NDOC').AsString, 1, 20));
          buscas.ParamByName('CODIGO_VEND').AsInteger :=
            vLancamentos.FieldByName('OPERADOR').AsInteger;
          buscas.ParamByName('CODIGO_FUNC').AsInteger := vDadosIni.vCodUsuario;
          buscas.ParamByName('TIP_CNT').AsString :=
            copy(vLancamentos.FieldByName('TIP_CNT').AsString, 1, 1);
          buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ParamByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ParamByName('DATA_VENDA').AsDate :=
            vLancamentos.FieldByName('DATA_MOV').AsDateTime;
          buscas.ParamByName('N_AUT_CART').AsString := Trim(copy(
            vLancamentos.FieldByName('N_AUT_CART').AsString, 1, 20));
          buscas.ParamByName('N_DOCNSU_ADM').AsString := Trim(copy(
            vLancamentos.FieldByName('N_DOCNSU_ADM').AsString, 1, 10));
          buscas.ParamByName('COD_TERMINAL_ADM').AsString := Trim(copy(
            vLancamentos.FieldByName('COD_TERMINAL_ADM').AsString, 1, 10));
          buscas.ParamByName('DESC_TERMINAL_ADM').AsString := Trim(copy(
            vLancamentos.FieldByName('DESC_TERMINAL_ADM').AsString, 1, 30));
          buscas.ParamByName('COD_BANDEIRA_ADM').AsInteger :=
            vLancamentos.FieldByName('COD_BANDEIRA_ADM').AsInteger;
          buscas.ParamByName('DESC_BANDEIRA').AsString :=
            vLancamentos.FieldByName('DESC_BANDEIRA').AsString;
          buscas.ParamByName('NPARCELA').AsInteger :=
            vLancamentos.FieldByName('NPARCELA').AsInteger;
          buscas.ParamByName('QTDE_PARC').AsInteger :=
            vLancamentos.FieldByName('QTDE_PARC').AsInteger;
          buscas.ParamByName('DEB_CRED').AsString :=
            vLancamentos.FieldByName('DEB_CRED').AsString;

          if vCOD_ADM > 0 then
          begin
            buscas.ParamByName('COD_ADM').AsInteger := vCOD_ADM;
            buscas.ParamByName('DESC_ADM').AsString := Copy(trim(vDESC_ADM), 1, 30);
          end
          else
          begin
            buscas.ParamByName('COD_ADM').Value := Null;
            buscas.ParamByName('DESC_ADM').Value := Null;
          end;

          buscas.ParamByName('COD_CLI_TERC').AsInteger :=
            vLancamentos.FieldByName('COD_CLI_TERC').AsInteger;
          buscas.ParamByName('NOME_TERC').AsString := Trim(copy(
            vLancamentos.FieldByName('TERCEIROS').AsString, 1, 35));
          buscas.ParamByName('CPFCGC').AsString := Trim(copy(vCPFCGCCliente, 1, 18));
          buscas.ParamByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
          buscas.ExecSQL;

          buscas.Close;
          buscas.SQL.Text := 'INSERT INTO CREDITOS_LANC ( COD_LANC, COD_CRED, CODIGO_EMP)' +
            ' VALUES ( :COD_LANC, :COD_CRED, :CODIGO_EMP)';
          buscas.ParamByName('COD_LANC').AsInteger :=
            _getCodigoLancamento(vLancamentos.FieldByName('COD_CONTROLE').AsInteger);
          buscas.ParamByName('COD_CRED').AsInteger := vCodigoTemp;
          buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ExecSQL;

          vLancamentos.Edit;
          vLancamentos.FieldByName('n_processamento').AsInteger := vCodigoTemp;
          vLancamentos.Post;
        end;
        vLancamentos.Next;
      end;

      vDadosIni.progressoFuncao('', '', 'Finalizando Movimento');

      buscas.Close;
      buscas.SQL.Text := 'select * from movimento_pdv_finan mf' +
        ' where mf.cod_terminal = ' + IntToStr(vNumeroPDV) +
        ' and mf.nserieecf = ' + QuotedStr(vNumeroSerieECF) +
        ' and mf.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and mf.data_movimento = :data' +
        ' and mf.tipo_mov = ''FEC'' ' +
        ' and mf.operador = ' + IntToStr(vOperador);
      buscas.ParamByName('data').AsDate := vDataMovimento;
      buscas.Open;

      if (buscas.FieldByName('TIPO_MOV').AsString = 'FEC') and
        (buscas.FieldByName('DESCRICAO_TAB').AsString = 'RECEBENDO') then
      begin
        buscas.Close;
        buscas.SQL.Text := vSqlMovimentoPDV;

        vMeioPg.dataSet.First;
        while not vMeioPg.dataSet.Eof do
        begin
          //Definindo mensagem de erro caso ocorra
          vMensagemErro := 'Erro ao Gravar movimento do Terminal . Meios de Pagamento ' +
            vMeioPg.dataSet.FieldByName('finalizador').AsString;

          buscas.Close;
          buscas.ParamByName('COD_TERMINAL').AsInteger := vNumeroPDV;
          buscas.ParamByName('NSERIEECF').AsString := vNumeroSerieECF;
          buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ParamByName('DATA_MOVIMENTO').AsDate := vDataMovimento;
          buscas.ParamByName('OPERADOR').AsInteger := vOperador;
          buscas.ParamByName('TIPO_MOV').AsString := 'PDV';
          buscas.ParamByName('CODIGO_TAB').AsInteger :=
            vMeioPg.dataSet.FieldByName('finalizador').AsInteger;
          buscas.ParamByName('DESCRICAO_TAB').AsString :=
            vMeioPg.dataSet.FieldByName('descricao').AsString;
          buscas.ParamByName('VALOR_OPERACAO').AsFloat :=
            vMeioPg.dataSet.FieldByName('valor').AsFloat;
          buscas.ParamByName('COD_USUARIO').AsInteger :=
            vDadosIni.vCodUsuario;
          buscas.ExecSQL;
          vMeioPg.dataSet.Next;
        end;

        vLancConsolidados.First;
        while not vLancConsolidados.Eof do
        begin
          //Definindo mensagem de erro caso ocorra
          vMensagemErro := 'Erro ao Gravar movimento do Terminal . Controle ' +
            vLancConsolidados.FieldByName('cod_controle').AsString;
          buscas.Close;
          buscas.ParamByName('COD_TERMINAL').AsInteger := vNumeroPDV;
          buscas.ParamByName('NSERIEECF').AsString := vNumeroSerieECF;
          buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
          buscas.ParamByName('DATA_MOVIMENTO').AsDate := vDataMovimento;
          buscas.ParamByName('OPERADOR').AsInteger := vOperador;
          buscas.ParamByName('TIPO_MOV').AsString := 'FIN';
          buscas.ParamByName('CODIGO_TAB').AsInteger :=
            vLancConsolidados.FieldByName('cod_controle').AsInteger;
          buscas.ParamByName('DESCRICAO_TAB').AsString :=
            vLancConsolidados.FieldByName('nome_ctrl').AsString;
          buscas.ParamByName('VALOR_OPERACAO').AsFloat :=
            vLancConsolidados.FieldByName('valor').AsFloat;
          buscas.ParamByName('COD_USUARIO').AsInteger :=
            vDadosIni.vCodUsuario;
          buscas.ExecSQL;
          vLancConsolidados.Next;
        end;

        buscas.Close;
        buscas.SQL.Text := 'update movimento_pdv_finan mf' +
          ' set mf.DESCRICAO_TAB = ''FECHADO'' ' +
          ' where mf.cod_terminal = ' + IntToStr(vNumeroPDV) +
          ' and mf.nserieecf = ' + QuotedStr(vNumeroSerieECF) +
          ' and mf.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and mf.data_movimento = :data' +
          ' and mf.tipo_mov = ''FEC'' ' +
          ' and mf.operador = ' + IntToStr(vOperador);
        buscas.ParamByName('data').AsDate := vDataMovimento;
        buscas.ExecSQL;
      end;

      vDadosIni.progressoFuncao('', '', 'Salvando histórico do processamento');

      buscas.Close;
      buscas.SQL.Text :=
        ' INSERT INTO FORMPAGAMENTO ( N_CONTA_PLC, TPDOCS, TIPDOC, VALORDOC, HISTORICO,' +
        ' NREQUISICAO, COD_CONTROLE, NDOC, TIP_CNT, CLIENTE, DATA_VENC, AGENCIA, CONTA,' +
        ' BANCO, COD_CLI_TERC, TERCEIROS, OPERADOR, DATA_MOV, COD_CLIENTE, N_AUT_CART,' +
        ' COD_BANCO, N_PROCESSAMENTO, SEQFORM, COD_EMPRESA, VALOR_CONTABIL, PRCSS, COD_BANCO_STR,' +
        ' US_CAD, N_DOCNSU_ADM, COD_TERMINAL_ADM, DESC_TERMINAL_ADM, NPARCELA, QTDE_PARC,' +
        ' DEB_CRED, COD_BANDEIRA_ADM, DESC_BANDEIRA)' +
        ' VALUES ( :N_CONTA_PLC, :TPDOCS, :TIPDOC, :VALORDOC, :HISTORICO, :NREQUISICAO,' +
        ' :COD_CONTROLE, :NDOC, :TIP_CNT, :CLIENTE, :DATA_VENC, :AGENCIA, :CONTA, :BANCO,' +
        ' :COD_CLI_TERC, :TERCEIROS, :OPERADOR, :DATA_MOV, :COD_CLIENTE, :N_AUT_CART,' +
        ' :COD_BANCO, :N_PROCESSAMENTO, :SEQFORM, :COD_EMPRESA, :VALOR_CONTABIL, :PRCSS,' +
        ' :COD_BANCO_STR, :US_CAD, :N_DOCNSU_ADM, :COD_TERMINAL_ADM, :DESC_TERMINAL_ADM, :NPARCELA, :QTDE_PARC,' +
        ' :DEB_CRED, :COD_BANDEIRA_ADM, :DESC_BANDEIRA)';

      vLancamentos.First;
      while not vLancamentos.Eof do
      begin
        //Definindo mensagem de erro caso ocorra
        vMensagemErro := 'Erro ao Gravar movimento do Terminal . Historico Formpagamento ' + #13 +
          vLancamentos.FieldByName('TPDOCS').AsString + ' ' +
          vLancamentos.FieldByName('TIPDOC').AsString + ' ' +
          ' Doc ' + vLancamentos.FieldByName('NDOC').AsString + ' ' +
          ' Cupom ' + vLancamentos.FieldByName('NREQUISICAO').AsString;

        buscas.Close;
        buscas.ParamByName('N_CONTA_PLC').Value := vLancamentos.FieldByName('N_CONTA_PLC').Value;
        buscas.ParamByName('TPDOCS').AsString := Trim(copy(vLancamentos.FieldByName('TPDOCS').AsString, 1, 6));
        buscas.ParamByName('TIPDOC').AsString := Trim(copy(vLancamentos.FieldByName('TIPDOC').AsString, 1, 2));
        buscas.ParamByName('VALORDOC').AsCurrency := vLancamentos.FieldByName('VALORDOC').AsCurrency;
        buscas.ParamByName('VALOR_CONTABIL').AsCurrency := vLancamentos.FieldByName('VALORDOC').AsCurrency;
        buscas.ParamByName('HISTORICO').AsString := Trim(copy(vLancamentos.FieldByName('HISTORICO').AsString, 1, 80));
        buscas.ParamByName('NREQUISICAO').AsInteger := vLancamentos.FieldByName('NREQUISICAO').AsInteger;
        buscas.ParamByName('COD_CONTROLE').AsInteger := vLancamentos.FieldByName('COD_CONTROLE').AsInteger;
        buscas.ParamByName('NDOC').Value := vLancamentos.FieldByName('NDOC').Value;
        buscas.ParamByName('TIP_CNT').AsString := copy(vLancamentos.FieldByName('TIP_CNT').AsString, 1, 1);
        buscas.ParamByName('CLIENTE').Value := vLancamentos.FieldByName('CLIENTE').Value;
        buscas.ParamByName('DATA_VENC').Value := vLancamentos.FieldByName('DATA_VENC').Value;
        buscas.ParamByName('AGENCIA').Value := vLancamentos.FieldByName('AGENCIA').Value;
        buscas.ParamByName('CONTA').Value := vLancamentos.FieldByName('CONTA').Value;
        buscas.ParamByName('BANCO').Value := vLancamentos.FieldByName('BANCO').Value;
        buscas.ParamByName('COD_CLI_TERC').Value := vLancamentos.FieldByName('COD_CLI_TERC').Value;
        buscas.ParamByName('TERCEIROS').Value := vLancamentos.FieldByName('TERCEIROS').Value;
        buscas.ParamByName('OPERADOR').Value := vLancamentos.FieldByName('OPERADOR').Value;
        buscas.ParamByName('DATA_MOV').Value := vLancamentos.FieldByName('DATA_MOV').Value;
        buscas.ParamByName('COD_CLIENTE').AsInteger := vLancamentos.FieldByName('COD_CLIENTE').AsInteger;
        buscas.ParamByName('N_AUT_CART').Value := vLancamentos.FieldByName('N_AUT_CART').Value;
        buscas.ParamByName('N_DOCNSU_ADM').Value := vLancamentos.FieldByName('N_DOCNSU_ADM').Value;
        buscas.ParamByName('COD_TERMINAL_ADM').Value := vLancamentos.FieldByName('COD_TERMINAL_ADM').Value;
        buscas.ParamByName('DESC_TERMINAL_ADM').Value := vLancamentos.FieldByName('DESC_TERMINAL_ADM').Value;
        buscas.ParamByName('NPARCELA').Value := vLancamentos.FieldByName('NPARCELA').Value;
        buscas.ParamByName('QTDE_PARC').Value := vLancamentos.FieldByName('QTDE_PARC').Value;
        buscas.ParamByName('DEB_CRED').Value := vLancamentos.FieldByName('DEB_CRED').Value;
        buscas.ParamByName('COD_BANDEIRA_ADM').Value := vLancamentos.FieldByName('COD_BANDEIRA_ADM').Value;
        buscas.ParamByName('DESC_BANDEIRA').Value := vLancamentos.FieldByName('DESC_BANDEIRA').Value;
        try
          buscas.ParamByName('COD_BANCO').Value := vLancamentos.FieldByName('COD_BANCO').Value;
        except
        end;
        buscas.ParamByName('N_PROCESSAMENTO').Value :=
          vLancamentos.FieldByName('N_PROCESSAMENTO').Value;
        buscas.ParamByName('SEQFORM').AsInteger := Gencodigo('FORMPAGAMENTO',
          dtmImportPDVFinan.SpIncCodigo, vDadosIni.codEmpresa);
        buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas.ParamByName('PRCSS').AsString := 'S';
        buscas.ParamByName('COD_BANCO_STR').Value := vLancamentos.FieldByName('COD_BANCO_STR').Value;
        buscas.ParamByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;
        buscas.ExecSQL;
        vLancamentos.Next;
      end;

      CommitaTransacao;

      Result := True;

      vDadosIni.progressoFuncao('', '', 'Concluíndo');

      Application.MessageBox('Fechamento concluído', 'Atenção', 0 + 64);

      if not _setAtributos_Rel then
        exit;
      vOperador_Rel := vOperador;
      vDataMovimento_Rel := vDataMovimento;
      vDadosIni.finalizaProgresso;
      _imprimirRelatorio;

      while not vLancamentos.IsEmpty do
        vLancamentos.Delete;

      while not vLancConsolidados.IsEmpty do
        vLancConsolidados.Delete;
    except
      on e: exception do
      begin
        RollBackTransacao;
        result := false;
        if Application.MessageBox(pchar(vMensagemErro + #13 +
          'Nenhuma crédito será processado. Mostrar Erro?'), 'Confirmação', MB_YESNO +
          MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
          ShowMessage(e.Message);
        registraErro(vMensagemErro + ' ' + e.Message);
      end;
    end;
  finally
    //Tem este RollBack caso ocorra erros. Caso passe pelo CommitaTransacao essa linha nao terá efeito.
    RollBackTransacao;
    vDadosIni.finalizaProgresso;
  end;
end;

function TFechamentoPDV._existeBanco(pCodigo: integer;
  var pNome: string): boolean;
begin
  Result := False;
  buscas.Close;
  buscas.SQL.Text := 'select cod_banco, desc_banco from codigo_banco' +
    ' where cod_banco = ' + IntToStr(pCodigo);
  buscas.Open;
  if not buscas.IsEmpty then
  begin
    pNome := buscas.FieldByName('desc_banco').AsString;
    Result := True;
  end;
  buscas.Close;
end;

function TFechamentoPDV._existeCliente(pCodigo: integer;
  var pNomeCliente: string): boolean;
begin
  Result := False;
  buscas.Close;
  buscas.SQL.Text := 'select cod_cliente, nome_Cliente from clientes' +
    ' where cod_cliente = ' + IntToStr(pCodigo) + ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  if not buscas.IsEmpty then
  begin
    pNomeCliente := buscas.FieldByName('nome_cliente').AsString;
    Result := True;
  end;
  buscas.Close;
end;

function TFechamentoPDV._existeCupom: boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select cp.cliente from cupom cp' +
    ' where cp.cod_terminal = ' + IntToStr(vNumeroPDV) +
    ' and cp.nserieecf = ' + QuotedStr(vNumeroSerieECF) +
    ' and cp.cupom = ' + IntToStr(vCampos.Cupom) +
    ' and cp.data = :data' +
    ' and cp.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.ParamByName('data').AsDate := vDataMovimento;
  buscas.Open;
  if buscas.IsEmpty then
    Result := False
  else
  begin
    vCampos.CodCliente := buscas.FieldByName('cliente').AsInteger;
    if vCampos.CodCliente = 0 then
      vCampos.CodCliente := StrToInt(vDadosIni.vCliente.vCodClientePadrao);
    _existeCliente(vCampos.CodCliente, vCampos.NomeCliente);
    vCampos.Historico := 'CRÉDITOS A RECEBER CONFORME CUP Nº ' + IntToStr(vCampos.Cupom);
    Result := True;
  end;
end;

function TFechamentoPDV._existeDadosBancarios(pCodigo: integer): boolean;
begin
  Result := False;
  vContabanc._selecionaContasBancarias(pCodigo);

  if vContabanc.dataSet.IsEmpty then
    Exit;

  if vContabanc.dataSet.RecordCount > 1 then
    if not _abreFormContasBancarias then
      Exit;

  vCampos.Banco := vContabanc.dataSet.FieldByName('codbanco').AsString;
  vCampos.NomeBanco := vContabanc.dataSet.FieldByName('banco').AsString;
  vCampos.Conta := vContabanc.dataSet.FieldByName('conta').AsString;
  vCampos.Agencia := vContabanc.dataSet.FieldByName('agencia').AsString;
  Result := True;

  Exit;

  buscas.Close;
  buscas.SQL.Text := 'select * from CONTASBANCARIAS where cod_cliente = ' +
    IntToStr(pCodigo)
    + ' and ativo = 1';
  buscas.Open;
  result := not buscas.IsEmpty;
  try
    if not result then
      exit;
    vCampos.Banco := '0';
    try
      vCampos.Banco := buscas.FieldByName('codbanco').AsString;
    except
    end;
    vCampos.Conta := buscas.FieldByName('conta').AsString;
    vCampos.Agencia := buscas.FieldByName('agencia').AsString;
    vCampos.NomeBanco := buscas.FieldByName('banco').AsString;
  finally
    buscas.Close;
  end;
end;

function TFechamentoPDV._existeFinCupom: boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select fc.finalizador, SUM(FC.VALOR) valor from fincupom fc' +
    ' where fc.cod_terminal = ' + IntToStr(vNumeroPDV) +
    ' and fc.nserieecf = ' + QuotedStr(vNumeroSerieECF) +
    ' and fc.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and fc.data = :data' +
    ' and fc.cupom = ' + IntToStr(vCampos.Cupom) +
    ' and fc.finalizador = ' + IntToStr(vCampos.Finalizador) +
    ' and fc.tipo_doc = ''CUP'' ' +
    ' and coalesce(fc.status_fc, '''') <> ''CANCELADO''' +
    ' group by 1';
  buscas.ParamByName('data').AsDate := vDataMovimento;
  buscas.Open;
  if buscas.IsEmpty then
    Result := False
  else
  begin
    vCampos.Valor := vDadosIni.StrToFloatFormat(buscas.FieldByName('valor').AsFloat, 2);
    Result := True;
  end;
end;

function TFechamentoPDV._existeMovimentoFechado: boolean;
begin
  try
    buscas.Close;
    buscas.SQL.Text := 'select * from movimento_pdv_finan mf' +
      ' where mf.cod_terminal = ' + IntToStr(vNumeroPDV) +
      ' and mf.nserieecf = ' + QuotedStr(vNumeroSerieECF) +
      ' and mf.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and mf.data_movimento = :data' +
      ' and mf.tipo_mov = ''FEC'' ';
    if vOperador > 0 then
      buscas.SQL.Text := buscas.SQL.Text +
        ' and mf.operador = ' + IntToStr(vOperador);
    buscas.ParamByName('data').AsDate := vDataMovimento;
    buscas.Open;

    if buscas.FieldByName('TIPO_MOV').AsString = 'FEC' then
    begin
      if Trim(buscas.FieldByName('DESCRICAO_TAB').AsString) = 'FECHADO' then
        raiseExceptionCreate('Movimento já foi recebido. Usuário código: ' +
          buscas.FieldByName('COD_USUARIO').AsString, '');

      if Trim(buscas.FieldByName('DESCRICAO_TAB').AsString) = 'RECEBENDO' then
        raiseExceptionCreate('Movimento já esta sendo recebido. Usuário código: ' +
          buscas.FieldByName('COD_USUARIO').AsString, '');
    end;
    Result := False;
  except
    on e: exception do
    begin
      result := True;
      Application.MessageBox(pchar('Erro ao verificar Movimento. Erro: ' +
        e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('Procedure _existeMovimentoFechado Erro: ' + e.Message);
    end;
  end;
  //  buscas.Close;
  //  buscas.SQL.Text := 'select * from movimento_pdv_finan mf' +
  //    ' where mf.cod_terminal = ' + IntToStr(vNumeroPDV) +
  //    ' and mf.nserieecf = ' + QuotedStr(vNumeroSerieECF) +
  //    ' and mf.cod_empresa = ' + vDadosIni.codEmpresa +
  //    ' and mf.data_movimento = :data' +
  //    ' and mf.operador = ' + IntToStr(vOperador);
  //  buscas.ParamByName('data').AsDate := vDataMovimento;
  //  buscas.Open;
  //  Result := not dataSet.IsEmpty;
  //  if Result then
  //    _movimentoProntoParaFechamento;
end;

function TFechamentoPDV._gerarParcelas: boolean;
const
  numeros = ['0'..'9'];
var
  temp: string;
  diaVenc, i, j, k, incDias: integer;
  dias: array of integer;
  dataTemp: TDate;
  condicaoPagamento: string;
  vQtde: Integer;
begin
  try
    if vCampos.Valor <= 0 then
      raiseExceptionCreate('Valor não informado', 'EditHw1');

    vCampos.vQtde := 0;

    condicaoPagamento := '';
    SetLength(dias, 0);
    SetLength(dias, 99);
    SetLength(vCampos.Valores, 0);
    SetLength(vCampos.Datas, 0);
    SetLength(vCampos.Documentos, 0);

    if UpperCase(trim(vCampos.OutrasFormas)) = 'A VISTA' then
    begin
      result := false;
      Application.MessageBox('Condição A Vista!', 'Informação', MB_OK + MB_ICONINFORMATION);
      exit;
    end;
    if Pos('X', UpperCase(vCampos.OutrasFormas)) > 0 then
    begin
      try
        J := StrToInt(Trim(copy(vCampos.OutrasFormas, 1, Pos('X', UpperCase(vCampos.OutrasFormas)) -
          1)));
        vCampos.Parcelas := J;
      except
      end;
    end;

    if vCampos.Parcelas > 0 then
    begin
      condicaoPagamento := IntToStr(vCampos.Parcelas) + 'X';
      vQtde := vCampos.Parcelas;
    end
    else if trim(vCampos.OutrasFormas) <> '' then
    begin
      incDias := 0;
      temp := '';
      i := 0;
      k := Length(vCampos.OutrasFormas);
      while i <> k do
      begin
        temp := '';
        inc(i);
        for j := i to k do
        begin
          if vCampos.OutrasFormas[j] in numeros then
            temp := temp + vCampos.OutrasFormas[j]
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

    if vQtde <= 0 then
      raiseExceptionCreate('Nenhum prazo foi definido. Informar as parcelas ou Outras Formas',
        'EditHw2');

    SetLength(vCampos.Valores, vQtde);
    SetLength(vCampos.Documentos, vQtde);
    SetLength(vCampos.Datas, vQtde);
    //ArredondaParcela(vCampos.Valor, vQtde);

    for i := 0 to vQtde - 1 do
      vCampos.Valores[i] := vDadosIni.StrToFloatFormat((vCampos.Valor / vQtde), 2);
    vCampos.Valores[0] := vDadosIni.StrToFloatFormat(vCampos.Valores[0] +
      (vCampos.Valor - (vCampos.Valores[0] * vQtde)), 2);

    for i := 0 to vQtde - 1 do
      vCampos.Documentos[I] := vDadosIni.StrZero(vCampos.Cupom, 6) + '-' + IntToStr(I + 1);

    if vCampos.Parcelas > 0 then
    begin
      for i := 0 to vQtde - 1 do
      begin
        dataTemp := IncMonth(date, i + 1);
        if IsValidDate(YearOf(dataTemp), MonthOf(dataTemp), vCampos.DiaVencimento) then
          vCampos.Datas[i] := DateToStr(StartOfTheMonth(dataTemp) + vCampos.DiaVencimento - 1)
        else
          vCampos.Datas[i] := DateToStr(EndOfTheMonth(dataTemp));
      end;
    end
    else
    begin
      for i := 0 to vQtde - 1 do
        vCampos.Datas[i] := DateToStr(Date + dias[i]);
    end;
    vLisBox.Clear;
    for I := 0 to vQtde - 1 do
      vLisBox.Items.Add(vCampos.Documentos[I] + '    ' + vCampos.Datas[I] + '           ' +
        Format('%m',
        [vCampos.Valores[I]]));
    vCampos.vQtde := vQtde;
    result := true;
  except
    on e: exception do
    begin
      result := false;
      Application.MessageBox(pchar('Erro ao gerar parcelas. Erro: ' + e.Message),
        'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('EFPG0019 ' + e.Message);
    end;
  end;
end;

function TFechamentoPDV._getCodigoLancamento(pControle: integer): integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to FLancamentos.Count - 1 do
    if vDadosIni.getCampoPipe(FLancamentos[i], 2) = IntToStr(pControle) then
    begin
      Result := StrToInt(vDadosIni.getCampoPipe(FLancamentos[i], 1));
      Exit;
    end;
end;

function TFechamentoPDV._imprimirRelatorio: boolean;
var
  vRdP: TRDprint;
  vlinha, vPagina: integer;
  buscas2: TIBQuery;
  vNomeOperador: string;
  vCodColabTemp: Integer;
  vNomeConferente: string;
  vStatusCaixa: string;
  vStringTemp: string;
  vSomaTemp: Currency;
begin
  try
    vRdP := TRDprint(dtmImportPDVFinan.RDprint1);
    vRdP.OpcoesPreview.CaptionPreview := 'Ficha de Confência de Movimendo do Caixa';
    vRdP.CaptionSetup := 'Configurar impressão';
    vRdP.TitulodoRelatorio := 'Relatório de Conferencia de Movimento do Caixa';
    vDadosIni._LimparVarSendEmail;
    vRdP.OnSendMail := vDadosini._SendMailRdPrint;
    vRdP.OpcoesPreview.Preview := true;
    vRdP.FonteTamanhoPadrao := S17cpp;
    vRdP.TamanhoQteColunas := 132;
    vRdP.TamanhoQteLinhas := 66;

    if not vDadosIni.ModImp(vRdP) then
      exit;
    buscas2 := TIBQuery(dtmImportPDVFinan.qrBuscas2);

    buscas.Close;
    buscas.SQL.Text := 'select * from movimento_pdv_finan mf' +
      ' where mf.cod_terminal = ' + IntToStr(vNumeroPDV_Rel) +
      ' and mf.nserieecf = ' + QuotedStr(vNumeroSerieECF_Rel) +
      ' and mf.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and mf.data_movimento = :data' +
      ' and mf.tipo_mov = ''FEC'' ';
    if vOperador_Rel > 0 then
      buscas.SQL.Text := buscas.SQL.Text +
        ' and mf.operador = ' + IntToStr(vOperador_Rel);
    buscas.ParamByName('data').AsDate := vDataMovimento_Rel;
    buscas.Open;
    vRdP.Abrir;
    vPagina := 1;
    while (not buscas.Eof) or (buscas.IsEmpty) do
    begin
      vlinha := 1;
      if vPagina > 1 then
        vRdP.Novapagina;
      vRdP.Imp(vlinha, 001, vDadosIni.Replicate('=', 132)); Inc(vlinha);
      vRdP.Imp(vlinha, 001, vRdP.TitulodoRelatorio);
      if vPagina = 1 then
        vRdP.Imp(vlinha, 114, FormatDateTime('dd/mm/yyyy hh:mm:ss',
          vDadosIni.getDataHoraBanco(buscas2))); Inc(vlinha);
      if not buscas.IsEmpty then
        vOperador_Rel := buscas.FieldByName('operador').AsInteger;

      buscas2.close;
      buscas2.SQL.Text := 'select nome_vendedor from colaborador where cod_vendedor = ' +
        IntToStr(vOperador_Rel) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas2.Open;
      vNomeOperador := Trim(buscas2.FieldByName('nome_vendedor').AsString);

      vNomeConferente := '';
      vCodColabTemp := buscas.FieldByName('cod_usuario').AsInteger;
      if vCodColabTemp = 0 then
        vCodColabTemp := vDadosIni.vCodUsuario;

      buscas2.close;
      buscas2.SQL.Text := 'select nome_vendedor from colaborador where cod_vendedor = ' +
        IntToStr(vCodColabTemp) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas2.Open;
      vNomeConferente := Trim(buscas2.FieldByName('nome_vendedor').AsString);

      vRdP.Imp(vlinha, 1, vDadosIni.Replicate('-', 132)); Inc(vlinha);
      vRdP.Imp(vlinha, 001, 'Caixa : ' + vDadosIni.StrZero(vNumeroPDV_Rel, 3));
      vRdP.Imp(vlinha, 025, 'N ECF: ' + vNumeroSerieECF_Rel);
      vRdP.Imp(vlinha, 065, 'Operador: ' + vDadosIni.StrZero(vOperador_Rel, 3) + ' ' +
        copy(vNomeOperador, 1, 25));
      vRdP.Imp(vlinha, 106, 'Data Movimento : ' + FormatDateTime('dd/mm/yyyy', vDataMovimento_Rel));
      Inc(vlinha);

      vStatusCaixa := Trim(buscas.FieldByName('descricao_tab').AsString);
      if vStatusCaixa = '' then
        vStatusCaixa := 'MOVIMENTO NAO PROCESSADO PELO FINANCEIRO';

      vRdP.Imp(vlinha, 001, 'Status: ' + vStatusCaixa);
      vStringTemp := 'Usuário Financeiro: ' + vDadosIni.StrZero(vCodColabTemp, 3) + ' ' +
        copy(vNomeConferente, 1, 25);
      if Pos('MOVIMENTO', vStatusCaixa) > 0 then
        vStringTemp := StringReplace(vStringTemp, 'Usuário Financeiro:', 'Usuário Conferente:',
          []);
      vRdP.Imp(vlinha, 055, vStringTemp);
      if Pos('MOVIMENTO', vStatusCaixa) = 0 then
        vRdP.Imp(vlinha, 106, 'Data Lançamento: ' + FormatDateTime('dd/mm/yyyy',
          buscas.FieldByName('data_lancamento').AsDateTime)); Inc(vlinha);
      vRdP.Imp(vlinha, 1, vDadosIni.Replicate('-', 132)); Inc(vlinha);

      Inc(vlinha);

      vRdP.Imp(vlinha, 058, 'MOVIMENTO DO CAIXA');

      Inc(vlinha, 2);

      vRdP.Imp(vlinha, 001,
        'Código      Finalizador                                  Valor da Operação');
      Inc(vlinha);
      vRdP.Imp(vlinha, 1, vDadosIni.Replicate('-', 132)); Inc(vlinha);

      vSomaTemp := 0;
      if vStatusCaixa = 'FECHADO' then
      begin
        buscas2.Close;
        buscas2.SQL.Text := 'select * from movimento_pdv_finan mf' +
          ' where mf.cod_terminal = ' + IntToStr(vNumeroPDV_Rel) +
          ' and mf.nserieecf = ' + QuotedStr(vNumeroSerieECF_Rel) +
          ' and mf.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and mf.data_movimento = :data' +
          ' and mf.tipo_mov = ''PDV'' ';
        if vOperador_Rel > 0 then
          buscas2.SQL.Text := buscas2.SQL.Text +
            ' and mf.operador = ' + IntToStr(vOperador_Rel);
        buscas2.SQL.Text := buscas2.SQL.Text + ' order by codigo_tab';
        buscas2.ParamByName('data').AsDate := vDataMovimento_Rel;
        buscas2.Open;

        while not buscas2.Eof do
        begin
          vRdP.Imp(vlinha, 001, vDadosIni.StrZero(buscas2.FieldByName('codigo_tab').AsInteger, 3));
          vRdP.Imp(vlinha, 013, buscas2.FieldByName('descricao_tab').AsString); //vDadosIni.AlnDir()
          vRdP.Imp(vlinha, 058, vDadosIni.AlnDir(
            Format('%0.2n', [buscas2.FieldByName('valor_operacao').AsFloat]), 17));
          vSomaTemp := vSomaTemp + buscas2.FieldByName('valor_operacao').AsFloat;
          Inc(vlinha);
          buscas2.Next;
        end;
      end
      else
      begin
        vMeioPg._somaMeiosPagamento_Rel;
        vMeioPg.dataSet.First;
        while not vMeioPg.dataSet.Eof do
        begin
          vRdP.Imp(vlinha, 001,
            vDadosIni.StrZero(vMeioPg.dataSet.FieldByName('finalizador').AsInteger, 3));
          vRdP.Imp(vlinha, 013, vMeioPg.dataSet.FieldByName('descricao').AsString);
          //vDadosIni.AlnDir()
          vRdP.Imp(vlinha, 058, vDadosIni.AlnDir(
            Format('%0.2n', [vMeioPg.dataSet.FieldByName('Valor').AsFloat]), 17));
          vSomaTemp := vSomaTemp + vMeioPg.dataSet.FieldByName('Valor').AsFloat;
          Inc(vlinha);
          vMeioPg.dataSet.Next;
        end;
      end;
      vRdP.Imp(vlinha, 058, vDadosIni.Replicate('-', 17)); Inc(vlinha);
      vRdP.Imp(vlinha, 051, 'Total.:');
      vRdP.Imp(vlinha, 058, vDadosIni.AlnDir(
        Format('%0.2n', [vSomaTemp]), 17));

      Inc(vlinha, 2);

      vRdP.Imp(vlinha, 1, vDadosIni.Replicate('-', 132));

      Inc(vlinha, 2);

      if vStatusCaixa = 'FECHADO' then
      begin
        vSomaTemp := 0;

        vRdP.Imp(vlinha, 058, 'LANÇAMENTOS FINANCEIROS');

        Inc(vlinha, 2);

        vRdP.Imp(vlinha, 001,
          'Código      Controle                                     Valor da Operação');
        Inc(vlinha);
        vRdP.Imp(vlinha, 1, vDadosIni.Replicate('-', 132)); Inc(vlinha);
        buscas2.Close;
        buscas2.SQL.Text := 'select * from movimento_pdv_finan mf' +
          ' where mf.cod_terminal = ' + IntToStr(vNumeroPDV_Rel) +
          ' and mf.nserieecf = ' + QuotedStr(vNumeroSerieECF_Rel) +
          ' and mf.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and mf.data_movimento = :data' +
          ' and mf.tipo_mov = ''FIN'' ';
        if vOperador_Rel > 0 then
          buscas2.SQL.Text := buscas2.SQL.Text +
            ' and mf.operador = ' + IntToStr(vOperador_Rel);
        buscas2.SQL.Text := buscas2.SQL.Text + ' order by codigo_tab';
        buscas2.ParamByName('data').AsDate := vDataMovimento_Rel;
        buscas2.Open;

        while not buscas2.Eof do
        begin
          vRdP.Imp(vlinha, 001, vDadosIni.StrZero(buscas2.FieldByName('codigo_tab').AsInteger, 3));
          vRdP.Imp(vlinha, 013, buscas2.FieldByName('descricao_tab').AsString); //vDadosIni.AlnDir()
          vRdP.Imp(vlinha, 058, vDadosIni.AlnDir(
            Format('%0.2n', [buscas2.FieldByName('valor_operacao').AsFloat]), 17));
          vSomaTemp := vSomaTemp + buscas2.FieldByName('valor_operacao').AsFloat;
          Inc(vlinha);
          buscas2.Next;
        end;
        vRdP.Imp(vlinha, 058, vDadosIni.Replicate('-', 17)); Inc(vlinha);
        vRdP.Imp(vlinha, 051, 'Total.:');
        vRdP.Imp(vlinha, 058, vDadosIni.AlnDir(
          Format('%0.2n', [vSomaTemp]), 17));
      end;

      Inc(vlinha, 2);

      vRdP.Imp(vlinha, 001, vDadosIni.Replicate('-', 132));

      Inc(vlinha, 4);

      vRdP.Imp(vlinha, 011, vDadosIni.Replicate('_', 40));
      vRdP.Imp(vlinha, 082, vDadosIni.Replicate('_', 40)); Inc(vlinha);

      vStringTemp := 'Conferente: ' + copy(vNomeConferente, 1, 25);
      if vStatusCaixa = 'FECHADO' then
        vStringTemp := StringReplace(vStringTemp, 'Financeiro:', 'Conferente:', []);
      vRdP.Imp(vlinha, 011, vStringTemp);
      vRdP.Imp(vlinha, 082, 'Operador: ' + copy(vNomeOperador, 1, 25));
      vRdP.Imp(65, 001, vDadosIni.Replicate('=', 132));
      Inc(vPagina);
      if buscas.IsEmpty then
        Break;
      buscas.Next;
    end;
    vRdP.Fechar;
  finally
    if vRdP.EstaAberto then
      vRdP.Abortar;
  end;
end;

function TFechamentoPDV._iniciarRecebimento: boolean;
var
  buscas2: TIBQuery;
  vCodTemp: integer;
  vStringTemp: string;
  vTempFinalizador, vTempControle: Integer;
  vProcessar: Boolean;
  vListaComCartao, vListaFinCupom, vListaLancamentos: TStringList;
  I, vParcelas: Integer;
  vValorFC: Extended;
  vDataFC: TDate;
  vDocumento: array of string;
  vValor: array of Currency;
  vData: array of string;
  J: Integer;
  vCodTerminalADMCartao, vDescTerminalADMCartao: string;
begin
  try

    try
      vCodTemp := StrToInt(vDadosIni.vCliente.vCodClientePadrao);
      if not _existeCliente(vCodTemp, vStringTemp) then
        raiseExceptionCreate('Código do Cliente padrão definido: ' + vDadosIni.vCodVendedorPadrao
          + #13 +
          'Porém não existe cadastro de cliente com este código', '');
    except
      raiseExceptionCreate('Código do Cliente padrão não definido nas Configurações (Config)',
        '');
    end;

    vCtrl._abrirControles;
    buscas2 := TIBQuery(dtmImportPDVFinan.qrBuscas2);
    buscas2.Close;
    buscas2.SQL.Text :=
      'select fc.finalizador,fc.cupom, cp.cliente, sum(fc.valor) valor from fincupom fc' +
      ' inner join cupom cp on fc.cod_terminal = cp.cod_terminal and' +
      ' fc.nserieecf = cp.nserieecf and fc.cod_empresa = cp.cod_empresa and' +
      ' fc.cupom = cp.cupom and fc.ordem = cp.registro' +
      ' where fc.cod_terminal = ' + IntToStr(vNumeroPDV) +
      ' and fc.nserieecf = ' + QuotedStr(vNumeroSerieECF) +
      ' and fc.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and fc.data = :data' +
      ' and coalesce(fc.status_fc, '''') <> ''CANCELADO''';
    if vOperador > 0 then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and fc.operador = ' + IntToStr(vOperador);
    buscas2.SQL.Text := buscas2.SQL.Text +
      ' and fc.finalizador = 1 and fc.tipo_doc = ''CUP''' +
      ' group BY 1,2,3';
    buscas2.ParamByName('data').AsDate := vDataMovimento;
    buscas2.Open;

    buscas2.First;
    while not buscas2.Eof do
    begin
      vLancamentos.Insert;
      vLancamentos.FieldByName('TPDOCS').AsString := 'CUP';
      vLancamentos.FieldByName('TIPDOC').AsString := 'N';
      vLancamentos.FieldByName('VALORDOC').AsCurrency := vDadosIni.StrToFloatFormat(
        buscas2.FieldByName('valor').AsFloat, 2);
      vLancamentos.FieldByName('HISTORICO').AsString := Copy(
        'CRÉDITOS A RECEBER CONFORME CUP Nº ' + IntToStr(buscas2.FieldByName('CUPOM').AsInteger),
        1, 80);
      vLancamentos.FieldByName('NREQUISICAO').AsInteger := buscas2.FieldByName('CUPOM').AsInteger;
      vLancamentos.FieldByName('COD_CONTROLE').AsInteger := 1;
      vLancamentos.FieldByName('TIP_CNT').AsString := 'C';
      vCampos.NomeCliente := '';
      if not _existeCliente(buscas2.FieldByName('cliente').AsInteger, vStringTemp) then
        vLancamentos.FieldByName('COD_CLIENTE').AsInteger := StrToInt(vDadosIni.vCliente.vCodClientePadrao)
      else
        vLancamentos.FieldByName('COD_CLIENTE').AsInteger :=
          buscas2.FieldByName('cliente').AsInteger;
      _existeCliente(vLancamentos.FieldByName('COD_CLIENTE').AsInteger, vCampos.NomeCliente);
      vLancamentos.FieldByName('CLIENTE').AsString := vCampos.NomeCliente;
      vLancamentos.FieldByName('OPERADOR').AsInteger := vOperador;
      vLancamentos.FieldByName('DATA_MOV').AsDateTime := vDataMovimento;
      vLancamentos.FieldByName('FINALIZADOR').AsInteger := 1;
      vLancamentos.Post;

      buscas2.Next;
    end;

    // Verificando prazo no PDV

    vPrazoPDV._concectaBanco;
    if vPrazoPDV._terminalOnLine then
    begin
      vCtrl._abrirControlePrazo;

      if vPrazoPDV._abrePrazos then
      begin

        vProcessar := True;
        {if vCtrl.dataSet.RecordCount > 0 then
          vPrazoPDV._abreFormEscolhaControles
        else if vCtrl.dataSet.RecordCount = 0 then
          vProcessar:= Application.MessageBox(pchar(
            'Nenhum Controle financeiro associado ao finalizador de prazo no ECF'+#13+
            'O processamento dos prazos deverá ser feito manualmente. Deseja continuar?'),
            'Confirmação', 0 + 64) = IDYES;

        vTempFinalizador:= vMeioPg.getFinalizadorPrazo;
        if vTempFinalizador = 0 then
          vProcessar:= Application.MessageBox(pchar(
            'Nenhum finalizador de prazo encontrado nos Meios de Pagamento'+#13+
            'O processamento dos prazos deverá ser feito manualmente. Deseja continuar?'),
            'Confirmação', 0 + 64) = IDYES;}

        vTempControle := 0;
        vPrazoPDV.buscas.First;
        if vProcessar then
        begin
          while not vPrazoPDV.buscas.Eof do
          begin
            vCtrl.montaSelect('select ' + vCtrl.getCamposSQL + ' from controles ct' +
              ' where ct.codigo_emp = ' + vDadosIni.codEmpresa +
              ' and ct.codigo_ctrl = ' +
              IntToStr(vPrazoPDV.buscas.FieldByName('cod_controle').AsInteger) +
              ' order by ct.codigo_ctrl ');
            //            vCtrl._abrirControles(vPrazoPDV.buscas.FieldByName('cod_controle').AsInteger);
            if vCtrl.dataSet.IsEmpty then
            begin
              if vTempControle > 0 then
                vCtrl.montaSelect('select ' + vCtrl.getCamposSQL + ' from controles ct' +
                  ' where ct.codigo_emp = ' + vDadosIni.codEmpresa +
                  ' and ct.codigo_ctrl = ' + IntToStr(vTempControle) +
                  ' order by CT.codigo_ctrl ')
              else
              begin
                vCtrl._abrirControles;
                vPrazoPDV._abreFormEscolhaControles;
                vTempControle := vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger;
                vCtrl._abrirControles(vTempControle);
              end;
            end;

            if vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger > 0 then
            begin
              vLancamentos.Insert;
              vLancamentos.FieldByName('TPDOCS').AsString := 'CUP';
              vLancamentos.FieldByName('TIPDOC').AsString :=
                vCtrl.dataSet.FieldByName('docs').AsString;
              vLancamentos.FieldByName('VALORDOC').AsCurrency := vDadosIni.StrToFloatFormat(
                vPrazoPDV.buscas.FieldByName('valordoc').AsFloat, 2);
              vLancamentos.FieldByName('HISTORICO').AsString := Copy(
                'CRÉDITOS A RECEBER CONFORME CUP Nº ' +
                IntToStr(vPrazoPDV.buscas.FieldByName('cupom').AsInteger),
                1, 80);
              vLancamentos.FieldByName('NREQUISICAO').AsInteger :=
                vPrazoPDV.buscas.FieldByName('cupom').AsInteger;
              vLancamentos.FieldByName('data_venc').AsDateTime :=
                vPrazoPDV.buscas.FieldByName('data_venc').AsDateTime;
              vLancamentos.FieldByName('COD_CONTROLE').AsInteger :=
                vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger;
              vLancamentos.FieldByName('TIP_CNT').AsString := 'C';
              vCampos.NomeCliente := '';
              if not _existeCliente(vPrazoPDV.buscas.FieldByName('cliente').AsInteger, vStringTemp)
                then
                vLancamentos.FieldByName('COD_CLIENTE').AsInteger :=
                  StrToInt(vDadosIni.vCliente.vCodClientePadrao)
              else
                vLancamentos.FieldByName('COD_CLIENTE').AsInteger :=
                  vPrazoPDV.buscas.FieldByName('cliente').AsInteger;
              _existeCliente(vLancamentos.FieldByName('COD_CLIENTE').AsInteger,
                vCampos.NomeCliente);
              vLancamentos.FieldByName('CLIENTE').AsString := vCampos.NomeCliente;
              vLancamentos.FieldByName('OPERADOR').AsInteger := vOperador;
              vLancamentos.FieldByName('DATA_MOV').AsDateTime := vDataMovimento;
              vLancamentos.FieldByName('FINALIZADOR').AsInteger :=
                vCtrl.dataSet.FieldByName('cod_finalizador').AsInteger;
              //vTempFinalizador;

              vLancamentos.Post;
            end;

            vPrazoPDV.buscas.Next;
          end;
        end;

      end;

      // Processamento de transacoes com Cartao TEF Dedicado
      vPrazoPDV.buscas.Close;
      vPrazoPDV.buscas.SQL.Text := 'select  f.finalizador, fi.descricao, max(f.data) from fincupom f' +
        ' inner join finalizadores fi on fi.cod_terminal = f.cod_terminal and fi.nserieecf = f.nserieecf' +
        ' and fi.cod_empresa = f.cod_empresa and fi.cod_finalizador = f.finalizador' +
        ' where f.cod_terminal = ' + IntToStr(vPrazoPDV.vNumeroPDV) +
        ' and f.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and f.data = :data' +
        ' and f.n_docnsu_adm <> ''''' +
        ' and coalesce(f.status_fc, '''') <> ''CANCELADO''' +
        ' group by 1,2';
      vPrazoPDV.buscas.ParamByName('data').AsDate := vPrazoPDV.vDataMovimento;
      vPrazoPDV.buscas.Open;

      vListaComCartao := TStringList.Create;
      vListaFinCupom := TStringList.Create;
      vListaLancamentos := TStringList.Create;
      vListaComCartao.Clear;
      vListaFinCupom.Clear;
      vListaLancamentos.Clear;
      vPrazoPDV.buscas.First;
      while not vPrazoPDV.buscas.Eof do
      begin
        vTempControle := 0;
        vCtrl.montaSelect('select ' + vCtrl.getCamposSQL + ' from controles ct' +
          ' where ct.codigo_emp = ' + vDadosIni.codEmpresa +
          ' and ct.docs = ''S2'' ' +
          ' and ct.cod_finalizador = ' + IntToStr(vPrazoPDV.buscas.FieldByName('finalizador').AsInteger) +
          ' and ct.ativo <> 99 ' +
          ' order by ct.codigo_ctrl ');
        if vCtrl.dataSet.RecordCount <> 1 then
        begin
          if vCtrl.dataSet.RecordCount = 0 then
            vCtrl.montaSelect('select ' + vCtrl.getCamposSQL + ' from controles ct' +
              ' where ct.codigo_emp = ' + vDadosIni.codEmpresa +
              ' and ct.docs = ''S2'' ' +
              ' and ct.cxent = ''S'' ' +
              ' and ct.ativo <> 99 ' +
              ' order by ct.codigo_ctrl ');
          vPrazoPDV._abreFormEscolhaControles('Selecione o controle para o finalizador da ECF: ' +
            IntToStr(vPrazoPDV.buscas.FieldByName('finalizador').AsInteger) + ' - ' +
            vPrazoPDV.buscas.FieldByName('descricao').AsString);
        end;
        vTempControle := vCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger;

        if vTempControle > 0 then
          vListaComCartao.Add(IntToStr(vPrazoPDV.buscas.FieldByName('finalizador').AsInteger) + '|' +
          IntToStr(vTempControle) + '|');
        vPrazoPDV.buscas.Next;
      end;

      for I := 0 to vListaComCartao.Count - 1 do
      begin
        vPrazoPDV.buscas.Close;
        vPrazoPDV.buscas.SQL.Text := 'select  f.cupom, f.valor, f.finalizador, f.data, c.cliente, c.cod_vendedor, f.parcelas_tef, c.status_cp,f.n_aut_cart, f.n_docnsu_adm from fincupom f' +
          ' inner join cupom c on f.cod_terminal = c.cod_terminal and f.nserieecf = c.nserieecf and' +
          ' f.cod_empresa = c.cod_empresa and f.cupom = c.cupom' +
          ' where f.cod_terminal = ' + IntToStr(vPrazoPDV.vNumeroPDV) +
          ' and f.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and f.data = :data' +
          ' and f.n_docnsu_adm <> ''''' +
          ' and f.finalizador = ' + vDadosIni.getCampoPipe(vListaComCartao[I],1) +
          ' and coalesce(f.status_fc, '''') <> ''CANCELADO''';
        vPrazoPDV.buscas.ParamByName('data').AsDate := vPrazoPDV.vDataMovimento;
        vPrazoPDV.buscas.Open;

        vPrazoPDV.buscas.First;
        while not vPrazoPDV.buscas.Eof do
        begin
          if Trim(vPrazoPDV.buscas.FieldByName('status_cp').AsString) <> 'CANCELADO' then
            vListaFinCupom.Add(
              IntToStr(vPrazoPDV.buscas.FieldByName('finalizador').AsInteger) + '|' +                         //1
              IntToStr(vPrazoPDV.buscas.FieldByName('cupom').AsInteger) + '|' +                               //2
              IntToStr(vPrazoPDV.buscas.FieldByName('cliente').AsInteger) + '|' +                             //3
              IntToStr(vPrazoPDV.buscas.FieldByName('cod_vendedor').AsInteger) + '|' +                        //4
              IntToStr(vPrazoPDV.buscas.FieldByName('parcelas_tef').AsInteger) + '|' +                        //5
              vDadosIni.getCampoPipe(vListaComCartao[I],2) + '|' + // Controle                                //6
              FloatToStr(vDadosIni.StrToFloatFormat(vPrazoPDV.buscas.FieldByName('valor').AsFloat,2)) + '|' + //7
              FormatDateTime('dd/mm/yyyy', vPrazoPDV.buscas.FieldByName('data').AsDateTime) + '|' +           //8
              Trim(vPrazoPDV.buscas.FieldByName('n_aut_cart').AsString) + '|' +                               //9
              Trim(vPrazoPDV.buscas.FieldByName('n_docnsu_adm').AsString) + '|'                               //10
              );
          vPrazoPDV.buscas.Next;
        end;
      end;

      for I := 0 to vListaFinCupom.Count - 1 do
      begin
        try
          vParcelas := StrToInt(vDadosIni.getCampoPipe(vListaFinCupom[i], 5));
          if vParcelas <= 0 then
            vParcelas := 1;
          vValorFC := StrToFloat(vDadosIni.getCampoPipe(vListaFinCupom[i], 7));
          vDataFC := StrToDate(vDadosIni.getCampoPipe(vListaFinCupom[i], 8));
        except
          vParcelas := 1;
          vValorFC := 0;
          vDataFC := 0;
        end;

        SetLength(vValor, vParcelas);
        SetLength(vDocumento, vParcelas);
        SetLength(vData, vParcelas);
        for J := 0 to vParcelas - 1 do vValor[J] := 0;
        for J := 0 to vParcelas - 1 do vDocumento[J] := '';
        for J := 0 to vParcelas - 1 do vData[J] := '';

        for J := 0 to vParcelas - 1 do
        begin
          vDataFC := vDataFC + 30;
          vValor[J] := vDadosIni.StrToFloatFormat(( 0.01 * Trunc((vValorFC / vParcelas) * 100) ) , 2);
          vData[J] := FormatDateTime('dd/mm/yyyy', vDataFC);
          vDocumento[J] := vDadosIni.StrZero(vDadosIni.getCampoPipe(vListaFinCupom[i], 2),6) + '-' + IntToStr(J + 1);
        end;
        vValor[0] := vDadosIni.StrToFloatFormat(vValor[0] + (vValorFC - (vValor[0] * vParcelas)), 2);

        for J := 0 to vParcelas - 1 do
        begin
          vListaLancamentos.Add(
            FloatToStr(vValor[J]) + '|' +                                                                  //1 Valor
            vData[J] + '|' +                                                                               //2 Data Vencimento
            vDocumento[J] + '|' +                                                                          //3 Num Doc
              'CRÉDITOS A RECEBER CONFORME CUP Nº ' + vDadosIni.getCampoPipe(vListaFinCupom[i],2) + '|' +  //4 Historico
            vDadosIni.getCampoPipe(vListaFinCupom[i],2) + '|' +                                            //5 Cupom
            vDadosIni.getCampoPipe(vListaFinCupom[i],6) + '|' +                                            //6 Controle
            vDadosIni.getCampoPipe(vListaFinCupom[i],3) + '|' +                                            //7 Cod Cliente
            vDadosIni.getCampoPipe(vListaFinCupom[i],1) + '|' +                                            //8 Finalizador
            vDadosIni.getCampoPipe(vListaFinCupom[i],9) + '|' +                                            //9 Num Autorizacao Cartao
            vDadosIni.getCampoPipe(vListaFinCupom[i],10) + '|' +                                           //10 NSU Transacao
            IntToStr(J + 1) + '|' +                                                                          //11 Parcela
            IntToStr(vParcelas) + '|'                                                                      //12 Total Parcelas
          );
        end;
      end;

      buscas.Close;
      buscas.SQL.Text := 'select COD_TERM_ADM, DESC_TERM_ADM from TERMINAL_CARTAO' +
        ' where COD_TERMINALF = ' + IntToStr(vNumeroPDV) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;

      vCodTerminalADMCartao := '';
      vDescTerminalADMCartao := '';
      if not buscas.IsEmpty  then
      begin
	      vCodTerminalADMCartao := Trim(buscas.FieldByName('COD_TERM_ADM').AsString);
  	    vDescTerminalADMCartao := Trim(buscas.FieldByName('DESC_TERM_ADM').AsString);
      end;

      for I := 0 to vListaLancamentos.Count - 1 do
      begin
        vLancamentos.Insert;
        vLancamentos.FieldByName('TPDOCS').AsString := 'CUP';
        vLancamentos.FieldByName('TIPDOC').AsString := 'S2';
        vLancamentos.FieldByName('VALORDOC').AsCurrency := StrToFloat(vDadosIni.getCampoPipe(vListaLancamentos[i],1));
        vLancamentos.FieldByName('HISTORICO').AsString := Copy(vDadosIni.getCampoPipe(vListaLancamentos[i],4),1, 80);
        vLancamentos.FieldByName('NREQUISICAO').AsInteger := StrToInt(vDadosIni.getCampoPipe(vListaLancamentos[i],5));
        vLancamentos.FieldByName('DATA_VENC').AsDateTime := StrToDate(vDadosIni.getCampoPipe(vListaLancamentos[i],2));
        vLancamentos.FieldByName('NDOC').AsString := vDadosIni.getCampoPipe(vListaLancamentos[i],3);
        vLancamentos.FieldByName('COD_CONTROLE').AsInteger := StrToInt(vDadosIni.getCampoPipe(vListaLancamentos[i],6));
        vLancamentos.FieldByName('TIP_CNT').AsString := 'C';
        vCampos.NomeCliente := '';
        if not _existeCliente(StrToInt(vDadosIni.getCampoPipe(vListaLancamentos[i],7)), vStringTemp) then
          vLancamentos.FieldByName('COD_CLIENTE').AsInteger := StrToInt(vDadosIni.vCliente.vCodClientePadrao)
        else
          vLancamentos.FieldByName('COD_CLIENTE').AsInteger := StrToInt(vDadosIni.getCampoPipe(vListaLancamentos[i],7));
        _existeCliente(vLancamentos.FieldByName('COD_CLIENTE').AsInteger, vCampos.NomeCliente);
        vLancamentos.FieldByName('CLIENTE').AsString := vCampos.NomeCliente;
        vLancamentos.FieldByName('OPERADOR').AsInteger := vOperador;
        vLancamentos.FieldByName('DATA_MOV').AsDateTime := vDataMovimento;
        vLancamentos.FieldByName('FINALIZADOR').AsInteger := StrToInt(vDadosIni.getCampoPipe(vListaLancamentos[i],8));
        vLancamentos.FieldByName('N_AUT_CART').AsString := Copy(vDadosIni.getCampoPipe(vListaLancamentos[i],9),1, 20);
        vLancamentos.FieldByName('N_DOCNSU_ADM').AsString := Copy(vDadosIni.getCampoPipe(vListaLancamentos[i],10),1, 10);
        vLancamentos.FieldByName('COD_TERMINAL_ADM').AsString := vCodTerminalADMCartao;
        vLancamentos.FieldByName('DESC_TERMINAL_ADM').AsString := Copy(vDescTerminalADMCartao, 1, 30);
        vLancamentos.FieldByName('NPARCELA').AsInteger := StrToInt(vDadosIni.getCampoPipe(vListaLancamentos[i],11));
        vLancamentos.FieldByName('QTDE_PARC').AsInteger := StrToInt(vDadosIni.getCampoPipe(vListaLancamentos[i],12));
        vLancamentos.Post;
      end;
    end
    else
      Application.MessageBox(pchar(
        'Pdv off line. O processamento automático dos Prazos não será feito. Deverá ser digitado manualmente'),
        'Informação', 0 + 64);

    vPrazoPDV._desconcectaBanco;

    vCtrl._abrirControles;

    _atualizaSomaMeiosPag;
    Result := True;
  except
    on e: exception do
    begin
      result := false;
      vPrazoPDV._desconcectaBanco;
      vLancamentos.EmptyDataSet;
      Application.MessageBox(pchar('Erro ao iniciar Recebimentos. Erro: ' +
        e.Message),
        'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('Procedure _iniciarRecebimento Erro: ' + e.Message);
    end;
  end;

  //fazer um select aqui que busque apenas os fincupom em dinheiro do periodo
  // sendo assim fazer para cada cupom os lançamentos no formpagamento em dinheiro.
  //

end;

function TFechamentoPDV._insereHistoricoConsolidacao: boolean;
begin
  try
    Result := False;

    vLancConsolidados.First;
    while not vLancConsolidados.Eof do
    begin
      dataSet.Insert;
      dataSet.FieldByName('cod_terminal').AsInteger := vNumeroPDV;
      dataSet.FieldByName('nserieecf').AsString := vNumeroSerieECF;
      dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      dataSet.FieldByName('data_movimento').AsDateTime := vDataMovimento;
      dataSet.FieldByName('operador').AsInteger := vOperador;
      dataSet.FieldByName('tipo_mov').AsString := 'FIN';
      dataSet.FieldByName('codigo_tab').AsInteger :=
        vLancConsolidados.FieldByName('cod_controle').AsInteger;
      dataSet.FieldByName('descricao_tab').AsString :=
        copy(vLancConsolidados.FieldByName('nome_ctrl').AsString, 1, 32);
      dataSet.FieldByName('valor_operacao').AsCurrency :=
        vLancConsolidados.FieldByName('valor').AsCurrency;
      dataSet.Post;

      vLancConsolidados.Next;
    end;

    vMeioPg.dataSet.First;
    while not vMeioPg.dataSet.Eof do
    begin
      dataSet.Insert;
      dataSet.FieldByName('cod_terminal').AsInteger := vNumeroPDV;
      dataSet.FieldByName('nserieecf').AsString := vNumeroSerieECF;
      dataSet.FieldByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
      dataSet.FieldByName('data_movimento').AsDateTime := vDataMovimento;
      dataSet.FieldByName('operador').AsInteger := vOperador;
      dataSet.FieldByName('tipo_mov').AsString := 'PDV';
      dataSet.FieldByName('codigo_tab').AsInteger :=
        vMeioPg.dataSet.FieldByName('finalizador').AsInteger;
      dataSet.FieldByName('descricao_tab').AsString :=
        copy(vMeioPg.dataSet.FieldByName('descricao').AsString, 1, 32);
      dataSet.FieldByName('valor_operacao').AsCurrency :=
        vMeioPg.dataSet.FieldByName('valor').AsCurrency;
      dataSet.Post;

      vMeioPg.dataSet.Next;
    end;

    Result := True;
  except
    on e: exception do
    begin
      result := false;
      Application.MessageBox(pchar('Erro ao gravar histórico de consolidação. Erro: ' +
        e.Message),
        'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('Procedure _insereHistoricoConsolidacao Erro: ' + e.Message);
    end;
  end;
end;

procedure TFechamentoPDV._irParaRegistro(pCampoIndice: string);
var
  vTextoDigitado, vIdx: string;
begin
  if InputQuery('Procurar registro', 'Informe o conteúdo da pesquisa', vTextoDigitado) then
  begin
    vLancamentos.IndexFieldNames := pCampoIndice;
    vLancamentos.FindNearest([vTextoDigitado]);
    vLancamentos.IndexFieldNames := 'NREQUISICAO';
  end;
end;

function TFechamentoPDV._liberarMovimentoPDV: boolean;
begin
  try
    buscas.Close;
    buscas.SQL.Text := 'select * from movimento_pdv_finan mf' +
      ' where mf.cod_terminal = ' + IntToStr(vNumeroPDV) +
      ' and mf.nserieecf = ' + QuotedStr(vNumeroSerieECF) +
      ' and mf.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and mf.data_movimento = :data' +
      ' and mf.tipo_mov = ''FEC'' ';
    if vOperador > 0 then
      buscas.SQL.Text := buscas.SQL.Text +
        ' and mf.operador = ' + IntToStr(vOperador);
    buscas.ParamByName('data').AsDate := vDataMovimento;
    buscas.Open;
    if buscas.FieldByName('TIPO_MOV').AsString = 'FEC' then
    begin
      if Trim(buscas.FieldByName('DESCRICAO_TAB').AsString) = 'FECHADO' then
        raiseExceptionCreate('Movimento já foi recebido. Liberação não permitida. Usuário código: '
          + buscas.FieldByName('COD_USUARIO').AsString, '')
      else
      begin
        buscas.Close;
        buscas.SQL.Text := 'delete from movimento_pdv_finan mf' +
          ' where mf.cod_terminal = ' + IntToStr(vNumeroPDV) +
          ' and mf.nserieecf = ' + QuotedStr(vNumeroSerieECF) +
          ' and mf.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and mf.data_movimento = :data' +
          ' and mf.operador = ' + IntToStr(vOperador);
        buscas.ParamByName('data').AsDate := vDataMovimento;
        buscas.ExecSQL;
        CommitaTransacao;
        Result := True;
        Application.MessageBox(pchar('Movimento Liberado'), 'Atenção', 0 + 64);
      end;
    end;
  except
    on e: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
      registraErro('Procedure _liberarMovimentoPDV Erro: ' + e.Message);
    end;
  end;
end;

procedure TFechamentoPDV._limpaCampos;
begin
  vCampos.Cupom := 0;
  vCampos.NumeroCheque := 0;
  vCampos.CodCliente := 0;
  vCampos.CodTerceiro := 0;
  vCampos.Parcelas := 0;
  vCampos.DiaVencimento := 0;
  vCampos.Finalizador := 0;
  vCampos.Agencia := '';
  vCampos.Conta := '';
  vCampos.Banco := '';
  vCampos.NomeBanco := '';
  vCampos.Historico := '';
  vCampos.NomeCliente := '';
  vCampos.NomeTerceiro := '';
  vCampos.OutrasFormas := '';
  vCampos.NumAutCartao := '';
  vCampos.NSUTransacao := '';
  vCampos.CodTerminalCartao := '';
  vCampos.Valor := 0;
  vCampos.Vencimento := 0;
  SetLength(vCampos.Documentos, 0);
  SetLength(vCampos.Valores, 0);
  SetLength(vCampos.Datas, 0);
  vLisBox.Clear;
end;

procedure TFechamentoPDV._montaCondPag(var pLista: TComboBox);
var
  I: Integer;
begin
  pLista.Clear;
  pLista.Items.Add('NENHUMA');
  buscas.Close;
  buscas.SQL.Text := 'select distinct(desc_cond_pag) from cond_pag order by 1';
  buscas.Open;
  buscas.First;
  while not buscas.eof do
  begin
    pLista.Items.Add(buscas.FieldByName('desc_cond_pag').AsString);
    buscas.Next;
  end;
  buscas.Close;
  pLista.ItemIndex := 0;
end;

function TFechamentoPDV._movimentoProntoParaFechamento: boolean;
begin
  try
    Result := True;
    buscas.Close;
    buscas.SQL.Text := 'select * from movimento_pdv_finan mf' +
      ' where mf.cod_terminal = ' + IntToStr(vNumeroPDV) +
      ' and mf.nserieecf = ' + QuotedStr(vNumeroSerieECF) +
      ' and mf.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and mf.data_movimento = :data_movimento' +
      ' and mf.tipo_mov = ''FEC'' ' +
      ' and mf.operador = ' + IntToStr(vOperador);
    buscas.ParamByName('data_movimento').AsDate := vDataMovimento;
    buscas.Open;
    if buscas.IsEmpty then
      Result := False
    else if buscas.FieldByName('tipo_mov').AsString = 'RECEBENDO' then
      raiseExceptionCreate('Movimento ja esta sendo recebido', 'MaskEdit1')
    else if buscas.FieldByName('tipo_mov').AsString = 'FECHADO' then
      raiseExceptionCreate('Movimento ja foi recebido', 'MaskEdit1');
  except
    on e: Exception do
    begin
      Application.MessageBox(pchar(e.Message + #13 + 'Não é possível continuar'),
        'Atenção', MB_ICONEXCLAMATION + MB_OK);
      registraErro('Procedure _movimentoProntoParaFechamento Erro: ' + e.Message);
    end;
  end;
end;

function TFechamentoPDV._novoLancamento: boolean;
begin
  //vCtrl._abrirControles(vMeioPg.dataSet.FieldByName('finalizador').AsInteger);
  _limpaCampos;
  vCampos.Finalizador := vCtrl.dataSet.FieldByName('cod_finalizador').AsInteger;
  //_abreFormManutencaoLancamentoCadastro;
end;

function TFechamentoPDV._removerLancamento: boolean;
begin
  if vLancamentos.IsEmpty then
    Exit;
  vLancamentos.Delete;
  _atualizaSomaMeiosPag;
end;

function TFechamentoPDV._salvarCheque: boolean;
begin
  try
    Result := False;

    if vCampos.NumeroCheque <= 0 then
      raiseExceptionCreate('Número do Cheque não informado', 'EditHw8');

    if vCampos.Agencia = '' then
      if Application.MessageBox('Agência não informada. Deseja continuar mesmo assim?',
        'Confirmação',
        MB_ICONQUESTION + MB_YESNO) = IDNO then
        exit;
    if vCampos.Conta = '' then
      if Application.MessageBox('Conta não informada. Deseja continuar mesmo assim?',
        'Confirmação',
        MB_ICONQUESTION + MB_YESNO) = IDNO then
        exit;
    if vCampos.NomeBanco = '' then
      if Application.MessageBox('Nome do Banco não informado. Deseja continuar mesmo assim?',
        'Confirmação',
        MB_ICONQUESTION + MB_YESNO) = IDNO then
        exit;

    if vCampos.Valor <= 0 then
      raiseExceptionCreate('Valor não informado ou inválido', 'EditHw10');

    if not _validasCamposPadrao then
      Exit;

    vLancamentos.Insert;
    vLancamentos.FieldByName('TPDOCS').AsString := 'CUP';
    vLancamentos.FieldByName('TIPDOC').AsString := 'S1';
    vLancamentos.FieldByName('VALORDOC').AsCurrency := vDadosIni.StrToFloatFormat(
      vCampos.Valor, 2);
    vLancamentos.FieldByName('HISTORICO').AsString := Copy(vCampos.Historico, 1, 80);
    vLancamentos.FieldByName('NREQUISICAO').AsInteger := vCampos.Cupom;
    vLancamentos.FieldByName('COD_CONTROLE').AsInteger :=
      vCtrl.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
    vLancamentos.FieldByName('NDOC').AsString := IntToStr(vCampos.NumeroCheque);
    vLancamentos.FieldByName('TIP_CNT').AsString := 'C';
    vLancamentos.FieldByName('CLIENTE').AsString := vCampos.NomeCliente;
    vLancamentos.FieldByName('DATA_VENC').AsDateTime := vCampos.Vencimento;
    vLancamentos.FieldByName('AGENCIA').AsString := vCampos.Agencia;
    vLancamentos.FieldByName('CONTA').AsString := vCampos.Conta;
    try
      vLancamentos.FieldByName('COD_BANCO').AsInteger := StrToInt(vCampos.Banco);
    except
    end;
    vLancamentos.FieldByName('BANCO').AsString := vCampos.NomeBanco;
    vLancamentos.FieldByName('COD_CLI_TERC').AsInteger := vCampos.CodTerceiro;
    vLancamentos.FieldByName('TERCEIROS').AsString := vCampos.NomeTerceiro;
    vLancamentos.FieldByName('OPERADOR').AsInteger := vOperador;
    vLancamentos.FieldByName('DATA_MOV').AsDateTime := vDataMovimento;
    vLancamentos.FieldByName('COD_CLIENTE').AsInteger := vCampos.CodCliente;
    vLancamentos.FieldByName('N_AUT_CART').AsString := vCampos.NumAutCartao;
    vLancamentos.FieldByName('FINALIZADOR').AsInteger := vCampos.Finalizador;
    vLancamentos.FieldByName('COD_BANCO_STR').AsString := vCampos.Banco;
    vLancamentos.Post;

    Result := True;
    _atualizaSomaMeiosPag;
  except
    on e: Exception do
    begin
      Application.MessageBox(pchar(e.Message),
        'Atenção', MB_ICONEXCLAMATION + MB_OK);
      registraErro('Procedure _salvarCheque Erro: ' + e.Message);
    end;
  end;
end;

function TFechamentoPDV._salvarCreditos: boolean;
var
  I: Integer;
begin
  try
    Result := False;

    if (vCampos.vQtde > 0) and (vCampos.Parcelas = 0) then
      vCampos.Parcelas := vCampos.vQtde;

    if vCampos.Parcelas <= 0 then
      if vCampos.OutrasFormas = 'NENHUMA' then
        raiseExceptionCreate('Informe a quantidade de parcelas ou a forma de pagamento', 'EditHw2');

    if Trim(vCtrl.dataSet.FieldByName('TP_PLANO').AsString) = 'C' then
      if vCampos.NumAutCartao = '' then
        raiseExceptionCreate('Numero de Autorização do Cartão de Crédito não informada',
          'Edit11');

    if vTermCartao.dataSet.RecordCount > 0 then
    begin
      if vCampos.NSUTransacao = '' then
        raiseExceptionCreate('Num Doc Adm (NSU da Transação) do Cartão não informado',
          'Edit15');
      if vCampos.CodTerminalCartao = '' then
        raiseExceptionCreate('Terminal da Administradora de Cartão não informado',
          'DBLookupComboBox2');
    end;

    if vCampos.Valor <= 0 then
      raiseExceptionCreate('Valor não informado ou inválido', 'EditHw1');

    if not _validasCamposPadrao then
      Exit;

    for I := 0 to vCampos.Parcelas - 1 do
    begin
      vLancamentos.Insert;
      vLancamentos.FieldByName('TPDOCS').AsString := 'CUP';
      vLancamentos.FieldByName('TIPDOC').AsString := 'S2';
      vLancamentos.FieldByName('HISTORICO').AsString := Copy(vCampos.Historico, 1, 80);
      vLancamentos.FieldByName('NREQUISICAO').AsInteger := vCampos.Cupom;
      vLancamentos.FieldByName('COD_CONTROLE').AsInteger :=
        vCtrl.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
      vLancamentos.FieldByName('TIP_CNT').AsString := 'C';
      vLancamentos.FieldByName('N_CONTA_PLC').AsFloat := 0;

      vLancamentos.FieldByName('VALORDOC').AsCurrency := vDadosIni.StrToFloatFormat(
        vCampos.Valores[i], 2);
      vLancamentos.FieldByName('DATA_VENC').AsDateTime := StrToDate(vCampos.Datas[i]);
      vLancamentos.FieldByName('NDOC').AsString := vCampos.Documentos[i];

      vLancamentos.FieldByName('COD_CLIENTE').AsInteger := vCampos.CodCliente;
      vLancamentos.FieldByName('CLIENTE').AsString := vCampos.NomeCliente;
      vLancamentos.FieldByName('COD_CLI_TERC').AsInteger := vCampos.CodTerceiro;
      vLancamentos.FieldByName('TERCEIROS').AsString := vCampos.NomeTerceiro;
      vLancamentos.FieldByName('OPERADOR').AsInteger := vOperador;
      vLancamentos.FieldByName('DATA_MOV').AsDateTime := vDataMovimento;
      vLancamentos.FieldByName('N_AUT_CART').AsString := vCampos.NumAutCartao;
      vLancamentos.FieldByName('N_DOCNSU_ADM').AsString := vCampos.NSUTransacao;
      vLancamentos.FieldByName('COD_TERMINAL_ADM').AsString := vCampos.CodTerminalCartao;
      vLancamentos.FieldByName('FINALIZADOR').AsInteger := vCampos.Finalizador;
      vLancamentos.FieldByName('NPARCELA').AsInteger := I + 1;
      vLancamentos.FieldByName('QTDE_PARC').AsInteger := vCampos.Parcelas;
      vLancamentos.Post;
    end;

    Result := True;
    _atualizaSomaMeiosPag;
  except
    on e: Exception do
    begin
      Application.MessageBox(pchar(e.Message),
        'Atenção', MB_ICONEXCLAMATION + MB_OK);
      registraErro('Procedure _salvarCreditos Erro: ' + e.Message);
    end;
  end;
end;

function TFechamentoPDV._salvarDinheiro: boolean;
begin
  try
    Result := False;

    if vCampos.Valor <= 0 then
      raiseExceptionCreate('Valor não informado ou inválido', 'EditHw10');

    vCampos.CodTerceiro := 0;

    if not _validasCamposPadrao then
      Exit;

    vLancamentos.Insert;
    vLancamentos.FieldByName('TPDOCS').AsString := 'CUP';
    vLancamentos.FieldByName('TIPDOC').AsString := 'N';
    vLancamentos.FieldByName('VALORDOC').AsCurrency := vDadosIni.StrToFloatFormat(
      vCampos.Valor, 2);
    vLancamentos.FieldByName('HISTORICO').AsString := Copy(vCampos.Historico, 1, 80);
    vLancamentos.FieldByName('NREQUISICAO').AsInteger := vCampos.Cupom;
    vLancamentos.FieldByName('COD_CONTROLE').AsInteger :=
      vCtrl.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
    vLancamentos.FieldByName('NDOC').AsString := '';
    vLancamentos.FieldByName('TIP_CNT').AsString := 'C';
    vLancamentos.FieldByName('CLIENTE').AsString := vCampos.NomeCliente;
    vLancamentos.FieldByName('OPERADOR').AsInteger := vOperador;
    vLancamentos.FieldByName('DATA_MOV').AsDateTime := vDataMovimento;
    vLancamentos.FieldByName('COD_CLIENTE').AsInteger := vCampos.CodCliente;
    vLancamentos.FieldByName('FINALIZADOR').AsInteger := vCampos.Finalizador;
    vLancamentos.Post;

    Result := True;
    _atualizaSomaMeiosPag;
  except
    on e: Exception do
    begin
      Application.MessageBox(pchar(e.Message),
        'Atenção', MB_ICONEXCLAMATION + MB_OK);
      registraErro('Procedure _salvarDinheiro Erro: ' + e.Message);
    end;
  end;
end;

function TFechamentoPDV._setAtributos: boolean;
begin
  try
    Result := False;
    vNumeroPDV := vPdv.dataSet.FieldByName('cod_terminal').AsInteger;
    buscas.close;
    buscas.SQL.Text := 'select ti.num_serie_ecf from terminal_impressoras ti' +
      ' where ti.cod_terminal = ' + IntToStr(vNumeroPDV) +
      ' and ti.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ti.atual = ''S'' ';
    buscas.Open;
    if buscas.IsEmpty then
      raise
        Exception.Create('Configuração do PDV não encontrada. Numero de Série do ECF em TERMINAL_IMPRESSORAS');

    vNumeroSerieECF := buscas.FieldByName('num_serie_ecf').AsString;

    vPrazoPDV := TPrazosPDV.create(Trim(vPdv.dataSet.FieldByName('end_terminal').AsString));

    vPdv.vNumeroPDV := Self.vNumeroPDV;
    vPdv.vOperador := Self.vOperador;
    vPdv.vNumeroSerieECF := Self.vNumeroSerieECF;
    vPdv.vDataMovimento := Self.vDataMovimento;

    vMeioPg.vNumeroPDV := Self.vNumeroPDV;
    vMeioPg.vOperador := Self.vOperador;
    vMeioPg.vNumeroSerieECF := Self.vNumeroSerieECF;
    vMeioPg.vDataMovimento := Self.vDataMovimento;

    vPrazoPDV.vNumeroPDV := Self.vNumeroPDV;
    vPrazoPDV.vOperador := Self.vOperador;
    vPrazoPDV.vNumeroSerieECF := Self.vNumeroSerieECF;
    vPrazoPDV.vDataMovimento := Self.vDataMovimento;

    vCtrl.vNumeroPDV := Self.vNumeroPDV;
    vCtrl.vOperador := Self.vOperador;
    vCtrl.vNumeroSerieECF := Self.vNumeroSerieECF;
    vCtrl.vDataMovimento := Self.vDataMovimento;

    Result := True;
  except
    on e: Exception do
    begin
      Application.MessageBox(pchar(e.Message),
        'Atenção', MB_ICONEXCLAMATION + MB_OK);
      registraErro('Procedure _setAtributos Erro: ' + e.Message);
    end;
  end;
end;

function TFechamentoPDV._setAtributos_Rel: boolean;
begin
  try
    Result := False;
    vNumeroPDV_Rel := vPdv.dataSet.FieldByName('cod_terminal').AsInteger;
    buscas.close;
    buscas.SQL.Text := 'select ti.num_serie_ecf from terminal_impressoras ti' +
      ' where ti.cod_terminal = ' + IntToStr(vNumeroPDV_Rel) +
      ' and ti.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ti.atual = ''S'' ';
    buscas.Open;
    if buscas.IsEmpty then
      raise
        Exception.Create('Configuração do PDV não encontrada para o Relatório. Numero de Série do ECF em TERMINAL_IMPRESSORAS');

    vNumeroSerieECF_Rel := buscas.FieldByName('num_serie_ecf').AsString;

    vMeioPg.vNumeroPDV_Rel := Self.vNumeroPDV_Rel;
    vMeioPg.vOperador_Rel := Self.vOperador_Rel;
    vMeioPg.vNumeroSerieECF_Rel := Self.vNumeroSerieECF_Rel;
    vMeioPg.vDataMovimento_Rel := Self.vDataMovimento_Rel;
    Result := True;
  except
    on e: Exception do
    begin
      Application.MessageBox(pchar(e.Message),
        'Atenção', MB_ICONEXCLAMATION + MB_OK);
      registraErro('Procedure _setAtributos Erro: ' + e.Message);
    end;
  end;
end;

function TFechamentoPDV._validasCamposPadrao: boolean;
var
  vTempString: string;
begin
  try
    Result := False;
    if vCampos.Cupom <= 0 then
      raise Exception.Create('Cupom não informado');

    if vCampos.CodCliente <= 0 then
      raise Exception.Create('Cliente não informado');

    if vCampos.Historico = '' then
      raise Exception.Create('Histórico não informado');

    if _existeCliente(vCampos.CodCliente, vTempString) then
      vCampos.NomeCliente := vTempString
    else
      raise Exception.Create('Cliente não encontrado');

    if vCampos.CodTerceiro < 0 then
      vCampos.CodTerceiro := 0
    else if vCampos.CodTerceiro > 0 then
      if _existeCliente(vCampos.CodTerceiro, vTempString) then
        vCampos.NomeTerceiro := vTempString
      else
        raise Exception.Create('Cliente Terceiro não encontrado');

    Result := True;
  except
    on e: Exception do
    begin
      Application.MessageBox(pchar(e.Message),
        'Atenção', MB_ICONEXCLAMATION + MB_OK);
      registraErro('Procedure _validasCamposPadrao Erro: ' + e.Message);
    end;
  end;
end;

{ TControles_FPDV }

function TControles_FPDV.buscaControles(pCodControle: integer): boolean;
begin
  buscas.Close;
  buscas.SQL.Text := ' select ct.codigo_ctrl from controles ct' +
    ' where ct.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and ct.codigo_ctrl = ' + IntToStr(pCodControle);
  buscas.Open;

  Result := not buscas.IsEmpty;  
end;

constructor TControles_FPDV.create;
begin
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsCtrl);
  buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TControles_FPDV._abrirControles: boolean;
begin
  Result := montaSelect('select ' + getCamposSQL + ' from controles ct' +
    ' where ct.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and ct.cxent = ''S'' ' +
    ' and ct.ativo <> 99 ' +
    ' order by ct.codigo_ctrl ');
end;

function TControles_FPDV.getCamposSQL: string;
begin
  Result := 'ct.codigo_ctrl, ct.nome_ctrl, ct.tp_plano, ct.cod_finalizador, ct.docs, ct.taxa_cartao, ct.nao_gera_finan, ct.baixa_automatica, ct.n_conta_bx_auto';
end;

function TControles_FPDV._abreTodosControlesBarramentoAutomaticoCAR: Boolean;
begin
  Result := montaSelect('select ' + getCamposSQL + ' from controles ct' +
    ' where ct.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and ct.ativo = 1 ' +
    ' and ct.barrar_automatico = ''S'' ' +
    ' order by ct.codigo_ctrl ');
end;

function TControles_FPDV._abrirControlePrazo: boolean;
begin
  Result := montaSelect('select distinct ' + getCamposSQL + ' from controles ct' +
    ' inner join finalizadores f on f.cod_finalizador = ct.cod_finalizador' +
    ' where upper(f.descricao) like ''%PRAZO%'' ' +
    ' and f.cod_terminal = ' + IntToStr(vNumeroPDV) +
    ' and f.nserieecf = ' + QuotedStr(vNumeroSerieECF) +
    ' and f.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cxent = ''S'' ' +
    ' and ct.ativo <> 99 ' +
    ' order by ct.codigo_ctrl ');
end;

function TControles_FPDV._abrirControles(pCodControle: integer): boolean;
begin
  montaSelect('select ' + getCamposSQL + ' from controles ct' +
    ' where ct.codigo_emp = ' + vDadosIni.codEmpresa +
    ' and ct.codigo_ctrl = ' + IntToStr(pCodControle) +
    ' and ct.ativo <> 99 ' +
    ' order by ct.codigo_ctrl ');
  if dataSet.IsEmpty then
    Result := _abrirControles
  else
    Result := True;
end;

function TControles_FPDV._abrirTodosControles(pOrdem: string; pCodEmpresa: Integer = 0): boolean;
begin
 if pCodEmpresa > 0 then
   Result := montaSelect(' select (trim(coalesce(ct.nome_ctrl, '''')) ||'' - ''|| trim(coalesce(ct.docs, ''''))) nome_ctrl, ' +
    ' ct.* from controles ct ' +
    ' where ct.codigo_emp = ' + IntToStr(pCodEmpresa) +
    ' and ct.ativo <> 99 ' +
    ' order by ct.' + pOrdem)
 else
   Result := montaSelect(' select (trim(coalesce(ct.nome_ctrl, '''')) ||'' - ''|| trim(coalesce(ct.docs, ''''))) nome_ctrl, ' +
      ' ct.* from controles ct ' +
      ' where ct.codigo_emp = ' + vDadosIni.codEmpresa +
      ' and ct.ativo <> 99 ' +
      ' order by ct.' + pOrdem);
end;

{ TRetorno }

constructor TRetorno.create;
begin
  if dtmImportPDVFinan = nil then
    dtmImportPDVFinan := TdtmImportPDVFinan.Create(dtmImportPDVFinan);

  buscas := TIBQuery(dtmImportPDVFinan.qrControleCreditos);
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsControleCreditos);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);

  buscas.Close;

  buscas.Transaction								:= transacao;

  if _Empresas = nil then
  	_Empresas := TEmpresasUnificadas.create;

  if _Controle = nil then
    _Controle := TControle_Busca.create;

  if _Cobrebem = nil then
    _Cobrebem := TCobrebemPesq.create;

  if _CBX = nil then
    _CBX := TCBX.create;

  if _LoteQuit = nil then
    _LoteQuit := TLoteQuitImp.create;

  if _FechCaixa = nil then
    _FechCaixa := TFechCaixaImp.create;

  if _BaixaCredito = nil then
    _BaixaCredito := TBaixaCreditoImp.create;

  if _Lancamentos = nil then
    _Lancamentos := TLancamentosImp.create;

  if _ContaLigacao = nil then
    _ContaLigacao := TContaLigacaoImp.create;

  if _Boletos = nil then
    _Boletos := TBoletosImp.create;

  if _OcorrenciaBancaria = nil then
  	_OcorrenciaBancaria := TConvenioOcorrenciaBancaria.create;

  if _TitulosNaoEncontrados = nil then
  begin
    _TitulosNaoEncontrados := TClientDataSet.Create(nil);
    _TitulosNaoEncontrados.Close;
    _TitulosNaoEncontrados.FieldDefs.Clear;
    _TitulosNaoEncontrados.FieldDefs.Add('SEL', ftString, 1, false);
    _TitulosNaoEncontrados.FieldDefs.Add('COD_EMPRESA', ftInteger, 0, false);
    _TitulosNaoEncontrados.FieldDefs.Add('DATA_EM_BOL', ftDateTime, 0, false);
    _TitulosNaoEncontrados.FieldDefs.Add('DATA_VEN_BOL', ftDateTime, 0, false);
    _TitulosNaoEncontrados.FieldDefs.Add('TITULONOSSONUMERO', ftString, 20, false);
    _TitulosNaoEncontrados.FieldDefs.Add('TITULONUMERODOCUMENTO', ftString, 10, false);
    _TitulosNaoEncontrados.FieldDefs.Add('TITULODATAVENCIMENTO', ftDateTime, 0, false);
    _TitulosNaoEncontrados.FieldDefs.Add('PAGAMENTODATA', ftDateTime, 0, false);
    _TitulosNaoEncontrados.FieldDefs.Add('PAGAMENTOVALORPAGO', ftFloat, 0, false);
    _TitulosNaoEncontrados.FieldDefs.Add('PAGAMENTOVALORCREDITO', ftFloat, 0, false);
    _TitulosNaoEncontrados.FieldDefs.Add('PAGAMENTOVALORTAXACOBRANCA', ftFloat, 0, false);
    _TitulosNaoEncontrados.FieldDefs.Add('PAGAMENTOVALORACRESCIMOS', ftFloat, 0, false);
    _TitulosNaoEncontrados.FieldDefs.Add('PAGAMENTOVALOROUTROSCREDITOS', ftFloat, 0, false);
    _TitulosNaoEncontrados.FieldDefs.Add('CODIGOMOVIMENTO', ftString, 2, false);
    _TitulosNaoEncontrados.FieldDefs.Add('DESCRICAO_MOVIMENTO', ftString, 50, false);

    if _TitulosNaoEncontrados.Tag = 0 then
    try
      _TitulosNaoEncontrados.CreateDataSet;
      _TitulosNaoEncontrados.Tag := 1;

      _TitulosNaoEncontrados.FieldByName('COD_EMPRESA').Visible  := False;
      _TitulosNaoEncontrados.FieldByName('DATA_EM_BOL').Visible  := False;
      _TitulosNaoEncontrados.FieldByName('DATA_VEN_BOL').Visible := False;

      _TitulosNaoEncontrados.FieldByName('SEL').DisplayLabel := 'Sel';
      _TitulosNaoEncontrados.FieldByName('TITULONOSSONUMERO').DisplayLabel := 'Nosso Numero';
      _TitulosNaoEncontrados.FieldByName('TITULONUMERODOCUMENTO').DisplayLabel := 'Numero Documento';
      _TitulosNaoEncontrados.FieldByName('TITULODATAVENCIMENTO').DisplayLabel := 'Data Vencimento';
      _TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORPAGO').DisplayLabel := 'Valor Pago';
      _TitulosNaoEncontrados.FieldByName('PAGAMENTODATA').DisplayLabel := 'Data Pagamento';
      TFloatField(_TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORPAGO')).DisplayFormat := '#,##0.00';
      _TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORCREDITO').DisplayLabel := 'Valor Crédito';
      TFloatField(_TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORCREDITO')).DisplayFormat := '#,##0.00';
      _TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORTAXACOBRANCA').DisplayLabel := 'Valor Taxa Cobrança';
      TFloatField(_TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORTAXACOBRANCA')).DisplayFormat := '#,##0.00';
      _TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORACRESCIMOS').DisplayLabel := 'Valor Acréscimo';
      TFloatField(_TitulosNaoEncontrados.FieldByName('PAGAMENTOVALORACRESCIMOS')).DisplayFormat := '#,##0.00';
      _TitulosNaoEncontrados.FieldByName('PAGAMENTOVALOROUTROSCREDITOS').DisplayLabel := 'Valor Outros Créditos';
      TFloatField(_TitulosNaoEncontrados.FieldByName('PAGAMENTOVALOROUTROSCREDITOS')).DisplayFormat := '#,##0.00';
      _TitulosNaoEncontrados.FieldByName('CODIGOMOVIMENTO').DisplayLabel := 'Código Ocorrencia';
      _TitulosNaoEncontrados.FieldByName('DESCRICAO_MOVIMENTO').DisplayLabel := 'Descrição Ocorrencia';

      _TitulosNaoEncontradosDtSource := TDataSource.Create(nil);
	    _TitulosNaoEncontradosDtSource.DataSet := _TitulosNaoEncontrados;
    except
    end;
  end;

  if _CreditosVincular = nil then
  begin
  	_CreditosVincular := TClientDataSet.Create(nil);
    _CreditosVincular.Close;
    _CreditosVincular.FieldDefs.Clear;
    _CreditosVincular.FieldDefs.Add('CODIGO_EMP', ftInteger, 0, false);
    _CreditosVincular.FieldDefs.Add('COD_EMP_MULT', ftInteger, 0, false);
    _CreditosVincular.FieldDefs.Add('COD_COBREBEM', ftInteger, 0, false);
    _CreditosVincular.FieldDefs.Add('N_DOC_C', ftString, 20, false);
    _CreditosVincular.FieldDefs.Add('NOSSO_NUMERO_BANCO', ftString, 20, false);
		_CreditosVincular.FieldDefs.Add('VALOR_C', ftFloat, 0, false);
    _CreditosVincular.FieldDefs.Add('DATA_REC_C', ftDateTime, 0, false);
    _CreditosVincular.FieldDefs.Add('DATA_VENC_C', ftDateTime, 0, false);
    _CreditosVincular.FieldDefs.Add('DATQ_C', ftDateTime, 0, false);
    _CreditosVincular.FieldDefs.Add('TIPO_DOC_C', ftString, 15, false);
    _CreditosVincular.FieldDefs.Add('NOME_C', ftString, 35, false);
    _CreditosVincular.FieldDefs.Add('VALOR_CORR', ftFloat, 0, false);
    _CreditosVincular.FieldDefs.Add('HISTORICO_C', ftString, 100, false);
    _CreditosVincular.FieldDefs.Add('COD_CRED', ftInteger, 0, false);
    _CreditosVincular.FieldDefs.Add('CODIGO_CTRL', ftInteger, 0, false);
    _CreditosVincular.FieldDefs.Add('STATUS_C', ftString, 10, false);
    _CreditosVincular.FieldDefs.Add('RAZAO', ftString, 60, false);

    if _CreditosVincular.Tag = 0 then
    try
      _CreditosVincular.CreateDataSet;
      _CreditosVincular.Tag := 1;

      _CreditosVincular.FieldByName('CODIGO_EMP').Visible  := False;
    	if not vDadosIni.vEmp.vFinanceiroUnificado then
	      _CreditosVincular.FieldByName('COD_EMP_MULT').Visible  := False;

      _CreditosVincular.FieldByName('COD_EMP_MULT').DisplayLabel := 'Cod Unificada';
      _CreditosVincular.FieldByName('COD_COBREBEM').DisplayLabel := 'Cod Convenio';
      _CreditosVincular.FieldByName('N_DOC_C').DisplayLabel := 'Número Documento';
      _CreditosVincular.FieldByName('CODIGO_CTRL').DisplayLabel := 'Cod Controle';
      _CreditosVincular.FieldByName('DATA_REC_C').DisplayLabel := 'Data Cadastro';
      _CreditosVincular.FieldByName('DATA_VENC_C').DisplayLabel := 'Data Vencimento';
      _CreditosVincular.FieldByName('DATQ_C').DisplayLabel := 'Data Quitação';
      _CreditosVincular.FieldByName('STATUS_C').DisplayLabel := 'Status';
      _CreditosVincular.FieldByName('NOME_C').DisplayLabel := 'Nome Fantasia';
      _CreditosVincular.FieldByName('RAZAO').DisplayLabel := 'Razão Social';
      _CreditosVincular.FieldByName('VALOR_C').DisplayLabel := 'Valor Crédito';
      TFloatField(_CreditosVincular.FieldByName('VALOR_C')).DisplayFormat := '#,##0.00';
      _CreditosVincular.FieldByName('VALOR_CORR').DisplayLabel := 'Valor Corrigido';
      TFloatField(_CreditosVincular.FieldByName('VALOR_CORR')).DisplayFormat := '#,##0.00';
      _CreditosVincular.FieldByName('TIPO_DOC_C').DisplayLabel := 'Tipo Documento';
      _CreditosVincular.FieldByName('HISTORICO_C').DisplayLabel := 'Histórico';
      _CreditosVincular.FieldByName('NOSSO_NUMERO_BANCO').DisplayLabel := 'Nosso Número Banco';
      _CreditosVincular.FieldByName('COD_CRED').DisplayLabel := 'Cod Cred';

      _CreditosVincularDtSource := TDataSource.Create(nil);
	    _CreditosVincularDtSource.DataSet := _CreditosVincular;
    except
    end;
  end; 

  _vquitacaocredito := TQuitacaoCreditos.create;

  _vrelquitacaocredito := TRelQuitacaoCreditos.create;

  vCreditosNaoEncontrados := false;
end;

procedure TLoteQuitImp._VerificarCodigoAutoIncremento(generator, campo, tabela: string);
var
  codigoGenerator: integer;
  codigoBaixaCred: Integer;
begin
  buscas.close;
  buscas.SQL.Text := ' select GEN_ID(' + generator + ',1) from rdb$database';
  buscas.Open;

  codigoGenerator := buscas.FieldByName('GEN_ID').asinteger;
  codigoBaixaCred := 0;

  if (trim(generator) = 'INC_L_QUIT')  then
  begin
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

      codigoBaixaCred := buscas.FieldByName('max').AsInteger + 1;

      if (codigoBaixaCred > codigoGenerator) then
      begin
        buscas.close;
        buscas.SQL.Text := ' set generator ' + generator + ' to ' + IntToStr(codigoBaixaCred);
        buscas.ExecSQL;

        codigoGenerator := codigoBaixaCred;
      end;
    end
    else
    begin
      buscas.close;
      buscas.SQL.Text := ' select max(lot.n_lote_quit) from lote_quit lot ' +
        ' where lot.codigo_emp in ' + vDadosIni.vEmp.vCodigoUnificadas;
      buscas.Open;

      codigoBaixaCred := buscas.FieldByName('max').AsInteger + 1;

      if (codigoBaixaCred > codigoGenerator) then
      begin
        buscas.close;
        buscas.SQL.Text := ' set generator ' + generator + ' to ' + IntToStr(codigoBaixaCred);
        buscas.ExecSQL;

        codigoGenerator := codigoBaixaCred;
      end;
    end;
  end;

  dataSet.FieldByName(campo).AsInteger := codigoGenerator;

//  buscas.close;
//  buscas.SQL.Text := 'select coalesce(max(' + campo + ')+1,0) as cod from ' + tabela + '';
//  buscas.Open;
//  codigo := buscas.FieldByName('cod').asinteger;
//  if (dataSet.FieldByName(campo).AsInteger <> codigo) then
//  begin
//    ExecutaComandosSql('SET GENERATOR ' + generator + ' TO ' + IntToStr(codigo));
//    buscas.close;
//    buscas.SQL.Text := 'select GEN_ID(' + generator + ',1) from rdb$database';
//    buscas.Open;
//    dataSet.FieldByName(campo).AsInteger := buscas.FieldByName('GEN_ID').asinteger;
//  end;
end;

function TRetorno.Insert: boolean;
begin
  result := inherited Insert;
  if result then
end;

procedure TRetorno.RetornaDadosArqRet;
begin
	vSequenciaArqRet := '';
  vDataGravacaoArqRet := StrToDate('01/01/2019');
  vQtdecorrenciasCobranca := 0;
  
	buscas.Close;
	buscas.SQL.Text := ' select count(*) from boletas bol ' +
  	' where bol.cod_empresa = ' + IntToStr(vCodEmpresa) +
		' and bol.cod_cobrebem = ' + IntToStr(vCodCobrebem) +
    ' and bol.api_idretintegracao = ' + QuotedStr(vProcoloRet) +
    ' union all ' +
    ' select count(*) from titulos_nao_conciliados tit ' +
    ' where tit.cod_empresa = ' + IntToStr(vCodEmpresa) +
    ' and tit.cod_cobrebem = ' + IntToStr(vCodCobrebem) +
    ' and tit.api_protocolo = ' + QuotedStr(vProcoloRet);
  buscas.Open;

  buscas.First;
  while not buscas.Eof do
  begin
  	vQtdecorrenciasCobranca := vQtdecorrenciasCobranca + buscas.FieldByName('count').AsInteger;

    buscas.Next;
  end;

	buscas.Close;
	buscas.SQL.Text := ' select iif(arq.data_hora is not null, cast(arq.data_hora as date), current_date) data_hora, ' +
  	' coalesce(numeroarquivo, '''') numeroarquivo from arq_boleto arq ' +
  	' where arq.cod_empresa = ' + vDadosIni.codEmpresa +
		' and arq.cod_cobrebem = ' + IntToStr(vCodCobrebem) +
    ' and arq.tipo = ''RETORNO'' ' + 
    ' and arq.api_protocolo = ' + QuotedStr(vProcoloRet) +
    ' order by arq.data_hora desc ';
  buscas.Open;

  if not buscas.IsEmpty then
  begin
  	vSequenciaArqRet := buscas.FieldByName('NUMEROARQUIVO').AsString;
    vDataGravacaoArqRet := buscas.FieldByName('DATA_HORA').AsDateTime;
  end;
end;

function TRetorno.RetornaProtocoloRet(pCodconvenio: Integer; pCodEmpresa: Integer; pDiretorioArquivo: string): string;
begin
	Result := '';

  buscas.Close;
	buscas.SQL.Text := ' select first 1 coalesce(seqid, 0) seqid, ' +
  	' coalesce(api_protocolo, '''') api_protocolo from arq_boleto ' +
  	' where cod_empresa = ' + IntToStr(pCodEmpresa) +
    ' and COD_COBREBEM = ' + IntToStr(pCodconvenio) +
    ' and tipo = ''RETORNO'' ' +
    ' and descricao_arq = ' + QuotedStr(ExtractFileName(pDiretorioArquivo)) +
    ' order by seqid desc ';
  buscas.Open;

  if buscas.IsEmpty then
  begin
  	Application.MessageBox('Falha ao processar arquivo de retorno', 'Atenção', 0 + 64);
  	exit;
  end;

  Result := trim(buscas.FieldByName('api_protocolo').AsString);

  if trim(Result) = '' then
  begin
  	Application.MessageBox('Falha ao processar arquivo de retorno', 'Atenção', 0 + 64);
  	exit;
  end;
end;

function TRetorno.SalvarDadosRetorno(arquivo: string): boolean;
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
      
    // Salvando retorno no BD
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

    vSeqId := Gencodigo('ARQ_BOLETO_RET', buscas, IntToStr(vCodEmpresa));

    buscas.Close;
    buscas.SQL.Text := ' SELECT MAX(SEQID) CODMAX FROM ARQ_BOLETO ' +
      ' WHERE COD_EMPRESA = :COD_EMPRESA AND TIPO = :TIPO ';
    buscas.ParamByName('COD_EMPRESA').AsInteger := vCodEmpresa;
    buscas.ParamByName('TIPO').AsString := 'RETORNO';
    buscas.Open;
    vCodMax := buscas.FieldByName('CODMAX').AsInteger;

    if (vCodMax + 1 > vSeqId) then
    begin
      vSeqId := vCodMax + 1;

      SqlExec(' update codigo set valor = ' + IntToStr(vCodMax + 1) +
        ' where tabela = ''ARQ_BOLETO_RET'' and cod_empresa = ' + vDadosIni.codEmpresa, buscas);
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;
    end;

    buscas.Close;
    buscas.SQL.Text := ' INSERT INTO ARQ_BOLETO (SEQID, COD_EMPRESA, COD_COBREBEM, DESCRICAO_ARQ, TIPO, DOC) ' +
      ' VALUES (:SEQID, :COD_EMPRESA, :COD_COBREBEM, :DESCRICAO_ARQ, :TIPO, :DOC)';
    buscas.ParamByName('SEQID').AsInteger := vSeqId;
    buscas.ParamByName('COD_EMPRESA').AsInteger := vCodEmpresa;
    buscas.ParamByName('COD_COBREBEM').AsInteger := vCodCobrebem;
    buscas.ParamByName('TIPO').AsString := 'RETORNO';
    buscas.ParamByName('DESCRICAO_ARQ').AsString := ExtractFileName(arquivo);
    buscas.ParamByName('DOC').AsString := vlista.Text;
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;
    Result := true;
  except on E: Exception do
		begin
  	  Result := False;
    	Application.MessageBox(PChar('Erro ao salvar dados do retorno: ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
     	registraErro('Erro ao salvar dados do retorno: ' + e.Message);
    end;
  end;
end;

function TRetorno.verificarContasLigacao: boolean;
var
	vNCON_S_CRD: Double;
  vNCON_V_PROD: Double;
  vNCON_D_PREST: Double;
  vNCON_J_PREST: Double;
  vNCON_SJ_PREST: Double;
  vNCON_TARIFABANCARIA: Double;
begin
	try
		Result := False;

    SqlOpen(' select NCON_S_CRD, NCON_V_PROD, NCON_D_PREST, NCON_J_PREST, NCON_SJ_PREST, NCON_TARIFABANCARIA from CONT_LIG ' +
    	' where COD_EMP = ' + vDadosIni.codEmpresa, buscas);

    vNCON_S_CRD := buscas.FieldByName('NCON_S_CRD').AsFloat;
    vNCON_V_PROD := buscas.FieldByName('NCON_V_PROD').AsFloat;
    vNCON_D_PREST := buscas.FieldByName('NCON_D_PREST').AsFloat;
    vNCON_J_PREST := buscas.FieldByName('NCON_J_PREST').AsFloat;
    vNCON_SJ_PREST := buscas.FieldByName('NCON_SJ_PREST').AsFloat;
    vNCON_TARIFABANCARIA := buscas.FieldByName('NCON_TARIFABANCARIA').AsFloat;

    if vNCON_S_CRD <= 0 then
    begin
    	Application.MessageBox(pchar('Conta de ligação saída de créditos não informada no cadastro da empresa'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    SqlOpen(' select N_CONTA_PLC, TIPO_PLC from P_CONTAS ' +
    	' where N_CONTA_PLC = %s ',
      [StringReplace(FloatToStr(vNCON_S_CRD), ',', '.', [rfReplaceAll])], buscas);

    if buscas.IsEmpty then
    begin
    	Application.MessageBox(pchar('Conta de ligação saída de créditos informada no cadastro da empresa não encontrada no cadastro de plano de contas'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    if buscas.FieldByName('TIPO_PLC').AsString <> 'S' then
    begin
    	Application.MessageBox(pchar('Conta de ligação saída de créditos informada no cadastro da empresa deve ser da natureza SAÍDA'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;
    
    if vNCON_V_PROD <= 0 then
    begin
    	Application.MessageBox(pchar('Conta de ligação venda de produtos não informada no cadastro da empresa'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    SqlOpen(' select N_CONTA_PLC, TIPO_PLC from P_CONTAS ' +
    	' where N_CONTA_PLC = %s ',
      [StringReplace(FloatToStr(vNCON_V_PROD), ',', '.', [rfReplaceAll])], buscas);

    if buscas.IsEmpty then
    begin
    	Application.MessageBox(pchar('Conta de ligação venda de produtos informada no cadastro da empresa não encontrada no cadastro de plano de contas'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    if buscas.FieldByName('TIPO_PLC').AsString <> 'E' then
    begin
    	Application.MessageBox(pchar('Conta de ligação venda de produtos informada no cadastro da empresa deve ser da natureza ENTRADA'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    if vNCON_D_PREST <= 0 then
    begin
    	Application.MessageBox(pchar('Conta de ligação saída de desconto para prestações não informada no cadastro da empresa'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    SqlOpen(' select N_CONTA_PLC, TIPO_PLC from P_CONTAS ' +
    	' where N_CONTA_PLC = %s ',
      [StringReplace(FloatToStr(vNCON_D_PREST), ',', '.', [rfReplaceAll])], buscas);

    if buscas.IsEmpty then
    begin
    	Application.MessageBox(pchar('Conta de ligação saída de desconto para prestações informada no cadastro da empresa não encontrada no cadastro de plano de contas'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    if buscas.FieldByName('TIPO_PLC').AsString <> 'S' then
    begin
    	Application.MessageBox(pchar('Conta de ligação saída de desconto para prestações informada no cadastro da empresa deve ser da natureza SAÍDA'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    if vNCON_J_PREST <= 0 then
    begin
    	Application.MessageBox(pchar('Conta de ligação entrada de juros para prestações não informada no cadastro da empresa'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    SqlOpen(' select N_CONTA_PLC, TIPO_PLC from P_CONTAS ' +
    	' where N_CONTA_PLC = %s ',
      [StringReplace(FloatToStr(vNCON_J_PREST), ',', '.', [rfReplaceAll])], buscas);

    if buscas.IsEmpty then
    begin
    	Application.MessageBox(pchar('Conta de ligação entrada de juros para prestações informada no cadastro da empresa não encontrada no cadastro de plano de contas'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    if buscas.FieldByName('TIPO_PLC').AsString <> 'E' then
    begin
    	Application.MessageBox(pchar('Conta de ligação entrada de juros para prestações informada no cadastro da empresa deve ser da natureza ENTRADA'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    if vNCON_SJ_PREST <= 0 then
    begin
    	Application.MessageBox(pchar('Conta de ligação saída de juros para prestações não informada no cadastro da empresa'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    SqlOpen(' select N_CONTA_PLC, TIPO_PLC from P_CONTAS ' +
    	' where N_CONTA_PLC = %s ',
      [StringReplace(FloatToStr(vNCON_SJ_PREST), ',', '.', [rfReplaceAll])], buscas);

    if buscas.IsEmpty then
    begin
    	Application.MessageBox(pchar('Conta de ligação saída de juros para prestações informada no cadastro da empresa não encontrada no cadastro de plano de contas'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    if buscas.FieldByName('TIPO_PLC').AsString <> 'S' then
    begin
    	Application.MessageBox(pchar('Conta de ligação saída de juros para prestações informada no cadastro da empresa deve ser da natureza SAÍDA'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    if vNCON_TARIFABANCARIA <= 0 then
    begin
    	Application.MessageBox(pchar('Conta de ligação tarifa bancária não informada no cadastro da empresa'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    SqlOpen(' select N_CONTA_PLC, TIPO_PLC from P_CONTAS ' +
    	' where N_CONTA_PLC = %s ',
      [StringReplace(FloatToStr(vNCON_TARIFABANCARIA), ',', '.', [rfReplaceAll])], buscas);

    if buscas.IsEmpty then
    begin
    	Application.MessageBox(pchar('Conta de ligação tarifa bancária informada no cadastro da empresa não encontrada no cadastro de plano de contas'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    if buscas.FieldByName('TIPO_PLC').AsString <> 'S' then
    begin
    	Application.MessageBox(pchar('Conta de ligação tarifa bancária informada no cadastro da empresa deve ser da natureza SAÍDA'), 'Atenção', MB_OK + MB_ICONWARNING);
   		exit;
    end;

    Result := True;
    
  except
    on e: exception do
    begin
      result := True;
      Application.MessageBox(pchar('Erro ao verificar contas de ligação. Erro: ' +
        e.Message), 'Informação', MB_OK + MB_ICONINFORMATION);
      registraErro('function TRetorno.verificarContasLigacao Erro: ' + e.Message);
    end;
  end;
end;

function TRetorno.VincularTituloNaoEncontrado(
	pNumDoc: string; pValorDoc: Double; pValorPago: Double;
  pDataBase: TDateTime; pDataVenc: TDateTime;
  pNossoNumero: string; pCodCobrebem: Integer;
  pCodEmpresa: Integer): boolean;
var
	codigo: string;
begin
	try
    Result := False;

    try
      vDadosIni.abreStatusProcessamento('', 'Aguarde. Localizando crédito(s)');

      buscas.Close;
      buscas.SQL.Text :=
        '   select COD_CRED, CODIGO_EMP, COD_EMP_MULT, COD_COBREBEM, ' +
        '   COALESCE(N_DOC_C, '''') N_DOC_C, ' +
        '   COALESCE(VALOR_C, 0) VALOR_C, ' +
        '   COALESCE(VALOR_CORR, 0) VALOR_CORR, ' +
        '   CODIGO_CTRL, DATA_REC_C, DATA_VENC_C, TIPO_DOC_C, ' +
        '   DATQ_C, STATUS_C, HISTORICO_C, NOSSO_NUMERO_BANCO, ' +
        '   NOME_C, RAZAO FROM CONTROLE_CREDITOS ' +
        '   where (select result from retirar_zero_esquerda (N_DOC_C)) = ' +
        '			(select result from retirar_zero_esquerda (' + QuotedStr(pNumDoc) + ')) ' +
        {vDadosIni.IfThen((pDataBase = Null) and (pDataVenc = Null), '',
          ' and DATA_VENC_C >= ' + QuotedStr(FormatDateTime('dd.mm.yyyy', pDataBase - 30)) + ' and DATA_VENC_C <= ' + QuotedStr(FormatDateTime('dd.mm.yyyy', pDataBase + 30))) +
        vDadosIni.IfThen(pDataBase = Null, '',
          vDadosIni.IfThen(pDataVenc = Null, '',
            ' and DATA_VENC_C = ' + QuotedStr(FormatDateTime('dd.mm.yyyy', pDataVenc)))) +}
        '   and COD_COBREBEM = ' + IntToStr(Retorno.vCodCobrebem) +
//        '   and (PRCSS is null or PRCSS <> ''S'') ' +
//        '   and (LTRIM(STATUS_C) <>  ''QUITADO'' and RTRIM(STATUS_C) <>  ''QUITADO'' or STATUS_C is null ) ' +
        vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          ' and COD_EMP_MULT = ' + IntToStr(pCodEmpresa),
          ' and CODIGO_EMP = ' + vDadosIni.codEmpresa) +
        '   union ' +
        '   select COD_CRED, CODIGO_EMP, COD_EMP_MULT, COD_COBREBEM, ' +
        '   COALESCE(N_DOC_C, '''') N_DOC_C, ' +
        '   COALESCE(VALOR_C, 0) VALOR_C, ' +
        '   COALESCE(VALOR_CORR, 0) VALOR_CORR, ' +
        '   CODIGO_CTRL, DATA_REC_C, DATA_VENC_C, TIPO_DOC_C, ' +
        '   DATQ_C, STATUS_C, HISTORICO_C, NOSSO_NUMERO_BANCO, ' +
        '   NOME_C, RAZAO from controle_creditos ' +
        '   where (select result from retirar_zero_esquerda (N_DOC_C)) = ' +
        '			(select result from retirar_zero_esquerda (' + QuotedStr(pNumDoc) + ')) ' +
        {vDadosIni.IfThen((pDataBase = Null) and (pDataVenc = Null), '',
          ' and DATA_VENC_C >= ' + QuotedStr(FormatDateTime('dd.mm.yyyy', pDataBase - 30)) + ' and DATA_VENC_C <= ' + QuotedStr(FormatDateTime('dd.mm.yyyy', pDataBase + 30))) +
        vDadosIni.IfThen(pDataBase = Null, '',
          vDadosIni.IfThen(pDataVenc = Null, '',
            ' and DATA_VENC_C = ' + QuotedStr(FormatDateTime('dd.mm.yyyy', pDataVenc)))) +}
//        '   and (PRCSS is null or PRCSS <> ''S'') ' +
//        '   and (LTRIM(STATUS_C) <>  ''QUITADO'' and RTRIM(STATUS_C) <>  ''QUITADO'' or STATUS_C is null ) ' +
        vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          ' and COD_EMP_MULT = ' + IntToStr(pCodEmpresa),
          ' and CODIGO_EMP = ' + vDadosIni.codEmpresa) +
        '   union ' +
        '   select COD_CRED, CODIGO_EMP, COD_EMP_MULT, COD_COBREBEM, ' +
        '   COALESCE(N_DOC_C, '''') N_DOC_C, ' +
        '   COALESCE(VALOR_C, 0) VALOR_C, ' +
        '   COALESCE(VALOR_CORR, 0) VALOR_CORR, ' +
        '   CODIGO_CTRL, DATA_REC_C, DATA_VENC_C, TIPO_DOC_C, ' +
        '		DATQ_C, STATUS_C, HISTORICO_C, NOSSO_NUMERO_BANCO, ' +
        '   NOME_C, RAZAO from controle_creditos ' +
        '   where (select result from retirar_zero_esquerda (N_DOC_C)) = ' +
        '			(select result from retirar_zero_esquerda (' + QuotedStr(pNumDoc) + ')) ' +
        {vDadosIni.IfThen((pDataBase = Null) and (pDataVenc = Null), '',
          ' and DATA_VENC_C >= ' + QuotedStr(FormatDateTime('dd.mm.yyyy', pDataBase - 30)) + ' and DATA_VENC_C <= ' + QuotedStr(FormatDateTime('dd.mm.yyyy', pDataBase + 30))) +
        vDadosIni.IfThen(pDataBase = Null, '',
          vDadosIni.IfThen(pDataVenc = Null, '',
            ' and DATA_VENC_C = ' + QuotedStr(FormatDateTime('dd.mm.yyyy', pDataVenc)))) +}
//        '   and (PRCSS is null or PRCSS <> ''S'') ' +
//        '   and (LTRIM(STATUS_C) <>  ''QUITADO'' and RTRIM(STATUS_C) <>  ''QUITADO'' or STATUS_C is null ) ' +
        ' and CODIGO_EMP = ' + vDadosIni.codEmpresa;
      buscas.Open;

      _CreditosVincular.EmptyDataSet;

      buscas.First;
      while not buscas.Eof do
      begin
        _CreditosVincular.Insert;
        _CreditosVincular.FieldByName('CODIGO_EMP').AsInteger := buscas.FieldByName('CODIGO_EMP').AsInteger;
        _CreditosVincular.FieldByName('COD_COBREBEM').AsInteger := buscas.FieldByName('COD_COBREBEM').AsInteger;
        _CreditosVincular.FieldByName('CODIGO_CTRL').AsInteger := buscas.FieldByName('CODIGO_CTRL').AsInteger;
        _CreditosVincular.FieldByName('N_DOC_C').AsString := buscas.FieldByName('N_DOC_C').AsString;
        _CreditosVincular.FieldByName('NOME_C').AsString := buscas.FieldByName('NOME_C').AsString;
        _CreditosVincular.FieldByName('RAZAO').AsString := buscas.FieldByName('RAZAO').AsString;
        _CreditosVincular.FieldByName('VALOR_C').AsFloat := buscas.FieldByName('VALOR_C').AsFloat;
        _CreditosVincular.FieldByName('VALOR_CORR').AsFloat := buscas.FieldByName('VALOR_CORR').AsFloat;
        _CreditosVincular.FieldByName('DATA_REC_C').AsDateTime := buscas.FieldByName('DATA_REC_C').AsDateTime;
        _CreditosVincular.FieldByName('DATA_VENC_C').AsDateTime := buscas.FieldByName('DATA_VENC_C').AsDateTime;
        _CreditosVincular.FieldByName('DATQ_C').AsDateTime := buscas.FieldByName('DATQ_C').AsDateTime;
        _CreditosVincular.FieldByName('STATUS_C').AsString := buscas.FieldByName('STATUS_C').AsString;
        _CreditosVincular.FieldByName('TIPO_DOC_C').AsString := buscas.FieldByName('TIPO_DOC_C').AsString;
        _CreditosVincular.FieldByName('HISTORICO_C').AsString := buscas.FieldByName('HISTORICO_C').AsString;
        _CreditosVincular.FieldByName('NOSSO_NUMERO_BANCO').AsString := buscas.FieldByName('NOSSO_NUMERO_BANCO').AsString;
        _CreditosVincular.FieldByName('COD_CRED').AsInteger := buscas.FieldByName('COD_CRED').AsInteger;
        _CreditosVincular.FieldByName('COD_EMP_MULT').AsInteger := buscas.FieldByName('COD_EMP_MULT').AsInteger;
        _CreditosVincular.Post;

        buscas.Next;
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
    end;

    Result := vDadosIni.abreForm('Crédito(s) encontrado(s):' +
    	' Num Doc ' + trim(pNumDoc) +
      ' Nosso Numero ' + trim(pNossoNumero) +
      ' Valor Doc ' + FormatFloat('0.00', pValorDoc) +
      ' Valor Pag ' + FormatFloat('0.00', pValorPago) +
      vDadosIni.IfThen(pDataVenc > 0, ' Data Venc ' + FormatDateTime('dd/mm/yyyy', pDataVenc), ''),
      frmImportRetorno.pnCreditosVinc, frmImportRetorno.TabSheet_CreditosVinc);

    if not Result then
      exit;

    codigo := IntToStr(_CreditosVincular.FieldByName('COD_CRED').AsInteger);

    vDadosIni.GravaAuditoria('BOL021', 'VINCULAR CREDITO', '',
      'CONTROLE_CREDITOS',
      codigo, buscas);

    if _CreditosVincular.FieldByName('COD_EMP_MULT').AsInteger <> pCodEmpresa then
    begin
    	Application.MessageBox(pchar('Crédito selecionado pertence a empresa ' +
      	IntToStr(_CreditosVincular.FieldByName('COD_EMP_MULT').AsInteger) + '.' + #13 + #13 +
        'Favor verificar antes de continuar.'), 'Atenção',
        MB_OK + MB_ICONWARNING);
      Result := False;
      Exit;
    end;

    if (_CreditosVincular.FieldByName('COD_COBREBEM').AsInteger > 0)
    	and (_CreditosVincular.FieldByName('COD_COBREBEM').AsInteger <> pCodCobrebem) then
    begin
    	Application.MessageBox(pchar('Crédito selecionado vinculado ao convênio ' +
      	IntToStr(_CreditosVincular.FieldByName('COD_COBREBEM').AsInteger) + '.' + #13 + #13 +
        'Favor verificar antes de continuar.'), 'Atenção',
        MB_OK + MB_ICONWARNING);
      Result := False;
      Exit;
    end;

    if trim(_CreditosVincular.FieldByName('STATUS_C').AsString) = 'QUITADO' then
    begin
    	Application.MessageBox(pchar('Crédito selecionado se encontra quitado.' + #13 + #13 +
      	'Favor verificar antes de continuar.'), 'Atenção',
      	MB_OK + MB_ICONWARNING);
      Result := False;
      Exit;
    end;

    if pValorDoc <> _CreditosVincular.FieldByName('VALOR_C').AsFloat then
    begin
    	vDadosIni.vInibeMensPesqPros := 'S';
      if not vDadosIni.PesqPros('BOL041', 'LIBERAR', '',
        'CONTROLE_CREDITOS', codigo, buscas, true) then
      begin
        Application.MessageBox(pchar('Valor do título não encontrado difere do crédito selecionado' + #13 +
          'Processo [BOL041]'), 'Atenção',
          MB_OK + MB_ICONWARNING);
        Result := False;
        Exit;
      end
      else
      begin
      	if Application.MessageBox('Valor do título não encontrado difere do crédito selecionado. Deseja continuar mesmo assim?',
          'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
        begin
        	Result := False;
          exit;
        end;

        vDadosIni.GravaAuditoria('BOL041', 'LIBERADO',
          'VAL TIT NAO ENC: ' + FormatFloat('0.00', pValorDoc) +
          'VAL CREDITO: ' + FormatFloat('0.00', _CreditosVincular.FieldByName('VALOR_C').AsFloat),
          'CONTROLE_CREDITOS',
          codigo, buscas);
      end;
    end;

    if pDataVenc > 0 then
    begin
      if (pDataVenc <> _CreditosVincular.FieldByName('DATA_VENC_C').AsDateTime) then
      begin
        vDadosIni.vInibeMensPesqPros := 'S';

        if not vDadosIni.PesqPros('BOL042', 'LIBERAR', '',
          'CONTROLE_CREDITOS', codigo, buscas, true) then
        begin
          Application.MessageBox(pchar('Data de vencimento do boleto difere do crédito selecionado' + #13 +
            'Processo [BOL042]'), 'Atenção',
            MB_OK + MB_ICONWARNING);
          Result := False;
          Exit;
        end
        else
        begin
          if Application.MessageBox('Data de vencimento do título não encontrado difere do crédito selecionado. Deseja continuar mesmo assim?',
            'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
          begin
          	Result := False;
            exit;
          end;
          vDadosIni.GravaAuditoria('BOL042', 'LIBERADO',
            'DATA VENC TIT NAO ENC: ' + FormatDateTime('dd/mm/yyyy', pDataVenc) +
            'DATA VENC CRED: ' + FormatDateTime('dd/mm/yyyy', _CreditosVincular.FieldByName('DATA_VENC_C').AsDateTime),
            'CONTROLE_CREDITOS',
            codigo, buscas);
        end;
      end;
    end;

    buscas.Close;
    buscas.SQL.Text := ' update controle_creditos set ' +
    	' nosso_numero_banco = ' + QuotedStr(pNossoNumero) + ', ' +
      ' cod_cobrebem = ' + IntToStr(pCodCobrebem) +
      ' where cod_cred = ' + IntToStr(_CreditosVincular.FieldByName('cod_cred').AsInteger) +
      ' and codigo_emp = ' + IntToStr(_CreditosVincular.FieldByName('codigo_emp').AsInteger);
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    if Result then
      vDadosIni.GravaAuditoria('BOL021', 'VINCULAR CREDITO', 'SUCESSO', 'CONTROLE_CREDITOS', codigo, buscas)
    else
      vDadosIni.GravaAuditoria('BOL021', 'VINCULAR CREDITO', 'FALHA', 'CONTROLE_CREDITOS', codigo, buscas);

    if Result then
    	Application.MessageBox(pchar('O Crédito foi vinculado com sucesso.' + #13 + #13 +
      	'Após vincular aos título(s) não encontrado(s) aos crédito(s), favor clicar no botão processar arquivo para que os títulos possam ser quitados.'), 'Atenção', 0 + 64);
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(PChar('Erro ao vincular titulos não encontrado ao crédito: ' + pchar(e.Message)), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('Erro ao vincular titulos não encontrado ao crédito: ' + e.Message);
    end;
  end;
end;

destructor TRetorno.Destroy;
begin
  inherited;
end;

function TRetorno.finalizarProcessamento(pCodigoUnificada: Integer;
	pLancarTaxa: boolean; pLancarJuros: boolean; pLancarDesconto: boolean;
  pValorTaxa: Double; pTarifaLancada: boolean; var pCreditoEnc: boolean): Boolean;
var
  vLancL: TLancamentosImp;
  vContLigL: TContaLigacaoImp;
  vDiaFinanceiroFechado: TDate;
begin

//  ver como vai ficar a configuracao do cobrebem
//  	pois o cobrebem tem o vinculo com o controle financeiro
//    talvez seja interessante centralizar as configuracoes na unificadora, e criar o campo
//    ou entao obrigar o usuario a informar a unificada ( informando a unificada este metodo fica obsoleto )
//  do jeito que esta as unificadas podem gerar os boletos e a unificadora baixar o retorno
//  Depois de decidir, se necessario alterar o select nos boletos para pesquisar apenas nas unificadas
//  Encontrar uma forma da pesquisa pelo nosso numero nao trazer boletos que nao tem nada haver
//  testar com os retornos da hw


  Result := True;
  try
    // objetos usados para efetuar os lancamentos
    vLancL := TLancamentosImp.create;
    vContLigL := TContaLigacaoImp.create;

    //atribuicao da mesma transacao desta classe
    vLancL._setTransactionComponentes(transacao);
    vContLigL._AbrirContadeLigacao(True);

    try

      buscas.Close;
      buscas.SQL.Text := ' select max(fd.dia_fcd) dia_fcd from fech_Dia fd ' +
      	' where fd.codigo_emp = ' + vDadosIni.codEmpresa;
      buscas.Open;
      vDiaFinanceiroFechado := buscas.FieldByName('dia_fcd').AsDateTime;

      buscas.Close;
      buscas.SQL.Text :=
        'select bx.cod_emp_mult, bx.codigo_ctrl, c.n_banco_ctrl,' +
        ' sum(coalesce(bx.VALOR_QUITADO,0)) VALOR_QUITADO,' +
        ' sum(coalesce(bx.VALOR_C,0)) VALOR_C,' +
        ' sum(coalesce(bx.JUROS_COB,0)) JUROS_COB' +
        ' from BAIXA_CREDITOS bx' +
        ' left join controles c on c.codigo_ctrl = bx.codigo_ctrl and c.codigo_emp = bx.codigo_emp' +
        ' where bx.LOTE_QUIT = ' + IntToStr(_LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').AsInteger) +
        vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
        	' and bx.codigo_emp = ' + vDadosIni.codEmpresa,
          ' and bx.cod_emp_mult = ' + IntToStr(pCodigoUnificada)) +
        ' group by 1,2,3';
      buscas.Open;

      buscas.First;
      while not buscas.Eof do
      begin
      	pCreditoEnc := True;
        //historico padrao quando unificado
        fHistPadraoUnificadas := '';
        if vDadosIni.vEmp.vFinanceiroUnificado then
          fHistPadraoUnificadas := ' EMP: ' + vDadosIni.StrZero(buscas.FieldByName('COD_EMP_MULT').AsInteger, 3);

        ///  lancamento de saida
        vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_S_CRD').AsFloat;
        if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
          raiseExceptionCreate('Corrija o cadastro para continuar', '');
        vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
        vLancL.CODIGO_CTRL := buscas.FieldByName('CODIGO_CTRL').AsInteger;
        vLancL.DATA := vDiaFinanceiroFechado + 1;
        vLancL.DTREFERENCIA := vDiaFinanceiroFechado + 1;
        vLancL.HISTORICO_L := 'BX BOLETOS ' + Trim(buscas.FieldByName('N_BANCO_CTRL').AsString) +
          ' LOTE: ' + vDadosIni.StrZero(_LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').AsInteger, 6) + fHistPadraoUnificadas;
        vLancL.VALOR_L := buscas.FieldByName('VALOR_C').AsFloat;
        vLancL.LOTE_QUIT := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').AsInteger;
        vLancL.TP_MOD := 'S';
        if vDadosIni.vEmp.vFinanceiroUnificado then
          vLancL.COD_EMP_MULT := buscas.FieldByName('COD_EMP_MULT').AsInteger;
        vLancL.VL_CONTABIL := vLancL.VALOR_L;
        vLancL.TIP_CNT := 'C';
        vLancL._efetuarLancamento;

        ///  lancamento de entrada
        vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_V_PROD').AsFloat;
        if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
          raiseExceptionCreate('Corrija o cadastro para continuar', '');
        vLancL.TIPO_L := Trim(vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
        vLancL.CODIGO_CTRL := _Controle.dataSet.FieldByName('codigo_ctrl').AsInteger;
        vLancL.DATA := vDiaFinanceiroFechado + 1;
        vLancL.DTREFERENCIA := vDiaFinanceiroFechado + 1;
        vLancL.HISTORICO_L := 'ENTRADA CREDITOS BOLETOS BANCO ' +
          Trim(_Controle.dataSet.FieldByName('N_BANCO_CTRL').AsString) + fHistPadraoUnificadas;
        vLancL.VALOR_L := buscas.FieldByName('VALOR_QUITADO').AsFloat;
        vLancL.LOTE_ENT := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').AsInteger;
        vLancL.TP_MOD := 'S';
        if vDadosIni.vEmp.vFinanceiroUnificado then
          vLancL.COD_EMP_MULT := buscas.FieldByName('COD_EMP_MULT').AsInteger;
        vLancL.VL_CONTABIL := vLancL.VALOR_L;
        vLancL.TIP_CNT := 'C';
        vLancL._efetuarLancamento;

        ///  lancamento de descontos
        if ( vDadosIni.StrToFloatFormat(buscas.FieldByName('VALOR_C').AsFloat, 2) -
          vDadosIni.StrToFloatFormat(buscas.FieldByName('VALOR_QUITADO').AsFloat,2)) > 0 then
//          if Application.MessageBox(PChar( 'Houve Desconto de : ' +
//            Format('%0.2n', [ (buscas.FieldByName('VALOR_C').AsFloat - buscas.FieldByName('VALOR_QUITADO').AsFloat) ] ) +
//            ' nos boletos. Deseja lançá-los para mensurar os valores?'),
//            'Atenção', MB_ICONQUESTION + MB_YESNO) = IDYES then
      	  if pLancarDesconto then
          begin
            vLancL.N_CONTA_PLC := vDadosIni.IfThen(vContLigL.dataSet.FieldByName('NCON_ED_PREST').AsFloat > 0,
             vContLigL.dataSet.FieldByName('NCON_ED_PREST').AsFloat, vContLigL.dataSet.FieldByName('NCON_V_PROD').AsFloat);
            if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
              raiseExceptionCreate('Corrija o cadastro para continuar', '');
            vLancL.TIPO_L := vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString;
            vLancL.HISTORICO_L := 'ENTRADA DESCONTO BOLETOS BANCO ' +
              Trim(_Controle.dataSet.FieldByName('N_BANCO_CTRL').AsString) + fHistPadraoUnificadas;
            vLancL.VALOR_L := vDadosIni.StrToFloatFormat(buscas.FieldByName('VALOR_C').AsFloat - buscas.FieldByName('VALOR_QUITADO').AsFloat, 2);
            vLancL.CODIGO_CTRL := vContLigL.dataSet.FieldByName('CONTR_V_PROD').AsInteger;
            vLancL.DATA := vDiaFinanceiroFechado + 1;
            vLancL.DTREFERENCIA := vDiaFinanceiroFechado + 1;
            vLancL.LOTE_QUIT := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').AsInteger;
            vLancL.TIP_CNT := 'N';
            vLancL.TP_MOD := 'S';
            if vDadosIni.vEmp.vFinanceiroUnificado then
              vLancL.COD_EMP_MULT := buscas.FieldByName('COD_EMP_MULT').AsInteger;
            vLancL.VL_CONTABIL := 0;
            vLancL._efetuarLancamento;

            vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_D_PREST').AsFloat;
            if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
              raiseExceptionCreate('Corrija o cadastro para continuar', '');
            vLancL.TIPO_L := vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString;
            vLancL.HISTORICO_L := 'DESCONTO NOS BOLETOS BANCO' +
              Trim(_Controle.dataSet.FieldByName('N_BANCO_CTRL').AsString) + fHistPadraoUnificadas;
            vLancL.VALOR_L := vDadosIni.StrToFloatFormat(buscas.FieldByName('VALOR_C').AsFloat - buscas.FieldByName('VALOR_QUITADO').AsFloat, 2);
            vLancL.CODIGO_CTRL := vContLigL.dataSet.FieldByName('CONTR_V_PROD').AsInteger;
            vLancL.DATA := vDiaFinanceiroFechado + 1;
            vLancL.DTREFERENCIA := vDiaFinanceiroFechado + 1;
            vLancL.LOTE_QUIT := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').AsInteger;
            vLancL.TIP_CNT := 'S';
            vLancL.TP_MOD := 'S';
            if vDadosIni.vEmp.vFinanceiroUnificado then
              vLancL.COD_EMP_MULT := buscas.FieldByName('COD_EMP_MULT').AsInteger;
            vLancL.VL_CONTABIL := vLancL.VALOR_L;
            vLancL._efetuarLancamento;
          end;

        ///  lancamento de juros
        if ( vDadosIni.StrToFloatFormat(buscas.FieldByName('VALOR_QUITADO').AsFloat, 2) -
          vDadosIni.StrToFloatFormat(buscas.FieldByName('VALOR_C').AsFloat,2)) > 0 then
//          if Application.MessageBox(PChar( 'Houve cobrança de juros de : ' +
//            Format('%0.2n', [ (buscas.FieldByName('VALOR_QUITADO').AsFloat - buscas.FieldByName('VALOR_C').AsFloat) ] ) +
//            ' nos boletos. Deseja lançá-los para mensurar os valores?'),
//            'Atenção', MB_ICONQUESTION + MB_YESNO) = IDYES then
      	  if pLancarJuros then
          begin
            vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_J_PREST').AsFloat;
            if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
              raiseExceptionCreate('Corrija o cadastro para continuar', '');
            vLancL.TIPO_L := vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString;
            vLancL.HISTORICO_L := 'ENTRADA COBRANCA DE JUROS BOLETOS BANCO ' +
              Trim(_Controle.dataSet.FieldByName('N_BANCO_CTRL').AsString) + fHistPadraoUnificadas;
            vLancL.VALOR_L := vDadosIni.StrToFloatFormat(buscas.FieldByName('VALOR_QUITADO').AsFloat - buscas.FieldByName('VALOR_C').AsFloat, 2);
            vLancL.CODIGO_CTRL := vContLigL.dataSet.FieldByName('CONTR_V_PROD').AsInteger;
            vLancL.DATA := vDiaFinanceiroFechado + 1;
            vLancL.DTREFERENCIA := vDiaFinanceiroFechado + 1;
            vLancL.LOTE_QUIT := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').AsInteger;
            vLancL.TIP_CNT := 'S';
            vLancL.TP_MOD := 'S';
            if vDadosIni.vEmp.vFinanceiroUnificado then
              vLancL.COD_EMP_MULT := buscas.FieldByName('COD_EMP_MULT').AsInteger;
            vLancL.VL_CONTABIL := vLancL.VALOR_L;
            vLancL._efetuarLancamento;


            vLancL.N_CONTA_PLC :=
             vDadosIni.IfThen(vContLigL.dataSet.FieldByName('NCON_SJ_PREST').AsFloat > 0,
             	vContLigL.dataSet.FieldByName('NCON_SJ_PREST').AsFloat, vContLigL.dataSet.FieldByName('NCON_S_CRD').AsFloat);
            if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
              raiseExceptionCreate('Corrija o cadastro para continuar', '');
            vLancL.TIPO_L := vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString;
            vLancL.HISTORICO_L := 'JUROS COBRADOS NOS BOLETOS BANCO' +
              Trim(_Controle.dataSet.FieldByName('N_BANCO_CTRL').AsString) + fHistPadraoUnificadas;
            vLancL.VALOR_L := vDadosIni.StrToFloatFormat(buscas.FieldByName('VALOR_QUITADO').AsFloat - buscas.FieldByName('VALOR_C').AsFloat, 2);
            vLancL.CODIGO_CTRL := vContLigL.dataSet.FieldByName('CONTR_V_PROD').AsInteger;
            vLancL.DATA := vDiaFinanceiroFechado + 1;
            vLancL.DTREFERENCIA := vDiaFinanceiroFechado + 1;
            vLancL.LOTE_QUIT := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').AsInteger;
            vLancL.TIP_CNT := 'N';
            vLancL.TP_MOD := 'S';
            if vDadosIni.vEmp.vFinanceiroUnificado then
              vLancL.COD_EMP_MULT := buscas.FieldByName('COD_EMP_MULT').AsInteger;
            vLancL.VL_CONTABIL := 0;
            vLancL._efetuarLancamento;
          end;

        ///  lancamento da tarifa do boleto
        if not pTarifaLancada then
        if (vDadosIni.StrToFloatFormat(pValorTaxa, 2)) > 0 then
//          if Application.MessageBox(PChar( 'Deseja fazer um lançamento da taxa bancária no valor de: ' +
//            Format('%0.2n', [ (vTaxaBoleto) ] ) + fHistPadraoUnificadas + '?'),
//            'Atenção', MB_ICONQUESTION + MB_YESNO) = IDYES then
        	if pLancarTaxa then
          begin
            vLancL.N_CONTA_PLC := vContLigL.dataSet.FieldByName('NCON_TARIFABANCARIA').AsFloat;
            if not vContLigL.vPCont._abrirPContas(vLancL.N_CONTA_PLC) then
              raiseExceptionCreate('Corrija o cadastro para continuar', '');
            vLancL.TIPO_L := vContLigL.vPCont.dataSet.FieldByName('TIPO_PLC').AsString;
            vLancL.HISTORICO_L := 'BAIXA TAXA DE COBRANCA BOLETOS ' +
              Trim(_Controle.dataSet.FieldByName('N_BANCO_CTRL').AsString) +
              vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
	              ' EMP: ' + vDadosIni.StrZero(StrToInt(vDadosIni.codEmpresa), 3), '');//fHistPadraoUnificadas;
            vLancL.VALOR_L := vDadosIni.StrToFloatFormat(pValorTaxa, 2);
            vLancL.CODIGO_CTRL := _Controle.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
            vLancL.DATA := vDiaFinanceiroFechado + 1;
            vLancL.DTREFERENCIA := vDiaFinanceiroFechado + 1;
            vLancL.LOTE_QUIT := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').AsInteger;
            vLancL.TP_MOD := 'S';
            if vDadosIni.vEmp.vFinanceiroUnificado then
              vLancL.COD_EMP_MULT := StrToInt(vDadosIni.codEmpresa); //buscas.FieldByName('COD_EMP_MULT').AsInteger;
            vLancL.VL_CONTABIL := vLancL.VALOR_L;
            vLancL.TIP_CNT := 'C';
            vLancL._efetuarLancamento;
          end;

        buscas.Next;
      end;

      Result := CommitaTransacao;
    except
      on E: exception do
      begin
        RollBackTransacao;
        Result := False;
        registraErro('function TRetorno.finalizarProcessamento. Erro: ' + E.Message);
        Application.MessageBox(PChar('Erro ao efetuar lançamentos no processo de baixa de boletos. Erro: ' + e.Message),
          'Atenção', 0 + 64);
      end;
    end;

  finally
    vLancL._setTransactionComponentes(nil);
    vContLigL.Free;
    vLancL.Free;

    vContLigL:= nil;
    vLancL := nil;
  end;
end;

function TRetorno._Space(Tam: integer): string;
var
  res: string;
  i: integer;
begin
  res := '';
  i := 1;
  while i <= tam do
  begin
    res := res + ' ';
    inc(i);
  end;
  result := res;
end;

function TRetorno._UpperCaseAcentuados(const S: string): string;
var

  Ch: Char;

  L: Integer;

  Source, Dest: PChar;

begin

  L := Length(S);

  SetLength(Result, L);

  Source := Pointer(S);

  Dest := Pointer(Result);

  while L <> 0 do

  begin

    Ch := Source^;

    if (Ch >= 'a') and (Ch <= 'z') then Dec(Ch, 32);

    if (Ch >= 'á') and (Ch <= 'ú') then Dec(Ch, 32);

    if (Ch >= 'ã') and (Ch <= 'õ') then Dec(Ch, 32);

    if (Ch >= 'ä') and (Ch <= 'ü') then Dec(Ch, 32);

    if (Ch >= 'à') and (Ch <= 'ù') then Dec(Ch, 32);

    if (Ch >= 'â') and (Ch <= 'û') then Dec(Ch, 32);

    Dest^ := Ch;

    Inc(Source);

    Inc(Dest);

    Dec(L);

  end;

end;

procedure TRetorno._AbreFormRetorno;
begin
  if (vDadosIni.vEmp.vQuitarBoletoPeloSistema <> 'S') then
  begin
    Application.MessageBox('Configure no cadastro da empresa a opção para quitar boletos pelo sistema.',
      'Atenção', 0 + 64);
    Exit;
  end;

  if dtmImportPDVFinan = nil then
    dtmImportPDVFinan := TdtmImportPDVFinan.Create(dtmImportPDVFinan);

  if frmImportRetorno = nil then
	  Application.CreateForm(TfrmImportRetorno, frmImportRetorno);
  frmImportRetorno.ShowModal;
end;

procedure TRetorno._BaixaBoletosContCreditos(NumeroDocumento: string;
  DataBaixa: Tdate; vl_pg, vl_cred, vl_juros, vl_desc, tx_cob: double; var TotalparaQuitar,
  TotalQuitados: integer);
var
  FormVerifControle: TfrmVerificaControle;
  cont: integer;
  //Pega o valor maior do retoro o ValorPago ou ValorCredito para lançar os juros
  _dValorMaiorRetorno: Double;
  vCtrlBol, vCtrlDoc: string;
begin
  vVerificaControle :='';
  _AbrirTodosRetorno(NumeroDocumento, vCodCobrebem, vCodEmpresa);

  // Verifica se os creditos que abriram estão quitados --
  cont := 0;
  dataset.first;
  while not dataset.eof do
  begin
    if (Trim(dataSet.FieldByName('Status_C').AsString) = 'QUITADO') then
    begin
      inc(cont);
      vstatusitem := 'CRÉDITO JÁ QUITADO';
    end;
    dataset.next;
  end;

  if dataSet.RecordCount = cont then
  begin
    if not (dataset.isempty) then
      inc(TotalQuitados)
    else
    begin
      vstatusitem := 'NÃO ENCONTRADO NO CONTROLE DE CREDITOS';
      vCreditosNaoEncontrados := true;
    end;
    dataSet.Close;
    exit;
  end
  else
  begin
    inc(TotalparaQuitar);
    vstatusitem := 'A QUITAR';
  end;

  dataSet.Close;

  _AbrirRetorno(NumeroDocumento, vCodCobrebem, vCodEmpresa);

  dataSet.First;
  if (dataSet.RecordCount > 1) then
  begin
    Application.CreateForm(TfrmVerificaControle, FormVerifControle);
    FormVerifControle.ShowModal;
  end;

  if (dataSet.FieldByName('COD_CRED').AsInteger > 0) and
    (_Cobrebem.dataSet.FieldByName('CODIGO_CTRL').AsInteger <>
    dataSet.FieldByName('CODIGO_CTRL').AsInteger) then
  begin
    vCtrlBol := retornaValor('select nome_ctrl as valor from controles' +
      ' where codigo_ctrl = ' + IntToStr(_Cobrebem.dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa);
    vCtrlDoc := retornaValor('select nome_ctrl as valor from controles' +
      ' where codigo_ctrl = ' + IntToStr(dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa);


    vVerificaControle := 'Controle da Configuração diferente do Controle do Crédito. Controle do Boleto: ' +
    _Cobrebem.dataSet.FieldByName('CODIGO_CTRL').AsString + ' <> Controle do Documento: '+
    dataSet.FieldByName('CODIGO_CTRL').AsString +' - Numero do Documento: ' + Trim(dataSet.FieldByName('N_DOC_C').AsString);

    if vTeste = 0 then
    begin
      if Application.MessageBox(pchar(
        'Documento encontrado não corresponde ao controle do Boleto Selecionado!' + #13 +
        'Controle do Boleto: ' + _Cobrebem.dataSet.FieldByName('CODIGO_CTRL').AsString + ' ' +
        vCtrlBol + #13 +
        'Controle do Documento: ' + dataSet.FieldByName('CODIGO_CTRL').AsString + ' ' + vCtrlDoc +
        #13 +
        'Código do Documento: ' + Trim(dataSet.FieldByName('COD_CRED').AsString) + #13 +
        'Numero do Documento: ' + Trim(dataSet.FieldByName('N_DOC_C').AsString) + #13 +
        'Vencimento do Documento: ' + Trim(dataSet.FieldByName('DATA_VENC_C').AsString) + #13 +
        'Valor do Documento: ' + Format('%0.2m', [dataSet.FieldByName('VALOR_C').AsFloat]) + #13 +
        'Valor Pago: ' + Format('%0.2m', [vl_pg]) + #13 +
        'Nome do Cliente: ' + Trim(dataSet.FieldByName('NOME_C').AsString) + #13 +
        'Nosso Número: ' + Trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString) + #13 + #13 +
        'Não exibir está mensagem novamente?'), 'Confirmação',
        MB_ICONQUESTION + MB_YESNO) = IDYES then
        vTeste := 1;
    end;

    //        Application.MessageBox(pchar(
    //      'Documento encontrado não corresponde ao controle do Boleto Selecionado!' + #13 +
    //      'Controle do Boleto: ' + _Cobrebem.dataSet.FieldByName('CODIGO_CTRL').AsString + ' ' + vCtrlBol + #13 +
    //      'Controle do Documento: ' + dataSet.FieldByName('CODIGO_CTRL').AsString + ' ' + vCtrlDoc + #13 +
    //      'Código do Documento: ' + Trim(dataSet.FieldByName('COD_CRED').AsString) + #13 +
    //      'Numero do Documento: ' + Trim(dataSet.FieldByName('N_DOC_C').AsString) + #13 +
    //      'Vencimento do Documento: ' + Trim(dataSet.FieldByName('DATA_VENC_C').AsString) + #13 +
    //      'Valor do Documento: ' + Format('%0.2m',[dataSet.FieldByName('VALOR_C').AsFloat]) + #13 +
    //      'Valor Pago: ' + Format('%0.2m',[vl_pg]) + #13 +
    //      'Nome do Cliente: ' + Trim(dataSet.FieldByName('NOME_C').AsString) + #13 +
    //      'Nosso Número: ' + Trim(dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString)),
    //      'Atenção', 0 + 64);
    if TotalparaQuitar > 0 then
      TotalparaQuitar := TotalparaQuitar - 1;
  end
  else
    if (dataSet.FieldByName('COD_CRED').AsInteger > 0) then
    begin
      _dValorMaiorRetorno := 0;
      //pega o maior valor da dll para lançar o juros - ValorPago e ValorCredito
//      if (vl_pg >= vl_cred) then
//        _dValorMaiorRetorno := vl_pg
//      else
//        _dValorMaiorRetorno := vl_cred;

//      _dValorMaiorRetorno := vl_cred + tx_cob;

  	   _dValorMaiorRetorno := vDadosIni.IfThen(vl_pg >= vl_cred, vl_pg, vl_cred + tx_cob);

      _CBX.dataset.append;
      _CBX.dataSet.FieldByName('N_DOC_C').AsString := dataSet.FieldByName('N_DOC_C').AsString;
      _CBX.dataSet.FieldByName('VALOR_C').AsCurrency := dataSet.FieldByName('VALOR_C').AsCurrency;
      _CBX.dataSet.FieldByName('NOME_C').AsString := dataSet.FieldByName('NOME_C').AsString;
      _CBX.dataSet.FieldByName('RAZAO').AsString := dataSet.FieldByName('RAZAO').AsString;
      _CBX.dataSet.FieldByName('DATA_VENC_C').AsDateTime := dataSet.FieldByName('DATA_VENC_C').AsDateTime;
      _CBX.dataSet.FieldByName('COD_CRED').AsInteger := dataSet.FieldByName('COD_CRED').AsInteger;
      _CBX.dataSet.FieldByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('CODIGO_EMP').AsInteger;
      _CBX.dataSet.FieldByName('COD_EMP_MULT').AsInteger := dataSet.FieldByName('COD_EMP_MULT').AsInteger;
      _CBX.dataSet.FieldByName('TIPO_DOC_C').AsString := dataSet.FieldByName('TIPO_DOC_C').AsString;
      _CBX.dataSet.FieldByName('HISTORICO_C').AsString := dataSet.FieldByName('HISTORICO_C').AsString;
      _CBX.dataSet.FieldByName('COD_COBREBEM').AsInteger := dataSet.FieldByName('COD_COBREBEM').AsInteger;
      _CBX.dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString := dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString;
      _CBX.dataSet.FieldByName('OCORRENCIABANCARIA').AsString := dataSet.FieldByName('OCORRENCIABANCARIA').AsString;
      _CBX.dataSet.FieldByName('VALOR_PAGO').AsCurrency := _dValorMaiorRetorno;
      _CBX.dataSet.FieldByName('DATA_PAGAMENTO').AsDateTime := databaixa;
      if ((vl_juros = 0) and (_dValorMaiorRetorno > dataSet.FieldByName('VALOR_C').AsCurrency)) then
      begin
        vl_juros := _dValorMaiorRetorno - dataSet.FieldByName('VALOR_C').AsCurrency;
      end;

      if ((not (vl_juros = 0)) and (_dValorMaiorRetorno = dataSet.FieldByName('VALOR_C').AsCurrency)) then
      begin
        _CBX.dataSet.FieldByName('VALOR_PAGO').AsCurrency := dataSet.FieldByName('VALOR_C').AsCurrency
          + vl_juros;
      end;

      _CBX.dataSet.FieldByName('VALOR_JUROS').AsCurrency := vl_juros;
      _CBX.dataSet.FieldByName('VALOR_DESCONTO').AsCurrency := vl_desc;
      _CBX.dataSet.FieldByName('TAXA_COBRANCA').AsCurrency := tx_cob;

      // Em alguns computadores o cobrebem não estava atribuindo o valor juros ao valor pago
      if (_CBX.dataSet.FieldByName('VALOR_C').AsCurrency = _CBX.dataSet.FieldByName('VALOR_PAGO').AsCurrency)
      	and (_CBX.dataSet.FieldByName('VALOR_JUROS').AsCurrency > _CBX.dataSet.FieldByName('VALOR_DESCONTO').AsCurrency)
        and (_CBX.dataSet.FieldByName('VALOR_JUROS').AsCurrency <> _CBX.dataSet.FieldByName('VALOR_DESCONTO').AsCurrency)
      	and ((_CBX.dataSet.FieldByName('VALOR_JUROS').AsCurrency > 0)
        			or (_CBX.dataSet.FieldByName('VALOR_DESCONTO').AsCurrency > 0)) then
      begin
       _CBX.dataSet.FieldByName('VALOR_PAGO').AsCurrency :=
         _CBX.dataSet.FieldByName('VALOR_C').AsCurrency +
         _CBX.dataSet.FieldByName('VALOR_JUROS').AsCurrency -
         _CBX.dataSet.FieldByName('VALOR_DESCONTO').AsCurrency;
      end;

      _CBX.dataSet.Post;

      _CBX.dataSet.FieldByName('OCORRENCIABANCARIA').OnSetText(dtmImportPDVFinan.cdsCBXOCORRENCIABANCARIA,
        dtmImportPDVFinan.cdsCBXOCORRENCIABANCARIA.Text);
    end;

end;

procedure TRetorno._CobrebemX_RecebeDados;
var
	txt: textfile;
begin
	if (trim(_Cobrebem.dataSet.FieldByName('LICENCA').asString) = '') then
    if (not (FileExists(_Cobrebem.dataSet.FieldByName('ARQUIVOLICENCA').AsString))) then
      raise Exception.Create('O arquivo de licença configurado no Cobrebem não foi localizado.' +
        _Cobrebem.dataSet.FieldByName('ARQUIVOLICENCA').AsString);

  if (trim(_Cobrebem.dataSet.FieldByName('LICENCA').asString) <> '') then
  begin
  	try
      AssignFile(txt, vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        'Licenca' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '_' + ExtractFileName(_Cobrebem.dataSet.FieldByName('ARQUIVOLICENCA').asString));
      Rewrite(txt, vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        'Licenca' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '_' + ExtractFileName(_Cobrebem.dataSet.FieldByName('ARQUIVOLICENCA').asString));
      Append(txt);
      WriteLn(txt, _Cobrebem.dataSet.FieldByName('LICENCA').asString);
    finally
    	CloseFile(txt);
    end;

    if not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
    	'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
      'Licenca' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '_' + ExtractFileName(_Cobrebem.dataSet.FieldByName('ARQUIVOLICENCA').asString))) then
    begin
    	if (not (FileExists(_Cobrebem.dataSet.FieldByName('ARQUIVOLICENCA').AsString))) then
	      raise Exception.Create('O arquivo de licença configurado no Cobrebem não foi localizado.' +
  	      _Cobrebem.dataSet.FieldByName('ARQUIVOLICENCA').AsString);

    	CobreBemX.ArquivoLicenca := _Cobrebem.dataSet.FieldByName('ARQUIVOLICENCA').asString;
    end
    else
    begin
    	CobreBemX.ArquivoLicenca := vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
      	'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
     	  'Licenca' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '_' + ExtractFileName(_Cobrebem.dataSet.FieldByName('ARQUIVOLICENCA').asString);
    end;
  end
  else
	  CobreBemX.ArquivoLicenca := _Cobrebem.dataSet.FieldByName('ARQUIVOLICENCA').AsString;
  CobreBemX.CodigoAgencia := _Cobrebem.dataSet.FieldByName('BANCO').value;
  CobreBemX.NumeroContaCorrente :=
    _Cobrebem.dataSet.FieldByName('NUMEROCONTACORRENTE').value;
  CobreBemX.CodigoCedente := _Cobrebem.dataSet.FieldByName('CODIGOCEDENTE').value;
  CobreBemX.InicioNossoNumero :=
    _Cobrebem.dataSet.FieldByName('INICIONOSSONUMERO').value;
  CobreBemX.FimNossoNumero := Retorno._Cobrebem.dataSet.FieldByName('FIMNOSSONUMERO').value;
  CobreBemX.ProximoNossoNumero :=
    _Cobrebem.dataSet.FieldByName('PROXIMONOSSONUMERO').value;
  CobreBemX.ArquivoRetorno.Layout := _Cobrebem.dataSet.FieldByName('LAYOUTARQUIVORETORNO').asString;
  CobreBemX.ArquivoRetorno.Diretorio := _DiretorioRetorno;
  CobreBemX.ArquivoRetorno.Arquivo := _NomeArquivoRetorno;
  {O CobreBemX vai criar uma remessa e lerá o arquivo retorno de acordo com as regras do layout default do banco utilizado.
   O layout default é o primeiro da listagem de layouts disponíveis por banco e carteira.}

  // Imagem existe (logotipo)
  if (trim(_Cobrebem.dataSet.FieldByName('LOGOTIPO').asString) <> '') then
  begin
    if ((trim(_Cobrebem.dataSet.FieldByName('LOGOTIPO').asString) <> '')
    	and	(not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
    		'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
      	ExtractFileName(_Cobrebem.dataSet.FieldByName('IMAGENSLOGOTIPO').asString))))) then
    begin
    	_strBase64toImage(
          _Cobrebem.dataSet.FieldByName('LOGOTIPO').AsString,
          vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
	          'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
  	        ExtractFileName(_Cobrebem.dataSet.FieldByName('IMAGENSLOGOTIPO').asString));
    end;
  end;

  // Imagens existem (logobanco, codigo de barras a, b, c, d)
  if ((trim(_Cobrebem.dataSet.FieldByName('LOGOBANCO').asString) <> '')
  	or (trim(_Cobrebem.dataSet.FieldByName('CODBARRAS_A').asString) <> '')
    or (trim(_Cobrebem.dataSet.FieldByName('CODBARRAS_B').asString) <> '')
    or (trim(_Cobrebem.dataSet.FieldByName('CODBARRAS_C').asString) <> '')
    or (trim(_Cobrebem.dataSet.FieldByName('CODBARRAS_D').asString) <> '')) then
  begin
    if ((trim(_Cobrebem.dataSet.FieldByName('LOGOBANCO').asString) <> '')
        and (not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          'imagens\' + _Cobrebem.dataSet.FieldByName('BANCO').asString + '.jpg'))))
      or ((trim(_Cobrebem.dataSet.FieldByName('CODBARRAS_A').asString) <> '')
        and (not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          'imagens\a.gif'))))
      or ((trim(_Cobrebem.dataSet.FieldByName('CODBARRAS_B').asString) <> '')
        and (not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          'imagens\b.gif'))))
      or ((trim(_Cobrebem.dataSet.FieldByName('CODBARRAS_C').asString) <> '')
        and (not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          'imagens\c.gif'))))
      or ((trim(_Cobrebem.dataSet.FieldByName('CODBARRAS_D').asString) <> '')
        and (not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
          'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
          'imagens\d.gif')))) then
    begin
  	  if not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        'imagens\' + _Cobrebem.dataSet.FieldByName('BANCO').asString + '.jpg')) then
      begin
        _strBase64toImage(
            _Cobrebem.dataSet.FieldByName('LOGOBANCO').AsString,
            vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
              'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
              'imagens\' + _Cobrebem.dataSet.FieldByName('BANCO').asString + '.jpg');
      end;

      // Criar imagem código de barras a no computador
      if not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        'imagens\a.gif')) then
      begin
        _strBase64toImage(
          _Cobrebem.dataSet.FieldByName('CODBARRAS_A').AsString,
          vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
            'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
            'imagens\a.gif');
      end;

      // Criar imagem código de barras b no computador
      if not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        'imagens\b.gif')) then
      begin
        _strBase64toImage(
          _Cobrebem.dataSet.FieldByName('CODBARRAS_B').AsString,
          vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
            'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
            'imagens\b.gif');
      end;

      // Criar imagem código de barras c no computador
      if not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        'imagens\c.gif')) then
      begin
        _strBase64toImage(
          _Cobrebem.dataSet.FieldByName('CODBARRAS_C').AsString,
          vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
            'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
            'imagens\c.gif');
      end;

      // Criar imagem código de barras d no computador
      if not FileExists(PChar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
        'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
        'imagens\d.gif')) then
      begin
        _strBase64toImage(
          _Cobrebem.dataSet.FieldByName('CODBARRAS_D').AsString,
          vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Licenca ' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_EMPRESA').AsInteger) + '\' +
            'Cob' + IntToStr(_Cobrebem.dataSet.FieldByName('COD_COBREBEM').AsInteger) + '\' +
            'imagens\d.gif');
      end;
    end;
  end;

  CobreBemX.CarregaArquivosRetorno;
end;

procedure TRetorno._desmarcarTodosTemp(pDataset: TDataSet);
begin
	 try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo a seleção de todos os registros');

    pDataset.DisableControls;
    pDataset.First;
    while not pDataset.Eof do
    begin
      pDataset.Edit;
      pDataset.FieldByName('sel').AsString := '';
      pDataset.Post;
      pDataset.Next;
    end;
  finally
  	pDataset.First;
    pDataset.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TRetorno._FazLancamentosEntrada(_TotalValorPago: Currency; _CodControle: integer);
begin

  _Lancamentos.dataSet.Append;
  _Lancamentos.dataSet.FieldByName('COD_LANC').AsInteger :=
    _Lancamentos.Gencodigo('LANCAMENTOS', dtmImportPDVFinan.SpIncCodigo,
    vDadosIni.codEmpresa);
  _Lancamentos.dataSet.FieldByName('N_Conta_Plc').value :=
    _ContaLigacao.dataSet.FieldByName('NCON_V_PROD').value;

  _Lancamentos.dataSet.FieldByName('HIstorico_L').text :=
    'ENTRADA CREDITOS BOLETOS BANCO ' +
    _Controle.dataSet.FieldByName('N_BANCO_CTRL').Text;
  _Lancamentos.dataSet.FieldByName('Valor_L').value := _TotalValorPago;
  _Lancamentos.dataSet.FieldByName('Codigo_Ctrl').value := _CodControle;
  _Lancamentos.dataSet.FieldByName('Tipo_L').value :=
    retornaValor('select TIPO_PLC AS valor from P_Contas where ativo = 1 and N_CONTA_PLC='
    + StringReplace(_ContaLigacao.dataSet.FieldByName('NCON_V_PROD').asstring, ',', '.',
    [rfReplaceAll]));

  _Lancamentos.dataSet.FieldByName('Data').value :=
    _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;

  _Lancamentos.dataSet.FieldByName('DTREFERENCIA').value :=
    _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;
  _Lancamentos.dataSet.FieldByName('CODIGO_EMP').value := vDadosIni.codEmpresa;
  _Lancamentos.dataSet.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
  _Lancamentos.dataSet.FieldByName('LOTE_ENT').value := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').Value;
   // retornaValor('select GEN_ID(INC_L_QUIT,1) as valor from rdb$database');
  _Lancamentos.dataSet.FieldByName('TP_MOD').value := 'S';
  if not _Lancamentos.Post then
    raise Exception.Create('Erro na tentativa de inserir lançamento de entrada');
  if not _Lancamentos.Apply then
    raise Exception.Create('Erro na tentativa de gravar lançamento de saída');
end;

procedure TRetorno._FazLancamentosSaida(_TotalValorCredito: Currency; _CodControle: integer);
begin
  if _TotalValorCredito <> 0 then
  begin
    _Lancamentos.dataSet.Append;
    _Lancamentos.dataSet.FieldByName('COD_LANC').AsInteger :=
      _Lancamentos.Gencodigo('LANCAMENTOS', dtmImportPDVFinan.SpIncCodigo,
      vDadosIni.codEmpresa);
    _Lancamentos.dataSet.FieldByName('N_Conta_Plc').value :=
      _ContaLigacao.dataSet.FieldByName('NCON_S_CRD').value;
    _Lancamentos.dataSet.FieldByName('Tipo_L').value :=
      retornaValor('select TIPO_PLC AS valor from P_Contas where ativo = 1 and N_CONTA_PLC='
      + StringReplace(_ContaLigacao.dataSet.FieldByName('NCON_S_CRD').asstring, ',', '.',
      [rfReplaceAll]));
    _Lancamentos.dataSet.FieldByName('Codigo_Ctrl').value := _CodControle;
    _Lancamentos.dataSet.FieldByName('Data').value :=
      _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;
    _Lancamentos.dataSet.FieldByName('DTREFERENCIA').value :=
      _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;
    _Lancamentos.dataSet.FieldByName('HIstorico_L').text := 'BAIXA CREDITOS BOLETOS BANCO '
      + _Controle.dataSet.FieldByName('N_BANCO_CTRL').Text;
    _Lancamentos.dataSet.FieldByName('Valor_L').value := _TotalValorCredito;
    _Lancamentos.dataSet.FieldByName('TP_MOD').value := 'S';
    _Lancamentos.dataSet.FieldByName('CODIGO_EMP').value := vDadosIni.codEmpresa;
    _Lancamentos.dataSet.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
    _Lancamentos.dataSet.FieldByName('LOTE_QUIT').value := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').Value;
    if not _Lancamentos.Post then
      raise Exception.Create('Erro na tentativa de inserir lançamento de saída');
    if not _Lancamentos.Apply then
      raise Exception.Create('Erro na tentativa de gravar lançamento de saída');
  end;
end;

procedure TRetorno._FazLancamentoTarifaBancariaRetorno(
  _TotalValorDebito: Currency; _CodControle, _CodOcorrencia: integer;
  _DataOcorrencia: string);
begin
  if _TotalValorDebito <> 0 then
  begin

    _Lancamentos.dataSet.Append;
    _Lancamentos.dataSet.FieldByName('COD_LANC').AsInteger :=
      _Lancamentos.Gencodigo('LANCAMENTOS', dtmImportPDVFinan.SpIncCodigo,
      vDadosIni.codEmpresa);
    _Lancamentos.dataSet.FieldByName('N_Conta_Plc').value :=
      _ContaLigacao.dataSet.FieldByName('NCON_TARIFABANCARIA').value;
    _Lancamentos.dataSet.FieldByName('Tipo_L').value :=
      retornaValor('select TIPO_PLC AS valor from P_Contas where ativo = 1 and N_CONTA_PLC='
      + StringReplace(_ContaLigacao.dataSet.FieldByName('NCON_TARIFABANCARIA').asstring, ',', '.',
      [rfReplaceAll]));
    _Lancamentos.dataSet.FieldByName('Codigo_Ctrl').value := _CodControle;
    _Lancamentos.dataSet.FieldByName('Data').value := vDadosIni.diaFFinanceiro + 1; //_DataOcorrencia;
    //_FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;
    _Lancamentos.dataSet.FieldByName('COD_OCORRENCIA').value := _CodOcorrencia;
    _Lancamentos.dataSet.FieldByName('DATA_OCORRENCIA').value := vDadosIni.diaFFinanceiro + 1; //_DataOcorrencia;
    // StrToDateTime(_DataOcorrencia);
    _Lancamentos.dataSet.FieldByName('DTREFERENCIA').value := vDadosIni.diaFFinanceiro + 1; // _DataOcorrencia;
    // _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;
    _Lancamentos.dataSet.FieldByName('HIstorico_L').text := 'BAIXA TAXA DE COBRANCA BOLETOS '
      + _Controle.dataSet.FieldByName('N_BANCO_CTRL').Text;
    _Lancamentos.dataSet.FieldByName('Valor_L').value := _TotalValorDebito;
    _Lancamentos.dataSet.FieldByName('VL_CONTABIL').value := _TotalValorDebito;
    _Lancamentos.dataSet.FieldByName('TP_MOD').value := 'S';
    _Lancamentos.dataSet.FieldByName('TIP_CNT').Value := 'S';
    _Lancamentos.dataSet.FieldByName('CODIGO_EMP').value := vDadosIni.codEmpresa;
    _Lancamentos.dataSet.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
    _Lancamentos.dataSet.FieldByName('LOTE_QUIT').value := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').Value;
    if not _Lancamentos.Post then
      raise
        Exception.Create('Erro na tentativa de inserir lançamento de saída da tarifa bancária');

    if not _Lancamentos.Apply then
      raise
        Exception.Create('Erro na tentativa de gravar lançamento de saída da tarifa bancária');

    if not _Lancamentos.CommitaTransacao then
      raise
        Exception.Create('Erro na tentativa de gravar  lançamento de saída da tarifa bancária');
  end;
end;

function TRetorno._InserirOcorrenciaBancariaBoletosCreditosCobrebem(PosicaoBoleto: integer;
  NumeroDocumento: string; CodCobrebem: Integer; CodEmpresa: Integer): boolean;
var
  MotivoOcorrencia: TStringList;
  QuantOcorrencias: integer;
  Sequencia: string;

  procedure LancarValorSeExistir(Descricao: string; Valor: Double);
  begin
    if (Valor > 0) then
      MotivoOcorrencia.Add(Descricao + ': ' + FloatToStr(Valor));
  end;
begin

  //Sequencia := inttostr(retorno.CobreBemX.ArquivoRetorno.Sequencia);
  Sequencia := retorno.CobreBemX.ArquivoRetorno.Sequencia;

  if not (dataSet.IsEmpty) then
    if (pos('Sequência do arquivo de retorno: ' + Sequencia,
      Retorno.dataSet.FieldByName('OCORRENCIABANCARIA').AsString) > 0) then
      exit;

  MotivoOcorrencia := TStringList.Create;

  MotivoOcorrencia.Add('---');
  MotivoOcorrencia.Add('Data da gravacao do arquivo de retorno: ' + retorno.CobreBemX.ArquivoRetorno.DataGravacao);
  MotivoOcorrencia.Add('Sequência do arquivo de retorno: ' + inttostr(retorno.CobreBemX.ArquivoRetorno.Sequencia));

  {1}for QuantOcorrencias := (strtoint(CobreBemX.OcorrenciasCobranca[PosicaoBoleto].MotivosOcorrencia.Count) - 1) downto 0 do
  begin
    MotivoOcorrencia.Add(_UpperCaseAcentuados(UpperCase(CobreBemX.OcorrenciasCobranca[PosicaoBoleto].MotivosOcorrencia[QuantOcorrencias].Descricao)));
  end; {1}

  LancarValorSeExistir('Taxa de cobrança',
    retorno.CobreBemX.OcorrenciasCobranca[PosicaoBoleto].ValorTaxaCobranca);
  LancarValorSeExistir('Valor de outras despesas',
    retorno.CobreBemX.OcorrenciasCobranca[PosicaoBoleto].ValorOutrasDespesas);
  LancarValorSeExistir('Valor de multa paga',
    retorno.CobreBemX.OcorrenciasCobranca[PosicaoBoleto].ValorMultaPaga);
  LancarValorSeExistir('Valor do IOF',
    retorno.CobreBemX.OcorrenciasCobranca[PosicaoBoleto].ValorIOF);
  LancarValorSeExistir('Valor do desconto',
    retorno.CobreBemX.OcorrenciasCobranca[PosicaoBoleto].ValorDesconto);
  LancarValorSeExistir('Valor do abatimento',
    retorno.CobreBemX.OcorrenciasCobranca[PosicaoBoleto].ValorAbatimento);
  MotivoOcorrencia.Add('---');
  MotivoOcorrencia.Add('');

  {1}if not (dataSet.IsEmpty) then
  begin
     {2}if ((strtoint(CobreBemX.OcorrenciasCobranca[PosicaoBoleto].MotivosOcorrencia.Count) - 1) >= 0) then
    begin
      _InserirOcorrenciaBancariaControleCredito(NumeroDocumento, Sequencia, MotivoOcorrencia);
      _Boletos._InserirOcorrenciaBancariaBoletos(NumeroDocumento, Sequencia, MotivoOcorrencia, true, CodCobrebem, CodEmpresa);
    end; {2}

  end {1}
  else
  {1}begin
    {2}if ((strtoint(CobreBemX.OcorrenciasCobranca[PosicaoBoleto].MotivosOcorrencia.Count) - 1) >= 0) then
    begin
      _Boletos._InserirOcorrenciaBancariaBoletos(NumeroDocumento, Sequencia, MotivoOcorrencia, false, CodCobrebem, CodEmpresa);
    end; {2}
  end; {1}

end;

function TRetorno._InserirOcorrenciaBancariaBoletosCreditosConvenio(
  pDatasetCobrancaBancaria: TDataSet; NumeroDocumento: string; CodCobrebem, CodEmpresa: Integer): boolean;
var
  MotivoOcorrencia: TStringList;
  QuantOcorrencias: integer;
  vStringListOcorrenciasBancaria: TStringList;
  I: Integer;

  procedure LancarValorSeExistir(Descricao: string; Valor: Double);
  begin
    if (Valor > 0) then
      MotivoOcorrencia.Add(Descricao + ': ' + FloatToStr(Valor));
  end;
begin

  if not (dataSet.IsEmpty) then
    if (pos('Sequência do arquivo de retorno: ' + vSequenciaArqRet,
      Retorno.dataSet.FieldByName('OCORRENCIABANCARIA').AsString) > 0) then
      exit;

  MotivoOcorrencia := TStringList.Create;
  //_AbrirRetorno(Trim(CobreBemX.OcorrenciasCobranca[Posicaoboleto].NossoNumero), vCodCobrebem, vCodEmpresa);

//  vStringListOcorrenciasBancaria := TStringList.Create;
//  vStringListOcorrenciasBancaria.Text := pDatasetCobrancaBancaria.FieldByName('OCORRENCIABANCARIA').AsString;
//  for I := 0 to vStringListOcorrenciasBancaria.Count - 1 do
//		MotivoOcorrencia.Add(vStringListOcorrenciasBancaria[I]);

  MotivoOcorrencia.Add('---');
  MotivoOcorrencia.Add('Data da gravacao do arquivo de retorno: ' + FormatDateTime('dd/mm/yyyy', vDataGravacaoArqRet));
  MotivoOcorrencia.Add('Sequência do arquivo de retorno: ' + vSequenciaArqRet);
//  MotivoOcorrencia.Add(pDatasetCobrancaBancaria.FieldByName('API_DESCR_MOVIMENTO').AsString);

  LancarValorSeExistir('Taxa de cobrança',
    pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORTAXACOBRANCA').AsFloat );
  LancarValorSeExistir('Valor de outras despesas',
    pDatasetCobrancaBancaria.FieldByName('API_PGT_VALOROUTRASDESPESAS').AsFloat);
  LancarValorSeExistir('Valor de multa paga',
   pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORACRESCIMOS').AsFloat);
  LancarValorSeExistir('Valor do IOF',
    pDatasetCobrancaBancaria.FieldByName('API_PGT_VALOR_IOF').AsFloat);
  LancarValorSeExistir('Valor do desconto',
    pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORDESCONTO').AsFloat);
  LancarValorSeExistir('Valor do abatimento',
    pDatasetCobrancaBancaria.FieldByName('API_PGT_VALORABATIMENTO').AsFloat);
  MotivoOcorrencia.Add('---');
  MotivoOcorrencia.Add('');

  {1}if not (dataSet.IsEmpty) then
  begin
    {2}if (MotivoOcorrencia.Count > 0) then
    begin
      _InserirOcorrenciaBancariaControleCredito(NumeroDocumento, vSequenciaArqRet, MotivoOcorrencia);
      _Boletos._InserirOcorrenciaBancariaBoletos(NumeroDocumento, vSequenciaArqRet, MotivoOcorrencia, true, CodCobrebem, CodEmpresa);
    end; {2}
  end {1}
  else
  {1}begin
    {2}if (MotivoOcorrencia.Count > 0) then
    begin
      _Boletos._InserirOcorrenciaBancariaBoletos(NumeroDocumento, vSequenciaArqRet, MotivoOcorrencia, false, CodCobrebem, CodEmpresa);
    end; {2}
  end; {1}
end;

function TRetorno._InserirOcorrenciaBancariaControleCredito(
  NumeroDocumento: string; Sequencia: string; MotivoOcorrencia: TStringList): boolean;
var
  ListaOcorrenciaBD: TStringList;
  ListaOcorrenciaOldBD: TStringList;
begin
	ListaOcorrenciaOldBD        := TStringList.Create;
  ListaOcorrenciaOldBD.text   := dataSet.FieldByName('OCORRENCIABANCARIA').asstring;

  if (pos('Sequência do arquivo de retorno: ' + Sequencia,
    dataSet.FieldByName('OCORRENCIABANCARIA').AsString) <= 0) then
  begin
    {1}if ListaOcorrenciaOldBD.Count <= 20 then
    begin
      ListaOcorrenciaBD := TStringList.Create;
      ListaOcorrenciaBD.Text := dataSet.FieldByName('OCORRENCIABANCARIA').asstring;
      ListaOcorrenciaBD.AddStrings(MotivoOcorrencia);

      if not (MotivoOcorrencia.Count = 0) then
      begin
        Result := Edit;
        if not Result then
          raise Exception.Create('Erro na tentativa de inserir informação bancária no crédito');
        dataSet.FieldByName('OCORRENCIABANCARIA').asstring := trim(ListaOcorrenciaBD.Text);
        Result := Post;
        if not Result then
          raise Exception.Create('Erro na tentativa de inserir informação bancária no crédito');
        Result := Apply;
        if not Result and (dataSet.ChangeCount <> 0) then
          raise Exception.Create('Erro na tentativa de gravar informação bancária no crédito ');
        Result := CommitaTransacao;
        if not Result then
          raise Exception.Create('Erro na tentativa de gravar informação bancária no crédito ');
      end;
    end; {1}
  end;
end;

procedure TRetorno._LancaDesconto(_ValorDesconto: Currency);
begin
  _Lancamentos.dataSet.Append;
  _Lancamentos.dataSet.FieldByName('COD_LANC').AsInteger :=
    _Lancamentos.Gencodigo('LANCAMENTOS', dtmImportPDVFinan.SpIncCodigo,
    vDadosIni.codEmpresa);
  _Lancamentos.dataSet.FieldByName('N_Conta_Plc').value := vDadosIni.IfThen(_ContaLigacao.dataSet.FieldByName('NCON_ED_PREST').AsFloat > 0,
  	_ContaLigacao.dataSet.FieldByName('NCON_ED_PREST').Value, _ContaLigacao.dataSet.FieldByName('NCON_V_PROD').value);

  _Lancamentos.dataSet.FieldByName('HIstorico_L').text :=
    'ENTRADA DESCONTO BOLETOS BANCO ' +
    _Controle.dataSet.FieldByName('N_BANCO_CTRL').Text;
  _Lancamentos.dataSet.FieldByName('Valor_L').value := _ValorDesconto;
  _Lancamentos.dataSet.FieldByName('Codigo_Ctrl').value :=
    _ContaLigacao.dataSet.FieldByName('CONTR_V_PROD').value;
  _Lancamentos.dataSet.FieldByName('Tipo_L').value := retornaValor('select TIPO_PLC AS valor from P_Contas ' +
  	 ' where ativo = 1 and N_CONTA_PLC= ' + StringReplace(vDadosIni.IfThen(_ContaLigacao.dataSet.FieldByName('NCON_ED_PREST').AsFloat > 0,
    _ContaLigacao.dataSet.FieldByName('NCON_ED_PREST').AsString, _ContaLigacao.dataSet.FieldByName('NCON_V_PROD').AsString), ',', '.',
    [rfReplaceAll]));
  _Lancamentos.dataSet.FieldByName('Data').value :=
    _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;
  _Lancamentos.dataSet.FieldByName('DTREFERENCIA').value :=
    _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;
  _Lancamentos.dataSet.FieldByName('TIP_CNT').Value := 'N';
  _Lancamentos.dataSet.FieldByName('TP_MOD').value := 'S';
  _Lancamentos.dataSet.FieldByName('CODIGO_EMP').value := vDadosIni.codEmpresa;
  _Lancamentos.dataSet.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
  _Lancamentos.dataSet.FieldByName('LOTE_QUIT').value := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').Value;
//  _Lancamentos.dataSet.FieldByName('LOTE_ENT').value := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').Value;

  if not _Lancamentos.Post then
    raise Exception.Create('Erro na tentativa de inserir lançamento de juros');
  if not _Lancamentos.Apply then
    raise Exception.Create('Erro na tentativa de gravar lançamento de juros');

  _Lancamentos.dataSet.Append;
  _Lancamentos.dataSet.FieldByName('COD_LANC').AsInteger :=
    _Lancamentos.Gencodigo('LANCAMENTOS', dtmImportPDVFinan.SpIncCodigo,
    vDadosIni.codEmpresa);
  _Lancamentos.dataSet.FieldByName('N_Conta_Plc').value :=
    _ContaLigacao.dataSet.FieldByName('NCON_D_PREST').value;

  _Lancamentos.dataSet.FieldByName('HIstorico_L').text :=
    'DESCONTO NOS BOLETOS BANCO' + Retorno._Controle.dataSet.FieldByName('N_BANCO_CTRL').Text;
  _Lancamentos.dataSet.FieldByName('Valor_L').value := _ValorDesconto;
  _Lancamentos.dataSet.FieldByName('VL_CONTABIL').value := _ValorDesconto;
  _Lancamentos.dataSet.FieldByName('Codigo_Ctrl').value :=
    _ContaLigacao.dataSet.FieldByName('CONTR_V_PROD').value;
  _Lancamentos.dataSet.FieldByName('Tipo_L').value :=
    retornaValor('select TIPO_PLC AS valor from P_Contas where ativo = 1 and N_CONTA_PLC='
    + StringReplace(_ContaLigacao.dataSet.FieldByName('NCON_D_PREST').AsString, ',', '.',
    [rfReplaceAll]));
  _Lancamentos.dataSet.FieldByName('Data').value :=
    _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;
  _Lancamentos.dataSet.FieldByName('DTREFERENCIA').value :=
    _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;
  _Lancamentos.dataSet.FieldByName('TIP_CNT').Value := 'S';
  _Lancamentos.dataSet.FieldByName('TP_MOD').value := 'S';
  _Lancamentos.dataSet.FieldByName('CODIGO_EMP').value := vDadosIni.codEmpresa;
  _Lancamentos.dataSet.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
  _Lancamentos.dataSet.FieldByName('LOTE_QUIT').value := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').Value;
//  _Lancamentos.dataSet.FieldByName('LOTE_ENT').value := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').Value;

  if not _Lancamentos.Post then
    raise Exception.Create('Erro na tentativa de inserir lançamento de juros');
  if not _Lancamentos.Apply then
    raise
      Exception.Create('Erro na tentativa de gravar lançamento de juros. Verifique a conta de ligação.');

end;

procedure TRetorno._LancaJuros(_ValorJuros: Currency);
begin
  _Lancamentos.dataSet.Append;
  _Lancamentos.dataSet.FieldByName('COD_LANC').AsInteger :=
    _Lancamentos.Gencodigo('LANCAMENTOS', dtmImportPDVFinan.SpIncCodigo,
    vDadosIni.codEmpresa);
  _Lancamentos.dataSet.FieldByName('N_Conta_Plc').value :=
    _ContaLigacao.dataSet.FieldByName('NCON_J_PREST').value;

  _Lancamentos.dataSet.FieldByName('HIstorico_L').text :=
    'ENTRADA COBRANCA DE JUROS BOLETOS BANCO ' +
    _Controle.dataSet.FieldByName('N_BANCO_CTRL').Text;
  _Lancamentos.dataSet.FieldByName('Valor_L').value := _ValorJuros;
  _Lancamentos.dataSet.FieldByName('VL_CONTABIL').value := _ValorJuros;
  _Lancamentos.dataSet.FieldByName('Codigo_Ctrl').value :=
    _ContaLigacao.dataSet.FieldByName('CONTR_V_PROD').value;
  _Lancamentos.dataSet.FieldByName('Tipo_L').value :=
    retornaValor('select TIPO_PLC AS valor from P_Contas where ativo = 1 and N_CONTA_PLC='
    + StringReplace(_ContaLigacao.dataSet.FieldByName('NCON_J_PREST').asstring, ',', '.',
    [rfReplaceAll]));
  _Lancamentos.dataSet.FieldByName('Data').value :=
    _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;
  _Lancamentos.dataSet.FieldByName('DTREFERENCIA').value :=
    _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;
  _Lancamentos.dataSet.FieldByName('TIP_CNT').Value := 'S';
  _Lancamentos.dataSet.FieldByName('TP_MOD').value := 'S';
  _Lancamentos.dataSet.FieldByName('CODIGO_EMP').value := vDadosIni.codEmpresa;
  _Lancamentos.dataSet.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
  _Lancamentos.dataSet.FieldByName('LOTE_QUIT').value := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').Value;
//  _Lancamentos.dataSet.FieldByName('LOTE_ENT').value := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').Value;

  if not _Lancamentos.Post then
    raise Exception.Create('Erro na tentativa de inserir lançamento de juros');
  if not _Lancamentos.Apply then
    raise Exception.Create('Erro na tentativa de gravar lançamento de juros');

  _Lancamentos.dataSet.Append;
  _Lancamentos.dataSet.FieldByName('COD_LANC').AsInteger :=
    _Lancamentos.Gencodigo('LANCAMENTOS', dtmImportPDVFinan.SpIncCodigo,
    vDadosIni.codEmpresa);

  _Lancamentos.dataSet.FieldByName('N_Conta_Plc').value := vDadosIni.IfThen(_ContaLigacao.dataSet.FieldByName('NCON_SJ_PREST').AsFloat > 0,
   _ContaLigacao.dataSet.FieldByName('NCON_SJ_PREST').value, _ContaLigacao.dataSet.FieldByName('NCON_S_CRD').value);

  _Lancamentos.dataSet.FieldByName('HIstorico_L').text :=
    'JUROS COBRADOS NOS BOLETOS BANCO' + Retorno._Controle.dataSet.FieldByName('N_BANCO_CTRL').Text;
  _Lancamentos.dataSet.FieldByName('Valor_L').value := _ValorJuros;
  _Lancamentos.dataSet.FieldByName('Codigo_Ctrl').value :=
    _ContaLigacao.dataSet.FieldByName('CONTR_V_PROD').value;

  _Lancamentos.dataSet.FieldByName('Tipo_L').value :=
  	retornaValor('select TIPO_PLC AS valor from P_Contas ' +
   	' where ativo = 1 and N_CONTA_PLC= ' +
   vDadosIni.IfThen(_ContaLigacao.dataSet.FieldByName('NCON_SJ_PREST').AsFloat > 0,
   _ContaLigacao.dataSet.FieldByName('NCON_SJ_PREST').asstring,
   _ContaLigacao.dataSet.FieldByName('NCON_S_CRD').asstring));

  _Lancamentos.dataSet.FieldByName('Data').value :=
    _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;
  _Lancamentos.dataSet.FieldByName('DTREFERENCIA').value :=
    _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;
  _Lancamentos.dataSet.FieldByName('TIP_CNT').Value := 'N';
  _Lancamentos.dataSet.FieldByName('TP_MOD').value := 'S';
  _Lancamentos.dataSet.FieldByName('CODIGO_EMP').value := vDadosIni.codEmpresa;
  _Lancamentos.dataSet.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(vDadosIni.codEmpresa);
  _Lancamentos.dataSet.FieldByName('LOTE_QUIT').value := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').Value;
//  _Lancamentos.dataSet.FieldByName('LOTE_ENT').value := _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').Value;

  if not _Lancamentos.Post then
    raise Exception.Create('Erro na tentativa de inserir lançamento de juros');
  if not _Lancamentos.Apply then
    raise
      Exception.Create('Erro na tentativa de gravar lançamento de juros. Verifique a conta de ligação.');

end;

procedure TRetorno._LogArqRetorno(nome, vdados: string);
var
  Arq: TextFile;
  NomeArq: string;
begin
//  Nomearq := ExtractFilePath(Application.Exename) + nome;
//  AssignFile(Arq, NomeArq);
//  try
//    if not FileExists(NomeArq) then
//      Rewrite(arq)
//    else
//      append(arq);
//    WriteLn(arq, datetimetostr(vDadosIni.getDataHoraBanco(buscas)) + ' - ' + vdados);
//  finally
//  	closeFile(arq);
//  end;
end;

procedure TRetorno._LogArqRetornoproc(nome, vdados, linha: string);
var
  Arq: TextFile;
  NomeArq: string;
begin
//  Nomearq := ExtractFilePath(Application.Exename) + nome;
//  AssignFile(Arq, NomeArq);
//  try
//    if not FileExists(NomeArq) then
//      Rewrite(arq)
//    else
//      append(arq);
//
//    WriteLn(arq, DateTimeToStr(vDadosIni.getDataHoraBanco(buscas)) + ' - ' + vdados);
//    Writeln(arq, linha);
//  finally
//  	closeFile(arq);
//  end;
end;

procedure TRetorno._marcaDesmarcaLinhaTemp(pDataset: TDataSet);
begin
	if pDataset.IsEmpty then
    exit;

  pDataset.Edit;
  if pDataset.FieldByName('sel').AsString = 'S' then
    pDataset.FieldByName('sel').AsString := ''
  else
    pDataset.FieldByName('sel').AsString := 'S';
  pDataset.Post;
end;

procedure TRetorno._marcarTodosTemp(pDataset: TDataSet);
begin
	try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

    pDataset.DisableControls;
    pDataset.First;
    while not pDataset.Eof do
    begin
      pDataset.Edit;
      pDataset.FieldByName('SEL').AsString := 'S';
      pDataset.Post;
      pDataset.Next;
    end;
  finally
  	pDataset.First;
  	pDataset.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TRetorno._MontaLinha(Pos: Integer; const Dado: string);
var
  i: byte;
  car: string[1];
begin
  i := 1;
  while i <= length(Dado) do
  begin
    car := Copy(dado, i, 1);
    _StrAux[(i - 1) + pos] := car[1];
    inc(i);
  end;
end;

procedure TRetorno._QuitarContoroleCredito;
begin
  try
//    WriteLn(arquivo, ' Baixa ' + DateTimeToStr(Now));
//    WriteLn(arquivo, ' Arquivo = ' + Retorno._DiretorioRetorno + Retorno._NomeArquivoRetorno + '');
//    WriteLn(arquivo, ' Num Doc = ' + dataSet.FieldByName('N_DOC_C').AsString);
//    WriteLn(arquivo, ' Nosso Numero = '  + dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString);
//    WriteLn(arquivo, ' Valor = '  + dataSet.FieldByName('VALOR_C').AsString);
//    WriteLn(arquivo, ' Data Baixa = '  + DatetoStr(_FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1));
//    WriteLn(arquivo, '--------------------------------------------------------------------------------------------------------');
  finally

  end;

  Edit;
  dataSet.FieldByName('Status_C').Value := 'QUITADO';
  dataSet.FieldByName('JUROS_COB').Value :=
    _CBX.dataSet.FieldByName('VALOR_JUROS').AsCurrency;
  dataSet.FieldByName('VALOR_CORR').Value :=
    _CBX.dataSet.FieldByName('VALOR_PAGO').AsCurrency;
  dataSet.FieldByName('VALOR_DESC').Value :=
    _CBX.dataSet.FieldByName('VALOR_DESCONTO').AsCurrency;
  dataSet.FieldByName('VALOR_ACRESC').Value := 0;  
  dataSet.FieldByName('TAXA_COBRANCA').Value :=
    _CBX.dataSet.FieldByName('TAXA_COBRANCA').AsCurrency;
  dataSet.FieldByName('Datq_c').Value :=
    _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;
  dataSet.FieldByName('US_BX').AsInteger := vDadosIni.vCodUsuario;
  dataSet.FieldByName('DATA_RETORNO_QUITACAO').Value :=
    _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1; //vDadosIni.diaFFinanceiro + 1;//vDadosIni.getDataHoraBanco(buscas);
  dataSet.FieldByName('DATA_BAIXA').Value :=
    _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;//_CBX.dataSet.FieldByName('DATA_PAGAMENTO').AsCurrency;
  dataSet.FieldByName('OBS_C').Value :=
    'BAIXA BOLETOS CONFORME ARQUIVO DE RETORNO BANCO ' +
    _Controle.dataSet.FieldByName('N_BANCO_CTRL').Text;
  dataSet.FieldByName('TP_REC_CXL').Value := 'T';
  dataSet.FieldByName('LOTE_QUIT').Value :=
    _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').Value;
  dataSet.FieldByName('PRCSS').AsString := 'S';

  if not Post then
    raise Exception.Create('Erro na tentativa de inserir controle de crédito');
  if not Apply then
    raise Exception.Create('Erro na tentativa de gravar controle de crédito');
end;

procedure TRetorno._RegBaixaCredito(ValorBaixa, VLdoRecibo: currency; _BaixaTotalouParcial: string);
var
  vGerarComissao: Boolean;
  vCodBaixaCredito: Integer;
  vCodMax: Integer;
begin
  buscas.Close;
  buscas.SQL.Text := 'select GERAR_COMISSAO from controles' +
    ' where codigo_ctrl = ' + IntToStr(dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa;
  buscas.Open;

  vGerarComissao := Trim(buscas.FieldByName('GERAR_COMISSAO').AsString) <> 'N';

  vCodBaixaCredito := GenCodigo('BAIXA_CREDITOS', dtmImportPDVFinan.SpIncCodigo,
  	vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	dataSet.FieldByName('CODIGO_EMP').AsString, vDadosIni.codEmpresa));

  vCodMax := 0;
  if vDadosIni.vEmp.vFinanceiroUnificado then
  begin
  	buscas.Close;
    buscas.SQL.Text := ' select max(seq_bxcred) from baixa_creditos ' +
    	' where codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
	    	dataSet.FieldByName('CODIGO_EMP').AsString, vDadosIni.codEmpresa);
    buscas.Open;

    vCodMax := buscas.FieldByName('max').AsInteger + 1;

    if (vCodMax > vCodBaixaCredito) then
    begin
      vCodBaixaCredito := vCodMax;

      buscas.Close;
	    buscas.SQL.Text := ' update codigo set valor = ' + IntToStr(vCodMax) +
      	' where tabela = ''BAIXA_CREDITOS'' ' +
        ' and cod_empresa = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
		    	dataSet.FieldByName('CODIGO_EMP').AsString, vDadosIni.codEmpresa);
      buscas.ExecSQL;
    end;
  end;

  _BaixaCredito.dataSet.Append;
  _BaixaCredito.dataSet.FieldByName('SEQ_BXCRED').value := vCodBaixaCredito;
  _BaixaCredito.dataSet.FieldByName('COD_CRED').Value := dataSet.FieldByName('COD_CRED').Value;
  {** Obs.: Escolha do controle feita no formulário}
  _BaixaCredito.dataSet.FieldByName('CODIGO_CTRL').Value :=
    dataSet.FieldByName('CODIGO_CTRL').Value; {** Obs <-}
  _BaixaCredito.dataSet.FieldByName('COD_CLIENTE').Value :=
    dataSet.FieldByName('COD_CLIENTE').Value;
  _BaixaCredito.dataSet.FieldByName('NOME_C').Value := dataSet.FieldByName('NOME_C').Value;
  _BaixaCredito.dataSet.FieldByName('DATA_REC_C').Value := dataSet.FieldByName('DATA_REC_C').Value;
  _BaixaCredito.dataSet.FieldByName('TIPO_DOC_C').Value := dataSet.FieldByName('TIPO_DOC_C').Value;
  _BaixaCredito.dataSet.FieldByName('HISTORICO_C').Value :=
    dataSet.FieldByName('HISTORICO_C').Value;
  _BaixaCredito.dataSet.FieldByName('DATA_VENC_C').Value :=
    dataSet.FieldByName('DATA_VENC_C').Value;

  if _BaixaTotalouParcial = 'P' then
    _BaixaCredito.dataSet.FieldByName('VALOR_C').value :=
      dataSet.FieldByName('VALOR_C').value + ValorBaixa
  else
    _BaixaCredito.dataSet.FieldByName('VALOR_C').Value :=
      dataSet.FieldByName('VALOR_C').value;
  _BaixaCredito.dataSet.FieldByName('DATQ_C').Value :=
    _FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;
  _BaixaCredito.dataSet.FieldByName('US_BX').AsInteger := vDadosIni.vCodUsuario;
  _BaixaCredito.dataSet.FieldByName('NATL_C').Value := dataSet.FieldByName('NATL_C').Value;
  _BaixaCredito.dataSet.FieldByName('LOTE').Value := dataSet.FieldByName('LOTE').Value;
  _BaixaCredito.dataSet.FieldByName('OBS_C').Value := dataSet.FieldByName('OBS_C').Value;
  _BaixaCredito.dataSet.FieldByName('TP_DOC_V').Value :=
    dataSet.FieldByName('TP_DOC_V').Value;
  _BaixaCredito.dataSet.FieldByName('N_DOC_V').Value :=
    dataSet.FieldByName('N_DOC_V').Value;
  _BaixaCredito.dataSet.FieldByName('N_DOC_C').Value :=
    dataSet.FieldByName('N_DOC_C').Value;
  _BaixaCredito.dataSet.FieldByName('COD_CLI_TERC').Value :=
    dataSet.FieldByName('COD_CLI_TERC').Value;
  _BaixaCredito.dataSet.FieldByName('NOME_TERC').Value :=
    dataSet.FieldByName('NOME_TERC').Value;
  _BaixaCredito.dataSet.FieldByName('CODIGO_EMP').Value :=
    dataSet.FieldByName('CODIGO_EMP').Value;
  _BaixaCredito.dataSet.FieldByName('COD_EMP_MULT').Value :=
    dataSet.FieldByName('COD_EMP_MULT').Value;
  _BaixaCredito.dataSet.FieldByName('TIP_CNT').Value :=
    dataSet.FieldByName('TIP_CNT').Value;
  _BaixaCredito.dataSet.FieldByName('CODIGO_VEND').Value :=
    dataSet.FieldByName('CODIGO_VEND').Value;
  _BaixaCredito.dataSet.FieldByName('TIP_BAIXA').Value :=
    dataSet.FieldByName('TIP_BAIXA').Value;
  _BaixaCredito.dataSet.FieldByName('DATA_BAIXA').Value :=
    dataSet.FieldByName('DATA_BAIXA').Value;
  _BaixaCredito.dataSet.FieldByName('DATA_VENDA').Value :=
    dataSet.FieldByName('DATA_VENDA').Value;
  _BaixaCredito.dataSet.FieldByName('VALOR_QUITADO').Value := ValorBaixa;
  _BaixaCredito.dataSet.FieldByName('VL_RECIBO').Value := VLdoRecibo;
  _BaixaCredito.dataSet.FieldByName('VALOR_CORR').Value :=
    dataSet.FieldByName('VALOR_CORR').Value;
  _BaixaCredito.dataSet.FieldByName('TP_OPERACAO').Value := _BaixaTotalouParcial;
  _BaixaCredito.dataSet.FieldByName('LOTE_QUIT').Value :=
    _LoteQuit.dataSet.FieldByName('N_LOTE_QUIT').Value;
  _BaixaCredito.dataSet.FieldByName('VALOR_DESC').Value :=
    dataSet.FieldByName('VALOR_DESC').Value;
  _BaixaCredito.dataSet.FieldByName('VALOR_ACRESC').Value :=
    dataSet.FieldByName('VALOR_ACRESC').Value;  
  _BaixaCredito.dataSet.FieldByName('JUROS_COB').Value :=
    dataSet.FieldByName('JUROS_COB').Value;
  _BaixaCredito.dataSet.FieldByName('DIA_CXL').Value :=
    dataSet.FieldByName('DIA_CXL').Value;
  _BaixaCredito.dataSet.FieldByName('STATUS_CXL_RQ').Value :=
    dataSet.FieldByName('STATUS_CXL_RQ').Value;
  _BaixaCredito.dataSet.FieldByName('VL_RQ_PG_CXL').Value :=
    dataSet.FieldByName('VL_RQ_PG_CXL').Value;
  _BaixaCredito.dataSet.FieldByName('OP_CXL').Value := Retorno.dataSet.FieldByName('OP_CXL').Value;
  _BaixaCredito.dataSet.FieldByName('CPFCGC').Value := Retorno.dataSet.FieldByName('CPFCGC').Value;
  _BaixaCredito.dataSet.FieldByName('LOTE_CXL').Value :=
    dataSet.FieldByName('LOTE_CXL').Value;
  _BaixaCredito.dataSet.FieldByName('COD_TERMINAL').Value :=
    dataSet.FieldByName('COD_TERMINAL').Value;
  _BaixaCredito.dataSet.FieldByName('NSERIEECF').Value :=
    dataSet.FieldByName('NSERIEECF').Value;
  _BaixaCredito.dataSet.FieldByName('COONAOFISCAL').Value :=
    dataSet.FieldByName('COONAOFISCAL').Value;
  _BaixaCredito.dataSet.FieldByName('OCORRENCIABANCARIA').Value :=
    dataSet.FieldByName('OCORRENCIABANCARIA').Value;

  if vGerarComissao then
  begin
    if dataSet.FieldByName('DATA_BAIXA').AsDateTime > 0 then
      _BaixaCredito.dataSet.FieldByName('DT_BAIXA_COMISSAO').AsDateTime :=
        dataSet.FieldByName('DATA_BAIXA').AsDateTime
    else
      _BaixaCredito.dataSet.FieldByName('DT_BAIXA_COMISSAO').AsDateTime := Date;
      
    if vDadosIni.vEmp.vUsarComissaoPorRecebimentoProporcional <> 'S' then
      _BaixaCredito.dataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat := dataSet.FieldByName('VALOR_C').AsFloat
    else
    begin
      _BaixaCredito.dataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat := dataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat;
      _BaixaCredito.dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').AsFloat := dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').AsFloat;
    end;
  end
  else
    _BaixaCredito.dataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat := 0;

  if not _BaixaCredito.Post then
    raise Exception.Create('Erro na tentativa de inserir baixa de crédito');
  if not (_BaixaCredito.Apply) then
    raise Exception.Create('Erro na tentativa de gravar baixa de crédito');
end;

{ TCobrebem }

constructor TCobrebemPesq.create;
begin
  buscas := TIBQuery(dtmImportPDVFinan.qrCobreBem);
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsCobrebem);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TCobrebemPesq._AbrirCobrebem(pCodEmpresa: Integer = 0): boolean;
begin
  Result := montaSelect('select * from cobrebem as cbb ' +
    ' where cbb.cod_empresa = ' + vDadosIni.IfThen(pCodEmpresa > 0, IntToStr(pCodEmpresa), vDadosIni.codEmpresa) +
    ' and cbb.cod_cobrebem = -3 ' +
    ' order by cod_cobrebem ');
end;

function TCobrebemPesq._PesquisaCobrebem(CodControle: integer; pCodEmpresa: Integer = 0): Boolean;
begin
	Result := montaSelect(' select cbb.* from cobrebem as cbb ' +
      ' where cbb.ativo = 1 ' +
      ' and cbb.cod_empresa = ' + vDadosIni.IfThen(pCodEmpresa > 0, IntToStr(pCodEmpresa), vDadosIni.codEmpresa) +
      ' and cbb.codigo_ctrl_ent = ' + inttostr(codcontrole) +
      ' order by cbb.descricao ');
end;

function TRetorno._AbrirRetorno(NumeroDocumento: string; CodCobrebem: Integer; CodEmpresa: Integer): boolean;
begin
  if trim(UpperCase(_Cobrebem.dataSet.FieldByName('DESCONS_DIGVERIF').AsString)) = 'S' then
   Result := montaSelect(
     '   select first 1 * from controle_creditos ' +
     '   where NOSSO_NUMERO_BANCO like ' + QuotedStr(Copy(NumeroDocumento, 1, Length(NumeroDocumento) - 1) + '%') +
     '   and COD_COBREBEM = ' + IntToStr(CodCobrebem) +
     '   and (PRCSS is null or PRCSS <> ''S'') ' +
     '   and (LTRIM(STATUS_C) <>  ''QUITADO'' and RTRIM(STATUS_C) <>  ''QUITADO'' or STATUS_C is null ) ' +
     vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
	     ' and CODIGO_EMP = ' + vDadosIni.codEmpresa,
       ' and CODIGO_EMP in ' + vDadosIni.vEmp.vCodigoUnificadas) +
     vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
       ' and COD_EMP_MULT = ' + vDadosIni.codEmpresa,
       ' and COD_EMP_MULT = ' + IntToStr(CodEmpresa)) +
     '   union ' +
     '   select first 1 * from controle_creditos ' +
     '   where NOSSO_NUMERO_BANCO like ' + QuotedStr(Copy(NumeroDocumento, 1, Length(NumeroDocumento) - 1) + '%') +
     '   and (PRCSS is null or PRCSS <> ''S'') ' +
     '   and (LTRIM(STATUS_C) <>  ''QUITADO'' and RTRIM(STATUS_C) <>  ''QUITADO'' or STATUS_C is null ) ' +
     vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
	     ' and CODIGO_EMP = ' + vDadosIni.codEmpresa,
       ' and CODIGO_EMP in ' + vDadosIni.vEmp.vCodigoUnificadas) +
     '   and (select count(*) from controle_creditos ' +
     ' 	   		where NOSSO_NUMERO_BANCO like ' + QuotedStr(Copy(NumeroDocumento, 1, Length(NumeroDocumento) - 1) + '%') +
     '        and COD_COBREBEM = '+ IntToStr(CodCobrebem) +
     '        and (PRCSS is null or PRCSS <> ''S'') ' +
     '        and (LTRIM(STATUS_C) <>  ''QUITADO'' and RTRIM(STATUS_C) <>  ''QUITADO'' or STATUS_C is null ) ' +
     vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
	     '      and CODIGO_EMP = ' + vDadosIni.codEmpresa,
       '      and CODIGO_EMP in ' + vDadosIni.vEmp.vCodigoUnificadas) +
     vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
       '      and COD_EMP_MULT = ' + vDadosIni.codEmpresa,
       '      and COD_EMP_MULT = ' + IntToStr(CodEmpresa)) + ') = 0 ')
  else
   Result := montaSelect(
   	 '   select first 1 * from controle_creditos ' +
     '   where NOSSO_NUMERO_BANCO = ' + QuotedStr(NumeroDocumento) +
     '   and COD_COBREBEM = ' + IntToStr(CodCobrebem) +
     '   and (PRCSS is null or PRCSS <> ''S'') ' +
     '   and (LTRIM(STATUS_C) <>  ''QUITADO'' and RTRIM(STATUS_C) <>  ''QUITADO'' or STATUS_C is null ) ' +
     vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
	     ' and CODIGO_EMP = ' + vDadosIni.codEmpresa,
       ' and CODIGO_EMP in ' + vDadosIni.vEmp.vCodigoUnificadas) +
     vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
       ' and COD_EMP_MULT = ' + vDadosIni.codEmpresa,
       ' and COD_EMP_MULT = ' + IntToStr(CodEmpresa)) +
     '   union ' +
   	 '   select first 1 * from controle_creditos ' +
     '   where NOSSO_NUMERO_BANCO = ' + QuotedStr(NumeroDocumento) +
     '   and (PRCSS is null or PRCSS <> ''S'') ' +
     '   and (LTRIM(STATUS_C) <>  ''QUITADO'' and RTRIM(STATUS_C) <>  ''QUITADO'' or STATUS_C is null ) ' +
     vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
	     ' and CODIGO_EMP = ' + vDadosIni.codEmpresa,
       ' and CODIGO_EMP in ' + vDadosIni.vEmp.vCodigoUnificadas) +
     '   and (select count(*) from controle_creditos ' +
     ' 	  		where NOSSO_NUMERO_BANCO = ' + QuotedStr(NumeroDocumento) +
     ' 		  	and COD_COBREBEM = '+ IntToStr(CodCobrebem) +
     ' 		  	and (PRCSS is null or PRCSS <> ''S'') ' +
     ' 		  	and (LTRIM(STATUS_C) <>  ''QUITADO'' and RTRIM(STATUS_C) <>  ''QUITADO'' or STATUS_C is null ) ' +
     vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
	     ' 	  	and CODIGO_EMP = ' + vDadosIni.codEmpresa,
       ' 	  	and CODIGO_EMP in ' + vDadosIni.vEmp.vCodigoUnificadas) +
     vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
       ' 	  	and COD_EMP_MULT = ' + vDadosIni.codEmpresa,
       ' 	  	and COD_EMP_MULT = ' + IntToStr(CodEmpresa)) + ') = 0 ');
end;

function TRetorno._AbrirTodosRetorno(NumeroDocumento: string; CodCobrebem: Integer; CodEmpresa: Integer): boolean;
begin
 if trim(UpperCase(retorno._Cobrebem.dataSet.FieldByName('DESCONS_DIGVERIF').AsString)) = 'S' then
  Result := montaSelect(
  	'   select * from controle_creditos ' +
    '   where NOSSO_NUMERO_BANCO like ' + QuotedStr(Copy(NumeroDocumento, 1, Length(NumeroDocumento) - 1) + '%') +
    '   and COD_COBREBEM = ' + IntToStr(CodCobrebem) +
    vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
	    ' and CODIGO_EMP = ' + vDadosIni.codEmpresa,
      ' and CODIGO_EMP in ' + vDadosIni.vEmp.vCodigoUnificadas) +
    vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
      ' and COD_EMP_MULT = ' + vDadosIni.codEmpresa,
      ' and COD_EMP_MULT = ' + IntToStr(CodEmpresa)) +
    '    union ' +
    '   select * from controle_creditos ' +
    '   where NOSSO_NUMERO_BANCO like ' + QuotedStr(Copy(NumeroDocumento, 1, Length(NumeroDocumento) - 1) + '%') +
    vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
	    ' and CODIGO_EMP = ' + vDadosIni.codEmpresa,
      ' and CODIGO_EMP in ' + vDadosIni.vEmp.vCodigoUnificadas) +
      ' and (select count(*) from controle_creditos ' +
    	' 		 where NOSSO_NUMERO_BANCO like ' + QuotedStr(Copy(NumeroDocumento, 1, Length(NumeroDocumento) - 1) + '%') +
	    ' 		 and COD_COBREBEM = ' + IntToStr(CodCobrebem) +
    vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
	    ' 		 and CODIGO_EMP = ' + vDadosIni.codEmpresa,
      ' 		 and CODIGO_EMP in ' + vDadosIni.vEmp.vCodigoUnificadas) +
    vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
      ' 		 and COD_EMP_MULT = ' + vDadosIni.codEmpresa,
      ' 		 and COD_EMP_MULT = ' + IntToStr(CodEmpresa)) + ') = 0 ')
 else
  Result := montaSelect(
  	'   select * from controle_creditos ' +
    '   where NOSSO_NUMERO_BANCO = ' + QuotedStr(NumeroDocumento) +
    '   and COD_COBREBEM = ' + IntToStr(CodCobrebem) +
    vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
	    ' and CODIGO_EMP = ' + vDadosIni.codEmpresa,
      ' and CODIGO_EMP in ' + vDadosIni.vEmp.vCodigoUnificadas) +
    vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
      ' and COD_EMP_MULT = ' + vDadosIni.codEmpresa,
      ' and COD_EMP_MULT = ' + IntToStr(CodEmpresa)) +
    '   union ' +
    '   select * from controle_creditos ' +
    '   where NOSSO_NUMERO_BANCO = ' + QuotedStr(NumeroDocumento) +
    vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
	    ' and CODIGO_EMP = ' + vDadosIni.codEmpresa,
      ' and CODIGO_EMP in ' + vDadosIni.vEmp.vCodigoUnificadas) +
    '   and (select count(*) from controle_creditos ' +
    ' 	 	   where NOSSO_NUMERO_BANCO = ' + QuotedStr(NumeroDocumento) +
    ' 	  	 and COD_COBREBEM = ' + IntToStr(CodCobrebem) +
    vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
	    ' 	   and CODIGO_EMP = ' + vDadosIni.codEmpresa,
      ' 	   and CODIGO_EMP in ' + vDadosIni.vEmp.vCodigoUnificadas) +
    vDadosIni.IfThen(not vDadosIni.vEmp.vFinanceiroUnificado,
      ' 	   and COD_EMP_MULT = ' + vDadosIni.codEmpresa,
      ' 	   and COD_EMP_MULT = ' + IntToStr(CodEmpresa)) + ') = 0 ');
end;

{ TControle_Busca }

constructor TControle_Busca.create;
begin
  buscas := TIBQuery(dtmImportPDVFinan.qrControleBanco);
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsControleBanco);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TControle_Busca._AbrirControle(pCodEmpresa: Integer = 0): boolean;
begin
  Result := montaSelect('select CONTROLES.NOME_CTRL ' +
  	' || '' '' || ' +
    ' (CASE WHEN ((SELECT COUNT(*) FROM COBREBEM ' +
    ' WHERE COBREBEM.ATIVO = 1 ' +
    ' AND COBREBEM.COD_EMPRESA = CONTROLES.CODIGO_EMP ' +
    ' AND COBREBEM.CODIGO_CTRL_ENT = CONTROLES.CODIGO_CTRL) > 0) THEN ''*'' ELSE '''' END) NOME_CTRL, ' +
  	' CONTROLES.* from CONTROLES ' +
    ' where CONTROLES.CONTR_BANC = ''S'' ' +
    ' and CONTROLES.DOCS = ''N'' ' +
    ' and CONTROLES.codigo_emp = ' + vDadosIni.IfThen(pCodEmpresa > 0, IntToStr(pCodEmpresa), vDadosIni.codEmpresa) +
    ' order by CONTROLES.CODIGO_CTRL');
end;

function TControle_Busca._AbrirControleCobrebem(pCodEmpresa: Integer): boolean;
begin
	Result := montaSelect('select CONTROLES.* from CONTROLES ' +
    ' where CONTROLES.CONTR_BANC = ''S'' ' +
    ' and CONTROLES.DOCS = ''N'' ' +
    ' and CONTROLES.codigo_emp = ' + vDadosIni.IfThen(pCodEmpresa > 0, IntToStr(pCodEmpresa), vDadosIni.codEmpresa) +
    ' and (SELECT COUNT(*) FROM COBREBEM ' +
    ' WHERE COBREBEM.ATIVO = 1 ' +
    ' AND COBREBEM.COD_EMPRESA = CONTROLES.CODIGO_EMP ' +
    ' AND COBREBEM.CODIGO_CTRL_ENT = CONTROLES.CODIGO_CTRL) > 0 ' + 
    ' order by CONTROLES.CODIGO_CTRL');
end;

{ TCBX }

constructor TCBX.create;
begin
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsCBX);
  _dtsource := TDataSource(dtmImportPDVFinan.dsCBX);
end;

procedure TCBX._desmarcarTodos;
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
  finally
  	dataSet.First;
    dataSet.EnableControls;
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TCBX._marcaDesmarcaLinha;
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

procedure TCBX._marcarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os registros');

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
    vDadosIni.fechaStatusProcessamento;
  end;
end;

{ TLoteQuitImp }

constructor TLoteQuitImp.create;
begin
  buscas := TIBQuery(dtmImportPDVFinan.qrLoteQuit);
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsLoteQuit);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TLoteQuitImp.Insert: boolean;
begin
  result := inherited Insert;
  if result then

end;

function TLoteQuitImp._AbrirLoteQuit: boolean;
begin
  Result := montaSelect('select * from lote_quit where codigo_emp = ' + vDadosIni.codEmpresa +
    ' and N_LOTE_QUIT = -1');
end;

procedure TLoteQuitImp._CriarLote;
begin
  _AbrirLoteQuit;
  Retorno._LoteQuit.Insert;
  _VerificarCodigoAutoIncremento('INC_L_QUIT', 'N_LOTE_QUIT',
    'LOTE_QUIT');

  Retorno._LoteCriado := true;

  Retorno._LoteQuit.dataSet.FieldByName('DATA_L_QUIT').Value :=
    Retorno._FechCaixa.dataSet.FieldByName('Dia_Fcd').Value + 1;
  Retorno._LoteQuit.dataSet.FieldByName('CODIGO_EMP').Value := vDadosIni.codEmpresa;
  if not Retorno._LoteQuit.Post then
    raise Exception.Create('Erro na tentativa de inserir lote de quitação');
  if not Retorno._LoteQuit.Apply then
    raise Exception.Create('Erro na tentativa de gravar lote de quitação');

end;

{ TFechCaixaImp }

constructor TFechCaixaImp.create;
begin
  buscas := TIBQuery(dtmImportPDVFinan.qrFechCaixa);
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsFechCaixa);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TFechCaixaImp._AbrirFechCaixa: boolean;
begin
  Result := montaSelect(' select * from fech_Dia ' +
  	' where codigo_emp = ' + vDadosIni.codEmpresa +
    ' order by dia_fcd ');
  dataSet.Last;
end;

{ TBaixaCreditoImp }

constructor TBaixaCreditoImp.create;
begin
  buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsBaixaCredito);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TBaixaCreditoImp.Insert: boolean;
begin
  result := inherited Insert;
  if result then
end;

{ TLancamentosImp }

constructor TLancamentosImp.create;
begin

  if dtmImportPDVFinan = nil then
    dtmImportPDVFinan := TdtmImportPDVFinan.Create(dtmImportPDVFinan);

  dataSet := TClientDataSet(dtmImportPDVFinan.cdsLancamentos);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
  buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);
  queryLanc := TIBQuery(dtmImportPDVFinan.qrLancamentos);
  spIncCodigo := TIBStoredProc(dtmImportPDVFinan.SpIncCodigo);
  spIncCodigo.Transaction := transacao;

  dataSet.Close;
  queryLanc.Close;

  queryLanc.Transaction := transacao;

  FLancamentos := TStringList.Create;

  fN_CONTA_PLC := 0;
  fHISTORICO_L := '';
  fTIPO_L := '';
  fNDOC_L := '';
  fTIP_CNT := '';
  fLANC_VENDA := '';
  fNOME_CTRL := '';
  fTP_MOD := '';
  fARQ_EXTRATO_ADM := '';
  fDATA_ARQUIVO := 0;
  fVALOR_L := 0;
  fCODIGO_CTRL := 0;
  fLOTE_ENT := 0;
  fDATA := 0;
  fDTREFERENCIA := 0;
  fDATQ_L := 0;
  fCOD_ADM := 0;
  fCODIGO_EMP := 0;
  fLOTE := 0;
  fN_CHEQ_L := '';
  fSTATUS_L := '';
  fDATA_VENC_CHEQ_L := 0;
  fVL_CONTABIL := 0;
end;

function TLancamentosImp._verificarDesbarramentoCliente(pCodigoUnificada: Integer): Boolean;
var
  vListaClDesnegativar: TStringList;
  I: Integer;
  vSql, vCampoEmpresa: string;
begin
  Result := True;

  buscas.Close;
  buscas.SQL.Text := 'select DESB_CL_CONTAS_QUIT from empresa' +
    ' where cod_empresa =  ' + vDadosIni.codEmpresa;
  buscas.Open;

  if Trim(buscas.FieldByName('DESB_CL_CONTAS_QUIT').AsString) = 'S' then
  begin

    try
      vDadosIni.abreStatusProcessamento('Desnegativação','Verificando...');

      try

        if vDadosIni.vEmp.vFinanceiroUnificado then
          vCampoEmpresa := 'cod_emp_mult'
        else
          vCampoEmpresa := 'codigo_emp';

        buscas.Close;
        buscas.SQL.Text :=
          'select distinct cl.cod_cliente, cl.desb_cl_contas_quit, cl.cod_empresa, cl.nome_cliente from controle_cheque cc' +
          ' inner join controles c on cc.codigo_ctrl = c.codigo_ctrl and cc.codigo_emp = c.codigo_emp' +
          ' inner join clientes cl on cl.cod_cliente = cc.cod_cliente and cl.cod_empresa = cc.' + vCampoEmpresa +
          ' inner join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.status_f = ''BARRADO''' +
          ' where cc.' + vCampoEmpresa + ' = :cod_empresa' +
          ' and cc.datq_ch = :datq_c' +
          ' and cc.status_ch = ''QUITADO''' +
          ' and ((select count(cc2.cod_cliente) from controle_cheque cc2' +
          ' where cc2.cod_cliente = cc.cod_cliente and cc2.' + vCampoEmpresa + ' = cc.' + vCampoEmpresa + ' and cc2.datq_ch is null) = 0)' +
          ' union' +
          ' select distinct cl.cod_cliente, cl.desb_cl_contas_quit, cl.cod_empresa, cl.nome_cliente from controle_creditos cc' +
          ' inner join controles c on cc.codigo_ctrl = c.codigo_ctrl and cc.codigo_emp = c.codigo_emp' +
          ' inner join clientes cl on cl.cod_cliente = cc.cod_cliente and cl.cod_empresa = cc.' + vCampoEmpresa +
          ' inner join tipo_faturamento tf on tf.codigo_faturamento = cl.codigo_faturamento and tf.status_f = ''BARRADO''' +
          ' where cc.' + vCampoEmpresa + ' = :cod_empresa' +
          ' and cc.datq_c = :datq_c' +
          ' and cc.status_c = ''QUITADO''' +
          ' and ((select count(cc2.cod_cliente) from controle_creditos cc2' +
          ' where cc2.cod_cliente = cc.cod_cliente and cc2.' + vCampoEmpresa + ' = cc.' + vCampoEmpresa + ' and cc2.datq_c is null) = 0)';
        buscas.ParamByName('datq_c').AsDate := vDadosIni.diaFFinanceiro + 1;
        buscas.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, pCodigoUnificada, StrToInt(vDadosIni.codEmpresa));
        buscas.Open;

        if buscas.IsEmpty then
          Exit;

        vListaClDesnegativar := TStringList.Create;
        vListaClDesnegativar.Clear;

        buscas.First;
        while not buscas.Eof do
        begin
          if Trim(buscas.FieldByName('DESB_CL_CONTAS_QUIT').AsString) <> 'N' then
            vListaClDesnegativar.Add(
              IntToStr(buscas.FieldByName('cod_cliente').AsInteger) + '|' +
              IntToStr(buscas.FieldByName('cod_empresa').AsInteger) + '|' +// se financeiro unificado o codigo da empresa aqui vai ser o codigo da unificadora por causa do select acima
              Trim(buscas.FieldByName('nome_cliente').AsString) + '|' );
          buscas.Next;
        end;
        vDadosIni.abreStatusProcessamento('Desnegativação','Verificando...');

        for I := 0 to vListaClDesnegativar.Count - 1 do
        begin
          vDadosIni.abreStatusProcessamento('Desnegativação ' + IntToStr(I + 1) + ' de ' + IntToStr(vListaClDesnegativar.Count) ,
            'Desnegativando ' + vDadosIni.getCampoPipe(vListaClDesnegativar[I], 3));
          buscas.Close;
          buscas.SQL.Text := 'update clientes set codigo_faturamento = ' + IntToStr(vDadosIni.vEmp.vCodigoDesbarrado) +
            ' where cod_cliente = ' + vDadosIni.getCampoPipe(vListaClDesnegativar[I], 1) +
            ' and codigo_faturamento = ' + IntToStr(vDadosIni.vEmp.vCodigoBarrado) +
            ' and cod_empresa = ' + vDadosIni.getCampoPipe(vListaClDesnegativar[I], 2); // nao é necessario mudar o select para o financeiro unificado pois o codigo da empresa ja é definido corretamente acima
          buscas.ExecSQL;
        end;

      except on E: Exception do
        begin
          Result := False;
          raiseExceptionCreate('Erro ao desnegativar clientes. Erro: ' + e.Message + ' SQL: ' + buscas.SQL.Text, '');
        end;
      end;

    finally
      vDadosIni.fechaStatusProcessamento;
    end;
  end;
end;

function TLancamentosImp._AbreLancamentos: boolean;
begin
  result := montaSelect('select * from lancamentos where cod_lanc = -2 and codigo_emp = ' +
    vDadosIni.codEmpresa);
end;

procedure TLancamentosImp._addFLancamentos(pCodigo, pControle: integer;
  pCredCh: string);
var
  I: Integer;
begin
  for I := 0 to FLancamentos.Count - 1 do
    if vDadosIni.getCampoPipe(FLancamentos[i], 2) = IntToStr(pControle) then
      Exit;
  FLancamentos.Add(IntToStr(pCodigo) + '|' + IntToStr(pControle) + '|' + pCredCh + '|');
end;

procedure TLancamentosImp._clearFlancamentos;
begin
  FLancamentos.Clear;
end;

function TLancamentosImp._efetuarLancamento(pContrapartida: boolean): boolean;
begin

  if not dataSet.Active then
    montaSelect('select l.cod_lanc,l.data,l.tipo_l,l.n_conta_plc,l.codigo_ctrl,c.nome_ctrl,l.ndoc_l,' +
      ' l.historico_l,l.valor_l ,l.status_l,l.datq_l,l.natl,L.dia_fcd,l.nmov,l.lote,l.codigo_emp,' +
      ' l.tip_cnt,l.data_cxl,l.lanc_venda,l.data_rem_rec,l.tp_mod,l.cod_term,' +
      ' l.dt_compensado,l.nominal_l,l.n_cheq_l,l.data_venc_cheq_l,l.vl_contabil,l.lote_ent,l.cod_Emp_mult,l.op_cxl,l.dtreferencia,' +
      ' l.cod_ocorrencia, l.data_ocorrencia, l.lote_quit, l.arq_extrato_adm, l.data_arquivo, ' +
      ' l.cod_adm, l.lote, l.n_cheq_l,' +
      ' l.cod_contrapartida, l.cod_contrapartida_ctp, l.id_financ_confere ' +
      ' from Lancamentos l, controles c where l.codigo_ctrl = c.codigo_ctrl and l.codigo_emp = c.codigo_emp and ' +
      ' l.cod_lanc = 0 and l.codigo_emp = ' + vDadosIni.codEmpresa);

  dataSet.Insert;

  dataSet.FieldByName('COD_LANC').AsInteger := Gencodigo('LANCAMENTOS',
    dtmImportPDVFinan.SpIncCodigo,
    vDadosIni.retornoPorCondicao(fCODIGO_EMP > 0, fCODIGO_EMP, StrToInt(vDadosIni.codEmpresa)));
  if not vDadosIni.vContrapartidaCTP then
    if pContrapartida then
    begin
      if fTIPO_L = 'S' then
      begin
         dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger := dataSet.FieldByName('COD_LANC').AsInteger;
         vDadosIni.vCodContrapartida := dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger;
      end
      else
         dataSet.FieldByName('COD_CONTRAPARTIDA').AsInteger := vDadosIni.vCodContrapartida;
    end;
  if fTIPO_L = 'E' then
  	if vDadosIni.vContrapartidaCTP then
	  	dataSet.FieldByName('COD_CONTRAPARTIDA_CTP').AsInteger := vDadosIni.vCodContrapartidaCTP;      
  dataSet.FieldByName('N_CONTA_PLC').AsFloat := fN_CONTA_PLC;
  if Trim(fHISTORICO_L) <> '' then
    dataSet.FieldByName('HISTORICO_L').AsString := Copy(Trim(fHISTORICO_L), 1, 100);
  dataSet.FieldByName('TIPO_L').AsString := fTIPO_L;
  if Trim(fNDOC_L) <> '' then
    dataSet.FieldByName('NDOC_L').AsString := fNDOC_L;
  if Trim(fTIP_CNT) <> '' then
    dataSet.FieldByName('TIP_CNT').AsString := fTIP_CNT;
  if Trim(fLANC_VENDA) <> '' then
    dataSet.FieldByName('LANC_VENDA').AsString := fLANC_VENDA;
  //    dataSet.FieldByName('NOME_CTRL').AsString := fNOME_CTRL;
  if Trim(fTP_MOD) <> '' then
    dataSet.FieldByName('TP_MOD').AsString := fTP_MOD;
  if Trim(fARQ_EXTRATO_ADM) <> '' then
    dataSet.FieldByName('ARQ_EXTRATO_ADM').AsString := Trim(fARQ_EXTRATO_ADM);
  if fDATA_ARQUIVO > 0 then
  	dataSet.FieldByName('DATA_ARQUIVO').AsDateTime := fDATA_ARQUIVO;
  if fCOD_ADM > 0 then
    dataSet.FieldByName('COD_ADM').AsInteger := fCOD_ADM;
  dataSet.FieldByName('VALOR_L').AsCurrency := fVALOR_L;
  dataSet.FieldByName('CODIGO_CTRL').AsInteger := fCODIGO_CTRL;
  if fLOTE_ENT > 0 then
    dataSet.FieldByName('LOTE_ENT').AsInteger := fLOTE_ENT;
  if fLOTE_QUIT > 0 then
    dataSet.FieldByName('LOTE_QUIT').AsInteger := fLOTE_QUIT;
  if fLOTE > 0 then
    dataSet.FieldByName('LOTE').AsInteger := fLOTE;
  if fDATA > 0 then
    dataSet.FieldByName('DATA').AsDateTime := fDATA;
  if fDTREFERENCIA > 0 then
    dataSet.FieldByName('DTREFERENCIA').AsDateTime := fDTREFERENCIA;
  if fDATQ_L > 0 then
    dataSet.FieldByName('DATQ_L').AsDateTime := fDATQ_L;
  if Trim(fN_CHEQ_L) <> '' then
    dataSet.FieldByName('N_CHEQ_L').AsString := Copy(fN_CHEQ_L, 1, 10);
  if fDATA_VENC_CHEQ_L > 0 then
  	dataSet.FieldByName('DATA_VENC_CHEQ_L').AsDateTime := fDATA_VENC_CHEQ_L;
  if Trim(fNOMINAL_L) <> '' then
    dataSet.FieldByName('NOMINAL_L').AsString := Copy(NOMINAL_L, 1, 35);
  if Trim(fSTATUS_L) <> '' then
    dataSet.FieldByName('STATUS_L').AsString := Copy(fSTATUS_L, 1, 10);
  if fID_FINANC_CONFERE > 0 then
		dataSet.FieldByName('ID_FINANC_CONFERE').AsInteger := fID_FINANC_CONFERE;
  dataSet.FieldByName('CODIGO_EMP').AsInteger := vDadosIni.retornoPorCondicao(fCODIGO_EMP > 0, fCODIGO_EMP, StrToInt(vDadosIni.codEmpresa));
  dataSet.FieldByName('COD_EMP_MULT').AsInteger := vDadosIni.retornoPorCondicao((vDadosIni.vEmp.vFinanceiroUnificado) and (fCOD_EMP_MULT > 0), fCOD_EMP_MULT, StrToInt(vDadosIni.codEmpresa));
  dataSet.FieldByName('VL_CONTABIL').AsFloat := vDadosIni.StrToFloatFormat(fVL_CONTABIL, 2);

  fCOD_LANC := dataSet.FieldByName('COD_LANC').AsInteger;

  dataSet.Post;
  if not Apply then
    raiseExceptionCreate('Erro no processamento. Consulte o erros.log','');
//  dataSet.ApplyUpdates(-1);

  fN_CONTA_PLC := 0;
  fHISTORICO_L := '';
  fTIPO_L := '';
  fNDOC_L := '';
  fTIP_CNT := '';
  fLANC_VENDA := '';
  fNOME_CTRL := '';
  fTP_MOD := '';
  fVALOR_L := 0;
  fCODIGO_CTRL := 0;
  fLOTE_ENT := 0;
  fLOTE_QUIT := 0;
  fDATA := 0;
  fDTREFERENCIA := 0;
  fDATQ_L := 0;
  fCOD_EMP_MULT := 0;
  fCODIGO_EMP := 0;
  fLOTE := 0;
  fN_CHEQ_L := '';
  fDATA_VENC_CHEQ_L := 0;
  fSTATUS_L := '';
  fVL_CONTABIL := 0;
  fNOMINAL_L := '';
  fID_FINANC_CONFERE := 0;
end;

function TLancamentosImp._efetuarLancamentoSequencial(pCOD_LANC, pCODIGO_CTRL: Integer;
  pTIPO_L: string): boolean;
begin
  // financeiro unificado <> S codigo_emp = codigo da propria empresa, cod_emp_mult = codigo_emp
  // financeiro unificado = S codigo_emp = unificadora, cod_emp_mult = codigo da unificada
  montaSelect('select l.cod_lanc,l.data,l.tipo_l,l.n_conta_plc,l.codigo_ctrl,c.nome_ctrl,l.ndoc_l,' +
    ' l.historico_l,l.valor_l ,l.status_l,l.datq_l,l.natl,L.dia_fcd,l.nmov,l.lote,l.codigo_emp,' +
    ' l.tip_cnt,l.data_cxl,l.lanc_venda,l.data_rem_rec,l.tp_mod,l.cod_term,' +
    ' l.dt_compensado,l.nominal_l,l.n_cheq_l,l.data_venc_cheq_l,l.vl_contabil,l.lote_ent,l.cod_Emp_mult,l.op_cxl,l.dtreferencia,' +
    ' l.cod_ocorrencia,l.data_ocorrencia, l.lote_quit, l.arq_extrato_adm, l.data_arquivo,' +
    ' l.cod_adm, l.cod_contrapartida, l.cod_contrapartida_ctp, l.id_financ_confere ' +
    ' from Lancamentos l, controles c where l.codigo_ctrl = c.codigo_ctrl and l.codigo_emp = c.codigo_emp and ' +
    ' l.cod_lanc = ' + IntToStr(pCOD_LANC) +
    ' and l.codigo_ctrl = ' + IntToStr(pCODIGO_CTRL) +
    ' and l.tipo_l = ' + QuotedStr(pTIPO_L) +
    ' and l.codigo_emp = ' + vDadosIni.codEmpresa);
  if dataSet.IsEmpty then
    Result := _efetuarLancamento
  else
  begin
    dataSet.Edit;
    dataSet.FieldByName('VALOR_L').AsCurrency :=
      dataSet.FieldByName('VALOR_L').AsCurrency + fVALOR_L;
    dataSet.Post;
    if not Apply then
      raiseExceptionCreate('Erro no processamento. Consulte o erros.log','');
//    dataSet.ApplyUpdates(-1);

    fCOD_LANC := pCOD_LANC;
    fN_CONTA_PLC := 0;
    fHISTORICO_L := '';
    fTIPO_L := '';
    fNDOC_L := '';
    fTIP_CNT := '';
    fLANC_VENDA := '';
    fNOME_CTRL := '';
    fTP_MOD := '';
    fARQ_EXTRATO_ADM := '';
    fDATA_ARQUIVO := 0;
    fVALOR_L := 0;
    fCODIGO_CTRL := 0;
    fLOTE_ENT := 0;
    fLOTE_QUIT := 0;
    fDATA := 0;
    fDTREFERENCIA := 0;
    fDATQ_L := 0;
    fCOD_ADM := 0;
    fCOD_EMP_MULT := 0;
    fLOTE := 0;
    fN_CHEQ_L := '';
    fDATA_VENC_CHEQ_L := 0;
    fSTATUS_L := '';
    fVL_CONTABIL := 0;
    fNOMINAL_L := '';
    fID_FINANC_CONFERE := 0;
  end;
end;

function TLancamentosImp._getCodigoLancamento(pControle: integer): integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to FLancamentos.Count - 1 do
    if vDadosIni.getCampoPipe(FLancamentos[i], 2) = IntToStr(pControle) then
    begin
      Result := StrToInt(vDadosIni.getCampoPipe(FLancamentos[i], 1));
      Exit;
    end;
end;

procedure TLancamentosImp._setTransactionComponentes(
  pTransacao: TIBTransaction);
begin
  if pTransacao = nil then
  begin
    if buscas.Active then
      buscas.Close;
    if queryLanc.Active then
      queryLanc.Close;
    dtmImportPDVFinan.SpIncCodigo.Transaction := TIBTransaction(dtmImportPDVFinan.transacao);
    queryLanc.Transaction := TIBTransaction(dtmImportPDVFinan.transacao);
    buscas.Transaction := TIBTransaction(dtmImportPDVFinan.transacao);
    transacao := TIBTransaction(dtmImportPDVFinan.transacao);
  end
  else
  begin
    if buscas.Active then
      buscas.Close;
    if queryLanc.Active then
      queryLanc.Close;
    dtmImportPDVFinan.SpIncCodigo.Transaction := TIBTransaction(pTransacao);
    queryLanc.Transaction := TIBTransaction(pTransacao);
    buscas.Transaction := TIBTransaction(pTransacao);
    transacao := TIBTransaction(pTransacao);
  end;
end;

{ TContaLigacaoImp }

constructor TContaLigacaoImp.create;
begin
  if dtmImportPDVFinan = nil then
    dtmImportPDVFinan := TdtmImportPDVFinan.Create(dtmImportPDVFinan);
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsContaLigacao);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
  buscas := TIBQuery(dtmImportPDVFinan.qrContaLigacao);

  vPCont := TPContasImp.create;
end;

destructor TContaLigacaoImp.Destroy;
begin
  vPCont.Free;
  vPCont := nil;

  inherited;
end;

function TContaLigacaoImp._AbrirContadeLigacao(vConst: boolean): boolean;
var
  vTemp: string;
begin
  Result := montaSelect('select * from Cont_Lig where COD_EMP = ' + vDadosIni.codEmpresa);

  vTemp := '(10';

  if dataSet.FieldByName('NCON_V_PROD').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_V_PROD').AsFloat]));

  if dataSet.FieldByName('NCON_V_SERV').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_V_SERV').AsFloat]));

  if dataSet.FieldByName('NCON_C_PROD').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_C_PROD').AsFloat]));

  if dataSet.FieldByName('NCON_C_VEIC').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_C_VEIC').AsFloat]));

  if dataSet.FieldByName('NCON_S_CHQ').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_S_CHQ').AsFloat]));

  if dataSet.FieldByName('NCON_S_CRD').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_S_CRD').AsFloat]));

  if dataSet.FieldByName('CONTA_ICM').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('CONTA_ICM').AsFloat]));

  if dataSet.FieldByName('CONTA_PIS').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('CONTA_PIS').AsFloat]));

  if dataSet.FieldByName('NCON_D_PREST').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_D_PREST').AsFloat]));

  if dataSet.FieldByName('NCON_J_PREST').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_J_PREST').AsFloat]));

  if dataSet.FieldByName('NCON_MANU_EQUIP').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_MANU_EQUIP').AsFloat]));

  if dataSet.FieldByName('NCON_ED_PREST').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_ED_PREST').AsFloat]));

  if dataSet.FieldByName('NCON_SJ_PREST').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_SJ_PREST').AsFloat]));

  if dataSet.FieldByName('NCON_S_VALE').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_S_VALE').AsFloat]));

  if dataSet.FieldByName('NCON_TARIFAINTERMPAG').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_TARIFAINTERMPAG').AsFloat]));

  if dataSet.FieldByName('NCON_ENT_DESCDESP').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_ENT_DESCDESP').AsFloat]));

  if dataSet.FieldByName('NCON_C_FRETE').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_C_FRETE').AsFloat]));

  if dataSet.FieldByName('NCON_S_TRANSF').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_S_TRANSF').AsFloat]));

  if dataSet.FieldByName('NCON_E_TRANSF').AsFloat > 0 then
    vTemp := vTemp + ', ' + vDadosIni.trocaVirgulaPorPonto(Format('%0.8f',
      [dataSet.FieldByName('NCON_E_TRANSF').AsFloat]));

  vTemp := vTemp + ', 20)';

  vPCont._abrirPContas(vTemp);
end;

function TContaLigacaoImp._AbrirContadeLigacao: boolean;
begin
  Result := montaSelect('select * from Cont_Lig where COD_EMP = ' + vDadosIni.codEmpresa);
end;

{ TBoletas }

constructor TBoletosImp.create;
begin
  buscas := TIBQuery(dtmImportPDVFinan.qrBoletos);
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsBoletos);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TBoletosImp._AbrirBoletos(NossoNumero: string; CodCliente: integer; CodCobrebem: Integer; CodEmpresa: Integer): boolean;
begin
  Result := montaSelect(
  	'   select first 1 * from boletas ' +
    '   where NOSSO_NUMERO_BANCO = ' + QuotedStr(NossoNumero) +
    '   and COD_COBREBEM = ' + IntToStr(CodCobrebem) +
    '   and COD_CLIENTE=' + inttostr(Codcliente) +
    '   and (STATUS <> ''QUITADO'' or STATUS is null) ' +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	' and COD_EMPRESA = ' + IntToStr(CodEmpresa),
      ' and COD_EMPRESA = ' + vDadosIni.codEmpresa) +
    '   union ' +
    '   select first 1 * from boletas ' +
    '   where NOSSO_NUMERO_BANCO = ' + QuotedStr(NossoNumero) +
    '   and COD_CLIENTE=' + inttostr(Codcliente) +
    '   and (STATUS <> ''QUITADO'' or STATUS is null) ' +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	' and COD_EMPRESA = ' + IntToStr(CodEmpresa),
      ' and COD_EMPRESA = ' + vDadosIni.codEmpresa) +
    '   and (select count(*) from boletas ' +
    '        where NOSSO_NUMERO_BANCO = ' + QuotedStr(NossoNumero) +
    '        and COD_COBREBEM = ' + IntToStr(CodCobrebem) +
    '        and COD_CLIENTE=' + inttostr(Codcliente) +
    '        and (STATUS <> ''QUITADO'' or STATUS is null) ' +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	'      and COD_EMPRESA = ' + IntToStr(CodEmpresa),
      '      and COD_EMPRESA = ' + vDadosIni.codEmpresa) + ') = 0 ');
end;

function TBoletosImp._BaixarBoleto(NossoNumero: string; CodCliente: integer; CodCobrebem: Integer; CodEmpresa: Integer): boolean;
begin
  Result := true;
  if ExecutaComandosSql(
  	'   select first 1 * from boletas' +
    '   where NOSSO_NUMERO_BANCO = ' + QuotedStr(NossoNumero) +
    '   and COD_COBREBEM = ' + IntToStr(CodCobrebem) +
    '   and COD_CLIENTE = ' + inttostr(Codcliente) +
    '   and (STATUS <> ''QUITADO'' or STATUS is null) ' +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	' and COD_EMPRESA = ' + IntToStr(CodEmpresa),
      ' and COD_EMPRESA = ' + vDadosIni.codEmpresa) +
    '   union ' +
  	'   select first 1 * from boletas' +
    '   where NOSSO_NUMERO_BANCO = ' + QuotedStr(NossoNumero) +
    '   and COD_CLIENTE = ' + inttostr(Codcliente) +
    '   and (STATUS <> ''QUITADO'' or STATUS is null) ' +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	' and COD_EMPRESA = ' + IntToStr(CodEmpresa),
      ' and COD_EMPRESA = ' + vDadosIni.codEmpresa) +
    '   and (select count(*) from boletas' +
    '        where NOSSO_NUMERO_BANCO = ' + QuotedStr(NossoNumero) +
    '        and COD_COBREBEM = ' + IntToStr(CodCobrebem) +
    '        and COD_CLIENTE = ' + inttostr(Codcliente) +
    '        and (STATUS <> ''QUITADO'' or STATUS is null) ' +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	'      and COD_EMPRESA = ' + IntToStr(CodEmpresa),
      '      and COD_EMPRESA = ' + vDadosIni.codEmpresa) + ') = 0 ') then
  begin
    if (_AbrirBoletos(NossoNumero, CodCliente, CodCobrebem, CodEmpresa)) then
    begin
      Result := Edit;
      if not Result then
        raise Exception.Create('Erro na tentativa de inserir informação para quitar o boleto');
      dataSet.FieldByName('STATUS').AsString := 'QUITADO';
      Result := Post;
      if not Result then
        raise Exception.Create('Erro na tentativa de inserir informação para quitar o boleto');
      Result := Apply;
      if not Result then
        raise Exception.Create('Erro na tentativa de gravar informação para quitar o boleto ');
    end;
  end;
end;

function TBoletosImp._InserirOcorrenciaBancariaBoletos(
  NumeroDocumento: string; Sequencia: string;
  MotivoOcorrencia: TStringList; ExisteCredito: boolean;
  CodCobrebem: Integer; CodEmpresa: Integer): boolean;
var
  QuantOcorrencias, Resposta: integer;
  CodCliente: string;
  ListaOcorrenciaBD: TStringList;
  ListaOcorrenciaOldBD: TStringList;
begin
  CodCliente := '';
  Resposta := IDYES;
  {1}if not (MotivoOcorrencia.Count = 0) then
  begin
    CodCliente := retornaValor(
      '   select first 1 DATA_EM_BOL, COD_CLIENTE as VALOR from boletas' +
      '   where NOSSO_NUMERO_BANCO = ' + QuotedStr(NumeroDocumento) +
      '   and COD_COBREBEM = ' + IntToStr(CodCobrebem) +
      '   and (STATUS <> ''QUITADO'' or STATUS is null) ' +
      vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
        ' and COD_EMPRESA = ' + IntToStr(CodEmpresa),
        ' and COD_EMPRESA = ' + vDadosIni.codEmpresa) +
      '   union ' +
      '   select first 1 DATA_EM_BOL, COD_CLIENTE as VALOR from boletas' +
      '   where NOSSO_NUMERO_BANCO = ' + QuotedStr(NumeroDocumento) +
      '   and (STATUS <> ''QUITADO'' or STATUS is null) ' +
      vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
        ' and COD_EMPRESA = ' + IntToStr(CodEmpresa),
        ' and COD_EMPRESA = ' + vDadosIni.codEmpresa) +
      '   and (select count(*) from boletas' +
      '        where NOSSO_NUMERO_BANCO = ' + QuotedStr(NumeroDocumento) +
      '        and COD_COBREBEM = ' + IntToStr(CodCobrebem) +
      '        and (STATUS <> ''QUITADO'' or STATUS is null) ' +
      vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
        '      and COD_EMPRESA = ' + IntToStr(CodEmpresa),
        '      and COD_EMPRESA = ' + vDadosIni.codEmpresa) + ') = 0 ');

    {2}if (CodCliente <> '') then
    begin
      {3}if (_AbrirBoletos(NumeroDocumento, StrToInt(CodCliente), CodCobrebem, CodEmpresa)) then
      begin
        {4}if (pos('Sequência do arquivo de retorno: ' + Sequencia,
            dataSet.FieldByName('OCORRENCIABANCARIA').AsString) > 0) then
             exit;
        {4}
      end {3}
      else
        exit;
      {3}

      {3}if not (ExisteCredito) then
      begin

        Resposta := Application.MessageBox(pchar('O boleto com o Nosso Número: ' + NumeroDocumento +
          ' está sem crédito, deseja inserir mesmo assim a informação no boleto?'),
          'Atenção', MB_ICONQUESTION + MB_YESNOCANCEL);

        case Resposta of
          IDCANCEL: raise Exception.Create('A operação foi cancelada');
        end;

      end; {3}

      {3}if (Resposta = IDYES) then
      begin
        ListaOcorrenciaOldBD        := TStringList.Create;
        ListaOcorrenciaOldBD.text   := dataSet.FieldByName('OCORRENCIABANCARIA').asstring;

        if (pos('Sequência do arquivo de retorno: ' + Sequencia,
		      dataSet.FieldByName('OCORRENCIABANCARIA').AsString) <= 0) then
        begin
          {4}if ListaOcorrenciaOldBD.Count <= 20 then
          begin
            ListaOcorrenciaBD         := TStringList.Create;
            ListaOcorrenciaBD.text    := dataSet.FieldByName('OCORRENCIABANCARIA').asstring;
            ListaOcorrenciaBD.AddStrings(MotivoOcorrencia);

            Result := Edit;
            if not Result then
              raise Exception.Create('Erro na tentativa de inserir informação bancária no boleto');
            dataSet.FieldByName('OCORRENCIABANCARIA').asstring := trim(ListaOcorrenciaBD.Text);
            Result := Post;
            if not Result then
              raise Exception.Create('Erro na tentativa de inserir informação bancária no boleto');
            Result := Apply;
            if not Result and (dataSet.ChangeCount <> 0) then
              raise Exception.Create('Erro na tentativa de gravar informação bancária no boleto ');
            Result := CommitaTransacao;
            if not Result then
              raise Exception.Create('Erro na tentativa de gravar informação bancária no boleto ');
          end; {4}
        end;
      end; {3}
    end; {2}
  end; {1}
end;

{ TQuitcaoCreditos }

constructor TQuitacaoCreditos.create;
begin
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsQuitarCreditos);
  buscas := TIBQuery(dtmImportPDVFinan.qrquitarcreditos);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TQuitacaoCreditos._AbrirQuitCredito: boolean;
begin
  Result := montaselect('SELECT * FROM CONTROLE_CREDITOS WHERE DATA_RETORNO_QUITACAO IS NOT NULL ' +
    'AND DATA_RETORNO_QUITACAO between ' +
    Quotedstr(FormatDateTime('dd.mm.yyyy', strtodate(_DataInicio)) + ' 00:00:00') +
    ' AND ' + Quotedstr(FormatDateTime('dd.mm.yyyy', strtodate(_DataFim)) + ' 23:59:59') +
    ' AND CODIGO_EMP =' + vDadosIni.codEmpresa);
end;

{ TPrazosPDV }

function TPrazosPDV._abrePrazos: boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select cp.cupom, cp.cliente,' +
    ' fp.ndoc, fp.data_venc, fp.valordoc, fp.cod_controle, fp.secao' +
    ' from formpagamento fp' +
    ' inner join cupom cp on cp.cod_terminal = fp.cod_terminal and' +
    ' cp.cod_empresa = fp.cod_empresa and cp.registro = fp.registro and' +
    ' cp.cupom = fp.nrequisicao' +
    ' where fp.data_mov = :dataMov and' +
    ' fp.cod_empresa = :cod_empresa and fp.cod_terminal = :cod_terminal' +
    ' and coalesce(cp.status_cp, '''') <> ''CANCELADO''';

  if vOperador > 0 then
  begin
    buscas.SQL.Text := buscas.SQL.Text + ' and operador = :operador' +
      ' order by cp.cupom, fp.cod_controle, fp.secao';
    buscas.ParamByName('operador').AsInteger := vOperador;
  end
  else
    buscas.SQL.Text := buscas.SQL.Text + ' order by cp.cupom, fp.cod_controle, fp.secao';

  buscas.ParamByName('dataMov').AsDate := vDataMovimento;
  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.ParamByName('cod_terminal').AsInteger := vNumeroPDV;

  buscas.Open;

  Result := not buscas.IsEmpty;

end;

function TPrazosPDV._concectaBanco: boolean;
var
  vPw, vUs: string;
begin              
  vUs := string(__getUsuarioFDB);
  vPw := string(__getSenhaFDB);
  buscas.Database.Connected := False;
  if (Trim(vUs) <> '') then
    buscas.Database.Params[0] := 'user_name=' + string(__descriptografaTextoFDB(Pchar(vUs)));
  if (Trim(vPw) <> '') then
    buscas.Database.Params[1] := 'password=' + string(__descriptografaTextoFDB(Pchar(vPw)));
  buscas.Database.DatabaseName := FEnderecoBanco;
  try
    buscas.Database.Connected := True;
  except
  end;
  Result := _terminalOnLine;
end;

constructor TPrazosPDV.create(vEndereco: string);
begin
  FEnderecoBanco := vEndereco;
  buscas := TIBQuery(dtmImportPDVFinan.qrBuscasPDV);
  transacao := TIBTransaction(dtmImportPDVFinan.transacaoPDV);
end;

function TPrazosPDV._desconcectaBanco: boolean;
begin
  buscas.Database.Connected := False;
end;

function TPrazosPDV._terminalOnLine: boolean;
begin
  Result := buscas.Database.Connected;
end;

function TPrazosPDV._abreFormEscolhaControles(pTexto: string = ''): Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Controle Financeiro Prazo';
    frmImportacaoFinanceiro.pnControlesPrazo.Parent := formulario;
    if Trim(pTexto) = '' then
      frmImportacaoFinanceiro.Label45.Caption := 'Informe o controle financerio para as parcelas que não tem controle associado.'
    else
      frmImportacaoFinanceiro.Label45.Caption := pTexto;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.BorderIcons := [];
    frmImportacaoFinanceiro.pnControlesPrazo.Visible := True;

    result := (formulario.ShowModal = IDOK);

  finally
    frmImportacaoFinanceiro.pnControlesPrazo.Visible := False;
    frmImportacaoFinanceiro.pnControlesPrazo.Parent := frmImportacaoFinanceiro.tsControles;
    formulario.Free;
    formulario := nil;
  end;
end;

{ TImportacaoAutomacao }

procedure TImportacaoAutomacao.abreImpAuto;
begin
  if dtmImportPDVFinan = nil then
    dtmImportPDVFinan := TdtmImportPDVFinan.Create(dtmImportPDVFinan);

  if not vDadosIni.PesqPros('IMPFIN013', 'CONSULTA', '', 'FORMPAGAMENTO', '',
    dtmImportPDVFinan.qrBuscas, False) then
    Exit;

  if frmImpAuto = nil then
  	Application.CreateForm(TfrmImpAuto, frmImpAuto);
  frmImpAuto.ShowModal;
end;

constructor TImportacaoAutomacao.create;
begin
  if dtmImportPDVFinan = nil then
    dtmImportPDVFinan := TdtmImportPDVFinan.Create(dtmImportPDVFinan);

  buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);
  FBuscas2:= TIBQuery(dtmImportPDVFinan.qrBuscas2);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);

  vFp := TFormPagImpAuto.create;
  vSomaFp := TSomaFormPagImpAuto.create;
  vPrest := TPrestacoesImpAuto.create;
  vFecDCxl := TFechDiaCxlImpAuto.create;
  vContLig := TContaLigacaoImp.create;
  vlanc := TLancamentosImp.create;
  vCtrl := TControles_FPDV.create;
  vCred := TControleCreditosImp.create;
  vCh := TControleChequeImp.create;

  fCodigoUsuario := 0;
  fCodigoOperadorCxl := 0;

end;

destructor TImportacaoAutomacao.Destroy;
begin
  vFp.Free;
  vFp := nil;

  vSomaFp.Free;
  vSomaFp := nil;

  vPrest.Free;
  vPrest := nil;

  vFecDCxl.Free;
  vFecDCxl := nil;

  vContLig.Free;
  vContLig := nil;

  vlanc.Free;
  vlanc := nil;

  vCtrl.Free;
  vCtrl := nil;

  vCred.Free;
  vCred := nil;

  vCh.Free;
  vCh := nil;
  //  inherited;
end;

function TImportacaoAutomacao.retornaModFaturamentoMatrizFiliais: string;
var
  buscas2: TIBQuery;
begin
  Result := vDadosIni.vEmp.vModoFaturamento;
  if not vDadosIni.vEmp.vFinanceiroUnificado then
    exit;

  if fCodigoUnificada = StrToInt(vDadosIni.codEmpresa) then
    exit;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  SqlOpen(' SELECT MOD_FAT FROM EMPRESA  ' +
  	' WHERE COD_EMPRESA = ' + IntToStr(fCodigoUnificada), buscas2);
  Result := trim(buscas2.FieldByName('MOD_FAT').AsString);
end;

function TImportacaoAutomacao.retornaReceberComfatMatrizFiliais: Boolean;
var
  buscas2: TIBQuery;
begin
  Result := vDadosIni.vVeic.ReceberPeloFinanceiro;
  if not vDadosIni.vEmp.vFinanceiroUnificado then
    exit;

  if fCodigoUnificada = StrToInt(vDadosIni.codEmpresa) then
    exit;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  SqlOpen(' SELECT VALUE1_F RETORNO FROM CONFIG_SISTEMA' +
    ' WHERE CHAVE = ''vei_receber_financeiro'' AND COD_EMPRESA = ' + IntToStr(fCodigoUnificada), buscas2);
  Result := buscas2.FieldByName('RETORNO').AsFloat > 0;
end;

function TImportacaoAutomacao.retornaReceberRecibosMatrizFiliais: Boolean;
var
  buscas2: TIBQuery;
begin
  Result := vDadosIni.vRecibo.ReceberPeloFinanceiro;
  if not vDadosIni.vEmp.vFinanceiroUnificado then
    exit;

  if fCodigoUnificada = StrToInt(vDadosIni.codEmpresa) then
    exit;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  SqlOpen(' SELECT VALUE1_F RETORNO FROM CONFIG_SISTEMA' +
    ' WHERE CHAVE = ''rec_receber_financeiro'' AND COD_EMPRESA = ' + IntToStr(fCodigoUnificada), buscas2);
  Result := buscas2.FieldByName('RETORNO').AsFloat > 0;
end;

function TImportacaoAutomacao.retornaReceberReqOsMatrizFiliais: Boolean;
var
  buscas2: TIBQuery;
begin
  Result := vDadosIni.vPedVnd.ReceberPeloFinanceiro;
  if not vDadosIni.vEmp.vFinanceiroUnificado then
    exit;

  if fCodigoUnificada = StrToInt(vDadosIni.codEmpresa) then
    exit;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  SqlOpen(' SELECT VALUE1_F RETORNO FROM CONFIG_SISTEMA' +
    ' WHERE CHAVE = ''ped_vnd_receber_financeiro'' AND COD_EMPRESA = ' + IntToStr(fCodigoUnificada), buscas2);
  Result := buscas2.FieldByName('RETORNO').AsFloat > 0;
end;

function TImportacaoAutomacao._abreFormaPagamento: Boolean;
begin

  vFp._abreFormPag(fDataInicial, fDataFinal, fCodigoOperadorCxl, fCodigoUsuario, fCodigoUnificada, fModoFaturamento,
  	fReceberPeloFinanceiroReqOs, fReceberPeloFinanceiroComfat, fReceberPeloFinanceiroRecibo, fTipoDoc);

end;

function TImportacaoAutomacao._abreFormDataBaixa(pDiaDefault: TDate): TDate;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption :=
      'Controle Financeiro Prazo';
    frmImpAuto.pnDtBaixa.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.BorderIcons := [];
    frmImpAuto.pnDtBaixa.Visible := True;
    frmImpAuto.edDtBaixa.Text := DateToStr(pDiaDefault);

    formulario.ShowModal;

    Result := StrToDate(frmImpAuto.edDtBaixa.Text);

  finally
    frmImpAuto.pnDtBaixa.Visible := False;
    frmImpAuto.pnDtBaixa.Parent := frmImpAuto;
    formulario.Free;
    formulario := nil;
  end;
end;

function TImportacaoAutomacao._abreFormOpcoesImportacao: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Opções de Importação';
    frmImpAuto.pnOpcoesImportacao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.BorderIcons := [];
    frmImpAuto.pnOpcoesImportacao.Visible := True;

    Result := formulario.ShowModal = IDOK;

  finally
    frmImpAuto.pnOpcoesImportacao.Visible := False;
    frmImpAuto.pnOpcoesImportacao.Parent := frmImpAuto;
    formulario.Free;
    formulario := nil;
  end;
end;

function TImportacaoAutomacao._abrePrestacoesRecebidas: boolean;
begin

  fValorTotalPrestacoes := 0;

  if (fModoFaturamento = 'S')
  	and ((fReceberPeloFinanceiroReqOs) or (fReceberPeloFinanceiroComfat) or (fReceberPeloFinanceiroRecibo))
    and (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
    exit;

  //fValorTotalPrestacoes;

  vPrest._abrePrestacoes(fDataInicial, fDataFinal, fCodigoOperadorCxl, fCodigoUnificada);

  vPrest.dataSet.First;
  while not vPrest.dataSet.Eof do
  begin

    fValorTotalPrestacoes := fValorTotalPrestacoes +
      vPrest.dataSet.FieldByName('VL_RQ_PG_CXL').AsFloat;

    vPrest.dataSet.Next;
  end;

  vPrest.dataSet.First;

  Result := true;

end;

procedure TImportacaoAutomacao._desfazerSelecaoTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Desfazendo seleção dos Itens');

    if not vFp.dataSet.Active then
      exit;
    vFp.dataSet.First;
    while not vFp.dataSet.Eof do
    begin
      vFp.dataSet.Edit;
      vFp.dataSet.FieldByName('sel').AsString := ' ';
      vFp.dataSet.Post;
      vFp.dataSet.Next;
    end;
    vFp.dataSet.First;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

//function TImportacaoAutomacao._desnegativaClienteRecebimento(pCodCliente, vtp: integer): Boolean;
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
//      ', DATA_DESBARRAMENTO = dasdasd' +
//      ' where codigo_emp = ' + vDadosIni.codEmpresa +
//      ' and COD_FATURAMENTO = ' + IntToStr(vDadosIni.vEmp.vCodigoBarrado) +
//      ' and cod_cliente = ' + IntToStr(pCodCliente);
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
//  end;
//end;

function TImportacaoAutomacao._efetuarSomaConferencia: boolean;
begin

  _somaVendaReqOS;
  _somaVendaVeiculos;
  _somaRecibosRecebidos;
  _somaPrestacoesRecebidas;
  _somaLancamentosCxl;
  _somaRecibosUsadosFormaPag;
  _somaTaxaIntermPagEC;

  fValorTotalVendasPrest := fValorReqOS + fValorComFat + fValorRecibo + fValorPrestacoesReceb;

  fValorTotalJuros := fValorReqOSJuros + fValorComFatJuros + fValorPrestacoesRecebJuros;

  fValorTotalLancamentosAvulso := fValorLancamentosAvulsos;//fValorLancamentos;

  fValorTotalTroco := fValorTotalTroco;

  vSomaFp._abreSomaFormPag(fDataInicial, fDataFinal,
  	fCodigoOperadorCxl, fCodigoUsuario, fCodigoUnificada, fModoFaturamento,
    fReceberPeloFinanceiroReqOs, fReceberPeloFinanceiroComfat, fReceberPeloFinanceiroRecibo,
    fTipoDoc);

  fValorTotalLiquido := fValorTotalVendasPrest + fValorTotalLancamentosAvulso
  	- Abs(fValorBaixaRecibos) - Abs(fValorTaxaInterPagEC) + fValorTotalJuros;

  fValorTotalCreditos := 0;

  vSomaFp.dataSet.First;
  while not vSomaFp.dataSet.Eof do
  begin

    fValorTotalCreditos := fValorTotalCreditos +
      vSomaFp.dataSet.FieldByName('soma').AsFloat;

    vSomaFp.dataSet.Next;
  end;

  fValorTotalDiferenca := fValorTotalCreditos - fValorTotalLiquido;
//  fValorTotalDiferenca := fValorTotalVendasPrest + fValorTotalLancamentosAvulso -
//    fValorTotalCreditos;

  Result := true;

end;

function TImportacaoAutomacao._processarCreditosSelecionados: boolean;
var
  vDia, vDiaFinanceiroFechado: TDate;
  vNaoGerarFinanceiro, vBaixaAutomatica: Boolean;
  vIntegerTemp, vNumProcessamento: Integer;
  vflag, vflag1: integer;
  vSqlTmp: string;
  vListaVendasAbertas: TStringList;
  vTemp: string;
  buscas2: TIBQuery;
  vdiadifcaixa: boolean;
  vdatacxlinicial: TDateTime;
  vNovoValorLiquido: Double;
  vListaClBarrarDesbarrar: TStringList;
  I: Integer;
begin
	vDiaFinanceiroFechado := 0;
//  criei os atributos nas classes cred, ch e lanc, fiz a logica para gravar o vl_contabil nos campos
//  tanto neste metodo como no de prestacao
//  falta
//    campos no data module - OK
//    no contas a receber fazer a mesma logica aplicada aqui
//    testes
//      fazer varias vendas e emitir doc fiscal da maioria
//      usar as vendas e receber prestacoes de contas contabeis e nao contabeis juntas
//      efetuar recebimentos pelo financeiro de contas contabeis e nao contabeis juntas

	// Financeiro sendo fechado
  if vDadosIni.financeiroFechando(buscas) then
    Exit;

  // Financeiro sendo importado
  if vDadosIni.financeiroImportando(buscas) then
    Exit;

  buscas.Close;
  buscas.SQL.Text := ' select max(fd.dia_fcd) dia_fcd from fech_dia fd ' +
    ' where fd.codigo_emp = ' + vDadosIni.codEmpresa;
  buscas.Open;
  vDiaFinanceiroFechado := buscas.FieldByName('dia_fcd').AsDateTime;

  try
  	vFp.dataSet.DisableControls;
    vFp.dataSet.First;
    while not vFp.dataSet.Eof do
    begin
      buscas.Close;
      buscas.SQL.Text := ' select first 1 prcss, n_processamento from formpagamento ' +
        ' where seqform = ' + IntToStr(vFp.dataSet.FieldByName('seqform').AsInteger) +
        ' and cod_empresa = ' + IntToStr(vFp.dataSet.FieldByName('cod_empresa').AsInteger);
      buscas.Open;

      if (buscas.FieldByName('prcss').AsString = 'S') or (buscas.FieldByName('n_processamento').AsInteger > 0) then
        raiseExceptionCreate('Documento já processado pelo financeiro' + #13 + #13 +
          'DOCUMENTO' + #13 +
          vDadosIni.IfThen(vFp.dataSet.FieldByName('NREQUISICAO').AsInteger > 0, 'Nº Venda: ' + IntToStr(vFp.dataSet.FieldByName('NREQUISICAO').AsInteger) + #13, '') +
          vDadosIni.IfThen(trim(vFp.dataSet.FieldByName('NDOC').AsString) <> '', 'Nº Doc: ' + trim(vFp.dataSet.FieldByName('NDOC').AsString) + #13, '') +
          vDadosIni.IfThen(trim(vFp.dataSet.FieldByName('TPDOCS').AsString) <> '', 'Tp Doc: ' + trim(vFp.dataSet.FieldByName('TPDOCS').AsString) + #13, '') +
          vDadosIni.IfThen(vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger > 0, 'Cod Controle: ' + IntToStr(vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger) + #13, '') +
          vDadosIni.IfThen(vFp.dataSet.FieldByName('DATA_MOV').AsDateTime > 0, 'Data Movimento: ' + FormatDateTime('dd/mm/yyyy', vFp.dataSet.FieldByName('DATA_MOV').AsDateTime) + #13, '') +
          vDadosIni.IfThen(vFp.dataSet.FieldByName('DATA_VENC').AsDateTime > 0, 'Data Vencimento: ' + FormatDateTime('dd/mm/yyyy', vFp.dataSet.FieldByName('DATA_VENC').AsDateTime) + #13, '') +
          vDadosIni.IfThen(vFp.dataSet.FieldByName('VALORDOC').AsFloat > 0, 'Valor: ' + FormatFloat('0.00', vFp.dataSet.FieldByName('VALORDOC').AsFloat) + #13, '') +
          vDadosIni.IfThen(vFp.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0, 'Cod Cliente: ' + IntToStr(vFp.dataSet.FieldByName('COD_CLIENTE').AsInteger) + #13, '') +
          vDadosIni.IfThen(trim(vFp.dataSet.FieldByName('CLIENTE').AsString) <> '', 'Nome Cliente: ' + trim(vFp.dataSet.FieldByName('CLIENTE').AsString) + #13, '') +
          vDadosIni.IfThen(trim(vFp.dataSet.FieldByName('HISTORICO').AsString) <> '', 'Histórico: ' + trim(vFp.dataSet.FieldByName('HISTORICO').AsString) + #13, '') + #13 +
          'Favor verificar antes de continuar.', '');

      vFp.Next;
    end;
  finally
    vFp.dataSet.EnableControls;
    vFp.dataSet.First;
  end;

	try
    buscas.Close;
    buscas.sql.text := ' update fech_dia set inicia_import = ''S'' ' +
      ' where dia_fcd = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDiaFinanceiroFechado)) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa;
    buscas.Prepare;
    buscas.ExecSQL;
    CommitaTransacao;

    vListaClBarrarDesbarrar := TStringList.Create;
    vListaClBarrarDesbarrar.Sorted := True;
    vListaClBarrarDesbarrar.Duplicates := dupIgnore;
    vListaClBarrarDesbarrar.Clear;

    try
      Result := True;

      vdiadifcaixa := false;
      vdatacxlinicial := 0;

      buscas2 := TIBQuery.Create(Application);
      buscas2.Database := buscas.Database;
      buscas2.Transaction := buscas.Transaction;

      fVenda := 'S';
      fHistPadraoUnificadas := '';
      if vDadosIni.vEmp.vFinanceiroUnificado then
        fHistPadraoUnificadas := ' EMP: ' + vDadosIni.StrZero(fCodigoUnificada, 3);

      if vDadosIni.vEmp.vItAuto = 'S' then
      begin

        if vDadosIni.vEmp.vModoFaturamento = 'S' then
        begin

          vDadosIni.abreStatusProcessamento('', 'Verificando dia no Caixa Auxiliar');

          vFecDCxl._abreDiaCxl(fDataInicial, fDataFinal, fCodigoOperadorCxl, fCodigoUnificada);

          if ((fReceberPeloFinanceiroReqOs) or (fReceberPeloFinanceiroComfat) or (fReceberPeloFinanceiroRecibo))
            and (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
            // Não fazer nada
          else
          begin
            if not vFecDCxl._verificarCaixaAberto(fDataInicial, fDataFinal, fCodigoOperadorCxl, fCodigoUnificada) then
            begin
              Result := false;
              exit;
            end;

            if vFecDCxl.dataSet.IsEmpty then
              raiseExceptionCreate('Dia não encontrado no caixa da Loja', '');
          end;

          vDia := StrToDate(fDataInicial);

          while vDia <= StrToDate(fDataFinal) do
          begin
            vFecDCxl._abreDiaCxl(DateToStr(vDia), DateToStr(vDia), fCodigoOperadorCxl, fCodigoUnificada);

            if ((fReceberPeloFinanceiroReqOs) or (fReceberPeloFinanceiroComfat) or (fReceberPeloFinanceiroRecibo))
              and (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
              // Não fazer nada
            else
            begin
              if not vFecDCxl._verificarCaixaAberto(DateToStr(vDia), DateToStr(vDia), fCodigoOperadorCxl, fCodigoUnificada) then
              begin
                Result := false;
                exit;
              end;

              if vFecDCxl.dataSet.FieldByName('STATUS_CXL').IsNull then
                raiseExceptionCreate('Caixa da Loja ainda não fechado. Dia: ' + DateToStr(vDia), '');
            end;

            if (vDiaFinanceiroFechado + 1 <> vFecDCxl.dataSet.FieldByName('dia_f_cxl').AsDateTime) then
              if (not vdiadifcaixa) then
              begin
                vdiadifcaixa := true;
                vdatacxlinicial := vFecDCxl.dataSet.FieldByName('dia_f_cxl').AsDateTime;
              end;

            vDia := vDia + 1;
          end;

          if ((fReceberPeloFinanceiroReqOs) or (fReceberPeloFinanceiroComfat) or (fReceberPeloFinanceiroRecibo))
              and (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
            // Não fazer nada
          else if (vdiadifcaixa) then
          begin
            if not vDadosIni.PesqPros('IMPFIN033', 'PERMITIR', '', 'FORMPAGAMENTO', '', buscas, True) then
            begin
               Application.MessageBox(pchar('Dia do caixa auxiliar diferente do dia do financeiro: ' + #13 + #13 +
                'Dia do caixa auxiliar: ' + FormatDateTime('dd/mm/yyyy', vdatacxlinicial) + #13 +//vFecDCxl.dataSet.FieldByName('dia_f_cxl').AsDateTime) + #13 +
                'Dia do financeiro: ' + FormatDateTime('dd/mm/yyyy', vDiaFinanceiroFechado + 1)), 'Atenção', MB_OK + MB_ICONWARNING);
               Result := false;
               exit;
            end;
          end;
        end
        else
        begin
          vDadosIni.vInibeMensPesqPros := 'S';
          if vDadosIni.PesqPros('IMPFIN031', 'TESTAR', '', 'FORMPAGAMENTO', '', buscas, True) then
          begin
            buscas.Close;
            buscas.SQL.Text :=
              'select case when pv.tipo = ''REQ'' then 1 else 2 end ordem,pv.nped numero, case when pv.tipo = ''REQ'' then ''Pedido de Venda'' else ''Ordem de Serviço'' end tipo, pv.valor_total valor' +
              ' from pedvenda pv' +
              ' where pv.data_fech >= :dataIni and pv.data_fech <= :dataFim and pv.tipo <> ''ORC'' and pv.cod_empresa = :cod_empresa and coalesce(pv.status_ped, '''') = ''FECHADA'' and coalesce(pv.valor_total, 0) > 0 and' +
              ' (select count(fp.nrequisicao) from formpagamento fp  where fp.nrequisicao = pv.nped and fp.tpdocs = pv.tipo and fp.cod_empresa = pv.cod_empresa) = 0' +
              ' union' +
              ' select 3 ordem, cf.n_comando numero, ''Comando de Faturamento'' tipo, cf.valor_a_rec valor' +
              ' from com_fat cf' +
              ' where cf.data_ven >= :dataIni and cf.data_ven <= :dataFim and cf.cod_empresa = :cod_empresa and coalesce(cf.valor_a_rec, 0) > 0 and' +
              ' (select count(fp.nrequisicao) from formpagamento fp  where fp.nrequisicao = cf.n_comando and fp.tpdocs = ''MOT'' and fp.cod_empresa = cf.cod_empresa) = 0' +
              vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vVersaoVeiculos = '4',
              ' and (coalesce(trim(upper(status_v)), '''') = ''FECHADO'')',
              ' and (coalesce(trim(upper(status_v)), '''') <> ''CANCELADA'')') +
              ' union' +
              ' select 4 ordem, r.nrecibo numero, ''Recibo'' tipo, r.valor from recibos r' +
              ' where r.data_rec >= :dataIni and r.data_rec <= :dataFim and r.cod_empresa = :cod_empresa and r.nrecibo < 100000 and coalesce(r.valor, 0) > 0 and ' +
              ' (select count(fp.nrequisicao) from formpagamento fp  where fp.nrequisicao = r.nrecibo and fp.tpdocs = ''REC'' and fp.cod_empresa = r.cod_empresa) = 0' +
              ' order by 1, 2';
            buscas.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, fCodigoUnificada, StrToInt(vDadosIni.codEmpresa));
            buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
            buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
            buscas.Open;

            vListaVendasAbertas := TStringList.Create;
            vListaVendasAbertas.Clear;

            buscas.First;
            while not buscas.Eof do
            begin
              vListaVendasAbertas.Add(
                Trim(buscas.FieldByName('tipo').AsString)+ ' de número ' + IntToStr(buscas.FieldByName('numero').AsInteger) +
                ' no valor de ' + Format('%0.2m', [buscas.FieldByName('valor').AsFloat])
              );
              buscas.Next;
            end;

            if vListaVendasAbertas.Count > 0 then
            begin
              Application.MessageBox(PChar('Existem vendas sem recebimento: ' + #13 + #13 + vListaVendasAbertas.Text), 'Atenção', 0 + 64);
              if not vDadosIni.PesqPros('IMPFIN032', 'VALIDAR', vListaVendasAbertas.Text, 'FORMPAGAMENTO', '', buscas, True, True) then
                raiseExceptionCreate('Vendas sem recebimento: ' + #13 + vListaVendasAbertas.Text, '');
            end;
          end;
        end;
      end;

      buscas.Close;
      buscas.SQL.Text := ' select max(fd.dia_fcd) dia_fcd from fech_Dia fd ' +
        ' where fd.codigo_emp = ' + vDadosIni.codEmpresa;
      buscas.Open;
      vDiaFinanceiroFechado := buscas.FieldByName('dia_fcd').AsDateTime;

      try
        vFp.dataSet.DisableControls;
        vFp.dataSet.First;
        vflag := 0;
        vflag1 := 0;
        while not vFp.dataSet.Eof do
        begin
          if vFp.dataSet.FieldByName('sel').AsString = 'S' then
          begin
            vflag := 1;
            if (vfp.dataSet.FieldByName('DATA_MOV').AsDateTime > (vDiaFinanceiroFechado + 1)) then
              vflag1 := 1;
            break;
          end;
          vFp.Next;
        end;
      finally
      	vFp.dataSet.EnableControls;
    		vFp.dataSet.First;
      end;

      if vflag = 0 then
        raiseExceptionCreate('Nenhum Controle Selecionado para Processamento', '');
      if vflag1 = 1 then
        raiseExceptionCreate('Existe créditos com data de venda maior que a data do financeiro', '');

      if not _abreFormOpcoesImportacao then
        raiseExceptionCreate('Operação cancelada pelo usuário', '');

      // Financeiro sendo fechado
      if vDadosIni.financeiroFechando(buscas) then
      begin
        Result := false;
        Exit;
      end;

  //    fAgruparValoresEmDinheiro :=
  //      Application.MessageBox('Agrupar valores lançados em Dinheiro?', 'Confirmação',
  //      MB_ICONQUESTION + MB_YESNO) = IDYES;

      vDadosIni.abreStatusProcessamento('', 'Iniciando recursos');

      vContLig._AbrirContadeLigacao(True);

      fSomaDinheiro := 0;
      fSomaDinheiroContabil := 0;
      fSomaCheque := 0;
      fSomaCreditos := 0;

      vlanc._clearFlancamentos;

      vSomaFp._abreSomaFormPag(fDataInicial, fDataFinal,
        fCodigoOperadorCxl, fCodigoUsuario, fCodigoUnificada, fModoFaturamento,
        fReceberPeloFinanceiroReqOs, fReceberPeloFinanceiroComfat, fReceberPeloFinanceiroRecibo,
        fTipoDoc);

      vDadosIni.abreStatusProcessamento('Status Processamento. Etapa 1 de 3',
        'Preparando lançamentos consolidados');

      vProgresso.Min := 0;
      vProgresso.Position := 0;
      vProgresso.Max := vFp.dataSet.RecordCount;

      try
      	vFp.dataSet.DisableControls;
        vFp.dataSet.First;
        while not vFp.dataSet.Eof do
        begin
          if vFp.dataSet.FieldByName('sel').AsString = 'S' then
          begin
            vSomaFp.First;
            while not vSomaFp.dataSet.Eof do
            begin
              if (Trim(vFp.dataSet.FieldByName('TPDOCS').AsString) <> 'LCS') then
                if (vSomaFp.dataSet.FieldByName('cod_controle').AsInteger =
                  vFp.dataSet.FieldByName('cod_controle').AsInteger) and
                  (Trim(vSomaFp.dataSet.FieldByName('NAO_GERA_FINAN').AsString) <> 'S')  then
                begin
                  vSomaFp.dataSet.Edit;
                  vSomaFp.dataSet.FieldByName('soma2').AsCurrency :=
                    vSomaFp.dataSet.FieldByName('soma2').AsCurrency +
                    vFp.dataSet.FieldByName('valordoc').AsCurrency;
                  vSomaFp.dataSet.Post;
                  Break;
                end;
              vSomaFp.dataSet.Next;
            end;
          end;

          vFp.dataSet.Next;
          vProgresso.Position := vProgresso.Position + 1;
        end;
      finally
        vFp.dataSet.EnableControls;
    		vFp.dataSet.First;
      end;

      vDadosIni.abreStatusProcessamento('Status Processamento. Etapa 2 de 3',
        'Efetuando lançamentos consolidados');

      vProgresso.Min := 0;
      vProgresso.Position := 0;
      vProgresso.Max := vSomaFp.dataSet.RecordCount;

      try
        vSomaFp.dataSet.DisableControls;
        vSomaFp.dataSet.First;
        while not vSomaFp.dataSet.Eof do
        begin
          vCtrl._abrirControles(vSomaFp.dataSet.FieldByName('cod_controle').AsInteger);
          if (Trim(vCtrl.dataSet.FieldByName('BAIXA_AUTOMATICA').AsString) = 'S') and
            (fAgruparValoresBaixaAutomatica) then
          begin
            vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat;
            if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
              raiseExceptionCreate('Conta de ligação de venda de produtos não é valida', '');

            vlanc.CODIGO_CTRL := vSomaFp.dataSet.FieldByName('cod_controle').AsInteger;
            vlanc.DATA := vDiaFinanceiroFechado + 1;
            vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
            vlanc.TIPO_L := Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
            vlanc.VALOR_L := vSomaFp.dataSet.FieldByName('SOMA2').AsFloat;
            vlanc.HISTORICO_L := 'ENTRADA BX AUTOMATICA' + fHistPadraoUnificadas;
            vlanc.TIP_CNT := vFp.dataSet.FieldByName('TIP_CNT').AsString;
            if vDadosIni.vEmp.vFinanceiroUnificado then
              vlanc.COD_EMP_MULT := fCodigoUnificada;

            if fVenda = 'S' then
              vlanc.LANC_VENDA := fVenda;
            vlanc.VL_CONTABIL := vSomaFp.dataSet.FieldByName('SOMA_CONTABIL').AsFloat;
            vlanc.TIP_CNT := vDadosIni.retornoPorCondicao(vlanc.VL_CONTABIL > 0, 'C', 'N');
            vlanc._efetuarLancamento;

            vNumProcessamento := vlanc.COD_LANC;

            vlanc.N_CONTA_PLC := vCtrl.dataSet.FieldByName('N_CONTA_BX_AUTO').AsFloat;
            if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
              raiseExceptionCreate('Conta para baixa automática no controle ' +
                vCtrl.dataSet.FieldByName('codigo_ctrl').AsString +
                vCtrl.dataSet.FieldByName('nome_ctrl').AsString +
                ' não é valida', '');

            vlanc.CODIGO_CTRL := vSomaFp.dataSet.FieldByName('cod_controle').AsInteger;
            vlanc.DATA := vDiaFinanceiroFechado + 1;
            vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
            vlanc.HISTORICO_L := 'SAIDA BX AUTOMATICA' + fHistPadraoUnificadas;
            vlanc.TIPO_L := Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
            vlanc.VALOR_L := vSomaFp.dataSet.FieldByName('SOMA2').AsFloat;
            if vDadosIni.vEmp.vFinanceiroUnificado then
              vlanc.COD_EMP_MULT := fCodigoUnificada;
            if fVenda = 'S' then
              vlanc.LANC_VENDA := 'S';
            vlanc.VL_CONTABIL := vSomaFp.dataSet.FieldByName('SOMA_CONTABIL').AsFloat;
            vlanc.TIP_CNT := vDadosIni.retornoPorCondicao(vlanc.VL_CONTABIL > 0, 'C', 'N');
            vlanc._efetuarLancamento;
          end
          else
          if (Trim(vCtrl.dataSet.FieldByName('docs').AsString) = 'S1') and
            (vSomaFp.dataSet.FieldByName('SOMA2').AsFloat > 0) then
          begin
            vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat;

            //vContLig.vPCont.dataSet.Locate('N_CONTA_PLC', vlanc.N_CONTA_PLC, []);
            if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
              raiseExceptionCreate('Corrija o cadastro para continuar', '');

            vlanc.CODIGO_CTRL := vSomaFp.dataSet.FieldByName('cod_controle').AsInteger;
            vlanc.DATA := vDiaFinanceiroFechado + 1;
            vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
            if (fCodigoOperadorCxl > 0) then
              vlanc.HISTORICO_L :=
                Trim(copy('CHEQUES REF. A VENDAS CONF OPERADOR ' + IntToStr(fCodigoOperadorCxl), 1, 60))
            else
              vlanc.HISTORICO_L :=
                Trim(copy('ENTRADA DE CHEQUES REF. A VENDAS', 1, 60));
            vlanc.HISTORICO_L := Trim(vlanc.HISTORICO_L) + fHistPadraoUnificadas;
            vlanc.TIPO_L := Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
            vlanc.VALOR_L := vSomaFp.dataSet.FieldByName('SOMA2').AsFloat;
            if vDadosIni.vEmp.vFinanceiroUnificado then
              vlanc.COD_EMP_MULT := fCodigoUnificada;
            if fVenda = 'S' then
              vlanc.LANC_VENDA := 'S';
            //vlanc.TIP_CNT := 'C';
            vlanc.VL_CONTABIL := vSomaFp.dataSet.FieldByName('SOMA_CONTABIL').AsFloat;
            vlanc.TIP_CNT := vDadosIni.retornoPorCondicao(vlanc.VL_CONTABIL > 0, 'C', 'N');
            vlanc._efetuarLancamento;

            vlanc._addFLancamentos(vlanc.COD_LANC,
              vSomaFp.dataSet.FieldByName('cod_controle').AsInteger, 'CH');
          end
          else if (Trim(vCtrl.dataSet.FieldByName('docs').AsString) = 'S2') and
            (vSomaFp.dataSet.FieldByName('SOMA2').AsFloat > 0) then
          begin
            vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat;

            //        vContLig.vPCont.dataSet.Locate('N_CONTA_PLC', vlanc.N_CONTA_PLC, []);
            if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
              raiseExceptionCreate('Corrija o cadastro para continuar', '');

            vlanc.CODIGO_CTRL := vSomaFp.dataSet.FieldByName('cod_controle').AsInteger;
            vlanc.DATA := vDiaFinanceiroFechado + 1;
            vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
            if (fCodigoOperadorCxl > 0) then
              vlanc.HISTORICO_L :=
                Trim(copy(trim(vSomaFp.dataSet.FieldByName('NOME_CTRL').AsString) +
                ' VENDAS CONF. OPERADOR ' + IntToStr(fCodigoOperadorCxl), 1, 60))
            else
              vlanc.HISTORICO_L :=
                Trim(copy('ENTRADA DE ' + trim(vSomaFp.dataSet.FieldByName('NOME_CTRL').AsString) +
                ' REF. A VENDAS', 1, 60));
            vlanc.HISTORICO_L := Trim(vlanc.HISTORICO_L) + fHistPadraoUnificadas;
            vlanc.TIPO_L := Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
            vlanc.VALOR_L := vSomaFp.dataSet.FieldByName('SOMA2').AsFloat;
            if vDadosIni.vEmp.vFinanceiroUnificado then
              vlanc.COD_EMP_MULT := fCodigoUnificada;
            if fVenda = 'S' then
              vlanc.LANC_VENDA := 'S';
            //vlanc.TIP_CNT := 'C';
            vlanc.VL_CONTABIL := vSomaFp.dataSet.FieldByName('SOMA_CONTABIL').AsFloat;
            vlanc.TIP_CNT := vDadosIni.retornoPorCondicao(vlanc.VL_CONTABIL > 0, 'C', 'N');
            vlanc._efetuarLancamento;

            vlanc._addFLancamentos(vlanc.COD_LANC, vSomaFp.dataSet.FieldByName('cod_controle').AsInteger,
              'C');

          end;

          vSomaFp.dataSet.Next;
          vProgresso.Position := vProgresso.Position + 1;
        end;
      finally
      	vSomaFp.dataSet.EnableControls;
      	vSomaFp.dataSet.First;
      end;

      vDadosIni.abreStatusProcessamento('Status Processamento. Etapa 3 de 3',
        'Efetuando lançamentos de Controle de Caixa');

      vProgresso.Min := 0;
      vProgresso.Position := 0;
      vProgresso.Max := vFp.dataSet.RecordCount;

      try
        vFp.dataSet.DisableControls;
        vFp.dataSet.First;
        while not vFp.dataSet.Eof do
        begin
          if vFp.dataSet.FieldByName('sel').AsString = 'S' then
          begin
            vNumProcessamento := 0;
            vNaoGerarFinanceiro := False;
            vBaixaAutomatica := False;
            vCtrl._abrirControles(vFp.dataSet.FieldByName('cod_controle').AsInteger);
            if (Trim(vCtrl.dataSet.FieldByName('BAIXA_AUTOMATICA').AsString) = 'S') and
              (fAgruparValoresBaixaAutomatica) then
              vBaixaAutomatica := True
            else if (Trim(vCtrl.dataSet.FieldByName('BAIXA_AUTOMATICA').AsString) = 'S') and
              (not fAgruparValoresBaixaAutomatica) then
            begin
              vBaixaAutomatica := True;
              vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat;
              if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
                raiseExceptionCreate('Corrija o cadastro para continuar', '');

              vlanc.CODIGO_CTRL := vSomaFp.dataSet.FieldByName('cod_controle').AsInteger;
              vlanc.DATA := vDiaFinanceiroFechado + 1;
              vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
              vlanc.TIPO_L := Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
              vlanc.VALOR_L := vSomaFp.dataSet.FieldByName('SOMA2').AsFloat;
              vlanc.HISTORICO_L := 'ENTRADA BX AUTOMATICA CONF. ' +
                vFp.dataSet.FieldByName('TPDOCS').AsString + ' ' +
                vDadosIni.StrZero(vFp.dataSet.FieldByName('NREQUISICAO').AsInteger, 6) + fHistPadraoUnificadas;
              vlanc.TIP_CNT := vFp.dataSet.FieldByName('TIP_CNT').AsString;
              if vDadosIni.vEmp.vFinanceiroUnificado then
                vlanc.COD_EMP_MULT := fCodigoUnificada;

              if fVenda = 'S' then
                vlanc.LANC_VENDA := fVenda;
              vlanc.VL_CONTABIL := vSomaFp.dataSet.FieldByName('SOMA_CONTABIL').AsFloat;
              vlanc.TIP_CNT := vDadosIni.retornoPorCondicao(vlanc.VL_CONTABIL > 0, 'C', 'N');
              vlanc._efetuarLancamento;


              vlanc.N_CONTA_PLC := vCtrl.dataSet.FieldByName('N_CONTA_BX_AUTO').AsFloat;
              if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
                raiseExceptionCreate('Corrija o cadastro para continuar', '');

              vlanc.CODIGO_CTRL := vSomaFp.dataSet.FieldByName('cod_controle').AsInteger;
              vlanc.DATA := vDiaFinanceiroFechado + 1;
              vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
              vlanc.HISTORICO_L := 'SAIDA BX AUTOMATICA CONF. ' +
                vFp.dataSet.FieldByName('TPDOCS').AsString + ' ' +
                vDadosIni.StrZero(vFp.dataSet.FieldByName('NREQUISICAO').AsInteger, 6) + fHistPadraoUnificadas;
              vlanc.TIPO_L := Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
              vlanc.VALOR_L := vSomaFp.dataSet.FieldByName('SOMA2').AsFloat;
              if vDadosIni.vEmp.vFinanceiroUnificado then
                vlanc.COD_EMP_MULT := fCodigoUnificada;
              if fVenda = 'S' then
                vlanc.LANC_VENDA := 'S';
              vlanc.VL_CONTABIL := vSomaFp.dataSet.FieldByName('SOMA_CONTABIL').AsFloat;
              vlanc.TIP_CNT := vDadosIni.retornoPorCondicao(vlanc.VL_CONTABIL > 0, 'C', 'N');
              vlanc._efetuarLancamento;
            end
            else
            if Trim(vCtrl.dataSet.FieldByName('NAO_GERA_FINAN').AsString) = 'S' then
              vNaoGerarFinanceiro := True
            else if (Trim(vFp.dataSet.FieldByName('TIPDOC').AsString) = 'N') then
            begin
              if (Trim(vFp.dataSet.FieldByName('TPDOCS').AsString) = 'LCS') then
              begin
                if vFp.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
                  vlanc.N_CONTA_PLC := vFp.dataSet.FieldByName('N_CONTA_PLC').AsFloat
                else if (vFp.dataSet.FieldByName('VALORDOC').AsCurrency < 0)
                  and (vFp.dataSet.FieldByName('RECIBO').AsString = 'S') then
                  vlanc.N_CONTA_PLC := vDadosIni.IfThen(vContLig.dataSet.FieldByName('NCON_S_VALE').AsFloat > 0,
                     vContLig.dataSet.FieldByName('NCON_S_VALE').AsFloat, vContLig.dataSet.FieldByName('NCON_S_CRD').AsFloat)
                else if vFp.dataSet.FieldByName('VALORDOC').AsCurrency < 0 then
                  vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_S_CRD').AsFloat
                else
                  vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat;

                //            vContLig.vPCont.dataSet.Locate('N_CONTA_PLC', vlanc.N_CONTA_PLC, []);
                if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
                  raiseExceptionCreate('Corrija o cadastro para continuar', '');

                vlanc.HISTORICO_L := Trim(vFp.dataSet.FieldByName('HISTORICO').AsString) + fHistPadraoUnificadas;
                if vFp.dataSet.FieldByName('VALORDOC').AsCurrency < 0 then
                  vlanc.VALOR_L := vFp.dataSet.FieldByName('VALORDOC').AsCurrency * (-1)
                else
                  vlanc.VALOR_L := vFp.dataSet.FieldByName('VALORDOC').AsCurrency;
                vlanc.CODIGO_CTRL := vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger;
                vlanc.TIPO_L := Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
                vlanc.DATA := vDiaFinanceiroFechado + 1;
                vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
                vlanc.NDOC_L := vFp.dataSet.FieldByName('NDOC').AsString;
                vlanc.TIP_CNT := vFp.dataSet.FieldByName('TIP_CNT').AsString;
                if vDadosIni.vEmp.vFinanceiroUnificado then
                  vlanc.COD_EMP_MULT := fCodigoUnificada;
                if fVenda = 'S' then
                  vlanc.LANC_VENDA := fVenda;
                vlanc.VL_CONTABIL := vDadosIni.retornoPorCondicao(vlanc.TIP_CNT = 'C', vlanc.VALOR_L, 0.00);
                vlanc._efetuarLancamento;
                vNumProcessamento := vlanc.dataSet.FieldByName('COD_LANC').AsInteger;
              end
              else if (Trim(vFp.dataSet.FieldByName('TPDOCS').AsString) = 'INTERM') then
              begin
                if vFp.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
                  vlanc.N_CONTA_PLC := vFp.dataSet.FieldByName('N_CONTA_PLC').AsFloat
                else if vContLig.dataSet.FieldByName('NCON_TARIFAINTERMPAG').AsFloat > 0 then
                  vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_TARIFAINTERMPAG').AsFloat
                else
                  vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_S_CRD').AsFloat;

                //            vContLig.vPCont.dataSet.Locate('N_CONTA_PLC', vlanc.N_CONTA_PLC, []);
                if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
                  raiseExceptionCreate('Corrija o cadastro para continuar', '');

                vlanc.HISTORICO_L := Trim(vFp.dataSet.FieldByName('HISTORICO').AsString) + fHistPadraoUnificadas;
                if vFp.dataSet.FieldByName('VALORDOC').AsCurrency < 0 then
                  vlanc.VALOR_L := vFp.dataSet.FieldByName('VALORDOC').AsCurrency * (-1)
                else
                  vlanc.VALOR_L := vFp.dataSet.FieldByName('VALORDOC').AsCurrency;
                vlanc.CODIGO_CTRL := vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger;
                vlanc.TIPO_L := Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
                vlanc.DATA := vDiaFinanceiroFechado + 1;
                vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
                vlanc.NDOC_L := vFp.dataSet.FieldByName('NDOC').AsString;
                vlanc.TIP_CNT := vFp.dataSet.FieldByName('TIP_CNT').AsString;
                if vDadosIni.vEmp.vFinanceiroUnificado then
                  vlanc.COD_EMP_MULT := fCodigoUnificada;
                if fVenda = 'S' then
                  vlanc.LANC_VENDA := fVenda;
                vlanc.VL_CONTABIL := vDadosIni.retornoPorCondicao(vlanc.TIP_CNT = 'C', vlanc.VALOR_L, 0.00);
                vlanc._efetuarLancamento;
                vNumProcessamento := vlanc.dataSet.FieldByName('COD_LANC').AsInteger;
              end
              else if (fAgruparValoresEmDinheiro) and (vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger = 1) then
              begin
                fSomaDinheiro := fSomaDinheiro + vFp.dataSet.FieldByName('valordoc').AsCurrency;
                fSomaDinheiroContabil := fSomaDinheiroContabil + vDadosIni.retornoPorCondicao(vFp.dataSet.FieldByName('TIP_CNT').AsString = 'C', vFp.dataSet.FieldByName('valor_contabil').AsCurrency, 0.00);
              end
              else
              begin
                if vFp.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
                  vlanc.N_CONTA_PLC := vFp.dataSet.FieldByName('N_CONTA_PLC').AsFloat
                else if vFp.dataSet.FieldByName('VALORDOC').AsCurrency < 0 then
                  vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_S_CRD').AsFloat
                else
                  vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat;

                //            vContLig.vPCont.dataSet.Locate('N_CONTA_PLC', vlanc.N_CONTA_PLC, []);
                if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
                  raiseExceptionCreate('Corrija o cadastro para continuar', '');
                vlanc.HISTORICO_L :=
                  vDadosIni.IfThen(vFp.dataSet.FieldByName('VALORDOC').AsCurrency < 0, 'SAIDA', 'ENTRADA') + ' DINHEIRO VENDAS CONF. ' +
                  vFp.dataSet.FieldByName('TPDOCS').AsString + ' ' +
                  vDadosIni.StrZero(vFp.dataSet.FieldByName('NREQUISICAO').AsInteger, 6) + fHistPadraoUnificadas;
                if vFp.dataSet.FieldByName('VALORDOC').AsCurrency < 0 then
                  vlanc.VALOR_L := vFp.dataSet.FieldByName('VALORDOC').AsCurrency * (-1)
                else
                  vlanc.VALOR_L := vFp.dataSet.FieldByName('VALORDOC').AsCurrency;
                vlanc.CODIGO_CTRL := vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger;
                vlanc.TIPO_L := Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
                vlanc.DATA := vDiaFinanceiroFechado + 1;
                vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
                vlanc.NDOC_L := vFp.dataSet.FieldByName('NDOC').AsString;
                vlanc.TIP_CNT := vFp.dataSet.FieldByName('TIP_CNT').AsString;
                if vDadosIni.vEmp.vFinanceiroUnificado then
                  vlanc.COD_EMP_MULT := fCodigoUnificada;
                if fVenda = 'S' then
                  vlanc.LANC_VENDA := fVenda;
                vlanc.VL_CONTABIL := vDadosIni.retornoPorCondicao(vlanc.TIP_CNT = 'C', vlanc.VALOR_L, 0.00);
                vlanc._efetuarLancamento;
                vNumProcessamento := vlanc.dataSet.FieldByName('COD_LANC').AsInteger;
              end;
            end
            else if (Trim(vFp.dataSet.FieldByName('TIPDOC').AsString) = 'S1') then
            begin
              if vFp.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
                vCh.N_CONTA_PLC := vFp.dataSet.FieldByName('N_CONTA_PLC').AsFloat
              else
                vCh.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat;

              vCh.CODIGO_CTRL := vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger;
              vCh.COD_CLIENTE := vFp.dataSet.FieldByName('COD_CLIENTE').AsInteger;
              vCh.NOME_CH := vFp.dataSet.FieldByName('CLIENTE').AsString;
              buscas.Close;
              buscas.SQL.Text := 'select c.razao, c.cpfcgc from clientes c ' +
                ' where c.cod_cliente = ' + inttostr(vFp.dataSet.FieldByName('COD_CLIENTE').AsInteger) +
                ' and c.cod_empresa = ' + IntToStr(vFp.dataSet.FieldByName('COD_EMPRESA').AsInteger) +
                ' and c.ativo = 1';
              buscas.Open;

              vCh.RAZAO := buscas.FieldByName('RAZAO').AsString;
              vCh.CPFCGC := buscas.FieldByName('CPFCGC').AsString;

              vCh.DATA_REC := vDiaFinanceiroFechado + 1;
              vCh.DTORIGINAL_CH := vDiaFinanceiroFechado + 1;
              if ((vDadosIni.vRecibo.HabRecPorDepart) and (trim(vFp.dataSet.FieldByName('TPDOCS').AsString) = 'REC')) then
              begin
                buscas2.Close;
                buscas2.SQL.Text := ' select trim(num_rec_dep) num_rec_dep from recibos ' +
                  ' where nrecibo = :nrecibo and cod_empresa = :cod_empresa ';
                buscas2.ParamByName('NRECIBO').AsInteger := vFp.dataSet.FieldByName('NREQUISICAO').AsInteger;
                buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
                buscas2.Open;

                vCh.HISTORICO_CH := 'VENDAS CHQ CONF. ' +
                  vFp.dataSet.FieldByName('TPDOCS').AsString + ' ' +
                  vDadosIni.IfThen(buscas2.IsEmpty,
                  vDadosIni.StrZero(vFp.dataSet.FieldByName('NREQUISICAO').AsInteger, 6),
                  buscas2.FieldByName('NUM_REC_DEP').AsString);

              end
              else
              begin
                vCh.HISTORICO_CH := 'VENDAS CHQ CONF. ' +
                  vFp.dataSet.FieldByName('TPDOCS').AsString + ' ' +
                  vDadosIni.StrZero(vFp.dataSet.FieldByName('NREQUISICAO').AsString, 6);
              end;
              vCh.DATA_VENC := vFp.dataSet.FieldByName('DATA_VENC').AsDateTime;
              vCh.VALOR_CH := vFp.dataSet.FieldByName('VALORDOC').AsCurrency;

              vCh.TP_DOC_V := Trim(vFp.dataSet.FieldByName('TPDOCS').AsString);

              { Mudança dia 18/11/2011. Será gravado nas tabelas de controle_creditos e controle_cheque
                exatamento como no forma de pagamento. REQ, OS, MOT, REC, PRE, etc. Pois assim ficas mais fácil encontrar a venda
              if Trim(vFp.dataSet.FieldByName('TPDOCS').AsString) = 'REQ' then
                vCh.TP_DOC_V := 'R'
              else if Trim(vFp.dataSet.FieldByName('TPDOCS').AsString) = 'OS' then
                vCh.TP_DOC_V := 'O'
              else if Trim(vFp.dataSet.FieldByName('TPDOCS').AsString) = 'REC' then
              begin
                buscas.Close;
                buscas.SQL.Text := 'select deprec from recibos where nrecibo = ' +
                  vFp.dataSet.FieldByName('NREQUISICAO').asstring + ' and cod_empresa = ' + vDadosIni.codEmpresa;
                buscas.Open;

                if buscas.FieldByName('deprec').AsString = 'E' then
                  vCh.TP_DOC_V :=  'R'
                else if buscas.FieldByName('deprec').AsString = 'V' then
                  vCh.TP_DOC_V := 'M'
                else if buscas.FieldByName('deprec').AsString = 'O' then
                  vCh.TP_DOC_V := 'O';

              end
              else
                vCh.TP_DOC_V := 'M';}

              vCh.N_DOC_V := vFp.dataSet.FieldByName('NREQUISICAO').AsInteger;
              vCh.N_CH := vFp.dataSet.FieldByName('NDOC').AsString;
              vCh.AGENCIA := vFp.dataSet.FieldByName('AGENCIA').AsString;
              vCh.CONTA := vFp.dataSet.FieldByName('CONTA').AsString;
              vCh.BANCO := vFp.dataSet.FieldByName('BANCO').AsString;
              vCh.ID_BANCO := vFp.dataSet.FieldByName('COD_BANCO_STR').AsString;
              vCh.COD_CLI_TERC := vFp.dataSet.FieldByName('COD_CLI_TERC').AsInteger;
              vCh.NOME_TERC := vFp.dataSet.FieldByName('TERCEIROS').AsString;
              vCh.CODIGO_VEND := vFp.dataSet.FieldByName('OPERADOR').AsInteger;
              vCh.TIP_CNT := vFp.dataSet.FieldByName('TIP_CNT').AsString;
              vCh.DATA_VENDA := vFp.dataSet.FieldByName('DATA_MOV').AsDateTime;
              vCh.VL_BAIXA_COMISSAO := vFp.dataSet.FieldByName('VL_BAIXA_COMISSAO').AsCurrency;
              vCh.VL_BAIXA_COMISSAO_GER := vFp.dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').AsCurrency;
              vCh.US_CAD := vFp.dataSet.FieldByName('US_CAD').AsInteger;
              if vDadosIni.vEmp.vFinanceiroUnificado then
                vCh.COD_EMP_MULT := fCodigoUnificada;

              fSomaCheque := fSomaCheque + vCh.VALOR_CH;

              vCh.VL_CONTABIL := vDadosIni.retornoPorCondicao(vFp.dataSet.FieldByName('TIP_CNT').AsString = 'C', vCh.VALOR_CH, 0.00);
              vCh._efetuarLancamento(vListaClBarrarDesbarrar);

              buscas.Close;
              buscas.SQL.Text := 'INSERT INTO LANCCHEQUE (COD_LANC, CODIGO_CH, CODIGO_EMP)' +
                ' VALUES (:COD_LANC, :CODIGO_CH, :CODIGO_EMP)';
              buscas.ParamByName('COD_LANC').AsInteger :=
                vlanc._getCodigoLancamento(vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger);
              buscas.ParamByName('CODIGO_CH').AsInteger := vCh.CODIGO_CH;
              buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
              buscas.ExecSQL;

              vNumProcessamento := vCh.CODIGO_CH;

            end
            else if (Trim(vFp.dataSet.FieldByName('TIPDOC').AsString) = 'S2') then
            begin

              if vFp.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
                vCred.N_CONTA_PLC := vFp.dataSet.FieldByName('N_CONTA_PLC').AsFloat
              else
                vCred.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat;

              vCred.CODIGO_CTRL := vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger;
              vCred.COD_CLIENTE := vFp.dataSet.FieldByName('COD_CLIENTE').AsInteger;
              vCred.COD_COBREBEM := vFp.dataSet.FieldByName('COD_COBREBEM').AsInteger;
              vCred.NOSSO_NUMERO_BANCO := vFp.dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString;
              vCred.NOME_C := vFp.dataSet.FieldByName('CLIENTE').AsString;
              buscas.Close;
              buscas.SQL.Text := 'select c.razao, c.cpfcgc from clientes c ' +
                ' where c.cod_cliente = ' + inttostr(vFp.dataSet.FieldByName('COD_CLIENTE').AsInteger) +
                ' and c.cod_empresa = ' + IntToStr(vFp.dataSet.FieldByName('COD_EMPRESA').AsInteger) +
                ' and c.ativo = 1';
              buscas.Open;

              vCred.RAZAO := buscas.FieldByName('RAZAO').AsString;
              vCred.CPFCGC := buscas.FieldByName('CPFCGC').AsString;

              vCred.DATA_REC_C := vDiaFinanceiroFechado + 1;
              vCred.DTORIGINAL_C := vDiaFinanceiroFechado + 1;

              vCtrl._abrirControles(vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger);
              vCred.TIPO_DOC_C := vCtrl.dataSet.FieldByName('NOME_CTRL').AsString;

              if ((vDadosIni.vRecibo.HabRecPorDepart) and (trim(vFp.dataSet.FieldByName('TPDOCS').AsString) = 'REC')) then
              begin
                buscas2.Close;
                buscas2.SQL.Text := ' select trim(num_rec_dep) num_rec_dep from recibos ' +
                  ' where nrecibo = :nrecibo and cod_empresa = :cod_empresa ';
                buscas2.ParamByName('NRECIBO').AsInteger := vFp.dataSet.FieldByName('NREQUISICAO').AsInteger;
                buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
                buscas2.Open;

                vCred.HISTORICO_C := 'VENDAS CONF. ' +
                  vFp.dataSet.FieldByName('TPDOCS').AsString + ' ' +
                  vDadosIni.IfThen(buscas2.IsEmpty,
                  vDadosIni.StrZero(vFp.dataSet.FieldByName('NREQUISICAO').AsInteger, 6),
                  buscas2.FieldByName('NUM_REC_DEP').AsString);
              end
              else
              begin
                vCred.HISTORICO_C := 'VENDAS CONF. ' +
                  vFp.dataSet.FieldByName('TPDOCS').AsString + ' ' +
                  vDadosIni.StrZero(vFp.dataSet.FieldByName('NREQUISICAO').AsString, 6);
              end;
              vCred.DATA_VENC_C := vFp.dataSet.FieldByName('DATA_VENC').AsDateTime;
              vCred.VALOR_C := vFp.dataSet.FieldByName('VALORDOC').AsCurrency;

              vDadosIni.CalcularTaxaCartao(buscas2,
               vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, fCodigoUnificada, 0),
               vFp.dataSet.FieldByName('NREQUISICAO').AsInteger,
               vFp.dataSet.FieldByName('TPDOCS').AsString,
               vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger,
               vCtrl.dataSet.FieldByName('TP_PLANO').AsString,
               vFp.dataSet.FieldByName('COD_TERMINAL_ADM').AsString,
               vFp.dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger,
               vFp.dataSet.FieldByName('DEB_CRED').AsString,
               vFp.dataSet.FieldByName('QTDE_PARC').AsInteger,
               vDadosIni.IfThen(vFp.dataSet.FieldByName('VALORDOC_LIQ').AsFloat > 0,
                 vFp.dataSet.FieldByName('VALORDOC_LIQ').AsFloat,
                 vFp.dataSet.FieldByName('VALORDOC').AsFloat),
               vFp.dataSet.FieldByName('VALORDOC').AsFloat,
               vCtrl.dataSet.FieldByName('TAXA_CARTAO').AsFloat,
               false,
               vNovoValorLiquido);
              vCred.VALOR_LIQUIDO := vNovoValorLiquido;

              vCred.TP_DOC_V := Trim(vFp.dataSet.FieldByName('TPDOCS').AsString);

              { Mudança dia 18/11/2011. Será gravado nas tabelas de controle_creditos e controle_cheque
                exatamento como no forma de pagamento. REQ, OS, MOT, REC, PRE, etc. Pois assim ficas mais fácil encontrar a venda
              if Trim(vFp.dataSet.FieldByName('TPDOCS').AsString) = 'REQ' then
                vCred.TP_DOC_V := 'R'
              else if Trim(vFp.dataSet.FieldByName('TPDOCS').AsString) = 'OS' then
                vCred.TP_DOC_V := 'O'
              else if Trim(vFp.dataSet.FieldByName('TPDOCS').AsString) = 'REC' then
              begin
                buscas.Close;
                buscas.SQL.Text := 'select deprec from recibos where nrecibo = ' +
                  vFp.dataSet.FieldByName('NREQUISICAO').asstring + ' and cod_empresa = ' + vDadosIni.codEmpresa;
                buscas.Open;

                if buscas.FieldByName('deprec').AsString = 'E' then
                  vCred.TP_DOC_V :=  'R'
                else if buscas.FieldByName('deprec').AsString = 'V' then
                  vCred.TP_DOC_V := 'M'
                else if buscas.FieldByName('deprec').AsString = 'O' then
                  vCred.TP_DOC_V := 'O';

              end
              else
                vCred.TP_DOC_V := 'M';}

              vCred.N_DOC_V := vFp.dataSet.FieldByName('NREQUISICAO').AsInteger;

              if (vCred.N_DOC_V > 0) and
                (Trim(vFp.dataSet.FieldByName('TPDOCS').AsString) = 'REQ') then
              begin
                vIntegerTemp := 0;

                buscas.Close;
                buscas.SQL.Text := 'select dependente from pedvenda ' +
                  ' where nped = ' + IntToStr(vCred.N_DOC_V) +
                  ' and tipo = ''REQ'' and cod_empresa = ' + IntToStr(vFp.dataSet.FieldByName('COD_EMPRESA').AsInteger);
                buscas.Open;

                vIntegerTemp := buscas.FieldByName('dependente').AsInteger;

                if vIntegerTemp > 0 then
                begin
                  buscas.Close;
                  buscas.SQL.Text := 'select c.nome from END_PCLIENTES c ' +
                    ' where c.SEQCAD = ' + inttostr(vIntegerTemp) +
                    ' and c.cod_empresa = ' + IntToStr(vFp.dataSet.FieldByName('COD_EMPRESA').AsInteger) +
                    ' and c.ativo = 1';
                  buscas.Open;
                  vCred.DEPENDENTE := buscas.FieldByName('nome').AsString;
                end;
              end;
              vCred.N_DOC_C := vFp.dataSet.FieldByName('NDOC').AsString;
              vCred.CODIGO_VEND := vFp.dataSet.FieldByName('OPERADOR').AsInteger;
              vCred.CODIGO_FUNC := vFp.dataSet.FieldByName('CODIGO_FUNC').AsInteger;
              vCred.TIP_CNT := vFp.dataSet.FieldByName('TIP_CNT').AsString;
              vCred.DATA_VENDA := vFp.dataSet.FieldByName('DATA_MOV').AsDateTime;
              vCred.N_AUT_CART := vFp.dataSet.FieldByName('N_AUT_CART').AsString;
              vCred.N_DOCNSU_ADM := vFp.dataSet.FieldByName('N_DOCNSU_ADM').AsString;
              vCred.NPARCELA := vFp.dataSet.FieldByName('NPARCELA').AsInteger;
              vCred.QTDE_PARC := vFp.dataSet.FieldByName('QTDE_PARC').AsInteger;
              vCred.COD_TERMINAL_ADM := vFp.dataSet.FieldByName('COD_TERMINAL_ADM').AsString;
              vCred.DESC_TERMINAL_ADM := vFp.dataSet.FieldByName('DESC_TERMINAL_ADM').AsString;
              vCred.DEB_CRED := vFp.dataSet.FieldByName('DEB_CRED').AsString;
              vCred.COD_BANDEIRA_ADM := vFp.dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger;
              vCred.DESC_BANDEIRA := vFp.dataSet.FieldByName('DESC_BANDEIRA').AsString;
              if Trim(vCred.COD_TERMINAL_ADM) <> '' then
              begin
                buscas.Close;
                buscas.SQL.Text := ' select tc.cod_adm, ac.descricao_adm from terminal_cartao tc ' +
                  ' left join adm_cartao ac on ac.cod_adm = tc.cod_adm and ac.cod_empresa = tc.cod_empresa ' +
                  ' where tc.cod_term_adm = ' + QuotedStr(Trim(vCred.COD_TERMINAL_ADM)) +
                  ' and tc.cod_empresa = ' + IntToStr(vFp.dataSet.FieldByName('COD_EMPRESA').AsInteger);
                buscas.Open;
                vCred.COD_ADM := buscas.FieldByName('COD_ADM').AsInteger;
                vCred.DESC_ADM := trim(buscas.FieldByName('DESCRICAO_ADM').AsString);
              end;
              vCred.COD_CLI_TERC := vFp.dataSet.FieldByName('COD_CLI_TERC').AsInteger;
              vCred.NOME_TERC := vFp.dataSet.FieldByName('TERCEIROS').AsString;
              vCred.VL_BAIXA_COMISSAO := vFp.dataSet.FieldByName('VL_BAIXA_COMISSAO').AsCurrency;
              vCred.VL_BAIXA_COMISSAO_GER := vFp.dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').AsCurrency;
              vCred.US_CAD := vFp.dataSet.FieldByName('US_CAD').AsInteger;
              if vDadosIni.vEmp.vFinanceiroUnificado then
                vCred.COD_EMP_MULT := fCodigoUnificada;

              fSomaCreditos := fSomaCreditos + vCred.VALOR_C;

              vCred.VL_CONTABIL := vDadosIni.retornoPorCondicao(vFp.dataSet.FieldByName('TIP_CNT').AsString = 'C', vCred.VALOR_C, 0.00);
              vCred._efetuarLancamento(vListaClBarrarDesbarrar);

              buscas.Close;
              buscas.SQL.Text := 'INSERT INTO CREDITOS_LANC ( COD_LANC, COD_CRED, CODIGO_EMP)' +
                ' VALUES ( :COD_LANC, :COD_CRED, :CODIGO_EMP)';
              buscas.ParamByName('COD_LANC').AsInteger :=
                vlanc._getCodigoLancamento(vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger);
              buscas.ParamByName('COD_CRED').AsInteger := vCred.COD_CRED;
              buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
              buscas.ExecSQL;

              vNumProcessamento := vCred.COD_CRED;

            end;

            buscas.Close;
            buscas.SQL.Text := 'UPDATE FORMPAGAMENTO SET PRCSS = ''S'' ';

            if vNumProcessamento > 0 then
              buscas.SQL.Text := buscas.SQL.Text + ',N_PROCESSAMENTO = :N_PROCESSAMENTO ';

            if vNaoGerarFinanceiro then
              buscas.SQL.Text := buscas.SQL.Text + ',NAO_GERA_FINAN = ''S''';

            if vBaixaAutomatica then
              buscas.SQL.Text := buscas.SQL.Text + ',BAIXA_AUTOMATICA = ''S''';

            buscas.SQL.Text := buscas.SQL.Text +
              ' WHERE SEQFORM = :SEQFORM AND COD_EMPRESA = :COD_EMPRESA';
            if vNumProcessamento > 0 then
              buscas.ParamByName('N_PROCESSAMENTO').AsInteger := vNumProcessamento;
            buscas.ParamByName('SEQFORM').AsInteger := vFp.dataSet.FieldByName('SEQFORM').AsInteger;
            //aqui o codigo da empresa ja vai estar correto pois o select ja foi feito com o codigo da unficada
            buscas.ParamByName('COD_EMPRESA').AsInteger :=
              vFp.dataSet.FieldByName('COD_EMPRESA').AsInteger;
            buscas.ExecSQL;
          end;

          vFp.dataSet.Next;
          vProgresso.Position := vProgresso.Position + 1;
        end;
      finally
      	vFp.dataSet.EnableControls;
        vFp.dataSet.First;
      end;

      if (fAgruparValoresEmDinheiro) and (Abs(fSomaDinheiro) > 0) then
      begin

        vDadosIni.abreStatusProcessamento('Status Processamento. Finalizando',
          'Efetuando lançamento agrupado em Dinheiro');

        if fSomaDinheiro < 0 then
           vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_S_CRD').AsFloat
        else
          vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat;
        vlanc.HISTORICO_L := vDadosIni.IfThen(fSomaDinheiro < 0, 'SAIDA', 'ENTRADA') + ' DINHEIRO VENDAS';
        if fCodigoOperadorCxl > 0 then
          vlanc.HISTORICO_L := vlanc.HISTORICO_L + ' CONF OPERADOR ' + IntToStr(fCodigoOperadorCxl);
        vlanc.HISTORICO_L := Trim(vlanc.HISTORICO_L) + fHistPadraoUnificadas;
        vlanc.VALOR_L := Abs(fSomaDinheiro);
        vlanc.CODIGO_CTRL := 1;
        if fSomaDinheiro < 0 then
           vlanc.TIPO_L := 'S'
        else
          vlanc.TIPO_L := 'E';
        vlanc.DATA := vDiaFinanceiroFechado + 1;
        vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
        vlanc.NDOC_L := vFp.dataSet.FieldByName('NDOC').AsString;
        vlanc.TIP_CNT := vFp.dataSet.FieldByName('TIP_CNT').AsString;
        if vDadosIni.vEmp.vFinanceiroUnificado then
          vlanc.COD_EMP_MULT := fCodigoUnificada;
        if fVenda = 'S' then
          vlanc.LANC_VENDA := fVenda;
        vlanc.VL_CONTABIL := fSomaDinheiroContabil;
        vlanc.TIP_CNT := vDadosIni.retornoPorCondicao(vlanc.VL_CONTABIL > 0, 'C', 'N');
        vlanc._efetuarLancamento;
        vFp.First;
        while not vFp.dataSet.Eof do
        begin
          if vFp.dataSet.FieldByName('sel').AsString = 'S' then
          begin
            if (Trim(vFp.dataSet.FieldByName('TIPDOC').AsString) = 'N') and
              (Trim(vFp.dataSet.FieldByName('TPDOCS').AsString) <> 'LCS') and
              (vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger = 1) then
            begin
              buscas.Close;
              buscas.SQL.Text := 'UPDATE FORMPAGAMENTO SET N_PROCESSAMENTO = :N_PROCESSAMENTO ' +
                ' WHERE SEQFORM = :SEQFORM AND COD_EMPRESA = :COD_EMPRESA';
              buscas.ParamByName('N_PROCESSAMENTO').AsInteger :=
                vlanc.dataSet.FieldByName('COD_LANC').AsInteger;
              buscas.ParamByName('SEQFORM').AsInteger := vFp.dataSet.FieldByName('SEQFORM').AsInteger;
              buscas.ParamByName('COD_EMPRESA').AsInteger :=
                vFp.dataSet.FieldByName('COD_EMPRESA').AsInteger;
              buscas.ExecSQL;
            end;
          end;
          vfp.Next;
        end;
      end;

      CommitaTransacao;

      vDadosIni.GravaAuditoria('IMPFIN018', 'PROCESSAR', 'PROCESSAMENTO CONCLUÍDO', 'FORMPAGAMENTO',
        '', buscas);

      Result := True;

    except
      on e: exception do
      begin
        Result := False;
        RollBackTransacao;

        vDadosIni.GravaAuditoria('IMPFIN018', 'PROCESSAR', 'FALHA NO PROCESSAMENTO', 'FORMPAGAMENTO', '', buscas);
        if Trim(vFp.dataSet.FieldByName('TIPDOC').AsString) = 'N' then
          vTemp := 'Erro do processamento. Venda ' +
            vFp.dataSet.FieldByName('TPDOCS').AsString + ' ' +
            vDadosIni.IfThen(
              ((trim(vFp.dataSet.FieldByName('TPDOCS').AsString) = 'REC')
              and (trim(vFp.dataSet.FieldByName('NUM_REC_DEP').AsString) <> '')),
              trim(vFp.dataSet.FieldByName('NUM_REC_DEP').AsString),
              vFp.dataSet.FieldByName('NREQUISICAO').AsString) + #13 +
            'Erro: ' + e.Message + #13 +
            'O processamento não será feito'
        else
          vTemp := 'Erro do processamento. Documento ' +
            vFp.dataSet.FieldByName('TIPDOC').AsString + ' ' +
            vFp.dataSet.FieldByName('ndoc').AsString + #13 +
            'Erro: ' + e.Message;
        Application.MessageBox(pchar(vTemp), 'Atenção', 0 + 64);
        registraErro('function _processarCreditosSelecionados Erro: ' + e.Message + #13 +
          'O processamento não será feito');
      end;
    end;
  finally
  	if vDiaFinanceiroFechado > 0 then
    begin
      buscas.Close;
      buscas.sql.text := ' update fech_dia set inicia_import = '''' ' +
        ' where dia_fcd = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDiaFinanceiroFechado)) +
        ' and codigo_emp = ' + vDadosIni.codEmpresa;
      buscas.Prepare;
      buscas.ExecSQL;
      CommitaTransacao;
    end;

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

function TImportacaoAutomacao._processarPrestacoes: boolean;
var
  vDia, vDiaFinanceiroFechado, vDataBaixa: TDate;
  vValorJuros, vValorDesconto: Currency;
  vValorJurosCNT, vValorDescontoCNT: Currency;
  vControleTemp: Integer;
  vNaoGerarFinanceiro : Boolean;
  vLoteQuitN_LOTE_QUIT: Integer;
  vLoteQuitDATA_L_QUIT: TDate;
  vValorSomaPrestacoes, vValorSomaPrestacoesContabil: Currency;
  vNumProcessamento: Integer;
  vnomecliente: string;
  vSomaComissao, vSomaComissaoGer, vValorSomaFP, vValorContabilSomaLote: Extended;
  vNegCliente: TNegativacaoCliente;
  vCampoEmpresa: string;
  vdiadifcaixa: boolean;
  vdatacxlinicial: TDateTime;
  buscas2: TIBQuery;
  vNovoValorLiquido: Double;
  vListaClBarrarDesbarrar: TStringList;
  I: Integer;
begin
	vDiaFinanceiroFechado := 0;
	// Financeiro sendo fechado
  if vDadosIni.financeiroFechando(buscas) then
    Exit;

  // Financeiro sendo importado
  if vDadosIni.financeiroImportando(buscas) then
    Exit;

  buscas.Close;
  buscas.SQL.Text := ' select max(fd.dia_fcd) dia_fcd from fech_dia fd ' +
    ' where fd.codigo_emp = ' + vDadosIni.codEmpresa;
  buscas.Open;
  vDiaFinanceiroFechado := buscas.FieldByName('dia_fcd').AsDateTime;

  try
  	vPrest.dataSet.DisableControls;
  	vPrest.dataSet.First;
    while not vPrest.dataSet.Eof do
    begin
  	  buscas.Close;
      buscas.SQL.Text := ' select first 1 prcss, n_processamento from formpagamento ' +
        ' where nrequisicao = ' + IntToStr(vPrest.dataSet.FieldByName('lote_cxl').AsInteger) +
        ' and cod_empresa = ' + IntToStr(vPrest.dataSet.FieldByName('cod_emp_mult').AsInteger) +
        ' and tpdocs = ''PRE'' ';
      buscas.Open;

      if (buscas.FieldByName('prcss').AsString = 'S') or (buscas.FieldByName('n_processamento').AsInteger > 0) then
      	raiseExceptionCreate('Prestação já processada pelo financeiro' + #13 + #13 +
          'PRESTAÇÃO' + #13 +
          vDadosIni.IfThen(vPrest.dataSet.FieldByName('N_DOC_V').AsInteger > 0, 'Nº Venda: ' + IntToStr(vPrest.dataSet.FieldByName('N_DOC_V').AsInteger) + #13, '') +
          vDadosIni.IfThen(trim(vPrest.dataSet.FieldByName('N_DOC_C').AsString) <> '', 'Nº Doc: ' + trim(vPrest.dataSet.FieldByName('N_DOC_C').AsString) + #13, '') +
          vDadosIni.IfThen(trim(vPrest.dataSet.FieldByName('TP_DOC_V').AsString) <> '', 'Tp Doc: ' + trim(vPrest.dataSet.FieldByName('TP_DOC_V').AsString) + #13, '') +
          vDadosIni.IfThen(vPrest.dataSet.FieldByName('CODIGO_CTRL').AsInteger > 0, 'Cod Controle: ' + IntToStr(vPrest.dataSet.FieldByName('CODIGO_CTRL').AsInteger) + #13, '') +
          vDadosIni.IfThen(vPrest.dataSet.FieldByName('DATA_REC_C').AsDateTime > 0, 'Data Cadastro: ' + FormatDateTime('dd/mm/yyyy', vPrest.dataSet.FieldByName('DATA_REC_C').AsDateTime) + #13, '') +
          vDadosIni.IfThen(vPrest.dataSet.FieldByName('DATA_VENC_C').AsDateTime > 0, 'Data Vencimento: ' + FormatDateTime('dd/mm/yyyy', vPrest.dataSet.FieldByName('DATA_VENC_C').AsDateTime) + #13, '') +
          vDadosIni.IfThen(vPrest.dataSet.FieldByName('DIA_CXL').AsDateTime > 0, 'Dia Cxl: ' + FormatDateTime('dd/mm/yyyy', vPrest.dataSet.FieldByName('DIA_CXL').AsDateTime) + #13, '') +
          vDadosIni.IfThen(vPrest.dataSet.FieldByName('VALOR_C').AsFloat > 0, 'Valor: ' + FormatFloat('0.00', vPrest.dataSet.FieldByName('VALOR_C').AsFloat) + #13, '') +
          vDadosIni.IfThen(vPrest.dataSet.FieldByName('COD_CLIENTE').AsInteger > 0, 'Cod Cliente: ' + IntToStr(vPrest.dataSet.FieldByName('COD_CLIENTE').AsInteger) + #13, '') +
          vDadosIni.IfThen(trim(vPrest.dataSet.FieldByName('NOME_C').AsString) <> '', 'Nome Cliente: ' + trim(vPrest.dataSet.FieldByName('NOME_C').AsString) + #13, '') +
          vDadosIni.IfThen(trim(vPrest.dataSet.FieldByName('HISTORICO_C').AsString) <> '', 'Histórico: ' + trim(vPrest.dataSet.FieldByName('HISTORICO_C').AsString) + #13, '') + #13 +
          'Favor verificar antes de continuar.', '');

    	vPrest.dataSet.Next;
    end;
  finally
  	vPrest.dataSet.First;
    vPrest.dataSet.EnableControls;
  end;

	try
  	buscas.Close;
    buscas.sql.text := ' update fech_dia set inicia_import = ''S'' ' +
      ' where dia_fcd = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDiaFinanceiroFechado)) +
      ' and codigo_emp = ' + vDadosIni.codEmpresa;
    buscas.Prepare;
    buscas.ExecSQL;
    CommitaTransacao;

    vListaClBarrarDesbarrar := TStringList.Create;
    vListaClBarrarDesbarrar.Sorted := True;
    vListaClBarrarDesbarrar.Duplicates := dupIgnore;
    vListaClBarrarDesbarrar.Clear;

    try
      buscas2 := TIBQuery.Create(Application);
      buscas2.Database := buscas.Database;
      buscas2.Transaction := buscas.Transaction;

      Result := True;
      vdiadifcaixa := false;
      vdatacxlinicial := 0;

      fVenda := 'S';
      fHistPadraoUnificadas := '';
      if vDadosIni.vEmp.vFinanceiroUnificado then
        fHistPadraoUnificadas := ' EMP: ' + vDadosIni.StrZero(fCodigoUnificada, 3);

      if vDadosIni.vEmp.vItAuto = 'S' then
      begin
        if vDadosIni.vEmp.vModoFaturamento = 'S' then
        begin
          vFecDCxl._abreDiaCxl(fDataInicial, fDataFinal, fCodigoOperadorCxl, fCodigoUnificada);

          if not vFecDCxl._verificarCaixaAberto(fDataInicial, fDataFinal, fCodigoOperadorCxl, fCodigoUnificada) then
          begin
            Result := false;
            exit;
          end;

          if vFecDCxl.dataSet.IsEmpty then
            raiseExceptionCreate('Dia não encontrado no caixa da Loja', '');

          vDia := StrToDate(fDataInicial);

          while vDia <= StrToDate(fDataFinal) do
          begin
             vFecDCxl._abreDiaCxl(DateToStr(vDia), DateToStr(vDia), fCodigoOperadorCxl, fCodigoUnificada);

             if not vFecDCxl._verificarCaixaAberto(DateToStr(vDia), DateToStr(vDia), fCodigoOperadorCxl, fCodigoUnificada) then
             begin
               Result := false;
               exit;
             end;

             if vFecDCxl.dataSet.FieldByName('STATUS_CXL').IsNull then
               raiseExceptionCreate('Caixa da Loja ainda não fechado. Dia: ' + DateToStr(vDia), '');

             if (vDiaFinanceiroFechado + 1 <> vFecDCxl.dataSet.FieldByName('dia_f_cxl').AsDateTime) then
              if (not vdiadifcaixa) then
              begin
                vdiadifcaixa := true;
                vdatacxlinicial := vFecDCxl.dataSet.FieldByName('dia_f_cxl').AsDateTime;
              end;

             vDia := vDia + 1;
          end;

          if (vdiadifcaixa) then
          begin
            if not vDadosIni.PesqPros('IMPFIN034', 'PERMITIR', '', 'FORMPAGAMENTO', '', buscas, True) then
            begin
  //            raiseExceptionCreate('Dia do caixa auxiliar diferente do dia do financeiro', '');
              Application.MessageBox(pchar('Dia do caixa auxiliar diferente do dia do financeiro: ' + #13 + #13 +
                'Dia do caixa auxiliar: ' + FormatDateTime('dd/mm/yyyy', vdatacxlinicial) + #13 +//vFecDCxl.dataSet.FieldByName('dia_f_cxl').AsDateTime) + #13 +
                'Dia do financeiro: ' + FormatDateTime('dd/mm/yyyy', vDiaFinanceiroFechado + 1)), 'Atenção', MB_OK + MB_ICONWARNING);
               Result := false;
               exit;
            end;
          end;
        end;

      end;

      if vPrest.dataSet.IsEmpty then
        Application.MessageBox('Arquivo de prestações não possui informações', 'Atenção', 0 +
          64);

      if Application.MessageBox('Tem certeza que deseja continuar?', 'Confirmação',
        MB_ICONQUESTION + MB_YESNO) <> IDYES then
        exit;

      // PesqPros('HW1166', 'Dt Inicial: ' + maskedit1.text + ' Dt Final: ' + maskedit2.text + ' Op.: ' + maskedit8.text) then
  //    if not vDadosIni.PesqPros() then
  //      Exit;

      vPrest.vLoteCxl._abreLoteCxl(fDataInicial, fDataFinal, fCodigoOperadorCxl, fCodigoUnificada);

      if vPrest.vLoteCxl.dataSet.IsEmpty then
        raiseExceptionCreate('Lote CXL não encontrado no caixa da Loja', '');

      buscas.Close;
      buscas.SQL.Text := ' select max(fd.dia_fcd) dia_fcd from fech_Dia fd ' +
        ' where fd.codigo_emp = ' + vDadosIni.codEmpresa;
      buscas.Open;
      vDiaFinanceiroFechado := buscas.FieldByName('dia_fcd').AsDateTime;

      vContLig._AbrirContadeLigacao(True);

      vDataBaixa := _abreFormDataBaixa(vDiaFinanceiroFechado + 1);

      vValorJuros := 0;
      vValorDesconto := 0;
      vValorJurosCNT := 0;
      vValorDescontoCNT := 0;

      try
        // Aqui muda o dataset do objeto vPrest somente para fazer o processamento,
        // logo depois de terminar o dataset original é atribuido novamente
        vPrest.dataSet := TClientDataSet(dtmImportPDVFinan.cdsQuitarCreditos);

        try
          vPrest.vLoteCxl.dataSet.DisableControls;
          vPrest.vLoteCxl.dataSet.First;
          while not vPrest.vLoteCxl.dataSet.Eof do
          begin
            Application.ProcessMessages;

            vPrest._abrePrestacoes(vPrest.vLoteCxl.dataSet.FieldByName('N_LOTE_CXL').AsInteger, fCodigoUnificada);

            if not vPrest.dataSet.IsEmpty then
            begin
              buscas.Close;
              buscas.SQL.Text := 'SELECT GEN_ID(INC_L_QUIT,1) VALOR FROM RDB$DATABASE';
              buscas.Open;
              vLoteQuitN_LOTE_QUIT := buscas.FieldByName('VALOR').AsInteger;
              vLoteQuitDATA_L_QUIT := vDiaFinanceiroFechado + 1;

              vControleTemp := vPrest.dataSet.FieldByName('CODIGO_CTRL').AsInteger;

              vValorSomaPrestacoes := 0;
              vValorSomaPrestacoesContabil := 0;

              //obtendo o valor contabil dos creditos baixados para fazer o rateio

              buscas.Close;
              buscas.SQL.Text := 'select sum(vl_contabil) vl_contabil, sum(valor_c) valor_c' +
                ' from controle_creditos' +
                ' where lote_cxl = ' + IntToStr(vPrest.vLoteCxl.dataSet.FieldByName('N_LOTE_CXL').AsInteger) +
                ' and prcss is null and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = :cod_empresa' +
                ' and tp_rec_cxl = ''T''';
              if vDadosIni.vEmp.vFinanceiroUnificado then
                buscas.ParamByName('cod_empresa').AsInteger := fCodigoUnificada
              else
                buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);

              buscas.Open;
              vValorContabilSomaLote := buscas.FieldByName('vl_contabil').AsFloat;

              buscas.Close;
              buscas.SQL.Text := 'select sum(coalesce(valordoc,0)) valordoc' +
                ' from formpagamento' +
                ' where nrequisicao = ' + IntToStr(vPrest.vLoteCxl.dataSet.FieldByName('N_LOTE_CXL').AsInteger) +
                ' and tpdocs = ''PRE''' +
                ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);
              buscas.Open;

              vValorSomaFP := buscas.FieldByName('valordoc').AsFloat;

              if vDadosIni.vEmp.vUsarComissaoPorRecebimentoProporcional = 'S' then
              begin
                buscas.Close;
                buscas.SQL.Text := 'select sum(coalesce(vl_baixa_comissao,0) / coalesce(valor_original,0) * coalesce(valor_c,0)) vl_baixa_comissao,' +
                  ' sum(coalesce(vl_baixa_comissao_ger,0) / coalesce(valor_original,0) * coalesce(valor_c,0)) vl_baixa_comissao_ger' +
                  ' from controle_creditos' +
                  ' where lote_cxl = ' + IntToStr(vPrest.vLoteCxl.dataSet.FieldByName('N_LOTE_CXL').AsInteger) +
                  ' and prcss is null and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = :cod_empresa' +
                  ' and tp_rec_cxl = ''T''';
                if vDadosIni.vEmp.vFinanceiroUnificado then
                  buscas.ParamByName('cod_empresa').AsInteger := fCodigoUnificada
                else
                  buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);

                buscas.Open;

                vSomaComissao := buscas.FieldByName('vl_baixa_comissao').AsFloat;
                vSomaComissaoGer := buscas.FieldByName('vl_baixa_comissao_ger').AsFloat;

                if (vSomaComissao > 0) or (vSomaComissaoGer > 0) then
                begin
                  buscas.Close;
                  buscas.SQL.Text := 'select sum(coalesce(valordoc,0)) valordoc' +
                    ' from formpagamento' +
                    ' where nrequisicao = ' + IntToStr(vPrest.vLoteCxl.dataSet.FieldByName('N_LOTE_CXL').AsInteger) +
                    ' and tpdocs = ''PRE''' +
                    ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);
                  buscas.Open;

                  vValorSomaFP := buscas.FieldByName('valordoc').AsFloat;

                  buscas.Close;
                  buscas.SQL.Text := 'update formpagamento set' +
                    ' vl_baixa_comissao = (:valorTotCom / :valorTotFp * valordoc),' +
                    ' vl_baixa_comissao_ger = (:valorTotComGer / :valorTotFp * valordoc)' +
                    ' where nrequisicao = ' + IntToStr(vPrest.vLoteCxl.dataSet.FieldByName('N_LOTE_CXL').AsInteger) +
                    ' and tpdocs = ''PRE''' +
                    ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);
                  buscas.ParamByName('valorTotCom').AsFloat := vSomaComissao;
                  buscas.ParamByName('valorTotComGer').AsFloat := vSomaComissaoGer;
                  buscas.ParamByName('valorTotFp').AsFloat := vValorSomaFP;
                  buscas.ExecSQL;
                end;
              end;

              try
                vPrest.dataSet.DisableControls;
                vPrest.dataSet.First;
                while not vPrest.dataSet.Eof do
                begin
                  vCred._abreControleCreditos(
                    vPrest.dataSet.FieldByName('COD_CRED').AsInteger);

                  vCred.dataSet.Edit;
                  if vPrest.dataSet.FieldByName('TP_REC_CXL').AsString = 'T' then
                  begin

                    vCred.dataSet.FieldByName('STATUS_C').AsString := 'QUITADO';
                    vCred.dataSet.FieldByName('DATQ_C').AsDateTime := vDiaFinanceiroFechado + 1;
                    vCred.dataSet.FieldByName('US_BX').AsInteger := vDadosIni.vCodUsuario;
                    vCred.dataSet.FieldByName('DATA_BAIXA').AsDateTime := vDataBaixa;
                    vCred.dataSet.FieldByName('OBS_C').AsString := 'BAIXA CAIXA LOJA OPERADOR: ' +
                      vPrest.dataSet.FieldByName('OP_CXL').AsString;
                    vCred.dataSet.FieldByName('LOTE_QUIT').AsInteger := vLoteQuitN_LOTE_QUIT;
                    vCred.dataSet.FieldByName('PRCSS').AsString := 'S';
                    vValorSomaPrestacoes := vValorSomaPrestacoes +
                      vCred.dataSet.FieldByName('VALOR_C').AsCurrency;
                    vValorSomaPrestacoesContabil := vValorSomaPrestacoesContabil +
                      vCred.dataSet.FieldByName('VL_CONTABIL').AsCurrency;
                    vCred.vValor_Contabil_BX := vCred.dataSet.FieldByName('VL_CONTABIL').AsCurrency;

                    vCred.DATQ_C := vDiaFinanceiroFechado + 1;
                    vCred.LOTE_QUIT := vLoteQuitN_LOTE_QUIT;
                    vCred._registrarBaixaCredito(
                      vCred.dataSet.FieldByName('VL_RQ_PG_CXL').AsCurrency,
                      vCred.dataSet.FieldByName('VL_RQ_PG_CXL').AsCurrency,
                      'T',
                      vListaClBarrarDesbarrar);
                  end
                  else
                  begin
                    if vDadosIni.vEmp.vUsarComissaoPorRecebimentoProporcional = 'S' then
                    begin
                      if (vCred.dataSet.FieldByName('VALOR_C').AsCurrency >
                        vCred.dataSet.FieldByName('VL_RQ_PG_CXL').AsCurrency) then
                      begin
                        vSomaComissao := vCred.dataSet.FieldByName('VL_RQ_PG_CXL').AsCurrency;
                        vSomaComissaoGer := vCred.dataSet.FieldByName('VL_RQ_PG_CXL').AsCurrency;
                      end
                      else
                      begin
                        vSomaComissao := vCred.dataSet.FieldByName('VALOR_C').AsCurrency;
                        vSomaComissaoGer := vCred.dataSet.FieldByName('VALOR_C').AsCurrency;
                      end;

                      // aqui nao precisa mudar o select pois o codigo_emp vai continuar o mesmo da empresa que faz o processamento
                      buscas.Close;
                      buscas.SQL.Text := 'select sum(coalesce(vl_baixa_comissao,0) / coalesce(valor_original,0) ) vl_baixa_comissao,' +
                        ' sum(coalesce(vl_baixa_comissao_ger,0) / coalesce(valor_original,0) ) vl_baixa_comissao_ger' +
                        ' from controle_creditos' +
                        ' where lote_cxl = ' + IntToStr(vPrest.vLoteCxl.dataSet.FieldByName('N_LOTE_CXL').AsInteger) +
                        ' and prcss is null and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') + ' = :cod_empresa' +
                        ' and tp_rec_cxl = ''P''';
                      if vDadosIni.vEmp.vFinanceiroUnificado then
                        buscas.ParamByName('cod_empresa').AsInteger := fCodigoUnificada
                      else
                        buscas.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
                      buscas.Open;

                      vSomaComissao := vSomaComissao * buscas.FieldByName('vl_baixa_comissao').AsFloat;
                      vSomaComissaoGer := vSomaComissaoGer * buscas.FieldByName('vl_baixa_comissao_ger').AsFloat;

                      if (vSomaComissao > 0) or (vSomaComissaoGer > 0) then
                      begin
                        buscas.Close;
                        buscas.SQL.Text := 'select sum(coalesce(valordoc,0)) valordoc' +
                          ' from formpagamento' +
                          ' where nrequisicao = ' + IntToStr(vPrest.vLoteCxl.dataSet.FieldByName('N_LOTE_CXL').AsInteger) +
                          ' and tpdocs = ''PRE''' +
                          ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);
                        buscas.Open;

                        vValorSomaFP := buscas.FieldByName('valordoc').AsFloat;

                        buscas.Close;
                        buscas.SQL.Text := 'update formpagamento set' +
                          ' vl_baixa_comissao = (:valorTotCom / :valorTotFp * valordoc),' +
                          ' vl_baixa_comissao_ger = (:valorTotComGer / :valorTotFp * valordoc)' +
                          ' where nrequisicao = ' + IntToStr(vPrest.vLoteCxl.dataSet.FieldByName('N_LOTE_CXL').AsInteger) +
                          ' and tpdocs = ''PRE''' +
                          ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);
                        buscas.ParamByName('valorTotCom').AsFloat := vSomaComissao;
                        buscas.ParamByName('valorTotComGer').AsFloat := vSomaComissaoGer;
                        buscas.ParamByName('valorTotFp').AsFloat := vValorSomaFP;
                        buscas.ExecSQL;
                      end;
                    end;

                    vCred.vValor_C_Anterior_Parcial := vCred.dataSet.FieldByName('valor_c').AsFloat;
                    vCred.vValor_C_Anterior_Parcial_Zerado := vCred.dataSet.FieldByName('valor_c').AsFloat <= 0;

                    if vDadosIni.StrToFloatFormat(vCred.dataSet.FieldByName('VL_RQ_PG_CXL').AsCurrency,2) <=
                      vDadosIni.StrToFloatFormat(vCred.vValor_C_Anterior_Parcial,2) then
                      vCred.dataSet.FieldByName('valor_liquido').AsFloat := vDadosIni.StrToFloatFormat(
                        vCred.dataSet.FieldByName('valor_liquido').AsFloat -
                        vCred.dataSet.FieldByName('VL_RQ_PG_CXL').AsCurrency,2)
                    else
                      vCred.dataSet.FieldByName('valor_liquido').AsFloat := vDadosIni.StrToFloatFormat(
                        vCred.dataSet.FieldByName('valor_liquido').AsFloat -
                        vCred.vValor_C_Anterior_Parcial,2);

                    //na quitacao parcial caso o valor pago seja maior que o valor do credito (ex: prestacoes vencidas com valor corrigido: valor_c: 40, valor_corr: 65, valor pago: 50)
                    // entao o valor contabil baixado é igual ao valor contabil

                    //na quitacao parcial caso o valor pago seja menor que o valor do credito
                    // entao o valor contabil a ser baixado deve ser proporcional ao valor

                    if (vCred.dataSet.FieldByName('VALOR_C').AsCurrency -
                      vCred.dataSet.FieldByName('VL_RQ_PG_CXL').AsCurrency) < 0 then
                    begin
                      vCred.vValor_Contabil_BX := vCred.dataSet.FieldByName('VL_CONTABIL').AsCurrency;
                      vValorContabilSomaLote := vCred.vValor_Contabil_BX;

                      vValorSomaPrestacoes := vValorSomaPrestacoes +
                        vCred.dataSet.FieldByName('VALOR_C').AsCurrency;
                      vValorSomaPrestacoesContabil := vValorSomaPrestacoesContabil +
                        vCred.dataSet.FieldByName('VL_CONTABIL').AsCurrency;
                      vCred.dataSet.FieldByName('VALOR_C').AsCurrency := 0;
                      vCred.dataSet.FieldByName('VL_CONTABIL').AsCurrency := 0;
                    end
                    else
                    begin
                      if (vCred.dataSet.FieldByName('VL_CONTABIL').AsCurrency -
                        vCred.dataSet.FieldByName('VL_RQ_PG_CXL').AsCurrency) < 0 then
                        vCred.vValor_Contabil_BX := vCred.dataSet.FieldByName('VL_CONTABIL').AsCurrency
                      else
                        vCred.vValor_Contabil_BX := vCred.dataSet.FieldByName('VL_RQ_PG_CXL').AsCurrency;
                      vValorContabilSomaLote := vCred.vValor_Contabil_BX;

                      vCred.dataSet.FieldByName('VALOR_C').AsCurrency :=
                        vCred.dataSet.FieldByName('VALOR_C').AsCurrency -
                        vCred.dataSet.FieldByName('VL_RQ_PG_CXL').AsCurrency;
                      vValorSomaPrestacoes := vValorSomaPrestacoes +
                        vCred.dataSet.FieldByName('VL_RQ_PG_CXL').AsCurrency;
                      vValorSomaPrestacoesContabil := vValorSomaPrestacoesContabil +
                        vCred.vValor_Contabil_BX;
                      vCred.vValor_C_Anterior_Parcial := 0;
                      vCred.dataSet.FieldByName('VL_CONTABIL').AsCurrency := vCred.dataSet.FieldByName('VL_CONTABIL').AsCurrency - vCred.vValor_Contabil_BX;
                    end;

                    vCred.DATQ_C := vDiaFinanceiroFechado + 1;
                    vCred.LOTE_QUIT := vLoteQuitN_LOTE_QUIT;
                    vCred._registrarBaixaCredito(
                      vCred.dataSet.FieldByName('VL_RQ_PG_CXL').AsCurrency,
                      vCred.dataSet.FieldByName('VL_RQ_PG_CXL').AsCurrency,
                      'P',
                      vListaClBarrarDesbarrar);

                    if vPrest.dataSet.FieldByName('TP_REC_CXL').AsString = 'T' then
                      if vCred.dataSet.FieldByName('DATA_VENC_C').AsDateTime <
                        vCred.dataSet.FieldByName('DIA_CXL').AsDateTime then
                        vCred.dataSet.FieldByName('DATA_VENC_C').AsDateTime :=
                          vCred.dataSet.FieldByName('DIA_CXL').AsDateTime;
                    vCred.dataSet.FieldByName('DIA_CXL').AsString := '';
                    vCred.dataSet.FieldByName('STATUS_CXL_RQ').AsString := '';
                    vCred.dataSet.FieldByName('OP_CXL').Value := 0;
                    vCred.dataSet.FieldByName('LOTE_CXL').AsString := '';
                    vCred.dataSet.FieldByName('NSERIEECF').AsVariant := Null;
                    vCred.dataSet.FieldByName('COD_TERMINAL').AsVariant := Null;
                    vCred.dataSet.FieldByName('VL_RQ_PG_CXL').AsVariant := Null;
                    vCred.dataSet.FieldByName('COONAOFISCAL').AsVariant := Null;

                  end;
                  vnomecliente := '/' + copy(vCred.dataSet.FieldByName('N_DOC_C').AsString, 1, 10) + ' ' +
                    copy(vCred.dataSet.FieldByName('NOME_C').AsString, 1, 18);
                  vCred.dataSet.Post;
                  if not vCred.Apply then
                  begin
                    Result := False;
                    Exit;
                  end;
      //            vCred.dataSet.ApplyUpdates(-1);

                  vValorDesconto := vValorDesconto + vCred.dataSet.FieldByName('VALOR_DESC').AsCurrency;
                  vValorJuros := vValorJuros + vCred.dataSet.FieldByName('JUROS_COB').AsCurrency;
                  if (vCred.dataSet.FieldByName('VALOR_DESC').AsFloat > 0) and
                    (vCred.dataSet.FieldByName('VALOR_C').AsFloat > 0) and
                    (vCred.dataSet.FieldByName('VL_CONTABIL').AsFloat > 0) then
                    vValorDescontoCNT := vValorDescontoCNT +
                      (vCred.dataSet.FieldByName('VALOR_DESC').AsFloat /
                      vCred.dataSet.FieldByName('VALOR_C').AsFloat) *
                      vCred.dataSet.FieldByName('VL_CONTABIL').AsFloat;
                  if (vCred.dataSet.FieldByName('JUROS_COB').AsFloat > 0) and
                    (vCred.dataSet.FieldByName('VALOR_C').AsFloat > 0) and
                    (vCred.dataSet.FieldByName('VL_CONTABIL').AsFloat > 0) then
                    vValorJurosCNT := vValorJurosCNT +
                      (vCred.dataSet.FieldByName('JUROS_COB').AsFloat /
                      vCred.dataSet.FieldByName('VALOR_C').AsFloat) *
                      vCred.dataSet.FieldByName('VL_CONTABIL').AsFloat;

                  vPrest.dataSet.Next;

                  if (vControleTemp <> vPrest.dataSet.FieldByName('CODIGO_CTRL').AsInteger)
                    or (vPrest.dataSet.Eof) then
                  begin

                    if vValorSomaPrestacoes <> 0 then
                    begin
                      vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_S_CRD').AsFloat;

                      //                vContLig.vPCont.dataSet.Locate('N_CONTA_PLC', vlanc.N_CONTA_PLC, []);
                      if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
                        raiseExceptionCreate('Corrija o cadastro para continuar', '');

                      vlanc.TIPO_L := Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
                      vlanc.CODIGO_CTRL := vControleTemp;
                      vlanc.DATA := vDiaFinanceiroFechado + 1;
                      vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
                      vlanc.HISTORICO_L := 'BX LOTE: ' + vDadosIni.StrZero(vLoteQuitN_LOTE_QUIT, 6) +
                        ' CRED CXL OP.: ' + vDadosIni.StrZero(fCodigoOperadorCxl, 3) + fHistPadraoUnificadas + ' ' + vnomecliente;
                      vlanc.VALOR_L := vValorSomaPrestacoes;
                      vlanc.TP_MOD := 'S';
                      if vDadosIni.vEmp.vFinanceiroUnificado then
                        vlanc.COD_EMP_MULT := fCodigoUnificada;

                      vlanc.VL_CONTABIL := vValorSomaPrestacoesContabil;
                      vlanc.TIP_CNT := vDadosIni.retornoPorCondicao(vlanc.VL_CONTABIL > 0, 'C', 'N');
                      if vlanc.TIPO_L = 'S' then
                        vlanc.LOTE_QUIT := vLoteQuitN_LOTE_QUIT;

                      vlanc._efetuarLancamento;
                    end;

                    vControleTemp := vPrest.dataSet.FieldByName('CODIGO_CTRL').AsInteger;
                  end;
                end;
              finally
              	vPrest.dataSet.First;
                vPrest.dataSet.EnableControls;
              end;

              try
                vFp.dataSet := TClientDataSet(dtmImportPDVFinan.cdsFPG2);

                vFp._abreFormPagAnalitico(vPrest.vLoteCxl.dataSet.FieldByName('N_LOTE_CXL').AsInteger, fCodigoUnificada);

                //nao da pra fazer o agrupamento pois o lotecxl muda
                // fazer dois select, um somente para N
                // e o outros S1 e S2 pode agrupar, apenas para lançar
                // Um select com o somatorio e outro com os registros individuais

                vlanc._clearFlancamentos;

                try
                  vFp.dataSet.DisableControls;
                  vFp.dataSet.First;
                  while not vFp.dataSet.Eof do
                  begin
                    vCtrl._abrirControles(vFp.dataSet.FieldByName('cod_controle').AsInteger);
                    if Trim(vCtrl.dataSet.FieldByName('NAO_GERA_FINAN').AsString) = 'S' then
                    else
                    if Trim(vCtrl.dataSet.FieldByName('docs').AsString) = 'S1' then
                    begin
                      vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat;

                      //                vContLig.vPCont.dataSet.Locate('N_CONTA_PLC', vlanc.N_CONTA_PLC, []);
                      if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
                        raiseExceptionCreate('Corrija o cadastro para continuar', '');

                      vlanc.CODIGO_CTRL := vFp.dataSet.FieldByName('cod_controle').AsInteger;
                      vlanc.DATA := vDiaFinanceiroFechado + 1;
                      vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
                      vlanc.HISTORICO_L :=
                        Trim(copy('RECEBIMENTO CHEQUES PRESTAÇÕES OPERADOR  ' +
                        IntToStr(fCodigoOperadorCxl), 1, 60)) + fHistPadraoUnificadas;
                      vlanc.TP_MOD := 'S';
                      vlanc.TIPO_L := Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
                      vlanc.NOME_CTRL := vFp.dataSet.FieldByName('NOME_CTRL').AsString;
                      vlanc.VALOR_L := vFp.dataSet.FieldByName('soma').AsFloat;
                      if vDadosIni.vEmp.vFinanceiroUnificado then
                        vlanc.COD_EMP_MULT := fCodigoUnificada;

                      vlanc.VL_CONTABIL := vValorContabilSomaLote / vValorSomaFP * vlanc.VALOR_L;
                      vlanc.TIP_CNT := vDadosIni.retornoPorCondicao(vlanc.VL_CONTABIL > 0, 'C', 'N');

                      vlanc._efetuarLancamento;

                      vlanc._addFLancamentos(vlanc.COD_LANC,
                        vFp.dataSet.FieldByName('cod_controle').AsInteger, 'CH');
                    end
                    else if Trim(vCtrl.dataSet.FieldByName('docs').AsString) = 'S2' then
                    begin
                      vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat;

                      //                vContLig.vPCont.dataSet.Locate('N_CONTA_PLC', vlanc.N_CONTA_PLC, []);
                      if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
                        raiseExceptionCreate('Corrija o cadastro para continuar', '');

                      vlanc.CODIGO_CTRL := vFp.dataSet.FieldByName('cod_controle').AsInteger;
                      vlanc.DATA := vDiaFinanceiroFechado + 1;
                      vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
                      vlanc.HISTORICO_L := Trim(copy(Trim(vFp.dataSet.FieldByName('NOME_CTRL').AsString) +
                        ' RECEBIMENTO CREDITOS PRESTAÇÕES OPERADOR ' + IntToStr(fCodigoOperadorCxl), 1,
                        60)) + fHistPadraoUnificadas;
                      vlanc.TP_MOD := 'S';
                      vlanc.TIPO_L := Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
                      vlanc.NOME_CTRL := vFp.dataSet.FieldByName('NOME_CTRL').AsString;
                      vlanc.VALOR_L := vFp.dataSet.FieldByName('SOMA').AsFloat;
                      if vDadosIni.vEmp.vFinanceiroUnificado then
                        vlanc.COD_EMP_MULT := fCodigoUnificada;

                      vlanc.VL_CONTABIL := vValorContabilSomaLote / vValorSomaFP * vlanc.VALOR_L;
                      vlanc.TIP_CNT := vDadosIni.retornoPorCondicao(vlanc.VL_CONTABIL > 0, 'C', 'N');

                      vlanc._efetuarLancamento;

                      vlanc._addFLancamentos(vlanc.COD_LANC,
                        vFp.dataSet.FieldByName('cod_controle').AsInteger, 'C');
                    end;

                    vFp.dataSet.Next;
                  end;
                finally
                  vFp.dataSet.First;
                  vFp.dataSet.EnableControls;
                end;

                vFp._abreFormPag(vPrest.vLoteCxl.dataSet.FieldByName('N_LOTE_CXL').AsInteger, fCodigoUnificada);

                try
                  vFp.dataSet.DisableControls;
                  vFp.dataSet.First;
                  while not vFp.dataSet.Eof do
                  begin
                    vNumProcessamento := 0;
                    vNaoGerarFinanceiro := False;
                    vCtrl._abrirControles(vFp.dataSet.FieldByName('cod_controle').AsInteger);
                    if Trim(vCtrl.dataSet.FieldByName('NAO_GERA_FINAN').AsString) = 'S' then
                      vNaoGerarFinanceiro := True
                    else
                    if Trim(vFp.dataSet.FieldByName('TIPDOC').AsString) = 'N' then
                    begin
                      vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat;

                      //                vContLig.vPCont.dataSet.Locate('N_CONTA_PLC', vlanc.N_CONTA_PLC, []);
                      if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
                        raiseExceptionCreate('Corrija o cadastro para continuar', '');

                      vlanc.HISTORICO_L :=
                        'ENTRADA DINHEIRO PRESTACOES OPERADOR ' + IntToStr(fCodigoOperadorCxl) + fHistPadraoUnificadas;
                      vlanc.VALOR_L := vFp.dataSet.FieldByName('VALORDOC').AsCurrency;
                      vlanc.CODIGO_CTRL := vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger;
                      vlanc.TIPO_L := Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
                      vlanc.DATA := vDiaFinanceiroFechado + 1;
                      vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
                      vlanc.NDOC_L := vFp.dataSet.FieldByName('NDOC').AsString;
                      vlanc.TIP_CNT := vFp.dataSet.FieldByName('TIP_CNT').AsString;
                      vlanc.LOTE_ENT := vLoteQuitN_LOTE_QUIT;
                      vlanc.TP_MOD := 'S';
                      if vDadosIni.vEmp.vFinanceiroUnificado then
                        vlanc.COD_EMP_MULT := fCodigoUnificada;

                      if (vValorContabilSomaLote > 0) and (vValorSomaFP > 0) then
                        vlanc.VL_CONTABIL := vValorContabilSomaLote / vValorSomaFP * vlanc.VALOR_L;
                      vlanc.TIP_CNT := vDadosIni.retornoPorCondicao(vlanc.VL_CONTABIL > 0, 'C', 'N');

                      vlanc._efetuarLancamento;

                    end
                    else if Trim(vFp.dataSet.FieldByName('TIPDOC').AsString) = 'S1' then
                    begin
                      if vFp.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
                        vCh.N_CONTA_PLC := vFp.dataSet.FieldByName('N_CONTA_PLC').AsFloat
                      else
                        vCh.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat;

                      //                vContLig.vPCont.dataSet.Locate('N_CONTA_PLC', vCh.N_CONTA_PLC,[]);
                      if not vContLig.vPCont._abrirPContas(vCh.N_CONTA_PLC) then
                        raiseExceptionCreate('Corrija o cadastro para continuar', '');

                      vCh.CODIGO_CTRL := vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger;
                      vCh.COD_CLIENTE := vFp.dataSet.FieldByName('COD_CLIENTE').AsInteger;
                      vCh.NOME_CH := vFp.dataSet.FieldByName('CLIENTE').AsString;
                      buscas.Close;
                      buscas.SQL.Text := 'select c.razao, c.cpfcgc from clientes c ' +
                        ' where c.cod_cliente = ' +
                        inttostr(vFp.dataSet.FieldByName('COD_CLIENTE').AsInteger) +
                        ' and c.cod_empresa = ' + vDadosIni.codEmpresa +
                        ' and c.ativo = 1';
                      buscas.Open;

                      vCh.RAZAO := buscas.FieldByName('RAZAO').AsString;
                      vCh.CPFCGC := buscas.FieldByName('CPFCGC').AsString;

                      vCh.DATA_REC := vDiaFinanceiroFechado + 1;
                      vCh.DTORIGINAL_CH := vDiaFinanceiroFechado + 1;
                      vCh.HISTORICO_CH := 'RECEBIMENTO CONF. ' +
                        vFp.dataSet.FieldByName('TPDOCS').AsString + ' ' +
                        vDadosIni.StrZero(vFp.dataSet.FieldByName('NREQUISICAO').AsString, 6);
                      vCh.DATA_VENC := vFp.dataSet.FieldByName('DATA_VENC').AsDateTime;
                      vCh.VALOR_CH := vFp.dataSet.FieldByName('VALORDOC').AsCurrency;
                      vCh.TP_DOC_V := 'PRE';
                      vCh.N_DOC_V := vFp.dataSet.FieldByName('NREQUISICAO').AsInteger;
                      vCh.N_CH := vFp.dataSet.FieldByName('NDOC').AsString;
                      vCh.AGENCIA := vFp.dataSet.FieldByName('AGENCIA').AsString;
                      vCh.CONTA := vFp.dataSet.FieldByName('CONTA').AsString;
                      vCh.BANCO := vFp.dataSet.FieldByName('BANCO').AsString;
                      vCh.ID_BANCO := vFp.dataSet.FieldByName('COD_BANCO_STR').AsString;
                      vCh.COD_CLI_TERC := vFp.dataSet.FieldByName('COD_CLI_TERC').AsInteger;
                      vCh.NOME_TERC := vFp.dataSet.FieldByName('TERCEIROS').AsString;
                      vCh.CODIGO_VEND := vFp.dataSet.FieldByName('OPERADOR').AsInteger;
                      vCh.TIP_CNT := vFp.dataSet.FieldByName('TIP_CNT').AsString;
                      vCh.DATA_VENDA := vFp.dataSet.FieldByName('DATA_MOV').AsDateTime;
                      vCh.LOTE_ENT := vLoteQuitN_LOTE_QUIT;
                      vCh.VL_BAIXA_COMISSAO := vFp.dataSet.FieldByName('VL_BAIXA_COMISSAO').AsCurrency;
                      vCh.VL_BAIXA_COMISSAO_GER := vFp.dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').AsCurrency;
                      vCh.US_CAD := vFp.dataSet.FieldByName('US_CAD').AsInteger;
                      if vDadosIni.vEmp.vFinanceiroUnificado then
                        vCh.COD_EMP_MULT := fCodigoUnificada;

                      fSomaCheque := fSomaCheque + vCh.VALOR_CH;

                      if (vValorContabilSomaLote > 0) and (vValorSomaFP > 0) then
                        vCh.VL_CONTABIL := vValorContabilSomaLote / vValorSomaFP * vCh.VALOR_CH;
                      vCh.TIP_CNT := vDadosIni.retornoPorCondicao(vCh.VL_CONTABIL > 0, 'C', 'N');

                      vCh._efetuarLancamento(vListaClBarrarDesbarrar);

                      buscas.Close;
                      buscas.SQL.Text := 'INSERT INTO LANCCHEQUE (COD_LANC, CODIGO_CH, CODIGO_EMP)' +
                        ' VALUES (:COD_LANC, :CODIGO_CH, :CODIGO_EMP)';
                      buscas.ParamByName('COD_LANC').AsInteger :=
                        vlanc._getCodigoLancamento(vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger);
                      buscas.ParamByName('CODIGO_CH').AsInteger := vCh.CODIGO_CH;
                      buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
                      buscas.ExecSQL;

                      vNumProcessamento := vCh.CODIGO_CH;

                    end
                    else if Trim(vFp.dataSet.FieldByName('TIPDOC').AsString) = 'S2' then
                    begin
                      if vFp.dataSet.FieldByName('N_CONTA_PLC').AsFloat > 0 then
                        vCred.N_CONTA_PLC := vFp.dataSet.FieldByName('N_CONTA_PLC').AsFloat
                      else
                        vCred.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat;

                      //                vContLig.vPCont.dataSet.Locate('N_CONTA_PLC', vCred.N_CONTA_PLC,[]);
                      if not vContLig.vPCont._abrirPContas(vCred.N_CONTA_PLC) then
                        raiseExceptionCreate('Corrija o cadastro para continuar', '');

                      vCred.CODIGO_CTRL := vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger;
                      vCred.COD_CLIENTE := vFp.dataSet.FieldByName('COD_CLIENTE').AsInteger;
                      vCred.COD_COBREBEM := vFp.dataSet.FieldByName('COD_COBREBEM').AsInteger;
                      vCred.NOSSO_NUMERO_BANCO := vFp.dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString;
                      vCred.NOME_C := vFp.dataSet.FieldByName('CLIENTE').AsString;
                      buscas.Close;
                      buscas.SQL.Text := 'select c.razao, c.cpfcgc from clientes c ' +
                        ' where c.cod_cliente = ' +
                        inttostr(vFp.dataSet.FieldByName('COD_CLIENTE').AsInteger) +
                        ' and c.cod_empresa = ' + vDadosIni.codEmpresa +
                        ' and c.ativo = 1';
                      buscas.Open;

                      vCred.RAZAO := buscas.FieldByName('RAZAO').AsString;
                      vCred.CPFCGC := buscas.FieldByName('CPFCGC').AsString;

                      vCred.DATA_REC_C := vDiaFinanceiroFechado + 1;
                      vCred.DTORIGINAL_C := vDiaFinanceiroFechado + 1;

                      vCtrl._abrirControles(vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger);
                      vCred.TIPO_DOC_C := vCtrl.dataSet.FieldByName('NOME_CTRL').AsString;

                      vCred.HISTORICO_C := 'RECEBIMENTO CREDITOS CONF. ' +
                        vFp.dataSet.FieldByName('TPDOCS').AsString + ' ' +
                        vDadosIni.StrZero(vFp.dataSet.FieldByName('NREQUISICAO').AsString, 6);
                      vCred.DATA_VENC_C := vFp.dataSet.FieldByName('DATA_VENC').AsDateTime;
                      vCred.VALOR_C := vFp.dataSet.FieldByName('VALORDOC').AsCurrency;

                      vDadosIni.CalcularTaxaCartao(buscas2,
                       vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado, fCodigoUnificada, 0),
                       vFp.dataSet.FieldByName('NREQUISICAO').AsInteger,
                       vFp.dataSet.FieldByName('TPDOCS').AsString,
                       vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger,
                       vCtrl.dataSet.FieldByName('TP_PLANO').AsString,
                       vFp.dataSet.FieldByName('COD_TERMINAL_ADM').AsString,
                       vFp.dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger,
                       vFp.dataSet.FieldByName('DEB_CRED').AsString,
                       vFp.dataSet.FieldByName('QTDE_PARC').AsInteger,
                       vDadosIni.IfThen(vFp.dataSet.FieldByName('VALORDOC_LIQ').AsFloat > 0,
                         vFp.dataSet.FieldByName('VALORDOC_LIQ').AsFloat,
                         vFp.dataSet.FieldByName('VALORDOC').AsFloat),
                       vFp.dataSet.FieldByName('VALORDOC').AsFloat,
                       vCtrl.dataSet.FieldByName('TAXA_CARTAO').AsFloat,
                       false,
                       vNovoValorLiquido);
                      vCred.VALOR_LIQUIDO := vNovoValorLiquido;

                      vCred.TP_DOC_V := 'PRE';

                      vCred.N_DOC_V := vFp.dataSet.FieldByName('NREQUISICAO').AsInteger;
                      vCred.N_DOC_C := vFp.dataSet.FieldByName('NDOC').AsString;
                      vCred.CODIGO_VEND := vFp.dataSet.FieldByName('OPERADOR').AsInteger;
                      vCred.CODIGO_FUNC := vFp.dataSet.FieldByName('CODIGO_FUNC').AsInteger;
                      vCred.TIP_CNT := vFp.dataSet.FieldByName('TIP_CNT').AsString;
                      vCred.DATA_VENDA := vFp.dataSet.FieldByName('DATA_MOV').AsDateTime;
                      vCred.N_AUT_CART := vFp.dataSet.FieldByName('N_AUT_CART').AsString;
                      vCred.N_DOCNSU_ADM := vFp.dataSet.FieldByName('N_DOCNSU_ADM').AsString;
                      vCred.NPARCELA := vFp.dataSet.FieldByName('NPARCELA').AsInteger;
                      vCred.QTDE_PARC := vFp.dataSet.FieldByName('QTDE_PARC').AsInteger;
                      vCred.COD_TERMINAL_ADM := vFp.dataSet.FieldByName('COD_TERMINAL_ADM').AsString;
                      vCred.DESC_TERMINAL_ADM := vFp.dataSet.FieldByName('DESC_TERMINAL_ADM').AsString;
                      vCred.DEB_CRED := vFp.dataSet.FieldByName('DEB_CRED').AsString;
                      vCred.COD_BANDEIRA_ADM := vFp.dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger;
                      vCred.DESC_BANDEIRA := vFp.dataSet.FieldByName('DESC_BANDEIRA').AsString;
                      if Trim(vCred.COD_TERMINAL_ADM) <> '' then
                      begin
                        buscas.Close;
                        buscas.SQL.Text := ' select tc.cod_adm, ac.descricao_adm from terminal_cartao tc ' +
                          ' left join adm_cartao ac on ac.cod_adm = tc.cod_adm and ac.cod_empresa = tc.cod_empresa ' +
                          ' where tc.cod_term_adm = ' + QuotedStr(Trim(vCred.COD_TERMINAL_ADM)) +
                          ' and tc.cod_empresa = ' + vDadosIni.codEmpresa;
                        buscas.Open;
                        vCred.COD_ADM := buscas.FieldByName('COD_ADM').AsInteger;
                        vCred.DESC_ADM := trim(buscas.FieldByName('DESCRICAO_ADM').AsString);
                      end;
                      vCred.COD_CLI_TERC := vFp.dataSet.FieldByName('COD_CLI_TERC').AsInteger;
                      vCred.NOME_TERC := vFp.dataSet.FieldByName('TERCEIROS').AsString;
                      vCred.LOTE_ENT := vLoteQuitN_LOTE_QUIT;
                      vCred.VL_BAIXA_COMISSAO := vFp.dataSet.FieldByName('VL_BAIXA_COMISSAO').AsCurrency;
                      vCred.VL_BAIXA_COMISSAO_GER := vFp.dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').AsCurrency;
                      vCred.US_CAD := vFp.dataSet.FieldByName('US_CAD').AsInteger;
                      if vDadosIni.vEmp.vFinanceiroUnificado then
                        vCred.COD_EMP_MULT := fCodigoUnificada;

                      fSomaCreditos := fSomaCreditos + vCred.VALOR_C;

                      if (vValorContabilSomaLote > 0) and (vValorSomaFP > 0) then
                        vCred.VL_CONTABIL := vValorContabilSomaLote / vValorSomaFP * vCred.VALOR_C;
                      vCred.TIP_CNT := vDadosIni.retornoPorCondicao(vCred.VL_CONTABIL > 0, 'C', 'N');

                      vCred._efetuarLancamento(vListaClBarrarDesbarrar);

                      buscas.Close;
                      buscas.SQL.Text := 'INSERT INTO CREDITOS_LANC ( COD_LANC, COD_CRED, CODIGO_EMP)' +
                        ' VALUES ( :COD_LANC, :COD_CRED, :CODIGO_EMP)';
                      buscas.ParamByName('COD_LANC').AsInteger :=
                        vlanc._getCodigoLancamento(vFp.dataSet.FieldByName('COD_CONTROLE').AsInteger);
                      buscas.ParamByName('COD_CRED').AsInteger := vCred.COD_CRED;
                      buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
                      buscas.ExecSQL;

                      vNumProcessamento := vCred.COD_CRED;

                    end;

                    buscas.Close;
                    buscas.SQL.Text := 'UPDATE FORMPAGAMENTO SET PRCSS = ''S'' ';

                    if vNumProcessamento > 0 then
                      buscas.SQL.Text := buscas.SQL.Text + ',N_PROCESSAMENTO = :N_PROCESSAMENTO ';

                    if vNaoGerarFinanceiro then
                      buscas.SQL.Text := buscas.SQL.Text + ',NAO_GERA_FINAN = ''S''';

                    buscas.SQL.Text := buscas.SQL.Text +
                      ' WHERE SEQFORM = :SEQFORM AND COD_EMPRESA = :COD_EMPRESA';
                    if vNumProcessamento > 0 then
                      buscas.ParamByName('N_PROCESSAMENTO').AsInteger := vNumProcessamento;
                    buscas.ParamByName('SEQFORM').AsInteger :=
                      vFp.dataSet.FieldByName('SEQFORM').AsInteger;
                    buscas.ParamByName('COD_EMPRESA').AsInteger :=
                      vFp.dataSet.FieldByName('COD_EMPRESA').AsInteger;
                    buscas.ExecSQL;

                    vFp.dataSet.Next;
                    Application.ProcessMessages;
                  end;
                finally
                  vFp.dataSet.First;
                  vFp.dataSet.EnableControls;
                end;

              finally
                vFp.dataSet := TClientDataSet(dtmImportPDVFinan.cdsFPG);
              end;
            end;

            vPrest.vLoteCxl.dataSet.Next;
          end;
        finally
        	vPrest.vLoteCxl.dataSet.First;
          vPrest.vLoteCxl.dataSet.EnableControls;
        end;

        if vValorDesconto > 0 then
        begin

          if Application.MessageBox(
            'Houve Descontos nas prestações deseja lançá-los para mensurar os valores?',
            'Atenção', MB_ICONQUESTION + MB_YESNO) = IDYES then
          begin
            vlanc.N_CONTA_PLC := vDadosIni.IfThen(vContLig.dataSet.FieldByName('NCON_ED_PREST').AsFloat > 0,
             vContLig.dataSet.FieldByName('NCON_ED_PREST').AsFloat, vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat);

            //          vContLig.vPCont.dataSet.Locate('N_CONTA_PLC', vlanc.N_CONTA_PLC, []);
            if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
              raiseExceptionCreate('Corrija o cadastro para continuar', '');

            vlanc.HISTORICO_L := 'ENTRADA DN P/CONCESSÃO DESCONTO OPERADOR ' +
              IntToStr(fCodigoOperadorCxl) + fHistPadraoUnificadas;
            vlanc.VALOR_L := vValorDesconto;
            vlanc.CODIGO_CTRL := vContLig.dataSet.FieldByName('CONTR_V_PROD').AsInteger;
            vlanc.TIPO_L := vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString;
            vlanc.DATA := vDiaFinanceiroFechado + 1;
            vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
            vlanc.TIP_CNT := 'N';
            vlanc.TP_MOD := 'S';
            if vDadosIni.vEmp.vFinanceiroUnificado then
              vlanc.COD_EMP_MULT := fCodigoUnificada;

            vlanc._efetuarLancamento;

            vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_D_PREST').AsFloat;

            //          vContLig.vPCont.dataSet.Locate('N_CONTA_PLC', vlanc.N_CONTA_PLC, []);
            if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
              raiseExceptionCreate('Corrija o cadastro para continuar', '');

            vlanc.HISTORICO_L := 'DESCONTOS CONCEDIDOS OPERADOR ' + IntToStr(fCodigoOperadorCxl) + fHistPadraoUnificadas;
            vlanc.VALOR_L := vValorDesconto;
            vlanc.CODIGO_CTRL := vContLig.dataSet.FieldByName('CONTR_V_PROD').AsInteger;
            vlanc.TIPO_L := vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString;
            vlanc.DATA := vDiaFinanceiroFechado + 1;
            vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
            vlanc.VL_CONTABIL := vDadosIni.StrToFloatFormat(vValorDescontoCNT, 2);
            vlanc.TIP_CNT := vDadosIni.retornoPorCondicao(vlanc.VL_CONTABIL > 0, 'C', 'N');
            vlanc.TP_MOD := 'S';
            if vDadosIni.vEmp.vFinanceiroUnificado then
              vlanc.COD_EMP_MULT := fCodigoUnificada;

            vlanc._efetuarLancamento;

          end;

        end;

        if vValorJuros > 0 then
        begin
          if Application.MessageBox(
            'Houve cobrança de Juros nas prestações deseja lançá-las para mensurar os valores?',
            'Atenção', MB_ICONQUESTION + MB_YESNO) = IDYES then
          begin
            vlanc.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_J_PREST').AsFloat;

            //          vContLig.vPCont.dataSet.Locate('N_CONTA_PLC', vlanc.N_CONTA_PLC, []);
            if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
              raiseExceptionCreate('Corrija o cadastro para continuar', '');

            vlanc.HISTORICO_L := 'ENTRADA DN COBRANCA DE JUROS OPERADOR ' +
              IntToStr(fCodigoOperadorCxl) + fHistPadraoUnificadas;
            vlanc.VALOR_L := vValorJuros;
            vlanc.CODIGO_CTRL := vContLig.dataSet.FieldByName('CONTR_V_PROD').AsInteger;
            vlanc.TIPO_L := vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString;
            vlanc.DATA := vDiaFinanceiroFechado + 1;
            vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
            vlanc.VL_CONTABIL := vDadosIni.StrToFloatFormat(vValorJurosCNT,2);
            vlanc.TIP_CNT := vDadosIni.retornoPorCondicao(vlanc.VL_CONTABIL > 0, 'C', 'N');
            vlanc.TP_MOD := 'S';
            if vDadosIni.vEmp.vFinanceiroUnificado then
              vlanc.COD_EMP_MULT := fCodigoUnificada;

            vlanc._efetuarLancamento;

            vlanc.N_CONTA_PLC :=
              vDadosIni.IfThen(vContLig.dataSet.FieldByName('NCON_SJ_PREST').AsFloat > 0,
               vContLig.dataSet.FieldByName('NCON_SJ_PREST').AsFloat, vContLig.dataSet.FieldByName('NCON_S_CRD').AsFloat);

            //          vContLig.vPCont.dataSet.Locate('N_CONTA_PLC', vlanc.N_CONTA_PLC, []);
            if not vContLig.vPCont._abrirPContas(vlanc.N_CONTA_PLC) then
              raiseExceptionCreate('Corrija o cadastro para continuar', '');

            vlanc.HISTORICO_L := 'JUROS COBRADOS NAS PRESTAÇOES OPERADOR ' +
              IntToStr(fCodigoOperadorCxl) + fHistPadraoUnificadas;
            vlanc.VALOR_L := vValorJuros;
            vlanc.CODIGO_CTRL := vContLig.dataSet.FieldByName('CONTR_V_PROD').AsInteger;
            vlanc.TIPO_L := vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString;
            vlanc.DATA := vDiaFinanceiroFechado + 1;
            vlanc.DTREFERENCIA := vDiaFinanceiroFechado + 1;
            vlanc.TIP_CNT := 'N';
            vlanc.TP_MOD := 'S';
            if vDadosIni.vEmp.vFinanceiroUnificado then
              vlanc.COD_EMP_MULT := fCodigoUnificada;

            vlanc._efetuarLancamento;

          end;

        end;

      finally
        vPrest.dataSet := TClientDataSet(dtmImportPDVFinan.cdsPrest);
      end;


      if (vDadosIni.vEmp.vUsarBarramento = 'S') then
      begin
        try
          if vDadosIni.vEmp.vFinanceiroUnificado then
            vCampoEmpresa := 'cod_emp_mult'
          else
            vCampoEmpresa := 'codigo_emp';

          vDadosIni.abreStatusProcessamento('Desnegativação','Verificando...');

          FBuscas2.Close;
          FBuscas2.SQL.Text := 'select distinct(cod_cliente) cod_cliente from controle_cheque cc' +
            ' inner join controles c on cc.codigo_ctrl = c.codigo_ctrl and cc.codigo_emp = c.codigo_emp' + // aqui nao precisa mudar o select pois os controles serao os mesmos para todas as empresas
            ' and c.barrar_automatico = ''S''' +
            ' where cc.' + vCampoEmpresa + '  = :cod_empresa' +
            ' and cc.datq_ch = :datq_c' +
            ' and cc.status_ch = ''QUITADO''' +
            ' union' +
            ' select distinct(cod_cliente) cod_cliente from controle_creditos cc' +
            ' inner join controles c on cc.codigo_ctrl = c.codigo_ctrl and cc.codigo_emp = c.codigo_emp' +
            ' and c.barrar_automatico = ''S''' +
            ' where cc.' + vCampoEmpresa + ' = :cod_empresa' +
            ' and cc.datq_c = :datq_c' +
            ' and cc.status_c = ''QUITADO''';
          FBuscas2.ParamByName('datq_c').AsDate := vDadosIni.diaFFinanceiro + 1;
          FBuscas2.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, fCodigoUnificada, StrToInt(vDadosIni.codEmpresa));
          FBuscas2.Open;

          while not FBuscas2.Eof do
          begin
            vNegCliente := TNegativacaoCliente.create(buscas.Transaction, 'PRE');
            vNegCliente.dados.acao := naDesnegativa;
            vNegCliente.dados.alterarConta := True;
            vNegCliente.dados.alterarContaStatus := nacsAmbos; // contas quitadas pois os creditos ja foram quitados neste momento
            vNegCliente.dados.codConta := 0; // 0 pois o importante aqui é o cliente
            vNegCliente.dados.loteQuit := 0; // 0 pois o importante aqui é o cliente
            vNegCliente.dados.codCliente := FBuscas2.FieldByName('cod_cliente').AsInteger; // cliente do credito
            if vDadosIni.vEmp.vFinanceiroUnificado then
              vNegCliente.dados.codigoUnificada := fCodigoUnificada;
            if not vNegCliente.executar then
              raiseExceptionCreate(vNegCliente.MsgErro, '');
            FBuscas2.Next;
          end;
        finally
          vDadosIni.fechaStatusProcessamento;
        end;
      end;

      vlanc._verificarDesbarramentoCliente(fCodigoUnificada);

      CommitaTransacao;

      vDadosIni.GravaAuditoria('IMPFIN019', 'PROCESSAR', 'PROCESSAMENTO CONCLUÍDO', 'FORMPAGAMENTO',
        '', buscas);

      Result := True;

    except
      on e: exception do
      begin
        Result := False;
        RollBackTransacao;

        vDadosIni.GravaAuditoria('IMPFIN019', 'PROCESSAR', 'FALHA NO PROCESSAMENTO', 'FORMPAGAMENTO',
          '', buscas);

        if Trim(vFp.dataSet.FieldByName('TIPDOC').AsString) = 'N' then
          Application.MessageBox(pchar('Erro do processamento. Venda ' +
            vFp.dataSet.FieldByName('TPDOCS').AsString + ' ' +
            vFp.dataSet.FieldByName('NREQUISICAO').AsString + #13 +
            'Erro: ' + e.Message + #13 +
            'O processamento não será feito'), 'Atenção', 0 + 64)
        else
          Application.MessageBox(pchar('Erro do processamento. Documento ' +
            vFp.dataSet.FieldByName('TIPDOC').AsString + ' ' +
            vFp.dataSet.FieldByName('ndoc').AsString + #13 +
            'Erro: ' + e.Message), 'Atenção', 0 + 64);
        registraErro('function _processarCreditosSelecionados Erro: ' + e.Message + #13 +
          'O processamento não será feito');
      end;
    end;
  finally
    if vDiaFinanceiroFechado > 0 then
    begin
      buscas.Close;
      buscas.sql.text := ' update fech_dia set inicia_import = '''' ' +
        ' where dia_fcd = ' + QuotedStr(FormatDateTime('mm/dd/yyyy', vDiaFinanceiroFechado)) +
        ' and codigo_emp = ' + vDadosIni.codEmpresa;
      buscas.Prepare;
      buscas.ExecSQL;
      CommitaTransacao;
    end;

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

procedure TImportacaoAutomacao._relatorioVendedor;
var
	I: Integer;
  rdP: TRDprint;
  vLinha: Integer;
  vSomaTemp: Currency;
  buscas2: TIBQuery;
  vListaLotePrest: TStringList;
  vListaFormasPrest: TStringList;

  vLinha2: Integer;
  vSomaTemp2: Currency;
  vSomaTemp3: Currency;
  vSomaTempPrest: Currency;
  vSomaTempJuros: Currency;
  vsomalanccxl: currency;
  fOperadorVendedor: string;
  vTamLista: Integer;

  procedure cabecalho;
  var
   vtemp: string;
  begin
    vLinha := 1;
    rdP.Imp(vLinha, 1, vDadosIni.Replicate('=', 80));
    vLinha := vLinha + 1;
    rdP.Imp(vLinha, 1, 'Periodo do Movimento: ' + fDataInicial + ' a ' + fDataFinal +
      ' - ' + fOperadorVendedor);

    vtemp := Copy(vDadosIni.StrZero(vDadosIni.codEmpresa, 3) + ' - ' +
      vDadosIni.vEmp.vnomeEmpresa, 1, 55);
      
    if (vDadosIni.vEmp.vFinanceiroUnificado) and (fCodigoUnificada <> StrToInt(vDadosIni.codEmpresa)) then
    begin
    	 SqlOpen(' select cod_empresa, identificacao_emp from empresa ' +
      	' where cod_empresa = ' + IntToStr(fCodigoUnificada), buscas2);
       vtemp :=  Copy(vDadosIni.StrZero(buscas2.FieldByName('cod_empresa').AsString, 3) + ' - ' +
         buscas2.FieldByName('identificacao_emp').AsString, 1, 55);
    end;

    vLinha := vLinha + 1;
    rdP.Imp(vLinha, 1, 'Loja: ' + vtemp);
    rdP.Imp(vLinha, 57, '*** Não Gera Financeiro');

    if (fModoFaturamento = 'S')
    	and ((fReceberPeloFinanceiroReqOs) or (fReceberPeloFinanceiroComfat) or (fReceberPeloFinanceiroRecibo)) then
    begin
      vLinha := vLinha + 1;
      if fTipoDoc = 1 then
      	rdP.Imp(vLinha, 1, 'Tipo Documento: Documentos Recebidos pelo Caixa')
      else if fTipoDoc = 2 then
      	rdP.Imp(vLinha, 1, 'Tipo Documento: Documentos Recebidos pelo Financeiro')
      else
      	rdP.Imp(vLinha, 1, 'Tipo Documento: Todos');
    end;

    vLinha := vLinha + 1;
    rdP.Imp(vLinha, 1, vDadosIni.Replicate('-', 80));
    vLinha := vLinha + 1;
    if fRelTipo = 'D' then
      rdP.Imp(vLinha, 25, 'RESUMO DE VENDAS DETALHADAS')
    else
      rdP.Imp(vLinha, 33, 'RESUMO DE VENDAS');
    vLinha := vLinha + 1;
    rdP.Imp(vLinha, 1, vDadosIni.Replicate('-', 80));
    vLinha := vLinha + 1;

  end;
begin
  _efetuarSomaConferencia;

  rdP := TRDprint.Create(Application);

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  vListaLotePrest := TStringList.Create;
  vListaLotePrest.Clear;

  vListaFormasPrest := TStringList.Create;
  vListaFormasPrest.Clear;

  if fRelTipo = 'D' then
  begin
    rdP.OpcoesPreview.CaptionPreview := 'Relatório Resumo de Vendas Detalhado';
    rdP.TitulodoRelatorio := 'Relatório Resumo de Vendas Detalhado';
  end
  else
  begin
    rdP.OpcoesPreview.CaptionPreview := 'Relatório Resumo de Vendas';
    rdP.TitulodoRelatorio := 'Relatório Resumo de Vendas';
  end;
  vDadosIni._LimparVarSendEmail;
  rdP.OnSendMail := vDadosini._SendMailRdPrint;

  rdP.CaptionSetup := 'Opções de Impressão';
  if not vDadosIni.ModImp(rdP) then
    exit;

  rdP.OpcoesPreview.Remalina := True;
  rdP.TamanhoQteColunas := 80;
  rdP.TamanhoQteLinhas := 66;
  rdP.FonteTamanhoPadrao := S20cpp;
  rdP.OpcoesPreview.Preview := True;

  if fModoFaturamento = 'S' then
    fOperadorVendedor := IntToStr(fCodigoOperadorCxl)
  else
    fOperadorVendedor := IntToStr(fCodigoUsuario);

  if fOperadorVendedor <> '0' then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select nome_vendedor from colaborador where cod_vendedor = ' +
      fOperadorVendedor +
      ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);
    buscas.Open;

    if fModoFaturamento = 'S' then
      fOperadorVendedor := 'Operador: '
    else
      fOperadorVendedor := 'Vendedor: ';

    if not buscas.IsEmpty then
      fOperadorVendedor := fOperadorVendedor + buscas.FieldByName('nome_vendedor').AsString;
  end
  else
    fOperadorVendedor := 'Operador/Vendedor: Todos';

  if not rdP.EstaAberto then
    rdP.Abrir;

  cabecalho;

  rdP.Imp(vLinha, 9, 'CONTROLES');
  rdP.Imp(vLinha, 49, 'VALOR');
  Inc(vLinha);
  rdP.Imp(vLinha, 9, '-----------------------------');
  rdP.Imp(vLinha, 49, '-----------------');
  Inc(vLinha);

  vSomaFp.dataSet.First;

  vSomaTemp3 := 0;
  while not vSomaFp.dataSet.Eof do
  begin

    if vSomaFp.dataSet.FieldByName('nao_gera_finan').AsString = 'S' then
      rdP.Imp(vLinha, 4, '***');

    rdP.Imp(vLinha, 9, vSomaFp.dataSet.FieldByName('nome_ctrl').AsString);
    rdP.Imp(vLinha, 49, Format('%17.2n', [vSomaFp.dataSet.FieldByName('soma').AsFloat]));
    vSomaTemp3 := vSomaTemp3 + vSomaFp.dataSet.FieldByName('soma').AsFloat;

    Inc(vLinha, 2);

    vSomaFp.dataSet.Next;
    if vLinha + 3 >= 66 then
    begin
      rdP.Novapagina;
      cabecalho;
    end;
  end;

  rdP.Imp(vLinha, 9, 'TOTAL GERAL');
  rdP.Imp(vLinha, 49, Format('%17.2n', [vSomaTemp3]));
  Inc(vLinha);
  rdP.Imp(vLinha, 1, vDadosIni.Replicate('-', 80));
  Inc(vLinha);

  if fRelTipo = 'D' then
  begin

    if vLinha + 3 >= 66 then
    begin
      rdP.Novapagina;
      cabecalho;
    end;

    rdP.Imp(vLinha, 33, 'VENDAS/DETALHES');
    Inc(vLinha);
    rdP.Imp(vLinha, 1, vDadosIni.Replicate('-', 80));
    Inc(vLinha);
    rdP.Imp(vLinha, 1, 'VENDA     TIPO    VALOR');
    rdP.Imp(vLinha, 25, 'DETALHES');
    Inc(vLinha);

    // Vendas REQ e OS
    buscas2.Close;
    buscas2.SQL.Text := ' select 1 id, pd.nped, pd.tipo, pd.valor_total, ' +
      ' pd.data_fech, 0 cod_cred, '' '' num_rec_dep, ' +
      ' sum(coalesce(fp.juros, 0)) juros from pedvenda pd ' +
      ' left join existe_formas(pd.nped, pd.tipo, pd.cod_empresa) fp on 1 = 1  ' +
      ' where pd.status_ped = ''FECHADA'' and pd.tipo <> ''ORC'' and pd.cod_empresa = :cod_empresa ';

    if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroReqOs) then
    	buscas2.SQL.Text := buscas2.SQL.Text + ' and fp.data_mov >= :dataIni and fp.data_mov <= :dataFim '
    else if fModoFaturamento = 'S' then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and pd.dia_cxl >= :dataIni and pd.dia_cxl <= :dataFim'
    else
      buscas2.SQL.Text := buscas2.SQL.Text + ' and pd.data_fech >= :dataIni and pd.data_fech <= :dataFim';

    if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroReqOs) then
      if (fTipoDoc = 1) then  // Recebimentos realizados pelo Caixa Auxiliar
        buscas2.SQL.Text := buscas2.SQL.Text + ' and coalesce(pd.cxl, ''S'') = ''S'' '
      else if (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
        buscas2.SQL.Text := buscas2.SQL.Text + ' and pd.cxl = ''N'' ';

    if fCodigoOperadorCxl > 0 then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and pd.op_cxl = :cod_vendedor'
    else if fCodigoUsuario > 0 then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and pd.cod_vendedor = :cod_vendedor';

    buscas2.SQL.Text := buscas2.SQL.Text + ' group by 1, 2, 3, 4, 5, 6, 7 ';

    // Comando de faturamento na tabela com_Fat
    buscas2.SQL.Text := buscas2.SQL.Text + ' union' +
      ' select 2 id, cf.n_comando nped, ''MOT'' tipo, cf.valor_a_rec valor_total, ' +
      ' cf.data_ven data_fech, 0 cod_cred, '' '' num_rec_dep, ' +
      ' sum(coalesce(fp.juros, 0)) juros from com_fat cf ' +
      ' left join existe_formas(cf.n_comando, ''MOT'', cf.cod_empresa) fp on 1 = 1 ' +
      ' where cf.cod_empresa = :cod_empresa ' +
      ' and (trim(cf.status_v) = ''FECHADO'') ';

    if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroComfat) then
    	buscas2.SQL.Text := buscas2.SQL.Text + ' and fp.data_mov >= :dataIni and fp.data_mov <= :dataFim '
    else if fModoFaturamento = 'S' then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and cf.dia_cxl >= :dataIni and cf.dia_cxl <= :dataFim'
    else
      buscas2.SQL.Text := buscas2.SQL.Text + ' and cf.data_ven >= :dataIni and cf.data_ven <= :dataFim';

    if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroComfat) then
      if (fTipoDoc = 1) then  // Recebimentos realizados pelo Caixa Auxiliar
        buscas2.SQL.Text := buscas2.SQL.Text + ' and coalesce(cf.cxl, ''S'') = ''S'' '
      else if (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
        buscas2.SQL.Text := buscas2.SQL.Text + ' and cf.cxl = ''N'' ';

    if fCodigoOperadorCxl > 0 then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and cf.op_cxl = :cod_vendedor'
    else if fCodigoUsuario > 0 then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and cf.covend_v = :cod_vendedor';

    buscas2.SQL.Text := buscas2.SQL.Text + ' group by 1, 2, 3, 4, 5, 6, 7 ';

    // Recibos
    buscas2.SQL.Text := buscas2.SQL.Text + ' union' +
      ' select 3 id, rc.nrecibo nped, ''REC'' tipo, coalesce(rc.valor_orig, 0) valor_total, ' +
      ' rc.data_rec data_fech, 0 cod_cred, rc.num_rec_dep, ' +
      ' 0 juros from recibos rc ' +
     	' left join existe_formas(rc.nrecibo, ''REC'', rc.cod_empresa) fp on 1 = 1 ' +
			' where rc.cod_empresa = :cod_empresa and rc.nrecibo < 100000';

    if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroRecibo) then
    	buscas2.SQL.Text := buscas2.SQL.Text + ' and fp.data_mov >= :dataIni and fp.data_mov <= :dataFim '
    else if fModoFaturamento = 'S' then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and rc.dia_cxl >= :dataIni and rc.dia_cxl <= :dataFim'
    else
      buscas2.SQL.Text := buscas2.SQL.Text + ' and rc.data_rec >= :dataIni and rc.data_rec <= :dataFim';

    if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroRecibo) then
      if (fTipoDoc = 1) then  // Recebimentos realizados pelo Caixa Auxiliar
        buscas2.SQL.Text := buscas2.SQL.Text + ' and coalesce(rc.cxl, ''S'') = ''S'' '
      else if (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
        buscas2.SQL.Text := buscas2.SQL.Text + ' and rc.cxl = ''N'' ';

    if fCodigoOperadorCxl > 0 then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and rc.op_cxl = :cod_vendedor'
    else if fCodigoUsuario > 0 then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and rc.cod_us = :cod_vendedor';

    // Prestações
    if fModoFaturamento = 'S' then
    begin
      if ((fReceberPeloFinanceiroReqOs) or (fReceberPeloFinanceiroComfat) or (fReceberPeloFinanceiroRecibo))
        and (fTipoDoc = 2) then  // Recebimentos realizados pelo Financeiro
      	// Não fazer nada
      else
      begin
      	buscas2.SQL.Text := buscas2.SQL.Text + ' union' +
          ' select distinct 4 id, ctr.lote_cxl nped, ''PRE'' tipo, 0 valor_total, ' +
          ' null data_fech, 0 cod_cred, '' '' num_rec_dep, ' +
          ' sum(coalesce(fp.juros, 0)) juros  ' +
          ' from controle_Creditos ctr ' +
          ' left join existe_formas(ctr.lote_cxl, ''PRE'', ctr.codigo_emp) fp on 1 = 1 ' +
          ' where ctr.dia_cxl >= :dataIni and ctr.dia_cxl <= :dataFim ' +
          ' and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'ctr.cod_emp_mult', 'ctr.codigo_emp') +
          ' = :cod_empresa';

        if fCodigoOperadorCxl > 0 then
          buscas2.SQL.Text := buscas2.SQL.Text + ' and ctr.op_cxl = :cod_vendedor';
        buscas2.SQL.Text := buscas2.SQL.Text + ' group by 1, 2, 3, 4, 5, 6, 7 ';

        buscas2.SQL.Text := buscas2.SQL.Text + ' union all ' +
          ' select distinct 5 id, ctr.lote_cxl nped, ''PRE'' tipo, 0 valor_total, ' +
          ' null data_fech, 0 cod_cred, '' '' num_rec_dep, ' +
          ' sum(coalesce(fp.juros, 0)) juros  ' +
          ' from baixa_creditos ctr ' +
          ' left join existe_formas(ctr.lote_cxl, ''PRE'', ctr.codigo_emp) fp on 1 = 1 ' +
          ' where ctr.dia_cxl >= :dataIni and ctr.dia_cxl <= :dataFim ' +
          ' and ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'ctr.cod_emp_mult', 'ctr.codigo_emp') +
          ' = :cod_empresa' +
          ' and ctr.tp_operacao = ''P'' ';

        if fCodigoOperadorCxl > 0 then
          buscas2.SQL.Text := buscas2.SQL.Text + ' and ctr.op_cxl = :cod_vendedor';
        buscas2.SQL.Text := buscas2.SQL.Text + ' group by 1, 2, 3, 4, 5, 6, 7 '
      end;
    end;

    buscas2.SQL.Text := buscas2.SQL.Text + ' order by 1 asc, 2 asc';
    buscas2.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
    buscas2.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
    buscas2.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, fCodigoUnificada, StrToInt(vDadosIni.codEmpresa));

    if fCodigoOperadorCxl > 0 then
      buscas2.ParamByName('cod_vendedor').AsInteger := fCodigoOperadorCxl
    else if fCodigoUsuario > 0 then
      buscas2.ParamByName('cod_vendedor').AsInteger := fCodigoUsuario;

    buscas2.Open;

    buscas2.First;
    vSomaTemp2 := 0;
    vSomaTempJuros := 0;

    while not buscas2.Eof do
    begin
    	if buscas2.FieldByName('tipo').AsString = 'PRE' then
      begin
      	vSomaTemp2 := vSomaTemp2 + buscas2.FieldByName('valor_total').AsFloat;
        vSomaTempJuros := vSomaTempJuros + buscas2.FieldByName('juros').AsFloat;

      	vListaLotePrest.Clear;
        vListaFormasPrest.Clear;

        vListaLotePrest.Add('-----------------------');
        vListaFormasPrest.Add('----------------------------------------------------');
        
        buscas.Close;
        buscas.SQL.Text :=
          ' select controle_creditos.cod_cred, ' +
          ' controle_creditos.lote_cxl nped, ''PRE'' tipo, ' +
          ' controle_creditos.vl_rq_pg_cxl valor_total from controle_creditos ' +
          ' where controle_creditos.lote_cxl = :ndoc ' +
          ' and controle_creditos.' +
            vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
          ' = :cod_empresa '  +
          ' union all ' +
          ' select baixa_creditos.cod_cred, ' +
          ' baixa_creditos.lote_cxl nped, ''PRE'' tipo, ' +
          ' baixa_creditos.vl_rq_pg_cxl valor_total from baixa_creditos ' +
          ' where baixa_creditos.lote_cxl = :ndoc ' +
          ' and baixa_creditos.' +
            vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'cod_emp_mult', 'codigo_emp') +
          ' = :cod_empresa ' +
          ' and baixa_creditos.tp_operacao = ''P'' ';
        buscas.ParamByName('ndoc').AsInteger := buscas2.FieldByName('nped').AsInteger;
        buscas.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado,
          fCodigoUnificada, StrToInt(vDadosIni.codEmpresa));
        buscas.Open;
        buscas.FetchAll;

        vSomaTempPrest := 0;

        buscas.First;
        while not buscas.Eof do
        begin
        	vSomaTemp2 := vSomaTemp2 + buscas.FieldByName('valor_total').AsFloat;
          vSomaTempPrest := vSomaTempPrest + buscas.FieldByName('valor_total').AsFloat;

          vListaLotePrest.Add(PadR(vDadosIni.StrZero(buscas.FieldByName('cod_cred').AsInteger, 6), 10) +
            PadR(buscas.FieldByName('tipo').AsString, 4)+
            Format('%9.2n', [buscas.FieldByName('valor_total').AsFloat]));

          buscas.Next;
        end;

        if buscas.RecordCount > 1 then
        begin
//        	vListaLotePrest.Add('-----------------------');
          vListaLotePrest.Add(PadR('SOMA', 10) +
            PadR('', 4)+
            Format('%9.2n', [vSomaTempPrest]));
        end;

        buscas.Close;
        buscas.SQL.Text :=
          ' select c.codigo_ctrl, ' +
          ' case when (fp.recibo is not null) then ' +
          '        ''RECIBO ANTECIPADO''' +
          '      else ' +
          '        c.nome_ctrl ' +
          ' end nome_ctrl, ' +
          ' sum(coalesce(fp.valordoc, 0)) soma from formpagamento fp ' +
          ' inner join controles c on c.codigo_ctrl = fp.cod_controle and c.codigo_emp = fp.cod_empresa ' +
          ' where (((nrequisicao = :nrequisicao) and (tpdocs = :tpdocs)) ' +
          ' or ((rec_numvend = :nrequisicao) and (rec_tipvend = :tpdocs) and (tpdocs = ''TRC''))) ' +
          ' and cod_Empresa = :cod_empresa ' +
          ' group by 1, 2 ';
        buscas.ParamByName('nrequisicao').AsInteger := buscas2.FieldByName('nped').AsInteger;
        buscas.ParamByName('tpdocs').AsString := buscas2.FieldByName('tipo').AsString;
        buscas.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, fCodigoUnificada, StrToInt(vDadosIni.codEmpresa));
        buscas.Open;
        buscas.FetchAll;

        vSomaTemp := 0;

        buscas.First;
        while not buscas.Eof do
        begin
          vSomaTemp := vSomaTemp + buscas.FieldByName('soma').AsFloat;

          vListaFormasPrest.Add(PadR(buscas.FieldByName('nome_ctrl').AsString, 43) +
            Format('%9.2n', [buscas.FieldByName('soma').AsFloat]));

          buscas.Next;
        end;

        if not buscas.IsEmpty then
        begin
          vListaFormasPrest.Add('----------------------------------------------------');
          vListaFormasPrest.Add(PadR('SOMA', 43) +
          	Format('%9.2n', [vSomaTemp]));
        end
        else
        begin
          vListaFormasPrest.Add(PadR('SOMA', 43) +
          	Format('%9.2n', [vSomaTemp]));
        end;

        buscas.Close;
      end;

      if buscas2.FieldByName('tipo').AsString <> 'PRE' then
      begin
        rdP.Imp(vLinha, 1, '-----------------------');
        rdP.Imp(vLinha, 25, '----------------------------------------------------');
      end;

      if buscas2.FieldByName('tipo').AsString = 'PRE' then
      begin
      	vTamLista := vDadosIni.IfThen(vListaLotePrest.Count > vListaFormasPrest.Count,
        	vListaLotePrest.Count, vListaFormasPrest.Count);

        for I := 0 to vTamLista - 1 do
        begin
        	if (I <= vListaLotePrest.Count - 1) or (I <= vListaFormasPrest.Count - 1) then
	        	Inc(vLinha);                                                                  	
          
        	if I <= vListaLotePrest.Count - 1 then
	        	rdP.Imp(vLinha, 1, vListaLotePrest[I]);

          if I <= vListaFormasPrest.Count - 1 then
          	rdP.Imp(vLinha, 25, vListaFormasPrest[I]);

          if vLinha + 1 >= 66 then
          begin
            rdP.Novapagina;
            cabecalho;
          end;
	      end;
      end
      else
      begin
      	Inc(vLinha);
        
        if (buscas2.FieldByName('tipo').AsString = 'REC') and (vDadosIni.vRecibo.HabRecPorDepart) then
          rdP.Imp(vLinha, 1, trim(buscas2.FieldByName('num_rec_dep').AsString))
        else
          rdP.Imp(vLinha, 1, vDadosIni.StrZero(buscas2.FieldByName('nped').AsInteger, 6));
        rdP.Imp(vLinha, 11, buscas2.FieldByName('tipo').AsString);
        rdP.Imp(vLinha, 15, Format('%9.2n', [buscas2.FieldByName('valor_total').AsFloat]));

        if (fModoFaturamento = 'S') then
        begin
          buscas.Close;
          buscas.SQL.Text :=
            ' select c.codigo_ctrl, ' +
            ' case when (fp.recibo is not null) then ' +
            '        ''RECIBO ANTECIPADO'' ' +
            '      else ' +
            '        c.nome_ctrl ' +
            ' end nome_ctrl, ' +
            ' sum(coalesce(fp.valordoc, 0)) soma from formpagamento fp' +
            ' inner join controles c on c.codigo_ctrl = fp.cod_controle and c.codigo_emp = fp.cod_empresa' +
            ' where (((nrequisicao = :nrequisicao) and (tpdocs = :tpdocs)) or' +
            ' ((rec_numvend = :nrequisicao) and (rec_tipvend = :tpdocs) and (tpdocs = ''TRC'')))' +
            ' and cod_Empresa = :cod_empresa ' +
            ' group by 1, 2 ';
          buscas.ParamByName('nrequisicao').AsInteger := buscas2.FieldByName('nped').AsInteger;
          buscas.ParamByName('tpdocs').AsString := buscas2.FieldByName('tipo').AsString;
          buscas.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, fCodigoUnificada, StrToInt(vDadosIni.codEmpresa));
          buscas.Open;
        end
        else
        begin
          buscas.Close;
          buscas.SQL.Text :=
            ' select c.codigo_ctrl, ' +
            ' case when (fp.recibo is not null) then ' +
            '        ''RECIBO ANTECIPADO'' ' +
            '      else ' +
            '        c.nome_ctrl ' +
            ' end nome_ctrl, ' +
            ' sum(coalesce(fp.valordoc, 0)) soma from formpagamento fp ' +
            ' inner join controles c on c.codigo_ctrl = fp.cod_controle and c.codigo_emp = fp.cod_empresa ' +
            ' where nrequisicao = :nrequisicao and ((tpdocs = :tpdocs) or ((tpdocs = ''TRC'') and (rec_tipvend = :tpdocs))) and cod_Empresa = :cod_empresa' +
            ' group by 1, 2 ';
          buscas.ParamByName('nrequisicao').AsInteger := buscas2.FieldByName('nped').AsInteger;
          buscas.ParamByName('tpdocs').AsString := buscas2.FieldByName('tipo').AsString;
          buscas.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, fCodigoUnificada, StrToInt(vDadosIni.codEmpresa));
          buscas.Open;
        end;

        vSomaTemp2 := vSomaTemp2 + buscas2.FieldByName('valor_total').AsFloat;
        vSomaTempJuros := vSomaTempJuros + buscas2.FieldByName('juros').AsFloat;

        vSomaTemp := 0;
        buscas.First;
        while not buscas.Eof do
        begin

          rdP.Imp(vLinha, 25, buscas.FieldByName('nome_ctrl').AsString);
          rdP.Imp(vLinha, 60, Format('%17.2n', [buscas.FieldByName('soma').AsFloat]));
          vSomaTemp := vSomaTemp + buscas.FieldByName('soma').AsFloat;

          buscas.Next;
          Inc(vLinha);
          if vLinha + 1 >= 66 then
          begin
            rdP.Novapagina;
            cabecalho;
          end;

        end;

        if not buscas.IsEmpty then
        begin
          rdP.Imp(vLinha, 25, '----------------------------------------------------');
          Inc(vLinha);
          rdP.Imp(vLinha, 25, 'SOMA');
          rdP.Imp(vLinha, 60, Format('%17.2n', [vSomaTemp]));
          Inc(vLinha);
        end
        else
        begin
          rdP.Imp(vLinha, 25, 'SOMA');
          rdP.Imp(vLinha, 60, Format('%17.2n', [vSomaTemp]));
          Inc(vLinha);
        end;
      end;

      if vLinha + 1 >= 66 then
      begin
        rdP.Novapagina;
        cabecalho;
      end;

      buscas2.Next;
    end;

    if not buscas.IsEmpty then
    begin
      rdP.Imp(vLinha, 1, vDadosIni.Replicate('-', 80));
      Inc(vLinha);
    end;

    if vLinha + 8 >= 66 then
    begin
      rdP.Novapagina;
      cabecalho;
    end;

  end
  else
  begin
    vSomaTemp2 := 0;
    vSomaTempJuros := 0;
    // Vendas REQ e OS na tabela PEDVENDA
    buscas2.Close;
    buscas2.SQL.Text := ' select sum(coalesce(pd.valor_total, 0)) soma, ' +
      ' sum(coalesce(fp.juros, 0)) juros from pedvenda pd ' +
      ' left join existe_formas(pd.nped, pd.tipo, pd.cod_empresa) fp on 1 = 1 ' +
      ' where pd.status_ped = ''FECHADA'' and tipo <> ''ORC'' ' +
      ' and pd.cod_empresa = :cod_empresa';
      
    if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroReqOs) then
    	buscas2.SQL.Text := buscas2.SQL.Text + ' and fp.data_mov >= :dataIni and fp.data_mov <= :dataFim '
    else if fModoFaturamento = 'S' then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and pd.dia_cxl >= :dataIni and pd.dia_cxl <= :dataFim'
    else
      buscas2.SQL.Text := buscas2.SQL.Text + ' and pd.data_fech >= :dataIni and pd.data_fech <= :dataFim';

  	if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroReqOs) then
      if (fTipoDoc = 1) then  // Recebimentos realizados pelo Caixa Auxiliar
        buscas2.SQL.Text := buscas2.SQL.Text + ' and coalesce(pd.cxl, ''S'') = ''S'' '
      else if (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
        buscas2.SQL.Text := buscas2.SQL.Text + ' and pd.cxl = ''N'' ';

    if fCodigoOperadorCxl > 0 then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and pd.op_cxl = :cod_vendedor'
    else if fCodigoUsuario > 0 then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and pd.cod_vendedor = :cod_vendedor';

    buscas2.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
    buscas2.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
    buscas2.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, fCodigoUnificada, StrToInt(vDadosIni.codEmpresa));

    if fCodigoOperadorCxl > 0 then
      buscas2.ParamByName('cod_vendedor').AsInteger := fCodigoOperadorCxl
    else if fCodigoUsuario > 0 then
      buscas2.ParamByName('cod_vendedor').AsInteger := fCodigoUsuario;

    buscas2.Open;
    vSomaTemp2 := vSomaTemp2 + buscas2.FieldByName('soma').AsFloat;
    vSomaTempJuros := vSomaTempJuros + buscas2.FieldByName('juros').AsFloat;

    //Veículos na tabela COM_FAT
    buscas2.Close;
    buscas2.SQL.Text := 'select sum(coalesce(cf.valor_a_rec, 0)) soma, ' +
      ' sum(coalesce(fp.juros, 0)) juros from com_fat cf ' +
      ' left join existe_formas(cf.n_comando, ''MOT'', cf.cod_empresa) fp on 1 = 1 ' +
      ' where cf.cod_empresa = :cod_empresa ' +
      ' and (trim(cf.status_v) = ''FECHADO'') ';

    if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroComfat) then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and fp.data_mov >= :dataIni and fp.data_mov <= :dataFim '
    else if fModoFaturamento = 'S' then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and cf.dia_cxl >= :dataIni and cf.dia_cxl <= :dataFim'
    else
      buscas2.SQL.Text := buscas2.SQL.Text + ' and cf.data_ven >= :dataIni and cf.data_ven <= :dataFim';

    if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroComfat) then
      if (fTipoDoc = 1) then  // Recebimentos realizados pelo Caixa Auxiliar
        buscas2.SQL.Text := buscas2.SQL.Text + ' and coalesce(cf.cxl, ''S'') = ''S'' '
      else if (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
        buscas2.SQL.Text := buscas2.SQL.Text + ' and cf.cxl = ''N'' ';

    if fCodigoOperadorCxl > 0 then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and cf.op_cxl = :cod_vendedor'
    else if fCodigoUsuario > 0 then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and cf.covend_v = :cod_vendedor';

    buscas2.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
    buscas2.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
    buscas2.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, fCodigoUnificada, StrToInt(vDadosIni.codEmpresa));

    if fCodigoOperadorCxl > 0 then
      buscas2.ParamByName('cod_vendedor').AsInteger := fCodigoOperadorCxl
    else if fCodigoUsuario > 0 then
      buscas2.ParamByName('cod_vendedor').AsInteger := fCodigoUsuario;

    buscas2.Open;
    vSomaTemp2 := vSomaTemp2 + buscas2.FieldByName('soma').AsFloat;
    vSomaTempJuros := vSomaTempJuros + buscas2.FieldByName('juros').AsFloat;

    //Recibos
    buscas2.Close;
    buscas2.SQL.Text := ' select sum(coalesce(rc.valor_orig, 0)) soma ' +
    	' from recibos rc ' +
     	' left join existe_formas(rc.nrecibo, ''REC'', rc.cod_empresa) fp on 1 = 1 ' +
    	' where rc.cod_empresa = :cod_empresa and rc.nrecibo < 100000';
    
    if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroRecibo) then
    	buscas2.SQL.Text := buscas2.SQL.Text + ' and fp.data_mov >= :dataIni and fp.data_mov <= :dataFim '
    else if fModoFaturamento = 'S' then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and rc.dia_cxl >= :dataIni and rc.dia_cxl <= :dataFim'
    else
      buscas2.SQL.Text := buscas2.SQL.Text + ' and rc.data_rec >= :dataIni and rc.data_rec <= :dataFim';

    if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroRecibo) then
      if (fTipoDoc = 1) then  // Recebimentos realizados pelo Caixa Auxiliar
        buscas2.SQL.Text := buscas2.SQL.Text + ' and coalesce(rc.cxl, ''S'') = ''S'' '
      else if (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
        buscas2.SQL.Text := buscas2.SQL.Text + ' and rc.cxl = ''N'' ';

    if fCodigoOperadorCxl > 0 then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and rc.op_cxl = :cod_vendedor'
    else if fCodigoUsuario > 0 then
      buscas2.SQL.Text := buscas2.SQL.Text + ' and rc.cod_us = :cod_vendedor';

    buscas2.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
    buscas2.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
    buscas2.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, fCodigoUnificada, StrToInt(vDadosIni.codEmpresa));

    if fCodigoOperadorCxl > 0 then
      buscas2.ParamByName('cod_vendedor').AsInteger := fCodigoOperadorCxl
    else if fCodigoUsuario > 0 then
      buscas2.ParamByName('cod_vendedor').AsInteger := fCodigoUsuario;

    buscas2.Open;
    buscas2.First;
    while not buscas2.Eof do
    begin
    	vSomaTemp2 := vSomaTemp2 + buscas2.FieldByName('soma').AsFloat;
      
      buscas2.Next;
    end;

    //Prestações
    if fModoFaturamento = 'S' then
    begin
      if ((fReceberPeloFinanceiroReqOs) or (fReceberPeloFinanceiroComfat) or (fReceberPeloFinanceiroRecibo))
        and (fTipoDoc = 2) then  // Recebimentos realizados pelo Financeiro
      	// Não fazer nada
      else
      begin
        buscas2.Close;
        buscas2.SQL.Text := ' select coalesce(ctr.vl_rq_pg_cxl, 0) soma, ' +
          ' coalesce(fp.juros, 0) juros from controle_creditos ctr ' +
          ' left join existe_formas(ctr.lote_cxl, ''PRE'', ctr.codigo_emp) fp on 1 = 1 ' +
          ' where ctr.dia_cxl >= :dataIni and ctr.dia_cxl <= :dataFim and ' +
          vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'ctr.cod_emp_mult', 'ctr.codigo_emp') + ' = :cod_empresa';
        if fCodigoOperadorCxl > 0 then
          buscas2.SQL.Text := buscas2.SQL.Text + ' and ctr.op_cxl = :cod_vendedor';


      	buscas2.SQL.Text := buscas2.SQL.Text +
        	' union all ' +
        	' select coalesce(ctr.vl_rq_pg_cxl, 0) soma, ' +
          ' coalesce(fp.juros, 0) juros from baixa_creditos ctr ' +
          ' left join existe_formas(ctr.lote_cxl, ''PRE'', ctr.codigo_emp) fp on 1 = 1 ' +
          ' where ctr.dia_cxl >= :dataIni and ctr.dia_cxl <= :dataFim and ' +
          vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'ctr.cod_emp_mult', 'ctr.codigo_emp') + ' = :cod_empresa' +
          ' and ctr.tp_operacao = ''P'' ';
        if fCodigoOperadorCxl > 0 then
          buscas2.SQL.Text := buscas2.SQL.Text + ' and ctr.op_cxl = :cod_vendedor';
          
        buscas2.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
        buscas2.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
        buscas2.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, fCodigoUnificada, StrToInt(vDadosIni.codEmpresa));
        if fCodigoOperadorCxl > 0 then
          buscas2.ParamByName('cod_vendedor').AsInteger := fCodigoOperadorCxl;
        buscas2.Open;

        buscas2.First;
        while not buscas2.Eof do
        begin
        	vSomaTemp2 := vSomaTemp2 + buscas2.FieldByName('soma').AsFloat;
        	vSomaTempJuros := vSomaTempJuros + buscas2.FieldByName('juros').AsFloat;

          buscas2.Next;
        end;
      end;
    end;
  end;

  if vLinha + 3 >= 66 then
  begin
    rdP.Novapagina;
    cabecalho;
  end;

  //rdP.Imp( vLinha, 1, vDadosIni.Replicate('-', 80 ));
  if fRelTipo = 'D' then
	  Inc(vLinha);
  rdP.Imp(vLinha, 9, 'TOTAIS');
  rdP.Imp(vLinha, 49, 'VALOR');
  Inc(vLinha);
  rdP.Imp(vLinha, 9, '-----------------------------');
  rdP.Imp(vLinha, 49, '-----------------');
  Inc(vLinha);
  rdP.Imp(vLinha, 9, 'TOTAL DAS VENDAS / RECIBOS / PREST.');
  rdP.Imp(vLinha, 49, Format('%17.2n', [vSomaTemp2]));
  Inc(vLinha, 2);
  rdP.Imp(vLinha, 9, 'LANÇAMENTOS AVULSOS');
  Inc(vLinha, 1);
  vsomalanccxl:=0;
  if fModoFaturamento = 'S' then
  begin
     if ((fReceberPeloFinanceiroReqOs) or (fReceberPeloFinanceiroComfat) or (fReceberPeloFinanceiroRecibo))
     	  and (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
       // Não fazer nada
     else
     begin
        buscas2.Close;
        buscas2.SQL.Text := 'SELECT historico, coalesce(valordoc, 0) soma FROM FORMPAGAMENTO ' +
        ' WHERE DATA_MOV >= :dataIni and DATA_MOV <= :dataFim and cod_empresa = :cod_empresa '+
        ' AND TPDOCS = ''LCS'' AND (RECIBO IS NULL or RECIBO = '''')';
        if fCodigoOperadorCxl > 0 then
          buscas2.SQL.Text := buscas2.SQL.Text + ' and op_cxl = :cod_vendedor';
        buscas2.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
        buscas2.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
        buscas2.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, fCodigoUnificada, StrToInt(vDadosIni.codEmpresa));
        if fCodigoOperadorCxl > 0 then
          buscas2.ParamByName('cod_vendedor').AsInteger := fCodigoOperadorCxl;
        buscas2.Open;
        while not buscas2.eof do
        begin
           rdP.Imp(vLinha, 9, copy(buscas2.FieldByName('HISTORICO').AsString,1,38));
           rdP.Imp(vLinha, 49, Format('%17.2n', [buscas2.FieldByName('SOMA').AsCurrency]));
           inc(vlinha,1);
           vsomalanccxl:=vsomalanccxl+buscas2.FieldByName('SOMA').AsCurrency;
           if vLinha >= 66 then
           begin
            rdP.Novapagina;
            cabecalho;
           end;
          buscas2.next;
        end;
        if vLinha >= 66 then
        begin
         rdP.Novapagina;
         cabecalho;
        end;
     end;
  end;
  rdP.Imp(vLinha, 9, '-----------------------------');
  rdP.Imp(vLinha, 49, '-----------------');
  inc(vlinha,1);
  if vLinha >= 66 then
  begin
   rdP.Novapagina;
   cabecalho;
  end;                 
  rdP.Imp(vLinha, 09, 'TOTAL LANCAMENTOS...:');
  rdP.Imp(vLinha, 49, Format('%17.2n', [vsomalanccxl]));
  inc(vlinha,2);
  if vLinha >= 66 then
  begin
   rdP.Novapagina;
   cabecalho;
  end;

  rdP.Imp(vLinha, 09, 'SUBTOTAL............:');
  rdP.Imp(vLinha, 49, Format('%17.2n', [vSomaTemp2+vsomalanccxl]));
  inc(vlinha,1);
  if vLinha >= 66 then
  begin
   rdP.Novapagina;
   cabecalho;
  end;

  rdP.Imp(vLinha, 9, 'RECIBOS ANTECIPADOS.:');
  rdP.Imp(vLinha, 49, Format('%17.2n', [-Abs(fValorBaixaRecibos)]));
  Inc(vLinha,1);
  if vLinha >= 66 then
  begin
   rdP.Novapagina;
   cabecalho;
  end;

  rdP.Imp(vLinha, 9, 'TX INTERMEDIADOR PAG:');
  rdP.Imp(vLinha, 49, Format('%17.2n', [-Abs(fValorTaxaInterPagEC)]));
  Inc(vLinha,1);
  if vLinha >= 66 then
  begin
   rdP.Novapagina;
   cabecalho;
  end;

  rdP.Imp(vLinha, 9, 'JUROS...............:');
  rdP.Imp(vLinha, 49, Format('%17.2n', [vSomaTempJuros]));
  Inc(vLinha,1);
  if vLinha >= 65 then
  begin
   rdP.Novapagina;
   cabecalho;
  end;

  Inc(vLinha);
  rdP.Imp(vLinha, 9, '-----------------------------');
  rdP.Imp(vLinha, 49, '-----------------');
  Inc(vLinha);
  rdP.Imp(vLinha, 09, 'TOTAL LIQUIDO.......:');
  rdP.Imp(vLinha, 49, Format('%17.2n',
  	[vSomaTemp2 + vsomalanccxl - Abs(fValorBaixaRecibos) - Abs(fValorTaxaInterPagEC) + vSomaTempJuros]));
  inc(vlinha,2);
  if vLinha >= 66 then
  begin
   rdP.Novapagina;
   cabecalho;
  end;

  rdP.Imp(vLinha, 28, 'DIFERENCA:');
  rdP.Imp(vLinha, 49, Format('%17.2n',
  [vSomaTemp3{Total Geral}
  	- (vSomaTemp2 + vsomalanccxl - Abs(fValorBaixaRecibos) - Abs(fValorTaxaInterPagEC) + vSomaTempJuros) {Total Líquido}]));
  //vSomaTemp2 - vSomaTemp3 + vsomalanccxl - Abs(fValorBaixaRecibos) + vSomaTempJuros]));
//  Inc(vLinha, 2);
//  if vLinha >= 66 then
//  begin
//   rdP.Novapagina;
//   cabecalho;
//  end;
//  rdP.Imp(vLinha, 9, 'RECIBOS ANTECIPADOS');
//  rdP.Imp(vLinha, 49, Format('%17.2n', [fValorBaixaRecibos]));
//  Inc(vLinha,1);
//  rdP.Imp(vLinha, 1, vDadosIni.Replicate('-', 80));
  buscas2.Close;
  buscas.Close;
  rdP.Fechar;
end;

procedure TImportacaoAutomacao._selecionarItem;
begin
  vFp.dataSet.Edit;
  if vFp.dataSet.FieldByName('sel').AsString = 'S' then
    vFp.dataSet.FieldByName('sel').AsString := ' '
  else
    vFp.dataSet.FieldByName('sel').AsString := 'S';
  vFp.dataSet.Post;
end;

procedure TImportacaoAutomacao._selecionarTodos;
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Aguarde. Selecionando todos os Itens');

    if not vFp.dataSet.Active then
      exit;
    vFp.dataSet.First;
    while not vFp.dataSet.Eof do
    begin
      vFp.dataSet.Edit;
      vFp.dataSet.FieldByName('sel').AsString := 'S';
      vFp.dataSet.Post;
      vFp.dataSet.Next;
    end;
    vFp.dataSet.First;

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TImportacaoAutomacao._somaLancamentosCxl;
begin
  fValorLancamentos := 0;
  fValorLancamentosAvulsos := 0;
  fValorTotalCreditos := 0;
  fValorTotalTroco := 0;
  fValorTotalLancamentosOutrasE := 0;
  fValorTotalLancamentosOutrasS := 0;

  if (fModoFaturamento = 'S')
  	and ((fReceberPeloFinanceiroReqOs) or (fReceberPeloFinanceiroComfat) or (fReceberPeloFinanceiroRecibo))
    and (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
  begin
    buscas.Close;
    exit;
  end;

//  if fCodigoOperadorCxl = 0 then
//    Exit;

  buscas.Close;
  buscas.SQL.Text := 'select lc.valor_cxl, lc.tipo_doc_cxl, lc.tipo_lanc_cxl, coalesce(lc.tr, ''N'') tr from lanccxl lc' +
    ' where lc.data_lc_cxl >= :dataIni and lc.data_lc_cxl <= :dataFim' +
    ' and codigo_emp = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);// +
   // ' and (lc.tr is null or lc.tr = ''N'')';

  if fCodigoOperadorCxl > 0 then
  	buscas.SQL.Text := buscas.SQL.Text + ' and op_cxl = ' + IntToStr(fCodigoOperadorCxl);
//
//    Exit;

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.Open;

  buscas.First;
  while not buscas.Eof do
  begin
    if buscas.FieldByName('tipo_doc_cxl').IsNull then
    begin
      if Trim(buscas.FieldByName('tipo_lanc_cxl').AsString) = 'S' then
      begin
        fValorLancamentosAvulsos := fValorLancamentosAvulsos - buscas.FieldByName('valor_cxl').AsFloat;
        fValorTotalLancamentosOutrasS := fValorTotalLancamentosOutrasS - buscas.FieldByName('valor_cxl').AsFloat;
      end
      else
      begin
        fValorLancamentosAvulsos := fValorLancamentosAvulsos + buscas.FieldByName('valor_cxl').AsFloat;
        fValorTotalLancamentosOutrasE := fValorTotalLancamentosOutrasE + buscas.FieldByName('valor_cxl').AsFloat;
      end;
    end;
    if buscas.FieldByName('tr').AsString <> 'S' then
    begin
      if Trim(buscas.FieldByName('tipo_lanc_cxl').AsString) = 'S' then
        fValorLancamentos := fValorLancamentos - buscas.FieldByName('valor_cxl').AsFloat
      else
        fValorLancamentos := fValorLancamentos + buscas.FieldByName('valor_cxl').AsFloat;
    end
    else
      fValorTotalTroco := fValorTotalTroco - buscas.FieldByName('valor_cxl').AsFloat;

    buscas.Next;
  end;
  buscas.Close;

end;

procedure TImportacaoAutomacao._somaPrestacoesRecebidas;
begin
	fValorPrestacoesReceb := 0;
  fValorPrestacoesRecebJuros := 0;

  if (fModoFaturamento = 'S')
  	and ((fReceberPeloFinanceiroReqOs) or (fReceberPeloFinanceiroComfat) or (fReceberPeloFinanceiroRecibo))
    and (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
  begin
  	buscas.Close;
    exit;
  end;

  buscas.Close;
  buscas.SQL.Text := 'select 0 seq_bxcred, cc.cod_cred, ' +
    ' coalesce(cc.vl_rq_pg_cxl, 0) soma, ' +
  	' coalesce(fp.juros, 0) juros from controle_creditos cc ' +
    ' left join existe_formas(cc.lote_cxl, ''PRE'', cc.codigo_emp) fp on 1 = 1 ' +
    ' where cc.dia_cxl >= :dataIni and cc.dia_cxl <= :dataFim ';

  if fCodigoOperadorCxl > 0 then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and cc.op_cxl = ' + IntToStr(fCodigoOperadorCxl);

  if vDadosIni.vEmp.vFinanceiroUnificado then
    buscas.SQL.Text := buscas.SQL.Text + ' and cc.cod_emp_mult = ' + IntToStr(fCodigoUnificada)
  else
    buscas.SQL.Text := buscas.SQL.Text + ' and cc.codigo_emp = ' + vDadosIni.codEmpresa;

  buscas.SQL.Text := buscas.SQL.Text +
  	' union all ' +
    ' select bc.seq_bxcred, bc.cod_cred, ' +
    ' coalesce(bc.vl_rq_pg_cxl, 0) soma, ' +
    ' coalesce(fp.juros, 0) juros from baixa_creditos bc ' +
    ' left join existe_formas(bc.lote_cxl, ''PRE'', bc.codigo_emp) fp on 1 = 1 ' +
    ' where bc.dia_cxl >= :dataIni and bc.dia_cxl <= :dataFim ' +
    ' and bc.tp_operacao = ''P'' ';

  if fCodigoOperadorCxl > 0 then
    buscas.SQL.Text := buscas.SQL.Text +
      ' and bc.op_cxl = ' + IntToStr(fCodigoOperadorCxl);

  if vDadosIni.vEmp.vFinanceiroUnificado then
    buscas.SQL.Text := buscas.SQL.Text + ' and bc.cod_emp_mult = ' + IntToStr(fCodigoUnificada)
  else
    buscas.SQL.Text := buscas.SQL.Text + ' and bc.codigo_emp = ' + vDadosIni.codEmpresa;


  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.Open;

  buscas.First;
  while not buscas.Eof do
  begin
  	fValorPrestacoesReceb := fValorPrestacoesReceb + buscas.FieldByName('soma').AsFloat;
	  fValorPrestacoesRecebJuros := fValorPrestacoesRecebJuros + buscas.FieldByName('juros').AsFloat;

    buscas.Next;
  end;
  buscas.Close;

end;

procedure TImportacaoAutomacao._somaRecibosRecebidos;
begin
	fValorRecibo := 0;

//	if (fModoFaturamento = 'S') and (not fReceberPeloFinanceiroRecibo) and (fTipoDoc = 1) then
//  begin
//	  buscas.Close;
//    exit;
//  end;
//
  buscas.Close;
  buscas.SQL.Text := 'select sum(coalesce(rc.valor_orig, 0)) soma from recibos rc ' +
  	' left join existe_formas(rc.nrecibo, ''REC'', rc.cod_empresa) fp on 1 = 1 ';

  if (fModoFaturamento = 'S') then
  begin
  	if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroRecibo) then
    	buscas.SQL.Text := buscas.SQL.Text + ' where fp.data_mov >= :dataIni and fp.data_mov <= :dataFim '
    else
	    buscas.SQL.Text := buscas.SQL.Text + ' where rc.dia_cxl >= :dataini and rc.dia_cxl <= :dataFim ';

    if fCodigoOperadorCxl > 0 then
    	buscas.SQL.Text := buscas.SQL.Text + ' and rc.op_cxl = ' + IntToStr(fCodigoOperadorCxl)
  end
  else
  begin
    buscas.SQL.Text := buscas.SQL.Text + ' where rc.data_rec >= :dataIni and rc.data_rec <= :dataFim ';

    if fCodigoUsuario > 0 then
    	buscas.SQL.Text := buscas.SQL.Text + ' and rc.cod_us = ' + IntToStr(fCodigoUsuario);
  end;

  buscas.SQL.Text := buscas.SQL.Text + ' and rc.nrecibo < 100000 ' +
  	' and rc.cod_empresa = ' +vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(fCodigoUnificada), vDadosIni.codEmpresa);

  if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroRecibo) then
  	if (fTipoDoc = 1) then  // Recebimentos realizados pelo Caixa Auxiliar
      buscas.SQL.Text := buscas.SQL.Text + ' and coalesce(rc.cxl, ''S'') = ''S'' '
    else if (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
      buscas.SQL.Text := buscas.SQL.Text + ' and rc.cxl = ''N'' ';

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.Open;

  buscas.First;
  while not buscas.Eof do
  begin
	  fValorRecibo := fValorRecibo + buscas.FieldByName('soma').AsFloat;

    buscas.Next;
  end;
  buscas.Close;

end;

procedure TImportacaoAutomacao._somaRecibosUsadosFormaPag;
begin
	fValorBaixaRecibos := 0;
  
//  if (fModoFaturamento = 'S')
//  	and ((fReceberPeloFinanceiroReqOs) or (fReceberPeloFinanceiroComfat) or (fReceberPeloFinanceiroRecibo))
//    and (fTipoDoc = 1) then
//  begin
//    buscas.Close;
//    exit;
//  end;
  
  buscas.Close;
  buscas.SQL.Text := buscas.SQL.Text +
    ' AND h.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' AND h.ATIVO = 1 ';

  buscas.SQL.Text := ' select sum(coalesce(fp.valordoc, 0)) soma from formpagamento fp' +
    ' where fp.data_mov >= :dataIni and fp.data_mov <= :dataFim';

  if (fModoFaturamento = 'S')	and ((fReceberPeloFinanceiroReqOs) or (fReceberPeloFinanceiroComfat)) then
  	if (fTipoDoc = 1) then  // Recebimentos realizados pelo Caixa Auxiliar
      buscas.SQL.Text := buscas.SQL.Text + ' and coalesce(fp.cxl, ''S'') = ''S'' '
    else if (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
      buscas.SQL.Text := buscas.SQL.Text + ' and fp.cxl = ''N'' ';
    
  if fCodigoOperadorCxl > 0 then
    buscas.SQL.Text := buscas.SQL.Text + ' and fp.op_cxl = ' + IntToStr(fCodigoOperadorCxl);

  if fCodigoUsuario > 0 then
    buscas.SQL.Text := buscas.SQL.Text + ' and fp.operador = ' + IntToStr(fCodigoUsuario);

  buscas.SQL.Text := buscas.SQL.Text +
    ' and fp.tpdocs <> ''LCS'' and fp.recibo = ''S'' ' +
    ' and fp.cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(fCodigoUnificada), vDadosIni.codEmpresa) +
    ' and fp.ativo = 1';

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.open;

  buscas.First;
  while not buscas.Eof do
  begin
	  fValorBaixaRecibos := buscas.FieldByName('soma').AsCurrency;

    buscas.Next;
  end;

  buscas.close;
end;

procedure TImportacaoAutomacao._somaTaxaIntermPagEC;
begin
	fValorTaxaInterPagEC := 0;
  
//  if (fModoFaturamento = 'S')
//  	and ((fReceberPeloFinanceiroReqOs) or (fReceberPeloFinanceiroComfat) or (fReceberPeloFinanceiroRecibo))
//    and (fTipoDoc = 1) then
//  begin
//    buscas.Close;
//    exit;
//  end;
  
  buscas.Close;
  buscas.SQL.Text := ' select sum(coalesce(fp.valordoc, 0)) soma from formpagamento fp' +
    ' where fp.data_mov >= :dataIni and fp.data_mov <= :dataFim ';

  if (fModoFaturamento = 'S')	and ((fReceberPeloFinanceiroReqOs) or (fReceberPeloFinanceiroComfat)) then
  	if (fTipoDoc = 1) then  // Recebimentos realizados pelo Caixa Auxiliar
      buscas.SQL.Text := buscas.SQL.Text + ' and coalesce(fp.cxl, ''S'') = ''S'' '
    else if (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
      buscas.SQL.Text := buscas.SQL.Text + ' and fp.cxl = ''N'' ';    

  if fCodigoOperadorCxl > 0 then
    buscas.SQL.Text := buscas.SQL.Text + ' and fp.op_cxl = ' + IntToStr(fCodigoOperadorCxl);

  if fCodigoUsuario > 0 then
    buscas.SQL.Text := buscas.SQL.Text + ' and fp.operador = ' + IntToStr(fCodigoUsuario);

  buscas.SQL.Text := buscas.SQL.Text +
    ' and fp.tpdocs = ''INTERM'' ' +
    ' and fp.cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(fCodigoUnificada), vDadosIni.codEmpresa) +
    ' and fp.ativo = 1';

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.open;

  buscas.First;
  while not buscas.Eof do
  begin
	  fValorTaxaInterPagEC := buscas.FieldByName('soma').AsCurrency;

    buscas.Next;
  end;

  buscas.close;
end;

procedure TImportacaoAutomacao._somaVendaReqOS;
begin
	fValorReqOS := 0;
  fValorReqOSJuros := 0;

  buscas.Close;
  buscas.SQL.Text := 'select sum(coalesce(pv.valor_total, 0)) soma, ' +
  	' sum(coalesce(fp.juros, 0)) juros from pedvenda pv ' +
    ' left join existe_formas(pv.nped, pv.tipo, pv.cod_empresa) fp on 1 = 1 ';

  if (fModoFaturamento = 'S') then
  begin
  	if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroReqOs) then
	    buscas.SQL.Text := buscas.SQL.Text + ' where fp.data_mov >= :dataIni and fp.data_mov <= :dataFim '
    else
	  	buscas.SQL.Text := buscas.SQL.Text + ' where pv.dia_cxl >= :dataIni and pv.dia_cxl <= :dataFim ';

	  if (fCodigoOperadorCxl > 0) then
     	buscas.SQL.Text := buscas.SQL.Text + ' and pv.op_cxl = ' + IntToStr(fCodigoOperadorCxl);
  end
  else
  begin
    buscas.SQL.Text := buscas.SQL.Text + ' where pv.data_fech >= :dataIni and pv.data_fech <= :dataFim ';

    if fCodigoUsuario > 0 then
    	buscas.SQL.Text := buscas.SQL.Text + ' and pv.cod_vendedor = ' + IntToStr(fCodigoUsuario);
  end;

  buscas.SQL.Text := buscas.SQL.Text + ' and pv.tipo <> ''ORC'' ' +
    ' and pv.cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(fCodigoUnificada), vDadosIni.codEmpresa) +
    ' and pv.status_ped = ''FECHADA'' and pv.ativo = 1';

  if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroReqOs) then
  	if (fTipoDoc = 1) then  // Recebimentos realizados pelo Caixa Auxiliar
      buscas.SQL.Text := buscas.SQL.Text + ' and coalesce(pv.cxl, ''S'') = ''S'' '
    else if (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
      buscas.SQL.Text := buscas.SQL.Text + ' and pv.cxl = ''N'' ';

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.Open;

  buscas.First;
  while not buscas.Eof do
  begin
	  fValorReqOS := fValorReqOS + buscas.FieldByName('soma').AsFloat;
    fValorReqOSJuros := fValorReqOSJuros + buscas.FieldByName('juros').AsFloat;

    buscas.Next;
  end;
  buscas.Close;

end;

procedure TImportacaoAutomacao._somaVendaVeiculos;
begin
	fValorComFat := 0;
  fValorComFatJuros := 0;

  buscas.Close;
  buscas.SQL.Text := 'select sum(coalesce(cf.valor_a_rec, 0)) soma, ' +
    ' sum(coalesce(fp.juros, 0)) juros ' +
    ' from com_fat cf ' +
    ' left join existe_formas(cf.n_comando, ''MOT'', cf.cod_empresa) fp on 1 = 1 ';

  if (fModoFaturamento = 'S') then
  begin
  	if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroComfat) then
	    buscas.SQL.Text := buscas.SQL.Text + ' where fp.data_mov >= :dataIni and fp.data_mov <= :dataFim '
    else
	  	buscas.SQL.Text := buscas.SQL.Text + ' where cf.dia_cxl >= :dataIni and cf.dia_cxl <= :dataFim ';

    if fCodigoOperadorCxl > 0 then
	    buscas.SQL.Text := buscas.SQL.Text + ' and cf.op_cxl = ' + IntToStr(fCodigoOperadorCxl);
  end
  else
  begin
    buscas.SQL.Text := buscas.SQL.Text + ' where cf.data_ven >= :dataIni and cf.data_ven <= :dataFim ';

    if fCodigoUsuario > 0 then
    	buscas.SQL.Text := buscas.SQL.Text + ' and cf.covend_v = ' + IntToStr(fCodigoUsuario);
  end;

  if (fModoFaturamento = 'S') and (fReceberPeloFinanceiroComfat) then
  	if (fTipoDoc = 1) then  // Recebimentos realizados pelo Caixa Auxiliar
      buscas.SQL.Text := buscas.SQL.Text + ' and coalesce(cf.cxl, ''S'') = ''S'' '
    else if (fTipoDoc = 2) then // Recebimentos realizados pelo Financeiro 
      buscas.SQL.Text := buscas.SQL.Text + ' and cf.cxl = ''N'' ';

  buscas.SQL.Text := buscas.SQL.Text +
    ' and cf.cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(fCodigoUnificada), vDadosIni.codEmpresa) +
    ' and cf.natureza = ''S'' ' +
    ' and (trim(cf.status_v) = ''FECHADO'') ' +
    ' and cf.ativo = 1 ';

  buscas.ParamByName('dataIni').AsDate := StrToDate(fDataInicial);
  buscas.ParamByName('dataFim').AsDate := StrToDate(fDataFinal);
  buscas.Open;

  buscas.First;
  while not buscas.Eof do
  begin
	  fValorComFat := fValorComFat + buscas.FieldByName('soma').AsFloat;
  	fValorComFatJuros := fValorComFatJuros + buscas.FieldByName('juros').AsFloat;

    buscas.Next;
  end;
  buscas.Close;
  
end;

{ TFormPagImpAuto }

constructor TFormPagImpAuto.create;
begin
  if dtmImportPDVFinan = nil then
    dtmImportPDVFinan := TdtmImportPDVFinan.Create(dtmImportPDVFinan);
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsFPG);
  buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TFormPagImpAuto._abreFormPag(pDataIni, pDataFim: string; pCodigoOpCxl,
  pCodigoUsuario, pCodigoUnificada: Integer; pModoFaturamento: string;
  pReceberPeloFinanceiroReqOs, pReceberPeloFinanceiroComfat, pReceberPeloFinanceiroRecibo: Boolean; pTipoDoc: Integer): Boolean;
var
  vSql: string;
begin
  vSql := 'select fp.*, ';
  if vDadosIni.vRecibo.HabRecPorDepart then
	  vSql := vSql +
      ' case when(fp.tpdocs = ''REC'') then ' +
   	  '   case when (trim(coalesce(rc.num_rec_dep, '''')) <> '''') then rc.num_rec_dep ' +
   	  '   else fp.nrequisicao end ' +
   	  ' else fp.nrequisicao ' +
  	  ' end num_rec_dep, ' +
   	  ' case when (fp.tpdocs = ''REC'') then ' +
   	  '   case when (trim(coalesce(rc.num_rec_dep, '''')) <> '''') then (rc.num_rec_dep||''-''||fp.nparcela) ' +
  	  '     else fp.ndoc end ' +
   	  ' else fp.ndoc ' +
   	  ' end num_rec_parc '
  else
  	vSql := vSql + ''' '' num_rec_dep, '' '' num_rec_parc ';

  vSql := vSql +
    ' from formpagamento fp ' +
    ' left join recibos rc on rc.nrecibo = fp.nrequisicao and rc.cod_empresa = fp.cod_empresa ' +
    ' where fp.data_mov >= :dataIni and fp.data_mov <= :dataFim' +
    ' and fp.tpdocs <> ''PRE'' and fp.prcss is null ';

  if (pModoFaturamento = 'S')
  	and ((pReceberPeloFinanceiroReqOs) or (pReceberPeloFinanceiroComfat) or (pReceberPeloFinanceiroRecibo)) then
  begin
  	if (pTipoDoc = 1) then // Documentos recebidos pelo caixa
    	vSql := vSql + ' and coalesce(fp.cxl, ''S'') = ''S'' '
    else if (pTipoDoc = 2) then // Documentos recebidos pelo financeiro
    	vSql := vSql + ' and fp.cxl = ''N'' ';
  end;

  if pCodigoOpCxl > 0 then
    vSql := vSql + ' and fp.op_cxl = ' + IntToStr(pCodigoOpCxl);

  if pCodigoUsuario > 0 then
    vSql := vSql + ' and fp.operador = ' + IntToStr(pCodigoUsuario);

  vSql := vSql + ' and fp.cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa) +
    ' order by fp.tipdoc, fp.cod_controle';

  Result := montaSelect(vSql, StrToDate(pDataIni), StrToDate(pDataFim));

end;

function TFormPagImpAuto._abreFormPag(pLoteCxl, pCodigoUnificada: Integer): Boolean;
begin
  Result := montaSelect('select * from formpagamento' +
    ' where nrequisicao = ' + IntToStr(pLoteCxl) +
    ' and tpdocs = ''PRE'' and prcss is null and cod_Empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa) +
    //pSqlAdicional +
    ' order by tipdoc, cod_controle');
end;

function TFormPagImpAuto._abreFormPagAnalitico(pLoteCxl, pCodigoUnificada: Integer): Boolean;
begin
  Result :=
    montaSelect('select fp.cod_controle, ct.nome_ctrl, sum(fp.valordoc) soma from controles ct' +
    ' inner join formpagamento fp on fp.cod_controle = ct.codigo_ctrl and fp.cod_empresa = ct.codigo_emp' +
    ' where fp.nrequisicao = ' + IntToStr(pLoteCxl) +
    ' and fp.tpdocs = ''PRE'' ' +
    ' and fp.prcss is null ' +
    ' and fp.cod_Empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa) +
    ' and fp.TIPDOC <> ''N'' ' +
    ' group by 1, 2');
end;

{ TSomaFormPagImpAuto }

constructor TSomaFormPagImpAuto.create;
begin
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsSumFp);
  buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TSomaFormPagImpAuto._abreSomaFormPag(pDataIni, pDataFim: string;
  pCodigoOpCxl, pCodigoUsuario, pCodigoUnificada: Integer; pModoFaturamento: string;
  pReceberPeloFinanceiroReqOs, pReceberPeloFinanceiroComfat, pReceberPeloFinanceiroRecibo: Boolean;
  pTipoDoc: Integer): Boolean;
var
  vSql: string;
begin
  vSql := 'select fp.cod_controle, ct.nome_ctrl, ct.nao_gera_finan, sum(coalesce(fp.valordoc, 0)) soma,' +
    ' sum( case when fp.tip_cnt = ''C'' then coalesce(fp.valor_contabil, 0) else 0 end) SOMA_CONTABIL' +
    ' from controles ct' +
    ' inner join formpagamento fp on fp.cod_controle = ct.codigo_ctrl and fp.cod_empresa = ct.codigo_emp' +
    ' where fp.data_mov >= :dataIni ' +
    ' and fp.data_mov <= :dataFim';

  if (pModoFaturamento = 'S')
  	and ((pReceberPeloFinanceiroReqOs) or (pReceberPeloFinanceiroComfat) or (pReceberPeloFinanceiroRecibo)) then
  begin
    if (pTipoDoc = 1) then // Recebimentos realizados pelo Caixa Auxiliar
      vSql := vSql + ' and coalesce(fp.cxl, ''S'') = ''S'' '
    else if (pTipoDoc = 2) then // Recebimentos realizados pelo Financeiro
      vSql := vSql + ' and fp.cxl = ''N'' ';
  end;

  if pCodigoOpCxl > 0 then
    vSql := vSql + ' and fp.op_cxl = ' + IntToStr(pCodigoOpCxl);

  if pCodigoUsuario > 0 then
    vSql := vSql + ' and fp.operador = ' + IntToStr(pCodigoUsuario);

  vSql := vSql + ' and fp.cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa) +
    ' group by fp.cod_controle, ct.nome_ctrl, ct.nao_gera_finan';

  Result := montaSelect(vSql, StrToDate(pDataIni), StrToDate(pDataFim));

end;

{ TPrestacoesImpAuto }

constructor TPrestacoesImpAuto.create;
begin
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsPrest);
  buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);

  vLoteCxl := TLoteCxlImp.create;
end;

destructor TPrestacoesImpAuto.Destroy;
begin
  vLoteCxl.Free;
  vLoteCxl := nil;

  inherited;
end;

function TPrestacoesImpAuto._abrePrestacoes(pLoteCxl, pCodigoUnificada: Integer): Boolean;
var
  vSql: string;
begin
  vSql := vSql + 'select * from controle_creditos' +
    ' where lote_cxl = ' + IntToStr(pLoteCxl) +
    ' and prcss is null';

  if vDadosIni.vEmp.vFinanceiroUnificado then
    vSql := vSql + ' and cod_emp_mult = ' + IntToStr(pCodigoUnificada)
  else
    vSql := vSql + ' and codigo_emp = ' + vDadosIni.codEmpresa;

  vSql := vSql + ' order by codigo_ctrl';

  Result := montaSelect(vSql);
end;

function TPrestacoesImpAuto._abrePrestacoes(pDataIni, pDataFim: string;
  pCodigoOpCxl, pCodigoUnificada: Integer): Boolean;
var
  vSql: string;
begin
  vSql := 'select cod_cliente, nome_c, data_rec_c, data_venc_c, dia_cxl, vl_rq_pg_cxl, op_cxl, cod_cred, codigo_emp, cod_emp_mult, ' +
    ' codigo_ctrl, n_doc_c, n_doc_v, tp_doc_v, valor_c, ' +
    ' lote_cxl, tp_rec_cxl, prcss, historico_c from controle_creditos' +
    ' where dia_cxl >= :dataIni and dia_cxl <= :dataFim and prcss is null';

  if vDadosIni.vEmp.vFinanceiroUnificado then
    vSql := vSql + ' and cod_emp_mult = ' + IntToStr(pCodigoUnificada)
  else
    vSql := vSql + ' and codigo_emp = ' + vDadosIni.codEmpresa;

  if pCodigoOpCxl > 0 then
    vSql := vSql + ' and op_cxl = ' + IntToStr(pCodigoOpCxl);

  vSql := vSql + ' order by nome_c';

  Result := montaSelect(vSql, StrToDate(pDataIni), StrToDate(pDataFim));

end;

{ TFechDiaCxlImpAuto }

constructor TFechDiaCxlImpAuto.create;
begin
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsFecDCxl);
  buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TFechDiaCxlImpAuto._abreDiaCxl(pDataIni, pDataFim: string;
  pCodigoOpCxl, pCodigoUnificada: Integer): Boolean;
var
  vSql: string;
begin
  // select do dia no caixa auxiliar na empresa unificada
  vSql := 'select * from fecd_cxl' +
    ' fd where fd.dia_f_cxl >= :diaInicial and fd.dia_f_cxl <= :diaFinal and fd.codigo_emp = ' +
    vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa);

  if pCodigoOpCxl > 0 then
    vSql := vSql + ' and fd.op_cxl = ' + IntToStr(pCodigoOpCxl);

  Result := montaSelect(vSql, StrToDate(pDataIni), StrToDate(pDataFim));

end;

function TFechDiaCxlImpAuto._verificarCaixaAberto(pDataIni, pDataFim: string;
  pCodigoOpCxl, pCodigoUnificada: Integer): Boolean;
var
  vSql, vMensagem: string;
  vCodUsuario: Integer;
  vdiaCXL: TDateTime;
begin
  vSql := ' select fd.n_mov_cxl, fd.dia_f_cxl, fd.codigo_emp, fd.op_cxl, col.nome_vendedor, senhas.usuario, fd.status_cxl from fecd_cxl fd ' +
  	' inner join colaborador col on fd.op_cxl = col.cod_vendedor and fd.codigo_emp = col.cod_empresa ' +
    ' inner join senhas on fd.op_cxl = senhas.codigo and fd.codigo_emp = senhas.cod_empresa ' +
    ' inner join senhas_erp on senhas_erp.usuario = senhas.usuario and senhas_erp.cod_empresa = senhas.cod_empresa and senhas_erp.cod_aplicativo = 3' +
    ' where fd.dia_f_cxl >= :diaInicial and fd.dia_f_cxl <= :diaFinal and fd.codigo_emp = ' +
    vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa) +
    ' and fd.status_cxl is null ';

  if pCodigoOpCxl > 0 then
    vSql := vSql + ' and fd.op_cxl = ' + IntToStr(pCodigoOpCxl);

  vSql := vSql + 
    ' order by fd.dia_f_cxl, col.nome_vendedor, senhas.usuario ';

  buscas.Close;
  buscas.SQL.Text := vSql;
  buscas.ParamByName('diaInicial').AsDate := StrToDate(pDataIni);
  buscas.ParamByName('diaFinal').AsDate := StrToDate(pDataFim);
  buscas.Open;
  buscas.FetchAll;

  Result := buscas.IsEmpty;

  vMensagem := 'Favor fechar o dia do caixa auxiliar: ' +
  	FormatDateTime('dd/mm/yyyy', buscas.FieldByName('dia_f_cxl').AsDateTime) + #13 + #13;
  vCodUsuario := 0;
  vdiaCXL := 0;

  buscas.First;
  while not buscas.Eof do
  begin
    if (vdiaCXL > 0) and (vdiaCXL <> buscas.FieldByName('dia_f_cxl').AsDateTime) then
      Break;
      
    if (vCodUsuario > 0) and (vCodUsuario <> buscas.FieldByName('op_cxl').AsInteger) then
      vMensagem := vMensagem + ')' + #13
    else if (vCodUsuario > 0) and (vCodUsuario = buscas.FieldByName('op_cxl').AsInteger) then
      vMensagem := vMensagem + '/' + trim(buscas.FieldByName('usuario').AsString);

    if (vCodUsuario = 0) or (vCodUsuario <> buscas.FieldByName('op_cxl').AsInteger) then
      vMensagem := vMensagem +
        IntToStr(buscas.FieldByName('op_cxl').AsInteger) + ' - ' + trim(buscas.FieldByName('nome_vendedor').AsString) +
        ' (' + trim(buscas.FieldByName('usuario').AsString);

    vCodUsuario := buscas.FieldByName('op_cxl').AsInteger;
    vdiaCXL := buscas.FieldByName('dia_f_cxl').AsDateTime;

    buscas.Next;
  end;
  vMensagem := vMensagem + ')' + #13;
  
  if not Result then
	  Application.MessageBox(pchar(vMensagem), 'Atenção', MB_OK + MB_ICONWARNING);

end;

{ TPContasImp }

constructor TPContasImp.create;
begin
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsPCont);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
  buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);
end;

function TPContasImp._abrirPContas(pNumerosIn: string): Boolean;
begin

  Result := montaSelect('select * from p_contas p where p.n_conta_plc in ' + pNumerosIn);

end;

function TPContasImp._abrirPContas(pNContaPLC: Real): Boolean;
begin

  Result := montaSelect('select * from p_contas p where p.n_conta_plc = ' +
    vDadosIni.trocaVirgulaPorPonto(Format('%0.6f', [pNContaPLC])));

  if dataSet.IsEmpty then
  begin
    Result := False;
    Application.MessageBox(pchar('Conta N°: ' + FloatToStr(pNContaPLC) +
      ' não encontrada no plano de contas'),
      'Atenção', 0 + 64);
    registraErro('Conta N°: ' + FloatToStr(pNContaPLC) + ' não encontrada no plano de contas');
  end
  else
    Result := True;

end;

{ TControleChequeImp }

constructor TControleChequeImp.create;
begin
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsCh);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
  buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);

  fN_CONTA_PLC := 0;
  fCODIGO_CTRL := 0;
  fCOD_CLIENTE := 0;
  fN_DOC_V := 0;
  fCOD_CLI_TERC := 0;
  fCODIGO_VEND := 0;
  fCODIGO_CH := 0;
  fUS_CAD := 0;
  fCOD_EMP_MULT := 0;
  fNOME_CH := '';
  fRAZAO := '';
  fHISTORICO_CH := '';
  fTP_DOC_V := '';
  fN_CH := '';
  fAGENCIA := '';
  fCONTA := '';
  fBANCO := '';
  fID_BANCO := '';
  fNOME_TERC := '';
  fTIP_CNT := '';
  fCPFCGC := '';
  fDATA_REC := 0;
  fDTORIGINAL_CH := 0;
  fDATA_VENC := 0;
  fDATA_VENDA := 0;
  fVALOR_CH := 0;   
  fVL_BAIXA_COMISSAO := 0;
  fVL_BAIXA_COMISSAO_GER := 0;
  fVL_CONTABIL := 0;
end;

function TControleChequeImp._abreControleCheque: boolean;
begin
  Result := montaSelect('select * from controle_Cheque where codigo_ch = 0 and ' +
    ' codigo_emp = ' + vDadosIni.codEmpresa);
end;

function TControleChequeImp._efetuarLancamento(pListaClBarrarDesbarrar: TStringList): boolean;
var
  I: Integer;
begin
  if not dataSet.Active then
    montaSelect('select * from CONTROLE_CHEQUE WHERE CODIGO_CH = 0 AND CODIGO_EMP = ' +
      vDadosIni.codEmpresa);

  dataSet.Insert;

  dataSet.FieldByName('CODIGO_CH').AsInteger := Gencodigo('CONTROLE_CHEQUE',
    dtmImportPDVFinan.SpIncCodigo, vDadosIni.codEmpresa);
  vDadosIni.hw_registra_estatistica('CONTROLE_CHEQUE');
  dataSet.FieldByName('N_CONTA_PLC').AsFloat := fN_CONTA_PLC;
  dataSet.FieldByName('CODIGO_CTRL').AsInteger := fCODIGO_CTRL;
  dataSet.FieldByName('COD_CLIENTE').AsInteger := fCOD_CLIENTE;
  dataSet.FieldByName('N_DOC_V').AsInteger := fN_DOC_V;
  dataSet.FieldByName('COD_CLI_TERC').AsInteger := fCOD_CLI_TERC;
  dataSet.FieldByName('CODIGO_VEND').AsInteger := fCODIGO_VEND;
  dataSet.FieldByName('NOME_CH').AsString := fNOME_CH;
  dataSet.FieldByName('RAZAO').AsString := fRAZAO;
  dataSet.FieldByName('HISTORICO_CH').AsString := fHISTORICO_CH;
  dataSet.FieldByName('TP_DOC_V').AsString := fTP_DOC_V;
  dataSet.FieldByName('N_CH').AsString := fN_CH;
  dataSet.FieldByName('AGENCIA').AsString := fAGENCIA;
  dataSet.FieldByName('CONTA').AsString := fCONTA;
  dataSet.FieldByName('BANCO').AsString := fBANCO;
  dataSet.FieldByName('ID_BANCO').AsString := fID_BANCO;
  dataSet.FieldByName('NOME_TERC').AsString := fNOME_TERC;
  dataSet.FieldByName('TIP_CNT').AsString := fTIP_CNT;
  dataSet.FieldByName('CPFCGC').AsString := fCPFCGC;
  dataSet.FieldByName('DATA_REC').AsDateTime := fDATA_REC;
  dataSet.FieldByName('DTORIGINAL_CH').AsDateTime := fDTORIGINAL_CH;
  dataSet.FieldByName('DATA_VENC').AsDateTime := fDATA_VENC;
  dataSet.FieldByName('DATA_VENDA').AsDateTime := fDATA_VENDA;
  dataSet.FieldByName('VALOR_CH').AsCurrency := fVALOR_CH;
  if fLOTE_ENT > 0 then
    dataSet.FieldByName('LOTE_ENT').AsInteger := fLOTE_ENT;
  dataSet.FieldByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
  dataSet.FieldByName('COD_EMP_MULT').AsInteger := vDadosIni.retornoPorCondicao((vDadosIni.vEmp.vFinanceiroUnificado) and (fCOD_EMP_MULT > 0), fCOD_EMP_MULT, StrToInt(vDadosIni.codEmpresa));
  if fUS_CAD > 0 then
    dataSet.FieldByName('US_CAD').AsInteger := fUS_CAD
  else
    dataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;

  if vDadosIni.vEmp.vUsarComissaoPorRecebimentoProporcional = 'S' then
  begin
    dataSet.FieldByName('VL_BAIXA_COMISSAO').AsCurrency := fVL_BAIXA_COMISSAO;
    dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').AsCurrency := fVL_BAIXA_COMISSAO_GER;
  end;
  dataSet.FieldByName('VL_CONTABIL').AsCurrency := vDadosIni.StrToFloatFormat(fVL_CONTABIL, 2);

  fCODIGO_CH := dataSet.FieldByName('CODIGO_CH').AsInteger;

  dataSet.Post;

  if not Apply then
    raiseExceptionCreate('Erro no processamento. Consulte o erros.log','');
//  dataSet.ApplyUpdates(-1);

	if ((vDadosIni.vCliente.Barramento.vBarraAutomaticamenteAposVencCrediario = 'S')
      and (vDadosIni.vCliente.Barramento.vCodigoBarrado > 0))
    or ((vDadosIni.vCliente.Barramento.vDesbarraAutomaticamenteAposQuitCrediario = 'S')
      and (vDadosIni.vCliente.Barramento.vCodigoDesbarrado > 0)) then
  begin
    if Assigned(pListaClBarrarDesbarrar)
    	and (dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
    begin
      if (vDadosIni.vEmp.vFinanceiroUnificado)
        and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
      begin
        if trim(dataSet.FieldByName('CPFCGC').AsString) <> '' then
          pListaClBarrarDesbarrar.Add(trim(dataSet.FieldByName('CPFCGC').AsString));
      end
      else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
        pListaClBarrarDesbarrar.Add(IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger));
    end;
  end;

  fCOD_EMP_MULT := 0;
  fN_CONTA_PLC := 0;
  fCODIGO_CTRL := 0;
  fCOD_CLIENTE := 0;
  fN_DOC_V := 0;
  fCOD_CLI_TERC := 0;
  fCODIGO_VEND := 0;
  fUS_CAD := 0;
  fNOME_CH := '';
  fRAZAO := '';
  fHISTORICO_CH := '';
  fTP_DOC_V := '';
  fN_CH := '';
  fAGENCIA := '';
  fCONTA := '';
  fBANCO := '';
  fID_BANCO := '';
  fNOME_TERC := '';
  fTIP_CNT := '';
  fCPFCGC := '';
  fDATA_REC := 0;
  fDTORIGINAL_CH := 0;
  fDATA_VENC := 0;
  fDATA_VENDA := 0;
  fVALOR_CH := 0;
  fVL_BAIXA_COMISSAO := 0;
  fVL_BAIXA_COMISSAO_GER := 0;
  fVL_CONTABIL := 0;
end;

{ TControleCreditosImp }

constructor TControleCreditosImp.create;
begin
  if dtmImportPDVFinan = nil then
    dtmImportPDVFinan := TdtmImportPDVFinan.Create(dtmImportPDVFinan);
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsControleCreditos);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
  buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);
  buscasControleCreditos := TIBQuery(dtmImportPDVFinan.qrControleCreditos);

  buscas.Close;
  buscasControleCreditos.Close;

  buscas.Transaction								:= transacao;
  buscasControleCreditos.Transaction  		:= transacao;

  fN_CONTA_PLC := 0;
  fCODIGO_CTRL := 0;
  fCOD_CLIENTE := 0;
  fCODIGO_VEND := 0;
  fCODIGO_FUNC := 0;
  fCOD_CLI_TERC := 0;
  fCOD_CRED := 0;
  fUS_CAD := 0;
  fCOD_EMP_MULT := 0;
  fCOD_COBREBEM := 0;
  fNOSSO_NUMERO_BANCO := '';
  fNOME_C := '';
  fRAZAO := '';
  fTIPO_DOC_C := '';
  fHISTORICO_C := '';
  fTP_DOC_V := '';
  fN_DOC_V := 0;
  fNPARCELA := 0;
  fQTDE_PARC := 0;
  fDEB_CRED := '';
  fCOD_BANDEIRA_ADM := 0;
  fDESC_BANDEIRA := '';
  fCOD_ADM := 0;
  fDESC_ADM := '';
  fDEPENDENTE := '';
  fN_DOC_C := '';
  fTIP_CNT := '';
  fN_AUT_CART := '';
  fN_DOCNSU_ADM := '';
  fCOD_TERMINAL_ADM := '';
  fNOME_TERC := '';
  fCPFCGC := '';
  fDATA_REC_C := 0;
  fDTORIGINAL_C := 0;
  fDATA_VENC_C := 0;
  fDATA_VENDA := 0;
  fVALOR_C := 0;
  fVALOR_LIQUIDO := 0;
  fLOTE_QUIT := 0;
  fDATQ_C := 0;
  fLOTE_ENT := 0;
  fVL_BAIXA_COMISSAO := 0;
  fVL_BAIXA_COMISSAO_GER := 0;
  fVL_CONTABIL := 0;
  vValor_C_Anterior_Parcial := 0;
  vValor_C_Anterior_Parcial_Zerado := False;
  vValor_Contabil_BX := 0;

end;

function TControleCreditosImp._abreControleCreditos(pCodCred: Integer): boolean;
begin
  Result := montaSelect('select * from controle_creditos where cod_cred = ' + IntToStr(pCodCred) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa);
end;

function TControleCreditosImp._efetuarLancamento(pListaClBarrarDesbarrar: TStringList): boolean;
var
	I: Integer;
begin
  if not dataSet.Active then
    montaSelect('select * from CONTROLE_CREDITOS WHERE COD_CRED = 0 AND CODIGO_EMP = ' +
      vDadosIni.codEmpresa);

  dataSet.Insert;

  dataSet.FieldByName('COD_CRED').AsInteger := Gencodigo('CONTROLE_CREDITOS',
    dtmImportPDVFinan.SpIncCodigo, vDadosIni.codEmpresa);
  vDadosIni.hw_registra_estatistica('CONTROLE_CREDITOS');
  dataSet.FieldByName('N_CONTA_PLC').AsFloat := fN_CONTA_PLC;
  dataSet.FieldByName('CODIGO_CTRL').AsInteger := fCODIGO_CTRL;
  dataSet.FieldByName('COD_CLIENTE').AsInteger := fCOD_CLIENTE;
  dataSet.FieldByName('CODIGO_VEND').AsInteger := fCODIGO_VEND;
  dataSet.FieldByName('CODIGO_FUNC').AsInteger := fCODIGO_FUNC;
  dataSet.FieldByName('COD_CLI_TERC').AsInteger := fCOD_CLI_TERC;
  dataSet.FieldByName('COD_COBREBEM').AsInteger := fCOD_COBREBEM;
  dataSet.FieldByName('NOSSO_NUMERO_BANCO').AsString := fNOSSO_NUMERO_BANCO;
  dataSet.FieldByName('NOME_C').AsString := fNOME_C;
  dataSet.FieldByName('RAZAO').AsString := fRAZAO;
  dataSet.FieldByName('TIPO_DOC_C').AsString := fTIPO_DOC_C;
  dataSet.FieldByName('HISTORICO_C').AsString := fHISTORICO_C;
  dataSet.FieldByName('TP_DOC_V').AsString := fTP_DOC_V;
  dataSet.FieldByName('N_DOC_V').AsInteger := fN_DOC_V;
  if Trim(fDEPENDENTE) <> '' then
    dataSet.FieldByName('DEPENDENTE').AsString := fDEPENDENTE;
  dataSet.FieldByName('N_DOC_C').AsString := fN_DOC_C;
  dataSet.FieldByName('TIP_CNT').AsString := fTIP_CNT;
  dataSet.FieldByName('N_AUT_CART').AsString := fN_AUT_CART;
  dataSet.FieldByName('N_DOCNSU_ADM').AsString := fN_DOCNSU_ADM;
  dataSet.FieldByName('COD_TERMINAL_ADM').AsString := fCOD_TERMINAL_ADM;
  dataSet.FieldByName('DESC_TERMINAL_ADM').AsString := fDESC_TERMINAL_ADM;
  dataSet.FieldByName('NPARCELA').AsInteger := fNPARCELA;
  dataSet.FieldByName('QTDE_PARC').AsInteger := fQTDE_PARC;
  dataSet.FieldByName('DEB_CRED').AsString := fDEB_CRED;
  dataSet.FieldByName('COD_BANDEIRA_ADM').AsInteger := fCOD_BANDEIRA_ADM;
  dataSet.FieldByName('DESC_BANDEIRA').AsString := fDESC_BANDEIRA;
  if fCOD_ADM > 0 then
  begin
    dataSet.FieldByName('COD_ADM').AsInteger := fCOD_ADM;
    dataSet.FieldByName('DESC_ADM').AsString := trim(fDESC_ADM);
  end;
  dataSet.FieldByName('NOME_TERC').AsString := fNOME_TERC;
  dataSet.FieldByName('CPFCGC').AsString := fCPFCGC;
  dataSet.FieldByName('DATA_REC_C').AsDateTime := fDATA_REC_C;
  dataSet.FieldByName('DTORIGINAL_C').AsDateTime := fDTORIGINAL_C;
  dataSet.FieldByName('DATA_VENC_C').AsDateTime := fDATA_VENC_C;
  dataSet.FieldByName('DATA_VENDA').AsDateTime := fDATA_VENDA;
  dataSet.FieldByName('VALOR_C').AsCurrency := fVALOR_C;
  dataSet.FieldByName('VALOR_LIQUIDO').AsCurrency := fVALOR_LIQUIDO;
  if fLOTE_ENT > 0 then
    dataSet.FieldByName('LOTE_ENT').AsInteger := fLOTE_ENT;
  dataSet.FieldByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
  dataSet.FieldByName('COD_EMP_MULT').AsInteger := vDadosIni.retornoPorCondicao((vDadosIni.vEmp.vFinanceiroUnificado) and (fCOD_EMP_MULT > 0), fCOD_EMP_MULT, StrToInt(vDadosIni.codEmpresa));
  if fUS_CAD > 0 then
    dataSet.FieldByName('US_CAD').AsInteger := fUS_CAD
  else
    dataSet.FieldByName('US_CAD').AsInteger := vDadosIni.vCodUsuario;

  if vDadosIni.vEmp.vUsarComissaoPorRecebimentoProporcional = 'S' then
  begin
    dataSet.FieldByName('VL_BAIXA_COMISSAO').AsCurrency := fVL_BAIXA_COMISSAO;
    dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').AsCurrency := fVL_BAIXA_COMISSAO_GER;
  end;
  dataSet.FieldByName('VL_CONTABIL').AsCurrency := vDadosIni.StrToFloatFormat(fVL_CONTABIL, 2);

  fCOD_CRED := dataSet.FieldByName('COD_CRED').AsInteger;

  dataSet.Post;

  if not Apply then
    raiseExceptionCreate('Erro no processamento. Consulte o erros.log','');
//  dataSet.ApplyUpdates(-1);

  if ((vDadosIni.vCliente.Barramento.vBarraAutomaticamenteAposVencCrediario = 'S')
      and (vDadosIni.vCliente.Barramento.vCodigoBarrado > 0))
    or ((vDadosIni.vCliente.Barramento.vDesbarraAutomaticamenteAposQuitCrediario = 'S')
      and (vDadosIni.vCliente.Barramento.vCodigoDesbarrado > 0)) then
  begin
    if Assigned(pListaClBarrarDesbarrar)
    	and (dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
    begin
      if (vDadosIni.vEmp.vFinanceiroUnificado)
        and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
      begin
        if trim(dataSet.FieldByName('CPFCGC').AsString) <> '' then
          pListaClBarrarDesbarrar.Add(trim(dataSet.FieldByName('CPFCGC').AsString));
      end
      else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
        pListaClBarrarDesbarrar.Add(IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger));
    end;
  end;

  fN_CONTA_PLC := 0;
  fCODIGO_CTRL := 0;
  fCOD_CLIENTE := 0;
  fCODIGO_VEND := 0;
  fCODIGO_FUNC := 0;
  fCOD_CLI_TERC := 0;
  fUS_CAD := 0;
  fCOD_EMP_MULT := 0;
  fCOD_COBREBEM := 0;
  fNOSSO_NUMERO_BANCO := '';
  fNOME_C := '';
  fRAZAO := '';
  fTIPO_DOC_C := '';
  fHISTORICO_C := '';
  fTP_DOC_V := '';
  fN_DOC_V := 0;
  fNPARCELA := 0;
  fQTDE_PARC := 0;
  fDEB_CRED := '';
  fCOD_BANDEIRA_ADM := 0;
  fDESC_BANDEIRA := '';
  fCOD_ADM := 0;
  fDESC_ADM := '';
  fDEPENDENTE := '';
  fN_DOC_C := '';
  fTIP_CNT := '';
  fN_AUT_CART := '';
  fN_DOCNSU_ADM := '';
  fCOD_TERMINAL_ADM := '';
  fDESC_TERMINAL_ADM := '';
  fNOME_TERC := '';
  fCPFCGC := '';
  fDATA_REC_C := 0;
  fDTORIGINAL_C := 0;
  fDATA_VENC_C := 0;
  fDATA_VENDA := 0;
  fVALOR_C := 0;
  fVALOR_LIQUIDO := 0;
  fLOTE_QUIT := 0;
  fDATQ_C := 0;
  fLOTE_ENT := 0;
  fVL_BAIXA_COMISSAO := 0;
  fVL_BAIXA_COMISSAO_GER := 0;
  fVL_CONTABIL := 0;
end;

procedure TControleCreditosImp._registrarBaixaCredito(
	pValorBaixa: Currency;    
  pValorDoRecibo: Currency;
  pBaixaTotalouParcial: string;
  pListaClBarrarDesbarrar: TStringList);
var
  vGerarComissao: Boolean;
  vCodBaixaCredito: Integer;
  vCodMax: Integer;
begin
  buscas.Close;
  buscas.SQL.Text := 'select GERAR_COMISSAO from controles' +
    ' where codigo_ctrl = ' + IntToStr(dataSet.FieldByName('CODIGO_CTRL').AsInteger) +
    ' and codigo_emp = ' + vDadosIni.codEmpresa;
  buscas.Open;

  vGerarComissao := Trim(buscas.FieldByName('GERAR_COMISSAO').AsString) <> 'N';

  vCodBaixaCredito := GenCodigo('BAIXA_CREDITOS', buscas,
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
      dataSet.FieldByName('CODIGO_EMP').AsString, vDadosIni.codEmpresa));

  vCodMax := 0;
  if vDadosIni.vEmp.vFinanceiroUnificado then
  begin
    buscas.Close;
    buscas.SQL.Text := ' select max(seq_bxcred) from baixa_creditos ' +
      ' where codigo_emp = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
        dataSet.FieldByName('CODIGO_EMP').AsString, vDadosIni.codEmpresa);
    buscas.Open;

    vCodMax := buscas.FieldByName('max').AsInteger + 1;

    if (vCodMax > vCodBaixaCredito) then
    begin
      vCodBaixaCredito := vCodMax;

      buscas.Close;
      buscas.SQL.Text := ' update codigo set valor = ' + IntToStr(vCodMax) +
        ' where tabela = ''BAIXA_CREDITOS'' ' +
        ' and cod_empresa = ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
          dataSet.FieldByName('CODIGO_EMP').AsString, vDadosIni.codEmpresa);
      buscas.ExecSQL;
    end;
  end;

  buscas.Close;
  buscas.SQL.Text :=
    ' INSERT INTO BAIXA_CREDITOS (SEQ_BXCRED, COD_CRED, CODIGO_CTRL, COD_CLIENTE, ' +
    ' NOME_C, RAZAO, DATA_REC_C, TIPO_DOC_C, HISTORICO_C, DATA_VENC_C, VALOR_C, DATQ_C, ' +
    ' NATL_C, LOTE, OBS_C, TP_DOC_V, N_DOC_V, N_DOC_C, COD_CLI_TERC, NOME_TERC, ' +
    ' CODIGO_EMP, COD_EMP_MULT, TIP_CNT, CODIGO_VEND, TIP_BAIXA, DATA_BAIXA, ' +
    ' DATA_VENDA, VALOR_QUITADO, VL_RECIBO, VALOR_CORR, TP_OPERACAO, LOTE_QUIT, ' +
    ' VALOR_DESC, VALOR_ACRESC, JUROS_COB, DIA_CXL, STATUS_CXL_RQ, VL_RQ_PG_CXL, OP_CXL, ' +
    ' CPFCGC, LOTE_CXL, COD_TERMINAL, NSERIEECF, COONAOFISCAL, OCORRENCIABANCARIA, ' +
    ' LOTE_ENT, DT_BAIXA_COMISSAO, VL_BAIXA_COMISSAO, VL_BAIXA_COMISSAO_GER,US_BX, ' +
    ' VL_CONTABIL, COD_CONTRAPARTIDA, COD_EMP_LOTE)' +
    ' VALUES (:SEQ_BXCRED, :COD_CRED, :CODIGO_CTRL, :COD_CLIENTE, ' +
    ' :NOME_C, :RAZAO, :DATA_REC_C, :TIPO_DOC_C, :HISTORICO_C, :DATA_VENC_C, :VALOR_C, :DATQ_C, ' +
    ' :NATL_C, :LOTE, :OBS_C, :TP_DOC_V, :N_DOC_V, :N_DOC_C, :COD_CLI_TERC, :NOME_TERC, ' +
    ' :CODIGO_EMP, :COD_EMP_MULT, :TIP_CNT, :CODIGO_VEND, :TIP_BAIXA, :DATA_BAIXA, ' +
    ' :DATA_VENDA, :VALOR_QUITADO, :VL_RECIBO, :VALOR_CORR, :TP_OPERACAO, :LOTE_QUIT, ' +
    ' :VALOR_DESC, :VALOR_ACRESC, :JUROS_COB, :DIA_CXL, :STATUS_CXL_RQ, :VL_RQ_PG_CXL, :OP_CXL, ' +
    ' :CPFCGC, :LOTE_CXL, :COD_TERMINAL, :NSERIEECF, :COONAOFISCAL, :OCORRENCIABANCARIA, ' +
    ' :LOTE_ENT, :DT_BAIXA_COMISSAO, :VL_BAIXA_COMISSAO, :VL_BAIXA_COMISSAO_GER, :US_BX, ' +
    ' :VL_CONTABIL, :COD_CONTRAPARTIDA, :COD_EMP_LOTE)';

  buscas.ParamByName('SEQ_BXCRED').value := vCodBaixaCredito;
  buscas.ParamByName('COD_CRED').Value := dataSet.FieldByName('COD_CRED').Value;
  buscas.ParamByName('CODIGO_CTRL').Value := dataSet.FieldByName('CODIGO_CTRL').Value;
  buscas.ParamByName('COD_CLIENTE').Value := dataSet.FieldByName('COD_CLIENTE').Value;
  buscas.ParamByName('NOME_C').Value := dataSet.FieldByName('NOME_C').Value;
  buscas.ParamByName('RAZAO').Value := dataSet.FieldByName('RAZAO').Value;
  if dataSet.FieldByName('DATA_REC_C').AsDateTime > 0 then
    buscas.ParamByName('DATA_REC_C').AsDate := dataSet.FieldByName('DATA_REC_C').AsDateTime;
  buscas.ParamByName('TIPO_DOC_C').Value := dataSet.FieldByName('TIPO_DOC_C').Value;
  buscas.ParamByName('HISTORICO_C').Value := dataSet.FieldByName('HISTORICO_C').Value;
  if dataSet.FieldByName('DATA_VENC_C').AsDateTime > 0 then
    buscas.ParamByName('DATA_VENC_C').AsDate := dataSet.FieldByName('DATA_VENC_C').AsDateTime;
  if (pBaixaTotalouParcial = 'P') and (vValor_C_Anterior_Parcial_Zerado) then
    buscas.ParamByName('VALOR_C').AsFloat := 0
  else if (pBaixaTotalouParcial = 'P') and (vValor_C_Anterior_Parcial > 0) then
    buscas.ParamByName('VALOR_C').AsFloat := vValor_C_Anterior_Parcial
  else if pBaixaTotalouParcial = 'P' then
    buscas.ParamByName('VALOR_C').AsFloat := dataSet.FieldByName('VALOR_C').AsFloat + pValorBaixa
  else
    buscas.ParamByName('VALOR_C').AsFloat := dataSet.FieldByName('VALOR_C').AsFloat;
  if fDATQ_C > 0 then
    buscas.ParamByName('DATQ_C').AsDate := fDATQ_C;
  buscas.ParamByName('NATL_C').Value := dataSet.FieldByName('NATL_C').Value;
  buscas.ParamByName('LOTE').Value := dataSet.FieldByName('LOTE').Value;
  buscas.ParamByName('OBS_C').Value := dataSet.FieldByName('OBS_C').Value;
  buscas.ParamByName('TP_DOC_V').Value := dataSet.FieldByName('TP_DOC_V').Value;
  buscas.ParamByName('N_DOC_V').Value := dataSet.FieldByName('N_DOC_V').Value;
  buscas.ParamByName('N_DOC_C').Value := dataSet.FieldByName('N_DOC_C').Value;
  buscas.ParamByName('COD_CLI_TERC').Value := dataSet.FieldByName('COD_CLI_TERC').Value;
  buscas.ParamByName('NOME_TERC').Value := dataSet.FieldByName('NOME_TERC').Value;
  buscas.ParamByName('CODIGO_EMP').Value := dataSet.FieldByName('CODIGO_EMP').Value;
  buscas.ParamByName('COD_EMP_MULT').Value := dataSet.FieldByName('COD_EMP_MULT').Value;
  buscas.ParamByName('TIP_CNT').Value := dataSet.FieldByName('TIP_CNT').Value;
  buscas.ParamByName('CODIGO_VEND').Value := dataSet.FieldByName('CODIGO_VEND').Value;
  buscas.ParamByName('TIP_BAIXA').Value := dataSet.FieldByName('TIP_BAIXA').Value;
  if dataSet.FieldByName('DATA_BAIXA').AsDateTime > 0 then
    buscas.ParamByName('DATA_BAIXA').AsDate := dataSet.FieldByName('DATA_BAIXA').AsDateTime;
  if dataSet.FieldByName('DATA_VENDA').AsDateTime > 0 then
    buscas.ParamByName('DATA_VENDA').AsDate := dataSet.FieldByName('DATA_VENDA').AsDateTime;
  buscas.ParamByName('VALOR_QUITADO').Value := pValorBaixa;
  buscas.ParamByName('VL_RECIBO').Value := pValorDoRecibo;
  buscas.ParamByName('VALOR_CORR').Value := dataSet.FieldByName('VALOR_CORR').Value;
  buscas.ParamByName('TP_OPERACAO').Value := pBaixaTotalouParcial;
  buscas.ParamByName('LOTE_QUIT').Value := fLOTE_QUIT;
  buscas.ParamByName('VALOR_DESC').Value := dataSet.FieldByName('VALOR_DESC').Value;
  buscas.ParamByName('VALOR_ACRESC').Value := dataSet.FieldByName('VALOR_ACRESC').Value;
  buscas.ParamByName('JUROS_COB').Value := dataSet.FieldByName('JUROS_COB').Value;
  if dataSet.FieldByName('DIA_CXL').AsDateTime > 0 then
    buscas.ParamByName('DIA_CXL').AsDate := dataSet.FieldByName('DIA_CXL').AsDateTime;
  buscas.ParamByName('STATUS_CXL_RQ').Value := dataSet.FieldByName('STATUS_CXL_RQ').Value;
  buscas.ParamByName('VL_RQ_PG_CXL').Value := dataSet.FieldByName('VL_RQ_PG_CXL').Value;
  buscas.ParamByName('OP_CXL').Value := dataSet.FieldByName('OP_CXL').Value;
  buscas.ParamByName('CPFCGC').Value := dataSet.FieldByName('CPFCGC').Value;
  buscas.ParamByName('LOTE_CXL').Value := dataSet.FieldByName('LOTE_CXL').Value;
  buscas.ParamByName('COD_TERMINAL').Value := dataSet.FieldByName('COD_TERMINAL').Value;
  buscas.ParamByName('NSERIEECF').Value := dataSet.FieldByName('NSERIEECF').Value;
  buscas.ParamByName('COONAOFISCAL').Value := dataSet.FieldByName('COONAOFISCAL').Value;
  buscas.ParamByName('LOTE_ENT').Value := dataSet.FieldByName('LOTE_ENT').Value;
  buscas.ParamByName('OCORRENCIABANCARIA').Value := dataSet.FieldByName('OCORRENCIABANCARIA').Value;
  buscas.ParamByName('US_BX').AsInteger := vDadosIni.vCodUsuario;
  buscas.ParamByName('VL_CONTABIL').AsFloat := vValor_Contabil_BX;
  buscas.ParamByName('COD_CONTRAPARTIDA').Value := dataSet.FieldByName('COD_CONTRAPARTIDA').Value;
  buscas.ParamByName('COD_EMP_LOTE').Value := dataSet.FieldByName('COD_EMP_LOTE').Value;
  if vGerarComissao then
  begin
    if dataSet.FieldByName('DATA_BAIXA').AsDateTime > 0 then
      buscas.ParamByName('DT_BAIXA_COMISSAO').AsDateTime :=
        dataSet.FieldByName('DATA_BAIXA').AsDateTime
    else
      buscas.ParamByName('DT_BAIXA_COMISSAO').AsDateTime := fDATQ_C;

    if vDadosIni.vEmp.vUsarComissaoPorRecebimentoProporcional <> 'S' then
    begin

      if pBaixaTotalouParcial = 'P' then
        buscas.ParamByName('VL_BAIXA_COMISSAO').AsFloat := pValorBaixa
      else
        buscas.ParamByName('VL_BAIXA_COMISSAO').AsFloat := dataSet.FieldByName('VALOR_C').AsFloat;

    end
    else if Trim(dataSet.FieldByName('DIA_CXL').AsString) = '' then
    begin
      if buscas.ParamByName('VALOR_QUITADO').AsFloat <
        buscas.ParamByName('VALOR_C').AsFloat then
      begin
        buscas.ParamByName('VL_BAIXA_COMISSAO').AsFloat := dataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat /
          dataSet.FieldByName('VALOR_ORIGINAL').AsFloat * buscas.ParamByName('VALOR_QUITADO').AsFloat;
        buscas.ParamByName('VL_BAIXA_COMISSAO_GER').AsFloat := dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').AsFloat /
          dataSet.FieldByName('VALOR_ORIGINAL').AsFloat * buscas.ParamByName('VALOR_QUITADO').AsFloat;
      end
      else
      begin
        buscas.ParamByName('VL_BAIXA_COMISSAO').AsFloat := dataSet.FieldByName('VL_BAIXA_COMISSAO').AsFloat /
          dataSet.FieldByName('VALOR_ORIGINAL').AsFloat * buscas.ParamByName('VALOR_C').AsFloat;
        buscas.ParamByName('VL_BAIXA_COMISSAO_GER').AsFloat := dataSet.FieldByName('VL_BAIXA_COMISSAO_GER').AsFloat /
          dataSet.FieldByName('VALOR_ORIGINAL').AsFloat * buscas.ParamByName('VALOR_C').AsFloat;
      end;
    end;
  end
  else
    buscas.ParamByName('VL_BAIXA_COMISSAO').AsFloat := 0;

  buscas.Prepare;
  buscas.ExecSQL;

  if ((vDadosIni.vCliente.Barramento.vBarraAutomaticamenteAposVencCrediario = 'S')
      and (vDadosIni.vCliente.Barramento.vCodigoBarrado > 0))
    or ((vDadosIni.vCliente.Barramento.vDesbarraAutomaticamenteAposQuitCrediario = 'S')
      and (vDadosIni.vCliente.Barramento.vCodigoDesbarrado > 0)) then
  begin
    if Assigned(pListaClBarrarDesbarrar)
    	and (dataSet.FieldByName('COD_CLIENTE').AsInteger > 0) then
    begin
      if (vDadosIni.vEmp.vFinanceiroUnificado)
        and (vDadosIni.vEmp.vCodigoUnificadora = StrToInt(vDadosIni.codEmpresa)) then
      begin
        if trim(dataSet.FieldByName('CPFCGC').AsString) <> '' then
          pListaClBarrarDesbarrar.Add(trim(dataSet.FieldByName('CPFCGC').AsString));
      end
      else if (not vDadosIni.vEmp.vFinanceiroUnificado) then
        pListaClBarrarDesbarrar.Add(IntToStr(dataSet.FieldByName('COD_CLIENTE').AsInteger));
    end;
  end;

  fLOTE_QUIT := 0;
  fDATQ_C := 0;
  vValor_C_Anterior_Parcial := 0;
  vValor_C_Anterior_Parcial_Zerado := False;
  vValor_Contabil_BX := 0;
end;

{ TLoteCxlImp }

constructor TLoteCxlImp.create;
begin
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsLoteCxl);
  buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TLoteCxlImp._abreLoteCxl(pDataIni, pDataFim: string;
  pCodigoOpCxl, pCodigoUnificada: Integer): Boolean;
var
  vSql: string;
begin
  // select dos lotes no caixa auxiliar da empresa unificada
  vSql := 'select * from lote_cxl ' +
    ' where data_l_cxl >= :dataIni and data_l_cxl <= :dataFim' +
    ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(pCodigoUnificada), vDadosIni.codEmpresa);

  if pCodigoOpCxl > 0 then
    vSql := vSql + ' and op_cxl = ' + IntToStr(pCodigoOpCxl);

  Result := montaSelect(vSql, StrToDate(pDataIni), StrToDate(pDataFim));

end;

{ TDetalhesRecebimentoCX }

constructor TDetalhesRecebimentoCX.Create;
begin
  fTransacao := TIBTransaction.Create(Application);
  fTransacao.DefaultDatabase := dtmAtivo.bancoHw;
  fTransacao.Params.Add('read_committed');
  fTransacao.Params.Add('rec_version');
  fTransacao.Params.Add('nowait');

  fLancamentos := TIBQuery.Create(Application);
  fLancamentos.Database := fTransacao.DefaultDatabase;
  fLancamentos.Transaction := fTransacao;

  fCheques := TIBQuery.Create(Application);
  fCheques.Database := fTransacao.DefaultDatabase;
  fCheques.Transaction := fTransacao;

  fCreditos := TIBQuery.Create(Application);
  fCreditos.Database := fTransacao.DefaultDatabase;
  fCreditos.Transaction := fTransacao;

  fDSLancamentos := TDataSource.Create(Application);
  fDSLancamentos.DataSet := fLancamentos;
  fDSLancamentos.AutoEdit := False;

  fDSCheques := TDataSource.Create(Application);
  fDSCheques.DataSet := fCheques;
  fDSCheques.AutoEdit := False;

  fDSCreditos := TDataSource.Create(Application);
  fDSCreditos.DataSet := fCreditos;
  fDSCreditos.AutoEdit := False;

  //  Isso nao vai dar certo, criar as querys mesmo. Pois tem os titulos dos campos e tal.

end;

destructor TDetalhesRecebimentoCX.Destroy;
begin
  fDSLancamentos.Free;
  fDSLancamentos := nil;

  fDSCheques.Free;
  fDSCheques := nil;

  fDSCreditos.Free;
  fDSCreditos := nil;

  fLancamentos.Free;
  fLancamentos := nil;

  fCheques.Free;
  fCheques := nil;

  fCreditos.Free;
  fCreditos := nil;

  fTransacao.Free;
  fTransacao := nil;
end;

function TDetalhesRecebimentoCX._abreDetalhesRecebimentosModalidade(
	pLOTE_QUIT: Integer;
  pDATA_LOTE: TDateTime): Boolean;
var
  vValorLancamentos, vValorCheques, vValorCreditos: Currency;
begin

  if Self = nil then
    Create;

{$REGION 'selects'}
  fLancamentos.Close;
  fLancamentos.SQL.Text :=
    ' select ' +
    ' case when ((select result from pos(''RECIBOS ANTE'', l.historico_l)) <> 0) then ' +
    '  			 ''RECIBOS ANTECIPADOS'' ' +
    ' 		 when ((select result from pos(''RECIBOS ATEN'', l.historico_l)) <> 0) then ' +
    '        ''RECIBOS ANTECIPADOS'' ' +
    ' 		 else ' +
    '        c.nome_ctrl ' +
    ' end "Controle", ' +
    ' case when (hist.nrecibo > 0) then ' +
    '        hist.valor_baixa ' +
    '      else ' +
    '        l.valor_l ' +
    ' end "Valor", ' +
    ' l.data "Data Lançamento", ' +
    ' case when ((select result from pos(''RECIBOS ANTE'', l.historico_l)) <> 0) then ' +
    '         ''RECIBOS ANTECIPADOS'' || case when (hist.nrecibo > 0) then '' NUM '' || hist.nrecibo else '''' end ' +
    '      when ((select result from pos(''RECIBOS ATEN'', l.historico_l)) <> 0) then ' +
    '         ''RECIBOS ANTECIPADOS''  || case when (hist.nrecibo > 0) then '' NUM '' || hist.nrecibo else '''' end ' +
    '      else ' +
    '         l.historico_l ' +
    ' end "Histórico", ' +
    ' case when (hist.nrecibo > 0) then ' +
    '        hist.valor_baixa ' +
    '      else ' +
    ' 			 l.vl_contabil ' +
    '	end "Valor Contábil", ' +
    ' l.n_conta_plc "Nº Conta" ' +
    ' from lancamentos l ' +
    ' left join empresa emp on l.codigo_emp = emp.cod_empresa ' +
    ' inner join controles c on c.codigo_ctrl = l.codigo_ctrl and c.codigo_emp = l.codigo_emp ' +
    ' left join hist_rec hist on hist.lote_quit = l.lote_ent and hist.cod_empresa = l.codigo_emp and ((l.historico_l like ''%RECIBOS ANTE%'') or (l.historico_l like ''%RECIBOS ATEN%'')) ' +
    ' where ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	' (case when (emp.financeiro_unificado = ''S'') then ' +
      '				  emp.codigo_unificadora ' +
      '				else ' +
      '					l.codigo_emp end) ',
    	'	l.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pDATA_LOTE > 0),
      ' and l.data = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', pDATA_LOTE)), '') +
    ' and l.lote_ent = ' + IntToStr(pLOTE_QUIT) +
    ' and l.tipo_l = ''E'' ';
  fLancamentos.Open;

  fCheques.Close;
  fCheques.SQL.Text :=
    ' select c.nome_ctrl "Controle", ' +
    ' cc.valor_ch "Valor", ' +
    ' cc.nome_ch "Cliente", ' +
    ' cc.status_ch "Status", ' +
    ' cc.data_venc "Vencimento", ' +
    ' cc.historico_ch "Histórico", ' +
    ' cc.n_ch "Nº Cheque", ' +
    ' cc.data_rec "Data Cadastro", ' +
    ' cc.n_conta_plc "Nº Conta" ' +
    ' from controle_cheque cc ' +
    ' left join empresa emp on cc.codigo_emp = emp.cod_empresa ' +
    ' inner join controles c on c.codigo_ctrl = cc.codigo_ctrl and c.codigo_emp = cc.codigo_emp ' +
    ' where ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	' (case when (emp.financeiro_unificado = ''S'') then ' +
      '				  emp.codigo_unificadora ' +
      '				else ' +
      '					cc.codigo_emp end) ',
    	' cc.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pDATA_LOTE > 0),
      ' and cc.datq_ch = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', pDATA_LOTE)), '') +
    ' and cc.lote_ent = ' + IntToStr(pLOTE_QUIT);
  fCheques.Open;

  fCreditos.Close;
  fCreditos.SQL.Text :=
    ' select c.NOME_CTRL "Controle", ' +
    ' cx.VALOR_C "Valor", ' +
    ' cx.NOME_C "Cliente", ' +
    ' cx.STATUS_C "Status", ' +
    '	cx.DATA_VENC_C "Vencimento", ' +
    ' cx.HISTORICO_C "Histórico", ' +
    ' cx.N_DOC_C "Nº Documento", ' +
    ' cx.DATA_REC_C "Data Cadastro", ' +
    ' cx.TIPO_DOC_C "Tipo documento", ' +
    ' cx.n_conta_plc "Nº Conta" ' +
    ' from controle_creditos cx ' +
    ' left join empresa emp on cx.codigo_emp = emp.cod_empresa ' +
    ' inner join controles c on c.codigo_ctrl = cx.codigo_ctrl and c.codigo_emp = cx.codigo_emp ' +
    ' where ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	' (case when (emp.financeiro_unificado = ''S'') then ' +
      '				  emp.codigo_unificadora ' +
      '				else ' +
      '					cx.codigo_emp end) ',
    	'	  cx.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pDATA_LOTE > 0),
      ' and cx.datq_c = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', pDATA_LOTE)), '') +
    ' and cx.lote_ent = ' + IntToStr(pLOTE_QUIT) +
    ' union ' +
    ' select c.NOME_CTRL "Controle", ' +
    ' bx.VALOR_QUITADO "Valor", ' +
    ' bx.NOME_C "Cliente", ' +
    ' ''QUITADO'' "Status", ' +
    ' bx.DATA_VENC_C "Vencimento", ' +
    ' bx.HISTORICO_C "Histórico", ' +
    ' bx.N_DOC_C "Nº Documento", ' +
    ' bx.DATA_REC_C "Data Cadastro", ' +
    ' bx.TIPO_DOC_C "Tipo documento", ' +
    ' 0 "Nº Conta" ' +
    ' from baixa_creditos bx ' +
    ' left join empresa emp on bx.codigo_emp = emp.cod_empresa ' +
    ' inner join controles c on c.codigo_ctrl = bx.codigo_ctrl and c.codigo_emp = bx.codigo_emp ' +
    ' where ' + vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
    	' (case when (emp.financeiro_unificado = ''S'') then ' +
      '				  emp.codigo_unificadora ' +
      '				else ' +
      '					bx.codigo_emp end) ',
    	'		bx.codigo_emp ') + ' = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen((vDadosIni.vEmp.vFinanceiroUnificado) and (pDATA_LOTE > 0),
      ' and bx.datq_c = ' + Quotedstr(FormatDateTime('mm/dd/yyyy', pDATA_LOTE)), '') +
    ' and bx.lote_ent = ' + IntToStr(pLOTE_QUIT) +
    ' and bx.tip_baixa = ''P'' ';
  fCreditos.Open;

  TFloatField(fLancamentos.FieldByName('Valor')).DisplayFormat := '##0.00';
  TFloatField(fLancamentos.FieldByName('Valor Contábil')).DisplayFormat := '##0.00';
  TFloatField(fCheques.FieldByName('Valor')).DisplayFormat := '##0.00';
  TFloatField(fCreditos.FieldByName('Valor')).DisplayFormat := '##0.00';

{$ENDREGION}

{$REGION 'somas'}

  vValorLancamentos := 0;
  fLancamentos.First;
  while not fLancamentos.Eof do
  begin
    vValorLancamentos := vValorLancamentos + fLancamentos.FieldByName('Valor').AsFloat;
    fLancamentos.Next;
  end;

  vValorCheques := 0;
  fCheques.First;
  while not fCheques.Eof do
  begin
    vValorCheques := vValorCheques + fCheques.FieldByName('Valor').AsFloat;
    fCheques.Next;
  end;

  vValorCreditos := 0;
  fCreditos.First;
  while not fCreditos.Eof do
  begin
    vValorCreditos := vValorCreditos + fCreditos.FieldByName('Valor').AsFloat;
    fCreditos.Next;
  end;

{$ENDREGION}

{$REGION 'criando e apresentado formulario'}

  Application.CreateForm(TfrmDetalhesRecebimentoModalidade, frmDetalhesRecebimentoModalidade);
  frmDetalhesRecebimentoModalidade.pnLanc.Caption := 'Total: ' + Format('%n', [vValorLancamentos]);
  frmDetalhesRecebimentoModalidade.pnCh.Caption := 'Total: ' + Format('%n', [vValorCheques]);
  frmDetalhesRecebimentoModalidade.pnCred.Caption := 'Total: ' + Format('%n', [vValorCreditos]);

  frmDetalhesRecebimentoModalidade.gridLancamento.DataSource := fDSLancamentos;
  frmDetalhesRecebimentoModalidade.gridCheques.DataSource := fDSCheques;
  frmDetalhesRecebimentoModalidade.gridCreditos.DataSource := fDSCreditos;

  frmDetalhesRecebimentoModalidade.ShowModal;

{$ENDREGION}

  fLancamentos.Close;
  fCheques.Close;
  fCreditos.Close;

end;

{ TRelQuitacaoCreditos }

constructor TRelQuitacaoCreditos.create;
begin
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsRelQuitarCreditos);
  buscas := TIBQuery(dtmImportPDVFinan.qrRelQuitarCreditos);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TRelQuitacaoCreditos._AbrirRelQuitCredito: boolean;
begin
  Result := montaselect('SELECT C.COD_COBREBEM, CR.NOME_CTRL, C.BANCO , C.CODIGOAGENCIA, C.NUMEROCONTACORRENTE, C.CODIGOCEDENTE,	C.DESCRICAO, CC.* FROM CONTROLE_CREDITOS CC '
    + ' LEFT JOIN BOLETAS B ON B.NOSSO_NUMERO_BANCO = CC.NOSSO_NUMERO_BANCO AND B.COD_EMPRESA = CC.' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, 'COD_EMP_MULT', 'CODIGO_EMP') // AND B.N_DOC_BOL = CC.N_DOC_C AND B.COD_EMPRESA = CC.CODIGO_EMP '
    + ' LEFT JOIN COBREBEM C ON C.COD_COBREBEM = B.COD_COBREBEM AND C.COD_EMPRESA = B.COD_EMPRESA '
    + ' LEFT JOIN CONTROLES CR ON CR.CODIGO_CTRL = C.CODIGO_CTRL AND CR.CODIGO_EMP =  C.COD_EMPRESA '
    + ' WHERE CC.DATA_RETORNO_QUITACAO IS NOT NULL AND CC.DATA_RETORNO_QUITACAO between ' +
    Quotedstr(FormatDateTime('dd.mm.yyyy', strtodate(_DataInicio)) + ' 00:00:00') +
    ' AND ' + Quotedstr(FormatDateTime('dd.mm.yyyy', strtodate(_DataFim)) + ' 23:59:59') +
    ' AND CC.DATQ_C IS NOT NULL' +
    ' AND CC.CODIGO_EMP =' + vDadosIni.codEmpresa + ' ORDER BY' +
    vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, ' CC.COD_EMP_MULT,', '') + 
    ' C.COD_COBREBEM');
end;

{ TContasBancariasImpPDV }

constructor TContasBancariasImpPDV.create;
begin
  DataSet := TClientDataSet(dtmImportPDVFinan.cdsContasBanc);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
  Buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);
end;

function TContasBancariasImpPDV._selecionaContasBancarias(
  pCodigoCliente: Integer): Boolean;
begin
  Result := montaSelect('select cb.*, c.nome_cliente from contasbancarias cb' +
    ' inner join clientes c on c.cod_cliente = cb.cod_cliente and c.cod_empresa = cb.cod_empresa' +
    ' where cb.cod_cliente = ' + IntToStr(pCodigoCliente) + ' and cb.cod_empresa = ' +
    vDadosIni.codEmpresa);
end;


{ TTerminalAdmCartao_Imp }

constructor TTerminalAdmCartao_Imp.create;
begin
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsTermCartao);
  buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TTerminalAdmCartao_Imp._abreTerminais: boolean;
begin
  Result := montaSelect('select tc.* from terminal_cartao tc' +
    ' where tc.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and tc.ativo = 1');
end;

{ TNegativacaoCliente }

constructor TNegativacaoCliente.create(pTransacao: TIBTransaction; pDocs: string);
begin
  if dtmImportPDVFinan = nil then
    dtmImportPDVFinan := TdtmImportPDVFinan.Create(dtmImportPDVFinan);

  dados.codConta := 0;
  dados.codCliente := 0;
  fMsgErro := '';
  fDocs := pDocs;
  if fDocs = 'S1' then
    fTable := 'CONTROLE_CHEQUE'
  else
    fTable := 'CONTROLE_CREDITOS';

  buscas := TIBQuery(dtmImportPDVFinan.qrNegativacao);
  buscas.Transaction := pTransacao;

end;

function TNegativacaoCliente.executar: boolean;
var
  vSql, vTemp: string;
  vStringTmp: string;
  vCampoEmpresa: string;
begin
  Result := True;
  fMsgErro := '';

  try

    if vDadosIni.vEmp.vUsarBarramento <> 'S' then
      Exit;

    if dados.codCliente = 0 then
      Exit;

    if vDadosIni.vEmp.vCodigoBarrado = 0 then
      raiseExceptionCreate('Barramento automático ativado. Campo "Código Barrado" no Cadastro da empresa sem valor válido', '');

    if vDadosIni.vEmp.vCodigoDesbarrado = 0 then
      raiseExceptionCreate('Barramento automático ativado. Campo "Código Liberado" no Cadastro da empresa sem valor válido', '');

    if vDadosIni.vEmp.vFinanceiroUnificado then
      vCampoEmpresa := 'cod_emp_mult'
    else
      vCampoEmpresa := 'codigo_emp';

    if dados.acao = naDesnegativa then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select first 1 cc.codigo_ch from controle_cheque cc' +
        ' inner join controles c on cc.codigo_ctrl = c.codigo_ctrl and cc.codigo_emp = c.codigo_emp' +
        ' and c.barrar_automatico = ''S''' +
        ' where ((cc.status_ch is null) or (rtrim(cc.status_ch) = ''''))' +
        ' and cc.cod_cliente = ' + IntToStr(dados.codCliente) +
        ' and cc.' + vCampoEmpresa + ' = :cod_empresa';
      buscas.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, dados.codigoUnificada, StrToInt(vDadosIni.codEmpresa));
      buscas.Open;

      if not buscas.IsEmpty then
        Exit;

      buscas.Close;
      buscas.SQL.Text := 'select first 1 cc.cod_cred from controle_creditos cc' +
        ' inner join controles c on cc.codigo_ctrl = c.codigo_ctrl and cc.codigo_emp = c.codigo_emp' +
        ' and c.barrar_automatico = ''S''' +
        ' where ((cc.status_c is null) or (rtrim(cc.status_c) = ''''))' +
        ' and cc.cod_faturamento = ' + IntToStr(vDadosIni.vEmp.vCodigoBarrado) +
        ' and cc.cod_cliente = ' + IntToStr(dados.codCliente) +
        ' and cc.' + vCampoEmpresa + ' = :cod_empresa';
      buscas.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, dados.codigoUnificada, StrToInt(vDadosIni.codEmpresa));
      buscas.Open;

      if not buscas.IsEmpty then
        Exit;
    end;

    vSql := 'update clientes set codigo_faturamento = ';
    if dados.acao = naNegativar then
      vSql := vSql + IntToStr(vDadosIni.vEmp.vCodigoBarrado)
    else
      vSql := vSql + IntToStr(vDadosIni.vEmp.vCodigoDesbarrado);

    vSql := vSql +
      ' where cod_cliente = ' + IntToStr(dados.codCliente) +
      ' and cod_empresa = ' + vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, IntToStr(dados.codigoUnificada), vDadosIni.codEmpresa);

    buscas.close;
    buscas.SQL.Text := vSql;
    buscas.ExecSQL;

    if dados.alterarConta then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select c.codigo_ctrl from controles c' +
        ' where c.barrar_automatico = ''S'' ' +
        ' and c.codigo_emp = ' + vDadosIni.codEmpresa; // cadastro de controles iguais entre as empresas unificadas nao precisa mudar o select
      buscas.Open;
      buscas.First;
      vStringTmp := '';
      while not buscas.Eof do
      begin
        vStringTmp := vStringTmp + '|' + IntToStr(buscas.FieldByName('codigo_ctrl').AsInteger) + '|';
        buscas.Next;
      end;
      vStringTmp := StringReplace(vStringTmp, '||', ',', [rfReplaceAll]);
      vStringTmp := StringReplace(vStringTmp, '|', '', [rfReplaceAll]);

      if Trim(vStringTmp) = '' then
        Exit;

      vSql := 'update controle_creditos set cod_faturamento = ';
      if dados.acao = naNegativar then
        vSql := vSql + IntToStr(vDadosIni.vEmp.vCodigoBarrado) +
          ', DATA_LOTE_NEG = (select current_d from sp_current_ts(' + vCampoEmpresa + ')), LOTE_NEG = GEN_ID(INC_COD_LOTENEG, 1)'
      else
        vSql := vSql + IntToStr(vDadosIni.vEmp.vCodigoDesbarrado) +
          ', DATA_DESBARRAMENTO = (select current_d from sp_current_ts(' + vCampoEmpresa + '))';
      vSql := vSql +
        ' where ' + vCampoEmpresa + ' = :cod_empresa' +
        ' and cod_cliente = ' + IntToStr(dados.codCliente) +
        ' and codigo_ctrl in (' + vStringTmp + ')';

      if (dados.codConta > 0) then
        vSql := vSql + ' and cod_cred = ' + IntToStr(dados.codConta);

      if (dados.loteQuit > 0) then
        vSql := vSql + ' and lote_quit = ' + IntToStr(dados.loteQuit);

      if dados.alterarContaStatus = nacsAbertas then
        vSql := vSql +  ' and ((status_c is null) or (status_c = ''''))'
      else if (dados.alterarContaStatus = nacsQuitadas) then
        vSql := vSql + ' and status_c = ''QUITADO'' and datq_c = :datq_c';
      if dados.acao = naDesnegativa then
        vSql := vSql + ' and cod_faturamento = ' + IntToStr(vDadosIni.vEmp.vCodigoBarrado);

      buscas.close;
      buscas.SQL.Text := vSql;
      if (dados.alterarContaStatus = nacsQuitadas) then
        buscas.ParamByName('datq_c').AsDate := vDadosIni.diaFFinanceiro + 1;
      buscas.ParamByName('cod_empresa').AsInteger := vDadosIni.retornoPorCondicao(vDadosIni.vEmp.vFinanceiroUnificado, dados.codigoUnificada, StrToInt(vDadosIni.codEmpresa));
      buscas.ExecSQL;
    end;

    if dados.acao = naNegativar then
      vTemp := 'BARRAR'
    else
      vTemp := 'DESBARRAR';

    vDadosIni.GravaAuditoria('CAR015', vTemp, vTemp + ' TIPO ' + FDocs +
      ' CLIENTE CODIGO ' + IntToStr(dados.codCliente), fTable, '', buscas);

    dados.codConta := 0;
    dados.codCliente := 0;
  except
    on E: exception do
    begin
      Result := False;
      fMsgErro := 'TNegativacaoCliente.executar:' + e.Message;
      registraErro('function TNegativacaoCliente.executar. Erro: ' + e.Message);
    end;
  end;
end;

{ TUnificarEmpresa }

function TUnificarEmpresa.abreEmpresasUnificadas: Boolean;
begin
 Result := montaSelect(' SELECT COD_EMPRESA, ' +
  ' (COALESCE(IDENTIFICACAO_EMP, '''') ||'' - ''|| COALESCE(CNPJ_EMP, '''')) IDENTIFICACAO_EMP, ' +
  ' CGC_EMP FROM EMPRESA ' +
  ' WHERE CODIGO_UNIFICADORA = ' + vDadosIni.codEmpresa +
  ' AND FINANCEIRO_UNIFICADO = ''S'' AND COD_EMPRESA <> ' + vDadosIni.codEmpresa +
  ' UNION ' +
  ' SELECT COD_EMPRESA, ' +
  ' (COALESCE(IDENTIFICACAO_EMP, '''') ||'' - ''|| COALESCE(CNPJ_EMP, '''')) IDENTIFICACAO_EMP, ' +
  ' CGC_EMP FROM EMPRESA ' +
  ' WHERE CODIGO_UNIFICADORA IS NULL AND COD_EMPRESA <> ' + vDadosIni.codEmpresa +
  ' ORDER BY 1 ');

end;

function TUnificarEmpresa.UnificarFinanceiro: boolean;
var
 BuscasOrig: TIBQuery;
 vCodigo, vCodEmpresa, vNumLoteQuitacao: Integer;
 vValor: Double;
begin
  try
    Result := true;

    if Application.MessageBox(PChar('Tem certeza que deseja unificar o financeiro da empresa ' +
       '"' + trim(dataSet.FieldByName('IDENTIFICACAO_EMP').AsString) + '" ?'),
       'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
      exit;

    BuscasOrig := TIBQuery.Create(Application);
    BuscasOrig.Database := buscas.Database;
    BuscasOrig.Transaction := buscas.Transaction;

    if fTempControles.IsEmpty then
      exit;

    fTempControles.First;
    while not fTempControles.Eof do
    begin
      if fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger <= 0 then
      begin
        Application.MessageBox(PChar('Controle da Unificadora não informado. linha ' + IntToStr(fTempControles.RecNo)), 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
        if FrmUnificarEmpresas.EditMoeda2.CanFocus then
          FrmUnificarEmpresas.EditMoeda2.SetFocus;
        Result := false;
        exit;
      end;
      fTempControles.Next;
    end;
    fTempControles.First;

    AplicarLancamentos(Unificar);

  except
  on E: Exception do
  begin
     result := False;
     RollBackTransacao;
     Application.MessageBox(pchar('Erro ao aplicar alterações. Erro: ' + e.Message ), 'Atenção', 0 + 64);
     registraErro('function  TUnificarEmpresa.UnificarFinanceiro. Erro: ' + e.Message);
   end;
  end;
end;

function TUnificarEmpresa.AplicarLancamentos(pTipo: vOP): boolean;
var
 vCodigo, vNumLoteQuitacao: Integer;
 vExec: Boolean;
 vNCON_V_PROD, vNCON_C_PROD: Double;
 vControleTemp: string;
 vListaControle: TStringList;
 I: Integer;
 vSql: string;
 buscarUnificada: TIBQuery;
 vTemp: string;
 vTabCodLanc, vMaxCodLanc: Integer;
 vCodMaxBaixaCred: Integer;
begin
 try
   try
     Result := False;

     vContLig._AbrirContadeLigacao(True);

     buscas.Close;
     buscas.SQL.Text := ' select * from Cont_Lig where COD_EMP = :COD_EMP ';
     buscas.ParamByName('COD_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
     buscas.Open;

     // Testar contas de Ligação Empresa Unificadora
     if vContLig.dataSet.FieldByName('NCON_C_PROD').AsFloat <= 0 then
     begin
       Application.MessageBox('Nº da Conta de Compra Produtos Empresa Unificadora não definido no cadastro da empresa.',
         'Erro', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
       exit;
     end;

     if vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat <= 0 then
     begin
       Application.MessageBox('Nº da Conta de Venda Produtos Empresa Unificadora não definido no cadastro da empresa.',
         'Erro', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
       exit;
     end;

     buscas2.Close;
     buscas2.SQL.Text := ' SELECT * FROM P_CONTAS ' +
      ' WHERE N_CONTA_PLC = :N_CONTA_PLC ';
     buscas2.ParamByName('N_CONTA_PLC').AsFloat := vContLig.dataSet.fieldbyname('NCON_C_PROD').AsFloat;
     buscas2.Open;

     if (buscas2.IsEmpty) or (Buscas2.FieldByName('TIPO_PLC').AsString <> 'S') then
     begin
       Application.MessageBox(PChar('Plano de Contas não encontrado ou sua natureza não é de Saída' + #13 +
        'Nº da Conta de Compra Produtos: ' + vDadosIni.trocaVirgulaPorPonto(vContLig.dataSet.fieldbyname('NCON_C_PROD').asstring) + #13 +
        'Favor verificar no cadastro da empresa'),
        'Erro', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
       exit;
     end;

     buscas2.Close;
     buscas2.SQL.Text := ' SELECT * FROM P_CONTAS ' +
      ' WHERE N_CONTA_PLC = :N_CONTA_PLC ';
     buscas2.ParamByName('N_CONTA_PLC').AsFloat := vContLig.dataSet.fieldbyname('NCON_V_PROD').AsFloat;
     buscas2.Open;

     if (buscas2.IsEmpty) or (Buscas2.FieldByName('TIPO_PLC').AsString <> 'E') then
     begin
       Application.MessageBox(PChar('Plano de Contas não encontrado ou sua natureza não é de Entrada' + #13 +
        'Nº da Conta de Compra Produtos: ' + vDadosIni.trocaVirgulaPorPonto(vContLig.dataSet.fieldbyname('NCON_V_PROD').asstring) + #13 +
        'Favor verificar no cadastro da empresa'),
        'Erro', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
       exit;
     end;

     // Testar contas de Ligação Empresa Unifica
     if buscas.FieldByName('NCON_C_PROD').AsFloat <= 0 then
     begin
       Application.MessageBox('Nº da Conta de Compra Produtos Empresa Unificada não definido no cadastro da empresa.',
         'Erro', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
       exit;
     end;

     if buscas.FieldByName('NCON_V_PROD').AsFloat <= 0 then
     begin
       Application.MessageBox('Nº da Conta de Venda Produtos Empresa Unificada não definido no cadastro da empresa.',
         'Erro', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
       exit;
     end;

     vNCON_C_PROD := buscas.FieldByName('NCON_C_PROD').AsFloat;
     vNCON_V_PROD := buscas.FieldByName('NCON_V_PROD').AsFloat;

     buscas2.Close;
     buscas2.SQL.Text := ' SELECT * FROM P_CONTAS ' +
      ' WHERE N_CONTA_PLC = :N_CONTA_PLC ';
     buscas2.ParamByName('N_CONTA_PLC').AsFloat := buscas.fieldbyname('NCON_C_PROD').AsFloat;
     buscas2.Open;

     if (buscas2.IsEmpty) or (Buscas2.FieldByName('TIPO_PLC').AsString <> 'S') then
     begin
       Application.MessageBox(PChar('Plano de Contas não encontrado ou sua natureza não é de Saída' + #13 +
        'Nº da Conta de Compra Produtos: ' + vDadosIni.trocaVirgulaPorPonto(buscas.fieldbyname('NCON_C_PROD').asstring) + #13 +
        'Favor verificar no cadastro da empresa'),
        'Erro', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
       exit;
     end;

     buscas2.Close;
     buscas2.SQL.Text := ' SELECT * FROM P_CONTAS ' +
      ' WHERE N_CONTA_PLC = :N_CONTA_PLC ';
     buscas2.ParamByName('N_CONTA_PLC').AsFloat := buscas.fieldbyname('NCON_V_PROD').AsFloat;
     buscas2.Open;

     if (buscas2.IsEmpty) or (Buscas2.FieldByName('TIPO_PLC').AsString <> 'E') then
     begin
       Application.MessageBox(PChar('Plano de Contas não encontrado ou sua natureza não é de Entrada' + #13 +
        'Nº da Conta de Compra Produtos: ' + vDadosIni.trocaVirgulaPorPonto(buscas.fieldbyname('NCON_V_PROD').asstring) + #13 +
        'Favor verificar no cadastro da empresa'),
        'Erro', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
       exit;
     end;

     vExec := False;
     vDadosIni.vEmp.vFinanceiroUnificado := True;
     vDadosIni.vEmp.vCodigoUnificadora := StrToInt(vDadosIni.codEmpresa);

     if pTipo = Desunificar then
      if FrmUnificarEmpresas.RadioGroupReplicador.ItemIndex = 1 then
      begin
         if trim(FrmUnificarEmpresas.EditDataBase.Text) = '' then
         begin
          Application.MessageBox(PChar('Endereço remoto unificada não informado.'), 'Erro', MB_OK + MB_ICONERROR +  MB_DEFBUTTON1);
          if FrmUnificarEmpresas.EditDataBase.CanFocus then
           FrmUnificarEmpresas.EditDataBase.SetFocus;
          exit;
         end;
       try
         vDadosIni.abreStatusProcessamento('Testando conexão com o banco:', trim(FrmUnificarEmpresas.EditDataBase.Text));
         dtmImportPDVFinan.IBDatabaseUnificada.Connected := false;
         dtmImportPDVFinan.IBDatabaseUnificada.DatabaseName := trim(FrmUnificarEmpresas.EditDataBase.Text);
         dtmImportPDVFinan.IBDatabaseUnificada.Connected := true;
       finally
         vDadosIni.fechaStatusProcessamento;
       end;

       if not dtmImportPDVFinan.IBDatabaseUnificada.Connected then
       begin
         Application.MessageBox(PChar('Não foi possível conectar ao banco: ' +
          trim(FrmUnificarEmpresas.EditDataBase.Text) + #13 +
          'Favor conferir o endereço.'), 'Erro', MB_OK + MB_ICONERROR +  MB_DEFBUTTON1);
         if FrmUnificarEmpresas.EditDataBase.CanFocus then
          FrmUnificarEmpresas.EditDataBase.SetFocus;
         exit;
       end;
     end;

     if pTipo = Desunificar then
     begin
       buscas.Close;
       buscas.SQL.Text := ' select count(*) quant from empresa ' +
        ' where financeiro_unificado = :financeiro_unificado and codigo_unificadora = :codigo_unificadora ' +
        ' and cod_empresa <> :cod_empresa ';
       buscas.ParamByName('FINANCEIRO_UNIFICADO').AsString := 'S';
       buscas.ParamByName('CODIGO_UNIFICADORA').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas.Open;

       vExec := buscas.FieldByName('QUANT').AsInteger <= 1;
     end;

     if (pTipo = Unificar) or (vExec) then
     begin
       buscas.Close;
       buscas.SQL.Text := ' update empresa set financeiro_unificado = :financeiro_unificado, ' +
         ' codigo_unificadora = :codigo_unificadora where cod_empresa = :cod_empresa ';
       if pTipo = Unificar then
       begin
         buscas.ParamByName('FINANCEIRO_UNIFICADO').AsString := 'S';
         buscas.ParamByName('CODIGO_UNIFICADORA').AsInteger := StrToInt(vDadosIni.codEmpresa);
       end
       else
       begin
         buscas.ParamByName('FINANCEIRO_UNIFICADO').Value := Null;
         buscas.ParamByName('CODIGO_UNIFICADORA').Value := Null;
       end;
       buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas.Prepare;
       buscas.ExecSQL;
     end;

     buscas.Close;
     buscas.SQL.Text := ' update empresa set financeiro_unificado = :financeiro_unificado, ' +
       ' codigo_unificadora = :codigo_unificadora where cod_empresa = :cod_empresa ';
     if pTipo = Unificar then
     begin
       buscas.ParamByName('FINANCEIRO_UNIFICADO').AsString := 'S';
       buscas.ParamByName('CODIGO_UNIFICADORA').AsInteger := StrToInt(vDadosIni.codEmpresa);
     end
     else
     begin
       buscas.ParamByName('FINANCEIRO_UNIFICADO').Value := Null;
       buscas.ParamByName('CODIGO_UNIFICADORA').Value := Null;
     end;
     buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
     buscas.Prepare;
     buscas.ExecSQL;

     if pTipo = Unificar then
       vDadosIni.atualizarVariaveisEmpresa(Buscas);

     // Sicronizando controles
     if pTipo = Unificar then
     begin
       buscas2.Close;
       buscas2.SQL.Text := ' UPDATE CONTROLES SET ATIVO = 0 ' +
        ' WHERE CODIGO_EMP = :CODIGO_EMP_UNIFICADA ' +
        ' AND CODIGO_CTRL NOT IN (SELECT CODIGO_CTRL FROM CONTROLES WHERE CODIGO_EMP = :CODIGO_EMP_UNIFICADORA) ';
       buscas2.ParamByName('CODIGO_EMP_UNIFICADA').AsInteger := dataset.fieldbyname('COD_EMPRESA').AsInteger;
       buscas2.ParamByName('CODIGO_EMP_UNIFICADORA').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas2.ExecSQL;

       buscas2.Close;
       buscas2.SQL.Text := ' SELECT CODIGO_CTRL FROM CONTROLES ' +
        ' WHERE CODIGO_EMP = :CODIGO_EMP';
       buscas2.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
       buscas2.Open;
       Buscas2.FetchAll;

       buscas2.First;
       while not buscas2.Eof do
       begin
        Application.ProcessMessages;
        vDadosIni.abreStatusProcessamento('Sicronizando Controles:', IntToStr(buscas2.RecNo) + ' de ' + IntToStr(buscas2.RecordCount));
        vDadosIni.AtualizarControles(buscas, tInserir, buscas2.FieldByName('CODIGO_CTRL').AsInteger);

        buscas2.Next;
       end;
     end;
     vDadosIni.fechaStatusProcessamento;

     // Alterando controles (Creditos, Cheques, Contas a Pagar, Lancamentos, Cobrebem, Clientes)
     if pTipo = Unificar then
     begin
       try
         vDadosIni.abreStatusProcessamento('Atualizando Créditos, Cheques e Contas a pagar', '');
         AtualizarCampoAlterado(pTipo);
       finally
        vDadosIni.fechaStatusProcessamento;
       end;

       try
         fTempControles.First;
         while not fTempControles.Eof do
         begin
           Application.ProcessMessages;
           vDadosIni.abreStatusProcessamento('Alterando Controles: ', IntToStr(fTempControles.RecNo) + ' de ' + IntToStr(fTempControles.RecordCount));
           
           buscas.Close;
           buscas.SQL.Text := ' update controle_creditos set codigo_ctrl = :codigo_ctrl_novo, tipo_doc_c = :tipo_doc_c, alterado = :alterado ' +
            ' where codigo_ctrl = :codigo_ctrl and codigo_emp = :codigo_emp and datq_c is not null and alterado is null ';
           buscas.ParamByName('CODIGO_CTRL_NOVO').AsInteger := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
           buscas.ParamByName('TIPO_DOC_C').AsString := Copy(trim(fTempControles.FieldByName('CONTROLE_UNIFICADORA').AsString), 1, 15);
           buscas.ParamByName('CODIGO_CTRL').AsInteger := fTempControles.FieldByName('COD_CONTROLE').AsInteger;
           buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           buscas.ParamByName('ALTERADO').AsString := 'S';
           buscas.ExecSQL;

           buscas.Close;
           buscas.SQL.Text := ' update controle_cheque set codigo_ctrl = :codigo_ctrl_novo, alterado = :alterado ' +
            ' where codigo_ctrl = :codigo_ctrl and codigo_emp = :codigo_emp and datq_ch is not null and alterado is null ';
           buscas.ParamByName('CODIGO_CTRL_NOVO').AsInteger := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
           buscas.ParamByName('CODIGO_CTRL').AsInteger := fTempControles.FieldByName('COD_CONTROLE').AsInteger;
           buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           buscas.ParamByName('ALTERADO').AsString := 'S';
           buscas.ExecSQL;

           buscas.Close;
           buscas.SQL.Text := ' update contas_a_pagar set codigo_ctrl = :codigo_ctrl_novo, alterado = :alterado ' +
            ' where codigo_ctrl = :codigo_ctrl and codigo_emp = :codigo_emp and datq_ctp is not null and alterado is null ';
           buscas.ParamByName('CODIGO_CTRL_NOVO').AsInteger := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
           buscas.ParamByName('CODIGO_CTRL').AsInteger := fTempControles.FieldByName('COD_CONTROLE').AsInteger;
           buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           buscas.ParamByName('ALTERADO').AsString := 'S';
           buscas.ExecSQL;

           buscas.Close;
           buscas.SQL.Text := ' update lancamentos set codigo_ctrl = :codigo_ctrl_novo, alterado = :alterado ' +
            ' where codigo_ctrl = :codigo_ctrl and codigo_emp = :codigo_emp and alterado is null ';
           buscas.ParamByName('CODIGO_CTRL_NOVO').AsInteger := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
           buscas.ParamByName('CODIGO_CTRL').AsInteger := fTempControles.FieldByName('COD_CONTROLE').AsInteger;
           buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           buscas.ParamByName('ALTERADO').AsString := 'S';
           buscas.ExecSQL;

           buscas.Close;
           buscas.SQL.Text := ' update plano_pag set cod_controle = :codigo_ctrl_novo, alterado = :alterado ' +
            ' where cod_controle = :codigo_ctrl and cod_empresa = :codigo_emp and alterado is null ';
           buscas.ParamByName('CODIGO_CTRL_NOVO').AsInteger := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
           buscas.ParamByName('CODIGO_CTRL').AsInteger := fTempControles.FieldByName('COD_CONTROLE').AsInteger;
           buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           buscas.ParamByName('ALTERADO').AsString := 'S';
           buscas.ExecSQL;

           buscas.Close;
           buscas.SQL.Text := ' update baixa_creditos set codigo_ctrl = :codigo_ctrl_novo, alterado = :alterado ' +
            ' where codigo_ctrl = :codigo_ctrl and codigo_emp = :codigo_emp and alterado is null ';
           buscas.ParamByName('CODIGO_CTRL_NOVO').AsInteger := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
           buscas.ParamByName('CODIGO_CTRL').AsInteger := fTempControles.FieldByName('COD_CONTROLE').AsInteger;
           buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           buscas.ParamByName('ALTERADO').AsString := 'S';
           buscas.ExecSQL;

           buscas.Close;
           buscas.SQL.Text := ' update formpagamento set cod_controle = :codigo_ctrl_novo, alterado = :alterado ' +
            ' where cod_controle = :codigo_ctrl and cod_empresa = :codigo_emp and alterado is null ';
           buscas.ParamByName('CODIGO_CTRL_NOVO').AsInteger := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
           buscas.ParamByName('CODIGO_CTRL').AsInteger := fTempControles.FieldByName('COD_CONTROLE').AsInteger;
           buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           buscas.ParamByName('ALTERADO').AsString := 'S';
           buscas.ExecSQL;

           buscas.Close;
           buscas.SQL.Text := ' update boletas set cod_controle_cx = :codigo_ctrl_novo, alterado = :alterado ' +
            ' where cod_controle_cx = :codigo_ctrl and cod_empresa = :codigo_emp and alterado is null ';
           buscas.ParamByName('CODIGO_CTRL_NOVO').AsInteger := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
           buscas.ParamByName('CODIGO_CTRL').AsInteger := fTempControles.FieldByName('COD_CONTROLE').AsInteger;
           buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           buscas.ParamByName('ALTERADO').AsString := 'S';
           buscas.ExecSQL;

           buscas.Close;
           buscas.SQL.Text := ' update cobrebem set codigo_ctrl = :codigo_ctrl_novo, alterado1 = :alterado ' +
            ' where codigo_ctrl = :codigo_ctrl and cod_empresa = :codigo_emp and alterado1 is null ';
           buscas.ParamByName('CODIGO_CTRL_NOVO').AsInteger := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
           buscas.ParamByName('CODIGO_CTRL').AsInteger := fTempControles.FieldByName('COD_CONTROLE').AsInteger;
           buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           buscas.ParamByName('ALTERADO').AsString := 'S';
           buscas.ExecSQL;

           buscas.Close;
           buscas.SQL.Text := ' update cobrebem set codigo_ctrl_ent = :codigo_ctrl_novo, alterado2 = :alterado ' +
            ' where codigo_ctrl_ent = :codigo_ctrl and cod_empresa = :codigo_emp and alterado2 is null ';
           buscas.ParamByName('CODIGO_CTRL_NOVO').AsInteger := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
           buscas.ParamByName('CODIGO_CTRL').AsInteger := fTempControles.FieldByName('COD_CONTROLE').AsInteger;
           buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           buscas.ParamByName('ALTERADO').AsString := 'S';
           buscas.ExecSQL;

           buscas.Close;
           buscas.SQL.Text := ' update despesas_veic set cod_controle = :codigo_ctrl_novo, alterado = :alterado ' +
            ' where cod_controle = :codigo_ctrl and cod_empresa = :codigo_emp and alterado is null ';
           buscas.ParamByName('CODIGO_CTRL_NOVO').AsInteger := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
           buscas.ParamByName('CODIGO_CTRL').AsInteger := fTempControles.FieldByName('COD_CONTROLE').AsInteger;
           buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           buscas.ParamByName('ALTERADO').AsString := 'S';
           buscas.ExecSQL;

           fTempControles.Next;
         end;
       finally
          AtualizarCampoAlterado(pTipo);
       end;
       vDadosIni.fechaStatusProcessamento;
     end
     else
     begin
       try
         vDadosIni.abreStatusProcessamento('Atualizando Créditos, Cheques e Contas a pagar', '');
         AtualizarCampoAlterado(pTipo);
       finally
        vDadosIni.fechaStatusProcessamento;
       end;
     end;

     // Sicronizando formas de pagamento por cliente
     if pTipo = Unificar then
     begin
       buscas2.Close;
       buscas2.SQL.Text := ' select distinct cod_empresa, controles_fp from clientes ' +
        ' where cod_empresa = :cod_empresa and (trim(coalesce(controles_fp, '''')) <> '''') ';
       buscas2.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
       buscas2.Open;
       buscas2.FetchAll;

       while not buscas2.Eof do
       begin
        Application.ProcessMessages;
        vDadosIni.abreStatusProcessamento('Sicronizando formas de pagamento por cliente:',IntToStr(Buscas2.RecNo) + ' de ' + IntToStr(Buscas2.RecordCount));
        
        vControleTemp := Copy(trim(buscas2.FieldByName('CONTROLES_FP').AsString), 2, length(trim(buscas2.FieldByName('CONTROLES_FP').AsString)) - 2);
        vListaControle := Split(vControleTemp, ',');

        vControleTemp := '';
        for I := 0 to vListaControle.Count - 1 do
        begin
          try
            fTempControles.Filter := ' COD_CONTROLE = ' + vListaControle[I];
            fTempControles.Filtered := true;
            if fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger > 0 then
              vControleTemp := vControleTemp + IntToStr(fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger) + ',';
          finally
            fTempControles.Filtered := false;
          end;
        end;

        vControleTemp := Copy(trim(vControleTemp), 1, length(trim(vControleTemp)) - 1);
        buscas.Close;
        buscas.SQL.Text := ' update clientes set controles_fp = :controles_fp_novo ' +
         ' where cod_empresa = :cod_empresa and controles_fp = :controles_fp ';
        buscas.ParamByName('CONTROLES_FP').AsString := buscas2.FieldByName('CONTROLES_FP').AsString;
        buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
        buscas.ParamByName('CONTROLES_FP_NOVO').AsString := '(' + trim(vControleTemp) + ')';
        buscas.ExecSQL;

        buscas2.Next;
       end;
     end;
     vDadosIni.fechaStatusProcessamento;

     // Gerando numero de lote
     buscas.Close;
     buscas.SQL.Text := ' SELECT GEN_ID(INC_L_QUIT, 1) lote FROM rdb$Database';
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

     buscarDiaFinanceiroFechado(dataSet.FieldByName('COD_EMPRESA').AsInteger);
     vDadosIni.definirDiaFinanceiroFechado(buscas);

     //Gravar Auditoria
     fTempLancamentos.First;
     while not fTempLancamentos.Eof do
     begin
       Application.ProcessMessages;
       if pTipo = Unificar then
         vDadosIni.GravaAuditoria('BAS351', 'UNIFICAR '+ trim(fTempLancamentos.FieldByName('TIPO').AsString),
         'Emp:' + IntToStr(fTempLancamentos.FieldByName('COD_EMPRESA').AsInteger) + ' ' +
         'Ctr:' + IntToStr(fTempLancamentos.FieldByName('COD_CONTROLE').AsInteger) +
         '.' + trim(fTempLancamentos.FieldByName('CONTROLE').AsString) + ' ' +
         'Tp: ' + trim(fTempLancamentos.FieldByName('DOCS').AsString) + ' ' +
         'Barrar: ' + trim(fTempLancamentos.FieldByName('BARRAR_AUTOMATICO').AsString) + ' ' +
         'Valor: ' + FloatToStr(vDadosIni.StrToFloatFormat(fTempLancamentos.FieldByName('VALOR').AsCurrency, 2)), 'LANCAMENTOS', IntToStr(vNumLoteQuitacao), buscas)
       else
         vDadosIni.GravaAuditoria('BAS351', 'DESUNIFICAR '+ trim(fTempLancamentos.FieldByName('TIPO').AsString),
         'Emp:' + IntToStr(fTempLancamentos.FieldByName('COD_EMPRESA').AsInteger) + ' ' +
         'Ctr:' + IntToStr(fTempLancamentos.FieldByName('COD_CONTROLE').AsInteger) +
         '.' + trim(fTempLancamentos.FieldByName('CONTROLE').AsString) + ' ' +
         'Tp: ' + trim(fTempLancamentos.FieldByName('DOCS').AsString) + ' ' +
         'Barrar: ' + trim(fTempLancamentos.FieldByName('BARRAR_AUTOMATICO').AsString) + ' ' +
         'Valor: ' + FloatToStr(vDadosIni.StrToFloatFormat(fTempLancamentos.FieldByName('VALOR').AsCurrency, 2)), 'LANCAMENTOS', IntToStr(vNumLoteQuitacao), buscas);
       fTempLancamentos.Next;
     end;
     fTempLancamentos.First;

     // Lancamentos do Saldo
     if pTipo = Unificar then
     begin
       try
         vTabCodLanc := 0;
         vMaxCodLanc := 0;

         SqlOpen(' select max(coalesce(cod_lanc, 0)) valor from lancamentos ' +
           ' where codigo_emp = ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger));
         if not buscas.IsEmpty then
           vMaxCodLanc := buscas.FieldByName('valor').AsInteger;

         SqlOpen(' select coalesce(valor, 0) valor from codigo ' +
         	 ' where tabela = ''LANCAMENTOS'' ' +
           ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger));
         if not buscas.IsEmpty then
         begin
           vTabCodLanc := buscas.FieldByName('valor').AsInteger;
           
           buscas.Close;
           buscas.SQL.Text := ' UPDATE CODIGO SET VALOR = :VALOR ' +
           	 ' WHERE TABELA = :TABELA AND COD_EMPRESA = :COD_EMPRESA; ';
           buscas.ParamByName('TABELA').AsString := 'LANCAMENTOS';
           buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           buscas.ParamByName('VALOR').AsInteger := vMaxCodLanc;
           buscas.ExecSQL;
         end
         else
         begin
           buscas.Close;
           buscas.SQL.Text := ' INSERT INTO CODIGO (TABELA, COD_EMPRESA, CODIGO, VALOR, ATIVO) ' +
           	' VALUES (:TABELA, :COD_EMPRESA, (SELECT GEN_ID(GENCODIGO, 1) FROM RDB$DATABASE), ' +
            ' :VALOR, 1); ';
           buscas.ParamByName('TABELA').AsString := 'LANCAMENTOS';
           buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           buscas.ParamByName('VALOR').AsInteger := vMaxCodLanc;
           buscas.ExecSQL;
         end;

         fTempLancamentos.Filter := ' trim(tipo) = ''SALDOS''';
         fTempLancamentos.Filtered := true;
         fTempLancamentos.First;

         while not fTempLancamentos.Eof do
         begin
           // Lançamento de Saída
           Application.ProcessMessages;
           vDadosIni.abreStatusProcessamento('Lançamento do Saldo: ' ,IntToStr(fTempLancamentos.RecNo) + ' de ' + IntToStr(fTempLancamentos.RecordCount));

           try
             fTempControles.Filter := ' COD_CONTROLE = ' + IntToStr(fTempLancamentos.FieldByName('COD_CONTROLE').AsInteger);
             fTempControles.Filtered := true;

             if pTipo = Unificar then
               vLancL.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat
             else
               vLancL.N_CONTA_PLC := vNCON_V_PROD;

             vLancL.CODIGO_CTRL := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
             vLancL.HISTORICO_L := Trim(copy('SAIDA DE '+Trim(fTempControles.FieldByName('CONTROLE_UNIFICADORA').AsString)+
               ' REF. A UNIFICACAO DO CAIXA', 1, 100));
             if pTipo = Unificar then
             begin
               vLancL.DATA := diaFFinanceiroUnificada + 1;
               vLancL.DTREFERENCIA := diaFFinanceiroUnificada + 1;
               vLancL.DATQ_L := diaFFinanceiroUnificada + 1;
             end
             else
             begin
               vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
               vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
    //           vLancL.DATQ_L := vDadosIni.diaFFinanceiro + 1;
             end;
             vLancL.TIPO_L := 'S';//Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
             vLancL.VALOR_L := fTempLancamentos.FieldByName('VALOR').AsFloat;
             if pTipo = Unificar then
               vLancL.CODIGO_EMP := dataSet.FieldByName('COD_EMPRESA').AsInteger
             else
               vLancL.CODIGO_EMP := StrToInt(vDadosIni.codEmpresa);
             vLancL.COD_EMP_MULT := dataSet.FieldByName('COD_EMPRESA').AsInteger;
             if pTipo = Unificar then
             begin
               vLancL.LOTE_QUIT := vNumLoteQuitacao;
               vLancL.STATUS_L := 'QUITADO';
             end;
             vLancL._efetuarLancamento;
           finally
             fTempControles.Filtered := false;
           end;

           try
             // Lançamento de Entrada
             fTempControles.Filter := ' COD_CONTROLE = ' + IntToStr(fTempLancamentos.FieldByName('COD_CONTROLE').AsInteger);
             fTempControles.Filtered := true;

             if pTipo = Unificar then
               vLancL.N_CONTA_PLC := vNCON_C_PROD
             else
               vLancL.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_C_PROD').AsFloat;

             vLancL.CODIGO_CTRL := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
             vLancL.HISTORICO_L := Trim(copy('ENTRADA DE ' + Trim(fTempControles.FieldByName('CONTROLE_UNIFICADORA').AsString) +
               ' REF. A UNIFICACAO DO CAIXA', 1, 100));
             if pTipo = Unificar then
             begin
               vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
               vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
    //           vLancL.DATQ_L := vDadosIni.diaFFinanceiro + 1;
             end
             else
             begin
               vLancL.DATA := diaFFinanceiroUnificada + 1;
               vLancL.DTREFERENCIA := diaFFinanceiroUnificada + 1;
    //           vLancL.DATQ_L := diaFFinanceiroUnificada + 1;
             end;
             vLancL.TIPO_L := 'E';//Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
             vLancL.VALOR_L := fTempLancamentos.FieldByName('VALOR').AsFloat;
             if pTipo = Unificar then
               vLancL.CODIGO_EMP := StrToInt(vDadosIni.codEmpresa)
             else
               vLancL.CODIGO_EMP := dataSet.FieldByName('COD_EMPRESA').AsInteger;
             vLancL.COD_EMP_MULT := dataSet.FieldByName('COD_EMPRESA').AsInteger;
    //         vLancL.LOTE_ENT := vNumLoteQuitacao;
    //         vLancL.STATUS_L := 'QUITADO';
             vLancL._efetuarLancamento;
           finally
             fTempControles.Filtered := false;
           end;

           fTempLancamentos.Next;
         end;
       finally
         fTempLancamentos.Filtered := false;
       end;
     end;

     if pTipo = Unificar then
     begin
     // Lançamentos do Cheques
     try
       fTempLancamentos.Filter := ' trim(tipo) = ''CHEQUE''';
       fTempLancamentos.Filtered := true;
       fTempLancamentos.First;

       while not fTempLancamentos.Eof do
       begin
         // Lançamento de Saida
         try
           fTempControles.Filter := ' COD_CONTROLE = ' + IntToStr(fTempLancamentos.FieldByName('COD_CONTROLE').AsInteger);
           fTempControles.Filtered := true;

           if pTipo = Unificar then
             vLancL.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat
           else
             vLancL.N_CONTA_PLC := vNCON_V_PROD;

           vLancL.CODIGO_CTRL := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
           if pTipo = Unificar then
           begin
             vLancL.DATA := diaFFinanceiroUnificada + 1;
             vLancL.DTREFERENCIA := diaFFinanceiroUnificada + 1;
             vLancL.DATQ_L := diaFFinanceiroUnificada + 1;
           end
           else
           begin
             vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
             vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
  //           vLancL.DATQ_L := vDadosIni.diaFFinanceiro + 1;
           end;
           vLancL.HISTORICO_L := Trim(copy('SAIDA DE CHEQUES REF. A UNIFICACAO DO CAIXA', 1, 60));
           vLancL.TIPO_L := 'S';//Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
           vLancL.VALOR_L := fTempLancamentos.FieldByName('VALOR').AsFloat;
           if pTipo = Unificar then
             vLancL.CODIGO_EMP := dataSet.FieldByName('COD_EMPRESA').AsInteger
           else
             vLancL.CODIGO_EMP := StrToInt(vDadosIni.codEmpresa);
           vLancL.COD_EMP_MULT := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           if pTipo = Unificar then
           begin
             vLancL.LOTE_QUIT := vNumLoteQuitacao;
             vLancL.STATUS_L := 'QUITADO';
           end;
           vLancL._efetuarLancamento;
         finally
           fTempControles.Filtered := false;
         end;

         try
           // Lançamento de Entrada
           fTempControles.Filter := ' COD_CONTROLE = ' + IntToStr(fTempLancamentos.FieldByName('COD_CONTROLE').AsInteger);
           fTempControles.Filtered := true;

           if pTipo = Unificar then
             vLancL.N_CONTA_PLC := vNCON_C_PROD
           else
             vLancL.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_C_PROD').AsFloat;

           vLancL.CODIGO_CTRL := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
           if pTipo = Unificar then
           begin
             vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
             vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
  //           vLancL.DATQ_L := vDadosIni.diaFFinanceiro + 1;
           end
           else
           begin
             vLancL.DATA := vDadosIni.diaFFinanceiro + 1;//diaFFinanceiroUnificada + 1;
             vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;//diaFFinanceiroUnificada + 1;
  //           vLancL.DATQ_L := vDadosIni.diaFFinanceiro + 1;//diaFFinanceiroUnificada + 1;
           end;
           vLancL.HISTORICO_L := Trim(copy('ENTRADA DE CHEQUES REF. A UNIFICACAO DO CAIXA', 1, 60));
           vLancL.TIPO_L := 'E';//Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
           vLancL.VALOR_L := fTempLancamentos.FieldByName('VALOR').AsFloat;
           if pTipo = Unificar then
             vLancL.CODIGO_EMP := StrToInt(vDadosIni.codEmpresa)
           else
             vLancL.CODIGO_EMP := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           vLancL.COD_EMP_MULT := dataSet.FieldByName('COD_EMPRESA').AsInteger;
    //       vLancL.LOTE_ENT := vNumLoteQuitacao;
    //       vLancL.STATUS_L := 'QUITADO';
           vLancL._efetuarLancamento;
         finally
           fTempControles.Filtered := false;
         end;

         buscas2.Close;
           buscas2.SQL.Text := ' select * from controle_cheque ' +
             ' where (status_ch = '''' or status_ch is null) and codigo_emp = :codigo_emp ' +
           ' and codigo_ctrl = :codigo_ctrl and alterado is null ';
           buscas2.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
         buscas2.ParamByName('CODIGO_CTRL').AsInteger := fTempLancamentos.FieldByName('COD_CONTROLE').AsInteger;
         buscas2.Open;
         buscas2.FetchAll;

         buscas2.First;
         while not buscas2.Eof do
         begin
           Application.ProcessMessages;
           vDadosIni.abreStatusProcessamento('Processando Cheques: ', IntToStr(Buscas2.RecNo) + ' de ' + IntToStr(Buscas2.RecordCount));

           try
             fTempControles.Filter := ' COD_CONTROLE = ' + IntToStr(fTempLancamentos.FieldByName('COD_CONTROLE').AsInteger);
             fTempControles.Filtered := true;

             buscas.Close;
               buscas.SQL.Text := ' update controle_cheque set ' +
                ' lote_ent = :lote_ent, codigo_ctrl = :codigo_ctrl, data_rec = :data_rec, alterado = :alterado ' +
              ' where codigo_ch = :codigo_ch and codigo_emp = :codigo_emp ';
             buscas.ParamByName('CODIGO_CH').AsInteger := buscas2.FieldByName('CODIGO_CH').AsInteger;
               buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
               buscas.ParamByName('DATA_REC').AsDate := vDadosIni.diaFFinanceiro + 1;
             buscas.ParamByName('LOTE_ENT').AsInteger := vNumLoteQuitacao;
             buscas.ParamByName('CODIGO_CTRL').AsInteger := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
             buscas.ParamByName('ALTERADO').AsString := 'S';
             buscas.Prepare;
             buscas.ExecSQL;

               vDadosIni.verificarControleCheque_Pendentes_Unificacao(buscas,
               	buscas2.FieldByName('CODIGO_CH').AsInteger,
                dataSet.FieldByName('COD_EMPRESA').AsInteger,
                vLancL.fCOD_LANC);

           finally
             fTempControles.Filtered := false;
           end;

           Buscas2.Next;
         end;

         fTempLancamentos.Next;
       end;
     finally
        buscas.Close;
        buscas.SQL.Text := ' update controle_cheque set alterado = null ' +
         ' where codigo_emp = :codigo_emp and alterado is not null ';
        buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
        buscas.ExecSQL;

        fTempLancamentos.Filtered := false;
     end;
     vDadosIni.fechaStatusProcessamento;
     end;

     if pTipo = Unificar then
     begin
     // Lançamentos do Créditos
     try
       fTempLancamentos.Filter := ' trim(tipo) = ''CREDITOS''';
       fTempLancamentos.Filtered := true;
       fTempLancamentos.First;
       
       while not fTempLancamentos.Eof do
       begin
         Application.ProcessMessages;
         try
           // Lançamento de Saída
           fTempControles.Filter := ' COD_CONTROLE = ' + IntToStr(fTempLancamentos.FieldByName('COD_CONTROLE').AsInteger);
           fTempControles.Filtered := true;

           if pTipo = Unificar then
             vLancL.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_V_PROD').AsFloat
           else
             vLancL.N_CONTA_PLC := vNCON_V_PROD;

           vLancL.CODIGO_CTRL := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
           vLancL.HISTORICO_L := Trim(copy('SAIDA DE '+Trim(fTempControles.FieldByName('CONTROLE_UNIFICADORA').AsString)+
             ' REF. A UNIFICACAO DO CAIXA', 1, 60));
           if pTipo = Unificar then
           begin
             vLancL.DATA := diaFFinanceiroUnificada + 1;
             vLancL.DTREFERENCIA := diaFFinanceiroUnificada + 1;
             vLancL.DATQ_L := diaFFinanceiroUnificada + 1;
           end
           else
           begin
             vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
             vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
  //           vLancL.DATQ_L := vDadosIni.diaFFinanceiro + 1;
           end;
           vLancL.TIPO_L := 'S';//Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
           vLancL.VALOR_L := fTempLancamentos.FieldByName('VALOR').AsFloat;
           if pTipo = Unificar then
             vLancL.CODIGO_EMP := dataSet.FieldByName('COD_EMPRESA').AsInteger
           else
             vLancL.CODIGO_EMP := StrToInt(vDadosIni.codEmpresa);
           vLancL.COD_EMP_MULT := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           if pTipo = Unificar then
           begin
             vLancL.LOTE_QUIT := vNumLoteQuitacao;
             vLancL.STATUS_L := 'QUITADO';
           end;
           vLancL._efetuarLancamento;
         finally
           fTempControles.Filtered := false;
         end;

         // Lançamento de Entrada
         try
           fTempControles.Filter := ' COD_CONTROLE = ' + IntToStr(fTempLancamentos.FieldByName('COD_CONTROLE').AsInteger);
           fTempControles.Filtered := true;

           if pTipo = Unificar then
             vLancL.N_CONTA_PLC := vNCON_C_PROD
           else
             vLancL.N_CONTA_PLC := vContLig.dataSet.FieldByName('NCON_C_PROD').AsFloat;

           vLancL.CODIGO_CTRL := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
           vLancL.HISTORICO_L := Trim(copy('ENTRADA DE ' + Trim(fTempControles.FieldByName('CONTROLE_UNIFICADORA').AsString) +
             ' REF. A UNIFICACAO DO CAIXA', 1, 60));
           if pTipo = Unificar then
           begin
             vLancL.DATA := vDadosIni.diaFFinanceiro + 1;
             vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;
           end
           else
           begin
             vLancL.DATA := vDadosIni.diaFFinanceiro + 1;//diaFFinanceiroUnificada + 1;
             vLancL.DTREFERENCIA := vDadosIni.diaFFinanceiro + 1;//diaFFinanceiroUnificada + 1;
           end;
           vLancL.TIPO_L := 'E';//Trim(vContLig.vPCont.dataSet.FieldByName('TIPO_PLC').AsString);
           vLancL.VALOR_L := fTempLancamentos.FieldByName('VALOR').AsFloat;
           if pTipo = Unificar then
             vLancL.CODIGO_EMP := StrToInt(vDadosIni.codEmpresa)
           else
             vLancL.CODIGO_EMP := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           vLancL.COD_EMP_MULT := dataSet.FieldByName('COD_EMPRESA').AsInteger;
    //       vLancL.LOTE_ENT := vNumLoteQuitacao;
    //       vLancL.STATUS_L := 'QUITADO';
           vLancL._efetuarLancamento;
         finally
           fTempControles.Filtered := false;
         end;

         buscas2.Close;
         buscas2.SQL.Text := ' select cod_cred, codigo_emp, cod_emp_mult, codigo_ctrl, valor_c from controle_creditos ' +
             ' where (status_c = '''' or status_c is null) and codigo_emp = :codigo_emp ' +// and cod_emp_mult = :cod_emp_mult ' +
           ' and codigo_ctrl = :codigo_ctrl and alterado is null ';
           buscas2.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
         buscas2.ParamByName('CODIGO_CTRL').AsInteger := fTempLancamentos.FieldByName('COD_CONTROLE').AsInteger;
         buscas2.Open;
         buscas2.FetchAll;

         buscas2.First;
         while not buscas2.Eof do
         begin
           Application.ProcessMessages;
           vDadosIni.abreStatusProcessamento('Processando Controle de Créditos:', IntToStr(Buscas2.RecNo) + ' de ' + IntToStr(Buscas2.RecordCount));

           try
             fTempControles.Filter := ' COD_CONTROLE = ' + IntToStr(fTempLancamentos.FieldByName('COD_CONTROLE').AsInteger);
             fTempControles.Filtered := true;

             buscas.Close;
               buscas.SQL.Text := ' update controle_creditos set ' +
                ' lote_ent = :lote_ent, codigo_ctrl = :codigo_ctrl, tipo_doc_c = :tipo_doc_c, data_rec_c = :data_rec_c, alterado = :alterado ' +
              ' where cod_cred = :cod_cred and codigo_emp = :codigo_emp ';
             buscas.ParamByName('COD_CRED').AsInteger := buscas2.FieldByName('COD_CRED').AsInteger;
               buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
               buscas.ParamByName('DATA_REC_C').AsDate := vDadosIni.diaFFinanceiro + 1;
             buscas.ParamByName('LOTE_ENT').AsInteger := vNumLoteQuitacao;
             buscas.ParamByName('CODIGO_CTRL').AsInteger := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
             buscas.ParamByName('TIPO_DOC_C').AsString := Copy(trim(fTempControles.FieldByName('CONTROLE_UNIFICADORA').AsString), 1, 15);
             buscas.ParamByName('ALTERADO').AsString := 'S';
             buscas.Prepare;
             buscas.ExecSQL;

               vDadosIni.verificarControleCreditos_Pendentes_Unificacao(buscas,
               	buscas2.FieldByName('COD_CRED').AsInteger,
                dataSet.FieldByName('COD_EMPRESA').AsInteger,
                vLancL.fCOD_LANC);
           finally
             fTempControles.Filtered := false;
           end;

           Buscas2.Next;
         end;

         fTempLancamentos.Next;
       end;
     finally
        buscas.Close;
        buscas.SQL.Text := ' update controle_creditos set alterado = null ' +
         ' where codigo_emp = :codigo_emp and alterado is not null ';
        buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
        buscas.ExecSQL;

        fTempLancamentos.Filtered := false;
     end;
     vDadosIni.fechaStatusProcessamento;
     end;

     if pTipo = Unificar then
     begin
     // Lançamentos do Contas a pagar
     try
       fTempLancamentos.Filter := ' trim(tipo) = ''CONTASPAGAR''';
       fTempLancamentos.Filtered := true;
       fTempLancamentos.First;

       if pTipo = Unificar then
         vNumLoteQuitacao := Gencodigo('LOTE_LANC', dtmImportPDVFinan.SpIncCodigo, vDadosIni.codEmpresa)
       else
         vNumLoteQuitacao := Gencodigo('LOTE_LANC', dtmImportPDVFinan.SpIncCodigo, IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger));

       while not fTempLancamentos.Eof do
       begin
         Application.ProcessMessages;
         buscas2.Close;
         buscas2.SQL.Text := ' select cod_contrp, codigo_emp, cod_emp_mult, codigo_ctrl, valor_ctp from contas_a_pagar ' +
             ' where (status_ctp = '''' or status_ctp is null) and codigo_emp = :codigo_emp ' + // and cod_emp_mult = :cod_emp_mult ' +
           ' and codigo_ctrl = :codigo_ctrl and alterado is null ';
           buscas2.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
         buscas2.ParamByName('CODIGO_CTRL').AsInteger := fTempLancamentos.FieldByName('COD_CONTROLE').AsInteger;
         buscas2.Open;
         buscas2.FetchAll;

         buscas2.First;
         while not buscas2.Eof do
         begin
           Application.ProcessMessages;
           vDadosIni.abreStatusProcessamento('Processando Contas a pagar: ', IntToStr(Buscas2.RecNo) + ' de ' + IntToStr(Buscas2.RecordCount));
           
           try
             fTempControles.Filter := ' COD_CONTROLE = ' + IntToStr(fTempLancamentos.FieldByName('COD_CONTROLE').AsInteger);
             fTempControles.Filtered := true;

             buscas.Close;
               buscas.SQL.Text := ' update contas_a_pagar set ' +
              ' lote = :lote, codigo_ctrl = :codigo_ctrl, alterado = :alterado, data_ent_ctp = :data_ent_ctp ' +
                ' where cod_contrp = :cod_contrp and codigo_emp = :codigo_emp '; //and cod_emp_mult = :cod_emp_mult';
             buscas.ParamByName('COD_CONTRP').AsInteger := buscas2.FieldByName('COD_CONTRP').AsInteger;
               buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
               buscas.ParamByName('DATA_ENT_CTP').AsDate := vDadosIni.diaFFinanceiro + 1;
             buscas.ParamByName('LOTE').AsInteger := vNumLoteQuitacao;
             buscas.ParamByName('CODIGO_CTRL').AsInteger := fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger;
             buscas.ParamByName('ALTERADO').AsString := 'S';
             buscas.Prepare;
             buscas.ExecSQL;
           finally
             fTempControles.Filtered := false;
           end;

           Buscas2.Next;
         end;

         fTempLancamentos.Next;
       end;
     finally
          vDadosIni.verificarCTP_Pendentes_Unificacao(buscas, dataSet.FieldByName('COD_EMPRESA').AsInteger, false);

        buscas.Close;
        buscas.SQL.Text := ' update contas_a_pagar set alterado = null ' +
         ' where codigo_emp = :codigo_emp and alterado is not null ';
        buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
        buscas.ExecSQL;
        
        fTempLancamentos.Filtered := false;
     end;
     vDadosIni.fechaStatusProcessamento;
     end;
     
     if pTipo = Unificar then
     begin
       buscas.Close;
       buscas.SQL.Text := ' UPDATE SAL_CTRL SET VAL_SLD = :VAL_SLD, SOBRA_SLD = :SOBRA_SLD, ' +
        ' VL_CRD_SLD = :VL_CRD_SLD, SALDO_BANCO = :SALDO_BANCO, SALDO_CONC = :SALDO_CONC ' +
        ' WHERE DATA_SLD = :DATA_SLD AND COD_EMP = :COD_EMP ';
       buscas.ParamByName('COD_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
       buscas.ParamByName('DATA_SLD').AsDate := diaFFinanceiroUnificada;
       buscas.ParamByName('VAL_SLD').AsFloat := 0;
       buscas.ParamByName('SOBRA_SLD').AsFloat := 0;
       buscas.ParamByName('VL_CRD_SLD').AsFloat := 0;
       buscas.ParamByName('SALDO_BANCO').AsFloat := 0;
       buscas.ParamByName('SALDO_CONC').AsFloat := 0;
       buscas.ExecSQL;
     end;
     if pTipo = Desunificar then
     begin
       buscas.Close;
       buscas.SQL.Text := ' UPDATE CONTROLES SET SALDO_ANT_CTRL = 0, SALDO_AT_CTRL = 0, SOBRA_CTRL = 0 ' +
         ' WHERE CODIGO_EMP = :CODIGO_EMP ';
       buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
       buscas.ExecSQL;

       vSql := 'select first 1 DIA_FCD from FECH_DIA' +
         ' where CODIGO_EMP = :CODIGO_EMP order by dia_fcd desc ';

       if FrmUnificarEmpresas.RadioGroupReplicador.ItemIndex = 0 then
       begin
         buscas.Close;
         buscas.SQL.Text := vSql;
         buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
         buscas.Open;

         if not buscas.IsEmpty then
         begin
           if (vDadosIni.diaFFinanceiro + 1) <> (buscas.FieldByName('DIA_FCD').AsDateTime + 1) then
           begin
             buscas.Close;
             buscas.SQL.Text := 'INSERT INTO FECH_DIA (DIA_FCD, NMOV, TOT_E_FCD, TOT_S_FCD, CODIGO_EMP)' +
               ' values (:DIA_FCD, 1, 0, 0, ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + ')';
             buscas.ParamByName('DIA_FCD').AsDate := vDadosIni.diaFFinanceiro;
             buscas.ExecSQL;
           end;
         end
         else
         begin
             buscas.Close;
             buscas.SQL.Text := 'INSERT INTO FECH_DIA (DIA_FCD, NMOV, TOT_E_FCD, TOT_S_FCD, CODIGO_EMP)' +
               ' values (:DIA_FCD, 1, 0, 0, ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + ')';
             buscas.ParamByName('DIA_FCD').AsDate := vDadosIni.diaFFinanceiro;
             buscas.ExecSQL;
         end;
       end
       else
       begin
         try
           vDadosIni.abreStatusProcessamento('Conectando ao banco:', trim(FrmUnificarEmpresas.EditDataBase.Text));
           dtmImportPDVFinan.IBDatabaseUnificada.Connected := false;
           dtmImportPDVFinan.IBDatabaseUnificada.DatabaseName := trim(FrmUnificarEmpresas.EditDataBase.Text);
           dtmImportPDVFinan.IBDatabaseUnificada.Connected := true;

           if not dtmImportPDVFinan.IBDatabaseUnificada.Connected then
           begin
             vDadosIni.fechaStatusProcessamento;
             vTemp := 'Não foi possível conectar ao banco: ' + trim(FrmUnificarEmpresas.EditDataBase.Text) + #13 +
              'Favor atualizar a tabela "CODIGO" referente as tabelas (CONTAS_A_PAGAR, CONTROLE_CREDITOS, LANCAMENTOS) para último código existente da empresa unificada manualmente' + #13 +
              'Favor atualizar a tabela "FECH_DIA" para o dia '+FormatDateTime('DD/MM/YYYY', vDadosIni.diaFFinanceiro) + ' da empresa unificada manualmente.';
             Application.MessageBox(PChar(vTemp), 'Erro', MB_OK + MB_ICONERROR +  MB_DEFBUTTON1);
             vDadosIni.registraErro(vTemp);
           end;
         finally
           vDadosIni.fechaStatusProcessamento;
         end;

         if dtmImportPDVFinan.IBDatabaseUnificada.Connected then
         begin
           buscarUnificada := TIBQuery.Create(Application);
           buscarUnificada.Database := dtmImportPDVFinan.qrBuscasUnificada.Database;
           buscarUnificada.Transaction :=  dtmImportPDVFinan.IBTransactionUnificada;

           buscarUnificada.Close;
           buscarUnificada.SQL.Text := vSql;
           buscarUnificada.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
           buscarUnificada.Open;

           if not buscarUnificada.IsEmpty then
           begin
            if (diaFFinanceiroUnificada + 1) <> (buscarUnificada.FieldByName('DIA_FCD').AsDateTime + 1) then
            begin
              buscarUnificada.Close;
              buscarUnificada.SQL.Text := 'INSERT INTO FECH_DIA (DIA_FCD, NMOV, TOT_E_FCD, TOT_S_FCD, CODIGO_EMP)' +
                ' values (:DIA_FCD, 1, 0, 0, ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + ')';
              buscarUnificada.ParamByName('DIA_FCD').AsDate := vDadosIni.diaFFinanceiro;
              buscarUnificada.ExecSQL;
            end;
           end
           else
           begin
              buscarUnificada.Close;
              buscarUnificada.SQL.Text := 'INSERT INTO FECH_DIA (DIA_FCD, NMOV, TOT_E_FCD, TOT_S_FCD, CODIGO_EMP)' +
                ' values (:DIA_FCD, 1, 0, 0, ' + IntToStr(dataSet.FieldByName('COD_EMPRESA').AsInteger) + ')';
              buscarUnificada.ParamByName('DIA_FCD').AsDate := vDadosIni.diaFFinanceiro;
              buscarUnificada.ExecSQL;
           end;

            try
              try
                //Atualizando GenCodigo Empresa Unificada
                vDadosIni.abreStatusProcessamento('', 'Atualizando tabelas "CODIGO", "FECH_DIA" empresa unificada');
                buscas.Close;
                buscas.SQL.Text := ' select max (cod_contrp)  from contas_a_pagar ctp ' +
                  ' where codigo_emp = :codigo_emp';
                buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
                buscas.Open;

                if buscas.FieldByName('MAX').AsInteger > 0 then
                begin
                  buscarUnificada.Close;
                  buscarUnificada.SQL.Text := ' UPDATE OR INSERT INTO CODIGO ' +
                   ' (TABELA, COD_EMPRESA, VALOR, ATIVO ) ' +
                   ' VALUES (:TABELA, :COD_EMPRESA, :VALOR, :ATIVO );';
                  buscarUnificada.ParamByName('TABELA').AsString := 'CONTAS_A_PAGAR';
                  buscarUnificada.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
                  buscarUnificada.ParamByName('VALOR').AsInteger := buscas.FieldByName('MAX').AsInteger;
                  buscarUnificada.ParamByName('ATIVO').AsInteger := 1;
                  buscarUnificada.ExecSQL;
                end;

                buscas.Close;
                buscas.SQL.Text := ' select max (cod_cred) from controle_creditos ' +
                 ' where codigo_emp = :codigo_emp ';
                buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
                buscas.Open;

                if buscas.FieldByName('MAX').AsInteger > 0 then
                begin
                  buscarUnificada.Close;
                  buscarUnificada.SQL.Text := ' UPDATE OR INSERT INTO CODIGO ' +
                   ' (TABELA, COD_EMPRESA, VALOR, ATIVO ) ' +
                   ' VALUES (:TABELA, :COD_EMPRESA, :VALOR, :ATIVO );';
                  buscarUnificada.ParamByName('TABELA').AsString := 'CONTROLE_CREDITOS';
                  buscarUnificada.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
                  buscarUnificada.ParamByName('VALOR').AsInteger := buscas.FieldByName('MAX').AsInteger;
                  buscarUnificada.ParamByName('ATIVO').AsInteger := 1;
                  buscarUnificada.ExecSQL;
                end;

                buscas.Close;
                buscas.SQL.Text := ' select max (cod_lanc) from lancamentos ' +
                 ' where codigo_emp = :codigo_emp ';
                buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
                buscas.Open;

                if buscas.FieldByName('MAX').AsInteger > 0 then
                begin
                  buscarUnificada.Close;
                  buscarUnificada.SQL.Text := ' UPDATE OR INSERT INTO CODIGO ' +
                   ' (TABELA, COD_EMPRESA, VALOR, ATIVO ) ' +
                   ' VALUES (:TABELA, :COD_EMPRESA, :VALOR, :ATIVO );';
                  buscarUnificada.ParamByName('TABELA').AsString := 'LANCAMENTOS';
                  buscarUnificada.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
                  buscarUnificada.ParamByName('VALOR').AsInteger := buscas.FieldByName('MAX').AsInteger;
                  buscarUnificada.ParamByName('ATIVO').AsInteger := 1;
                  buscarUnificada.ExecSQL;
                end;

              except
                on E: Exception do
                begin
                  vDadosIni.fechaStatusProcessamento;
                  vTemp := 'Erro ao atualizar tabelas "CODIGO", "FECH_DIA" empresa unificada' + #13 + ' Banco: ' + trim(FrmUnificarEmpresas.EditDataBase.Text) + #13 +
                   'Favor atualizar a tabela "CODIGO" referente as tabelas (CONTAS_A_PAGAR, CONTROLE_CREDITOS, LANCAMENTOS) para último código existente da empresa unificada manualmente' + #13 +
                   'Favor atualizar a tabela "FECH_DIA" para o dia '+FormatDateTime('DD/MM/YYYY', vDadosIni.diaFFinanceiro) + ' da empresa unificada manualmente.';
                  Application.MessageBox(PChar(vTemp), 'Erro', MB_OK + MB_ICONERROR +  MB_DEFBUTTON1);
                  vDadosIni.registraErro(vTemp + #13 + 'Erro: ' + e.Message);
                end;
              end
            finally
              vDadosIni.fechaStatusProcessamento;
            end;

         end;
       end;
     end;
     fTempControles.Filtered := False;
     fTempLancamentos.EmptyDataSet;

     vUnificar := True;
     vDadosIni.fechaStatusProcessamento;
     Result := True;
   except
     on E: Exception do
     begin
        result := False;
        RollBackTransacao;
        if FrmUnificarEmpresas.RadioGroupReplicador.ItemIndex = 1 then
          dtmImportPDVFinan.IBTransactionUnificada.Rollback;
        if pTipo = Unificar then
          vDadosIni.GravaAuditoria('BAS351', 'UNIFICAR EMPRESA ' +dataSet.FieldByName('COD_EMPRESA').AsString, 'FALHA', 'EMPRESA', vDadosIni.codEmpresa, buscas)
        else
          vDadosIni.GravaAuditoria('BAS351', 'DESUNIFICAR EMPRESA ' +dataSet.FieldByName('COD_EMPRESA').AsString, 'FALHA', 'EMPRESA', vDadosIni.codEmpresa, buscas);
        vDadosIni.vEmp.vFinanceiroUnificado := false;
        vDadosIni.vEmp.vCodigoUnificadora := 0;
        vDadosIni.fechaStatusProcessamento;
        if pTipo = Unificar then
          Application.MessageBox(pchar('Erro ao Unificar. Erro: ' + e.Message ), 'Atenção', 0 + 64)
        else
          Application.MessageBox(pchar('Erro ao Desunificar. Erro: ' + e.Message ), 'Atenção', 0 + 64);
        registraErro('function TUnificarEmpresa.AplicarAlteracoes. Erro: ' + e.Message);
     end;
   end;
 finally
   if Result then
   begin
     CommitaTransacao;
     if FrmUnificarEmpresas.RadioGroupReplicador.ItemIndex = 1 then
       dtmImportPDVFinan.IBTransactionUnificada.Commit;
     if pTipo = Unificar then
       vDadosIni.GravaAuditoria('BAS351', 'UNIFICAR EMPRESA ' +dataSet.FieldByName('COD_EMPRESA').AsString, 'SUCESSO', 'EMPRESA', vDadosIni.codEmpresa, buscas)
     else
       vDadosIni.GravaAuditoria('BAS351', 'DESUNIFICAR EMPRESA ' +dataSet.FieldByName('COD_EMPRESA').AsString, 'SUCESSO', 'EMPRESA', vDadosIni.codEmpresa, buscas);
     vDadosIni.vEmp.vFinanceiroUnificado := false;
     vDadosIni.vEmp.vCodigoUnificadora := 0;
     vDadosIni.atualizarVariaveisEmpresa(Buscas);
     if pTipo = Unificar then
       Application.MessageBox('Unificação concluída com sucesso', 'Atenção', MB_OK + MB_OK)
     else
       Application.MessageBox('Desunificação concluída com sucesso', 'Atenção', MB_OK + MB_OK);
   end;
 end;
end;

procedure TUnificarEmpresa.AtualizarCampoAlterado(pTipo: vOP);
begin
   buscas.Close;
   buscas.SQL.Text := ' update controle_creditos set alterado = null ' +
    ' where ' + vDadosIni.retornoPorCondicao(pTipo = Unificar, 'CODIGO_EMP', 'COD_EMP_MULT') + ' = :codigo_emp ' +
    ' and alterado is not null ';
   buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
   buscas.ExecSQL;

   buscas.Close;
   buscas.SQL.Text := ' update controle_cheque set alterado = null ' +
    ' where ' + vDadosIni.retornoPorCondicao(pTipo = Unificar, 'CODIGO_EMP', 'COD_EMP_MULT') + ' = :codigo_emp ' +
    ' and alterado is not null ';
   buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
   buscas.ExecSQL;

   buscas.Close;
   buscas.SQL.Text := ' update contas_a_pagar set alterado = null ' +
    ' where ' + vDadosIni.retornoPorCondicao(pTipo = Unificar, 'CODIGO_EMP', 'COD_EMP_MULT') + ' = :codigo_emp ' +
    ' and alterado is not null ';
   buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
   buscas.ExecSQL;

   buscas.Close;
   buscas.SQL.Text := ' update lancamentos set alterado = null ' +
    ' where ' + vDadosIni.retornoPorCondicao(pTipo = Unificar, 'CODIGO_EMP', 'COD_EMP_MULT') + ' = :codigo_emp ' +
    ' and alterado is not null ';
   buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
   buscas.ExecSQL;

   buscas.Close;
   buscas.SQL.Text := ' update baixa_creditos set alterado = null ' +
    ' where ' + vDadosIni.retornoPorCondicao(pTipo = Unificar, 'CODIGO_EMP', 'COD_EMP_MULT') + ' = :codigo_emp ' +
    ' and alterado is not null ';
   buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
   buscas.ExecSQL;

   buscas.Close;
   buscas.SQL.Text := ' update despesas_veic set alterado = null ' +
    ' where COD_EMPRESA = :codigo_emp and alterado is not null ';
   buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
   buscas.ExecSQL;

   buscas.Close;
   buscas.SQL.Text := ' update cobrebem set alterado1 = null ' +
     ' where ' + vDadosIni.retornoPorCondicao(pTipo = Unificar, 'COD_EMPRESA', 'COD_EMP_MULT') + ' = :codigo_emp ' +
     ' and alterado1 is not null ';
   buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
   buscas.ExecSQL;

   buscas.Close;
   buscas.SQL.Text := ' update cobrebem set alterado2 = null ' +
     ' where ' + vDadosIni.retornoPorCondicao(pTipo = Unificar, 'COD_EMPRESA', 'COD_EMP_MULT') + ' = :codigo_emp ' +
     ' and alterado2 is not null ';
   buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
   buscas.ExecSQL;

   if pTipo = Unificar then
   begin
     buscas.Close;
     buscas.SQL.Text := ' update plano_pag set alterado = null ' +
      ' where COD_EMPRESA  = :codigo_emp and alterado is not null ';
     buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
     buscas.ExecSQL;

     buscas.Close;
     buscas.SQL.Text := ' update formpagamento set alterado = null ' +
      ' where COD_EMPRESA = :codigo_emp and alterado is not null ';
     buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
     buscas.ExecSQL;

     buscas.Close;
     buscas.SQL.Text := ' update boletas set alterado = null ' +
      ' where COD_EMPRESA = :codigo_emp and alterado is not null ';
     buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
     buscas.ExecSQL;
   end;
end;

function TUnificarEmpresa.buscarDiaFinanceiroFechado(
  pCodEmpresa: Integer): boolean;
begin
 try
    Result := false;

    buscas.Close;
    buscas.SQL.Text := ' select first 1 data_sld from sal_ctrl sal ' +
     ' where cod_emp = ' + IntToStr(pCodEmpresa) + ' order by data_sld desc ';
    buscas.Open;

    if not buscas.IsEmpty then
      diaFFinanceiroUnificada := buscas.FieldByName('data_sld').AsDateTime
    else
      diaFFinanceiroUnificada := Date;
    Result := True;
 except
    on e: exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro ao buscar dia do Financeiro fechado. Erro: ' + e.message),'Atenção', 0 + 64);
      registraErro('function TUnificarEmpresa.buscarDiaFinanceiroFechado Erro: ' + e.Message);     
    end;
  end;

end;

constructor TUnificarEmpresa.create;
begin
  if dtmImportPDVFinan = nil then
    dtmImportPDVFinan := TdtmImportPDVFinan.Create(dtmImportPDVFinan);

  DataSet := TClientDataSet(dtmImportPDVFinan.cdsEmpresasUnificadas);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
  Buscas := TIBQuery(dtmImportPDVFinan.qrBuscas);

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  vCtrl := TControles_FPDV.create;
  vLancL := TLancamentosImp.create;
  vContLig := TContaLigacaoImp.create;

  fTempLancamentos := TClientDataSet.Create(nil);
  fTempLancamentos.Close;
  fTempLancamentos.FieldDefs.Clear;
  fTempLancamentos.FieldDefs.Add('TIPO', ftString, 18, false);
  fTempLancamentos.FieldDefs.Add('COD_EMPRESA', ftInteger, 0, false);
  fTempLancamentos.FieldDefs.Add('COD_CONTROLE', ftInteger, 0, false);
  fTempLancamentos.FieldDefs.Add('CONTROLE', ftString, 30, false);
  fTempLancamentos.FieldDefs.Add('DOCS', ftString, 2, false);
  fTempLancamentos.FieldDefs.Add('BARRAR_AUTOMATICO', ftString, 1, false);
  fTempLancamentos.FieldDefs.Add('VALOR', ftCurrency, 0, false);

  fTempControles := TClientDataSet.Create(nil);
  fTempControles.Close;
  fTempControles.FieldDefs.Clear;
  fTempControles.FieldDefs.Add('SEL', ftString, 1, false);
  fTempControles.FieldDefs.Add('COD_EMPRESA', ftInteger, 0, false);
  fTempControles.FieldDefs.Add('COD_CONTROLE', ftInteger, 0, false);
  fTempControles.FieldDefs.Add('CONTROLE', ftString, 30, false);
  fTempControles.FieldDefs.Add('DOCS', ftString, 2, false);
  fTempControles.FieldDefs.Add('BARRAR_AUTOMATICO', ftString, 1, false);
  fTempControles.FieldDefs.Add('CODIGO_UNIFICADORA', ftInteger, 0, false);
  fTempControles.FieldDefs.Add('COD_CONTROLE_UNIFICADORA', ftInteger, 0, false);
  fTempControles.FieldDefs.Add('CONTROLE_UNIFICADORA', ftString, 30, false);
  fTempControles.FieldDefs.Add('DOCS_UNIFICADORA', ftString, 2, false);
  fTempControles.FieldDefs.Add('BARRAR_AUTOMATICO_UNIFICADORA', ftString, 1, false);


  if fTempLancamentos.Tag = 0 then
  try
    fTempLancamentos.CreateDataSet;
    fTempLancamentos.Tag := 1;
    fTempLancamentos.FieldByName('TIPO').DisplayLabel := 'Tabela              ';
    fTempLancamentos.FieldByName('COD_EMPRESA').DisplayLabel := 'Unificada';
    fTempLancamentos.FieldByName('COD_CONTROLE').DisplayLabel := 'Cod Controle';
    fTempLancamentos.FieldByName('CONTROLE').DisplayLabel := 'Controle';
    fTempLancamentos.FieldByName('DOCS').DisplayLabel := 'Tipo';
    fTempLancamentos.FieldByName('BARRAR_AUTOMATICO').DisplayLabel := 'Barrar Automatico';
    fTempLancamentos.FieldByName('VALOR').DisplayLabel := 'Valor';
    fTempLancamentosDataSource := TDataSource.Create(nil);
    fTempLancamentosDataSource.DataSet := fTempLancamentos;
  except
  end;

  if fTempControles.Tag = 0 then
  try
    fTempControles.CreateDataSet;
    fTempControles.Tag := 1;
    fTempControles.FieldByName('COD_EMPRESA').DisplayLabel := 'Unificada';
    fTempControles.FieldByName('COD_CONTROLE').DisplayLabel := 'Cod Controle';
    fTempControles.FieldByName('CONTROLE').DisplayLabel := 'Controle';
    fTempControles.FieldByName('DOCS').DisplayLabel := 'Tipo';
    fTempControles.FieldByName('BARRAR_AUTOMATICO').DisplayLabel := 'Barrar Automatico';
    fTempControles.FieldByName('CODIGO_UNIFICADORA').DisplayLabel := 'Unificadora';
    fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').DisplayLabel := 'Cod Controle';
    fTempControles.FieldByName('CONTROLE_UNIFICADORA').DisplayLabel := 'Controle';
    fTempControles.FieldByName('DOCS_UNIFICADORA').DisplayLabel := 'Tipo';
    fTempControles.FieldByName('BARRAR_AUTOMATICO_UNIFICADORA').DisplayLabel := 'Barrar Automatico';
    fTempControlesDataSource := TDataSource.Create(nil);
    fTempControlesDataSource.DataSet := fTempControles;
  except
  end;
  vUnificar := True;

end;

destructor TUnificarEmpresa.Destroy;
begin
  vCtrl.Free;
  vCtrl := nil;
  vLancL.Free;
  vLancL := nil;
  vContLig.Free;
  vContLig := nil;

  inherited;
end;

function TUnificarEmpresa.DesunificarFinanceiro: boolean;
var
  BuscasOrig: TIBQuery;
begin
 try
   Result := true;
   if Application.MessageBox(PChar('Tem certeza que deseja Desunificar o financeiro da empresa ' +
      '"' + trim(dataSet.FieldByName('IDENTIFICACAO_EMP').AsString) + '" ?'),
      'Atenção', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) <> idyes then
     exit;

   BuscasOrig := TIBQuery.Create(Application);
   BuscasOrig.Database := buscas.Database;
   BuscasOrig.Transaction := buscas.Transaction;

   if fTempControles.IsEmpty then
     exit;

   fTempControles.First;
   while not fTempControles.Eof do
   begin
     if fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger <= 0 then
     begin
       Application.MessageBox(PChar('Controle da Unificadora não informado. linha ' + IntToStr(fTempControles.RecordCount)), 'Informação', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
       if FrmUnificarEmpresas.EditMoeda2.CanFocus then
         FrmUnificarEmpresas.EditMoeda2.SetFocus;
       Result := false;
       exit;
     end;
     fTempControles.Next;
   end;
   fTempControles.First;

   AplicarLancamentos(Desunificar);

 except
  on E: Exception do
  begin
    result := False;
    RollBackTransacao;
    Application.MessageBox(pchar('Erro ao aplicar alterações. Erro: ' + e.Message ), 'Atenção', 0 + 64);
    registraErro('function TUnificarEmpresa.DesunificarFinanceiro. Erro: ' + e.Message);
  end;
 end;
end;

procedure TUnificarEmpresa.ExibirLancamento;
var
 buscas2: TIBQuery;
begin
  vUnificar := True;

  if dataSet.IsEmpty then
    exit;

  fTempLancamentos.Filtered := False;
  fTempControles.Filtered := False;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  buscas.Close;
  buscas.SQL.Text := ' SELECT * FROM CONT_LIG ' +
   ' WHERE COD_EMP = :COD_EMP';
  buscas.ParamByName('COD_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.Open;

  buscarDiaFinanceiroFechado(dataSet.FieldByName('COD_EMPRESA').AsInteger);
  vDadosIni.definirDiaFinanceiroFechado(buscas);

  buscas2.Close;
  buscas2.SQL.Text := 'SELECT FIRST 1 * FROM LANCAMENTOS l' +
   ' WHERE DATA = :DATA AND CODIGO_EMP = :CODIGO_EMP AND STATUS_L IS NULL';
  buscas2.ParamByName('DATA').AsDate := diaFFinanceiroUnificada + 1;
  buscas2.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
  buscas2.Open;

  if not buscas2.IsEmpty then
  begin
    Application.MessageBox(PChar('Não é possível continuar pois' +
     ' existe movimento na Empresa Unifica: ' + #13 + QuotedStr(UpperCase(trim(dataSet.FieldByName('IDENTIFICACAO_EMP').AsString))) +
     ' no dia do financeiro: ' + QuotedStr(FormatDateTime('dd/mm/yyyy', diaFFinanceiroUnificada + 1))),
     'Erro', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
    exit;
  end;

  buscas2.Close;
  buscas2.SQL.Text := ' SELECT FINANCEIRO_UNIFICADO, CODIGO_UNIFICADORA FROM EMPRESA  ' +
    ' WHERE COD_EMPRESA = :COD_EMPRESA ';
  buscas2.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
  buscas2.Open;

   vUnificar := not ((trim(buscas2.FieldByName('FINANCEIRO_UNIFICADO').AsString) = 'S')
     and (buscas2.FieldByName('CODIGO_UNIFICADORA').AsInteger = StrToInt(vDadosIni.codEmpresa)));

  buscas.Close;
  buscas.SQL.Text := ' select ''CHEQUE'' "TIPO", cc.codigo_ctrl "COD_CONTROLE", ' +
   ' c.nome_ctrl "CONTROLE", c.docs, sum(cc.valor_ch) "VALOR", coalesce(c.barrar_automatico, ''N'') "BarrarAutomatico" from controle_cheque cc ' +
   ' left join controles c on c.codigo_ctrl = cc.codigo_ctrl and c.codigo_emp = cc.codigo_emp ' +
   ' where (cc.status_ch = '''' or cc.status_ch is null) ' +
   ' and cc.codigo_emp = :cod_empresa and cc.cod_emp_mult = :cod_emp_mult ' +
   ' group by cc.codigo_ctrl, c.nome_ctrl, c.docs, c.barrar_automatico ' +
   ' union ' +
   ' select ''CREDITOS'' "TIPO", ch.codigo_ctrl "COD_CONTROLE", ' +
   ' c.nome_ctrl "CONTROLE", c.docs, sum(ch.valor_c) "VALOR", coalesce(c.barrar_automatico, ''N'') "BarrarAutomatico" from controle_creditos ch ' +
   ' left join controles c on c.codigo_ctrl = ch.codigo_ctrl and c.codigo_emp = ch.codigo_emp ' +
   ' where (ch.status_c = '''' or ch.status_c is null) ' +
   ' and ch.codigo_emp = :cod_empresa and ch.cod_emp_mult = :cod_emp_mult ' +
   ' group by ch.codigo_ctrl, c.nome_ctrl, c.docs, c.barrar_automatico ' +
   ' union ' +
   ' select ''CONTASPAGAR'' "TIPO", cp.codigo_ctrl "COD_CONTROLE", ' +
   ' c.nome_ctrl "CONTROLE", c.docs, sum(cp.valor_ctp) "VALOR", coalesce(c.barrar_automatico, ''N'') "BarrarAutomatico" from contas_a_pagar cp ' +
   ' left join controles c on c.codigo_ctrl = cp.codigo_ctrl and c.codigo_emp = cp.codigo_emp ' +
   ' where (cp.status_ctp = '''' or cp.status_ctp is null) ' +
   ' and cp.codigo_emp = :cod_empresa and cp.cod_emp_mult = :cod_emp_mult ' +
   ' group by cp.codigo_ctrl, c.nome_ctrl, c.docs, c.barrar_automatico ';
  if vUnificar then
    buscas.SQL.Text := buscas.SQL.Text +
     ' union ' +
     ' select ''SALDOS'' "TIPO", sal.codigo_ctrl "COD_CONTROLE",' +
     ' c.nome_ctrl "CONTROLE", c.docs, sal.val_sld "VALOR", coalesce(c.barrar_automatico, ''N'') "BarrarAutomatico" from sal_ctrl sal ' +
     ' left join controles c on c.codigo_ctrl = sal.codigo_ctrl and c.codigo_emp = sal.cod_emp ' +
     ' where sal.cod_emp = :cod_empresa and sal.data_sld = :data_sld and sal.val_sld > 0 ' +
     ' and (trim(coalesce(c.docs, ''N'')) = ''N'') ';
  buscas.SQL.Text := buscas.SQL.Text +
   ' order by 1 desc, 2 desc ';
  if vUnificar then
    buscas.ParamByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger
  else
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
  buscas.ParamByName('COD_EMP_MULT').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
  if vUnificar then
    buscas.ParamByName('DATA_SLD').AsDate := diaFFinanceiroUnificada;
  buscas.Open;
  buscas.FetchAll;

  FrmUnificarEmpresas.Label3.Caption := 'Favor informar os controles correspondentes ao da empresa unificadora';
  vCtrl._abrirTodosControles(vDadosIni.IfThen(FrmUnificarEmpresas.RadioGroupControle.ItemIndex = 0,
  	'codigo_ctrl', 'nome_ctrl'));

  if vUnificar then
  begin
    FrmUnificarEmpresas.panelControles.Enabled := True;
    FrmUnificarEmpresas.EditMoeda2.Enabled := True;
    FrmUnificarEmpresas.DBLookupComboBox9.Enabled := True;
    FrmUnificarEmpresas.BitBtn22.Enabled := True;
    FrmUnificarEmpresas.btSelectAll.Enabled := True;
    FrmUnificarEmpresas.btUnSelectAll.Enabled := True;
    FrmUnificarEmpresas.btControles.Enabled := True;
    FrmUnificarEmpresas.BitBtn24.Enabled := True;
    FrmUnificarEmpresas.BitBtn1.Enabled := False;
    FrmUnificarEmpresas.RadioGroupReplicador.Enabled := False;
    FrmUnificarEmpresas.EditDataBase.Enabled := False;
    FrmUnificarEmpresas.PanelUnificada.Visible := False;
  end
  else
  begin
    vCtrl._abrirTodosControles(vDadosIni.IfThen(FrmUnificarEmpresas.RadioGroupControle.ItemIndex = 0,
	  	'codigo_ctrl', 'nome_ctrl'), dataSet.FieldByName('COD_EMPRESA').AsInteger);
    FrmUnificarEmpresas.Label3.Caption := 'Favor informar os controles correspondentes ao da empresa unificada';
    FrmUnificarEmpresas.Label5.Caption := 'Favor informar endereço remoto banco de dados empresa unificada';

    FrmUnificarEmpresas.panelControles.Enabled := False;
    FrmUnificarEmpresas.EditMoeda2.Enabled := False;
    FrmUnificarEmpresas.DBLookupComboBox9.Enabled := False;
    FrmUnificarEmpresas.BitBtn22.Enabled := False;
    FrmUnificarEmpresas.btSelectAll.Enabled := False;
    FrmUnificarEmpresas.btUnSelectAll.Enabled := False;
    FrmUnificarEmpresas.btControles.Enabled := False;
    FrmUnificarEmpresas.BitBtn24.Enabled := False;
    FrmUnificarEmpresas.BitBtn1.Enabled := True;
    FrmUnificarEmpresas.RadioGroupReplicador.Enabled := True;
    FrmUnificarEmpresas.EditDataBase.Enabled := False;
    FrmUnificarEmpresas.PanelUnificada.Visible := False;
  end;

  fTempLancamentos.EmptyDataSet;

  buscas.First;
  while not buscas.Eof do
  begin
    fTempLancamentos.Insert;
    fTempLancamentos.FieldByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
    fTempLancamentos.FieldByName('COD_CONTROLE').AsInteger := buscas.FieldByName('COD_CONTROLE').AsInteger;
    fTempLancamentos.FieldByName('CONTROLE').AsString := buscas.FieldByName('CONTROLE').AsString;
    fTempLancamentos.FieldByName('TIPO').AsString := buscas.FieldByName('TIPO').AsString;
    fTempLancamentos.FieldByName('DOCS').AsString := buscas.FieldByName('DOCS').AsString;
    fTempLancamentos.FieldByName('BARRAR_AUTOMATICO').AsString := buscas.FieldByName('BARRARAUTOMATICO').AsString;
    fTempLancamentos.FieldByName('VALOR').AsFloat := buscas.FieldByName('VALOR').AsFloat;
    fTempLancamentos.Post;
    buscas.Next;
  end;

  buscas.Close;
  buscas.SQL.Text := ' select c.codigo_ctrl, c.nome_ctrl, c.docs, coalesce(c.barrar_automatico, ''N'') barrar_automatico from controles c ' +
   ' where codigo_emp = :codigo_emp' +
   ' and ativo <> 99 ' +
   ' order by c.codigo_ctrl ';
  buscas.ParamByName('CODIGO_EMP').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
  buscas.Open;
  buscas.FetchAll;

  fTempControles.EmptyDataSet;
  buscas.First;
  while not buscas.Eof do
  begin
    fTempControles.Insert;
    fTempControles.FieldByName('COD_EMPRESA').AsInteger := dataSet.FieldByName('COD_EMPRESA').AsInteger;
    fTempControles.FieldByName('COD_CONTROLE').AsInteger := buscas.FieldByName('CODIGO_CTRL').AsInteger;
    fTempControles.FieldByName('CONTROLE').AsString := trim(buscas.FieldByName('NOME_CTRL').AsString);
    fTempControles.FieldByName('DOCS').AsString := trim(buscas.FieldByName('DOCS').AsString);
    fTempControles.FieldByName('BARRAR_AUTOMATICO').AsString := buscas.FieldByName('BARRAR_AUTOMATICO').AsString;
    fTempControles.FieldByName('CODIGO_UNIFICADORA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    if not vUnificar then
    begin
      fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger := fTempControles.FieldByName('COD_CONTROLE').AsInteger;
      fTempControles.FieldByName('CONTROLE_UNIFICADORA').AsString := trim(fTempControles.FieldByName('CONTROLE').AsString);
      fTempControles.FieldByName('DOCS_UNIFICADORA').AsString := trim(fTempControles.FieldByName('DOCS').AsString);
      fTempControles.FieldByName('BARRAR_AUTOMATICO_UNIFICADORA').AsString := fTempControles.FieldByName('BARRAR_AUTOMATICO').AsString;
    end;
    fTempControles.Post;
    Buscas.Next;
  end;
  fTempControles.IndexFieldNames := vDadosIni.IfThen(FrmUnificarEmpresas.RadioGroupControle.ItemIndex = 0,
  	 'cod_controle', 'controle');

  fTempLancamentos.First;   
  fTempControles.First;
  vCtrl.First;
end;

procedure TUnificarEmpresa.MudarControles(pCodControle: Integer);
var
 pControleTemp: Integer;
begin
  if pCodControle <> 0 then
  begin
    buscas.Close;
    buscas.SQL.Text := ' SELECT NOME_CTRL, DOCS, COALESCE(BARRAR_AUTOMATICO, ''N'') BARRAR_AUTOMATICO, ATIVO FROM CONTROLES ' +
      ' WHERE CODIGO_CTRL = ' + IntToStr(pCodControle) +
      ' AND CODIGO_EMP = ' + vDadosIni.codEmpresa;
    buscas.Open;

    if buscas.IsEmpty then
    begin
      Application.MessageBox(PChar('Controle não encontrado: ' =
        (trim(fTempControles.FieldByName('CONTROLE').AsString) + ' - ' + trim(fTempControles.FieldByName('DOCS').AsString))), 'Erro', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
      if FrmUnificarEmpresas.EditMoeda2.CanFocus then
        FrmUnificarEmpresas.EditMoeda2.SetFocus;
      exit;
    end
//    else if buscas.FieldByName('ATIVO').AsInteger <> 1 then
//    begin
//      Application.MessageBox(PChar('Controle desativado: ' +
//        (trim(fTempControles.FieldByName('CONTROLE').AsString) + ' - ' + trim(fTempControles.FieldByName('DOCS').AsString))) , 'Erro', MB_OK + MB_ICONINFORMATION +  MB_DEFBUTTON1);
//      if FrmUnificarEmpresas.EditMoeda2.CanFocus then
//        FrmUnificarEmpresas.EditMoeda2.SetFocus;
//      exit;
//    end;
  end;
  fTempControles.Filter := ' COD_CONTROLE = ' +IntToStr(fTempControles.FieldByName('COD_CONTROLE').AsInteger);
  fTempControles.Filtered := true;
  try
    pControleTemp := fTempControles.FieldByName('COD_CONTROLE').AsInteger;
    fTempControles.IndexFieldNames := '';
    fTempControles.First;
    while not fTempControles.Eof do
    begin
      if ((fTempControles.Recno = 1) and (fTempControles.FieldByName('SEL').AsString = '')
      and (fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger <= 0))
      or (pControleTemp = fTempControles.FieldByName('COD_CONTROLE').AsInteger) then
      begin
        fTempControles.Edit;
        fTempControles.FieldByName('SEL').AsString := 'S';
        fTempControles.Post;
      end;

      if fTempControles.FieldByName('SEL').AsString = 'S' then
      begin
         if pCodControle <> 0 then
         begin
//           if (trim(fTempControles.FieldByName('TIPO').AsString) <> 'CONTASPAGAR') then
//            if not ((trim(fTempControles.FieldByName('TIPO').AsString) <> 'CONTASPAGAR') and (trim(fTempControles.FieldByName('BARRAR_AUTOMATICO').AsString) = 'S')) then
           if trim(fTempControles.FieldByName('DOCS').AsString) <> trim(buscas.FieldByName('DOCS').AsString) then
           begin
             Application.MessageBox(Pchar('Controle de Documentos da unificada diferente do controle de documentos da unificadora:' + #13 +
             'Unificada: '
               + IntToStr(fTempControles.FieldByName('COD_CONTROLE').AsInteger) + '.'
               + trim(fTempControles.FieldByName('CONTROLE').AsString) + ' - '
               + trim(fTempControles.FieldByName('DOCS').AsString) + #13 +
             'Unificadora: '
               + IntToStr(pCodControle) + '.'
               + trim(buscas.FieldByName('NOME_CTRL').AsString) + ' - '
               + trim(buscas.FieldByName('DOCS').AsString)),
             'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
             fTempControles.Cancel;
             fTempControles.Filtered := False;
             fTempControles.IndexFieldNames := 'CONTROLE_UNIFICADORA; COD_CONTROLE';
             if FrmUnificarEmpresas.EditMoeda2.CanFocus then
               FrmUnificarEmpresas.EditMoeda2.SetFocus;
             exit;
           end;
           if vUnificar then
           begin
             fTempControles.Edit;
             fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger := pCodControle;
             fTempControles.FieldByName('CONTROLE_UNIFICADORA').AsString := buscas.FieldByName('NOME_CTRL').AsString;
             fTempControles.FieldByName('DOCS_UNIFICADORA').AsString := buscas.FieldByName('DOCS').AsString;
             fTempControles.FieldByName('BARRAR_AUTOMATICO_UNIFICADORA').AsString := buscas.FieldByName('BARRAR_AUTOMATICO').AsString;
             fTempControles.FieldByName('SEL').Value := Null;
             fTempControles.Post;
           end
           else
           begin
             fTempControles.Edit;
             fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger := fTempControles.FieldByName('COD_CONTROLE').AsInteger;
             fTempControles.FieldByName('CONTROLE_UNIFICADORA').AsString := fTempControles.FieldByName('CONTROLE').AsString;
             fTempControles.FieldByName('DOCS_UNIFICADORA').AsString := fTempControles.FieldByName('DOCS').AsString;
             fTempControles.FieldByName('BARRAR_AUTOMATICO_UNIFICADORA').AsString := fTempControles.FieldByName('BARRAR_AUTOMATICO').AsString;
             fTempControles.FieldByName('SEL').Value := Null;
             fTempControles.Post;
           end;
         end
         else
         begin
           fTempControles.Edit;
           fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').Value := Null;
           fTempControles.FieldByName('CONTROLE_UNIFICADORA').Value := Null;
           fTempControles.FieldByName('DOCS_UNIFICADORA').Value := Null;
           fTempControles.FieldByName('BARRAR_AUTOMATICO_UNIFICADORA').Value := Null;
           fTempControles.FieldByName('SEL').Value := Null;
           fTempControles.Post;
         end;
        end;
      fTempControles.Next;
    end;
  finally
    fTempControles.Filtered := False;
    fTempControles.IndexFieldNames := vDadosIni.IfThen(FrmUnificarEmpresas.RadioGroupControle.ItemIndex = 0,
     	 'cod_controle_unificadora; cod_controle', 'cod_controle_unificadora; controle');
    fTempControles.First;

    if fTempControles.FieldByName('CONTROLE_UNIFICADORA').IsNull then
    begin
      fTempControles.Edit;
      fTempControles.FieldByName('SEL').AsString := 'S';
      fTempControles.Post;
    end;

    FrmUnificarEmpresas.EditMoeda2.Text := '0';
    FrmUnificarEmpresas.DBLookupComboBox9.KeyValue := 0;
    if FrmUnificarEmpresas.EditMoeda2.CanFocus then
      FrmUnificarEmpresas.EditMoeda2.SetFocus;
  end;
end;

function TUnificarEmpresa.Split(const Str: string;
  Delimiter: Char): TStringList;
begin
  Result := TStringList.Create;
  Result.LineBreak := Delimiter;
  Result.Text := Str;
end;

procedure TUnificarEmpresa._marcaDesmarcaLinha;
begin
  if fTempControles.IsEmpty then
    exit;

  fTempControles.Edit;
  if fTempControles.FieldByName('SEL').AsString = 'S' then
    fTempControles.FieldByName('SEL').AsString := ''
  else
    fTempControles.FieldByName('SEL').AsString := 'S';
  fTempControles.Post;
end;

procedure TUnificarEmpresa._marcaDesmarcaTodos(pTip: Integer);
begin
  if fTempControles.IsEmpty then
    exit;

  fTempControles.First;
  while not fTempControles.Eof do
  begin
    fTempControles.Edit;
    if pTip = 0 then
      fTempControles.FieldByName('SEL').AsString := ''
    else
      fTempControles.FieldByName('SEL').AsString := 'S';
    fTempControles.Post;

    fTempControles.Next;
  end;

  fTempControles.First;

end;

procedure TUnificarEmpresa._marcaTodosControles;
begin
   try
     if fTempControles.IsEmpty then
       exit;

     fTempControles.First;
     while not fTempControles.Eof do
     begin
      buscas.Close;
      buscas.SQL.Text := ' SELECT CODIGO_CTRL, NOME_CTRL, COALESCE(DOCS, ''N'') DOCS, ' +
        ' COALESCE(BARRAR_AUTOMATICO, ''N'') BARRAR_AUTOMATICO FROM CONTROLES ' +
        ' WHERE CODIGO_EMP = :CODIGO_EMP ' +
        ' AND NOME_CTRL = :NOME_CTRL ' +
        ' AND DOCS = :DOCS ' +
        ' AND ATIVO = 1';
      buscas.ParamByName('CODIGO_EMP').AsInteger := StrToInt(vDadosIni.codEmpresa);
      buscas.ParamByName('NOME_CTRL').AsString := trim(fTempControles.FieldByName('CONTROLE').AsString);
      buscas.ParamByName('DOCS').AsString := trim(fTempControles.FieldByName('DOCS').AsString);
      buscas.Open;

      if not buscas.IsEmpty then
      begin
        fTempControles.Edit;
        fTempControles.FieldByName('COD_CONTROLE_UNIFICADORA').AsInteger := buscas.FieldByName('CODIGO_CTRL').AsInteger;
        fTempControles.FieldByName('CONTROLE_UNIFICADORA').AsString := buscas.FieldByName('NOME_CTRL').AsString;
        fTempControles.FieldByName('DOCS_UNIFICADORA').AsString := buscas.FieldByName('DOCS').AsString;
        fTempControles.FieldByName('BARRAR_AUTOMATICO_UNIFICADORA').AsString := buscas.FieldByName('BARRAR_AUTOMATICO').AsString;
        fTempControles.Post;
      end;
      fTempControles.Next;
     end;
     fTempControles.First;

     if fTempControles.FieldByName('CONTROLE_UNIFICADORA').IsNull then
     begin
       fTempControles.Edit;
       fTempControles.FieldByName('SEL').AsString := 'S';
       fTempControles.Post;
     end;
   finally
     FrmUnificarEmpresas.EditMoeda2.Text := '0';
     FrmUnificarEmpresas.DBLookupComboBox9.KeyValue := 0;
     if FrmUnificarEmpresas.EditMoeda2.CanFocus then
       FrmUnificarEmpresas.EditMoeda2.SetFocus;
   end;
end;

{ TEmpresasUnificadas }

constructor TEmpresasUnificadas.create;
begin
	buscas := TIBQuery(dtmImportPDVFinan.qrEmpresasUnificadas2);
  dataSet := TClientDataSet(dtmImportPDVFinan.cdsEmpresasUnificadas2);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TEmpresasUnificadas._AbrirEmpresaUnif: boolean;
begin
	Result := montaSelect(
  	' select empresa.cod_empresa, (empresa.cod_empresa || '' - '' || empresa.identificacao_emp ||'' - ''|| empresa.cgc_emp) identificacao_emp from empresa ' +
    ' where empresa.cod_empresa = ' + vDadosIni.codEmpresa +
    vDadosIni.IfThen(vDadosIni.vEmp.vFinanceiroUnificado,
	    ' union all ' +
  		' select empresa.cod_empresa, (empresa.cod_empresa || '' - '' || empresa.identificacao_emp ||'' - ''|| empresa.cgc_emp) identificacao_emp from empresa ' +
	    //' inner join empresa_fisica on empresa_fisica.cod_empresa = empresa.cod_empresa ' +
  	  ' where empresa.codigo_unificadora = ' + vDadosIni.codEmpresa +
	    ' and empresa.cod_empresa <> ' + vDadosIni.codEmpresa +
  	  ' and empresa.financeiro_unificado = ''S'' ', '') +
    ' order by 1 ');
end;

{ TConvenioOcorrenciaBancaria }

constructor TConvenioOcorrenciaBancaria.create;
begin
	dataSet := TClientDataSet(dtmImportPDVFinan.cdsOcorrenciasBancaria);
  buscas := TIBQuery(dtmImportPDVFinan.qrquitarcreditos);
  transacao := TIBTransaction(dtmImportPDVFinan.transacao);
end;

function TConvenioOcorrenciaBancaria._AbrirOcorrenciaBancaria(
  pCodigoCobrebem: Integer; pCodigoEmpresa: Integer; pProtocolo: string): boolean;
var
	I: Integer;
begin
	Result := montaselect(
    ' select 1 seqtipo, ' +
    ' bol.n_seq_bol, ' +
    ' bol.cod_empresa, ' +
    ' bol.data_em_bol, ' +
    ' bol.data_ven_bol, ' +
    ' bol.nosso_numero_banco, ' +
    ' bol.n_doc_bol as titulonumerodocumento, ' +
    ' bol.data_ven_bol as titulodatavencimento, ' +
    ' bol.api_situacao, ' +
		' bol.api_codigo_movimento, ' +
    ' bol.api_descr_movimento, ' +
  	' bol.api_pgt_data, ' +
    ' bol.api_pgt_datacredito, ' +
    ' bol.api_pgt_realizado, ' +
    ' coalesce(bol.api_pgt_valorcredito, 0) api_pgt_valorcredito, ' +
    ' coalesce(bol.api_pgt_valorpago, 0) api_pgt_valorpago, ' +
    ' coalesce(bol.api_pgt_valortaxacobranca, 0) api_pgt_valortaxacobranca, ' +
    ' coalesce(bol.api_pgt_valoracrescimos, 0) api_pgt_valoracrescimos, ' +
    ' coalesce(bol.api_pgt_valordesconto, 0) api_pgt_valordesconto, ' +
    ' coalesce(bol.api_pgt_valorabatimento, 0) api_pgt_valorabatimento, ' +
    ' bol.api_pgt_datataxabancaria, ' +
    ' coalesce(bol.api_pgt_valoroutrasdespesas, 0) api_pgt_valoroutrasdespesas, ' +
    ' coalesce(bol.api_pgt_valor_iof, 0) api_pgt_valor_iof, ' +
    ' coalesce(bol.api_pgt_valoroutroscreditos, 0) api_pgt_valoroutroscreditos, ' +
    ' bol.ocorrenciabancaria from boletas bol ' +
    ' where bol.cod_cobrebem = ' + IntToStr(pCodigoCobrebem) +
    ' and bol.cod_empresa = ' + IntToStr(pCodigoEmpresa) +
    ' and bol.api_idretintegracao = ' + QuotedStr(pProtocolo) +
    ' union all ' +
		' select 2 seqtipo, ' +
    ' tit.seqid as n_seq_bol, ' +
    ' tit.cod_empresa, ' +
    ' tit.pagamentodata as data_em_bol, ' +
    ' tit.titulodatavencimento as data_ven_bol, ' +
    ' tit.titulonossonumero as nosso_numero_banco, ' +
    ' tit.titulonumerodocumento, ' +
    ' tit.titulodatavencimento, ' +
    ' null api_situacao, ' +
    ' tit.codigomovimento as api_codigo_movimento, ' +
    ' tit.descricao_movimento as api_descr_movimento, ' +
    ' tit.pagamentodata api_pgt_data, ' +
    ' tit.pagamentodatacredito api_pgt_datacredito, ' +
    ' iif(tit.pagamentorealizado = ''S'', 1, 0) api_pgt_realizado, ' +
    ' coalesce(tit.pagamentovalorcredito, 0) api_pgt_valorcredito, ' +
    ' coalesce(tit.pagamentovalorpago, 0) api_pgt_valorpago, ' +
    ' coalesce(tit.pagamentovalortaxacobranca, 0) api_pgt_valortaxacobranca, ' +
    ' coalesce(tit.pagamentovaloracrescimos, 0) api_pgt_valoracrescimos, ' +
    ' 0 api_pgt_valordesconto, ' +
    ' 0 api_pgt_valorabatimento, ' +
    ' 0 api_pgt_datataxabancaria, ' +
    ' 0 api_pgt_valoroutrasdespesas, ' +
    ' 0 api_pgt_valor_iof, ' +
    ' coalesce(tit.pagamentovaloroutroscreditos, 0) api_pgt_valoroutroscreditos, ' +
    ' tit.ocorrenciabancaria from titulos_nao_conciliados tit ' +
    ' where tit.cod_cobrebem = ' + IntToStr(pCodigoCobrebem) +
    ' and tit.cod_empresa = ' + IntToStr(pCodigoEmpresa) +
    ' and tit.api_protocolo = ' + QuotedStr(pProtocolo) +
//    ' and (select count(*) from controle_creditos cc ' +
//    '      where cc.n_doc_c  = tit.titulonumerodocumento ' +
//    '      and cc.nosso_numero_banco = tit.titulonossonumero) = 0 ' +
//    ' and (select count(*) from controle_creditos cc ' +
//    '      where cc.n_doc_c  = tit.titulonumerodocumento ' +
//    '      and cc.nosso_numero_banco like tit.titulonossonumero || ''%'') = 0 ' +
    ' order by 1 ');
end;

end.

