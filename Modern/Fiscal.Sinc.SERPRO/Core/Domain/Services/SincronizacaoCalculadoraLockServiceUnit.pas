unit SincronizacaoCalculadoraLockServiceUnit;

interface

uses
  IConfiguracoesRepositoryUnit,
  ISincronizacaoCalculadoraLockServiceUnit,
  SincronizacaoCalculadoraLeaseUnit;

type
  /// <summary>
  ///   Lease de sincronizacao da calculadora sobre CONFIG_SISTEMA.
  ///   Protocolo (plano 6.2 / design 7.1):
  ///     1. leitura FRESCA da chave rtc_sincronizacao_lock (sem cache);
  ///     2. se ValorDateTime > Now => ocupado (False);
  ///     3. token da instancia = GuidService.New();
  ///     4. VALUE_DT = Now + 30min e VALUE1_VC = token; Post se ausente / Put se existente;
  ///     5. colisao de Post => ocupado (False);
  ///     6. re-leitura de confirmacao do token => True + Lease;
  ///     7. entidades construidas/lidas sao liberadas pelo servico.
  ///   Release grava Now() apenas quando o token armazenado ainda e o proprio.
  ///   Nao ha renovacao/heartbeat; o lease expira por TTL (30 min).
  ///   O token da instancia NUNCA e o bearer token da API e nunca e logado.
  ///   Unidade 2006-compativel (sem marcador).
  /// </summary>
  SincronizacaoCalculadoraLockService = class(TInterfacedObject, ISincronizacaoCalculadoraLockService)
  private
    FConfigRepo: IConfiguracoesRepository;
    FInstanceToken: string;

    function ConfirmarTokenProprio(): Boolean;
  public
    constructor Create(const AConfigRepo: IConfiguracoesRepository);
    function TryAcquire(out ALease: SincronizacaoCalculadoraLease): Boolean;
    procedure Release;
  end;

implementation

uses
  SysUtils,
  DateUtils,
  GuidServiceUnit,
  ConfiguracaoEtdUnit,
  ConfiguracaoRtcUnit,
  ConfiguracaoRtcFactoryUnit,
  StringNullableUnit,
  DateAndTimeNullableUnit;

{ SincronizacaoCalculadoraLockService }

constructor SincronizacaoCalculadoraLockService.Create(const AConfigRepo: IConfiguracoesRepository);
begin
  inherited Create;
  FConfigRepo := AConfigRepo;
  FInstanceToken := '';
end;

function SincronizacaoCalculadoraLockService.ConfirmarTokenProprio(): Boolean;
var
  Confirmacao: ConfiguracaoEtd;
begin
  Confirmacao := FConfigRepo.GetByKey(RTC_SINCRONIZACAO_LOCK_KEY, RTC_EMPRESA_ID);
  try
    Result := Assigned(Confirmacao) and Confirmacao.ValorString.HasValue and
      (Confirmacao.ValorString.Value = FInstanceToken);
  finally
    Confirmacao.Free;
  end;
end;

function SincronizacaoCalculadoraLockService.TryAcquire(
  out ALease: SincronizacaoCalculadoraLease
): Boolean;
var
  LockCfg: ConfiguracaoEtd;
  NovaCfg: ConfiguracaoEtd;
  ExpiraEm: TDateTime;
begin
  ALease := SincronizacaoCalculadoraLease.NullInstance();
  FInstanceToken := '';
  Result := False;

  // 1. Leitura fresca (sem cache) da chave de lock.
  LockCfg := FConfigRepo.GetByKey(RTC_SINCRONIZACAO_LOCK_KEY, RTC_EMPRESA_ID);
  try
    // 2. Lease valido de outra instancia => ocupado.
    if Assigned(LockCfg) and LockCfg.ValorDateTime.HasValue and
      (LockCfg.ValorDateTime.Value > Now) then
      Exit(False);

    // 3. Token da instancia (GUID), sem relacao com o bearer token.
    FInstanceToken := GuidService.New();
    ExpiraEm := IncMinute(Now, RTC_SYNC_LEASE_MINUTES);

    // 4. Cria (ausente) ou clona (existente) preservando a TStrings de origem.
    if Assigned(LockCfg) then
      NovaCfg := ConfiguracaoRtcFactory.ClonarCom(
        LockCfg,
        StringNullable.Create(FInstanceToken),
        DateTimeNullable.Create(ExpiraEm)
      )
    else
      NovaCfg := ConfiguracaoRtcFactory.CriarAtualizacao(
        RTC_SINCRONIZACAO_LOCK_KEY,
        StringNullable.Create(FInstanceToken),
        DateTimeNullable.Create(ExpiraEm)
      );

    try
      if Assigned(LockCfg) then
        FConfigRepo.Put(NovaCfg)
      else
      begin
        try
          FConfigRepo.Post(NovaCfg);
        except
          // 5. Colisao de Post: outra instancia criou a chave primeiro => ocupado.
          FInstanceToken := '';
          Exit(False);
        end;
      end;
    finally
      NovaCfg.Free;
    end;

    // 6. Re-leitura de confirmacao: o token armazenado precisa ser o proprio.
    if not ConfirmarTokenProprio() then
    begin
      FInstanceToken := '';
      Exit(False);
    end;

    ALease := SincronizacaoCalculadoraLease.Create(FInstanceToken, ExpiraEm);
    Result := True;
  finally
    // 7. A entidade lida pertence ao chamador (o repositorio nao toma posse).
    LockCfg.Free;
  end;
end;

procedure SincronizacaoCalculadoraLockService.Release;
var
  LockCfg: ConfiguracaoEtd;
  NovaCfg: ConfiguracaoEtd;
begin
  if FInstanceToken = '' then
    Exit;

  LockCfg := FConfigRepo.GetByKey(RTC_SINCRONIZACAO_LOCK_KEY, RTC_EMPRESA_ID);
  try
    // So libera quando o token armazenado ainda pertence a esta instancia.
    if Assigned(LockCfg) and LockCfg.ValorString.HasValue and
      (LockCfg.ValorString.Value = FInstanceToken) then
    begin
      // Data valida (Now), nunca nula; o lease fica imediatamente livre.
      NovaCfg := ConfiguracaoRtcFactory.ClonarCom(
        LockCfg,
        LockCfg.ValorString,
        DateTimeNullable.Create(Now)
      );
      try
        FConfigRepo.Put(NovaCfg);
      finally
        NovaCfg.Free;
      end;
    end;
  finally
    LockCfg.Free;
    FInstanceToken := '';
  end;
end;

end.
