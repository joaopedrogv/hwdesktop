unit ObterAtualizacaoCalculadoraUseCaseUnit;

interface

uses
  IConfiguracoesRepositoryUnit,
  IControleVersaoCalculadoraApiUnit,
  IProgressObserverUnit,
  ITokenDecryptorUnit,
  AtualizacaoCalculadoraModelUnit;

type
  /// <summary>
  ///   Verificacao (somente leitura) da atualizacao da calculadora SERPRO.
  ///   Retorna o descritor da publicacao a aplicar ou NullInstance quando nao ha
  ///   atualizacao. Falha sempre fechado (nunca aplica parcial; nunca faz downgrade).
  ///   Unidade 2006-compativel (sem marcador).
  /// </summary>
  IObterAtualizacaoCalculadoraUseCase = interface
    ['{4B91FAC7-532C-4B33-8D7F-D2545E1A887B}']
    function Executar(): AtualizacaoCalculadoraModel;
  end;

  ObterAtualizacaoCalculadoraUseCase = class(TInterfacedObject, IObterAtualizacaoCalculadoraUseCase)
  private
    FConfigRepo: IConfiguracoesRepository;
    FControleApi: IControleVersaoCalculadoraApi;
    FTokenDecryptor: ITokenDecryptor;
    FObserver: IProgressObserver;

    function LerValorString(const AChave: string): string;
    function LerValorBoolean(const AChave: string): Boolean;
    procedure DoLog(const AMensagem: string);
    procedure DoWarning(const AMensagem: string);
    procedure DoError(const AMensagem: string);
  public
    constructor Create(
      AConfigRepo: IConfiguracoesRepository;
      AControleApi: IControleVersaoCalculadoraApi;
      ATokenDecryptor: ITokenDecryptor;
      AObserver: IProgressObserver
    );

    function Executar(): AtualizacaoCalculadoraModel;
  end;

implementation

uses
  SysUtils,
  StringServiceUnit, ConfiguracaoEtdUnit, ConfiguracaoRtcUnit, CompatibilidadeRtcModelUnit, PublicacaoRtcModelUnit;

type
  EWarningEx = class(Exception);

{ ObterAtualizacaoCalculadoraUseCase }

constructor ObterAtualizacaoCalculadoraUseCase.Create(
  AConfigRepo: IConfiguracoesRepository;
  AControleApi: IControleVersaoCalculadoraApi;
  ATokenDecryptor: ITokenDecryptor;
  AObserver: IProgressObserver
);
begin
  inherited Create;
  FConfigRepo := AConfigRepo;
  FControleApi := AControleApi;
  FTokenDecryptor := ATokenDecryptor;
  FObserver := AObserver;
end;

procedure ObterAtualizacaoCalculadoraUseCase.DoLog(const AMensagem: string);
begin
  if Assigned(FObserver) then
    FObserver.OnMessage(AMensagem);
end;

procedure ObterAtualizacaoCalculadoraUseCase.DoWarning(const AMensagem: string);
begin
  if Assigned(FObserver) then
    FObserver.OnWarning(AMensagem);
end;

procedure ObterAtualizacaoCalculadoraUseCase.DoError(const AMensagem: string);
begin
  if Assigned(FObserver) then
    FObserver.OnError(AMensagem);
end;

function ObterAtualizacaoCalculadoraUseCase.LerValorBoolean(const AChave: string): Boolean;
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

function ObterAtualizacaoCalculadoraUseCase.LerValorString(const AChave: string): string;
var
  Config: ConfiguracaoEtd;
begin
  Result := '';

  Config := FConfigRepo.GetByKey(AChave, RTC_EMPRESA_ID);
  try
    if Assigned(Config) then
      Result := Trim(Config.ValorString.ToText(''));
  finally
    Config.Free;
  end;
end;

function ObterAtualizacaoCalculadoraUseCase.Executar(): AtualizacaoCalculadoraModel;
var
  Url, Token, StoredHash, LocalVersion, RemoteVersion, Sha256, DBName: string;

  LocalConfig: ConfiguracaoEtd;
  LocalExiste: Boolean;
  UltimaCompativel: CompatibilidadeRtcModel;
  UltimaDisponivel: CompatibilidadeRtcModel;
  PublicacaoVersao: PublicacaoRtcModel;
  RequerAtualizacaoERP, AmbienteDev: Boolean;
  Estado: TEstadoAtualizacaoCalculadora;
  DominioRequerido: Integer;
begin
  RequerAtualizacaoERP := False;
  LocalExiste := False;
  LocalVersion := '';
  RemoteVersion := '';
  Sha256 := '';
  DBName := '';
  DominioRequerido := 0;

  UltimaCompativel := nil;
  UltimaDisponivel := nil;
  PublicacaoVersao := nil;
  try
    try
      // (1) Configuracao: fail closed sem URL/token; token nunca exibido.
      Url   := StringService.Default(LerValorString(RTC_API_URL_KEY), RTC_API_URL_DEFAULT);
      Token := LerValorString(RTC_API_TOKEN_KEY);

      if (Url = '') or (Token = '') then
        raise EWarningEx.Create('Configuracao da API da calculadora ausente (rtc_api_url/rtc_api_token); ' +
          'a atualizacao nao sera aplicada.'
        );

      // (2) Versao local: rtc_versao_calculadora / ValorString.
      LocalConfig := FConfigRepo.GetByKey(RTC_VERSAO_CALCULADORA_KEY, RTC_EMPRESA_ID);
      try
        if Assigned(LocalConfig) and (not LocalConfig.ValorString.IsNull) then
        begin
          LocalVersion := LocalConfig.ValorString.Value.ToLower();
          LocalExiste := True;
        end;
      finally
        LocalConfig.Free;
      end;

      AmbienteDev := LerValorBoolean(RTC_AMBIENTE_LOCAL_DEV);

      // Descriptografando token
      Token := FTokenDecryptor.Decrypt(Token);

      // Consulta da ultima versao compativel.
      FControleApi.Configurar(Url, Token, AmbienteDev);
      UltimaCompativel := FControleApi.ObterUltimaCompativel(RTC_APP_NAME, VERSAO_DOMINIO_RTC);

      if UltimaCompativel <> nil then
        RemoteVersion := UltimaCompativel.calc_version;

      // Consulta da ultima versao publicada (sem filtro de dominio). Executada sempre que a configuracao esta ok,
      // inclusive quando nao ha compativel. O probe e secundario: sua falha degenera para "sem aviso" e nao impede
      // a aplicacao da versao compativel (decisao 9).
      try
        UltimaDisponivel := FControleApi.ObterUltimaDisponivel(RTC_APP_NAME);
      except
        UltimaDisponivel  := nil;
        // verificar isso
        DoLog('Falha ao consultar a versao publicada; seguindo sem aviso de atualizacao do ERP.');
      end;

      // Regra "exige atualizacao do ERP": publicada superior, com dominio maior que o suportado e que o ERP ainda
      // nao possui. Baseline contra a versao local.
      if UltimaDisponivel <> nil then
      begin
        RemoteVersion        := UltimaDisponivel.calc_version;
        DominioRequerido     := UltimaDisponivel.rtc_version;
        RequerAtualizacaoERP := (UltimaDisponivel.rtc_version > VERSAO_DOMINIO_RTC) and
          ((not LocalExiste) or (CompareText(UltimaDisponivel.calc_version, LocalVersion) > 0));
      end;

      // Rastro do aviso (sem token); nao bloqueia a aplicacao da compativel.
      if RequerAtualizacaoERP then
        DoWarning(Format('Existe versao publicada superior (%s) que requer atualizacao do ERP ' +
          '(dominio %d > %d); a versao compativel sera aplicada quando houver.',
          [RemoteVersion, DominioRequerido, VERSAO_DOMINIO_RTC])
        );

      // Matriz combinada sobre compatible x localVersion.
      if UltimaCompativel = nil then
        raise EWarningEx.Create(Format('Nenhuma versao compativel encontrada para app_name=%s e rtc_version=%d.',
          [RTC_APP_NAME, VERSAO_DOMINIO_RTC])
        );

      // Estado default
      Estado := enVersaoCompativel;

      if RequerAtualizacaoERP then
        Estado := enNovaVersaoERP

      else if RemoteVersion < LocalVersion  then
        DoLog(Format('Versao local (%s) mais recente que a publicada (%s)', [LocalVersion, RemoteVersion]))

      else if RemoteVersion > LocalVersion then
        Estado := enNovaVersaoDisponivel;

      // Obtem Sha256 da publicacao alvo, Checagem de republicacao obrigatoria quando mesma versao
      case Estado of
        enNovaVersaoDisponivel, enVersaoCompativel:
          begin
            PublicacaoVersao := FControleApi.ObterPublicacao(RemoteVersion);
            if PublicacaoVersao = nil then
              raise EWarningEx.Create(Format('Publicacao %s nao encontrada na API; a atualizacao nao sera aplicada.',
                [UltimaCompativel.calc_version])
              );
            try
              StoredHash := LerValorString(RTC_PUBLICACAO_SHA256_KEY);
              Sha256     := PublicacaoVersao.sha256;
              DBName     := 'rtc-' + RemoteVersion;

              if (Estado = enVersaoCompativel) and (RemoteVersion = LocalVersion) and (Sha256 <> StoredHash) then
                Estado := enNovaVersaoDisponivel;
            finally
              FreeAndNil(PublicacaoVersao);
            end;
          end;
      end;

      Result := AtualizacaoCalculadoraModel.CreateNovo(Estado, LocalVersion, RemoteVersion, Sha256, DBName);

    except
      on E: EWarningEx do
      begin
        DoError('Falha ao verificar a atualizacao da calculadora: ' + E.Message);
        Result := AtualizacaoCalculadoraModel.CreateNovo(
          enFalhaDirecionada, LocalVersion, RemoteVersion, Sha256, DBName
        );
      end;

      // Falha de HTTP/JSON/TLS/parse: erro claro, sem token, sem atualizacao.
      on E: Exception do
      begin
        DoError('Falha ao verificar a atualizacao da calculadora: ' + E.Message);
        Result := AtualizacaoCalculadoraModel.CreateNovo(
          enFalhaDirecionada, LocalVersion, RemoteVersion, Sha256, DBName
        );
      end;
    end;

  finally
    FreeAndNil(PublicacaoVersao);
    FreeAndNil(UltimaCompativel);
    FreeAndNil(UltimaDisponivel);
  end;
end;

end.
