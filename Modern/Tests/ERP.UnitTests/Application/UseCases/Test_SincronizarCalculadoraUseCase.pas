unit Test_SincronizarCalculadoraUseCase;

interface

uses
  Classes,
  DUnitX.TestFramework,
  IProgressObserverUnit,
  IDataBaseConnectionUnit,
  IConfiguracoesRepositoryUnit,
  IControleVersaoCalculadoraApiUnit,
  ISincronizadorCalculadoraServiceUnit,
  ISincronizacaoCalculadoraLockServiceUnit,
  IDadosFiscaisReaderUnit,
  ITokenDecryptorUnit,
  AtualizacaoCalculadoraModelUnit,
  ISincronizarCalculadoraUseCaseUnit,
  SincronizacaoCalculadoraLeaseUnit,
  SincronizacaoCalculadoraSnapshotUnit,
  VersaoSerproEtdUnit,
  EstadoEtdUnit,
  MunicipioEtdUnit,
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
  IndicadorOpNbsClassificacaoEtdUnit,
  FakeTransactionUnit,
  FakeDatabaseConnectionUnit,
  FakeConfiguracoesRepositoryUnit,
  FakeControleVersaoCalculadoraApiUnit,
  FakeSincronizadorCalculadoraServiceUnit;

type
  /// <summary>
  ///   Spy de IProgressObserver que acumula mensagens e erros para assercao.
  ///   Nao registra token; apenas o conteudo recebido do use case.
  /// </summary>
  TFakeProgressObserverExecucao = class(TInterfacedObject, IProgressObserver)
  private
    FMessages: TStringList;
    FErrors: TStringList;
    FCompleted: Boolean;

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
    function MensagemContem(const ATexto: string): Boolean;

    property Messages: TStringList read FMessages;
    property Errors: TStringList read FErrors;
    property Completed: Boolean read FCompleted;
  end;

  /// <summary>
  ///   Spy de ISincronizacaoCalculadoraLockService. TryAcquire e Release sao
  ///   contados e o resultado do acquire e configuravel. Owner e um token de
  ///   instancia de teste, nunca o bearer token.
  /// </summary>
  TFakeSincronizacaoLockSpy = class(TInterfacedObject, ISincronizacaoCalculadoraLockService)
  private
    FAcquires: Integer;
    FReleases: Integer;
    FConcederLease: Boolean;
  public
    constructor Create;

    function TryAcquire(out ALease: SincronizacaoCalculadoraLease): Boolean;
    procedure Release;

    procedure ConfigurarConcederLease(const AConceder: Boolean);

    property Acquires: Integer read FAcquires;
    property Releases: Integer read FReleases;
  end;

  /// <summary>
  ///   Spy de IDadosFiscaisReader. O use case so chama Configurar (a leitura
  ///   real pertence ao ISincronizadorCalculadoraService); os metodos de
  ///   leitura levantam excecao explicita se chamados indevidamente.
  /// </summary>
  TFakeDadosFiscaisReaderSpy = class(TInterfacedObject, IDadosFiscaisReader)
  private
    FConfigurarChamado: Boolean;
    FBaseUrl: string;
    FToken: string;
    FDatabase: string;
  public
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

    property ConfigurarChamado: Boolean read FConfigurarChamado;
    property BaseUrl: string read FBaseUrl;
    property Token: string read FToken;
    property Database: string read FDatabase;
  end;

  [TestFixture]
  TTestSincronizarCalculadoraUseCase = class
  private
    FTransactionState: TTransactionSpyState;
    FConnection: TFakeDatabaseConnection;
    FConfigRepo: TFakeConfiguracoesRepository;
    FControleApiFake: TFakeControleVersaoCalculadoraApi;
    FControleApi: IControleVersaoCalculadoraApi;
    FSincronizadorFake: TFakeSincronizadorCalculadoraService;
    FSincronizador: ISincronizadorCalculadoraService;
    FLockSpy: TFakeSincronizacaoLockSpy;
    FLock: ISincronizacaoCalculadoraLockService;
    FReaderSpy: TFakeDadosFiscaisReaderSpy;
    FReader: IDadosFiscaisReader;
    FObserver: TFakeProgressObserverExecucao;
    FObserverIntf: IProgressObserver;
    FTokeDecryptor: ITokenDecryptor;
    FUseCase: ISincronizarCalculadoraUseCase;
    FToken: string;

    function CriarAtualizacao: AtualizacaoCalculadoraModel;
    procedure ConfigurarUrlEToken;
    procedure ConfigurarPublicacaoValida;
    function ValorHashPersistido: string;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveIgnorarQuandoAtualizacaoNula;

    [Test]
    procedure NaoDeveAplicarQuandoEstadoNaoAplicavel;

    [Test]
    procedure NaoDeveAplicarQuandoRequerNovaVersaoERP;

    [Test]
    procedure DeveFalharFechadoQuandoConfiguracaoAusente;

    [Test]
    procedure DeveEncerrarSemErroQuandoLeaseOcupado;

    [Test]
    procedure DeveConfigurarReaderComUrlTokenEDatabase;

    [Test]
    procedure DeveAbortarSemAplicarQuandoSha256RelidoDivergente;

    [Test]
    procedure DeveAbortarSemAplicarQuandoPublicacaoAusente;

    [Test]
    procedure DeveLerAntesDeAplicarEmTransacaoPropria;

    [Test]
    procedure DeveGravarHashSomenteAposSucesso;

    [Test]
    procedure DeveExecutarRollbackEReportarErroQuandoAplicacaoFalha;

    [Test]
    procedure NaoDeveCommitarQuandoAplicarRetornaFalso;

    [Test]
    procedure DeveAbortarSemTransacaoQuandoLeituraFalha;

    [Test]
    procedure DeveLiberarLeaseEmSucessoEFalha;

    [Test]
    procedure NaoDeveExporTokenNasMensagensDeErro;
  end;

implementation

uses
  SysUtils,
  SincronizarCalculadoraUseCaseUnit, ConfiguracaoRtcUnit, ConfiguracaoEtdUnit, FakeTokenDecryptorUnit;

const
  URL_TESTE = 'https://data.exemplo.test';
  PUBLICADO_EM = '2026-09-09T01:28:47Z';
  HASH_NOVO = 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';
  HASH_DIVERGENTE = 'cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc';
  CALC_VERSION = 'v0030';
  DATABASE_PUBLICACAO = 'rtc-v0030';
  CHAMADA_INESPERADA_READER = 'TFakeDadosFiscaisReaderSpy: chamada inesperada a ';

{ TFakeProgressObserverExecucao }

constructor TFakeProgressObserverExecucao.Create;
begin
  inherited Create;
  FMessages := TStringList.Create;
  FErrors := TStringList.Create;
  FCompleted := False;
end;

destructor TFakeProgressObserverExecucao.Destroy;
begin
  FMessages.Free;
  FErrors.Free;
  inherited;
end;

function TFakeProgressObserverExecucao.ListaContem(
  const ALista: TStrings;
  const ATexto: string
): Boolean;
var
  I: Integer;
begin
  Result := False;

  for I := 0 to ALista.Count - 1 do
    if Pos(ATexto, ALista[I]) > 0 then
      Exit(True);
end;

procedure TFakeProgressObserverExecucao.OnMessage(const Message: string);
begin
  FMessages.Add(Message);
end;

procedure TFakeProgressObserverExecucao.OnWarning(const Warning: string);
begin
  // Nao usado pela aplicacao; mantido apenas para cumprir o contrato.
end;

procedure TFakeProgressObserverExecucao.OnError(const Error: string);
begin
  FErrors.Add(Error);
end;

procedure TFakeProgressObserverExecucao.OnProgress(Progress: Integer);
begin
  // Nao usado pela aplicacao.
end;

procedure TFakeProgressObserverExecucao.OnCounter(Current, Total: Integer);
begin
  // Nao usado pela aplicacao.
end;

procedure TFakeProgressObserverExecucao.OnStart;
begin
  // Nao usado pela aplicacao.
end;

procedure TFakeProgressObserverExecucao.OnComplete;
begin
  FCompleted := True;
end;

procedure TFakeProgressObserverExecucao.OnCancel;
begin
  // Nao usado pela aplicacao.
end;

procedure TFakeProgressObserverExecucao.CancelRequest;
begin
  // Nao usado pela aplicacao.
end;

function TFakeProgressObserverExecucao.IsCancellationRequested: Boolean;
begin
  Result := False;
end;

function TFakeProgressObserverExecucao.ErroContem(const ATexto: string): Boolean;
begin
  Result := ListaContem(FErrors, ATexto);
end;

function TFakeProgressObserverExecucao.MensagemContem(const ATexto: string): Boolean;
begin
  Result := ListaContem(FMessages, ATexto);
end;

{ TFakeSincronizacaoLockSpy }

constructor TFakeSincronizacaoLockSpy.Create;
begin
  inherited Create;
  FAcquires := 0;
  FReleases := 0;
  FConcederLease := True;
end;

procedure TFakeSincronizacaoLockSpy.ConfigurarConcederLease(const AConceder: Boolean);
begin
  FConcederLease := AConceder;
end;

function TFakeSincronizacaoLockSpy.TryAcquire(
  out ALease: SincronizacaoCalculadoraLease
): Boolean;
begin
  Inc(FAcquires);

  if FConcederLease then
  begin
    ALease := SincronizacaoCalculadoraLease.Create('instancia-teste', Now);
    Result := True;
  end
  else
  begin
    ALease := SincronizacaoCalculadoraLease.NullInstance();
    Result := False;
  end;
end;

procedure TFakeSincronizacaoLockSpy.Release;
begin
  Inc(FReleases);
end;

{ TFakeDadosFiscaisReaderSpy }

procedure TFakeDadosFiscaisReaderSpy.Configurar(const ABaseUrl, AToken, ADatabase: string);
begin
  FConfigurarChamado := True;
  FBaseUrl := ABaseUrl;
  FToken := AToken;
  FDatabase := ADatabase;
end;

function TFakeDadosFiscaisReaderSpy.ObterUltimaVersao(): VersaoSerproEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterUltimaVersao');
end;

function TFakeDadosFiscaisReaderSpy.ObterEstados(): EstadosEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterEstados');
end;

function TFakeDadosFiscaisReaderSpy.ObterMunicipios(): MunicipiosEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterMunicipios');
end;

function TFakeDadosFiscaisReaderSpy.ObterNBSs(): NbssEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterNBSs');
end;

function TFakeDadosFiscaisReaderSpy.ObterAnexos(): AnexosEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterAnexos');
end;

function TFakeDadosFiscaisReaderSpy.ObterTiposDFe(): TiposDfeEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterTiposDFe');
end;

function TFakeDadosFiscaisReaderSpy.ObterFundamentacoesLegais(): FundamentacoesLegaisEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterFundamentacoesLegais');
end;

function TFakeDadosFiscaisReaderSpy.ObterTomadoresEspecificos(): TomadoresEspecificosEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterTomadoresEspecificos');
end;

function TFakeDadosFiscaisReaderSpy.ObterAliquotasReferencia(): AliquotasReferenciaEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterAliquotasReferencia');
end;

function TFakeDadosFiscaisReaderSpy.ObterAliquotasPadrao(): AliquotasPadraoEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterAliquotasPadrao');
end;

function TFakeDadosFiscaisReaderSpy.ObterSituacoesTributarias(): SituacoesTributariasEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterSituacoesTributarias');
end;

function TFakeDadosFiscaisReaderSpy.ObterClassificacoesTributarias(): ClassificacoesTributariasEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterClassificacoesTributarias');
end;

function TFakeDadosFiscaisReaderSpy.ObterTiposDFePorClassificacao(): TipoDfeClassificacaoEtdList;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterTiposDFePorClassificacao');
end;

function TFakeDadosFiscaisReaderSpy.ObterPercentuaisReducao(): PercentuaisReducaoEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterPercentuaisReducao');
end;

function TFakeDadosFiscaisReaderSpy.ObterNCMsAplicaveis(): NcmsAplicaveisEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterNCMsAplicaveis');
end;

function TFakeDadosFiscaisReaderSpy.ObterNBSsAplicaveis(): NbssAplicaveisEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterNBSsAplicaveis');
end;

function TFakeDadosFiscaisReaderSpy.ObterFundamentacoesClassificacoes(): FundamentacoesClassificacoesEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterFundamentacoesClassificacoes');
end;

function TFakeDadosFiscaisReaderSpy.ObterExcecoesNCMAplicavel(): ExcecoesNcmAplicavelEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterExcecoesNCMAplicavel');
end;

function TFakeDadosFiscaisReaderSpy.ObterExcecoesNBSAplicavel(): ExcecoesNbsAplicavelEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterExcecoesNBSAplicavel');
end;

function TFakeDadosFiscaisReaderSpy.ObterTributoSituacoesTributarias(): TributoSituacoesTributariasEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterTributoSituacoesTributarias');
end;

function TFakeDadosFiscaisReaderSpy.ObterTratamentosTributarios(): TratamentosTributariosEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterTratamentosTributarios');
end;

function TFakeDadosFiscaisReaderSpy.ObterTratamentosClassificacoes(): TratamentosClassificacoesEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterTratamentosClassificacoes');
end;

function TFakeDadosFiscaisReaderSpy.ObterAliquotasAdValorem(): AliquotasAdValoremEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterAliquotasAdValorem');
end;

function TFakeDadosFiscaisReaderSpy.ObterAliquotasAdValoremProdutos(): AliquotasAdValoremProdutosEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterAliquotasAdValoremProdutos');
end;

function TFakeDadosFiscaisReaderSpy.ObterExcecoesAdValoremProdutos(): ExcecoesAdValoremProdutosEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterExcecoesAdValoremProdutos');
end;

function TFakeDadosFiscaisReaderSpy.ObterUnidadesMedidas(): UnidadesMedidasEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterUnidadesMedidas');
end;

function TFakeDadosFiscaisReaderSpy.ObterAliquotasAdRem(): AliquotaAdRemEtdList;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterAliquotasAdRem');
end;

function TFakeDadosFiscaisReaderSpy.ObterAliquotasAdRemProdutos(): AliquotasAdRemProdutosEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterAliquotasAdRemProdutos');
end;

function TFakeDadosFiscaisReaderSpy.ObterExcecoesAdRemProdutos(): ExcecoesAdRemProdutosEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterExcecoesAdRemProdutos');
end;

function TFakeDadosFiscaisReaderSpy.ObterAliquotasAdValoremServicos(): AliquotasAdValoremServicosEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterAliquotasAdValoremServicos');
end;

function TFakeDadosFiscaisReaderSpy.ObterExcecoesAdValoremServicos(): ExcecoesAdValoremServicosEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterExcecoesAdValoremServicos');
end;

function TFakeDadosFiscaisReaderSpy.ObterAliquotasAdRemServicos(): AliquotasAdRemServicosEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterAliquotasAdRemServicos');
end;

function TFakeDadosFiscaisReaderSpy.ObterExcecoesAdRemServicos(): ExcecoesAdRemServicosEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterExcecoesAdRemServicos');
end;

function TFakeDadosFiscaisReaderSpy.ObterRedutoresCompraGovernamental(): RedutoresCompraGovernamentalEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterRedutoresCompraGovernamental');
end;

function TFakeDadosFiscaisReaderSpy.ObterTransferenciasCBSEnteGov(): TransferenciaCBSEnteGovEtdList;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterTransferenciasCBSEnteGov');
end;

function TFakeDadosFiscaisReaderSpy.ObterListaServicosLC116(): ListaServicosLC116EtdList;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterListaServicosLC116');
end;

function TFakeDadosFiscaisReaderSpy.ObterIndicadoresOperacaoIbsCbs(): IndicadoresOperacaoEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterIndicadoresOperacaoIbsCbs');
end;

function TFakeDadosFiscaisReaderSpy.ObterClassificacoesNbsIndOpLc(): IndicadoresOpNbsClassificacaoEtd;
begin
  raise Exception.Create(CHAMADA_INESPERADA_READER + 'ObterClassificacoesNbsIndOpLc');
end;

{ TTestSincronizarCalculadoraUseCase }

procedure TTestSincronizarCalculadoraUseCase.Setup;
begin
  // Placeholder gerado em runtime; nenhum token real ou literal de segredo no fixture.
  FToken := StringOfChar('t', 12);

  FTransactionState := TTransactionSpyState.Create;
  FConnection := TFakeDatabaseConnection.Create(FTransactionState);
  FConfigRepo := TFakeConfiguracoesRepository.Create;
  FControleApiFake := TFakeControleVersaoCalculadoraApi.Create;
  FControleApi := FControleApiFake;
  FSincronizadorFake := TFakeSincronizadorCalculadoraService.Create;
  FSincronizador := FSincronizadorFake;
  FLockSpy := TFakeSincronizacaoLockSpy.Create;
  FLock := FLockSpy;
  FReaderSpy := TFakeDadosFiscaisReaderSpy.Create;
  FReader := FReaderSpy;
  FObserver := TFakeProgressObserverExecucao.Create;
  FObserverIntf := FObserver;
  FTokeDecryptor := TFakeTokenDecryptor.Create();

  FUseCase := SincronizarCalculadoraUseCase.Create(
    FConnection,
    FConfigRepo,
    FObserverIntf,
    FSincronizador,
    FLock,
    FControleApi,
    FTokeDecryptor,
    FReader
  );
end;

procedure TTestSincronizarCalculadoraUseCase.TearDown;
begin
  // Interfaces: soltar por nil (referencia contada). As classes do fixture
  // (connection/repo/estado) sao liberadas explicitamente apos soltar o use case.
  FUseCase := nil;
  FObserverIntf := nil;
  FControleApi := nil;
  FSincronizador := nil;
  FLock := nil;
  FReader := nil;

  FObserver := nil;
  FControleApiFake := nil;
  FSincronizadorFake := nil;
  FLockSpy := nil;
  FReaderSpy := nil;

  FConfigRepo.Free;
  FConnection.Free;
  FTransactionState.Free;
end;

function TTestSincronizarCalculadoraUseCase.CriarAtualizacao: AtualizacaoCalculadoraModel;
begin
  Result := AtualizacaoCalculadoraModel.CreateNovo(
    enNovaVersaoDisponivel,
    '',
    CALC_VERSION,
    HASH_NOVO,
    DATABASE_PUBLICACAO
  );
end;

procedure TTestSincronizarCalculadoraUseCase.ConfigurarUrlEToken;
begin
  FConfigRepo.ConfigurarString(RTC_API_URL_KEY, URL_TESTE);
  FConfigRepo.ConfigurarString(RTC_API_TOKEN_KEY, FToken);
end;

procedure TTestSincronizarCalculadoraUseCase.ConfigurarPublicacaoValida;
begin
  FControleApiFake.ConfigurarPublicacao(CALC_VERSION, HASH_NOVO, CALC_VERSION, PUBLICADO_EM);
end;

function TTestSincronizarCalculadoraUseCase.ValorHashPersistido: string;
var
  Config: ConfiguracaoEtd;
begin
  Result := '';

  Config := FConfigRepo.GetByKey(RTC_PUBLICACAO_SHA256_KEY, RTC_EMPRESA_ID);
  try
    if Assigned(Config) then
      Result := Config.ValorString.ToText('');
  finally
    Config.Free;
  end;
end;

procedure TTestSincronizarCalculadoraUseCase.DeveIgnorarQuandoAtualizacaoNula;
var
  Atualizacao: AtualizacaoCalculadoraModel;
begin
  Atualizacao := Default(AtualizacaoCalculadoraModel);
  FUseCase.Executar(Atualizacao);

  Assert.AreEqual(0, FLockSpy.Acquires, 'Sem atualizacao nao deve tentar o lease.');
  Assert.AreEqual(0, FObserver.Messages.Count, 'Sem atualizacao nao deve logar.');
  Assert.AreEqual(0, FObserver.Errors.Count, 'Sem atualizacao nao deve reportar erro.');
  Assert.IsFalse(FReaderSpy.ConfigurarChamado, 'Sem atualizacao nao deve configurar o reader.');
end;

procedure TTestSincronizarCalculadoraUseCase.NaoDeveAplicarQuandoEstadoNaoAplicavel;
var
  Atualizacao: AtualizacaoCalculadoraModel;
begin
  // Defensivo: modelo com estado nao aplicavel (enVersaoCompativel).
  Atualizacao := AtualizacaoCalculadoraModel.CreateNovo(
    enVersaoCompativel,
    CALC_VERSION,
    CALC_VERSION,
    HASH_NOVO,
    DATABASE_PUBLICACAO
  );

  Assert.AreNotEqual(enNovaVersaoDisponivel, Atualizacao.Estado, 'enVersaoCompativel nao e aplicavel.');

  FUseCase.Executar(Atualizacao);

  Assert.AreEqual(0, FLockSpy.Acquires, 'Estado nao aplicavel nao deve tentar o lease.');
  Assert.AreEqual(0, FLockSpy.Releases, 'Sem lease adquirido nao deve liberar.');
  Assert.IsFalse(FReaderSpy.ConfigurarChamado, 'Estado nao aplicavel nao deve configurar o reader.');
  Assert.IsFalse(FSincronizadorFake.LerTodosChamado, 'Estado nao aplicavel nao deve ler.');
  Assert.IsFalse(FSincronizadorFake.AplicarChamado, 'Estado nao aplicavel nao deve aplicar.');
  Assert.AreEqual(0, FObserver.Messages.Count, 'Estado nao aplicavel nao deve logar.');
  Assert.AreEqual(0, FObserver.Errors.Count, 'Estado nao aplicavel nao deve reportar erro.');
end;

procedure TTestSincronizarCalculadoraUseCase.NaoDeveAplicarQuandoRequerNovaVersaoERP;
var
  Atualizacao: AtualizacaoCalculadoraModel;
begin
  // Defensivo: modelo com estado enNovaVersaoERP nao deve executar sincronizacao.
  Atualizacao := AtualizacaoCalculadoraModel.CreateNovo(
    enNovaVersaoERP,
    'v0035',
    'v0042',
    '',
    ''
  );

  Assert.AreNotEqual(enNovaVersaoDisponivel, Atualizacao.Estado, 'enNovaVersaoERP nao e aplicavel.');

  FUseCase.Executar(Atualizacao);

  Assert.AreEqual(0, FLockSpy.Acquires, 'Estado enNovaVersaoERP nao deve tentar o lease.');
  Assert.AreEqual(0, FLockSpy.Releases, 'Sem lease adquirido nao deve liberar.');
  Assert.IsFalse(FReaderSpy.ConfigurarChamado, 'Estado enNovaVersaoERP nao deve configurar o reader.');
  Assert.IsFalse(FSincronizadorFake.LerTodosChamado, 'Estado enNovaVersaoERP nao deve ler.');
  Assert.IsFalse(FSincronizadorFake.AplicarChamado, 'Estado enNovaVersaoERP nao deve aplicar.');
  Assert.AreEqual(0, FObserver.Messages.Count, 'Estado enNovaVersaoERP nao deve logar.');
  Assert.AreEqual(0, FObserver.Errors.Count, 'Estado enNovaVersaoERP nao deve reportar erro.');
end;

procedure TTestSincronizarCalculadoraUseCase.DeveFalharFechadoQuandoConfiguracaoAusente;
begin
  FUseCase.Executar(CriarAtualizacao());

  Assert.IsTrue(FObserver.Errors.Count > 0, 'Configuracao ausente deve reportar erro claro.');
  Assert.AreEqual(0, FLockSpy.Acquires, 'Fail closed nao deve adquirir o lease.');
  Assert.IsFalse(FSincronizadorFake.LerTodosChamado, 'Fail closed nao deve ler.');
  Assert.IsFalse(FConnection.BeginTransactionCalled, 'Fail closed nao deve abrir transacao.');
end;

procedure TTestSincronizarCalculadoraUseCase.DeveEncerrarSemErroQuandoLeaseOcupado;
begin
  ConfigurarUrlEToken;
  FLockSpy.ConfigurarConcederLease(False);

  FUseCase.Executar(CriarAtualizacao());

  Assert.AreEqual(1, FLockSpy.Acquires, 'Deve tentar adquirir o lease uma vez.');
  Assert.AreEqual(0, FObserver.Errors.Count, 'Lease ocupado nao e erro fatal.');
  Assert.IsTrue(FObserver.Messages.Count > 0, 'Lease ocupado deve gerar log informativo.');
  Assert.IsFalse(FReaderSpy.ConfigurarChamado, 'Lease ocupado nao deve configurar o reader.');
  Assert.IsFalse(FSincronizadorFake.LerTodosChamado, 'Lease ocupado nao deve ler.');
end;

procedure TTestSincronizarCalculadoraUseCase.DeveConfigurarReaderComUrlTokenEDatabase;
begin
  ConfigurarUrlEToken;
  ConfigurarPublicacaoValida;

  FUseCase.Executar(CriarAtualizacao());

  Assert.IsTrue(FReaderSpy.ConfigurarChamado, 'O reader deve ser configurado antes da leitura.');
  Assert.AreEqual(URL_TESTE, FReaderSpy.BaseUrl);
  Assert.AreEqual(FToken, FReaderSpy.Token);
  Assert.AreEqual(DATABASE_PUBLICACAO, FReaderSpy.Database);
  Assert.AreEqual(URL_TESTE, FControleApiFake.BaseUrl, 'A API da publicacao deve ser configurada.');
  Assert.AreEqual(FToken, FControleApiFake.Token);
end;

procedure TTestSincronizarCalculadoraUseCase.DeveAbortarSemAplicarQuandoSha256RelidoDivergente;
begin
  ConfigurarUrlEToken;
  FControleApiFake.ConfigurarPublicacao(CALC_VERSION, HASH_DIVERGENTE, CALC_VERSION, PUBLICADO_EM);

  FUseCase.Executar(CriarAtualizacao());

  Assert.IsTrue(FControleApiFake.PublicacaoChamada, 'Deve reler a publicacao.');
  Assert.AreEqual(CALC_VERSION, FControleApiFake.UltimaCalcVersion);
  Assert.IsFalse(FSincronizadorFake.LerTodosChamado, 'Sha256 divergente aborta antes da leitura.');
  Assert.IsFalse(FSincronizadorFake.AplicarChamado, 'Sha256 divergente nao pode aplicar.');
  Assert.IsTrue(FObserver.Errors.Count > 0, 'Sha256 divergente deve reportar erro.');
  Assert.AreEqual(1, FLockSpy.Releases, 'O lease deve ser liberado mesmo ao abortar.');
end;

procedure TTestSincronizarCalculadoraUseCase.DeveAbortarSemAplicarQuandoPublicacaoAusente;
begin
  ConfigurarUrlEToken;
  // Sem publicacao configurada no fake: ObterPublicacao devolve nil.

  FUseCase.Executar(CriarAtualizacao());

  Assert.IsTrue(FControleApiFake.PublicacaoChamada, 'Deve reler a publicacao.');
  Assert.IsFalse(FSincronizadorFake.LerTodosChamado, 'Publicacao ausente aborta antes da leitura.');
  Assert.IsTrue(FObserver.Errors.Count > 0, 'Publicacao ausente deve reportar erro.');
  Assert.AreEqual(1, FLockSpy.Releases, 'O lease deve ser liberado mesmo ao abortar.');
end;

procedure TTestSincronizarCalculadoraUseCase.DeveLerAntesDeAplicarEmTransacaoPropria;
begin
  ConfigurarUrlEToken;
  ConfigurarPublicacaoValida;

  FUseCase.Executar(CriarAtualizacao());

  Assert.IsTrue(FSincronizadorFake.LerTodosChamado, 'Deve executar a fase de leitura.');
  Assert.IsTrue(FSincronizadorFake.AplicarChamado, 'Deve executar a fase de aplicacao.');
  Assert.IsTrue(
    FSincronizadorFake.IndiceDaChamada('LerTodos') < FSincronizadorFake.IndiceDaChamada('Aplicar'),
    'A leitura deve preceder a aplicacao (leitura-antes-de-escrita).'
  );
  Assert.IsTrue(FConnection.BeginTransactionCalled, 'A aplicacao exige transacao propria.');
  Assert.IsTrue(FTransactionState.CommitCalled, 'Sucesso deve commitar.');
  Assert.IsFalse(FTransactionState.RollbackCalled, 'Sucesso nao deve executar rollback.');
  Assert.IsTrue(FObserver.Completed, 'Sucesso deve concluir via Observer.OnComplete.');
  Assert.AreEqual(0, FObserver.Errors.Count, 'Sucesso nao deve reportar erro.');
  Assert.AreEqual(1, FLockSpy.Releases, 'O lease deve ser liberado em sucesso.');
end;

procedure TTestSincronizarCalculadoraUseCase.DeveGravarHashSomenteAposSucesso;
begin
  ConfigurarUrlEToken;
  ConfigurarPublicacaoValida;

  FUseCase.Executar(CriarAtualizacao());

  Assert.IsTrue(FTransactionState.CommitCalled, 'Sucesso deve commitar.');
  Assert.AreEqual(HASH_NOVO, ValorHashPersistido(), 'O hash aplicado deve ser persistido no sucesso.');
end;

procedure TTestSincronizarCalculadoraUseCase.DeveExecutarRollbackEReportarErroQuandoAplicacaoFalha;
begin
  ConfigurarUrlEToken;
  ConfigurarPublicacaoValida;
  FSincronizadorFake.ConfigurarFalhaAplicacao('falha simulada na aplicacao');

  FUseCase.Executar(CriarAtualizacao());

  Assert.IsTrue(FConnection.BeginTransactionCalled, 'A aplicacao abre a transacao antes de falhar.');
  Assert.IsTrue(FTransactionState.RollbackCalled, 'Falha na aplicacao deve executar rollback.');
  Assert.IsTrue(FObserver.Errors.Count > 0, 'Falha na aplicacao deve reportar erro.');
  Assert.AreEqual('', ValorHashPersistido(), 'O hash nao pode persistir em falha.');
  Assert.AreEqual(1, FLockSpy.Releases, 'O lease deve ser liberado em falha.');
end;

procedure TTestSincronizarCalculadoraUseCase.NaoDeveCommitarQuandoAplicarRetornaFalso;
begin
  ConfigurarUrlEToken;
  ConfigurarPublicacaoValida;
  FSincronizadorFake.ConfigurarResultadoAplicar(False);

  FUseCase.Executar(CriarAtualizacao());

  Assert.IsTrue(FTransactionState.RollbackCalled, 'Aplicar=False deve reverter a transacao.');
  Assert.IsTrue(FObserver.Errors.Count > 0, 'Aplicar=False deve reportar erro.');
  Assert.AreEqual('', ValorHashPersistido(), 'O hash nao pode persistir quando Aplicar retorna False.');
  Assert.AreEqual(1, FLockSpy.Releases, 'O lease deve ser liberado em falha.');
end;

procedure TTestSincronizarCalculadoraUseCase.DeveAbortarSemTransacaoQuandoLeituraFalha;
begin
  ConfigurarUrlEToken;
  ConfigurarPublicacaoValida;
  FSincronizadorFake.ConfigurarFalhaLeitura('falha simulada na leitura');

  FUseCase.Executar(CriarAtualizacao());

  Assert.IsFalse(FSincronizadorFake.AplicarChamado, 'Falha de leitura nao deve aplicar.');
  Assert.IsTrue(FObserver.Errors.Count > 0, 'Falha de leitura deve reportar erro.');
  Assert.AreEqual('', ValorHashPersistido(), 'Falha de leitura nao pode persistir hash.');
  Assert.AreEqual(1, FLockSpy.Releases, 'O lease deve ser liberado em falha de leitura.');
end;

procedure TTestSincronizarCalculadoraUseCase.DeveLiberarLeaseEmSucessoEFalha;
begin
  // Sucesso.
  ConfigurarUrlEToken;
  ConfigurarPublicacaoValida;
  FUseCase.Executar(CriarAtualizacao());
  Assert.AreEqual(1, FLockSpy.Releases, 'Sucesso deve liberar o lease.');

  // Falha na aplicacao (mesma instancia de lease spy).
  FSincronizadorFake.ConfigurarResultadoAplicar(False);
  FUseCase.Executar(CriarAtualizacao());
  Assert.AreEqual(2, FLockSpy.Releases, 'Falha tambem deve liberar o lease.');
end;

procedure TTestSincronizarCalculadoraUseCase.NaoDeveExporTokenNasMensagensDeErro;
begin
  ConfigurarUrlEToken;
  ConfigurarPublicacaoValida;
  FSincronizadorFake.ConfigurarFalhaAplicacao('falha simulada sem segredo');

  FUseCase.Executar(CriarAtualizacao());

  Assert.IsTrue(FObserver.Errors.Count > 0);
  Assert.IsFalse(FObserver.ErroContem(FToken), 'Token nunca deve aparecer em erros.');
  Assert.IsFalse(FObserver.MensagemContem(FToken), 'Token nunca deve aparecer em mensagens.');
  Assert.IsFalse(FObserver.ErroContem('Authorization'), 'Erros nao devem expor cabecalho de autorizacao.');
end;

initialization
  TDUnitX.RegisterTestFixture(TTestSincronizarCalculadoraUseCase);

end.
