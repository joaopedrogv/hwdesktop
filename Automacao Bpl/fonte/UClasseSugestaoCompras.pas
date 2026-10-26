unit UClasseSugestaoCompras;

interface
uses
  uDadosIni, uDataSet_OOP, DBClient, DB, ComCtrls, StdCtrls, CheckLst, QuickRpt, DBGrids,
  Grids, Types, Graphics, RDprint,math, uClassesMigRegistros, uClassesMig, DateUtils;
type
  TCondPagPed = class;
  TListaVendedor = class;
  TListaFornecedor = class;
  TListaGrupoIni = class;
  TListaGrupoFim = class;
  TListaSubGrupoIni = class;
  TListaSubGrupoFim = class;
  TListaGradeIni = class;
  TListaGradeFim = class;
  TListaMarca = class;
  TPedidoCompra = class;
  TItemPedidoCompra = class;
  TBuscasClasses = class;
  TBuscasSugestao = class;
  TExecClasses = class;
  TSugestao = class;
  ArrayBi = array of array of shortstring;

  RConsulta = record
    campo, ordem, condicao, valor, dataIni, dataFim: string;
    porData, porDataAd: Boolean;
    //Opçoes Avanças
    avancada, adicional: boolean;
    campoAd, valorAd, dataIniAd, dataFimAd, condicaoAd: string;
  end;

  TCondPagPed = class(TDataSet_OOP)
  public
    constructor create;
    function abreCondPag: boolean;
    function existeCondPag(codigo: Integer): boolean;
    function montaCondPag(lista: TComboBox; codigoCondicao: integer): string;
    function getTodos: boolean;
  end;

  TListaVendedor = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
  var

  end;

  TListaFornecedor = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
  var

  end;

  TListaGrupoIni = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
  var

  end;

  TListaGrupoFim = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
  var

  end;

  TListaSubGrupoIni = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
  var

  end;

  TListaSubGrupoFim = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
  var

  end;

  TListaGradeIni = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
  var

  end;

  TListaGradeFim = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
  var

  end;

  TListaMarca = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
  var

  end;

  TListaItensPedido = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
  var

  end;

  TPedidoCompra = class(TDataSet_OOP)
  private
    vsqlTemp: WideString;
    fPendencias: TDataSet_OOP;
    LVendedor: TListaVendedor;
    LFornecedor: TListaFornecedor;
    LItensPedido: TListaItensPedido;
    quickRep: TQuickRep;
    vAliqInter, vAliqIntra, vBaseIcmsSt, vValorICMS, vValorICMSst, vIPI, vFrete: double;
  public
    constructor create;
    destructor destroy; override;
    function consulta: boolean;
    function abreVendedor: boolean;
    function checaVendedor: boolean;
    function abreFornecedor: boolean; overload;
    function abreFornecedor(codigoF: integer): boolean; overload;
    function checaFornecedor: boolean;
    function checaCondPag: boolean;
    function EnviarParaLixeira: boolean;
    function DeletarRegistro: boolean;
    function RestaurarRegistro: boolean;
    function StatusLixeira(aviso: boolean): boolean;
    function AbrirLixeira: boolean;
    function checaQtdItens: boolean;
    function MontarArquivoPedido(caminhoArquivo: string): boolean;
    function MontarArquivoPedidoHw(caminhoArquivo: string): boolean;
    function abreItemPedidoCompra(numPed: integer): boolean;
    procedure CadPedidoCompra(TipoForm: integer);
    procedure CalculaValorPedido;
    function CalculaImpostos: boolean;
    procedure PreencheCampos;
    function insert: boolean; override;
    function Edit: boolean; override;
    function post: boolean; override;
    procedure RelPedidoCompra;
    function MontarPedido: boolean;
    function MontarPedido2: boolean;
    function _abreFormExportarPedidoCompra: Boolean;
    function _marcarParaProducao: Boolean;
    function imprimirPed(pImprimirMvaIpiFrete: boolean = False; pImprimirLocPeso: boolean = False): boolean;
    function SetLancamentos(vCod: Integer = 0): boolean;
    function abreFormLancParcelas: boolean;
    function abreLancEditParcelas: boolean;
    procedure _rdPedidoSendMail(Sender: TObject);
    function abrePendenciasPorPeriodo(pDataIni, pDataFim: string; pRazao: Boolean): Boolean;
    function abreFormPendenciasPedidos: Boolean;
    function abreFormObservacao: Boolean;
    function marcarItemComoRecebido: Boolean;
    function marcarPedidoComoRecebido: Boolean;
//    property Pendencias: TDataSet_OOP read fPendencias write fPendencias;
  var
    vItemPedido: TItemPedidoCompra;
    vCondPedido: TCondPagPed;
    ultimasql: string;
    gridsugestao: TStringGrid;
    vpag: Integer;
    linha: integer;
    vNumDoc, vDataVenc: arraystring;
    vValor: arrayextended;
    vCons: RConsulta;
  end;

  TItemPedidoCompra = class(TDataSet_OOP)
  private
    vNItem: integer;
  public
    constructor create;
    destructor destroy; override;
    function insert(Pedido: TPedidoCompra): boolean; overload;
    function insert: boolean; overload;
    function delete: boolean; overload;
    function cancel: boolean; overload;
    function post: boolean; override;
    function JaExisteItem(vGrupoProd: integer; vCodProd: string; usarCodbarra: boolean): boolean;
    function buscaProduto(codBarra: string; grupo: integer; codProd: string; pedido: TPedidoCompra; usarCodbarra: boolean): boolean; overload;
    function buscaProduto(pedido: TPedidoCompra; codBarra: string; grupo: integer; codProd: string; usarCodbarra: boolean): boolean; overload;
    function _abreFormSelecionaGradeProd(grupo: integer; codProd: string): boolean;
  var
    vCodProd, vCodProdO: string;
    vGrupoProd, vGrupoProdO, numPed, vCodGrade, nGradeSelecionada: integer;
    modoEdit, prodDiferente: boolean;
  end;

  TDefinicaoClasses = class(TDataSet_OOP)
  private
    QtdMesEmpresa, NumeroCasasDecimais, TpProcessamento, TpEntrega, TpAlocacao, FreqPedido, EstSeguracaPadrao: Integer;
  public
    constructor create;
    destructor destroy; override;
    procedure SetaVariaveis; overload;
    function DefTipoVendas: boolean;
    function DefinirClassesServico: boolean;
    function PararProcessamento: boolean;
    function TipoOSSelecionada: boolean;
    procedure DefClasseServ;
  var
    Busca: TBuscasClasses;
    Grava: TExecClasses;
    Parar: boolean;
    TipoOSSelec, TipoVendas: string;
  end;

  TBuscasClasses = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
    function RetornaQtdItensVendaGlobal(codprod: string; grupoprod: integer; data: TDateTime; CodEmpresa: string): double;
    function RetornaQtdItensVendaAberta(codprod: string; grupoprod: integer; CodEmpresa: string): double;
    function RetornaQtdItensVenda(codprod: string; grupoprod: integer; QtdMesEmpresa: integer; CodEmpresa: string): double; overload; //Nao conta vendas consignadas ...
    function RetornaQtdItensVenda(codprod: string; grupoprod, QtdMesEmpresa: integer; tiposVenda, tiposOrigem, juncao: string; CodEmpresa: string): double; overload;
    function RetornaQtdItensVenda(codprod: string; grupoprod, grade, QtdMesEmpresa: integer; tiposVenda, tiposOrigem, juncao: string; CodEmpresa: string): double; overload;
    function RetornaQtdItensVendaPerdida(codprod: string; grupoprod: integer; QtdMesEmpresa: integer; CodEmpresa: string): double;
    function RetornaQtdItensPedidoNaoRecebido(codprod: string; grupoprod: integer; CodEmpresa: string): double;
    function RetornaQtdItensDevolvidos(codprod: string; grupoprod: integer; data: TDateTime; CodEmpresa: string): double;
    function RetornaQtdItensCompra(codprod: string; grupoprod: integer; data: TDateTime): double;
    function RetornaTempoEntrega(codprod: string; grupoprod: integer; CodEmpresa: string): Integer;
    function RetornaFreqPedido(codprod: string; grupoprod: integer; CodEmpresa: string): Integer;
    function RetornaEstSeguranca(codprod: string; grupoprod: integer; CodEmpresa: string): Integer;
    function RetornaEstF(codprod: string; grupoprod: integer; CodEmpresa: string): double;
    function RetornaQuantPedProd(codprod: string; grupoprod: integer; CodEmpresa: string): double;
    function RetornaCustoMedioVendaItem(codprod: string; grupoprod: integer; data: TDateTime): double;
    function ProdutoTemSimilar(codprod: string; grupoprod: integer; CodEmpresa: string): boolean;
  var

  end;

  TBuscasSugestao = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
  var
  end;

  TExecClasses = class(TDataSet_OOP)
  private
  public
    constructor create;
    destructor destroy; override;
  var
  end;

  TEmpresasSugestao = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTodosEmpresas(pCodSugestao: string): Boolean; overload;
    function _abreTodosEmpresas: Boolean; overload;
    procedure _marcaDesmarcaLinha;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
  end;

  TCondPagPedSug = class(TDataSet_OOP)
  public
  	constructor create;
    function _abreCondPag: boolean;
  end;

  TVendedorPedSug = class(TDataSet_OOP)
  public
  	constructor create;
    function _abreVendedor(pCodEmpresa: Integer): boolean; overload;
    function _abreVendedor(pCodEmpresa: Integer; pTestarTipo: boolean): boolean; overload;
  end;

  TVendedorPedSug2 = class(TDataSet_OOP)
  public
  	constructor create;
    function _abreVendedor(pCodEmpresa: Integer): boolean; overload;
    function _abreVendedor(pCodEmpresa: Integer; pTestarTipo: boolean): boolean; overload;
  end;

  TClientePedSug = class(TDataSet_OOP)
  public
  	constructor create;
    function _abreCliente(pCodCliente: Integer; pCodEmpresa: Integer): boolean;
  end;

  TFornecPedSug = class(TDataSet_OOP)
  public
  	constructor create;
    function _abreFornecedor(pCodFornec: Integer; pCodEmpresa: Integer): boolean;
  end;

  TEmpresaPedSug = class(TDataSet_OOP)
  public
  	constructor create;
    function _abreEmpresa: boolean;
  end;

  TCustoPedSug = class(TDataSet_OOP)
  public
  	constructor create;
    function _abreCustoProd(pGrupoProd: Integer; pCodProd: string; pCodEmpresa: Integer): boolean;
  end;

  TSugestao = class(TDataSet_OOP)
  private
    LGrupoI: TListaGrupoIni;
    LGrupoF: TListaGrupoFim;
    LSGrupoI: TListaSubGrupoIni;
    LSGrupoF: TListaSubGrupoFim;
    LGradeI: TListaGradeIni;
    LGradeF: TListaGradeFim;
    LMarcas: TListaMarca;
    TipoVendaSelec, TipoOrigemSelec: string;
    linha, vpag: integer;
    usodegrade: boolean;
    pQuantLista: Integer;
    pListas: string;
    procedure novaPaginaPrint;
  protected
    fqtdMesSug :integer;
  public
    fTempListaCotacao: TClientDataSet;
    fTempListaCotacaoOld: TClientDataSet;
    fTempEmpresasPedido: TClientDataSet;
    fTempClientesPedido: TClientDataSet;
    fTempDadosForm: TClientDataSet;

    fTempListaCotacaoDtSource: TDataSource;
    fTempEmpresasPedidoDtSource: TDataSource;
    fTempClientesPedidoDtSource: TDataSource;
    constructor create;
    destructor destroy; override;
    procedure CadSugestao(TipoForm: integer);
    function abreSugestao(Vazio: boolean): boolean;
    function abreGrupoI: boolean;
    function abreGrupoF: boolean;
    function abreSGrupoI: boolean;
    function abreSGrupoF: boolean;
    function abreGradeI: boolean;
    function abreGradeF: boolean;
    function abreMarcas: boolean;
    function insert: boolean; override;
    function post(pSemMensagem: boolean = false): boolean;
    procedure imprimirSugestao(vpar: arrayBi);
    function StatusLixeira(aviso: boolean): boolean;
    procedure SetaVariaveisSugestao; overload;
    procedure SetaVariaveisSugestao(pCodSugestao: integer); overload;
    procedure LimpaSugestao;
    procedure SelecionaItemSugestao;
    procedure MarcarDesmarTodosItemSugestao(pMarca: boolean = true);
    procedure alteraSugestao;
    function DeletarRegistro: boolean;
    function EnviarParaLixeira: boolean;
    function AbrirLixeira: boolean;
    function RestaurarRegistro: boolean;
    function localizaCodigo(tabela, codido: string; codempresa: integer = 0): integer;
    procedure SelecionaItemSimilar(ACol, ARow: Integer; Rect: TRect);
    function VisualizarSugestao: boolean;
    function existeGrade(pTipo: string = 'I'): boolean;
    procedure montarCheckListBoxTipV(pCheckListBox1: TCheckListBox);
    function DemandaMensal(codprod: string;grupoprod: integer;codempresa: Integer): boolean;
    function ExecutaSugestao(EstoqueSeguranca, TempoProcess, TempoEntrega, TempoAloc,
      Freq_Pedido, QtdMesSugestao: integer; usarGrade, somenteGrade, produtoMov: boolean;
      CheckListBoxTipv, CheckListBoxOrigem: TCheckListBox;
      vGrupoI, vGrupoF, vSGrupoI, vSGrupoF, vGradeI, vGradeF, vMarcaI, vMarcaF,
      classe_prod, clinv, clpreco, clpop, clqtv, clfrv, clatl: string; arredondavalor: boolean;excgrupo,excsubgrupo,excgrades,
      excmarcas,checkmostrarultvnd,checkdescred,checktransf: TCheckBox): boolean;
    procedure SqlTipoVendaOrigemSelecionada(CheckListBoxTipv, CheckListBoxOrigem: TCheckListBox; apelidoTabela_Campo: string);
    function PararProcessamento: boolean;
    function abreListaCotacao: boolean;
    function abreListaPedidoCompra(pBuscar: boolean = false): boolean;
    function abreListaTransferencia: boolean;
    function abreFormMontarPedidoCompra: boolean;
    function abreFormMontarPedidoCompra2: boolean;
    function montarTransferencias: boolean;
		function filtrarPorEmpresa(pCodEmpresa: Integer): boolean;
    function filtrarPorEmpresaTransf(pCodEmpTrans: Integer; pCodEmpresa: Integer): boolean;
    function filtrarPorFornecedor(pCodFornecedor: Integer; pCodEmpresa: Integer): boolean;
    function localizarSugestaoProdutos(pGrupoProd: Integer; pCodProd: string;
    	pNumFabr: string; pDescrProd: string): boolean;
    function removerFiltros: boolean;
    procedure datasetAfterScrollEmpresa(DataSet: TDataSet);
    procedure datasetAfterScrollEmpresaTrans(DataSet: TDataSet);
    procedure datasetAfterScrollFornecedor(DataSet: TDataSet);
    procedure marcaDesmarcaLinha;
    procedure _marcarTodos;
    procedure _desmarcarTodos;
    procedure marcaDesmarcaLinhaDtTemp(pDataSet: TDataSet);
    procedure MarcarDesmarTodosDtTemp(pDataSet: TDataSet; pMarca: boolean = true);
    function _atualizarListaCotacao: boolean;
    function abreFormEmpresas: boolean;
    procedure datasetAfterScrollProdutos(DataSet: TDataSet);
    procedure datasetAfterScrollCusto(DataSet: TDataSet);
    procedure montarDtSetTemporario;
    function existeTransf: boolean;
    function montarDadosPedidoCompra(pFiltrarEmpresas: boolean; pFiltrarProdutos: boolean;
			pCodEmpresa: Integer;	pCodFornec: Integer;
  		pCodVendedor: Integer; pCodCondPag: Integer; pTipoPed: string): boolean;
    function verificatipovenda(var vcomb: TCombobox): boolean;
    function verificaorigemvenda(var vcomb: TCombobox): boolean;
    property qtdMesSug: Integer read fqtdMesSug write fqtdMesSug;
  var
 	  vCodigosEmpresas: string;
  	vEmpresasSugestao: TEmpresasSugestao;
    vCustoPedSug: TCustoPedSug;
    vEmpresasPedSug: TEmpresaPedSug;
    vClientePedSug :TClientePedSug;
    vFornecPedSug: TFornecPedSug;
    vVendedorPedSug: TVendedorPedSug;
    vVendedorPedSug2: TVendedorPedSug2;
    vCondPagPedSug: TCondPagPedSug;
    vCodEmpresaPedSug: Integer;
    vCodPedido: Integer;
    vCodPedidos: string;
    vNPEDs: string;
    vPedidoAberto: boolean; 
    Parar: boolean;
    vExisteGrade: boolean;
    vExibirTransf: boolean;
    ultimasql: string;
    vedtsug, QtdMesEmpresa, TpProcessamento, TpEntrega, TpAlocacao, FreqPedido, EstSeguracaPadrao: Integer;
    vestsegsug: integer;
    GridSug: TStringGrid;
    lb, lb2: TLabel;
    ProgressBar: TProgressBar;
    ProgressBar2: TProgressBar;
    obBuscaClasse: TBuscasClasses;
    obBuscaSugestao: TBuscasSugestao;
    RdpSug: TRDPrint;
  end;

implementation
uses
  IBQuery, IBDatabase, USugestaoCompras, uCadPedidoCompra,
  uDtmAtivo, SysUtils, Forms, Windows, UDtmSugestaoCompras, UDefinirCasseServ,
  Controls, Variants, Dialogs, uPadrao, Classes, ShlObj, DBCtrls, hw_utils, 
  MaskUtils;

{ TListaVendedor }

constructor TListaVendedor.create;
begin
  Buscas := TIBQuery(DtmSugestaoCompras.qrLocVendedor);
end;

destructor TListaVendedor.destroy;
begin
  buscas.Close;
  inherited;
end;

{ TPedidoCompra }

function TPedidoCompra.abreFornecedor: boolean;
begin
  if LFornecedor = nil then
    LFornecedor := TListaFornecedor.create;
  LFornecedor.buscas.Close;
  LFornecedor.buscas.SQL.Text := 'SELECT * FROM CLIENTES ' +
    ' where (tipo = ''F'' or tipo=''A'') and ' +
    ' cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1';
  LFornecedor.buscas.Open;
end;

function TPedidoCompra.abreLancEditParcelas: boolean;
var
  formulario: TfrmPadrao;
begin
  try
    if frmCadPedidoCompra.ListBox1.Items.Strings[frmCadPedidoCompra.ListBox1.ItemIndex] = '' then
      exit;

    vDadosIni.atualizarVariaveisEmpresa(buscas);
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 338;
    formulario.Height := 300;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Lancamentos';
    formulario.Position := poScreenCenter;     
    frmCadPedidoCompra.pnLancEditParcelas.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.BorderIcons := [];
    frmCadPedidoCompra.edCrDoc.Text := vNumDoc[frmCadPedidoCompra.ListBox1.ItemIndex];
    frmCadPedidoCompra.edCrVenc.Text := vDataVenc[frmCadPedidoCompra.ListBox1.ItemIndex];
    frmCadPedidoCompra.mValorParcelaCr.Valor := vValor[frmCadPedidoCompra.ListBox1.ItemIndex];
    result := (formulario.ShowModal = mrOk);
  finally
    if Result then
    begin
      frmCadPedidoCompra.ListBox1.Items[frmCadPedidoCompra.ListBox1.ItemIndex] := (frmCadPedidoCompra.edCrDoc.Text + '    ' + frmCadPedidoCompra.edCrVenc.Text + '    ' + Format('%m', [frmCadPedidoCompra.mValorParcelaCr.Valor]));
      frmCadPedidoCompra.ListBox2.Items[frmCadPedidoCompra.ListBox1.ItemIndex] := FloatToStr(frmCadPedidoCompra.mValorParcelaCr.Valor);
    end;

    frmCadPedidoCompra.pnLancEditParcelas.Parent := frmCadPedidoCompra.tsLancEditParcelas;
    formulario.Free;
    formulario := nil;
  end;
end;

function TPedidoCompra.abrePendenciasPorPeriodo(pDataIni, pDataFim: string; pRazao: Boolean): Boolean;
var
  vCampoCliente: string;
begin
  Result := False;
  if pRazao then
    vCampoCliente := 'razao'
  else
    vCampoCliente := 'nome_cliente';

  fPendencias.dataSet.Close;
  fPendencias.dataSet.CommandText := 'select it.num_ped "Pedido", c.' + vCampoCliente + ' "Cliente", pd.data_env_ped "Data Pedido",' +
    ' pd.tipo_ped "Tipo", it.nitem "N Item", pr.num_fab_prod "Num Fab", it.grupo_prod "Grupo", it.cod_prod "Cod Prod", it.descr_prod "Mercadoria",' +
    ' avg(distinct(coalesce(it.val_tot_it,0))) "Valor Total",' +
    ' sum(distinct(coalesce(it.quant_it_prod,0))) "Qtde Pedido",' +
    ' sum((coalesce(ir.qtde_recebida,0))) "Qtde Recebida",' +
    ' sum(distinct(coalesce(it.quant_it_prod,0))) - sum((coalesce(ir.qtde_recebida,0))) "Qtde Pendente"' +
    ' from item_pedido it' +
    ' inner join pedido pd on it.num_ped = pd.num_ped and it.cod_empresa = pd.cod_empresa' +
    ' inner join produtos pr on pr.grupo_prod = it.grupo_prod and pr.cod_prod = it.cod_prod and pr.cod_empresa = it.cod_empresa' +
    ' left join clientes c on c.cod_cliente = pd.codigo_f and c.cod_empresa = pd.cod_empresa' +
    ' left join item_pedido_nf_rec ir on ir.num_ped = it.num_ped and ir.grupo_prod = it.grupo_prod and' +
    ' ir.cod_prod = it.cod_prod and ir.cod_empresa = it.cod_empresa and ir.nitem = it.nitem' +
    ' where pd.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and pd.data_env_ped >= :dataIni' +
    ' and pd.data_env_ped <= :dataFim' +
    ' and pd.status_ped  = ''EFETIVADO''' +
    ' and pd.ativo = 1' +
    ' and coalesce(it.recebido, ''N'') = ''N''' +
    ' group by 1,2,3,4,5,6,7,8,9';
  fPendencias.dataSet.Params.ParamByName('dataIni').AsDate := StrToDate(pDataIni);
  fPendencias.dataSet.Params.ParamByName('dataFim').AsDate := StrToDate(pDataFim);
  fPendencias.dataSet.Open;

  TFloatField(fPendencias.dataSet.FieldByName('Valor Total')).DisplayFormat := '#0.00';

  Result := not fPendencias.IsEmpty;

end;

function TPedidoCompra.abreFormLancParcelas: boolean;
var
  formulario: TfrmPadrao;
  I: Integer;
begin
  try
    vDadosIni.atualizarVariaveisEmpresa(buscas);
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 469;
    formulario.Height := 321;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Lancamentos';
    formulario.Position := poScreenCenter;
    frmCadPedidoCompra.pnLancParcelas.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.BorderIcons := [];
    frmCadPedidoCompra.edCreditoValorCredito.Enabled := false;
    frmCadPedidoCompra.edCreditoValorCredito.Valor := dataSet.FieldByName('VAL_TOT_PED').AsFloat;
    frmCadPedidoCompra.edcreditoCondicaoPagamento.text:= vCondPedido.montaCondPag(frmCadPedidoCompra.edcreditoCondicaoPagamento, dataSet.FieldByName('COD_COND_PAG').AsInteger);
    if trim(dataSet.FieldByName('FORMPAG').AsString) <> '' then
    begin
      frmCadPedidoCompra.ListBox1.Items.Text := trim(dataSet.FieldByName('FORMPAG').AsString);
      frmCadPedidoCompra.ListBox2.Items.Text := trim(dataSet.FieldByName('VLFORMPAG').AsString);
    end;
    result := (formulario.ShowModal = mrOk);
  finally
    if Result then
    begin
      dataSet.Edit;
      dataSet.FieldByName('FORMPAG').AsString := frmCadPedidoCompra.ListBox1.Items.Text;
      dataSet.FieldByName('VLFORMPAG').AsString := frmCadPedidoCompra.ListBox2.Items.Text;
      dataSet.Post;
    end;

    frmCadPedidoCompra.pnLancParcelas.Parent := frmCadPedidoCompra.tsLancParcelas;
    formulario.Free;
    formulario := nil;
  end;
end;

function TPedidoCompra.abreFormObservacao: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    inherited edit;
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Observação';
    frmCadPedidoCompra.pnObservacao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.BorderIcons := [];
    result := (formulario.ShowModal = IDOK);
  finally
    FreeAndNil(fPendencias);
    frmCadPedidoCompra.pnObservacao.Parent := frmCadPedidoCompra.tsObservacao;
    formulario.Free;
    formulario := nil;
    inherited Post;
  end;


end;

function TPedidoCompra.abreFormPendenciasPedidos: Boolean;
//var
//  formulario: TfrmPadrao;
begin
  try
    fPendencias := TDataSet_OOP.Create;
    fPendencias.dataSet := TClientDataSet(dtmSugestaoCompras.cdsPendPed);

    Result := vDadosIni.abreForm('Pendência de Mercadorias', frmCadPedidoCompra.pnItensPendentes, [ofEscapeExit, ofAlignAllClientWinCtrl]);

//    formulario := TfrmPadrao.Create(Application);
//    formulario.Width := 620;
//    formulario.Height := 500;
//    formulario.Position := poScreenCenter;
//    formulario.Caption := 'Pendência de Mercadorias';
//    frmCadPedidoCompra.pnItensPendentes.Parent := formulario;
//    formulario.AutoSize := True;
//    formulario.AutoScroll := False;
//    result := (formulario.ShowModal = IDOK);
  finally
    FreeAndNil(fPendencias);
//    frmCadPedidoCompra.pnItensPendentes.Parent := frmCadPedidoCompra.tsPendencias;
//    formulario.Free;
//    formulario := nil;
  end;
end;

function TPedidoCompra.abreFornecedor(codigoF: integer): boolean;
begin
  if LFornecedor = nil then
    LFornecedor := TListaFornecedor.create;
  LFornecedor.buscas.Close;
  LFornecedor.buscas.SQL.Text := 'SELECT * FROM CLIENTES ' +
    ' where (tipo = ''F'' or tipo=''A'') ' +
    ' and cod_cliente =' + inttostr(codigoF) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1';
  LFornecedor.buscas.Open;
end;

function TPedidoCompra.abreItemPedidoCompra(numPed: integer): boolean;
begin
  if vItemPedido = nil then
    vItemPedido := TItemPedidoCompra.create;
  result := vItemPedido.montaSelect(' SELECT ip.NUM_PED,ip.nitem, ip.GRUPO_PROD, ' +
    ' ip.COD_PROD,ip.COD_EMPRESA,ip.QUANT_IT_PROD,ip.QUANT_PEN_IT,ip.QUANT_MIN_IT, ' +
    ' ip.VAL_UNT_IT,ip.VAL_TOT_IT, ip.VL_V_EMP,ip.VL_V_HONDA, ip.ATIVO, ' +
    ' ip.DESCR_PROD,ip.cod_grade, ip.PERC_IPI, ip.PERC_FRETE, ip.MVA, ip.IPI, ip.FRETE, ' +
    ' ip.VALOR_ICMSUB, ip.NUM_COTACAO, ip.COD_SUGESTAO, ip.COD_EMP_MULT, p.NUM_FAB_PROD, p.VL_ULT_COMPRA, ' +
    ' case when (p.PESO_LIQ_PROD is null) then ' +
    '				 null ' +
    '			 else ' +
    '				 (coalesce(ip.QUANT_IT_PROD, 0) * coalesce(p.PESO_LIQ_PROD,  0)) ' +
    ' end PESO_LIQ_PROD, ' +
    ' case when (p.PESO_BRUT_PROD is null) then ' +
    '				 null ' +
    '			 else ' +
		' 			 (coalesce(ip.QUANT_IT_PROD, 0) * coalesce(p.PESO_BRUT_PROD,  0)) ' +
    '	end PESO_BRUT_PROD, ' +
		' p.LOCACAO_PROD, p.LOCACAO_PROD_1, g.DESCRICAO ' +
    ' FROM ITEM_PEDIDO ip ' +
    ' left join PRODUTOS p on ip.GRUPO_PROD = p.GRUPO_PROD and ip.COD_PROD = p.COD_PROD and ip.COD_EMPRESA = p.COD_EMPRESA ' +
    ' left join GRADE g on ip.COD_GRADE = g.COD_GRADE and ip.COD_EMPRESA = g.COD_EMPRESA ' +
    ' WHERE ip.NUM_PED = ' + inttostr(numPed) +
    ' and ip.COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' and ip.ATIVO = 1');
end;

function TPedidoCompra.abreVendedor: boolean;
begin
  if LVendedor = nil then
    LVendedor := TListaVendedor.create;
  LVendedor.buscas.Close;
  LVendedor.buscas.SQL.Text := 'SELECT * FROM COLABORADOR ' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1';
  LVendedor.buscas.Open;
  LVendedor.buscas.FetchAll;
end;

function TPedidoCompra.AbrirLixeira: boolean;
begin
  if not StatusLixeira(true) then
  begin
    if dataSet.IsEmpty then
      result := montaSelect(ultimasql);
    result := false;
  end
  else
    result := montaSelect(' select pedido.*, clientes.nome_cliente, clientes.razao, ' +
    	' clientes.endereco, clientes.fone_cliente, clientes.email, ' +
      ' cidades.nome_cidade, localidade.localidade, setor.setor from pedido ' +
      ' left join clientes on clientes.cod_cliente = pedido.codigo_f and clientes.cod_empresa = pedido.cod_empresa ' +
      ' left join cidades on cidades.cod_cidade = clientes.cod_cidade ' +
      ' left join localidade on localidade.cod_localidade = clientes.cod_localidade and localidade.cod_empresa = clientes.cod_empresa ' +
      ' left join setor on setor.cod_setor = localidade.cod_setor and setor.cod_empresa = localidade.cod_empresa ' +
      ' where pedido.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and (pedido.ativo = 0 or pedido.ativo is null)');
end;

//procedure TPedidoCompra.CadFornec;
//var
//  vFornec: TCadClientes;
//begin
//  vFornec.CadCliente(1);
//end;

procedure TPedidoCompra.CadPedidoCompra(TipoForm: integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo cadastro de Pedido de Compras');
    vDadosIni.vTipoForm := TipoForm;
    if dtmSugestaoCompras = nil then
      dtmSugestaoCompras := TdtmSugestaoCompras.Create(dtmSugestaoCompras);
    if frmCadPedidoCompra = nil then
    begin
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';
      Application.CreateForm(TfrmCadPedidoCompra, frmCadPedidoCompra);
    end;

    if (TipoForm > 0) and (not frmCadPedidoCompra.Visible) then
      frmCadPedidoCompra.ShowModal
    else if (not frmCadPedidoCompra.Visible) then
      frmCadPedidoCompra.Show
    else if frmCadPedidoCompra.FormStyle = fsMDIChild then
      frmCadPedidoCompra.Show
    else
      frmCadPedidoCompra.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

function TPedidoCompra.CalculaImpostos: boolean;
var
  vCodigoUFemp, vCodigoUFfornec: Integer;
  vSiglaFornec: string;

begin
  Result := true;
  vAliqInter := 0;
  vAliqIntra := 0;
  vBaseIcmsSt := 0;
  vValorICMS := 0;
  vValorICMSst := 0;
  vIPI := 0;
  vFrete := 0;

  buscas.Close;
  buscas.SQL.Text := 'SELECT CL.CODIGO_UF, EST.SIGLA_UF FROM CLIENTES CL' +
    ' inner join ESTADOS EST ON EST.CODIGO_UF = CL.CODIGO_UF ' +
    ' where (CL.tipo = ''F'' or CL.tipo=''A'') ' +
    ' and CL.cod_cliente =' + inttostr(dataSet.FieldByName('CODIGO_F').AsInteger) +
    ' and CL.cod_empresa = ' + vDadosIni.codEmpresa + ' and CL.ativo=1';
  buscas.Open;

  vCodigoUFfornec := buscas.FieldByName('CODIGO_UF').AsInteger;
  vSiglaFornec := buscas.FieldByName('SIGLA_UF').AsString;

 if  vItemPedido.dataSet.FieldByName('PERC_FRETE').AsFloat > 0 then
   vFrete := vDadosIni.StrToFloatFormat(((vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsFloat / 100) * vItemPedido.dataSet.FieldByName('PERC_FRETE').AsFloat), 2)
 else
   vFrete := vDadosIni.StrToFloatFormat(vItemPedido.dataSet.FieldByName('FRETE').AsFloat, 2);

 if vItemPedido.dataSet.FieldByName('PERC_IPI').AsFloat > 0 then
 begin
   if dataSet.FieldByName('FRETE_BASE_IPI').AsString = 'S' then
     vIPI := vDadosIni.StrToFloatFormat((((vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsFloat + vFrete) / 100) * vItemPedido.dataSet.FieldByName('PERC_IPI').AsFloat), 2)
   else
     vIPI := vDadosIni.StrToFloatFormat(((vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsFloat / 100) * vItemPedido.dataSet.FieldByName('PERC_IPI').AsFloat), 2);
 end
 else
     vIPI := vDadosIni.StrToFloatFormat(vItemPedido.dataSet.FieldByName('IPI').AsFloat, 2);

  if vItemPedido.dataSet.FieldByName('MVA').AsFloat <= 0 then
    exit;

  buscas.Close;
  buscas.SQL.Text := 'SELECT ALIQ_INTRA, CODIGO_UF FROM ESTADOS' +
   ' WHERE SIGLA_UF = ' + QuotedStr(vDadosIni.vEmp.vSiglaUF) +
   ' AND ATIVO = 1';
  buscas.Prepare;
  buscas.Open;

  if buscas.FieldByName('ALIQ_INTRA').AsFloat <= 0 then
  begin
    Result := false;
    Application.MessageBox('Aliq Interna de ICMS não encontrada no estado da Empresa. Favor informar!', 'Aviso', MB_OK +
      MB_ICONEXCLAMATION + MB_DEFBUTTON1);
    exit;
  end;

  vCodigoUFemp := buscas.FieldByName('CODIGO_UF').AsInteger;
  vAliqIntra := buscas.FieldByName('ALIQ_INTRA').AsFloat;

  if vCodigoUFfornec <> vCodigoUFemp then
  begin
    buscas.Close;
    buscas.SQL.Text := ' SELECT ICM_EXT_C FROM CFOP_MUD' +
     ' WHERE CODIGO_UF = '+IntToStr(vCodigoUFfornec) +
     ' AND UF_DESTINO = ' + IntToStr(vCodigoUFemp) +
     ' AND ATIVO = 1';
    buscas.Prepare;
    buscas.Open;

    if buscas.FieldByName('ICM_EXT_C').AsFloat <= 0 then
    begin
      Result := false;
      Application.MessageBox(Pchar('Relação de CFOP Interestaduais (CFOP_MUD) não encontrada para o estado do fornecedor informado' + #13 +
            'Estado Origem: ' + vSiglaFornec + #13 +
            'Estado Destino: ' + vDadosIni.vEmp.vSiglaUF), 'Aviso', MB_OK +
        MB_ICONEXCLAMATION + MB_DEFBUTTON1);
      exit;
    end;

    vAliqInter := buscas.FieldByName('ICM_EXT_C').AsFloat;
  end;

  buscas.Close;
  buscas.SQL.Text := ' SELECT ICM_PROD FROM PRODUTOS' +
     ' WHERE GRUPO_PROD = ' + IntToStr(vItemPedido.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
     ' AND COD_PROD = ' + QuotedStr(vItemPedido.dataSet.FieldByName('COD_PROD').AsString) +
     ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
  buscas.Prepare;
  buscas.Open;

  if buscas.FieldByName('ICM_PROD').AsFloat > 0 then
   vAliqIntra := buscas.FieldByName('ICM_PROD').AsFloat;

  if vCodigoUFfornec <> vCodigoUFemp then
   vAliqInter := vAliqIntra;


  if dataSet.FieldByName('IPI_BASE_ICM').AsString = 'S' then
    vValorICMS := ((vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsFloat + vIPI + vFrete) * vAliqIntra) / 100
  else
    vValorICMS := ((vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsFloat + vFrete) * vAliqIntra) / 100;

  vBaseIcmsSt:= vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsFloat + vIPI + vFrete;

  vBaseIcmsSt := vBaseIcmsSt + (vBaseIcmsSt * vItemPedido.dataSet.FieldByName('MVA').AsFloat / 100);

  vValorICMSst := vBaseIcmsSt * vAliqIntra / 100;
  vValorICMSst := vValorICMSst - vValorICMS;

  vItemPedido.dataSet.FieldByName('VALOR_ICMSUB').AsFloat := vDadosIni.StrToFloatFormat(vValorICMSst , 2);
  vItemPedido.dataSet.FieldByName('IPI').AsFloat := vDadosIni.StrToFloatFormat(vIPI , 2);
end;

procedure TPedidoCompra.CalculaValorPedido;
var
  valor: currency;
begin
  valor := 0;

  try
  	vItemPedido.dataSet.DisableControls;
    vItemPedido.dataSet.First;
    while not vItemPedido.dataSet.eof do
    begin
      vItemPedido.dataSet.edit;
      vItemPedido.dataSet.FieldByName('NUM_PED').AsInteger := dataSet.FieldByName('NUM_PED').AsInteger;
      if not CalculaImpostos then
        break;
      if vItemPedido.dataSet.FieldByName('MVA').AsFloat > 0 then
        valor := valor + vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsCurrency + vValorICMSst + vIPI + vFrete
      else
        valor := valor + vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsCurrency + vIPI + vFrete;
      vItemPedido.dataSet.post;
      
      vItemPedido.dataSet.Next;
    end;
  finally
    vItemPedido.dataSet.First;
    vItemPedido.dataSet.EnableControls;
  end;
  inherited edit;
  dataSet.FieldByName('VAL_TOT_PED').AsCurrency := vDadosIni.StrToFloatFormat(valor, 2);
  inherited post;
end;

function TPedidoCompra.checaCondPag: boolean;
begin
  if trim(vCondPedido.dataSet.FieldByName('DESC_COND_PAG').AsString) = '' then
  begin
    Application.MessageBox('Cond. Pag não indicado', 'Aviso', MB_OK +
      MB_ICONEXCLAMATION + MB_DEFBUTTON1);
    result := false;
  end
  else
    result := true;
end;

function TPedidoCompra.checaFornecedor: boolean;
begin
  if trim(LFornecedor.buscas.FieldByName('NOME_CLIENTE').AsString) = '' then
  begin
    Application.MessageBox('Fornecedor não indicado', 'Aviso', MB_OK +
      MB_ICONEXCLAMATION + MB_DEFBUTTON1);
    result := false;
  end
  else
    result := true;
end;

function TPedidoCompra.checaQtdItens: boolean;
begin
  result := true;
  if vItemPedido.dataSet.FieldByName('QUANT_IT_PROD').AsFloat = 0 then
  begin
    Application.MessageBox(Pchar('Quantidade de Itens não Informada' + chr(13) + 'Campo Obrigatório'), 'Aviso', MB_OK +
      MB_ICONWARNING + MB_DEFBUTTON1);
    result := false;
  end
  else
    vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsCurrency := vItemPedido.dataSet.FieldByName('VAL_UNT_IT').AsFloat * vItemPedido.dataSet.FieldByName('QUANT_IT_PROD').AsFloat;
end;

function TPedidoCompra.checaVendedor: boolean;
begin
  if trim(LVendedor.buscas.FieldByName('NOME_VENDEDOR').AsString) = '' then
  begin
    Application.MessageBox('Vendedor não indicado', 'Aviso', MB_OK +
      MB_ICONEXCLAMATION + MB_DEFBUTTON1);
    result := false;
  end
  else
    result := true;
end;

function TPedidoCompra.consulta: boolean;
var
  I, erro, vcontCTR: Integer;
  vsqlAdicional: string;
  formatodata: string;
  tempTipo: string;
  tempSql: string;
  vCampoTemp, vCampoTempAd, vCondicaoTmp, vCondicaoTmpAd, vTemp: string;
  vValorTemp: string;
begin
  try
    vsqlAdicional := '';
    vCampoTemp:= '';
    vCampoTempAd := '';

    if not vCons.adicional then
    begin
     vCons.campoAd := '';
     vCons.valorAd := '';
     vCons.condicaoAd := '';
     vCons.porDataAd := false;
     vCons.dataIniAd := '';
     vCons.dataFimAd := '';
    end;

    if UpperCase(trim(vCons.campo)) = 'NOME FORNECEDOR (RAZAO SOCIAL)' then
  		vCampoTemp := 'CLIENTES.RAZAO'
    else if UpperCase(trim(vCons.campo)) =  'NOME FORNECEDOR (NOME FANTASIA)' then
      vCampoTemp := 'CLIENTES.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campo)) =  'ENDERECO FORNECEDOR' then
      vCampoTemp := 'CLIENTES.ENDERECO'
    else if UpperCase(trim(vCons.campo)) =  'TELEFONE FORNECEDOR' then
      vCampoTemp := 'CLIENTES.FONE_CLIENTE'
    else if UpperCase(trim(vCons.campo)) =  'EMAIL FORNECEDOR' then
      vCampoTemp := 'CLIENTES.EMAIL'
    else if UpperCase(trim(vCons.campo)) =  'CIDADE' then
      vCampoTemp := 'CIDADES.NOME_CIDADE'
    else if UpperCase(trim(vCons.campo)) =  'LOCALIDADE' then
      vCampoTemp := 'LOCALIDADE.LOCALIDADE'
    else if UpperCase(trim(vCons.campo)) =  'SETOR' then
      vCampoTemp := 'SETOR.SETOR';

    if UpperCase(trim(vCons.campoAd)) = 'NOME FORNECEDOR (RAZAO SOCIAL)' then
  		vCampoTempAd := 'CLIENTES.RAZAO'
    else if UpperCase(trim(vCons.campoAd)) =  'NOME FORNECEDOR (NOME FANTASIA)' then
      vCampoTempAd := 'CLIENTES.NOME_CLIENTE'
    else if UpperCase(trim(vCons.campoAd)) =  'ENDERECO FORNECEDOR' then
      vCampoTempAd := 'CLIENTES.ENDERECO'
    else if UpperCase(trim(vCons.campoAd)) =  'TELEFONE FORNECEDOR' then
      vCampoTempAd := 'CLIENTES.FONE_CLIENTE'
    else if UpperCase(trim(vCons.campoAd)) =  'EMAIL FORNECEDOR' then
      vCampoTempAd := 'CLIENTES.EMAIL'
    else if UpperCase(trim(vCons.campoAd)) =  'CIDADE' then
      vCampoTempAd := 'CIDADES.NOME_CIDADE'
    else if UpperCase(trim(vCons.campoAd)) =  'LOCALIDADE' then
      vCampoTempAd := 'LOCALIDADE.LOCALIDADE'
    else if UpperCase(trim(vCons.campoAd)) =  'SETOR' then
      vCampoTempAd := 'SETOR.SETOR';

    if Trim(vCampoTemp) <> '' then
    begin
      vCondicaoTmp := vCons.Condicao;
      if UpperCase(trim(vCondicaoTmp)) = 'IGUAL' then
        vCondicaoTmp := '='
      else if UpperCase(trim(vCondicaoTmp)) = 'MAIOR' then
        vCondicaoTmp := '>'
      else if UpperCase(trim(vCondicaoTmp)) = 'MAIOR OU IGUAL' then
        vCondicaoTmp := '>='
      else if UpperCase(trim(vCondicaoTmp)) = 'MENOR' then
        vCondicaoTmp := '<'
      else if UpperCase(trim(vCondicaoTmp)) = 'MENOR OU IGUAL' then
        vCondicaoTmp := '<='
      else if UpperCase(trim(vCondicaoTmp)) = 'DIFERENTE' then
        vCondicaoTmp := '<>'
      else if UpperCase(trim(vCondicaoTmp)) = 'ESTA CONTIDO' then
        vCondicaoTmp := 'like'
      else if LowerCase(trim(vCondicaoTmp)) = 'começa' then
        vCondicaoTmp := 'Começa'
      else
        vCondicaoTmp := '=';
      if trim(vsqlAdicional) <> '' then
      	vsqlAdicional := vsqlAdicional + ' and ';
      if vCondicaoTmp = 'like' then
      	vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valor)) + '%')
      else if vCondicaoTmp = 'Começa' then
      	vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' like ' + QuotedStr(UpperCase(trim(vCons.valor)) + '%')
      else
      	vsqlAdicional := vsqlAdicional + ' ' + vCampoTemp + ' ' + vCondicaoTmp + ' ' + QuotedStr(UpperCase(trim(vCons.valor)));
      vCons.valor := '';
      vCons.campo := '';
      vCons.ordem := vCampoTemp;
    end;

    if Trim(vCampoTempAd) <> '' then
    begin
      vCondicaoTmpAd := vCons.CondicaoAd;
      if vCondicaoTmpAd = 'Igual' then
        vCondicaoTmpAd := '='
      else if UpperCase(trim(vCondicaoTmpAd)) = 'MAIOR' then
        vCondicaoTmpAd := '>'
      else if UpperCase(trim(vCondicaoTmpAd)) = 'MAIOR OU IGUAL' then
        vCondicaoTmpAd := '>='
      else if UpperCase(trim(vCondicaoTmpAd)) = 'MENOR' then
        vCondicaoTmpAd := '<'
      else if UpperCase(trim(vCondicaoTmpAd)) = 'MENOR OU IGUAL' then
        vCondicaoTmpAd := '<='
      else if UpperCase(trim(vCondicaoTmpAd)) = 'DIFERENTE' then
        vCondicaoTmpAd := '<>'
      else if UpperCase(trim(vCondicaoTmpAd)) = 'ESTA CONTIDO' then
        vCondicaoTmpAd := 'like'
      else if LowerCase(trim(vCondicaoTmpAd)) = 'começa' then
        vCondicaoTmpAd := 'Começa'
      else
        vCondicaoTmpAd := '=';
      if trim(vsqlAdicional) <> '' then
       vsqlAdicional := vsqlAdicional + ' and ';
      if vCondicaoTmpAd = 'like' then
      	vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valorAd)) + '%')
      else if vCondicaoTmpAd = 'Começa' then
      	vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' like ' + QuotedStr(UpperCase(trim(vCons.valorAd)) + '%')
      else
	      vsqlAdicional := vsqlAdicional + ' ' + vCampoTempAd + ' ' + vCondicaoTmpAd + ' ' + QuotedStr(UpperCase(trim(vCons.valorAd)));
      vCons.valorAd := '';
      vCons.campoAd := '';
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
      end
      else
      begin
        vCons.dataIniAd := '';
        vCons.dataFimAd := '';
      end;

      if vCons.condicaoAd = 'Igual' then
        vCons.condicaoAd := '='
      else if vCons.condicaoAd = 'Maior' then
        vCons.condicaoAd := '>'
      else if vCons.condicaoAd = 'Menor' then
        vCons.condicaoAd := '<'
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
              vCons.condicaoAd := '=';
              if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField)
              or (DataSet.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField) then
              begin
                try
                  if (Dataset.Fields[I] is TIntegerField) or (DataSet.Fields[I] is TSmallintField) then
                    vCons.valorAd := IntToStr(StrToInt(Trim(vCons.valorAd)))
                  else if (DataSet.Fields[I] is TFloatField) or (DataSet.Fields[I] is TCurrencyField) then
                    vCons.valorAd := FloatToStr(StrToFloat(Trim(vCons.valorAd)))
                except
                  vCons.valorAd := '0';
                  Application.MessageBox('Valor inválido', 'Atenção', 0 + 64);
                end;
              end
              else
                vCons.valorAd := vDadosIni.tirapontos(vCons.valorAd, 4);
            end
            else if (DataSet.Fields[i] is TDateField) or (DataSet.Fields[i] is TDateTimeField) then
            begin
            	if trim(vsqlAdicional) <> '' then
				      	vsqlAdicional := vsqlAdicional + ' and ';
              if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' PEDIDO.' + vCons.campoAd + ' >= ' + vCons.dataIniAd +
                	' and PEDIDO.' + vCons.campoAd + ' <= ' + vCons.dataIniAd
              else if (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' PEDIDO.' + vCons.campoAd + ' <= ' + vCons.dataIniAd
              else if (vCons.dataIniAd <> '') and (vCons.dataFimAd <> '') then
                vsqlAdicional := vsqlAdicional + ' PEDIDO.' + vCons.campoAd + ' >= ' + vCons.dataIniAd;
              Break;
            end;
            if trim(vsqlAdicional) <> '' then
			      	vsqlAdicional := vsqlAdicional + ' and ';
            if vCons.condicaoAd = 'like' then
            	vsqlAdicional := vsqlAdicional + ' PEDIDO.' + vCons.campoAd + ' like ' + QuotedStr('%' + UpperCase(trim(vCons.valorAd)) + '%')
            else if vCons.condicaoAd = 'Começa' then
	            vsqlAdicional := vsqlAdicional + ' PEDIDO.' + vCons.campoAd + ' like ' + QuotedStr(UpperCase(trim(vCons.valorAd)) + '%')
            else
            	vsqlAdicional := vsqlAdicional + ' PEDIDO.' + vCons.campoAd + ' ' + vCons.condicaoAd + ' ' + QuotedStr(UpperCase(trim(vCons.valorAd)));
            Break;
          end;
        end;
      end;
    end; //adicional

    if vCons.porData then
      result := ConsultaCampos('PEDIDO', vCons.campo, 'PEDIDO.NUM_PED', //vCons.ordem,
      	vCons.dataIni, vCons.dataFim, vDadosIni.codEmpresa, 1,
        ' PEDIDO.*, CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.ENDERECO, CLIENTES.FONE_CLIENTE, CLIENTES.EMAIL, ' +
        ' CIDADES.NOME_CIDADE, LOCALIDADE.LOCALIDADE, SETOR.SETOR ',
        ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = PEDIDO.CODIGO_F AND CLIENTES.COD_EMPRESA = PEDIDO.COD_EMPRESA ' +
        ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
        ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA ' +
        ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ',
        vsqlAdicional)
    else
      result := ConsultaCampos('PEDIDO', vCons.valor, vCons.campo, vCons.condicao,
        'PEDIDO.NUM_PED',//vCons.ordem,
        False, vDadosIni.codEmpresa,
        ' PEDIDO.*, CLIENTES.NOME_CLIENTE, CLIENTES.RAZAO, CLIENTES.ENDERECO, CLIENTES.FONE_CLIENTE, CLIENTES.EMAIL, ' +
        ' CIDADES.NOME_CIDADE, LOCALIDADE.LOCALIDADE, SETOR.SETOR ',
        ' LEFT JOIN CLIENTES ON CLIENTES.COD_CLIENTE = PEDIDO.CODIGO_F AND CLIENTES.COD_EMPRESA = PEDIDO.COD_EMPRESA ' +
        ' LEFT JOIN CIDADES ON CIDADES.COD_CIDADE = CLIENTES.COD_CIDADE ' +
        ' LEFT JOIN LOCALIDADE ON LOCALIDADE.COD_LOCALIDADE = CLIENTES.COD_LOCALIDADE AND LOCALIDADE.COD_EMPRESA = CLIENTES.COD_EMPRESA ' +
        ' LEFT JOIN SETOR ON SETOR.COD_SETOR = LOCALIDADE.COD_SETOR AND SETOR.COD_EMPRESA = LOCALIDADE.COD_EMPRESA ',
        vsqlAdicional);
  finally
    vsqlTemp := dataSet.CommandText;
  end;
end;

constructor TPedidoCompra.create;
begin
  if dtmSugestaoCompras = nil then
    dtmSugestaoCompras := TdtmSugestaoCompras.Create(dtmSugestaoCompras);
  DataSet := TClientDataSet(dtmSugestaoCompras.CdsPedidoCompra);
  transacao := TIBTransaction(dtmSugestaoCompras.IBTransPedido);
  Buscas := TIBQuery(dtmSugestaoCompras.qrBuscasPedido);

  vCondPedido := TCondPagPed.create;
end;

function TPedidoCompra.DeletarRegistro: boolean;
var
  numped: integer;
begin
  numped := dataSet.FieldByName('NUM_PED').asinteger;
  result := false;
  if not dataSet.IsEmpty then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?', 'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
    	buscas.Close;
      buscas.SQL.Text := ' DELETE FROM PEDIDO ' +
      	' WHERE NUM_PED = ' + IntToStr(numped) +
        ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
      buscas.ExecSQL;

			if CommitaTransacao then
	      result := true;
    end;
//      if Delete then
//        if Apply then
//          if CommitaTransacao then
//            result := true;
    if result then //auditoria sim ou não
      vDadosIni.GravaAuditoria('SUG004', 'TRANSACAO CONFIRMADA', 'SUCESSO', 'PEDIDO', inttostr(numped), buscas)
        //      vDadosIni.GravaAuditoria('SUG004', inttostr(numped) + ' Sucesso', buscas)
    else
      vDadosIni.GravaAuditoria('SUG004', 'TRANSACAO NÃO CONFIRMADA', 'FALHA', 'PEDIDO', inttostr(numped), buscas);
    //      vDadosIni.GravaAuditoria('SUG004', inttostr(numped) + ' Falha', buscas);
  end
  else
    Application.MessageBox('A tabela está vazia.', 'Aviso', MB_OK + MB_ICONEXCLAMATION + MB_DEFBUTTON1);
  Refresh;
end;

destructor TPedidoCompra.destroy;
begin
  Close;
  if vItemPedido <> nil then
  begin
    vItemPedido.Cancel;
    vItemPedido.RollBackTransacao;
    vItemPedido.Free;
  end;
  vCondPedido.Free;
  vCondPedido := nil;
  inherited;
end;

function TPedidoCompra.Edit: boolean;
begin
  Result := false;
  try
    if inherited edit then
    begin
      if dataSet.FieldByName('DATA_PED').IsNull then      
        dataSet.FieldByName('DATA_PED').AsDateTime := vDadosIni.getDataBanco(buscas);
      abreItemPedidoCompra(dataset.FieldByName('NUM_PED').asinteger);
      abreVendedor;
      abreFornecedor;
      vCondPedido.abreCondPag;
      Result := true;
    end;
  except
    on e: exception do
    begin
      Result := False;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;

end;

function TPedidoCompra.EnviarParaLixeira: boolean;
var
  numped: integer;
begin
  result := false;
  if not IsEmpty then
  begin
    if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira?', 'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
      numped := dataSet.FieldByName('NUM_PED').asinteger;
      try
        if inherited edit then
        begin
          dataSet.FieldByName('ATIVO').asinteger := 0;
          inherited post;
          if Apply then
          begin
            if CommitaTransacao then
            begin
              result := true;
              Refresh;
            end;
          end
          else
          begin
            Cancel;
            RollBackTransacao;
          end;
          if result then
            vDadosIni.GravaAuditoria('SUG005', 'TRANSACAO CONFIRMADA', 'SUCESSO', 'PEDIDO', inttostr(numped), buscas)
              //            vDadosIni.GravaAuditoria('SUG005', inttostr(numped) + ' Sucesso', buscas)
          else
            vDadosIni.GravaAuditoria('SUG005', 'TRANSACAO NÃO CONFIRMADA', 'FALHA', 'PEDIDO', inttostr(numped), buscas);
          //            vDadosIni.GravaAuditoria('SUG005', inttostr(numped) + ' Falha', buscas);
        end;
      except
        on e: exception do
        begin //auditoria não
          Application.MessageBox(pchar(e.Message), 'Erro', MB_ICONERROR + MB_OK);
          registraErro(e.Message);
        end;
      end;
    end;
  end
  else
    Application.MessageBox('A tabela está vazia.', 'Aviso', MB_OK + MB_ICONEXCLAMATION + MB_DEFBUTTON1);
end;

function TPedidoCompra.imprimirPed(pImprimirMvaIpiFrete: boolean; pImprimirLocPeso: boolean): boolean;
var
 vMva, vIPI, vFrete, vComImposto, vSemImposto, vProdutostot, vPecastot, vFretetot: Double;
 vPesoBrTotal, vPesoLiqTotal: Double;
 vNumDocs: TStringList;
 I: Integer;
 vqtdeP, vtotProd, vtotpedcimp, vtotfrete, vtotpedsimp: boolean;
 AObs: TStringList;

  procedure Linhas;
  begin
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 1, '|', [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 7, '|', [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 18, '|', [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 72, '|', [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 83, '|', [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 96, '|', [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 109, '|', [comp17]);
     if pImprimirMvaIpiFrete then
     begin
       dtmSugestaoCompras.RDprintSugestao.Impf(linha, 122, '|', [comp17]);
       dtmSugestaoCompras.RDprintSugestao.Impf(linha, 135, '|', [comp17]);
       dtmSugestaoCompras.RDprintSugestao.Impf(linha, 148, '|', [comp17]);
     end
     else if pImprimirLocPeso then
     begin
	     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 122, '|', [comp17]);
       dtmSugestaoCompras.RDprintSugestao.Impf(linha, 135, '|', [comp17]);
       dtmSugestaoCompras.RDprintSugestao.Impf(linha, 148, '|', [comp17]);
       dtmSugestaoCompras.RDprintSugestao.Impf(linha, 159, '|', [comp17]);
     end;
  end;

  procedure Separador(ln: integer; tp: integer);
  begin
    dtmSugestaoCompras.RDprintSugestao.Impf(ln, 1, '+' + VdadosIni.replicate('-', 6), [comp17]);
    dtmSugestaoCompras.RDprintSugestao.Impf(ln, 7, '+' + VdadosIni.replicate('-', 14), [comp17]);
    dtmSugestaoCompras.RDprintSugestao.Impf(ln, 18, '+' + VdadosIni.replicate('-', 62), [comp17]);
    dtmSugestaoCompras.RDprintSugestao.Impf(ln, 72, '+' + VdadosIni.replicate('-', 26), [comp17]);
    dtmSugestaoCompras.RDprintSugestao.Impf(ln, 83, '+' + VdadosIni.replicate('-', 26), [comp17]);
    dtmSugestaoCompras.RDprintSugestao.Impf(ln, 96, '+' + VdadosIni.replicate('-', 12), [comp17]);
    dtmSugestaoCompras.RDprintSugestao.Impf(ln, 109, '+' + VdadosIni.replicate('-', 18), [comp17]);
    if pImprimirMvaIpiFrete then
    begin
      dtmSugestaoCompras.RDprintSugestao.Impf(ln, 122, '+' + VdadosIni.replicate('-', 18), [comp17]);
      dtmSugestaoCompras.RDprintSugestao.Impf(ln, 135, '+' + VdadosIni.replicate('-', 13), [comp17]);
      dtmSugestaoCompras.RDprintSugestao.Impf(ln, 148, '+', [comp17]);
    end
    else if pImprimirLocPeso then
    begin
    	dtmSugestaoCompras.RDprintSugestao.Impf(ln, 122, '+' + VdadosIni.replicate('-', 18), [comp17]);
      dtmSugestaoCompras.RDprintSugestao.Impf(ln, 135, '+' + VdadosIni.replicate('-', 13), [comp17]);
      dtmSugestaoCompras.RDprintSugestao.Impf(ln, 148, '+' + VdadosIni.replicate('-', 10), [comp17]);
      dtmSugestaoCompras.RDprintSugestao.Impf(ln, 159, '+', [comp17]);
    end;
  end;

  procedure CabNovaPagina;
  var
     vNomeVendedor, vCondPag: string;
   begin
     buscas.Close;
     buscas.SQL.Text := 'select desc_cond_pag from cond_pag ' +
      ' where cod_cond_pag =' + IntToStr(dataSet.FieldByName('COD_COND_PAG').AsInteger);
     buscas.Prepare;
     buscas.Open;

     vCondPag := copy(trim(buscas.FieldByName('DESC_COND_PAG').AsString), 1, 30);

     buscas.Close;
     buscas.SQL.Text := 'select cod_vendedor, nome_vendedor from colaborador ' +
      ' where cod_vendedor =' + IntToStr(dataSet.FieldByName('COD_VENDEDOR').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
     buscas.Prepare;
     buscas.Open;

     vNomeVendedor := trim(buscas.FieldByName('NOME_VENDEDOR').AsString);

     buscas.Close;
     buscas.SQL.Text := 'select est.sigla_uf, cl.cod_cliente, cl.nome_cliente, cl.razao, cl.cpfcgc, cl.insc_est, cl.fone_cliente,' +
      ' cl.bairro, cl.cidade, cl.endereco, cl.num_end_cliente, cl.cep from clientes cl' +
      ' left join estados est on est.codigo_uf = cl.codigo_uf ' +
      ' where cod_cliente =' + IntToStr(dataSet.FieldByName('CODIGO_F').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
     buscas.Prepare;
     buscas.Open;


     if vpag > 0 then
       dtmSugestaoCompras.RDprintSugestao.Novapagina;

     vpag := vpag + 1;

     linha := 2;
     dtmSugestaoCompras.RDprintSugestao.ImpF(linha, 1, 'PEDIDO DE COMPRA', [normal, negrito]);
     linha := linha + 1;
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 01, 'EMITENTE...: ' + vDadosIni.vEmp.vnomeEmpresa + ' - CNPJ: ' +  vDadosIni.vEmp.vCNPJ, [comp17]);
     linha := linha + 1;
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 01, 'FORNECEDOR.: ' + trim(buscas.FieldByName('NOME_CLIENTE').AsString) , [comp17]);
     linha := linha + 1;
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 1,  'ENDERECO...: ' + trim(buscas.FieldByName('ENDERECO').AsString) + ',' + trim(buscas.FieldByName('NUM_END_CLIENTE').AsString), [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 90, 'CEP......: ' + copy(buscas.FieldByName('CEP').AsString, 1, 5) + '-' + copy(buscas.FieldByName('CEP').AsString, 6, 3), [comp17]);
     linha := linha + 1;
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 01, 'CIDADE/UF..: ' + trim(buscas.FieldByName('CIDADE').AsString) + '/' + trim(buscas.FieldByName('SIGLA_UF').AsString), [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 48, 'Cond.Pag.: ' + vCondPag, [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 90, 'BAIRRO...: ' + trim(buscas.FieldByName('BAIRRO').AsString), [comp17]);
     linha := linha + 1;
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 1,  'CGC/CPF....: ' + trim(buscas.FieldByName('CPFCGC').AsString), [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 48, 'INSC.....: ' + trim(buscas.FieldByName('INSC_EST').AsString), [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 90, 'RESP.....: ' + vNomeVendedor, [comp17]);
     linha := linha + 1;
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 1,  'TELEF......: ' + buscas.FieldByName('FONE_CLIENTE').AsString, [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 90, 'NUM PED..: ' + vDadosIni.StrZero(dataSet.FieldByName('NUM_PED').AsInteger, 7), [comp17]);
     linha := linha + 1;
     dtmSugestaoCompras.RDprintSugestao.ImpF(linha, 140, 'PAG: ' + vDadosIni.StrZero(vpag, 3), [Negrito]);
     linha := linha + 1;
     separador(linha, 2);
     linha := linha + 1;
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 2, 'ITEM', [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 9, 'NUM. PROD', [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 21, 'DESCRICAO', [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 76, 'QTDE', [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 85, 'PRECO UNT.', [comp17]);
     dtmSugestaoCompras.RDprintSugestao.Impf(linha, 97, 'PRECO TOTAL', [comp17]);

     if pImprimirMvaIpiFrete then
     begin
       dtmSugestaoCompras.RDprintSugestao.Impf(linha, 114, 'ST', [comp17]);
       dtmSugestaoCompras.RDprintSugestao.Impf(linha, 127, 'IPI', [comp17]);
       dtmSugestaoCompras.RDprintSugestao.Impf(linha, 139, 'FRETE', [comp17]);
     end
     else if pImprimirLocPeso then
     begin
     	 dtmSugestaoCompras.RDprintSugestao.Impf(linha, 112, 'LOCACAO', [comp17]);
       dtmSugestaoCompras.RDprintSugestao.Impf(linha, 125, 'LOCACAO 1', [comp17]);
       dtmSugestaoCompras.RDprintSugestao.Impf(linha, 139, 'PESO BR', [comp17]);
       dtmSugestaoCompras.RDprintSugestao.Impf(linha, 150, 'PESO LIQ', [comp17]);
     end;
     Linhas;
     linha := linha + 1;
     separador(linha, 1);
  end;
begin
  if not vDadosIni.ModImp(dtmSugestaoCompras.RDprintSugestao) then
    exit;
  dtmSugestaoCompras.RDprintSugestao.FonteTamanhoPadrao := S17cpp;
  if pImprimirMvaIpiFrete then
	  dtmSugestaoCompras.RDprintSugestao.TamanhoQteColunas := 150
  else if pImprimirLocPeso then
	  dtmSugestaoCompras.RDprintSugestao.TamanhoQteColunas := 160;
  dtmSugestaoCompras.RDprintSugestao.CaptionSetup := 'Configurações de Impressão';
  dtmSugestaoCompras.RDprintSugestao.OpcoesPreview.CaptionPreview := 'Pedido de Compra';
  dtmSugestaoCompras.RDprintSugestao.TitulodoRelatorio := 'Pedido de Compra';
  vDadosIni._LimparVarSendEmail;
  dtmSugestaoCompras.RDprintSugestao.OnSendMail := vDadosini._SendMailRdPrint;
  dtmSugestaoCompras.RDprintSugestao.OpcoesPreview.Preview := true;

  vDadosIni._LimparVarSendEmail;
  dtmSugestaoCompras.RDprintSugestao.OnSendMail :=nil;
  dtmSugestaoCompras.RDprintSugestao.OnSendMail := _rdPedidoSendMail;

  vpag := 0;
  vqtdeP := true;
  vtotProd := true;
  vtotpedcimp := true;
  vtotfrete := true;
  vtotpedsimp := true;

  abreItemPedidoCompra(dataset.FieldByName('NUM_PED').asinteger);
  if not dtmSugestaoCompras.RDprintSugestao.EstaAberto then
   dtmSugestaoCompras.RDprintSugestao.Abrir;
  CabNovaPagina; //cabeçalho

  try
     Screen.Cursor := crHourGlass;
  finally
     Screen.Cursor := crDefault;
  end;

  vPecastot     := 0;
  vFretetot     := 0;
  vComImposto   := 0;
  vSemImposto   := 0;
  vProdutostot  := 0;
  vPesoBrTotal  := 0;
  vPesoLiqTotal := 0;
  vNumDocs := TStringList.Create;
  try
  	vItemPedido.dataSet.DisableControls;
    vItemPedido.dataSet.First;
    while not vItemPedido.dataSet.eof do
    begin
    	vPesoBrTotal := vPesoBrTotal + vItemPedido.dataSet.FieldByName('PESO_BRUT_PROD').AsFloat;
      vPesoLiqTotal := vPesoLiqTotal + vItemPedido.dataSet.FieldByName('PESO_LIQ_PROD').AsFloat;

      if vItemPedido.dataSet.FieldByName('MVA').AsFloat > 0 then
        vMva := vItemPedido.dataSet.FieldByName('VALOR_ICMSUB').AsFloat
      else
        vMva := 0;

     if vItemPedido.dataSet.FieldByName('PERC_FRETE').AsFloat > 0 then
       vFrete := ((vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsFloat / 100) * vItemPedido.dataSet.FieldByName('PERC_FRETE').AsFloat)
      else
       vFrete := vItemPedido.dataSet.FieldByName('FRETE').AsFloat;

  //    if vItemPedido.dataSet.FieldByName('PERC_IPI').AsFloat > 0 then
  //    begin
  //      if dataSet.FieldByName('FRETE_BASE_IPI').AsString = 'S' then
  //        vIPI := (((vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsFloat + vFrete) / 100) * vItemPedido.dataSet.FieldByName('PERC_IPI').AsFloat)
  //      else
  //        vIPI := ((vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsFloat / 100) * vItemPedido.dataSet.FieldByName('PERC_IPI').AsFloat)
  //    end
  //    else
  //      vIPI := vItemPedido.dataSet.FieldByName('IPI').AsFloat;

      if vItemPedido.dataSet.FieldByName('IPI').AsFloat > 0 then
        vIPI := vItemPedido.dataSet.FieldByName('IPI').AsFloat
      else
        vIPI := 0;


      vPecastot := vPecastot + vItemPedido.dataSet.FieldByName('QUANT_IT_PROD').AsFloat;
      vComImposto := vComImposto + vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsFloat + vMva + vIPI + vFrete;
      vSemImposto := vSemImposto + vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsFloat + vFrete;
      vFretetot := vFretetot + vFrete;
      vProdutostot := vProdutostot + vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsFloat;

      Application.ProcessMessages;
      linha := linha + 1;
      Linhas;
      dtmSugestaoCompras.RDprintSugestao.Imp(linha, 002, vItemPedido.dataSet.FieldByName('NITEM').AsString);
      dtmSugestaoCompras.RDprintSugestao.Imp(linha, 009, vItemPedido.dataSet.FieldByName('GRUPO_PROD').AsString +' '+ trim(vItemPedido.dataSet.FieldByName('COD_PROD').AsString));
      dtmSugestaoCompras.RDprintSugestao.Imp(linha, 020, copy(trim(vItemPedido.dataSet.FieldByName('DESCR_PROD').AsString), 1, 52));
      dtmSugestaoCompras.RDprintSugestao.ImpD(linha, 083, format('%8.3f', [vItemPedido.dataSet.FieldByName('QUANT_IT_PROD').AsFloat]), [comp17]);
      dtmSugestaoCompras.RDprintSugestao.ImpD(linha, 096,  format('%8.2f', [vItemPedido.dataSet.FieldByName('VAL_UNT_IT').AsFloat]), [comp17]);
      dtmSugestaoCompras.RDprintSugestao.ImpD(linha, 109, format('%8.2f', [vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsFloat]), [comp17]);
      if pImprimirMvaIpiFrete then
      begin
        dtmSugestaoCompras.RDprintSugestao.ImpD(linha, 122, format('%8.2f', [vMva]), [comp17]);
        dtmSugestaoCompras.RDprintSugestao.ImpD(linha, 135, format('%8.2f', [vIPI]), [comp17]);
        dtmSugestaoCompras.RDprintSugestao.ImpD(linha, 148, format('%8.2f', [vFrete]), [comp17]);
      end
      else if pImprimirLocPeso then
      begin
      	if trim(vItemPedido.dataSet.FieldByName('LOCACAO_PROD').AsString) <> '' then
					dtmSugestaoCompras.RDprintSugestao.ImpD(linha, 121, FormatMaskText(vDadosIni.vMascaraLocacao, trim(vItemPedido.dataSet.FieldByName('LOCACAO_PROD').AsString)), [comp17]);
        if trim(vItemPedido.dataSet.FieldByName('LOCACAO_PROD_1').AsString) <> '' then
	        dtmSugestaoCompras.RDprintSugestao.ImpD(linha, 134, FormatMaskText(vDadosIni.vMascaraLocacao, trim(vItemPedido.dataSet.FieldByName('LOCACAO_PROD_1').AsString)), [comp17]);
        if vItemPedido.dataSet.FieldByName('PESO_BRUT_PROD').AsFloat > 0 then
	        dtmSugestaoCompras.RDprintSugestao.ImpD(linha, 148, format('%8.2f', [vItemPedido.dataSet.FieldByName('PESO_BRUT_PROD').AsFloat]), [comp17]);
        if vItemPedido.dataSet.FieldByName('PESO_LIQ_PROD').AsFloat > 0 then
	        dtmSugestaoCompras.RDprintSugestao.ImpD(linha, 159, format('%8.2f', [vItemPedido.dataSet.FieldByName('PESO_LIQ_PROD').AsFloat]), [comp17]);
      end;
      vItemPedido.Next;
      if linha >= 65 then
      begin
        linha := 1;
        dtmSugestaoCompras.RDprintSugestao.Novapagina;
        CabNovaPagina;
      end;
    end;
  finally
    vItemPedido.dataSet.First;
    vItemPedido.dataSet.EnableControls;
  end;

  linha := linha + 1;
  separador(linha, 2);
  linha := linha + 1;


  vNumDocs.Clear;

  if Trim(dataSet.FieldByName('FORMPAG').AsString) <> '' then
  begin
  vNumDocs.Text := dataSet.FieldByName('FORMPAG').AsString;
  vNumDocs.Count;

   for I := 0 to vNumDocs.Count - 1 do
   begin
     if not Odd(I) then
     begin
       linha := linha + 1;
       if I = 0 then
       begin
        vqtdeP := false;
        dtmSugestaoCompras.RDprintSugestao.impf(linha, 1, 'QTDE PECAS..............: ' + VdadosIni.alndir(format('%8.3f', [vPecastot]), 8), [normal])
       end
       else if I = 2 then
       begin
        vtotProd := false;
        dtmSugestaoCompras.RDprintSugestao.impf(linha, 1, 'TOTAL PRODUTOS..........: ' + VdadosIni.alndir(format('%8.2f', [vProdutostot]),  12), [normal])
       end
       else if I = 4 then
       begin
        vtotfrete := false;
        dtmSugestaoCompras.RDprintSugestao.impf(linha, 1, 'TOTAL FRETE.............: ' + VdadosIni.alndir(format('%8.2f', [vFretetot]),  12), [normal])
       end
       else if I = 6 then
       begin
        vtotpedsimp := false;
        dtmSugestaoCompras.RDprintSugestao.impf(linha, 1, 'TOTAL PEDIDO S/IMPOSTO..: ' + VdadosIni.alndir(format('%8.2f', [vSemImposto]),  12), [normal]);
       end
       else if I = 8 then
       begin
        vtotpedcimp := false;
        dtmSugestaoCompras.RDprintSugestao.impf(linha, 1, 'TOTAL PEDIDO C/IMPOSTO..: ' + VdadosIni.alndir(format('%8.2f', [vComImposto]),  12), [normal])
       end;

       dtmSugestaoCompras.RDprintSugestao.Impf(linha, 75, vNumDocs[I], [comp20]);
     end
     else
       dtmSugestaoCompras.RDprintSugestao.Impf(linha, 117, vNumDocs[I], [comp20]);
     if (linha >= 65) and (Odd(I)) then
     begin
      linha := 1;
      CabNovaPagina;
     end;
   end;

   if vtotProd then
   begin
    linha := linha + 1;
    dtmSugestaoCompras.RDprintSugestao.impf(linha, 1, 'TOTAL PRODUTOS..........: ' + VdadosIni.alndir(format('%8.2f', [vProdutostot]),  12), [normal]);
   end;
   if vtotfrete then
   begin
    linha := linha + 1;
    dtmSugestaoCompras.RDprintSugestao.impf(linha, 1, 'TOTAL FRETE.............: ' + VdadosIni.alndir(format('%8.2f', [vFretetot]),  12), [normal])
   end;
   if vtotpedsimp then
   begin
    linha := linha + 1;
    dtmSugestaoCompras.RDprintSugestao.impf(linha, 1, 'TOTAL PEDIDO S/IMPOSTO..: ' + VdadosIni.alndir(format('%8.2f', [vSemImposto]),  12), [normal]);
   end;
   if vtotpedcimp then
   begin
    linha := linha + 1;
    dtmSugestaoCompras.RDprintSugestao.impf(linha, 1, 'TOTAL PEDIDO C/IMPOSTO..: ' + VdadosIni.alndir(format('%8.2f', [vComImposto]),  12), [normal])
   end;

  end
  else
  begin
    dtmSugestaoCompras.RDprintSugestao.impf(linha, 1, 'QTDE PECAS..............: ' + VdadosIni.alndir(format('%8.3f', [vPecastot]), 8), [normal]);
    linha := linha + 1;

    if pImprimirLocPeso then
    begin
    	dtmSugestaoCompras.RDprintSugestao.impf(linha, 1, 'TOTAL PESO BR...........: ' + VdadosIni.alndir(format('%8.2f', [vPesoBrTotal]),  12), [normal]);
      linha := linha + 1;
      dtmSugestaoCompras.RDprintSugestao.impf(linha, 1, 'TOTAL PESO LIQ..........: ' + VdadosIni.alndir(format('%8.2f', [vPesoLiqTotal]),  12), [normal]);
      linha := linha + 1;
    end;

    dtmSugestaoCompras.RDprintSugestao.impf(linha, 1, 'TOTAL PRODUTOS..........: ' + VdadosIni.alndir(format('%8.2f', [vProdutostot]),  12), [normal]);
    linha := linha + 1;
    dtmSugestaoCompras.RDprintSugestao.impf(linha, 1, 'TOTAL FRETE.............: ' + VdadosIni.alndir(format('%8.2f', [vFretetot]),  12), [normal]);
    linha := linha + 1;
    dtmSugestaoCompras.RDprintSugestao.impf(linha, 1, 'TOTAL PEDIDO S/IMPOSTO..: ' + VdadosIni.alndir(format('%8.2f', [vSemImposto]),  12), [normal]);
    linha := linha + 1;
    dtmSugestaoCompras.RDprintSugestao.impf(linha, 1, 'TOTAL PEDIDO C/IMPOSTO..: ' + VdadosIni.alndir(format('%8.2f', [vComImposto]),  12), [normal]);
  end;

  AObs := TStringList.Create;
  AObs.Text := dataSet.FieldByName('OBS').AsString;
  try
    if (Trim(AObs.Text) <> '') then
    begin
      Linha := linha + 2;
    end;
    if (Trim(AObs.Text) <> '') and (AObs.Count > 0) and (linha + AObs.Count >= 65) then
    begin
      linha := 1;
      CabNovaPagina;
    end;
    if (Trim(AObs.Text) <> '') and (AObs.Count > 0) then
      for I := 0 to AObs.Count - 1 do
      begin
        if I = 0 then
          dtmSugestaoCompras.RDprintSugestao.Impf(linha, 01, 'Observação.: ', [comp17, negrito])
        else if (linha >= 65) then
        begin
          linha := 1;
          CabNovaPagina;
        end;
        dtmSugestaoCompras.RDprintSugestao.Impf(linha, 14, AObs[I], [comp17]);
        Linha := linha + 1;
      end;
  finally
    FreeAndNil(AObs);
  end;

  vNumDocs.Free;
  vNumDocs := nil;

   if dtmSugestaoCompras.RDprintSugestao.EstaAberto then
      dtmSugestaoCompras.RDprintSugestao.Fechar;

end;

function TPedidoCompra.insert: boolean;
begin
  Result := false;
  try
    if not dataSet.Active then
      montaSelect(' select pedido.*, clientes.nome_cliente, clientes.razao, ' +
  	  	' clientes.endereco, clientes.fone_cliente, clientes.email, ' +
	      ' cidades.nome_cidade, localidade.localidade, setor.setor from pedido ' +
        ' left join clientes on clientes.cod_cliente = pedido.codigo_f and clientes.cod_empresa = pedido.cod_empresa ' +
    	  ' left join cidades on cidades.cod_cidade = clientes.cod_cidade ' +
  	    ' left join localidade on localidade.cod_localidade = clientes.cod_localidade and localidade.cod_empresa = clientes.cod_empresa ' +
	      ' left join setor on setor.cod_setor = localidade.cod_setor and setor.cod_empresa = localidade.cod_empresa ' +
      	' where pedido.num_ped = 0 and pedido.cod_empresa = 0');
    if inherited insert then
    begin
      dataSet.FieldByName('NUM_PED').AsInteger := 0;
      dataSet.FieldByName('TIPO_PED').AsString := 'NORMAL';
      dataSet.FieldByName('DATA_ENV_PED').AsDateTime := vDadosIni.getDataBanco(buscas);
      dataSet.FieldByName('DATA_PED').AsDateTime := vDadosIni.getDataBanco(buscas);
      dataSet.FieldByName('COD_EMPRESA').AsInteger := strtoint(vDadosIni.codEmpresa);
      dataSet.FieldByName('FRETE_BASE_IPI').AsString := 'N';
      dataSet.FieldByName('IPI_BASE_ICM').AsString := 'N';
      dataSet.FieldByName('ATIVO').AsInteger := 1;
      abreItemPedidoCompra(dataset.FieldByName('NUM_PED').asinteger);
      abreVendedor;
      abreFornecedor;
      vCondPedido.abreCondPag;
      Result := true;
    end;
  except
    on e: exception do
    begin
      Result := False;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TPedidoCompra.marcarItemComoRecebido: Boolean;
begin
  try
    Result := False;

    if not vDadosIni.PesqPros('SUG026', 'MARCAR', 'PED/NUM ' +
      fPendencias.dataSet.FieldByName('Pedido').AsString + '/' +
      fPendencias.dataSet.FieldByName('N Item').AsString,
      'ITEM_PEDIDO', fPendencias.dataSet.FieldByName('Pedido').AsString, buscas) then
      exit;

    if Application.MessageBox('Deseja mesmo marcar o item do pedido como recebido?', 'Confirmação',
      MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
      Exit;

    buscas.Close;
    buscas.SQL.Text := 'update item_pedido set recebido = ''S''' +
      ' where num_ped = ' + IntToStr(fPendencias.dataSet.FieldByName('Pedido').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and nitem = ' + IntToStr(fPendencias.dataSet.FieldByName('N Item').AsInteger);
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
       buscas.Transaction.Commit;

    vDadosIni.GravaAuditoria('SUG026', 'MARCAR', 'SUCESSO', 'ITEM_PEDIDO', '', buscas);

    Result := True;

    fPendencias.Refresh;

  except
    on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(PChar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TPedidoCompra.marcarItemComoRecebido. Erro: ' + e.Message);
    end;
  end;
end;

function TPedidoCompra.marcarPedidoComoRecebido: Boolean;
begin
  try
    Result := False;

    if not vDadosIni.PesqPros('SUG027', 'MARCAR', 'PEDNUM ' +
      dataSet.FieldByName('num_ped').AsString,
      'PEDIDO', dataSet.FieldByName('num_ped').AsString, buscas) then
      exit;

    if Application.MessageBox('Deseja mesmo marcar todos os itens do pedido como recebido?', 'Confirmação',
      MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) <> IDYES then
      Exit;

    buscas.Close;
    buscas.SQL.Text := 'update item_pedido set recebido = ''S''' +
      ' where num_ped = ' + IntToStr(dataSet.FieldByName('num_ped').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.ExecSQL;

    if buscas.Transaction.InTransaction then
       buscas.Transaction.Commit;

    vDadosIni.GravaAuditoria('SUG027', 'MARCAR', 'SUCESSO', 'PEDIDO', '', buscas);

    Result := True;

    dataSet.Refresh;

  except
    on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(PChar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro('function TPedidoCompra.marcarPedidoComoRecebido. Erro: ' + e.Message);
    end;
  end;
end;

function TPedidoCompra.MontarArquivoPedido(caminhoArquivo: string): boolean;
var
  Arq: TextFile;
  NomeArq: string;
begin
  result := false;
  try
    NomeArq := caminhoArquivo;
    AssignFile(Arq, NomeArq);
  //  if not FileExists(NomeArq) then
    Rewrite(arq);
//    else
  //    append(arq);
  except
    Application.MessageBox('Problema com o arquivo verifique caminho/ou Arquivo Bloqueado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    closeFile(arq);
    exit;
  end;
  try
    if abreItemPedidoCompra(dataset.FieldByName('NUM_PED').asinteger) then
    begin
      vDadosIni.auxstr := vDadosIni.space(26);
      try
      	vItemPedido.dataSet.DisableControls;
        vItemPedido.dataSet.First;
        while not vItemPedido.dataSet.eof do
        begin
          //        vDadosIni.MontaLinha(1, vDadosIni.StrZero(vItemPedido.dataSet.FieldByName('NUM_PED').AsInteger, 5));
          vDadosIni.MontaLinha(1, vItemPedido.dataSet.FieldByName('NUM_FAB_PROD').AsString);
          vDadosIni.MontaLinha(21, vDadosIni.StrZero(vItemPedido.dataSet.FieldByName('QUANT_IT_PROD').asinteger, 6));
          WriteLn(arq, vDadosIni.auxstr);
          vDadosIni.limpaLinha(vDadosIni.AuxStr);
          vItemPedido.next;
        end;
      finally
        vItemPedido.dataSet.EnableControls;
      end;
      closeFile(arq);
      Application.MessageBox('Montagem Concluida com Sucesso.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      vItemPedido.Close;
      result := true;
    end;
  except
    Application.MessageBox('Problema com o arquivo verifique caminho/ou Arquivo Bloqueado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

function TPedidoCompra.MontarArquivoPedidoHw(caminhoArquivo: string): boolean;
var
  Arq: TextFile;
  NomeArq: string;
  vLinha: string;
begin
  result := false;
  try
    NomeArq := caminhoArquivo;
    AssignFile(Arq, NomeArq);
//    if not FileExists(NomeArq) then
    Rewrite(arq);
//    else
//      append(arq);
  except
    Application.MessageBox('Problema com o arquivo verifique caminho/ou Arquivo Bloqueado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    closeFile(arq);
    exit;
  end;
  try
    if abreItemPedidoCompra(dataset.FieldByName('NUM_PED').asinteger) then
    begin

      vLinha := '|HW|0|'; //1//2
      WriteLn(arq, vLinha);
//      vLinha := '|PEDIDO|';
//      vLinha := vLinha + dataSet.FieldByName('NUM_PED').AsString+'|';
//      vLinha := vLinha + vDadosIni.codEmpresa+'|';
//      vLinha := vLinha + StringReplace(
//        FormatDateTime('DD/MM/YYYY',dataSet.FieldByName('DATA_ENV_PED').AsDateTime),'/','',[rfReplaceAll])+'|';
//      vLinha := vLinha + Format('%0.2f',[dataSet.FieldByName('VAL_TOT_PED').AsFloat])+'|';
//      vLinha := vLinha + vDadosIni.vEmp.vnomeEmpresa+'|';
//      WriteLn(arq, vLinha);

    	try
      	vItemPedido.dataSet.DisableControls;
        vItemPedido.dataSet.First;
        while not vItemPedido.dataSet.eof do
        begin
          vLinha := '|ITEM_PEDIDO|'; //1
          vLinha := vLinha + dataSet.FieldByName('NUM_PED').AsString + '|'; //2
          vLinha := vLinha + vItemPedido.dataSet.FieldByName('NITEM').AsString + '|'; //3
          vLinha := vLinha + vItemPedido.dataSet.FieldByName('GRUPO_PROD').AsString + '|'; //4
          vLinha := vLinha + Trim(vItemPedido.dataSet.FieldByName('COD_PROD').AsString) + '|'; //5
          vLinha := vLinha + Trim(retornaValor('SELECT NUM_FAB_PROD AS VALOR FROM PRODUTOS WHERE GRUPO_PROD = ' +
            IntToStr(vItemPedido.dataSet.FieldByName('GRUPO_PROD').AsInteger) +
            ' AND COD_PROD = ' + QuotedStr(vItemPedido.dataSet.FieldByName('COD_PROD').AsString) +
            ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa)) + '|'; //6
          vLinha := vLinha + Trim(vItemPedido.dataSet.FieldByName('DESCR_PROD').AsString) + '|'; //7
          vLinha := vLinha + Format('%0.6f', [vItemPedido.dataSet.FieldByName('QUANT_IT_PROD').AsFloat]) + '|'; //8
          vLinha := vLinha + Format('%0.4f', [vItemPedido.dataSet.FieldByName('VAL_UNT_IT').AsFloat]) + '|'; //9
          vLinha := vLinha + StringReplace(
            FormatDateTime('DD/MM/YYYY', dataSet.FieldByName('DATA_ENV_PED').AsDateTime), '/', '', [rfReplaceAll]) + '|'; //10
          vLinha := vLinha + vDadosIni.codEmpresa + '|'; //11
          vLinha := vLinha + vDadosIni.vEmp.vCNPJ + '|'; //12
          vLinha := vLinha + vDadosIni.vEmp.vnomeEmpresa + '|'; //13
          WriteLn(arq, vLinha);
          vItemPedido.dataSet.Next;
        end;
      finally
        vItemPedido.dataSet.EnableControls;
      end;
      closeFile(arq);
      Application.MessageBox('Montagem Concluida com Sucesso.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      vItemPedido.Close;
      result := true;
    end;
  except
    Application.MessageBox('Problema com o arquivo verifique caminho/ou Arquivo Bloqueado', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
  end;
end;

function TPedidoCompra.MontarPedido: boolean;
var
  I: Integer;
  gradeTemp, gradeDescTemp: string;
begin
  result := False;
  gridsugestao := FrmSugestaoCompra.StGradS;
  for i := 1 to gridsugestao.RowCount - 1 do
  begin
  	if (Trim(gridsugestao.cells[12, I]) <> '') and (Trim(gridsugestao.cells[13, I]) <> '') then
    begin
      if gridsugestao.cells[9, i] = 'SEL' then
      begin
        if trim(gridsugestao.cells[15, I]) = '' then
        begin
          gradeTemp := '0';
          if trim(FrmSugestaoCompra.StGradS.cells[16, I]) = '' then
            gradeDescTemp := 'SEM GRADE'
          else
            gradeDescTemp := trim(FrmSugestaoCompra.StGradS.cells[16, I]);
        end
        else
        begin
          gradeTemp := trim(gridsugestao.cells[15, I]);
          if trim(FrmSugestaoCompra.StGradS.cells[16, I]) = '' then
            gradeDescTemp := 'SEM GRADE'
          else
	          gradeDescTemp := trim(FrmSugestaoCompra.StGradS.cells[16, I]);
        end;

        buscas.Close;
        buscas.SQL.Text := ' select VL_ULT_COMPRA, NUM_FAB_PROD, DESCR_PROD,' +
          ' PREC_TAB_PROD, PREC_PUBLICO, CUSTO_HONDA, PREC_CUS_PROD from produtos ' +
          ' where grupo_prod = ' + trim(gridsugestao.cells[12, I]) +
          ' and cod_prod = ' + quotedstr(trim(gridsugestao.cells[13, I])) +
          ' and cod_empresa = ' + vDadosIni.codEmpresa +
          ' and ativo = 1';
        buscas.Open;
        if not buscas.IsEmpty then
        begin
          if vItemPedido.insert then
          begin
            Result := true;
            vItemPedido.dataSet.FieldByName('NUM_PED').AsInteger := 0;
            vItemPedido.dataSet.FieldByName('GRUPO_PROD').AsInteger := strtoint(trim(gridsugestao.cells[12, I]));
            vItemPedido.dataSet.FieldByName('COD_PROD').Asstring := trim(gridsugestao.cells[13, I]);
            vItemPedido.dataSet.FieldByName('COD_EMPRESA').AsInteger := strtoint(vDadosIni.codEmpresa);
            vItemPedido.dataSet.FieldByName('COD_GRADE').AsInteger := strtoint(gradeTemp);
            vItemPedido.dataSet.FieldByName('QUANT_IT_PROD').AsFloat := strtofloat(trim(gridsugestao.cells[7, I]));
            if vDadosIni.vEmp.vConcess = 'S' then
            begin
              vItemPedido.dataSet.FieldByName('VL_V_EMP').AsFloat := buscas.FieldByName('PREC_TAB_PROD').AsFloat;
              vItemPedido.dataSet.FieldByName('VL_V_HONDA').AsFloat := buscas.FieldByName('PREC_PUBLICO').AsFloat;
              vItemPedido.dataSet.FieldByName('VAL_UNT_IT').AsFloat := buscas.FieldByName('CUSTO_HONDA').AsFloat;
            end
            else
            begin
              vItemPedido.dataSet.FieldByName('VL_V_EMP').AsFloat := 0;
              vItemPedido.dataSet.FieldByName('VL_V_HONDA').AsFloat := 0;
              if buscas.FieldByName('VL_ULT_COMPRA').asfloat = 0 then
                vItemPedido.dataSet.FieldByName('VAL_UNT_IT').AsFloat := buscas.FieldByName('PREC_CUS_PROD').AsFloat
              else
                vItemPedido.dataSet.FieldByName('VAL_UNT_IT').AsFloat := buscas.FieldByName('VL_ULT_COMPRA').AsFloat;
            end;
            vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsFloat := (strtofloat(trim(gridsugestao.cells[7, I]))) * vItemPedido.dataSet.FieldByName('VAL_UNT_IT').AsFloat;
            vItemPedido.dataSet.FieldByName('NUM_FAB_PROD').AsString := buscas.FieldByName('NUM_FAB_PROD').AsString;
            vItemPedido.dataSet.FieldByName('DESCR_PROD').AsString := Copy(trim(buscas.FieldByName('DESCR_PROD').AsString) +
            	vDadosIni.IfThen(StrToInt(gradeTemp) > 0, vDadosIni.IfThen(trim(gradeDescTemp) <> '', ' ' + trim(gradeDescTemp), ''), ''), 1, 60);
            vItemPedido.dataSet.FieldByName('NITEM').AsInteger := vItemPedido.dataSet.RecordCount + 1;
            vItemPedido.dataSet.Post;
          end;
          buscas.Next;
        end;
      end;
    end;
  end;
  
  result := true;
end;

function TPedidoCompra.MontarPedido2: boolean;
begin
	result := False;

	dataSet.FieldByName('CODIGO_F').AsInteger := vDadosIni.fTempPedidoCompra.FieldByName('CODIGO_F').AsInteger;
  dataSet.FieldByName('COD_VENDEDOR').AsInteger := vDadosIni.fTempPedidoCompra.FieldByName('COD_VENDEDOR').AsInteger;
  dataSet.FieldByName('COD_COND_PAG').AsInteger := vDadosIni.fTempPedidoCompra.FieldByName('COD_COND_PAG').AsInteger;
  dataSet.FieldByName('TIPO_PED').AsString := vDadosIni.fTempPedidoCompra.FieldByName('TIPO_PED').AsString;

	vDadosIni.fTempItemPedidoCompra.First;
  while not vDadosIni.fTempItemPedidoCompra.Eof do
  begin
  	buscas.Close;
    buscas.SQL.Text := ' select VL_ULT_COMPRA, NUM_FAB_PROD, DESCR_PROD,' +
      ' PREC_TAB_PROD, PREC_PUBLICO, CUSTO_HONDA, PREC_CUS_PROD from produtos ' +
      ' where grupo_prod = ' + IntToStr(vDadosIni.fTempItemPedidoCompra.FieldByName('GRUPO_PROD').AsInteger) +
      ' and cod_prod = ' + quotedstr(trim(vDadosIni.fTempItemPedidoCompra.FieldByName('COD_PROD').AsString)) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ativo = 1';
    buscas.Open;
    if not buscas.IsEmpty then
    begin
      if vItemPedido.insert then
      begin
        Result := true;
        vItemPedido.dataSet.FieldByName('NUM_PED').AsInteger := 0;
        vItemPedido.dataSet.FieldByName('GRUPO_PROD').AsInteger := vDadosIni.fTempItemPedidoCompra.FieldByName('GRUPO_PROD').AsInteger;
        vItemPedido.dataSet.FieldByName('COD_PROD').Asstring := vDadosIni.fTempItemPedidoCompra.FieldByName('COD_PROD').AsString;
        vItemPedido.dataSet.FieldByName('COD_EMPRESA').AsInteger := strtoint(vDadosIni.codEmpresa);
        vItemPedido.dataSet.FieldByName('COD_GRADE').AsInteger := vDadosIni.fTempItemPedidoCompra.FieldByName('COD_GRADE').AsInteger;
        vItemPedido.dataSet.FieldByName('QUANT_IT_PROD').AsFloat := vDadosIni.fTempItemPedidoCompra.FieldByName('QUANT_IT_PROD').AsFloat;
        if vDadosIni.vEmp.vConcess = 'S' then
        begin
          vItemPedido.dataSet.FieldByName('VL_V_EMP').AsFloat := buscas.FieldByName('PREC_TAB_PROD').AsFloat;
          vItemPedido.dataSet.FieldByName('VL_V_HONDA').AsFloat := buscas.FieldByName('PREC_PUBLICO').AsFloat;
          vItemPedido.dataSet.FieldByName('VAL_UNT_IT').AsFloat := buscas.FieldByName('CUSTO_HONDA').AsFloat;
        end
        else
        begin
          vItemPedido.dataSet.FieldByName('VL_V_EMP').AsFloat := 0;
          vItemPedido.dataSet.FieldByName('VL_V_HONDA').AsFloat := 0;
          if buscas.FieldByName('VL_ULT_COMPRA').AsFloat = 0 then
            vItemPedido.dataSet.FieldByName('VAL_UNT_IT').AsFloat := buscas.FieldByName('PREC_CUS_PROD').AsFloat
          else
            vItemPedido.dataSet.FieldByName('VAL_UNT_IT').AsFloat := buscas.FieldByName('VL_ULT_COMPRA').AsFloat;
        end;
        vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsFloat :=
        	vItemPedido.dataSet.FieldByName('QUANT_IT_PROD').AsFloat * vItemPedido.dataSet.FieldByName('VAL_UNT_IT').AsFloat;
        vItemPedido.dataSet.FieldByName('NUM_FAB_PROD').AsString := buscas.FieldByName('NUM_FAB_PROD').AsString;
        vItemPedido.dataSet.FieldByName('DESCR_PROD').AsString := buscas.FieldByName('DESCR_PROD').AsString;
        vItemPedido.dataSet.FieldByName('NITEM').AsInteger := vItemPedido.dataSet.RecordCount + 1;
        vItemPedido.dataSet.FieldByName('COD_SUGESTAO').AsInteger := vDadosIni.fTempItemPedidoCompra.FieldByName('COD_SUGESTAO').AsInteger;
        vItemPedido.dataSet.FieldByName('COD_EMP_MULT').AsInteger := vDadosIni.fTempItemPedidoCompra.FieldByName('COD_EMP_MULT').AsInteger;
        vItemPedido.dataSet.Post;
      end;
      buscas.Next;
    end;

  	vDadosIni.fTempItemPedidoCompra.Next;
  end;

  result := true;
end;

function TPedidoCompra.post: boolean;
var
	vErroItens: boolean;
  statusDataset: string;
  valor: currency;
begin
  try
    Result := false;

    vErroItens := false;

    if dataSet.State = dsEdit then
      statusDataset := 'E'
    else
      statusDataset := 'I';
    if (trim(LFornecedor.buscas.FieldByName('NOME_CLIENTE').AsString) = '') or (dataSet.FieldByName('CODIGO_F').AsInteger = 0) then
	    raiseExceptionCreate('Fornecedor não informado.', 'DBEdit2');

    if (trim(LVendedor.buscas.FieldByName('NOME_VENDEDOR').AsString) = '') or (dataSet.FieldByName('COD_VENDEDOR').AsInteger = 0) then
      raiseExceptionCreate('Vendedor não informado.', 'DBLookupComboBox1');

    if trim(dataSet.FieldByName('TIPO_PED').AsString) = '' then
    	raiseExceptionCreate('Tipo do pedido não informada.', 'DBComboBox1');

    if (dataSet.FieldByName('COD_COND_PAG').AsInteger <= 0) then
      raiseExceptionCreate('Cond. Pag não informada.', 'DBEdit14');

    if not vCondPedido.existeCondPag(dataSet.FieldByName('COD_COND_PAG').AsInteger) then
      raiseExceptionCreate('Cond. Pag não encontrada.', 'DBEdit14');

    try
    	vItemPedido.dataSet.DisableControls;
      vItemPedido.dataSet.First;
      while not vItemPedido.dataSet.Eof do
      begin
        if (vItemPedido.dataSet.FieldByName('QUANT_IT_PROD').Asfloat <= 0) then
        begin
        	vErroItens := true;
          raiseExceptionCreate(
          	'Item nº ' + IntToStr(vItemPedido.dataSet.recno) + #13 + #13 +
          	'Grupo Prod: ' + IntToStr(vItemPedido.dataSet.FieldByName('GRUPO_PROD').AsInteger) + #13 +
            'Cod Prod: ' + trim(vItemPedido.dataSet.FieldByName('COD_PROD').AsString) + #13 +
            'Descrição: ' + trim(vItemPedido.dataSet.FieldByName('DESCR_PROD').AsString) + #13 + #13 +
          	'Quantidade não informada.', 'DBEdit16');
        end;

        if (vItemPedido.dataSet.FieldByName('VAL_UNT_IT').Asfloat <= 0) then
        begin
        	vErroItens := true;
          raiseExceptionCreate(
          	'Item nº ' + IntToStr(vItemPedido.dataSet.recno) + #13 + #13 +
          	'Grupo Prod: ' + IntToStr(vItemPedido.dataSet.FieldByName('GRUPO_PROD').AsInteger) + #13 +
            'Cod Prod: ' + trim(vItemPedido.dataSet.FieldByName('COD_PROD').AsString) + #13 +
            'Descrição: ' + trim(vItemPedido.dataSet.FieldByName('DESCR_PROD').AsString) + #13 + #13 +
         	  'Valor unitário não informada.', 'DBEdit19');
        end;

        vItemPedido.dataSet.Next;
      end;
    finally
    	if not vErroItens then
	      vItemPedido.dataSet.First;
      vItemPedido.dataSet.EnableControls;
    end;

    inherited post;
    if not vItemPedido.Post then
    begin
    	vNomeCampoErro := vItemPedido.vNomeCampoErro;
      vMensagemErro := vItemPedido.vMensagemErro;
      exit;
    end;

    if dataSet.FieldByName('NUM_PED').AsInteger = 0 then
    begin
      inherited edit;
      dtmSugestaoCompras.SpIncCodigo.Transaction := dtmSugestaoCompras.IBTransPedido;
      dataSet.FieldByName('NUM_PED').AsInteger := Gencodigo('PEDIDO', dtmSugestaoCompras.SpIncCodigo, vDadosIni.codEmpresa);
      inherited post;
    end;
    //    valor := 0;
    //    vItemPedido.First;
    //    while not vItemPedido.dataSet.eof do
    //    begin
    //      vItemPedido.edit;
    //      vItemPedido.dataSet.FieldByName('NUM_PED').AsInteger := dataSet.FieldByName('NUM_PED').AsInteger;
    //      valor := valor + vItemPedido.dataSet.FieldByName('VAL_TOT_IT').AsCurrency;
    //      vItemPedido.post;
    //      vItemPedido.Next;
    //    end;
    //    inherited edit;
    //    dataSet.FieldByName('VAL_TOT_PED').AsCurrency := valor;
    //    inherited post;
    CalculaValorPedido;
    abreFormObservacao;
    if Application.MessageBox('Deseja Efetivar o Pedido?', 'Efetivar Pedido ou deixá-lo em aberto', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
      inherited edit;
      dataSet.FieldByName('STATUS_PED').AsString := 'EFETIVADO';
      dataSet.FieldByName('DATA_ENV_PED').AsDateTime := vDadosIni.getDataBanco(buscas);
      inherited post;
    end;

    SetLancamentos(0);

    if (dataSet.ChangeCount = 0) and (vItemPedido.dataSet.ChangeCount = 0) then
    begin
      Result := true;
      Exit;
    end;
    if (dataSet.ChangeCount > 0) and (vItemPedido.dataSet.ChangeCount = 0) then
    begin
      if Apply then
        if CommitaTransacao then
          result := true;
    end
    else if (dataSet.ChangeCount > 0) and (vItemPedido.dataSet.ChangeCount > 0) then
    begin
      if Apply then
      begin
        if (vItemPedido.Apply) then
          if CommitaTransacao then
            result := true;
      end;
    end
    else if vItemPedido.dataSet.ChangeCount > 0 then
    begin
      if (vItemPedido.Apply) then
        if CommitaTransacao then
          result := true;
    end;
    if result then
    begin
      if statusDataset = 'E' then
        vDadosIni.GravaAuditoria('SUG010', 'ALTERAÇÃO CONFIRMADA', 'SUCESSO', 'PEDIDO', dataSet.FieldByName('NUM_PED').asstring, buscas)
      else if statusDataset = 'I' then
        vDadosIni.GravaAuditoria('SUG010', 'INCLUSÃO CONFIRMADA', 'SUCESSO', 'PEDIDO', dataSet.FieldByName('NUM_PED').asstring, buscas);
    end
    else
    begin
      Cancel;
      vItemPedido.CancelUpdates;
      RollBackTransacao;
      if statusDataset = 'E' then
        vDadosIni.GravaAuditoria('SUG010', 'ALTERAÇÃO NÃO CONFIRMADA', 'FALHA', 'PEDIDO', dataSet.FieldByName('NUM_PED').asstring, buscas)
      else if statusDataset = 'I' then
        vDadosIni.GravaAuditoria('SUG010', 'INCLUSÃO NÃO CONFIRMADA', 'FALHA', 'PEDIDO', dataSet.FieldByName('NUM_PED').asstring, buscas);
    end;
    //    Refresh;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

procedure TPedidoCompra.PreencheCampos;
begin
  if dataSet.State = dsInsert then
  begin
    dataSet.FieldByName('DATA_ENV_PED').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('DATA_PED').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('COD_EMPRESA').AsInteger := strtoint(vDadosIni.codEmpresa);
    dataSet.FieldByName('ATIVO').AsInteger := 1;
  end;
end;

procedure TPedidoCompra.RelPedidoCompra;
var
  ALinhas: TStringList;
  I: Integer;
begin
//  if Application.MessageBox('Deseja Imprimir Pedido de Compra',
//    'Confirmação', MB_YESNO +
//    MB_ICONQUESTION) = ID_YES then
//  begin
    abreFornecedor(dataSet.FieldByName('CODIGO_F').asinteger);
    abreItemPedidoCompra(dataset.FieldByName('NUM_PED').asinteger);
    frmCadPedidoCompra.QRLabel10.Caption := vDadosIni.vEmp.vnomeEmpresa;
    frmCadPedidoCompra.QRLabel12.Caption := vDadosIni.vEmp.vnomeEmpresa + '    ' + vDadosIni.vEmp.vMensagem;
    frmCadPedidoCompra.SummaryBand1.Height := 56;
    ALinhas := TStringList.Create;
    ALinhas.Text := dataset.FieldByName('OBS').AsString;;
    try
      frmCadPedidoCompra.QRMemo1.Lines.Clear;
      if ALinhas.Count > 0 then
        frmCadPedidoCompra.SummaryBand1.Height := 79;
      for I := 0 to ALinhas.Count - 1 do
        frmCadPedidoCompra.QRMemo1.Lines.Add(ALinhas[i]);
//      frmCadPedidoCompra.QRMemo1.Height := frmCadPedidoCompra.QRMemo1.Lines.Count * 17;
    finally
      FreeAndNil(ALinhas);
    end;
    quickRep := TquickRep(frmCadPedidoCompra.qrpPedidoCompra);
    quickRep.Preview;
//  end;
end;

function TPedidoCompra.RestaurarRegistro: boolean;
begin
  result := false;
  if not dataSet.IsEmpty then
    if dataSet.FieldByName('ATIVO').asinteger = 0 then
    begin
      if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
        'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
      begin
        if inherited Edit then
        begin
          dataSet.FieldByName('ATIVO').asinteger := 1;
          if inherited Post then
            if Apply then
              if CommitaTransacao then
                result := true;
        end;
      end;
    end
    else
      Application.MessageBox('Registro já está ativo' + chr(13) +
        'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
  if result then //auditoria sim ou não
    vDadosIni.GravaAuditoria('SUG008', 'RESTAURAR', 'SUCESSO', 'PEDIDO', dataSet.FieldByName('NUM_PED').asstring, buscas)
      //    vDadosIni.GravaAuditoria('SUG008', dataSet.FieldByName('NUM_PED').AsString + ' Sucesso', buscas)
  else
    vDadosIni.GravaAuditoria('SUG008', 'RESTAURAR', 'FALHA', 'PEDIDO', dataSet.FieldByName('NUM_PED').asstring, buscas);
  //    vDadosIni.GravaAuditoria('SUG008', dataSet.FieldByName('NUM_PED').AsString + ' Falha', buscas);
  Refresh;
end;

function TPedidoCompra.SetLancamentos(vCod: Integer = 0): boolean;
var
 vCondPag: string;
 I, vQtdeCaractere, vQtdeCaractereA: Integer;
begin
  vCondPag := '';

  buscas.Close;
  buscas.SQL.Text := ' select desc_cond_pag from cond_pag' +
   ' where cod_cond_pag = ' +IntToStr(Pedido.dataSet.FieldByName('COD_COND_PAG').AsInteger);
  buscas.Prepare;
  buscas.Open;

  if frmCadPedidoCompra.edcreditoQtdeParcelas.Value > 0 then
    vCondPag := IntToStr(frmCadPedidoCompra.edcreditoQtdeParcelas.Value) + 'X'
  else
  begin
    if vCod = 1 then
      vCondPag := frmCadPedidoCompra.edcreditoCondicaoPagamento.Text
    else
      vCondPag := buscas.FieldByName('DESC_COND_PAG').AsString;
  end;

  if not ((trim(dataSet.FieldByName('FORMPAG').AsString) <> '') and (vCod = 0)) then
   vDadosIni.montarParcelamento(Pedido.buscas, vNumDoc, vDataVenc, vValor, IntToStr(Pedido.dataSet.FieldByName('NUM_PED').AsInteger), vDadosIni.StrToFloatFormat(Pedido.dataSet.FieldByName('VAL_TOT_PED').AsFloat, 2),
    Pedido.dataSet.FieldByName('CODIGO_F').AsInteger, vCondPag, frmCadPedidoCompra.edcreditoQtdeParcelas.Value);

  frmCadPedidoCompra.ListBox1.Clear;
  frmCadPedidoCompra.ListBox2.Clear;
  vQtdeCaractere := 0;
  if (trim(dataSet.FieldByName('FORMPAG').AsString) = '') or (vCod = 1) then
  begin
    for I := 0 to Length(vNumDoc) - 1 do
    begin
      vQtdeCaractere := Length(vNumDoc[I]);
      if (vQtdeCaractereA <> 0) and (vQtdeCaractere > vQtdeCaractereA) then
       frmCadPedidoCompra.ListBox1.Items.Add(vNumDoc[I] + '   ' + vDataVenc[I] + '    ' + Format('%m', [vValor[I]]))
      else
       frmCadPedidoCompra.ListBox1.Items.Add(vNumDoc[I] + '    ' + vDataVenc[I] + '    ' + Format('%m', [vValor[I]]));
      frmCadPedidoCompra.ListBox2.Items.Add(FloatToStr(vValor[I]));
      if (vQtdeCaractereA = 0) then
       vQtdeCaractereA := Length(vNumDoc[I]);
    end;
  end
  else
  begin
   frmCadPedidoCompra.ListBox1.Items.Text := dataSet.FieldByName('FORMPAG').AsString;
   frmCadPedidoCompra.ListBox2.Items.Text := dataSet.FieldByName('VLFORMPAG').AsString;
  end;

  if vCod = 0 then
  begin
   if (frmCadPedidoCompra.ListBox1.Items.Count > 0) then
   begin
    if not abreFormLancParcelas then
      exit;
   end
   else
   begin
      dataSet.Edit;
      dataSet.FieldByName('FORMPAG').Value := Null;
      dataSet.FieldByName('VLFORMPAG').Value := Null;
      dataSet.Post;
   end;
  end;
end;

function TPedidoCompra.StatusLixeira(aviso: boolean): boolean;
begin
  //Se lixeira vazia retorna falso senão verdadeiro
  if not ExecutaComandosSql('select num_ped from pedido where cod_empresa = ' + vDadosIni.codEmpresa + ' and (ativo = 0 or ativo is null)') then
  begin
    if aviso then
      Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    result := false;
  end
  else
    result := true;
end;

function TPedidoCompra._abreFormExportarPedidoCompra: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Exportar Mercadorias para arquivo eletrônico';
    frmCadPedidoCompra.pnArquivoPedido.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    result := (formulario.ShowModal = IDOK);

  finally
    frmCadPedidoCompra.pnArquivoPedido.Parent := frmCadPedidoCompra.tsArquivoPedido;
    formulario.Free;
    formulario := nil;
  end;
end;

function TPedidoCompra._marcarParaProducao: Boolean;
var
  vMsg: string;
begin

  Result := False;
  if dataSet.IsEmpty then
    Exit;

  try

    if Trim(dataSet.FieldByName('STATUS_PED').AsString) = 'RECEBIDO' then
      raiseExceptionCreate('Pedido já recebido', '');

    if Trim(dataSet.FieldByName('STATUS_PED').AsString) <> 'EFETIVADO' then
      raiseExceptionCreate('Pedido ainda não Efetivado', '');

    if Trim(dataSet.FieldByName('ADD_PRODUCAO').AsString) <> 'S' then
    begin
      if Application.MessageBox('Deseja marcar Pedido para Produção?', 'Confirmação',
        MB_ICONQUESTION + MB_YESNO) <> IDYES then
        Exit;
    end
    else if UpperCase(Trim(dataSet.FieldByName('STATUS_PRODUCAO').AsString)) = 'INICIADO' then
      raiseExceptionCreate('Pedido Produção já foi Iniciado', '')
    else if UpperCase(Trim(dataSet.FieldByName('STATUS_PRODUCAO').AsString)) = 'FECHADO' then
      raiseExceptionCreate('Pedido Produção já foi Fechado', '')
    else if Application.MessageBox('Deseja remover marcação de Pedido para Produção?', 'Confirmação',
      MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

    dataSet.Edit;
    if Trim(dataSet.FieldByName('ADD_PRODUCAO').AsString) = 'S' then
    begin
      dataSet.FieldByName('ADD_PRODUCAO').Value := null;
      dataSet.FieldByName('STATUS_PRODUCAO').Value := null;
      dataSet.FieldByName('NUM_PRODUCAO').Value := null;
      dataSet.FieldByName('COD_EMPRESA_PRODUCAO').Value := null;
      vMsg := 'DESMARCAR ';
    end
    else
    begin
      dataSet.FieldByName('ADD_PRODUCAO').AsString := 'S';
      vMsg := 'MARCAR ';
    end;
    dataSet.Post;

    if Apply then
    begin
      CommitaTransacao;
      Result := True;
    end;

    if result then
      vDadosIni.GravaAuditoria('SUG021', vMsg + 'TRANSACAO CONFIRMADA', 'SUCESSO', 'PEDIDO', dataSet.FieldByName('num_ped').AsString, buscas)
    else
      vDadosIni.GravaAuditoria('SUG021', vMsg + 'TRANSACAO NÃO CONFIRMADA', 'FALHA', 'PEDIDO', dataSet.FieldByName('num_ped').AsString, buscas);

  except on E: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
    end;
  end;

end;

procedure TPedidoCompra._rdPedidoSendMail(Sender: TObject);
var
 pTipo: string;
begin
  try

   pTipo := 'PEDIDO' + dataSet.FieldByName('NUM_PED').AsString;

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
    	vDadosIni.vEmp.vAssunto_dav,
      vDadosIni.vEmp.vMsg_dav,
      dataSet.FieldByName('CODIGO_F').AsInteger,
      cEmail,
      '',
      '',
      cNenhum,
      vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf');

   DeleteFile(Pchar(vDadosIni._getSpecialFolderPath(CSIDL_APPDATA) + '\Hw Sistemas\Temp\' + pTipo + '.pdf'));
  finally
     Screen.Cursor := crDefault;
  end;
end;

{ TItemPedidoCompra }

function TItemPedidoCompra.buscaProduto(codBarra: string; grupo: integer;
  codProd: string; pedido: TPedidoCompra; usarCodbarra: boolean): boolean;
begin
  try
    if (dataSet.State = dsEdit) then
      modoEdit := true
    else
      modoEdit := false;
    Result := true;
    vGrupoProd := 0;
    vCodProd := '';
    vGrupoProdO := dataSet.FieldByName('GRUPO_PROD').OldValue;
    vCodProdO := trim(dataSet.FieldByName('COD_PROD').OldValue);

    if usarCodbarra then
    begin
      if codBarra <> '' then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select * from cod_barra where cod_barra = ' + QuotedStr(trim(codBarra)) +
          ' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa;
        buscas.Open;
        if not buscas.IsEmpty then
        begin
          vGrupoProd := buscas.FieldByName('GRUPO_PROD').AsInteger;
          vCodProd := trim(buscas.FieldByName('COD_PROD').AsString);
        end
        else
        begin
          Application.MessageBox(pchar('Produto Não Encontrado' + chr(13) + 'Use a Lupa ou F3 para Pesquisar'), 'Atenção', MB_ICONWARNING + MB_OK);
          Result := false;
          exit
        end;
      end;
    end
    else
    begin
      if (trim(codProd) = '') or (grupo = 0) then
        raise exception.create(Pchar('Dados para consulta não informados completamente' + chr(13) + 'Grupo e código do produto são campos abrigatórios'));
      buscas.Close;
      buscas.SQL.Text := 'select * from produtos where grupo_prod = ' + IntToStr(grupo) +
        ' and cod_prod = ' + QuotedStr(codProd) +
        ' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;
      if not buscas.IsEmpty then
      begin
        vGrupoProd := buscas.FieldByName('GRUPO_PROD').AsInteger;
        vCodProd := trim(buscas.FieldByName('COD_PROD').AsString);
      end
      else
      begin
        Application.MessageBox(pchar('Produto Não Encontrado' + chr(13) + 'Use a Lupa ou F3 para Pesquisar'), 'Atenção', MB_ICONWARNING + MB_OK);
        Result := false;
        exit
      end;
    end;
    if not Result then
      exit;

    if (JaExisteItem(vGrupoProd, vCodProd, usarCodbarra)) or modoEdit then
    begin
      dataSet.IndexFieldNames := 'GRUPO_PROD;COD_PROD';
      if modoEdit and (not prodDiferente) then
      begin
        dataSet.FindNearest([vGrupoProdO, vCodProdO]);
        if (dataSet.FieldByName('GRUPO_PROD').Asinteger = vGrupoProdO) and
          (trim(dataSet.FieldByName('COD_PROD').AsString) = trim(vCodProdO)) then
          Edit;
      end
      else
      begin
        dataSet.FindNearest([vGrupoProd, vCodProd]);
        if (dataSet.FieldByName('GRUPO_PROD').Asinteger = vGrupoProd) and
          (trim(dataSet.FieldByName('COD_PROD').AsString) = trim(vCodProd)) then
          Edit;
      end;
    end
    else
      insert(Pedido);
    buscas.Close;
    buscas.SQL.Text := 'select GRUPO_PROD,COD_PROD,DESCR_PROD,NUM_FAB_PROD,VL_ULT_COMPRA,PREC_CUS_PROD,' +
      'PREC_TAB_PROD,PREC_PUBLICO,CUSTO_HONDA from produtos where grupo_prod = ' + IntToStr(vGrupoProd) +
      ' and cod_prod = ' + QuotedStr(vCodProd) +
      ' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;
    if vDadosIni.vEmp.vConcess = 'S' then
    begin
      dataSet.FieldByName('VL_V_EMP').AsFloat := buscas.FieldByName('PREC_TAB_PROD').AsFloat;
      dataSet.FieldByName('VL_V_HONDA').AsFloat := buscas.FieldByName('PREC_PUBLICO').AsFloat;
      dataSet.FieldByName('VAL_UNT_IT').AsFloat := buscas.FieldByName('PREC_PUBLICO').AsFloat;
    end
    else
    begin
      if (buscas.FieldByName('VL_ULT_COMPRA').isnull) or
        (buscas.FieldByName('VL_ULT_COMPRA').asfloat = 0) then
        dataSet.FieldByName('VAL_UNT_IT').AsFloat := buscas.FieldByName('PREC_CUS_PROD').AsFloat
      else
        dataSet.FieldByName('VAL_UNT_IT').AsFloat := buscas.FieldByName('VL_ULT_COMPRA').AsFloat;
    end;

    dataSet.FieldByName('DESCR_PROD').AsString := buscas.FieldByName('DESCR_PROD').AsString;
    dataSet.FieldByName('NUM_FAB_PROD').AsString := trim(buscas.FieldByName('NUM_FAB_PROD').AsString);
    dataSet.FieldByName('GRUPO_PROD').AsInteger := buscas.FieldByName('GRUPO_PROD').AsInteger;
    dataSet.FieldByName('COD_PROD').AsString := trim(buscas.FieldByName('COD_PROD').AsString);

    Result := true;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    end;
  end;
end;

function TItemPedidoCompra.buscaProduto(pedido: TPedidoCompra; codBarra: string;
  grupo: integer; codProd: string; usarCodbarra: boolean): boolean;
var
  temp: string;
  j: Integer;
  i: Integer;
  nBarra, nGradetTemp: string;
  vCodSeg, vCodVend, vCodVendCol: Integer;
  vStatusEdicao, GradeNoCodigo: boolean;
begin

  try
  	vGrupoProd := 0;
    vCodProd := '';
    nGradeSelecionada := 0;
    vCodGrade := 0;
    Result := true;
    vStatusEdicao := false;
    GradeNoCodigo := false;
    if not usarCodbarra then
    begin
      if (trim(codProd) = '') or (grupo = 0) then
        raise exception.create(Pchar('Dados para consulta não informados completamente' + chr(13) + 'Grupo e código do produto são campos abrigatórios'));
      buscas.Close;
      buscas.SQL.Text := 'select distinct p.*, ' +
      	' coalesce(est.estoque, 0) estoque_disponivel, ' +
		 	  ' coalesce(est.est_prima, 0) estoque_produzir from produtos p ' +
        ' inner join cod_barra cb on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod and p.cod_empresa = cb.cod_empresa ' +
        ' left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
        ' where p.grupo_prod = ' + IntToStr(grupo) +
        ' and p.cod_prod = ' + QuotedStr(codProd) +
        ' and p.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and p.ativo = 1 ';
      buscas.Open;
      if not buscas.IsEmpty then
      begin
        vGrupoProd := buscas.FieldByName('GRUPO_PROD').AsInteger;
        vCodProd := trim(buscas.FieldByName('COD_PROD').AsString);
        CodBarra := trim(buscas.FieldByName('num_fab_prod').AsString);
        GradeNoCodigo := false;
      end
      else
      begin
        Application.MessageBox(pchar('Produto Não Encontrado' + chr(13) + 'Use a Lupa ou F3 para Pesquisar'), 'Atenção', MB_ICONWARNING + MB_OK);
        Result := false;
        exit
      end;
    end
    else
    begin
      //Validando codigo de barras
//      if (Copy(codBarra, 1, 2) = 'G-') then
//      begin
//        try
//          if (pos(';', codBarra) > 0) then //compatibilidade com etiquetas antigas
//          begin
//            //            nGradeSelecionada := StrToInt(Copy(codBarra, Pos(';', codBarra) + 1, Length(codBarra) - Pos(';', codBarra)));
//            vCodGrade := strtoint(Copy(codBarra, Pos(';', codBarra) + 1, Length(codBarra) - Pos(';', codBarra)));
//            codBarra := trim(retornaValor('select num_fab_prod as valor from produtos where cod_empresa=' + vDadosIni.codEmpresa +
//              ' and grupo_prod=' + Copy(codBarra, 5, (pos(';', codBarra) - 5 - strtoint(vDadosIni.vProduto.vDigitosProd))) +
//              ' and cod_prod=' + quotedstr(Copy(codBarra, (pos(';', codBarra) - strtoint(vDadosIni.vProduto.vDigitosProd)), strtoint(vDadosIni.vProduto.vDigitosProd))) +
//              ' and ativo=1'));
//          end
//          else if (pos('/', codBarra) > 0) then //compatibilidade com etiquetas antigas
//          begin
//            //            nGradeSelecionada := StrToInt(Copy(codBarra, Pos('/', codBarra) + 1, Length(codBarra) - Pos('/', codBarra)));
//            vCodGrade := strtoint(Copy(codBarra, Pos('/', codBarra) + 1, Length(codBarra) - Pos('/', codBarra)));
//            codBarra := trim(retornaValor('select num_fab_prod as valor from produtos where cod_empresa=' + vDadosIni.codEmpresa +
//              ' and grupo_prod=' + Copy(codBarra, 5, (pos('/', codBarra) - 5 - strtoint(vDadosIni.vProduto.vDigitosProd))) +
//              ' and cod_prod=' + quotedstr(Copy(codBarra, (pos('/', codBarra) - strtoint(vDadosIni.vProduto.vDigitosProd)), strtoint(vDadosIni.vProduto.vDigitosProd))) +
//              ' and ativo=1'));
//          end
//          else
//          begin //Novo modelo de etiqueta
//            //            nGradeSelecionada := StrToInt(copy(codBarra, (3 + vDadosIni.vEmp.vDigitosEmp + vDadosIni.vEmp.vDidgitosGrup + strtoint(vDadosIni.vProduto.vDigitosProd)), 10));
//            vCodGrade := StrToInt(copy(codBarra, (3 + vDadosIni.vEmp.vDigitosEmp + vDadosIni.vEmp.vDidgitosGrup + strtoint(vDadosIni.vProduto.vDigitosProd)), 10));
//            codBarra := trim(retornaValor('select num_fab_prod as valor from produtos where cod_empresa=' + vDadosIni.codEmpresa +
//              ' and grupo_prod=' + Copy(codBarra, 3 + vDadosIni.vEmp.vDigitosEmp, vDadosIni.vEmp.vDidgitosGrup) +
//              ' and cod_prod=' + quotedstr(Copy(codBarra, 3 + vDadosIni.vEmp.vDigitosEmp + vDadosIni.vEmp.vDidgitosGrup, strtoint(vDadosIni.vProduto.vDigitosProd))) +
//              ' and ativo=1'));
//          end;
//          GradeNoCodigo := true;
//          if codBarra = '' then
//          begin
//            Application.MessageBox('Produto não encontrado', 'Atenção', MB_ICONINFORMATION + MB_OK);
//            exit;
//          end;
//        except
//          raise exception.create('Produto não encontrado');
//        end;
//      end;
//    	if (Pos('A-', codBarra) > 0) or (Pos('G-', codBarra) > 0) then
//      begin
      vDadosIni.vEtiqProd := vDadosIni.retornaDadosEtiqueta(
        buscas,
        codBarra,
        grupo,
        codProd);

      vGrupoProd := vDadosIni.vEtiqProd.GrupoProd;
      vCodProd   := vDadosIni.vEtiqProd.CodProd;
      codBarra   := vDadosIni.vEtiqProd.CodBarra;
      vCodGrade  := vDadosIni.vEtiqProd.CodGrade;

      if vDadosIni.vEtiqProd.Quant > 0 then
        dataSet.FieldByName('QUANT_IT_PROD').AsFloat := vDadosIni.vEtiqProd.Quant;

      GradeNoCodigo := vDadosIni.vEtiqProd.CodGrade > 0;
//      end;
    end;

    if (codBarra <> '') and usarCodbarra then
    begin
      if (vGrupoProd > 0) or (trim(vCodProd) <> '') then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select distinct p.*, ' +
          ' coalesce(est.estoque, 0) estoque_disponivel, ' +
          ' coalesce(est.est_prima, 0) estoque_produzir from produtos p ' +
          ' inner join cod_barra cb on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod and p.cod_empresa = cb.cod_empresa ' +
          ' left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
          ' where p.grupo_prod = ' + IntToStr(vGrupoProd) +
          ' and p.cod_prod = ' + QuotedStr(vCodProd) +
          ' and p.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and p.ativo = 1 ' +
          ' and cb.cod_barra = ' + QuotedStr(codBarra);
        buscas.Open;
      end
      else
      begin
        buscas.Close;
        buscas.SQL.Text := 'select distinct p.*, ' +
          ' coalesce(est.estoque, 0) estoque_disponivel, ' +
          ' coalesce(est.est_prima, 0) estoque_produzir from produtos p ' +
          ' inner join cod_barra cb on p.grupo_prod = cb.grupo_prod and p.cod_prod = cb.cod_prod and p.cod_empresa = cb.cod_empresa ' +
          ' left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
          ' where cb.cod_barra = ' + QuotedStr(codBarra) +
          ' and cb.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and p.ativo = 1';
        buscas.Open;
      end;
      buscas.FetchAll;

      if (buscas.IsEmpty) and (trim(vCodProd) = '') then
      begin
        buscas.Close;
        buscas.SQL.Text := 'select distinct p.*, ' +
          ' coalesce(est.estoque, 0) estoque_disponivel, ' +
			 	  ' coalesce(est.est_prima, 0) estoque_produzir from produtos p ' +
        	' inner join cod_barra cb on p.grupo_prod=cb.grupo_prod and p.cod_prod=cb.cod_prod and p.cod_empresa=cb.cod_empresa ' +
          ' left join getestoquedisponivel(p.grupo_prod, p.cod_prod, 0, p.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
          ' where p.cod_empresa=' + vDadosIni.codEmpresa +
          ' and p.descr_prod like ' + QuotedStr(codBarra + '%') + ' and p.ativo = 1' +
          ' order by p.descr_prod ';
        buscas.Open;
        buscas.FetchAll;
      end;

      if not buscas.IsEmpty then
        if buscas.RecordCount > 1 then
        begin
        	TFloatField(buscas.FieldByName('PREC_TAB_PROD')).currency := True;
          TFloatField(buscas.FieldByName('PREC_PUBLICO')).currency := True;
          TFloatField(buscas.FieldByName('PRECO_PROMOCAO')).currency := True;
        	TFloatField(buscas.FieldByName('PREC_30_PROD')).currency := True;
          TFloatField(buscas.FieldByName('PREC_60_PROD')).currency := True;
          TFloatField(buscas.FieldByName('PREC_90_PROD')).currency := True;
        	TFloatField(buscas.FieldByName('ESTOQUE_DISPONIVEL')).DisplayFormat := '#,##0.000';
          TFloatField(buscas.FieldByName('ESTOQUE_PRODUZIR')).DisplayFormat   := '#,##0.000';
          if not vDadosIni._abreFormEscolhaProdutosIni(buscas) then
          begin
            Result := false;
            raise exception.create('Produto não encontrado');
            exit;
          end;
        end;

      if buscas.IsEmpty then
      begin
        Result := false;
        raise exception.create('Produto não encontrado');
        exit;
      end
      else
      begin
        vCodProd := trim(buscas.FieldByName('cod_prod').AsString);
        vGrupoProd := buscas.FieldByName('grupo_prod').AsInteger;
      end;
      buscas.close;
    end
    else
    begin
    	if (vGrupoProd > 0) or (trim(vCodProd) <> '') then
      begin
      	Result := true;
        exit;
      end;
      Result := false;
      raise exception.create('Produto não encontrado');
    end;

    if not Result then
      exit;

    if (not GradeNoCodigo) and ExecutaComandosSql(
    	' select first 1 cgp.cod_grade from cod_grade_prod cgp' +
      ' inner join grade g on g.cod_grade = cgp.cod_grade and g.cod_empresa = cgp.cod_empresa ' +
      ' where cgp.grupo_prod = ' + IntToStr(vGrupoProd) +
      ' and cgp.cod_prod = ' + QuotedStr(trim(vCodProd)) +
      ' and cgp.cod_empresa = ' + vDadosIni.codEmpresa) then
       _abreFormSelecionaGradeProd(vGrupoProd, vCodProd);

      if nGradeSelecionada <> 0 then
        dataSet.FieldByName('cod_grade').AsInteger := nGradeSelecionada
      else
        dataSet.FieldByName('cod_grade').AsInteger := vCodGrade;

    buscas.Close;
    buscas.SQL.Text := ' select GRUPO_PROD,COD_PROD,DESCR_PROD,NUM_FAB_PROD,VL_ULT_COMPRA,PREC_CUS_PROD,' +
      ' PREC_TAB_PROD,PREC_PUBLICO,CUSTO_HONDA from produtos ' +
      '	where grupo_prod = ' + IntToStr(vGrupoProd) +
      ' and cod_prod = ' + QuotedStr(vCodProd) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ativo = 1 ';
    buscas.Open;

    if vDadosIni.vEmp.vConcess = 'S' then
    begin
      dataSet.FieldByName('VL_V_EMP').AsFloat := buscas.FieldByName('PREC_TAB_PROD').AsFloat;
      dataSet.FieldByName('VL_V_HONDA').AsFloat := buscas.FieldByName('PREC_PUBLICO').AsFloat;
      dataSet.FieldByName('VAL_UNT_IT').AsFloat := buscas.FieldByName('PREC_PUBLICO').AsFloat;
    end
    else
    begin
      if (buscas.FieldByName('VL_ULT_COMPRA').isnull) or
        (buscas.FieldByName('VL_ULT_COMPRA').asfloat = 0) then
        dataSet.FieldByName('VAL_UNT_IT').AsFloat := buscas.FieldByName('PREC_CUS_PROD').AsFloat
      else
        dataSet.FieldByName('VAL_UNT_IT').AsFloat := buscas.FieldByName('VL_ULT_COMPRA').AsFloat;
    end;

    dataSet.FieldByName('DESCR_PROD').AsString := buscas.FieldByName('DESCR_PROD').AsString;
    dataSet.FieldByName('NUM_FAB_PROD').AsString := trim(buscas.FieldByName('NUM_FAB_PROD').AsString);
    dataSet.FieldByName('GRUPO_PROD').AsInteger := buscas.FieldByName('GRUPO_PROD').AsInteger;
    dataSet.FieldByName('COD_PROD').AsString := trim(buscas.FieldByName('COD_PROD').AsString);

    Result := true;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONEXCLAMATION + MB_OK);
    end;
  end;
end;

function TItemPedidoCompra.cancel: boolean;
begin
//  if not vDadosIni.PesqPros('SUG015', Pedido.dataSet.FieldByName('NUM_PED').AsString, Pedido.buscas, true) then
//    exit;
  inherited Cancel;
end;

constructor TItemPedidoCompra.create;
begin
  DataSet := TClientDataSet(dtmSugestaoCompras.CdsItensPedido);
  transacao := TIBTransaction(dtmSugestaoCompras.IBTransPedido);
  Buscas := TIBQuery(dtmSugestaoCompras.qrBuscasItemPedido);
  vNItem := 0;

  dataSet.FieldByName('LOCACAO_PROD').EditMask := vDadosIni.vMascaraLocacao;
  dataSet.FieldByName('LOCACAO_PROD_1').EditMask := vDadosIni.vMascaraLocacao;
end;

function TItemPedidoCompra.delete: boolean;
begin
  if not vDadosIni.PesqPros('SUG016', 'EXCLUIR', '', 'ITEM_PEDIDO', dataSet.FieldByName('NUM_PED').AsString, buscas, true) then
    exit;
  inherited Delete;
  vNItem := 0;
  dataSet.IndexFieldNames := 'NITEM';
  First;
  while not Eof do
  begin
    inc(vNItem);
    Edit;
    dataSet.FieldByName('NITEM').AsInteger := vNItem;
    inherited Post;
    Next;
  end;
end;

destructor TItemPedidoCompra.destroy;
begin

  inherited;
end;

function TItemPedidoCompra.insert: boolean;
begin
  result := inherited insert;
end;

function TItemPedidoCompra.insert(Pedido: TPedidoCompra): boolean;
var
 vMaxItem: Integer;
begin
  Result := false;
  vMaxItem := 0;
  if dataSet.State in [dsInsert, dsedit] then
  begin
    if not dataSet.IsEmpty then
      vMaxItem:= dataSet.FieldByName('nitem').AsInteger;
  end
  else
  begin
    if not dataSet.IsEmpty then
    begin
      dataSet.AddIndex('NITEM', 'NITEM', []);
      dataSet.IndexName := 'NITEM';
      dataSet.Last;
    end;
    vMaxItem:= dataSet.FieldByName('nitem').AsInteger;
    try
      if not dataSet.IsEmpty then
        dataSet.DeleteIndex('NITEM');
    except
    end;
  end;
  if dataSet.State in [dsInsert, dsedit] then
  begin
    if dataSet.ChangeCount = 0 then
    begin
      if not inherited post then
        exit;
    end
    else if not post then
      exit;
  end;
  if inherited insert then
  begin
    Result := true;
    dataSet.FieldByName('NUM_PED').AsInteger := Pedido.dataSet.FieldByName('NUM_PED').AsInteger;
    dataSet.FieldByName('COD_EMPRESA').AsInteger := strtoint(vDadosIni.codEmpresa);
    dataSet.FieldByName('ATIVO').AsInteger := 1;
//    vNItem := vNItem + 1;
    dataSet.FieldByName('NITEM').AsInteger := vMaxItem + 1;//dataSet.RecordCount + 1; //vNItem;
  end;
end;

function TItemPedidoCompra.JaExisteItem(vGrupoProd: integer; vCodProd: string; usarCodbarra: boolean): boolean;
begin
  prodDiferente := false;
  Result := false;
  if usarCodbarra then
  begin
    if (dataSet.State = dsEdit) and (trim(dataSet.FieldByName('NUM_FAB_PROD').NewValue) = trim(dataSet.FieldByName('NUM_FAB_PROD').OldValue)) then
    begin
      Result := true;
      exit;
    end
    else if (dataSet.State = dsEdit) and (trim(dataSet.FieldByName('NUM_FAB_PROD').NewValue) <> trim(dataSet.FieldByName('NUM_FAB_PROD').OldValue)) then
      prodDiferente := true;
  end
  else
  begin
    if (dataSet.State = dsEdit) and
      (trim(dataSet.FieldByName('GRUPO_PROD').NewValue) = trim(dataSet.FieldByName('GRUPO_PROD').OldValue))
      and (trim(dataSet.FieldByName('COD_PROD').NewValue) = trim(dataSet.FieldByName('COD_PROD').OldValue)) then
    begin
      Result := true;
      exit;
    end
    else if (dataSet.State = dsEdit) and
      ((trim(dataSet.FieldByName('GRUPO_PROD').NewValue) <> trim(dataSet.FieldByName('GRUPO_PROD').OldValue))
      or (trim(dataSet.FieldByName('COD_PROD').NewValue) <> trim(dataSet.FieldByName('COD_PROD').OldValue))) then
      prodDiferente := true;
  end;
  dataSet.Cancel;
  try
  	dataSet.DisableControls;
    dataSet.First;
    while not dataSet.Eof do
    begin
      if (trim(vCodProd) = trim(dataSet.FieldByName('COD_PROD').AsString)) and
        (vGrupoProd = dataSet.FieldByName('GRUPO_PROD').Asinteger) then
      begin
        if not modoEdit then
          Application.MessageBox(Pchar('Produto duplicado.' + chr(13) + 'Altere o registro se assim desejar.'), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        Result := true;
        exit;
      end;
      dataSet.Next;
    end;
  finally
    dataSet.EnableControls;
  end;
  prodDiferente := false;
end;

function TItemPedidoCompra.post: boolean;
begin
  result := true;
  try
  	if (trim(dataSet.FieldByName('NUM_FAB_PROD').AsString) = '') then
    	raiseExceptionCreate('Produto não informado.', 'DBEdit3');

    if (trim(dataSet.FieldByName('COD_PROD').AsString) = '') then
    	raiseExceptionCreate('Produto não encontrado.', 'DBEdit3');

    if not ExecutaComandosSql('select grupo_prod, cod_prod from produtos ' +
    	' where grupo_prod = ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').Asinteger) +
      ' and cod_prod = ' + QuotedStr(trim(dataSet.FieldByName('COD_PROD').Asstring)) +
      ' and ativo = 1 and cod_empresa = ' + vDadosIni.codEmpresa) then
    	raiseExceptionCreate('Produto não encontrado.', 'DBEdit3');

    if (dataSet.FieldByName('QUANT_IT_PROD').Asfloat <= 0) then
      raiseExceptionCreate('Quantidade de Itens não informada.', 'DBEdit16');

    if (dataSet.FieldByName('VAL_UNT_IT').Asfloat <= 0) then
      raiseExceptionCreate('Valor unitário do item não informada.', 'DBEdit19');

    inherited post;
  except
    on e: exception do
    begin
      Result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
    end;
  end;
end;

function TItemPedidoCompra._abreFormSelecionaGradeProd(grupo: integer; codProd: string): boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 800;
    formulario.Height := 600;
    formulario.Position := poScreenCenter;
    formulario.BorderIcons := [];
    formulario.Caption := 'Selecionar Grade do produto';
    FrmCadPedidoCompra.pnSelecionaGradeProd.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.KeyPreview := True;

    FrmCadPedidoCompra.Label38.Caption := '';
    FrmCadPedidoCompra.Label39.Caption := '';
    FrmCadPedidoCompra.Label40.Caption := '';

    buscas.Close;
    buscas.SQL.Text := 'select pr.descr_prod, g.cod_grade,g.descricao,g.descricao1,' +
      ' (cgp.qtde - coalesce((select sum(pp.quant_ped_item) from  pedvenda_prod pp ' +
      ' inner join pedvenda v on v.nped=pp.nped and v.cod_empresa=pp.cod_empresa and pp.tipo=v.tipo' +
      ' where pp.grupo_prod = cgp.grupo_prod ' +
      ' and pp.cod_prod = cgp.cod_prod ' +
      ' and pp.cod_grade=cgp.cod_grade ' +
      ' and pp.cod_empresa =cgp.cod_empresa ' +
      ' and ((v.status_ped <>''FECHADA'') or (v.status_ped is null))' +
      ' and (pp.status<>''CANCELADO'' or pp.status is null)' +
      //' and v.NPED<>' + inttostr(dataSet.FieldByName('NPED').AsInteger) +
    ' and v.tipo<>''ORC''),0)) as qtd_item_disponivel, ' +
      ' cgp.qtde, ' +
      '(coalesce((select sum(pp.quant_ped_item) from  pedvenda_prod pp ' +
      ' inner join pedvenda v on v.nped=pp.nped and v.cod_empresa=pp.cod_empresa and pp.tipo=v.tipo' +
      ' where pp.grupo_prod = cgp.grupo_prod ' +
      ' and pp.cod_prod = cgp.cod_prod ' +
      ' and pp.cod_grade=cgp.cod_grade ' +
      ' and pp.cod_empresa =cgp.cod_empresa ' +
      ' and ((v.status_ped <>''FECHADA'') or (v.status_ped is null))' +
      ' and (pp.status<>''CANCELADO'' or pp.status is null)' +
      //' and v.NPED<>' + inttostr(dataSet.FieldByName('NPED').AsInteger) +
      ' and v.tipo<>''ORC''),0)) as qtd_item_pedAberto from grade g' +
      ' inner join cod_grade_prod cgp on g.cod_grade=cgp.cod_grade and g.cod_empresa =cgp.cod_empresa ' +
      ' inner join produtos pr on pr.grupo_prod = cgp.grupo_prod and pr.cod_prod = cgp.cod_prod and pr.cod_empresa = cgp.cod_empresa' +
      ' where cgp.grupo_prod = ' + inttostr(grupo) +
      ' and cgp.cod_prod = ' + QuotedStr(codProd) +
      ' and cgp.cod_empresa =' + vDadosIni.codEmpresa +
      ' order by g.cod_grade';
    buscas.open;
    buscas.FieldByName('cod_grade').DisplayLabel := 'Grade';
    buscas.FieldByName('descricao').DisplayLabel := 'Descrição 1';
    buscas.FieldByName('descricao1').DisplayLabel := 'Descrição 2';
    buscas.FieldByName('qtde').DisplayLabel := 'Qtd. total da grade';
    buscas.FieldByName('qtd_item_pedAberto').DisplayLabel := 'Qtd. em Vendas em Aberto';
    buscas.FieldByName('qtd_item_disponivel').DisplayLabel := 'Qtd. Disponível';
    buscas.FieldByName('descr_prod').Visible := false;
    FrmCadPedidoCompra.dsSelecionaGradeProd.dataSet := buscas;
    FrmCadPedidoCompra.Label38.Caption := buscas.FieldByName('descr_prod').Text;
    FrmCadPedidoCompra.Label39.Caption := IntToStr(grupo);
    FrmCadPedidoCompra.Label40.Caption := codProd;
    result := (formulario.ShowModal = IDOK);
    nGradeSelecionada := buscas.FieldByName('cod_grade').AsInteger;

  finally
    buscas.close;
    FrmCadPedidoCompra.pnSelecionaGradeProd.Parent := FrmCadPedidoCompra.tsSelecionaGradeProd;
    formulario.Free;
    formulario := nil;
  end;
end;


{ TListaFornecedor }

constructor TListaFornecedor.create;
begin
  Buscas := TIBQuery(DtmSugestaoCompras.qrLocFornecedor);
end;

destructor TListaFornecedor.destroy;
begin
  buscas.close;
  inherited;
end;

{ TBuscasClasses }

constructor TBuscasClasses.create;
begin
  if dtmSugestaoCompras = nil then
    dtmSugestaoCompras := TdtmSugestaoCompras.Create(dtmSugestaoCompras);
  transacao := TIBTransaction(dtmSugestaoCompras.IBTransBuscaClasse);
  Buscas := TIBQuery(dtmSugestaoCompras.qrBuscasClasses1)
end;

destructor TBuscasClasses.destroy;
begin
  buscas.close;
  inherited;
end;

function TBuscasClasses.ProdutoTemSimilar(codprod: string;
  grupoprod: integer; CodEmpresa: string): boolean;
begin
  result := false;
  buscas.Close;
  buscas.SQL.Text := '';
  if not vDadosIni.vProdSimilar.vAgruparSimilar then
  begin
    buscas.SQL.Text := buscas.SQL.Text +
    	' select p.cod_prod, p.grupo_prod, p.num_fab_prod, p.est_f, ps.descpsim, ' +
      ' (select estoque from getestoquedisponivel(ps.grupo_ps, ps.cod_ps, 0, ps.cod_empresa, 0, '''', 0, 0)) estoque ' +
      ' from prod_similares ps ' +
      ' inner join produtos p on ps.cod_ps = p.cod_prod and ps.grupo_ps = p.grupo_prod and p.cod_empresa = ps.cod_empresa ' +
      ' where ps.cod_prod = ' + quotedstr(trim(codprod)) +
      ' and ps.grupo_prod = ' + inttostr(grupoprod) +
      ' and p.cod_empresa in (' + CodEmpresa + ') ' +
      ' and ps.ativo = 1 ' +
      ' and p.ativo = 1 ';
  end
  else
  begin
  	buscas.SQL.Text := buscas.SQL.Text +
      ' select ps.cod_prod, ps.grupo_prod, p.num_fab_prod, p.est_f, p.descr_prod as descpsim, ' +
      ' (select estoque from getestoquedisponivel(ps.grupo_prod, ps.cod_prod, 0, ps.cod_empresa, 0, '''', 0, 0)) estoque ' +
      ' from prod_similares_grupos_itens ps ' +
      ' inner join produtos p on ps.grupo_prod = p.grupo_prod and ps.cod_prod = p.cod_prod and ps.cod_empresa = p.cod_empresa ' +
      ' where ps.cod_grupo_sim in ' +
      '     (select distinct ps1.cod_grupo_sim from prod_similares_grupos_itens ps1 ' +
      '      inner join prod_similares_grupos pp on pp.cod_grupo_sim = ps1.cod_grupo_sim and pp.cod_empresa = ps1.cod_empresa ' +
      '      inner join produtos p on ps1.grupo_prod = p.grupo_prod and ps1.cod_prod = p.cod_prod and ps1.cod_empresa = p.cod_empresa ' +
      '      where ps1.grupo_prod = ' + inttostr(grupoprod) +
      ' 		 and ps1.cod_prod = ' + QuotedStr(Trim(codprod)) +
      '      and ps1.cod_empresa = ' + CodEmpresa;

    if not vDadosIni.vProdSimilar.vSimilaresEntreSi then
      	buscas.sql.text := buscas.sql.text +
        	' and ps1.principal = ''S'' ';
          
    buscas.sql.text := buscas.sql.text +
      ' 		 and pp.ativo = 1) ' +
      ' and ps.cod_empresa in (' + CodEmpresa + ') ' +
      ' and not(ps.grupo_prod = ' + inttostr(grupoprod) +
      ' and ps.cod_prod = ' + QuotedStr(Trim(codprod)) + ') ';
  end;
  buscas.Open;
  buscas.FieldByName('estoque').DisplayLabel := 'Estoque Real';
  buscas.FieldByName('est_f').DisplayLabel := 'Estoque Físico';
  buscas.FieldByName('DESCPSIM').DisplayLabel := 'Produto';
  buscas.FieldByName('NUM_FAB_PROD').DisplayLabel := 'Número Fabricação';
  buscas.FieldByName('COD_PROD').DisplayLabel := 'Cód. Produto';
  buscas.FieldByName('GRUPO_PROD').DisplayLabel := 'Grupo Produto';
  if not buscas.IsEmpty then
  begin
    while not buscas.eof do
    begin
      if buscas.FieldByName('estoque').AsFloat > 0 then
      begin
        result := true;
        exit;
      end;
      buscas.next;
    end;
  end;
end;

function TBuscasClasses.RetornaCustoMedioVendaItem(codprod: string;
  grupoprod: integer; data: TDateTime): double;
begin
  buscas.Close;
  buscas.SQL.Text := 'select sum(ipv.quant_ped_item * ipv.pcust_mc) as vCustoMedio ' +
    ' from pedvenda_prod ipv ' +
    ' inner join pedvenda pv on ipv.nped = pv.nped and ipv.tipo = pv.tipo and ipv.cod_empresa = pv.cod_empresa ' +
    ' where ipv.cod_prod = ' + quotedstr(trim(codprod)) +
    ' and ((pv.tipo = ' + quotedstr('REQ') + ') or (pv.tipo = ' + quotedstr('OS') + ')) ' +
    ' and ipv.grupo_prod = ' + inttostr(grupoprod) +
    ' and (ipv.status is null or ipv.status = '''') and pv.data_fech >= :vdata1 ' +
    ' and pv.data_fech  <= :vdata2 ' +
    ' and pv.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and pv.ativo = 1';
  buscas.ParamByName('vData1').AsDate := Data + 1 - 30;
  buscas.ParamByName('vData2').AsDate := Data;
  buscas.Open;
  result := buscas.FieldByName('vCustoMedio').AsFloat;
  buscas.Close;
end;

function TBuscasClasses.RetornaEstF(codprod: string; grupoprod: integer;
  CodEmpresa: string): double;
begin
//	buscas.Close;
//  buscas.SQL.Text := ' select sum(coalesce(est_f, 0)) est_f from produtos ' +
//  	' where grupo_prod = ' + IntToStr(grupoprod) +
//    ' and cod_prod = ' + QuotedStr(trim(codprod)) +
//    ' and cod_empresa in (' + CodEmpresa + ') ' +
//    ' and ativo = 1';
//  buscas.Open;
//	result := buscas.FieldByName('est_f').AsFloat;
//  buscas.Close;

	buscas.Close;
  buscas.SQL.Text := ' select estoque from getestoquedisponivel(' +
  	IntToStr(grupoprod) + ', ' +
    QuotedStr(codprod) + ', ' +
    ' 0, ' +
    CodEmpresa + ', ' +
    '0, ' +
    ' '''',' +
    ' 0, ' +
    '0)';
  buscas.Open;

  result := buscas.FieldByName('estoque').AsFloat;
  buscas.Close;
end;

function TBuscasClasses.RetornaEstSeguranca(codprod: string; grupoprod: integer;
  CodEmpresa: string): Integer;
begin
	buscas.Close;
  buscas.SQL.Text := ' select sum(coalesce(est_seguranca, 0)) est_seguranca from produtos ' +
  	' where grupo_prod = ' + IntToStr(grupoprod) +
    ' and cod_prod = ' + QuotedStr(trim(codprod)) +
    ' and cod_empresa in (' + CodEmpresa + ') ' +
    ' and ativo = 1';
  buscas.Open;
  result := buscas.FieldByName('est_seguranca').AsInteger;
  buscas.Close;
end;

function TBuscasClasses.RetornaFreqPedido(codprod: string; grupoprod: integer;
  CodEmpresa: string): Integer;
begin
	buscas.Close;
  buscas.SQL.Text := ' select sum(coalesce(freq_pedido, 0)) freq_pedido from produtos ' +
  	' where grupo_prod = ' + IntToStr(grupoprod) +
    ' and cod_prod = ' + QuotedStr(trim(codprod)) +
    ' and cod_empresa in (' + CodEmpresa + ') ' +
    ' and ativo = 1';
  buscas.Open;
  result := buscas.FieldByName('freq_pedido').AsInteger;
  buscas.Close;
end;

function TBuscasClasses.RetornaQtdItensCompra(codprod: string;
  grupoprod: integer; data: TDateTime): double;
begin
  buscas.Close;
  buscas.SQL.Text := ' select sum(it.quant_item_nfe) as qtdItemNFE,sum(it.quant_item_nfe*it.prec_cus_cnt) ' +
    ' from item_nf_entrada it ' +
    ' inner join nf_entrada nf on it.num_nota_nfe = nf.num_nota_nfe and it.cod_forn_nfe = nf.cod_forn_nfe and it.cod_empresa = nf.cod_empresa ' +
    ' where it.grupo_prod = ' + inttostr(grupoprod) +
    ' and it.cod_prod = ' + quotedstr(trim(codprod)) +
    ' and it.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and nf.ativo = 1 ' +
    ' and nf.data_lanc_nfe >= :vdata and (not nf.status_nfe is null)' +
    ' union ' +
    ' select sum(it4.quantidade),sum(it4.quantidade*it4.prec_cus_cnt) ' +
    ' from notafiscal_item it4 ' +
    ' inner join notafiscal nf4 on it4.cod_nf = nf4.cod_nf and it4.cod_empresa = nf4.cod_empresa ' +
    ' where it4.grupo_prod = ' + inttostr(grupoprod) +
    ' and it4.cod_prod = ' + quotedstr(trim(codprod)) +
    ' and it4.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and nf4.natureza_nf = ''E'' ' +
    ' and nf4.ativo = 1 ' +
    ' and (it4.altera_estoque_cfop <> ''N'' or it4.altera_estoque_cfop is null) ' +
    ' and nf4.data_lanc  >= :vdata ' +
    ' and (nf4.status = ''Fechada'')';
  buscas.ParamByName('vData').AsDate := Data + 1;
  buscas.Open;
  result := 0;
  while not buscas.eof do
  begin
    result := result + buscas.FieldByName('qtdItemNFE').AsFloat;
    buscas.next;
  end;
  //  result := buscas.FieldByName('qtdItemNFE').AsFloat;
  buscas.Close;
end;

function TBuscasClasses.RetornaQtdItensDevolvidos(codprod: string;
  grupoprod: integer; data: TDateTime; CodEmpresa: string): double;
begin
  buscas.Close;
  buscas.SQL.Text := ' select sum(case when (coalesce(valor_tot, 0) > 0) then coalesce(valor_tot, 0) else coalesce(quant, 0) * coalesce(valor, 0) end) as SomaValorDevolvido, ' +
    ' sum(coalesce(quant, 0)) as qtdItemDevolvido from devolucao ' +
    ' where cod_prod = ' + quotedstr(trim(codprod)) +
    ' and grupo_prod = ' + inttostr(grupoprod) +
    ' and data  >= :vdata ' +
    ' and cod_empresa in ( ' + CodEmpresa + ') ' +
    ' and ativo = 1 ';
  buscas.ParamByName('vData').AsDate := Data + 1;
  buscas.Open;
  result := buscas.FieldByName('qtdItemDevolvido').AsFloat;
  buscas.Close;
end;

function TBuscasClasses.RetornaQtdItensPedidoNaoRecebido(codprod: string;
  grupoprod: integer; CodEmpresa: string): double;
begin
  buscas.Close;
  buscas.SQL.Text := 'select sum(coalesce(it.quant_it_prod, 0)) as qtdItemPedido ' +
    ' from item_pedido it ' +
    ' inner join pedido pd on it.num_ped = pd.num_ped and it.cod_empresa = pd.cod_empresa ' +
    ' where it.grupo_prod = ' + inttostr(grupoprod) +
    ' and it.cod_prod = ' + quotedstr(trim(codprod)) +
    ' and pd.status_ped  = ' + quotedstr('EFETIVADO') +
    ' and pd.cod_empresa in (' + CodEmpresa + ') ' +
    ' and pd.ativo = 1 '+
    ' and coalesce(it.recebido, ''N'') = ''N''';
  buscas.Open;
  result := buscas.FieldByName('qtdItemPedido').AsFloat;
  buscas.Close;

  buscas.Close;
  buscas.SQL.Text := 'select sum(distinct(coalesce(ir.qtde_recebida,0))) qtdeRecebida' +
    ' from item_pedido it' +
    ' inner join pedido pd on it.num_ped = pd.num_ped and it.cod_empresa = pd.cod_empresa' +
    ' left join item_pedido_nf_rec ir on ir.num_ped = it.num_ped' +
    ' and ir.grupo_prod = it.grupo_prod and ir.cod_prod = it.cod_prod' +
    ' and ir.cod_empresa = it.cod_empresa and ir.nitem = it.nitem' +
    ' where it.grupo_prod = ' + inttostr(grupoprod) +
    ' and it.cod_prod = ' + quotedstr(trim(codprod)) +
    ' and pd.status_ped  = ''EFETIVADO''' +
    ' and pd.cod_empresa in (' + CodEmpresa + ') ' +
    ' and pd.ativo = 1 ' +
    ' and coalesce(it.recebido, ''N'') = ''N''';
  buscas.Open;
  if buscas.FieldByName('qtdeRecebida').AsFloat > result then
    Result := 0
  else
    result := result - buscas.FieldByName('qtdeRecebida').AsFloat;
  buscas.Close;

end;

function TBuscasClasses.RetornaQtdItensVendaGlobal(codprod: string; grupoprod: integer; data: TDateTime; CodEmpresa: string): double;
begin
  buscas.Close;
  buscas.SQL.Text := 'select sum(ipv.quant_ped_item) as qtdItemREQOS,sum(ipv.quant_ped_item * ipv.pcust_mc) as vCustoMedio ' +
    ' from pedvenda_prod ipv ' +
    ' inner join pedvenda pv on ipv.nped = pv.nped and ipv.tipo = pv.tipo and ipv.cod_empresa = pv.cod_empresa ' +
    ' where ipv.cod_prod = ' + quotedstr(trim(codprod)) +
    ' and ipv.grupo_prod = ' + inttostr(grupoprod) +
    ' and ((pv.tipo = ' + quotedstr('REQ') + ') or (pv.tipo = ' + quotedstr('OS') + ')) ' +
    ' and (ipv.status is null or ipv.status = '''') and pv.data_fech  >= :vdata ' +
    ' and pv.cod_empresa in (' + CodEmpresa + ') ' +
    ' and pv.ativo = 1 ';
  buscas.ParamByName('vData').AsDate := Data + 1;
  buscas.Open;
  result := buscas.FieldByName('qtdItemREQOS').AsFloat;
  buscas.Close;
end;

function TBuscasClasses.RetornaQtdItensVenda(codprod: string; grupoprod, grade,
  QtdMesEmpresa: integer; tiposVenda, tiposOrigem, juncao: string; CodEmpresa: string): double;
begin
  buscas.Close;
  buscas.SQL.Text := 'select sum(ipv.quant_ped_item) as qtdItemREQOS from pedvenda pv ' +
  	'	inner join pedvenda_prod ipv on ipv.nped = pv.nped and ipv.tipo = pv.tipo and ipv.cod_empresa = pv.cod_empresa ' +
    '		 and (ipv.status is null or status = '''') ' +
//    juncao + ' join cod_grade_prod_venda cgpv ' +
//    ' on cgpv.nreq=pv.nped and cgpv.grupo_prod=ipv.grupo_prod and cgpv.cod_prod=ipv.cod_prod and cgpv.cod_empresa=ipv.cod_empresa ' +
  	' where ipv.cod_prod = ' + quotedstr(trim(codprod)) +
    ' and ipv.grupo_prod = ' + inttostr(grupoprod) +
    ' and pv.data_fech >= :vData ' +
    ' and ((pv.tipo = ' + quotedstr('REQ') + ') or (pv.tipo = ' + quotedstr('OS') +
    ' and pv.tipo_os in ' + vdadosini.vTipoVendaOS + ')) ' +
    ' and pv.cod_empresa in (' + CodEmpresa + ') ' +
    ' and pv.ativo = 1 ' +
    ' and ' + tiposVenda;
//  if grade = 0 then
//    buscas.SQL.Text := buscas.SQL.Text + ' and cgpv.cod_grade is null'
//  else
//    buscas.SQL.Text := buscas.SQL.Text + ' and cgpv.cod_grade = ' + inttostr(grade);
  buscas.SQL.Text := buscas.SQL.Text + ' and ipv.cod_grade = ' + inttostr(grade);
  buscas.ParamByName('vData').AsDate := date - (QtdMesEmpresa * 30);
  buscas.Open;
  result := buscas.FieldByName('qtdItemREQOS').AsFloat;
  buscas.Close;
end;

function TBuscasClasses.RetornaQtdItensVenda(codprod: string; grupoprod,
  QtdMesEmpresa: integer; tiposVenda, tiposOrigem, juncao: string; CodEmpresa: string): double;
begin
  buscas.Close;
  buscas.SQL.Text := 'select sum(ipv.quant_ped_item) as qtdItemREQOS from pedvenda pv ' +
  	' inner join pedvenda_prod ipv on ipv.nped = pv.nped and ipv.cod_empresa = pv.cod_empresa and ipv.tipo = pv.tipo ' +
    ' 	and (ipv.status is null or status = '''') ' +
//    juncao + ' join cod_grade_prod_venda cgpv ' +
//    ' on cgpv.nreq=pv.nped and cgpv.grupo_prod=ipv.grupo_prod and cgpv.cod_prod=ipv.cod_prod and cgpv.cod_empresa=ipv.cod_empresa ' +
    ' where ipv.cod_prod = ' + quotedstr(trim(codprod)) +                
    ' and ipv.grupo_prod = ' + inttostr(grupoprod) +
    ' and pv.data_fech >= :vData ' +
    ' and ((pv.tipo = ' + quotedstr('REQ') + ') or (pv.tipo = ' + quotedstr('OS') +
    ' and pv.tipo_os in ' + vDadosIni.vTipoVendaOS + ')) ' +
    ' and pv.cod_empresa in ( ' + CodEmpresa + ') ' +
    ' and pv.ativo = 1 ' +
    ' and ' + tiposVenda;
  buscas.ParamByName('vData').AsDate := date - (QtdMesEmpresa * 30);
  buscas.Open;
  result := buscas.FieldByName('qtdItemREQOS').AsFloat;
  buscas.Close;
end;

function TBuscasClasses.RetornaQtdItensVendaAberta(codprod: string;
  grupoprod: integer; CodEmpresa: string): double;
begin
  buscas.Close;
  buscas.SQL.Text := 'select sum(coalesce(ipv.quant_ped_item, 0)) as qtdItemReqOs from pedvenda pv ' +
    ' inner join pedvenda_prod ipv on ipv.nped = pv.nped and ipv.tipo = pv.tipo and pv.cod_empresa = ipv.cod_empresa ' +
    ' where ipv.grupo_prod = ' + inttostr(grupoprod) +
    ' and ipv.cod_prod = ' + quotedstr(trim(codprod)) +
    ' and ((pv.data_fech is null) or (pv.data_fech < ' + quotedstr('01/01/1899') + ')) ' +
    ' and ((pv.tipo = ' + quotedstr('REQ') + ') or (pv.tipo = ' + quotedstr('OS') + ')) ' +
    ' and (ipv.status is null or status = '''') ' +
    ' and pv.cod_empresa in (' + CodEmpresa + ') ' +
    ' and pv.ativo = 1 ';
  buscas.Open;
  result := buscas.FieldByName('qtdItemReqOs').AsFloat;
  buscas.Close;
  buscas.SQL.Text := 'select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) as somaEstoque from producao pd ' +
    ' inner join producao_item_indice pi on pd.cod_producao = pi.cod_producao and pd.cod_empresa = pi.cod_empresa ' +
    ' where pi.grupo_prod = ' + IntToStr(grupoprod) +
    ' and pi.cod_prod = ' + QuotedStr(codprod) +
    ' and pd.cod_empresa in (' + CodEmpresa + ') ' +
    ' and (pd.data_fechamento is null) ';
  buscas.Open;
  result := result + buscas.FieldByName('somaEstoque').AsFloat;
  buscas.close;
end;

function TBuscasClasses.RetornaQtdItensVenda(codprod: string; grupoprod,
  QtdMesEmpresa: integer; CodEmpresa: string): double; //Nao conta vendas consignadas ...
begin
  buscas.Close;
  buscas.SQL.Text := 'select sum(ipv.quant_ped_item) as qtdItemREQOS from pedvenda pv ' +
    ' inner join pedvenda_prod ipv on ipv.nped = pv.nped and ipv.tipo = pv.tipo and ipv.cod_empresa = pv.cod_empresa ' +
    ' where ipv.cod_prod = ' + quotedstr(trim(codprod)) +
    ' and ipv.grupo_prod = ' + inttostr(grupoprod) +
    ' and pv.data_fech >= :vData ' +
    ' and ((pv.tipo = ' + quotedstr('REQ') + ' and pv.tipv in ' + vDadosIni.vTipoVendaREQ + ') ' +
    ' or (pv.tipo = ' + quotedstr('OS') + ' and pv.tipo_os in ' + vDadosIni.vTipoVendaOS + ')) ' +
    ' and (ipv.status is null or ipv.status = '''')' +
    ' and pv.cod_empresa in (' + CodEmpresa + ') ' +
    ' and pv.ativo = 1 ';
  buscas.ParamByName('vData').AsDate := date - (QtdMesEmpresa * 30);
  buscas.Open;
  result := buscas.FieldByName('qtdItemREQOS').AsFloat;
  buscas.Close;
end;

function TBuscasClasses.RetornaQtdItensVendaPerdida(codprod: string; grupoprod,
  QtdMesEmpresa: integer; CodEmpresa: string): double;
begin
  buscas.Close;
  buscas.SQL.Text := 'select sum(coalesce(vnp.quant_prod_vp, 0)) as qtdItemVndPerd from venda_perdida vnp,tipovp tp ' +
    ' where vnp.cod_prod = ' + quotedstr(trim(codprod)) +
    ' and vnp.grupo_prod = ' + inttostr(grupoprod) +
    ' and vnp.data_vnp >= :vData ' +
    ' and vnp.codigo_vp = tp.codigo_vp ' +
    ' and tp.ent_sug_vp = ' + quotedstr('S') +
    ' and vnp.cod_empresa = tp.cod_empresa ' +
    ' and vnp.cod_empresa in (' + CodEmpresa + ') ' +
    ' and vnp.ativo = 1 ';
  buscas.ParamByName('vData').AsDate := date - (QtdMesEmpresa * 30);
  buscas.Open;
  result := buscas.FieldByName('qtdItemVndPerd').AsFloat;
  buscas.close;
end;

function TBuscasClasses.RetornaQuantPedProd(codprod: string; grupoprod: integer;
  CodEmpresa: string): double;
begin
	buscas.Close;
  buscas.SQL.Text := ' select sum(coalesce(quant_ped_prod, 0)) quant_ped_prod from produtos ' +
  	' where grupo_prod = ' + IntToStr(grupoprod) +
    ' and cod_prod = ' + QuotedStr(trim(codprod)) +
    ' and cod_empresa in (' + CodEmpresa + ') ' +
    ' and ativo = 1 ';
  buscas.Open;
  result := buscas.FieldByName('quant_ped_prod').AsFloat;
  buscas.Close;
end;

function TBuscasClasses.RetornaTempoEntrega(codprod: string; grupoprod: integer;
  CodEmpresa: string): Integer;
begin
	buscas.Close;
  buscas.SQL.Text := ' select sum(coalesce(tempo_entregasug, 0)) tempo_entregasug from produtos ' +
  	' where grupo_prod = ' + IntToStr(grupoprod) +
    ' and cod_prod = ' + QuotedStr(trim(codprod)) +
    ' and cod_empresa in (' + CodEmpresa + ') ' +
    ' and ativo = 1 ';
  buscas.Open;
  result := buscas.FieldByName('tempo_entregasug').AsInteger;
  buscas.Close;
end;

{ TExecClasses }

constructor TExecClasses.create;
begin
  transacao := TIBTransaction(DtmSugestaoCompras.IBTransGravaClasse);
  Buscas := TIBQuery(dtmSugestaoCompras.qrBuscasClasses2)
end;

destructor TExecClasses.destroy;
begin
  buscas.Close;
  inherited;
end;

{ TDefinicaoClasses }

constructor TDefinicaoClasses.create;
begin
  if dtmSugestaoCompras = nil then
    dtmSugestaoCompras := TdtmSugestaoCompras.Create(dtmSugestaoCompras);
  transacao := TIBTransaction(dtmSugestaoCompras.IBTransDefClasse);
  Buscas := TIBQuery(dtmSugestaoCompras.qrBuscasDefClasse)
end;

procedure TDefinicaoClasses.DefClasseServ;
begin
  try
    Application.CreateForm(TFrmDefinirClasseServ, FrmDefinirClasseServ);
    FrmDefinirClasseServ.ShowModal;
  finally
    FrmDefinirClasseServ.Free;
    FrmDefinirClasseServ := nil;
  end;
end;

function TDefinicaoClasses.DefinirClassesServico: boolean;
var
  totalA, totalB, totalC, somaServ, somaqt, somaServTotal, CountQtdServTotal, SomaQtdServTotal: currency;
  totalP1, totalP2, totalP3: double;
  dmd, totalQ1, totalQ2, totalQ3: double;
  i, qtdServ: integer;
begin
  result := false;
  if not TipoOSSelecionada then
    exit;
  if Busca = nil then
    Busca := TBuscasClasses.create;
  if Grava = nil then
    Grava := TExecClasses.create;

  SetaVariaveis;
  buscas.Close;
  buscas.SQL.Text := 'select ps.cod_servico,' +
    ' count(ps.quant_serv_ped) as cquant_serv_ped,' +
    ' sum(ps.quant_serv_ped) as squant_serv_ped,' +
    ' sum(coalesce(ps.valor_tot_serv,0)+coalesce(PRC_INT_SERV,0)) as valor_tot_serv,' +
    ' sum(ps.rateio_desc) as rateio_desc,' +
    ' sum(ps.rateio_acresc) as rateio_acresc,' +
    ' sum(ps.acresc_item) as acresc_item ' +
    ' from pedvenda p,pedvenda_serv ps,tipo_servico ts ' +
    ' where ps.nped = p.nped and ps.cod_empresa = p.cod_empresa and ps.tipo = p.tipo and (ps.status is null or ps.status = '''')' +
    ' and p.data_fech >= :vdata ' +
    ' and ps.cod_servico = ts.cod_servico and p.tipo = ''OS'' and ' + TipoOSSelec +
    ' and (p.status_ped <> '''' and not p.status_ped is null)' +
    ' and p.ativo = 1 and p.cod_empresa= ' + vDadosIni.codEmpresa +
    ' group by ps.cod_servico order by ps.cod_servico';
  buscas.ParamByName('vdata').AsDate := date - (QtdMesEmpresa * 30);
  buscas.Prepare;
  buscas.Open;
  FrmDefinirClasseServ.ProgressBar.min := 0;
  FrmDefinirClasseServ.ProgressBar.position := 0;
  buscas.FetchAll;
  FrmDefinirClasseServ.ProgressBar.max := buscas.RecordCount;
  FrmDefinirClasseServ.lb.Caption := 'Somando Valor dos serviços prestados no(s) Último(s)' + inttostr(QtdMesEmpresa)
    + 'mês(es)';
  buscas.First;
  while not buscas.eof do
  begin
    Application.ProcessMessages;
    somaServTotal := somaServTotal + buscas.FieldByName('valor_tot_serv').AsFloat;
    //    CountQtdServTotal := CountqtdServTotal + buscas.FieldByName('cquant_serv_ped').AsFloat;
    //    SomaQtdServTotal := SomaqtdServTotal + buscas.FieldByName('squant_serv_ped').AsFloat;
    buscas.next;
    if FrmDefinirClasseServ.ProgressBar <> nil then
      FrmDefinirClasseServ.ProgressBar.Position := FrmDefinirClasseServ.ProgressBar.Position + 1;
    if FrmDefinirClasseServ.lb <> nil then
      FrmDefinirClasseServ.lb.Caption := 'Somando Valor dos serviços prestados no(s) Último(s)' + inttostr(QtdMesEmpresa)
        + 'mês(es) -> Toatal: R$' + format('%8.2f', [somaServTotal]);
//    buscas.next;
    if PararProcessamento then
      break;
  end;
  if Parar then
  begin
    FrmDefinirClasseServ.ProgressBar.Position := 0;
    FrmDefinirClasseServ.lb.Caption := '0';
    Parar := false;
    exit;
  end;

  //Classificação D , T4, Q4 e P4
  buscas.Close;
  buscas.SQL.Text := 'select cod_servico,DATA_CAD_TIPO from tipo_servico where cod_empresa = '+vDadosIni.codEmpresa+' and ativo=1';
  buscas.Open;
  buscas.FetchAll;
  FrmDefinirClasseServ.ProgressBar.min := 0;
  FrmDefinirClasseServ.ProgressBar.max := buscas.RecordCount;
  FrmDefinirClasseServ.ProgressBar.position := 0;
  buscas.first;
  while not buscas.eof do
  begin
    Application.ProcessMessages;
(*    Busca.buscas.Close;
    Busca.buscas.SQL.Text := 'select ps.cod_servico from pedvenda_serv ps,pedvenda p' +
      ' where ps.cod_servico = ' + buscas.FieldByName('COD_SERVICO').asstring +
      ' and ps.nped =p.nped and p.tipo=''OS'' and ' + TipoOSSelec + ' and ps.tipo = p.tipo and (ps.status is null or ps.status = '''') and p.data_fech >= :vdata' +
      ' and p.cod_empresa = ps.cod_empresa' +
      ' and p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and p.ativo=1';
    Busca.buscas.ParamByName('vdata').AsDate := date - (QtdMesEmpresa * 30);
    Busca.buscas.Open;

    if Busca.buscas.IsEmpty then*)
    begin
      Grava.buscas.close;
      Grava.buscas.SQL.Text := 'update tipo_servico set CLASSE_ATL = :CLATL,CLASSE_SERV = :CLSERV, ' +
        'CLASSE_POP = :CLPOP, CLASSE_QTD = :CLQTD, DMD= :vDMD WHERE COD_SERVICO = ' + buscas.FieldByName('COD_SERVICO').asstring+
        ' AND COD_EMPRESA = '+vDadosIni.codEmpresa;

      //Classifica atualidade como R os serviços cadastrados no último mes.
      if buscas.FieldByName('DATA_CAD_TIPO').AsDateTime > date - 30 then
        Grava.buscas.ParamByName('CLATL').AsString := 'R'
      else
        Grava.buscas.ParamByName('CLATL').AsString := 'T4';
      Grava.buscas.ParamByName('CLSERV').AsString := 'D';
      Grava.buscas.ParamByName('CLPOP').AsString := 'P4';
      Grava.buscas.ParamByName('CLQTD').AsString := 'Q4';
      Grava.buscas.ParamByName('vDMD').Asfloat := 0;
      Grava.buscas.Prepare;
      Grava.buscas.ExecSQL;
    end;

    buscas.Next;
    FrmDefinirClasseServ.ProgressBar.Position := FrmDefinirClasseServ.ProgressBar.Position + 1;
    FrmDefinirClasseServ.lb.Caption := 'Classificando serviços ''D'', ''Q4'', ''T4'' e ''P4''     ' + vDadosIni.strzero(FrmDefinirClasseServ.ProgressBar.Position, 5);
    if PararProcessamento then
      break;
  end;
  if Parar then
  begin
    FrmDefinirClasseServ.ProgressBar.Position := 0;
    FrmDefinirClasseServ.lb.Caption := '0';
    Parar := false;
    exit;
  end;
  if Grava.emTransacao then
    if not Grava.CommitaTransacao then
    begin
      Application.MessageBox(Pchar('Falha na definição de classes para Serviços para os atributos ''D'', ''Q4'', ''T4'' e ''P4''' + chr(13) + 'O processo será abortado.'), 'Aviso', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON1);
      exit;
    end;

  //////////////////////////////////////A B e C
  buscas.Close;
  buscas.SQL.Text := 'select ps.cod_servico,sum(coalesce(ps.valor_tot_serv,0)+coalesce(PRC_INT_SERV,0)) as totalserv from pedvenda_serv ps,pedvenda p' +
    //    ' where ps.nped =p.nped and p.tipo=''OS'' and p.tipo_os = ''CLIENTE''' +
  ' where ps.nped =p.nped and p.tipo=''OS'' and ' + TipoOSSelec +
    ' and ps.tipo = p.tipo and (ps.status is null or ps.status = '''') and p.data_fech >= :vdata' +
    ' and p.cod_empresa = ps.cod_empresa' +
    ' and p.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and p.ativo=1 group by ps.cod_servico order by 2 desc';
  buscas.ParamByName('vdata').AsDate := date - (QtdMesEmpresa * 30);
  buscas.Prepare;
  buscas.Open;
  buscas.FetchAll;
  FrmDefinirClasseServ.ProgressBar.min := 0;
  FrmDefinirClasseServ.ProgressBar.max := buscas.RecordCount;
  FrmDefinirClasseServ.ProgressBar.position := 0;
  FrmDefinirClasseServ.lb.Caption := 'Classificando serviços ''A'', ''B'' e ''C''     ' + vDadosIni.strzero(FrmDefinirClasseServ.ProgressBar.Position, 5);
  buscas.First;

  totalA := ((somaServTotal * 70) / 100);
  totalB := ((somaServTotal * 20) / 100);
  somaServ := 0.00;
  i := 1;
  while not buscas.eof do
  begin
    Application.ProcessMessages;
    if i = 1 then
    begin
      Grava.buscas.close;
      Grava.buscas.SQL.Text := 'update tipo_servico set CLASSE_SERV = ''A''' +
        ' WHERE COD_SERVICO = ' + buscas.FieldByName('COD_SERVICO').asstring+' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
    end
    else if i = 2 then
    begin
      Grava.buscas.close;
      Grava.buscas.SQL.Text := 'update tipo_servico set CLASSE_SERV = ''B''' +
        ' WHERE COD_SERVICO = ' + buscas.FieldByName('COD_SERVICO').asstring+' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
    end
    else
    begin
      Grava.buscas.close;
      Grava.buscas.SQL.Text := 'update tipo_servico set CLASSE_SERV = ''C''' +
        ' WHERE COD_SERVICO = ' + buscas.FieldByName('COD_SERVICO').asstring+' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
    end;
    Grava.buscas.Prepare;
    Grava.buscas.ExecSQL;
    somaServ := somaServ + buscas.FieldByName('totalserv').AsFloat;
    if i = 1 then
    begin
      if somaServ >= totalA then
      begin
        somaServ := 0.00;
        i := 2;
      end;
    end
    else
    begin
      if i = 2 then
      begin
        if somaServ >= totalB then
        begin
          somaServ := 0.00;
          i := 3;
        end;
      end;
    end;
    buscas.Next;
    FrmDefinirClasseServ.ProgressBar.Position := FrmDefinirClasseServ.ProgressBar.Position + 1;
    FrmDefinirClasseServ.lb.Caption := 'Classificando serviços ''A'', ''B'' e ''C''     ' + vDadosIni.strzero(FrmDefinirClasseServ.ProgressBar.Position, 5);
    if PararProcessamento then
      break;
  end;
  if Parar then
  begin
    FrmDefinirClasseServ.ProgressBar.Position := 0;
    FrmDefinirClasseServ.lb.Caption := '0';
    Parar := false;
    exit;
  end;
  if grava.emTransacao then
    if not Grava.CommitaTransacao then
    begin
      Application.MessageBox(Pchar('Falha na definição de classes para Serviços para os atributos ''A'', ''B'' e ''C''' + chr(13) + 'O processo será abortado.'), 'Aviso', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON1);
      exit;
    end;

  ////////////////////////////////////
    // P1 P2 P3 P4
  buscas.Close;
  buscas.SQL.Text := 'SELECT ps.cod_servico,count(ps.quant_serv_ped) as qtdServ ' +
    ' from pedvenda p INNER JOIN pedvenda_serv ps ' +
    ' on p.nped = ps.nped and p.cod_empresa = ps.cod_empresa and p.tipo = ps.tipo and (ps.status is null or ps.status = '''') ' +
    ' where (p.status_ped <> '''' and not p.status_ped is null) and p.ativo = 1 and' +
    //    ' ps.ativo = 1 and (p.tipo = ''OS'' and p.tipo_os = ''CLIENTE'') ' +
  ' ps.ativo = 1 and p.tipo = ''OS'' and ' + TipoOSSelec +
    ' and p.cod_empresa=' + vDadosIni.codEmpresa +
    ' and p.data_fech>= :vdata' +
    ' group by ps.cod_servico order by 2 desc';
  buscas.ParamByName('vdata').AsDate := date - (QtdMesEmpresa * 30);
  buscas.Prepare;
  buscas.Open;
  buscas.FetchAll;
  FrmDefinirClasseServ.ProgressBar.min := 0;
  FrmDefinirClasseServ.ProgressBar.max := buscas.RecordCount;
  FrmDefinirClasseServ.ProgressBar.position := 0;
  CountQtdServTotal := FrmDefinirClasseServ.ProgressBar.max;

  FrmDefinirClasseServ.lb.Caption := 'Classificando serviços ''P1'', ''P2'' e ''P3''     ' + vDadosIni.strzero(FrmDefinirClasseServ.ProgressBar.Position, 5);
  buscas.First;
  totalP1 := ((CountQtdServTotal * 10) / 100);
  totalP2 := ((CountQtdServTotal * 20) / 100);
  totalP3 := ((CountQtdServTotal * 70) / 100);
  i := 1;
  qtdServ := 0;
  while not buscas.Eof do
  begin
    Application.ProcessMessages;
    if i = 1 then
    begin
      Grava.buscas.close;
      Grava.buscas.SQL.Text := 'update tipo_servico set CLASSE_POP = ''P1''' +
        ' WHERE COD_SERVICO = ' + buscas.FieldByName('COD_SERVICO').asstring+' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
    end
    else if i = 2 then
    begin
      Grava.buscas.close;
      Grava.buscas.SQL.Text := 'update tipo_servico set CLASSE_POP = ''P2''' +
        ' WHERE COD_SERVICO = ' + buscas.FieldByName('COD_SERVICO').asstring+' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
    end
    else
    begin
      Grava.buscas.close;
      Grava.buscas.SQL.Text := 'update tipo_servico set CLASSE_POP = ''P3''' +
        ' WHERE COD_SERVICO = ' + buscas.FieldByName('COD_SERVICO').asstring+' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
    end;
    Grava.buscas.Prepare;
    Grava.buscas.ExecSQL;
    qtdServ := qtdServ + 1; //ver com o Herbert
    //    qtdServ := qtdServ + buscas.FieldByName('qtdServ').AsInteger;
    if i = 1 then
    begin
      if qtdServ >= totalP1 then
      begin
        qtdServ := 0;
        i := 2;
      end;
    end
    else if i = 2 then
    begin
      if qtdServ >= totalP2 then
      begin
        qtdServ := 0;
        i := 3;
      end;
    end;
    buscas.next;
    FrmDefinirClasseServ.ProgressBar.Position := FrmDefinirClasseServ.ProgressBar.Position + 1;
    FrmDefinirClasseServ.lb.Caption := 'Classificando serviços ''P1'', ''P2'' e ''P3''     ' + vDadosIni.strzero(FrmDefinirClasseServ.ProgressBar.Position, 5);
    if PararProcessamento then
      break;
  end;
  if Parar then
  begin
    FrmDefinirClasseServ.ProgressBar.Position := 0;
    FrmDefinirClasseServ.lb.Caption := '0';
    Parar := false;
    exit;
  end;
  if grava.emTransacao then
    if not Grava.CommitaTransacao then
    begin
      Application.MessageBox(Pchar('Falha na definição de classes para Serviços para os atributos ''P1'', ''P2'' e ''P3''' + chr(13) + 'O processo será abortado.'), 'Aviso', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON1);
      exit;
    end;

  ////////////////////////
  //Q1 Q2 Q3 Q4'
  buscas.Close;
  buscas.SQL.Text := 'SELECT ps.cod_servico,sum(ps.quant_serv_ped) as totalServ ' +
    ' from pedvenda p INNER JOIN pedvenda_serv ps ' +
    ' on p.nped = ps.nped and p.cod_empresa = ps.cod_empresa and p.tipo = ps.tipo and (ps.status is null or ps.status = '''')' +
    ' where (p.status_ped <> '''' and not p.status_ped is null) and p.ativo = 1 and' +
    ' ps.ativo = 1 and p.tipo = ''OS'' and ' + TipoOSSelec +
    ' and p.cod_empresa=' + vDadosIni.codEmpresa +
    ' and p.data_fech>= :vdata' +
    ' group by ps.cod_servico order by 2 desc';
  buscas.ParamByName('vdata').AsDate := date - (QtdMesEmpresa * 30);
  buscas.Prepare;
  buscas.Open;
  buscas.FetchAll;
  FrmDefinirClasseServ.ProgressBar.min := 0;
  FrmDefinirClasseServ.ProgressBar.max := buscas.RecordCount;
  FrmDefinirClasseServ.ProgressBar.position := 0;
  SomaQtdServTotal := FrmDefinirClasseServ.ProgressBar.max;
  FrmDefinirClasseServ.lb.Caption := 'Classificando serviços ''Q1'', ''Q2'' e ''Q3''     ' + vDadosIni.strzero(FrmDefinirClasseServ.ProgressBar.Position, 5);
  buscas.First;
  totalQ1 := ((SomaQtdServTotal * 10) / 100);
  totalQ2 := ((SomaQtdServTotal * 20) / 100);
  totalQ3 := ((SomaQtdServTotal * 70) / 100);
  i := 1;
  qtdServ := 0;
  while not buscas.Eof do
  begin
    Application.ProcessMessages;
    dmd := buscas.FieldByName('totalServ').asfloat / (QtdMesEmpresa * 30);
    if i = 1 then
    begin
      Grava.buscas.close;
      Grava.buscas.SQL.Text := 'update tipo_servico set DMD = ' + vDadosIni.trocaVirgulaPorPonto(floattostr(dmd)) +
        ' ,CLASSE_QTD = ''Q1''' +
        ' WHERE COD_SERVICO = ' + buscas.FieldByName('COD_SERVICO').asstring+' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
    end
    else if i = 2 then
    begin
      Grava.buscas.close;
      Grava.buscas.SQL.Text := 'update tipo_servico set DMD = ' + vDadosIni.trocaVirgulaPorPonto(floattostr(dmd)) +
        ' ,CLASSE_QTD = ''Q2''' +
        ' WHERE COD_SERVICO = ' + buscas.FieldByName('COD_SERVICO').asstring+' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
    end
    else
    begin
      Grava.buscas.close;
      Grava.buscas.SQL.Text := 'update tipo_servico set DMD = ' + vDadosIni.trocaVirgulaPorPonto(floattostr(dmd)) +
        ' ,CLASSE_QTD = ''Q3''' +
        ' WHERE COD_SERVICO = ' + buscas.FieldByName('COD_SERVICO').asstring+' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
    end;
    Grava.buscas.Prepare;
    Grava.buscas.ExecSQL;
    qtdServ := qtdServ + 1; // Ver com o Herbert
    //    qtdServ := qtdServ + buscas.FieldByName('totalServ').AsInteger;
    if i = 1 then
    begin
      if qtdServ >= totalQ1 then
      begin
        qtdServ := 0;
        i := 2;
      end;
    end
    else if i = 2 then
    begin
      if qtdServ >= totalQ2 then
      begin
        qtdServ := 0;
        i := 3;
      end;
    end;
    buscas.next;
    FrmDefinirClasseServ.ProgressBar.Position := FrmDefinirClasseServ.ProgressBar.Position + 1;
    FrmDefinirClasseServ.lb.Caption := 'Classificando serviços ''Q1'', ''Q2'' e ''Q3''     ' + vDadosIni.strzero(FrmDefinirClasseServ.ProgressBar.Position, 5);
    if PararProcessamento then
      break;
  end;
  if Parar then
  begin
    FrmDefinirClasseServ.ProgressBar.Position := 0;
    FrmDefinirClasseServ.lb.Caption := '0';
    Parar := false;
    exit;
  end;
  if grava.emTransacao then
    if not Grava.CommitaTransacao then
    begin
      Application.MessageBox(Pchar('Falha na definição de classes para Serviços para os atributos ''Q1'', ''Q2'' e ''Q3''' + chr(13) + 'O processo será abortado.'), 'Aviso', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON1);
      exit;
    end;

  ////////////////////////
//T1 T2 T3 T4'
  Busca.buscas.Close;
  Busca.buscas.SQL.Text := 'SELECT ps.cod_servico,max(data_fech) as UltimaData ' +
    ' from pedvenda p INNER JOIN pedvenda_serv ps ' +
    ' on p.nped = ps.nped and p.cod_empresa = ps.cod_empresa and p.tipo = ps.tipo' +
    ' where (p.status_ped <> '''' and not p.status_ped is null) and p.ativo = 1 and' +
    ' ps.ativo = 1 and p.tipo = ''OS'' and ' + TipoOSSelec +
    ' and p.cod_empresa=' + vDadosIni.codEmpresa +
    ' group by ps.cod_servico';
  Busca.buscas.Prepare;
  Busca.buscas.Open;
  Busca.buscas.FetchAll;
  FrmDefinirClasseServ.ProgressBar.min := 0;
  FrmDefinirClasseServ.ProgressBar.max := buscas.RecordCount;
  FrmDefinirClasseServ.ProgressBar.position := 0;
  FrmDefinirClasseServ.lb.Caption := 'Classificando serviços ''T1'', ''T2'' e ''T3''     ' + vDadosIni.strzero(FrmDefinirClasseServ.ProgressBar.Position, 5);
  Busca.buscas.First;
  while not Busca.buscas.Eof do
  begin
    Application.ProcessMessages;
    //Aqui somente classifica atualidade se o serviço não tiver sido cadastrado no ultimo mes.
    if ExecutaComandosSql('select cod_servico from tipo_servico where ativo=1 and CLASSE_ATL <> ''R'' and cod_servico=' + inttostr(Busca.buscas.FieldByName('COD_SERVICO').asinteger)+' AND COD_EMPRESA = '+vDadosIni.codEmpresa) then
    begin
      if (date - Busca.buscas.FieldByName('UltimaData').AsDateTime) <= 90 then
      begin
        Grava.buscas.close;
        Grava.buscas.SQL.Text := 'update tipo_servico set CLASSE_ATL = ''T1''' +
          ' WHERE COD_SERVICO = ' + Busca.buscas.FieldByName('COD_SERVICO').asstring+' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
      end
      else if (date - Busca.buscas.FieldByName('UltimaData').AsDateTime > 90) and (date -
        Busca.buscas.FieldByName('UltimaData').AsDateTime <= 180) then
      begin
        Grava.buscas.close;
        Grava.buscas.SQL.Text := 'update tipo_servico set CLASSE_ATL = ''T2''' +
          ' WHERE COD_SERVICO = ' + Busca.buscas.FieldByName('COD_SERVICO').asstring+' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
      end
      else if (date - Busca.buscas.FieldByName('UltimaData').AsDateTime > 180) and (date -
        Busca.buscas.FieldByName('UltimaData').AsDateTime <= 360) then
      begin
        Grava.buscas.close;
        Grava.buscas.SQL.Text := 'update tipo_servico set CLASSE_ATL = ''T3''' +
          ' WHERE COD_SERVICO = ' + Busca.buscas.FieldByName('COD_SERVICO').asstring+' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
      end
      else
      begin
        Grava.buscas.close;
        Grava.buscas.SQL.Text := 'update tipo_servico set CLASSE_ATL = ''T4''' +
          ' WHERE COD_SERVICO = ' + Busca.buscas.FieldByName('COD_SERVICO').asstring+' AND COD_EMPRESA = '+vDadosIni.codEmpresa;
      end;
      Grava.buscas.Prepare;
      Grava.buscas.ExecSQL;
    end;
    Busca.buscas.next;
    FrmDefinirClasseServ.ProgressBar.Position := FrmDefinirClasseServ.ProgressBar.Position + 1;
    FrmDefinirClasseServ.lb.Caption := 'Classificando serviços ''T1'', ''T2'', ''T3'' e ''T4''     ' + vDadosIni.strzero(FrmDefinirClasseServ.ProgressBar.Position, 5);
    if PararProcessamento then
      break;
  end;
  if Parar then
  begin
    FrmDefinirClasseServ.ProgressBar.Position := 0;
    FrmDefinirClasseServ.lb.Caption := '0';
    Parar := false;
    exit;
  end;
  Grava.buscas.close;
  Grava.buscas.SQL.Text := 'update empresa e ' +
    ' set e.dtdef_classe_s= :vdata , e.qtdmes_classe_s= :qtdmes ' +
    ' where e.cod_empresa=' + vDadosIni.codEmpresa + ' and e.ativo=1';
  Grava.buscas.ParamByName('vdata').AsDate := vDadosIni.getDataBanco(Busca.buscas);
  Grava.buscas.ParamByName('qtdmes').AsInteger := QtdMesEmpresa;
  Grava.buscas.Prepare;
  Grava.buscas.ExecSQL;
  if grava.emTransacao then
    if not Grava.CommitaTransacao then
    begin
      Application.MessageBox(Pchar('Falha na definição de classes para Serviços para os atributos ''T1'', ''T2'', ''T3'' e ''T4''' + chr(13) + 'O processo será abortado.'), 'Aviso', MB_OK +
        MB_ICONWARNING + MB_DEFBUTTON1);
      exit;
    end
    else
    begin
      Application.MessageBox('Definição de classes para Serviços concluída com sucesso!', 'Informação', MB_OK +
        MB_ICONEXCLAMATION + MB_DEFBUTTON1);
      FrmDefinirClasseServ.ProgressBar.Position := 0;
      FrmDefinirClasseServ.lb.Caption := '';
      result := true;
    end;
end;

destructor TDefinicaoClasses.destroy;
begin
  buscas.Close;
  inherited;
end;

function TDefinicaoClasses.PararProcessamento: boolean;
begin
  result := false;
  if Parar then
  begin
    if Application.MessageBox('Deseja Cancelar o Processamento?', 'Confirmação', MB_YESNO +
      MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
      result := true
    else
      Parar := false;
  end;
end;

procedure TDefinicaoClasses.SetaVariaveis;
begin
  buscas.Close;
  buscas.SQL.Text := 'select QTMESSUG,CASAS_DECIMAIS,TP_SUG,TE_SUG,TA_SUG,FP_SUG,EST_SEGURACAPROD from empresa where cod_empresa = ' +
    vDadosIni.codEmpresa;
  buscas.Open;
  if not buscas.IsEmpty then
  begin
    QtdMesEmpresa := buscas.FieldByName('QTMESSUG').AsInteger;
    NumeroCasasDecimais := buscas.FieldByName('CASAS_DECIMAIS').AsInteger;
    TpProcessamento := buscas.FieldByName('TP_SUG').AsInteger;
    TpEntrega := buscas.FieldByName('TE_SUG').AsInteger;
    TpAlocacao := buscas.FieldByName('TA_SUG').AsInteger;
    FreqPedido := buscas.FieldByName('FP_SUG').AsInteger;
    EstSeguracaPadrao := buscas.FieldByName('EST_SEGURACAPROD').AsInteger;
  end;
  buscas.Close;
end;

function TDefinicaoClasses.TipoOSSelecionada: boolean;
var
  i: integer;
begin
  result := true;
  TipoOSSelec := '(';
  for i := 0 to FrmDefinirClasseServ.CheckListBox1.Items.Count - 1 do
  begin
    if FrmDefinirClasseServ.CheckListBox1.Checked[i] then
    begin
      if TipoOSSelec = '(' then
        TipoOSSelec := TipoOSSelec + 'p.tipo_os = ' + quotedstr(FrmDefinirClasseServ.CheckListBox1.Items[i])
      else
        TipoOSSelec := TipoOSSelec + ' or p.tipo_os = ' + quotedstr(FrmDefinirClasseServ.CheckListBox1.Items[i]);
    end;
  end;
  TipoOSSelec := TipoOSSelec + ')';

  if TipoOSSelec = '()' then
  begin
    Application.MessageBox('Selecione pelo menos um tipo de OS.', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    FrmDefinirClasseServ.CheckListBox1.Enabled := true;
    FrmDefinirClasseServ.CheckListBox1.SetFocus;
    result := false;
  end;
end;

function TDefinicaoClasses.DefTipoVendas: boolean;
begin
  buscas.Close;
  buscas.SQL.Text := 'select tp.tipo_os from tipo_vendas tp ' +
    ' where tp.tipo=''OS'' and tp.ativo= 1' +
    ' order by tp.tipo_os';
  buscas.Prepare;
  buscas.Open;

  TipoVendas :='';
  while not buscas.Eof do
  begin
    TipoVendas := TipoVendas + buscas.FieldByName('TIPO_OS').AsString +#13;
    buscas.Next;
  end;
end;

{ TListaItensPedido }

constructor TListaItensPedido.create;
begin
  Buscas := TIBQuery(DtmSugestaoCompras.qrLocItensPedido);
end;

destructor TListaItensPedido.destroy;
begin
  buscas.close;
  inherited;
end;

{ TListaGrupoIni }

constructor TListaGrupoIni.create;
begin
  Buscas := TIBQuery(DtmSugestaoCompras.qrLocGrupoIni);
end;

destructor TListaGrupoIni.destroy;
begin
  buscas.close;
  inherited;
end;

{ TListaGrupoFim }

constructor TListaGrupoFim.create;
begin
  Buscas := TIBQuery(DtmSugestaoCompras.qrLocGrupoFim);
end;

destructor TListaGrupoFim.destroy;
begin
  buscas.close;
  inherited;
end;

{ TListaSubGrupoIni }

constructor TListaSubGrupoIni.create;
begin
  Buscas := TIBQuery(DtmSugestaoCompras.qrLocSubGIni);
end;

destructor TListaSubGrupoIni.destroy;
begin
  buscas.close;
  inherited;
end;

{ TListaSubGrupoFim }

constructor TListaSubGrupoFim.create;
begin
  Buscas := TIBQuery(DtmSugestaoCompras.qrLocSubGFim);
end;

destructor TListaSubGrupoFim.destroy;
begin
  buscas.close;
  inherited;
end;

{ TListaGradeIni }

constructor TListaGradeIni.create;
begin
  Buscas := TIBQuery(DtmSugestaoCompras.qrLocGradeIni);
end;

destructor TListaGradeIni.destroy;
begin
  buscas.Close;
  inherited;
end;

{ TListaGradeFim }

constructor TListaGradeFim.create;
begin
  Buscas := TIBQuery(DtmSugestaoCompras.qrLocGradeFim);
end;

destructor TListaGradeFim.destroy;
begin
  buscas.Close;
  inherited;
end;

{ TListaMarca }

constructor TListaMarca.create;
begin
  Buscas := TIBQuery(DtmSugestaoCompras.qrLocMarcas);
end;

destructor TListaMarca.destroy;
begin
  buscas.close;
  inherited;
end;

{ TSugestao }

function TSugestao.abreFormEmpresas: boolean;
begin
	if not vDadosIni.vSugCompra.vMultiempresa then
  	Result := True
  else
		Result :=	vDadosIni.abreForm('Selecionar as empresas que participarão da sugestão de compra', FrmSugestaoCompra.pnMultiempresa, [ofEscapeExit, ofAlignAllClientWinCtrl]);
end;

function TSugestao.abreFormMontarPedidoCompra: boolean;
var
	vCodEmpresasTmp: array of Integer;
  vIdentificacaoTmp: array of string;
  vCGCTmp: array of string;
  vCodPedidosTmp: array of string;
  vMensTemp: array of string;
  vTemp: string;
  I: Integer;
begin
	Result := false;

  FrmSugestaoCompra.ckSalvarOpcoes.Checked := false;
  fTempDadosForm.EmptyDataSet;

  vCodPedido := 0;
  vCodPedidos := '';
  vPedidoAberto := false;

	if (not FrmSugestaoCompra.ckFiltrarPorFornecedor.Checked) and (not FrmSugestaoCompra.ckFiltrarPorEmpresa.Checked) then
  begin
    FrmSugestaoCompra.EditMoedaEmpFornec2.Valor :=
    	vDadosIni.IfThen(fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger > 0,
      	fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger,
        vDadosIni.cod_empresa);
    FrmSugestaoCompra.EditMoedaFornec2.Valor := vDadosIni.IfThen(fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger > 0,
    		fTempClientesPedido.FieldByName('COD_CLIENTE').AsInteger,
        0);

    vFornecPedSug._abreFornecedor(
    	vDadosIni.IfThen(fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger > 0,
      	fTempClientesPedido.FieldByName('COD_CLIENTE').AsInteger,
        0),
    	vDadosIni.IfThen(fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger > 0,
      	fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger,
        vDadosIni.cod_empresa));
        
    FrmSugestaoCompra.DBLookupComboBoxFornec2.KeyValue := fTempClientesPedido.FieldByName('COD_CLIENTE').AsInteger;

    FrmSugestaoCompra.EditMoedaVend2.Valor := vDadosIni.IfThen(vDadosIni.cod_empresa = fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger, vDadosIni.vCodUsuario, 0);
    FrmSugestaoCompra.DBLookupComboBoxVend2.KeyValue := vDadosIni.IfThen(vDadosIni.cod_empresa = fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger, vDadosIni.vCodUsuario, 0);

    FrmSugestaoCompra.EditMoedaCondPag2.Valor := 0;
    FrmSugestaoCompra.DBLookupComboBoxCondPag2.KeyValue := 0;

    FrmSugestaoCompra.ComboBoxTipoPedido2.ItemIndex := 0;

    FrmSugestaoCompra.EditMoedaFornec2.Enabled := true;
    FrmSugestaoCompra.DBLookupComboBoxFornec2.Enabled := true;
    FrmSugestaoCompra.ckSalvarOpcoes.Visible := false;

    vVendedorPedSug._abreVendedor(vDadosIni.IfThen(fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger > 0,
    	fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger,
      vDadosIni.cod_empresa));
    
    Result := vDadosIni.abreForm('Criar pedido de compra', FrmSugestaoCompra.pnMontarPedidoCompra2, [ofEscapeExit, ofAlignAllClientWinCtrl]);

    if Result then
    begin
	    montarDtSetTemporario;
      montarDadosPedidoCompra(
      	FrmSugestaoCompra.ckFiltrarPorEmpresa.Checked,
        FrmSugestaoCompra.ckFiltrarPorFornecedor.Checked,
        Trunc(FrmSugestaoCompra.EditMoedaEmpFornec2.Valor),
      	Trunc(FrmSugestaoCompra.EditMoedaFornec2.Valor),
        Trunc(FrmSugestaoCompra.EditMoedaVend2.Valor),
        Trunc(FrmSugestaoCompra.EditMoedaCondPag2.Valor),
        trim(FrmSugestaoCompra.ComboBoxTipoPedido2.Items[FrmSugestaoCompra.ComboBoxTipoPedido2.ItemIndex]));

        if vPedidoAberto then
          Application.MessageBox(Pchar('Pedido(s) de compra realizado(s) com sucesso: ' + #13 + #13 +
            vDadosIni.codEmpresa + ' - ' + trim(vDadosIni.vEmp.vnomeEmpresa) + ' ' + trim(vDadosIni.vEmp.vCNPJ) + #13 +
            'Nº: ' + IntToStr(vCodPedido)), 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    end;
  end
  else if FrmSugestaoCompra.ckFiltrarPorEmpresa.Checked then
  begin
  	try
      fTempEmpresasPedido.DisableControls;
      fTempEmpresasPedido.Filtered := false;
      fTempEmpresasPedido.Filter := 'SEL = ''S'' ';
      fTempEmpresasPedido.Filtered := true;

      fTempEmpresasPedido.IndexFieldNames := 'COD_EMPRESA';

      SetLength(vCodEmpresasTmp, fTempEmpresasPedido.RecordCount);
      SetLength(vIdentificacaoTmp, fTempEmpresasPedido.RecordCount);
      SetLength(vCGCTmp, fTempEmpresasPedido.RecordCount);
      SetLength(vCodPedidosTmp, fTempEmpresasPedido.RecordCount);
      
      fTempEmpresasPedido.First;
      while not fTempEmpresasPedido.Eof do
      begin
      	vCodEmpresasTmp[fTempEmpresasPedido.RecNo - 1] := fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger;
        vIdentificacaoTmp[fTempEmpresasPedido.RecNo - 1] := fTempEmpresasPedido.FieldByName('IDENTIFICACAO_EMP').AsString;
        vCGCTmp[fTempEmpresasPedido.RecNo - 1] := fTempEmpresasPedido.FieldByName('CGC_EMP').AsString;

        if fTempEmpresasPedido.FieldByName('SEL').AsString = 'S' then
        begin
        	try
            filtrarPorEmpresa(
              fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger);

            fTempListaCotacao.DisableControls;
            fTempListaCotacao.Filtered := false;
            fTempListaCotacao.Filter := 'SEL = ''S'' ';
            fTempListaCotacao.Filtered := true;

            if fTempListaCotacao.RecordCount > 0 then
            begin
              FrmSugestaoCompra.EditMoedaEmpFornec2.Valor := fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger;
              FrmSugestaoCompra.EditMoedaFornec2.Valor := 0;
              vFornecPedSug._abreFornecedor(0, fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger);
              FrmSugestaoCompra.DBLookupComboBoxFornec2.KeyValue := 0;

              FrmSugestaoCompra.EditMoedaVend2.Valor := vDadosIni.IfThen(vDadosIni.cod_empresa = fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger, vDadosIni.vCodUsuario, 0);
              FrmSugestaoCompra.DBLookupComboBoxVend2.KeyValue := vDadosIni.IfThen(vDadosIni.cod_empresa = fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger, vDadosIni.vCodUsuario, 0);

              FrmSugestaoCompra.EditMoedaCondPag2.Valor := 0;
              FrmSugestaoCompra.DBLookupComboBoxCondPag2.KeyValue := 0;

              FrmSugestaoCompra.ComboBoxTipoPedido2.ItemIndex := 0;

              FrmSugestaoCompra.EditMoedaFornec2.Enabled := true;
              FrmSugestaoCompra.DBLookupComboBoxFornec2.Enabled := true;

              FrmSugestaoCompra.ckSalvarOpcoes.Visible := false;

              vVendedorPedSug._abreVendedor(fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger);

              Result := vDadosIni.abreForm('Criar pedido de compra for empresa - Emp ' + IntToStr(fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger) +
                ' (' + IntToStr(fTempEmpresasPedido.RecNo) + ' de ' + IntToStr(fTempEmpresasPedido.RecordCount) + ')',
                FrmSugestaoCompra.pnMontarPedidoCompra2, [ofEscapeExit, ofAlignAllClientWinCtrl]);

              if not Result then
                exit
              else
              begin
                montarDtSetTemporario;
                montarDadosPedidoCompra(
                  FrmSugestaoCompra.ckFiltrarPorEmpresa.Checked,
                  FrmSugestaoCompra.ckFiltrarPorFornecedor.Checked,
                  Trunc(FrmSugestaoCompra.EditMoedaEmpFornec2.Valor),
                  Trunc(FrmSugestaoCompra.EditMoedaFornec2.Valor),
                  Trunc(FrmSugestaoCompra.EditMoedaVend2.Valor),
                  Trunc(FrmSugestaoCompra.EditMoedaCondPag2.Valor),
                  trim(FrmSugestaoCompra.ComboBoxTipoPedido2.Items[FrmSugestaoCompra.ComboBoxTipoPedido2.ItemIndex]));

                  if vCodEmpresasTmp[fTempEmpresasPedido.RecNo - 1] = fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger then
	                  vCodPedidosTmp[fTempEmpresasPedido.RecNo - 1] := IntToStr(vCodPedido);
              end;
            end;
          finally
          	fTempListaCotacao.Filtered := false;
            fTempListaCotacao.IndexFieldNames := 'GRUPO_PROD;COD_PROD;COD_EMP_MULT';
			      fTempListaCotacao.First;
			      fTempListaCotacao.EnableControls;
          end;
        end;

        fTempEmpresasPedido.Next;
      end;

      vTemp := '';
      for I := 0 to Length(vCodEmpresasTmp) - 1 do
       	 if trim(vCodPedidosTmp[I]) <> '' then
           vTemp := vTemp + vDadosIni.IfThen(trim(vTemp) <> '', #13 + #13, '') +
              IntToStr(vCodEmpresasTmp[I]) + ' - ' + trim(vIdentificacaoTmp[I]) + ' ' + trim(vCGCTmp[I]) + #13 +
              'Nº: ' + vCodPedidosTmp[I];

      Application.MessageBox(Pchar('Pedido(s) de compra realizado(s) com sucesso: ' + #13 + #13 +
        vTemp), 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    finally
	    fTempEmpresasPedido.Filtered := false;
      fTempEmpresasPedido.IndexFieldNames := 'COD_EMPRESA';
      fTempEmpresasPedido.First;
      fTempEmpresasPedido.EnableControls;
    end;
  end
  else if FrmSugestaoCompra.ckFiltrarPorFornecedor.Checked then
  begin
  	try
    	SetLength(vCodEmpresasTmp, fTempEmpresasPedido.RecordCount);
      SetLength(vIdentificacaoTmp, fTempEmpresasPedido.RecordCount);
      SetLength(vCGCTmp, fTempEmpresasPedido.RecordCount);
      SetLength(vCodPedidosTmp, fTempEmpresasPedido.RecordCount);
      SetLength(vMensTemp, fTempEmpresasPedido.RecordCount);

      fTempEmpresasPedido.DisableControls;
      fTempEmpresasPedido.First;
      while not fTempEmpresasPedido.Eof do
      begin
        vCodEmpresasTmp[fTempEmpresasPedido.RecNo - 1] := fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger;
        vIdentificacaoTmp[fTempEmpresasPedido.RecNo - 1] := fTempEmpresasPedido.FieldByName('IDENTIFICACAO_EMP').AsString;
        vCGCTmp[fTempEmpresasPedido.RecNo - 1] := fTempEmpresasPedido.FieldByName('CGC_EMP').AsString;

        fTempEmpresasPedido.Next;
      end;
    finally
    	fTempEmpresasPedido.First;
      fTempEmpresasPedido.EnableControls;
    end;
    
  	try
      fTempClientesPedido.DisableControls;
      fTempClientesPedido.Filtered := false;
      fTempClientesPedido.Filter := 'SEL = ''S'' ';
      fTempClientesPedido.Filtered := true;

      fTempClientesPedido.First;
      while not fTempClientesPedido.Eof do
      begin
        if fTempClientesPedido.FieldByName('SEL').AsString = 'S' then
        begin
        	try
            filtrarPorFornecedor(
              fTempClientesPedido.FieldByName('COD_CLIENTE').AsInteger,
              fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger);

            fTempListaCotacao.DisableControls;
            fTempListaCotacao.Filtered := false;
			      fTempListaCotacao.First;
			      fTempListaCotacao.EnableControls;

            if fTempListaCotacao.RecordCount > 0 then
            begin
              FrmSugestaoCompra.EditMoedaEmpFornec2.Valor := fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger;
              FrmSugestaoCompra.EditMoedaFornec2.Valor := fTempClientesPedido.FieldByName('COD_CLIENTE').AsInteger;
              vFornecPedSug._abreFornecedor(fTempClientesPedido.FieldByName('COD_CLIENTE').AsInteger, fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger);
              FrmSugestaoCompra.DBLookupComboBoxFornec2.KeyValue := fTempClientesPedido.FieldByName('COD_CLIENTE').AsInteger;

              FrmSugestaoCompra.EditMoedaVend2.Valor := vDadosIni.IfThen(vDadosIni.cod_empresa = fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger, vDadosIni.vCodUsuario, 0);
              FrmSugestaoCompra.DBLookupComboBoxVend2.KeyValue := vDadosIni.IfThen(vDadosIni.cod_empresa = fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger, vDadosIni.vCodUsuario, 0);

              FrmSugestaoCompra.EditMoedaCondPag2.Valor := 0;
              FrmSugestaoCompra.DBLookupComboBoxCondPag2.KeyValue := 0;

              FrmSugestaoCompra.ComboBoxTipoPedido2.ItemIndex := 0;

              FrmSugestaoCompra.EditMoedaFornec2.Enabled := true;
              FrmSugestaoCompra.DBLookupComboBoxFornec2.Enabled := true;

              FrmSugestaoCompra.ckSalvarOpcoes.Visible := true;

              vVendedorPedSug._abreVendedor(fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger);

              try
                fTempDadosForm.Filtered := false;
                fTempDadosForm.Filter := 'COD_EMPRESA = ' + IntToStr(Trunc(FrmSugestaoCompra.EditMoedaEmpFornec2.Valor));
                fTempDadosForm.Filtered := true;

                if (FrmSugestaoCompra.ckSalvarOpcoes.Checked) and (not fTempDadosForm.IsEmpty) then
                begin
                  FrmSugestaoCompra.EditMoedaFornec2.Valor := fTempDadosForm.FieldByName('COD_CLIENTE').AsInteger;
                  FrmSugestaoCompra.DBLookupComboBoxFornec2.KeyValue := fTempDadosForm.FieldByName('COD_CLIENTE').AsInteger;

                  FrmSugestaoCompra.EditMoedaVend2.Valor := fTempDadosForm.FieldByName('COD_VENDEDOR').AsInteger;
                  FrmSugestaoCompra.DBLookupComboBoxVend2.KeyValue := fTempDadosForm.FieldByName('COD_VENDEDOR').AsInteger;

                  FrmSugestaoCompra.EditMoedaCondPag2.Valor := fTempDadosForm.FieldByName('COD_COND_PAG').AsInteger;
                  FrmSugestaoCompra.DBLookupComboBoxCondPag2.KeyValue := fTempDadosForm.FieldByName('COD_COND_PAG').AsInteger;

                  if trim(fTempDadosForm.FieldByName('TIPO_PED').AsString) = 'URGENTE' then
                    FrmSugestaoCompra.ComboBoxTipoPedido2.ItemIndex := 1
                  else
                    FrmSugestaoCompra.ComboBoxTipoPedido2.ItemIndex := 0;

                  Result := true;
                end
                else
                begin
                  Result := vDadosIni.abreForm('Criar pedido de compra por fornecedor - Emp ' + IntToStr(fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger) +
                    ' (' + IntToStr(fTempClientesPedido.RecNo) + ' de ' + IntToStr(fTempClientesPedido.RecordCount) + ')',
                    FrmSugestaoCompra.pnMontarPedidoCompra2, [ofEscapeExit, ofAlignAllClientWinCtrl]);

                  fTempDadosForm.Insert;
                  fTempDadosForm.FieldByName('COD_EMPRESA').AsInteger := Trunc(FrmSugestaoCompra.EditMoedaEmpFornec2.Valor);
                  fTempDadosForm.FieldByName('COD_CLIENTE').AsInteger := Trunc(FrmSugestaoCompra.EditMoedaFornec2.Valor);
                  fTempDadosForm.FieldByName('COD_VENDEDOR').AsInteger := Trunc(FrmSugestaoCompra.EditMoedaVend2.Valor);
                  fTempDadosForm.FieldByName('COD_COND_PAG').AsInteger := Trunc(FrmSugestaoCompra.EditMoedaCondPag2.Valor);
                  fTempDadosForm.FieldByName('TIPO_PED').AsString := trim(FrmSugestaoCompra.ComboBoxTipoPedido2.Items[FrmSugestaoCompra.ComboBoxTipoPedido2.ItemIndex]);
                  fTempDadosForm.Post;
                end;

              finally
                fTempDadosForm.Filtered := false;
              end;

              if not Result then
                exit
              else
              begin
                montarDtSetTemporario;
                montarDadosPedidoCompra(
                  FrmSugestaoCompra.ckFiltrarPorEmpresa.Checked,
                  FrmSugestaoCompra.ckFiltrarPorFornecedor.Checked,
                  Trunc(FrmSugestaoCompra.EditMoedaEmpFornec2.Valor),
                  Trunc(FrmSugestaoCompra.EditMoedaFornec2.Valor),
                  Trunc(FrmSugestaoCompra.EditMoedaVend2.Valor),
                  Trunc(FrmSugestaoCompra.EditMoedaCondPag2.Valor),
                  trim(FrmSugestaoCompra.ComboBoxTipoPedido2.Items[FrmSugestaoCompra.ComboBoxTipoPedido2.ItemIndex]));
              end;
            end;
          finally
            fTempListaCotacao.Filtered := false;
            fTempListaCotacao.IndexFieldNames := 'GRUPO_PROD;COD_PROD;COD_EMP_MULT';
			      fTempListaCotacao.First;
			      fTempListaCotacao.EnableControls;
          end;
        end;

        for I := 0 to Length(vCodEmpresasTmp) - 1 do
        begin
        	if fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger = vCodEmpresasTmp[I] then
          begin
            if vCodPedido > 0 then
              vMensTemp[I] := vMensTemp[I] +
              	vDadosIni.IfThen(trim(vMensTemp[I]) = '',
                  IntToStr(vCodEmpresasTmp[I]) + ' - ' + trim(vIdentificacaoTmp[I]) + ' ' + trim(vCGCTmp[I]) + #13 +
                  'Nº: ',
                  ', ') +
                IntToStr(vCodPedido);
            break;
          end;
        end;

        fTempClientesPedido.Next;
      end;

      vTemp := '';
      for I := 0 to Length(vCodEmpresasTmp) - 1 do
      	if trim(vMensTemp[I]) <> '' then
          vTemp := vTemp + vDadosIni.IfThen(trim(vTemp) <> '', #13 + #13, '') +
            vMensTemp[I];

      Application.MessageBox(Pchar('Pedido(s) de compra realizado(s) com sucesso: ' + #13 + #13 +
        vTemp), 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    finally
      fTempClientesPedido.Filtered := false;
      if FrmSugestaoCompra.RadioGroupOrdenarCliente.ItemIndex = 0 then
        fTempClientesPedido.IndexFieldNames := 'COD_EMPRESA;COD_CLIENTE'
      else if FrmSugestaoCompra.RadioGroupOrdenarCliente.ItemIndex = 1 then
        fTempClientesPedido.IndexFieldNames := 'COD_CLIENTE;COD_EMPRESA'
      else if FrmSugestaoCompra.RadioGroupOrdenarCliente.ItemIndex = 2 then
        fTempClientesPedido.IndexFieldNames := 'NOME_CLIENTE;COD_EMPRESA'
      else if FrmSugestaoCompra.RadioGroupOrdenarCliente.ItemIndex = 3 then
        fTempClientesPedido.IndexFieldNames := 'RAZAO;COD_EMPRESA';
      fTempClientesPedido.First;
      fTempClientesPedido.EnableControls;
    end;
  end;
end;

function TSugestao.abreFormMontarPedidoCompra2: boolean;
var
	I: Integer;
begin
	Result := false;
	try
  	fTempListaCotacaoOld.EmptyDataSet;
    
    fTempListaCotacao.DisableControls;
    fTempListaCotacao.First;
    while not fTempListaCotacao.Eof do
    begin
      if fTempListaCotacao.FieldByName('SEL').AsString = 'S' then
      begin
        fTempListaCotacaoOld.Insert;
        for I := 0 to fTempListaCotacao.FieldCount - 1 do
          fTempListaCotacaoOld.Fields[I].Value := fTempListaCotacao.Fields[I].Value;
        fTempListaCotacaoOld.Post;
      end;

      fTempListaCotacao.Next;
    end;
  finally
    fTempListaCotacao.First;
    fTempListaCotacao.EnableControls;
  end;

  try
  	fTempListaCotacao.EmptyDataSet;

    fTempListaCotacaoOld.DisableControls;
    fTempListaCotacaoOld.First;
    while not fTempListaCotacaoOld.Eof do
    begin
      fTempListaCotacao.Insert;
      for I := 0 to fTempListaCotacaoOld.FieldCount - 1 do
        fTempListaCotacao.Fields[I].Value := fTempListaCotacaoOld.Fields[I].Value;
      fTempListaCotacao.Post;

      fTempListaCotacaoOld.Next;
    end;
  finally
    fTempListaCotacaoOld.First;
    fTempListaCotacaoOld.EnableControls;
  end;

	Result := vDadosIni.abreForm('Montar pedido de compra', FrmSugestaoCompra.pnMontarPedidoCompra, [ofEscapeExit, ofAlignAllClientWinCtrl]);
end;

function TSugestao.abreGradeF: boolean;
begin
  if LGradeF = nil then
    LGradeF := TListaGradeFim.create;
  LGradeF.buscas.Close;
  LGradeF.buscas.SQL.Text := 'SELECT * FROM grade ' +
    ' where cod_empresa=' + vDadosIni.codEmpresa + ' and ativo=1';
  LGradeF.buscas.Open;
end;

function TSugestao.abreGradeI: boolean;
begin
  if LGradeI = nil then
    LGradeI := TListaGradeIni.create;
  LGradeI.buscas.Close;
  LGradeI.buscas.SQL.Text := 'SELECT * FROM grade ' +
    ' where cod_empresa=' + vDadosIni.codEmpresa + ' and ativo=1';
  LGradeI.buscas.Open;
end;

function TSugestao.abreGrupoF: boolean;
begin
  if LGrupoF = nil then
    LGrupoF := TListaGrupoFim.create;
  LGrupoF.buscas.Close;
  LGrupoF.buscas.SQL.Text := 'SELECT * FROM grupos ' +
    ' where ativo=1 order by CODIGO_GRUP';
  LGrupoF.buscas.Open;
  LGrupoF.buscas.FetchAll;
end;

function TSugestao.abreGrupoI: boolean;
begin
  if LGrupoI = nil then
    LGrupoI := TListaGrupoIni.create;
  LGrupoI.buscas.Close;
  LGrupoI.buscas.SQL.Text := 'SELECT * FROM grupos ' +
    ' where ativo=1 order by CODIGO_GRUP';
  LGrupoI.buscas.Open;
  LGrupoI.buscas.FetchAll;
end;

function TSugestao.abreListaCotacao: boolean;
var
  formulario: TfrmPadrao;
  I: Integer;
  vSel: boolean;
  gradeTemp, gradeDescTemp: string;
  vCodListaContacao: Integer;
  buscas2: TIBQuery;
begin
  try
    if not FrmSugestaoCompra.StGradS.RowCount > 0 then
      exit;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;
    
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 864;
    formulario.Height := 377;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Lista de Cotação';
    FrmSugestaoCompra.pnListaCotacao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := True;
    formulario.BorderIcons := [];

    fTempListaCotacao.EmptyDataSet;

    try
    	vDadosIni.abreStatusProcessamento('', 'Lendo dados da sugestão de compra');
      
      for I := 1 to FrmSugestaoCompra.StGradS.RowCount - 1 do
      begin
       vDadosIni.abreStatusProcessamento('', 'Lendo dados da sugestão de compra (' + IntToStr(I) + ' de ' + IntToStr(FrmSugestaoCompra.StGradS.RowCount) + ')');
       	
       if (Pos('CMP', FrmSugestaoCompra.StGradS.cells[1, I]) = 0)
        and (Pos('VND', FrmSugestaoCompra.StGradS.cells[1, I]) = 0)
        and (Pos('TRF', FrmSugestaoCompra.StGradS.cells[1, I]) = 0)
        and (trim(FrmSugestaoCompra.StGradS.cells[12, I]) <> '')
        and (trim(FrmSugestaoCompra.StGradS.cells[13, I]) <> '')
        and (trim(FrmSugestaoCompra.StGradS.Cells[7, I]) <> '0') then
       begin
         if FrmSugestaoCompra.StGradS.cells[9, i] = 'SEL' then
         begin
         	 gradeTemp := '0';
//           if trim(FrmSugestaoCompra.StGradS.cells[15, I]) = '' then
//           begin
//             gradeTemp := '0';
//             if trim(FrmSugestaoCompra.StGradS.cells[16, I]) = '' then
//               gradeDescTemp := 'SEM GRADE'
//             else
//               gradeDescTemp := trim(FrmSugestaoCompra.StGradS.cells[16, I]);
//           end
//           else
//           begin
//             gradeTemp := trim(FrmSugestaoCompra.StGradS.cells[15, I]);
//             if trim(FrmSugestaoCompra.StGradS.cells[16, I]) = '' then
//               gradeDescTemp := 'SEM GRADE'
//             else
//               gradeDescTemp := trim(FrmSugestaoCompra.StGradS.cells[16, I]);
//           end;

           try
             fTempListaCotacao.Filtered := false;
             fTempListaCotacao.Filter := 'GRUPO_PROD = ' + trim(FrmSugestaoCompra.StGradS.cells[12, I]) +
               ' AND COD_PROD = ' + QuotedStr(trim(FrmSugestaoCompra.StGradS.cells[13, I])) +
//               ' AND COD_GRADE = ' + gradeTemp +
               ' AND COD_EMP_MULT = ' + trim(FrmSugestaoCompra.StGradS.cells[14, I]);
             fTempListaCotacao.Filtered := true;

             if ((fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger <> StrToInt(FrmSugestaoCompra.StGradS.cells[12, I]))
               and (fTempListaCotacao.FieldByName('COD_PROD').AsString <> FrmSugestaoCompra.StGradS.cells[13, I])) then
             begin
               buscas.Close;
               buscas.SQL.Text := ' SELECT GRUPO_PROD, COD_PROD, COD_EMPRESA, ' +
               	 ' DESCR_PROD, DESCR_PROD_RED, NUM_FAB_PROD, EMB_PROD FROM PRODUTOS ' +
                 ' WHERE GRUPO_PROD = ' + trim(FrmSugestaoCompra.StGradS.cells[12, I]) +
                 ' AND COD_PROD = ' + QuotedStr(trim(FrmSugestaoCompra.StGradS.cells[13, I])) +
                 ' AND COD_EMPRESA = ' + trim(FrmSugestaoCompra.StGradS.cells[14, I]);
               buscas.Open;

               if not buscas.IsEmpty then
               begin
                 if fTempListaCotacao.IsEmpty then
                 begin
                   fTempListaCotacao.Insert;
                   fTempListaCotacao.FieldByName('DESCRICAO_LISTA').AsString := '';
                   fTempListaCotacao.FieldByName('OBS').AsString := '';
                   fTempListaCotacao.FieldByName('SEL').AsString := 'S';
                   fTempListaCotacao.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(FrmSugestaoCompra.StGradS.cells[14, I]);
                   fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger := StrToInt(FrmSugestaoCompra.StGradS.cells[12, I]);
                   fTempListaCotacao.FieldByName('COD_PROD').AsString := FrmSugestaoCompra.StGradS.cells[13, I];
                   fTempListaCotacao.FieldByName('NUM_FAB_PROD').AsString := buscas.FieldByName('NUM_FAB_PROD').AsString;
                   if FrmSugestaoCompra.CheckDescrRed.Checked then
                     fTempListaCotacao.FieldByName('DESCR_PROD').AsString := Copy(Trim(buscas.FieldByName('DESCR_PROD_RED').asstring) +
                       vDadosIni.IfThen(StrToInt(gradeTemp) > 0, vDadosIni.IfThen(trim(gradeDescTemp) <> '', ' ' + trim(gradeDescTemp), ''), '') +
                     	 ' ' + buscas.FieldByName('EMB_PROD').asstring, 1, 75)
                 	 else
                     fTempListaCotacao.FieldByName('DESCR_PROD').AsString := Copy(Trim(buscas.FieldByName('DESCR_PROD').asstring) +
                       vDadosIni.IfThen(StrToInt(gradeTemp) > 0, vDadosIni.IfThen(trim(gradeDescTemp) <> '', ' ' + trim(gradeDescTemp), ''), '') +
                       ' ' + buscas.FieldByName('EMB_PROD').asstring, 1, 75);

//                   fTempListaCotacao.FieldByName('DESCR_PROD').AsString := FrmSugestaoCompra.StGradS.cells[11, I];
                   fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat := StrToFloat(FrmSugestaoCompra.StGradS.cells[7, I]);
                   fTempListaCotacao.FieldByName('COD_GRADE').AsInteger := 0; //StrToInt(gradeTemp);
                   fTempListaCotacao.FieldByName('NUM_PED').AsInteger := 0;
                   fTempListaCotacao.FieldByName('NUM_TRANS').AsInteger := 0;
                   fTempListaCotacao.Post;
                 end
                 else
                 begin
                   fTempListaCotacao.Edit;
                   fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat :=
                   	fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat + StrToFloat(FrmSugestaoCompra.StGradS.cells[7, I]);
                   fTempListaCotacao.Post;
                 end;
               end;
             end;
           finally
             fTempListaCotacao.Filtered := false;
           end;
         end;
       end;
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
    end;

    if fTempListaCotacao.IsEmpty then
    begin
      Application.MessageBox(Pchar('Nenhum produto com quantidade sugerida selecionado, favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
      Result := false;
      exit;
    end;

    fTempListaCotacao.Filtered := false;
    FrmSugestaoCompra.DBGrid4.DataSource := fTempListaCotacaoDtSource;
    FrmSugestaoCompra.Edit1.Text := '';
    FrmSugestaoCompra.Memo1.Text := '';
    result := (formulario.ShowModal = mrOk);
  finally
    if Result then
    begin
      vSel := false;
      vCodListaContacao := 0;

      try
        try
          fTempListaCotacao.DisableControls;
          fTempListaCotacao.First;
          while not fTempListaCotacao.Eof do
          begin
            fTempListaCotacao.Edit;
            fTempListaCotacao.FieldByName('DESCRICAO_LISTA').AsString := FrmSugestaoCompra.Edit1.Text;
            fTempListaCotacao.FieldByName('OBS').AsString := FrmSugestaoCompra.Memo1.Text;
            if fTempListaCotacao.FieldByName('SEL').AsString = 'S' then
            begin
              if not vSel then
              begin
                buscas.Close;
                buscas.SQL.Text := ' INSERT INTO LISTA_COTACAO (COD_LISTA, COD_EMPRESA, DESCRICAO_LISTA, DATA, OBS, ATIVO, NUM_PED)' +
                  '  VALUES (:COD_LISTA, :COD_EMPRESA, :DESCRICAO_LISTA, :DATA, :OBS, :ATIVO, :NUM_PED);';
                dtmSugestaoCompras.SpIncCodigo.Transaction := dtmSugestaoCompras.IBTransSugestao;
                buscas.ParamByName('COD_LISTA').AsInteger := Gencodigo('LISTA_COTACAO', dtmSugestaoCompras.SpIncCodigo, vDadosIni.codEmpresa);;
                buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
                buscas.ParamByName('DESCRICAO_LISTA').AsString := fTempListaCotacao.FieldByName('DESCRICAO_LISTA').AsString;
                buscas.ParamByName('DATA').AsString := FormatDateTime('DD/MM/YYYY', vDadosIni.getDataHoraBanco(dtmSugestaoCompras.qrBuscasPedido));
                buscas.ParamByName('OBS').AsString := fTempListaCotacao.FieldByName('OBS').AsString;
                buscas.ParamByName('ATIVO').AsInteger := 1;
                if dataSet.FieldByName('COD_SUGESTAO').AsInteger > 0 then
                  buscas.ParamByName('NUM_PED').AsInteger := dataSet.FieldByName('COD_SUGESTAO').AsInteger;
                vCodListaContacao := buscas.ParamByName('COD_LISTA').AsInteger;
                buscas.ExecSQL;
              end;

              buscas2.Close;
              buscas2.SQL.Text := ' SELECT COD_LISTA, GRUPO_PROD, COD_PROD, ' +
                ' COD_GRADE, COD_EMPRESA, COD_EMPRESA AS COD_EMP_MULT, ' +
                ' NUM_FAB_PROD, DESCR_PROD, QUANT_PROD, NUM_PED, COD_COTACAO FROM LISTA_COTACAO_ITENS ' +
                ' WHERE COD_LISTA = ' + IntToStr(vCodListaContacao) +
                ' AND GRUPO_PROD = ' + IntToStr(fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger) +
                ' AND COD_PROD = ' + QuotedStr(fTempListaCotacao.FieldByName('COD_PROD').AsString)+
                ' AND COD_GRADE = ' + IntToStr(fTempListaCotacao.FieldByName('COD_GRADE').AsInteger) +
                ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
                ' UNION ALL ' +
                ' SELECT COD_LISTA, GRUPO_PROD, COD_PROD, ' +
                ' COD_GRADE, COD_EMPRESA, COD_EMP_MULT, ' +
                ' NUM_FAB_PROD, DESCR_PROD, QUANT_PROD, NUM_PED, COD_COTACAO FROM LISTA_COTACAO_ITENS2 ' +
                ' WHERE COD_LISTA = ' + IntToStr(vCodListaContacao) +
                ' AND GRUPO_PROD = ' + IntToStr(fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger) +
                ' AND COD_PROD = ' + QuotedStr(fTempListaCotacao.FieldByName('COD_PROD').AsString) +
                ' AND COD_GRADE = ' + IntToStr(fTempListaCotacao.FieldByName('COD_GRADE').AsInteger) +
                ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
                ' AND COD_EMP_MULT = ' + IntToStr(fTempListaCotacao.FieldByName('COD_EMP_MULT').AsInteger);
              buscas2.Prepare;
              buscas2.Open;

              if buscas2.IsEmpty then
              begin
                buscas.Close;
//                buscas.SQL.Text := ' INSERT INTO LISTA_COTACAO_ITENS (COD_LISTA, GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMPRESA, NUM_FAB_PROD, DESCR_PROD, QUANT_PROD, NUM_PED)' +
//                  '  VALUES (:COD_LISTA, :GRUPO_PROD, :COD_PROD, :COD_GRADE, :COD_EMPRESA, :NUM_FAB_PROD, :DESCR_PROD, :QUANT_PROD, :NUM_PED);';
                buscas.SQL.Text := ' INSERT INTO LISTA_COTACAO_ITENS2 (COD_LISTA, GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMPRESA, COD_EMP_MULT, NUM_FAB_PROD, DESCR_PROD, QUANT_PROD, NUM_PED)' +
                  '  VALUES (:COD_LISTA, :GRUPO_PROD, :COD_PROD, :COD_GRADE, :COD_EMPRESA, :COD_EMP_MULT, :NUM_FAB_PROD, :DESCR_PROD, :QUANT_PROD, :NUM_PED);';
                buscas.ParamByName('COD_LISTA').AsInteger := vCodListaContacao;
                buscas.ParamByName('GRUPO_PROD').AsInteger := fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger;
                buscas.ParamByName('COD_PROD').AsString := fTempListaCotacao.FieldByName('COD_PROD').AsString;
                buscas.ParamByName('COD_GRADE').AsInteger := fTempListaCotacao.FieldByName('COD_GRADE').AsInteger;
                buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
                buscas.ParamByName('COD_EMP_MULT').AsInteger := fTempListaCotacao.FieldByName('COD_EMP_MULT').AsInteger;
                buscas.ParamByName('NUM_FAB_PROD').AsString := fTempListaCotacao.FieldByName('NUM_FAB_PROD').AsString;
                buscas.ParamByName('DESCR_PROD').AsString := fTempListaCotacao.FieldByName('DESCR_PROD').AsString;
                buscas.ParamByName('QUANT_PROD').AsFloat := fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat;
                if dataSet.FieldByName('COD_SUGESTAO').AsInteger > 0 then
                   buscas.ParamByName('NUM_PED').AsInteger := dataSet.FieldByName('COD_SUGESTAO').AsInteger;
                buscas.ExecSQL;
              end;
              vSel := true;
            end;
            fTempListaCotacao.FieldByName('COD_LISTA').AsInteger := vCodListaContacao;
            fTempListaCotacao.Post;
            fTempListaCotacao.Next;
          end;
          if trim(pListas) = '' then
            pListas := IntToStr(vCodListaContacao) + '|'
          else
            pListas := pListas + IntToStr(vCodListaContacao) + '|';
          pQuantLista := pQuantLista + 1;

          CommitaTransacao;
        finally
          fTempListaCotacao.First;
          fTempListaCotacao.EnableControls;
        end;

      except
        on e: exception do
        begin
          Result := false;
          Application.MessageBox(pchar('Erro ao montar lista de cotação. Erro: ' +
            e.Message), 'Atenção', MB_ICONEXCLAMATION +
            MB_OK);
        end;
      end;
    end;
    FrmSugestaoCompra.pnListaCotacao.Parent := FrmSugestaoCompra.TabSheet7;
    formulario.Free;
    formulario := nil;
  end;
end;

function TSugestao.abreListaPedidoCompra(pBuscar: boolean = false): boolean;
var
  I: Integer;
  vSel: boolean;
  gradeTemp, gradeDescTemp: string;
  vCodListaContacao: Integer;
  buscas2: TIBQuery;
begin
	Result := False;

  if not FrmSugestaoCompra.StGradS.RowCount > 0 then
    exit;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  fTempEmpresasPedido := TClientDataSet.Create(nil);
  fTempEmpresasPedido.Close;
  fTempEmpresasPedido.FieldDefs.Clear;
  fTempEmpresasPedido.FieldDefs.Add('SEL', ftString, 1, false);
  fTempEmpresasPedido.FieldDefs.Add('COD_EMPRESA', ftInteger, 0, false);
  fTempEmpresasPedido.FieldDefs.Add('IDENTIFICACAO_EMP', ftString, 80, false);
  fTempEmpresasPedido.FieldDefs.Add('CGC_EMP', ftString, 18, false);
  
  if fTempEmpresasPedido.Tag = 0 then
  try
    fTempEmpresasPedido.CreateDataSet;
    fTempEmpresasPedido.Tag := 1;
    fTempEmpresasPedido.FieldByName('SEL').DisplayLabel := 'Sel';
    fTempEmpresasPedido.FieldByName('COD_EMPRESA').DisplayLabel := 'Empresa';
    fTempEmpresasPedido.FieldByName('IDENTIFICACAO_EMP').DisplayLabel := 'Identificação';
    fTempEmpresasPedido.FieldByName('CGC_EMP').DisplayLabel := 'CNPJ/CPF';

    fTempEmpresasPedidoDtSource := TDataSource.Create(nil);
    fTempEmpresasPedidoDtSource.DataSet := fTempEmpresasPedido;
  except
  end;
  
  fTempClientesPedido := TClientDataSet.Create(nil);
  fTempClientesPedido.Close;
  fTempClientesPedido.FieldDefs.Clear;
  fTempClientesPedido.FieldDefs.Add('SEL', ftString, 1, false);
  fTempClientesPedido.FieldDefs.Add('COD_EMPRESA', ftInteger, 0, false);
  fTempClientesPedido.FieldDefs.Add('COD_CLIENTE', ftInteger, 0, false);
  fTempClientesPedido.FieldDefs.Add('NOME_CLIENTE', ftString, 35, false);
  fTempClientesPedido.FieldDefs.Add('RAZAO', ftString, 60, false);
  fTempClientesPedido.FieldDefs.Add('CPFCGC', ftString, 18, false);
  fTempClientesPedido.FieldDefs.Add('TIPO', ftString, 1, false);

  if fTempClientesPedido.Tag = 0 then
  try
    fTempClientesPedido.CreateDataSet;
    fTempClientesPedido.Tag := 1;
    fTempClientesPedido.FieldByName('SEL').DisplayLabel := 'Sel';
    fTempClientesPedido.FieldByName('COD_EMPRESA').DisplayLabel := 'Empresa';
    fTempClientesPedido.FieldByName('COD_CLIENTE').DisplayLabel := 'Cod Fornecedor';
    fTempClientesPedido.FieldByName('NOME_CLIENTE').DisplayLabel := 'Nome Fantasia (Fornecedor)';
    fTempClientesPedido.FieldByName('RAZAO').DisplayLabel := 'Razão Social (Fornecedor)';
    fTempClientesPedido.FieldByName('CPFCGC').DisplayLabel := 'CNPJ/CPF';
    fTempClientesPedido.FieldByName('TIPO').DisplayLabel := 'Tipo';

    fTempClientesPedidoDtSource := TDataSource.Create(nil);
    fTempClientesPedidoDtSource.DataSet := fTempClientesPedido;
  except
  end;

  fTempListaCotacao.EmptyDataSet;
  fTempListaCotacaoOld.EmptyDataSet;
  fTempEmpresasPedido.EmptyDataSet;
  fTempClientesPedido.EmptyDataSet;

  try
  	vDadosIni.abreStatusProcessamento('', 'Lendo dados da sugestão de compra');

    for I := 1 to FrmSugestaoCompra.StGradS.RowCount - 1 do
    begin
     vDadosIni.abreStatusProcessamento('', 'Lendo dados da sugestão de compra (' + IntToStr(I) + ' de ' + IntToStr(FrmSugestaoCompra.StGradS.RowCount) + ')');
     
     if (Pos('CMP', FrmSugestaoCompra.StGradS.cells[1, I]) = 0)
      and (Pos('VND', FrmSugestaoCompra.StGradS.cells[1, I]) = 0)
      and (Pos('TRF', FrmSugestaoCompra.StGradS.cells[1, I]) = 0)
      and (trim(FrmSugestaoCompra.StGradS.cells[12, I]) <> '')
      and (trim(FrmSugestaoCompra.StGradS.cells[13, I]) <> '')
      and (trim(FrmSugestaoCompra.StGradS.Cells[7, I]) <> '0') then
     begin
       if (FrmSugestaoCompra.StGradS.cells[9, i] = 'SEL') or (pBuscar) then
       begin
         if trim(FrmSugestaoCompra.StGradS.cells[15, I]) = '' then
         begin
           gradeTemp := '0';
           if trim(FrmSugestaoCompra.StGradS.cells[16, I]) = '' then
             gradeDescTemp := 'SEM GRADE'
           else
	           gradeDescTemp := trim(FrmSugestaoCompra.StGradS.cells[16, I]);
         end
         else
         begin
           gradeTemp := trim(FrmSugestaoCompra.StGradS.cells[15, I]);
           if trim(FrmSugestaoCompra.StGradS.cells[16, I]) = '' then
             gradeDescTemp := 'SEM GRADE'
           else
	           gradeDescTemp := trim(FrmSugestaoCompra.StGradS.cells[16, I]);
         end;

         buscas.Close;
         buscas.SQL.Text := ' select distinct emp.cod_empresa, ' +
           ' coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp, emp.cgc_emp ' +
           ' from empresa emp ' +
           ' where emp.cod_empresa = ' + trim(FrmSugestaoCompra.StGradS.cells[14, I]);
         buscas.Open;

         buscas.First;
         while not buscas.Eof do
         begin
         	 try
             fTempEmpresasPedido.Filtered := false;
             fTempEmpresasPedido.Filter := 'COD_EMPRESA = ' + IntToStr(buscas.FieldByName('COD_EMPRESA').AsInteger);
             fTempEmpresasPedido.Filtered := true;

             if fTempEmpresasPedido.IsEmpty then
             begin
               fTempEmpresasPedido.Insert;
               fTempEmpresasPedido.FieldByName('SEL').AsString := 'S';
               fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger := buscas.FieldByName('COD_EMPRESA').AsInteger;
               fTempEmpresasPedido.FieldByName('IDENTIFICACAO_EMP').AsString := buscas.FieldByName('IDENTIFICACAO_EMP').AsString;
               fTempEmpresasPedido.FieldByName('CGC_EMP').AsString := buscas.FieldByName('CGC_EMP').AsString;
               fTempEmpresasPedido.Post;
             end;
           finally
             fTempEmpresasPedido.Filtered := false;
           end;

           buscas.Next;
         end;

         buscas.Close;
         buscas.SQL.Text := ' select distinct c.fornec, c.cod_empresa, cl.nome_cliente, cl.razao, cl.cpfcgc, cl.tipo, ' +
           ' coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp, emp.cgc_emp ' +
           ' from custos c ' +
           ' inner join empresa emp on emp.cod_empresa = c.cod_empresa ' +
           ' inner join clientes cl on cl.cod_cliente = c.fornec and cl.cod_empresa = c.cod_empresa ' +
           ' where c.grupo_prod = ' + trim(FrmSugestaoCompra.StGradS.cells[12, I]) +
           ' and c.cod_prod = ' + QuotedStr(trim(FrmSugestaoCompra.StGradS.cells[13, I])) +
           ' and c.cod_empresa = ' + trim(FrmSugestaoCompra.StGradS.cells[14, I]) +
           ' and c.data >= (current_date - 365) ' +
           ' and cl.cpfcgc not in (select emp.cgc_emp from empresa emp where emp.ativo = 1) ';
         buscas.Open;

         buscas.First;
         while not buscas.Eof do
         begin
           try
             fTempClientesPedido.Filtered := false;
             fTempClientesPedido.Filter := 'COD_CLIENTE = ' + IntToStr(buscas.FieldByName('FORNEC').AsInteger) +
               ' AND COD_EMPRESA = ' + IntToStr(buscas.FieldByName('COD_EMPRESA').AsInteger);
             fTempClientesPedido.Filtered := true;

             if fTempClientesPedido.IsEmpty then
             begin
               fTempClientesPedido.Insert;
               fTempClientesPedido.FieldByName('SEL').AsString := 'S';
               fTempClientesPedido.FieldByName('COD_CLIENTE').AsInteger := buscas.FieldByName('FORNEC').AsInteger;
               fTempClientesPedido.FieldByName('COD_EMPRESA').AsInteger := buscas.FieldByName('COD_EMPRESA').AsInteger;
               fTempClientesPedido.FieldByName('NOME_CLIENTE').AsString := buscas.FieldByName('NOME_CLIENTE').AsString;
               fTempClientesPedido.FieldByName('RAZAO').AsString := buscas.FieldByName('RAZAO').AsString;
               fTempClientesPedido.FieldByName('CPFCGC').AsString := buscas.FieldByName('CPFCGC').AsString;
               fTempClientesPedido.FieldByName('TIPO').AsString := buscas.FieldByName('TIPO').AsString;
               fTempClientesPedido.Post;
             end;
           finally
             fTempClientesPedido.Filtered := false;
           end;

           buscas.Next;
         end;

         try
           fTempListaCotacao.Filtered := false;
           fTempListaCotacao.Filter := 'GRUPO_PROD = ' + trim(FrmSugestaoCompra.StGradS.cells[12, I]) +
             ' AND COD_PROD = ' + QuotedStr(trim(FrmSugestaoCompra.StGradS.cells[13, I])) +
             ' AND COD_GRADE = ' + gradeTemp +
             ' AND COD_EMP_MULT = ' + trim(FrmSugestaoCompra.StGradS.cells[14, I]);
           fTempListaCotacao.Filtered := true;

           if  ((fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger <> StrToInt(FrmSugestaoCompra.StGradS.cells[12, I]))
             and (fTempListaCotacao.FieldByName('COD_PROD').AsString <> FrmSugestaoCompra.StGradS.cells[13, I])) then
           begin
             buscas.Close;
             buscas.SQL.Text := ' SELECT PR.GRUPO_PROD, PR.COD_PROD, PR.COD_EMPRESA, ' +
               ' PR.NUM_FAB_PROD, DESCR_PROD, DESCR_PROD_RED, EMB_PROD, ' +
               ' PR.CUSTO_HONDA, PR.PREC_CUS_PROD, PR.VL_ULT_COMPRA, ' +
               ' COALESCE((CASE WHEN ((SELECT COUNT(*) FROM ITEM_PEDIDO IT ' +
               '          WHERE IT.GRUPO_PROD = :GRUPO_PROD ' +
               '          AND IT.COD_PROD = :COD_PROD ' +
               '          AND IT.COD_EMPRESA = :COD_EMPRESA ' +
               '          AND IT.COD_GRADE = :COD_GRADE ' +
               '          AND IT.COD_SUGESTAO = :COD_SUGESTAO ' +
               '          AND IT.COD_EMP_MULT = :COD_EMP_MULT) > 0) then ' +
               '               (SELECT FIRST 1 IT.NUM_PED FROM ITEM_PEDIDO IT ' +
               '               WHERE IT.GRUPO_PROD = :GRUPO_PROD ' +
               '               AND IT.COD_PROD = :COD_PROD ' +
               '               AND IT.COD_EMPRESA = :COD_EMPRESA ' +
               '               AND IT.COD_GRADE = :COD_GRADE ' +
               '               AND IT.COD_SUGESTAO = :COD_SUGESTAO ' +
               '               AND IT.COD_EMP_MULT = :COD_EMP_MULT) ' +
               '           ELSE ' +
               '               (SELECT FIRST 1 IT.NUM_PED FROM ITEM_PEDIDO IT ' +
               '               WHERE IT.GRUPO_PROD = :GRUPO_PROD ' +
               '               AND IT.COD_PROD = :COD_PROD ' +
               '               AND IT.COD_EMPRESA = :COD_EMPRESA ' +
               '               AND IT.COD_GRADE = :COD_GRADE ' +
               '               AND IT.COD_SUGESTAO = :COD_SUGESTAO ' +
               '               AND IT.COD_EMP_MULT = 0) ' +
               '          END), 0) NUM_PED, ' +
               ' 0 NUM_TRANS ' +
               ' FROM PRODUTOS PR ' +
               ' WHERE PR.GRUPO_PROD = :GRUPO_PROD ' +
               ' AND PR.COD_PROD = :COD_PROD ' +
               ' AND PR.COD_EMPRESA = :COD_EMP_MULT ';
             buscas.ParamByName('GRUPO_PROD').AsInteger := StrToInt(trim(FrmSugestaoCompra.StGradS.cells[12, I]));
             buscas.ParamByName('COD_PROD').AsString := trim(FrmSugestaoCompra.StGradS.cells[13, I]);
             buscas.ParamByName('COD_GRADE').AsInteger := StrToInt(gradeTemp);
             buscas.ParamByName('COD_SUGESTAO').AsInteger := dataSet.FieldByName('COD_SUGESTAO').AsInteger;
             buscas.ParamByName('COD_EMP_MULT').AsInteger := StrToInt(trim(FrmSugestaoCompra.StGradS.cells[14, I]));
             buscas.ParamByName('COD_EMPRESA').AsInteger := vDadosIni.cod_empresa;
             buscas.Open;

             if not buscas.IsEmpty then
             begin
               fTempListaCotacao.Insert;
               fTempListaCotacao.FieldByName('DESCRICAO_LISTA').AsString := '';
               fTempListaCotacao.FieldByName('OBS').AsString := '';
               fTempListaCotacao.FieldByName('SEL').AsString := 'S';
               fTempListaCotacao.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(FrmSugestaoCompra.StGradS.cells[14, I]);
               fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger := StrToInt(FrmSugestaoCompra.StGradS.cells[12, I]);
               fTempListaCotacao.FieldByName('COD_PROD').AsString := FrmSugestaoCompra.StGradS.cells[13, I];
               fTempListaCotacao.FieldByName('NUM_FAB_PROD').AsString := buscas.FieldByName('NUM_FAB_PROD').AsString;
               if FrmSugestaoCompra.CheckDescrRed.Checked then
                 fTempListaCotacao.FieldByName('DESCR_PROD').AsString := Copy(Trim(buscas.FieldByName('DESCR_PROD_RED').asstring) +
                 	 vDadosIni.IfThen(StrToInt(gradeTemp) > 0, vDadosIni.IfThen(trim(gradeDescTemp) <> '', ' ' + trim(gradeDescTemp), ''), '') +
                 	 ' ' + buscas.FieldByName('EMB_PROD').asstring, 1, 75)
               else
                 fTempListaCotacao.FieldByName('DESCR_PROD').AsString := Copy(Trim(buscas.FieldByName('DESCR_PROD').asstring) +
                 	 vDadosIni.IfThen(StrToInt(gradeTemp) > 0, vDadosIni.IfThen(trim(gradeDescTemp) <> '', ' ' + trim(gradeDescTemp), ''), '') +
                 	 ' ' + buscas.FieldByName('EMB_PROD').asstring, 1, 75);
  //             fTempListaCotacao.FieldByName('DESCR_PROD').AsString := FrmSugestaoCompra.StGradS.cells[11, I];
               fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat := StrToFloat(FrmSugestaoCompra.StGradS.cells[7, I]);
               fTempListaCotacao.FieldByName('COD_GRADE').AsInteger := StrToInt(gradeTemp);
               fTempListaCotacao.FieldByName('NUM_PED').AsInteger := buscas.FieldByName('NUM_PED').AsInteger;
               fTempListaCotacao.FieldByName('NUM_TRANS').AsInteger := buscas.FieldByName('NUM_TRANS').AsInteger;

               if vDadosIni.vEmp.vConcess = 'S' then
                 fTempListaCotacao.FieldByName('VALOR').AsFloat := buscas.FieldByName('CUSTO_HONDA').AsFloat
               else
               begin
                 if buscas.FieldByName('VL_ULT_COMPRA').AsFloat = 0 then
                   fTempListaCotacao.FieldByName('VALOR').AsFloat := buscas.FieldByName('PREC_CUS_PROD').AsFloat
                 else
                   fTempListaCotacao.FieldByName('VALOR').AsFloat := buscas.FieldByName('VL_ULT_COMPRA').AsFloat;
               end;

               fTempListaCotacao.Post;

               fTempListaCotacaoOld.Insert;
               fTempListaCotacaoOld.FieldByName('DESCRICAO_LISTA').AsString := '';
               fTempListaCotacaoOld.FieldByName('OBS').AsString := '';
               fTempListaCotacaoOld.FieldByName('SEL').AsString := 'S';
               fTempListaCotacaoOld.FieldByName('COD_EMP_MULT').AsInteger := StrToInt(FrmSugestaoCompra.StGradS.cells[14, I]);
               fTempListaCotacaoOld.FieldByName('GRUPO_PROD').AsInteger := StrToInt(FrmSugestaoCompra.StGradS.cells[12, I]);
               fTempListaCotacaoOld.FieldByName('COD_PROD').AsString := FrmSugestaoCompra.StGradS.cells[13, I];
               fTempListaCotacaoOld.FieldByName('NUM_FAB_PROD').AsString := buscas.FieldByName('NUM_FAB_PROD').AsString;
               if FrmSugestaoCompra.CheckDescrRed.Checked then
                 fTempListaCotacaoOld.FieldByName('DESCR_PROD').AsString := Copy(Trim(buscas.FieldByName('DESCR_PROD_RED').asstring) +
                 	 vDadosIni.IfThen(StrToInt(gradeTemp) > 0, vDadosIni.IfThen(trim(gradeDescTemp) <> '', ' ' + trim(gradeDescTemp), ''), '') +
                 	 ' ' + buscas.FieldByName('EMB_PROD').asstring, 1, 75)
               else
                 fTempListaCotacaoOld.FieldByName('DESCR_PROD').AsString := Copy(Trim(buscas.FieldByName('DESCR_PROD').asstring) +
                   vDadosIni.IfThen(StrToInt(gradeTemp) > 0, vDadosIni.IfThen(trim(gradeDescTemp) <> '', ' ' + trim(gradeDescTemp), ''), '') +
                 	 ' ' + buscas.FieldByName('EMB_PROD').asstring, 1, 75);
  //             fTempListaCotacaoOld.FieldByName('DESCR_PROD').AsString := FrmSugestaoCompra.StGradS.cells[11, I];
               fTempListaCotacaoOld.FieldByName('QUANT_PROD').AsFloat := StrToFloat(FrmSugestaoCompra.StGradS.cells[7, I]);
               fTempListaCotacaoOld.FieldByName('COD_GRADE').AsInteger := StrToInt(gradeTemp);
               fTempListaCotacaoOld.FieldByName('NUM_PED').AsInteger := buscas.FieldByName('NUM_PED').AsInteger;
               fTempListaCotacaoOld.FieldByName('NUM_TRANS').AsInteger := buscas.FieldByName('NUM_TRANS').AsInteger;

               if vDadosIni.vEmp.vConcess = 'S' then
                 fTempListaCotacaoOld.FieldByName('VALOR').AsFloat := buscas.FieldByName('CUSTO_HONDA').AsFloat
               else
               begin
                 if buscas.FieldByName('VL_ULT_COMPRA').AsFloat = 0 then
                   fTempListaCotacaoOld.FieldByName('VALOR').AsFloat := buscas.FieldByName('PREC_CUS_PROD').AsFloat
                 else
                   fTempListaCotacaoOld.FieldByName('VALOR').AsFloat := buscas.FieldByName('VL_ULT_COMPRA').AsFloat;
               end;

               fTempListaCotacaoOld.Post;
             end;
           end;
         finally
           fTempListaCotacao.Filtered := false;
         end;
       end;
     end;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;

  if fTempListaCotacao.IsEmpty then
  begin
    Application.MessageBox(Pchar('Nenhum produto com quantidade sugerida selecionado, favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    Result := false;
    exit;
  end;

  if FrmSugestaoCompra.RadioGroupOrdenarCliente.ItemIndex = 0 then
    fTempClientesPedido.IndexFieldNames := 'COD_EMPRESA;COD_CLIENTE'
  else if FrmSugestaoCompra.RadioGroupOrdenarCliente.ItemIndex = 1 then
    fTempClientesPedido.IndexFieldNames := 'COD_CLIENTE;COD_EMPRESA'
  else if FrmSugestaoCompra.RadioGroupOrdenarCliente.ItemIndex = 2 then
    fTempClientesPedido.IndexFieldNames := 'NOME_CLIENTE;COD_EMPRESA'
  else if FrmSugestaoCompra.RadioGroupOrdenarCliente.ItemIndex = 3 then
    fTempClientesPedido.IndexFieldNames := 'RAZAO;COD_EMPRESA';

  fTempEmpresasPedido.IndexFieldNames := 'COD_EMPRESA';
  
  vEmpresasPedSug._abreEmpresa;
  vFornecPedSug._abreFornecedor(0, vEmpresasPedSug.dataSet.FieldByName('COD_EMPRESA').AsInteger);
  vVendedorPedSug._abreVendedor(vEmpresasPedSug.dataSet.FieldByName('COD_EMPRESA').AsInteger);
  vCondPagPedSug._abreCondPag;

  vCodEmpresaPedSug := 0;

  fTempListaCotacao.AfterScroll := datasetAfterScrollCusto;

  fTempListaCotacao.Filtered := false;
  FrmSugestaoCompra.DBGridMontarPedidoCompraProdTop2.DataSource := fTempEmpresasPedidoDtSource;
  FrmSugestaoCompra.DBGridMontarPedidoCompraProdTop.DataSource := fTempClientesPedidoDtSource;
  FrmSugestaoCompra.DBGridMontarPedidoCompraProd.DataSource := fTempListaCotacaoDtSource;
  FrmSugestaoCompra.DBGridLocalizarProdSug.DataSource := fTempListaCotacaoDtSource;

  if FrmSugestaoCompra.ckFiltrarPorEmpresa.Checked then
  begin
  	FrmSugestaoCompra.DBGridMontarPedidoCompraProdTop.Visible := false;
	  FrmSugestaoCompra.DBGridMontarPedidoCompraProdTop2.Visible := true;
    FrmSugestaoCompra.DBGridMontarPedidoCompraProdTop2.Align := alClient;
  end
  else
  begin
  	FrmSugestaoCompra.DBGridMontarPedidoCompraProdTop2.Visible := false;
	  FrmSugestaoCompra.DBGridMontarPedidoCompraProdTop.Visible := true;
    FrmSugestaoCompra.DBGridMontarPedidoCompraProdTop.Align := alClient;
  end;

  FrmSugestaoCompra.ckFiltrarPorEmpresa.Checked := false;
  FrmSugestaoCompra.ckFiltrarPorFornecedor.Checked := false;

  fTempClientesPedido.FieldByName('SEL').Visible :=
  	vDadosIni.IfThen(FrmSugestaoCompra.ckFiltrarPorFornecedor.Checked, true, false);
  for i := 0 to FrmSugestaoCompra.DBGridMontarPedidoCompraProdTop.FieldCount - 1 do
  	if (UpperCase(trim(FrmSugestaoCompra.DBGridMontarPedidoCompraProdTop.Fields[i].FieldName)) = 'SEL') then
    begin
    	 FrmSugestaoCompra.DBGridMontarPedidoCompraProdTop.Fields[i].Visible :=
       	 vDadosIni.IfThen(FrmSugestaoCompra.ckFiltrarPorFornecedor.Checked, false, true);
       break;
    end;

  FrmSugestaoCompra.SpeedButtonSelTodosEmpFornec.Visible :=
  	(FrmSugestaoCompra.ckFiltrarPorEmpresa.Checked) or (FrmSugestaoCompra.ckFiltrarPorFornecedor.Checked);
  FrmSugestaoCompra.SpeedButtonDesTodosEmpFornec.Visible :=
  	(FrmSugestaoCompra.ckFiltrarPorEmpresa.Checked) or (FrmSugestaoCompra.ckFiltrarPorFornecedor.Checked);

  if pBuscar then
  	Result := vDadosIni.abreForm('Montar pedido de compra', FrmSugestaoCompra.pnLocalizarProdSug, [ofEscapeExit, ofAlignAllClientWinCtrl])
	else
	  Result := vDadosIni.abreForm('Montar pedido de compra', FrmSugestaoCompra.pnMontarPedidoCompra, [ofEscapeExit, ofAlignAllClientWinCtrl]);

  if Result then
  begin
    if pBuscar then
    begin
      Result := abreFormMontarPedidoCompra2;

      if Result then
			  Result := abreFormMontarPedidoCompra;
    end
    else
      Result := abreFormMontarPedidoCompra;
  end;
end;

function TSugestao.abreListaTransferencia: boolean;
var
	I: Integer;
  gradeTemp, gradeDescTemp: string;
  vCodEmpMultTransf: Integer;
  buscas2: TIBQuery;
begin
	Result := False;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  if not FrmSugestaoCompra.StGradS.RowCount > 0 then
    exit;

  fTempEmpresasPedido := TClientDataSet.Create(nil);
  fTempEmpresasPedido.Close;
  fTempEmpresasPedido.FieldDefs.Clear;

  fTempEmpresasPedido.FieldDefs.Add('COD_EMP_TRANSF', ftInteger, 0, false);
  fTempEmpresasPedido.FieldDefs.Add('IDENTIFICACAO_EMP_TRANSF', ftString, 80, false);
  fTempEmpresasPedido.FieldDefs.Add('CGC_EMP_TRANS', ftString, 18, false);

  fTempEmpresasPedido.FieldDefs.Add('SEL', ftString, 1, false);
  fTempEmpresasPedido.FieldDefs.Add('COD_EMPRESA', ftInteger, 0, false);
  fTempEmpresasPedido.FieldDefs.Add('IDENTIFICACAO_EMP', ftString, 80, false);
  fTempEmpresasPedido.FieldDefs.Add('CGC_EMP', ftString, 18, false);
  
  if fTempEmpresasPedido.Tag = 0 then
  try
    fTempEmpresasPedido.CreateDataSet;
    fTempEmpresasPedido.Tag := 1;
    fTempEmpresasPedido.FieldByName('SEL').DisplayLabel := 'Sel';

    fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').DisplayLabel := 'Empresa (Orig)';
    fTempEmpresasPedido.FieldByName('IDENTIFICACAO_EMP_TRANSF').DisplayLabel := 'Identificação Emp (Orig)';
    fTempEmpresasPedido.FieldByName('IDENTIFICACAO_EMP_TRANSF').DisplayWidth := 40;
    fTempEmpresasPedido.FieldByName('CGC_EMP_TRANS').DisplayLabel := 'CNPJ/CPF (Orig)';

    fTempEmpresasPedido.FieldByName('COD_EMPRESA').DisplayLabel := 'Empresa (Dest)';
    fTempEmpresasPedido.FieldByName('IDENTIFICACAO_EMP').DisplayLabel := 'Identificação Emp (Dest)';
    fTempEmpresasPedido.FieldByName('IDENTIFICACAO_EMP').DisplayWidth := 40;
    fTempEmpresasPedido.FieldByName('CGC_EMP').DisplayLabel := 'CNPJ/CPF (Dest)';

    fTempEmpresasPedidoDtSource := TDataSource.Create(nil);
    fTempEmpresasPedidoDtSource.DataSet := fTempEmpresasPedido;
  except
  end;

  fTempListaCotacao.EmptyDataSet;
  fTempListaCotacaoOld.EmptyDataSet;
  fTempEmpresasPedido.EmptyDataSet;

  try
  	vDadosIni.abreStatusProcessamento('', 'Lendo dados da sugestão de compra');

    vCodEmpMultTransf := vDadosIni.cod_empresa;
    for I := 1 to FrmSugestaoCompra.StGradS.RowCount - 1 do
    begin
     vDadosIni.abreStatusProcessamento('', 'Lendo dados da sugestão de compra (' + IntToStr(I) + ' de ' + IntToStr(FrmSugestaoCompra.StGradS.RowCount) + ')');

     if (copy(GridSug.cells[1, I], 1, 3) <> 'CMP') and (copy(GridSug.cells[1, I], 1, 3) <> 'VND') and (copy(GridSug.cells[1, I], 1, 3) <> 'TRF') then
     begin
       if (Trim(GridSug.cells[12, I]) <> '') and (Trim(GridSug.cells[13, I]) <> '') then
       begin
         if (copy(GridSug.cells[1, I], 1, 3) = 'EMP') then
         begin
           if trim(GridSug.cells[14, I]) = '' then
             vCodEmpMultTransf := vDadosIni.cod_empresa
           else
             vCodEmpMultTransf := StrToInt(trim(GridSug.cells[14, I]));
         end;
       end;
     end
     else if (Pos('TRF', FrmSugestaoCompra.StGradS.cells[1, I]) > 0)
       and (trim(FrmSugestaoCompra.StGradS.cells[12, I]) <> '')
       and (trim(FrmSugestaoCompra.StGradS.cells[13, I]) <> '') then
     begin
       if (FrmSugestaoCompra.StGradS.cells[9, i] = 'SEL') then
       begin
         if trim(FrmSugestaoCompra.StGradS.cells[15, I]) = '' then
         begin
           gradeTemp := '0';
           if trim(FrmSugestaoCompra.StGradS.cells[16, I]) = '' then
             gradeDescTemp := 'SEM GRADE'
           else
	           gradeDescTemp := trim(FrmSugestaoCompra.StGradS.cells[16, I]);
         end
         else
         begin
           gradeTemp := trim(FrmSugestaoCompra.StGradS.cells[15, I]);
           if trim(FrmSugestaoCompra.StGradS.cells[16, I]) = '' then
             gradeDescTemp := 'SEM GRADE'
           else
	           gradeDescTemp := trim(FrmSugestaoCompra.StGradS.cells[16, I]);
         end;

         try
           fTempEmpresasPedido.Filtered := false;
           fTempEmpresasPedido.Filter := 'COD_EMPRESA = ' + IntToStr(vCodEmpMultTransf) +
           	 ' AND COD_EMP_TRANSF = ' + FrmSugestaoCompra.StGradS.cells[14, I];
           fTempEmpresasPedido.Filtered := true;

           if fTempEmpresasPedido.IsEmpty then
           begin
             buscas.Close;
             buscas.SQL.Text := ' select distinct emp.cod_empresa, ' +
               ' coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp, emp.cgc_emp ' +
               ' from empresa emp ' +
               ' where emp.cod_empresa = ' + IntToStr(vCodEmpMultTransf);
             buscas.Open;

             buscas2.Close;
             buscas2.SQL.Text := ' select distinct emp.cod_empresa, ' +
               ' coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp, emp.cgc_emp ' +
               ' from empresa emp ' +
               ' where emp.cod_empresa = ' + trim(FrmSugestaoCompra.StGradS.cells[14, I]);
             buscas2.Open;

             fTempEmpresasPedido.Insert;
             fTempEmpresasPedido.FieldByName('SEL').AsString := 'S';

             fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger := buscas2.FieldByName('COD_EMPRESA').AsInteger;
             fTempEmpresasPedido.FieldByName('IDENTIFICACAO_EMP_TRANSF').AsString := buscas2.FieldByName('IDENTIFICACAO_EMP').AsString;
             fTempEmpresasPedido.FieldByName('CGC_EMP_TRANS').AsString := buscas2.FieldByName('CGC_EMP').AsString;

             fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger := buscas.FieldByName('COD_EMPRESA').AsInteger;
             fTempEmpresasPedido.FieldByName('IDENTIFICACAO_EMP').AsString := buscas.FieldByName('IDENTIFICACAO_EMP').AsString;
             fTempEmpresasPedido.FieldByName('CGC_EMP').AsString := buscas.FieldByName('CGC_EMP').AsString;

             fTempEmpresasPedido.Post;
           end;
         finally
           fTempEmpresasPedido.Filtered := false;
         end;

//         try
//           fTempListaCotacao.Filtered := false;
//           fTempListaCotacao.Filter := 'GRUPO_PROD = ' + trim(FrmSugestaoCompra.StGradS.cells[12, I]) +
//             ' AND COD_PROD = ' + QuotedStr(trim(FrmSugestaoCompra.StGradS.cells[13, I])) +
//             ' AND COD_GRADE = ' + gradeTemp +
//             ' AND COD_EMP_MULT = ' + IntToStr(vCodEmpMultTransf);//trim(FrmSugestaoCompra.StGradS.cells[14, I]);
//           fTempListaCotacao.Filtered := true;
//
//           if  ((fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger <> StrToInt(FrmSugestaoCompra.StGradS.cells[12, I]))
//             and (fTempListaCotacao.FieldByName('COD_PROD').AsString <> FrmSugestaoCompra.StGradS.cells[13, I])
//             and (fTempListaCotacao.FieldByName('COD_GRADE').AsInteger <> StrToInt(gradeTemp))) then
//           begin
             buscas.Close;
             buscas.SQL.Text := ' SELECT PR.GRUPO_PROD, PR.COD_PROD, PR.COD_EMPRESA, ' +
               ' PR.NUM_FAB_PROD, DESCR_PROD, DESCR_PROD_RED, EMB_PROD, ' +
               ' PR.CUSTO_HONDA, PR.PREC_CUS_PROD, PR.VL_ULT_COMPRA, ' +
               ' COALESCE((CASE WHEN ((SELECT COUNT(*) FROM ITEM_PEDIDO IT ' +
               '          WHERE IT.GRUPO_PROD = :GRUPO_PROD ' +
               '          AND IT.COD_PROD = :COD_PROD ' +
               '          AND IT.COD_EMPRESA = :COD_EMPRESA ' +
               '          AND IT.COD_GRADE = :COD_GRADE ' +
               '          AND IT.COD_SUGESTAO = :COD_SUGESTAO ' +
               '          AND IT.COD_EMP_MULT = :COD_EMP_MULT) > 0) then ' +
               '               (SELECT FIRST 1 IT.NUM_PED FROM ITEM_PEDIDO IT ' +
               '               WHERE IT.GRUPO_PROD = :GRUPO_PROD ' +
               '               AND IT.COD_PROD = :COD_PROD ' +
               '               AND IT.COD_EMPRESA = :COD_EMPRESA ' +
               '               AND IT.COD_GRADE = :COD_GRADE ' +
               '               AND IT.COD_SUGESTAO = :COD_SUGESTAO ' +
               '               AND IT.COD_EMP_MULT = :COD_EMP_MULT) ' +
               '           ELSE ' +
               '               (SELECT FIRST 1 IT.NUM_PED FROM ITEM_PEDIDO IT ' +
               '               WHERE IT.GRUPO_PROD = :GRUPO_PROD ' +
               '               AND IT.COD_PROD = :COD_PROD ' +
               '               AND IT.COD_EMPRESA = :COD_EMPRESA ' +
               '               AND IT.COD_GRADE = :COD_GRADE ' +
               '               AND IT.COD_SUGESTAO = :COD_SUGESTAO ' +
               '               AND IT.COD_EMP_MULT = 0) ' +
               '          END), 0) NUM_PED, ' +
               ' COALESCE((SELECT FIRST 1 PP.NPED FROM PEDVENDA_PROD PP ' +
               '           WHERE PP.GRUPO_PROD = :GRUPO_PROD ' +
               '           AND PP.COD_PROD = :COD_PROD ' +
               '           AND PP.COD_EMPRESA = :COD_EMP_MULT ' +
               '           AND PP.COD_GRADE = :COD_GRADE ' +
               '           AND PP.COD_SUGESTAO = :COD_SUGESTAO ' +
               '           AND PP.COD_EMP_SUGESTAO = :COD_EMPRESA ' +
               '           AND COALESCE(PP.STATUS, '''') <> ''CANCELADO''), 0) NUM_TRANS ' +
               ' FROM PRODUTOS PR ' +
               ' WHERE PR.GRUPO_PROD = :GRUPO_PROD ' +
               ' AND PR.COD_PROD = :COD_PROD ' +
               ' AND PR.COD_EMPRESA = :COD_EMP_MULT ';
             buscas.ParamByName('GRUPO_PROD').AsInteger := StrToInt(trim(FrmSugestaoCompra.StGradS.cells[12, I]));
             buscas.ParamByName('COD_PROD').AsString := trim(FrmSugestaoCompra.StGradS.cells[13, I]);
             buscas.ParamByName('COD_GRADE').AsInteger := StrToInt(gradeTemp);
             buscas.ParamByName('COD_SUGESTAO').AsInteger := dataSet.FieldByName('COD_SUGESTAO').AsInteger;
             buscas.ParamByName('COD_EMP_MULT').AsInteger := StrToInt(trim(FrmSugestaoCompra.StGradS.cells[14, I]));
             buscas.ParamByName('COD_EMPRESA').AsInteger := vDadosIni.cod_empresa;
             buscas.Open;

             if not buscas.IsEmpty then
             begin
               fTempListaCotacao.Insert;
               fTempListaCotacao.FieldByName('DESCRICAO_LISTA').AsString := '';
               fTempListaCotacao.FieldByName('OBS').AsString := '';
               fTempListaCotacao.FieldByName('SEL').AsString := 'S';

               fTempListaCotacao.FieldByName('COD_EMP_TRANSF').AsInteger := StrToInt(FrmSugestaoCompra.StGradS.cells[14, I]);
               fTempListaCotacao.FieldByName('COD_EMP_MULT').AsInteger := vCodEmpMultTransf;

               fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger := StrToInt(FrmSugestaoCompra.StGradS.cells[12, I]);
               fTempListaCotacao.FieldByName('COD_PROD').AsString := FrmSugestaoCompra.StGradS.cells[13, I];
               fTempListaCotacao.FieldByName('NUM_FAB_PROD').AsString := buscas.FieldByName('NUM_FAB_PROD').AsString;
               if FrmSugestaoCompra.CheckDescrRed.Checked then
                 fTempListaCotacao.FieldByName('DESCR_PROD').AsString := Copy(Trim(buscas.FieldByName('DESCR_PROD_RED').asstring) +
                   vDadosIni.IfThen(StrToInt(gradeTemp) > 0, vDadosIni.IfThen(trim(gradeDescTemp) <> '', ' ' + trim(gradeDescTemp), ''), '') +
                 	 ' ' + buscas.FieldByName('EMB_PROD').asstring, 1, 75)
               else
                 fTempListaCotacao.FieldByName('DESCR_PROD').AsString := Copy(Trim(buscas.FieldByName('DESCR_PROD').asstring) +
                   vDadosIni.IfThen(StrToInt(gradeTemp) > 0, vDadosIni.IfThen(trim(gradeDescTemp) <> '', ' ' + trim(gradeDescTemp), ''), '') +
                   ' ' + buscas.FieldByName('EMB_PROD').asstring, 1, 75);
  //             fTempListaCotacao.FieldByName('DESCR_PROD').AsString := FrmSugestaoCompra.StGradS.cells[11, I];
               fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat := StrToFloat(FrmSugestaoCompra.StGradS.cells[11, I]);
               fTempListaCotacao.FieldByName('COD_GRADE').AsInteger := StrToInt(gradeTemp);
               fTempListaCotacao.FieldByName('NUM_PED').AsInteger := buscas.FieldByName('NUM_PED').AsInteger;
               fTempListaCotacao.FieldByName('NUM_TRANS').AsInteger := buscas.FieldByName('NUM_TRANS').AsInteger;

               if vDadosIni.vEmp.vConcess = 'S' then
                 fTempListaCotacao.FieldByName('VALOR').AsFloat := buscas.FieldByName('CUSTO_HONDA').AsFloat
               else
               begin
                 if buscas.FieldByName('VL_ULT_COMPRA').AsFloat = 0 then
                   fTempListaCotacao.FieldByName('VALOR').AsFloat := buscas.FieldByName('PREC_CUS_PROD').AsFloat
                 else
                   fTempListaCotacao.FieldByName('VALOR').AsFloat := buscas.FieldByName('VL_ULT_COMPRA').AsFloat;
               end;

               fTempListaCotacao.Post;

               fTempListaCotacaoOld.Insert;
               fTempListaCotacaoOld.FieldByName('DESCRICAO_LISTA').AsString := '';
               fTempListaCotacaoOld.FieldByName('OBS').AsString := '';
               fTempListaCotacaoOld.FieldByName('SEL').AsString := 'S';

               fTempListaCotacaoOld.FieldByName('COD_EMP_TRANSF').AsInteger := StrToInt(FrmSugestaoCompra.StGradS.cells[14, I]);
               fTempListaCotacaoOld.FieldByName('COD_EMP_MULT').AsInteger := vCodEmpMultTransf;

               fTempListaCotacaoOld.FieldByName('GRUPO_PROD').AsInteger := StrToInt(FrmSugestaoCompra.StGradS.cells[12, I]);
               fTempListaCotacaoOld.FieldByName('COD_PROD').AsString := FrmSugestaoCompra.StGradS.cells[13, I];
               fTempListaCotacaoOld.FieldByName('NUM_FAB_PROD').AsString := buscas.FieldByName('NUM_FAB_PROD').AsString;
               if FrmSugestaoCompra.CheckDescrRed.Checked then
                 fTempListaCotacaoOld.FieldByName('DESCR_PROD').AsString := Copy(Trim(buscas.FieldByName('DESCR_PROD_RED').asstring) +
                   vDadosIni.IfThen(StrToInt(gradeTemp) > 0, vDadosIni.IfThen(trim(gradeDescTemp) <> '', ' ' + trim(gradeDescTemp), ''), '') +
                   ' ' + buscas.FieldByName('EMB_PROD').asstring, 1, 75)
               else
                 fTempListaCotacaoOld.FieldByName('DESCR_PROD').AsString := Copy(Trim(buscas.FieldByName('DESCR_PROD').asstring) +
                   vDadosIni.IfThen(StrToInt(gradeTemp) > 0, vDadosIni.IfThen(trim(gradeDescTemp) <> '', ' ' + trim(gradeDescTemp), ''), '') +
                   ' ' + buscas.FieldByName('EMB_PROD').asstring, 1, 75);
  //             fTempListaCotacaoOld.FieldByName('DESCR_PROD').AsString := FrmSugestaoCompra.StGradS.cells[11, I];
               fTempListaCotacaoOld.FieldByName('QUANT_PROD').AsFloat := StrToFloat(FrmSugestaoCompra.StGradS.cells[11, I]);
               fTempListaCotacaoOld.FieldByName('COD_GRADE').AsInteger := StrToInt(gradeTemp);
               fTempListaCotacaoOld.FieldByName('NUM_PED').AsInteger := buscas.FieldByName('NUM_PED').AsInteger;
               fTempListaCotacaoOld.FieldByName('NUM_TRANS').AsInteger := buscas.FieldByName('NUM_TRANS').AsInteger;

               if vDadosIni.vEmp.vConcess = 'S' then
                 fTempListaCotacaoOld.FieldByName('VALOR').AsFloat := buscas.FieldByName('CUSTO_HONDA').AsFloat
               else
               begin
                 if buscas.FieldByName('VL_ULT_COMPRA').AsFloat = 0 then
                   fTempListaCotacaoOld.FieldByName('VALOR').AsFloat := buscas.FieldByName('PREC_CUS_PROD').AsFloat
                 else
                   fTempListaCotacaoOld.FieldByName('VALOR').AsFloat := buscas.FieldByName('VL_ULT_COMPRA').AsFloat;
               end;

               fTempListaCotacaoOld.Post;
             end;
//           end;
//         finally
//           fTempListaCotacao.Filtered := false;
//         end;
       end;
     end;
    end;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;

  if fTempListaCotacao.IsEmpty then
  begin
    Application.MessageBox(Pchar('Nenhuma transferência da sugestão de compra selecionada, favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    Result := false;
    exit;
  end;

  FrmSugestaoCompra.DBGridMontarTrasferenciasTop.DataSource := fTempEmpresasPedidoDtSource;
  FrmSugestaoCompra.DBGridMontarTrasferenciasAlClient.DataSource := fTempListaCotacaoDtSource;

  fTempEmpresasPedido.IndexFieldNames := 'COD_EMP_TRANSF';
  fTempEmpresasPedido.First;

  fTempEmpresasPedido.AfterScroll := datasetAfterScrollEmpresaTrans;

  for i := 0 to FrmSugestaoCompra.DBGridMontarTrasferenciasAlClient.FieldCount - 1 do
  	if (UpperCase(trim(FrmSugestaoCompra.DBGridMontarTrasferenciasAlClient.Fields[i].FieldName)) = 'COD_EMP_MULT') then
    begin
    	 FrmSugestaoCompra.DBGridMontarTrasferenciasAlClient.Fields[i].Visible := false;
       break;
    end;

  filtrarPorEmpresaTransf(
  	fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger,
  	fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger);
    
  Result := vDadosIni.abreForm('Montar transferências', FrmSugestaoCompra.pnMontarTrasferencias, [ofEscapeExit, ofAlignAllClientWinCtrl]);

  if Result then
  	montarTransferencias;
end;

function TSugestao.abreMarcas: boolean;
begin
  if LMarcas = nil then
    LMarcas := TListaMarca.create;
  LMarcas.buscas.Close;
  LMarcas.buscas.SQL.Text := 'SELECT * FROM marca_prod ' +
    ' where ativo=1';
  LMarcas.buscas.Open;
end;

function TSugestao.abreSGrupoF: boolean;
begin
  if LSGrupoF = nil then
    LSGrupoF := TListaSubGrupoFim.create;
  LSGrupoF.buscas.Close;
  LSGrupoF.buscas.SQL.Text := 'SELECT * FROM sub_grupo ' +
    ' where ativo=1';
  LSGrupoF.buscas.Open;
end;

function TSugestao.abreSGrupoI: boolean;
begin
  if LSGrupoI = nil then
    LSGrupoI := TListaSubGrupoIni.create;
  LSGrupoI.buscas.Close;
  LSGrupoI.buscas.SQL.Text := 'SELECT * FROM sub_grupo ' +
    ' where ativo=1';
  LSGrupoI.buscas.Open;
end;

function TSugestao.abreSugestao(Vazio: boolean): boolean;
begin
  if vazio then
    result := montaSelect('SELECT * FROM SUGESTAOCOMPRA where cod_sugestao = 0 and cod_empresa = 0')
  else
    result := montaSelect('SELECT * FROM SUGESTAOCOMPRA ' +
      'WHERE cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo=1');
end;

function TSugestao.AbrirLixeira: boolean;
begin
  if not StatusLixeira(true) then
  begin
    if dataSet.IsEmpty then
      result := montaSelect(ultimasql);
    result := false;
  end
  else
    result := montaSelect('select * from sugestaocompra where cod_empresa = ' + vDadosIni.codEmpresa + ' and (ativo = 0 or ativo is null)');
end;

procedure TSugestao.alteraSugestao;
var
	vGrupoProdTemp: string;
  vCodProdTemp: string;
  ValorTotOld, ValorTot: double;
  ValorSug, ValorTemp: double;
  gradeTemp: string;
  I: Integer;
begin
//  if (copy(GridSug.cells[1, GridSug.Row], 1, 3) <> 'CMP') and (copy(GridSug.cells[1, GridSug.Row], 1, 3) <> 'VND') and (trim(GridSug.cells[1, GridSug.Row]) <> 'GR.') then
	if (Trim(GridSug.cells[12, GridSug.Row]) <> '') and (Trim(GridSug.cells[13, GridSug.Row]) <> '') then
  begin
  	vGrupoProdTemp := Trim(GridSug.cells[12, GridSug.Row]);
    vCodProdTemp   := Trim(GridSug.cells[13, GridSug.Row]);

    if trim(GridSug.cells[15, GridSug.Row]) = '' then
      gradeTemp := '0'
    else
      gradeTemp := trim(GridSug.cells[15, GridSug.Row]);
    ValorSug := StrToFloat(vDadosIni.tirapontos(trim(GridSug.cells[7, GridSug.row]), 2));
    ValorTemp := ValorSug;
    vDadosIni.InputValoReal('Altera Sugestão de Compra', 'Valor da Sugestão', ValorSug);
    GridSug.cells[7, GridSug.row] := FloatToStr(ValorSug);

    ValorTot := ValorSug - ValorTemp;

    for i := 1 to GridSug.RowCount - 1 do
    begin
    	if (Trim(vGrupoProdTemp) = Trim(GridSug.cells[1, i])) and (Trim(vCodProdTemp) = Trim(GridSug.cells[2, i])) then
        if (Trim(GridSug.Cells[1, i]) <> '') and (Trim(GridSug.Cells[2, i]) <> '')
        	and (copy(GridSug.cells[1, GridSug.Row], 1, 3) <> 'CMP') and (copy(GridSug.cells[1, GridSug.Row], 1, 3) <> 'VND')
          and (Trim(GridSug.Cells[12, i]) = '') and (Trim(GridSug.Cells[13, i]) = '') then
        begin
        	ValorTotOld := StrToFloat(vDadosIni.tirapontos(trim(GridSug.cells[7, i]), 2));

          GridSug.cells[7, i] := FloatToStr(vDadosIni.IfThen(ValorTot > 0,
          	ValorTotOld + Abs(ValorTot),
            ValorTotOld - Abs(ValorTot)));
        end;
    end;

    if ValorTemp <> ValorSug then
    begin
      //      Result := false;
      if not IsEmpty then
      begin
        try
          if obBuscaSugestao = nil then
            obBuscaSugestao := TBuscasSugestao.create;
          obBuscaSugestao.buscas.Close;
          obBuscaSugestao.buscas.SQL.Text := ' UPDATE SUGESTAOCOMPRAIT ' +
            ' SET SUGESTAOCOMPRA = ' + vDadosIni.trocaVirgulaPorPonto(vDadosIni.tirapontos(trim(GridSug.cells[7, GridSug.Row]), 2)) +
            ' WHERE COD_SUGESTAO = ' + inttostr(dataSet.FieldByName('COD_SUGESTAO').AsInteger) +
            ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
            ' AND GRUPO_PROD = ' + trim(GridSug.cells[12, GridSug.Row]) +
            ' AND COD_PROD = ' + quotedstr(trim(GridSug.cells[13, GridSug.Row])) +
            ' AND COD_GRADE = ' + gradeTemp;
          obBuscaSugestao.buscas.ExecSQL;

          obBuscaSugestao.buscas.Close;
          obBuscaSugestao.buscas.SQL.Text := ' UPDATE SUGESTAOCOMPRAIT2 ' +
            ' SET SUGESTAOCOMPRA = ' + vDadosIni.trocaVirgulaPorPonto(vDadosIni.tirapontos(trim(GridSug.cells[7, GridSug.Row]), 2)) +
            ' WHERE COD_SUGESTAO = ' + inttostr(dataSet.FieldByName('COD_SUGESTAO').AsInteger) +
            ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa +
            ' AND COD_EMP_MULT = ' + trim(GridSug.Cells[14, GridSug.Row]) +
            ' AND GRUPO_PROD = ' + trim(GridSug.cells[12, GridSug.Row]) +
            ' AND COD_PROD = ' + quotedstr(trim(GridSug.cells[13, GridSug.Row])) +
            ' AND COD_GRADE = ' + gradeTemp;
          obBuscaSugestao.buscas.ExecSQL;
          
          if CommitaTransacao then
          begin
            Application.MessageBox(pchar('Sugestão de compra alterada com sucesso'), 'Informação', MB_ICONEXCLAMATION + MB_OK);
            //        Result := true;
          end
          else
            Application.MessageBox(pchar('Erro ao gravar Sugestão de Compra.' + chr(13) + 'A mesma não poderá ser salva.'), 'Informação', MB_ICONEXCLAMATION + MB_OK);
        except
          on e: exception do
          begin
            RollBackTransacao;
            //          Result := False;
                      //      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
            Application.MessageBox(pchar('Erro ao alterar Sugestão de Compra.' + chr(13) + 'A mesma não poderá ser salva.'), 'Informação', MB_ICONEXCLAMATION + MB_OK);
            registraErro(e.Message);
          end;
        end;
      end;
    end;
  end;
end;

procedure TSugestao.CadSugestao(TipoForm: integer);
begin
  try
    vDadosIni.abreStatusProcessamento('', 'Abrindo cadastro de Pedido de Compras');
    vDadosIni.vTipoForm := TipoForm;

    if dtmSugestaoCompras = nil then
      dtmSugestaoCompras := TdtmSugestaoCompras.Create(dtmSugestaoCompras);

    if FrmSugestaoCompra = nil then
    begin
      if TipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';
      Application.CreateForm(TFrmSugestaoCompra, FrmSugestaoCompra);
    end;
    
    if (TipoForm > 0) and (not FrmSugestaoCompra.Visible) then
      FrmSugestaoCompra.ShowModal
    else if (not FrmSugestaoCompra.Visible) then
      FrmSugestaoCompra.Show
    else if FrmSugestaoCompra.FormStyle = fsMDIChild then
      FrmSugestaoCompra.Show
    else
      FrmSugestaoCompra.ShowModal;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

constructor TSugestao.create;
begin
  if dtmSugestaoCompras = nil then
    dtmSugestaoCompras := TdtmSugestaoCompras.Create(dtmSugestaoCompras);
  DataSet := TClientDataSet(dtmSugestaoCompras.cdsSugestao);
  transacao := TIBTransaction(dtmSugestaoCompras.IBTransSugestao);
  Buscas := TIBQuery(dtmSugestaoCompras.qrBuscasSugestao);
  usodegrade := false;
  vestsegsug := 0;

  vEmpresasSugestao := TEmpresasSugestao.Create;
  vCustoPedSug := TCustoPedSug.Create;
  vEmpresasPedSug := TEmpresaPedSug.Create;
  vClientePedSug := TClientePedSug.create;
  vFornecPedSug := TFornecPedSug.Create;
  vVendedorPedSug := TVendedorPedSug.Create;
  vVendedorPedSug2 := TVendedorPedSug2.Create;
  vCondPagPedSug := TCondPagPedSug.Create;

  fTempListaCotacao := TClientDataSet.Create(nil);
  fTempListaCotacao.Close;
  fTempListaCotacao.FieldDefs.Clear;
  fTempListaCotacao.FieldDefs.Add('DESCRICAO_LISTA', ftString, 75, false);
  fTempListaCotacao.FieldDefs.Add('OBS', ftString, 80, false);
  fTempListaCotacao.FieldDefs.Add('SEL', ftString, 1, false);
  fTempListaCotacao.FieldDefs.Add('COD_EMP_MULT', ftInteger, 0, false);
  fTempListaCotacao.FieldDefs.Add('GRUPO_PROD', ftInteger, 0, false);
  fTempListaCotacao.FieldDefs.Add('COD_PROD', ftString, 6, false);
  fTempListaCotacao.FieldDefs.Add('COD_GRADE', ftInteger, 0, false);
  fTempListaCotacao.FieldDefs.Add('NUM_FAB_PROD', ftString, 20, false);
  fTempListaCotacao.FieldDefs.Add('QUANT_PROD', ftFloat, 0, false);
  fTempListaCotacao.FieldDefs.Add('DESCR_PROD', ftString, 75, false);
  fTempListaCotacao.FieldDefs.Add('VALOR', ftFloat, 0, false);
  fTempListaCotacao.FieldDefs.Add('NUM_PED', ftInteger, 0, false);
  fTempListaCotacao.FieldDefs.Add('NUM_TRANS', ftInteger, 0, false);
  fTempListaCotacao.FieldDefs.Add('COD_LISTA', ftInteger, 0, false);
  fTempListaCotacao.FieldDefs.Add('COD_EMP_TRANSF', ftInteger, 0, false);

  if fTempListaCotacao.Tag = 0 then
  try
    fTempListaCotacao.CreateDataSet;
    fTempListaCotacao.Tag := 1;
  	fTempListaCotacao.FieldByName('SEL').DisplayLabel := 'Sel';
    fTempListaCotacao.FieldByName('COD_EMP_MULT').DisplayLabel := 'Emp';
    fTempListaCotacao.FieldByName('GRUPO_PROD').DisplayLabel := 'Grupo Prod';
    fTempListaCotacao.FieldByName('COD_PROD').DisplayLabel := 'Cod Prod';
    fTempListaCotacao.FieldByName('COD_GRADE').DisplayLabel := 'Cod Grade';
    fTempListaCotacao.FieldByName('NUM_FAB_PROD').DisplayLabel := 'Num Fabr';
    fTempListaCotacao.FieldByName('COD_GRADE').DisplayLabel := 'Cod Grade';
    fTempListaCotacao.FieldByName('DESCR_PROD').DisplayLabel := 'Descr Prod';
    fTempListaCotacao.FieldByName('QUANT_PROD').DisplayLabel := 'Quant';
    fTempListaCotacao.FieldByName('NUM_PED').DisplayLabel := 'Num Pedido';
    fTempListaCotacao.FieldByName('NUM_TRANS').DisplayLabel := 'Num Transf';

    fTempListaCotacao.FieldByName('DESCRICAO_LISTA').Visible := false;
    fTempListaCotacao.FieldByName('OBS').Visible := false;
//    fTempListaCotacao.FieldByName('COD_GRADE').Visible := false;
    fTempListaCotacao.FieldByName('VALOR').Visible := false;
//    fTempListaCotacao.FieldByName('NUM_PED').Visible := false;
    fTempListaCotacao.FieldByName('COD_LISTA').Visible := false;
    fTempListaCotacao.FieldByName('COD_EMP_TRANSF').Visible := false;

    TFloatField(fTempListaCotacao.FieldByName('QUANT_PROD')).DisplayFormat := '##0.000';
    fTempListaCotacaoDtSource := TDataSource.Create(nil);
    fTempListaCotacaoDtSource.DataSet := fTempListaCotacao;
  except
  end;

  fTempListaCotacaoOld := TClientDataSet.Create(nil);
  fTempListaCotacaoOld.Close;
  fTempListaCotacaoOld.FieldDefs.Clear;
  fTempListaCotacaoOld.FieldDefs.Add('DESCRICAO_LISTA', ftString, 75, false);
  fTempListaCotacaoOld.FieldDefs.Add('OBS', ftString, 80, false);
  fTempListaCotacaoOld.FieldDefs.Add('SEL', ftString, 1, false);
  fTempListaCotacaoOld.FieldDefs.Add('COD_EMP_MULT', ftInteger, 0, false);
  fTempListaCotacaoOld.FieldDefs.Add('GRUPO_PROD', ftInteger, 0, false);
  fTempListaCotacaoOld.FieldDefs.Add('COD_PROD', ftString, 6, false);
  fTempListaCotacaoOld.FieldDefs.Add('COD_GRADE', ftInteger, 0, false);
  fTempListaCotacaoOld.FieldDefs.Add('NUM_FAB_PROD', ftString, 20, false);
  fTempListaCotacaoOld.FieldDefs.Add('QUANT_PROD', ftFloat, 0, false);
  fTempListaCotacaoOld.FieldDefs.Add('DESCR_PROD', ftString, 75, false);
  fTempListaCotacaoOld.FieldDefs.Add('VALOR', ftFloat, 0, false);
  fTempListaCotacaoOld.FieldDefs.Add('NUM_PED', ftInteger, 0, false);
  fTempListaCotacaoOld.FieldDefs.Add('NUM_TRANS', ftInteger, 0, false);
  fTempListaCotacaoOld.FieldDefs.Add('COD_LISTA', ftInteger, 0, false);
  fTempListaCotacaoOld.FieldDefs.Add('COD_EMP_TRANSF', ftInteger, 0, false);

  if fTempListaCotacaoOld.Tag = 0 then
  try
    fTempListaCotacaoOld.CreateDataSet;
    fTempListaCotacaoOld.Tag := 1;

    TFloatField(fTempListaCotacaoOld.FieldByName('QUANT_PROD')).DisplayFormat := '##0.000';
  except
  end;

  fTempDadosForm := TClientDataSet.Create(nil);
  fTempDadosForm.Close;
  fTempDadosForm.FieldDefs.Clear;
  fTempDadosForm.FieldDefs.Add('COD_EMPRESA', ftInteger, 0, false);
  fTempDadosForm.FieldDefs.Add('COD_CLIENTE', ftInteger, 0, false);
  fTempDadosForm.FieldDefs.Add('COD_VENDEDOR', ftInteger, 0, false);
  fTempDadosForm.FieldDefs.Add('COD_COND_PAG', ftInteger, 0, false);
  fTempDadosForm.FieldDefs.Add('TIPO_PED', ftString, 7, false);

  if fTempDadosForm.Tag = 0 then
  try
    fTempDadosForm.CreateDataSet;
    fTempDadosForm.Tag := 1;
  except
  end;
end;

procedure TSugestao.datasetAfterScrollCusto(DataSet: TDataSet);
begin
	if DataSet.IsEmpty then
  	exit;

	vCustoPedSug._abreCustoProd(
  	DataSet.FieldByName('GRUPO_PROD').AsInteger,
    DataSet.FieldByName('COD_PROD').AsString,
    DataSet.FieldByName('COD_EMP_MULT').AsInteger);
end;

procedure TSugestao.datasetAfterScrollEmpresa(DataSet: TDataSet);
begin
	if DataSet.IsEmpty then
  	exit;
    
	filtrarPorEmpresa(
    DataSet.FieldByName('COD_EMPRESA').AsInteger);
end;

procedure TSugestao.datasetAfterScrollEmpresaTrans(DataSet: TDataSet);
begin
	if DataSet.IsEmpty then
  	exit;
    
	filtrarPorEmpresaTransf(
  	DataSet.FieldByName('COD_EMP_TRANSF').AsInteger,
  	DataSet.FieldByName('COD_EMPRESA').AsInteger);
end;

procedure TSugestao.datasetAfterScrollFornecedor(DataSet: TDataSet);
begin
	if DataSet.IsEmpty then
  	exit;
    
	filtrarPorFornecedor(
  	DataSet.FieldByName('COD_CLIENTE').AsInteger,
    DataSet.FieldByName('COD_EMPRESA').AsInteger);
end;

procedure TSugestao.datasetAfterScrollProdutos(DataSet: TDataSet);
begin
	fTempListaCotacao.Filtered := false;
  fTempListaCotacao.Filter := '';
end;

function TSugestao.DeletarRegistro: boolean;
var
  numSug: integer;
begin
  result := false;

  if dataSet.IsEmpty then
  	exit;
    
  if not IsEmpty then
  begin
    numSug := dataSet.FieldByName('COD_SUGESTAO').asinteger;
    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente?', 'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
      if Delete then
        if Apply then
          if CommitaTransacao then
            result := true;
      if result then //auditoria sim ou não
        vDadosIni.GravaAuditoria('SUG022', 'EXCLUIR', 'SUCESSO', 'SUGESTAOCOMPRA', inttostr(numSug), buscas)
      else
        vDadosIni.GravaAuditoria('SUG022', 'EXCLUIR', 'FALHA', 'SUGESTAOCOMPRA', inttostr(numSug), buscas);
      Refresh;
    end;
  end
  else
    Application.MessageBox('A tabela está vazia.', 'Aviso', MB_OK + MB_ICONEXCLAMATION + MB_DEFBUTTON1);
end;

function TSugestao.DemandaMensal(codprod: string;grupoprod: integer;codempresa: Integer): boolean;
begin
  try
    result := true;
    if obBuscaSugestao = nil then
      obBuscaSugestao := TBuscasSugestao.create;
    obBuscaSugestao.buscas.Close;
    obBuscaSugestao.buscas.SQL.Text := 'select vmes AS Mes,vano AS Ano,sum(vqt) AS Quantidade ' +
      ' from demandapgeral4 ' +
      ' where cod_prod = ' + QuotedStr(trim(codprod)) +
      ' and grupo_prod = ' + inttostr(grupoprod) +
      ' and cod_empresa = ' + inttostr(codempresa)+
      ' and data_os_rq >= :vdata ' +
      ' and ativo=1 ' +
      ' group by vano,vmes';

    if vedtsug = 1 then
      fqtdMesSug := QtdMesEmpresa
    else
      fqtdMesSug := dataSet.FieldByName('QTDMESSUG').asinteger;
    obBuscaSugestao.buscas.ParamByName('vdata').AsDate := Date - (fqtdMesSug * 30); //StrToDate(dataIni);
    obBuscaSugestao.buscas.Prepare;
    obBuscaSugestao.buscas.Open;
  except
    result := false;
  end;
end;

destructor TSugestao.destroy;
begin
  Close;
  if Assigned(vEmpresasSugestao) then
	  FreeAndNil(vEmpresasSugestao);
  if Assigned(vCustoPedSug) then
  	FreeAndNil(vCustoPedSug);
  if Assigned(vEmpresasPedSug) then
  	FreeAndNil(vEmpresasPedSug);
  if Assigned(vClientePedSug) then
  	FreeAndNil(vClientePedSug);
  if Assigned(vFornecPedSug) then
  	FreeAndNil(vFornecPedSug);
  if Assigned(vVendedorPedSug) then
  	FreeAndNil(vVendedorPedSug);
  if Assigned(vVendedorPedSug2) then
  	FreeAndNil(vVendedorPedSug2);
  if Assigned(vCondPagPedSug) then
  	FreeAndNil(vCondPagPedSug);
  inherited;
end;

function TSugestao.EnviarParaLixeira: boolean;
var
  numSug: integer;
begin
  result := false;

  if dataSet.IsEmpty then
  	exit;
    
  if not IsEmpty then
  begin
    if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira?', 'Excluir Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
    begin
      numSug := dataSet.FieldByName('COD_SUGESTAO').asinteger;
      try
        if inherited edit then
        begin
          dataSet.FieldByName('ATIVO').asinteger := 0;
          inherited post;
          if Apply then
          begin
            if obBuscaSugestao = nil then
              obBuscaSugestao := TBuscasSugestao.create;
            obBuscaSugestao.buscas.Close;
            obBuscaSugestao.buscas.SQL.Text := ' UPDATE SUGESTAOCOMPRAIT ' +
              ' SET ATIVO = 0 ' +
              ' WHERE COD_SUGESTAO = ' + inttostr(dataSet.FieldByName('COD_SUGESTAO').AsInteger) +
              ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
            obBuscaSugestao.buscas.ExecSQL;

            obBuscaSugestao.buscas.Close;
            obBuscaSugestao.buscas.SQL.Text := ' UPDATE SUGESTAOCOMPRAIT2 ' +
              ' SET ATIVO = 0 ' +
              ' WHERE COD_SUGESTAO = ' + inttostr(dataSet.FieldByName('COD_SUGESTAO').AsInteger) +
              ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
            obBuscaSugestao.buscas.ExecSQL;
            
            if CommitaTransacao then
              result := true;
          end
          else
          begin
            Cancel;
            RollBackTransacao;
          end;
          if result then
          begin
            vDadosIni.GravaAuditoria('SUG022', 'ENVIAR LIXEIRA', 'SUCESSO', 'SUGESTAOCOMPRA', inttostr(numSug), buscas);
            Refresh;
          end
          else
            vDadosIni.GravaAuditoria('SUG022', 'ENVIAR LIXEIRA', 'FALHA', 'SUGESTAOCOMPRA', inttostr(numSug), buscas);
        end;
      except
        on e: exception do
        begin //auditoria não
          RollBackTransacao;
          Application.MessageBox(pchar(e.Message), 'Erro', MB_ICONERROR + MB_OK);
          registraErro(e.Message);
        end;
      end;
    end;
  end
  else
    Application.MessageBox('A tabela está vazia.', 'Aviso', MB_OK + MB_ICONEXCLAMATION + MB_DEFBUTTON1);
end;

function TSugestao.ExecutaSugestao(EstoqueSeguranca, TempoProcess, TempoEntrega, TempoAloc, Freq_Pedido,
  QtdMesSugestao: integer; usarGrade, somenteGrade, produtoMov: boolean;
  CheckListBoxTipv, CheckListBoxOrigem: TCheckListBox;
  vGrupoI, vGrupoF, vSGrupoI, vSGrupoF, vGradeI, vGradeF, vMarcaI, vMarcaF,
  classe_prod, clinv, clpreco, clpop, clqtv, clfrv, clatl: string; arredondavalor: boolean;
  excgrupo,excsubgrupo,excgrades,excmarcas,checkmostrarultvnd,checkdescred,checktransf: TCheckBox): boolean;
var
  vprcons, vQtdPedido, vQtdItemPedido, vQtdItemPedidoRec, {vpend,} vNOE, vEs, vCc, Sugc, Tranfc, Dsv, dmd, Media: real;
  vqtcmp, I, J, cnc, vcount: integer;
  juncao, sqlAdicional: string;
  vprconsEmp, vQtdPedidoEmp, vQtdItemPedidoEmp, vQtdItemPedidoRecEmp, vNOEEmp, vEsEmp, vCcEmp, SugcEmp, dmdEmp, MediaEmp: array of real;
  vtempo_entregaSubEmp, vte_sugEmp, vfreq_pedido, vestoque_seguranca: array of Integer;
  vEst_fEmp, vQtdItemVndEmp, vQtdItemVndAbertaEmp, qtdItemDevolvidoEmp, EstEmp, vqtperdEmp, vqtd_ped_prodEmp: array of double;
  vEstDispTrans, vTransf, vQtdeTransf: array of double;
  vCodEmpresas: array of Integer;
  vEmpresas: array of string;
  EstGer: double;
  vQtdPedidoGer, vQtdItemPedidoGer, vQtdItemPedidoRecGer, vNOEGer, SugcGer, EstDispTransfGer, MediaGer: real;
  vQtdItemVnd, vQtdItemVndAberta, vCustoMedio, vCustoMedioTemp, qtdItemDevolvido, Est,
  vsmgrade, qtdItemNFE, vCustoMedioTotal, vPME, vGE, vPMEGrupo, vGEGrupo, vqtperd: double;
  vte_sugGer: Integer;
  vte_sug: integer;
  vGrupoTemp: Integer;
  vCodProdTemp: string;
  vCodGradeTemp: integer;
  vCodEmpresaTemp: Integer;
  vCodEmpresa: string;
  vDataBanco: TDate;
  vExibirSug: boolean;
  vSugcTemp, vEstTemp: double;
  buscas2: TIBQuery;
  buscas3: TIBQuery;
  fTempGrupo: TClientDataSet;
  vqtdeReg: Integer;
  vSql: string;

  function RetornaDadosProduto(grupoprod: integer; codprod: string; codempresa: integer; usargrade: boolean; codgrade: Integer): boolean;
  var
  	buscasTmp: TIBQuery;
    J: Integer;
  begin
  	buscasTmp := TIBQuery.Create(Application);
  	buscasTmp.Database := buscas.Database;
	  buscasTmp.Transaction := buscas.Transaction;

  	for J := 0 to Length(vCodEmpresas) - 1 do
    begin
	  	vSql := ' select' +
        ' est.estoque est_f, ' +
        ' coalesce(tempo_entregasug, 0) tempo_entregasug, ' +
        ' coalesce(freq_pedido, 0) freq_pedido, ' +
        ' coalesce(est_seguranca, 0) est_seguranca, ' +
        ' coalesce(quant_ped_prod, 0) quant_ped_prod,' +
        ' coalesce(qtdeitensvnd.qtdeitemreqos, 0) qtdeitemreqos, ' +
				' coalesce(qtdeitensdev.qtdeitemdevolvido, 0) qtdeitemdevolvido, ' +
				' coalesce(qtdeitensperd.qtdeitemvndperd, 0) qtdeitemvndperd, ' +
        ' coalesce(qtdeitenspedido.qtdeitempedido, 0) qtdeitempedido, ' +
        ' coalesce(qtdeitenspedidorec.qtdeitempedidorec, 0) qtdeitempedidorec, ' +
        ' coalesce(similares.existesimilar, 0) existesimilar, ' +
        ' coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp from produtos pr ' +
        ' inner join empresa emp on emp.cod_empresa = pr.cod_empresa ' +
        ' left join getestoquedisponivel(pr.grupo_prod, pr.cod_prod, ' + vDadosIni.IfThen(usargrade, IntToStr(codgrade), '0') + ', ' +
        '		pr.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
        ' left join getqtdeitensvenda(pr.grupo_prod, pr.cod_prod, ' + vDadosIni.IfThen(usargrade, IntToStr(codgrade), '0') + ', ' +
        '		pr.cod_empresa, %s, ' +
        		QuotedStr(vdadosini.vTipoVendaOS) + ',' +
            QuotedStr(TipoVendaSelec) + ',' +
            QuotedStr(TipoOrigemSelec) + ') qtdeitensvnd on 1 = 1 ' +
        ' left join getqtdeitensdevolvidos(pr.grupo_prod, pr.cod_prod, ' + vDadosIni.IfThen(usargrade, IntToStr(codgrade), '0') + ', ' +
        '		pr.cod_empresa, %s) qtdeitensdev on 1 = 1 ' +
        ' left join getqtdeitensvendaperdida(pr.grupo_prod, pr.cod_prod, ' + vDadosIni.IfThen(usargrade, IntToStr(codgrade), '0') + ', ' +
        '		pr.cod_empresa, %s) qtdeitensperd on 1 = 1 ' +
        ' left join getqtdeitenspedido(pr.grupo_prod, pr.cod_prod, ' + vDadosIni.IfThen(usargrade, IntToStr(codgrade), '0') + ', ' +
        '		pr.cod_empresa) qtdeitenspedido on 1 = 1 ' +
        ' left join getqtdeitenspedidorec(pr.grupo_prod, pr.cod_prod, ' + vDadosIni.IfThen(usargrade, IntToStr(codgrade), '0') + ', ' +
        '	  pr.cod_empresa) qtdeitenspedidorec on 1 = 1 ';

      if not vDadosIni.vProdSimilar.vAgruparSimilar then
      	vSql := vSql + ' left join getprodutossimilar(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 '
      else if not vDadosIni.vProdSimilar.vSimilaresEntreSi then
      	vSql := vSql + ' left join getprodutossimilargrupo(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 '
      else
      	vSql := vSql + ' left join getprodutossimilargrupoentresi(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 ';

      vSql := vSql +
        ' where pr.grupo_prod = ' + IntToStr(grupoprod) +
        ' and pr.cod_prod = ' + QuotedStr(trim(codprod)) +
        ' and pr.cod_empresa in (' + IntToStr(vCodEmpresas[J]) + ') ' +
        ' and pr.ativo = 1 ';
      SqlOpen(vSql,
      	[date_fb(date - (QtdMesEmpresa * 30)),
      	 date_fb(date - (QtdMesEmpresa * 30)),
         date_fb(date - (QtdMesEmpresa * 30))],
        buscasTmp);

    	vEst_fEmp[J] := buscasTmp.FieldByName('est_f').AsFloat;
      vtempo_entregaSubEmp[J] := buscasTmp.FieldByName('tempo_entregasug').AsInteger;
      vfreq_pedido[J] := buscasTmp.FieldByName('freq_pedido').AsInteger;
      vestoque_seguranca[J] := buscasTmp.FieldByName('est_seguranca').AsInteger;
      vqtd_ped_prodEmp[J] := buscasTmp.FieldByName('quant_ped_prod').AsFloat;
      vQtdItemVndEmp[J] := buscasTmp.FieldByName('qtdeitemreqos').AsFloat;
      qtdItemDevolvidoEmp[J] := buscasTmp.FieldByName('qtdeitemdevolvido').AsFloat;
      vqtperdEmp[J] := buscasTmp.FieldByName('qtdeitemvndperd').AsFloat;
      vQtdItemPedidoEmp[J] := buscasTmp.FieldByName('qtdeitempedido').AsFloat;
      vQtdItemPedidoRecEmp[J] := buscasTmp.FieldByName('qtdeitempedidorec').AsFloat;
      if vQtdItemPedidoRecEmp[J] > vQtdItemPedidoEmp[J] then
        vQtdPedidoEmp[J] := 0
      else
        vQtdPedidoEmp[J] := vQtdItemPedidoEmp[J] - vQtdItemPedidoRecEmp[J];
  	end;

    buscasTmp.Close;
  end;
begin
  try
    result := true;

    buscas2 := TIBQuery.Create(Application);
  	buscas2.Database := buscas.Database;
	  buscas2.Transaction := buscas.Transaction;

    buscas3 := TIBQuery.Create(Application);
  	buscas3.Database := buscas.Database;
	  buscas3.Transaction := buscas.Transaction;

    QtdMesEmpresa     := QtdMesSugestao;
    TpProcessamento   := TempoProcess;
    TpEntrega         := TempoEntrega;
    TpAlocacao        := TempoAloc;
    FreqPedido        := Freq_Pedido;
    EstSeguracaPadrao := EstoqueSeguranca;

    lb := FrmSugestaoCompra.Label25;
    lb2 := FrmSugestaoCompra.lbProgressBar;
    ProgressBar := FrmSugestaoCompra.ProgressBar1;
    ProgressBar2 := FrmSugestaoCompra.ProgressBar2;
    GridSug := FrmSugestaoCompra.StGradS;
    i := 0;
    Sugc := 0;
    LimpaSugestao;
    //    GridSug.RowCount := 2;
    GridSug.Cells[0, 0] := 'ITEM';
    GridSug.ColWidths[0] := 70;
    GridSug.Cells[1, 0] := 'GR.';
    GridSug.ColWidths[1] := 35;
    GridSug.Cells[2, 0] := 'CODIGO';
    GridSug.ColWidths[2] := 70;
    GridSug.Cells[3, 0] := 'Nº FABR.';
    GridSug.ColWidths[3] := 70;
    GridSug.Cells[4, 0] := 'EST.AT.';
    GridSug.ColWidths[4] := 70;
    GridSug.Cells[5, 0] := 'MÉDIA MES';
    GridSug.ColWidths[5] := 70;
    GridSug.Cells[6, 0] := 'QT TRANSF';
    GridSug.ColWidths[6] := 70;
    GridSug.Cells[7, 0] := 'SUG.';
    GridSug.ColWidths[7] := 70;
    GridSug.Cells[8, 0] := 'CODIGO PROD CL';
    GridSug.ColWidths[8] := 250;
    GridSug.Cells[9, 0] := 'SELEC';
    GridSug.ColWidths[9] := 60;
    GridSug.Cells[10, 0] := 'QT PEND';
    GridSug.ColWidths[10] := 90;
    GridSug.Cells[11, 0] := 'DESCR PROD';
    GridSug.ColWidths[11] := 490;
    GridSug.Cells[12, 0] := 'GRUPO';
    GridSug.ColWidths[12] := 50;
    GridSug.Cells[13, 0] := 'PROD';
    GridSug.ColWidths[13] := 50;
    GridSug.Cells[14, 0] := 'EMP';
    GridSug.ColWidths[14] := 50;

    if usarGrade then
    begin
      usodegrade := true;
      GridSug.Cells[15, 0] := 'GRADE';
      GridSug.ColWidths[15] := 50;
      GridSug.Cells[16, 0] := 'DESCR GRADE 1';
      GridSug.ColWidths[16] := 250;
      GridSug.Cells[17, 0] := 'DESCR GRADE 2';
      GridSug.ColWidths[17] := 250;
    end
    else
    begin
    	GridSug.ColWidths[15] := 0;
      GridSug.ColWidths[16] := 0;
      GridSug.ColWidths[17] := 0;
    end;

    if checktransf.Checked then
    begin
      try
        vEmpresasSugestao.dataSet.DisableControls;
        vEmpresasSugestao.dataSet.Filtered := false;
        vEmpresasSugestao.dataSet.Filter := 'SEL = ''S'' ';
        vEmpresasSugestao.dataSet.Filtered := true;
        vEmpresasSugestao.IndexFieldNames := 'COD_EMPRESA';
        vEmpresasSugestao.dataSet.First;
        for J := 0 to vEmpresasSugestao.dataSet.RecordCount - 1 do
        begin
          SqlOpen(' select empresa.cod_empresa, empresa.identificacao_emp, empresa.cgc_emp, ' +
            ' case when (empresa_fisica.cod_empresa > 0) then 1 else 0 end banco_local from empresa ' +
            ' left join empresa_fisica on empresa_fisica.cod_empresa = empresa.cod_empresa ' +
            ' where empresa.cod_empresa = ' + IntToStr(vEmpresasSugestao.dataSet.FieldByName('COD_EMPRESA').AsInteger), buscas2);

          if buscas2.FieldByName('banco_local').AsInteger <= 0 then
          begin
            Application.MessageBox(PChar('Não é possível montar sugestão de compra.' + #13 + #13 +
              'EMPRESA ' + #13 +
              'Codigo: ' + IntToStr(buscas2.FieldByName('cod_empresa').AsInteger) + #13 +
              'Identificação: ' + trim(buscas2.FieldByName('identificacao_emp').AsString) + #13 +
              'CNPJ: ' + trim(buscas2.FieldByName('cgc_emp').AsString) + #13 + #13 +
              'O banco de dados da empresa acima deve estar no mesmo banco de dados da empresa logada, favor desmarcar opção exibir transferência.'),
              'Aviso', MB_OK +     MB_ICONEXCLAMATION + MB_DEFBUTTON1);
            Result := false;
            exit;
          end;

          vEmpresasSugestao.dataSet.Next;
        end;
      finally
      	vEmpresasSugestao.dataSet.Filtered := false;
      	vEmpresasSugestao.IndexFieldNames := 'COD_EMPRESA';
        vEmpresasSugestao.dataSet.EnableControls;
      end;
    end;

    GridSug.FixedCols := 1;
    if GridSug.RowCount > 1 then
	    GridSug.FixedRows := 1;

    SqlTipoVendaOrigemSelecionada(CheckListBoxTipv, CheckListBoxOrigem, 'pv');

    if somenteGrade then
      juncao := 'inner'
    else
      juncao := 'left';

    try
    	// Buscar empresas selecionadas
    	if not vDadosIni.vSugCompra.vMultiempresa then
      	vCodigosEmpresas := vDadosIni.codEmpresa
      else if vDadosIni.vSugCompra.vMultiempresa then
      begin
        vEmpresasSugestao.dataSet.Filtered := false;
        vEmpresasSugestao.dataSet.Filter := 'SEL = ''S'' ';
        vEmpresasSugestao.dataSet.Filtered := true;

        if vEmpresasSugestao.dataSet.IsEmpty then
        begin
          Application.MessageBox('Nenhuma empresa selecionada, favor verificar antes de continuar.', 'Atenção',
            MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
          exit;
        end;

        SetLength(vCodEmpresas, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vEmpresas, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vEst_fEmp, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vQtdPedidoEmp, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vQtdItemPedidoEmp, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vQtdItemPedidoRecEmp, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vprconsEmp, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vNOEEmp, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vEsEmp, vEmpresasSugestao.dataSet.RecordCount);
			  SetLength(vCcEmp, vEmpresasSugestao.dataSet.RecordCount);
			  SetLength(SugcEmp, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(dmdEmp, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vtempo_entregaSubEmp, vEmpresasSugestao.dataSet.RecordCount);
			  SetLength(vte_sugEmp, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vfreq_pedido, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(MediaEmp, vEmpresasSugestao.dataSet.RecordCount);
			  SetLength(vQtdItemVndEmp, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vQtdItemVndAbertaEmp, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(qtdItemDevolvidoEmp, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vqtd_ped_prodEmp, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vestoque_seguranca, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(EstEmp, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vqtperdEmp, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vEstDispTrans, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vTransf, vEmpresasSugestao.dataSet.RecordCount);
        SetLength(vQtdeTransf, vEmpresasSugestao.dataSet.RecordCount);

        vCodigosEmpresas := '';

        try
        	vEmpresasSugestao.dataSet.DisableControls;
          vEmpresasSugestao.dataSet.Filtered := false;
  	      vEmpresasSugestao.dataSet.Filter := 'SEL = ''S'' ';
	        vEmpresasSugestao.dataSet.Filtered := true;
          vEmpresasSugestao.IndexFieldNames := 'COD_EMPRESA';
          vEmpresasSugestao.dataSet.First;
          for J := 0 to vEmpresasSugestao.dataSet.RecordCount - 1 do
          begin
            vCodEmpresas[J] := vEmpresasSugestao.dataSet.FieldByName('COD_EMPRESA').AsInteger;
            vEmpresas[J] := vEmpresasSugestao.dataSet.FieldByName('IDENTIFICACAO_EMP').AsString;

            vEmpresasSugestao.dataSet.Next;
          end;
        finally
        	vEmpresasSugestao.dataSet.Filtered := false;
	      	vEmpresasSugestao.IndexFieldNames := 'COD_EMPRESA';
          vEmpresasSugestao.dataSet.EnableControls;
        end;

        try                                             
        	vEmpresasSugestao.dataSet.DisableControls;
          vEmpresasSugestao.dataSet.Filtered := false;
  	      vEmpresasSugestao.dataSet.Filter := 'SEL = ''S'' ';
	        vEmpresasSugestao.dataSet.Filtered := true;
          vEmpresasSugestao.IndexFieldNames := 'COD_EMPRESA';
          vEmpresasSugestao.dataSet.First;
          while not vEmpresasSugestao.dataSet.Eof do
          begin
            if trim(vCodigosEmpresas) = '' then
              vCodigosEmpresas := IntToStr(vEmpresasSugestao.dataSet.FieldByName('COD_EMPRESA').AsInteger)
            else
              vCodigosEmpresas := vCodigosEmpresas + ', ' + IntToStr(vEmpresasSugestao.dataSet.FieldByName('COD_EMPRESA').AsInteger);

            vEmpresasSugestao.dataSet.Next;
          end;
        finally
        	vEmpresasSugestao.dataSet.Filtered := false;
	      	vEmpresasSugestao.IndexFieldNames := 'COD_EMPRESA';
          vEmpresasSugestao.dataSet.EnableControls;
        end;
      end;

      ////////////////////////////////
      sqlAdicional := ' and (coalesce(pr.FORA_LINHA, ''N'') <> ''S'') ';
      //Verifica o grupo
      try
        strtoint(vGrupoI);
        strtoint(vGrupoF);
      except
        Application.MessageBox(Pchar('Grupo Inicial e Final devem ser vazios ou números inteiros' + chr(13) + 'Favor corrigir'), 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
        result := false;
        exit;
      end;

      if ((trim(vGrupoI) = '0') or (trim(vGrupoI) = '')) and ((trim(vGrupoF) <> '0') and (trim(vGrupoF) <> '')) then
      begin
        if excgrupo.Checked then
         sqlAdicional := sqlAdicional + ' and (not pr.GRUPO_PROD <= ' + vGrupoF+')'
        else
         sqlAdicional := sqlAdicional + ' and pr.GRUPO_PROD <= ' + vGrupoF;
      end
      else if ((trim(vGrupoI) <> '0') and (trim(vGrupoI) <> '')) and ((trim(vGrupoF) = '0') or (trim(vGrupoF) = '')) then
      begin
        if excgrupo.Checked then
         sqlAdicional := sqlAdicional + ' and (not pr.GRUPO_PROD >= ' + vGrupoI+')'
        else
         sqlAdicional := sqlAdicional + ' and pr.GRUPO_PROD >= ' + vGrupoI;
      end
      else if ((trim(vGrupoI) <> '0') and (trim(vGrupoI) <> '')) and ((trim(vGrupoF) <> '0') and (trim(vGrupoF) <> '')) then
        if excgrupo.Checked then
         sqlAdicional := sqlAdicional + ' and (not (pr.GRUPO_PROD >= ' + vGrupoI +
          ' and pr.GRUPO_PROD <= ' + vGrupoF+'))'
        else
         sqlAdicional := sqlAdicional + ' and pr.GRUPO_PROD >= ' + vGrupoI +
          ' and pr.GRUPO_PROD <= ' + vGrupoF;


      //Verifica o subgrupo
      try
        strtoint(vSGrupoI);
        strtoint(vSGrupoF);
      except
        Application.MessageBox(Pchar('SubGrupo Inicial e Final devem ser vazios ou números inteiros' + chr(13) + 'Favor corrigir'), 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
        result := false;
        exit;
      end;
      if ((trim(vSGrupoI) = '') or (trim(vSGrupoI) = '0')) and ((trim(vSGrupoF) <> '') and (trim(vSGrupoF) <> '0')) then
      begin
        if excsubgrupo.Checked then
         sqlAdicional := sqlAdicional + ' and not pr.SUB_G_PROD <= ' + vSGrupoF
        else
         sqlAdicional := sqlAdicional + ' and pr.SUB_G_PROD <= ' + vSGrupoF;
      end
      else if ((trim(vSGrupoI) <> '') and (trim(vSGrupoI) <> '0')) and ((trim(vSGrupoF) = '') or (trim(vSGrupoF) = '0')) then
      begin
        if excsubgrupo.Checked then
         sqlAdicional := sqlAdicional + ' and not pr.SUB_G_PROD >= ' + vSGrupoI
        else
         sqlAdicional := sqlAdicional + ' and pr.SUB_G_PROD >= ' + vSGrupoI;
      end
      else if ((trim(vSGrupoI) <> '') and (trim(vSGrupoI) <> '0')) and ((trim(vSGrupoF) <> '') and (trim(vSGrupoF) <> '0')) then
        if excsubgrupo.Checked then
         sqlAdicional := sqlAdicional + ' and (not (pr.SUB_G_PROD >= ' + vSGrupoI +
         ' and pr.SUB_G_PROD <= ' + vSGrupoF+'))'
        else
         sqlAdicional := sqlAdicional + ' and pr.SUB_G_PROD >= ' + vSGrupoI +
          ' and pr.SUB_G_PROD <= ' + vSGrupoF;

      //verifica a Grade
      if usarGrade then
      begin
        try
          strtoint(vGradeI);
          strtoint(vGradeF);
        except
          Application.MessageBox(Pchar('Grade Inicial e Final devem ser vazias ou números inteiros' + chr(13) + 'Favor corrigir'), 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
          result := false;
          exit;
        end;
        if ((trim(vGradeI) = '') or (trim(vGradeI) = '0')) and ((trim(vGradeF) <> '') and (trim(vGradeF) <> '0')) then
        begin
          if excgrades.Checked then
           sqlAdicional := sqlAdicional + ' and not gr.COD_GRADE <= ' + vGradeF
          else
           sqlAdicional := sqlAdicional + ' and gr.COD_GRADE <= ' + vGradeF;
        end
        else if ((trim(vGradeI) <> '') and (trim(vGradeI) <> '0')) and ((trim(vGradeF) = '') or (trim(vGradeF) = '0')) then
        begin
          if excgrades.Checked then
           sqlAdicional := sqlAdicional + ' and not gr.COD_GRADE >= ' + vGradeI
          else
           sqlAdicional := sqlAdicional + ' and gr.COD_GRADE >= ' + vGradeI;
        end
        else if ((trim(vGradeI) <> '') and (trim(vGradeI) <> '0')) and ((trim(vGradeF) <> '') and (trim(vGradeF) <> '0')) then
          if excgrades.Checked then
            sqlAdicional := sqlAdicional + ' and (not (gr.COD_GRADE >= ' + vGradeI +
            ' and gr.COD_GRADE <= ' + vGradeF+'))'
          else
           sqlAdicional := sqlAdicional + ' and gr.COD_GRADE >= ' + vGradeI +
            ' and gr.COD_GRADE <= ' + vGradeF;
      end;

      //Verifica marca
      try
        strtoint(vMarcaI);
        strtoint(vMarcaF);
      except
        Application.MessageBox(Pchar('Marca deve ser vazia ou número inteiro' + chr(13) + 'Favor corrigir'), 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
        result := false;
        exit;
      end;
      if ((trim(vMarcaI) = '') or (trim(vMarcaI) = '0')) and ((trim(vMarcaF) <> '') and (trim(vMarcaF) <> '0')) then
      begin
        if excmarcas.Checked then
         sqlAdicional := sqlAdicional + ' and not pr.COD_MARCA <= ' + vMarcaF
        else
         sqlAdicional := sqlAdicional + ' and pr.COD_MARCA <= ' + vMarcaF;
      end
      else if ((trim(vMarcaI) <> '') and (trim(vMarcaI) <> '0')) and ((trim(vMarcaF) = '') or (trim(vMarcaF) = '0')) then
      begin
        if excmarcas.Checked then
         sqlAdicional := sqlAdicional + ' and not pr.COD_MARCA >= ' + vMarcaI
        else
         sqlAdicional := sqlAdicional + ' and pr.COD_MARCA >= ' + vMarcaI;
      end
      else if ((trim(vMarcaI) <> '') and (trim(vMarcaI) <> '0')) and ((trim(vMarcaF) <> '') and (trim(vMarcaF) <> '0')) then
        if excmarcas.Checked then
          sqlAdicional := sqlAdicional + ' and (not (pr.COD_MARCA >= ' + vMarcaI +
          ' and pr.COD_MARCA <= ' + vMarcaF+'))'
        else
         sqlAdicional := sqlAdicional + ' and pr.COD_MARCA >= ' + vMarcaI +
          ' and pr.COD_MARCA <= ' + vMarcaF;

      //verifica as classes dos produtos
      if classe_prod <> '' then
        sqlAdicional := sqlAdicional + ' and pr.CLASSE_PROD = ' + quotedstr(classe_prod);
      if clinv <> '' then
        sqlAdicional := sqlAdicional + ' and pr.CLINV = ' + quotedstr(clinv);
      if clpreco <> '' then
        sqlAdicional := sqlAdicional + ' and pr.CLPRECO = ' + quotedstr(clpreco);
      if clpop <> '' then
        sqlAdicional := sqlAdicional + ' and pr.CLPOP = ' + quotedstr(clpop);
      if clqtv <> '' then
        sqlAdicional := sqlAdicional + ' and pr.CLQTV = ' + quotedstr(clqtv);
      if clfrv <> '' then
        sqlAdicional := sqlAdicional + ' and pr.CLFRV = ' + quotedstr(clfrv);
      if clatl <> '' then
        sqlAdicional := sqlAdicional + ' and pr.CLATL = ' + quotedstr(clatl);

      vDataBanco := vDadosIni.getDataBanco(buscas);

      fTempGrupo := TClientDataSet.Create(nil);
		  fTempGrupo.Close;
	  	fTempGrupo.FieldDefs.Clear;
  		fTempGrupo.FieldDefs.Add('GRUPO_PROD', ftInteger, 0, false);
      if fTempGrupo.Tag = 0 then
      try
        fTempGrupo.CreateDataSet;
        fTempGrupo.Tag := 1;
      finally
      end;

      buscas.Close;
      if usarGrade then
      begin
      	buscas.sql.text := ' select distinct pr.GRUPO_PROD, count(*) QTDE from produtos pr ' +
        	juncao + ' join cod_grade_prod GR on GR.cod_empresa = PR.cod_empresa and ' +
  		    ' GR.grupo_prod = PR.grupo_prod and GR.cod_prod = PR.cod_prod ' +
      	  juncao + ' join GRADE G on G.cod_grade = GR.cod_grade and G.cod_empresa = GR.cod_empresa ' +
          '	where pr.cod_empresa in (' + vCodigosEmpresas + ') ' +
          ' and pr.ativo = 1 ' + sqlAdicional;
        buscas.SQL.Text := buscas.SQL.Text + sqlAdicional;
        buscas.SQL.Text := buscas.SQL.Text + ' group by 1 ';
        buscas.SQL.Text := buscas.SQL.Text + ' order by pr.grupo_prod ';
      end
      else
      begin
        buscas.sql.text := ' select distinct pr.GRUPO_PROD, count(*) QTDE from produtos pr ' +
          '	where pr.cod_empresa in (' + vCodigosEmpresas + ') ' +
          ' and pr.ativo = 1 ' + sqlAdicional;
        buscas.SQL.Text := buscas.SQL.Text + sqlAdicional;
        buscas.SQL.Text := buscas.SQL.Text + ' group by 1 ';
        buscas.SQL.Text := buscas.SQL.Text + ' order by pr.grupo_prod ';
      end;
      buscas.Open;
      buscas.FetchAll;

      vqtdeReg := 0;
      buscas.First;
      while not buscas.Eof do
      begin
        fTempGrupo.Insert;
        fTempGrupo.FieldByName('GRUPO_PROD').AsInteger := buscas.FieldByName('GRUPO_PROD').AsInteger;
        fTempGrupo.Post;

        vqtdeReg := vqtdeReg + buscas.FieldByName('QTDE').AsInteger;

      	buscas.Next;
      end;
      fTempGrupo.IndexFieldNames := 'GRUPO_PROD';

      ProgressBar.max := vqtdeReg;
      ProgressBar2.max := vqtdeReg;
      ProgressBar.Position := 0;
      ProgressBar2.Position := 0;
      lb.Caption := 'Produto Analizado:';
      lb2.Caption := 'Produto Analizado:';

      fTempGrupo.First;
      while not fTempGrupo.Eof do
      begin
        if usarGrade then
        begin
          if produtoMov then
          begin
            vSql := ' SELECT PR.GRUPO_PROD, PR.COD_PROD, PR.COD_EMPRESA, ' +
              ' PR.DESCR_PROD, pr.EST_F, pr.PREC_CUS_PROD, pr.PREC_CUSM_PROD, ' +
              ' pr.EST_R, pr.QUANT_PED_PROD, pr.QUANT_RET_PROD, pr.QCONF_PROD, ' +
              ' pr.quant_Tr_prod, pr.QTDEMB, pr.NUM_FAB_PROD, pr.CLASSE_PROD, ' +
              ' pr.CLINV, pr.CLPOP, pr.CLFRV, pr.CLATL, pr.CLQTV, pr.CLPRECO, pr.EMB_PROD, ' +
              ' pr.FREQ_PEDIDO, pr.EST_SEGURANCA, g.DESCRICAO, g.DESCRICAO1, g.COD_GRADE,' +
              ' pr.TEMPO_ENTREGASUG, pr.DESCR_PROD_RED, ' +
              ' est.ESTOQUE, ' +
              ' coalesce(qtdeitensvnd.qtdeitemreqos, 0) qtdeitemreqos, ' +
              ' coalesce(qtdeitensdev.qtdeitemdevolvido, 0) qtdeitemdevolvido, ' +
              ' coalesce(qtdeitensperd.qtdeitemvndperd, 0) qtdeitemvndperd, ' +
              ' coalesce(qtdeitenspedido.qtdeitempedido, 0) qtdeitempedido, ' +
              ' coalesce(qtdeitenspedidorec.qtdeitempedidorec, 0) qtdeitempedidorec, ' +
              ' coalesce(similares.existesimilar, 0) existesimilar, ' +
              ' coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp from produtos pr ' +
              ' inner join empresa emp on emp.cod_empresa = pr.cod_empresa ' +
              juncao + ' join cod_grade_prod GR on GR.cod_empresa = PR.cod_empresa and ' +
              ' GR.grupo_prod = PR.grupo_prod and GR.cod_prod = PR.cod_prod ' +
              juncao + ' join GRADE G on G.cod_grade = GR.cod_grade and G.cod_empresa = GR.cod_empresa ' +
              ' left join getestoquedisponivel(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
              ' left join getqtdeitensvenda(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa, %s, ' +
                  QuotedStr(vdadosini.vTipoVendaOS) + ',' +
                  QuotedStr(TipoVendaSelec) + ',' +
                  QuotedStr(TipoOrigemSelec) + ') qtdeitensvnd on 1 = 1 ' +
              ' left join getqtdeitensdevolvidos(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa, %s) qtdeitensdev on 1 = 1 ' +
              ' left join getqtdeitensvendaperdida(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa, %s) qtdeitensperd on 1 = 1 ' +
              ' left join getqtdeitenspedido(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa) qtdeitenspedido on 1 = 1 ' +
              ' left join getqtdeitenspedidorec(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa) qtdeitenspedidorec on 1 = 1 ';
              
            if not vDadosIni.vProdSimilar.vAgruparSimilar then
              vSql := vSql + ' left join getprodutossimilar(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 '
            else if not vDadosIni.vProdSimilar.vSimilaresEntreSi then
              vSql := vSql + ' left join getprodutossimilargrupo(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 '
            else
              vSql := vSql + ' left join getprodutossimilargrupoentresi(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 ';

            vSql := vSql +
              ' where pr.ativo = 1 ' +
              ' and pr.cod_empresa in (' + vCodigosEmpresas + ') ' +
              ' and ((( select count(pvp.cod_prod) from pedvenda_prod pvp ' +
              ' where (pvp.cod_grade = gr.cod_grade or (pvp.cod_grade=0)) and pvp.grupo_prod = pr.grupo_prod and ' +
              ' pvp.cod_prod = pr.cod_prod and pvp.cod_empresa = pr.cod_empresa and pvp.ativo=1) >=1) ' +
              ' or ' +
              ' ((select count(inf.cod_prod) from item_nf_entrada inf ' +
              juncao + ' join cod_grade_prod_compra cgpc on inf.num_nota_nfe = cgpc.num_nota_nfe and inf.grupo_prod = cgpc.grupo_prod ' +
              ' and inf.cod_prod = cgpc.cod_prod and inf.cod_empresa = cgpc.cod_empresa ' +
              ' where (cgpc.cod_grade = gr.cod_grade or (cgpc.cod_grade is null)) ' +
              ' and inf.grupo_prod = pr.grupo_prod ' +
              ' and inf.cod_prod = pr.cod_prod ' +
              ' and inf.cod_empresa = pr.cod_empresa ' +
              ' and inf.ativo = 1) >= 1) ' +
              ' or ((select count(nfit.cod_prod) from notafiscal_item nfit ' +
              juncao + ' join cod_grade_prod_compra cgpc on nfit.cod_nf = cgpc.num_nota_nfe and nfit.grupo_prod = cgpc.grupo_prod ' +
              ' and nfit.cod_prod = cgpc.cod_prod and nfit.cod_empresa = cgpc.cod_empresa ' +
              ' where (cgpc.cod_grade = gr.cod_grade or (cgpc.cod_grade is null)) ' +
              ' and nfit.grupo_prod = pr.grupo_prod and nfit.cod_prod = pr.cod_prod and nfit.cod_empresa = pr.cod_empresa and nfit.ativo = 1) >= 1))' +
              ' or ' +
              ' (pr.est_f > 0 ' +
              ' and pr.cod_empresa in (' + vCodigosEmpresas + ') )';
          end
          else
          begin
            vSql := ' SELECT pr.GRUPO_PROD, pr.COD_PROD, pr.COD_EMPRESA, ' +
              ' pr.DESCR_PROD, pr.EST_F, pr.PREC_CUS_PROD, pr.PREC_CUSM_PROD, ' +
              ' pr.EST_R, pr.QUANT_PED_PROD, pr.QUANT_RET_PROD, pr.QCONF_PROD,' +
              ' pr.QUANT_TR_PROD, pr.QTDEMB, pr.NUM_FAB_PROD, pr.CLASSE_PROD,' +
              ' pr.CLINV, pr.CLPOP, pr.CLFRV, pr.CLATL, pr.CLQTV, pr.CLPRECO, pr.EMB_PROD,' +
              ' pr.FREQ_PEDIDO, pr.EST_SEGURANCA, g.DESCRICAO, g.DESCRICAO1, g.COD_GRADE, ' +
              ' pr.TEMPO_ENTREGASUG, pr.DESCR_PROD_RED, ' +
              ' est.ESTOQUE, ' +
              ' coalesce(qtdeitensvnd.qtdeitemreqos, 0) qtdeitemreqos, ' +
              ' coalesce(qtdeitensdev.qtdeitemdevolvido, 0) qtdeitemdevolvido, ' +
              ' coalesce(qtdeitensperd.qtdeitemvndperd, 0) qtdeitemvndperd, ' +
              ' coalesce(qtdeitenspedido.qtdeitempedido, 0) qtdeitempedido, ' +
              ' coalesce(qtdeitenspedidorec.qtdeitempedidorec, 0) qtdeitempedidorec, ' +
              ' coalesce(similares.existesimilar, 0) existesimilar, ' +
              ' coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp from produtos pr ' +
              ' inner join empresa emp on emp.cod_empresa = pr.cod_empresa ' +
              juncao + ' JOIN cod_grade_prod GR ON ' +
              ' GR.grupo_prod = PR.grupo_prod AND GR.cod_prod = PR.cod_prod AND GR.cod_empresa = PR.cod_empresa ' +
              juncao + ' JOIN GRADE G ON G.cod_grade = GR.cod_grade AND G.cod_empresa = GR.cod_empresa ' +
              ' left join getestoquedisponivel(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
              ' left join getqtdeitensvenda(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa, %s, ' +
                  QuotedStr(vdadosini.vTipoVendaOS) + ',' +
                  QuotedStr(TipoVendaSelec) + ',' +
                  QuotedStr(TipoOrigemSelec) + ') qtdeitensvnd on 1 = 1 ' +
              ' left join getqtdeitensdevolvidos(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa, %s) qtdeitensdev on 1 = 1 ' +
              ' left join getqtdeitensvendaperdida(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa, %s) qtdeitensperd on 1 = 1 ' +
              ' left join getqtdeitenspedido(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa) qtdeitenspedido on 1 = 1 ' +
              ' left join getqtdeitenspedidorec(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa) qtdeitenspedidorec on 1 = 1 ';

            if not vDadosIni.vProdSimilar.vAgruparSimilar then
              vSql := vSql + ' left join getprodutossimilar(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 '
            else if not vDadosIni.vProdSimilar.vSimilaresEntreSi then
              vSql := vSql + ' left join getprodutossimilargrupo(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 '
            else
              vSql := vSql + ' left join getprodutossimilargrupoentresi(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 ';

            vSql := vSql +
              ' where pr.ativo = 1 ' +
              ' and pr.cod_empresa in (' + vCodigosEmpresas + ') ';
          end;
        end
        else
        begin
          if produtoMov then
          begin
            vSql := ' select pr.GRUPO_PROD, pr.COD_PROD, pr.COD_EMPRESA, ' +
              ' pr.DESCR_PROD, pr.EST_F, pr.PREC_CUS_PROD, pr.PREC_CUSM_PROD, ' +
              ' pr.EST_R, pr.QUANT_PED_PROD, pr.QUANT_RET_PROD, pr.QCONF_PROD,' +
              ' pr.QUANT_TR_PROD, pr.QTDEMB, pr.NUM_FAB_PROD, pr.CLASSE_PROD,' +
              ' pr.CLINV, pr.CLPOP, pr.CLFRV, pr.CLATL, pr.CLQTV, pr.CLPRECO, pr.EMB_PROD,' +
              ' pr.FREQ_PEDIDO, pr.EST_SEGURANCA, ''SEM GRADE'' DESCRICAO, ''SEM GRADE'' DESCRICAO1, 0 COD_GRADE,' +
              ' pr.TEMPO_ENTREGASUG, pr.DESCR_PROD_RED, ' +
              ' est.ESTOQUE, ' +
              ' coalesce(qtdeitensvnd.qtdeitemreqos, 0) qtdeitemreqos, ' +
              ' coalesce(qtdeitensdev.qtdeitemdevolvido, 0) qtdeitemdevolvido, ' +
              ' coalesce(qtdeitensperd.qtdeitemvndperd, 0) qtdeitemvndperd, ' +
              ' coalesce(qtdeitenspedido.qtdeitempedido, 0) qtdeitempedido, ' +
              ' coalesce(qtdeitenspedidorec.qtdeitempedidorec, 0) qtdeitempedidorec, ' +
              ' coalesce(similares.existesimilar, 0) existesimilar, ' +
              ' coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp from produtos pr ' +
              ' inner join empresa emp on emp.cod_empresa = pr.cod_empresa ' +
              ' left join getestoquedisponivel(PR.GRUPO_PROD, PR.COD_PROD, 0, PR.COD_EMPRESA, 0, '''', 0, 0) est on 1 = 1 ' +
              ' left join getqtdeitensvenda(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, %s, ' +
                  QuotedStr(vdadosini.vTipoVendaOS) + ',' +
                  QuotedStr(TipoVendaSelec) + ',' +
                  QuotedStr(TipoOrigemSelec) + ') qtdeitensvnd on 1 = 1 ' +
              ' left join getqtdeitensdevolvidos(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, %s) qtdeitensdev on 1 = 1 ' +
              ' left join getqtdeitensvendaperdida(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, %s) qtdeitensperd on 1 = 1 ' +
              ' left join getqtdeitenspedido(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa) qtdeitenspedido on 1 = 1 ' +
              ' left join getqtdeitenspedidorec(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa) qtdeitenspedidorec on 1 = 1 ';

            if not vDadosIni.vProdSimilar.vAgruparSimilar then
              vSql := vSql + ' left join getprodutossimilar(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 '
            else if not vDadosIni.vProdSimilar.vSimilaresEntreSi then
              vSql := vSql + ' left join getprodutossimilargrupo(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 '
            else
              vSql := vSql + ' left join getprodutossimilargrupoentresi(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 ';

            vSql := vSql +
              ' where pr.cod_empresa in (' + vCodigosEmpresas + ') ' +
              ' and pr.ativo = 1 ' +
              ' and ((((select count(cod_prod) from pedvenda_prod pvp ' +
              ' where pvp.grupo_prod = pr.grupo_prod ' +
              ' and pvp.cod_prod = pr.cod_prod ' +
              ' and pvp.cod_empresa = pr.cod_empresa ' +
              ' and pvp.ativo = 1) >= 1) ' +
              ' or ' +
              ' ((select count(inf.cod_prod) from item_nf_entrada inf ' +
              ' where inf.grupo_prod = pr.grupo_prod ' +
              ' and inf.cod_prod = pr.cod_prod ' +
              ' and inf.cod_empresa = pr.cod_empresa ' +
              ' and inf.ativo = 1) >= 1) ' +
              ' or ' +
              ' ((select count(nfit.cod_prod) from notafiscal_item nfit ' +
              ' inner join notafiscal nf on nf.cod_nf = nfit.cod_nf and nf.cod_empresa = nfit.cod_empresa ' +
              ' where nf.natureza_nf = ''E'' ' +
              ' and nfit.grupo_prod = pr.grupo_prod ' +
              ' and nfit.cod_prod = pr.cod_prod ' +
              ' and nfit.cod_empresa = pr.cod_empresa ' +
              ' and nfit.ativo=1) >= 1))) ' +
              ' or (pr.est_f > 0 ' +
              ' and pr.cod_empresa in (' + vCodigosEmpresas + ') ) ';
          end
          else
          begin
            vSql := ' select pr.GRUPO_PROD, pr.COD_PROD, pr.COD_EMPRESA, ' +
              ' pr.DESCR_PROD, pr.EST_F, pr.PREC_CUS_PROD, pr.PREC_CUSM_PROD, ' +
              ' pr.EST_R, pr.QUANT_PED_PROD, pr.QUANT_RET_PROD, pr.QCONF_PROD,' +
              ' pr.QUANT_TR_PROD, pr.QTDEMB, pr.NUM_FAB_PROD, pr.CLASSE_PROD,' +
              ' pr.CLINV, pr.CLPOP, pr.CLFRV, pr.CLATL, pr.CLQTV, pr.CLPRECO, pr.EMB_PROD,' +
              ' pr.FREQ_PEDIDO, pr.EST_SEGURANCA, ''SEM GRADE'' DESCRICAO, ''SEM GRADE'' DESCRICAO1, 0 COD_GRADE, ' +
              ' pr.TEMPO_ENTREGASUG, pr.DESCR_PROD_RED, ' +
              ' est.ESTOQUE, ' +
              ' coalesce(qtdeitensvnd.qtdeitemreqos, 0) qtdeitemreqos, ' +
              ' coalesce(qtdeitensdev.qtdeitemdevolvido, 0) qtdeitemdevolvido, ' +
              ' coalesce(qtdeitensperd.qtdeitemvndperd, 0) qtdeitemvndperd, ' +
              ' coalesce(qtdeitenspedido.qtdeitempedido, 0) qtdeitempedido, ' +
              ' coalesce(qtdeitenspedidorec.qtdeitempedidorec, 0) qtdeitempedidorec, ' +
              ' coalesce(similares.existesimilar, 0) existesimilar, ' +
              ' coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp from produtos pr ' +
              ' inner join empresa emp on emp.cod_empresa = pr.cod_empresa ' +
              ' left join getestoquedisponivel(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
              ' left join getqtdeitensvenda(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, %s, ' +
                  QuotedStr(vdadosini.vTipoVendaOS) + ',' +
                  QuotedStr(TipoVendaSelec) + ',' +
                  QuotedStr(TipoOrigemSelec) + ') qtdeitensvnd on 1 = 1 ' +
              ' left join getqtdeitensdevolvidos(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, %s) qtdeitensdev on 1 = 1 ' +
              ' left join getqtdeitensvendaperdida(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, %s) qtdeitensperd on 1 = 1 ' +
              ' left join getqtdeitenspedido(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa) qtdeitenspedido on 1 = 1 ' +
              ' left join getqtdeitenspedidorec(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa) qtdeitenspedidorec on 1 = 1 ';

            if not vDadosIni.vProdSimilar.vAgruparSimilar then
              vSql := vSql + ' left join getprodutossimilar(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 '
            else if not vDadosIni.vProdSimilar.vSimilaresEntreSi then
              vSql := vSql + ' left join getprodutossimilargrupo(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 '
            else
              vSql := vSql + ' left join getprodutossimilargrupoentresi(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 ';

          	vSql := vSql +
              ' where pr.cod_empresa in (' + vCodigosEmpresas + ') ' +
              ' and pr.ativo = 1 ';
          end;
        end;

//        ProgressBar.max := vqtdeReg;
//        ProgressBar2.max := vqtdeReg;
//        ProgressBar.Position := 0;
//        ProgressBar2.Position := 0;

        if sqladicional <> '' then
        begin
          if usarGrade then
          begin
            vSql := ' select pr.GRUPO_PROD, pr.COD_PROD, pr.COD_EMPRESA, ' +
              ' pr.DESCR_PROD, pr.EST_F, pr.PREC_CUS_PROD, pr.PREC_CUSM_PROD, ' +
              ' pr.EST_R, pr.QUANT_PED_PROD, pr.QUANT_RET_PROD, pr.QCONF_PROD,' +
              ' pr.QUANT_TR_PROD, pr.QTDEMB, pr.NUM_FAB_PROD, pr.CLASSE_PROD,' +
              ' pr.CLINV, pr.CLPOP, pr.CLFRV, pr.CLATL, pr.CLQTV, pr.CLPRECO, pr.EMB_PROD,' +
              ' pr.FREQ_PEDIDO, pr.EST_SEGURANCA, ' +
              ' coalesce(g.DESCRICAO, ''SEM GRADE'') DESCRICAO, ' +
              ' coalesce(g.DESCRICAO1, ''SEM GRADE'') DESCRICAO1, ' +
              ' coalesce(g.COD_GRADE, 0) COD_GRADE, ' +
              ' pr.TEMPO_ENTREGASUG, pr.DESCR_PROD_RED, ' +
              ' est.ESTOQUE, ' +
              ' coalesce(qtdeitensvnd.qtdeitemreqos, 0) qtdeitemreqos, ' +
              ' coalesce(qtdeitensdev.qtdeitemdevolvido, 0) qtdeitemdevolvido, ' +
              ' coalesce(qtdeitensperd.qtdeitemvndperd, 0) qtdeitemvndperd, ' +
              ' coalesce(qtdeitenspedido.qtdeitempedido, 0) qtdeitempedido, ' +
              ' coalesce(qtdeitenspedidorec.qtdeitempedidorec, 0) qtdeitempedidorec, ' +
              ' coalesce(similares.existesimilar, 0) existesimilar, ' +
              ' coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp from produtos pr ' +
              ' inner join empresa emp on emp.cod_empresa = pr.cod_empresa ' +
              juncao + ' JOIN cod_grade_prod GR ON GR.cod_empresa = PR.cod_empresa AND' +
              ' GR.grupo_prod = PR.grupo_prod AND GR.cod_prod = PR.cod_prod ' +
              juncao + ' JOIN GRADE G ON G.cod_grade = GR.cod_grade AND G.cod_empresa = GR.cod_empresa ' +
              ' left join getestoquedisponivel(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa, 0, '''', 0, 0) est on 1 = 1 ' +
              ' left join getqtdeitensvenda(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa, %s, ' +
                  QuotedStr(vdadosini.vTipoVendaOS) + ',' +
                  QuotedStr(TipoVendaSelec) + ',' +
                  QuotedStr(TipoOrigemSelec) + ') qtdeitensvnd on 1 = 1 ' +
              ' left join getqtdeitensdevolvidos(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa, %s) qtdeitensdev on 1 = 1 ' +
              ' left join getqtdeitensvendaperdida(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa, %s) qtdeitensperd on 1 = 1 ' +
              ' left join getqtdeitenspedido(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa) qtdeitenspedido on 1 = 1 ' +
              ' left join getqtdeitenspedidorec(pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa) qtdeitenspedidorec on 1 = 1 ';

            if not vDadosIni.vProdSimilar.vAgruparSimilar then
              vSql := vSql + ' left join getprodutossimilar(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 '
            else if not vDadosIni.vProdSimilar.vSimilaresEntreSi then
              vSql := vSql + ' left join getprodutossimilargrupo(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 '
            else
              vSql := vSql + ' left join getprodutossimilargrupoentresi(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 ';

            vSql := vSql +
              ' where pr.ativo = 1 ' +
              ' and pr.cod_empresa in (' + vCodigosEmpresas + ') ';
          end
          else
          begin
            vSql := ' select pr.GRUPO_PROD, pr.COD_PROD, pr.COD_EMPRESA, ' +
              ' pr.DESCR_PROD, pr.EST_F, pr.PREC_CUS_PROD, pr.PREC_CUSM_PROD, ' +
              ' pr.EST_R, pr.QUANT_PED_PROD, pr.QUANT_RET_PROD, pr.QCONF_PROD,' +
              ' pr.QUANT_TR_PROD, pr.QTDEMB, pr.NUM_FAB_PROD, pr.CLASSE_PROD,' +
              ' pr.CLINV, pr.CLPOP, pr.CLFRV, pr.CLATL, pr.CLQTV, pr.CLPRECO, pr.EMB_PROD,' +
              ' pr.FREQ_PEDIDO, pr.EST_SEGURANCA, ''SEM GRADE'' DESCRICAO, ''SEM GRADE'' DESCRICAO1, 0 COD_GRADE, ' +
              ' pr.TEMPO_ENTREGASUG, PR.DESCR_PROD_RED, ' +
              ' est.ESTOQUE, ' +
              ' coalesce(qtdeitensvnd.qtdeitemreqos, 0) qtdeitemreqos, ' +
              ' coalesce(qtdeitensdev.qtdeitemdevolvido, 0) qtdeitemdevolvido, ' +
              ' coalesce(qtdeitensperd.qtdeitemvndperd, 0) qtdeitemvndperd, ' +
              ' coalesce(qtdeitenspedido.qtdeitempedido, 0) qtdeitempedido, ' +
              ' coalesce(qtdeitenspedidorec.qtdeitempedidorec, 0) qtdeitempedidorec, ' +
              ' coalesce(similares.existesimilar, 0) existesimilar, ' +
              ' coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp from produtos pr ' +
              ' inner join empresa emp on emp.cod_empresa = pr.cod_empresa ' +
              ' left join getestoquedisponivel(PR.GRUPO_PROD, PR.COD_PROD, 0, PR.COD_EMPRESA, 0, '''', 0, 0) est on 1 = 1 ' +
              ' left join getqtdeitensvenda(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, %s, ' +
                  QuotedStr(vdadosini.vTipoVendaOS) + ',' +
                  QuotedStr(TipoVendaSelec) + ',' +
                  QuotedStr(TipoOrigemSelec) + ') qtdeitensvnd on 1 = 1 ' +
              ' left join getqtdeitensdevolvidos(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, %s) qtdeitensdev on 1 = 1 ' +
              ' left join getqtdeitensvendaperdida(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa, %s) qtdeitensperd on 1 = 1 ' +
              ' left join getqtdeitenspedido(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa) qtdeitenspedido on 1 = 1 ' +
              ' left join getqtdeitenspedidorec(pr.grupo_prod, pr.cod_prod, 0, pr.cod_empresa) qtdeitenspedidorec on 1 = 1 ';

            if not vDadosIni.vProdSimilar.vAgruparSimilar then
              vSql := vSql + ' left join getprodutossimilar(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 '
            else if not vDadosIni.vProdSimilar.vSimilaresEntreSi then
              vSql := vSql + ' left join getprodutossimilargrupo(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 '
            else
              vSql := vSql + ' left join getprodutossimilargrupoentresi(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 ';

            vSql := vSql +
              ' where pr.cod_empresa in (' + vCodigosEmpresas + ') ' +
              ' and pr.ativo = 1 ';
          end;
        end;
        vSql := vSql + ' and pr.grupo_prod = ' + IntToStr(fTempGrupo.FieldByName('GRUPO_PROD').AsInteger);

        vSql := vSql + sqlAdicional;

        if usarGrade then
        	vSql := vSql + ' order by pr.grupo_prod, pr.cod_prod, g.cod_grade, pr.cod_empresa '
        else
	        vSql := vSql + ' order by pr.grupo_prod, pr.cod_prod, pr.cod_empresa ';

        SqlOpen(vSql,
        	[date_fb(date - (QtdMesEmpresa * 30)),
           date_fb(date - (QtdMesEmpresa * 30)),
           date_fb(date - (QtdMesEmpresa * 30))],
        	buscas).FetchAll;
//        ProgressBar.max := buscas.RecordCount;
//        ProgressBar2.max := buscas.RecordCount;

        vGrupoTemp := 0;
        vCodProdTemp := '';
        vCodGradeTemp := 0;
        vCodEmpresaTemp := 0;

  //        ProgressBar.Position := 0;
  //        ProgressBar2.Position := 0;
//        lb.Caption := 'Produto Analizado:';
//        lb2.Caption := 'Produto Analizado:';

        vestsegsug := EstoqueSeguranca;
        if obBuscaClasse = nil then
          obBuscaClasse := TBuscasClasses.create;
        buscas.First;
        while not buscas.Eof do
        begin
          Application.ProcessMessages;

  //        lb.caption := vDadosIni.StrZero(vcount, 5);
  //        lb2.caption := vDadosIni.StrZero(vcount, 5);

          if not vDadosIni.vSugCompra.vMultiempresa then
            vCodEmpresa := vdadosini.codempresa
          else
            vCodEmpresa := IntToStr(buscas.FieldByName('cod_empresa').AsInteger);

          // Zerar variaveis
          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
              if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
                for J := 0 to Length(vCodEmpresas) - 1 do
                begin
                  vEst_fEmp[J] := 0;
                  vtempo_entregaSubEmp[J] := 0;
                  vfreq_pedido[J] := 0;
                  vestoque_seguranca[J] := 0;
                  vqtd_ped_prodEmp[J] := 0;
                  vQtdItemVndEmp[J] := 0;
                  qtdItemDevolvidoEmp[J] := 0;
                  vqtperdEmp[J] := 0;
                  MediaEmp[J] := 0;
                  dmdEmp[J] := 0;
                  vte_sugEmp[J] := 0;
                  vCcEmp[J] := 0;
                  vprconsEmp[J] := 0;
                  vEsEmp[J] := 0;
                  vNOEEmp[J] := 0;
                  vQtdPedidoEmp[J] := 0;
                  vQtdItemPedidoEmp[J] := 0;
                  vQtdItemPedidoRecEmp[J] := 0;
                  vQtdItemVndAbertaEmp[J] := 0;
                  EstEmp[J] := 0;
                  SugcEmp[J] := 0;
                  MediaEmp[J] := 0;
                  vEstDispTrans[J] := 0;
                  vTransf[J] := 0;
                  vQtdeTransf[J] := 0;
                end;

            vQtdItemVnd := buscas.FieldByName('qtdeitemreqos').AsFloat;
            qtdItemDevolvido := buscas.FieldByName('qtdeitemdevolvido').AsFloat;
            vqtperd := buscas.FieldByName('qtdeitemvndperd').AsFloat;
            vQtdItemPedido := buscas.FieldByName('qtdeitempedido').AsFloat;
            vQtdItemPedidoRec := buscas.FieldByName('qtdeitempedidorec').AsFloat;
            if vQtdItemPedidoRec > vQtdItemPedido then
              vQtdPedido := 0
            else
              vQtdPedido := vQtdItemPedido - vQtdItemPedidoRec;

            if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
            	if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
                RetornaDadosProduto(
                  buscas.FieldByName('GRUPO_PROD').AsInteger,
                  buscas.FieldByName('COD_PROD').AsString,
                  buscas.FieldByName('COD_EMPRESA').AsInteger,
                  usarGrade,
                  vDadosIni.IfThen(usarGrade, buscas.FieldByName('COD_GRADE').AsInteger, 0));

//          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
//              if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
//                for J := 0 to Length(vCodEmpresas) - 1 do
//                  vEst_fEmp[J] := obBuscaClasse.RetornaEstF(
//                    buscas.FieldByName('COD_PROD').AsString,
//                    buscas.FieldByName('GRUPO_PROD').AsInteger,
//                    IntToStr(vCodEmpresas[J]));
//
//          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
//              if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
//                for J := 0 to Length(vCodEmpresas) - 1 do
//                  vtempo_entregaSubEmp[J] := obBuscaClasse.RetornaTempoEntrega(
//                    buscas.FieldByName('COD_PROD').AsString,
//                    buscas.FieldByName('GRUPO_PROD').AsInteger,
//                    IntToStr(vCodEmpresas[J]));
//
//          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
//              if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
//                for J := 0 to Length(vCodEmpresas) - 1 do
//                  vfreq_pedido[J] := obBuscaClasse.RetornaFreqPedido(
//                    buscas.FieldByName('COD_PROD').AsString,
//                    buscas.FieldByName('GRUPO_PROD').AsInteger,
//                    IntToStr(vCodEmpresas[J]));
//
//          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
//              if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
//                for J := 0 to Length(vCodEmpresas) - 1 do
//                  vestoque_seguranca[J] := obBuscaClasse.RetornaEstSeguranca(
//                    buscas.FieldByName('COD_PROD').AsString,
//                    buscas.FieldByName('GRUPO_PROD').AsInteger,
//                    IntToStr(vCodEmpresas[J]));
//
//          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
//              if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
//                for J := 0 to Length(vCodEmpresas) - 1 do
//                  vqtd_ped_prodEmp[J] := obBuscaClasse.RetornaQuantPedProd(
//                    buscas.FieldByName('COD_PROD').AsString,
//                    buscas.FieldByName('GRUPO_PROD').AsInteger,
//                    IntToStr(vCodEmpresas[J]));
//
//          if usarGrade then
//          begin
//            if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
//              if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
//                for J := 0 to Length(vCodEmpresas) - 1 do
//                  vQtdItemVndEmp[J] := obBuscaClasse.RetornaQtdItensVenda(
//                    buscas.FieldByName('COD_PROD').AsString,
//                    buscas.FieldByName('GRUPO_PROD').AsInteger,
//                    buscas.FieldByName('COD_GRADE').AsInteger,
//                    QtdMesSugestao,
//                    TipoVendaSelec,
//                    TipoOrigemSelec,
//                    juncao,
//                    IntToStr(vCodEmpresas[J]));
//
//            vQtdItemVnd := obBuscaClasse.RetornaQtdItensVenda(
//              buscas.FieldByName('COD_PROD').AsString,
//              buscas.FieldByName('GRUPO_PROD').AsInteger,
//              buscas.FieldByName('COD_GRADE').AsInteger,
//              QtdMesSugestao,
//              TipoVendaSelec,
//              TipoOrigemSelec,
//              juncao,
//              vCodEmpresa);
//          end
//          else
//          begin
//            if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
//              if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
//                for J := 0 to Length(vCodEmpresas) - 1 do
//                  vQtdItemVndEmp[J] := obBuscaClasse.RetornaQtdItensVenda(
//                    buscas.FieldByName('COD_PROD').asstring,
//                    buscas.FieldByName('GRUPO_PROD').asinteger,
//                    QtdMesSugestao,
//                    TipoVendaSelec,
//                    TipoOrigemSelec,
//                    juncao,
//                    IntToStr(vCodEmpresas[J]));
//
//            vQtdItemVnd := obBuscaClasse.RetornaQtdItensVenda(
//              buscas.FieldByName('COD_PROD').asstring,
//              buscas.FieldByName('GRUPO_PROD').asinteger,
//              QtdMesSugestao,
//              TipoVendaSelec,
//              TipoOrigemSelec,
//              juncao,
//              vCodEmpresa);
//          end;
//
//          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
//            if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
//              for J := 0 to Length(vCodEmpresas) - 1 do
//                qtdItemDevolvidoEmp[J] := obBuscaClasse.RetornaQtdItensDevolvidos(
//                  buscas.FieldByName('COD_PROD').asstring,
//                  buscas.FieldByName('GRUPO_PROD').asinteger,
//                  (date - (QtdMesSugestao * 30)),
//                  IntToStr(vCodEmpresas[J]));
//
//          qtdItemDevolvido := obBuscaClasse.RetornaQtdItensDevolvidos(
//            buscas.FieldByName('COD_PROD').asstring,
//            buscas.FieldByName('GRUPO_PROD').asinteger,
//            (date - (QtdMesSugestao * 30)),
//            vCodEmpresa);
//
//          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
//            if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
//              for J := 0 to Length(vCodEmpresas) - 1 do
//                vqtperdEmp[J] := obBuscaClasse.RetornaQtdItensVendaPerdida(
//                  buscas.FieldByName('COD_PROD').asstring,
//                  buscas.FieldByName('GRUPO_PROD').asinteger,
//                  QtdMesSugestao,
//                  IntToStr(vCodEmpresas[J]));
//
//          vqtperd := obBuscaClasse.RetornaQtdItensVendaPerdida(
//            buscas.FieldByName('COD_PROD').asstring,
//            buscas.FieldByName('GRUPO_PROD').asinteger,
//            QtdMesSugestao,
//            vCodEmpresa);
//
//					if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
//            if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
//              for J := 0 to Length(vCodEmpresas) - 1 do
//                vQtdPedidoEmp[J] := obBuscaClasse.RetornaQtdItensPedidoNaoRecebido(
//                  buscas.FieldByName('COD_PROD').asstring,
//                  buscas.FieldByName('GRUPO_PROD').asinteger,
//                  IntToStr(vCodEmpresas[J]));
//
//          vQtdPedido := obBuscaClasse.RetornaQtdItensPedidoNaoRecebido(
//            buscas.FieldByName('COD_PROD').asstring,
//            buscas.FieldByName('GRUPO_PROD').asinteger,
//            vCodEmpresa);
//
//          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
//            if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
//              for J := 0 to Length(vCodEmpresas) - 1 do
//                vQtdItemVndAbertaEmp[J] := obBuscaClasse.RetornaQtdItensVendaAberta(
//                  buscas.FieldByName('COD_PROD').asstring,
//                  buscas.FieldByName('GRUPO_PROD').asinteger,
//                  IntToStr(vCodEmpresas[J]));
//
//          vQtdItemVndAberta := obBuscaClasse.RetornaQtdItensVendaAberta(
//            buscas.FieldByName('COD_PROD').asstring,
//            buscas.FieldByName('GRUPO_PROD').asinteger,
//            vCodEmpresa);

          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
            if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
              for J := 0 to Length(vCodEmpresas) - 1 do
                MediaEmp[J] := ((vQtdItemVndEmp[J] + vqtperdEmp[J] + qtdItemDevolvidoEmp[J]) / QtdMesSugestao);

          Media := ((vQtdItemVnd + vqtperd + qtdItemDevolvido) / QtdMesSugestao);

          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
            if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
              for J := 0 to Length(vCodEmpresas) - 1 do
                dmdEmp[J] := MediaEmp[J] / 30;

          dmd := media / 30;

          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
            if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
            begin
              for J := 0 to Length(vCodEmpresas) - 1 do
                if vtempo_entregaSubEmp[J] > 0 then
                  vte_sugEmp[J] := vtempo_entregaSubEmp[J]
                else
                  vte_sugEmp[J] := TempoEntrega;
            end;

          if buscas.FieldByName('TEMPO_ENTREGASUG').asinteger > 0 then
            vte_sug := buscas.FieldByName('TEMPO_ENTREGASUG').asinteger
          else
            vte_sug := TempoEntrega;

          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
            if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
            begin
              for J := 0 to Length(vCodEmpresas) - 1 do
              begin
                if vfreq_pedido[J] > 0 then
                begin
                  vCcEmp[J] := TempoProcess + vte_sugEmp[J] + TempoAloc + vfreq_pedido[J];
                  vprconsEmp[J] := (vfreq_pedido[J] * dmdEmp[J]);
                end
                else
                begin
                  vCcEmp[J] := TempoProcess + vte_sugEmp[J] + TempoAloc + FreqPedido;
                  vprconsEmp[J] := (FreqPedido * dmdEmp[J]);
                end;
              end;
            end;

          if buscas.FieldByName('FREQ_PEDIDO').asinteger > 0 then
          begin
            vCc := TempoProcess + vte_sug + TempoAloc + buscas.FieldByName('FREQ_PEDIDO').asinteger;
            vprcons := (buscas.FieldByName('FREQ_PEDIDO').asinteger * dmd);
          end
          else
          begin
            vCc := TempoProcess + vte_sug + TempoAloc + FreqPedido;
            vprcons := (FreqPedido * dmd);
          end;

          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
            if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
            begin
              for J := 0 to Length(vCodEmpresas) - 1 do
                if vestoque_seguranca[J] > 0 then
                  vEsEmp[J] := dmdEmp[J] * vCcEmp[J] * (vestoque_seguranca[J] / 100)
                else
                  vEsEmp[J] := dmdEmp[J] * vCcEmp[J] * (EstoqueSeguranca / 100);
            end;

          if buscas.FieldByName('EST_SEGURANCA').asinteger > 0 then
            vEs := dmd * vCc * (buscas.FieldByName('EST_SEGURANCA').asinteger / 100)
          else
            vEs := dmd * vCc * (EstoqueSeguranca / 100);

          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
            if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
              for J := 0 to Length(vCodEmpresas) - 1 do
                vNOEEmp[J] := vEsEmp[J] + (vCcEmp[J] * dmdEmp[J]);

          vNOE := vEs + (vcc * dmd);

//          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
//            if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
//              for J := 0 to Length(vCodEmpresas) - 1 do
//                EstEmp[J] := vEst_fEmp[J] - vQtdItemVndAbertaEmp[J] + vqtd_ped_prodEmp[J];
//
//          Est := buscas.FieldByName('EST_F').AsFloat - vQtdItemVndAberta + buscas.FieldByName('QUANT_PED_PROD').AsFloat;

        	if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
            if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
              for J := 0 to Length(vCodEmpresas) - 1 do
                EstEmp[J] := vEst_fEmp[J] + vqtd_ped_prodEmp[J];

          Est := buscas.FieldByName('ESTOQUE').AsFloat + buscas.FieldByName('QUANT_PED_PROD').AsFloat;

          if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
            if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger) then
            begin
              vExibirSug := false;
              for J := 0 to Length(vCodEmpresas) - 1 do
                if (EstEmp[J] <= vNOEEmp[J]) and (vNOEEmp[J] <> 0) then
                begin
                  vExibirSug := true;
                  break;
                end;

              if (vExibirSug) then
              begin
                EstGer := 0;
                vNOEGer := 0;
                for J := 0 to Length(vCodEmpresas) - 1 do
                begin
                  if (EstEmp[J] <= vNOEEmp[J]) and (vNOEEmp[J] <> 0) then
                    EstGer := EstGer + EstEmp[J];
                  if (EstEmp[J] <= vNOEEmp[J]) and (vNOEEmp[J] <> 0) then
                    vNOEGer := vNOEGer + vNOEEmp[J];
                end;

                for J := 0 to Length(vCodEmpresas) - 1 do
                begin
                	SugcEmp[J] := (vNOEEmp[J] - (EstEmp[J] - vprconsEmp[J]) - vQtdPedidoEmp[J]);

                  if SugcEmp[J] < 0 then
                    SugcEmp[J] := 0;
                  
                  if arredondavalor then
                  begin
                    SugcEmp[J] := Ceil(SugcEmp[J]);
                    MediaEmp[J] := Ceil(MediaEmp[J]);
                  end;
                  vEstDispTrans[J] := vDadosIni.IfThen(SugcEmp[J] <= 0,
                  	vDadosIni.IfThen((SugcEmp[J] <= 0) and (vNOEEmp[J] <> 0) and (EstEmp[J] > vNOEEmp[J]),
                    	Floor(EstEmp[J] - vNOEEmp[J]), 0),
                    0);
                  // vEstDispTrans[J] := vDadosIni.IfThen(EstEmp[J] > SugcEmp[J], EstEmp[J] - SugcEmp[J], 0);
                  if arredondavalor then
                    vEstDispTrans[J] := Ceil(vEstDispTrans[J]);
                end;

                SugcGer := 0;
                MediaGer := 0;
                EstDispTransfGer := 0;
                vQtdPedidoGer := 0;
                for J := 0 to Length(vCodEmpresas) - 1 do
                begin
                  if (EstEmp[J] <= vNOEEmp[J]) and (vNOEEmp[J] <> 0) then
                    SugcGer := SugcGer + vDadosIni.IfThen(SugcEmp[J] > 0, SugcEmp[J], 0);
                  if (EstEmp[J] <= vNOEEmp[J]) and (vNOEEmp[J] <> 0) then
                    MediaGer := MediaGer + vDadosIni.IfThen(SugcEmp[J] > 0, MediaEmp[J], 0); //MediaEmp[J];
                  if (EstEmp[J] <= vNOEEmp[J]) and (vNOEEmp[J] <> 0) then
                    vQtdPedidoGer := vQtdPedidoGer + vDadosIni.IfThen(SugcEmp[J] > 0, vQtdPedidoEmp[J], 0);  //vQtdPedidoEmp[J]
                  EstDispTransfGer := EstDispTransfGer + vEstDispTrans[J];
                end;

                if SugcGer > 0 then
                begin
                  if SugcGer < buscas.FieldByName('QTDEMB').AsFloat then
                    SugcGer := buscas.FieldByName('QTDEMB').AsFloat;
  //                SugcGer := round(SugcGer);

                  I := I + 1;
//                  if obBuscaClasse.ProdutoTemSimilar(
//                    buscas.FieldByName('COD_PROD').asstring,
//                    buscas.FieldByName('GRUPO_PROD').asinteger,
//                    vCodigosEmpresas) then
//                      GridSug.Cells[0, I] := 'S';
                	if buscas.FieldByName('EXISTESIMILAR').AsInteger > 0 then
                  	GridSug.Cells[0, I] := 'S';

                  GridSug.cells[1, I] := buscas.FieldByName('GRUPO_PROD').asstring;
                  GridSug.cells[2, I] := buscas.FieldByName('COD_PROD').asstring;
                  GridSug.Cells[3, I] := buscas.FieldByName('NUM_FAB_PROD').asstring;

                  if arredondavalor then
                  	GridSug.Cells[4, I] := format('%0.0f', [EstGer])
                  else
                  	GridSug.Cells[4, I] := format('%n', [EstGer]);

                  if arredondavalor then
                  begin
                    GridSug.Cells[5, I] := format('%0.0f', [MediaGer]);

                    if (checktransf.Checked)
                      and (vDadosIni.vSugCompra.vMultiempresa)
                      and (Length(vCodEmpresas) > 1) then
                    begin
                      if (EstDispTransfGer >= SugcGer) then
                        GridSug.Cells[6, I] := format('%0.0f', [SugcGer])
                      else
                        GridSug.Cells[6, I] := format('%0.0f', [EstDispTransfGer]);

                      if (EstDispTransfGer >= SugcGer) then
                        GridSug.Cells[7, I] := format('%0.0f', [0.00])
                      else
                        GridSug.Cells[7, I] := format('%0.0f', [SugcGer - EstDispTransfGer]);
                    end
                    else
                    begin
                   	  GridSug.Cells[6, I] := format('%0.0f', [0.00]);
	                    GridSug.Cells[7, I] := format('%0.0f', [SugcGer]);
                    end;
                  end
                  else
                  begin
                    GridSug.Cells[5, I] := format('%n', [MediaGer]);

                    if (checktransf.Checked)
                      and (vDadosIni.vSugCompra.vMultiempresa)
                      and (Length(vCodEmpresas) > 1) then
                    begin
                      if (EstDispTransfGer >= SugcGer) then
                        GridSug.Cells[6, I] := format('%n', [SugcGer])
                      else
                        GridSug.Cells[6, I] := format('%n', [EstDispTransfGer]);

                      if (EstDispTransfGer >= SugcGer) then
                        GridSug.Cells[7, I] := format('%n', [0.00])
                      else
                        GridSug.Cells[7, I] := format('%n', [SugcGer - EstDispTransfGer]);
                    end
                    else
                    begin
                   	  GridSug.Cells[6, I] := format('%n', [0.00]);
	                    GridSug.Cells[7, I] := format('%n', [SugcGer]);
                    end;
                  end;
                
                  GridSug.Cells[8, I] := buscas.FieldByName('CLASSE_PROD').asstring + '-' +
                    buscas.FieldByName('CLINV').asstring + '-' + buscas.FieldByName('CLPRECO').asstring + '-' +
                    buscas.FieldByName('CLPOP').asstring + '-' + buscas.FieldByName('CLQTV').asstring + '-' +
                    buscas.FieldByName('CLFRV').asstring + '-' + buscas.FieldByName('CLATL').asstring;

                  GridSug.cells[9, I] := '';

                  GridSug.Cells[10, I] := floattostr(vQtdPedidoGer); //floattostr(vpend);

                  if checkdescred.Checked then
                  begin
                    GridSug.Cells[11, I] :=
                    	vDadosIni.IfThen(Trim(buscas.FieldByName('DESCR_PROD_RED').asstring) <> '',
                      	Trim(buscas.FieldByName('DESCR_PROD_RED').asstring),
                        Trim(buscas.FieldByName('DESCR_PROD').asstring)) +
                    	vDadosIni.IfThen(trim(buscas.FieldByName('EMB_PROD').asstring) <> '',
	                    	' ' + trim(buscas.FieldByName('EMB_PROD').asstring), '') +
                      vDadosIni.IfThen(usarGrade,
                      	vDadosIni.IfThen(buscas.FieldByName('COD_GRADE').AsInteger > 0,
	                      	' ' + Trim(buscas.FieldByName('DESCRICAO').asstring), ''),
                        '');
                  end
                  else
                  begin
                    GridSug.Cells[11, I] :=
                    	vDadosIni.IfThen(Trim(buscas.FieldByName('DESCR_PROD').asstring) <> '',
                    		Trim(buscas.FieldByName('DESCR_PROD').asstring),
                        Trim(buscas.FieldByName('DESCR_PROD_RED').asstring)) +
                    	vDadosIni.IfThen(trim(buscas.FieldByName('EMB_PROD').asstring) <> '',
	                    	' ' + trim(buscas.FieldByName('EMB_PROD').asstring), '') +
                      vDadosIni.IfThen(usarGrade,
                      	vDadosIni.IfThen(buscas.FieldByName('COD_GRADE').AsInteger > 0,
	                      	' ' + Trim(buscas.FieldByName('DESCRICAO').asstring), ''),
                        '');
                  end;

                  GridSug.cells[12, I] := '';
                  GridSug.cells[13, I] := '';
                  GridSug.cells[14, I] := '';

//                  if usarGrade then
//                  begin
//                    GridSug.Cells[15, I] := buscas.FieldByName('COD_GRADE').asstring;
//                    GridSug.Cells[16, I] := Trim(buscas.FieldByName('DESCRICAO').asstring);
//                    GridSug.Cells[17, I] := Trim(buscas.FieldByName('DESCRICAO1').asstring);
//                  end
//                  else
//                  begin
                    GridSug.Cells[15, I] := '';
    		            GridSug.Cells[16, I] := '';
		                GridSug.Cells[17, I] := '';
//                  end;
                end;
              end;
            end;

          if (Est <= vNOE) and (vNOE <> 0) then
          begin
            Sugc := (vNoe - (est - vprCons) - vQtdPedido);
            if Sugc < 0 then
              Sugc := 0;

            if arredondavalor then
            begin
              sugc := Ceil(sugc);
              media := Ceil(Media);
            end;

            if sugc > 0 then
            begin
              if sugc < buscas.FieldByName('QTDEMB').AsFloat then
                sugc := buscas.FieldByName('QTDEMB').AsFloat;

              //Calcular transferencias
              if (checktransf.Checked)
              	and (vDadosIni.vSugCompra.vMultiempresa)
                and (Length(vCodEmpresas) > 1)then
              begin
                vSugcTemp := Sugc;
                vEstTemp := Est;
                for J := 0 to Length(vCodEmpresas) - 1 do
                begin
//                  if (buscas.FieldByName('COD_EMPRESA').AsInteger <> vCodEmpresas[J])
//                    and (EstEmp[J] > SugcEmp[J])
//                    and (vEstDispTrans[J] > 0) then
                	if (buscas.FieldByName('COD_EMPRESA').AsInteger <> vCodEmpresas[J])
	                	and (vEstDispTrans[J] > 0) then
                  begin
                    if ((SugcEmp[J] > vSugcTemp) and (vSugcTemp > 0))
                      or ((vSugcTemp >= vEstDispTrans[J]) and (vEstDispTrans[J] > 0))
                      or ((vEstDispTrans[J] > vSugcTemp) and (vSugcTemp > 0)) then
                    begin
                      if (SugcEmp[J] > vSugcTemp) then
                        vQtdeTransf[J] := vSugcTemp
                      else if (vSugcTemp >= vEstDispTrans[J]) then
                        vQtdeTransf[J] := vEstDispTrans[J]
                      else if (vEstDispTrans[J] > vSugcTemp) then
                        vQtdeTransf[J] := vSugcTemp;

                      if (SugcEmp[J] > vSugcTemp) then
                      begin
                        vEstDispTrans[J] := vEstDispTrans[J] - (vSugcTemp);
                        vSugcTemp := vSugcTemp - vEstTemp;
                      end
                      else if (vSugcTemp >= vEstDispTrans[J]) then
                      begin
                        vSugcTemp := vSugcTemp - vEstDispTrans[J];
                        vEstDispTrans[J] := 0;
                      end
                      else if (vEstDispTrans[J] > vSugcTemp) then
                      begin
                        vEstDispTrans[J] := vEstDispTrans[J] - (vSugcTemp);
                        vSugcTemp := 0;
                      end;
                    end;
                  end;
                end;
              end;
  //            sugc := round(sugc);

              I := I + 1;
//              if obBuscaClasse.ProdutoTemSimilar(
//                buscas.FieldByName('COD_PROD').asstring,
//                buscas.FieldByName('GRUPO_PROD').asinteger,
//                vCodEmpresa) then
//                  GridSug.Cells[0, I] := 'S';
            	if buscas.FieldByName('EXISTESIMILAR').AsInteger > 0 then
              	GridSug.Cells[0, I] := 'S';

              if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1)
               and ((vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger)
                 or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString))
                 or (vCodGradeTemp <> buscas.FieldByName('COD_GRADE').AsInteger)
                 or (vCodEmpresaTemp <> buscas.FieldByName('COD_EMPRESA').AsInteger)) then
              begin
                GridSug.cells[1, I] := 'EMP ' + buscas.FieldByName('COD_EMPRESA').AsString;
              end
              else
              begin
                GridSug.cells[1, I] := buscas.FieldByName('GRUPO_PROD').asstring;
                GridSug.cells[2, I] := buscas.FieldByName('COD_PROD').asstring;
                GridSug.Cells[3, I] := buscas.FieldByName('NUM_FAB_PROD').asstring;
              end;
              
              if arredondavalor then
	              GridSug.Cells[4, I] := format('%0.0f', [est])
              else
              	GridSug.Cells[4, I] := format('%n', [est]);

              Tranfc := 0;
              for J := 0 to Length(vCodEmpresas) - 1 do
              	if vQtdeTransf[J] > 0 then
                begin
                	if Tranfc = sugc then
                  	break;
                    
                	if Tranfc + vQtdeTransf[J] > sugc then
                  	Tranfc := Tranfc + sugc
                  else
	                	Tranfc := Tranfc + vQtdeTransf[J];
                end;

              if arredondavalor then
              begin
               GridSug.Cells[5, I] := format('%0.0f', [media]);
               if (checktransf.Checked)
              	and (vDadosIni.vSugCompra.vMultiempresa)
                and (Length(vCodEmpresas) > 1) then
               begin
	               GridSug.Cells[6, I] := format('%0.0f', [tranfc]);
  	             GridSug.Cells[7, I] := format('%0.0f', [sugc - tranfc]);
               end
               else
               begin
                 GridSug.Cells[6, I] := format('%0.0f', [0.00]);
  	             GridSug.Cells[7, I] := format('%0.0f', [sugc]);
               end;
              end
              else
              begin
               GridSug.Cells[5, I] := format('%n', [media]);
               if (checktransf.Checked)
              	and (vDadosIni.vSugCompra.vMultiempresa)
                and (Length(vCodEmpresas) > 1) then
               begin
                 GridSug.Cells[6, I] := format('%n', [tranfc]);
                 GridSug.Cells[7, I] := format('%n', [sugc - tranfc]);
               end
               else
               begin
               	 GridSug.Cells[6, I] := format('%n', [0.00]);
                 GridSug.Cells[7, I] := format('%n', [sugc]);
               end;
              end;

              if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1)
               and (vCodEmpresaTemp <> buscas.FieldByName('COD_EMPRESA').AsInteger) then
                  GridSug.Cells[8, I] := Trim(buscas.FieldByName('IDENTIFICACAO_EMP').asstring)
              else
                  GridSug.Cells[8, I] := buscas.FieldByName('CLASSE_PROD').asstring + '-' +
                    buscas.FieldByName('CLINV').asstring + '-' + buscas.FieldByName('CLPRECO').asstring + '-' +
                    buscas.FieldByName('CLPOP').asstring + '-' + buscas.FieldByName('CLQTV').asstring + '-' +
                    buscas.FieldByName('CLFRV').asstring + '-' + buscas.FieldByName('CLATL').asstring;

              GridSug.cells[9, I] := '';

              GridSug.Cells[10, I] := floattostr(vQtdPedido); //floattostr(vpend);

              if (vDadosIni.vSugCompra.vMultiempresa) and (Length(vCodEmpresas) > 1) then
	              GridSug.Cells[11, I] := ''
              else
              begin
                if checkdescred.Checked then
                begin
                  GridSug.Cells[11, I] :=
                    vDadosIni.IfThen(Trim(buscas.FieldByName('DESCR_PROD_RED').asstring) <> '',
                      Trim(buscas.FieldByName('DESCR_PROD_RED').asstring),
                      Trim(buscas.FieldByName('DESCR_PROD').asstring)) +
                    vDadosIni.IfThen(trim(buscas.FieldByName('EMB_PROD').asstring) <> '',
                      ' ' + trim(buscas.FieldByName('EMB_PROD').asstring), '') +
                    vDadosIni.IfThen(usarGrade,
                      vDadosIni.IfThen(buscas.FieldByName('COD_GRADE').AsInteger > 0,
                        ' ' + Trim(buscas.FieldByName('DESCRICAO').asstring), ''),
                      '');
                end
                else
                begin
                  GridSug.Cells[11, I] :=
                    vDadosIni.IfThen(Trim(buscas.FieldByName('DESCR_PROD').asstring) <> '',
                      Trim(buscas.FieldByName('DESCR_PROD').asstring),
                      Trim(buscas.FieldByName('DESCR_PROD_RED').asstring)) +
                    vDadosIni.IfThen(trim(buscas.FieldByName('EMB_PROD').asstring) <> '',
                      ' ' + trim(buscas.FieldByName('EMB_PROD').asstring), '') +
                    vDadosIni.IfThen(usarGrade,
                      vDadosIni.IfThen(buscas.FieldByName('COD_GRADE').AsInteger > 0,
                        ' ' + Trim(buscas.FieldByName('DESCRICAO').asstring), ''),
                      '');
                end;
              end;

              GridSug.cells[12, I] := buscas.FieldByName('GRUPO_PROD').asstring;
              GridSug.cells[13, I] := buscas.FieldByName('COD_PROD').asstring;
              GridSug.cells[14, I] := buscas.FieldByName('COD_EMPRESA').asstring;

              if usarGrade then
              begin
                GridSug.Cells[15, I] := IntToStr(buscas.FieldByName('COD_GRADE').asinteger);
                GridSug.Cells[16, I] := Trim(buscas.FieldByName('DESCRICAO').asstring);
                GridSug.Cells[17, I] := Trim(buscas.FieldByName('DESCRICAO1').asstring);
              end
              else
              begin
                GridSug.Cells[15, I] := '';
                GridSug.Cells[16, I] := '';
                GridSug.Cells[17, I] := '';
              end;

              // Exibir compras
              if usarGrade then
              begin
                if buscas.FieldByName('COD_GRADE').asinteger = 0 then
                begin
                  vSql :=
    //                ' select first 3 c.num_nota_nfe, c.fornec, c.valor, c.data, infe.quant_item_nfe, ' +
    //								' cgpc.qtde, cgpc.cod_grade, g.descricao, g.descricao1, cl.nome_cliente from custos c ' +
    //                ' inner join item_nf_entrada infe on ' +
    //                ' c.num_nota_nfe=infe.num_nota_nfe and c.fornec=infe.cod_forn_nfe and c.cod_empresa=infe.cod_empresa ' +
    //                ' and c.grupo_prod=infe.grupo_prod and c.cod_prod=infe.cod_prod ' +
    //                ' left join cod_grade_prod_compra cgpc on ' +
    //                ' infe.grupo_prod=cgpc.grupo_prod and infe.cod_prod=cgpc.cod_prod and infe.cod_forn_nfe=cgpc.cod_forn_nfe ' +
    //                ' and infe.cod_empresa=cgpc.cod_empresa ' +
    //                ' left join cod_grade_prod cg on ' +
    //                ' cgpc.cod_grade=cg.cod_grade and cgpc.grupo_prod=cg.grupo_prod and cgpc.cod_prod=cg.cod_prod and cgpc.cod_empresa=cg.cod_empresa ' +
    //                ' left join grade g on ' +
    //                ' cg.cod_grade=g.cod_grade and cg.cod_empresa=g.cod_empresa ' +
    //                ' left join clientes cl on cl.cod_cliente = c.fornec and cl.cod_empresa = c.cod_empresa ' +
    //                ' where c.grupo_prod= ' + inttostr(buscas.FieldByName('GRUPO_PROD').asinteger) +
    //                ' and c.cod_prod=' + quotedstr(trim(buscas.FieldByName('COD_PROD').asstring)) +
    //                ' and c.cod_empresa=' + vDadosIni.CodEmpresa + ' and c.ativo=1' +
    //                ' and cgpc.cod_grade is null ' +
    //                ' union ' +
                    ' select first 3 c.num_nota_nfe, c.fornec, c.valor, c.data, nfit.quantidade as quant_item_nfe, ' +
                    ' cgpc.qtde, cgpc.cod_grade, g.descricao, g.descricao1, cl.nome_cliente from custos c ' +
                    ' inner join notafiscal_item nfit on c.cod_nf = nfit.cod_nf and c.cod_empresa = nfit.cod_empresa ' +
                    ' and c.grupo_prod = nfit.grupo_prod and c.cod_prod=nfit.cod_prod ' +
                    ' left join cod_grade_prod_compra cgpc on ' +
                    ' nfit.grupo_prod = cgpc.grupo_prod and nfit.cod_prod = cgpc.cod_prod and nfit.cod_nf = cgpc.num_nota_nfe ' +
                    ' and nfit.cod_empresa=cgpc.cod_empresa ' +
                    ' left join cod_grade_prod cg on cgpc.cod_grade = cg.cod_grade and cgpc.grupo_prod = cg.grupo_prod and cgpc.cod_prod = cg.cod_prod and cgpc.cod_empresa = cg.cod_empresa ' +
                    ' left join grade g on cg.cod_grade = g.cod_grade and cg.cod_empresa = g.cod_empresa ' +
                    ' left join nat_op nt on nfit.codigo_nop = nt.codigo_nop '+
                    ' left join clientes cl on cl.cod_cliente = c.fornec and cl.cod_empresa = c.cod_empresa ' +
                    ' where c.grupo_prod = ' + inttostr(buscas.FieldByName('GRUPO_PROD').asinteger) +
                    ' and c.cod_prod = ' + quotedstr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                    ' and nt.devolucao <> ''S'' '+
                    ' and c.cod_empresa = ' + vCodEmpresa +
                    ' and c.ativo = 1' +
                    ' and cgpc.cod_grade is null ' +
                    ' order by 4 desc';
                end
                else
                begin
                  vSql :=
    //                ' select first 3 c.num_nota_nfe, c.fornec, c.valor, c.data,' +
    //                ' infe.quant_item_nfe, cgpc.qtde, cgpc.cod_grade, g.descricao, g.descricao1, cl.nome_cliente from custos c ' +
    //                ' inner join item_nf_entrada infe on ' +
    //                ' c.num_nota_nfe=infe.num_nota_nfe and c.fornec=infe.cod_forn_nfe and c.cod_empresa=infe.cod_empresa ' +
    //                ' and c.grupo_prod=infe.grupo_prod and c.cod_prod=infe.cod_prod ' +
    //                ' left join cod_grade_prod_compra cgpc on ' +
    //                ' infe.grupo_prod=cgpc.grupo_prod and infe.cod_prod=cgpc.cod_prod and infe.cod_forn_nfe=cgpc.cod_forn_nfe ' +
    //                ' and infe.cod_empresa=cgpc.cod_empresa ' +
    //                ' left join cod_grade_prod cg on ' +
    //                ' cgpc.cod_grade=cg.cod_grade and cgpc.grupo_prod=cg.grupo_prod and cgpc.cod_prod=cg.cod_prod and cgpc.cod_empresa=cg.cod_empresa ' +
    //                ' left join grade g on ' +
    //                ' cg.cod_grade=g.cod_grade and cg.cod_empresa=g.cod_empresa ' +
    //                ' left join clientes cl on cl.cod_cliente = c.fornec and cl.cod_empresa = c.cod_empresa ' +
    //                ' where c.grupo_prod= ' + inttostr(buscas.FieldByName('Grupo_prod').asinteger) +
    //                ' and c.cod_prod=' + quotedstr(trim(buscas.FieldByName('COD_PROD').asstring)) +
    //                ' and c.cod_empresa=' + vDadosIni.CodEmpresa + ' and c.ativo=1' +
    //                ' and cgpc.cod_grade= ' + inttostr(buscas.FieldByName('cod_grade').asinteger) +
    //                ' union ' +
                    ' select first 3 c.num_nota_nfe,c.fornec,c.valor,c.data,nfit.quantidade as quant_item_nfe, ' +
                    ' cgpc.qtde,cgpc.cod_grade,g.descricao,g.descricao1, cl.nome_cliente from custos c ' +
                    ' inner join notafiscal_item nfit on c.cod_nf = nfit.cod_nf and c.cod_empresa = nfit.cod_empresa ' +
                    ' and c.grupo_prod=nfit.grupo_prod and c.cod_prod=nfit.cod_prod ' +
                    ' left join cod_grade_prod_compra cgpc on nfit.grupo_prod = cgpc.grupo_prod and nfit.cod_prod = cgpc.cod_prod and nfit.cod_nf = cgpc.num_nota_nfe and nfit.cod_empresa=cgpc.cod_empresa ' +
                    ' left join cod_grade_prod cg on ' +
                    ' cgpc.cod_grade = cg.cod_grade and cgpc.grupo_prod = cg.grupo_prod and cgpc.cod_prod = cg.cod_prod and cgpc.cod_empresa = cg.cod_empresa ' +
                    ' left join grade g on cg.cod_grade = g.cod_grade and cg.cod_empresa=g.cod_empresa ' +
                    ' left join nat_op nt on nfit.codigo_nop = nt.codigo_nop '+
                    ' left join clientes cl on cl.cod_cliente = c.fornec and cl.cod_empresa = c.cod_empresa ' +
                    ' where c.grupo_prod = ' + inttostr(buscas.FieldByName('GRUPO_PROD').asinteger) +
                    ' and c.cod_prod = ' + quotedstr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                    ' and nt.devolucao <> ''S'' '+
                    ' and c.cod_empresa = ' + vCodEmpresa +
                    ' and c.ativo = 1 ' +
                    ' and cgpc.cod_grade = ' + inttostr(buscas.FieldByName('COD_GRADE').asinteger) +
                    ' order by 4 desc ';
                end;
              end
              else
              begin
                vSql :=
    //              'select first 3 c.num_nota_nfe, c.fornec, c.valor, c.data, infe.quant_item_nfe, cl.nome_cliente from custos c ' +
    //              ' inner join item_nf_entrada infe on ' +
    //              ' c.num_nota_nfe=infe.num_nota_nfe and c.fornec=infe.cod_forn_nfe and c.cod_empresa=infe.cod_empresa ' +
    //              ' and c.grupo_prod=infe.grupo_prod and c.cod_prod=infe.cod_prod ' +
    //              ' left join clientes cl on cl.cod_cliente = c.fornec and cl.cod_empresa = c.cod_empresa ' +
    //              ' where c.grupo_prod= ' + inttostr(buscas.FieldByName('GRUPO_PROD').asinteger) +
    //              ' and c.cod_prod=' + quotedstr(trim(buscas.FieldByName('COD_PROD').asstring)) +
    //              ' and c.cod_empresa=' + vDadosIni.CodEmpresa + ' and c.ativo=1' +
    //              ' union ' +
                  ' select first 3 c.num_nota_nfe, c.fornec, c.valor, c.data, nfit.quantidade as quant_item_nfe, cl.nome_cliente from custos c ' +
                  ' inner join notafiscal_item nfit on ' +
                  ' c.cod_nf = nfit.cod_nf and c.cod_empresa = nfit.cod_empresa ' +
                  ' and c.grupo_prod = nfit.grupo_prod and c.cod_prod = nfit.cod_prod ' +
                  ' left join nat_op nt on nfit.codigo_nop = nt.codigo_nop '+
                  ' left join clientes cl on cl.cod_cliente = c.fornec and cl.cod_empresa = c.cod_empresa ' +
                  ' where c.grupo_prod = ' + inttostr(buscas.FieldByName('GRUPO_PROD').asinteger) +
                  ' and c.cod_prod = ' + quotedstr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                  ' and nt.devolucao <> ''S'' ' +
                  ' and c.cod_empresa = ' + vCodEmpresa +
                  ' and c.ativo = 1' +
                  ' order by 4 desc';
              end;
              SqlOpen(vSql, buscas2).FetchAll;
              vqtcmp := 1;
              buscas2.First;
              while not buscas2.Eof do
              begin
                I := I + 1;
                GridSug.cells[1, I] := 'CMP ' + buscas.FieldByName('CLASSE_PROD').AsString;
                GridSug.cells[2, I] := buscas2.FieldByName('DATA').AsString;
                GridSug.Cells[3, I] := buscas.FieldByName('GRUPO_PROD').AsString;
                GridSug.Cells[4, I] := trim(buscas.FieldByName('COD_PROD').AsString);
                GridSug.Cells[5, I] := format('%n', [buscas2.FieldByName('VALOR').AsFloat]);
                GridSug.Cells[6, I] := buscas2.FieldByName('NUM_NOTA_NFE').AsString;
                GridSug.Cells[7, I] := '';

                GridSug.Cells[8, I] := vDadosIni.strzero(buscas2.FieldByName('FORNEC').AsInteger, 5) + ' ' + buscas2.FieldByName('NOME_CLIENTE').asstring;
//                if obBuscaSugestao = nil then
//                  obBuscaSugestao := TBuscasSugestao.create;
//
//                SqlOpen(' select f.cod_cliente, f.nome_cliente from clientes f ' +
//                  ' where f.cod_cliente = ' + inttostr(buscas2.FieldByName('FORNEC').AsInteger) +
//                  ' and f.cod_empresa = ' + vCodEmpresa +
//                  ' and f.ativo = 1 ', buscas3);
//                GridSug.Cells[8, I] := vDadosIni.strzero(buscas3.FieldByName('COD_CLIENTE').AsInteger, 5) + ' ' + buscas3.FieldByName('NOME_CLIENTE').asstring;

                buscas3.Close;
                if usarGrade then // Aqui é o transito de produtos ....
                begin
                  if buscas.FieldByName('cod_grade').asinteger = 0 then
                  begin
                    vSql :=
                    (*'select sum(infe.quant_item_nfe) as soma from nf_entrada nfe ' +
                      ' inner join item_nf_entrada infe ' +
                      ' on infe.num_nota_nfe = nfe.num_nota_nfe and infe.cod_forn_nfe = nfe.cod_forn_nfe ' +
                      ' and nfe.cod_empresa = infe.cod_empresa ' +
                      ' left join cod_grade_prod_compra cgpc ' +
                      ' on infe.grupo_prod=cgpc.grupo_prod and infe.cod_prod=cgpc.cod_prod and infe.cod_forn_nfe=cgpc.cod_forn_nfe ' +
                      ' and infe.cod_empresa=cgpc.cod_empresa ' +
                      ' where infe.grupo_prod = ' + inttostr(buscas.FieldByName('Grupo_prod').asinteger) +
                      ' and infe.cod_prod = ' + quotedstr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                      ' and  coalesce(nfe.status_nfe,'''')='''' ' + //nfe.status_nfe is null ' +
                      ' and cgpc.cod_grade is null ' +
                      ' and nfe.cod_empresa = ' + vDadosIni.codEmpresa + ' and nfe.ativo = 1 ' +
                      'union ' +*)
                      ' select sum(infe.quantidade) as soma from notafiscal nfe ' +
                      ' inner join notafiscal_item infe ' +
                      ' on infe.cod_nf = nfe.cod_nf ' +
                      ' and nfe.cod_empresa = infe.cod_empresa ' +
                      ' left join cod_grade_prod_compra cgpc ' +
                      ' on infe.grupo_prod=cgpc.grupo_prod and infe.cod_prod=cgpc.cod_prod and infe.cod_nf=cgpc.num_nota_nfe ' +
                      ' and infe.cod_empresa=cgpc.cod_empresa ' +
                      ' where infe.grupo_prod = ' + inttostr(buscas.FieldByName('GRUPO_PROD').asinteger) +
                      ' and infe.cod_prod = ' + quotedstr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                      ' and nfe.natureza_nf = ''E'' ' +
                      ' and coalesce(nfe.status,'''') = ''Aberta'' ' + //and nfe.status <> ''Fechada'' ' +
                      ' and cgpc.cod_grade is null ' +
                      ' and nfe.cod_empresa = ' + vCodEmpresa +
                      ' and nfe.ativo = 1 ';
                  end
                  else
                  begin
                    vSql :=
                    (*'select sum(infe.quant_item_nfe) as soma from nf_entrada nfe ' +
                      ' inner join item_nf_entrada infe ' +
                      ' on infe.num_nota_nfe = nfe.num_nota_nfe and infe.cod_forn_nfe = nfe.cod_forn_nfe ' +
                      ' and nfe.cod_empresa = infe.cod_empresa ' +
                      ' left join cod_grade_prod_compra cgpc ' +
                      ' on infe.grupo_prod=cgpc.grupo_prod and infe.cod_prod=cgpc.cod_prod and infe.cod_forn_nfe=cgpc.cod_forn_nfe ' +
                      ' and infe.cod_empresa=cgpc.cod_empresa ' +
                      ' where infe.grupo_prod = ' + inttostr(buscas.FieldByName('Grupo_prod').asinteger) +
                      ' and infe.cod_prod = ' + quotedstr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                      ' and coalesce(nfe.status_nfe,'''')='''' ' + //nfe.status_nfe is null ' +
                      ' and cgpc.cod_grade=' + inttostr(buscas.FieldByName('cod_grade').asinteger) +
                      ' and nfe.cod_empresa = ' + vDadosIni.codEmpresa + ' and nfe.ativo = 1 ' +
                      ' union ' +*)
                      ' select sum(infe.quantidade) as soma from notafiscal nfe ' +
                      ' inner join notafiscal_item infe on infe.cod_nf = nfe.cod_nf and nfe.cod_empresa = infe.cod_empresa ' +
                      ' left join cod_grade_prod_compra cgpc on infe.grupo_prod = cgpc.grupo_prod and infe.cod_prod = cgpc.cod_prod and infe.cod_nf = cgpc.num_nota_nfe and infe.cod_empresa = cgpc.cod_empresa ' +
                      ' where infe.grupo_prod = ' + inttostr(buscas.FieldByName('GRUPO_PROD').asinteger) +
                      ' and infe.cod_prod = ' + quotedstr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                      ' and nfe.natureza_nf = ''E'' ' +
                      ' and coalesce(nfe.status,'''') = ''Aberta'' ' + // and nfe.status <> ''Fechada'' ' +
                      ' and cgpc.cod_grade = ' + inttostr(buscas.FieldByName('COD_GRADE').asinteger) +
                      ' and nfe.cod_empresa = ' + vCodEmpresa +
                      ' and nfe.ativo = 1 '
                  end;
                end
                else
                begin
                  vSql :=
                  (*'select sum(infe.quant_item_nfe) as soma from nf_entrada nfe ' +
                    ' inner join item_nf_entrada infe ' +
                    ' on infe.num_nota_nfe = nfe.num_nota_nfe and infe.cod_forn_nfe = nfe.cod_forn_nfe ' +
                    ' and nfe.cod_empresa = infe.cod_empresa ' +
                    ' where infe.grupo_prod = ' + inttostr(buscas.FieldByName('Grupo_prod').asinteger) +
                    ' and infe.cod_prod = ' + quotedstr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                    ' and coalesce(nfe.status_nfe,'''')='''' ' + //nfe.status_nfe is null ' +
                    ' and nfe.cod_empresa = ' + vDadosIni.codEmpresa + ' and nfe.ativo = 1' +
                    ' union ' +*)
                    ' select sum(infe.quantidade) as soma from notafiscal nfe ' +
                    ' inner join notafiscal_item infe on infe.cod_nf = nfe.cod_nf and nfe.cod_empresa = infe.cod_empresa ' +
                    ' left join nat_op nt on nfe.codigo_nop = nt.codigo_nop '+
                    ' where infe.grupo_prod = ' + inttostr(buscas.FieldByName('GRUPO_PROD').asinteger) +
                    ' and infe.cod_prod = ' + quotedstr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                    ' and nfe.natureza_nf = ''E'' ' +
                    ' and coalesce(nfe.status,'''')=''Aberta'' ' +
                    ' and nt.devolucao <> ''S'' ' +
                    ' and nfe.cod_empresa = ' + vCodEmpresa +
                    ' and nfe.ativo = 1'
                end;
                SqlOpen(vSql, buscas3);
                vsmgrade := 0;
                buscas3.First;
                while not buscas3.eof do
                begin
                  vsmgrade := vsmgrade + buscas3.FieldByName('soma').AsFloat;
                
                  buscas3.next;
                end;
                GridSug.Cells[10, I] := format('%n', [vsmgrade]);
                GridSug.Cells[11, I] := format('%n', [buscas2.FieldByName('QUANT_ITEM_NFE').AsFloat]);

                buscas2.Next;
                vqtcmp := vqtcmp + 1;
                if vqtcmp > 3 then
                  break;
                Application.ProcessMessages;
              end;

              // Exibir vendas
              if checkmostrarultvnd.Checked then
              begin
                vSql := ' select first 1 vmes, vano, sum(vtot_venda-desconto) as valor_venda, ' +
                  ' sum(vqt) as vqt from vendasmeses4 ' +
                  ' where grupo_prod = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').asinteger) +
                  ' and cod_prod = ' + QuotedStr(trim(buscas.FieldByName('COD_PROD').asstring));

                if usarGrade then
                	if buscas.FieldByName('COD_GRADE').asinteger > 0 then
		                vSql := vSql + ' and cod_grade = ' + inttostr(buscas.FieldByName('COD_GRADE').asinteger);

                vSql := vSql +
                  ' and cod_empresa = ' + vCodEmpresa +
                  ' and ativo = 1 ' +
                  ' group by vano, vmes ' +
                  ' order by vano desc, vmes desc ';
                SqlOpen(vSql, buscas2);
                if not buscas2.isempty then
                begin
                 I := I + 1;
                 GridSug.cells[1, I] := 'VND ' + buscas.FieldByName('CLASSE_PROD').AsString;
                 GridSug.cells[2, I] := vDadosIni.StrZero(buscas2.FieldByName('VMES').AsString,2)+'/'+
                   vDadosIni.StrZero(buscas2.FieldByName('VANO').AsString,4);
                 GridSug.Cells[3, I] := buscas.FieldByName('GRUPO_PROD').AsString;
                 GridSug.Cells[4, I] := trim(buscas.FieldByName('COD_PROD').AsString);
                 GridSug.Cells[5, I] := format('%n', [buscas2.FieldByName('VALOR_VENDA').AsFloat]);
                 GridSug.Cells[11, I] := format('%n', [buscas2.FieldByName('VQT').AsFloat]);
                end;
              end;

              // Exibir transferencias
              if checktransf.Checked
              	and (vDadosIni.vSugCompra.vMultiempresa)
                and (Length(vCodEmpresas) > 1) then
              begin
                for J := 0 to Length(vCodEmpresas) - 1 do
                begin
                  if (buscas.FieldByName('COD_EMPRESA').AsInteger <> vCodEmpresas[J])
                    and (vQtdeTransf[J] > 0) then
                  begin
                    I := I + 1;
                    GridSug.cells[1, I] := 'TRF ' + IntToStr(vCodEmpresas[J]);
                    GridSug.cells[2, I] := FormatDateTime('DD/MM/YYYY', vDataBanco);
                    GridSug.Cells[3, I] := '';
                    if arredondavalor then
                      GridSug.Cells[4, I] := format('%0.0f', [EstEmp[J]])
                    else
                      GridSug.Cells[4, I] := format('%n', [EstEmp[J]]);

                    GridSug.Cells[5, I] := format('%n', [buscas.FieldByName('PREC_CUS_PROD').AsFloat]);

                    GridSug.Cells[8, I] := trim(vEmpresas[J]);
                    GridSug.Cells[11, I] := format('%n', [vQtdeTransf[J]]);
                    GridSug.cells[12, I] := buscas.FieldByName('GRUPO_PROD').asstring;
                    GridSug.cells[13, I] := buscas.FieldByName('COD_PROD').asstring;
                    GridSug.cells[14, I] := IntToStr(vCodEmpresas[J]);

                    vQtdeTransf[J] := 0;

                    if usarGrade then
                    begin
                      GridSug.Cells[15, I] := IntToStr(buscas.FieldByName('COD_GRADE').asinteger);
                      GridSug.Cells[16, I] := Trim(buscas.FieldByName('DESCRICAO').asstring);
                      GridSug.Cells[17, I] := Trim(buscas.FieldByName('DESCRICAO1').asstring);
                    end;
                  end;
                end;
              end;
            end;
          end;
          if Parar then
          begin
            ProgressBar.Position := 0;
            ProgressBar2.Position := 0;
            lb.Caption := 'Produto Analizado:';
            lb2.Caption := 'Produto Analizado:';

            result := false;
            Parar := false;
            exit;
          end;

          vGrupoTemp := buscas.FieldByName('GRUPO_PROD').AsInteger;
          vCodProdTemp := buscas.FieldByName('COD_PROD').AsString;
          vCodGradeTemp  := buscas.FieldByName('COD_GRADE').AsInteger;
          vCodEmpresaTemp := buscas.FieldByName('COD_EMPRESA').AsInteger;
          Lb.Caption := 'Contador: ' + inttostr(ProgressBar.Position + 1) + ' de ' + IntToStr(vqtdeReg) +
          	'      Produto Analizado: ' + buscas.FieldByName('Grupo_prod').asstring + '  ' + buscas.FieldByName('cod_prod').AsString;
          Lb2.Caption := 'Contador: ' + inttostr(ProgressBar2.Position + 1) + ' de ' + IntToStr(vqtdeReg) +
          	'      Produto Analizado: ' + buscas.FieldByName('Grupo_prod').asstring + '  ' + buscas.FieldByName('cod_prod').AsString;

          ProgressBar.Position := ProgressBar.Position + 1;
          ProgressBar2.Position := ProgressBar2.Position + 1;

          buscas.next;
          GridSug.RowCount := I + 1;

          GridSug.FixedCols := 1;
          if GridSug.RowCount > 1 then
				    GridSug.FixedRows := 1;
        end;

//        ProgressBar.Position := ProgressBar.Position + 1;
//        ProgressBar2.Position := ProgressBar2.Position + 1;
      	fTempGrupo.Next;
      end;
    finally
    	vEmpresasSugestao.dataSet.Filtered := false;
      vEmpresasSugestao.dataSet.First;
    end;
  except
  	on e: exception do
    begin
      result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
      ProgressBar.Position := 0;
      ProgressBar2.Position := 0;

  //    GridSug.Options := GridSug.Options + [goFixedVertLine];
  //    GridSug.Options := GridSug.Options + [goFixedHorzLine];

      lb.Caption := 'Produto Analizado:';
      lb2.Caption := 'Produto Analizado:';
      if obBuscaSugestao <> nil then
        obBuscaSugestao.buscas.Close;
      if obBuscaClasse <> nil then
        obBuscaClasse.buscas.Close;
      buscas.Close;
    end;
  end;
  ProgressBar.Position := 0;
  ProgressBar2.Position := 0;
  lb.Caption := 'Produto Analizado:';
  lb2.Caption := 'Produto Analizado:';
  if obBuscaSugestao <> nil then
    obBuscaSugestao.buscas.Close;
  if obBuscaClasse <> nil then
    obBuscaClasse.buscas.Close;
  buscas.Close;
end;

function TSugestao.existeGrade(pTipo: string = 'I'): boolean;
var
	vCodigosEmpresas: string;
begin
	if pTipo = 'I' then
  begin
    try
      vCodigosEmpresas := '';

      vEmpresasSugestao.dataSet.DisableControls;
      vEmpresasSugestao.IndexFieldNames := 'COD_EMPRESA';
      vEmpresasSugestao.dataSet.First;
      while not vEmpresasSugestao.dataSet.Eof do
      begin
      	if vEmpresasSugestao.dataSet.FieldByName('SEL').AsString = 'S' then
        begin
          if trim(vCodigosEmpresas) = '' then
            vCodigosEmpresas := IntToStr(vEmpresasSugestao.dataSet.FieldByName('cod_empresa').AsInteger)
          else
            vCodigosEmpresas := vCodigosEmpresas + ', ' + IntToStr(vEmpresasSugestao.dataSet.FieldByName('cod_empresa').AsInteger);
        end;

        vEmpresasSugestao.dataSet.Next;
      end;
    finally
      vEmpresasSugestao.dataSet.EnableControls;
    end;

    SqlOpen(' select first 1 cod_grade from cod_grade_prod ' +
      '	where cod_grade > 0 ' +
      ' and cod_empresa in (' + vCodigosEmpresas + ') ', buscas);
  end
  else
  begin
  	SqlOpen(' select first 1 cod_grade from sugestaocompraitens ' +
    	' where cod_sugestao = ' + IntToStr(dataSet.FieldByName('cod_sugestao').AsInteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and cod_grade > 0 ', buscas);
  end;

  Result := not buscas.IsEmpty;
end;

function TSugestao.existeTransf: boolean;
begin
	Result := false;
	SqlOpen(' select cod_sugestao, cod_empresa from sugestaocompra_transf ' +
    ' where cod_sugestao = ' + IntToStr(dataSet.FieldByName('COD_SUGESTAO').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa, buscas);
  Result := not buscas.IsEmpty;
end;

function TSugestao.filtrarPorEmpresa(pCodEmpresa: Integer): boolean;
var
	I: Integer;
begin
	try
  	fTempListaCotacao.EmptyDataSet;

  	fTempListaCotacaoOld.DisableControls;

    fTempListaCotacaoOld.Filtered := false;
    fTempListaCotacaoOld.Filter := 'COD_EMP_MULT = ' + IntToStr(pCodEmpresa);
    fTempListaCotacaoOld.Filtered := true;

    fTempListaCotacaoOld.First;
    while not fTempListaCotacaoOld.Eof do
    begin
    	if (fTempListaCotacaoOld.FieldByName('COD_EMP_MULT').AsInteger = pCodEmpresa) then// 	and (fTempListaCotacaoOld.FieldByName('QUANT_PROD').AsFloat > 0) then
      begin
        fTempListaCotacao.Insert;
        for I := 0 to fTempListaCotacaoOld.FieldCount - 1 do
          fTempListaCotacao.Fields[I].Value := fTempListaCotacaoOld.Fields[I].Value;
        fTempListaCotacao.Post;
      end;

    	fTempListaCotacaoOld.Next;
    end;
  finally
  	fTempListaCotacaoOld.Filtered := false;
  	fTempListaCotacaoOld.First;
    fTempListaCotacao.IndexFieldNames := 'GRUPO_PROD;COD_PROD;COD_EMP_MULT';
    fTempListaCotacao.First;
    fTempListaCotacaoOld.EnableControls;
  end;
end;

function TSugestao.filtrarPorEmpresaTransf(pCodEmpTrans,
  pCodEmpresa: Integer): boolean;
var
	I: Integer;
begin
	try
  	fTempListaCotacao.EmptyDataSet;

  	fTempListaCotacaoOld.DisableControls;

    fTempListaCotacaoOld.Filtered := false;
    fTempListaCotacaoOld.Filter := 'COD_EMP_TRANSF = ' + IntToStr(pCodEmpTrans) + ' AND COD_EMP_MULT = ' + IntToStr(pCodEmpresa);
    fTempListaCotacaoOld.Filtered := true;

    fTempListaCotacaoOld.First;
    while not fTempListaCotacaoOld.Eof do
    begin
    	if (fTempListaCotacaoOld.FieldByName('COD_EMP_TRANSF').AsInteger = pCodEmpTrans)
      	and (fTempListaCotacaoOld.FieldByName('COD_EMP_MULT').AsInteger = pCodEmpresa) then //and (fTempListaCotacaoOld.FieldByName('QUANT_PROD').AsFloat > 0) then
      begin
        fTempListaCotacao.Insert;
        for I := 0 to fTempListaCotacaoOld.FieldCount - 1 do
          fTempListaCotacao.Fields[I].Value := fTempListaCotacaoOld.Fields[I].Value;
        fTempListaCotacao.Post;
      end;

    	fTempListaCotacaoOld.Next;
    end;
  finally
  	fTempListaCotacaoOld.Filtered := false;
  	fTempListaCotacaoOld.First;
    fTempListaCotacao.IndexFieldNames := 'GRUPO_PROD;COD_PROD;COD_EMP_MULT';
    fTempListaCotacao.First;
    fTempListaCotacaoOld.EnableControls;
  end;
end;

function TSugestao.filtrarPorFornecedor(pCodFornecedor: Integer; pCodEmpresa: Integer): boolean;
var
	buscas2: TIBQuery;
	I: Integer;
begin
	Result := false;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

	fTempListaCotacao.EmptyDataSet;

  try
  	fTempListaCotacaoOld.DisableControls;

    fTempListaCotacaoOld.Filtered := false;
    fTempListaCotacaoOld.Filter := 'COD_EMP_MULT = ' + IntToStr(pCodEmpresa);
    fTempListaCotacaoOld.Filtered := true;
    
    fTempListaCotacaoOld.First;
    while not fTempListaCotacaoOld.Eof do
    begin
      if (fTempListaCotacaoOld.FieldByName('COD_EMP_MULT').AsInteger = pCodEmpresa) then //and (fTempListaCotacaoOld.FieldByName('QUANT_PROD').AsFloat > 0) then
      begin
        buscas2.Close;
        buscas2.SQL.Text := ' select distinct c.grupo_prod, c.cod_prod, c.cod_empresa from custos c ' +
          ' where c.grupo_prod = :grupo_prod ' +
          ' and c.cod_prod = :cod_prod ' +
          ' and c.cod_empresa = :cod_empresa ' +
          ' and c.fornec = :cod_fornecedor ' +
          ' and c.data >= (current_date - 365) ';
        buscas2.ParamByName('grupo_prod').AsInteger := fTempListaCotacaoOld.FieldByName('grupo_prod').AsInteger;
        buscas2.ParamByName('cod_prod').AsString := fTempListaCotacaoOld.FieldByName('cod_prod').AsString;
        buscas2.ParamByName('cod_empresa').AsInteger := pCodEmpresa;
        buscas2.ParamByName('cod_fornecedor').AsInteger := pCodFornecedor;
        buscas2.Open;

        if not buscas2.IsEmpty then
        begin
          fTempListaCotacao.Insert;
          for I := 0 to fTempListaCotacaoOld.FieldCount - 1 do
          	fTempListaCotacao.Fields[I].Value := fTempListaCotacaoOld.Fields[I].Value;
          fTempListaCotacao.Post;
        end;
      end;

      fTempListaCotacaoOld.Next;
    end;
  finally
  	fTempListaCotacaoOld.Filtered := false;
    fTempListaCotacaoOld.First;
    fTempListaCotacao.IndexFieldNames := 'GRUPO_PROD;COD_PROD;COD_EMP_MULT';
    fTempListaCotacao.First;
    fTempListaCotacaoOld.EnableControls;
  end;

  Result := true;
end;

procedure TSugestao.imprimirSugestao(vpar: arrayBi);
var
  i: integer;
begin
  inherited;
  try
    vpag := 0;
    linha := 2;
    RdpSug := dtmSugestaoCompras.RDprintSugestao;
    RdpSug.OpcoesPreview.CaptionPreview := 'Sugestão de Compra de Produtos';
    RdpSug.CaptionSetup := 'Configurar Impressão da Sugestão de Compra';
    RdpSug.TitulodoRelatorio := 'Sugestão de Compra de Produtos';
    vDadosIni._LimparVarSendEmail;
    RdpSug.OnSendMail := vDadosini._SendMailRdPrint;
    //    RdpSug.FonteTamanhoPadrao := S20cpp;
    if GridSug.RowCount > 1 then
    begin
      if not vDadosIni.ModImp(RdpSug) then
        exit;
      RdpSug.Abrir;
    end
    else
    begin
      Application.MessageBox(pchar('Sugestão de compra número ' + dataSet.FieldByName('COD_SUGESTAO').AsString + ' não possui itens'), 'Informação', MB_ICONEXCLAMATION + MB_OK);
      exit;
    end;
    novaPaginaPrint;
    for i := 1 to GridSug.RowCount - 1 do
    begin
      if (copy(GridSug.cells[1, I], 1, 3) = 'CMP') or (copy(GridSug.cells[1, I], 1, 3) = 'VND') or (copy(GridSug.cells[1, I], 1, 3) = 'TRF') then
      begin
        RdpSug.Imp(linha, 1, GridSug.cells[1, I]);
        RdpSug.Imp(linha, 12, GridSug.cells[2, I]);
        RdpSug.Imp(linha, 28, GridSug.cells[5, I]);
        RdpSug.Imp(linha, 57, GridSug.cells[6, I]); //num nf
        RdpSug.Imp(linha, 65, copy(GridSug.cells[8, I], 1, 41)); //fornecedor
        RdpSug.ImpD(linha, 120, GridSug.cells[10, I], [comp17]); //transito
        //        if dataSet.FieldByName('USODEGRADE').AsString = 'S' then
        RdpSug.ImpD(linha, 128, GridSug.cells[11, I], [comp17]); //Qtd intem na nfe

        if (copy(GridSug.cells[1, I + 1], 1, 3) = 'CMP') or (copy(GridSug.cells[1, I + 1], 1, 3) = 'VND') or (copy(GridSug.cells[1, I + 1], 1, 3) = 'TRF') then
          linha := linha + 1
        else
          linha := linha + 2;
      end
      else if (copy(GridSug.cells[1, I], 1, 3) = 'EMP') then
      begin
        RdpSug.Imp(linha, 1, GridSug.cells[1, I] + ' ' + GridSug.cells[2, I]);
        if GridSug.Cells[0, I] = 'S' then
          RdpSug.Imp(linha, 09, '*S*');
        RdpSug.Imp(linha, 12, GridSug.cells[3, I]);
        RdpSug.Imp(linha, 28, GridSug.cells[4, I]); //est atual
        RdpSug.Imp(linha, 36, GridSug.cells[5, I]); //media
        RdpSug.Imp(linha, 43, GridSug.cells[6, I]); //sug
        RdpSug.Imp(linha, 50, GridSug.cells[7, I]); //sug
        RdpSug.Imp(linha, 57, GridSug.cells[10, I]); //qtd pend
        RdpSug.Imp(linha, 65, GridSug.cells[8, I]); //classe

        if (copy(GridSug.cells[1, I + 1], 1, 3) <> 'CMP')
        	and (copy(GridSug.cells[1, I + 1], 1, 3) <> 'VND')
          and (copy(GridSug.cells[1, I + 1], 1, 3) <> 'TRF') then
        begin
          linha := linha + 2;
        end
        else
          linha := linha + 1;
      end
      else
      begin
        RdpSug.Imp(linha, 1, GridSug.cells[1, I] + ' ' + GridSug.cells[2, I]);
        if GridSug.Cells[0, I] = 'S' then
          RdpSug.Imp(linha, 09, '*S*');
        RdpSug.Imp(linha, 12, GridSug.cells[3, I]);
        RdpSug.Imp(linha, 28, GridSug.cells[4, I]); //est atual
        RdpSug.Imp(linha, 36, GridSug.cells[5, I]); //media
        RdpSug.Imp(linha, 43, GridSug.cells[6, I]); //transf
        RdpSug.Imp(linha, 50, GridSug.cells[7, I]); //sug
        RdpSug.Imp(linha, 57, GridSug.cells[10, I]); //qtde pend
        RdpSug.Imp(linha, 65, GridSug.cells[8, I]); //classe
        if GridSug.cells[15, I] <> '' then
        begin
         RdpSug.ImpF(linha, 85, copy(GridSug.cells[11, I], 1, 22), [comp17]);
         RdpSug.ImpF(linha, 108, GridSug.cells[15, I], [comp17]);
         RdpSug.ImpF(linha, 115, copy(GridSug.cells[16, I], 1, 13), [comp17]);
         RdpSug.ImpF(linha, 129, copy(GridSug.cells[17, I], 1, 13), [comp17]);
        end
        else
         RdpSug.ImpF(linha, 85, copy(GridSug.cells[11, I], 1, 45), [comp17]);

        if (copy(GridSug.cells[1, I + 1], 1, 3) <> 'CMP')
        	and (copy(GridSug.cells[1, I + 1], 1, 3) <> 'VND')
          and (copy(GridSug.cells[1, I + 1], 1, 3) <> 'TRF') then
        begin
          linha := linha + 2;
        end
        else
          linha := linha + 1;
      end;
      if linha >= 59 then
      begin
        linha := 1;
        RdpSug.Novapagina;
        novaPaginaPrint;
      end;
    end;
    if linha >= 59 then
    begin
      linha := 1;
      RdpSug.Novapagina;
      novaPaginaPrint;
    end;
    linha := linha + 2;
    RdpSug.Imp(linha, 1, '------CONFIGURAÇÕES PADRÕES/BÁSICAS DE GERAÇÃO DA SUGESTÃO DE COMPRA-------');
    linha := linha + 1;
    if linha >= 59 then
    begin
      linha := 1;
      RdpSug.Novapagina;
      novaPaginaPrint;
    end;
    RdpSug.Imp(linha, 1, 'QTDE MÊS DE ANÁLISE: ' + vDadosIni.StrZero(QtdMesEmpresa, 2));
    linha := linha + 1;
    if linha >= 59 then
    begin
      linha := 1;
      RdpSug.Novapagina;
      novaPaginaPrint;
    end;
    RdpSug.Imp(linha, 1, 'TEMPO PROCESSAMENTO: ' + vDadosIni.StrZero(TpProcessamento, 2));
    linha := linha + 1;
    if linha >= 59 then
    begin
      linha := 1;
      RdpSug.Novapagina;
      novaPaginaPrint;
    end;
    RdpSug.Imp(linha, 1, 'TEMPO DE ENTREGA...: ' + vDadosIni.StrZero(TpEntrega, 2));
    linha := linha + 1;
    if linha >= 59 then
    begin
      linha := 1;
      RdpSug.Novapagina;
      novaPaginaPrint;
    end;
    RdpSug.Imp(linha, 1, 'TEMPO DE ALOCAÇÃO..: ' + vDadosIni.StrZero(TpAlocacao, 2));
    linha := linha + 1;
    if linha >= 59 then
    begin
      linha := 1;
      RdpSug.Novapagina;
      novaPaginaPrint;
    end;
    RdpSug.Imp(linha, 1, 'FREQUENCIA PEDIDO..: ' + vDadosIni.StrZero(FreqPedido, 2));
    linha := linha + 1;
    if linha >= 59 then
    begin
      linha := 1;
      RdpSug.Novapagina;
      novaPaginaPrint;
    end;
    RdpSug.Imp(linha, 1, 'ESTOQUE SEGURANÇA(%) ' + vDadosIni.StrZero(vestsegsug, 2));
    linha:=linha+1;
    // Colocar aqui as outras configurações

    for i := 0 to Length(vpar)-1  do
    begin
     RdpSug.Imp(linha, 1, vpar[i,0]+vpar[i,1]);
     linha:=linha+1;
     if linha >= 59 then
     begin
      linha := 1;
      RdpSug.Novapagina;
      novaPaginaPrint;
     end;
    end;
  finally
    if RdpSug.EstaAberto then
      RdpSug.Fechar;
  end;
end;

function TSugestao.insert: boolean;
begin
  pListas := '';
  pQuantLista := 0;
  abreSugestao(true);
  abreGrupoI;
  abreGrupoF;
  abreSGrupoI;
  abreSGrupoF;
  abreGradeI;
  abreGradeF;
  abreMarcas;
end;

procedure TSugestao.LimpaSugestao;
var
  i, j: integer;
begin
  if GridSug <> nil then
  begin
    for J := 2 to GridSug.RowCount do
      for I := 0 to GridSug.ColCount do
      begin
        GridSug.Cells[I, J] := '';
      end;
//    GridSug.FixedColor := TColor($00FFEBD9);
    //    GridSug.FixedCols := 1;
    //    GridSug.FixedRows := 1;
  end;
end;

function TSugestao.localizaCodigo(tabela, codido: string; codempresa: integer = 0): integer;
var
  codPesq: integer;
begin
  try
    strtoint(codido);
    if UpperCase(tabela) = 'COND_PAG' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select COD_COND_PAG from cond_pag where COD_COND_PAG=' + trim(codido) +
        ' and ativo=1';
      buscas.Open;
      result := buscas.FieldByName('COD_COND_PAG').AsInteger;
    end
    else if UpperCase(tabela) = 'GRUPOS' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select CODIGO_GRUP from grupos where CODIGO_GRUP=' + trim(codido) +
        ' and ativo=1';
      buscas.Open;
      result := buscas.FieldByName('CODIGO_GRUP').AsInteger;
    end
    else if UpperCase(tabela) = 'SUB_GRUPO' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select CODIGO_SUBGR from SUB_GRUPO where CODIGO_SUBGR=' + trim(codido) +
        ' and ativo=1';
      buscas.Open;
      result := buscas.FieldByName('CODIGO_SUBGR').AsInteger;
    end
    else if UpperCase(tabela) = 'GRADE' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select COD_GRADE from GRADE where COD_GRADE=' + trim(codido) +
        ' and ativo=1 and cod_empresa=' + vDadosIni.codEmpresa;
      buscas.Open;
      result := buscas.FieldByName('COD_GRADE').AsInteger;
    end
    else if UpperCase(tabela) = 'MARCA_PROD' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select COD_MARCA from MARCA_PROD where COD_MARCA=' + trim(codido) +
        ' and ativo=1';
      buscas.Open;
      result := buscas.FieldByName('COD_MARCA').AsInteger;
    end
    else if UpperCase(tabela) = 'EMPRESA' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select COD_EMPRESA from empresa where COD_EMPRESA=' + trim(codido) +
        ' and ativo=1';
      buscas.Open;
      result := buscas.FieldByName('COD_EMPRESA').AsInteger;
    end
    else if UpperCase(tabela) = 'CLIENTES' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select COD_CLIENTE from clientes where COD_CLIENTE =' + trim(codido) + ' and COD_EMPRESA =' + inttostr(codempresa) +
        ' and ativo=1';
      buscas.Open;
      result := buscas.FieldByName('COD_CLIENTE').AsInteger;
    end
    else if UpperCase(tabela) = 'COLABORADOR' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select COD_VENDEDOR from colaborador where COD_VENDEDOR =' + trim(codido) + ' and COD_EMPRESA =' + inttostr(codempresa) +
        ' and ativo=1';
      buscas.Open;
      result := buscas.FieldByName('COD_VENDEDOR').AsInteger;
    end;
  except
    result := 0;
  end;
end;

function TSugestao.localizarSugestaoProdutos(pGrupoProd: Integer; pCodProd,
  pNumFabr, pDescrProd: string): boolean;
var
	buscas2: TIBQuery;
begin
	Result := false;
  
	buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  buscas2.Close;
  buscas2.SQL.Text := ' select sg.grupo_prod, sg.cod_prod, sg.cod_emp_mult, pr.num_fab_prod, pr.descr_prod from sugestaocompraitens sg ' +
  	' inner join produtos pr on pr.grupo_prod = sg.grupo_prod and pr.cod_prod = sg.cod_prod and pr.cod_empresa = sg.cod_empresa ' +
  	' where sg.cod_sugestao = ' + IntToStr(dataSet.FieldByName('cod_sugestao').AsInteger) +
    ' and sg.cod_empresa = ' + vDadosIni.codEmpresa;

  if pGrupoProd > 0 then
	  buscas2.SQL.Text := buscas2.SQL.Text + ' and sg.grupo_prod = ' + IntToStr(pGrupoProd);

  if trim(pCodProd) <> '' then
  	buscas2.SQL.Text := buscas2.SQL.Text + ' and sg.cod_prod = ' + QuotedStr(Trim(pCodProd));

  if trim(pNumFabr) <> '' then
  	buscas2.SQL.Text := buscas2.SQL.Text + ' and pr.num_fab_prod like ' + QuotedStr('%' + Trim(pNumFabr) + '%');

  if trim(pDescrProd) <> '' then
  	buscas2.SQL.Text := buscas2.SQL.Text + ' and pr.descr_prod like ' + QuotedStr('%' + Trim(pDescrProd) + '%');

  buscas2.Open;

  if not buscas2.IsEmpty then
  begin
  	Result := true;

  	try
    	fTempListaCotacao.DisableControls;
	  	fTempListaCotacao.First;
      while not fTempListaCotacao.Eof do
      begin
      	if (fTempListaCotacao.FieldByName('grupo_prod').AsInteger = buscas2.FieldByName('grupo_prod').AsInteger)
        	and (trim(fTempListaCotacao.FieldByName('cod_prod').AsString) = trim(buscas2.FieldByName('cod_prod').AsString))
          and (fTempListaCotacao.FieldByName('cod_emp_mult').AsInteger = buscas2.FieldByName('cod_emp_mult').AsInteger) then
          	break;

      	fTempListaCotacao.Next;
      end;
    finally
      fTempListaCotacao.EnableControls;
    end;
  end;
end;

procedure TSugestao.marcaDesmarcaLinha;
begin
 if fTempListaCotacao.IsEmpty then
   exit;

  fTempListaCotacao.Edit;
  if fTempListaCotacao.FieldByName('SEL').AsString = 'S' then
    fTempListaCotacao.FieldByName('SEL').AsString := ''
  else
    fTempListaCotacao.FieldByName('SEL').AsString := 'S';
  fTempListaCotacao.Post;
end;

procedure TSugestao.marcaDesmarcaLinhaDtTemp(pDataSet: TDataSet);
begin
	if pDataSet.IsEmpty then
   exit;

  pDataSet.Edit;
  if pDataSet.FieldByName('SEL').AsString = 'S' then
    pDataSet.FieldByName('SEL').AsString := ''
  else
    pDataSet.FieldByName('SEL').AsString := 'S';
  pDataSet.Post;
end;

procedure TSugestao.MarcarDesmarTodosDtTemp(pDataSet: TDataSet;
  pMarca: boolean);
begin
	if pDataSet.IsEmpty then
   exit;

  try
  	pDataSet.DisableControls;
    pDataSet.First;
    while not pDataSet.Eof do
    begin
      pDataSet.Edit;
      if not pMarca then
        pDataSet.FieldByName('SEL').AsString := ''
      else
        pDataSet.FieldByName('SEL').AsString := 'S';
      pDataSet.Post;

      pDataSet.Next;
    end;
  finally
    pDataSet.First;
    pDataSet.EnableControls;
  end;
end;

procedure TSugestao.MarcarDesmarTodosItemSugestao(pMarca: boolean);
var
	i: Integer;
begin
	for i := 1 to GridSug.RowCount - 1 do
  begin
    if (copy(GridSug.Cells[1, i], 1, 3) <> 'CMP')	and (copy(GridSug.Cells[1, i], 1, 3) <> 'VND') then
    begin
      if (Trim(GridSug.Cells[2, i]) <> '')
        or (Trim(GridSug.Cells[12, i]) <> '') then
      begin
//        if GridSug.cells[7, i] = '0' then
//  //        Application.MessageBox(Pchar('Produto não pode ser selecionado pois' + chr(13) + ' está com a sugestão de compra igual a zero.'), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)
//        else
//        begin
          if pMarca then
            GridSug.cells[9, i] := 'SEL'
          else
            GridSug.cells[9, i] := '';
//        end;
      end;
    end;
  end;
end;

procedure TSugestao.montarCheckListBoxTipV(pCheckListBox1: TCheckListBox);
begin
	pCheckListBox1.Clear;

  buscas.Close;
  buscas.SQL.Text := ' select coalesce(descricao, '''') tipv from tipo_vendas ' +
  	' where tipo = ''REQ'' ';
  buscas.Open;

  buscas.First;
  while not buscas.Eof do
  begin
    pCheckListBox1.Items.Add(buscas.FieldByName('tipv').AsString);

    buscas.Next;
  end;
end;

function TSugestao.montarDadosPedidoCompra(pFiltrarEmpresas: boolean; pFiltrarProdutos: boolean;
	pCodEmpresa: Integer;	pCodFornec: Integer;
  pCodVendedor: Integer; pCodCondPag: Integer; pTipoPed: string): boolean;
var
	buscas2: TIBQuery;
	vPedido: TPedidoCompra;
  vDataBanco: TDate;
  vCodMax: Integer;
  vTotPedido: Double;
  vNitem: Integer;
begin
	Result := false;

  buscas2 := TIBQuery.Create(Application);
  buscas2.Database := buscas.Database;
  buscas2.Transaction := buscas.Transaction;

  vDadosIni.fTempPedidoCompra.EmptyDataSet;
  vDadosIni.fTempItemPedidoCompra.EmptyDataSet;

  if (not pFiltrarEmpresas) and (not pFiltrarProdutos) then
  begin
  	buscas2.Close;
    if vDadosIni.cod_empresa = pCodEmpresa then
    begin
      buscas2.SQL.Text := ' select cl.cod_cliente, cl.cod_empresa, cl.nome_cliente, cl.razao, cl.cpfcgc from clientes cl ' +
        ' where cl.cod_cliente = :cod_cliente ' +
        ' and cl.cod_empresa = :cod_empresa ';
      buscas2.ParamByName('COD_CLIENTE').AsInteger := pCodFornec;
    end
    else 
    begin
    	buscas2.SQL.Text := ' select cl.cod_cliente, cl.cod_empresa, cl.nome_cliente, cl.razao, cl.cpfcgc from clientes cl ' +
        ' where cl.cpfcgc in (select cl1.cpfcgc from clientes cl1 ' +
        '                     where cl1.cod_cliente = :cod_cliente ' +
        '											and cl1.cod_empresa = :cod_empresa1) ' +
        ' and cl.cod_empresa = :cod_empresa ';
      buscas2.ParamByName('COD_CLIENTE').AsInteger := pCodFornec;
      buscas2.ParamByName('COD_EMPRESA1').AsInteger := pCodEmpresa;
    end;
    buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas2.Open;

    if buscas2.IsEmpty then
    begin
    	buscas2.Close;
    	buscas2.SQL.Text := ' select cl.cod_cliente, cl.cod_empresa, cl.nome_cliente, cl.razao, cl.cpfcgc from clientes cl ' +
        ' where cl.cod_cliente = :cod_cliente ' +
        ' and cl.cod_empresa = :cod_empresa ';
      buscas2.ParamByName('COD_CLIENTE').AsInteger := pCodFornec;
      buscas2.ParamByName('COD_EMPRESA').AsInteger := pCodEmpresa;
      buscas2.Open;

    	Application.MessageBox(Pchar('Fornecedor não encontrado na empresa: ' + #13 + #13 +
      	'Cod Empresa: ' + vDadosIni.codEmpresa + #13 +
        'Empresa: ' + vDadosIni.vEmp.vnomeEmpresa + #13 +
        'CNPJ Empresa: ' + vDadosIni.vEmp.vCNPJ + #13 + #13 +
      	'Nome Fantasia (Fornecedor): ' + trim(buscas2.FieldByName('NOME_CLIENTE').AsString) + #13 +
        'Razão Social (Fornecedor): ' + trim(buscas2.FieldByName('RAZAO').AsString) + #13 +
        'CNPJ/CPF: ' + buscas2.FieldByName('CPFCGC').AsString + #13 + #13 +
        'Favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    	Result := False;
      exit;
    end;

    if not vDadosIni._mdiAberto('TfrmCadPedidoCompra', 'Cadastro do pedido de compra ja esta aberto, o pedido de compra sera gerado favor entrar no cadastro e verificar') then
    begin
    	vPedidoAberto := true;
      
    	vCodPedido := Gencodigo('PEDIDO', buscas2, vDadosIni.codEmpresa);

      SqlOpen(' select max(num_ped) from pedido ' +
        ' where cod_empresa = ' + vDadosIni.codEmpresa, buscas2);
      vCodMax := buscas2.FieldByName('max').AsInteger;

      if (vCodMax > vCodPedido) then
      begin
        SqlExec(' update codigo set valor = ' + IntToStr(vCodMax) +
          ' where tabela = ''PEDIDO'' and cod_empresa = ' + vDadosIni.codEmpresa, buscas2);

        vCodPedido     := Gencodigo('PEDIDO', buscas2, vDadosIni.codEmpresa);
      end;

      vCodPedidos := vCodPedidos + vDadosIni.IfThen(trim(vCodPedidos) <> '', ', ', '') + IntToStr(vCodPedido);
    	try
        vDadosIni.abreStatusProcessamento('', 'Criando pedido de compra nº ' + IntToStr(vCodPedido) + ' - Emp ' + vDadosIni.codEmpresa);

        vDataBanco := vDadosIni.getDataBanco(buscas2);
        vTotPedido := 0;

        try
          fTempListaCotacao.DisableControls;
          fTempListaCotacao.First;
          while not fTempListaCotacao.Eof do
          begin
            if fTempListaCotacao.FieldByName('SEL').AsString = 'S' then
            begin
              buscas2.Close;
              buscas2.SQL.Text := ' select pr.grupo_prod, pr.cod_prod, pr.cod_empresa, ' +
              	' pr.num_fab_prod, pr.descr_prod, pr.prec_cus_prod, ' +
                ' pr.vl_ult_compra, pr.prec_cusm_prod, pr.custo_honda, pr.prec_tab_prod from produtos pr ' +
                ' where pr.grupo_prod = :grupo_prod ' +
                ' and pr.cod_prod = :cod_prod ' +
                ' and pr.cod_empresa = :cod_empresa ';
              buscas2.ParamByName('GRUPO_PROD').AsInteger := fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger;
              buscas2.ParamByName('COD_PROD').AsString := fTempListaCotacao.FieldByName('COD_PROD').AsString;
              buscas2.ParamByName('COD_EMPRESA').AsInteger := fTempListaCotacao.FieldByName('COD_EMP_MULT').AsInteger;
              buscas2.Open;

              try
              	vDadosIni.fTempItemPedidoCompra.Filtered := false;
                vDadosIni.fTempItemPedidoCompra.Filter := 'GRUPO_PROD = ' + IntToStr(fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger) +
                  ' AND COD_PROD = ' + QuotedStr(Trim(fTempListaCotacao.FieldByName('COD_PROD').AsString)) +
                  ' AND COD_GRADE = ' + IntToStr(fTempListaCotacao.FieldByName('COD_GRADE').AsInteger) +
                  ' AND COD_EMP_MULT = ' + IntToStr(fTempListaCotacao.FieldByName('COD_EMP_MULT').AsInteger);
                vDadosIni.fTempItemPedidoCompra.Filtered := true;

                if vDadosIni.fTempItemPedidoCompra.IsEmpty then
                begin
                  vDadosIni.fTempItemPedidoCompra.Insert;
                  vDadosIni.fTempItemPedidoCompra.FieldByName('GRUPO_PROD').AsInteger := fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger;
                  vDadosIni.fTempItemPedidoCompra.FieldByName('COD_PROD').AsString := fTempListaCotacao.FieldByName('COD_PROD').AsString;
                  vDadosIni.fTempItemPedidoCompra.FieldByName('COD_EMPRESA').AsInteger := pCodEmpresa;
                  vDadosIni.fTempItemPedidoCompra.FieldByName('COD_GRADE').AsInteger := fTempListaCotacao.FieldByName('COD_GRADE').AsInteger;
                  vDadosIni.fTempItemPedidoCompra.FieldByName('COD_SUGESTAO').AsInteger := dataSet.FieldByName('COD_SUGESTAO').AsInteger;
                  vDadosIni.fTempItemPedidoCompra.FieldByName('COD_EMP_MULT').AsInteger := fTempListaCotacao.FieldByName('COD_EMP_MULT').AsInteger;
                  vDadosIni.fTempItemPedidoCompra.FieldByName('DESCR_PROD').AsString := Copy(trim(buscas2.FieldByName('DESCR_PROD').AsString), 1, 60);
                  vDadosIni.fTempItemPedidoCompra.FieldByName('QUANT_IT_PROD').AsFloat := fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat;

                  if vDadosIni.vEmp.vConcess = 'S' then
                    vDadosIni.fTempItemPedidoCompra.FieldByName('VALOR').AsFloat := buscas2.FieldByName('CUSTO_HONDA').AsFloat
                  else
                  begin
                    if buscas2.FieldByName('VL_ULT_COMPRA').AsFloat = 0 then
                      vDadosIni.fTempItemPedidoCompra.FieldByName('VALOR').AsFloat := buscas2.FieldByName('PREC_CUS_PROD').AsFloat
                    else
                      vDadosIni.fTempItemPedidoCompra.FieldByName('VALOR').AsFloat := buscas2.FieldByName('VL_ULT_COMPRA').AsFloat;
                  end;
                end
                else
                begin
                	vDadosIni.fTempItemPedidoCompra.Edit;
                  vDadosIni.fTempItemPedidoCompra.FieldByName('QUANT_IT_PROD').AsFloat :=
                  	vDadosIni.fTempItemPedidoCompra.FieldByName('QUANT_IT_PROD').AsFloat + vDadosIni.fTempItemPedidoCompra.FieldByName('VALOR').AsFloat;
                end;
                vDadosIni.fTempItemPedidoCompra.Post;
              finally
                vDadosIni.fTempItemPedidoCompra.Filtered := false;
              end;
            end;

            fTempListaCotacao.Next;
          end;
        finally
          fTempListaCotacao.First;
          fTempListaCotacao.EnableControls;
          fTempListaCotacao.IndexFieldNames := 'GRUPO_PROD;COD_PROD';
        end;

        try
          vDadosIni.fTempItemPedidoCompra.DisableControls;
          vDadosIni.fTempItemPedidoCompra.First;
          while not vDadosIni.fTempItemPedidoCompra.Eof do
          begin
          	vTotPedido := vTotPedido +
            	(vDadosIni.fTempItemPedidoCompra.FieldByName('QUANT_IT_PROD').AsFloat * vDadosIni.fTempItemPedidoCompra.FieldByName('VALOR').AsFloat);

            vDadosIni.fTempItemPedidoCompra.Next;
          end;
        finally
          vDadosIni.fTempItemPedidoCompra.First;
          vDadosIni.fTempItemPedidoCompra.EnableControls;
        end;

        buscas2.Close;
        buscas2.SQL.Text := ' INSERT INTO PEDIDO ' +
          ' (NUM_PED, COD_EMPRESA, CODIGO_F, COD_VENDEDOR, DATA_PED, DATA_ENV_PED, TIPO_PED, ' +
          ' STATUS_PED, DATA_CHG_PED, VAL_TOT_PED, ATIVO, COD_COND_PAG) ' +
          ' VALUES (:NUM_PED, :COD_EMPRESA, :CODIGO_F, :COD_VENDEDOR, :DATA_PED, :DATA_ENV_PED, :TIPO_PED, ' +
          ' :STATUS_PED, :DATA_CHG_PED, :VAL_TOT_PED, :ATIVO, :COD_COND_PAG); ';
        buscas2.ParamByName('NUM_PED').AsInteger := vCodPedido;
        buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
        buscas2.ParamByName('CODIGO_F').AsInteger := pCodFornec;
        buscas2.ParamByName('COD_VENDEDOR').AsInteger := pCodVendedor;
        buscas2.ParamByName('DATA_PED').AsDate := vDataBanco;
        buscas2.ParamByName('DATA_ENV_PED').AsDate := vDataBanco;
        buscas2.ParamByName('TIPO_PED').AsString := pTipoPed;
        if vDadosIni.vSugCompra.vPedidoEfetivado then
	        buscas2.ParamByName('STATUS_PED').AsString := 'EFETIVADO'
        else
        	buscas2.ParamByName('STATUS_PED').Value := Null;
        buscas2.ParamByName('DATA_CHG_PED').Value := null;
        buscas2.ParamByName('VAL_TOT_PED').AsFloat := vTotPedido;
        buscas2.ParamByName('ATIVO').AsInteger := 1;
        buscas2.ParamByName('COD_COND_PAG').AsInteger := pCodCondPag;
        buscas2.ExecSQL;

        try
          vnitem := 0;
          vDadosIni.fTempItemPedidoCompra.DisableControls;
          vDadosIni.fTempItemPedidoCompra.First;
          while not vDadosIni.fTempItemPedidoCompra.Eof do
          begin
            Inc(vnitem);

            buscas2.Close;
            buscas2.SQL.Text := ' INSERT INTO ITEM_PEDIDO ' +
              ' (NUM_PED, GRUPO_PROD, COD_PROD, COD_EMPRESA, '+
              ' QUANT_IT_PROD, QUANT_PEN_IT, QUANT_MIN_IT, ' +
              ' VAL_UNT_IT, VAL_TOT_IT, VL_V_EMP, VL_V_HONDA, ' +
              ' ATIVO, NITEM, DESCR_PROD, COD_GRADE, COD_SUGESTAO, COD_EMP_MULT) ' +
              ' VALUES (:NUM_PED, :GRUPO_PROD, :COD_PROD, :COD_EMPRESA, '+
              ' :QUANT_IT_PROD, :QUANT_PEN_IT, :QUANT_MIN_IT, ' +
              ' :VAL_UNT_IT, :VAL_TOT_IT, :VL_V_EMP, :VL_V_HONDA, ' +
              ' :ATIVO, :NITEM, :DESCR_PROD, :COD_GRADE, :COD_SUGESTAO, :COD_EMP_MULT) ';
            buscas2.ParamByName('NUM_PED').AsInteger := vCodPedido;
            buscas2.ParamByName('GRUPO_PROD').AsInteger := vDadosIni.fTempItemPedidoCompra.FieldByName('GRUPO_PROD').AsInteger;
            buscas2.ParamByName('COD_PROD').AsString := vDadosIni.fTempItemPedidoCompra.FieldByName('COD_PROD').AsString;
            buscas2.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
            buscas2.ParamByName('QUANT_IT_PROD').AsFloat := vDadosIni.fTempItemPedidoCompra.FieldByName('QUANT_IT_PROD').AsFloat;
            buscas2.ParamByName('QUANT_PEN_IT').AsFloat := 0;
            buscas2.ParamByName('QUANT_MIN_IT').AsFloat := 0;
            buscas2.ParamByName('VAL_UNT_IT').AsFloat := vDadosIni.fTempItemPedidoCompra.FieldByName('VALOR').AsFloat;
            buscas2.ParamByName('VAL_TOT_IT').AsFloat := vDadosIni.fTempItemPedidoCompra.FieldByName('QUANT_IT_PROD').AsFloat * vDadosIni.fTempItemPedidoCompra.FieldByName('VALOR').AsFloat;
            buscas2.ParamByName('VL_V_EMP').AsFloat := 0;
            buscas2.ParamByName('VL_V_HONDA').AsFloat := 0;
            buscas2.ParamByName('ATIVO').AsFloat := 1;
            buscas2.ParamByName('NITEM').AsFloat := vnitem;
            buscas2.ParamByName('DESCR_PROD').AsString := Copy(trim(vDadosIni.fTempItemPedidoCompra.FieldByName('DESCR_PROD').AsString), 1, 60);
            buscas2.ParamByName('COD_GRADE').AsInteger := vDadosIni.fTempItemPedidoCompra.FieldByName('COD_GRADE').AsInteger;
            buscas2.ParamByName('COD_SUGESTAO').AsInteger := dataSet.FieldByName('COD_SUGESTAO').AsInteger;
            buscas2.ParamByName('COD_EMP_MULT').AsInteger := vDadosIni.fTempItemPedidoCompra.FieldByName('COD_EMP_MULT').AsInteger;
            buscas2.ExecSQL;

            vDadosIni.fTempItemPedidoCompra.Next;
          end;

          if buscas2.Transaction.InTransaction then
            buscas2.Transaction.Commit;
        finally
          vDadosIni.fTempItemPedidoCompra.First;
          vDadosIni.fTempItemPedidoCompra.EnableControls;
        end;
      finally
        vDadosIni.fechaStatusProcessamento;
      end;
    end
    else
    begin
      vDadosIni.fTempPedidoCompra.Insert;
      vDadosIni.fTempPedidoCompra.FieldByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
      vDadosIni.fTempPedidoCompra.FieldByName('CODIGO_F').AsInteger := buscas2.FieldByName('COD_CLIENTE').AsInteger;
      vDadosIni.fTempPedidoCompra.FieldByName('COD_VENDEDOR').AsInteger := pCodVendedor;
      vDadosIni.fTempPedidoCompra.FieldByName('COD_COND_PAG').AsInteger := pCodCondPag;
      vDadosIni.fTempPedidoCompra.FieldByName('TIPO_PED').AsString := pTipoPed;
      vDadosIni.fTempPedidoCompra.Post;

      try
        fTempListaCotacao.DisableControls;
        fTempListaCotacao.First;
        while not fTempListaCotacao.Eof do
        begin
          if fTempListaCotacao.FieldByName('SEL').AsString = 'S' then
          begin
            buscas2.Close;
            buscas2.SQL.Text := ' select pr.grupo_prod, pr.cod_prod, pr.cod_empresa, ' +
              ' pr.num_fab_prod, pr.descr_prod, pr.prec_cus_prod, ' +
              ' pr.vl_ult_compra, pr.prec_cusm_prod, pr.custo_honda, pr.prec_tab_prod from produtos pr ' +
              ' where pr.grupo_prod = :grupo_prod ' +
              ' and pr.cod_prod = :cod_prod ' +
              ' and pr.cod_empresa = :cod_empresa ';
            buscas2.ParamByName('GRUPO_PROD').AsInteger := fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger;
            buscas2.ParamByName('COD_PROD').AsString := fTempListaCotacao.FieldByName('COD_PROD').AsString;
            buscas2.ParamByName('COD_EMPRESA').AsInteger := pCodEmpresa;
            buscas2.Open;

            try
              vDadosIni.fTempItemPedidoCompra.Filtered := false;
              vDadosIni.fTempItemPedidoCompra.Filter := 'GRUPO_PROD = ' + IntToStr(fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger) +
                ' AND COD_PROD = ' + QuotedStr(Trim(fTempListaCotacao.FieldByName('COD_PROD').AsString)) +
                ' AND COD_GRADE = ' + IntToStr(fTempListaCotacao.FieldByName('COD_GRADE').AsInteger) +
                ' AND COD_EMP_MULT = ' + IntToStr(fTempListaCotacao.FieldByName('COD_EMP_MULT').AsInteger);
              vDadosIni.fTempItemPedidoCompra.Filtered := true;

              if vDadosIni.fTempItemPedidoCompra.IsEmpty then
              begin
                vDadosIni.fTempItemPedidoCompra.Insert;
                vDadosIni.fTempItemPedidoCompra.FieldByName('GRUPO_PROD').AsInteger := fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger;
                vDadosIni.fTempItemPedidoCompra.FieldByName('COD_PROD').AsString := fTempListaCotacao.FieldByName('COD_PROD').AsString;
                vDadosIni.fTempItemPedidoCompra.FieldByName('COD_EMPRESA').AsInteger := pCodEmpresa;
                vDadosIni.fTempItemPedidoCompra.FieldByName('COD_GRADE').AsInteger := fTempListaCotacao.FieldByName('COD_GRADE').AsInteger;
                vDadosIni.fTempItemPedidoCompra.FieldByName('COD_SUGESTAO').AsInteger := dataSet.FieldByName('COD_SUGESTAO').AsInteger;
                vDadosIni.fTempItemPedidoCompra.FieldByName('COD_EMP_MULT').AsInteger := fTempListaCotacao.FieldByName('COD_EMP_MULT').AsInteger;
                vDadosIni.fTempItemPedidoCompra.FieldByName('DESCR_PROD').AsString := Copy(trim(buscas2.FieldByName('DESCR_PROD').AsString), 1, 60);
                vDadosIni.fTempItemPedidoCompra.FieldByName('QUANT_IT_PROD').AsFloat := fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat;
              end
              else
              begin
                vDadosIni.fTempItemPedidoCompra.Edit;
                vDadosIni.fTempItemPedidoCompra.FieldByName('QUANT_IT_PROD').AsFloat :=
                  vDadosIni.fTempItemPedidoCompra.FieldByName('QUANT_IT_PROD').AsFloat + fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat;
              end;
              vDadosIni.fTempItemPedidoCompra.Post;
            finally
              vDadosIni.fTempItemPedidoCompra.Filtered := false;
            end;
          end;

          fTempListaCotacao.Next;
        end;
      finally
        fTempListaCotacao.First;
        fTempListaCotacao.EnableControls;
        vDadosIni.fTempItemPedidoCompra.IndexFieldNames := 'GRUPO_PROD;COD_PROD';
      end;

      vPedido.CadPedidoCompra(1);
    end;
  end
  else if pFiltrarEmpresas then
  begin
		vCodPedido := Gencodigo('PEDIDO', buscas2, IntToStr(pCodEmpresa));

    SqlOpen(' select max(num_ped) from pedido ' +
      ' where cod_empresa = ' + IntToStr(pCodEmpresa), buscas2);
    vCodMax := buscas2.FieldByName('max').AsInteger;

    if (vCodMax > vCodPedido) then
    begin
      SqlExec(' update codigo set valor = ' + IntToStr(vCodMax) +
        ' where tabela = ''PEDIDO'' and cod_empresa = ' + IntToStr(pCodEmpresa), buscas2);

      vCodPedido     := Gencodigo('PEDIDO', buscas2, IntToStr(pCodEmpresa));
    end;

    vCodPedidos := vCodPedidos + vDadosIni.IfThen(trim(vCodPedidos) <> '', ', ', '') + IntToStr(vCodPedido);

    try
    	vDadosIni.abreStatusProcessamento('', 'Criando pedido de compra nº ' + IntToStr(vCodPedido) + ' - Emp ' + IntToStr(pCodEmpresa));

      vDataBanco := vDadosIni.getDataBanco(buscas2);
      vTotPedido := 0;

      try
        fTempListaCotacao.DisableControls;
        fTempListaCotacao.First;
        while not fTempListaCotacao.Eof do
        begin
        	if fTempListaCotacao.FieldByName('SEL').AsString = 'S' then
		        vTotPedido := vTotPedido +
            	(fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat * fTempListaCotacao.FieldByName('VALOR').AsFloat);

          fTempListaCotacao.Next;
        end;
      finally
        fTempListaCotacao.First;
        fTempListaCotacao.EnableControls;
      end;

      buscas2.Close;
      buscas2.SQL.Text := ' INSERT INTO PEDIDO ' +
        ' (NUM_PED, COD_EMPRESA, CODIGO_F, COD_VENDEDOR, DATA_PED, DATA_ENV_PED, TIPO_PED, ' +
        ' STATUS_PED, DATA_CHG_PED, VAL_TOT_PED, ATIVO, COD_COND_PAG) ' +
        ' VALUES (:NUM_PED, :COD_EMPRESA, :CODIGO_F, :COD_VENDEDOR, :DATA_PED, :DATA_ENV_PED, :TIPO_PED, ' +
        ' :STATUS_PED, :DATA_CHG_PED, :VAL_TOT_PED, :ATIVO, :COD_COND_PAG); ';
      buscas2.ParamByName('NUM_PED').AsInteger := vCodPedido;
      buscas2.ParamByName('COD_EMPRESA').AsInteger := pCodEmpresa;
      buscas2.ParamByName('CODIGO_F').AsInteger := pCodFornec;
      buscas2.ParamByName('COD_VENDEDOR').AsInteger := pCodVendedor;
      buscas2.ParamByName('DATA_PED').AsDate := vDataBanco;
      buscas2.ParamByName('DATA_ENV_PED').AsDate := vDataBanco;
      buscas2.ParamByName('TIPO_PED').AsString := pTipoPed;
      if vDadosIni.vSugCompra.vPedidoEfetivado then
	      buscas2.ParamByName('STATUS_PED').AsString := 'EFETIVADO'
      else
      	buscas2.ParamByName('STATUS_PED').Value := Null;
      buscas2.ParamByName('DATA_CHG_PED').Value := null;
      buscas2.ParamByName('VAL_TOT_PED').AsFloat := vTotPedido;
      buscas2.ParamByName('ATIVO').AsInteger := 1;
      buscas2.ParamByName('COD_COND_PAG').AsInteger := pCodCondPag;
      buscas2.ExecSQL;

      try
      	vnitem := 0;
        fTempListaCotacao.DisableControls;
        fTempListaCotacao.First;
        while not fTempListaCotacao.Eof do
        begin
        	if fTempListaCotacao.FieldByName('SEL').AsString = 'S' then
          begin
          	Inc(vnitem);

            buscas2.Close;
            buscas2.SQL.Text := ' INSERT INTO ITEM_PEDIDO ' +
              ' (NUM_PED, GRUPO_PROD, COD_PROD, COD_EMPRESA, '+
              ' QUANT_IT_PROD, QUANT_PEN_IT, QUANT_MIN_IT, ' +
              ' VAL_UNT_IT, VAL_TOT_IT, VL_V_EMP, VL_V_HONDA, ' +
              ' ATIVO, NITEM, DESCR_PROD, COD_GRADE, COD_SUGESTAO, COD_EMP_MULT) ' +
              ' VALUES (:NUM_PED, :GRUPO_PROD, :COD_PROD, :COD_EMPRESA, '+
              ' :QUANT_IT_PROD, :QUANT_PEN_IT, :QUANT_MIN_IT, ' +
              ' :VAL_UNT_IT, :VAL_TOT_IT, :VL_V_EMP, :VL_V_HONDA, ' +
              ' :ATIVO, :NITEM, :DESCR_PROD, :COD_GRADE, :COD_SUGESTAO, :COD_EMP_MULT) ';
            buscas2.ParamByName('NUM_PED').AsInteger := vCodPedido;
            buscas2.ParamByName('GRUPO_PROD').AsInteger := fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger;
            buscas2.ParamByName('COD_PROD').AsString := fTempListaCotacao.FieldByName('COD_PROD').AsString;
            buscas2.ParamByName('COD_EMPRESA').AsInteger := pCodEmpresa;
            buscas2.ParamByName('QUANT_IT_PROD').AsFloat := fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat;
            buscas2.ParamByName('QUANT_PEN_IT').AsFloat := 0;
            buscas2.ParamByName('QUANT_MIN_IT').AsFloat := 0;
            buscas2.ParamByName('VAL_UNT_IT').AsFloat := fTempListaCotacao.FieldByName('VALOR').AsFloat;
            buscas2.ParamByName('VAL_TOT_IT').AsFloat := fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat * fTempListaCotacao.FieldByName('VALOR').AsFloat;
            buscas2.ParamByName('VL_V_EMP').AsFloat := 0;
            buscas2.ParamByName('VL_V_HONDA').AsFloat := 0;
            buscas2.ParamByName('ATIVO').AsFloat := 1;
            buscas2.ParamByName('NITEM').AsFloat := vnitem;
            buscas2.ParamByName('DESCR_PROD').AsString := Copy(trim(fTempListaCotacao.FieldByName('DESCR_PROD').AsString), 1, 60);
            buscas2.ParamByName('COD_GRADE').AsInteger := fTempListaCotacao.FieldByName('COD_GRADE').AsInteger;
            buscas2.ParamByName('COD_SUGESTAO').AsInteger := dataSet.FieldByName('COD_SUGESTAO').AsInteger;
            buscas2.ParamByName('COD_EMP_MULT').AsInteger := pCodEmpresa;
            buscas2.ExecSQL;
          end;

          fTempListaCotacao.Next;
        end;

        if buscas2.Transaction.InTransaction then
          buscas2.Transaction.Commit;
      finally
        fTempListaCotacao.First;
        fTempListaCotacao.EnableControls;
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
    end;
  end
  else if pFiltrarProdutos then
  begin
  	vCodPedido := Gencodigo('PEDIDO', buscas2, IntToStr(pCodEmpresa));

    SqlOpen(' select max(num_ped) from pedido ' +
      ' where cod_empresa = ' + IntToStr(pCodEmpresa), buscas2);
    vCodMax := buscas2.FieldByName('max').AsInteger;

    if (vCodMax > vCodPedido) then
    begin
      SqlExec(' update codigo set valor = ' + IntToStr(vCodMax) +
        ' where tabela = ''PEDIDO'' and cod_empresa = ' + IntToStr(pCodEmpresa), buscas2);

      vCodPedido     := Gencodigo('PEDIDO', buscas2, IntToStr(pCodEmpresa));
    end;

    vCodPedidos := vCodPedidos + vDadosIni.IfThen(trim(vCodPedidos) <> '', ', ', '') + IntToStr(vCodPedido);

    try
    	vDadosIni.abreStatusProcessamento('', 'Criando pedido de compra nº ' + IntToStr(vCodPedido) + ' - Emp ' + IntToStr(pCodEmpresa));
      
      vDataBanco := vDadosIni.getDataBanco(buscas2);
      vTotPedido := 0;

      try
        fTempListaCotacao.DisableControls;
        fTempListaCotacao.First;
        while not fTempListaCotacao.Eof do
        begin
        	if fTempListaCotacao.FieldByName('SEL').AsString = 'S' then
		        vTotPedido := vTotPedido +
            	(fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat * fTempListaCotacao.FieldByName('VALOR').AsFloat);

          fTempListaCotacao.Next;
        end;
      finally
        fTempListaCotacao.First;
        fTempListaCotacao.EnableControls;
      end;

      buscas2.Close;
      buscas2.SQL.Text := ' INSERT INTO PEDIDO ' +
        ' (NUM_PED, COD_EMPRESA, CODIGO_F, COD_VENDEDOR, DATA_PED, DATA_ENV_PED, TIPO_PED, ' +
        ' STATUS_PED, DATA_CHG_PED, VAL_TOT_PED, ATIVO, COD_COND_PAG) ' +
        ' VALUES (:NUM_PED, :COD_EMPRESA, :CODIGO_F, :COD_VENDEDOR, :DATA_PED, :DATA_ENV_PED, :TIPO_PED, ' +
        ' :STATUS_PED, :DATA_CHG_PED, :VAL_TOT_PED, :ATIVO, :COD_COND_PAG); ';
      buscas2.ParamByName('NUM_PED').AsInteger := vCodPedido;
      buscas2.ParamByName('COD_EMPRESA').AsInteger := pCodEmpresa;
      buscas2.ParamByName('CODIGO_F').AsInteger := pCodFornec;
      buscas2.ParamByName('COD_VENDEDOR').AsInteger := pCodVendedor;
      buscas2.ParamByName('DATA_PED').AsDate := vDataBanco;
      buscas2.ParamByName('DATA_ENV_PED').AsDate := vDataBanco;
      buscas2.ParamByName('TIPO_PED').AsString := pTipoPed;
      if vDadosIni.vSugCompra.vPedidoEfetivado then
	      buscas2.ParamByName('STATUS_PED').AsString := 'EFETIVADO'
      else
      	buscas2.ParamByName('STATUS_PED').Value := Null;
      buscas2.ParamByName('DATA_CHG_PED').Value := null;
      buscas2.ParamByName('VAL_TOT_PED').AsFloat := vTotPedido;
      buscas2.ParamByName('ATIVO').AsInteger := 1;
      buscas2.ParamByName('COD_COND_PAG').AsInteger := pCodCondPag;
      buscas2.ExecSQL;

      try
      	vnitem := 0;
        fTempListaCotacao.DisableControls;
        fTempListaCotacao.First;
        while not fTempListaCotacao.Eof do
        begin
        	if fTempListaCotacao.FieldByName('SEL').AsString = 'S' then
          begin
            buscas2.Close;
            buscas2.SQL.Text := ' INSERT INTO ITEM_PEDIDO ' +
              ' (NUM_PED, GRUPO_PROD, COD_PROD, COD_EMPRESA, '+
              ' QUANT_IT_PROD, QUANT_PEN_IT, QUANT_MIN_IT, ' +
              ' VAL_UNT_IT, VAL_TOT_IT, VL_V_EMP, VL_V_HONDA, ' +
              ' ATIVO, NITEM, DESCR_PROD, COD_GRADE, COD_SUGESTAO, COD_EMP_MULT) ' +
              ' VALUES (:NUM_PED, :GRUPO_PROD, :COD_PROD, :COD_EMPRESA, '+
              ' :QUANT_IT_PROD, :QUANT_PEN_IT, :QUANT_MIN_IT, ' +
              ' :VAL_UNT_IT, :VAL_TOT_IT, :VL_V_EMP, :VL_V_HONDA, ' +
              ' :ATIVO, :NITEM, :DESCR_PROD, :COD_GRADE, :COD_SUGESTAO, :COD_EMP_MULT) ';
            buscas2.ParamByName('NUM_PED').AsInteger := vCodPedido;
            buscas2.ParamByName('GRUPO_PROD').AsInteger := fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger;
            buscas2.ParamByName('COD_PROD').AsString := fTempListaCotacao.FieldByName('COD_PROD').AsString;
            buscas2.ParamByName('COD_EMPRESA').AsInteger := pCodEmpresa;
            buscas2.ParamByName('QUANT_IT_PROD').AsFloat := fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat;
            buscas2.ParamByName('QUANT_PEN_IT').AsFloat := 0;
            buscas2.ParamByName('QUANT_MIN_IT').AsFloat := 0;
            buscas2.ParamByName('VAL_UNT_IT').AsFloat := fTempListaCotacao.FieldByName('VALOR').AsFloat;
            buscas2.ParamByName('VAL_TOT_IT').AsFloat := fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat * fTempListaCotacao.FieldByName('VALOR').AsFloat;
            buscas2.ParamByName('VL_V_EMP').AsFloat := 0;
            buscas2.ParamByName('VL_V_HONDA').AsFloat := 0;
            buscas2.ParamByName('ATIVO').AsFloat := 1;
            buscas2.ParamByName('NITEM').AsFloat := vnitem;
            buscas2.ParamByName('DESCR_PROD').AsString := Copy(trim(fTempListaCotacao.FieldByName('DESCR_PROD').AsString), 1, 60);
            buscas2.ParamByName('COD_GRADE').AsInteger := fTempListaCotacao.FieldByName('COD_GRADE').AsInteger;
            buscas2.ParamByName('COD_SUGESTAO').AsInteger := dataSet.FieldByName('COD_SUGESTAO').AsInteger;
            buscas2.ParamByName('COD_EMP_MULT').AsInteger := pCodEmpresa;
            buscas2.ExecSQL;
          end;

          fTempListaCotacao.Next;
        end;

        if buscas2.Transaction.InTransaction then
          buscas2.Transaction.Commit;
      finally
        fTempListaCotacao.First;
        fTempListaCotacao.EnableControls;
      end;
    finally
      vDadosIni.fechaStatusProcessamento;
    end;
  end;

  Result := true;
end;

procedure TSugestao.montarDtSetTemporario;
begin
	vDadosIni.fTempPedidoCompra := TClientDataSet.Create(nil);
  vDadosIni.fTempPedidoCompra.Close;
  vDadosIni.fTempPedidoCompra.FieldDefs.Clear;
  vDadosIni.fTempPedidoCompra.FieldDefs.Add('COD_EMPRESA', ftInteger, 0, false);
  vDadosIni.fTempPedidoCompra.FieldDefs.Add('CODIGO_F', ftInteger, 0, false);
  vDadosIni.fTempPedidoCompra.FieldDefs.Add('COD_VENDEDOR', ftInteger, 0, false);
  vDadosIni.fTempPedidoCompra.FieldDefs.Add('COD_COND_PAG', ftInteger, 0, false);
  vDadosIni.fTempPedidoCompra.FieldDefs.Add('TIPO_PED', ftString, 7, false);

  if vDadosIni.fTempPedidoCompra.Tag = 0 then
  try
    vDadosIni.fTempPedidoCompra.CreateDataSet;
    vDadosIni.fTempPedidoCompra.Tag := 1;
  finally
  end;

  vDadosIni.fTempItemPedidoCompra := TClientDataSet.Create(nil);
  vDadosIni.fTempItemPedidoCompra.Close;
  vDadosIni.fTempItemPedidoCompra.FieldDefs.Clear;
  vDadosIni.fTempItemPedidoCompra.FieldDefs.Add('GRUPO_PROD', ftInteger, 0, false);
  vDadosIni.fTempItemPedidoCompra.FieldDefs.Add('COD_PROD', ftString, 6, false);
  vDadosIni.fTempItemPedidoCompra.FieldDefs.Add('COD_GRADE', ftInteger, 0, false);
  vDadosIni.fTempItemPedidoCompra.FieldDefs.Add('COD_EMPRESA', ftInteger, 0, false);
  vDadosIni.fTempItemPedidoCompra.FieldDefs.Add('COD_EMP_MULT', ftInteger, 0, false);
  vDadosIni.fTempItemPedidoCompra.FieldDefs.Add('QUANT_IT_PROD', ftFloat, 0, false);
  vDadosIni.fTempItemPedidoCompra.FieldDefs.Add('VALOR', ftFloat, 0, false);
  vDadosIni.fTempItemPedidoCompra.FieldDefs.Add('DESCR_PROD', ftString, 60, false);
  vDadosIni.fTempItemPedidoCompra.FieldDefs.Add('COD_SUGESTAO', ftInteger, 0, false);

  if vDadosIni.fTempItemPedidoCompra.Tag = 0 then
  try
    vDadosIni.fTempItemPedidoCompra.CreateDataSet;
    vDadosIni.fTempItemPedidoCompra.Tag := 1;
  finally
  end;
end;

function TSugestao.montarTransferencias: boolean;
var
	APedVenda: TReg_PedVenda;
  ARegistros: TGeraRegistros;
  vReq, vPreVenda, vDav: Integer;
  vtiporeq: string;
	vNitem, vCodEmpresa, vCodCliente, vCodVendedor, vCodCondPag: Integer;
  vCodPedido, vCodEmpresaPed, vCodClientePed, vCodVendedorPed, vCodCondPagPed: Integer;
  vNomeVendedor, vTipoVenda, vOrigemVenda: string;
  vNomeVendedorPed, vTipoPed: string;
  vValorProd: Double;
  vDataBanco: TDateTime;
  data_ped: TDateTime;
  buscas2: TIBQuery;
  vCodMax: Integer;

  vCodEmpresasTmp: array of Integer;
  vIdentificacaoTmp: array of string;
  vCGCTmp: array of string;
  vNPEDsTmp: array of string;

  vCodEmpresasTmp2: array of Integer;
  vIdentificacaoTmp2: array of string;
  vCGCTmp2: array of string;
  vCodPedidosTmp: array of string;

  vTemp, vTemp2: string;
  vExisteEmp: boolean;
  J, Z: Integer;
begin
	try
     Result := true;

     vNPEDs := '';
     vReq := 0;
     vPreVenda := 0;
     vDav := 0;
     vCodPedido := 0;
     vValorProd := 0;

     vCodEmpresa := 0;
     vCodCliente := 0;
     vCodVendedor := 0;
     vNomeVendedor := '';
     vTipoVenda := '';

     vCodEmpresaPed := 0;
     vCodClientePed := 0;
     vCodVendedorPed := 0;
     vNomeVendedorPed := '';
     vTipoPed := '';

     vDataBanco := vDadosIni.getDataBanco(buscas);

     buscas2 := TIBQuery.Create(Application);
     buscas2.Database := buscas.Database;
     buscas2.Transaction := buscas.Transaction;

     SetLength(vCodEmpresasTmp, fTempEmpresasPedido.RecordCount);
     SetLength(vIdentificacaoTmp, fTempEmpresasPedido.RecordCount);
     SetLength(vCGCTmp, fTempEmpresasPedido.RecordCount);
     SetLength(vNPEDsTmp, fTempEmpresasPedido.RecordCount);

     SetLength(vCodEmpresasTmp2, fTempEmpresasPedido.RecordCount);
     SetLength(vIdentificacaoTmp2, fTempEmpresasPedido.RecordCount);
     SetLength(vCGCTmp2, fTempEmpresasPedido.RecordCount);
     SetLength(vCodPedidosTmp, fTempEmpresasPedido.RecordCount);

     try
       vExisteEmp := false;
       fTempEmpresasPedido.DisableControls;
       fTempEmpresasPedido.IndexFieldNames := 'COD_EMP_TRANSF';
       fTempEmpresasPedido.First;
       for J := 0 to fTempEmpresasPedido.RecordCount - 1 do
       begin
       	 for Z := 0 to Length(vCodEmpresasTmp) - 1 do
         	 if vCodEmpresasTmp[Z] = fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger then
           	 vExisteEmp := true;

         if not vExisteEmp then
         begin
           vCodEmpresasTmp[J] := fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger;
           vIdentificacaoTmp[J] := fTempEmpresasPedido.FieldByName('IDENTIFICACAO_EMP_TRANSF').AsString;
           vCGCTmp[J] := fTempEmpresasPedido.FieldByName('CGC_EMP_TRANS').AsString;
           vNPEDsTmp[J] := '';
         end;

         fTempEmpresasPedido.Next;
       end;
     finally
       fTempEmpresasPedido.First;
       fTempEmpresasPedido.EnableControls;
     end;

     try
     	 vExisteEmp := false;
       fTempEmpresasPedido.DisableControls;
       fTempEmpresasPedido.IndexFieldNames := 'COD_EMPRESA';
       fTempEmpresasPedido.First;
       for J := 0 to fTempEmpresasPedido.RecordCount - 1 do
       begin
       	 for Z := 0 to Length(vCodEmpresasTmp2) - 1 do
         	 if vCodEmpresasTmp2[Z] = fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger then
           	 vExisteEmp := true;

         if not vExisteEmp then
         begin
	       	 vCodEmpresasTmp2[J] := fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger;
  	       vIdentificacaoTmp2[J] := fTempEmpresasPedido.FieldByName('IDENTIFICACAO_EMP').AsString;
    	     vCGCTmp2[J] := fTempEmpresasPedido.FieldByName('CGC_EMP').AsString;
      	   vCodPedidosTmp[J] := '';
         end;

         fTempEmpresasPedido.Next;
       end;
     finally
       fTempEmpresasPedido.First;
       fTempEmpresasPedido.EnableControls;
     end;

     try
       fTempEmpresasPedido.Filtered := false;
       fTempEmpresasPedido.Filter := 'SEL = ''S'' ';
       fTempEmpresasPedido.Filtered := true;

       if fTempEmpresasPedido.IsEmpty then
       begin
         Result := false;
         exit;
       end;

       fTempEmpresasPedido.IndexFieldNames := 'COD_EMP_TRANSF;COD_EMPRESA';
       fTempEmpresasPedido.First;
       while not fTempEmpresasPedido.Eof do
       begin
         if fTempEmpresasPedido.FieldByName('SEL').AsString = 'S' then
         begin
           SqlOpen(' select cod_cliente, cpfcgc, nome_cliente from clientes '+
              ' where cpfcgc = ' + QuotedStr(fTempEmpresasPedido.FieldByName('CGC_EMP').AsString) +
              ' and cod_empresa = ' + IntToStr(fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger), buscas2);
           vCodCliente := buscas2.FieldByName('COD_CLIENTE').AsInteger;

           if vCodCliente <= 0 then
           begin
           	 SqlOpen(' select nome_emp, fantasia_emp, cgc_emp from clientes '+
               ' where cpfcgc = ' + QuotedStr(fTempEmpresasPedido.FieldByName('CGC_EMP').AsString) +
               ' and cod_empresa = ' + IntToStr(fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger), buscas2);

             Application.MessageBox(Pchar('Cliente não encontrado na empresa: ' + #13 + #13 +
              'Cod Empresa: ' + IntToStr(fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger) + #13 +
              'Empresa:' + trim(fTempEmpresasPedido.FieldByName('IDENTIFICACAO_EMP_TRANSF').AsString) + #13 +
              'CNPJ Empresa: ' + trim(fTempEmpresasPedido.FieldByName('CGC_EMP_TRANS').AsString) + #13 + #13 +
              'Nome Fantasia (Fornecedor): ' + trim(buscas2.FieldByName('FANTASIA_EMP').AsString) + #13 +
              'Razão Social (Fornecedor): ' + trim(buscas2.FieldByName('NOME_EMP').AsString) + #13 +
              'CNPJ/CPF: ' + buscas2.FieldByName('CGC_EMP').AsString + #13 + #13 +
              'Favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
             Result := false;
             exit;
           end;

           SqlOpen(' select cod_cliente, cpfcgc, nome_cliente from clientes '+
              ' where cpfcgc = ' + QuotedStr(fTempEmpresasPedido.FieldByName('CGC_EMP_TRANS').AsString) +
              ' and cod_empresa = ' + IntToStr(fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger), buscas2);
           vCodClientePed := buscas2.FieldByName('COD_CLIENTE').AsInteger;

           if vCodClientePed <= 0 then
           begin
           	 SqlOpen(' select nome_emp, fantasia_emp, cgc_emp from clientes '+
               ' where cpfcgc = ' + QuotedStr(fTempEmpresasPedido.FieldByName('CGC_EMP_TRANS').AsString) +
               ' and cod_empresa = ' + IntToStr(fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger), buscas2);

             Application.MessageBox(Pchar('Cliente não encontrado na empresa: ' + #13 + #13 +
             	'Cod Empresa: ' + IntToStr(fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger) + #13 +
              'Empresa:' + trim(fTempEmpresasPedido.FieldByName('IDENTIFICACAO_EMP').AsString) + #13 +
              'CNPJ Empresa: ' + trim(fTempEmpresasPedido.FieldByName('CGC_EMP').AsString) + #13 + #13 +
              'Nome Fantasia (Fornecedor): ' + trim(buscas2.FieldByName('FANTASIA_EMP').AsString) + #13 +
              'Razão Social (Fornecedor): ' + trim(buscas2.FieldByName('NOME_EMP').AsString) + #13 +
              'CNPJ/CPF: ' + buscas2.FieldByName('CGC_EMP').AsString + #13 + #13 +
              'Favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
             Result := false;
             exit;
           end;

           vClientePedSug._abreCliente(vCodCliente, fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger);
           vVendedorPedSug._abreVendedor(fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger, true);
           verificatipovenda(FrmSugestaoCompra.ComboBoxTipoVenda3);
           verificaorigemvenda(FrmSugestaoCompra.ComboBoxOrigemVenda3);

           vFornecPedSug._abreFornecedor(vCodClientePed, fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger);
           vVendedorPedSug2._abreVendedor(fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger, true);

           vCondPagPedSug._abreCondPag;

           vCodVendedor := 0;
           vNomeVendedor := '';
           vTipoVenda := '';

           vCodVendedorPed := 0;
           vNomeVendedorPed := '';
           vTipoPed := '';

           vCodCondPag := 0;

           try
           	 vValorProd := 0;

             filtrarPorEmpresaTransf(
               fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger,
               fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger);

             fTempListaCotacao.DisableControls;
             fTempListaCotacao.Filtered := false;
             fTempListaCotacao.Filter := 'SEL = ''S'' ' +
             	 ' AND COD_EMP_TRANSF = ' + IntToStr(fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger) +
               ' AND COD_EMP_MULT = '  + IntToStr(fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger);
             fTempListaCotacao.Filtered := true;

             fTempListaCotacao.First;
             while not fTempListaCotacao.Eof do
             begin
               if (fTempListaCotacao.FieldByName('SEL').AsString = 'S')
               	 and (fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat > 0) then
               begin
                   SqlOpen(' select grupo_prod, cod_prod, cod_empresa, descr_prod, num_fab_prod, prec_cusm_prod from produtos '+
                     ' where grupo_prod = ' + IntToStr(fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger) +
                     ' and cod_prod = ' + QuotedStr(fTempListaCotacao.FieldByName('COD_PROD').AsString) +
                     ' and cod_empresa = ' + IntToStr(fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger), buscas2);

                   if buscas2.FieldByName('prec_cusm_prod').AsFloat <= 0 then
                   begin
                  	 SqlOpen(' select grupo_prod, cod_prod, cod_empresa, descr_prod, num_fab_prod, prec_cusm_prod from produtos '+
                       ' where grupo_prod = ' + IntToStr(fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger) +
                       ' and cod_prod = ' + QuotedStr(fTempListaCotacao.FieldByName('COD_PROD').AsString) +
                       ' and cod_empresa = ' + IntToStr(vDadosIni.cod_empresa), buscas2);
                   end;

                   if buscas2.FieldByName('prec_cusm_prod').AsFloat <= 0 then
                   begin
                     Application.MessageBox(Pchar('Produto sem preço de custo médio na empresa ' + IntToStr(fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger) + ':' + #13 + #13 +
                      'Grupo Prod: ' + trim(buscas2.FieldByName('GRUPO_PROD').AsString) + #13 +
                      'Cod Prod: ' + trim(buscas2.FieldByName('COD_PROD').AsString) + #13 +
                      'Num Fabricante: ' + trim(buscas2.FieldByName('NUM_FAB_PROD').AsString) + #13 +
                      'Descr Prod: ' + trim(buscas2.FieldByName('DESCR_PROD').AsString) + #13 + #13 +
                      'Favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
                     Result := false;
                     RollBackTransacao;
                     exit;
                   end;

               	 vValorProd := vValorProd +
                 	 fTempListaCotacao.FieldByName('quant_prod').AsFloat * buscas2.FieldByName('prec_cusm_prod').AsFloat;
               end;

               fTempListaCotacao.Next;
             end;
           finally
             fTempListaCotacao.First;
             fTempListaCotacao.EnableControls;
           end;

           // Transferencias
           FrmSugestaoCompra.EditMoedaCliente3.Valor := vCodCliente;
           FrmSugestaoCompra.DBLookupComboBoxCliente3.KeyValue := vCodCliente;
           FrmSugestaoCompra.EditMoedaEmpCliente3.Valor := fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger;

           FrmSugestaoCompra.DBLookupComboBoxVend3.KeyValue := vDadosIni.IfThen(vDadosIni.cod_empresa = fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger, vDadosIni.vCodUsuario, 0);
           FrmSugestaoCompra.EditMoedaVend3.Valor := vDadosIni.IfThen(vDadosIni.cod_empresa = fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger, vDadosIni.vCodUsuario, 0);

           // Pedido de Compra
           FrmSugestaoCompra.EditMoedaFornecedor3.Valor := vCodClientePed;
           FrmSugestaoCompra.DBLookupComboBoxFornecedor3.KeyValue := vCodClientePed;
           FrmSugestaoCompra.EditMoedaEmpFornecedor3.Valor := fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger;

           FrmSugestaoCompra.DBLookupComboBoxVendPed3.KeyValue := vDadosIni.IfThen(vDadosIni.cod_empresa = fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger, vDadosIni.vCodUsuario, 0);
           FrmSugestaoCompra.EditMoedaVendPed3.Valor := vDadosIni.IfThen(vDadosIni.cod_empresa = fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger, vDadosIni.vCodUsuario, 0);
           FrmSugestaoCompra.ComboBoxTipoPedido3.ItemIndex := 0;

           // Outros
           FrmSugestaoCompra.DBLookupComboBoxCondPag3.KeyValue := 0;
           FrmSugestaoCompra.EditMoedaCondPag3.Valor := 0;

           FrmSugestaoCompra.pnMontarTrasferencias3Cliente.Caption :=
           	IntToStr(fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger) + ' - ' +
            trim(fTempEmpresasPedido.FieldByName('IDENTIFICACAO_EMP_TRANSF').AsString) + ' ' +
            trim(fTempEmpresasPedido.FieldByName('CGC_EMP_TRANS').AsString);

           FrmSugestaoCompra.pnMontarTrasferenciasDest.Caption :=
           	IntToStr(fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger) + ' - ' +
            trim(fTempEmpresasPedido.FieldByName('IDENTIFICACAO_EMP').AsString) + ' ' +
            trim(fTempEmpresasPedido.FieldByName('CGC_EMP').AsString);

           Result := vDadosIni.abreForm('Criar requisição de transferência ' +
           	 '(' + IntToStr(fTempEmpresasPedido.RecNo) + ' /' + IntToStr(fTempEmpresasPedido.RecordCount) + ')',
             FrmSugestaoCompra.pnMontarTrasferencias3, [ofEscapeExit, ofAlignAllClientWinCtrl]);
           if not Result then
           begin
           	 Result := false;
             exit;
           end;

           vCodVendedor     := vVendedorPedSug.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
           vNomeVendedor    := Trim(vVendedorPedSug.dataSet.FieldByName('NOME_VENDEDOR').AsString);
           vTipoVenda       := Copy(Trim(FrmSugestaoCompra.ComboBoxTipoVenda3.Items[FrmSugestaoCompra.ComboBoxTipoVenda3.ItemIndex]), 1, 1);
           vOrigemVenda     := Copy(Trim(FrmSugestaoCompra.ComboBoxOrigemVenda3.Items[FrmSugestaoCompra.ComboBoxOrigemVenda3.ItemIndex]), 1, 1);

           vCodVendedorPed  := vVendedorPedSug2.dataSet.FieldByName('COD_VENDEDOR').AsInteger;
           vNomeVendedorPed := Trim(vVendedorPedSug.dataSet.FieldByName('NOME_VENDEDOR').AsString);
           vTipoPed         := trim(FrmSugestaoCompra.ComboBoxTipoPedido3.Items[FrmSugestaoCompra.ComboBoxTipoPedido3.ItemIndex]);

           vCodCondPag := vCondPagPedSug.dataSet.FieldByName('COD_COND_PAG').AsInteger;

           if vCodVendedor <= 0 then
           begin
             Application.MessageBox(Pchar('Vendedor (Transferência) não informada, ' +
              'favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
             Result := false;
             exit;
           end;

           SqlOpen(' select cod_vendedor, cod_empresa, nome_vendedor from colaborador ' +
					 	 ' where cod_vendedor = ' + IntToStr(vCodVendedor) +
             ' and cod_empresa = ' + IntToStr(fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger) +
             ' and ativo = 1 ', buscas2);

           if buscas2.IsEmpty then
           begin
           	 Application.MessageBox(Pchar('Vendedor (Transferência) não encontrado, ' +
              'favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
             Result := false;
             exit;
           end;

           if (trim(vTipoVenda) = '') then
           begin
             Application.MessageBox(Pchar('Tipo de Venda (Transferência) não informada, ' +
              'favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
             Result := false;
             exit;
           end;

           if (trim(vOrigemVenda) = '') then
           begin
             Application.MessageBox(Pchar('Origem (Transferência) não informada, ' +
              'favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
             Result := false;
             exit;
           end;

           SqlOpen(' select coalesce(tp.usarprecocusto, ''N'') usarprecocusto from tipo_vendas tp ' +
				    ' where tp.tipo = ''REQ'' and sigla = ' + QuotedStr(vTipoVenda) + ' and tp.ativo = 1 ', buscas2);

           if trim(buscas2.FieldByName('USARPRECOCUSTO').AsString) <> 'S' then
           begin
             Application.MessageBox(Pchar('Tipo de Venda (Transferência) não configurada como Preço de Custo, ' +
              'favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
             Result := false;
             exit;
           end;

           if vCodVendedorPed <= 0 then
           begin
             Application.MessageBox(Pchar('Vendedor (Pedido de Compra) não informada, ' +
              'favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
             Result := false;
             exit;
           end;

           SqlOpen(' select cod_vendedor, cod_empresa, nome_vendedor from colaborador ' +
					 	 ' where cod_vendedor = ' + IntToStr(vCodVendedorPed) +
             ' and cod_empresa = ' + IntToStr(fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger) +
             ' and ativo = 1 ', buscas2);

           if buscas2.IsEmpty then
           begin
           	 Application.MessageBox(Pchar('Vendedor (Pedido de Compra) não encontrado, ' +
              'favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
             Result := false;
             exit;
           end;

           if trim(vTipoPed) = '' then
           begin
             Application.MessageBox(Pchar('Tipo do pedido (Pedido de Compra) não informado, ' +
              'favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
             Result := false;
             exit;
           end;

           if vCodCondPag <= 0 then
           begin
             Application.MessageBox(Pchar('Condição de pagamento não informada, ' +
              'favor verificar antes de continuar.'), 'Atenção', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
             Result := false;
             exit;
           end;

           vCodEmpresa    := fTempEmpresasPedido.FieldByName('COD_EMP_TRANSF').AsInteger;
           vCodEmpresaPed := fTempEmpresasPedido.FieldByName('COD_EMPRESA').AsInteger;
           vReq           := Gencodigo('REQVENDA', buscas, IntToStr(vCodEmpresa));
           vtiporeq       := 'REQ';
           vCodPedido     := Gencodigo('PEDIDO', buscas, IntToStr(vCodEmpresaPed));

           SqlOpen(' select max(num_ped) from pedido ' +
             ' where cod_empresa = ' + IntToStr(vCodEmpresaPed), buscas);
           vCodMax := buscas.FieldByName('max').AsInteger;

           if (vCodMax > vCodPedido) then
           begin
           	 SqlExec(' update codigo set valor = ' + IntToStr(vCodMax) +
          		 ' where tabela = ''PEDIDO'' and cod_empresa = ' + IntToStr(vCodEmpresaPed), buscas);

					 	 vCodPedido     := Gencodigo('PEDIDO', buscas, IntToStr(vCodEmpresaPed));
           end;

				   try
           	 vDadosIni.abreStatusProcessamento('', 'Criando requisição (transferência) nº ' + IntToStr(vReq) + ' - Emp ' + IntToStr(vCodEmpresa));

             if (vDadosIni.vEmp.vUsarPreVenda = 'S') then
               vPreVenda := Gencodigo('PAF_PREVENDA', buscas, IntToStr(vCodEmpresa))
             else if (vDadosIni.vEmp.vUsarDAV = 'S') then
               vDav := Gencodigo('PREVENDA', buscas, IntToStr(vCodEmpresa));
             data_ped         := vDadosIni.getDataBanco(buscas2);

             for J := 0 to Length(vCodEmpresasTmp) - 1 do
             begin
               if vCodEmpresasTmp[J] = vCodEmpresa then
               begin
                 vNPEDsTmp[J] := vNPEDsTmp[J] + vDadosIni.IfThen(trim(vNPEDsTmp[J]) <> '', ', ', '') + IntToStr(vReq);
                 break;
               end;
             end;
  //           vNPEDs := vNPEDs + vDadosIni.IfThen(trim(vNPEDs) <> '', ', ', '') + IntToStr(vReq);

  //           vCodVendedor       := vDadosIni.vCodUsuario;
             APedVenda := TReg_PedVenda.create;
             with APedVenda do
             begin
               nped             := vReq;
               if vDav > 0 then
                 nprevenda :=	vDav;
               if vPreVenda > 0 then
                 pafnumprevenda :=	vPreVenda;
               tipo             := 'REQ';
               cod_empresa      := vCodEmpresa;
               cod_cliente      := vCodCliente;
               cod_vendedor     := vCodVendedor;
               valor_total      := vValorProd;
               cod_cond_pag     := vCodCondPag;
               data_ped         := vDataBanco;

               desconto         := 0;
               obs_ped          := vDadosIni.vEmp.vMensagem;
               tipv             := trim(vTipoVenda);
               tipor					  := trim(vOrigemVenda);
               horaabertura     := HourOf(data_ped);
               minabertura      := MinuteOf(data_ped);
               horafechamento   := HourOf(data_ped);
               minfechamento    := HourOf(data_ped);
               acrescimo        := 0;
               tot_prod         := vValorProd;

               SqlOpen(' select cod_cliente, cpfcgc, nome_cliente from clientes '+
                ' where cod_cliente = ' + IntToStr(vCodCliente) +
                ' and cod_empresa = ' + IntToStr(vDadosIni.cod_empresa), buscas2);

               cpfcgc           := buscas2.FieldByName('cpfcgc').AsString;
               nome_clientedav  := buscas2.FieldByName('nome_cliente').AsString;
               nome_cli_orc     := buscas2.FieldByName('nome_cliente').AsString;
               data_estoque     := DateOf(data_ped);

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
                 ' left join estados es on es.codigo_uf = cl.codigo_uf' +
                 ' where cl.cod_cliente = ' + IntToStr(APedVenda.cod_cliente) +
                 ' and cl.cod_empresa = ' + IntToStr(vCodEmpresa)) do
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
                 end;
             end;

             try
               vnitem := 0;
               fTempListaCotacao.DisableControls;
               fTempListaCotacao.First;
               while not fTempListaCotacao.Eof do
               begin
                 if (fTempListaCotacao.FieldByName('SEL').AsString = 'S')
                   and (fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat > 0) then
                 begin
                   SqlOpen(' select grupo_prod, cod_prod, cod_empresa, ' +
                     ' num_fab_prod, descr_prod, prec_cus_prod, prec_cusm_prod, ' +
                     ' unidade, icm_prod, codigo_nop, isento_prod, comissao_prod, comissao_prod_ger from produtos ' +
                     ' where grupo_prod = ' + IntToStr(fTempListaCotacao.FieldByName('grupo_prod').AsInteger) +
                     ' and cod_prod = ' + QuotedStr(fTempListaCotacao.FieldByName('cod_prod').AsString) +
                     ' and cod_empresa =  ' + IntToStr(vCodEmpresa), buscas2);

                   if buscas2.FieldByName('prec_cusm_prod').AsFloat <= 0 then
                     SqlOpen(' select grupo_prod, cod_prod, cod_empresa, ' +
                       ' num_fab_prod, descr_prod, prec_cus_prod, prec_cusm_prod, ' +
                       ' unidade, icm_prod, codigo_nop, isento_prod, comissao_prod, comissao_prod_ger from produtos ' +
                       ' where grupo_prod = ' + IntToStr(fTempListaCotacao.FieldByName('grupo_prod').AsInteger) +
                       ' and cod_prod = ' + QuotedStr(fTempListaCotacao.FieldByName('cod_prod').AsString) +
                       ' and cod_empresa =  ' + IntToStr(vDadosIni.cod_empresa), buscas2);

                   if not buscas2.IsEmpty then
                   begin
                     with APedVenda.Prod.New do
                     begin
                       Inc(vnitem);
                       grupo_prod      := buscas2.FieldByName('grupo_prod').AsInteger;
                       cod_prod        := buscas2.FieldByName('cod_prod').AsString;
                       nitem           := vnitem;
                       cod_grade       := fTempListaCotacao.FieldByName('cod_grade').AsInteger;
                       codigo_nop      := buscas2.FieldByName('codigo_nop').AsFloat;
                       num_fab_prod    := buscas2.FieldByName('num_fab_prod').AsString;
                       descr_prod_ped  := buscas2.FieldByName('descr_prod').AsString;
                       quant_ped_item  := fTempListaCotacao.FieldByName('quant_prod').AsFloat;
                       vlun_ped_item   := buscas2.FieldByName('prec_cusm_prod').AsFloat;
                       vltot_ped_item  := fTempListaCotacao.FieldByName('quant_prod').AsFloat * buscas2.FieldByName('prec_cusm_prod').AsFloat;
                       vlun_orig       := buscas2.FieldByName('prec_cusm_prod').AsFloat;
                       vlun_ped_nf     := buscas2.FieldByName('prec_cusm_prod').AsFloat;
                       rateio_desc     := 0;
                       rateio_acresc   := 0;
                       comiss_prod     := RoundTo((buscas2.FieldByName('comissao_prod').AsFloat     * (vltot_ped_item - rateio_desc)) / 100, -2);// aqui nao entra seguro, frete, nem outras despesas
                       comiss_prod_ger := RoundTo((buscas2.FieldByName('comissao_prod_ger').AsFloat * (vltot_ped_item - rateio_desc)) / 100, -2);// aqui nao entra seguro, frete, nem outras despesas
                       pcust_c         := buscas2.FieldByName('prec_cus_prod').AsFloat;
                       pcust_mc        := buscas2.FieldByName('prec_cusm_prod').AsFloat;
                       cod_vendedor    := vCodVendedor;
                       data_transf     := DateOf(vDadosIni.vDataHora);
                       nome_vend       := vNomeVendedor;
                       vlo_unitario    := vlun_ped_item;
                       data_inclusao   := DateOf(vDadosIni.vDataHora);
                       nitem_nf        := 0;
                       vl_desp_nf      := 0;
                       unidade         := buscas2.FieldByName('unidade').AsString;
                       icm_prod        := buscas2.FieldByName('icm_prod').AsFloat;
                       tp_descacres    := 'DESCONTO';
                       nat_descacres   := 'PERCENTUAL';
                       valor_descacres := 0;
                       sit_trib        := vDadosIni.IfThen((icm_prod > 0), 'T', '') +
                                          vDadosIni.IfThen((icm_prod = 0) and (buscas2.FieldByName('isento_prod').AsString = 'S'), 'I', 'F');
                       vltot_ped_nf    := vltot_ped_item;
                       cod_sugestao    := dataset.FieldByName('cod_sugestao').AsInteger;
                       cod_emp_sugestao:= vDadosIni.cod_empresa;

                       ativo           := 1;
                     end;
                   end;
                 end;

                 fTempListaCotacao.Next;
               end;
             finally
               fTempListaCotacao.Filtered := false;
               fTempListaCotacao.First;
               fTempListaCotacao.EnableControls;
             end;

             //Inserindo o pedvenda
             ARegistros := TGeraRegistros.create(buscas.Transaction);
             try
               if not ARegistros.Inserir(APedVenda) then
                 raiseExceptionCreate(ARegistros.LasError, '');
             finally
               FreeAndNil(ARegistros);
             end;
           finally
             vDadosIni.fechaStatusProcessamento;
           end;

           try
             vDadosIni.abreStatusProcessamento('', 'Criando pedido de compra nº ' + IntToStr(vCodPedido) + ' - Emp ' + IntToStr(vCodEmpresaPed));

             for J := 0 to Length(vCodEmpresasTmp2) - 1 do
             begin
               if vCodEmpresasTmp2[J] = vCodEmpresaPed then
               begin
                 vCodPedidosTmp[J] := vCodPedidosTmp[J] + vDadosIni.IfThen(trim(vCodPedidosTmp[J]) <> '', ', ', '') + IntToStr(vCodPedido);
                 break;
               end;
             end;

             buscas2.Close;
             buscas2.SQL.Text := ' INSERT INTO PEDIDO ' +
               ' (NUM_PED, COD_EMPRESA, CODIGO_F, COD_VENDEDOR, DATA_PED, DATA_ENV_PED, TIPO_PED, ' +
               ' STATUS_PED, DATA_CHG_PED, VAL_TOT_PED, ATIVO, COD_COND_PAG) ' +
               ' VALUES (:NUM_PED, :COD_EMPRESA, :CODIGO_F, :COD_VENDEDOR, :DATA_PED, :DATA_ENV_PED, :TIPO_PED, ' +
               ' :STATUS_PED, :DATA_CHG_PED, :VAL_TOT_PED, :ATIVO, :COD_COND_PAG); ';
             buscas2.ParamByName('NUM_PED').AsInteger := vCodPedido;
             buscas2.ParamByName('COD_EMPRESA').AsInteger := vCodEmpresaPed;
             buscas2.ParamByName('CODIGO_F').AsInteger := vCodClientePed;
             buscas2.ParamByName('COD_VENDEDOR').AsInteger := vCodVendedorPed;
             buscas2.ParamByName('DATA_PED').AsDate := vDataBanco;
             buscas2.ParamByName('DATA_ENV_PED').AsDate := vDataBanco;
             buscas2.ParamByName('TIPO_PED').AsString := vTipoPed;
             buscas2.ParamByName('STATUS_PED').AsString := 'EFETIVADO';
             buscas2.ParamByName('DATA_CHG_PED').Value := null;
             buscas2.ParamByName('VAL_TOT_PED').AsFloat := vValorProd;
             buscas2.ParamByName('ATIVO').AsInteger := 1;
             buscas2.ParamByName('COD_COND_PAG').AsInteger := vCodCondPag;
             buscas2.ExecSQL;

             try
               vnitem := 0;
               fTempListaCotacao.DisableControls;
               fTempListaCotacao.First;
               while not fTempListaCotacao.Eof do
               begin
                 if (fTempListaCotacao.FieldByName('SEL').AsString = 'S')
                   and (fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat > 0) then
                 begin
                   Inc(vnitem);
                   buscas2.Close;
                   buscas2.SQL.Text := ' INSERT INTO ITEM_PEDIDO ' +
                     ' (NUM_PED, GRUPO_PROD, COD_PROD, COD_EMPRESA, '+
                     ' QUANT_IT_PROD, QUANT_PEN_IT, QUANT_MIN_IT, ' +
                     ' VAL_UNT_IT, VAL_TOT_IT, VL_V_EMP, VL_V_HONDA, ' +
                     ' ATIVO, NITEM, DESCR_PROD, COD_GRADE, COD_SUGESTAO, COD_EMP_MULT) ' +
                     ' VALUES (:NUM_PED, :GRUPO_PROD, :COD_PROD, :COD_EMPRESA, '+
                     ' :QUANT_IT_PROD, :QUANT_PEN_IT, :QUANT_MIN_IT, ' +
                     ' :VAL_UNT_IT, :VAL_TOT_IT, :VL_V_EMP, :VL_V_HONDA, ' +
                     ' :ATIVO, :NITEM, :DESCR_PROD, :COD_GRADE, :COD_SUGESTAO, :COD_EMP_MULT) ';
                   buscas2.ParamByName('NUM_PED').AsInteger := vCodPedido;
                   buscas2.ParamByName('GRUPO_PROD').AsInteger := fTempListaCotacao.FieldByName('GRUPO_PROD').AsInteger;
                   buscas2.ParamByName('COD_PROD').AsString := fTempListaCotacao.FieldByName('COD_PROD').AsString;
                   buscas2.ParamByName('COD_EMPRESA').AsInteger := vCodEmpresaPed;
                   buscas2.ParamByName('QUANT_IT_PROD').AsFloat := fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat;
                   buscas2.ParamByName('QUANT_PEN_IT').AsFloat := 0;
                   buscas2.ParamByName('QUANT_MIN_IT').AsFloat := 0;
                   buscas2.ParamByName('VAL_UNT_IT').AsFloat := fTempListaCotacao.FieldByName('VALOR').AsFloat;
                   buscas2.ParamByName('VAL_TOT_IT').AsFloat := fTempListaCotacao.FieldByName('QUANT_PROD').AsFloat * fTempListaCotacao.FieldByName('VALOR').AsFloat;
                   buscas2.ParamByName('VL_V_EMP').AsFloat := 0;
                   buscas2.ParamByName('VL_V_HONDA').AsFloat := 0;
                   buscas2.ParamByName('ATIVO').AsFloat := 1;
                   buscas2.ParamByName('NITEM').AsFloat := vnitem;
                   buscas2.ParamByName('DESCR_PROD').AsString := Copy(trim(fTempListaCotacao.FieldByName('DESCR_PROD').AsString), 1, 60);
                   buscas2.ParamByName('COD_GRADE').AsInteger := fTempListaCotacao.FieldByName('COD_GRADE').AsInteger;
                   buscas2.ParamByName('COD_SUGESTAO').AsInteger := dataSet.FieldByName('COD_SUGESTAO').AsInteger;
                   buscas2.ParamByName('COD_EMP_MULT').AsInteger := vCodEmpresaPed;
                   buscas2.ExecSQL;
                 end;

                 fTempListaCotacao.Next;
               end;

               if buscas2.Transaction.InTransaction then
                 buscas2.Transaction.Commit;
             finally
               fTempListaCotacao.First;
               fTempListaCotacao.EnableControls;
             end;
           finally
             vDadosIni.fechaStatusProcessamento;
           end;
         end;

         fTempEmpresasPedido.Next;
       end;

       result := CommitaTransacao;

       if not result then
       	 result := true;

       vTemp := '';
       for J := 0 to Length(vCodEmpresasTmp) - 1 do
       	 if vCodEmpresasTmp[J] > 0 then
           if trim(vNPEDsTmp[J]) <> '' then
             vTemp := vTemp + vDadosIni.IfThen(trim(vTemp) <> '', #13 + #13, '') +
                IntToStr(vCodEmpresasTmp[J]) + ' - ' + trim(vIdentificacaoTmp[J]) + ' ' + trim(vCGCTmp[J]) + #13 +
                'Nº: ' + vNPEDsTmp[J];

       vTemp2 := '';
       for J := 0 to Length(vCodEmpresasTmp2) - 1 do
       	 if vCodEmpresasTmp2[J] > 0 then
           if trim(vCodPedidosTmp[J]) <> '' then
             vTemp2 := vTemp2 + vDadosIni.IfThen(trim(vTemp2) <> '', #13 + #13, '') +
                IntToStr(vCodEmpresasTmp2[J]) + ' - ' + trim(vIdentificacaoTmp2[J]) + ' ' + trim(vCGCTmp2[J]) + #13 +
                'Nº: ' + vCodPedidosTmp[J];

       if Result then
      	 Application.MessageBox(Pchar('Transferência e pedidos de compra gerados com sucesso: ' + #13 + #13 +
           'Transferência: ' + #13 +
           vTemp + #13 + #13 +
           'Pedidos:' + #13 +
           vTemp2 + #13 + #13 +
         	 'Transferência(s) se encontra(m) aberta(s), favor realizar o fechamento.'), 'Atenção', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
     finally
       fTempEmpresasPedido.Filtered := false;
       fTempEmpresasPedido.First;
       fTempEmpresasPedido.EnableControls;
     end;
   except
    on e: Exception do
    begin
      Result := False;
      RollBackTransacao;
      Application.MessageBox(pchar('Erro ao montar transferência: ' + e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro('Erro ao montar transferência: ' + e.Message);
    end;
  end;
end;

procedure TSugestao.novaPaginaPrint;
begin
  RdpSug.ImpF(linha, 1, vDadosIni.vEmp.vnomeEmpresa, [normal, negrito]);
  linha := linha + 1;
  RdpSug.ImpF(linha, 1, trim(vDadosIni.vEmp.vEndereco) + ' - ' + trim(vDadosIni.vEmp.vBairro) + ', ' +
    trim(vDadosIni.vEmp.vCidade) + ' CEP: ' + trim(vDadosIni.vEmp.vCEP) + 'FONE: ' +
    vDadosIni.vEmp.vTelefone + ' CGC: ' + vDadosIni.vEmp.vCNPJ, [comp17]);
  linha := linha + 1;
  RdpSug.ImpF(linha, 1, 'Sugestao de Compra ', [normal, negrito]);
  linha := linha + 2;
  vpag := vpag + 1;
  RdpSug.ImpF(linha, 1, vDadosIni.Replicate('=', 132), [comp17]);
  linha := linha + 1;
  RdpSug.ImpF(linha, 1, 'CODIGO', [comp17, negrito]);
  RdpSug.ImpF(linha, 12, 'N. FABRICANTE', [comp17, negrito]);
  RdpSug.ImpF(linha, 28, 'EST.AT.', [comp17, negrito]);
  RdpSug.ImpF(linha, 36, 'MEDIA ', [comp17, negrito]);
  RdpSug.ImpF(linha, 43, 'TRANSF', [comp17, negrito]);
  RdpSug.ImpF(linha, 50, 'SUG', [comp17, negrito]);
  RdpSug.ImpF(linha, 57, 'QT.PEND', [comp17, negrito]);
  RdpSug.ImpF(linha, 65, 'CLASS PROD', [comp17, negrito]);
  RdpSug.ImpF(linha, 85, 'DESCRICAO', [comp17, negrito]);
  if dataSet.FieldByName('USODEGRADE').AsString = 'S' then
  begin
    RdpSug.ImpF(linha, 108, 'GRADE', [comp17, negrito]);
    RdpSug.ImpF(linha, 115, 'DESC GRADE', [comp17, negrito]);
    RdpSug.ImpF(linha, 129, 'DESC GRADE 1', [comp17, negrito]);
  end;
  linha := linha + 1;
  RdpSug.ImpF(linha, 1, 'CLASSE', [comp17, negrito]);
  RdpSug.ImpF(linha, 12, 'DATA', [comp17, negrito]);
  RdpSug.ImpF(linha, 28, 'VALOR ', [comp17, negrito]);
  RdpSug.ImpF(linha, 57, 'NUM. NF', [comp17, negrito]);
  RdpSug.ImpF(linha, 65, 'FORNECEDOR', [comp17, negrito]);
  RdpSug.ImpF(linha, 108, 'QT.TRANSITO', [comp17, negrito]);
  RdpSug.ImpF(linha, 120, 'QTD.ITEM', [comp17, negrito]);
  linha := linha + 1;
  RdpSug.ImpF(linha, 1, vDadosIni.replicate('=', 132), [comp17]);
  linha := linha + 1;
end;

function TSugestao.PararProcessamento: boolean;
begin
  result := false;
  if Parar then
  begin
    if Application.MessageBox('Deseja Cancelar o Processamento?', 'Confirmação', MB_YESNO +
      MB_ICONQUESTION + MB_DEFBUTTON1) = mrYES then
      result := true
    else
      Parar := false;
  end;
end;

function TSugestao.post(pSemMensagem: boolean = false): boolean;
var
  i, linha: integer;
  gradeTemp: string;
  vseqid: Integer;
  vclasseprod: string;
  vCodEmpMult: string;
begin
  Result := false;
  try
    if inherited insert then
    begin
      dtmSugestaoCompras.SpIncCodigo.Transaction := dtmSugestaoCompras.IBTransSugestao;
      dataSet.FieldByName('COD_SUGESTAO').AsInteger := Gencodigo('SUGESTAOCOMPRA', dtmSugestaoCompras.SpIncCodigo, vDadosIni.codEmpresa);
      dataSet.FieldByName('DT_SUGESTAO').AsDateTime := vDadosIni.getDataBanco(buscas);
      dataSet.FieldByName('HS_SUGESTAO').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
      dataSet.FieldByName('COD_EMPRESA').AsInteger := strtoint(vDadosIni.codEmpresa);
      dataSet.FieldByName('QTDMESSUG').AsInteger := QtdMesEmpresa;
      dataSet.FieldByName('TP_SUG').AsInteger := TpProcessamento;
      dataSet.FieldByName('TE_SUG').AsInteger := TpEntrega;
      dataSet.FieldByName('TA_SUG').AsInteger := TpAlocacao;
      dataSet.FieldByName('FP_SUG').AsInteger := FreqPedido;
      dataSet.FieldByName('FP_SUG').AsInteger := FreqPedido;
      dataSet.FieldByName('ES_SUG').AsInteger := vestsegsug;
      dataSet.FieldByName('USODEGRADE').AsString := vDadosIni.IfThen(usodegrade, 'S', 'N'); //o default é N
      dataSet.FieldByName('EXIBIR_TRANSF').AsString := vDadosIni.IfThen(vExibirTransf, 'S', 'N'); //o default é N
      dataSet.FieldByName('ATIVO').AsInteger := 1;
      if inherited post then
        if Apply then
        begin
          if obBuscaSugestao = nil then
            obBuscaSugestao := TBuscasSugestao.create;

          vDadosIni.abreStatusProcessamento('', 'Salvando Sugestão de Compra (0 de ' + IntToStr(GridSug.RowCount - 1) + ')');

          try
            vCodEmpMult := vDadosIni.codEmpresa;
            for i := 1 to GridSug.RowCount - 1 do
            begin
              vDadosIni.abreStatusProcessamento('', 'Salvando Sugestão de Compra (' + IntToStr(I) + ' de ' + IntToStr(GridSug.RowCount - 1) + ')');

              if (copy(GridSug.cells[1, I], 1, 3) <> 'CMP') and (copy(GridSug.cells[1, I], 1, 3) <> 'VND') and (copy(GridSug.cells[1, I], 1, 3) <> 'TRF') then
              begin
                if (Trim(GridSug.cells[12, I]) <> '') and (Trim(GridSug.cells[13, I]) <> '') then
                begin
                  if (copy(GridSug.cells[1, I], 1, 3) = 'EMP') then
                  begin
                    if trim(GridSug.cells[14, I]) = '' then
                      vCodEmpMult := vDadosIni.codEmpresa
                    else
                      vCodEmpMult := trim(GridSug.cells[14, I]);
                  end;

                  if trim(GridSug.cells[15, I]) = '' then
                    gradeTemp := '0'
                  else
                    gradeTemp := trim(GridSug.cells[15, I]);

                  SqlOpen(' select GRUPO_PROD, COD_PROD, COD_EMPRESA, ' +
                    ' CLASSE_PROD, CLINV, CLPRECO, CLPOP, CLQTV, CLFRV, CLATL from PRODUTOS ' +
                    ' where GRUPO_PROD = ' + trim(GridSug.cells[12, I]) +
                    ' and COD_PROD = ' + QuotedStr(trim(GridSug.cells[13, I])) +
                    ' and COD_EMPRESA = ' + trim(GridSug.cells[14, I]), buscas);

                  vclasseprod := buscas.FieldByName('CLASSE_PROD').asstring + '-' +
                      buscas.FieldByName('CLINV').asstring + '-' +
                      buscas.FieldByName('CLPRECO').asstring + '-' +
                      buscas.FieldByName('CLPOP').asstring + '-' +
                      buscas.FieldByName('CLQTV').asstring + '-' +
                      buscas.FieldByName('CLFRV').asstring + '-' +
                      buscas.FieldByName('CLATL').asstring;

                  vseqid := Gencodigo('SUGESTAOCOMPRAIT2', dtmSugestaoCompras.SpIncCodigo, vDadosIni.codEmpresa);
                  obBuscaSugestao.buscas.Close;
                  obBuscaSugestao.buscas.SQL.Text := ' INSERT INTO SUGESTAOCOMPRAIT2 (' +
                    ' SEQID, COD_SUGESTAO, COD_EMPRESA, COD_EMP_MULT, ' +
                    ' GRUPO_PROD, COD_PROD, COD_GRADE, QTD_TRANSF, SUGESTAOCOMPRA, ESTOQUE_ATUAL, ' +
                    ' QTD_PEND, CLASSESPROD, MEDIAMES, ATIVO)' +
                    ' VALUES ( ' + inttostr(vseqid) +
                    ' , ' + inttostr(dataSet.FieldByName('COD_SUGESTAO').AsInteger) +
                    ' , ' + vDadosIni.codEmpresa +
                    ' , ' + trim(GridSug.cells[14, I]) +
                    ' , ' + trim(GridSug.cells[12, I]) +
                    ' , ' + quotedstr(trim(GridSug.cells[13, I])) +
                    ' , ' + gradeTemp +
                    ' , ' + vDadosIni.trocaVirgulaPorPonto(vDadosIni.tirapontos(trim(GridSug.cells[6, I]), 2)) +
                    ' , ' + vDadosIni.trocaVirgulaPorPonto(vDadosIni.tirapontos(trim(GridSug.cells[7, I]), 2)) +
                    ' , ' + vDadosIni.trocaVirgulaPorPonto(vDadosIni.tirapontos(trim(GridSug.cells[4, I]), 2)) +
                    ' , ' + vDadosIni.trocaVirgulaPorPonto(vDadosIni.tirapontos(trim(GridSug.cells[10, I]), 2)) +
                    ' , ' + quotedstr(trim(vclasseprod)) + //quotedstr(trim(GridSug.cells[7, I])) +
                    ' , ' + vDadosIni.trocaVirgulaPorPonto(vDadosIni.tirapontos(trim(GridSug.cells[5, I]), 2)) +
                    ' , 1)';
                  obBuscaSugestao.buscas.ExecSQL;
    //              obBuscaSugestao.buscas.Close;
    //              obBuscaSugestao.buscas.SQL.Text := ' INSERT INTO SUGESTAOCOMPRAIT (COD_SUGESTAO,' +
    //                ' COD_EMPRESA, GRUPO_PROD, COD_PROD, COD_GRADE, QTD_TRANSF, SUGESTAOCOMPRA, ESTOQUE_ATUAL, ' +
    //                ' QTD_PEND, CLASSESPROD, MEDIAMES, ATIVO)' +
    //                ' VALUES (' + inttostr(dataSet.FieldByName('COD_SUGESTAO').AsInteger) +
    //                ' , ' + vDadosIni.codEmpresa +
    //                ' , ' + trim(GridSug.cells[12, I]) +
    //                ' , ' + quotedstr(trim(GridSug.cells[13, I])) +
    //                ' , ' + gradeTemp +
    //                ' , ' + vDadosIni.trocaVirgulaPorPonto(vDadosIni.tirapontos(trim(GridSug.cells[6, I]), 2)) +
    //                ' , ' + vDadosIni.trocaVirgulaPorPonto(vDadosIni.tirapontos(trim(GridSug.cells[7, I]), 2)) +
    //                ' , ' + vDadosIni.trocaVirgulaPorPonto(vDadosIni.tirapontos(trim(GridSug.cells[4, I]), 2)) +
    //                ' , ' + vDadosIni.trocaVirgulaPorPonto(vDadosIni.tirapontos(trim(GridSug.cells[10, I]), 2)) +
    //                ' , ' + quotedstr(trim(GridSug.cells[8, I])) +
    //                ' , ' + vDadosIni.trocaVirgulaPorPonto(vDadosIni.tirapontos(trim(GridSug.cells[5, I]), 2)) +
    //                ' , 1)';
    //              obBuscaSugestao.buscas.ExecSQL;
                end;
              end
              else if (copy(GridSug.cells[1, I], 1, 3) = 'TRF') then
              begin
                if (Trim(GridSug.cells[12, I]) <> '') and (Trim(GridSug.cells[13, I]) <> '') then
                begin
                  if trim(GridSug.cells[15, I]) = '' then
                    gradeTemp := '0'
                  else
                    gradeTemp := trim(GridSug.cells[15, I]);

                  obBuscaSugestao.buscas.Close;
                  obBuscaSugestao.buscas.SQL.Text := ' INSERT INTO SUGESTAOCOMPRA_TRANSF (' +
                    ' COD_SUGESTAO, COD_EMPRESA, COD_EMP_MULT, ' +
                    ' GRUPO_PROD, COD_PROD, COD_GRADE, COD_EMP_ORIG, ' +
                    ' ESTOQUE_ATUAL, QTDE_TRANSF) ' +
                    ' VALUES ( ' + inttostr(dataSet.FieldByName('COD_SUGESTAO').AsInteger) +
                    ' , ' + vDadosIni.codEmpresa +
                    ' , ' + vCodEmpMult +
                    ' , ' + trim(GridSug.cells[12, I]) +
                    ' , ' + quotedstr(trim(GridSug.cells[13, I])) +
                    ' , ' + gradeTemp +
                    ' , ' + trim(GridSug.cells[14, I]) +
                    ' , ' + trim(GridSug.cells[4, I]) +
                    ' , ' + vDadosIni.trocaVirgulaPorPonto(vDadosIni.tirapontos(trim(GridSug.cells[11, I]), 2)) + '); ';
                  obBuscaSugestao.buscas.ExecSQL;
                end;
              end
            end;

            if not vDadosIni.vSugCompra.vMultiempresa then
            begin
              obBuscaSugestao.buscas.Close;
              obBuscaSugestao.buscas.SQL.Text := ' INSERT INTO SUGESTAOCOMPRA_EMP (' +
                ' COD_SUGESTAO, COD_EMPRESA, COD_EMP_MULT) ' +
                ' VALUES ( ' + inttostr(dataSet.FieldByName('COD_SUGESTAO').AsInteger) +
                ' , ' + vDadosIni.codEmpresa +
                ' , ' + vDadosIni.codEmpresa + ');';
              obBuscaSugestao.buscas.ExecSQL;
            end
            else
            begin
              try
                vEmpresasSugestao.dataSet.DisableControls;
                vEmpresasSugestao.dataSet.First;
                while not vEmpresasSugestao.dataSet.Eof do
                begin
                  if vEmpresasSugestao.dataSet.FieldByName('SEL').AsString = 'S' then
                  begin
                    obBuscaSugestao.buscas.Close;
                    obBuscaSugestao.buscas.SQL.Text := ' INSERT INTO SUGESTAOCOMPRA_EMP (' +
                      ' COD_SUGESTAO, COD_EMPRESA, COD_EMP_MULT) ' +
                      ' VALUES ( ' + inttostr(dataSet.FieldByName('COD_SUGESTAO').AsInteger) +
                      ' , ' + vDadosIni.codEmpresa +
                      ' , ' + inttostr(vEmpresasSugestao.dataSet.FieldByName('COD_EMPRESA').AsInteger) + ');';
                    obBuscaSugestao.buscas.ExecSQL;
                  end;

                  vEmpresasSugestao.dataSet.Next;
                end;
              finally
                vEmpresasSugestao.First;
                vEmpresasSugestao.dataSet.EnableControls;
              end;
            end;
          finally
            vDadosIni.fechaStatusProcessamento;
          end;

          _atualizarListaCotacao;
          if CommitaTransacao then
          begin
          	if not pSemMensagem then
	            Application.MessageBox(pchar('Sugestão de compra número ' + dataSet.FieldByName('COD_SUGESTAO').AsString + ' gravada com sucesso'), 'Informação', MB_ICONEXCLAMATION + MB_OK);
            Result := true;
          end
          else
            Application.MessageBox(pchar('Erro ao gravar Sugestão de Compra.' + chr(13) + 'A mesma não poderá ser salva.'), 'Informação', MB_ICONEXCLAMATION + MB_OK);
        end;
    end;
  except
    on e: exception do
    begin
      RollBackTransacao;
      Result := False;
      //      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      Application.MessageBox(pchar('Erro ao gravar Sugestão de Compra.' + chr(13) + 'A mesma não poderá ser salva.'), 'Informação', MB_ICONEXCLAMATION + MB_OK);
      registraErro(e.Message);
    end;
  end;
end;

function TSugestao.removerFiltros: boolean;
var
	I: Integer;
begin
	Result := false;

  fTempListaCotacao.EmptyDataSet;

  try
  	fTempListaCotacaoOld.DisableControls;
    fTempListaCotacaoOld.First;
    while not fTempListaCotacaoOld.Eof do
    begin
      fTempListaCotacao.Insert;
      for I := 0 to fTempListaCotacaoOld.FieldCount - 1 do
	    	fTempListaCotacao.Fields[I].Value := fTempListaCotacaoOld.Fields[I].Value;
      fTempListaCotacao.Post;

      fTempListaCotacaoOld.Next;
    end;
  finally
	  fTempListaCotacaoOld.First;
    fTempListaCotacao.IndexFieldNames := 'GRUPO_PROD;COD_PROD;COD_EMP_MULT';
    fTempListaCotacao.First;
    fTempListaCotacaoOld.EnableControls;
  end;

	Result := true;
end;

function TSugestao.RestaurarRegistro: boolean;
begin
  result := false;
  if dataSet.IsEmpty then
  	exit;

  if dataSet.FieldByName('ATIVO').asinteger = 0 then
  begin
    if Application.MessageBox('Tem certeza que deseja restaurar o registro selecionado?',
      'Restaurar Registro', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
    begin
      try
        if inherited Edit then
        begin
          dataSet.FieldByName('ATIVO').asinteger := 1;
          if inherited Post then
            if Apply then
            begin
              if obBuscaSugestao = nil then
                obBuscaSugestao := TBuscasSugestao.create;
              obBuscaSugestao.buscas.Close;
              obBuscaSugestao.buscas.SQL.Text := ' UPDATE SUGESTAOCOMPRAIT ' +
                ' SET ATIVO = 1' +
                ' WHERE COD_SUGESTAO = ' + inttostr(dataSet.FieldByName('COD_SUGESTAO').AsInteger) +
                ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
              obBuscaSugestao.buscas.ExecSQL;

              obBuscaSugestao.buscas.Close;
              obBuscaSugestao.buscas.SQL.Text := ' UPDATE SUGESTAOCOMPRAIT2 ' +
                ' SET ATIVO = 1' +
                ' WHERE COD_SUGESTAO = ' + inttostr(dataSet.FieldByName('COD_SUGESTAO').AsInteger) +
                ' AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
              obBuscaSugestao.buscas.ExecSQL;

              if CommitaTransacao then
                result := true;
            end;
        end;
      except
        RollBackTransacao;
        if result then //auditoria sim ou não
          vDadosIni.GravaAuditoria('SUG023', 'RESTAURAR', 'SUCESSO', 'SUGESTAOCOMPRA', dataSet.FieldByName('COD_SUGESTAO').AsString, buscas)
        else
          vDadosIni.GravaAuditoria('SUG023', 'RESTAURAR', 'FALHA', 'SUGESTAOCOMPRA', dataSet.FieldByName('COD_SUGESTAO').AsString, buscas);
      end;
    end;
  end
  else
    Application.MessageBox('Registro já está ativo' + chr(13) +
      'Não é necessário restaurá-lo', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
      
  if result then //auditoria sim ou não
    vDadosIni.GravaAuditoria('SUG023', 'RESTAURAR', 'SUCESSO', 'SUGESTAOCOMPRA', dataSet.FieldByName('COD_SUGESTAO').AsString, buscas)
  else
    vDadosIni.GravaAuditoria('SUG023', 'RESTAURAR', 'FALHA', 'SUGESTAOCOMPRA', dataSet.FieldByName('COD_SUGESTAO').AsString, buscas);
  Refresh;
end;

procedure TSugestao.SelecionaItemSimilar(ACol,
  ARow: Integer; Rect: TRect);
var
  Check: Integer;
  R: TRect;
begin
  if GridSug <> nil then
  begin
    with GridSug, Canvas do
    begin
      if Cells[0, aRow] = 'ITEM' then
      begin
        Brush.Color := TColor($00FFEBD9);
        FillRect(Rect);
        Font.Color := clWindowText;
        //        Font.Style := [fsBold];
        TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Cells[aCol, aRow]);
      end
      else if (Cells[0, aRow] <> 'S')
      	and (copy(Cells[1, aRow], 1, 3) <> 'CMP')
        and (copy(Cells[1, aRow], 1, 3) <> 'VND')
        and (copy(Cells[1, aRow], 1, 3) <> 'TRF') then
      begin
        Brush.Color := clMenu;
        FillRect(Rect);
        Font.Color := clWindowText;
        //        Font.Style := [fsBold];
        TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Cells[aCol, aRow]);
      end;

//      if Cells[0, aRow] = 'S' then
//      begin
//        Brush.Color := TColor($00DFDFFF);//ClRed;
//        FillRect(Rect);
//        Font.Color := clWindowText;
//        Font.Style := [fsBold];
//        TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Cells[aCol, aRow]);
//      end;
      if (copy(Cells[1, aRow], 1, 3) = 'CMP')
      	or (copy(Cells[1, aRow], 1, 3) = 'VND') then
      begin
        Brush.Color := clMoneyGreen;
        FillRect(Rect);
        Font.Color := clWindowText;
        //      Font.Style:=[fsBold];
        TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Cells[aCol, aRow]);
      end
      else if (copy(Cells[1, aRow], 1, 3) = 'TRF') then
      begin
        Brush.Color := TColor($00D7FFFF);
        FillRect(Rect);
        Font.Color := clWindowText;
        //      Font.Style:=[fsBold];
        TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Cells[aCol, aRow]);
      end;
      if (copy(Cells[1, aRow], 1, 3) = 'EMP') then
      begin
        Brush.Color := TColor($009BFFB5);
        FillRect(Rect);
        Font.Color := clWindowText;
        //      Font.Style:=[fsBold];
        TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Cells[aCol, aRow]);
      end;
    end;
  end;
end;

procedure TSugestao.SelecionaItemSugestao;
var
	vGrupoProdTemp: string;
  vCodProdTemp: string;
  vSelecionado: string;
  I: Integer;
begin
//  if (copy(GridSug.Cells[1, GridSug.Row], 1, 3) <> 'CMP')
//  	and (copy(GridSug.Cells[1, GridSug.Row], 1, 3) <> 'VND') then
	if (Trim(GridSug.Cells[12, GridSug.Row]) <> '')
  	and (Trim(GridSug.Cells[13, GridSug.Row]) <> '') then
  begin
//    if GridSug.cells[7, GridSug.Row] = '0' then
//      Application.MessageBox(Pchar('Produto não pode ser selecionado pois' + chr(13) + ' está com a sugestão de compra igual a zero.'), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1)
//    else
//    begin
      if GridSug.cells[9, GridSug.Row] <> 'SEL' then
        GridSug.cells[9, GridSug.Row] := 'SEL'
      else if GridSug.cells[9, GridSug.Row] = 'SEL' then
        GridSug.cells[9, GridSug.Row] := '';
//    end;
  end
  else if (copy(GridSug.Cells[1, GridSug.Row], 1, 3) <> 'CMP')
  	and (copy(GridSug.Cells[1, GridSug.Row], 1, 3) <> 'VND')
		and (Trim(GridSug.Cells[1, GridSug.Row]) <> '')
    and (Trim(GridSug.Cells[2, GridSug.Row]) <> '')
    and (Trim(GridSug.Cells[12, GridSug.Row]) = '')
    and (Trim(GridSug.Cells[13, GridSug.Row]) = '') then
  begin
  	if GridSug.cells[9, GridSug.Row] <> 'SEL' then
      GridSug.cells[9, GridSug.Row] := 'SEL'
    else if GridSug.cells[9, GridSug.Row] = 'SEL' then
      GridSug.cells[9, GridSug.Row] := '';

    vGrupoProdTemp := GridSug.cells[1, GridSug.Row];
    vCodProdTemp   := GridSug.cells[2, GridSug.Row];
    vSelecionado   := GridSug.cells[9, GridSug.Row];

    for i := GridSug.Row + 1 to GridSug.RowCount - 1 do
    begin
    	if (copy(GridSug.Cells[1, i], 1, 3) <> 'CMP') and (copy(GridSug.Cells[1, i], 1, 3) <> 'VND') then
      begin
      	if (copy(GridSug.Cells[1, i], 1, 3) <> 'EMP') AND (copy(GridSug.Cells[1, i], 1, 3) <> 'TRF')
        	and ((trim(vGrupoProdTemp) <> trim(GridSug.cells[1, i]))	or (trim(vCodProdTemp) <> trim(GridSug.cells[2, i]))) then
        begin
        	break;
        end
        else if (copy(GridSug.Cells[1, i], 1, 3) = 'EMP')
        	and (trim(vGrupoProdTemp) <> trim(GridSug.cells[12, i]))	or (trim(vCodProdTemp) <> trim(GridSug.cells[13, i])) then
        begin
          break;
        end;

        if (copy(GridSug.cells[1, I], 1, 3) = 'EMP')
          and (trim(vGrupoProdTemp) = trim(GridSug.cells[12, i]))
          and (trim(vCodProdTemp) = trim(GridSug.cells[13, i])) then
        begin
          if vSelecionado = 'SEL' then
            GridSug.cells[9, i] := 'SEL'
          else if vSelecionado <> 'SEL' then
            GridSug.cells[9, i] := '';
        end
        else if (copy(GridSug.cells[1, I], 1, 3) = 'TRF')
          and (trim(vGrupoProdTemp) = trim(GridSug.cells[12, i]))
          and (trim(vCodProdTemp) = trim(GridSug.cells[13, i])) then
        begin
          if vSelecionado = 'SEL' then
            GridSug.cells[9, i] := 'SEL'
          else if vSelecionado <> 'SEL' then
            GridSug.cells[9, i] := '';
        end;
      end;
    end;
  end;
end;

procedure TSugestao.SetaVariaveisSugestao(pCodSugestao: integer);
begin
  buscas.Close;
  buscas.SQL.Text := ' select QTDMESSUG, TP_SUG, TE_SUG, TA_SUG, FP_SUG, ES_SUG from SUGESTAOCOMPRA ' +
    ' where COD_SUGESTAO=' + inttostr(pCodSugestao) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  if not buscas.IsEmpty then
  begin
    QtdMesEmpresa := buscas.FieldByName('QTDMESSUG').AsInteger;
    TpProcessamento := buscas.FieldByName('TP_SUG').AsInteger;
    TpEntrega := buscas.FieldByName('TE_SUG').AsInteger;
    TpAlocacao := buscas.FieldByName('TA_SUG').AsInteger;
    FreqPedido := buscas.FieldByName('FP_SUG').AsInteger;
    vestsegsug := buscas.FieldByName('ES_SUG').AsInteger;
  end;
  buscas.Close;
end;

procedure TSugestao.SetaVariaveisSugestao;
begin
  buscas.Close;
  buscas.SQL.Text := 'select QTMESSUG,CASAS_DECIMAIS,TP_SUG,TE_SUG,TA_SUG,FP_SUG,EST_SEGURACAPROD from empresa ' +
  	' where cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
  if not buscas.IsEmpty then
  begin
    QtdMesEmpresa := buscas.FieldByName('QTMESSUG').AsInteger;
    TpProcessamento := buscas.FieldByName('TP_SUG').AsInteger;
    TpEntrega := buscas.FieldByName('TE_SUG').AsInteger;
    TpAlocacao := buscas.FieldByName('TA_SUG').AsInteger;
    FreqPedido := buscas.FieldByName('FP_SUG').AsInteger;
    EstSeguracaPadrao := buscas.FieldByName('EST_SEGURACAPROD').AsInteger;
  end;
  buscas.Close;
end;

procedure TSugestao.SqlTipoVendaOrigemSelecionada(CheckListBoxTipv,
  CheckListBoxOrigem: TCheckListBox; apelidoTabela_Campo: string);
var
  i: integer;
begin
  //Tipo Venda
  TipoVendaSelec := '(';
  for i := 0 to CheckListBoxTipv.Items.Count - 1 do
  begin
    if CheckListBoxTipv.Checked[i] then
    begin
      if TipoVendaSelec = '(' then
        TipoVendaSelec := TipoVendaSelec + apelidoTabela_Campo + '.tipv = ' + quotedstr(Copy(CheckListBoxTipv.Items[i], 1, 1))
      else
        TipoVendaSelec := TipoVendaSelec + ' or ' + apelidoTabela_Campo + '.tipv = ' + quotedstr(copy(CheckListBoxTipv.Items[i], 1, 1));
    end;
  end;
  TipoVendaSelec := TipoVendaSelec + ')';
  if TipoVendaSelec = '()' then
    TipoVendaSelec := (apelidoTabela_Campo + '.tipv is not null ');
  //Tipo Origem
  TipoOrigemSelec := '(';
  for i := 0 to CheckListBoxOrigem.Items.Count - 1 do
  begin
    if CheckListBoxOrigem.Checked[i] then
    begin
      if TipoOrigemSelec = '(' then
        TipoOrigemSelec := TipoOrigemSelec + apelidoTabela_Campo + '.tipor = ' + quotedstr(Copy(CheckListBoxOrigem.Items[i], 1, 1))
      else
        TipoOrigemSelec := TipoOrigemSelec + ' or ' + apelidoTabela_Campo + '.tipor = ' + quotedstr(copy(CheckListBoxOrigem.Items[i], 1, 1));
    end;
  end;
  TipoOrigemSelec := TipoOrigemSelec + ')';
  if TipoOrigemSelec = '()' then
    TipoOrigemSelec := (apelidoTabela_Campo + '.tipor is not null ');
end;

function TSugestao.StatusLixeira(aviso: boolean): boolean;
begin
  //Se lixeira vazia retorna falso senão verdadeiro
  if not ExecutaComandosSql('select COD_SUGESTAO from sugestaocompra where cod_empresa = ' + vDadosIni.codEmpresa + ' and (ativo = 0 or ativo is null)') then
  begin
    if aviso then
      Application.MessageBox('A lixeira está vazia.', 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    result := false;
  end
  else
    result := true;
end;

function TSugestao.verificaorigemvenda(var vcomb: TCombobox): boolean;
var
	I: Integer;
	vOrigemVenda: string;
begin
	for I := 0 to vcomb.Items.Count - 1 do
  	if Copy(trim(vDadosIni.vSugCompra.vOrigemTransf), 1, 1) = Copy(trim(vcomb.Items[I]), 1, 1) then
    	vcomb.ItemIndex := I;
end;

function TSugestao.verificatipovenda(var vcomb: TCombobox): boolean;
var
	I: Integer;
	vTipoVenda: string;
begin
	Result := false;

  vTipoVenda := '';
  
	buscas.close;
  buscas.sql.text := 'select * from tipo_vendas  ' +
   ' where tipo = ' + QuotedStr('REQ') +
   ' and (coalesce(n_usar_conferencia_produto, '''') <> ''S'') '+
   ' order by ordemexibicao';
  buscas.open;

  vcomb.Items.Clear;

  buscas.First;
  while not buscas.eof do
  begin
  	if (trim(vDadosIni.vSugCompra.vSiglaTransf) <> '')
    	and (Copy(trim(vDadosIni.vSugCompra.vSiglaTransf), 1, 1) =  trim(buscas.FieldByName('SIGLA').AsString)) then
    	vTipoVenda := trim(buscas.FieldByName('DESCRICAO').AsString)
  	else if (trim(vTipoVenda) = '') and (buscas.FieldByName('USARPRECOCUSTO').AsString = 'S') then
    	vTipoVenda := trim(buscas.FieldByName('DESCRICAO').AsString);

    vcomb.Items.Add(buscas.FieldByName('DESCRICAO').AsString);

    buscas.next;
  end;

  for I := 0 to vcomb.Items.Count - 1 do
    if trim(vTipoVenda) = trim(vcomb.Items[I]) then
      vcomb.ItemIndex := I;

  Result := true;
end;

function TSugestao.VisualizarSugestao: boolean;
var
  I, J, vcount: integer;
  vMostrarDescrRed: Boolean;
  vMostrarUltVendas: Boolean;
  vMostrarTransf: Boolean;
  vGrupoTemp: Integer;
  vCodProdTemp: string;
  vCodEmpresaTemp: Integer;
  buscasEmp: TIBQuery;
  buscasGer: TIBQuery;
  buscas2: TIBQuery;
  buscas3: TIBQuery;
  vQtdeEmp: Integer;
  vqtdeReg: Integer;
  vDataBanco: TDate;
  fTempGrupo: TClientDataSet;
  vSql: string;
begin
	try
    Result := false;

    if dataSet.IsEmpty then
      exit;

    Result := true;

    buscasEmp := TIBQuery.Create(Application);
    buscasEmp.Database := buscas.Database;
    buscasEmp.Transaction := buscas.Transaction;

    buscasGer := TIBQuery.Create(Application);
    buscasGer.Database := buscas.Database;
    buscasGer.Transaction := buscas.Transaction;

    buscas2 := TIBQuery.Create(Application);
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    buscas3 := TIBQuery.Create(Application);
    buscas3.Database := buscas.Database;
    buscas3.Transaction := buscas.Transaction;

    if obBuscaSugestao = nil then
      obBuscaSugestao := TBuscasSugestao.create;
    if not IsEmpty then
    begin
      vMostrarDescrRed := false;
      vMostrarUltVendas := false;
      vMostrarTransf := false;

      SqlOpen(' select cod_sugestao, cod_empresa from sugestaocompra_transf ' +
        ' where cod_sugestao = ' + IntToStr(dataSet.FieldByName('COD_SUGESTAO').AsInteger) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa, buscas);

      if not buscas.IsEmpty then
      begin
        FrmSugestaoCompra.CheckExibirTransf2.Checked := true;
        FrmSugestaoCompra.CheckExibirTransf2.Enabled := false;
      end;
      if not vDadosIni.abreForm('Opções para sugestão de compra', FrmSugestaoCompra.pnOpcoesSug, [ofEscapeExit, ofAlignAllClientWinCtrl]) then
      begin
        Result := false;
        exit;
      end
      else
      begin
        vMostrarDescrRed := FrmSugestaoCompra.CheckMostrarDescrRed2.Checked;
        vMostrarUltVendas := FrmSugestaoCompra.CheckMostrarUltimaVnd2.Checked;
        vMostrarTransf := FrmSugestaoCompra.CheckExibirTransf2.Checked;
      end;
      SetaVariaveisSugestao(dataSet.FieldByName('COD_SUGESTAO').AsInteger);
      lb := FrmSugestaoCompra.Label25;
      lb2 := FrmSugestaoCompra.lbProgressBar;
      ProgressBar := FrmSugestaoCompra.ProgressBar1;
      ProgressBar2 := FrmSugestaoCompra.ProgressBar2;
      GridSug := FrmSugestaoCompra.StGradS;
      FrmSugestaoCompra.MaskEdit4.text := dataSet.FieldByName('ES_SUG').AsString;
      FrmSugestaoCompra.MaskEdit14.text := dataSet.FieldByName('TP_SUG').AsString;
      FrmSugestaoCompra.MaskEdit15.text := dataSet.FieldByName('TE_SUG').AsString;
      FrmSugestaoCompra.MaskEdit16.text := dataSet.FieldByName('TA_SUG').AsString;
      FrmSugestaoCompra.MaskEdit17.text := dataSet.FieldByName('FP_SUG').AsString;
      FrmSugestaoCompra.ComboBox13.text := dataSet.FieldByName('QTDMESSUG').AsString;
      LimpaSugestao;
      vedtsug := 2;
      i := 0;
      //      GridSug.RowCount := 2;
      GridSug.Cells[0, 0] := 'ITEM';
      GridSug.ColWidths[0] := 70;
      GridSug.Cells[1, 0] := 'GR.';
      GridSug.ColWidths[1] := 35;
      GridSug.Cells[2, 0] := 'CODIGO';
      GridSug.ColWidths[2] := 70;
      GridSug.Cells[3, 0] := 'NºFABR.';
      GridSug.ColWidths[3] := 70;
      GridSug.Cells[4, 0] := 'EST.AT.';
      GridSug.ColWidths[4] := 70;
      GridSug.Cells[5, 0] := 'MÉDIA MES';
      GridSug.ColWidths[5] := 70;
      GridSug.Cells[6, 0] := 'QT TRANSF';
      GridSug.ColWidths[6] := 70;
      GridSug.Cells[7, 0] := 'SUG.';
      GridSug.ColWidths[7] := 70;
      GridSug.Cells[8, 0] := 'CODIGO PROD CL';
      GridSug.ColWidths[8] := 250;
      GridSug.Cells[9, 0] := 'SELEC';
      GridSug.ColWidths[9] := 60;
      GridSug.Cells[10, 0] := 'QT PEND';
      GridSug.ColWidths[10] := 90;
      GridSug.Cells[11, 0] := 'DESC PROD';
      GridSug.ColWidths[11] := 490;
      GridSug.Cells[12, 0] := 'GRUPO';
      GridSug.ColWidths[12] := 50;
      GridSug.Cells[13, 0] := 'PROD';
      GridSug.ColWidths[13] := 50;
      GridSug.Cells[14, 0] := 'EMP';
      GridSug.ColWidths[14] := 50;

      if dataSet.FieldByName('USODEGRADE').AsString = 'S' then
      begin
        GridSug.Cells[15, 0] := 'GRADE';
        GridSug.ColWidths[15] := 50;
        GridSug.Cells[16, 0] := 'DESC GRADE';
        GridSug.ColWidths[16] := 250;
        GridSug.Cells[17, 0] := 'DESC GRADE 1';
        GridSug.ColWidths[17] := 250;
      end
      else
      begin
        GridSug.ColWidths[15] := 0;
        GridSug.ColWidths[16] := 0;
        GridSug.ColWidths[17] := 0;
      end;
      
      GridSug.FixedCols := 1;
      if GridSug.RowCount > 1 then
        GridSug.FixedRows := 1;

      vDataBanco := vDadosIni.getDataBanco(buscas);

      if not vDadosIni.vSugCompra.vMultiempresa then
      begin
        vSql := ' select ' + vDadosIni.CodEmpresa + ' as cod_empresa, ' +
          QuotedStr(vDadosIni.vEmp.vnomeEmpresa) + ' as identificacao_emp from rdb$database ';
      end
      else
      begin
        vSql := ' select ' + vDadosIni.CodEmpresa + ' as cod_empresa, ' +
          QuotedStr(vDadosIni.vEmp.vnomeEmpresa) + ' as identificacao_emp from rdb$database ' +
          ' union ' +
          ' select distinct sug.cod_emp_mult, ' +
          ' coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp ' +
          ' from sugestaocompra_emp sug ' +
          ' inner join empresa emp on emp.cod_empresa = sug.cod_emp_mult ' +
          ' where sug.cod_sugestao = ' + IntToStr(dataset.FieldByName('COD_SUGESTAO').AsInteger) +
          ' and sug.cod_empresa = ' + vDadosIni.CodEmpresa +
          ' and sug.cod_emp_mult <> ' + vDadosIni.CodEmpresa;
      end;
      SqlOpen(vSql, buscas).FetchAll;

      vQtdeEmp := buscas.RecordCount;

      fTempGrupo := TClientDataSet.Create(nil);
      fTempGrupo.Close;
      fTempGrupo.FieldDefs.Clear;
      fTempGrupo.FieldDefs.Add('GRUPO_PROD', ftInteger, 0, false);
      if fTempGrupo.Tag = 0 then
      try
        fTempGrupo.CreateDataSet;
        fTempGrupo.Tag := 1;
      finally
      end;

      vSql := ' select distinct si.GRUPO_PROD, count(*) QTDE from sugestaocompraitens si ' +
        ' inner join produtos pr on si.grupo_prod = pr.grupo_prod and si.cod_prod = pr.cod_prod and si.cod_empresa = pr.cod_empresa ' +
        ' where si.cod_sugestao = ' + IntToStr(dataset.FieldByName('COD_SUGESTAO').AsInteger) +
        ' and si.cod_empresa = ' + vDadosIni.codEmpresa +
        vDadosIni.IfThen(not vDadosIni.vSugCompra.vMultiempresa, ' and si.cod_emp_mult = ' + vDadosIni.CodEmpresa, '') +
        ' and pr.ativo = 1 ' +
        ' group by 1 ' + 
        ' order by si.grupo_prod ';
      SqlOpen(vSql, buscas).FetchAll;

      vqtdeReg := 0;
      buscas.First;
      while not buscas.Eof do
      begin
        fTempGrupo.Insert;
        fTempGrupo.FieldByName('GRUPO_PROD').AsInteger := buscas.FieldByName('GRUPO_PROD').AsInteger;
        fTempGrupo.Post;

        vqtdeReg := vqtdeReg + buscas.FieldByName('QTDE').AsInteger;

        buscas.Next;
      end;
      fTempGrupo.IndexFieldNames := 'GRUPO_PROD';

      ProgressBar.max := vqtdeReg;
      ProgressBar2.max := vqtdeReg;
      ProgressBar.Position := 0;
      ProgressBar2.Position := 0;
      lb.Caption := 'Produto Analizado:';
      lb2.Caption := 'Produto Analizado:';

      vDadosIni.abreStatusProcessamento('', 'Abrindo Sugestão de Compra (0 de ' + IntToStr(buscas.RecordCount) + ')');
      
      fTempGrupo.First;
      while not fTempGrupo.Eof do
      begin
        vSql := ' select si.*, ' +
          ' pr.descr_prod, pr.est_f, ' +
          ' pr.prec_cus_prod, pr.prec_cusm_prod, ' +
          ' pr.est_r, pr.quant_ped_prod, pr.quant_ret_prod, pr.qconf_prod,' +
          ' pr.quant_tr_prod, pr.qtdemb, pr.num_fab_prod, pr.classe_prod,' +
          ' pr.clinv, pr.clpop, pr.clfrv, pr.clatl, pr.clqtv, pr.clpreco, pr.emb_prod,' +
          ' pr.freq_pedido, pr.est_seguranca, pr.tempo_entregasug, pr.descr_prod_red, ';

        if dataSet.FieldByName('USODEGRADE').AsString = 'S' then
          vSql := vSql +
            ' coalesce(g.descricao, ''SEM GRADE'') descricao, ' +
            ' coalesce(g.descricao1, ''SEM GRADE'') descricao1, ' +
            ' coalesce(g.cod_grade, 0) cod_grade, '
        else
          vSql := vSql +
            ' ''SEM GRADE'' descricao, ' +
            ' ''SEM GRADE'' descricao1, ' +
            ' 0 cod_grade, ';

        vSql := vSql +
          ' coalesce(similares.existesimilar, 0) existesimilar, ' +
          ' coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp ' +
          ' from sugestaocompraitens si ' +
          ' inner join produtos pr on si.grupo_prod = pr.grupo_prod and si.cod_prod = pr.cod_prod and si.cod_emp_mult = pr.cod_empresa ' +
          ' inner join empresa emp on emp.cod_empresa = si.cod_emp_mult ';

        if dataSet.FieldByName('USODEGRADE').AsString = 'S' then
          vSql := vSql +
            ' left join cod_grade_prod cg on ' +
            ' 	cg.grupo_prod = pr.grupo_prod and cg.cod_prod = pr.cod_prod and cg.cod_empresa = pr.cod_empresa and cg.cod_grade = si.cod_grade ' +
            ' left join grade g on cg.cod_empresa = g.cod_empresa and cg.cod_grade = g.cod_grade ';

        if not vDadosIni.vProdSimilar.vAgruparSimilar then
          vSql := vSql + ' left join getprodutossimilar(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 '
        else if not vDadosIni.vProdSimilar.vSimilaresEntreSi then
          vSql := vSql + ' left join getprodutossimilargrupo(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 '
        else
          vSql := vSql + ' left join getprodutossimilargrupoentresi(pr.grupo_prod, pr.cod_prod, pr.cod_empresa) similares on 1 = 1 ';

        vSql := vSql +
          ' where si.cod_empresa = ' + vDadosIni.CodEmpresa +
          ' and si.cod_sugestao = ' + IntToStr(dataset.FieldByName('COD_SUGESTAO').AsInteger) +
          vDadosIni.IfThen(not vDadosIni.vSugCompra.vMultiempresa, ' and si.cod_emp_mult = ' + vDadosIni.CodEmpresa, '') +
          ' and pr.ativo = 1 ';

        vSql := vSql + ' and si.grupo_prod = ' + IntToStr(fTempGrupo.FieldByName('GRUPO_PROD').AsInteger);
        vSql := vSql + ' order by si.grupo_prod, si.cod_prod, si.cod_emp_mult, si.cod_empresa ';
        SqlOpen(vSql, buscas).FetchAll;
  //        ProgressBar.max := buscas.RecordCount;
  //        ProgressBar2.max := buscas.RecordCount;

        vGrupoTemp := 0;
        vCodProdTemp := '';
        vCodEmpresaTemp := 0;

  //        ProgressBar.Position := 0;
  //        ProgressBar2.Position := 0;
  //        lb.Caption := 'Produto Analizado:';
  //        lb2.Caption := 'Produto Analizado:';
      
        if obBuscaClasse = nil then
          obBuscaClasse := TBuscasClasses.create;

  //        vDadosIni.abreStatusProcessamento('', 'Abrindo Sugestão de Compra (0 de ' + IntToStr(buscas.RecordCount) + ')');

        buscas.First;
        while not buscas.Eof do
        begin
          Application.ProcessMessages;
  //        lb.caption := vDadosIni.StrZero(vcount, 5);
  //        lb2.caption := vDadosIni.StrZero(vcount, 5);

          if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) then
            vCodEmpresaTemp := 0;

          if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) then
          begin
            vCodigosEmpresas := '';
            vSql := ' select distinct cod_emp_mult as cod_empresa from sugestaocompraitens ' +
              ' where cod_sugestao = ' + IntToStr(dataset.FieldByName('COD_SUGESTAO').AsInteger) +
              ' and cod_empresa = ' + vDadosIni.CodEmpresa +
              vDadosIni.IfThen(not vDadosIni.vSugCompra.vMultiempresa, ' and cod_emp_mult = ' + vDadosIni.CodEmpresa, '') +
              ' and grupo_prod = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').AsInteger) +
              ' and cod_prod = ' + QuotedStr(trim(buscas.FieldByName('COD_PROD').AsString));
            SqlOpen(vSql, buscasEmp).FetchAll;

            buscasEmp.First;
            while not buscasEmp.Eof do
            begin
              if trim(vCodigosEmpresas) = '' then
                vCodigosEmpresas := IntToStr(buscasEmp.FieldByName('cod_empresa').AsInteger)
              else
                vCodigosEmpresas := vCodigosEmpresas + ', ' + IntToStr(buscasEmp.FieldByName('cod_empresa').AsInteger);

              buscasEmp.Next;
            end;
          end;

          if (vQtdeEmp > 1) then
            if (vGrupoTemp <> buscas.FieldByName('GRUPO_PROD').AsInteger) or (trim(vCodProdTemp) <> trim(buscas.FieldByName('COD_PROD').AsString)) then
            begin
              vSql := ' SELECT ' +
                ' SUM(COALESCE(SUG.ESTOQUE_ATUAL, 0)) ESTOQUE_ATUAL, ' +
                ' SUM(COALESCE(SUG.MEDIAMES, 0)) MEDIAMES, ' +
                ' SUM(COALESCE(SUG.QTD_TRANSF, 0)) QTD_TRANSF, ' +
                ' SUM(COALESCE(SUG.SUGESTAOCOMPRA, 0)) SUGESTAOCOMPRA, ' +
                ' SUM(COALESCE(SUG.QTD_PEND, 0)) QTD_PEND FROM SUGESTAOCOMPRAITENS SUG ' +
                ' WHERE SUG.COD_SUGESTAO = ' + IntToStr(dataset.FieldByName('COD_SUGESTAO').AsInteger) +
                ' AND SUG.COD_EMPRESA = ' + vDadosIni.codEmpresa +
                ' AND SUG.GRUPO_PROD = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').AsInteger) +
                ' AND SUG.COD_PROD = ' + QuotedStr(trim(buscas.FieldByName('COD_PROD').AsString));
              SqlOpen(vSql, buscasGer);

              I := I + 1;
  //              if obBuscaClasse.ProdutoTemSimilar(
  //                buscas.FieldByName('COD_PROD').asstring,
  //                buscas.FieldByName('GRUPO_PROD').asinteger,
  //                vCodigosEmpresas) then
  //                  GridSug.Cells[0, I] := 'S';
              if buscas.FieldByName('EXISTESIMILAR').AsInteger > 0 then
                GridSug.Cells[0, I] := 'S';

              GridSug.cells[1, I] := buscas.FieldByName('GRUPO_PROD').asstring;
              GridSug.cells[2, I] := buscas.FieldByName('COD_PROD').asstring;
              GridSug.Cells[3, I] := buscas.FieldByName('NUM_FAB_PROD').asstring;

              GridSug.Cells[4, I] := FloatToStr(buscasGer.FieldByName('ESTOQUE_ATUAL').AsFloat);
              GridSug.Cells[5, I] := FloatToStr(buscasGer.FieldByName('MEDIAMES').AsFloat); //format('%n', [media]);
              GridSug.Cells[6, I] := FloatToStr(buscasGer.FieldByName('QTD_TRANSF').AsFloat);
              GridSug.Cells[7, I] := FloatToStr(buscasGer.FieldByName('SUGESTAOCOMPRA').AsFloat); //format('%n', [sugc]);
              GridSug.Cells[8, I] := buscas.FieldByName('CLASSESPROD').asstring;
              GridSug.Cells[9, I] := '';
              GridSug.Cells[10, I] := FloatToStr(buscasGer.FieldByName('QTD_PEND').AsFloat); //floattostr(vpend);
  //            GridSug.Cells[10, I] := buscas.FieldByName('DESCR_PROD').asstring; // + ' ' + buscas.FieldByName('EMB_PROD').asstring;

              if vMostrarDescrRed then
              begin
                GridSug.Cells[11, I] :=
                  vDadosIni.IfThen(Trim(buscas.FieldByName('DESCR_PROD_RED').asstring) <> '',
                    Trim(buscas.FieldByName('DESCR_PROD_RED').asstring),
                    Trim(buscas.FieldByName('DESCR_PROD').asstring)) +
                  vDadosIni.IfThen(trim(buscas.FieldByName('EMB_PROD').asstring) <> '',
                    ' ' + trim(buscas.FieldByName('EMB_PROD').asstring), '') +
                  vDadosIni.IfThen(dataSet.FieldByName('USODEGRADE').AsString = 'S',
                    vDadosIni.IfThen(buscas.FieldByName('COD_GRADE').AsInteger > 0,
                      ' ' + Trim(buscas.FieldByName('DESCRICAO').asstring), ''),
                    '');
              end
              else
              begin
                GridSug.Cells[11, I] :=
                  vDadosIni.IfThen(Trim(buscas.FieldByName('DESCR_PROD').asstring) <> '',
                    Trim(buscas.FieldByName('DESCR_PROD').asstring),
                    Trim(buscas.FieldByName('DESCR_PROD_RED').asstring)) +
                  vDadosIni.IfThen(trim(buscas.FieldByName('EMB_PROD').asstring) <> '',
                    ' ' + trim(buscas.FieldByName('EMB_PROD').asstring), '') +
                  vDadosIni.IfThen(dataSet.FieldByName('USODEGRADE').AsString = 'S',
                    vDadosIni.IfThen(buscas.FieldByName('COD_GRADE').AsInteger > 0,
                      ' ' + Trim(buscas.FieldByName('DESCRICAO').asstring), ''),
                    '');
              end;

              GridSug.cells[12, I] := '';
              GridSug.cells[13, I] := '';
              GridSug.cells[14, I] := '';

  //              if dataSet.FieldByName('USODEGRADE').AsString = 'S' then
  //              begin
  //                GridSug.Cells[15, I] := buscas.FieldByName('COD_GRADE').asstring;
  //                GridSug.Cells[16, I] := Trim(buscas.FieldByName('DESCRICAO').asstring);
  //                GridSug.Cells[17, I] := Trim(buscas.FieldByName('DESCRICAO1').asstring);
  //              end
  //              else
  //              begin
                GridSug.Cells[15, I] := '';
                GridSug.Cells[16, I] := '';
                GridSug.Cells[17, I] := '';
  //              end;
            end;


          I := I + 1;
  //          if obBuscaClasse.ProdutoTemSimilar(
  //            buscas.FieldByName('COD_PROD').asstring,
  //            buscas.FieldByName('GRUPO_PROD').asinteger,
  //            IntToStr(buscas.FieldByName('COD_EMP_MULT').asinteger)) then
  //            GridSug.Cells[0, I] := 'S';
          if buscas.FieldByName('EXISTESIMILAR').AsInteger > 0 then
            GridSug.Cells[0, I] := 'S';

          if (vQtdeEmp > 1) and (vCodEmpresaTemp <> buscas.FieldByName('COD_EMP_MULT').AsInteger) then
            GridSug.cells[1, I] := 'EMP ' + buscas.FieldByName('COD_EMP_MULT').AsString
          else
          begin
            GridSug.cells[1, I] := buscas.FieldByName('GRUPO_PROD').asstring;
            GridSug.cells[2, I] := buscas.FieldByName('COD_PROD').asstring;
            GridSug.Cells[3, I] := buscas.FieldByName('NUM_FAB_PROD').asstring;
          end;
          GridSug.Cells[4, I] := FloatToStr(buscas.FieldByName('ESTOQUE_ATUAL').AsFloat);
          GridSug.Cells[5, I] := FloatToStr(buscas.FieldByName('MEDIAMES').AsFloat); //format('%n', [media]);
          GridSug.Cells[6, I] := FloatToStr(buscas.FieldByName('QTD_TRANSF').AsFloat);
          GridSug.Cells[7, I] := FloatToStr(buscas.FieldByName('SUGESTAOCOMPRA').AsFloat); //format('%n', [sugc]);

          if (vQtdeEmp > 1) and (vCodEmpresaTemp <> buscas.FieldByName('COD_EMP_MULT').AsInteger) then
            GridSug.Cells[8, I] := Trim(buscas.FieldByName('IDENTIFICACAO_EMP').AsString)
          else
            GridSug.Cells[8, I] := buscas.FieldByName('CLASSE_PROD').asstring + '-' +
              buscas.FieldByName('CLINV').asstring + '-' + buscas.FieldByName('CLPRECO').asstring + '-' +
              buscas.FieldByName('CLPOP').asstring + '-' + buscas.FieldByName('CLQTV').asstring + '-' +
              buscas.FieldByName('CLFRV').asstring + '-' + buscas.FieldByName('CLATL').asstring;

          GridSug.Cells[9, I] := '';
          GridSug.Cells[10, I] := FloatToStr(buscas.FieldByName('QTD_PEND').AsFloat); //floattostr(vpend);

          if (vQtdeEmp > 1) then
            GridSug.cells[11, I] := ''
          else
          begin
            if vMostrarDescrRed then
            begin
              GridSug.Cells[11, I] :=
                vDadosIni.IfThen(Trim(buscas.FieldByName('DESCR_PROD_RED').asstring) <> '',
                  Trim(buscas.FieldByName('DESCR_PROD_RED').asstring),
                  Trim(buscas.FieldByName('DESCR_PROD').asstring)) +
                vDadosIni.IfThen(trim(buscas.FieldByName('EMB_PROD').asstring) <> '',
                  ' ' + trim(buscas.FieldByName('EMB_PROD').asstring), '') +
                vDadosIni.IfThen(dataSet.FieldByName('USODEGRADE').AsString = 'S',
                  vDadosIni.IfThen(buscas.FieldByName('COD_GRADE').AsInteger > 0,
                    ' ' + Trim(buscas.FieldByName('DESCRICAO').asstring), ''),
                  '');
            end
            else
            begin
              GridSug.Cells[11, I] :=
                vDadosIni.IfThen(Trim(buscas.FieldByName('DESCR_PROD').asstring) <> '',
                  Trim(buscas.FieldByName('DESCR_PROD').asstring),
                  Trim(buscas.FieldByName('DESCR_PROD_RED').asstring)) +
                vDadosIni.IfThen(trim(buscas.FieldByName('EMB_PROD').asstring) <> '',
                  ' ' + trim(buscas.FieldByName('EMB_PROD').asstring), '') +
                vDadosIni.IfThen(dataSet.FieldByName('USODEGRADE').AsString = 'S',
                  vDadosIni.IfThen(buscas.FieldByName('COD_GRADE').AsInteger > 0,
                    ' ' + Trim(buscas.FieldByName('DESCRICAO').asstring), ''),
                  '');
            end;
          end;

          GridSug.cells[12, I] := buscas.FieldByName('GRUPO_PROD').asstring;
          GridSug.cells[13, I] := buscas.FieldByName('COD_PROD').asstring;
          GridSug.cells[14, I] := buscas.FieldByName('COD_EMP_MULT').asstring;

          if dataSet.FieldByName('USODEGRADE').AsString = 'S' then
          begin
            GridSug.Cells[15, I] := IntToStr(buscas.FieldByName('COD_GRADE').asinteger);
            GridSug.Cells[16, I] := Trim(buscas.FieldByName('DESCRICAO').asstring);
            GridSug.Cells[17, I] := Trim(buscas.FieldByName('DESCRICAO1').asstring);
          end
          else
          begin
            GridSug.Cells[15, I] := '';
            GridSug.Cells[16, I] := '';
            GridSug.Cells[17, I] := '';
          end;

          if dataSet.FieldByName('USODEGRADE').AsString = 'S' then
          begin
            if buscas.FieldByName('cod_grade').asinteger = 0 then
            begin
              vSql :=
  //              	' select first 3 c.num_nota_nfe, c.fornec, c.valor, c.data, ' +
  //                ' infe.quant_item_nfe, cgpc.qtde, cgpc.cod_grade, g.descricao, g.descricao1, cl.nome_cliente from custos c ' +
  //                ' inner join item_nf_entrada infe on ' +
  //                ' c.num_nota_nfe = infe.num_nota_nfe and c.fornec = infe.cod_forn_nfe and c.cod_empresa = infe.cod_empresa ' +
  //                ' and c.grupo_prod = infe.grupo_prod and c.cod_prod = infe.cod_prod ' +
  //                ' left join cod_grade_prod_compra cgpc on ' +
  //                ' infe.grupo_prod = cgpc.grupo_prod and infe.cod_prod = cgpc.cod_prod and infe.cod_forn_nfe = cgpc.cod_forn_nfe ' +
  //                ' and infe.cod_empresa = cgpc.cod_empresa ' +
  //                ' left join cod_grade_prod cg on ' +
  //                ' cgpc.cod_grade = cg.cod_grade and cgpc.grupo_prod = cg.grupo_prod and cgpc.cod_prod = cg.cod_prod and cgpc.cod_empresa = cg.cod_empresa ' +
  //                ' left join grade g on ' +
  //                ' cg.cod_grade = g.cod_grade and cg.cod_empresa = g.cod_empresa ' +
  //                ' left join clientes cl on cl.cod_cliente = c.fornec and cl.cod_empresa = c.cod_empresa ' +
  //                ' where c.grupo_prod = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').asinteger) +
  //                ' and c.cod_prod = ' + QuotedStr(trim(buscas.FieldByName('COD_PROD').asstring)) +
  //                ' and c.cod_empresa = ' + IntToStr(buscas.FieldByName('COD_EMP_MULT').asinteger) +
  //                ' and c.ativo = 1' +
  //                ' and cgpc.cod_grade is null ' +
  //                ' union ' +
                ' select first 3 c.num_nota_nfe,c.fornec,c.valor,c.data, ' +
                ' nfit.quantidade as quant_item_nfe, cgpc.qtde, cgpc.cod_grade, g.descricao, g.descricao1, cl.nome_cliente from custos c ' +
                ' inner join notafiscal_item nfit on ' +
                ' c.cod_nf = nfit.cod_nf and c.cod_empresa = nfit.cod_empresa ' +
                ' and c.grupo_prod = nfit.grupo_prod and c.cod_prod = nfit.cod_prod ' +
                ' left join cod_grade_prod_compra cgpc on ' +
                ' nfit.grupo_prod = cgpc.grupo_prod and nfit.cod_prod = cgpc.cod_prod and nfit.cod_nf = cgpc.num_nota_nfe ' +
                ' and nfit.cod_empresa = cgpc.cod_empresa ' +
                ' left join cod_grade_prod cg on ' +
                ' cgpc.cod_grade = cg.cod_grade and cgpc.grupo_prod = cg.grupo_prod and cgpc.cod_prod = cg.cod_prod and cgpc.cod_empresa = cg.cod_empresa ' +
                ' left join grade g on ' +
                ' cg.cod_grade = g.cod_grade and cg.cod_empresa = g.cod_empresa ' +
                ' left join clientes cl on cl.cod_cliente = c.fornec and cl.cod_empresa = c.cod_empresa ' +
                ' where c.grupo_prod = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').asinteger) +
                ' and c.cod_prod = ' + QuotedStr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                ' and c.cod_empresa = ' + IntToStr(buscas.FieldByName('COD_EMP_MULT').asinteger) +
                ' and c.ativo = 1' +
                ' and cgpc.cod_grade is null ' +
                ' order by 4 desc';
            end
            else
            begin
              vSql :=
  //                ' select first 3 c.num_nota_nfe, c.fornec, c.valor, c.data,' +
  //                ' infe.quant_item_nfe, cgpc.qtde, cgpc.cod_grade, g.descricao, g.descricao1, cl.nome_cliente from custos c ' +
  //                ' inner join item_nf_entrada infe on ' +
  //                ' c.num_nota_nfe = infe.num_nota_nfe and c.fornec = infe.cod_forn_nfe and c.cod_empresa = infe.cod_empresa ' +
  //                ' and c.grupo_prod = infe.grupo_prod and c.cod_prod = infe.cod_prod ' +
  //                ' left join cod_grade_prod_compra cgpc on ' +
  //                ' infe.grupo_prod = cgpc.grupo_prod and infe.cod_prod = cgpc.cod_prod and infe.cod_forn_nfe = cgpc.cod_forn_nfe ' +
  //                ' and infe.cod_empresa = cgpc.cod_empresa ' +
  //                ' left join cod_grade_prod cg on ' +
  //                ' cgpc.cod_grade = cg.cod_grade and cgpc.grupo_prod = cg.grupo_prod and cgpc.cod_prod = cg.cod_prod and cgpc.cod_empresa = cg.cod_empresa ' +
  //                ' left join grade g on ' +
  //                ' cg.cod_grade = g.cod_grade and cg.cod_empresa=g.cod_empresa ' +
  //                ' left join clientes cl on cl.cod_cliente = c.fornec and cl.cod_empresa = c.cod_empresa ' +
  //                ' where c.grupo_prod = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').asinteger) +
  //                ' and c.cod_prod = ' + QuotedStr(trim(buscas.FieldByName('COD_PROD').asstring)) +
  //                ' and c.cod_empresa = ' + IntToStr(buscas.FieldByName('COD_EMP_MULT').asinteger) +
  //                ' and c.ativo = 1' +
  //                ' and cgpc.cod_grade = ' + IntToStr(buscas.FieldByName('COD_GRADE').asinteger) +
  //                ' union ' +
                ' select first 3 c.num_nota_nfe, c.fornec, c.valor, c.data,' +
                ' nfit.quantidade as quant_item_nfe, cgpc.qtde, cgpc.cod_grade, g.descricao, g.descricao1, cl.nome_cliente from custos c ' +
                ' inner join notafiscal_item nfit on ' +
                ' c.cod_nf = nfit.cod_nf and c.cod_empresa = nfit.cod_empresa ' +
                ' and c.grupo_prod = nfit.grupo_prod and c.cod_prod = nfit.cod_prod ' +
                ' left join cod_grade_prod_compra cgpc on ' +
                ' nfit.grupo_prod = cgpc.grupo_prod and nfit.cod_prod = cgpc.cod_prod and nfit.cod_nf = cgpc.num_nota_nfe ' +
                ' and nfit.cod_empresa = cgpc.cod_empresa ' +
                ' left join cod_grade_prod cg on ' +
                ' cgpc.cod_grade = cg.cod_grade and cgpc.grupo_prod = cg.grupo_prod and cgpc.cod_prod = cg.cod_prod and cgpc.cod_empresa = cg.cod_empresa ' +
                ' left join grade g on ' +
                ' cg.cod_grade = g.cod_grade and cg.cod_empresa = g.cod_empresa ' +
                ' left join clientes cl on cl.cod_cliente = c.fornec and cl.cod_empresa = c.cod_empresa ' +
                ' where c.grupo_prod = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').asinteger) +
                ' and c.cod_prod = ' + QuotedStr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                ' and c.cod_empresa = ' + IntToStr(buscas.FieldByName('COD_EMP_MULT').asinteger) +
                ' and c.ativo = 1' +
                ' and cgpc.cod_grade = ' + IntToStr(buscas.FieldByName('COD_GRADE').asinteger) +
                ' order by 4 desc';
            end;
          end
          else
          begin
            vSql :=
  //            	' select first 3 c.num_nota_nfe, c.cod_empresa, c.fornec, c.valor, c.data, infe.quant_item_nfe, cl.nome_cliente from custos c ' +
  //              ' inner join item_nf_entrada infe on c.num_nota_nfe = infe.num_nota_nfe and c.fornec = infe.cod_forn_nfe and c.cod_empresa = infe.cod_empresa ' +
  //              ' and c.grupo_prod = infe.grupo_prod and c.cod_prod = infe.cod_prod ' +
  //              ' left join clientes cl on cl.cod_cliente = c.fornec and cl.cod_empresa = c.cod_empresa ' +
  //              ' where c.grupo_prod= ' + IntToStr(buscas.FieldByName('GRUPO_PROD').asinteger) +
  //              ' and c.cod_prod = ' + QuotedStr(trim(buscas.FieldByName('COD_PROD').asstring)) +
  //              ' and c.cod_empresa = ' + IntToStr(buscas.FieldByName('COD_EMP_MULT').asinteger) +
  //              ' and c.ativo=1' +
  //              ' union ' +
               'select first 3 c.num_nota_nfe, c.cod_empresa, c.fornec, c.valor, c.data, nfit.quantidade as quant_item_nfe, cl.nome_cliente from custos c ' +
              ' inner join notafiscal_item nfit on c.cod_nf = nfit.cod_nf and c.cod_empresa = nfit.cod_empresa ' +
              ' and c.grupo_prod = nfit.grupo_prod and c.cod_prod = nfit.cod_prod ' +
              ' left join clientes cl on cl.cod_cliente = c.fornec and cl.cod_empresa = c.cod_empresa ' +
              ' where c.grupo_prod = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').asinteger) +
              ' and c.cod_prod = ' + QuotedStr(trim(buscas.FieldByName('COD_PROD').asstring)) +
              ' and c.cod_empresa = ' + IntToStr(buscas.FieldByName('COD_EMP_MULT').asinteger) +
              ' and c.ativo = 1' +
              ' order by 4 desc';
          end;
          SqlOpen(vSql, buscas2).FetchAll;
        
          buscas2.First;
          while not buscas2.Eof do
          begin
            I := I + 1;
            GridSug.cells[1, I] := 'CMP ' + buscas.FieldByName('CLASSE_PROD').AsString;
            GridSug.cells[2, I] := buscas2.FieldByName('DATA').AsString;
            GridSug.Cells[3, I] := buscas.FieldByName('GRUPO_PROD').AsString;
            GridSug.Cells[4, I] := trim(buscas.FieldByName('COD_PROD').AsString);
            GridSug.Cells[5, I] := format('%n', [buscas2.FieldByName('VALOR').AsFloat]);
            GridSug.Cells[6, I] := buscas2.FieldByName('NUM_NOTA_NFE').AsString;
            GridSug.Cells[7, I] := '';

            GridSug.Cells[8, I] := vDadosIni.strzero(buscas2.FieldByName('FORNEC').AsInteger, 5) + ' ' + buscas2.FieldByName('NOME_CLIENTE').asstring;

  //            if obBuscaSugestao = nil then
  //              obBuscaSugestao := TBuscasSugestao.create;
  //
  //            vSql := ' select f.cod_cliente, f.nome_cliente from clientes f ' +
  //              ' where f.cod_empresa = ' + IntToStr(buscas2.FieldByName('COD_EMPRESA').asinteger) +
  //              ' and f.ativo = 1' +
  //              ' and f.cod_cliente = ' + inttostr(buscas2.FieldByName('FORNEC').AsInteger);
  //            SqlOpen(vSql, buscas3);
  //            GridSug.Cells[8, I] := vDadosIni.strzero(buscas3.FieldByName('COD_CLIENTE').AsInteger, 5) + ' ' + buscas3.FieldByName('nome_cliente').asstring;

            buscas3.Close;
            if dataSet.FieldByName('USODEGRADE').AsString = 'S' then //transito
            begin
              if buscas.FieldByName('cod_grade').asinteger = 0 then
              begin
                vSql := ' select sum(infe.quant_item_nfe) as soma from nf_entrada nfe ' +
                  ' inner join item_nf_entrada infe ' +
                  ' on infe.num_nota_nfe = nfe.num_nota_nfe and infe.cod_forn_nfe = nfe.cod_forn_nfe ' +
                  ' and nfe.cod_empresa = infe.cod_empresa ' +
                  ' left join cod_grade_prod_compra cgpc ' +
                  ' on infe.grupo_prod=cgpc.grupo_prod and infe.cod_prod=cgpc.cod_prod and infe.cod_forn_nfe=cgpc.cod_forn_nfe ' +
                  ' and infe.cod_empresa=cgpc.cod_empresa ' +
                  ' where infe.grupo_prod = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').asinteger) +
                  ' and infe.cod_prod = ' + QuotedStr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                  ' and  coalesce(nfe.status_nfe, '''')= '''' ' + //nfe.status_nfe is null ' +
                  ' and cgpc.cod_grade is null ' +
                  ' and nfe.cod_empresa = ' + IntToStr(buscas.FieldByName('COD_EMP_MULT').AsInteger) +
                  ' and nfe.ativo = 1 ' +
                  ' union ' +
                  ' select sum(infe.quantidade) as soma from notafiscal nfe ' +
                  ' inner join notafiscal_item infe ' +
                  ' on infe.cod_nf = nfe.cod_nf ' +
                  ' and nfe.cod_empresa = infe.cod_empresa ' +
                  ' left join cod_grade_prod_compra cgpc ' +
                  ' on infe.grupo_prod = cgpc.grupo_prod and infe.cod_prod = cgpc.cod_prod and infe.cod_nf = cgpc.num_nota_nfe ' +
                  ' and infe.cod_empresa = cgpc.cod_empresa ' +
                  ' where infe.grupo_prod = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').asinteger) +
                  ' and infe.cod_prod = ' + QuotedStr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                  ' and nfe.natureza_nf = ''E'' ' +
                  ' and coalesce(nfe.status, '''') = ''Aberta'' ' + //and nfe.status <> ''Fechada'' ' +
                  ' and cgpc.cod_grade is null ' +
                  ' and nfe.cod_empresa = ' + IntToStr(buscas.FieldByName('COD_EMP_MULT').AsInteger) +
                  ' and nfe.ativo = 1 ';
              end
              else
              begin
                vSql := 'select sum(infe.quant_item_nfe) as soma from nf_entrada nfe ' +
                  ' inner join item_nf_entrada infe ' +
                  ' on infe.num_nota_nfe = nfe.num_nota_nfe and infe.cod_forn_nfe = nfe.cod_forn_nfe ' +
                  ' and nfe.cod_empresa = infe.cod_empresa ' +
                  ' left join cod_grade_prod_compra cgpc ' +
                  ' on infe.grupo_prod = cgpc.grupo_prod and infe.cod_prod = cgpc.cod_prod and infe.cod_forn_nfe = cgpc.cod_forn_nfe ' +
                  ' and infe.cod_empresa = cgpc.cod_empresa ' +
                  ' where infe.grupo_prod = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').asinteger) +
                  ' and infe.cod_prod = ' + QuotedStr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                  ' and coalesce(nfe.status_nfe, '''') = '''' ' + //nfe.status_nfe is null ' +
                  ' and cgpc.cod_grade=' + IntToStr(buscas.FieldByName('COD_GRADE').asinteger) +
                  ' and nfe.cod_empresa = ' + IntToStr(buscas.FieldByName('COD_EMP_MULT').AsInteger) +
                  ' and nfe.ativo = 1 ' +
                  ' union ' +
                  ' select sum(infe.quantidade) as soma from notafiscal nfe ' +
                  ' inner join notafiscal_item infe ' +
                  ' on infe.cod_nf = nfe.cod_nf ' +
                  ' and nfe.cod_empresa = infe.cod_empresa ' +
                  ' left join cod_grade_prod_compra cgpc ' +
                  ' on infe.grupo_prod = cgpc.grupo_prod and infe.cod_prod = cgpc.cod_prod and infe.cod_nf = cgpc.num_nota_nfe ' +
                  ' and infe.cod_empresa = cgpc.cod_empresa ' +
                  ' where infe.grupo_prod = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').asinteger) +
                  ' and infe.cod_prod = ' + QuotedStr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                  ' and nfe.natureza_nf = ''E'' ' +
                  ' and coalesce(nfe.status, '''') = ''Aberta'' ' + // and nfe.status <> ''Fechada'' ' +
                  ' and cgpc.cod_grade=' + IntToStr(buscas.FieldByName('COD_GRADE').asinteger) +
                  ' and nfe.cod_empresa = ' + IntToStr(buscas.FieldByName('COD_EMP_MULT').AsInteger) +
                  ' and nfe.ativo = 1 '
              end;
            end
            else
            begin
              vSql := 'select sum(infe.quant_item_nfe) as soma from nf_entrada nfe ' +
                ' inner join item_nf_entrada infe ' +
                ' on infe.num_nota_nfe = nfe.num_nota_nfe and infe.cod_forn_nfe = nfe.cod_forn_nfe ' +
                ' and nfe.cod_empresa = infe.cod_empresa ' +
                ' where infe.grupo_prod = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').asinteger) +
                ' and infe.cod_prod = ' + QuotedStr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                ' and coalesce(nfe.status_nfe, '''') = '''' ' + //nfe.status_nfe is null ' +
                ' and nfe.cod_empresa = ' + IntToStr(buscas.FieldByName('COD_EMP_MULT').AsInteger) +
                ' and nfe.ativo = 1' +
                ' union ' +
                ' select sum(infe.quantidade) as soma from notafiscal nfe ' +
                ' inner join notafiscal_item infe ' +
                ' on infe.cod_nf = nfe.cod_nf and nfe.cod_empresa = infe.cod_empresa ' +
                ' where infe.grupo_prod = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').asinteger) +
                ' and infe.cod_prod = ' + QuotedStr(trim(buscas.FieldByName('COD_PROD').asstring)) +
                ' and nfe.natureza_nf = ''E'' ' +
                ' and coalesce(nfe.status, '''') = ''Aberta'' ' + // <> ''Fechada'' ' +
                ' and nfe.cod_empresa = ' + IntToStr(buscas.FieldByName('COD_EMP_MULT').AsInteger) +
                ' and nfe.ativo = 1'
            end;
            SqlOpen(vSql, buscas3);
            GridSug.Cells[10, I] := format('%n', [buscas3.FieldByName('soma').AsFloat]);
            GridSug.Cells[11, I] := format('%n', [buscas2.FieldByName('quant_item_nfe').AsFloat]);

            buscas2.Next;
          end;

          if vMostrarUltVendas then
          begin
            vSql := ' select first 1 vmes, vano, sum(vtot_venda-desconto) as valor_venda, '+
              ' sum(vqt) as vqt from vendasmeses4 ' +
              ' where grupo_prod = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').asinteger) +
              ' and cod_prod = ' + QuotedStr(trim(buscas.FieldByName('COD_PROD').asstring));

            if dataSet.FieldByName('USODEGRADE').AsString = 'S' then
              if buscas.FieldByName('COD_GRADE').asinteger > 0 then
                vSql := vSql + ' and cod_grade = ' + inttostr(buscas.FieldByName('COD_GRADE').asinteger);
                    
            vSql := vSql +
              ' and cod_empresa = ' + IntToStr(buscas.FieldByName('COD_EMP_MULT').AsInteger) +
              ' and ativo = 1 ' +
              ' group by vano, vmes ' +
              ' order by vano desc,vmes desc ';
            SqlOpen(vSql, buscas2);
            if not buscas2.isempty then
            begin
             I := I + 1;
             GridSug.cells[1, I] := 'VND ' + buscas.FieldByName('CLASSE_PROD').AsString;
             GridSug.cells[2, I] := vDadosIni.StrZero(buscas2.FieldByName('VMES').AsString,2)+'/'+
               vDadosIni.StrZero(buscas2.FieldByName('VANO').AsString,4);
             GridSug.Cells[3, I] := buscas.FieldByName('GRUPO_PROD').AsString;
             GridSug.Cells[4, I] := trim(buscas.FieldByName('COD_PROD').AsString);
             GridSug.Cells[5, I] := format('%n', [buscas2.FieldByName('VALOR_VENDA').AsFloat]);
             GridSug.Cells[11, I] := format('%n', [buscas2.FieldByName('VQT').AsFloat]);
            end;
          end;

          if vMostrarTransf then
          begin
            if (vDadosIni.vSugCompra.vMultiempresa) and (vQtdeEmp > 1) then
            begin
              vSql := ' select sug.grupo_prod, pr.cod_prod, sug.cod_grade, sug.cod_emp_orig, ' +
                ' pr.prec_cus_prod, sug.estoque_atual, sug.qtde_transf, ' +
                ' coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp from sugestaocompra_transf sug ' +
                ' inner join empresa emp on emp.cod_empresa = sug.cod_emp_orig ' +
                ' inner join produtos pr on ' +
                ' 	pr.grupo_prod = sug.grupo_prod and pr.cod_prod = sug.cod_prod and pr.cod_empresa = sug.cod_empresa ' +
                ' where sug.cod_sugestao = ' + IntToStr(dataSet.FieldByName('COD_SUGESTAO').AsInteger) +
                ' and sug.cod_empresa = ' + vDadosIni.codEmpresa +
                ' and sug.grupo_prod = ' + IntToStr(buscas.FieldByName('GRUPO_PROD').AsInteger) +
                ' and sug.cod_prod = ' + QuotedStr(buscas.FieldByName('COD_PROD').AsString) +
                ' and sug.cod_grade = ' + IntToStr(buscas.FieldByName('COD_GRADE').AsInteger) +
                vDadosIni.IfThen((dataSet.FieldByName('USODEGRADE').AsString = 'S') and (buscas.FieldByName('COD_GRADE').AsInteger > 0),
                  ' and sug.cod_grade = ' + IntToStr(buscas.FieldByName('COD_GRADE').AsInteger), '') +
                ' and sug.cod_emp_mult = ' + IntToStr(buscas.FieldByName('COD_EMP_MULT').AsInteger);
              SqlOpen(vSql, buscas2).FetchAll;

              buscas2.First;
              while not buscas2.Eof do
              begin
                if buscas2.FieldByName('QTDE_TRANSF').AsFloat > 0 then
                begin
                  I := I + 1;
                  GridSug.cells[1, I] := 'TRF ' + IntToStr(buscas2.FieldByName('COD_EMP_ORIG').AsInteger);
                  GridSug.cells[2, I] := FormatDateTime('DD/MM/YYYY', vDataBanco);
                  GridSug.Cells[3, I] := '';
                  GridSug.Cells[4, I] := format('%n', [buscas2.FieldByName('ESTOQUE_ATUAL').AsFloat]);

                  GridSug.Cells[5, I] := format('%n', [buscas.FieldByName('PREC_CUS_PROD').AsFloat]);

                  GridSug.Cells[8, I] := trim(buscas2.FieldByName('IDENTIFICACAO_EMP').AsString);

                  GridSug.Cells[11, I] := format('%n', [buscas2.FieldByName('QTDE_TRANSF').AsFloat]);

                  GridSug.cells[12, I] := buscas2.FieldByName('GRUPO_PROD').asstring;
                  GridSug.cells[13, I] := buscas2.FieldByName('COD_PROD').asstring;
                  GridSug.cells[14, I] := IntToStr(buscas2.FieldByName('COD_EMP_ORIG').AsInteger);

                  if dataSet.FieldByName('USODEGRADE').AsString = 'S' then
                  begin
                    GridSug.Cells[15, I] := IntToStr(buscas.FieldByName('COD_GRADE').asinteger);
                    GridSug.Cells[16, I] := Trim(buscas.FieldByName('DESCRICAO').asstring);
                    GridSug.Cells[17, I] := Trim(buscas.FieldByName('DESCRICAO1').asstring);
                  end;
                end;

                buscas2.Next;
              end;
            end;
          end;

          vGrupoTemp := buscas.FieldByName('GRUPO_PROD').AsInteger;
          vCodProdTemp := buscas.FieldByName('COD_PROD').AsString;
          vCodEmpresaTemp := buscas.FieldByName('COD_EMP_MULT').AsInteger;

          Lb.Caption := 'Contador: ' + inttostr(ProgressBar.Position + 1) + ' de ' + IntToStr(vqtdeReg) +
            '      Produto Analizado: ' + buscas.FieldByName('Grupo_prod').asstring + '  ' + buscas.FieldByName('cod_prod').AsString;
          Lb2.Caption := 'Contador: ' + inttostr(ProgressBar2.Position + 1) + ' de ' + IntToStr(vqtdeReg) +
            '      Produto Analizado: ' + buscas.FieldByName('Grupo_prod').asstring + '  ' + buscas.FieldByName('cod_prod').AsString;
        
          ProgressBar.Position := ProgressBar.Position + 1;
          ProgressBar2.Position := ProgressBar2.Position + 1;

          vDadosIni.abreStatusProcessamento('', 'Abrindo Sugestão de Compra ' +
            '(' + IntToStr(ProgressBar.Position) + ' de ' + IntToStr(vqtdeReg) + ')');

          buscas.next;
        end;

        fTempGrupo.Next;
      end;
      GridSug.RowCount := I + 1;

      GridSug.FixedCols := 1;
      if GridSug.RowCount > 1 then
        GridSug.FixedRows := 1;
    end
    else
      result := false;

  //  GridSug.Options := GridSug.Options + [goFixedVertLine];
  //  GridSug.Options := GridSug.Options + [goFixedHorzLine];

  except
  	on e: exception do
    begin
    	result := false;
      Application.MessageBox(pchar(e.Message), 'Atenção', MB_ICONERROR + MB_OK);
      registraErro(e.Message);
    end;
  end;
  ProgressBar.Position := 0;
  ProgressBar2.Position := 0;
  lb.Caption := 'Produto Analizado:';
  lb2.Caption := 'Produto Analizado:';
end;

function TSugestao._atualizarListaCotacao: boolean;
var
 I: Integer;
begin
  for I := 1 to pQuantLista do
  begin
     buscas.Close;
     buscas.SQL.Text := ' UPDATE LISTA_COTACAO SET NUM_PED = :NUM_PED ' +
      ' WHERE COD_LISTA = :COD_LISTA AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
     buscas.ParamByName('NUM_PED').AsInteger := dataSet.FieldByName('COD_SUGESTAO').AsInteger;
     buscas.ParamByName('COD_LISTA').AsInteger := StrToInt(vDadosIni.getCampoPipe(pListas,I));
     buscas.Prepare;
     buscas.ExecSQL;


     buscas.Close;
     buscas.SQL.Text := ' UPDATE LISTA_COTACAO_ITENS SET NUM_PED = :NUM_PED' +
       ' WHERE COD_LISTA = :COD_LISTA AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
     buscas.ParamByName('NUM_PED').AsInteger := dataSet.FieldByName('COD_SUGESTAO').AsInteger;
     buscas.ParamByName('COD_LISTA').AsInteger := StrToInt(vDadosIni.getCampoPipe(pListas,I));
     buscas.Prepare;
     buscas.ExecSQL;

     buscas.Close;
     buscas.SQL.Text := ' UPDATE LISTA_COTACAO_ITENS2 SET NUM_PED = :NUM_PED' +
       ' WHERE COD_LISTA = :COD_LISTA AND COD_EMPRESA = ' + vDadosIni.codEmpresa;
     buscas.ParamByName('NUM_PED').AsInteger := dataSet.FieldByName('COD_SUGESTAO').AsInteger;
     buscas.ParamByName('COD_LISTA').AsInteger := StrToInt(vDadosIni.getCampoPipe(pListas,I));
     buscas.Prepare;
     buscas.ExecSQL;
  end;
end;

procedure TSugestao._desmarcarTodos;
begin
	try
  	fTempListaCotacao.DisableControls;
    fTempListaCotacao.First;
    while not fTempListaCotacao.Eof do
    begin
      fTempListaCotacao.Edit;
      fTempListaCotacao.FieldByName('sel').AsString := '';
      fTempListaCotacao.Post;

      fTempListaCotacao.Next;
    end;
  finally
    fTempListaCotacao.First;
    fTempListaCotacao.EnableControls;
  end;
end;

procedure TSugestao._marcarTodos;
begin
	try
  	fTempListaCotacao.DisableControls;
    fTempListaCotacao.First;
    while not fTempListaCotacao.Eof do
    begin
      fTempListaCotacao.Edit;
      fTempListaCotacao.FieldByName('sel').AsString := 'S';
      fTempListaCotacao.Post;
      
      fTempListaCotacao.Next;
    end;
  finally
  	fTempListaCotacao.EnableControls;
  	fTempListaCotacao.First;
  end;
end;

{ TBuscasSugestao }

constructor TBuscasSugestao.create;
begin
  if dtmSugestaoCompras = nil then
    dtmSugestaoCompras := TdtmSugestaoCompras.Create(dtmSugestaoCompras);
  transacao := TIBTransaction(dtmSugestaoCompras.IBTransSugestao);
  Buscas := TIBQuery(dtmSugestaoCompras.qrBuscasSugestao1)
end;

destructor TBuscasSugestao.destroy;
begin
  buscas.Close;
  inherited;
end;

{ TCondPagPed }

function TCondPagPed.abreCondPag: boolean;
begin
  result := montaSelect(' SELECT COND_PAG.* FROM COND_PAG ' +
  	' INNER JOIN COND_PAG_EMPRESA ON ' +
    ' 	COND_PAG_EMPRESA.COD_COND_PAG = COND_PAG.COD_COND_PAG ' +
    '   AND COND_PAG_EMPRESA.COD_EMPRESA = ' + vDadosIni.codEmpresa + 
  	' WHERE COND_PAG.NATUREZA_CP <> ''V'' ' +
    ' AND COND_PAG.ATIVO = 1 ' +
    ' ORDER BY COND_PAG.DESC_COND_PAG ');
end;

constructor TCondPagPed.create;
begin
  DataSet := TClientDataSet(DtmSugestaoCompras.cdsCondPag);
  transacao := TIBTransaction(DtmSugestaoCompras.IBTransPedido);
  Buscas := TIBQuery(DtmSugestaoCompras.qrBuscasSugestao);
end;

function TCondPagPed.existeCondPag(codigo: Integer): boolean;
begin
  result := ExecutaComandosSql(' SELECT COND_PAG.COD_COND_PAG FROM COND_PAG ' +
    ' INNER JOIN COND_PAG_EMPRESA ON ' +
    ' 	COND_PAG_EMPRESA.COD_COND_PAG = COND_PAG.COD_COND_PAG ' +
    '   AND COND_PAG_EMPRESA.COD_EMPRESA = ' + vDadosIni.codEmpresa + 
  	' WHERE COND_PAG.COD_COND_PAG = ' + IntToStr(codigo) +
    ' AND COND_PAG.NATUREZA_CP <> ''V'' ' +
    ' AND COND_PAG.ATIVO = 1');
end;

function TCondPagPed.getTodos: boolean;
begin
 result := montaSelect(' SELECT COND_PAG.* FROM COND_PAG ' +
   ' INNER JOIN COND_PAG_EMPRESA ON ' +
   ' 	COND_PAG_EMPRESA.COD_COND_PAG = COND_PAG.COD_COND_PAG ' +
   '   AND COND_PAG_EMPRESA.COD_EMPRESA = ' + vDadosIni.codEmpresa +
 	 ' WHERE COND_PAG.ATIVO = 1');
end;

function TCondPagPed.montaCondPag(lista: TComboBox;
  codigoCondicao: integer): string;
var
  I: Integer;
begin
  result := 'NENHUMA';
  getTodos;
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

{ TEmpresasSugestao }

constructor TEmpresasSugestao.create;
begin
	if dtmSugestaoCompras = nil then
    dtmSugestaoCompras := TdtmSugestaoCompras.Create(dtmSugestaoCompras);
  DataSet := TClientDataSet(dtmSugestaoCompras.cdsSugestaoEmpresa);
  transacao := TIBTransaction(dtmSugestaoCompras.IBTransSugestao);
  Buscas := TIBQuery(dtmSugestaoCompras.qrBuscasSugestao);
end;

function TEmpresasSugestao._abreTodosEmpresas(pCodSugestao: string): Boolean;
begin
	if StrToInt(pCodSugestao) > 0 then
  begin
  	Result := montaSelect(' select emp.cod_empresa, ' +
    	' (coalesce(emp.identificacao_emp, emp.nome_emp) ||'' - ''|| emp.cgc_emp) identificacao_emp, ' +
      ' case when (coalesce(empf.cod_empresa, 0) > 0) then 1 else 0 end emp_fis ' +
      ' from empresa emp ' +
      ' inner join sugestaocompra_emp sug on ' +
      '		sug.cod_sugestao = ' + pCodSugestao +
      ' 	and sug.cod_empresa = ' + vDadosIni.codEmpresa +
      '   and sug.cod_emp_mult = emp.cod_empresa ' +
      ' left join empresa_fisica empf on emp.cod_empresa = empf.cod_empresa ' +
      ' where coalesce(emp.emp_repl_interna, ' + vDadosIni.codEmpresa + ') = ' + vDadosIni.codEmpresa +
      ' and emp.ativo = 1 ' +
      ' order by emp.cod_empresa');

      if dataSet.IsEmpty then
      begin
      	Result := montaSelect(' select emp.cod_empresa, ' +
          ' (coalesce(emp.identificacao_emp, emp.nome_emp) ||'' - ''|| emp.cgc_emp) identificacao_emp, ' +
          ' case when (coalesce(empf.cod_empresa, 0) > 0) then 1 else 0 end emp_fis from empresa emp ' +
          ' left join empresa_fisica empf on emp.cod_empresa = empf.cod_empresa ' +
          ' where emp.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and emp.ativo = 1 ' +
          ' order by emp.cod_empresa');
      end;
  end
  else
    Result := montaSelect(' select emp.cod_empresa, ' +
      ' (coalesce(emp.identificacao_emp, emp.nome_emp) ||'' - ''|| emp.cgc_emp) identificacao_emp, ' +
      ' case when (coalesce(empf.cod_empresa, 0) > 0) then 1 else 0 end emp_fis from empresa emp ' +
    	' left join empresa_fisica empf on emp.cod_empresa = empf.cod_empresa ' +
      ' where coalesce(emp.emp_repl_interna, ' + vDadosIni.codEmpresa + ') = ' + vDadosIni.codEmpresa +
      ' and emp.ativo = 1 ' +
      ' order by emp.cod_empresa');

  try
  	dataset.DisableControls;
    dataset.First;
    while not dataset.Eof do
    begin
    	if StrToInt(pCodSugestao) > 0 then
      begin
        dataset.Edit;
        dataset.FieldByName('sel').AsString := 'S';
        dataset.Post;
      end
      else if dataset.FieldByName('emp_fis').AsInteger = 1 then
      begin
	      dataset.Edit;
        dataset.FieldByName('sel').AsString := 'S';
        dataset.Post;
      end
      else if dataset.FieldByName('cod_empresa').AsInteger = StrToInt(vDadosIni.codEmpresa) then
      begin
      	dataset.Edit;
        dataset.FieldByName('sel').AsString := 'S';
        dataset.Post;
      end;

    	dataset.Next;
    end;
  finally
    dataset.First;
    dataset.EnableControls;
  end;
end;

function TEmpresasSugestao._abreTodosEmpresas: Boolean;
begin
	Result := montaSelect(' select emp.cod_empresa, ' +
    ' (coalesce(emp.identificacao_emp, emp.nome_emp) ||'' - ''|| cgc_emp) identificacao_emp, ' +
    ' case when (coalesce(empf.cod_empresa, 0) > 0) then 1 else 0 end emp_fis from empresa emp ' +
    ' left join empresa_fisica empf on emp.cod_empresa = empf.cod_empresa ' +
	  ' where emp.cod_empresa = ' + vDadosIni.codEmpresa +
	  ' order by emp.cod_empresa');

  try
  	dataset.DisableControls;
    dataset.First;
    while not dataset.Eof do
    begin
    	dataset.Edit;
      dataset.FieldByName('sel').AsString := 'S';
      dataset.Post;

      dataset.Next;
    end;
  finally
    dataset.First;
    dataset.EnableControls;
  end;
end;

procedure TEmpresasSugestao._desmarcarTodos;
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

procedure TEmpresasSugestao._marcaDesmarcaLinha;
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

procedure TEmpresasSugestao._marcarTodos;
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

{ TCustoPedSug }

constructor TCustoPedSug.create;
begin
	if dtmSugestaoCompras = nil then
    dtmSugestaoCompras := TdtmSugestaoCompras.Create(dtmSugestaoCompras);
  DataSet := TClientDataSet(dtmSugestaoCompras.cdsCustosProd);
  transacao := TIBTransaction(dtmSugestaoCompras.IBTransSugestao);
  Buscas := TIBQuery(dtmSugestaoCompras.qrBuscasSugestao);
end;

function TCustoPedSug._abreCustoProd(pGrupoProd: Integer; pCodProd: string;
  pCodEmpresa: Integer): boolean;
begin
	Result := montaSelect('	select custos.grupo_prod, custos.cod_prod, custos.cod_empresa, ' +
  	' custos.cod_nf, custos.num_nota_nfe, custos.serie, custos.fornec, custos.data, ' +
    ' custos.prec_cus_med, custos.pr_cusc_prod, custos.valor, ' +
    ' cl.nome_cliente, cl.razao, cl.cpfcgc from custos ' +
    ' left join clientes cl on cl.cod_cliente = custos.fornec and cl.cod_empresa = custos.cod_empresa ' +
    ' where custos.grupo_prod = ' + IntToStr(pGrupoProd) +
    ' and custos.cod_prod = ' + QuotedStr(trim(pCodProd)) +
    ' and custos.cod_empresa = ' + IntToStr(pCodEmpresa) +
    ' and custos.data >= (current_date - 365) ' +
    ' order by custos.data desc, custos.cod_nf desc ');
end;

{ TEmpresaPedSug }

constructor TEmpresaPedSug.create;
begin
	if dtmSugestaoCompras = nil then
    dtmSugestaoCompras := TdtmSugestaoCompras.Create(dtmSugestaoCompras);
  DataSet := TClientDataSet(dtmSugestaoCompras.cdsEmpresa);
  transacao := TIBTransaction(dtmSugestaoCompras.IBTransSugestao);
  Buscas := TIBQuery(dtmSugestaoCompras.qrBuscasSugestao);
end;

function TEmpresaPedSug._abreEmpresa: boolean;
begin
	Result := montaSelect(
//  	' select 0 cod_empresa, ''TODAS'' identificacao_emp from rdb$database ' +
//  	' union all ' +
  	' select emp.cod_empresa, coalesce(emp.identificacao_emp, emp.nome_emp) identificacao_emp from empresa emp ' +
    ' where coalesce(emp_repl_interna, ' + vDadosIni.codEmpresa + ') = ' + vDadosIni.codEmpresa + 
    ' and ativo = 1 ' +
    ' order by 1 ');
end;

{ TFornecPedSug }

constructor TFornecPedSug.create;
begin
	if dtmSugestaoCompras = nil then
    dtmSugestaoCompras := TdtmSugestaoCompras.Create(dtmSugestaoCompras);
  DataSet := TClientDataSet(dtmSugestaoCompras.cdsFornec);
  transacao := TIBTransaction(dtmSugestaoCompras.IBTransSugestao);
  Buscas := TIBQuery(dtmSugestaoCompras.qrBuscasSugestao);
end;

function TFornecPedSug._abreFornecedor(pCodFornec: Integer; pCodEmpresa: Integer): boolean;
begin
	if pCodFornec <= 0 then
  	Result := montaSelect(' select 0 cod_cliente, ' +
    	IntToStr(pCodEmpresa) + ' cod_empresa, ' +
      ' null nome_cliente, ' +
      ' null tipo from rdb$database ')
  else
    Result := montaSelect(' select cl.cod_cliente, ' +
      ' cl.cod_empresa, ' +
      ' coalesce(cl.nome_cliente, cl.razao) nome_cliente, ' +
      ' cl.tipo from clientes cl ' +
      ' where cl.cod_cliente = ' + IntToStr(pCodFornec) +
      ' and cl.cod_empresa = ' + IntToStr(pCodEmpresa) +
      ' and cl.ativo = 1 ' +
      ' order by 3 ');
end;

{ TVendedorPedSug }

constructor TVendedorPedSug.create;
begin
	if dtmSugestaoCompras = nil then
    dtmSugestaoCompras := TdtmSugestaoCompras.Create(dtmSugestaoCompras);
  DataSet := TClientDataSet(dtmSugestaoCompras.cdsVendedor);
  transacao := TIBTransaction(dtmSugestaoCompras.IBTransSugestao);
  Buscas := TIBQuery(dtmSugestaoCompras.qrBuscasSugestao);
end;

function TVendedorPedSug._abreVendedor(pCodEmpresa: Integer): boolean;
begin
	Result := montaSelect(' select col.cod_vendedor, ' +
  	' col.cod_empresa, ' +
    ' col.nome_vendedor from colaborador col ' +
    ' where col.cod_empresa = ' + IntToStr(pCodEmpresa) +
    ' and col.ativo = 1 ' +
    ' order by col.nome_vendedor ');
end;

function TVendedorPedSug._abreVendedor(pCodEmpresa: Integer;
  pTestarTipo: boolean): boolean;
begin
	Result := montaSelect(' select col.cod_vendedor, ' +
  	' col.cod_empresa, ' +
    ' col.nome_vendedor from colaborador col ' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao ' +
    ' where col.cod_empresa = ' + IntToStr(pCodEmpresa) +
    ' and col.ativo = 1 ' +
//    ' and f.desc_funcao like ''%VEND%'' ' +
//    vDadosIni.IfThen(vDadosIni.vEmp.vUsarAparelho = 'S',
//	    ' and ((f.desc_funcao like ''%TÉCNICO%'') or (f.desc_funcao like ''%TECNICO%'')) ',
//      ' and ((f.desc_funcao like ''%MECANICO%'') or (f.desc_funcao like ''%MECÂNICO%'')) ') +
    ' order by col.nome_vendedor ');
end;

{ TCondPagPedSug }

constructor TCondPagPedSug.create;
begin
	if dtmSugestaoCompras = nil then
    dtmSugestaoCompras := TdtmSugestaoCompras.Create(dtmSugestaoCompras);
  DataSet := TClientDataSet(dtmSugestaoCompras.cdsCondPagPed);
  transacao := TIBTransaction(dtmSugestaoCompras.IBTransSugestao);
  Buscas := TIBQuery(dtmSugestaoCompras.qrBuscasSugestao);
end;

function TCondPagPedSug._abreCondPag: boolean;
begin
	Result := montaSelect(' select COND_PAG.COD_COND_PAG, COND_PAG.DESC_COND_PAG FROM COND_PAG ' +
  	' INNER JOIN COND_PAG_EMPRESA ON ' +
    ' 	COND_PAG_EMPRESA.COD_COND_PAG = COND_PAG.COD_COND_PAG ' +
    '   AND COND_PAG_EMPRESA.COD_EMPRESA = ' + vDadosIni.codEmpresa +
  	' WHERE COND_PAG.ATIVO = 1 ' +
    ' ORDER BY COND_PAG.DESC_COND_PAG ');
end;

{ TClientePedSug }

constructor TClientePedSug.create;
begin
	if dtmSugestaoCompras = nil then
    dtmSugestaoCompras := TdtmSugestaoCompras.Create(dtmSugestaoCompras);
  DataSet := TClientDataSet(dtmSugestaoCompras.cdsCliente);
  transacao := TIBTransaction(dtmSugestaoCompras.IBTransSugestao);
  Buscas := TIBQuery(dtmSugestaoCompras.qrBuscasSugestao);
end;

function TClientePedSug._abreCliente(pCodCliente,
  pCodEmpresa: Integer): boolean;
begin
	if pCodCliente <= 0 then
  	Result := montaSelect(' select 0 cod_cliente, ' +
    	IntToStr(pCodEmpresa) + ' cod_empresa, ' +
      ' null nome_cliente, ' +
      ' null tipo from rdb$database ')
  else
    Result := montaSelect(' select cl.cod_cliente, ' +
      ' cl.cod_empresa, ' +
      ' coalesce(cl.nome_cliente, cl.razao) nome_cliente, ' +
      ' cl.tipo from clientes cl ' +
      ' where cl.cod_cliente = ' + IntToStr(pCodCliente) +
      ' and cl.cod_empresa = ' + IntToStr(pCodEmpresa) +
      ' and cl.ativo = 1 ' +
      ' order by 3 ');
end;

{ TVendedorPedSug2 }

constructor TVendedorPedSug2.create;
begin
	if dtmSugestaoCompras = nil then
    dtmSugestaoCompras := TdtmSugestaoCompras.Create(dtmSugestaoCompras);
  DataSet := TClientDataSet(dtmSugestaoCompras.cdsVendedor2);
  transacao := TIBTransaction(dtmSugestaoCompras.IBTransSugestao);
  Buscas := TIBQuery(dtmSugestaoCompras.qrBuscasSugestao);
end;

function TVendedorPedSug2._abreVendedor(pCodEmpresa: Integer): boolean;
begin
	Result := montaSelect(' select col.cod_vendedor, ' +
  	' col.cod_empresa, ' +
    ' col.nome_vendedor from colaborador col ' +
    ' where col.cod_empresa = ' + IntToStr(pCodEmpresa) +
    ' and col.ativo = 1 ' +
    ' order by col.nome_vendedor ');
end;

function TVendedorPedSug2._abreVendedor(pCodEmpresa: Integer;
  pTestarTipo: boolean): boolean;
begin
	Result := montaSelect(' select col.cod_vendedor, ' +
  	' col.cod_empresa, ' +
    ' col.nome_vendedor from colaborador col ' +
    ' inner join funcoes f on f.cod_funcao = col.cod_funcao ' +
    ' where col.cod_empresa = ' + IntToStr(pCodEmpresa) +
    ' and col.ativo = 1 ' +
//    ' and f.desc_funcao like ''%VEND%'' ' +
//    vDadosIni.IfThen(vDadosIni.vEmp.vUsarAparelho = 'S',
//	    ' and ((f.desc_funcao like ''%TÉCNICO%'') or (f.desc_funcao like ''%TECNICO%'')) ',
//      ' and ((f.desc_funcao like ''%MECANICO%'') or (f.desc_funcao like ''%MECÂNICO%'')) ') +
    ' order by col.nome_vendedor ');
end;

end.

