unit Test_SincronizadorCalculadoraService;

interface

uses
  Classes,
  System.SysUtils,
  DUnitX.TestFramework,
  IProgressObserverUnit,
  IDadosFiscaisReaderUnit,
  IDadosFiscaisWriterUnit,
  SincronizacaoCalculadoraSnapshotUnit,
  ISincronizadorCalculadoraServiceUnit,
  SincronizadorCalculadoraServiceUnit,
  VersaoSerproEtdUnit,
  StringNullableUnit,
  EstadoEtdUnit,
  MunicipioEtdUnit,
  NcmEtdUnit,
  NbsEtdUnit,
  AnexoEtdUnit,
  TipoDfeEtdUnit,
  TipoDfeClassificacaoEtdUnit,
  FundamentacaoLegalEtdUnit,
  TomadorEspecificoEtdUnit,
  AliquotaReferenciaEtdUnit,
  AliquotaPadraoEtdUnit,
  SituacaoTributariaEtdUnit,
  ClassificacaoTributariaEtdUnit,
  PercentualReducaoEtdUnit,
  NcmAplicavelEtdUnit,
  NbsAplicavelEtdUnit,
  FundamentacaoClassificacaoEtdUnit,
  ExcecaoNcmAplicavelEtdUnit,
  ExcecaoNbsAplicavelEtdUnit,
  TributoSituacaoTributariaEtdUnit,
  TratamentoTributarioEtdUnit,
  TratamentoClassificacaoEtdUnit,
  AliquotaAdValoremEtdUnit,
  AliquotaAdValoremProdutoEtdUnit,
  ExcecaoAdValoremProdutoEtdUnit,
  UnidadeMedidaEtdUnit,
  AliquotaAdRemEtdUnit,
  AliquotaAdRemProdutoEtdUnit,
  ExcecaoAdRemProdutoEtdUnit,
  AliquotaAdValoremServicoEtdUnit,
  ExcecaoAdValoremServicoEtdUnit,
  AliquotaAdRemServicoEtdUnit,
  ExcecaoAdRemServicoEtdUnit,
  RedutorCompraGovernamentalEtdUnit,
  TransferenciaCBSEnteGovEtdUnit,
  ListaServicosLC116EtdUnit,
  IndicadorOperacaoEtdUnit,
  IndicadorOpNbsClassificacaoEtdUnit;

type
  /// <summary>
  ///   Spy de IProgressObserver que acumula mensagens e erros para assercao.
  ///   Nao registra token; apenas o conteudo recebido do servico.
  /// </summary>
  TFakeObserverSincronizador = class(TInterfacedObject, IProgressObserver)
  private
    FMessages: TStringList;
    FErrors: TStringList;
    function ListaContem(const ALista: TStrings; const ATexto: string): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    procedure OnMessage(const Message: string);
    procedure OnWarning(const Warning: string);
    procedure OnError(const Error: string);
    procedure OnProgress(Progress: Integer);
    procedure OnCounter(Current, Total: Integer);
    procedure OnStart;
    procedure OnComplete;
    procedure OnCancel;
    procedure CancelRequest;
    function IsCancellationRequested: Boolean;

    function ErroContem(const ATexto: string): Boolean;
    property Messages: TStringList read FMessages;
    property Errors: TStringList read FErrors;
  end;

  /// <summary>
  ///   Fake de IDadosFiscaisReader. Devolve colecoes nulas (o servico apenas
  ///   transporta para o snapshot) e uma versao configuravel. Registra cada
  ///   metodo de leitura para permitir assercao de leitura completa.
  /// </summary>
  TFakeDadosFiscaisReader = class(TInterfacedObject, IDadosFiscaisReader)
  private
    FVersao: VersaoSerproEtd;
    FChamadas: TStringList;
    FTotalLeituras: Integer;
    FConfigurarChamado: Boolean;
    FFalharEm: string;
    procedure Registrar(const AMetodo: string);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Configurar(const ABaseUrl, AToken, ADatabase: string);
    function ObterUltimaVersao(): VersaoSerproEtd;
    function ObterEstados(): EstadosEtd;
    function ObterMunicipios(): MunicipiosEtd;
    function ObterNBSs(): NbssEtd;
    function ObterAnexos(): AnexosEtd;
    function ObterTiposDFe(): TiposDfeEtd;
    function ObterFundamentacoesLegais(): FundamentacoesLegaisEtd;
    function ObterTomadoresEspecificos(): TomadoresEspecificosEtd;
    function ObterAliquotasReferencia(): AliquotasReferenciaEtd;
    function ObterAliquotasPadrao(): AliquotasPadraoEtd;
    function ObterSituacoesTributarias(): SituacoesTributariasEtd;
    function ObterClassificacoesTributarias(): ClassificacoesTributariasEtd;
    function ObterTiposDFePorClassificacao(): TipoDfeClassificacaoEtdList;
    function ObterPercentuaisReducao(): PercentuaisReducaoEtd;
    function ObterNCMsAplicaveis(): NcmsAplicaveisEtd;
    function ObterNBSsAplicaveis(): NbssAplicaveisEtd;
    function ObterFundamentacoesClassificacoes(): FundamentacoesClassificacoesEtd;
    function ObterExcecoesNCMAplicavel(): ExcecoesNcmAplicavelEtd;
    function ObterExcecoesNBSAplicavel(): ExcecoesNbsAplicavelEtd;
    function ObterTributoSituacoesTributarias(): TributoSituacoesTributariasEtd;
    function ObterTratamentosTributarios(): TratamentosTributariosEtd;
    function ObterTratamentosClassificacoes(): TratamentosClassificacoesEtd;
    function ObterAliquotasAdValorem(): AliquotasAdValoremEtd;
    function ObterAliquotasAdValoremProdutos(): AliquotasAdValoremProdutosEtd;
    function ObterExcecoesAdValoremProdutos(): ExcecoesAdValoremProdutosEtd;
    function ObterUnidadesMedidas(): UnidadesMedidasEtd;
    function ObterAliquotasAdRem(): AliquotaAdRemEtdList;
    function ObterAliquotasAdRemProdutos(): AliquotasAdRemProdutosEtd;
    function ObterExcecoesAdRemProdutos(): ExcecoesAdRemProdutosEtd;
    function ObterAliquotasAdValoremServicos(): AliquotasAdValoremServicosEtd;
    function ObterExcecoesAdValoremServicos(): ExcecoesAdValoremServicosEtd;
    function ObterAliquotasAdRemServicos(): AliquotasAdRemServicosEtd;
    function ObterExcecoesAdRemServicos(): ExcecoesAdRemServicosEtd;
    function ObterRedutoresCompraGovernamental(): RedutoresCompraGovernamentalEtd;
    function ObterTransferenciasCBSEnteGov(): TransferenciaCBSEnteGovEtdList;
    function ObterListaServicosLC116(): ListaServicosLC116EtdList;
    function ObterIndicadoresOperacaoIbsCbs(): IndicadoresOperacaoEtd;
    function ObterClassificacoesNbsIndOpLc(): IndicadoresOpNbsClassificacaoEtd;

    procedure ConfigurarVersao(const AId: Integer; const AData: TDateTime);
    procedure FalharEm(const AMetodo: string);

    property Chamadas: TStringList read FChamadas;
    property TotalLeituras: Integer read FTotalLeituras;
    property ConfigurarChamado: Boolean read FConfigurarChamado;
  end;

  /// <summary>
  ///   Fake de IDadosFiscaisWriter. Registra a ordem das chamadas, permite
  ///   configurar a versao local e simular falha em um metodo de escrita.
  /// </summary>
  TFakeDadosFiscaisWriter = class(TInterfacedObject, IDadosFiscaisWriter)
  private
    FChamadas: TStringList;
    FVersaoAtual: VersaoSerproEtd;
    FFalharEm: string;
    procedure Registrar(const AMetodo: string);
  public
    constructor Create;
    destructor Destroy; override;

    procedure ExcluirTodosDadosFiscais();
    function ObterUltimaVersao(): VersaoSerproEtd;
    procedure SalvarEstados(const Dados: EstadosEtd);
    procedure SalvarMunicipios(const Dados: MunicipiosEtd);
    procedure SalvarAnexos(const Dados: AnexosEtd);
    procedure SalvarTiposDFe(const Dados: TiposDfeEtd);
    procedure SalvarNCMs(const Dados: NcmsEtd);
    procedure SalvarNBSs(const Dados: NbssEtd);
    procedure SalvarFundamentacoesLegais(const Dados: FundamentacoesLegaisEtd);
    procedure SalvarTomadoresEspecificos(const Dados: TomadoresEspecificosEtd);
    procedure SalvarAliquotasReferencia(const Dados: AliquotasReferenciaEtd);
    procedure SalvarAliquotasPadrao(const Dados: AliquotasPadraoEtd);
    procedure SalvarSituacoesTributarias(const Dados: SituacoesTributariasEtd);
    procedure SalvarClassificacoesTributarias(const Dados: ClassificacoesTributariasEtd);
    procedure SalvarTiposDFePorClassificacao(const Dados: TipoDfeClassificacaoEtdList);
    procedure SalvarPercentuaisReducao(const Dados: PercentuaisReducaoEtd);
    procedure SalvarNCMsAplicaveis(const Dados: NcmsAplicaveisEtd);
    procedure SalvarNBSsAplicaveis(const Dados: NbssAplicaveisEtd);
    procedure SalvarFundamentacoesClassificacoes(const Dados: FundamentacoesClassificacoesEtd);
    procedure SalvarExcecoesNCMAplicavel(const Dados: ExcecoesNcmAplicavelEtd);
    procedure SalvarExcecoesNBSAplicavel(const Dados: ExcecoesNbsAplicavelEtd);
    procedure SalvarTributoSituacoesTributarias(const Dados: TributoSituacoesTributariasEtd);
    procedure SalvarTratamentosTributarios(const Dados: TratamentosTributariosEtd);
    procedure SalvarTratamentosClassificacoes(const Dados: TratamentosClassificacoesEtd);
    procedure SalvarAliquotasAdValorem(const Dados: AliquotasAdValoremEtd);
    procedure SalvarAliquotasAdValoremProdutos(const Dados: AliquotasAdValoremProdutosEtd);
    procedure SalvarExcecoesAdValoremProdutos(const Dados: ExcecoesAdValoremProdutosEtd);
    procedure SalvarUnidadesMedidas(const Dados: UnidadesMedidasEtd);
    procedure SalvarAliquotasAdRem(const Dados: AliquotaAdRemEtdList);
    procedure SalvarAliquotasAdRemProdutos(const Dados: AliquotasAdRemProdutosEtd);
    procedure SalvarExcecoesAdRemProdutos(const Dados: ExcecoesAdRemProdutosEtd);
    procedure SalvarAliquotasAdValoremServicos(const Dados: AliquotasAdValoremServicosEtd);
    procedure SalvarExcecoesAdValoremServicos(const Dados: ExcecoesAdValoremServicosEtd);
    procedure SalvarAliquotasAdRemServicos(const Dados: AliquotasAdRemServicosEtd);
    procedure SalvarExcecoesAdRemServicos(const Dados: ExcecoesAdRemServicosEtd);
    procedure SalvarRedutoresCompraGovernamental(const Dados: RedutoresCompraGovernamentalEtd);
    procedure SalvarTransferenciasCBSEnteGov(const Dados: TransferenciaCBSEnteGovEtdList);
    procedure SalvarListaServicosLC116(const Dados: ListaServicosLC116EtdList);
    procedure SalvarIndicadoresOperacaoIbsCbs(const Dados: IndicadoresOperacaoEtd);
    procedure SalvarClassificacoesNbsIndOpLc(const Dados: IndicadoresOpNbsClassificacaoEtd);
    procedure SalvarUltimaVersao(const Versao: VersaoSerproEtd);

    procedure ConfigurarVersao(const AId: Integer);
    procedure FalharEm(const AMetodo: string);
    function FoiChamado(const AMetodo: string): Boolean;
    function IndiceDaChamada(const AMetodo: string): Integer;

    property Chamadas: TStringList read FChamadas;
  end;

  [TestFixture]
  TTestSincronizadorCalculadoraService = class
  private
    FObserver: TFakeObserverSincronizador;
    FObserverIntf: IProgressObserver;
    FReader: TFakeDadosFiscaisReader;
    FReaderIntf: IDadosFiscaisReader;
    FWriter: TFakeDadosFiscaisWriter;
    FWriterIntf: IDadosFiscaisWriter;
    FService: ISincronizadorCalculadoraService;

    function CriarSnapshot(const AVersaoId: Integer): SincronizacaoCalculadoraSnapshot;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveLerTodasAsColecoesSemEscrever;

    [Test]
    procedure DevePropagarFalhaDeLeituraSemEscrita;

    [Test]
    procedure NaoDeveAplicarQuandoVersaoLocalMaior;

    [Test]
    procedure DeveReaplicarQuandoVersaoIgual;

    [Test]
    procedure DeveAplicarQuandoVersaoLocalMenor;

    [Test]
    procedure DeveRetornarFalsoEReportarErroQuandoAplicacaoFalha;

    [Test]
    procedure DeveExcluirAntesDeSalvarEVersaoPorUltimo;
  end;

implementation

{ TFakeObserverSincronizador }

constructor TFakeObserverSincronizador.Create;
begin
  inherited Create;
  FMessages := TStringList.Create;
  FErrors := TStringList.Create;
end;

destructor TFakeObserverSincronizador.Destroy;
begin
  FMessages.Free;
  FErrors.Free;
  inherited;
end;

function TFakeObserverSincronizador.ListaContem(
  const ALista: TStrings;
  const ATexto: string): Boolean;
var
  I: Integer;
begin
  Result := False;

  for I := 0 to ALista.Count - 1 do
    if Pos(ATexto, ALista[I]) > 0 then
      Exit(True);
end;

procedure TFakeObserverSincronizador.OnMessage(const Message: string);
begin
  FMessages.Add(Message);
end;

procedure TFakeObserverSincronizador.OnWarning(const Warning: string);
begin
  // Nao usado pelos cenarios do servico.
end;

procedure TFakeObserverSincronizador.OnError(const Error: string);
begin
  FErrors.Add(Error);
end;

procedure TFakeObserverSincronizador.OnProgress(Progress: Integer);
begin
  // Nao usado pelos cenarios do servico.
end;

procedure TFakeObserverSincronizador.OnCounter(Current, Total: Integer);
begin
  // Nao usado pelos cenarios do servico.
end;

procedure TFakeObserverSincronizador.OnStart;
begin
  // Nao usado pelos cenarios do servico.
end;

procedure TFakeObserverSincronizador.OnComplete;
begin
  // Nao usado pelos cenarios do servico.
end;

procedure TFakeObserverSincronizador.OnCancel;
begin
  // Nao usado pelos cenarios do servico.
end;

procedure TFakeObserverSincronizador.CancelRequest;
begin
  // Nao usado pelos cenarios do servico.
end;

function TFakeObserverSincronizador.IsCancellationRequested: Boolean;
begin
  Result := False;
end;

function TFakeObserverSincronizador.ErroContem(const ATexto: string): Boolean;
begin
  Result := ListaContem(FErrors, ATexto);
end;

{ TFakeDadosFiscaisReader }

constructor TFakeDadosFiscaisReader.Create;
begin
  inherited Create;
  FChamadas := TStringList.Create;
  FTotalLeituras := 0;
  FConfigurarChamado := False;
  FFalharEm := '';
  FVersao := VersaoSerproEtd.NullInstance();
end;

destructor TFakeDadosFiscaisReader.Destroy;
begin
  FChamadas.Free;
  inherited;
end;

procedure TFakeDadosFiscaisReader.Registrar(const AMetodo: string);
begin
  Inc(FTotalLeituras);
  FChamadas.Add(AMetodo);

  if (FFalharEm <> '') and (FFalharEm = AMetodo) then
    raise Exception.Create('FakeDadosFiscaisReader: falha simulada em ' + AMetodo);
end;

procedure TFakeDadosFiscaisReader.Configurar(const ABaseUrl, AToken, ADatabase: string);
begin
  FConfigurarChamado := True;
end;

procedure TFakeDadosFiscaisReader.ConfigurarVersao(const AId: Integer; const AData: TDateTime);
begin
  FVersao := VersaoSerproEtd.Create(AId, AData, '', StringNullable.NullInstance());
end;

procedure TFakeDadosFiscaisReader.FalharEm(const AMetodo: string);
begin
  FFalharEm := AMetodo;
end;

function TFakeDadosFiscaisReader.ObterUltimaVersao(): VersaoSerproEtd;
begin
  Registrar('ObterUltimaVersao');
  Result := FVersao;
end;

function TFakeDadosFiscaisReader.ObterEstados(): EstadosEtd;
begin
  Registrar('ObterEstados');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterMunicipios(): MunicipiosEtd;
begin
  Registrar('ObterMunicipios');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterNBSs(): NbssEtd;
begin
  Registrar('ObterNBSs');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterAnexos(): AnexosEtd;
begin
  Registrar('ObterAnexos');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterTiposDFe(): TiposDfeEtd;
begin
  Registrar('ObterTiposDFe');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterFundamentacoesLegais(): FundamentacoesLegaisEtd;
begin
  Registrar('ObterFundamentacoesLegais');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterTomadoresEspecificos(): TomadoresEspecificosEtd;
begin
  Registrar('ObterTomadoresEspecificos');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterAliquotasReferencia(): AliquotasReferenciaEtd;
begin
  Registrar('ObterAliquotasReferencia');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterAliquotasPadrao(): AliquotasPadraoEtd;
begin
  Registrar('ObterAliquotasPadrao');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterSituacoesTributarias(): SituacoesTributariasEtd;
begin
  Registrar('ObterSituacoesTributarias');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterClassificacoesTributarias(): ClassificacoesTributariasEtd;
begin
  Registrar('ObterClassificacoesTributarias');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterTiposDFePorClassificacao(): TipoDfeClassificacaoEtdList;
begin
  Registrar('ObterTiposDFePorClassificacao');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterPercentuaisReducao(): PercentuaisReducaoEtd;
begin
  Registrar('ObterPercentuaisReducao');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterNCMsAplicaveis(): NcmsAplicaveisEtd;
begin
  Registrar('ObterNCMsAplicaveis');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterNBSsAplicaveis(): NbssAplicaveisEtd;
begin
  Registrar('ObterNBSsAplicaveis');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterFundamentacoesClassificacoes(): FundamentacoesClassificacoesEtd;
begin
  Registrar('ObterFundamentacoesClassificacoes');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterExcecoesNCMAplicavel(): ExcecoesNcmAplicavelEtd;
begin
  Registrar('ObterExcecoesNCMAplicavel');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterExcecoesNBSAplicavel(): ExcecoesNbsAplicavelEtd;
begin
  Registrar('ObterExcecoesNBSAplicavel');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterTributoSituacoesTributarias(): TributoSituacoesTributariasEtd;
begin
  Registrar('ObterTributoSituacoesTributarias');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterTratamentosTributarios(): TratamentosTributariosEtd;
begin
  Registrar('ObterTratamentosTributarios');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterTratamentosClassificacoes(): TratamentosClassificacoesEtd;
begin
  Registrar('ObterTratamentosClassificacoes');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterAliquotasAdValorem(): AliquotasAdValoremEtd;
begin
  Registrar('ObterAliquotasAdValorem');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterAliquotasAdValoremProdutos(): AliquotasAdValoremProdutosEtd;
begin
  Registrar('ObterAliquotasAdValoremProdutos');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterExcecoesAdValoremProdutos(): ExcecoesAdValoremProdutosEtd;
begin
  Registrar('ObterExcecoesAdValoremProdutos');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterUnidadesMedidas(): UnidadesMedidasEtd;
begin
  Registrar('ObterUnidadesMedidas');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterAliquotasAdRem(): AliquotaAdRemEtdList;
begin
  Registrar('ObterAliquotasAdRem');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterAliquotasAdRemProdutos(): AliquotasAdRemProdutosEtd;
begin
  Registrar('ObterAliquotasAdRemProdutos');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterExcecoesAdRemProdutos(): ExcecoesAdRemProdutosEtd;
begin
  Registrar('ObterExcecoesAdRemProdutos');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterAliquotasAdValoremServicos(): AliquotasAdValoremServicosEtd;
begin
  Registrar('ObterAliquotasAdValoremServicos');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterExcecoesAdValoremServicos(): ExcecoesAdValoremServicosEtd;
begin
  Registrar('ObterExcecoesAdValoremServicos');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterAliquotasAdRemServicos(): AliquotasAdRemServicosEtd;
begin
  Registrar('ObterAliquotasAdRemServicos');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterExcecoesAdRemServicos(): ExcecoesAdRemServicosEtd;
begin
  Registrar('ObterExcecoesAdRemServicos');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterRedutoresCompraGovernamental(): RedutoresCompraGovernamentalEtd;
begin
  Registrar('ObterRedutoresCompraGovernamental');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterTransferenciasCBSEnteGov(): TransferenciaCBSEnteGovEtdList;
begin
  Registrar('ObterTransferenciasCBSEnteGov');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterListaServicosLC116(): ListaServicosLC116EtdList;
begin
  Registrar('ObterListaServicosLC116');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterIndicadoresOperacaoIbsCbs(): IndicadoresOperacaoEtd;
begin
  Registrar('ObterIndicadoresOperacaoIbsCbs');
  Result := nil;
end;

function TFakeDadosFiscaisReader.ObterClassificacoesNbsIndOpLc(): IndicadoresOpNbsClassificacaoEtd;
begin
  Registrar('ObterClassificacoesNbsIndOpLc');
  Result := nil;
end;

{ TFakeDadosFiscaisWriter }

constructor TFakeDadosFiscaisWriter.Create;
begin
  inherited Create;
  FChamadas := TStringList.Create;
  FFalharEm := '';
  FVersaoAtual := VersaoSerproEtd.NullInstance();
end;

destructor TFakeDadosFiscaisWriter.Destroy;
begin
  FChamadas.Free;
  inherited;
end;

procedure TFakeDadosFiscaisWriter.Registrar(const AMetodo: string);
begin
  FChamadas.Add(AMetodo);

  if (FFalharEm <> '') and (FFalharEm = AMetodo) then
    raise Exception.Create('FakeDadosFiscaisWriter: falha simulada em ' + AMetodo);
end;

procedure TFakeDadosFiscaisWriter.ConfigurarVersao(const AId: Integer);
begin
  FVersaoAtual := VersaoSerproEtd.Create(AId, EncodeDate(2020, 1, 1), '', StringNullable.NullInstance());
end;

procedure TFakeDadosFiscaisWriter.FalharEm(const AMetodo: string);
begin
  FFalharEm := AMetodo;
end;

function TFakeDadosFiscaisWriter.FoiChamado(const AMetodo: string): Boolean;
begin
  Result := FChamadas.IndexOf(AMetodo) >= 0;
end;

function TFakeDadosFiscaisWriter.IndiceDaChamada(const AMetodo: string): Integer;
begin
  Result := FChamadas.IndexOf(AMetodo);
end;

procedure TFakeDadosFiscaisWriter.ExcluirTodosDadosFiscais();
begin
  Registrar('ExcluirTodosDadosFiscais');
end;

function TFakeDadosFiscaisWriter.ObterUltimaVersao(): VersaoSerproEtd;
begin
  Registrar('ObterUltimaVersao');
  Result := FVersaoAtual;
end;

procedure TFakeDadosFiscaisWriter.SalvarEstados(const Dados: EstadosEtd);
begin
  Registrar('SalvarEstados');
end;

procedure TFakeDadosFiscaisWriter.SalvarMunicipios(const Dados: MunicipiosEtd);
begin
  Registrar('SalvarMunicipios');
end;

procedure TFakeDadosFiscaisWriter.SalvarAnexos(const Dados: AnexosEtd);
begin
  Registrar('SalvarAnexos');
end;

procedure TFakeDadosFiscaisWriter.SalvarTiposDFe(const Dados: TiposDfeEtd);
begin
  Registrar('SalvarTiposDFe');
end;

procedure TFakeDadosFiscaisWriter.SalvarNCMs(const Dados: NcmsEtd);
begin
  Registrar('SalvarNCMs');
end;

procedure TFakeDadosFiscaisWriter.SalvarNBSs(const Dados: NbssEtd);
begin
  Registrar('SalvarNBSs');
end;

procedure TFakeDadosFiscaisWriter.SalvarFundamentacoesLegais(const Dados: FundamentacoesLegaisEtd);
begin
  Registrar('SalvarFundamentacoesLegais');
end;

procedure TFakeDadosFiscaisWriter.SalvarTomadoresEspecificos(const Dados: TomadoresEspecificosEtd);
begin
  Registrar('SalvarTomadoresEspecificos');
end;

procedure TFakeDadosFiscaisWriter.SalvarAliquotasReferencia(const Dados: AliquotasReferenciaEtd);
begin
  Registrar('SalvarAliquotasReferencia');
end;

procedure TFakeDadosFiscaisWriter.SalvarAliquotasPadrao(const Dados: AliquotasPadraoEtd);
begin
  Registrar('SalvarAliquotasPadrao');
end;

procedure TFakeDadosFiscaisWriter.SalvarSituacoesTributarias(const Dados: SituacoesTributariasEtd);
begin
  Registrar('SalvarSituacoesTributarias');
end;

procedure TFakeDadosFiscaisWriter.SalvarClassificacoesTributarias(const Dados: ClassificacoesTributariasEtd);
begin
  Registrar('SalvarClassificacoesTributarias');
end;

procedure TFakeDadosFiscaisWriter.SalvarTiposDFePorClassificacao(const Dados: TipoDfeClassificacaoEtdList);
begin
  Registrar('SalvarTiposDFePorClassificacao');
end;

procedure TFakeDadosFiscaisWriter.SalvarPercentuaisReducao(const Dados: PercentuaisReducaoEtd);
begin
  Registrar('SalvarPercentuaisReducao');
end;

procedure TFakeDadosFiscaisWriter.SalvarNCMsAplicaveis(const Dados: NcmsAplicaveisEtd);
begin
  Registrar('SalvarNCMsAplicaveis');
end;

procedure TFakeDadosFiscaisWriter.SalvarNBSsAplicaveis(const Dados: NbssAplicaveisEtd);
begin
  Registrar('SalvarNBSsAplicaveis');
end;

procedure TFakeDadosFiscaisWriter.SalvarFundamentacoesClassificacoes(const Dados: FundamentacoesClassificacoesEtd);
begin
  Registrar('SalvarFundamentacoesClassificacoes');
end;

procedure TFakeDadosFiscaisWriter.SalvarExcecoesNCMAplicavel(const Dados: ExcecoesNcmAplicavelEtd);
begin
  Registrar('SalvarExcecoesNCMAplicavel');
end;

procedure TFakeDadosFiscaisWriter.SalvarExcecoesNBSAplicavel(const Dados: ExcecoesNbsAplicavelEtd);
begin
  Registrar('SalvarExcecoesNBSAplicavel');
end;

procedure TFakeDadosFiscaisWriter.SalvarTributoSituacoesTributarias(const Dados: TributoSituacoesTributariasEtd);
begin
  Registrar('SalvarTributoSituacoesTributarias');
end;

procedure TFakeDadosFiscaisWriter.SalvarTratamentosTributarios(const Dados: TratamentosTributariosEtd);
begin
  Registrar('SalvarTratamentosTributarios');
end;

procedure TFakeDadosFiscaisWriter.SalvarTratamentosClassificacoes(const Dados: TratamentosClassificacoesEtd);
begin
  Registrar('SalvarTratamentosClassificacoes');
end;

procedure TFakeDadosFiscaisWriter.SalvarAliquotasAdValorem(const Dados: AliquotasAdValoremEtd);
begin
  Registrar('SalvarAliquotasAdValorem');
end;

procedure TFakeDadosFiscaisWriter.SalvarAliquotasAdValoremProdutos(const Dados: AliquotasAdValoremProdutosEtd);
begin
  Registrar('SalvarAliquotasAdValoremProdutos');
end;

procedure TFakeDadosFiscaisWriter.SalvarExcecoesAdValoremProdutos(const Dados: ExcecoesAdValoremProdutosEtd);
begin
  Registrar('SalvarExcecoesAdValoremProdutos');
end;

procedure TFakeDadosFiscaisWriter.SalvarUnidadesMedidas(const Dados: UnidadesMedidasEtd);
begin
  Registrar('SalvarUnidadesMedidas');
end;

procedure TFakeDadosFiscaisWriter.SalvarAliquotasAdRem(const Dados: AliquotaAdRemEtdList);
begin
  Registrar('SalvarAliquotasAdRem');
end;

procedure TFakeDadosFiscaisWriter.SalvarAliquotasAdRemProdutos(const Dados: AliquotasAdRemProdutosEtd);
begin
  Registrar('SalvarAliquotasAdRemProdutos');
end;

procedure TFakeDadosFiscaisWriter.SalvarExcecoesAdRemProdutos(const Dados: ExcecoesAdRemProdutosEtd);
begin
  Registrar('SalvarExcecoesAdRemProdutos');
end;

procedure TFakeDadosFiscaisWriter.SalvarAliquotasAdValoremServicos(const Dados: AliquotasAdValoremServicosEtd);
begin
  Registrar('SalvarAliquotasAdValoremServicos');
end;

procedure TFakeDadosFiscaisWriter.SalvarExcecoesAdValoremServicos(const Dados: ExcecoesAdValoremServicosEtd);
begin
  Registrar('SalvarExcecoesAdValoremServicos');
end;

procedure TFakeDadosFiscaisWriter.SalvarAliquotasAdRemServicos(const Dados: AliquotasAdRemServicosEtd);
begin
  Registrar('SalvarAliquotasAdRemServicos');
end;

procedure TFakeDadosFiscaisWriter.SalvarExcecoesAdRemServicos(const Dados: ExcecoesAdRemServicosEtd);
begin
  Registrar('SalvarExcecoesAdRemServicos');
end;

procedure TFakeDadosFiscaisWriter.SalvarRedutoresCompraGovernamental(const Dados: RedutoresCompraGovernamentalEtd);
begin
  Registrar('SalvarRedutoresCompraGovernamental');
end;

procedure TFakeDadosFiscaisWriter.SalvarTransferenciasCBSEnteGov(const Dados: TransferenciaCBSEnteGovEtdList);
begin
  Registrar('SalvarTransferenciasCBSEnteGov');
end;

procedure TFakeDadosFiscaisWriter.SalvarListaServicosLC116(const Dados: ListaServicosLC116EtdList);
begin
  Registrar('SalvarListaServicosLC116');
end;

procedure TFakeDadosFiscaisWriter.SalvarIndicadoresOperacaoIbsCbs(const Dados: IndicadoresOperacaoEtd);
begin
  Registrar('SalvarIndicadoresOperacaoIbsCbs');
end;

procedure TFakeDadosFiscaisWriter.SalvarClassificacoesNbsIndOpLc(const Dados: IndicadoresOpNbsClassificacaoEtd);
begin
  Registrar('SalvarClassificacoesNbsIndOpLc');
end;

procedure TFakeDadosFiscaisWriter.SalvarUltimaVersao(const Versao: VersaoSerproEtd);
begin
  Registrar('SalvarUltimaVersao');
  FVersaoAtual := Versao;
end;

{ TTestSincronizadorCalculadoraService }

procedure TTestSincronizadorCalculadoraService.Setup;
begin
  FObserver := TFakeObserverSincronizador.Create;
  FObserverIntf := FObserver;
  FReader := TFakeDadosFiscaisReader.Create;
  FReaderIntf := FReader;
  FWriter := TFakeDadosFiscaisWriter.Create;
  FWriterIntf := FWriter;
  FService := SincronizadorCalculadoraService.Create(FObserverIntf, FReaderIntf, FWriterIntf);
end;

procedure TTestSincronizadorCalculadoraService.TearDown;
begin
  // A chave do fake e uma interface: a referencia e liberada ao soltar a
  // interface do servico/campos, sem Free explicito (evita double-free).
  FService := nil;
  FReaderIntf := nil;
  FWriterIntf := nil;
  FObserverIntf := nil;
  FReader := nil;
  FWriter := nil;
  FObserver := nil;
end;

function TTestSincronizadorCalculadoraService.CriarSnapshot(
  const AVersaoId: Integer): SincronizacaoCalculadoraSnapshot;
begin
  Result := SincronizacaoCalculadoraSnapshot.Create();
  Result.Versao := VersaoSerproEtd.Create(
    AVersaoId,
    EncodeDate(2026, 1, 1),
    'versao ' + IntToStr(AVersaoId),
    StringNullable.Create(Format('v%.4d', [AVersaoId]))
  );
end;

procedure TTestSincronizadorCalculadoraService.DeveLerTodasAsColecoesSemEscrever;
var
  Snapshot: SincronizacaoCalculadoraSnapshot;
begin
  FReader.ConfigurarVersao(39, EncodeDate(2026, 1, 1));

  Snapshot := FService.LerTodos();
  try
    Assert.IsTrue(Assigned(Snapshot), 'LerTodos deve devolver um snapshot.');
    Assert.AreEqual(39, Snapshot.Versao.Id, 'A versao lida deve ser a da origem.');
    Assert.AreEqual(38, FReader.TotalLeituras, 'As 38 tabelas conformes devem ser lidas.');
    Assert.IsFalse(FReader.ConfigurarChamado, 'A configuracao da origem pertence ao use case.');
    Assert.AreEqual(0, FWriter.Chamadas.Count, 'A fase de leitura nao pode escrever.');

    // As tres leituras novas entram apos as transferencias CBS, nesta ordem.
    Assert.IsTrue(
      FReader.Chamadas.IndexOf('ObterListaServicosLC116') >
        FReader.Chamadas.IndexOf('ObterTransferenciasCBSEnteGov'),
      'A lista de servicos LC116 deve ser lida apos as transferencias CBS.'
    );
    Assert.IsTrue(
      FReader.Chamadas.IndexOf('ObterIndicadoresOperacaoIbsCbs') >
        FReader.Chamadas.IndexOf('ObterListaServicosLC116'),
      'Os indicadores de operacao devem ser lidos apos a lista de servicos LC116.'
    );
    Assert.IsTrue(
      FReader.Chamadas.IndexOf('ObterClassificacoesNbsIndOpLc') >
        FReader.Chamadas.IndexOf('ObterIndicadoresOperacaoIbsCbs'),
      'As classificacoes NBS devem ser lidas apos os indicadores de operacao.'
    );
  finally
    Snapshot.Free;
  end;
end;

procedure TTestSincronizadorCalculadoraService.DevePropagarFalhaDeLeituraSemEscrita;
var
  Snapshot: SincronizacaoCalculadoraSnapshot;
  Falhou: Boolean;
  Mensagem: string;
begin
  Mensagem := '';
  FReader.FalharEm('ObterMunicipios');

  Falhou := False;
  try
    Snapshot := FService.LerTodos();
    Snapshot.Free();
  except
    on E: Exception do
    begin
      Falhou := True;
      Mensagem := E.Message;
    end;
  end;

  Assert.IsTrue(Falhou, 'Falha de leitura deve ser re-lancada (nao silenciada).');
  Assert.IsTrue(Pos('ObterMunicipios', Mensagem) > 0, 'A falha deve preservar a origem.');
  Assert.AreEqual(0, FWriter.Chamadas.Count, 'Nenhuma escrita pode ocorrer em falha de leitura.');
  Assert.AreEqual(0, FObserver.Errors.Count, 'A leitura nao trata a excecao; ela propaga.');
end;

procedure TTestSincronizadorCalculadoraService.NaoDeveAplicarQuandoVersaoLocalMaior;
var
  Snapshot: SincronizacaoCalculadoraSnapshot;
begin
  FWriter.ConfigurarVersao(40);
  Snapshot := CriarSnapshot(39);
  try
    Assert.IsFalse(FService.Aplicar(Snapshot), 'Nao pode haver downgrade.');
    Assert.IsFalse(FWriter.FoiChamado('ExcluirTodosDadosFiscais'), 'Nao pode excluir em downgrade.');
    Assert.IsFalse(FWriter.FoiChamado('SalvarUltimaVersao'), 'Nao pode salvar versao em downgrade.');
    Assert.IsTrue(FWriter.FoiChamado('ObterUltimaVersao'), 'Deve consultar a versao local.');
  finally
    Snapshot.Free;
  end;
end;

procedure TTestSincronizadorCalculadoraService.DeveReaplicarQuandoVersaoIgual;
var
  Snapshot: SincronizacaoCalculadoraSnapshot;
begin
  FWriter.ConfigurarVersao(39);
  Snapshot := CriarSnapshot(39);
  try
    Assert.IsTrue(FService.Aplicar(Snapshot), 'Versao igual deve reaplicar (republicacao).');
    Assert.IsTrue(FWriter.FoiChamado('ExcluirTodosDadosFiscais'), 'Versao igual deve excluir e regravar.');
    Assert.IsTrue(FWriter.FoiChamado('SalvarUltimaVersao'));
  finally
    Snapshot.Free;
  end;
end;

procedure TTestSincronizadorCalculadoraService.DeveAplicarQuandoVersaoLocalMenor;
var
  Snapshot: SincronizacaoCalculadoraSnapshot;
begin
  FWriter.ConfigurarVersao(30);
  Snapshot := CriarSnapshot(39);
  try
    Assert.IsTrue(FService.Aplicar(Snapshot), 'Versao local menor deve aplicar.');
    Assert.IsTrue(FWriter.FoiChamado('ExcluirTodosDadosFiscais'));
  finally
    Snapshot.Free;
  end;
end;

procedure TTestSincronizadorCalculadoraService.DeveRetornarFalsoEReportarErroQuandoAplicacaoFalha;
var
  Snapshot: SincronizacaoCalculadoraSnapshot;
begin
  FWriter.ConfigurarVersao(30);
  FWriter.FalharEm('SalvarEstados');
  Snapshot := CriarSnapshot(39);
  try
    Assert.IsFalse(FService.Aplicar(Snapshot), 'Falha de escrita deve retornar False.');
    Assert.IsTrue(FObserver.Errors.Count > 0, 'Falha de escrita deve ser reportada.');
    Assert.IsTrue(FObserver.ErroContem('SalvarEstados'), 'O erro deve identificar o metodo que falhou.');
    Assert.IsFalse(FWriter.FoiChamado('SalvarUltimaVersao'), 'A versao nao pode ser salva apos falha.');
  finally
    Snapshot.Free;
  end;
end;

procedure TTestSincronizadorCalculadoraService.DeveExcluirAntesDeSalvarEVersaoPorUltimo;
var
  Snapshot: SincronizacaoCalculadoraSnapshot;
begin
  FWriter.ConfigurarVersao(30);
  Snapshot := CriarSnapshot(39);
  try
    Assert.IsTrue(FService.Aplicar(Snapshot));

    // O writer registra 'ObterUltimaVersao' no inicio de Aplicar; a exclusao,
    // portanto, ocorre no indice 1 e deve preceder a primeira gravacao.
    Assert.AreEqual(1, FWriter.IndiceDaChamada('ExcluirTodosDadosFiscais'), 'Deve excluir apos a leitura da versao e antes de gravar.');
    Assert.IsTrue(
      FWriter.IndiceDaChamada('ExcluirTodosDadosFiscais') < FWriter.IndiceDaChamada('SalvarEstados'),
      'A exclusao deve preceder a primeira gravacao (SalvarEstados).'
    );

    // As tres gravacoes novas entram apos a exclusao, na ordem LC116 -> INDICADOR -> CLASSIF.
    Assert.IsTrue(FWriter.FoiChamado('SalvarListaServicosLC116'), 'A lista de servicos LC116 deve ser gravada.');
    Assert.IsTrue(
      FWriter.FoiChamado('SalvarIndicadoresOperacaoIbsCbs'),
      'Os indicadores de operacao devem ser gravados.'
    );
    Assert.IsTrue(
      FWriter.FoiChamado('SalvarClassificacoesNbsIndOpLc'),
      'As classificacoes NBS devem ser gravadas.'
    );
    Assert.IsTrue(
      FWriter.IndiceDaChamada('SalvarListaServicosLC116') <
        FWriter.IndiceDaChamada('SalvarIndicadoresOperacaoIbsCbs'),
      'A lista de servicos LC116 deve ser gravada antes dos indicadores de operacao.'
    );
    Assert.IsTrue(
      FWriter.IndiceDaChamada('SalvarIndicadoresOperacaoIbsCbs') <
        FWriter.IndiceDaChamada('SalvarClassificacoesNbsIndOpLc'),
      'Os indicadores de operacao devem ser gravados antes das classificacoes NBS.'
    );
    Assert.IsTrue(
      FWriter.IndiceDaChamada('ExcluirTodosDadosFiscais') <
        FWriter.IndiceDaChamada('SalvarClassificacoesNbsIndOpLc'),
      'A exclusao deve preceder as novas gravacoes.'
    );

    Assert.AreEqual(
      FWriter.Chamadas.Count - 1,
      FWriter.IndiceDaChamada('SalvarUltimaVersao'),
      'SalvarUltimaVersao deve ser a ultima gravacao.'
    );
    // 1 ObterUltimaVersao + 1 ExcluirTodosDadosFiscais + 37 Salvar* + 1 SalvarUltimaVersao.
    Assert.AreEqual(40, FWriter.Chamadas.Count, 'Todas as colecoes devem ser gravadas uma vez.');
  finally
    Snapshot.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestSincronizadorCalculadoraService);

end.
