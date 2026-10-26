{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN SYMBOL_EXPERIMENTAL ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN UNIT_EXPERIMENTAL ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN OPTION_TRUNCATED ON}
{$WARN WIDECHAR_REDUCED ON}
{$WARN DUPLICATES_IGNORED ON}
{$WARN UNIT_INIT_SEQ ON}
{$WARN LOCAL_PINVOKE ON}
{$WARN MESSAGE_DIRECTIVE ON}
unit uCupom;

interface

uses
	uDataSet_OOP, DBClient, Controls, StdCtrls, uRecord, uClasseDAVF, Classes,
	IBQuery, uClassesMigRegistros, uHwF;

type
	TCupom = class;
	TCupom2 = class;
	TResumoD = class;
	TFinCupom = class;
	TComandosImp = class;
	TFormPG = class;
	TTempoOp = class;
  TTotalVenda = class;
  TMeiosPagamento = class;
  TEmpDes = class; //Empresa Desenvolvedora do Sistema
  TIdentFiscal = class;
	TTerminal_Impressoras = class;
	TMovimento_Operador = class;

  TComunic = class
  public
    function receberVendaDoRetaguarda(nPed: integer; TipoVenda: string): boolean;
    function receberPrestacaoDoRetaguarda(nCred: integer): boolean;
    function receberVendaDoRetaguardaPelaDll(nPed: integer; TipoVenda: string): boolean;
    function iniciaFiscalSegundoPlano: boolean;
    procedure showFiscal;

  end;

  TCupom = class(TDataSet_OOP)

  private
    //Dados avulso do cliente.
    vNomeAv, vEndAv, vBairoAv, vCidadeAv, vCpfCnpjAv, vEstado, vPlaca, vKm: string;
    nTotal, vultvl: Currency;
    descontoV, descontoP, acrescimoV, acrescimoP, valorDesconto, valorAcrescimo, descontoPromocional: Currency;
    vrDescontoFechamento, vrAcrescimoFechamento, vDiferencaSubTotal: Currency;
    nRegistro: Integer;
    nCupom, nCCF: string;
    nIt, nNumDAV, nPedVenda, nNumPVenda, vNumCOOCC, vNumCERCC: Integer;
    nDataDav: TDate;
    nValorDav, vValorTributos: Currency;
    vTotalICMS, vTotalISS: Extended;
    vCodVendedor, fCodCliente: integer;
    subTotal: boolean;
    vlinha1, vlinha2, vlinha3, vlinha4, vlinha5, vlinha6, vlinha7, vlinha8: string;
    vSomenteDinheiro: integer;
    memo: TMemo;
    vTempoPausaMilisegundos: integer;
    vListaProdutosIndTec: TStringList;
    FOrcamento: TReg_PedVenda;
    ///Utilizada no momento de efetuar forma de pagamento para dizer quando o finalizador nao é mais dinheiro
  /// para quando o usuario informar dinheiro novamente o sistema nao deixar.
    procedure rodape;
    procedure zeraDadosParaNovoCupom;
    procedure gerarArquivoIndiceTecnico;// este gera a cada venda de cupom fiscal
    procedure gerarArquivoIndiceTecnico2;// este gera quando acionado o menu fiscal
    procedure imprimirIndiceTecnico;
    procedure pausaDesligamento;
    procedure leParametros;
  public
    cancelarTEF, cancelarCupom: string;
    constructor create;
    destructor destroy; override;
    function getNomeAvulso: string;
    function getEnderecoAvulso: string;
    function getBairroAvulso: string;
    function getCidadeAvulso: string;
    function getCpfCnpjAvulso: string;
    function getEstadoAvulso: string;
    function getPlacaAvulso: string;
    function getKmAvulso: string;
    procedure setDadosAvulso(nome, endereco, bairro, cidade, estado, cpfcnpj, placa, km: string; pNomeClienteGravar: string = ''; pLimpar: Boolean = False);
    function selecionaTotalVenda(dataIni, dataFim: TDate): boolean;
    function getTodos: boolean;
    function ultimoCupomEmitido: string;
    function ultimoCupomEmitidoNaoFechado: string;
    function cancelaFinCupomUltimoCupomEmitidoNaoFechado: Boolean;
    function cancelarCupomFiscal: boolean;
    function cancelarUltimoCupom: boolean;
    procedure somaTotal(valor: Currency);
    procedure setUltimoValor(valor: Currency);
    function getUltimoValor: Currency;
		function abreCupom(codFuncionario: integer; horaAbertura: string; pCodCliente: Integer = 0): boolean;
    function selecionaCupom(cod_terminal, nSerieEcf: string; data: TDate): boolean;
      overload;
    function selecionaCupom(registro: integer; cod_terminal, nSerieEcf: string; data: TDate):
      boolean; overload;
    function selecionaCupom(registro, cupom: integer): Boolean; overload;
    function setNCupom(valor: string): boolean;
    function getNCupom: string;
    function getNRegistro: string;
    function setNCCF(valor: string): boolean;
    function getNCCF: string;
    function validaDesconto(maximoPermitido, valor, vrCusProd, maximoProduto: Currency; UsandoPedVenda: Boolean = False): boolean;
    procedure setDescontoPercenentual(valor: Currency);
    procedure setDescontoValor(valor: Currency);
    procedure setAcrescimoPercenentual(valor: Currency);
    procedure setAcrescimoValor(valor: Currency);
    function getDescontoAcrescimoPercenentual: Currency;
    function getDescontoAcrescimoValor: Currency;
    function getDescontoAcrescimoPercentualImpressao(valor: Currency): Currency;
    function getValorDesconto: Currency;
		function vendeItem(grupo: integer; codprod, codBarra, aliquotaIt, descricao: string; qtde,
      preco: Currency; casasDecQtde, casasDecVl: string; vDescAliq, prod_serv: string; AItemOrcamento: TReg_PedVendaProd = nil): boolean;
    function getSubTotal: Currency;
    function cancelaItem: Boolean;
    function setDescontoFechamento(valor: Currency): boolean;
    function setAcrescimoFechamento(valor: Currency): boolean;
    function recebeFormaPag(codFinalizador, tipoFinalizador: integer; valor: Currency): boolean;
    function getValorRestante: Currency;
    function getValorRestanteComSaque: Currency;
    function getValorFinCupom: Currency;
    function getValorPago: Currency;
    function setSubTotal(pSubTotalImp: Boolean = False): boolean;
		function fechaCupomFiscal(codCliente: string): boolean;
    procedure setRateioItens;
    procedure setMemo(vMemo: Tmemo);
    procedure addMensagemMemo(mensagem: string);
    function somenteEmDinheiro: boolean;
    function verificaPrazo(vCupom, vRegistro: string): boolean;
    function verificaOutrosPrazo(vCupom, vRegistro: string): boolean;
    function getValorPrazo: currency;
    procedure setCodVendedor(codigo: Integer; var ATextOut: string);
    procedure setNDAV(pNumDAV, numPedVenda: integer; dataDav: TDate; valorDav: Currency);
    procedure setNContaCliente(pNumCOOCC, pNumCERCC: Integer);
    procedure setNPreVND(pNumPreVnd, numPedVenda: integer; dataPreVnd: TDate; valorDav: Currency);
    function cupomAberto: boolean;
    function existePrazo(finalizador: integer): boolean;
    procedure setDadosRemontagemCupom(pEmSubTotal:boolean);
		function verificaExisteCupomFechadoImpressoraNaoFechadoNoBanco:boolean;
		function indiceTecnicoDeProducao(cImpOuArquivo, cProduto: string): boolean;
    function cupomExiste(pNCupom:  Integer): Boolean;
    procedure Orcamento_getOrcamento(Aped: Integer; var ATextOut: string);
    procedure Orcamento_confereItens;
    function  Orcamento_itensNoOrcamento(Aprod: TProdutoF; var AQtdeSobra: Double): TReg_PedVendaProdList;
    procedure InformeCancelamentoCupomFiscal(NumeroCOO: Integer);

		property emSubTotal: boolean read subTotal;
		property CodVendedor: integer read vCodVendedor;
		property vNumDAV: integer read nNumDAV;
		property vNumPVenda: Integer read nNumPVenda;
		property CodCliente: Integer read fCodCliente;
    property Orcamento: TReg_PedVenda read FOrcamento write FOrcamento;
  var
    vItem: TCupom2;
    vTotalVenda: TTotalVenda;
    vMeiosPag: TMeiosPagamento;
    vFinCupom: TFinCupom;
    vFPg: TFormPG;
    vEmpDes: TEmpDes;
    apagarVendaCancelamento, tipoVenda: string;
  end;

  TTotalVenda = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaPeriodo(dataIni, dataFim: TDate): boolean;
  end;

  TMeiosPagamento = class(TDataSet_OOP)
  public
    vDataSetMP: TClientDataSet;
    vDataIni, vDataFim: TDateTime;
    constructor create;
    function selecionaPeriodo(dataIni, dataFim: TDate): boolean;
    function getValorCancelado(finalizador: integer; dataIni, dataFim: TDate): Currency;
  end;

	TCupom2 = class(TDataSet_OOP)
	public
		constructor create;
		function selecionaItens(nCupom, nRegistro: integer): boolean;
		procedure setEnviadoRetAlterado(nCupom, nRegistro: integer);
		function insert: boolean; override;
    function cancelaItem: boolean;
    function getNItem: Currency;
    function somaItens: Currency;
    function somaItens2: Currency;
    function somaItensGeral: Currency;
    function GetQtdeItem(AGrupoProd: Integer; ACodProd: string): Double;
  var
    vTipo_item, vUnidade: string;
    vCodVendedor: Integer;
  end;

  TMapaResumo = class(TDataSet_OOP)
  private
    FaliqSeq, FCOORed: integer;
  public
    constructor create;
    function getTodos: boolean;
    function gravaMapaResumo(coored: integer; aliq_seq, descaliq: string; valoraliq: Currency):
      boolean;
    function abreMapaResumo(cooRed: integer): boolean;
    function post: boolean; override;
    function insert: boolean; override;
  end;

  TResumoD = class(TDataSet_OOP)
  private
    function abreformConferenciaReducaoZ: boolean;
    function StrToFloatSemPonto(valorSrt:String): Currency;
    procedure setEnviadoRetAlterado(pCOORed: Integer);
  public
    destructor Destroy; override;
    constructor create;
    function getTodos: boolean;
    function selecionaMovimento(pCOORed: Integer): boolean;
    function getDiaDoUltimoMovimento: string;
    function existeMovimento(dataMov: TDate): boolean; overload;
    function existeMovimento(pCOORed: Integer): boolean; overload;
    function gravaResumoD(diaMov: TDate; seqIni, seqFim, nReduc, croMov: string; vendaBrut,
      vendaGeral: Double; mapa: RmapaResumo): Boolean;
    function verificarDadosSintegraSPED(vDataIni, vDataFim: string): boolean;
  var
    mpRes: TMapaResumo;
  end;

  TSangSup = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function post: boolean; overload;
    function post1(finalizador: integer): boolean;
    function sangriaPermitida(finalizador: integer): boolean;
    function cancelarRegistro:boolean;
    function insereSangria: boolean;
    function insereSuprimento: boolean;
    function insereRecebimentoPrestacao: Boolean;
    function getTodos: boolean;
    function abreSangSupParaInclusao: boolean;
    function selecionaSangriaSuprimento(dataIni, dataFim: TDate): boolean;overload;
    function selecionaSangriaSuprimento(pCooNaoFiscal: Integer): boolean;overload;
    procedure verificaCampos;
  var
    vFinCupom: TFinCupom;
  end;

	TFinCupom = class(TDataSet_OOP)
  public
    vValorSaque, vValorDescPremia: Currency;
    vQtdeParcelaCartao: Integer;
    vNumAutorizacao, vNSUTransacao: string;
    constructor create;
    function post: boolean; override;
    function selecionaFinCupom(nCupom, nOrdem: integer; nSerieECF: string): boolean; overload;
    function selecionaFinCupom(codterminal, registro, cupom: Integer): boolean; overload;
    function selecionaFinCupom(codterminal, registro, cupom, finalizador: Integer): boolean;
      overload;
    function cancelaFinCupom: boolean;
    function insereFimCupom(ordem, cupom, finalizador, totalizador, gnf, ccf: integer;
      valor, valor_rel: currency; tipoDoc: string): boolean;
    procedure setEnviadoRetAlterado(registro, cupom: Integer);
  end;

  TComandosImp = class(TDataSet_OOP)
    constructor Create;
    function existeComando(codigo: string; mostraMensagem: boolean): boolean;
    function selecionaComandos: boolean;
  end;

  TFormPg = class(TDataSet_OOP)
    constructor Create;
    function selecionaFormaPg(nCupom, nRegistro: string): boolean;
    function selecionaFormaPgPrazo(nCupom, nRegistro: string): boolean;
    function montaParcelamento(lista: TListBox; parcelas: integer;
      numeroVenda: string; valor: Currency; trintaDias: boolean): boolean; overload;
    function montaParcelamento(lista: TListBox; parcelas, venceDia: integer;
      numeroVenda: string; valor: Currency; trintaDias: boolean): boolean; overload;
    procedure ArredondaParcela(Valor: Currency; Quant: Integer; var vValor: array of Currency);
    function getValorParcela(indice: integer): Currency;
    function getDocParcela(indice: integer): string;
    function getVencimentoParcela(indice: integer): string;
    procedure setValorParcela(indice: integer; valor: Currency);
    procedure setDocParcela(indice: integer; doc: string);
    procedure setVencimentoParcela(indice: integer; pData: string);
    function gravavaParcelasFormPagamento(dtSet: TClientDataSet; vCupom, vRegistro: string): boolean;
  var
    vSecao: Integer;
  end;

  TTempoOp = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function selecionaTempoOperador(codigoOperador: integer): boolean;
    function registraEntradaOperador(codigoOperador: integer): boolean;
    function registraSaidaOperador(codigoOperador: integer): boolean;
    function registraTrocaOperador(codigoSaida, codigoEntrada: Integer): boolean;
    function efetuarFechamentoDeOperador(codigoOperador: integer; pPergunta: Boolean): boolean;
  end;

  TEmpDes = class(TDataSet_OOP)
  public
    constructor create;
    function selecionaEmpDesen: boolean;
  end;

  TTotalizadorNaoFiscal = class(TDataSet_OOP)
  public
    constructor create;
    function getTodos: boolean;
    function selecionaTotalizador(codigo: integer): boolean;
    function cadastraTotalizador(codigo: integer; descricao: string): boolean;
    function post: boolean; override;
  end;

  TPrestacoesCaixa = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
    function abrePrestacoes(dataIni, dataFim: TDate): boolean; overload;
    function abrePrestacoes(cod_cred: integer): boolean; overload;
		function iniciaRecebimentoDePrestacao(dtSet: TClientDataSet): boolean;
    function confirmaRecebimento(totalizador, finalizador, coo: integer): boolean;
	var
    vPrestRet: TPrestacoes_CX;
  end;

  TRecebimentoPrestacao = class(TDataSet_OOP)
  private
    dtSetGrid: TClientDataSet;
  public
    constructor create;
    destructor Destroy; override;
    function atualizaRecPrest: boolean;
    function abreRecebimento: boolean; overload;
    function abreRecebimento(dataIni, dataFim: TDate): boolean; overload;
    function iniciaRecebimento: boolean;
    function insereRecebimento(gnf, finalizador: integer; valor: currency): boolean;
  var
    vTot: TTotalizadorNaoFiscal;
    vSangSup: TSangSup;
    vFinCupom: TFinCupom;
    vPrestCxF: TPrestacoesCaixa;
  end;

  TDoc_Nao_Fiscais = class(TDataSet_OOP)
  public
    constructor create;
    function incluiDocNaoFIscal(vdoc: RDocNaoFiscais): boolean;
  end;

  TIdentFiscal = class(TDataSet_OOP)
  private
    procedure montarAnexoX;
    procedure lerDadosArquivoCriptogravado;
    function getNomeSHouseTEF: string;
  public
    cCNPJ, cIE, cIM, cNOMEEMPRESA, cNOMEPAF, cVERSAO, cMD5LISTA, sNomeSHouse: string;
    constructor create;
    function abreIdentFiscal(vMontarAnexoX:boolean): boolean;
    procedure montaImpressaoIdentificacaoPAFECF;


  end;

	TTerminal_Impressoras = class(TDataSet_OOP)
	public
		constructor create;
		function abreTerminalImpressoras: boolean; overload;
		function abreTerminalImpressoras(numSeroeEcf: string): boolean; overload;
		function atualizaVariaveisEstoque(buscas: TIBQuery): boolean;
	end;

	TMovimento_Operador = class(TDataSet_OOP)
	private
		fNumMovimento: Integer;
		fDiaAberto: TDate;
		fOperador: Integer;
    fDiaFechado: TDate;
	public
		constructor create;
		function abreTodos: Boolean;
		function movimentoAberto: Boolean;
		function movimentoFechado: Boolean;
		function abrirMovimento(pCodOperador: Integer): Boolean;
		function fecharMovimento(pCodOperador: Integer): Boolean;
		function relatorioDeMovimento( var vListRel: TStringList ; pFechamentoOperador: Boolean; pNumMov: Integer = 0): Boolean;

		property numMovimento: Integer read fNumMovimento;
		property diaAberto: TDate read fDiaAberto;
		property diaFechado: TDate read fDiaFechado;
		property operador: Integer read fOperador;
	end;

var
  obMovOP: TMovimento_Operador;

implementation

uses SysUtils, Dialogs, DB, IBDatabase, uPrincipalF,
  Forms, Windows, uDadosIni, uDtmFiscal, uDadosIniFiscal,
  uCondPagF, DateUtils, uDadosReducaoZ, uImpressoraF, IniFiles,
  uDtmEntrada, MaskUtils, uImpressaoNaECF, StrUtils, Contnrs, Math, hw_utils;

function BlockInput(block: boolean): DWORD; stdcall; external 'user32.DLL';

{ TCupom }

function TCupom.abreCupom(codFuncionario: integer; horaAbertura: string;
  pCodCliente: Integer = 0): boolean;
var
	vdata: TDate;
	vRegistro: Integer;
begin
	Result := True;
	try
		vdata := vDadosIniF.vdataGeral;
	except
		vdata := date;
		vDadosIniF.vdataGeral := Date;
	end;
	if not (dataSet.State in [dsInsert, dsEdit]) then
	begin
		selecionaCupom(vDadosIniF.vCodTerminal, vDadosIniF.vNumSerieEcf,
			vDadosIniF.vdataGeral);
		Insert;
		dataSet.FieldByName('data').AsDateTime := vdata;
		dataSet.FieldByName('cod_terminal').AsString := vDadosIniF.vCodTerminal;
		dataSet.FieldByName('cod_empresa').AsString := vDadosIniF.codEmpresa;
		dataSet.FieldByName('nserieecf').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
    dataSet.FieldByName('cupom').AsString := nCupom;
    dataSet.FieldByName('ccf').AsString := nCCF;
    dataSet.FieldByName('colaborador').AsInteger := codFuncionario;
    dataSet.FieldByName('cod_vendedor').AsInteger := vCodVendedor;
    fCodCliente := pCodCliente;
    dataSet.FieldByName('cliente').AsInteger := fCodCliente;
    dataSet.FieldByName('horaabertura').asstring :=
    TimeToStr( StrToTime(horaAbertura) - StrToTime('00:00:01') );
		dataSet.FieldByName('registro').AsInteger := Gencodigo('CUPOM', dtmFiscal.SpIncCodigo,
			vDadosIniF.codEmpresa);
		vRegistro := dataSet.FieldByName('registro').AsInteger;
		dataSet.FieldByName('ped').AsInteger := nPedVenda;
		dataSet.FieldByName('prevenda').AsInteger := nNumDAV;
		if (vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('USAR_MOV_OP').AsString) = 'S') and (not vDadosIniF.strEstaContidoEm(vDadosIniF.vModoSistema, ['S', 'J'])) and (obMovOP.movimentoAberto) then
			dataSet.FieldByName('nmov').AsInteger := obMovOP.numMovimento;
    if Assigned(FOrcamento) then
    begin
      dataSet.FieldByName('nped_orc').AsInteger := FOrcamento.nped;
      dataSet.FieldByName('cliente').AsInteger := FOrcamento.cod_cliente;
      fCodCliente := FOrcamento.cod_cliente;
    end;
		nRegistro := dataSet.FieldByName('registro').AsInteger;
		Post;
		Apply;
		CommitaTransacao;
		selecionaCupom(nRegistro, StrToInt(nCupom));

		buscas.Close;
		buscas.SQL.Text := 'select cupom from cupom' +
			' where cod_terminal = ' + vDadosIniF.vCodTerminal +
			' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
			' and cod_empresa = ' + vDadosIniF.codEmpresa +
			' and registro = ' + IntToStr(vRegistro);
		buscas.Open;

		if buscas.FieldByName('cupom').AsInteger <> StrToIntDef(nCupom, -1) then
		begin
			Application.MessageBox('Cupom fiscal não foi encontrado no banco de dados, favor reiniciar o sistema',
				'Atenção', 0 + 64);
			Result := False;
			zeraDadosParaNovoCupom;
			Exit;
		end;
		vFinCupom.selecionaFinCupom(StrToInt(vDadosIniF.vCodTerminal), nRegistro, StrToInt(nCupom));
		vItem.selecionaItens(StrToInt(trim(nCupom)), nRegistro);
    IniciaTransacao;
    Edit;
    nIt := 0;
    nTotal := 0;
  end;
end;

procedure TCupom.addMensagemMemo(mensagem: string);
begin
  if memo <> nil then
    memo.Lines.Add(mensagem);
end;

function TCupom.cancelaFinCupomUltimoCupomEmitidoNaoFechado: Boolean;
begin
  if Trim(ultimoCupomEmitidoNaoFechado) <> '' then
  begin
    buscas.Close;
    buscas.SQL.Text :=
      'delete from fincupom where cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and ordem = ' + IntToStr(dataSet.FieldByName('registro').AsInteger) +
      ' and cupom = ' + IntToStr(dataSet.FieldByName('cupom').AsInteger) +
      ' and cod_terminal = '+vDadosIniF.vCodTerminal+
      ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf));
    buscas.ExecSQL;
    CommitaTransacao;
  end;
end;

function TCupom.cancelaItem: Boolean;
begin
  try
    Result := false;
    if not vItem.IsEmpty then
    begin
      if vItem.dataSet.State = dsBrowse then
        vItem.Edit;
      if vItem.dataSet.State = dsBrowse then
        raise
          exception.create('Não foi possivel cancelar o item no banco de dados. Item nao ficou em mode de edição');
      somaTotal((-1) * (vItem.dataSet.FieldByName('total').AsFloat -
        vItem.dataSet.FieldByName('perc_desc').AsFloat +
        vItem.dataSet.FieldByName('perc_acresc').AsFloat));
      //      nTotal := nTotal - (vItem.dataSet.FieldByName('total').AsFloat - vItem.dataSet.FieldByName('perc_desc').AsFloat  + vItem.dataSet.FieldByName('perc_acresc').AsFloat  );
      vItem.dataSet.FieldByName('status_it').asstring := 'CANCELADO';
      vItem.dataSet.fieldbyname('aliquota_it').asstring := 'CANC';
//      vItem.dataSet.FieldByName('perc_desc').AsFloat := 0;
//      vItem.dataSet.FieldByName('perc_acresc').AsFloat := 0;
      vItem.Post;
      vItem.Apply;
      vItem.CommitaTransacao;
      result := true;
    end;
  except on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Erro', MB_ICONERROR + mb_OK);
    end;
  end;
end;

function TCupom.cancelarCupomFiscal: boolean;
var
  vVendaRet: TDAVF;
begin
  if (dataSet.State in [dsInsert, dsEdit]) then
  begin
    Cancel;
    CommitaTransacao;
    IniciaTransacao;
  end
  else
  begin
    CommitaTransacao;
    IniciaTransacao;
  end;
  try
    selecionaCupom(dataSet.FieldByName('registro').AsInteger, dataSet.FieldByName('cupom').AsInteger);
  if inherited Edit then
  begin
    dataSet.FieldByName('status_cp').AsString := 'CANCELADO';
    dataSet.FieldByName('enviado_ret2').AsString := 'A'; // A de Alterado
    inherited post;
    Apply;
    CommitaTransacao;
    Result := true;
    vItem.selecionaItens(dataSet.FieldByName('cupom').AsInteger,
      dataSet.FieldByName('registro').AsInteger);
    vItem.First;
    while not vItem.Eof do
    begin
      vItem.cancelaItem;
      vItem.Next;
    end;
    //    setRateioItens;
    Result := true;
    ExecutaComandosSqlExec('delete from formpagamento where nrequisicao = ' +
      dataSet.FieldByName('cupom').AsString +
      ' and tpdocs = ' + QuotedStr('CUP') + ' and cod_empresa = ' + vDadosIniF.codEmpresa);
    vItem.Apply;
    vItem.CommitaTransacao;
    try
      buscas.Close;
      buscas.SQL.Text := 'update fincupom set STATUS_FC = ''CANCELADO'', ENVIADO_RET = ''A''' +
        ' where cod_terminal = ' + IntToStr(dataSet.FieldByName('cod_terminal').AsInteger) +
        ' and nserieecf = ' + QuotedStr(dataSet.FieldByName('nserieecf').AsString) +
        ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger) +
        ' and ordem = ' + IntToStr(dataSet.FieldByName('registro').AsInteger) +
        ' and cupom = ' + IntToStr(dataSet.FieldByName('cupom').AsInteger);
      buscas.ExecSQL;
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;
    except
    end;
    if (dataSet.FieldByName('prevenda').AsInteger = 0) and (dataSet.FieldByName('paf_num_prevenda').AsInteger = 0) then
    begin
      vVendaRet := TDAVF.create;
      if vDadosIniF.bancoConectado <> 'local' then
      try
        if obTermImp = nil then
          obTermImp:= TTerminal_Impressoras.create;
        vVendaRet.apagarVendasRetaguarda := apagarVendaCancelamento;
//        vVendaRet.sincronizaCupomNoRetaguarda(dataSet.FieldByName('cupom').AsInteger,
//          vDadosIniF.MensagemFiscal('Aguarde! Atualizando estoque retaguarda', true));
//        vVendaRet.sincronizaCupomNoRetaguarda(dataSet, vItem.dataSet,
//          vDadosIniF.MensagemFiscal('Aguarde! Atualizando estoque retaguarda', true));
        obTermImp.atualizaVariaveisEstoque(vVendaRet.buscas);
      finally
        obTermImp.Free;
        obTermImp:= nil;
        apagarVendaCancelamento := '';
        vVendaRet.apagarVendasRetaguarda := apagarVendaCancelamento;
        vDadosIniF.limpaMensagem;
      end;
    end
    else
    begin
      vVendaRet := TDAVF.create;
      if vDadosIniF.bancoConectado <> 'local' then
      try
        vVendaRet.apagarVendasRetaguarda := 'N';
//        vVendaRet.sincronizaDAVNoRet(dataSet.FieldByName('cupom').AsInteger,
//          dataSet.FieldByName('registro').AsInteger,
//          dataSet.FieldByName('prevenda').AsInteger,
//          vDadosIniF.MensagemFiscal('Aguarde! Atualizando DAV no Retaguarda', true));
      finally
        apagarVendaCancelamento := '';
        vVendaRet.apagarVendasRetaguarda := apagarVendaCancelamento;
        vDadosIniF.limpaMensagem;
      end;
    end;
    vItem.selecionaItens(0, 0); // Depois de cancelar ele seleciona zero para nao ficar nada em cache
    zeraDadosParaNovoCupom;
  end;
  finally
    selecionaCupom(vDadosIniF.vCodTerminal, vDadosIniF.vNumSerieEcf, vDadosIniF.vdataGeral);
    dataSet.Last;
  end;
end;

function TCupom.cancelarUltimoCupom: boolean;
var
  ncup: string;
begin
  Result := false;
  IndexFieldNames := 'registro';
  Refresh;
  Last;
  ncup := dataSet.FieldByName('cupom').AsString;
  if cancelarCupomFiscal then
  begin
    {vItem.selecionaItens(dataSet.FieldByName('cupom').AsInteger,
      dataSet.FieldByName('registro').AsInteger);
    vItem.First;
    while not vItem.Eof do
    begin
      vItem.cancelaItem;
      vItem.Next;
    end;
    Result := true;
    ExecutaComandosSqlExec('delete from formpagamento where nrequisicao = ' + ncup +
      ' and tpdocs = ' + QuotedStr('CUP') + ' and cod_empresa = ' + vDadosIniF.codEmpresa);
    vItem.Apply;
    vItem.CommitaTransacao;    }
    Result := TRUE;
  end;
end;

procedure TCupom.Orcamento_confereItens;
var
  I: Integer;
  AQtdeCP: Double;
begin
  if not Assigned(FOrcamento) then
    Exit;

  for I := 0 to FOrcamento.Prod.Count - 1 do
  begin
    FOrcamento.Prod.Items[I].aux_cp_orc.clear(FOrcamento.Prod.Items[I]);
//    FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_Disponivel := FOrcamento.Prod.Items[I].quant_ped_item;
//    FOrcamento.Prod.Items[I].orc_cp_qtd_uso  := 0;
  end;

  if not vItem.dataSet.Active then
    vItem.selecionaItens(StrToIntDef(nCupom, 0), nRegistro);

  vItem.dataSet.First;
  while not vItem.dataSet.Eof do
  begin
    AQtdeCP := vItem.dataSet.FieldByName('quantidade').AsFloat;

    if (vItem.dataSet.FieldByName('status_it').AsString <> 'CANCELADO') and
      (vItem.dataSet.FieldByName('prod_serv').AsString = 'P') and
      (vItem.dataSet.FieldByName('nitem_orc').AsInteger > 0) then
      for I := 0 to FOrcamento.Prod.Count - 1 do
        if (vItem.dataSet.FieldByName('grupo_prod').AsInteger = FOrcamento.Prod.Items[I].grupo_prod) and
          (Trim(vItem.dataSet.FieldByName('cod_prod').AsString) = Trim(FOrcamento.Prod.Items[I].cod_prod)) and
          (FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_Disponivel > 0)then
        begin
          if AQtdeCP < FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_Disponivel then
          begin
            FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_Disponivel := FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_Disponivel - vItem.dataSet.FieldByName('quantidade').AsFloat;
            FOrcamento.Prod.Items[I].aux_cp_orc.Desc_Diponivel  := FOrcamento.Prod.Items[I].aux_cp_orc.Desc_Diponivel  - vItem.dataSet.FieldByName('perc_desc').AsFloat;
            FOrcamento.Prod.Items[I].aux_cp_orc.Acres_Diponivel := FOrcamento.Prod.Items[I].aux_cp_orc.Acres_Diponivel  - vItem.dataSet.FieldByName('perc_acresc').AsFloat;
            Break;
          end
          else if AQtdeCP = FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_Disponivel then
          begin
            FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_Disponivel := 0;
            FOrcamento.Prod.Items[I].aux_cp_orc.Desc_Diponivel  := 0;
            FOrcamento.Prod.Items[I].aux_cp_orc.Acres_Diponivel := 0;
            Break;
          end
          else
          begin
            AQtdeCP := AQtdeCP - FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_Disponivel;
            FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_Disponivel := 0;
            FOrcamento.Prod.Items[I].aux_cp_orc.Desc_Diponivel  := 0;
            FOrcamento.Prod.Items[I].aux_cp_orc.Acres_Diponivel := 0;
          end;
        end;

    vItem.dataSet.Next;
  end;
end;

constructor TCupom.create;
begin
  dataSet := TClientDataSet(dtmFiscal.cdsCupom);
  transacao := TIBTransaction(dtmFiscal.transacaoFiscal);
  buscas := TIBQuery(dtmFiscal.qrBuscas);
  vItem := TCupom2.create;
  vFinCupom := TFinCupom.create;
  vFPg := TFormPG.Create;
  vTotalVenda := TTotalVenda.create;
  vEmpDes := TEmpDes.create;
  vMeiosPag := TMeiosPagamento.create;
  vCodVendedor := StrToInt(vDadosIniF.vCodVendedorPadrao);
  leParametros;
end;

function TCupom.cupomAberto: boolean;
begin
	if not dataSet.IsEmpty then
		Result := (dataSet.FieldByName('status_cp').AsString <> 'CANCELADO') and
      (dataSet.FieldByName('horafechamento').AsString = '')
  else
    Result := false;
end;

function TCupom.cupomExiste(pNCupom: Integer): Boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select cupom from cupom' +
    ' where cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and cupom = ' + IntToStr(pNCupom);
  buscas.Open;
  Result := (buscas.FieldByName('cupom').AsInteger > 0) and (pNCupom > 0);
end;

destructor TCupom.destroy;
begin
  vItem.Free;
  vItem := nil;
  vFinCupom.Free;
  vFinCupom := nil;
  vFPg.Free;
  vFPg := nil;
  vTotalVenda.Free;
  vTotalVenda := nil;
  vEmpDes.Free;
  vEmpDes := nil;
  vMeiosPag.Free;
  vMeiosPag := nil;
  inherited;
end;

function TCupom.existePrazo(finalizador: integer): boolean;
begin
  Result := False;
  if finalizador = 0 then
    exit;
  vFinCupom.selecionaFinCupom(StrToInt(vDadosIniF.vCodTerminal),
    dataSet.FieldByName('registro').AsInteger,
    dataSet.FieldByName('cupom').AsInteger, finalizador);
  if not vFinCupom.dataSet.IsEmpty then
    Result := true;
end;

function TCupom.fechaCupomFiscal(codCliente: string): boolean;
var
  horaFechamento: string;
  vVendaRet: TDAVF;
  vValorJaFechado, vValorFechadoImpressora, valorTroco: Currency;
begin
	/// Imprime as formas de pagamento bufferizadas
  if vDadosIniF.vUsaTef = 'E' then
  begin
    cancelarTEF := '';
    cancelarCupom := '';
    vValorJaFechado := 0;

    buscas.Close;
    buscas.SQL.Text :=
      'select sum(fc.valor_desconto) valor_desconto from fincupom fc' +
      ' inner join finalizadores f on f.cod_terminal = fc.cod_terminal and' +
      ' f.nserieecf = fc.nserieecf and f.cod_empresa = fc.cod_empresa and' +
      ' f.cod_finalizador = fc.finalizador' +
      ' where fc.cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and fc.ordem = ' + IntToStr(dataSet.FieldByName('registro').AsInteger) +
      ' and fc.cupom = ' + IntToStr(dataSet.FieldByName('cupom').AsInteger) +
      ' and fc.nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf))+
      ' and fc.valor > 0 ';
    buscas.Open;

    if buscas.FieldByName('valor_desconto').AsFloat > 0 then
    begin
      if vrAcrescimoFechamento > 0 then
      begin
        if buscas.FieldByName('valor_desconto').AsFloat > vrAcrescimoFechamento then
        begin
          vrDescontoFechamento := buscas.FieldByName('valor_desconto').AsFloat - vrAcrescimoFechamento;
          vrAcrescimoFechamento := 0;
        end
        else
        begin
          vrAcrescimoFechamento := vrAcrescimoFechamento - buscas.FieldByName('valor_desconto').AsFloat;
          vrDescontoFechamento := 0;
        end;
      end
      else
        vrDescontoFechamento := vrDescontoFechamento + buscas.FieldByName('valor_desconto').AsFloat;
    end;

    if vrAcrescimoFechamento > 0 then
      result := CImpressoraF.IniciaFechamentoCupom('A', '$', vrAcrescimoFechamento)
    else
      result := CImpressoraF.IniciaFechamentoCupom('D', '$', vrDescontoFechamento);

    if not Result then
    begin
      Result := false;
      cancelarTEF := 'S';
      if (vDadosIniF.vUsaTef = 'E') then
        cancelarCupom := 'S';
      exit;
    end;

    buscas.Close;
    buscas.SQL.Text :=
      'select fc.finalizador, f.descricao, fc.valorsaque, fc.valor_desconto from fincupom fc' +
      ' inner join finalizadores f on f.cod_terminal = fc.cod_terminal and' +
      ' f.nserieecf = fc.nserieecf and f.cod_empresa = fc.cod_empresa and' +
      ' f.cod_finalizador = fc.finalizador' +
      ' where fc.cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and fc.ordem = ' + IntToStr(dataSet.FieldByName('registro').AsInteger) +
      ' and fc.cupom = ' + IntToStr(dataSet.FieldByName('cupom').AsInteger) +
      ' and fc.nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf))+
      ' and fc.valor > 0 '+
      ' order by f.tipo_finalizador desc, fc.registro asc' ;
    if vDadosIniF.GetIni('TEF', 'SW', '') = 'CAPPTA' then
      buscas.SQL.Text := StringReplace(buscas.SQL.Text, 'order by f.tipo_finalizador desc, fc.registro asc', 'order by fc.registro asc', [rfReplaceAll, rfIgnoreCase]);
    buscas.Open;
    buscas.First;

    while not buscas.Eof do
    begin
      obFinalizador.IndexFieldNames := 'COD_FINALIZADOR';
      obFinalizador.FindNearest([buscas.FieldByName('finalizador').AsInteger]);
      vValorFechadoImpressora := StrToFloat(CImpressoraF.ValorPagoCupomAtual);
      if format( '%0.2f',[vValorFechadoImpressora]) =
        format( '%0.2f',[vValorJaFechado]) then
        if not vDadosIniF.efetuaFormaPgto(vDadosIniF.StrToFloatFormat(
          buscas.FieldByName('valorsaque').AsFloat - buscas.FieldByName('valor_desconto').AsFloat,2)) then
        begin
          Result := false;
          cancelarTEF := 'S';
          if (vDadosIniF.vUsaTef = 'E') then
            cancelarCupom := 'S';
          exit;
        end;
      vValorJaFechado := vValorJaFechado +
        buscas.FieldByName('valorsaque').AsFloat - buscas.FieldByName('valor_desconto').AsFloat;
      buscas.Next;
    end;
  end;

  Apply;
	CommitaTransacao;
	selecionaCupom(nRegistro, StrToInt(nCupom));

	vItem.selecionaItens(dataSet.FieldByName('cupom').AsInteger,
		dataSet.FieldByName('registro').AsInteger);

  setRateioItens;
  if dataSet.State = dsBrowse then
    Edit;
  dataSet.FieldByName('VTOTTRIB').AsFloat := vDadosIniF.StrToFloatFormat(vValorTributos, 2);
  dataSet.FieldByName('VALOR_ICM').AsFloat := vDadosIniF.StrToFloatFormat(vTotalICMS, 2);
  dataSet.FieldByName('VALOR_ISS').AsFloat := vDadosIniF.StrToFloatFormat(vTotalISS, 2);

  rodape;
  while not CImpressoraF.TerminaFechamentoCupom(vlinha1, vlinha2, vlinha3, vlinha4, vlinha5,
    vlinha6,
    vlinha7, vlinha8) do
  begin
    if Application.MessageBox(pchar('Impressora Fiscal Não Responde, Tentar Novamente'),
      'Confirmação', MB_ICONQUESTION + MB_YESNO) = mrNo then
    begin
      Result := false;
      exit;
    end;
  end;
  horaFechamento := CImpressoraF.dataHoraUltimoDocumento;
  horaFechamento := copy(horaFechamento, 12, 8);
  if dataSet.State = dsBrowse then
    Edit;
  dataSet.FieldByName('horafechamento').AsString := horaFechamento;

  dataSet.FieldByName('horasubtotal').AsString := CImpressoraF.vFHoraEcf;
  dataSet.FieldByName('VALORCUPOm').AsFloat := getSubTotal;
  dataSet.FieldByName('valor_desc').AsFloat := vrDescontoFechamento;
	dataSet.FieldByName('valor_acres').AsFloat := vrAcrescimoFechamento;

  Apply;
  CommitaTransacao;

  //12/12/2009 09:34:55
  vDadosIniF.EnvCmdsCupom(10);
  //
//  vItem.selecionaItens(dataSet.FieldByName('cupom').AsInteger,
//    dataSet.FieldByName('registro').AsInteger);
  //
//  if (vrDescontoFechamento <> 0) or (vrAcrescimoFechamento <> 0) then
//    setRateioItens;
  if dataSet.State = dsBrowse then
    Edit;
  
  dataSet.FieldByName('horafechamento').AsString := horaFechamento;
  dataSet.FieldByName('cliente').AsString := trim(codCliente);
  dataSet.FieldByName('total').AsFloat := NTOTAL; //getSubTotal;
  dataSet.FieldByName('VALORCUPOm').AsFloat := getSubTotal;
  dataSet.FieldByName('valorpago').AsFloat := getvalorpago;
  //  getSubTotal + ((-1) * getValorRestante);
  dataSet.FieldByName('valor_desc').AsFloat := vrDescontoFechamento;
  dataSet.FieldByName('valor_acres').AsFloat := vrAcrescimoFechamento;
  if vrDescontoFechamento > 0 then
  begin
    dataSet.FieldByName('acres_desc').AsString := 'D';
    dataSet.FieldByName('valoracres_desc').AsFloat := vrDescontoFechamento;
  end
  else if vrAcrescimoFechamento > 0 then
  begin
    dataSet.FieldByName('acres_desc').AsString := 'A';
    dataSet.FieldByName('valoracres_desc').AsFloat := vrAcrescimoFechamento;
  end
  else
  begin
    dataSet.FieldByName('acres_desc').AsString := '';
    dataSet.FieldByName('valoracres_desc').AsFloat := 0;
  end;

//  dataSet.FieldByName('ped').AsInteger := nPedVenda;
//  dataSet.FieldByName('prevenda').AsInteger := nNumDAV;
  dataSet.FieldByName('paf_num_prevenda').AsInteger := nNumPVenda;
  dataSet.FieldByName('coo_conta_cliente').AsInteger := vNumCOOCC;
  dataSet.FieldByName('cer_conta_cliente').AsInteger := vNumCERCC;
//  if nPreVenda > 0 then
//  begin
//    dataSet.FieldByName('data_dav').AsDateTime := nDataDav;
//    dataSet.FieldByName('valor_dav').AsCurrency := nValorDav;
//  end;
	dataSet.FieldByName('status_cp').AsString := '';
	if (vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('USAR_MOV_OP').AsString) = 'S') and (not vDadosIniF.strEstaContidoEm(vDadosIniF.vModoSistema, ['S', 'J'])) and (obMovOP.movimentoAberto) then
    dataSet.FieldByName('nmov').AsInteger := obMovOP.numMovimento;
	dataSet.FieldByName('enviado_ret').AsString := 'A';
	Post;
	Apply;
	CommitaTransacao;
  vItem.setEnviadoRetAlterado(
    dataSet.FieldByName('cupom').AsInteger,
    dataSet.FieldByName('registro').AsInteger);
  vFinCupom.setEnviadoRetAlterado(
    dataSet.FieldByName('registro').AsInteger,
    dataSet.FieldByName('cupom').AsInteger);

  if vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('Abrir_GAveta').AsString) = 'S' then
    vDadosIniF.abreGaveta;
//  if getValorRestanteComSaque < 0 then
//    Application.MessageBox(pchar('Troco: ' + Format('%n', [ (-1) * getValorRestanteComSaque])), 'Atenção', MB_ICONINFORMATION + MB_OK);

  if vDadosIniF.bancoConectado <> 'local' then
    gerarArquivoIndiceTecnico;
  IniciaTransacao;
  if (dataSet.FieldByName('prevenda').AsInteger = 0) and (dataSet.FieldByName('paf_num_prevenda').AsInteger = 0) then
  begin
    vVendaRet := TDAVF.create;
    if vDadosIniF.bancoConectado <> 'local' then
    try
      if obTermImp = nil then
        obTermImp:= TTerminal_Impressoras.create;
//      vVendaRet.sincronizaCupomNoRetaguarda(dataSet.FieldByName('cupom').AsInteger,
//        vDadosIniF.MensagemFiscal('Aguarde! Atualizando estoque retaguarda', true));
//      vVendaRet.sincronizaCupomNoRetaguarda(dataSet, vItem.dataSet,
//        vDadosIniF.MensagemFiscal('Aguarde! Atualizando estoque retaguarda', true));
      obTermImp.atualizaVariaveisEstoque(vVendaRet.buscas);
    finally
      obTermImp.Free;
      obTermImp:= nil;
      vDadosIniF.limpaMensagem;
    end;
  end;
  zeraDadosParaNovoCupom;
  Result := true;
end;

procedure TCupom.gerarArquivoIndiceTecnico;
var
  vVendaRet: TDAVF;
  buscas2: TIBQuery;
  vQtdeProdTxt: Integer;
  vGerouArquivo: Boolean;
  IndiceTxt: TextFile;
  vQtdeIndice: Double;
  vNomeArquivoIndiceTecnico: string;
begin
  try
    vVendaRet := TDAVF.create;
    buscas2 := TIBQuery(vVendaRet.getQueryRetaguarda);
    // Gerar arquivo IndiceTxt(Ncupom).txt
    vQtdeProdTxt := 0;
    vItem.dataSet.First;
    vGerouArquivo := False;
    while not vItem.dataSet.Eof do
    begin
      if vItem.dataSet.FieldByName('tipo_item').AsString = '04' then
      begin
        //verifica se Produto do vItem é tipo_item = 04
        buscas2.Close;
        buscas2.SQL.Clear;
        buscas2.SQL.Add('select grupo_prod, cod_prod from produtos '+
          'where cod_prod = '+ QuotedStr(vItem.dataSet.FieldByName('cod_prod').AsString)+
          'and grupo_prod = '+ vItem.dataSet.FieldByName('grupo_prod').AsString +
          'and cod_empresa = '+ vDadosIniF.codEmpresa +
          'and tipo_item = ''04'' ');
        buscas2.Open;
        if not buscas2.IsEmpty then
        begin
          // pesquisa o indice tecinico do produto.
          buscas2.Close;
          buscas2.SQL.Clear;
          buscas2.SQL.Add('select it.* , pr.* '+
            'from indice_tecnico it '+
            'inner join produtos pr on pr.grupo_prod = it.grupo_prod_mprima and pr.cod_prod = it.cod_prod_mprima and it.cod_empresa = pr.cod_empresa '+
            'where it.grupo_prod_acabado = '+ vItem.dataSet.FieldByName('grupo_prod').AsString +
            'and it.cod_prod_acabado = '+ QuotedStr(vItem.dataSet.FieldByName('cod_prod').AsString)+
            'and it.cod_empresa = '+ vDadosIniF.codEmpresa );
          buscas2.Open;
          buscas2.First;
          if not buscas2.IsEmpty then
          begin

            vQtdeProdTxt := vQtdeProdTxt + 1;

            if vGerouArquivo = false then
            begin

              vNomeArquivoIndiceTecnico:=
                vDadosIniF.vPathArquivosDigitais + '\INDICETEC' +dataSet.FieldByName('cupom').AsString+ '.txt';

              AssignFile( IndiceTxt , vNomeArquivoIndiceTecnico );
              Rewrite(IndiceTxt);
              Append(IndiceTxt);

              WriteLn(IndiceTxt, ('Empresa  : '+ vDadosIniF.vEmp.vRazaoSocial));
              WriteLn(IndiceTxt, ('CNPJ     : '+ vDadosIniF.vEmp.vCNPJ ));
              WriteLn(IndiceTxt, ('INSC.EST : '+ vDadosIniF.vEmp.vIE ));

              WriteLn(IndiceTxt, ( vDadosIniF.replicate('-', 80) ));

              // Monta linha do menu.
              vDadosIniF.AuxStr := vDadosIniF.Space(100);
              vDadosIniF.LimpaLinha(vDadosIniF.AuxStr);
              vDadosIniF.MontaLinha(0003, 'GRUPO' );
              vDadosIniF.MontaLinha(0011, 'CODIGO' );
              vDadosIniF.MontaLinha(0020, 'DESCRICAO' );
              vDadosIniF.MontaLinha(0058, 'UNIDADE' );
              vDadosIniF.MontaLinha(0068, 'QUANTIDADE' );
              WriteLn(IndiceTxt, vDadosIniF.auxstr);
              vDadosIniF.LimpaLinha(vDadosIniF.AuxStr);

              WriteLn(IndiceTxt, ( vDadosIniF.replicate('-', 80) ));
              vGerouArquivo := True;
            end;

            if vQtdeProdTxt > 1 then
              WriteLn(IndiceTxt, ('') );

            // monta a linha do produto acabado.
            WriteLn(IndiceTxt, ('PRODUTO :'));

            vDadosIniF.AuxStr := vDadosIniF.Space(100);
            vDadosIniF.LimpaLinha(vDadosIniF.AuxStr);
            vDadosIniF.MontaLinha(0004, vItem.dataSet.FieldByName('grupo_prod').AsString );
            vDadosIniF.MontaLinha(0011, vItem.dataSet.FieldByName('cod_prod').AsString );
            vDadosIniF.MontaLinha(0020, vItem.dataSet.FieldByName('descr_it').AsString );
            vDadosIniF.MontaLinha(0060, vItem.dataSet.FieldByName('unidade').AsString );
            vDadosIniF.MontaLinha(0072, vItem.dataSet.FieldByName('QUANTIDADE').AsString );
            WriteLn(IndiceTxt, vDadosIniF.auxstr);
            vDadosIniF.LimpaLinha(vDadosIniF.AuxStr);
            WriteLn(IndiceTxt, (''));

            WriteLn(IndiceTxt, ('MATERIA-PRIMA :'));

            buscas2.First;
            while not buscas2.Eof do
            begin
              vQtdeIndice := 0;
              vQtdeIndice := vItem.dataSet.FieldByName('QUANTIDADE').AsFloat * buscas2.FieldByName('quant').AsFloat;

              // monta as linhas da matéria-prima.
              vDadosIniF.AuxStr := vDadosIniF.Space(100);
              vDadosIniF.LimpaLinha(vDadosIniF.AuxStr);
              vDadosIniF.MontaLinha(0004, buscas2.FieldByName('grupo_prod').AsString );
              vDadosIniF.MontaLinha(0011, buscas2.FieldByName('cod_prod').AsString );
              vDadosIniF.MontaLinha(0020, buscas2.FieldByName('descr_prod').AsString );
              vDadosIniF.MontaLinha(0060, buscas2.FieldByName('unidade').AsString );
              vDadosIniF.MontaLinha(0072, CurrToStr (vQtdeIndice) );

              WriteLn(IndiceTxt, vDadosIniF.auxstr);
              vDadosIniF.LimpaLinha(vDadosIniF.AuxStr);

              buscas2.next;
            end;
          end;
        end;
      end;
      vItem.Next;
    end;

    if vGerouArquivo then
    begin
      WriteLn(IndiceTxt, ( vDadosIniF.replicate('-', 80) ));
      WriteLn(IndiceTxt, ('TOTAL DE FORMULAS LISTADAS:    '+ IntToStr (vQtdeProdTxt) +' '));
      WriteLn(IndiceTxt, ( vDadosIniF.replicate('-', 80) ));
      CloseFile(IndiceTxt);
      vDadosIniF.gerarMD5ArquivoEletronico(vNomeArquivoIndiceTecnico);
    end;
    // Aqui termina de Gerar o arquivo IndiceTec(ncupom).txt.
  except
    on e:exception do begin
      Application.MessageBox('Erro ao gerar arquivo de indice técnico', 'Atenção',0+64);
      registraErro('Procedure gerarArquivoIndiceTecnico Erro: '+e.Message);
    end;
  end;
end;

procedure TCupom.gerarArquivoIndiceTecnico2;
var
  I: Integer;
  vNomeArquivo: string;
  nowStr: string;
  vVendaRet: TDAVF;
  buscas2: TIBQuery;
  IndiceTxt: TextFile;
begin
  vDadosIniF.MensagemFiscal('Aguarde... Arquivo Eletronico');
  nowStr := DateTimeToStr(now);
  nowStr := StringReplace(nowStr, '/', '-', [rfReplaceAll, rfIgnoreCase]);
  nowStr := StringReplace(nowStr, ':', '-', [rfReplaceAll, rfIgnoreCase]);
  nowStr := StringReplace(nowStr, ' ', '_', [rfReplaceAll, rfIgnoreCase]);
  vNomeArquivo:= vDadosIniF.vPathArquivosDigitais + '\INDICETEC' +nowStr+ '.txt';

  vVendaRet := TDAVF.create;
  buscas2 := TIBQuery(vVendaRet.getQueryRetaguarda);

  AssignFile( IndiceTxt , vNomeArquivo );
  try
    Rewrite(IndiceTxt);
    WriteLn(IndiceTxt, ('Empresa  : '+ vDadosIniF.vEmp.vRazaoSocial));
    WriteLn(IndiceTxt, ('CNPJ     : '+ vDadosIniF.vEmp.vCNPJ ));
    WriteLn(IndiceTxt, ('INSC.EST : '+ vDadosIniF.vEmp.vIE ));

    WriteLn(IndiceTxt, ( vDadosIniF.replicate('-', 88) ));

    vDadosIniF.AuxStr := vDadosIniF.Space(88);
    vDadosIniF.LimpaLinha(vDadosIniF.AuxStr);
    vDadosIniF.MontaLinha(0002, 'CODIGO' );
    vDadosIniF.MontaLinha(0020, 'DESCRICAO' );
    vDadosIniF.MontaLinha(0059, 'UNID' );
    vDadosIniF.MontaLinha(0068, 'QTDE IND' );
    vDadosIniF.MontaLinha(0082, 'ESTOQUE' );
    WriteLn(IndiceTxt, vDadosIniF.auxstr);
    vDadosIniF.LimpaLinha(vDadosIniF.AuxStr);
    for I := 0 to vListaProdutosIndTec.Count - 1 do
    begin
      WriteLn(IndiceTxt, ( vDadosIniF.replicate('-', 88) ));

      buscas2.Close;
      buscas2.SQL.Text := 'select num_fab_prod, descr_prod, unidade  from produtos '+
        'where cod_prod = '+ QuotedStr(vDadosIniF.getCampoPipe(vListaProdutosIndTec[i],2))+
        'and grupo_prod = '+ vDadosIniF.getCampoPipe(vListaProdutosIndTec[i],1) +
        'and cod_empresa = '+ vDadosIniF.codEmpresa +
        'and tipo_item = ''04'' ';
      buscas2.Open;

      WriteLn(IndiceTxt, ('PRODUTO  : ' +
        Trim(buscas2.FieldByName('num_fab_prod').AsString)+' '+
        Trim(buscas2.FieldByName('descr_prod').AsString)+' '+
        Trim(buscas2.FieldByName('unidade').AsString)));

      WriteLn(IndiceTxt, (''));

      WriteLn(IndiceTxt, ('MATERIA-PRIMA :'));

      vDadosIniF.AuxStr := vDadosIniF.Space(88);

      buscas2.Close;
      buscas2.SQL.Text := 'select it.* , pr.* '+
        'from indice_tecnico it '+
        'inner join produtos pr on pr.grupo_prod = it.grupo_prod_mprima and pr.cod_prod = it.cod_prod_mprima and it.cod_empresa = pr.cod_empresa '+
        'where it.grupo_prod_acabado = '+ vDadosIniF.getCampoPipe(vListaProdutosIndTec[i],1) +
        'and it.cod_prod_acabado = '+ QuotedStr(vDadosIniF.getCampoPipe(vListaProdutosIndTec[i],2))+
        'and it.cod_empresa = '+ vDadosIniF.codEmpresa ;
      buscas2.Open;
      buscas2.First;
      while not buscas2.Eof do
      begin

        vDadosIniF.LimpaLinha(vDadosIniF.AuxStr);
        vDadosIniF.MontaLinha(0002, buscas2.FieldByName('num_fab_prod').AsString );
        vDadosIniF.MontaLinha(0020, copy(Trim(buscas2.FieldByName('descr_prod').AsString),1,38));
        vDadosIniF.MontaLinha(0060, buscas2.FieldByName('unidade').AsString );
        vDadosIniF.MontaLinha(0065, vDadosIniF.AlnDir(
          Format('%6.4f', [buscas2.FieldByName('quant').AsFloat]),11 ));
        vDadosIniF.MontaLinha(0078, vDadosIniF.AlnDir(
          Format('%6.4f', [buscas2.FieldByName('est_f').AsFloat+
          buscas2.FieldByName('est_r').AsFloat]) ,11));

        WriteLn(IndiceTxt, vDadosIniF.auxstr);
        vDadosIniF.LimpaLinha(vDadosIniF.AuxStr);
        buscas2.Next;
      end;
    end;
    WriteLn(IndiceTxt, ( vDadosIniF.replicate('-', 88) ));
    WriteLn(IndiceTxt, 'TOTAL DE FORMULAS LISTADAS : '+IntToStr(vListaProdutosIndTec.Count));
    WriteLn(IndiceTxt, ( vDadosIniF.replicate('-', 88) ));

  finally
    CloseFile(IndiceTxt);
    vDadosIniF.gerarMD5ArquivoEletronico(vNomeArquivo);
    if FileExists(vNomeArquivo) then
      Application.MessageBox(pchar('Arquivo "Tab. Índice Técnico Produção" criado com sucesso' + #13 +
        'O arquivo foi salvo em: ' + vNomeArquivo), 'Atenção', 0 + 64);
  end;
end;

function TCupom.getBairroAvulso: string;
begin
  Result := vBairoAv;
end;

function TCupom.getCidadeAvulso: string;
begin
  Result := vCidadeAv;
end;

function TCupom.getCpfCnpjAvulso: string;
begin
  Result := vCpfCnpjAv;
end;

function TCupom.getDescontoAcrescimoPercenentual: Currency;
begin
  if (obProd.emPromocao) and (descontoPromocional > 0) then
    Result := 0
  else if descontoP > 0 then
    Result := vDadosIniF.StrToFloatFormat((descontoP ),2)
  else if acrescimoP > 0 then
    Result := vDadosIniF.StrToFloatFormat( (acrescimoP * (-1)) ,2)
  else Result := 0;
end;

function TCupom.getDescontoAcrescimoPercentualImpressao(valor: Currency): Currency;
var
  temp: Currency;
begin
  if (obProd.emPromocao) and (descontoPromocional > 0) then
  begin
    temp := vDadosIniF.StrToFloatFormat(descontoPromocional,2);
    Result := temp;// (temp * 100) / valor;
  end
  else if (descontoV > 0) or (descontoP > 0) then
  begin
    temp := vDadosIniF.StrToFloatFormat( ((valor * descontoP) / 100) + descontoV,2);
    Result := temp;// (temp * 100) / valor;
  end
  else if (acrescimoV > 0) or (acrescimoP > 0) then
  begin
    temp := vDadosIniF.StrToFloatFormat( ((valor * acrescimoP) / 100) + acrescimoV,2);
    Result := temp;// (temp * 100) / valor;
  end;
end;

function TCupom.getDescontoAcrescimoValor: Currency;
begin
  if (obProd.emPromocao) and (descontoPromocional > 0) then
    Result := vDadosIniF.StrToFloatFormat(descontoPromocional,2)
  else if descontoV > 0 then
    Result := vDadosIniF.StrToFloatFormat(descontoV,2)
  else if acrescimoV > 0 then
    Result := vDadosIniF.StrToFloatFormat(acrescimoV * (-1),2)
  else result := 0;
end;

function TCupom.getEnderecoAvulso: string;
begin
  Result := vEndAv;
end;

function TCupom.getEstadoAvulso: string;
begin
  result := vestado;
end;

function TCupom.getKmAvulso: string;
begin
  Result := vKm;
end;

function TCupom.getNCCF: string;
begin
  Result := nCCF;
end;

function TCupom.getNCupom: string;
begin
  Result := trim(nCupom);
end;

function TCupom.getNomeAvulso: string;
begin
  Result := vNomeAv;
end;

function TCupom.getNRegistro: string;
begin
  result := inttostr(nRegistro);
end;

procedure TCupom.Orcamento_getOrcamento(Aped: Integer;
  var ATextOut: string);
var
  Astr: string;
  AVenda: TPedVendasRetaguarda;
  ApedIgual: Boolean;
begin
  ATextOut := '';
  ApedIgual := False;

  if Aped = 0 then
  begin
    if nRegistro > 0 then
    begin
      vDadosIniF.ShowErro('Cupom fiscal em andamento');
      Exit;
    end;

    if not InputQuery('Número do orçamento', 'Informe o número do orçamento', Astr) then
      Exit;

    if not TryStrToInt(Astr, Aped) then
    begin
      vDadosIniF.ShowErro('Número informado inválido');
      Exit;
    end;
  end
  else if Assigned(FOrcamento) then
    ApedIgual := Aped = FOrcamento.nped;

  AVenda := TPedVendasRetaguarda.create;
  try
    FOrcamento := AVenda.PedVenda_GetFromPedVenda(Aped, 'ORC');
  finally
    FreeAndNil(AVenda);
  end;

  if not Assigned(FOrcamento) then
    ATextOut := 'Orçamento não encontrado'
  else if FOrcamento.ncupom > 0 then
  begin
    ATextOut := 'Orçamento ' + IntToStr(FOrcamento.nped) + ' já utilizado';
    FreeAndNil(FOrcamento);
  end
  else
  begin
    vCodVendedor := FOrcamento.cod_vendedor;
    ATextOut := 'Orçamento ' + IntToStr(FOrcamento.nped) + IfThen(ApedIgual, ' atualizado', ' selecionado');
    Orcamento_confereItens;
  end;
end;

function TCupom.Orcamento_itensNoOrcamento(
  Aprod: TProdutoF; var AQtdeSobra: Double): TReg_PedVendaProdList;
var
  I: Integer;
  ADescUn: Double;
  AAcresUn: Double;
begin
  Orcamento_confereItens;

  Result     := TReg_PedVendaProdList.Create;
  AQtdeSobra := Aprod.getQuantidade;

  for I := 0 to FOrcamento.Prod.Count - 1 do
    if (Aprod.dataSet.FieldByName('grupo_prod').AsInteger = FOrcamento.Prod.Items[I].grupo_prod) and
      (Trim(Aprod.dataSet.FieldByName('cod_prod').AsString) = Trim(FOrcamento.Prod.Items[I].cod_prod)) and
      (FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_Disponivel > 0) then
    begin
      if (AQtdeSobra < FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_Disponivel) or
         (AQtdeSobra = FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_Disponivel) then
      begin
        ADescUn  := RoundTo(FOrcamento.Prod.Items[I].rateio_desc   / FOrcamento.Prod.Items[I].quant_ped_item, -2);
        AAcresUn := RoundTo(FOrcamento.Prod.Items[I].rateio_acresc / FOrcamento.Prod.Items[I].quant_ped_item, -2);

        ADescUn  := ADescUn  + IfThen((ADescUn  * FOrcamento.Prod.Items[I].quant_ped_item) > FOrcamento.Prod.Items[I].rateio_desc  , -0.01);
        AAcresUn := AAcresUn + IfThen((AAcresUn * FOrcamento.Prod.Items[I].quant_ped_item) > FOrcamento.Prod.Items[I].rateio_acresc, -0.01);

        FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_ParaUsar := AQtdeSobra;
        if AQtdeSobra = FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_Disponivel then
        begin
          FOrcamento.Prod.Items[I].aux_cp_orc.Desc_Usar  := FOrcamento.Prod.Items[I].aux_cp_orc.Desc_Diponivel;
          FOrcamento.Prod.Items[I].aux_cp_orc.Acres_Usar := FOrcamento.Prod.Items[I].aux_cp_orc.Acres_Diponivel;
        end
        else
        begin
          FOrcamento.Prod.Items[I].aux_cp_orc.Desc_Usar  := ADescUn  * FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_ParaUsar;
          FOrcamento.Prod.Items[I].aux_cp_orc.Acres_Usar := AAcresUn * FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_ParaUsar;
        end;

        Result.Add(FOrcamento.Prod.Items[I]);
        AQtdeSobra := 0;
        Break;
      end
//      else if AQtdeSobra = FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_Disponivel then
//      begin
//        FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_ParaUsar := AQtdeSobra;
//        Result.Add(FOrcamento.Prod.Items[I]);
//        AQtdeSobra := 0;
//        Break;
//      end
      else
      begin
        AQtdeSobra := AQtdeSobra - FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_Disponivel;
        FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_ParaUsar := FOrcamento.Prod.Items[I].aux_cp_orc.Qtde_Disponivel;
        FOrcamento.Prod.Items[I].aux_cp_orc.Desc_Usar     := FOrcamento.Prod.Items[I].aux_cp_orc.Desc_Diponivel;
        FOrcamento.Prod.Items[I].aux_cp_orc.Acres_Usar    := FOrcamento.Prod.Items[I].aux_cp_orc.Acres_Diponivel;
        Result.Add(FOrcamento.Prod.Items[I]);
      end;
    end;
end;

function TCupom.getPlacaAvulso: string;
begin
  Result := vPlaca;
end;

function TCupom.getSubTotal: Currency;
var
  subFiscal, subImp: Currency;
begin
  subFiscal := nTotal + vrAcrescimoFechamento - vrDescontoFechamento;
  //  subImp := StrToCurr(CImpressoraF.SubTotal);
  //  vDiferencaSubTotal := subImp - subFiscal;
  //  Result := subImp;
  Result := subFiscal;
end;

function TCupom.getTodos: boolean;
begin
  Result := montaSelect('select * from cupom where cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and cod_terminal = ' + vDadosIniF.vCodTerminal + ' order by registro');
end;

function TCupom.getUltimoValor: Currency;
begin

end;

function TCupom.getValorDesconto: Currency;
begin
  Result := vDadosIniF.StrToFloatFormat( valorDesconto , 2);
end;

function TCupom.getValorFinCupom: Currency;
var
  temp: Currency;
begin
  temp := 0;
  vFinCupom.First;
  while not vFinCupom.DataSet.Eof do
  begin
    temp := temp + vFinCupom.dataSet.FieldByName('valor').AsFloat;
    vFinCupom.Next;
  end;
  Result := temp;
end;

function TCupom.getValorPago: Currency;
var
  temp: Currency;
begin
  temp := 0;
  vFinCupom.First;
  while not vFinCupom.Eof do
  begin
    temp := temp + vFinCupom.dataSet.FieldByName('valorsaque').AsFloat - vFinCupom.dataSet.FieldByName('valor_desconto').AsFloat;
    vFinCupom.Next;
  end;
  Result := temp;
end;

function TCupom.getValorPrazo: currency;
var
  vrPrazo: Currency;
begin
  vrPrazo := 0;
  vFinCupom.First;
  while not vFinCupom.dataSet.Eof do
  begin
    vrPrazo := vrPrazo + vFinCupom.dataSet.FieldByName('valor').AsCurrency;
    vFinCupom.Next;
  end;
  Result := vrPrazo;
end;

function TCupom.getValorRestante: Currency;
var
  temp, temp1: Currency;
begin
  temp := 0;
  vFinCupom.First;
  while not vFinCupom.DataSet.Eof do
  begin
    temp := temp + vFinCupom.dataSet.FieldByName('valor').AsFloat;
    vFinCupom.Next;
  end;
  if vDadosIniF.vUsaTef <> 'E' then
    temp := StrToFloat(CImpressoraF.ValorPagoCupomAtual);
  temp1 := StrToFloat(trim(Format('%10.2f', [getSubTotal])));
  temp1 := temp1 - temp;
  Result := temp1;
end;

function TCupom.getValorRestanteComSaque: Currency;
var
  temp, temp1: Currency;
begin
  temp := 0;
  vFinCupom.First;
  while not vFinCupom.DataSet.Eof do
  begin
    if vFinCupom.dataSet.FieldByName('valorsaque').AsFloat > 0 then
      temp := temp + vFinCupom.dataSet.FieldByName('valorsaque').AsFloat - vFinCupom.dataSet.FieldByName('valor_desconto').AsFloat;
    vFinCupom.Next;
  end;
  if vDadosIniF.vUsaTef <> 'E' then
    temp := StrToFloat(CImpressoraF.ValorPagoCupomAtual);
  temp1 := StrToFloat(trim(Format('%10.2f', [getSubTotal])));
  temp1 := temp1 - temp;
  Result := temp1;
end;

procedure TCupom.imprimirIndiceTecnico;
var
  vTemp: string;
  i:Integer;
  vVendaRet: TDAVF;
  buscas2: TIBQuery;
begin
  try
    vDadosIniF.MensagemFiscal('Aguarde... Imprimindo');
    vTemp := CImpressoraF.TamDescricao(48,'            Tab. Índice Ténico Produção');
    //vTemp := vTemp + vDadosIniF.Replicate('=', 48);
    CImpressoraF.abrerelatorioGer;
    CImpressoraF.RelatorioGerencial2(vTemp);

    vVendaRet := TDAVF.create;
    buscas2 := TIBQuery(vVendaRet.getQueryRetaguarda);

    for I := 0 to vListaProdutosIndTec.Count - 1 do
    begin
      vTemp := vDadosIniF.Replicate('-', 48);
      CImpressoraF.RelatorioGerencial2(vTemp);

      buscas2.Close;
      buscas2.SQL.Text := 'select num_fab_prod, descr_prod, unidade  from produtos '+
        ' where cod_prod = '+ QuotedStr(vDadosIniF.getCampoPipe(vListaProdutosIndTec[i],2))+
        ' and grupo_prod = '+ vDadosIniF.getCampoPipe(vListaProdutosIndTec[i],1) +
        ' and cod_empresa = '+ vDadosIniF.codEmpresa +
        ' and tipo_item = ''04'' ';
      buscas2.Open;

      vTemp := copy(
        CImpressoraF.TamDescricao(48, Trim(buscas2.FieldByName('num_fab_prod').AsString) + ' - '+
        Trim(buscas2.FieldByName('descr_prod').AsString) + ' ' +
        Trim(buscas2.FieldByName('unidade').AsString)),1,48);
      CImpressoraF.RelatorioGerencial2(vTemp);
      vTemp := CImpressoraF.TamDescricao(48, 'MATERIA PRIMA');

      CImpressoraF.RelatorioGerencial2(vTemp);

      buscas2.Close;
      buscas2.SQL.Text := 'select it.* , pr.* '+
        'from indice_tecnico it '+
        'inner join produtos pr on pr.grupo_prod = it.grupo_prod_mprima and pr.cod_prod = it.cod_prod_mprima and it.cod_empresa = pr.cod_empresa '+
        'where it.grupo_prod_acabado = '+ vDadosIniF.getCampoPipe(vListaProdutosIndTec[i],1) +
        'and it.cod_prod_acabado = '+ QuotedStr(vDadosIniF.getCampoPipe(vListaProdutosIndTec[i],2))+
        'and it.cod_empresa = '+ vDadosIniF.codEmpresa ;
      buscas2.Open;
      buscas2.First;
      while not buscas2.Eof do
      begin
        vTemp := copy(
          CImpressoraF.TamDescricao(48, Trim(buscas2.FieldByName('num_fab_prod').AsString) + ' - '+
          Trim(buscas2.FieldByName('descr_prod').AsString) + ' ' +
          Trim(buscas2.FieldByName('unidade').AsString)),1,48);
        vTemp := vTemp +
          CImpressoraF.TamDescricao(48,
            'Qtde Indice: ' + Format('%6.4f', [buscas2.FieldByName('quant').AsFloat])+
            '  Estoque: ' + Format('%7.4f', [buscas2.FieldByName('est_f').AsFloat+
            buscas2.FieldByName('est_r').AsFloat]));
        CImpressoraF.RelatorioGerencial2(vTemp);
        buscas2.Next;
        if not buscas2.Eof then
          CImpressoraF.RelatorioGerencial2(
            CImpressoraF.TamDescricao(48,
            vDadosIniF.Replicate(' ', 16)+
            vDadosIniF.Replicate('-', 16)+
            vDadosIniF.Replicate(' ', 16)));
      end;

    end;

    vTemp := vDadosIniF.Replicate('-', 48);
    CImpressoraF.RelatorioGerencial2(vTemp);

    vTemp := CImpressoraF.TamDescricao(48,
      'TOTAL DE FORMULAS LISTADAS : '+IntToStr(vListaProdutosIndTec.Count));
    CImpressoraF.RelatorioGerencial2(vTemp);

    vTemp := vDadosIniF.Replicate('-', 48);
    CImpressoraF.RelatorioGerencial2(vTemp);

    CImpressoraF.FechaRelatorioGerencial;

    Application.MessageBox(pchar('Relatório "Tab. Índice Técnico Produção" efetuado'), 'Atenção', 0 + 64);
  except
    on e:exception do begin
      Application.MessageBox(pchar('Erro ao gerar imprimir relatório. Erro: '+e.Message), 'Atenção',0+64);
      registraErro('Procedure imprimirIndiceTecnico Erro: '+e.Message);
    end;
  end;
end;

function TCupom.indiceTecnicoDeProducao(cImpOuArquivo,
  cProduto: string): boolean;
var
  vVendaRet: TDAVF;
  buscas2: TIBQuery;
  vQtdeProdTxt: Integer;
  vGerouArquivo: Boolean;
  IndiceTxt: TextFile;
  vQtdeIndice: Double;
  vNomeArquivoIndiceTecnico: string;
  vCodProd: string;
  vGrupo: Integer;
begin
  try
    vListaProdutosIndTec := TStringList.Create;
    vListaProdutosIndTec.Clear;
    vVendaRet := TDAVF.create;
    buscas2 := TIBQuery(vVendaRet.getQueryRetaguarda);

    buscas2.Close;
    if UpperCase(Trim(cProduto)) <> 'TODOS' then
    begin
      buscas2.Close;
      buscas2.SQL.Text := 'select * from cod_barra where'+
        ' cod_barra = '+QuotedStr(Trim(cProduto))+
        ' and cod_empresa = '+vDadosIniF.codEmpresa;
      buscas2.Open;
      if buscas2.IsEmpty then
        raiseExceptionCreate('Produto não encontrado','');

      vGrupo := buscas2.FieldByName('grupo_prod').asInteger;
      vCodProd:= buscas2.FieldByName('cod_prod').AsString;

      buscas2.SQL.Text := 'select grupo_prod, cod_prod from produtos '+
        ' where cod_prod = '+ QuotedStr(vCodProd)+
        ' and grupo_prod = '+ IntToStr(vGrupo) +
        ' and cod_empresa = '+ vDadosIniF.codEmpresa +
        ' and tipo_item = ''04'' and ativo = 1';
    end
    else
      buscas2.SQL.Text := 'select grupo_prod, cod_prod from produtos '+
        ' where cod_empresa = '+ vDadosIniF.codEmpresa +
        ' and tipo_item = ''04'' and ativo = 1';

    buscas2.Open;
    buscas2.First;
    while not buscas2.Eof do
    begin
      vListaProdutosIndTec.Add(
        Trim(buscas2.FieldByName('grupo_prod').AsString)+'|'+
        Trim(buscas2.FieldByName('cod_prod').AsString)+'|');
      buscas2.Next;
    end;

    if buscas2.IsEmpty then
      raiseExceptionCreate('Produto não encontrado, ou não possui indice cadastrado','');

    if cImpOuArquivo = 'I' then
      imprimirIndiceTecnico
    else
      gerarArquivoIndiceTecnico2;
  except
    on e:exception do begin
      Application.MessageBox(pchar(e.Message), 'Atenção',0+64);
      registraErro('function indiceTecnicoDeProducao Erro: '+e.Message);
    end;
  end;
end;

procedure TCupom.InformeCancelamentoCupomFiscal(NumeroCOO: Integer);
var
  Data: TDateTime;
  Registro: Integer;

begin
  try
    
    SqlOpen('select first 1 cupom, ccf, data, total, status_cp, horafechamento,' +
            ' cod_terminal, nserieecf, cod_empresa, registro' +
            ' from cupom' +
            ' where cod_terminal = %s and nserieecf = %s and cod_empresa = %d' +
            ' and cupom = %d' +
            ' order by data desc',
            [vDadosIniF.vCodTerminal, QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)),
             vDadosIniF.cod_empresa, NumeroCOO]);

    if buscas.IsEmpty then
    begin
      ShowErro('Cupom fiscal não encontrado');
      Exit;
    end;

    if Trim(buscas.FieldByName('status_cp').AsString) = 'CANCELADO' then
    begin
      ShowAtencao('Cupom fiscal já cancelado');
      Exit;
    end;      

    if ShowConfirmacao('Confirma o cancelamento do Cupom Fiscal no Sistema?' + sLineBreak + sLineBreak +
                       'COO: %d' + sLineBreak +
                       'CCF: %d' + sLineBreak +
                       'Data: %s' + sLineBreak +
                       'Hora: %s' + sLineBreak +
                       'Valor: %m' + sLineBreak,
                       [NumeroCOO,
                        buscas.FieldByName('ccf').AsInteger,
                        FormatDateTime('dd/MM/YYYY', buscas.FieldByName('data').AsDateTime),
                        FormatDateTime('hh:mm:ss', buscas.FieldByName('horafechamento').AsDateTime),
                        buscas.FieldByName('total').AsFloat],
                       MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
      Exit;

    Data := buscas.FieldByName('data').AsDateTime;
    Registro := buscas.FieldByName('registro').AsInteger;

    SqlExec('update cupom2 set status_it = ''CANCELADO'', aliquota_it = ''CANC'', enviado_ret2 = ''A''' +
            ' where cod_terminal = %s and nserieecf = %s and cod_empresa = %d' +
            ' and ordem = %d and cupom = %d',
            [vDadosIniF.vCodTerminal, QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)),
             vDadosIniF.cod_empresa, Registro, NumeroCOO]);


    SqlExec('update cupom set status_cp = ''CANCELADO'', enviado_ret2 = ''A''' +
            ' where cod_terminal = %s and nserieecf = %s and cod_empresa = %d' +
            ' and registro = %d and cupom = %d and data = %s',
            [vDadosIniF.vCodTerminal, QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)),
             vDadosIniF.cod_empresa, Registro, NumeroCOO,
             QuotedStr(FormatDateTime('YYYY-MM-DD hh:mm:ss', Data))]);

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;

    with vDadosIniF do
      Auditoria('FIS057', 'CANCELAR',
                Format('CANCELADO %s COO %d ', [QuotedStr(vNumSerieEcf), NumeroCOO]),
                'CUPOM', IntToStr(NumeroCOO));

    ShowAtencao('Cupom fiscal cancelado com sucesso no Sistema');

  except on E: Exception do
    begin                       
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Rollback;
      registraErro('TCupom.InformeCancelamentoCupomFiscal: ' + E.Message);
      ShowErro('Não foi possível cancelar o cupom fiscal' + sLineBreak + e.Message);
    end;
  end;
end;

procedure TCupom.leParametros;
var
  ArqIni: string;
  ArqConfig: TiniFIle;
begin
  try
    ArqIni := ExtractFilePath(Application.Exename) + 'hwsistemas.ini';
    if not FileExists(ArqIni) then
      ArqIni := ExtractFilePath(Application.Exename) + 'Config.ini';
    ArqConfig := TIniFile.Create(ArqIni);
    try
      vTempoPausaMilisegundos :=
        StrToInt(ArqConfig.ReadString('Fiscal', 'PausaAposFormaPag', '0'));
    except
      vTempoPausaMilisegundos:=0;
    end;
    ArqConfig.Free;
  except
  end;
end;

procedure TCupom.pausaDesligamento;
begin
  if vTempoPausaMilisegundos > 0 then
    Sleep(vTempoPausaMilisegundos);
end;

function TCupom.recebeFormaPag(codFinalizador, tipoFinalizador: integer;
  valor: Currency): boolean;
var
  tipFinal: integer;
  numeroCCF: string;
begin
  Result := false;
  cancelarTEF := '';
  cancelarCupom := '';
  try //ver isso daqui, ta errado, verificar o finalizador
    tipFinal := tipofinalizador; //vFinCupom.dataSet.FieldByName('tipo_finalizador').AsInteger;
    if (getValorRestante <> getSubTotal) and (tipFinal = 0) and (vSomenteDinheiro = 1) then
      raise exception.create('Valores restantens devem ser pagos em cartão');
    if not emSubTotal then
    begin
      if not setSubTotal then
      begin
        Result := false;
        cancelarTEF := 'S';
        exit;
      end;
      if memo <> nil then
        Memo.Lines.Add('Sub Total R$   ' + Format(' %10.2f', [obCupom.getSubTotal]));
    end;

    if vDadosIniF.vUsaTef <> 'E' then
      if not vDadosIniF.efetuaFormaPgto(vDadosIniF.StrToFloatFormat( valor,2)) then
      begin
        Result := false;
        cancelarTEF := 'S';
        if (vDadosIniF.vUsaTef = 'E') and (obTef.getQtdeCartao >= 1) then
          cancelarCupom := 'S';
        exit;                       
      end;
    if memo <> nil then
      Memo.Lines.Add(obFinalizador.getNomeFinalizador + ' R$ ' + Format(' %10.2f', [valor]));
    if not vFinCupom.Active then
    begin
      vFinCupom.selecionaFinCupom(StrToInt(trim(nCupom)), dataSet.FieldByName('registro').AsInteger,
        vDadosIniF.codifica(vDadosIniF.vNumSerieEcf));
      if not vFinCupom.IsEmpty then
        vFinCupom.cancelaFinCupom;
    end;
    if vDadosIniF.vUsaTef <> 'E' then
      pausaDesligamento;
    numeroCCF := '';
    if not CImpressoraF.vTemMFD then
      numeroCCF := '0'
    else
      while trim(numeroCCF) = '' do //ver aqui o que eu escrevi no txt
      begin
        numeroCCF := CImpressoraF.numeroCCF;
        BlockInput(False);
        if trim(numeroCCF) = '' then
          if Application.MessageBox(pchar('Impressora Fiscal Não Responde, Tentar Novamente?'),
            'Confirmação.', MB_ICONQUESTION + MB_YESNO) = mrNo then
          begin
            Result := false;
            cancelarTEF := 'S';
            cancelarCupom := 'S';
            exit;
          end;
      end;

    vFinCupom.insereFimCupom(dataSet.FieldByName('registro').AsInteger,
      dataSet.FieldByName('cupom').AsInteger, codFinalizador, 0, 0,
      StrToInt(TRIM(numeroCCF)), valor, getValorRestante, 'CUP');
    if vDadosIniF.vUsaTef = 'E' then
      obTef.gravaDadosArquivoBkpFormPagamento(0,0,0,0,'', 0);

    //    vFinCupom.Insert;
    //    vFinCupom.dataSet.FieldByName('cod_terminal').AsInteger :=
    //      dataSet.FieldByName('cod_terminal').AsInteger;
    //    vFinCupom.dataSet.FieldByName('nserieecf').AsString :=
    //      dataSet.FieldByName('nserieecf').AsString;
    //    vFinCupom.dataSet.FieldByName('cod_empresa').AsInteger :=
    //      dataSet.FieldByName('cod_empresa').AsInteger;
    //    vFinCupom.dataSet.FieldByName('ordem').AsInteger := dataSet.FieldByName('registro').AsInteger;
    //    vFinCupom.dataSet.FieldByName('cupom').AsInteger := dataSet.FieldByName('cupom').AsInteger;
    //    vFinCupom.dataSet.FieldByName('finalizador').AsInteger := codFinalizador;
    //    vFinCupom.dataSet.FieldByName('valor').AsFloat := valor;
    //    vFinCupom.dataSet.FieldByName('gnf_ecf').AsInteger := 0;
    //    vFinCupom.Post;
    if (tipFinal >= 1) and (vDadosIniF.vUsaTef = 'I') then
      vSomenteDinheiro := 1;
    Result := true;
  except on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), pchar('Atenção'), mb_OK + MB_ICONINFORMATION);
    end;
  end;
end;

procedure TCupom.rodape;
var
  vtam: integer;
  tempCNPJ, vTemp, vTemp1: string;
  vLinhas: TStringList;
  I: Integer;
begin
  //  if not vEmpDes.Active then
  //    vEmpDes.selecionaEmpDesen;
  //  if not vEmpDes.dataSet.IsEmpty then
  //  begin
  vLinhas := TStringList.Create;

  vLinhas.Clear;
  vTemp := '';
  if (vDadosIniF.vEmp.vSiglaUF = 'DF') then
    vTemp := '"NL"';
  vLinhas.Add('MD-5:' + vDadosIniF.vMD5Fiscal + vTemp);

  vLinhas.Add(
    'Val Aprox Tributos R$' + Format('%0.2n', [dataSet.FieldByName('VTOTTRIB').AsFloat]) +
    ' (' + Format('%0.2f', [dataSet.FieldByName('VTOTTRIB').AsFloat /
     dataSet.FieldByName('VALORCUPOM').AsFloat * 100  ]) +
     '%) Fonte: IBPT');

  if (vDadosIniF.vEmp.vSiglaUF = 'MG') then
  begin
    vTemp1 := vDadosIniF.vEmp.vCNPJ;
    vTemp1 := copy(StringReplace(vTemp1, '.', '', [rfReplaceAll, rfIgnoreCase]),1,14);
    vTemp := FormatDateTime('dd/mm/yyyy',dataSet.FieldByName('data').AsDateTime);
    vTemp := StringReplace(vTemp, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vTemp1 := vTemp1 + ' ' + vTemp ;
    vTemp := Format( '%0.2f', [getSubTotal]);
    vTemp := StringReplace(vTemp, ',', '', [rfReplaceAll, rfIgnoreCase]);
    vTemp := StringReplace(vTemp, '.', '', [rfReplaceAll, rfIgnoreCase]);
    vTemp1 := 'MINAS LEGAL: ' + vTemp1 + ' ' + vTemp ;
    vTemp1 := CImpressoraF.TamDescricao( 48, vTemp1);
    vLinhas.Add(vTemp1);
  end
  else if (vDadosIniF.vEmp.vSiglaUF = 'RJ') then
  begin
    vTemp1 := 'CUPOM MANIA, CONCORRA A PRÊMIOS';
    vTemp1 := CImpressoraF.TamDescricao( 48, vTemp1);
    vLinhas.Add(vTemp1);
    vTemp1 := 'ENVIE SMS P/6789: ';
    vTemp1 := vTemp1 + Copy(vDadosIniF.StrZero(Trim(vDadosIniF.apenasNumeros(vDadosIniF.vEmp.vIE)), 8), 1, 8);
    vTemp := FormatDateTime('dd/mm/yy',dataSet.FieldByName('data').AsDateTime);
    vTemp := StringReplace(vTemp, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vTemp1 := vTemp1 + vTemp;
    vTemp1 := vTemp1 + Copy(vDadosIniF.StrZero( dataSet.FieldByName('CUPOM').AsInteger, 6), 1, 6);
    vTemp1 := vTemp1 + Copy(vDadosIniF.StrZero( dataSet.FieldByName('COD_TERMINAL').AsInteger, 3), 1, 3);
    vTemp1 := CImpressoraF.TamDescricao( 48, vTemp1);
    vLinhas.Add(vTemp1);
  end
	else if (vDadosIniF.vEmp.vSiglaUF = 'DF') then
  begin
    vTemp1 := 'ESTABELECIMENTO INCLUIDO NO PROGRAMA DE';
    vTemp1 := CImpressoraF.TamDescricao( 48, vTemp1);
    vLinhas.Add(vTemp1);
    vTemp1 := 'CONCESSÃO DE CRÉDITOS - LEI n° 4.159/08';
    vTemp1 := CImpressoraF.TamDescricao( 48, vTemp1);
    vLinhas.Add(vTemp1);
    if (dataSet.FieldByName('VALOR_ICM').AsFloat <= 0) and (dataSet.FieldByName('VALOR_ISS').AsFloat <= 0) then
      vTemp1 := 'NOTA LEGAL: ICMS = 0,00'
    else if (dataSet.FieldByName('VALOR_ICM').AsFloat >= 0.01) and (dataSet.FieldByName('VALOR_ISS').AsFloat >= 0.01) then
      vTemp1 := 'NOTA LEGAL: ICMS = ' + Format('%0.2n', [dataSet.FieldByName('VALOR_ICM').AsFloat]) +
        ' ISS = ' + Format('%0.2n', [dataSet.FieldByName('VALOR_ISS').AsFloat])
    else if (dataSet.FieldByName('VALOR_ICM').AsFloat > 0) then
      vTemp1 := 'NOTA LEGAL: ICMS = ' + Format('%0.2n', [dataSet.FieldByName('VALOR_ICM').AsFloat])
    else if (dataSet.FieldByName('VALOR_ISS').AsFloat > 0) then
      vTemp1 := 'NOTA LEGAL: ISS = ' + Format('%0.2n', [dataSet.FieldByName('VALOR_ISS').AsFloat]);
    vLinhas.Add(vTemp1);
  end
  else if (vDadosIniF.vEmp.vSiglaUF = 'PB') then
  begin
    vTemp1 := 'PARAÍBA LEGAL - RECEITA CIDADÃ';
    vTemp1 := CImpressoraF.TamDescricao( 48, vTemp1);
    vLinhas.Add(vTemp1);
    vTemp1 := 'TORPEDO PREMIADO:';
    vTemp1 := CImpressoraF.TamDescricao( 48, vTemp1);
    vLinhas.Add(vTemp1);
    vTemp1 := vDadosIniF.apenasNumeros(vDadosIniF.vEmp.vIE) + ' ';
    vTemp := FormatDateTime('dd/mm/yyyy',dataSet.FieldByName('data').AsDateTime);
    vTemp := StringReplace(vTemp, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vTemp1 := vTemp1 + vTemp + ' ';
    vTemp1 := vTemp1 + Copy(vDadosIniF.StrZero( dataSet.FieldByName('CUPOM').AsInteger, 6), 1, 6) + ' ';
    vTemp := Format( '%0.2f', [getSubTotal]);
    vTemp := StringReplace(vTemp, ',', '', [rfReplaceAll, rfIgnoreCase]);
    vTemp := StringReplace(vTemp, '.', '', [rfReplaceAll, rfIgnoreCase]);
    vTemp1 := vTemp1 + vTemp;
    vTemp1 := CImpressoraF.TamDescricao( 48, vTemp1);
    vLinhas.Add(vTemp1);
  end;

  if nNumPVenda <> 0 then
    vLinhas.Add('PV: ' + vDadosIniF.StrZero(nNumPVenda, vDadosIniF.vQtdeDigDAV))
  else if nNumDAV <> 0 then
  begin
    if trim(tipoVenda) = 'OS' then
    begin
      vLinhas.Add('DAV-OS: ' + vDadosIniF.StrZero(nNumDAV, vDadosIniF.vQtdeDigDAV));
      if vNumCOOCC > 0 then
      begin
        vLinhas.Add('ECF: ' + vDadosIniF.StrZero(vDadosIniF.vCodTerminal, 3)+ ' - Conferência de Conta de Cliente');
        vLinhas.Add('CER nº '+ vDadosIniF.StrZero(vNumCERCC, 3)+' - COO nº '+ vDadosIniF.StrZero(vNumCOOCC, 3));
      end
      else
      begin
        vLinhas.Add('Conta de Cliente ' + IntToStr(nNumDAV));
        vLinhas.Add('SEM EMISSÃO DE CONFERÊNCIA DE CONTA DE CLIENTE');
      end;
    end
    else
      vLinhas.Add('DAV: ' + vDadosIniF.StrZero(nNumDAV, vDadosIniF.vQtdeDigDAV));
  end
  else
  begin
    if dataSet.FieldByName('ped').AsInteger > 0 then
    begin
      if trim(tipoVenda) = 'OS' then
        vLinhas.Add('Documento O.S.: ' + dataSet.FieldByName('ped').AsString)
      else
        vLinhas.Add('Documento: ' + dataSet.FieldByName('ped').AsString);
    end;
  end;
                           
  if vNomeAv <> '' then
	begin
		vlinha8 := '';
		if (vDadosIniF.vEmp.vSiglaUF = 'DF') then
		begin
			if Length(Trim(vDadosIniF.apenasNumeros(Trim(vCpfCnpjAv)))) = 11 then
				tempCNPJ := 'CPF:' + FormatMaskText('999.999.999-99;0;_', Trim(vCpfCnpjAv))
			else if Length(Trim(vDadosIniF.apenasNumeros(Trim(vCpfCnpjAv)))) = 14 then
				tempCNPJ := 'CPF:' + FormatMaskText('99.999.999/9999-99;0;_', Trim(vCpfCnpjAv));
		end
		else
		if Length(vCpfCnpjAv) = 11 then
			tempCNPJ := 'CPF:' + vCpfCnpjAv
		else
			tempCNPJ := 'CNPJ:' + vCpfCnpjAv;

		vLinhas.Add(trim('Cliente: ' + vNomeAv));
		vLinhas.Add(tempCNPJ);
    vLinhas.Add(trim(copy(trim('End.:' + vEndAv), 1, 30) + ',' + copy(vBairoAv, 1, 17)));
    vLinhas.Add(trim(copy(trim(vCidadeAv), 1, 25)) + '-' + trim(copy(trim(vEstado), 1, 12)));

    vLinhas.Add('Ass:_____________________________               ');
    //vlinha9 := '';

  end
  else
  begin
    vLinhas.Add(vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('observacao_cupom').asstring));
    vLinhas.Add(copy('Operador: ' + vDadosIniF.vNomeFuncionario, 1, 40));
  end;
  if (vPlaca <> '') and (trim(vlinha8) = '') then
  begin
    vLinhas.Add('Placa Veiculo: ' + vPlaca + '   Km Veiculo...: ' + vKm);
  end;

  for I := 1 to 8 do
    vLinhas.Add(' ');

  if vLinhas.Count > 1 then
    vlinha1 := vDadosIniF.Space(vLinhas[0], 48);
  if vLinhas.Count > 2 then
    vlinha2 := vDadosIniF.Space(vLinhas[1], 48);
  if vLinhas.Count > 3 then
    vlinha3 := vDadosIniF.Space(vLinhas[2], 48);
  if vLinhas.Count > 4 then
    vlinha4 := vDadosIniF.Space(vLinhas[3], 48);
  if vLinhas.Count > 5 then
    vlinha5 := vDadosIniF.Space(vLinhas[4], 48);
  if vLinhas.Count > 6 then
    vlinha6 := vDadosIniF.Space(vLinhas[5], 48);
  if vLinhas.Count > 7 then
    vlinha7 := vDadosIniF.Space(vLinhas[6], 48);
  if vLinhas.Count > 8 then
    vlinha8 := vDadosIniF.Space(vLinhas[7], 48);

  Exit;


  vLinha4 := vLinha4 + vDadosIniF.space(48 - (Length(vLinha4)));
  vlinha5 := vlinha5 + vDadosIniF.space(48 - (Length(vlinha5)));
  vlinha6 := vlinha6 + vDadosIniF.space(48 - (Length(vlinha6)));
  vlinha7 := vlinha7 + vDadosIniF.space(48 - (Length(vlinha7)));

/////////////////////////////////////////////////
  vlinha1 := 'MD-5:' + vDadosIniF.vMD5Fiscal;
  //    vlinha1 := copy(vEmpDes.dataSet.FieldByName('nome_empdes').AsString, 1, 31) + ' IM:' +
  //      vEmpDes.dataSet.FieldByName('IM_EMPDES').AsString;
  //    vlinha2 := 'CNPJ:' + vEmpDes.dataSet.FieldByName('CNPJ_EMPDES').AsString +
  //      ' IE:' + vEmpDes.dataSet.FieldByName('IE_EMPDES').AsString;
  vlinha1 := vlinha1 + vDadosIniF.space(48 - (Length(vlinha1)));
  //    vlinha2 := vlinha2 + vDadosIniF.space(48 - (Length(vlinha2)));
  //  end;
  vlinha2 := '';
  vlinha3 := '';
  vlinha4 := '';
  vlinha5 := '';
  vlinha6 := '';
  vlinha7 := '';
  vlinha8 := '';

  if (vDadosIniF.vEmp.vSiglaUF = 'MG') then
  begin
    vlinha2 := vDadosIniF.vEmp.vCNPJ;
    vlinha2 := copy(StringReplace(vlinha2, '.', '', [rfReplaceAll, rfIgnoreCase]),1,14);
    vTemp := FormatDateTime('dd/mm/yyyy',dataSet.FieldByName('data').AsDateTime);
    vTemp := StringReplace(vTemp, '/', '', [rfReplaceAll, rfIgnoreCase]);
    vlinha2 := vlinha2 + ' ' + vTemp ;
    vTemp := Format( '%0.2f', [getSubTotal]);
    vTemp := StringReplace(vTemp, ',', '', [rfReplaceAll, rfIgnoreCase]);
    vTemp := StringReplace(vTemp, '.', '', [rfReplaceAll, rfIgnoreCase]);
    vlinha2 := 'MINAS LEGAL: ' + vlinha2 + ' ' + vTemp ;
    vLinha2 := CImpressoraF.TamDescricao( 48, vLinha2);
  end;

  if nNumPVenda <> 0 then
  begin
    vlinha3 := 'PV: ' + vDadosIniF.StrZero(nNumPVenda, vDadosIniF.vQtdeDigDAV);
    vlinha3 := vlinha3 + vDadosIniF.space(48 - (Length(vlinha3)));
  end
  else if nNumDAV <> 0 then
  begin
    //    vlinha9 := 'Documento DAV: ' + vDadosIniF.StrZero(nPreVenda,vDadosIniF.vQtdeDigDAV);
    if trim(tipoVenda) = 'OS' then
      vlinha3 := 'DAV-OS: ' + vDadosIniF.StrZero(nNumDAV, vDadosIniF.vQtdeDigDAV)
    else
      vlinha3 := 'DAV: ' + vDadosIniF.StrZero(nNumDAV, vDadosIniF.vQtdeDigDAV);
    vlinha3 := vlinha3 + vDadosIniF.space(48 - (Length(vlinha3)));
  end
  else
  begin
    if dataSet.FieldByName('ped').AsInteger > 0 then
    begin
      vlinha3 := 'Documento O.S.: ' + dataSet.FieldByName('ped').AsString;
      vlinha3 := vlinha3 + vDadosIniF.space(48 - (Length(vlinha3)));
    end;
  end;

  if vNomeAv <> '' then
  begin
    vlinha8 := '';
    if Length(vCpfCnpjAv) = 11 then
      tempCNPJ := 'CPF:'
    else
      tempCNPJ := 'CNPJ:';
    vLinha4 := trim('Cliente: ' + vNomeAv);
    vlinha5 := tempCNPJ + vCpfCnpjAv;
    vlinha6 := trim(copy(trim('End.:' + vEndAv), 1, 30) + ',' + copy(vBairoAv, 1, 17));
    vlinha7 := trim(copy(trim(vCidadeAv), 1, 25)) + '-' + trim(copy(trim(vEstado), 1, 12));
    //+ tempCNPJ + vCpfCnpjAv);
    vlinha8 := 'Ass:_____________________________               ';
    //vlinha9 := '';
    vLinha4 := vLinha4 + vDadosIniF.space(48 - (Length(vLinha4)));
    vlinha5 := vlinha5 + vDadosIniF.space(48 - (Length(vlinha5)));
    vlinha6 := vlinha6 + vDadosIniF.space(48 - (Length(vlinha6)));
    vlinha7 := vlinha7 + vDadosIniF.space(48 - (Length(vlinha7)));
  end
  else
  begin
    vLinha4 := vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('observacao_cupom').asstring);
    vlinha5 := copy('Operador: ' + vDadosIniF.vNomeFuncionario, 1, 40);
    vlinha6 := '';
    vlinha7 := '';
    vlinha8 := '';
    //vlinha9 := '';
    vLinha4 := vLinha4 + vDadosIniF.space(48 - (Length(vLinha4)));
    vlinha5 := vlinha5 + vDadosIniF.space(48 - (Length(vlinha5)));
  end;
  if (vPlaca <> '') and (trim(vlinha8) = '') then
  begin
    vlinha8 := 'Placa Veiculo: ' + vPlaca + '   Km Veiculo...: ' + vKm;
    vlinha8 := vlinha8 + vDadosIniF.space(48 - (Length(vlinha8)));
  end;
end;

function TCupom.selecionaCupom(cod_terminal, nSerieEcf: string;
  data: TDate): boolean;
begin
  Result := montaSelect('select * from cupom where cod_terminal = ' + cod_terminal +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(nSerieEcf)) +
    ' and data = :data1 and data = :data2',
    vDadosIniF.vdataGeral, vDadosIniF.vdataGeral);
end;

function TCupom.selecionaCupom(registro: integer; cod_terminal, nSerieEcf: string;
  data: TDate): boolean;
begin
  Result := montaSelect('select * from cupom where cod_terminal = ' + cod_terminal +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(nSerieEcf)) + ' and registro = ' +
    IntToStr(registro) +
    ' and data = :data1 and data = :data2', vDadosIniF.vdataGeral, vDadosIniF.vdataGeral);
end;

function TCupom.selecionaTotalVenda(dataIni, dataFim: TDate): boolean;
begin
  //select it.codbarra,sum(it.quantidade) as soma from cupom2 it,cupom cp
  //where it.ordem = cp.registro and it.cupom = cp.cupom and cp.data >= :vdat1
  //and cp.data <= :vdat2 and status_cp <> 'CANCELADO'
  //group by it.codbarra
end;

function TCupom.setAcrescimoFechamento(valor: Currency): boolean;
begin
  result := false;
  if (emSubTotal) then
  begin
    Application.MessageBox('Cupom já foi totalizado', 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    exit;
  end;
//  if valor >= obCupom.getSubTotal then
//  begin
//    Application.MessageBox('Valor do acréscimo maior ou igual ao valor do cupom', 'Atenção',
//      MB_ICONEXCLAMATION + MB_OK);
//    exit;
//  end;
  if valor <= 0 then
  begin
    Application.MessageBox('Valor do acréscimo não pode ser menor ou igual a zero', 'Atenção',
      MB_ICONEXCLAMATION + MB_OK);
    exit;
  end;
  vrAcrescimoFechamento := vDadosIniF.StrToFloatFormat( valor,2);
  result := true;
end;

procedure TCupom.setAcrescimoPercenentual(valor: Currency);
begin
  acrescimoP := vDadosIniF.StrToFloatFormat( valor,2);
  descontoV := 0;
  descontoP := 0;
end;

procedure TCupom.setAcrescimoValor(valor: Currency);
begin
  acrescimoV := vDadosIniF.StrToFloatFormat( valor,2);
  descontoV := 0;
  descontoP := 0;
end;

procedure TCupom.setCodVendedor(codigo: Integer; var ATextOut: string);
var
  Astr: string;
begin
  ATextOut := '';

  if codigo = 0 then
  begin
    if nPedVenda > 0 then   
    begin
      vDadosIniF.ShowErro('Vendedor não pode ser alterado neste momento');
      Exit;
    end;

    if not InputQuery('Código do vendedor', 'Informe o código do vendedor', Astr) then
      Exit;

    if not TryStrToInt(Astr, codigo) then
    begin
      vDadosIniF.ShowErro('Código informado inválido');
      Exit;
    end;

    if obEmpresa.SqlOpen('select c.cod_vendedor, c.nome_vendedor, f.desc_funcao from colaborador c' +
                         ' inner join funcoes f on f.cod_funcao  = c.cod_funcao' +
                         ' where c.cod_empresa = ' + vDadosIniF.codEmpresa +
                         ' and c.cod_vendedor = ' + IntToStr(codigo) +
                         ' and c.ativo = 1 ' +
                         ' and f.desc_funcao like ''%VEND%''').IsEmpty then
      if obEmpresa.SqlOpen('select c.cod_vendedor, c.nome_vendedor, f.desc_funcao from colaborador c' +
                           ' left join funcoes f on f.cod_funcao  = c.cod_funcao' +
                           ' where c.cod_empresa = ' + vDadosIniF.codEmpresa +
                           ' and c.cod_vendedor = ' + IntToStr(codigo) +
                           ' and c.ativo = 1 ').IsEmpty then
      begin
        vDadosIniF.ShowErro('Colaborador não encontrado com o código informado');
        Exit;
      end;

    if nRegistro > 0 then
    begin
      if vItem.dataSet.RecordCount > 0 then
        if vDadosIniF.ShowConfirmacao('Itens já emitidos, o vendedor deles será alterado. Continuar?') <> IDYES then
          Exit;

      dataSet.Edit;
      dataSet.FieldByName('cod_vendedor').AsInteger := codigo;
      dataSet.Post;
      dataSet.ApplyUpdates(-1);
      CommitaTransacao;

      if vItem.dataSet.RecordCount > 0 then
          if SqlExec('update cupom2 set cod_vendedor = ' + IntToStr(codigo) +
                     ', enviado_ret = ''A''' +
                     ' where cupom = ' + (nCupom) +
                     ' and ordem = ' + IntToStr(nRegistro) +
                     ' and cod_terminal = ' + vDadosIniF.vCodTerminal +
                     ' and cod_empresa  = ' + vDadosIniF.codEmpresa +
                     ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf))
                     ).Transaction.InTransaction then
            buscas.Transaction.Commit;
    end;

    ATextOut := IfThen(Pos('VEND', obEmpresa.buscas.FieldByName('desc_funcao').AsString) > 0, 'Vendedor: ', 'Colaborador: ') +
                obEmpresa.buscas.FieldByName('cod_vendedor').AsString + ' - ' +
                Trim(obEmpresa.buscas.FieldByName('nome_vendedor').AsString);
  end;

  vCodVendedor := codigo;
end;

procedure TCupom.setDadosAvulso(nome, endereco, bairro, cidade, estado, cpfcnpj,
  placa, km: string; pNomeClienteGravar: string; pLimpar: Boolean);
begin
  if not pLimpar then
  begin
    if dataSet.State = dsBrowse then
      dataSet.Edit;

    dataSet.FieldByName('cpfcgc').AsString := cpfcnpj;
    if Trim(pNomeClienteGravar) <> '' then
      dataSet.FieldByName('nome_cliente').AsString := Trim(pNomeClienteGravar)
    else
      dataSet.FieldByName('nome_cliente').AsString := nome;
    Post;
    Apply;
    CommitaTransacao;
  end;

  vNomeAv := nome;
  vEndAv := endereco;
  vBairoAv := bairro;
  vCidadeAv := cidade;
  vEstado := estado;
  vCpfCnpjAv := cpfcnpj;
  vPlaca := placa;
  vKm := km;
end;

procedure TCupom.setDadosRemontagemCupom(pEmSubTotal: boolean);
begin

	if (vDadosIniF.vUsaTef <> 'E') and (StrToFloat(CImpressoraF.ValorPagoCupomAtual) > 0) then
		subTotal := True
	else
		subTotal := pEmSubTotal;
	nCupom := CImpressoraF.NumeroCupom;
	nRegistro := dataSet.FieldByName('registro').AsInteger;
	nTotal := dataSet.FieldByName('total').AsCurrency ;
	vrAcrescimoFechamento := dataSet.FieldByName('valor_acres').AsCurrency ;
	vrDescontoFechamento:= dataSet.FieldByName('valor_desc').AsCurrency ;
	vItem.dataSet.Last;
  nIt := vItem.dataSet.FieldByName('nitem').AsInteger;
end;

function TCupom.setDescontoFechamento(valor: Currency): boolean;
begin
  result := false;
//  if (emSubTotal) then
//  begin
//    Application.MessageBox('Cupom já foi totalizado', 'Atenção', MB_ICONEXCLAMATION + MB_OK);
//    exit;
//  end;
  if valor >= obCupom.getSubTotal then
  begin
    Application.MessageBox('Valor do desconto maior ou igual ao valor do cupom', 'Atenção',
      MB_ICONEXCLAMATION + MB_OK);
    exit;
  end;
  if valor <= 0 then
  begin
    Application.MessageBox('Valor do desconto não pode ser menor ou igual a zero', 'Atenção',
      MB_ICONEXCLAMATION + MB_OK);
    exit;
  end;
  vrDescontoFechamento := vDadosIniF.StrToFloatFormat( valor,2);
  result := true;
end;

procedure TCupom.setDescontoPercenentual(valor: Currency);
begin
  descontoP := vDadosIniF.StrToFloatFormat( valor,2);
  acrescimoP := 0;
  acrescimoV := 0;
end;

procedure TCupom.setDescontoValor(valor: Currency);
begin
  if obProd.emPromocao then
  begin
    descontoPromocional := vDadosIniF.StrToFloatFormat( valor,2);
    exit;
  end
  else
    descontoV := vDadosIniF.StrToFloatFormat( valor,2);
  acrescimoP := 0;
  acrescimoV := 0;
end;

procedure TCupom.setMemo(vMemo: Tmemo);
begin
  memo := TMemo(vMemo);
end;

function TCupom.setNCCF(valor: string): boolean;
begin
  nCCF := valor;
end;

function TCupom.setNCupom(valor: string): boolean;
begin
  try
    StrToInt(trim(valor));
  except
    application.MessageBox(pchar('Erro ao converter Nº Cupom'), 'Informação', MB_ICONINFORMATION
      + mb_OK);
  end;
  nCupom := Copy(valor, 1, 6);
end;

procedure TCupom.setNContaCliente(pNumCOOCC, pNumCERCC: Integer);
begin
  vNumCOOCC := pNumCOOCC;
  vNumCERCC := pNumCERCC;
end;

procedure TCupom.setNDAV(pNumDAV, numPedVenda: integer; dataDav: TDate; valorDav: Currency);
begin
  nNumDAV := pNumDAV;
  nPedVenda := numPedVenda;
  nDataDav := dataDav;
  nValorDav := valorDav;
end;

procedure TCupom.setNPreVND(pNumPreVnd, numPedVenda: integer; dataPreVnd: TDate;
  valorDav: Currency);
begin
  nNumPVenda := pNumPreVnd;
  nPedVenda := numPedVenda;
  nDataDav := dataPreVnd;
  nValorDav := valorDav;
end;

procedure TCupom.setRateioItens;
var
  marcador: Pointer;
  soma, soma2: Currency;
  vTempCSTPIS: string;
  vValorTmp: Extended;
begin
  vValorTributos := 0;
  vTotalICMS := 0;
  vTotalISS := 0;
  if dataSet.FieldByName('status_cp').AsString = 'CANCELADO' then
  begin
    soma := vItem.somaItensGeral;
    soma2 := soma;
  end
  else
  begin
    soma := vItem.somaItens;
    if soma = 0 then
      soma2 := vItem.somaItens2
    else
      soma2 := soma;
  end;
  vItem.First;
  while not vItem.dataSet.Eof do
  begin
    if vItem.dataSet.State = dsBrowse then
      vItem.Edit;
    vItem.dataSet.FieldByName('RAT_DESC').AsFloat := 0;
    if ((vItem.dataSet.FieldByName('prod_serv').AsString = 'P') or
      ((vDadosIniF.vDescontoISS = 'S') and (vItem.dataSet.FieldByName('prod_serv').AsString = 'S')))
      and (vItem.dataSet.FieldByName('status_it').AsString <> 'CANCELADO') then
      vItem.dataSet.FieldByName('RAT_DESC').AsFloat := (vItem.dataSet.FieldByName('TOTAL').AsFloat
        * vrDescontoFechamento) / soma;
    vItem.dataSet.FieldByName('RAT_DG').AsFloat := vItem.dataSet.FieldByName('RAT_DESC').AsFloat;
    if vItem.dataSet.FieldByName('status_it').AsString <> 'CANCELADO' then
      vItem.dataSet.FieldByName('RAT_ACRES').AsFloat := (vItem.dataSet.FieldByName('TOTAL').AsFloat
        * vrAcrescimoFechamento) / soma2;
    
    if vItem.dataSet.FieldByName('aliquota').AsFloat > 0 then
    begin
      vValorTmp := vItem.dataSet.FieldByName('TOTAL').AsFloat +
        (vItem.dataSet.FieldByName('RAT_ACRES').AsFloat + vItem.dataSet.FieldByName('PERC_ACRESC').AsFloat) -
        (vItem.dataSet.FieldByName('RAT_DESC').AsFloat + vItem.dataSet.FieldByName('PERC_DESC').AsFloat);
      vValorTmp := vValorTmp * vItem.dataSet.FieldByName('aliquota').AsFloat / 100;
      vItem.dataSet.FieldByName('VALOR_IMPOSTO').AsFloat := vDadosIniF.StrToFloatFormat(vValorTmp, 2);
    end;

    if vItem.dataSet.FieldByName('status_it').AsString <> 'CANCELADO' then
    begin
      if Trim(vItem.dataSet.FieldByName('prod_serv').AsString) = 'P' then
        vTotalICMS := vTotalICMS + vItem.dataSet.FieldByName('VALOR_IMPOSTO').AsFloat
      else
        vTotalISS := vTotalISS + vItem.dataSet.FieldByName('VALOR_IMPOSTO').AsFloat;

      vItem.dataSet.FieldByName('VTOTTRIB').AsFloat :=
        ((vItem.dataSet.FieldByName('TOTAL').AsFloat +
        (vItem.dataSet.FieldByName('RAT_ACRES').AsFloat +
        vItem.dataSet.FieldByName('PERC_ACRESC').AsFloat) -
        (vItem.dataSet.FieldByName('RAT_DESC').AsFloat +
        vItem.dataSet.FieldByName('PERC_DESC').AsFloat)) *
        vItem.dataSet.FieldByName('ALIQTRIB').AsFloat) / 100;
      vValorTributos := vValorTributos +
        vItem.dataSet.FieldByName('VTOTTRIB').AsFloat;

      //PISCOFINS
      vTempCSTPIS := Trim(vItem.dataSet.FieldByName('cst_pis').AsString);
      if vItem.dataSet.FieldByName('aliq_pis').AsFloat > 0 then
        if (vTempCSTPIS = '01') or (vTempCSTPIS = '02') or (vTempCSTPIS = '05') or (vTempCSTPIS = '50') or
          (vTempCSTPIS = '51') or (vTempCSTPIS = '52') or (vTempCSTPIS = '53') or (vTempCSTPIS = '54') or
          (vTempCSTPIS = '55') or (vTempCSTPIS = '56') or (vTempCSTPIS = '03') then
        begin
          vItem.dataSet.FieldByName('base_pis').AsFloat :=
            vItem.dataSet.FieldByName('TOTAL').AsFloat +
            (vItem.dataSet.FieldByName('RAT_ACRES').AsFloat +
            vItem.dataSet.FieldByName('PERC_ACRESC').AsFloat) -
            (vItem.dataSet.FieldByName('RAT_DESC').AsFloat +
            vItem.dataSet.FieldByName('PERC_DESC').AsFloat);
          vItem.dataSet.FieldByName('base_cofins').AsFloat :=
            vItem.dataSet.FieldByName('base_pis').AsFloat;
        end;
      if (vTempCSTPIS = '03') then
      begin
        vItem.dataSet.FieldByName('base_pis').AsFloat := 0;
        vItem.dataSet.FieldByName('valor_pis').AsFloat := vDadosIniF.StrToFloatFormat(
          vItem.dataSet.FieldByName('quantidade').AsFloat * vItem.dataSet.FieldByName('aliq_pis').AsFloat, 2);
        vItem.dataSet.FieldByName('base_cofins').AsFloat := 0;
        vItem.dataSet.FieldByName('valor_cofins').AsFloat := vDadosIniF.StrToFloatFormat(
          vItem.dataSet.FieldByName('quantidade').AsFloat * vItem.dataSet.FieldByName('aliq_cofins').AsFloat, 2);
      end
      else
      begin
        vItem.dataSet.FieldByName('valor_pis').AsFloat := vDadosIniF.StrToFloatFormat(
          vItem.dataSet.FieldByName('base_pis').AsFloat * vItem.dataSet.FieldByName('aliq_pis').AsFloat / 100 , 2);
        vItem.dataSet.FieldByName('valor_cofins').AsFloat := vDadosIniF.StrToFloatFormat(
          vItem.dataSet.FieldByName('base_cofins').AsFloat * vItem.dataSet.FieldByName('aliq_cofins').AsFloat / 100 , 2);
      end;
    end;

    if vItem.dataSet.State = dsEdit then
      vItem.Post;
    vItem.Next;
  end;
  vItem.Apply;
  vItem.CommitaTransacao;
end;

function TCupom.setSubTotal(pSubTotalImp: Boolean = False): boolean;
var
  vrSubTotal: string;
begin
  if not emSubTotal then
  begin
    vrSubTotal := CImpressoraF.SubTotal;
    if vrSubTotal = '' then
    begin
      Result := false;
      exit;
    end;
    CImpressoraF.DataHoraImpressora('', '');
    subTotal := (vrSubTotal <> '');
    vSomenteDinheiro := 0;
    if emSubTotal then
    begin
      if (vDadosIniF.vUsaTef <> 'E') and (not pSubTotalImp) then
      begin
        if vrAcrescimoFechamento > 0 then
          result := CImpressoraF.IniciaFechamentoCupom('A', '$', vrAcrescimoFechamento)
        else
          result := CImpressoraF.IniciaFechamentoCupom('D', '$', vrDescontoFechamento);
      end
      else
        result := True;
      if result then
      begin
        if dataSet.State = dsBrowse then
          Edit;
        dataSet.FieldByName('horasubtotal').AsString := CImpressoraF.vFHoraEcf;
        dataSet.FieldByName('VALORCUPOm').AsFloat := getSubTotal;
        dataSet.FieldByName('valor_desc').AsFloat := vrDescontoFechamento;
        dataSet.FieldByName('valor_acres').AsFloat := vrAcrescimoFechamento;
        dataSet.FieldByName('cliente').AsInteger := obCliente.dataSet.FieldByName('cod_cliente').AsInteger;
//        dataSet.FieldByName('ped').AsInteger := nPedVenda;
//        dataSet.FieldByName('prevenda').AsInteger := nNumDAV;
        dataSet.FieldByName('paf_num_prevenda').AsInteger := nNumPVenda;
        dataSet.FieldByName('coo_conta_cliente').AsInteger := vNumCOOCC;
        dataSet.FieldByName('cer_conta_cliente').AsInteger := vNumCERCC;
//        if nPreVenda > 0 then
//        begin
//          dataSet.FieldByName('data_dav').AsDateTime := nDataDav;
//          dataSet.FieldByName('valor_dav').AsCurrency := nValorDav;
//        end;
        dataSet.FieldByName('status_cp').AsString := '';
//        dataSet.FieldByName('enviado_ret').AsString := 'A';
        Post;
        Apply;
        CommitaTransacao;
        IniciaTransacao;
      end;
      subTotal := Result;
    end;
  end;
  Result := emSubTotal;
end;

procedure TCupom.setUltimoValor(valor: Currency);
begin

end;

procedure TCupom.somaTotal(valor: Currency);
begin
  nTotal := nTotal + valor;
  if dataSet.State = dsBrowse then
    dataSet.Edit;
  dataSet.FieldByName('total').AsFloat := nTotal; //getSubTotal;
  dataSet.FieldByName('VALORCUPOM').AsFloat := getSubTotal;
  dataSet.Post;
  Apply;
end;

function TCupom.somenteEmDinheiro: boolean;
begin
  Result := vSomenteDinheiro = 1;
end;

function TCupom.ultimoCupomEmitido: string;
begin
  Result := '';
  try
    vDadosIniF.MensagemFiscal('Aguarde.. Procurando último cupom emitido');
    if getTodos then
      if not IsEmpty then
      begin
        Last;
        if dataSet.FieldByName('status_cp').AsString <> 'CANCELADO' then
          Result := vDadosIniF.StrZeroDec(dataSet.FieldByName('cupom').AsInteger, 5, 0)
        else
          Result := '';
      end;
  finally
    vDadosIniF.limpaMensagem;
  end;
end;

function TCupom.ultimoCupomEmitidoNaoFechado: string;
begin
  Result := '';
  montaSelect('select first 1 * from cupom where cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and cod_terminal = ' + vDadosIniF.vCodTerminal + ' order by registro desc');
  //if getTodos then
    if not dataset.IsEmpty then
    begin
      Last;
      if (dataSet.FieldByName('horafechamento').AsString = '') and
        (dataSet.FieldByName('status_cp').AsString <> 'CANCELADO') then
      begin
        Result := vDadosIniF.StrZeroDec(dataSet.FieldByName('cupom').AsInteger, 5, 0);
      end;
    end;
end;

function TCupom.validaDesconto(maximoPermitido, valor, vrCusProd,
  maximoProduto: Currency; UsandoPedVenda: Boolean): boolean;
var
  vrTemp: currency;
  cValorTotal: string;
  vMaxDesc: Currency;
begin
  Result := true;
  if UsandoPedVenda then
  begin
    vrTemp := CImpressoraF.getValorUnitarioComCasasDecimais( valor * obProd.getQuantidade);
    valorDesconto := vDadosIniF.StrToFloatFormat( ((vrTemp) * ((descontoP ) / 100)) + descontoV,2);
    valorAcrescimo := vDadosIniF.StrToFloatFormat( ((vrTemp) * ((acrescimoP ) / 100)) + acrescimoV,2);
    Exit;
  end;
  vrTemp := valor - vDadosIniF.StrToFloatFormat(  (((descontoP * valor) / 100) + descontoV),2);
  if ((maximoProduto > 0) and (vrCusProd > 0)) and
    (vrTemp < ((vrCusProd) + vrCusProd * maximoProduto / 100)) then
  begin
    Result := false;
    Application.MessageBox(pchar('Desconto maior que a margem estabelecida no Produto'),
      'Informação', MB_ICONINFORMATION + mb_OK);
    exit;
  end
  else if maximoPermitido > 0 then
  begin
    vrTemp := valor * maximoPermitido / 100;
    if ((((descontoP * valor) / 100) + descontoV) > vrTemp) then
    begin
      Result := false;
      Application.MessageBox(pchar('Desconto maior que o Máximo permitido ' + format('%n',
        [maximoPermitido]) + '%'), 'Informação', MB_ICONINFORMATION + mb_OK);
      exit;
    end;
  end
  else if (((descontoP * valor) / 100) + descontoV) >= 100 then
  begin
    Result := false;
    Application.MessageBox(pchar('Desconto maior que o Máximo permitido ' + format('%n', [100.00])
      + '%'), 'Informação', MB_ICONINFORMATION + mb_OK);
    exit;
  end
  else if (not obProd.emPromocao) and (obCupom.nNumDAV = 0) and (obCupom.nNumPVenda = 0) and
    (obProd.dataSet.FieldByName('MAX_DESC_ITEM').AsFloat > 0)  then
  begin
    vrTemp := CImpressoraF.getValorUnitarioComCasasDecimais( valor * obProd.getQuantidade);
    vMaxDesc := ( vrTemp * obProd.dataSet.FieldByName('MAX_DESC_ITEM').AsFloat) / 100;
    vrTemp := vDadosIniF.StrToFloatFormat( ((vrTemp) * ((descontoP ) / 100)) + descontoV,2);
    if (vrTemp > vMaxDesc) or
      (descontoP > obProd.dataSet.FieldByName('MAX_DESC_ITEM').AsFloat) then
    begin
      Result := false;
      Application.MessageBox(pchar('Desconto maior que o Máximo permitido no produto ' +
        format('%n', [obProd.dataSet.FieldByName('MAX_DESC_ITEM').AsFloat])
         + '%'), 'Informação', MB_ICONINFORMATION + mb_OK);
      exit;
    end;
  end;
  vrTemp := CImpressoraF.getValorUnitarioComCasasDecimais( valor * obProd.getQuantidade);
//  cValorTotal := Format('%15.3f',[vrTemp]);
//  if CImpressoraF.vFqtdDigQtde = 2 then
//    cValorTotal := Copy(cValorTotal,1,13)
//  else
//    cValorTotal := Copy(cValorTotal,1,14);
//  vrTemp := StrToFloat(Trim(cValorTotal));
  if obProd.emPromocao then
  begin
    valorDesconto := descontoPromocional;
    valorAcrescimo := 0;
  end
  else
  begin
    valorDesconto := vDadosIniF.StrToFloatFormat( ((vrTemp) * ((descontoP ) / 100)) + descontoV,2);
    valorAcrescimo := vDadosIniF.StrToFloatFormat( ((vrTemp) * ((acrescimoP ) / 100)) + acrescimoV,2);
    valorAcrescimo := vDadosIniF.StrToFloatFormat(valorAcrescimo,2);
  end;
end;

function TCupom.vendeItem(grupo: integer; codprod, codBarra, aliquotaIt,
  descricao: string; qtde, preco: Currency; casasDecQtde, casasDecVl: string; vDescAliq, prod_serv:
  string; AItemOrcamento: TReg_PedVendaProd):
  boolean;
var
	vBase: Extended;
	vTmpRegistro: Integer;
begin
	try
    Result := true;
    nIt := nIt + 1;
    if (vItem.DataSet.IsEmpty) or (not vItem.DataSet.Active) then
      vItem.selecionaItens(StrToInt(trim(nCupom)), nRegistro);
    if vItem.Insert then
    begin
      vItem.dataSet.FieldByName('grupo_prod').AsInteger := grupo;
      vItem.dataSet.FieldByName('cod_prod').AsString := codprod;
      vItem.dataSet.FieldByName('nitem').AsInteger := nIt;
			vItem.dataSet.FieldByName('ordem').AsInteger := nRegistro;
      vItem.dataSet.FieldByName('cupom').AsString := trim(nCupom);
      vItem.dataSet.FieldByName('data').AsDateTime := dataSet.FieldByName('data').AsDateTime;
      vItem.dataSet.FieldByName('CCF').AsInteger :=
        dataSet.FieldByName('CCF').AsInteger;
			vItem.dataSet.FieldByName('registro').AsInteger := Gencodigo('CUPOM2', DtmFiscal.SpIncCodigo,
				vDadosIniF.codEmpresa);
			vTmpRegistro := vItem.dataSet.FieldByName('registro').AsInteger;
			if vDadosIniF.vSupermercado = 'S' then
        vItem.dataSet.FieldByName('codbarra').AsString := vDadosIniF.StrZero(codBarra, 14)
      else
        vItem.dataSet.FieldByName('codbarra').AsString := codBarra;
      vItem.dataSet.FieldByName('quantidade').AsFloat := qtde;
      vItem.dataSet.FieldByName('preco').AsFloat := preco;
      vItem.dataSet.FieldByName('aliquota_it').AsString := aliquotaIt;
      vItem.dataSet.FieldByName('total').AsFloat := CImpressoraF.getValorTotalComCasasDecimais(qtde * preco);
      vItem.dataSet.FieldByName('descr_it').AsString := Copy(descricao, 1, 29);
      vItem.dataSet.FieldByName('perc_desc').AsFloat := vDadosIniF.StrToFloatFormat(valorDesconto,2);
      vItem.dataSet.FieldByName('perc_acresc').AsFloat := vDadosIniF.StrToFloatFormat(valorAcrescimo,2);
      vItem.dataSet.FieldByName('CSDECQTDE').AsString := casasDecQtde;
      vItem.dataSet.FieldByName('CSDECVLUNT').AsString := casasDecVl;
      vItem.dataSet.FieldByName('DESCALIQ').AsString := vDescAliq;
      somaTotal(vItem.dataSet.FieldByName('total').AsFloat -
        vItem.dataSet.FieldByName('perc_desc').AsFloat +
        vItem.dataSet.FieldByName('perc_acresc').AsFloat);
      vItem.dataSet.FieldByName('prod_serv').AsString := prod_serv;
      if Assigned(AItemOrcamento) then
        vItem.dataSet.FieldByName('nitem_orc').AsInteger := AItemOrcamento.nitem;

      vItem.dataSet.FieldByName('TIPO_ITEM').AsString := COPY(vItem.vTipo_item,1,2);
      vItem.dataSet.FieldByName('UNIDADE').AsString := COPY(vItem.vUnidade,1,3);
      vItem.dataSet.FieldByName('VALOR_IMPOSTO').AsFloat := 0;
      vItem.dataSet.FieldByName('COD_VENDEDOR').AsInteger := vItem.vCodVendedor;

      if prod_serv = 'P' then
      begin
        vItem.dataSet.FieldByName('CODIGO_NOP').AsFloat := obProd.dataSet.FieldByName('CODIGO_NOP').AsFloat;
        vItem.dataSet.FieldByName('CST').AsString := Trim(obProd.dataSet.FieldByName('CST_PROD').AsString);
        vItem.dataSet.FieldByName('IAT').AsString := Trim(obProd.dataSet.FieldByName('IAT').AsString);
        vItem.dataSet.FieldByName('IPPT').AsString := Trim(obProd.dataSet.FieldByName('IPPT').AsString);
        vItem.dataSet.FieldByName('unidade').AsString := Trim(obProd.dataSet.FieldByName('unidade').AsString);
        vItem.dataSet.FieldByName('aliquota').AsFloat := obProd.dataSet.FieldByName('icm_prod').AsFloat;
        if (obProd.dataSet.FieldByName('icm_prod').AsFloat > 0) then
        begin
          if vDadosIniF.StrToFloatFormat(( vItem.dataSet.FieldByName('total').AsFloat -
          vItem.dataSet.FieldByName('perc_desc').AsFloat +
          vItem.dataSet.FieldByName('perc_acresc').AsFloat ) *
            obProd.dataSet.FieldByName('icm_prod').AsFloat / 100 , 2) = 0 then
          begin
            vItem.dataSet.FieldByName('CODIGO_NOP').AsFloat := 5403;
            vItem.dataSet.FieldByName('CST').AsString := '090';
          end;
        end;
        vItem.dataSet.FieldByName('ncm').AsString := Trim(obProd.dataSet.FieldByName('nbm').AsString);
        vItem.dataSet.FieldByName('ALIQTRIB').AsFloat := obProd.getAliquotaTributos(
          vItem.dataSet.FieldByName('ncm').AsString,
          vItem.dataSet.FieldByName('CST').AsString);
        vItem.dataSet.FieldByName('cst_pis').AsString := obProd.vCSTPIS;
        vItem.dataSet.FieldByName('cst_cofins').AsString := obProd.vCSTPIS;
        vItem.dataSet.FieldByName('aliq_pis').AsFloat := obProd.vAliqPIS;
        vItem.dataSet.FieldByName('aliq_cofins').AsFloat := obProd.vAliqCOFINS;

        vItem.dataSet.FieldByName('prec_cusm_prod').AsFloat := obProd.CustoMedio;
        obProd.CustoMedio := 0;
        if vItem.dataSet.FieldByName('prec_cusm_prod').AsFloat = 0 then
          vItem.dataSet.FieldByName('prec_cusm_prod').AsFloat :=
            obProd.dataSet.FieldByName('prec_cus_prod').AsFloat;
      end
      else
      begin
        vItem.dataSet.FieldByName('CODIGO_NOP').AsFloat := obServ.dataSet.FieldByName('CODIGO_NOP').AsFloat;
        vItem.dataSet.FieldByName('IAT').AsString := Trim(obServ.dataSet.FieldByName('IAT').AsString);
        vItem.dataSet.FieldByName('IPPT').AsString := Trim(obServ.dataSet.FieldByName('IPPT').AsString);
        vItem.dataSet.FieldByName('aliquota').AsFloat := obServ.dataSet.FieldByName('aliq_iss').AsFloat;
        vItem.dataSet.FieldByName('CST').AsString := '041';
        vItem.dataSet.FieldByName('ncm').AsString := '';
        vItem.dataSet.FieldByName('ALIQTRIB').AsFloat := obServ.getAliquotaTributos(
          vItem.dataSet.FieldByName('grupo_prod').AsInteger);
        vItem.dataSet.FieldByName('cst_pis').AsString := obServ.vCSTPIS;
        vItem.dataSet.FieldByName('cst_cofins').AsString := obServ.vCSTPIS;
        vItem.dataSet.FieldByName('aliq_pis').AsFloat := obServ.vAliqPIS;
        vItem.dataSet.FieldByName('aliq_cofins').AsFloat := obServ.vAliqCOFINS;
      end;
//      if vItem.dataSet.FieldByName('aliquota').AsFloat > 0 then
//      begin
//        vBase := vItem.dataSet.FieldByName('TOTAL').AsFloat +
//          (vItem.dataSet.FieldByName('RAT_ACRES').AsFloat + vItem.dataSet.FieldByName('PERC_ACRESC').AsFloat) -
//          (vItem.dataSet.FieldByName('RAT_DESC').AsFloat + vItem.dataSet.FieldByName('PERC_DESC').AsFloat);
//        vBase := vBase * vItem.dataSet.FieldByName('aliquota').AsFloat / 100;
//        vItem.dataSet.FieldByName('VALOR_IMPOSTO').AsFloat := vDadosIniF.StrToFloatFormat(vBase, 2);
//      end;
      //      nTotal := nTotal + vItem.dataSet.FieldByName('total').AsFloat -
      //       vItem.dataSet.FieldByName('perc_desc').AsFloat + vItem.dataSet.FieldByName('perc_acresc').AsFloat ;
      vItem.Post;
      vItem.Apply;
			vItem.CommitaTransacao;

			buscas.Close;
			buscas.SQL.Text := 'select cupom from cupom2' +
				' where cod_terminal = ' + vDadosIniF.vCodTerminal +
				' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
				' and cod_empresa = ' + vDadosIniF.codEmpresa +
				' and registro = ' + IntToStr(vTmpRegistro) +
				' and ordem = ' + IntToStr(nRegistro);
			buscas.Open;
			if buscas.FieldByName('cupom').AsInteger <> StrToIntDef(nCupom, -1) then
			begin
				Application.MessageBox('Item vendido não foi encontrado no banco de dados, favor reiniciar o sistema',
					'Atenção', 0 + 64);
				Result := False;
				zeraDadosParaNovoCupom;
				Exit;
			end;

      vItem.IniciaTransacao;

      vItem.vTipo_item:= '00';
      vItem.vUnidade:= 'UN';

    end;
  except on e: exception do
    begin
      Result := false;
      MessageDlg('Erro ao incluir item no cupom. Erro: ' + e.Message, mtInformation, [mbOK], 0);
    end;
  end;
end;

function TCupom.verificaExisteCupomFechadoImpressoraNaoFechadoNoBanco: boolean;
var
  tempCupom, tempCupomImp: string;
  horaFechamento: string;
  vVendaRet: TDAVF;
begin
  try
    vDadosIniF.MensagemFiscal('Verificando ultimo cupom fechado na ECF');
    Result := False;
    tempCupom := Trim(ultimoCupomEmitidoNaoFechado);
    if tempCupom = '' then
      exit;
    tempCupomImp := Trim(CImpressoraF.NumeroCupom);
    if (CImpressoraF.cupomAberto) then
      exit;
    Result := StrToInt(tempCupom) = StrToInt(tempCupomImp);

    if Result then
    begin
      horaFechamento := CImpressoraF.dataHoraUltimoDocumento;
      horaFechamento := copy(horaFechamento, 12, 8);
      if dataSet.State = dsBrowse then
        Edit;
      dataSet.FieldByName('horafechamento').AsString := horaFechamento;
      Apply;
      CommitaTransacao;
      //12/12/2009 09:34:55
      vDadosIniF.EnvCmdsCupom(10);
      //
      vItem.selecionaItens(dataSet.FieldByName('cupom').AsInteger,
        dataSet.FieldByName('registro').AsInteger);
      //
//      if (vrDescontoFechamento <> 0) or (vrAcrescimoFechamento <> 0) then
        setRateioItens;
      if dataSet.State = dsBrowse then
        Edit;
      dataSet.FieldByName('VTOTTRIB').AsFloat := vDadosIniF.StrToFloatFormat(vValorTributos, 2);
      dataSet.FieldByName('horafechamento').AsString := horaFechamento;
      dataSet.FieldByName('valorpago').AsFloat := getValorFinCupom;
      dataSet.FieldByName('enviado_ret2').AsString := 'A';
      Post;
      Apply;
      CommitaTransacao;
      if vDadosIniF.bancoConectado <> 'local' then
        gerarArquivoIndiceTecnico;
      IniciaTransacao;
      if (dataSet.FieldByName('prevenda').AsInteger = 0) and (dataSet.FieldByName('paf_num_prevenda').AsInteger = 0) then
      begin
        vVendaRet := TDAVF.create;
        if vDadosIniF.bancoConectado <> 'local' then
        try        
          if obTermImp = nil then
            obTermImp:= TTerminal_Impressoras.create;
//          vVendaRet.sincronizaCupomNoRetaguarda(dataSet.FieldByName('cupom').AsInteger,
//            vDadosIniF.MensagemFiscal('Aguarde! Atualizando estoque retaguarda', true));
//          vVendaRet.sincronizaCupomNoRetaguarda(dataSet, vItem.dataSet,
//            vDadosIniF.MensagemFiscal('Aguarde! Atualizando estoque retaguarda', true));
          obTermImp.atualizaVariaveisEstoque(vVendaRet.buscas);
        finally
          obTermImp.Free;
          obTermImp:= nil;
          vDadosIniF.limpaMensagem;
        end;
      end;
      zeraDadosParaNovoCupom;
    end;
  finally
    vDadosIniF.limpaMensagem;
  end;
end;

function TCupom.verificaOutrosPrazo(vCupom, vRegistro: string): boolean;
var
  vOK, vAgruparPorFinalizador: Boolean;
  buscas2: TIBQuery;
  vI: Integer;
begin
  Result := False;
  buscas2:= TIBQuery(DtmFiscal.qrBuscas2);
  vAgruparPorFinalizador := False;
  if vDadosIniF.bancoConectado <> 'local' then
    if vDadosIniF.vTipoConexao <> 'off' then
    begin
      if obCtrl = nil then
        obCtrl := TControleF.create;
      vAgruparPorFinalizador := vDadosIniF.getConfSisBool('paf_ecf_form_pag_agrupar_por_finalizador', obCtrl.buscas);
    end;

  buscas2.Close;
  buscas2.SQL.Text := 'select ff.cod_finalizador, ff.descricao,' + vDadosIniF.IfThen(vAgruparPorFinalizador, '', 'fc.registro,') +
    ' case when ((fc.parcelas_tef is null) or (fc.parcelas_tef = 0)) then 0' +
    ' else fc.registro' +
    ' end difTEF, coalesce(fc.parcelas_tef, 0) parcelas_tef, sum(fc.valor) valor from fincupom fc' +
    ' inner join finalizadores ff on ff.cod_terminal = fc.cod_terminal and' +
    ' ff.nserieecf = fc.nserieecf and ff.cod_empresa = fc.cod_empresa and' +
    ' ff.cod_finalizador = fc.finalizador and ff.prazo = ''S''' +
    ' where fc.cod_terminal = '+vDadosIniF.vCodTerminal +
    ' and fc.nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and fc.cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and fc.cupom = ' + vCupom+
    ' and fc.ordem = ' + vRegistro +
    ' group by 1,2,3,4' + vDadosIniF.IfThen(vAgruparPorFinalizador, '', ', 5');
  buscas2.Open;

  vI:=0;
  buscas2.First;
  while not buscas2.Eof do
  begin

    vFPg.dataSet := TClientDataSet(DtmFiscal.cdsFp);
    vFPg.dataSet.EmptyDataSet;
    Application.CreateForm(TfrmCondPagF, frmCondPagF);
    frmCondPagF.Caption := 'Cupom '+ vCupom + ' R$ '+Format('%n',[buscas2.FieldByName('valor').AsFloat]) +
    ' - ' + buscas2.FieldByName('descricao').AsString;
    frmCondPagF.Tag := StrToInt(Trim(vCupom));
    frmCondPagF.valorOutros := buscas2.FieldByName('valor').AsFloat;
    if buscas2.FieldByName('parcelas_tef').AsInteger > 0 then
    begin
      frmCondPagF.EditMoeda1.Valor :=
        buscas2.FieldByName('parcelas_tef').AsInteger;
      obCupom.vFPg.montaParcelamento(frmCondPagF.ListBox1,
        buscas2.FieldByName('parcelas_tef').AsInteger,
        DayOf(Date), IntToStr(frmCondPagF.Tag),
        buscas2.FieldByName('valor').AsFloat,False);
    end
    else
    begin
      frmCondPagF.EditMoeda1.Clear;
      frmCondPagF.ListBox1.Clear;
    end;

    if obCtrl = nil then
      obCtrl := TControleF.create;
    if vDadosIniF.getConfSisBool('paf_ecf_form_pag_apresentar_todos_controles_s2', obCtrl.buscas) then
      obCtrl.selecionaControleS2()
    else
      obCtrl.selecionaControleFinalizador(buscas2.FieldByName('cod_finalizador').AsInteger);
    if not obCtrl.dataSet.IsEmpty then
      frmCondPagF.DBLookupComboBox1.KeyValue := obCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger;
    vOK := frmCondPagF.ShowModal = IDOK;

    frmcondPagF.Free;
    frmCondPagF := nil;
    if vOK then
    begin
      inc(vI);
      vFPg.vSecao := vI;
      Result := vFPg.gravavaParcelasFormPagamento(vFPg.dataSet, vCupom, vRegistro);
    end;

    buscas2.Next;
  end;
  vFPg.CommitaTransacao;

end;

function TCupom.verificaPrazo(vCupom, vRegistro: string): boolean;
var
  vOK: Boolean;
begin
  Result := False;
  if vDadosIniF.vFormPagamentoAtivado = 'S' then
  begin
    vFPg.selecionaFormaPgPrazo(vCupom, vRegistro);
    Result := (not vFPg.dataset.IsEmpty);
  end
  else
  begin
    vFPg.dataSet := TClientDataSet(DtmFiscal.cdsFp);
    Application.CreateForm(TfrmCondPagF, frmCondPagF);
    frmCondPagF.Tag := StrToInt(Trim(vCupom));
    if obCtrl = nil then
      obCtrl := TControleF.create;
    obCtrl.selecionaControleFinalizador(obFinalizador.getFinalizadorPrazo);
    if not obCtrl.dataSet.IsEmpty then
      frmCondPagF.DBLookupComboBox1.KeyValue := obCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger;
    vOK := frmCondPagF.ShowModal = IDOK;
    frmcondPagF.Free;
    frmCondPagF := nil;
    if vOK then
    begin
      vFPg.vSecao := 1;
      Result := vFPg.gravavaParcelasFormPagamento(vFPg.dataSet, vCupom, vRegistro);
      if Result then
        vFPg.CommitaTransacao;
    end;
  end;
  //Result := (not vFPg.dataset.IsEmpty);
end;

procedure TCupom.zeraDadosParaNovoCupom;
begin
  nNumDAV := 0;
  nNumPVenda := 0;
  vNumCOOCC := 0;
  vNumCERCC := 0;
  nPedVenda := 0;
  nDataDav := 0;
  nValorDav := 0;
  nTotal := 0;
  nRegistro := 0;
  nCupom := '';
  nIt := 0;
  if vDadosIniF.vZerarDescontoItem = 'S' then
  begin
    descontoV := 0;
    descontoP := 0;
  end;
  valorDesconto := 0;
  vrDescontoFechamento := 0;
  vrAcrescimoFechamento := 0;
  valorDesconto := 0;
  valorAcrescimo := 0;
  vSomenteDinheiro := 0;
  subTotal := False;
  vlinha1 := '';
  vlinha2 := '';
  vlinha3 := '';
  vlinha4 := '';
  vlinha5 := '';
  vlinha6 := '';
  vlinha7 := '';
  vlinha8 := '';
  vCodVendedor := StrToInt(vDadosIniF.vCodVendedorPadrao);
  vFinCupom.vValorSaque := 0;
  vFinCupom.vValorDescPremia := 0;
  vFinCupom.vQtdeParcelaCartao := 0;
  vFinCupom.vNumAutorizacao := '';
  vFinCupom.vNSUTransacao := '';
  obProd.setSqlProdutos('');
  obProd.dataSet.Close;
  if Assigned(FOrcamento) then
    FreeAndNil(FOrcamento);
end;

function TCupom.selecionaCupom(registro, cupom: integer): Boolean;
begin
  Result := montaSelect('select * from cupom where cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and registro = ' +
    IntToStr(registro) + ' and cod_empresa = ' + vDadosIniF.codEmpresa + ' and cupom = ' +
    IntToStr(cupom));
end;

{ TCupom2 }

function TCupom2.cancelaItem: boolean;
begin
  if inherited Edit then
  begin
    dataSet.FieldByName('status_it').AsString := 'CANCELADO';
    dataSet.FieldByName('aliquota_it').AsString := 'CANC';
    dataSet.FieldByName('enviado_ret2').AsString := 'A';
    inherited post;
    Result := true;
  end;
end;

constructor TCupom2.create;
begin
  dataSet := TClientDataSet(dtmFiscal.cdsCupom2);
  transacao := TIBTransaction(dtmFiscal.transacaoFiscal);
  buscas := TIBQuery(dtmFiscal.qrBuscas);
end;

function TCupom2.getNItem: Currency;
begin
  Result := dataSet.FieldByName('nitem').AsFloat;
end;

function TCupom2.GetQtdeItem(AGrupoProd: Integer; ACodProd: string): Double;
var
  AFilter: string;
  AFiltered: Boolean;
begin
  Result := 0;
  if dataSet.IsEmpty  then
    Exit;

  AFilter := dataSet.Filter;
  AFiltered := dataSet.Filtered;
  dataSet.Filter := ' grupo_prod = ' + IntToStr(AGrupoProd) + ' and ' +
                    ' cod_prod = '   +QuotedStr(Trim(ACodProd)) + ' and ' +
                    ' prod_serv = ''P'' and status_it <> ''CANCELADO''' ;
  dataSet.Filtered := True;
  try
    dataSet.First;
    while not dataSet.Eof do
    begin
      Result := Result + dataSet.FieldByName('quantidade').AsFloat;
      dataSet.Next;
    end;
  finally
    dataSet.Filtered := AFiltered;
    dataSet.Filter := AFilter;
  end;
end;

function TCupom2.insert: boolean;
begin
  Result := false;
  if inherited insert then
  begin
    dataSet.FieldByName('cod_terminal').AsString := vDadosIniF.vCodTerminal;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIniF.codEmpresa;
    dataSet.FieldByName('nserieecf').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
    result := true;
  end;
end;

function TCupom2.selecionaItens(nCupom, nRegistro: integer): boolean;
begin
  Result := montaSelect('select * from cupom2 where cupom = ' + IntToStr(nCupom) +
    ' and ordem = ' + IntToStr(nRegistro) + ' and cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and cod_empresa  = ' + vDadosIniF.codEmpresa +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf))+
    ' order by nitem');
end;

procedure TCupom2.setEnviadoRetAlterado(nCupom, nRegistro: integer);
begin
  try
    buscas.Close;
    buscas.SQL.Text := 'update cupom2 set enviado_ret = ''A'' where cupom = ' + IntToStr(nCupom) +
      ' and ordem = ' + IntToStr(nRegistro) + ' and cod_terminal = ' + vDadosIniF.vCodTerminal +
      ' and cod_empresa  = ' + vDadosIniF.codEmpresa +
      ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf));
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;
  except
  end;
end;

function TCupom2.somaItens: Currency;
var
  valor: Currency;
begin
  valor := 0;
  First;
  while not dataSet.Eof do
  begin
    if (dataSet.FieldByName('status_it').AsString <> 'CANCELADO') then
      if (dataSet.FieldByName('prod_serv').AsString = 'P') or ((vDadosIniF.vDescontoISS = 'S')
        and (dataSet.FieldByName('prod_serv').AsString = 'S')) then
        valor := valor + dataSet.FieldByName('total').asFLoat;
    dataSet.Next;
  end;
  Result := valor;
end;

function TCupom2.somaItens2: Currency;
var
  valor: Currency;
begin
  valor := 0;
  First;
  while not dataSet.Eof do
  begin
    if (dataSet.FieldByName('status_it').AsString <> 'CANCELADO') then
      valor := valor + dataSet.FieldByName('total').asFLoat;
    dataSet.Next;
  end;
  Result := valor;
end;

function TCupom2.somaItensGeral: Currency;
var
  valor: Currency;
begin
  valor := 0;
  First;
  while not dataSet.Eof do
  begin
    if (vDadosIniF.vDescontoISS = 'S') and (dataSet.FieldByName('prod_serv').AsString = 'S') then
      valor := valor + dataSet.FieldByName('total').asFLoat;
    dataSet.Next;
  end;
  Result := valor;
end;

{ TResumoD }

function TResumoD.abreformConferenciaReducaoZ: boolean;
var
  vTemp: string;
begin
  try
    vDadosIniF.limpaMensagem;
    Application.CreateForm(TfrmConferenciaDadosReducaoZ, frmConferenciaDadosReducaoZ);
    frmConferenciaDadosReducaoZ.DBComboBox1.Clear;
    buscas.Close;
    buscas.SQL.Text := 'select * from aliq where cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and cod_terminal = ' + vDadosIniF.vCodTerminal + ' and nserieecf = ' +
      QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf))+' order by indice';
    buscas.Open;
    while not buscas.Eof do
    begin
      vtemp := vDadosIniF.StrZero(buscas.FieldByName('indice').AsInteger, 2);
      if buscas.FieldByName('servico').AsString = 'S' then
        vtemp := vtemp + 'S'
      else
        vtemp := vtemp + 'T';
      vtemp := vtemp + vDadosIniF.StrZero( StringReplace(
        Trim(Format('%0.2f', [buscas.FieldByName('aliq').AsFloat])),
        ',','',[rfReplaceAll,rfIgnoreCase])
        , 4);
      frmConferenciaDadosReducaoZ.DBComboBox1.Items.Add(vTemp);
      buscas.Next;
    end;
    buscas.Close;
    frmConferenciaDadosReducaoZ.DBComboBox1.Items.Add('Canc-T');
    frmConferenciaDadosReducaoZ.DBComboBox1.Items.Add('Canc-S');
    frmConferenciaDadosReducaoZ.DBComboBox1.Items.Add('DT');
    frmConferenciaDadosReducaoZ.DBComboBox1.Items.Add('DS');
    frmConferenciaDadosReducaoZ.DBComboBox1.Items.Add('F1');
    frmConferenciaDadosReducaoZ.DBComboBox1.Items.Add('FS1');
    frmConferenciaDadosReducaoZ.DBComboBox1.Items.Add('I1');
    frmConferenciaDadosReducaoZ.DBComboBox1.Items.Add('IS1');
    frmConferenciaDadosReducaoZ.DBComboBox1.Items.Add('N1');
    frmConferenciaDadosReducaoZ.DBComboBox1.Items.Add('NS1');
    frmConferenciaDadosReducaoZ.DBComboBox1.Items.Add('AT');
    frmConferenciaDadosReducaoZ.DBComboBox1.Items.Add('AS');
    dataSet.Edit;
    mpRes.abreMapaResumo(dataSet.FieldByName('coored').AsInteger);
    result := (frmConferenciaDadosReducaoZ.ShowModal = IDOK);
  finally
    frmConferenciaDadosReducaoZ.Free;
    frmConferenciaDadosReducaoZ := nil;
  end;
end;

constructor TResumoD.create;
begin
  dataSet := TClientDataSet(DtmFiscal.cdsResumoD);
  transacao := TIBTransaction(DtmFiscal.transacaoFiscal);
  buscas := TIBQuery(DtmFiscal.qrBuscas);
  mpRes := TMapaResumo.create;
end;

destructor TResumoD.Destroy;
begin
  mpRes.free;
  mpRes := nil;
  inherited;
end;

function TResumoD.existeMovimento(pCOORed: Integer): boolean;
begin
  try
    if pCOORed = 0 then
    begin
      Result := True;
      exit;
    end;
    selecionaMovimento(pCOORed);
    Result := not dataSet.IsEmpty;
  except
    Result := True;
  end;
end;

function TResumoD.existeMovimento(dataMov: TDate): boolean;
begin
  Result := false;
  if getTodos then
    if not dataSet.IsEmpty then
    begin
      Last;
      if (dataSet.FieldByName('data_mov').AsDateTime = dataMov) then
        Result := true;
      if not Result then
      begin
        First;
        while not Eof do
        begin
          if (dataSet.FieldByName('data_mov').AsDateTime = dataMov) then
          begin
            Result := true;
            Break;
          end;
          Next;
        end;
      end;
    end;
end;

function TResumoD.getDiaDoUltimoMovimento: string;
begin
  Result := '';
  if getTodos then
    if not dataSet.IsEmpty then
    begin
      Last;
      Result := DateToStr(dataSet.FieldByName('data_mov').AsDateTime);
    end;
end;

function TResumoD.getTodos: boolean;
begin
  Result := montaSelect('select * from resumod where cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and cod_terminal = ' +
    vDadosIniF.vCodTerminal + ' order by data_mov');
end;

function TResumoD.gravaResumoD(diaMov: TDate; seqIni, seqFim, nReduc,
  croMov: string; vendaBrut, vendaGeral: Double; mapa: RmapaResumo): Boolean;
var
  I: Integer;
  vlCancelado: Currency;
  vlAcrescimo: Currency;
  vlDesconto: Currency;
  vlIsento: Currency;
  vlNaoIncidencia: Currency;
  vlST: Currency;
begin
  try
    Result := true;
    //    if getDiaDoUltimoMovimento = DateToStr(diaMov) then
    if existeMovimento(StrToInt(mapa.coored)) then
      Edit
    else
			Insert;
		if diaMov > StrToDate(mapa.dataRed) then //teste de data do movimento para nao gravar errado
			diaMov := StrToDate(mapa.dataRed);
    dataSet.FieldByName('cod_terminal').AsString := vDadosIniF.vCodTerminal;
    dataSet.FieldByName('nserieecf').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
    dataSet.FieldByName('cod_empresa').AsString := vDadosIniF.codEmpresa;
    dataSet.FieldByName('data_mov').AsString := DateToStr(diaMov);
    if Pos('?', seqIni) = 0 then
      dataSet.FieldByName('seqini').AsInteger := StrToIntDef(seqIni, 0);
    if Pos('?', seqFim) = 0 then
      dataSet.FieldByName('seqfim').AsInteger := StrToIntDef(seqFim, 0);
    dataSet.FieldByName('vlvendab').AsFloat := vendaBrut;
    dataSet.FieldByName('vltotgeral').AsFloat := vendaGeral;
    dataSet.FieldByName('cro_mov').AsString := croMov;
    dataSet.FieldByName('nreducoes').AsString := nReduc;
    dataSet.FieldByName('coored').AsString := mapa.coored;
    vlCancelado := 0;
    if mapa.vlCancelamentoICMS <> '' then
      vlCancelado := StrToFloatSemPonto(mapa.vlCancelamentoICMS);
    if mapa.vlCancelamentoISSQN <> '' then
      vlCancelado := vlCancelado + StrToFloatSemPonto(mapa.vlCancelamentoISSQN);
    if (vlCancelado = 0) and (Trim(mapa.vlCancel) <> '') then
      vlCancelado := StrToFloatSemPonto(mapa.vlCancel);
    dataSet.FieldByName('vlcancel').AsFloat := vlCancelado;

    vlAcrescimo := 0;
    if mapa.vlAcrescimoICMS <> '' then
      vlAcrescimo := StrToFloatSemPonto(mapa.vlAcrescimoICMS);
    if mapa.vlAcrescimoISSQN <> '' then
      vlAcrescimo := vlAcrescimo + StrToFloatSemPonto(mapa.vlAcrescimoISSQN);   
    if (vlAcrescimo = 0) and (Trim(mapa.vlAcrescimo) <> '') then
      vlAcrescimo := StrToFloatSemPonto(mapa.vlAcrescimo);
    dataSet.FieldByName('vlacrescimo').AsFloat := vlAcrescimo;

    vlDesconto := 0;
    if mapa.vlDescontoICMS <> '' then
      vlDesconto := StrToFloatSemPonto(mapa.vlDescontoICMS);
    if mapa.vlDescontoISSQN <> '' then
      vlDesconto := vlDesconto + StrToFloatSemPonto(mapa.vlDescontoISSQN);
    if (vlDesconto = 0) and (Trim(mapa.vlDesconto) <> '') then
      vlDesconto := StrToFloatSemPonto(mapa.vlDesconto);
    dataSet.FieldByName('vldescontos').AsFloat := vlDesconto;
    dataSet.FieldByName('vliss').AsString := vDadosIniF.tirapontos(mapa.vlISS, 2);

    vlIsento := 0;
    if mapa.vlIsencaoICM <> '' then
      vlIsento := StrToFloatSemPonto(mapa.vlIsencaoICM);
    if mapa.vlIsencaoISSQN <> '' then
      vlIsento := vlIsento + StrToFloatSemPonto(mapa.vlIsencaoISSQN);
    if (vlIsento = 0) and (Trim(mapa.vlIsentos) <> '') then
      vlIsento := StrToFloatSemPonto(mapa.vlIsentos);
    dataSet.FieldByName('vlisentos').AsFloat := vlIsento;

    vlNaoIncidencia := 0;
    if mapa.vlNaoIncidenciaICMS <> '' then
      vlNaoIncidencia := StrToFloatSemPonto(mapa.vlNaoIncidenciaICMS);
    if mapa.vlNaoIncidenciaISSQN <> '' then
      vlNaoIncidencia := vlNaoIncidencia + StrToFloatSemPonto(mapa.vlNaoIncidenciaISSQN);
    if (vlNaoIncidencia = 0) and (Trim(mapa.vlNaoIncidencia) <> '') then
      vlNaoIncidencia := StrToFloatSemPonto(mapa.vlNaoIncidencia);
    dataSet.FieldByName('vlnincidencia').AsFloat := vlNaoIncidencia;

    vlST := 0;
    if mapa.vlSubstICMS <> '' then
      vlST := StrToFloatSemPonto(mapa.vlSubstICMS);
    if mapa.vlSubstISSQN <> '' then
      vlST := vlST + StrToFloatSemPonto(mapa.vlSubstISSQN);
    if (vlST = 0) and (Trim(mapa.vlSubst) <> '') then
      vlST := StrToFloatSemPonto(mapa.vlSubst);
    dataSet.FieldByName('vlsubst').AsFloat := vlST;
    dataSet.FieldByName('data_emissao_z').AsString := mapa.dataRed;
    dataSet.FieldByName('hora_emissao_z').AsString := mapa.horaRed;
    dataSet.FieldByName('vltotliq').AsString := vDadosIniF.tirapontos(mapa.vlTotLiq, 2);

    if (fint('seqini') = 0) or (fint('seqfim') = 0) then
      try
        if (fint('seqini') = 0) then
          dataSet.FieldByName('seqini').AsInteger :=
            SqlOpen('select min(cupom) as cupom from cupom' +
                    ' where cod_empresa = %s and nserieecf = %s and cod_terminal = %s' +
                    ' and data = %s',
                    [vDadosIniF.codEmpresa, QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)),
                     vDadosIniF.vCodTerminal, fdate_fb('data_mov')]).FieldByName('cupom').AsInteger;

        if (fint('seqfim') = 0) then
          dataSet.FieldByName('seqfim').AsInteger := fint('coored');

      except on E: Exception do
        begin
          registraErro('Erro ao obter COO do banco de dados' + sLineBreak +
                       'SQL: ' + buscas.SQL.Text + sLineBreak +
                       'Erro: ' + E.Message);
        end;
      end;

    if vDadosIniF.vDigitarDadosReducaoZ = 'S' then
    begin
      Application.MessageBox('Verifique se os dados da Reducação Z estão corretos!', 'Atenção', 0 + 64);
      while not abreformConferenciaReducaoZ do
        if Application.MessageBox(pchar(
          'Os dados da Redução Z precisam ser confirmados.' + #13 +
          'Os arquivos fiscais (Sintegra, SPED) necessitam destes dados' + #13 +
          'Deseja mesmo sair sem confirmar os dados desta Redução Z?'), 'Confirmação',
          MB_ICONWARNING + MB_YESNO) = IDYES then
        begin
          vDadosIniF.GravaAuditoria('FIS051', 'VALIDAR', 'COO RZ' + mapa.coored +
            ' NUM RZ ' +nReduc ,'RESUMOD', '', dtmEnt.qrBuscas);
          Result := False;
          Exit;
        end;
    end;

    if inherited post then
    begin
      Apply;
      Refresh;
      CommitaTransacao;
      IniciaTransacao;
      try
        for I := 0 to mapa.qtdeAliq - 1 do
          mpRes.gravaMapaResumo(StrToInt(mapa.coored), IntToStr(i + 1), mapa.valiqs[i].aliq,
            mapa.valiqs[i].valor);
        if abreformConferenciaReducaoZ then
        begin
          inherited post;
          Apply;
          mpRes.Apply;
          CommitaTransacao;
          IniciaTransacao;
        end
        else
        begin
          CancelUpdates;
          mpRes.CancelUpdates;
        end;
      finally
        setEnviadoRetAlterado(StrToInt(mapa.coored));
      end;
    end;
  except
    on e: exception do
    begin
      Result := false;
      MessageDlg('Erro ao gravar resumo diario. Erro: ' + e.Message, mtInformation, [mbOK], 0);
    end;

  end;
end;

function TResumoD.selecionaMovimento(pCOORed: Integer): boolean;
begin
  Result := montaSelect('select * from resumod where cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and coored = ' + IntToStr(pCOORed) + ' order by data_mov');
end;

procedure TResumoD.setEnviadoRetAlterado(pCOORed: Integer);
begin
  try
    selecionaMovimento(pCOORed);
    if not dataSet.IsEmpty then
    begin
      dataSet.Edit;
      dataSet.FieldByName('enviado_ret').AsString := 'A';
      dataSet.Post;
      mpRes.abreMapaResumo(pCOORed);
      mpRes.dataSet.First;
      while not mpRes.Eof do
      begin
        mpRes.dataSet.Edit;
        mpRes.dataSet.FieldByName('enviado_ret').AsString := 'A';
        mpRes.dataSet.Post;
        mpRes.Next;
      end;
      Apply;
      mpRes.Apply;
      CommitaTransacao;
    end;
  except
    RollBackTransacao;
  end;
end;

function TResumoD.StrToFloatSemPonto(valorSrt: String): Currency;
begin
  Result := StrToCurr(StringReplace(valorSrt,'.','',[rfReplaceAll]));
end;

function TResumoD.verificarDadosSintegraSPED(vDataIni,
  vDataFim: string): boolean;
var
  vArquivoMontado: Boolean;
  nomeArquivoSint, nomeArquivoMFD, nomeLog, diaCorrente, diaTemporario, nSerieECFTemp: string;
  arquivoTxt, logTxt: TextFile;
  vLinha: string;
  _RZ, _MR: TClientDataSet;
  buscasExec: TIBQuery;
  vSqlUpdate: string;
  vSqlInsertRZ: string;
  vListaParametros: TStringList;
  I: Integer;
  vCooTemp: Integer;
  SaveDialog1: TOpenDialog;
begin
  ///  Definindo nome do arquivo de log e do arquivo para receber os dados do ECF
  nomeArquivoSint := vDataIni+'_'+vDataFim+'.txt';
  nomeArquivoSint := StringReplace( nomeArquivoSint, '/', '',[rfReplaceAll]);
  nomeArquivoSint := ExtractFilePath(Application.ExeName)+'ArquivosDigitais\' + nomeArquivoSint;
  nomeLog := TimeToStr(Time);
  nomeLog := StringReplace( nomeLog, ':', '',[rfReplaceAll]);
  nomeLog := StringReplace(nomeArquivoSint,'.txt','',[rfReplaceAll])+'_'+nomeLog+'.log';

  nomeArquivoMFD := StringReplace(nomeArquivoSint,'.txt','_MFD.txt',[rfReplaceAll]);
  nomeArquivoSint := StringReplace(nomeArquivoSint,'.txt','_Sint.txt',[rfReplaceAll]);

  /// Depois de testar comentar estas duas linhas
  // nomeArquivoSint := 'C:\Projeto_Fiscal40\bpl\ArquivosDigitais\18062011_18062011_Sint.txt';
  // nomeArquivoMFD := 'C:\Projeto_Fiscal40\bpl\ArquivosDigitais\18062011_18062011_MFD.txt';

  _RZ := TClientDataSet(DtmFiscal.cdsRZ);
  _MR := TClientDataSet(DtmFiscal.cdsMR);
  buscasExec :=  TIBQuery(DtmFiscal.qrBuscas2);

  if _RZ.Tag <> 22 then
    _RZ.CreateDataSet;
  _RZ.Tag := 22;
  while not _RZ.IsEmpty do
    _RZ.Delete;

  if _MR.Tag <> 22 then
    _MR.CreateDataSet;
  _MR.Tag := 22;
  while not _MR.IsEmpty do
    _MR.Delete;

  AssignFile(logTxt, nomeLog);
  try
    Rewrite(logTxt);
    Writeln(logTxt,'PDV numero: ' +vDadosIniF.StrZero(Trim(vDadosIniF.vCodTerminal),3)+
      ' ECF de numero: '+vDadosIniF.vNumSerieEcf+
      ' Codificado: ' + vDadosIniF.codifica(vDadosIniF.vNumSerieEcf));

    /// Depois que testar voltar com a funcao vDadosIniF.progressoFuncao
    Writeln(logTxt,'Iniciando Leitura ECF. Periodo: '+vDataIni+' a '+vDataFim);
    vDadosIniF.progressoFuncao('Correção de Dados Sintegra/SPED',
      'Obtendo informações do período',
      'Comunicando com ECF');
    vDadosIniF.progressoFuncao('', '', 'Obtendo dados do ECF');
    //chamar metodo de criacao do arquivo na classe de impressoras aqui
    ///  Envia comando para o ECF gerar o arquivo com os dados
//    vArquivoMontado := True  ;
//    if not vArquivoMontado then
    if Application.MessageBox('Deseja informar arquivos manualmente', 'Confirmação', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      SaveDialog1 := TOpenDialog.Create(Application);
      
      SaveDialog1.Title := 'Informe o arquivo do sintegra';
      SaveDialog1.FileName := 'Arquivo sintegra';
      if not SaveDialog1.Execute then
        raiseExceptionCreate('Operação abortada', '');
      nomeArquivoSint := SaveDialog1.FileName;

      SaveDialog1.Title := 'Informe o arquivo do COTEPE';
      SaveDialog1.FileName := 'Arquivo cotepe';
      if not SaveDialog1.Execute then
        raiseExceptionCreate('Operação abortada', '');
      nomeArquivoMFD := SaveDialog1.FileName;
    end
    else
    if not CImpressoraF.gerarArquivosConferenciaSintegraSPED(nomeArquivoSint, nomeArquivoMFD,vDataIni, vDataFim) then
    begin
      vDadosIniF.progressoFuncao('', '', 'Arquivos não foram criados');
      Writeln(logTxt,'Arquivos não foram criados');
      Result := False;
      Exit;
    end;

    if not FileExists(nomeArquivoSint) then
      Exit;

    if not FileExists(nomeArquivoMFD) then
      Exit;

    ///  Inicia a leitura do arquivo montado pelo ECF
    nSerieECFTemp := Trim(Copy(Trim(CImpressoraF.NumeroSerie),1,20));
    Writeln(logTxt,'Iniciando Leitura de arquivo: '+nomeArquivoMFD);
    vDadosIniF.progressoFuncao('', '', 'Lendo dados obtidos do ECF');
    try

      ///  Leitura do arquivo do sintegra para obter dados de seqIni, SeqFim e totalizador geral

      Writeln(logTxt,'Iniciando Leitura de arquivo: '+nomeArquivoSint);

      AssignFile(arquivoTxt, nomeArquivoSint);
      try

        Reset(arquivoTxt);
        repeat

          ReadLn(arquivoTxt, vLinha);
          if Copy(vLinha,1,3) = '60M' then
          begin
            diaCorrente := Copy(vLinha,4,8);
            diaCorrente := copy(diaCorrente,7,2)+'/'+
              copy(diaCorrente,5,2)+'/'+
              copy(diaCorrente,1,4);
            if (StrToDate(diaCorrente) >= StrToDate(vDataIni)) and
              (StrToDate(diaCorrente) <= StrToDate(vDataFim)) and
              (pos(nSerieECFTemp, copy(vLinha, 12, 20)) > 0) then
            begin

              _RZ.Insert;
              _RZ.FieldByName('DATA_MOV').AsDateTime := StrToDate(diaCorrente);
              _RZ.FieldByName('NREDUCOES').AsInteger := StrToInt(Trim(Copy(vLinha, 49, 6)));
              _RZ.FieldByName('SEQINI').AsInteger := StrToInt(Trim(Copy(vLinha, 37, 6)));
              _RZ.FieldByName('SEQFIM').AsInteger := StrToInt(Trim(Copy(vLinha, 43, 6)));
              _RZ.FieldByName('VLTOTGERAL').AsFloat :=  StrToFloat(Trim(Copy(vLinha, 74, 16)));
              if _RZ.FieldByName('VLTOTGERAL').AsFloat > 0 then
                _RZ.FieldByName('VLTOTGERAL').AsFloat := _RZ.FieldByName('VLTOTGERAL').AsFloat / 100;
              _RZ.Post;

            end;
          end;

        until System.Eof(arquivoTxt);

      finally
        CloseFile(arquivoTxt);
      end;

      Writeln(logTxt, 'Leitura concluída do arquivo: ' + nomeArquivoSint);

      AssignFile(arquivoTxt, nomeArquivoMFD);
      try

        /// Leitura do arquivo para a tabela resumoD

        Reset(arquivoTxt);
        repeat

          ReadLn(arquivoTxt, vLinha);
          diaCorrente := Copy(vLinha,65,8);
          diaCorrente := copy(diaCorrente,7,2)+'/'+
            copy(diaCorrente,5,2)+'/'+
            copy(diaCorrente,1,4);
          ///  Verifica se o registro é o E12, se for faz a copia dos dados
          if Copy(vLinha,1,3) = 'E12' then
          begin
            if (pos(nSerieECFTemp, copy(vLinha, 4, 20)) > 0) then
            begin

              _RZ.First;
              while not _RZ.Eof do
              begin
                if StrToInt(Trim(Copy(vLinha, 47, 6))) = _RZ.FieldByName('NREDUCOES').AsInteger then
                begin

                  _RZ.Edit;
                  //_RZ.FieldByName('DATA_MOV').AsDateTime := StrToDate(diaCorrente);
                  //_RZ.FieldByName('SEQINI').AsInteger := 0;// StrToInt(Trim(Copy(vLinha, 37, 6)));
                  //_RZ.FieldByName('SEQFIM').AsInteger := 0;// StrToInt(Trim(Copy(vLinha, 43, 6)));
                  _RZ.FieldByName('NREDUCOES').AsInteger := StrToInt(Trim(Copy(vLinha, 47, 6)));
                  _RZ.FieldByName('CRO_MOV').AsInteger := StrToInt(Trim(Copy(vLinha, 59, 6)));
                  _RZ.FieldByName('COORED').AsInteger := StrToInt(Trim(Copy(vLinha, 53, 6)));
                  _RZ.FieldByName('VLVENDAB').AsFloat := StrToFloat(Trim(Copy(vLinha, 87, 14)));
                  if _RZ.FieldByName('VLVENDAB').AsFloat > 0 then
                    _RZ.FieldByName('VLVENDAB').AsFloat := _RZ.FieldByName('VLVENDAB').AsFloat / 100;
                  //_RZ.FieldByName('VLTOTGERAL').AsFloat := 0;// StrToFloat(Trim(Copy(vLinha, 74, 16)));
                  diaTemporario := Copy(vLinha,73,8);
                    diaTemporario := copy(diaTemporario,7,2)+'/'+
                    copy(diaTemporario,5,2)+'/'+ copy(diaTemporario,1,4);
                  _RZ.FieldByName('DATA_EMISSAO_Z').AsDateTime := StrToDate(diaTemporario);
                  diaTemporario := Copy(vLinha,81,6);
                  _RZ.FieldByName('HORA_EMISSAO_Z').AsString :=
                    copy(diaTemporario,1,2)+':'+ copy(diaTemporario,3,2)+':'+ copy(diaTemporario,5,2);
                  _RZ.Post;

                end;
                _RZ.Next;
              end;
            end;
          end;

        until System.Eof(arquivoTxt);

        /// Leitura do arquivo para a tabela mapa_resumo_aliq

        Reset(arquivoTxt);
        repeat

          ReadLn(arquivoTxt, vLinha);
          if Copy(vLinha,1,3) = 'E13' then
          begin
            if (pos(nSerieECFTemp, copy(vLinha, 4, 20)) > 0) then
            begin
              _RZ.First;
              while not _RZ.Eof do
              begin
                if _RZ.FieldByName('NREDUCOES').AsInteger =
                 StrToInt(Trim(Copy(vLinha, 47, 6))) then
                 begin

                  _MR.Insert;
                  _MR.FieldByName('COORED').AsInteger := _RZ.FieldByName('COORED').AsInteger;
                  _MR.FieldByName('DESCALIQ').AsString := Trim(Copy(vLinha, 53, 7));
                  _MR.FieldByName('VALORALIQ').AsFloat := StrToFloat(Trim(Copy(vLinha, 60, 13)));
                  if _MR.FieldByName('VALORALIQ').AsFloat > 0 then
                    _MR.FieldByName('VALORALIQ').AsFloat := _MR.FieldByName('VALORALIQ').AsFloat / 100;
                  _MR.Post;
                  if _MR.FieldByName('VALORALIQ').AsFloat = 0 then
                    _MR.Delete;
                  
                 end;

                _RZ.Next;
              end;
            end;
          end;

        until System.Eof(arquivoTxt);

      finally
        CloseFile(arquivoTxt);
      end;

      Writeln(logTxt,'Leitura concluída do arquivo: '+nomeArquivoMFD);

      Writeln(logTxt,'Conferindo dados obtidos com dados no banco');
      Writeln(logTxt,'Iniciando transacao');
      IniciaTransacao;
      
      vDadosIniF.progressoFuncao('', '', 'Conferindo informações da Redução Z');

      vSqlInsertRZ:=
        'INSERT INTO RESUMOD (COD_TERMINAL, NSERIEECF, COD_EMPRESA, DATA_MOV, SEQINI, SEQFIM, VLVENDAB,' +
        ' VLTOTGERAL, CRO_MOV, NREDUCOES, COORED, VLCANCEL, VLACRESCIMO, VLDESCONTOS, VLISS, VLISENTOS,' +
        ' VLNINCIDENCIA, VLSUBST, DATA_EMISSAO_Z, HORA_EMISSAO_Z, VLTOTLIQ, ENVIADO_RET)' +
        ' VALUES (:COD_TERMINAL, :NSERIEECF, :COD_EMPRESA, :DATA_MOV, :SEQINI, :SEQFIM, :VLVENDAB, :VLTOTGERAL,' +
        ' :CRO_MOV, :NREDUCOES, :COORED, :VLCANCEL, :VLACRESCIMO, :VLDESCONTOS, :VLISS, :VLISENTOS, :VLNINCIDENCIA,' +
        ' :VLSUBST, :DATA_EMISSAO_Z, :HORA_EMISSAO_Z, :VLTOTLIQ, ''A'')';

      vListaParametros := TStringList.Create;
      _RZ.First;
      while not _RZ.Eof do
      begin
        //cooRed :=
        buscas.Close;
        buscas.SQL.Text := 'select * from resumod' +
          ' where cod_empresa = ' + vDadosIniF.codEmpresa +
          ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
          ' and cod_terminal = ' + vDadosIniF.vCodTerminal +
          ' and coored = '+IntToStr(_RZ.FieldByName('coored').AsInteger);
        buscas.Open;
        if buscas.IsEmpty then
        begin
          Writeln(logTxt, 'Inclusão de Reducao Z do COO: '+
            vDadosIniF.StrZero(_RZ.FieldByName('coored').AsInteger, 6 )+
            ' Data de Movimento: ' + _RZ.FieldByName('data_mov').AsString);

          buscasExec.Close;
          buscasExec.SQL.Text := vSqlInsertRZ ;
          buscasExec.ParamByName('COD_TERMINAL').AsInteger := StrToInt(vDadosIniF.vCodTerminal);
          buscasExec.ParamByName('NSERIEECF').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
          buscasExec.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIniF.codEmpresa);
          buscasExec.ParamByName('DATA_MOV').AsDate := _RZ.FieldByName('DATA_MOV').AsDateTime;
          buscasExec.ParamByName('SEQINI').AsInteger := _RZ.FieldByName('SEQINI').AsInteger;
          buscasExec.ParamByName('SEQFIM').AsInteger := _RZ.FieldByName('SEQFIM').AsInteger;
          buscasExec.ParamByName('VLVENDAB').AsCurrency := _RZ.FieldByName('VLVENDAB').AsCurrency;
          buscasExec.ParamByName('VLTOTGERAL').AsCurrency := _RZ.FieldByName('VLTOTGERAL').AsCurrency;
          buscasExec.ParamByName('CRO_MOV').AsInteger := _RZ.FieldByName('CRO_MOV').AsInteger;
          buscasExec.ParamByName('NREDUCOES').AsInteger := _RZ.FieldByName('NREDUCOES').AsInteger;
          buscasExec.ParamByName('COORED').AsInteger := _RZ.FieldByName('COORED').AsInteger;
          buscasExec.ParamByName('VLCANCEL').AsCurrency := 0;
          buscasExec.ParamByName('VLACRESCIMO').AsCurrency := 0;
          buscasExec.ParamByName('VLDESCONTOS').AsCurrency := 0;
          buscasExec.ParamByName('VLISS').AsCurrency := 0;
          buscasExec.ParamByName('VLISENTOS').AsCurrency := 0;
          buscasExec.ParamByName('VLNINCIDENCIA').AsCurrency := 0;
          buscasExec.ParamByName('VLSUBST').AsCurrency := 0;
          buscasExec.ParamByName('VLTOTLIQ').AsCurrency := 0;
          _MR.First;
          while not _MR.Eof do
          begin
            /// Valores de cancelamento
            if _RZ.FieldByName('COORED').AsInteger =
              _MR.FieldByName('COORED').AsInteger then
            begin
              if (Trim(_MR.FieldByName('DESCALIQ').AsString) = 'Can-T') or
                (Trim(_MR.FieldByName('DESCALIQ').AsString) = 'Can-S') then
                buscasExec.ParamByName('VLCANCEL').AsCurrency :=
                  buscasExec.ParamByName('VLCANCEL').AsCurrency +
                    _MR.FieldByName('VALORALIQ').AsFloat
              else if (Trim(_MR.FieldByName('DESCALIQ').AsString) = 'AT') or
                (Trim(_MR.FieldByName('DESCALIQ').AsString) = 'AS') then
                buscasExec.ParamByName('VLACRESCIMO').AsCurrency :=
                  buscasExec.ParamByName('VLACRESCIMO').AsCurrency +
                    _MR.FieldByName('VALORALIQ').AsFloat
              else if (Trim(_MR.FieldByName('DESCALIQ').AsString) = 'DT') or
                (Trim(_MR.FieldByName('DESCALIQ').AsString) = 'DS') then
                buscasExec.ParamByName('VLDESCONTOS').AsCurrency :=
                  buscasExec.ParamByName('VLDESCONTOS').AsCurrency +
                    _MR.FieldByName('VALORALIQ').AsFloat
              else if (copy(Trim(_MR.FieldByName('DESCALIQ').AsString),3,1) = 'S') then
                buscasExec.ParamByName('VLISS').AsCurrency :=
                  buscasExec.ParamByName('VLISS').AsCurrency +
                    _MR.FieldByName('VALORALIQ').AsFloat
              else if (Trim(_MR.FieldByName('DESCALIQ').AsString) = 'I1') or
                (Trim(_MR.FieldByName('DESCALIQ').AsString) = 'IS1') then
                buscasExec.ParamByName('VLISENTOS').AsCurrency :=
                  buscasExec.ParamByName('VLISENTOS').AsCurrency +
                    _MR.FieldByName('VALORALIQ').AsFloat
              else if (Trim(_MR.FieldByName('DESCALIQ').AsString) = 'N1') or
                (Trim(_MR.FieldByName('DESCALIQ').AsString) = 'NS1') then
                buscasExec.ParamByName('VLNINCIDENCIA').AsCurrency :=
                  buscasExec.ParamByName('VLNINCIDENCIA').AsCurrency +
                    _MR.FieldByName('VALORALIQ').AsFloat
              else if (Trim(_MR.FieldByName('DESCALIQ').AsString) = 'F1') or
                (Trim(_MR.FieldByName('DESCALIQ').AsString) = 'FS1') then
                buscasExec.ParamByName('VLSUBST').AsCurrency :=
                  buscasExec.ParamByName('VLSUBST').AsCurrency +
                    _MR.FieldByName('VALORALIQ').AsFloat;
            end;
            _MR.Next;
          end;
          buscasExec.ParamByName('VLTOTLIQ').AsCurrency :=
            buscasExec.ParamByName('VLVENDAB').AsCurrency -
            buscasExec.ParamByName('VLDESCONTOS').AsCurrency -
            buscasExec.ParamByName('VLCANCEL').AsCurrency;
          buscasExec.ParamByName('DATA_EMISSAO_Z').AsDate :=
            _RZ.FieldByName('DATA_EMISSAO_Z').AsDateTime;
          buscasExec.ParamByName('HORA_EMISSAO_Z').AsString :=
            _RZ.FieldByName('HORA_EMISSAO_Z').AsString;
          buscasExec.ExecSQL;
        end
        else
        begin

          vListaParametros.Clear;  
          vSqlUpdate := '';
          for I := 0 to _RZ.FieldCount - 1 do
            if _RZ.Fields[i].FieldName <> 'COORED' then
              if _RZ.FieldByName(_RZ.Fields[i].FieldName).Value <>
                buscas.FieldByName(_RZ.Fields[i].FieldName).Value then
                  vListaParametros.Add(_RZ.Fields[i].FieldName);

          for I := 0 to vListaParametros.Count - 1 do
            vSqlUpdate := vSqlUpdate + ', '+vListaParametros[i]+' = :'+vListaParametros[i];


          if vSqlUpdate <> '' then
          begin
            vSqlUpdate := vSqlUpdate + ', enviado_ret = ''A''';
            vSqlUpdate := copy(vSqlUpdate,2, length(vSqlUpdate))+
              ' where cod_empresa = ' + vDadosIniF.codEmpresa +
              ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
              ' and cod_terminal = ' + vDadosIniF.vCodTerminal +
              ' and coored = '+IntToStr(_RZ.FieldByName('coored').AsInteger);
            buscasExec.Close;
            buscasExec.SQL.Text := 'update resumod set '+ vSqlUpdate;

            Writeln(logTxt, 'Alteraçãode Reducao Z do COO: '+
              vDadosIniF.StrZero(_RZ.FieldByName('coored').AsInteger, 6 )+
              ' Data de Movimento: ' + _RZ.FieldByName('data_mov').AsString);

            for I := 0 to vListaParametros.Count - 1 do
            begin
              Writeln(logTxt, 'Campo: : '+vListaParametros[i]+
                ' Valor Antigo: ' + buscas.FieldByName(vListaParametros[i]).AsString +
                ' Valor Alterado: ' + _RZ.FieldByName(vListaParametros[i]).AsString);

              buscasExec.ParamByName(vListaParametros[i]).Value :=
                _RZ.FieldByName(vListaParametros[i]).Value;
            end;

            buscasExec.ExecSQL;

          end;
        end;
        _RZ.Next;
      end;

      Writeln(logTxt, 'Removendo registros Analiticos');
      vDadosIniF.progressoFuncao('', '', 'Conferindo informações da Analiticas da Redução Z');

      _RZ.First;
      while not _RZ.Eof do
      begin
        buscas.Close;
        buscas.SQL.Text := 'select * from mapa_resumo_aliq '+
          ' where cod_empresa = ' + vDadosIniF.codEmpresa +
          ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
          ' and cod_terminal = ' + vDadosIniF.vCodTerminal +
          ' and coored = '+IntToStr(_RZ.FieldByName('coored').AsInteger);
        buscas.Open;

        buscas.First;
        while not buscas.Eof do
        begin
          Writeln(logTxt, 'Removendo registro COO: '+
            IntToStr(_RZ.FieldByName('coored').AsInteger)+
            ' Totalizador: ' + buscas.FieldByName('descaliq').AsString+
            ' Valor acumulado: ' + Format( '%0.2f', [buscas.FieldByName('valoraliq').AsFloat]));
          buscas.Next;
        end;

        buscasExec.Close;
        buscasExec.SQL.Text := 'delete from mapa_resumo_aliq '+
          ' where cod_empresa = ' + vDadosIniF.codEmpresa +
          ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
          ' and cod_terminal = ' + vDadosIniF.vCodTerminal +
          ' and coored = '+IntToStr(_RZ.FieldByName('coored').AsInteger);
        buscasExec.ExecSQL;
        _RZ.Next;
      end;

      buscasExec.Close;
      buscasExec.SQL.Text :=
        'INSERT INTO MAPA_RESUMO_ALIQ (COD_TERMINAL, NSERIEECF, COD_EMPRESA, COORED,' +
        ' ALIQ_SEQ, DESCALIQ, VALORALIQ, ENVIADO_RET)' +
        ' VALUES (:COD_TERMINAL, :NSERIEECF, :COD_EMPRESA, :COORED, :ALIQ_SEQ, :DESCALIQ,' +
        ' :VALORALIQ, ''A'')';
      
      Writeln(logTxt, 'Incluíndo registros Analiticos');

      _MR.First;
      vCooTemp := _MR.FieldByName('COORED').AsInteger;
      i:=0;
      while not _MR.Eof do
      begin
        inc(i);
        Writeln(logTxt, 'Incluíndo registro COO: '+
            IntToStr(_MR.FieldByName('coored').AsInteger)+
            ' Totalizador: ' + _MR.FieldByName('descaliq').AsString+
            ' Valor acumulado: ' + Format( '%0.2f', [_MR.FieldByName('valoraliq').AsFloat]));
        buscasExec.Close;
        buscasExec.ParamByName('COD_TERMINAL').AsInteger := StrToInt(vDadosIniF.vCodTerminal);
        buscasExec.ParamByName('NSERIEECF').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
        buscasExec.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIniF.codEmpresa);
        buscasExec.ParamByName('COORED').AsInteger := _MR.FieldByName('COORED').AsInteger;
        if (Copy(_MR.FieldByName('DESCALIQ').AsString,3,1) = 'T') or
          (Copy(_MR.FieldByName('DESCALIQ').AsString,3,1) = 'S') then
          buscasExec.ParamByName('ALIQ_SEQ').AsString :=
            Trim(Copy(_MR.FieldByName('DESCALIQ').AsString,1,2))
        else
          buscasExec.ParamByName('ALIQ_SEQ').AsString :=
            IntToStr(10 + i);
        buscasExec.ParamByName('DESCALIQ').AsString := _MR.FieldByName('DESCALIQ').AsString;
        buscasExec.ParamByName('VALORALIQ').AsCurrency := _MR.FieldByName('VALORALIQ').AsCurrency;
        buscasExec.ExecSQL;

        vCooTemp := _MR.FieldByName('COORED').AsInteger;
        _MR.Next;
        if vCooTemp <> _MR.FieldByName('COORED').AsInteger then
          i:= 0;
      end;
      Writeln(logTxt, 'Comitando Transação');
      CommitaTransacao;
      Writeln(logTxt, 'Transação Comitada');
      Writeln(logTxt, 'Fim de Processamento');

    except
      on e: exception do begin
        RollBackTransacao;
        Result := False;
        Application.MessageBox(pchar('Erro de Processamento. Erro: '+e.Message+#13+
          'Veja o log de processamento '+nomeLog),'Atenção', 0+64);
        vDadosIniF.progressoFuncao('', '', 'Erro no processamento');
      end;
    end;

    vDadosIniF.progressoFuncao('', '', 'Finalizando');
    Sleep(1500);

  finally
    try
      CloseFile(logTxt);
    except
    end;
    vDadosIniF.finalizaProgresso;
  end;
end;

{ TSangSup }

function TSangSup.abreSangSupParaInclusao: boolean;
begin
  Result := montaSelect('select * from sangsup where cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and nreg = 0 and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)));
end;

function TSangSup.cancelarRegistro: boolean;
begin
  try
    dataSet.Edit;
    dataSet.FieldByName('valor_original').AsFloat :=
      dataSet.FieldByName('valor').AsFloat;
//    dataSet.FieldByName('valor').AsFloat := 0;
    dataSet.FieldByName('status').AsString := 'CANCELADO';
    dataSet.FieldByName('enviado_ret').AsString := 'A';
    try
      dataSet.FieldByName('coocancelamento').AsString := Trim(CImpressoraF.numeroCOO);
    except
    end;
    dataSet.Post;
    Apply;
    CommitaTransacao;

    try
      buscas.Close;
      buscas.SQL.Text := 'update fincupom set STATUS_FC = ''CANCELADO'', ENVIADO_RET = ''A''' +
        ' where cod_terminal = ' + IntToStr(dataSet.FieldByName('cod_terminal').AsInteger) +
        ' and nserieecf = ' + QuotedStr(dataSet.FieldByName('nserieecf').AsString) +
        ' and cod_empresa = ' + IntToStr(dataSet.FieldByName('cod_empresa').AsInteger) +
        ' and ordem = ' + IntToStr(dataSet.FieldByName('nreg').AsInteger) +
        ' and cupom = ' + IntToStr(dataSet.FieldByName('coonaofiscal').AsInteger);
      buscas.ExecSQL;
      if buscas.Transaction.InTransaction then
        buscas.Transaction.Commit;
    except
    end;

    CImpressoraF.vDocNaoF.coo := CImpressoraF.numeroCOO;
		CImpressoraF.vDocNaoF.gnf := CImpressoraF.numeroGNF;
    CImpressoraF.vDocNaoF.grg := '0';
    CImpressoraF.vDocNaoF.cdc := '0';
    CImpressoraF.vDocNaoF.tipoDoc := 'NC';
    CImpressoraF.vDocNaoF.data := CImpressoraF.dataHoraUltimoDocumento;
    CImpressoraF.vDocNaoF.hora := TimeToStr(TimeOf(StrToTimeDef(CImpressoraF.vDocNaoF.hora, Now)));
    CImpressoraF.vDocNaoF.data := DateToStr(DateOf(StrToDateDef(CImpressoraF.vDocNaoF.hora, Date)));
    obDocNF.incluiDocNaoFIscal(CImpressoraF.vDocNaoF);

//    obSangSup.vFinCupom.insereFimCupom(obSangSup.dataSet.FieldByName('nreg').AsInteger,
//          obSangSup.dataSet.FieldByName('coonaofiscal').AsInteger,
//          obSangSup.dataSet.FieldByName('finalizador').AsInteger, 0,
//          StrToInt(Trim(CImpressoraF.numeroGNF)), 0,
//          obSangSup.dataSet.FieldByName('valor').AsCurrency * (-1),
//          obSangSup.dataSet.FieldByName('valor').AsCurrency * (-1),
//          copy(obSangSup.dataSet.FieldByName('sangsuprimento').AsString, 1, 3));

  except  on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), pchar('Erro'), 0+64);
      registraErro(e.Message);
    end;
  end;
end;

constructor TSangSup.create;
begin
  dataSet := TClientDataSet(DtmFiscal.cdsSangSup);
  transacao := TIBTransaction(DtmFiscal.transacaoFiscal);
  buscas := TIBQuery(DtmFiscal.qrBuscas);
  vFinCupom := TFinCupom.create;
end;

destructor TSangSup.Destroy;
begin
  vFinCupom.Free;
  vFinCupom := nil;
  inherited;
end;

function TSangSup.getTodos: boolean;
begin
  Result := montaSelect('select * from sangsup where cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)));
end;

function TSangSup.insereRecebimentoPrestacao: Boolean;
begin
  Cancel;
  if inherited insert then
  begin
    dataSet.FieldByName('sangsuprimento').AsString := 'REC PREST';
    dataSet.FieldByName('cod_terminal').AsString := vDadosIniF.vCodTerminal;
    dataSet.FieldByName('cod_EMPRESA').AsString := vDadosIniF.codEmpresa;
    dataSet.FieldByName('datalanc').AsDateTime := Date;
    dataSet.FieldByName('nserieecf').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
    Result := true;
  end
  else
    Result := false;
end;

function TSangSup.insereSangria: boolean;
begin
  Cancel;
  if inherited insert then
  begin
    dataSet.FieldByName('sangsuprimento').AsString := 'SANGRIA';
    dataSet.FieldByName('cod_EMPRESA').AsString := vDadosIniF.codEmpresa;
    dataSet.FieldByName('cod_terminal').AsString := vDadosIniF.vCodTerminal;
    dataSet.FieldByName('datalanc').AsDateTime := Date;
    dataSet.FieldByName('nserieecf').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
    Result := true;
  end
  else
    Result := false;
end;

function TSangSup.insereSuprimento: boolean;
begin
  Cancel;
  if inherited insert then
  begin
    dataSet.FieldByName('sangsuprimento').AsString := 'SUPRIMENTO';
    dataSet.FieldByName('cod_EMPRESA').AsString := vDadosIniF.codEmpresa;
    dataSet.FieldByName('cod_terminal').AsString := vDadosIniF.vCodTerminal;
    dataSet.FieldByName('datalanc').AsDateTime := Date;
    dataSet.FieldByName('nserieecf').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
    Result := true;
  end
  else
    Result := false;
end;

function TSangSup.post1(finalizador: integer): boolean;
var
  vrSangria: Currency;
  vrSup: Currency;
  vrOut: Currency;
begin
  if dataSet.FieldByName('valor').AsCurrency <= 0 then
  begin
    Result := false;
    exit;
  end;
  {if dataSet.FieldByName('sangsuprimento').AsString = 'SANGRIA' then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select sum(ss.valor) valor,ss.sangsuprimento,ss.finalizador from sangsup ss'
      +
      ' where ss.finalizador = :finalizador and ss.datalanc = :data group by 2,3';
    buscas.Params[0].AsInteger := finalizador;
    buscas.Params[1].AsDate := date;
    buscas.Open;
    vrSangria := 0;
    vrSup := 0;
    vrOut := 0;
    while not buscas.Eof do
    begin
      if buscas.FieldByName('sangsuprimento').AsString = 'SANGRIA' then
        vrSangria := vrSangria + buscas.FieldByName('valor').AsCurrency
      else if buscas.FieldByName('sangsuprimento').AsString = 'SUPRIMENTO' then
        vrSup := vrSup + buscas.FieldByName('valor').AsCurrency
      else
        vrOut := vrOut + buscas.FieldByName('valor').AsCurrency;
      buscas.Next;
    end;
    buscas.Close;
    buscas.SQL.Text := 'select sum(fc.valor) valor,fc.finalizador from fincupom fc' +
      ' inner join cupom cp on cp.cod_terminal =  fc.cod_terminal and' +
      ' cp.nserieecf = fc.nserieecf and cp.cod_empresa = fc.cod_empresa and' +
      ' cp.registro = fc.ordem and cp.cupom = fc.cupom' +
      ' where fc.finalizador = :finalizador and fc.data = :data and' +
      ' ((cp.status_cp = '''') or (cp.status_cp is null) or (cp.status_cp <> ''CANCELADO'') )' +
      ' group by 2';
    buscas.Params[0].AsInteger := finalizador;
    buscas.Params[1].AsDate := date;
    buscas.Open;
    vrSup := vrSup + buscas.FieldByName('valor').AsCurrency;
    buscas.Close;
    if dataSet.FieldByName('valor').AsCurrency > (vrSup + vrOut - vrSangria) then
    begin
      Application.MessageBox('Valor maior que o disponível em Caixa', 'Erro', MB_ICONINFORMATION +
        mb_OK);
      Result := false;
      exit;
    end;
  end;  }
  if dataset.state in [dsInsert, dsEdit] then
    dataSet.FieldByName('finalizador').AsInteger := Finalizador;
  Result := post;
end;

function TSangSup.sangriaPermitida(finalizador: integer): boolean;
var
  vrSangria: Currency;
  vrSup: Currency;
  vrOut: Currency;
begin
  Result := True;
  
  if dataSet.FieldByName('valor').AsCurrency <= 0 then
  begin
    Result := false;
    exit;
  end;

  if dataSet.FieldByName('sangsuprimento').AsString = 'SANGRIA' then
  begin

    {buscas.Close;
    buscas.SQL.Text := 'select sum(ss.valor) valor,ss.sangsuprimento,ss.finalizador from sangsup ss'
      + ' where ss.finalizador = :finalizador and ss.datalanc = :data and coalesce(ss.status, '''') <> ''CANCELADO'' group by 2,3';
    buscas.Params[0].AsInteger := finalizador;
    buscas.Params[1].AsDate := date;
    buscas.Open;
    vrSangria := 0;
    vrSup := 0;
    vrOut := 0;
    while not buscas.Eof do
    begin
      if buscas.FieldByName('sangsuprimento').AsString = 'SANGRIA' then
        vrSangria := vrSangria + buscas.FieldByName('valor').AsCurrency
      else if buscas.FieldByName('sangsuprimento').AsString = 'SUPRIMENTO' then
        vrSup := vrSup + buscas.FieldByName('valor').AsCurrency
      else
        vrOut := vrOut + buscas.FieldByName('valor').AsCurrency;
      buscas.Next;
    end;
    buscas.Close;
    buscas.SQL.Text := 'select sum(fc.valor) valor, fc.finalizador from fincupom fc' +
      ' where fc.finalizador = :finalizador and fc.data = :data' +
      ' and coalesce(fc.status_fc, '''') = ''''' +
      ' group by 2';
    buscas.Params[0].AsInteger := finalizador;
    buscas.Params[1].AsDate := date;
    buscas.Open;
    vrSup := vrSup + buscas.FieldByName('valor').AsCurrency;
    buscas.Close;}

    buscas.Close;
    buscas.SQL.Text := 'select sum(coalesce(fc.valor, 0) * case when fc.tipo_doc = ''SAN'' then -1 else 1 end) valor' +
      ' from fincupom fc' +
      ' where fc.data = :DATA and fc.finalizador = :FINALIZADOR and coalesce(fc.status_fc, '''') <> ''CANCELADO''' +
      ' AND COD_EMPRESA = ' + vDadosIniF.codEmpresa;
    buscas.ParamByName('FINALIZADOR').AsInteger := finalizador;
    buscas.ParamByName('DATA').AsDate := date;
    buscas.Open;

    if vDadosIniF.StrToFloatFormat(dataSet.FieldByName('valor').AsCurrency, 2) > vDadosIniF.StrToFloatFormat(buscas.FieldByName('VALOR').AsFloat, 2) then
    begin
      Application.MessageBox(pChar('Valor maior que o disponível em Caixa para o finalizador selecionado' +#13+
      format('%0.2n', [buscas.FieldByName('VALOR').AsFloat])), 'Erro', MB_ICONINFORMATION + mb_OK);
      Result := false;
      exit;
    end;
  end;
end;

function TSangSup.selecionaSangriaSuprimento(pCooNaoFiscal: Integer): boolean;
begin
  Result := montaSelect('select * from sangsup where cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and coonaofiscal = '+IntToStr(pCooNaoFiscal));
end;

procedure TSangSup.verificaCampos;
begin
  try
    buscas.Close;
    buscas.SQL.Text := 'select COONAOFISCAL, VALOR_ORIGINAL, STATUS, COOCANCELAMENTO from sangsup where cod_terminal = ' + vDadosIniF.vCodTerminal +
      ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
      ' and nreg = 0';
    buscas.Open;
  except;
    vDadosIniF.verificaCamposNaoCriados;
  end;
end;

function TSangSup.post: boolean;
begin
  try
    if (dataSet.State <> dsInsert) then
    begin
      Result := false;
      exit;
    end;
    if dataSet.FieldByName('valor').AsFloat <= 0 then
      raise exception.create('Valor menor ou igual a zero');
    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('coonaofiscal').AsString := Trim(CImpressoraF.numeroCOO);
      dataSet.FieldByName('nreg').AsInteger := Gencodigo('SANGSUP', DtmFiscal.SpIncCodigo,
        vDadosIniF.codEmpresa);
    end;
    dataSet.FieldByName('enviado_ret').AsString := 'A';
    Result := inherited Post;
    Result := Apply;
  except
    on e: exception do
    begin
      Result := false;
      MessageDlg(e.Message, mtInformation, [mbOK], 0);
    end;
  end;
end;

function TSangSup.selecionaSangriaSuprimento(dataIni, dataFim: TDate): boolean;
begin
  Result := montaSelect('select * from sangsup where cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and datalanc >= :data1 and datalanc <= :data2', dataIni, dataFim);
end;

{ TFinCupom }

function TFinCupom.cancelaFinCupom: boolean;
begin
  try
    while not Eof do
    begin
      Delete;
      Next;
    end;
    if Apply then
    begin
      CommitaTransacao;
      IniciaTransacao;
      Result := true;
    end;
  except on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), pchar('Erro'), mb_OK);
      registraErro(e.Message);
    end;
  end;
end;

constructor TFinCupom.create;
begin
  dataSet := TClientDataSet(DtmFiscal.cdsFinCP);
  transacao := TIBTransaction(DtmFiscal.transacaoFiscal);
  buscas := TIBQuery(DtmFiscal.qrBuscas);
end;

function TFinCupom.insereFimCupom(ordem, cupom, finalizador, totalizador, gnf,
  ccf: integer; valor, valor_rel: currency; tipoDoc: string): boolean;
begin
	try
		if not active then
			selecionaFinCupom(0, 0, 0);

		if inherited insert then
		begin
			dataSet.FieldByName('ordem').AsInteger := ordem;
			dataSet.FieldByName('cupom').AsInteger := cupom;
			dataSet.FieldByName('finalizador').AsInteger := finalizador;
			dataSet.FieldByName('cod_totalizador').AsInteger := totalizador;
			dataSet.FieldByName('gnf_ecf').AsInteger := gnf;
			dataSet.FieldByName('ccf_ecf').AsInteger := ccf;
			dataSet.FieldByName('cod_empresa').AsString := vDadosIniF.codEmpresa;
			dataSet.FieldByName('cod_terminal').AsString := vDadosIniF.vCodTerminal;
			dataSet.FieldByName('nserieecf').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
			dataSet.FieldByName('valor').AsCurrency := valor;
//      if vValorDescPremia > 0 then
			dataSet.FieldByName('valor_desconto').AsCurrency := (vValorDescPremia);
			dataSet.FieldByName('valorsaque').AsCurrency := valor + vValorSaque;
			dataSet.FieldByName('valor_rel').AsCurrency := valor;
			dataSet.FieldByName('tipo_doc').AsString := tipoDoc;
			dataSet.FieldByName('data').AsDateTime := date;
			dataSet.FieldByName('operador').AsInteger := vDadosIniF.vCodUsuario;
			dataSet.FieldByName('parcelas_tef').AsInteger := vQtdeParcelaCartao;
			dataSet.FieldByName('n_aut_cart').AsString := vNumAutorizacao;
			dataSet.FieldByName('n_docnsu_adm').AsString := vNSUTransacao;
			dataSet.FieldByName('enviado_ret').AsString := 'A';
			if (vDadosIniF.decodifica(obConfImp.dataSet.FieldByName('USAR_MOV_OP').AsString) = 'S') and (not vDadosIniF.strEstaContidoEm(vDadosIniF.vModoSistema, ['S', 'J'])) and (obMovOP.movimentoAberto) then
				dataSet.FieldByName('nmov').AsInteger := obMovOP.numMovimento;
			Result := Post;
      vValorSaque := 0;
      vValorDescPremia := 0;
    end;
  except on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), pchar('Erro'), mb_OK);
    end;
  end;
end;

function TFinCupom.post: boolean;
begin
  try
    if dataSet.State = dsInsert then
      dataSet.FieldByName('registro').AsInteger := Gencodigo('FINCUPOM', DtmFiscal.SpIncCodigo,
        vDadosIniF.codEmpresa);
    if inherited post then
    begin
      Apply;
      CommitaTransacao;
      IniciaTransacao;
      result := true;
    end;
  except on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), pchar('Erro'), mb_OK);
    end;
  end;
end;

function TFinCupom.selecionaFinCupom(codterminal, registro, cupom,
  finalizador: Integer): boolean;
begin
  Result := montaSelect('select * from fincupom where cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and ordem = ' + IntToStr(registro) + ' and cupom = ' + IntToStr(Cupom) +
    ' and cod_terminal = '+IntToStr(codterminal)+' and nserieecf = ' +
    QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and finalizador = ' + IntToStr(finalizador));
end;

procedure TFinCupom.setEnviadoRetAlterado(registro,
  cupom: Integer);
begin
  try
    buscas.Close;
    buscas.SQL.Text := 'update fincupom set enviado_ret = ''A'' where cod_empresa = ' + vDadosIniF.codEmpresa +
      ' and ordem = ' + IntToStr(registro) + ' and cupom = ' + IntToStr(Cupom) +
      ' and cod_terminal = '+vDadosIniF.vCodTerminal +' and nserieecf = ' +
      QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf));
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
      buscas.Transaction.Commit;
  except
  end;
end;

function TFinCupom.selecionaFinCupom(codterminal, registro,
  cupom: Integer): boolean;
begin
  Result := montaSelect('select * from fincupom where cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and ordem = ' + IntToStr(registro) + ' and cupom = ' + IntToStr(Cupom) +
    ' and cod_terminal = '+IntToStr(codterminal)+' and nserieecf = ' +
    QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)));
end;

function TFinCupom.selecionaFinCupom(nCupom, nOrdem: integer;
  nSerieECF: string): boolean;
begin
  Result := montaSelect('select * from fincupom where cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and ordem = ' + IntToStr(nOrdem) + ' and cupom = ' + IntToStr(nCupom) + ' and nserieecf = ' +
    QuotedStr(nSerieECF));
end;

{ TComandosImp }

constructor TComandosImp.Create;
begin
  dataSet := TClientDataSet(DtmFiscal.cdsComImp);
  transacao := TIBTransaction(DtmFiscal.transacaoFiscal);
  buscas := TIBQuery(DtmFiscal.qrBuscas);
end;

function TComandosImp.existeComando(codigo: string; mostraMensagem: boolean): boolean;
begin
  Result := true;
  if not dataSet.Active then
    selecionaComandos;
  if not dataSet.Active then
    Result := true;

  dataSet.IndexFieldNames := 'codfunfiscal';
  FindNearest([codigo]);
  if codigo = dataSet.FieldByName('codfunfiscal').AsString then
  begin
    if dataSet.FieldByName('COMANDO').AsString = 'N' then
    begin
      Result := false;
      if mostraMensagem then
        Application.MessageBox(pchar('Comando :' + dataSet.FieldByName('descricaofuncao').AsString +
          #13 +
          'Função não suportada pela modelo de ECF utilizado'), pchar('Informação'),
          MB_ICONEXCLAMATION +
          MB_OK);
    end;
  end
  else
  begin
    Result := false;
    if mostraMensagem then
      Application.MessageBox(pchar('Comando de Código :' + codigo +
        ' não encontrado'), pchar('Informação'), MB_ICONEXCLAMATION + MB_OK);
  end;
end;

function TComandosImp.selecionaComandos: boolean;
begin
  Result := montaSelect('select ci.codfunfiscal,fi.descricaofuncao,ci.comando from comandosimp ci' +
    ' inner join funcoesfiscal fi on fi.codfuncfiscal = ci.codfunfiscal' +
    ' inner join terminal_impressoras ti on ti.ident_cniee = ci.cod_cniee' +
    ' inner join confimp c on c.num_serie_ecf = ti.num_serie_ecf and c.cod_terminal = ti.cod_terminal' +
    ' and c.cod_empresa = ti.cod_empresa where c.num_serie_ecf = ' +
    QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and c.cod_terminal = ' + vDadosIniF.vCodTerminal + ' and c.cod_empresa = ' +
    vDadosIniF.codEmpresa);
end;

{ tFormPg }

procedure TFormPg.ArredondaParcela(Valor: Currency; Quant: Integer;
  var vValor: array of Currency);
var
  resto, vr: Currency;
  i: Integer;
begin
  vr := 0;
  for i := 0 to Length(vValor) - 1 do
  begin
    if (vDadosIniF.vTipoParcelamento = 'T1') or (vDadosIniF.vTipoParcelamento = 'TN') then
      vValor[i] := Trunc(valor / quant) 
    else
      vValor[i] := vDadosIniF.StrToFloatFormat(
     ( 0.01 * Trunc((valor / quant)*100) ) , 2);
    //    vr := vr + Trunc(valor / quant);
  end;
  if vDadosIniF.vTipoParcelamento = 'T1' then
    vValor[0] := vDadosIniF.StrToFloatFormat(vValor[0] + (valor - (vValor[0] * quant)), 2)
  else if vDadosIniF.vTipoParcelamento = 'TN' then
    vValor[Length(vValor) - 1] := vDadosIniF.StrToFloatFormat(vValor[Length(vValor) - 1] + (valor - (vValor[Length(vValor) - 1] * quant)), 2)
  else if (vDadosIniF.vTipoParcelamento = 'IN') then
    vValor[Length(vValor) - 1] := vDadosInif.StrToFloatFormat(vValor[0] + (valor - (vValor[0] * quant)), 2)
  else
    vValor[0] := vDadosIniF.StrToFloatFormat(vValor[0] +
      (valor - (vValor[0] * quant)), 2);

//  vr := 0;
//  for i := 0 to Length(vValor) - 1 do
//  begin
//    vValor[i] := trunc(valor / quant);
//    vr := vr + trunc(valor / quant);
//  end;
//  if vr < valor then
//    vValor[0] := vValor[0] + (Valor - vr);
end;

constructor TFormPg.Create;
begin
  dataSet := TClientDataSet(DtmFiscal.cdsformPg);
  transacao := TIBTransaction(DtmFiscal.transacaoFiscal);
  buscas := TIBQuery(DtmFiscal.qrBuscas);
end;

function TFormPg.getDocParcela(indice: integer): string;
var
  i: integer;
begin
  dataSet.First;
  for I := 0 to indice - 1 do
    dataSet.Next;
  Result := dataSet.FieldByName('NDOC').AsString;
end;

function TFormPg.getValorParcela(indice: integer): Currency;
var
  i: integer;
begin
  dataSet.First;
  for I := 0 to indice - 1 do
    dataSet.Next;
  Result := dataSet.FieldByName('valordoc').AsCurrency;
end;

function TFormPg.getVencimentoParcela(indice: integer): string;
var
  i: integer;
begin
  dataSet.First;
  for I := 0 to indice - 1 do
    dataSet.Next;
  Result := dataSet.FieldByName('data_venc').AsString;
end;

function TFormPg.gravavaParcelasFormPagamento(dtSet: TClientDataSet; vCupom, vRegistro: string): boolean;
var
  tempSql: string;
  i: integer;
begin
  try
    I := 0;
    dtSet.First;
    while not dtSet.Eof do
    begin
      INC(I);
      buscas.Close;
      buscas.SQL.Clear;
      buscas.SQL.Add('INSERT INTO FORMPAGAMENTO (SEQFORM, COD_EMPRESA, NREQUISICAO, NDOC, CLIENTE, COD_CLIENTE, HISTORICO, DATA_MOV, VALORDOC, TPDOCS, DATA_VENC, OPERADOR, TIP_CNT, NCOO_ECF, SECAO, COD_TERMINAL, NSERIEECF, REGISTRO, ENVIADO_RET, COD_CONTROLE)');
      buscas.SQL.Add('VALUES (:SEQFORM, :COD_EMPRESA, :NREQUISICAO, :NDOC, :CLIENTE, :COD_CLIENTE, :HISTORICO, :DATA_MOV, :VALORDOC, :TPDOCS, :DATA_VENC, :OPERADOR, :TIP_CNT, :NCOO_ECF, :SECAO, :COD_TERMINAL, :NSERIEECF, :REGISTRO, :ENVIADO_RET, :COD_CONTROLE)');
      buscas.ParamByName('SEQFORM').AsInteger := Gencodigo('FORMPAGAMENTO', DtmFiscal.SpIncCodigo,
        vDadosIniF.codEmpresa);
      buscas.ParamByName('COD_EMPRESA').AsString := vDadosIniF.codEmpresa;
      buscas.ParamByName('NREQUISICAO').AsString := vCupom;
      buscas.ParamByName('NDOC').AsString := dtSet.FieldByName('NDOC').AsString;
      if obCupom.getNomeAvulso = '' then
      begin
        buscas.ParamByName('CLIENTE').AsString := '';
        buscas.ParamByName('COD_CLIENTE').AsInteger := 0;
      end
      else
      begin
        buscas.ParamByName('CLIENTE').AsString :=
          obCliente.dataSet.FieldByName('NOME_CLIENTE').AsString;
        buscas.ParamByName('COD_CLIENTE').AsInteger :=
          obCliente.dataSet.FieldByName('COD_CLIENTE').AsInteger;
      end;
      buscas.ParamByName('HISTORICO').AsString := 'CREDITO A RECEBER REFERENTE A CUPOM FISCAL Nº ' +
        vCupom;
      buscas.ParamByName('DATA_MOV').AsDate := Date;
      buscas.ParamByName('VALORDOC').AsCurrency := dtSet.FieldByName('VALORDOC').AsCurrency;
      buscas.ParamByName('TPDOCS').AsString := 'CP';
      buscas.ParamByName('DATA_VENC').AsDate := dtSet.FieldByName('DATA_VENC').AsDateTime;
      buscas.ParamByName('OPERADOR').AsInteger := vDadosIniF.vCodUsuario;
      buscas.ParamByName('TIP_CNT').AsString := 'S';
      buscas.ParamByName('NCOO_ECF').AsString := vCupom;
      buscas.ParamByName('SECAO').AsInteger := vSecao;
      buscas.ParamByName('COD_TERMINAL').AsString := vDadosIniF.vCodTerminal;
      buscas.ParamByName('NSERIEECF').AsString := vDadosIniF.vNumSerieEcf;
      buscas.ParamByName('REGISTRO').AsString := vRegistro;
      buscas.ParamByName('ENVIADO_RET').AsString := 'S';
      if not obCtrl.dataSet.IsEmpty then
        buscas.ParamByName('COD_CONTROLE').AsInteger :=
          obCtrl.dataSet.FieldByName('codigo_ctrl').AsInteger;
      buscas.Prepare;
      buscas.ExecSQL;
      dtSet.Next;
    end;
    //CommitaTransacao;
    Result := True;
  except
    on e: exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro ao grava parcelas. Erro: '+e.Message),'Atenção',0+64);
    end;
  end;
end;

function TFormPg.montaParcelamento(lista: TListBox; parcelas, venceDia: integer;
  numeroVenda: string; valor: Currency; trintaDias: boolean): boolean;
const
  numeros = ['0'..'9'];
var
  temp: string;
  diaVenc, i, j, k: integer;
  dataTemp: TDate;
  condicaoPagamento: string;
  qtde: Integer;
  vDocumento: array of string;
  vData: array of string;
  vValor: array of Currency;
begin
  try
    condicaoPagamento := '';

    if (parcelas > 0) and (not trintaDias ) then
    begin
      condicaoPagamento := IntToStr(parcelas) + 'X';
      diaVenc := venceDia;
      qtde := parcelas;
    end
    else if trintaDias then
    begin
      if vDadosIniF.vParcelamentoDiaBase = 'S' then
        diaVenc := DayOfTheMonth( IncMonth(Date) )
      else
        diaVenc := DayOfTheMonth( Date + 30);
      qtde := 1;
      condicaoPagamento := '1X';
      temp := '1';
    end;      

    SetLength(vValor, qtde);
    SetLength(vDocumento, qtde);
    SetLength(vData, qtde);
    ArredondaParcela(valor, qtde, vValor);

    for i := 0 to qtde - 1 do
      vDocumento[I] := vDadosIniF.StrZero(numeroVenda, 6) + '-' + IntToStr(I + 1);
    if parcelas > 0 then
    begin
      for i := 0 to qtde - 1 do
      begin
        dataTemp := IncMonth(date, i + 1);
        if IsValidDate(YearOf(dataTemp), MonthOf(dataTemp), diaVenc) then
          vData[i] := DateToStr(StartOfTheMonth(dataTemp) + diaVenc - 1)
        else
          vData[i] := DateToStr(EndOfTheMonth(dataTemp));
      end;
    end;
    lista.Clear;
    while not dataSet.IsEmpty do
      dataSet.Delete;
    for I := 0 to qtde - 1 do
    begin
      lista.Items.Add(vDocumento[I] + '    ' + vData[I] + '           ' + Format('%m',
        [vValor[I]]));
      dataSet.Append;
      dataSet.FieldByName('data_venc').AsString := vData[I];
      dataSet.FieldByName('NDOC').AsString := vDocumento[I];
      dataSet.FieldByName('valordoc').AsCurrency := vValor[I];
      dataSet.Post;
    end;
    result := true;
  except
    on e: exception do
    begin
      result := false;
      Application.MessageBox(pchar('Erro ao gerar parcelas. Erro: ' + e.Message), 'Informação',
        MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

function TFormPg.montaParcelamento(lista: TListBox; parcelas: integer;
  numeroVenda: string; valor: Currency; trintaDias: boolean): boolean;
const
  numeros = ['0'..'9'];
var
  temp: string;
  diaVenc, i, j, k: integer;
  dataTemp: TDate;
  condicaoPagamento: string;
  qtde: Integer;
  vDocumento: array of string;
  vData: array of string;
  vValor: array of Currency;
begin
  try
    condicaoPagamento := '';

    if (parcelas > 0) and (not trintaDias ) then
    begin
      condicaoPagamento := IntToStr(parcelas) + 'X';
      temp := '';
      if temp = '' then
      begin
        if vDadosIniF.vParcelamentoDiaBase <> 'S' then
          temp := IntToStr(DayOf(date))
        else
        if not InputQuery('Todo Dia', 'Dia de Vencimento:', temp) then
        begin
          result := false;
          exit;
        end;
      end;
      diaVenc := StrToInt(temp);
      qtde := parcelas;
    end
    else if trintaDias then
    begin
      if vDadosIniF.vParcelamentoDiaBase = 'S' then
        diaVenc := DayOfTheMonth( IncMonth(Date) )
      else
        diaVenc := DayOfTheMonth( Date + 30);
      qtde := 1;
      condicaoPagamento := '1X';
      temp := '1';
    end;

      

    SetLength(vValor, qtde);
    SetLength(vDocumento, qtde);
    SetLength(vData, qtde);
    ArredondaParcela(valor, qtde, vValor);

    for i := 0 to qtde - 1 do
      vDocumento[I] := vDadosIniF.StrZero(numeroVenda, 6) + '-' + IntToStr(I + 1);
    dataTemp := vDadosIniF.getDataBanco(buscas);
    if parcelas > 0 then
    begin
      for i := 0 to qtde - 1 do
      begin
        if vDadosIniF.vParcelamentoDiaBase = 'S' then
        begin
          if IsValidDate(YearOf( IncMonth(dataTemp,I +1 ) ), MonthOf(IncMonth(dataTemp,I +1 )), diaVenc) then
            vData[i] := DateToStr(StartOfTheMonth(IncMonth(dataTemp,I +1 )) + diaVenc - 1)
          else
            vData[i] := DateToStr(EndOfTheMonth(IncMonth(dataTemp,I +1 )));
          IncMonth(dataTemp, 1);
        end
        else
          vData[i] := DateToStr(dataTemp + (i * 30));
//        dataTemp := IncMonth(date, i + 1);
//        if IsValidDate(YearOf(dataTemp), MonthOf(dataTemp), diaVenc) then
//          vData[i] := DateToStr(StartOfTheMonth(dataTemp) + diaVenc - 1)
//        else
//          vData[i] := DateToStr(EndOfTheMonth(dataTemp));
      end;
    end;
    lista.Clear;
    while not dataSet.IsEmpty do
      dataSet.Delete;
    for I := 0 to qtde - 1 do
    begin
      lista.Items.Add(vDocumento[I] + '    ' + vData[I] + '           ' + Format('%m',
        [vValor[I]]));
      dataSet.Append;
      dataSet.FieldByName('data_venc').AsString := vData[I];
      dataSet.FieldByName('NDOC').AsString := vDocumento[I];
      dataSet.FieldByName('valordoc').AsCurrency := vValor[I];
      dataSet.Post;
    end;
    result := true;
  except
    on e: exception do
    begin
      result := false;
      Application.MessageBox(pchar('Erro ao gerar parcelas. Erro: ' + e.Message), 'Informação',
        MB_OK + MB_ICONINFORMATION);
    end;
  end;
end;

function TFormPg.selecionaFormaPg(nCupom, nRegistro: string): boolean;
begin
  Result := montaSelect('select * from formpagamento where cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and cod_terminal = ' + vDadosIniF.vCodTerminal + ' and nserieecf = ' +
    QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and ncoo_ecf = ' + nCupom + ' and registro = ' + nregistro);
end;

function TFormPg.selecionaFormaPgPrazo(nCupom, nRegistro: string): boolean;
begin
  Result := montaSelect('select * from formpagamento where cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and cod_terminal = ' + vDadosIniF.vCodTerminal + ' and nserieecf = ' +
    QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and ncoo_ecf = ' + nCupom + ' and registro = ' + nregistro + ' and tipdoc = ' +
    QuotedStr('S2'));
end;

procedure TFormPg.setDocParcela(indice: integer; doc: string);
var
  i: integer;
begin
  dataSet.First;
  for I := 0 to indice - 1 do
    dataSet.Next;
  dataSet.Edit;
  dataSet.FieldByName('ndoc').AsString := doc;
  dataSet.Post;
end;

procedure TFormPg.setValorParcela(indice: integer; valor: Currency);
var
  i: integer;
begin
  dataSet.First;
  for I := 0 to indice - 1 do
    dataSet.Next;
  dataSet.Edit;
  dataSet.FieldByName('valordoc').AsCurrency := valor;
  dataSet.Post;
end;

procedure TFormPg.setVencimentoParcela(indice: integer; pData: string);
var
  i: integer;
begin
  dataSet.First;
  for I := 0 to indice - 1 do
    dataSet.Next;
  dataSet.Edit;
  dataSet.FieldByName('data_venc').AsString := pData;
  dataSet.Post;
end;

{ TTempoOp }

constructor TTempoOp.create;
begin
  dataSet := TClientDataSet(dtmFiscal.cdsTempOp);
  transacao := TIBTransaction(dtmFiscal.transacaoFiscal);
  buscas := TIBQuery(dtmFiscal.qrBuscas);
end;

destructor TTempoOp.Destroy;
begin

  inherited;
end;

function TTempoOp.efetuarFechamentoDeOperador(codigoOperador: integer;
  pPergunta: Boolean): boolean;
var
  vOK: Boolean;
  tempData: TDate;
begin
  Result := False;
  vOK := True;
  if (pPergunta) and (vDadosIniF.vUsarTravasOperador = 'S') then
    vOK := Application.MessageBox('O fechamento do operador impossibilita o uso do Terminal para este usuário. Deseja continuar mesmo assim?','Confirmação', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2 ) = ID_YES;

  if not vOK then
    Exit;

  tempData := vDadosIniF.getDataBanco(buscas);

  buscas.Close;
  buscas.SQL.Text := 'update tempoop set status = ''FECHADO''' +
    ' where operador = ' + IntToStr(codigoOperador) +
    ' and data = :data and ((status is null) or (status = ''''))';
  buscas.ParamByName('data').AsDate := tempData;
  buscas.ExecSQL;

  CommitaTransacao;

  Result := True;

end;

function TTempoOp.registraEntradaOperador(codigoOperador: integer): boolean;
var
  tempData: TDate;
begin
  Result := False;
  tempData := vDadosIniF.getDataBanco(buscas);
  
  buscas.Close;
  buscas.SQL.Text := 'select first 1 * from tempoop' +
    ' where operador = ' + IntToStr(codigoOperador) +
    ' and data = :data and status = ''FECHADO''';
  buscas.ParamByName('data').AsDate := tempData;
  buscas.Open;

  if (not buscas.IsEmpty) and (vDadosIniF.vUsarTravasOperador = 'S') then
  begin
    Application.MessageBox(pchar('Dia do Caixa já Fechado para o Operador informado!'+#13+
      'Utilize outro operador para este Caixa'), 'Atenção', 0 + 64);
    Exit;
  end;

  buscas.Close;
  buscas.SQL.Text := 'select first 1 * from tempoop' +
    ' where operador <> ' + IntToStr(codigoOperador) +
    ' and data = :data and ((status is null) or (status = ''''))';
  buscas.ParamByName('data').AsDate := tempData;
  buscas.Open;

  if (not buscas.IsEmpty) and (vDadosIniF.vUsarTravasOperador = 'S') then
  begin
    Application.MessageBox(pchar('Caixa já aberto para outro Operador de código: ' +
      buscas.FieldByName('operador').AsString+#13+
      'Para entrar com outro operador neste dia efetue o fechamento do outro operador'), 'Atenção', 0 + 64);
    Exit;
  end;

  buscas.Close;
  buscas.SQL.Text := 'select first 1 * from tempoop' +
    ' where operador = ' + IntToStr(codigoOperador) +
    ' and data < :data and ((status is null) or (status = ''''))';
  buscas.ParamByName('data').AsDate := tempData;
  buscas.Open;

  if not buscas.IsEmpty then
  begin
    buscas.Close;
    buscas.SQL.Text := 'update tempoop set status = ''FECHADO''' +
      ' where operador = ' + IntToStr(codigoOperador) +
      ' and data < :data and ((status is null) or (status = ''''))';
    buscas.ParamByName('data').AsDate := tempData;
    buscas.ExecSQL;

    CommitaTransacao;
  end;

  Result := True;
  selecionaTempoOperador(codigoOperador);
  if Insert then
  begin
    dataSet.FieldByName('operador').AsInteger := codigoOperador;
    dataSet.FieldByName('data').AsDateTime := tempData;
    dataSet.FieldByName('horaentrada').AsDateTime := Time;
    Post;
    Apply;
    CommitaTransacao;
    Result := true;
  end;
end;

function TTempoOp.registraSaidaOperador(codigoOperador: integer): boolean;
begin
  Result := True;
  selecionaTempoOperador(codigoOperador);
  if dataSet.IsEmpty then
    Exit;
  dataSet.Last;
  while not dataSet.Bof do
  begin
    if (dataSet.FieldByName('horaentrada').AsDateTime < Time) and
      (dataSet.FieldByName('horasaida').AsString = '') then
    begin
      Edit;
      dataSet.FieldByName('horasaida').AsDateTime := time;
      Post;
      Apply;
      CommitaTransacao;
      Result := true;
      exit;
    end;
    dataSet.Prior;
  end;
end;

function TTempoOp.registraTrocaOperador(codigoSaida,
  codigoEntrada: Integer): boolean;
begin
  Result := False;
  if registraSaidaOperador(codigoSaida) then
    if efetuarFechamentoDeOperador(codigoSaida,True) then
      Result := registraEntradaOperador(codigoEntrada);
end;

function TTempoOp.selecionaTempoOperador(codigoOperador: integer): boolean;
var
  data: Tdate;
begin
  data := vDadosIniF.getDataBanco(buscas);
  Result := montaSelect('select * from tempoop where operador = ' + IntToStr(codigoOperador) +
    ' and data = :data1 and data = :data2', data, data);
end;

{ TTotalVenda }

constructor TTotalVenda.create;
begin
  dataSet := TClientDataSet(dtmFiscal.cdsTotalVenda);
  transacao := TIBTransaction(dtmFiscal.transacaoFiscal);
  buscas := TIBQuery(dtmFiscal.qrBuscas);
end;

function TTotalVenda.selecionaPeriodo(dataIni, dataFim: TDate): boolean;
begin
  Result := montaSelect('select it.grupo_prod,it.cod_prod,sum(it.quantidade) soma' +
    ' from cupom2 it,cupom cp' +
    ' where it.ordem = cp.registro and it.cupom = cp.cupom and' +
    ' cp.data >= :vdat1 and cp.data <= :vdat2 and' +
    ' status_cp <> ''CANCELADO'' group by it.grupo_prod,it.cod_prod', dataIni, dataFim);
end;

{ TEmpDes }

constructor TEmpDes.create;
begin
  dataSet := TClientDataSet(dtmFiscal.cdsEmpDes);
  transacao := TIBTransaction(dtmFiscal.transacaoFiscal);
  buscas := TIBQuery(dtmFiscal.qrBuscas);
end;

function TEmpDes.selecionaEmpDesen: boolean;
begin
  Result := montaSelect('select * from empdesvolv');
end;

{ TTotalizadorNaoFiscal }

function TTotalizadorNaoFiscal.cadastraTotalizador(codigo: integer;
  descricao: string): boolean;
begin
  Result := False;
  selecionaTotalizador(codigo);
  if dataSet.IsEmpty then
  begin
    if not inherited insert then
      exit;
  end
  else if not inherited edit then
    Exit;
  dataSet.FieldByName('cod_terminal').AsString := vDadosIniF.vCodTerminal;
  dataSet.FieldByName('cod_empresa').AsString := vDadosIniF.codEmpresa;
  dataSet.FieldByName('nserieecf').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
  dataSet.FieldByName('sequencia').AsInteger := codigo;
  dataSet.FieldByName('descricao').AsString := copy(descricao, 1, 21);
  Result := inherited post;
end;

constructor TTotalizadorNaoFiscal.create;
begin
  dataSet := TClientDataSet(dtmFiscal.cdstotnaoF);
  transacao := TIBTransaction(dtmFiscal.transacaoFiscal);
  buscas := TIBQuery(dtmFiscal.qrBuscas);
end;

function TTotalizadorNaoFiscal.getTodos: boolean;
begin
  Result := montaSelect('select * from totalizador_naof where cod_terminal = ' +
    vDadosIniF.vCodTerminal +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and cod_empresa  = ' + vDadosIniF.codEmpresa);
end;

function TTotalizadorNaoFiscal.post: boolean;
begin
  if Apply then
    CommitaTransacao;
end;

function TTotalizadorNaoFiscal.selecionaTotalizador(codigo: integer): boolean;
begin
  Result := montaSelect('select * from totalizador_naof where cod_terminal = ' +
    vDadosIniF.vCodTerminal +
    ' and nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' and cod_empresa  = ' + vDadosIniF.codEmpresa + ' and sequencia = ' + IntToStr(codigo));
end;

{ TRecebimentoPrestacao }

function TRecebimentoPrestacao.abreRecebimento: boolean;
begin
  dtSetGrid.close;
  dtSetGrid.CommandText := 'select ss.valor, ss.datalanc, tn.sequencia, tn.descricao from sangsup ss'
    + ' inner join fincupom fc on fc.cod_terminal = ss.cod_terminal and fc.nserieecf = ss.nserieecf' +
    ' and fc.cupom = ss.nreg and fc.cod_empresa = ' + vDadosIniF.codEmpresa +
    ' inner join totalizador_naof tn on tn.sequencia = fc.cod_totalizador and' +
    ' tn.cod_terminal = fc.cod_terminal and tn.nserieecf = fc.nserieecf and' +
    ' tn.cod_empresa = fc.cod_empresa where ss.sangsuprimento = ''REC PREST''';
  dtSetGrid.Open;
end;

function TRecebimentoPrestacao.abreRecebimento(dataIni,
  dataFim: TDate): boolean;
begin
  dtSetGrid.close;
  dtSetGrid.CommandText := 'select ss.valor, ss.datalanc, tn.sequencia, tn.descricao from sangsup ss'
    + ' inner join fincupom fc on fc.cod_terminal = ss.cod_terminal and fc.nserieecf = ss.nserieecf' +
    ' and fc.cupom = ss.nreg and fc.cod_empresa = ' + vDadosIniF.codEmpresa +
    ' inner join totalizador_naof tn on tn.sequencia = fc.cod_totalizador and' +
    ' tn.cod_terminal = fc.cod_terminal and tn.nserieecf = fc.nserieecf and' +
    ' tn.cod_empresa = fc.cod_empresa where ss.sangsuprimento = ''REC PREST''' +
    ' and ss.datalanc >= :data1 and ss.datalanc <= :data2';
  dtSetGrid.Params[0].AsDate := dataIni;
  dtSetGrid.Params[1].AsDate := dataFim;
  dtSetGrid.Open;
end;

function TRecebimentoPrestacao.atualizaRecPrest: boolean;
begin
  //  dtSetGrid.Refresh;
  dtSetGrid.Close;
  dtSetGrid.Open;
end;

constructor TRecebimentoPrestacao.create;
begin
  vTot := TTotalizadorNaoFiscal.create;
  vSangSup := TSangSup.create;
  vFinCupom := TFinCupom.create;
  vPrestCxF := TPrestacoesCaixa.create;
  dtSetGrid := TClientDataSet(DtmFiscal.CDSPREST);
end;

destructor TRecebimentoPrestacao.Destroy;
begin
  vTot.Free;
  vSangSup.Free;
  vFinCupom.Free;
  vPrestCxF.Free;
  vTot := nil;
  vSangSup := nil;
  vFinCupom := nil;
  vPrestCxF := nil;
  //  inherited;
end;

function TRecebimentoPrestacao.iniciaRecebimento: boolean;
begin
  try
    vTot.getTodos;
    if vTot.dataSet.IsEmpty then
    begin
      vSangSup.selecionaSangriaSuprimento(Date, Date);
      vTot.getTodos;
    end;
  except
    on e: exception do begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Erro', MB_ICONERROR + mb_OK);
    end;
  end;
end;

function TRecebimentoPrestacao.insereRecebimento(gnf, finalizador: integer; valor: currency):
  boolean;
begin
  if not vSangSup.Active then
    vSangSup.selecionaSangriaSuprimento(Date, Date);
  if vSangSup.insereRecebimentoPrestacao then
  begin
    vSangSup.dataSet.FieldByName('valor').AsCurrency := valor;
    vSangSup.dataSet.FieldByName('finalizador').AsInteger := finalizador;
    if vSangSup.Post then
    begin
      vSangSup.CommitaTransacao;
      result := vFinCupom.insereFimCupom(vSangSup.dataSet.FieldByName('nreg').AsInteger,
          vSangSup.dataSet.FieldByName('coonaofiscal').AsInteger,
        vSangSup.dataSet.FieldByName('finalizador').AsInteger,
        vTot.dataSet.FieldByName('sequencia').AsInteger, gnf, 0, valor, valor, 'REC');
    end;
  end;
end;

{ TMeiosPagamento }

constructor TMeiosPagamento.create;
begin
  dataSet := TClientDataSet(dtmFiscal.cdsMeiosPag);
  transacao := TIBTransaction(dtmFiscal.transacaoFiscal);
  buscas := TIBQuery(dtmFiscal.qrBuscas);
  vDataSetMP := TClientDataSet(dtmFiscal.cdsMp);
end;

function TMeiosPagamento.getValorCancelado(finalizador: integer; dataIni,
  dataFim: TDate): Currency;
begin
  buscas.Close;
  buscas.SQL.Text :=
    'SELECT fc.finalizador,sum(fc.valor) valorCanc FROM FINCUPOM FC' +
    ' INNER JOIN CUPOM CP on cp.nserieecf = fc.nserieecf and' +
    ' cp.cod_terminal = fc.cod_terminal and cp.cod_empresa = fc.cod_empresa and' +
    ' cp.registro = fc.ordem and cp.cupom = fc.cupom AND cp.status_cp = ''CANCELADO''' +
    ' where fc.data >= :data1 and fc.data <= :data2 and fc.finalizador = :finalizador' +
    ' and fc.cod_empresa = ' + vDadosIniF.codEmpresa + ' and fc.cod_terminal = ' +
    vDadosIniF.vCodTerminal +
    ' and fc.nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' group by fc.finalizador';
  buscas.ParamByName('data1').AsDate := dataIni;
  buscas.ParamByName('data2').AsDate := dataFim;
  buscas.ParamByName('finalizador').AsInteger := finalizador;
  buscas.Open;
  if buscas.IsEmpty then
    Result := 0
  else
    Result := buscas.FieldByName('valorCanc').AsCurrency;
end;

function TMeiosPagamento.selecionaPeriodo(dataIni, dataFim: TDate): boolean;
begin
  ExecutaComandosSqlExec('delete from finalizadores where nserieecf <> ' +
    QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)));
  CommitaTransacao;
  Result := montaSelect(
    'select F.cod_finalizador,f.descricao desc_final,' +
    '     case f.tipo_finalizador' +
    '         when 0 then ''Não é TEF''' +
    '         when 1 then ''Débito''' +
    '         when 2 then ''Crédito''' +
    '         when 3 then ''Tecban''' +
    '         when 4 then ''Outros''' +
    '     end tipo_final, tn.descricao,fc.tipo_doc,' +
    ' sum(fc.valor) soma,fc.data from fincupom fc' +
    ' inner join finalizadores f on fc.finalizador = f.cod_finalizador and' +
    ' fc.cod_empresa = f.cod_empresa' +
    ' left join totalizador_naof  tn on tn.cod_terminal = fc.cod_terminal and' +
    ' tn.cod_empresa = fc.cod_empresa and tn.nserieecf = fc.nserieecf and' +
    ' tn.sequencia = fc.cod_totalizador' +
    //    ' WHERE FC.tipo_doc <> ''SAN'' AND FC.tipo_doc <> ''SUP'' and' +
    ' WHERE FC.tipo_doc <> ''SAN'' and' +
    ' fc.nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) + ' and' +
    ' fc.cod_terminal = ' + vDadosIniF.vCodTerminal + ' and' +
    ' fc.data >= :data1 and fc.data <= :data2' +
    ' group by F.cod_finalizador ,F.descricao, f.tipo_finalizador,tn.descricao,fc.tipo_doc,' +
    ' fc.data', dataIni, dataFim);
  vDataIni := dataIni;
  vDataFim := dataFim;
end;

{ TDoc_Nao_Fiscais }

constructor TDoc_Nao_Fiscais.create;
begin
  dataSet := TClientDataSet(dtmFiscal.cdsDocNaF);
  transacao := TIBTransaction(dtmFiscal.transacaoFiscal);
  buscas := TIBQuery(dtmFiscal.qrBuscas);
end;

function TDoc_Nao_Fiscais.incluiDocNaoFIscal(vdoc: RDocNaoFiscais): boolean;
begin
  try       
    buscas.Close;
    buscas.SQL.Text := 'insert into DOC_NAOFISCAL_TERMINAL ' +
      '(cod_empresa, cod_terminal, nserieecf, coo_ecf, gnf_ecf, grg_ecf, cdc_ecf, tipo_doc_ecf, data_f_emissao, hora_f_emissao, enviado_ret, ativo) ' +
      ' values ' +
      '(:cod_empresa, :cod_terminal, :nserieecf, :coo_ecf, :gnf_ecf, :grg_ecf, :cdc_ecf, :tipo_doc_ecf, :data_f_emissao, :hora_f_emissao, :enviado_ret, 1)';
    buscas.ParamByName('cod_empresa').AsString := trim(vDadosIniF.codEmpresa);
    buscas.ParamByName('cod_terminal').AsString := trim(vDadosIniF.vCodTerminal);
    buscas.ParamByName('nserieecf').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
    if trim(vdoc.coo) <> '' then
      buscas.ParamByName('coo_ecf').AsInteger := StrToIntDef(trim(vdoc.coo),0);
    if trim(vdoc.gnf) <> '' then
      buscas.ParamByName('gnf_ecf').AsInteger := StrToIntDef(trim(vdoc.gnf),0);
    if trim(vdoc.grg) <> '' then
      buscas.ParamByName('grg_ecf').AsInteger := StrToIntDef(trim(vdoc.grg),0);
    if trim(vdoc.cdc) <> '' then
      buscas.ParamByName('cdc_ecf').AsInteger := StrToIntDef(trim(vdoc.cdc),0);
    buscas.ParamByName('TIPO_DOC_ECF').AsString := trim(vdoc.tipoDoc);
    buscas.ParamByName('DATA_F_EMISSAO').AsDate := StrToDateDef(vdoc.data, Date);
    if Length(vdoc.hora) = 8 then
      buscas.ParamByName('HORA_F_EMISSAO').AsString := vdoc.hora
    else if Length(vdoc.hora) < 8 then
      buscas.ParamByName('HORA_F_EMISSAO').AsString := COPY(vdoc.hora, 1, 5);
    buscas.ParamByName('ENVIADO_RET').AsString := 'A';
    buscas.ExecSQL;
    {
    if not Active then
      montaSelect('select * from DOC_NAOFISCAL_TERMINAL where cod_terminal = 0 and nserieecf = '' '' and cod_empresa = 0' +
      ' and coo_ecf = 0');
    cancel;
    insert;
    dataSet.FieldByName('cod_empresa').AsString := trim(vDadosIniF.codEmpresa);
    dataSet.FieldByName('cod_terminal').AsString := trim(vDadosIniF.vCodTerminal);
    dataSet.FieldByName('nserieecf').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
    dataSet.FieldByName('coo_ecf').AsString := trim(vdoc.coo);
    dataSet.FieldByName('gnf_ecf').AsString := trim(vdoc.gnf);
    dataSet.FieldByName('grg_ecf').AsString := trim(vdoc.grg);
    dataSet.FieldByName('cdc_ecf').AsString := trim(vdoc.cdc);
    dataSet.FieldByName('TIPO_DOC_ECF').AsString := trim(vdoc.tipoDoc);
    dataSet.FieldByName('DATA_F_EMISSAO').AsString := vdoc.data;
    if Length(vdoc.hora) = 8 then
      dataSet.FieldByName('HORA_F_EMISSAO').AsString := vdoc.hora
    else if Length(vdoc.hora) < 8 then
      dataSet.FieldByName('HORA_F_EMISSAO').AsString := COPY(vdoc.hora, 1, 5);
    dataSet.FieldByName('ENVIADO_RET').AsString := 'A';

    dataSet.post;
    Apply;
    }
    CommitaTransacao;
    IniciaTransacao;
  except
    Result := false;
  end;
end;

{ TMapaResumo }

function TMapaResumo.abreMapaResumo(cooRed: integer): boolean;
begin
  FCOORed := cooRed;
  Result := montaSelect('SELECT * FROM MAPA_RESUMO_ALIQ WHERE COD_TERMINAL = ' +
    vDadosIniF.vCodTerminal + ' AND COD_EMPRESA = ' + vDadosIniF.codEmpresa + ' AND NSERIEECF = ' +
    QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) +
    ' AND COORED = ' + IntToStr(cooRed) + ' ORDER BY DESCALIQ');
end;

constructor TMapaResumo.create;
begin
  dataSet := TClientDataSet(DtmFiscal.cdsMapaRes);
  transacao := TIBTransaction(DtmFiscal.transacaoFiscal);
end;

function TMapaResumo.getTodos: boolean;
begin
  Result := montaSelect('SELECT * FROM MAPA_RESUMO_ALIQ WHERE COD_TERMINAL = ' +
    vDadosIniF.vCodTerminal + ' AND COD_EMPRESA = ' + vDadosIniF.codEmpresa + ' AND NSERIEECF = ' +
    QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)));
end;

function TMapaResumo.gravaMapaResumo(coored: integer; aliq_seq,
  descaliq: string; valoraliq: Currency): boolean;
begin
  try
    Result := true;
    if trim(descaliq) = '' then
      exit;
    if valoraliq = 0 then
      Exit;
    montaSelect('SELECT * FROM MAPA_RESUMO_ALIQ WHERE COD_TERMINAL = ' + vDadosIniF.vCodTerminal +
      ' AND COD_EMPRESA = ' + vDadosIniF.codEmpresa + ' AND NSERIEECF = ' +
      QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)) + ' AND COORED = ' +
      IntToStr(coored) + ' and aliq_seq = ' + aliq_seq);
    if not dataSet.IsEmpty then
      Edit
    else
      dataset.Insert;

    dataSet.FieldByName('cod_terminal').AsString := vDadosIniF.vCodTerminal;
    dataSet.FieldByName('nserieecf').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
    dataSet.FieldByName('cod_empresa').AsString := vDadosIniF.codEmpresa;
    dataSet.FieldByName('COORED').AsInteger := coored;
    dataSet.FieldByName('ALIQ_SEQ').AsString := aliq_seq;
    dataSet.FieldByName('DESCALIQ').AsString := descaliq;
    dataSet.FieldByName('VALORALIQ').AsCurrency := valoraliq;
    if inherited post then
    begin
      Apply;
      CommitaTransacao;
    end;
  except
    on e: exception do
    begin
      Result := false;
      MessageDlg('Erro ao gravar mapa de resumo. Erro: ' + e.Message, mtInformation, [mbOK], 0);
    end;

  end;
end;

function TMapaResumo.insert: boolean;
var
  vTemo: boolean;
begin
  FaliqSeq := 0;
  while True do
  begin
    inc(FaliqSeq);
    vTemo := False;
    dataSet.First;
    while not dataSet.Eof do
    begin
      if IntToStr(FaliqSeq) = Trim(dataSet.FieldByName('aliq_seq').AsString) then
      begin
        vTemo := True;
        Break;
      end;
      dataSet.Next;
    end;
    if not vTemo then
      Break;
  end;
  Result := inherited insert;
end;

function TMapaResumo.post: boolean;
begin
  try
    Result := false;
    if not (dataSet.State in [dsEdit, dsInsert]) then
    begin
      Result := true;
      exit;
    end;
    if dataSet.FieldByName('VALORALIQ').AsFloat <= 0 then
      raise Exception.Create('Valor do Totalizador deve ser maior que 0');
    if dataSet.FieldByName('DESCALIQ').AsString = '' then
      raise Exception.Create('Totalizador deve ser informado');

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('cod_terminal').AsString := vDadosIniF.vCodTerminal;
      dataSet.FieldByName('nserieecf').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
      dataSet.FieldByName('cod_empresa').AsString := vDadosIniF.codEmpresa;
      dataSet.FieldByName('COORED').AsInteger := FCOORed;
      if (copy(dataSet.FieldByName('DESCALIQ').AsString, 3, 1) = 'T') or
        (copy(dataSet.FieldByName('DESCALIQ').AsString, 3, 1) = 'S') then
        dataSet.FieldByName('ALIQ_SEQ').AsString :=
          copy(dataSet.FieldByName('DESCALIQ').AsString, 1, 2)
      else
        dataSet.FieldByName('ALIQ_SEQ').AsString := IntToStr(FaliqSeq);
    end;
    dataSet.post;
    Result := true;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', 0 + 64);
    end;
  end;
end;

{ TComunic }

function TComunic.iniciaFiscalSegundoPlano: boolean;
begin
  //Instanciando DTM usados no Fiscal
  TSingleton(vDadosIniF) := TIni.GetInstance;
  vDadosIniF.vModoSistema := 'J';
  if frmPrincipalFiscal = nil then
    Application.CreateForm(TfrmPrincipalFiscal, frmPrincipalFiscal);
  frmPrincipalFiscal.Show;
  //  if frmPrincipalFiscal.iniciaFiscalSegundoPlano then
  //  begin
  //    frmPrincipalFiscal.Show;
  //    frmPrincipalFiscal.Visible := false;
  //    vDadosIniF.vFiscalAtivo := 'S';
  //  end;

  if vDadosIniF.vFiscalAtivo = 'N' then
  begin
    frmPrincipalFiscal.Free;
    frmPrincipalFiscal := nil;
  end;
end;

function TComunic.receberPrestacaoDoRetaguarda(nCred: integer): boolean;
begin
  try
    Result := False;
    if frmPrincipalFiscal <> nil then
      result := frmPrincipalFiscal.receberPrestacaoDoRetaguarda(nCred);
  except
    frmPrincipalFiscal.Visible := false;
  end;
end;

function TComunic.receberVendaDoRetaguarda(nPed: integer;
  TipoVenda: string): boolean;
begin
  try
    if frmPrincipalFiscal = nil then
      Application.CreateForm(TfrmPrincipalFiscal, frmPrincipalFiscal);
    frmPrincipalFiscal.Show;
    frmPrincipalFiscal.Visible := true;
    frmPrincipalFiscal.Refresh;
    result := frmPrincipalFiscal.receberVendaDoRetaguarda(nPed, TipoVenda);
  except
    frmPrincipalFiscal.Visible := false;
  end;
end;

function TComunic.receberVendaDoRetaguardaPelaDll(nPed: integer;
  TipoVenda: string): boolean;
begin
  try
    if frmPrincipalFiscal <> nil then
      result := frmPrincipalFiscal.receberVendaDoRetaguarda(nPed, TipoVenda);
  except
    frmPrincipalFiscal.Hide;
    frmPrincipalFiscal.Visible := false;
    frmPrincipalFiscal.Refresh;
  end;
end;

procedure TComunic.showFiscal;
begin
  TSingleton(vDadosIniF) := TIni.GetInstance;
  vDadosIniF.vModoSistema := 'J';
  if frmPrincipalFiscal = nil then
  begin
    Application.CreateForm(TfrmPrincipalFiscal, frmPrincipalFiscal);
    frmPrincipalFiscal.ShowModal;
  end
  else
  begin
    frmPrincipalFiscal.Free;
    Application.CreateForm(TfrmPrincipalFiscal, frmPrincipalFiscal);
    frmPrincipalFiscal.ShowModal;
  end;

  if vDadosIniF.vFiscalAtivo = 'N' then
  begin
    frmPrincipalFiscal.Free;
    frmPrincipalFiscal := nil;
  end;
end;

{ TIdentFiscal }

function TIdentFiscal.abreIdentFiscal(vMontarAnexoX:boolean): boolean;
begin
  Result := montaSelect(
    'select fv.n_laudo_fiscal, ed.nome_empdes, ed.cnpj_empdes, ed.endereco_empdes,' +
    ' ed.bairro_empdes,  ed.cidade_empdes ,ed.fone_empdes, ed.contato_empdes,' +
    ' fv.nome_paf, ''Sistema Fiscal'' NOME_COMERCIAL, fv.versao_paf,' +
    ' fv.principal_exec, fv.md5_paf,af.nome_arquivo,af.md5_arquivo,ed.uf_empdes,' +
    ' fv.ER_PAF_ECF from empdesvolv ed' +
    ' inner join fiscal_versoes fv on fv.cod_empdes = ed.cod_empdes' +
    ' inner join terminalf t on t.cod_fiscal = fv.cod_fiscal' +
    ' left join arquivos_fiscal af on af.cod_fiscal = fv.cod_fiscal' +
    ' where t.cod_terminal = '+vDadosIniF.vCodTerminal +
    ' and t.cod_empresa = '+vDadosIniF.codEmpresa);
  sNomeSHouse := getNomeSHouseTEF;
  vDadosIniF.vVersaoFiscal := dataSet.FieldByName('versao_paf').AsString;
  if Trim(vDadosIniF.vVersaoFiscal) = '' then
    vDadosIniF.vVersaoFiscal := '4.1';
  if vDadosIniF.vVersaoFiscal = '4.0' then
    vDadosIniF.vMD5Fiscal := dataSet.FieldByName('md5_paf').AsString
  else if vMontarAnexoX then
    montarAnexoX;
  vDadosIniF.vNumeroLaudoPAFECF := dataSet.FieldByName('N_LAUDO_FISCAL').AsString;

  lerDadosArquivoCriptogravado;
  
end;

constructor TIdentFiscal.create;
begin
  dataSet := TClientDataSet(DtmFiscal.cdsIdentFiscal);
  buscas := TIBQuery(DtmFiscal.qrBuscas);
end;

function TIdentFiscal.getNomeSHouseTEF: string;
begin
  Result := dataSet.FieldByName('nome_empdes').AsString;
  Result := Copy(StringReplace(Result, ' ', '',[rfReplaceAll]), 1, 8);
end;

procedure TIdentFiscal.lerDadosArquivoCriptogravado;
var
  arquivo: TIniFile;
  ArqIni: string;
begin
  ArqIni := ExtractFilePath(Application.Exename) + 'nserie.hw';
  try
    arquivo := TIniFile.Create(ArqIni);
    cCNPJ := vDadosIniF.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'CNPJ', ''));
    cIE := vDadosIniF.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'IE', ''));
    cIE := vDadosIniF.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'IM', ''));
    cNOMEEMPRESA := vDadosIniF.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'NOMEEMPRESA', ''));
    cNOMEPAF := vDadosIniF.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'NOMEPAF', ''));
    cVERSAO := vDadosIniF.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'VERSAO', ''));
    cMD5LISTA := vDadosIniF.decodifica(arquivo.ReadString('Empresa Desenvolvedora', 'MD5LISTA', ''));
  finally
    arquivo.free;
  end;
end;

procedure TIdentFiscal.montaImpressaoIdentificacaoPAFECF;
var
  vLista: TStringList;
  I: Integer;
  vTemp, vVersaoERPAFECF: string;
  arquivo: TIniFile;
  ArqIni: string;
  vNumECF: string;
begin
  CImpressoraF.abrerelatorioGer;
  CImpressoraF.RelatorioGerencial2(
    CImpressoraF.TamDescricao(48,'             IDENTIFICAÇÃO DO PAF-ECF')+
    vDadosIniF.Replicate('=', 48));

  abreIdentFiscal(False);

  CImpressoraF.RelatorioGerencial2(
    CImpressoraF.TamDescricao(48, 'Laudo Numero: ' + dataSet.FieldByName('n_laudo_fiscal').AsString) +
    vDadosIniF.Replicate('-', 48)+
    CImpressoraF.TamDescricao(48, 'Identificação Empresa Desenvolvedora') +
    CImpressoraF.TamDescricao(48, 'CNPJ: ' + dataSet.FieldByName('cnpj_empdes').AsString) +
    CImpressoraF.TamDescricao(48, 'Razão Social: ' + dataSet.FieldByName('nome_empdes').AsString) +
    CImpressoraF.TamDescricao(48, 'Endereço: ' + dataSet.FieldByName('endereco_empdes').AsString) +
    CImpressoraF.TamDescricao(48, 'Bairro: ' + dataSet.FieldByName('bairro_empdes').AsString) +
    CImpressoraF.TamDescricao(48, 'Cidade: ' + dataSet.FieldByName('cidade_empdes').AsString +
    ' UF: ' + dataSet.FieldByName('uf_empdes').AsString) +
    CImpressoraF.TamDescricao(48, 'Telefone: ' + dataSet.FieldByName('fone_empdes').AsString) +
    CImpressoraF.TamDescricao(48, 'Contato: ' + dataSet.FieldByName('contato_empdes').AsString)) ;
  CImpressoraF.RelatorioGerencial2(
    vDadosIniF.Replicate('-', 48)+
    CImpressoraF.TamDescricao(48, 'Identificação PAF-ECF') +
    CImpressoraF.TamDescricao(48, 'Nome Comercial: ' + dataSet.FieldByName('nome_paf').AsString)+
    CImpressoraF.TamDescricao(48, 'Versão do PAF-ECF: ' + dataSet.FieldByName('versao_paf').AsString) +
    CImpressoraF.TamDescricao(48, 'Principal Executavel: ' + UpperCase( ExtractFileName(Application.ExeName) ) ) +
    CImpressoraF.TamDescricao(48, 'MD5: ' + UpperCase( vDadosIniF.md5Arquivo( Application.ExeName ) ) ) );
    //dataSet.FieldByName('principal_exec').AsString));

  vTemp := CImpressoraF.TamDescricao(48, 'Demais arquivos e MD5');
  CImpressoraF.RelatorioGerencial2(vTemp);
  vLista := TStringList.Create;
  vLista.Clear;
  vLista.LoadFromFile(ExtractFilePath(Application.ExeName)+'MD5.txt');
  for I := 0 to vLista.Count - 1 do
    if Copy(vLista[i],1,2) = 'N3' then
      if UpperCase(Trim(Copy(vLista[i],3,50))) <>
        UpperCase(Trim(dataSet.FieldByName('principal_exec').AsString)) then
        begin
          vTemp := UpperCase(Trim(Copy(vLista[i],3,50)));
            CImpressoraF.RelatorioGerencial2(
            CImpressoraF.TamDescricao(48, 'Executavel: '+ vTemp));
          vTemp := UpperCase(Trim(Copy(vLista[i],53,32)));
            CImpressoraF.RelatorioGerencial2(CImpressoraF.TamDescricao(48, 'MD5: '+vTemp));
        end;
  vTemp := CImpressoraF.TamDescricao(48, 'Arquivo Texto: MD5.txt')+
    CImpressoraF.TamDescricao(48, 'MD5: '+vDadosIniF.vMD5Fiscal);
  vVersaoERPAFECF := copy(dataSet.FieldByName('ER_PAF_ECF').AsString,1,2) + '.'+
    copy(dataSet.FieldByName('ER_PAF_ECF').AsString,3,2);

  vTemp := vTemp + CImpressoraF.TamDescricao(48, 'Versão da ER PAF-ECF: '+
    vVersaoERPAFECF);

  CImpressoraF.RelatorioGerencial2(vTemp);

  CImpressoraF.RelatorioGerencial2(
    vDadosIniF.Replicate('-', 48));
  CImpressoraF.RelatorioGerencial2(CImpressoraF.TamDescricao(48, 'ECF''s Autorizados'));

  ArqIni := ExtractFilePath(Application.Exename) + 'nserie.hw';
  arquivo := TIniFile.Create(ArqIni);
  try
    for I := 1 to 99 do
    begin
      vNumECF := arquivo.ReadString(IntToStr(I) , 'N', '');
      if Trim(vNumECF) <> '' then
        CImpressoraF.RelatorioGerencial2(CImpressoraF.TamDescricao(48, vDadosIniF.decodifica(vNumECF)));
    end;
  finally
    arquivo.free;
  end;

  CImpressoraF.FechaRelatorioGerencial;

end;

procedure TIdentFiscal.montarAnexoX;
var
  Arquivo: TextFile;
  vCodFiscal, vContador: Integer;
  vNomeArquivo : string;
  ArquivoIni: TIniFile;
begin
  try
    buscas.Close;
    buscas.SQL.Text := 'select * from EMPDESVOLV';
    buscas.Open;
    vNomeArquivo := ExtractFilePath(Application.ExeName)+'MD5.txt';

    AssignFile(Arquivo, vNomeArquivo);
    try
      Rewrite(Arquivo);
      vDadosIniF.AuxStr := vDadosIniF.Space(94);
      vDadosIniF.MontaLinha(01,'N1');
      vDadosIniF.MontaLinha(03, vDadosIniF.StrZero(Trim(buscas.FieldByName('CNPJ_EMPDES').AsString),14));
      vDadosIniF.MontaLinha(17,buscas.FieldByName('IE_EMPDES').AsString);
      vDadosIniF.MontaLinha(31, vDadosIniF.StringReplace2(
        copy(buscas.FieldByName('IM_EMPDES').AsString, 1, 14),
        '/\-_;:.,+=|', '           ', True));
      vDadosIniF.MontaLinha(45, UpperCase(buscas.FieldByName('NOME_EMPDES').AsString));
      WriteLn(Arquivo, vDadosIniF.auxstr);
      vDadosIniF.LimpaLinha(vDadosIniF.AuxStr);

      buscas.Close;
      buscas.SQL.Text := 'select * from FISCAL_VERSOES'+
        ' where VERSAO_PAF = '+QuotedStr(vDadosIniF.vVersaoFiscal);
      buscas.Open;

      vCodFiscal := buscas.FieldByName('COD_FISCAL').AsInteger;

      vDadosIniF.AuxStr := vDadosIniF.Space(72);
      vDadosIniF.MontaLinha(01,'N2');
      vDadosIniF.MontaLinha(03, copy(Trim(buscas.FieldByName('N_LAUDO_FISCAL').AsString),1,10));
      vDadosIniF.MontaLinha(13, UpperCase(buscas.FieldByName('NOME_PAF').AsString));
      vDadosIniF.MontaLinha(63, UpperCase(buscas.FieldByName('VERSAO_PAF').AsString));
      WriteLn(Arquivo, vDadosIniF.auxstr);
      vDadosIniF.LimpaLinha(vDadosIniF.AuxStr);

      vDadosIniF.AuxStr := vDadosIniF.Space(84);
      vDadosIniF.MontaLinha(01,'N3');
      vDadosIniF.MontaLinha(03, UpperCase(ExtractFileName(Application.ExeName)));
      vDadosIniF.MontaLinha(53, UpperCase(vDadosIniF.md5Arquivo(
        Application.ExeName)));
      WriteLn(Arquivo, vDadosIniF.auxstr);
      vDadosIniF.LimpaLinha(vDadosIniF.AuxStr);

      buscas.Close;
      buscas.SQL.Text := 'select * from ARQUIVOS_FISCAL'+
        ' where COD_FISCAL = '+IntToStr(vCodFiscal);
      buscas.Open;

      vContador := 1;
      buscas.First;
      while not buscas.Eof do
      begin

        vDadosIniF.AuxStr := vDadosIniF.Space(84);
        vDadosIniF.MontaLinha(01,'N3');
        vDadosIniF.MontaLinha(03, UpperCase(buscas.FieldByName('NOME_ARQUIVO').AsString));
        vDadosIniF.MontaLinha(53, UpperCase(vDadosIniF.md5Arquivo(
          ExtractFilePath(Application.ExeName) +
            Trim(buscas.FieldByName('NOME_ARQUIVO').AsString))));
        WriteLn(Arquivo, vDadosIniF.auxstr);
        vDadosIniF.LimpaLinha(vDadosIniF.AuxStr);

        vContador := vContador + 1;

        buscas.Next;
      end;

      buscas.Close;
      buscas.SQL.Text := 'select * from EMPDESVOLV';
      buscas.Open;

      vDadosIniF.AuxStr := vDadosIniF.Space(36);
      vDadosIniF.MontaLinha(01,'N9');
      vDadosIniF.MontaLinha(03, vDadosIniF.StrZero(Trim(buscas.FieldByName('CNPJ_EMPDES').AsString),14));
      vDadosIniF.MontaLinha(17,buscas.FieldByName('IE_EMPDES').AsString);
      vDadosIniF.MontaLinha(31, vDadosIniF.StrZero(IntToStr(vContador),6) );
      WriteLn(Arquivo, vDadosIniF.auxstr);
      vDadosIniF.LimpaLinha(vDadosIniF.AuxStr);

      buscas.Close;
    finally
      CloseFile(Arquivo);
    end;
    vDadosIniF.gerarMD5ArquivoEletronico(vNomeArquivo);
    vDadosIniF.vMD5Fiscal := UpperCase(vDadosIniF.md5Arquivo(vNomeArquivo));

    if FileExists(ExtractFilePath(Application.Exename) + 'nserie.hw') then
    begin

      ArquivoIni := TIniFile.Create(ExtractFilePath(Application.Exename) + 'nserie.hw');
      try
        ArquivoIni.WriteString(Trim(vDadosIniF.vCodTerminal), 'MD5', vDadosIniF.codifica(vDadosIniF.vMD5Fiscal));
      finally
        ArquivoIni.free;
      end;

    end;

  except
  end;
end;

{ TTerminal_Impressoras }

function TTerminal_Impressoras.abreTerminalImpressoras: boolean;
begin
  Result := montaSelect('SELECT ti.ident_cniee,ti.num_serie_ecf, tf.end_terminal' +
    ' FROM terminal_impressoras ti INNER JOIN terminalf tf ON' +
    ' tf.cod_terminal = ti.cod_terminal AND tf.cod_empresa = ti.cod_empresa' +
    ' WHERE ti.cod_empresa = ' + vDadosIniF.codEmpresa);
end;

function TTerminal_Impressoras.abreTerminalImpressoras(
  numSeroeEcf: string): boolean;
begin
  Result := montaSelect('SELECT ti.ident_cniee,ti.num_serie_ecf, tf.end_terminal' +
    ' FROM terminal_impressoras ti INNER JOIN terminalf tf ON' +
    ' tf.cod_terminal = ti.cod_terminal AND tf.cod_empresa = ti.cod_empresa' +
    ' WHERE ti.cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and ti.num_serie_ecf = ' + QuotedStr(vDadosIniF.codifica(numSeroeEcf)));
end;

function TTerminal_Impressoras.atualizaVariaveisEstoque(buscas: TIBQuery): boolean;
begin

//  if not buscas.Transaction.InTransaction then
//    buscas.Transaction.StartTransaction;
//
//  buscas.close;
//  buscas.SQL.Text := 'update terminal_impressoras' +
//    ' set data_alt_est_ecf = (select result from strzero(extract(day from current_date),2))||''/''||' +
//    ' (select result from strzero(extract(month from current_date),2))||''/''||' +
//    ' (select result from strzero(extract(year from current_date),4)),' +
//    ' hora_alt_est_ecf = (select result from strzero(extract(hour from current_time),2))||'':''||' +
//    ' (select result from strzero(extract(minute from current_time),2))||'':''||' +
//    ' (select result from strzero(extract(second from current_time),2))' +
//    ' where ident_cniee = ' +QuotedStr(vDadosIniF.vCodCNIEE) +
//    ' and cod_terminal = ' + vDadosIniF.vCodTerminal +
//    ' and num_serie_ecf = ' + QuotedStr(vDadosIniF.vNumSerieEcf) +
//    ' and atual = ''S''' +
//    ' and cod_empresa = ' + vDadosIniF.codEmpresa;
//  buscas.ExecSQL;
//
//  if buscas.Transaction.InTransaction then
//    buscas.Transaction.Commit;
//
//  vMD5Func._gravaMD5_TerminalImpressoras(buscas, StrToInt(vDadosIniF.vCodTerminal), vDadosIniF.vCodCNIEE, vDadosIniF.vNumSerieEcf);
end;

constructor TTerminal_Impressoras.create;
begin
  dataSet := TClientDataSet(DtmFiscal.cdsTermImp);
  buscas := TIBQuery(DtmFiscal.qrBuscas);
end;

{ TPrestacoesCaixa }

function TPrestacoesCaixa.abrePrestacoes(dataIni, dataFim: TDate): boolean;
begin
  Result := montaSelect('select pf.* from prestacoes_fiscal pf' +
    ' where pf.data_venc_c >= :dataIni and pf.data_venc_c <= :dataFim' +
    ' and pf.cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and pf.cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and pf.nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)),
    dataIni, dataFim);
end;

function TPrestacoesCaixa.abrePrestacoes(cod_cred: integer): boolean;
begin
  Result := montaSelect('select pf.* from prestacoes_fiscal pf' +
    ' where pf.cod_cred = ' + IntToStr(cod_cred) +
    ' and pf.cod_terminal = ' + vDadosIniF.vCodTerminal +
    ' and pf.cod_empresa = ' + vDadosIniF.codEmpresa +
    ' and pf.nserieecf = ' + QuotedStr(vDadosIniF.codifica(vDadosIniF.vNumSerieEcf)));
end;

function TPrestacoesCaixa.confirmaRecebimento(totalizador, finalizador,
  coo: integer): boolean;
begin
  if dataSet.IsEmpty then
  begin
    Result := false;
    exit;
  end;
  dataSet.Edit;
  dataSet.FieldByName('totalizador').AsInteger := totalizador;
  dataSet.FieldByName('finalizador').AsInteger := finalizador;
  dataSet.FieldByName('coo_documento').AsInteger := coo;
  dataSet.FieldByName('status').AsString := 'RECEBIDA';
  dataSet.Post;
  Apply;
  CommitaTransacao;
  Result := true;
end;

constructor TPrestacoesCaixa.create;
begin
  dataSet := TClientDataSet(DtmFiscal.cdsPrestCx);
  transacao := TIBTransaction(dtmFiscal.transacaoFiscal);
  vPrestRet := TPrestacoes_CX.create;
end;

destructor TPrestacoesCaixa.destroy;
begin
  vPrestRet.Free;
  vPrestRet := nil;
  inherited;
end;

function TPrestacoesCaixa.iniciaRecebimentoDePrestacao(
  dtSet: TClientDataSet): boolean;
var
  i: Integer;
begin
  try
    Result := true;
    if dtSet.IsEmpty then
      raise exception.create('Prestação não encontrada');
    if dtSet.FieldByName('cod_terminal').AsString <> vDadosIniF.vCodTerminal then
    begin
      if dtSet.FieldByName('status').AsString <> 'ABERTA' then
        raise exception.create('Prestação está ou ja foi recebida por outro terminal');
    end
    else if dtSet.FieldByName('status').AsString = 'RECEBIDA' then
      raise exception.create('Prestação está ou ja foi recebida por outro terminal');
    abrePrestacoes(dtSet.FieldByName('cod_cred').AsInteger);
    if dataSet.IsEmpty then
    begin
      dataSet.Insert;
      for i := 0 to dtSet.FieldCount - 1 do
        dataSet.FieldByName(dtSet.Fields[i].FieldName).Value :=
          dtSet.FieldByName(dtSet.Fields[i].FieldName).Value;
      dataSet.FieldByName('cod_empresa').AsString := vDadosIniF.codEmpresa;
      dataSet.FieldByName('cod_terminal').AsString := vDadosIniF.vCodTerminal;
      dataSet.FieldByName('nserieecf').AsString := vDadosIniF.codifica(vDadosIniF.vNumSerieEcf);
      dataSet.Post;
      Apply;
    end
    else if dtSet.FieldByName('status').AsString = 'RECEBIDA' then
      raise exception.create('Prestação ja foi recebida');
		Result := true;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Antenção', mb_ok + MB_ICONINFORMATION);
    end;
	end;

end;

{ TMovimento_Operador }

function TMovimento_Operador.abreTodos: Boolean;
begin
	buscas.Close;
	buscas.SQL.Text := 'select nmov "N Mov", operador "Operador", dia_abertura "Dia Abertura", dia_fechamento "Dia Fechamento", SALDO_DIN_ABERT "Saldo Inicial Dinheiro" from MOV_OPERADOR' +
		' where cod_empresa = ' + vDadosIniF.codEmpresa;
	buscas.Open;
	TFloatField(buscas.FieldByName('Saldo Inicial Dinheiro')).DisplayFormat := '##0.00';
end;

function TMovimento_Operador.abrirMovimento(pCodOperador: Integer): Boolean;
var
	vdata: TDateTime;
	vSaldoIni: Extended;
	vMaxMov: Integer;
begin
	Result := False;
	if movimentoAberto then
		Exit;

	try
		vdata := vDadosIniF.vdataGeral + Time;
	except
		vdata := Now;
		vDadosIniF.vdataGeral := Date;
	end;

	buscas.Close;
	buscas.SQL.Text := 'select max(nmov) vmaxmov from mov_operador where cod_empresa = ' + vDadosIniF.codEmpresa;
	buscas.Open;
	vMaxMov := buscas.FieldByName('vmaxmov').AsInteger;

	buscas.Close;
	buscas.SQL.Text := 'select sum( case when f.tipo_doc = ''SAN'' then -1 else 1 end * f.valor) valor from fincupom f' +
		' where f.nmov = ' + IntToStr(vMaxMov) +
		' and coalesce(f.status_fc, '''') <> ''CANCELADO''' +
		' and f.finalizador = 1';
	buscas.Open;

	vSaldoIni := 0;
	if buscas.FieldByName('valor').AsFloat > 0 then
		if Application.MessageBox(PChar('Deseja adicionar saldo em Dinheiro do Movimento Anterior?' + #13 +
			'Saldo: ' + Format('%0.2n', [buscas.FieldByName('valor').AsFloat]) ),
			'Anteção - Saldo em Dinheiro', MB_ICONQUESTION + MB_YESNO) = IDYES then
				vSaldoIni := buscas.FieldByName('valor').AsFloat;

  buscas.Close;
	buscas.SQL.Text := 'insert into mov_operador (nmov, cod_empresa, dia_abertura, operador, saldo_din_abert)' +
		' values (' + IntToStr(vMaxMov) + ' + 1, ' + vDadosIniF.codEmpresa + ', ' +
		' :dia_abertura, ' + IntToStr(pCodOperador) + ', :saldo_din_abert)';
	buscas.ParamByName('dia_abertura').AsDateTime := vdata;
	buscas.ParamByName('saldo_din_abert').AsFloat := vSaldoIni;
	buscas.ExecSQL;

	if buscas.Transaction.InTransaction then
		buscas.Transaction.Commit;

	Result := movimentoAberto;

end;

constructor TMovimento_Operador.create;
begin
  buscas := TIBQuery(DtmFiscal.qrBuscas);
end;

function TMovimento_Operador.fecharMovimento(pCodOperador: Integer): Boolean;
var
	vdata: TDate;
begin
	Result := False;

	if not movimentoAberto then
		Exit;

	if fOperador <> vDadosIniF.vCodUsuario then
		Exit;

	try
		vdata := vDadosIniF.vdataGeral + Time;
	except
		vdata := Now;
		vDadosIniF.vdataGeral := Date;
	end;

	buscas.Close;
	buscas.SQL.Text := 'update mov_operador set dia_fechamento = :dia_fechamento' +
		' where nmov = ' + IntToStr(fNumMovimento) +
		' and cod_empresa = ' + vDadosIniF.codEmpresa;
	buscas.ParamByName('dia_fechamento').AsDateTime := vdata;
	buscas.ExecSQL;

	if buscas.Transaction.InTransaction then
		buscas.Transaction.Commit;

	Result := movimentoAberto;
end;

function TMovimento_Operador.movimentoAberto: Boolean;
begin
	buscas.Close;
	buscas.SQL.Text := 'select first 1 nmov, dia_abertura, operador from mov_operador' +
		' where cod_empresa =  ' + vDadosIniF.codEmpresa +
		' and dia_fechamento is null' +
		' order by dia_abertura desc, nmov desc';
	buscas.Open;

	fNumMovimento := buscas.FieldByName('nmov').AsInteger;
	fDiaAberto := buscas.FieldByName('dia_abertura').AsDateTime;
	fOperador := buscas.FieldByName('operador').AsInteger;

	Result := fNumMovimento > 0;
end;

function TMovimento_Operador.movimentoFechado: Boolean;
begin
	buscas.Close;
	buscas.SQL.Text := 'select first 1 nmov, dia_abertura, dia_fechamento, operador from mov_operador' +
		' where cod_empresa =  ' + vDadosIniF.codEmpresa +
		' and not dia_fechamento is null' +
		' and operador = ' + IntToStr(vDadosIniF.vCodUsuario) +
		' order by dia_abertura desc, nmov desc';
	buscas.Open;

	fNumMovimento := buscas.FieldByName('nmov').AsInteger;
	fDiaAberto := buscas.FieldByName('dia_abertura').AsDateTime;
	fDiaFechado := buscas.FieldByName('dia_fechamento').AsDateTime;
	fOperador := buscas.FieldByName('operador').AsInteger;

	Result := fNumMovimento > 0;
end;

function TMovimento_Operador.relatorioDeMovimento(var vListRel: TStringList;
	pFechamentoOperador: Boolean; pNumMov: Integer): Boolean;
var
	vCodOp: Integer;
	vNumMovs, vStsMov, vTemp, vDiaAbMov, vDiaFcMov, vNomeCol: string;
	vSoma, vSomaVND, vSomaSAN, vSomaSUP, vSaldoIni, vSaldoCaixaDinheiro: Extended;
	vSomaQtde: Integer;
	buscasRet: TIBQuery;
	vDAVF: TDAVF;
	vGrupo: Integer;
begin

	vStsMov := '';
	vCodOp := 0;
	vNomeCol := '';
	vDiaAbMov := '';
	vDiaFcMov := '';
	Result := False;
	buscasRet := TIBQuery(vDAVF.getQueryRetaguarda(True));
	if not pFechamentoOperador then
	begin

//		if not InputQuery( 'Número Movimento', 'Informe o número do movimento', vTemp) then
//			Exit;

		vNumMovs := IntToStr(pNumMov);//vTemp;
		if StrToIntDef(vNumMovs, 0) = 0 then
			Exit;

		buscas.Close;
		buscas.SQL.Text := 'select * from mov_operador ' +
			' where nmov = ' + vNumMovs +
			' and cod_empresa =  ' + vDadosIniF.codEmpresa;
		buscas.Open;
		if buscas.FieldByName('dia_fechamento').AsString <> '' then
			vStsMov := 'FECHADO'
		else
			vStsMov := 'ABERTO';
		if buscas.FieldByName('dia_abertura').AsString <> '' then
			vDiaAbMov := FormatDateTime('dd/mm/yyyy hh:mm', buscas.FieldByName('dia_abertura').AsDateTime);
		if buscas.FieldByName('dia_fechamento').AsString <> '' then
			vDiaFcMov := FormatDateTime('dd/mm/yyyy hh:mm', buscas.FieldByName('dia_fechamento').AsDateTime);

		vCodOp := buscas.FieldByName('operador').AsInteger;

		if buscasRet <> nil then
		begin
			buscasRet.Close;
			buscasRet.SQL.Text := 'select nome_vendedor from colaborador' +
				' where cod_vendedor =  ' + IntToStr(vCodOp) +
				' and cod_empresa =  ' + vDadosIniF.codEmpresa;
			buscasRet.Open;
			vNomeCol := Trim(buscasRet.FieldByName('nome_vendedor').AsString);
		end;
	end
	else
	begin
		movimentoFechado;
		vCodOp := vDadosIniF.vCodUsuario;
		vNumMovs := IntToStr(fNumMovimento);
		vNomeCol := vDadosIniF.vNomeFuncionario;
		if fDiaAberto > 0 then
			vDiaAbMov := FormatDateTime('dd/mm/yyyy hh:mm', fDiaAberto);
		if fDiaFechado > 0 then
			vDiaFcMov := FormatDateTime('dd/mm/yyyy hh:mm', fDiaFechado);
	end;
  Result := True;

	vListRel.Clear;                             
	if pFechamentoOperador then
		vListRel.Add( CImpressoraF.centralizaDescricao( CImpressoraF.QtdeColunasImpressao, 'FECHAMENTO DO OPERADOR'))
	else if vStsMov <> '' then
		vListRel.Add( CImpressoraF.centralizaDescricao( CImpressoraF.QtdeColunasImpressao, 'RELATORIO DE MOVIMENTO - ' + vStsMov ))
	else
		vListRel.Add( CImpressoraF.centralizaDescricao( CImpressoraF.QtdeColunasImpressao, 'RELATORIO DE MOVIMENTO'));
	vListRel.Add(vDadosIniF.Replicate('=', 48));
	vListRel.Add(CImpressoraF.TamDescricao( CImpressoraF.QtdeColunasImpressao, 'CAIXA/PDV........: ' + vDadosIniF.StrZeroDec(obConfImp.dataSet.FieldByName('COD_TERMINAL').AsInteger, 4, 0)));
	if vCodOp > 0 then
		vListRel.Add(CImpressoraF.TamDescricao( CImpressoraF.QtdeColunasImpressao, 'OPERADOR.........: ' + vDadosIniF.StrZero(vCodOp, 4) + ' - ' + Trim(vNomeCol)));
	vListRel.Add(CImpressoraF.TamDescricao( CImpressoraF.QtdeColunasImpressao,   'NUMERO MOVIMENTO.: ' + vDadosIniF.StrZero(vNumMovs, 4)));

	vListRel.Add(CImpressoraF.TamDescricao( CImpressoraF.QtdeColunasImpressao, 'DATA ABERTURA....: ' + vDiaAbMov ));
	vListRel.Add(CImpressoraF.TamDescricao( CImpressoraF.QtdeColunasImpressao, 'DATA FECHAMENTO..: ' + vDiaFcMov ));

	vListRel.Add(CImpressoraF.TamDescricao( CImpressoraF.QtdeColunasImpressao, ' '));

	buscas.Close;
	buscas.SQL.Text := 'select SALDO_DIN_ABERT from MOV_OPERADOR' +
		' where nmov = ' + vNumMovs +
		' and cod_empresa = ' + vDadosIniF.codEmpresa;
	buscas.Open;
	vSaldoIni := buscas.FieldByName('SALDO_DIN_ABERT').AsFloat;
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																							[1, CImpressoraF.QtdeColunasImpressao - 11],
																							['Saldo Inicial Dinheiro', vDadosIniF.AlnDir( Format('%0.2f', [vSaldoIni]), 12)]));

	vListRel.Add(CImpressoraF.TamDescricao( CImpressoraF.QtdeColunasImpressao, ' '));
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																							[1, CImpressoraF.QtdeColunasImpressao - 4],
																							['Meio de Pagamento', 'Valor']));
	buscas.Close;
	buscas.SQL.Text :=
		'select f.finalizador, fn.descricao, sum( case when f.tipo_doc = ''SAN'' then -1 else 1 end * f.valor) valor' +
		' from fincupom f' +
		' inner join finalizadores fn on fn.cod_terminal = f.cod_terminal and fn.nserieecf = f.nserieecf and fn.cod_empresa = f.cod_empresa and fn.cod_finalizador = f.finalizador' +
		' where f.nmov = ' + vNumMovs +
		' and coalesce(f.status_fc, '''') <> ''CANCELADO''' +
		' group by 1, 2 order by f.finalizador';
	buscas.Open;
	vSoma := 0;
	buscas.First;
	while not buscas.Eof do
	begin
		vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																								[1, CImpressoraF.QtdeColunasImpressao - 11],
																								[buscas.FieldByName('descricao').AsString,
																								vDadosIniF.AlnDir(Format('%0.2f',[buscas.FieldByName('valor').AsFloat]),12)]));
		vSoma := vSoma + buscas.FieldByName('valor').AsFloat;
		buscas.Next;
	end;
	vListRel.Add(vDadosIniF.Replicate('-', CImpressoraF.QtdeColunasImpressao));
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																							[1, CImpressoraF.QtdeColunasImpressao - 11],
																							['Soma', vDadosIniF.AlnDir(Format('%0.2f',[vSoma]),12)]));

	vListRel.Add(CImpressoraF.TamDescricao( CImpressoraF.QtdeColunasImpressao, ' '));
	vListRel.Add(CImpressoraF.TamDescricao( CImpressoraF.QtdeColunasImpressao, 'Meio  Qtde   Vend/Rec    Sang     Sup      Saldo'));

	buscas.Close;
	buscas.SQL.Text :=
		'select fn.descricao, sum( case when ((f.tipo_doc = ''CUP'') or (f.tipo_doc = ''REC'')) then f.valor else 0 end) valorcp,' +
		' sum( case when (f.tipo_doc = ''SAN'') then f.valor else 0 end) valorsan,' +
		' sum( case when (f.tipo_doc = ''SUP'') then f.valor else 0 end) valorsup,' +
		' count(distinct f.cupom) qtde' +
		' from fincupom f' +
		' inner join finalizadores fn on fn.cod_terminal = f.cod_terminal and fn.nserieecf = f.nserieecf and fn.cod_empresa = f.cod_empresa and fn.cod_finalizador = f.finalizador' +
		' where f.nmov = ' + vNumMovs +
		' and coalesce(f.status_fc, '''') <> ''CANCELADO''' +
		' group by 1';
	buscas.Open;
	vSomaQtde := 0;
	vSomaVND:= 0;
	vSomaSAN := 0;
	vSomaSUP := 0;
	buscas.First;
	while not buscas.Eof do
	begin
		vListRel.Add(CImpressoraF.TamDescricao( CImpressoraF.QtdeColunasImpressao, buscas.FieldByName('descricao').AsString));
		vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																								[1, 12, 23, 31, 39],
																								[vDadosIniF.AlnDir(IntToStr(buscas.FieldByName('qtde').AsInteger), 10),
																								vDadosIniF.AlnDir(Format('%7.2f',[buscas.FieldByName('valorcp').AsFloat]),10),
																								vDadosIniF.AlnDir(Format('%4.2f',[buscas.FieldByName('valorsan').AsFloat]),7),
																								vDadosIniF.AlnDir(Format('%4.2f',[buscas.FieldByName('valorsup').AsFloat]),7),
																								vDadosIniF.AlnDir(Format('%7.2f',[buscas.FieldByName('valorcp').AsFloat + buscas.FieldByName('valorsup').AsFloat - buscas.FieldByName('valorsan').AsFloat]),10)
																								]));
		vSomaQtde := vSomaQtde + buscas.FieldByName('qtde').AsInteger;
		vSomaVND := vSomaVND + buscas.FieldByName('valorcp').AsFloat;
		vSomaSAN := vSomaSAN + buscas.FieldByName('valorsan').AsFloat;
		vSomaSUP := vSomaSUP + buscas.FieldByName('valorsup').AsFloat;
		buscas.Next;
	end;
	vListRel.Add(vDadosIniF.Replicate('-', CImpressoraF.QtdeColunasImpressao));
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																								[1, 5, 12, 23, 31, 39],
																								['Tot',
																								vDadosIniF.AlnDir(IntToStr(vSomaQtde),6),
																								vDadosIniF.AlnDir(Format('%7.2f',[vSomaVND]),10),
																								vDadosIniF.AlnDir(Format('%4.2f',[vSomaSAN]),7),
																								vDadosIniF.AlnDir(Format('%4.2f',[vSomaSUP]),7),
																								vDadosIniF.AlnDir(Format('%7.2f',[vSomaVND + vSomaSUP - vSomaSAN]),10)
																								]));
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																								[1, 39],
																								['Saldo de Caixa',
																								vDadosIniF.AlnDir(Format('%7.2f',[vSomaVND + vSomaSUP - vSomaSAN + vSaldoIni]),10)
																								]));
	buscas.Close;
	buscas.SQL.Text :=
		'select sum(coalesce(c2.total, 0)) vendabruta,' +
		' sum( case when coalesce(c2.status_it, '''') = ''CANCELADO'' then 0' +
		' else coalesce(c2.rat_desc, 0) + coalesce(c2.perc_desc, 0) end) descontos,' +
		' sum( case when coalesce(c2.status_it, '''') = ''CANCELADO'' then 0' +
		' else coalesce(c2.rat_acres, 0) + coalesce(c2.perc_acresc, 0) end) acrescimos,' +
		' sum( case when coalesce(c2.status_it, '''') = ''CANCELADO'' then 0' +
		' else coalesce(c2.total, 0) + coalesce(c2.rat_acres, 0) + coalesce(c2.perc_acresc, 0) - coalesce(c2.rat_desc, 0) - coalesce(c2.perc_desc, 0) end) vendaliquida,' +
		' sum( case when coalesce(c2.status_it, '''') = ''CANCELADO'' then coalesce(c2.total, 0)' +
		' else 0 end) cancelamentos,' +
		' count(distinct case when c.status_cp = ''CANCELADO'' then null else c.cupom end) qtdeCupons,' +
		' count(distinct case when c.status_cp = ''CANCELADO'' then c.cupom else null end) qtdeCuponsCANC,' +
		' sum(case when c2.status_it = ''CANCELADO'' then 0 else coalesce(c2.quantidade,0) end) qtdeItens' +
		' from cupom2 c2' +
		' inner join cupom c on c.cod_terminal = c2.cod_terminal and c.nserieecf = c2.nserieecf and c.cod_empresa = c2.cod_empresa and c.registro = c2.ordem and c.cupom = c2.cupom' +
		' where c.nmov = ' + vNumMovs;
	buscas.Open;

	vListRel.Add(CImpressoraF.TamDescricao( CImpressoraF.QtdeColunasImpressao, ' '));
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao, [29, 44], ['Qtde'	, 'Valor']));
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																								[1, 34],
																								['Venda Bruta',
																								vDadosIniF.AlnDir(Format('%13.2f', [buscas.FieldByName('vendabruta').AsFloat]),15)]));
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																								[1, 25, 34],
																								['Cancelamentos',
																								vDadosIniF.AlnDir(buscas.FieldByName('qtdeCuponsCANC').AsString, 8),
																								vDadosIniF.AlnDir(Format('%13.2f', [buscas.FieldByName('cancelamentos').AsFloat]),15)]));
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																								[1, 34],
																								['Descontos',
																								vDadosIniF.AlnDir(Format('%13.2f', [buscas.FieldByName('descontos').AsFloat]),15)]));
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																								[1, 34],
																								['Acréscimos',
																								vDadosIniF.AlnDir(Format('%13.2f', [buscas.FieldByName('acrescimos').AsFloat]),15)]));
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																								[1, 25, 34],
																								['Venda Líquida',
																								vDadosIniF.AlnDir(buscas.FieldByName('qtdeCupons').AsString, 8),
																								vDadosIniF.AlnDir(Format('%13.2f', [buscas.FieldByName('vendaliquida').AsFloat]),15)]));
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																								[5, 25],
																								['Produtos',
																								vDadosIniF.AlnDir(buscas.FieldByName('qtdeItens').AsString, 8)]));
	buscas.close;
	buscas.SQL.Text := 'select sum( case when (f.tipo_doc = ''REC'') then f.valor else 0 end) valorrec,' +
		' sum( case when (f.tipo_doc = ''SAN'') then f.valor else 0 end) valorsan,' +
		' sum( case when (f.tipo_doc = ''SUP'') then f.valor else 0 end) valorsup,' +
		' count(distinct f.cupom) qtde' +
		' from fincupom f' +
		' where f.nmov = ' + vNumMovs +
		' and coalesce(f.status_fc, '''') <> ''CANCELADO''';
	buscas.Open;
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																								[1, 34],
																								['Recebimentos',
																								vDadosIniF.AlnDir(Format('%13.2f', [buscas.FieldByName('valorrec').AsFloat]),15)]));
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																								[1, 34],
																								['Suprimentos',
																								vDadosIniF.AlnDir(Format('%13.2f', [buscas.FieldByName('valorsup').AsFloat]),15)]));
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																								[1, 34],
																								['Sangria',
																								vDadosIniF.AlnDir(Format('%13.2f', [buscas.FieldByName('valorsan').AsFloat]),15)]));
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																								[1, 34],
																								['Saldo de Caixa',
																								vDadosIniF.AlnDir(Format('%13.2f', [vSomaVND + vSomaSUP - vSomaSAN + vSaldoIni]),15)]));

	vListRel.Add(CImpressoraF.TamDescricao( CImpressoraF.QtdeColunasImpressao, ' '));
	vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao, [1, 16, 45], ['Codigo', 'Descrição', 'Qtde']));

	buscas.Close;
	buscas.SQL.Text := 'select c2.prod_serv, c2.grupo_prod, c2.codbarra, c2.descr_it,' +
		' sum(coalesce(c2.quantidade,0)) qtdeItens' +
		' from cupom2 c2' +
		' inner join cupom c on c.cod_terminal = c2.cod_terminal and c.nserieecf = c2.nserieecf and c.cod_empresa = c2.cod_empresa and c.registro = c2.ordem and c.cupom = c2.cupom' +
		' where c.nmov = ' + vNumMovs +
		' and coalesce(c2.status_it,'''') <> ''CANCELADO''' +
		' group by 1,2,3,4 order by 1, 2, 4';
	buscas.Open;

	vGrupo := -1;

	buscas.First;
	while not buscas.Eof do
	begin
		if (buscas.FieldByName('prod_serv').AsString = 'P') and
			(buscas.FieldByName('grupo_prod').AsInteger <> vGrupo) then
		begin
			vGrupo := buscas.FieldByName('grupo_prod').AsInteger;
			buscasRet.Close;
			buscasRet.SQL.Text := 'select DESCRICAO from GRUPOS' +
				' where codigo_grup = ' + IntToStr(vGrupo);
			buscasRet.Open;
			vListRel.Add(CImpressoraF.TamDescricao( CImpressoraF.QtdeColunasImpressao, ' '));
			vListRel.Add( CImpressoraF.TamDescricao( CImpressoraF.QtdeColunasImpressao,
				'Grupo: ' + vDadosIniF.StrZero(vGrupo,3) + ' ' +
				Copy( buscasRet.FieldByName('descricao').AsString, 1, 27)));
		end;
		vListRel.Add(CImpressoraF.insertMultString( CImpressoraF.QtdeColunasImpressao,
																								[1, 16, 45],
																								[ Copy(buscas.FieldByName('codbarra').AsString, 1, 14),
																								Copy(buscas.FieldByName('descr_it').AsString, 1, 28),
																								vDadosIniF.AlnDir(buscas.FieldByName('qtdeItens').AsString, 4)]));
		buscas.Next;
	end;
end;

end.
