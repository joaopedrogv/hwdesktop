unit Test_SincronizacaoCalculadoraLockService;

interface

uses
  DUnitX.TestFramework,
  ConfiguracaoEtdUnit,
  IConfiguracoesRepositoryUnit,
  ISincronizacaoCalculadoraLockServiceUnit,
  SincronizacaoCalculadoraLeaseUnit,
  SincronizacaoCalculadoraLockServiceUnit,
  DateAndTimeNullableUnit,
  FakeConfiguracoesRepositoryUnit;

type
  /// <summary>
  ///   Extensao minima do fake compartilhado para os cenarios que exigem uma
  ///   corrida (leitura desatualizada que provoca colisao de Post) e divergencia
  ///   na re-leitura de confirmacao. O fake base nao e alterado; apenas os
  ///   cenarios especificos sobrepoem o comportamento da leitura do lock.
  /// </summary>
  TRepositorioLockColisao = class(TFakeConfiguracoesRepository)
  private
    FSimularLeituraAusente: Boolean;
    FForcarDivergenciaNaConfirmacao: Boolean;
    FLeiturasLockDaChave: Integer;
  public
    function GetByKey(const Chave: string; EmpresaId: Integer): ConfiguracaoEtd; overload; override;

    property SimularLeituraAusente: Boolean read FSimularLeituraAusente write FSimularLeituraAusente;
    property ForcarDivergenciaNaConfirmacao: Boolean
      read FForcarDivergenciaNaConfirmacao write FForcarDivergenciaNaConfirmacao;
  end;

  [TestFixture]
  TTestSincronizacaoCalculadoraLockService = class
  private
    FConfigRepo: TRepositorioLockColisao;
    FLock: ISincronizacaoCalculadoraLockService;

    procedure SemearLock(const AToken: string; AExpiraEm: TDateTime);
    function ObterTokenArmazenado(): string;
    function ObterExpiracaoArmazenada(): DateTimeNullable;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveAdquirirLeaseQuandoLivre;

    [Test]
    procedure DeveFalharQuandoLeaseOcupado;

    [Test]
    procedure DeveAdquirirQuandoLeaseExpirado;

    [Test]
    procedure DeveConfirmarTokenProprioAposTomada;

    [Test]
    procedure DeveFalharQuandoPostColide;

    [Test]
    procedure DeveFalharQuandoConfirmacaoDoTokenDiverge;

    [Test]
    procedure DeveLiberarQuandoTokenProprio;

    [Test]
    procedure DeveGravarDataValidaAoLiberar;

    [Test]
    procedure DeveNaoLiberarQuandoTokenPertenceATerceiro;

    [Test]
    procedure DeveUsarLeituraFrescaSemCache;
  end;

implementation

uses
  SysUtils,
  DateUtils,
  ConfiguracaoRtcUnit,
  ConfiguracaoRtcFactoryUnit,
  StringNullableUnit;

const
  // Placeholders de teste; nunca sao bearer tokens reais.
  TOKEN_TERCEIRO = 'token-de-terceiro';
  TOKEN_ANTIGO = 'token-expirado';
  TOKEN_DIVERGENTE = 'token-divergente';

{ TRepositorioLockColisao }

function TRepositorioLockColisao.GetByKey(
  const Chave: string;
  EmpresaId: Integer
): ConfiguracaoEtd;
begin
  if Chave <> RTC_SINCRONIZACAO_LOCK_KEY then
  begin
    Result := inherited GetByKey(Chave, EmpresaId);
    Exit;
  end;

  Inc(FLeiturasLockDaChave);

  // Simula a leitura desatualizada que precede a colisao de Post.
  if FSimularLeituraAusente then
  begin
    FSimularLeituraAusente := False;
    Result := nil;
    Exit;
  end;

  // A partir da segunda leitura (confirmacao), devolve um token de terceiro.
  if FForcarDivergenciaNaConfirmacao and (FLeiturasLockDaChave >= 2) then
  begin
    Result := ConfiguracaoRtcFactory.CriarAtualizacao(
      RTC_SINCRONIZACAO_LOCK_KEY,
      StringNullable.Create(TOKEN_DIVERGENTE),
      DateTimeNullable.Create(IncMinute(Now, RTC_SYNC_LEASE_MINUTES))
    );
    Exit;
  end;

  Result := inherited GetByKey(Chave, EmpresaId);
end;

{ TTestSincronizacaoCalculadoraLockService }

procedure TTestSincronizacaoCalculadoraLockService.Setup;
begin
  FConfigRepo := TRepositorioLockColisao.Create;
  FLock := SincronizacaoCalculadoraLockService.Create(FConfigRepo);
end;

procedure TTestSincronizacaoCalculadoraLockService.TearDown;
begin
  // Soltar a interface antes de liberar o repositorio que ela referencia.
  FLock := nil;
  FConfigRepo.Free;
end;

procedure TTestSincronizacaoCalculadoraLockService.SemearLock(
  const AToken: string;
  AExpiraEm: TDateTime
);
var
  Configuracao: ConfiguracaoEtd;
begin
  Configuracao := ConfiguracaoRtcFactory.CriarAtualizacao(
    RTC_SINCRONIZACAO_LOCK_KEY,
    StringNullable.Create(AToken),
    DateTimeNullable.Create(AExpiraEm)
  );
  try
    FConfigRepo.Put(Configuracao);
  finally
    Configuracao.Free;
  end;
end;

function TTestSincronizacaoCalculadoraLockService.ObterTokenArmazenado(): string;
var
  Configuracao: ConfiguracaoEtd;
begin
  Configuracao := FConfigRepo.GetByKey(RTC_SINCRONIZACAO_LOCK_KEY, RTC_EMPRESA_ID);
  try
    if Assigned(Configuracao) then
      Result := Configuracao.ValorString.ToText('')
    else
      Result := '';
  finally
    Configuracao.Free;
  end;
end;

function TTestSincronizacaoCalculadoraLockService.ObterExpiracaoArmazenada(): DateTimeNullable;
var
  Configuracao: ConfiguracaoEtd;
begin
  Configuracao := FConfigRepo.GetByKey(RTC_SINCRONIZACAO_LOCK_KEY, RTC_EMPRESA_ID);
  try
    if Assigned(Configuracao) then
      Result := Configuracao.ValorDateTime
    else
      Result := DateTimeNullable.NullInstance();
  finally
    Configuracao.Free;
  end;
end;

procedure TTestSincronizacaoCalculadoraLockService.DeveAdquirirLeaseQuandoLivre;
var
  Lease: SincronizacaoCalculadoraLease;
  Expiracao: DateTimeNullable;
begin
  Assert.IsTrue(FLock.TryAcquire(Lease), 'Lease livre deve ser adquirido.');

  Assert.IsFalse(Lease.IsNull, 'Lease adquirido nao pode ser nulo.');
  Assert.AreEqual(36, Length(Lease.Owner), 'Owner deve ser um GUID de 36 caracteres.');
  Assert.IsTrue(Lease.ExpiresAt > Now, 'Expiracao deve estar no futuro.');

  Assert.AreEqual(Lease.Owner, ObterTokenArmazenado(), 'Token armazenado deve ser o proprio.');

  Expiracao := ObterExpiracaoArmazenada();
  Assert.IsTrue(Expiracao.HasValue, 'Expiracao deve ser gravada.');
  Assert.IsTrue(
    Expiracao.Value > IncMinute(Now, RTC_SYNC_LEASE_MINUTES - 1),
    'Expiracao deve respeitar o TTL de 30 minutos.'
  );
end;

procedure TTestSincronizacaoCalculadoraLockService.DeveFalharQuandoLeaseOcupado;
var
  Lease: SincronizacaoCalculadoraLease;
begin
  SemearLock(TOKEN_TERCEIRO, IncMinute(Now, 10));

  Assert.IsFalse(FLock.TryAcquire(Lease), 'Lease valido de terceiro deve bloquear.');
  Assert.IsTrue(Lease.IsNull, 'Falha de aquisicao nao retorna lease.');
  Assert.AreEqual(
    TOKEN_TERCEIRO,
    ObterTokenArmazenado(),
    'Nao deve sobrescrever o token de terceiro.'
  );
end;

procedure TTestSincronizacaoCalculadoraLockService.DeveAdquirirQuandoLeaseExpirado;
var
  Lease: SincronizacaoCalculadoraLease;
begin
  SemearLock(TOKEN_ANTIGO, IncMinute(Now, -1));

  Assert.IsTrue(FLock.TryAcquire(Lease), 'Lease expirado deve ser tomado.');
  Assert.IsFalse(Lease.IsNull);
  Assert.IsTrue(Lease.Owner <> TOKEN_ANTIGO, 'Token deve ser renovado na tomada.');
  Assert.AreEqual(Lease.Owner, ObterTokenArmazenado(), 'Token armazenado deve ser o proprio.');
  Assert.IsTrue(ObterExpiracaoArmazenada().Value > Now, 'Expiracao deve ser renovada.');
end;

procedure TTestSincronizacaoCalculadoraLockService.DeveConfirmarTokenProprioAposTomada;
var
  Lease: SincronizacaoCalculadoraLease;
begin
  SemearLock(TOKEN_ANTIGO, IncMinute(Now, -1));

  Assert.IsTrue(FLock.TryAcquire(Lease), 'Tomada de lease expirado deve confirmar o token.');

  // A confirmacao (re-leitura) so retorna True quando o token armazenado e o proprio.
  Assert.AreEqual(
    Lease.Owner,
    ObterTokenArmazenado(),
    'Apos a tomada, a re-leitura deve confirmar o token da instancia.'
  );
end;

procedure TTestSincronizacaoCalculadoraLockService.DeveFalharQuandoPostColide;
var
  Lease: SincronizacaoCalculadoraLease;
begin
  SemearLock(TOKEN_TERCEIRO, IncMinute(Now, 10));
  // A leitura enxerga a chave ausente, mas o Post encontra a chave criada por outra instancia.
  FConfigRepo.SimularLeituraAusente := True;

  Assert.IsFalse(FLock.TryAcquire(Lease), 'Colisao de Post deve ser tratada como ocupado.');
  Assert.IsTrue(Lease.IsNull, 'Colisao nao retorna lease.');
  Assert.AreEqual(
    TOKEN_TERCEIRO,
    ObterTokenArmazenado(),
    'A instancia perdedora nao deve sobrescrever o lock.'
  );
  Assert.IsTrue(ObterExpiracaoArmazenada().Value > Now, 'Lock vencedor deve permanecer valido.');
end;

procedure TTestSincronizacaoCalculadoraLockService.DeveFalharQuandoConfirmacaoDoTokenDiverge;
var
  Lease: SincronizacaoCalculadoraLease;
begin
  SemearLock(TOKEN_ANTIGO, IncMinute(Now, -1));
  // A re-leitura de confirmacao devolve um token de terceiro.
  FConfigRepo.ForcarDivergenciaNaConfirmacao := True;

  Assert.IsFalse(
    FLock.TryAcquire(Lease),
    'Re-leitura divergente nao confirma o lease.'
  );
  Assert.IsTrue(Lease.IsNull, 'Confirmacao divergente nao retorna lease.');
end;

procedure TTestSincronizacaoCalculadoraLockService.DeveLiberarQuandoTokenProprio;
var
  Lease: SincronizacaoCalculadoraLease;
  Expiracao: DateTimeNullable;
begin
  Assert.IsTrue(FLock.TryAcquire(Lease));
  FLock.Release;

  Assert.AreEqual(
    Lease.Owner,
    ObterTokenArmazenado(),
    'Release preserva o token da instancia e apenas atualiza a data.'
  );

  Expiracao := ObterExpiracaoArmazenada();
  Assert.IsTrue(Expiracao.HasValue, 'Release deve gravar data valida.');
  Assert.IsTrue(Expiracao.Value <= Now, 'Release deve gravar a data atual (lease livre).');

  // Uma nova aquisicao comprova que o lease foi efetivamente liberado.
  Assert.IsTrue(FLock.TryAcquire(Lease), 'Apos o release o lease deve estar livre.');
end;

procedure TTestSincronizacaoCalculadoraLockService.DeveGravarDataValidaAoLiberar;
var
  Lease: SincronizacaoCalculadoraLease;
  Expiracao: DateTimeNullable;
begin
  Assert.IsTrue(FLock.TryAcquire(Lease));
  FLock.Release;

  Expiracao := ObterExpiracaoArmazenada();
  Assert.IsTrue(Expiracao.HasValue, 'Release nunca deve gravar data nula.');
  Assert.IsFalse(Expiracao.IsNull, 'Release nunca deve gravar data nula.');
  Assert.IsTrue(Expiracao.Value <= Now, 'Data liberada nao pode estar no futuro.');
end;

procedure TTestSincronizacaoCalculadoraLockService.DeveNaoLiberarQuandoTokenPertenceATerceiro;
var
  Lease: SincronizacaoCalculadoraLease;
begin
  Assert.IsTrue(FLock.TryAcquire(Lease));

  // Outra instancia assume o lock.
  SemearLock(TOKEN_TERCEIRO, IncMinute(Now, 10));

  FLock.Release;

  Assert.AreEqual(
    TOKEN_TERCEIRO,
    ObterTokenArmazenado(),
    'Release de terceiro nao deve sobrescrever o lock alheio.'
  );
  Assert.IsTrue(
    ObterExpiracaoArmazenada().Value > Now,
    'Lock do terceiro deve permanecer valido.'
  );
end;

procedure TTestSincronizacaoCalculadoraLockService.DeveUsarLeituraFrescaSemCache;
var
  Lease: SincronizacaoCalculadoraLease;
begin
  Assert.IsTrue(FLock.TryAcquire(Lease), 'Primeira aquisicao deve ter sucesso.');

  // Outra instancia sobrepoe o lock diretamente no repositorio.
  SemearLock(TOKEN_TERCEIRO, IncMinute(Now, 10));

  // O servico deve reler o estado atual (sem cache do proprio token) e bloquear.
  Assert.IsFalse(
    FLock.TryAcquire(Lease),
    'Deve reler o estado fresco da configuracao e detectar ocupacao.'
  );
  Assert.IsTrue(Lease.IsNull);
  Assert.AreEqual(TOKEN_TERCEIRO, ObterTokenArmazenado());
end;

initialization
  TDUnitX.RegisterTestFixture(TTestSincronizacaoCalculadoraLockService);

end.
