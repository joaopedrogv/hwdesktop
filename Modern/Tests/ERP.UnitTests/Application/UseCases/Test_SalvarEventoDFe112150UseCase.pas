unit Test_SalvarEventoDFe112150UseCase;

interface

uses
  DUnitX.TestFramework,
  ISessionContextUnit,
  StatusRegistroEnumUnit,
  EventoDFeStatusUnit,
  CreateEntityUseCaseOutputUnit,
  EventoDFeEtdUnit,
  EventoDFe112150EtdUnit,
  SalvarEventoDFe112150UseCaseUnit,
  FakeTransactionUnit,
  FakeDatabaseConnectionUnit,
  StubSessionContextUnit,
  StubEventosDFeRepositoryUnit,
  StubEventoDFe112150RepositoryUnit;

type
  [TestFixture]
  TTestSalvarEventoDFe112150UseCase = class
  private
    FTransactionState: TTransactionSpyState;
    FConnection: TFakeDatabaseConnection;
    FSession: ISessionContext;
    FEventosRepo: TEventosDFeRepositoryStub;
    FRepo112150: TEventoDFe112150RepositoryStub;
    FUseCase: SalvarEventoDFe112150UseCase;
    procedure SemearEvento(const AId: string; ASeqId: Integer;
      AAtivo: StatusRegistroEnum; ACodEmpresa: Integer);
    procedure SemearEventoComEstado(const AId: string; ASeqId: Integer;
      AAtivo: StatusRegistroEnum; ACodEmpresa: Integer;
      AStatus: TStatusEventoDFe; ANseqEvento: Integer;
      const AChave: string = '');
    function RejeitarAoExecutar(AEvento: EventoDFe112150Etd): string;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    procedure DeveInserirComSeqIdDoRascunhoSemRecalcular;

    [Test]
    procedure DeveRejeitarInclusaoSemSeqId;

    [Test]
    procedure DeveAceitarQuarentaEQuatroDigitosSemValidarDigitoVerificador;

    [Test]
    procedure DeveRejeitarChaveComMenosDeQuarentaEQuatroDigitos;

    [Test]
    procedure DeveRejeitarChaveComCaracteresNaoNumericos;

    [Test]
    procedure DeveAceitarDataDeHoje;

    [Test]
    procedure DeveRejeitarDataPassadaSemTransacao;

    [Test]
    procedure DeveAplicarEmpresaDaSessao;

    [Test]
    procedure DeveRestaurarRegistroNaLixeira;

    [Test]
    procedure DeveRejeitarRegistroInexistente;

    [Test]
    procedure DeveRejeitarRegistroDeOutraEmpresa;

    [Test]
    procedure DeveConverterColisaoDeSeqIdEmValidacao;

    [Test]
    procedure DeveDesfazerTransacaoQuandoInsercaoDoCabecalhoFalhar;

    [Test]
    procedure DeveDesfazerTransacaoQuandoInsercaoEspecificaFalhar;

    [Test]
    procedure DeveDesfazerTransacaoQuandoAtualizacaoFalhar;

    [Test]
    procedure DeveRejeitarSegundoEventoNaoAutorizadoParaAMesmaChaveETipo;

    [Test]
    procedure DeveIgnorarOProprioRegistroNaChecagemDeDuplicidade;

    [Test]
    procedure DeveRejeitarRestauracaoQueColideComRegistroAberto;

    [Test]
    procedure NaoDeveEditarEventoAutorizado;

    [Test]
    procedure NaoDeveEditarEventoEnviando;

    [Test]
    procedure NaoDeveAlterarChaveAposNseqAlocado;

    [Test]
    procedure DevePermitirCorrigirChaveAntesDaAlocacao;

    [Test]
    procedure DevePermitirEventoQuandoOAnteriorEstaAutorizado;

    [Test]
    procedure DevePermitirTiposDiferentesParaAMesmaChave;

    [Test]
    procedure DevePermitirEventosDeEmpresasDiferentes;

    [Test]
    procedure DeveConfirmarEAliberarTransacaoAoAlterar;
  end;

implementation

uses
  SysUtils,
  TipoEventoDFeUnit,
  EValidacaoNegocioUnit,
  ValidationEntityOutputUnit;

const
  EMPRESA_ID = 3;
  OUTRA_EMPRESA_ID = 4;
  ID_EVENTO = 'EVENTO-EXISTENTE';
  CHAVE_VALIDA = '11111111111111111111111111111111111111111111';
  CHAVE_OUTRA = '22222222222222222222222222222222222222222222';

function CriarRascunho(ASeqId: Integer; ADataPrevisao: TDate;
  const AChave: string): EventoDFe112150Etd;
begin
  Result := EventoDFe112150Etd.Create;
  Result.ChaveDocumento := AChave;
  Result.DataPrevisaoEntrega := ADataPrevisao;

  if ASeqId > 0 then
    Result.DefinirSeqIdInclusao(ASeqId);
end;

function CriarHeader(const AId: string; ASeqId: Integer;
  AAtivo: StatusRegistroEnum; ACodEmpresa: Integer;
  const AChave: string = CHAVE_VALIDA;
  ATipoEvento: TipoEventoDFe = teAtualizacaoPrevisaoEntrega): EventoDFeEtd;
begin
  Result := EventoDFeEtd.Create(
    AId,
    ASeqId,
    fdNFe,
    ATipoEvento,
    AChave,
    ACodEmpresa,
    AAtivo,
    EncodeDate(2026, 1, 1),
    EncodeDate(2026, 1, 2)
  );
end;

function PossuiErro(const ASaida: CreateEntityUseCaseOutPut;
  const ACampo: string): Boolean;
var
  I: Integer;
begin
  Result := False;

  for I := 0 to High(ASaida.Validation.Validations) do
    if ASaida.Validation.Validations[I].FieldName = ACampo then
      Exit(True);
end;

{ TTestSalvarEventoDFe112150UseCase }

procedure TTestSalvarEventoDFe112150UseCase.Setup;
begin
  FTransactionState := TTransactionSpyState.Create;
  FConnection := TFakeDatabaseConnection.Create(FTransactionState);
  FSession := TSessionContextStub.Create(EMPRESA_ID);
  FEventosRepo := TEventosDFeRepositoryStub.Create;
  FRepo112150 := TEventoDFe112150RepositoryStub.Create;
  FUseCase := SalvarEventoDFe112150UseCase.Create(
    FConnection, FSession, FEventosRepo, FRepo112150);
end;

procedure TTestSalvarEventoDFe112150UseCase.TearDown;
begin
  FUseCase.Free;
  FRepo112150.Free;
  FEventosRepo.Free;
  FSession := nil;
  FConnection.Free;
  FTransactionState.Free;
end;

procedure TTestSalvarEventoDFe112150UseCase.SemearEvento(const AId: string;
  ASeqId: Integer; AAtivo: StatusRegistroEnum; ACodEmpresa: Integer);
var
  Header: EventoDFeEtd;
begin
  Header := CriarHeader(AId, ASeqId, AAtivo, ACodEmpresa);
  try
    FEventosRepo.AdicionarEventoExistente(Header);
  finally
    Header.Free;
  end;

  FRepo112150.AdicionarDataPrevisao(AId, EncodeDate(2026, 1, 10));
end;

procedure TTestSalvarEventoDFe112150UseCase.SemearEventoComEstado(const AId: string;
  ASeqId: Integer; AAtivo: StatusRegistroEnum; ACodEmpresa: Integer;
  AStatus: TStatusEventoDFe; ANseqEvento: Integer; const AChave: string);
var
  Header: EventoDFeEtd;
  ChaveDoEvento: string;
begin
  if AChave = '' then
    ChaveDoEvento := CHAVE_VALIDA
  else
    ChaveDoEvento := AChave;

  Header := CriarHeader(AId, ASeqId, AAtivo, ACodEmpresa, ChaveDoEvento);
  try
    FEventosRepo.AdicionarEventoExistente(Header, AStatus, ANseqEvento);
  finally
    Header.Free;
  end;

  FRepo112150.AdicionarDataPrevisao(AId, EncodeDate(2026, 1, 10));
end;

function TTestSalvarEventoDFe112150UseCase.RejeitarAoExecutar(
  AEvento: EventoDFe112150Etd): string;
begin
  Result := '';
  try
    FUseCase.Executar(AEvento);
  except
    on E: EValidacaoNegocio do
      Result := E.Message;
  end;
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveInserirComSeqIdDoRascunhoSemRecalcular;
var
  Rascunho: EventoDFe112150Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  FEventosRepo.ProximoSeqId := 99;

  Rascunho := CriarRascunho(7, Date, CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNotNull(Saida.OutputObj);
      Assert.AreEqual(7, FEventosRepo.UltimoSeqIdInserido);
      Assert.IsFalse(FEventosRepo.ObterProximoSeqIdChamado);
      Assert.AreEqual(7, EventoDFe112150Etd(Saida.OutputObj).SeqId);
      Assert.IsTrue(FRepo112150.InserirChamado);
      Assert.IsTrue(Trunc(Date) = Trunc(FRepo112150.UltimaDataInserida));
      Assert.IsTrue(FTransactionState.CommitCalled);
      Assert.IsFalse(FTransactionState.RollbackCalled);
      Assert.IsTrue(FTransactionState.FreeTransactionCalled);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveRejeitarInclusaoSemSeqId;
var
  Rascunho: EventoDFe112150Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Rascunho := CriarRascunho(0, Date, CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNull(Saida.OutputObj);
      Assert.IsTrue(PossuiErro(Saida, 'SeqId'));
      Assert.IsFalse(FEventosRepo.InserirChamado);
      Assert.IsFalse(FConnection.BeginTransactionCalled);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveAceitarQuarentaEQuatroDigitosSemValidarDigitoVerificador;
var
  Rascunho: EventoDFe112150Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  // Chave numerica com DV invalido: o cadastro nao valida o DV.
  Rascunho := CriarRascunho(1, Date, CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNotNull(Saida.OutputObj);
      Assert.AreEqual(CHAVE_VALIDA, EventoDFe112150Etd(Saida.OutputObj).ChaveDocumento);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveRejeitarChaveComMenosDeQuarentaEQuatroDigitos;
var
  Rascunho: EventoDFe112150Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Rascunho := CriarRascunho(1, Date, Copy(CHAVE_VALIDA, 1, 43));
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNull(Saida.OutputObj);
      Assert.IsTrue(PossuiErro(Saida, 'ChaveDocumento'));
      Assert.IsFalse(FConnection.BeginTransactionCalled);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveRejeitarChaveComCaracteresNaoNumericos;
var
  Rascunho: EventoDFe112150Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Rascunho := CriarRascunho(1, Date, StringOfChar('A', 44));
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNull(Saida.OutputObj);
      Assert.IsTrue(PossuiErro(Saida, 'ChaveDocumento'));
      Assert.IsFalse(FConnection.BeginTransactionCalled);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveAceitarDataDeHoje;
var
  Rascunho: EventoDFe112150Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Rascunho := CriarRascunho(1, Date, CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNotNull(Saida.OutputObj);
      Assert.IsTrue(EventoDFe112150Etd(Saida.OutputObj).DataPrevisaoEntrega = Date);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveRejeitarDataPassadaSemTransacao;
var
  Rascunho: EventoDFe112150Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Rascunho := CriarRascunho(1, Date - 1, CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNull(Saida.OutputObj);
      Assert.IsTrue(PossuiErro(Saida, 'DataPrevisaoEntrega'));
      Assert.IsFalse(FConnection.BeginTransactionCalled);
      Assert.IsFalse(FEventosRepo.InserirChamado);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveAplicarEmpresaDaSessao;
var
  Rascunho: EventoDFe112150Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Rascunho := CriarRascunho(1, Date, CHAVE_VALIDA);
  Rascunho.CodEmpresa := 999;
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNotNull(Saida.OutputObj);
      Assert.AreEqual(EMPRESA_ID, EventoDFe112150Etd(Saida.OutputObj).CodEmpresa);
      Assert.AreEqual(EMPRESA_ID,
        FEventosRepo.EventoArmazenado(EventoDFe112150Etd(Saida.OutputObj).Id).CodEmpresa);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveRestaurarRegistroNaLixeira;
var
  Evento: EventoDFe112150Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  SemearEvento(ID_EVENTO, 4, saLixeira, EMPRESA_ID);

  Evento := EventoDFe112150Etd.Create(
    ID_EVENTO, 4, CHAVE_VALIDA, EMPRESA_ID, saLixeira, Date, 0, 0);
  try
    Saida := FUseCase.Executar(Evento);
    try
      Assert.IsNotNull(Saida.OutputObj);
      Assert.IsTrue(EventoDFe112150Etd(Saida.OutputObj).Ativo = saAtivo);
      Assert.IsTrue(FEventosRepo.AtualizarChamado);
      Assert.IsTrue(FEventosRepo.EventoArmazenado(ID_EVENTO).Ativo = saAtivo);
      Assert.IsTrue(FTransactionState.CommitCalled);
    finally
      Saida.Free;
    end;
  finally
    Evento.Free;
  end;
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveRejeitarRegistroInexistente;
var
  Evento: EventoDFe112150Etd;
begin
  Evento := EventoDFe112150Etd.Create(
    'INEXISTENTE', 4, CHAVE_VALIDA, EMPRESA_ID, saAtivo, Date, 0, 0);
  try
    Assert.WillRaise(
      procedure
      begin
        FUseCase.Executar(Evento);
      end,
      EValidacaoNegocio
    );
  finally
    Evento.Free;
  end;

  Assert.IsFalse(FConnection.BeginTransactionCalled);
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveRejeitarRegistroDeOutraEmpresa;
var
  Evento: EventoDFe112150Etd;
begin
  SemearEvento(ID_EVENTO, 4, saAtivo, OUTRA_EMPRESA_ID);

  Evento := EventoDFe112150Etd.Create(
    ID_EVENTO, 4, CHAVE_VALIDA, OUTRA_EMPRESA_ID, saAtivo, Date, 0, 0);
  try
    Assert.WillRaise(
      procedure
      begin
        FUseCase.Executar(Evento);
      end,
      EValidacaoNegocio
    );
  finally
    Evento.Free;
  end;

  Assert.AreEqual(EMPRESA_ID, FEventosRepo.UltimaEmpresaObterPorId);
  Assert.IsFalse(FConnection.BeginTransactionCalled);
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveConverterColisaoDeSeqIdEmValidacao;
var
  Rascunho: EventoDFe112150Etd;
begin
  FEventosRepo.ColidirSeqId := 7;

  Rascunho := CriarRascunho(7, Date, CHAVE_VALIDA);
  try
    Assert.WillRaise(
      procedure
      begin
        FUseCase.Executar(Rascunho);
      end,
      EValidacaoNegocio
    );
  finally
    Rascunho.Free;
  end;

  Assert.IsTrue(FEventosRepo.InserirChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
  Assert.IsFalse(FTransactionState.CommitCalled);
  Assert.IsTrue(FTransactionState.FreeTransactionCalled);
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveDesfazerTransacaoQuandoInsercaoDoCabecalhoFalhar;
var
  Rascunho: EventoDFe112150Etd;
begin
  FEventosRepo.FalharNoInserir := True;

  Rascunho := CriarRascunho(1, Date, CHAVE_VALIDA);
  try
    Assert.WillRaise(
      procedure
      begin
        FUseCase.Executar(Rascunho);
      end,
      Exception
    );
  finally
    Rascunho.Free;
  end;

  Assert.IsFalse(FRepo112150.InserirChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
  Assert.IsTrue(FTransactionState.FreeTransactionCalled);
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveDesfazerTransacaoQuandoInsercaoEspecificaFalhar;
var
  Rascunho: EventoDFe112150Etd;
begin
  FRepo112150.FalharNoInserir := True;

  Rascunho := CriarRascunho(1, Date, CHAVE_VALIDA);
  try
    Assert.WillRaise(
      procedure
      begin
        FUseCase.Executar(Rascunho);
      end,
      Exception
    );
  finally
    Rascunho.Free;
  end;

  Assert.IsTrue(FEventosRepo.InserirChamado);
  Assert.IsTrue(FRepo112150.InserirChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
  Assert.IsTrue(FTransactionState.FreeTransactionCalled);
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveDesfazerTransacaoQuandoAtualizacaoFalhar;
var
  Evento: EventoDFe112150Etd;
begin
  SemearEvento(ID_EVENTO, 4, saAtivo, EMPRESA_ID);
  FEventosRepo.FalharNoAtualizar := True;

  Evento := EventoDFe112150Etd.Create(
    ID_EVENTO, 4, CHAVE_VALIDA, EMPRESA_ID, saAtivo, Date, 0, 0);
  try
    Assert.WillRaise(
      procedure
      begin
        FUseCase.Executar(Evento);
      end,
      Exception
    );
  finally
    Evento.Free;
  end;

  Assert.IsTrue(FEventosRepo.AtualizarChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
  Assert.IsTrue(FTransactionState.FreeTransactionCalled);
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveRejeitarSegundoEventoNaoAutorizadoParaAMesmaChaveETipo;
var
  Rascunho: EventoDFe112150Etd;
  Mensagem: string;
begin
  SemearEventoComEstado('EVENTO-EXISTENTE', 4711, saAtivo, EMPRESA_ID,
    sePendente, 0);

  Rascunho := CriarRascunho(4712, Date, CHAVE_VALIDA);
  try
    Mensagem := RejeitarAoExecutar(Rascunho);
  finally
    Rascunho.Free;
  end;

  Assert.IsTrue(Pos('4711', Mensagem) > 0,
    'A mensagem deve citar o SEQID do evento existente.');
  Assert.IsFalse(FEventosRepo.InserirChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveIgnorarOProprioRegistroNaChecagemDeDuplicidade;
var
  Evento: EventoDFe112150Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  SemearEventoComEstado(ID_EVENTO, 4, saAtivo, EMPRESA_ID, sePendente, 0);

  Evento := EventoDFe112150Etd.Create(
    ID_EVENTO, 4, CHAVE_VALIDA, EMPRESA_ID, saAtivo, Date + 1, 0, 0);
  try
    Saida := FUseCase.Executar(Evento);
    try
      Assert.IsNotNull(Saida.OutputObj);
      Assert.IsTrue(FEventosRepo.AtualizarChamado);
      Assert.IsTrue(FTransactionState.CommitCalled);
      Assert.IsFalse(FTransactionState.RollbackCalled);
    finally
      Saida.Free;
    end;
  finally
    Evento.Free;
  end;
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveRejeitarRestauracaoQueColideComRegistroAberto;
var
  Evento: EventoDFe112150Etd;
  Mensagem: string;
begin
  SemearEventoComEstado(ID_EVENTO, 5, saLixeira, EMPRESA_ID, sePendente, 0);
  SemearEventoComEstado('EVENTO-ABERTO', 4713, saAtivo, EMPRESA_ID,
    sePendente, 0);

  Evento := EventoDFe112150Etd.Create(
    ID_EVENTO, 5, CHAVE_VALIDA, EMPRESA_ID, saLixeira, Date, 0, 0);
  try
    Mensagem := RejeitarAoExecutar(Evento);
  finally
    Evento.Free;
  end;

  Assert.IsTrue(Pos('4713', Mensagem) > 0,
    'A restauracao deve citar o SEQID do registro aberto.');
  Assert.IsFalse(FEventosRepo.AtualizarChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
end;

procedure TTestSalvarEventoDFe112150UseCase.NaoDeveEditarEventoAutorizado;
var
  Evento: EventoDFe112150Etd;
  Mensagem: string;
begin
  SemearEventoComEstado(ID_EVENTO, 4, saAtivo, EMPRESA_ID, seAutorizado, 1);

  Evento := EventoDFe112150Etd.Create(
    ID_EVENTO, 4, CHAVE_VALIDA, EMPRESA_ID, saAtivo, Date + 1, 0, 0);
  try
    Mensagem := RejeitarAoExecutar(Evento);
  finally
    Evento.Free;
  end;

  Assert.IsTrue(Mensagem <> '');
  Assert.IsFalse(FEventosRepo.AtualizarChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
end;

procedure TTestSalvarEventoDFe112150UseCase.NaoDeveEditarEventoEnviando;
var
  Evento: EventoDFe112150Etd;
  Mensagem: string;
begin
  SemearEventoComEstado(ID_EVENTO, 4, saAtivo, EMPRESA_ID, seEnviando, 1);

  Evento := EventoDFe112150Etd.Create(
    ID_EVENTO, 4, CHAVE_VALIDA, EMPRESA_ID, saAtivo, Date + 1, 0, 0);
  try
    Mensagem := RejeitarAoExecutar(Evento);
  finally
    Evento.Free;
  end;

  Assert.IsTrue(Mensagem <> '');
  Assert.IsFalse(FEventosRepo.AtualizarChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
end;

procedure TTestSalvarEventoDFe112150UseCase.NaoDeveAlterarChaveAposNseqAlocado;
var
  Evento: EventoDFe112150Etd;
  Mensagem: string;
begin
  SemearEventoComEstado(ID_EVENTO, 4, saAtivo, EMPRESA_ID, sePendente, 2);

  Evento := EventoDFe112150Etd.Create(
    ID_EVENTO, 4, CHAVE_OUTRA, EMPRESA_ID, saAtivo, Date + 1, 0, 0);
  try
    Mensagem := RejeitarAoExecutar(Evento);
  finally
    Evento.Free;
  end;

  Assert.IsTrue(Mensagem <> '');
  Assert.IsFalse(FEventosRepo.AtualizarChamado);
  Assert.IsTrue(FTransactionState.RollbackCalled);
end;

procedure TTestSalvarEventoDFe112150UseCase.DevePermitirCorrigirChaveAntesDaAlocacao;
var
  Evento: EventoDFe112150Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  SemearEventoComEstado(ID_EVENTO, 4, saAtivo, EMPRESA_ID, sePendente, 0);

  Evento := EventoDFe112150Etd.Create(
    ID_EVENTO, 4, CHAVE_OUTRA, EMPRESA_ID, saAtivo, Date + 1, 0, 0);
  try
    Saida := FUseCase.Executar(Evento);
    try
      Assert.IsNotNull(Saida.OutputObj);
      Assert.AreEqual(CHAVE_OUTRA,
        EventoDFe112150Etd(Saida.OutputObj).ChaveDocumento);
      Assert.IsTrue(FEventosRepo.AtualizarChamado);
      Assert.IsTrue(FTransactionState.CommitCalled);
    finally
      Saida.Free;
    end;
  finally
    Evento.Free;
  end;
end;

procedure TTestSalvarEventoDFe112150UseCase.DevePermitirEventoQuandoOAnteriorEstaAutorizado;
var
  Autorizado: EventoDFeEtd;
  Rascunho: EventoDFe112150Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Autorizado := CriarHeader('EVENTO-AUTORIZADO', 1, saAtivo, EMPRESA_ID);
  try
    FEventosRepo.AdicionarEventoExistente(Autorizado, seAutorizado, 1);
  finally
    Autorizado.Free;
  end;

  Rascunho := CriarRascunho(2, Date, CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNotNull(Saida.OutputObj);
      Assert.AreEqual(1, FEventosRepo.InserirChamadas);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe112150UseCase.DevePermitirTiposDiferentesParaAMesmaChave;
var
  OutroTipo: EventoDFeEtd;
  Rascunho: EventoDFe112150Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  OutroTipo := CriarHeader('EVENTO-211130', 1, saAtivo, EMPRESA_ID,
    CHAVE_VALIDA, teImobilizacaoItem);
  try
    FEventosRepo.AdicionarEventoExistente(OutroTipo);
  finally
    OutroTipo.Free;
  end;

  Rascunho := CriarRascunho(2, Date, CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Rascunho);
    try
      Assert.IsNotNull(Saida.OutputObj);
      Assert.AreEqual(1, FEventosRepo.InserirChamadas);
    finally
      Saida.Free;
    end;
  finally
    Rascunho.Free;
  end;
end;

procedure TTestSalvarEventoDFe112150UseCase.DevePermitirEventosDeEmpresasDiferentes;
var
  OutraSession: ISessionContext;
  OutroRepo: TEventoDFe112150RepositoryStub;
  OutroUseCase: SalvarEventoDFe112150UseCase;
  Primeiro: EventoDFe112150Etd;
  Segundo: EventoDFe112150Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  Primeiro := CriarRascunho(1, Date, CHAVE_VALIDA);
  try
    Saida := FUseCase.Executar(Primeiro);
    try
      Assert.IsNotNull(Saida.OutputObj);
    finally
      Saida.Free;
    end;

    OutraSession := TSessionContextStub.Create(OUTRA_EMPRESA_ID);
    OutroRepo := TEventoDFe112150RepositoryStub.Create;
    OutroUseCase := SalvarEventoDFe112150UseCase.Create(
      FConnection, OutraSession, FEventosRepo, OutroRepo);
    try
      Segundo := CriarRascunho(2, Date, CHAVE_VALIDA);
      try
        Saida := OutroUseCase.Executar(Segundo);
        try
          Assert.IsNotNull(Saida.OutputObj);
          Assert.AreEqual(2, FEventosRepo.InserirChamadas);
        finally
          Saida.Free;
        end;
      finally
        Segundo.Free;
      end;
    finally
      OutroUseCase.Free;
      OutroRepo.Free;
      OutraSession := nil;
    end;
  finally
    Primeiro.Free;
  end;
end;

procedure TTestSalvarEventoDFe112150UseCase.DeveConfirmarEAliberarTransacaoAoAlterar;
var
  Evento: EventoDFe112150Etd;
  Saida: CreateEntityUseCaseOutPut;
begin
  SemearEvento(ID_EVENTO, 4, saAtivo, EMPRESA_ID);

  Evento := EventoDFe112150Etd.Create(
    ID_EVENTO, 4, CHAVE_OUTRA, EMPRESA_ID, saAtivo, Date + 1, 0, 0);
  try
    Saida := FUseCase.Executar(Evento);
    try
      Assert.IsNotNull(Saida.OutputObj);
      Assert.AreEqual(CHAVE_OUTRA, EventoDFe112150Etd(Saida.OutputObj).ChaveDocumento);
      Assert.IsTrue(EventoDFe112150Etd(Saida.OutputObj).Ativo = saAtivo);
      Assert.IsTrue(FEventosRepo.AtualizarChamado);
      Assert.IsTrue(FRepo112150.AtualizarChamado);
      Assert.AreEqual(ID_EVENTO, FEventosRepo.UltimoIdAtualizado);
      Assert.IsTrue(FTransactionState.CommitCalled);
      Assert.IsFalse(FTransactionState.RollbackCalled);
      Assert.IsTrue(FTransactionState.FreeTransactionCalled);
    finally
      Saida.Free;
    end;
  finally
    Evento.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestSalvarEventoDFe112150UseCase);

end.
