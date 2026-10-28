unit ConsultasU;

interface

uses DB, StdCtrls, Classes, SysUtils, uDataSet_OOP, IBQuery, ExtCtrls, Dialogs, Forms, 
  Buttons;

type
	Tcl_abreExtrato_form = function(ACodCliente: Integer): boolean;
  
  TPesquisaProd = class;
  TConsultaColaborador = class;
  TTipoVndPerdida = class;
  TVendaPerdida = class;
  TUltimasComprasProd = class;
  TUltimoBalancoProd = class;
  TPesquisaGradeProd = class;
  TPesquisaCodBarra = class;
  TPesquisaGradeProdOutrasEmpresas = class;
  TPedidoVendaAberto = class;
  TPromocaoTab = class;
  TProdutoAcabado = class;
  TMateriaPrimaProdutoAcabado = class;

  RClientes = record
    AHandle: THandle;
  end;

  TConsulta = class(TdataSet_OOP)
  private
    FDataSource: TDataSource;
    fHabilitarBotao: Boolean;
    fNomePacote, fNomeFormulario: string;
    vtabela: string;
  public
    procedure Pegacodigo; virtual; abstract;
    function getNomeTabela: string;
    property DataSource: TDataSource read FDataSource write FDataSource;
    function AlteraLocacao(LOCACAOPROD, LOCACAOPROD1: string): boolean;
    function MediaVendaMes: boolean;
    function produtoSimilar: boolean;
    function TransferirDepositoLoja: boolean; overload;
    function TransferirDepositoLoja(qtd: real): boolean; overload;
    function ManterVendaPerdida(CodVendedor, CodigoVP: integer; qtdVP: real): boolean;
    function AbrirVendaPerdida: boolean;
    function FichadeVenda(NomeCli: string): boolean; overload;
    function itensDoKit: boolean;
    function incluirRegistro: Boolean;
    function cl_abreExtrato_form(ACodCliente: Integer): boolean;
    procedure ObterCamposAdicionais(AStrings: TStrings);

    property HabilitarBotao: Boolean read fHabilitarBotao write fHabilitarBotao default False;
    property NomeFormulario: string read fNomeFormulario write fNomeFormulario;

  var
    valorindex: variant;
    BitBtnFoto: TBitBtn;
    PanelEstF, PanelEstR, PanelEstPrima, PanelValorKit, PanelEstDispR: TPanel;
    Pesquisa: TPesquisaProd;
    _PesquisaGradeProd: TPesquisaGradeProd;
    _PesquisaCodBarra: TPesquisaCodBarra;
    _PesquisaGradeProdOutrasEmpresas: TPesquisaGradeProdOutrasEmpresas;
    _PedidoVendaAberto: TPedidoVendaAberto;
    Funcionario: TConsultaColaborador;
    TipoVndPerdida: TTipoVndPerdida;
    VendaPerdida: TVendaPerdida;
    UltCProd: TUltimasComprasProd;
    UltBProd: TUltimoBalancoProd;
    vPromocaoProd: TPromocaoTab;
    vProdutoAcabado: TProdutoAcabado;
    CondicaosqlAdicional: string; // Sempre começar  com " and" (espaço and) e também terminar
    vClienteCons: RClientes; //Variaveis de configuracao do cliente
    campo, condicao, valor, dataIni, dataFim, ordem: string;
  end;

  TPesquisaProd = class(TConsulta)
  public
    constructor create;
    procedure Pegacodigo; override;
  var

  end;

  TPesquisaGradeProdOutrasEmpresas = class(TConsulta)
  public
    constructor create;
    procedure _PesquisaGrade(grupo, codProd, codigoEmpresa, NomeEmpresa: string);
  end;

  TPedidoVendaAberto = class(TConsulta)
  public
    Buscas2: TIBQuery;
    constructor create;
    destructor Destroy; override;
    procedure _ExibeItensPedidoAberto(Grupo_Prod, Cod_Prod: string);
    procedure _ExibeReservas(Grupo_Prod, Cod_Prod: string);
  end;

  TPromocaoTab = class(TConsulta)
  public
    constructor create;
    procedure _abrePromocaoTab(Grupo_Prod, Cod_Prod: string);
  end;

  TProdutoAcabado = class(TConsulta)
  public
    constructor create;
    destructor destroy; override;
    procedure _abreProdutoAcabado(Grupo_Prod, Cod_Prod: string; ExibirQtdeProduzir: boolean);
    procedure datasetAfterScrollMateriaPrima(DataSet: TDataSet);
  var
  	vMateriaPrimaProdutoAcabado: TMateriaPrimaProdutoAcabado;
  end;

  TMateriaPrimaProdutoAcabado = class(TConsulta)
  public
    constructor create;
    procedure _abreMateriaPrimaProdutoAcabado(Grupo_Prod, Cod_Prod: string; CodGrade: Integer; IdInd: Integer);
  end;

  TPesquisaGradeProd = class(TConsulta)
  public
    constructor create;
    procedure _PesquisaGrade(grupo, codProd: string);
  end;

  TPesquisaCodBarra = class(TConsulta)
  public
    constructor create;
    procedure _PesquisaCodBarra(grupo, codProd: string);
  end;

  TConsultaTipoCliente = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaTabelaP = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaPromocaoP = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaTabelaPromocaoP = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaCliente = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaCidades = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaCEP = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaBairros = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaEstados = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaFornecedor = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaCondPag = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaCondPagEmp = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaProdutoP = class(TConsulta)
  private
    timerConsulta: TTimer;
    procedure ProdAfterScroll(DataSet: TDataSet);
    procedure ProdWithTimerAfterScroll(DataSet: TDataSet);
    procedure TimerConsultaTimer(Sender: TObject);
    procedure ProdGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  public
    PesquisaProd: TPesquisaProd;
    constructor Create;
    destructor Destroy; override;
    procedure Pegacodigo; override;
    function produtoSimilar(vgrupo: integer; vcodigo: string): boolean;
  var
    valorgrupo: integer;
    valorindexstring, valorcodigo, vApresentarEstR: string;
  end;

  TConsultaGrupo = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaTransportador = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaNaturezaOperacao = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaNaturezaOperacaoDescricao = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaSubGrupo = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaNBM = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaVeiculos = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaModeloVeiculo = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaAparelhos = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaColaborador = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
    function abreColaborador: Boolean;
  end;

  TConsultaParticipante = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
    function abreParticipante: Boolean;
  end;

  TTipoVndPerdida = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
    function abreTipoVndPerdida: Boolean;
  end;

  TVendaPerdida = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
    function abreVendaPerdida: Boolean;
  end;

  TConsultaTipoFaturamento = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaMarcas = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaGrade = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaDSGS = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TUltimasComprasProd = class(TConsulta)
  public
    constructor Create;
    function abreUltimasCompras(grupoprod: integer; codprod: string): Boolean;
    //Últimas compra de produto com cálculo
  end;

  TUltimoBalancoProdGrade = class(TConsulta)
  public
    constructor Create;
    function abreUltimoBalancoGrade(grupoprod: integer; codprod: string; datacadastro: TDateTime; dataconfirm: TDateTime): Boolean;
    //Últimas compra de produto com cálculo
  end;

  TUltimoBalancoProd = class(TConsulta)
  public
    constructor Create;
    destructor destroy; override;
    function abreUltimoBalancoProd(grupoprod: integer; codprod: string): Boolean;
    procedure datasetAfterScrollUltimoBalancoProdGrade(DataSet: TDataSet);
  var
  	vUltimoBalancoProdGrade: TUltimoBalancoProdGrade;
    //Últimas compra de produto com cálculo
  end;

  TConsultaClienteConv = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaCidadesIBGE = class(TConsulta)
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaKits = class(TConsulta)
  private
    PesquisaKit: TPesquisaProd;
    procedure KitAfterScroll(DataSet: TDataSet);
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaTipoServ = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaServicosEmp = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaPerfilProd = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaEspecieVeiculo = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaContador = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaCentroDeCustos = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaPlanoContasContabil = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaCodigo_Banco = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaCombustivel = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaCor = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaAcaoJudicialSPED = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaProcessoAdministrativoSPED = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaNotaFiscal = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaInfComplementar = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaLocalidade = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaLocalidade2 = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaSetor = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaVendedor = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaPlanoContas = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaPedido = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaPedvenda = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaControle = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaObsLancamentosFiscais = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaPromocoes = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TConsultaEstMoto = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TTipoPendencia = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TTipoDespesa = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TNBS = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

  TComissaoFaixaDesc = class(TConsulta)
  private
  public
    constructor Create;
    procedure Pegacodigo; override;
  end;

implementation

uses
  DBClient, uDtmConsultas, uDtmAtivo, Windows, IBDatabase, ulocalizar, uexibirgrades,
  funcoes, hw_win_utils,
  uDadosIni, Math;

{ TConsultaCliente }

constructor TConsultaCliente.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPCl);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqCl.Database;
  buscas.Transaction := transacao;
  vtabela := 'CLIENTES';
  HabilitarBotao := True;
  fNomePacote := 'pkClientes';
  fNomeFormulario := 'TFrmCadClientes';
end;

procedure TConsultaCliente.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('cod_cliente').AsInteger;
end;

{ TConsultaCidades }

constructor TConsultaCidades.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPCid);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqCid.Database;
  buscas.Transaction := transacao;
  vtabela := 'CIDADES';
end;

procedure TConsultaCidades.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('cod_cidade').asinteger;
end;

{ TConsultaBairros }

constructor TConsultaBairros.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPBai);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqBai.Database;
  buscas.Transaction := transacao;
  vtabela := 'BAIRROS';
end;

procedure TConsultaBairros.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('cod_bairro').asinteger;
end;

{ TConsultaFornecedor }

constructor TConsultaFornecedor.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPForn);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqForn.Database;
  buscas.Transaction := transacao;
  vtabela := 'FORNECEDOR';
end;

procedure TConsultaFornecedor.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('codigo_f').asinteger;
end;

{ TConsultaProduto }

constructor TConsultaProdutoP.Create;
begin

  timerConsulta := TTimer.Create(nil);
  timerConsulta.Interval := IniConf.ReadInt('Sistema', 'DelayConsultaProdutoShiftF3', 0);
  timerConsulta.Enabled := False;
  timerConsulta.OnTimer := TimerConsultaTimer;

  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPProd);

  if timerConsulta.Interval > 0 then  
    dataSet.AfterScroll := ProdWithTimerAfterScroll
  else
    dataSet.AfterScroll := ProdAfterScroll;

  dataSet.FieldByName('DETALHES_PROD').OnGetText := ProdGetText;
  dataSet.FieldByName('OBSERVACOES').OnGetText   := ProdGetText;
  transacao := TIBTransaction(dtmConsultas.transConsulta);
  Buscas := TIBQuery(dtmConsultas.qrBuscas);
  if PesquisaProd = nil then
  begin
    PesquisaProd := TPesquisaProd.create;
    PesquisaProd.dataSet := TClientDataSet(dtmConsultas.cdsProdOutEmp);
  end;
  if _PesquisaGradeProd = nil then
    _PesquisaGradeProd := TPesquisaGradeProd.create;
  if _PesquisaGradeProdOutrasEmpresas = nil then
    _PesquisaGradeProdOutrasEmpresas := TPesquisaGradeProdOutrasEmpresas.create;
  if _PesquisaCodBarra = nil then
  	_PesquisaCodBarra := TPesquisaCodBarra.create;
  if _PedidoVendaAberto = nil then
    _PedidoVendaAberto := TPedidoVendaAberto.create;
  vtabela := 'PRODUTOS';

  HabilitarBotao := True;
  fNomePacote := 'pkProdutos';
  fNomeFormulario := 'TFrmCadProdutos';

  buscas.Close;
  buscas.SQL.Text := 'select APRES_ESTR from empresa where ativo=1 and cod_empresa=' +
    vDadosIni.codEmpresa;
  buscas.Open;
  vApresentarEstR := buscas.FieldByName('APRES_ESTR').AsString;
  buscas.close;
end;

destructor TConsultaProdutoP.Destroy;
begin
  PesquisaProd.buscas.close;
  if PesquisaProd.dataSet <> nil then
    PesquisaProd.dataSet.close;
  FreeAndNil(timerConsulta);
  inherited;
end;

procedure TConsultaProdutoP.Pegacodigo;
begin
  valorgrupo := dataSet.FieldByName('grupo_prod').AsInteger;
  valorcodigo := dataSet.FieldByName('cod_prod').AsString;
  vDadosIni.vPesquisaGrupo_prod := IntToStr(dataSet.FieldByName('grupo_prod').AsInteger);
  vDadosIni.vPesquisaCod_prod := Trim(dataSet.FieldByName('cod_prod').AsString);
  valorindexstring := dataSet.FieldByName('num_fab_prod').AsString;
  valorindex := dataSet.FieldByName('num_fab_prod').AsString;
end;

procedure TConsultaProdutoP.ProdAfterScroll(DataSet: TDataSet);
var
	buscas2: TIBQuery;
begin
	buscas2 := TIBQuery.Create(nil);
  try
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    if Assigned(frmLocalizar) then
    begin
      frmLocalizar.LabelEstPrima.Visible :=
        (vDadosIni.vEmp.vUsarProducao = 'S') and (dataSet.FieldByName('CRIAR_PRODUCAO_AUT').AsString = 'S');
      frmLocalizar.PanelEstPrima.Visible :=
        (vDadosIni.vEmp.vUsarProducao = 'S') and (dataSet.FieldByName('CRIAR_PRODUCAO_AUT').AsString = 'S');

      buscas2.Close;
      buscas2.SQL.Text := ' SELECT COUNT(*) FROM INDICE_TECNICO ' +
        '	WHERE INDICE_TECNICO.GRUPO_PROD_ACABADO = ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger) +
        ' AND INDICE_TECNICO.COD_PROD_ACABADO = ' + QuotedStr(dataSet.FieldByName('COD_PROD').AsString) +
        ' AND INDICE_TECNICO.COD_EMPRESA = ' + vDadosIni.codEmpresa;
      buscas2.Open;

      frmLocalizar.btMateriaPrima.Visible := buscas2.FieldByName('COUNT').AsInteger > 0;

      if (vDadosIni.vEmp.vAlmox = 'S2')
        and (vDadosIni.vEmp.vUsarProducao = 'S')
        and (dataSet.FieldByName('CRIAR_PRODUCAO_AUT').AsString = 'S') then
      begin
        frmLocalizar.PanelEstF.Width     := 120;
        frmLocalizar.PanelEstR.Width     := 120;
        frmLocalizar.PanelEstPrima.Width := 120;

        frmLocalizar.PanelEstF.Left      := 243;
        frmLocalizar.PanelEstR.Left      := 369;
        frmLocalizar.PanelEstPrima.Left  := 496;
      end
      else if vDadosIni.vEmp.vAlmox = 'S2' then
      begin
        frmLocalizar.PanelEstF.Left      := 243;
        frmLocalizar.PanelEstR.Left      := 436;

        frmLocalizar.PanelEstF.Width     := 180;
        frmLocalizar.PanelEstR.Width     := 180;
      end
      else if (vDadosIni.vEmp.vUsarProducao = 'S')
        and (dataSet.FieldByName('CRIAR_PRODUCAO_AUT').AsString = 'S') then
      begin
        frmLocalizar.PanelEstF.Left      := 243;
        frmLocalizar.PanelEstPrima.Left  := 436;

        frmLocalizar.PanelEstF.Width     := 180;
        frmLocalizar.PanelEstPrima.Width := 180;
      end
      else
      begin
        frmLocalizar.PanelEstF.Width := 373;
      end;
    end;

    if (vDadosIni.vSistema = 'Fiscal') and (vDadosIni.bancoConectado = 'local') then
    begin
      produtoSimilar(dataset.FieldByName('grupo_prod').asInteger,
        dataset.FieldByName('cod_prod').asstring);
    end
    else if not DataSet.IsEmpty then
    begin
      PesquisaProd.DataSet.Close;
      PesquisaProd.DataSet.CommandText := 'select pr.num_fab_prod,en.IDENTIFICACAO_EMP,en.cod_empresa,' +
        ' pr.est_f,(Select sum(pp.quant_ped_item) from pedvenda_prod pp,pedvenda p where' +
        ' p.tipo=''OS'' and pp.cod_prod = pr.Cod_prod and pp.grupo_prod = pr.grupo_prod and pp.nped = p.nped and pp.tipo = p.tipo' +
        ' and p.data_fech is null and p.COD_EMPRESA = pr.cod_empresa and p.ATIVO=1' +
        ' and p.COD_EMPRESA = pp.COD_EMPRESA and ((pp.status is null) or (pp.status <> ''CANCELADO''))) PENDOS,(Select sum(pp.quant_ped_item) from pedvenda_prod pp,pedvenda p where' +
        ' p.tipo=''REQ'' and pp.cod_prod = pr.cod_prod and pp.grupo_prod = pr.grupo_prod and pp.nped = p.nped and pp.tipo = p.tipo' +
        ' and p.data_fech is null and p.COD_EMPRESA = pr.cod_empresa and p.ATIVO=1 and p.COD_EMPRESA = pp.COD_EMPRESA and ((pp.status is null) or (pp.status <> ''CANCELADO''))) PENDREQ,' +
        ' (select sum(coalesce(c.quant,0)) from controle_almoxarifado c where c.grupo_prod = pr.grupo_prod' +
        ' and c.cod_prod = pr.cod_prod and c.cod_empresa = pr.cod_empresa) PENDALMOX,'+
        ' (select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) from producao pd' +
        ' inner join producao_item_indice pi on pi.cod_producao = pd.cod_producao and pi.cod_empresa = pd.cod_empresa' +
        ' where pd.data_fechamento is null and pd.cod_empresa = pr.cod_empresa' +
        ' and pi.grupo_prod = PR.grupo_prod and pi.cod_prod = PR.cod_prod) PENDPRODUCAO,' +
        ' (pr.est_f-coalesce((Select sum(pp.quant_ped_item) from pedvenda_prod pp,pedvenda p where' +
        ' p.tipo<>''ORC'' and pp.cod_prod = pr.cod_prod and pp.grupo_prod = pr.grupo_prod and pp.nped = p.nped and pp.tipo = p.tipo' +
        ' and p.data_fech is null and p.COD_EMPRESA = pr.cod_empresa and p.ATIVO=1 and p.COD_EMPRESA = pp.COD_EMPRESA and ((pp.status is null) or (pp.status <> ''CANCELADO''))),0)' +
        ' - coalesce((select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) from producao pd' +
        ' inner join producao_item_indice pi on pi.cod_producao = pd.cod_producao and pi.cod_empresa = pd.cod_empresa' +
        ' where pd.data_fechamento is null and pd.cod_empresa = pr.cod_empresa' +
        ' and pi.grupo_prod = PR.grupo_prod and pi.cod_prod = PR.cod_prod),0)' +
        ' - coalesce( (select sum(coalesce(c.quant,0)) from controle_almoxarifado c where c.grupo_prod = pr.grupo_prod' +
        ' and c.cod_prod = pr.cod_prod and c.cod_empresa = pr.cod_empresa), 0) ' +
        ' ) SaldoLiquido,pr.grupo_prod,pr.cod_prod, pr.PREC_TAB_PROD, pr.PREC_30_PROD, pr.PREC_60_PROD, pr.PREC_90_PROD, pr.PREC_PUBLICO ' +
        ' from produtos pr ' +
        ' inner join empresa en on pr.cod_empresa = en.cod_empresa ' +
        ' where pr.grupo_prod = ' + dataset.FieldByName('grupo_prod').asstring +
        ' and pr.cod_prod = ' + quotedstr(dataset.FieldByName('cod_prod').asstring) +
        ' and pr.cod_empresa <> ' + vDadosIni.codEmpresa +
        ' and pr.ativo = 1 ';
      PesquisaProd.DataSet.open;
  //    PesquisaProd.buscas.FieldByName('grupo_prod').DisplayLabel := 'Grupo Produto';
  //    PesquisaProd.buscas.FieldByName('cod_prod').DisplayLabel := 'Cód. Produto';
  //    PesquisaProd.buscas.FieldByName('cod_empresa').DisplayLabel := 'Cód. Empresa';
  //    PesquisaProd.buscas.FieldByName('num_fab_prod').DisplayLabel := 'Número de Fabricação';
  //    PesquisaProd.buscas.FieldByName('IDENTIFICACAO_EMP').DisplayLabel := 'Empresa';
  //    PesquisaProd.buscas.FieldByName('est_f').DisplayLabel := 'Estoque Físico';
  //    PesquisaProd.buscas.FieldByName('PENDOS').DisplayLabel := 'Pendências OS';
  //    PesquisaProd.buscas.FieldByName('PENDREQ').DisplayLabel := 'Pendências REQ';
  //    PesquisaProd.buscas.FieldByName('PENDALMOX').DisplayLabel := 'Pendências Carrinho Vendedor';
  //    PesquisaProd.buscas.FieldByName('PENDPRODUCAO').DisplayLabel := 'Pendências Produção';
  //    PesquisaProd.buscas.FieldByName('SaldoLiquido').DisplayLabel := 'Saldo Líquido';
  //    PesquisaProd.buscas.FieldByName('PREC_TAB_PROD').DisplayLabel := 'Preço de Tabela do Produto';
  //    TFloatField(PesquisaProd.buscas.FieldByName('PREC_TAB_PROD')).currency := true;
  //    PesquisaProd.buscas.FieldByName('PREC_30_PROD').DisplayLabel := 'Preço 30 dias';
  //    TFloatField(PesquisaProd.buscas.FieldByName('PREC_30_PROD')).currency := true;
  //    PesquisaProd.buscas.FieldByName('PREC_60_PROD').DisplayLabel := 'Preço 60 dias';
  //    TFloatField(PesquisaProd.buscas.FieldByName('PREC_60_PROD')).currency := true;
  //    PesquisaProd.buscas.FieldByName('PREC_90_PROD').DisplayLabel := 'Preço 90 dias';
  //    TFloatField(PesquisaProd.buscas.FieldByName('PREC_90_PROD')).currency := true;
  //    PesquisaProd.buscas.FieldByName('PREC_PUBLICO').DisplayLabel := 'Preço Público';
  //    TFloatField(PesquisaProd.buscas.FieldByName('PREC_PUBLICO')).currency := true;

      TFloatField(PesquisaProd.DataSet.FieldByName('PREC_TAB_PROD')).DisplayFormat := '#,##0.' + vDadosIni.StrZero(0, vDadosIni.vEmp.vCasasDecimais);
      TFloatField(PesquisaProd.DataSet.FieldByName('PREC_30_PROD')).DisplayFormat := TFloatField(PesquisaProd.DataSet.FieldByName('PREC_TAB_PROD')).DisplayFormat;
      TFloatField(PesquisaProd.DataSet.FieldByName('PREC_60_PROD')).DisplayFormat := TFloatField(PesquisaProd.DataSet.FieldByName('PREC_TAB_PROD')).DisplayFormat;
      TFloatField(PesquisaProd.DataSet.FieldByName('PREC_90_PROD')).DisplayFormat := TFloatField(PesquisaProd.DataSet.FieldByName('PREC_TAB_PROD')).DisplayFormat;
      TFloatField(PesquisaProd.DataSet.FieldByName('PREC_PUBLICO')).DisplayFormat := TFloatField(PesquisaProd.DataSet.FieldByName('PREC_TAB_PROD')).DisplayFormat;

      produtoSimilar(
      	dataset.FieldByName('grupo_prod').asInteger,
        dataset.FieldByName('cod_prod').asstring);

      _PesquisaGradeProd._PesquisaGrade(
      	dataset.FieldByName('grupo_prod').asstring,
        dataset.FieldByName('cod_prod').asstring);

      if frmLocalizar.MenuLateralExibirCodigosProd.Checked then
        _PesquisaCodBarra._PesquisaCodBarra(
          dataset.FieldByName('grupo_prod').asstring,
          dataset.FieldByName('cod_prod').asstring);
    end;
  finally
    buscas2.Free;
  end;
end;

procedure TConsultaProdutoP.ProdGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
   if (Sender.FieldName = 'DETALHES_PROD') or (Sender.FieldName = 'Observacoes') then
     Text := StringReplace(Copy(Sender.AsString, 1, 255), sLineBreak, ' ', [rfReplaceAll]);
end;

function TConsultaProdutoP.produtoSimilar(vgrupo: integer;
  vcodigo: string): boolean;
var
  buscas2: TIBQuery;
  valorEstoque: real;
  vSomaEstoque, vSomarEstFechado, vSomarReserva, vSomarEstPrima: Extended;
  vListProduto: TStringList;
begin
	if Assigned(frmLocalizar) then
    frmLocalizar.BitBtn10.Enabled := False;

  buscas2 := TIBQuery.Create(Application);
  vListProduto := TStringList.create;
  try
    buscas2.Database := buscas.Database;
    buscas2.Transaction := buscas.Transaction;

    vListProduto.Sorted := True;
    vListProduto.Duplicates := dupIgnore;
    vListProduto.Clear;

    result := false;
    vSomaEstoque     := 0;
    vSomarEstFechado := 0;
    vSomarReserva    := 0;
    vSomarEstPrima   := 0;
    if (vDadosIni.vSistema = 'Fiscal') and (vDadosIni.bancoConectado = 'local') then
    else if (vApresentarEstR = 'S') then
    begin
      buscas.Close;
      buscas.SQL.Text :=
        ' select sum(coalesce(pp.quant_ped_item, 0)) as somaEstoque from pedvenda_prod pp ' +
        ' inner join pedvenda p on pp.nped = p.nped and pp.tipo = p.tipo and pp.cod_empresa = p.cod_empresa ' +
        ' where pp.grupo_prod = ' + inttostr(vgrupo) +
        ' and pp.cod_prod = ' + QuotedStr(trim(vcodigo)) +
        ' and p.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and p.tipo <> ''ORC'' ' +
        ' and (p.data_fech is null or p.data_fech < ''01/01/1899'') ' +
        ' and p.ativo = 1 ' +
        ' and (pp.status <> ''CANCELADO'' or pp.status is null ) ';
      buscas.open;
      vSomaEstoque := buscas.FieldByName('somaEstoque').AsFloat;

      buscas.Close;
      buscas.SQL.Text :=
        ' select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) as somaEstoque from producao pd ' +
        ' inner join producao_item_indice pi on pd.cod_producao = pi.cod_producao and pd.cod_empresa = pi.cod_empresa ' +
        ' where pi.grupo_prod = ' + IntToStr(vgrupo) +
        ' and pi.cod_prod = ' + QuotedStr(vcodigo) +
        ' and pd.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and (pd.data_fechamento is null) ';
      buscas.Open;
      vSomaEstoque := vSomaEstoque + buscas.FieldByName('somaEstoque').AsFloat;
    end
    else if (vApresentarEstR = 'O') then
    begin
      buscas.Close;
      buscas.SQL.Text :=
        ' select sum(coalesce(pp.quant_ped_item, 0)) as somaEstoque from pedvenda_prod pp ' +
        ' inner join pedvenda p on pp.nped = p.nped and pp.tipo = p.tipo and pp.cod_empresa = p.cod_empresa ' +
        ' where pp.grupo_prod = ' + inttostr(vgrupo) +
        ' and pp.cod_prod = ' + QuotedStr(trim(vcodigo)) +
        ' and p.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and (p.data_fech is null or p.data_fech < ''01/01/1899'') ' +
        ' and p.tipo = ''OS''' +
        ' and p.ativo = 1 ' +
        ' and (pp.status <> ''CANCELADO'' or pp.status is null )';
      buscas.open;
      vSomaEstoque := buscas.FieldByName('somaEstoque').AsFloat;
    end
    else if (vApresentarEstR = 'R') then
    begin
      buscas.Close;
      buscas.SQL.Text :=
        ' select sum(coalesce(pp.quant_ped_item, 0)) as somaEstoque from pedvenda_prod pp ' +
        ' inner join pedvenda p on pp.nped = p.nped and pp.tipo = p.tipo and pp.cod_empresa = p.cod_empresa' +
        ' where pp.grupo_prod = ' + inttostr(vgrupo) +
        ' and pp.cod_prod = ' + QuotedStr(trim(vcodigo)) +
        ' and p.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and (p.data_fech is null or p.data_fech < ''01/01/1899'') ' +
        ' and p.tipo = ''REQ'' ' +
        ' and p.ativo = 1 ' +
        ' and (pp.status <> ''CANCELADO'' or pp.status is null )';
      buscas.open;
      vSomaEstoque := buscas.FieldByName('somaEstoque').AsFloat;
    end
    else if (vApresentarEstR = 'P') then
    begin
      buscas.Close;
      buscas.SQL.Text :=
        ' select sum(coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)) as somaEstoque from producao pd ' +
        ' inner join producao_item_indice pi on pd.cod_producao = pi.cod_producao and pd.cod_empresa = pi.cod_empresa ' +
        ' where pi.grupo_prod = ' + IntToStr(vgrupo) +
        ' and pi.cod_prod = ' + QuotedStr(vcodigo) +
        ' and pd.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and (pd.data_fechamento is null) ';
      buscas.Open;
      vSomaEstoque := buscas.FieldByName('somaEstoque').AsFloat;
    end;

    if (vDadosIni.vSistema = 'Fiscal') and (vDadosIni.bancoConectado = 'local') then
    else //if vDadosIni.vEmp.vAlmox = 'S2' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select sum(coalesce(c.quant,0)) as somaEstoque from controle_almoxarifado c ' +
        ' where c.grupo_prod = ' + IntToStr(vgrupo) +
        ' and c.cod_prod = ' + QuotedStr(vcodigo) +
        ' and c.cod_empresa =' + vDadosIni.codEmpresa;
      buscas.Open;
      vSomarEstFechado := buscas.FieldByName('somaEstoque').AsFloat;

      buscas.Close;
      buscas.SQL.Text := 'select sum(coalesce(r.quant,0)) as somaEstoque from reserva_almoxarifado_itens r ' +
        ' where r.grupo_prod = ' + IntToStr(vgrupo) +
        ' and r.cod_prod = ' + QuotedStr(vcodigo) +
        ' and r.cod_empresa = ' + vDadosIni.codEmpresa;
      buscas.Open;
      vSomarReserva := buscas.FieldByName('somaEstoque').AsFloat;

      buscas.Close;
      buscas.SQL.Text := ' select coalesce(estoque, 0) as somaEstoque from getestoque_recursivo ( ' +
        IntToStr(vgrupo) + ', ' +
        QuotedStr(vcodigo) + ', ' +
        vDadosIni.codEmpresa + ', ' +
        '0);';
      buscas.Open;
      vSomarEstPrima := buscas.FieldByName('somaEstoque').AsFloat;
    end;

    if (not buscas.IsEmpty) and (vApresentarEstR = 'S') then
      valorEstoque := (dataset.FieldByName('est_f').asfloat - vSomaEstoque)
    else
      valorEstoque := dataset.FieldByName('est_f').asfloat;
    
    buscas2.Close;
    buscas2.SQL.Text := ' select lista_imagens from produtos ' +
      ' where grupo_prod = :grupo_prod and cod_prod = :cod_prod and cod_empresa = :cod_empresa ';
    buscas2.ParamByName('grupo_prod').AsInteger := dataSet.FieldByName('grupo_prod').AsInteger;
    buscas2.ParamByName('cod_prod').AsString := dataSet.FieldByName('cod_prod').AsString;
    buscas2.ParamByName('cod_empresa').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas2.Open;

    BitBtnFoto.visible := trim(buscas2.FieldByName('lista_imagens').asString) <> '';
    PanelEstF.Caption := FormatFloat('0.000', 0);
    PanelEstR.Caption := FormatFloat('0.000', 0);
    PanelEstPrima.Caption := FormatFloat('0.000', 0);
  //  if (vDadosIni.vEmp.vAlmox <> 'S2') and (vApresentarEstR = 'S') then
  //    PanelEstF.Caption := FormatFloat('0.000', ((dataset.FieldByName('Est_F').AsFloat) - (vSomaEstoque)))
  //  else if (vDadosIni.vEmp.vAlmox = 'S2') and (vApresentarEstR = 'S') then
    if (vApresentarEstR = 'S') then
    begin
      PanelEstF.Caption := FormatFloat('0.000',
        ((dataset.FieldByName('Est_F').AsFloat) - (vSomaEstoque) - (vSomarEstFechado)));
      PanelEstR.Caption := FormatFloat('0.000',
        (vSomarReserva));
      PanelEstPrima.Caption := FormatFloat('0.000',
        (vSomarEstPrima));
    end
    else
      PanelEstF.Caption := FormatFloat('0.000',
        (dataset.FieldByName('Est_F').AsFloat));
  //  PanelEstR.Caption := FormatFloat('0.000', (dataset.FieldByName('Est_R').AsFloat));

    if valorEstoque > 0 then
    begin
      buscas.close;
      buscas.sql.text := '';
      if not vDadosIni.vProdSimilar.vAgruparSimilar then
      begin
        buscas.sql.text := buscas.sql.text +
          ' select p.cod_prod, p.grupo_prod, p.num_fab_prod, p.est_f, ' +
          ' (select estoque from getestoquedisponivel(ps.grupo_ps, ps.cod_ps, 0, ps.cod_empresa, 0, '''', 0, 0)) estoque ' +
          ' from prod_similares ps ' +
          ' inner join produtos p on ps.grupo_ps = p.grupo_prod and ps.cod_ps = p.cod_prod and ps.cod_empresa = p.cod_empresa ' +
          ' where ps.grupo_prod = ' + inttostr(vgrupo) + ' and ps.cod_prod = ' + QuotedStr(Trim(vcodigo)) +
          ' and ps.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and ps.ativo = 1 and p.ativo=1 ';
      end
      else
      begin
        buscas.sql.text := buscas.sql.text +
          ' select ps.cod_prod, ps.grupo_prod, p.num_fab_prod, p.est_f, ' +
          ' (select estoque from getestoquedisponivel(ps.grupo_prod, ps.cod_prod, 0, ps.cod_empresa, 0, '''', 0, 0)) estoque ' +
          ' from prod_similares_grupos_itens ps ' +
          ' inner join produtos p on ps.grupo_prod = p.grupo_prod and ps.cod_prod = p.cod_prod and ps.cod_empresa = p.cod_empresa ' +
          ' where ps.cod_grupo_sim in ' +
          '     (select distinct ps1.cod_grupo_sim from prod_similares_grupos_itens ps1 ' +
          '      inner join prod_similares_grupos pp on pp.cod_grupo_sim = ps1.cod_grupo_sim and pp.cod_empresa = ps1.cod_empresa ' +
          '      inner join produtos p on ps1.grupo_prod = p.grupo_prod and ps1.cod_prod = p.cod_prod and ps1.cod_empresa = p.cod_empresa ' +
          '      where ps1.grupo_prod = ' + inttostr(vgrupo) +
          ' 		 and ps1.cod_prod = ' + QuotedStr(Trim(vcodigo)) +
          '      and ps1.cod_empresa = ' + vDadosIni.codEmpresa;

        if not vDadosIni.vProdSimilar.vSimilaresEntreSi then
          buscas.sql.text := buscas.sql.text +
            ' 	 and ps1.principal = ''S'' ';

        buscas.sql.text := buscas.sql.text +
          ' 		 and pp.ativo = 1) ' +
          ' and ps.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and not(ps.grupo_prod = ' + inttostr(vgrupo) +
          ' and ps.cod_prod = ' + QuotedStr(Trim(vcodigo)) + ') ';
      end;
      buscas.open;

      if Assigned(frmLocalizar) then
        frmLocalizar.BitBtn10.Enabled := buscas.RecordCount > 0;
    end;

    if (vDadosIni.vSistema = 'Fiscal') and (vDadosIni.bancoConectado = 'local') then
    else if valorEstoque <= 0 then
    begin
      buscas.close;
      buscas.sql.text := '';
      if not vDadosIni.vProdSimilar.vAgruparSimilar then
      begin
        buscas.sql.text := buscas.sql.text +
          ' select p.cod_prod, p.grupo_prod, p.num_fab_prod, p.est_f, ' +
          ' (select estoque from getestoquedisponivel(ps.grupo_ps, ps.cod_ps, 0, ps.cod_empresa, 0, '''', 0, 0)) estoque ' +
          ' from prod_similares ps ' +
          ' inner join produtos p on ps.grupo_ps = p.grupo_prod and ps.cod_ps = p.cod_prod and ps.cod_empresa = p.cod_empresa ' +
          ' where ps.grupo_prod = ' + inttostr(vgrupo) + ' and ps.cod_prod = ' + QuotedStr(Trim(vcodigo)) +
          ' and ps.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and ps.ativo = 1 and p.ativo=1 ';
      end
      else
      begin
        buscas.sql.text := buscas.sql.text +
          ' select ps.cod_prod, ps.grupo_prod, p.num_fab_prod, p.est_f, ' +
          ' (select estoque from getestoquedisponivel(ps.grupo_prod, ps.cod_prod, 0, ps.cod_empresa, 0, '''', 0, 0)) estoque ' +
          ' from prod_similares_grupos_itens ps ' +
          ' inner join produtos p on ps.grupo_prod = p.grupo_prod and ps.cod_prod = p.cod_prod and ps.cod_empresa = p.cod_empresa ' +
          ' where ps.cod_grupo_sim in ' +
          '     (select distinct ps1.cod_grupo_sim from prod_similares_grupos_itens ps1 ' +
          '      inner join prod_similares_grupos pp on pp.cod_grupo_sim = ps1.cod_grupo_sim and pp.cod_empresa = ps1.cod_empresa ' +
          '      inner join produtos p on ps1.grupo_prod = p.grupo_prod and ps1.cod_prod = p.cod_prod and ps1.cod_empresa = p.cod_empresa ' +
          '      where ps1.grupo_prod = ' + inttostr(vgrupo) +
          ' 		 and ps1.cod_prod = ' + QuotedStr(Trim(vcodigo)) +
          '      and ps1.cod_empresa = ' + vDadosIni.codEmpresa;

        if not vDadosIni.vProdSimilar.vSimilaresEntreSi then
          buscas.sql.text := buscas.sql.text +
            ' 	 and ps1.principal = ''S'' ';

        buscas.sql.text := buscas.sql.text +
          ' 		 and pp.ativo = 1) ' +
          ' and ps.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and not(ps.grupo_prod = ' + inttostr(vgrupo) +
          ' and ps.cod_prod = ' + QuotedStr(Trim(vcodigo)) + ') ';
      end;
      buscas.open;
      buscas.FetchAll;
      if not Buscas.IsEmpty then
      begin
        if Assigned(frmLocalizar) then
          frmLocalizar.BitBtn10.Enabled := buscas.RecordCount > 0;

        buscas.First;
        while not Buscas.eof do
        begin
          if buscas.FieldByName('estoque').AsFloat > 0 then
          begin
            vListProduto.Add('Num Fab: ' + trim(buscas.FieldByName('NUM_FAB_PROD').Asstring) +
              ' Estoque: ' + FormatFloat('0.000', buscas.FieldByName('estoque').AsFloat));
          end;
          buscas.next;
        end;

        if vListProduto.Count > 0 then
        begin
          vDadosIni.vInibeMensPesqPros := 'S';
          if vDadosIni.PesqPros('PES011', 'HABILITAR', '', 'PRODUTOS', '', buscas, true) then
          begin
            Application.MessageBox(PChar('Produto com estoque zerado, Use o(s) produto(s) similar: ' + #13 +
              vListProduto.Text),	'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
          end;
          result := true;
          exit;
        end;
      end;
    end;

  finally
    vListProduto.Free;
    buscas.Close;
    buscas2.Free;
  end;
end;

procedure TConsultaProdutoP.ProdWithTimerAfterScroll(DataSet: TDataSet);
begin
  timerConsulta.Enabled := False;
  timerConsulta.Enabled := True;
end;

procedure TConsultaProdutoP.TimerConsultaTimer(Sender: TObject);
begin
  timerConsulta.Enabled := False;
  ProdAfterScroll(dataSet);
end;

{ TConsultaGrupo }

constructor TConsultaGrupo.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPGr);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqGr.Database;
  buscas.Transaction := transacao;
  vtabela := 'GRUPOS';
end;

procedure TConsultaGrupo.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('codigo_grup').asinteger;
end;

{ TConsultaTransportador }

constructor TConsultaTransportador.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPTr);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqTr.Database;
  buscas.Transaction := transacao;
  vtabela := 'TRANSPORTADOR';
end;

procedure TConsultaTransportador.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('codigo_tr').asinteger;
end;

{ TConsultaSubGrupo }

constructor TConsultaSubGrupo.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPSub);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqSub.Database;
  buscas.Transaction := transacao;
  vtabela := 'SUB_GRUPO';
end;

procedure TConsultaSubGrupo.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('codigo_subgr').AsInteger;
end;

{ TConsulta }

function TConsulta.AbrirVendaPerdida: boolean;
begin
  try
    result := true;
    if Funcionario = nil then
      Funcionario := TConsultaColaborador.create;
    Funcionario.abreColaborador;
    if TipoVndPerdida = nil then
      TipoVndPerdida := TTipoVndPerdida.create;
    TipoVndPerdida.abreTipoVndPerdida;
    if VendaPerdida = nil then
      VendaPerdida := TVendaPerdida.create;
    VendaPerdida.abreVendaPerdida;
    if VendaPerdida.Insert then
      result := true
    else
      result := false;
  except
    result := false;
  end;
end;

function TConsulta.AlteraLocacao(LOCACAOPROD, LOCACAOPROD1: string): boolean;
begin
  result := true;
  if Application.MessageBox('Deseja Confirmar Alteração de Locações?.', 'Confirmação', MB_YESNO
    + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES then
  begin
    if ExecutaComandosSqlExec('update PRODUTOS set LOCACAO_PROD = ''' + LOCACAOPROD + ''',' +
      ' LOCACAO_PROD_1 = ''' + LOCACAOPROD + ''' where GRUPO_PROD = ' +
      dataSet.FieldByName('GRUPO_PROD').AsString +
      ' and COD_PROD = ' + quotedstr(dataSet.FieldByName('COD_PROD').AsString) +
      ' and cod_empresa = ' + vDadosIni.CodEmpresa + ' and ativo = 1') then
      result := CommitaTransacao;
  end
  else
    result := false;
end;

function TConsulta.cl_abreExtrato_form(ACodCliente: Integer): boolean;
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

    if vClienteCons.AHandle = 0 then
      CarregaPacote('pkClientes', vClienteCons.AHandle);

    if vClienteCons.AHandle = 0 then
    begin
      Application.MessageBox('Pacote Cliente não carregado', 'Anteção', 0 + 64);
      Exit;
    end;
    @AProcedure := GetProcAddress(vClienteCons.AHandle, 'cl_abreExtrato_form');

    if Assigned(AProcedure) then
      Result := AProcedure(ACodCliente);
  finally
  end;
end;

function TConsulta.FichadeVenda(NomeCli: string): boolean;
var
	I: Integer;
  vdtItensProd: TClientDataSet;
  vdtItensProdDtSource: TDataSource;
  vdtSetDevTemp, vdtSetItensTemp: TClientDataSet;
  Buscas2: TIBQuery;
begin
  Buscas2 := nil;
  vdtSetDevTemp := nil;
  vdtSetItensTemp := nil;

  try
  	try
    	vdtItensProd := TClientDataSet.Create(nil);
      vdtItensProd.Close;
      vdtItensProd.FieldDefs.Clear;
      vdtItensProd.FieldDefs.Add('TP', ftString, 3, false);
      vdtItensProd.FieldDefs.Add('NOME_CLIENTE', ftString, 35, false);
      vdtItensProd.FieldDefs.Add('NDOC', ftInteger, 0, false);
      vdtItensProd.FieldDefs.Add('VALOR', ftFloat, 0, false);
      vdtItensProd.FieldDefs.Add('DATA', ftDateTime, 0, false);
      vdtItensProd.FieldDefs.Add('DATA_FECH', ftDateTime, 0, false);
      vdtItensProd.FieldDefs.Add('QTDE_CONV', ftFloat, 0, false);
      vdtItensProd.FieldDefs.Add('QUANT_DEV_ITEM_TEMP_CONV', ftFloat, 0, false);
      vdtItensProd.FieldDefs.Add('VL_UNIT_CONV', ftFloat, 0, false);
      vdtItensProd.FieldDefs.Add('VL_UNIT_CONV_LIQ', ftFloat, 0, false);
      vdtItensProd.FieldDefs.Add('VL_TOT', ftFloat, 0, false);
      vdtItensProd.FieldDefs.Add('VL_TOT_LIQ', ftFloat, 0, false);
      vdtItensProd.FieldDefs.Add('RATEIO_DESC', ftFloat, 0, false);
      vdtItensProd.FieldDefs.Add('RATEIO_ACRESC', ftFloat, 0, false);
      vdtItensProd.FieldDefs.Add('COD_CLIENTE', ftInteger, 0, false);
      vdtItensProd.FieldDefs.Add('GRUPO_PROD', ftInteger, 0, false);
      vdtItensProd.FieldDefs.Add('COD_PROD', ftString, 6, false);
      vdtItensProd.FieldDefs.Add('COD_GRADE', ftInteger, 0, false);
      vdtItensProd.FieldDefs.Add('NUM_FAB_PROD', ftString, 20, false);
      vdtItensProd.FieldDefs.Add('DESCR_PROD', ftString, 75, false);
      vdtItensProd.FieldDefs.Add('TIPOVENDA', ftString, 1, false);
      vdtItensProd.FieldDefs.Add('TIPOOS', ftString, 40, false);
      vdtItensProd.FieldDefs.Add('DESCRICAOGRADE', ftString, 32, false);
      vdtItensProd.FieldDefs.Add('STATUS_PED', ftString, 10, false);
      vdtItensProd.FieldDefs.Add('STATUS', ftString, 10, false);
      vdtItensProd.FieldDefs.Add('TABPRATICADA', ftString, 1, false);
      vdtItensProd.FieldDefs.Add('QTDE', ftFloat, 0, false);
      vdtItensProd.FieldDefs.Add('QUANT_DEV_ITEM_TEMP', ftFloat, 0, false);
      vdtItensProd.FieldDefs.Add('VL_UNIT', ftFloat, 0, false);
      vdtItensProd.FieldDefs.Add('VL_UNIT_LIQ', ftFloat, 0, false);
      vdtItensProd.FieldDefs.Add('N_ITEM', ftInteger, 0, false);
      vdtItensProd.FieldDefs.Add('COD_EMPRESA', ftInteger, 0, false);
      vdtItensProd.FieldDefs.Add('UNIDADE', ftString, 6, false);
      vdtItensProd.FieldDefs.Add('UNIDADE_CONV', ftString, 6, false);
      vdtItensProd.FieldDefs.Add('OPERACAO_CONV', ftString, 1, false);
      vdtItensProd.FieldDefs.Add('FATOR_CONV', ftFloat, 0, false);

      if vdtItensProd.Tag = 0 then
      try
        vdtItensProd.CreateDataSet;
        vdtItensProd.Tag := 1;

        vdtItensProd.FieldByName('TP').DisplayLabel := 'Tipo';
        vdtItensProd.FieldByName('NOME_CLIENTE').DisplayLabel := 'Cliente';
        vdtItensProd.FieldByName('NDOC').DisplayLabel := 'Num Doc';
        vdtItensProd.FieldByName('VALOR').DisplayLabel := 'Valor Doc';
        vdtItensProd.FieldByName('DATA').DisplayLabel := 'Data Venda';
        vdtItensProd.FieldByName('DATA_FECH').DisplayLabel := 'Data Fechamento';
        vdtItensProd.FieldByName('DESCR_PROD').DisplayLabel := 'Produto';
        vdtItensProd.FieldByName('NUM_FAB_PROD').DisplayLabel := 'Numero Fabricação';
        vdtItensProd.FieldByName('QTDE_CONV').DisplayLabel := 'Qtde';
        vdtItensProd.FieldByName('QUANT_DEV_ITEM_TEMP_CONV').DisplayLabel := 'Qtde Dev';
        vdtItensProd.FieldByName('VL_UNIT_CONV').DisplayLabel := 'Val. Unitário Bruto';
        vdtItensProd.FieldByName('VL_UNIT_CONV_LIQ').DisplayLabel := 'Val. Unitário Liq';
        vdtItensProd.FieldByName('VL_TOT').DisplayLabel := 'Total Bruto';
        vdtItensProd.FieldByName('VL_TOT_LIQ').DisplayLabel := 'Total Liq';
        vdtItensProd.FieldByName('RATEIO_DESC').DisplayLabel := 'Rateio de Desconto';
        vdtItensProd.FieldByName('RATEIO_ACRESC').DisplayLabel := 'Rateio do Acréscimo';
        vdtItensProd.FieldByName('COD_CLIENTE').DisplayLabel := 'Cod Cliente';
        vdtItensProd.FieldByName('COD_EMPRESA').DisplayLabel := 'Cod Empresa';
        vdtItensProd.FieldByName('GRUPO_PROD').DisplayLabel := 'Grupo Produto';
        vdtItensProd.FieldByName('COD_PROD').DisplayLabel := 'Cod Prod';
        vdtItensProd.FieldByName('COD_GRADE').DisplayLabel := 'Cod Grade';
        vdtItensProd.FieldByName('TIPOVENDA').DisplayLabel := 'Tipo de Saída';
        vdtItensProd.FieldByName('TIPOOS').DisplayLabel := 'Tipo de O.S.';
        vdtItensProd.FieldByName('DESCRICAOGRADE').DisplayLabel := 'GRADE';
        vdtItensProd.FieldByName('STATUS_PED').DisplayLabel := 'Status Pedido';
        vdtItensProd.FieldByName('STATUS').DisplayLabel := 'Status';
		  vdtItensProd.FieldByName('TABPRATICADA').DisplayLabel := 'Preço P/T/Q/N';
        vdtItensProd.FieldByName('QTDE').DisplayLabel := 'Qtde (Un Princ)';
        vdtItensProd.FieldByName('VL_UNIT').DisplayLabel := 'Val. Unitário Bruto (Un Princ)';
        vdtItensProd.FieldByName('VL_UNIT_LIQ').DisplayLabel := 'Val. Unitário Liq (Un Princ)';
        vdtItensProd.FieldByName('QUANT_DEV_ITEM_TEMP').DisplayLabel := 'Qtde Dev (Un Princ)';
        vdtItensProd.FieldByName('N_ITEM').DisplayLabel := 'Nº Item';

        TFloatField(vdtItensProd.FieldByName('VALOR')).DisplayFormat := '##0.00';
        TFloatField(vdtItensProd.FieldByName('QTDE')).DisplayFormat := '##0.0000';
        TFloatField(vdtItensProd.FieldByName('QTDE_CONV')).DisplayFormat := '##0.0000';        
        TFloatField(vdtItensProd.FieldByName('QUANT_DEV_ITEM_TEMP')).DisplayFormat := '##0.0000';
        TFloatField(vdtItensProd.FieldByName('QUANT_DEV_ITEM_TEMP_CONV')).DisplayFormat := '##0.0000';
        TFloatField(vdtItensProd.FieldByName('VL_UNIT_CONV')).DisplayFormat := '##0.000';
        TFloatField(vdtItensProd.FieldByName('VL_UNIT_CONV_LIQ')).DisplayFormat := '##0.000';
        TFloatField(vdtItensProd.FieldByName('VL_UNIT')).DisplayFormat := '##0.000';
        TFloatField(vdtItensProd.FieldByName('VL_UNIT_LIQ')).DisplayFormat := '##0.000';
        TFloatField(vdtItensProd.FieldByName('VL_TOT')).DisplayFormat := '##0.000';
        TFloatField(vdtItensProd.FieldByName('VL_TOT_LIQ')).DisplayFormat := '##0.000';
        TFloatField(vdtItensProd.FieldByName('RATEIO_DESC')).DisplayFormat := '##0.000';
        TFloatField(vdtItensProd.FieldByName('RATEIO_ACRESC')).DisplayFormat := '##0.000';

        vdtItensProd.FieldByName('COD_EMPRESA').Visible := False;
        vdtItensProd.FieldByName('UNIDADE').Visible := False;
        vdtItensProd.FieldByName('UNIDADE_CONV').Visible := False;
        vdtItensProd.FieldByName('OPERACAO_CONV').Visible := False;
        vdtItensProd.FieldByName('FATOR_CONV').Visible := False;

        vdtItensProdDtSource := TDataSource.Create(nil);
    		vdtItensProdDtSource.DataSet := vdtItensProd;
      except
      end;

    	vdtSetDevTemp := TClientDataSet.Create(nil);
      vdtSetDevTemp.Close;
      vdtSetDevTemp.FieldDefs.Clear;
      vdtSetDevTemp.FieldDefs.Add('NPED', ftInteger, 0, false);
      vdtSetDevTemp.FieldDefs.Add('TIPO', ftString, 3, false);
      vdtSetDevTemp.FieldDefs.Add('GRUPO_PROD', ftInteger, 0, false);
      vdtSetDevTemp.FieldDefs.Add('COD_PROD', ftString, 6, false);
      vdtSetDevTemp.FieldDefs.Add('COD_GRADE', ftInteger, 0, false);
      vdtSetDevTemp.FieldDefs.Add('QUANT_DEV_REST', ftFloat, 0, false);

      if vdtSetDevTemp.Tag = 0 then
      try
        vdtSetDevTemp.CreateDataSet;
        vdtSetDevTemp.Tag := 1;
      except
      end;

      vdtSetItensTemp := TClientDataSet.Create(nil);
      vdtSetItensTemp.Close;
      vdtSetItensTemp.FieldDefs.Clear;
      vdtSetItensTemp.FieldDefs.Add('NPED', ftInteger, 0, false);
      vdtSetItensTemp.FieldDefs.Add('TIPO', ftString, 3, false);
      vdtSetItensTemp.FieldDefs.Add('GRUPO_PROD', ftInteger, 0, false);
      vdtSetItensTemp.FieldDefs.Add('COD_PROD', ftString, 6, false);
      vdtSetItensTemp.FieldDefs.Add('NITEM', ftInteger, 0, false);
      vdtSetItensTemp.FieldDefs.Add('COD_GRADE', ftInteger, 0, false);
      vdtSetItensTemp.FieldDefs.Add('CODIGO_NOP', ftFloat, 0, false);
      vdtSetItensTemp.FieldDefs.Add('QUANT_PED_ITEM', ftFloat, 0, false);
      vdtSetItensTemp.FieldDefs.Add('QUANT_DEV_ITEM', ftFloat, 0, false);

      if vdtSetItensTemp.Tag = 0 then
      try
        vdtSetItensTemp.CreateDataSet;
        vdtSetItensTemp.Tag := 1;
      except
      end;

      Buscas2 := TIBQuery.Create(nil);
      Buscas2.Database := buscas.Database;
      Buscas2.Transaction := buscas.Transaction;

      buscas.Close;
      if NomeCli = '' then
      begin
        buscas.SQL.Text := ' select fichavendaprod4.* from fichavendaprod4 ' +
          ' where fichavendaprod4.grupo_prod = ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger) +
          ' and fichavendaprod4.cod_prod = ' + QuotedStr(dataSet.FieldByName('COD_PROD').AsString) +
          ' and fichavendaprod4.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and fichavendaprod4.status_ped = ''FECHADA'' ' +
          ' order by fichavendaprod4.data_fech, fichavendaprod4.ndoc, fichavendaprod4.tp '
      end
      else
        buscas.SQL.Text := ' select fichavendaprod4.* from fichavendaprod4 ' +
          ' where fichavendaprod4.grupo_prod = ' + IntToStr(dataSet.FieldByName('GRUPO_PROD').AsInteger) +
          ' and fichavendaprod4.cod_prod = ' + QuotedStr(dataSet.FieldByName('COD_PROD').AsString) +
          ' and fichavendaprod4.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and fichavendaprod4.status_ped = ''FECHADA'' ' +
          ' and fichavendaprod4.nome_cliente like ' + QuotedStr(NomeCli + '%') +
          ' order by fichavendaprod4.data_fech, fichavendaprod4.data, fichavendaprod4.ndoc, fichavendaprod4.tp ';
      buscas.Open;

      try
        buscas.DisableControls;
        buscas.First;
        while not buscas.Eof do
        begin
        	vdtItensProd.Insert;
          for I := 0 to vdtItensProd.Fields.Count - 1 do
          	if (vdtItensProd.Fields[I].FieldName <> 'QUANT_DEV_ITEM_TEMP')
              and (vdtItensProd.Fields[I].FieldName <> 'QUANT_DEV_ITEM_TEMP_CONV') then
          			vdtItensProd.FieldByName(vdtItensProd.Fields[I].FieldName).Value := buscas.FieldByName(vdtItensProd.Fields[I].FieldName).Value;
          vdtItensProd.Post;

          buscas.Next;
        end;
      finally
        buscas.EnableControls;
        buscas.First;
      end;

      try
      	if NomeCli = '' then
        	vdtItensProd.IndexFieldNames := 'DATA_FECH;NDOC;TP'
        else
        	vdtItensProd.IndexFieldNames := 'DATA_FECH;DATA;NDOC;TP';

        vdtItensProd.DisableControls;
        vdtItensProd.First;
        while not vdtItensProd.Eof do
        begin
        	 buscas2.Close;
          buscas2.SQL.Text := ' select ' + QuotedStr(vdtItensProd.FieldByName('TP').AsString) + ' tipo, ' +
            ' d.grupo_prod, d.cod_prod, d.cod_grade, sum(coalesce(d.quant, 0)) quant_dev_item from devolucao d ' +
            ' where d.cod_venda = ' + IntToStr(vdtItensProd.FieldByName('NDOC').AsInteger) +
            ' and d.tipo_venda = ' + QuotedStr(vdtItensProd.FieldByName('TP').AsString) +
            ' and d.grupo_prod = ' + IntToStr(vdtItensProd.FieldByName('GRUPO_PROD').AsInteger) +
            ' and d.cod_prod = ' + QuotedStr(vdtItensProd.FieldByName('COD_PROD').AsString) +
            ' and d.cod_grade = ' + IntToStr(vdtItensProd.FieldByName('COD_GRADE').AsInteger) +
            ' and d.cod_empresa = ' + vDadosIni.codEmpresa +
            ' group by 1,2,3,4 ';
          buscas2.Open;

          if not buscas2.IsEmpty then
          begin
            try
              vdtSetDevTemp.Filtered := false;
              vdtSetDevTemp.Filter :=
              	' nped = ' + IntToStr(vdtItensProd.FieldByName('NDOC').AsInteger) +
                ' and tipo = ' + QuotedStr(trim(vdtItensProd.FieldByName('TP').AsString)) +
                ' and grupo_prod = ' + IntToStr(vdtItensProd.FieldByName('GRUPO_PROD').AsInteger) +
                ' and cod_prod = ' + QuotedStr(trim(vdtItensProd.FieldByName('COD_PROD').AsString)) +
                ' and cod_grade = ' + IntToStr(vdtItensProd.FieldByName('COD_GRADE').AsInteger);
              vdtSetDevTemp.Filtered := true;

              vdtSetItensTemp.Insert;
              vdtSetItensTemp.FieldByName('NPED').AsInteger := vdtItensProd.FieldByName('NDOC').AsInteger;
              vdtSetItensTemp.FieldByName('TIPO').AsString := vdtItensProd.FieldByName('TP').AsString;
              vdtSetItensTemp.FieldByName('GRUPO_PROD').AsInteger := vdtItensProd.FieldByName('GRUPO_PROD').AsInteger;
              vdtSetItensTemp.FieldByName('COD_PROD').AsString := trim(vdtItensProd.FieldByName('COD_PROD').AsString);
              vdtSetItensTemp.FieldByName('NITEM').AsInteger := vdtItensProd.FieldByName('N_ITEM').AsInteger;
              vdtSetItensTemp.FieldByName('COD_GRADE').AsInteger := vdtItensProd.FieldByName('COD_GRADE').AsInteger;
              vdtSetItensTemp.FieldByName('QUANT_PED_ITEM').AsFloat := vdtItensProd.FieldByName('QTDE').AsFloat;

              if vdtSetDevTemp.IsEmpty then
              begin
                if (buscas2.FieldByName('QUANT_DEV_ITEM').AsFloat > 0)
                  and (buscas2.FieldByName('QUANT_DEV_ITEM').AsFloat > vdtItensProd.FieldByName('QTDE').AsFloat) then
                begin
                  vdtSetItensTemp.FieldByName('QUANT_DEV_ITEM').AsFloat := vdtSetItensTemp.FieldByName('QUANT_PED_ITEM').AsFloat;
                end
                else if (buscas2.FieldByName('QUANT_DEV_ITEM').AsFloat > 0)
                  and (buscas2.FieldByName('QUANT_DEV_ITEM').AsFloat <= vdtItensProd.FieldByName('QTDE').AsFloat) then
                begin
                  vdtSetItensTemp.FieldByName('QUANT_DEV_ITEM').AsFloat := buscas2.FieldByName('QUANT_DEV_ITEM').AsFloat;
                end
                else
                begin
                  vdtSetItensTemp.FieldByName('QUANT_DEV_ITEM').AsFloat := 0;
                end;

                vdtSetDevTemp.Insert;
                vdtSetDevTemp.FieldByName('NPED').AsInteger := vdtItensProd.FieldByName('NDOC').AsInteger;
              	 vdtSetDevTemp.FieldByName('TIPO').AsString := vdtItensProd.FieldByName('TP').AsString;
              	 vdtSetDevTemp.FieldByName('GRUPO_PROD').AsInteger := vdtItensProd.FieldByName('GRUPO_PROD').AsInteger;
                vdtSetDevTemp.FieldByName('COD_PROD').AsString := vdtItensProd.FieldByName('COD_PROD').AsString;
                vdtSetDevTemp.FieldByName('COD_GRADE').AsInteger := vdtItensProd.FieldByName('COD_GRADE').AsInteger;
                vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat := buscas2.FieldByName('QUANT_DEV_ITEM').AsFloat;

                if (vdtItensProd.FieldByName('QTDE').AsFloat >= buscas2.FieldByName('QUANT_DEV_ITEM').AsFloat) then
                    vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat := 0
                else if (buscas2.FieldByName('QUANT_DEV_ITEM').AsFloat > vdtItensProd.FieldByName('QTDE').AsFloat) then
                    vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat :=
                      vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat - vdtItensProd.FieldByName('QTDE').AsFloat;
                vdtSetDevTemp.Post;
              end
              else if (vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat > 0)
                and (vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat >= vdtSetItensTemp.FieldByName('QUANT_PED_ITEM').AsFloat) then
              begin
                vdtSetItensTemp.FieldByName('QUANT_DEV_ITEM').AsFloat := vdtSetItensTemp.FieldByName('QUANT_PED_ITEM').AsFloat;

                vdtSetDevTemp.Edit;
                vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat :=
                  vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat - vdtSetItensTemp.FieldByName('QUANT_PED_ITEM').AsFloat;
                vdtSetDevTemp.Post;
              end
              else
              begin
                vdtSetItensTemp.FieldByName('QUANT_DEV_ITEM').AsFloat := vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat;

                vdtSetDevTemp.Edit;
                vdtSetDevTemp.FieldByName('QUANT_DEV_REST').AsFloat := 0;
                vdtSetDevTemp.Post;
              end;

              vdtSetItensTemp.Post;
            finally
              vdtSetDevTemp.Filtered := false;
            end;
          end;

        	vdtItensProd.Next;
        end;


        vdtItensProd.First;
        while not vdtItensProd.Eof do
        begin
        	vdtItensProd.Edit;
        	try
            vdtSetItensTemp.Filtered := false;
            vdtSetItensTemp.Filter :=
            	' nped = ' + IntToStr(vdtItensProd.FieldByName('NDOC').AsInteger) +
              ' and tipo = ' + QuotedStr(trim(vdtItensProd.FieldByName('TP').AsString)) +
              ' and grupo_prod = ' + IntToStr(vdtItensProd.FieldByName('GRUPO_PROD').AsInteger) +
              ' and cod_prod = ' + QuotedStr(trim(vdtItensProd.FieldByName('COD_PROD').AsString)) +
              ' and nitem = ' + IntToStr(vdtItensProd.FieldByName('N_ITEM').AsInteger) +
              ' and cod_grade = ' + IntToStr(vdtItensProd.FieldByName('COD_GRADE').AsInteger);
            vdtSetItensTemp.Filtered := true;

            if not vdtSetItensTemp.IsEmpty then
              vdtItensProd.FieldByName('QUANT_DEV_ITEM_TEMP').AsFloat := vdtSetItensTemp.FieldByName('QUANT_DEV_ITEM').AsFloat
            else
              vdtItensProd.FieldByName('QUANT_DEV_ITEM_TEMP').AsFloat := 0;

            if (trim(vdtItensProd.FieldByName('UNIDADE_CONV').AsString) = '')
              or (UpperCase(trim(vdtItensProd.FieldByName('UNIDADE').AsString)) = UpperCase(trim(vdtItensProd.FieldByName('UNIDADE_CONV').AsString))) then
            begin
              vdtItensProd.FieldByName('QUANT_DEV_ITEM_TEMP_CONV').AsFloat := RoundTo(
              	vdtItensProd.FieldByName('QUANT_DEV_ITEM_TEMP').AsFloat, - 4);
            end
            else
            begin
              if (vdtItensProd.FieldByName('OPERACAO_CONV').AsString = 'M') and (vdtItensProd.FieldByName('FATOR_CONV').AsFloat > 0) then
              begin
                vdtItensProd.FieldByName('QUANT_DEV_ITEM_TEMP_CONV').AsFloat := RoundTo(
	                vdtItensProd.FieldByName('QUANT_DEV_ITEM_TEMP').AsFloat *
  	                vdtItensProd.FieldByName('FATOR_CONV').AsFloat, - 4);
              end
              else if (vdtItensProd.FieldByName('OPERACAO_CONV').AsString = 'D') and (vdtItensProd.FieldByName('FATOR_CONV').AsFloat > 0) then
    			  begin
                vdtItensProd.FieldByName('QUANT_DEV_ITEM_TEMP_CONV').AsFloat := RoundTo(
	                vdtItensProd.FieldByName('QUANT_DEV_ITEM_TEMP').AsFloat /
  	                vdtItensProd.FieldByName('FATOR_CONV').AsFloat, - 4);
              end
              else
              begin
             		vdtItensProd.FieldByName('QUANT_DEV_ITEM_TEMP_CONV').AsFloat := RoundTo(
              		vdtItensProd.FieldByName('QUANT_DEV_ITEM_TEMP').AsFloat, - 4); 
              end;
            end;

          finally
            vdtSetItensTemp.Filtered := false;
          end;

          vdtItensProd.Post;


        	vdtItensProd.Next;
        end;
      finally
      	vdtItensProd.First;
        vdtItensProd.EnableControls;
      end;

      frmLocalizar.DBGrid6.DataSource := vdtItensProdDtSource;

      result := true;
    finally
      if Assigned(buscas2) then
        FreeAndNil(buscas2);

//      if Assigned(vdtItensProd) then
//        FreeAndNil(vdtItensProd);
      if Assigned(vdtSetDevTemp) then
        FreeAndNil(vdtSetDevTemp);

      if Assigned(vdtSetItensTemp) then
        FreeAndNil(vdtSetItensTemp);

//      if Assigned(vdtItensProdDtSource) then
//        FreeAndNil(vdtItensProdDtSource);
    end;
  except
    result := false;
  end;
end;

function TConsulta.getNomeTabela: string;
begin
  Result := vtabela;
end;

function TConsulta.incluirRegistro: Boolean;
var
  hdTemp: THandle;
  formulario: TForm;
begin
  inherited;

  vDadosIni.vTipoForm := 1;
  vDadosIni.vModalOuChild := 'M';

  if (fNomePacote = 'pkProdutos') and (fNomeFormulario = 'TFrmCadProdutos') then
  	vDadosIni.vPesquisa := 'F3CADPRODUTO|';

  formulario := Funcoes.AbreForm(fNomePacote, fNomeFormulario, hdTemp);

  try
    formulario.ShowModal;
  finally
//    if (fNomePacote = 'pkProdutos') and (fNomeFormulario = 'TFrmCadProdutos') then
//	  	vDadosIni.vPesquisa := '';

    formulario.Free;
    unLoadPackage(hdTemp);
  end;
end;

function TConsulta.itensDoKit: boolean;
begin
  try
    result := true;
    buscas.Close;
    buscas.sql.text := 'Select * from kits_prod_kits ' +
      ' where codigo_kit = ' + inttostr(dataset.FieldByName('CODIGO_KIT').asinteger) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ATIVO=1';
    buscas.Open;
    buscas.FieldByName('CODIGO_KIT').DisplayLabel := 'Código Kit';
    buscas.FieldByName('grupo_prod').DisplayLabel := 'Grupo Produto';
    buscas.FieldByName('cod_prod').DisplayLabel := 'Cód. Produto';
    buscas.FieldByName('num_fab_prod').DisplayLabel := 'Número de Fabricação';
    buscas.FieldByName('QUANT_PROD_KIT').DisplayLabel := 'Quantidade';
    buscas.FieldByName('DESCR_PROD_KIT').DisplayLabel := 'Descrição';
    buscas.FieldByName('COD_EMPRESA').DisplayLabel := 'Cód. Empresa';
    buscas.FieldByName('Ativo').DisplayLabel := 'Ativo';
  except
    result := false;
  end;
end;

function TConsulta.ManterVendaPerdida(CodVendedor, CodigoVP: integer; qtdVP: real): boolean;
begin
  try
    result := true;
    buscas.Close;
    buscas.sql.Text := 'select grupo_prod,cod_prod,data_vnp from venda_perdida ' +
      ' where grupo_prod = ' + dataSet.FieldByName('GRUPO_PROD').AsString +
      ' and cod_prod = ' + quotedstr(dataSet.FieldByName('COD_PROD').AsString) +
      ' and codigo_vp = ' + inttostr(CodigoVP) +
      //TipoVndPerdida.dataSet.FieldByName('CODIGO_VP').AsString +
    ' and data_vnp = ' + quotedstr(FormatDateTime('mm/dd/yyyy', date)) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ATIVO=1';
    buscas.Open;
    if not buscas.IsEmpty then
    begin
      VendaPerdida.dataSet.Cancel; //vDadosIni.trocaVirgulaPorPonto()
      if Application.MessageBox('Venda Perdida deste produto para este dia ja existe.' + chr(13) +
        'Deseja altera-la?', 'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) = IDYES
        then
      begin
        if ExecutaComandosSqlExec('update venda_perdida set' +
          ' CODIGO_VP = ' + inttostr(CodigoVP) +
          ', COD_VENDEDOR = ' + inttostr(CodVendedor) +
          ', QUANT_PROD_VP = ' +
          vDadosIni.trocaVirgulaPorPonto(vDadosIni.tirapontos(floattostr(qtdVP), 0)) +
          ' where GRUPO_PROD = ' + buscas.FieldByName('GRUPO_PROD').AsString +
          ' and COD_PROD = ' + quotedstr(buscas.FieldByName('COD_PROD').AsString) +
          ' and cod_empresa = ' + vDadosIni.CodEmpresa + ' and ativo = 1') then
          result := CommitaTransacao;
      end
      else
        result := true;
    end
    else
    begin
      VendaPerdida.dataSet.FieldByName('COD_EMPRESA').AsInteger := strtoint(vDadosIni.codempresa);
      VendaPerdida.dataSet.FieldByName('DATA_VNP').AsDateTime := date;
      if VendaPerdida.Post then
      begin
        if VendaPerdida.Apply then
        begin
          result := CommitaTransacao;
        end
        else
          result := false;
      end
      else
        result := false;
    end;
  except
    result := false;
  end;
end;

procedure TConsulta.ObterCamposAdicionais(AStrings: TStrings);
var
  ACampo: string;
  Field: TField;
  CamposAdicionais: TStrings;
begin
  if AStrings = nil then
    Exit;

  CamposAdicionais := TStringList.Create;
  try
    CamposAdicionais.Assign(AStrings);
    AStrings.Clear();

    for ACampo in CamposAdicionais do
    begin
      Field := dataSet.FindField(UpperCase(StringReplace(ACampo, '=', '', [])));
      if Assigned(Field) then
        AStrings.Values[ACampo] := Field.AsString
      else
        AStrings.Values[ACampo] := '';
    end;

  finally
    CamposAdicionais.Free();
  end;
end;

function TConsulta.MediaVendaMes: boolean;
var
  QtdMesEmp: integer;
  vm: real;
begin
  try
    buscas.Close;
    buscas.SQL.Text := 'select QTMESSUG from empresa where cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;
    QtdMesEmp := buscas.FieldByName('QTMESSUG').AsInteger;
    buscas.close;
    buscas.SQL.Text := 'select vmes AS MES,vano AS ANO,sum(vqt) AS QTDE' +
      ' from demandap4 ' +
      ' where cod_prod = ' + quotedstr(trim(dataSet.FieldByName('COD_PROD').AsString)) +
      ' and grupo_prod = ' + dataSet.FieldByName('GRUPO_PROD').AsString +
      ' and data_os_rq >= :vdata and COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' and ativo=1 group by vano,vmes';
    buscas.ParamByName('vdata').AsDate := date - (QtdMesEmp * 30);
    buscas.Prepare;
    buscas.Open;
    vm := 0;
    while not buscas.eof do
    begin
      Vm := Vm + buscas.FieldByName('QTDE').asfloat;
      buscas.next;
    end;
    Application.MessageBox(PChar('Média por Mes: ' + floattostr(vm / QtdMesEmp)),
      'Média de Venda Mensal', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
    buscas.close;
  except
    result := false;
  end;
end;

function TConsulta.produtoSimilar: boolean;
begin
  try
    result := true;
    buscas.Close;
    buscas.sql.text := '';
    if not vDadosIni.vProdSimilar.vAgruparSimilar then
    begin
      buscas.sql.text := buscas.sql.text +
        ' SELECT p.num_fab_prod, p.est_f, ' +
        ' (select estoque from getestoquedisponivel(ps.grupo_ps, ps.cod_ps, 0, ps.cod_empresa, 0, '''', 0, 0)) estoque, ' +
        ' p.descr_prod, p.marca_p, p.grupo_prod, p.cod_prod ' +
        ' from prod_similares ps ' +
        ' inner join produtos p on ps.grupo_ps = p.grupo_prod and ps.cod_ps = p.cod_prod and ps.cod_empresa = p.cod_empresa ' +
        ' where ps.grupo_prod = ' + inttostr(dataSet.FieldByName('GRUPO_PROD').asinteger) +
        ' and ps.cod_prod = ' + quotedstr(dataSet.FieldByName('COD_PROD').asstring) +
        ' and ps.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ps.ativo = 1 and p.ativo=1 ';
    end
  	else
    begin
      buscas.sql.text := buscas.sql.text +
        ' select p.num_fab_prod, p.est_f, ' +
        ' (select estoque from getestoquedisponivel(ps.grupo_prod, ps.cod_prod, 0, ps.cod_empresa, 0, '''', 0, 0)) estoque, ' +
        ' p.descr_prod, p.marca_p, ps.grupo_prod, ps.cod_prod ' +
        ' from prod_similares_grupos_itens ps ' +
        ' inner join produtos p on ps.grupo_prod = p.grupo_prod and ps.cod_prod = p.cod_prod and ps.cod_empresa = p.cod_empresa ' +
        ' where ps.cod_grupo_sim in ' +
        '    (select distinct ps1.cod_grupo_sim from prod_similares_grupos_itens ps1 ' +
        '      inner join prod_similares_grupos pp on pp.cod_grupo_sim = ps1.cod_grupo_sim and pp.cod_empresa = ps1.cod_empresa ' +
        '      inner join produtos p on ps1.grupo_prod = p.grupo_prod and ps1.cod_prod = p.cod_prod and ps1.cod_empresa = p.cod_empresa ' +
        '      where ps1.grupo_prod = ' + inttostr(dataSet.FieldByName('GRUPO_PROD').asinteger) +
        '			 and ps1.cod_prod = ' + quotedstr(dataSet.FieldByName('COD_PROD').asstring) +
        '      and ps1.cod_empresa = ' + vDadosIni.codEmpresa;

      if not vDadosIni.vProdSimilar.vSimilaresEntreSi then
      	buscas.sql.text := buscas.sql.text +
        	' 	 and ps1.principal = ''S'' ';
        
      buscas.sql.text := buscas.sql.text +
        ' 		 and pp.ativo = 1) ' +
        ' and ps.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and not(ps.grupo_prod = ' + inttostr(dataSet.FieldByName('GRUPO_PROD').asinteger) +
        ' and ps.cod_prod = ' + quotedstr(dataSet.FieldByName('COD_PROD').asstring) + ') ';
    end;
    buscas.Open;
    buscas.FieldByName('num_fab_prod').DisplayLabel := 'Número de Fabricação';
    buscas.FieldByName('est_f').DisplayLabel := 'Estoque Físico';
    buscas.FieldByName('estoque').DisplayLabel := 'Estoque Disponível';
    TFloatField(buscas.FieldByName('est_f')).DisplayFormat := '##0.000';
    TFloatField(buscas.FieldByName('estoque')).DisplayFormat := '##0.000';
    buscas.FieldByName('descr_prod').DisplayLabel := 'Descrição';
    buscas.FieldByName('marca_p').DisplayLabel := 'Marca';
    buscas.FieldByName('grupo_prod').DisplayLabel := 'Grupo Produto';
    buscas.FieldByName('cod_prod').DisplayLabel := 'Cód. Produto';
  except
    result := false;
  end;
end;

function TConsulta.TransferirDepositoLoja(qtd: real): boolean;
begin
  try
    if qtd <= 0 then
    begin
      Application.MessageBox('Quantidade inválida.' + chr(13) +
        'Quantidade deve ser maior que zero.', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      result := false;
    end
    else if dataSet.FieldByName('EST_R').value < qtd then
    begin
      Application.MessageBox('Quantidade a ser transferira maior que a quantidade no estoque' +
        chr(13) + 'Quantidade deve ser maior que zero.', 'Informação', MB_OK + MB_ICONINFORMATION
        +
        MB_DEFBUTTON1);
      result := false;
    end
    else if Funcionario.dataSet.FieldByName('COD_VENDEDOR').IsNull then
    begin
      Application.MessageBox('Usuário inválido.', 'Informação', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON1);
      result := false;
    end
    else
    begin
      if ExecutaComandosSqlExec('insert into TRANSF_DEP_EST (COD_SEQ,COD_EMPRESA,GRUPO_PROD,' +
        'COD_PROD,COD_VENDEDOR,QTDE_TRANSF,DATA_TRANSF,ativo) values ' +
        '(' + inttostr(Gencodigo('TRANSF_DEP_EST', DtmConsultas.spIncCodigo, vDadosIni.codEmpresa))
        +
        ',' + vDadosIni.codEmpresa +
        ',' + dataSet.FieldByName('GRUPO_PROD').AsString +
        ',' + quotedstr(dataSet.FieldByName('COD_PROD').AsString) +
        ',' + inttostr(Funcionario.dataSet.FieldByName('COD_VENDEDOR').AsInteger) +
        ',' + vDadosIni.trocaVirgulaPorPonto(vDadosIni.tirapontos(floattostr(qtd), 0)) +
        ',' + quotedstr(FormatDateTime('mm/dd/yyyy', date)) +
        ',1)') then
      begin
        if Edit then
        begin
          dataSet.FieldByName('EST_F').AsFloat := dataSet.FieldByName('EST_F').AsFloat + qtd;
          dataSet.FieldByName('EST_R').AsFloat := dataSet.FieldByName('EST_R').AsFloat - qtd;
          if Post then
            if Apply then
              if CommitaTransacao then
                result := true
              else
                result := false;
        end;
      end;
    end;
  except
    result := false;
  end;
end;

function TConsulta.TransferirDepositoLoja: boolean;
begin
  try
    result := true;
    if Funcionario = nil then
      Funcionario := TConsultaColaborador.create;
    Funcionario.abreColaborador;
    //    buscas.close;
    //    buscas.SQL.Text := 'select * from TRANSF_DEP_EST WHERE' +
    //      ' DATA_TRANSF = :VDATA AND ' +
    //      ' COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and ATIVO=1 ';
    //    buscas.Open;
  except
    result := false;
  end;
end;

{ TConsultaNBM }

constructor TConsultaNBM.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPNbm);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqNbm.Database;
  buscas.Transaction := transacao;
  vtabela := 'NBM';
end;

procedure TConsultaNBM.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_NCM').AsString;
end;

{ TVeiculos }

constructor TConsultaVeiculos.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPVeic);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqVeic.Database;
  buscas.Transaction := transacao;
  vtabela := 'VEICULOS';
  HabilitarBotao := True;
  fNomePacote := 'pkVeiculos';
  fNomeFormulario := 'TFrmCadVeiculos';
end;

procedure TConsultaVeiculos.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('CODIGO').AsString;
  vDadosIni.vPesquisaPlaca := Trim(dataSet.FieldByName('placa').AsString);
  vDadosIni.vPesquisaChassi := Trim(dataSet.FieldByName('chassi').AsString);
end;

{ TConsultaAparelhos }

constructor TConsultaAparelhos.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPApar);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqApar.Database;
  buscas.Transaction := transacao;
  vtabela := 'EQUIPAMENTO';
  HabilitarBotao := True;
  fNomePacote := 'pkEquipamentos';
  fNomeFormulario := 'TFrmCadEquipamentos';
end;

procedure TConsultaAparelhos.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_EQUIP').AsString;
end;

{ TPesquisaProd }

constructor TPesquisaProd.create;
begin
  Buscas := TIBQuery(dtmConsultas.qrPesquisa);
end;

procedure TPesquisaProd.Pegacodigo;
begin
  valorindex := '';
end;

{ TConsultaColaborador }

function TConsultaColaborador.abreColaborador: Boolean;
begin
  result := montaSelect('SELECT * FROM COLABORADOR ' +
  	' WHERE COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND ATIVO = 1');
end;

constructor TConsultaColaborador.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPCol);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqCol.Database;
  buscas.Transaction := transacao;
  vtabela := 'COLABORADOR';
end;

procedure TConsultaColaborador.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_VENDEDOR').AsInteger;
end;

{ TTipoVndPerdida }

function TTipoVndPerdida.abreTipoVndPerdida: Boolean;
begin
  result := montaSelect('SELECT * FROM TIPOVP where cod_empresa =' + vDadosIni.codEmpresa +
    ' and ativo=1');
end;

constructor TTipoVndPerdida.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPTipoVP);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqTipoVP.Database;
  buscas.Transaction := transacao;
  vtabela := 'TIPOVP';
end;

procedure TTipoVndPerdida.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('CODIGO_VP').AsInteger;
end;

{ TVendaPerdida }

function TVendaPerdida.abreVendaPerdida: Boolean;
begin
  result := montaSelect('select * from venda_perdida where cod_empresa =' + vDadosIni.codEmpresa +
    ' and ativo=2');
end;

constructor TVendaPerdida.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPVndPerd);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqVndPerd.Database;
  buscas.Transaction := transacao;
  vtabela := 'VENDA_PERDIDA';
end;

procedure TVendaPerdida.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('CODIGO_VP').AsInteger;
end;

{ TConsultaEstados }

constructor TConsultaEstados.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPEst);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqEst.Database;
  buscas.Transaction := transacao;
  vtabela := 'ESTADOS';
end;

procedure TConsultaEstados.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('CODIGO_UF').AsInteger;
end;

{ TConsultaTipoFaturamento }

constructor TConsultaTipoFaturamento.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPTipoFaturamento);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqTipoFatumento.Database;
  buscas.Transaction := transacao;
  vtabela := 'TIPO_FATURAMENTO';
end;

procedure TConsultaTipoFaturamento.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('CODIGO_FATURAMENTO').AsInteger;
end;

{ TConsultaMarcas }

constructor TConsultaMarcas.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPMarcas);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqMarca.Database;
  buscas.Transaction := transacao;
  vtabela := 'MARCA_PROD';
end;

procedure TConsultaMarcas.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_MARCA').AsInteger;
end;

{ TConsultaDSGS }

constructor TConsultaDSGS.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPDsgs);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqDsgs.Database;
  buscas.Transaction := transacao;
  vtabela := 'G_DSGS';
end;

procedure TConsultaDSGS.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_DSGS').AsString;
end;

{ TConsultaModeloVeiculo }

constructor TConsultaModeloVeiculo.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsModVeic);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqMV.Database;
  buscas.Transaction := transacao;
  vtabela := 'TIPMODELO';
end;

procedure TConsultaModeloVeiculo.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('CODIGO').AsString;
end;

{ TUltimasComprasProd }

function TUltimasComprasProd.abreUltimasCompras(grupoprod: integer; codprod: string): Boolean;
var
  vusgrade: boolean;
begin
  try
    vusgrade := false;
    Buscas := TIBQuery(dtmConsultas.qrbuscas);
    buscas.Close;
    buscas.sql.text := 'select count(*) as total from cod_grade_prod where grupo_prod = ' +
      inttostr(grupoprod) + ' and cod_prod = ' + quotedstr(codprod) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.open;
    if buscas.FieldByName('total').AsInteger > 1 then
    begin
      vusgrade := Application.MessageBox('Visualizar com grade?',
        'Confirmação', MB_YESNO +
        MB_ICONQUESTION) = ID_YES;
    end;
    buscas.close;
    Buscas := TIBQuery(dtmConsultas.qrUltimasComprasProd);
    if vusgrade then
      buscas.sql.text :=
        'select nf4.num_nf,it4.prec_cusm_prod,it4.prec_cus_cnt,it4.vl_multp,it4.prctb_item,' +
        'it4.prec_vnd_prod,it4.prec_vnd_proda,nf4.data_lanc,' +
        'case when grcomp.QTDE is null then it4.quantidade else grcomp.qtde end as quantidade,' +
        'it4.valor_unitario,' +
        'it4.aliq_icm,it4.aliq_ipi,it4.qtdemb,fr.nome_cliente,cond.desc_cond_pag,' +
        'it4.rateio_desconto,it4.pmargfim,it4.pmargfim_a,it4.perc_frete,nf4.da,it4.mnf,nf4.codigo_nop,' +
        'it4.descricao_item||'' ''||coalesce(gra.descricao,'''') as descricao_item ' +
        'from notafiscal nf4 inner join notafiscal_item it4 ' +
        'on nf4.cod_nf=it4.cod_nf and nf4.cod_empresa=it4.cod_empresa ' +
        'left join cod_grade_prod_compra grcomp on ' +
        'it4.grupo_prod = grcomp.grupo_prod and it4.cod_prod = grcomp.cod_prod and it4.cod_empresa = grcomp.cod_empresa and ' +
        'it4.cod_nf = grcomp.num_nota_nfe and it4.nitem = grcomp.cod_forn_nfe ' +
        'left join grade gra on grcomp.cod_grade = gra.cod_grade and grcomp.cod_empresa = gra.cod_empresa ' +
        'inner join clientes fr on nf4.cod_cliente = fr.cod_cliente and nf4.cod_empresa = ' +
        'fr.cod_empresa inner join cond_pag cond on nf4.cod_cond_pag = cond.cod_cond_pag ' +
        'where it4.grupo_prod = ' + inttostr(grupoprod) + ' and it4.cod_prod = ' + quotedstr(codprod)
        +
        ' and nf4.natureza_nf=''E'' and (nf4.status = ''Fechada'') and nf4.tipo_nf = ''P'' ' +
        'and nf4.cod_empresa = ' + vDadosIni.codEmpresa + ' and nf4.ativo=1 ' +
        ' order by nf4.data_lanc'
    else
      buscas.sql.text :=
        'select nf4.num_nf,it4.prec_cusm_prod,it4.prec_cus_cnt,it4.vl_multp,it4.prctb_item,' +
        'it4.prec_vnd_prod,it4.prec_vnd_proda,nf4.data_lanc,it4.quantidade,it4.valor_unitario,' +
        'it4.aliq_icm,it4.aliq_ipi,it4.qtdemb,fr.nome_cliente,cond.desc_cond_pag,' +
        'it4.rateio_desconto,it4.pmargfim,it4.pmargfim_a,it4.perc_frete,nf4.da,it4.mnf,nf4.codigo_nop,it4.descricao_item ' +
        'from notafiscal nf4 inner join notafiscal_item it4 ' +
        'on nf4.cod_nf=it4.cod_nf and nf4.cod_empresa=it4.cod_empresa ' +
        'inner join clientes fr on nf4.cod_cliente = fr.cod_cliente and nf4.cod_empresa = ' +
        'fr.cod_empresa inner join cond_pag cond on nf4.cod_cond_pag = cond.cod_cond_pag ' +
        'where it4.grupo_prod = ' + inttostr(grupoprod) + ' and it4.cod_prod = ' + quotedstr(codprod)
        +
        ' and nf4.natureza_nf=''E'' and (nf4.status = ''Fechada'') and nf4.tipo_nf = ''P'' ' +
        'and nf4.cod_empresa = ' + vDadosIni.codEmpresa + ' and nf4.ativo=1 ' +
        ' order by nf4.data_lanc';

    {    'select it.num_nota_nfe,it.prec_cus_cnt,it.pr_cusc_prod,it.vl_multp,' +
          ' it.prec_cus_r,it.prctb_item_nfe,it.prec_vnd_prod,nt.data_lanc_nfe,' +
          ' it.quant_item_nfe,it.vlun_item_nfe,it.alicm_item_nfe,' +
          ' it.ipi_item_nfe,it.qtdemb,fr.nome,cond.desc_cond_pag,' +
          ' it.vlr_desc,it.pmargfim,it.perc_frete_nfe,nt.da,it.mnf, nt.CODIGO_NOP' +
          ' from item_nf_entrada it,fornecedor fr,nf_entrada nt,cond_pag cond ' +
          ' where it.grupo_prod = ' + inttostr(grupoprod) +
          ' and it.cod_prod = ' + quotedstr(codprod) +
          ' and it.num_nota_nfe = nt.num_nota_nfe and it.cod_forn_nfe = nt.cod_forn_nfe ' +
          ' and nt.cod_forn_nfe = fr.codigo_f and  nt.cod_cond_pag = cond.cod_cond_pag' +
          ' and nt.COD_EMPRESA = ' + vDadosIni.codEmpresa + ' and nt.ATIVO=1 ' +
          ' and nt.COD_EMPRESA = FR.COD_EMPRESA and IT.COD_EMPRESA = NT.COD_EMPRESA' +
          ' order by data_lanc_nfe';}
    buscas.Open;
    buscas.Last;
  except
    result := false;
  end;
end;

constructor TUltimasComprasProd.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  Buscas := TIBQuery(dtmConsultas.qrUltimasComprasProd);
end;

{ TUltimoBalancoProd }

function TUltimoBalancoProd.abreUltimoBalancoProd(grupoprod: integer;
  codprod: string): Boolean;
begin
  try
    result := true;
    buscas.Close;
    buscas.sql.text := ' select GRUPO_PROD, COD_PROD, NUM_FAB_PROD, QUANT_EST,' +
      ' DATA_CADASTRO, DATA_CONFIRM, LOCACAO_PROD, LOCACAO_PROD_1, QUANT_TRANS, QUANT_REQ, TIP_BAL, QTD_DIF_BAL from estoque_ini ' +
      ' where grupo_prod = ' + inttostr(grupoprod) +
      ' and cod_prod = ' + quotedstr(codprod) +
      ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and (not data_confirm is null)' +
      ' and ativo = 1' +
      ' order by data_confirm ';
    buscas.open;
  except
    result := false;
  end;
end;

constructor TUltimoBalancoProd.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  Buscas := TIBQuery(dtmConsultas.qrUltimoBalancoProd);

  vUltimoBalancoProdGrade := TUltimoBalancoProdGrade.Create;
end;

procedure TUltimoBalancoProd.datasetAfterScrollUltimoBalancoProdGrade(
  DataSet: TDataSet);
begin
	if DataSet.IsEmpty then
  begin
  	vUltimoBalancoProdGrade.abreUltimoBalancoGrade(
  		0,
	    '000000',
      Date,
      Date);
    exit;
  end;

	vUltimoBalancoProdGrade.abreUltimoBalancoGrade(
  	DataSet.FieldByName('grupo_prod').AsInteger,
    DataSet.FieldByName('cod_prod').AsString,
    DataSet.FieldByName('data_cadastro').AsDateTime,
    DataSet.FieldByName('data_confirm').AsDateTime);
end;

destructor TUltimoBalancoProd.destroy;
begin
  if Assigned(vUltimoBalancoProdGrade) then
	  FreeAndNil(vUltimoBalancoProdGrade);
  inherited;
end;

{ TConsultaClienteConv }

constructor TConsultaClienteConv.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPesqClConv);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqClConv.Database;
  buscas.Transaction := transacao;
  vtabela := 'CLIENTES';
end;

procedure TConsultaClienteConv.Pegacodigo;
begin
  if not dataSet.IsEmpty then
    valorindex := dataSet.FieldByName('cod_cliente').AsInteger;
end;

{ TConsultaCidadesIBGE }

constructor TConsultaCidadesIBGE.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPCidIBGE);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqCidIBGE.Database;
  buscas.Transaction := transacao;
  vtabela := 'CIDADES_IBGE';
end;

procedure TConsultaCidadesIBGE.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('CODIGO_MUN_IBGE').AsInteger;
end;

{ TConsultaKits }

constructor TConsultaKits.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPKits);
  dataSet.AfterScroll := KitAfterScroll;
  transacao := TIBTransaction(dtmConsultas.transConsulta);
  Buscas := TIBQuery(dtmConsultas.qrBuscas);
  if PesquisaKit = nil then
    PesquisaKit := TPesquisaProd.create;
  vtabela := 'KITS_PROD';
end;

procedure TConsultaKits.KitAfterScroll(DataSet: TDataSet);
begin
  PesquisaKit.buscas.Close;
  PesquisaKit.buscas.sql.text := 'SELECT SUM(K.QUANT_PROD_KIT*PR.PREC_TAB_PROD) as valorkit ' +
    ' FROM KITS_PROD_KITS K, PRODUTOS PR ' +
    ' WHERE K.CODIGO_KIT = ' + inttostr(dataset.FieldByName('CODIGO_KIT').asinteger) +
    ' AND K.GRUPO_PROD = PR.GRUPO_PROD AND K.COD_PROD =PR.COD_PROD' +
    ' and k.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and k.cod_empresa = pr.cod_empresa' +
    ' and pr.ativo=1';
  PesquisaKit.buscas.open;
  PanelValorKit.Caption := 'R$ ' + format('%n',
    [PesquisaKit.buscas.FieldByName('valorkit').asfloat]);
end;

procedure TConsultaKits.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('CODIGO_KIT').AsInteger;
end;

{ TConsultaTipoServ }

constructor TConsultaTipoServ.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPTipoServ);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqTipoServ.Database;
  buscas.Transaction := transacao;
  vtabela := 'TIPO_SERVICO';
end;

procedure TConsultaTipoServ.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_SERVICO').AsInteger;
end;

{ TConsultaPerfilProd }

constructor TConsultaPerfilProd.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPerfilP);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqPerfilP.Database;
  buscas.Transaction := transacao;
  vtabela := 'PERFIL_PRODUTOS';
end;

procedure TConsultaPerfilProd.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_PERFIL').AsInteger;
end;

{ TConsultaNaturezaOperacao }

constructor TConsultaNaturezaOperacao.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPNatOp);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqNtOp.Database;
  buscas.Transaction := transacao;
  vtabela := 'NAT_OP';
end;

procedure TConsultaNaturezaOperacao.Pegacodigo;
begin
  valorindex := Trunc(dataSet.FieldByName('CODIGO_NOP').AsFloat);
end;

{ TConsultaNaturezaOperacaoDescricao }

constructor TConsultaNaturezaOperacaoDescricao.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsNtOpD);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqNtOp.Database;
  buscas.Transaction := transacao;
  vtabela := 'NAT_OP_DESCRICAO';
end;

procedure TConsultaNaturezaOperacaoDescricao.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('DESCRICAO_NOP').AsString;
end;

{ TConsultaEspecieVeiculo }

constructor TConsultaEspecieVeiculo.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsEspVeic);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrEspVeic.Database;
  buscas.Transaction := transacao;
  vtabela := 'ESPECIE_VEICULO';
end;

procedure TConsultaEspecieVeiculo.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('CODIGO_ESP').AsInteger;
end;

{ TConsultaContador }

constructor TConsultaContador.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsContador);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrContador.Database;
  buscas.Transaction := transacao;
  vtabela := 'CONTADOR';
end;

procedure TConsultaContador.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('cod_contador').AsInteger;
end;

{ TConsultaCentroDeCustos }

constructor TConsultaCentroDeCustos.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsCCusto);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrCCusto.Database;
  buscas.Transaction := transacao;
  vtabela := 'CENTRO_CUSTOS';
end;

procedure TConsultaCentroDeCustos.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_CCUS').AsInteger;
end;

{ TConsultaPlanoContasContabil }

constructor TConsultaPlanoContasContabil.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPlContasC);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPlContasC.Database;
  buscas.Transaction := transacao;
  vtabela := 'P_CONTAS_CONTABIL';
end;

procedure TConsultaPlanoContasContabil.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_CTA').AsString;
end;

{ TConsultaCodigo_Banco }

constructor TConsultaCodigo_Banco.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsBanco);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrBanco.Database;
  buscas.Transaction := transacao;
  vtabela := 'CODIGO_BANCO';
end;

procedure TConsultaCodigo_Banco.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_BANCO').AsInteger;
end;

{ TConsultaCombustivel }

constructor TConsultaCombustivel.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsCombustivel);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrCombustivel.Database;
  buscas.Transaction := transacao;
  vtabela := 'TP_COMB_RENAVAM';
end;

procedure TConsultaCombustivel.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('CODIGO_TPCOMB').AsInteger;
end;

{ TConsultaCor }

constructor TConsultaCor.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsCor);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrCor.Database;
  buscas.Transaction := transacao;
  vtabela := 'CODIGO_CORFAB';
end;

procedure TConsultaCor.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_COR').AsInteger;
end;

{ TPesquisaGrade }

constructor TPesquisaGradeProd.create;
begin
  Buscas := TIBQuery(dtmConsultas.qrGradeProd);
  dataSet := TClientDataSet(dtmConsultas.cdsGradeProd);
end;

procedure TPesquisaGradeProd._PesquisaGrade(grupo, codProd: string);
var
  i: integer;
begin
  buscas.Close;
  buscas.SQL.Text := 'select first 1 cgp.cod_grade from cod_grade_prod cgp ' +
    ' inner join grade g on g.cod_grade = cgp.cod_grade and g.cod_empresa = cgp.cod_empresa' +
    ' where cgp.grupo_prod = ' + grupo +
    ' and cgp.cod_prod = ' + quotedstr(trim(codprod)) +
    ' and cgp.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.open;

  if (not buscas.IsEmpty) then
  begin
    dataSet.Close;
    dataSet.CommandText := 'select g.cod_grade,g.descricao,g.descricao1,' +
      ' (cgp.qtde - coalesce((select sum(pp.quant_ped_item) from  pedvenda_prod pp ' +
      ' inner join pedvenda v on v.nped=pp.nped and v.cod_empresa=pp.cod_empresa and pp.tipo=v.tipo' +
      ' where pp.grupo_prod = cgp.grupo_prod ' +
      ' and pp.cod_prod = cgp.cod_prod ' +
      ' and pp.cod_grade=cgp.cod_grade ' +
      ' and pp.cod_empresa =cgp.cod_empresa ' +
      ' and coalesce(v.status_ped,'''')='''' '+
      ' and coalesce(pp.status,'''')='''' '+//(pp.status<>''CANCELADO'' or pp.status is null)
      ' and v.tipo<>''ORC'' ),0) - ' +
      ' coalesce(' +
      ' (select sum(coalesce(c.quant,0)) from controle_almoxarifado c where c.grupo_prod = cgp.grupo_prod' +
      ' and c.cod_prod = cgp.cod_prod and c.cod_empresa = cgp.cod_empresa and c.cod_grade = cgp.cod_grade)' +
      ' ,0)' +
      ' ) as qtd_item_disponivel, ' +
      ' cgp.qtde, ' +
      '(coalesce((select sum(pp.quant_ped_item) from  pedvenda_prod pp ' +
      ' inner join pedvenda v on v.nped=pp.nped and v.cod_empresa=pp.cod_empresa and pp.tipo=v.tipo' +
      ' where pp.grupo_prod = cgp.grupo_prod ' +
      ' and pp.cod_prod = cgp.cod_prod ' +
      ' and pp.cod_grade=cgp.cod_grade ' +
      ' and pp.cod_empresa =cgp.cod_empresa ' +
      ' and coalesce(v.status_ped,'''')='''' '+
      ' and coalesce(pp.status,'''')='''' '+ //(pp.status<>''CANCELADO'' or pp.status is null)
      ' and v.tipo<>''ORC'' ),0) +' +
      ' coalesce(' +
      ' (select sum(coalesce(c.quant,0)) from controle_almoxarifado c where c.grupo_prod = cgp.grupo_prod' +
      ' and c.cod_prod = cgp.cod_prod and c.cod_empresa = cgp.cod_empresa and c.cod_grade = cgp.cod_grade)' +
      ' ,0)' +
      ') as qtd_item_pedAberto ' +
      ' from grade g ' +
      ' inner join cod_grade_prod cgp ' +
      ' on g.cod_grade=cgp.cod_grade and g.cod_empresa =cgp.cod_empresa ' +
      ' where cgp.grupo_prod = ' + grupo +
      ' and cgp.cod_prod = ' + quotedstr(trim(codProd)) +
      ' and cgp.cod_empresa =' + vDadosIni.codEmpresa +
      ' order by g.cod_grade';
    dataSet.open;

//    dataset.FieldByName('cod_grade').DisplayLabel := 'Código da grade';
//    dataset.FieldByName('descricao').DisplayLabel := 'Descrição';
//    dataset.FieldByName('descricao1').DisplayLabel := 'Descrição 2';
//    dataset.FieldByName('qtd_item_disponivel').DisplayLabel := 'Quantidade disponível';
//    dataset.fieldByName('qtde').DisplayLabel := 'Quantidade Total';
//    dataset.FieldByName('qtd_item_pedAberto').DisplayLabel := 'Quantidade em aberto';

//    _PanelExibir.Height := 109;
//    _FormLocProdutos.Height:= 600;
  end
  else
  begin
  	dataSet.Close;
//    _FormLocProdutos.Height:= 600;
  end;
//  _GridProdutos.Visible:=false;
//  _GridProdutos.Visible:=true;

end;

{ TPesquisaGradeProdOutrasEmpresas }

constructor TPesquisaGradeProdOutrasEmpresas.create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);

  Buscas := TIBQuery(dtmConsultas.qrGradeProdOutEmp);
  dataSet := TClientDataSet(dtmConsultas.cdsGradeProdOutEmp);

end;

procedure TPesquisaGradeProdOutrasEmpresas._PesquisaGrade(grupo, codProd,
  codigoEmpresa, NomeEmpresa: string);
begin
  buscas.Close;
  buscas.SQL.Text := 'select first 1 cgp.cod_grade from cod_grade_prod cgp' +
    ' inner join grade g on g.cod_grade = cgp.cod_grade and g.cod_empresa = cgp.cod_empresa' +
    ' where cgp.grupo_prod = ' + grupo +
    ' and cgp.cod_prod = ' + quotedstr(trim(codprod)) +
    ' and cgp.cod_empresa = ' + codigoEmpresa;
  buscas.open;

  if (not buscas.IsEmpty) then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select g.cod_grade,g.descricao,g.descricao1,' +
      ' (cgp.qtde - coalesce((select sum(pp.quant_ped_item) from  pedvenda_prod pp ' +
      ' inner join pedvenda v on v.nped=pp.nped and v.cod_empresa=pp.cod_empresa and pp.tipo=v.tipo' +
      ' where pp.grupo_prod = cgp.grupo_prod ' +
      ' and pp.cod_prod = cgp.cod_prod ' +
      ' and pp.cod_grade=cgp.cod_grade ' +
      ' and pp.cod_empresa =cgp.cod_empresa ' +
      ' and coalesce(v.status_ped,'''')='''' '+
      ' and coalesce(pp.status,'''')='''' '+//(pp.status<>''CANCELADO'' or pp.status is null)
      ' and v.tipo<>''ORC'' ),0) - ' +
      ' coalesce(' +
      ' (select sum(coalesce(c.quant,0)) from controle_almoxarifado c where c.grupo_prod = cgp.grupo_prod' +
      ' and c.cod_prod = cgp.cod_prod and c.cod_empresa = cgp.cod_empresa and c.cod_grade = cgp.cod_grade)' +
      ' ,0)' +
      ' ) as qtd_item_disponivel, ' +
      ' cgp.qtde, ' +
      '(coalesce((select sum(pp.quant_ped_item) from  pedvenda_prod pp ' +
      ' inner join pedvenda v on v.nped=pp.nped and v.cod_empresa=pp.cod_empresa and pp.tipo=v.tipo' +
      ' where pp.grupo_prod = cgp.grupo_prod ' +
      ' and pp.cod_prod = cgp.cod_prod ' +
      ' and pp.cod_grade=cgp.cod_grade ' +
      ' and pp.cod_empresa =cgp.cod_empresa ' +
      ' and coalesce(v.status_ped,'''')='''' '+
      ' and coalesce(pp.status,'''')='''' '+ //(pp.status<>''CANCELADO'' or pp.status is null)
      ' and v.tipo<>''ORC'' ),0) +' +
      ' coalesce(' +
      ' (select sum(coalesce(c.quant,0)) from controle_almoxarifado c where c.grupo_prod = cgp.grupo_prod' +
      ' and c.cod_prod = cgp.cod_prod and c.cod_empresa = cgp.cod_empresa and c.cod_grade = cgp.cod_grade)' +
      ' ,0)' +
      ') as qtd_item_pedAberto ' +
      ' from grade g inner join cod_grade_prod cgp ' +
      ' on g.cod_grade=cgp.cod_grade and g.cod_empresa =cgp.cod_empresa ' +
      ' where cgp.grupo_prod = ' + grupo +
      ' and cgp.cod_prod = ' + quotedstr(trim(codProd)) +
      ' and cgp.cod_empresa =' + codigoEmpresa +
      ' order by g.cod_grade';
    buscas.open;

    dataset.FieldByName('cod_grade').DisplayLabel := 'Código da grade';
    dataset.FieldByName('descricao').DisplayLabel := 'Descrição';
    dataset.FieldByName('descricao1').DisplayLabel := 'Descrição 2';
    dataset.FieldByName('qtd_item_disponivel').DisplayLabel := 'Quantidade disponível';
    dataset.FieldByName('qtde').DisplayLabel := 'Quantidade Total';
    dataset.FieldByName('qtd_item_pedAberto').DisplayLabel := 'Quantidade em aberto';

    Application.CreateForm(Tfrmexibirgrades, frmExibirGrades);
    frmExibirGrades.CodigoEmpresa := CodigoEmpresa;
    frmExibirGrades.NomeEmpresa := NomeEmpresa;
    frmExibirGrades.ShowModal;

  end
  else
    ShowMessage('O produto não possui grade na empresa ' + NomeEmpresa + ' - Código : ' +
      CodigoEmpresa);
end;

{ TConsultaCEP }

constructor TConsultaCEP.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsCEP);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrCEP.Database;
  buscas.Transaction := transacao;
  vtabela := 'CEP';
end;

procedure TConsultaCEP.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_CORREIOS').Value;
end;

{ TPedidoVendaAberto }

constructor TPedidoVendaAberto.create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);

  Buscas := TIBQuery(dtmConsultas.qrBuscasProd);

  Buscas2 := TIBQuery.Create(nil);
  Buscas2.Database := buscas.Database;
  Buscas2.Transaction := buscas.Transaction;
end;

destructor TPedidoVendaAberto.Destroy;
begin
  buscas2.Free;
  inherited;
end;

procedure TPedidoVendaAberto._ExibeItensPedidoAberto(Grupo_Prod, Cod_Prod: string);
var
  vSqlAd:string;
begin
  vSqlAd := '';

//  if vDadosIni.vEmp.vAlmox = 'S2' then
  begin
    vSqlAd := ' union all' +
    ' select ''EST. FECHADO'' , coalesce(c.quant,0),' +
    ' c.cod_pedido, c.data_pedido, c.filtro, c.sit_atd, c.tipv, c.descr_prod, '''', grd.descricao, c.nitem, c.cod_vendedor, col.nome_vendedor ' +
    ' from controle_almoxarifado c ' +
    ' left join colaborador col on c.cod_vendedor = col.cod_vendedor and c.cod_empresa = col.cod_empresa ' +
    ' left join grade grd on c.cod_grade = grd.cod_grade and c.cod_empresa = grd.cod_empresa' +
    ' where c.grupo_prod = ' + Grupo_Prod + ' and c.cod_prod = ' + quotedstr(trim(Cod_Prod)) + ' and c.cod_empresa =' + vDadosIni.codEmpresa;
  end;

  buscas.Close;
  buscas.SQL.Text := ' SELECT case ' +
    ' when (p.tipo=''REQ'') then ''REQUISIÇÃO'' ' +
    ' else ''ORDEM DE SERVIÇO'' ' +
    ' end as TipoVenda,pp.quant_ped_item,pp.nped,p.data_ped,c.nome_cliente, '''' sit_atd, p.tipv, ' +
    ' pp.descr_prod_ped, p.tipo_os,grd.descricao,pp.nitem,p.cod_vendedor,col.nome_vendedor ' +
    ' from pedvenda p ' +
    ' INNER JOIN pedvenda_prod pp on p.nped = pp.nped and p.cod_empresa = pp.cod_empresa and p.tipo = pp.tipo ' +
    ' INNER JOIN clientes c on p.cod_empresa=c.cod_empresa and p.cod_cliente=c.cod_cliente ' +
    ' left join colaborador col on p.cod_vendedor = col.cod_vendedor and p.cod_empresa = col.cod_empresa ' +
    ' left join grade grd on pp.cod_grade = grd.cod_grade and pp.cod_empresa = grd.cod_empresa ' +
    ' where p.data_fech is null and p.ativo = 1 and ((p.tipo = ''OS'') or (p.tipo=''REQ'')) ' +
    ' and p.cod_empresa= ' + vDadosIni.codEmpresa +
    ' and pp.grupo_prod = ' + Grupo_Prod +
    ' and pp.cod_prod = ' + quotedstr(trim(Cod_Prod)) +
    ' and ((pp.status is null) or (pp.status <> ''CANCELADO'')) ' + vSqlAd +
    ' union all' +
    ' select ''PRODUÇÃO'', (coalesce(pi.quantidade_utilizada,0) + coalesce(pi.quantidade_perda,0)),' +
    ' pd.cod_producao, pd.data, c.nome_cliente, '''', '''', pi.descr_prod,'''','''' , pi.seq nitem, '''', ''''   from producao pd' +
    ' inner join producao_item_indice pi on pi.cod_producao = pd.cod_producao and pi.cod_empresa = pd.cod_empresa' +
    ' left join clientes c on c.cod_cliente = pd.cod_cliente and c.cod_empresa = pd.cod_empresa' +
    ' where pd.data_fechamento is null and pd.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and pi.grupo_prod = ' + Grupo_Prod + ' and pi.cod_prod = ' + quotedstr(trim(Cod_Prod)) +
    ' order by 1,4';

  buscas.Open;
  buscas.FieldByName('TipoVenda').DisplayLabel := 'Tipo do Pedido';
  buscas.FieldByName('quant_ped_item').DisplayLabel := 'Qtde Pendências';
  buscas.FieldByName('nped').DisplayLabel := 'Número de Pedido';
  buscas.FieldByName('data_ped').DisplayLabel := 'Data do Pedido';
  buscas.FieldByName('nome_cliente').DisplayLabel := 'Nome do Cliente';
  buscas.FieldByName('tipv').DisplayLabel := 'Tipo de Venda';
  buscas.FieldByName('sit_atd').DisplayLabel := 'Situacao';
  buscas.FieldByName('descr_prod_ped').DisplayLabel := 'Descrição do Item';
  buscas.FieldByName('Tipo_os').DisplayLabel := 'Tipo de OS';
  buscas.FieldByName('descricao').DisplayLabel := 'Grade do produto';
  buscas.FieldByName('nitem').DisplayLabel := 'Nº Item';
  buscas.FieldByName('cod_vendedor').DisplayLabel := 'Cod. Vendedor';
  buscas.FieldByName('nome_vendedor').DisplayLabel := 'Vendedor';
end;

procedure TPedidoVendaAberto._ExibeReservas(Grupo_Prod, Cod_Prod: string);
begin
  buscas2.Close;
  buscas2.SQL.Text := ' select case when (res.data_ver is null) then ''PENDENTE'' else ''DISPONÍVEL'' end TipoVenda, ' +
   ' res.quant, res.codigo, res.data, ''NT'' sit_atd, res.tipv, res.descr_prod, grd.descricao, res.nitem, ' +
   ' res.cod_vendedor, col.nome_vendedor from reserva_almoxarifado_itens res ' +
   ' left join grade grd on res.cod_grade = grd.cod_grade and res.cod_empresa = grd.cod_empresa ' +
   ' left join colaborador col on res.cod_vendedor = col.cod_vendedor and res.cod_empresa = col.cod_empresa ' +
   ' where res.cod_empresa = ' + vDadosIni.codEmpresa + ' and res.grupo_prod = ' + Grupo_Prod + ' and res.cod_prod = ' + quotedstr(trim(Cod_Prod)) +
   ' order by 1, 4 ';
  buscas2.Open;
  buscas2.FieldByName('TipoVenda').DisplayLabel := 'Situação';
  buscas2.FieldByName('quant').DisplayLabel := 'Qtde Pendências';
  buscas2.FieldByName('codigo').DisplayLabel := 'Número da Reserva';
  buscas2.FieldByName('data').DisplayLabel := 'Data da Reserva';
  buscas2.FieldByName('sit_atd').DisplayLabel := 'Situacao';
  buscas2.FieldByName('tipv').DisplayLabel := 'Tipo de Venda';
  buscas2.FieldByName('descr_prod').DisplayLabel := 'Descrição do Item';
  buscas2.FieldByName('descricao').DisplayLabel := 'Grade do produto';
  buscas2.FieldByName('nitem').DisplayLabel := 'Nº Item';
  buscas2.FieldByName('cod_vendedor').DisplayLabel := 'Cod. Vendedor';
  buscas2.FieldByName('nome_vendedor').DisplayLabel := 'Vendedor';
end;

{ TConsultaAcaoJudicialSPED }

constructor TConsultaAcaoJudicialSPED.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsAcaoJud);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrAcaoJud.Database;
  buscas.Transaction := transacao;
  vtabela := 'SPED_PROC_REF_ACAO_JUDICIAL';
end;

procedure TConsultaAcaoJudicialSPED.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_ACAO_JUDICIAL').AsInteger;
end;

{ TConsultaProcessoAdministrativoSPED }

constructor TConsultaProcessoAdministrativoSPED.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsProcAdm);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrProcAdm.Database;
  buscas.Transaction := transacao;
  vtabela := 'SPED_PROC_REF_ADMINISTRATIVO';
end;

procedure TConsultaProcessoAdministrativoSPED.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_ADM').AsInteger;
end;

{ TConsultaNotaFiscal }

constructor TConsultaNotaFiscal.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsNf);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrNf.Database;
  buscas.Transaction := transacao;
  vtabela := 'NOTAFISCAL';
end;

procedure TConsultaNotaFiscal.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_NF').AsInteger;
end;

{ TConsultaInfComplementar }

constructor TConsultaInfComplementar.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsInfCompl);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrInfCompl.Database;
  buscas.Transaction := transacao;
  vtabela := 'SPED_INFORMACAO_COMPLEMENTAR';
  HabilitarBotao := True;
  fNomePacote := 'pkSPED';
  fNomeFormulario := 'TfrmCadInformacaoCompl';
end;

procedure TConsultaInfComplementar.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_INF').AsInteger;
end;

{ TConsultaLocalidade }

constructor TConsultaLocalidade.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsLocalidade);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrLocalidade.Database;
  buscas.Transaction := transacao;
  vtabela := 'LOCALIDADE';
  HabilitarBotao := True;
  fNomePacote := 'pkOrdemCarregamento';
  fNomeFormulario := 'TfrmCadLocalidade';
end;

procedure TConsultaLocalidade.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_LOCALIDADE').AsInteger;
end;

{ TPromocaoTab }

constructor TPromocaoTab.create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  Buscas := TIBQuery(dtmConsultas.qrPromocaoTab);
end;

procedure TPromocaoTab._abrePromocaoTab(Grupo_Prod, Cod_Prod: string);
var
	I: Integer;
begin
  buscas.Close;
  buscas.SQL.Text := 'select p.ordem, tp.tipo, tp.descr_tipo, ' +
     ' case ' +
     '	 when coalesce(l.cod_localidade, 0) > 0 then ' +
     '		 l.localidade ' +
     '   when coalesce(st.cod_setor, 0) > 0 then ' +
     '		 st.setor ' +
     '   when coalesce(cd.cod_cidade, 0) > 0 then ' +
     '		 cd.nome_cidade ' +
     '   else ' +
     '		 p.descr_promocao ' +
     ' end descricao, ' +
     ' case ' +
     '   when (coalesce(pp.valor_promocao, 0) > 0) then ' +
     '     coalesce(pp.valor_promocao, 0) ' +
     '   when (coalesce(pp.porcentagem, 0) <> 0) then ' +
     '	 	 case ' +
     '			 when (tp.tipo = ''P'') then ' +
     '     	   ((coalesce(pr.prec_tab_prod, 0) / 100) * (100 - abs(coalesce(pp.porcentagem, 0)))) ' +
     '			 when (coalesce(pp.porcentagem, 0) > 0) then ' +
     '     		 ((coalesce(pr.prec_tab_prod, 0) / 100) * (100 + abs(coalesce(pp.porcentagem, 0)))) ' +
     '			 else ' +
     '     		 ((coalesce(pr.prec_tab_prod, 0) / 100) * (100 - abs(coalesce(pp.porcentagem, 0)))) ' +
     '		 end ' +
     '   else ' +
     '     0 ' +
     ' end valor_promocao, ' +
     ' case ' +
     '   when (coalesce(pp.porcentagem, 0) <> 0) then ' +
     '     case ' +
     '			 when (tp.tipo = ''P'') then ' +
     '         (0 - coalesce(pp.porcentagem, 0)) ' +
     '       else ' +
     '         coalesce(pp.porcentagem, 0) ' +
     '     end ' +
     '   when (pp.proporcao_tabela > 1) and (coalesce(p.recalc_preco, ''N'') = ''S'') then ' +
     '     abs(1 - abs(pp.proporcao_tabela)) * 100 ' +
     '   when (pp.proporcao_tabela > 0) and (coalesce(p.recalc_preco, ''N'') = ''S'') then ' +
     '     (0 - abs(1 - abs(pp.proporcao_tabela)) * 100) ' +
     '   when (coalesce(pp.valor_promocao, 0) > 0) and (coalesce(pr.prec_tab_prod, 0) > 0) and (coalesce(pr.prec_tab_prod, 0) > coalesce(pp.valor_promocao, 0)) then ' +
     '     (0 - abs(((coalesce(pp.valor_promocao, 0) / coalesce(pr.prec_tab_prod, 0)) - 1) * 100)) ' +
     '   when (coalesce(pp.valor_promocao, 0) > 0) and (coalesce(pr.prec_tab_prod, 0) > 0) and (coalesce(pp.valor_promocao, 0) > coalesce(pr.prec_tab_prod, 0)) then ' +
     '     abs(((coalesce(pp.valor_promocao, 0) / coalesce(pr.prec_tab_prod, 0)) - 1) * 100) ' +
     '   else ' +
     '     0 ' +
     ' end porcentagem, ' +
     ' coalesce(pp.max_desc, 0) max_desc ' +
     ' from promocao_produto pp ' +
     ' inner join tipo_preco tp on tp.cod_tppreco = pp.cod_tppreco and tp.cod_empresa = pp.cod_empresa ' +
     ' inner join produtos pr on pr.grupo_prod = pp.grupo_prod and pr.cod_prod = pp.cod_prod and pr.cod_empresa = pp.cod_empresa ' +
     ' left join localidade l on l.cod_localidade = pp.cod_localidade and l.cod_empresa = pp.cod_empresa ' +
     ' left join setor st on st.cod_setor = pp.cod_setor and st.cod_empresa = pp.cod_empresa ' +
     ' left join cidades cd on cd.cod_cidade = pp.cod_cidade ' +
     ' inner join promocao p on p.cod_promocao = pp.cod_promocao and p.cod_tppreco = pp.cod_tppreco and p.cod_empresa = pp.cod_empresa ' +
     ' where pr.ativo = 1 and pp.cod_empresa = ' + vDadosIni.codEmpresa +
     ' and pr.grupo_prod = ' + Grupo_Prod + ' and pr.cod_prod = ' + QuotedStr(Cod_Prod) +
     ' and (((tp.tipo = ''P'') and (pp.data_ini <= ' + vDadosIni.FusoSqlDateTime + ' and pp.data_fim >= ' + vDadosIni.FusoSqlDateTime + ')) or (tp.tipo = ''T'')) ' +
     ' union ' +
     ' select 5 ordem, ''Z'' tipo, ''QUANTIDADE'' descr_tipo, ' +
     ' (''QUANTIDADE MAIOR OU IGUAL ''||  replace(cast(pq.quant as numeric(8,3)), ''.'', '','') ) descricao, ' +
     ' case ' +
     '   when (coalesce(pq.preco_venda, 0) > 0) then ' +
     '     coalesce(pq.preco_venda, 0) ' +
     '   when (coalesce(pq.porcentagem, 0) <> 0) then ' +
     '	 	  case ' +
     '				when (coalesce(pq.porcentagem, 0) > 0) then ' +
     '     			((coalesce(pr.prec_tab_prod, 0) / 100) * (100 + abs(coalesce(pq.porcentagem, 0)))) ' +
     '				else ' +
     '     			((coalesce(pr.prec_tab_prod, 0) / 100) * (100 - abs(coalesce(pq.porcentagem, 0)))) ' +
     '			end ' +
     '   else ' +
     '     0 ' +
     ' end valor_promocao, ' +
     ' case ' +
     '   when (coalesce(pq.porcentagem, 0) <> 0) then ' +
     '     coalesce(pq.porcentagem, 0) ' +     
     '   when (pq.proporcao_tabela > 1) and (coalesce(cs.value1_f, 0) > 0) then ' +
     '       abs(1 - abs(pq.proporcao_tabela)) * 100 ' +
     '   when (pq.proporcao_tabela > 0) and (coalesce(cs.value1_f, 0) > 0) then ' +
     '       (0 - abs(1 - abs(pq.proporcao_tabela)) * 100) ' +
     '   when (coalesce(pq.preco_venda, 0) > 0) and (coalesce(pr.prec_tab_prod, 0) > 0) and (coalesce(pr.prec_tab_prod, 0) > coalesce(pq.preco_venda, 0)) then ' +
     '       (0 - abs(((coalesce(pq.preco_venda, 0) / coalesce(pr.prec_tab_prod, 0)) - 1) * 100)) ' +
     '   when (coalesce(pq.preco_venda, 0) > 0) and (coalesce(pr.prec_tab_prod, 0) > 0) and (coalesce(pq.preco_venda, 0) > coalesce(pr.prec_tab_prod, 0)) then ' +
     '       abs(((coalesce(pq.preco_venda, 0) / coalesce(pr.prec_tab_prod, 0)) - 1) * 100) ' +
     '   else ' +
     '       0 ' +
     ' end porcentagem, ' +
     ' coalesce(pq.max_desc, 0) max_desc ' +
     ' from preco_produtos_qtde pq ' +
     ' left join config_sistema cs on cs.chave = ''prod_cad_recalcular_preco_por_quantidade'' and cs.cod_empresa = pq.cod_empresa ' +
     ' inner join produtos pr on pr.grupo_prod = pq.grupo_prod and pr.cod_prod = pq.cod_prod and pr.cod_empresa = pq.cod_empresa ' +
     ' where pr.ativo = 1 and pr.cod_empresa = ' + vDadosIni.codEmpresa +
     ' and pr.grupo_prod = ' + Grupo_Prod + ' and pr.cod_prod = ' + QuotedStr(Cod_Prod) +
     ' order by 2, 1 ';
  buscas.Open;

  for I := 0 to buscas.Fields.Count - 1 do
  begin
  	if UpperCase(trim(buscas.Fields[i].FieldName)) = 'ORDEM' then
      buscas.Fields[i].Visible := false
  	else if buscas.Fields[i].DataType = ftFloat then
    begin
     if (UpperCase(trim(buscas.Fields[i].FieldName)) = 'VALOR_PROMOCAO')
     	or (UpperCase(trim(buscas.Fields[i].FieldName)) = 'PORCENTAGEM')
      or (UpperCase(trim(buscas.Fields[i].FieldName)) = 'MAX_DESC') then
       TFloatField(buscas.Fields[i]).DisplayFormat := '##0.00';
    end;
  end;
end;

{ TConsultaVendedor }

constructor TConsultaVendedor.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPesqVendedor);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqVendedor.Database;
  buscas.Transaction := transacao;
  vtabela := 'COLABORADOR';
  HabilitarBotao := True;
  fNomePacote := 'pkColaborador';
  fNomeFormulario := 'TFrmCadColaborador';
end;

procedure TConsultaVendedor.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('cod_vendedor').AsInteger;
end;

{ TConsultaPlanoContas }

constructor TConsultaPlanoContas.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPlanoContas);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPlanoContas.Database;
  buscas.Transaction := transacao;
  vtabela := 'P_CONTAS';
//  HabilitarBotao := True;
//  fNomePacote := 'pkColaborador';
//  fNomeFormulario := 'TFrmCadColaborador';
end;

procedure TConsultaPlanoContas.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('N_CONTA_PLC').AsFloat;
end;

{ TConsultaControle }

constructor TConsultaControle.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsControles);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrControles.Database;
  buscas.Transaction := transacao;
  vtabela := 'CONTROLES';
end;

procedure TConsultaControle.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('codigo_ctrl').AsFloat;
end;

{ TConsultaGrade }

constructor TConsultaGrade.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPGrade);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqGrade.Database;
  buscas.Transaction := transacao;
  vtabela := 'GRADE';
end;

procedure TConsultaGrade.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_GRADE').AsInteger;
end;

{ TConsultaSetor }

constructor TConsultaSetor.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsSetor);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrSetor.Database;
  buscas.Transaction := transacao;
  vtabela := 'SETOR';
end;

procedure TConsultaSetor.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_SETOR').AsInteger;
end;

{ TConsultaObsLancamentosFiscais }

constructor TConsultaObsLancamentosFiscais.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsLancF);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrLancF.Database;
  buscas.Transaction := transacao;
  vtabela := 'SPED_LANCAMENTO_FISCAL';
  HabilitarBotao := True;
  fNomePacote := 'pkSPED';
  fNomeFormulario := 'TfrmCadSpedLancamentosFiscais';
end;

procedure TConsultaObsLancamentosFiscais.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('cod_obs').AsString;
end;

{ TConsultaPromocoes }

constructor TConsultaPromocoes.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPromocao);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPromocaoTab.Database;
  buscas.Transaction := transacao;
  vtabela := 'PROMOCAO';
  HabilitarBotao := True;
  fNomePacote := 'pkProdutos';
  fNomeFormulario := 'TfrmCadPromocao';
end;

procedure TConsultaPromocoes.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_PROMOCAO').AsInteger;
end;

{ TConsultaLocalidade2 }

constructor TConsultaLocalidade2.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPesqLocalidade);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqLocalidade.Database;
  buscas.Transaction := transacao;
  vtabela := 'LOCALIDADE';
  HabilitarBotao := True;
  fNomePacote := 'pkOrdemCarregamento';
  fNomeFormulario := 'TfrmCadLocalidade';
end;

procedure TConsultaLocalidade2.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_LOCALIDADE').AsInteger;
end;

{ TTipoPendencia }

constructor TTipoPendencia.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsTipoPendencia);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrTipoPendencia.Database;
  buscas.Transaction := transacao;
  vtabela := 'TIPO_PENDENCIA';
end;

procedure TTipoPendencia.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_TP_PENDENCIA').AsInteger;
end;

{ TTipoDespesa }

constructor TTipoDespesa.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsTipoDespesa);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrTipoDespesa.Database;
  buscas.Transaction := transacao;
  vtabela := 'TIPO_DESPESA';
end;

procedure TTipoDespesa.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('COD_TP_DESPESA').AsInteger;
end;

{ TConsultaEstMoto }

constructor TConsultaEstMoto.Create;
begin
 if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsEstMoto);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrEstMoto.Database;
  buscas.Transaction := transacao;
  vtabela := 'EST_MOTO';
  HabilitarBotao := True;
  fNomePacote := 'pkVeiculosCCIA';
  fNomeFormulario := 'TfrmMovVeiculosCCIA';
end;

procedure TConsultaEstMoto.Pegacodigo;
begin
 valorindex := dataSet.FieldByName('CODIGO').AsInteger;
 vDadosIni.vPesquisaChassi := dataSet.FieldByName('CHASSI_C').AsString;
 vDadosIni.vPesquisaPlaca := dataSet.FieldByName('PLACAEST').AsString;
end;

{ TNBS }

constructor TNBS.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsNBS);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrNBS.Database;
  buscas.Transaction := transacao;
  vtabela := 'NBS';
  HabilitarBotao := True;
  fNomePacote := 'pkProdutos';
  fNomeFormulario := 'TFrmCadNBS';
end;

procedure TNBS.Pegacodigo;
begin
   valorindex := dataSet.FieldByName('COD_NBS').AsString;
end;

{ TConsultaCondPag }

constructor TConsultaCondPag.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsCondPag);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrCondPag.Database;
  buscas.Transaction := transacao;
  vtabela := 'COND_PAG';
end;

procedure TConsultaCondPag.Pegacodigo;
begin
   valorindex := dataSet.FieldByName('COD_COND_PAG').AsString;
end;

{ TConsultaPedido }

constructor TConsultaPedido.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPedido);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPedido.Database;
  buscas.Transaction := transacao;
  vtabela := 'PEDIDO';
end;

procedure TConsultaPedido.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('NUM_PED').AsFloat;
end;

{ TConsultaPedvenda }

constructor TConsultaPedvenda.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPedvenda);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPedvenda.Database;
  buscas.Transaction := transacao;
  vtabela := 'PEDVENDA';
end;

procedure TConsultaPedvenda.Pegacodigo;
begin
 valorindex := dataSet.FieldByName('NPED').AsFloat;
end;

{ TConsultaTipoCliente }

constructor TConsultaTipoCliente.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPesqTpCliente);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqTpCliente.Database;
  buscas.Transaction := transacao;
  vtabela := 'TIPOS_CLIENTES';
end;

procedure TConsultaTipoCliente.Pegacodigo;
begin
 valorindex := dataSet.FieldByName('codigo_tipo').AsInteger;
end;

{ TConsultaPromocaoP }

constructor TConsultaPromocaoP.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPesqPromocaoP);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqPromocaoP.Database;
  buscas.Transaction := transacao;
  vtabela := 'CADPROMOCAO';
end;

procedure TConsultaPromocaoP.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('cod_promocao').AsInteger;
end;

{ TConsultaTabelaP }

constructor TConsultaTabelaP.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPesqTabelaP);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqTabelaP.Database;
  buscas.Transaction := transacao;
  vtabela := 'CADTABELA';
end;

procedure TConsultaTabelaP.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('cod_promocao').AsInteger;
end;

{ TConsultaTabelaPromocaoP }

constructor TConsultaTabelaPromocaoP.Create;
begin
  if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPesqTabelaPromocaoP);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqTabelaPromocaoP.Database;
  buscas.Transaction := transacao;
  vtabela := 'CADTABELAPROMOCAO';
end;

procedure TConsultaTabelaPromocaoP.Pegacodigo;
begin
  valorindex := dataSet.FieldByName('cod_promocao').AsInteger;
end;

{ TConsultaServicosEmp }

constructor TConsultaServicosEmp.Create;
begin
	if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPServicosEmp);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqServicosEmp.Database;
  buscas.Transaction := transacao;
  vtabela := 'SERVICOS_EMP';
end;

procedure TConsultaServicosEmp.Pegacodigo;
begin
	valorindex := dataSet.FieldByName('COD_SERVICO').AsInteger;
end;

{ TConsultaParticipante }

function TConsultaParticipante.abreParticipante: Boolean;
begin
	result := montaSelect('SELECT * FROM PARTICIPANTE ' +
  	' WHERE COD_EMPRESA = ' + vDadosIni.codEmpresa +
    ' AND ATIVO = 1');
end;

constructor TConsultaParticipante.Create;
begin
	if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsPPart);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrPesqCol.Database;
  buscas.Transaction := transacao;
  vtabela := 'PARTICIPANTE';
end;

procedure TConsultaParticipante.Pegacodigo;
begin
	valorindex := dataSet.FieldByName('COD_PARTICIPANTE').AsInteger;
end;

{ TProdutoAcabado }

constructor TProdutoAcabado.create;
begin
	if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsProdutoAcabado);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  Buscas := TIBQuery(dtmConsultas.qrProdutoAcabado);

  vMateriaPrimaProdutoAcabado := TMateriaPrimaProdutoAcabado.Create;

  dataSet.AfterScroll := datasetAfterScrollMateriaPrima;
end;

procedure TProdutoAcabado.datasetAfterScrollMateriaPrima(DataSet: TDataSet);
begin
  if DataSet.IsEmpty then
  begin
  	vMateriaPrimaProdutoAcabado._abreMateriaPrimaProdutoAcabado(
  		'0',
	    '000000',
      0,
      0);
    exit;
  end;

	vMateriaPrimaProdutoAcabado._abreMateriaPrimaProdutoAcabado(
  	DataSet.FieldByName('grupo_prod').AsString,
    DataSet.FieldByName('cod_prod').AsString,
    DataSet.FieldByName('cod_grade').AsInteger,
    DataSet.FieldByName('id_ind').AsInteger);
end;

destructor TProdutoAcabado.destroy;
begin
  if Assigned(vMateriaPrimaProdutoAcabado) then
	  FreeAndNil(vMateriaPrimaProdutoAcabado);
  inherited;
end;

procedure TProdutoAcabado._abreProdutoAcabado(Grupo_Prod, Cod_Prod: string; ExibirQtdeProduzir: boolean);
var
	buscas2: TIBQuery;
	I: Integer;
begin
	if Assigned(frmLocalizar) then
  begin
  	buscas2 := TIBQuery.Create(nil);
    try
      buscas2.Database := buscas.Database;
      buscas2.Transaction := buscas.Transaction;

      buscas2.Close;
      buscas2.SQL.Text := ' select est_f, estoque from getestoquedisponivel (' +
        Grupo_Prod + ', ' +
        QuotedStr(Cod_Prod) + ', ' +
        ' 0, ' +
        vDadosIni.codEmpresa + ', ' +
        ' 0, ' +
        ' '''', ' +
        ' 0, ' +
        ' 0) ';
      buscas2.Open;

      frmLocalizar.lbEstF.Caption :=  FormatFloat('0.000', buscas2.FieldByName('est_f').AsFloat);
      frmLocalizar.lbEstD.Caption :=  FormatFloat('0.000', buscas2.FieldByName('estoque').AsFloat);


      if ExibirQtdeProduzir then
      begin
        frmLocalizar.lbDescQtdeProduzir.Visible := True;
        frmLocalizar.lbQtdeProduzir.Visible     := True;

        buscas2.Close;
        buscas2.SQL.Text := ' select estoque from getestoque_recursivo (' +
          Grupo_Prod + ', ' +
          QuotedStr(Cod_Prod) + ', ' +
          vDadosIni.codEmpresa + ', ' +
          ' 0) ';
        buscas2.Open;

        frmLocalizar.lbQtdeProduzir.Caption :=  FormatFloat('0.000', buscas2.FieldByName('estoque').AsFloat);
      end
      else
      begin
        frmLocalizar.lbDescQtdeProduzir.Visible := False;
        frmLocalizar.lbQtdeProduzir.Visible     := False;
      end;

      buscas2.Close;
      buscas2.SQL.Text := ' select count(*) from cod_grade_prod ' +
        ' where grupo_prod = ' + Grupo_Prod +
        ' and cod_prod = ' + QuotedStr(Cod_Prod)  +
        ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cod_grade > 0 ';
      buscas2.Open;

      frmLocalizar.GroupBox8.Visible := buscas2.FieldByName('count').AsInteger > 0;

    finally
      buscas2.Free;
    end;
  end;

  dataSet.Close;
  dataSet.CommandText := ' select ' +
	  ' coalesce(cod_grade_prod.cod_grade, 0) cod_grade, ' +
    ' iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(grade.descricao, ''SEM GRADE''), ''SEM GRADE'') grade, ' +
    ' iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(grade.descricao1, ''SEM GRADE''), ''SEM GRADE'') grade1, ' +
  	' produtos.grupo_prod, produtos.cod_prod, produtos.cod_empresa, ' +
  	' produtos.num_fab_prod, ' +
    ' (trim(coalesce(produtos.descr_prod, '''')) || iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, ' +
    '		'' - '' || iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(grade.descricao, ''''), ''''), ''''))  descr_prod, ' +
    ' (coalesce((select estoque from getestoque_recursivo( ' +
    '           produtos.grupo_prod, ' +
    '           produtos.cod_prod, ' +
    '           produtos.cod_empresa, ' +
    '           iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(cod_grade_prod.cod_grade, 0), 0))) ' +
    ' , 0)) qtde_produzir, ' +
    ' iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(cod_grade_prod.qtde, 0), coalesce(produtos.est_f, 0)) est_f, ' +
    ' coalesce((select estoque from getestoquedisponivel ( ' +
    '           produtos.grupo_prod, ' +
    '           produtos.cod_prod, ' +
    '           iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(cod_grade_prod.cod_grade, 0), 0), ' +
    '           produtos.cod_empresa, ' +
    '           0, ' +
    '           '''', ' +
    '           0, ' +
    '           0))' +
    ', 0) estoque, ' +
    ' coalesce((select first 1 produtos_pdc_var.id_ind from produtos_pdc_var ' +
    '           where produtos_pdc_var.grupo_prod = produtos.grupo_prod ' +
    '           and produtos_pdc_var.cod_prod = produtos.cod_prod ' +
    '           and produtos_pdc_var.cod_empresa = produtos.cod_empresa ' +
    ' 					and produtos_pdc_var.cod_grade = coalesce(cod_grade_prod.cod_grade, 0)), 0) id_ind ' +
    ' from produtos ' +
    ' left join cod_grade_prod on ' +
    '     cod_grade_prod.grupo_prod = produtos.grupo_prod ' +
    '     and cod_grade_prod.cod_prod = produtos.cod_prod ' +
    '     and cod_grade_prod.cod_empresa = produtos.cod_empresa ' +
    ' left join grade on ' +
    '			grade.cod_grade = cod_grade_prod.cod_grade ' +
    '     and grade.cod_empresa = cod_grade_prod.cod_empresa ' +
    ' where produtos.grupo_prod = ' + Grupo_Prod +
    ' and produtos.cod_prod = ' + QuotedStr(Cod_Prod) +
    ' and produtos.cod_empresa = ' + vDadosIni.codEmpresa +
    '  order by 4, 5, 2 ';
  dataSet.Open;

  for I := 0 to dataSet.Fields.Count - 1 do
  begin
  	if dataSet.Fields[i].DataType = ftFloat then
    begin
      if (UpperCase(trim(dataSet.Fields[i].FieldName)) = 'QTDE_PRODUZIR')
      	or (UpperCase(trim(dataSet.Fields[i].FieldName)) = 'EST_F')
        or (UpperCase(trim(dataSet.Fields[i].FieldName)) = 'ESTOQUE') then
         TFloatField(dataSet.Fields[i]).DisplayFormat := '##0.000';
    end;
  end;

  if dataSet.IsEmpty then
  	vMateriaPrimaProdutoAcabado._abreMateriaPrimaProdutoAcabado(
    	Grupo_Prod,
      Cod_Prod,
      0,
      0);
end;

{ TMateriaPrimaProdutoAcabado }

constructor TMateriaPrimaProdutoAcabado.create;
begin
	if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsMateriasPrimasAcabado);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  Buscas := TIBQuery(dtmConsultas.qrMateriasPrimasAcabado);
end;

procedure TMateriaPrimaProdutoAcabado._abreMateriaPrimaProdutoAcabado(
  Grupo_Prod, Cod_Prod: string; CodGrade: Integer; IdInd: Integer);
var
	buscas2: TIBQuery;
	I: Integer;
begin
  if (IdInd > 0) then
  begin
    buscas2 := TIBQuery.Create(nil);
    try
      buscas2.Database := buscas.Database;
      buscas2.Transaction := buscas.Transaction;

      buscas2.Close;
      buscas2.SQL.Text := ' select count(*) from produtos_pdc_var_it ' +
        ' where id_ind = ' + IntToStr(IdInd) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa;
      buscas2.Open;

      if (buscas2.FieldByName('count').AsInteger <= 0) then
      begin
         _abreMateriaPrimaProdutoAcabado(
            Grupo_Prod,
            Cod_Prod,
            0,
            0);
  //    	Application.MessageBox(PChar('Favor vincular as grades do Produto Acabado e Matérias Primas/Insumos/Embalagens!'),
  //      	'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
        exit;
      end;  
    finally
      buscas2.Free;
    end;
  end;

  if (IdInd > 0) then
  begin
  	dataSet.Close;
    dataSet.CommandText := ' select ' +
    	' iif(coalesce(cod_grade_prod.cod_grade,  0) > 0, coalesce(cod_grade_prod.cod_grade,  0), 0) cod_grade, ' +
      ' iif(coalesce(cod_grade_prod.cod_grade,  0) > 0, coalesce(grade.descricao, ''SEM GRADE''), ''SEM GRADE'') grade, ' +
      ' iif(coalesce(cod_grade_prod.cod_grade,  0) > 0, coalesce(grade.descricao1, ''SEM GRADE''), ''SEM GRADE'') grade1, ' +
	    ' produtos.grupo_prod, produtos.cod_prod, produtos.cod_empresa, ' +
      ' produtos.num_fab_prod, ' +
      ' ( trim(coalesce(produtos.descr_prod, '''')) || '' - '' || ' +
      '	  iif(coalesce(cod_grade_prod.cod_grade,  0) > 0, trim(coalesce(grade.descricao, '''')), '''') ) descr_prod, ' +
	    ' iif(coalesce(produtos_pdc_var_it.quant, 0) > 0, coalesce(produtos_pdc_var_it.quant, 0), coalesce(indice_tecnico.quant, 0)) quant, ' +
      ' iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(cod_grade_prod.qtde, 0), coalesce(produtos.est_f, 0)) est_f, ' +
      ' coalesce((select estoque from getestoquedisponivel ( ' +
      '           produtos.grupo_prod, ' +
      '           produtos.cod_prod, ' +
      '           iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(cod_grade_prod.cod_grade, 0), 0),  ' +
      '           produtos.cod_empresa, ' +
      '           0, ' +
      '           '''', ' +
      '           0, ' +
      '           0)), ' +
      ' 0) estoque, ' +
      ' ((coalesce((select estoque from getestoque_recursivo( ' +
      '             produtos.grupo_prod, ' +
      '             produtos.cod_prod, ' +
      '             produtos.cod_empresa, ' +
      '             iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(cod_grade_prod.cod_grade, 0), 0))) ' +
      '  , 0)) +  ' +
      '  (coalesce((select estoque from getestoquedisponivel ( ' +
      '             produtos.grupo_prod, ' +
      '             produtos.cod_prod, ' +
      '             iif(coalesce(cod_grade_prod.cod_grade, 0) > 0, coalesce(cod_grade_prod.cod_grade, 0), 0),  ' +
      '             produtos.cod_empresa, ' +
      '             0, ' +
      '             '''', ' +
      '             0, ' +
      '             0)), ' +
      '  0) / coalesce(indice_tecnico.quant, 0))) qtde_produzir, ' +
      ' produtos_pdc_var_it.id_ind, ' +
      ' produtos_pdc_var_it.id_ind_it ' +
      ' from produtos_pdc_var_it ' +
      ' inner join indice_tecnico on ' +
      '       indice_tecnico.grupo_prod_acabado = ' + Grupo_Prod +
      '				and indice_tecnico.cod_prod_acabado = ' + QuotedStr(Cod_Prod) +
      '				and indice_tecnico.grupo_prod_mprima = produtos_pdc_var_it.grupo_prod ' +
      '				and indice_tecnico.cod_prod_mprima = produtos_pdc_var_it.cod_prod ' +
      '				and indice_tecnico.cod_empresa = produtos_pdc_var_it.cod_empresa ' +
      ' inner join produtos on ' +
      '       produtos.grupo_prod = produtos_pdc_var_it.grupo_prod ' +
      '       and produtos.cod_prod = produtos_pdc_var_it.cod_prod ' +
      '       and produtos.cod_empresa = produtos_pdc_var_it.cod_empresa ' +
      ' left join cod_grade_prod on ' +
      '       cod_grade_prod.grupo_prod = produtos_pdc_var_it.grupo_prod ' +
      '       and cod_grade_prod.cod_prod = produtos_pdc_var_it.cod_prod ' +
      '       and cod_grade_prod.cod_grade = produtos_pdc_var_it.cod_grade ' +
      '       and cod_grade_prod.cod_empresa = produtos.cod_empresa ' +
      ' left join grade on ' +
      '       grade.cod_grade = cod_grade_prod.cod_grade ' +
      '       and grade.cod_empresa = cod_grade_prod.cod_empresa ' +
      ' where produtos_pdc_var_it.id_ind = ' + IntToStr(IdInd) +
      ' and produtos_pdc_var_it.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and produtos_pdc_var_it.cod_grade > 0 ';

    dataSet.CommandText := dataSet.CommandText +
    	' union ' +
      ' select ' +
      ' 0 cod_grade, ' +
      ' ''SEM GRADE'' grade, ' +
      ' ''SEM GRADE'' grade1, ' +
      ' produtos.grupo_prod, produtos.cod_prod, produtos.cod_empresa, ' +
      ' produtos.num_fab_prod, ' +
      ' produtos.descr_prod, ' +
      ' coalesce(indice_tecnico.quant, 0) quant, ' +
      ' coalesce(produtos.est_f, 0) est_f, ' +
      ' coalesce((select estoque from getestoquedisponivel ( ' +
      '           produtos.grupo_prod, ' +
      '           produtos.cod_prod, ' +
      '           0,  ' +
      '           produtos.cod_empresa, ' +
      '           0, ' +
      '           '''', ' +
      '           0, ' +
      '           0)), ' +
      ' 0) estoque, ' +
      ' ((coalesce((select estoque from getestoque_recursivo( ' +
      '             produtos.grupo_prod, ' +
      '             produtos.cod_prod, ' +
      '             produtos.cod_empresa, ' +
      '             0)) ' +
      '  , 0)) +  ' +
      '  (coalesce((select estoque from getestoquedisponivel ( ' +
      '             produtos.grupo_prod, ' +
      '             produtos.cod_prod, ' +
      '             0,  ' +
      '             produtos.cod_empresa, ' +
      '             0, ' +
      '             '''', ' +
      '             0, ' +
      '             0)), ' +
      '  0) / coalesce(indice_tecnico.quant, 0))) qtde_produzir, ' +
      IntToStr(IdInd) + ' id_ind, ' +
      IntToStr(IdInd) + ' id_ind_it ' +
      ' from indice_tecnico ' +
      ' inner join produtos on ' +
      '       produtos.grupo_prod = indice_tecnico.grupo_prod_mprima ' +
      '       and produtos.cod_prod = indice_tecnico.cod_prod_mprima ' +
      '       and produtos.cod_empresa = indice_tecnico.cod_empresa ' +
      ' where indice_tecnico.grupo_prod_acabado = ' + Grupo_Prod +
			' and indice_tecnico.cod_prod_acabado = ' + QuotedStr(Cod_Prod) +
			' and indice_tecnico.cod_empresa = ' + vDadosIni.codEmpresa +
			' and (select count(*) from cod_grade_prod cgp ' +
      ' 	   where cgp.grupo_prod = indice_tecnico.grupo_prod_mprima ' +
      ' 		 and cgp.cod_prod = indice_tecnico.cod_prod_mprima ' +
      ' 		 and cgp.cod_empresa = indice_tecnico.cod_empresa ' +
      ' 		 and cgp.cod_grade > 0) = 0 ' +
      ' order by 4, 5, 2 ';
  end
  else
  begin
  	dataSet.Close;
    dataSet.CommandText :=
    	' select ' +
	    ' 0 cod_grade, ' +
      ' ''SEM GRADE'' grade , ' +
      ' ''SEM GRADE'' grade1, ' +
    	' produtos.grupo_prod, produtos.cod_prod, produtos.cod_empresa, ' +
      ' produtos.num_fab_prod, ' +
      ' trim(coalesce(produtos.descr_prod, '''')) descr_prod, ' +
      ' coalesce(indice_tecnico.quant, 0) quant, ' +
      ' coalesce(produtos.est_f, 0) est_f, ' +
      ' coalesce((select estoque from getestoquedisponivel ( ' +
      '           produtos.grupo_prod, ' +
      '           produtos.cod_prod, ' +
      '           0,  ' +
      '           produtos.cod_empresa, ' +
      '           0, ' +
      '           '''', ' +
      '           0, ' +
      '           0)), ' +
      ' 0) estoque, ' +
      ' ((coalesce((select estoque from getestoque_recursivo( ' +
      '             produtos.grupo_prod, ' +
      '             produtos.cod_prod, ' +
      '             produtos.cod_empresa, ' +
      '             0)) ' +
      '  , 0)) +  ' +
      '  (coalesce((select estoque from getestoquedisponivel ( ' +
      '             produtos.grupo_prod, ' +
      '             produtos.cod_prod, ' +
      '             0,  ' +
      '             produtos.cod_empresa, ' +
      '             0, ' +
      '             '''', ' +
      '             0, ' +
      '             0)), ' +
      '  0) / coalesce(indice_tecnico.quant, 0))) qtde_produzir, ' +
      ' case when (select count(*) from cod_grade_prod ' +
      '            where cod_grade_prod.grupo_prod = indice_tecnico.grupo_prod_mprima ' +
      '						 and cod_grade_prod.cod_prod = indice_tecnico.cod_prod_mprima ' +
      '						 and cod_grade_prod.cod_empresa = indice_tecnico.cod_empresa ' +
      '						 and cod_grade_prod.cod_grade > 0) <= 0 then ' +
      '						1 ' +
      '					else ' +
      '  	 				0 ' +
      ' end id_ind, ' +
      ' case when (select count(*) from cod_grade_prod ' +
      '            where cod_grade_prod.grupo_prod = indice_tecnico.grupo_prod_mprima ' +
      '						 and cod_grade_prod.cod_prod = indice_tecnico.cod_prod_mprima ' +
      '						 and cod_grade_prod.cod_empresa = indice_tecnico.cod_empresa ' +
      '						 and cod_grade_prod.cod_grade > 0) <= 0 then ' +
      '						1 ' +
      '         else ' +
      ' 					0 ' +
      ' end id_ind_it ' +
      ' from indice_tecnico ' +
      ' inner join produtos on ' +
      '       produtos.grupo_prod = indice_tecnico.grupo_prod_mprima ' +
      '       and produtos.cod_prod = indice_tecnico.cod_prod_mprima ' +
      '       and produtos.cod_empresa = indice_tecnico.cod_empresa ' +
      ' where indice_tecnico.grupo_prod_acabado = ' + Grupo_Prod +
      ' and indice_tecnico.cod_prod_acabado = ' + QuotedStr(Cod_Prod) +
      ' and indice_tecnico.cod_empresa = ' + vDadosIni.codEmpresa +
      ' order by 4, 5, 2 ';
  end;
  dataSet.Open;

  for I := 0 to dataSet.Fields.Count - 1 do
  begin
  	if dataSet.Fields[i].DataType = ftFloat then
    begin
      if (UpperCase(trim(dataSet.Fields[i].FieldName)) = 'QUANT')
        or (UpperCase(trim(dataSet.Fields[i].FieldName)) = 'QTDE_PRODUZIR')
        or (UpperCase(trim(dataSet.Fields[i].FieldName)) = 'EST_F')
        or (UpperCase(trim(dataSet.Fields[i].FieldName)) = 'ESTOQUE') then
          TFloatField(dataSet.Fields[i]).DisplayFormat := '##0.000';
    end;
  end;

//  if (CodGrade > 0) and (IdInd <= 0) then
//	  Application.MessageBox(PChar('Favor vincular as grades do Produto Acabado e Matérias Primas/Insumos/Embalagens!'), 'Informação', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON1);
end;

{ TComissaoFaixaDesc }

constructor TComissaoFaixaDesc.Create;
begin
	if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsComissaoFaixaDesc);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrComissaoFaixaDesc.Database;
  buscas.Transaction := transacao;
  vtabela := 'COMISSAO_FAIXA_DESCONTO';
end;

procedure TComissaoFaixaDesc.Pegacodigo;
begin
	valorindex := dataSet.FieldByName('CODIGO').AsString;
end;

{ TConsultaCondPagEmp }

constructor TConsultaCondPagEmp.Create;
begin
	if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  dataSet := TClientDataSet(dtmConsultas.cdsCondicoesPagamentoEmp);
  transacao:= TIBTransaction(dtmConsultas.transConsulta);
  buscas := TIBQuery.Create(nil);
  buscas.Database := dtmConsultas.qrCondicoesPagamentoEmp.Database;
  buscas.Transaction := transacao;
  vtabela := 'CONDICOES_PAGAMENTO_EMP';
end;

procedure TConsultaCondPagEmp.Pegacodigo;
begin
	valorindex := dataSet.FieldByName('COD_COND_PAG').AsString;
end;

{ TPesquisaCodBarra }

constructor TPesquisaCodBarra.create;
begin
	Buscas := TIBQuery(dtmConsultas.qrCodBarraProd);
  dataSet := TClientDataSet(dtmConsultas.cdsCodBarraProd);
end;

procedure TPesquisaCodBarra._PesquisaCodBarra(grupo, codProd: string);
begin
	dataSet.Close;
  dataSet.CommandText := ' SELECT * FROM COD_BARRA ' +
    '	WHERE ATIVO = 1 ' +
    ' and COD_BARRA.GRUPO_PROD = ' + grupo +
    ' and COD_BARRA.COD_PROD = ' + QuotedStr(codProd) +
    ' and COD_BARRA.COD_EMPRESA = ' + vDadosIni.codEmpresa;
  dataSet.Open;
end;

{ TUltimoBalancoProdGrade }

function TUltimoBalancoProdGrade.abreUltimoBalancoGrade(grupoprod: integer; codprod: string; datacadastro: TDateTime; dataconfirm: TDateTime): Boolean;
begin
	try
    result := true;
    buscas.Close;
    buscas.sql.text := ' select ESTOQUE_INI_GRADE.GRUPO_PROD, ESTOQUE_INI_GRADE.COD_PROD, ' +
      '	ESTOQUE_INI_GRADE.COD_GRADE, GRADE.DESCRICAO, GRADE.DESCRICAO1, ' +
    	' ESTOQUE_INI_GRADE.NUM_FAB_PROD, ESTOQUE_INI_GRADE.QUANT_EST,' +
      ' ESTOQUE_INI_GRADE.DATA_CADASTRO, ESTOQUE_INI_GRADE.DATA_CONFIRM, ' +
      ' ESTOQUE_INI_GRADE.LOCACAO_PROD, ESTOQUE_INI_GRADE.LOCACAO_PROD_1, ' +
      ' ESTOQUE_INI_GRADE.QUANT_TRANS, ESTOQUE_INI_GRADE.QUANT_REQ, ESTOQUE_INI_GRADE.QTD_DIF_BAL from ESTOQUE_INI_GRADE ' +
      ' left join GRADE on GRADE.COD_GRADE = ESTOQUE_INI_GRADE.COD_EMPRESA and GRADE.COD_EMPRESA = ESTOQUE_INI_GRADE.COD_EMPRESA ' +
      ' where ESTOQUE_INI_GRADE.GRUPO_PROD = ' + inttostr(grupoprod) +
      ' and ESTOQUE_INI_GRADE.COD_PROD = ' + quotedstr(codprod) +
      ' and ESTOQUE_INI_GRADE.COD_EMPRESA = ' + vDadosIni.codEmpresa +
      ' and ESTOQUE_INI_GRADE.DATA_CADASTRO = ' + QuotedStr(FormatDateTime('dd.mm.yyyy', datacadastro)) +
      ' and ESTOQUE_INI_GRADE.DATA_CONFIRM = ' + QuotedStr(FormatDateTime('dd.mm.yyyy', dataconfirm)) +
      ' and (not ESTOQUE_INI_GRADE.DATA_CONFIRM is null)' +
      ' and ESTOQUE_INI_GRADE.ATIVO = 1' +
      ' order by ESTOQUE_INI_GRADE.DATA_CONFIRM ';
    buscas.open;
  except
    result := false;
  end;
end;

constructor TUltimoBalancoProdGrade.Create;
begin
	if dtmConsultas = nil then
    dtmConsultas := TdtmConsultas.Create(dtmConsultas);
  Buscas := TIBQuery(dtmConsultas.qrUltimoBalancoGrade);
end;

end.

