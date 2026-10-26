unit uClassesOrdemCarregamento;

interface

uses
  uDataSet_OOP, DB, DBClient, StdCtrls, IBQuery, Controls, ComCtrls, RDprint,
  Contnrs,
  rotas_entr_class,
  vw_clientes_dest_class;

type
  THistorico_Carga = class;
  TCidades_OC = class;
  TEstados_OC = class;
  TColaborador_OC = class;
  TSetor = class;
  TLocalidade = class;
  TVeiculoDeTransporte = class;
  TClientes_Carga = class;
  TEntrega_Carga = class;
  TOrdemCarregamento = class;
  TMontagemOC = class;

  THistorico_Carga = class(TDataSet_OOP)
  public
    constructor create;
    function _abreHistorico(pCodVenda: Integer; pTipoVenda: string): Boolean;
  end;

  TCidades_OC = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTodasCidade: Boolean;
    function _existeCidade(pCodCidade: Integer): Boolean;
  end;

  TEstados_OC = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTodosEstados: Boolean;
    function _existeEstado(pCodEstado: Integer): Boolean;
  end;

  TColaborador_OC = class(TDataSet_OOP)
  public
    constructor create;
    function _abreTodosVendedores: Boolean;
    function _existeColaborador(pCodVendedor: Integer): Boolean;
  end;

  TSetor = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _verLixeira: Boolean;
    function _restaurarRegistroDaLixeira: Boolean;
    function _lixeiraVazia: Boolean;
    procedure _cadSetor(pTipoForm: integer);
    function _abreTodos: Boolean;
    function _existeSetor(pCodSetor: Integer): Boolean;
    procedure _marcaDesmarcaLinha;
  var
    vColab: TColaborador_OC;
  end;

  TLocalidade = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _verLixeira: Boolean;
    function _restaurarRegistroDaLixeira: Boolean;
    function _lixeiraVazia: Boolean;
    procedure _cadLocalidade(pTipoForm: integer);
    function _abreTodas: Boolean;
    procedure _marcaDesmarcaLinha; overload;
    procedure _marcaDesmarcaLinha(pCodSetor: Integer; pMarcar: Boolean); overload;
  var
    vSetor: TSetor;
    vCid: TCidades_OC;
    vEst: TEstados_OC;
    vCli: TClientes_Carga;
  end;

  TVeiculoDeTransporte = class(TDataSet_OOP)
  private
    fTerceiro: TDataSet_OOP;
  public
    destructor Destroy; override;
    constructor create;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override;
    function post: Boolean; override;

    function _verLixeira: Boolean;
    function _restaurarRegistroDaLixeira: Boolean;
    function _lixeiraVazia: Boolean;
    function _abreTodos: Boolean;
    function _existeVeiculo(pCodVeic: Integer): Boolean;
    procedure _cadVeiculoTransporte(pTipoForm: integer);
    function _existeTerceiro(pCodTerceiro: Integer): Boolean;
  var
    vColab: TColaborador_OC;
  end;

  TVendas_Carga = class(TDataSet_OOP)
  public
    constructor create;
    function _abreVendas(pCodigosClientes: string): Boolean;
    procedure _marcaDesmarcaLinha;
    function _avancarComVendasSelecionadas: Boolean;
    function _adicionaVenda(pCodigoVenda: Integer): Boolean;
  var
  	vDataIni, vDataFim: string;
    vNumIni, vNumFinal: Integer;   
    _dataSet: TClientDataSet;
  end;

  TClientes_Carga = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function _abreTodos: Boolean;
    procedure _marcaDesmarcaLinha; overload;
    procedure _marcaDesmarcaLinha(pMarcar: Boolean); overload;
    function _avancarComClientesSelecionados: Boolean;
    function _addCliente: Boolean;
    function _pesquisaVendas: Boolean;
  var
    vVendas: TVendas_Carga;
    vCodigoLocalidade: array of Integer;
    _dataSet: TClientDataSet;
  end;

  TEntrega_Carga = class(TDataSet_OOP)
  public
    constructor create;
    function _abreEntregasCarga(pCodCarga: Integer): Boolean;
    procedure _marcaDesmarcaLinha;
  end;

  TOrdemCarregamento_Item_Historico = class(TDataSet_OOP)
  public
    constructor create;
    function _abreHistorico(pCodCarga: Integer): Boolean;
    function _filtrarHistorico(pNItem: Integer; pAplicarFiltro: Boolean = True): Boolean;
    function _apagarHistorico(pNitem: Integer): Boolean;
    function _modificarNitem(pNitem: Integer): Boolean;
    function _removerHistorico: Boolean;
  end;

  TOrdemCarregamento_Item = class(TDataSet_OOP)
  public
    destructor Destroy; override;
    constructor create;
    function insert: Boolean; override;
    function _abreItens(pCodCarga: Integer): Boolean;
    procedure _marcaDesmarcaLinha;
    function _avancarComItensSelecionados: Boolean;
  var
    vHistorico: TOrdemCarregamento_Item_Historico;
    _dataSet: TClientDataSet;
  end;

  TOrdemCarregamento = class(TDataSet_OOP)
  private
    fBuscas2, fBuscas3: TIBQuery;
    fDATA_ENTREGA : TDateTime;
    fCodigoVenda, fNumVenda, fCodCarga: Integer;
    fImp_NomeMotorista, fImp_NomeConferente, fImp_NomeFaturista, fImp_ModeloVeiculo, fImp_Setor: string;
    fTemp: string;
    function _abreFormPesquisaVenda: Boolean;
    function _abreFormIniciarContinuarCarregamento: Boolean;
    function _abreFormItens: Boolean;
    procedure _inserirCodigoCarga(pDtset: TDataSet);
    function _gravarDadosCarregamentoEntrega: Boolean;
    function _verificarNovasVendas: Boolean;
    function _vendasEmAberto: Boolean;

    function _vendaEmOutraOrdemDeCarregamento(pCodVenda: Integer): Integer; // retorna o numero da venda
    function _imprimirSintesePedidos(pTipo: string = ''): Boolean;
    function _imprimirRelacaoEntrega(pTipo: string = ''): Boolean;

  public
    destructor Destroy; override;
    constructor create;
    function insert: Boolean; override;
    function edit: Boolean; override;
    function delete: Boolean; override; // fazer testes necessários para permitir a exclusao do registro
    function post: Boolean; override;

    /// 			Ideias
    /// * Campo que indica que a mercadoria foi retirada na loja.
    /// * Talvez na tabela de historico informação para dizer que o item foi entregue ou retirado no local.
    /// * Codigo da entrega podera ser usado para impressao onde sera feito um select pelo codigo e pela data
    ///   e gravar o codigo e data ao clicar no concluir


    procedure _cadOrdemCarregamento(pTipoForm: integer);
    function _abreFormImpressao: Boolean;
    function _abreFormMontagemMovimento: Boolean;
    function _pesquisa(pCampo, pCondicao, pValor, pData1, pData2: string): Boolean;

    function _ordemCarregamentoFechada: boolean;
    function _existeVenda(pNumVenda: Integer; pArmazenarNaVariavel: Boolean = True): Boolean;
    function _adicionarVendaParaCarregamento(pCodigoVenda: Integer = 0; pNumVenda: Integer = 0; pAplicarPost: Boolean = True): Boolean;
    function _removerMercadorias(pCodigoVenda: Integer = 0): Boolean;
    function _calcularPesoCarga: Boolean;
    function _adicionarRemoverMercadorias: Boolean;
    function _iniciarContinuarCarregamento: Boolean;
    function _fecharOrdemCarregamento: Boolean;
    function _reabrirOrdemCarregamento: Boolean;
    function _cargaPendenteParaCarregamento: Boolean;
    function _cargaErradoParaCarregamento: Boolean;
    function _informarQtdeParaHistorico(pQuantidade: Extended; pRetiradaNoLocal: Boolean = False): Boolean;
    function _removerHistorico: Boolean;
    function _impressao(pTipo:string): Boolean;
    function _getQtdePendente: Extended;
    function _montarOrdemCarregamentoPeloAssistente: Boolean;
    function _montarOrdemCarregamentoPeloMovimento: Boolean;
    function _montarOrdemCarregamentoPeloMovimento_Rota: Boolean;
    function _concluirMontagemOrdemCarregamentoPeloAssistente(pPasso: Smallint): Boolean;
    function _adicionarMercadoriasVendasSelecionadas: Boolean;
    function _adicionarMercadorias(pCodVenda, pNumVenda: Integer): Boolean;
    function _informarSaida: Boolean;
    function _atualizarSituacaoPedidos(pStatus: string; pExcluir: Boolean = False; pComitar: Boolean = False; pSituacao: string = 'SEPARACAO'): Boolean;
    function existeConferenciaCega(pNumDoc: integer): Boolean;
    function imprimirItens: boolean;

    property vDATA_ENTREGA: TDateTime read fDATA_ENTREGA write fDATA_ENTREGA ;
    property vCodigoVenda: Integer read fCodigoVenda;
  var
    vItem: TOrdemCarregamento_Item;
    vSetor: TSetor;
    vLocalidade: TLocalidade;
    vVeic: TVeiculoDeTransporte;
    vEnt: TEntrega_Carga;
    vCl: TClientes_Carga;
//    vMotorista: TColaborador_OC;
//    vFaturista: TColaborador_OC;
//    vConferente: TColaborador_OC;
    vColab: TColaborador_OC;
    vTextoCaptionTemp: string;
    vProgresso: TProgressBar;

    //Variaveis de Controle de Impressão
    vImp_Descricao, vImp_OrdenarPorCliente, vImp_OrdenarPorCidade, vImp_OrdenarPorLocalidade, vImp_OrdenarPorRota,
      vImp_NomeFantasia, vImp_OrdenarPorAlocacao, vImp_OrdenarPorCodigo, vImp_OrdenarPorDescricao,
      vImp_Detalhado, vImp_DetalhadoRecPed, vImp_ImpAlocacao, vImp_OrdenarPorNumVenda: Boolean;
    vImp_Entregas: string;
    rdp: TRdPrint;
  end;

  TMontagemOC = class(TDataSet_OOP)
  private
    fDataBase: TDate;
    fPesoTotal, fPesoCargaSalva: Extended;
    fQtdeVendas, fCargaSalva, fQtdeVendasSalvas: Integer;
    procedure CidadesAfterScroll(DataSet: TDataSet);
  public
    constructor create;
    function iniciarMontagem: boolean;
    procedure marcaDemarcaCidade;
    procedure marcaDesmarcaCliente(pAlterarCidade: Boolean = False);

    property DataBase: TDate read fDataBase write fDataBase;
    property PesoTotal: Extended read fPesoTotal write fPesoTotal;
    property QtdeVendas: Integer read fQtdeVendas write fQtdeVendas;
    property CargaSalva: Integer read fCargaSalva write fCargaSalva;
    property QtdeVendasSalvas: Integer read fQtdeVendasSalvas write fQtdeVendasSalvas;
    property PesoCargaSalva: Extended read fPesoCargaSalva write fPesoCargaSalva;
  var
    vClientes, vVendas: TDataSet_OOP;
    vDSCidades, vDSClientes: TDataSource;
    vProgresso: TProgressBar;
  end;

  TPedidosPorRota = class(TVw_clientes_dest_class)
  private
    Fvalor_total: Double;
    Fdata_ped: TDateTime;
    Fdata_fech: TDateTime;
    Fnped: Integer;
    Fstatus_ped: string;
    Ftipo: string;
    Fpeso_b: Double;
  public
    procedure SetValuesFrom(ADataSet: TDataSet); override;
    function Clone_obj: TPedidosPorRota;

    property nped       : Integer   read Fnped        write Fnped;
    property tipo       : string    read Ftipo        write Ftipo;
    property data_ped   : TDateTime read Fdata_ped    write Fdata_ped;
    property data_fech  : TDateTime read Fdata_fech   write Fdata_fech;
    property valor_total: Double    read Fvalor_total write Fvalor_total;
    property status_ped : string    read Fstatus_ped  write Fstatus_ped;
    property peso_b     : Double    read Fpeso_b      write Fpeso_b;
  end;

  TPedidosPorRotaList = class(TObjectList)
  private
    FpesoTotal: double;
    function GetItem(Index: Integer): TPedidosPorRota;
    procedure SetItem(Index: Integer; const Value: TPedidosPorRota);
  public
    function New: TPedidosPorRota;

    property Items[Index: Integer]: TPedidosPorRota read GetItem write SetItem;
    property pesoTotal: double read FpesoTotal write FpesoTotal;
  end;

  TMontagemPorRota = class(TDataSet_OOP)
  private
    FClient        : TClientDataSet;
    FrotaSel       : TRotas_entr_class;
    Fdsource       : TDataSource;
    Fpedidos       : TPedidosPorRotaList;
    FpedidosSel    : TPedidosPorRotaList;
    FpesoChange    : Tevent_;
    FpedidosAbertos: Integer;
    procedure field_sel_change(Sender: TField);
    procedure configurarDataSets;
  public
    constructor create;
    destructor Destroy; override;

    function GetRotasAtivas: TRotas_entr_classList;

    function iniciarMontagem(AdataIni, AdataFim: string): boolean;

    property rotaSel       : TRotas_entr_class   read FrotaSel        write FrotaSel;
    property dsource       : TDataSource         read Fdsource        write Fdsource;
    property pedidosSel    : TPedidosPorRotaList read FpedidosSel;
    property pesoChange    : Tevent_             read FpesoChange     write FpesoChange;
    property pedidosAbertos: Integer             read FpedidosAbertos write FpedidosAbertos;

  end;

var
  cadSetor: TSetor;
  cadLocalidade: TLocalidade;
  cadVeic: TVeiculoDeTransporte;
  cadOrdemC: TOrdemCarregamento;
  montaOC: TMontagemOC;
  montaOCPorRota: TMontagemPorRota;

implementation

uses
  uDtmOrdemCarregamento, IBDatabase, uCadSetor, uDtmAtivo, uCadLocalidade,
  Forms, uDadosIni, Windows, SysUtils, uCadVeiculoTransporte,
  uCadOrdemCarregamento, uMontaOrdemCarregamento, uPadrao, Classes,
  Variants, DateUtils, Math, StrUtils;

{ TLocalidade }

constructor TLocalidade.create;
begin
  if dtmOrdemCarregamento = nil then
    dtmOrdemCarregamento := TdtmOrdemCarregamento.Create(dtmOrdemCarregamento);

  dataSet := TClientDataSet(dtmOrdemCarregamento.cdsLocalidade);
  transacao := TIBTransaction(dtmOrdemCarregamento.transacao);
  buscas := TIBQuery(dtmOrdemCarregamento.qrBuscas);

  vSetor := TSetor.Create;
  vSetor.dataSet := TClientDataSet(dtmOrdemCarregamento.cdssetorCons);
  vCid := TCidades_OC.create;
  vEst := TEstados_OC.create;
  vCli := TClientes_Carga.create;
end;

function TLocalidade.delete: Boolean;
var
  codLocalidade: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  codLocalidade := dataSet.FieldByName('COD_LOCALIDADE').AsString;

  if dataSet.FieldByName('ativo').asInteger = 0 then
  begin

    if not vDadosIni.PesqPros('OCR015', 'EXCLUIR', 'COD LOCALIDADE ' + dataSet.FieldByName('COD_LOCALIDADE').AsString, 'LOCALIDADE',
      dataSet.FieldByName('COD_LOCALIDADE').AsString, buscas, True) then
      exit;

    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
      Exit;

    if ExecutaComandosSql('select first 1 cod_localidade from clientes' +
      ' where cod_localidade = ' + IntToStr(dataSet.FieldByName('COD_LOCALIDADE').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa) then
    begin
      Application.MessageBox('Localidade não pode ser excluída pois está vinculada a um cadastro de Cliente',
        'Atenção', 0 + 64);
      Exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'delete from localidade where cod_localidade = ' + IntToStr(dataSet.FieldByName('COD_LOCALIDADE').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;

      CommitaTransacao;
      vDadosIni.GravaAuditoria('OCR015', 'EXCLUIR', 'SUCESSO', 'LOCALIDADE', codLocalidade, buscas);
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('OCR015', 'EXCLUIR', 'FALHA', 'LOCALIDADE', codLocalidade, buscas);
    end;
    result := true;
    Refresh;
    Exit;
  end;

  if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira ?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '0';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('OCR014', 'LIXEIRA', 'SUCESSO', 'LOCALIDADE', codLocalidade, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('OCR014', 'LIXEIRA', 'FALHA', 'LOCALIDADE', codLocalidade, buscas);
  end;
  Result := true;
  Refresh;
end;

destructor TLocalidade.Destroy;
begin
  vSetor.Free;
  vSetor := nil;

  vCid.Free;
  vCid := nil;

  vEst.Free;
  vEst := nil;

  vCli.Free;
  vCli := nil;

  inherited;
end;

function TLocalidade.edit: Boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').AsInteger <> 1 then
    Exit;

  if not vDadosIni.PesqPros('OCR013', 'ALTERAR', '', 'LOCALIDADE', dataSet.FieldByName('COD_LOCALIDADE').AsString, buscas, False) then
    Exit;

  if inherited edit then
  begin
    Result := True;
    vSetor._abreTodos;
    vCid._abreTodasCidade;
    vEst._abreTodosEstados;
  end;
end;

function TLocalidade.insert: Boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('OCR012', 'INCLUIR', '', 'LOCALIDADE', '', buscas, False) then
    Exit;

  if not dataSet.Active then
    montaSelect('select localidade.*, s.setor, c.nome_vendedor, i.nome_cidade, e.sigla_uf from localidade' +
      ' inner join setor s on s.cod_setor = localidade.cod_setor and s.cod_empresa = localidade.cod_empresa' +
      ' left join colaborador c on c.cod_vendedor = s.cod_vendedor and c.cod_empresa = s.cod_empresa' +
      ' left join cidades i on i.cod_cidade = localidade.cod_cidade' +
      ' left join estados e on e.codigo_uf = localidade.cod_estado' +
      ' where localidade.cod_localidade = 0 and localidade.cod_empresa = 0');

  if inherited insert then
  begin
    Result := True;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    vSetor._abreTodos;
    vCid._abreTodasCidade;
    vEst._abreTodosEstados;
  end;
end;

function TLocalidade.post: Boolean;
var
  acao: string;
begin
  Result := False;

  if not vDadosIni.PesqPros('OCR017', 'SALVAR', '', 'LOCALIDADE', dataSet.FieldByName('COD_SETOR').AsString, buscas, False) then
    Exit;

  try

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if Trim(dataSet.FieldByName('localidade').AsString) = '' then
      raiseExceptionCreate('Localidade não informada', 'DBEdit2');

    if not vSetor._existeSetor(dataSet.FieldByName('cod_setor').AsInteger) then
      raiseExceptionCreate('Setor não encontrado no cadastro', 'DBEdit3');

    if (dataSet.FieldByName('cod_cidade').AsString <> '') then
      if not vCid._existeCidade(dataSet.FieldByName('cod_cidade').AsInteger) then
        raiseExceptionCreate('Cidade informada não encontrada no cadastro', 'DBEdit4');

    if (dataSet.FieldByName('cod_estado').AsString <> '') then
      if not vEst._existeEstado(dataSet.FieldByName('cod_estado').AsInteger) then
        raiseExceptionCreate('Estado informado não encontrado no cadastro', 'DBLookupComboBox3');

    if dataSet.State = dsInsert then
    begin
      dataSet.FieldByName('COD_LOCALIDADE').AsInteger := Gencodigo('LOCALIDADE', dtmOrdemCarregamento.SpIncCodigo,vDadosIni.codEmpresa);
      vDadosIni.vPesquisa :=dataSet.FieldByName('COD_LOCALIDADE').AsString;
    end;

    Result := inherited Post;
    Result := Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('OCR017', acao, 'SUCESSO', 'LOCALIDADE', dataSet.FieldByName('COD_LOCALIDADE').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('OCR017', acao, 'FALHA', 'LOCALIDADE', dataSet.FieldByName('COD_LOCALIDADE').AsString, buscas);
    end;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TLocalidade._abreTodas: Boolean;
begin
  Result := montaSelect('select localidade.*, s.setor, c.nome_vendedor, i.nome_cidade, e.sigla_uf from localidade' +
      ' inner join setor s on s.cod_setor = localidade.cod_setor and s.cod_empresa = localidade.cod_empresa' +
      ' left join colaborador c on c.cod_vendedor = s.cod_vendedor and c.cod_empresa = s.cod_empresa' +
      ' left join cidades i on i.cod_cidade = localidade.cod_cidade' +
      ' left join estados e on e.codigo_uf = localidade.cod_estado' +
      ' where localidade.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and localidade.ativo = 1');
end;

procedure TLocalidade._cadLocalidade(pTipoForm: integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Cadastro de Localidades');
    if dtmOrdemCarregamento = nil then
      dtmOrdemCarregamento := TdtmOrdemCarregamento.Create(dtmOrdemCarregamento);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('OCR010', 'CONSULTA', '', 'LOCALIDADE', '',
      dtmOrdemCarregamento.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadLocalidade = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadLocalidade, frmCadLocalidade);
    end;

    if (pTipoForm > 0) and (not frmCadLocalidade.Visible) then
      frmCadLocalidade.ShowModal
    else if (not frmCadLocalidade.Visible) then
      frmCadLocalidade.Show
    else if frmCadLocalidade.FormStyle = fsMDIChild then
      frmCadLocalidade.Show
    else
      frmCadLocalidade.ShowModal;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;

function TLocalidade._lixeiraVazia: Boolean;
begin
  Result := not ExecutaComandosSql('Select first 1 cod_localidade from localidade' +
    ' where cod_localidade > 0 and ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

procedure TLocalidade._marcaDesmarcaLinha(pCodSetor: Integer; pMarcar: Boolean);
var
  vPointer: Pointer;
  I: Integer;
begin
  if dataSet.IsEmpty then
    exit;

  I := 0;

  SetLength(vCli.vCodigoLocalidade, I);

  vPointer := dataSet.GetBookmark;
  dataSet.First;
  while not dataSet.Eof do
  begin
    if dataSet.FieldByName('cod_setor').AsInteger = pCodSetor then
    begin
      Inc(I);
      SetLength(vCli.vCodigoLocalidade, I);
      vCli.vCodigoLocalidade[I - 1] := dataSet.FieldByName('cod_localidade').AsInteger;

      dataSet.Edit;
      if not pMarcar then
        dataSet.FieldByName('sel').AsString := ''
      else
        dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
    end;
    dataSet.Next;
  end;
  dataSet.GotoBookmark(vPointer);
  vCli._marcaDesmarcaLinha(pMarcar);
end;

procedure TLocalidade._marcaDesmarcaLinha;
begin
  if dataSet.IsEmpty then
    exit;

  SetLength(vCli.vCodigoLocalidade, 1);
  vCli.vCodigoLocalidade[0] := dataSet.FieldByName('cod_localidade').AsInteger;

  dataSet.Edit;
  if dataSet.FieldByName('sel').AsString = 'S' then
    dataSet.FieldByName('sel').AsString := ''
  else
    dataSet.FieldByName('sel').AsString := 'S';
  dataSet.Post;
  vCli._marcaDesmarcaLinha(dataSet.FieldByName('sel').AsString = 'S');
end;

function TLocalidade._restaurarRegistroDaLixeira: Boolean;
begin
  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').asInteger = 1 then
    Exit;

  if not vDadosIni.PesqPros('OCR016', 'RESTAURAR', 'COD LOCALIDADE ' + dataSet.FieldByName('COD_LOCALIDADE').AsString, 'LOCALIDADE',
    dataSet.FieldByName('COD_LOCALIDADE').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja restaurar este registro da Lixeira?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '1';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('OCR016', 'RESTAURAR', 'SUCESSO', 'LOCALIDADE', dataSet.FieldByName('COD_LOCALIDADE').AsString, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('OCR016', 'RESTAURAR', 'FALHA', 'LOCALIDADE', dataSet.FieldByName('COD_LOCALIDADE').AsString, buscas);
  end;
  Result := true;
  Refresh;
end;

function TLocalidade._verLixeira: Boolean;
begin
  if not vDadosIni.PesqPros('OCR018', 'VER LIXEIRA', '', 'LOCALIDADE', '', buscas, true) then
    Exit;

  if _lixeiraVazia then
    Exit;

  montaSelect('select localidade.*, s.setor , c.nome_vendedor, i.nome_cidade, e.sigla_uf from localidade' +
    ' inner join setor s on s.cod_setor = localidade.cod_setor and s.cod_empresa = localidade.cod_empresa' +
    ' left join colaborador c on c.cod_vendedor = s.cod_vendedor and c.cod_empresa = s.cod_empresa' +
    ' left join cidades i on i.cod_cidade = localidade.cod_cidade' +
    ' left join estados e on e.codigo_uf = localidade.cod_estado' +
    ' where localidade.cod_empresa = ' + vDadosIni.codEmpresa + ' and localidade.ativo = 0');
  Result := not dataSet.IsEmpty;

end;

{ TSetor }

constructor TSetor.create;
begin
  dataSet := TClientDataSet(dtmOrdemCarregamento.cdsSetor);
  transacao := TIBTransaction(dtmOrdemCarregamento.transacao);
  buscas := TIBQuery(dtmOrdemCarregamento.qrBuscas);

  vColab := TColaborador_OC.create;
end;

function TSetor.delete: Boolean;
var
  codSetor: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  codSetor := dataSet.FieldByName('COD_SETOR').AsString;

  if dataSet.FieldByName('ativo').asInteger = 0 then
  begin

    if not vDadosIni.PesqPros('OCR006', 'EXCLUIR', 'COD SETOR ' + dataSet.FieldByName('COD_SETOR').AsString, 'SETOR',
      dataSet.FieldByName('COD_SETOR').AsString, buscas, True) then
      exit;

    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
      Exit;

    if ExecutaComandosSql('select first 1 cod_setor from localidade' +
      ' where cod_setor = ' + IntToStr(dataSet.FieldByName('COD_SETOR').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa) then
    begin
      Application.MessageBox('Setor não pode ser excluído pois está vinculado a um cadastro de Localidade',
        'Atenção', 0 + 64);
      Exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'delete from setor where cod_setor = ' + IntToStr(dataSet.FieldByName('COD_SETOR').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;

      CommitaTransacao;
      vDadosIni.GravaAuditoria('OCR006', 'EXCLUIR', 'SUCESSO', 'SETOR', codSetor, buscas);
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('OCR006', 'EXCLUIR', 'FALHA', 'SETOR', codSetor, buscas);
    end;
    result := true;
    Refresh;
    Exit;
  end;

  if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira ?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '0';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('OCR005', 'LIXEIRA', 'SUCESSO', 'SETOR', codSetor, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('OCR005', 'LIXEIRA', 'FALHA', 'SETOR', codSetor, buscas);
  end;
  Result := true;
  Refresh;
end;


destructor TSetor.Destroy;
begin
  vColab.Free;
  vColab := nil;
  inherited;
end;

function TSetor.edit: Boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').AsInteger <> 1 then
    Exit;

  if not vDadosIni.PesqPros('OCR004', 'ALTERAR', '', 'SETOR', dataSet.FieldByName('COD_SETOR').AsString, buscas, False) then
    Exit;

  if inherited edit then
  begin
    Result := True;
    vColab._abreTodosVendedores;
  end;
end;

function TSetor.insert: Boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('OCR003', 'INCLUIR', '', 'SETOR', '', buscas, False) then
    Exit;

  if not dataSet.Active then
    montaSelect('select s.*, c.nome_vendedor from setor s' +
      ' left join colaborador c on c.cod_vendedor = s.cod_vendedor and c.cod_empresa = s.cod_empresa' +
      ' where s.cod_setor = 0 and s.cod_empresa = 0');

  if inherited insert then
  begin
    Result := True;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    vColab._abreTodosVendedores;
  end;
end;

function TSetor.post: Boolean;
var
  acao: string;
begin
  Result := False;

  if not vDadosIni.PesqPros('OCR008', 'SALVAR', '', 'SETOR', dataSet.FieldByName('COD_SETOR').AsString, buscas, False) then
    Exit;

  try

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if Trim(dataSet.FieldByName('SETOR').AsString) = '' then
      raiseExceptionCreate('Setor não informado', 'DBEdit2');

    if (vDadosIni.vEmp.vOC_VendedorNoSetor = 'S') or (dataSet.FieldByName('cod_vendedor').AsString <> '') then
      if not vColab._existeColaborador(dataSet.FieldByName('cod_vendedor').AsInteger) then
        raiseExceptionCreate('Vendedor informado não encontrado no cadastro', 'DBEdit3');

    if dataSet.State = dsInsert then
      dataSet.FieldByName('COD_SETOR').AsInteger := Gencodigo('SETOR', dtmOrdemCarregamento.SpIncCodigo,vDadosIni.codEmpresa);

    Result := inherited Post;
    Result := Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('OCR008', acao, 'SUCESSO', 'SETOR', dataSet.FieldByName('COD_SETOR').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('OCR008', acao, 'FALHA', 'SETOR', dataSet.FieldByName('COD_SETOR').AsString, buscas);
    end;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TSetor._abreTodos: Boolean;
begin
  montaSelect('select s.*, c.nome_vendedor from setor s' +
    ' left join colaborador c on c.cod_vendedor = s.cod_vendedor and c.cod_empresa = s.cod_empresa' +
    ' where s.cod_empresa = ' + vDadosIni.codEmpresa + ' and s.ativo = 1');
end;

procedure TSetor._cadSetor(pTipoForm: integer);
begin
	try
    vDadosIni.abreStatusProcessamento('','Abrindo Cadastro de Setores');
    if dtmOrdemCarregamento = nil then
      dtmOrdemCarregamento := TdtmOrdemCarregamento.Create(dtmOrdemCarregamento);

    vDadosIni.vTipoForm := pTipoForm;

    if not vDadosIni.PesqPros('OCR001', 'CONSULTA', '', 'SETOR', '',
      dtmOrdemCarregamento.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadSetor = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadSetor, frmCadSetor);
    end;

    if (pTipoForm > 0) and (not frmCadSetor.Visible) then
      frmCadSetor.ShowModal
    else if (not frmCadSetor.Visible) then
      frmCadSetor.Show
    else if frmCadSetor.FormStyle = fsMDIChild then
      frmCadSetor.Show
    else
      frmCadSetor.ShowModal;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;

function TSetor._existeSetor(pCodSetor: Integer): Boolean;
begin
  Result := ExecutaComandosSql('select cod_setor from setor' +
    ' where cod_setor = ' + IntToStr(pCodSetor) + ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1');
end;

function TSetor._lixeiraVazia: Boolean;
begin
  Result := not ExecutaComandosSql('Select first 1 cod_setor from setor' +
    ' where cod_setor > 0 and ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

procedure TSetor._marcaDesmarcaLinha;
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

function TSetor._restaurarRegistroDaLixeira: Boolean;
begin
  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').asInteger = 1 then
    Exit;

  if not vDadosIni.PesqPros('OCR007', 'RESTAURAR', 'COD SETOR ' + dataSet.FieldByName('COD_SETOR').AsString, 'SETOR',
    dataSet.FieldByName('COD_SETOR').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja restaurar este registro da Lixeira?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '1';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('OCR007', 'RESTAURAR', 'SUCESSO', 'SETOR', dataSet.FieldByName('COD_SETOR').AsString, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('OCR007', 'RESTAURAR', 'FALHA', 'SETOR', dataSet.FieldByName('COD_SETOR').AsString, buscas);
  end;
  Result := true;
  Refresh;
end;

function TSetor._verLixeira: Boolean;
begin
  if not vDadosIni.PesqPros('OCR009', 'VER LIXEIRA', '', 'SETOR', '', buscas, true) then
    Exit;

  if _lixeiraVazia then
    Exit;

  montaSelect('select s.*, c.nome_vendedor from setor s' +
    ' left join colaborador c on c.cod_vendedor = s.cod_vendedor and c.cod_empresa = s.cod_empresa' +
    ' where s.cod_empresa = ' + vDadosIni.codEmpresa + ' and s.ativo = 0');
  Result := not dataSet.IsEmpty;

end;

{ TColaborador_OC }

constructor TColaborador_OC.create;
begin
  dataSet := TClientDataSet(dtmOrdemCarregamento.cdsColab);
  transacao := TIBTransaction(dtmOrdemCarregamento.transacao);
  buscas := TIBQuery(dtmOrdemCarregamento.qrBuscas);
end;

function TColaborador_OC._abreTodosVendedores: Boolean;
begin
  Result := montaSelect('select cod_vendedor, nome_vendedor from colaborador' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1');
end;

function TColaborador_OC._existeColaborador(pCodVendedor: Integer): Boolean;
begin
  Result := ExecutaComandosSql('select cod_vendedor from colaborador' +
    ' where cod_vendedor = '+ IntToStr(pCodVendedor) + ' and cod_empresa = '+vDadosIni.codEmpresa+
    ' and ativo = 1');
end;

{ TCidades_OC }

constructor TCidades_OC.create;
begin
  dataSet := TClientDataSet(dtmOrdemCarregamento.cdsCid);
  transacao := TIBTransaction(dtmOrdemCarregamento.transacao);
  buscas := TIBQuery(dtmOrdemCarregamento.qrBuscas);
end;

function TCidades_OC._abreTodasCidade: Boolean;
begin
  Result := montaSelect('select cod_cidade, nome_cidade from cidades' +
    ' where cod_cidade > 0 and ativo = 1');
end;

function TCidades_OC._existeCidade(pCodCidade: Integer): Boolean;
begin
  Result := ExecutaComandosSql('select cod_cidade from cidades' +
    ' where cod_cidade = ' + IntToStr(pCodCidade));
end;

{ TEstados_OC }

constructor TEstados_OC.create;
begin
  dataSet := TClientDataSet(dtmOrdemCarregamento.cdsEst);
  transacao := TIBTransaction(dtmOrdemCarregamento.transacao);
  buscas := TIBQuery(dtmOrdemCarregamento.qrBuscas);
end;

function TEstados_OC._abreTodosEstados: Boolean;
begin
  Result := montaSelect('select codigo_uf, sigla_uf from estados' +
    ' where codigo_uf > 0 and ativo = 1');
end;

function TEstados_OC._existeEstado(pCodEstado: Integer): Boolean;
begin
  Result := ExecutaComandosSql('select codigo_uf from estados' +
    ' where codigo_uf = ' + IntToStr(pCodEstado));
end;

{ TVeiculoDeTransporte }

constructor TVeiculoDeTransporte.create;
begin
  dataSet := TClientDataSet(dtmOrdemCarregamento.cdsVeicTr);
  transacao := TIBTransaction(dtmOrdemCarregamento.transacao);
  buscas := TIBQuery(dtmOrdemCarregamento.qrBuscas);

  vColab := TColaborador_OC.create;
  fTerceiro := TDataSet_OOP.Create;
  fTerceiro.dataSet := TClientDataSet(dtmOrdemCarregamento.cdsTerc);
end;

function TVeiculoDeTransporte.delete: Boolean;
var
  codVeic: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  codVeic := dataSet.FieldByName('COD_VEIC').AsString;

  if dataSet.FieldByName('ativo').asInteger = 0 then
  begin

    if not vDadosIni.PesqPros('OCR024', 'EXCLUIR', 'COD VEIC ' + dataSet.FieldByName('COD_VEIC').AsString, 'VEICULOS_TRANSPORTE',
      dataSet.FieldByName('COD_VEIC').AsString, buscas, True) then
      exit;

    if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
      Exit;

    if ExecutaComandosSql('select first 1 cod_veic from carga' +
      ' where cod_veic = ' + IntToStr(dataSet.FieldByName('COD_VEIC').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa) then
    begin
      Application.MessageBox('Veículo de Transporte não pode ser excluído pois está vinculado a uma Ordem de Carregamento',
        'Atenção', 0 + 64);
      Exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'delete from veiculos_transporte where cod_veic = ' + IntToStr(dataSet.FieldByName('COD_VEIC').AsInteger)+
      ' and cod_empresa = ' + vDadosIni.codEmpresa;

    try
      buscas.ExecSQL;

      CommitaTransacao;
      vDadosIni.GravaAuditoria('OCR024', 'EXCLUIR', 'SUCESSO', 'VEICULOS_TRANSPORTE', codVeic, buscas);
    except
      RollBackTransacao;
      vDadosIni.GravaAuditoria('OCR024', 'EXCLUIR', 'FALHA', 'VEICULOS_TRANSPORTE', codVeic, buscas);
    end;
    result := true;
    Refresh;
    Exit;
  end;

  if Application.MessageBox('Tem certeza que deseja mover este registro para a Lixeira ?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '0';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('OCR023', 'LIXEIRA', 'SUCESSO', 'VEICULOS_TRANSPORTE', codVeic, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('OCR023', 'LIXEIRA', 'FALHA', 'VEICULOS_TRANSPORTE', codVeic, buscas);
  end;
  Result := true;
  Refresh;
end;

destructor TVeiculoDeTransporte.Destroy;
begin
  vColab.Free;
  vColab := nil;
  
  inherited;
end;

function TVeiculoDeTransporte.edit: Boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').AsInteger <> 1 then
    Exit;

  if not vDadosIni.PesqPros('OCR022', 'ALTERAR', '', 'VEICULOS_TRANSPORTE', dataSet.FieldByName('COD_VEIC').AsString, buscas, False) then
    Exit;

  if inherited edit then
  begin
    Result := True;
    vColab._abreTodosVendedores;
    _existeTerceiro(dataSet.FieldByName('COD_PROP_TERCEIRO').AsInteger);
  end;
end;

function TVeiculoDeTransporte.insert: Boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('OCR021', 'INCLUIR', '', 'VEICULOS_TRANSPORTE', '', buscas, False) then
    Exit;

  if not dataSet.Active then
    montaSelect('select veiculos_transporte.*, c.nome_vendedor from veiculos_transporte' +
      ' left join colaborador c on c.cod_vendedor = veiculos_transporte.cod_vendedor and' +
      ' c.cod_empresa = veiculos_transporte.cod_empresa' +
      ' where veiculos_transporte.cod_veic = 0 and veiculos_transporte.cod_empresa = 0');

  if inherited insert then
  begin
    Result := True;
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    vColab._abreTodosVendedores;
  end;
end;

function TVeiculoDeTransporte.post: Boolean;
var
  acao: string;
begin
  Result := False;

  if not vDadosIni.PesqPros('OCR026', 'SALVAR', '', 'VEICULOS_TRANSPORTE', dataSet.FieldByName('COD_VEIC').AsString, buscas, False) then
    Exit;

  try

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if Trim(dataSet.FieldByName('PLACA').AsString) = '' then
      raiseExceptionCreate('Placa não informada', 'DBEdit2');

    if dataSet.FieldByName('PESO_MAXIMO').AsFloat <= 0 then
      raiseExceptionCreate('Peso máximo do não informado ou inválido', 'DBEdit4');
      
    if dataSet.FieldByName('TARA').AsFloat <= 0 then
      raiseExceptionCreate('Tara do veículo não informada ou inválida', 'DBEdit5');

    if Trim(dataSet.FieldByName('UF_LICENCIADO').AsString) = '' then
      raiseExceptionCreate('UF em que veículo está licenciado não informada', 'DBComboBox2');

    if Trim(dataSet.FieldByName('TPROD').AsString) = '' then
      raiseExceptionCreate('Tipo de Rodado do veículo não informado', 'DBRadioGroup1');

    if Trim(dataSet.FieldByName('TPCAR').AsString) = '' then
      raiseExceptionCreate('Tipo de Carroceria do veículo não informado', 'DBRadioGroup2');

    if Trim(dataSet.FieldByName('TERCEIRO').AsString) = 'S' then
    begin
      if dataSet.FieldByName('COD_PROP_TERCEIRO').AsInteger <= 0 then
        raiseExceptionCreate('Proprietário do veículo não informado ou inválido', 'DBEdit12')
      else if not _existeTerceiro(dataSet.FieldByName('COD_PROP_TERCEIRO').AsInteger) then
        raiseExceptionCreate('Proprietário do veículo não encontrado no cadastro', 'DBEdit12');

      if dataSet.FieldByName('RNTRC_TERCEIRO').AsInteger <= 0 then
        raiseExceptionCreate('RNTRC do Terceiro não informado ou inválido', 'DBEdit14')
      else if Length(IntToStr(dataSet.FieldByName('RNTRC_TERCEIRO').AsInteger)) > 8 then // Conforme layou do MDFe
        raiseExceptionCreate('RNTRC do Terceiro não deve ter mais que 8 dígitos', 'DBEdit14');

      if Trim(dataSet.FieldByName('TPPROP_TERCEIRO').AsString) = '' then
        raiseExceptionCreate('Tipo Proprietário não informado', 'DBRadioGroup3');
    end;

//    if (vDadosIni.vEmp.vOC_VendedorNoSetor = 'S') or (dataSet.FieldByName('cod_vendedor').AsString <> '') then
//      if not vColab._existeColaborador(dataSet.FieldByName('cod_vendedor').AsInteger) then
//        raiseExceptionCreate('Vendedor informado não encontrado no cadastro', 'DBEdit5');

    if dataSet.State = dsInsert then
      dataSet.FieldByName('COD_VEIC').AsInteger := Gencodigo('VEICULOS_TRANSPORTE', dtmOrdemCarregamento.SpIncCodigo,vDadosIni.codEmpresa);

    Result := inherited Post;
    Result := Apply;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('OCR026', acao, 'SUCESSO', 'VEICULOS_TRANSPORTE', dataSet.FieldByName('COD_VEIC').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('OCR026', acao, 'FALHA', 'VEICULOS_TRANSPORTE', dataSet.FieldByName('COD_VEIC').AsString, buscas);
    end;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TVeiculoDeTransporte._abreTodos: Boolean;
begin
  Result := montaSelect('select veiculos_transporte.*, c.nome_vendedor from veiculos_transporte' +
    ' left join colaborador c on c.cod_vendedor = veiculos_transporte.cod_vendedor and' +
    ' c.cod_empresa = veiculos_transporte.cod_empresa' +
    ' where veiculos_transporte.cod_empresa = ' + vDadosIni.codEmpresa + ' and veiculos_transporte.ativo = 1');
end;

procedure TVeiculoDeTransporte._cadVeiculoTransporte(pTipoForm: integer);
begin
  vDadosIni.abreStatusProcessamento('','Abrindo Cadastro de Veículos de Transporte');
  if dtmOrdemCarregamento = nil then
    dtmOrdemCarregamento := TdtmOrdemCarregamento.Create(dtmOrdemCarregamento);

  vDadosIni.vTipoForm := pTipoForm;

  if not vDadosIni.PesqPros('OCR019', 'CONSULTA', '', 'VEICULOS_TRANSPORTE', '',
    dtmOrdemCarregamento.qrBuscas, False) then
  begin
    vDadosIni.fechaStatusProcessamento;
    Exit;
  end;

  if frmCadVeicTransp = nil then
  begin
    if pTipoForm > 0 then
      vDadosIni.vModalOuChild := 'M';

    Application.CreateForm(TfrmCadVeicTransp, frmCadVeicTransp);
  end;
  
  if frmCadVeicTransp.FormStyle = fsMDIChild then
    frmCadVeicTransp.Show
  else
    frmCadVeicTransp.ShowModal;
  vDadosIni.fechaStatusProcessamento;
end;

function TVeiculoDeTransporte._existeTerceiro(pCodTerceiro: Integer): Boolean;
begin
//  buscas.Close;
//  buscas.SQL.Text := 'select cod_cliente from clientes' +
//    ' where cod_cliente = ' + IntToStr(pCodTerceiro)+
//    ' and cod_empresa = ' + vDadosIni.codEmpresa +
//    ' and ativo = 1';
//  buscas.Open;
  
  fTerceiro.montaSelect('select c.cod_cliente, c.nome_cliente, c.razao, c.cpfcgc from clientes c' +
    ' where cod_empresa = ' + vDadosIni.codEmpresa +
    ' and cod_cliente = ' + IntToStr(pCodTerceiro));

  Result := (pCodTerceiro > 0) and (pCodTerceiro = fTerceiro.dataSet.FieldByName('cod_cliente').AsInteger);

end;

function TVeiculoDeTransporte._existeVeiculo(pCodVeic: Integer): Boolean;
begin
  Result := ExecutaComandosSql('select cod_veic from veiculos_transporte' +
    ' where cod_veic = ' + IntToStr(pCodVeic) + ' and cod_empresa = ' + vDadosIni.codEmpresa + ' and ativo = 1');
end;

function TVeiculoDeTransporte._lixeiraVazia: Boolean;
begin
  Result := not ExecutaComandosSql('Select first 1 cod_veic from veiculos_transporte' +
    ' where cod_veic > 0 and ativo = 0 and cod_empresa = ' + vDadosIni.codEmpresa );
end;

function TVeiculoDeTransporte._restaurarRegistroDaLixeira: Boolean;
begin
  if dataSet.IsEmpty then
    Exit;

  if dataSet.FieldByName('ativo').asInteger = 1 then
    Exit;

  if not vDadosIni.PesqPros('OCR025', 'RESTAURAR', 'COD VEIC ' + dataSet.FieldByName('COD_VEIC').AsString, 'VEICULOS_TRANSPORTE',
    dataSet.FieldByName('COD_VEIC').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja restaurar este registro da Lixeira?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON1) <> idyes then
    Exit;

  dataSet.Edit;
  dataSet.FieldByName('Ativo').asString := '1';
  result := inherited Post;
  if Apply then
  begin
    CommitaTransacao;
    vDadosIni.GravaAuditoria('OCR025', 'RESTAURAR', 'SUCESSO', 'VEICULOS_TRANSPORTE', dataSet.FieldByName('COD_VEIC').AsString, buscas);
  end
  else
  begin
    RollBackTransacao;
    vDadosIni.GravaAuditoria('OCR025', 'RESTAURAR', 'FALHA', 'VEICULOS_TRANSPORTE', dataSet.FieldByName('COD_VEIC').AsString, buscas);
  end;
  Result := true;
  Refresh;
end;

function TVeiculoDeTransporte._verLixeira: Boolean;
begin
  if not vDadosIni.PesqPros('OCR027', 'VER LIXEIRA', '', 'VEICULOS_TRANSPORTE', '', buscas, true) then
    Exit;

  if _lixeiraVazia then
    Exit;

  montaSelect('select veiculos_transporte.*, c.nome_vendedor from veiculos_transporte' +
    ' left join colaborador c on c.cod_vendedor = veiculos_transporte.cod_vendedor and' +
    ' c.cod_empresa = veiculos_transporte.cod_empresa' +
    ' where veiculos_transporte.cod_empresa = ' + vDadosIni.codEmpresa + ' and veiculos_transporte.ativo = 0');
  Result := not dataSet.IsEmpty;
end;

{ TOrdemCarregamento_Item_Historico }

constructor TOrdemCarregamento_Item_Historico.create;
begin
  dataSet := TClientDataSet(dtmOrdemCarregamento.cdsCargaItH);
  transacao := TIBTransaction(dtmOrdemCarregamento.transacao);
  buscas := TIBQuery(dtmOrdemCarregamento.qrBuscas);
end;

function TOrdemCarregamento_Item_Historico._abreHistorico(
  pCodCarga: Integer): Boolean;
begin
  Result := montaSelect('select * from carga_item_historico' +
    ' where cod_carga = '+ IntToStr(pCodCarga)+ ' and cod_empresa = '+ vDadosIni.codEmpresa);
  IndexFieldNames := 'NITEM;NITEM_H';
end;

function TOrdemCarregamento_Item_Historico._apagarHistorico(
  pNitem: Integer): Boolean;
begin
  try
    Result := True;
    _filtrarHistorico(pNitem);
    while not dataSet.IsEmpty do
      dataSet.Delete;
  except on E: Exception do
    Result := False;
  end;
end;

function TOrdemCarregamento_Item_Historico._filtrarHistorico(pNItem: Integer;
  pAplicarFiltro: Boolean): Boolean;
begin
  dataSet.Filtered := False;
  dataSet.Filter := 'nitem = ' + IntToStr(pNItem);

  if pAplicarFiltro then
    dataSet.Filtered := True;
end;

function TOrdemCarregamento_Item_Historico._modificarNitem(
  pNitem: Integer): Boolean;
begin
  try
    Result := True;
    _filtrarHistorico(pNitem);
    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('nitem').AsInteger := pNitem;
      dataSet.Post;
      dataSet.Next;
    end;
  except on E: Exception do
    Result := False;
  end;
end;

function TOrdemCarregamento_Item_Historico._removerHistorico: Boolean;
var
  nItem,I, I_h: Integer;
begin
  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('OCR040', 'EXCLUIR', '' , 'CARGA',
    dataSet.FieldByName('COD_CARGA').AsString, buscas, True) then
    exit;

  if Application.MessageBox(pchar('Deseja mesmo excluir este registro?'),'Confirmação',MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  nItem := dataSet.FieldByName('nitem_h').AsInteger;
  I := dataSet.FieldByName('nitem').AsInteger;
  I_h  := dataSet.FieldByName('nitem_h').AsInteger;

  dataSet.Delete;
  dataSet.First;
  while not dataSet.Eof do
  begin
    if nItem <= dataSet.FieldByName('nitem_h').AsInteger then
    begin
      dataSet.Edit;
      dataSet.FieldByName('nitem').AsInteger := nItem;
      dataSet.Post;
      Inc(nItem);
    end;
    dataSet.Next;
  end;
  FindNearest([I, I_h]);
end;

{ TOrdemCarregamento_Item }

constructor TOrdemCarregamento_Item.create;
begin
  dataSet := TClientDataSet(dtmOrdemCarregamento.cdsCargaIt);
  transacao := TIBTransaction(dtmOrdemCarregamento.transacao);
  buscas := TIBQuery(dtmOrdemCarregamento.qrBuscas);
  _dataSet := TClientDataSet(dtmOrdemCarregamento.cdsCargaItTemp);

  vHistorico := TOrdemCarregamento_Item_Historico.create;
  if vDadosIni.vEmp.vOC_TipoControleOrdemC = 'NF' then
    dataSet.FieldByName('num_venda').DisplayLabel := 'Nº NF'
  else
    dataSet.FieldByName('num_venda').DisplayLabel := 'Nº Venda';

 TFloatField(dataSet.FieldByName('prec_cus_prod')).DisplayFormat := '#,##0.00';
 TFloatField(dataSet.FieldByName('prec_cusm_prod')).DisplayFormat := '#,##0.00';
 TFloatField(dataSet.FieldByName('prec_tab_prod')).DisplayFormat := '#,##0.00';
 TFloatField(dataSet.FieldByName('prec_publico')).DisplayFormat := '#,##0.00';
 TFloatField(dataSet.FieldByName('prec_30_prod')).DisplayFormat := '#,##0.00';
 TFloatField(dataSet.FieldByName('prec_60_prod')).DisplayFormat := '#,##0.00';
 TFloatField(dataSet.FieldByName('prec_90_prod')).DisplayFormat := '#,##0.00';
 TFloatField(dataSet.FieldByName('est_f')).DisplayFormat := '#,##0.000';
end;

destructor TOrdemCarregamento_Item.Destroy;
begin
  vHistorico.Free;
  vHistorico := nil;
  inherited;
end;

function TOrdemCarregamento_Item.insert: Boolean;
begin
  Result := False;
  if inherited insert then
  begin
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('nitem').AsInteger := dataSet.RecordCount + 1;
    Result := True;
  end;
end;

function TOrdemCarregamento_Item._abreItens(pCodCarga: Integer): Boolean;
begin
  Result := montaSelect('select cg.*, ' +
    ' (coalesce(cg.quantidade_venda, 0) * coalesce(pr.prec_cus_prod, 0)) prec_cus_prod, ' +
    ' (coalesce(cg.quantidade_venda, 0) * coalesce(pr.prec_cusm_prod, 0)) prec_cusm_prod, ' +
    ' (coalesce(cg.quantidade_venda, 0) * coalesce(pr.prec_tab_prod, 0)) prec_tab_prod, ' +
    ' (coalesce(cg.quantidade_venda, 0) * coalesce(pr.prec_publico, 0)) prec_publico, ' +
    ' (coalesce(cg.quantidade_venda, 0) * coalesce(pr.prec_30_prod, 0)) prec_30_prod, ' +
    ' (coalesce(cg.quantidade_venda, 0) * coalesce(pr.prec_60_prod, 0)) prec_60_prod, ' +
    ' (coalesce(cg.quantidade_venda, 0) * coalesce(pr.prec_90_prod, 0)) prec_90_prod, ' +
    ' coalesce(pr.est_f, 0) est_f ' +
    '    from carga_item cg ' +
    ' inner join produtos pr on pr.grupo_prod = cg.grupo_prod and pr.cod_prod = cg.cod_prod and pr.cod_empresa = cg.cod_empresa ' +
    ' where cg.cod_carga = '+ IntToStr(pCodCarga)+ ' and cg.cod_empresa = '+ vDadosIni.codEmpresa);
  IndexFieldNames := 'NITEM';
  vHistorico._abreHistorico(pCodCarga);
end;

function TOrdemCarregamento_Item._avancarComItensSelecionados: Boolean;
var
  I: Integer;
  J: Integer;
begin
  Result := False;

  if _dataSet.Tag <> 22 then
  	try
      _dataSet.CreateDataSet;
      _dataSet.Tag := 22
    except
    end;

  while not _dataSet.IsEmpty do
  	_dataSet.Delete;

  J:=0;
  dataSet.First;
  while not dataSet.Eof do
  begin
    if dataSet.FieldByName('sel').AsString = 'S' then
    begin
      Inc(J);
      _dataSet.Append;
      for I := 0 to _dataSet.FieldCount - 1 do
        _dataSet.FieldByName(_dataSet.Fields[I].FieldName).AsString := dataSet.FieldByName(_dataSet.Fields[I].FieldName).AsString;
      _dataSet.FieldByName('nitem').AsInteger := _dataSet.RecordCount + 1;
      _dataSet.Post;
      Result := True;
    end;
    dataSet.Next;
  end;

  if not Result then
    Application.MessageBox('Nenhuma mercadoria adicionada', 'Atenção', 0 + 64);

//  dataSet.First;
//  while not dataSet.Eof do
//  begin
//    if dataSet.FieldByName('sel').AsString = '' then
//      dataSet.Delete;
//    dataSet.Next;
//  end;
//
//  I := 0;
//  dataSet.First;
//  while not dataSet.Eof do
//  begin
//    Inc(I);
//    dataSet.Edit;
//    dataSet.FieldByName('nitem').AsInteger := I;
//    dataSet.Post;
//    dataSet.Next;
//  end;

end;

procedure TOrdemCarregamento_Item._marcaDesmarcaLinha;
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

{ TOrdemCarregamento }

constructor TOrdemCarregamento.create;
begin
  dataSet := TClientDataSet(dtmOrdemCarregamento.cdsCarga);
  transacao := TIBTransaction(dtmOrdemCarregamento.transacao);
  buscas := TIBQuery(dtmOrdemCarregamento.qrBuscas);
  Rdp := TRdPrint(dtmOrdemCarregamento.rdpOrdem);

  vItem := TOrdemCarregamento_Item.create;
  vLocalidade := TLocalidade.create;
  vLocalidade.dataSet := TClientDataSet(dtmOrdemCarregamento.cdsLocalCons2);
  vSetor := TSetor.create;
  vSetor.dataSet := TClientDataSet(dtmOrdemCarregamento.cdsSetorCons2);
  vVeic := TVeiculoDeTransporte.create;
  vVeic.dataSet := TClientDataSet(dtmOrdemCarregamento.cdsVeicTrCons2);
  vColab := TColaborador_OC.create;
  vColab.dataSet := TClientDataSet(dtmOrdemCarregamento.cdsColabCons2);
  vEnt := TEntrega_Carga.create;
  vCl := TClientes_Carga.create;

//  vMotorista := TColaborador_OC.create;
//  vFaturista := TColaborador_OC.create;
//  vConferente := TColaborador_OC.create;
end;

function TOrdemCarregamento.delete: Boolean;
var
  codCarga: string;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  codCarga := dataSet.FieldByName('cod_carga').AsString;

  if vDadosIni.vEmp.vUsarConferenciaCegaSaida = 'S1' then
    if existeConferenciaCega(StrToInt(codCarga)) then
  	begin
      Application.MessageBox('Carga já possui conferência cega, não é possivel excluir!', 'Atenção', 0 + 48);
      Exit;
    end;
        
  if not vDadosIni.PesqPros('OCR032', 'EXCLUIR', 'COD CARGA ' + dataSet.FieldByName('COD_CARGA').AsString, 'CARGA',
    dataSet.FieldByName('COD_CARGA').AsString, buscas, True) then
    exit;

  if Application.MessageBox('Tem certeza que deseja excluir este registro permanentemente ?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
    Exit;

  // Funcao para desvincular as vendas (REQ ou NF) da ordem de carregamento.

//  if ExecutaComandosSql('select first 1 cod_veic from carga' +
//    ' where cod_veic = ' + IntToStr(dataSet.FieldByName('COD_VEIC').AsInteger)+
//    ' and cod_empresa = ' + vDadosIni.codEmpresa) then
//  begin
//    Application.MessageBox('Veículo de Transporte não pode ser excluído pois está vinculado a uma Ordem de Carregamento',
//      'Atenção', 0 + 64);
//    Exit;
//  end;

  buscas.Close;
  buscas.SQL.Text := 'update pedvenda set cod_carga = null' +
    ' where cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.ExecSQL;

  buscas.Close;
  buscas.SQL.Text := 'delete from carga where cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  try
    buscas.ExecSQL;

    CommitaTransacao;
    vDadosIni.GravaAuditoria('OCR032', 'EXCLUIR', 'SUCESSO', 'CARGA', codCarga, buscas);
  except
    RollBackTransacao;
    vDadosIni.GravaAuditoria('OCR032', 'EXCLUIR', 'FALHA', 'CARGA', codCarga, buscas);
  end;
  result := true;
  Refresh;    
end;

destructor TOrdemCarregamento.Destroy;
begin
  vItem.Free;
  vItem := nil;

  vLocalidade.Free;
  vLocalidade := nil;

  vSetor.Free;
  vSetor := nil;

  vVeic.Free;
  vVeic := nil;

  vColab.Free;
  vColab := nil;

  vEnt.Free;
  vEnt := nil;

  vCl.Free;
  vCl := nil;

//  vMotorista.Free;
//  vSetor := nil;
//
//  vFaturista.Free;
//  vFaturista := nil;
//
//  vConferente.Free;
//  vConferente := nil;

  inherited;
end;

function TOrdemCarregamento.edit: Boolean;
begin
  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('OCR031', 'ALTERAR', '', 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas, False) then
    Exit;

  if inherited edit then
  begin
    vItem._abreItens(dataSet.FieldByName('cod_carga').AsInteger);
    vSetor._abreTodos;
    vVeic._abreTodos;
    vColab._abreTodosVendedores;
    Result := True;
    if _ordemCarregamentoFechada then
      dataSet.Cancel;
  end;
end;

function TOrdemCarregamento.existeConferenciaCega(pNumDoc: integer): Boolean;
begin
	try
    buscas.Close;
    buscas.SQL.Text := 'SELECT C.COD_CONFERENCIA FROM CONFERENCIA_CEGA C WHERE '+
		'C.TIPO_CONFERENCIA = :TIPO_CONFERENCIA AND '+
		'C.COD_EMPRESA = :COD_EMPRESA AND NUM_DOC = :NUM_DOC '+
		'AND C.ATIVO = 1';
    buscas.ParamByName('TIPO_CONFERENCIA').AsString := 'CARGA';
    buscas.ParamByName('COD_EMPRESA').AsInteger := StrToInt(vDadosIni.codEmpresa);
    buscas.ParamByName('NUM_DOC').AsInteger := pNumDoc;
    buscas.Open;

    Result := (not buscas.IsEmpty);
  except on E: Exception do
  	Result := False;
  end;
end;

function TOrdemCarregamento.imprimirItens: boolean;
var
  variavel_parar: boolean;
  vpag: Integer;
  linha: integer;
  vquant: Double;
  vprec_cus_prod: Double;
  vprec_cusm_prod: Double;
  vprec_tab_prod: Double;
  vprec_publico: Double;
  vest_f: Double;
  vpeso: Double;

  procedure menuCarga;
  begin
    //Impressão do Menu.
    linha := linha + 1;
    Rdp.ImpF(linha, 1, vDadosIni.Replicate('=', 150), [comp17]);

    linha := linha + 1;
    Rdp.ImpD(linha, 1, 'CODIGO', [comp17, negrito]);
    Rdp.ImpF(linha, 22, 'DESCRICAO', [comp17, negrito]);
    Rdp.ImpD(linha, 77, 'QUANTIDADE', [comp17, negrito]);
    if vItem.dataSet.FieldByName('prec_cusm_prod').Visible then
      Rdp.ImpD(linha, 90, 'CUSTO M', [comp17, negrito]);
    Rdp.ImpD(linha, 104, 'TABELA', [comp17, negrito]);
    Rdp.ImpD(linha, 118, 'ATACADO', [comp17, negrito]);
    Rdp.ImpD(linha, 132, 'ESTOQUE', [comp17, negrito]);
    Rdp.ImpD(linha, 143, 'PESO', [comp17, negrito]);
    if vDadosIni.vEmp.vOC_TipoControleOrdemC = 'NF' then
      Rdp.ImpD(linha, 150, 'NF', [comp17, negrito])
    else
      Rdp.ImpD(linha, 150, 'VND', [comp17, negrito]);
    linha := linha + 1;
    Rdp.ImpF(linha, 1, vDadosIni.replicate('=', 150), [comp17]);
    linha := linha + 1;
  end;

  procedure CabNovaPaginaCarga;
  begin
    //  if Rdp.UltimaPagina > 1 then
    if vpag > 0 then
      Rdp.Novapagina;
    Rdp.ImpF(linha, 1, vDadosIni.vEmp.vnomeEmpresa, [normal, negrito]);
    linha := linha + 1;
    Rdp.ImpF(linha, 1, 'ORDEM DE CARREGAMENTO ', [normal, negrito]);
    linha := linha + 1;
    Rdp.ImpF(linha, 1, IntToStr(dataSet.FieldByName('COD_CARGA').AsInteger) + ' - ' +
     trim(dataSet.FieldByName('DESCRICAO').AsString), [normal, negrito]);
    vpag := vpag + 1;
    Rdp.ImpF(linha, 134, 'PAG: ' + vDadosIni.StrZero(vpag, 3), [normal]);
    linha := linha + 1;
    menuCarga;
  end;
begin
//  if not vDadosIni.PesqPros('CFG053', 'IMPRIMIR', '', '', '', buscas, false) then
//    Exit;
  inherited;
  vpag := 0;
  vquant := 0;
  vprec_cus_prod := 0;
  vprec_cusm_prod := 0;
  vprec_tab_prod := 0;
  vprec_publico := 0;
  vest_f := 0;
  vpeso := 0;
  //Inicia a Impressão.
  if not vDadosIni.ModImp(Rdp) then
    exit;
  Rdp.FonteTamanhoPadrao := S17cpp;
  Rdp.TamanhoQteColunas := 150;
  Rdp.CaptionSetup := 'Configurações de Impressão';
  rdp.OpcoesPreview.CaptionPreview := 'Itens Ordem de Carregamento';
  rdp.TitulodoRelatorio := 'Itens Ordem de Carregamento';
  vDadosIni._LimparVarSendEmail;
  rdp.OnSendMail := vDadosini._SendMailRdPrint;
  rdp.OpcoesPreview.Preview := true;

  if not Rdp.EstaAberto then
    Rdp.Abrir;
  linha := 2;
  CabNovaPaginaCarga;
  // Inicio da Impressão dos Itens.
  vItem.dataSet.First;
  while not vItem.dataSet.eof do
  begin
    Application.ProcessMessages;
    try
      Rdp.Imp(linha, 1, vItem.dataSet.FieldByName('num_fab_prod').asstring);
      Rdp.Imp(linha, 22, Copy(trim(vItem.dataSet.FieldByName('descricao').AsString), 1, 43));
      Rdp.ImpD(linha, 77, format('%n', [vItem.dataSet.FieldByName('quantidade_venda').AsCurrency]), [comp17]);
      if vItem.dataSet.FieldByName('prec_cusm_prod').Visible then
        Rdp.ImpD(linha, 90, format('%n', [vItem.dataSet.FieldByName('prec_cusm_prod').AsCurrency]), [comp17]);
      Rdp.ImpD(linha, 104, format('%n', [vItem.dataSet.FieldByName('prec_tab_prod').AsCurrency]), [comp17]);
      Rdp.ImpD(linha, 118, format('%n', [vItem.dataSet.FieldByName('prec_publico').AsCurrency]), [comp17]);
      Rdp.ImpD(linha, 132, format('%n', [vItem.dataSet.FieldByName('est_f').AsCurrency]), [comp17]);
      Rdp.ImpD(linha, 143, format('%n', [vItem.dataSet.FieldByName('peso_total').AsCurrency]), [comp17]);
      Rdp.ImpD(linha, 150, vItem.dataSet.FieldByName('num_venda').AsString, [comp17]);

      vquant := vquant + vItem.dataSet.FieldByName('quantidade_venda').AsCurrency;
      vprec_cusm_prod := vprec_cusm_prod + vItem.dataSet.FieldByName('prec_cusm_prod').AsCurrency;
      vprec_tab_prod := vprec_tab_prod + vItem.dataSet.FieldByName('prec_tab_prod').AsCurrency;
      vprec_publico := vprec_publico + vItem.dataSet.FieldByName('prec_publico').AsCurrency;
      vest_f := vest_f + vItem.dataSet.FieldByName('est_f').AsCurrency;
      vpeso := vpeso + vItem.dataSet.FieldByName('peso_total').AsCurrency;

      linha := linha + 1;
    except
    end;
    vItem.dataSet.Next;
    if linha >= 60 then
    begin
      Rdp.Imp(linha, 1, vDadosIni.Replicate('=', Rdp.TamanhoQteColunas));
      linha := 2;
      CabNovaPaginaCarga;
    end;
  end;
//  linha := linha + 1;
  Rdp.Imp(linha, 1, vDadosIni.replicate('=', 150));
  linha := linha + 1;
  Rdp.ImpF(linha, 1, 'QUANT. ITENS:', [comp17, negrito]);
  Rdp.ImpF(linha, 15, IntToStr(vItem.dataSet.RecordCount), [comp17, negrito]);
  Rdp.ImpF(linha, 57, 'TOTAIS:', [comp17, negrito]);
  Rdp.ImpD(linha, 77, format('%n', [vquant]), [comp17, negrito]);
  if vItem.dataSet.FieldByName('prec_cusm_prod').Visible then
    Rdp.ImpD(linha, 90, format('%n', [vprec_cusm_prod]), [comp17, negrito]);
  Rdp.ImpD(linha, 104, format('%n', [vprec_tab_prod]), [comp17, negrito]);
  Rdp.ImpD(linha, 118, format('%n', [vprec_publico]), [comp17, negrito]);
  Rdp.ImpD(linha, 132, format('%n', [vest_f]), [comp17, negrito]);
  Rdp.ImpD(linha, 143, format('%n', [vpeso]), [comp17, negrito]);
//  Rdp.ImpD(linha, 1, 'QTDE EXCECOES USUARIO ' + trim(vDadosIni.IfThen(vFiltrarVendedor, pusuario, vusuario)) + ': ' + IntToStr(vqtdeExc), [comp17, negrito]);
//  vDadosIni.GravaAuditoria('CFG053', 'IMPRIMIR', 'SUCESSO', '',  '', buscas);
  if Rdp.EstaAberto then
    Rdp.Fechar;
  vDadosIni.fechaStatusProcessamento;
end;

function TOrdemCarregamento.insert: Boolean;
begin
  Result := False;
  if not vDadosIni.PesqPros('OCR030', 'INCLUIR', '', 'CARGA', '', buscas, False) then
    Exit;

  if not dataSet.Active then
    _pesquisa(dataSet.FieldByName('cod_carga').DisplayLabel, 'Igual', '0','','');

  if inherited insert then
  begin
    dataSet.FieldByName('cod_empresa').AsString := vDadosIni.codEmpresa;
    dataSet.FieldByName('status').AsString := 'ABERTA';
    dataSet.FieldByName('data_cadastro').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('tipo_entrega').AsString := vDadosIni.vEmp.vOC_TipoPadraoEntregaOrdemC;
    dataSet.FieldByName('tipo_carga').AsString := vDadosIni.vEmp.vOC_UsarOrdemCarregamento;
    if vDadosIni.vEmp.vOC_Conferencia = 'S' then
      dataSet.FieldByName('conferir').AsString := 'S'
    else if vDadosIni.vEmp.vOC_Conferencia = 'N' then
      dataSet.FieldByName('conferir').AsString := 'N';
    vItem._abreItens(dataSet.FieldByName('cod_carga').AsInteger);
    vSetor._abreTodos;
    vVeic._abreTodos;
    vColab._abreTodosVendedores;
    Result := True;
  end;
end;

function TOrdemCarregamento._montarOrdemCarregamentoPeloAssistente: Boolean;
var
  vOK: Boolean;
begin
  Result := False;
  try
    
    if not Insert then
      exit;

    Application.CreateForm(TfrmMontaOrdemCarregamento, frmMontaOrdemCarregamento);

    vSetor._abreTodos;

    if frmMontaOrdemCarregamento.ShowModal <> IDOK then
      Exit;

    if not vOK then

      raiseExceptionCreate('Operação cancelada pelo usuário', '');

    //Ver se os testes de salvamento serão armazenados aqui


    Result := True;
  except on E: Exception do
  	begin
      RollBackTransacao;
      Application.MessageBox(pchar('Erro :' + E.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TOrdemCarregamento._montarOrdemCarregamentoPeloMovimento: Boolean;
var
  vOK: Boolean;
  vCodVeic, vCodCarga: Integer;
  vPesoMaximo: Extended;
begin
  Result := False;
  try

    try
      montaOC.vVendas.dataSet.Filter := 'SEL = ''S''';
      montaOC.vVendas.dataSet.Filtered := True;

      if montaOC.vVendas.dataSet.FieldByName('nped').AsInteger = 0 then
        raiseExceptionCreate('Sem pedidos selecionados','');

      vCodVeic := vVeic.dataSet.FieldByName('cod_veic').AsInteger;
      vPesoMaximo := vVeic.dataSet.FieldByName('peso_maximo').AsFloat;

      if (vCodVeic > 0) and (vDadosIni.StrToFloatFormat(vVeic.dataSet.FieldByName('peso_maximo').AsFloat,3) > 0) then
        if (vDadosIni.StrToFloatFormat(vVeic.dataSet.FieldByName('peso_maximo').AsFloat, 3) <
        vDadosIni.StrToFloatFormat(montaOC.PesoTotal + montaOC.PesoCargaSalva, 3)) then
      begin
        Application.MessageBox(pchar('Peso da carga excede o máximo permitido!' + #13 +
          'Peso da carga: ' + Format('%0.3f',[montaOC.PesoTotal + montaOC.PesoCargaSalva]) + #13 +
          'Peso máximo permitido: ' + Format('%0.3f',[vVeic.dataSet.FieldByName('peso_maximo').AsFloat]) ), 'Atenção', 0 + 64);
        if not vDadosIni.PesqPros('OCR042', 'MONTAR', '', 'CARGA', '', buscas, True) then
          Exit
        else if Application.MessageBox('Deseja continuar mesmo assim', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          Exit;
      end;

      if montaOC.CargaSalva = 0 then
        vCodCarga := Gencodigo('CARGA', dtmOrdemCarregamento.SpIncCodigo,vDadosIni.codEmpresa)
      else
        vCodCarga := montaOC.CargaSalva;
        
      _pesquisa(dataSet.FieldByName('cod_carga').DisplayLabel, 'Igual', IntToStr(vCodCarga),'','');

      if montaOC.CargaSalva = 0 then
      begin
        if not Insert then
          raiseExceptionCreate('Não foi possivel iniciar a Ordem de Carregamento','');
      end
      else
      begin
        if (montaOC.CargaSalva <> dataSet.FieldByName('cod_carga').AsInteger) then
          raiseExceptionCreate('Não foi possivel iniciar a Ordem de Carregamento numero ' + IntToStr(montaOC.CargaSalva),'');

        if not Edit then
          raiseExceptionCreate('Não foi possivel iniciar a Ordem de Carregamento','');
      end;

      dataSet.FieldByName('COD_CARGA').AsInteger := vCodCarga;

      if vCodVeic > 0 then
        dataSet.FieldByName('cod_veic').AsInteger := vCodVeic;

      if vProgresso <> nil then
      begin
        vProgresso.Min := 0;
        vProgresso.Position := 0;
        vProgresso.Max := montaOC.vVendas.dataSet.RecordCount;
      end;

      montaOC.vVendas.dataSet.First;
      while not montaOC.vVendas.dataSet.Eof do
      begin

        if _adicionarVendaParaCarregamento(montaOC.vVendas.dataSet.FieldByName('nped').AsInteger,
          montaOC.vVendas.dataSet.FieldByName('nped').AsInteger, False) then
        begin
          buscas.Close;
          buscas.SQL.Text := 'update pedvenda set cod_carga = '+IntToStr( dataSet.FieldByName('cod_carga').AsInteger )+
            ' where nped = ' + IntToStr(montaOC.vVendas.dataSet.FieldByName('nped').AsInteger)+
            ' and cod_empresa = ' + vDadosIni.codEmpresa +
            ' and tipo = ''REQ'' and coalesce(cod_carga, 0) = 0';
          buscas.ExecSQL;

          buscas.Close;
          buscas.SQL.Text := 'update notafiscal set cod_carga = '+IntToStr( dataSet.FieldByName('cod_carga').AsInteger )+
            ' where nped = ' + IntToStr(montaOC.vVendas.dataSet.FieldByName('nped').AsInteger)+
            ' and cod_empresa = ' + vDadosIni.codEmpresa +
            ' and tipo_ped = ''REQ'' and coalesce(cod_carga, 0) = 0';
          buscas.ExecSQL;

          buscas.Close;
          buscas.SQL.Text := 'update boletas set cod_carga = '+IntToStr( dataSet.FieldByName('cod_carga').AsInteger )+
            ' where cod_empresa = ' + vDadosIni.codEmpresa +
            ' and cod_nf in ( select cod_nf from notafiscal' +
            ' where cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa + ')';
          buscas.ExecSQL;
        end;

        montaOC.vVendas.dataSet.Next;
        if vProgresso <> nil then
          vProgresso.Position := vProgresso.Position + 1;
        Application.ProcessMessages;
      end;

      if dataSet.FieldByName('peso_carga').AsFloat > vPesoMaximo then
        dataSet.FieldByName('peso_max').AsFloat := dataSet.FieldByName('peso_carga').AsFloat
      else
        dataSet.FieldByName('peso_max').AsFloat := vPesoMaximo;

    finally
      montaOC.vVendas.dataSet.Filtered := False;
      montaOC.vVendas.dataSet.Filter := '';
    end;

    dataSet.Post;
    Result := Apply;
    if Result then
    begin
      if not vItem.Apply then
      begin
        RollBackTransacao;
        Result := False;
        Exit;
      end;
      CommitaTransacao;

      montaOC.vVendas.dataSet.EmptyDataSet;
      montaOC.vClientes.dataSet.EmptyDataSet;
      montaOC.dataSet.EmptyDataSet;

      Application.MessageBox(pchar('Carga numero ' + IntToStr(vCodCarga) + ' criada com sucesso!'), 'Atenção', 0 + 64);
      Edit;
    end
    else
      RollBackTransacao;

  except on E: Exception do
    begin
      RollBackTransacao;
      Application.MessageBox(pchar('Erro :' + E.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TOrdemCarregamento._montarOrdemCarregamentoPeloMovimento_Rota: Boolean;
var
  AcodVeic, AcodCarga: Integer;
  APesoMaximo: Extended;
  I: Integer;
  Aarray_pedvenda: array of Integer;
  Astr: string;
begin
  Result := False;
  try

    try

      if montaOCPorRota.pedidosSel.Count <= 0 then
        raiseExceptionCreate('Sem pedidos selecionados','');

      SetLength(Aarray_pedvenda, 0);
      for I := 0 to montaOCPorRota.pedidosSel.Count - 1 do
        if montaOCPorRota.pedidosSel.Items[I].status_ped = '' then
        begin
          SetLength(Aarray_pedvenda, Length(Aarray_pedvenda) + 1);
          Aarray_pedvenda[High(Aarray_pedvenda)] := montaOCPorRota.pedidosSel.Items[I].nped;
        end;

      if Length(Aarray_pedvenda) > 0 then
      begin
        for I := Low(Aarray_pedvenda) to High(Aarray_pedvenda) do
          Astr := Astr + ', ' + IntToStr(Aarray_pedvenda[I]);

        vDadosIni.ShowErro('Pedidos ainda sem fechar, favor proceder com o fechamento antes de continuar' + sLineBreak + 'Numeros' + Astr);

        Exit;
      end;

      AcodVeic := vVeic.dataSet.FieldByName('cod_veic').AsInteger;
      APesoMaximo := vVeic.dataSet.FieldByName('peso_maximo').AsFloat;

      if (AcodVeic > 0) and (RoundTo(vVeic.f_float('peso_maximo'), -3) > 0) then
        if (RoundTo(vVeic.f_float('peso_maximo'), -3) < RoundTo(montaOCPorRota.pedidosSel.PesoTotal {+ montaOCPorRota.PesoCargaSalva}, -3)) then
      begin
        vDadosIni.ShowAtencao('Peso da carga excede o máximo permitido!' + sLineBreak +
          'Peso da carga: %0.3f' + sLineBreak +
          'Peso máximo permitido: %0.3f',
          [montaOCPorRota.pedidosSel.pesoTotal, vVeic.f_float('peso_maximo')]);
        if not vDadosIni.PesqPros('OCR042', 'MONTAR', '', 'CARGA', '', buscas, True) then
          Exit
        else if Application.MessageBox('Deseja continuar mesmo assim', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          Exit;
      end;

//      if montaOCPorRota.CargaSalva = 0 then
        AcodCarga := Gencodigo('CARGA', dtmOrdemCarregamento.SpIncCodigo,vDadosIni.codEmpresa);
//      else
//        AcodCarga := montaOCPorRota.CargaSalva;

      _pesquisa(dataSet.FieldByName('cod_carga').DisplayLabel, 'Igual', IntToStr(AcodCarga),'','');

//      if montaOCPorRota.CargaSalva = 0 then
      begin
        if not Insert then
          raiseExceptionCreate('Não foi possivel iniciar a Ordem de Carregamento','');
      end              ;
//      else
//      begin
//        if (montaOCPorRota.CargaSalva <> dataSet.FieldByName('cod_carga').AsInteger) then
//          raiseExceptionCreate('Não foi possivel iniciar a Ordem de Carregamento numero ' + IntToStr(montaOCPorRota.CargaSalva),'');
//
//        if not Edit then
//          raiseExceptionCreate('Não foi possivel iniciar a Ordem de Carregamento','');
//      end;

      dataSet.FieldByName('cod_carga').AsInteger := AcodCarga;
      dataSet.FieldByName('cod_rota').AsInteger := montaOCPorRota.rotaSel.cod_rota;

      if AcodVeic > 0 then
        dataSet.FieldByName('cod_veic').AsInteger := AcodVeic;

      if Assigned(vProgresso) then
      begin
        vProgresso.Min := 0;
        vProgresso.Position := 0;
        vProgresso.Max := montaOCPorRota.pedidosSel.Count;
      end;

      for I := 0 to montaOCPorRota.pedidosSel.Count - 1 do with montaOCPorRota.pedidosSel.Items[I] do
      begin
        if _adicionarVendaParaCarregamento(nped, nped, False) then
        begin
          SqlExec('update pedvenda set cod_carga = %d' +
                  ' where nped = %d and cod_empresa = %s and tipo = %s and coalesce(cod_carga, 0) = 0',
                  [f_int('cod_carga'), nped, vDadosIni.codEmpresa, QuotedStr(tipo)]);

          SqlExec('update notafiscal set cod_carga = %d' +
                  ' where nped = %d and cod_empresa = %s and tipo_ped = %s and coalesce(cod_carga, 0) = 0',
                  [f_int('cod_carga'), nped, vDadosIni.codEmpresa, QuotedStr(tipo)]);

          SqlExec('update boletas set cod_carga = %d' +
                  ' where cod_empresa = %s and cod_nf in' +
                  '   (select cod_nf from notafiscal ' +
                  '      where cod_carga = %d and cod_empresa = %s)',
                  [f_int('cod_carga'), vDadosIni.codEmpresa, f_int('cod_carga'), vDadosIni.codEmpresa]);
        end;

        if dataSet.FieldByName('peso_carga').AsFloat > APesoMaximo then
          dataSet.FieldByName('peso_max').AsFloat := dataSet.FieldByName('peso_carga').AsFloat
        else
          dataSet.FieldByName('peso_max').AsFloat := APesoMaximo;

        if Assigned(vProgresso) then
          vProgresso.Position := I + 1;
        Application.ProcessMessages;
      end;


    finally
    end;

    dataSet.Post;
    Result := Apply;
    if Result then
    begin
      if not vItem.Apply then
      begin
        RollBackTransacao;
        Result := False;
        Exit;
      end;
      CommitaTransacao;

      Application.MessageBox(pchar('Carga numero ' + IntToStr(AcodCarga) + ' criada com sucesso!'), 'Atenção', 0 + 64);
      Edit;
    end
    else
      RollBackTransacao;

  except on E: Exception do
    begin
      RollBackTransacao;
      Application.MessageBox(pchar('Erro :' + E.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TOrdemCarregamento._ordemCarregamentoFechada: boolean;
begin
  Result := Trim(dataSet.FieldByName('status').AsString) = 'FECHADA';
end;

function TOrdemCarregamento.post: Boolean;
var
  acao: string;
  vCodCarga: Integer;
begin
  Result := False;

  if not vDadosIni.PesqPros('OCR033', 'SALVAR', '', 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas, False) then
    Exit;

  try

    if not (dataSet.State in [dsInsert, dsEdit]) then
    begin
      Result := True;
      Exit;
    end;

    if dataSet.State = dsEdit then
      acao := 'EDITAR'
    else
      acao := 'INSERIR';

    if dataSet.FieldByName('cod_setor').AsInteger <> 0 then
      if not vSetor._existeSetor(dataSet.FieldByName('cod_setor').AsInteger) then
        raiseExceptionCreate('Setor informado não existe no cadastro','DBEdit3');

    if dataSet.FieldByName('cod_veic').AsInteger = 0 then
      raiseExceptionCreate('Veículo de Transporte não informado','DBEdit5')
    else if dataSet.FieldByName('cod_veic').AsInteger <> 0 then
      if not vVeic._existeVeiculo(dataSet.FieldByName('cod_veic').AsInteger) then
        raiseExceptionCreate('Veículo de Transporte não existe no cadastro','DBEdit5');

    if dataSet.FieldByName('cod_motorista').AsInteger = 0 then
      raiseExceptionCreate('Motorista não informado','DBEdit4')
    else if dataSet.FieldByName('cod_motorista').AsInteger <> 0 then
      if not vColab._existeColaborador(dataSet.FieldByName('cod_motorista').AsInteger) then
        raiseExceptionCreate('Motorista não existe no cadastro','DBEdit4');

    if dataSet.FieldByName('cod_faturista').AsInteger <> 0 then
      if not vColab._existeColaborador(dataSet.FieldByName('cod_faturista').AsInteger) then
        raiseExceptionCreate('Faturista não existe no cadastro','DBEdit6');

    if dataSet.FieldByName('cod_conferente').AsInteger <> 0 then
      if not vColab._existeColaborador(dataSet.FieldByName('cod_conferente').AsInteger) then
        raiseExceptionCreate('Conferente não existe no cadastro','DBEdit7');

    dataSet.FieldByName('AJUDANTES').AsString := UpperCase(dataSet.FieldByName('AJUDANTES').AsString);	

    if (dataSet.State = dsInsert) and (dataSet.FieldByName('COD_CARGA').AsInteger = 0) then
    begin
      dataSet.FieldByName('COD_CARGA').AsInteger := Gencodigo('CARGA', dtmOrdemCarregamento.SpIncCodigo,vDadosIni.codEmpresa);
      vCodCarga := dataSet.FieldByName('COD_CARGA').AsInteger;
      _inserirCodigoCarga(vItem.dataSet);
      _inserirCodigoCarga(vItem.vHistorico.dataSet);
    end;
    fCodCarga := dataSet.FieldByName('COD_CARGA').AsInteger;

    Result := inherited Post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      if (vItem.DataSet.ChangeCount > 0) then
        result := vItem.Apply;

    if result then
      if (vItem.vHistorico.DataSet.ChangeCount > 0) then
        result := vItem.vHistorico.Apply;

    _atualizarSituacaoPedidos('Iniciado');

    if result then
      result := CommitaTransacao;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('OCR033', acao, 'SUCESSO', 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas);
      if acao = 'INSERIR' then
        Application.MessageBox(pchar('Carga numero ' + IntToStr(vCodCarga) + ' criada com sucesso!'), 'Atenção', 0 + 64);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('OCR033', acao, 'FALHA', 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas);
    end;

    dataSet.Refresh;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TOrdemCarregamento._abreFormImpressao: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Impressão';
    frmCadOrdemCarregamento.pnImpressao.Parent := formulario;
    formulario.AutoSize := True;
    formulario.ShowHint := true;
    formulario.AutoScroll := False;
    vEnt._abreEntregasCarga(dataSet.FieldByName('cod_carga').AsInteger);
    result := (formulario.ShowModal = IDOK);

  finally
    frmCadOrdemCarregamento.pnImpressao.Parent := frmCadOrdemCarregamento.tsImpressao;
    formulario.Free;
    formulario := nil;
  end;
end;

function TOrdemCarregamento._abreFormIniciarContinuarCarregamento: Boolean;
var
  formulario: TfrmPadrao;
begin

  if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
    if Trim(dataSet.FieldByName('conferir').AsString) = 'N' then
    begin
      Result := True;
      Exit;
    end;

  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Carregamento de Mercadorias';
    frmCadOrdemCarregamento.pnCarregamento.Parent := formulario;
    formulario.AutoSize := True;
    formulario.ShowHint := true;
    formulario.AutoScroll := False;
    result := (formulario.ShowModal = IDOK);

  finally
    frmCadOrdemCarregamento.pnCarregamento.Parent := frmCadOrdemCarregamento.tsCarregamento;
    formulario.Free;
    formulario := nil;
  end;
end;

function TOrdemCarregamento._abreFormItens: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Mercadorias da Ordem de Carregamento';
    frmCadOrdemCarregamento.pnItens.Parent := formulario;
    formulario.AutoSize := True;
    formulario.ShowHint := true;
    formulario.AutoScroll := False;
    result := (formulario.ShowModal = IDOK);

  finally
    frmCadOrdemCarregamento.pnItens.Parent := frmCadOrdemCarregamento.tsItens;
    formulario.Free;
    formulario := nil;
  end;
end;

function TOrdemCarregamento._abreFormMontagemMovimento: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Montagem de Carga';
    frmCadOrdemCarregamento.pnMontagem.Parent := formulario;
    formulario.AutoSize := True;
    formulario.AutoScroll := False;
    formulario.ShowHint := true;
    formulario.KeyPreview := True;
    vVeic._abreTodos;
    Result := (formulario.ShowModal = IDOK);
  finally
    frmCadOrdemCarregamento.pnMontagem.Parent := frmCadOrdemCarregamento.tsMontagem;
    formulario.Free;
    formulario := nil;
  end;
end;

function TOrdemCarregamento._abreFormPesquisaVenda: Boolean;
var
  formulario: TfrmPadrao;
begin
  try
    formulario := TfrmPadrao.Create(Application);
    formulario.Width := 620;
    formulario.Height := 500;
    formulario.Position := poScreenCenter;
    formulario.Caption := 'Pesquisa de vendas para Carregamento';
    frmCadOrdemCarregamento.pnPesqVenda.Parent := formulario;
    formulario.AutoSize := True;
    formulario.ShowHint := true;
    formulario.AutoScroll := False;
    result := (formulario.ShowModal = IDOK);

  finally
    frmCadOrdemCarregamento.pnPesqVenda.Parent := frmCadOrdemCarregamento.tsPesquisaVenda;
    formulario.Free;
    formulario := nil;
  end;
end;

function TOrdemCarregamento._adicionarMercadorias(pCodVenda, pNumVenda: Integer): Boolean;
begin

  Result := False;

  dataSet := TClientDataSet(dtmOrdemCarregamento.cdsCargabkp);
  vItem.dataSet := TClientDataSet(dtmOrdemCarregamento.cdsCargaItbkp);
  vItem.vHistorico.dataSet := TClientDataSet(dtmOrdemCarregamento.cdsCargaItHbkp);

  _pesquisa(dataSet.FieldByName('cod_carga').DisplayLabel, 'Igual', IntToStr(pCodVenda),'','');

  if dataSet.IsEmpty then
    Exit;

  if _ordemCarregamentoFechada then
    Exit;

  try
    if Edit then
    begin
      if not _removerMercadorias(pCodVenda) then
        Exit;
      if not _adicionarVendaParaCarregamento(pCodVenda, pNumVenda) then
        Exit;
    end;
  finally
    dataSet.Cancel;
  end;
end;

function TOrdemCarregamento._adicionarMercadoriasVendasSelecionadas: Boolean;
var
  vOK: Boolean;
begin
  Result := False;
  vOK := False;
  if vCl.vVendas._dataSet.IsEmpty then
    Exit;

  try
    vDadosIni.abreStatusProcessamento('','Selecionando mercadorias das vendas');
    vItem.dataSet.CancelUpdates;

    vCl.vVendas._dataSet.First;
    while not vCl.vVendas._dataSet.Eof do
    begin
      vOK := True;
      Result := _adicionarVendaParaCarregamento(vCl.vVendas._dataSet.FieldByName('cod_venda').AsInteger, vCl.vVendas._dataSet.FieldByName('num_venda').AsInteger, False);
      vCl.vVendas._dataSet.Next;
    end;
    if not vOK then
      Application.MessageBox('Nenhuma mercadoria adicionada', 'Atenção', 64);

    Result := True;
  finally
    vDadosIni.fechaStatusProcessamento;
  end;
  
end;

function TOrdemCarregamento._adicionarRemoverMercadorias: Boolean;
begin
  Result := False;

  try

    if not vDadosIni.PesqPros('OCR043', 'EXCLUIR', '', 'CARGA',
      dataSet.FieldByName('COD_CARGA').AsString, buscas, True) then
      exit;

    _verificarNovasVendas;

    if not Edit then
      raiseExceptionCreate('Não foi possível alterar o registro','');

    vDadosIni.abreForm('Mercadorias da Ordem de Carregamento', frmCadOrdemCarregamento.pnItens, [ofAlignAllClientWinCtrl, ofEscapeExit]);
//    _abreFormItens;

    dataSet.Cancel;

    Result := True;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
    end;
  end;

end;

function TOrdemCarregamento._adicionarVendaParaCarregamento(
  pCodigoVenda: Integer = 0; pNumVenda: Integer = 0; pAplicarPost: Boolean = True): Boolean;
var
  I: Integer;
  vTemp: string;
begin

  Result := False;

  if _ordemCarregamentoFechada then
  begin
    Application.MessageBox('Ordem de Carregamento Fechada! Não permitido modificações!', 'Atenção', 0 + 64);
    Exit;
  end;

  if not vDadosIni.PesqPros('OCR036', 'INCLUIR', 'MERCADORIAS', 'CARGA',
    dataSet.FieldByName('COD_CARGA').AsString, buscas, True) then
    exit;

  try

    fCodigoVenda := 0;
    if pCodigoVenda > 0 then
    begin
      fCodigoVenda := pCodigoVenda;
      fNumVenda := pNumVenda;
    end
    else if not _abreFormPesquisaVenda then
      Exit;

    if fCodigoVenda = 0 then
      Exit;

    if vDadosIni.vEmp.vOC_TipoControleOrdemC = 'NF' then
      vTemp := 'Nota Fiscal'
    else
      vTemp := 'Venda';

    // pesquisa se existe a venda
    vItem.dataSet.First;
    if (vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D') or (pNumVenda > 0) then
      while not vItem.dataSet.Eof do
      begin
        if vItem.dataSet.FieldByName('cod_venda').AsInteger = fCodigoVenda then
          raiseExceptionCreate(vTemp + ' N° ' + vItem.dataSet.FieldByName('num_venda').AsString + ' já consta nesta Ordem de Carregamento', '');
        vItem.dataSet.Next;
      end;

    I := 0;
    if vDadosIni.vEmp.vOC_UsarOrdemCarregamento = 'D' then
      I := _vendaEmOutraOrdemDeCarregamento(fCodigoVenda);
//      I := _vendaEmOutraOrdemDeCarregamento(vItem.dataSet.FieldByName('cod_venda').AsInteger);

    if i > 0 then
      if pCodigoVenda > 0 then
        raiseExceptionCreate(vTemp + ' N° ' + IntToStr(pNumVenda) + ' já consta Ordem de Carregamento Nº ' + IntToStr(I), '')
      else
        raiseExceptionCreate(vTemp + ' N° ' + vItem.dataSet.FieldByName('num_venda').AsString + ' já consta Ordem de Carregamento Nº ' + IntToStr(I), '');

    if vDadosIni.vEmp.vOC_TipoControleOrdemC <> 'NF' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select first 1 nped, status_ped from pedvenda' +
        ' where nped= ' + IntToStr(fCodigoVenda) + ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and tipo = ''REQ''';
      buscas.Open;

      if Trim(buscas.FieldByName('status_ped').AsString) = 'CANCELADO' then
        Exit
      else if vDadosIni.vEmp.vOC_AlterarPedComOCFech = 'N' then
        if Trim(buscas.FieldByName('status_ped').AsString) <> 'FECHADA' then
          Exit;
    end;

    buscas.Close;
    if vDadosIni.vEmp.vOC_TipoControleOrdemC = 'NF' then
    begin
      buscas.SQL.Text := 'select nfi.grupo_prod, nfi.cod_prod, p.descr_prod, p.num_fab_prod, p.peso_brut_prod,' +
        'sum(nfi.quantidade) quantidade from notafiscal_item nfi' +
        ' inner join produtos p on p.grupo_prod = nfi.grupo_prod and p.cod_prod = nfi.cod_prod' +
        ' and p.cod_empresa = nfi.cod_empresa' +
        ' where nfi.cod_nf = ' + IntToStr(fCodigoVenda) + ' and nfi.cod_empresa = '+vDadosIni.codEmpresa +
        ' and nfi.tipo_item = ''P'' group by 1,2,3,4,5';
    end
    else
    begin
      buscas.SQL.Text := 'select pp.grupo_prod, pp.cod_prod, p.descr_prod, p.num_fab_prod, p.peso_brut_prod,' +
        ' sum(pp.quant_ped_item)' +
        ' quantidade from pedvenda_prod pp' +
        ' inner join produtos p on p.grupo_prod = pp.grupo_prod and p.cod_prod = pp.cod_prod' +
        ' and p.cod_empresa = pp.cod_empresa' +
        ' where pp.nped = ' + IntToStr(fCodigoVenda) + ' and pp.cod_empresa = '+vDadosIni.codEmpresa +
        ' and pp.tipo = ''REQ'' and coalesce(pp.status, '''') <> ''CANCELADO'' group by 1,2,3,4,5';
    end;
    buscas.Open;

    if buscas.IsEmpty then
      Exit;

    try
      if pCodigoVenda = 0 then
        vDadosIni.abreStatusProcessamento('Status do Processamento', 'Importando Mercadorias...');
      buscas.FetchAll;
      buscas.First;
      I:= 0;
      while not buscas.Eof do
      begin
        Inc(i);

        if pCodigoVenda = 0 then
          vDadosIni.abreStatusProcessamento('Status do Processamento', 'Importando Mercadorias. '+ IntToStr(I)+ ' de '+IntToStr(buscas.RecordCount));
        Application.ProcessMessages;

        vItem.Insert;
        vItem.dataSet.FieldByName('cod_carga').AsInteger := dataSet.FieldByName('cod_carga').AsInteger;
        vItem.dataSet.FieldByName('grupo_prod').AsInteger := buscas.FieldByName('grupo_prod').AsInteger;
        vItem.dataSet.FieldByName('cod_prod').AsString := buscas.FieldByName('cod_prod').AsString;
        vItem.dataSet.FieldByName('descricao').AsString := buscas.FieldByName('descr_prod').AsString;
        vItem.dataSet.FieldByName('num_fab_prod').AsString := buscas.FieldByName('num_fab_prod').AsString;
        vItem.dataSet.FieldByName('cod_venda').AsInteger := fCodigoVenda;
        vItem.dataSet.FieldByName('num_venda').AsInteger := fNumVenda;
      //  vItem.dataSet.FieldByName('nitem_venda').AsInteger := fCodigoVenda;
        if vDadosIni.vEmp.vOC_TipoControleOrdemC = 'NF' then
          vItem.dataSet.FieldByName('tipo_venda').AsString := 'NF'
        else
          vItem.dataSet.FieldByName('tipo_venda').AsString := 'REQ';
        vItem.dataSet.FieldByName('quantidade_venda').AsFloat := buscas.FieldByName('quantidade').AsFloat;
        vItem.dataSet.FieldByName('peso_un').AsFloat := buscas.FieldByName('peso_brut_prod').AsFloat;
        vItem.dataSet.FieldByName('peso_total').AsFloat := vDadosIni.StrToFloatFormat(
          vItem.dataSet.FieldByName('peso_un').AsFloat * vItem.dataSet.FieldByName('quantidade_venda').AsFloat, 3);
        if (pCodigoVenda > 0) or (pNumVenda > 0) then
          vItem.dataSet.FieldByName('sel').AsString := 'S';
        vItem.Post;

        buscas.Next;
      end;
      
      if not (dataSet.State in [dsInsert, dsEdit]) then
        dataSet.Edit;

      _calcularPesoCarga;

      if pCodigoVenda = 0 then
        if vDadosIni.vEmp.vOC_TipoControleOrdemC = 'NF' then
        begin
          buscas.Close;
          buscas.SQL.Text := 'update notafiscal set cod_carga = '+IntToStr( dataSet.FieldByName('cod_carga').AsInteger )+
            ' where cod_nf = ' + IntToStr(fCodigoVenda)+ ' and cod_empresa = ' + vDadosIni.codEmpresa +
            ' and coalesce(cod_carga, 0) = 0' ;
          buscas.ExecSQL;

          buscas.Close;
          buscas.SQL.Text := 'update boletas set cod_carga = '+IntToStr( dataSet.FieldByName('cod_carga').AsInteger )+
            ' where cod_empresa = ' + vDadosIni.codEmpresa +
            ' and cod_nf in ( select cod_nf from notafiscal' +
            ' where cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa + ')';
          buscas.ExecSQL;
        end
        else
        begin
          buscas.Close;
          buscas.SQL.Text := 'update pedvenda set cod_carga = '+IntToStr( dataSet.FieldByName('cod_carga').AsInteger )+
            ' where nped = ' + IntToStr(fCodigoVenda)+ ' and cod_empresa = ' + vDadosIni.codEmpresa +
            ' and tipo = ''REQ'' and coalesce(cod_carga, 0) = 0';
          buscas.ExecSQL;

          buscas.Close;
          buscas.SQL.Text := 'update notafiscal set cod_carga = '+IntToStr( dataSet.FieldByName('cod_carga').AsInteger )+
            ' where nped = ' + IntToStr(fCodigoVenda)+ ' and cod_empresa = ' + vDadosIni.codEmpresa +
            ' and tipo_ped = ''REQ'' and coalesce(cod_carga, 0) = 0';
          buscas.ExecSQL;

          buscas.Close;
          buscas.SQL.Text := 'update boletas set cod_carga = '+IntToStr( dataSet.FieldByName('cod_carga').AsInteger )+
            ' where cod_empresa = ' + vDadosIni.codEmpresa +
            ' and cod_nf in ( select cod_nf from notafiscal' +
            ' where cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) +
            ' and cod_empresa = ' + vDadosIni.codEmpresa + ')';
          buscas.ExecSQL;
        end;

    finally
      if pCodigoVenda = 0 then
        vDadosIni.fechaStatusProcessamento;
    end;

    vDadosIni.GravaAuditoria('OCR036', 'INCLUIR', 'MERCADORIAS NUM ' + vDadosIni.vEmp.vOC_TipoControleOrdemC +
      ' ' + IntToStr(fNumVenda) + ' COD '+ IntToStr(fCodigoVenda), 'CARGA',
      dataSet.FieldByName('COD_CARGA').AsString, buscas);

    if not (dataSet.State in [dsInsert, dsEdit]) then
      dataSet.Edit;

    if pAplicarPost then
      Result :=  Post
    else
      Result := True;

    if Result then
      Edit;
    
  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro: '+E.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TOrdemCarregamento._atualizarSituacaoPedidos(pStatus: string; pExcluir, pComitar: Boolean; pSituacao: string): Boolean;
var
  vLista: TStringList;
  I: Integer;
begin
  Result := True;

  if vDadosIni.vEmp.vOC_TipoControleOrdemC <> 'REQ' then
    Exit;

  buscas.Close;
  buscas.SQL.Text := 'select distinct num_venda, tipo_venda from carga_item' +
    ' where cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) +
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;

  vLista := TStringList.Create;
  vLista.Clear;

  buscas.First;
  while not buscas.Eof do
  begin
    vLista.Add(
      IntToStr(buscas.FieldByName('num_venda').AsInteger) + '|' +
      Trim(buscas.FieldByName('tipo_venda').AsString) + '|'
      );
    buscas.Next;
  end;

  for I := 0 to vLista.Count - 1 do
  begin
    vDadosIni.informarSituacaoPedido(
      StrToInt(vDadosIni.getCampoPipe(vLista[i],1)), Trim(vDadosIni.getCampoPipe(vLista[i],2)),
      pSituacao,
      pStatus,
      '',
      buscas, pComitar, False, pExcluir);
  end;
end;

procedure TOrdemCarregamento._cadOrdemCarregamento(pTipoForm: integer);
begin
	try
    if (Trim(vDadosIni.vEmp.vOC_UsarOrdemCarregamento) = 'N') then
    begin
      Application.MessageBox('Ordem de Carregamento desabilitada no cadastro da empresa', 'Atenção', 64);
      Exit;
    end;

    if (Trim(vDadosIni.vEmp.vOC_VendedorNoSetor) = '') or
      (Trim(vDadosIni.vEmp.vOC_TipoControleOrdemC) = '') or
      (Trim(vDadosIni.vEmp.vOC_TipoPadraoEntregaOrdemC) = '') or
      (Trim(vDadosIni.vEmp.vOC_UsarOrdemCarregamento) = '') or
      (Trim(vDadosIni.vEmp.vOC_Conferencia) = '') then
    begin
      Application.MessageBox('Configurações da Ordem de Carregamento em branco no cadastro da empresa', 'Atenção', 64);
      Exit;
    end;

    vDadosIni.abreStatusProcessamento('','Abrindo Oredem de Carregamento');
    if dtmOrdemCarregamento = nil then
      dtmOrdemCarregamento := TdtmOrdemCarregamento.Create(dtmOrdemCarregamento);

    vDadosIni.vTipoForm := pTipoForm;

  //  Application.CreateForm(TfrmMontaOrdemCarregamento, frmMontaOrdemCarregamento);
  //  frmMontaOrdemCarregamento.Showmodal;
  //  Exit;

    if not vDadosIni.PesqPros('OCR028', 'CONSULTA', '', 'CARGA', '',
      dtmOrdemCarregamento.qrBuscas, False) then
    begin
      vDadosIni.fechaStatusProcessamento;
      Exit;
    end;

    if frmCadOrdemCarregamento = nil then
    begin
      if pTipoForm > 0 then
        vDadosIni.vModalOuChild := 'M';

      Application.CreateForm(TfrmCadOrdemCarregamento, frmCadOrdemCarregamento);
    end;

    if (pTipoForm > 0) and (not frmCadOrdemCarregamento.Visible) then
      frmCadOrdemCarregamento.ShowModal
    else if (not frmCadOrdemCarregamento.Visible) then
      frmCadOrdemCarregamento.Show
    else if frmCadOrdemCarregamento.FormStyle = fsMDIChild then
      frmCadOrdemCarregamento.Show
    else
      frmCadOrdemCarregamento.ShowModal;
  finally
  	vDadosIni.fechaStatusProcessamento;
  end;
end;

function TOrdemCarregamento._calcularPesoCarga: Boolean;
var
  vPesoCarga, vPesoCargaEntregue, vPesoCargaPendente: Extended;
  vPesoItem, vPesoItemEntregue, vPesoItemPendente: Extended;
  vPointer: Pointer;
begin
  vPesoCarga := 0;
  vPesoCargaEntregue := 0;
  vPesoCargaPendente := 0;
  vPointer := vItem.dataSet.GetBookmark;
  try
    vItem.dataSet.First;
    while not vItem.dataSet.Eof do
    begin
      vPesoCarga := vPesoCarga + vDadosIni.StrToFloatFormat(vItem.dataSet.FieldByName('peso_un').AsFloat *
        vItem.dataSet.FieldByName('quantidade_venda').AsFloat,3);

      vPesoItem := vDadosIni.StrToFloatFormat(vItem.dataSet.FieldByName('peso_un').AsFloat *
        vItem.dataSet.FieldByName('quantidade_venda').AsFloat,3);

      vPesoItemEntregue := 0;
//      if vItem.dataSet.FieldByName('entregue').AsString = 'P' then // Entrega parcial
//      begin
        vItem.vHistorico._filtrarHistorico(vItem.dataSet.FieldByName('nitem').AsInteger);
        vItem.vHistorico.dataSet.First;
        while not vItem.vHistorico.Eof do
        begin
          vPesoItemEntregue := vPesoItemEntregue + vItem.vHistorico.dataSet.FieldByName('quantidade_entregue').AsFloat;
          vItem.vHistorico.Next;
        end;

        vPesoItemEntregue := vDadosIni.StrToFloatFormat(vItem.dataSet.FieldByName('peso_un').AsFloat *
          vPesoItemEntregue, 3);
//      end
//      else if vItem.dataSet.FieldByName('entregue').AsString = 'T' then // Entrega total, Entrega toda de uma so vez, ou varias entregas parciais onde completa todas as quantidades
//        vPesoItemEntregue := vPesoItem;

      vPesoItemPendente := vPesoCarga - vPesoItemEntregue;

      vPesoCargaEntregue := vPesoCargaEntregue + vPesoItemEntregue;

      vPesoCargaPendente := vPesoCargaPendente + vPesoItemPendente;

      vItem.dataSet.Next;
    end;
    if dataSet.State in [dsInsert, dsEdit] then
    begin
      dataSet.FieldByName('peso_carga').AsFloat := vDadosIni.StrToFloatFormat(vPesoCarga,3);
      dataSet.FieldByName('peso_entregue').AsFloat := vDadosIni.StrToFloatFormat(vPesoCargaEntregue,3);
      dataSet.FieldByName('peso_pendente').AsFloat := vDadosIni.StrToFloatFormat(vPesoCarga - vPesoCargaEntregue,3);
    end;
  finally
    vItem.dataSet.GotoBookmark(vPointer);
  end;
end;

function TOrdemCarregamento._cargaErradoParaCarregamento: Boolean;
var
  vQtde: Extended;
  vPointer: Pointer;
begin
  Result := False;

  vPointer := vItem.dataSet.GetBookmark;
  try
    vItem.dataSet.First;
    while not vItem.dataSet.Eof do
    begin
      vQtde := 0;
      vItem.vHistorico._filtrarHistorico(vItem.dataSet.FieldByName('nitem').AsInteger);
      vItem.vHistorico.dataSet.First;
      while not vItem.vHistorico.Eof do
      begin
        vQtde := vQtde + vItem.vHistorico.dataSet.FieldByName('quantidade_entregue').AsFloat;
        vItem.vHistorico.Next;
      end;

      vItem.dataSet.Edit;
      if vDadosIni.StrToFloatFormat(vQtde, 6) <>
        vDadosIni.StrToFloatFormat(vItem.dataSet.FieldByName('quantidade_venda').AsFloat, 6) then
      begin
        Result := True;
        vItem.dataSet.FieldByName('pend').AsString := 'S';
//        if pSairSeFalse then
//        	Exit;
      end
      else
        vItem.dataSet.FieldByName('pend').AsString := '';
      vItem.Post;

      vItem.dataSet.Next;
    end;
  finally
    vItem.dataSet.GotoBookmark(vPointer);
  end;
end;

function TOrdemCarregamento._cargaPendenteParaCarregamento: Boolean;
var
  vQtde: Extended;
  vPointer: Pointer;
begin
  Result := False;

  vPointer := vItem.dataSet.GetBookmark;
  try
    vItem.dataSet.First;
    while not vItem.dataSet.Eof do
    begin
      vQtde := 0;
      vItem.vHistorico._filtrarHistorico(vItem.dataSet.FieldByName('nitem').AsInteger);
      vItem.vHistorico.dataSet.First;
      while not vItem.vHistorico.Eof do
      begin
        vQtde := vQtde + vItem.vHistorico.dataSet.FieldByName('quantidade_entregue').AsFloat;
        vItem.vHistorico.Next;
      end;

      vItem.dataSet.Edit;
      if vDadosIni.StrToFloatFormat(vQtde, 6) <
        vDadosIni.StrToFloatFormat(vItem.dataSet.FieldByName('quantidade_venda').AsFloat, 6) then
      begin
        Result := True;
        vItem.dataSet.FieldByName('pend').AsString := 'S';
//        if pSairSeFalse then
//        	Exit;
      end
      else
        vItem.dataSet.FieldByName('pend').AsString := '';
      vItem.Post;

      vItem.dataSet.Next;
    end;
  finally
    vItem.dataSet.GotoBookmark(vPointer);
  end;
end;

function TOrdemCarregamento._concluirMontagemOrdemCarregamentoPeloAssistente(
  pPasso: Smallint): Boolean;
begin

  Result := False;

  if pPasso = 2 then
  begin
    if not vCl.vVendas._avancarComVendasSelecionadas then
      Exit;
    if not _adicionarMercadoriasVendasSelecionadas then
      Exit;                                                 

    pPasso := 3;
  end;

  if pPasso = 3 then
  begin
    if not vItem._avancarComItensSelecionados then
      Exit;
    pPasso := 4;
  end;

  if (pPasso = 4) or (pPasso = 5) then
  begin
    if dataSet.FieldByName('tipo_carga').AsString = 'S' then
    begin

      if Post then
      begin
        _pesquisa(dataSet.FieldByName('cod_carga').DisplayLabel, 'Igual', IntToStr(fCodCarga),'','');
        if _fecharOrdemCarregamento then
        begin
          _abreFormImpressao;
          Result := True;
        end
        else
          Result := False;
      end
      else
        Result := False;
    end
    else
      Result := True;
  end;
end;

function TOrdemCarregamento._existeVenda(pNumVenda: Integer;
  pArmazenarNaVariavel: Boolean): Boolean;
var
  vTempInteger: Integer;
begin
  Result := False;

  if vDadosIni.vEmp.vOC_TipoControleOrdemC = 'NF' then
  begin
    vTextoCaptionTemp := 'Nota Fiscal não encontrada';
    buscas.Close;
    buscas.SQL.Text := 'select first 1 cod_nf, num_nf, data_lanc, valor_total, cod_cliente from notafiscal' +
      ' where num_nf = ' + IntToStr(pNumVenda) + ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and natureza_nf = ''S'' and tipo_nf = ''P'' order by data_lanc desc';
    buscas.Open;

    if buscas.IsEmpty then
      Exit;

    vTextoCaptionTemp := 'Venda N° ' + buscas.FieldByName('num_nf').AsString + ' - Data ' +
      FormatDateTime('dd/mm/yyyy',buscas.FieldByName('data_lanc').AsDateTime) + ' - Valor R$' +
      Format('%0.2n', [buscas.FieldByName('valor_total').AsFloat]);// + ' - Valor ' +

    fCodigoVenda := 0;
    if pArmazenarNaVariavel  then
    begin
      fCodigoVenda := buscas.FieldByName('cod_nf').AsInteger;
      fNumVenda := pNumVenda;
    end;

    vTempInteger := buscas.FieldByName('cod_nf').AsInteger;

    vTextoCaptionTemp := vTextoCaptionTemp + #13 + 'Cliente: ' +
      retornaValor('select nome_cliente||'' | Razao:''||razao as valor from clientes' +
        ' where cod_cliente = ' + IntToStr(buscas.FieldByName('cod_cliente').AsInteger)+
        ' and cod_empresa = ' + vDadosIni.codEmpresa);

    buscas.Close;
    buscas.SQL.Text := 'select count(*) valor from notafiscal_item' +
      ' where cod_nf = ' + IntToStr(vTempInteger) + ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and tipo_item = ''P''';
    buscas.Open;

    if buscas.FieldByName('valor').AsInteger <= 0 then
    begin
      vTextoCaptionTemp := 'Nota Fiscal informada sem mercadorias';
      Exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'select ci.cod_carga from carga_item ci' +
      ' inner join carga c on c.cod_carga = ci.cod_carga and c.cod_empresa = ci.cod_empresa' +
      ' where ci.cod_venda = '+IntToStr(vTempInteger) + ' and ci.tipo_venda = ''NF'' and ci.cod_empresa = '+ vDadosIni.codEmpresa +
      ' and ci.cod_carga <> ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) + ' and c.tipo_carga = ''D''';
    buscas.Open;

    if vDadosIni.vEmp.vOC_UsarOrdemCarregamento <> 'S' then
      if buscas.FieldByName('cod_carga').AsInteger > 0 then
      begin
        vTextoCaptionTemp := 'Nota Fiscal já adicionada a carga Nº '+IntToStr(buscas.FieldByName('cod_carga').AsInteger);
        Exit;
      end;

    Result := True;
  end
  else
  begin
    vTextoCaptionTemp := 'Venda não encontrada';
    buscas.Close;
    buscas.SQL.Text := 'select first 1 nped, data_fech, valor_total, cod_cliente, status_ped from pedvenda' +
      ' where nped= ' + IntToStr(pNumVenda) + ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and tipo = ''REQ''';
//    if vDadosIni.vEmp.vOC_AlterarPedComOCFech = 'N' then
//      buscas.SQL.Text :=  buscas.SQL.Text + ' and status_ped = ''FECHADA''';
    buscas.Open;

    if buscas.IsEmpty then
      Exit;

    if Trim(buscas.FieldByName('status_ped').AsString) = 'CANCELADO' then
    begin
      vTextoCaptionTemp := 'Venda está Cancelada';
      Exit;
    end;

    if vDadosIni.vEmp.vOC_AlterarPedComOCFech = 'N' then
    begin
      if Trim(buscas.FieldByName('status_ped').AsString) = '' then
      begin
        vTextoCaptionTemp := 'Venda está Aberta, Precisa ser Fechada';
        Exit;
      end
      else if Trim(buscas.FieldByName('status_ped').AsString) <> 'FECHADA' then
      begin
        vTextoCaptionTemp := 'Venda não está Fechada';
        Exit;
      end;
    end;

    vTextoCaptionTemp := 'Venda N° ' + buscas.FieldByName('nped').AsString + ' - Data ' +
      FormatDateTime('dd/mm/yyyy',buscas.FieldByName('data_fech').AsDateTime) + ' - Valor R$' +
      Format('%0.2n', [buscas.FieldByName('valor_total').AsFloat]);// + ' - Valor ' +

    fCodigoVenda := 0;
    if pArmazenarNaVariavel  then
    begin
      fCodigoVenda := buscas.FieldByName('nped').AsInteger;
      fNumVenda := pNumVenda;
    end;

    vTempInteger := buscas.FieldByName('nped').AsInteger;

    vTextoCaptionTemp := vTextoCaptionTemp + #13 + 'Cliente: ' +
      retornaValor('select nome_cliente||'' | Razao:''||razao as valor from clientes' +
        ' where cod_cliente = ' + IntToStr(buscas.FieldByName('cod_cliente').AsInteger)+
        ' and cod_empresa = ' + vDadosIni.codEmpresa);

    buscas.Close;
    buscas.SQL.Text := 'select count(*) valor from pedvenda_prod' +
      ' where nped = ' + IntToStr(vTempInteger) + ' and cod_empresa = ' + vDadosIni.codEmpresa +
      ' and tipo = ''REQ''';
    buscas.Open;

    if buscas.FieldByName('valor').AsInteger <= 0 then
    begin
      vTextoCaptionTemp := 'Venda informada sem mercadorias';
      Exit;
    end;

    buscas.Close;
    buscas.SQL.Text := 'select ci.cod_carga from carga_item ci' +
      ' inner join carga c on c.cod_carga = ci.cod_carga and c.cod_empresa = ci.cod_empresa' +
      ' where ci.cod_venda = '+IntToStr(vTempInteger) + ' and ci.tipo_venda = ''REQ'' and ci.cod_empresa = '+ vDadosIni.codEmpresa +
      ' and ci.cod_carga <> ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) + ' and c.tipo_carga = ''D''';;
    buscas.Open;

    if vDadosIni.vEmp.vOC_UsarOrdemCarregamento <> 'S' then
      if buscas.FieldByName('cod_carga').AsInteger > 0 then
      begin
        vTextoCaptionTemp := 'Venda já adicionada a carga Nº '+IntToStr(buscas.FieldByName('cod_carga').AsInteger);
        Exit;
      end;

    Result := True;
  end;
end;

function TOrdemCarregamento._fecharOrdemCarregamento: Boolean;
var
  vDatahora: TDateTime;
begin
  Result := False;

  if _ordemCarregamentoFechada then
  begin
    Application.MessageBox('Ordem de Carregamento Fechada! Não permitido modificações!', 'Atenção', 0 + 64);
    Exit;
  end;

  if not vDadosIni.PesqPros('OCR038', 'FECHAR', 'CARGA ' + dataSet.FieldByName('COD_CARGA').AsString, 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas, False) then
    Exit;

  _verificarNovasVendas;

  try

    if _vendasEmAberto then
      raise exception.create(fTemp);

    if Trim(dataSet.FieldByName('tipo_entrega').AsString) = '' then
      raise exception.create('Tipo de Entrega deve ser informado');

    if Trim(dataSet.FieldByName('conferir').AsString) = '' then
      if Trim(dataSet.FieldByName('tipo_carga').AsString) = 'D' then
        if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
          raise exception.create('Informe se o carregamento deverá ser conferido');

    if Trim(dataSet.FieldByName('tipo_carga').AsString) = 'D' then
      if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'PARCIAL' then
      begin
        if _cargaPendenteParaCarregamento then
          raise exception.create('Mercadorias ainda não foram entregues. Confira a relação de mercadorias');
      end
      else if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
        if Trim(dataSet.FieldByName('conferir').AsString) = 'S' then
          if _cargaPendenteParaCarregamento then
            raise exception.create('Mercadorias ainda não foram conferidas. Confira a relação de mercadorias');

    if vDadosIni.StrToFloatFormat(dataSet.FieldByName('peso_max').AsFloat,3) > 0 then
      if (vDadosIni.StrToFloatFormat(dataSet.FieldByName('peso_max').AsFloat,3) <
        vDadosIni.StrToFloatFormat(dataSet.FieldByName('peso_carga').AsFloat,3)) then
      begin
        Application.MessageBox(pchar('Peso da carga excede o máximo permitido!' + #13 +
          'Peso da carga: ' + Format('%0.3f',[dataSet.FieldByName('peso_carga').AsFloat]) + #13 +
          'Peso máximo permitido: ' + Format('%0.3f',[dataSet.FieldByName('peso_max').AsFloat]) ), 'Atenção', 0 + 64);
        if not vDadosIni.PesqPros('OCR042', 'FECHAR', 'CARGA ' + dataSet.FieldByName('COD_CARGA').AsString, 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas, False) then
          Exit
        else if Application.MessageBox('Deseja continuar mesmo assim', 'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
          Exit;
      end;    

    Edit;
    
    if vItem.dataSet.IsEmpty then
      raiseExceptionCreate('Sem mercadorias na Ordem de Carregamento','');

    dataSet.FieldByName('DATA_FECHAMENTO').AsDateTime := vDadosIni.getDataBanco(buscas);
    dataSet.FieldByName('STATUS').AsString := 'FECHADA';

    vDatahora := vDadosIni.getDataHoraBanco(buscas);
    if (Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL') or
      (Trim(dataSet.FieldByName('tipo_carga').AsString) = 'S') then
      if (Trim(dataSet.FieldByName('conferir').AsString) <> 'S') or
        (Trim(dataSet.FieldByName('tipo_carga').AsString) = 'S') then
      begin
        vItem.vHistorico.dataSet.Filtered := false;
        while not vItem.vHistorico.dataSet.IsEmpty do
          vItem.vHistorico.dataSet.Delete;

        vItem.dataSet.First;
        while not vItem.dataSet.Eof do
        begin
          if not _informarQtdeParaHistorico(vItem.dataSet.FieldByName('quantidade_venda').AsFloat) then
            Exit;
          vItem.dataSet.Next;
        end;

      end;
            
    _calcularPesoCarga;
    dataSet.Post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      if (vItem.DataSet.ChangeCount > 0) then
        result := vItem.Apply;

    if result then
      if (vItem.vHistorico.DataSet.ChangeCount > 0) then
        result := vItem.vHistorico.Apply;

    _atualizarSituacaoPedidos('Finalizado');

    if result then
      result := CommitaTransacao;

    if Result then
    begin
      CommitaTransacao;
      Application.MessageBox('Fechamento concluído com sucesso!', 'Atenção', 0 + 64);
      vDadosIni.GravaAuditoria('OCR038', 'FECHAR', 'SUCESSO', 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('OCR038', 'FECHAR', 'FALHA', 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas);
    end;

  except on E: Exception do
    begin
      dataSet.Cancel;
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;

end;

function TOrdemCarregamento._getQtdePendente: Extended;
var
  vValor: Extended;
begin
  vValor := 0;
  vItem.vHistorico._filtrarHistorico(vItem.dataSet.FieldByName('nitem').AsInteger);
  vItem.vHistorico.dataSet.First;
  while not vItem.vHistorico.dataSet.Eof do
  begin
    vValor := vValor + vItem.vHistorico.dataSet.FieldByName('QUANTIDADE_ENTREGUE').AsFloat;
    vItem.vHistorico.dataSet.Next;
  end;
  Result := vItem.dataSet.FieldByName('QUANTIDADE_VENDA').AsFloat - vValor;
end;

function TOrdemCarregamento._gravarDadosCarregamentoEntrega: Boolean;
var
  vCodEntrega : Integer;
  vDataHora: TDateTime;
begin
  Result := False;

  vDataHora := vDadosIni.getDataHoraBanco(buscas);
  if dataSet.State in [dsInsert, dsEdit] then
    dataSet.FieldByName('data_carregamento').AsDateTime := StrToDate(FormatDateTime('dd/mm/yyyy', vDataHora ));

  vCodEntrega := Gencodigo('ENTREGA', dtmOrdemCarregamento.SpIncCodigo,vDadosIni.codEmpresa);

  vItem.vHistorico.dataSet.Filtered := False;
  while not vItem.vHistorico.dataSet.Eof do
  begin
    if vItem.vHistorico.dataSet.FieldByName('cod_entrega').AsInteger = 0 then
    begin
      vItem.vHistorico.dataSet.Edit;
      vItem.vHistorico.dataSet.FieldByName('cod_entrega').AsInteger := vCodEntrega;
      vItem.vHistorico.dataSet.FieldByName('data_entrega').AsDateTime := fDATA_ENTREGA;
      vItem.vHistorico.dataSet.FieldByName('data_hora_carregamento').AsDateTime := vDataHora;
      vItem.vHistorico.dataSet.FieldByName('data_carregamento').AsDateTime := StrToDate(FormatDateTime('dd/mm/yyyy', vDataHora ));
      vItem.vHistorico.dataSet.Post;
    end;
    vItem.vHistorico.dataSet.Next;
  end;
  Result := True;

end;

function TOrdemCarregamento._impressao(pTipo: string): Boolean;
begin

  if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
  begin
    if pTipo = '01' then
      _imprimirSintesePedidos(pTipo)
    else if pTipo = '02' then
      _imprimirRelacaoEntrega;
  end
  else
  begin
    if (pTipo = '01') or (pTipo = '04') or (pTipo = '05') or (pTipo = '06') then
      _imprimirSintesePedidos(pTipo)
    else if (pTipo = '02') or (pTipo = '03') then
      _imprimirRelacaoEntrega(pTipo);
  end;
end;

function TOrdemCarregamento._imprimirRelacaoEntrega(pTipo: string = ''): Boolean;
var
  vRel: TRDprint;
  vLinha, vPagina, vColunas, vLinhasRel: Smallint;
  vDataHora: TDateTime;
  vValorAcumulado: Extended;
  I, J, vCodTemp, vCodTempVnd: Integer;
  vLista: TStringList;
  vTemp, vTempVND, vTempParcelasBol: string;
  vOK: Boolean;
  L: Integer;
  vSomaDetalhe: Extended;
  vFonte: TTipoFonte;
  _dataSetTemp: TClientDataSet;
  vValorRecPed: Double;

  procedure _montarCabecalho;
  begin
    vLinha := 1;
    vDataHora := vDadosIni.getDataHoraBanco(buscas);
    Inc(vPagina);
    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);

    vRel.Impf(vLinha, 001, vDadosIni.vEmp.vnomeEmpresa, [negrito]);
    vRel.Impf(vLinha, 044, '   CNPJ: ' + vDadosIni.vEmp.vCNPJ, []);
    vRel.Impf(vLinha, 077, '     Insc. Est.: ' + vDadosIni.vEmp.vIE, []);
    vRel.Impf(vLinha, 115, ' Pag: ' + vDadosIni.StrZero(vPagina,4), []);
    Inc(vLinha);

    vRel.Impf(vLinha, 001, 'RELACAO DE PEDIDOS/NOTAS PARA ENTREGA', [negrito]);
    vRel.Impf(vLinha, 041, '    Numero: ' + vDadosIni.StrZero(dataSet.FieldByName('cod_carga').AsInteger, 7), []);
    vRel.Impf(vLinha, 082, '    Status: ' + dataSet.FieldByName('status').AsString, []);
    vRel.Impf(vLinha, 115, FormatDateTime('dd/mm/yyyy', vDataHora), []);
    Inc(vLinha);

    if vImp_Descricao then
    begin
      vRel.Impf(vLinha, 001, dataSet.FieldByName('descricao').AsString, []);
      Inc(vLinha);
    end;

    vRel.Impf(vLinha, 001, 'Motorista..: ' + fImp_NomeMotorista, []);
    vRel.Impf(vLinha, 041, '   Veiculo: ' + fImp_ModeloVeiculo, []);
    vRel.Impf(vLinha, 082, '  Peso Max: ' + Format('%0.3f',[dataSet.FieldByName('peso_max').AsFloat]), []);
    vRel.Impf(vLinha, 115, '  ' + FormatDateTime('hh:mm:ss', vDataHora), []);
    Inc(vLinha);

    vRel.Impf(vLinha, 001, 'Faturista..: ' + fImp_NomeFaturista, []);
    vRel.Impf(vLinha, 041, '     Setor: ' + fImp_Setor, []);
    vRel.Impf(vLinha, 082, 'Peso Carga: ' + Format('%0.3f',[dataSet.FieldByName('peso_carga').AsFloat]), []);
    Inc(vLinha);

    vRel.Impf(vLinha, 001, 'Conferente.: ' + fImp_NomeConferente, []);
    if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
      if Trim(dataSet.FieldByName('data_carregamento').AsString) <> '' then
        vRel.Impf(vLinha, 075, 'Data Carregamento: ' + FormatDateTime( 'dd/mm/yyyy', dataSet.FieldByName('data_carregamento').AsDateTime) , []);
    Inc(vLinha);

    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);

    if vImp_Detalhado then
      vRel.Impf(vLinha, 1, 'Codigo  Nome                                Cidade / Localidade   Endereco', [negrito])
    else if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
      vRel.Impf(vLinha, 1, 'Codigo  Nome                                Cidade                Num Ped      Valor Data Ped', [negrito])
    else
      vRel.Impf(vLinha, 1, 'Codigo  Nome                                Cidade                Num Ped            Data Ped', [negrito]);
    Inc(vLinha);

    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);

  end;

begin
//  if Trim(cadOrdemC.dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
//  begin
//    RadioGroup1.Items.Add('01 - Sintese de Pedidos/Nota Fiscal');
//    if Trim(cadOrdemC.dataSet.FieldByName('status').AsString) = 'FECHADA' then
//      RadioGroup1.Items.Add('02 - Relação de Mercadorias para Entrega');
//  end
//  else
//  begin
//    RadioGroup1.Items.Add('01 - Sintese de Pedidos/Nota Fiscal');
//    RadioGroup1.Items.Add('02 - Relação de Mercadorias para Entrega - Último Carregamento');
//    RadioGroup1.Items.Add('03 - Relação de Mercadorias para Entrega - Selecionar Carregamentos');
//    RadioGroup1.Items.Add('04 - Sintese de Pedidos/Nota Fiscal a entregar');
//    RadioGroup1.Items.Add('05 - Sintese de Pedidos/Nota Fiscal entregues');
//    if Trim(cadOrdemC.dataSet.FieldByName('status').AsString) = 'FECHADA' then
//      RadioGroup1.Items.Add('06 - Sintese de Pedidos/Nota Fiscal entregues - Fechamento');
//  end;


  fBuscas2 := TIBQuery(dtmOrdemCarregamento.qrBuscas2);
  fBuscas3 := TIBQuery(dtmOrdemCarregamento.qrBuscas3);

  vColunas := 125;
  vLinhasRel := 66;
  vPagina := 0;
  vRel:=TRDprint.Create(Application);
  if not vDadosIni.ModImp(vRel) then
    exit;
  vRel.FonteTamanhoPadrao := S17cpp;
  vRel.TamanhoQteColunas := vColunas;
  vRel.TamanhoQteLinhas := vLinhasRel;
  vRel.CaptionSetup := 'Configurações de Impressão';
  vRel.OpcoesPreview.CaptionPreview := 'Relação de Pedidos/Notas para Entrega';
  vRel.TitulodoRelatorio := 'Relação de Pedidos/Notas para Entrega';
  vDadosIni._LimparVarSendEmail;
  vRel.OnSendMail := vDadosini._SendMailRdPrint;
  vRel.OpcoesPreview.Preview := True;
  if not vRel.EstaAberto then
    vRel.Abrir;

  // Definindo valores das variaveis de impressao
  buscas.Close;
  buscas.SQL.Text := 'select nome_vendedor from colaborador' +
    ' where cod_vendedor = ' + IntToStr(dataSet.FieldByName('cod_motorista').AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  fImp_NomeMotorista := Trim(buscas.FieldByName('nome_vendedor').AsString);
  
  buscas.Close;
  buscas.SQL.Text := 'select nome_vendedor from colaborador' +
    ' where cod_vendedor = ' + IntToStr(dataSet.FieldByName('cod_faturista').AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  fImp_NomeFaturista := Trim(buscas.FieldByName('nome_vendedor').AsString);

  buscas.Close;
  buscas.SQL.Text := 'select nome_vendedor from colaborador' +
    ' where cod_vendedor = ' + IntToStr(dataSet.FieldByName('cod_conferente').AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  fImp_NomeConferente := Trim(buscas.FieldByName('nome_vendedor').AsString);

  buscas.Close;
  buscas.SQL.Text := 'select placa||'' - ''||modelo as modelo from veiculos_transporte' +
    ' where cod_veic = ' + IntToStr(dataSet.FieldByName('cod_veic').AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  fImp_ModeloVeiculo := Trim(buscas.FieldByName('modelo').AsString);

  buscas.Close;
  buscas.SQL.Text := 'select setor from setor' +
    ' where cod_setor = ' + IntToStr(dataSet.FieldByName('cod_setor').AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  fImp_Setor := Trim(buscas.FieldByName('setor').AsString);

  _montarCabecalho;

  fBuscas2.Close;
  fBuscas2.SQL.Text := 'select first 1 tipo_venda from carga_item' +
    ' where cod_carga = '+IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+
    ' and cod_empresa = ' + vDadosIni.codEmpresa;
  fBuscas2.Open;


  if Trim(fBuscas2.FieldByName('tipo_venda').AsString) = 'NF' then
  begin
    vTempVND := 'NF';
    fBuscas2.Close;
    fBuscas2.SQL.Text := 'select cl.cod_cliente,  cl.nome_cliente, cl.razao, cl.cidade, nf.data_lanc, ci.cod_venda, ci.num_venda, ci.tipo_venda,' +
      ' cl.endereco, cl.num_end_cliente, cl.complemento, cl.bairro, l.localidade, '''' obs_cxl_rq, (sum(nf.valor_total) / count(nf.valor_total)) valor_total from carga c' +
      ' inner join carga_item ci on ci.cod_carga = c.cod_carga and ci.cod_empresa = c.cod_empresa' +
      ' inner join notafiscal nf on nf.cod_nf = ci.cod_venda and c.cod_empresa = ci.cod_empresa' +
      ' left join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
      ' left join localidade l on l.cod_localidade = cl.cod_localidade and l.cod_empresa = cl.cod_empresa' ;
  end
  else
  begin
    vTempVND := Trim(fBuscas2.FieldByName('tipo_venda').AsString);
    fBuscas2.Close;
    fBuscas2.SQL.Text := 'select cl.cod_cliente,  cl.nome_cliente, cl.razao, cl.cidade, p.data_fech data_lanc, ci.cod_venda, ci.num_venda, ci.tipo_venda,' +
      ' cl.endereco, cl.num_end_cliente, cl.complemento, cl.bairro, l.localidade, p.obs_cxl_rq,' + IfThen(vImp_OrdenarPorRota, ' rc.ordem,') +
      ' (sum(p.valor_total) / count(p.valor_total)) valor_total from carga c' +
      ' inner join carga_item ci on ci.cod_carga = c.cod_carga and ci.cod_empresa = c.cod_empresa' +
      ' inner join pedvenda p on p.nped = ci.num_venda and p.cod_empresa = ci.cod_empresa and p.tipo = ci.tipo_venda' +
      ' left join clientes cl on cl.cod_cliente = p.cod_cliente and cl.cod_empresa = p.cod_empresa' +
      ' left join localidade l on l.cod_localidade = cl.cod_localidade and l.cod_empresa = cl.cod_empresa' +
      IfThen(vImp_OrdenarPorRota, ' left join rotas_entr_cliente rc on rc.cod_rota = c.cod_rota and rc.cod_empresa = c.cod_empresa and rc.cod_cliente = p.cod_cliente and rc.end_doc_add_seqid = coalesce(p.dest_seqid, 0)');
  end;

  if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
    fBuscas2.SQL.Text :=  fBuscas2.SQL.Text +
      ' where c.cod_carga = '+IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+' and c.cod_empresa = ' + vDadosIni.codEmpresa +
      ' group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14' + IfThen(vImp_OrdenarPorRota, ',15')
  else
  begin
    if pTipo = '02' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'select first 1 cod_entrega from carga_item_historico' +
        ' where cod_carga = '+IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' order by data_hora_carregamento desc';
      buscas.Open;
      vImp_Entregas := IntToStr(buscas.FieldByName('cod_entrega').AsInteger);
    end
    else if pTipo = '03' then
    begin
      vImp_Entregas := '';
      vEnt.dataSet.First;
      while not vEnt.dataSet.Eof do
      begin
        if vEnt.dataSet.FieldByName('sel').AsString = 'S' then
          vImp_Entregas := ',' + IntToStr(vEnt.dataSet.FieldByName('cod_entrega').AsInteger) + vImp_Entregas;
        vEnt.dataSet.Next;
      end;
      if vImp_Entregas <> '' then
        System.Delete(vImp_Entregas, 1, 1)
      else
        vImp_Entregas := '0';
    end;

    fBuscas2.SQL.Text :=  fBuscas2.SQL.Text +
      ' inner join carga_item_historico ch on ch.cod_carga = ci.cod_carga and ch.cod_empresa = ci.cod_empresa and ch.nitem = ci.nitem' +
      ' where c.cod_carga = '+IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+' and c.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and ch.cod_entrega in (' + vImp_Entregas + ')' +
      ' group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14'+ IfThen(vImp_OrdenarPorRota, ',15');
  end;
  if (vImp_OrdenarPorCliente) and (vImp_NomeFantasia) then
    fBuscas2.SQL.Text :=  fBuscas2.SQL.Text +  ' order by cl.nome_cliente, cl.cod_cliente, ci.num_venda'
  else if (vImp_OrdenarPorCliente) and (not vImp_NomeFantasia) then
    fBuscas2.SQL.Text :=  fBuscas2.SQL.Text +  ' order by cl.razao, cl.cod_cliente, ci.num_venda'
  else if (vImp_OrdenarPorCidade) then
    fBuscas2.SQL.Text :=  fBuscas2.SQL.Text +  ' order by cl.cidade, cl.cod_cliente, ci.num_venda'
  else if (vImp_OrdenarPorNumVenda) then
    fBuscas2.SQL.Text :=  fBuscas2.SQL.Text +  ' order by ci.num_venda'
  else if (vImp_OrdenarPorRota) then
    fBuscas2.SQL.Text :=  fBuscas2.SQL.Text +  ' order by rc.ordem'
  else
    fBuscas2.SQL.Text :=  fBuscas2.SQL.Text +  ' order by l.localidade, cl.cod_cliente, ci.num_venda';
  fBuscas2.Open;

  vValorAcumulado := 0;
  I := 0;
  vCodTemp := 0;

  fBuscas2.First;
  while not fBuscas2.Eof do
  begin
    if (vLinha + 2) >= vLinhasRel then
    begin
      Inc(vLinha);
      vRel.Impf(vLinha, 001, 'Acumulado', [negrito]);
      vRel.Impf(vLinha, 067, vDadosIni.AlnDir(IntToStr(I), 11), [negrito]);
      if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
        if vImp_Detalhado then
          vRel.Impf(vLinha, 018, Format('%0.2m', [vValorAcumulado]), [negrito])
        else
          vRel.Impf(vLinha, 079, vDadosIni.AlnDir(Format( '%0.2f', [vValorAcumulado]), 11), [negrito]);

      vRel.Novapagina;
      _montarCabecalho;
    end;

    if (vCodTemp = 0) or (vCodTemp <> fBuscas2.FieldByName('cod_cliente').AsInteger) or (not vImp_Detalhado) then
    begin
      if (vCodTemp <> 0) and (vImp_Detalhado) then
      begin
        vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
        Inc(vLinha);
      end;
      
      vCodTemp := fBuscas2.FieldByName('cod_cliente').AsInteger;

      if vImp_Detalhado then
        vFonte:= negrito
      else
        vFonte := comp17;

      vRel.Impf(vLinha, 001, vDadosIni.StrZero(fBuscas2.FieldByName('cod_cliente').AsInteger,7), [vFonte]);
      if (vImp_NomeFantasia) then
        vRel.Impf(vLinha, 009, Copy(Trim(fBuscas2.FieldByName('nome_cliente').AsString), 1, 35), [vFonte])
      else
        vRel.Impf(vLinha, 009, Copy(Trim(fBuscas2.FieldByName('razao').AsString), 1, 35), [vFonte]);
      vRel.Impf(vLinha, 045, Copy(Trim(fBuscas2.FieldByName('cidade').AsString), 1, 21), [vFonte]);
      if vImp_Detalhado then
      begin
        vRel.Impf(vLinha, 067, Trim(fBuscas2.FieldByName('endereco').AsString) + ', ' +
          Trim(fBuscas2.FieldByName('num_end_cliente').AsString) + ' ' +
          Trim(fBuscas2.FieldByName('complemento').AsString),[vFonte]);
        Inc(vLinha);

        if Trim(fBuscas2.FieldByName('localidade').AsString) = '' then
          vRel.Impf(vLinha, 054, '*',[vFonte])
        else
          vRel.Impf(vLinha, 054, Trim(fBuscas2.FieldByName('localidade').AsString),[vFonte]);
        vRel.Impf(vLinha, 086, 'B: ' + Trim(fBuscas2.FieldByName('bairro').AsString),[vFonte]);
      end
      else
      begin
        vRel.Impf(vLinha, 067, vDadosIni.StrZero(fBuscas2.FieldByName('num_venda').AsInteger, 7), []);
        if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
          vRel.Impf(vLinha, 074, vDadosIni.AlnDir(Format( '%0.2f', [fBuscas2.FieldByName('valor_total').AsFloat]), 11), []);
        vRel.Impf(vLinha, 086, FormatDateTime('dd/mm/yyyy', fBuscas2.FieldByName('data_lanc').AsDateTime), []);
      end;

    end;


    if Trim(fBuscas2.FieldByName('tipo_venda').AsString) = 'NF' then
    begin
      fBuscas3.Close;
      if ((vImp_DetalhadoRecPed) and (Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL')) then
        fBuscas3.SQL.Text := ' select fp.cod_controle, co.nome_ctrl, co.usar_boleto, 1 qtde, sum(coalesce(fp.valordoc, 0)) valordoc from notafiscal nf' +
          ' inner join formpagamento fp on fp.num_nota = nf.num_nf and cast(fp.sub_serie as varchar(5)) = nf.serie and fp.cod_empresa = nf.cod_empresa' +
          ' inner join controles co on co.codigo_ctrl = fp.cod_controle and co.codigo_emp = fp.cod_empresa' +
          ' where nf.cod_nf = ' + IntToStr(fBuscas2.FieldByName('cod_venda').AsInteger)+
          ' and nf.cod_empresa = ' + vDadosIni.codEmpresa +
          ' group by 1, 2, 3, 4' +
          ' order by fp.cod_controle asc'
      else
        fBuscas3.SQL.Text := ' select first 1 fp.cod_controle, co.nome_ctrl, co.usar_boleto, count(co.nome_ctrl) qtde from notafiscal nf' +
          ' inner join formpagamento fp on fp.num_nota = nf.num_nf and cast(fp.sub_serie as varchar(5)) = nf.serie and fp.cod_empresa = nf.cod_empresa' +
          ' inner join controles co on co.codigo_ctrl = fp.cod_controle and co.codigo_emp = fp.cod_empresa' +
          ' where nf.cod_nf = ' + IntToStr(fBuscas2.FieldByName('cod_venda').AsInteger)+
          ' and nf.cod_empresa = ' + vDadosIni.codEmpresa +
          ' group by 1, 2, 3' +
          ' order by sum(fp.valordoc) desc';
      fBuscas3.Open;
      fBuscas3.FetchAll;
    end
    else
    begin
      fBuscas3.Close;
      if ((vImp_DetalhadoRecPed) and (Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL')) then
        fBuscas3.SQL.Text := ' select fp.cod_controle, co.nome_ctrl, co.usar_boleto, 1 qtde, sum(coalesce(fp.valordoc, 0)) valordoc from formpagamento fp ' +
          ' inner join controles co on co.codigo_ctrl = fp.cod_controle and co.codigo_emp = fp.cod_empresa ' +
          ' where fp.nrequisicao = ' + IntToStr(fBuscas2.FieldByName('num_venda').AsInteger)+
          ' and fp.tpdocs = ' + QuotedStr(Trim(fBuscas2.FieldByName('tipo_venda').AsString)) +
          ' and fp.cod_empresa = ' + vDadosIni.codEmpresa +
          ' group by 1, 2, 3, 4' +
          ' order by fp.cod_controle asc'
      else
        fBuscas3.SQL.Text := ' select first 1 fp.cod_controle, co.nome_ctrl, co.usar_boleto, count(co.nome_ctrl) qtde from formpagamento fp' +
          ' inner join controles co on co.codigo_ctrl = fp.cod_controle and co.codigo_emp = fp.cod_empresa' +
          ' where fp.nrequisicao = ' + IntToStr(fBuscas2.FieldByName('num_venda').AsInteger)+
          ' and fp.tpdocs = ' + QuotedStr(Trim(fBuscas2.FieldByName('tipo_venda').AsString)) +
          ' and fp.cod_empresa = ' + vDadosIni.codEmpresa +
          ' group by 1, 2, 3' +
          ' order by sum(fp.valordoc) desc';
      fBuscas3.Open;
      fBuscas3.FetchAll;
    end;

    vTempParcelasBol := '';
    if not vImp_DetalhadoRecPed then
      if Trim(fBuscas3.FieldByName('usar_boleto').AsString) = 'S' then
        if fBuscas3.FieldByName('qtde').AsInteger > 1 then
          vTempParcelasBol := fBuscas3.FieldByName('qtde').AsString + 'X ';

    if vImp_Detalhado then
    begin
      Inc(vLinha);
      if Trim(fBuscas2.FieldByName('tipo_venda').AsString) = 'NF' then
        vRel.ImpF(vLinha, 1, 'NF: ' + vdadosini.StrZero(fBuscas2.FieldByName('num_venda').AsInteger, 7),[negrito])
      else
        vRel.ImpF(vLinha, 1, 'Pedido:' + vdadosini.StrZero(fBuscas2.FieldByName('num_venda').AsInteger, 7), [negrito]);
      if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
        vRel.Impf(vLinha, 018, Format('%0.2m', [fBuscas2.FieldByName('valor_total').AsFloat]), [negrito]);
      vRel.Impf(vLinha, 036, FormatDateTime('dd/mm/yyyy', fBuscas2.FieldByName('data_lanc').AsDateTime), [negrito]);
      vRel.Impf(vLinha, 048, vDadosIni.StrZero(fBuscas3.FieldByName('cod_controle').AsInteger, 3), [negrito]);
      vRel.Impf(vLinha, 052, Trim(vTempParcelasBol + fBuscas3.FieldByName('nome_ctrl').AsString), [negrito]);
    end
    else
    begin
      if Trim(fBuscas3.FieldByName('nome_ctrl').AsString) <> '' then
      begin
        if ((vImp_DetalhadoRecPed) and (Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL')) then
        begin
          vValorRecPed := 0;
          fBuscas3.First;
          while not fBuscas3.Eof do
          begin
         	vRel.Impf(vLinha, 98, Format('%9.2f', [fBuscas3.FieldByName('valordoc').AsFloat]) + ' ' +
            	Copy(Trim(fBuscas3.FieldByName('nome_ctrl').AsString), 1, 18), []);
            vValorRecPed := vValorRecPed + fBuscas3.FieldByName('valordoc').AsFloat;
            Inc(vLinha);

            fBuscas3.Next;
          end;
          vRel.Impf(vLinha, 98, Format('%9.2f', [vValorRecPed]), [negrito]);

          fBuscas3.First;
        end
        else
        begin
          vRel.Impf(vLinha, 102, vDadosIni.StrZero(fBuscas3.FieldByName('cod_controle').AsInteger, 3), []);
          vRel.Impf(vLinha, 106, Copy(vTempParcelasBol + Trim(fBuscas3.FieldByName('nome_ctrl').AsString), 1, 19), []);
        end;
      end
      else
      begin
        vRel.Impf(vLinha, 102, Copy(Trim(fBuscas2.FieldByName('obs_cxl_rq').AsString), 1, 23), []);
      end;
    end;

    Inc(vLinha);
    Inc(I);

    vValorAcumulado := vValorAcumulado + fBuscas2.FieldByName('valor_total').AsFloat;

//    vCodTemp := fBuscas2.FieldByName('cod_cliente').AsInteger;

    if vImp_Detalhado then
    begin

      if Trim(fBuscas2.FieldByName('tipo_venda').AsString) = 'NF' then
      begin

        fBuscas3.Close;
        fBuscas3.SQL.Text :=
          'select ci.num_venda, ci.tipo_venda, p.num_fab_prod, p.descr_prod, p.unidade, p.locacao_prod, p.locacao_prod_1,' +
          ' sum(ci.quantidade_venda) quantidade, count(ci.cod_carga) from carga c' +
          ' inner join carga_item ci on ci.cod_carga = c.cod_carga and ci.cod_empresa = c.cod_empresa' +
          ' inner join produtos p on p.grupo_prod = ci.grupo_prod and p.cod_prod = ci.cod_prod and p.cod_empresa = ci.cod_empresa' +
          ' inner join notafiscal nf on nf.cod_nf = ci.cod_venda and nf.cod_empresa = ci.cod_empresa' +
          ' left join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa';

        if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'PARCIAL' then
        begin
          fBuscas3.SQL.Text := StringReplace(fBuscas3.SQL.Text, 'sum(ci.quantidade_venda)', 'sum(ch.quantidade_entregue)', [rfIgnoreCase, rfReplaceAll]);
          fBuscas3.SQL.Text :=  fBuscas3.SQL.Text +
           ' inner join carga_item_historico ch on ch.cod_carga = ci.cod_carga and ch.cod_empresa = ci.cod_empresa and ch.nitem = ci.nitem';
        end;

        fBuscas3.SQL.Text :=  fBuscas3.SQL.Text +
          ' where c.cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+
          ' and c.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and nf.cod_cliente = ' + IntToStr(fBuscas2.FieldByName('cod_cliente').AsInteger) +
          ' and nf.cod_nf = ' + IntToStr(fBuscas2.FieldByName('cod_venda').AsInteger);

        if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'PARCIAL' then
          fBuscas3.SQL.Text :=  fBuscas3.SQL.Text + ' and ch.cod_entrega in (' + vImp_Entregas + ')';

        fBuscas3.SQL.Text :=  fBuscas3.SQL.Text + ' group by 1,2,3,4,5,6,7';

        if vImp_OrdenarPorAlocacao then
          fBuscas3.SQL.Text := fBuscas3.SQL.Text + ' order by ci.num_venda, p.locacao_prod, p.locacao_prod_1, p.descr_prod'
        else if not vImp_OrdenarPorCodigo then
          fBuscas3.SQL.Text := fBuscas3.SQL.Text + ' order by ci.num_venda, p.num_fab_prod'
        else
          fBuscas3.SQL.Text := fBuscas3.SQL.Text + ' order by  p.descr_prod, ci.num_venda';
        fBuscas3.Open;

      end
      else
      begin
        fBuscas3.Close;
        fBuscas3.SQL.Text :=
          'select ci.num_venda, ci.tipo_venda, p.num_fab_prod, p.descr_prod, p.unidade, p.locacao_prod, p.locacao_prod_1,' +
          ' sum(ci.quantidade_venda) quantidade, count(ci.cod_carga) from carga c' +
          ' inner join carga_item ci on ci.cod_carga = c.cod_carga and ci.cod_empresa = c.cod_empresa' +
          ' inner join produtos p on p.grupo_prod = ci.grupo_prod and p.cod_prod = ci.cod_prod and p.cod_empresa = ci.cod_empresa' +
          ' inner join pedvenda pv on pv.nped = ci.num_venda and pv.cod_empresa = ci.cod_empresa and pv.tipo = ci.tipo_venda' +
          ' left join clientes cl on cl.cod_cliente = pv.cod_cliente and cl.cod_empresa = pv.cod_empresa';

        if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'PARCIAL' then
        begin
          fBuscas3.SQL.Text := StringReplace(fBuscas3.SQL.Text, 'sum(ci.quantidade_venda)', 'sum(ch.quantidade_entregue)', [rfIgnoreCase, rfReplaceAll]);
          fBuscas3.SQL.Text :=  fBuscas3.SQL.Text +
           ' inner join carga_item_historico ch on ch.cod_carga = ci.cod_carga and ch.cod_empresa = ci.cod_empresa and ch.nitem = ci.nitem';
        end;

        fBuscas3.SQL.Text :=  fBuscas3.SQL.Text +
          ' where c.cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+
          ' and c.cod_empresa = ' + vDadosIni.codEmpresa +
          ' and pv.cod_cliente = ' + IntToStr(fBuscas2.FieldByName('cod_cliente').AsInteger) +
          ' and pv.nped = ' + IntToStr(fBuscas2.FieldByName('cod_venda').AsInteger);
          
        if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'PARCIAL' then
          fBuscas3.SQL.Text :=  fBuscas3.SQL.Text + ' and ch.cod_entrega in (' + vImp_Entregas + ')';

        fBuscas3.SQL.Text :=  fBuscas3.SQL.Text + ' group by 1,2,3,4,5,6,7';

        if vImp_OrdenarPorAlocacao then
          fBuscas3.SQL.Text := fBuscas3.SQL.Text + ' order by ci.num_venda, p.locacao_prod, p.locacao_prod_1, p.descr_prod'
        else if not vImp_OrdenarPorCodigo then
          fBuscas3.SQL.Text := fBuscas3.SQL.Text + ' order by ci.num_venda, p.num_fab_prod'
        else
          fBuscas3.SQL.Text := fBuscas3.SQL.Text + ' order by p.descr_prod, ci.num_venda';
        fBuscas3.Open;
      end;

      fBuscas3.First;
      L:= 0;
      vSomaDetalhe:=0;

      while not fBuscas3.Eof do
      begin
        
        if (vLinha + 2) >= vLinhasRel then
        begin
          Inc(vLinha);
          vRel.Impf(vLinha, 001, 'continua...', []);
          vRel.Novapagina;
          _montarCabecalho;
        end;

        vRel.Impf(vLinha, 018, Copy(Trim(fBuscas3.FieldByName('num_fab_prod').AsString), 1, 14), []);
        vRel.Impf(vLinha, 036, Copy(Trim(fBuscas3.FieldByName('descr_prod').AsString), 1, 50), []);
        vRel.Impf(vLinha, 091, vDadosIni.AlnDir(FloatToStr( fBuscas3.FieldByName('quantidade').AsFloat), 14), []);
        vRel.Impf(vLinha, 106, Copy(Trim(fBuscas3.FieldByName('unidade').AsString), 1, 3), []);
        if vImp_ImpAlocacao then
          vRel.Impf(vLinha, 110, Trim(fBuscas3.FieldByName('locacao_prod').AsString) + ' ' + Trim(fBuscas3.FieldByName('locacao_prod_1').AsString), []);
        vSomaDetalhe := vSomaDetalhe + fBuscas3.FieldByName('quantidade').AsFloat;

        fBuscas3.Next;
        Inc(vLinha);
        Inc(L);
      end;

      vRel.Impf(vLinha, 018, 'Itens: ' + IntToStr(L), [negrito]);
      vRel.Impf(vLinha, 085, 'Soma: ' + IntToStr(L), [negrito]);
      vRel.Impf(vLinha, 091, vDadosIni.AlnDir(FloatToStr( vSomaDetalhe), 14), [negrito]);

    end;

    fBuscas2.Next;

    if not vImp_Detalhado then    
      vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
      
    Inc(vLinha);
  end;

  Inc(vLinha);
  vRel.Impf(vLinha, 001, 'Totais', [negrito]);
  vRel.Impf(vLinha, 067, vDadosIni.AlnDir(IntToStr( I), 7), [negrito]);
  if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
    if vImp_Detalhado then
      vRel.Impf(vLinha, 018, Format('%0.2m', [vValorAcumulado]), [negrito])
    else
      vRel.Impf(vLinha, 074, vDadosIni.AlnDir(Format( '%0.2f', [vValorAcumulado]), 11), [negrito]);
  Inc(vLinha);

  vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
  Inc(vLinha);

  if (vLinha + 2) >= vLinhasRel then
  begin
    vRel.Novapagina;
    _montarCabecalho;
  end;

  if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
  begin
    ///  Condições de pagamento
    vRel.Impf(vLinha, 001, 'Prazo para Pagamento', [negrito]);
    Inc(vLinha,2);

    _dataSetTemp := TClientDataSet(dtmOrdemCarregamento.cdsTempSoma);
    try
      if _dataSetTemp.Tag <> 22 then
      begin
        _dataSetTemp.CreateDataSet;
      _dataSetTemp.Tag := 22;
      _dataSetTemp.EmptyDataSet;
      _dataSetTemp.IndexDefs.Add('DVALOR', 'VALOR', [ixDescending]);
      end;
    except
    end;
    _dataSetTemp.EmptyDataSet;

    fBuscas3.Close;
    if vTempVND = 'NF' then
      fBuscas3.SQL.Text := 'select nf.cod_cond_pag, cp.desc_cond_pag, nf.cod_nf, (sum(nf.valor_total) / count(nf.valor_total)) valor_total from carga c' +
        ' inner join carga_item ci on ci.cod_carga = c.cod_carga and ci.cod_empresa = c.cod_empresa' +
        ' inner join notafiscal nf on nf.cod_nf = ci.cod_venda and c.cod_empresa = ci.cod_empresa' +
        ' inner join cond_pag cp on cp.cod_cond_pag = nf.cod_cond_pag'
    else
      fBuscas3.SQL.Text := 'select p.cod_cond_pag, cp.desc_cond_pag, p.nped, (sum(p.valor_total) / count(p.valor_total)) valor_total from carga c' +
        ' inner join carga_item ci on ci.cod_carga = c.cod_carga and ci.cod_empresa = c.cod_empresa' +
        ' inner join pedvenda p on p.nped = ci.num_venda and p.cod_empresa = ci.cod_empresa and p.tipo = ci.tipo_venda' +
        ' inner join cond_pag cp on cp.cod_cond_pag = p.cod_cond_pag' ;

    if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
      fBuscas3.SQL.Text :=  fBuscas3.SQL.Text +
        ' where c.cod_carga = '+IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+' and c.cod_empresa = ' + vDadosIni.codEmpresa +
        ' group by 1,2,3 order by 3 desc'
    else
      fBuscas3.SQL.Text :=  fBuscas3.SQL.Text +
        ' inner join carga_item_historico ch on ch.cod_carga = ci.cod_carga and ch.cod_empresa = ci.cod_empresa and ch.nitem = ci.nitem' +
        ' where c.cod_carga = '+IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+' and c.cod_empresa = ' + vDadosIni.codEmpresa +
        ' and ch.cod_entrega in (' + vImp_Entregas + ')' +
        ' group by 1,2,3 order by 3 desc';

    fBuscas3.Open;

    fBuscas3.First;
    _dataSetTemp.IndexFieldNames := 'CODIGO';
    while not fBuscas3.Eof do
    begin
      if _dataSetTemp.Locate('CODIGO', VarArrayOf([fBuscas3.FieldByName('cod_cond_pag').AsInteger]),[]) then
        _dataSetTemp.Edit
      else
        _dataSetTemp.Insert;
      _dataSetTemp.FieldByName('CODIGO').AsInteger := fBuscas3.FieldByName('cod_cond_pag').AsInteger;
      _dataSetTemp.FieldByName('DESCRICAO').AsString := fBuscas3.FieldByName('desc_cond_pag').AsString;
      _dataSetTemp.FieldByName('VALOR').AsFloat := _dataSetTemp.FieldByName('VALOR').AsFloat + fBuscas3.FieldByName('VALOR_TOTAL').AsFloat;
      _dataSetTemp.Post;

      fBuscas3.Next;
    end;
    _dataSetTemp.IndexName := 'DVALOR';

    vValorAcumulado := 0;
    _dataSetTemp.First;
    while not _dataSetTemp.Eof do
    begin
      if (vLinha + 2) >= vLinhasRel then
      begin
        Inc(vLinha);
        vRel.Impf(vLinha, 001, 'Acumulado', [negrito]);
        vRel.Impf(vLinha, 038, vDadosIni.AlnDir(Format( '%0.2f', [vValorAcumulado]), 11), [negrito]);

        vRel.Novapagina;
        _montarCabecalho;
      end;

      vRel.Impf(vLinha, 001, vDadosIni.StrZero(_dataSetTemp.FieldByName('codigo').AsInteger,3), []);
      vRel.Impf(vLinha, 005, Copy(Trim(_dataSetTemp.FieldByName('descricao').AsString), 1, 30), []);
      vRel.Impf(vLinha, 038, vDadosIni.AlnDir(Format( '%0.2f', [_dataSetTemp.FieldByName('valor').AsFloat]), 11), []);
      Inc(vLinha);
      vValorAcumulado := vValorAcumulado + _dataSetTemp.FieldByName('valor').AsFloat;

      _dataSetTemp.Next;
    end;

    vRel.Impf(vLinha, 001, 'Total', [negrito]);
    vRel.Impf(vLinha, 038, vDadosIni.AlnDir(Format( '%0.2f', [vValorAcumulado]), 11), [negrito]);
    Inc(vLinha);

    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);

  
    if (vLinha + 2) >= vLinhasRel then
    begin
      vRel.Novapagina;
      _montarCabecalho;
    end;

    ///  Formas de Pagamento
    vRel.Impf(vLinha, 001, 'Formas de Pagamento', [negrito]);
    Inc(vLinha,2);

    fBuscas3.Close;
    if vTempVND = 'NF' then
      fBuscas3.SQL.Text := 'select distinct nf.cod_nf codigo from carga c' +
        ' inner join carga_item ci on ci.cod_carga = c.cod_carga and ci.cod_empresa = c.cod_empresa' +
        ' inner join notafiscal nf on nf.cod_nf = ci.cod_venda and nf.cod_empresa = ci.cod_empresa' +
        ' where c.cod_carga = '+IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+' and c.cod_empresa = ' + vDadosIni.codEmpresa
    else
      fBuscas3.SQL.Text := 'select distinct p.nped codigo from carga c' +
        ' inner join carga_item ci on ci.cod_carga = c.cod_carga and ci.cod_empresa = c.cod_empresa' +
        ' inner join pedvenda p on p.nped = ci.num_venda and p.cod_empresa = ci.cod_empresa and p.tipo = ci.tipo_venda' +
        ' where c.cod_carga = '+IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+' and c.cod_empresa = ' + vDadosIni.codEmpresa ;
                
    fBuscas3.Open;
    fBuscas3.First;
    vImp_Entregas := '';
    while not fBuscas3.Eof do
    begin
      vImp_Entregas := ','+IntToStr(fBuscas3.FieldByName('codigo').AsInteger) + vImp_Entregas;
      fBuscas3.Next;
    end;
    if vImp_Entregas = '' then
      vImp_Entregas := '(0)'
    else
    begin
      System.Delete(vImp_Entregas,1,1);
      vImp_Entregas := '('+vImp_Entregas+')';
    end;

    fBuscas3.Close;
    if vTempVND = 'NF' then            
      fBuscas3.SQL.Text := 'select fp.cod_controle, co.nome_ctrl, sum(fp.valordoc) valor_total' +
        ' from notafiscal nf' +
        ' inner join formpagamento fp on fp.num_nota = nf.num_nf and cast(fp.sub_serie as varchar(5)) = nf.serie and fp.cod_empresa = nf.cod_empresa' +
        ' inner join controles co on co.codigo_ctrl = fp.cod_controle and co.codigo_emp = fp.cod_empresa' +
        ' where nf.cod_nf in ' + vImp_Entregas +
        ' and nf.cod_empresa = ' + vDadosIni.codEmpresa +
        ' group by 1,2 order by 3 desc'
    else
      fBuscas3.SQL.Text := 'select fp.cod_controle, co.nome_ctrl, sum(fp.valordoc) valor_total' +
        ' from pedvenda p' +
        ' inner join formpagamento fp on fp.nrequisicao = p.nped and fp.tpdocs = p.tipo and fp.cod_empresa = p.cod_empresa' +
        ' inner join controles co on co.codigo_ctrl = fp.cod_controle and co.codigo_emp = fp.cod_empresa' +
        ' where p.nped in ' + vImp_Entregas +
        ' and p.tipo = ''REQ'' ' +
        ' and p.cod_empresa = ' + vDadosIni.codEmpresa +
        ' group by 1,2 order by 3 desc';

    fBuscas3.Open;


    vValorAcumulado := 0;
    fBuscas3.First;
    while not fBuscas3.Eof do
    begin
      if (vLinha + 2) >= vLinhasRel then
      begin
        Inc(vLinha);
        vRel.Impf(vLinha, 001, 'Acumulado', [negrito]);
        vRel.Impf(vLinha, 038, vDadosIni.AlnDir(Format( '%0.2f', [vValorAcumulado]), 11), [negrito]);

        vRel.Novapagina;
        _montarCabecalho;
      end;

      vRel.Impf(vLinha, 001, vDadosIni.StrZero(fBuscas3.FieldByName('cod_controle').AsInteger,3), []);
      vRel.Impf(vLinha, 005, Copy(Trim(fBuscas3.FieldByName('nome_ctrl').AsString), 1, 30), []);
      vRel.Impf(vLinha, 038, vDadosIni.AlnDir(Format( '%0.2f', [fBuscas3.FieldByName('valor_total').AsFloat]), 11), []);
      Inc(vLinha);
      vValorAcumulado := vValorAcumulado + fBuscas3.FieldByName('valor_total').AsFloat;

      fBuscas3.Next;
    end;

    vRel.Impf(vLinha, 001, 'Total', [negrito]);
    vRel.Impf(vLinha, 038, vDadosIni.AlnDir(Format( '%0.2f', [vValorAcumulado]), 11), [negrito]);
    Inc(vLinha);
    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
  end;

  vRel.Fechar;
end;

function TOrdemCarregamento._imprimirSintesePedidos(pTipo: string): Boolean;
var
  vRel: TRDprint;
  vLinha, vPagina, vColunas, vLinhasRel: Smallint;
  vDataHora: TDateTime;
  vQuantidadeAcumulada, vPesoAcumulado: Extended;
  I, J: Integer;
  vLista: TStringList;
  vTemp: string;
  vOK: Boolean;

  procedure _montarCabecalho;
  begin
    vLinha := 1;
    vDataHora := vDadosIni.getDataHoraBanco(buscas);
    Inc(vPagina);
    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);

    vRel.Impf(vLinha, 001, vDadosIni.vEmp.vnomeEmpresa, [negrito]);
    vRel.Impf(vLinha, 044, '   CNPJ: ' + vDadosIni.vEmp.vCNPJ, []);
    vRel.Impf(vLinha, 077, '     Insc. Est.: ' + vDadosIni.vEmp.vIE, []);
    vRel.Impf(vLinha, 115, ' Pag: ' + vDadosIni.StrZero(vPagina,4), []);
    Inc(vLinha);

    vRel.Impf(vLinha, 001, 'SINTESE DE PEDIDOS/NOTA FISCAL', [negrito]);
    vRel.Impf(vLinha, 041, '    Numero: ' + vDadosIni.StrZero(dataSet.FieldByName('cod_carga').AsInteger, 7), []);
    vRel.Impf(vLinha, 082, '    Status: ' + dataSet.FieldByName('status').AsString, []);
    vRel.Impf(vLinha, 115, FormatDateTime('dd/mm/yyyy', vDataHora), []);
    Inc(vLinha);

    if vImp_Descricao then
    begin
      vRel.Impf(vLinha, 001, dataSet.FieldByName('descricao').AsString, []);
      Inc(vLinha);
    end;

    vRel.Impf(vLinha, 001, 'Motorista..: ' + fImp_NomeMotorista, []);
    vRel.Impf(vLinha, 041, '   Veiculo: ' + fImp_ModeloVeiculo, []);
    vRel.Impf(vLinha, 082, '  Peso Max: ' + Format('%0.3f',[dataSet.FieldByName('peso_max').AsFloat]), []);
    vRel.Impf(vLinha, 115, '  ' + FormatDateTime('hh:mm:ss', vDataHora), []);
    Inc(vLinha);

    vRel.Impf(vLinha, 001, 'Faturista..: ' + fImp_NomeFaturista, []);
    vRel.Impf(vLinha, 041, '     Setor: ' + fImp_Setor, []);
    vRel.Impf(vLinha, 082, 'Peso Carga: ' + Format('%0.3f',[dataSet.FieldByName('peso_carga').AsFloat]), []);
    Inc(vLinha);

    vRel.Impf(vLinha, 001, 'Conferente.: ' + fImp_NomeConferente, []);
    if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'PARCIAL' then
    begin
      if pTipo = '01' then      
        vRel.Impf(vLinha, 041, '      Tipo: Todos', [])
      else if pTipo = '04' then
        vRel.Impf(vLinha, 041, '      Tipo: A Entregar', [])
      else if pTipo = '05' then
        vRel.Impf(vLinha, 041, '      Tipo: Entregues', [])
      else if pTipo = '06' then
        vRel.Impf(vLinha, 041, '      Tipo: Fechamento', []);
    end
    else if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
      if Trim(dataSet.FieldByName('data_carregamento').AsString) <> '' then
        vRel.Impf(vLinha, 075, 'Data Carregamento: ' + FormatDateTime( 'dd/mm/yyyy', dataSet.FieldByName('data_carregamento').AsDateTime) , []);
    Inc(vLinha);

    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);

    vRel.Imp(vLinha, 1, 'Codigo         Descricao                                              Quantidade     Un            Peso    Alocacao 1 e 2');
    Inc(vLinha);

    vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
    Inc(vLinha);

  end;

begin
  fBuscas2 := TIBQuery(dtmOrdemCarregamento.qrBuscas2);

  vColunas := 125;
  vLinhasRel := 66;
  vPagina := 0;
  vRel:=TRDprint.Create(Application);
  if not vDadosIni.ModImp(vRel) then
   exit;
  vRel.FonteTamanhoPadrao := S17cpp;
  vRel.TamanhoQteColunas := vColunas;
  vRel.TamanhoQteLinhas := vLinhasRel;
  vRel.CaptionSetup := 'Configurações de Impressão';
  vRel.OpcoesPreview.CaptionPreview := 'Sintese de Pedidos/Nota Fiscal';
  vRel.TitulodoRelatorio := 'Sintese de Pedidos/Nota Fiscal';
  vDadosIni._LimparVarSendEmail;
  vRel.OnSendMail := vDadosini._SendMailRdPrint;
  vRel.OpcoesPreview.Preview := True;
  if not vRel.EstaAberto then
    vRel.Abrir;

  // Definindo valores das variaveis de impressao
  buscas.Close;
  buscas.SQL.Text := 'select nome_vendedor from colaborador' +
    ' where cod_vendedor = ' + IntToStr(dataSet.FieldByName('cod_motorista').AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  fImp_NomeMotorista := Trim(buscas.FieldByName('nome_vendedor').AsString);
  
  buscas.Close;
  buscas.SQL.Text := 'select nome_vendedor from colaborador' +
    ' where cod_vendedor = ' + IntToStr(dataSet.FieldByName('cod_faturista').AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  fImp_NomeFaturista := Trim(buscas.FieldByName('nome_vendedor').AsString);

  buscas.Close;
  buscas.SQL.Text := 'select nome_vendedor from colaborador' +
    ' where cod_vendedor = ' + IntToStr(dataSet.FieldByName('cod_conferente').AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  fImp_NomeConferente := Trim(buscas.FieldByName('nome_vendedor').AsString);

  buscas.Close;
  buscas.SQL.Text := 'select placa||'' - ''||modelo as modelo from veiculos_transporte' +
    ' where cod_veic = ' + IntToStr(dataSet.FieldByName('cod_veic').AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  fImp_ModeloVeiculo := Trim(buscas.FieldByName('modelo').AsString);

  buscas.Close;
  buscas.SQL.Text := 'select setor from setor' +
    ' where cod_setor = ' + IntToStr(dataSet.FieldByName('cod_setor').AsInteger)+
    ' and cod_empresa = ' +vDadosIni.codEmpresa;
  buscas.Open;
  fImp_Setor := Trim(buscas.FieldByName('setor').AsString);

  _montarCabecalho;

  fBuscas2.Close;
  if (Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL') or (pTipo = '01') or (pTipo = '06') then
  begin
    fBuscas2.SQL.Text := 'select p.num_fab_prod, p.descr_prod, p.unidade, p.locacao_prod, p.locacao_prod_1,' +
      ' sum(ci.quantidade_venda) quantidade, sum(ci.quantidade_venda * ci.peso_un) peso_total, count(ci.cod_carga) from carga c' +
      ' inner join carga_item ci on ci.cod_carga = c.cod_carga and ci.cod_empresa = c.cod_empresa' +
      ' inner join produtos p on p.grupo_prod = ci.grupo_prod and p.cod_prod = ci.cod_prod and p.cod_empresa = ci.cod_empresa' +
      ' where c.cod_carga = '+IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+' and c.cod_empresa = ' + vDadosIni.codEmpresa +
      ' group by 1,2,3,4,5';

    if vImp_OrdenarPorAlocacao then
        fBuscas2.SQL.Text := fBuscas2.SQL.Text + ' order by 4, 5'
      else if vImp_OrdenarPorDescricao then
        fBuscas2.SQL.Text := fBuscas2.SQL.Text + ' order by 2'
      else
        fBuscas2.SQL.Text := fBuscas2.SQL.Text + ' order by 1';

  end
  else
  begin
    if pTipo = '04' then
    begin
      fBuscas2.SQL.Text := 'select p.num_fab_prod, p.descr_prod, p.unidade, p.locacao_prod, p.locacao_prod_1,' +
        ' sum(ci.quantidade_venda - coalesce((select sum(ch.quantidade_entregue) from carga_item_historico ch where' +
        ' ch.cod_carga = ci.cod_carga and ch.cod_empresa = ci.cod_empresa and ch.nitem = ci.nitem),0) )quantidade,' +
        ' sum((ci.quantidade_venda - coalesce((select sum(ch.quantidade_entregue) from carga_item_historico ch where' +
        ' ch.cod_carga = ci.cod_carga and ch.cod_empresa = ci.cod_empresa and ch.nitem = ci.nitem),0) ) * ci.peso_un) peso_total,' +
        ' count(ci.cod_carga) from carga c' +
        ' inner join carga_item ci on ci.cod_carga = c.cod_carga and ci.cod_empresa = c.cod_empresa' +
        ' inner join produtos p on p.grupo_prod = ci.grupo_prod and p.cod_prod = ci.cod_prod and p.cod_empresa = ci.cod_empresa' +
        ' where c.cod_carga = '+IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+' and c.cod_empresa = ' + vDadosIni.codEmpresa +
        ' group by 1,2,3,4,5 ' +
        ' having sum(ci.quantidade_venda - coalesce((select sum(ch.quantidade_entregue) from carga_item_historico ch where' +
        ' ch.cod_carga = ci.cod_carga and ch.cod_empresa = ci.cod_empresa and ch.nitem = ci.nitem),0) ) > 0' ;

      if vImp_OrdenarPorAlocacao then
        fBuscas2.SQL.Text := fBuscas2.SQL.Text + ' order by 4, 5'
      else if vImp_OrdenarPorDescricao then
        fBuscas2.SQL.Text := fBuscas2.SQL.Text + ' order by 2'
      else
        fBuscas2.SQL.Text := fBuscas2.SQL.Text + ' order by 1';
    end
    else if pTipo = '05' then
    begin
      fBuscas2.SQL.Text := 'select p.num_fab_prod, p.descr_prod, p.unidade, p.locacao_prod, p.locacao_prod_1,' +
        ' sum(ch.quantidade_entregue) quantidade, sum(ch.quantidade_entregue * ci.peso_un) peso_total, count(ci.cod_carga) from carga c' +
        ' inner join carga_item ci on ci.cod_carga = c.cod_carga and ci.cod_empresa = c.cod_empresa' +
        ' inner join carga_item_historico ch on ch.cod_carga = ci.cod_carga and ch.cod_empresa = ci.cod_empresa and ch.nitem = ci.nitem' +
        ' inner join produtos p on p.grupo_prod = ci.grupo_prod and p.cod_prod = ci.cod_prod and p.cod_empresa = ci.cod_empresa' +
        ' where c.cod_carga = '+IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+' and c.cod_empresa = ' + vDadosIni.codEmpresa +
        ' group by 1,2,3,4,5';

      if vImp_OrdenarPorAlocacao then
        fBuscas2.SQL.Text := fBuscas2.SQL.Text + ' order by 4, 5'
      else if vImp_OrdenarPorDescricao then
        fBuscas2.SQL.Text := fBuscas2.SQL.Text + ' order by 2'
      else
        fBuscas2.SQL.Text := fBuscas2.SQL.Text + ' order by 1';
    end;
  end;
  fBuscas2.Open;

  vQuantidadeAcumulada := 0;
  vPesoAcumulado := 0;
  I := 0;

  fBuscas2.First;
  while not fBuscas2.Eof do
  begin
    if (vLinha + 2) >= vLinhasRel then
    begin
      Inc(vLinha);
      vRel.Impf(vLinha, 001, 'Acumulado', []);
      vRel.Impf(vLinha, 067, vDadosIni.AlnDir(FloatToStr( vQuantidadeAcumulada), 14), []);
      vRel.Impf(vLinha, 090, vDadosIni.AlnDir(Format( '%0.3f', [vPesoAcumulado]), 14), []);

      vRel.Novapagina;
      _montarCabecalho;
    end;

    vRel.Impf(vLinha, 001, Copy(Trim(fBuscas2.FieldByName('num_fab_prod').AsString), 1, 14), []);
    vRel.Impf(vLinha, 016, Copy(Trim(fBuscas2.FieldByName('descr_prod').AsString), 1, 50), []);
    vRel.Impf(vLinha, 067, vDadosIni.AlnDir(FloatToStr( fBuscas2.FieldByName('quantidade').AsFloat), 14), []);
    vRel.Impf(vLinha, 086, Copy(Trim(fBuscas2.FieldByName('unidade').AsString), 1, 3), []);
    vRel.Impf(vLinha, 090, vDadosIni.AlnDir(Format( '%0.3f', [fBuscas2.FieldByName('peso_total').AsFloat]), 14), []);
    if vImp_ImpAlocacao then
      vRel.Impf(vLinha, 108, Trim(fBuscas2.FieldByName('locacao_prod').AsString) + ' ' + Trim(fBuscas2.FieldByName('locacao_prod_1').AsString), []);
    Inc(vLinha);
    Inc(I);

    vQuantidadeAcumulada := vQuantidadeAcumulada + fBuscas2.FieldByName('quantidade').AsFloat;
    vPesoAcumulado := vPesoAcumulado + vDadosIni.StrToFloatFormat(fBuscas2.FieldByName('peso_total').AsFloat,3);

    fBuscas2.Next;
  end;
       
  buscas.Close;
  if (Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL') or ( pTipo = '01') or ( pTipo = '06') then
    buscas.SQL.Text := 'select distinct ci.num_venda from carga c' +
      ' inner join carga_item ci on ci.cod_carga = c.cod_carga and ci.cod_empresa = c.cod_empresa' +
      ' where c.cod_carga = '+IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+' and c.cod_empresa = ' + vDadosIni.codEmpresa
  else
  begin
    if pTipo = '04' then
      buscas.SQL.Text := 'select distinct ci.num_venda, sum(ci.quantidade_venda - coalesce((select sum(ch.quantidade_entregue) from carga_item_historico ch where' +
        ' ch.cod_carga = ci.cod_carga and ch.cod_empresa = ci.cod_empresa and ch.nitem = ci.nitem),0) )quantidade from carga c' +
        ' inner join carga_item ci on ci.cod_carga = c.cod_carga and ci.cod_empresa = c.cod_empresa' +
        ' inner join produtos p on p.grupo_prod = ci.grupo_prod and p.cod_prod = ci.cod_prod and p.cod_empresa = ci.cod_empresa' +
        ' where c.cod_carga = '+IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+' and c.cod_empresa = ' + vDadosIni.codEmpresa +
        ' group by 1' +
        ' having sum(ci.quantidade_venda - coalesce((select sum(ch.quantidade_entregue) from carga_item_historico ch where' +
        ' ch.cod_carga = ci.cod_carga and ch.cod_empresa = ci.cod_empresa and ch.nitem = ci.nitem),0) ) > 0'
    else if pTipo = '05' then
      buscas.SQL.Text := 'select distinct ci.num_venda from carga c' +
        ' inner join carga_item ci on ci.cod_carga = c.cod_carga and ci.cod_empresa = c.cod_empresa' +
        ' inner join carga_item_historico ch on ch.cod_carga = ci.cod_carga and ch.cod_empresa = ci.cod_empresa and ch.nitem = ci.nitem' +
        ' where c.cod_carga = '+IntToStr(dataSet.FieldByName('cod_carga').AsInteger)+' and c.cod_empresa = ' + vDadosIni.codEmpresa;
  end;
  buscas.Open;

  vLista := TStringList.Create;

  vLista.Clear;
  vTemp:='';
  vOK := True;


  buscas.First;
  while not buscas.Eof do
  begin
    if length(vTemp + buscas.FieldByName('num_venda').AsString + ' - ') <= vColunas then
      vTemp := vTemp + buscas.FieldByName('num_venda').AsString + ' - '
    else
    begin
      vLista.Add(vTemp);
      vTemp := buscas.FieldByName('num_venda').AsString + ' - ';
    end;
    buscas.Next;
  end;
  vLista.Add(vTemp);

  if (vLinha + 6 + vLista.Count) >= vLinhasRel then
  begin
    Inc(vLinha);
    vRel.Impf(vLinha, 001, 'Acumulado', []);
    vRel.Impf(vLinha, 067, vDadosIni.AlnDir(FloatToStr( vQuantidadeAcumulada), 14), []);
    vRel.Impf(vLinha, 090, vDadosIni.AlnDir(Format( '%0.3f', [vPesoAcumulado]), 14), []);

    vRel.Novapagina;
    _montarCabecalho;
  end;

  Inc(vLinha);
  vRel.Impf(vLinha, 001, 'Total Geral', []);
  vRel.Impf(vLinha, 067, vDadosIni.AlnDir(FloatToStr( vQuantidadeAcumulada), 14), []);
  vRel.Impf(vLinha, 090, vDadosIni.AlnDir(Format( '%0.3f', [vPesoAcumulado]), 14), []);

  Inc(vLinha);
  vRel.Impf(vLinha, 001, 'Total de Itens     ' + IntToStr(I), []);
  Inc(vLinha);

  vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
  Inc(vLinha);

  for J := 0 to vLista.Count - 1 do
  begin
    vRel.Imp(vLinha, 1, vLista[0] );
    Inc(vLinha);
  end;
  
  vRel.Imp(vLinha, 1, vdadosini.replicate('-', vColunas));
  
  vRel.Fechar;

end;

function TOrdemCarregamento._informarQtdeParaHistorico(
  pQuantidade: Extended; pRetiradaNoLocal: Boolean = False): Boolean;
var
  vQtde: Extended;
begin
  Result := False;

  if not vDadosIni.PesqPros('OCR039', 'INCLUIR', 'CARGA ' + dataSet.FieldByName('COD_CARGA').AsString, 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas, False) then
    Exit;

  try
    if vDadosIni.StrToFloatFormat(pQuantidade,6) <= 0 then
      raiseExceptionCreate('Quantidade informada menor ou igual a zero', '');

    if vDadosIni.StrToFloatFormat(pQuantidade,6) >
      vDadosIni.StrToFloatFormat( vItem.dataSet.FieldByName('quantidade_venda').AsFloat,6) then
      raiseExceptionCreate('Quantidade informada maior que a quantidade para entrega', '');

    vItem.vHistorico._filtrarHistorico(vItem.dataSet.FieldByName('nitem').AsInteger);
    vQtde := 0;
    if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
    begin
      if vItem.vHistorico.IsEmpty then
      begin
        vItem.vHistorico.dataSet.Insert;
        vItem.vHistorico.dataSet.FieldByName('COD_CARGA').AsInteger := dataSet.FieldByName('COD_CARGA').AsInteger;
        vItem.vHistorico.dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
        vItem.vHistorico.dataSet.FieldByName('NITEM').AsInteger := vItem.dataSet.FieldByName('NITEM').AsInteger;
        vItem.vHistorico.dataSet.FieldByName('NITEM_H').AsInteger := vItem.vHistorico.dataSet.RecordCount + 1;
        if pRetiradaNoLocal then
          vItem.vHistorico.dataSet.FieldByName('TIPO_ENTREGA').AsString := 'R'
        else
          vItem.vHistorico.dataSet.FieldByName('TIPO_ENTREGA').AsString := 'T';
        vItem.vHistorico.dataSet.FieldByName('QUANTIDADE_ENTREGUE').AsFloat := pQuantidade;
        vItem.vHistorico.dataSet.FieldByName('DATA_HORA_CARREGAMENTO').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
        vItem.vHistorico.dataSet.FieldByName('DATA_ENTREGA').AsDateTime := StrToDate(FormatDateTime('dd/mm/yyyy', vItem.vHistorico.dataSet.FieldByName('DATA_HORA_CARREGAMENTO').AsDateTime));
        vItem.vHistorico.dataSet.FieldByName('DATA_CARREGAMENTO').AsDateTime := vItem.vHistorico.dataSet.FieldByName('DATA_ENTREGA').AsDateTime;
//        vItem.vHistorico.dataSet.FieldByName('DATA_HORA_CARREGAMENTO').AsDateTime := StrToTime(FormatDateTime('hh:mm:ss', vItem.vHistorico.dataSet.FieldByName('DATA_HORA_CARREGAMENTO').AsDateTime));
        vItem.vHistorico.Post;
      end
      else
      begin
        if vDadosIni.StrToFloatFormat(pQuantidade,6) >
          vDadosIni.StrToFloatFormat( vItem.dataSet.FieldByName('quantidade_venda').AsFloat -
          vItem.vHistorico.dataSet.FieldByName('QUANTIDADE_ENTREGUE').AsFloat, 6) then
          raiseExceptionCreate('Quantidade informada maior que a quantidade para entrega', '');

        vItem.vHistorico.dataSet.Edit;
        vItem.vHistorico.dataSet.FieldByName('QUANTIDADE_ENTREGUE').AsFloat :=
          vItem.vHistorico.dataSet.FieldByName('QUANTIDADE_ENTREGUE').AsFloat + pQuantidade;
        vItem.vHistorico.dataSet.FieldByName('DATA_HORA_CARREGAMENTO').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
        vItem.vHistorico.dataSet.FieldByName('DATA_ENTREGA').AsDateTime := StrToDate(FormatDateTime('dd/mm/yyyy', vItem.vHistorico.dataSet.FieldByName('DATA_HORA_CARREGAMENTO').AsDateTime));
        vItem.vHistorico.dataSet.FieldByName('DATA_CARREGAMENTO').AsDateTime := vItem.vHistorico.dataSet.FieldByName('DATA_ENTREGA').AsDateTime;
        if pRetiradaNoLocal then
          vItem.vHistorico.dataSet.FieldByName('TIPO_ENTREGA').AsString := 'R'
        else
          vItem.vHistorico.dataSet.FieldByName('TIPO_ENTREGA').AsString := 'T';
//        vItem.vHistorico.dataSet.FieldByName('DATA_HORA_CARREGAMENTO').AsDateTime := StrToTime(FormatDateTime('hh:mm:ss', vItem.vHistorico.dataSet.FieldByName('DATA_HORA_CARREGAMENTO').AsDateTime));
        vItem.vHistorico.Post;
      end;

    end
    else
    begin
      vQtde := 0;
      vItem.vHistorico.First;
      while not vItem.vHistorico.Eof do
      begin
        vQtde := vQtde + vItem.vHistorico.dataSet.FieldByName('QUANTIDADE_ENTREGUE').AsFloat;
        vItem.vHistorico.Next;
      end;
      if vDadosIni.StrToFloatFormat(pQuantidade + vQtde, 6) >
        vDadosIni.StrToFloatFormat( vItem.dataSet.FieldByName('quantidade_venda').AsFloat,6) then
        raiseExceptionCreate('Quantidade informada maior que a quantidade pendente para entrega', '');

      vItem.vHistorico.dataSet.Insert;
      vItem.vHistorico.dataSet.FieldByName('COD_CARGA').AsInteger := dataSet.FieldByName('COD_CARGA').AsInteger;
      vItem.vHistorico.dataSet.FieldByName('COD_EMPRESA').AsString := vDadosIni.codEmpresa;
      vItem.vHistorico.dataSet.FieldByName('NITEM').AsInteger := vItem.dataSet.FieldByName('NITEM').AsInteger;
      vItem.vHistorico.dataSet.FieldByName('NITEM_H').AsInteger := vItem.vHistorico.dataSet.RecordCount + 1;
      if pRetiradaNoLocal then
        vItem.vHistorico.dataSet.FieldByName('TIPO_ENTREGA').AsString := 'R'
      else
        vItem.vHistorico.dataSet.FieldByName('TIPO_ENTREGA').AsString := 'P';
      vItem.vHistorico.dataSet.FieldByName('QUANTIDADE_ENTREGUE').AsFloat := pQuantidade;
      vItem.vHistorico.dataSet.FieldByName('DATA_HORA_CARREGAMENTO').AsDateTime := vDadosIni.getDataHoraBanco(buscas);
      vItem.vHistorico.dataSet.FieldByName('DATA_ENTREGA').AsDateTime := StrToDate(FormatDateTime('dd/mm/yyyy', vItem.vHistorico.dataSet.FieldByName('DATA_HORA_CARREGAMENTO').AsDateTime));
      vItem.vHistorico.dataSet.FieldByName('DATA_CARREGAMENTO').AsDateTime := vItem.vHistorico.dataSet.FieldByName('DATA_ENTREGA').AsDateTime;
//      vItem.vHistorico.dataSet.FieldByName('DATA_HORA_CARREGAMENTO').AsDateTime := StrToDate(FormatDateTime('hh:mm:ss', vItem.vHistorico.dataSet.FieldByName('DATA_HORA_CARREGAMENTO').AsDateTime));
      vItem.vHistorico.Post;
      
    end;

    vItem.dataSet.Edit;
    if _getQtdePendente > 0 then
      vItem.dataSet.FieldByName('pend').AsString := 'S'
    else
      vItem.dataSet.FieldByName('pend').AsString := '';
    vItem.dataSet.Post;

    Result := True;

//    if result then
//      if (vItem.vHistorico.DataSet.ChangeCount > 0) then
//        result := vItem.vHistorico.Apply;
//
//    if result then
//      result := CommitaTransacao;

//    if Result then
//    begin
//      CommitaTransacao;
//      vDadosIni.GravaAuditoria('OCR039', 'INCLUIR', 'SUCESSO', 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas);
//    end
//    else
//    begin
//      RollBackTransacao;
//      vDadosIni.GravaAuditoria('OCR039', 'INCLUIR', 'FALHA', 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas);
//    end;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TOrdemCarregamento._informarSaida: Boolean;
var
  vDatahora: TDateTime;
begin
  Result := False;

  if not vDadosIni.PesqPros('OCR044', 'SAIDA', 'CARGA ' + dataSet.FieldByName('COD_CARGA').AsString, 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas, False) then
    Exit;

  try
    dataSet.RefreshRecord;

    if Trim(dataSet.FieldByName('STATUS').AsString) <> 'FECHADA' then
      raise exception.create('Ordem de Carregamento não esta Fechada para informar saída');

    if Application.MessageBox('Confirma saída do carregamento?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
      Exit;

    if Trim(dataSet.FieldByName('DATA_SAIDA').AsString) <> '' then
      if Application.MessageBox('Saída do carregamento já foi informada. Deseja sobreescrever informação?',
        'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
        Exit;

    vDadosIni.vDataHora := vDadosIni.getDataHoraBanco(buscas);

    dataSet.Edit;
    dataSet.FieldByName('DATA_SAIDA').AsDateTime := vDadosIni.vDataHora;
    dataSet.Post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    _atualizarSituacaoPedidos('Finalizado', False, False, 'SAIDA');

    if result then
      result := CommitaTransacao;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('OCR044', 'SAIDA', 'SUCESSO', 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('OCR044', 'SAIDA', 'FALHA', 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas);
    end;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TOrdemCarregamento._iniciarContinuarCarregamento: Boolean;
var
	vFechar: Boolean;
begin

  try
    vFechar := false;

    if _ordemCarregamentoFechada then
    begin
      Application.MessageBox('Ordem de Carregamento Fechada! Não permitido modificações!', 'Atenção', 0 + 64);
      Exit;
    end;

    if not vDadosIni.PesqPros('OCR037', 'EXCLUIR', '', 'CARGA',
      dataSet.FieldByName('COD_CARGA').AsString, buscas, True) then
      exit;

    _verificarNovasVendas;

    if not Edit then
      raiseExceptionCreate('Não foi possível alterar o registro','');

    if vItem.dataSet.IsEmpty then
      raiseExceptionCreate('Sem mercadorias na Ordem de Carregamento','');

    try

      if _abreFormIniciarContinuarCarregamento then
      begin

        try

          if Trim(dataSet.FieldByName('tipo_entrega').AsString) = '' then
            raise exception.create('Tipo de Entrega deve ser informado');

          if Trim(dataSet.FieldByName('conferir').AsString) = '' then
            if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
              raise exception.create('Informe se o carregamento deverá ser conferido');

          _gravarDadosCarregamentoEntrega;  
          if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'PARCIAL' then
          begin
            if not _cargaPendenteParaCarregamento then
            begin
              //fazer update no historico onde o cod_entrega estiver vazio
              //Chamar impressao da ordem de carregamento
              if Application.MessageBox(pchar('Todas as mercadorias já foram entregues. Deseja fechar a ordem de carregamento?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
                vFechar := True;
            end
            else
            begin
              //fazer update no historico onde o cod_entrega estiver vazio
              //Chamar impressao da ordem de carregamento
            end;
          end
          else if Trim(dataSet.FieldByName('tipo_entrega').AsString) = 'TOTAL' then
            if Trim(dataSet.FieldByName('conferir').AsString) = 'S' then
            begin
              if not _cargaPendenteParaCarregamento then
              begin
                if Application.MessageBox(pchar('Todas as mercadorias já foram conferidas. Deseja fechar a ordem de carregamento?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
                  vFechar := True;
              end;
            end
            else if Application.MessageBox(pchar('Deseja fechar a ordem de carregamento?'), 'Confirmação', MB_ICONQUESTION + MB_YESNO) = ID_YES then
              vFechar := True;

        except on E: Exception do
          begin
            Application.MessageBox(pchar('Erro: '+e.Message), 'Atenção', 0 + 64);
            _abreFormIniciarContinuarCarregamento;
            Exit;
          end;
        end;
      end;
      _calcularPesoCarga;
      _cargaPendenteParaCarregamento;
      if dataSet.State = dsEdit then
        Post;

      if vFechar  then
        _fecharOrdemCarregamento;

    finally
      dataSet.Cancel;
    end;

  except on E: Exception do
    begin
      Result := False;
      dataSet.Cancel;
      Application.MessageBox(pchar('Erro: ' + E.Message), 'Atenção', 0 + 64 );
      registraErro(e.Message);
    end;
  end;
end;

procedure TOrdemCarregamento._inserirCodigoCarga(pDtset: TDataSet);
begin
  if (not (pDtset.IsEmpty)) then
  begin
    pDtset.First;
    while (not (pDtset.Eof)) do
    begin
      pDtset.Edit;
      pDtset.FieldByName('cod_carga').AsInteger := dataSet.FieldByName('cod_carga').AsInteger;
      pDtset.Post;
      pDtset.Next;
    end;
  end;
end;

function TOrdemCarregamento._pesquisa(pCampo, pCondicao, pValor, pData1,
  pData2: string): Boolean;
var
  vSqlTemp, vOrdem: string;
begin
  vSqlTemp := '';

  if pCampo = 'Motorista' then
    vSqlTemp := 'm.nome_vendedor '
  else if pCampo = 'Faturista' then
    vSqlTemp := 'f.nome_vendedor '
  else if pCampo = 'Conferente' then
    vSqlTemp := 'e.nome_vendedor ';
  if vSqlTemp  <> '' then
  begin
    if pCondicao = 'Igual' then
      pCondicao := '= '
    else if pCondicao = 'Maior' then
      pCondicao := '> '
    else if pCondicao = 'Maior ou Igual' then
      pCondicao := '>= '
    else if pCondicao = 'Menor' then
      pCondicao := '< '
    else if pCondicao = 'Menor ou Igual' then
      pCondicao := '<= '
    else if pCondicao = 'Diferente' then
      pCondicao := '<> '
    else if (pCondicao = 'Esta contido') then
      pCondicao := 'like'
    else if (pCondicao = 'Começa') then
      pCondicao := 'Começa'
    else
      pCondicao := '= ';

    if pCondicao = 'like' then
      vSqlTemp := vSqlTemp + pCondicao + QuotedStr('%' + pValor + '%')
    else if pCondicao = 'Começa' then
      vSqlTemp := vSqlTemp + 'like' + QuotedStr(pValor + '%')
    else
      vSqlTemp := vSqlTemp + pCondicao + QuotedStr(pValor);
    pValor := '';
  end;

  vOrdem := copy(dataSet.IndexName, 5, length(dataSet.IndexName));
  if Trim(vOrdem) = '' then
    vOrdem := 'COD_CARGA';

  if dataSet.FindField(vOrdem) = nil then
    vOrdem := copy(vOrdem, 2, length(vOrdem));

  if dataSet.FindField(vOrdem) = nil then
    vOrdem := 'COD_CARGA';

  if pValor <> '*D*A*T*A*' then
  begin
    Result := ConsultaCampos('CARGA', pValor, pCampo, pCondicao, vOrdem, True, vDadosIni.codEmpresa,
      'carga.*, setor.setor, veiculos_transporte.modelo, m.nome_vendedor, f.nome_vendedor nome_vendedor_f, e.nome_vendedor nome_vendedor_e',
      ' left join setor on setor.cod_setor = carga.cod_setor and setor.cod_empresa = carga.cod_empresa' +
      ' left join veiculos_transporte on veiculos_transporte.cod_veic = carga.cod_veic and veiculos_transporte.cod_empresa = carga.cod_empresa' +
      ' left join colaborador m on m.cod_vendedor = carga.cod_motorista and m.cod_empresa = carga.cod_empresa' +
      ' left join colaborador f on f.cod_vendedor = carga.cod_faturista and f.cod_empresa = carga.cod_empresa' +
      ' left join colaborador e on e.cod_vendedor = carga.cod_conferente and e.cod_empresa = carga.cod_empresa', vSqlTemp);
  end
  else
    Result := ConsultaCampos('CARGA', pCampo, vOrdem, pData1, pData2, vDadosIni.codEmpresa, 1,
      'carga.*, setor.setor, veiculos_transporte.modelo, m.nome_vendedor, f.nome_vendedor nome_vendedor_f, e.nome_vendedor nome_vendedor_e',
      ' left join setor on setor.cod_setor = carga.cod_setor and setor.cod_empresa = carga.cod_empresa' +
      ' left join veiculos_transporte on veiculos_transporte.cod_veic = carga.cod_veic and veiculos_transporte.cod_empresa = carga.cod_empresa' +
      ' left join colaborador m on m.cod_vendedor = carga.cod_motorista and m.cod_empresa = carga.cod_empresa' +
      ' left join colaborador f on f.cod_vendedor = carga.cod_faturista and f.cod_empresa = carga.cod_empresa' +
      ' left join colaborador e on e.cod_vendedor = carga.cod_conferente and e.cod_empresa = carga.cod_empresa', vSqlTemp);
end;

function TOrdemCarregamento._reabrirOrdemCarregamento: Boolean;
var
  vDatahora: TDateTime;
begin
  Result := False;

  if vDadosIni.vEmp.vUsarConferenciaCegaSaida = 'S1' then
    if existeConferenciaCega(dataSet.FieldByName('COD_CARGA').AsInteger) then
    begin
      Application.MessageBox('Carga já possui conferência cega, não é possivel reabrir!', 'Atenção', 0 + 48);
      Exit;
    end;

  if not vDadosIni.PesqPros('OCR041', 'FECHAR', 'CARGA ' + dataSet.FieldByName('COD_CARGA').AsString, 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas, False) then
    Exit;

  try
    dataSet.RefreshRecord;
    
    if Trim(dataSet.FieldByName('STATUS').AsString) <> 'FECHADA' then
      raise exception.create('Ordem de Carregamento não esta Fechada para ser reaberta');

    if Application.MessageBox('Tem certeza que deseja reabrir a Ordem de Carregamento?',
      'Confirmação', MB_YESNO + MB_ICONQUESTION) <> IDYES then
      Exit;


    dataSet.Edit;
    dataSet.FieldByName('DATA_FECHAMENTO').Value := null;
    dataSet.FieldByName('STATUS').AsString := 'ABERTA';
    dataSet.Post;

    if (DataSet.ChangeCount = 0) then
      Result := True
    else
      Result := Apply;

    if result then
      if (vItem.DataSet.ChangeCount > 0) then
        result := vItem.Apply;

    if result then
      if (vItem.vHistorico.DataSet.ChangeCount > 0) then
        result := vItem.vHistorico.Apply;

    _atualizarSituacaoPedidos('Finalizado', True);

    if result then
      result := CommitaTransacao;

    if Result then
    begin
      CommitaTransacao;
      vDadosIni.GravaAuditoria('OCR041', 'FECHAR', 'SUCESSO', 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas);
    end
    else
    begin
      RollBackTransacao;
      vDadosIni.GravaAuditoria('OCR041', 'FECHAR', 'FALHA', 'CARGA', dataSet.FieldByName('COD_CARGA').AsString, buscas);
    end;

  except on E: Exception do
    begin
      Result := false;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 0 + 64);
      registraErro(e.Message);
    end;
  end;
end;

function TOrdemCarregamento._removerHistorico: Boolean;
var
  nItem,I, I_h: Integer;
begin

  Result := False;

  if vItem.vHistorico.dataSet.IsEmpty then
    Exit;

  if not vDadosIni.PesqPros('OCR040', 'EXCLUIR', '' , 'CARGA',
    dataSet.FieldByName('COD_CARGA').AsString, buscas, True) then
    exit;

  if Application.MessageBox(pchar('Deseja mesmo excluir este registro?'),'Confirmação',MB_ICONQUESTION + MB_YESNO) <> IDYES then
    Exit;

  nItem := vItem.vHistorico.dataSet.FieldByName('nitem_h').AsInteger;
  I := vItem.vHistorico.dataSet.FieldByName('nitem').AsInteger;
  I_h  := vItem.vHistorico.dataSet.FieldByName('nitem_h').AsInteger;

  vItem.vHistorico.dataSet.Delete;
  vItem.vHistorico.dataSet.First;
  while not vItem.vHistorico.dataSet.Eof do
  begin
    if nItem <= vItem.vHistorico.dataSet.FieldByName('nitem_h').AsInteger then
    begin
      vItem.vHistorico.dataSet.Edit;
      vItem.vHistorico.dataSet.FieldByName('nitem').AsInteger := nItem;
      vItem.vHistorico.dataSet.Post;
      Inc(nItem);
    end;
    vItem.vHistorico.dataSet.Next;
  end;

  vItem.dataSet.Edit;
  if _getQtdePendente > 0 then
    vItem.dataSet.FieldByName('pend').AsString := 'S'
  else
    vItem.dataSet.FieldByName('pend').AsString := '';
  vItem.dataSet.Post;

  vItem.vHistorico.FindNearest([I, I_h]);

  Result := True;
end;

function TOrdemCarregamento._removerMercadorias(pCodigoVenda: Integer = 0): Boolean;
var
  vTemp: string;
  vCodigo, nItem: Integer;
begin

  Result := False;

  if dataSet.IsEmpty then
    Exit;

  if pCodigoVenda = 0 then  
    if _ordemCarregamentoFechada then
    begin
      Application.MessageBox('Ordem de Carregamento Fechada! Não permitido modificações!', 'Atenção', 0 + 64);
      Exit;
    end;

  if not vDadosIni.PesqPros('OCR035', 'EXCLUIR', 'MERCADORIAS NUM ' + vItem.dataSet.FieldByName('tipo_venda').AsString +
    ' ' + vItem.dataSet.FieldByName('NUM_venda').AsString + ' COD '+ vItem.dataSet.FieldByName('cod_venda').AsString, 'CARGA',
    dataSet.FieldByName('COD_CARGA').AsString, buscas, True) then
    exit;

  if vItem.dataSet.FieldByName('tipo_venda').AsString = 'REQ' then
    vTemp := 'Venda'
  else
    vTemp := 'Nota Fiscal';

  if pCodigoVenda = 0 then   
    if Application.MessageBox(pchar('Todos os itens da '+vTemp+' N° '+vItem.dataSet.FieldByName('num_venda').AsString+
      ' serão removidos'+#13+
      'Deseja continuar?'),'Confirmação',MB_ICONQUESTION + MB_YESNO) <> IDYES then
      Exit;

  if pCodigoVenda = 0 then
    vCodigo := vItem.dataSet.FieldByName('cod_venda').AsInteger
  else
    vCodigo := pCodigoVenda;

  nItem := 0;
  vItem.dataSet.First;
  while not vItem.dataSet.Eof do
  begin
    if vCodigo = vItem.dataSet.FieldByName('cod_venda').AsInteger then
    begin
      if nItem = 0 then
        nItem := vItem.dataSet.FieldByName('nitem').AsInteger;
      vItem.Delete;
//      vItem.vHistorico._apagarHistorico(vItem.dataSet.FieldByName('nitem').AsInteger);
      if vItem.dataSet.Eof then
        break;
    end
    else
    begin
      if (nItem <> 0) and (nItem < vItem.dataSet.FieldByName('nitem').AsInteger) then
      begin
        vItem.dataSet.Edit;
        vItem.dataSet.FieldByName('nitem').AsInteger := nItem;
        vItem.dataSet.Post;
//        vItem.vHistorico._modificarNitem(nItem);
        Inc(nItem);
      end;
      vItem.dataSet.Next;
    end;
  end;

  if not (dataSet.State in [dsInsert, dsEdit]) then
    dataSet.Edit;

  _calcularPesoCarga;

  if pCodigoVenda = 0 then
    if vDadosIni.vEmp.vOC_TipoControleOrdemC = 'NF' then
    begin
      buscas.Close;
      buscas.SQL.Text := 'update boletas set cod_carga = null' +
        ' where cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cod_nf in ( select cod_nf from notafiscal' +
        ' where cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa + ')';
      buscas.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := 'update notafiscal set cod_carga = null'+
        ' where cod_nf = ' + IntToStr(vCodigo)+ ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cod_carga = ' + IntToStr( dataSet.FieldByName('cod_carga').AsInteger);
      buscas.ExecSQL;
    end
    else
    begin
      buscas.Close;
      buscas.SQL.Text := 'update pedvenda set cod_carga = null' +
        ' where nped = ' + IntToStr(vCodigo)+ ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cod_carga = ' + IntToStr( dataSet.FieldByName('cod_carga').AsInteger) +
        ' and tipo = ''REQ''';
      buscas.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := 'update boletas set cod_carga = null' +
        ' where cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cod_nf in ( select cod_nf from notafiscal' +
        ' where cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) +
        ' and cod_empresa = ' + vDadosIni.codEmpresa + ')';
      buscas.ExecSQL;

      buscas.Close;
      buscas.SQL.Text := 'update notafiscal set cod_carga = null'+
        ' where nped = ' + IntToStr(vCodigo)+ ' and cod_empresa = ' + vDadosIni.codEmpresa +
        ' and cod_carga = ' + IntToStr( dataSet.FieldByName('cod_carga').AsInteger) +
        ' and tipo_ped = ''REQ''';
      buscas.ExecSQL;

      vDadosIni.informarSituacaoPedido( vCodigo, 'REQ', 'SEPARACAO', 'Iniciado', '', buscas, False, False,True);

    end;

  Result := Post;

  if Result then
    Edit;
end;

function TOrdemCarregamento._vendaEmOutraOrdemDeCarregamento(
  pCodVenda: Integer): Integer;
begin
  buscas.Close;
  buscas.SQL.Text := 'select ci.cod_carga from carga_item ci' +
    ' inner join carga c on c.cod_carga = ci.cod_carga and c.cod_empresa = ci.cod_empresa' +
    ' where ci.cod_venda = ' + IntToStr(pCodVenda) + ' and ci.cod_empresa = ' + vDadosIni.codEmpresa +
    ' and ci.tipo_venda = ' + QuotedStr(vDadosIni.vEmp.vOC_TipoControleOrdemC) +
    ' and ci.cod_carga <> ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) +
    ' and c.tipo_carga = ''D''';
  buscas.Open;
  Result := buscas.FieldByName('cod_carga').AsInteger;
end;

function TOrdemCarregamento._vendasEmAberto: Boolean;
var
  vTemp: string;
begin
  Result := False;
  
  if vDadosIni.vEmp.vOC_TipoControleOrdemC = 'REQ' then
  begin
    fBuscas2.Close;
    fBuscas2.SQL.Text := 'select p.nped codigo, p.nped num_venda from pedvenda p' +
      ' where p.cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) +
      ' and coalesce(p.status_ped, '''') = '''' and p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' order by p.nped desc';
    fBuscas2.Open;
  end
  else if vDadosIni.vEmp.vOC_TipoControleOrdemC = 'NF' then
  begin
    fBuscas2.Close;
    fBuscas2.SQL.Text := 'select nf.cod_nf codigo, nf.num_nf num_venda from notafiscal nf' +
      ' where nf.cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) +
      ' and coalesce(nf.status, '''') = '''' and nf.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and nf.natureza_nf = ''S'' and nf.tipo_nf = ''P'' order by nf.num_nf desc';
    fBuscas2.Open;
  end;

  if buscas.IsEmpty then
    Exit;

  fBuscas2.FetchAll;

  if fBuscas2.RecordCount = 1 then
    vTemp := 'A venda Nº ' + fBuscas2.FieldByName('num_venda').AsString +
      ' esta aberta! A Ordem de Carregamento não pode ser fechada'
  else
  begin
    vTemp := '';
    fBuscas2.First;
    while not fBuscas2.Eof do
    begin
      vTemp := ', ' + fBuscas2.FieldByName('num_venda').AsString + vTemp;
      fBuscas2.Next;
    end;
    System.Delete(vTemp,1,2);

    vTemp := 'As vendas Nº ' + vTemp + ' estão abertas! A Ordem de Carregamento não pode ser fechada';
  end;

  fTemp := vTemp;

  Result := not fBuscas2.IsEmpty;
end;

function TOrdemCarregamento._verificarNovasVendas: Boolean;
var
  vTemp: string;
begin

  Result := True;

  if dataSet.IsEmpty then
    Exit;

  if _ordemCarregamentoFechada then
    Exit;

  fBuscas2 := TIBQuery(dtmOrdemCarregamento.qrBuscas2);

  if vDadosIni.vEmp.vOC_TipoControleOrdemC = 'REQ' then
  begin
    fBuscas2.Close;
    fBuscas2.SQL.Text := 'select p.nped codigo, ci.cod_venda, p.nped num_venda from pedvenda p' +
      ' left join carga_item ci on ci.cod_carga = p.cod_carga AND ci.cod_empresa = p.cod_empresa and ci.cod_venda = p.nped' +
      ' where p.cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) +
      ' and ci.cod_venda is null and p.status_ped = ''FECHADA'' and p.cod_empresa = ' + vDadosIni.codEmpresa +
      ' order by p.nped desc';
    fBuscas2.Open;
  end
  else if vDadosIni.vEmp.vOC_TipoControleOrdemC = 'NF' then
  begin
    fBuscas2.Close;
    fBuscas2.SQL.Text := 'select nf.cod_nf codigo, ci.cod_venda, nf.num_nf num_venda from notafiscal nf' +
      ' left join carga_item ci on ci.cod_carga = nf.cod_carga AND ci.cod_empresa = nf.cod_empresa and ci.cod_venda = nf.cod_nf' +
      ' where nf.cod_carga = ' + IntToStr(dataSet.FieldByName('cod_carga').AsInteger) +
      ' and ci.cod_venda is null and nf.status = ''Fechada'' and nf.cod_empresa = ' + vDadosIni.codEmpresa +
      ' and nf.natureza_nf = ''S'' and nf.tipo_nf = ''P'' order by nf.num_nf desc';
    fBuscas2.Open;
  end;

  if fBuscas2.IsEmpty then
    Exit;

  fBuscas2.FetchAll;

  if fBuscas2.RecordCount = 1 then
    vTemp := 'Adicionar a venda Nº ' + fBuscas2.FieldByName('num_venda').AsString + ' a esta Ordem de Carregamento?'
  else
  begin
    vTemp := '';
    fBuscas2.First;
    while not fBuscas2.Eof do
    begin
      vTemp := ', ' + fBuscas2.FieldByName('num_venda').AsString + vTemp;
      fBuscas2.Next;
    end;
    System.Delete(vTemp,1,2);

    vTemp := 'Adicionar as vendas Nº ' + vTemp + ' a esta Ordem de Carregamento?';
  end;

//  if
  Application.MessageBox(pchar(vTemp), 'Atenção', 0 + 64);
//   'Confirmação', MB_ICONQUESTION + MB_YESNO) <> IDYES then
//    Exit;

  if not Edit then
    Exit;

  fBuscas2.First;
  while not fBuscas2.Eof do
  begin

    if not _adicionarVendaParaCarregamento(fBuscas2.FieldByName('codigo').AsInteger, fBuscas2.FieldByName('num_venda').AsInteger, False) then
      Exit;

    fBuscas2.Next;
  end;

  Result := Post;

  


  // Criar uma variavel de configuração de atualizacao automatica de vendas.
  // Se a variavel for ativada o sistema automaticamente ao editar, inicar carregamento, fechar, ver itens, ect irá importar itens das novas vendas.
  // Ou nao ou o sistema verifica sempre e apresenta uma mensagem quando encontrar alguma venda que possua o codigo da carga e ainda
  // nao esteja adicionada. Caso o usuário confirme o sistema irá adiciona as vendas da mesma, caso nao o sistema ira deixar como esta
  /// e a mensagem será apresentada ate que ele importe as vendas pendentes.
  ///
  ///  Quando excluir uma venda, remover o número da mesma na tabela respectiva
  ///
  ///  Quando incluir adicionar o numero da mesma na tabela respectiva
  ///


end;

{ TEntrega_Carga }

constructor TEntrega_Carga.create;
begin
  dataSet := TClientDataSet(dtmOrdemCarregamento.cdsEntr);
  transacao := TIBTransaction(dtmOrdemCarregamento.transacao);
  buscas := TIBQuery(dtmOrdemCarregamento.qrBuscas);
end;

function TEntrega_Carga._abreEntregasCarga(pCodCarga: Integer): Boolean;
begin
  Result := montaSelect('select distinct ch.cod_entrega, ch.data_entrega, ch.data_carregamento from carga_item_historico ch' +
    ' where ch.cod_carga = '+IntToStr(pCodCarga)+' and ch.cod_empresa = '+vDadosIni.codEmpresa);
end;

procedure TEntrega_Carga._marcaDesmarcaLinha;
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

{ TClientes_Carga }

constructor TClientes_Carga.create;
begin
  dataSet := TClientDataSet(dtmOrdemCarregamento.cdsCl);
  transacao := TIBTransaction(dtmOrdemCarregamento.transacao);
  buscas := TIBQuery(dtmOrdemCarregamento.qrBuscas);
  _dataSet := TClientDataSet(dtmOrdemCarregamento.cdsClTemp);

  vVendas := TVendas_Carga.create;
end;

destructor TClientes_Carga.Destroy;
begin
  vVendas.Free;
  vVendas := nil;
  inherited;
end;

function TClientes_Carga._abreTodos: Boolean;
begin
  Result := montaSelect('select c.cod_cliente, c.nome_cliente, c.razao, c.cpfcgc, c.cod_localidade from clientes c' +
    ' where cod_empresa = '+vDadosIni.codEmpresa + ' and ativo = 1');
end;

function TClientes_Carga._addCliente: Boolean;
var
  vTemp: string;
begin
  vDadosIni.vPesquisa := '';
  vDadosIni.vPesquisa := vDadosIni.pesquisaRapida('CLIENTES');
  if Trim(vDadosIni.vPesquisa) <> '' then
  begin
    vTemp := IndexFieldNames;
    IndexFieldNames := 'COD_CLIENTE';
    FindNearest([vDadosIni.vPesquisa]);
    if dataSet.FieldByName('cod_cliente').AsString = vDadosIni.vPesquisa then
    begin
      _dataSet.Append;
      _dataSet.FieldByName('COD_CLIENTE').AsString := dataSet.FieldByName('COD_CLIENTE').AsString;
      _dataSet.FieldByName('NOME_CLIENTE').AsString := dataSet.FieldByName('NOME_CLIENTE').AsString;
      _dataSet.FieldByName('RAZAO').AsString := dataSet.FieldByName('RAZAO').AsString;
      _dataSet.FieldByName('CPFCGC').AsString := dataSet.FieldByName('CPFCGC').AsString;
      _dataSet.Post;    
    end;
    IndexFieldNames := vTemp;
  end;

end;

function TClientes_Carga._avancarComClientesSelecionados: Boolean;
begin
  Result := True;

  if _dataSet.Tag <> 22 then
  	try
      _dataSet.CreateDataSet;
      _dataSet.Tag := 22
    except
    end;

  _dataSet.EmptyDataSet;

//  while not _dataSet.IsEmpty do
//  	_dataSet.Delete;

  vVendas.dataSet.Close;

  dataSet.First;
  while not dataSet.Eof do
  begin
    if dataSet.FieldByName('sel').AsString = 'S' then
    begin
      _dataSet.Append;
      _dataSet.FieldByName('COD_CLIENTE').AsString := dataSet.FieldByName('COD_CLIENTE').AsString;
      _dataSet.FieldByName('NOME_CLIENTE').AsString := dataSet.FieldByName('NOME_CLIENTE').AsString;
      _dataSet.FieldByName('RAZAO').AsString := dataSet.FieldByName('RAZAO').AsString;
      _dataSet.FieldByName('CPFCGC').AsString := dataSet.FieldByName('CPFCGC').AsString;
      _dataSet.Post;
    end;
    dataSet.Next;
  end;

end;

procedure TClientes_Carga._marcaDesmarcaLinha(pMarcar: Boolean);
var
  vPointer: Pointer;
  I: Integer;
begin
  if dataSet.IsEmpty then
    exit;

  vPointer := dataSet.GetBookmark;
  dataSet.First;
  while not dataSet.Eof do
  begin
    for I := 0 to Length(vCodigoLocalidade) - 1 do
      if  dataSet.FieldByName('cod_localidade').AsInteger = vCodigoLocalidade[I] then
      begin
        dataSet.Edit;
        if not pMarcar then
          dataSet.FieldByName('sel').AsString := ''
        else
          dataSet.FieldByName('sel').AsString := 'S';
        dataSet.Post;
      end;
    dataSet.Next;
  end;
  dataSet.GotoBookmark(vPointer);
end;

function TClientes_Carga._pesquisaVendas: Boolean;
var
	vCodigos: string;
begin
  vCodigos := '';
  _dataSet.First;
  while not _dataSet.Eof do
  begin
    vCodigos := vCodigos + ',' + _dataSet.FieldByName('cod_cliente').AsString;  
    _dataSet.Next;
  end; 

  System.Delete(vCodigos, 1, 1);

  Result := vVendas._abreVendas(vCodigos);
  
end;

procedure TClientes_Carga._marcaDesmarcaLinha;
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

{ TVendas_Carga }

constructor TVendas_Carga.create;
begin
  dataSet := TClientDataSet(dtmOrdemCarregamento.cdsVendasCons);
  transacao := TIBTransaction(dtmOrdemCarregamento.transacao);
  buscas := TIBQuery(dtmOrdemCarregamento.qrBuscas);
  _dataSet := TClientDataSet(dtmOrdemCarregamento.cdsVndTemp);
end;

function TVendas_Carga._abreVendas(pCodigosClientes: string): Boolean;
var
	vSql: string;
begin

  Result := False;

  try
    
    if pCodigosClientes = '' then
      raiseExceptionCreate('Nenhum cliente selecionado','BitBtn16');

    if vNumIni = 0 then
      raiseExceptionCreate('Informe o numero inicial','MaskEdit1');

    if vNumFinal = 0 then
      raiseExceptionCreate('Informe o numero final','MaskEdit2');

    if vDataIni = '  /  /    ' then
      raiseExceptionCreate('Informe a data inicial','EditHw1');

    if vDataFim = '  /  /    ' then
      raiseExceptionCreate('Informe a data final','EditHw2');
  

    if vDadosIni.vEmp.vOC_TipoControleOrdemC = 'NF' then
    begin
      montaSelect('select nf.num_nf num_venda, nf.cod_cliente, cl.nome_cliente, cl.razao,' +
        ' nf.data_lanc data_venda, nf.valor_total, nf.cod_nf cod_venda, ''NF'' TIPO from notafiscal nf' +
        ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
        ' where nf.cod_empresa = ' + vDadosIni.codEmpresa + ' and nf.cod_cliente in ('+pCodigosClientes+')' +
        ' and nf.data_lanc >= :dataIni and nf.data_lanc <= :dataFim and nf.natureza_nf = ''S'' and nf.status = ''Fechada'' and' +
        ' nf.num_nf >= ' + IntToStr(vNumIni) + ' and nf.num_nf <= ' + IntToStr(vNumFinal), StrToDate(vDataIni), StrToDate(vDataFim));
    end
    else
    begin
      montaSelect('select pv.nped num_venda, pv.cod_cliente, cl.nome_cliente, cl.razao,' +
        ' pv.data_fech data_venda, pv.valor_total, pv.nped cod_venda, pv.tipo from pedvenda pv' +
        ' inner join clientes cl on cl.cod_cliente = pv.cod_cliente and cl.cod_empresa = pv.cod_empresa' +
        ' where pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.cod_cliente in ('+pCodigosClientes+')' +
        ' and pv.data_fech >= :dataIni and pv.data_fech <= :dataFim and pv.tipo = ''REQ'' and pv.status_ped = ''FECHADA'' and' +
        ' pv.nped >= ' + IntToStr(vNumIni) + ' and pv.nped <= ' + IntToStr(vNumFinal), StrToDate(vDataIni), StrToDate(vDataFim));
    end;

    dataSet.First;
    while not dataSet.Eof do
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
      dataSet.Next;
    end;

    dataSet.First;
    Result := True;

  except on E: Exception do
    begin
      Result := False;
      Application.MessageBox(pchar('Erro: ' + e.Message), 'Atenção', 64);
    end;
  end;
end;

function TVendas_Carga._adicionaVenda(pCodigoVenda: Integer): Boolean;
begin

  Result := False;

  if vDadosIni.vEmp.vOC_TipoControleOrdemC = 'NF' then
  begin
    montaSelect('select nf.num_nf num_venda, nf.cod_cliente, cl.nome_cliente, cl.razao,' +
      ' nf.data_lanc data_venda, nf.valor_total, nf.cod_nf cod_venda, ''NF'' TIPO from notafiscal nf' +
      ' inner join clientes cl on cl.cod_cliente = nf.cod_cliente and cl.cod_empresa = nf.cod_empresa' +
      ' where nf.cod_empresa = ' + vDadosIni.codEmpresa + ' and nf.cod_nf = ' + IntToStr(pCodigoVenda));
  end
  else
  begin
    montaSelect('select pv.nped num_venda, pv.cod_cliente, cl.nome_cliente, cl.razao,' +
      ' pv.data_fech data_venda, pv.valor_total, pv.nped cod_venda, pv.tipo from pedvenda pv' +
      ' inner join clientes cl on cl.cod_cliente = pv.cod_cliente and cl.cod_empresa = pv.cod_empresa' +
      ' where pv.cod_empresa = ' + vDadosIni.codEmpresa + ' and pv.nped = ' + IntToStr(pCodigoVenda) + ' and pv.tipo = ''REQ''');
  end;

  if not dataSet.IsEmpty then
  begin

    _dataSet.Append;
    _dataSet.FieldByName('NUM_VENDA').AsString := dataSet.FieldByName('NUM_VENDA').AsString;
    _dataSet.FieldByName('NOME_CLIENTE').AsString := dataSet.FieldByName('NOME_CLIENTE').AsString;
    _dataSet.FieldByName('RAZAO').AsString := dataSet.FieldByName('RAZAO').AsString;
    _dataSet.FieldByName('DATA_VENDA').AsDateTime := dataSet.FieldByName('DATA_VENDA').AsDateTime;
    _dataSet.FieldByName('VALOR_TOTAL').AsFloat := dataSet.FieldByName('VALOR_TOTAL').AsFloat;
    _dataSet.FieldByName('COD_VENDA').AsString := dataSet.FieldByName('COD_VENDA').AsString;
    _dataSet.FieldByName('TIPO').AsString := dataSet.FieldByName('TIPO').AsString;
    _dataSet.FieldByName('COD_CLIENTE').AsString := dataSet.FieldByName('COD_CLIENTE').AsString;
    _dataSet.Post;

  end;

  Result := True;

end;

function TVendas_Carga._avancarComVendasSelecionadas: Boolean;
begin
  Result := False;

  try

    vDadosIni.abreStatusProcessamento('','Adicionando clientes selecionados');

    if _dataSet.Tag <> 22 then
      try
        _dataSet.CreateDataSet;
        _dataSet.Tag := 22
      except
      end;

    while not _dataSet.IsEmpty do
      _dataSet.Delete;

    vDadosIni.abreStatusProcessamento('','Adicionando vendas dos clientes selecionados');

    dataSet.First;
    while not dataSet.Eof do
    begin
      if dataSet.FieldByName('sel').AsString = 'S' then
      begin
        _dataSet.Append;
        _dataSet.FieldByName('NUM_VENDA').AsString := dataSet.FieldByName('NUM_VENDA').AsString;
        _dataSet.FieldByName('NOME_CLIENTE').AsString := dataSet.FieldByName('NOME_CLIENTE').AsString;
        _dataSet.FieldByName('RAZAO').AsString := dataSet.FieldByName('RAZAO').AsString;
        _dataSet.FieldByName('DATA_VENDA').AsDateTime := dataSet.FieldByName('DATA_VENDA').AsDateTime;
        _dataSet.FieldByName('VALOR_TOTAL').AsFloat := dataSet.FieldByName('VALOR_TOTAL').AsFloat;
        _dataSet.FieldByName('COD_VENDA').AsString := dataSet.FieldByName('COD_VENDA').AsString;
        _dataSet.FieldByName('TIPO').AsString := dataSet.FieldByName('TIPO').AsString;
        _dataSet.FieldByName('COD_CLIENTE').AsString := dataSet.FieldByName('COD_CLIENTE').AsString;
        _dataSet.Post;
        Result := True;
      end;
      dataSet.Next;
    end;
    _dataSet.IndexFieldNames := 'NUM_VENDA';

    if not Result then
      Application.MessageBox('Nenhuma venda selecinada', 'Atenção', 0 + 64);

  finally
    vDadosIni.fechaStatusProcessamento;
  end;
end;

procedure TVendas_Carga._marcaDesmarcaLinha;
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

{ THistorico_Carga }

constructor THistorico_Carga.create;
begin
  
  if dtmOrdemCarregamento = nil then
    dtmOrdemCarregamento := TdtmOrdemCarregamento.Create(dtmOrdemCarregamento);
  buscas := TIBQuery(dtmOrdemCarregamento.qrBuscas3);
end;

function THistorico_Carga._abreHistorico(pCodVenda: Integer;
  pTipoVenda: string): Boolean;
begin
  buscas.Close;
  buscas.SQL.Text :=
    'select ci.num_fab_prod "Código", ci.descricao "Descrição Mercadoria", ch.quantidade_entregue "Qtde Entrega",' +
    ' ch.data_entrega "Data Entrega", ci.grupo_prod "Grupo Prod", ci.cod_prod "Cod Prod", ch.cod_entrega "Cod Entrega" ' +
    ' from carga_item ci' +
    ' inner join carga_item_historico ch on ch.cod_carga = ci.cod_carga and ch.cod_empresa = ci.cod_empresa and ch.nitem = ci.nitem' +
    ' where ci.cod_venda = ' + IntToStr(pCodVenda) +
    ' and ci.tipo_venda = ' + QuotedStr(pTipoVenda) +
    ' and ci.cod_empresa = ' + vDadosIni.codEmpresa;
  buscas.Open;
end;

{ TMontagemOC }

procedure TMontagemOC.CidadesAfterScroll(DataSet: TDataSet);
begin
//  if (Self.dataSet.FieldByName('COD_CIDADE').AsInteger = 0) and
//    (Trim(Self.dataSet.FieldByName('CIDADE').AsString) = 'SEM CIDADE') then
  vClientes.dataSet.Filter := 'COD_CIDADE = ' + IntToStr(Self.dataSet.FieldByName('COD_CIDADE').AsInteger);
  vClientes.dataSet.Filtered := True;
end;

constructor TMontagemOC.create;
begin
  fPesoTotal := 0;
  fQtdeVendas := 0;
  fCargaSalva := 0;
  fPesoCargaSalva := 0;
  fQtdeVendasSalvas := 0;
  transacao := TIBTransaction(dtmOrdemCarregamento.transacao);
  buscas := TIBQuery(dtmOrdemCarregamento.qrBuscas);

  fDataBase := vDadosIni.getDataBanco(buscas) - 7;

  vVendas := TDataSet_OOP.Create;
  vVendas.dataSet := TClientDataSet.Create(Application);
  vVendas.dataSet.FieldDefs.Add('COD_CLIENTE', ftInteger, 0, False);
  vVendas.dataSet.FieldDefs.Add('SEL', ftString, 1, False);
  vVendas.dataSet.FieldDefs.Add('NPED', ftInteger, 0, False);

  vClientes := TDataSet_OOP.Create;
  vClientes.dataSet := TClientDataSet.Create(Application);
  vClientes.dataSet.FieldDefs.Add('COD_CLIENTE', ftInteger, 0, False);
  vClientes.dataSet.FieldDefs.Add('COD_CIDADE', ftInteger, 0, False);
  vClientes.dataSet.FieldDefs.Add('NOME_CLIENTE', ftString, 35, False);
  vClientes.dataSet.FieldDefs.Add('RAZAO', ftString, 60, False);
  vClientes.dataSet.FieldDefs.Add('QTDE_VENDAS', ftInteger, 0, False);
  vClientes.dataSet.FieldDefs.Add('PESO_BRUTO', ftFloat, 0, False);
  vClientes.dataSet.FieldDefs.Add('SEL', ftString, 1, False);

  dataSet := TClientDataSet.Create(Application);
  dataSet.FieldDefs.Add('COD_CIDADE', ftInteger, 0, False);
  dataSet.FieldDefs.Add('CIDADE', ftString, 30, False);
  dataSet.FieldDefs.Add('QTDE_VENDAS', ftInteger, 0, False);
  dataSet.FieldDefs.Add('PESO_BRUTO', ftFloat, 0, False);
  dataSet.FieldDefs.Add('SEL', ftString, 1, False);
  dataSet.AfterScroll := CidadesAfterScroll;

  if not vVendas.dataSet.Active Then
    try vVendas.dataSet.CreateDataSet; except end;

  if not vClientes.dataSet.Active Then
    try vClientes.dataSet.CreateDataSet; except end;

  if not dataSet.Active Then
    try dataSet.CreateDataSet; except end;

  vDSCidades := TDataSource.Create(Application);
  vDSClientes := TDataSource.Create(Application);
  
  vDSCidades.DataSet := dataSet;
  vDSClientes.DataSet := vClientes.dataSet;
  vDSCidades.AutoEdit := False;
  vDSClientes.AutoEdit := False;

  TFloatField(vClientes.dataSet.FieldByName('PESO_BRUTO')).DisplayFormat := '##0.00';
  TFloatField(dataSet.FieldByName('PESO_BRUTO')).DisplayFormat := '##0.00';
  dataSet.IndexFieldNames := 'CIDADE';

end;

function TMontagemOC.iniciarMontagem: boolean;
begin

  fQtdeVendasSalvas := 0;
  fPesoCargaSalva := 0;
  
  if fCargaSalva > 0 then
  begin
    buscas.Close;
    buscas.SQL.Text := 'select count(distinct(ci.num_venda)) qtde_vendas, sum(ci.quantidade_venda * p.peso_brut_prod) PESO_BRUTO' +
      ' from carga c' +
      ' inner join carga_item ci on ci.cod_carga = c.cod_carga and ci.cod_empresa = c.cod_empresa' +
      ' inner join produtos p on p.grupo_prod = ci.grupo_prod and p.cod_prod = ci.cod_prod and p.cod_empresa = ci.cod_empresa' +
      ' where c.cod_carga = ' + IntToStr(fCargaSalva) +
      ' and c.cod_empresa = ' + vDadosIni.codEmpresa;
    buscas.Open;

    fQtdeVendasSalvas := buscas.FieldByName('qtde_vendas').AsInteger;
    fPesoCargaSalva := buscas.FieldByName('PESO_BRUTO').AsFloat;
  end;

  buscas.Close;
  buscas.SQL.Text := 'select coalesce(c.cod_cidade, 0) cod_cidade, coalesce(c.nome_cidade,''SEM CIDADE'') CIDADE,' +
    ' cl.cod_cliente, cl.nome_cliente, cl.razao, pv.nped,' +
    ' count(distinct(pv.nped)) qtde_vendas,' +
    ' sum(coalesce(p.peso_brut_prod,0) * (pp.quant_ped_item)) PESO_BRUTO' +
    ' from pedvenda pv' +
    ' inner join pedvenda_prod pp on pp.nped = pv.nped and pp.tipo = pv.tipo and pp.cod_empresa = pv.cod_empresa and coalesce(pp.status,'''') <> ''CANCELADO''' +
    ' inner join produtos p on p.grupo_prod = pp.grupo_prod and p.cod_prod = pp.cod_prod and p.cod_empresa = pp.cod_empresa' +
    ' inner join clientes cl on cl.cod_cliente = pv.cod_cliente and cl.cod_empresa = pv.cod_empresa' +
    ' left join cidades c on c.cod_cidade = cl.cod_cidade' +
    ' where pv.tipo = ''REQ'' and pv.data_fech >= :data_fech and pv.cod_empresa = ' +vDadosIni.codEmpresa +
    ' and coalesce(pv.cod_carga,0) = 0' +
    ' and coalesce(pv.metodo_entrega,''CARREGAMENTO PROPRIO'') = ''CARREGAMENTO PROPRIO'' and' +
    ' coalesce(pv.status_ped,'''') <> ''CANCELADO''' +
    ' group by 1, 2, 3, 4, 5, 6';
  buscas.ParamByName('data_fech').AsDate := fDataBase;
  buscas.Open;

  vVendas.dataSet.EmptyDataSet;
  vClientes.dataSet.EmptyDataSet;
  dataSet.EmptyDataSet;

//  while not vVendas.dataSet.IsEmpty do
//    vVendas.dataSet.Delete;
//
//  while not vClientes.dataSet.IsEmpty do
//    vClientes.dataSet.Delete;
//
//  while not dataSet.IsEmpty do
//    dataSet.Delete;

  fPesoTotal := 0;
  fQtdeVendas := 0;

  buscas.FetchAll;
  if vProgresso <> nil then
  begin
    vProgresso.Min := 0;
    vProgresso.Position := 0;
    vProgresso.Max := buscas.RecordCount;
  end;

  buscas.First;
  while not buscas.Eof do
  begin
    fPesoTotal := fPesoTotal + buscas.FieldByName('peso_bruto').AsFloat;
    fQtdeVendas := fQtdeVendas + buscas.FieldByName('qtde_vendas').AsInteger;

    vVendas.dataSet.Insert;
    vVendas.dataSet.FieldByName('cod_cliente').AsInteger := buscas.FieldByName('cod_cliente').AsInteger;
    vVendas.dataSet.FieldByName('nped').AsInteger := buscas.FieldByName('nped').AsInteger;
    vVendas.dataSet.FieldByName('sel').AsString := 'S';
    vVendas.dataSet.Post;

    vClientes.dataSet.Filter := 'COD_CLIENTE = ' + IntToStr(buscas.FieldByName('COD_CLIENTE').AsInteger);
    vClientes.dataSet.Filtered := True;

    if vClientes.dataSet.FieldByName('COD_CLIENTE').AsInteger = buscas.FieldByName('COD_CLIENTE').AsInteger then
      vClientes.dataSet.Edit
    else
      vClientes.dataSet.Insert;
    vClientes.dataSet.FieldByName('cod_cliente').AsInteger := buscas.FieldByName('cod_cliente').AsInteger;
    vClientes.dataSet.FieldByName('cod_cidade').AsInteger := buscas.FieldByName('cod_cidade').AsInteger;
    vClientes.dataSet.FieldByName('nome_cliente').AsString := buscas.FieldByName('nome_cliente').AsString;
    vClientes.dataSet.FieldByName('razao').AsString := buscas.FieldByName('razao').AsString;
    vClientes.dataSet.FieldByName('qtde_vendas').AsInteger := vClientes.dataSet.FieldByName('qtde_vendas').AsInteger +
      buscas.FieldByName('qtde_vendas').AsInteger;
    vClientes.dataSet.FieldByName('peso_bruto').AsFloat := vClientes.dataSet.FieldByName('peso_bruto').AsFloat +
      buscas.FieldByName('peso_bruto').AsFloat;
    vClientes.dataSet.FieldByName('sel').AsString := 'S';
    vClientes.dataSet.Post;
    
    dataSet.Filter := 'COD_CIDADE = ' + IntToStr(buscas.FieldByName('COD_CIDADE').AsInteger);
    dataSet.Filtered := True;

    if (dataSet.FieldByName('COD_CIDADE').AsInteger = buscas.FieldByName('COD_CIDADE').AsInteger) and
      (Trim(dataSet.FieldByName('CIDADE').AsString) = Trim(buscas.FieldByName('CIDADE').AsString)) then
      dataSet.Edit
    else
      dataSet.Insert;
    dataSet.FieldByName('cod_cidade').AsInteger := buscas.FieldByName('cod_cidade').AsInteger;
    dataSet.FieldByName('cidade').AsString := buscas.FieldByName('cidade').AsString;
    dataSet.FieldByName('qtde_vendas').AsInteger := dataSet.FieldByName('qtde_vendas').AsInteger +
      buscas.FieldByName('qtde_vendas').AsInteger;
    dataSet.FieldByName('peso_bruto').AsFloat := dataSet.FieldByName('peso_bruto').AsFloat +
      buscas.FieldByName('peso_bruto').AsFloat;
    dataSet.FieldByName('sel').AsString := 'S';
    dataSet.Post;

    buscas.Next;
    if vProgresso <> nil then
      vProgresso.Position := vProgresso.Position + 1;
    Application.ProcessMessages;
  end;

  dataSet.Filtered := False;
  dataSet.Filter := '';
  dataSet.First;

  
end;

procedure TMontagemOC.marcaDemarcaCidade;
begin
  vClientes.dataSet.Filter := 'COD_CIDADE = ' + IntToStr(dataSet.FieldByName('COD_CIDADE').AsInteger);
  vClientes.dataSet.Filtered := True;

  vClientes.First;
  while not vClientes.dataSet.Eof do
  begin

    if Trim(dataSet.FieldByName('sel').AsString) = 'S' then
    begin
      if vClientes.dataSet.FieldByName('COD_CIDADE').AsInteger = dataSet.FieldByName('COD_CIDADE').AsInteger then
        if Trim(vClientes.dataSet.FieldByName('sel').AsString) = 'S' then
          marcaDesmarcaCliente;
    end
    else if vClientes.dataSet.FieldByName('COD_CIDADE').AsInteger = dataSet.FieldByName('COD_CIDADE').AsInteger then
      if Trim(vClientes.dataSet.FieldByName('sel').AsString) = '' then
        marcaDesmarcaCliente;

    vClientes.dataSet.Next;
  end;

  dataSet.Edit;
  if Trim(dataSet.FieldByName('sel').AsString) = 'S' then
    dataSet.FieldByName('sel').AsString := ''
  else
    dataSet.FieldByName('sel').AsString := 'S';
  dataSet.Post;

end;

procedure TMontagemOC.marcaDesmarcaCliente(pAlterarCidade: Boolean = False);
begin
  vVendas.dataSet.Filter := 'COD_CLIENTE = ' + IntToStr(vClientes.dataSet.FieldByName('COD_CLIENTE').AsInteger);
  vVendas.dataSet.Filtered := True;

  if Trim(vClientes.dataSet.FieldByName('sel').AsString) = 'S' then
  begin
    vVendas.First;
    while not vVendas.dataSet.Eof do
    begin
      if vVendas.dataSet.FieldByName('COD_CLIENTE').AsInteger = vClientes.dataSet.FieldByName('COD_CLIENTE').AsInteger then
      begin
        vVendas.dataSet.Edit;
        vVendas.dataSet.FieldByName('sel').AsString := '';
        vVendas.dataSet.Post;
      end;
      vVendas.Next;
    end;

    fPesoTotal := fPesoTotal - vClientes.dataSet.FieldByName('peso_bruto').AsFloat;
    fQtdeVendas := fQtdeVendas - vClientes.dataSet.FieldByName('qtde_vendas').AsInteger;

    vClientes.dataSet.Edit;
    vClientes.dataSet.FieldByName('sel').AsString := '';
    vClientes.dataSet.Post;
  end
  else
  begin
    vVendas.First;
    while not vVendas.dataSet.Eof do
    begin
      if vVendas.dataSet.FieldByName('COD_CLIENTE').AsInteger = vClientes.dataSet.FieldByName('COD_CLIENTE').AsInteger then
      begin
        vVendas.dataSet.Edit;
        vVendas.dataSet.FieldByName('sel').AsString := 'S';
        vVendas.dataSet.Post;
      end;
      vVendas.Next;
    end;

    fPesoTotal := fPesoTotal + vClientes.dataSet.FieldByName('peso_bruto').AsFloat;
    fQtdeVendas := fQtdeVendas + vClientes.dataSet.FieldByName('qtde_vendas').AsInteger;

    vClientes.dataSet.Edit;
    vClientes.dataSet.FieldByName('sel').AsString := 'S';
    vClientes.dataSet.Post;

    if (Trim(vVendas.dataSet.FieldByName('sel').AsString) = 'S') and (pAlterarCidade) then
    begin
      dataSet.Edit;
      dataSet.FieldByName('sel').AsString := 'S';
      dataSet.Post;
    end;

  end;
end;

{ TMontagemPorRota }

procedure TMontagemPorRota.configurarDataSets;
var
  I: Integer;
  Adisplay: string;
begin
  for I := 0 to dataSet.Fields.Count - 1 do with dataSet.Fields[I] do
  begin
    Adisplay     := Trim(StringReplace(LowerCase(FieldName), '_', ' ', [rfReplaceAll, rfIgnoreCase]));
    DisplayLabel := UpperCase(Copy(Adisplay, 1, 1)) + Copy(Adisplay, 2, Length(Adisplay));
    Visible := False;
  end;

  dataSet.FieldByName('ordem').Visible := False;
  dataSet.FieldByName('cod_empresa').Visible := False;
  dataSet.FieldByName('cod_cidade').Visible := False;
  dataSet.FieldByName('cod_localidade').Visible := False;

  dataSet.FieldByName('peso_b').DisplayLabel       := 'Peso';
  dataSet.FieldByName('dest_seqid').DisplayLabel   := 'Cod.End';
  dataSet.FieldByName('setor').DisplayLabel        := 'Setor';
  dataSet.FieldByName('localidade').DisplayLabel   := 'Localidade';
  dataSet.FieldByName('email').DisplayLabel        := 'email';
  dataSet.FieldByName('telefone').DisplayLabel     := 'Telefone';
  dataSet.FieldByName('uf').DisplayLabel           := 'UF';
  dataSet.FieldByName('cidade').DisplayLabel       := 'Cidade';
  dataSet.FieldByName('cep').DisplayLabel          := 'CEP';
  dataSet.FieldByName('bairro').DisplayLabel       := 'Bairro';
  dataSet.FieldByName('complemento').DisplayLabel  := 'Complemento';
  dataSet.FieldByName('numero').DisplayLabel       := 'Num';
  dataSet.FieldByName('logradouro').DisplayLabel   := 'Logr';
  dataSet.FieldByName('tipo_end').DisplayLabel     := 'Tp End';
  dataSet.FieldByName('insc_est').DisplayLabel     := 'Insc.Est';
  dataSet.FieldByName('cpfcgc').DisplayLabel       := 'CPF/CNPJ';
  dataSet.FieldByName('razao').DisplayLabel        := 'Cliente/Razão';
  dataSet.FieldByName('nome_cliente').DisplayLabel := 'Cliente/Nome';
  dataSet.FieldByName('cod_cliente').DisplayLabel  := 'Cod. Cliente';
  dataSet.FieldByName('tipo').DisplayLabel         := 'Tipo';
  dataSet.FieldByName('status_ped').DisplayLabel   := 'Status';
  dataSet.FieldByName('data_fech').DisplayLabel    := 'Data Fech';
  dataSet.FieldByName('valor_total').DisplayLabel  := 'Valor';
  dataSet.FieldByName('nped').DisplayLabel         := 'Num Ped';
  dataSet.FieldByName('data_ped').DisplayLabel     := 'Data';
  dataSet.FieldByName('sel').DisplayLabel          := '..';

  dataSet.FieldByName('peso_b').Visible       := True;
  dataSet.FieldByName('dest_seqid').Visible   := True;
  dataSet.FieldByName('setor').Visible        := True;
  dataSet.FieldByName('localidade').Visible   := True;
  dataSet.FieldByName('email').Visible        := True;
  dataSet.FieldByName('telefone').Visible     := True;
  dataSet.FieldByName('uf').Visible           := True;
  dataSet.FieldByName('cidade').Visible       := True;
  dataSet.FieldByName('cep').Visible          := True;
  dataSet.FieldByName('bairro').Visible       := True;
  dataSet.FieldByName('complemento').Visible  := True;
  dataSet.FieldByName('numero').Visible       := True;
  dataSet.FieldByName('logradouro').Visible   := True;
  dataSet.FieldByName('tipo_end').Visible     := True;
  dataSet.FieldByName('insc_est').Visible     := True;
  dataSet.FieldByName('cpfcgc').Visible       := True;
  dataSet.FieldByName('razao').Visible        := True;
  dataSet.FieldByName('nome_cliente').Visible := True;
  dataSet.FieldByName('cod_cliente').Visible  := True;
  dataSet.FieldByName('tipo').Visible         := True;
  dataSet.FieldByName('status_ped').Visible   := True;
  dataSet.FieldByName('data_fech').Visible    := True;
  dataSet.FieldByName('valor_total').Visible  := True;
  dataSet.FieldByName('nped').Visible         := True;
  dataSet.FieldByName('data_ped').Visible     := True;
  dataSet.FieldByName('sel').Visible          := True;

  dataSet.FieldByName('peso_b').Index       := 0;
  dataSet.FieldByName('dest_seqid').Index   := 0;
  dataSet.FieldByName('setor').Index        := 0;
  dataSet.FieldByName('localidade').Index   := 0;
  dataSet.FieldByName('email').Index        := 0;
  dataSet.FieldByName('telefone').Index     := 0;
  dataSet.FieldByName('uf').Index           := 0;
  dataSet.FieldByName('cidade').Index       := 0;
  dataSet.FieldByName('cep').Index          := 0;
  dataSet.FieldByName('bairro').Index       := 0;
  dataSet.FieldByName('complemento').Index  := 0;
  dataSet.FieldByName('numero').Index       := 0;
  dataSet.FieldByName('logradouro').Index   := 0;
  dataSet.FieldByName('tipo_end').Index     := 0;
  dataSet.FieldByName('insc_est').Index     := 0;
  dataSet.FieldByName('cpfcgc').Index       := 0;
  dataSet.FieldByName('razao').Index        := 0;
  dataSet.FieldByName('nome_cliente').Index := 0;
  dataSet.FieldByName('cod_cliente').Index  := 0;
  dataSet.FieldByName('tipo').Index         := 0;
  dataSet.FieldByName('status_ped').Index   := 0;
  dataSet.FieldByName('data_fech').Index    := 0;
  dataSet.FieldByName('valor_total').Index  := 0;
  dataSet.FieldByName('nped').Index         := 0;
  dataSet.FieldByName('data_ped').Index     := 0;
  dataSet.FieldByName('sel').Index          := 0;

  TFloatField(dataSet.FieldByName('valor_total')).DisplayFormat := '#,##0.00';
  TFloatField(dataSet.FieldByName('peso_b')).DisplayFormat      := '#,##0.000';

  Fdsource.DataSet := dataSet;
  Fdsource.AutoEdit := False;
end;

constructor TMontagemPorRota.create;
begin
  FpedidosAbertos := 0;
  transacao       := Create_fb_transaction(dtmAtivo.bancoHw);
  buscas          := Create_fb_query(transacao);
  FClient         := TClientDataSet.Create(buscas.Owner);
  Fdsource        := TDataSource.Create(buscas.Owner);
end;

destructor TMontagemPorRota.Destroy;
begin
  if Assigned(FClient) then
    FreeAndNil(FClient);
  if Assigned(Fdsource) then
    FreeAndNil(Fdsource);
  if Assigned(Fpedidos) then
    FreeAndNil(Fpedidos);
  if Assigned(FpedidosSel) then
    FreeAndNil(FpedidosSel);
  if Assigned(FrotaSel) then
    FreeAndNil(FrotaSel);

  inherited;
end;

procedure TMontagemPorRota.field_sel_change(Sender: TField);
var
  I: Integer;
begin
  try
  if f_str('sel') = '' then
    for I := 0 to FpedidosSel.Count - 1 do with FpedidosSel.Items[I] do
      if nped = f_int('nped') then
      begin
        FpedidosSel.pesoTotal := FpedidosSel.pesoTotal - peso_b;
        FpedidosSel.Delete(I);
        Break;
      end;
  if f_str('sel') = 'S' then
  begin
    for I := 0 to FpedidosSel.Count - 1 do with FpedidosSel.Items[I] do
      if nped = f_int('nped') then
        Exit;
    for I := 0 to Fpedidos.Count - 1 do with Fpedidos.Items[I] do
      if nped = f_int('nped') then
      begin
        FpedidosSel.Add(Clone_obj);
        FpedidosSel.pesoTotal := FpedidosSel.pesoTotal + peso_b;
        Break;
      end;
  end;
  finally
    if Assigned(FpesoChange) then
      FpesoChange;
  end;
end;

function TMontagemPorRota.GetRotasAtivas: TRotas_entr_classList;
begin
  Result := TRotas_entr_classList.Create;
  SqlOpen('select ' + TRotas_entr_class.GetFieldsSql('re') + ' from ROTAS_ENTR re' +
          ' where re.cod_empresa = %s ' +
          ' order by re.rota',
          [vDadosIni.codEmpresa]).First;
  while not buscas.Eof do
  begin
    Result.New.SetValuesFrom(buscas);
    buscas.Next;
  end;
  buscas.Close;
end;

function TMontagemPorRota.iniciarMontagem(AdataIni, AdataFim: string): boolean;
var
  I: Integer;
  Acod_pedidos: arrayInt;
begin
  Result := False;

  try
    buscas.Close;
    buscas.SQL.Text := Format('select pvc.nped, pvc.tipo, pvc.data_ped, pvc.data_fech, pvc.valor_total, pvc.status_ped, pvc.ordem, ' + TVw_clientes_dest_class.GetFieldsSql('cd') +
                              ' from (select pv.nped, pv.tipo, pv.data_ped, pv.data_fech, pv.valor_total, pv.status_ped, pv.cod_empresa, pv.cod_cliente,' +
                              '              coalesce(pv.dest_seqid, 0) dest_seqid, rc.ordem' +
                              '       from pedvenda pv' +
                              '       inner join rotas_entr_cliente rc on rc.cod_rota = %d and rc.cod_empresa = pv.cod_empresa and' +
                              '             rc.cod_cliente = pv.cod_cliente and rc.end_doc_add_seqid = coalesce(pv.dest_seqid, 0)' +
                              '       where pv.data_ped >= :dataini and pv.data_ped <= :datafim and pv.cod_empresa = %s and' +
                              '             coalesce(pv.cod_carga, 0) = 0 and coalesce(pv.status_ped, '''') <> ''CANCELADO'' and pv.tipo = ''REQ'' ' +
                              //'             coalesce(pv.cod_carga, 0) = 0 and coalesce(pv.status_ped, '''') = ''FECHADA'' and pv.tipo = ''REQ'' ' +
                              '       order by rc.ordem) as pvc' +
                              ' inner join sp_clientes_dest(pvc.cod_cliente, pvc.cod_empresa, pvc.dest_seqid, null, null) cd on 1 = 1' +
                              ' order by pvc.ordem',
                              [rotaSel.cod_rota, vDadosIni.codEmpresa]);
    buscas.ParamByName('dataini').AsDate := StrToDate(AdataIni);
    buscas.ParamByName('datafim').AsDate := StrToDate(AdataFim);
    buscas.Open;

    {$REGION 'verificando pedidos abertos para enviar ao modulo de fechamento e fechar'}
    {SetLength(Acod_pedidos, 0);
    buscas.First;
    while not buscas.Eof do
    begin
      if Trim(buscas.FieldByName('status_ped').AsString) = '' then
      begin
        SetLength(Acod_pedidos, Succ(Length(Acod_pedidos)));
        Acod_pedidos[High(Acod_pedidos)] := buscas.FieldByName('nped').AsInteger;
      end;

      buscas.Next;
    end;
    if Length(Acod_pedidos) > 0 then
    begin
      vDadosIni.ShowConfirmacao
    end;
    }
    {$ENDREGION}

    if not Assigned(dataSet) then
    begin
      for I := 0 to buscas.FieldCount - 1 do with buscas.Fields[I] do
        FClient.FieldDefs.Add(FieldName, DataType, Size, False);
      FClient.FieldDefs.Add('SEL', ftString, 1, False);
      FClient.FieldDefs.Add('PESO_B', ftFloat, 0, False);
      FClient.CreateDataSet;

      dataSet := TClientDataSet(FClient);
      configurarDataSets;
    end;

    dataSet.DisableControls;
    try
      dataset.FieldByName('sel').OnChange := nil;

      if not Assigned(Fpedidos) then
        Fpedidos := TPedidosPorRotaList.Create;

      if not Assigned(FpedidosSel) then
        FpedidosSel := TPedidosPorRotaList.Create;

      dataSet.EmptyDataSet;
      FpedidosSel.Clear;
      Fpedidos.Clear;
      FpedidosSel.pesoTotal := 0;
      Fpedidos.pesoTotal := 0;

      buscas.First;
      while not buscas.Eof do
      begin
        Fpedidos.New.SetValuesFrom(buscas);
        FpedidosSel.New.SetValuesFrom(buscas);
        dataSet.Append;
        for I := 0 to buscas.FieldCount - 1 do
          dataSet.FieldByName(buscas.Fields[I].FieldName).Value := buscas.Fields[I].Value;
        dataSet.FieldByName('SEL').AsString := 'S';
        dataSet.Post;
        buscas.Next;
      end;

      FpedidosAbertos := 0;

      for I := 0 to Fpedidos.Count - 1 do with Fpedidos.Items[I] do
      begin
        Fpedidos.Items[I].peso_b := SqlOpen('select sum(coalesce(pvp.quant_ped_item, 0) * coalesce(pr.peso_brut_prod, 0)) peso_b' +
                                            ' from pedvenda_prod pvp' +
                                            ' inner join produtos pr on (pvp.grupo_prod = pr.grupo_prod) and (pvp.cod_prod = pr.cod_prod) and (pvp.cod_empresa = pr.cod_empresa)' +
                                            ' where pvp.nped = %d and pvp.tipo = %s and pvp.cod_empresa = %d' +
                                            'and coalesce(pvp.status, '''') <> ''CANCELADO''',
                                            [nped, QuotedStr(tipo), cod_empresa]).FieldByName('peso_b').AsFloat;
        FpedidosSel.Items[I].peso_b := Fpedidos.Items[I].peso_b;

        FpedidosAbertos := IfThen(FpedidosSel.Items[I].status_ped = '', Succ(FpedidosAbertos), FpedidosAbertos);
      end;

      dataSet.First;
      while not dataSet.Eof do
      begin
        dataSet.Edit;
        for I := 0 to Fpedidos.Count - 1 do with Fpedidos.Items[I] do
          if nped = dataSet.FieldByName('nped').AsInteger then
          begin
            dataSet.FieldByName('peso_b').AsFloat := peso_b;
            Break;
          end;

        dataSet.Next;
      end;

      for I := 0 to FpedidosSel.Count - 1 do with FpedidosSel.Items[I] do
        FpedidosSel.pesoTotal := FpedidosSel.pesoTotal + peso_b;

    finally
      buscas.Close;
      dataSet.FIRST;
      dataSet.EnableControls;
      dataset.FieldByName('sel').OnChange := field_sel_change;
      if Assigned(FpesoChange) then
        FpesoChange;
    end;

    Result := True;
  except on E: Exception do
    begin
      vDadosIni.ShowErro('Erro na montagem da carga pela rota. ' + E.Message);
      registraErro('TMontagemPorRota.iniciarMontagem ' + E.Message);
    end;
  end;
end;

{ TPedidosPorRota }

function TPedidosPorRota.Clone_obj: TPedidosPorRota;
begin
  Result             := TPedidosPorRota.Create;
  Result.nped        := Self.nped;
  Result.tipo        := Self.tipo;
  Result.data_ped    := Self.data_ped;
  Result.data_fech   := Self.data_fech;
  Result.valor_total := Self.valor_total;
  Result.status_ped  := Self.status_ped;
  Result.peso_b      := Self.peso_b;

  Result.cod_cliente    := Self.cod_cliente;
  Result.cod_empresa    := Self.cod_empresa;
  Result.dest_seqid     := Self.dest_seqid;
  Result.nome_cliente   := Self.nome_cliente;
  Result.razao          := Self.razao;
  Result.cpfcgc         := Self.cpfcgc;
  Result.insc_est       := Self.insc_est;
  Result.tipo_end       := Self.tipo_end;
  Result.logradouro     := Self.logradouro;
  Result.numero         := Self.numero;
  Result.bairro         := Self.bairro;
  Result.cep            := Self.cep;
  Result.complemento    := Self.complemento;
  Result.cidade         := Self.cidade;
  Result.uf             := Self.uf;
  Result.telefone       := Self.telefone;
  Result.email          := Self.email;
  Result.localidade     := Self.localidade;
  Result.setor          := Self.setor;
  Result.cod_cidade     := Self.cod_cidade;
  Result.cod_localidade := Self.cod_localidade;
  Result.ativo          := Self.ativo;
end;

procedure TPedidosPorRota.SetValuesFrom(ADataSet: TDataSet);
begin
  inherited;
  Fnped        := ADataSet.FieldByName('NPED').AsInteger;
  Ftipo        := Trim(ADataSet.FieldByName('TIPO').AsString);
  Fdata_ped    := ADataSet.FieldByName('DATA_PED').AsDateTime;
  Fdata_fech   := ADataSet.FieldByName('DATA_FECH').AsDateTime;
  Fvalor_total := ADataSet.FieldByName('VALOR_TOTAL').AsFloat;
  Fstatus_ped  := Trim(ADataSet.FieldByName('STATUS_PED').AsString);
end;

{ TPedidosPorRotaList }

function TPedidosPorRotaList.GetItem(Index: Integer): TPedidosPorRota;
begin
  Result := TPedidosPorRota(inherited Items[Index]);
end;

function TPedidosPorRotaList.New: TPedidosPorRota;
begin
  Result := TPedidosPorRota.Create;
  Add(Result);
end;

procedure TPedidosPorRotaList.SetItem(Index: Integer;
  const Value: TPedidosPorRota);
begin
  Put(Index, Value);
end;

end.
