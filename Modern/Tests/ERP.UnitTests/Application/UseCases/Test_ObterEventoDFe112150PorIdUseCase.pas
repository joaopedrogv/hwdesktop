unit Test_ObterEventoDFe112150PorIdUseCase;

interface

uses
  DUnitX.TestFramework,
  ISessionContextUnit,
  StatusRegistroEnumUnit,
  EventoDFeEtdUnit,
  EventoDFe112150EtdUnit,
  ObterEventoDFe112150PorIdUseCaseUnit,
  StubSessionContextUnit,
  StubEventosDFeRepositoryUnit,
  StubEventoDFe112150RepositoryUnit;

type
  [TestFixture]
  TTestObterEventoDFe112150PorIdUseCase = class
  private
    FSession: ISessionContext;
    FEventosRepo: TEventosDFeRepositoryStub;
    FRepo112150: TEventoDFe112150RepositoryStub;
    FUseCase: ObterEventoDFe112150PorIdUseCase;
    procedure SemearEvento(const AId: string; ASeqId: Integer;
      AAtivo: StatusRegistroEnum; ACodEmpresa: Integer;
      AComDados: Boolean);
    procedure SemearTipoDivergente(const AId: string);
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveRetornarAgregadoAtivoNoModoAlteracao;

    [Test]
    procedure DeveRetornarAgregadoNaLixeiraNoModoRestauracao;

    [Test]
    procedure DeveRetornarNilQuandoRegistroNaoEncontrado;

    [Test]
    procedure DeveRetornarNilParaOutraEmpresa;

    [Test]
    procedure DeveRetornarNilSemDadosEspecificos;

    [Test]
    procedure DeveRejeitarTipoDivergente;

    [Test]
    procedure DeveRejeitarLixeiraNoModoAlteracao;

    [Test]
    procedure DeveRejeitarAtivoNoModoRestauracao;
  end;

implementation

uses
  SysUtils,
  TipoEventoDFeUnit,
  EValidacaoNegocioUnit;

const
  EMPRESA_ID = 3;
  OUTRA_EMPRESA_ID = 4;
  ID_EVENTO = 'EVENTO-LIDO';
  CHAVE_VALIDA = '11111111111111111111111111111111111111111111';

function CriarHeader(const AId: string; ASeqId: Integer;
  AAtivo: StatusRegistroEnum; ACodEmpresa: Integer): EventoDFeEtd;
begin
  Result := EventoDFeEtd.Create(
    AId,
    ASeqId,
    fdNFe,
    teAtualizacaoPrevisaoEntrega,
    CHAVE_VALIDA,
    ACodEmpresa,
    AAtivo,
    EncodeDate(2026, 2, 1),
    EncodeDate(2026, 2, 2)
  );
end;

{ TTestObterEventoDFe112150PorIdUseCase }

procedure TTestObterEventoDFe112150PorIdUseCase.Setup;
begin
  FSession := TSessionContextStub.Create(EMPRESA_ID);
  FEventosRepo := TEventosDFeRepositoryStub.Create;
  FRepo112150 := TEventoDFe112150RepositoryStub.Create;
  FUseCase := ObterEventoDFe112150PorIdUseCase.Create(
    FSession, FEventosRepo, FRepo112150);
end;

procedure TTestObterEventoDFe112150PorIdUseCase.TearDown;
begin
  FUseCase.Free;
  FRepo112150.Free;
  FEventosRepo.Free;
  FSession := nil;
end;

procedure TTestObterEventoDFe112150PorIdUseCase.SemearEvento(const AId: string;
  ASeqId: Integer; AAtivo: StatusRegistroEnum; ACodEmpresa: Integer;
  AComDados: Boolean);
var
  Header: EventoDFeEtd;
begin
  Header := CriarHeader(AId, ASeqId, AAtivo, ACodEmpresa);
  try
    FEventosRepo.AdicionarEventoExistente(Header);
  finally
    Header.Free;
  end;

  if AComDados then
    FRepo112150.AdicionarDataPrevisao(AId, EncodeDate(2026, 1, 10));
end;

procedure TTestObterEventoDFe112150PorIdUseCase.SemearTipoDivergente(
  const AId: string);
var
  Header: EventoDFeEtd;
begin
  Header := EventoDFeEtd.Create(
    AId,
    5,
    fdNFe,
    teImobilizacaoItem,
    CHAVE_VALIDA,
    EMPRESA_ID,
    saAtivo,
    0,
    0
  );
  try
    FEventosRepo.AdicionarEventoExistente(Header);
  finally
    Header.Free;
  end;
end;

procedure TTestObterEventoDFe112150PorIdUseCase.DeveRetornarAgregadoAtivoNoModoAlteracao;
var
  Evento: EventoDFe112150Etd;
begin
  SemearEvento(ID_EVENTO, 4, saAtivo, EMPRESA_ID, True);

  Evento := FUseCase.Executar(ID_EVENTO, meAlteracao);
  try
    Assert.IsNotNull(Evento);
    Assert.AreEqual(ID_EVENTO, Evento.Id);
    Assert.AreEqual(4, Evento.SeqId);
    Assert.AreEqual(CHAVE_VALIDA, Evento.ChaveDocumento);
    Assert.AreEqual(EMPRESA_ID, Evento.CodEmpresa);
    Assert.IsTrue(Evento.DataPrevisaoEntrega = EncodeDate(2026, 1, 10));
    Assert.IsFalse(Evento.Restaurar);
    Assert.AreEqual(EMPRESA_ID, FEventosRepo.UltimaEmpresaObterPorId);
  finally
    Evento.Free;
  end;
end;

procedure TTestObterEventoDFe112150PorIdUseCase.DeveRetornarAgregadoNaLixeiraNoModoRestauracao;
var
  Evento: EventoDFe112150Etd;
begin
  SemearEvento(ID_EVENTO, 4, saLixeira, EMPRESA_ID, True);

  Evento := FUseCase.Executar(ID_EVENTO, meRestauracao);
  try
    Assert.IsNotNull(Evento);
    Assert.IsTrue(Evento.Restaurar);
    Assert.IsTrue(Evento.Ativo = saLixeira);
  finally
    Evento.Free;
  end;
end;

procedure TTestObterEventoDFe112150PorIdUseCase.DeveRetornarNilQuandoRegistroNaoEncontrado;
begin
  Assert.IsNull(FUseCase.Executar('INEXISTENTE', meAlteracao));
end;

procedure TTestObterEventoDFe112150PorIdUseCase.DeveRetornarNilParaOutraEmpresa;
begin
  SemearEvento(ID_EVENTO, 4, saAtivo, OUTRA_EMPRESA_ID, True);

  Assert.IsNull(FUseCase.Executar(ID_EVENTO, meAlteracao));
  Assert.AreEqual(EMPRESA_ID, FEventosRepo.UltimaEmpresaObterPorId);
end;

procedure TTestObterEventoDFe112150PorIdUseCase.DeveRetornarNilSemDadosEspecificos;
begin
  SemearEvento(ID_EVENTO, 4, saAtivo, EMPRESA_ID, False);

  Assert.IsNull(FUseCase.Executar(ID_EVENTO, meAlteracao));
end;

procedure TTestObterEventoDFe112150PorIdUseCase.DeveRejeitarTipoDivergente;
begin
  SemearTipoDivergente(ID_EVENTO);

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO, meAlteracao).Free;
    end,
    EValidacaoNegocio
  );
end;

procedure TTestObterEventoDFe112150PorIdUseCase.DeveRejeitarLixeiraNoModoAlteracao;
begin
  SemearEvento(ID_EVENTO, 4, saLixeira, EMPRESA_ID, True);

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO, meAlteracao).Free;
    end,
    EValidacaoNegocio
  );
end;

procedure TTestObterEventoDFe112150PorIdUseCase.DeveRejeitarAtivoNoModoRestauracao;
begin
  SemearEvento(ID_EVENTO, 4, saAtivo, EMPRESA_ID, True);

  Assert.WillRaise(
    procedure
    begin
      FUseCase.Executar(ID_EVENTO, meRestauracao).Free;
    end,
    EValidacaoNegocio
  );
end;

initialization
  TDUnitX.RegisterTestFixture(TTestObterEventoDFe112150PorIdUseCase);

end.
