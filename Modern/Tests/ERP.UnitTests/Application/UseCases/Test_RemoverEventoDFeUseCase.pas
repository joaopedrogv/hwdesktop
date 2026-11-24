unit Test_RemoverEventoDFeUseCase;

interface

uses
  DUnitX.TestFramework,
  ISessionContextUnit,
  StatusRegistroEnumUnit,
  EventoDFeEtdUnit,
  RemoverEventoDFeUseCaseUnit,
  FakeTransactionUnit,
  FakeDatabaseConnectionUnit,
  StubSessionContextUnit,
  StubEventosDFeRepositoryUnit;

type
  [TestFixture]
  TTestRemoverEventoDFeUseCase = class
  private
    FTransactionState: TTransactionSpyState;
    FConnection: TFakeDatabaseConnection;
    FSession: ISessionContext;
    FEventosRepo: TEventosDFeRepositoryStub;
    FUseCase: RemoverEventoDFeUseCase;
    procedure SemearEvento(AAtivo: StatusRegistroEnum;
      ACodEmpresa: Integer);
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveRemoverLogicamente;

    [Test]
    procedure DeveRejeitarRegistroInexistente;

    [Test]
    procedure DeveRejeitarRegistroJaNaLixeira;

    [Test]
    procedure DeveRejeitarRegistroDeOutraEmpresa;

    [Test]
    procedure DeveDesfazerTransacaoQuandoRemocaoFalhar;

    [Test]
    procedure DeveConfirmarEAliberarTransacao;
  end;

implementation

uses
  SysUtils,
  TipoEventoDFeUnit,
  EValidacaoNegocioUnit;

const
  EMPRESA_ID = 3;
  OUTRA_EMPRESA_ID = 4;
  ID_EVENTO = 'EVENTO-REMOCAO';
  CHAVE_VALIDA = '11111111111111111111111111111111111111111111';

function CriarHeader(const AId: string; AAtivo: StatusRegistroEnum;
  ACodEmpresa: Integer): EventoDFeEtd;
begin
  Result := EventoDFeEtd.Create(
    AId,
    4,
    fdNFe,
    teAtualizacaoPrevisaoEntrega,
    CHAVE_VALIDA,
    ACodEmpresa,
    AAtivo,
    EncodeDate(2026, 5, 1),
    EncodeDate(2026, 5, 2)
  );
end;

{ TTestRemoverEventoDFeUseCase }

procedure TTestRemoverEventoDFeUseCase.Setup;
begin
  FTransactionState := TTransactionSpyState.Create;
  FConnection := TFakeDatabaseConnection.Create(FTransactionState);
  FSession := TSessionContextStub.Create(EMPRESA_ID);
  FEventosRepo := TEventosDFeRepositoryStub.Create;
  FUseCase := RemoverEventoDFeUseCase.Create(
    FConnection, FSession, FEventosRepo);
end;

procedure TTestRemoverEventoDFeUseCase.TearDown;
begin
  FUseCase.Free;
  FEventosRepo.Free;
  FSession := nil;
  FConnection.Free;
  FTransactionState.Free;
end;

procedure TTestRemoverEventoDFeUseCase.SemearEvento(AAtivo: StatusRegistroEnum;
  ACodEmpresa: Integer);
var
  Header: EventoDFeEtd;
begin
  Header := CriarHeader(ID_EVENTO, AAtivo, ACodEmpresa);
  try
    FEventosRepo.AdicionarEventoExistente(Header);
  finally
    Header.Free;
  end;
end;

procedure TTestRemoverEventoDFeUseCase.DeveRemoverLogicamente;
begin
  SemearEvento(saAtivo, EMPRESA_ID);

  FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(FEventosRepo.RemoverChamado);
  Assert.AreEqual(ID_EVENTO, FEventosRepo.UltimoIdRemovido);
  Assert.AreEqual(EMPRESA_ID, FEventosRepo.UltimaEmpresaRemovida);
  Assert.IsTrue(FEventosRepo.EventoArmazenado(ID_EVENTO).Ativo = saLixeira);
end;

procedure TTestRemoverEventoDFeUseCase.DeveRejeitarRegistroInexistente;
begin
  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar('INEXISTENTE');
    end,
    EValidacaoNegocio
  );

  Assert.IsFalse(FEventosRepo.RemoverChamado);
  Assert.IsFalse(FConnection.BeginTransactionCalled);
end;

procedure TTestRemoverEventoDFeUseCase.DeveRejeitarRegistroJaNaLixeira;
begin
  SemearEvento(saLixeira, EMPRESA_ID);

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO);
    end,
    EValidacaoNegocio
  );

  Assert.IsFalse(FEventosRepo.RemoverChamado);
  Assert.IsFalse(FConnection.BeginTransactionCalled);
end;

procedure TTestRemoverEventoDFeUseCase.DeveRejeitarRegistroDeOutraEmpresa;
begin
  SemearEvento(saAtivo, OUTRA_EMPRESA_ID);

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO);
    end,
    EValidacaoNegocio
  );

  Assert.AreEqual(EMPRESA_ID, FEventosRepo.UltimaEmpresaObterPorId);
  Assert.IsFalse(FEventosRepo.RemoverChamado);
  Assert.IsFalse(FConnection.BeginTransactionCalled);
end;

procedure TTestRemoverEventoDFeUseCase.DeveDesfazerTransacaoQuandoRemocaoFalhar;
begin
  SemearEvento(saAtivo, EMPRESA_ID);
  FEventosRepo.FalharNaRemocao := True;

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO);
    end,
    Exception
  );

  Assert.IsTrue(FEventosRepo.RemoverChamado);
  Assert.IsTrue(FEventosRepo.EventoArmazenado(ID_EVENTO).Ativo = saAtivo);
  Assert.IsTrue(FTransactionState.RollbackCalled);
  Assert.IsFalse(FTransactionState.CommitCalled);
  Assert.IsTrue(FTransactionState.FreeTransactionCalled);
end;

procedure TTestRemoverEventoDFeUseCase.DeveConfirmarEAliberarTransacao;
begin
  SemearEvento(saAtivo, EMPRESA_ID);

  FUseCase.Executar(ID_EVENTO);

  Assert.IsTrue(FConnection.BeginTransactionCalled);
  Assert.IsTrue(FTransactionState.CommitCalled);
  Assert.IsFalse(FTransactionState.RollbackCalled);
  Assert.IsTrue(FTransactionState.FreeTransactionCalled);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestRemoverEventoDFeUseCase);

end.
