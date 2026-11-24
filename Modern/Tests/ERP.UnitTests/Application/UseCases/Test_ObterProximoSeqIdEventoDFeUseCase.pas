unit Test_ObterProximoSeqIdEventoDFeUseCase;

interface

uses
  DUnitX.TestFramework,
  ISessionContextUnit,
  ObterProximoSeqIdEventoDFeUseCaseUnit,
  StubSessionContextUnit,
  StubEventosDFeRepositoryUnit;

type
  [TestFixture]
  TTestObterProximoSeqIdEventoDFeUseCase = class
  private
    FSession: ISessionContext;
    FEventosRepo: TEventosDFeRepositoryStub;
    FUseCase: IObterProximoSeqIdEventoDFeUseCase;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveRetornarProximoSeqIdDoRepositorioComEmpresaDaSessao;

    [Test]
    procedure DeveRetornarUmQuandoEmpresaNaoPossuiEventos;

    [Test]
    procedure DeveConsultarSemGravarNemAbrirTransacao;
  end;

implementation

const
  EMPRESA_ID = 3;

{ TTestObterProximoSeqIdEventoDFeUseCase }

procedure TTestObterProximoSeqIdEventoDFeUseCase.Setup;
begin
  FSession := TSessionContextStub.Create(EMPRESA_ID);
  FEventosRepo := TEventosDFeRepositoryStub.Create;
  FUseCase := ObterProximoSeqIdEventoDFeUseCase.Create(
    FSession, FEventosRepo);
end;

procedure TTestObterProximoSeqIdEventoDFeUseCase.TearDown;
begin
  FUseCase := nil;
  FEventosRepo.Free;
  FSession := nil;
end;

procedure TTestObterProximoSeqIdEventoDFeUseCase.DeveRetornarProximoSeqIdDoRepositorioComEmpresaDaSessao;
begin
  FEventosRepo.ProximoSeqId := 42;

  Assert.AreEqual(42, FUseCase.Executar);
  Assert.IsTrue(FEventosRepo.ObterProximoSeqIdChamado);
  Assert.AreEqual(EMPRESA_ID, FEventosRepo.UltimaEmpresaProximoSeqId);
end;

procedure TTestObterProximoSeqIdEventoDFeUseCase.DeveRetornarUmQuandoEmpresaNaoPossuiEventos;
begin
  // Sem eventos, o repositorio devolve MAX(SEQID) + 1 = 1.
  FEventosRepo.ProximoSeqId := 1;

  Assert.AreEqual(1, FUseCase.Executar);
end;

procedure TTestObterProximoSeqIdEventoDFeUseCase.DeveConsultarSemGravarNemAbrirTransacao;
begin
  FUseCase.Executar;

  Assert.IsFalse(FEventosRepo.InserirChamado);
  Assert.IsFalse(FEventosRepo.AtualizarChamado);
  Assert.IsFalse(FEventosRepo.RemoverChamado);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestObterProximoSeqIdEventoDFeUseCase);

end.
