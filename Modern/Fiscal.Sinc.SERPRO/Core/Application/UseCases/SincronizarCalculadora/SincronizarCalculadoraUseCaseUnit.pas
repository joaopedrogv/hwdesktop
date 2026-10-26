unit SincronizarCalculadoraUseCaseUnit;

interface

uses
  ISincronizarCalculadoraUseCaseUnit, IDataBaseConnectionUnit,
  IConfiguracoesRepositoryUnit,
  IProgressObserverUnit,
  IControleVersaoCalculadoraApiUnit,
  ISincronizadorCalculadoraServiceUnit,
  ISincronizacaoCalculadoraLockServiceUnit,
  IDadosFiscaisReaderUnit,
  ITokenDecryptorUnit,
  AtualizacaoCalculadoraModelUnit;

type

  SincronizarCalculadoraUseCase = class(TInterfacedObject, ISincronizarCalculadoraUseCase)
  private
    FConnection: IDataBaseConnection;
    FConfigRepo: IConfiguracoesRepository;
    FObserver: IProgressObserver;
    FSincronizador: ISincronizadorCalculadoraService;
    FLockService: ISincronizacaoCalculadoraLockService;
    FControleApi: IControleVersaoCalculadoraApi;
    FTokenDecryptor: ITokenDecryptor;
    FReader: IDadosFiscaisReader;

    function LerValorString(const AChave: string): string;
    function LerValorBoolean(const AChave: string): Boolean;
    procedure DoLog(const AMensagem: string);
    procedure DoError(const AMensagem: string);
    procedure GravarHashPublicacao(const ASha256: string);
  public
    constructor Create(
      AConnection: IDataBaseConnection;
      AConfigRepo: IConfiguracoesRepository;
      AObserver: IProgressObserver;
      ASincronizador: ISincronizadorCalculadoraService;
      ALockService: ISincronizacaoCalculadoraLockService;
      AControleApi: IControleVersaoCalculadoraApi;
      ATokenDecryptor: ITokenDecryptor;
      AReader: IDadosFiscaisReader
    );

    procedure Executar(const AAtualizacao: AtualizacaoCalculadoraModel);
  end;

implementation

uses
  SysUtils,
  ITransactionUnit, ConfiguracaoEtdUnit, ConfiguracaoRtcUnit, ConfiguracaoRtcFactoryUnit, PublicacaoRtcModelUnit,
  SincronizacaoCalculadoraLeaseUnit, SincronizacaoCalculadoraSnapshotUnit, StringNullableUnit, DateAndTimeNullableUnit,
  StringServiceUnit;

{ SincronizarCalculadoraUseCase }

constructor SincronizarCalculadoraUseCase.Create(
  AConnection: IDataBaseConnection;
  AConfigRepo: IConfiguracoesRepository;
  AObserver: IProgressObserver;
  ASincronizador: ISincronizadorCalculadoraService;
  ALockService: ISincronizacaoCalculadoraLockService;
  AControleApi: IControleVersaoCalculadoraApi;
  ATokenDecryptor: ITokenDecryptor;
  AReader: IDadosFiscaisReader
);
begin
  inherited Create;
  FConnection := AConnection;
  FConfigRepo := AConfigRepo;
  FObserver := AObserver;
  FSincronizador := ASincronizador;
  FLockService := ALockService;
  FControleApi := AControleApi;
  FTokenDecryptor := ATokenDecryptor;
  FReader := AReader;
end;

function SincronizarCalculadoraUseCase.LerValorBoolean(const AChave: string): Boolean;
var
  Config: ConfiguracaoEtd;
begin
  Result := False;

  Config := FConfigRepo.GetByKey(AChave, RTC_EMPRESA_ID);
  try
    if Assigned(Config) then
      Result := Config.ValorBool;
  finally
    Config.Free;
  end;
end;

function SincronizarCalculadoraUseCase.LerValorString(const AChave: string): string;
var
  Config: ConfiguracaoEtd;
begin
  Result := '';

  // GetByKey devolve entidade de propriedade do chamador.
  Config := FConfigRepo.GetByKey(AChave, RTC_EMPRESA_ID);
  try
    if Assigned(Config) then
      Result := Trim(Config.ValorString.ToText(''));
  finally
    Config.Free;
  end;
end;

procedure SincronizarCalculadoraUseCase.DoLog(const AMensagem: string);
begin
  if Assigned(FObserver) then
    FObserver.OnMessage(AMensagem);
end;

procedure SincronizarCalculadoraUseCase.DoError(const AMensagem: string);
begin
  if Assigned(FObserver) then
    FObserver.OnError(AMensagem);
end;

procedure SincronizarCalculadoraUseCase.GravarHashPublicacao(const ASha256: string);
var
  ConfigAtual: ConfiguracaoEtd;
  NovaConfig: ConfiguracaoEtd;
begin
  // Hash gravado na MESMA transacao da aplicacao; a entidade nova pertence ao
  // use case e e liberada apos o Post/Put (o repositorio nao toma posse).
  ConfigAtual := FConfigRepo.GetByKey(RTC_PUBLICACAO_SHA256_KEY, RTC_EMPRESA_ID);
  try
    if Assigned(ConfigAtual) then
      NovaConfig := ConfiguracaoRtcFactory.ClonarCom(
        ConfigAtual,
        StringNullable.Create(ASha256),
        ConfigAtual.ValorDateTime
      )
    else
      NovaConfig := ConfiguracaoRtcFactory.CriarAtualizacao(
        RTC_PUBLICACAO_SHA256_KEY,
        StringNullable.Create(ASha256),
        DateTimeNullable.NullInstance()
      );

    try
      if Assigned(ConfigAtual) then
        FConfigRepo.Put(NovaConfig)
      else
        FConfigRepo.Post(NovaConfig);
    finally
      NovaConfig.Free;
    end;
  finally
    ConfigAtual.Free;
  end;
end;

procedure SincronizarCalculadoraUseCase.Executar(const AAtualizacao: AtualizacaoCalculadoraModel);
var
  Url, Token: string;
  Lease: SincronizacaoCalculadoraLease;
  Publicacao: PublicacaoRtcModel;
  Snapshot: SincronizacaoCalculadoraSnapshot;
  Transaction, LockTransaction: ITransaction;
  AmbienteDev: Boolean;
begin
  // (1) Sem publicacao aplicavel (nula ou estado nao aplicavel): nada a fazer.
  if AAtualizacao.Estado <> enNovaVersaoDisponivel  then
    Exit;

  Lease := SincronizacaoCalculadoraLease.NullInstance();
  Publicacao := nil;
  Snapshot := nil;
  Transaction := nil;
  LockTransaction := nil;

  // A transacao e a leitura ficam no bloco interno; o finally externo sempre
  // libera snapshot/transacao/lease, inclusive nos Exit antecipados.
  try
    try
      // (2) Configuracao: fail closed sem URL/token; token nunca exibido.
      Url := StringService.Default(LerValorString(RTC_API_URL_KEY), RTC_API_URL_DEFAULT);
      Token := LerValorString(RTC_API_TOKEN_KEY);

      if (Url = '') or (Token = '') then
      begin
        DoError('Configuracao da API da calculadora ausente (rtc_api_url/rtc_api_token); ' +
          'a sincronizacao nao sera aplicada.');
        Exit;
      end;

      // (3) Lease de escritor unico: ocupado encerra sem erro fatal.
      LockTransaction := FConnection.BeginTransaction();

      if not FLockService.TryAcquire(Lease) then
      begin
        DoLog('Sincronizacao da calculadora ja esta em andamento em outra instancia; ' +
          'a aplicacao nao sera executada.');
        Exit;
      end;
      LockTransaction.Commit();

      // Descriptografando token
      Token := FTokenDecryptor.Decrypt(Token);

      AmbienteDev := LerValorBoolean(RTC_AMBIENTE_LOCAL_DEV);

      // (4) Configura a origem de leitura e a API da publicacao fixada. O
      //     adaptador da API e uma instancia separada e precisa da mesma URL/token.
      FReader.Configurar(Url, Token, AAtualizacao.Database);
      FControleApi.Configurar(Url, Token, AmbienteDev);

      // (5) Re-checagem da publicacao: o sha256 relido precisa coincidir com o
      //     descritor verificado; sem isso, aborta sem aplicar.
      Publicacao := FControleApi.ObterPublicacao(AAtualizacao.VersaoRemoto);
      if (Publicacao = nil) or (Publicacao.sha256 <> AAtualizacao.Sha256) then
      begin
        DoError(Format('A publicacao %s mudou apos a verificacao (sha256 relido divergente); ' +
          'a sincronizacao foi abortada sem aplicar.', [AAtualizacao.VersaoRemoto]));
        Exit;
      end;

      // (6) Fase de leitura (sem transacao): qualquer falha propaga e aborta
      //     sem qualquer escrita.
      Snapshot := FSincronizador.LerTodos();

      // (7) Fase de aplicacao (transacao propria, so apos todas as leituras).
      Transaction := FConnection.BeginTransaction();

      if not FSincronizador.Aplicar(Snapshot) then
        raise Exception.Create('Falha ao aplicar a publicacao da calculadora; a transacao sera revertida.');

      GravarHashPublicacao(AAtualizacao.Sha256);

      Transaction.Commit();

      DoLog(Format('Calculadora sincronizada com a publicacao %s.', [AAtualizacao.VersaoRemoto]));

      if Assigned(FObserver) then
        FObserver.OnComplete();
    except
      on E: Exception do
      begin
        // (8) Rollback: o hash (gravado na mesma transacao) nao persiste.
        if Assigned(Transaction) then
          Transaction.Rollback();

        DoError('Falha ao sincronizar a calculadora: ' + E.Message);
      end;
    end;
  finally
    // (9) Liberacao sempre executada (sucesso, falha ou saida antecipada).
    Publicacao.Free();
    Snapshot.Free();
    Transaction.Free();

    if not Lease.IsNull then
    begin
      try
        FLockService.Release();
        LockTransaction.Commit();
      except
        // Log seguro (sem token); o lease expira pelo TTL de 30 min.
        DoLog('Nao foi possivel liberar o lease da calculadora; ele expirara automaticamente.');
      end;
    end;
    LockTransaction.Free();
  end;
end;

end.
