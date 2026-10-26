unit Test_ObterAtualizacaoCalculadoraUseCase;

interface

uses
  Classes,
  DUnitX.TestFramework,
  IProgressObserverUnit,
  IControleVersaoCalculadoraApiUnit,
  ITokenDecryptorUnit,
  CompatibilidadeRtcModelUnit,
  PublicacaoRtcModelUnit,
  AtualizacaoCalculadoraModelUnit,
  ObterAtualizacaoCalculadoraUseCaseUnit,
  FakeConfiguracoesRepositoryUnit,
  FakeControleVersaoCalculadoraApiUnit,
  FakeTokenDecryptorUnit;

type
  /// <summary>
  ///   Spy de IProgressObserver que acumula mensagens e erros para assercao.
  ///   Nao registra token; apenas conteudo recebido do use case.
  /// </summary>
  TFakeProgressObserver = class(TInterfacedObject, IProgressObserver)
  private
    FMessages: TStringList;
    FWarnings: TStringList;
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
    function WarningContem(const ATexto: string): Boolean;

    property Messages: TStringList read FMessages;
    property Warnings: TStringList read FWarnings;
    property Errors: TStringList read FErrors;
    property Completed: Boolean read FCompleted;
  end;

  /// <summary>
  ///   Decorador de teste sobre o fake de controle de versao que delega as
  ///   consultas de compatibilidade/publicacao ao fake base e falha
  ///   exclusivamente no probe da ultima versao publicada. Cobre o isolamento
  ///   de erro secundario (decisao 9) sem alterar o fake compartilhado.
  /// </summary>
  TFakeFalhaProbeDisponivel = class(TInterfacedObject, IControleVersaoCalculadoraApi)
  private
    FBase: TFakeControleVersaoCalculadoraApi;
    FDisponivelChamada: Boolean;
  public
    constructor Create(ABase: TFakeControleVersaoCalculadoraApi);

    procedure Configurar(const ABaseUrl, AToken: string; AIsStaging: Boolean);
    function ObterUltimaCompativel(const AAppName: string; ARtcVersion: Integer): CompatibilidadeRtcModel;
    function ObterUltimaDisponivel(const AAppName: string): CompatibilidadeRtcModel;
    function ObterPublicacao(const ACalcVersion: string): PublicacaoRtcModel;

    property DisponivelChamada: Boolean read FDisponivelChamada;
  end;

  [TestFixture]
  TTestObterAtualizacaoCalculadoraUseCase = class
  private
    FConfigRepo: TFakeConfiguracoesRepository;
    FControleApi: TFakeControleVersaoCalculadoraApi;
    FControleApiIntf: IControleVersaoCalculadoraApi;
    FTokeDecryptor: ITokenDecryptor;
    FObserver: TFakeProgressObserver;
    FObserverIntf: IProgressObserver;
    FUseCase: IObterAtualizacaoCalculadoraUseCase;
    FToken: string;

    procedure ConfigurarUrlEToken;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveFalharFechadoQuandoConfiguracaoAusente;

    [Test]
    procedure DeveFalharQuandoCatalogoCompatibilidadeVazio;

    [Test]
    procedure DeveAtualizarQuandoVersaoAlvoMaiorQueLocal;

    [Test]
    procedure DeveManterCompativelQuandoVersaoIgualEHashIgual;

    [Test]
    procedure DeveRepublicarQuandoVersaoIgualEHashAusente;

    [Test]
    procedure DeveRepublicarQuandoVersaoIgualEHashDiferente;

    [Test]
    procedure DeveManterCompativelQuandoVersaoAlvoMenorQueLocal;

    [Test]
    procedure DeveAtualizarQuandoVersaoLocalInexistente;

    [Test]
    procedure DeveFalharDirecionadoEReportarErroQuandoApiFalha;

    [Test]
    procedure DeveEncaminharUrlETokenParaApi;

    [Test]
    procedure NaoDeveExporTokenNasMensagensDeErro;

    [Test]
    procedure DeveSinalizarExigenciaERPQuandoSemAtualizacaoCompativel;

    [Test]
    procedure DeveSinalizarExigenciaERPQuandoLocalInferiorACompativel;

    [Test]
    procedure DeveSinalizarExigenciaERPQuandoHashDivergente;

    [Test]
    procedure NaoDeveSinalizarQuandoPublicadaIgualCompativel;

    [Test]
    procedure NaoDeveSinalizarQuandoSemPublicada;

    [Test]
    procedure NaoDeveSinalizarQuandoDominioPublicadoInconsistente;

    [Test]
    procedure DeveSinalizarExigenciaERPQuandoSemCompativel;

    [Test]
    procedure DeveSinalizarExigenciaERPQuandoLocalInexistente;

    [Test]
    procedure NaoDeveSinalizarQuandoLocalAdiantado;

    [Test]
    procedure DeveDegradarSemAvisoQuandoProbeDisponivelFalha;
  end;

implementation

uses
  SysUtils,
  ConfiguracaoRtcUnit;

const
  URL_TESTE = 'https://data.exemplo.test';
  PUBLICADO_EM = '2026-09-09T01:28:47Z';
  HASH_ANTIGO = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
  HASH_NOVO = 'bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb';

{ TFakeProgressObserver }

constructor TFakeProgressObserver.Create;
begin
  inherited Create;
  FMessages := TStringList.Create;
  FWarnings := TStringList.Create;
  FErrors := TStringList.Create;
  FCompleted := False;
end;

destructor TFakeProgressObserver.Destroy;
begin
  FMessages.Free;
  FWarnings.Free;
  FErrors.Free;
  inherited;
end;

function TFakeProgressObserver.ListaContem(const ALista: TStrings; const ATexto: string): Boolean;
var
  I: Integer;
begin
  Result := False;

  for I := 0 to ALista.Count - 1 do
    if Pos(ATexto, ALista[I]) > 0 then
      Exit(True);
end;

procedure TFakeProgressObserver.OnMessage(const Message: string);
begin
  FMessages.Add(Message);
end;

procedure TFakeProgressObserver.OnWarning(const Warning: string);
begin
  FWarnings.Add(Warning);
end;

procedure TFakeProgressObserver.OnError(const Error: string);
begin
  FErrors.Add(Error);
end;

procedure TFakeProgressObserver.OnProgress(Progress: Integer);
begin
  // Nao usado pela verificacao.
end;

procedure TFakeProgressObserver.OnCounter(Current, Total: Integer);
begin
  // Nao usado pela verificacao.
end;

procedure TFakeProgressObserver.OnStart;
begin
  // Nao usado pela verificacao.
end;

procedure TFakeProgressObserver.OnComplete;
begin
  FCompleted := True;
end;

procedure TFakeProgressObserver.OnCancel;
begin
  // Nao usado pela verificacao.
end;

procedure TFakeProgressObserver.CancelRequest;
begin
  // Nao usado pela verificacao.
end;

function TFakeProgressObserver.IsCancellationRequested: Boolean;
begin
  Result := False;
end;

function TFakeProgressObserver.ErroContem(const ATexto: string): Boolean;
begin
  Result := ListaContem(FErrors, ATexto);
end;

function TFakeProgressObserver.MensagemContem(const ATexto: string): Boolean;
begin
  Result := ListaContem(FMessages, ATexto);
end;

function TFakeProgressObserver.WarningContem(const ATexto: string): Boolean;
begin
  Result := ListaContem(FWarnings, ATexto);
end;

{ TFakeFalhaProbeDisponivel }

constructor TFakeFalhaProbeDisponivel.Create(ABase: TFakeControleVersaoCalculadoraApi);
begin
  inherited Create;
  FBase := ABase;
  FDisponivelChamada := False;
end;

procedure TFakeFalhaProbeDisponivel.Configurar(const ABaseUrl, AToken: string; AIsStaging: Boolean);
begin
  FBase.Configurar(ABaseUrl, AToken, AIsStaging);
end;

function TFakeFalhaProbeDisponivel.ObterUltimaCompativel(
  const AAppName: string;
  ARtcVersion: Integer
): CompatibilidadeRtcModel;
begin
  Result := FBase.ObterUltimaCompativel(AAppName, ARtcVersion);
end;

function TFakeFalhaProbeDisponivel.ObterUltimaDisponivel(
  const AAppName: string
): CompatibilidadeRtcModel;
begin
  FDisponivelChamada := True;
  raise Exception.Create('falha simulada no probe de versao publicada');
end;

function TFakeFalhaProbeDisponivel.ObterPublicacao(const ACalcVersion: string): PublicacaoRtcModel;
begin
  Result := FBase.ObterPublicacao(ACalcVersion);
end;

{ TTestObterAtualizacaoCalculadoraUseCase }

procedure TTestObterAtualizacaoCalculadoraUseCase.Setup;
begin
  // Placeholder gerado em runtime; nenhum token real ou literal de segredo no fixture.
  FToken := StringOfChar('t', 12);

  FConfigRepo := TFakeConfiguracoesRepository.Create;
  FControleApi := TFakeControleVersaoCalculadoraApi.Create;
  FControleApiIntf := FControleApi;
  FObserver := TFakeProgressObserver.Create;
  FObserverIntf := FObserver;
  FTokeDecryptor := TFakeTokenDecryptor.Create();

  FUseCase := ObterAtualizacaoCalculadoraUseCase.Create(
    FConfigRepo,
    FControleApiIntf,
    FTokeDecryptor,
    FObserverIntf
  );
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.TearDown;
begin
  // Interfacas: soltar por nil (referencia contada); FConfigRepo e classe do fixture.
  FUseCase := nil;
  FObserverIntf := nil;
  FControleApiIntf := nil;
  FObserver := nil;
  FControleApi := nil;
  FConfigRepo.Free;
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.ConfigurarUrlEToken;
begin
  FConfigRepo.ConfigurarString(RTC_API_URL_KEY, URL_TESTE);
  FConfigRepo.ConfigurarString(RTC_API_TOKEN_KEY, FToken);
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.DeveFalharFechadoQuandoConfiguracaoAusente;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  Resultado := FUseCase.Executar();

  Assert.IsTrue(Resultado.Estado = enFalhaDirecionada, 'Sem URL/token deve retornar falha direcionada.');
  Assert.IsTrue(FObserver.Errors.Count > 0, 'Deve reportar erro claro de configuracao ausente.');
  Assert.IsFalse(FControleApi.CompatibilidadeChamada, 'Nao deve consultar a API sem configuracao.');
  Assert.IsFalse(FControleApi.PublicacaoChamada, 'Nao deve consultar publicacao sem configuracao.');
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.DeveFalharQuandoCatalogoCompatibilidadeVazio;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;

  Resultado := FUseCase.Executar();

  Assert.IsTrue(Resultado.Estado = enFalhaDirecionada, 'Catalogo vazio gera falha direcionada.');
  Assert.IsTrue(FControleApi.CompatibilidadeChamada);
  Assert.IsTrue(FObserver.ErroContem(RTC_APP_NAME), 'Erro deve citar app_name.');
  Assert.IsTrue(FObserver.ErroContem(IntToStr(VERSAO_DOMINIO_RTC)), 'Erro deve citar rtc_version.');
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.DeveAtualizarQuandoVersaoAlvoMaiorQueLocal;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  FConfigRepo.ConfigurarString(RTC_VERSAO_CALCULADORA_KEY, 'v0029');
  FControleApi.ConfigurarCompatibilidade('v0030', VERSAO_DOMINIO_RTC);
  FControleApi.ConfigurarPublicacao('v0030', HASH_NOVO, 'v0030', PUBLICADO_EM);

  Resultado := FUseCase.Executar();

  Assert.IsTrue(Resultado.Estado = enNovaVersaoDisponivel);
  Assert.AreEqual('v0030', Resultado.VersaoRemoto);
  Assert.AreEqual('v0029', Resultado.VersaoLocal);
  Assert.AreEqual('rtc-v0030', Resultado.Database);
  Assert.AreEqual(HASH_NOVO, Resultado.Sha256);
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.DeveManterCompativelQuandoVersaoIgualEHashIgual;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  FConfigRepo.ConfigurarString(RTC_VERSAO_CALCULADORA_KEY, 'v0030');
  FConfigRepo.ConfigurarString(RTC_PUBLICACAO_SHA256_KEY, HASH_NOVO);
  FControleApi.ConfigurarCompatibilidade('v0030', VERSAO_DOMINIO_RTC);
  FControleApi.ConfigurarPublicacao('v0030', HASH_NOVO, 'v0030', PUBLICADO_EM);

  Resultado := FUseCase.Executar();

  Assert.IsTrue(Resultado.Estado = enVersaoCompativel, 'Versao igual com hash igual deve manter versao compativel.');
  Assert.AreEqual('v0030', Resultado.VersaoRemoto);
  Assert.AreEqual('v0030', Resultado.VersaoLocal);
  Assert.AreEqual(HASH_NOVO, Resultado.Sha256);
  Assert.IsTrue(FControleApi.PublicacaoChamada);
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.DeveRepublicarQuandoVersaoIgualEHashAusente;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  FConfigRepo.ConfigurarString(RTC_VERSAO_CALCULADORA_KEY, 'v0030');
  // Sem rtc_publicacao_sha256: instalacao antiga -> republicacao.
  FControleApi.ConfigurarCompatibilidade('v0030', VERSAO_DOMINIO_RTC);
  FControleApi.ConfigurarPublicacao('v0030', HASH_NOVO, 'v0030', PUBLICADO_EM);

  Resultado := FUseCase.Executar();

  Assert.IsTrue(Resultado.Estado = enNovaVersaoDisponivel, 'Hash ausente deve forcar republicacao como nova versao disponivel.');
  Assert.AreEqual('v0030', Resultado.VersaoRemoto);
  Assert.AreEqual('v0030', Resultado.VersaoLocal);
  Assert.AreEqual(HASH_NOVO, Resultado.Sha256);
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.DeveRepublicarQuandoVersaoIgualEHashDiferente;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  FConfigRepo.ConfigurarString(RTC_VERSAO_CALCULADORA_KEY, 'v0030');
  FConfigRepo.ConfigurarString(RTC_PUBLICACAO_SHA256_KEY, HASH_ANTIGO);
  FControleApi.ConfigurarCompatibilidade('v0030', VERSAO_DOMINIO_RTC);
  FControleApi.ConfigurarPublicacao('v0030', HASH_NOVO, 'v0030', PUBLICADO_EM);

  Resultado := FUseCase.Executar();

  Assert.IsTrue(Resultado.Estado = enNovaVersaoDisponivel, 'Hash divergente deve forcar republicacao como nova versao disponivel.');
  Assert.AreEqual('v0030', Resultado.VersaoRemoto);
  Assert.AreEqual('v0030', Resultado.VersaoLocal);
  Assert.AreEqual(HASH_NOVO, Resultado.Sha256);
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.DeveManterCompativelQuandoVersaoAlvoMenorQueLocal;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  FConfigRepo.ConfigurarString(RTC_VERSAO_CALCULADORA_KEY, 'v0031');
  FControleApi.ConfigurarCompatibilidade('v0030', VERSAO_DOMINIO_RTC);
  FControleApi.ConfigurarPublicacao('v0030', HASH_NOVO, 'v0030', PUBLICADO_EM);

  Resultado := FUseCase.Executar();

  Assert.IsTrue(Resultado.Estado = enVersaoCompativel, 'Nao deve disponibilizar atualizacao para downgrade.');
  Assert.AreEqual('v0030', Resultado.VersaoRemoto);
  Assert.AreEqual('v0031', Resultado.VersaoLocal);
  Assert.IsTrue(FControleApi.PublicacaoChamada);
  Assert.IsTrue(FObserver.MensagemContem('mais recente'));
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.DeveAtualizarQuandoVersaoLocalInexistente;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  // Sem rtc_versao_calculadora: primeira sincronizacao.
  FControleApi.ConfigurarCompatibilidade('v0001', VERSAO_DOMINIO_RTC);
  FControleApi.ConfigurarPublicacao('v0001', HASH_NOVO, 'v0001', PUBLICADO_EM);

  Resultado := FUseCase.Executar();

  Assert.IsTrue(Resultado.Estado = enNovaVersaoDisponivel, 'Local inexistente deve atualizar para a versao alvo.');
  Assert.AreEqual('v0001', Resultado.VersaoRemoto);
  Assert.AreEqual('', Resultado.VersaoLocal);
  Assert.AreEqual('rtc-v0001', Resultado.Database);
  Assert.AreEqual(HASH_NOVO, Resultado.Sha256);
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.DeveFalharDirecionadoEReportarErroQuandoApiFalha;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  FConfigRepo.ConfigurarString(RTC_VERSAO_CALCULADORA_KEY, 'v0029');
  FControleApi.ConfigurarFalha('falha simulada de HTTP 500');

  Resultado := FUseCase.Executar();

  Assert.IsTrue(Resultado.Estado = enFalhaDirecionada, 'Falha da API deve resultar em falha direcionada.');
  Assert.IsTrue(FObserver.Errors.Count > 0, 'Falha da API deve reportar erro.');
  Assert.IsTrue(FObserver.ErroContem('500'), 'Erro deve preservar o status/mensagem da API.');
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.DeveEncaminharUrlETokenParaApi;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  FConfigRepo.ConfigurarString(RTC_VERSAO_CALCULADORA_KEY, 'v0029');
  FControleApi.ConfigurarCompatibilidade('v0030', VERSAO_DOMINIO_RTC);
  FControleApi.ConfigurarPublicacao('v0030', HASH_NOVO, 'v0030', PUBLICADO_EM);

  Resultado := FUseCase.Executar();

  Assert.IsTrue(Resultado.Estado = enNovaVersaoDisponivel);
  Assert.AreEqual(URL_TESTE, FControleApi.BaseUrl);
  Assert.AreEqual(FToken, FControleApi.Token);
  Assert.AreEqual(RTC_APP_NAME, FControleApi.UltimoAppName);
  Assert.AreEqual(VERSAO_DOMINIO_RTC, FControleApi.UltimoRtcVersion);
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.NaoDeveExporTokenNasMensagensDeErro;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  FControleApi.ConfigurarFalha('falha simulada sem segredo');

  Resultado := FUseCase.Executar();

  Assert.IsTrue(Resultado.Estado = enFalhaDirecionada);
  Assert.IsFalse(FObserver.ErroContem(FToken), 'Token nunca deve aparecer em erros.');
  Assert.IsFalse(FObserver.MensagemContem(FToken), 'Token nunca deve aparecer em mensagens.');
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.DeveSinalizarExigenciaERPQuandoSemAtualizacaoCompativel;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  FConfigRepo.ConfigurarString(RTC_VERSAO_CALCULADORA_KEY, 'v0039');
  FConfigRepo.ConfigurarString(RTC_PUBLICACAO_SHA256_KEY, HASH_NOVO);
  FControleApi.ConfigurarCompatibilidade('v0039', VERSAO_DOMINIO_RTC);
  FControleApi.ConfigurarPublicacao('v0039', HASH_NOVO, 'v0039', PUBLICADO_EM);
  FControleApi.ConfigurarDisponible('v0042', VERSAO_DOMINIO_RTC + 1);

  Resultado := FUseCase.Executar();

  Assert.IsTrue(FControleApi.DisponivelChamada, 'O probe de publicada deve ser consultado.');
  Assert.IsTrue(Resultado.Estado = enNovaVersaoERP, 'Publicada superior com dominio maior exige atualizacao do ERP.');
  Assert.AreEqual('v0042', Resultado.VersaoRemoto);
  Assert.AreEqual('v0039', Resultado.VersaoLocal);
  Assert.IsTrue(FObserver.WarningContem('v0042'), 'OnWarning deve carregar a versao superior.');
  Assert.IsFalse(FObserver.WarningContem(FToken), 'OnWarning nunca deve conter token.');
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.DeveSinalizarExigenciaERPQuandoLocalInferiorACompativel;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  FConfigRepo.ConfigurarString(RTC_VERSAO_CALCULADORA_KEY, 'v0035');
  FControleApi.ConfigurarCompatibilidade('v0039', VERSAO_DOMINIO_RTC);
  FControleApi.ConfigurarPublicacao('v0039', HASH_NOVO, 'v0039', PUBLICADO_EM);
  FControleApi.ConfigurarDisponible('v0042', VERSAO_DOMINIO_RTC + 1);

  Resultado := FUseCase.Executar();

  Assert.IsTrue(Resultado.Estado = enNovaVersaoERP, 'Publicada superior com dominio maior exige atualizacao do ERP.');
  Assert.AreEqual('v0042', Resultado.VersaoRemoto);
  Assert.AreEqual('v0035', Resultado.VersaoLocal);
  Assert.IsTrue(FObserver.WarningContem('v0042'));
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.DeveSinalizarExigenciaERPQuandoHashDivergente;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  FConfigRepo.ConfigurarString(RTC_VERSAO_CALCULADORA_KEY, 'v0039');
  FConfigRepo.ConfigurarString(RTC_PUBLICACAO_SHA256_KEY, HASH_ANTIGO);
  FControleApi.ConfigurarCompatibilidade('v0039', VERSAO_DOMINIO_RTC);
  FControleApi.ConfigurarPublicacao('v0039', HASH_NOVO, 'v0039', PUBLICADO_EM);
  FControleApi.ConfigurarDisponible('v0042', VERSAO_DOMINIO_RTC + 1);

  Resultado := FUseCase.Executar();

  Assert.IsTrue(Resultado.Estado = enNovaVersaoERP, 'Publicada superior com dominio maior exige atualizacao do ERP.');
  Assert.AreEqual('v0042', Resultado.VersaoRemoto);
  Assert.AreEqual('v0039', Resultado.VersaoLocal);
  Assert.IsTrue(FObserver.WarningContem('v0042'));
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.NaoDeveSinalizarQuandoPublicadaIgualCompativel;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  FConfigRepo.ConfigurarString(RTC_VERSAO_CALCULADORA_KEY, 'v0035');
  FControleApi.ConfigurarCompatibilidade('v0039', VERSAO_DOMINIO_RTC);
  FControleApi.ConfigurarPublicacao('v0039', HASH_NOVO, 'v0039', PUBLICADO_EM);
  FControleApi.ConfigurarDisponible('v0039', VERSAO_DOMINIO_RTC);

  Resultado := FUseCase.Executar();

  Assert.IsTrue(Resultado.Estado = enNovaVersaoDisponivel);
  Assert.AreEqual('v0039', Resultado.VersaoRemoto);
  Assert.AreEqual('v0035', Resultado.VersaoLocal);
  Assert.AreEqual('rtc-v0039', Resultado.Database);
  Assert.AreEqual(HASH_NOVO, Resultado.Sha256);
  Assert.IsTrue(FObserver.Warnings.Count = 0, 'Nao deve emitir aviso.');
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.NaoDeveSinalizarQuandoSemPublicada;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  FConfigRepo.ConfigurarString(RTC_VERSAO_CALCULADORA_KEY, 'v0035');
  FControleApi.ConfigurarCompatibilidade('v0039', VERSAO_DOMINIO_RTC);
  FControleApi.ConfigurarPublicacao('v0039', HASH_NOVO, 'v0039', PUBLICADO_EM);
  // Sem ConfigurarDisponible: a API nao retorna publicada.

  Resultado := FUseCase.Executar();

  Assert.IsTrue(FControleApi.DisponivelChamada, 'O probe deve ter sido consultado.');
  Assert.IsTrue(Resultado.Estado = enNovaVersaoDisponivel);
  Assert.AreEqual('v0039', Resultado.VersaoRemoto);
  Assert.AreEqual('v0035', Resultado.VersaoLocal);
  Assert.IsTrue(FObserver.Warnings.Count = 0, 'Sem publicada nao deve emitir aviso.');
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.NaoDeveSinalizarQuandoDominioPublicadoInconsistente;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  FConfigRepo.ConfigurarString(RTC_VERSAO_CALCULADORA_KEY, 'v0035');
  FControleApi.ConfigurarCompatibilidade('v0039', VERSAO_DOMINIO_RTC);
  FControleApi.ConfigurarPublicacao('v0039', HASH_NOVO, 'v0039', PUBLICADO_EM);
  FControleApi.ConfigurarPublicacao('v0040', HASH_NOVO, 'v0040', PUBLICADO_EM);
  // Publicada superior a compativel, mas com dominio igual: dados inconsistentes.
  FControleApi.ConfigurarDisponible('v0040', VERSAO_DOMINIO_RTC);

  Resultado := FUseCase.Executar();

  Assert.IsTrue(Resultado.Estado = enNovaVersaoDisponivel);
  Assert.AreEqual('v0040', Resultado.VersaoRemoto);
  Assert.AreEqual('v0035', Resultado.VersaoLocal);
  Assert.AreNotEqual(enNovaVersaoERP, Resultado.Estado, 'Dominio publicado nao maior nao exige ERP.');
  Assert.IsTrue(FObserver.Warnings.Count = 0, 'Inconsistencia nao gera aviso.');
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.DeveSinalizarExigenciaERPQuandoSemCompativel;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  FConfigRepo.ConfigurarString(RTC_VERSAO_CALCULADORA_KEY, 'v0039');
  // Sem ConfigurarCompatibilidade: catalogo compativel vazio.
  FControleApi.ConfigurarDisponible('v0042', VERSAO_DOMINIO_RTC + 1);

  Resultado := FUseCase.Executar();

  Assert.IsTrue(FControleApi.DisponivelChamada, 'O probe roda mesmo sem compativel.');
  Assert.IsFalse(FControleApi.PublicacaoChamada, 'Sem compativel nao consulta publicacao.');
  Assert.IsTrue(Resultado.Estado = enFalhaDirecionada, 'Sem compativel deve resultar em falha direcionada.');
  Assert.AreEqual('v0042', Resultado.VersaoRemoto);
  Assert.AreEqual('v0039', Resultado.VersaoLocal);
  Assert.IsTrue(FObserver.WarningContem('v0042'), 'Deve emitir aviso de versao superior antes de falhar.');
  Assert.IsTrue(FObserver.ErroContem('Nenhuma versao compativel'), 'Deve registrar erro de catalogo compativel vazio.');
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.DeveSinalizarExigenciaERPQuandoLocalInexistente;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  // Sem rtc_versao_calculadora e sem versao compativel publicada.
  FControleApi.ConfigurarDisponible('v0042', VERSAO_DOMINIO_RTC + 1);

  Resultado := FUseCase.Executar();

  Assert.IsTrue(Resultado.Estado = enFalhaDirecionada, 'Sem compativel deve resultar em falha direcionada.');
  Assert.AreEqual('v0042', Resultado.VersaoRemoto);
  Assert.AreEqual('', Resultado.VersaoLocal);
  Assert.IsTrue(FObserver.WarningContem('v0042'));
  Assert.IsTrue(FObserver.Errors.Count > 0);
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.NaoDeveSinalizarQuandoLocalAdiantado;
var
  Resultado: AtualizacaoCalculadoraModel;
begin
  ConfigurarUrlEToken;
  FConfigRepo.ConfigurarString(RTC_VERSAO_CALCULADORA_KEY, 'v0041');
  FControleApi.ConfigurarCompatibilidade('v0039', VERSAO_DOMINIO_RTC);
  FControleApi.ConfigurarPublicacao('v0039', HASH_NOVO, 'v0039', PUBLICADO_EM);
  FControleApi.ConfigurarPublicacao('v0040', HASH_NOVO, 'v0040', PUBLICADO_EM);
  // Publicada com dominio maior, porem inferior a versao local.
  FControleApi.ConfigurarDisponible('v0040', VERSAO_DOMINIO_RTC + 1);

  Resultado := FUseCase.Executar();

  Assert.IsTrue(FControleApi.DisponivelChamada);
  Assert.IsTrue(Resultado.Estado = enVersaoCompativel, 'Nao deve aplicar downgrade.');
  Assert.AreEqual('v0040', Resultado.VersaoRemoto);
  Assert.AreEqual('v0041', Resultado.VersaoLocal);
  Assert.IsTrue(FObserver.Warnings.Count = 0, 'Local adiantado nao gera aviso.');
  Assert.IsTrue(FObserver.MensagemContem('mais recente que a publicada'));
end;

procedure TTestObterAtualizacaoCalculadoraUseCase.DeveDegradarSemAvisoQuandoProbeDisponivelFalha;
var
  Resultado: AtualizacaoCalculadoraModel;
  ControleComFalha: TFakeFalhaProbeDisponivel;
begin
  ConfigurarUrlEToken;
  FConfigRepo.ConfigurarString(RTC_VERSAO_CALCULADORA_KEY, 'v0035');
  FControleApi.ConfigurarCompatibilidade('v0039', VERSAO_DOMINIO_RTC);
  FControleApi.ConfigurarPublicacao('v0039', HASH_NOVO, 'v0039', PUBLICADO_EM);

  ControleComFalha := TFakeFalhaProbeDisponivel.Create(FControleApi);
  FUseCase := ObterAtualizacaoCalculadoraUseCase.Create(
    FConfigRepo, ControleComFalha, FTokeDecryptor, FObserverIntf);

  Resultado := FUseCase.Executar();

  Assert.IsTrue(ControleComFalha.DisponivelChamada, 'O probe deve ter sido consultado.');
  Assert.IsTrue(Resultado.Estado = enNovaVersaoDisponivel, 'A falha do probe nao pode impedir a aplicacao da compativel.');
  Assert.AreEqual('v0039', Resultado.VersaoRemoto);
  Assert.AreEqual('v0035', Resultado.VersaoLocal);
  Assert.AreEqual(HASH_NOVO, Resultado.Sha256);
  Assert.AreEqual('rtc-v0039', Resultado.Database);
  Assert.IsTrue(FObserver.Warnings.Count = 0, 'Falha do probe nao deve gerar aviso.');
  Assert.IsTrue(FObserver.Errors.Count = 0, 'Falha do probe nao deve ser tratada como erro fatal.');
  Assert.IsTrue(FObserver.MensagemContem('Falha ao consultar a versao publicada'));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestObterAtualizacaoCalculadoraUseCase);

end.
